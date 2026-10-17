#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Nonuniqueness with local conservation \
for the hard-sphere Boltzmann equation]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The Boltzmann equation describes the transport and binary collisions of a dilute gas. Its collision law conserves mass, momentum, and kinetic energy at each spatial point, while its entropy decreases. A weak solution theory must retain enough of these properties to distinguish the equation from a balance law with an unidentified collision defect. This paper constructs two global solutions with the same initial datum for which all five local collision-invariant balances hold exactly.

The connection between binary collisions and entropy dissipation goes back to Boltzmann’s kinetic theory #cite(label("Boltzmann1872")). For the spatially inhomogeneous Cauchy problem, DiPerna and Lions established the large-data theory of global existence and weak stability for renormalized solutions #cite(label("DiPernaLions1989")). On periodic space the initial assumptions are finite mass, energy, and entropy, and the solutions obey the entropy-production inequality #cite(label("DiPernaLions1991")) Theorem 1 and Remark 2. Renormalization addresses a basic difficulty: these bounds alone need not make the quadratic collision term locally integrable.

Exact conservation is an additional issue at this level of regularity. The periodic formulation in #cite(label("LevermoreMasmoudi2010")) Theorem 4.1 gives local mass conservation, but allows a nonnegative matrix-valued defect in the momentum balance and a corresponding defect in total energy. It does not automatically give exact local momentum and energy conservation. The present result concerns solutions that obey both of these local identities, with the energy flux integrable and with the prescribed initial traces. Their separate collision gains and losses are integrable with every polynomial velocity weight on each finite time interval.

Uniqueness is available under stronger control. Kaniel and Shinbrot proved local existence and uniqueness in classes bounded by a multiple of a Maxwellian #cite(label("KanielShinbrot1978")). Ukai obtained global existence and uniqueness for small periodic perturbations of a Maxwellian in weighted spatial Sobolev spaces #cite(label("Ukai1974")) Theorem 1.2. Duan, Huang, Wang, and Yang later allowed large but bounded amplitudes on the torus or in the whole space, assuming small relative entropy and a small spatially integrated velocity supremum of the perturbation #cite(label("DuanHuangWangYang2017")) Theorem 1.1. Our datum instead has unbounded amplitudes at shrinking spatial scales. The small relative entropy used in its construction therefore does not place it in these uniqueness classes.

For the spatially homogeneous hard-sphere equation, finite mass and energy suffice for uniqueness within the conservative class #cite(label("MischlerWennberg1999")) Theorem 1.1. Wennberg’s homogeneous nonuniqueness examples for hard potentials allow increasing energy #cite(label("Wennberg1999")). The mechanism studied here uses spatial concentration and preserves energy locally. Thus the distinction between homogeneous and inhomogeneous evolution, as well as the precise conservation requirements, matters for comparison.

Recent instability results address a different aspect of the Cauchy problem. Chen and Holmer prove failure of uniform continuity in weighted Sobolev spaces for the constant collision kernel on $bb(R)_x^3 times bb(R)_v^3$ #cite(label("ChenHolmer2024")) Theorem 1.3. Chen, Shen, and Zhang extended this analysis to a range of cutoff soft potentials #cite(label("ChenShenZhang2024")). For hard spheres on the whole space, Chen, Guo, Shen, and Zhang prove failure of uniform continuity from Gaussian-weighted initial data to the unweighted $L_v^2 H_x^s$ norm for $0 lt.eq s < 1$ #cite(label("ChenGuoShenZhang2026")) Theorem 1.1. These results compare nearby initial data, whereas the two solutions constructed here have exactly the same datum. For the Krieger–Strain (isotropic Landau) model, Gismondi, Golding, and Novack construct rough stationary solutions whose mollified collision operators tend to zero, and conjecture nonuniqueness of renormalized solutions to the inhomogeneous Landau and Boltzmann Cauchy problems #cite(label("GismondiGoldingNovack2026")) Section 1.2.

=== 1.1 The equation and the solution class <the-equation-and-the-solution-class>

Let $bb(T)^3 = bb(R)^3 \/ bb(Z)^3$ have volume one and put $Omega = bb(T)_x^3 times bb(R)_v^3$. Write $D_t = partial_t + v dot.op nabla_x$. For $v \, v_(*) in bb(R)^3$ and $omega in S^2$, define the elastic collision by

$ a = \( v - v_(*) \) dot.op omega \, #h(2em) v' = v - a omega \, #h(2em) v'_(*) = v_(*) + a omega . $

The sphere carries ordinary surface measure. The hard-sphere equation is

$ D_t F = Q \( F \, F \) = Q^(+) \( F \, F \) - Q^(-) \( F \, F \) \, #h(2em) F gt.eq 0 \, quad "(1.1)" $ <eq:collision>

where

$ Q^(+) \( F \, F \) \( v \) & = integral_(bb(R)^3 times S^2) \| a \| F \( v' \) F \( v'_(*) \) thin upright(d) v_(*) thin upright(d) omega \,\
Q^(-) \( F \, F \) \( v \) & = integral_(bb(R)^3 times S^2) \| a \| F \( v \) F \( v_(*) \) thin upright(d) v_(*) thin upright(d) omega . $

Every factor has the same time and position. We use primes and stars with the same convention in the entropy dissipation below.

Set $M \( v \) = \( 2 pi \)^(- 3 \/ 2) e^(- \| v \|^2 \/ 2)$ and $G = F \/ M$. Define

$ cal(H)_M \( F \) & = integral_Omega #scale(x: 120%, y: 120%)[\(] F log \( F \/ M \) - F + M #scale(x: 120%, y: 120%)[\)] thin upright(d) x thin upright(d) v \,\
cal(D) \( F \) & = 1 / 4 integral_(bb(T)^3 times bb(R)^3 times bb(R)^3 times S^2) \| a \| \( F' F'_(*) - F F_(*) \) log frac(F' F'_(*), F F_(*)) thin upright(d) x thin upright(d) v thin upright(d) v_(*) thin upright(d) omega . quad "(1.2)" $ <eq:entropy>

The dissipation integrand takes its nonnegative lower-semicontinuous extended value at zero. We set $0 \| log 0 \| = 0$.

#prodef([Definition 1.1.])[
  (Entropy solution with local conservation).  Let $F_0 gt.eq 0$ have finite mass, energy, and absolute entropy. A global entropy solution with local conservation is a nonnegative function $F$ satisfying the following conditions.
  + $F in C_w \( \[ 0 \, oo \) \; L^1 \( Omega \) \)$, $F \( 0 \) = F_0$, with continuity against every bounded measurable test. For every finite $T$,
    $ sup_(0 lt.eq t lt.eq T) integral_Omega F \( t \) \( 1 + \| v \|^2 + \| log F \( t \) \| \) thin upright(d) x thin upright(d) v < oo . $
  + The two functions $Q^plus.minus \( F \, F \) \/ \( 1 + G \)$ belong to $L^1 \( \[ 0 \, T \] times Omega \)$ for every finite $T$. For every $beta in C^1 \( \[ 0 \, oo \) \)$ with $beta \( 0 \) = 0$ and $\| beta' \( z \) \| lt.eq C_beta \/ \( 1 + z \)$, and every smooth $phi$ periodic in $x$ and compactly supported in $\[ 0 \, oo \) times bb(R)_v^3$,
    $ & integral_0^oo #h(-1em) #h(-1em) integral_Omega [M beta \( G \) D_t phi + beta' \( G \) Q \( F \, F \) phi] thin upright(d) x thin upright(d) v thin upright(d) t\
 & thin + integral_Omega M beta \( F_0 \/ M \) phi \( 0 \, x \, v \) thin upright(d) x thin upright(d) v = 0 . quad "(1.3)" $ <eq:renormalized>
  + Total momentum is conserved. At every $t gt.eq 0$,
    $ integral_Omega \| v \|^2 F \( t \) thin upright(d) x thin upright(d) v lt.eq integral_Omega \| v \|^2 F_0 thin upright(d) x thin upright(d) v \, #h(2em) cal(H)_M \( F \( t \) \) + integral_0^t cal(D) \( F \( s \) \) thin upright(d) s lt.eq cal(H)_M \( F_0 \) . $
  + For every finite $T$,
    $ integral_0^T #h(-1em) #h(-1em) integral_Omega \( 1 + \| v \|^3 \) F thin upright(d) x thin upright(d) v thin upright(d) t < oo . $
    For every $psi in { 1 \, v_1 \, v_2 \, v_3 \, \| v \|^2 \/ 2 }$ and $phi.alt in C_c^oo \( \[ 0 \, oo \) times bb(T)^3 \)$,
    $ integral_0^oo #h(-1em) #h(-1em) integral_Omega F psi D_t phi.alt thin upright(d) x thin upright(d) v thin upright(d) t + integral_Omega F_0 psi phi.alt \( 0 \, x \) thin upright(d) x thin upright(d) v = 0 . quad "(1.4)" $ <eq:local-balances>
] <def:admissible>

The last condition is local conservation of mass, momentum, and kinetic energy, including the initial traces. In particular it is stronger than requiring only the corresponding global inequalities.

#thm([Theorem 1.2.])[
  #emph[There exist $R < oo$ and a nonnegative datum $F_0$ with 
$ "supp"_v F_0 subset B_R \( 0 \) \, #h(2em) integral_Omega F_0 \( 1 + \| v \|^2 + \| log F_0 \| \) thin upright(d) x thin upright(d) v < oo \, $

 for which (1.1) has two global entropy solutions with local conservation in the sense of Definition 1, differing on a set of positive $\( t \, x \, v \)$-measure. Both solutions belong to $C \( \[ 0 \, oo \) \; L^1 \( Omega \) \)$. Moreover, for every finite $T$ and every $k gt.eq 0$, they satisfy 
$ integral_0^T #h(-1em) #h(-1em) integral_Omega chevron.l v chevron.r^k #scale(x: 120%, y: 120%)[\[] Q^(+) \( F \, F \) + Q^(-) \( F \, F \) #scale(x: 120%, y: 120%)[\]] thin upright(d) x thin upright(d) v thin upright(d) t < oo \, #h(2em) chevron.l v chevron.r = \( 1 + \| v \|^2 \)^(1 \/ 2) . quad "(1.5)" $ <eq:strong-collision-integrability>

]
] <thm:main>

=== 1.2 The construction and its new global estimate <the-construction-and-its-new-global-estimate>

The starting point is the concentrating-jet mechanism of #cite(label("OpenAIPeriodic")). That construction produces nonuniqueness in an entropy class. Its continuation theorem does not supply the exact local momentum and energy identities required here. We retain the jet mechanism and construct the global continuation directly. The kernel estimates, the detection of a nonzero rescaled solution, and its branching growth are reproduced below with attribution; the new estimates concern the interaction of those jets with a surrounding gas over arbitrarily long times.

A cold jet at scale $s$ occupies a thin transverse annulus and has a small velocity width. Its velocity-integrated density can be of order $1 \/ s$, but its total mass is of order $s^2$. Geometrically decreasing scales therefore allow singular collision frequencies near time zero while retaining finite mass, energy, and entropy. The opposite axial streams are separated into fine spatial stripes. Under dilation those stripes average to a two-stream medium; a small additional population then follows a linear equation in that medium.

There are two obstacles to extending this mechanism while preserving all local conservation laws. First, thin jets eventually meet their periodic copies. Second, an entropy bound alone does not give the separate integrability of gain and loss needed to pass every local balance to a limit. We address both by giving each scale a finite lifetime as a separate component. The jet axis is chosen in a quadratic-irrational direction, which prevents intersections before that lifetime ends. A nearly Maxwellian bath supplies a uniform positive collision frequency after a fixed short time. The jets then decay exponentially, so that each can be added to a remainder with a uniform weighted bound at the end of its lifetime.

The central continuation estimate combines three facts. On a fixed weighted order interval, small velocity mass makes the normalized gain small. Small relative entropy controls the spatial integral of the excess over the Maxwellian. Finally, integration over velocities along free flights turns this spatial smallness into a pointwise mass bound. These facts close a global weighted supremum estimate even though the initial cold components have no common finite supremum. The same construction makes the contributions of the small scales to the weighted collision integrals summable. This yields (1.5), which is the decisive input for exact local conservation and strong time traces.

For nonuniqueness, the approximation with no additional initial population will be called dormant. In a second family, a vanishing seed is varied until its evolution attains a prescribed time-dependent bound. Dilation at an attaining time produces a nonzero solution of the linear equation in the two-stream medium; nonconcentration prevents the attained size from disappearing. Branching growth forces the rescaled limit to have a finite time horizon. The dormant solution, meanwhile, tends to zero away from the velocity axis under the normalized dilation by the original horizon. Finiteness makes the two spatial and temporal dilation scales comparable. If the two global limits agreed at arbitrarily small horizons, comparing their dilations would force the nonzero limit to vanish.

===== 1.2.1 Organization. <organization.>

Section 2 fixes the gain normalization and the velocity weight. Section 3 proves the kernel estimates. Sections 4–6 construct the data, control the cold jets, and select the short-time approximations. Section 7 proves the global continuation estimate, and Section 8 proves admissibility and local conservation of the limits. Sections 9–11 establish the nonzero rescaled limit and its finite horizon. Section 12 completes the proof of Theorem 2.

== 2 Coordinates and collision estimates <sec:framework>

We first fix the normalization used in the estimates and explain the singular velocity weight. Throughout the construction we rotate space and velocity by the same orthogonal map, taking the original direction $\( 1 \, sqrt(2) \, 0 \) \/ sqrt(3)$ to the third coordinate axis. The period lattice becomes a rotation $Lambda$ of $bb(Z)^3$, still of covolume one. The equation and all the properties in Definition 1 are invariant under this change of coordinates. We work on $bb(R)^3 \/ Lambda$, or in its periodic lift, until the last step of the proof. Write $x = \( y \, z \) in bb(R)^2 times bb(R)$ and $v = \( macron(v) \, v_3 \)$. Dilations in space are always taken in the lift.

Let $P$ denote the bilinear gain

$ P \( f \, g \) \( v \) = integral_(bb(R)^3 times S^2) \| \( v - v_(*) \) dot.op omega \| f \( v' \) g \( v'_(*) \) thin upright(d) v_(*) thin upright(d) omega . $

For the hard-sphere kernel it is symmetric in $f \, g$, as verified in Lemma 3; in particular $P \( F \, F \) = Q^(+) \( F \, F \)$. The loss frequency is

$ nu_f \( v \) = 2 pi integral_(bb(R)^3) \| v - p \| f \( p \) thin upright(d) p \, #h(2em) Q^(-) \( F \, F \) = F nu_F . quad "(2.1)" $ <eq:frequency>

A superscript $b$, where $b gt.eq 1$, means that the collision kernel is multiplied by

$ min { 1 \, b \/ \| v - v_(*) \| } . quad "(2.2)" $ <eq:cutoff>

Its value at zero is immaterial. The same factor is used in gain and loss; thus $nu_f^b \( v \) = 2 pi integral min { b \, \| v - p \| } f \( p \) thin upright(d) p$. It preserves particle interchange and the elastic change of variables, and is exactly one on any fixed bounded velocity region for all sufficiently large $b$.

Fix $1 < q < 2$ and $m = 100$. Our velocity weight is

$ H \( v \) = e^(- \| v \|^2) chevron.l v chevron.r^(- m) W \( v \) \, #h(2em) W \( v \) = 1 + \| macron(v) \|^(- q) \, #h(2em) parallel f parallel_H = "ess sup"_(x \, v) frac(\| f \( x \, v \) \|, H \( v \)) . quad "(2.3)" $ <eq:weight>

The value assigned on the velocity axis is irrelevant. All supremum estimates are essential estimates away from that axis. Since its transverse dimension is two and $q < 2$, $H$ is integrable with every polynomial velocity weight; it also belongs to $L^(1 + epsilon)$ for small enough $epsilon > 0$. The singularity permits gain estimates uniform as a cold velocity distribution collapses onto the axis. The inequality $q > 1$ is used in the corresponding plane integrals.

Constants denoted $C$ may depend on fixed construction parameters, but not on the approximation index or the shrinking horizon unless explicitly stated. The choices of the four parameters governing branching growth will be made in Section 11; all earlier arguments hold for any fixed parameters in the indicated ranges. The remaining small parameters are then chosen in the order specified by the continuation proof.

===== 2.1 Transport representatives. <transport-representatives.>

An integrable distributional equation $D_t f = R$ is read in free coordinates, $f^sharp \( t \, x \, v \) = f \( t \, x + t v \, v \)$. Its time sections are absolutely continuous for almost every $\( x \, v \)$, with derivative $R^sharp$. We use these representatives in path inequalities. Fubini’s theorem makes such inequalities valid for almost every endpoint at any prescribed time. At the finite approximations the gain kernels have absolutely continuous hot-input marginals; together with free translations this permits iteration on common full-measure endpoint sets. The later limiting path formulas will be established from their integrable sources. No assertion depends on values assigned to the velocity axis or other null sets.

== 3 Collision kernels and a velocity majorant <ker:section>

We establish gain bounds for narrow velocity distributions and for the weight $H$. They control the finite evolutions and the global continuation. The sheet and quadratic estimates are adapted from #cite(label("OpenAIPeriodic")) Section 3; their proofs are included below, followed by the small-mass estimate needed for continuation.

Write $v = \( macron(v) \, v_3 \) in bb(R)^2 times bb(R)$ and set

$ W \( v \) = 1 + \| macron(v) \|^(- q) \, #h(2em) H \( v \) = e^(- \| v \|^2) chevron.l v chevron.r^(- m) W \( v \) \, #h(2em) 1 < q < 2 \, quad m = 100 \, $

as in (2.3). Values on the velocity axis are irrelevant to all the almost-everywhere estimates below. The function $H$ has every polynomial moment and belongs to $L^p \( bb(R)^3 \)$ whenever $1 lt.eq p < 2 \/ q$. Indeed, its only local singularity is $\| macron(v) \|^(- q)$ in two dimensions, and its decay at infinity is Gaussian. Every estimate below is proved for an arbitrary fixed $q in \( 1 \, 2 \)$; it may therefore also be applied with a different fixed exponent in that interval.

A model for the cold velocities, in parameters $w = \( macron(w) \, w_3 \) in bb(R)^3$, is

$ macron(p) = d macron(w) \, #h(2em) p_3 = upsilon \( z \) + d w_3 \, $

where $d > 0$ is small and $upsilon$ is bounded, nondecreasing, and $C^1$. At a fixed position after free transport, the axial parameter relation and its Jacobian become

$ p_3 = upsilon \( z - t p_3 \) + d w_3 \, #h(2em) frac(partial p_3, partial w_3) = frac(d, 1 + t upsilon' \( z - t p_3 \)) . $

A fixed parameter law can therefore produce strong axial concentration. We will estimate gains using transverse Gaussian majorants while imposing no density bound on the axial law. For any nonnegative velocity density $c$ and $Z gt.eq 0$, positivity gives

$ 0 lt.eq h lt.eq Z H quad arrow.r.double quad frac(P \( c \, h \), H) lt.eq Z frac(P \( c \, H \), H) . $

Thus $P \( c \, H \) \/ H$ controls the gain in the weighted supremum. The collision formula below realizes this coefficient as the mass of a normalized measure on the two input velocities.

=== 3.1 The exact Carleman formula <the-exact-carleman-formula>

The hyperplane representation used here is a Carleman formula; see also #cite(label("GambaPanferovVillani2009")) Appendix C. We derive its coefficient for the normalization of this paper.

#thm([Lemma 3.1.])[
  (Collision geometry).  #emph[For the normalization in (1.1), the symmetric bilinear gain is 
$ P \( c \, h \) \( v \) = 2 integral_(bb(R)^3) c \( p \) thin thin upright(d) p integral_(bb(R)^3) delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] h \( xi \) thin thin upright(d) xi . quad "(3.1)" $ <ker:carleman>

 For fixed $p eq.not v$, the inner delta denotes surface measure on the plane $\( v - p \) dot.op \( xi - v \) = 0$, divided by $\| v - p \|$. For incoming velocities $p \, xi$, the outgoing measure has total mass $2 pi \| p - xi \|$ and is uniform on the sphere with diameter $\[ p \, xi \]$. Formula (3.1) also defines the gain when $c$ is a nonnegative velocity measure and $h$ is a nonnegative density, whenever the displayed integral is finite almost everywhere.]
] <lem:carleman>

#proof[
  Put $g = p - xi$. Reflection sends $g$ to $g - 2 \( g dot.op omega \) omega$. On either hemisphere of the normal sphere, the change from the polar angle of $omega$ to the reflected direction shows that $\| g dot.op omega \| thin thin upright(d) omega$ pushes forward to $\( \| g \| \/ 4 \) thin thin upright(d) sigma$. The two hemispheres therefore give $\( \| g \| \/ 2 \) thin thin upright(d) sigma$, where $sigma in S^2$ is the outgoing relative direction. Equivalently, for every nonnegative test function $psi$, the one-output measure is
  $ frac(\| p - xi \|, 2) integral_(S^2) psi (frac(p + xi, 2) + frac(\| p - xi \|, 2) sigma) thin upright(d) sigma . quad "(3.2)" $ <ker:sphere-law>
  Its mass is $2 pi \| p - xi \|$. The affine map in this integral multiplies surface area by $\| p - xi \|^2 \/ 4$, so the density on its image sphere is $2 \/ \| p - xi \|$.
  The same sphere is the zero set of $f \( v \) = \( v - p \) dot.op \( xi - v \)$. On that sphere, $\| nabla_v f \( v \) \| = \| p - xi \|$. The coarea formula consequently identifies the measure in (3.2) with $2 delta \( f \( v \) \) thin thin upright(d) v$. Integration against the two incoming densities and Tonelli’s theorem give (3.1). The usual pre/post-collisional change of variables identifies this incoming-pair expression with the gain in (1.1). Coincident incoming velocities have zero collision rate. The same identities can first be integrated against a velocity measure $c \( thin upright(d) p \)$, proving the asserted extension. ◻
]

In the cutoff gain, the integrand in (3.1) is multiplied by $min \( 1 \, b \/ \| p - xi \| \)$. The relative input speed equals the relative output speed, so this factor preserves the collision symmetries. It is at most one. All upper estimates below consequently hold for $P^b$ as well, uniformly in $b gt.eq 1$.

=== 3.2 A geometric slice estimate <a-geometric-slice-estimate>

For $d > 0$, let $cal(G)_d$ be the centered transverse Gaussian probability measure with density

$ frac(1, pi d^2) e^(- \| macron(p) \|^2 \/ d^2) \, $

and let $cal(G)_0 = delta_0$. We shall also use the uniform probability measure $cal(U)_d$ on ${ macron(p) : \| macron(p) \| < d }$.

#thm([Lemma 3.2.])[
  (Transverse averaging and axial slices).  #emph[Let $lambda$ be a probability mixture of the measures $cal(U)_d$, $d > 0$, and $delta_0$, and let $rho$ be any axial probability measure. No bound on its density or its support is required. Put $c = lambda ⊗ rho$. For $R gt.eq 1$, $macron(v) eq.not 0$, and an interval $I subset bb(R)$ of length $0 < ell lt.eq 2 R$, one has 
$ & frac(1, W \( v \)) integral c \( thin upright(d) p \) integral_(\| xi - v \| lt.eq R) delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] W \( xi \) thin thin upright(d) xi lt.eq C_q R^2 \,\
 & frac(1, W \( v \)) integral c \( thin upright(d) p \) integral_(\| xi - v \| lt.eq R\
xi_3 in I) delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] W \( xi \) thin thin upright(d) xi lt.eq C_q #scale(x: 120%, y: 120%)[\(] R ell + R^(q - 1) ell^(2 - q) #scale(x: 120%, y: 120%)[\)] . quad "(3.3)" $ <ker:geometric-total>

 The constants are independent of all transverse widths and of $rho$. In particular, these statements hold with $lambda = cal(G)_d$ for every $d gt.eq 0$.]
] <ker:geometric-slice>

#proof[
  Set $r = \| macron(v) \|$, $n = macron(v) - macron(p)$, and $e_n = n \/ \| n \|$. Except on a set of transverse measure zero, $n eq.not 0$. For fixed $p_3 \, xi_3$, the delta in the transverse variables is line measure divided by $\| n \|$, on a line whose signed distance from zero is
  $ A - B \( xi_3 - v_3 \) \, #h(2em) A = e_n dot.op macron(v) \, quad B = frac(v_3 - p_3, \| n \|) . $
  The regular part of its integral over $\| xi - v \| lt.eq R$ is at most $2 R \/ \| n \|$. The singular part is bounded by its integral over the full line, namely
  $ frac(1, \| n \|) integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] \( A - B \( xi_3 - v_3 \) \)^2 + s^2 #scale(x: 120%, y: 120%)[\)]^(- q \/ 2) thin thin upright(d) s = frac(a_q, \| n \|) \| A - B \( xi_3 - v_3 \) \|^(1 - q) \, quad "(3.4)" $ <ker:line-integral>
  where $a_q = integral_(bb(R)) \( 1 + s^2 \)^(- q \/ 2) thin thin upright(d) s < oo$ because $q > 1$. Infinite values on a zero-distance slice are harmless in the nonnegative iterated integral.
  For every interval $J subset \[ - R \, R \]$ of length at most $ell$,
  $ integral_J \| A - B x \|^(1 - q) thin thin upright(d) x lt.eq C_q R^(q - 1) ell^(2 - q) \| A \|^(1 - q) . quad "(3.5)" $ <ker:scalar-interval>
  If $2 R \| B \| lt.eq \| A \|$, the integrand is at most $C_q \| A \|^(1 - q)$, and the assertion follows from $ell lt.eq 2 R$. Otherwise, integration about the possible root gives an upper bound $C_q \| B \|^(1 - q) ell^(2 - q)$; since $1 - q < 0$ and $\| B \| > \| A \| \/ \( 2 R \)$, this proves (3.5). When $A = 0$ the displayed upper bound is understood in the extended sense.
  We next prove
  $ integral frac(1 + \| e_n dot.op e_(macron(v)) \|^(1 - q), \| n \|) thin lambda \( thin upright(d) macron(p) \) lt.eq C_q / r . quad "(3.6)" $ <ker:transverse-expectation>
  It suffices to consider a disk of radius $d$. If $d lt.eq r \/ 2$, then $\| n \| gt.eq r \/ 2$ and $e_n dot.op e_(macron(v)) gt.eq 1 \/ 3$, which proves the bound. If $d > r \/ 2$, use polar coordinates for $n$. Its range lies in $\| n \| < r + d < 3 d$. The factor $\| n \|^(- 1)$ cancels the radial Jacobian, while
  $ integral_0^(2 pi) #scale(x: 120%, y: 120%)[\(] 1 + \| cos theta \|^(1 - q) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) theta < oo $
  because $q < 2$. Division by the disk area gives $C_q \/ d lt.eq 2 C_q \/ r$. The point mass at zero satisfies the same estimate directly. Finally, the Gaussian is a probability mixture of these disks: for $d > 0$ its mixture density in the disk radius $a$ is
  $ frac(2 a^3, d^4) e^(- a^2 \/ d^2) thin thin upright(d) a \, $
  whose integral is one. This proves the Gaussian assertion as well.
  Integrating (3.4) in $xi_3$, applying (3.5), and then (3.6), bounds the expression in (3.3) by
  $ C_q R ell frac(r^(- 1), 1 + r^(- q)) + C_q R^(q - 1) ell^(2 - q) frac(r^(- q), 1 + r^(- q)) . $
  Both fractions are bounded for $q > 1$. These bounds are independent of $p_3$, so integration against the arbitrary probability $rho$ preserves them. Taking the entire axial range of length $2 R$ also gives (3.3). ◻
]

=== 3.3 Sheets and normalized kernel measures <sheets-and-normalized-kernel-measures>

#prodef([Definition 3.3.])[
  (Uniform sheet class).  Fix $L gt.eq 1$. An elementary sheet in $cal(S)_L$ is a product probability measure
  $ c \( thin upright(d) p \) = cal(G)_d \( thin upright(d) macron(p) \) rho \( thin upright(d) p_3 \) \, #h(2em) 0 lt.eq d lt.eq 1 / 8 \, #h(2em) integral_(bb(R)) e^(8 a^2) rho \( thin upright(d) a \) lt.eq L . quad "(3.7)" $ <ker:sheet-definition>
  We also allow probability mixtures of elementary sheets. An upper bound by a sheet with amplitude $A_0$ means domination as measures by $A_0$ times such a mixture.
] <ker:sheet-class>

Every axial probability supported in $\[ - A \, A \]$ satisfies this definition with $L = e^(8 A^2)$. In particular, axial atoms and limits of arbitrarily narrow axial densities are permitted. The exponential moment is used only to remove large axial velocities, and imposes no axial regularity.

For such a sheet and $macron(v) eq.not 0$, define its normalized kernel by

$ cal(K)_c \( v \; thin upright(d) p thin thin upright(d) xi \) = 2 thin c \( thin upright(d) p \) thin delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] frac(H \( xi \), H \( v \)) thin thin upright(d) xi . quad "(3.8)" $ <ker:normalized-kernel>

The total mass is $P \( c \, H \) \( v \) \/ H \( v \)$. Kernel restrictions always refer to this complete measure, including the ratio $H \( xi \) \/ H \( v \)$.

#thm([Lemma 3.4.])[
  (Uniform sheet gain bound).  #emph[For every $L < oo$ there is $C_(q \, m \, L) < oo$ such that 
$ P \( c \, H \) \( v \) lt.eq C_(q \, m \, L) H \( v \) quad upright("for almost every ") v \, #h(2em) c in cal(S)_L . quad "(3.9)" $ <ker:sheet-gain>

 More quantitatively, for $R gt.eq 1$, 
$ cal(K)_c #scale(x: 120%, y: 120%)[\(] v \; R < \| p \| + \| xi - v \| lt.eq 2 R #scale(x: 120%, y: 120%)[\)] lt.eq C_(q \, m \, L) R^2 e^(- c R^2) \, quad "(3.10)" $ <ker:shell-tail>

 where $c > 0$ is an absolute constant. The same conclusions, multiplied by $A_0$, hold under sheet domination with amplitude $A_0$.]
] <lem:sheet-bound>

#proof[
  By positivity it suffices to treat an elementary sheet. Put $k = xi - v$ and $w = p + k$. On the collision plane,
  $ \| p \|^2 + \| xi \|^2 = \| v \|^2 + \| w \|^2 \, #h(2em) frac(H \( xi \), H \( v \)) = e^(\| p \|^2 - \| w \|^2) frac(chevron.l v chevron.r^m, chevron.l xi chevron.r^m) frac(W \( xi \), W \( v \)) . quad "(3.11)" $ <ker:energy-factor>
  The same identity implies $chevron.l v chevron.r lt.eq chevron.l p chevron.r chevron.l xi chevron.r$. Since $chevron.l p chevron.r^m lt.eq C_m e^(\| p \|^2)$, the kernel is bounded by
  $ C_m e^(2 \| p \|^2) c \( thin upright(d) p \) thin e^(- \| w \|^2) delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op k #scale(x: 120%, y: 120%)[\)] frac(W \( v + k \), W \( v \)) thin thin upright(d) k . quad "(3.12)" $ <ker:tilted-kernel>
  The tilted cold measure retains a product majorant. For $0 < d lt.eq 1 \/ 8$,
  $ e^(2 \| macron(p) \|^2) cal(G)_d \( thin upright(d) macron(p) \) lt.eq 4 e^(- 46 \| macron(p) \|^2) cal(G)_(2 d) \( thin upright(d) macron(p) \) . quad "(3.13)" $ <ker:transverse-tilt>
  This follows by dividing the two Gaussian densities: their ratio is $4 exp \[ - \( 3 \/ \( 4 d^2 \) - 2 \) \| macron(p) \|^2 \]$, and $3 \/ \( 4 d^2 \) - 2 gt.eq 46$. The assertion at $d = 0$ has the evident interpretation. The axial tilted measure $tilde(rho) \( thin upright(d) a \) = e^(2 a^2) rho \( thin upright(d) a \)$ has mass at most $L$, and satisfies
  $ tilde(rho) { \| a \| > u } lt.eq L e^(- 6 u^2) \, #h(2em) u gt.eq 0 . quad "(3.14)" $ <ker:axial-tilt-tail>
  Consequently $e^(2 \| p \|^2) c \( thin upright(d) p \)$ is bounded by $4 L$ times a product of a centered transverse Gaussian and an axial probability. Moreover, its restriction to $\| p \| > u$ is bounded by $C L e^(- c u^2)$ times a sum of at most two such product probabilities. To see the last assertion, split into $\| macron(p) \| > u \/ sqrt(2)$ and $\| p_3 \| > u \/ sqrt(2)$, and apply (3.13) and (3.14), respectively. The axial probabilities obtained by normalization may have large support; Lemma 4 permits this.
  On the shell in (3.10), either $\| p \| > R \/ 4$ or $\| w \| > R \/ 2$, because $\| p \| + \| k \| lt.eq 2 \| p \| + \| w \|$. In the first case the preceding tilted-measure tail contributes $C L e^(- c R^2)$. In the second case $e^(- \| w \|^2) lt.eq e^(- R^2 \/ 4)$. In either case the remaining integral has $\| k \| lt.eq 2 R$ and is bounded by $C_q R^2$ using Lemma 4. This proves (3.10). The base region $\| p \| + \| k \| lt.eq 2$ is bounded by the same geometric lemma and the total tilted mass. Summing the dyadic shells proves (3.9) and also the finiteness of (3.8). ◻
]

The sheet gain bound controls the total normalized mass. We also need uniform control of the input tails and decay for large output speed, so that later path estimates can be restricted to bounded velocity regions.

#thm([Lemma 3.5.])[
  (Uniform tightness and large-output decay).  #emph[Fix $1 lt.eq L < oo$. Uniformly for $c in cal(S)_L$ and outgoing velocities off the axis, the tails in $\| p \| + \| xi - v \|$ are negligible: 
$ lim_(R arrow.r oo) sup_(c in cal(S)_L) "ess sup"_v cal(K)_c \( v \; \| p \| + \| xi - v \| > R \) = 0 . quad "(3.15)" $ <ker:uniform-tail>

 Moreover, 
$ lim_(M arrow.r oo) sup_(c in cal(S)_L) "ess sup"_(\| v \| > M) cal(K)_c \( v \; bb(R)^3 times bb(R)^3 \) = 0 . quad "(3.16)" $ <ker:large-output>

 Both conclusions hold under uniformly bounded sheet amplitudes.]
] <lem:kernel-tightness>

#proof[
  The dyadic estimate (3.10) proves (3.15). Write $k = xi - v$. We may consequently work on $\| p \| + \| k \| lt.eq R$ and remove that restriction at the end of each argument. On this region the exponential and polynomial factors in (3.11) are bounded by a constant depending on $R$.
  For (3.16), if $\| macron(v) \| > 2 R + 1$, then $\| macron(v) - macron(p) \| gt.eq \| macron(v) \| \/ 2$ and $\| macron(xi) \| gt.eq \| macron(v) \| - R$. The transverse line estimate, followed by the axial integration over a length at most $2 R$, gives $C_R \/ \| macron(v) \|$. If $\| v_3 \| > 2 R + 1$, integrate the delta in $xi_3$ instead. Its divisor is $\| v_3 - p_3 \| gt.eq \| v_3 \| \/ 2$, and
  $ sup_(a in bb(R)^2) integral_(\| zeta - a \| lt.eq R) \( 1 + \| zeta \|^(- q) \) thin thin upright(d) zeta lt.eq C_q \( R^2 + R^(2 - q) \) . quad "(3.17)" $ <ker:disk-singularity>
  For completeness, if $\| a \| lt.eq 2 R$ the disk is contained in the disk of radius $3 R$ about zero; if $\| a \| > 2 R$, then $\| zeta \| > \| a \| \/ 2 > R$ on the disk, giving the same bound. We obtain $C_R \/ \| v_3 \|$. At least one of the two outgoing components becomes large with $\| v \|$, proving (3.16). ◻
]

=== 3.4 Gaussian parameter laws and compressed axial maps <gaussian-parameter-laws-and-compressed-axial-maps>

The next formulation records the uniformity needed when a cold profile is parameterized before its axial change of variables.

#thm([Lemma 3.6.])[
  (Gaussian parameter tails).  #emph[Let a measure in parameters $w = \( macron(w) \, w_3 \) in bb(R)^2 times bb(R)$ have density $j$ satisfying 
$ 0 lt.eq j \( w \) lt.eq C_0 pi^(- 3 \/ 2) e^(- \| w \|^2) . $

 Let its velocity image be given by 
$ macron(p) = d macron(w) \, #h(2em) p_3 = Phi \( w_3 \) \, #h(2em) 0 lt.eq d lt.eq 1 / 16 \, #h(2em) \| Phi \( a \) \| lt.eq A + delta \| a \| \, quad 0 lt.eq delta lt.eq 1 / 16 \, quad "(3.18)" $ <ker:parameter-map>

 where $Phi$ is merely measurable. The image measure is dominated by $C_0$ times a sheet in $cal(S)_(L_A)$, with $L_A$ depending only on $A$. Its gain satisfies Lemma 6 with a constant depending only on $q \, m \, A \, C_0$.]
  #emph[If $c_(> B)$ is the image of the restricted parameter measure $upright(bold(1))_(\| w \| > B) j \( w \) thin thin upright(d) w$, then 
$ "ess sup"_v frac(P \( c_(> B) \, H \) \( v \), H \( v \)) lt.eq C_(q \, m \, A \, C_0) e^(- B^2 \/ 2) \, #h(2em) B gt.eq 0 . quad "(3.19)" $ <ker:parameter-tail>

 Thus parameter truncations are valid in the normalized collision measure, even when $Phi$ compresses intervals or has atoms in its image law. Probability mixtures of measurable families with common $q \, m \, A \, C_0$ and the width bounds in (3.18) preserve these assertions. More generally, a positive mixing measure of total mass $B_0 < oo$ multiplies the domination amplitude and quantitative upper bounds by $B_0$; the sheet parameter $L_A$ is unchanged. For (3.19), impose the restriction $\| w \| > B$ in each component before mixing. Additional measurable masks taking values in $\[ 0 \, 1 \]$ preserve the assertions.]
] <ker:parameter-sheets>

#proof[
  The Gaussian majorant is a product measure. Its transverse image is $cal(G)_d$, and its axial image is the probability $rho = Phi_(*) \( pi^(- 1 \/ 2) e^(- a^2) thin thin upright(d) a \)$. There is no need to differentiate or invert $Phi$. From (3.18),
  $ e^(8 \| Phi \( a \) \|^2) lt.eq e^(16 A^2) e^(16 delta^2 a^2) . $
  Even under the wider axial probability $\( 2 pi \)^(- 1 \/ 2) e^(- a^2 \/ 2) thin thin upright(d) a$, the integral of the right side is
  $ e^(16 A^2) \( 1 - 32 delta^2 \)^(- 1 \/ 2) lt.eq 2 e^(16 A^2) . $
  We may therefore take $L_A = 2 e^(16 A^2)$ for both the original and the wider parameter laws. The original image has the required sheet domination.
  On the parameter tail,
  $ upright(bold(1))_(\| w \| > B) e^(- \| w \|^2) lt.eq e^(- B^2 \/ 2) e^(- \| w \|^2 \/ 2) . $
  After normalization the right side is $2^(3 \/ 2) e^(- B^2 \/ 2)$ times a Gaussian probability with parameter widths enlarged by $sqrt(2)$. Its transverse velocity width is at most $sqrt(2) \/ 16 < 1 \/ 8$, and its axial image has the exponential moment just proved. Lemma 6 applied to this dominating image gives (3.19).
  For a probability mixture, mix the dominating sheets just constructed; this is again a member of $cal(S)_(L_A)$. If the mixing measure has mass $B_0 > 0$, normalize it by $B_0$ and retain that factor in the domination amplitude. If $B_0 = 0$, the mixed image is zero. The same argument applied to the wider Gaussian majorants of the component tails proves the asserted factor in (3.19). Thus the estimates are uniform over families of mixtures whose masses $B_0$ have a common finite bound independent of the tail cutoff. Masks taking values in $\[ 0 \, 1 \]$ only decrease the measures, whether imposed before or after the pushforward. ◻
]

Return to the profile at the start of the section: $p_3 = upsilon \( z - t p_3 \) + d w_3$, with $upsilon$ nondecreasing, and let $u$ solve $u = upsilon \( z - t u \)$. The function $p mapsto p - upsilon \( z - t p \)$ is increasing with inverse Lipschitz constant at most one. Hence

$ \| p_3 - u \| lt.eq d \| w_3 \| . quad "(3.20)" $ <ker:compressed-displacement>

If $\| u \| lt.eq A$, Lemma 8 applies. A large Jacobian compression of the axial law does not affect its constants. Gaussian majorants with any fixed positive exponent in place of one are covered by a fixed rescaling of the parameters and a corresponding decrease of the upper bounds on the physical widths.

=== 3.5 The hot–hot gain <the-hothot-gain>

#thm([Lemma 3.7.])[
  (Quadratic gain bound).  #emph[There is a constant $C_(q \, m)$ such that 
$ P \( H \, H \) lt.eq C_(q \, m) H quad upright("almost everywhere") . quad "(3.21)" $ <ker:hot-gain>

 In fact the proof below works for every $m > 5$.]
] <lem:hot-bound>

#proof[
  The integrand is symmetric in $p \, xi$. On the collision plane, $\| v \|^2 lt.eq \| p \|^2 + \| xi \|^2$, so at least one incoming speed is at least $\| v \| \/ 2$. It suffices, at a factor of two, to retain $\| xi \| gt.eq \| v \| \/ 2$. Formula (3.11) now gives
  $ frac(P \( H \, H \) \( v \), H \( v \)) & lt.eq C_m integral_(\| xi \| gt.eq \| v \| \/ 2) delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] e^(- \| p + xi - v \|^2) chevron.l p chevron.r^(- m) frac(W \( p \) W \( xi \), W \( v \)) thin thin upright(d) p thin thin upright(d) xi \, quad "(3.22)" $ <ker:hot-reduced>
  because $chevron.l v chevron.r^m \/ chevron.l xi chevron.r^m lt.eq 2^m$.
  Again write $k = xi - v$ and $w = p + k$. On $R < \| p \| + \| k \| lt.eq 2 R$, $R gt.eq 1$, either $\| p \| > R \/ 4$ or $\| w \| > R \/ 2$. Consequently
  $ chevron.l p chevron.r^(- m) e^(- \| w \|^2) lt.eq C_m R^(- m) e^(- \| w \|^2 \/ 2) . quad "(3.23)" $ <ker:hot-shell-weight>
  In the second alternative this uses the finite supremum of $s^m e^(- s^2 \/ 2)$; in the first it follows directly from the polynomial factor.
  The measure $W \( p \) upright(bold(1))_(\| p \| lt.eq 2 R) thin thin upright(d) p$ is dominated by
  $ #scale(x: 120%, y: 120%)[\(] 1 + \| macron(p) \|^(- q) #scale(x: 120%, y: 120%)[\)] upright(bold(1))_(\| macron(p) \| lt.eq 2 R) thin thin upright(d) macron(p) med ⊗ med upright(bold(1))_(\| p_3 \| lt.eq 2 R) thin thin upright(d) p_3 . $
  Its transverse factor is a positive mixture of centered disks. Indeed, for $D > 0$,
  $ \| macron(p) \|^(- q) upright(bold(1))_(\| macron(p) \| lt.eq D) = D^(- q) upright(bold(1))_(\| macron(p) \| lt.eq D) + q integral_0^D a^(- q - 1) upright(bold(1))_(\| macron(p) \| lt.eq a) thin thin upright(d) a $
  almost everywhere. Upon normalizing the disks, the mixture has total mass $pi D^2 + 2 pi D^(2 - q) \/ \( 2 - q \)$. The axial factor has mass $4 R$. For $D = 2 R$ the resulting product mixture therefore has total mass at most $C_q R^3$.
  Discard $e^(- \| w \|^2 \/ 2)$ and the incoming-speed restriction in (3.22). Apply Lemma 4 to each normalized product in this mixture, with $\| k \| lt.eq 2 R$. In conjunction with (3.23), this yields the shell estimate
  $ frac(P \( H \, H \) \( v \), H \( v \)) \|_(R < \| p \| + \| xi - v \| lt.eq 2 R) lt.eq C_(q \, m) R^(5 - m) . quad "(3.24)" $ <ker:hot-shell>
  The notation on the left denotes the restricted nonnegative integral from (3.22), including its fixed symmetry factor. The base region is bounded by the same disk-mixture argument with $R = 1$. Summation over dyadic $R$ proves the result for $m > 5$. ◻
]

=== 3.6 A small-mass gain estimate <a-small-mass-gain-estimate>

The quadratic estimate controls a gain by a weighted supremum. For global continuation we need a stronger conclusion when one input has small mass while staying below a fixed multiple of $H$. The relevant compactness is in the velocity integrals themselves: large speeds, small transverse speeds, and the remaining collision diagonal can all be removed with uniformly small normalized cost.

#thm([Lemma 3.8.])[
  (Gain estimate from small mass).  #emph[For each $0 lt.eq B < oo$ and $epsilon > 0$ there is a finite constant $C_(B \, epsilon)$ such that every measurable density $j$ with $0 lt.eq j lt.eq B H$ satisfies 
$ P \( H \, j \) \( v \) lt.eq H \( v \) (epsilon + C_(B \, epsilon) integral_(bb(R)^3) j \( p \) thin thin upright(d) p) #h(2em) upright("for almost every ") v . quad "(3.25)" $ <ker:gain-small-mass>

 The same constant works with $P^b$ in place of $P$.]
] <lem:gain-small-mass>

#proof[
  The case $B = 0$ is immediate. Assume $B > 0$. We first establish
  $ lim_(M arrow.r oo) "ess sup"_(\| v \| > M) frac(P \( H \, H \) \( v \), H \( v \)) = 0 . quad "(3.26)" $ <ker:hot-large-output>
  As in the proof of Lemma 9, symmetry reduces the integral to $\| xi \| gt.eq \| v \| \/ 2$, up to a factor of two. The shell estimate (3.24) then removes $\| p \| + \| xi - v \| > R$ with an error tending to zero uniformly in $v$ as $R arrow.r oo$. On the retained region, the right side of (3.22) is bounded by a constant times
  $ integral_(\| p \| lt.eq R) W \( p \) [integral_(\| xi - v \| lt.eq R) delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] frac(W \( xi \), W \( v \)) thin thin upright(d) xi] thin upright(d) p . $
  If $\| macron(v) \| > 2 R + 1$, the transverse divisor is at least $\| macron(v) \| \/ 2$, and $W \( xi \)$ is bounded on the retained region. The transverse line integral and the axial interval of length $2 R$ give an upper bound $C_R \/ \| macron(v) \|$ after integration in $p$. If $\| v_3 \| > 2 R + 1$, integrating the delta in $xi_3$ instead and using (3.17) gives $C_R \/ \| v_3 \|$. Here $integral_(\| p \| lt.eq R) W \( p \) thin thin upright(d) p < oo$, since $q < 2$. At least one output component tends to infinity with $\| v \|$. First letting $\| v \| arrow.r oo$ and then $R arrow.r oo$ proves (3.26).
  Choose $M$ so large that $B P \( H \, H \) lt.eq epsilon H$ on $\| v \| > M$. It remains to prove the desired estimate for $\| v \| lt.eq M$. On this output ball, the part of the normalized quadratic gain with $\| p \| + \| xi \| > L$ tends uniformly to zero as $L arrow.r oo$. Indeed, this deletion is symmetric in the two inputs. After the same reduction to $\| xi \| gt.eq \| v \| \/ 2$, it implies
  $ \| p \| + \| xi - v \| > L - M \, $
  so (3.24) bounds its cost by a summable tail. The condition $j lt.eq B H$ transfers this estimate to $P \( H \, j \)$.
  Next retain both inputs in $\| p \| \, \| xi \| lt.eq L$. The Gaussian and polynomial factors in the normalized quadratic integrand are then bounded by a constant depending on $M \, L$, leaving
  $ delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] frac(W \( p \) W \( xi \), W \( v \)) . $
  For $0 < delta < 1$, the restriction $\| macron(p) \| < delta$ is dominated in its $p$ variable by the product measure
  $ \( 1 + \| macron(p) \|^(- q) \) upright(bold(1))_(\| macron(p) \| < delta) thin thin upright(d) macron(p) ⊗ upright(bold(1))_(\| p_3 \| lt.eq L) thin thin upright(d) p_3 . $
  Its transverse factor is a positive mixture of centered disks, by the layer-cake formula used in Lemma 9, and its total mass is
  $ 2 L (pi delta^2 + frac(2 pi, 2 - q) delta^(2 - q)) . $
  After normalization, (3.3), with radius at least $L + M$, therefore bounds the cost of this restriction by $C_(M \, L) \( delta^2 + delta^(2 - q) \)$. Symmetry gives the same bound for $\| macron(xi) \| < delta$. These estimates are uniform even when the output velocity approaches its axis. Again $j lt.eq B H$ transfers them to the mixed gain.
  We have proved that, for a suitable compact set
  $ K = { p : \| p \| lt.eq L \, med \| macron(p) \| gt.eq delta } \, $
  the truncations $H_K = H upright(bold(1))_K$ and $j_K = j upright(bold(1))_K$ satisfy
  $ 0 lt.eq P \( H \, j \) - P \( H_K \, j_K \) lt.eq 1 / 2 epsilon H #h(2em) \( \| v \| lt.eq M \) \, $
  uniformly over $0 lt.eq j lt.eq B H$. The function $H_K$ is bounded and supported in the ball of radius $L$. By symmetry of $P$, put $j_K$ outside the plane integral in (3.1). The area of a plane section of that ball is at most $pi L^2$, so
  $ P \( H_K \, j_K \) \( v \) lt.eq C_(L \, delta) integral_K frac(j_K \( p \), \| v - p \|) thin thin upright(d) p . $
  For $0 < rho < 1$, the part with $\| v - p \| < rho$ is at most $C_(B \, L \, delta) rho^2$, because $j_K$ is bounded. The complement is at most $C_(L \, delta) rho^(- 1) integral j$. Finally, $H$ has a positive lower bound on $\| v \| lt.eq M$ off its null axis. Choose $rho$ small enough that the near part is at most $epsilon H \/ 2$ there. Absorbing the other fixed factors into $C_(B \, epsilon)$ proves (3.25). The cutoff assertion follows from $P^b lt.eq P$ on nonnegative inputs. ◻
]

== 4 The datum and the finite colored evolutions <sec:construction>

The datum combines narrow jets with a bounded background close to a Maxwellian. The background supplies collisions at later times, whereas an initial spatial hole keeps it apart from the jets during the short interval on which we select the two families of solutions. We first construct these densities and their finite approximations. The estimates in this section and the next two sections hold for every fixed choice

$ K gt.eq 1 \, #h(2em) 0 < eta lt.eq log 2 \, #h(2em) 0 < alpha lt.eq 1 / 4 \, #h(2em) 0 < gamma lt.eq 1 . quad "(4.1)" $ <con:parameters>

The growth argument will fix these four parameters. All remaining small parameters are chosen after them. The annular jets and the colored evolution adapt the construction of #cite(label("OpenAIPeriodic")) Sections 4–5; the spatial orientation, the background, and the later transfer of colors will allow uniform bounds for arbitrarily large physical times.

=== 4.1 An irrational axis and annular jets <an-irrational-axis-and-annular-jets>

Use the orthonormal frame

$ frac(\( - sqrt(2) \, 1 \, 0 \), sqrt(3)) \, #h(2em) \( 0 \, 0 \, 1 \) \, #h(2em) frac(\( 1 \, sqrt(2) \, 0 \), sqrt(3)) . $

In these coordinates write $x = \( y \, z \)$, $v = \( macron(v) \, v_3 \)$, and let $Lambda$ be the image of $bb(Z)^3$ under the change of coordinates. The spatial torus is now $bb(R)^3 \/ Lambda$, with covolume one. Rotation preserves transport and the hard-sphere collision operator, so this change does not alter the equation.

#thm([Lemma 4.1.])[
  (Separation from the axis).  #emph[There is a numerical constant $c > 0$ such that 
$ \| macron(n) \| gt.eq frac(c, 1 + \| n \|) #h(2em) \( n in Lambda \\ { 0 } \) . quad "(4.2)" $ <con:diophantine>

]
] <con:lattice>

#proof[
  An original integer vector $\( k \, m \, ell \)$ has transverse coordinates $\( \( m - sqrt(2) k \) \/ sqrt(3) \, ell \)$. If $ell eq.not 0$, its transverse length is at least one. Otherwise $\( k \, m \) eq.not \( 0 \, 0 \)$, and
  $ \| m - sqrt(2) k \| = frac(\| m^2 - 2 k^2 \|, \| m + sqrt(2) k \|) gt.eq frac(1, C \( 1 + \| k \| + \| m \| \)) . $
  The numerator is a nonzero integer. Since rotation preserves length, this proves the claim. ◻
]

Fix a nonnegative $J in C_c^oo \( bb(R)^3 \)$, supported in the unit ball and of integral one. With $0 < s_0 lt.eq 1 \/ 8$, define

$ s_j = s_0 e^(- j eta) \, quad p_j = s_j^2 \, quad c_eta = frac(e^eta - 1, 16) \, quad d_s = d_0 s^10 \, quad S \( r \) = "sech"^2 r \, #h(2em) j gt.eq 1 \, quad "(4.3)" $ <con:scales>

where $0 < d_0 lt.eq 1$ is fixed sufficiently small. It is enough to make all Gaussian widths below, including their fixed widenings, fit within the sheet estimates of Section 3. Further conditions involving positive powers of $s_0$ will be obtained by reducing $s_0$. Set

$ a_s^sigma \( z \) = sigma + alpha tanh \( gamma z \/ s \) \, #h(2em) a = 1 / 8 \, #h(2em) b_(upright("sp")) = 1 / 16 \, #h(2em) sigma in { - 1 \, + 1 } . $

For each scale let $E_j^sigma subset bb(R)^2$ be the annulus

$ s_j + c_eta p_j < \| y \| < e^eta s_j - c_eta p_j $

intersected with the stripes

$ y_1 \/ p_j med \( mod med 1 \) in cases(delim: "{", \( 0 \, 1 \/ 4 \) \, & sigma = + 1 \,, \( 1 \/ 2 \, 3 \/ 4 \) \, & sigma = - 1 .) $

Both sets are nonempty for small $s_0$: the radial interval is nonempty, and a circle at an interior radius crosses both stripe patterns because their period is $s_j^2$. Each pattern has spatial fraction $1 \/ 4$; no exact fraction is asserted after intersection with an annulus.

A jet label is $i = \( j \, sigma \, n \)$, with $n = \( macron(n) \, n_3 \) in Lambda$. For $s = s_j$ and $\( y_c \, z_c \) = x - n$, define

$ c_i^0 \( x \, v \) = upright(bold(1))_(E_j^sigma) \( y_c \) upright(bold(1))_(\( - a \, a \)) \( z_c \) K / s S \( gamma z_c \/ s \) d_s^(- 3) J #h(-1em) (frac(v - a_s^sigma \( z_c \) e_3, d_s)) . quad "(4.4)" $ <con:jet-datum>

All sums over labels include the lattice copies. Translating $x$ by an element of $Lambda$ permutes these labels.

=== 4.2 The background and the initial entropy <the-background-and-the-initial-entropy>

For any positive Maxwellian $rho$, write

$ cal(H)_rho \( F \) = integral #scale(x: 120%, y: 120%)[\(] F log \( F \/ rho \) - F + rho #scale(x: 120%, y: 120%)[\)] thin upright(d) x thin upright(d) v . $

This agrees with the entropy already defined when $rho = M$. Fix a sufficiently large numerical $beta_0$, and write $mu \( v \) = e^(- beta_0 \| v \|^2)$. Let $0 < delta < 1 \/ 32$, and let $D_(upright("hole"))$ be the open $2 delta$-neighborhood in the spatial torus of the axial segment of half-length $1 \/ 3$ centered at zero. For a velocity cutoff $R_mu < oo$, put

$ u^0 \( x \, v \) = upright(bold(1))_(D_(upright("hole"))^c) \( x \) mu \( v \) upright(bold(1))_({ \| v \| lt.eq R_mu }) \, #h(2em) F_0 = u^0 + sum_i c_i^0 . quad "(4.5)" $ <con:datum-equation>

The hole has volume tending to zero as $delta arrow.b 0$, by the usual volume bound for a cylinder and its two endpoint neighborhoods. For $s_0$ sufficiently small compared with $delta$, every jet lies in this hole. The different jet supports are disjoint: annuli and opposite stripe patterns are disjoint within a single copy, and the unshifted supports lie in a ball of radius less than $1 \/ 2$, so distinct lattice copies cannot overlap.

Figure 1 summarizes the initial geometry.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (13.7, 9.45))
  content((0.15, 9.15), [\(a\) Transverse annuli and stripes], anchor: "west")
  rect((-5.18, 5.05), (-5.09, 8.25), fill: rgb("#00008c"))
  rect((-5, 5.05), (-4.91, 8.25), fill: rgb("#bf7c00"))
  rect((-4.82, 5.05), (-4.73, 8.25), fill: rgb("#00008c"))
  rect((-4.64, 5.05), (-4.55, 8.25), fill: rgb("#bf7c00"))
  rect((-4.46, 5.05), (-4.37, 8.25), fill: rgb("#00008c"))
  rect((-4.28, 5.05), (-4.19, 8.25), fill: rgb("#bf7c00"))
  rect((-4.1, 5.05), (-4.01, 8.25), fill: rgb("#00008c"))
  rect((-3.92, 5.05), (-3.83, 8.25), fill: rgb("#bf7c00"))
  rect((-3.74, 5.05), (-3.65, 8.25), fill: rgb("#00008c"))
  rect((-3.56, 5.05), (-3.47, 8.25), fill: rgb("#bf7c00"))
  rect((-3.38, 5.05), (-3.29, 8.25), fill: rgb("#00008c"))
  rect((-3.2, 5.05), (-3.11, 8.25), fill: rgb("#bf7c00"))
  rect((-3.02, 5.05), (-2.93, 8.25), fill: rgb("#00008c"))
  rect((-2.84, 5.05), (-2.75, 8.25), fill: rgb("#bf7c00"))
  rect((-2.66, 5.05), (-2.57, 8.25), fill: rgb("#00008c"))
  rect((-2.48, 5.05), (-2.39, 8.25), fill: rgb("#bf7c00"))
  rect((-2.3, 5.05), (-2.21, 8.25), fill: rgb("#00008c"))
  rect((-2.12, 5.05), (-2.03, 8.25), fill: rgb("#bf7c00"))
  rect((-1.94, 5.05), (-1.85, 8.25), fill: rgb("#00008c"))
  rect((-1.76, 5.05), (-1.67, 8.25), fill: rgb("#bf7c00"))
  rect((-1.58, 5.05), (-1.49, 8.25), fill: rgb("#00008c"))
  rect((-1.4, 5.05), (-1.31, 8.25), fill: rgb("#bf7c00"))
  rect((-1.22, 5.05), (-1.13, 8.25), fill: rgb("#00008c"))
  rect((-1.04, 5.05), (-0.95, 8.25), fill: rgb("#bf7c00"))
  rect((-0.86, 5.05), (-0.77, 8.25), fill: rgb("#00008c"))
  rect((-0.68, 5.05), (-0.59, 8.25), fill: rgb("#bf7c00"))
  rect((-0.5, 5.05), (-0.41, 8.25), fill: rgb("#00008c"))
  rect((-0.32, 5.05), (-0.23, 8.25), fill: rgb("#bf7c00"))
  rect((-0.14, 5.05), (-0.05, 8.25), fill: rgb("#00008c"))
  rect((0.04, 5.05), (0.13, 8.25), fill: rgb("#bf7c00"))
  rect((0.22, 5.05), (0.31, 8.25), fill: rgb("#00008c"))
  rect((0.4, 5.05), (0.49, 8.25), fill: rgb("#bf7c00"))
  rect((0.58, 5.05), (0.67, 8.25), fill: rgb("#00008c"))
  rect((0.76, 5.05), (0.85, 8.25), fill: rgb("#bf7c00"))
  rect((0.94, 5.05), (1.03, 8.25), fill: rgb("#00008c"))
  rect((1.12, 5.05), (1.21, 8.25), fill: rgb("#bf7c00"))
  rect((1.3, 5.05), (1.39, 8.25), fill: rgb("#00008c"))
  rect((1.48, 5.05), (1.57, 8.25), fill: rgb("#bf7c00"))
  rect((1.66, 5.05), (1.75, 8.25), fill: rgb("#00008c"))
  rect((1.84, 5.05), (1.93, 8.25), fill: rgb("#bf7c00"))
  rect((2.02, 5.05), (2.11, 8.25), fill: rgb("#00008c"))
  rect((2.2, 5.05), (2.29, 8.25), fill: rgb("#bf7c00"))
  rect((2.38, 5.05), (2.47, 8.25), fill: rgb("#00008c"))
  rect((2.56, 5.05), (2.65, 8.25), fill: rgb("#bf7c00"))
  rect((2.74, 5.05), (2.83, 8.25), fill: rgb("#00008c"))
  rect((2.92, 5.05), (3.01, 8.25), fill: rgb("#bf7c00"))
  rect((3.1, 5.05), (3.19, 8.25), fill: rgb("#00008c"))
  rect((3.28, 5.05), (3.37, 8.25), fill: rgb("#bf7c00"))
  rect((3.46, 5.05), (3.55, 8.25), fill: rgb("#00008c"))
  rect((3.64, 5.05), (3.73, 8.25), fill: rgb("#bf7c00"))
  rect((3.82, 5.05), (3.91, 8.25), fill: rgb("#00008c"))
  rect((4, 5.05), (4.09, 8.25), fill: rgb("#bf7c00"))
  rect((4.18, 5.05), (4.27, 8.25), fill: rgb("#00008c"))
  rect((4.36, 5.05), (4.45, 8.25), fill: rgb("#bf7c00"))
  rect((4.54, 5.05), (4.63, 8.25), fill: rgb("#00008c"))
  rect((4.72, 5.05), (4.81, 8.25), fill: rgb("#bf7c00"))
  rect((4.9, 5.05), (4.99, 8.25), fill: rgb("#00008c"))
  rect((5.08, 5.05), (5.17, 8.25), fill: rgb("#bf7c00"))
  rect((5.26, 5.05), (5.35, 8.25), fill: rgb("#00008c"))
  rect((5.44, 5.05), (5.53, 8.25), fill: rgb("#bf7c00"))
  rect((5.62, 5.05), (5.71, 8.25), fill: rgb("#00008c"))
  rect((5.8, 5.05), (5.89, 8.25), fill: rgb("#bf7c00"))
  rect((5.98, 5.05), (6.07, 8.25), fill: rgb("#00008c"))
  rect((6.16, 5.05), (6.25, 8.25), fill: rgb("#bf7c00"))
  rect((6.34, 5.05), (6.43, 8.25), fill: rgb("#00008c"))
  rect((6.52, 5.05), (6.61, 8.25), fill: rgb("#bf7c00"))
  rect((6.7, 5.05), (6.79, 8.25), fill: rgb("#00008c"))
  rect((6.88, 5.05), (6.97, 8.25), fill: rgb("#bf7c00"))
  rect((7.06, 5.05), (7.15, 8.25), fill: rgb("#00008c"))
  rect((7.24, 5.05), (7.33, 8.25), fill: rgb("#bf7c00"))
  rect((7.42, 5.05), (7.51, 8.25), fill: rgb("#00008c"))
  rect((7.6, 5.05), (7.69, 8.25), fill: rgb("#bf7c00"))
  rect((7.78, 5.05), (7.87, 8.25), fill: rgb("#00008c"))
  rect((7.96, 5.05), (8.05, 8.25), fill: rgb("#bf7c00"))
  rect((8.14, 5.05), (8.23, 8.25), fill: rgb("#00008c"))
  rect((8.32, 5.05), (8.41, 8.25), fill: rgb("#bf7c00"))
  rect((8.5, 5.05), (8.59, 8.25), fill: rgb("#00008c"))
  rect((8.68, 5.05), (8.77, 8.25), fill: rgb("#bf7c00"))
  rect((8.86, 5.05), (8.95, 8.25), fill: rgb("#00008c"))
  rect((9.04, 5.05), (9.13, 8.25), fill: rgb("#bf7c00"))
  rect((9.22, 5.05), (9.31, 8.25), fill: rgb("#00008c"))
  rect((9.4, 5.05), (9.49, 8.25), fill: rgb("#bf7c00"))
  rect((9.58, 5.05), (9.67, 8.25), fill: rgb("#00008c"))
  rect((9.76, 5.05), (9.85, 8.25), fill: rgb("#bf7c00"))
  rect((9.94, 5.05), (10.03, 8.25), fill: rgb("#00008c"))
  rect((10.12, 5.05), (10.21, 8.25), fill: rgb("#bf7c00"))
  rect((10.3, 5.05), (10.39, 8.25), fill: rgb("#00008c"))
  rect((10.48, 5.05), (10.57, 8.25), fill: rgb("#bf7c00"))
  rect((10.66, 5.05), (10.75, 8.25), fill: rgb("#00008c"))
  rect((10.84, 5.05), (10.93, 8.25), fill: rgb("#bf7c00"))
  rect((11.02, 5.05), (11.11, 8.25), fill: rgb("#00008c"))
  rect((11.2, 5.05), (11.29, 8.25), fill: rgb("#bf7c00"))
  rect((11.38, 5.05), (11.47, 8.25), fill: rgb("#00008c"))
  rect((11.56, 5.05), (11.65, 8.25), fill: rgb("#bf7c00"))
  rect((-0.58, 5.05), (-0.54, 8.25), fill: rgb("#00008c"))
  rect((-0.5, 5.05), (-0.46, 8.25), fill: rgb("#bf7c00"))
  rect((-0.42, 5.05), (-0.38, 8.25), fill: rgb("#00008c"))
  rect((-0.34, 5.05), (-0.3, 8.25), fill: rgb("#bf7c00"))
  rect((-0.26, 5.05), (-0.22, 8.25), fill: rgb("#00008c"))
  rect((-0.18, 5.05), (-0.14, 8.25), fill: rgb("#bf7c00"))
  rect((-0.1, 5.05), (-0.06, 8.25), fill: rgb("#00008c"))
  rect((-0.02, 5.05), (0.02, 8.25), fill: rgb("#bf7c00"))
  rect((0.06, 5.05), (0.1, 8.25), fill: rgb("#00008c"))
  rect((0.14, 5.05), (0.18, 8.25), fill: rgb("#bf7c00"))
  rect((0.22, 5.05), (0.26, 8.25), fill: rgb("#00008c"))
  rect((0.3, 5.05), (0.34, 8.25), fill: rgb("#bf7c00"))
  rect((0.38, 5.05), (0.42, 8.25), fill: rgb("#00008c"))
  rect((0.46, 5.05), (0.5, 8.25), fill: rgb("#bf7c00"))
  rect((0.54, 5.05), (0.58, 8.25), fill: rgb("#00008c"))
  rect((0.62, 5.05), (0.66, 8.25), fill: rgb("#bf7c00"))
  rect((0.7, 5.05), (0.74, 8.25), fill: rgb("#00008c"))
  rect((0.78, 5.05), (0.82, 8.25), fill: rgb("#bf7c00"))
  rect((0.86, 5.05), (0.9, 8.25), fill: rgb("#00008c"))
  rect((0.94, 5.05), (0.98, 8.25), fill: rgb("#bf7c00"))
  rect((1.02, 5.05), (1.06, 8.25), fill: rgb("#00008c"))
  rect((1.1, 5.05), (1.14, 8.25), fill: rgb("#bf7c00"))
  rect((1.18, 5.05), (1.22, 8.25), fill: rgb("#00008c"))
  rect((1.26, 5.05), (1.3, 8.25), fill: rgb("#bf7c00"))
  rect((1.34, 5.05), (1.38, 8.25), fill: rgb("#00008c"))
  rect((1.42, 5.05), (1.46, 8.25), fill: rgb("#bf7c00"))
  rect((1.5, 5.05), (1.54, 8.25), fill: rgb("#00008c"))
  rect((1.58, 5.05), (1.62, 8.25), fill: rgb("#bf7c00"))
  rect((1.66, 5.05), (1.7, 8.25), fill: rgb("#00008c"))
  rect((1.74, 5.05), (1.78, 8.25), fill: rgb("#bf7c00"))
  rect((1.82, 5.05), (1.86, 8.25), fill: rgb("#00008c"))
  rect((1.9, 5.05), (1.94, 8.25), fill: rgb("#bf7c00"))
  rect((1.98, 5.05), (2.02, 8.25), fill: rgb("#00008c"))
  rect((2.06, 5.05), (2.1, 8.25), fill: rgb("#bf7c00"))
  rect((2.14, 5.05), (2.18, 8.25), fill: rgb("#00008c"))
  rect((2.22, 5.05), (2.26, 8.25), fill: rgb("#bf7c00"))
  rect((2.3, 5.05), (2.34, 8.25), fill: rgb("#00008c"))
  rect((2.38, 5.05), (2.42, 8.25), fill: rgb("#bf7c00"))
  rect((2.46, 5.05), (2.5, 8.25), fill: rgb("#00008c"))
  rect((2.54, 5.05), (2.58, 8.25), fill: rgb("#bf7c00"))
  rect((2.62, 5.05), (2.66, 8.25), fill: rgb("#00008c"))
  rect((2.7, 5.05), (2.74, 8.25), fill: rgb("#bf7c00"))
  rect((2.78, 5.05), (2.82, 8.25), fill: rgb("#00008c"))
  rect((2.86, 5.05), (2.9, 8.25), fill: rgb("#bf7c00"))
  rect((2.94, 5.05), (2.98, 8.25), fill: rgb("#00008c"))
  rect((3.02, 5.05), (3.06, 8.25), fill: rgb("#bf7c00"))
  rect((3.1, 5.05), (3.14, 8.25), fill: rgb("#00008c"))
  rect((3.18, 5.05), (3.22, 8.25), fill: rgb("#bf7c00"))
  rect((3.26, 5.05), (3.3, 8.25), fill: rgb("#00008c"))
  rect((3.34, 5.05), (3.38, 8.25), fill: rgb("#bf7c00"))
  rect((3.42, 5.05), (3.46, 8.25), fill: rgb("#00008c"))
  rect((3.5, 5.05), (3.54, 8.25), fill: rgb("#bf7c00"))
  rect((3.58, 5.05), (3.62, 8.25), fill: rgb("#00008c"))
  rect((3.66, 5.05), (3.7, 8.25), fill: rgb("#bf7c00"))
  rect((3.74, 5.05), (3.78, 8.25), fill: rgb("#00008c"))
  rect((3.82, 5.05), (3.86, 8.25), fill: rgb("#bf7c00"))
  rect((3.9, 5.05), (3.94, 8.25), fill: rgb("#00008c"))
  rect((3.98, 5.05), (4.02, 8.25), fill: rgb("#bf7c00"))
  rect((4.06, 5.05), (4.1, 8.25), fill: rgb("#00008c"))
  rect((4.14, 5.05), (4.18, 8.25), fill: rgb("#bf7c00"))
  rect((4.22, 5.05), (4.26, 8.25), fill: rgb("#00008c"))
  rect((4.3, 5.05), (4.34, 8.25), fill: rgb("#bf7c00"))
  rect((4.38, 5.05), (4.42, 8.25), fill: rgb("#00008c"))
  rect((4.46, 5.05), (4.5, 8.25), fill: rgb("#bf7c00"))
  rect((4.54, 5.05), (4.58, 8.25), fill: rgb("#00008c"))
  rect((4.62, 5.05), (4.66, 8.25), fill: rgb("#bf7c00"))
  rect((4.7, 5.05), (4.74, 8.25), fill: rgb("#00008c"))
  rect((4.78, 5.05), (4.82, 8.25), fill: rgb("#bf7c00"))
  rect((4.86, 5.05), (4.9, 8.25), fill: rgb("#00008c"))
  rect((4.94, 5.05), (4.98, 8.25), fill: rgb("#bf7c00"))
  rect((5.02, 5.05), (5.06, 8.25), fill: rgb("#00008c"))
  rect((5.1, 5.05), (5.14, 8.25), fill: rgb("#bf7c00"))
  rect((5.18, 5.05), (5.22, 8.25), fill: rgb("#00008c"))
  rect((5.26, 5.05), (5.3, 8.25), fill: rgb("#bf7c00"))
  rect((5.34, 5.05), (5.38, 8.25), fill: rgb("#00008c"))
  rect((5.42, 5.05), (5.46, 8.25), fill: rgb("#bf7c00"))
  rect((5.5, 5.05), (5.54, 8.25), fill: rgb("#00008c"))
  rect((5.58, 5.05), (5.62, 8.25), fill: rgb("#bf7c00"))
  rect((5.66, 5.05), (5.7, 8.25), fill: rgb("#00008c"))
  rect((5.74, 5.05), (5.78, 8.25), fill: rgb("#bf7c00"))
  rect((5.82, 5.05), (5.86, 8.25), fill: rgb("#00008c"))
  rect((5.9, 5.05), (5.94, 8.25), fill: rgb("#bf7c00"))
  rect((5.98, 5.05), (6.02, 8.25), fill: rgb("#00008c"))
  rect((6.06, 5.05), (6.1, 8.25), fill: rgb("#bf7c00"))
  rect((6.14, 5.05), (6.18, 8.25), fill: rgb("#00008c"))
  rect((6.22, 5.05), (6.26, 8.25), fill: rgb("#bf7c00"))
  rect((6.3, 5.05), (6.34, 8.25), fill: rgb("#00008c"))
  rect((6.38, 5.05), (6.42, 8.25), fill: rgb("#bf7c00"))
  rect((6.46, 5.05), (6.5, 8.25), fill: rgb("#00008c"))
  rect((6.54, 5.05), (6.58, 8.25), fill: rgb("#bf7c00"))
  rect((6.62, 5.05), (6.66, 8.25), fill: rgb("#00008c"))
  rect((6.7, 5.05), (6.74, 8.25), fill: rgb("#bf7c00"))
  rect((6.78, 5.05), (6.82, 8.25), fill: rgb("#00008c"))
  rect((6.86, 5.05), (6.9, 8.25), fill: rgb("#bf7c00"))
  rect((1.465, 5.05), (1.482, 8.25), fill: rgb("#00008c"))
  rect((1.5, 5.05), (1.518, 8.25), fill: rgb("#bf7c00"))
  rect((1.536, 5.05), (1.554, 8.25), fill: rgb("#00008c"))
  rect((1.571, 5.05), (1.589, 8.25), fill: rgb("#bf7c00"))
  rect((1.607, 5.05), (1.625, 8.25), fill: rgb("#00008c"))
  rect((1.642, 5.05), (1.66, 8.25), fill: rgb("#bf7c00"))
  rect((1.678, 5.05), (1.696, 8.25), fill: rgb("#00008c"))
  rect((1.714, 5.05), (1.731, 8.25), fill: rgb("#bf7c00"))
  rect((1.749, 5.05), (1.767, 8.25), fill: rgb("#00008c"))
  rect((1.785, 5.05), (1.802, 8.25), fill: rgb("#bf7c00"))
  rect((1.82, 5.05), (1.838, 8.25), fill: rgb("#00008c"))
  rect((1.856, 5.05), (1.874, 8.25), fill: rgb("#bf7c00"))
  rect((1.891, 5.05), (1.909, 8.25), fill: rgb("#00008c"))
  rect((1.927, 5.05), (1.945, 8.25), fill: rgb("#bf7c00"))
  rect((1.962, 5.05), (1.98, 8.25), fill: rgb("#00008c"))
  rect((1.998, 5.05), (2.016, 8.25), fill: rgb("#bf7c00"))
  rect((2.034, 5.05), (2.051, 8.25), fill: rgb("#00008c"))
  rect((2.069, 5.05), (2.087, 8.25), fill: rgb("#bf7c00"))
  rect((2.105, 5.05), (2.122, 8.25), fill: rgb("#00008c"))
  rect((2.14, 5.05), (2.158, 8.25), fill: rgb("#bf7c00"))
  rect((2.176, 5.05), (2.193, 8.25), fill: rgb("#00008c"))
  rect((2.211, 5.05), (2.229, 8.25), fill: rgb("#bf7c00"))
  rect((2.247, 5.05), (2.265, 8.25), fill: rgb("#00008c"))
  rect((2.282, 5.05), (2.3, 8.25), fill: rgb("#bf7c00"))
  rect((2.318, 5.05), (2.336, 8.25), fill: rgb("#00008c"))
  rect((2.353, 5.05), (2.371, 8.25), fill: rgb("#bf7c00"))
  rect((2.389, 5.05), (2.407, 8.25), fill: rgb("#00008c"))
  rect((2.425, 5.05), (2.442, 8.25), fill: rgb("#bf7c00"))
  rect((2.46, 5.05), (2.478, 8.25), fill: rgb("#00008c"))
  rect((2.496, 5.05), (2.513, 8.25), fill: rgb("#bf7c00"))
  rect((2.531, 5.05), (2.549, 8.25), fill: rgb("#00008c"))
  rect((2.567, 5.05), (2.585, 8.25), fill: rgb("#bf7c00"))
  rect((2.602, 5.05), (2.62, 8.25), fill: rgb("#00008c"))
  rect((2.638, 5.05), (2.656, 8.25), fill: rgb("#bf7c00"))
  rect((2.673, 5.05), (2.691, 8.25), fill: rgb("#00008c"))
  rect((2.709, 5.05), (2.727, 8.25), fill: rgb("#bf7c00"))
  rect((2.744, 5.05), (2.762, 8.25), fill: rgb("#00008c"))
  rect((2.78, 5.05), (2.798, 8.25), fill: rgb("#bf7c00"))
  rect((2.816, 5.05), (2.833, 8.25), fill: rgb("#00008c"))
  rect((2.851, 5.05), (2.869, 8.25), fill: rgb("#bf7c00"))
  rect((2.887, 5.05), (2.904, 8.25), fill: rgb("#00008c"))
  rect((2.922, 5.05), (2.94, 8.25), fill: rgb("#bf7c00"))
  rect((2.958, 5.05), (2.976, 8.25), fill: rgb("#00008c"))
  rect((2.993, 5.05), (3.011, 8.25), fill: rgb("#bf7c00"))
  rect((3.029, 5.05), (3.047, 8.25), fill: rgb("#00008c"))
  rect((3.064, 5.05), (3.082, 8.25), fill: rgb("#bf7c00"))
  rect((3.1, 5.05), (3.118, 8.25), fill: rgb("#00008c"))
  rect((3.136, 5.05), (3.153, 8.25), fill: rgb("#bf7c00"))
  rect((3.171, 5.05), (3.189, 8.25), fill: rgb("#00008c"))
  rect((3.207, 5.05), (3.224, 8.25), fill: rgb("#bf7c00"))
  rect((3.242, 5.05), (3.26, 8.25), fill: rgb("#00008c"))
  rect((3.278, 5.05), (3.296, 8.25), fill: rgb("#bf7c00"))
  rect((3.313, 5.05), (3.331, 8.25), fill: rgb("#00008c"))
  rect((3.349, 5.05), (3.367, 8.25), fill: rgb("#bf7c00"))
  rect((3.384, 5.05), (3.402, 8.25), fill: rgb("#00008c"))
  rect((3.42, 5.05), (3.438, 8.25), fill: rgb("#bf7c00"))
  rect((3.456, 5.05), (3.473, 8.25), fill: rgb("#00008c"))
  rect((3.491, 5.05), (3.509, 8.25), fill: rgb("#bf7c00"))
  rect((3.527, 5.05), (3.544, 8.25), fill: rgb("#00008c"))
  rect((3.562, 5.05), (3.58, 8.25), fill: rgb("#bf7c00"))
  rect((3.598, 5.05), (3.615, 8.25), fill: rgb("#00008c"))
  rect((3.633, 5.05), (3.651, 8.25), fill: rgb("#bf7c00"))
  rect((3.669, 5.05), (3.687, 8.25), fill: rgb("#00008c"))
  rect((3.704, 5.05), (3.722, 8.25), fill: rgb("#bf7c00"))
  rect((3.74, 5.05), (3.758, 8.25), fill: rgb("#00008c"))
  rect((3.775, 5.05), (3.793, 8.25), fill: rgb("#bf7c00"))
  rect((3.811, 5.05), (3.829, 8.25), fill: rgb("#00008c"))
  rect((3.847, 5.05), (3.864, 8.25), fill: rgb("#bf7c00"))
  rect((3.882, 5.05), (3.9, 8.25), fill: rgb("#00008c"))
  rect((3.918, 5.05), (3.935, 8.25), fill: rgb("#bf7c00"))
  rect((3.953, 5.05), (3.971, 8.25), fill: rgb("#00008c"))
  rect((3.989, 5.05), (4.007, 8.25), fill: rgb("#bf7c00"))
  rect((4.024, 5.05), (4.042, 8.25), fill: rgb("#00008c"))
  rect((4.06, 5.05), (4.078, 8.25), fill: rgb("#bf7c00"))
  rect((4.095, 5.05), (4.113, 8.25), fill: rgb("#00008c"))
  rect((4.131, 5.05), (4.149, 8.25), fill: rgb("#bf7c00"))
  rect((4.167, 5.05), (4.184, 8.25), fill: rgb("#00008c"))
  rect((4.202, 5.05), (4.22, 8.25), fill: rgb("#bf7c00"))
  rect((4.238, 5.05), (4.255, 8.25), fill: rgb("#00008c"))
  rect((4.273, 5.05), (4.291, 8.25), fill: rgb("#bf7c00"))
  rect((4.309, 5.05), (4.326, 8.25), fill: rgb("#00008c"))
  rect((4.344, 5.05), (4.362, 8.25), fill: rgb("#bf7c00"))
  rect((4.38, 5.05), (4.398, 8.25), fill: rgb("#00008c"))
  rect((4.415, 5.05), (4.433, 8.25), fill: rgb("#bf7c00"))
  rect((4.451, 5.05), (4.469, 8.25), fill: rgb("#00008c"))
  rect((4.486, 5.05), (4.504, 8.25), fill: rgb("#bf7c00"))
  rect((4.522, 5.05), (4.54, 8.25), fill: rgb("#00008c"))
  rect((4.558, 5.05), (4.575, 8.25), fill: rgb("#bf7c00"))
  rect((4.593, 5.05), (4.611, 8.25), fill: rgb("#00008c"))
  rect((4.629, 5.05), (4.646, 8.25), fill: rgb("#bf7c00"))
  rect((4.664, 5.05), (4.682, 8.25), fill: rgb("#00008c"))
  rect((4.7, 5.05), (4.718, 8.25), fill: rgb("#bf7c00"))
  rect((4.735, 5.05), (4.753, 8.25), fill: rgb("#00008c"))
  rect((4.771, 5.05), (4.789, 8.25), fill: rgb("#bf7c00"))
  circle((3.1, 6.65), radius: 1.5, stroke: (paint: rgb("#999999"), thickness: 0.35pt))
  circle((3.1, 6.65), radius: 1, stroke: (paint: rgb("#999999"), thickness: 0.35pt))
  circle((3.1, 6.65), radius: 0.6667, stroke: (paint: rgb("#999999"), thickness: 0.35pt))
  circle((3.1, 6.65), radius: 0.4444, stroke: (paint: rgb("#999999"), thickness: 0.35pt))
  line((1.25, 6.65), (5.08, 6.65), stroke: (paint: rgb("#595959")), mark: (end: ">"))
  content((5.08, 6.65), [$y_1$], anchor: "west")
  line((3.1, 4.85), (3.1, 8.47), stroke: (paint: rgb("#595959")), mark: (end: ">"))
  content((3.1, 8.47), [$y_2$], anchor: "south")
  circle((3.1, 6.65), radius: 0.025, fill: black)
  content((3.04, 6.5), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$0$])])
  line((4.68, 8.01), (4.23, 7.635), mark: (end: ">"))
  content((4.63, 8.13), [$e^ eta s_j$], anchor: "west")
  line((4.88, 7.43), (3.94, 7.19), mark: (end: ">"))
  content((4.89, 7.48), [$s_j$], anchor: "west")
  content((3.1, 4.63), [Geometric annuli; stripe period $p_j=s_j^2$.])
  content((0.15, 3.76), [\(b\) A stripe period, magnified], anchor: "west")
  content((0.25, 3.28), [$y_1/p_j 1$], anchor: "west")
  rect((0.65, 2.35), (1.9, 2.92), fill: rgb("#00008c"))
  rect((3.15, 2.35), (4.4, 2.92), fill: rgb("#bf7c00"))
  rect((0.65, 2.35), (5.65, 2.92), stroke: (paint: rgb("#666666")))
  line((1.9, 2.35), (1.9, 2.92), stroke: (paint: rgb("#8c8c8c")))
  line((3.15, 2.35), (3.15, 2.92), stroke: (paint: rgb("#8c8c8c")))
  line((4.4, 2.35), (4.4, 2.92), stroke: (paint: rgb("#8c8c8c")))
  content((1.275, 2.635), [$+$])
  content((3.775, 2.635), [$-$])
  content((2.525, 2.635), [empty])
  content((5.025, 2.635), [empty])
  content((0.65, 2.3), [$0$], anchor: "north")
  content((1.9, 2.3), [$14$], anchor: "north")
  content((3.15, 2.3), [$12$], anchor: "north")
  content((4.4, 2.3), [$34$], anchor: "north")
  content((5.65, 2.3), [$1$], anchor: "north")
  content((3.15, 1.12), [Each sign occupies one quarter#linebreak()of every stripe period.])
  content((7.05, 9.15), [\(c\) Jets inside the bath hole], anchor: "west")
  rect((7.1, 5.05), (13.55, 8.15), fill: rgb("#e8e8e8"))
  merge-path({line((8.8, 5.9), (11.8, 5.9)); arc((11.8, 5.9), start: -90deg, stop: 90deg, radius: 0.7); line((11.8, 7.3), (8.8, 7.3)); arc((8.8, 7.3), start: 90deg, stop: 270deg, radius: 0.7)}, close: true, fill: rgb("#ffffff"), stroke: (paint: rgb("#737373")))
  line((7.4, 6.6), (13.25, 6.6), stroke: (paint: rgb("#808080"), dash: "dashed"), mark: (end: ">"))
  content((13.25, 6.6), [$z$], anchor: "south")
  line((8.8, 6.6), (11.8, 6.6), stroke: (paint: rgb("#8c8c8c"), thickness: 1.0pt))
  line((8.8, 6.51), (8.8, 6.69), stroke: (paint: rgb("#666666")))
  content((8.8, 6.49), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$- 13$])])
  line((10.3, 6.51), (10.3, 6.69), stroke: (paint: rgb("#666666")))
  content((10.3, 6.49), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$0$])])
  line((11.8, 6.51), (11.8, 6.69), stroke: (paint: rgb("#666666")))
  content((11.8, 6.49), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$13$])])
  rect((9.738, 6.85), (10.86, 6.94), fill: rgb("#00008c"))
  rect((9.738, 6.98), (10.86, 7.07), fill: rgb("#bf7c00"))
  line((9.738, 7.2), (10.86, 7.2), mark: (start: "<", end: ">"))
  content((10.3, 7.2), [$|z|<a$], anchor: "south")
  line((12.65, 7.58), (12.31, 7.02), mark: (end: ">"))
  content((13.4, 7.81), [$D_{ "hole"}$], anchor: "east")
  content((7.3, 5.45), [Initial bath on $D_{ "hole"}^{ c}$], anchor: "west")
  content((10.3, 4.63), [Schematic axial view; $a=1/8$.])
  content((7.05, 3.76), [\(d\) Axial velocity centers], anchor: "west")
  line((7.7, 1.87), (13.3, 1.87), stroke: (paint: rgb("#737373")), mark: (end: ">"))
  content((13.3, 1.87), [$z$], anchor: "west")
  line((10.3, 0.3), (10.3, 3.23), stroke: (paint: rgb("#737373")), mark: (end: ">"))
  content((10.3, 3.23), [$v_3$], anchor: "south")
  line((7.9, 2.55), (12.7, 2.55), stroke: (paint: rgb("#8c8c8c"), dash: "dotted"))
  line((7.9, 1.19), (12.7, 1.19), stroke: (paint: rgb("#8c8c8c"), dash: "dotted"))
  content((10.22, 2.55), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$1$])])
  content((10.22, 1.19), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$-1$])])
  line((8.1, 2.321), (8.164, 2.321), (8.228, 2.322), (8.291, 2.322), (8.355, 2.322), (8.419, 2.323), (8.483, 2.323), (8.546, 2.324), (8.61, 2.325), (8.674, 2.326), (8.738, 2.327), (8.801, 2.328), (8.865, 2.329), (8.929, 2.331), (8.993, 2.333), (9.057, 2.335), (9.12, 2.338), (9.184, 2.342), (9.248, 2.345), (9.312, 2.35), (9.375, 2.355), (9.439, 2.361), (9.503, 2.368), (9.567, 2.376), (9.63, 2.385), (9.694, 2.395), (9.758, 2.406), (9.822, 2.419), (9.886, 2.433), (9.949, 2.449), (10.01, 2.465), (10.08, 2.483), (10.14, 2.501), (10.2, 2.52), (10.27, 2.54), (10.33, 2.56), (10.4, 2.58), (10.46, 2.599), (10.52, 2.617), (10.59, 2.635), (10.65, 2.651), (10.71, 2.667), (10.78, 2.681), (10.84, 2.694), (10.91, 2.705), (10.97, 2.715), (11.03, 2.724), (11.1, 2.732), (11.16, 2.739), (11.22, 2.745), (11.29, 2.75), (11.35, 2.755), (11.42, 2.758), (11.48, 2.762), (11.54, 2.765), (11.61, 2.767), (11.67, 2.769), (11.73, 2.771), (11.8, 2.772), (11.86, 2.773), (11.93, 2.774), (11.99, 2.775), (12.05, 2.776), (12.12, 2.777), (12.18, 2.777), (12.24, 2.778), (12.31, 2.778), (12.37, 2.778), (12.44, 2.779), (12.5, 2.779), stroke: (paint: rgb("#00008c"), thickness: 1.1pt))
  line((8.1, 0.9612), (8.164, 0.9614), (8.228, 0.9617), (8.291, 0.962), (8.355, 0.9624), (8.419, 0.9628), (8.483, 0.9634), (8.546, 0.964), (8.61, 0.9648), (8.674, 0.9656), (8.738, 0.9667), (8.801, 0.9679), (8.865, 0.9694), (8.929, 0.9711), (8.993, 0.9731), (9.057, 0.9755), (9.12, 0.9783), (9.184, 0.9815), (9.248, 0.9854), (9.312, 0.9898), (9.375, 0.995), (9.439, 1.001), (9.503, 1.008), (9.567, 1.016), (9.63, 1.025), (9.694, 1.035), (9.758, 1.046), (9.822, 1.059), (9.886, 1.073), (9.949, 1.089), (10.01, 1.105), (10.08, 1.123), (10.14, 1.141), (10.2, 1.16), (10.27, 1.18), (10.33, 1.2), (10.4, 1.22), (10.46, 1.239), (10.52, 1.257), (10.59, 1.275), (10.65, 1.291), (10.71, 1.307), (10.78, 1.321), (10.84, 1.334), (10.91, 1.345), (10.97, 1.355), (11.03, 1.364), (11.1, 1.372), (11.16, 1.379), (11.22, 1.385), (11.29, 1.39), (11.35, 1.395), (11.42, 1.398), (11.48, 1.402), (11.54, 1.405), (11.61, 1.407), (11.67, 1.409), (11.73, 1.411), (11.8, 1.412), (11.86, 1.413), (11.93, 1.414), (11.99, 1.415), (12.05, 1.416), (12.12, 1.417), (12.18, 1.417), (12.24, 1.418), (12.31, 1.418), (12.37, 1.418), (12.44, 1.419), (12.5, 1.419), stroke: (paint: rgb("#bf7c00"), thickness: 1.1pt))
  content((12.55, 2.78), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$a_s^+$])])
  content((12.55, 1.4), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$a_s^-$])])
  content((10.3, 0.04), [$a_s^ sigma (z)= sigma + alpha ( gamma z/s)$])
})],
  caption: [Figure 1: The initial jets and bath near one lattice point. The annular picture is schematic: stripe widths and radial gaps are enlarged for visibility, and only three annuli are drawn. Panel (b) records the exact stripe fractions, which later give a coefficient $1 \/ 4$ for each sign after averaging. Panel (c) places the jets schematically inside the bath hole, the tube of radius $2 delta$ about the axial segment $\[ - 1 \/ 3 \, 1 \/ 3 \]$; the vertical placement of the two signs is only illustrative. Panel (d) shows the centers of the compact velocity profiles of width $d_s$. All spatial panels are local views in the rotated lift; they do not depict a closed axis on the torus. ],
) <fig:jet-geometry>

Choose also a nonzero nonnegative $chi in C_c^oo \( bb(R)_x^3 times bb(R)_v^3 \)$, and a constant $L_0$ with $L_0 parallel chi parallel_H > 1$. For the approximation retaining $j lt.eq N$, the additional initial density is either zero or

$ h_(N \, T \, lambda)^0 \( x \, v \) = lambda m_T s_N sum_(n in Lambda) chi #scale(x: 120%, y: 120%)[\(] \( x - n \) \/ s_N \, v #scale(x: 120%, y: 120%)[\)] \, #h(2em) m_T = T^p \, #h(2em) 0 lt.eq lambda lt.eq L_0 . quad "(4.6)" $ <con:seed>

Here $0 < T lt.eq t_1 lt.eq 1 \/ 32$; Section 6 fixes $t_1 > 0$ and then $p > 0$. We reduce $s_0$ so that the seed’s lattice copies have disjoint spatial supports. Its weighted norm is then $lambda m_T s_N parallel chi parallel_H$, with the unperiodized norm on the right.

#thm([Lemma 4.2.])[
  (Datum bounds and approximation).  #emph[The density $F_0$ is nonnegative, has bounded velocity support, and satisfies 
$ integral F_0 \( 1 + \| v \|^2 + \| log F_0 \| \) thin upright(d) x thin upright(d) v < oo . $

 Its truncations with $j lt.eq N$, with or without a seed (4.6), converge to $F_0$ in weighted $L^1$ for every fixed polynomial velocity weight and in relative entropy with respect to either $M$ or $mu$. The convergence is uniform for $0 < T lt.eq t_1$ and $0 lt.eq lambda lt.eq L_0$. Moreover their initial $mu$-relative entropy can be made arbitrarily small, uniformly in $N \, T \, lambda$, by first decreasing $delta$ and increasing $R_mu$, then decreasing $s_0$.]
] <con:datum>

#proof[
  Integration over one period of the lattice sum equals integration of each unshifted prototype over $bb(R)_x^3$. The transverse area is $O \( s^2 \)$, while
  $ integral_(- a)^a S \( gamma z \/ s \) thin upright(d) z lt.eq 2 s \/ gamma . $
  The velocity factor has integral one and support in ${ \| v \| < 2 }$. Thus every fixed velocity moment of a sign prototype is $O \( s^2 \)$. On its positive set the logarithm of the density splits into
  $ log \( \( K \/ s \) d_s^(- 3) \) \, #h(2em) log S \( gamma z \/ s \) \, #h(2em) log J \( w \) . $
  The first term is $O \( 1 + \| log s \| \)$, and $integral S \| log S \| < oo$, $integral J \| log J \| < oo$. Its absolute entropy is therefore $O \( s^2 \( 1 + \| log s \| \) \)$. The corresponding series over the geometric scales converges. Disjointness proves the asserted integrability and convergence for the cold sum. The background is bounded by $mu$, and its velocities satisfy $\| v \| lt.eq R_mu$, giving the datum claims.
  For a seed $b = h_(N \, T \, lambda)^0$, scaling $x$ gives
  $ integral b chevron.l v chevron.r^k thin upright(d) x thin upright(d) v lt.eq C_k s_N^4 \, #h(2em) integral b \| log b \| thin upright(d) x thin upright(d) v lt.eq C s_N^4 \( 1 + \| log s_N \| \) . $
  These constants are uniform because $lambda m_T$ stays in a fixed bounded interval and $r \| log r \|$ is bounded on such an interval. The preexisting truncated density $f = u^0 + sum_(j lt.eq N) c_i^0$ satisfies $f lt.eq C s_N^(- 31)$. For $f \, b gt.eq 0$, integration of $1 + log \( f + r \)$ over $0 < r < b$ gives
  $ \| \( f + b \) log \( f + b \) - f log f \| lt.eq b { 2 + log^(+) \( f + b \) } + b \| log b \| . $
  Indeed, the positive logarithm is bounded by its terminal value, while $integral_0^b log^(-) \( f + r \) thin upright(d) r lt.eq b \( 1 + \| log b \| \)$. The entropy change caused by the seed is consequently $O \( s_N^4 \( 1 + \| log s_N \| \) \)$. Its reference terms are controlled by its mass and energy. This proves all convergence assertions.
  Removing the hole and the velocity tail from $mu$ costs precisely the removed mass in $cal(H)_mu$. The inserted jets have bounded velocities, so their contribution is bounded by the preceding absolute entropy, mass, and energy sums, which tend to zero with $s_0$. The same is true uniformly for the seeds. The stated order of choices therefore makes the initial relative entropy arbitrarily small. ◻
]

=== 4.3 Colored equations and transfers at large times <colored-equations-and-transfers-at-large-times>

Use the collision cutoff obtained by multiplying the hard-sphere kernel by

$ theta.alt_b \( \| v - v_(*) \| \) = min { 1 \, b \/ \| v - v_(*) \| } \, #h(2em) b gt.eq 1 . $

Its value at zero is immaterial. Write $P^b$ for the symmetric cutoff gain and $nu_f^b \( v \) = 2 pi integral min { b \, \| v - p \| } f \( p \) thin upright(d) p$. The cutoff is invariant under particle exchange and the elastic pre/post-collisional substitution. It can equivalently be inserted in the incoming relative speed in the Carleman and sphere formulas. Fix $b = b_N arrow.r oo$, and put $cal(I)_N = { \( j \, sigma \, n \) : 1 lt.eq j lt.eq N \, med sigma = plus.minus 1 \, n in Lambda }$.

Until $t_1$, write $c = sum_(i in cal(I)_N) c_i$, $F = c + u + h$, and solve

$ D_t c_i + nu_F^b c_i & = P^b \( c_i \, c_i \) \, & D_t u + nu_F^b u & = P^b \( u \, u \) \,\
D_t h + nu_F^b h & = P^b \( h \, h \) + 2 P^b \( c + u \, h \) + cal(S) \, & cal(S) & = 2 P^b \( c \, u \) + sum_(i eq.not i') P^b \( c_i \, c_(i') \) . quad "(4.7)" $ <con:colors>

The last sum is ordered. Thus $D_t F = Q^b \( F \, F \)$.

At $t_1$, replace $u + h$ by a single component $w$. A jet at scale $s$ remains separate until its retirement time

$ L_s = s^(- 1 \/ 2) > 1 . quad "(4.8)" $ <con:deadline>

At $L_s$, add all colors at that scale to $w$ and remove their labels. For the active labels, retain their equations in (4.7); between retirements set $F = c + w$ and solve

$ D_t w + nu_F^b w = P^b \( w \, w \) + 2 P^b \( c \, w \) + sum_(i eq.not i') P^b \( c_i \, c_(i') \) . quad "(4.9)" $ <con:late-colors>

The total density has no jump at a retirement. It satisfies the same cutoff Boltzmann equation across the entire evolution.

#thm([Proposition 4.3.])[
  (Finite evolution and its identities).  #emph[For fixed $N \, b \, T \, lambda$, the colored equations have a unique nonnegative local mild solution with bounded total $H$-norm. It continues while that norm remains bounded, with the prescribed transfers at retirement times, and depends continuously in this norm on its initial data on every common bounded interval of existence. The norm of each component is continuous between transfers.]
  #emph[On every such interval, total mass, momentum, and energy are conserved. The exact local collision-invariant balances hold, with all polynomial velocity fluxes integrable. For $rho = M$ or $rho = mu$, one has at every time of existence 
$ cal(H)_rho \( F \( t \) \) + integral_0^t cal(D)^b \( F \( s \) \) thin upright(d) s lt.eq cal(H)_rho \( F \( 0 \) \) \, quad "(4.10)" $ <con:finite-entropy>

 where $cal(D)^b$ is the entropy dissipation with the same cutoff.]
] <con:finite-evolution>

#proof[
  The gain estimate $P \( H \, H \) lt.eq C H$ and
  $ parallel nu_f^b parallel_oo lt.eq 2 pi b parallel f parallel_H integral H \( p \) thin upright(d) p $
  make the gain and loss locally Lipschitz in the weighted norm. For the colored system use the norm of the pointwise sum of the absolute values of the components, and the sum of absolute differences for two solutions. All quadratic estimates close in this norm. The initially disjoint lattice copies have finite total norm, and periodic covariance is preserved by uniqueness. Picard iteration in free coordinates gives the local solution; the loss integrating factor and positive gain iteration give nonnegativity. Repetition on short subintervals gives continuation and the difference estimate. These arguments use the integral equation along flights and require no norm continuity of spatial translation for measurable data. On an interval with bounded norm, the increments along flights are Lipschitz in that norm. Since free transport is isometric, each component’s norm is continuous. Transfers only regroup finitely many scales and preserve the total density.
  The weight $H$ has every polynomial moment and belongs to $L^(1 + epsilon.alt) \( bb(R)^3 \)$ for some $epsilon.alt > 0$. Hence the cutoff equation has integrable gain and loss with all polynomial weights on every bounded interval under consideration. Integrating its path formula and using particle interchange and the elastic substitution yields conservation of the collision invariants. The same calculation with a smooth spatial test gives each local balance, including its initial trace.
  Here are details of the entropy calculation at a fixed approximation. Put $g \( v \) = e^(- 2 \| v \|^2)$ and $F_epsilon.alt = F + epsilon.alt g$. Differentiate $F_epsilon.alt log \( F_epsilon.alt \/ rho \) - F_epsilon.alt + rho$ along flights; its derivative is $Q^b \( F \, F \) log \( F_epsilon.alt \/ rho \)$. Replacing $Q^b \( F \, F \)$ by $Q^b \( F_epsilon.alt \, F_epsilon.alt \)$ changes its integral by a quantity tending to zero. Indeed, the operator difference is $O \( epsilon.alt \) H$ on the fixed interval, while
  $ \| log \( F_epsilon.alt \/ rho \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \| log epsilon.alt \| + \| v \|^2 + log^(+) \( 1 \/ \| macron(v) \| \) #scale(x: 120%, y: 120%)[\)] . $
  The right-hand side is integrable against $H$, and the resulting error is $O \( epsilon.alt \( 1 + \| log epsilon.alt \| \) \)$. For the shifted density the usual symmetric calculation is now justified by this integrability. The logarithm of either Maxwellian reference is a collision invariant. Symmetrization therefore gives minus the cutoff dissipation. The regularized entropies converge by dominated convergence using the same bounds, and Fatou’s lemma applies to the nonnegative dissipation. This proves (4.10). The integrated path formula includes every time section, so the conservation and entropy statements hold at every time, also when colors are transferred. ◻
]

We record the consequence of the small initial entropy that will drive the later estimates. Define

$ D_F \( t \, x \) = integral chevron.l v chevron.r \| F \( t \, x \, v \) - mu \( v \) \| thin upright(d) v \, #h(2em) D_(-) \( t \, x \) = integral chevron.l v chevron.r \( mu \( v \) - F \( t \, x \, v \) \)_(+) thin upright(d) v . quad "(4.11)" $ <con:entropy-defect>

For any prescribed sufficiently small $epsilon_E > 0$, the parameters in Lemma 12 can be chosen so that, throughout every interval of existence of every finite approximation,

$ parallel D_F \( t \) parallel_(L_x^1) lt.eq epsilon_E \, #h(2em) 0 lt.eq D_(-) \( t \, x \) lt.eq integral chevron.l v chevron.r mu \( v \) thin upright(d) v . quad "(4.12)" $ <con:entropy-distance>

To see the first assertion, use $\( sqrt(z) - 1 \)^2 lt.eq z log z - z + 1$ and Cauchy–Schwarz to obtain

$ parallel D_F \( t \) parallel_(L_x^1) lt.eq cal(H)_mu \( F \( t \) \)^(1 \/ 2) (2 integral chevron.l v chevron.r^2 \( F \( t \) + mu \) thin upright(d) x thin upright(d) v)^(1 \/ 2) . $

The second factor has a uniform fixed bound by mass and energy conservation and the initial estimates. The first factor is uniformly small by (4.10). No pointwise smallness of $D_F$ is asserted here; recovering the necessary pointwise control after transport is the purpose of the global continuation argument.

== 5 Cold estimates up to the retirement times <sec:cold>

A jet remains a separate color until $L_s = s^(- 1 \/ 2)$, which tends to infinity as its scale tends to zero. We now control it throughout that interval. The essential facts are that the free jet remains in a narrow spatial tube, its self-collisions create only a small Gaussian remainder, and the active tubes stay disjoint on the torus. These are long-time versions of the cold estimates in #cite(label("OpenAIPeriodic")) Section 4. We give the details because both the long deadlines and the change of lattice matter for global continuation. All constants may depend on the four fixed parameters (4.1), on $J$, and on the fixed choice of $d_0$, but not on $N \, b \, T$ or the size of the hot component.

=== 5.1 Disjoint spatial enlargements <disjoint-spatial-enlargements>

For $i = \( j \, sigma \, n \)$, put

$ hat(E)_j^sigma = { y : "dist" \( y \, E_j^sigma \) lt.eq \( c_eta \/ 4 \) s_j^2 } \, #h(2em) cal(O)_i \( t \) = n + hat(E)_j^sigma times \[ - a - 2 t - b_(upright("sp")) \, a + 2 t + b_(upright("sp")) \] . quad "(5.1)" $ <cold:enlargements>

These sets enlarge the spatial supports for estimates; the original stripe masks in $c_i^0$ are always retained when taking a limit.

#thm([Lemma 5.1.])[
  (Disjointness before retirement).  #emph[For sufficiently small $s_0$, the sets $cal(O)_i \( t \)$ for active labels are pairwise disjoint in the periodic lift. More precisely, $cal(O)_i \( t \) ∩ cal(O)_(i') \( t \) = diameter$ for distinct labels whenever $t lt.eq min { L_(s_i) \, L_(s_(i')) }$. Also 
$ hat(E)_j^sigma subset { s_j < \| y \| < e^eta s_j } . $

]
] <cold:geometry>

#proof[
  Within a fixed copy, the radial margins are larger than the corresponding enlargement radii. Adjacent radial cores have gap $c_eta \( s_j^2 + s_(j + 1)^2 \)$, whereas the sum of their enlargement radii is one quarter of that gap. Opposite stripe patterns at a single scale have gap $s_j^2 \/ 4$, larger than the sum $c_eta s_j^2 \/ 2$ of their enlargement radii. This proves the assertions for one copy.
  For distinct copies let $S_(*) = max { s_i \, s_(i') }$. An intersection would force
  $ \| macron(n) - macron(n)' \| lt.eq 4 S_(*) \, #h(2em) \| n - n' \| lt.eq C \( 1 + t \) lt.eq C \( 1 + S_(*)^(- 1 \/ 2) \) . $
  By (4.2), the first quantity is at least $c \/ \( 1 + \| n - n' \| \) gt.eq c' S_(*)^(1 \/ 2)$. For sufficiently small $s_0$ this contradicts $4 S_(*)$. The choice is uniform over all pairs of scales and all lattice copies. ◻
]

At a point $\( t \, x \)$, the #emph[main label] is the unique active label whose enlargement contains $x$, if one exists. Every other active label is called nonmain at that point. Write $cal(O) \( t \)$ for the union, in the torus, of the active enlargements. Including additional scales absent from the finite approximation is harmless, provided their deadlines have not passed. At a retirement endpoint, these definitions may use the colors just before they are transferred.

=== 5.2 A supersolution for one color <a-supersolution-for-one-color>

For all $s > 0$, signs $sigma$, and $t gt.eq 0$, define the axial profile $U_(s \, sigma) \( t \, z \)$ by

$ U_(s \, sigma) \( t \, z \) = a_s^sigma #scale(x: 120%, y: 120%)[\(] z - t U_(s \, sigma) \( t \, z \) #scale(x: 120%, y: 120%)[\)] . quad "(5.2)" $ <cold:profile>

This is uniquely and smoothly defined: the map $tau mapsto tau + t a_s^sigma \( tau \)$ is onto and has derivative at least one. In particular $\| U_(s \, sigma) \| lt.eq 1 + alpha$. For a fixed label, abbreviate $s = s_j$, $L = L_s$, $U = U_(s \, sigma) \( t \, z_c \)$, and set

$ tau = z_c - t U \, #h(2em) xi = v - U e_3 \, #h(2em) D_y = "dist" \( y_c \, E_j^sigma \) \, #h(2em) D_z = "dist" \( tau \, \[ - a \, a \] \) . $

The free transport and its majorant are

$ f_i \( t \, x \, v \) = c_i^0 \( x - t v \, v \) \, quad "(5.3)" $ <cold:free-core>

$ m_i \( t \, x \, v \) = C_m K / s d_s^(- 3) e^(t \/ L) exp [- frac(\( 2 - t \/ L \) \| xi \|^2, d_s^2) - frac(D_y^2 + D_z^2, 8 d_s^2 L t)] \, #h(2em) 0 < t lt.eq L . quad "(5.4)" $ <cold:barrier-definition>

Its value at time zero is the trace along free characteristics.

#thm([Lemma 5.2.])[
  (Barrier estimates).  #emph[A fixed sufficiently large $C_m$ gives, for $0 lt.eq t lt.eq L_s$, 
$ f_i & lt.eq m_i \, #h(2em) D_t m_i gt.eq 1 / L_s (1 + 7 / 8 frac(\| xi \|^2, d_s^2)) m_i \,\
P \( m_i \, m_i \) & = m_i nu_(m_i) lt.eq C K / s \( d_s + \| xi \| \) m_i . quad "(5.5)" $ <cold:barrier-derivative>

 The differential inequality holds almost everywhere along flights. For sufficiently small $s_0$, $f_i \( t \, x \, v \) > 0$ implies $x in cal(O)_i \( t \)$ throughout the same time interval.]
] <cold:barrier>

#proof[
  Put $A = \( a_s^sigma \)' \( tau \) gt.eq 0$. Differentiation of (5.2) gives
  $ U_z = frac(A, 1 + t A) gt.eq 0 \, #h(2em) U_t = - U U_z \, #h(2em) D_t U = \( v_3 - U \) U_z \, #h(2em) D_t tau = frac(v_3 - U, 1 + t A) . $
  Thus $D_t \| xi \|^2 = - 2 U_z xi_3^2$. The distance functions are locally Lipschitz along every flight, and
  $ \| D_t D_y \| lt.eq \| macron(xi) \| \, #h(2em) \| D_t D_z \| lt.eq \| xi_3 \| . $
  With $r = \( D_y \, D_z \)$, differentiation of the logarithm of the barrier therefore yields
  $ D_t log m_i = 1 / L + frac(\| xi \|^2, L d_s^2) + frac(2 \( 2 - t \/ L \) U_z xi_3^2, d_s^2) + frac(\| r \|^2, 8 d_s^2 L t^2) - frac(r dot.op D_t r, 4 d_s^2 L t) . $
  The last two terms are at least $- \| D_t r \|^2 \/ \( 8 d_s^2 L \)$, by completing a square. Since $\| D_t r \| lt.eq \| xi \|$ and $2 - t \/ L gt.eq 1$, this proves the derivative estimate. The large axial derivative $U_z$ has a favorable sign.
  For a flight starting in the core at $x^0$, write $v = a_s^sigma \( z_c^0 \) e_3 + d_s w$, $\| w \| lt.eq 1$. At $x = x^0 + t v$, the increasing function $p mapsto p - a_s^sigma \( z_c - t p \)$ has derivative at least one, value $d_s w_3$ at $p = v_3$, and value zero at $p = U$. Consequently
  $ \| xi \| lt.eq d_s \, #h(2em) D_y lt.eq t d_s \| macron(w) \| \, #h(2em) D_z lt.eq t d_s \| w_3 \| . $
  The distance exponent in (5.4) is at most $t \/ \( 8 L \)$, and its velocity exponent is at most two. A fixed $C_m$, depending only on $parallel J parallel_oo$, thus gives $f_i lt.eq m_i$. Since $L_s d_s = d_0 s^(19 \/ 2) lt.double s^2$, the transverse displacement is less than the enlargement radius. The axial speed is below two, so the flight also stays inside the axial interval of (5.1).
  At fixed $\( t \, x \)$, the majorant is a scalar multiple of a Maxwellian centered at $U e_3$. Detailed balance gives $P \( m_i \, m_i \) = m_i nu_(m_i)$. Its mass is at most $C K \/ s$, and its first moment about $U e_3$ is at most $C K d_s \/ s$, uniformly for $t lt.eq L_s$. The inequality $\| v - p \| lt.eq \| xi \| + \| p - U e_3 \|$ gives (5.5).
  Finally, along a flight starting on the closed initial spatial support, both distance functions vanish initially and are locally Lipschitz, so their squared-distance-over-time terms tend to zero. Away from that support the barrier tends to zero. These observations give its path trace and allow the differential inequalities to be integrated from zero. Boundary conventions for the masks change only null sets; no spatial indicator is differentiated. ◻
]

#thm([Proposition 5.3.])[
  (Control of every active color).  #emph[There is a fixed constant $C_(*)$ such that, with 
$ epsilon.alt_s = C_(*) L_s d_s \/ s \, #h(2em) cal(U)_i = f_i + epsilon.alt_s m_i \, $

 and sufficiently small $s_0$, every finite colored evolution obeys 
$ 0 lt.eq c_i \( t \, x \, v \) lt.eq cal(U)_i \( t \, x \, v \) #h(2em) \( 0 lt.eq t lt.eq L_(s_i) \) quad "(5.6)" $ <cold:upper>

 as long as that color is active and the solution exists. If, on an interval beginning at $t_1$, one also has $nu_F^b gt.eq kappa > 0$, then 
$ c_i \( t \, x \, v \) lt.eq e^(- kappa \( t - t_1 \)) cal(U)_i \( t \, x \, v \) #h(2em) \( t_1 lt.eq t lt.eq L_(s_i) \) quad "(5.7)" $ <cold:decay>

 throughout that interval. None of the constants in (5.6) uses a bound on the bath or hot density.]
] <cold:control>

#proof[
  Reduce $s_0$ so that $epsilon.alt_s lt.eq 1$ at every scale. Then $cal(U)_i lt.eq 2 m_i$, and Lemma 15 gives
  $ P^b \( cal(U)_i \, cal(U)_i \) lt.eq 4 C K / s \( d_s + \| xi \| \) m_i \, #h(2em) D_t cal(U)_i gt.eq epsilon.alt_s / L_s (1 + 7 / 8 frac(\| xi \|^2, d_s^2)) m_i . $
  Since $1 + z^2 gt.eq c \( 1 + z \)$, a fixed large $C_(*)$ makes $D_t cal(U)_i gt.eq P^b \( cal(U)_i \, cal(U)_i \)$. Dropping the nonnegative loss in the equation for $c_i$ permits positive gain comparison from the initial trace.
  For completeness, this comparison is valid in the measurable solution class of Proposition 13. At a fixed approximation $m_i lt.eq C_s H$ throughout the interval, and $z_i = \( c_i - cal(U)_i \)_(+)$ has a pathwise upper integral comparison from zero with source $2 P^b \( cal(U)_i \, z_i \) + P^b \( z_i \, z_i \)$. The bilinear $H$-norm estimate and Gronwall’s inequality give $parallel z_i parallel_H = 0$. One may first integrate from a positive time and then use the trace established in Lemma 15.
  For the second assertion, $e^(- kappa \( t - t_1 \)) cal(U)_i$ is a supersolution for $D_t + kappa$: its linear derivative has factor $e^(- kappa \( t - t_1 \))$, whereas its quadratic gain has the smaller factor $e^(- 2 kappa \( t - t_1 \))$. Its value at $t_1$ dominates $c_i \( t_1 \)$. The same comparison proves (5.7). ◻
]

=== 5.3 Velocity measures and sums over colors <velocity-measures-and-sums-over-colors>

The preceding comparison bounds a narrow free core and a small remainder separately. The next lemma identifies the mass of that core at a fixed spatial point. Axial expansion produces the factor $\( t + s \)^(- 1)$, even though the initial velocity-integrated density is of order $s^(- 1)$.

#thm([Lemma 5.4.])[
  (Core formula and sheet amplitudes).  #emph[At a fixed $\( t \, x \)$, the velocity measure $f_i \( t \, x \, p \) thin upright(d) p$ is the pushforward of 
$ frac(K S \( gamma \( z_c - t p_3 \) \/ s \), s + t alpha gamma S \( gamma \( z_c - t p_3 \) \/ s \)) thin J \( w \) thin upright(d) w \, #h(2em) macron(p) = d_s macron(w) \, quad p_3 = a_s^sigma \( z_c - t p_3 \) + d_s w_3 \, quad "(5.8)" $ <cold:core-formula>

 with the initial spatial masks evaluated at $x - t p$. For $t lt.eq L_s$, it is dominated by probability sheets with total amplitude $C \/ \( t + s \)$. The remainder $epsilon.alt_s m_i thin upright(d) p$ has sheet amplitude at most 
$ C L_s d_s \/ s^2 lt.eq C s^(15 \/ 2) lt.eq C \/ \( t + s \) . quad "(5.9)" $ <cold:remainder-amplitude>

 Thus the full upper bound $cal(U)_i thin upright(d) p$ has sheet amplitude $C \/ \( t + s \)$. In particular, for every fixed $k gt.eq 0$, a main color satisfies 
$ integral chevron.l p chevron.r^k c_i \( t \, x \, p \) thin upright(d) p lt.eq frac(C_k, t + s) \, #h(2em) integral_(\| p \| > R) chevron.l p chevron.r^k c_i \( t \, x \, p \) thin upright(d) p lt.eq frac(C_k e^(- c_k R^2), t + s) quad \( R gt.eq 3 \) . quad "(5.10)" $ <cold:moments>

]
] <cold:core-amplitude>

#proof[
  The transverse Jacobian is $d_s^2$, while differentiation of the implicit equation for $p_3$ gives
  $ frac(partial p_3, partial w_3) = frac(d_s, 1 + t \( a_s^sigma \)' \( z_c - t p_3 \)) . $
  Multiplying by the density in (4.4) proves (5.8). Its coefficient is at most $C \/ \( s + t \)$, since $0 lt.eq S lt.eq 1$ and $alpha gamma > 0$. A fixed product Gaussian dominates $J$. Moreover, the monotonicity argument in Lemma 15 gives $\| p_3 - U \| lt.eq d_s \| w_3 \|$. The Gaussian parameter estimate (Lemma 8) therefore supplies the asserted sheet domination, with constants independent of the axial compression.
  The remainder is a Gaussian centered at $U e_3$, of width comparable to $d_s$, whose mass is at most $C epsilon.alt_s K \/ s = C L_s d_s \/ s^2$. Its transverse Gaussian width is within the sheet class and its axial exponential moment is uniformly bounded because $\| U \| lt.eq 1 + alpha$. Since $L_s d_s \/ s^2 = d_0 s^(15 \/ 2)$ and $t lt.eq s^(- 1 \/ 2)$, this also gives the last inequality of (5.9). Uniform Gaussian moments and tails, together with (5.6), prove (5.10). ◻
]

#thm([Lemma 5.5.])[
  (Nonmain tails).  #emph[There is a function $theta_0 \( s_0 \) arrow.r 0$ as $s_0 arrow.b 0$ such that, uniformly at all times of existence, 
$ sum_(i med upright("active")\
x in.not cal(O)_i \( t \)) cal(U)_i \( t \, x \, v \) lt.eq theta_0 \( s_0 \) e^(- 4 \| v \|^2) . quad "(5.11)" $ <cold:nonmain-bound>

 For $0 < t lt.eq 1$, and any fixed $A \, B > 0$, the coefficient can instead be taken to be $C_(A \, B) t^A s_0^B$. Both assertions remain valid for an arbitrary subset of the active labels.]
] <cold:nonmain>

#proof[
  Free cores vanish off their enlargements. For a nonmain label either $D_y gt.eq \( c_eta \/ 4 \) s^2$, or $\| z_c \| > a + 2 t + b_(upright("sp"))$, in which case $D_z gt.eq b_(upright("sp"))$ because $\| U \| < 2$. Completing the velocity square in the remainder gives
  $ cal(U)_i \( t \, x \, v \) lt.eq C s^(- 31) e^(- 4 \| v \|^2) exp (- frac(D_y^2 + D_z^2, 8 d_s^2 L_s t)) . $
  Here the Gaussian rate is at least eight once the widths are fixed small, and its centers stay bounded. Half the distance exponential is at most $exp \[ - c \/ \( s^16 L_s t \) \]$. Since $t lt.eq L_s$, this is bounded by $e^(- c \/ s^15)$, which absorbs every polynomial in $1 \/ s$. If also $t lt.eq 1$, it absorbs arbitrary powers of $t$ and $s$.
  It remains to sum the other half over lattice copies. Uniformly,
  $ D_y gt.eq \( \| y_c \| - C \)_(+) \, #h(2em) D_z gt.eq \( \| z_c \| - C \( 1 + t \) \)_(+) . $
  The Gaussian distance scale $d_s sqrt(L_s t)$ is bounded, and the central spatial region has diameter $O \( 1 + L_s \)$. The lattice has unit separation, hence at most $C \( R + 1 \)^3$ points in a ball of radius $R$. Summing in successive shells gives at worst a fixed polynomial loss in $1 \/ s$. The extracted exponential absorbs this loss and the factor $s^(- 31)$. Finally sum over the geometric scales. This proves both claims, including their stated uniformity. ◻
]

#thm([Lemma 5.6.])[
  (Size at retirement and volume of active tubes).  #emph[For some fixed constants $C \, C' > 0$, 
$ ∥sum_(i : thin s_i = s) cal(U)_i \( L_s \)∥_H lt.eq C s^(- C') . quad "(5.12)" $ <cold:retirement-bound>

 Moreover, uniformly over the active label sets and all times, 
$ \| cal(O) \( t \) \| lt.eq sum_(j gt.eq 1) C s_j^2 \( 1 + L_(s_j) \) lt.eq C s_0^(3 \/ 2) . quad "(5.13)" $ <cold:tube-volume>

]
] <cold:retirement-size>

#proof[
  For (5.12), use $f_i lt.eq m_i$ and the same Gaussian lattice sum as in Lemma 18, without extracting a small distance factor. The prefactor and the number of central copies are polynomial in $1 \/ s$. Completing the velocity square bounds the remaining velocity factor by $C e^(- 4 \| v \|^2) lt.eq C H \( v \)$. For (5.13), the transverse area at scale $s_j$ is $O \( s_j^2 \)$, and its axial length while active is $O \( 1 + L_(s_j) \)$. Projection onto the torus does not increase volume. Summation gives $C sum_j \( s_j^2 + s_j^(3 \/ 2) \) lt.eq C s_0^(3 \/ 2)$. ◻
]

All pointwise assertions above mean essential bounds. They also hold at the time sections defined by the finite path equations: free coordinates preserve measure, and Fubini’s theorem supplies a full-measure set of paths on which the inequalities can be integrated. For each fixed terminal time this gives a full-measure endpoint set. Countably many approximation indices, lattice copies, and interval choices can be handled simultaneously. This convention will also be used for the path estimates in the next section.

== 6 Selection and continuation on the initial time interval <sec:early>

The cold estimates hold without an a priori bound on the hot part. We use them first to select a hot seed whose evolution touches a prescribed cap, and then to continue every selected evolution to a fixed time $t_1$. The second step must be uniform as the cap horizon $T$ tends to zero. The bath remains weak inside the hole at very small times; away from time zero, the thinness of the jet tubes gives the additional smallness we need. All constants in this section may depend on the fixed jet parameters. They are independent of $N$, the collision cutoff, and the seed parameter, unless explicitly stated otherwise.

=== 6.1 The bath and the initial source <the-bath-and-the-initial-source>

#thm([Lemma 6.1.])[
  (Bath barrier).  #emph[There are $t_1 in \( 0 \, 1 \/ 32 \]$, $beta' > 4$, and constants $C \, c > 0$, independent of $delta$, $R_mu$, and $s_0$, such that every finite evolution of (4.7) satisfies, on its interval of existence, 
$ 0 lt.eq u \( t \, x \, v \) lt.eq C e^(- beta' \| v \|^2) exp #h(-1em) (- frac(c D_0 \( x \)^2, t)) \, #h(2em) 0 < t lt.eq t_1 \, #h(2em) D_0 \( x \) = "dist" \( x \, D_(upright("hole"))^c \) . quad "(6.1)" $ <early:bath-bound>

 For sufficiently small $s_0$ depending on $delta$, one also has 
$ D_0 \( x \) gt.eq delta #h(2em) \( 0 lt.eq t lt.eq t_1 \, med x in cal(O) \( t \) \) . quad "(6.2)" $ <early:hole-distance>

]
] <early:bath>

#proof[
  The distance $D_0$ is $1$-Lipschitz. Fix $4 < beta' < beta_0$ and a positive absolute constant $c$, and consider
  $ B \( t \, x \, v \) = exp \( C_1 t \) exp #h(-1em) (- \( beta_0 - C_1 t \) \| v \|^2 - frac(c D_0 \( x \)^2, t)) . $
  At almost every point of a free path,
  $ D_t log B & = C_1 + C_1 \| v \|^2 + frac(c D_0^2, t^2) - frac(2 c D_0, t) thin v dot.op nabla D_0\
 & gt.eq C_1 + \( C_1 - c \) \| v \|^2 . $
  The last inequality is completion of the square in $D_0 \/ t$. At fixed $\( t \, x \)$, $B$ is a Maxwellian in velocity. Energy conservation in a collision therefore gives $P \( B \, B \) = B nu_B$, and, as long as $beta_0 - C_1 t gt.eq beta' > 4$ and $e^(C_1 t) lt.eq 2$,
  $ P^b \( B \, B \) lt.eq P \( B \, B \) lt.eq C \( 1 + \| v \| \) B . $
  Choose $C_1$ large enough that the preceding lower bound for $D_t log B$ dominates $C \( 1 + \| v \| \)$, and then choose $t_1 lt.eq 1 \/ 32$ small enough to maintain both restrictions. These choices use only $beta_0$ and the collision normalization.
  The trace of $B$ along a path starting outside the hole dominates $u^0$. Indeed, if $D_0 \( x \) = 0$, then $D_0 \( x + t v \) lt.eq t \| v \|$, so the distance factor tends to one. If $D_0 \( x \) > 0$, its trace is zero, as is $u^0 \( x \, v \)$. The differential inequality can be integrated from a positive time and then passed to this trace. The positive-gain comparison used for Proposition 16, with the nonnegative loss omitted, yields $u lt.eq B$. This uses only absolute continuity along paths at positive times and boundedness in the $H$ norm; it does not differentiate the initial spatial mask. Since $e^(C_1 t)$ is bounded, (6.1) follows.
  For $t lt.eq 1 \/ 32$, the axial interval defining $cal(O)_i \( t \)$ has half-length
  $ a + 2 t + b_(upright("sp")) lt.eq 1 / 8 + 1 / 16 + 1 / 16 = 1 / 4 < 1 / 3 . $
  Its transverse distance from the corresponding lifted axis is at most $s_0$. Thus every point of $cal(O) \( t \)$ lies within distance $s_0$ of the segment defining the hole. Since the hole is its open $2 delta$ neighborhood, the triangle inequality gives $D_0 gt.eq 2 delta - s_0 gt.eq delta$ when $s_0 lt.eq delta$. ◻
]

We fix $t_1$ from now on. Recall that

$ cal(S) = 2 P^b \( c \, u \) + sum_(i eq.not i') P^b \( c_i \, c_(i') \) $

is the source in the hot equation: it consists of collisions between different cold colors and collisions between a cold color and the bath.

#thm([Lemma 6.2.])[
  (Source estimates).  #emph[For sufficiently small $s_0$ depending on $delta$, every finite evolution satisfies 
$ P \( c + u \, H \) lt.eq frac(C, t + s_N) H \, #h(2em) 0 lt.eq cal(S) lt.eq C_(A \, delta) t^(A - 1) H \, #h(2em) 0 < t lt.eq t_1 \, quad "(6.3)" $ <early:source>

 on its interval of existence, for every fixed $A > 0$. Here $C$ is independent of $delta$ and $R_mu$, and the constants are uniform for all sufficiently small $s_0$. No bound on $h$ is assumed.]
] <early:source-estimates>

#proof[
  At each $\( t \, x \)$ there is at most one main color. Denote it by $a$, taking $a = 0$ if no main color is present, and put $r = c - a$. The main-color measure bound in Lemma 17 and the sheet gain estimates, including Lemma 8, give
  $ P \( a \, H \) lt.eq frac(C, t + s_N) H . $
  By (5.11), for each $M > 0$,
  $ 0 lt.eq r lt.eq rho \( t \) H \, #h(2em) rho \( t \) lt.eq C_M t^M \, $
  uniformly for sufficiently small $s_0$. The bath bound gives $u lt.eq C H$. The quadratic gain bound of Lemma 9 proves the first estimate in (6.3), absorbing the bounded terms since $t + s_N lt.eq 2$.
  If $a eq.not 0$, (6.2) improves the bath estimate to $u lt.eq C e^(- c delta^2 \/ t) H$ at this position. The ordered cross-color sum is bounded by $2 P \( a \, r \) + P \( r \, r \)$, so positivity yields
  $ cal(S) lt.eq C (frac(e^(- c delta^2 \/ t) + rho \( t \), t + s_N) + rho \( t \) + rho \( t \)^2) H . $
  The exponential is bounded by any prescribed power of $t$, with a constant depending on that power and on $delta$. Taking $M = A$ proves the second estimate. When $a = 0$, only the last two types of terms remain, and the same conclusion follows. ◻
]

Set $Z \( t \) = parallel h \( t \) parallel_H$. Dropping the loss in the hot path equation and using (6.3), we obtain, on every interval where $Z lt.eq 1$,

$ Z \( t \) lt.eq Z \( r \) + integral_r^t (frac(C_2, s + s_N) Z \( s \) + C_(A \, delta) s^(A - 1)) thin upright(d) s \, #h(2em) 0 lt.eq r lt.eq t lt.eq t_1 . quad "(6.4)" $ <early:hot-comparison>

The constant $C_2$ includes the quadratic hot gain, because $Z^2 lt.eq Z$ and $s + s_N lt.eq 2$. It is independent of $delta$, $R_mu$, $s_0$, and $N$. We will use integral inequalities such as (6.4), without assuming differentiability of the norm $Z$.

=== 6.2 Selecting a solution that touches the cap <selecting-a-solution-that-touches-the-cap>

Fix the exponent in the seed (4.6) so that

$ p > C_2 + 1 \, #h(2em) A > p + C_2 + 3 \, #h(2em) m_T = T^p . quad "(6.5)" $ <early:exponents>

We call the solution with zero hot seed the #emph[dormant solution]. The following selection adapts the cap argument of #cite(label("OpenAIPeriodic")) Section 5; we give the continuity argument here for the present cutoff and color system.

#thm([Proposition 6.3.])[
  (Cap selection).  #emph[For fixed $delta > 0$, there are $macron(s)_0 \, T_0 > 0$, uniform in $N$ and the collision cutoff, with the following property. For each $0 < s_0 lt.eq macron(s)_0$, each $0 < T lt.eq T_0$, and each finite approximation, a seed parameter $lambda in \( 0 \, L_0 \)$ gives a solution on $\[ 0 \, T \]$ satisfying 
$ Z \( t \) lt.eq m_T \( t + s_N \) quad \( 0 lt.eq t lt.eq T \) \, #h(2em) max_(0 lt.eq t lt.eq T) frac(Z \( t \), m_T \( t + s_N \)) = 1 . quad "(6.6)" $ <early:cap>

 The dormant solution exists on a fixed initial interval and satisfies 
$ Z \( t \) lt.eq C'_(A \, delta) t^A . quad "(6.7)" $ <early:dormant-bound>

 The interval and constant in (6.7) are independent of $N$, the collision cutoff, and sufficiently small $s_0$.]
] <early:cap-selection>

#proof[
  For the dormant solution, the function $Y \( t \) = C_d t^A$ is a supersolution of (6.4) if
  $ C_d \( A - C_2 \) gt.eq C_(A \, delta) \, $
  because $\( t + s_N \)^(- 1) lt.eq t^(- 1)$. At each fixed $N$, comparison begins at the regular initial section $t = 0$, where both functions vanish. Choosing an initial interval on which $C_d t^A < 1 \/ 2$ closes the condition $Z lt.eq 1$. The cold and bath bounds are finite in the $H$ norm at each fixed approximation. Thus the continuation criterion of Proposition 13 also proves existence on that interval and gives (6.7).
  Reduce $T_0$ until this interval contains $\[ 0 \, T_0 \]$ and $C_d T_0^(A - p - 1) < 1$. Then, for $0 < t lt.eq T lt.eq T_0$,
  $ frac(Z \( t \), T^p \( t + s_N \)) lt.eq frac(C_d t^(A - 1), T^p) lt.eq C_d T^(A - p - 1) < 1 . $
  At $t = 0$ the ratio is zero. Hence the dormant solution stays strictly below the cap. At the other endpoint, $lambda = L_0$, the ratio at time zero equals $L_0 parallel chi parallel_H > 1$.
  Fix $T \, N$, and the cutoff. Let $I$ be the set of $lambda in \[ 0 \, L_0 \]$ whose solutions exist on $\[ 0 \, T \]$ and remain strictly below the cap there. Continuous dependence in the local theory and continuation at the terminal section make $I$ relatively open. It contains $0$ and does not contain $L_0$. Let $lambda_(*)$ be the right endpoint of the connected component of $I$ containing zero. Along a sequence $lambda_k arrow.t lambda_(*)$ within that component, all hot parts are bounded by the cap. The cold and bath estimates bound the remaining colors uniformly in $k$ in the fixed-approximation norm. The difference estimate in Proposition 13 therefore makes these solutions Cauchy, uniformly on $\[ 0 \, T \]$ in free coordinates. Their limit is the solution with parameter $lambda_(*)$ and satisfies the non-strict cap inequality.
  The norm $Z$ is continuous in time, and the cap denominator is positive, so the displayed ratio has a maximum. If that maximum were less than one, continuous dependence and continuation would place a neighborhood of $lambda_(*)$ in $I$, contrary to its endpoint property. Its maximum is therefore one. Since $0$ has a neighborhood in $I$, while $L_0 parallel chi parallel_H > 1$ also excludes a neighborhood of $L_0$, one has $0 < lambda_(*) < L_0$. A final reduction of $T_0$ makes the cap at most one on $\[ 0 \, T \]$ for every $T lt.eq T_0$. ◻
]

=== 6.3 Smallness through the fixed bath time <smallness-through-the-fixed-bath-time>

The pointwise estimate in (6.3) is very strong near zero, but its constant depends on the hole width. To reach the fixed time $t_1$ with an arbitrarily small hot part, we also use the shrinking spatial support of the main colors.

#thm([Lemma 6.4.])[
  (Small source along free paths).  #emph[Fix $0 < t_b < t_1$. There is a function $E_(t_b) \( s_0 \)$ tending to zero as $s_0 arrow.r 0$ such that, for every finite evolution and every terminal time $t in \[ t_b \, t_1 \]$ in its interval of existence, 
$ ∥integral_(t_b)^t cal(S) \( s \, x - \( t - s \) v \, v \) thin upright(d) s∥_H lt.eq E_(t_b) \( s_0 \) . quad "(6.8)" $ <early:source-integral>

 This estimate is uniform in the hot seed, the cap horizon, the approximation index, and the collision cutoff.]
] <early:path-source>

#proof[
  On $\[ t_b \, t_1 \]$, the nonmain bound (5.11) gives $r lt.eq epsilon \( s_0 \) H$, with $epsilon \( s_0 \) arrow.r 0$. The main-color sheet amplitude is bounded by $C \/ t_b$. Consequently all terms of $cal(S)$ containing a nonmain factor are bounded by $C_(t_b) epsilon \( s_0 \) H$, after enlarging $epsilon$ if needed.
  For the remaining main–bath term, define a deterministic majorant
  $ cal(U)_(upright("main")) \( s \, x \, v \) = sum_i upright(bold(1))_(cal(O)_i \( s \)) \( x \) cal(U)_i \( s \, x \, v \) \, #h(2em) U_(upright("bath")) \( v \) = C e^(- beta' \| v \|^2) \, $
  $ cal(S)_(upright("mb")) \( s \, x \, v \) = 2 P \( cal(U)_(upright("main")) \( s \, x \, dot.op \) \, U_(upright("bath")) \) \( v \) . $
  Here the sum includes all scales, so it bounds every finite selection; at each position it has at most one nonzero summand. By Proposition 16 and (6.1),
  $ 0 lt.eq cal(S) \( s \, x \, v \) lt.eq C_(t_b) epsilon \( s_0 \) H \( v \) + cal(S)_(upright("mb")) \( s \, x \, v \) \, #h(2em) t_b lt.eq s lt.eq t_1 . quad "(6.9)" $ <early:common-majorant>
  The sheet gain estimates give $cal(S)_(upright("mb")) lt.eq C_(t_b) H$. The uniform large-output estimate (3.16) gives
  $ sup_(s \, x \, thin \| v \| > R) frac(cal(S)_(upright("mb")) \( s \, x \, v \), H \( v \)) lt.eq omega_(t_b) \( R \) \, #h(2em) omega_(t_b) \( R \) arrow.r 0 quad \( R arrow.r oo \) \, quad "(6.10)" $ <early:output-tail>
  with essential suprema in the velocity variable. To handle velocities near the axis, fix $q' in \( 1 \, q \)$ and write
  $ H_(q') \( v \) = e^(- \| v \|^2) chevron.l v chevron.r^(- 100) \( 1 + \| macron(v) \|^(- q') \) . $
  Since $U_(upright("bath")) lt.eq C_(q') H_(q')$, the same sheet lemma with exponent $q'$ implies $cal(S)_(upright("mb")) lt.eq C_(t_b \, q') H_(q')$. Hence, for $0 < r lt.eq 1$,
  $ sup_(s \, x \, thin 0 < \| macron(v) \| < r) frac(cal(S)_(upright("mb")) \( s \, x \, v \), H \( v \)) lt.eq C_(t_b \, q') r^(q - q') . quad "(6.11)" $ <early:output-axis>
  Both estimates include the Gaussian-parameter measures in Lemma 17, by Lemma 8.
  It remains to consider the compact velocity region $\| v \| lt.eq R$, $\| macron(v) \| gt.eq r$. The spatial support of $cal(S)_(upright("mb"))$ is contained, for every $s lt.eq t_1$, in the projection of the fixed union
  $ union.big_(n in Lambda) #scale(x: 120%, y: 120%)[\(] n + B_(s_0)^2 times \[ - 1 \/ 4 \, 1 \/ 4 \] #scale(x: 120%, y: 120%)[\)] \, $
  where $B_(s_0)^2$ is the transverse disk of radius $s_0$. A lifted free path with $\| v \| lt.eq R$ and duration at most $t_1$ can meet only $C_R$ of these cylinders, uniformly in its endpoint: their centers must lie in a fixed bounded enlargement of a segment of length at most $R t_1$, and the lattice has a fixed separation. For any one cylinder, its transverse projection is crossed in time at most $2 s_0 \/ \| macron(v) \| lt.eq 2 s_0 \/ r$. Thus the normalized integral of $cal(S)_(upright("mb"))$ along such a path is bounded by $C_(t_b \, R) s_0 \/ r$. Combining the three velocity regions gives
  $ ∥integral_(t_b)^t cal(S) \( s \, x - \( t - s \) v \, v \) thin upright(d) s∥_H lt.eq C_(t_b) epsilon \( s_0 \) + t_1 omega_(t_b) \( R \) + C_(t_b \, q') t_1 r^(q - q') + C_(t_b \, R) s_0 / r . $
  First take $R$ large, then $r$ small, and finally $s_0$ small. This proves (6.8).
  All estimates above concern the common pointwise majorant (6.9), rather than values chosen separately on individual paths. To pass an almost-everywhere inequality to path integrals, use free coordinates $\( s \, x_0 \, v \) mapsto \( s \, x_0 + s v \, v \)$. This map preserves measure, so Fubini’s theorem gives the inequality at almost every time on almost every free path. Integration on those paths then defines representatives at every terminal section. Since free transport preserves $parallel dot.op parallel_H$, the resulting bound is precisely the essential norm in (6.8) at each fixed terminal time. The construction applies on any existing solution interval, so this lemma does not presuppose continuation to $t_1$. ◻
]

#thm([Proposition 6.5.])[
  (Uniform early continuation).  #emph[Fix $delta > 0$ and $zeta in \( 0 \, 1 \)$. There are $macron(s)_0 > 0$ and $T_0 in \( 0 \, t_1 \)$, depending on $delta$ and $zeta$ and on the fixed jet parameters, such that for every $0 < s_0 lt.eq macron(s)_0$, every finite approximation, and every $0 < T lt.eq T_0$, the dormant solution and every solution selected in Proposition 22 continue to $t_1$ and satisfy 
$ sup_(0 lt.eq t lt.eq t_1) parallel h \( t \) parallel_H lt.eq zeta . quad "(6.12)" $ <early:small-hot>

 The choices are uniform in $N$, the collision cutoff, $R_mu$, and $T$. For dormant solutions, (6.7) also holds on an initial interval independent of these indices, with the fixed exponent $A > p + 1$ chosen in (6.5).]
] <early:continuation>

#proof[
  We choose an intermediate time $t_b in \( 0 \, t_1 \)$ and then require $T_0 < t_b$. At the cap horizon, both the selected and dormant solutions satisfy
  $ Z \( T \) lt.eq T^p \( T + s_N \) lt.eq 2 T^p \, $
  using only $T \, s_N lt.eq 1$; no relation between $T$ and $s_N$ is needed. For $T lt.eq t lt.eq t_b$, (6.4) and $\( s + s_N \)^(- 1) lt.eq s^(- 1)$ give, while $Z lt.eq 1$,
  $ Z \( t \) lt.eq 2 T^(p - C_2) t^(C_2) + tilde(C)_(A \, delta) t^A . quad "(6.13)" $ <early:intermediate-bound>
  Indeed multiplication of the scalar comparison by $t^(- C_2)$ integrates the source to at most $C_(A \, delta) t^(A - C_2) \/ \( A - C_2 \)$.
  From $t_b$ onward, retain the source inside the path integral rather than using its pointwise bound. The same hot gain estimates and Lemma 23 give
  $ Z \( t \) lt.eq Z \( t_b \) + E_(t_b) \( s_0 \) + integral_(t_b)^t C_2 / s Z \( s \) thin upright(d) s . $
  Consequently, as long as $Z lt.eq 1$,
  $ sup_(t_b lt.eq t lt.eq t_1) Z \( t \) lt.eq (t_1 / t_b)^(C_2) (2 T_0^(p - C_2) t_b^(C_2) + tilde(C)_(A \, delta) t_b^A + E_(t_b) \( s_0 \)) \, quad "(6.14)" $ <early:final-comparison>
  where the supremum is restricted to the current interval of existence until continuation has been established.
  The order of choices now matters. Since $A > C_2$, choose $t_b$ so that
  $ tilde(C)_(A \, delta) t_1^(C_2) t_b^(A - C_2) < zeta / 6 . $
  Since $p > C_2$, reduce $T_0 < t_b$, within the range of Proposition 22, so that
  $ 2 T_0^(p - C_2) t_1^(C_2) < zeta / 6 \, #h(2em) 2 T_0^p < zeta / 2 . $
  Finally take $macron(s)_0$ small enough for all preceding cold and bath estimates and for
  $ (t_1 / t_b)^(C_2) E_(t_b) \( s_0 \) < zeta / 6 #h(2em) \( 0 < s_0 lt.eq macron(s)_0 \) . $
  The last choice is possible by Lemma 23. Equation (6.14) is then strictly below $zeta \/ 2$. The same first two choices make (6.13) strictly below $zeta \/ 2$ on $\[ T \, t_b \]$, and the cap gives the same bound on $\[ 0 \, T \]$.
  These estimates close the condition $Z lt.eq 1$ with a strict margin. At each fixed approximation the cold sum and bath have bounded $H$ norm through $t_1$, so the finite-evolution continuation criterion excludes a finite endpoint before $t_1$. This proves existence and (6.12) uniformly in all the stated indices. The dormant estimate was obtained independently on its initial interval and is preserved under this continuation. ◻
]

== 7 A uniform global bound for the finite evolutions <sec:global>

The estimates before $t_1$ give both families of finite evolutions a common starting point for continuation. We now prove that they exist for all time, with a uniform bound on the part of the density that contains the bath, the hot component, and the retired jets. The characteristic comparisons retain the color decomposition used in #cite(label("OpenAIPeriodic")) Sections 5–6. The additional control comes from the bath: the resulting small entropy distance of $F$ from $mu$ supplies a positive collision frequency and makes the nonlinear gain uniformly bounded after averaging along free flights. Entropy smallness and characteristic estimates also underlie the bounded-amplitude theory of #cite(label("DuanHuangWangYang2017")) Section 3. Here the cold components remain separate until retirement, while Lemma 10 controls the gain using a majorant singular on the velocity axis.

Recall from (4.9) that, for $t gt.eq t_1$,

$ F = c + w \, #h(2em) c = sum_(i upright(" active")) c_i \, #h(2em) w \( t_1 \) = u \( t_1 \) + h \( t_1 \) . quad "(7.1)" $ <global:decomposition>

Between retirement times the equation for $w$ is

$ \( D_t + nu_F^b \) w = P^b \( w \, w \) + 2 P^b \( c \, w \) + cal(S)_c \, #h(2em) cal(S)_c = sum_(i eq.not i' \, med i \, i' upright(" active")) P^b \( c_i \, c_(i') \) . quad "(7.2)" $ <global:w-equation>

The sum is ordered. At $L_s = s^(- 1 \/ 2)$ we add the jets of scale $s$ to $w$ and remove them from $c$, so that $F$ has no jump. All bounds below hold for the characteristic representatives, at each time section and almost everywhere in $\( x \, v \)$, as in the finite evolution construction.

The bath bound in 20 and 24, with $zeta < 1$, give a constant $B_0$ such that

$ parallel u \( t \) + h \( t \) parallel_H lt.eq B_0 quad \( 0 lt.eq t lt.eq t_1 \) . quad "(7.3)" $ <global:initial-bound>

Here $B_0$ is independent of the hole, the bath cutoff, the smallest scale, and the approximation. Fix provisionally $B > B_0 + 2$ and consider an interval of existence beginning at $t_1$ on which

$ 0 lt.eq w \( t \, x \, v \) lt.eq B H \( v \) . quad "(7.4)" $ <global:bootstrap>

We will improve this bound by a constant independent of $B$, after making the entropy error and the remaining small parameters sufficiently small depending on $B$.

=== 7.1 Averaging and a positive collision frequency <averaging-and-a-positive-collision-frequency>

The spatial entropy estimate is an $L_x^1$ bound, whereas our continuation argument needs estimates at almost every spatial point. Velocity integration along flights makes this passage possible. We first record the elementary averaging estimate in a form that also applies over arbitrarily long time intervals. Write $M_H = integral H \( v \) thin upright(d) v < oo$.

#thm([Lemma 7.1.])[
  (Averaging along free flights).  #emph[Let $A : \[ 0 \, oo \) times \( bb(R)^3 \/ Lambda \) arrow.r \[ 0 \, oo \)$ be measurable, write $A_s = A \( s \, dot.op \)$, and suppose 
$ sup_s parallel A_s parallel_oo lt.eq A_(*) \, #h(2em) sup_s parallel A_s parallel_1 lt.eq a_(*) . $

 For a fixed bounded velocity set $V$ and $rho > 0$, 
$ integral_V A_s \( x - tau v \) thin upright(d) v lt.eq C_(V \, rho) a_(*) #h(2em) \( tau gt.eq rho \) \, quad "(7.5)" $ <global:ball-average>

 uniformly in $x \, s \, tau$. If $A_(*)$ is fixed, the following quantities tend to zero as $a_(*) arrow.r 0$: 
$ & sup_(t gt.eq t_1 \, x) integral_(t_1)^t e^(- kappa \( t - s \)) integral H \( v \) A_s \( x - \( t - s \) v \) thin upright(d) v thin upright(d) s \,\
 & sup_(t gt.eq t_1 \, x) integral_0^(t_1) integral H \( v \) A_s \( x - \( t - s \) v \) thin upright(d) v thin upright(d) s \, quad "(7.6)" $ <global:damped-average>

 where $kappa > 0$ and $t_1 > 0$ are fixed. The supremum in $x$ is essential.]
] <global:flight-average>

#proof[
  Contain $V$ in a ball of radius $R$. The change of variables $z = x - tau v$ gives a factor $tau^(- 3)$. The image ball meets at most $C \( 1 + tau R \)^3$ translates of a fixed bounded fundamental cell of $Lambda$. Periodicity therefore gives
  $ integral_V A_s \( x - tau v \) thin upright(d) v lt.eq C tau^(- 3) \( 1 + tau R \)^3 parallel A_s parallel_1 \, $
  which proves (7.5). In particular, its constant does not grow when $tau$ tends to infinity.
  For $L gt.eq 1$ let
  $ H_L \( v \) = min { H \( v \) \, L } upright(bold(1))_({ \| v \| lt.eq L }) \, #h(2em) delta_L = integral \( H - H_L \) thin upright(d) v . $
  Then $delta_L arrow.r 0$, and (7.5) implies, for $tau gt.eq rho$,
  $ integral H \( v \) A_s \( x - tau v \) thin upright(d) v lt.eq A_(*) delta_L + C_(L \, rho) a_(*) . quad "(7.7)" $ <global:weighted-average>
  For $0 lt.eq tau < rho$, the same integral is at most $A_(*) M_H$. Consequently the expression in (7.6) is at most
  $ rho A_(*) M_H + kappa^(- 1) \( A_(*) delta_L + C_(L \, rho) a_(*) \) \, $
  and that in (7.6) is at most
  $ rho A_(*) M_H + t_1 \( A_(*) delta_L + C_(L \, rho) a_(*) \) . $
  Choose first $rho$ small, then $L$ large, and finally $a_(*)$ small. Both upper bounds tend to zero in this order. The same proof works when the time integrals are restricted to an interval of existence. ◻
]

Recall the entropy quantities from (4.12):

$ D_F \( t \, x \) & = integral chevron.l v chevron.r \| F \( t \, x \, v \) - mu \( v \) \| thin upright(d) v \, & parallel D_F \( t \) parallel_1 & lt.eq epsilon_E \,\
D_(-) \( t \, x \) & = integral chevron.l v chevron.r \( mu \( v \) - F \( t \, x \, v \) \)_(+) thin upright(d) v . quad "(7.8)" $ <global:entropy-distance>

The second quantity is bounded pointwise by $integral chevron.l v chevron.r mu \( v \) thin upright(d) v$, independently of the bootstrap. The first has a pointwise bound

$ D_F \( t \, x \) lt.eq C \( B \) \, #h(2em) t gt.eq t_1 \/ 2 \, quad "(7.9)" $ <global:moment-bound>

as long as (7.4) holds after $t_1$. Indeed, before $t_1$ use (7.3); after $t_1$ use $w lt.eq B H$. At every point there is at most one active main jet, whose mass and first moment are bounded by $C \/ \( t + s \) lt.eq 2 C \/ t_1$ by 17. The other jets are controlled by 18. These bounds prove (7.9) uniformly in the number of retained scales.

#thm([Lemma 7.2.])[
  (A collision frequency independent of the bootstrap size).  #emph[There is a constant $kappa > 0$, depending only on the fixed Maxwellian $mu$ and $t_1$, with the following property. For each fixed $B > B_0 + 2$, if $epsilon_E$ is sufficiently small depending on $B$, then every finite evolution satisfying (7.4) obeys 
$ nu_F^b \( t \, x \, v \) gt.eq kappa #h(2em) \( t gt.eq t_1 \) . quad "(7.10)" $ <global:frequency-bound>

 The constant is uniform for $b gt.eq 1$ and for all approximation indices.]
] <global:frequency>

#proof[
  Fix two closed velocity balls $V_1 \, V_2$ of positive radius with $"dist" \( V_1 \, V_2 \) > 3$, and put $V = V_1 union V_2$. All constants until the choice of the entropy tolerance may depend on these fixed balls. Since $b gt.eq 1$ and $mu$ is a Maxwellian,
  $ P^b \( mu \, mu \) \( v \) = mu \( v \) nu_mu^b \( v \) gt.eq mu \( v \) nu_mu^1 \( v \) gt.eq m_0 > 0 #h(2em) \( v in V \) . $
  At a fixed $\( t \, x \)$ write $d = \( mu - F \)_(+)$. Positivity of the gain and $F gt.eq mu - d$ imply
  $ P^b \( F \, F \) gt.eq P^b \( mu - d \, mu - d \) gt.eq P^b \( mu \, mu \) - 2 P \( mu \, d \) . $
  By the plane formula (3.1), the Gaussian integral over each plane is bounded, so
  $ P \( mu \, d \) \( v \) lt.eq C integral frac(d \( p \), \| p - v \|) thin upright(d) p . $
  For $\| p - v \| < r$, use $d lt.eq mu lt.eq 1$ to bound this integral by $C r^2$; for $\| p - v \| gt.eq r$, it is at most $C r^(- 1) D_F \( t \, x \)$. Choose $r > 0$ once so that the first contribution to $2 P \( mu \, d \)$ is at most $m_0 \/ 2$. With $m_(*) = m_0 \/ 2$ and a fixed constant $C$, we obtain
  $ P^b \( F \, F \) \( t \, x \, v \) gt.eq m_(*) - C D_F \( t \, x \) \, #h(2em) nu_F^b \( t \, x \, v \) lt.eq C + C D_F \( t \, x \) \, #h(2em) v in V . quad "(7.11)" $ <global:gain-lower>
  The second inequality follows directly from $min { b \, \| v - p \| } lt.eq \| v - p \| lt.eq C chevron.l p chevron.r$ on $V$.
  Let $Delta = t_1 \/ 2$, fix $t gt.eq t_1$, and write $X_tau = x - \( t - tau \) v$. The Duhamel formula for the total density, whose value is continuous through retirements, gives
  $ F \( t \, x \, v \) gt.eq integral_(t - Delta)^(t - Delta \/ 2) e^(- integral_s^t nu_F^b \( tau \, X_tau \, v \) thin upright(d) tau) P^b \( F \, F \) \( s \, X_s \, v \) thin upright(d) s . $
  Using (7.11), $e^(- a) gt.eq 1 - a$ for $a gt.eq 0$, and the upper bound $1$ for a survival factor, the integrand is bounded below by
  $ m_(*) e^(- C Delta) (1 - C integral_s^t D_F \( tau \, X_tau \) thin upright(d) tau) - C D_F \( s \, X_s \) . quad "(7.12)" $ <global:survival-lower>
  This inequality remains valid when its right side is negative.
  Integrate (7.12) over $s$ and over either ball $V_k$. The positive constant contributes
  $ a_k := \| V_k \| \( Delta \/ 2 \) m_(*) e^(- C Delta) > 0 . $
  Choose $0 < rho < Delta \/ 2$. For $t - tau gt.eq rho$, (7.5) and (7.8) give
  $ integral_(V_k) D_F \( tau \, x - \( t - tau \) v \) thin upright(d) v lt.eq C_(V_k \, rho) epsilon_E . quad "(7.13)" $ <global:entropy-flight>
  The term $D_F \( s \, X_s \)$ always has $t - s gt.eq Delta \/ 2$. Its integrated cost is therefore $C_rho epsilon_E$. For the double time integral in (7.12), the portion with $t - tau gt.eq rho$ has the same type of bound, whereas the remaining portion costs at most $C \( B \) rho$ by (7.9). Thus
  $ integral_(V_k) F \( t \, x \, v \) thin upright(d) v gt.eq a_k - C_rho epsilon_E - C \( B \) rho . $
  After $B$ has been fixed, choose $rho$ to make the last term at most $min \( a_1 \, a_2 \) \/ 4$, and then choose $epsilon_E$ to make the middle term at most the same quantity. It follows that
  $ integral_(V_k) F \( t \, x \, v \) thin upright(d) v gt.eq a_k \/ 2 #h(2em) \( k = 1 \, 2 \) . $
  For any velocity $v$, one of the balls has distance at least $1$ from $v$: otherwise their mutual distance would be less than $2$. On that ball $min { b \, \| v - p \| } gt.eq 1$. Consequently
  $ nu_F^b \( t \, x \, v \) = 2 pi integral min { b \, \| v - p \| } F \( t \, x \, p \) thin upright(d) p gt.eq pi min \( a_1 \, a_2 \) = : kappa . $
  Only the entropy tolerance, and not this value of $kappa$, depended on $B$. ◻
]

The positive frequency gives exponential decay to every active jet. Specifically, (5.7) yields

$ c_i \( t \, x \, v \) lt.eq e^(- kappa \( t - t_1 \)) cal(U)_i \( t \, x \, v \) \, #h(2em) t_1 lt.eq t lt.eq L_(s_i) . quad "(7.14)" $ <global:cold-decay>

At a point in the active tube union $cal(O) \( t \)$ there is at most one main color. Its sheet amplitude is at most $C \/ t_1$; outside the union all colors are nonmain. Applying 6 and 18, and enlarging its small coefficient if necessary, gives constants $C_3 \, C_4$ independent of $B$ such that

$ P \( c \, H \) & lt.eq C_3 e^(- kappa \( t - t_1 \)) H #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(cal(O) \( t \)) + theta_0 #scale(x: 120%, y: 120%)[\)] \,\
cal(S)_c & lt.eq C_4 theta_0 H \, quad "(7.15)" $ <global:cold-gain>

where $theta_0 = theta_0 \( s_0 \) arrow.r 0$ as $s_0 arrow.r 0$. For the second estimate, if $c_(*)$ is the main color and $r$ the sum of the remaining colors, the ordered cross sum is at most $2 P \( c_(*) \, r \) + P \( r \, r \)$. Here $r lt.eq theta_0 e^(- 4 \| v \|^2)$ and the sheet bound controls $P \( c_(*) \, H \)$; if there is no main color use $c lt.eq theta_0 e^(- 4 \| v \|^2)$ and 9.

At a retirement time, 19 and (7.14) bound the increment of $w$ by $J_s H$, where

$ J_s = C s^(- C) e^(- kappa \( L_s - t_1 \)) \, #h(2em) sum_s J_s lt.eq J_0 \( s_0 \) := sum_(j gt.eq 1) C s_j^(- C) e^(- kappa \( s_j^(- 1 \/ 2) - t_1 \)) arrow.r 0 . quad "(7.16)" $ <global:retirement>

This follows for the one-sided trace just before retirement, using only the bootstrap up to that time. To check the last limit explicitly, the exponential dominates every power of $s$: for sufficiently small $s$, $C s^(- C) e^(- kappa \( s^(- 1 \/ 2) - t_1 \)) lt.eq s^2$. The remaining geometric sum is at most $s_0^2 \/ \( e^(2 eta) - 1 \)$. In particular the sum of all retirement increments can be made small uniformly in $N$.

=== 7.2 Small excess mass and a bounded nonlinear gain <small-excess-mass-and-a-bounded-nonlinear-gain>

The remaining obstruction is the quadratic term $P^b \( w \, w \)$: estimating it directly from $w lt.eq B H$ would produce a constant of order $B^2$. Instead we compare $w$ with the fixed Maxwellian. Entropy bounds the spatial integral of its positive excess, and the preceding flight estimate converts that bound into small excess mass at each position. The small-mass gain estimate then controls the quadratic term by a constant chosen before $B$.

#thm([Lemma 7.3.])[
  (Uniform nonlinear gain).  #emph[Let $B > B_0 + 2$ be fixed and suppose (7.4) holds on an interval beginning at $t_1$. After taking $epsilon_E$, $zeta$, and $s_0$ sufficiently small depending on $B$, one has on that interval 
$ P^b \( w \, w \) lt.eq C_5 H \, #h(2em) C_5 := parallel P \( mu \, mu \) parallel_H + 1 . quad "(7.17)" $ <global:gain-bound>

 In particular, $C_5$ is independent of $B$, the approximation, and the cap horizon. The estimate holds also at the appropriate one-sided sections of retirement times.]
] <global:gain>

#proof[
  Choose the entropy tolerance small enough for 26, so that the damping constant $kappa$ and (7.15)–(7.16) are available. Define
  $ j = \( w - mu \)_(+) \, #h(2em) m_j \( t \, x \) = integral j \( t \, x \, v \) thin upright(d) v . quad "(7.18)" $ <global:excess>
  Since $w lt.eq F$ and $j lt.eq B H$,
  $ 0 lt.eq m_j lt.eq B M_H \, #h(2em) parallel m_j \( t \) parallel_1 lt.eq epsilon_E . quad "(7.19)" $ <global:excess-mass>
  Write $C_mu = parallel mu parallel_H < oo$ and $A_B = 2 C_mu + B$. The inequality $w lt.eq mu + j$, bilinearity, and positivity give
  $ P^b \( w \, w \) - P^b \( mu \, mu \) lt.eq 2 P \( mu \, j \) + P \( j \, j \) lt.eq A_B P \( H \, j \) . quad "(7.20)" $ <global:gain-difference>
  The frequency deficit has the bound
  $ \( nu_mu^b - nu_F^b \) mu lt.eq 2 pi mu \( v \) integral \| v - p \| \( mu \( p \) - F \( p \) \)_(+) thin upright(d) p lt.eq C H \( v \) D_(-) . quad "(7.21)" $ <global:loss-difference>
  Here $mu \( v \) chevron.l v chevron.r lt.eq C H \( v \)$.
  Between retirements, subtracting the stationary Maxwellian equation from (7.2) gives
  $ \( D_t + nu_F^b \) \( w - mu \) = P^b \( w \, w \) - P^b \( mu \, mu \) + \( nu_mu^b - nu_F^b \) mu + 2 P^b \( c \, w \) + cal(S)_c . $
  The chain rule for the positive part on almost every free flight therefore gives an upper comparison for $j$ with damping $kappa$. Using 10 in (7.20), and then (7.21), (7.15), and (7.15), shows that for each $epsilon.alt > 0$ its positive source is at most $H \( v \) R \( s \, x \)$, where
  $ R \( s \, x \) = epsilon.alt + C_(B \, epsilon.alt) m_j \( s \, x \) + C D_(-) \( s \, x \) + C \( B \) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(cal(O) \( s \)) \( x \) + theta_0 #scale(x: 120%, y: 120%)[\)] . quad "(7.22)" $ <global:excess-source>
  Constants have been enlarged to absorb $A_B$. At a retirement time, the increase of $j$ is at most the increase of $w$, because $\( a + d \)_(+) - a_(+) lt.eq d$ for $d gt.eq 0$. Thus its increments are bounded by the same $J_s H$ as in (7.16).
  We also need to estimate the excess already present in the bath at $t_1$. Put $j_u = \( u - mu \)_(+)$ and $m_(j_u) = integral j_u thin upright(d) v$ for $0 lt.eq s lt.eq t_1$. The bath starts below $mu$, so $j_u \( 0 \) = 0$; 20 gives the fixed bound $j_u lt.eq B_0 H$. Since $u lt.eq F$,
  $ parallel m_(j_u) \( s \) parallel_oo lt.eq B_0 M_H \, #h(2em) parallel m_(j_u) \( s \) parallel_1 lt.eq epsilon_E . quad "(7.23)" $ <global:bath-excess-mass>
  The bath equation is $\( D_t + nu_F^b \) u = P^b \( u \, u \)$. Subtracting the Maxwellian equation and applying the same two difference estimates as above gives, now discarding the nonnegative damping, a source bounded by $H \( v \) R_u \( s \, x \)$, where
  $ R_u \( s \, x \) = epsilon.alt + C_(B_0 \, epsilon.alt) m_(j_u) \( s \, x \) + C D_(-) \( s \, x \) . quad "(7.24)" $ <global:bath-excess-source>
  The cold density appears only through the frequency deficit, which is controlled by $D_(-)$. No positive source involving a cold gain occurs in this bath equation.
  At $t_1$, the hot bound gives $j \( t_1 \) lt.eq j_u \( t_1 \) + zeta H$. Continue the same backward free flight through $t_1$, and write $X_s = x - \( t - s \) v$. The two comparisons, together with all intervening retirements, imply
  $ frac(j \( t \, x \, v \), H \( v \)) lt.eq zeta + J_0 + integral_0^(t_1) R_u \( s \, X_s \) thin upright(d) s + integral_(t_1)^t e^(- kappa \( t - s \)) R \( s \, X_s \) thin upright(d) s . quad "(7.25)" $ <global:excess-path>
  We have dropped damping from the initial and retirement contributions; doing so also allows the bath comparison to run along that one flight all the way back to zero.
  We claim that the velocity integral of the right side times $H$ can be made smaller than any prescribed number $tau > 0$, uniformly in $\( t \, x \)$ on the bootstrap interval. The constant terms contribute at most
  $ M_H (zeta + J_0 + epsilon.alt \( t_1 + kappa^(- 1) \) + kappa^(- 1) C \( B \) theta_0) . quad "(7.26)" $ <global:constant-errors>
  For the remaining terms, all the spatial functions in question have a fixed pointwise upper bound once $B$ is fixed: $m_j lt.eq B M_H$, $m_(j_u) lt.eq B_0 M_H$, $D_(-) lt.eq integral chevron.l v chevron.r mu thin upright(d) v$, and $upright(bold(1))_(cal(O) \( s \)) lt.eq 1$. Their spatial integrals are respectively bounded by $epsilon_E$, $epsilon_E$, $epsilon_E$, and $C s_0^(3 \/ 2)$, the last by (5.13). Apply 25 to each term, with its coefficient in (7.22) or (7.24). For clarity, the choices are made in the following order. First choose $epsilon.alt$ so that its contribution to (7.26) is less than $tau \/ 4$; all the coefficients $C_(B \, epsilon.alt)$ and $C_(B_0 \, epsilon.alt)$ are then fixed. For each of the finitely many averaged terms, choose the time deletion length $rho$ and the truncation $H_L$ in the proof of that lemma so that the endpoint and velocity-tail errors, including its coefficient, have total less than $tau \/ 4$. Next make $epsilon_E$ and $s_0$ sufficiently small for the remaining averaged errors to total less than $tau \/ 4$. Finally take $zeta$ small and, if necessary, reduce $s_0$ further to make the other terms in (7.26) less than $tau \/ 4$. All these choices are uniform in the endpoint time. Thus
  $ m_j \( t \, x \) lt.eq tau . quad "(7.27)" $ <global:small-excess>
  The same calculation on a pre-retirement section includes only the jumps that have already occurred, so it does not require a post-jump bootstrap hypothesis.
  It remains to select the particular smallness threshold that controls the gain. Apply 10 once more, now with $epsilon.alt' = 1 \/ \( 2 A_B \)$. Write its constant as $C_(B \, epsilon.alt')$ and set
  $ tau = frac(1, 2 A_B max { 1 \, C_(B \, epsilon.alt') }) . $
  Choose the parameters in the preceding argument to give (7.27) for this $tau$. Then
  $ A_B P \( H \, j \) lt.eq A_B H #scale(x: 120%, y: 120%)[\(] epsilon.alt' + C_(B \, epsilon.alt') m_j #scale(x: 120%, y: 120%)[\)] lt.eq H . $
  Equation (7.20) and $P^b \( mu \, mu \) lt.eq P \( mu \, mu \)$ prove (7.17). The latter has finite $H$ norm because $P \( mu \, mu \) = mu nu_mu$ is a Gaussian times a function of at most linear growth. ◻
]

=== 7.3 Parameter choice and continuation <parameter-choice-and-continuation>

We can now choose the bootstrap size and then realize all the smallness requirements imposed above. This order is essential: both the damping rate and the ultimate gain bound have already been fixed independently of the provisional value $B$.

#thm([Proposition 7.4.])[
  (Uniform global continuation).  #emph[The construction parameters can be fixed so that every dormant finite evolution and every cap solution with $0 < T lt.eq T_0$ continues globally. There are constants $B < oo$ and $kappa > 0$, independent of $N$, $b_N gt.eq 1$, and $T$, such that 
$ parallel w \( t \) parallel_H lt.eq B \, #h(2em) nu_F^(b_N) \( t \, x \, v \) gt.eq kappa \, #h(2em) t gt.eq t_1 . quad "(7.28)" $ <global:uniform-bound>

 Every active jet satisfies (7.14) through its retirement, the total retirement increment is bounded by (7.16), and the hot component satisfies the small bound of 24 on $\[ 0 \, t_1 \]$.]
] <prop:global-control>

#proof[
  On a bootstrap interval let $Z_w \( t \) = parallel w \( t \) parallel_H$. The Duhamel formula for (7.2), with all retirement increments included, and (7.10), (7.15), (7.15), and (7.17), give
  $ Z_w \( t \) lt.eq  & e^(- kappa \( t - t_1 \)) B_0 + frac(C_5 + C_4 theta_0, kappa) + J_0\
 & + 2 C_3 \( 1 + theta_0 \) integral_(t_1)^t e^(- kappa \( t - s \)) e^(- kappa \( s - t_1 \)) Z_w \( s \) thin upright(d) s . $
  Take $s_0$ small enough that $theta_0 \, J_0 lt.eq 1$ and discard the first exponential in the last integrand. We obtain
  $ Z_w \( t \) lt.eq B_0 + frac(C_4 + C_5, kappa) + 1 + 4 C_3 integral_(t_1)^t e^(- kappa \( s - t_1 \)) Z_w \( s \) thin upright(d) s . quad "(7.29)" $ <global:scalar-bootstrap>
  The integral version of Gronwall’s inequality therefore gives
  $ Z_w \( t \) lt.eq (B_0 + frac(C_4 + C_5, kappa) + 1) exp (frac(4 C_3, kappa)) = : B_(*) . quad "(7.30)" $ <global:strict-improvement>
  The constants defining $B_(*)$ were fixed before $B$.
  Here is the complete order of parameter choices. Fix the kernel and jet parameters, the narrow width factor, the Maxwellian $mu$, and the short time $t_1$ as in the preceding sections; also fix the early growth exponent $p$ there. The bath estimate fixes $B_0$. The proof of 26 fixes $kappa$ from $mu$, $t_1$, and the two chosen balls, without imposing its entropy tolerance yet. The cold estimates then fix $C_3 \, C_4$ uniformly for sufficiently small $s_0$, while $C_5 = parallel P \( mu \, mu \) parallel_H + 1$ is already fixed. Choose
  $ B > max { B_0 + 2 \, B_(*) + 3 } . $
  For this $B$, prescribe the entropy tolerance required by 26, and the possibly smaller entropy tolerance, hot tolerance $zeta$, and upper bounds on $s_0$ required by 27. Include $theta_0 \, J_0 lt.eq 1$ among these requirements.
  To realize the entropy tolerance, take the hole radius $delta$ small and the bath velocity cutoff $R_mu$ large. Their contributions to the initial relative entropy can then be made arbitrarily small. With these parameters fixed, the jet and seed contributions become arbitrarily small as $s_0 arrow.r 0$, as proved in (4.12) and its derivation. To realize the prescribed $zeta$, use 24: choose its auxiliary time $t_b$ and horizon upper bound $T_0$ after $delta \, zeta$, and then take $s_0$ sufficiently small for its source estimate. Decrease $s_0$ further to meet the entropy, separation, cold-gain, and retirement requirements already listed. Reducing $T_0$ when required by the early estimates preserves all later estimates. These are fixed construction parameters; none depends on $N$, on the chosen cap solution, or on its horizon $T in \( 0 \, T_0 \]$.
  For completeness, the strict estimate closes the bootstrap even at retirement times. At $t_1$ it starts by (7.3). On an interval with no retirement, the characteristic equations make the weighted norm continuous, and (7.30) bounds it by $B_(*) < B - 3$ as long as it is at most $B$. Thus it cannot first reach $B$ there. At a retirement time $L_s$, apply the argument only up to the left-hand section. The cold comparison on that interval and (7.16) give
  $ Z_w \( L_s + \) lt.eq Z_w \( L_s - \) + J_s lt.eq B_(*) + 1 < B - 2 . $
  This starts the bootstrap on the next interval without having assumed its conclusion across the jump. The total density and its entropy bound are unchanged by this relabeling.
  Finally, at each fixed approximation only finitely many scales occur. The cold barriers bound the sum of the active colors in $H$ norm on every finite interval, with constants allowed to depend on that approximation. The uniform bound on $w$ therefore bounds the total $H$ norm on every such interval. The cutoff local existence and continuation argument from the construction excludes a finite maximal existence time. There are only finitely many retirements at that approximation, after which $F = w$. This proves global existence and (7.28), with all the stated auxiliary estimates. ◻
]

== 8 Global limits and local conservation <sec:compactness>

The uniform bounds of Proposition 28 allow us to remove both the collision cutoff and the truncation of the initial jets. The relevant compactness is stronger than a bound on mass and entropy: the same-position collision products are uniformly integrable, with polynomial velocity weights. This will preserve the local energy flux and rule out defects in all five collision-invariant balances. The argument extends the fixed-horizon compactness proof of #cite(label("OpenAIPeriodic")) Section 6 to the global approximations constructed here; we give the proof, including the averaging step.

#thm([Proposition 8.1.])[
  #emph[Fix the construction parameters supplied by Proposition 28, and let $b_N arrow.r oo$. Either the dormant family, or a family of cap solutions at one fixed horizon $T in \( 0 \, T_0 \]$, has a subsequence of total densities $F_N$ converging weakly in $L^1 \( \[ 0 \, tau \] times Omega \)$ for every $tau < oo$ to a nonnegative density $F$. This subsequence can be chosen so that $F_N \( t \) harpoon.rt F \( t \)$ in $L^1 \( Omega \)$ at every $t gt.eq 0$, with uniformly small polynomially weighted velocity tails on each bounded time interval.]
  #emph[The limit has initial datum $F_0$ and is a global entropy solution obeying local conservation in the sense of Definition 1. More precisely, 
$ F in C \( \[ 0 \, oo \) \; L^1 \( Omega \) \) \, #h(2em) integral_0^tau #h(-1em) integral_Omega chevron.l v chevron.r^k #scale(x: 120%, y: 120%)[\(] F + Q^(+) \( F \, F \) + Q^(-) \( F \, F \) #scale(x: 120%, y: 120%)[\)] thin upright(d) x thin upright(d) v thin upright(d) t < oo quad \( k gt.eq 0 \, med tau < oo \) . quad "(8.1)" $ <comp:strong-properties>

 Total mass, momentum, and energy are conserved at every time. The common early-time pointwise majorant of the dormant approximations also bounds any dormant limit.]
] <prop:global-limits>

Throughout the proof, $T$ denotes the fixed cap horizon when the cap family is used, whereas $tau$ denotes an arbitrary finite observation time. Constants may depend on $tau$, but not on $N$ or $b_N$. We write

$ Q_N^plus.minus = Q^(plus.minus \, b_N) \( F_N \, F_N \) \, #h(2em) R_(k \, N) \( t \, x \) = integral_(bb(R)^3) chevron.l v chevron.r^k F_N \( t \, x \, v \) thin upright(d) v . $

The initial convergence is supplied by Lemma 12; the finite-approximation entropy inequalities and local conservation laws are those of Proposition 13.

=== 8.1 Small scales and uniform integrability <small-scales-and-uniform-integrability>

Recall that a color of scale $s = s_j$ remains active until $L_s = s^(- 1 \/ 2)$. Let $cal(A)_s \( t \)$ be the union, in one periodic cell, of its two signs’ enlarged sets $cal(O)_i \( t \)$, including all lattice copies, when $t lt.eq L_s$; set $cal(A)_s \( t \) = diameter$ for $t > L_s$. We use these sets for every scale, even if that scale is absent from a particular finite approximation. The active enlarged sets are disjoint. Their axial lengths on $\[ 0 \, tau \]$ are bounded by $C_tau$, so

$ \| cal(A)_s \( t \) \| lt.eq C_tau s^2 #h(2em) \( 0 lt.eq t lt.eq tau \) . $

The free-core amplitude estimate, the cold remainder bound, and the bounds on the bath and the hot or regular part imply

$ R_(k \, N) \( t \, x \) lt.eq C_(k \, tau) (1 + sum_(j gt.eq 1) frac(upright(bold(1))_(cal(A)_(s_j) \( t \)) \( x \), t + s_j)) . quad "(8.2)" $ <comp:moment-envelope>

Here the bounded term includes all nonmain colors and all retired colors: after retirement they belong to $w lt.eq B H$. For active main colors the estimate follows from Lemma 17 and Proposition 16; the nonmain contribution is controlled by Lemma 18.

The square of this envelope controls the collision products. Disjointness ensures that no product of two distinct singular terms appears when it is squared, and one scale contributes at most

$ integral_0^tau frac(C_tau s^2, \( t + s \)^2) thin upright(d) t = C_tau s^2 (1 / s - frac(1, tau + s)) lt.eq C_tau s . quad "(8.3)" $ <comp:annular-square>

For $epsilon > 0$, put $cal(A)_(< epsilon) \( t \) = union.big_(s_j < epsilon) cal(A)_(s_j) \( t \)$. Since the scales form a geometric sequence,

$ sup_N integral_0^tau #h(-1em) integral_(cal(A)_(< epsilon) \( t \)) R_(k \, N) \( t \, x \)^2 thin upright(d) x thin upright(d) t lt.eq C_(k \, tau) sum_(s_j < epsilon) \( s_j + s_j^2 \) arrow.r 0 #h(2em) \( epsilon arrow.b 0 \) . quad "(8.4)" $ <comp:small-annuli>

The first power of the envelope gives, uniformly at individual times,

$ sup_(N \, thin 0 lt.eq t lt.eq tau) integral_(cal(A)_(< epsilon) \( t \)) R_(k \, N) \( t \, x \) thin upright(d) x lt.eq C_(k \, tau) sum_(s_j < epsilon) \( s_j + s_j^2 \) arrow.r 0 . quad "(8.5)" $ <comp:fixed-time-small>

These estimates include retirement times, because a color may be included in its last active enlargement at that section and is covered by the bound on $w$ thereafter.

Outside $cal(A)_(< epsilon) \( t \)$, a main color can have only one of the finitely many scales $s_j gt.eq epsilon$. Their thermal widths are positive and fixed. The Gaussian velocity bounds and the summation over lattice copies therefore give

$ F_N \( t \, x \, v \) lt.eq Psi_(epsilon \, tau) \( v \) quad upright("if ") x in.not cal(A)_(< epsilon) \( t \) \, #h(2em) 0 lt.eq Psi_(epsilon \, tau) lt.eq C_(epsilon \, tau) H . quad "(8.6)" $ <comp:fixed-majorant>

The same majorant includes the bounded hot, bath, and retired parts, and the Gaussian nonmain tails. In particular it has every polynomial velocity moment; its singularity on the velocity axis is integrable.

Equations (8.4)–(8.6) prove uniform integrability in the full spacetime and two-velocity variables of

$ chevron.l v chevron.r^k chevron.l v_(*) chevron.r^k F_N \( t \, x \, v \) F_N \( t \, x \, v_(*) \) \, #h(2em) k gt.eq 0 . quad "(8.7)" $ <comp:weighted-pairs>

Indeed their integrals on the removed spatial sets are bounded by (8.4); on the complement they are dominated by the fixed integrable function $chevron.l v chevron.r^k Psi_(epsilon \, tau) \( v \) chevron.l v_(*) chevron.r^k Psi_(epsilon \, tau) \( v_(*) \)$. First make the removed contribution small, and then use absolute continuity of this fixed integral on arbitrary small measurable sets. The same decomposition gives uniformly small weighted velocity tails. Using the first power instead of the square proves the corresponding one-particle assertions, both in spacetime and, by (8.5), uniformly at all individual times.

The separate collision terms satisfy the same spacetime conclusions. Collision symmetry and conservation of the sum of squared speeds give

$ integral_(bb(R)^3) chevron.l v chevron.r^k Q_N^plus.minus \( t \, x \, v \) thin upright(d) v lt.eq C_k R_(k + 1 \, N) \( t \, x \)^2 . quad "(8.8)" $ <comp:collision-moments>

For the gain, this follows by placing the velocity weight on an outgoing particle and using $chevron.l v' chevron.r^k \| v - v_(*) \| lt.eq C_k chevron.l v chevron.r^(k + 1) chevron.l v_(*) chevron.r^(k + 1)$; the loss is estimated directly. The cutoff factor is at most one. Thus (8.4) controls their weighted integrals on the removed sets. On the complement, positivity gives

$ Q_N^(+) lt.eq P \( Psi_(epsilon \, tau) \, Psi_(epsilon \, tau) \) \, #h(2em) Q_N^(-) lt.eq Psi_(epsilon \, tau) nu_(Psi_(epsilon \, tau)) . $

Both majorants have every polynomial moment, either by (8.8) for the fixed density $Psi_(epsilon \, tau)$ or by the bounds on $H$. Consequently ${ Q_N^plus.minus }$ is uniformly integrable with every fixed polynomial velocity weight. Its integrals over time intervals whose length tends to zero vanish uniformly in $N$: the small-scale contribution can first be discarded, and the remaining fixed majorants have integrals proportional to the length of the interval.

=== 8.2 Velocity averaging with uniformly integrable sources <velocity-averaging-with-uniformly-integrable-sources>

Weak compactness alone does not identify a product evaluated at the same spatial point. We obtain the needed compactness of velocity averages from the transport equation. The following elementary form of the averaging principle of Golse, Lions, Perthame, and Sentis #cite(label("GolseLionsPerthameSentis1988")) is also proved in #cite(label("OpenAIPeriodic")) Section 6.

#thm([Lemma 8.2.])[
  #emph[Let $f_n \, g_n$ be locally uniformly integrable in $L^1$ on an open region of time, space, and velocity, and suppose that $\( partial_t + v dot.op nabla_x \) f_n = g_n$ there in distributions. For every smooth compactly supported velocity test $psi$, the averages $integral psi \( v \) f_n \( t \, x \, v \) thin upright(d) v$ are relatively compact in local $L_(t \, x)^1$ wherever the hypotheses hold for all velocities in a neighborhood of $"supp" psi$. The spatial domain may be a flat torus or an open subset of $bb(R)^3$.]
] <comp:averaging>

#proof[
  Localize to a compact time-space set and a compact velocity neighborhood of $"supp" psi$, using smooth cutoffs. Denote the localized functions by $q_n$, extend them by zero, and set $r_n = \( 1 + partial_t + v dot.op nabla_x \) q_n$. The equation shows that $r_n$ is uniformly integrable in $L^1$ and has support in a fixed bounded set of time and velocity, and also of space in the Euclidean case. Spatial cutoff derivatives cause no difficulty because velocity has been localized. Integration from a time preceding the support gives
  $ q_n \( t \, x \, v \) = integral_0^oo e^(- s) r_n \( t - s \, x - s v \, v \) thin upright(d) s = : R r_n \( t \, x \, v \) . $
  The damped inverse $R$ is an $L^1$ contraction, since free transport preserves Lebesgue measure.
  Truncate $r_n$ at height $L$, preserving its sign, to obtain $r_n^(\( L \))$. Uniform integrability implies
  $ sup_n parallel r_n - r_n^(\( L \)) parallel_1 arrow.r 0 quad \( L arrow.r oo \) \, #h(2em) sup_n parallel r_n^(\( L \)) parallel_2 < oo quad upright("for fixed ") L . $
  The velocity averages of $R \( r_n - r_n^(\( L \)) \)$ are therefore uniformly small in $L^1$. It remains to prove compactness for a bounded $L^2$ family of right-hand sides.
  Take Fourier transform in $\( t \, x \)$, with Fourier series in the torus case. For $u_n = R r_n^(\( L \))$, Cauchy–Schwarz yields
  $ lr(|integral psi \( v \) hat(u)_n \( sigma \, k \, v \) thin upright(d) v|)^2 lt.eq I_psi \( sigma \, k \) integral \| hat(r)_n^(\( L \)) \( sigma \, k \, v \) \|^2 thin upright(d) v \, #h(2em) I_psi \( sigma \, k \) = integral frac(\| psi \( v \) \|^2, 1 + \( sigma + k dot.op v \)^2) thin upright(d) v . $
  If $"supp" psi subset { \| v \| lt.eq R_0 }$, integration in the direction of $k$ gives $I_psi lt.eq C_psi \/ \| k \|$ for $k eq.not 0$. When $\| sigma \| > 2 R_0 \| k \|$, the denominator instead gives $I_psi lt.eq C_psi \/ \( 1 + \| sigma \|^2 \)$. Thus $I_psi arrow.r 0$ uniformly as $\| sigma \| + \| k \| arrow.r oo$. Plancherel’s theorem shows that the averages have uniformly small high-frequency $L^2$ tails. Convolution with a fixed smooth approximate identity consequently approximates them uniformly in $L^2$. On every compact time-space set these convolutions are bounded and equicontinuous, by Cauchy–Schwarz applied to translates of the convolution kernel and its derivatives. They are relatively compact there. This proves local $L^2$, and hence local $L^1$, compactness at fixed $L$; the uniform $L^1$ error as $L arrow.r oo$ completes the proof. The argument applies unchanged to the dual lattice of a rotated torus. ◻
]

=== 8.3 Identification of the collision terms <identification-of-the-collision-terms>

The uniform integrability and velocity tightness give a subsequence with $F_N harpoon.rt F$ in $L^1 \( \[ 0 \, tau \] times Omega \)$. Since $D_t F_N = Q_N^(+) - Q_N^(-)$, Lemma 30 applies. After extraction for a countable dense family of compact velocity tests, all smooth compact velocity averages converge strongly in local $L_(t \, x)^1$ to the corresponding averages of $F$. The extension from the countable family follows from the uniform integrated mass bound.

Set $W_N \( t \, x \, v \, v_(*) \) = F_N \( t \, x \, v \) F_N \( t \, x \, v_(*) \)$. By (8.7), a further subsequence has a weak $L^1$ limit $W$. For smooth compactly supported $psi \, chi$,

$ integral psi \( v \) chi \( v_(*) \) W_N \( t \, x \, v \, v_(*) \) thin upright(d) v thin upright(d) v_(*) = (integral psi F_N thin upright(d) v) (integral chi F_N thin upright(d) v_(*)) . $

The right-hand side converges in measure locally in $\( t \, x \)$. It is uniformly integrable there: its absolute value is bounded by the integral of $\| psi \( v \) chi \( v_(*) \) \| W_N$, and the full pair-product bounds control this integral on small time-space sets. Vitali’s theorem therefore gives convergence in local $L^1$. It follows that $W$ and $F \( t \, x \, v \) F \( t \, x \, v_(*) \)$ have identical integrals against separated velocity tests, for almost every $\( t \, x \)$. A countable determining family gives a common full-measure set; finite sums of separated tests are dense among continuous functions on compact two-velocity sets. Hence

$ W_N harpoon.rt F \( t \, x \, v \) F \( t \, x \, v_(*) \) quad upright("in ") L^1 \( \[ 0 \, tau \] times Omega times bb(R)^3 \) . quad "(8.9)" $ <comp:pair-limit>

In particular the product on the right is integrable. The uniform integrability removes time strips near $0$ and $tau$, so interior averaging suffices. Weighted tightness extends the identification to each fixed polynomial velocity weight. One may extract simultaneously for integer moment orders; domination by a higher integer order then supplies every order $k gt.eq 0$.

Adjoining the finite angular measure preserves weak convergence. For each $omega$, the elastic substitution on $\( v \, v_(*) \)$ is measure preserving and involutive. Consequently (8.9) also gives weak convergence of the primed pair products on the collision space. On bounded input velocities the collision factor is bounded and the cutoff equals one for all large $N$. The estimates with higher velocity moments remove the complement. For the gain this uses the preserved sum of squared speeds when an output test is pulled back to the inputs. These observations identify any weak limit of the separately uniformly integrable gains and losses:

$ Q_N^plus.minus harpoon.rt Q^plus.minus \( F \, F \) quad upright("in ") L^1 \( \[ 0 \, tau \] times Omega \) \, quad "(8.10)" $ <comp:collision-limit>

also after multiplication by any fixed polynomial velocity weight. The argument permits bounded measurable tests: after the angular integration and elastic substitution, such a test remains bounded on each truncated collision domain.

We can now pass to the unrenormalized equation, including the initial boundary term, since the initial densities converge in $L^1$. Thus $D_t F = Q \( F \, F \)$ in distributions with datum $F_0$, and both separate collision terms have the weighted integrability in (8.1). The remaining work concerns the time representative, entropy, and the local invariant balances.

=== 8.4 A single representative at every time <a-single-representative-at-every-time>

For a smooth periodic $phi \( x \, v \)$ compactly supported in velocity, the cutoff path equations give

$ \| chevron.l F_N \( t \) - F_N \( s \) \, phi chevron.r \| lt.eq integral_s^t #h(-1em) integral_Omega (F_N \| v dot.op nabla_x phi \| + \( Q_N^(+) + Q_N^(-) \) \| phi \|) thin upright(d) x thin upright(d) v thin upright(d) u . $

The first term is bounded by $C_phi \| t - s \|$. The second has a modulus tending to zero with $\| t - s \|$, uniformly in $N$, by the short-time-integral conclusion above. For a countable family dense in the uniform norm on each compact velocity set, Arzelà–Ascoli therefore supplies uniform convergence of the pairings on $\[ 0 \, tau \]$, after one extraction.

At any individual time, (8.5) and (8.6) make ${ F_N \( t \) }$ relatively weakly compact in $L^1 \( Omega \)$. Every cluster point has the smooth pairings just obtained, and hence is the same density. Thus this one subsequence converges weakly in $L^1$ at every time, defining a representative $F \( t \)$ whose smooth pairings are continuous and which agrees with the spacetime limit. Weighted fixed-time tightness gives the same conclusion for moments, so the conserved cutoff mass, momentum, and energy pass at every time. In particular the initial trace of this representative is $F_0$.

Let $Phi \( A \, B \) = \( A - B \) log \( A \/ B \)$ with its nonnegative lower-semicontinuous extension. It is jointly convex: it is the sum of the two convex perspectives $A log \( A \/ B \)$ and $B log \( B \/ A \)$. On any bounded collision domain, (8.9) and its primed version give joint weak convergence of the two arguments of $Phi$. Restriction to $\[ 0 \, t \]$ preserves this convergence for every fixed $t in \[ 0 \, tau \]$. Weak lower semicontinuity therefore applies to the integral of $\| a \| Phi$; the weight can be absorbed into the arguments by $Phi \( c A \, c B \) = c Phi \( A \, B \)$ for $c gt.eq 0$. On $\| v \| \, \| v_(*) \| lt.eq R$ the cutoff is absent once $b_N gt.eq 2 R$. Exhausting the velocity space yields

$ integral_0^t cal(D) \( F \( s \) \) thin upright(d) s lt.eq liminf_N integral_0^t cal(D)^(b_N) \( F_N \( s \) \) thin upright(d) s . $

The same convex lower-semicontinuity argument applies to $cal(H)_M \( F_N \( t \) \)$ under the weak $L^1$ convergence at that time. Combining the two nonnegative terms with the finite-approximation entropy inequality and initial entropy convergence gives

$ cal(H)_M \( F \( t \) \) + integral_0^t cal(D) \( F \( s \) \) thin upright(d) s lt.eq cal(H)_M \( F_0 \) \, #h(2em) 0 lt.eq t lt.eq tau . quad "(8.11)" $ <comp:limit-entropy>

The extraction is independent of $t$; no exceptional set of time endpoints is introduced by the lower-semicontinuity argument.

For completeness, the negative part of $F log F$ is bounded by mass, energy, and a fixed Gaussian integral. On $e^(- 1 - \| v \|^2) lt.eq F < 1$, use $- F log F lt.eq \( 1 + \| v \|^2 \) F$; below that threshold, monotonicity of $- r log r$ on $\( 0 \, e^(- 1) \)$ gives the integrable bound $\( 1 + \| v \|^2 \) e^(- 1 - \| v \|^2)$. The positive part is controlled by the relative entropy integrand and a multiple of $F$. Hence the absolute logarithmic integral is bounded uniformly on $\[ 0 \, tau \]$.

=== 8.5 Strong traces, renormalization, and the invariant balances <strong-traces-renormalization-and-the-invariant-balances>

The integrability of the unrenormalized collision operator now yields strong continuity. In free coordinates the distributional equation, including its initial trace, reads

$ partial_t #scale(x: 120%, y: 120%)[\[] F \( t \, x + t v \, v \) #scale(x: 120%, y: 120%)[\]] = Q \( F \, F \) \( t \, x + t v \, v \) . $

The right-hand side belongs to spacetime $L^1$. Subtracting its Bochner integral leaves a distribution with zero time derivative and initial value $F_0$. Therefore

$ F \( t \, x + t v \, v \) = F_0 \( x \, v \) + integral_0^t Q \( F \, F \) \( s \, x + s v \, v \) thin upright(d) s quad "(8.12)" $ <comp:path-formula>

holds as an $L_(x \, v)^1$ identity, first for almost every time. Its right-hand side is absolutely continuous in $L^1$. Free transport is a strongly continuous group on $L^1 \( Omega \)$, as follows by approximation by continuous functions with compact velocity support. Thus (8.12) defines a strongly continuous representative. Its smooth pairings agree almost everywhere in time with those of the representative already chosen; continuity makes them agree at every time. In particular $F in C \( \[ 0 \, tau \] \; L^1 \)$, $F \( 0 \) = F_0$ strongly, and pairings with every bounded measurable test are continuous. All these observations also hold with any fixed polynomial velocity weight, since both the datum and the source have that integrability.

Equation (8.12) holds on almost every individual free path. On such a path $M \( v \) > 0$ is constant. For a renormalization $beta$ from Definition 1, the ordinary absolutely continuous chain rule gives

$ D_t #scale(x: 120%, y: 120%)[\[] M beta \( F \/ M \) #scale(x: 120%, y: 120%)[\]] = beta' \( F \/ M \) Q \( F \, F \) . $

The source is integrable because $\| beta' \| lt.eq C_beta$. Moreover, for nonnegative $f \, g$,

$ \| M beta \( f \/ M \) - M beta \( g \/ M \) \| lt.eq C_beta \| f - g \| \, #h(2em) \| M beta \( f \/ M \) \| lt.eq C_beta f . $

The strong initial and terminal traces consequently pass through the renormalization. Integrating the path identity against a smooth test proves exactly (1.3), including its initial term. The separate integrability requirement follows from $0 lt.eq Q^plus.minus \/ \( 1 + F \/ M \) lt.eq Q^plus.minus$.

Finally, let $psi in { 1 \, v_1 \, v_2 \, v_3 \, \| v \|^2 \/ 2 }$ and let $phi.alt in C_c^oo \( \[ 0 \, oo \) times \( bb(R)^3 \/ Lambda \) \)$. At the cutoff level the local identity is

$ integral_0^oo #h(-1em) integral_Omega F_N psi \( v \) \( partial_t phi.alt + v dot.op nabla_x phi.alt \) thin upright(d) x thin upright(d) v thin upright(d) t + integral_Omega F_N \( 0 \, x \, v \) psi \( v \) phi.alt \( 0 \, x \) thin upright(d) x thin upright(d) v = 0 . $

It follows from the path equation and collision symmetry, all integrals being absolutely convergent. Weighted weak convergence of $F_N$ and weighted convergence of the initial data pass this identity to $F$. For the energy identity the largest required weight is $\| v \|^3$, which is covered by (8.1). This proves all the exact local balances (1.4) with their initial traces. Equivalently, their collision terms vanish in the limit by absolute weighted collision integrability; no moment defect is present.

Apply the preceding extractions successively on $\[ 0 \, m \]$, $m in bb(N)$, and take a diagonal subsequence, retaining the countable moment and velocity-test families. The representatives on overlapping intervals agree by their smooth pairings, so they define one global strongly continuous density. All integrability, entropy, and conservation statements hold on every finite interval. For a dormant sequence, sum the cold majorants over all scales and add the bath and dormant-hot majorants on their common early interval. This is a locally integrable pointwise upper bound independent of $N$. Testing against nonnegative compactly supported functions and passing to the weak limit preserves it. Its velocity integral is also integrable in space at each fixed time, by the first-power estimate used in (8.5). The every-time weak convergence therefore preserves the bound at each such time section as well. This completes the proof of Proposition 29.

== 9 The cap dilation and its linear limit <sec:dilation>

The cap selects finite solutions whose hot component has a prescribed weighted size at some time before the horizon. We now magnify that event. The bath and the quadratic hot interactions disappear under this magnification; the cold particles converge to two axial velocity atoms whose densities retain the annular geometry. This is the dilation argument of #cite(label("OpenAIPeriodic")) Section 7, with the additional seed factor and bath included explicitly below.

Choose horizons $T_N arrow.b 0$, terminal scales $s_N \/ T_N arrow.r 0$, and cutoffs $b_N arrow.r oo$, and take the cap solutions furnished by Proposition 22. Indices may be relabeled after passage to a subsequence. Write $m_N = m_(T_N) = T_N^p$, and choose a time $t_(* \, N) in \[ 0 \, T_N \]$ at which the cap is attained. On the periodic lift, define

$ r_N = t_(* \, N) + s_N \, #h(2em) h_(r_N) \( t \, x \, v \) = frac(h_N \( r_N t \, r_N x \, v \), m_N r_N) \, #h(2em) C_(r_N) \( t \, x \, v \) = r_N c_N \( r_N t \, r_N x \, v \) \,\
l_N = s_N / r_N arrow.r l in \[ 0 \, 1 \] \, #h(2em) U_N = T_N / r_N arrow.r U in \[ 1 \, oo \] . quad "(9.1)" $ <eq:rescaling>

The limits are obtained by subselection, allowing the second ratio to tend to infinity. We have $r_N arrow.r 0$, $r_N lt.eq 2 T_N$ eventually, and $U_N gt.eq \( 1 + s_N \/ T_N \)^(- 1)$, which proves $U gt.eq 1$. The rescaled cap and its attained value are

$ 0 lt.eq h_(r_N) \( t \, x \, v \) lt.eq \( t + l_N \) H \( v \) quad \( 0 lt.eq t lt.eq U_N \) \, #h(2em) parallel h_(r_N) \( 1 - l_N \) parallel_H = 1 . quad "(9.2)" $ <dil:cap-bound>

When no confusion is possible, we suppress the index on $r_N$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, -0.32), (13.7, 5.97))
  content((0, 5.32), [Physical time#linebreak()$t$], anchor: "west")
  content((0, 3.33), [Hit dilation#linebreak()$t/r_N$], anchor: "west")
  content((0, 1.33), [Horizon dilation#linebreak()$t/T_N$], anchor: "west")
  line((2.45, 0.99), (2.45, 5.37), stroke: (paint: rgb("#cccccc"), dash: "dashed"))
  line((6.7, 0.99), (6.7, 5.37), stroke: (paint: rgb("#000059"), dash: "dashed"))
  line((12.05, 0.99), (12.05, 5.37), stroke: (paint: rgb("#8c5b00"), dash: "dashed"))
  line((2.2, 5.3), (13.15, 5.3), stroke: (paint: rgb("#595959"), thickness: 0.55pt), mark: (end: ">"))
  line((2.45, 5.2), (2.45, 5.4), stroke: (paint: rgb("#666666")))
  line((6.7, 5.17), (6.7, 5.43), stroke: (paint: rgb("#00008c"), thickness: 1.1pt))
  line((12.05, 5.17), (12.05, 5.43), stroke: (paint: rgb("#bf7c00"), thickness: 1.1pt))
  content((2.45, 5.16), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$0$])])
  line((2.2, 3.3), (13.15, 3.3), stroke: (paint: rgb("#595959"), thickness: 0.55pt), mark: (end: ">"))
  line((2.45, 3.2), (2.45, 3.4), stroke: (paint: rgb("#666666")))
  line((6.7, 3.17), (6.7, 3.43), stroke: (paint: rgb("#00008c"), thickness: 1.1pt))
  line((12.05, 3.17), (12.05, 3.43), stroke: (paint: rgb("#bf7c00"), thickness: 1.1pt))
  content((2.45, 3.16), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$0$])])
  line((2.2, 1.3), (13.15, 1.3), stroke: (paint: rgb("#595959"), thickness: 0.55pt), mark: (end: ">"))
  line((2.45, 1.2), (2.45, 1.4), stroke: (paint: rgb("#666666")))
  line((6.7, 1.17), (6.7, 1.43), stroke: (paint: rgb("#00008c"), thickness: 1.1pt))
  line((12.05, 1.17), (12.05, 1.43), stroke: (paint: rgb("#bf7c00"), thickness: 1.1pt))
  content((2.45, 1.16), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$0$])])
  content((6.7, 5.51), [cap hit], anchor: "south")
  content((12.05, 5.51), [horizon], anchor: "south")
  content((6.7, 5.12), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$t_{*,N}=r_N-s_N$])])
  content((12.05, 5.12), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$T_N$])])
  content((6.7, 3.12), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$1-l_N$])])
  content((12.05, 3.12), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$U_N=T_N/r_N$])])
  content((6.7, 1.12), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$1-l_N U_N$])])
  content((12.05, 1.12), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$1$])])
  content((7.25, 4.25), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$r_N=t_{*,N}+s_N, l_N=s_N/r_N$])])
  content((7.25, 2.24), [#box(inset: 0.3333em, stroke: (thickness: 0.4pt), fill: rgb("#ffffff"), [$t/T_N=(t/r_N)/U_N, x/T_N=(x/r_N)/U_N$])])
  content((7.05, -0.12), [$U_N arrow.r.long U< infinity arrow.r.double.long r_N/T_N arrow.r.long 1/U>0$])
})],
  caption: [Figure 2: The same hit and horizon in the two dilations. The rows align physical events and are schematic; the hit may occur at either endpoint, and no ordering of $r_N$ and $T_N$ is assumed. Sections 9–11 will show that the hit dilation has a nonzero weak limit on $0 < t < U$ and that $U < oo$. The latter conclusion makes the change to the horizon dilation nondegenerate: compact subsets of $0 < t < U$ map inside $0 < t < 1$. Thus vanishing in the horizon dilation would force vanishing in the hit dilation, which is the contradiction used to separate the solutions. ],
) <fig:scales>

=== 9.1 The limiting mesh and background <the-limiting-mesh-and-background>

The dilated annular scales are $𝜚_(N \, j) = s_j \/ r_N$, $j lt.eq N$. Their ratio is $e^eta$, their smallest member is $l_N$, and their largest member tends to infinity. Subselect their logarithmic phase modulo $eta$. The grids then converge on compact subintervals of $\( 0 \, oo \)$ to a geometric mesh $cal(M)$ unbounded above. If $l > 0$, its members are $l \, e^eta l \, e^(2 eta) l \, dots.h$. If $l = 0$, it is a two-sided geometric mesh with no smallest member. To verify this description, choose a grid point in $\( e^(- eta) \, 1 \]$, pass to its limit, and multiply it by the fixed factors $e^(j eta)$. When the smallest point stays positive its integer distance in the grid from that chosen point is bounded, so can also be fixed by subselection. Coincident phase endpoints give the same mesh.

For each $𝜚 > 0$ and $sigma in { - 1 \, 1 }$, let $u_(𝜚 \, sigma) \( t \, z \)$ be the unique solution of

$ u = sigma + alpha tanh frac(gamma \( z - t u \), 𝜚) . $

Thus $u_(𝜚 \, sigma) = U_(𝜚 \, sigma)$ in the notation of the cold profiles. The left side minus the right side has derivative in $u$ equal to $1 + t alpha gamma S \( gamma \( z - t u \) \/ 𝜚 \) \/ 𝜚 > 0$; its values have opposite signs for sufficiently large positive and negative $u$. This proves existence and uniqueness. The implicit function theorem gives smoothness, and

$ \| u_(𝜚 \, sigma) - sigma \| lt.eq alpha \, #h(2em) partial_z u_(𝜚 \, sigma) = frac(alpha gamma S \( gamma \( z - t u \) \/ 𝜚 \), 𝜚 + t alpha gamma S \( gamma \( z - t u \) \/ 𝜚 \)) gt.eq 0 . $

Put $theta = 1 \/ 4$, the fraction of each transverse stripe occupied by one sign. On an open mesh annulus $𝜚 < \| y \| < e^eta 𝜚$, define the nonnegative velocity measure

$ B \( t \, x \, thin upright(d) p \) & = sum_(sigma = plus.minus 1) b_(𝜚 \, sigma) \( t \, z \) delta_(u_(𝜚 \, sigma) \( t \, z \) e_3) \( thin upright(d) p \) \,\
b_(𝜚 \, sigma) \( t \, z \) & = frac(theta K S \( gamma \( z - t u_(𝜚 \, sigma) \) \/ 𝜚 \), 𝜚 + t alpha gamma S \( gamma \( z - t u_(𝜚 \, sigma) \) \/ 𝜚 \)) . quad "(9.3)" $ <eq:background>

Set $B = 0$ in the hole $\| y \| < l$ if $l > 0$, and assign arbitrary values obeying the same bounds on annular interfaces and the transverse axis. These exceptional positions have zero Lebesgue measure. In particular, for every $k gt.eq 0$,

$ integral chevron.l p chevron.r^k B \( t \, x \, thin upright(d) p \) lt.eq frac(C_k, t + 𝜚) lt.eq C_k / t quad \( t > 0 \) quad "(9.4)" $ <dil:background-bound>

on an active annulus. If $l > 0$, the bound is instead uniformly $C_k \/ \( t + l \)$ for all $t gt.eq 0$.

#thm([Proposition 9.1.])[
  #emph[Every sequence (9.1) has a subsequence for which $h_(r_N) harpoon.rt g$ in local spacetime $L^1$ on $\( 0 \, U \) times bb(R)_x^3 times bb(R)_v^3$, where 
$ 0 lt.eq g \( t \, x \, v \) lt.eq \( t + l \) H \( v \) \, #h(2em) D_t g = 2 P \( B \, g \) - g nu_B . quad "(9.5)" $ <eq:limit-equation>

 Here $B$ is (9.3); its gain and loss are defined by integration against the velocity measure. Both terms on the right are locally integrable, with a velocity majorant uniform in position on each compact positive-time interval. Compactly supported velocity averages of $h_(r_N)$ converge strongly in local $L_(t \, x)^1$. The limit has a locally strongly continuous $L^1$ representative at positive times and obeys the integrating-factor formula (9.15) below.]
  #emph[If $l > 0$, pass also to a limit $lambda_N arrow.r lambda_0$ of the seed parameters. The conclusion and its local continuity extend to time zero, with 
$ g \( 0 \, x \, v \) = lambda_0 l thin chi \( x \/ l \, v \) . quad "(9.6)" $ <dil:initial-trace>

]
] <prop:blowup-limit>

=== 9.2 Cold convergence: survival, Jacobian, and stripe averaging <cold-convergence-survival-jacobian-and-stripe-averaging>

We first identify the cold measure independently of the hot limit. Fix a compact time-space region

$ a lt.eq t lt.eq A < U \, #h(2em) \| x \| lt.eq R \, $

where $a > 0$. Since $U_N arrow.r U$ and $A < U$, eventually $r_N A < T_N$. The cap therefore holds on the entire initial physical interval $\[ 0 \, r_N A \]$, as required for the survival estimate below. By Proposition 16, the dilated cold velocity moments are bounded there, and indeed uniformly in position, by

$ integral chevron.l p chevron.r^k C_(r_N) \( t \, x \, p \) thin upright(d) p lt.eq C_k (frac(1, t + l_N) + 1) . quad "(9.7)" $ <dil:cold-moment-bound>

The nonmain tails have the still smaller bound $C_M r_N^(M + 1) t^M e^(- 4 \| p \|^2)$ for any fixed $M > 0$. Uniformly decreasing velocity tails hold under these moment bounds.

First restrict to annuli with $𝜚_(N \, j)$ in a fixed compact interval $\[ epsilon \, R_1 \] subset \( 0 \, oo \)$. Their number is bounded independently of $N$. A free-core path at scale $s = r_N 𝜚_(N \, j)$ has bounded velocity and remains in its own spatial enlargement. At its position, all free velocities in that color are within $C d_s$ of the same center, so the contribution to its loss frequency is at most $C d_s \/ s$. The remainder in Proposition 16 has velocity moment amplitude $O \( s^(15 \/ 2) \)$, by Lemma 17. The nonmain colors have the bound of Lemma 18; the bath bound and the cap bound give bounded frequencies at these velocities. Hence, over physical times $0 lt.eq t_(upright("old")) lt.eq r_N A$, the optical depth on every free-core path is at most

$ C_A r_N #scale(x: 120%, y: 120%)[\(] d_s \/ s + s^(15 \/ 2) + 1 #scale(x: 120%, y: 120%)[\)] = o \( 1 \) $

uniformly on this compact scale range. The cutoff only decreases this frequency. Keeping the freely transported term in the positive path formula of (4.7) gives

$ e^(- epsilon.alt_N) f_i lt.eq c_i lt.eq f_i + epsilon.alt_s m_i \, #h(2em) epsilon.alt_N arrow.r 0 \, $

where $f_i$ is the free core of (5.3); the symbols $epsilon.alt_N$ and $epsilon.alt_s$ denote different quantities. After multiplication by $r_N$, the remainder has velocity mass

$ r_N O \( s^(15 \/ 2) \) = O \( r_N^(17 \/ 2) 𝜚_(N \, j)^(15 \/ 2) \) . quad "(9.8)" $ <dil:remainder-power>

The same estimates hold with every fixed polynomial velocity weight. Consequently the dilated actual color and its free core differ by $o \( 1 \)$ in velocity total variation, uniformly on the compact regions under consideration.

On bounded dilated spatial sets, only the copy centered at the origin can be main for sufficiently large $N$. Indeed, an intersecting copy would have a lattice center $n$ with $\| macron(n) \| lt.eq s_0 + o \( 1 \)$ and $\| n_3 \| lt.eq 1 \/ 8 + b_(upright("sp")) + o \( 1 \)$. Since $1 \/ 8 + b_(upright("sp")) = 3 \/ 16$ and $s_0$ is small, this contradicts $\| n \| gt.eq 1$ unless $n = 0$. This argument uses the Euclidean spacing of the rotated lattice and identifies the free cores directly on its lift.

We compute a centered free core exactly. Fix one sign and one such annulus, write $𝜚_N = s \/ r_N$, and use the velocity parameters

$ macron(p) = d_s macron(w) \, #h(2em) p_3 = sigma + alpha tanh frac(gamma \( z - t p_3 \), 𝜚_N) + d_s w_3 . $

The axial map depends only on $w_3$. Its derivative is

$ frac(partial p_3, partial w_3) = frac(d_s, 1 + t alpha gamma S \( gamma \( z - t p_3 \) \/ 𝜚_N \) \/ 𝜚_N) . $

Thus Equation (5.8), after dilation, says that the velocity integral of the free core against a test $psi$ is

$ integral r_N f_i \( r_N t \, r_N x \, p \) psi \( p \) thin upright(d) p =  & integral J \( w \) frac(K S \( gamma \( z - t p_3 \) \/ 𝜚_N \), 𝜚_N + t alpha gamma S \( gamma \( z - t p_3 \) \/ 𝜚_N \)) psi \( d_s macron(w) \, p_3 \)\
 & quad dot.op upright(bold(1))_(E_j^sigma) \( r_N y - r_N t d_s macron(w) \) upright(bold(1))_({ \| r_N \( z - t p_3 \) \| < 1 \/ 8 }) thin upright(d) w . quad "(9.9)" $ <dil:free-core-integral>

On the compact regions under consideration the last axial indicator equals one for all sufficiently large $N$. Since the implicit velocity map has derivative at least one in $p_3$,

$ \| p_3 - u_(𝜚_N \, sigma) \( t \, z \) \| lt.eq d_s \| w_3 \| . $

After the mesh subselection, $𝜚_N arrow.r 𝜚 > 0$, so the velocity test and the smooth amplitude in (9.9) converge uniformly for $w in "supp" J$ to

$ psi \( u_(𝜚 \, sigma) e_3 \) frac(K S \( gamma \( z - t u_(𝜚 \, sigma) \) \/ 𝜚 \), 𝜚 + t alpha gamma S \( gamma \( z - t u_(𝜚 \, sigma) \) \/ 𝜚 \)) . $

It remains to average the transverse indicator. In dilated coordinates its period is

$ s^2 / r_N = r_N 𝜚_N^2 arrow.r 0 . $

The transverse shift of its argument is $t d_s macron(w)$, whose ratio to that period is at most

$ frac(A d_s, r_N 𝜚_N^2) = A d_0 r_N^9 𝜚_N^8 arrow.r 0 . $

For the indicator of the fixed periodic stripe pattern, a translation by this vanishing relative amount changes its integral on a bounded set by $o \( 1 \)$, uniformly in its phase and in bounded $t \, w$. One can verify this by summing the lengths of the small intervals around stripe endpoints. The annular margins have dilated width $O \( s^2 \/ r_N \) = O \( r_N 𝜚_N^2 \)$, so their area also tends to zero on the annulus. The outer annular radii converge; their boundaries can likewise be removed in sets of arbitrarily small area.

Finally the periodic stripe indicators converge weak-\* to their mean $theta$. Explicitly, if $q$ is the one-period indicator and $q - theta$ has bounded periodic primitive $Q$, then for a smooth compactly supported one-dimensional test $f$, period $p$, and arbitrary phase $zeta$,

$ lr(|integral f \( y_1 \) \( q \( y_1 \/ p + zeta \) - theta \) thin upright(d) y_1|) lt.eq p parallel Q parallel_oo parallel f' parallel_1 . $

Fubini’s theorem gives the same assertion with the other coordinates and parameters present. Approximation in $L^1$ extends it to the annular restrictions. Integrating $J$, whose mass is one, in (9.9) produces exactly the coefficient $b_(𝜚 \, sigma)$ in (9.3).

These arguments identify the cold limit on all compact positive scale annuli. To remove the lower scale restriction, use (9.7): on the slab $t gt.eq a$, the integral over $\| y \| < C epsilon$, with bounded $z$, is at most $C_(a \, A \, R \, k) epsilon^2$. The same estimate holds for the candidate $B$. Scales larger than a fixed multiple of $R$ have no main color in the chosen spatial compact set, and their escaped tails vanish. We have proved that for every continuous compactly supported velocity test $psi$,

$ integral C_(r_N) \( t \, x \, p \) psi \( p \) thin upright(d) p harpoon.rt^(*) integral psi \( p \) B \( t \, x \, thin upright(d) p \) quad upright("in local ") L_(t \, x)^oo quad "(9.10)" $ <dil:cold-weakstar>

on $\( 0 \, U \) times bb(R)^3$. Indeed the computation first gives weak convergence against smooth compact time-space tests, and the common $L^oo$ bound extends it to all $L^1$ tests. Polynomial velocity tails can also be removed uniformly. If $l > 0$, choose $epsilon < l \/ 2$; all the bounds used above hold down to time zero, so (9.10) does too.

=== 9.3 The hot equation and the size of every error <the-hot-equation-and-the-size-of-every-error>

The transport derivative of $h_N \( r_N t \, r_N x \, v \) \/ \( m_N r_N \)$ is $m_N^(- 1) \( D_t h_N \) \( r_N t \, r_N x \, v \)$. Thus the equation for $h_N$ gives exactly

$ D_t h_(r_N) = 2 P^(b_N) \( C_(r_N) \, h_(r_N) \) - h_(r_N) nu_(C_(r_N))^(b_N) + E_N \, quad "(9.11)" $ <dil:prelimit-equation>

where, writing $u_N^r \( t \, x \, v \) = u_N \( r_N t \, r_N x \, v \)$,

$ E_N =  & r_N #scale(x: 120%, y: 120%)[\[] 2 P^(b_N) \( u_N^r \, h_(r_N) \) - h_(r_N) nu_(u_N^r)^(b_N) #scale(x: 120%, y: 120%)[\]]\
 & + m_N r_N^2 #scale(x: 120%, y: 120%)[\[] P^(b_N) \( h_(r_N) \, h_(r_N) \) - h_(r_N) nu_(h_(r_N))^(b_N) #scale(x: 120%, y: 120%)[\]] + m_N^(- 1) cal(S)_N \( r_N t \, r_N x \, v \) . $

Here $cal(S)_N$ is the nonnegative source in (4.7), including the cold–bath and distinct-color gains. The bath estimate (6.1) gives $u_N^r lt.eq C H$. For every fixed $A < oo$, the cap and the gain estimates therefore imply, on $0 lt.eq t lt.eq min \( A \, U_N \)$,

$ \| E_N \( t \, x \, v \) \| lt.eq C_A #scale(x: 120%, y: 120%)[\(] r_N + m_N r_N^2 + T_N^(M - 1 - p) #scale(x: 120%, y: 120%)[\)] chevron.l v chevron.r H \( v \) \, #h(2em) M > p + 1 . quad "(9.12)" $ <dil:error-bounds>

For the last term we used the arbitrary-power source bound of (6.3):

$ frac(cal(S)_N \( r_N t \, r_N x \, v \), m_N) lt.eq C_M r_N^(M - 1) / T_N^p t^(M - 1) H \( v \) lt.eq C_(A \, M) T_N^(M - 1 - p) H \( v \) . $

Thus every error tends to zero locally in spacetime $L^1$, including down to time zero on bounded dilated intervals. The use of $r_N lt.eq 2 T_N$ here requires no positive lower bound for $r_N \/ T_N$.

The main cold sheets and Lemma 6 also give

$ P^(b_N) \( C_(r_N) \, H \) lt.eq C (frac(1, t + l_N) + 1) H \, #h(2em) nu_(C_(r_N))^(b_N) \( v \) lt.eq C (frac(1, t + l_N) + 1) chevron.l v chevron.r . $

The nonmain cold component is bounded by a vanishing multiple of $e^(- 4 \| v \|^2) lt.eq C H$, so its gain is covered by Lemma 9. Equations (9.2) and (9.11) now imply, on $a lt.eq t lt.eq A < U$,

$ \| D_t h_(r_N) \( t \, x \, v \) \| lt.eq C_(a \, A) chevron.l v chevron.r H \( v \) . quad "(9.13)" $ <dil:transport-majorant>

This is a genuine integrable velocity majorant, uniform in position. If $l > 0$, the same conclusion holds on $0 lt.eq t lt.eq A$, since $l_N gt.eq l \/ 2$ eventually.

The cap gives weak compactness of $h_(r_N)$ in local $L^1$, and (9.13) permits application of Lemma 30. Subselect on an exhaustion of $\( 0 \, U \) times bb(R)^3$. The resulting limit $g$ satisfies the bound in (9.5), and each compactly supported velocity average converges strongly in local $L_(t \, x)^1$.

=== 9.4 Passing the cold–hot products <passing-the-coldhot-products>

The dilated cold densities concentrate in velocity, so the two-density compactness argument of Section 8 does not apply to $C_(r_N)$. The needed product passage uses (9.10) and hot averaging instead.

For compact velocity tests $psi \, chi$, put

$ a_N \( t \, x \) = integral psi \( p \) C_(r_N) \( t \, x \, p \) thin upright(d) p \, #h(2em) zeta_N \( t \, x \) = integral chi \( v \) h_(r_N) \( t \, x \, v \) thin upright(d) v . $

On every compact positive-time region, $a_N$ is bounded in $L^oo$ and converges weak-\* to $a = integral psi thin upright(d) B$, while $zeta_N arrow.r zeta = integral chi g thin upright(d) v$ strongly in $L^1$. For a bounded time-space test $phi$,

$ integral phi \( a_N zeta_N - a zeta \) = integral phi a_N \( zeta_N - zeta \) + integral phi \( a_N - a \) zeta arrow.r 0 . $

Finite sums of separated velocity tests approximate continuous tests uniformly on compact velocity products. The total product mass is uniformly bounded on compact time-space regions by (9.7) and the cap. We conclude

$ C_(r_N) \( t \, x \, p \) h_(r_N) \( t \, x \, v \) thin upright(d) p thin upright(d) v thin upright(d) x thin upright(d) t harpoon.rt B \( t \, x \, thin upright(d) p \) g \( t \, x \, v \) thin upright(d) v thin upright(d) x thin upright(d) t quad "(9.14)" $ <dil:mixed-product>

against continuous compact velocity tests, with arbitrary smooth compact time-space dependence. Uniform moment bounds in both velocities allow removal of velocity cutoffs in tests with any fixed polynomial growth for which they are used below.

Here is an explicit weak collision test suitable for this convergence. For a continuous output test $phi.alt$, let

$ cal(K)_phi.alt \( p \, v \) = frac(\| p - v \|, 2) integral_(S^2) phi.alt (frac(p + v, 2) + frac(\| p - v \|, 2) omega) thin upright(d) omega . $

Lemma 3 gives $integral phi.alt P \( c \, h \) = integral.double c \( p \) h \( v \) cal(K)_phi.alt \( p \, v \) thin upright(d) p thin upright(d) v$. The test $cal(K)_phi.alt$ is continuous in both incoming velocities, including $p = v$, and is bounded in absolute value by $2 pi \| p - v \| parallel phi.alt parallel_oo$. The loss test is $2 pi \| p - v \| phi.alt \( v \)$, with the same properties. Inserting smooth time-space dependence in $phi.alt$ does not change these facts. On bounded velocity products the factor $min \( 1 \, b_N \/ \| p - v \| \)$ is eventually one; its complement is uniformly negligible by the weighted product tails. Applying (9.14) proves the required gain and loss limits.

The limiting gain is an integrable function. To check the possible exception at the velocity axis, use the sphere formula: every nondegenerate diameter sphere meets that axis in at most two points, which have zero sphere-area measure. A degenerate sphere has zero collision rate. Tonelli’s theorem therefore gives no output mass on the axis. Off the axis, the collision-plane formula of Lemma 3 gives a density for each axial partner. Each summand of $B$ is an allowed zero-width axial sheet in Lemma 6; hence on $a lt.eq t lt.eq A$,

$ 0 lt.eq P \( B \, g \) lt.eq C_(a \, A) H \, #h(2em) 0 lt.eq g nu_B lt.eq C_(a \, A) chevron.l v chevron.r H . $

These bounds dominate the entire weak gain measure, including across the velocity axis. Passing (9.11), using (9.12), proves the equation in (9.5).

=== 9.5 A positive lower mesh endpoint and the local mild formula <a-positive-lower-mesh-endpoint-and-the-local-mild-formula>

When $l > 0$, (9.13) holds uniformly down to zero. The rescaled initial hot density, on every fixed spatial compact set for large $N$, is exactly

$ h_(r_N) \( 0 \, x \, v \) = lambda_N l_N chi \( x \/ l_N \, v \) . $

The other periodic copies have moved outside that compact set. Subselect $lambda_N arrow.r lambda_0$. Smoothness and compact support of $chi$, and $l_N arrow.r l > 0$, give strong local $L^1$ convergence to (9.6). Passing the weak transport identity with tests touching time zero is justified by the uniform source majorant and yields that initial trace for $g$. The cold product argument also extends to zero in this case, as already noted. For $l = 0$ the coefficient can be of order $1 \/ t$, and the proposition only asserts the equation on the open positive-time interval.

On any $\[ a \, A \] subset \( 0 \, U \)$, the limiting transport source is locally integrable and has the preceding velocity majorant uniformly in position. Changing to free coordinates, first on bounded velocities and enlarged spatial compact sets, gives a locally strongly continuous $L^1$ representative. The uniform integrable velocity tails then remove the velocity truncation. The cap bound passes to every trace of this representative. Almost every free path obeys the scalar absolutely continuous equation $D_t g + nu_B g = 2 P \( B \, g \)$. Its loss coefficient is locally integrable along the path, since $nu_B \( t \, x \, v \) lt.eq C_a chevron.l v chevron.r$ for $t gt.eq a$. The integrating factor therefore gives, for $0 < a < t < U$,

$ g \( t \, x \, v \) =  & g \( a \, x - \( t - a \) v \, v \) exp [- integral_a^t nu_B \( tau \, x - \( t - tau \) v \, v \) thin upright(d) tau]\
 & + 2 integral_a^t P \( B \, g \) \( s \, x - \( t - s \) v \, v \) exp [- integral_s^t nu_B \( tau \, x - \( t - tau \) v \, v \) thin upright(d) tau] thin upright(d) s . quad "(9.15)" $ <dil:mild>

This is an almost-everywhere identity, or equivalently an identity in local $L^1$ at the displayed times. It holds with $a = 0$ when $l > 0$. Altering the medium on the null annular interfaces does not change the identity: free transport preserves phase-space measure, so Fubini’s theorem discards the affected set of paths. These statements complete the proof of Proposition 31.

=== 9.6 The free-core comparison used for nonconcentration <the-free-core-comparison-used-for-nonconcentration>

Weak convergence alone need not preserve the attained weighted norm in (9.2). The next section will exclude its concentration near the velocity axis or in a small set of collision histories. Its input is an upper comparison involving only the explicit free cores.

#thm([Lemma 9.2.])[
  #emph[For all sufficiently large $N$, define the velocity measure 
$ A_N \( t \, x \, thin upright(d) p \) = r_N sum_(i : thin j lt.eq N) f_i \( r_N t \, r_N x \, p \) thin upright(d) p \, #h(2em) 0 lt.eq t lt.eq 1 . $

 This definition uses free transport of the initial colors and is meaningful even if $t > U_N$. At each position, at most one summand is nonzero. Its velocity moments and normalized gain obey 
$ integral chevron.l p chevron.r^k A_N \( t \, x \, thin upright(d) p \) lt.eq frac(C_k, t + l_N) \, #h(2em) P \( A_N \, H \) lt.eq frac(C, t + l_N) H . $

 There are numbers $epsilon_N arrow.b 0$ such that, on $0 lt.eq t lt.eq min \( 1 \, U_N \)$, the hot component obeys the pathwise upper comparison 
$ D_t h_(r_N) lt.eq 2 P \( A_N \, h_(r_N) \) + epsilon_N H . quad "(9.16)" $ <dil:positive-comparison>

 The bounds and comparison hold on full-measure endpoint sets at each time section, with representatives given by their path formulas.]
] <dil:free-core-comparison>

#proof[
  The supports of the free cores lie in their disjoint spatial enlargements through physical time $r_N$; no retirement occurs on this interval for large $N$. The exact Jacobian formula (9.9), or its version before centering a periodic copy, gives the moment estimate because $r_N \/ \( r_N t + s_j \) lt.eq 1 \/ \( t + l_N \)$. The sheet gain estimate gives the second bound.
  In the upper cold estimate, the main-color remainder contributes at most $C r_N s_j^(15 \/ 2) H$ to its gain against $H$. The sum of the nonmain contributions has a vanishing Gaussian majorant after multiplication by $r_N$. Uniformly over all positions, therefore,
  $ P \( C_(r_N) \, H \) lt.eq P \( A_N \, H \) + o \( 1 \) H . $
  More precisely this inequality follows by applying the positive gain to the nonnegative upper error in $C_(r_N) lt.eq A_N + R_N$, where $P \( R_N \, H \) lt.eq o \( 1 \) H$; it does not assert a signed total-variation comparison at all scales. On the present time range $h_(r_N) lt.eq 2 H$. Drop every nonnegative loss in (9.11), use $P^(b_N) lt.eq P$, and bound the positive bath, hot, and source terms exactly as in (9.12). This proves (9.16) with an error independent of $t \, x \, v$.
  All finite approximations obey their equations in free coordinates. Fubini’s theorem gives the comparisons along almost every free path and on full-measure endpoint sets at every specified terminal time. The countably many approximation indices and lattice translations can be treated simultaneously. This is the form of the comparison used in the next section. ◻
]

== 10 A cap event produces a nonzero limit <sec:nonconcentration>

The weak limit in Proposition 31 is obtained on an open time interval. A supremum attained by an approximation could in principle disappear through concentration, or through escape from that interval. The purpose of this section is to exclude both possibilities. The proof develops the nonconcentration mechanism of #cite(label("OpenAIPeriodic")) Section 8: two successive gains exclude an axial limiting velocity, whereas five gains regularize the full spacetime–velocity variables away from the axis. We give both arguments here, including the localization needed for the rotated period lattice. All constants may depend on the fixed jet parameters, but none depends on the approximation index.

#thm([Proposition 10.1.])[
  (Nonvanishing of every cap limit).  #emph[Consider any sequence of cap solutions with horizons $T_n arrow.r 0$, approximation indices $N_n arrow.r oo$, and $s_(N_n) \/ T_n arrow.r 0$. Make the rescaling (9.1), and pass to any subsequence supplied by Proposition 31. Its limit satisfies 
$ g equiv.not 0 #h(2em) upright("on ") \( 0 \, U \) times bb(R)_x^3 times bb(R)_v^3 . $

 This conclusion includes $l = 1$, $U = 1$, and $U = oo$.]
] <prop:nonzero-limit>

We first describe the positive kernels used in the proof. Subsequently we establish the two different mechanisms needed near and away from the velocity axis.

=== 10.1 A positive majorizing equation and its kernels <a-positive-majorizing-equation-and-its-kernels>

For this section relabel the sequence by $n$, set $U_n = T_n \/ r_n$, and write

$ r_n = t_(* \, n) + s_(N_n) \, quad ell_n = s_(N_n) / r_n \, quad tau_n = t_(* \, n) / r_n = 1 - ell_n \, quad h_n = h_(r_n) \, quad C_n = C_(r_n) \, quad f_n = h_n / H . $

Then $ell_n arrow.r l$. In particular $0 lt.eq ell_n lt.eq 1$, $0 lt.eq tau_n lt.eq 1$. The cap gives, on $0 lt.eq t lt.eq U_n$,

$ 0 lt.eq f_n \( t \, x \, v \) lt.eq t + ell_n \, #h(2em) ∥f_n \( tau_n \)∥_oo = 1 . quad "(10.1)" $ <nc:cap-normalized>

Essential supremum norms and pointwise formulas involving $H$ always ignore the velocity axis, a null set. The mild representatives of the finite approximations will be used at the cap times. Choose Borel representatives when composing densities with the maps below, enforcing their asserted bounds on exceptional null sets as well. Characteristic identities and endpoint choices are still made only on their common full-measure sets.

#thm([Lemma 10.2.])[
  (Core kernels on the dilated scale).  #emph[There are nonnegative velocity measures $A_n \( t \, x \, thin upright(d) p \)$ and numbers $epsilon_n arrow.r 0$ with the following properties. After discarding finitely many terms, the measures $A_n$ are defined from free transport on the whole interval $0 lt.eq t lt.eq 1$, independently of the cap interval $\[ 0 \, U_n \]$. The bounds on $A_n$ below hold on that whole interval; comparison with $h_n$ is used only while the cap bound holds.]
  + #emph[On $0 < t < min \( 1 \, U_n \)$, along almost every free characteristic, 
$ D_t h_n lt.eq 2 P \( A_n \, h_n \) + epsilon_n H . quad "(10.2)" $ <nc:positive-equation>

 At each point $A_n$ contains at most one main free core. Its dilated scale $𝜚 = s \/ r_n$ satisfies $\| y \| asymp 𝜚$, with coordinates measured from its periodic copy, and 
$ frac(2 P \( A_n \, H \), H) lt.eq frac(C, t + ell_n) . $

]
  + #emph[Before spatial masks are imposed, a core of scale $𝜚 = s \/ r_n$ and sign $sigma$ is the pushforward of 
$ frac(K S #scale(x: 120%, y: 120%)[\(] gamma \( z - t p_3 \) \/ 𝜚 #scale(x: 120%, y: 120%)[\)], 𝜚 + t alpha gamma S #scale(x: 120%, y: 120%)[\(] gamma \( z - t p_3 \) \/ 𝜚 #scale(x: 120%, y: 120%)[\)]) J \( w \) thin upright(d) w \, #h(2em) macron(p) = d_s macron(w) \, quad p_3 = sigma + alpha tanh #scale(x: 120%, y: 120%)[\(] gamma \( z - t p_3 \) \/ 𝜚 #scale(x: 120%, y: 120%)[\)] + d_s w_3 . quad "(10.3)" $ <nc:core-parameters>

 The actual masks are measurable factors between zero and one. The density in (10.3) is at most $C \( t + 𝜚 \)^(- 1) J \( w \)$.]
  + #emph[For $t gt.eq a > 0$, the normalized gain measure 
$ cal(K)_n \( t \, x \, v \; thin upright(d) p thin thin upright(d) xi \) = 4 A_n \( t \, x \, thin upright(d) p \) thin delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] frac(H \( xi \), H \( v \)) thin upright(d) xi quad "(10.4)" $ <nc:normalized-kernel>

 has total mass at most $C \/ a$. Uniformly in its base point, the contributions from large $\| p \| + \| xi - v \|$, or from large retained Gaussian parameters in a product-sheet majorant, tend to zero. Its total mass tends uniformly to zero as $\| v \| arrow.r oo$.]
] <nc:core-kernels>

#proof[
  Use the free-core measure from Lemma 32. More explicitly, if the main retained label at $\( r_n t \, r_n x \)$ is $i$, set
  $ A_n \( t \, x \, thin upright(d) p \) = r_n f_i \( r_n t \, r_n x \, p \) thin upright(d) p \, #h(2em) f_i \( t \, x \, p \) = c_i^0 \( x - t p \, p \) \, $
  and otherwise set $A_n = 0$. The disjointness in Lemma 14 holds on the whole physical interval $\[ 0 \, r_n \]$ for all sufficiently large $n$, and no color is retired there. Free transport therefore defines $A_n$ on $\[ 0 \, 1 \]$, regardless of $U_n$. Equation (9.16) gives (10.2). Its error already includes the bath, the source divided by $m_(T_n) = T_n^p$, the rescaled hot self-gain, and the difference between actual and free cold cores.
  The enlargement of a main transverse annulus remains between its original radial boundaries. Thus, relative to its period point, $𝜚 < \| y \| < e^eta 𝜚$, where $𝜚 = s \/ r_n$. The change of velocity variables in (5.8), multiplied by $r_n$, is exactly (10.3); equivalently, this is the parameter formula in (9.9) before velocity testing. For $0 lt.eq S lt.eq 1$,
  $ frac(K S, 𝜚 + t alpha gamma S) lt.eq frac(C, t + 𝜚) . $
  Indeed, multiplying by $t + 𝜚$ bounds the $𝜚$-term by $K$ and the $t$-term by $K \/ \( alpha gamma \)$. The smallest scale is $ell_n$, so the amplitude is at most $C \/ \( t + ell_n \)$.
  The implicit axial map depends only on $w_3$, and its monotonicity gives $\| p_3 \| lt.eq 1 + alpha + d_s \| w_3 \|$. The smooth compactly supported $J$ has a fixed product Gaussian majorant. Lemma 8 therefore dominates each core by a sheet, with the preceding amplitude and a fixed axial moment bound. The gain bound in Lemma 6 proves (i). The factor $4$ in (10.4) is the product of the linear gain coefficient $2$ and the coefficient $2$ in the collision-plane formula of Lemma 3. Lemma 7 now gives (iii); Lemma 8 also controls Gaussian parameter tails before the compressed axial change of variables. For the exact free cores the parameters already lie in $"supp" J$. All these estimates allow measurable masks bounded by one, which can only decrease the nonnegative integrals. ◻
]

For a fixed $a > 0$, define the backward Volterra operator

$ \( cal(V)_n F \) \( t \, x \, v \) = integral_a^t integral F #scale(x: 120%, y: 120%)[\(] s \, x - \( t - s \) v \, xi #scale(x: 120%, y: 120%)[\)] cal(K)_n #scale(x: 120%, y: 120%)[\(] s \, x - \( t - s \) v \, v \; thin upright(d) p thin thin upright(d) xi #scale(x: 120%, y: 120%)[\)] thin upright(d) s . quad "(10.5)" $ <nc:volterra>

#emph[Representatives in the finite-temperature iteration.] For each finite $n$, the core measure has a velocity density, $A_n \( s \, x \, thin upright(d) p \) = a_n \( s \, x \, p \) thin upright(d) p$. Integrating first in $p$ in (10.4) shows that, for $xi eq.not v$, its input marginal is

$ cal(K)_n \( s \, x \, v \; bb(R)^3 \, thin upright(d) xi \) = frac(4 H \( xi \), \| xi - v \| H \( v \)) [integral_(\( v - p \) dot.op \( xi - v \) = 0) a_n \( s \, x \, p \) thin upright(d) A_p] thin upright(d) xi . $

There is no atom at $xi = v$: each plane-area measure gives that point zero mass, and $p = v$ is null for the cold density. For a null set in $\( s \, X \, xi \)$, integrate also in the endpoint variables and use the measure-preserving change $X = x - \( t - s \) v$. Tonelli’s theorem then shows that altering the input on that set changes $cal(V)_n F \( t \)$ only on a null set of endpoints, at each fixed terminal time. Finite repetition preserves this property. A countable sequence of lower times $a arrow.b 0$ suffices below; intersecting the good endpoint sets for these times, the approximation indices, and the finitely many iterations gives the common full-measure sets used at the cap events.

Positivity and Lemma 34 give, for a bounded nonnegative $F$,

$ parallel cal(V)_n^j F \( t \) parallel_oo lt.eq parallel F parallel_oo frac(#scale(x: 120%, y: 120%)[\(] C log \( t \/ a \) #scale(x: 120%, y: 120%)[\)]^j, j !) \, #h(2em) a lt.eq t lt.eq 1 . quad "(10.6)" $ <nc:iteration-norm>

Indeed, the ordered $j$-time integral of $product_(i = 1)^j C \/ t_i$ equals $\( C log \( t \/ a \) \)^j \/ j !$. In particular every fixed number of further gains has bounded mass on this slab.

=== 10.2 Reduction to a finite gain integral <reduction-to-a-finite-gain-integral>

We begin the proof of Proposition 33. The case $l > 0$ is settled directly. For $l = 0$, the cap will force a positive contribution from five successive gains; the remaining subsections show that this contribution vanishes if the weak limit is zero.

Pass to a subsequence on which the seed parameters converge, $lambda_n arrow.r lambda_oo$. If $l > 0$ and $lambda_oo > 0$, Proposition 31 gives the initial hot trace

$ g \( 0 \, x \, v \) = lambda_oo l thin chi \( x \/ l \, v \) . $

This trace is nonzero. More explicitly, the limiting loss frequency obeys

$ nu_B \( t \, x \, v \) lt.eq frac(C \( 1 + \| v \| \), t + l) . $

On any bounded velocity set and any finite interval beginning at zero its integral along a flight is finite. The positive mild formula for (9.5) therefore retains the initial trace multiplied by a strictly positive survival factor. A bounded positive portion of the smooth nonzero bump gives positive interior mass.

If $l > 0$ and $lambda_oo = 0$, use Lemma 34 from time zero. The initial ratio has norm at most $lambda_n ell_n parallel chi \/ H parallel_oo$, independently of the spatial scaling of the bump. On $0 lt.eq t lt.eq tau_n lt.eq 1$, eventually $t + ell_n gt.eq l \/ 2$. The positive integral inequality and the elementary scalar integrating-factor estimate give

$ sup_(0 lt.eq t lt.eq tau_n) parallel f_n \( t \) parallel_oo lt.eq #scale(x: 120%, y: 120%)[\(] lambda_n ell_n parallel chi \/ H parallel_oo + epsilon_n #scale(x: 120%, y: 120%)[\)] e^(2 C \/ l) arrow.r 0 . $

This contradicts (10.1). Both alternatives also apply when $l = 1$, even if $tau_n arrow.r 0$ or some hit occurs at time zero.

It remains to consider $l = 0$, so $tau_n arrow.r 1$. Suppose, to obtain a contradiction, that $g = 0$ throughout the open interval $\( 0 \, U \)$. Nonnegativity upgrades this zero weak limit to local $L^1$ convergence: if $K$ is a compact subset of the open spacetime–velocity region, take a nonnegative smooth compact test at least one on $K$. Its pairing with $h_n$ tends to zero, hence $integral_K h_n arrow.r 0$. Away from the velocity axis $H$ has a positive lower bound on compact velocity sets. Consequently

$ f_n arrow.r 0 quad upright("in measure on compact subsets of ") \( 0 \, U \) times bb(R)_x^3 times { macron(v) eq.not 0 } . quad "(10.7)" $ <nc:zero-in-measure>

Fix $0 < a < 1 \/ 4$, so that $a < tau_n$ for large $n$. The positive mild inequality (10.2) reads

$ f_n lt.eq d_n + cal(V)_n f_n + e_n \, $

where $d_n \( t \, x \, v \) = f_n \( a \, x - \( t - a \) v \, v \)$, $parallel d_n parallel_oo lt.eq a + ell_n$, and $0 lt.eq e_n lt.eq epsilon_n$ on this unit-length interval. Iterate the gain term five times. Using positivity and (10.6) gives

$ f_n \( t \, x \, v \) lt.eq \( a + ell_n + epsilon_n \) sum_(j = 0)^4 frac(\( C log \( 1 \/ a \) \)^j, j !) + \( cal(V)_n^5 f_n \) \( t \, x \, v \) \, #h(2em) a lt.eq t lt.eq tau_n . quad "(10.8)" $ <nc:five-residual>

Every formula is used on a common full-measure set of characteristics for the finite approximation.

The term outside $cal(V)_n^5 f_n$ becomes arbitrarily small when first $n arrow.r oo$ and then $a arrow.b 0$. We therefore need to show that the five-fold term tends to zero at endpoints carrying a fixed positive fraction of the cap. We first control those endpoints, then separate axial and nonaxial limiting velocities.

=== 10.3 Compactness of the relevant endpoints <compactness-of-the-relevant-endpoints>

#thm([Lemma 10.3.])[
  (Endpoint and path truncations).  #emph[Fix $a > 0$, and let $t_n in \[ a \, 1 \]$. In a five-fold integral $\( cal(V)_n^5 F_n \) \( t_n \, x_n \, v_n \)$, assume $0 lt.eq F_n lt.eq 2$. For every prescribed error, one may restrict all $\| p_i \| + \| v_i - v_(i - 1) \|$ and sheet parameters to fixed bounded sets at that error, uniformly in $n \, t_n \, x_n \, v_n$. Moreover:]
  + #emph[if $\| v_n \| arrow.r oo$, the whole integral tends to zero;]
  + #emph[after retaining bounded endpoint velocities, an endpoint escaping every bounded neighborhood of every dilated periodic origin also has a vanishing integral.]
  #emph[Consequently any sequence along which the five-fold integral has a positive lower bound has, after periodic translations and subselection, convergent endpoint positions and velocities.]
] <nc:endpoint-tightness>

#proof[
  At any one gain, a removed normalized tail has uniformly small mass by Lemma 34. Bound the other four gains and the input by (10.6), and sum over the five possible locations of a removed tail. This proves the first assertion. The same argument at the first gain, using its uniform decay for large outgoing velocities, proves (i).
  Retain bounded endpoint velocities and bounded increments. Then all velocities are bounded by a fixed $V$, and every collision position is within distance $V$ of the endpoint, since the total free-flight time is at most one. Suppose
  $ d_n := "dist" \( x_n \, r_n^(- 1) Lambda \) arrow.r oo . $
  We show that the first kernel becomes uniformly small on these paths. A main core of dilated scale $𝜚 gt.eq M$ has normalized mass at most $C \/ M$, by (10.3) and the sheet bound. Here $M$ can be chosen arbitrarily large, independently of $n$. For a main core with $𝜚 lt.eq M$, let $q \/ r_n$, $q in Lambda$, be its period point. Write $\( y \, z \)$ for the first collision position relative to this point. Its transverse coordinate obeys $\| y \| lt.eq e^eta M$, while its distance to this point is at least $d_n - V$. Consequently $\| z \| arrow.r oo$, uniformly over all encountered cores of these scales. For bounded $p_3 \, t$, their parameter amplitudes satisfy
  $ frac(K S \( gamma \( z - t p_3 \) \/ 𝜚 \), 𝜚 + t alpha gamma S \( gamma \( z - t p_3 \) \/ 𝜚 \)) lt.eq K / 𝜚 S \( gamma \( z - t p_3 \) \/ 𝜚 \) arrow.r 0 quad "(10.9)" $ <nc:axial-escape>
  uniformly for $0 < 𝜚 lt.eq M$. In fact, when $\| z - t p_3 \| gt.eq Z$, the right side is at most $4 K 𝜚^(- 1) e^(- 2 gamma Z \/ 𝜚)$, whose supremum tends to zero as $Z arrow.r oo$. Applying the sheet bound with this vanishing amplitude proves the assertion for $𝜚 lt.eq M$. The remaining gains have bounded mass. First let $n arrow.r oo$, then $M arrow.r oo$, and finally remove the initial tail error. This proves (ii).
  It follows that a sequence with a positive lower bound for its five-fold integral has bounded velocities and bounded distance from $r_n^(- 1) Lambda$, after subselection. Choose period points $q_n \/ r_n$ realizing a bounded distance, and translate the endpoints by these periods. The resulting positions have a convergent subsequence. Such translations preserve both the kernels and the periodic hot inputs used below.
  We record also the geometry along the translated bounded paths. Every physical main enlargement for times $r_n t lt.eq r_n$ lies in a fixed ball of radius less than $1 \/ 2$ about its period point, for sufficiently small $s_0 \, r_n$. Distinct points of $Lambda$ are at least distance one apart. A path in a bounded dilated set lies at physical distance $O \( r_n \)$ from the chosen origin, so for all large $n$ it can encounter only that copy. Its encountered scales satisfy $s \/ r_n lt.eq C$, by the transverse annular restriction. Thus the largest physical width along these paths is $O \( r_n^10 \)$, which tends to zero. ◻
]

=== 10.4 Kernel estimates near the velocity axis <kernel-estimates-near-the-velocity-axis>

The preceding localization reduces the problem to bounded endpoint velocities. To distinguish axial and nonaxial limits, we now refine the normalized sheet bounds of Section 3. The estimates below, from #cite(label("OpenAIPeriodic")) Section 3, allow transverse concentration of the hot input but prevent concentration in its axial coordinate. We recall that $cal(S)_L$ is the class of probability mixtures of sheets $cal(G)_d ⊗ rho$, where $0 lt.eq d lt.eq 1 \/ 8$ and $integral e^(8 a^2) rho \( thin upright(d) a \) lt.eq L$, and that $cal(K)_c$ denotes the normalized measure in (3.8).

#thm([Lemma 10.4.])[
  (Kernel estimates near the axis).  #emph[Fix $1 lt.eq L < oo$. The following conclusions hold uniformly for $c in cal(S)_L$ and for outgoing velocities off the axis.]
  + #emph[For every fixed $M \, delta > 0$, 
$ & lim_(epsilon arrow.b 0) sup_(c in cal(S)_L) "ess sup"_(\| v \| lt.eq M\
0 < \| macron(v) \| lt.eq epsilon) cal(K)_c \( v \; \| macron(xi) \| gt.eq delta \) = 0 \,\
 & lim_(epsilon arrow.b 0) sup_(c in cal(S)_L) "ess sup"_(\| v \| lt.eq M\
0 < \| macron(v) \| lt.eq epsilon) cal(K)_c \( v \; \| v_3 - p_3 \| gt.eq delta \) = 0 . quad "(10.10)" $ <ker:axis-input>

]
  + #emph[The axial input marginals are uniformly non-atomic. More precisely, for each $R gt.eq 1$ and each interval $I$ of length $0 < ell lt.eq 1$, 
$ cal(K)_c \( v \; \| p \| + \| xi - v \| lt.eq R \, med xi_3 in I \) lt.eq C_(q \, m \, L \, R) #scale(x: 120%, y: 120%)[\(] ell + ell^(2 - q) #scale(x: 120%, y: 120%)[\)] . quad "(10.11)" $ <ker:axial-interval>

 In combination with (3.15), this gives 
$ lim_(ell arrow.b 0) sup_(c in cal(S)_L) "ess sup"_v sup_(\| I \| lt.eq ell) cal(K)_c \( v \; xi_3 in I \) = 0 . quad "(10.12)" $ <ker:axial-modulus>

]
  + #emph[Let $cal(S)_L \( epsilon \)$ denote the subclass whose elementary transverse widths are at most $epsilon$. For every $M < oo$ and $r_0 > 0$, 
$ lim_(delta arrow.b 0) limsup_(epsilon arrow.b 0) sup_(c in cal(S)_L \( epsilon \)) "ess sup"_(\| v \| lt.eq M\
\| macron(v) \| gt.eq r_0) cal(K)_c \( v \; \| macron(xi) \| < delta \) = 0 . quad "(10.13)" $ <ker:off-axis-small-input>

]
  #emph[All these conclusions hold under uniformly bounded sheet amplitudes.]
] <lem:axis-kernel-estimates>

#proof[
  By (3.15), we may work on $\| p \| + \| xi - v \| lt.eq R$ and remove that restriction at the end of each argument. On this region the exponential and polynomial factors in (3.11) are bounded by a constant depending on $R$.
  For (10.10), on $\| macron(xi) \| gt.eq delta$ the factor $W \( xi \)$ is bounded by $1 + delta^(- q)$. The regular line estimate and (3.6) therefore give
  $ C_(R \, delta) frac(\| macron(v) \|^(- 1), 1 + \| macron(v) \|^(- q)) lt.eq C_(R \, delta) \| macron(v) \|^(q - 1) #h(2em) \( 0 < \| macron(v) \| lt.eq 1 \) . $
  For (10.10), integrate in $xi_3$ first, using $\| v_3 - p_3 \|^(- 1) lt.eq delta^(- 1)$ and (3.17). The bound is $C_(R \, delta) \/ W \( v \) lt.eq C_(R \, delta) \| macron(v) \|^q$. These are uniform in the axial law. For (10.11), discard the bounded exponential and polynomial factors and apply (3.3). This also proves (10.12) after the tail removal.
  It remains to prove (10.13). Fix the truncation radius $R$. The part $\| macron(p) \| > r_0 \/ 4$ is uniformly negligible as the transverse widths tend to zero. Indeed,
  $ upright(bold(1))_(\| macron(p) \| > r_0 \/ 4) cal(G)_d \( thin upright(d) macron(p) \) lt.eq 2 e^(- r_0^2 \/ \( 32 d^2 \)) cal(G)_(sqrt(2) d) \( thin upright(d) macron(p) \) \, $
  and Lemma 6 applies to the wider Gaussian for all sufficiently small $d$. Now retain $\| macron(p) \| lt.eq r_0 \/ 4$. Write $n = macron(v) - macron(p)$, $A = \( n \/ \| n \| \) dot.op macron(v)$, and $B = \( v_3 - p_3 \) \/ \| n \|$, as in Lemma 4. Then
  $ \| n \| gt.eq 3 / 4 r_0 \, #h(2em) A gt.eq 3 / 5 r_0 . $
  If $\| v_3 - p_3 \| lt.eq r_0^2 \/ \( 8 R \)$, then for $\| xi_3 - v_3 \| lt.eq R$,
  $ \| B \( xi_3 - v_3 \) \| lt.eq 1 / 6 r_0 . $
  The transverse collision line stays at distance greater than $r_0 \/ 3$ from zero, and cannot meet $\| macron(xi) \| < delta$ when $delta < r_0 \/ 3$. In the complementary case, $\| v_3 - p_3 \|^(- 1) lt.eq 8 R \/ r_0^2$. Integrating first in $xi_3$ bounds the small-input contribution by
  $ C_(R \, r_0) integral_(\| macron(xi) \| < delta) \( 1 + \| macron(xi) \|^(- q) \) thin thin upright(d) macron(xi) lt.eq C_(R \, r_0) \( delta^2 + delta^(2 - q) \) . $
  First let the widths tend to zero, then $delta$ tend to zero, and finally remove the truncation. This proves the last assertion. ◻
]

These conclusions apply to the core kernels (10.4): for $t gt.eq a > 0$ the proof of Lemma 34 gives sheet domination with a fixed axial moment bound and amplitude $C \/ a$. On the localized paths, the transverse widths tend uniformly to zero, as shown at the end of Lemma 35. This is the additional hypothesis needed for (10.13).

#prodef([Remark 10.5.])[
  (A sharp axial endpoint).  A single normalized gain need not become small as the outgoing velocity approaches the axis. Recall $a_q = integral_(bb(R)) \( 1 + s^2 \)^(- q \/ 2) thin upright(d) s$ from (3.4). Take $c = delta_(\( 0 \, 0 \, u \))$ and $v_epsilon = \( epsilon \, 0 \, u \)$. The collision plane is $xi_1 = epsilon$, and
  $ frac(P \( c \, H \) \( v_epsilon \), H \( v_epsilon \)) = frac(2, epsilon H \( v_epsilon \)) integral_(bb(R)^2) H \( epsilon \, y \, z \) thin thin upright(d) y thin thin upright(d) z . $
  The regular part of $W \( epsilon \, y \, z \)$ contributes $O \( epsilon^(q - 1) \)$. In its singular part substitute $y = epsilon s$. Dominated convergence, with dominating function $\( 1 + s^2 \)^(- q \/ 2) e^(- z^2) chevron.l z chevron.r^(- m)$, gives
  $ lim_(epsilon arrow.b 0) frac(P \( c \, H \) \( v_epsilon \), H \( v_epsilon \)) = 2 a_q e^(u^2) chevron.l u chevron.r^m integral_(bb(R)) e^(- z^2) chevron.l z chevron.r^(- m) thin thin upright(d) z > 0 . $
  The corresponding axial input marginal converges to the absolutely continuous measure
  $ 2 a_q e^(u^2) chevron.l u chevron.r^m e^(- z^2) chevron.l z chevron.r^(- m) thin thin upright(d) z . $
  Thus transverse concentration is compatible with the uniform axial interval estimate. This is the reason for using two successive gains in the axial argument that follows.
] <ker:matching-axis>

=== 10.5 Two gains at an axial endpoint <two-gains-at-an-axial-endpoint>

For $𝜚 > 0$ and $sigma in { - 1 \, 1 }$, denote by $u_(𝜚 \, sigma) \( t \, z \)$ the solution of

$ u = sigma + alpha tanh #scale(x: 120%, y: 120%)[\(] gamma \( z - t u \) \/ 𝜚 #scale(x: 120%, y: 120%)[\)] . $

This notation extends the profile independently of every annular or stripe mask.

#thm([Lemma 10.6.])[
  (Characteristic matching and small scales).  #emph[On every compact set with $t gt.eq a > 0$, the following statements hold uniformly.]
  + #emph[If $a lt.eq t_2 lt.eq t_1$, $Delta = t_1 - t_2$, and $z_2 = z_1 - Delta w$, then 
$ \| w - u_(𝜚 \, sigma) \( t_1 \, z_1 \) \| lt.eq \| w - u_(𝜚 \, sigma) \( t_2 \, z_2 \) \| . quad "(10.14)" $ <nc:matching-inequality>

]
  + #emph[As $𝜚 arrow.b 0$, the distance of $u_(𝜚 \, sigma) \( t \, z \)$ to 
$ { z \/ t \, med sigma - alpha \, med sigma + alpha } $

 tends to zero uniformly. For the perturbed axial velocity in (10.3), 
$ \| p_3 - u_(𝜚 \, sigma) \( t \, z \) \| lt.eq d_s \| w_3 \| . quad "(10.15)" $ <nc:thermal-speed-error>

]
] <nc:characteristic-matching>

#proof[
  The profile satisfies
  $ partial_z u_(𝜚 \, sigma) = frac(\( alpha gamma \/ 𝜚 \) S, 1 + \( t alpha gamma \/ 𝜚 \) S) gt.eq 0 \, #h(2em) partial_t u_(𝜚 \, sigma) + u_(𝜚 \, sigma) partial_z u_(𝜚 \, sigma) = 0 . $
  For fixed $t_1 \, t_2 \, z_1$, the function $F \( w \) = w - u_(𝜚 \, sigma) \( t_2 \, z_1 - Delta w \)$ has derivative $F' \( w \) gt.eq 1$. Its root is $u_(𝜚 \, sigma) \( t_1 \, z_1 \)$: the defining implicit equation shows that this velocity is unchanged along the straight segment between the two points. Integrating $F' gt.eq 1$ proves (10.14).
  Fix $0 < delta < alpha$. If $u_(𝜚 \, sigma)$ is within $delta$ of an endpoint speed, there is nothing to prove. Otherwise
  $ lr(|frac(u_(𝜚 \, sigma) - sigma, alpha)|) lt.eq 1 - delta / alpha \, #h(2em) \| z - t u_(𝜚 \, sigma) \| lt.eq 𝜚 / gamma "arctanh" \( 1 - delta \/ alpha \) . $
  It follows that
  $ \| u_(𝜚 \, sigma) - z \/ t \| lt.eq frac(𝜚, gamma a) "arctanh" \( 1 - delta \/ alpha \) . $
  First choose $delta$, then $𝜚$ small. This proves the uniform assertion in (ii). Finally, the function
  $ p mapsto p - sigma - alpha tanh #scale(x: 120%, y: 120%)[\(] gamma \( z - t p \) \/ 𝜚 #scale(x: 120%, y: 120%)[\)] $
  has derivative at least one. Its values at $u_(𝜚 \, sigma)$ and at the perturbed $p_3$ are $0$ and $d_s w_3$. This proves (10.15). ◻
]

#thm([Lemma 10.7.])[
  (Vanishing of two axial gains).  #emph[Fix $a > 0$. Let $t_n in \[ a \, 1 \]$, and suppose the endpoint positions and velocities are bounded with $macron(v)_n arrow.r 0$. Then 
$ \( cal(V)_n^2 1 \) \( t_n \, x_n \, v_n \) arrow.r 0 . $

 The conclusion continues to hold if all subsequent factors in a longer finite gain integral are bounded uniformly.]
] <nc:two-axial-gains>

#proof[
  Remove normalized parameter and increment tails at an arbitrarily small cost, using Lemma 34. On the retained two-gain paths, all velocities and positions lie in fixed compact sets, the times lie in $\[ a \, 1 \]$, and every active scale satisfies $0 < 𝜚 lt.eq M$. In particular the largest possible physical width is $d_0 \( r_n M \)^10 arrow.r 0$.
  Write $t_1 \, x_1 = \( y_1 \, z_1 \)$ for the first collision point, and $xi$ for its input velocity. The next point has axial coordinate $z_2 = z_1 - \( t_1 - t_2 \) xi_3$. All estimates below are uniform when $t_1 \, x_1$ vary in their retained compact sets. At the first gain, Lemma 36 supplies a common modulus $omega \( rho \) arrow.b 0$ for the mass of any axial interval of length $rho$; the interval’s center is arbitrary. It also says that for each fixed $b > 0$, the first-kernel mass on ${ \| macron(xi) \| > b }$ tends to zero as $macron(v)_n arrow.r 0$.
  Here is an order of choices that handles all scales at the second point. Fix an error $epsilon.alt > 0$, including the fixed factors from the two time integrations and the bound $C \/ a$. Choose $delta > 0$ so that the sum of the first-kernel masses of the $delta$-neighborhoods of the five numbers
  $ z_1 \/ t_1 \, quad 1 - alpha \, quad 1 + alpha \, quad - 1 - alpha \, quad - 1 + alpha quad "(10.16)" $ <nc:collapsed-speeds>
  is at most $epsilon.alt$. This is possible uniformly because there are five intervals and their lengths are $2 delta$. Lemma 38 then gives $𝜚_0 > 0$, chosen uniformly on the retained compact sets, so that every profile with $𝜚 < 𝜚_0$ is within $delta \/ 4$ of its corresponding three collapsed speeds.
  The geometric mesh has a uniformly bounded number $J_0$ of scales in $\[ 𝜚_0 \, M \]$. Choose $b_0 > 0$ so small that the first-kernel mass of the union of the $b_0$-neighborhoods of
  $ { u_(𝜚 \, sigma) \( t_1 \, z_1 \) : 𝜚 in \[ 𝜚_0 \, M \] upright(" in the current mesh") \, med sigma = plus.minus 1 } $
  is at most $epsilon.alt$. For example it suffices that $2 J_0 omega \( 2 b_0 \) lt.eq epsilon.alt$, after incorporating the fixed amplitude bound into $omega$. This list may depend on $n$; its cardinality bound does not. Its centers may depend on $t_1 \, z_1$, which are held fixed when the first kernel is integrated. Thus neither dependence weakens the interval bound.
  Let $E_n \( t_1 \, z_1 \)$ be the union of the neighborhoods of the five collapsed speeds in (10.16) and the neighborhoods of the finite-scale profile speeds just chosen. Outside $E_n$, every retained cold speed at the second point has an axial mismatch bounded below by a fixed positive number for all large $n$. For $𝜚 gt.eq 𝜚_0$, this follows from (10.14) and (10.15), with lower bound $b_0 \/ 2$. For a constant collapsed speed it follows immediately, with lower bound $delta \/ 2$. For the remaining branch use the exact identity
  $ xi_3 - z_2 / t_2 = t_1 / t_2 (xi_3 - z_1 / t_1) \; $
  the factor $t_1 \/ t_2 gt.eq 1$ preserves the lower bound. The errors $delta \/ 4$ in small-scale approximation and the vanishing thermal errors can be absorbed. We have therefore obtained, on the complement of $E_n$,
  $ \| xi_3 - p_3^(\( 2 \)) \| gt.eq c_(*) := 1 / 4 min \( delta \, b_0 \) > 0 $
  for every retained second-core parameter.
  The second-kernel axial mismatch estimate in Lemma 36 now tends uniformly to zero as $\| macron(xi) \| arrow.r 0$. Choose $b > 0$ so small that this second kernel has mass at most $epsilon.alt$ whenever $\| macron(xi) \| lt.eq b$ and the displayed mismatch holds. For this fixed $b$, the first-kernel mass on $\| macron(xi) \| > b$ tends to zero. Its mass on $E_n$ is at most $2 epsilon.alt$, while the remaining first-kernel mass is bounded. Combining the three regions, then removing the initial tail error, gives a bound tending to zero as $epsilon.alt arrow.b 0$. All choices preceded the final passage $n arrow.r oo$, and were uniform in the two times. This proves the lemma.
  In a longer integral, all factors following these two gains are bounded by (10.6); the same proof applies. ◻
]

=== 10.6 Finite-dimensional regularization away from the axis <finite-dimensional-regularization-away-from-the-axis>

Two gains have now ruled out endpoints approaching the velocity axis. At a nonaxial endpoint the kernel mass need not vanish. Instead, we will show that five gains cannot concentrate their input on a set of small spacetime–velocity volume. The next three lemmas make this statement precise: they parameterize the collision planes, give an abstract estimate for composing measurable functions with smooth maps, and verify the required rank for five successive collisions.

#thm([Lemma 10.8.])[
  (Redundant plane parameters).  #emph[Let $n eq.not 0$, $e = n \/ \| n \|$, and let $zeta$ be a bounded nonnegative function supported in $\[ - 1 \, 1 \]$ with integral one. For every nonnegative measurable $F$, 
$ integral_(n^perp) F \( k \) frac(thin upright(d) A \( k \), \| n \|) = integral_(bb(R)^3) F \( n times L \) \| n \| zeta \( L dot.op e \) thin upright(d) L . quad "(10.17)" $ <nc:plane-identity>

 When $delta lt.eq \| n \| lt.eq R$ and the plane integral is restricted to $\| k \| lt.eq R_1$, the corresponding parameter measure $upright(bold(1))_({ \| n times L \| lt.eq R_1 }) \| n \| zeta \( L dot.op e \) thin upright(d) L$ is supported in 
$ \| L \| lt.eq sqrt(\( R_1 \/ delta \)^2 + 1) $

 and has density at most $R parallel zeta parallel_oo$. This bound concerns the parameter measure before multiplication by $F \( n times L \)$. The identity can be applied successively when each normal is a measurable function of parameters chosen at earlier gains.]
] <nc:plane-parameters>

#proof[
  Write $L = L^perp + lambda e$. The map $L^perp mapsto n times L^perp$ multiplies two-dimensional area by $\| n \|^2$. Integration in $lambda$ contributes $integral zeta = 1$, proving (10.17) and the support and density bounds. For successive gains, fix all previous parameters before applying the identity. The current normal is then fixed; Fubini’s theorem for nonnegative functions justifies iteration. No derivatives of the variable normals enter this conditional change of variables. ◻
]

#thm([Lemma 10.9.])[
  (Uniform pullback estimate).  #emph[Let $cal(O) subset bb(R)^k$ be open, $k gt.eq d$, and suppose $Phi_n \, Phi : cal(O) arrow.r bb(R)^d$ satisfy $Phi_n arrow.r Phi$ in $C_(upright("loc"))^1$ and $"rank" D Phi = d$ almost everywhere. Let $K subset.double cal(O)$ and $B subset bb(R)^d$ be compact. Let $a_n$ be measurable, supported in $K$, with $\| a_n \| lt.eq A$. Let $F_n$ be measurable, supported in $B$, with $\| F_n \| lt.eq M$, and converging to zero in measure. Then 
$ integral_(cal(O)) \| F_n \( Phi_n \( q \) \) a_n \( q \) \| thin upright(d) q arrow.r 0 . quad "(10.18)" $ <nc:pullback-conclusion>

 No convergence or continuity of the densities $a_n$ is required.]
] <nc:uniform-pullback>

#proof[
  Boundedness and convergence in measure on the finite-volume set $B$ imply $parallel F_n parallel_(L^1 \( bb(R)^d \)) arrow.r 0$: for every $eta > 0$, bound the integral by $eta \| B \| + M \| { \| F_n \| > eta } \|$.
  Fix $epsilon.alt > 0$. The critical set in $K$ has measure zero, so choose an open neighborhood $E$ of it with $\| E ∩ K \| < epsilon.alt$. The compact set $K \\ E$ consists of regular points. At such a point $q_0$, choose $d$ input coordinates giving a nonzero minor of $D Phi \( q_0 \)$. Let $pi$ be projection onto the complementary $k - d$ coordinates, and define
  $ G \( q \) = \( Phi \( q \) \, pi q \) \, #h(2em) G_n \( q \) = \( Phi_n \( q \) \, pi q \) \, #h(2em) A_0 = D G \( q_0 \) . $
  The matrix $A_0$ is invertible. Choose a convex ball $V subset.double cal(O)$ about $q_0$ so small that, for all sufficiently large $n$,
  $ sup_(q in V) parallel A_0^(- 1) D G_n \( q \) - I parallel < 1 / 2 . $
  Integration on the line segment between $q \, q' in V$ gives
  $ \| A_0^(- 1) \( G_n \( q \) - G_n \( q' \) \) - \( q - q' \) \| lt.eq 1 / 2 \| q - q' \| . $
  Thus $G_n$ is injective on $V$, and its Jacobian has a positive lower bound $c_V$ independent of $n$. The inverse function theorem consequently makes it a diffeomorphism onto its image.
  Cover $K \\ E$ by finitely many such balls $V_j$. The change-of-variables formula gives
  $ integral_(V_j ∩ K) \| F_n \( Phi_n \( q \) \) \| thin upright(d) q & lt.eq c_(V_j)^(- 1) integral_(G_(n \, j) \( V_j ∩ K \)) \| F_n \( z \) \| thin upright(d) z thin thin upright(d) w\
 & lt.eq c_(V_j)^(- 1) \| pi_j \( V_j \) \| parallel F_n parallel_(L^1 \( bb(R)^d \)) . $
  When $k = d$, the zero-dimensional factor has value one. The integral on $E ∩ K$, including its density, is at most $A M epsilon.alt$. Multiplying the regular-chart estimates by $A$ and summing over the finite cover gives
  $ limsup_(n arrow.r oo) integral_(cal(O)) \| F_n \( Phi_n \( q \) \) a_n \( q \) \| thin upright(d) q lt.eq A M epsilon.alt . $
  Let $epsilon.alt arrow.b 0$. This proves (10.18). The argument used the densities only through $\| a_n \| lt.eq A$, so arbitrary measurable masks and restrictions may be included in them without any convergence assumption. ◻
]

#thm([Lemma 10.10.])[
  (Five-gain rank and robust pullback).  #emph[Fix a nonaxial endpoint velocity $v_0$, an endpoint $\( t_0 \, x_0 \)$ with $t_0 > 0$, five positive scales $𝜚_i$, and five signs $sigma_i$. Given positive times $t_i$ and $L_i in bb(R)^3$, define recursively 
$ x_i & = x_(i - 1) - \( t_(i - 1) - t_i \) v_(i - 1) \,\
p_i & = u_(𝜚_i \, sigma_i) \( t_i \, z_i \) e_3 \, #h(2em) n_i = v_(i - 1) - p_i \,\
k_i & = n_i times L_i \, #h(2em) v_i = v_(i - 1) + k_i \, #h(2em) i = 1 \, dots.h \, 5 . quad "(10.19)" $ <nc:rank-map>

 The map 
$ Phi : \( t_1 \, dots.h \, t_5 \, L_1 \, dots.h \, L_5 \) mapsto \( t_5 \, x_5 \, v_5 \) $

 is real analytic on the connected open set $\( 0 \, oo \)^5 times bb(R)^15$, and has rank seven almost everywhere. In particular it is a submersion almost everywhere on the ordered region $0 < t_5 < dots.h.c < t_1 < t_0$.]
  #emph[For convergent endpoint sequences with a nonaxial limiting velocity, convergent positive scale sequences, and the finite-temperature core formulas (10.3), the analogous maps converge in $C^1$ on compact parameter sets to $Phi$. Bounded measurable parameter densities supported in a common compact set therefore satisfy Lemma 41, including after any measurable spatial, velocity, or time restrictions.]
] <lem:five-gain-rank>

#proof[
  For $t > 0$, the derivative with respect to $u$ in the defining implicit equation is
  $ 1 + frac(t alpha gamma, 𝜚) S #scale(x: 120%, y: 120%)[\(] gamma \( z - t u \) \/ 𝜚 #scale(x: 120%, y: 120%)[\)] > 0 . $
  The implicit analytic function theorem gives an analytic profile for every $z in bb(R)$. Uniqueness, which also follows from this strict monotonicity, identifies the local profiles on overlaps. The recursive formulas (10.19) are consequently analytic. They make sense even without ordering the positive times: a negative formal free-flight duration merely changes the point at which the next analytic profile is evaluated. This supplies the connected open domain stated in the lemma.
  We exhibit one rank-seven point. Fix $t_5 = tau$ with $0 < tau < t_0$, and set all five collision times equal to $tau$. After a rotation about the velocity axis, write $v_0 = \( R \, 0 \, z \)$, $R > 0$. All collision positions now coincide at $x_0 - \( t_0 - tau \) v_0$, independently of the angular parameters. Thus write the five axial velocities simply as $p_i = a_i e_3$; their values $a_i$ may be arbitrary.
  Choose
  $ k_1 = \( 0 \, 1 \, 0 \) \, #h(2em) k_2 = \( 1 \, - R \, 0 \) . $
  They satisfy $k_1 perp n_1$, $k_2 perp n_2$, and span the transverse plane. Put
  $ w = macron(v)_2 = \( R + 1 \, 1 - R \) eq.not 0 \, #h(2em) b_3 = v_(2 \, 3) - a_3 \, $
  and choose a sufficiently small nonzero number $epsilon.alt$ and
  $ k_3 = epsilon.alt (- frac(b_3 w, \| w \|^2) \, 1) . $
  Then $k_3 perp n_3$, its axial component is nonzero, and $macron(v)_3 eq.not 0$. Hence $k_1 \, k_2 \, k_3$ are linearly independent. Writing $macron(v)_3 = \( X \, Y \)$, take
  $ k_4 = \( - Y \, X \, 0 \) \, #h(2em) k_5 = 0 . $
  The fourth increment is perpendicular to $n_4$, and
  $ det \( macron(n)_4 \, macron(n)_5 \) = X^2 + Y^2 > 0 . $
  Thus $n_4 \, n_5$ are nonparallel. All the normals in this construction are nonzero, and every chosen increment can be represented by $L_i = - n_i times k_i \/ \| n_i \|^2$. Choose $L_5 = 0$.
  At the equal-time configuration,
  $ x_5 = x_0 - v_0 \( t_0 - t_1 \) - sum_(i = 1)^4 v_i \( t_i - t_(i + 1) \) . $
  All derivatives of $x_5$ in angular directions vanish. Keeping $t_5$ fixed, its first three time columns are
  $ partial_(t_1) x_5 = - k_1 \, #h(2em) partial_(t_2) x_5 = - k_2 \, #h(2em) partial_(t_3) x_5 = - k_3 . $
  Derivatives of the $v_i$, including derivatives of the position-dependent $p_i$, are multiplied by zero free-flight durations in this formula. In the final velocity block,
  $ delta_(L_4) v_5 = n_4 times delta L_4 \, #h(2em) delta_(L_5) v_5 = n_5 times delta L_5 \, $
  because $L_5 = 0$ and the $p_i$ have zero angular position derivatives at equal times. The sum of the planes $n_4^perp + n_5^perp$ is $bb(R)^3$. Choose three angular columns spanning this sum. Together with the three time columns above, they give an invertible $6 times 6$ block for $\( x_5 \, v_5 \)$: its upper-right block is zero and both diagonal blocks are invertible. Appending the $t_5$ column and target coordinate gives a nonzero $7 times 7$ minor.
  This minor is a nontrivial analytic function on the connected domain. Its zero set has Lebesgue measure zero. For completeness, at any zero of a nontrivial analytic function some derivative of finite order is nonzero; otherwise its Taylor series vanishes on a neighborhood, and analytic continuation through overlapping balls in the connected domain makes the function identically zero. Choosing a derivative of minimal nonzero order puts the point on a regular zero set of a derivative of one lower order. There are countably many such derivatives, and each regular zero set is covered by countably many smooth hypersurface charts. Their union is null. Rank failure is contained in the zero set of our particular minor, so it is null as well. Continuity also shows directly that the witness persists at nearby strictly ordered times. It need not obey any spatial mask.
  For the prelimit maps replace $p_i$ by (10.3) and include $w_i in bb(R)^3$ among the parameters. On compact sets the scales have positive lower bounds, $d_(r_n 𝜚_i) arrow.r 0$, and all implicit derivatives have the same positive lower bound one. Differentiating the implicit equations, or applying their implicit function formulas, gives $C^1$ convergence in the times, positions, and all bounded $L_i \, w_i$. The limit is $Phi$, independent of the fifteen spectator $w_i$-coordinates. Its rank is still seven almost everywhere on the enlarged parameter domain, by Fubini. Lemma 41 now proves the final assertion. ◻
]

#thm([Lemma 10.11.])[
  (Vanishing of five nonaxial gains).  #emph[Suppose $ell_n arrow.r 0$, the hit endpoints converge after periodic translation, and their limiting velocity is nonaxial. Suppose also that $0 lt.eq f_n lt.eq 2$ on $a lt.eq t lt.eq tau_n$ and $f_n arrow.r 0$ in measure on every compact subset of 
$ \( 0 \, U \) times bb(R)_x^3 times { v in bb(R)^3 : macron(v) eq.not 0 } . $

 Then 
$ \( cal(V)_n^5 f_n \) \( tau_n \, x_n \, v_n \) arrow.r 0 . $

]
] <nc:five-nonaxial-gains>

#proof[
  Fix an arbitrarily small error tolerance. Remove the tails of Lemma 35. All path velocities and positions are now in fixed bounded sets. At every encountered main core, $s lt.eq C r_n$, so its transverse width tends uniformly to zero.
  Starting from a positive lower bound for the endpoint transverse speed, apply the nonaxial small-input estimate in Lemma 36 successively at gains $1 \, dots.h \, 5$. Choose positive numbers $b_1 \, dots.h \, b_5$ so that deleting $\| macron(v)_i \| < b_i$ costs less than the prescribed error at step $i$. At each step the previous lower bound has already been fixed; the later gain masses are bounded by (10.6). Thus this is a finite successive choice, followed by $n arrow.r oo$. The sum of the five deleted contributions is arbitrarily small. Write $b > 0$ for a lower bound on all retained transverse speeds, including $v_0$. For large $n$, every retained normal $v_(i - 1) - p_i$ has length at least $b \/ 2$.
  Next delete collision points with $\| y_i \| < rho$. Conditional on all earlier parameters, $y_i$ is an affine function of $t_i$ with derivative $macron(v)_(i - 1)$. Consequently
  $ lr(|{ t_i : \| y_i \| < rho }|) lt.eq frac(2 rho, b) . $
  Integrate the current kernel using its mass bound $C \/ a$, and bound the later kernels by (10.6). Summing over the five steps bounds this deletion by $C_a rho \/ b$. Choose $rho > 0$ after the speed thresholds. The retained scales now belong to a compact subinterval $\[ 𝜚_(-) \, 𝜚_(+) \] subset \( 0 \, oo \)$. Mesh convergence gives a fixed finite list of scales on this interval, with positive limits, after an immaterial enlargement of its endpoints. There are consequently only finitely many five-tuples of scales and signs to consider.
  The tested time $t_5$ must remain inside the weak-limit interval. If $U > 1$, it already lies in the compact interval $\[ a \, 1 \] subset.double \( 0 \, U \)$. If $U = 1$, delete $t_5 > 1 - delta$. Ordering forces all five times into $\( 1 - delta \, tau_n \)$, whose length is at most $delta$. This costs at most
  $ 2 \( C \/ a \)^5 frac(delta^5, 5 !) . quad "(10.20)" $ <nc:upper-endpoint-cost>
  Choose $delta > 0$ to make this as small as desired. No convergence at the event time is being asserted.
  We also remove a thin neighborhood of the boundary of the ordered time region. Put $t_0 = tau_n$, and discard paths on which $t_5 - a < kappa$ or $t_(i - 1) - t_i < kappa$ for some $1 lt.eq i lt.eq 5$. Integrating velocities successively with the bound $C \/ a$, their total contribution is at most $C_a kappa$: each of the six time strips has five-dimensional volume at most $kappa$ in the unit cube. Choose $kappa > 0$ after the preceding tolerances. On the retained set all consecutive time gaps are at least $kappa$, and the lower time exceeds $a + kappa$. Since $tau_n arrow.r 1$, the retained times lie in a fixed compact subset of $0 < t_5 < dots.h.c < t_1 < 1$ for all large $n$.
  Fix one retained scale/sign tuple. Drop all spatial masks in constructing its maps, and retain the masks in its nonnegative integrand. Each plane increment is bounded, all normals are bounded above and below, and each cold parameter is bounded. Apply Lemma 40 successively. The integral becomes an integral over five times, fifteen $L$-coordinates, and fifteen cold parameter coordinates. Its support lies in a fixed compact subset of $\( 0 \, oo \)^5 times bb(R)^30$, and its density is uniformly bounded: the core amplitudes are at most $C \/ a$, the factors $\| n_i \| zeta \( L_i dot.op n_i \/ \| n_i \| \)$ are bounded, and all retained ratios $H \( v_i \) \/ H \( v_(i - 1) \)$ are bounded. The masks, time ordering, and cut conditions are arbitrary measurable factors between zero and one in this density.
  The target $\( t_5 \, x_5 \, v_5 \)$ on the actual support lies in a fixed compact set $B$ inside the open weak-limit region, away from the velocity axis. Set $F_n = f_n upright(bold(1))_B upright(bold(1))_({ a lt.eq t lt.eq tau_n })$ and extend it by zero; it is bounded by two and tends to zero in measure. The maps converge in $C^1$ to the map in Lemma 42. That lemma and Lemma 41 show that the integral for this tuple tends to zero. Notice that the entire parameter compact need not map into $B$; only the support of the measurable density must do so.
  There are finitely many tuples, so their sum tends to zero. The total limsup of the original integral is bounded by the arbitrarily small errors from the preceding deletions. Letting those tolerances tend to zero proves the lemma. ◻
]

=== 10.7 Completion of the nonvanishing argument <completion-of-the-nonvanishing-argument>

#proof[
  #emph[Completion of the proof of Proposition 33.] Assume $l = 0$ and $g = 0$, as in the reduction above. Choose endpoints $\( x_n \, v_n \)$ at time $tau_n$ in the common full-measure set fixed above such that $f_n \( tau_n \, x_n \, v_n \) gt.eq 1 \/ 2$. For each fixed $a$, the residual in (10.8) tends to zero along any subsequence of these endpoints. Indeed, Lemma 35 first excludes large velocities and escaping positions. Otherwise choose convergent endpoints after a periodic translation. If the limiting velocity is axial, the first two gains vanish by Lemma 39, and the last three have bounded mass by (10.6). If it is nonaxial, use (10.7) in Lemma 43. This covers every subsequence; hence the residual tends to zero for the original endpoint sequence as well.
  Taking the limsup in (10.8) at these endpoints gives
  $ 1 / 2 lt.eq a sum_(j = 0)^4 frac(\( C log \( 1 \/ a \) \)^j, j !) . $
  Finally let $a arrow.b 0$. The right side tends to zero, a contradiction. Throughout this argument $U$ was allowed to be infinite, and the case $U = 1$ was handled by (10.20). This proves the proposition. ◻
]

== 11 Branching growth and the dilated horizon <sec:branching>

Proposition 33 gives a nonzero solution of the linear equation (9.5). We prove that this solution cannot persist for all positive dilated times under the cap $g lt.eq \( t + l \) H$. The argument is the branching construction of #cite(label("OpenAIPeriodic")) Section 9, whose proof we give in full. Its inputs are the limiting medium (9.3), the cap, and the local transport formula established in Proposition 31.

#thm([Proposition 11.1.])[
  #emph[There are fixed choices 
$ K gt.eq 1 \, #h(2em) 0 < eta lt.eq log 2 \, #h(2em) 0 < alpha lt.eq 1 / 4 \, #h(2em) 0 < gamma lt.eq 1 $

 with the following property. For every allowed geometric mesh with lower endpoint $l in \[ 0 \, 1 \]$, the only nonnegative density solving (9.5) on $0 < t < oo$, with locally integrable gain and loss, the positive-time mild formula (9.15), and the bound $g \( t \, x \, v \) lt.eq \( t + l \) H \( v \)$, is zero. Consequently every nonzero limit in Propositions 31 and 33 has $U < oo$. The four parameters can be fixed before the thermal, seed, bath, and final horizon parameters of the construction. Their choice is independent of the mesh phase and of $l$.]
] <prop:finite-dilated-horizon>

The proof compares growth with spatial spreading. In a constant medium, we construct positive collision histories that multiply mass while keeping all speeds bounded and prescribing a small mean transverse velocity. Finitely many compact families of these histories remain effective when the medium changes measurably within a small tolerance. Far enough from the initial time, the actual background has precisely this form on short intervals whose lengths are proportional to their starting times. Iteration then makes mass grow faster than the cap allows in spatial balls of radius proportional to time. All histories begin at a strictly positive time, where the collision rates are bounded on bounded velocity sets.

The decisive comparison is between a multiplication factor and the volume of these balls. Their volume is of order $t^3$, and the cap contributes one further power of $t$. We will obtain a factor greater than $3$ between times $t$ and $\( 1 + a_(upright("br")) \) t$, where the fixed number $a_(upright("br")) > 0$ is small enough that $\( 1 + a_(upright("br")) \)^4 < 3$.

=== 11.1 Positive histories and their normalization <positive-histories-and-their-normalization>

For $v \, w in bb(R)^3$ and $n in S^2$, set

$ Phi \( v \, w \, n \) = frac(v + w, 2) + frac(\| v - w \|, 2) n \, #h(2em) thin upright(d) 𝜍 \( n \) = frac(thin upright(d) n, 4 pi) . quad "(11.1)" $ <br:sphere-map>

Thus $𝜍$ is a probability measure. By Lemma 3, a collision with incident velocities $v \, w$ has rate $2 pi \| v - w \|$, and the marginal law of either child is the pushforward of $𝜍$ under $Phi \( v \, w \, dot.op \)$. The two marginal laws agree because $n mapsto - n$ preserves $𝜍$. Consequently, for a nonnegative velocity measure $B$ and a density $f$,

$ integral_(bb(R)^3) P \( B \, f \) \( v \) thin upright(d) v = integral_(bb(R)^3) nu_B \( v \) f \( v \) thin upright(d) v . quad "(11.2)" $ <br:gain-mass>

The coefficient $2$ in the gain of (9.5) therefore counts both children, while the loss removes their parent once.

More generally, fix Borel representatives of the coefficients of a two-beam medium

$ tilde(B) \( t \, x \) = sum_(sigma = plus.minus 1) b_sigma \( t \, x \) delta_(w_sigma \( t \, x \)) \, #h(2em) q_sigma \( t \, x \, v \) = 2 pi b_sigma \( t \, x \) \| v - w_sigma \( t \, x \) \| \, #h(2em) nu = sum_sigma q_sigma . $

All pointwise path conditions below refer to these representatives. On $\[ a \, b \]$, a history with ordered collision times $a < tau_1 < dots.h.c < tau_j < b$, signs $sigma_i$, and directions $n_i$ follows free flights between collisions and uses

$ V_(tau_i) = Phi \( V_(tau_i -) \, w_(sigma_i) \( tau_i \, X_(tau_i) \) \, n_i \) . $

Its weight relative to $product_i thin upright(d) tau_i thin upright(d) 𝜍 \( n_i \)$ is

$ exp (- integral_a^b nu \( s \, X_s \, V_s \) thin upright(d) s) product_(i = 1)^j 2 q_(sigma_i) \( tau_i \, X_(tau_i) \, V_(tau_i -) \) . quad "(11.3)" $ <br:history-weight>

For $j = 0$ the empty product is one.

#thm([Lemma 11.2.])[
  #emph[Let $0 < a < b < oo$. Suppose $f gt.eq 0$ solves $D_t f = 2 P \( tilde(B) \, f \) - nu f$ in the local transport sense, both collision terms are locally integrable, and the chosen rate representatives $q_sigma$ are bounded on compact positive-time phase-space sets. Start with any nonnegative bounded, integrable portion of $f \( a \)$. Integration of any measurable collection of bounded finite histories with weights (11.3) gives a measure dominated by $f \( b \)$.]
] <br:positive-histories>

#proof[
  Set $G = 2 P \( tilde(B) \, f \)$. In free coordinates $f^sharp \( t \, x \, v \) = f \( t \, x + t v \, v \)$, the equation becomes
  $ partial_t f^sharp = \( G - nu f \)^sharp . $
  On bounded tubes its right side is locally integrable, so $f^sharp$ has absolutely continuous time sections for almost every $\( x \, v \)$ and local $L^1$ time traces. The rate bounds make $nu^sharp$ integrable along every bounded characteristic segment in a compact positive-time tube. The one-dimensional integrating-factor formula therefore consists of the freely transported initial density multiplied by its survival factor, plus the time integral of the nonnegative gain with the same survival factor. Repeated substitution into the gain gives (11.3), by (11.1) and (11.2). Every remainder is nonnegative. Restricting the histories, or the initial density, preserves the lower bound. Tonelli’s theorem justifies the substitutions. On bounded portions with total gain rate at most $C$, the $j$-collision term is bounded by $C^j \( b - a \)^j \/ j !$ times the initial mass.
  These formulas apply to point-velocity partners. Indeed Lemma 3 gives a density for the gain against each such partner, with mass (11.2). Thus free flight and each gain preserve absolute continuity when the starting measure has a density. Null spatial sets in representatives of the coefficients do not affect the integrated formula. ◻
]

For the background (9.3), $\| u_sigma \| lt.eq 1 + alpha$ and

$ 0 lt.eq b_sigma \( t \, x \) lt.eq frac(theta K, t alpha gamma) \, #h(2em) nu_B \( t \, x \, v \) lt.eq frac(C \( 1 + \| v \| \), t) quad \( t > 0 \) . quad "(11.4)" $ <br:global-rate>

At each mesh interface choose the value from the outer adjacent annulus, and on the transverse axis set the medium to zero. These are Borel representatives obeying the same bounds. All bounded finite flights starting at positive time have strictly positive survival. The cap and Lemma 6 give locally integrable collision terms. The preceding transport argument therefore supplies local $L^1$ time traces of $g$ on bounded regions. For the extracted limits, these agree with the representatives in Proposition 31. Testing nonnegative compact functions and taking a time limit shows that $g \( t \) lt.eq \( t + l \) H$ also holds at these traces. We use this representative.

=== 11.2 A reference flight with a positive potential <a-reference-flight-with-a-positive-potential>

We convert the branching history weights into expectations along a single Markov flight with a positive potential. This is a jump-process Feynman–Kac representation, related to the many-to-one formulas for branching systems; see #cite(label("HarrisRoberts2017")) Section 4.1 for general probabilistic context. The finite-history calculation below proves the precise representation for the present collision law.

Fix

$ D = 5 \, #h(2em) E = { v : \| v \| lt.eq D } \, #h(2em) B_0 = delta_(e_3) + delta_(- e_3) \, #h(2em) nu_0 \( v \) = 2 pi #scale(x: 120%, y: 120%)[\(] \| v - e_3 \| + \| v + e_3 \| #scale(x: 120%, y: 120%)[\)] . $

Let $J \( v \, thin upright(d) v' \)$ be the single-child law obtained by choosing a sign with probabilities proportional to $\| v - sigma e_3 \|$ and then using (11.1). Put $p \( v \) = J \( v \, E \)$.

#thm([Lemma 11.3.])[
  #emph[For every $v in E$, $p \( v \) gt.eq 25 \/ 26$. The reference history sum restricted to velocities in $E$ is represented by a Markov flight with velocity jump rate $lambda \( v \) = 2 p \( v \) nu_0 \( v \)$, jump law $J \( v \, thin upright(d) v' \) upright(bold(1))_E \( v' \) \/ p \( v \)$, and multiplicative weight 
$ exp (integral_0^A cal(W) \( V_s \) thin upright(d) s) \, #h(2em) cal(W) \( v \) = \( 2 p \( v \) - 1 \) nu_0 \( v \) . $

 One may take 
$ 0 < c_0 = frac(48 pi, 13) lt.eq cal(W) \( v \) \, #h(2em) lambda \( v \) lt.eq C_0 = 48 pi quad \( v in E \) . quad "(11.5)" $ <br:potential-bounds>

]
] <br:retention>

#proof[
  Set $s = \| v \|^2$, $z = v_3$, and $R = sqrt(\( s + 1 \)^2 - 4 z^2)$. For either partner sign the squared child speed has the law
  $ \| v' \|^2 = frac(s + 1 + R Z, 2) \, #h(2em) Z upright(" uniform on ") \[ - 1 \, 1 \] . $
  This follows by expanding the square in (11.1): a coordinate of a uniform point on $S^2$ is uniform on $\[ - 1 \, 1 \]$. The maximum is at most $s + 1$, so there is no exit for $s lt.eq 24$. For $24 < s lt.eq 25$, the exit probability, if positive, is
  $ 1 / 2 + frac(s - 49, 2 R) lt.eq 1 / 2 + frac(s - 49, 2 \( s + 1 \)) = frac(s - 24, s + 1) lt.eq 1 / 26 . $
  The inequality uses $R lt.eq s + 1$ and $s - 49 < 0$. If $R = 0$, the squared speed is deterministic and at most 25. Mixing the signs preserves the bound.
  A Markov history of rate $lambda$ has the survival factor $e^(- integral lambda)$, and one rate times jump-law factor per collision. Multiplication by $e^(integral \( lambda - nu_0 \))$ changes this exactly to (11.3), restricted to $E$. Both history sums converge absolutely on finite intervals because their rates are bounded. Finally $4 pi lt.eq nu_0 \( v \) lt.eq 24 pi$ on $E$, and $2 p \( v \) - 1 gt.eq 12 \/ 13$, giving (11.5). ◻
]

=== 11.3 Three collisions give a volume minorization <three-collisions-give-a-volume-minorization>

The positive potential gives growth along every retained reference path. To control where that growth occurs, we also need cancellation in the integrated velocity. Write $P_t \( v \, dot.op \)$ for the transition law of the preceding velocity process. We prove that these laws approach a symmetric stationary distribution by establishing a Doeblin-type minorization: every starting velocity has a common positive portion of its transition law #cite(label("Doeblin1940")). Three collisions supply this common portion.

#thm([Lemma 11.4.])[
  #emph[There are $r_0 > 0$ and $epsilon_0 > 0$ such that 
$ P_1 \( v \, A \) gt.eq epsilon_0 \| A ∩ B \( 0 \, r_0 \) \| quad \( v in E \) quad "(11.6)" $ <br:doeblin>

 for every Borel set $A subset E$. For each $zeta > 0$, there is also $epsilon_zeta > 0$ such that 
$ P_1 \( v \, B \( e_1 \, zeta \) ∩ { \| v' \| < D } \) gt.eq epsilon_zeta quad \( v in E \) . $

]
] <br:minorization>

#proof[
  Given $v in E$, choose a sign with $\| v - sigma e_3 \| gt.eq 1$. Use this partner for the first collision, and select an output within a small fixed distance $delta$ of $sigma e_3$. Its probability has a uniform positive lower bound: the incident distance lies in $\[ 1 \, 6 \]$, and a cap of fixed Euclidean radius $delta$ at that endpoint has area probability bounded below uniformly on the corresponding diameter spheres. Such first outputs lie strictly in $E$.
  Use partner $- sigma e_3$ next. If the first output is exactly $sigma e_3$, the second sphere is the unit sphere; restrict its output $u$ near $e_1$. For the third collision use partner $e_3$. The last output is
  $ T \( u \, n \) = frac(u + e_3, 2) + frac(\| u - e_3 \|, 2) n . $
  At $u = e_1$, $n_0 = - \( e_1 + e_3 \) \/ sqrt(2)$, this output is zero. The two angular derivatives in $n$ span $\( e_1 + e_3 \)^perp$. The vector $e_3$ is tangent to the preceding unit sphere at $e_1$, and direct differentiation gives
  $ partial_(e_3) T \( e_1 \, n_0 \) = frac(e_1 + 3 e_3, 4) \, #h(2em) \( e_1 + e_3 \) dot.op partial_(e_3) T \( e_1 \, n_0 \) = 1 . quad "(11.7)" $ <br:rank-derivative>
  Thus the map of the four angular coordinates in the last two collisions to the last velocity has rank three.
  Take the two coordinates of $n$ and the coordinate of $u$ with derivative $e_3$ as distinguished variables, and hold the fourth coordinate in a short interval. The inverse function theorem, with this fourth coordinate and the first output as parameters, gives neighborhoods on which the distinguished-variable map is one-to-one, its Jacobian and inverse Jacobian are bounded, and its image contains a fixed ball $B \( 0 \, r_0 \)$. Shrink these neighborhoods and $delta$ so this holds for every first output within $delta$ of $sigma e_3$, for both signs. Sphere area in these coordinates has a positive lower density. Change of variables in the three distinguished coordinates, and integration in the fourth, give a fixed positive multiple of volume on $B \( 0 \, r_0 \)$.
  Force the three times into three fixed, disjoint intervals inside $\( 0 \, 1 \)$, and prohibit other jumps. The first selected relative speed is at least 1, the second is close to 2, and the third close to $sqrt(2)$. In the reference Markov process the selected transition intensity is
  $ 4 pi \| v - sigma e_3 \| thin upright(bold(1))_E \( Phi \( v \, sigma e_3 \, n \) \) thin upright(d) 𝜍 \( n \) . $
  It has positive uniform lower density on the patches just specified. The no-additional-jump factor is at least $e^(- C_0)$. Integrating the times proves (11.6). Keeping only the first two collisions, selecting a small patch near $e_1$ in the second, and prohibiting later jumps proves the last assertion. ◻
]

#thm([Lemma 11.5.])[
  #emph[The reference process has a stationary probability law $pi$ with $integral v thin upright(d) pi \( v \) = 0$. There are $C \, c > 0$ such that 
$ sup_(v in E) parallel P_t \( v \, dot.op \) - pi parallel_(upright("TV")) lt.eq C e^(- c t) \, #h(2em) sup_(v in E) bb(E)_v lr(|A^(- 1) integral_0^A V_s thin upright(d) s|)^2 lt.eq C / A quad \( A gt.eq 1 \) . $

]
] <br:mixing>

#proof[
  The normalized measure on the right side of (11.6) is a common part of positive mass $epsilon.alt$ in all rows of $P_1$. Removing this common part shows that the map $frak(m) mapsto frak(m) P_1$ contracts total variation distance by $1 - epsilon.alt$. Probability measures form a complete space in that metric, so iteration yields a unique fixed point $pi$ and uniform geometric convergence. Since $P_t$ commutes with $P_1$, $pi P_t$ is another fixed point of $P_1$, hence equals $pi$. Contractivity of Markov kernels gives the estimate between integer times.
  Negation of velocity interchanges the two signs and preserves $E$, so uniqueness of $pi$ makes it symmetric and its mean zero. Consequently $sup_(v in E) \| bb(E)_v V_t \| lt.eq C e^(- c t)$. The Markov property and bounded velocities imply
  $ \| bb(E) \( V_s dot.op V_t \) \| lt.eq C e^(- c \( t - s \)) quad \( 0 lt.eq s lt.eq t \) $
  uniformly over starting states. Integrating this estimate on $\[ 0 \, A \]^2$ bounds the second moment of $integral_0^A V_s thin upright(d) s$ by $C A$. ◻
]

=== 11.4 A displacement block and measurable perturbations <a-displacement-block-and-measurable-perturbations>

Fix $d = 1 \/ 10$, and choose once and for all

$ 0 < 𝜘 < min {1 / 4 \, frac(c_0, 2 C_0) \, r_0 / 4} . quad "(11.8)" $ <br:kappa-choice>

In particular a small ball about $𝜘 e_1$ lies in the minorization ball.

To repeat growth in the cold background, we will transport mass through boxes whose transverse distance from the axis grows proportionally to time:

$ cal(B)_t = { \( x \, v \) : \| x - 𝜘 t e_1 \| lt.eq d 𝜘 t \, med \| v \| lt.eq D } \, #h(2em) t > 0 . $

For a duration $Delta > 0$, a displacement within $d 𝜘 Delta$ of $𝜘 Delta e_1$ carries every starting point of $cal(B)_t$ into $cal(B)_(t + Delta)$, provided the final velocity remains in $E$. Mixing makes the integrated velocity small over most of a reference block. We reserve a final fraction $𝜘$ of the block for a flight with velocity close to $e_1$, producing the displacement $𝜘 A e_1$. The positive potential will compensate for the cost of prohibiting collisions during that final flight.

#thm([Lemma 11.6.])[
  #emph[There is a finite $L$ such that, for all 
$ A in I_L := [frac(L, 1 + d) \, frac(L, 1 - d)] \, #h(2em) v in E \, $

 reference branching histories with velocities in $E$, final velocity strictly inside $E$, and displacement $Z_A$ satisfying 
$ \| Z_A - 𝜘 A e_1 \| < 3 / 4 d 𝜘 A quad "(11.9)" $ <br:strict-drift>

 have total weight greater than 8.]
] <br:reference-block>

#proof[
  Put $A_0 = \( 1 - 𝜘 \) A - 1$. On the first interval of length $A_0$, require the reference Markov flight to have integrated velocity of norm at most $A d 𝜘 \/ 4$. Lemma 48 and Chebyshev’s inequality give probability at least $1 \/ 2$, uniformly in the start when $A$ is sufficiently large. Over the next unit interval require the last velocity to lie in $B \( e_1 \, d \/ 4 \)$. The conditional probability is at least a fixed $epsilon > 0$, by Lemma 47. Require no jump during the final interval of length $𝜘 A$, whose conditional probability is at least $e^(- C_0 𝜘 A)$.
  The errors in displacement from $𝜘 A e_1$ on the three intervals are at most $A d 𝜘 \/ 4$, $D$, and $A d 𝜘 \/ 4$. For $A > 4 D \/ \( d 𝜘 \)$ their sum is less than $3 A d 𝜘 \/ 4$. The final velocity lies strictly in $E$. Lemma 46 bounds the branching weight below by
  $ epsilon / 2 exp \( \( c_0 - C_0 𝜘 \) A \) . $
  Its exponent is positive by (11.8). Choose $L$ large enough that this exceeds 8, and all the preceding lower bounds on $A$ hold throughout $I_L$. ◻
]

The background coefficients jump across annular interfaces. To use the reference growth there, we first restrict it to compact families with bounded collision counts and strict velocity and displacement margins. These margins allow comparison with a merely measurable medium: its values along each actual path need only remain close to the constant reference values.

#thm([Lemma 11.7.])[
  #emph[For these fixed $𝜘 \, L$, there are $J_(upright("br")) in bb(N)$ and $epsilon_(*) in \( 0 \, 1 \/ 4 \)$ with the following property. Suppose a measurable medium obeys, throughout every speed-$D$ excursion from a specified starting point over a duration $A in I_L$, 
$ \| b_sigma - 1 \| lt.eq epsilon_(*) \, #h(2em) \| w_sigma - sigma e_3 \| lt.eq epsilon_(*) quad \( sigma = plus.minus 1 \) . quad "(11.10)" $ <br:medium-closeness>

 From each starting velocity in $E$, histories with between $1$ and $J_(upright("br"))$ collisions, speed at most $D$ on every free flight, every postcollision velocity and the final velocity strictly inside $E$, and 
$ \| Z_A - 𝜘 A e_1 \| < d 𝜘 A quad "(11.11)" $ <br:robust-drift>

 have total weight greater than 3. The initial free flight may have speed $D$. No continuity of the medium is needed.]
] <br:robust-block>

#proof[
  Fix a reference start and duration $\( v \, A \) in E times I_L$. The zero-collision term has weight $e^(- nu_0 \( v \) A) lt.eq 1$. Discarding it from the family in Lemma 49 leaves weight greater than 7. Monotone convergence in the positive history count permits restricting to finitely many counts $j gt.eq 1$ while retaining weight greater than 7. Every postcollision velocity lies strictly in $E$ almost surely: the intersection of a nondegenerate diameter sphere with $partial E$ has sphere area zero, and a degenerate collision has zero rate. This includes the final velocity. No inward margin is required for the initial velocity. The displacement inequality is strict. Ordered times may be kept apart and away from the endpoints. For each retained collision count and sign sequence, parameterize the ordered times as fractions of $A$ and partition the angular parameter space into finitely many measurable pieces lying in sphere coordinate charts. Inner regularity of the resulting finite parameter measures allows a further restriction to compact sets with total weight greater than 6. These compact sets have positive distances from the forbidden time coincidences and from every postcollision speed boundary. They also have a positive margin in $\| Z_A - 𝜘 A e_1 \| < d 𝜘 A$, since the reference histories obey the stronger inequality (11.9). We call these finitely many compact parameter sets a test for $\( v \, A \)$.
  The reference paths and weights are continuous in these finite parameters and in $\( v \, A \)$. The fixed compact tests therefore retain weight greater than 5 and at least half their original positive margins in a sufficiently small relative neighborhood of that start and duration in $E times I_L$. These neighborhoods cover the compact set $E times I_L$. A finite subcover gives finitely many tests, a maximum count $J_(upright("br"))$, and uniform positive margins.
  Use the same initial velocity, signs, directions, and fractional times for each perturbed history and its reference history. Their first flights have speed at most $D$, including boundary starts. The sphere map satisfies
  $ \| Phi \( v \, w \, n \) - Phi \( tilde(v) \, tilde(w) \, n \) \| lt.eq \| v - tilde(v) \| + \| w - tilde(w) \| . $
  Induction bounds the velocity error after $j$ collisions by $j epsilon_(*)$ and the displacement error by $A J_(upright("br")) epsilon_(*)$. This comparison does not compare the medium at two nearby positions: its value at the actual perturbed position is close to the same constant reference partner. A sufficiently small $epsilon_(*)$ preserves all the strict velocity and displacement margins. The actual paths thus have speed at most $D$, so they stay within the region on which closeness was assumed. Formally this follows by induction up to the first possible failure; the preserved margins exclude such a failure.
  The relative-speed errors and full loss-rate errors on these histories are bounded by $C_(J_(upright("br"))) epsilon_(*)$. The density error gives the same bound for the gain-rate factors. The interval has bounded length, so the error in the integrated loss and its exponential is bounded by $C_(J_(upright("br")) \, L) epsilon_(*)$. Finite products of the bounded gain factors then show that (11.3) changes by at most $C_(J_(upright("br")) \, L) epsilon_(*)$ uniformly on each test. The tests have finite parameter measure. Decreasing $epsilon_(*)$ makes their integrals greater than 3. All coefficient estimates were pointwise; measurability is sufficient. ◻
]

=== 11.5 Uniform choices of the construction parameters <uniform-choices-of-the-construction-parameters>

Lemma 50 reduces the growth argument to a comparison of the background with two constant beams. We now choose the construction parameters to make that comparison uniform on the moving boxes. Before doing so, we reserve a velocity tolerance that will also allow positive mass to enter such a box. For this purpose we will steer its velocity close to $𝜘 e_1$, then let it fly freely until it enters the moving box. There is $alpha_(upright("acc")) > 0$, depending only on $𝜘$ and Lemma 47, with this property: after a first collision puts a velocity sufficiently close to $sigma e_3$, two more collisions, with partners within $alpha_(upright("acc"))$ of $- sigma e_3 \, e_3$, have positive angular probability of ending in

$ B \( 𝜘 e_1 \, d 𝜘 \/ 4 \) . quad "(11.12)" $ <br:access-velocity>

Indeed the inverse-coordinate construction in that lemma, with first output exactly $sigma e_3$, maps a positive-measure angular set into $B \( 𝜘 e_1 \, d 𝜘 \/ 8 \)$, which is inside $B \( 0 \, r_0 \)$. Keep a compact subset of positive measure in this set. Its outputs have a positive distance from the complement of (11.12); the intermediate velocities and relative speeds remain in the neighborhoods of that construction. Uniform continuity of the two sphere maps preserves this for sufficiently small perturbations of the first output and partners, including measurable partners at the actual path positions. Take the smaller tolerance for the two possible signs. We also require $alpha_(upright("acc"))$ to be less than half the permitted radius of the first-output neighborhood.

The constants $𝜘 \, L \, J_(upright("br")) \, epsilon_(*) \, alpha_(upright("acc"))$ are now fixed and do not involve any construction parameter. Fix preliminary bounds $eta lt.eq 1$, $alpha lt.eq 1$, $K gt.eq 1$. For $t > 0$, put

$ Delta = frac(L 𝜘 t, theta K) \, #h(2em) a_(upright("br")) = frac(L 𝜘, theta K) . quad "(11.13)" $ <br:moving-box>

At a starting point $x_0 = \( y_0 \, z_0 \)$ in $cal(B)_t$,

$ \( 1 - d \) 𝜘 t lt.eq \| y_0 \| lt.eq \( 1 + d \) 𝜘 t . $

Every speed-$D$ excursion over $\[ t \, t + Delta \]$ satisfies

$ \| \| y \| - \| y_0 \| \| lt.eq D Delta \, #h(2em) \| z \| lt.eq d 𝜘 t + D Delta . $

Set $delta_K = D L \/ \( theta K \( 1 - d \) \)$. By increasing $K$, impose $delta_K lt.eq 1 \/ 4$ and $a_(upright("br")) lt.eq 1 \/ 4$. Then

$ \| y \| gt.eq \( 1 - delta_K \) \( 1 - d \) 𝜘 t . $

For all sufficiently large $t$, every such excursion is outside the lower mesh hole, since $l lt.eq 1$. On its active annulus $e^(- eta) \| y \| lt.eq 𝜚 lt.eq \| y \|$, for every mesh phase. Thus, with a fixed constant $C_1$ depending only on $d \, D$,

$ lr(|frac(\| y_0 \|, 𝜚) - 1|) & lt.eq C_1 \( eta + delta_K \) \,\
tau / 𝜚 & lt.eq C_1 / 𝜘 \,\
frac(\| z - tau u_sigma \|, 𝜚) & lt.eq C_1 / 𝜘 #h(2em) \( t lt.eq tau lt.eq t + Delta \) . quad "(11.14)" $ <br:comparison-quantities>

The last estimate uses $\| u_sigma \| lt.eq 2$.

For a fixed starting point $x_0$, set $rho_0 = theta K \/ \| y_0 \|$ and introduce the coordinates

$ s = rho_0 \( tau - t \) \, #h(2em) xi = rho_0 \( x - x_0 \) . $

Velocities are unchanged in these coordinates. The duration $Delta$ is the same for every start in $cal(B)_t$, whereas $rho_0$ varies with $x_0$. This is the reason the reference block was proved for an interval of durations: here its duration is exactly

$ A = rho_0 Delta = frac(L 𝜘 t, \| y_0 \|) in I_L . quad "(11.15)" $ <br:duration-scaling>

With $S_sigma = S \( gamma \( z - tau u_sigma \) \/ 𝜚 \)$, the density ratio in these units is

$ frac(b_sigma \( tau \, x \), rho_0) = frac(\| y_0 \|, 𝜚) thin frac(S_sigma, 1 + \( tau alpha gamma \/ 𝜚 \) S_sigma) . quad "(11.16)" $ <br:density-ratio>

Because $1 - "sech"^2 h = tanh^2 h lt.eq h^2$, (11.14) gives, when the right-hand small quantities are at most one,

$ lr(|b_sigma / rho_0 - 1|) lt.eq C_2 (eta + delta_K + \( gamma \/ 𝜘 \)^2 + alpha gamma \/ 𝜘) \, #h(2em) \| u_sigma - sigma \| lt.eq alpha . quad "(11.17)" $ <br:uniform-medium-error>

Here $C_2$ is independent of $t \, l$, and mesh phase.

Choose $0 < eta lt.eq log 2$ small, then

$ 0 < alpha < min { 1 \/ 4 \, epsilon_(*) \, alpha_(upright("acc")) } \, $

then $0 < gamma lt.eq 1$ small, so that the first, third, and fourth terms on the right of (11.17), including their factor $C_2$, sum to less than $epsilon_(*) \/ 2$. Finally increase $K$ so the $delta_K$ term is less than $epsilon_(*) \/ 2$, the preliminary restrictions hold, and

$ \( 1 + a_(upright("br")) \)^4 < 3 . quad "(11.18)" $ <br:growth-exponent>

This establishes (11.10) for all the scaled blocks, with no choice depending on a limit, mesh, or solution.

These choices precede the remaining choices in the approximation. Making $alpha gamma$ small increases only fixed constants in (11.4) and the earlier comparison estimates. Proposition 16 is valid for every fixed $K \, eta \, alpha \, gamma$, after the thermal width is made sufficiently small. Proposition 22 then permits the seed exponent and the final short horizon to be chosen after those constants. The later choices of bath, geometric scale, and horizon therefore preserve the block estimates just proved.

#thm([Lemma 11.8.])[
  (Growth in the limiting medium).  #emph[For the parameters just fixed, let $a_(upright("br")) = L 𝜘 \/ \( theta K \)$. There is a time $t_(upright("br")) > 0$, independent of the mesh and $l in \[ 0 \, 1 \]$, such that every density satisfying the equation, cap, and mild formula of Proposition 44 on an interval containing $\[ t \, \( 1 + a_(upright("br")) \) t \]$, with $t gt.eq t_(upright("br"))$, obeys, at its positive-time traces, 
$ M \( \( 1 + a_(upright("br")) \) t \) gt.eq 3 M \( t \) \, #h(2em) M \( s \) := integral_(cal(B)_s) g \( s \, x \, v \) thin upright(d) x thin upright(d) v . quad "(11.19)" $ <br:mass-growth>

]
] <br:block-growth>

#proof[
  Choose $t_(upright("br"))$ so that $\( 1 - delta_K \) \( 1 - d \) 𝜘 t_(upright("br")) > 1$. Then every speed-$D$ excursion in (11.13) stays outside the hole for every $l in \[ 0 \, 1 \]$ and every $t gt.eq t_(upright("br"))$. Put $Delta = a_(upright("br")) t$. At each starting point of $cal(B)_t$, apply Lemma 50 using the simultaneous space–time scaling (11.15). Translating back its displacement restriction gives
  $ \| x_(upright("end")) - x_(upright("start")) - 𝜘 Delta e_1 \| < d 𝜘 Delta . $
  The starting radius $d 𝜘 t$, followed by the triangle inequality, places the endpoint in $cal(B)_(t + Delta)$. The velocity belongs to $E$: the selected positive-count histories have a strictly interior final velocity. Their first flight need only have speed at most $D$, exactly as in the medium comparison. History weights are unchanged by this scaling: each gain rate is divided by $rho_0$, each time differential is multiplied by $rho_0$, and the integrated loss is invariant. The selected histories therefore have total weight greater than 3 uniformly over starts in $cal(B)_t$.
  Use the kernel obtained by integrating all histories with $1 lt.eq j lt.eq J_(upright("br"))$ that satisfy the block’s velocity and displacement restrictions. The finite compact tests above certify its weight greater than 3; no choice of a test for each starting point is needed. For each integer $m gt.eq 1$, integrate this positive kernel against $min { g \( t \) \, m } upright(bold(1))_(cal(B)_t)$. This is a bounded, integrable portion of the trace, so Lemma 45 applies. Letting $m arrow.r oo$ and using monotone convergence gives (11.19). ◻
]

=== 11.6 Access to a late box and the growth contradiction <access-to-a-late-box-and-the-growth-contradiction>

We have obtained a uniform multiplication factor for mass already in a moving box. The remaining point is to put some positive mass there. The following argument needs no lower bound for the size of that mass: any positive amount suffices for the eventual growth contradiction.

#thm([Lemma 11.9.])[
  #emph[For the fixed parameters above, let $g equiv.not 0$ solve (9.5) on $0 < t < oo$ with $0 lt.eq g lt.eq \( t + l \) H$, for any allowed mesh and $l in \[ 0 \, 1 \]$. Then $integral_(cal(B)_t) g \( t \, x \, v \) thin upright(d) x thin upright(d) v > 0$ at arbitrarily large finite times.]
] <br:accessibility>

#proof[
  At some positive time $a_0$, a bounded, integrable portion of $g \( a_0 \)$ has positive mass. Such a portion is obtained by restricting to bounded phase-space sets and truncating the density. The velocity axis has Lebesgue measure zero, so a further portion of positive mass satisfies
  $ \| x \| lt.eq R \, #h(2em) \| v \| lt.eq R \, #h(2em) \| macron(v) \| gt.eq delta > 0 . $
  For a sufficiently long but finite free flight of length $s$,
  $ \| y + s macron(v) \| gt.eq s delta - R > l + 2 $
  on this portion. Its survival is bounded below by a positive constant by (11.4). Lemma 45 gives positive mass in a bounded region strictly outside the hole at time $a_1 = a_0 + s$. This freely transported portion remains bounded and integrable.
  Choose $h > 0$ small so that paths whose initial speed is at most $R$ and whose later speeds are at most 3 remain in a bounded region with $\| y \| > l + 1$ during $\[ a_1 \, a_1 + h \]$. Both sign densities have strictly positive lower bounds there. To see this directly, the time, axial coordinate, and transverse radius are bounded, the transverse radius has a positive lower bound, and $e^(- eta) \| y \| lt.eq 𝜚 lt.eq \| y \|$. The argument of $S$ is therefore bounded, its numerator is positive, and the denominator in (9.3) is bounded above. The rates on the selected bounded-speed paths also have finite upper bounds.
  Confine three collisions to this short interval. Choose a reference sign with $\| v - sigma e_3 \| gt.eq 1$ for the first collision. The actual relative speed is at least $1 - alpha gt.eq 3 \/ 4$. Choose its output in a sufficiently small cap about the actual partner. The cap probability has a positive lower bound for inputs bounded by $R$. Since the actual partner is within $alpha$ of $sigma e_3$, this first output lies in the reserved first-output neighborhood. Next use the signs $- sigma$ and $+ 1$, and the compact angular tests defining $alpha_(upright("acc"))$. Their final velocity lies in (11.12). The second output stays near $e_1$, so the second and third relative speeds have positive lower bounds; all postcollision speeds are at most 3. Put the three times in disjoint subintervals and prohibit other collisions. Positive lower bounds for the selected gain factors, angular probabilities, time-interval lengths, and survival give strictly positive total weight. The sphere-map comparison used here requires only uniform partner closeness, and therefore remains valid for measurable coefficients.
  There is consequently a positive portion at time $a_2 = a_1 + h$, with bounded spatial support and $\| v - 𝜘 e_1 \| < d 𝜘 \/ 4$. Truncating its density gives a bounded, integrable subportion of positive mass. Let $R_2$ bound $\| x - 𝜘 a_2 e_1 \|$ on that portion. After free flight to any sufficiently large finite time $t$,
  $ \| x + \( t - a_2 \) v - 𝜘 t e_1 \| lt.eq R_2 + frac(d 𝜘, 4) \( t - a_2 \) < d 𝜘 t . $
  Its speed is strictly less than $D$. For each finite $t$, survival remains strictly positive by (11.4). The zero-collision term of Lemma 45 proves the assertion. ◻
]

#proof[
  Suppose that a nonzero density $g$ solves (9.5) for all positive times and obeys the cap. Lemma 52 gives a time $t_0 gt.eq t_(upright("br"))$ with positive mass $m_0$ in $cal(B)_(t_0)$.
  Apply Lemma 51 successively. At $t_n = \( 1 + a_(upright("br")) \)^n t_0$, induction gives
  $ integral_(cal(B)_(t_n)) g \( t_n \, x \, v \) thin upright(d) x thin upright(d) v gt.eq 3^n m_0 . $
  The cap and $l lt.eq 1$, on the other hand, give
  $ integral_(cal(B)_(t_n)) g \( t_n \, x \, v \) thin upright(d) x thin upright(d) v lt.eq \( t_n + 1 \) frac(4 pi, 3) \( d 𝜘 t_n \)^3 integral_E H \( v \) thin upright(d) v lt.eq C \( 1 + t_n \)^4 . $
  This contradicts (11.18) as $n arrow.r oo$. The positive mass $m_0$ and starting time may depend on the particular density; their sizes are immaterial to this comparison. The parameters governing the blocks were fixed before the mesh and $l$ were chosen. This rules out every nonzero global density in the proposition. Applying this conclusion to the nonzero limits of Proposition 33 gives $U < oo$. ◻
]

== 12 Separation of two global solutions <sec:separation>

The preceding sections give two different ways to take limits. At a fixed physical horizon, the finite solutions have global entropy limits with local conservation. At a shrinking horizon, magnification at a cap event produces a nonzero linear solution, and the branching argument bounds its time interval. We now show that these facts force a cap limit to differ from a dormant limit. The separation argument follows #cite(label("OpenAIPeriodic")) Section 10; the normalization here also removes the factor $m_T = T^p$.

All construction parameters are henceforth fixed, with the choices in Proposition 44 and the subsequent smallness requirements of the global estimates. Choose one dormant global limit $F^(upright(d))$ supplied by Proposition 29.

#thm([Lemma 12.1.])[
  #emph[On the periodic lift centered at the origin, 
$ frac(F^(upright(d)) \( T t \, T x \, v \), T m_T) arrow.r 0 #h(2em) \( T arrow.b 0 \) $

 in local $L^1$ on 
$ cal(V) = \( 0 \, 1 \) times bb(R)_x^3 times { v in bb(R)^3 : macron(v) eq.not 0 } . $

]
] <sep:dormant-vanishing>

#proof[
  The early upper bounds for the dormant approximations are independent of the approximation index. Their sum is locally integrable, so testing against nonnegative functions passes these bounds to $F^(upright(d))$. We estimate them on a compact set on which
  $ 0 < tau_0 lt.eq t lt.eq A < 1 \, #h(2em) \| x \| + \| v \| lt.eq R \, #h(2em) \| macron(v) \| gt.eq epsilon > 0 . $
  By (6.7), the hot upper bound is $C \( T t \)^M H \( v \)$, for a fixed $M > p + 1$. Division by $T m_T = T^(p + 1)$ makes it tend to zero uniformly relative to $H$ on this compact set.
  The bath bound (6.1) is exponentially small here. Indeed $T x$ lies inside the fixed initial hole with $D_0 \( T x \) gt.eq delta$ for all sufficiently small $T$. Hence its normalized contribution is bounded by
  $ C T^(- p - 1) e^(- beta' \| v \|^2) exp (- frac(c delta^2, T A)) \, $
  which tends to zero.
  For the cold upper bound, a main spatial enlargement at transverse position $T y$, with $y$ bounded, has scale $s lt.eq C_R T$. For small $T$, only the copy centered at the origin can be main on this compact set: any other such copy would have a lattice center with transverse distance at most $s_0 + o \( 1 \)$ from the origin and axial distance at most $a + b_(upright("sp")) + o \( 1 \) < 1 \/ 2$, contradicting the unit minimum length of a nonzero lattice vector. The other copies are covered by the nonmain bound.
  The transverse Gaussian in the main-color bound of Proposition 16, together with $\| macron(v) \| gt.eq epsilon$, gives
  $ c_(upright("main")) \( T t \, T x \, v \) lt.eq C s^(- 31) exp (- frac(c epsilon^2, d_0^2 s^20)) . $
  The supremum of the right side over $0 < s lt.eq C_R T$ tends to zero faster than every power of $T$. At each point there is at most one main color. Lemma 18 bounds the remaining sum by $C_M \( T t \)^M e^(- 4 \| v \|^2)$ for every fixed $M > 0$. Taking $M > p + 1$ handles the same normalization for this sum. All three components therefore vanish in local $L^1$, as claimed. ◻
]

#proof[
  Take the datum $F_0$ defined in (4.5). Lemma 12 gives its finite mass, energy, and absolute entropy integral, as well as bounded velocity support. For every $0 < T lt.eq T_0$, Proposition 22 gives cap approximations, and Proposition 29 gives a global entropy limit satisfying all the required local conservation laws and having datum $F_0$. The dormant limit $F^(upright(d))$ has these same properties.
  Suppose there are horizons $T_k arrow.b 0$ at which a cap limit equals $F^(upright(d))$ almost everywhere on $\( 0 \, T_k \)$. For each fixed $T_k$, choose approximations along the subsequence converging to that particular common limit. Let $K_j$ be a compact exhaustion of $cal(V)$, and choose nonnegative smooth compact functions $zeta_j$ on $cal(V)$ with $zeta_j gt.eq 1$ on $K_j$. A diagonal choice of indices $N_k$ can ensure both $s_(N_k) \/ T_k arrow.r 0$ and
  $ f_k \( t \, x \, v \) := frac(F_k \( T_k t \, T_k x \, v \), T_k m_(T_k)) arrow.r 0 quad upright("in local ") L^1 \( cal(V) \) \, quad "(12.1)" $ <sep:diagonal>
  where $F_k$ is the chosen finite solution.
  Here is the diagonal choice explicitly. At stage $k$, require $s_(N_k) \/ T_k < 1 \/ k$ and make the differences between the integrals of the normalized approximation and normalized common limit against $zeta_1 \, dots.h \, zeta_k$ smaller than $1 \/ k$. Each test, when written in physical coordinates at the fixed horizon $T_k$, is a fixed smooth test of finite norm; periodizing its spatial factor gives a test on the torus. Thus fixed-horizon weak convergence permits these finitely many requirements. Lemma 53 makes the integrals of the common limit tend to zero. Since the approximations are nonnegative and $zeta_j gt.eq 1$ on $K_j$, their integrals over $K_j$ tend to zero. This proves (12.1) without a convergence rate uniform in $T_k$.
  Choose a cap time $t_(* \, k)$ of each selected solution and set $r_k = t_(* \, k) + s_(N_k)$. Proposition 31 gives, after subselection,
  $ s_(N_k) / r_k arrow.r l \, #h(2em) T_k / r_k arrow.r U in \[ 1 \, oo \] \, #h(2em) frac(h_k \( r_k t \, r_k x \, v \), m_(T_k) r_k) harpoon.rt g $
  locally in spacetime on $0 < t < U$. By Proposition 33, $g equiv.not 0$; by Proposition 44, $U < oo$. Consequently
  $ rho_k = r_k / T_k arrow.r rho = 1 / U > 0 . $
  This positive lower bound permits comparison of the two dilations. Since $F_k = c_k + u_k + h_k gt.eq h_k$ through its cap horizon,
  $ 0 lt.eq frac(h_k \( r_k t \, r_k x \, v \), m_(T_k) r_k) lt.eq rho_k^(- 1) f_k \( rho_k t \, rho_k x \, v \) . quad "(12.2)" $ <sep:scale-comparison>
  Fix a compact subset $K$ of $\( 0 \, U \) times bb(R)_x^3 times { macron(v) eq.not 0 }$. For all sufficiently large $k$, the images of $K$ under $\( t \, x \, v \) mapsto \( rho_k t \, rho_k x \, v \)$ lie in one fixed compact subset $K'$ of $cal(V)$. The four-dimensional space–time Jacobian is $rho_k^4$, so (12.2) yields
  $ integral_K frac(h_k \( r_k t \, r_k x \, v \), m_(T_k) r_k) thin upright(d) t thin upright(d) x thin upright(d) v lt.eq rho_k^(- 5) integral_(K') f_k \( t \, x \, v \) thin upright(d) t thin upright(d) x thin upright(d) v arrow.r 0 . $
  Thus $g = 0$ off the velocity axis. The cap $0 lt.eq g lt.eq \( t + l \) H$ makes $g$ a density, and the axis has Lebesgue measure zero. Hence $g = 0$ almost everywhere, contradicting Proposition 33.
  It follows that for all sufficiently small horizons no cap limit can equal the fixed dormant limit on the corresponding early interval. Choose one such cap limit. Both it and $F^(upright(d))$ are global entropy solutions with the same datum and all local conservation laws, and they differ on a set of positive spacetime–velocity measure. Rotating back from the lattice $Lambda$ to $bb(Z)^3$ preserves these properties and gives the assertion on $bb(T)^3$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
