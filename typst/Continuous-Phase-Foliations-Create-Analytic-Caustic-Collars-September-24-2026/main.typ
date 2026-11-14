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

#align(center)[#text(size: 16pt, weight: "bold")[Continuous Phase Foliations Create Analytic Caustic Collars]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $Omega subset bb(R)^2$ be a bounded strictly convex open set whose boundary is a $C^oo$ simple closed regular
  curve with positive curvature. Orient the boundary counterclockwise,
  write its arclength coordinate as $s in bb(R) \/ L bb(Z)$,
  and let $delta in \( 0 \, pi \)$ be the angle of the outgoing velocity measured counterclockwise from the
  positive tangent. Reflection at a boundary point with outward unit normal $n$ sends an incoming velocity $v$ to
  $v - 2 \( v dot.op n \) n$. The resulting billiard map $T$ acts on

$ M = \( bb(R) \/ L bb(Z) \) times \( 0 \, pi \) \, $

and $delta arrow.b 0$ is the grazing end considered below. Write $bb(T) = bb(R) \/ 2 pi bb(Z)$ for the angular circle.

#thm([Theorem 1.1.])[
  (Phase-foliation rigidity).  #emph[Suppose a $T$-invariant open annulus $U subset
    M$ contains $\( bb(R) \/ L bb(Z) \) times \( 0 \, eta \)$ for some $eta > 0$. Suppose there is a homeomorphism
$ H : bb(S)^1 times \( 0 \, 1 \) arrow.r U $

 whose leaves are essential simple closed curves, each individually invariant under $T$.
   Then $Omega$ is an ellipse: there are $c in bb(R)^2$ and a real symmetric positive-definite matrix $Q$ such that
$ Omega = { x in bb(R)^2 : \( x - c \)^T Q \( x - c \) < 1 } . $

 Circles are included.]
] <thm:main>

For an elliptical table, the confocal elliptic caustics give such a grazing foliation
  #cite(label("Lazutkin1973")); for a circular table, the corresponding caustics are concentric circles.
  Only continuity of the leaves and of their transverse dependence is assumed.
  The foliation need not extend to the rest of the phase cylinder, and the width $eta$ may be arbitrarily small.
  The main issue is that a continuous essential phase curve need not initially be given as the tangent lines of a
  smooth convex caustic.

The complete companion article #emph[Rigidity of Smooth Billiards with a Continuous Caustic Collar]
  #cite(label("NB")) supplies three analytic inputs and the final physical-collar rigidity theorem.
  Its stationary-mesh and Fourier-row estimates apply to arbitrary normalized actions;
  its buffered division lemma is an analytic estimate. Their precise hypotheses are recalled at the points of use.
  Here we establish the additional dynamical and geometric steps needed to apply them to a merely continuous phase
  foliation. In particular, we construct the physical collar before invoking the companion’s ellipse theorem.

=== 1.1 Context and significance <context-and-significance>

The Birkhoff conjecture asks whether an integrable strictly convex planar billiard must be an ellipse.
  Birkhoff developed the convex billiard as a dynamical model #cite(label("Birkhoff1927"));
  Poritsky’s early printed formulation also studied compatible string constructions,
  under hypotheses stronger than a foliation alone #cite(label("Poritsky1950")).
  The distinction between a full foliation and a family with gaps is essential.
  Lazutkin’s theorem guarantees a Cantor family of near-boundary invariant curves for sufficiently smooth
  positively curved tables, rather than a full foliation #cite(label("Lazutkin1973")).
  Marvizi and Melrose constructed a grazing first integral modulo a flat error,
  not an exact invariant foliation #cite(label("MarviziMelrose1982")). Positive curvature is substantive:
  Mather excluded grazing caustics when boundary curvature vanishes #cite(label("Mather1982")).

Stronger or different integrability hypotheses give complementary rigidity results.
  Bialy proved that foliation of the entire phase cylinder by noncontractible invariant circles forces a circle
  #cite(label("Bialy1993")). Avila, De Simoi, and Kaloshin proved local rigidity near small-eccentricity ellipses
  #cite(label("ADK2016")), and Kaloshin and Sorrentino treated perturbations of ellipses of arbitrary eccentricity
  #cite(label("KS2018")). Bialy and Mironov allowed a continuous phase foliation under central symmetry when the
  foliated region reaches the invariant four-periodic curve #cite(label("BialyMironov2022")).
  Koval’s local strong result treats caustics at all rational rotations in an arbitrarily small interval above
  zero, under closeness to almost every ellipse and high-regularity bounds #cite(label("Koval2026")).
  These results impose geometric restrictions or require invariant curves extending beyond an arbitrarily thin
  grazing annulus.

Birkhoff’s invariant-curve theorem for twist maps explains why graphs are the natural intermediate objects
  #cite(label("Arnaud2009")). Here the initial leaves are only continuous essential curves,
  and the entire annulus is foliated. We therefore prove graphness directly from both billiard twist signs and
  finite-area recurrence. The full collar then supplies a wholly periodic graph at every sufficiently small
  rational rotation. The stationary actions of those graphs yield high-frequency equations for the boundary.
  First-order Fourier obstructions for rational caustics in perturbations of the circle were developed by
  #cite(label("RamirezRos2006"), form: "prose"); quantitative constraints near ellipses appear in
  #cite(label("ADK2016"), form: "prose"). The analytic inversion here uses the companion’s arbitrary-input
  estimates without a perturbative assumption.

Together with the physical-collar rigidity theorem of #cite(label("NB")),
  Theorem 1 resolves the near-boundary Birkhoff conjecture positively in the continuous phase-foliation
  formulation above. The additional point established here is the passage from merely continuous invariant phase
  leaves to the smooth physical caustic hypothesis. This passage requires neither a symmetry assumption nor
  closeness to a circle or ellipse.

=== 1.2 The regularity reduction <the-regularity-reduction>

A #emph[smooth convex caustic] is a $C^oo$ simple closed regular curve in $Omega$, bounding a strictly convex set,
  such that a billiard segment tangent to it remains tangent after reflection at either endpoint.
  A #emph[continuous physical caustic collar] is a relatively open set $A subset overline(Omega)$,
  containing $partial Omega$, together with a homeomorphism

$ H_0 : bb(S)^1 times \[ 0 \, 1 \) arrow.r A $

whose zero leaf is $partial Omega$ and whose positive leaves are smooth convex caustics.
  This is the hypothesis of the following companion theorem.

#thm([Theorem 1.2.])[
  (Physical-collar rigidity, #cite(label("NB")) Definition 1.1 and Theorem 1.2).  #emph[A bounded strictly convex
    planar domain with $C^oo$ regular boundary of positive curvature and a continuous physical caustic collar is
    an ellipse.]
] <thm:nb-rigidity>

The core reduction proved below is stronger than the smoothness needed for this application.

#thm([Theorem 1.3.])[
  (Regularity of a phase-foliated collar).  #emph[Under the hypotheses of Theorem 1,
    the boundary is real analytic. There are $lambda_0 > 0$ and a jointly real-analytic map
$ Gamma : bb(T) times \[ 0 \, lambda_0 \] arrow.r bb(R)^2 $

 such that $Gamma \( dot.op \, 0 \)$ parametrizes $partial Omega$,
   every curve $Gamma \( dot.op \, lambda \)$ for $0 < lambda lt.eq
   lambda_0$ is a regular strictly convex caustic, and the restriction to $bb(T)
   times \[ 0 \, lambda_0 \)$ is a homeomorphism onto a relatively open collar of $partial
   Omega$ in $overline(Omega)$. Here real analyticity at the parameter endpoints means extension to a neighborhood.]
] <thm:collar-regularity>

Theorem 3 uses the mesh and Fourier estimates from #cite(label("NB")).
  Its conclusion is proved directly from the phase foliation,
  without assuming the physical collar that appears in Theorem 2.

=== 1.3 Structure of the argument <structure-of-the-argument>

The first step is topological and dynamical. In oriented-line coordinates the billiard has two strict twist
  inequalities. They impose one-way barriers on the lifted argument of successive angular separations.
  On an interval of equal rotation numbers, area recurrence can be applied on a suitable finite-measure part of
  the simultaneous cover of the product annulus. The resulting contradiction excludes vertical pairs.
  A separate rational-passage argument gives graph leaves densely without first assuming monotonicity of the
  rotation number. Limits then give graphs everywhere. Area recurrence also rules out rational plateaus,
  making each sufficiently small rational graph unique and wholly periodic.
  This graph argument is useful independently of the analytic estimates that follow.

The second step obtains boundary analyticity from stationary polygonal chains.
  Because the initial line lies on an invariant graph, a chain whose angle returns must also return its momentum.
  Its stationary action is therefore constant in the initial point.
  The associated high-frequency equations have derivative equal to the high-mode projection plus a small operator.
  A Newton construction on decreasing complex strips produces an analytic solution,
  and a real contraction identifies it with the original smooth boundary data.

The third step is a joint analytic construction in the angular and rotation variables.
  At rational resonances it uses both residual values and first parameter jets.
  The first jets control the coefficients left undetermined by one Fourier division,
  allowing a second division and a quadratic Newton step. The polynomial loss exponent is fixed before the order
  of formal initialization. These mechanisms come from the analytic machinery of #cite(label("NB"));
  we give the argument with its weaker geometric input explicit.

Finally, the invariant line graphs define analytic support functions with positive curvature radius.
  Their support decreases strictly to first order in the squared translation parameter,
  so their envelopes are nested convex caustics filling a physical collar.
  Figure 1 illustrates this final passage from an analytic line graph to its support envelope.
  This proves Theorem 3 and makes Theorem 2 applicable.

Section 2 proves the graph and rational-periodicity statements.
  Section 3 establishes analytic boundary regularity. Section 4 constructs the joint parametrization,
  and Section 5 proves the physical collar and concludes the rigidity argument.

===== 1.3.1 Conventions. <conventions.>

All angular coordinates are real lifts of $2 pi$-periodic variables.
  Translation numbers are measured in radians; the corresponding rotation number is the translation number divided
  by $2 pi$. Constants may increase between estimates, with their dependence and order of choice specified when
  necessary. A periodic holomorphic function is #emph[real symmetric] if $f \( macron(z) \) =
  overline(f \( z \))$; the same convention applies in two variables.

== 2 From continuous leaves to periodic invariant graphs <sec:geometry>

We first extract the phase-space information needed by the analytic argument.
  This step uses the continuity of the foliation, both twist inequalities, and finite invariant area.
  It does not assume that a leaf is a graph or that it comes from a smooth caustic.
  Birkhoff’s invariant-curve graph theorem is classical for exact symplectic twist maps
  #cite(label("Arnaud2009")); the direct argument here also records the rational periodicity required by the
  subsequent stationary-action construction.

=== 2.1 Oriented lines and the two twists <oriented-lines-and-the-two-twists>

Translate the origin into $Omega$. Write

$ n_theta = \( cos theta \, sin theta \) \, wide e_theta = \( - sin theta \, cos theta \) \, wide h \( theta \) =
  max_(z in overline(Omega)) z dot.op n_theta . $

The normal-angle parametrization of the boundary is smooth:
  strict convexity makes its normal map bijective, and positive curvature makes its derivative nonzero. Consequently

#[#set math.equation(numbering: n => "(2.1)")
 $ h > 0 \, wide r = h + h'' > 0 \,\
gamma \( theta \) = h \( theta \) n_theta + h' \( theta \) e_theta \, wide gamma' \( theta \) =
  r \( theta \) e_theta . $ <geo:support>]

Represent a billiard state by its outgoing oriented line, with velocity $e_theta$ and equation $z dot.op n_theta =
  p$. The starting point is the backward intersection of that line with the boundary.
  Both intersections are transverse and uniquely determined, so this is a smooth change of coordinates onto

$ cal(B) = { \( theta \, p \) : theta in bb(T) \, med - h \( theta + pi \) < p < h \( theta \) } . $

We continue to denote the conjugated billiard map by $T$ and the given annulus by $U$.

Choose the lift $tilde(T)$ for which the angular advance lies in $\( 0 \, 2 pi \)$.
  If $gamma \( psi \)$ is the forward collision point, reflection gives

#[#set math.equation(numbering: n => "(2.2)")
 $ theta' = theta + 2 a \, wide psi = theta + a \, wide 0 < a < pi \,\
p = h \( psi \) cos a - h' \( psi \) sin a \, wide p' = h \( psi \) cos a + h' \( psi \) sin a . $ <geo:reflection>]

Indeed $e_theta dot.op n_psi = sin a > 0$, and reflection changes $e_theta$ to $e_(theta + 2 a)$.
  At fixed $theta$, differentiation of $p$ with respect to $a$ gives $- r \( theta + a \) sin a < 0$.
  At fixed $theta'$, write $psi = theta' - a$; differentiation of $p'$ again gives $-
  r \( theta' - a \) sin a < 0$. Writing $theta_(- 1)$ for the preceding lifted angle, we obtain

#[#set math.equation(numbering: n => "(2.3)")
 $ frac(partial theta', partial p) < 0 \, wide frac(partial theta_(- 1), partial p) > 0 . $ <geo:twists>]

Both derivatives hold the current lifted angle fixed. Thus increasing momentum decreases the next angle and
  increases the preceding angle.

The generating function in these line coordinates #cite(label("BialyMironov2017"))

#[#set math.equation(numbering: n => "(2.4)")
 $ cal(S) \( theta \, theta' \) = 2 h #h(-0.16667em) (frac(theta + theta', 2)) sin #h(-0.16667em)
   (frac(theta' - theta, 2)) $ <geo:generating>]

satisfies $p = - cal(S)_1 \( theta \, theta' \)$ and $p' = cal(S)_2 \( theta \, theta' \)$.
  Hence $T$ preserves $#h(-0.16667em) upright(d) p and #h(-0.16667em) upright(d) theta$.
  The associated positive area measure on $cal(B)$ is finite and has full support.

The hypothesis supplies a uniform upper strip in these coordinates.
  In fact, if the outgoing angle at the starting point is $delta$, then the starting normal angle is $theta - delta$ and

#[#set math.equation(numbering: n => "(2.5)")
 $ p = h \( theta - delta \) cos delta + h' \( theta - delta \) sin delta \,\
frac(partial p, partial delta) = - r \( theta - delta \) sin delta < 0 . $ <geo:starting-momentum>]

Compactness and the inclusion of all sufficiently small positive $delta$ imply that, for some $epsilon_g > 0$,

#[#set math.equation(numbering: n => "(2.6)")
 $ { \( theta \, p \) : h \( theta \) - epsilon_g < p < h \( theta \) } subset U . $ <geo:uniform-collar>]

=== 2.2 A separation barrier for continuous leaves <a-separation-barrier-for-continuous-leaves>

We record the elementary circle-dynamics facts that will also fix our rotation convention.
  If an increasing homeomorphism $G : bb(R) arrow.r bb(R)$ commutes with translation by $2 pi$,
  its translation number satisfies

#[#set math.equation(numbering: n => "(2.7)")
 $ tau \( G \) = lim_(j arrow.r oo) frac(G^j \( alpha \) - alpha, j) \, wide \| G^j \( alpha \) - alpha -
   j tau \( G \) \| lt.eq 2 pi quad \( j in bb(Z) \) . $ <geo:translation-bound>]

For completeness, the displacements of each iterate oscillate by at most $2 pi$, by monotonicity.
  Their maxima are subadditive in the iteration index, and their minima are superadditive.
  Dividing by that index and using repeated blocks of each fixed length gives a common limit bracketed by the
  minimum and maximum divided by the index. Their oscillation bound then proves (2.7).
  The negative-index case follows by starting a positive iterate at $G^j \( alpha \)$.
  The same estimate, applied to a fixed large iterate, proves continuity of $tau$ under locally uniform
  convergence of lifts. Also $tau \( G^q \) = q tau \( G \)$.

One further consequence will be useful. For integers $q gt.eq 1$ and $l$,

#[#set math.equation(numbering: n => "(2.8)")
 $ tau \( G \) > 2 pi l \/ q & med arrow.r.double med G^q \( alpha \) > alpha + 2 pi l quad
   upright("for every ") alpha \,\
tau \( G \) < 2 pi l \/ q & med arrow.r.double med G^q \( alpha \) < alpha + 2 pi l quad
  upright("for every ") alpha . $ <geo:translation-sign>]

A zero of the displacement difference would give a periodic orbit and force translation number $2 pi l \/ q$.
  In the absence of a zero, that continuous periodic difference has a constant strict sign.
  A uniformly negative difference forces $q tau \( G \) - 2 pi l < 0$ by iteration,
  and a uniformly positive one forces the reverse inequality. This proves (2.8).

Use $b in \( 0 \, 1 \)$ for the transverse parameter in the given homeomorphism.
  A constant-small-$delta$ circle lies in $U$ and has winding one in the phase cylinder.
  It is non-null in $U$ and, as an embedded essential circle of the annulus,
  represents a primitive generator of $H_1 \( U \; bb(Z) \)$.
  Each product leaf represents that generator up to a common orientation choice.
  The normal map of the positively curved boundary has degree one,
  so the leaf’s starting normal angle also has degree one. The line angle is the starting normal angle plus the
  globally defined real angle $delta in \( 0 \, pi \)$, so it has the same degree.
  Lift the foliation to continuous parametrizations

#[#set math.equation(numbering: n => "(2.9)")
 $ Z_b \( alpha \) = \( theta_b \( alpha \) \, p_b \( alpha \) \) \, wide Z_b \( alpha + 2 pi \) =
   Z_b \( alpha \) + \( 2 pi \, 0 \) . $ <geo:leaf-lifts>]

Each $Z_b$ parametrizes the full inverse image of its leaf injectively.
  Individual invariance therefore defines a homeomorphism $G_b$ of $bb(R)$ by

$ tilde(T) Z_b = Z_b compose G_b . $

The deck relations for $Z_b$ and $tilde(T)$ give $G_b \( alpha + 2 pi \) = G_b \( alpha \) + 2 pi$.
  A decreasing homeomorphism cannot satisfy this relation, so $G_b$ is increasing.
  The inverses of the lifted foliation charts are continuous, so $G_b$ depends continuously on $b$.
  Set $tau \( b \) = tau \( G_b \)$. It is continuous by (2.7); because $theta_b \( alpha \) - alpha$ is bounded,
  it is also the limiting angular advance per iterate.

Fix two leaves. For distinct leaves use pairs $\( alpha \, beta \) in bb(R)^2$;
  for a single leaf use the connected strip $alpha < beta lt.eq alpha + 2 pi$. Define

#[#set math.equation(numbering: n => "(2.10)")
 $ x_j = theta_(b_2) \( G_(b_2)^j \( beta \) \) - theta_(b_1) \( G_(b_1)^j \( alpha \) \) . $ <geo:separation>]

If $x_j = 0$, the two momenta are distinct, by simplicity and disjointness of leaves.
  The period-separated pair in the single-leaf strip has $x_j = 2 pi$, so is not an exception.
  The two inequalities in (2.3) give

#[#set math.equation(numbering: n => "(2.11)")
 $ x_j = 0 quad arrow.r.double quad x_(j - 1) x_(j + 1) < 0 . $ <geo:opposite-signs>]

In particular the vector $\( x_j \, x_(j + 1) \)$ never vanishes.

#thm([Lemma 2.1.])[
  (Separation barrier).  #emph[For each fixed pair of leaves there is a continuous real argument
    $A \( alpha \, beta \)$ of $\( x_0 \, x_1 \)$, periodic under simultaneous translation of $alpha \,
    beta$ by $2 pi$. With $A_j = A \( G_(b_1)^j \( alpha \) \, G_(b_2)^j \( beta \) \)$, it satisfies
#[#set math.equation(numbering: n => "(2.12)")
 $ - frac(3 pi, 2) < A_(j + 1) - A_j < pi / 2 \, $ <geo:argument-step>]

 and, for every integer $m$,
#[#set math.equation(numbering: n => "(2.13)")
 $ A_j lt.eq a_m := pi / 2 + pi m quad arrow.r.double quad A_(j + 1) < a_m . $ <geo:barrier-rule>]

 If $x_i$ and $x_k$ have opposite strict signs for some $i < k$,
   then $A_j$ cannot return arbitrarily close to $A_i$ as $j arrow.r + oo$.]
] <geo:barrier>

#proof[
  The pair plane and pair strip are simply connected, so the nonvanishing vector has a continuous real argument.
    For a single leaf normalize it to $pi \/ 4$ on $beta = alpha + 2 pi$.
    For distinct leaves, both entries equal $beta - alpha + O \( 1 \)$, uniformly in the pair variables,
    so normalize the argument to $\( 0 \, pi \/ 2 \)$ on the connected region where $beta -
    alpha$ is sufficiently large. Either normalization implies simultaneous periodicity:
    the difference after a simultaneous translation is a continuous integer multiple of $2
    pi$ and vanishes in the normalizing region.
  Consecutive vectors have the form $\( u \, v \) \, \( v \, w \)$.
    A positive quarter-turn relation $\( v \, w \) = c \( - v \, u \)$, $c > 0$, would force $v = 0$ and $u \,
    w$ to have the same sign, contrary to (2.11). Thus $A_1 - A_0$ avoids $pi \/ 2$ modulo $2 pi$.
    Connectedness, together with the edge normalization or the large-separation normalization,
    puts it in $\( - 3 pi \/ 2 \, pi \/ 2 \)$. Applying this to the iterated pair proves (2.12).
  If $A_j lt.eq a_m lt.eq A_(j + 1)$, that bound gives
  $ a_m - pi \/ 2 < A_j lt.eq a_m lt.eq A_(j + 1) < a_m + pi \/ 2 . $
  On these two intervals $sin A_j$ is nonzero with sign $\( - 1 \)^m$,
    whereas $cos A_(j + 1)$ is either zero or has the opposite sign. This is impossible:
    both have the sign, and the same zero condition, of $x_(j + 1)$. This proves (2.13).
  Finally, if $x_i eq.not 0$, then $A_i$ lies strictly between two consecutive barriers.
    All subsequent arguments stay below the upper one. If $x_k$ has the opposite sign,
    $A_k$ cannot remain in the interval between those barriers, so lies strictly below its lower endpoint.
    All later arguments remain below that endpoint, a positive distance from $A_i$. ◻
]

=== 2.3 Graphs, recurrence, and rational rotation <graphs-recurrence-and-rational-rotation>

#thm([Proposition 2.2.])[
  #emph[Every leaf in $U$ is a graph $p = g_b \( theta \)$.
    After reversing $b$ if necessary, $g_b$ is strictly decreasing in $b$,
    jointly continuous in $\( theta \, b \)$, and converges uniformly to $h$ as $b arrow.b 0$. The induced angular lifts
$ F_b = theta_b compose G_b compose theta_b^(- 1) $

 are strictly ordered with $b$ and have positive translation numbers tending to zero at that end.
   Every sufficiently small positive rational $l \/ q$ occurs on exactly one leaf, and on that entire leaf
#[#set math.equation(numbering: n => "(2.14)")
 $ F_b^q \( theta \) = theta + 2 pi l . $ <geo:rational-periodicity>]

 Here rotation number means translation number divided by $2 pi$.]
] <prop:graph-collar>

#proof[
  #emph[Periodic leaves are graphs.] Suppose first that $G_b^q = upright("id") + 2 pi l$ on a whole leaf.
    For its pair strip, simultaneous periodicity gives $A_q = A_0$.
    If $x_0 = 0$, then $A_0$ is a barrier, and (2.13) makes $A_q < A_0$, a contradiction.
    Thus $x_0$ never vanishes on the connected strip. It equals $2 pi$ on its upper edge,
    so is everywhere positive. This says precisely that $theta_b$ is strictly increasing.
  #emph[Constant-translation intervals also consist of graphs.] Let $b$ be interior to an interval on which $tau$
    is constant. If $theta_b$ were not strictly increasing, its degree-one property and continuity would give an
    ordered same-leaf pair with $x_0 = 0$. By (2.11), $x_(- 1)$ and $x_1$ have opposite strict signs.
    Start instead with that preceding pair and perturb it slightly.
    We obtain a nonempty open set $O$ of pairs on distinct leaves for which $x_0 x_2 < 0$.
    We can take the two leaf parameters in disjoint relatively compact intervals $I_1 \,
    I_2$ inside the constant-translation interval, and take $\| beta - alpha \|$ bounded on $O$.
  Consider the cover of $H \( bb(T) times I_1 \) times H \( bb(T) times I_2 \)$ obtained from
    $\( bb(R) times I_1 \) times \( bb(R) times I_2 \)$ by identifying only
  $ \( alpha \, b_1 \, beta \, b_2 \) tilde.op \( alpha + 2 pi \, b_1 \, beta + 2 pi \, b_2 \) . $
  The pair dynamics $K$ induced by $\( G_(b_1) \, G_(b_2) \)$ preserves the measure lifted from product billiard
    area. This measure is defined by integrating counting measure on the covering fibers against product area;
    $K$ bijects the fibers over the area-preserving base dynamics.
    It has full support, and any region of bounded $\| beta - alpha \|$ has finite measure,
    since it meets uniformly finitely many sheets over each base point.
    This construction requires no differentiability or absolute continuity of $H$.
  Equality of the two translation numbers and (2.7) imply, for every $j in bb(Z)$,
  #[#set math.equation(numbering: n => "(2.15)")
   $ lr(|\( G_(b_2)^j \( beta \) - G_(b_1)^j \( alpha \) \) - \( beta - alpha \)|) lt.eq 4 pi . $ <geo:relative-bound>]
  Consequently the saturation $union.big_(j in bb(Z)) K^j \( O \)$ is an invariant finite-measure set.
    Poincaré recurrence gives recurrent points in $O$, indeed almost every point there is recurrent.
    One may obtain recurrence to a point from the usual measurable-set version by using a countable neighborhood
    base; the latter version follows because the forward images of a set of nonreturners are disjoint in finite measure.
  For any such recurrent pair, the two leaf parameters remain fixed.
    Thus continuity of the argument for this fixed pair of leaves and simultaneous periodicity give $A_(j_k)
    arrow.r A_0$ along a sequence $j_k arrow.r oo$. This contradicts Lemma 4, because $x_0 x_2 < 0$.
    Hence $theta_b$ is strictly increasing throughout every constant-translation interval.
  #emph[Graph leaves are dense, and then every leaf is a graph.] Take any open parameter interval $J$.
    If it contains a subinterval where $tau$ is constant, the preceding argument supplies graph leaves.
    Otherwise choose a rational multiple $r_(*) = 2 pi l \/ q$ strictly between two values of the continuous
    function $tau$ on $J$. Travel along the parameter segment from the smaller value to the larger one,
    and let $c$ be the first position approached by values $tau > r_(*)$. Continuity gives $tau \( c \) = r_(*)$.
    Values strictly below $r_(*)$ also approach $c$: otherwise $tau =
    r_(*)$ on an interval immediately before $c$, contrary to our case assumption.
    Taking limits in (2.8) from these two strict sides gives $G_c^q = upright("id") + 2 pi l$.
    The periodic-leaf argument therefore supplies a graph in $J$. Notice that no monotonicity of $tau$ has been used.
  Graph parameters are thus dense. Continuity of the lifted foliation makes every $theta_b$ nondecreasing.
    If a same-leaf ordered pair had $x_0 = 0$, its preceding and following pairs would still be ordered,
    because $G_b$ is increasing. Nondecrease would give $x_(- 1) \, x_1 gt.eq 0$, contradicting (2.11).
    Every $theta_b$ is therefore strictly increasing, proving the graph property.
  #emph[Ordering and the grazing end.] Inverting the increasing angular parametrizations shows that $g_b$ is
    jointly continuous. Distinct graphs are disjoint, so their order cannot change with $theta$.
    For each fixed angle, the continuous injective function $b mapsto g_b \( theta \)$ is strictly monotone,
    in the same direction at every angle. Reverse $b$ to make this direction decreasing.
    The upper-strip inclusion (2.6) then forces $g_b \( theta \) arrow.r
    h \( theta \)$ as $b arrow.b 0$ at every angle. Monotonicity and compactness upgrade this to uniform
    convergence. Formula (2.2) now shows that $F_b \( theta \) -
    theta$ is positive and tends uniformly to zero at that end.
    Its positive minimum on each fixed graph gives $tau \( b \) > 0$, and $tau \( b \) arrow.r 0$ follows.
  The forward twist and decreasing graph order give $F_(b_1) < F_(b_2)$ when $b_1 < b_2$.
    Since the maps are increasing, all their positive iterates have the same strict order.
    Passing to translation numbers shows that $tau \( b \)$ is nondecreasing.
  #emph[Rational plateaus are impossible.] If $tau \( b \) = 2 pi l \/ q$ on an open parameter interval $I$,
    almost every point in its finite-area invariant annulus is recurrent for $T^q$.
    On each leaf, $F_b^q - 2 pi l$ has zero translation number and hence has fixed points:
    without a fixed point its periodic displacement would have a uniform strict sign.
    Every nonfixed point moves monotonically in a component of the complement of the fixed set towards an
    endpoint, so is not recurrent on the circle. Thus $T^q$ is the identity almost everywhere in this annulus,
    and therefore everywhere, by continuity and full support of area.
    Its lift on each graph is necessarily $F_b^q = upright("id") + 2 pi l$,
    with the integer shift determined by the translation number.
    This contradicts strict ordering of the iterates on two distinct graphs.
  The continuity, monotonicity, positivity, and zero limiting value of $tau$ now show that every sufficiently
    small positive rational $l \/ q$ occurs. Its parameter is unique,
    since two parameters with that value would give a plateau.
    Values on either side are strictly below and above $2 pi l \/ q$;
    taking limits in (2.8) proves (2.14) on the entire graph. ◻
]

=== 2.4 Closing stationary chains <closing-stationary-chains>

Proposition 5 supplies the phase conclusion used in #cite(label("NB")) Lemma 2.2.
  We isolate an immediate variational consequence because it will be used twice:
  a fixed-endpoint stationary chain closes in momentum as well as in angle.
  This rational-graph/action connection is related to the periodic-graph regularity studied by
  #cite(label("FierobeSorrentino2026"), form: "prose") Appendix, Proposition A.1;
  our argument starts with the full continuous foliation and proves the graph and closure properties before any
  analytic regularity is known.

#thm([Lemma 2.3.])[
  #emph[There is $kappa > 0$ with the following property. Let $q gt.eq 1$ and $l$ be integers, and let $theta_0 \,
    dots.h \, theta_q$ be a real chain such that
$ 0 < theta_(j + 1) - theta_j < kappa \, wide theta_q = theta_0 + 2 pi l \, $

 and suppose it is stationary at all interior nodes:
#[#set math.equation(numbering: n => "(2.16)")
 $ cal(S)_2 \( theta_(j - 1) \, theta_j \) + cal(S)_1 \( theta_j \, theta_(j + 1) \) = 0 \, wide 1 lt.eq
   j < q . $ <geo:interior-stationarity>]

 Define the momenta, including the final one, by
#[#set math.equation(numbering: n => "(2.17)")
 $ p_j = - cal(S)_1 \( theta_j \, theta_(j + 1) \) quad \( 0 lt.eq j < q \) \, wide p_q =
   cal(S)_2 \( theta_(q - 1) \, theta_q \) . $ <geo:chain-momenta>]

 Then $tilde(T) \( theta_j \, p_j \) = \( theta_(j + 1) \, p_(j + 1) \)$ for every $0 lt.eq j < q$, and $p_q =
   p_0$. The chain therefore extends to a periodic orbit of rotation $l \/ q$,
   on the unique graph with that rotation. The action $sum_(j = 0)^(q - 1)
   cal(S) \( theta_j \, theta_(j + 1) \)$ is constant along any $C^1$ family of such chains with fixed $q \, l$.]
] <lem:stationary-closure>

#proof[
  Choose $kappa < 2 pi$ small enough that (2.2) and (2.6) place every line with angular step in $\( 0 \, kappa \)$
    in $U$. Decrease it further so that Proposition 5 applies to every positive rational smaller than
    $kappa \/ \( 2 pi \)$. The generating relation and (2.16) give every stated transition;
    for the last transition use precisely the definition of $p_q$ in (2.17). No endpoint stationarity has been assumed.
  The initial state belongs to an individually invariant graph in $U$,
    so every state of the chain belongs to that same graph. The equality $theta_q = theta_0 +
    2 pi l$ therefore forces $p_q = p_0$. Repeating the orbit now shows that its translation number is $2 pi l \/
    q$. Since $0 < l \/ q < kappa \/ \( 2 pi \)$, uniqueness of the rational graph applies.
    In particular, all chains with the same $q \, l$ lie on the same graph, regardless of their starting angles.
  Finally, differentiating the action along a $C^1$ family cancels all interior terms by (2.16).
    The remaining terms are $- p_0 dot(theta)_0 + p_q dot(theta)_q = 0$,
    because the endpoint advance is fixed and the momenta agree. ◻
]

== 3 Analyticity of the boundary <sec:analytic>

The phase graphs give exact equations for the boundary, one at each sufficiently high Fourier frequency.
  The decisive analytic fact is that the derivative of these equations is close to the identity on the high modes.
  We state the two estimates imported from #cite(label("NB")) Lemma 2.3 and Proposition 2.4,
  then prove the regularity conclusion from our phase hypothesis.
  The grazing coordinate follows the normalization introduced by #cite(label("Lazutkin1973"), form: "prose");
  asymptotic grazing actions and rational Fourier tests also appear, in different settings,
  in #cite(label("MarviziMelrose1982"), form: "prose"), #cite(label("RamirezRos2006"), form: "prose"),
  and #cite(label("ADK2016"), form: "prose").

#thm([Theorem 3.1.])[
  #emph[Under the hypotheses of Theorem 1, the support function $h$ and the boundary of the table are real analytic.]
] <thm:analytic-boundary>

=== 3.1 Normalization and the two analytic inputs <normalization-and-the-two-analytic-inputs>

Choose $k > 0$ so that $#h(-0.16667em) upright(d) x \/ #h(-0.16667em) upright(d) theta =
  k r \( theta \)^(1 \/ 3)$ defines a coordinate of period $2 pi$. With $theta = phi.alt \( x \)$, put

#[#set math.equation(numbering: n => "(3.1)")
 $ u = log phi.alt' \, wide c_(*) = k^(- 3) \, wide r \( phi.alt \( x \) \) =
   c_(*) e^(- 3 u \( x \)) . $ <ana:normalization>]

The normalized action is

$ D_u \( X \, Y \) = c_(*)^(- 1) {cal(S) \( phi.alt \( X \) \, phi.alt \( Y \) \) -
  integral_(phi.alt \( X \))^(phi.alt \( Y \)) h \( eta \) thin #h(-0.16667em) upright(d) eta} . $

The endpoint integral telescopes along a chain, so the Euler equations are unchanged by its subtraction and the
  increasing coordinate change. Writing $phi.alt \( mu \) = \( phi.alt \( X \) + phi.alt \( Y \) \) \/ 2$,
  integration by parts gives

#[#set math.equation(numbering: n => "(3.2)")
 $ D_u \( X \, Y \) =  & - integral_X^mu #scale(x: 120%, y: 120%)[\(] 1 -
   cos \( phi.alt \( z \) - phi.alt \( X \) \) #scale(x: 120%, y: 120%)[\)] e^(- 2 u \( z \)) thin #h(-0.16667em)
   upright(d) z\
 & - integral_mu^Y #scale(x: 120%, y: 120%)[\(] 1 - cos \( phi.alt \( Y \) - phi.alt \( z \) \)
   #scale(x: 120%, y: 120%)[\)] e^(- 2 u \( z \)) thin #h(-0.16667em) upright(d) z . $ <eq:normalized-action>]

Indeed, before the coordinate change, the sum of the two integrals with integrands
  $r \( eta \) \( 1 - cos \( eta - theta \) \)$ and $r \( eta \) \( 1 - cos \( theta' - eta \) \)$ is
  $integral_theta^(theta') h - cal(S) \( theta \, theta' \)$; the terms containing $h'$ at the midpoint cancel.
  Now use $r \( phi.alt \( z \) \) phi.alt' \( z \) \/ c_(*) = e^(- 2 u \( z \))$.

For an arbitrary smooth real periodic function $f$, define $D_f$ by (3.2),
  replacing $u$ by $f$ and taking any primitive $phi.alt_f$ of $e^f$.
  No condition is imposed on $integral_0^(2 pi) e^f$. Translating both endpoints by $2
  pi$ adds the same constant to every primitive value, so $D_f$ is diagonally periodic.
  The midpoint is well defined for small steps because $phi.alt'_f > 0$ on the real axis.
  The same formula defines the holomorphic action locally near the diagonal for holomorphic real-symmetric inputs.
  This arbitrary-input formulation is essential: the trial functions below need not themselves represent billiard
  tables.

The normalization fixes the leading action independently of the input:

#[#set math.equation(numbering: n => "(3.3)")
 $ D_f \( x \, x + b \) = - b^3 / 24 + O \( b^5 \) . $ <ana:universal-cubic>]

Indeed, the midpoint is $x + b \/ 2 + O \( b^2 \)$, and $phi.alt'_f ""^2 e^(- 2 f) = 1$,
  so each half-integral has leading value $b^3 \/ 48$. Reversing the endpoints gives $D_f \( Y \, X \) = -
  D_f \( X \, Y \)$. If $a_3 \( x \) \, a_4 \( x \)$ are its cubic and quartic coefficients,
  this identity gives $2 a_4 = a'_3$; hence the quartic coefficient vanishes.
  This common cubic term explains the uniform mesh used as the reference in the next proposition.
  The Fourier-row estimate below separately controls variation with the input.

For $0 < sigma lt.eq 1$, let $cal(A)_sigma = { z in bb(C) : \| "Im" z \| < sigma }$ and set

$ parallel f parallel_(j \, sigma) = max_(0 lt.eq i lt.eq j) sup_(cal(A)_sigma) \| f^(\( i \)) \| . $

Inputs on positive strips are periodic, holomorphic, and real symmetric; at $sigma =
  0$ they are smooth real periodic functions and the norm is the corresponding real $C^j$ norm.

#thm([Proposition 3.2.])[
  (Stationary meshes, #cite(label("NB")) Lemma 2.3).  #emph[Fix an integer $m gt.eq 2$ and a finite bound $M$,
    and put $p = m + 2$, $r_0 = m + 15$. There are $R \, K \, N$, depending only on $m \, M$,
    with the following properties. For $0 lt.eq sigma lt.eq 1$, $parallel f parallel_(r_0 \, sigma) lt.eq M$,
    and $q gt.eq N$, the action $D_f$ has an interior-stationary mesh with endpoints $X_0 = x$, $X_q = x + 2 pi$,
    of the form
$ X_j \( x \) = x + 2 pi j \/ q + w_j \( x \) \, wide w_0 = w_q = 0 . $

 On the strip of width $sigma' = \( 1 - K \/ q^2 \) sigma$,
#[#set math.equation(numbering: n => "(3.4)")
 $ q^2 max_j parallel w_j parallel_(p \, sigma') + q^3 max_j parallel w_(j + 1) - w_j parallel_(p \, sigma') lt.eq
   R . $ <ana:mesh-bounds>]

 The mesh is real symmetric and differentiable in smooth real input variations;
   its derivative in the norm on the left of (3.4) is bounded by $C parallel dot(f) parallel_(r_0 \, sigma)$.
   The corresponding difference bound holds for two inputs. On the real axis the mesh is pointwise unique in the
   ball with these scaled position and step bounds. Any fixed enlargement of that real uniqueness ball is allowed
   after increasing $N$.]
] <prop:mesh-input>

Define the critical action and its selected Fourier coefficients by

#[#set math.equation(numbering: n => "(3.5)")
 $ W_q \( x \; f \) & = sum_(j = 0)^(q - 1) D_f \( X_j \( x \) \, X_(j + 1) \( x \) \) \,\
C_n \( f \) & = - frac(q^2, 6 pi) \[ W_q \( dot.op \; f \) \]_n \, wide n = plus.minus q \,\
""_n & = frac(1, 2 pi) integral_0^(2 pi) v \( x \) e^(- upright(i) n x) thin #h(-0.16667em) upright(d) x .
  $ <ana:constraints>]

Thus $W_q$ records how the stationary-chain action depends on its initial point, and $C_q \,
  C_(- q)$ select its $q$-th Fourier harmonics. Periodicity of the displacements and critical action follows from
  real mesh uniqueness. The same uniqueness identifies these definitions on common real inputs when different
  strip widths or different fixed smoothness bounds are used, for all sufficiently large rows.
  In comparing two constructions, one enlarges the real uniqueness ball to contain both meshes.
  Thus this compatibility is independent of a chosen holomorphic extension.

#thm([Proposition 3.3.])[
  (Fourier rows, #cite(label("NB")) Proposition 2.4).  #emph[For fixed $m gt.eq 2$, $M < oo$, and $r_0 = m + 15$,
    there are $K \, N$, independent of $0 lt.eq sigma lt.eq 1$,
    such that for $parallel f parallel_(r_0 \, sigma) lt.eq M$ and $\| n \| gt.eq N$,
#[#set math.equation(numbering: n => "(3.6)")
 $ \( #h(-0.16667em) upright(d) C_n \)_f \( v \) = \[ b_n \( f \) v \]_n \, $ <ana:row-derivative>]

 where
#[#set math.equation(numbering: n => "(3.7)")
 $ parallel b_n \( f \) - 1 parallel_(m \, \( 1 - K \/ n^2 \) sigma) & lt.eq K \/ \| n \| \,\
parallel b_n \( f \) - b_n \( hat(f) \) parallel_(m \, \( 1 - K \/ n^2 \) sigma) & lt.eq \( K \/ \| n \| \)
  parallel f - hat(f) parallel_(r_0 \, sigma) . $ <ana:row-bound>]

 The second estimate holds for two inputs with the same bound.
   The derivative identity holds for smooth real variations and for real-symmetric holomorphic variations with the
   indicated finite norms.]
] <prop:row-input>

Both inputs concern the arbitrary-input action (3.2); neither presupposes physical caustics.
  We use their estimates directly, without applying the analytic-boundary result of #cite(label("NB")) under its
  stronger standing geometric hypothesis.

=== 3.2 The equations satisfied by the actual boundary <the-equations-satisfied-by-the-actual-boundary>

#thm([Lemma 3.4.])[
  #emph[For the smooth function $u$ in (3.1), $C_n \( u \) = 0$ for every sufficiently large $\| n \|$.]
] <ana:vanishing>

#proof[
  Apply Proposition 8 on the real axis. Its steps are $2 pi \/ q + O \( q^(- 3) \)$,
    hence positive and uniformly small. Applying $phi.alt$ gives a stationary chain for $cal(S)$,
    with positive uniformly small angular increments and total advance $2 pi$.
    Proposition 5 and Lemma 6 show that its final momentum equals its initial momentum.
    Thus the chain is stationary also at the identified endpoints.
    More explicitly, differentiation of its critical action cancels every interior term, and the two endpoint terms are
  $ W'_q \( x \; u \) = frac(phi.alt' \( x \), c_(*)) \( p_q - p_0 \) = 0 . $
  Here $phi.alt' \( x + 2 pi \) = phi.alt' \( x \)$, and periodicity of $h$ cancels the two endpoint contributions
    from the subtracted integral. The action is constant in $x$, so its nonzero Fourier coefficients vanish. ◻
]

=== 3.3 A bounded inverse on one Fourier strip <a-bounded-inverse-on-one-fourier-strip>

For a Fourier sequence and $a gt.eq 0$, define

$ \| v \|_(sigma \, a) = sum_(k in bb(Z)) \( 1 + \| k \| \)^a \| \[ v \]_k \| e^(sigma \| k \|) \,
  wide \| v \|_sigma = \| v \|_(sigma \, 0) . $

The norm $\| dot.op \|_sigma$ defines a Wiener space. Let $Pi_H$ be the projection to $\| k \| gt.eq N$,
  and write $C \( f \)$ for the sequence of these output rows.

#thm([Lemma 3.5.])[
  #emph[Fix the bounds in Proposition 9 with $m = 2$. The row formula extends to a bounded Fourier operator
$ A \( f \) = Pi_H + R \( f \) \, wide parallel R \( f \) parallel lt.eq C \/ N \, $

 on each Wiener space of width $sigma$. For two bounded inputs,
$ parallel R \( f \) - R \( hat(f) \) parallel lt.eq C parallel f - hat(f) parallel_(r_0 \, sigma) . $

 For sufficiently large $N$, the restriction $A_H \( f \)$ to the high input modes is invertible with $parallel
   A_H \( f \)^(- 1) parallel lt.eq 2$. The operators and this inverse preserve real Fourier symmetry.
   With higher fixed input bounds, the same matrix is bounded in $\| dot.op \|_(sigma \, a)$ whenever $m > a + 1$.]
] <ana:wiener>

#proof[
  Contour displacement and $m$ integrations by parts in (3.7) give
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| \[ b_n \( f \) - 1 \]_j \| lt.eq frac(C, \| n \|) \( 1 + \| j \| \)^(- m)
     e^(- \( 1 - K \/ n^2 \) sigma \| j \|) . $ <ana:coefficient-decay>]
  For positive $sigma$, displace first to an interior closed strip and then take its width to the indicated limit;
    for $sigma = 0$, only integration by parts is needed. Coefficient differences satisfy the same bound
    multiplied by $parallel f - hat(f) parallel_(r_0 \, sigma)$.
  Increase $N$ so that $N^2 gt.eq 2 K$, and set $alpha = K \/ n^2 lt.eq 1 \/ 2$.
    The triangle inequality yields the useful identity and bound
  #[#set math.equation(numbering: n => "(3.9)")
   $ \| n \| - \| k \| - \( 1 - alpha \) \| n - k \| & = \( 1 - alpha \) \( \| n \| - \| k \| - \| n - k \| \) +
     alpha \( \| n \| - \| k \| \)\
 & lt.eq alpha \| n \| = K \/ \| n \| . $ <ana:exponent-balance>]
  Consequently the weighted matrix entry from $k$ to $n$ of $R \( f \)$ is at most
  $ frac(C, \| n \|) \( 1 + \| n - k \| \)^(- m) e^(K sigma \/ \| n \|) . $
  At $m = 2$ its column sums are $O \( N^(- 1) \)$, proving the stated operator bounds on weighted $ell^1$.
    A Neumann series gives the inverse. The equality $C_(- q) \( f \) =
    overline(C_q \( f \))$ for real inputs gives the real symmetry. Finally,
  $ frac(\( 1 + \| n \| \)^a, \( 1 + \| k \| \)^a) lt.eq \( 1 + \| n - k \| \)^a $
  reduces the polynomially weighted estimate to the convergent sum of $\( 1 + \| n - k \| \)^(a - m)$. ◻
]

The Fourier operator here is a bounded extension of the actual derivative on sufficiently regular variations.
  A Wiener sequence need not have $r_0$ bounded derivatives on its original strip.
  On every smaller strip it does, and the matrix agrees there with the actual derivative by Fourier-polynomial
  approximation. Compatibility of the real meshes also identifies the row derivatives across widths.
  We will only differentiate on segments with the finite input bounds required by Proposition 9.

=== 3.4 Analytic approximation and real uniqueness <analytic-approximation-and-real-uniqueness>

#proof[
  Fix $m = 2$, $r_0 = 17$, and
  $ M > 4 e \( 1 + \| u \|_(0 \, r_0) \) . $
  Choose $N$ large enough for Lemmas 10 and 11, with $parallel R parallel lt.eq
    1 \/ 2$ throughout this input ball. These choices precede all choices of approximation parameters.
  Let $f_0 = sum_(\| k \| lt.eq P) \[ u \]_k e^(upright(i) k x)$, where $P > N$, and put $sigma_0 = P^(- 1)$.
    For every fixed $a gt.eq 0$,
  #[#set math.equation(numbering: n => "(3.10)")
   $ \| f_0 \|_(sigma_0 \, a) lt.eq e \| u \|_(0 \, a) . $ <ana:truncation>]
  We claim that, for every fixed positive integer $a$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ \| C \( f_0 \) \|_(sigma_0) = O \( P^(- a) \) . $ <ana:initial-error>]
  For $N lt.eq \| n \| lt.eq P$, the exponential weights are at most $e$.
    Integrate the real derivative along the segment from $u$ to $f_0$, use $C \( u \) = 0$,
    and apply Lemma 11 at width zero. This part is bounded by $C \| f_0 - u \|_0$,
    which decays faster than any fixed power of $P$ because $u$ is smooth.
  For $\| n \| > P$, instead integrate along $lambda f_0$, $0 lt.eq lambda lt.eq 1$.
    The zero input has a uniform stationary mesh and a constant critical action, so $C \( 0 \) = 0$.
    For the chosen $a$, use Proposition 9 with one fixed integer $m > a + 1$.
    Formula (3.10) bounds all its required input derivatives uniformly in $P$.
    Once $P$ exceeds this higher-order row threshold, real mesh uniqueness identifies these rows with the original
    ones. The final assertion of Lemma 11 gives
  $ sum_(\| n \| > P) \( 1 + \| n \| \)^a \| C_n \( f_0 \) \| e^(sigma_0 \| n \|) lt.eq
    C_a \| f_0 \|_(sigma_0 \, a) lt.eq C'_a . $
  Division by $\( 1 + P \)^a$ proves the tail bound. This establishes (3.11);
    its constants and threshold may depend on $a$, and no uniformity over all smoothness orders is asserted.
  Keep the modes $\| k \| < N$ fixed and set
  $ sigma_j = frac(1 + 2^(- j), 2 P) \, wide sigma_oo = frac(1, 2 P) \, wide epsilon_j = \| C \( f_j \) \|_(sigma_j) . $
  At the $j$-th step define
  #[#set math.equation(numbering: n => "(3.12)")
   $ eta_j = - A_H \( f_j \)^(- 1) C \( f_j \) \, wide f_(j + 1) = f_j + eta_j . $ <ana:newton-step>]
  The correction is real symmetric, has only high modes, and obeys $\| eta_j \|_(sigma_j) lt.eq 2 epsilon_j$.
    Since $sigma_j - sigma_(j + 1) = 2^(- j - 2) \/ P$, the elementary Fourier smoothing estimate gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ parallel eta_j parallel_(r_0 \, sigma_(j + 1)) lt.eq C P^(r_0) 2^(r_0 j) epsilon_j . $ <ana:correction-bound>]
  If the correcting segment is in the fixed input ball on this smaller strip,
    integration of the derivative difference gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ epsilon_(j + 1) lt.eq C parallel eta_j parallel_(r_0 \, sigma_(j + 1)) \| eta_j \|_(sigma_(j + 1)) lt.eq
     C P^(r_0) 2^(r_0 j) epsilon_j^2 . $ <ana:newton-bound>]
  The linear term cancels by (3.12): compatibility of the real row derivatives makes the matrix computed at width
    $sigma_j$ the same matrix on the smaller strip. Equivalently,
    one can integrate each smooth real row first and then take the smaller-strip norm,
    avoiding any derivative assertion for rough variations at the original strip boundary.
  Choose $P$ so large that $epsilon_0 lt.eq P^(- 2 r_0)$, possible by (3.11),
    and enlarge it further as needed below. The simultaneous induction is
  #[#set math.equation(numbering: n => "(3.15)")
   $ epsilon_j lt.eq P^(- 2 r_0) 2^(- \( r_0 + 1 \) j) \, wide
     parallel eta_j parallel_(r_0 \, sigma_(j + 1)) lt.eq C P^(- r_0) 2^(- j) . $ <ana:newton-majorant>]
  Indeed, before using (3.14), the known bound for $epsilon_j$ and (3.13) put the entire current segment in the
    ball: the initial norm is less than $M \/ 4$, and the cumulative corrections are at most $C P^(- r_0)
    sum_(i gt.eq 0) 2^(- i) < M \/ 4$. Thus the quadratic estimate is applicable.
    Its ratio to the proposed bound for $epsilon_(j + 1)$ is at most $C P^(- r_0) 2^(r_0 + 1 - j)$,
    which is less than one for one sufficiently large fixed $P$.
    This proves both the error bound and the input bound at every step.
  The summable corrections converge on the positive-width strip $cal(A)_(sigma_oo)$,
    with all derivatives through $r_0$, to a real-symmetric holomorphic function $f_(*)$.
    Its low Fourier modes agree with those of $u$, and continuity of each real mesh gives $C_n \( f_(*) \) =
    0$ for every $\| n \| gt.eq N$. The real segment between $u$ and $f_(*)$ lies in the same input ball.
    Put $v = f_(*) - u = Pi_H v$. Integrating the real derivative,
  $ 0 = C \( f_(*) \) - C \( u \) = v + integral_0^1 R \( u + lambda v \) v thin #h(-0.16667em) upright(d) lambda . $
  The bound $parallel R parallel lt.eq 1 \/ 2$ implies $\| v \|_0 lt.eq \| v \|_0 \/ 2$, hence $v = 0$.
    The original smooth $u$ is therefore analytic.
  Finally $phi.alt' = e^u > 0$, so $phi.alt$ and its inverse are analytic.
    Equation (3.1) makes $r$ analytic in the normal angle, and the equation $h'' + h = r$ makes $h$ analytic.
    Thus $h n_theta + h' e_theta$ is an analytic regular boundary parametrization, proving Theorem 7. ◻
]

#thm([Corollary 3.6.])[
  #emph[For the actual table, $D = D_u$ is real symmetric and holomorphic in a uniform neighborhood of the real
    diagonal. It is diagonally $2 pi$-periodic and antisymmetric, and satisfies
#[#set math.equation(numbering: n => "(3.16)")
 $ D \( x \, x + b \) = - b^3 / 24 + O \( b^5 \) \, wide D_1 \( x \, x + b \) = b^2 / 8 + O \( b^4 \) \,
   $ <ana:glancing-expansion>]

 locally uniformly with each fixed number of derivatives.]
] <ana:glancing-interface>

#proof[
  The midpoint implicit function theorem, positivity of $phi.alt'$ on the real axis,
    and compactness modulo the period give a uniform holomorphic domain for (3.2).
    Reversing its two endpoints gives antisymmetry. The calculation of (3.3) applies on this holomorphic domain.
    Differentiating at fixed second endpoint is the operator $partial_x - partial_b$,
    which gives the second expansion. ◻
]

== 4 Joint analyticity at the grazing boundary <sec:joint>

The boundary is now analytic, but the given foliation is still only continuous.
  We next construct a parametrization that is holomorphic in both its circular variable and its translation
  parameter. The principal issue is division by difference operators at rational parameters.
  The periodic graphs from Proposition 5 provide two compatibility conditions:
  one for the residual and one for its first parameter derivative. Both are needed.

We follow the Newton construction of #cite(label("NB")) Section 3,
  giving the arguments that identify its geometric hypotheses in the present setting.
  The only geometric input in this Section is the invariant graph collar and the stationary-chain closure of
  Lemma 6. The Fourier division estimate will be stated separately in its precise form.

#thm([Theorem 4.1.])[
  (Joint analytic parametrization).  #emph[There are positive numbers $s \, d$, with $d < s$,
    and a function $V \( y \, t \)$, holomorphic on ${ \| Im y \| < 2 s \, med \| t \| < d }$, such that $V -
    y$ is $2 pi$-periodic in $y$, $V$ is even in $t$, and
$ V \( macron(y) \, macron(t) \) = overline(V \( y \, t \)) \, wide V \( y \, 0 \) = y . $

 Moreover $V_y$ is uniformly close to one, and
#[#set math.equation(numbering: n => "(4.1)")
 $ D_1 #scale(x: 120%, y: 120%)[\(] V \( y \, t \) \, V \( y + t \, t \) #scale(x: 120%, y: 120%)[\)] +
   D_2 #scale(x: 120%, y: 120%)[\(] V \( y - t \, t \) \, V \( y \, t \) #scale(x: 120%, y: 120%)[\)] =
   0 $ <joint:stationary>]

 for $\| Im y \| < s$, $\| t \| < d$. In particular $V_y > 0$ on the real domain.]
] <thm:joint>

=== 4.1 The normalized equation <the-normalized-equation>

The analytic action obtained in Section 3 is antisymmetric and diagonally $2 pi$-periodic.
  On a fixed complex neighborhood of the real diagonal it satisfies

#[#set math.equation(numbering: n => "(4.2)")
 $ D \( x \, x + b \) = - b^3 / 24 + O \( b^5 \) \, wide D_1 \( x \, x + b \) = b^2 / 8 + b^4 B \( x \, b \) \,
   $ <joint:action>]

where $B$ is holomorphic and periodic in $x$. All domains below are contained in this fixed action neighborhood.

Write $T_z f \( y \, t \) = f \( y + z \, t \)$, use a prime for a $y$-derivative, and set

$ partial f = frac(T_(t \/ 2) f - T_(- t \/ 2) f, t) . $

This symbol denotes a difference operator, not a parameter derivative. For a candidate $V$, define

#[#set math.equation(numbering: n => "(4.3)")
 $ cal(R) \( V \) & = D_1 \( V \, T_t V \) + D_2 \( T_(- t) V \, V \) \,\
E \( V \) & = t^(- 3) V' cal(R) \( V \) \,\
a \( V \) & = t^(- 1) D_12 \( T_(- t \/ 2) V \, T_(t \/ 2) V \) \( T_(- t \/ 2) V' \) \( T_(t \/ 2) V' \) .
  $ <joint:residual>]

For a periodic function, $chevron.l f chevron.r$ denotes its mean in $y$.
  An assigned first parameter jet prescribes a parameter derivative at one fixed value of $t$,
  without assuming a nearby family of exact solutions.

#thm([Lemma 4.2.])[
  (Regularity and factorization).  #emph[The expressions $E$ and $a$ extend holomorphically across $t = 0$, with
#[#set math.equation(numbering: n => "(4.4)")
 $ E \( V \) \( y \, 0 \) = frac(\( V' \)^2 V'', 4) \, wide a \( V \) \( y \, 0 \) =
   frac(\( V' \)^3, 4) . $ <joint:at-zero>]

 They are even in $t$ whenever $V$ is even, and $chevron.l E \( V \) chevron.r = 0$.
   The linearization in a variation $V' w$ is
#[#set math.equation(numbering: n => "(4.5)")
 $ E_V \( V' w \) = partial \( a partial w \) + \( E w \)' . $ <joint:linearization>]

 At an exact solution at a nonzero real parameter $t_0$, an assigned parameter jet $dot(V) =
   V' z$ gives the total residual jet
#[#set math.equation(numbering: n => "(4.6)")
 $ dot(E) = partial (a partial z + a / t_0) . $ <joint:parameter-jet>]

 Here the dot differentiates all parameter dependence, including the explicit shifts.]
] <joint:factorization>

#proof[
  Antisymmetry gives $cal(R) = D_1 \( V \, T_t V \) - D_1 \( V \, T_(- t) V \)$. Put
  $ A_plus.minus = frac(T_(plus.minus t) V - V, plus.minus t) =
    integral_0^1 V' \( y plus.minus u t \, t \) thin #h(-0.16667em) upright(d) u . $
  By (4.2),
  #[#set math.equation(numbering: n => "(4.7)")
   $ E / V' = frac(A_(+) + A_(-), 8) frac(A_(+) - A_(-), t) +
     t #scale(x: 120%, y: 120%)[\[] A_(+)^4 B \( V \, t A_(+) \) -
     A_(-)^4 B \( V \, - t A_(-) \) #scale(x: 120%, y: 120%)[\]] . $ <joint:regular-formula>]
  The remaining divided difference has the nonsingular expression
  $ frac(A_(+) - A_(-), t) = integral_0^1 integral_(- u)^u V'' \( y + v t \, t \) thin #h(-0.16667em) upright(d) v
    thin #h(-0.16667em) upright(d) u . $
  These formulas prove regularity and the first identity in (4.4).
    Since $D_12 \( x \, x + b \) = b \/ 4 + O \( b^3 \)$, the second follows as well.
    They also show that the first two variations of $E$, on domains with room for the shifts,
    have bounds in terms of a fixed number of derivatives through order two in $y$.
    No negative power of $t$ is needed in these bounds. Antisymmetry gives the stated parity.
  For real $t$, the mean action
  $ frac(1, 2 pi) integral_0^(2 pi) D #scale(x: 120%, y: 120%)[\(] V \( y + eta \, t \) \,
    V \( y + eta + t \, t \) #scale(x: 120%, y: 120%)[\)] thin #h(-0.16667em) upright(d) y $
  is independent of $eta$. Differentiating at zero and shifting one integral gives $chevron.l V' cal(R)
    chevron.r = 0$. The mean-zero identity for complex $t$ follows by holomorphic continuation.
  For (4.5), separate each off-diagonal variation into its value at $y$ and its difference from that value. With
  $ c_(+) = D_12 \( V \, T_t V \) V' T_t V' \, wide c_(-) = D_12 \( T_(- t) V \, V \) T_(- t) V' V' \, $
  the difference terms are
  $ t^(- 3) #scale(x: 120%, y: 120%)[\[] c_(+) \( T_t w - w \) +
    c_(-) \( T_(- t) w - w \) #scale(x: 120%, y: 120%)[\]] = partial \( a partial w \) \, $
  since $T_(plus.minus t \/ 2) a = c_plus.minus \/ t$. The common-value terms, including the variation of $V'$,
    are $\( E w \)'$.
  At an exact solution, differentiating the factor $t^(- 3)$ contributes zero.
    Differentiation of the explicit shifts contributes $\( c_(+) - c_(-) \) \/ t_0^3 = partial a \/ t_0$,
    whereas the assigned jet contributes $partial \( a partial z \)$. This proves (4.6). ◻
]

We will use candidates with $V'$ close to one and $\| t \|$ small, so (4.3) makes $a$ close to $1 \/ 4$.
  For a Newton correction of the form $Delta V = V' v$, the main equation is $partial \( a partial v \) approx -
  E$: the remaining linearization term $\( E v \)'$ is quadratic in the residual and the correction once $v$ is
  controlled by the residual. We will solve this equation by two approximate primitives,

$ partial H approx - E \, wide b = a^(- 1) \( H + lambda \( t \) \) \, quad chevron.l b chevron.r = 0 \, wide
  partial v approx b . $

The free constant $lambda \( t \)$ makes the second right-hand side have zero mean;
  each approximation will have error quadratic in the residual norm.
  At a rational parameter, the Fourier multiplier of $partial$ vanishes in some nonzero modes.
  Periodic orbits give compatible residual values for the first division.
  At those modes, the value of the resulting primitive is determined by a parameter derivative,
  so compatible first parameter jets are needed to justify the second division.
  Both compatibilities will hold up to quadratic errors, using jets assigned at individual rational parameters
  without differentiating the given continuous foliation. We first establish these rational compatibilities and
  then carry out both divisions with uniform bounds.

=== 4.2 Domains and the Newton estimate <domains-and-the-newton-estimate>

For $nu in { 0 \, 1 / 2 \, 1 }$, set

#[#set math.equation(numbering: n => "(4.8)")
 $ cal(D)^nu \( s \, d \) = { \( y \, t \) : \| t \| < d \, med \| Im y \| < s - nu \| Im t \| } . $ <joint:domains>]

These three domains track the complex shifts in the two divisions.
  Starting with $V$ on $cal(D)^0$, the shifts in the residual require $cal(D)^1$.
  The first Fourier division will recover one half of this loss, giving $H$ on $cal(D)^(1 \/ 2)$;
  the second will give $v$ on $cal(D)^0$. The radii will decrease slightly at each operation to control derivatives.

Choose $d < min \( 1 \, s \/ 2 \)$ small. Besides staying in the fixed action domain,
  we require that every positive real step in the normalized coordinate of size at most $3
  d$ gives a line in the graph collar, and that all positive rational translations less than $d$ lie in the range
  of Proposition 5. Both requirements hold after shrinking $d$:
  the line momentum tends uniformly to the grazing support as the step tends to zero.
  We also choose $3 d sup_(x in bb(R)) phi.alt' \( x \) < kappa$,
  where $kappa$ is the angular-step bound in Lemma 6. Thus every such normalized step has angular increment less
  than $kappa$.

Candidates are holomorphic on $cal(D)^0 \( s \, d \)$, real-symmetric, even in $t$, periodic modulo $y$,
  and satisfy a fixed small bound on $V - y$ and its first three $y$-derivatives.
  In particular $V'$ is close to one. Equation (4.3) and (4.2) then make $a$ uniformly close to $1 \/
  4$ on $cal(D)^(1 \/ 2) \( s \, d \)$.

For $0 < delta < d \/ 100$, abbreviate

$ cal(D)_j^nu = cal(D)^nu \( s - j delta \, d - j delta \) \, wide Y_j = { y : \| Im y \| < s - j delta } . $

Norms without a derivative subscript are supremum norms. Fixed Cauchy losses between these domains cost fixed
  powers of $delta^(- 1)$. Indeed polydisks of radius $delta \/
  4$ about points of $cal(D)_(j + 1)^nu$ lie in $cal(D)_j^nu$.
  A shift by $t \/ 2$ increases the required value of $nu$ by $1 \/ 2$.

#thm([Proposition 4.3.])[
  (Uniform Newton step).  #emph[There are fixed constants $C_0 \, B_0$,
    depending only on the fixed analytic action bounds and candidate smallness bounds,
    for which the following holds. Suppose
$ parallel E \( V \) parallel_(cal(D)_0^1) lt.eq epsilon < 1 \, wide e^(- N delta) lt.eq epsilon \, wide Q = 1 +
  N + delta^(- 1) \, $

 where $N gt.eq 1$ is an integer. If $C_0 Q^(B_0) epsilon$ is sufficiently small, there is a periodic,
   real-symmetric, even correction $Delta V$ such that
#[#set math.equation(numbering: n => "(4.9)")
 $ max_(0 lt.eq j lt.eq 3) parallel partial_y^j Delta V parallel_(cal(D)_20^0) & lt.eq C_0 Q^(B_0) epsilon \,\
parallel E \( V + Delta V \) parallel_(cal(D)_20^1) & lt.eq C_0 Q^(B_0) epsilon^2 . $ <joint:step-size>]

 In particular $B_0$ is independent of the radius $d$, the retained rational parameters,
   and the order of a formal initializer.]
] <joint:newton>

We prove this version of #cite(label("NB")) Proposition 3.3 from the graph collar.
  In its proof, $O_(upright(p)) \( epsilon^k \)$ means a bound $C Q^B epsilon^k$, where $C \, B$ are fixed.
  These constants may increase a fixed finite number of times.
  At the end, a single choice of $C_0 \, B_0$ includes every bound and every polynomial smallness requirement.
  None of the following operations increases the number of derivatives with $N$ or with the initializer order.

=== 4.3 Rational values and first parameter jets <rational-values-and-first-parameter-jets>

#thm([Lemma 4.4.])[
  (Rational compatibility).  #emph[Let $t_0 = 2 pi l \/ q eq.not 0$ be reduced, with $q lt.eq
    N$ and $\| t_0 \| < d - 2 delta$. Under the hypotheses and polynomial smallness conditions of Proposition 15,
    there are holomorphic periodic jets $w \, dot(w)$ on $Y_10$, real-symmetric in $y$, satisfying
#[#set math.equation(numbering: n => "(4.10)")
 $ w \, dot(w) & = O_(upright(p)) \( epsilon \) \,\
E + partial \( a partial w \) & = O_(upright(p)) \( epsilon^2 \) \,\
#scale(x: 120%, y: 120%)[\(] E + partial \( a partial w \) #scale(x: 120%, y: 120%)[\)]^dot.op & =
  O_(upright(p)) \( epsilon^2 \) . $ <joint:value-compatibility>]

 The dot in the last line uses the assigned jet $dot(w)$ and differentiates every occurrence of $t$.]
] <joint:compatibility>

#proof[
  We begin with $t_0 > 0$. Write $U_j \( y \) = V \( y + j t_0 \, t_0 \)$ and seek interior-stationary nodes
  $ X_j = U_j + U'_j xi_j \, wide 0 lt.eq j lt.eq q \, wide xi_0 = xi_q = 0 . $
  The endpoint increment is $2 pi l$. Multiply the interior stationarity equation at node $j$ by the fixed factor
    $t_0^(- 3) U'_j$. At $xi = 0$ the residual is $E \( y + j t_0 \, t_0 \)$.
    By (4.5), its derivative in $xi$ is the Dirichlet flux matrix
  #[#set math.equation(numbering: n => "(4.11)")
   $ \( A_0 xi \)_j = t_0^(- 2) #scale(x: 120%, y: 120%)[\[] a_(j + 1 \/ 2) \( xi_(j + 1) - xi_j \) -
     a_(j - 1 \/ 2) \( xi_j - xi_(j - 1) \) #scale(x: 120%, y: 120%)[\]] \, quad a_(j + 1 \/ 2) =
     a \( y + \( j + 1 \/ 2 \) t_0 \, t_0 \) \, $ <joint:dirichlet>]
  plus the diagonal potential
  $ W_j = T_(j t_0) (E' - V'' / V' E) . $
  The prefactor in the finite-dimensional equations is frozen;
    subtracting its variation explains the second term in this potential.
  The inverse of $A_0$ has a uniform complex bound. For $A_0 xi = f$, let $J_(j + 1 \/ 2) =
    a_(j + 1 \/ 2) \( xi_(j + 1) - xi_j \)$. Then
  $ J_(j + 1 \/ 2) = J_(1 \/ 2) + t_0^2 sum_(i = 1)^j f_i . $
  The condition $sum_(j = 0)^(q - 1) \( xi_(j + 1) - xi_j \) = 0$ determines $J_(1 \/ 2)$.
    Since each $a_(j + 1 \/ 2)^(- 1)$ is close to four, the modulus of their sum is at least a fixed positive
    multiple of $q$. Summing the resulting increments gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ parallel A_0^(- 1) parallel_(oo arrow.r oo) lt.eq C q^2 t_0^2 lt.eq C Q^2 . $ <joint:dirichlet-inverse>]
  On $Y_1$, the potential is bounded by $C Q epsilon$. Thus a Neumann series gives the same bound for the full
    inverse if $C Q^3 epsilon$ is small.
  Reducedness supplies the useful lower bound
  #[#set math.equation(numbering: n => "(4.13)")
   $ \| t_0 \|^(- 1) lt.eq q \/ \( 2 pi \) lt.eq N \/ \( 2 pi \) . $ <joint:rational-bound>]
  The nonlinear equations involve only three neighboring nodes, bounded fixed derivatives of $D$,
    and the factor $t_0^(- 3)$. Their Hessian in the supremum norm therefore has size at most $C Q^3$,
    independently of the number of nodes. Applying the linearized inverse to the nonlinear remainder defines a
    contraction on a ball of radius $C Q^2 epsilon$ when $C Q^7 epsilon$ is small.
    Hence $xi = O_(upright(p)) \( epsilon \)$ on $Y_1$, holomorphically in $y$.
    Uniqueness preserves periodicity and real symmetry. Fixed derivatives are controlled on smaller strips by
    Cauchy’s estimate.
  For real $y$, the uncorrected increments are bounded below by a fixed multiple of $t_0$.
    The correction, using (4.13) and a stronger fixed polynomial smallness condition,
    preserves positivity and keeps every step below $3 d$. After applying $phi.alt$,
    these are actual stationary billiard chains: subtracting the endpoint primitive in the definition of $D$
    telescopes, and the coordinate change has nonzero derivative. Their initial states lie in the graph collar.
    Lemma 6 therefore gives momentum return as well as angle return.
    Each chain is periodic with rotation $l \/ q$, and Proposition 5 identifies the same unique invariant graph
    for every starting $y$.
  Invert $V \( thin dot.op thin \, t_0 \)$ locally around the uncorrected nodes to write
  $ X_j \( y \) = V \( tilde(y)_j \( y \) \, t_0 \) \, wide tilde(y)_j = y + j t_0 + O_(upright(p)) \( epsilon \) $
  on $Y_2$. This inverse is obtained by contraction for the small displacement from $y + j t_0$;
    it requires no assertion about a global complex inverse. On the real axis,
    uniqueness of the rational graph implies $tilde(y)_j = tilde(y)_1^(thin j)$ and $tilde(y)_q = y + 2 pi l$.
    Consequently
  $ G \( y \) = 1 / q sum_(j = 0)^(q - 1) #scale(x: 120%, y: 120%)[\(] tilde(y)_j \( y \) -
    j t_0 #scale(x: 120%, y: 120%)[\)] quad upright("satisfies") quad G \( tilde(y)_1 \( y \) \) = G \( y \) + t_0 . $
  Its displacement and, on $Y_3$, its derivative displacement are $O_(upright(p)) \( epsilon \)$.
    Contraction gives an inverse on $Y_4$. Thus
  #[#set math.equation(numbering: n => "(4.14)")
   $ V_(*) \( y \) = V \( G^(- 1) \( y \) \, t_0 \) $ <joint:rational-solution>]
  is an exact solution at $t_0$, with $V_(*) - V \( thin dot.op thin \, t_0 \) = O_(upright(p)) \( epsilon \)$.
    The stationarity identity follows first on the real axis from the graph dynamics and then throughout the strip
    by holomorphy.
  We must also give $V_(*)$ an appropriate first parameter jet.
    Initially assign $dot(V)_(*) = V_t \( thin dot.op thin \, t_0 \)$.
    Its residual jet is $O_(upright(p)) \( epsilon \)$ on $Y_6$.
    Indeed Cauchy’s estimate gives $E_t = O_(upright(p)) \( epsilon \)$ there:
    the distance of $t_0$ from the parameter boundary exceeds $2 delta$.
    A polydisk of radius $delta \/ 4$ in each variable about $\( y \, t_0 \)$, with $y in Y_6$,
    lies in $cal(D)_0^1$, so this estimate costs only $C delta^(- 1)$.
    Replacing $V$ by $V_(*)$, with the same assigned jet, changes that derivative by
    $O_(upright(p)) \( epsilon \)$. To make its polynomial character explicit, if $J$ is any assigned jet,
    direct differentiation gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ dot(E) =  & - 3 t^(- 4) V' cal(R) + t^(- 3) J' cal(R)\
 & + t^(- 3) V' #scale(x: 120%, y: 120%)[\[] D_11 \( V \, T_t V \) J + D_12 \( V \, T_t V \) \( T_t J + T_t V' \)\
 & #h(29mm)  + D_21 \( T_(- t) V \, V \) \( T_(- t) J - T_(- t) V' \) +
   D_22 \( T_(- t) V \, V \) J #scale(x: 120%, y: 120%)[\]] . $ <joint:raw-jet>]
  Only fixed derivatives occur, $V_t$ and its needed $y$-derivatives have Cauchy bounds,
    and (4.13) controls every denominator.
  Let $Pi = q^(- 1) sum_(j = 0)^(q - 1) T_(j t_0)$. This is a projection on periodic functions, and $Pi partial =
    partial Pi = 0$. Equation (4.6) at the exact solution shows that $Pi dot(E)_(*) = 0$.
    Put $a_(*) = a \( V_(*) \)$; after the fixed derivative losses, it is still close to $1 \/ 4$.
    On $ker Pi$, the operator $partial \( a_(*) partial \)$ has an inverse with polynomial norm.
    For an explicit verification, put $T = T_(t_0)$ and
  $ R_q = 1 / q sum_(j = 0)^(q - 1) j T^j . $
  The identity $\( T - 1 \) R_q = 1 - Pi$ gives $partial^(- 1) = t_0 R_q T_(t_0 \/ 2)$ on $ker Pi$,
    of norm at most $C q \| t_0 \|$. Projected multiplication $\( 1 - Pi \) a_(*) : ker Pi arrow.r
    ker Pi$ differs from multiplication by $1 \/ 4$ by at most $2 parallel a_(*) - 1 \/ 4 parallel$,
    so is invertible by a Neumann series. Composing these three inverses yields
  $ parallel { partial \( a_(*) partial \) }^(- 1) parallel_(ker Pi) lt.eq C q^2 t_0^2 . $
  The projection commutes with all translations; no trivial action of the half-shift on its range is needed.
    We may therefore correct $dot(V)_(*)$ by $V'_(*) z$, where $z = O_(upright(p)) \( epsilon \)$,
    to make its total residual jet zero.
  Finally set $w = \( V_(*) - V \) \/ V'$ and differentiate this quotient using the corrected jet of $V_(*)$.
    Both $w$ and $dot(w)$, with the fixed number of derivatives needed below,
    are $O_(upright(p)) \( epsilon \)$ after the losses up to $Y_10$. Taylor’s formula and (4.5) give
  $ 0 = E \( V_(*) \) = E + partial \( a partial w \) + \( E w \)' + O_(upright(p)) \( epsilon^2 \) . $
  The same formula differentiated in the assigned jets has a quadratic remainder.
    To see this directly, write the remainder as the integral of the second variation along the segment from $V$
    to $V_(*)$. A first parameter derivative either replaces one of its two increments by its assigned jet,
    or differentiates a coefficient. The first case still contains two $O_(upright(p)) \( epsilon \)$ factors.
    The second costs only fixed derivatives in (4.15), with denominators at worst $t_0^(- 4)$,
    and also retains both factors. Cauchy estimates on the remaining fixed buffers absorb the required
    derivatives. Moreover $\( E w \)'$ and its jet are quadratic since $E \, E_t \, w \, dot(w) =
    O_(upright(p)) \( epsilon \)$. This proves both (4.10) and (4.10). All costs are fixed powers of $Q$:
    the mesh inverse costs $Q^2$, its Hessian $Q^3$, the cyclic inverse at most $Q^2$,
    and all other steps use fixed derivatives and fixed Cauchy losses.
    Negative $t_0$ follow by evenness, with the sign of the first jet reversed. ◻
]

=== 4.4 Two Fourier divisions <two-fourier-divisions>

For a periodic function $F$, write $F \( y \, t \) = sum_(n in bb(Z)) F_n \( t \) e^(upright(i) n y)$.
  The nonzero-mode divisor of $partial$ is

#[#set math.equation(numbering: n => "(4.16)")
 $ d_n \( t \) = frac(2 upright(i) sin \( n t \/ 2 \), t) \, wide d_n \( 0 \) = upright(i) n . $ <joint:divisor>]

Its nonzero zeros $t_j = 2 pi j \/ n$, $j eq.not 0$, are simple.
  We use the following analytic estimate, with exactly the buffers needed here.

#thm([Lemma 4.5.])[
  (Buffered division, #cite(label("NB")) Lemma 3.5).  #emph[Let $nu in { 1 \/ 2 \, 1 }$,
    and suppose a mean-zero periodic function $F$ is holomorphic on $cal(D)_(j_0)^nu$, with norm at most $M$.
    Let the fixed integer buffers satisfy $b_(upright("buf")) gt.eq j_0 + 1$ and $a_(upright("buf")) gt.eq j_0$.
    Suppose, for $1 lt.eq \| n \| lt.eq N$ and every divisor zero with $0 < \| t_j \| < d -
    b_(upright("buf")) delta$, that
$ \| F_n \( t_j \) \| lt.eq eta e^(- \| n \| \( s - a_(upright("buf")) delta \)) . $

 For the retained modes define
#[#set math.equation(numbering: n => "(4.17)")
 $ R_n \( t \) & = sum_(0 < \| t_j \| < d - b_(upright("buf")) delta) F_n \( t_j \)
   frac(sin \( n \( t - t_j \) \/ 2 \), n \( t - t_j \) \/ 2) \,\
H_n \( t \) & = frac(F_n \( t \) - R_n \( t \), d_n \( t \)) \, $ <joint:interpolation>]

 and set $H_0 = 0$ and $H_n = 0$ for $\| n \| > N$. The quotients are holomorphic for $\| t \| <
   d - \( b_(upright("buf")) + 1 \) delta$. For each fixed integer $J >
   max \( a_(upright("buf")) \, j_0 \, b_(upright("buf")) + 1 \)$,
#[#set math.equation(numbering: n => "(4.18)")
 $ parallel H parallel_(cal(D)_J^(nu - 1 \/ 2)) & lt.eq C Q^B \( M + eta \) \,\
parallel partial H - F parallel_(cal(D)_J^nu) & lt.eq C Q^B #scale(x: 120%, y: 120%)[\(] eta +
  M e^(- N delta) #scale(x: 120%, y: 120%)[\)] . $ <joint:division-bounds>]

 Here $C \, B$ depend on the fixed buffers, not on $N \, d \, delta$.
   Fixed additional derivatives cost fixed additional powers after fixed domain losses.
   Real symmetry and evenness are preserved.]
] <joint:division>

The interpolation in (4.17) cancels precisely the included zeros,
  since its sinc kernel is one at its own center and zero at every other center.
  The buffers ensure that every possible pole in the smaller parameter disk has been canceled.
  The gain of one half in the domain exponent comes from the exponential factor $e^(- \| n Im t \| \/ 2)$ in the
  inverse sine divisor. The estimate also provides, on the real parameter axis,

#[#set math.equation(numbering: n => "(4.19)")
 $ \| R_n \( t \) \| + N^(- 1) \| R'_n \( t \) \| lt.eq C Q^B eta
   e^(- \| n \| \( s - a_(upright("buf")) delta \)) . $ <joint:interpolation-jet>]

This follows directly from the sinc formula: there are at most $C
  N$ centers and the kernel and its first real derivative are bounded by $C$ and $C \| n \|$.
  Thus the cited estimate includes all derivative information used below.

#proof[
  The first division takes $F = - E$. Its mean vanishes by Lemma 14.
    Every nonzero divisor zero for a mode $\| n \| lt.eq N$ has reduced denominator at most $N$.
    At those centers with $\| t_j \| < d - 3 delta$, Equation (4.10) and $d_n \( t_j \) = 0$ give
  $ \| E_n \( t_j \) \| lt.eq C Q^B epsilon^2 e^(- \| n \| \( s - 10 delta \)) . $
  Apply Lemma 17 with
  $ \( j_0 \, nu \, a_(upright("buf")) \, b_(upright("buf")) \, J \) = \( 0 \, 1 \, 10 \, 3 \, 11 \) . $
  Denote the result by $H$. Then
  #[#set math.equation(numbering: n => "(4.20)")
   $ H = O_(upright(p)) \( epsilon \) quad upright("on ") cal(D)_11^(1 \/ 2) \, wide partial H + E =
     O_(upright(p)) \( epsilon^2 \) quad upright("on ") cal(D)_11^1 . $ <joint:first-division>]
  The extra polynomial factor multiplying $epsilon^2$ in the bound for $H$ is absorbed by the smallness
    requirement. Define
  #[#set math.equation(numbering: n => "(4.21)")
   $ b = a^(- 1) \( H + lambda \) \, wide lambda \( t \) = -
     frac(chevron.l a^(- 1) H chevron.r, chevron.l a^(- 1) chevron.r) . $ <joint:mean-correction>]
  The denominator stays away from zero, so $b$ has mean zero and is $O_(upright(p)) \( epsilon \)$ on
    $cal(D)_12^(1 \/ 2)$.
  Before dividing again, we need the compatibility of $b$ at its resonances.
    Fix a retained rational parameter $t_0$ with $\| t_0 \| < d - 14 delta$, and let $g =
    a partial w$ use the value and assigned jet from Lemma 16.
    For every retained nonzero mode, the exact first-division identity gives,
    as an identity of values and first jets at $t_0$,
  #[#set math.equation(numbering: n => "(4.22)")
   $ d_n \( H_n - g_n \) = - \( E + partial g \)_n - R_n . $ <joint:comparison>]
  The right-hand side and its first jet are bounded by $C Q^B epsilon^2 e^(- \| n \| \( s - 10 delta \))$,
    using both compatibility equations and (4.19).
  If $d_n \( t_0 \) eq.not 0$, reducedness of $t_0 \/ \( 2 pi \) = l \/ q$ gives
  $ \| sin \( pi n l \/ q \) \| gt.eq c \/ q \, wide \| d_n \( t_0 \) \|^(- 1) lt.eq C q \| t_0 \| . $
  If $d_n \( t_0 \) = 0$, then $\| d'_n \( t_0 \) \| = \| n \| \/ \| t_0 \|$,
    and differentiating (4.22) bounds the same difference $H_n - g_n$. Thus in both cases
  $ \| H_n \( t_0 \) - g_n \( t_0 \) \| lt.eq C Q^B epsilon^2 e^(- \| n \| \( s - 10 delta \)) . $
  This is the reason for the first-jet compatibility: the value equation alone would give no estimate for a
    resonant coefficient of $g$.
  The function $g$ has norm $O_(upright(p)) \( epsilon \)$ on $Y_10$.
    Its omitted Fourier tail on $Y_13$ is bounded by $C Q^B epsilon e^(- 3 N delta) =
    O_(upright(p)) \( epsilon^2 \)$. Summing the retained estimates on that smaller strip therefore gives
  $ H - \( g - g_0 \) = O_(upright(p)) \( epsilon^2 \) quad upright("on ") Y_13 . $
  Since $chevron.l a^(- 1) g chevron.r = chevron.l partial w chevron.r = 0$,
    the mean correction in (4.21) satisfies $lambda = g_0 + O_(upright(p)) \( epsilon^2 \)$. Hence
  #[#set math.equation(numbering: n => "(4.23)")
   $ b - partial w = O_(upright(p)) \( epsilon^2 \) quad upright("on ") Y_13 . $ <joint:second-compatibility>]
  At a zero of $d_n$, the coefficient $\( partial w \)_n$ vanishes.
    Equation (4.23) supplies the second division with its required Fourier values.
  Apply Lemma 17 to $F = b$, with
  $ \( j_0 \, nu \, a_(upright("buf")) \, b_(upright("buf")) \, J \) = \( 12 \, 1 \/ 2 \, 13 \, 15 \, 17 \) . $
  All its centers satisfy the comparison range $\| t_0 \| < d - 14 delta$. Its output $v$ satisfies
  #[#set math.equation(numbering: n => "(4.24)")
   $ v = O_(upright(p)) \( epsilon \) quad upright("on ") cal(D)_17^0 \, wide partial v - b =
     O_(upright(p)) \( epsilon^2 \) quad upright("on ") cal(D)_17^(1 \/ 2) . $ <joint:second-division>]
  Both divisions, multiplication by $a^(- 1)$, and the mean adjustment preserve parity and real symmetry.
  Since $a b = H + lambda \( t \)$ and $partial lambda = 0$, (4.20) and (4.24) yield
  $ E + partial \( a partial v \) = O_(upright(p)) \( epsilon^2 \) quad upright("on ") cal(D)_18^1 . $
  Here the remaining difference costs only a derivative and a domain loss, by $partial f =
    integral_(- 1 \/ 2)^(1 \/ 2) f' \( y + u t \, t \) thin #h(-0.16667em) upright(d) u$. Take $Delta V = V' v$.
    Cauchy estimates between indices 17 and 20 bound its first three $y$-derivatives by
    $O_(upright(p)) \( epsilon \)$. Equation (4.5) makes its linearized residual quadratic, because $\( E v \)' =
    O_(upright(p)) \( epsilon^2 \)$. The nonsingular Formula (4.7) gives
  $ E \( V + Delta V \) - E \( V \) - E_V \( Delta V \) = O_(upright(p)) \( epsilon^2 \) quad
    upright("on ") cal(D)_20^1 \, $
  including $t = 0$.
  The construction uses fixed numbers of matrix inversions, contractions, products and derivatives,
    two applications of Lemma 17, and fixed Cauchy losses. All dimension and resonance costs are bounded by powers
    of $N$, and all shrinking-domain costs by powers of $delta^(- 1)$.
    The action bounds are fixed before $d$ is shrunk. A single exponent $B_0$ and constant $C_0$ thus give
    (4.9)–(4.9) and absorb every smallness condition. This proves the Proposition with the asserted uniformity. ◻
]

=== 4.5 Initialization and convergence <initialization-and-convergence>

For any fixed integer $m gt.eq 1$, there are analytic periodic coefficients $v_1 \, dots.h \, v_m$ such that

#[#set math.equation(numbering: n => "(4.25)")
 $ V^(\( m \)) \( y \, t \) = y + sum_(j = 1)^m v_j \( y \) t^(2 j) \, wide E \( V^(\( m \)) \) =
   O \( t^(2 m + 2) \) . $ <joint:initializer>]

Here is the recursion, also given in #cite(label("NB")) Lemma 3.6.
  At order $t^(2 j)$, the new coefficient enters as $v''_j \/ 4$, by (4.4);
  all other terms depend on earlier coefficients. Their mean is zero by the mean-zero identity for $E$.
  Solve the periodic second-derivative equation, choosing $v_j$ of mean zero.
  Each fixed finite recursion uses only finitely many derivatives of functions holomorphic on the original open
  strip. Thus every such recursion is valid on one fixed smaller strip, with constants allowed to depend on $m$.
  Integration preserves holomorphy and real symmetry. In particular, on that fixed strip and for small $d_0$,

$ parallel E \( V^(\( m \)) \) parallel lt.eq C_m d_0^(2 m + 2) \, wide parallel V^(\( m \)) -
  y parallel_(C_y^3) lt.eq C_m d_0^2 . $

No bound uniform in $m$ is required.

#proof[
  Fix a sufficiently small $y$-width $s_0$; all constants in Proposition 15 are now fixed.
    Begin with (4.25) on radius $d_0 < s_0 \/ 4$, choosing $m$ and then $d_0$ below. At step $i$, take
  $ delta_i = 2^(- i) d_0 \/ 200 $
  and reduce both current radii by $20 delta_i$. Their limits satisfy $d_oo gt.eq 4 d_0 \/ 5$ and $s_oo gt.eq
    s_0 - d_0 \/ 5$. If the current residual norm is $epsilon_i > 0$, choose
  $ N_i = ⌈delta_i^(- 1) log \( 1 \/ epsilon_i \)⌉ . $
  If it vanishes, an exact solution has already been obtained.
    Every fixed power of $1 + log \( 1 \/ epsilon_i \)$ is bounded by a constant times $epsilon_i^(- 1 \/ 4)$.
    Thus, with one fixed enlarged exponent $B$, Proposition 15 gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ epsilon_(i + 1) & lt.eq C d_0^(- B) 2^(B i) epsilon_i^(7 \/ 4) \,\
parallel Delta V_i parallel_(C_y^3) & lt.eq C d_0^(- B) 2^(B i) epsilon_i^(3 \/ 4) $ <joint:error-iteration>]
  on the next domains, provided the polynomial smallness requirement holds.
  Choose $m$ so that $2 m + 2 > 4 B + 4$, and only then shrink $d_0$.
    The finite constant $C_m$ is thereby absorbed, giving the initial bound in the induction
  #[#set math.equation(numbering: n => "(4.27)")
   $ epsilon_i lt.eq d_0^(4 B + 4) 2^(- \( 4 B + 4 \) i) . $ <joint:majorant>]
  Indeed substituting this bound in (4.26) and dividing by the desired next bound gives at most
  $ C d_0^(2 B + 3) 2^(4 B + 4 - \( 2 B + 3 \) i) \, $
  which is at most one for small $d_0$. The correction bound becomes
  $ parallel Delta V_i parallel_(C_y^3) lt.eq C d_0^(2 B + 3) 2^(- \( 2 B + 3 \) i) . $
  These bounds both imply the polynomial smallness condition at every step and keep the candidates in their fixed
    smallness class: the initializer has slack and the total correction is arbitrarily small as $d_0 arrow.r 0$.
    The induction is therefore justified before each application of the Newton estimate.
    The order of choices is $B$, then $m$, then $d_0$.
  The corrections converge uniformly, with their first three $y$-derivatives, on the limiting domains.
    Their limit is holomorphic, real-symmetric, even in $t$, and periodic modulo $y$, with $V_y$ close to one.
    The residual tends to zero, so (4.1) holds wherever the two shifts remain in the limit domain.
    At $t = 0$, Equation (4.4) gives $V'' = 0$; periodicity gives $V \( y \, 0 \) = y + c$, with real $c$.
    Replacing $y$ by $y - c$ removes the constant and preserves the equation and all symmetries.
    Finally choose a smaller product neighborhood with enough $y$-margin for both shifts.
    This gives precisely the domain and conclusions stated in the Theorem. ◻
]

== 5 A physical collar of analytic caustics <sec:caustics>

We now pass from the joint solution of the stationarity equation to curves in the table.
  The essential point is that their support functions move strictly inward to first order in the parameter
  $lambda = t^2$. For phase-to-caustic correspondences under smoother initial foliations,
  compare #cite(label("Glutsyuk2024"), form: "prose") Section 2.7;
  the continuous phase leaves here require the preceding graph and analytic regularization arguments.

#thm([Proposition 5.1.])[
  #emph[There exist $lambda_0 > 0$ and a jointly real-analytic family
$ Gamma_lambda : bb(T) arrow.r bb(R)^2 \, wide 0 lt.eq lambda lt.eq lambda_0 \, $

 with the following properties. The zero leaf parametrizes $partial Omega$; each positive leaf is a smooth,
   simple, regular, strictly convex caustic contained in $Omega$; and the map
$ \( theta \, b \) mapsto Gamma_(b lambda_0) \( theta \) \, wide \( theta \, b \) in bb(T) times \[ 0 \, 1 \) \, $

 is a homeomorphism onto a relatively open neighborhood of $partial Omega$ in $overline(Omega)$.
   Joint real analyticity here means extension to a neighborhood of the closed parameter cylinder.]
] <prop:physical-collar>

#proof[
  Let $V$ be the function supplied by Theorem 13, and set
  #[#set math.equation(numbering: n => "(5.1)")
   $ Theta \( y \, t \) = phi.alt \( V \( y \, t \) \) \, wide p \( y \, t \) = -
     cal(S)_1 #scale(x: 120%, y: 120%)[\(] Theta \( y \, t \) \,
     Theta \( y + t \, t \) #scale(x: 120%, y: 120%)[\)] . $ <phys:line-family>]
  For real $y \, t$ sufficiently close to the zero-parameter circle, $Theta_y > 0$ and
  $ Theta \( y + 2 pi \, t \) = Theta \( y \, t \) + 2 pi . $
  The normalization in (3.2) changes a chain action only by a nonzero constant factor and a telescoping endpoint
    term. Consequently, the equation in Theorem 13 gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ cal(S)_1 #scale(x: 120%, y: 120%)[\(] Theta \( y \, t \) \,
     Theta \( y + t \, t \) #scale(x: 120%, y: 120%)[\)] + cal(S)_2 #scale(x: 120%, y: 120%)[\(]
     Theta \( y - t \, t \) \, Theta \( y \, t \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <phys:stationarity>]
  For sufficiently small $t > 0$, successive angles have positive small increments.
    The generating relation for the actual billiard map and (5.2), shifted once in $y$, therefore give
  #[#set math.equation(numbering: n => "(5.3)")
   $ T #scale(x: 120%, y: 120%)[\(] Theta \( y \, t \) \, p \( y \, t \) #scale(x: 120%, y: 120%)[\)] =
     #scale(x: 120%, y: 120%)[\(] Theta \( y + t \, t \) \, p \( y + t \, t \) #scale(x: 120%, y: 120%)[\)] .
     $ <phys:invariance>]
  In particular, these line states form an invariant graph, and the invariance is onto:
    the parameter map is the circle translation $y mapsto y + t$.
  Both functions in (5.1) are even in $t$. For $Theta$ this follows from the parity of $V$.
    For $p$, use antisymmetry of $cal(S)$ and (5.2):
  $ p \( y \, - t \) & = - cal(S)_1 #scale(x: 120%, y: 120%)[\(] Theta \( y \, t \) \,
    Theta \( y - t \, t \) #scale(x: 120%, y: 120%)[\)]\
 & = cal(S)_2 #scale(x: 120%, y: 120%)[\(] Theta \( y - t \, t \) \,
   Theta \( y \, t \) #scale(x: 120%, y: 120%)[\)] = p \( y \, t \) . $
  At $t = 0$, the generating relation gives $p \( y \, 0 \) = h \( Theta \( y \, 0 \) \)$.
    There is also a quantitative inward displacement. Put
  $ a \( y \, t \) = frac(Theta \( y + t \, t \) - Theta \( y \, t \), 2) . $
  The line-coordinate formula of Section 2, expanded at fixed $theta = Theta \( y \, t \)$, reads
  $ p = h \( theta + a \) cos a - h' \( theta + a \) sin a = h \( theta \) - 1 / 2 r \( theta \) a^2 + O \( a^3 \) . $
  Since $a \( y \, t \) = 1 / 2 Theta_y \( y \, 0 \) t + O \( t^2 \)$, and the displacement $h \( Theta \) -
    p$ is even and analytic in $t$, this implies
  #[#set math.equation(numbering: n => "(5.4)")
   $ h \( Theta \( y \, t \) \) - p \( y \, t \) = 1 / 8 r \( Theta \( y \, 0 \) \) Theta_y \( y \, 0 \)^2 t^2 +
     O \( t^4 \) . $ <phys:inward-expansion>]
  The expansion and its derivatives are uniform on the real circle.
  An even holomorphic function of $t$ is holomorphic in $lambda = t^2$ near zero,
    as is seen from its convergent power series. Write the resulting functions as $hat(Theta) \( y \, lambda \)$
    and $hat(p) \( y \, lambda \)$. The analytic inverse function theorem, positivity of $hat(Theta)_y$,
    and degree one give a jointly real-analytic angular inverse $y = Y \( theta \, lambda \)$,
    with its natural $2 pi$-equivariance. Compactness of the circle makes the parameter neighborhood uniform.
    Define the periodic function
  $ g \( theta \, lambda \) = hat(p) \( Y \( theta \, lambda \) \, lambda \) . $
  It is the support candidate for the graph in (5.3). In particular, $g \( theta \, 0 \) = h \( theta \)$.
    Substituting the angular inverse in (5.4) gives, now at fixed $theta$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ g \( theta \, lambda \) = h \( theta \) - c \( theta \) lambda + O \( lambda^2 \) \, wide c \( theta \) = 1 /
     8 r \( theta \) Theta_y \( Y \( theta \, 0 \) \, 0 \)^2 > 0 . $ <phys:fixed-angle-expansion>]
  Thus no change of angle can remove the strict inward derivative.
    Choose $lambda_0 > 0$ strictly inside the common analytic parameter neighborhood.
    Decreasing it if necessary, we may arrange on the entire closed cylinder $0 lt.eq lambda lt.eq lambda_0$ that
  #[#set math.equation(numbering: n => "(5.6)")
   $ g > 0 \, wide rho := g + g_(theta theta) > 0 \, wide g_lambda lt.eq - c_0 < 0 \, $ <phys:support-inequalities>]
  where $c_0$ is a constant. The first two inequalities follow from $h > 0$ and $r = h + h'' > 0$,
    and the third from (5.5).
  For each $lambda$ define
  #[#set math.equation(numbering: n => "(5.7)")
   $ K_lambda & = ⋂_(theta in bb(T)) { z in bb(R)^2 : z dot.op n_theta lt.eq g \( theta \, lambda \) } \,\
Gamma_lambda \( theta \) & = g \( theta \, lambda \) n_theta +
  g_theta \( theta \, lambda \) e_theta . $ <phys:body-and-boundary>]
  Figure 1 illustrates this construction: a point of the line graph specifies a support line,
    and the formula for $Gamma_lambda$ gives its contact point.
    We next verify that these formal envelopes are the boundaries of the bodies $K_lambda$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (4.55, 0), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.55, 0), [#text(size: 9pt)[$theta$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 2.7), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 2.7), [#text(size: 9pt)[$p$]], anchor: "south", padding: 0.1176cm)
  line((4, 0.3), (4, 2.45), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dotted"))
  bezier((0, 1.6), (0.05, 1.605), (0, 1.6), (0.03613, 1.602), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.05, 1.605), (0.1, 1.621), (0.06388, 1.608), (0.08613, 1.615), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.1, 1.621), (0.15, 1.646), (0.1139, 1.626), (0.1361, 1.638), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.15, 1.646), (0.2, 1.679), (0.1639, 1.654), (0.1861, 1.669), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.2, 1.679), (0.25, 1.72), (0.2139, 1.69), (0.2361, 1.708), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.25, 1.72), (0.3, 1.767), (0.2639, 1.733), (0.2861, 1.754), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.3, 1.767), (0.35, 1.818), (0.3139, 1.781), (0.3361, 1.804), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.35, 1.818), (0.4, 1.872), (0.3639, 1.833), (0.3861, 1.857), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.4, 1.872), (0.45, 1.927), (0.4139, 1.887), (0.4361, 1.911), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.45, 1.927), (0.5, 1.981), (0.4639, 1.942), (0.4861, 1.966), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.5, 1.981), (0.55, 2.034), (0.5139, 1.996), (0.5361, 2.02), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.55, 2.034), (0.6, 2.085), (0.5639, 2.049), (0.5861, 2.071), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.6, 2.085), (0.65, 2.132), (0.6139, 2.098), (0.6361, 2.119), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.65, 2.132), (0.7, 2.174), (0.6639, 2.144), (0.6861, 2.163), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.7, 2.174), (0.75, 2.211), (0.7139, 2.185), (0.7361, 2.202), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.75, 2.211), (0.8, 2.243), (0.7639, 2.221), (0.7861, 2.235), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.8, 2.243), (0.85, 2.267), (0.8139, 2.25), (0.8361, 2.261), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.85, 2.267), (0.9, 2.285), (0.8639, 2.273), (0.8861, 2.281), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.9, 2.285), (0.95, 2.296), (0.9139, 2.289), (0.9361, 2.294), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.95, 2.296), (1, 2.3), (0.9639, 2.298), (0.9861, 2.3), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1, 2.3), (1.05, 2.296), (1.014, 2.3), (1.036, 2.298), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.05, 2.296), (1.1, 2.285), (1.064, 2.294), (1.086, 2.289), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.1, 2.285), (1.15, 2.267), (1.114, 2.281), (1.136, 2.273), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.15, 2.267), (1.2, 2.243), (1.164, 2.261), (1.186, 2.25), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.2, 2.243), (1.25, 2.211), (1.214, 2.235), (1.236, 2.221), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.25, 2.211), (1.3, 2.174), (1.264, 2.202), (1.286, 2.185), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.3, 2.174), (1.35, 2.132), (1.314, 2.163), (1.336, 2.144), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.35, 2.132), (1.4, 2.085), (1.364, 2.119), (1.386, 2.098), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.4, 2.085), (1.45, 2.034), (1.414, 2.071), (1.436, 2.049), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.45, 2.034), (1.5, 1.981), (1.464, 2.02), (1.486, 1.996), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.5, 1.981), (1.55, 1.927), (1.514, 1.966), (1.536, 1.942), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.55, 1.927), (1.6, 1.872), (1.564, 1.911), (1.586, 1.887), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.6, 1.872), (1.65, 1.818), (1.614, 1.857), (1.636, 1.833), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.65, 1.818), (1.7, 1.767), (1.664, 1.804), (1.686, 1.781), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.7, 1.767), (1.75, 1.72), (1.714, 1.754), (1.736, 1.733), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.75, 1.72), (1.8, 1.679), (1.764, 1.708), (1.786, 1.69), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.8, 1.679), (1.85, 1.646), (1.814, 1.669), (1.836, 1.654), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.85, 1.646), (1.9, 1.621), (1.864, 1.638), (1.886, 1.626), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.9, 1.621), (1.95, 1.605), (1.914, 1.615), (1.936, 1.608), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.95, 1.605), (2, 1.6), (1.964, 1.602), (1.986, 1.6), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2, 1.6), (2.05, 1.605), (2.014, 1.6), (2.036, 1.602), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.05, 1.605), (2.1, 1.621), (2.064, 1.608), (2.086, 1.615), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.1, 1.621), (2.15, 1.646), (2.114, 1.626), (2.136, 1.638), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.15, 1.646), (2.2, 1.679), (2.164, 1.654), (2.186, 1.669), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.2, 1.679), (2.25, 1.72), (2.214, 1.69), (2.236, 1.708), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.25, 1.72), (2.3, 1.767), (2.264, 1.733), (2.286, 1.754), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.3, 1.767), (2.35, 1.818), (2.314, 1.781), (2.336, 1.804), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.35, 1.818), (2.4, 1.872), (2.364, 1.833), (2.386, 1.857), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.4, 1.872), (2.45, 1.927), (2.414, 1.887), (2.436, 1.911), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.45, 1.927), (2.5, 1.981), (2.464, 1.942), (2.486, 1.966), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.5, 1.981), (2.55, 2.034), (2.514, 1.996), (2.536, 2.02), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.55, 2.034), (2.6, 2.085), (2.564, 2.049), (2.586, 2.071), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.6, 2.085), (2.65, 2.132), (2.614, 2.098), (2.636, 2.119), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.65, 2.132), (2.7, 2.174), (2.664, 2.144), (2.686, 2.163), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.7, 2.174), (2.75, 2.211), (2.714, 2.185), (2.736, 2.202), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.75, 2.211), (2.8, 2.243), (2.764, 2.221), (2.786, 2.235), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.8, 2.243), (2.85, 2.267), (2.814, 2.25), (2.836, 2.261), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.85, 2.267), (2.9, 2.285), (2.864, 2.273), (2.886, 2.281), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.9, 2.285), (2.95, 2.296), (2.914, 2.289), (2.936, 2.294), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.95, 2.296), (3, 2.3), (2.964, 2.298), (2.986, 2.3), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3, 2.3), (3.05, 2.296), (3.014, 2.3), (3.036, 2.298), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.05, 2.296), (3.1, 2.285), (3.064, 2.294), (3.086, 2.289), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.1, 2.285), (3.15, 2.267), (3.114, 2.281), (3.136, 2.273), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.15, 2.267), (3.2, 2.243), (3.164, 2.261), (3.186, 2.25), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.2, 2.243), (3.25, 2.211), (3.214, 2.235), (3.236, 2.221), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.25, 2.211), (3.3, 2.174), (3.264, 2.202), (3.286, 2.185), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.3, 2.174), (3.35, 2.132), (3.314, 2.163), (3.336, 2.144), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.35, 2.132), (3.4, 2.085), (3.364, 2.119), (3.386, 2.098), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.4, 2.085), (3.45, 2.034), (3.414, 2.071), (3.436, 2.049), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.45, 2.034), (3.5, 1.981), (3.464, 2.02), (3.486, 1.996), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.5, 1.981), (3.55, 1.927), (3.514, 1.966), (3.536, 1.942), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.55, 1.927), (3.6, 1.872), (3.564, 1.911), (3.586, 1.887), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.6, 1.872), (3.65, 1.818), (3.614, 1.857), (3.636, 1.833), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.65, 1.818), (3.7, 1.767), (3.664, 1.804), (3.686, 1.781), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.7, 1.767), (3.75, 1.72), (3.714, 1.754), (3.736, 1.733), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.75, 1.72), (3.8, 1.679), (3.764, 1.708), (3.786, 1.69), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.8, 1.679), (3.85, 1.646), (3.814, 1.669), (3.836, 1.654), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.85, 1.646), (3.9, 1.621), (3.864, 1.638), (3.886, 1.626), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.9, 1.621), (3.95, 1.605), (3.914, 1.615), (3.936, 1.608), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.95, 1.605), (4, 1.6), (3.964, 1.602), (4, 1.6), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0, 1.269), (0.05, 1.275), (0, 1.269), (0.03613, 1.272), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.05, 1.275), (0.1, 1.295), (0.06388, 1.279), (0.08613, 1.288), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.1, 1.295), (0.15, 1.326), (0.1139, 1.302), (0.1361, 1.316), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.15, 1.326), (0.2, 1.368), (0.1639, 1.336), (0.1861, 1.355), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.2, 1.368), (0.25, 1.418), (0.2139, 1.38), (0.2361, 1.403), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.25, 1.418), (0.3, 1.474), (0.2639, 1.432), (0.2861, 1.458), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.3, 1.474), (0.35, 1.535), (0.3139, 1.49), (0.3361, 1.518), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.35, 1.535), (0.4, 1.598), (0.3639, 1.552), (0.3861, 1.58), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.4, 1.598), (0.45, 1.662), (0.4139, 1.616), (0.4361, 1.644), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.45, 1.662), (0.5, 1.725), (0.4639, 1.679), (0.4861, 1.708), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.5, 1.725), (0.55, 1.786), (0.5139, 1.742), (0.5361, 1.769), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.55, 1.786), (0.6, 1.843), (0.5639, 1.802), (0.5861, 1.828), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.6, 1.843), (0.65, 1.896), (0.6139, 1.858), (0.6361, 1.882), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.65, 1.896), (0.7, 1.944), (0.6639, 1.91), (0.6861, 1.931), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.7, 1.944), (0.75, 1.985), (0.7139, 1.956), (0.7361, 1.974), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.75, 1.985), (0.8, 2.02), (0.7639, 1.996), (0.7861, 2.011), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.8, 2.02), (0.85, 2.047), (0.8139, 2.028), (0.8361, 2.041), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.85, 2.047), (0.9, 2.067), (0.8639, 2.054), (0.8861, 2.063), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.9, 2.067), (0.95, 2.079), (0.9139, 2.072), (0.9361, 2.077), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0.95, 2.079), (1, 2.083), (0.9639, 2.081), (0.9861, 2.083), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1, 2.083), (1.05, 2.079), (1.014, 2.083), (1.036, 2.081), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.05, 2.079), (1.1, 2.067), (1.064, 2.077), (1.086, 2.072), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.1, 2.067), (1.15, 2.047), (1.114, 2.063), (1.136, 2.054), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.15, 2.047), (1.2, 2.02), (1.164, 2.041), (1.186, 2.028), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.2, 2.02), (1.25, 1.985), (1.214, 2.011), (1.236, 1.996), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.25, 1.985), (1.3, 1.944), (1.264, 1.974), (1.286, 1.956), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.3, 1.944), (1.35, 1.896), (1.314, 1.931), (1.336, 1.91), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.35, 1.896), (1.4, 1.843), (1.364, 1.882), (1.386, 1.858), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.4, 1.843), (1.45, 1.786), (1.414, 1.828), (1.436, 1.802), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.45, 1.786), (1.5, 1.725), (1.464, 1.769), (1.486, 1.742), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.5, 1.725), (1.55, 1.662), (1.514, 1.708), (1.536, 1.679), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.55, 1.662), (1.6, 1.598), (1.564, 1.644), (1.586, 1.616), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.6, 1.598), (1.65, 1.535), (1.614, 1.58), (1.636, 1.552), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.65, 1.535), (1.7, 1.474), (1.664, 1.518), (1.686, 1.49), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.7, 1.474), (1.75, 1.418), (1.714, 1.458), (1.736, 1.432), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.75, 1.418), (1.8, 1.368), (1.764, 1.403), (1.786, 1.38), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.8, 1.368), (1.85, 1.326), (1.814, 1.355), (1.836, 1.336), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.85, 1.326), (1.9, 1.295), (1.864, 1.316), (1.886, 1.302), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.9, 1.295), (1.95, 1.275), (1.914, 1.288), (1.936, 1.279), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((1.95, 1.275), (2, 1.269), (1.964, 1.272), (1.986, 1.269), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2, 1.269), (2.05, 1.275), (2.014, 1.269), (2.036, 1.272), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.05, 1.275), (2.1, 1.295), (2.064, 1.279), (2.086, 1.288), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.1, 1.295), (2.15, 1.326), (2.114, 1.302), (2.136, 1.316), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.15, 1.326), (2.2, 1.368), (2.164, 1.336), (2.186, 1.355), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.2, 1.368), (2.25, 1.418), (2.214, 1.38), (2.236, 1.403), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.25, 1.418), (2.3, 1.474), (2.264, 1.432), (2.286, 1.458), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.3, 1.474), (2.35, 1.535), (2.314, 1.49), (2.336, 1.518), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.35, 1.535), (2.4, 1.598), (2.364, 1.552), (2.386, 1.58), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.4, 1.598), (2.45, 1.662), (2.414, 1.616), (2.436, 1.644), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.45, 1.662), (2.5, 1.725), (2.464, 1.679), (2.486, 1.708), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.5, 1.725), (2.55, 1.786), (2.514, 1.742), (2.536, 1.769), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.55, 1.786), (2.6, 1.843), (2.564, 1.802), (2.586, 1.828), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.6, 1.843), (2.65, 1.896), (2.614, 1.858), (2.636, 1.882), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.65, 1.896), (2.7, 1.944), (2.664, 1.91), (2.686, 1.931), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.7, 1.944), (2.75, 1.985), (2.714, 1.956), (2.736, 1.974), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.75, 1.985), (2.8, 2.02), (2.764, 1.996), (2.786, 2.011), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.8, 2.02), (2.85, 2.047), (2.814, 2.028), (2.836, 2.041), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.85, 2.047), (2.9, 2.067), (2.864, 2.054), (2.886, 2.063), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.9, 2.067), (2.95, 2.079), (2.914, 2.072), (2.936, 2.077), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((2.95, 2.079), (3, 2.083), (2.964, 2.081), (2.986, 2.083), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3, 2.083), (3.05, 2.079), (3.014, 2.083), (3.036, 2.081), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.05, 2.079), (3.1, 2.067), (3.064, 2.077), (3.086, 2.072), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.1, 2.067), (3.15, 2.047), (3.114, 2.063), (3.136, 2.054), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.15, 2.047), (3.2, 2.02), (3.164, 2.041), (3.186, 2.028), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.2, 2.02), (3.25, 1.985), (3.214, 2.011), (3.236, 1.996), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.25, 1.985), (3.3, 1.944), (3.264, 1.974), (3.286, 1.956), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.3, 1.944), (3.35, 1.896), (3.314, 1.931), (3.336, 1.91), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.35, 1.896), (3.4, 1.843), (3.364, 1.882), (3.386, 1.858), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.4, 1.843), (3.45, 1.786), (3.414, 1.828), (3.436, 1.802), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.45, 1.786), (3.5, 1.725), (3.464, 1.769), (3.486, 1.742), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.5, 1.725), (3.55, 1.662), (3.514, 1.708), (3.536, 1.679), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.55, 1.662), (3.6, 1.598), (3.564, 1.644), (3.586, 1.616), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.6, 1.598), (3.65, 1.535), (3.614, 1.58), (3.636, 1.552), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.65, 1.535), (3.7, 1.474), (3.664, 1.518), (3.686, 1.49), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.7, 1.474), (3.75, 1.418), (3.714, 1.458), (3.736, 1.432), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.75, 1.418), (3.8, 1.368), (3.764, 1.403), (3.786, 1.38), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.8, 1.368), (3.85, 1.326), (3.814, 1.355), (3.836, 1.336), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.85, 1.326), (3.9, 1.295), (3.864, 1.316), (3.886, 1.302), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.9, 1.295), (3.95, 1.275), (3.914, 1.288), (3.936, 1.279), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((3.95, 1.275), (4, 1.269), (3.964, 1.272), (4, 1.269), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((0, 0.9539), (0.05, 0.9627), (0, 0.9539), (0.03613, 0.9579), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.05, 0.9627), (0.1, 0.9883), (0.06388, 0.9675), (0.08613, 0.9791), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.1, 0.9883), (0.15, 1.029), (0.1139, 0.9975), (0.1361, 1.016), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.15, 1.029), (0.2, 1.082), (0.1639, 1.042), (0.1861, 1.066), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.2, 1.082), (0.25, 1.144), (0.2139, 1.098), (0.2361, 1.126), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.25, 1.144), (0.3, 1.214), (0.2639, 1.163), (0.2861, 1.194), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.3, 1.214), (0.35, 1.287), (0.3139, 1.233), (0.3361, 1.266), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.35, 1.287), (0.4, 1.361), (0.3639, 1.307), (0.3861, 1.341), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.4, 1.361), (0.45, 1.436), (0.4139, 1.382), (0.4361, 1.415), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.45, 1.436), (0.5, 1.508), (0.4639, 1.456), (0.4861, 1.489), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.5, 1.508), (0.55, 1.578), (0.5139, 1.528), (0.5361, 1.559), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.55, 1.578), (0.6, 1.642), (0.5639, 1.596), (0.5861, 1.625), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.6, 1.642), (0.65, 1.701), (0.6139, 1.659), (0.6361, 1.686), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.65, 1.701), (0.7, 1.754), (0.6639, 1.717), (0.6861, 1.741), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.7, 1.754), (0.75, 1.8), (0.7139, 1.768), (0.7361, 1.788), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.75, 1.8), (0.8, 1.838), (0.7639, 1.812), (0.7861, 1.829), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.8, 1.838), (0.85, 1.868), (0.8139, 1.848), (0.8361, 1.861), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.85, 1.868), (0.9, 1.89), (0.8639, 1.876), (0.8861, 1.885), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.9, 1.89), (0.95, 1.903), (0.9139, 1.895), (0.9361, 1.901), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((0.95, 1.903), (1, 1.908), (0.9639, 1.906), (0.9861, 1.908), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1, 1.908), (1.05, 1.903), (1.014, 1.908), (1.036, 1.906), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.05, 1.903), (1.1, 1.89), (1.064, 1.901), (1.086, 1.895), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.1, 1.89), (1.15, 1.868), (1.114, 1.885), (1.136, 1.876), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.15, 1.868), (1.2, 1.838), (1.164, 1.861), (1.186, 1.848), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.2, 1.838), (1.25, 1.8), (1.214, 1.829), (1.236, 1.812), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.25, 1.8), (1.3, 1.754), (1.264, 1.788), (1.286, 1.768), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.3, 1.754), (1.35, 1.701), (1.314, 1.741), (1.336, 1.717), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.35, 1.701), (1.4, 1.642), (1.364, 1.686), (1.386, 1.659), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.4, 1.642), (1.45, 1.578), (1.414, 1.625), (1.436, 1.596), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.45, 1.578), (1.5, 1.508), (1.464, 1.559), (1.486, 1.528), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.5, 1.508), (1.55, 1.436), (1.514, 1.489), (1.536, 1.456), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.55, 1.436), (1.6, 1.361), (1.564, 1.415), (1.586, 1.382), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.6, 1.361), (1.65, 1.287), (1.614, 1.341), (1.636, 1.307), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.65, 1.287), (1.7, 1.214), (1.664, 1.266), (1.686, 1.233), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.7, 1.214), (1.75, 1.144), (1.714, 1.194), (1.736, 1.163), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.75, 1.144), (1.8, 1.082), (1.764, 1.126), (1.786, 1.098), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.8, 1.082), (1.85, 1.029), (1.814, 1.066), (1.836, 1.042), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.85, 1.029), (1.9, 0.9883), (1.864, 1.016), (1.886, 0.9975), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.9, 0.9883), (1.95, 0.9627), (1.914, 0.9791), (1.936, 0.9675), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((1.95, 0.9627), (2, 0.9539), (1.964, 0.9579), (1.986, 0.9539), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2, 0.9539), (2.05, 0.9627), (2.014, 0.9539), (2.036, 0.9579), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.05, 0.9627), (2.1, 0.9883), (2.064, 0.9675), (2.086, 0.9791), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.1, 0.9883), (2.15, 1.029), (2.114, 0.9975), (2.136, 1.016), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.15, 1.029), (2.2, 1.082), (2.164, 1.042), (2.186, 1.066), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.2, 1.082), (2.25, 1.144), (2.214, 1.098), (2.236, 1.126), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.25, 1.144), (2.3, 1.214), (2.264, 1.163), (2.286, 1.194), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.3, 1.214), (2.35, 1.287), (2.314, 1.233), (2.336, 1.266), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.35, 1.287), (2.4, 1.361), (2.364, 1.307), (2.386, 1.341), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.4, 1.361), (2.45, 1.436), (2.414, 1.382), (2.436, 1.415), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.45, 1.436), (2.5, 1.508), (2.464, 1.456), (2.486, 1.489), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.5, 1.508), (2.55, 1.578), (2.514, 1.528), (2.536, 1.559), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.55, 1.578), (2.6, 1.642), (2.564, 1.596), (2.586, 1.625), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.6, 1.642), (2.65, 1.701), (2.614, 1.659), (2.636, 1.686), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.65, 1.701), (2.7, 1.754), (2.664, 1.717), (2.686, 1.741), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.7, 1.754), (2.75, 1.8), (2.714, 1.768), (2.736, 1.788), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.75, 1.8), (2.8, 1.838), (2.764, 1.812), (2.786, 1.829), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.8, 1.838), (2.85, 1.868), (2.814, 1.848), (2.836, 1.861), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.85, 1.868), (2.9, 1.89), (2.864, 1.876), (2.886, 1.885), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.9, 1.89), (2.95, 1.903), (2.914, 1.895), (2.936, 1.901), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((2.95, 1.903), (3, 1.908), (2.964, 1.906), (2.986, 1.908), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3, 1.908), (3.05, 1.903), (3.014, 1.908), (3.036, 1.906), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.05, 1.903), (3.1, 1.89), (3.064, 1.901), (3.086, 1.895), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.1, 1.89), (3.15, 1.868), (3.114, 1.885), (3.136, 1.876), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.15, 1.868), (3.2, 1.838), (3.164, 1.861), (3.186, 1.848), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.2, 1.838), (3.25, 1.8), (3.214, 1.829), (3.236, 1.812), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.25, 1.8), (3.3, 1.754), (3.264, 1.788), (3.286, 1.768), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.3, 1.754), (3.35, 1.701), (3.314, 1.741), (3.336, 1.717), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.35, 1.701), (3.4, 1.642), (3.364, 1.686), (3.386, 1.659), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.4, 1.642), (3.45, 1.578), (3.414, 1.625), (3.436, 1.596), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.45, 1.578), (3.5, 1.508), (3.464, 1.559), (3.486, 1.528), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.5, 1.508), (3.55, 1.436), (3.514, 1.489), (3.536, 1.456), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.55, 1.436), (3.6, 1.361), (3.564, 1.415), (3.586, 1.382), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.6, 1.361), (3.65, 1.287), (3.614, 1.341), (3.636, 1.307), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.65, 1.287), (3.7, 1.214), (3.664, 1.266), (3.686, 1.233), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.7, 1.214), (3.75, 1.144), (3.714, 1.194), (3.736, 1.163), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.75, 1.144), (3.8, 1.082), (3.764, 1.126), (3.786, 1.098), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.8, 1.082), (3.85, 1.029), (3.814, 1.066), (3.836, 1.042), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.85, 1.029), (3.9, 0.9883), (3.864, 1.016), (3.886, 0.9975), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.9, 0.9883), (3.95, 0.9627), (3.914, 0.9791), (3.936, 0.9675), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  bezier((3.95, 0.9627), (4, 0.9539), (3.964, 0.9579), (4, 0.9539), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  content((4.08, 1.66), [#text(size: 9pt)[$h$]], anchor: "west", padding: 0.1176cm)
  content((4.08, 1.25), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$g( dot.op , lambda )$]]], anchor: "west", padding: 0.1176cm)
  line((1.667, 0), (1.667, 1.514), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dotted"))
  circle((1.667, 1.514), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((1.667, 0), [#text(size: 9pt)[$theta_0$]], anchor: "north", padding: 0.1176cm)
  content((2, -0.63), [#text(size: 9pt)[analytic invariant line graphs]])
  line((5.35, 1.95), (6.45, 1.95), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.9, 2.45), [#text(size: 7pt)[support#linebreak()envelope]])
  circle((9.15, 1.4), radius: (1.955, 1.36), stroke: (thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((9.15, 1.4), radius: (1.771, 1.079), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((9.15, 1.4), radius: (1.622, 0.8109), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  line((11.41, 1.583), (9.329, 2.783), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  circle((10.37, 2.183), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  line((10.37, 2.183), (11.42, 2.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dotted"))
  content((11.5, 2.25), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$Gamma_ lambda ( theta_0)$]]], anchor: "west", padding: 0.1176cm)
  content((10, 2.96), [#text(fill: rgb("#0000a6"))[#text(size: 7pt)[$z dot.op n_( theta_0)=g( theta_0, lambda )$]]], anchor: "south", padding: 0.1176cm)
  line((9.15, 1.4), (9.49, 1.99), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((9.49, 1.99), [#text(size: 9pt)[$n_( theta_0)$]], anchor: "west", padding: 0.1176cm)
  content((10.8, 0.47), [#text(size: 9pt)[$partial Omega$]], anchor: "west", padding: 0.1176cm)
  content((9.25, -0.63), [#text(size: 9pt)[nested support envelopes]])
})],
    caption: [Figure 1: The support-envelope correspondence, drawn schematically. The highlighted point of $p = g \( theta \, lambda \)$ specifies the blue tangent line on the right; its contact point is $Gamma_lambda \( theta_0 \) = g n_(theta_0) + g_theta e_(theta_0)$, with $g$ and $g_theta$ evaluated at $\( theta_0 \, lambda \)$. Positive $g + g_(theta theta)$ makes each envelope strictly convex, and $g_lambda < 0$ makes the family strictly nested. ],
  ) <fig:phase-to-caustic>
  Each $K_lambda$ is a compact convex body with nonempty interior:
    it contains a disk about the origin of radius $min_theta g \( theta \, lambda \) > 0$,
    and the constraint with normal $z \/ \| z \|$ bounds $\| z \|$ by $max_theta g \( theta \, lambda \)$.
    Moreover $K_0 = overline(Omega)$, by the definition of $h$.
  We verify directly that $Gamma_lambda$ is the whole boundary and has support function
    $g \( dot.op \, lambda \)$. Differentiation gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ Gamma'_lambda \( theta \) = rho \( theta \, lambda \) e_theta . $ <phys:normal-parametrization>]
  For a fixed angle $alpha$,
  $ frac(#h(-0.16667em) upright(d), #h(-0.16667em) upright(d) theta) #scale(x: 120%, y: 120%)[\(]
    Gamma_lambda \( theta \) dot.op n_alpha #scale(x: 120%, y: 120%)[\)] =
    rho \( theta \, lambda \) sin \( alpha - theta \) . $
  This projection has its unique maximum, modulo $2 pi$, at $theta = alpha$,
    where its value is $g \( alpha \, lambda \)$. Hence every point $Gamma_lambda \( theta \)$ satisfies all the
    constraints defining $K_lambda$, with equality for its own normal, and belongs to $partial K_lambda$.
  Conversely, let $z in partial K_lambda$. The continuous nonnegative function $g \( theta \, lambda \) -
    z dot.op n_theta$ must vanish somewhere: a positive minimum would place a disk about $z$ inside $K_lambda$.
    At a zero $alpha$, its derivative also vanishes. Thus
  $ z dot.op n_alpha = g \( alpha \, lambda \) \, wide z dot.op e_alpha = g_theta \( alpha \, lambda \) \, $
  which gives $z = Gamma_lambda \( alpha \)$. The unique-maximum property proves that this parametrization is
    one-to-one on $bb(T)$; (5.8) makes it regular. Each support line has exactly one contact point,
    so the boundary contains no nontrivial line segment and the body is strictly convex.
    In fact its curvature is $1 \/ rho > 0$. All these curves are real analytic.
  The last inequality in (5.6) gives, for $0 lt.eq lambda < mu lt.eq lambda_0$,
  $ g \( theta \, mu \) lt.eq g \( theta \, lambda \) - c_0 \( mu - lambda \) quad upright("for every ") theta . $
  It follows that $K_mu$ is contained in the interior of $K_lambda$, with a uniform positive gap between them.
    In particular the boundaries are pairwise disjoint, and $Gamma_lambda subset Omega$ for $lambda > 0$.
  The positively oriented tangent at $Gamma_lambda \( theta \)$ has velocity $e_theta$ and line equation $z dot.op
    n_theta = g \( theta \, lambda \)$. For $lambda > 0$ these are precisely the line states in (5.3), with $t =
    sqrt(lambda)$. They meet $Omega$, because their contact points lie in its interior.
    The onto invariance in (5.3) therefore preserves tangency under both $T$ and $T^(- 1)$.
    It supplies the tangent successor segment at the forward endpoint and the tangent predecessor segment at the
    back endpoint. Reflection is a linear involution: if $v'$ is the reflection of $v$, then $-
    v$ is the reflection of $- v'$. Reversing each such pair of segments proves tangency preservation for the
    opposite orientation as well. Thus every positive leaf is a smooth closed convex caustic,
    with the required reflection property at either endpoint.
  It remains to show that these curves fill a physical collar. The map
  $ F : bb(T) times \[ 0 \, lambda_0 \] arrow.r overline(Omega) \, wide F \( theta \, lambda \) =
    Gamma_lambda \( theta \) \, $
  is continuous and injective, by simplicity of the curves and strict nesting.
    Since its domain is compact, it is a homeomorphism onto its image. Set
  $ A = K_0 \\ K_(lambda_0) . $
  This is relatively open in $K_0 = overline(Omega)$ and contains $partial Omega$.
    All leaves with $lambda < lambda_0$ lie in $A$. For the converse,
    fix $z in A$ and consider its minimum support slack
  $ m_z \( lambda \) = min_(theta in bb(T)) #scale(x: 120%, y: 120%)[\(] g \( theta \, lambda \) -
    z dot.op n_theta #scale(x: 120%, y: 120%)[\)] . $
  This function is continuous, satisfies $m_z \( 0 \) gt.eq 0 > m_z \( lambda_0 \)$, and obeys
  $ m_z \( mu \) lt.eq m_z \( lambda \) - c_0 \( mu - lambda \) wide \( mu > lambda \) . $
  It has exactly one zero in $\[ 0 \, lambda_0 \)$. At that zero, $z in partial K_lambda$, hence $z =
    Gamma_lambda \( theta \)$ for exactly one $theta$. The restriction of $F$ to $bb(T)
    times \[ 0 \, lambda_0 \)$ is therefore a homeomorphism onto $A$.
    Rescaling $lambda = b lambda_0$ completes the proof. ◻
]

#proof[
  Theorem 7 proves that the billiard boundary is real analytic.
    Theorem 13 and Proposition 18 give the asserted jointly real-analytic family of strictly convex caustics and
    its full physical collar. ◻
]

#proof[
  Proposition 18 gives exactly the continuous caustic collar of #cite(label("NB")) Definition 1.1:
    the boundary is the zero leaf, the positive leaves are smooth closed convex caustics,
    and the family parametrizes a relatively open neighborhood of the boundary in the closed table.
    The original assumptions supply the remaining smoothness, strict convexity, and positive curvature hypotheses.
    Theorem 2, namely #cite(label("NB")) Theorem 1.2, therefore implies that $Omega$ is an ellipse.
    Undoing the initial translation gives a center $c in bb(R)^2$ and a real symmetric positive-definite matrix $Q$ with
  $ Omega = { x in bb(R)^2 : \( x - c \)^T Q \( x - c \) < 1 } \, $
  as required. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
