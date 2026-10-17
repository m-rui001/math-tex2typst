#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[An explicit exact Hausdorff gauge for SLE \
A regular formula from quantitative tails and dense visits]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

A random curve whose dimension lies strictly between one and two requires a finer notion of length than arc length. A dimension theorem specifies the critical power of a small covering diameter, but that power alone need not give a nonzero measure. For ordinary chordal $upright("SLE")_kappa$, $0 < kappa < 8$, Beffara identified the dimension $d = 1 + kappa \/ 8$ #cite(label("beffara2008")) main Theorem; Rezaei proved that its $d$-dimensional Hausdorff measure is zero #cite(label("rezaei2018")) Theorem 1.1. The remaining question concerns the correction to the critical power, not a further change of dimension.

A #emph[gauge] is a continuous nondecreasing function $h : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ with $h \( 0 \) = 0$ and $h \( r \) > 0$ for $r > 0$. Its Hausdorff measure, in the diameter convention used here, is

$ cal(H)^h \( E \) = lim_(delta arrow.b 0) inf {sum_j h \( "diam" U_j \) : E subset union.big_j U_j \, quad "diam" U_j lt.eq delta} \, quad "(1.1)" $ <eq:hausdorff-definition>

where covers are countable. We write $cal(H)_delta^h$ for the infimum at a fixed cutoff. We seek a deterministic gauge that gives positive finite measure to each nontrivial compact trace segment. Hausdorff measure optimizes over spatial covers; ordered partitions of a parametrized curve lead to a different notion of length.

Schramm asked for a sigma-finite Hausdorff measure of the SLE trace and suggested the following candidate #cite(label("schramm2007")) Problem 7.1 and the following discussion:

$ r^d log log \( 1 \/ r \) . $

The article #emph[An exact Hausdorff gauge for SLE: A moment-integral and finite-batch construction] already answered the existence question for each fixed $0 < kappa < 8$. Its deterministic moment integrals specify coefficients, and finite irregular batches of radii specify a gauge through a full infimum #cite(label("openai2026exact")) equations (5.8) and (6.4). That gauge gives positive finite measure simultaneously on positive-time compact segments and finite expected measure of the entire trace in bounded regions #cite(label("openai2026exact")) Theorem 1.1 and Proposition 8.2.

The present paper identifies a regular closed-form gauge and proves its two Hausdorff inequalities from quantitative estimates at finite scales. The stopped-law, mass, and covering arguments below do not import a proof result from the companion. The relation between the two exact gauges remains open. The regular formula also settles the proposed exponent-one correction negatively: its measure is not sigma-finite on any positive-time compact segment.

=== 1.1 The result <the-result>

Fix $0 < kappa < 8$ and set

$ d = 1 + kappa / 8 \, #h(2em) p = 2 - d = 1 - kappa / 8 . quad "(1.2)" $ <eq:parameters>

Thus $1 < d < 2$ and $0 < p < 1$. Define, at all sufficiently small radii,

$ h \( r \) = r^d #scale(x: 120%, y: 120%)[\(] log log \( 1 \/ r \) #scale(x: 120%, y: 120%)[\)]^(p \/ 2) . quad "(1.3)" $ <eq:gauge>

Set $h \( 0 \) = 0$ and complete it continuously and nondecreasingly at larger radii. The expression is increasing near zero, and its completion does not affect (1.1).

#thm([Theorem 1.1.])[
  #emph[Let $gamma$ be ordinary chordal $upright("SLE")_kappa$ from $0$ to $oo$ in $bb(H)$, parametrized by half-plane capacity $2 t$, and set $Gamma = gamma \( \[ 0 \, oo \) \)$. For each fixed $0 < kappa < 8$, on one event of probability one, 
$ 0 < cal(H)^h \( gamma \( \[ s \, t \] \) \) < oo #h(2em) upright("for every real ") 0 < s < t < oo . $

 For every deterministic $0 < R < oo$, 
$ bb(E) cal(H)^h \( Gamma ∩ overline(B) \( 0 \, R \) \) lt.eq C_(kappa \, R) < oo . $

 In particular, on the same probability-one event, 
$ cal(H)^h #scale(x: 120%, y: 120%)[\(] Gamma ∩ \( \[ - m \, m \] + i \[ 0 \, m \] \) #scale(x: 120%, y: 120%)[\)] < oo #h(2em) \( m = 1 \, 2 \, dots.h \) . $

]
] <thm:main>

The spatial expectation concerns the whole trace at once, including its real-axis points. It is not obtained by adding bounds over successive finite time intervals. The event is for the fixed value of $kappa$.

#thm([Corollary 1.2.])[
  #emph[Let $g \( r \) = r^d log log \( 1 \/ r \)$ at sufficiently small radii, with any continuous nondecreasing completion. On the event in Theorem 1, the restriction of $cal(H)^g$ to every $gamma \( \[ s \, t \] \)$, $0 < s < t < oo$, is not sigma-finite; in particular its total measure is infinite.]
] <cor:larger-gauge>

#proof[
  The ratio $h \( r \) \/ g \( r \)$ tends to zero. For each $epsilon > 0$, all sufficiently fine covers therefore give $cal(H)^h \( A \) lt.eq epsilon cal(H)^g \( A \)$. Every set of finite $cal(H)^g$-measure has zero $cal(H)^h$-measure. A countable cover of the segment by such sets would contradict its positive $cal(H)^h$-measure. ◻
]

Natural parametrization provides another notion of SLE length. Lawler–Sheffield constructed it for $0 < kappa < 4 \( 7 - sqrt(33) \)$ #cite(label("lawlersheffield2011")) Theorem 3.1; Lawler–Zhou extended the construction to $0 < kappa < 8$ #cite(label("lawlerzhou2013")) Theorem 1; and Lawler–Rezaei identified it, up to normalization, with $d$-dimensional Minkowski content #cite(label("lawlerrezaei2015")) Theorem 1.1 and p. 5. For chordal SLE in the half-plane, Holden–Yuan identify positive fine-mesh variation, up to a deterministic factor, with natural parametrization, including segments that meet the real boundary #cite(label("holdenyuan2026")) Theorems 1.7–1.8. Their gauge $r^d \( log log \( 1 \/ r \) \)^(- \( d - 1 \))$ is applied to ordered partitions. The different logarithmic correction here belongs to arbitrary spatial covers. Our argument requires no identification of $cal(H)^h$ with either natural parametrization or Minkowski content.

=== 1.2 The two Hausdorff bounds <the-two-hausdorff-bounds>

For the lower Hausdorff bound we need a positive measure on a piece of the trace whose mass in every small ball is at most a constant times $h \( r \)$. For the upper bound we need spatial covers whose total $h$-cost has a bounded expectation. Both tasks use finite-mesh quantities, but they use them in different ways.

First consider a disk $A$ with a fixed free collar in the surviving domain after a finite stopped past. This domain is the component toward infinity after filling the components cut off by the trace. At a live interior point $z$, the Green density is $R^(- p) sin^(8 \/ kappa - 1) theta$, where $R$ is its conformal radius and $theta$ is its argument in tip–target half-plane coordinates. Stop this density at the point’s own first live approach within distance $e$, and assign zero if no such approach occurs. Denote the resulting stopped weight by $W_e \( z \)$. The quantitative estimate is

$ bb(P) {integral_A W_e \( z \) thin d A \( z \) > u} lt.eq C exp \( - c u^(2 \/ p) \) $

in unit-scale coordinates, for large $u$, uniformly in the permitted past and final mesh. This controls a fixed spatial scale while the approximation mesh decreases to zero. Rezaei and Zhan proved fixed-$n$ multipoint approach bounds and finiteness of moments of natural length #cite(label("rezaeizhan2017")) Theorems 1.1–1.2. Their estimates already allow arbitrary approach radii. The estimate here gives the quantitative $e^(- c u^(2 \/ p))$ tail for the integrated stopped density, with constants uniform over both the permitted pasts and the final meshes.

The exponent comes from testing a large mass first at an intermediate distance $delta$. There the deterministic density bound gives mass of order $delta^(- p)$. For each prescribed finer final mesh, the later increments raise this bound by only a fixed factor outside an event of probability at most $C e^(- c delta^(- 2))$, with constants independent of that final mesh. Taking $delta$ of order $u^(- 1 \/ p)$, and using the pointwise cap for coarser meshes, produces the displayed tail. Section 4 controls those increments in two ways. For $kappa lt.eq 4$, Green-kernel decrease bounds the bracket of density increments that start at different times. For $kappa > 4$, spatially separated windows and a swallowing estimate control the surviving contributions.

For the lower bound, Section 5 deletes dyadic squares whose mass is too large. At scale $r = 2^(- k)$ the threshold is $D r^d \( log k \)^(p \/ 2)$ for a sufficiently large fixed constant $D$. Reaching the square costs $O \( r^p \)$, whereas its mass scale is $r^d$ and there are $O \( r^(- 2) \)$ squares. The powers cancel because $p + d = 2$. The tail makes the remaining loss summable. Positive first moments and bounded second moments leave a positive retained mass with positive probability. A supported weak subsequential limit satisfies the required bound on every ball; restarting on deterministic capacity slots gives positivity on every positive-time interval.

The upper bound asks for the opposite kind of local event: a disk must occasionally contain #emph[more] sausage area than its usual scale. For a curve segment $eta$, its normalized sausage area at mesh $v$ is

$ v^(- p) "Area" { z : "dist" \( z \, eta \) < v } . $

Rezaei’s covering proof already combines dense occupation, conditional estimates after stopped histories, compactness, and prescribed spiral passages #cite(label("rezaei2018")) Section 3, Lemmas 3.1–3.3. Using the same geometric idea, a serpentine ribbon with order $m$ strands provides order $m^2$ disjoint local tests at spatial scale $m^(- 1)$. Successful tests contribute total normalized area of order $m^(2 - d) = m^p$. If each step succeeds with a conditional probability bounded below uniformly over every admissible rough past, the whole visit costs at most an exponential in $m^2$: its probability is at least $c e^(- C m^2)$. Pointwise support for a fixed smooth path, as in Tran–Yuan #cite(label("tranyuan2020")) Theorem 1.1, Corollary 1.2, and Proposition 1.4, does not supply this common conditional probability over rough pasts.

Section 5 first proves an ordinary-law lower-tail statement for sausages on deterministic time intervals. In Section 6, compactness of conformal maps along an interior guide and a uniform localization estimate turn pointwise support into one ribbon-step bound. The passage is described with fixed margins that persist under convergence of the maps. A finite selection of rational time intervals then transfers the sausage estimate, leaving a common positive probability, mass threshold, and deterministic mesh cutoff.

For the final cover take $m$ proportional to $sqrt(log n)$ and perform order $n$ tests at geometrically spaced radii $r_j$, with $j$ between $n \/ 3$ and $2 n \/ 3$. Conditional success bounds, not independence, make total failure small. Since $log n$ is comparable to $log log \( 1 \/ r_j \)$, the generated mass matches the correction in $h$. The deterministic mesh cutoff in the ribbon estimate lets every test use one physical mesh. Disjoint selected disks can then all be charged to the same whole-trace sausage measure.

Section 7 carries out this cover. Its dense-occupation and multiscale strategy follows Rezaei #cite(label("rezaei2018")) Section 3, especially equations (9)–(11), who selects maximal high-occupation circles and charges them using bounded overlap. Here a greedy family of disjoint disks is charged to one finite-mesh sausage measure, and the quantitative ribbon probability specifies the logarithmic gauge. To bound the cost of visited cells that the selected disks miss, the proof uses test failures visible at finite stops, where the finite Green changes of law apply. The disks themselves are selected afterward from the whole-trace sausage. The final charge has a bounded expectation in one fixed spatial disk, independently of time and height cutoffs. Increasing both cutoffs then yields the all-time assertion.

The technical foundations appear in Sections 2 and 3. Starting from Rohde–Schramm’s continuous trace theorem #cite(label("rohdeschramm2005")) Theorem 5.1 and classical conformal boundary theory, the first establishes access and slit support after a rough past. The second develops the finite stopped Green laws from the methods of Lawler–Zhou #cite(label("lawlerzhou2013")) Section 2 and Lawler–Werness #cite(label("lawlerwerness2013")) Sections 2.3–2.4, and proves the physical localization used by the ribbon argument. The $kappa lt.eq 4$ mesh proof uses the Green-decrease identity appearing in Schramm–Sheffield’s SLE$""_4$/Gaussian-free-field covariance calculation #cite(label("schrammsheffield2013")) Lemmas 2.5–2.6, with the decomposition for different starting times supplied here.

== 2 Boundary geometry and pointwise slit support <geom:section>

Boundary extension and uniqueness at a fresh tip identify the access from a first disk hit. Pointwise smooth-slit support then supplies the individual passages used later; uniformity over rough pasts will come from the compactness argument in Section 6.

All closures at infinity in this section are spherical. A filled hull generated by a continuous curve means the curve together with the components that it disconnects from the target. The surviving domain is the component towards the target. We use the continuous-trace description of chordal Loewner evolution; the claims below concern its boundary geometry, not the existence of that trace. For the fixed parameter $0 < kappa < 8$, we use the continuous generating trace given by Rohde–Schramm #cite(label("rohdeschramm2005")) Theorem 5.1. Its domain Markov property follows from composition of the Loewner maps and Brownian strong Markov.

#thm([Lemma 2.1.])[
  (Continuous extension for a past domain).  #emph[Let $eta : \[ 0 \, T \] arrow.r overline(bb(H))$ be continuous, with $eta \( 0 \) = 0$, and let $D$ be the unbounded component of $bb(H) \\ eta \[ 0 \, T \]$. Suppose $D$ is the surviving simply connected domain of the trace. Its conformal uniformization $F : bb(H) arrow.r D$ extends continuously from the closed half-plane in the spherical topology. Boundary parameters of $F$ specify prime ends; distinct parameters may have the same physical image.]
] <geom:extension>

#proof[
  Write
  $ A = #scale(x: 120%, y: 120%)[\(] hat(bb(C)) \\ bb(H) #scale(x: 120%, y: 120%)[\)] union eta \[ 0 \, T \] \, #h(2em) K = hat(bb(C)) \\ D . $
  The image of a compact interval under a continuous map is a locally connected continuum. This standard preservation statement is recalled in #cite(label("pommerenke1992")) Chapter 2, §2.2, p. 19. The other set in the union defining $A$ is a closed hemisphere, and the two sets meet at $0$. Their union is locally connected: at a point of their intersection take small connected relative neighborhoods in each and unite them; at a point belonging to only one, first choose a neighborhood disjoint from the other closed set. Thus $A$ is a locally connected continuum.
  The set $K$ is obtained from $A$ by adding complementary components. Here is the elementary filling argument, stated locally in a Euclidean chart. Given a prescribed small diameter, uniform local connectedness of the compact set $A$ supplies a scale $delta$ at which nearby points of $A$ can be joined by a connected subset of that diameter. If $x \, y$ are points of the filled set with $\| x - y \| < delta$ and $"dist" \( x \, A \) > 2 delta$, their joining segment avoids $A$ and remains in the same filled component as $x$. Otherwise choose nearest points $a \, b in A$ to $x \, y$. The segments $\[ x \, a \]$ and $\[ y \, b \]$ stay in their respective filled components until their endpoints, and have lengths at most $2 delta$ and $3 delta$. Also $\| a - b \| lt.eq 6 delta$. After reducing $delta$, join $a$ to $b$ by a small connected subset of $A$. The resulting connected set joins $x$ to $y$ with the prescribed small diameter. A spherical version follows by local charts, or by moving a point of $D$ to infinity. This is also the filling statement in #cite(label("loridantluo2017")) §2, Lemma 2.4, p. 7.
  Consequently $K$ is locally connected. The Torhorst boundary theorem, in the form recorded in #cite(label("loridantluo2017")) §2, Lemma 2.6, p. 8, implies that $partial D$ is locally connected. The Continuity Theorem and Prime End Theorem in #cite(label("pommerenke1992")) Chapter 2, §2.1, p. 18 now give the asserted continuous extension and its prime-end interpretation. ◻
]

#thm([Lemma 2.2.])[
  (A fresh terminal point has one prime end).  #emph[In the preceding setting, suppose $a = eta \( T \) in bb(H) ∩ partial D$ and $a in.not eta \[ 0 \, T \)$. Then $F$ has exactly one boundary parameter with image $a$. For the Loewner uniformization this parameter is the current driving point. Every access in $D$ tending to $a$ approaches that same prime end.]
] <geom:fresh-tip>

#proof[
  First, $A \\ { a }$ is connected: it is the union of the closed lower half-plane with the connected image $eta \[ 0 \, T \)$, and these meet at $0$. If $V$ is a filled complementary component of $A$, then $overline(V) \\ { a }$ is connected. Indeed the connected set $V$ is dense in this set in the punctured sphere. Moreover $partial V$ contains a point other than $a$. A nonempty proper open component with boundary contained in a singleton would be both open and closed in the connected punctured sphere, and hence would equal that entire punctured sphere, which is impossible here. Thus $overline(V) \\ { a }$ meets $A \\ { a }$. It follows that
  $ K \\ { a } = \( A \\ { a } \) thin union #h(-1em) union.big_(V upright(" filled")) \( overline(V) \\ { a } \) $
  is connected. This argument permits arbitrary self-intersections of the past away from $a$.
  For completeness, the conformal consequence is a Jordan-curve argument. Replace the half-plane by the disk. If two different circle parameters $u \, v$ had image $a$, join them by a simple crosscut in the disk. Its image is a Jordan curve $J$ contained in $D union { a }$: the interior of the crosscut is mapped injectively into $D$, and its only coinciding endpoints have image $a$. Neither of the two open circle arcs between $u$ and $v$ can map identically to $a$. If an open arc did, Schwarz reflection of $F - a$ across that arc would give an analytic extension vanishing on an interval, contrary to univalence. Choose a boundary image different from $a$ on each arc. The two crosscut components map to opposite sides of $J$, so those images lie on opposite sides as well. Both belong to $K \\ { a }$, whereas $J ∩ K = { a }$. This disconnects $K \\ { a }$, a contradiction. This is the separation argument of #cite(label("pommerenke1985")) proof of Theorem 1, pp. 426–427, equations (2.2)–(2.3), applied to the complement rather than only to its boundary.
  The continuous extension is onto $overline(D)$, so there is a boundary preimage of $a$ and it is unique. Any sequence of domain points tending to $a$ has inverse-image cluster points only in this singleton: compactness of the closed disk and continuity of $F$ prove this claim. This gives the assertion for every access. The trace formula identifies the current driving point as a preimage of the tip, so it is the unique one. ◻
]

#thm([Lemma 2.3.])[
  (Access at a first disk hit).  #emph[Let $overline(B \( z \, r \))$ lie in the initial surviving domain, and write $eta$ for the future trace. Let $tau$ be its first time reaching $partial B \( z \, r \)$. Suppose $tau < oo$ and $z$ belongs to the surviving domain $D_tau$. Then, writing $a = eta \( tau \)$, the segment $\( a \, z \]$ is contained in $D_tau$ and approaches the current tip prime end at $a$. If $g : D_tau arrow.r bb(H)$ sends tip to $0$, target to infinity, and is scaled so that $\| g \( z \) \| = 1$, the image of $\[ a \, z \]$ is a continuous path from $0$ to modulus $1$ whose inverse image is contained in $overline(B \( z \, r \))$.]
] <geom:first-hit-access>

#proof[
  The open ball is disjoint from the trace through time $tau$. It is connected and contains the surviving point $z$, so all of it belongs to the same surviving component. In particular $\( a \, z \] subset D_tau$. The point $a$ has not previously been visited: an earlier visit would have been an earlier hit of the circle. It is also disjoint from the initial hull by the hypothesis on the closed ball. Lemma 4 therefore identifies the radial access with the tip prime end, proving continuity of its image at $0$. The other assertions follow from the normalization. One may stop this path at its first modulus-one point if desired. No modulus of boundary continuity, and no bound on its length, is needed. ◻
]

The same connected-component argument gives a useful convention about killing: if a ball is disjoint from the trace when its center is swallowed, its whole open interior is swallowed then. Subsequent trace growth in the surviving domain cannot enter that interior.

#thm([Lemma 2.4.])[
  (Smooth slits have continuous drivers).  #emph[Let $beta$ be a compact regular smooth simple arc, starting at $0$, initially vertical, and otherwise contained in $bb(H)$. Its successive prefixes, parametrized by half-plane capacity $2 t$, are generated by a continuous chordal Loewner driver on a compact interval.]
] <geom:smooth-driver>

#proof[
  Use initially any regular parameter $s$. The complements of the prefixes converge in the kernel sense when $s$ varies, so their hydrodynamically normalized maps and inverse maps converge locally uniformly. Reflection near infinity, outside a ball containing the whole slit, also gives convergence of their Laurent coefficients.
  We record why the needed boundary convergence holds in this particular family. The complements consisting of the closed lower half-plane and a prefix of $beta$ are uniformly locally connected, in fact uniformly locally arcwise connected. On the simple compact arc, uniform continuity of $beta$ and of its inverse shows that nearby points can be joined by a uniformly small subarc, which remains in every prefix containing them. Points of the arc sufficiently close to the real line are on a uniformly short initial part of the arc, since every closed later part has positive height. The initial part and the lower half-plane can thus be joined through $0$. This proves the asserted uniform local connectivity, including at the attachment.
  Here is the standard small-crosscut proof that it implies the boundary convergence required here. Put the inverse maps on the disk using a fixed half-plane-to-disk coordinate. Their spherical area integrals are bounded by the area of the sphere. About any boundary parameter, integrating over crosscuts formed by circles of radii between $delta$ and $sqrt(delta)$ gives a crosscut whose image has spherical length at most $C \/ sqrt(log \( 1 \/ delta \))$, by Cauchy–Schwarz. Its endpoint images can be joined in the complement by an arc with uniformly small diameter. The resulting Jordan curve (or the image crosscut alone when its endpoints coincide) cuts off a set of small diameter on the side away from the image of an interior basepoint. The latter images stay uniformly separated from the complements, by kernel convergence and compactness of the parameter interval. The disk cap at the boundary parameter maps into that small side. This proves uniform equicontinuity at the boundary; interior equicontinuity follows from local uniform convergence. Hence the inverse maps converge uniformly on the closed disk in the spherical metric. In particular their tip preimages converge: any cluster point maps to the limiting tip, whose preimage is unique by Lemma 4. Returning to hydrodynamic half-plane coordinates shows that the tip coordinate $U \( s \)$ is continuous. At $s = 0$ the same conclusion follows from the initially vertical slit.
  For clarity, the usual infinitesimal mapping argument now gives the equation and the parameter. If $g_s$ maps out a prefix and $s' > s$, the inverse transition $h = g_s compose g_(s')^(- 1)$ maps $bb(H)$ into itself and has expansion $h \( z \) = z - m \/ z + O \( \| z \|^(- 2) \)$. The maximum principle gives $"Im" \( h \( z \) - z \) gt.eq 0$; its half-plane harmonic representation, with reflection outside the bounded incremental hull, is
  $ h \( z \) = z - integral_(bb(R)) frac(d nu \( x \), z - x) \, #h(2em) nu gt.eq 0 \, #h(2em) nu \( bb(R) \) = m . $
  Here $m$ is the increment of half-plane capacity. If $m = 0$, the representation gives $h \( z \) = z$, which is impossible for a nontrivial added arc. Capacity is therefore strictly increasing, and its continuity follows from the Laurent-coefficient convergence above.
  As $s' arrow.b s$, the added arc mapped by $g_s$ shrinks to $U \( s \)$. Indeed every approach to the fresh tip has that same inverse-image limit by Lemma 4. The support of $nu$ consequently shrinks to $U \( s \)$ as well. One elementary way to see the last statement is to enclose the added hull in a half-disk of radius $epsilon.alt$ about $U \( s \)$. Its map-out function $Q = h^(- 1)$ extends by reflection to a normalized univalent function on $\| z - U \( s \) \| > epsilon.alt$. Writing
  $ Q \( U \( s \) + epsilon.alt zeta \) = U \( s \) + epsilon.alt (zeta + sum_(j gt.eq 1) b_j zeta^(- j)) \, $
  Gronwall’s exterior area theorem gives $sum_(j gt.eq 1) j \| b_j \|^2 lt.eq 1$ #cite(label("beliaev2015")) Theorem 3.2.1 and Corollary 3.2.2, pp. 37–38. Cauchy–Schwarz at $zeta = plus.minus 2$ consequently gives $\| Q \( U \( s \) plus.minus 2 epsilon.alt \) - U \( s \) \| < 3 epsilon.alt$. The transition inverse is real analytic on the real rays beyond these two images, so its representing measure is supported between them. Thus, uniformly on compact subsets of $bb(H)$,
  $ h \( z \) = z - frac(m, z - U \( s \)) + o \( m \) . $
  Invert this transition and use capacity $2 t$ as parameter. It follows that
  $ frac(partial g_t \( z \), partial t) = frac(2, g_t \( z \) - U \( t \)) . $
  The compact interval of capacity and continuity of $U$ prove the lemma. ◻
]

The following pointwise assertion is a special case of SLE support; see Tran–Yuan #cite(label("tranyuan2020")) Theorem 1.1 and Corollary 1.2. We give a proof of the particular open-tube form needed here.

#thm([Lemma 2.5.])[
  (Pointwise slit support).  #emph[Let $beta$ be as in Lemma 6, and let $q$ be its terminal point. Let $N$ be a relative open neighborhood of the whole slit in $overline(bb(H))$, including a relative neighborhood of $0$, and let $V$ be an open neighborhood of $q$. Chordal $upright("SLE")_kappa$ satisfies 
$ bb(P) { upright("for some ") t < oo \, med gamma \[ 0 \, t \] subset N upright(" and ") gamma \( t \) in V } > 0 . $

 Suppose in addition that $G_1 \, dots.h \, G_m$ are pairwise disjoint crosscuts of $N$, each separating $0$ from all later crosscuts and from $V ∩ N$. On the displayed event, the first hits of $G_1 \, dots.h \, G_m$ occur in that order. The probability asserted here is pointwise in the slit and tube; no uniform positive lower bound over different slits or pasts is claimed.]
] <geom:slit-support>

#proof[
  Let $U$ be the deterministic slit driver on $\[ 0 \, T \]$. We show that a sufficiently small uniform neighborhood of $U$ forces the required geometric event whenever the perturbed driver generates a continuous trace. Suppose $U_n arrow.r U$ uniformly and let $K_n$ be their hulls at time $T$. The height bound $"Im" K_n lt.eq 2 sqrt(T)$ and the driver-extrema horizontal bound place all hulls in a common bounded rectangle.
  For each point of $overline(bb(H)) \\ beta \[ 0 \, T \]$, its limiting forward Loewner solution stays a positive distance from the driver up to $T$. This includes real points other than $0$: a simple slit otherwise contained in $bb(H)$ swallows no such point, and the solution is reflected analytically across a surviving real interval. Continuous dependence for the ODE supplies a whole surviving neighborhood of each such point for all sufficiently large $n$. Compactness of the fixed rectangle outside any prescribed neighborhood of the slit now gives
  $ K_n subset N quad upright("for all large ") n . $
  The same argument applies to a smaller neighborhood when needed.
  The reverse Loewner ODE gives local uniform convergence of the inverse maps at time $T$: on compact subsets of $bb(H)$ their imaginary parts are bounded away from zero, so ordinary ODE stability applies. The corresponding domains consequently converge in the kernel sense to $bb(H) \\ beta \[ 0 \, T \]$. For every small $r > 0$, this implies
  $ K_n ∩ B \( q \, r \) eq.not diameter quad upright("for all large ") n . $
  Otherwise, along a subsequence the whole ball would survive. A compact passage from a fixed interior basepoint through the limiting domain to a point of that ball, together with the ball, would then belong to the kernel, incorrectly making $q$ an interior kernel point.
  This hull intersection also forces an intersection by the trace. Choose $r$ with $overline(B \( q \, 2 r \)) subset V ∩ bb(H)$, and fix $w in B \( q \, 2 r \) \\ beta \[ 0 \, T \]$. Upper hull containment ensures $w in.not K_n$ eventually. If the perturbed trace avoided $B \( q \, 2 r \)$, that connected ball would lie in one component of its complement. It meets $K_n$ by the preceding paragraph, so that component would be swallowed. The whole ball, including $w$, would then belong to $K_n$, a contradiction. Thus the trace visits $V$. Since every earlier hull is contained in $K_n$, the trace stays in $N$ up to that visit. This sequential argument supplies an actual positive driver tolerance by contradiction.
  Brownian motion has positive probability in each uniform neighborhood of the continuous function $U \/ sqrt(kappa)$, which starts at zero. This follows, for example, by polygonal approximation, positive Gaussian increment probabilities, and positive Brownian-bridge confinement probabilities on the finitely many resulting intervals. Apply this to the driver $sqrt(kappa) B$ and use the almost-sure continuous-trace property. Finally, the stated crosscut separation forces a continuous path in $N$ from $0$ to $V$ to hit the crosscuts in order; backtracking within $N$ causes no problem. ◻
]

#thm([Corollary 2.6.])[
  (Restarted support in open sets).  #emph[At a finite stopping time $tau$ for ordinary chordal SLE in $bb(H)$, fix a realized past for which the conditional continuation law $bb(P)_tau$ is defined. Let $D$ be its surviving domain, and let $F : bb(H) arrow.r D$ send $0$ to the current tip prime end and infinity to the target. Use its continuous spherical extension on $overline(bb(H))$. Let $alpha : \[ 0 \, 1 \] arrow.r overline(bb(H))$ be a continuous simple path with $alpha \( 0 \) = 0$ and $alpha \( \( 0 \, 1 \] \) subset bb(H)$. If $O$ is relatively open in $overline(D)$ and contains $F \( alpha \[ 0 \, 1 \] \)$, and $V subset D$ is an open neighborhood of $F \( alpha \( 1 \) \)$, then the restarted half-plane trace $tilde(gamma)$ satisfies 
$ bb(P)_tau { upright("for some ") t < oo \, med F \( tilde(gamma) \[ 0 \, t \] \) subset O upright(" and ") F \( tilde(gamma) \( t \) \) in V } > 0 . $

 The same statement holds for a Euclidean similarity of the evolution. The positive probability may depend on the realized past, $alpha$, $O$, and $V$.]
] <geom:restart-support>

#proof[
  Lemma 3 makes $N = F^(- 1) \( O \)$ a relative open neighborhood of $alpha \[ 0 \, 1 \]$, including a relative half-disk at $0$. The path $alpha \( \( 0 \, 1 \] \)$ lies in one component of $N ∩ bb(H)$, and a short vertical segment from $0$ enters that component. Polygonal connectivity there joins this segment to a point of $F^(- 1) \( V \)$. Removing loops and smoothing corners inside $N$ gives a regular smooth simple slit with an initially vertical segment and endpoint in $F^(- 1) \( V \)$. Lemma 7, applied under the restarted Brownian Loewner law, gives the displayed event after mapping back by $F$. For passages through successive physical fronts, one may choose $O$ as a thin tube with separating crosscuts and choose $V$ beyond the last one; the final clause of that lemma then gives their order. Any uniform lower bound over different pasts still requires a separate argument. ◻
]

== 3 Finite one-point laws and physical localization <ll:section>

This section develops the one-point estimates used by both Hausdorff bounds. Finite Green changes of law give approach probabilities and show that the centered radius stops have a finite Loewner-time limit as their radii tend to zero; the latter fact supplies finite-time mass in Section 5. A conformal localization estimate then controls the image of an initial trace uniformly over maps whose domains may have narrow passages. It holds for every $0 < kappa < 8$ and is an input to the ribbon construction. When $4 < kappa < 8$, combining it with a swallowing estimate gives the physical-disk rule used in the mesh tail. All constants below depend only on the fixed parameter $kappa$, unless another dependence is displayed.

Write

$ p = 1 - kappa / 8 \, #h(2em) a_0 = 8 / kappa - 1 \, #h(2em) 0 < kappa < 8 . $

We use the original capacity normalization $partial_t g_t = 2 \/ \( g_t - sqrt(kappa) B_t \)$. The conformal radius $R_D \( z \)$ is $\| f' \( 0 \) \|$ for a conformal map $f : bb(D) arrow.r D$ with $f \( 0 \) = z$. In particular, Koebe’s Theorem gives

$ "dist" \( z \, partial D \) lt.eq R_D \( z \) lt.eq 4 "dist" \( z \, partial D \) . quad "(3.1)" $ <ll:koebe>

These inequalities require no boundary regularity #cite(label("beliaev2015")) Section 3.2.

=== 3.1 Stopped Green tilts <stopped-green-tilts>

The following centered diffusion is the usual finite-radius Green change of law; see #cite(label("lawlerzhou2013")) Section 2 and #cite(label("lawlerwerness2013")) Sections 2.3–2.4. We include the exhaustion argument because our later stopping times may follow arbitrarily irregular pasts.

Let $J : bb(H) arrow.r D$ be conformal. The boundary parameters $0$ and infinity specify the starting and target prime ends of $D$; no continuous boundary extension of $J$ is assumed here. Let $K_t$ and $g_t$ be the filled hulls and map-out functions of ordinary half-plane SLE, and set $D_t = J \( bb(H) \\ K_t \)$. Throughout this subsection, $t$ is Loewner time in the initial half-plane, where the hull has capacity $2 t$; it need not be a capacity parametrization intrinsic to $D$.

For $z in D$, put $zeta = J^(- 1) \( z \)$ and $T_z = inf { t : z in.not D_t }$, with $T_z = oo$ if this set is empty. We call the point live at times $t < T_z$. Until $T_z$, set

$ Z_t = g_t \( zeta \) - sqrt(kappa) B_t = X_t + i Y_t \, quad theta_t = arg Z_t \, quad R_t = R_(D_t) \( z \) = frac(2 Y_t \| J' \( zeta \) \|, \| g'_t \( zeta \) \|) . $

Define the radius clock by $s = log \( R_0 \/ R_t \)$. Differentiation and Itô’s Formula give

$ d s & = frac(4 Y_t^2, \| Z_t \|^4) thin d t \, & cal(L) & = kappa / 8 partial_theta^2 + frac(kappa - 4, 4) cot theta thin partial_theta \,\
M_t \( z \) & = R_t^(- p) sin^(a_0) theta_t \, & d M_t & = sqrt(kappa) a_0 frac(X_t, \| Z_t \|^2) M_t thin d B_t . quad "(3.2)" $ <ll:clock>

The sign of the last Brownian motion depends only on the driver convention and has no later effect. For the displayed driver it is the positive sign written here. In particular,

$ \| upright("Brownian coefficient of ") M_t \| lt.eq C R_t^(- p) frac(sin^(a_0) theta_t, \| Z_t \|) . quad "(3.3)" $ <ll:coefficient>

The density is continued by zero after killing.

#thm([Lemma 3.1.])[
  (Finite stopped centered law).  #emph[For $0 lt.eq u < oo$, let $tau_u$ be the first time the live point has $R_t = R_0 e^(- u)$, with value infinity if this level is never reached. Then 
$ bb(E) [M_(tau_u) \( z \) upright(bold(1))_({ tau_u < oo })] = M_0 \( z \) . $

 The normalized weight defines a consistent law on the stopped path through $tau_u$. Under that law, in radius time, 
$ d theta_s = sqrt(kappa) / 2 thin d W_s + cot theta_s thin d s \, #h(2em) cal(L)^(*) = kappa / 8 partial_theta^2 + cot theta thin partial_theta . quad "(3.4)" $ <ll:tilt-generator>

 Both endpoints are unattainable at finite radius time. These claims hold conditionally after any finite stopping time at which the point is live, with the same constants and the restarted conformal map.]
] <ll:finite-tilt>

#proof[
  First stop at $tau_u$ or when $theta$ leaves $\( 1 \/ N \, pi - 1 \/ N \)$, $Y$ falls below $1 \/ N$, or Loewner time reaches $N$. The stochastic logarithm coefficient is bounded there, since
  $ frac(\| X_t \|, \| Z_t \|^2) lt.eq frac(1, 2 Y_t) lt.eq N / 2 . $
  Girsanov’s Theorem therefore applies. Its added angular drift is $\( kappa a_0 \/ 4 \) cot theta$; together with (3.2) this gives (3.4).
  For $0 < b < a_0$, let $V_b \( theta \) = sin^(- b) theta$. Direct differentiation gives
  $ cal(L)^(*) V_b = V_b {frac(kappa b, 8) - frac(kappa b \( a_0 - b \), 8) cot^2 theta} lt.eq frac(kappa b, 8) V_b . quad "(3.5)" $ <ll:lyapunov>
  The stopped nonnegative supermartingale $e^(- kappa b s \/ 8) V_b \( theta_s \)$ bounds the probability of leaving $\( delta \, pi - delta \)$ before $u$ by $e^(kappa b u \/ 8) V_b \( theta_0 \) sin^b delta$. This tends to zero. On every compact interval on which the angle stays in $\( 0 \, pi \)$, the remaining variables satisfy
  $ frac(d log Y_s, d s) = - frac(1, 2 sin^2 theta_s) \, #h(2em) frac(d t, d s) = frac(Y_s^2, 4 sin^4 theta_s) . quad "(3.6)" $ <ll:physical-clock>
  They keep $Y$ positive and Loewner time finite there. Thus the localized changed laws lose no probability before $u$ as the cutoffs are removed. The localized density identities and monotone convergence give the asserted expectation one. Repeating the same argument between two finite levels gives consistency. Composition of the Loewner maps and Brownian strong Markov give the conditional statement. No change of law on a completed infinite-future sigma field is involved. ◻
]

#thm([Lemma 3.2.])[
  (Uniform inverse-angle moment).  #emph[For every $u_0 > 0$ there is $C_(u_0) < oo$ such that 
$ sup_(theta in \( 0 \, pi \)) sup_(s gt.eq u_0) bb(E)_theta^(*) sin^(- a_0) theta_s lt.eq C_(u_0) . $

 In particular, after one unit of radius time the probability that $sin theta$ exceeds a fixed positive constant is bounded below, uniformly over the starting angle.]
] <ll:inverse-angle>

#proof[
  We give a short spectral proof which also avoids any ambiguity about comparison inequalities for unbounded test functions. The invariant probability measure for (3.4) is
  $ pi \( d theta \) = c_kappa sin^(8 \/ kappa) theta thin d theta . $
  For $v = cos theta$, the generator and invariant measure become
  $ cal(A) = kappa / 8 \( 1 - v^2 \) partial_v^2 - (1 + kappa / 8) v partial_v \, #h(2em) pi.alt \( d v \) = tilde(c)_kappa \( 1 - v^2 \)^(4 \/ kappa - 1 \/ 2) thin d v . $
  Integration by parts makes $cal(A)$ symmetric on polynomials. If $P_m$ are the orthonormal polynomials for $pi.alt$, with $P_0 = 1$, its action on the leading coefficient and symmetry imply
  $ cal(A) P_m = - lambda_m P_m \, #h(2em) lambda_m = kappa / 8 m^2 + m . $
  For completeness, choose $m + 1$ separated intervals of length $c \/ \( m + 1 \)$ in $\[ - 1 \/ 2 \, 1 \/ 2 \]$. Since the weight is bounded below there, each contains a point where $\| P_m \| lt.eq C sqrt(m + 1)$. Lagrange interpolation at these points gives
  $ parallel P_m parallel_(oo \, \[ - 1 \, 1 \]) lt.eq exp { C \( m + 1 \) log \( m + 2 \) } . $
  Consequently
  $ k_s \( v \, w \) = 1 + sum_(m gt.eq 1) e^(- lambda_m s) P_m \( v \) P_m \( w \) $
  converges absolutely and uniformly for $s gt.eq u_0$, with a uniformly bounded sum. Itô’s Formula for each bounded polynomial gives $bb(E)_v P_m \( v_s \) = e^(- lambda_m s) P_m \( v \)$. Polynomial density in $C \( \[ - 1 \, 1 \] \)$ identifies the actual transition law with $k_s \( v \, w \) pi.alt \( d w \)$. Thus its density relative to $pi$ is uniformly bounded for $s gt.eq u_0$. Finally,
  $ integral sin^(- a_0) theta thin pi \( d theta \) = c_kappa integral_0^pi sin theta thin d theta < oo . $
  Markov’s inequality applied to $sin^(- a_0) theta$ proves the last assertion. This is a direct proof in our normalization of the uniform inverse-angle estimate in #cite(label("lawlerwerness2013")) Lemma 2.9; see also #cite(label("lawlerzhou2013")) Lemma 2.2. A Gegenbauer expansion for this diffusion is also used in #cite(label("zhan2019optimal")) Proposition 4.2. Here the interpolation estimate suffices in place of explicit polynomial norm formulas. ◻
]

To pass from conformal radius to Euclidean clearance, write $delta_t = "dist" \( z \, partial D_t \)$ while $t < T_z$. This is an adapted continuous function of $t$ on the live interval. Indeed, if $t_n arrow.r t < T_z$, stability of the Loewner ODE gives locally uniform convergence of the inverse maps. Composing them with $J$ and normalizing at $z$ gives nondegenerate conformal maps onto $D_(t_n)$ converging to the corresponding map onto $D_t$. Thus these domains converge in the kernel sense at $z$. Every closed centered disk of radius less than $delta_t$ eventually lies in $D_(t_n)$. Conversely, if a fixed centered disk of radius greater than $delta_t$ persisted in a subsequence of the $D_(t_n)$, it would lie in the kernel $D_t$. These two observations prove $delta_(t_n) arrow.r delta_t$.

For $0 < epsilon < delta_0$, define the live clearance stop

$ S_epsilon \( z \) = inf { t < T_z : delta_t lt.eq epsilon } \, $

with value infinity if this set is empty. It is a stopping time, and $delta_(S_epsilon) = epsilon$ on its finite event. This definition also applies when $J$ has no continuous boundary extension. When $D_t$ is the surviving domain of a continuous physical trace $eta$ in an initial domain $D_0$, there is the more concrete identity

$ delta_t = min { "dist" \( z \, partial D_0 \) \, "dist" \( z \, eta \[ 0 \, t \] \) } \, #h(2em) t < T_z . quad "(3.7)" $ <ll:trace-clearance>

In fact, $partial D_t subset partial D_0 union eta \[ 0 \, t \]$, and both sets on the right lie outside $D_t$; distance to the complement equals distance to the boundary. Thus below the initial clearance, $S_epsilon$ is exactly the first live approach of the trace to distance $epsilon$. A first approach occurring only at killing is not counted. The finite-past domains and their similarities used later have this continuous-trace interpretation.

#thm([Lemma 3.3.])[
  (Terminal zero and approach estimates).  #emph[Let $0 < r < R_0$ and freeze the density at the first live stop with $R = r$. Almost surely, on the event that the live radius never reaches $r$, the density has terminal value zero, whether its original Loewner-time lifetime is finite or infinite. Furthermore, for $u gt.eq 1$, 
$ bb(P) { tau_u < oo } lt.eq C e^(- p u) sin^(a_0) theta_0 . quad "(3.8)" $ <ll:radius-approach>

 For $0 < epsilon lt.eq delta_0 \/ \( 8 upright(e) \)$, 
$ bb(P) { S_epsilon \( z \) < oo } lt.eq C M_0 \( z \) epsilon^p . quad "(3.9)" $ <ll:euclidean-approach>

 At this stop the density has the exact first moment 
$ bb(E) #h(-1em) [M_(S_epsilon) \( z \) upright(bold(1))_({ S_epsilon < oo })] = M_0 \( z \) . quad "(3.10)" $ <ll:clearance-first-moment>

 Under the centered law, $S_epsilon$ occurs no later than the finite radius stop with $R = epsilon$. All statements have their conditional restarted versions.]
] <ll:approach>

#proof[
  Suppose the radius-time lifetime is finite. If the angle eventually stayed in a compact subinterval of $\( 0 \, pi \)$, its SDE and (3.6) would extend it: the latter equations give finite Loewner time, positive $Y$, and regular $Z$ there. Otherwise the angle approaches an endpoint along a sequence. It must converge to that endpoint. Indeed, repeated crossings of a fixed interior interval in a finite remaining radius time would contradict uniform continuity of the Brownian part and boundedness of the drift on that interval. Thus the maximal angle solution ends at $0$ or $pi$. On a path that never reaches the radius $r$, its radius time is bounded and its radius stays bounded below. Its density therefore tends to zero, including when its original Loewner-time lifetime is infinite. The density stopped at the radius cutoff is bounded by $r^(- p)$; localization followed by bounded convergence is therefore legitimate.
  Under the centered law, $M_(tau_u) \/ M_0$ equals $e^(p u) sin^(a_0) theta_u \/ sin^(a_0) theta_0$. Untilting at this finite stop and applying Lemma 10 gives (3.8). At $S_epsilon < oo$, (3.1) gives $R_(S_epsilon) lt.eq 4 epsilon$. The live radius must therefore have crossed $8 epsilon$ earlier. Since $R_0 gt.eq delta_0 gt.eq 8 upright(e) epsilon$, the corresponding radius time is at least one, and (3.8) proves (3.9).
  Before $S_epsilon$, $R gt.eq delta_t > epsilon$ by (3.1). The stopped density is consequently bounded by $epsilon^(- p)$. Under the centered law the clearance stop occurs no later than the finite radius level $R = epsilon$, because $"dist" \( z \, partial D \) lt.eq R$. On a path with no clearance stop, the radius stays above $epsilon$, so the preceding terminal-zero assertion applies. Bounded optional stopping and bounded convergence now give (3.10). Strong Markov gives the conditional versions with the restarted domain and its initial clearance. ◻
]

#thm([Lemma 3.4.])[
  (Finite centered lifetime in Loewner time).  #emph[Under the consistent centered laws, $T^(*) \( z \) = lim_(u arrow.r oo) tau_u$ is finite almost surely.]
] <ll:finite-clock>

#proof[
  The locally unique centered SDE in (3.4) has a global solution $\( theta_s \)_(s gt.eq 0)$: neither endpoint is attained in finite radius time, so the local solutions extend and agree on overlaps. On this path reconstruct the other variables by
  $ Y_s = Y_0 exp {- 1 / 2 integral_0^s sin^(- 2) theta_v thin d v} \, #h(2em) t_s = integral_0^s frac(Y_v^2, 4 sin^4 theta_v) thin d v . $
  Put $X_s = Y_s cot theta_s$. Since $t_s$ is strictly increasing, a continuous driver on every interval $\[ 0 \, t_s \]$ is recovered from
  $ U_(t_s) = "Re" zeta + integral_0^s frac(Y_v cot theta_v, 2 sin^2 theta_v) thin d v - X_s . $
  This follows by integrating $partial_t "Re" g_t \( zeta \) = 2 X_t \/ \| Z_t \|^2$ and using $"Re" g_t \( zeta \) = U_t + X_t$. Uniqueness of the centered SDE now identifies the restriction through $s = u$ with the finite stopped law of Lemma 9, with $t_u = tau_u$. This gives one probability space for the limit $T^(*) \( z \)$ and the argument below, without using a density on an infinite-future sigma field or at the limiting time.
  The formula (3.5) at $b = a_0$ is $cal(L)^(*) V_(a_0) = p V_(a_0)$. Thus $e^(- p s) V_(a_0) \( theta_s \)$ is a nonnegative local martingale and hence a supermartingale. Its stopped maximal inequality and Lemma 10 imply, for integers $n gt.eq 1$,
  $ bb(P)^(*) {sup_(n lt.eq s lt.eq n + 1) V_(a_0) \( theta_s \) > e^(a_0 eta n)} lt.eq C e^(- a_0 eta n) . $
  For any $0 < eta < 1 \/ 4$, Borel–Cantelli therefore gives $sin^(- 4) theta_s lt.eq C e^(4 eta s)$ eventually. Also (3.6) gives $Y_s lt.eq Y_0 e^(- s \/ 2)$. The integral of $Y_s^2 \/ \( 4 sin^4 theta_s \)$ over $s in \[ 0 \, oo \)$ is finite. Initial compact intervals have finite integrals by endpoint nonattainment. This proves the assertion solely from finite stopped laws. ◻
]

=== 3.2 Avoidance near the real line <avoidance-near-the-real-line>

#thm([Lemma 3.5.])[
  (Uniform small-target estimate).  #emph[There are $C \, c > 0$ such that ordinary chordal SLE in $bb(H)$ satisfies 
$ bb(P) { "dist" \( v \, gamma \) < epsilon } lt.eq C epsilon^c \, #h(2em) 1 / 2 lt.eq \| v \| lt.eq 2 \, quad v in overline(bb(H)) \, quad 0 < epsilon < 1 / 16 . $

 The same estimate holds after a simultaneous spatial rescaling of the annulus and target radius. The trace in this statement includes all future times and its real boundary points.]
] <ll:near-real>

#proof[
  A stronger, sharp boundary exponent was proved by Alberts and Kozdron #cite(label("albertskozdron2008")) Theorem 3.2 and Corollary 5.1. Here is a direct weaker estimate sufficient for our use. It suffices to treat sufficiently small $epsilon$, since increasing $C$ covers the remaining values below $1 \/ 16$. Fix real $x$ with $\| x \|$ bounded above and away from zero, and write $T_x$ for its real Loewner collision time. Up to $T_x$, put $X_t = g_t \( x \) - sqrt(kappa) B_t$ and $h = integral_0^t X_u^(- 2) thin d u$. Changing the sign of a Brownian motion if necessary gives
  $ log \| X \| = log \| x \| + \( 2 - kappa \/ 2 \) h + sqrt(kappa) thin tilde(B)_h . $
  For $w$ in the upper half-ball $\| w - x \| < 4 epsilon$, set $D_t \( w \) = g_t \( w \) - g_t \( x \)$. While $\| D_t \( w \) \/ X_t \| lt.eq delta$, the ODE gives
  $ frac(d, d h) log \| D_t \( w \) \| = - 2 "Re" frac(X_t, X_t + D_t \( w \)) lt.eq - 2 + C delta . $
  Choose $delta > 0$ so small that $mu = 4 - kappa \/ 2 - C delta > 0$. Until the first failure of the ratio bound, simultaneously for all these $w$,
  $ log frac(\| D_t \( w \) \|, \| X_t \|) lt.eq log frac(4 epsilon, \| x \|) - mu h - sqrt(kappa) thin tilde(B)_h . $
  For sufficiently small $epsilon$, $H = log \( delta \| x \| \/ \( 4 epsilon \) \)$ is positive. The Brownian motion with negative drift reaches that level with probability $exp \( - 2 mu H \/ kappa \)$. Thus with failure probability at most $C epsilon^(2 mu \/ kappa)$ the ratio never reaches $delta$. One may first apply the argument to compact sub-half-balls and countably many points. Analyticity and continuous dependence extend it simultaneously to the whole open half-ball.
  Put $U = B \( x \, 4 epsilon \) ∩ bb(H)$. On this event every point of $U$ stays live before $T_x$, so the trace avoids $U$ there. A capacity-parametrized generating trace cannot stay entirely on $bb(R)$ during a nondegenerate time interval: adding only real points leaves its filled half-plane hull unchanged, contrary to its strict capacity increase. If the trace visited $B \( x \, epsilon \) ∩ overline(bb(H))$ at a time $0 < t lt.eq T_x$, continuity would place a short preceding time interval inside $B \( x \, 4 epsilon \) ∩ overline(bb(H))$. That interval contains a time when the trace is in $bb(H)$, contradicting avoidance of $U$. The initial point $0$ is outside the smaller ball.
  If $T_x < oo$, then $\| X_t \| arrow.r 0$, and the ratio bound shows that every point of $U$ collides at $T_x$. Thus $U$ is disjoint from the surviving domain at that time. The smaller relative half-ball is disjoint even from its closure: each of its points has an upper-half-plane neighborhood contained in $U$. Future trace growth stays in that closure and cannot visit the smaller half-ball. If $T_x = oo$, the preceding argument already excludes every finite visit. This proves the real-center estimate.
  For $0 lt.eq "Im" v lt.eq sqrt(epsilon)$, a visit within $epsilon$ of $v$ gives a visit within $2 sqrt(epsilon)$ of $"Re" v$, to which the real estimate applies. For $"Im" v > sqrt(epsilon)$, the radius $2 epsilon$ is below $delta_0 \/ \( 8 upright(e) \)$ once $epsilon$ is sufficiently small, so (3.9) applies. Here
  $ M_0 \( v \) = \( 2 "Im" v \)^(- p) (frac("Im" v, \| v \|))^(a_0) lt.eq C \, $
  because $a_0 - p > 0$. An actual visit to $B \( v \, epsilon \)$ requires a live first hit of $partial B \( v \, 2 epsilon \)$. If the center were killed at or before that first hit, the still untouched open ball would be entirely swallowed and could not be entered later. By (3.7), the live hit gives $S_(2 epsilon) \( v \) < oo$. The approach estimate therefore proves the result for all $v$. ◻
]

=== 3.3 A conformal localization estimate <a-conformal-localization-estimate>

The next argument converts conformal area distortion into a probability estimate. Its constants require no modulus of boundary continuity for the conformal map. This is the uniformity needed when a previous trace has formed narrow passages.

#thm([Lemma 3.6.])[
  (Rectangle energy estimate).  #emph[Let $H > 0$, let $Q$ be a rectangle of fixed bounded aspect ratio, and let $u in W^(1 \, 2) \( Q \) ∩ C \( overline(Q) \)$ satisfy $0 lt.eq u lt.eq H$ and $u_Q lt.eq H \/ 2$. Write $E = integral_Q \| nabla u \|^2$. For any random set $cal(X)$ for which every dyadic level-$k$ subrectangle of $Q$ is hit with probability at most $C_02^(- alpha k)$, 
$ bb(P) { cal(X) ∩ { u = H } eq.not diameter } lt.eq C E / H^2 exp (- c H^2 / E) $

 whenever $E lt.eq c_0 H^2$. The constants depend only on the aspect ratio, $C_0$, and $alpha$. If $E = 0$, the probability is zero.]
] <ll:rectangle>

#proof[
  We first record a two-dimensional average estimate. If $Q_k$ is any nested chain of dyadic subrectangles with $Q_0 = Q$, then
  $ \| u_(Q_k) - u_Q \| lt.eq C sqrt(\( k + 1 \) E) . quad "(3.11)" $ <ll:nested-means>
  One proof is to reflect $u$ across the sides of $Q$ and use concentric annuli of radii comparable to $2^(- j)$ about the center of $Q_k$. The difference between means on consecutive annuli is at most $C$ times the square root of the energy on their union, by the scale-invariant Poincaré inequality. These unions have bounded overlap. Cauchy–Schwarz over the $k + O \( 1 \)$ annuli gives (3.11). Poincaré on a ball of comparable radius compares the innermost annular mean with $u_(Q_k)$ and the outermost mean with $u_Q$. The reflected region uses a bounded number of copies of $Q$, so its energy is at most $C E$.
  Choose $N = floor.l c_1 H^2 \/ E floor.r$ with $c_1 > 0$ sufficiently small. Decreasing $c_0$ if needed ensures $N gt.eq 1$ and, by (3.11), every mean through level $N$ is at most $3 H \/ 4$. If $u \( x \) = H$, choose a nested chain containing $x$. Continuity implies that its means tend to $H$. Hence, for some $j gt.eq 1$, the mean changes between levels $N + j - 1$ and $N + j$ by at least $c_2 H \/ j^2$, where $c_2$ is a sufficiently small numerical constant. Otherwise the total change is less than $H \/ 4$. Poincaré on the parent rectangle bounds such a mean difference by $C \( integral_(Q_(N + j - 1)) \| nabla u \|^2 \)^(1 \/ 2)$. Since level-$N + j - 1$ parents have disjoint interiors, at most $C E j^4 \/ H^2$ of them can have this property. They cover ${ u = H }$ after taking the union over $j$. The assumed hitting bound and a union bound give
  $ C E / H^2 sum_(j gt.eq 1) j^4 2^(- alpha \( N + j - 1 \)) lt.eq C E / H^2 e^(- c H^2 \/ E) . $
  Dyadic boundary points can be assigned either adjoining chain; closed rectangles and the stated hitting bound cover them as well. ◻
]

#thm([Proposition 3.7.])[
  (Uniform conformal localization).  #emph[Let $F : bb(H) arrow.r bb(C)$ be univalent and admit a continuous extension to $overline(bb(H))$ with values in the sphere. Suppose a continuous path $eta$ in $overline(bb(H))$ starts at $0$, reaches modulus $1$, and satisfies $F \( eta \) subset overline(B) \( q \, r \)$, where $r > 0$. There exist $b \, c \, C > 0$ and $L_0 > 1$, depending only on $kappa$, such that for every $L gt.eq L_0$, ordinary chordal SLE satisfies 
$ bb(P) {F \( gamma \[ 0 \, sigma_(L^b) \] \) subset.not B \( q \, L r \)} lt.eq C L^(- c) \, #h(2em) sigma_A = inf { t : \| gamma \( t \) \| = A } . $

 If the modulus stop is not reached, use the entire future trace. All four constants are independent of $F \, q \, r$, and of the path $eta$. Boundary excursions are included.]
] <ll:localization>

#proof[
  Put $H = log L$ and use strip coordinates $z = e^(v + i phi.alt)$, $0 < phi.alt < pi$. Set
  $ U \( v \, phi.alt \) = min { H \, log^(+) \( \| F \( e^(v + i phi.alt) \) - q \| \/ r \) } . $
  This function is continuous on each closed finite strip rectangle, including at a boundary pole of $F$, where it equals $H$. Conformal invariance of Dirichlet energy and univalence give
  $ integral_(bb(R) times \( 0 \, pi \)) \| nabla U \|^2 lt.eq integral_(r < \| w - q \| < L r) frac(d A \( w \), \| w - q \|^2) = 2 pi H . quad "(3.12)" $ <ll:total-energy>
  For every $v < 0$, the path assumption supplies a point on that vertical section where $U = 0$. One-dimensional Poincaré therefore bounds the mean of $U$ on $Q_j = \[ j \, j + 1 \] times \[ 0 \, pi \]$, $j < 0$, by $C sqrt(E_j)$, where $E_j = integral_(Q_j) \| nabla U \|^2$.
  Let $A \( v \) = pi^(- 1) integral_0^pi U \( v \, phi.alt \) thin d phi.alt$. For some $v_0 in \[ - 1 \, 0 \]$, $A \( v_0 \) lt.eq C sqrt(H)$. Cauchy–Schwarz applied to $A'$ gives, for $v gt.eq 0$,
  $ A \( v \) lt.eq C sqrt(H) + C sqrt(\( v + 1 \) H) . $
  Choose a fixed $b > 0$ small enough. There is then $H_0$, depending only on the constants above, such that for $H gt.eq H_0$, the mean on every slab with $j lt.eq b H$ is at most $H \/ 2$.
  Under the exponential map, a dyadic level-$k$ rectangle in $Q_j$ lies in a Euclidean disk of radius $C 2^(- k) e^j$ whose center has modulus comparable to $e^j$. Lemma 13 and Brownian scaling therefore bound its probability of being hit by the full SLE trace by $C 2^(- alpha k)$, uniformly in $j$. After increasing $H_0$ if necessary, (3.12) also gives $E_j lt.eq 2 pi H lt.eq c_0 H^2$. Lemma 14 consequently bounds the probability of a hit on ${ U = H }$ in $Q_j$ by $C \( E_j \/ H^2 \) e^(- c H^2 \/ E_j)$. The infinitely many slabs to the left cause no loss: since $E_j lt.eq 2 pi H$ and $sum_j E_j lt.eq 2 pi H$,
  $ sum_(j lt.eq b H) C E_j / H^2 e^(- c H^2 \/ E_j) lt.eq C / H e^(- c' H) lt.eq C L^(- c') . $
  Set $L_0 = exp \( H_0 \)$. Before $sigma_(L^b)$ the trace has $v lt.eq b H$. If its image leaves $B \( q \, L r \)$, continuity gives a point with $U = H$ in one of these slabs. The start itself maps into $overline(B) \( q \, r \)$. This proves the result, including points on either strip edge. ◻
]

=== 3.4 Swallowing and a rule in physical disks <swallowing-and-a-rule-in-physical-disks>

#thm([Lemma 3.8.])[
  (Uniform swallowing before a large excursion).  #emph[Suppose $4 < kappa < 8$. For ordinary chordal SLE and every $z in bb(H)$ with $\| z \| = 1$, let $T_z$ be its swallowing time. There are $C \, c > 0$ such that 
$ bb(P) { sigma_A lt.eq T_z } lt.eq C A^(- c) \, #h(2em) A gt.eq 2 \, $

 uniformly over the angle of $z$.]
] <ll:swallowing>

#proof[
  Use the clock $h = - log \( Y \/ Y_0 \)$ and put $P = X \/ Y$. Its generator is
  $ cal(G) = kappa / 4 \( 1 + P^2 \) partial_P^2 + 2 P partial_P \, #h(2em) frac(d t, d h) = Y_0^2 / 2 e^(- 2 h) \( 1 + P_h^2 \) . $
  Choose $0 < beta < 1 - 4 \/ kappa$ and set $V \( P \) = \( 1 + P^2 \)^(beta \/ 2)$. Direct differentiation yields
  $ frac(cal(G) V, V) = frac(2 beta P^2 + \( kappa beta \/ 4 \) \[ 1 + \( beta - 1 \) P^2 \], 1 + P^2) . $
  Its limit at infinity is $rho = 2 beta + kappa beta \( beta - 1 \) \/ 4 < beta$. Choose $rho < lambda < beta$. Then $cal(G) V lt.eq lambda V + C$, and localized Itô followed by Gronwall gives
  $ bb(E) V \( P_h \) lt.eq C e^(lambda h) V \( P_0 \) . quad "(3.13)" $ <ll:swallow-moment>
  The coefficients of the SDE for $P$ have linear growth, so its solution exists for every finite $h$. Every such $h$ is reached by the original time change before its lifetime: a finite terminal $h$ would leave $P$ finite and $Y = Y_0 e^(- h) > 0$, while the displayed clock gives finite Loewner time. The original Loewner equation would then extend beyond its supposed lifetime, a contradiction. Both drift and diffusion coefficients of $log V \( P_h \)$ are bounded. The exponential maximal inequality for its martingale part on a unit interval therefore gives
  $ bb(E) [sup_(n lt.eq h lt.eq n + 1) V \( P_h \)] lt.eq C e^(lambda n) V \( P_0 \) . quad "(3.14)" $ <ll:swallow-sup>
  One can see the conditional version directly: the martingale part has bracket at most a constant on that interval, hence its maximum has uniformly bounded exponential moment; the bounded drift only changes the multiplicative constant.
  Because $0 < beta \/ 2 < 1$, subadditivity of $x^(beta \/ 2)$ and (3.14) show that the terminal Loewner clock satisfies
  $ bb(E) T_oo^(beta \/ 2) & lt.eq C Y_0^beta sum_(n gt.eq 0) e^(- beta n) bb(E) sup_(n lt.eq h lt.eq n + 1) V \( P_h \)\
 & lt.eq C Y_0^beta V \( P_0 \) sum_(n gt.eq 0) e^(- \( beta - lambda \) n) lt.eq C \| z \|^beta = C . $
  This finite clock ends at collision. Indeed $Y_h = Y_0 e^(- h) arrow.r 0$, and the same unit-interval estimate gives
  $ bb(E) sup_(n lt.eq h lt.eq n + 1) \| X_h \|^beta lt.eq C \| z \|^beta e^(- \( beta - lambda \) n) . $
  Markov and Borel–Cantelli imply $X_h arrow.r 0$. Thus $T_oo = T_z$, rather than a spurious endpoint of the time change, and $bb(P) { T_z > A } lt.eq C A^(- beta \/ 2)$.
  A hull driven through time $t$ lies below height $2 sqrt(t)$ and between the minimum and maximum of its driver. The height bound follows from $d \( Y^2 \) \/ d t gt.eq - 4$ for a point not yet swallowed; the horizontal bound follows because a real part beyond the driver range moves away from that range under the ODE. Consequently, for large $A$, a trace excursion to modulus $A$ by time $A$ forces $sup_(t lt.eq A) \| sqrt(kappa) B_t \| gt.eq c A$. The Brownian reflection bound makes the probability of this event at most $C e^(- c' A)$. Splitting according to $T_z > A$ proves the claim, after changing constants for bounded $A$. ◻
]

#thm([Proposition 3.9.])[
  (The conditional physical-disk rule).  #emph[Suppose $4 < kappa < 8$. There exist $C \, c > 0$ and $L_0 gt.eq 2$, depending only on $kappa$, with the following property. Consider ordinary chordal SLE in $bb(H)$, possibly after a finite stopping time with a past already drawn, or a fixed similarity of such an evolution. Suppose $overline(B) \( z \, r \)$ is strictly inside the current surviving domain. Let $tau$ be the subsequent first hit of $partial B \( z \, r \)$. For $L gt.eq L_0$, on ${ tau < oo \, med z in D_tau }$, set 
$ sigma = inf { t gt.eq tau : \| gamma \( t \) - z \| gt.eq L r } \, $

 with value infinity if there is no such time. Then 
$ bb(P) { sigma < oo \, med z in D_sigma divides cal(F)_tau } lt.eq C L^(- c) . $

 The event in the display is an exit while the point is still live. The constants are independent of the past, the initial disk, and the exit time.]
] <ll:disk-rule>

#proof[
  The first hit is a fresh interior tip. By Lemma 5, the radial physical segment from this tip to $z$ has its interior in $D_tau$ and approaches the tip’s prime end. Map $D_tau$ to $bb(H)$, sending tip to zero, target to infinity, and normalize the image of $z$ to have modulus one. Lemma 3 gives the continuous spherical boundary extension of its inverse $F$. The radial segment supplies exactly the path assumption of Proposition 15, with the physical ball $overline(B) \( z \, r \)$.
  Increase $L_0$ so that Proposition 15 applies and $L^b gt.eq 2$ for $L gt.eq L_0$. Except on an event of conditional probability $C L^(- c_1)$, the mapped future trace stays in $B \( z \, L r \)$ up to the parameter-plane modulus $L^b$. Except on an event of conditional probability $C \( L^b \)^(- c_2)$, Lemma 16 swallows the normalized marked point before that modulus is reached. Outside their union, the physical point is swallowed before an exit from $B \( z \, L r \)$. The domain Markov property supplies the same ordinary half-plane law for every past. This proves the stated uniform bound. ◻
]

== 4 A uniform tail for spatially integrated stopped densities <mesh:section>

We prove the estimate that determines the logarithmic correction in the gauge. The essential feature is uniformity in the final mesh: a large threshold is tested first at an intermediate mesh, and the remaining increments must be controlled down to any prescribed finer mesh.

Throughout this section, $0 < kappa < 8$ is fixed,

$ p = 1 - kappa \/ 8 \, #h(2em) d = 2 - p \, #h(2em) a_0 = 8 \/ kappa - 1 . $

We use the capacity normalization $partial_t g_t = 2 \/ \( g_t - sqrt(kappa) B_t \)$. The initial domains considered here are surviving domains of an ordinary half-plane trace at finite stopping times, and their Euclidean similarities. Conditional statements below refer to the ordinary chordal law in that domain, with its marked tip and target. We write $D_t$ for its subsequent surviving domain.

===== 4.1 Inputs used here. <inputs-used-here.>

Lemmas 9 and 11 supply the nonnegative density

$ M_t \( z \) = R_(D_t) \( z \)^(- p) sin^(a_0) theta_t \( z \) \, $

continued by zero on killing. Here $R$ is the full conformal radius and $theta$ is the argument of the image point in tip–target half-plane coordinates. We use the following precise parts of that law. First, on a region where the distance from $z$ to the domain boundary is bounded below, $M_t \( z \)$ is a bounded stopped martingale. If a smaller distance is never reached, its terminal contribution is zero. Second, at a live stopping time, the probability of a subsequent approach to distance $u$, for $u$ smaller than a fixed multiple of the current distance to the boundary, is at most $C u^p M_t \( z \)$. The expected density at that approach is $M_t \( z \)$. All these assertions use only finite stopped changes of law and monotone exhaustion. The coefficient of $d B_t$ in $M_t \( z \)$ has absolute value at most

$ C R_(D_t) \( z \)^(- p) sin^(a_0) theta_t \( z \) \/ \| Z_t \( z \) \| \, #h(2em) Z_t \( z \) = G_t \( z \) - sqrt(kappa) B_t . quad "(4.1)" $ <mesh:coefficient-input>

Here $G_t$ includes the initial uniformization: if the initial domain is $J \( bb(H) \)$, then $G_t = g_t compose J^(- 1)$, with $g_t$ in the half-plane Loewner coordinates of Section 3. When $kappa > 4$, Proposition 17 supplies one more estimate. Suppose $overline(B) \( z \, r \)$ is contained in the initial domain. At its first circle hit, if $z$ is still live, the conditional probability that the next exit of $B \( z \, L r \)$ occurs with $z$ still live is at most $C L^(- c)$ for all sufficiently large $L$. The outer disk need not be free. The domain class is exactly the one stated above.

After a translation, fix $A = B \( 0 \, 1 \)$ with a fixed enlargement contained in the initial domain. All the points in $A$ consequently have a uniform initial boundary clearance, which we denote by $rho_(upright("col")) > 0$. For $0 < r < rho_(upright("col"))$, let $tau_r \( z \)$ be the first live approach of the trace to distance $r$ from $z$, with value infinity if there is none, and set

$ W_r \( z \) = M_(tau_r \( z \)) \( z \) upright(bold(1))_({ tau_r \( z \) < oo }) \, #h(2em) I_r \( z \) = upright(bold(1))_({ tau_r \( z \) < oo }) . $

The maps $\( z \, omega \) mapsto tau_r \( z \) \, W_r \( z \) \, I_r \( z \)$ have jointly measurable versions: before killing this follows from continuous trace distance and the continuous Loewner maps. The weights $W_r$ and indicators $I_r$ are zero when no live approach occurs; the stopping time then has value $oo$. One may first localize the maps on compact subsets of the surviving domain and then exhaust. On a finite approach, (3.7) gives

$ "dist" \( z \, partial D_(tau_r \( z \)) \) = r . $

Thus at $tau_r \( z \)$ the restarted estimates of Lemma 11 apply to the finer distance $q r$ whenever $0 < q lt.eq 1 \/ \( 8 upright(e) \)$.

#thm([Proposition 4.1.])[
  (Integrated mesh tail).  #emph[There are constants $C \, c > 0$ and $0 < delta_0 < rho_(upright("col"))$, depending only on $kappa$ and the fixed collar, such that, for $0 < r_f lt.eq delta lt.eq delta_0$, 
$ bb(P) {integral_A W_(r_f) \( z \) thin d A \( z \) > C delta^(- p)} lt.eq C exp \( - c delta^(- 2) \) . quad "(4.2)" $ <mesh:tail-equation>

 The constants are uniform over the stated initial marked domains, including conditioning on any past for which the collar is free. They do not depend on the final distance $r_f$ or on an upper bound for the distance to the tip. The same estimate holds if only approaches by a fixed or stopping time are counted.]
] <mesh:tail>

The last assertion follows pointwise by deleting contributions. We will also use the following form, valid for every prescribed final distance $0 < e < rho_(upright("col"))$ with constants independent of $e$:

$ bb(P) {integral_A W_e thin d A > u} lt.eq C exp \( - c u^(2 \/ p) \) \, #h(2em) u gt.eq u_0 . quad "(4.3)" $ <mesh:normalized-tail>

Here is the exact passage from (4.2) to this form. Write $C_(upright(t))$ for the threshold constant in that equation. The pointwise bound $W_e lt.eq e^(- p)$ at a first live approach gives $integral_A W_e thin d A lt.eq C_(upright(d)) e^(- p)$. Choose $C_0 gt.eq max \( C_(upright(t)) \, C_(upright(d)) \)$, and for $u gt.eq u_0 := C_0 delta_0^(- p)$ set $delta = \( C_0 \/ u \)^(1 \/ p)$. If $e lt.eq delta$, then (4.2) applies and its threshold is at most $u$. If $e > delta$, the deterministic bound is strictly less than $C_(upright(d)) delta^(- p) lt.eq u$, so the event is empty. These two cases prove (4.3). Scaling space by $R$ multiplies the density by $R^(- p)$ and area by $R^2$. Thus on a disk of radius $R$, the same bound has threshold $u R^d$ and permits final distances $0 < e < R rho_(upright("col"))$.

=== 4.1 Brownian occupation of a boundary layer <brownian-occupation-of-a-boundary-layer>

The bracket estimate will use a geometric fact about the Dirichlet Green function. The Green occupation identity is classical; we use the killed Brownian version described in #cite(label("mortersperes2010")) §3.3, Definitions 3.28 and 3.31 and Theorem 3.32, pp. 78–80. The uniform boundary-layer estimate below requires an additional argument and no smoothness of the boundary.

#thm([Lemma 4.2.])[
  (Boundary-layer occupation).  #emph[Let $D$ be a simply connected plane domain with connected unbounded complement, and let $K_D$ be its Dirichlet Green function in the normalization 
$ K_(bb(H)) \( z \, w \) = log lr(|frac(z - overline(w), z - w)|) . $

 For every $r > 0$ and every $z in D$, 
$ integral_({ w in D : "dist" \( w \, partial D \) lt.eq r }) K_D \( z \, w \) thin d A \( w \) lt.eq C r^2 . quad "(4.4)" $ <mesh:layer-bound>

]
] <mesh:layer>

#proof[
  Figure 1 illustrates the forced circuit and the occupation blocks used below. We first record a uniform exit probability. If $x in D$ is within distance $r$ of $D^c$, planar Brownian motion starting at $x$ has probability at least $eta > 0$ of exiting $D$ before time $A r^2$, for absolute constants $A \, eta$. To see this, scale and translate so that $x = 0 \, r = 1$. Brownian motion has a fixed positive probability of making, within a fixed time, a circuit in a fixed annulus that separates $overline(B) \( 0 \, 2 \)$ from infinity. This is a finite open crossing event: use overlapping rectangles along a circular route and two transverse crossings of the final rectangle to force intersection with the initial portion, and hence a separating closed subcurve. Its probability is positive by Brownian scaling, the Markov property and positive transition probabilities through the prescribed rectangles. If the path has not exited earlier, that circuit must meet $D^c$: $D^c$ is connected, meets $overline(B) \( 0 \, 1 \)$, and is unbounded. This proves the asserted exit probability.
  Let $zeta$ be Brownian exit time from $D$, and let $E_r$ be the layer in the integral. Start a time block of length $A r^2$ at the first entrance into $E_r$. After a block ends, start the next block at the next entrance into $E_r$, unless exit has already occurred. Entrance times are stopping times; one may equally first use the open layer of width $2 r$ to avoid any convention at its outer boundary. Conditional on every block start before $zeta$, the probability of exit during the block is at least $eta$. Thus the expected number of blocks is at most $1 \/ eta$. All time spent in $E_r$ before exit is included in these blocks, since the gaps contain no visit to $E_r$. Consequently
  $ bb(E)_z integral_0^zeta upright(bold(1))_(E_r) \( B_t \) thin d t lt.eq A r^2 \/ eta . $
  The Green occupation formula gives (4.4), up to the absolute constant determined by the Brownian generator. This formula can first be applied in bounded exhaustions of $D$ and then passed to the limit by monotone convergence. The occupation estimate itself shows that the layer integral remains finite. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.25, -0.15), (14.6, 10.1))
  content((0, 9.85), [\(a\) A forced circuit after scaling $x=0$, $r=1$], anchor: "west")
  content((8.25, 9.85), [\(b\) The two crossings of $Q$], anchor: "west")
  circle((3.35, 6.2), radius: 1.76, fill: rgb("#f5f5f5"))
  circle((3.35, 6.2), radius: 1.76, stroke: (paint: rgb("#999999"), dash: "dashed"))
  circle((3.35, 6.2), radius: 0.88, stroke: (paint: rgb("#a6a6a6"), dash: "dotted"))
  circle((3.35, 6.2), radius: 0.05644, fill: black)
  content((3.28, 6.253), [$0$], anchor: "south-east")
  content((3.218, 7.256), [$B(0,2)$])
  line((5.99, 6.728), (5.99, 8.312), (5.462, 8.972), (1.238, 8.972), (0.578, 8.312), (0.578, 4.088), (1.238, 3.428), (5.462, 3.428), (5.594, 4.22), (5.594, 6.2), (6.474, 6.2), stroke: (thickness: 12.0pt))
  line((5.99, 6.64), (6.043, 7.344), (5.937, 7.784), (5.99, 8.268), (5.752, 8.62), (5.436, 8.919), (4.934, 8.946), (4.318, 8.893), (3.658, 9.016), (3.13, 8.91), (2.47, 8.998), (1.836, 8.937), (1.238, 8.963), (0.8684, 8.629), (0.622, 8.268), (0.5516, 7.652), (0.6484, 6.904), (0.534, 6.306), (0.6044, 5.716), (0.5692, 5.012), (0.622, 4.088), (0.9564, 3.692), (1.273, 3.472), (1.942, 3.402), (2.734, 3.49), (3.482, 3.428), (4.054, 3.472), (4.67, 3.402), (5.436, 3.472), (5.62, 4.22), (5.559, 4.88), (5.638, 5.496), (5.594, 6.2), (5.656, 6.2), stroke: (thickness: 1.05pt))
  line((2.954, 8.954), (2.514, 8.972))
  line((3.438, 3.437), (3.922, 3.454))
  bezier((3.35, 6.2), (5.99, 5.672), (4.23, 5.76), (5.77, 5.1), stroke: (dash: "dashed"))
  content((3.13, 5.602), [initial approach], anchor: "north-west")
  rect((5.638, 5.76), (6.342, 6.64), fill: rgb("#ffffff"))
  rect((5.638, 5.76), (6.342, 6.64), stroke: (paint: rgb("#595959"), dash: "dashed"))
  line((5.99, 5.628), (5.937, 5.936), (5.99, 6.2), (6.06, 6.446), (5.99, 6.781), stroke: (thickness: 1.15pt))
  line((5.541, 6.218), (5.77, 6.174), (5.99, 6.2), (6.236, 6.262), (6.474, 6.218), stroke: (thickness: 1.15pt))
  content((6.386, 6.728), [$Q$], anchor: "west")
  content((3.35, 3.12), [ordered corridor: one counterclockwise turn], anchor: "north")
  rect((10.8, 4.95), (11.6, 8.25), fill: black)
  rect((9.55, 6.2), (12.85, 7), fill: black)
  rect((9.55, 4.95), (12.85, 8.25), stroke: (paint: rgb("#4d4d4d")))
  content((12.82, 8.24), [$Q$], anchor: "north-east")
  line((11.15, 4.75), (11.33, 5.18), (11.1, 5.65), (11.35, 6), (11.1, 6.33), (11.2, 6.6), (11.35, 6.97), (11.04, 7.4), (11.28, 7.85), (11.2, 8.5), stroke: (thickness: 1.4pt))
  line((9.32, 6.66), (9.83, 6.51), (10.29, 6.74), (10.74, 6.48), (11.2, 6.6), (11.66, 6.72), (12.13, 6.53), (12.57, 6.69), (13.09, 6.62), stroke: (thickness: 1.4pt))
  circle((11.2, 6.6), radius: 0.07408, fill: black)
  content((11.56, 7.03), [a common point], anchor: "south-west")
  line((11.58, 7.04), (11.25, 6.66))
  content((11.2, 8.7), [first: bottom to top], anchor: "south")
  content((11.2, 4.62), [last: left to right], anchor: "north")
  content((0, 2.28), [\(c\) Covering all occupation of $E_r$ by time blocks], anchor: "west")
  line((0.2, 0.87), (14.1, 0.87), stroke: (paint: rgb("#4d4d4d")))
  content((14.1, 0.87), [$t$], anchor: "west")
  rect((0.8, 0.91), (3.5, 1.43), fill: black)
  rect((0.8, 0.91), (3.5, 1.43))
  rect((5, 0.91), (7.7, 1.43), fill: black)
  rect((5, 0.91), (7.7, 1.43))
  rect((9.2, 0.91), (11.9, 1.43), fill: black)
  rect((9.2, 0.91), (11.9, 1.43))
  rect((10.95, 0.89), (12, 1.48), fill: rgb("#ffffff"))
  line((10.95, 0.6), (10.95, 1.65), stroke: (paint: rgb("#333333"), dash: "dashed"))
  content((10.95, 1.67), [$zeta$], anchor: "south")
  line((0.8, 1.14), (1.35, 1.14), stroke: (thickness: 3.0pt))
  line((1.8, 1.14), (2, 1.14), stroke: (thickness: 3.0pt))
  line((2.65, 1.14), (3, 1.14), stroke: (thickness: 3.0pt))
  line((5, 1.14), (5.85, 1.14), stroke: (thickness: 3.0pt))
  line((6.7, 1.14), (7.3, 1.14), stroke: (thickness: 3.0pt))
  line((9.2, 1.14), (9.75, 1.14), stroke: (thickness: 3.0pt))
  line((10.1, 1.14), (10.8, 1.14), stroke: (thickness: 3.0pt))
  line((0.8, 1.7), (3.5, 1.7), mark: (start: "<", end: ">"))
  content((2.15, 1.7), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$"Ar"^2$])])
  content((0.8, 0.68), [$sigma_1$], anchor: "north")
  content((5, 0.68), [$sigma_2$], anchor: "north")
  content((9.2, 0.68), [$sigma_3$], anchor: "north")
  content((4.35, 1.64), [outside $E_r$], anchor: "south")
  line((4.35, 1.6), (4.35, 1.05))
  content((11.7, 0.27), [visits to $E_r$], anchor: "west")
  line((11.15, 0.39), (11.6, 0.39), stroke: (thickness: 3.0pt))
  content((0, -0.03), [Schematic; spatial corridors and time blocks are not to scale.], anchor: "west")
})],
  caption: [Figure 1: Forcing exit near an arbitrary boundary. (a,b) The first path segment crosses the rectangle $Q$ from bottom to top. It then follows an ordered, sufficiently thin corridor for one counterclockwise turn around $overline(B) \( 0 \, 2 \)$ and returns across $Q$ from left to right. The two crossings intersect, creating a closed subpath with winding number one about the disk; its trace separates the disk from infinity. Self-intersections are allowed. Thus the path meets every connected unbounded complement that meets $overline(B) \( 0 \, 1 \)$. (c) At each entrance $sigma_j$ after the preceding block, a block of length $A r^2$ begins. The orange pieces represent occupation of $E_r = { u in D : "dist" \( u \, partial D \) lt.eq r }$; the gaps have none. Conditional on each block start before exit $zeta$, the probability of exit in that block is at least $eta$. Hence the expected occupation is at most $A r^2 \/ eta$. ],
) <fig:brownian-circuit>

=== 4.2 Asynchronously started brackets for $kappa lt.eq 4$ <asynchronously-started-brackets-for-kappale4>

Schramm–Sheffield use Dirichlet Green decrease in their SLE$""_4$ and Gaussian-free-field covariance calculation #cite(label("schrammsheffield2013")) Lemmas 2.5–2.6. Here each point starts and stops at its own first approach times, so the spatial bracket estimate needs the additional later-start decomposition below.

Fix $0 < q lt.eq 1 \/ \( 8 upright(e) \)$. For the moment consider one slab from first distance $r$ to first distance $q r$. A point is #emph[active] after $tau_r \( z \)$ until $tau_(q r) \( z \)$ or killing. The one-point martingale is bounded on this interval by $C r^(- p)$, where $C$ may depend on the fixed ratio $q$. Because $a_0 gt.eq 1$, its Brownian coefficient $b_t \( z \)$, set to zero outside this interval, satisfies

$ \| b_t \( z \) \| lt.eq C r^(- p) frac(Y_t \( z \), \| Z_t \( z \) \|^2) . quad "(4.5)" $ <mesh:active-coefficient>

Indeed the initial collar and the fact that the smaller trace distance has not yet been reached give $R_(D_t) \( z \) gt.eq q r$, whereas $sin^(a_0) theta lt.eq sin theta$.

For two live distinct points put $K_t \( z \, w \) = K_(D_t) \( z \, w \)$. The common Brownian translation cancels in the differences appearing in its half-plane formula. Direct differentiation of the Loewner equation therefore gives

$ - partial_t K_t \( z \, w \) = 4 frac(Y_t \( z \), \| Z_t \( z \) \|^2) frac(Y_t \( w \), \| Z_t \( w \) \|^2) . quad "(4.6)" $ <mesh:green-decrease>

Consider pairs whose active intervals overlap. Assign such a pair to its later starting point, say $z$, so that $tau_r \( w \) lt.eq tau_r \( z \)$. The contribution of the overlapping interval to the integral of $\| b_t \( z \) b_t \( w \) \|$ is at most

$ C r^(- 2 p) K_(D_(tau_r \( z \))) \( z \, w \) . quad "(4.7)" $ <mesh:pair-bound>

Here we used positivity of the Green function at the end of the overlap. Infinite terminal intervals follow by monotone convergence.

At time $tau_r \( z \)$ the earlier point $w$ is still in the domain and lies within distance $r$ of its boundary. This is because it was within that distance at its own start and the domains decrease. For each fixed $z$, its starting time does not depend on the dummy integration variable $w$. Lemma 19 thus applies in the single domain $D_(tau_r \( z \))$ and gives

$ integral_({ w : w upright(" is active at ") tau_r \( z \) }) K_(D_(tau_r \( z \))) \( z \, w \) thin d A \( w \) lt.eq C r^2 . $

Integrating in $z in A$ and allowing both orders of the pair yields the pathwise bound

$ integral_0^oo lr(|integral_A b_t \( z \) thin d A \( z \)|)^2 d t lt.eq integral_(A^2) integral_0^oo \| b_t \( z \) b_t \( w \) \| thin d t thin d A \( z \) d A \( w \) lt.eq C r^(2 - 2 p) . quad "(4.8)" $ <mesh:bracket-bound>

The spatial diagonal has area measure zero. Ties of the starting times may be assigned either order or counted twice; the upper bound is unchanged. Points with no start contribute zero.

We spell out the stochastic integration step. For $s in { r \, q r }$, let

$ M_t^(\( s \)) \( z \) = M_(t and tau_s \( z \)) \( z \) \, #h(2em) N_t \( z \) = M_t^(\( q r \)) \( z \) - M_t^(\( r \)) \( z \) \, $

using the zero continuation of $M$ at killing. The collar and the distance cutoff give $0 lt.eq M_t^(\( s \)) lt.eq C s^(- p)$. If the distance approach never occurs, the live conformal radius stays above $s$. The radius terminal-zero assertion of Lemma 11 then makes the zero continuation continuous at killing and gives $M_oo^(\( s \)) = 0$. At a finite approach the process is frozen at $W_s$, so in all cases $M_oo^(\( s \)) = W_s$. Localization and bounded convergence therefore make each stopped process a bounded continuous martingale. Since $tau_(q r) gt.eq tau_r$, the difference $N_t \( z \)$ is zero before its start and has coefficient $b_t \( z \)$ precisely while the point is active. This formula also covers a missing start and an infinite terminal interval.

Choose a version of $b_t \( z \)$ jointly measurable for the product of the Borel sigma field on $A$ and the predictable sigma field. Compact localization of the continuous adapted Loewner coefficients and the indicators of the stochastic intervals supplies this version. The uniform bound $\| N_t \( z \) \| lt.eq C r^(- p)$ bounds its expected quadratic variation by $C r^(- 2 p)$. On the finite area set $A$, this gives

$ integral_A (bb(E) integral_0^oo \| b_t \( z \) \|^2 d t)^(1 \/ 2) d A \( z \) < oo . $

The $L^2$ stochastic Fubini theorem, or simple spatial approximation and the Itô isometry, now identifies $N_t = integral_A N_t \( z \) d A \( z \)$ with the Brownian integral of $integral_A b_t \( z \) d A \( z \)$. It converges in $L^2$ at infinity. The same uniform bound permits the pointwise terminal identity to pass through the spatial integral, giving

$ N_oo = integral_A \( W_(q r) - W_r \) thin d A . $

All uses of Fubini in (4.8) concern nonnegative functions and are valid pathwise. Thus no interchange of uncontrolled signed infinite-time integrals is needed.

The exponential martingale inequality and (4.8) imply

$ bb(P) {integral_A \( W_(q r) - W_r \) thin d A > x} lt.eq exp (- frac(c x^2, r^(2 - 2 p))) . quad "(4.9)" $ <mesh:slab-tail>

This estimate, notably, permits different starting times for all points in the spatial integral.

=== 4.3 Summing the slabs for $kappa lt.eq 4$ <summing-the-slabs-for-kappale4>

Given $r_f lt.eq delta$, choose $N gt.eq 0$ and $r_0 in \( q delta \, delta \]$ so that $r_j = r_0 q^j$ and $r_N = r_f$. This harmless adjustment ensures that even the final slab has ratio exactly $q$. The initial bound $S_0 := integral_A W_(r_0) thin d A lt.eq C delta^(- p)$ is deterministic. Apply (4.9) with $x_j = delta^(- p) \/ \( j + 1 \)^2$. The exceptional probability is at most

$ exp (- c delta^(- 2) frac(q^(- 2 \( 1 - p \) j), \( j + 1 \)^4)) . $

The sum of these probabilities over all $j gt.eq 0$ is bounded by $C exp \( - c' delta^(- 2) \)$: an exponential sequence divided by a fixed power has a positive minimum and then grows geometrically. Outside this union of exceptions,

$ S_N lt.eq S_0 + sum_(j = 0)^(N - 1) x_j lt.eq C' delta^(- p) . $

This proves Proposition 18 for $kappa lt.eq 4$.

=== 4.4 An integrated concentration estimate for disjoint windows <an-integrated-concentration-estimate-for-disjoint-windows>

The following elementary concentration argument allows the order of the tests to depend on the curve. In particular, it does not condition on a permutation of the test locations.

#thm([Lemma 4.3.])[
  (Disjoint-window concentration).  #emph[Let $D subset B \( 0 \, 1 \)$ be Borel, let $0 < r lt.eq R$ and $K > 0$ with $3 R lt.eq 1$, and let $gamma$ be a continuous adapted curve. For each $z in D$, suppose that a test starts at a stopping time $sigma_z$, with $sigma_z = oo$ if it never starts. At a finite start, 
$ \| gamma \( sigma_z \) - z \| = r . $

 Suppose its ending time $tau_z gt.eq sigma_z$ is a stopping time and $gamma \( t \) in B \( z \, R \)$ for $sigma_z lt.eq t < tau_z$. Let $Y_z$ be an $cal(F)_(tau_z)$-measurable output satisfying $0 lt.eq Y_z lt.eq K$, and let $mu_z gt.eq 0$ be $cal(F)_(sigma_z)$-measurable, with 
$ bb(E) \[ Y_z divides cal(F)_(sigma_z) \] lt.eq mu_z quad upright("on ") { sigma_z < oo } . $

 Assume the outputs and upper means are jointly measurable in $\( z \, omega \)$, are zero when there is no start, and are uniformly bounded. If a started window never ends, assume its output is zero. Then 
$ bb(E) exp (lambda integral_D \( Y_z - mu_z \) thin d A \( z \)) lt.eq exp \( C K^2 lambda^2 R^2 \) \, #h(2em) lambda gt.eq 0 \, quad "(4.10)" $ <win:mgf>

 and hence, for $b > 0$, 
$ bb(P) {integral_D \( Y_z - mu_z \) thin d A \( z \) > b} lt.eq exp (- frac(c b^2, K^2 R^2)) . quad "(4.11)" $ <win:tail>

 Here $C \, c > 0$ are absolute constants. The same conclusion holds conditionally on an initial sigma field if all the hypotheses and conditional-mean estimates hold after that conditioning.]
] <win:concentration>

#proof[
  Set $a = 3 R$. Fix a shift $xi in Q = \[ 0 \, a \)^2$, and consider the finitely many centers of $\( xi + a bb(Z)^2 \) ∩ D$. Their number is at most $N lt.eq C a^(- 2)$. Use the convention $cal(F)_oo = sigma \( union.big_(t < oo) cal(F)_t \)$. While a window at $z$ is running, a window at any other lattice center $w$ cannot start: otherwise
  $ \| z - w \| lt.eq \| z - gamma \( sigma_w \) \| + \| gamma \( sigma_w \) - w \| < R + r lt.eq 2 R < 3 R . $
  Order the finite starts by always waiting for the next start among the remaining centers. The minimum of the remaining stopping times is a stopping time, and its index is measurable at that time. Distinct finite starts cannot tie, by the same geometric argument. The preceding window has ended by the next start, so its output is already known. This is an adaptive enumeration, not conditioning on an eventual order.
  For its $k$th actual test write $Z_k = Y_k - mu_k$. Conditional Hoeffding’s lemma gives, for $theta gt.eq 0$,
  $ bb(E) \[ e^(theta Z_k) divides cal(F)_(sigma_k) \] lt.eq exp \( K^2 theta^2 \/ 8 \) . $
  Indeed $Y_k$ has conditional range of length at most $K$, and $bb(E) \[ Y_k divides cal(F)_(sigma_k) \] - mu_k lt.eq 0$. For the selected test this inequality follows by partitioning over the finitely many possible center indices, each known at the start. The filtration at the end of test $k - 1$ is contained in that at the start of test $k$. Iterating conditional expectations therefore yields
  $ bb(E) exp (theta sum_(k = 1)^N Z_k) lt.eq exp \( N K^2 theta^2 \/ 8 \) . $
  Here missing tests are padded with zero increments. This also covers infinite waiting. If a started window lasts forever, its confinement prevents every later lattice start, its own increment is $- mu_k lt.eq 0$, and all later increments are zero. Equivalently, one can use terminal sigma fields at the infinite stopping times in the same argument.
  Extend $f \( z \) = Y_z - mu_z$ by zero outside $D$, and set
  $ T_xi = a^2 sum_(z in xi + a bb(Z)^2) f \( z \) . $
  Taking $theta = lambda a^2$ gives $bb(E) e^(lambda T_xi) lt.eq exp \( C K^2 lambda^2 a^2 \)$. The exact averaging identity is
  $ integral_D f \( z \) thin d A \( z \) = 1 / a^2 integral_Q T_xi thin d xi . $
  Jensen’s inequality, followed by Tonelli’s theorem, proves (4.10). There is no probabilistic independence assumption on the shift. Optimizing the exponential Markov bound in $lambda$ proves (4.11). ◻
]

=== 4.5 The mesh tail for $4 < kappa < 8$ <the-mesh-tail-for-4kappa8>

#proof[
  Use the first approach times $tau_r \( z \)$, the densities $W_r \( z \)$, and the indicators $I_r \( z \)$ already defined. The pointwise bound is $W_r lt.eq C r^(- p) I_r$. Lemma 11 gives, at a finite $tau_r \( z \)$ and for one fixed $0 < q lt.eq 1 \/ \( 8 upright(e) \)$,
  $ bb(P) { I_(q r) \( z \) = 1 divides cal(F)_(tau_r \( z \)) } lt.eq C \( q r \)^p W_r \( z \) . quad "(4.12)" $ <win:onepoint-input>
  The conditional expected density at that finer approach is $W_r \( z \)$; requiring it to occur before an additional stop can only decrease this expectation. Proposition 17 gives constants $C_(*) \, c_(*) \, L_0 > 0$ for which a live exit from $B \( z \, L r \)$ has conditional probability at most $C_(*) L^(- c_(*))$ for $L gt.eq L_0$. These are exactly the mean bounds needed for the three window outputs below. Their constants are uniform over the permitted initial pasts.
  Choose $r_0 in \[ q delta \, delta \]$ and an integer $n gt.eq 0$ such that $r_f = r_0 q^n$, and set $r_j = r_0 q^j$. Thus every consecutive ratio is exactly $q$, including the last; the starting mesh changes only by a fixed factor. Fix $0 < epsilon < 1 - p$. For the moment let $L_(*) gt.eq L_0$ be arbitrary and set
  $ L_j = L_(*) q^(- epsilon j) . $
  During the estimates below suppose that $delta < rho_(upright("col"))$ and $3 L_(*) delta lt.eq 1$. After deriving the recurrences we will choose $L_(*)$ and then $delta_0$ to enforce these requirements. At every level,
  $ L_j r_j = L_(*) r_0 q^(\( 1 - epsilon \) j) lt.eq L_(*) delta lt.eq 1 / 3 \, $
  as required in Lemma 20. Also each $overline(B) \( z \, r_j \)$ lies in the original collared initial domain, and a finite $tau_(r_j) \( z \)$ is its first circle hit with $z$ live. These are the hypotheses on the inner disk in Proposition 17 at every level.
  At a finite start $tau_(r_j) \( z \)$, stop the window at the first of the next live $r_(j + 1)$-approach, exit from $B \( z \, L_j r_j \)$, and death of $z$. Let $H_j \( z \)$ indicate a next approach achieved during this window, let
  $ V_j \( z \) = r_j^p W_(r_(j + 1)) \( z \) H_j \( z \) \, $
  and let $B_j \( z \)$ indicate an outer exit before that next approach, with $z$ still live. Set all three outputs to zero if no window starts. A window which never ends has all three outputs zero. The outputs are bounded by a constant depending only on the fixed parameters, since $V_j lt.eq C q^(- p)$. First exits of the continuous process $t mapsto \| gamma \( t \) - z \|$ and death times from the live Loewner maps are jointly measurable after compact localization. Thus these outputs and the upper means below have the jointly measurable versions required by Lemma 20.
  The three conditional upper means at the start, also set to zero for no start, are respectively
  $ mu_j^H \( z \) & = C \( q r_j \)^p W_(r_j) \( z \) \,\
mu_j^V \( z \) & = r_j^p W_(r_j) \( z \) \,\
mu_j^B \( z \) & = C_(*) L_j^(- c_(*)) I_(r_j) \( z \) . quad "(4.13)" $ <win:means>
  The pointwise bound on $W_(r_j)$ and $L_j gt.eq L_0$ make these upper means uniformly bounded as well. The first two follow from Lemma 11. The bad event is a subset of the local-rule event, so the last bound follows from Proposition 17. Lattice windows have disjoint time intervals by the tip-containment argument in Lemma 20, including when a window ends early by killing.
  For each of the three outputs apply that lemma at level
  $ b_j = frac(\( r_j \/ delta \)^p, \( j + 1 \)^2) lt.eq 1 . $
  Except on an event of probability at most
  $ C exp (- frac(c b_j^2, \( L_j r_j \)^2)) \, quad "(4.14)" $ <win:level-failure>
  the corresponding integral is at most the integral of its upper mean plus $b_j$. The exponent satisfies
  $ frac(b_j^2, \( L_j r_j \)^2) = delta^(- 2) / L_(*)^2 (r_0 / delta)^(- 2 + 2 p) frac(q^(- 2 \( 1 - p - epsilon \) j), \( j + 1 \)^4) gt.eq delta^(- 2) / L_(*)^2 frac(q^(- 2 \( 1 - p - epsilon \) j), \( j + 1 \)^4) . quad "(4.15)" $ <win:failure-exponent>
  Because $q^(- 2 \( 1 - p - epsilon \)) > 1$, the sum of (4.14) over all $j gt.eq 0$ and the three outputs is at most $C exp \( - c delta^(- 2) \/ L_(*)^2 \)$. For example, the last quotient in (4.15) is bounded below by a positive constant times $j + 1$, which reduces the sum to a geometric series. This bound is independent of $n$ and hence of $r_f$.
  It remains to propagate the simultaneous integral bounds. A next approach missed by its window must occur after an outer exit at which the center was still live. Death or an infinite window cannot be followed by a missed live approach. Consequently, pointwise,
  $ I_(r_(j + 1)) & lt.eq H_j + B_j \,\
W_(r_(j + 1)) & lt.eq r_j^(- p) V_j + C \( q r_j \)^(- p) B_j . quad "(4.16)" $ <win:missed-output>
  Define
  $ S_j = integral_A W_(r_j) thin d A \, #h(2em) A_j = r_j^(- p) integral_A I_(r_j) thin d A . $
  On the simultaneous good event, integrating (4.16) and using (4.13) gives
  $ S_(j + 1) & lt.eq S_j + alpha_j A_j + e_j \,\
A_(j + 1) & lt.eq C_1 S_j + alpha_j A_j + e_j \, quad "(4.17)" $ <win:recurrences>
  where constants can be enlarged so that
  $ alpha_j = C_2 L_(*)^(- c_(*)) q^(epsilon c_(*) j) \, #h(2em) e_j = frac(C_3 delta^(- p), \( j + 1 \)^2) . $
  Here $r_j^(- p) b_j = delta^(- p) \/ \( j + 1 \)^2$ exactly; factors of $q^(- p)$ are fixed constants. The constants $C_1 \, C_2 \, C_3$ depend only on $q$ and the constants in the local laws, not on $L_(*)$ or the final mesh. The pointwise initial bounds and $r_0 gt.eq q delta$ give $S_0 \, A_0 lt.eq C delta^(- p)$.
  For completeness, the two recurrences have a bound uniform in their length. Choose $Lambda gt.eq max \( 1 \, 2 C_1 \)$ and then $L_(*)$ so large that $alpha_0 = C_2 L_(*)^(- c_(*)) lt.eq 1 \/ 2$. Finally choose $0 < delta_0 < rho_(upright("col"))$ with $3 L_(*) delta_0 lt.eq 1$. The preceding estimates now apply whenever $r_f lt.eq delta lt.eq delta_0$. Put $U_j = max \( S_j \, A_j \/ Lambda \)$. The second recurrence implies
  $ A_(j + 1) \/ Lambda lt.eq \( C_1 \/ Lambda + alpha_j \) U_j + e_j \/ Lambda lt.eq U_j + e_j \, $
  while the first implies $S_(j + 1) lt.eq \( 1 + Lambda alpha_j \) U_j + e_j$. Thus
  $ U_(j + 1) lt.eq \( 1 + Lambda alpha_j \) U_j + e_j \, $
  and iteration gives
  $ U_j lt.eq (U_0 + sum_(i gt.eq 0) e_i) exp (Lambda sum_(i gt.eq 0) alpha_i) lt.eq C delta^(- p) . $
  Both sums converge and their constants are independent of the final mesh. With $L_(*)$ fixed, the summed failure probability is $C exp \( - c delta^(- 2) \)$. Thus $S_n lt.eq C delta^(- p)$ outside that event, proving (4.2) for $4 < kappa < 8$ and completing the proposition. ◻
]

== 5 Retained mass and a lower bound for fine sausages <retain:section>

We now turn the uniform mesh tail into a positive measure with the required small-ball bound. A subsequential weak limit of the retained densities will give the lower Hausdorff bound. A separate prelimit estimate at the end of the section supplies the sausage mass used by the ribbon construction.

Use the parameters and density $W_e$ of Section 4. The gauge $h$ is the one in (1.3). For each fixed $L gt.eq 1$, $h \( L r \) \/ h \( r \) arrow.r L^d$ as $r arrow.b 0$, so these values differ by bounded factors at small scales. This permits conformal changes of coordinates on compact interior sets.

=== 5.1 A positive first moment before a finite time <a-positive-first-moment-before-a-finite-time>

Fix a closed disk $K subset.double bb(H)$ with a fixed free collar. Define

$ nu_e^T \( d z \) = upright(bold(1))_K \( z \) W_e \( z \) upright(bold(1))_({ tau_e \( z \) lt.eq T }) thin d A \( z \) . $

Let $delta_K = "dist" \( K \, partial bb(H) \) > 0$. Use the enlargement of $K$ by $delta_K \/ 2$ in the scaled tail (4.3), so its permitted final distances include $0 < e < delta_K \/ 2$. Choose $0 < e_0 lt.eq delta_K \/ \( 8 upright(e) \)$, which lies in this range and in the range of Lemma 11 for every $z in K$. We first show that a deterministic finite $T$ can be chosen so that

$ inf_(0 < e < e_0) bb(E) nu_e^T \( K \) gt.eq m_0 > 0 \, #h(2em) sup_(0 < e < e_0) bb(E) #scale(x: 120%, y: 120%)[\[] nu_e^T \( K \)^2 #scale(x: 120%, y: 120%)[\]] lt.eq m_2 < oo . quad "(5.1)" $ <retain:first-second>

The second bound follows by integrating the uniform upper tail (4.3), after scaling to $K$. We justify the first bound, including the finite physical time needed for a tilted approach.

For an integer $m gt.eq 1$, let $rho_m \( z \)$ be the first time the live point has conformal radius $R_0 \( z \) e^(- m)$, and write $bb(P)_z^(* \, m)$ for the finite centered law through $rho_m \( z \)$ from Lemma 9. If $R_0 \( z \) e^(- m) lt.eq e$, the distance stop $tau_e \( z \)$ occurs by $rho_m \( z \)$ under this law: Koebe’s inequality gives distance to the boundary at most the conformal radius, and the initial boundary is farther than $e$. The finite stopped density identity therefore gives

$ bb(E) #h(-1em) [W_e \( z \) upright(bold(1))_({ tau_e \( z \) lt.eq T })] = M_0 \( z \) bb(P)_z^(* \, m) { tau_e \( z \) lt.eq T } gt.eq M_0 \( z \) bb(P)_z^(* \, m) { rho_m \( z \) lt.eq T } . $

By consistency, the probabilities on the right decrease with $m$. Define their limit by

$ q_T \( z \) = lim_(m arrow.r oo) bb(P)_z^(* \, m) { rho_m \( z \) lt.eq T } . $

By continuity from above on the consistent centered path, this is the probability that $T^(*) \( z \) = lim_m rho_m \( z \)$ is at most $T$. Lemma 12 therefore gives $q_T \( z \) arrow.t 1$ as $T arrow.r oo$. Here the initial uniformization is the identity, so the lemma’s Loewner time is the original capacity time. Each probability under a finite stopped law is a measurable kernel in $z$ by the localized construction, so the same is true of $q_T$. Taking the decreasing limit above and integrating over $K$ yields

$ bb(E) nu_e^T \( K \) gt.eq integral_K M_0 \( z \) q_T \( z \) thin d A \( z \) . $

The right side increases to $integral_K M_0 \( z \) d A \( z \) > 0$ as $T arrow.r oo$. This proves (5.1) for a sufficiently large deterministic $T$, using density identities only at finite stops.

Brownian scaling places the same experiment in every prescribed initial capacity interval of length $Delta > 0$. Scaling space by $c = sqrt(Delta \/ T)$ scales capacity time by $c^2$, the permitted mesh cutoff by $c$, and the integrated density by $c^d$. Thus the first moment lower bound becomes $c^d m_0$ and the second moment upper bound becomes $c^(2 d) m_2$, leaving the ratio $m_0^2 \/ m_2$ unchanged.

=== 5.2 Removing squares with excessive mass <removing-squares-with-excessive-mass>

Take the deterministic sequence $e_N = 2^(- N)$ and write $nu_N = nu_(e_N)^T$. Dyadic squares are taken half open and form a partition at each level. Let $k_0$ be a starting level to be fixed below. For a square $Q$ of side $l = 2^(- k)$, $k_0 lt.eq k lt.eq N$, declare it excessive when

$ nu_N \( Q \) > H_k \, #h(2em) H_k = D l^d \( log k \)^(p \/ 2) \, $

where $D$ will be chosen large. We claim that

$ bb(E) [nu_N \( Q \) upright(bold(1))_({ nu_N \( Q \) > H_k })] lt.eq C l^(p + d) k^(- beta) \, #h(2em) beta = c D^(2 \/ p) \, quad "(5.2)" $ <retain:bad-square>

after reducing the positive constant $c$ if necessary. Constants are uniform in $N gt.eq k$ and in the squares meeting $K$.

Let $z_Q$ be the center of $Q$, let $sigma_Q$ be the first hit of $partial B \( z_Q \, 10 l \)$, and set

$ E_Q = { sigma_Q < oo \, med z_Q in D_(sigma_Q) } . $

Require $k_0$ to be large enough that $2^(- k_0) < e_0$ and $10 l lt.eq "dist" \( z_Q \, partial bb(H) \) \/ \( 8 upright(e) \)$ for every square under consideration. In particular every $overline(B) \( z_Q \, 10 l \)$ under consideration is initially interior. We first check that only $E_Q$ can contribute to $nu_N \( Q \)$. Since $Q subset B \( z_Q \, l \)$ and $e_N lt.eq l$, such a contribution requires the trace to enter $B \( z_Q \, 2 l \)$ after first hitting the larger circle. If $z_Q$ is swallowed before or at that first hit, the open larger disk is still disjoint from the trace at the swallowing time. The connected-component observation after Lemma 5 then shows that its whole interior is swallowed, so no later trace can enter it. Thus $nu_N \( Q \) > 0$ implies $E_Q$.

On $E_Q$, the hit is a first live approach to $z_Q$ at distance $10 l$. Lemma 11 therefore gives $bb(P) \( E_Q \) lt.eq C l^p$, uniformly because $M_0 \( z_Q \)$ is bounded on a fixed compact neighborhood of $K$. Also the open disk $B \( z_Q \, 10 l \)$ is contained in $D_(sigma_Q)$: it is trace-free, connected, and contains the live center. In particular $A_Q = B \( z_Q \, 2 l \)$ contains $Q$ and its closed enlargement $overline(B) \( z_Q \, 6 l \)$ remains free.

Conditionally on $E_Q$ and the stopped past, the future density in physical coordinates is the same $M_t$ as before the restart: its conformal radius and tip–target angle depend only on the same marked physical domain. There were no earlier $e_N$-approaches in $Q$. The normalized tail (4.3), applied in $A_Q$ at scale $2 l$, with the time cutoff deleting contributions, therefore gives

$ bb(P) { nu_N \( Q \) > u l^d divides cal(F)_(sigma_Q) } lt.eq C exp \( - c u^(2 \/ p) \) $

on $E_Q$, for $u gt.eq u_0$, uniformly in the final mesh $e_N lt.eq l$; here $u_0$ is enlarged by a fixed factor to account for the radius $2 l$. The case settled by the deterministic bound in the derivation of (4.3) includes meshes too coarse for its intermediate test. Provided $D \( log k_0 \)^(p \/ 2) gt.eq u_0$, integrate this tail above $u = D \( log k \)^(p \/ 2)$, including the usual threshold-times-tail term. Any polynomial prefactor is absorbed by reducing $c$. Multiplication by the entrance probability $C l^p$ proves (5.2).

Let $E_N$ be the union of all excessive squares at levels $k_0 \, dots.h \, N$, and retain the measure

$ hat(nu)_N = upright(bold(1))_(E_N^c) nu_N . $

There are at most $C l^(- 2)$ squares meeting $K$ at level $k$. Since $p + d = 2$, summation of (5.2) gives

$ bb(E) #scale(x: 120%, y: 120%)[\[] nu_N \( K \) - hat(nu)_N \( K \) #scale(x: 120%, y: 120%)[\]] lt.eq C sum_(k gt.eq k_0) k^(- beta) . $

Choose $D$ so that $beta > 1$, then choose $k_0$ large enough to meet the geometric and threshold requirements above and make this sum at most $m_0 \/ 2$. It follows from (5.1) that

$ bb(E) hat(nu)_N \( K \) gt.eq m_0 \/ 2 \, #h(2em) bb(E) hat(nu)_N \( K \)^2 lt.eq m_2 . $

Paley–Zygmund therefore supplies deterministic $a_(*) \, p_(*) > 0$ such that

$ bb(P) { hat(nu)_N \( K \) gt.eq a_(*) } gt.eq p_(*) quad upright("for all sufficiently large ") N . quad "(5.3)" $ <retain:positive-event>

At every tested level each square has retained mass at most $H_k$: an excessive square has retained mass zero, and otherwise restriction can only reduce its mass. In particular the finitely many squares at level $k_0$ meeting $K$ give a deterministic bound on the total retained mass, uniform in $N$.

=== 5.3 A supported weak limit and its ball bound <a-supported-weak-limit-and-its-ball-bound>

The event in (5.3) occurs infinitely often with probability at least $p_(*)$. Indeed each union over $N gt.eq n$ has probability at least $p_(*)$, and these unions decrease to the limsup event. On that event choose a subsequence on which the mass is at least $a_(*)$. Measures on the fixed compact disk $K$ with the deterministic total-mass bound are weakly sequentially compact. Thus a further subsequence converges weakly to a measure $nu$ with $nu \( K \) gt.eq a_(*)$. No measurable selection of this subsequence is needed: the pathwise existence of such a measure will imply a measurable positive-Hausdorff-measure event.

The support of $nu$ lies in $K ∩ gamma \( \[ 0 \, T \] \)$. Every $hat(nu)_N$ is carried by the closed $e_N$-neighborhood of that compact trace, and a compact set disjoint from the trace has an open neighborhood disjoint from all these carriers for large $N$.

For completeness, weak convergence causes no difficulty at dyadic boundaries. Given a sufficiently small $r$, choose a fixed dyadic side length $l$ with $r lt.eq l < 2 r$. For all sufficiently large $N$ this level was tested, and every open ball $B \( x \, r \)$ meets only a bounded number of its half-open squares. Therefore

$ hat(nu)_N \( B \( x \, r \) \) lt.eq C D l^d \( log log \( 1 \/ l \) \)^(p \/ 2) lt.eq C' h \( r \) . $

Portmanteau for this open ball gives

$ nu \( B \( x \, r \) \) lt.eq C' h \( r \) . quad "(5.4)" $ <retain:ball>

This argument works for every $x \, r$ on each path with a weak limit; it does not assume zero mass on grid boundaries. It also shows that $nu$ has no atoms.

Any set of positive diameter $r$ is contained in an open ball of radius at most $2 r$, centered at one of its points. The bounded scaling property of $h$ and (5.4) consequently imply $nu^(*) \( U \) lt.eq C h \( "diam" U \)$ for all sufficiently small sets, where $nu^(*)$ is the outer measure associated with $nu$; singleton sets have zero mass. Countable subadditivity over an arbitrary countable cover of the trace proves

$ cal(H)^h \( K ∩ gamma \( \[ 0 \, T \] \) \) gt.eq nu \( K \) \/ C > 0 . $

We have proved a fixed positive probability of positive Hausdorff measure on a compact interior piece, in every prescribed nonzero initial time interval after scaling.

=== 5.4 Restarting in every positive-time interval <retain:positivity>

Fix $0 lt.eq s < t < oo$ and divide $\[ s \, t \]$ into $n$ deterministic capacity intervals. At a left endpoint $t_i$, the hydrodynamic map $g_(t_i) - sqrt(kappa) B_(t_i)$ turns the future into an ordinary chordal half-plane evolution driven by $sqrt(kappa) \( B_(t_i + u) - B_(t_i) \)$. Its capacity time is exactly $u$: hydrodynamic composition adds the coefficient $2 u$. Thus no random time change is hidden in this subdivision.

Apply the preceding scaled interior experiment in each fresh half-plane interval. Its success probability is at least $p_(*)$, conditionally on the preceding past, with $p_(*)$ independent of the interval length. Success provides a compact subset strictly inside the half-plane. The inverse map is conformal in a neighborhood of this compact subset. A finite cover by interior disks gives upper and lower metric distortion bounds locally, and hence preserves positivity of $cal(H)^h$ by the bounded scaling property of $h$. One may restrict to one disk carrying positive measure if needed. The mapped compact subset belongs to the original trace during that same capacity interval.

Consequently failure of positivity on the whole $\[ s \, t \]$ implies failure of all $n$ experiments, and has probability at most $\( 1 - p_(*) \)^n$. Letting $n arrow.r oo$ shows positivity almost surely for this fixed interval. The event is measurable because the trace is a random compact set and Hausdorff measure for a continuous gauge can be computed using the countable family of finite covers by finite unions of rational open balls, with arbitrarily small enlargements. Intersecting over rational $0 < s < t$ gives a single probability-one event on which every real $0 < s < t < oo$ has positive measure: each such interval contains a nontrivial rational subinterval. The event is for the one fixed value of $kappa$.

=== 5.5 A prelimit lower-tail statement for ordinary sausages <a-prelimit-lower-tail-statement-for-ordinary-sausages>

The first and second moments also give an input for the later ribbon argument without passing to a limiting measure. For a compact time interval $J$ write

$ X_e \( J \) = e^(- p) "Area" { z in bb(C) : "dist" \( z \, gamma \( J \) \) < e } . $

#thm([Proposition 5.1.])[
  (Small sausage values are unlikely).  #emph[For every deterministic $J = \[ s \, t \]$ with $0 lt.eq s < t < oo$, 
$ lim_(a arrow.b 0) limsup_(e arrow.b 0) bb(P) { X_e \( J \) < a } = 0 . quad "(5.5)" $ <retain:sausage-tail>

 Equivalently, for every $epsilon > 0$ there are $a \, e_0 > 0$ such that $bb(P) { X_e \( J \) < a } < epsilon$ for all $0 < e < e_0$. The same conclusion can be required simultaneously for any fixed finite list of such intervals, with total exceptional probability as small as desired.]
] <retain:sausage>

#proof[
  In the initial half-plane experiment, Paley–Zygmund applied directly to (5.1) gives constants $a_(upright(s)) \, p_(upright(s)) > 0$ such that $bb(P) { nu_(e \/ 2)^T \( K \) > a_(upright(s)) } gt.eq p_(upright(s))$ for all sufficiently small $e$. Since $W_(e \/ 2) \( z \) lt.eq C e^(- p)$ and the density is supported within distance $e \/ 2$ of the trace up to $T$, this implies a positive lower bound on $e^(- p)$ times its sausage area inside $K$. Use a slightly enlarged compact disk $K^(+) subset.double bb(H)$ to ensure that all witnessing trace points lie in $K^(+)$ for small $e$. Scaling gives this experiment on any prescribed positive-length half-plane slot, with the same lower bound $p_(upright(s))$ on its success probability.
  Divide $J$ into $n$ deterministic slots and let $F_i$ be the inverse hydrodynamic map at the start of slot $i$. The corresponding test disks $K_i subset.double K_i^(+) subset.double bb(H)$ are deterministic after scaling by that slot’s length. There are almost surely finite upper and strictly positive lower bounds on $\| F'_i \|$ throughout $K_i^(+)$, for each $i$. Because the list is finite, for every $eta > 0$ we can choose deterministic $0 < b < L < oo$ such that, except on an event of probability at most $eta$, all these derivatives lie between $b$ and $L$. Enlarge $L$ to include the local Lipschitz constants on the relevant compact disks. No independence between this event and the slot experiments is asserted or needed.
  On that event take each half-plane mesh to be $c e$, where the deterministic $c > 0$ is small enough that image distances less than $c e$ become physical distances less than $e$. If its slot experiment succeeds, conformal area change, with Jacobian at least $b^2$, gives $X_e \( J \) gt.eq a_(n \, eta)$, where $a_(n \, eta) > 0$ is deterministic. This conclusion holds for all sufficiently small $e$, with a deterministic cutoff depending on the finite list. The half-plane experiments have conditional success probability at least $p_(upright(s))$, so their simultaneous failure has probability at most $\( 1 - p_(upright(s)) \)^n$. Hence
  $ limsup_(e arrow.b 0) bb(P) { X_e \( J \) < a_(n \, eta) } lt.eq eta + \( 1 - p_(upright(s)) \)^n . $
  First choose $n$ large and then $eta$ small. Monotonicity in the threshold $a$ proves (5.5). For a fixed finite list, apply this result to each interval and take the minimum threshold and cutoff, followed by a union bound. ◻
]

Only deterministic intervals are asserted in Proposition 21. Its use for a random passage first selects, by countable exhaustion, a finite list of rational closed intervals and compact interior neighborhoods with positive margins. The proposition then removes an arbitrarily small unconditional exceptional event. On a passage whose selected segment lies inside one of those neighborhoods, sufficiently fine sausages of the segment are counted there. No conditional sausage inequality at an arbitrary random interval is required.

== 6 Uniform passages and dense visits <rc:section>

The covering argument needs a visit that creates unusually much sausage area. We construct such a visit by traversing a narrow serpentine ribbon. The essential estimate is uniform over the history already drawn inside the ribbon. A positive probability for each fixed smooth template would not give the required bound as the number of traversals increases.

Throughout this section $0 < kappa < 8$ is fixed, $d = 1 + kappa \/ 8$, and $p = 2 - d$. For a curve segment $eta$, write $N_v \( eta \) = { z : "dist" \( z \, eta \) < v }$. We use Corollary 8, Proposition 15, and Proposition 21 in the following forms. First, a smooth simple slit can be followed in an open tube through ordered separating crosscuts, with positive probability; the same assertion holds at a stopped restart. Second, suppose a conformal map $F$ from $bb(H)$ has a continuous spherical extension to the closed half-plane and an access curve from $0$ to modulus $b_0$ whose image is in $B \( a \, r \/ L \)$, then for all $L gt.eq L_0$,

$ bb(P) { F \( gamma \[ 0 \, sigma_(b_0 L^b) \] \) subset.not B \( a \, r \) } lt.eq C L^(- c) . quad "(6.1)" $ <rc:localization-input>

Here $sigma_u$ is the first time the parameter-plane trace reaches modulus $u$; the containment is interpreted up to infinite time if that stop is not reached. The constants $b \, c \, C > 0$ and $L_0 > 1$ are uniform over the maps and access curves, and the estimate includes parameter-boundary visits. Third, for each deterministic compact capacity-time interval $J$ of positive length,

$ lim_(a arrow.b 0) limsup_(v arrow.b 0) bb(P) { v^(- p) "Area" \( N_v \( gamma \( J \) \) \) < a } = 0 . quad "(6.2)" $ <rc:sausage-input>

Only finite lists of deterministic intervals will be used. In particular, we do not condition this lower-tail estimate on a prescribed passage or apply it directly to a random interval.

Rezaei’s cover argument already uses conditional bounds after stopped histories, compactness, and passages through prescribed spirals and tubes #cite(label("rezaei2018")) Section 3, Lemmas 3.1–3.3. Here we need one probability bound for every past admitted by a ribbon step, together with one deterministic small-mesh cutoff for those pasts. Iterating this quantitative step will give the explicit lower bound $c exp \( - C m^2 \)$ for the dense visit.

=== 6.1 Geometry at the front of a ribbon <geometry-at-the-front-of-a-ribbon>

Let $sigma : \[ 0 \, oo \) arrow.r overline(bb(H))$ be a unit-speed simple curve, with Lipschitz tangent, curvature at most $1 \/ 10$, and normal $n$. Assume that

$ P \( s \, x \) = sigma \( s \) + x n \( s \) \, #h(2em) s gt.eq 0 \, quad \| x \| lt.eq 1 \, $

is an embedded closed ribbon, lies in $bb(H)$ when $s > 0$, escapes every bounded set as $s arrow.r oo$, and is straight vertical for $0 lt.eq s lt.eq 4$, with $P \( 0 \, 0 \) = 0$. The coordinate maps on patches of length four have one fixed bi-Lipschitz constant. These geometric bounds are part of the admissible class. Fix $epsilon.alt = 1 \/ 50$.

Consider any stopped chordal past that first reaches $s = k$, $k gt.eq 1$, has remained in $\| x \| < epsilon.alt$ up to that stop, meets the real boundary only at the ribbon’s base $P \( { 0 } times \( - epsilon.alt \, epsilon.alt \) \)$, and ends at $a = P \( k \, x_a \)$ with $\| x_a \| lt.eq epsilon.alt \/ 4$. The future portion of the ribbon is in the surviving domain $D$: its interior is disjoint from the past and has a route to the target along the ribbon. The same holds for the strips outside the core on each side of the preceding local patch.

#thm([Lemma 6.1.])[
  (One ribbon step).  #emph[There are $q \, c \, v_0 > 0$, depending only on $kappa$ and the fixed ribbon constants, with the following property. For every stopped past satisfying the preceding ribbon conditions and every deterministic $0 < v < v_0$, the conditional probability is at least $q$ that the next first crossing of $s = k + 1$ occurs in finite time, with tip offset $\| x \| < epsilon.alt \/ 4$, while the trace segment $gamma_(upright("step"))$ from the current front to that next crossing stays in 
$ k - 1 \/ 4 < s < k + 1 \, #h(2em) \| x \| < epsilon.alt \, $

 before that crossing, and that 
$ v^(- p) "Area" (N_v \( gamma_(upright("step")) \) ∩ P \( \( k + 1 \/ 3 \, k + 2 \/ 3 \) times \( - epsilon.alt \, epsilon.alt \) \)) gt.eq c . quad "(6.3)" $ <rc:step-mass>

 All three constants are uniform over the ribbon and the entire stopped past. For a ribbon of half-width $ell$, the same assertion has mesh cutoff $v_0 ell$ and lower bound $c ell^d$ in (6.3).]
] <rc:step>

The goal is thus a single positive probability and a single mesh cutoff for this entire class of pasts. We first establish uniform conformal control of an access guide; the proof of Lemma 22 then transfers an interior sausage test through those conformal maps.

Use the guide

$ alpha \( t \) = P \( k + t \, x_a \( 1 - 4 t \)_(+) \) \, #h(2em) 0 lt.eq t lt.eq 2 \, $

and continue along the centerline to infinity. It is a simple access curve from the fresh tip to the target. Freshness follows from the first crossing of the front; the fresh-tip prime-end statement makes its initial access agree with the driving prime end. On this guide,

$ "dist" \( alpha \( t \) \, partial D \) gt.eq c min \( t \, 1 \) \, #h(2em) \| alpha \( t \) - a \| lt.eq C t quad \( 0 < t lt.eq 2 \) . quad "(6.4)" $ <rc:guide-clearance>

Indeed a local coordinate ball ahead of the front is free. Its radius can be chosen proportional to $t$ until the guide has advanced a fixed distance, and fixed thereafter. Nonlocal portions of the past cannot enter these balls: they would meet the interior of this ribbon patch, contrary to embedding. Every ball is in the surviving component because it connects to the future ribbon.

Set $w = P \( k + 1 \/ 2 \, 0 \)$. If $g : D arrow.r bb(H)$ sends the tip to $0$ and the target to infinity, then

$ sin arg g \( w \) gt.eq s_(*) > 0 . quad "(6.5)" $ <rc:waypoint-angle>

Here is a uniform harmonic-measure proof. The complete access guide separates $D$ into two sides corresponding to the prime-end boundary arcs mapped to the positive and negative real axes. An exit approached from one side without crossing the guide uses that arc, even when its physical exit point represents several prime ends. From $w$, on either chosen side of the guide, take a route in the local ribbon to offset $x = 1 \/ 2$ or $x = - 1 \/ 2$, and backwards to a transverse rectangle centered at $s = k - 1 \/ 2$. These routes have uniformly bounded length and fixed positive clearance from the core and the opposite side of the guide. Across that rectangle take a transverse route from the chosen offset to beyond the opposite edge of the core. The past has a longitudinal crossing of the rectangle: take its portion between the last crossing of its rear edge preceding the first crossing of its forward edge. This connected crossing lies in $\| x \| < epsilon.alt$ and separates the two transverse ends. Thus a continuous transverse crossing must meet the past before it reaches the other end.

Starting at $w$, first run Brownian motion in a fixed small free ball about $w$ until it reaches a smaller disk strictly on the chosen side of the guide. There is a uniformly positive probability to do so before leaving the free ball. Crossings of the guide during this initial move are allowed. From that smaller disk, Brownian motion has a uniformly positive chance to follow the first route and then cross the transverse rectangle. One can specify this event in finitely many overlapping coordinate disks and rectangular crossings with uniformly bounded aspect ratios. During this latter part, until the first domain exit, its route avoids the access guide. Its exit therefore belongs to the chosen prime-end arc. The strong Markov property gives a lower bound for the harmonic measure of each arc from $w$. In half-plane coordinates these two harmonic measures are $arg g \( w \) \/ pi$ and $1 - arg g \( w \) \/ pi$, proving (6.5). The argument uses no regularity of the past inside the core.

After imposing $\| g \( w \) \| = 1$, the conformal radius of $w$ is bounded above and below, by (6.4) and the boundary point $a$. Consequently the inverse maps have nondegenerate interior compact limits. The next two lemmas turn this interior normalization into a uniform passage. First, the parameter guide approaches the driving point uniformly. A small-image semicircle then joins an early localized trace to the limiting guide. Finally, a finite choice of rational time intervals transfers the sausage estimate. This will produce one probability, mass threshold, and mesh cutoff valid for every past. The estimates above verify the first lemma’s hypotheses. Its limiting map, guide and omitted boundary point then supply the hypotheses of the second lemma.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.9, -1.05), (12.25, 3.85))
  rect((0, 0), (12, 3), fill: black)
  line((0, 0), (12, 0), (0, 3), (12, 3), stroke: (paint: rgb("#999999")))
  rect((0, 1.15), (12, 1.85), fill: rgb("#ebebeb"))
  line((0, 1.15), (12, 1.15), (0, 1.85), (12, 1.85), stroke: (paint: rgb("#a6a6a6"), dash: "dotted"))
  rect((5.5, 1.15), (7.5, 1.85), fill: black)
  rect((5.5, 1.15), (7.5, 1.85))
  line((3.5, -0.2), (3.5, 3.3), (9.5, -0.2), (9.5, 3.3), stroke: (paint: rgb("#808080"), dash: "dashed"))
  content((3.5, 3.3), [front $s=k$], anchor: "south")
  content((9.5, 3.3), [$s=k+1$], anchor: "south")
  line((0, 1.4), (0.5, 1.65), (1, 1.36), (1.6, 1.7), (2.2, 1.42), (2.8, 1.64), (3.5, 1.57))
  circle((3.5, 1.57), radius: 0.07056, fill: black)
  content((3.5, 1.7), [$a$], anchor: "south-east")
  line((3.5, 1.57), (5, 1.5), (11.7, 1.5), mark: (end: ">"))
  circle((6.5, 1.5), radius: 0.07056, fill: rgb("#ffffff"))
  circle((6.5, 1.5), radius: 0.07056)
  content((6.5, 0.95), [waypoint#linebreak()$P(k+1/2,0)$], anchor: "north")
  line((6.5, 0.94), (6.5, 1.4), stroke: (paint: rgb("#666666")))
  content((6.5, 2.25), [middle test region], anchor: "south")
  line((6.5, 2.2), (6.5, 1.88))
  content((1.55, 2.05), [past in the core#linebreak()$|x|< epsilon$], anchor: "south")
  content((10.65, 1.85), [access guide $alpha$], anchor: "south")
  content((0, 3), [$x=1$], anchor: "east")
  content((0, 0), [$x=-1$], anchor: "east")
  line((3.5, -0.65), (9.5, -0.65), mark: (start: "<", end: ">"))
  content((6.5, -0.65), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [one unit in $s$])])
})],
  caption: [Figure 2: One step in ribbon coordinates $P \( s \, x \)$. The black past stays in the core $\| x \| < epsilon.alt$ and first reaches the front $s = k$ at $a$, with tip offset at most $epsilon.alt \/ 4$. The blue access guide moves to the centerline and passes through the interior waypoint $P \( k + 1 \/ 2 \, 0 \)$. The orange region is $P \( \( k + 1 \/ 3 \, k + 2 \/ 3 \) times \( - epsilon.alt \, epsilon.alt \) \)$, where the next step’s sausage area is tested before its first crossing of $s = k + 1$. The guide depicts an available route, not the random continuation. The transverse scale and core width are exaggerated. ],
) <fig:ribbon-front>

Figure 2 shows the guide and the middle region whose sausage mass appears in Lemma 22.

The compactness argument at the initial tip requires control of a guide, but no common modulus of continuity for the inverse maps on the boundary. We give that control explicitly. Hyperbolic length in $bb(H)$ is normalized as $\| d z \| \/ "Im" z$.

#thm([Lemma 6.2.])[
  (Compactness along a guide).  #emph[Let $F_n : bb(H) arrow.r D_n$ be conformal, with inverse $g_n$, and let $alpha_n : \[ 0 \, T \] arrow.r overline(D_n)$ be $C$-Lipschitz guides satisfying 
$ alpha_n \( 0 \) = a_n in partial D_n \, #h(2em) alpha_n \( t \) in D_n quad \( t > 0 \) \,\
"dist" \( alpha_n \( t \) \, partial D_n \) gt.eq c min \( t \, 1 \) . $

 Assume that $a_n$ stays in a bounded set and that $beta_n = g_n compose alpha_n$, initially defined for $t > 0$, extends continuously to $beta_n \( 0 \) = 0$. Fix $t_w in \( 0 \, T \]$, put $w_n = alpha_n \( t_w \)$, and suppose that 
$ \| g_n \( w_n \) \| = 1 \, #h(2em) "Im" g_n \( w_n \) gt.eq s > 0 . $

 There is a subsequence on which $alpha_n$ converges uniformly to a guide $alpha$, $F_n$ converges locally uniformly on $bb(H)$ to a nonconstant univalent map $F$, and $beta_n$ converges locally uniformly on $\( 0 \, T \]$ to $beta$, where $F compose beta = alpha$. In addition, 
$ lim_(h arrow.b 0) sup_n sup_(0 lt.eq t lt.eq h) \| beta_n \( t \) \| = 0 . quad "(6.6)" $ <es:uniform-tip-collapse>

 Consequently $beta \( 0 + \) = 0$. If $a_n arrow.r a$, then $a in.not F \( bb(H) \)$ and $F \( beta \( t \) \) arrow.r a$ as $t arrow.b 0$.]
] <es:guide-compactness>

#proof[
  Write $z_n = g_n \( w_n \)$. These points lie in a compact subset of $bb(H)$. The conformal-radius identity and Koebe’s theorem give
  $ 2 "Im" z_n thin \| F'_n \( z_n \) \| = R_(D_n) \( w_n \) \, #h(2em) c min \( t_w \, 1 \) lt.eq R_(D_n) \( w_n \) lt.eq 4 C t_w . $
  Here the upper bound uses $a_n in partial D_n$ and $\| w_n - a_n \| lt.eq C t_w$. Thus the inverse derivatives are bounded above and away from zero at an interior compact set. Since $w_n$ is bounded, the growth and distortion theorems for normalized univalent functions give a subsequence converging locally uniformly to a nonconstant univalent $F$. Arzelà–Ascoli also gives uniform convergence of the physical guides.
  For each fixed $delta > 0$, the part of $alpha_n$ joining $w_n$ to any $alpha_n \( t \)$, $delta lt.eq t lt.eq T$, has uniformly bounded hyperbolic length. Indeed the hyperbolic density in $D_n$ is at most twice the reciprocal of the distance to its boundary, and the guides have speed at most $C$. Conformal invariance therefore confines $beta_n \( \[ delta \, T \] \)$ to a fixed compact subset of $bb(H)$. The same estimates, or the conformal-radius identity for $g'_n$, give equicontinuity there. Subsequence limits satisfy $F \( beta \( t \) \) = alpha \( t \)$; univalence identifies them consistently for all $delta > 0$.
  It remains to prove (6.6). Suppose otherwise. There are $h_n arrow.b 0$ and $epsilon > 0$ such that $beta_n \( \[ 0 \, h_n \] \)$ reaches modulus $epsilon$. After taking the subsequence just described, there are a fixed disk $K subset.double bb(H)$ and $r_0 > 0$ for which
  $ \| F_n \( z \) - a_n \| gt.eq r_0 #h(2em) \( z in K \) quad "(6.7)" $ <es:waypoint-separation>
  for all sufficiently large $n$. To see this, take $K$ sufficiently small about the limit of $z_n$: the points $w_n$ have distance at least $c min \( t_w \, 1 \)$ from $a_n$, and local convergence and distortion preserve a smaller positive separation on $K$.
  Put $T_n = log \( r_0 \/ \( C h_n \) \)$, which tends to infinity. In the strip $S = bb(R) times \( 0 \, pi \)$ set
  $ U_n \( v \, phi.alt \) = min {T_n \, log^(+) frac(\| F_n \( e^(v + i phi.alt) \) - a_n \|, C h_n)} . $
  Conformal invariance of Dirichlet energy and area change imply
  $ E_n := integral_S \| nabla U_n \|^2 thin d v thin d phi.alt lt.eq integral_(C h_n < \| w - a_n \| < r_0) frac(d A \( w \), \| w - a_n \|^2) = 2 pi T_n . quad "(6.8)" $ <es:collapse-energy>
  Every section $v < log epsilon$ contains a zero of $U_n$: the continuous curve $beta_n \( \[ 0 \, h_n \] \)$ crosses that modulus, and $\| alpha_n \( t \) - a_n \| lt.eq C h_n$ throughout the corresponding physical guide segment. Angular Cauchy–Schwarz consequently gives, for almost every such $v$,
  $ integral_0^pi U_n \( v \, phi.alt \)^2 thin d phi.alt lt.eq pi^2 integral_0^pi \| partial_phi.alt U_n \( v \, phi.alt \) \|^2 thin d phi.alt . $
  In particular this bounds the squared $L^2$ norm on the fixed unit slab $\( log epsilon - 1 \, log epsilon \) times \( 0 \, pi \)$ by $pi^2 E_n$.
  For completeness, this bound propagates to every fixed bounded rectangle $J times \( 0 \, pi \)$ containing that slab. Let $m_n \( v \) = pi^(- 1) integral_0^pi U_n \( v \, phi.alt \) thin d phi.alt$. There is a section $v_n$ in the initial slab with $\| m_n \( v_n \) \|^2 lt.eq pi E_n$, while
  $ integral_J \| m'_n \( v \) \|^2 thin d v lt.eq E_n \/ pi . $
  Horizontal Cauchy–Schwarz bounds $\| m_n \( v \) \|^2$ on $J$ by a constant depending only on $J$ and $epsilon$, times $E_n$. The one-dimensional Poincaré inequality for $U_n \( v \, dot.op \) - m_n \( v \)$ then gives
  $ integral_(J times \( 0 \, pi \)) U_n^2 lt.eq C_(J \, epsilon) E_n . quad "(6.9)" $ <es:anchored-ltwo>
  Choose $J$ so that $J times \( 0 \, pi \)$ also contains $log K$, using the logarithm with argument in $\( 0 \, pi \)$. By (6.7), $U_n = T_n$ on the fixed positive-area set $log K$. Equations (6.8)–(6.9) imply
  $ \| log K \| T_n^2 lt.eq C_(J \, epsilon) 2 pi T_n \, $
  a contradiction. This proves uniform collapse.
  Finally $F_n - a_n$ has no zeros in $bb(H)$. Hurwitz’s theorem and nonconstancy show that $F - a$ has no zeros there. Since $F \( beta \( t \) \) = alpha \( t \) arrow.r a$, the omitted point $a$ belongs to $partial F \( bb(H) \)$. ◻
]

#thm([Lemma 6.3.])[
  (A small image semicircle).  #emph[Let $F$ be univalent on $bb(H)$, and let $a in.not F \( bb(H) \)$. Suppose $beta : \[ 0 \, T \] arrow.r overline(bb(H))$ is continuous, $beta \( 0 \) = 0$, $beta \( t \) in bb(H)$ for $t > 0$, and $F \( beta \( t \) \) arrow.r a$ as $t arrow.b 0$. Fix $r > 0$ and $L > 1$, and write $A = log L$. Choose $t_0 > 0$ so that 
$ \| F \( beta \( t \) \) - a \| lt.eq r \/ L quad \( 0 < t lt.eq t_0 \) \, #h(2em) b_0 = \| beta \( t_0 \) \| > 0 . $

 In every unit logarithmic slab $\( q \, q + 1 \)$ lying below $log b_0$, there is $B in \( e^q \, e^(q + 1) \)$ such that, provided $A > 2 pi^2$, 
$ sup_(0 < theta < pi) \| F \( B e^(i theta) \) - a \| lt.eq r exp { - A + pi sqrt(2 A) } . quad "(6.10)" $ <es:semicircle-bound>

 Moreover 
$ sup_(B \/ 8 lt.eq \| z \| lt.eq B\
"Im" z gt.eq \| z \| \/ 2) \| F \( z \) - a \| lt.eq r exp { - A + pi sqrt(2 A) + 6 } . quad "(6.11)" $ <es:sector-bound>

 For $A gt.eq 64$ both upper bounds are smaller than $r \/ 4$.]
] <es:good-semicircle>

#proof[
  On $S = bb(R) times \( 0 \, pi \)$ use
  $ U \( v \, phi.alt \) = min {A \, log^(+) frac(\| F \( e^(v + i phi.alt) \) - a \|, r \/ L)} . $
  As in (6.8), $integral_S \| nabla U \|^2 lt.eq 2 pi A$. The initial guide supplies a zero on every section $v < log b_0$. In the specified unit slab there is thus a section $v = log B$ whose angular energy is at most $2 pi A$. Starting at a zero on that section and applying Cauchy–Schwarz gives
  $ U \( log B \, phi.alt \) lt.eq sqrt(pi dot.op 2 pi A) = pi sqrt(2 A) #h(2em) \( 0 < phi.alt < pi \) . $
  The section may be chosen where the Sobolev restriction is absolutely continuous; continuity in the open semicircle gives the bound at every interior point. Since $pi sqrt(2 A) < A$, the upper truncation is inactive and (6.10) follows.
  Koebe’s quarter theorem, applied after mapping the disk to $bb(H)$ at $z$, gives
  $ frac("Im" z, 2) \| F' \( z \) \| lt.eq "dist" \( F \( z \) \, partial F \( bb(H) \) \) lt.eq \| F \( z \) - a \| . $
  Therefore $log \| F - a \|$ is $2$-Lipschitz for hyperbolic distance. If $z = rho B e^(i theta)$ is in the sector in (6.11), then $1 \/ 8 lt.eq rho lt.eq 1$ and $sin theta gt.eq 1 \/ 2$, so
  $ cosh d_(bb(H)) \( z \, i B \) = frac(1 + rho^2, 2 rho sin theta) lt.eq rho + rho^(- 1) lt.eq 65 \/ 8 < cosh 3 . $
  Comparing with $i B$ in (6.10) proves (6.11). For $A gt.eq 64$, $- A + pi sqrt(2 A) + 6 < - log 4$. ◻
]

Here is the geometric consequence used to splice an initial passage to the limiting guide. Suppose $beta$ in Lemma 24 is simple, and fix $delta in \( 0 \, T \)$. Choose the logarithmic slab so far to the left that its upper radius is smaller than

$ min {b_0 \/ 2 \, med min_(delta lt.eq t lt.eq T) \| beta \( t \) \|} . $

The last time $t_B lt.eq T$ with $\| beta \( t_B \) \| = B$ then satisfies $t_B < delta$, and the remaining guide lies strictly outside that semicircle. Put $b = B \/ 4$. If an initial hull stays in

$ { z : \| "Re" z \| < b \/ 4 \, quad 0 lt.eq "Im" z lt.eq b } $

and ends at $zeta = x + i b$, its modulus is less than $B \/ 2$. From $zeta$ move vertically upwards to the semicircle $\| z \| = B$, follow the semicircle to $beta \( t_B \)$, and then follow $beta \( \[ t_B \, T \] \)$. The vertical piece belongs to the sector in (6.11); the semicircular piece obeys (6.10). Both therefore map into $B \( a \, r \/ 4 \)$ when $log L gt.eq 64$. The vertical piece is above the initial hull, and the other pieces are outside its containing disk. These pieces form a simple continuation route; corners can be smoothed in its open neighborhoods. Each fixed such route after $zeta$ lies in a compact subset of $bb(H)$. Consequently local uniform convergence of the maps is sufficient to transfer all strict continuation restrictions along that route.

=== 6.2 The uniform passage estimate <the-uniform-passage-estimate>

We now prove Lemma 22. If uniform constants failed, a sequence of admissible states and vanishing meshes would have a nondegenerate conformal limit. A passage in that limit has positive probability. Selecting finitely many compact sets, margins and rational time intervals transfers it to the sequence; subtracting the unconditional sausage exception preserves a fixed positive passage-and-mass probability.

#proof[
  Suppose the uniform assertion were false. Then for each integer $n$ there would be admissible data and $0 < v_n < 1 \/ n$ such that the probability of passage together with normalized mass at least $1 \/ n$ is less than $1 \/ n$. Denote their ribbon maps and front positions by $P_n$ and $k_n$. Translate the physical starting tips to a bounded region, keeping the same notation, and put
  $ V = \[ - 1 \/ 2 \, 3 \/ 2 \] times \[ - 1 \, 1 \] \, #h(2em) Q_n \( u \, x \) = P_n \( k_n + u \, x \) . $
  On a subsequence these charts converge uniformly, together with the centerline tangents, to a chart $Q$ with the same bi-Lipschitz bound. The limiting guide through relative coordinate $u = 5 \/ 4$ is therefore simple. Lemma 23, applied to this part of the guide, gives locally uniform convergence of the normalized inverse maps $F_n$ to a nonconstant univalent $F$. The parameter guides converge away from time zero to a simple guide $beta$ with $beta \( 0 + \) = 0$. Write $a_n arrow.r a$ for the physical tips.
  Use one ordinary parameter-plane SLE $gamma$ for all $n$. For each fixed $n$, the image $F_n compose gamma$, after the corresponding capacity rescaling, has the law of the conditional continuation in that state. This realizes the events below on one probability space; no joint relation between the original stopped states is needed.
  Choose $r > 0$ so small that, for all sufficiently large $n$ and also for the limiting chart,
  $ overline(B) \( a_n \, 2 r \) & subset Q_n #scale(x: 120%, y: 120%)[\(] \( - 1 \/ 8 \, 1 \/ 4 \) times \( - epsilon.alt \/ 2 \, epsilon.alt \/ 2 \) #scale(x: 120%, y: 120%)[\)] \,\
overline(B) \( a \, r \) & subset Q #scale(x: 120%, y: 120%)[\(] \( - 1 \/ 8 \, 1 \/ 4 \) times \( - epsilon.alt \/ 2 \, epsilon.alt \/ 2 \) #scale(x: 120%, y: 120%)[\)] . $
  The centered tips and the common bi-Lipschitz bound permit this choice. In particular, a trace in the first ball has not yet reached the middle region or the next front.
  We fix the probability of the initial vertical passage before choosing the localization scale. Let $tau_b$ be the first time ordinary parameter-plane SLE attains height $b$. Slit support gives a constant $A < oo$ for which
  $ E_b = {tau_b lt.eq A b^2 \, quad \| "Re" gamma \( t \) \| < b \/ 4 med \( 0 lt.eq t lt.eq tau_b \)} $
  has probability $q_0 > 0$. Brownian scaling makes $q_0$ independent of $b > 0$, and $E_b in cal(F)_(tau_b)$. Fix $L gt.eq L_0$ large enough that $log L gt.eq 64$ and $C L^(- c) < q_0 \/ 2$, using the constants in (6.1).
  A sufficiently short fixed physical guide segment lies in $B \( a_n \, r \/ L \)$ for every large $n$. Its endpoint has parameter modulus bounded below by some $b_0 > 0$: this follows from interior convergence at that fixed positive guide time. Decrease $b_0$ so that the same statement holds for the limiting guide, and truncate the guides at their first modulus-$b_0$ points when using them as localization access curves. Keep the full limiting guide for the continuation. Lemma 24 supplies a radius $B < b_0 \/ 2$ whose semicircle and central sector map under $F$ into $B \( a \, r \/ 4 \)$. Choose its logarithmic slab sufficiently far to the left that the last crossing of $\| z \| = B$ by $beta$ occurs while its physical image is still in $B \( a \, r \/ 4 \)$. The rest of the guide, through $u = 5 \/ 4$, then lies outside that semicircle.
  Put $b = B \/ 4$, $tau = tau_b$, and $E = E_b$. On $E$ the trace through $tau$ stays in
  $ \| "Re" z \| < b \/ 4 \, #h(2em) 0 lt.eq "Im" z lt.eq b . $
  Its filled hull stays there too, since the part of $bb(H)$ outside the closed rectangle is connected to infinity. The terminal tip is fresh and has an upward vertical access ray. Let $G_n$ be the event that the physical image under $F_n$ of this initial trace stays in $B \( a_n \, r \)$. It is $cal(F)_tau$-measurable. Lemma 3 gives continuous boundary extensions of the inverse maps, so the short access curve and (6.1) give
  $ bb(P) \( E \\ G_n \) lt.eq C L^(- c) . $
  Indeed, on $E$ the trace through $tau$ has modulus less than $B \/ 2 < b_0$, so the localization estimate controls this entire prefix. Our choice of $L$ yields $bb(P) \( E ∩ G_n \) gt.eq q_0 \/ 2$.
  Given a realization in $E$, use the geometric splice after Lemma 24: move upwards from its tip to the semicircle of radius $B$, follow the semicircle to the last crossing of $beta$, and then follow $beta$ through $u = 5 \/ 4$. This simple route avoids the previous hull. Its initial pieces map into the early ball $B \( a \, r \/ 4 \)$; thereafter it follows the guide, whose longitudinal coordinate increases and whose offset is zero by $u = 1 \/ 4$.
  We describe a passage event with margins that persist under uniform changes of the maps. For $delta = 1 \/ nu < min \( epsilon.alt \/ 8 \, 1 \/ 12 \)$, where $nu$ is a positive integer, define the compact coordinate sets
  $ V_delta = {\( u \, x \) in V : - 1 \/ 4 + delta lt.eq u lt.eq 3 \/ 2 - delta \, quad \| x \| lt.eq epsilon.alt - delta \,\
u lt.eq 1 - delta med upright("or") med \| x \| lt.eq epsilon.alt \/ 4 - delta} \, $
  $ P_delta & = V_delta ∩ { u lt.eq 1 - 2 delta } \, & O_delta & = V_delta ∩ { u gt.eq 1 + delta } \,\
M_delta & = \[ 1 \/ 3 + delta \, 2 \/ 3 - delta \] times \[ - epsilon.alt + delta \, epsilon.alt - delta \] . $
  The set $V_delta$ keeps the whole suffix in the core and centers it near the new front. The sets $P_delta$, $M_delta$, and $O_delta$ specify a prefix before that front, a middle interval, and a point beyond the front. The closed alternative in $V_delta$ is useful: these restrictions are closed conditions on a continuous path.
  Let
  $ K_j = { z : \| "Re" z \| lt.eq j \, quad 1 \/ j lt.eq "Im" z lt.eq j } \, #h(2em) j = 1 \, 2 \, dots.h . $
  Let $C$ be the union, over $j \, nu$ as above and rational $0 < t_(-) < t_(+) < t_(upright("out"))$, of the following events:
  $ tau < t_(-) \, #h(2em) gamma \( \[ tau \, t_(upright("out")) \] \) subset K_j \,\
F \( gamma \( \[ tau \, t_(upright("out")) \] \) \) subset Q \( V_delta \) \, #h(2em) F \( gamma \( \[ tau \, t_(+) \] \) \) subset Q \( P_delta \) \,\
F \( gamma \( \[ t_(-) \, t_(+) \] \) \) subset Q \( M_delta \) \, #h(2em) F \( gamma \( t_(upright("out")) \) \) in Q \( O_delta \) . $
  A witness is false unless its $K_j$ containment holds, so $F$ is evaluated only in $bb(H)$. All target sets in the display are compact. By continuity, the interval containments can be checked on dense rational times, together with $gamma \( tau \)$. Each witness is therefore $cal(F)_(t_(upright("out")))$-measurable. Their countable union $C$ depends on the fixed limit map and chart, independently of $n$, $G_n$, and the route used to establish its probability.
  For each realization in $E$, choose a sufficiently thin tube around the spliced route. Its image under $F$ lies in the interior of $Q \( V_delta \)$ for some allowed $delta$. Choose two ordered middle gates so that the $F$-image of the tube portion from its initial tip through the second gate lies in the interior of $Q \( P_delta \)$, and the $F$-image of the portion between the gates lies in the interior of $Q \( M_delta \)$. Choose the terminal parameter open set with $F$-image in the interior of $Q \( O_delta \)$. The parameter-plane closure of the post-$tau$ tube, including its initial tip, lies in some $K_j$. Before its first passage through the second gate, a path following the embedded tube remains in its prefix portion. It visits an open region between the gates, so continuity gives a nondegenerate rational interval $\[ t_(-) \, t_(+) \]$ there before that second passage. A later visit to the terminal open set supplies a rational $t_(upright("out")) > t_(+)$. These times satisfy the displayed conditions. Map out the initial hull. Prime-end access and continuity at the driving point permit a smooth simple slit in the restarted half-plane following the tube. Slit support and the domain Markov property give
  $ q \( omega \) := bb(P) \( C divides cal(F)_tau \) \( omega \) > 0 quad upright("on ") E $
  outside the usual null set. This argument needs no measurable choice of a route, since $C$ itself is the fixed countable union just defined. The value of $q$ may depend on the past.
  Choose $q_1 > 0$ so that $bb(P) \( E ∩ { q < q_1 } \) < q_0 \/ 4$. Since $G_n$ is $cal(F)_tau$-measurable, for every large $n$,
  $ bb(P) \( E ∩ G_n ∩ C \) = bb(E) \[ upright(bold(1))_(E ∩ G_n) q \] gt.eq q_1 q_0 \/ 4 = : q_2 > 0 . quad "(6.12)" $ <rc:varying-good-events>
  Choose a finite subfamily of witnesses whose omission from $C$ has probability less than $q_2 \/ 4$ on $E ∩ C$. The same absolute loss bound holds after intersecting with any of the varying events $G_n$.
  We next transfer a retained witness to the $n$th chart. If $z$ is on its suffix, write $F \( z \) = Q \( v \)$ with $v in V_delta$. Such $v$ has distance at least $delta$ from $partial V$. If $K$ is the common bi-Lipschitz constant, then $Q_n \( v \)$ has distance at least $delta \/ K$ from the Jordan boundary $Q_n \( partial V \)$. On the finitely many retained sets,
  $ sup_(z in K_j) \| F_n \( z \) - F \( z \) \| + sup_(v in V) \| Q_n \( v \) - Q \( v \) \| arrow.r 0 . $
  For all sufficiently large $n$, the displayed sum is less than $delta \/ \( 4 K \)$ for every retained witness. Thus $F_n \( z \)$ lies in the ball about $Q_n \( v \)$ of radius $delta \/ K$. That ball stays inside the Jordan domain $Q_n \( "int" V \)$, so the inverse coordinates are defined. The inverse Lipschitz bound then gives
  $ \| Q_n^(- 1) \( F_n \( z \) \) - v #scale(x: 120%, y: 120%)[\|] < delta \/ 4 $
  uniformly along every retained suffix.
  The prefix on $G_n$ has relative coordinate $u_n < 1 \/ 4$, whereas the point at $t_(upright("out"))$ has $u_n > 1$. Continuity forces a first crossing of $u_n = 1$ before $t_(upright("out"))$. The full $V_delta$ containment gives the rear and core bounds until this crossing. At the crossing, the limit coordinate satisfies $u gt.eq 1 - delta \/ 4 > 1 - delta$, so the closed alternative in $V_delta$ forces $\| x_n \| < epsilon.alt \/ 4$. The $P_delta$ containment gives $u_n lt.eq 1 - 7 delta \/ 4 < 1$ through $t_(+)$. Thus $J = \[ t_(-) \, t_(+) \]$ precedes the first crossing. Its image lies inside the $n$th middle region with a positive physical margin, by the $M_delta$ bounds and the common bi-Lipschitz control.
  For each retained $K_j$, use the larger rectangle $K_(2 j)$. Derivative convergence gives deterministic constants $0 < c_(*) < C_(*) < oo$ such that
  $ c_(*) lt.eq \| F'_n \| lt.eq C_(*) $
  there for all sufficiently large $n$. Fix $lambda > 0$ sufficiently small. On a retained witness, since $v_n arrow.r 0$, the $lambda v_n$-sausage of its interval lies in $K_(2 j)$; the segment from a sausage point to its trace point also lies there. The upper derivative bound maps this sausage into the physical $v_n$-sausage, and the middle-region margin keeps its image inside that region. Change of area gives
  $ v_n^(- p) "Area" \( upright("physical sausage in the middle") \) gt.eq c_(*)^2 lambda^p \( lambda v_n \)^(- p) "Area" \( N_(lambda v_n) \( gamma \( J \) \) \) . quad "(6.13)" $ <rc:compact-sausage-transfer>
  Apply (6.2) to the finite list of deterministic intervals. It supplies a fixed positive lower mass threshold $a_(*)$ with total failure probability less than $q_2 \/ 4$ at all sufficiently small $v_n$. This is an unconditional estimate, so it can be subtracted from (6.12). After the finite extraction and this sausage exception, the remaining probability is at least $q_2 - q_2 \/ 4 - q_2 \/ 4 = q_2 \/ 2$. On that event, (6.13) gives the fixed mass threshold $c_(*)^2 lambda^p a_(*)$. This event is contained in the step event stated in the lemma: its sausage comes from $J$, which is before the first crossing, and the transferred path has all the required bounds. That step event is measurable from the trace stopped at the first crossing. Although the auxiliary witness $C$ may inspect a later suffix through $t_(upright("out"))$, it is used only to prove this inclusion and lower-bound the probability of the stopped event. The later suffix is discarded before any iteration. For all sufficiently large $n$, both the fixed mass threshold and $q_2 \/ 2$ exceed $1 \/ n$, contradicting the choice of the data.
  This proves the existence of deterministic $q \, c \, v_0 > 0$ uniformly over admissible states, at each prescribed deterministic mesh below $v_0$. Scaling spatial coordinates by $ell$ multiplies normalized sausage area by $ell^(2 - p) = ell^d$, proving the final assertion. ◻
]

=== 6.3 A dense visit in bounded conformal-radius time <a-dense-visit-in-bounded-conformal-radius-time>

#thm([Proposition 6.4.])[
  (Dense visit).  #emph[Fix $s_0 > 0$. There are constants $c \, C \, C_2 > 0$, $C_1 > 1$, and an integer $m_0$ with the following property. Let $S$ be a stopping time of ordinary chordal SLE in $bb(H)$, and let $T_z$ be the lifetime of an interior marked point $z$. The assertion below holds conditionally almost surely on ${ S < oo \, med S < T_z }$, in the surviving state at $S$ or its image under a translation and positive dilation, with the transformed marked point still denoted by $z$. Suppose the marked point in that state has conformal radius $r$ and angle sine at least $s_0$. Let $rho$ be the first subsequent live stop at which its conformal radius is $r \/ C_1$, with $rho = oo$ if that level is not reached, and use the finite centered law of Lemma 9 through $rho$. For each integer $m gt.eq m_0$ there is a deterministic $delta_m > 0$, independent of the stopped state, such that, for every prescribed deterministic physical mesh $0 < v lt.eq r delta_m$, there is an $cal(F)_rho$-measurable success event with conditional centered probability at least 
$ c exp \( - C m^2 \) quad "(6.14)" $ <rc:dense-probability>

 on which the experiment ends at a finite stopping time $T < rho$ and generates sausage mass at least 
$ v^(- p) "Area" #scale(x: 120%, y: 120%)[\(] N_v \( gamma_(upright("experiment")) \) ∩ B \( z \, C_2 r \) #scale(x: 120%, y: 120%)[\)] gt.eq c r^d m^p . quad "(6.15)" $ <rc:dense-mass>

]
] <rc:dense>

#proof[
  Normalize the stopped half-plane map so that $w = g \( z \)$ lies on the upper unit semicircle. Write $y = "Im" w gt.eq s_0$. Initially work under the ordinary chordal law in these coordinates. Let $w'$ be $w$ displaced horizontally by $s_0 \/ 4$ on the side away from the imaginary axis, choosing either side if $"Re" w = 0$. The closed disk of radius $s_0 \/ 20$ about $w'$ is inside $B \( w \, y \/ 2 \)$ and stays a fixed positive distance from $w$. Denote this disk by $cal(D)$.
  Set $h_0 = s_0 \/ 200$. In this disk place $2 m + 1$ vertical segments from height $y - h_0$ to $y + h_0$, with equally spaced horizontal coordinates in an interval of length $2 h_0$ centered at $"Re" w'$. Join consecutive ends by exterior semicircles, alternately above and below the array, and traverse the segments in serpentine order. The semicircles have radii comparable to $h_0 \/ m$. Approach the first segment from below along a smooth simple connector from $0$, initially vertical, whose horizontal displacement is made between heights $s_0 \/ 8$ and $s_0 \/ 2$. Continue the last segment vertically upwards to infinity. The connector may be chosen from a family with uniform smooth bounds, with $w$ a fixed positive distance from it; the sign choice gives two such compact families as $w$ varies.
  Choose
  $ ell = frac(h_0, C_0 m) $
  with $C_0$ a sufficiently large fixed constant. The normal ribbon of width $ell$ about this entire guide is embedded and, in units of $ell$, has the geometry required above. Indeed the nonadjacent straight passes have separation comparable to $h_0 \/ m gt.double ell$; the turn radii are at least $10 ell$; and the smooth connector has a fixed-width embedded ribbon on its original scale and straight attachments. The last segment and approach lie in different columns. The ribbon starts with a vertical segment of length at least $4 ell$. Let $s_(upright("out"))$ be arclength in the normalized half-plane from the base to the point where the final vertical continuation exits $cal(D)$, and set
  $ N = ⌈s_(upright("out")) \/ ell⌉ + 1 . $
  We end the experiment at the first crossing of the front at arclength $N ell$. This front lies between $ell$ and $2 ell$ beyond the disk exit. Since $s_(upright("out")) = O \( m \)$ and $ell asymp m^(- 1)$, the number of unit steps satisfies $N lt.eq C m^2$. At least $c m^2$ middle strips before this front lie wholly inside $cal(D)$.
  Figure 3 shows the displaced disk and the serpentine array within it.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.2, -0.55), (14.7, 6.05))
  content((0, 5.85), [\(a\) Marked point and displaced disk], anchor: "west")
  content((7.25, 5.85), [\(b\) The array inside the disk \(enlarged\)], anchor: "west")
  line((0.1, 0.55), (6.6, 0.55), stroke: (paint: rgb("#4d4d4d")))
  content((6.55, 0.49), [$R$], anchor: "north-east")
  content((0.16, 4.95), [$H$], anchor: "west")
  circle((1.65, 3.65), radius: 0.07056, fill: black)
  content((1.56, 3.7), [$w=g(z)$#linebreak()$|w|=1$], anchor: "south-east")
  circle((3.6, 3.65), radius: 1.03, stroke: (paint: rgb("#8c8c8c"), dash: "dashed"))
  circle((3.6, 3.65), radius: 1.03, fill: black)
  circle((3.6, 3.65), radius: 0.04586, fill: rgb("#666666"))
  content((5.45, 3.46), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$w'$])])
  line((5.22, 3.49), (3.65, 3.63), stroke: (paint: rgb("#666666")))
  line((1.68, 4.92), (3.6, 4.92), mark: (start: "<", end: ">"))
  content((2.64, 4.92), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$s_0/4$])])
  line((1.65, 4.16), (1.65, 5.08), stroke: (paint: rgb("#8c8c8c")))
  line((3.6, 4.68), (3.6, 5.08), stroke: (paint: rgb("#8c8c8c")))
  content((4.58, 4.27), [radius#linebreak()$s_0/20$], anchor: "west")
  line((4.57, 4.29), (4.3, 4.41), stroke: (paint: rgb("#808080")))
  line((0.65, 0.55), (0.65, 1.15), stroke: (thickness: 1.1pt))
  bezier((0.65, 1.15), (2.89, 2.5), (0.65, 1.95), (2.89, 1.63), stroke: (thickness: 1.1pt))
  line((2.89, 2.5), (2.89, 3.08), (2.89, 4.05), stroke: (thickness: 1.1pt))
  arc((2.89, 4.05), start: 180deg, stop: 0deg, radius: 0.12, stroke: (thickness: 1.1pt))
  line((3.13, 4.05), (3.13, 3.08), stroke: (thickness: 1.1pt))
  arc((3.13, 3.08), start: 180deg, stop: 360deg, radius: 0.12, stroke: (thickness: 1.1pt))
  line((3.37, 3.08), (3.37, 4.05), stroke: (thickness: 1.1pt))
  arc((3.37, 4.05), start: 180deg, stop: 0deg, radius: 0.12, stroke: (thickness: 1.1pt))
  line((3.61, 4.05), (3.61, 3.08), stroke: (thickness: 1.1pt))
  arc((3.61, 3.08), start: 180deg, stop: 360deg, radius: 0.12, stroke: (thickness: 1.1pt))
  line((3.85, 3.08), (3.85, 4.05), stroke: (thickness: 1.1pt))
  arc((3.85, 4.05), start: 180deg, stop: 0deg, radius: 0.12, stroke: (thickness: 1.1pt))
  line((4.09, 4.05), (4.09, 3.08), stroke: (thickness: 1.1pt))
  arc((4.09, 3.08), start: 180deg, stop: 360deg, radius: 0.12, stroke: (thickness: 1.1pt))
  line((4.33, 3.08), (4.33, 4.05), (4.33, 5.27), stroke: (thickness: 1.1pt))
  line((4.33, 5.02), (4.33, 5.33))
  content((4.43, 5.18), [future guide], anchor: "west")
  circle((0.65, 0.55), radius: 0.0635, fill: black)
  content((0.65, 0.43), [$0$], anchor: "north")
  content((2.65, 1.47), [smooth connector#linebreak()initially vertical], anchor: "north")
  rect((7.3, 0.84), (12.4, 4.73), fill: black)
  content((7.48, 4.62), [$2m+1$ vertical strands], anchor: "west")
  line((7.65, 0.6), (7.65, 3.57), stroke: (thickness: 4.0pt))
  arc((7.65, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((8.17, 3.57), (8.17, 1.42), stroke: (thickness: 4.0pt))
  arc((8.17, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((8.69, 1.42), (8.69, 3.57), stroke: (thickness: 4.0pt))
  arc((8.69, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((9.21, 3.57), (9.21, 1.42), stroke: (thickness: 4.0pt))
  arc((9.21, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((9.73, 1.42), (9.73, 3.57), stroke: (thickness: 4.0pt))
  arc((9.73, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((10.25, 3.57), (10.25, 1.42), stroke: (thickness: 4.0pt))
  arc((10.25, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((10.77, 1.42), (10.77, 3.57), stroke: (thickness: 4.0pt))
  arc((10.77, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((11.29, 3.57), (11.29, 1.42), stroke: (thickness: 4.0pt))
  arc((11.29, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 4.0pt))
  line((11.81, 1.42), (11.81, 4.29), stroke: (thickness: 4.0pt))
  line((7.65, 0.6), (7.65, 3.57), stroke: (thickness: 0.85pt))
  arc((7.65, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((8.17, 3.57), (8.17, 1.42), stroke: (thickness: 0.85pt))
  arc((8.17, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((8.69, 1.42), (8.69, 3.57), stroke: (thickness: 0.85pt))
  arc((8.69, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((9.21, 3.57), (9.21, 1.42), stroke: (thickness: 0.85pt))
  arc((9.21, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((9.73, 1.42), (9.73, 3.57), stroke: (thickness: 0.85pt))
  arc((9.73, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((10.25, 3.57), (10.25, 1.42), stroke: (thickness: 0.85pt))
  arc((10.25, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((10.77, 1.42), (10.77, 3.57), stroke: (thickness: 0.85pt))
  arc((10.77, 3.57), start: 180deg, stop: 0deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((11.29, 3.57), (11.29, 1.42), stroke: (thickness: 0.85pt))
  arc((11.29, 1.42), start: 180deg, stop: 360deg, radius: 0.26, stroke: (thickness: 0.85pt))
  line((11.81, 1.42), (11.81, 4.29), stroke: (thickness: 0.85pt))
  rect((7.613, 1.747), (7.687, 1.833), fill: black)
  rect((7.613, 2.107), (7.687, 2.193), fill: black)
  rect((7.613, 2.467), (7.687, 2.553), fill: black)
  rect((7.613, 2.827), (7.687, 2.913), fill: black)
  rect((7.613, 3.187), (7.687, 3.273), fill: black)
  rect((8.133, 1.747), (8.207, 1.833), fill: black)
  rect((8.133, 2.107), (8.207, 2.193), fill: black)
  rect((8.133, 2.467), (8.207, 2.553), fill: black)
  rect((8.133, 2.827), (8.207, 2.913), fill: black)
  rect((8.133, 3.187), (8.207, 3.273), fill: black)
  rect((8.653, 1.747), (8.727, 1.833), fill: black)
  rect((8.653, 2.107), (8.727, 2.193), fill: black)
  rect((8.653, 2.467), (8.727, 2.553), fill: black)
  rect((8.653, 2.827), (8.727, 2.913), fill: black)
  rect((8.653, 3.187), (8.727, 3.273), fill: black)
  rect((9.173, 1.747), (9.247, 1.833), fill: black)
  rect((9.173, 2.107), (9.247, 2.193), fill: black)
  rect((9.173, 2.467), (9.247, 2.553), fill: black)
  rect((9.173, 2.827), (9.247, 2.913), fill: black)
  rect((9.173, 3.187), (9.247, 3.273), fill: black)
  rect((9.693, 1.747), (9.767, 1.833), fill: black)
  rect((9.693, 2.107), (9.767, 2.193), fill: black)
  rect((9.693, 2.467), (9.767, 2.553), fill: black)
  rect((9.693, 2.827), (9.767, 2.913), fill: black)
  rect((9.693, 3.187), (9.767, 3.273), fill: black)
  rect((10.21, 1.747), (10.29, 1.833), fill: black)
  rect((10.21, 2.107), (10.29, 2.193), fill: black)
  rect((10.21, 2.467), (10.29, 2.553), fill: black)
  rect((10.21, 2.827), (10.29, 2.913), fill: black)
  rect((10.21, 3.187), (10.29, 3.273), fill: black)
  rect((10.73, 1.747), (10.81, 1.833), fill: black)
  rect((10.73, 2.107), (10.81, 2.193), fill: black)
  rect((10.73, 2.467), (10.81, 2.553), fill: black)
  rect((10.73, 2.827), (10.81, 2.913), fill: black)
  rect((10.73, 3.187), (10.81, 3.273), fill: black)
  rect((11.25, 1.747), (11.33, 1.833), fill: black)
  rect((11.25, 2.107), (11.33, 2.193), fill: black)
  rect((11.25, 2.467), (11.33, 2.553), fill: black)
  rect((11.25, 2.827), (11.33, 2.913), fill: black)
  rect((11.25, 3.187), (11.33, 3.273), fill: black)
  rect((11.77, 1.747), (11.85, 1.833), fill: black)
  rect((11.77, 2.107), (11.85, 2.193), fill: black)
  rect((11.77, 2.467), (11.85, 2.553), fill: black)
  rect((11.77, 2.827), (11.85, 2.913), fill: black)
  rect((11.77, 3.187), (11.85, 3.273), fill: black)
  line((7.65, 0.98), (7.65, 1.27))
  line((11.81, 3.98), (11.81, 4.37))
  line((7.65, 0.39), (11.81, 0.39), mark: (start: "<", end: ">"))
  content((9.73, 0.39), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$2h_0$])])
  line((12.52, 1.42), (12.52, 3.57), mark: (start: "<", end: ">"))
  content((12.52, 2.495), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [#page_rotate(-90deg)[$2h_0$]])])
  content((12.83, 3.77), [disjoint#linebreak()middle#linebreak()regions], anchor: "west")
  line((12.7, 3.77), (11.85, 3.23))
  content((10.25, -0.03), [$ell =h_0/(C_0m) m^{-1}, N m^2$], anchor: "north")
})],
    caption: [Figure 3: A dense visit through a narrow ribbon. (a) In normalized half-plane coordinates, the marked point $w$ is separated from a disk of radius $s_0 \/ 20$ centered at the horizontally displaced point $w'$. The connector starts vertically at $0$, reaches the first strand from below, and stays away from $w$; the final strand continues upward. (b) The disk contains $2 m + 1$ strands of length $2 h_0$ joined by alternating exterior semicircles. Choosing ribbon half-width $ell = h_0 \/ \( C_0 m \)$ gives order $m^2$ steps. The orange marks indicate selected disjoint middle test regions. Their sausage tests contribute order $m^2 ell^d asymp m^(2 - d) = m^p$. Both panels are schematic and not to scale; the array in (b) is enlarged, and the ribbon widths are exaggerated. ],
  ) <fig:serpentine-ribbon>
  Let $F$ be the inverse of the original stopped map. Choose a fixed $chi > 0$, depending only on $s_0$, so that the closed $chi$-neighborhood of $cal(D)$ is inside $B \( w \, y \/ 2 \)$. Such a choice is uniform because the disk center is at distance $s_0 \/ 4$ from $w$ and its radius is $s_0 \/ 20$, while $y gt.eq s_0$. On this neighborhood, Koebe distortion gives
  $ c r lt.eq \| F' \| lt.eq C r \, #h(2em) F \( upright("that neighborhood") \) subset B \( z \, C_2 r \) . $
  Here $\| F' \( w \) \| = r \/ \( 2 y \)$ and $s_0 lt.eq y lt.eq 1$; all constants are uniform in the stopped domain. For the prescribed physical mesh $v$, put
  $ eta = lambda v \/ r \, $
  where $lambda > 0$ is small enough for the upper Lipschitz comparison. Choose the deterministic $delta_m > 0$ so that
  $ lambda delta_m < min { v_0 ell \, chi \/ 2 } . $
  Then $v lt.eq r delta_m$ makes the same parameter mesh $eta$ admissible at every ribbon step. It also keeps the segment from any sausage point counted in $cal(D)$ to a witnessing trace point inside the distortion neighborhood.
  Use vertical-slit support for the initial step from the real boundary, requiring confinement and centered arrival only. It has a fixed positive probability by scaling. At each subsequent first front crossing apply Lemma 22 at this same prescribed mesh $eta$. Impose its passage-and-mass event determined at that crossing, although only the mass contributions inside $cal(D)$ will be counted. The auxiliary later suffix used to prove the lemma is not retained. Given previous successes, the stopped history is therefore admissible for the next step. Denote the intersection of these events by $E_eta$. Iterated conditional probabilities give
  $ bb(P) \( E_eta \) gt.eq q_(upright("init")) q^N gt.eq c exp \( - C m^2 \) . $
  On $E_eta$, the disjoint middle strips inside the disk yield normalized sausage area at the chosen mesh $eta$ of at least
  $ c m^2 ell^d gt.eq c m^(2 - d) = c m^p . quad "(6.16)" $ <rc:layout-sum>
  Disjointness concerns the regions in which area is counted, so it continues to hold if a sausage also meets another piece of the curve.
  On this $eta$-dependent success event, the sausage comparison in (6.13) maps the area counted in (6.16) into the physical $v$-sausage. Conformal area change multiplies normalized area by at least $c r^d$, so (6.15) follows. The choice of $delta_m$ above depends only on $m$ and the fixed constants, uniformly in the stopped state.
  It remains to check the radius cutoff and the change of law. Through completion, the prescribed trace and its filling remain in a narrow neighborhood of the connector, array disk and short terminal extension. More precisely, choose a closed obstacle consisting of $cal(D)$, a thin neighborhood of the simple connector, and a thin neighborhood of the terminal stub from the disk exit through the completion front. The stub has length at most $2 ell$. The connector and stub attach to disjoint small arcs of the disk, and their neighborhoods are otherwise disjoint. This obstacle has connected complement in $bb(H)$, so every filled prefix hull of a trace contained in it is contained in it as well.
  The point $w$ is separated from this set and the real boundary by a fixed positive distance. The connector is below $w$ until its final vertical portion, whose horizontal distance from $w$ is bounded below by a fixed multiple of $s_0$; the array and terminal extension have the same separation. Thus $w$ can move vertically to height $2$, then horizontally to either $x = 3$ or $x = - 3$, and then down to a small real interval about that coordinate, with uniformly positive clearance from the prescribed trace except at the real endpoint. Small adjustments of these polygonal routes give fixed-width neighborhoods. They also connect $w$ and a fixed ball around it to infinity, so these sets are in the surviving domain throughout the experiment. The two chosen real intervals remain unvisited and unswallowed; their Loewner coordinates stay on their respective sides of the driving point by continuity.
  Brownian tracking along the two routes therefore gives a uniform lower bound for the two boundary-arc harmonic measures in every successful intermediate domain. Hence the marked-point angle sine stays at least $s_1 > 0$. Its conformal radius stays above $c_1 > 0$ in parameter coordinates. Conformal covariance therefore keeps its physical radius above $c_2 r$. Choose $C_1 > 1 \/ c_2$ with strict slack.
  Let $T$ be the first crossing of the completion front. It is a stopping time and is finite on $E_eta$. On $E_eta$, the one-point density at this stop, $M = R^(- p) sin^(a_0) theta$, $a_0 = 8 \/ kappa - 1$, satisfies
  $ M_T / M_0 = (R_T / r)^(- p) (frac(sin theta_T, sin theta_0))^(a_0) gt.eq s_1^(a_0) . $
  Stop the density at the radius cutoff and use the finite stopped change of law, first also stopping at a deterministic capacity horizon and then increasing that horizon. Since success occurs in finite time and before the radius cutoff, it follows that its tilted probability is at least $s_1^(a_0)$ times its ordinary probability. This proves (6.14) and (6.15). All tests concern the already generated sausage at finite stops; no limiting marked-point visit is used. ◻
]

== 7 Covers charged to a single sausage mesh <sec:dense-cover>

We prove finite expected $h$-measure of the entire trace in each bounded region. Select disjoint disks carrying enough normalized sausage area, all measured at one deterministic mesh. Their enlarged disks have a uniform expected covering cost; the visited cells they miss have a cost that tends to zero. Keeping that bound independent of the time and interior cutoffs gives the whole-time spatial conclusion.

Use the parameters from (1.2) and the gauge from (1.3). Put $Gamma = gamma \( \[ 0 \, oo \) \)$. For $v > 0$, define the random measure

$ mu^v \( A \) = v^(- p) integral_A upright(bold(1))_({ "dist" \( w \, Gamma \) < v }) thin d A \( w \) . quad "(7.1)" $ <eq:cover-sausage>

The sausage is taken in the whole plane. We also use $mu_t^v$, defined by replacing $Gamma$ with $gamma \( \[ 0 \, t \] \)$. In particular, $mu_t^v lt.eq mu^v$.

===== 7.1 The stopped estimates used by the cover. <the-stopped-estimates-used-by-the-cover.>

For an interior marked point $z$, let $R_t \( z \)$ be its conformal radius in the surviving domain, and let

$ M_t \( z \) = R_t \( z \)^(- p) sin^(a_0) theta_t \( z \) \, #h(2em) M_0 \( z \) = \( 2 "Im" z \)^(- p) (frac("Im" z, \| z \|))^(a_0) . $

Let $bb(P)_z^(*)$ denote the finite-scale tilted laws. Lemmas 9, 10, and 11 give consistency at finite conformal-radius stops, conditional change of law, and the following two bounds. If $hat(S)$ is one unit of the clock $- log R_t \( z \)$ after a stop $S$, then

$ bb(E)_z^(*) #h(-1em) [sin^(- a_0) theta_(hat(S)) \( z \) divides cal(F)_S] lt.eq C . quad "(7.2)" $ <eq:cover-angle>

If $S$ is a stop at which $z$ is alive and $rho lt.eq e^(- 1) R_S \( z \)$, then

$ bb(P) { tau_rho \( z \) < oo divides cal(F)_S } lt.eq C rho^p M_S \( z \) \, quad "(7.3)" $ <eq:cover-one-point>

where $tau_rho$ here denotes the subsequent first stop with conformal radius $rho$. Under the tilted law every finite clock level is reached. The finite-stop identity takes the form

$ bb(E) #h(-1em) [upright(bold(1))_({ S < oo }) M_S \( z \) X] = M_0 \( z \) bb(E)_z^(*) \[ X \] quad "(7.4)" $ <eq:cover-finite-tilt>

for nonnegative variables $X$ measurable at a fixed conformal-radius stop $S$, with the killed density assigned value zero.

Proposition 25 supplies the following precise uniformity. Fix a positive angle cutoff. There are constants $b \, c \, C \, C_2 > 0$, $C_1 > 1$, and an integer $m_0$ such that, for every integer $m gt.eq m_0$ and every radius $r > 0$, there is a deterministic $epsilon \( r \, m \) = r delta_m > 0$ with this property. At any state with $R \( z \) = r$ and angle sine above the cutoff, and for every prescribed $0 < v lt.eq epsilon \( r \, m \)$, the tilted conditional probability is at least $c exp \( - C m^2 \)$ that, before the radius falls to $r \/ C_1$, the future trace generates in $B \( z \, C_2 r \)$ a $v$-sausage of normalized area at least $b r^d m^p$. The constants and the cutoff $epsilon \( r \, m \)$ are uniform in the entire stopped state. The event is observable by that clock endpoint. This formulation permits a single deterministic physical mesh to be used at all the tests below.

We also use the elementary visit geometry associated with the surviving-domain convention. If $overline(B) \( z \, L r \) subset bb(H)$ initially, with $L$ a sufficiently large absolute constant, then a visit to the square of side $r$ centered at $z$ requires a finite live stop at conformal radius $L r$. Indeed, while $z$ survives, Koebe gives $R_t \( z \) lt.eq 4 "dist" \( z \, partial D_t \)$. If $z$ is swallowed without the trace first meeting $overline(B) \( z \, 2 r \)$, that ball is in the swallowed component and the future trace cannot enter it. Otherwise, just before the first such meeting the live radius has decreased to at most $8 r$; continuity gives the earlier radius crossing, for example with $L = 16$. The same argument shows that a trace visit within distance $v$ of $z$ forces a live radius crossing at $16 v$, provided $overline(B) \( z \, 16 v \) subset bb(H)$ initially. These statements concern the trace, rather than the filled hull, and apply also when $kappa > 4$.

#thm([Lemma 7.1.])[
  (Uniform bounded-region charge).  #emph[For every $0 < R < oo$, there is $C_R < oo$, depending only on $R$ and $kappa$, such that 
$ sup_(0 < v lt.eq 1) bb(E) mu^v \( B \( 0 \, R \) \) lt.eq C_R . $

]
] <lem:cover-charge>

#proof[
  Choose a fixed $A > 8 e$. If $y = "Im" w > A v$, the visit geometry and (7.3), with a fixed multiplicative slack in the target radius, give
  $ bb(P) { "dist" \( w \, Gamma \) < v } lt.eq C v^p M_0 \( w \) . $
  For example, increasing $A$ if necessary makes the target $16 v$ at least one clock unit below the initial radius $2 y$. Since $Gamma subset overline(bb(H))$, only the layer $- v < y lt.eq A v$ contributes outside this range. Its area in $B \( 0 \, R \)$ is at most $C_R v$. Tonelli’s theorem therefore gives
  $ bb(E) mu^v \( B \( 0 \, R \) \) & lt.eq C_R v^(1 - p) + C integral_(B \( 0 \, R \) ∩ bb(H)) M_0 \( w \) thin d A \( w \)\
 & lt.eq C_R v^(1 - p) + C integral_(- R)^R integral_0^R \( 2 y \)^(- p) thin d y thin d x lt.eq C_R . $
  Here $p < 1$ is exactly what makes the boundary integral finite. The estimate concerns the whole trace at all times. ◻
]

#thm([Proposition 7.2.])[
  (The upper Hausdorff bound).  #emph[For every $0 < R < oo$, 
$ bb(E) cal(H)^h #scale(x: 120%, y: 120%)[\(] Gamma ∩ overline(B) \( 0 \, R \) #scale(x: 120%, y: 120%)[\)] lt.eq C_R < oo . quad "(7.5)" $ <eq:cover-all-time-expectation>

 Consequently, on one probability-one event, 
$ cal(H)^h #scale(x: 120%, y: 120%)[\(] Gamma ∩ \( \[ - m \, m \] + i \[ 0 \, m \] \) #scale(x: 120%, y: 120%)[\)] < oo #h(2em) \( m = 1 \, 2 \, dots.h \) . $

 On that event every compact capacity-time segment has finite $cal(H)^h$-measure.]
] <prop:dense-cover-upper>

#proof[
  First fix a deterministic compact set $K subset bb(H) ∩ overline(B) \( 0 \, R \)$. Choose $T_0 > 1 + log C_1$, and put
  $ r_j = e^(- T_0 j) \, #h(2em) J_0 = floor.l n \/ 3 floor.r \, #h(2em) J_1 = floor.l 2 n \/ 3 floor.r \, #h(2em) m_n = floor.l c_0 sqrt(log n) floor.r . $
  The constant $c_0 > 0$ will be chosen below. We omit finitely many initial $n$, so that $m_n gt.eq m_0$ and every radius tested is smaller than the initial conformal radius at the grid centers used.
  #emph[One deterministic mesh.] Choose a deterministic sequence $v_n > 0$ such that $v_n arrow.r 0$ and
  $ v_n lt.eq min_(J_0 lt.eq j lt.eq J_1) epsilon \( e^(- 1) r_j \, m_n \) . quad "(7.6)" $ <eq:cover-mesh-choice>
  For example, take half this finite minimum and also require $v_n lt.eq 2^(- n)$ and $v_n lt.eq v_(n - 1) \/ 2$. This choice is deterministic because the dense-visit cutoff is uniform in the state. Write $mu^(\( n \)) = mu^(v_n)$.
  Use the usual grid of closed squares of side $r_n$, and keep the finitely many squares meeting $K$. A center $z$ of such a square has initial height bounded below once $n$ is large. For the argument at this one center, use $bb(P)_z^(*)$ only through the finite clock levels required. Let $S_j \( z \)$ be the first live stop with $R \( z \) = r_j$, and let $S'_j \( z \)$ be the stop one clock unit later, so that $R \( z \) = e^(- 1) r_j$. All these stops are finite under $bb(P)_z^(*)$.
  By (7.2), a fixed angle cutoff can be chosen so that the conditional probability of a good angle at $S'_j$, given the complete history through $S_j$, is at least $1 \/ 2$. The dense-visit input and (7.6) then give a conditional success probability at least
  $ c exp \( - C m_n^2 \) . $
  On success, the prescribed mass has been generated before $S_(j + 1)$, since $T_0 > 1 + log C_1$. Choose a fixed $C_3 gt.eq 1$ so that all these mass tests lie in
  $ D_j \( z \) = overline(B) \( z \, C_3 r_j \) . $
  There is a constant $b_1 > 0$, independent of $n \, j \, z$, such that success implies
  $ mu_(S_(j + 1) \( z \))^(v_n) \( D_j \( z \) \) gt.eq b_1 r_j^d \( log n \)^(p \/ 2) . quad "(7.7)" $ <eq:cover-adapted-success>
  This uses $m_n gt.eq \( c_0 \/ 2 \) sqrt(log n)$ for large $n$. Let $A_(n \, j) \( z \)$ be the event that $S_(j + 1) \( z \) < oo$ and (7.7) holds. Under the tilted law all these endpoint stops are finite. The event $A_(n \, j) \( z \)$ is measurable at $S_(j + 1) \( z \)$, because its sausage uses only the trace through that stop. Choose $c_0$ so small that $C c_0^2 < 1 \/ 2$. For all sufficiently large $n$, the dense-visit lower bound therefore gives
  $ bb(P)_z^(*) #h(-1em) (A_(n \, j) \( z \) divides cal(F)_(S_j \( z \))) gt.eq n^(- 1 \/ 2) . $
  Put
  $ F_n \( z \) = ⋂_(j = J_0)^(J_1) A_(n \, j) \( z \)^c . $
  Every preceding test is observable when the next one starts. Iterated conditional expectations give
  $ bb(P)_z^(*) \( F_n \( z \) \) lt.eq \( 1 - n^(- 1 \/ 2) \)^(J_1 - J_0 + 1) lt.eq C exp \( - c sqrt(n) \) . quad "(7.8)" $ <eq:cover-failure>
  No independence is required between tests or between centers.
  #emph[Returning to the original law.] Call $D_j \( z \)$ a candidate if
  $ mu^(\( n \)) \( D_j \( z \) \) gt.eq b_1 r_j^d \( log n \)^(p \/ 2) . quad "(7.9)" $ <eq:cover-candidate>
  This is a terminal-sausage test. A cell visited by the trace and having no candidate must satisfy the adapted failure event $F_n \( z \)$: at each finite endpoint, $mu_(S_(j + 1))^(v_n) lt.eq mu^(\( n \))$. By the visit geometry, the visit also requires the live stop $tau_(L r_n) \( z \) < oo$, for the fixed constant $L$ above. For large $n$, that stop is after $S = S_(J_1 + 1) \( z \)$ with a gap of at least one clock unit. Thus on the event on the left below all the test endpoints are finite, and $F_n \( z \)$ is measurable at $S$. Applying (7.3), followed by (7.4), gives
  $ & bb(P) { upright("the cell at ") z upright(" is visited and has no candidate") }\
 & quad lt.eq C r_n^p thin bb(E) #h(-1em) [upright(bold(1))_({ S < oo }) M_S \( z \) upright(bold(1))_(F_n \( z \))]\
 & quad = C r_n^p M_0 \( z \) bb(P)_z^(*) \( F_n \( z \) \) lt.eq C r_n^p M_0 \( z \) e^(- c sqrt(n)) . quad "(7.10)" $ <eq:cover-missed-cell>
  The full-sausage candidate information enters only through the inclusion in the adapted failure event. All changes of law occur at finite conformal-radius levels.
  #emph[The finite cover and its charge.] Order the finite collection of candidate disks by decreasing radius, using a fixed deterministic order to break ties. Select the first, discard all disks meeting it, and repeat. The selected closed disks are pairwise disjoint. A discarded disk has no greater radius than the selected disk meeting it, so it is contained in the concentric triple of that selected disk. For large $n$, every cell is contained in each of its candidate disks, since $r_n \/ r_(J_1) arrow.r 0$. Consequently the triples of the selected disks cover all cells having a candidate.
  Uniformly for $J_0 lt.eq j lt.eq J_1$, formula (1.3) implies
  $ h \( 6 C_3 r_j \) lt.eq C r_j^d \( log n \)^(p \/ 2) . $
  The qualification (7.9) and disjointness therefore show that the total cost of these triples is at most
  $ C sum_(upright("selected ") D) mu^(\( n \)) \( D \) lt.eq C mu^(\( n \)) \( B \( 0 \, R + 1 \) \) . quad "(7.11)" $ <eq:cover-selected-charge>
  All the candidate disks lie in this fixed larger disk once $n$ is large. No limiting measure or convergence of sausages is needed in this estimate: every selected disk is charged to the same measure $mu^(\( n \))$.
  Add every retained fine cell that is visited and has no candidate. These cells, together with the selected triples, form a finite cover of $Gamma ∩ K$. There are at most $C_R r_n^(- 2)$ retained cells; their centers stay a positive distance from the real line, so $M_0 \( z \) lt.eq C_K$. Since $h \( sqrt(2) r_n \) lt.eq C r_n^d \( log n \)^(p \/ 2)$, (7.10) yields an expected added cost at most
  $ C_K r_n^(- 2) r_n^d \( log n \)^(p \/ 2) r_n^p e^(- c sqrt(n)) = C_K \( log n \)^(p \/ 2) e^(- c sqrt(n)) arrow.r 0 . quad "(7.12)" $ <eq:cover-cleanup>
  Here $d + p = 2$. The maximal diameter of the cover is at most
  $ delta_n = max { 6 C_3 r_(J_0) \, sqrt(2) r_n } arrow.r 0 . $
  If $Z_n \( K \)$ is its total cost, Lemma 26 and (7.11)–(7.12) show that
  $ limsup_(n arrow.r oo) bb(E) Z_n \( K \) lt.eq C_R . quad "(7.13)" $ <eq:cover-cost-expectation>
  The constant $C_R$ does not depend on the distance of $K$ from the real line. Only the vanishing error and the discarded initial values of $n$ may depend on $K$.
  #emph[Measurability and the Hausdorff limit.] For fixed $v$, the distance to the whole trace is the infimum over nonnegative rational times of $\| w - gamma \( t \) \|$. Thus all the sausage integrals are measurable, by Tonelli’s theorem. There are finitely many candidate indicators and the greedy order is deterministic. A fixed closed cell meets the trace if and only if it meets $gamma \( \[ 0 \, N \] \)$ for some integer $N$; each event is measurable by continuity of $gamma$. It follows that $Z_n \( K \)$ is measurable.
  For completeness, $cal(H)^h \( gamma \( \[ 0 \, T \] \) ∩ K \)$ is also measurable for deterministic $T < oo$ and compact $K$. In defining the Hausdorff limit of this random compact set, one may use finite covers whose members are finite unions of rational open balls. There are only countably many such covers. Their covering events are measurable: for an open union $U$, the event $gamma \( \[ 0 \, T \] \) ∩ K subset U$ is the event that the compact trace avoids the deterministic compact set $K \\ U$. Arbitrarily small open enlargements, using continuity of $h$, show that these countable covering infima have the same limit as the usual Hausdorff contents. This proves measurability.
  For every fixed $T$, the covers above cover $gamma \( \[ 0 \, T \] \) ∩ K$. Therefore, pathwise,
  $ cal(H)^h \( gamma \( \[ 0 \, T \] \) ∩ K \) lt.eq liminf_(n arrow.r oo) Z_n \( K \) . $
  Indeed every sufficiently late cover is admissible at any fixed positive diameter cutoff. Fatou’s lemma and (7.13) give
  $ bb(E) cal(H)^h \( gamma \( \[ 0 \, T \] \) ∩ K \) lt.eq C_R \, quad "(7.14)" $ <eq:cover-compact-expectation>
  uniformly in both $T$ and $K subset bb(H) ∩ overline(B) \( 0 \, R \)$.
  #emph[The entire trace in a bounded region.] To retain this uniformity when approaching both infinite time and the real boundary, set
  $ K_q = overline(B) \( 0 \, R \) ∩ { "Im" z gt.eq 1 \/ q } \, #h(2em) E_q = gamma \( \[ 0 \, q \] \) ∩ K_q quad \( q = 1 \, 2 \, dots.h \) . $
  The sets $E_q$ are increasing compact sets, and
  $ union.big_(q gt.eq 1) E_q = Gamma ∩ overline(B) \( 0 \, R \) ∩ bb(H) . $
  Gauge Hausdorff measure is a measure on Borel sets. Its continuity from below and then monotone convergence, applied to (7.14), give
  $ bb(E) cal(H)^h \( Gamma ∩ overline(B) \( 0 \, R \) ∩ bb(H) \) = lim_(q arrow.r oo) bb(E) cal(H)^h \( E_q \) lt.eq C_R . $
  Finally, a bounded real interval is covered by $O_R \( r^(- 1) \)$ intervals of length $r$, whose total cost is
  $ O_R #h(-1em) (r^(d - 1) \( log log \( 1 \/ r \) \)^(p \/ 2)) arrow.r 0 \, $
  because $d > 1$. The real-axis part therefore has zero $cal(H)^h$-measure. This proves (7.5).
  Apply the result at integer radii and intersect the resulting countably many probability-one events. Every box in the statement is contained in one of these disks. Every compact time segment has bounded image by continuity of $gamma$, so it too lies in such a disk. This proves both assertions simultaneously. ◻
]

#proof[
  Section 5.4 gives positivity simultaneously on all real $0 < s < t < oo$ for the fixed parameter $kappa$. Proposition 27 gives the all-time bounded-box estimate and finite measure on every compact time segment on another probability-one event. Their intersection proves all assertions. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
