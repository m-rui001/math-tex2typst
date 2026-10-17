#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[A Pivotal Amplitude for Voronoi Percolation \
from Cardy's Formula]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $eta_epsilon$ be a homogeneous Poisson process in $bb(R)^2$ of intensity $epsilon^(- 2)$. Color its Voronoi cells independently black or white, each with probability $1 \/ 2$. For a bounded quadrilateral $Q$, a black crossing means a connected black-cell path inside the closed quadrilateral joining its two specified opposite sides. The cells are those of the full-plane tessellation: the process is not resampled at the boundary, and no boundary sites are wired together.

A nucleus is #emph[color-pivotal] for this event if changing only its cell’s color changes whether the crossing occurs. Write $N_epsilon \( Q \)$ for the number of such nuclei, including nuclei outside $Q$ when their cells meet $Q$, and set $N_epsilon = N_epsilon \( \[ 0 \, 1 \]^2 \)$ for a left-to-right crossing. All expectations below average both the Poisson geometry and the colors.

#prodef([Assumption 1.1.])[
  (Scalar Cardy limit).  For every bounded Jordan quadrilateral $Q$ with four distinct marked boundary points, the critical crossing probability converges, as $epsilon arrow.b 0$, to Cardy’s conformally invariant value.
] <ass:cardy>

Here a Jordan quadrilateral is a Jordan domain with four marked boundary points in cyclic order and a specified pair of opposite boundary arcs. In the upper half-plane normalization with marked points $0 \, x \, 1 \, oo$, $0 < x < 1$, the crossing between $\[ 0 \, x \]$ and $\[ 1 \, oo \]$ has Cardy value

$ frac(Gamma \( 2 \/ 3 \), Gamma \( 1 \/ 3 \) Gamma \( 4 \/ 3 \)) x^(1 \/ 3) thin zws_2 F_1 #h(-0.16667em) (1 / 3 \, 2 / 3 \; 4 / 3 \; x) . $

Assumption 1 concerns one crossing event at a time. It neither asserts a quantitative convergence rate nor assumes an exploration or multi-crossing scaling limit.

#thm([Theorem 1.2.])[
  #emph[Under Assumption 1, there exists a constant $c_V in \( 0 \, oo \)$ such that 
$ lim_(epsilon arrow.b 0) epsilon^(3 \/ 4) bb(E) N_epsilon = c_V . $

 Consequently, the inverse expected pivotal count is asymptotic to $c_V^(- 1) epsilon^(3 \/ 4)$.]
] <thm:main>

The constant refers to the specified square, crossing event, intensity convention, and color-pivotal count. The theorem is conditional on Assumption 1; it does not prove Cardy’s formula for the Voronoi model.

=== 1.1 History and significance <history-and-significance>

Cardy’s formula [3] predicts crossing probabilities at criticality from the conformal shape of a planar domain. Smirnov proved the formula and conformal invariance of crossing probabilities for critical site percolation on the triangular lattice [13]. Schramm’s stochastic Loewner evolution, the exponent calculations of Lawler, Schramm, and Werner, and their percolation application by Smirnov and Werner [11,9,14] turned this conformal description into precise information about rare connection events. In particular, the alternating four-arm exponent is $5 \/ 4$. A bulk site is pivotal only when four alternating arms emerge from its neighborhood, so this exponent predicts a pivotal count of order $epsilon^(- 2) epsilon^(5 \/ 4) = epsilon^(- 3 \/ 4)$.

The distinction between an exponent and an amplitude is essential here. An estimate $bb(E) N_epsilon = epsilon^(- 3 \/ 4 + o \( 1 \))$ allows a slowly varying or oscillating multiplicative correction. Sharp arm asymptotics, with a limiting multiplicative constant, have been proved for critical triangular-lattice percolation by Du, Gao, Li, and Zhuang [5]. Theorem 2 concerns a Poisson–Voronoi color-pivotal observable, under a qualitative crossing-limit hypothesis, rather than an unconditional triangular-lattice arm probability.

For Voronoi percolation, box-crossing and arm estimates [15,16] provide the multiscale control needed to study critical and near-critical behavior; we recall the precise estimates used here in Section 2. Pivotal measures and their role in near-critical scaling limits were developed for triangular-lattice percolation by Garban, Pete, and Schramm [6]. The companion manuscript [10] derives a quenched near-critical theory for Voronoi percolation from the scalar Cardy hypothesis. In particular, it calibrates local pivotal observables against the inverse expected pivotal count. Its normalization remains defined through that count. Our task is to show that this normalization is a pure power of the Euclidean mesh, with a positive limiting coefficient.

Several ingredients have established predecessors. The passage from local crossing data to joint crossing information uses the quad-crossing framework and gluing theory of Schramm and Smirnov [12]. The annular exploration calculation uses Zhan’s annulus SLE [17]. We state the precise inputs from [10] before beginning the proof, and prove the additional annular and signed-transfer estimates needed for the amplitude.

=== 1.2 The mechanism of the proof <the-mechanism-of-the-proof>

Work temporarily at unit Poisson intensity and enlarge the observation window. Let

$ Q_0 = \[ - 1 \, 1 \] times \[ - 1 \/ 2 \, 1 \/ 2 \] \, #h(2em) f \( R \) = bb(P) { upright("a site inserted at ") 0 upright(" is color-pivotal in ") R Q_0 } . $

The inputs from [10] imply $f \( R \) = R^(- 5 \/ 4 + o \( 1 \))$ and allow the final answer to be recovered from the existence of $lim_(R arrow.r oo) R^(5 \/ 4) f \( R \) in \( 0 \, oo \)$.

To improve the exponent to an amplitude, we compare #emph[differences] of connection states across an annulus. A connection state records which boundary color runs are joined through the interior, equivalently the noncrossing pairing of the interfaces between those runs. The transmitted difference vanishes unless at least four interfaces survive across the annulus. With exactly four surviving interfaces, the two possible interior states differ by a single scalar. This is the source of a rank-one approximation for long-annulus transmission.

There is a second, stronger estimate. Adding one fair-colored Poisson point produces a signed change that is invariant under color reversal and rotations. In this symmetry class, the leading four-interface contribution cancels. An explicit spectral calculation shows that the remaining transmission decays faster than the inverse square of the annulus scale ratio. This threshold is important: the point to be inserted ranges over the two-dimensional plane, so the insertion effect must be integrable in its location. An unsigned four-arm bound, with exponent $5 \/ 4$, cannot supply that integrability.

The proof has three stages. First, Sections 3–Section 5 construct the annular transmission limits and establish their rank-one asymptotic and signed rotational cancellation. Next, Section 6 makes these estimates uniform over arbitrary signed boundary data and iterates them in the discrete Poisson model. Finally, Section 7 differentiates $f$ with respect to Poisson intensity. The integrable insertion estimate controls distant insertions, while the rank-one estimate compares the normalized effect of nearby insertions at two outer scales. Together they show that the logarithmic derivative of $f$ has a summable error from $- 5 \/ 4$.

The quantitative estimates do not come from a rate in Assumption 1. We first choose a large but fixed annulus ratio, use qualitative convergence to obtain the required contraction beyond a sufficiently large starting scale, and only then iterate. The uniformity over arbitrary signed boundary data, and the separation between rank-one contraction and symmetry-enhanced decay, are the technical features that may be useful for other amplitude problems.

== 2 Critical inputs and normalization <sec:inputs>

This section specifies the consequences of Assumption 1 that we import from the companion manuscript [10]. In particular, the exploration and normalization statements below are previously proved inputs, not additional hypotheses and not conclusions of scalar convergence alone without further argument. The remainder of this paper proves the annular estimates and the amplitude from these inputs.

Throughout, $C \, c$ denote positive constants whose values may change between occurrences. A comparison $u asymp v$ means that $u \/ v$ lies between two fixed positive constants. Fixed-factor changes in arm radii and fixed buffer widths are absorbed in these constants. We use unit-intensity geometry except when explicitly introducing a mesh parameter. Let $b_(*)$ be a sufficiently large fixed microscopic radius.

=== 2.1 Arms, localization, and local changes <arms-localization-and-local-changes>

An arm in an annulus is a monochromatic cell path joining its two boundary components. Alternating four arms have colors black, white, black, white in cyclic order. Let $A \( r \, s \)$ be their probability in the square-annulus convention of [10], for $b_(*) lt.eq r < s$.

#thm([Proposition 2.1.])[
  (Critical arm and localization inputs).  #emph[There are $g in \( 1 \, 2 \)$, $alpha \, beta > 0$, and constants $C \, c > 0$ such that, for $b_(*) lt.eq r < s < t$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ c \( r \/ s \)^g & lt.eq A \( r \, s \) lt.eq C \( r \/ s \)^(1 + alpha) \,\
C^(- 1) A \( r \, s \) A \( s \, t \) & lt.eq A \( r \, t \) lt.eq C A \( r \, s \) A \( s \, t \) . $ <in:power>]

 The one-arm probability is at most $C \( r \/ s \)^beta$. The probability of three alternating arms in a straight half-plane is at most $C \( r \/ s \)^2$.]
  #emph[For a collar of diameter comparable to $s$, an event determined by the Poisson points in a slightly enlarged collar makes the graph and all vertex stars in the smaller collar local to those points, with mesh smaller than any prescribed fixed fraction of $s$. Its failure probability is at most $C exp \( - c s^2 \)$. The widths and constants can depend on that fraction. Such events may be chosen rotation equivariant about the center. Events with disjoint enlarged supports use independent Poisson variables.]
] <in:arms>

These are Lemmas 2.1 and 2.3 of [10]. The quantitative arm theory builds on the box-crossing and annealed arm estimates for Voronoi percolation; see [15,16]. A localization event will be called a #emph[screen]. For example, requiring that every ball of a sufficiently small fixed relative radius in a collar contain a Poisson point is rotation equivariant and has the asserted exponential bound, by a finite covering and the Poisson empty-ball formula. Extra buffers give locality of both cells and vertex stars. Thus a point inserted beyond the enlarged support cannot send its cell through the screened collar.

We will also use the necessary-arm conclusions of Lemma 2.2 of [10]. A color change or a local insertion that changes a crossing requires four alternating arms out of its interior support. Near a straight side, these continue as three alternating half-plane arms; beyond the scale of a corner, at least one arm continues. These statements use the exact closed-cell crossing convention. They apply to a mixed difference of two local changes as well: if the mixed difference is nonzero, each local change affects the appropriate crossing in at least one of the other local states. Screens keep the other modification out of the arm probes used for this implication.

For later independence arguments it is useful to allow failed screens inside an arm probe. Here is the convention and the estimate behind it. Place screens at geometrically spaced radii. If the largest failed radius is $v$, retain only the arm test starting at $C_0 v$, with its screens, where $C_0$ provides a fixed unused gap. This retained test is independent of the failed screen. Quasi-multiplicativity and (2.1) give, when $C_0 v < s$,

$ A \( C_0 v \, s \) lt.eq C \( v \/ r \)^g A \( r \, s \) . $

Consequently, summing the failed-screen terms over geometric radii costs at most

$ C A \( r \, s \) sum_(v gt.eq r) \( v \/ r \)^g e^(- c v^2) lt.eq C A \( r \, s \) . $

If $C_0 v gt.eq s$, the exponential bound and the polynomial lower bound give the same conclusion. The corresponding construction for one-arm and straight half-plane three-arm tests preserves their displayed power upper bounds. We call these #emph[screened arm probes]. Their supports can be separated by fixed-factor gaps, and they can be used in the presence of inserted sites outside their buffers.

=== 2.2 Fixed-scale convergence and exploration domains <fixed-scale-convergence-and-exploration-domains>

The following inputs are qualitative. Their order of limits will matter: all radii, buffer widths, and domain tests are fixed before the mesh tends to zero.

#thm([Proposition 2.2.])[
  (Scaling-limit inputs).  #emph[Under Assumption 1, the following consequences hold.]
  + #emph[From every sequence of Poisson meshes tending to zero one can extract, after coupling, a further subsequence along which the graphs almost surely form a deterministic good sequence in the sense of [10] Lemma 2.5. Along such a sequence, critical crossings of Jordan quadrilaterals converge, also for graph domains whose boundaries and marked points converge in curve order. Finite joint crossing tests and tests with finitely many separated prescribed squares have the common triangular-percolation limit.]
  + #emph[Chordal color explorations in converging Jordan graph domains converge to chordal $upright("SLE")_6$. At a pre-query stop on a crosscut, the remaining target face, its boundary banks, and its conformal maps converge in the sense of the stopped-domain results of [10]. A bank is an individual boundary arc in prime-end order; distinct banks may have touching physical images. Each relevant bank is individually simple.]
  + #emph[For some $c_0 > 0$, in the mesh-first limit the probability of four bulk arms with any specified color order is at most $C \( r \/ s \)^(1 + c_0)$, and that of six bulk arms with any specified color order is at most $C \( r \/ s \)^(2 + c_0)$. Three free arms at a regular boundary, measured in a conformal chart, have an upper bound with exponent strictly larger than one.]
] <in:limits>

For precise locators, part (i) uses Proposition 2.4, Lemma 2.5, and Proposition 4.5 of [10]; part (ii) uses Proposition 3.1 and Lemmas 3.4–3.7; part (iii) uses Lemmas 2.7, 2.8, and 2.11. The free boundary-arm estimate in Lemma 2.11 has exponent $4 \/ 3$. “Free” means that the arms use the independent fair interior sites, not the sites in the prescribed base arc.

We emphasize two domain qualifications. First, a boundary chart must converge uniformly on its closure, have no constant boundary subarc, and project injectively on the compact bank interval where the estimate is used. Separate prime-end banks need not have disjoint physical projections. The local estimate applies in an annulus by choosing a small graph disk patch with one side on that bank and the remaining sides in the interior. These are Jordan approximations; reflection in the parameter coordinate gives bounded distortion on smaller patches. Second, product colors are conditional on the graph. After an exploration, its remaining colors are fresh, but a remaining-domain theorem can be used only after its geometric hypotheses have been established. We never infer uniform convergence after conditioning on arbitrary atypical explored colors. The uniform operator estimate in Section 6 will instead use independent core variables and bounds on the signed weights.

We use the site triangulation of the Voronoi tiling from [10]. Its faces are triangles, drawn through the tiling rather than required to have straight edges. An interface strand, or #emph[wall], passes through a triangle between its two heterochromatic edges. Inside a screened collar, simple site cycles approximate circles in curve order. They may be constructed by following narrow strips and retaining simple cuts; same-boundary chords on the domain-facing side can be shortcut while retaining the specified inner region. Auxiliary uniform angular choices, if needed, preserve rotation invariance.

All transfer cuts in this paper lie in the bulk. Their incident cells and stars stay away from the quad boundary, where site connectivity and cell connectivity could otherwise require additional care. At the actual quad boundary, we retain the original closed-cell event and use the necessary-arm estimates just stated. Null nongeneric geometries, and null sets of insertion locations in integrals, are discarded throughout.

=== 2.3 Calibration and the preliminary exponent <calibration-and-the-preliminary-exponent>

Let $S_epsilon$ be the probability that a site inserted at the center of $Q_0 = \[ - 1 \, 1 \] times \[ - 1 \/ 2 \, 1 \/ 2 \]$ is color-pivotal for its left-to-right crossing in intensity $epsilon^(- 2)$. Equivalently, $S_epsilon$ is the expectation of the black-forced crossing indicator minus the white-forced crossing indicator for that site. Set

$ m_epsilon = epsilon^(- 2) \, #h(2em) q_epsilon = #scale(x: 120%, y: 120%)[\(] bb(E) N_epsilon \( Q_0 \) #scale(x: 120%, y: 120%)[\)]^(- 1) \, #h(2em) f \( R \) = S_(1 \/ R) . $

The last equality agrees by Euclidean scaling with the unit-intensity definition in the introduction.

#thm([Proposition 2.3.])[
  (Calibration).  #emph[There are constants $c \, B in \( 0 \, oo \)$ such that 
#[#set math.equation(numbering: n => "(2.2)")
 $ m_epsilon q_epsilon S_epsilon arrow.r c \, #h(2em) q_epsilon bb(E) N_epsilon arrow.r B . $ <in:calibration-eq>]

 Moreover, 
#[#set math.equation(numbering: n => "(2.3)")
 $ f \( R \) asymp A \( b_(*) \, R \) . $ <in:comparison>]

]
] <in:calibration>

The limits are precisely the single-time Poisson specialization of Lemmas 7.1 and 7.2 of [10], called “Common calibration” and “The prescribed normalization.” The signed color weight at the inserted site is $delta_1 - delta_0$; crossing monotonicity identifies its expectation with $S_epsilon$. The comparison follows from the local pivotal bounds and the square-to-site calibration in Sections 2 and 6 of [10]. These inputs do not assert that $R^(5 \/ 4) f \( R \)$ converges.

#thm([Lemma 2.4.])[
  (Exponent without an amplitude).  #emph[Under Assumption 1, 
#[#set math.equation(numbering: n => "(2.4)")
 $ f \( R \) = R^(- 5 \/ 4 + o \( 1 \)) #h(2em) \( R arrow.r oo \) . $ <in:exponent-eq>]

]
] <in:exponent>

#proof[
  Force all cells meeting a central square of radius $h$ in $Q_0$ first black and then white, and denote the difference of crossing probabilities by $D_epsilon \( h \)$. Proposition 4.5 of [10] gives, for each fixed small $h > 0$, a common limit of this quantity in the Voronoi and triangular models. The upper arm bound and [10] Lemma 6.1, “A square can transmit a pivotal change,” compare $D_epsilon \( h \)$ with the four-arm probability from radius $h$ to radius $1$, with constants uniform in small $h$, after taking the mesh limit. The corresponding triangular four-arm probabilities have exponent $lambda = 5 \/ 4$ by [14].
  Fix $eta > 0$. For an arbitrarily large but fixed ratio $L = 1 \/ h$, these comparisons and qualitative convergence imply, for all sufficiently large $r$ depending on $L$,
  $ c_eta L^(- lambda - eta \/ 3) lt.eq A \( r \, L r \) lt.eq C_eta L^(- lambda + eta \/ 3) . $
  Choose $L$ so large that both these constants and the constants in (2.1) are absorbed by an additional factor $L^(eta \/ 3)$. Only after fixing this $L$ choose a starting radius above the convergence threshold. Iterating over radii $r \, L r \, L^2 r \, dots.h$ gives four-arm bounds with exponents between $lambda - eta$ and $lambda + eta$. The bounded initial range and the final incomplete ratio change only the multiplicative constants, by (2.1) and (2.1). Equation (2.3) then yields $C_eta^(- 1) R^(- lambda - eta) lt.eq f \( R \) lt.eq C_eta R^(- lambda + eta)$. Letting $eta arrow.b 0$ proves the lemma. ◻
]

We will henceforth write $lambda = 5 \/ 4$. The remaining task is to replace the $o \( 1 \)$ in this exponent by convergence of the multiplicative coefficient. The next two analytic sections identify which annular symmetries make that improvement possible.

== 3 Four-interface transmission in an annulus <sec:annuli>

The continuum quantity used below is the probability that four interfaces cross an annulus from one boundary component to the other. Its existence does not follow by applying the scalar Cardy hypothesis directly to a multiply connected domain. We establish it from the Jordan-domain inputs of [10]. We also allow the boundary banks produced by stopped explorations: a bank is viewed with its access from the domain, so distinct banks may touch in the plane without being identified.

=== 3.1 Connection states and two caps <connection-states-and-two-caps>

Use the site triangulation drawn through the Voronoi tiling, with interface strands drawn across the heterochromatic edges of its triangular faces. These strands will be called #emph[walls]. On a simple site cycle with known colors, a #emph[run] is a maximal consecutive set of sites of one color, and a #emph[switch] is the edge between consecutive runs. Filling the disk bounded by the cycle determines a noncrossing pairing of its switches by walls. The pairing, together with the run colors, determines connectivity between boundary sites. Closed walls need not be recorded. We call this pairing the connection state on the cycle.

Suppose each boundary component of a graph annulus has four switches and four alternating prescribed runs. All remaining sites have independent fair colors. Let $cal(T)$ be the event that all four outer wall ends reach the inner boundary. There are two possible connection states in a disk filling the inner cycle: the cap joining its two black runs, denoted $sans(b)$, and the cap joining its two white runs, denoted $sans(w)$. These are formal planar caps; no random colors are sampled in them. Write $H_(sans(b))$ and $H_(sans(w))$ for the indicators that the two outer black runs are connected after the corresponding cap is attached. Figure 1 shows the two cap states when all four walls are transmitted.

#thm([Lemma 3.1.])[
  (The cap identity).  #emph[For every coloring of the annulus, 
#[#set math.equation(numbering: n => "(3.1)")
 $ H_(sans(b)) - H_(sans(w)) = upright(bold(1))_(cal(T)) . $ <an:cap-equation>]

 Consequently the signed difference between the two inner cap states is transferred to the same signed difference at the outer cycle, multiplied by the indicator of four-interface transmission. The identity remains valid under composition across several cycles.]
] <an:caps>

#proof[
  Walls in a triangulation neither branch nor cross. If fewer than four inner ends are connected to outer ends, the wall pairing visible from the outer cycle is independent of the inner cap: there is no choice of pairing on zero or two surviving ends. Thus the left side of (3.1) is zero. If all four are transmitted, their cyclic order is preserved, with any possible winding retained. The intervening monochromatic bands carry black connectivity to black connectivity and white connectivity to white connectivity. Hence $H_(sans(b)) = 1$ and $H_(sans(w)) = 0$. This is also the usual Hex duality proof after each run is contracted to a vertex. Composing the planar pairings proves the last assertion; any closed walls created in the composition have weight one. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.61, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  circle((0, 0), radius: 0.6612, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  arc((1.138, 1.138), start: 45deg, stop: 135deg, radius: 1.61, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  arc((-1.138, -1.138), start: 225deg, stop: 315deg, radius: 1.61, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  arc((0.4675, 0.4675), start: 45deg, stop: 135deg, radius: 0.6612, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  arc((-0.4675, -0.4675), start: 225deg, stop: 315deg, radius: 0.6612, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  line((0.4675, 0.4675), (1.138, 1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((0.4675, 0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((1.138, 1.138), radius: 0.04939, fill: black, stroke: none)
  line((-0.4675, 0.4675), (-1.138, 1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((-0.4675, 0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((-1.138, 1.138), radius: 0.04939, fill: black, stroke: none)
  line((-0.4675, -0.4675), (-1.138, -1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((-0.4675, -0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((-1.138, -1.138), radius: 0.04939, fill: black, stroke: none)
  line((0.4675, -0.4675), (1.138, -1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((0.4675, -0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((1.138, -1.138), radius: 0.04939, fill: black, stroke: none)
  content((0, 1.844), [$B$])
  content((0, -1.844), [$B$])
  content((-1.844, 0), [$W$])
  content((1.844, 0), [$W$])
  content((0, -2.305), [Black cap: $H_( sans(b) )=1$])
  circle((5.22, 0), radius: 1.61, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  circle((5.22, 0), radius: 0.6612, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  arc((6.358, 1.138), start: 45deg, stop: 135deg, radius: 1.61, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  arc((4.082, -1.138), start: 225deg, stop: 315deg, radius: 1.61, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  arc((5.688, 0.4675), start: 45deg, stop: 135deg, radius: 0.6612, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  arc((4.752, -0.4675), start: 225deg, stop: 315deg, radius: 0.6612, stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  line((5.688, 0.4675), (6.358, 1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((5.688, 0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((6.358, 1.138), radius: 0.04939, fill: black, stroke: none)
  line((4.752, 0.4675), (4.082, 1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((4.752, 0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((4.082, 1.138), radius: 0.04939, fill: black, stroke: none)
  line((4.752, -0.4675), (4.082, -1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((4.752, -0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((4.082, -1.138), radius: 0.04939, fill: black, stroke: none)
  line((5.688, -0.4675), (6.358, -1.138), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  circle((5.688, -0.4675), radius: 0.04939, fill: black, stroke: none)
  circle((6.358, -1.138), radius: 0.04939, fill: black, stroke: none)
  content((5.22, 1.844), [$B$])
  content((5.22, -1.844), [$B$])
  content((3.376, 0), [$W$])
  content((7.064, 0), [$W$])
  content((5.22, -2.305), [White cap: $H_( sans(w) )=0$])
  bezier((0.4675, 0.4675), (0.4675, -0.4675), (0.174, 0.2175), (0.174, -0.2175), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((-0.4675, 0.4675), (-0.4675, -0.4675), (-0.174, 0.2175), (-0.174, -0.2175), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((5.688, 0.4675), (4.752, 0.4675), (5.438, 0.174), (5.002, 0.174), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
  bezier((4.752, -0.4675), (5.688, -0.4675), (5.002, -0.174), (5.438, -0.174), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", miter-limit: 10))
})],
  caption: [Figure 1: The two cap pairings when all four walls are transmitted. Blue curves are walls; thick black boundary arcs are black runs, and the other runs are white. The cap changes the outer black connection bit by one. The straight, unwound walls are schematic: the identity permits winding and does not prescribe a pairing of numbered inner and outer switches. ],
) <fig:annular-caps>

=== 3.2 The boundary convergence used below <the-boundary-convergence-used-below>

For $p > 0$ let

$ bb(A)_p = { e^(- p) < \| z \| < 1 } . $

Thus $p = log \( R \/ r \)$ for a round annulus with radii $r < R$. On both circles angles increase counterclockwise. Write $x = \( x_1 \, x_2 \, x_3 \, x_4 \)$ for the outer switches and $y = \( y_1 \, y_2 \, y_3 \, y_4 \)$ for the inner switches, using increasing lifts with $x_4 < x_1 + 2 pi$ and $y_4 < y_1 + 2 pi$. Common translation of either lift by $2 pi$ does not change the data. The run following the first outer switch is black. For the $+$ prescription the corresponding inner run is black; for the $-$ prescription it is white.

All limits in this section are taken along deterministic good sequences of triangulations in the sense of [10] Section 2, “Deterministic sequences and Jordan tests”. In particular the mesh tends to zero on compact sets, the joint Jordan-quad crossing limits hold, and the mesh-first arm estimates recalled above are available. Probabilities are over product colors conditional on these triangulations.

#prodef([Definition 3.2.])[
  A sequence of marked graph annuli $D_n$ has #emph[admissible boundary convergence] if it lies in a fixed bounded set and satisfies the following conditions.
  + Each boundary is a simple site cycle. With rotations normalized, its uniformization $phi.alt_n : bb(A)_(p_n) arrow.r D_n$ extends continuously to the closed annulus, where $p_n arrow.r p in \( 0 \, oo \)$. After linear identification in logarithmic radial coordinates, these maps converge uniformly on the closed annulus to $phi.alt$. The map $phi.alt$ is conformal and one-to-one in $bb(A)_p$, and its boundary traversal specifies the prime-end accesses of $D = phi.alt \( bb(A)_p \)$.
  + Each limiting boundary traversal is a concatenation of finitely many simple arcs, each understood with its own access. Different arcs may meet in physical projection. The two boundary components remain distinct as prime-end boundary components.
  + The four switches on each component converge in these coordinates to distinct switches. Between them the prescribed run colors alternate. The sites strictly between the two cycles have fresh independent fair colors.
  In graph constructions a boundary is taken without chords facing the domain when that is required for a local boundary chart. Such cuts are obtained by the graph approximation and shortcut construction of [10] Section 2; at an exploration frontier, edges between already revealed vertices are included before the frontier is taken.
] <an:admissible>

The definition permits a slit to have two different banks, even when their images coincide. It does not identify these banks. The next elementary convergence criterion explains how the domains arising from stopped explorations fit this definition.

#thm([Lemma 3.3.])[
  (A back with finitely many attached lobes).  #emph[Suppose graph annuli consist of an open annular back and finitely many Jordan lobes attached to it along open seam intervals. Assume that the backs are Jordan annuli whose two complete boundary traversals converge in curve order to those of a fixed Jordan annulus, the seam endpoints converge in that order and the limiting seams remain open, and each lobe converges as a Jordan domain with its boundary traversal. The seam incidences and cyclic order are fixed; lobes are glued only along their specified seams, and their interiors are disjoint from the back and from one another. Suppose the resulting limiting domain is an annulus, its hole and a separating open part of the back persist, and the two boundary components stay physically apart. Different limiting lobes may touch in projection but have disjoint interiors. Then the annular uniformizations converge uniformly on their closures, with the stated accesses and traversal order. In particular, if the marked accesses converge and remain distinct, these domains have admissible boundary convergence.]
] <an:back-lobes>

#proof[
  Every compact subset of a lobe persists by Jordan convergence. The lobe joins the back across every compact subinterval of its open seam. Conversely, every point of the limiting boundary is approached by the approximating boundaries. Contacts between different lobes do not open passages: the individual Jordan pieces are attached along their specified seams, not through a point of contact. These facts give kernel convergence with the indicated accesses. The persisting hole and separating back exclude degeneration of the modulus. The conformal kernel theorem therefore gives convergence of normalized annular maps on interiors and convergence of their moduli.
  It remains to control the boundary parameters. Fix a nonconstant open subarc of one of the finitely many Jordan boundary pieces and a point in the persisting back. Jordan-map convergence in a lobe, or in a disk patch along an unchanged back boundary, gives a positive lower bound for the harmonic measure of a smaller subarc as seen from a point in that patch. A Harnack chain through persisting interiors gives the same kind of lower bound from the fixed back point. In round annular coordinates the harmonic-measure densities from its preimage are bounded above uniformly: the moduli and the preimage stay in compact nondegenerate ranges. Consequently no fixed nonconstant subarc of the boundary traversal can be squeezed into an angular interval of length tending to zero.
  The Jordan convergence of the finitely many pieces gives convergence of the full boundary traversals in curve order. Partition those traversals into finitely many small image arcs, and apply the preceding lower bound to intervening nonconstant subarcs. A failure of equicontinuity in angular parameters would traverse one such fixed subarc in a vanishing angular interval, a contradiction. This proves equicontinuity of the boundary maps. Interior convergence then identifies every uniformly convergent subsequence, giving convergence on the closure. Small crosscuts at the finitely many joins give the same conclusion there. There is no constant boundary interval in the limiting conformal map, by uniqueness for a holomorphic function continuous on a boundary arc. The boundary order and converging marked accesses thus also identify the limiting switches. ◻
]

=== 3.3 Boundary motion and annular crossing laws <boundary-motion-and-annular-crossing-laws>

We first remove the rough banks. The arm bounds needed here are mesh-first statements: three free arms along one regular bank have an upper bound with exponent $1 + eta$ for some $eta > 0$, and a free arm from a shrinking neighborhood to a fixed scale has probability tending to zero. The word #emph[free] excludes prescribed sites and cap wires. The local bank versions, including arms approaching the bank arbitrarily closely, are those of [10] Section 2, “Cardy tests in a boundary chart” and “Free boundary-arm bounds”.

#thm([Lemma 3.4.])[
  (Continuity under boundary motion).  #emph[For a sequence with admissible boundary convergence, move either cycle slightly into the annulus in round coordinates, and move its switches slightly with it. Couple all unchanged free colors. The probability that either capped connection test changes tends to zero as the size of the motion tends to zero, after taking the mesh limit. The assertion also holds for small piecewise smooth motions in spare space around an inset annulus. It is uniform along any convergent sequence of admissible data with distinct limiting switches. More precisely, if $H_n$ and $H_(n \, delta)$ are either capped indicators before and after a motion of size at most $delta$, preserving the run order and its labels away from the moving switches, then 
#[#set math.equation(numbering: n => "(3.2)")
 $ lim_(delta arrow.b 0) limsup_(n arrow.r oo) bb(P) \( H_n eq.not H_(n \, delta) \) = 0 . $ <an:motion-limit>]

]
] <an:motion>

#proof[
  First the mesh in annular coordinates tends to zero. Otherwise a connected cell or triangle portion of vanishing physical diameter would have preimages with a subsequential nontrivial continuum limit on which $phi.alt$ is constant. Such a continuum cannot meet the interior, where $phi.alt$ is one-to-one, and cannot lie on the boundary, whose finitely many simple arcs contain no constant interval. Here graph portions, rather than whole cells crossing the domain boundary, are used.
  Remove small coordinate neighborhoods of the switches and of the finitely many joins of simple bank arcs. On each remaining compact bank interval, use disk patches whose boundary consists of that bank and cuts strictly inside the annulus. Their physical boundaries are Jordan and their graph approximations converge in curve order. Their uniformizing coordinates agree, with fixed-scale margins, with the annular coordinates; reflection in the limiting round bank controls distortion on smaller patches. Thus the local boundary-arm estimates of [10] apply on these patches even when another prime-end bank has the same physical image.
  Cover these intervals by $O \( s^(- 1) \)$ coordinate disks of radius $s$. Implement a motion much smaller than $s$ by successively replacing bank intervals, with tapered ends. At graph level choose short transverse joins in disjoint narrow strips from the old cycle to its replacement. Substitute the intervals in cyclic order, retaining the old cycle off the interval currently being changed and erasing the joins once the whole cycle is replaced. The graph approximation in curve order ensures that these are simple cuts. Each join has the same constant color as its run. Moves containing switches or bank joins are instead included in the exceptional neighborhoods. Two nearby nonnested contours can be compared through a common slightly inset contour.
  Consider one ordinary move on a black bank. If a capped connection test changes, choose a winning black connection in one test and a winning dual white connection in the other. Contract the prescribed runs and use the same cap in both tests. Purely wired connections do not change, so a free segment of a winning path must meet the support of the move. The test neighborhood avoids every other run and mark. The white path has two free branches leaving that neighborhood. At least one black branch must also leave freely: a black branch already reaching the same prescribed run outside the moved interval could be joined there without the local change. Taking simple paths after contraction gives disjoint white branches, and the opposite-colored black branch is disjoint from them in the common fair region. This gives three free arms in a slightly shifted half-patch, with fixed-factor margins. The same argument applies with the colors interchanged. Forced sites on intermediate cuts are not counted as free arms.
  For any fixed larger chart scale, the mesh-first bound for a single disk is $O \( s^(1 + eta) \)$. The union over $O \( s^(- 1) \)$ disks therefore costs $O \( s^eta \)$. The number of exceptional neighborhoods is fixed. A change there requires a fair arm approaching from positive parameter distance: connections already provided by the same run or by the cap do not change. This arm has positive physical diameter, uniformly after fixing its outer parameter scale, by the no-continuum-fiber observation above. The ordinary physical one-arm bound consequently makes the exceptional cost tend to zero, including at a contact between different accesses. One may move each exceptional neighborhood as a single piece, so this cost is not multiplied by the number of ordinary intervals.
  First take the mesh limit, then make the ordinary motions small compared with $s$, then let $s$ tend to zero, and finally shrink the exceptional neighborhoods. This proves the assertion. The same proof with moving marks, or with a moving round radius, proves the stated continuity. ◻
]

After applying Lemma 10, all prescribed banks can be placed on smooth contours strictly inside the parameter annulus, with spare space on both sides. There are still two separate issues: joint ordinary crossings must have a conformally invariant annular law, and those crossings must determine the capped tests. We address them in that order.

#thm([Lemma 3.5.])[
  (Ordinary crossings in an annular open set).  #emph[In an annular open set compactly inside the parameter annulus, the joint limiting law of any countable collection of regular ordinary quad tests is conformally invariant. The tests may be chosen from a countable dense family of polygon or piecewise smooth quads with positive margins.]
] <an:ordinary>

#proof[
  On every strict Jordan disk patch the joint law is the critical triangular percolation law by [10] Sections 3–4. This law is conformally invariant; see [2] Theorems 1 and 7 and the quad-crossing formulation in [6] Section 2.3. Scalar Cardy sandwiches identify smooth images of polygon tests and nearby graph crossing conventions with the same limit.
  Choose a finite-length smooth cut opening the annulus. Any finite collection of tests compactly contained off the cut fits in a strict Jordan disk, so its joint law agrees in the physical domain and in the conformal chart. To recover tests meeting the cut, use the Schramm–Smirnov gluing theorem [12] Theorem 1.19 and Proposition 4.1, only in strict Jordan disk patches. For the critical triangular crossing law, the crossing of a regular quad in such a patch is measurable, modulo null sets, with respect to countably many tests avoiding the finite smooth cut in that patch. Its hypotheses hold here: independence in the discrete model, RSW, one-arm decay, and a four-arm exponent strictly greater than one. Regular continuity tests may be used throughout, by Cardy sandwiches.
  Each required quad meeting the annular cut has a slightly larger Jordan disk neighborhood inside the annulus. The recovering measurable rule in that neighborhood is the same in the chart and in its image, since their whole disk laws already agree. All recovering tests belong to the common countable off-cut family. Hence the recovered crossings have the same joint law as well. This proves the assertion. White crossings are included by Hex duality and continuity. No gluing assertion along a rough slit is used. ◻
]

#thm([Proposition 3.6.])[
  (The annular transmission limit).  #emph[For every sequence with admissible boundary convergence, the probability of $cal(T)$ has a limit depending only on the round data $\( p \, x \, y \)$ and the choice of inner colors. Denote these limits by 
$ T^(+) \( p \, x \, y \) \, #h(2em) T^(-) \( p \, x \, y \) . $

 They are continuous for $p > 0$ and distinct switches. The same convergence holds for each capped connection probability. In particular, it applies to random remaining domains whenever, conditional on their geometry and explored boundary, their interior colors are fresh and their marked domains have admissible convergence almost surely in a subsequential coupling. In that case the difference between the conditional transmission probability and $T^plus.minus$ evaluated at the actual annular conformal data tends to zero in mean absolute value.]
] <an:limit>

#proof[
  By Lemma 10, it suffices first to consider smooth inset annuli with spare space. We show that ordinary quad crossings determine the limiting value of each capped black connection test. Sample fair colors throughout a slightly larger annular neighborhood in that spare space, overriding them on prescribed runs only when evaluating a capped test. Ordinary tube tests use the fair colors. Compare two candidate sequences, one of which may be in round coordinates. Couple their countable ordinary crossing vectors through the common limiting law of Lemma 11. Along further subsequences include the cap indicators in the coupling; the curve tightness proved below also allows the chosen winning paths to be included. The two limiting collections are coupled to have the same ordinary crossing vector.
  Fix a small #emph[favorable] perturbation of the black test in the second sequence. Move black banks into the annular fluid and extend their runs slightly past the old switches; retreat white banks from the old fluid. Use positive slacks and taper the motions within the old white intervals, putting each new switch on the retreated part. Thus every old black attachment lies behind a new black bank, the new white banks are positively separated from the old fluid, and any removed fluid is in separate collars of the expanded black runs. All these choices take place in the spare space.
  On a positive configuration in the first sequence, contract each prescribed run and attach the cap edge when it is black. Take an outermost simple winning path between the two outer black terminals. For example attach an external terminal edge and take the appropriate boundary of the union of cycles containing it. Contracting connected boundary runs and attaching the cap preserves the planar embedding. The resulting path has no bypass on its chosen exterior side. Since it visits each contracted run at most once, it decomposes into a bounded number of free black segments joining different runs, together with wired or cap joins. Crop their endpoints by a vanishing graph distance if they end adjacent to a wire.
  We recall why these free segments admit simple limiting curves. Many oscillations across an annulus supply many disjoint free arms; BK and one-arm decay bound their probabilities. Successive-excursion compactness therefore gives tightness in the curve metric. A bulk self-contact with two positive excursions would give four black traversals. In two gaps on the no-bypass side, intermediate transverse cuts and Hex duality give two additional white traversals: a black transverse crossing would instead be a bypass. The six arms are disjoint after fixed-factor crops, also for backtracking pieces. The mesh-first six-arm exponent greater than two excludes such contacts by a covering argument. At a smooth boundary bank, a repeated visit to the same point gives at least three free traversals, including when one of the visits is an endpoint; the boundary exponent greater than one excludes these repeated visits. A single tangential bank contact need not be excluded: the favorable perturbation accommodates it. At the finitely many switches one free arm suffices. These are precisely the local no-bypass and free-segment arguments of [10] Section 4, “Free segments of a terminal path”. Contracted runs do not change the bulk argument, whose working annulus avoids them. Constant pauses may be removed.
  In a subsequential coupled representation, fix the favorable displacement and then crop each limiting free segment a small positive amount at its ends, keeping the new endpoints strictly behind the expanded black banks. A cropped endpoint may still lie on an old bank; the ambient tube may straddle that bank within the spare space. This positive crop is distinct from the vanishing graph crop used to remove incidences to a wire. Surround the cropped simple segment by a thin Jordan tube, with end caps in those endpoint neighborhoods. The approximating free graph segments supply ordinary fair-color crossings of this ambient tube. The tube can be approximated with positive margins by a quad from the countable ordinary test family. Its crossing occurs in the first sequence, and hence in the second for all sufficiently large indices in the coupling. The witnesses may be chosen from the countable family after taking the subsequential limit; coordinatewise convergence still applies to each of the finitely many chosen witnesses.
  Clip these transferred crossings when they hit the new black banks. Excursions outside the new fluid can only lie in the collars now wired black. They can be shorted through the corresponding run, and collars of different black banks are separated. This operation also handles arbitrarily many backtracks: at graph level every passage between a removed collar and the fluid meets its boundary cycle. The transferred tubes, together with the unchanged cap or wire joins, therefore give a winning black connection in the favorably perturbed second test.
  Apply this comparison to subsequences realizing the upper and lower limits of the unperturbed cap probabilities. The upper limit of the first is bounded by the lower limit of the second plus its boundary-motion error. Remove the favorable perturbations using Lemma 10 and reverse the roles of the sequences. Their upper and lower limits coincide. This proves convergence and conformal invariance of each cap test on inset annuli. Taking the inset size to zero proves the same assertions under Definition 8. The cap identity gives the transmission limit. Allowing the marks and round radii to move in the same comparison proves continuity in $\( p \, x \, y \)$.
  Finally consider random remaining domains under the stated coupling. For almost every convergent domain realization, the deterministic statement applies to its fresh product-color law; continuity identifies the same limit for $T^plus.minus$ at the actual conformal data. All probabilities are bounded by one, so bounded convergence gives convergence in mean absolute value. This conclusion does not assert a uniform conditional estimate over arbitrary atypical explored boundaries. ◻
]

#thm([Lemma 3.7.])[
  (Collisions and symmetries).  #emph[The functions $T^plus.minus$ extend continuously by zero when switches collide on either boundary, uniformly for $p$ in compact subsets of $\( 0 \, oo \)$. They are invariant under simultaneous rotation of $x$ and $y$ and under global color reversal. Cyclic relabeling by one switch in either tuple interchanges $T^(+)$ and $T^(-)$.]
] <an:collision>

#proof[
  If two consecutive switches coalesce, four-interface transmission requires a fair arm from their intervening shrinking run to the other boundary. This arm cannot use another prescribed run: it lies between the two corresponding transmitted walls. A mesh-first one-arm bound, with a fixed outer scale and then a shrinking inner scale, proves vanishing. The bound does not depend on the positions of the other switches and therefore also covers simultaneous collisions. Conformal invariance gives simultaneous rotational invariance, and fair colors give global color symmetry. Moving the first switch to the next switch reverses the alternating run labels on that component. By the defining convention, this interchanges the two inner prescriptions. ◻
]

== 4 The spectrum of four-interface transmission <sp:section>

We now estimate the limiting transmission probabilities $T^plus.minus \( p \, x \, y \)$ of Section 3 when the modulus $p$ is large. There are two different conclusions. The leading term separates into an inner factor and an outer factor. The signed difference $T^(+) - T^(-)$ has additional decay, and averaging the rotation of one end improves that decay beyond exponent $2$. This last improvement will make the response to a fair Poisson insertion integrable over the plane.

=== 4.1 The modulus equation <the-modulus-equation>

The space of four cyclically ordered, labeled angles is

$ cal(C) = { w in bb(R)^4 : w_1 < w_2 < w_3 < w_4 < w_1 + 2 pi } \/ \( 2 pi bb(Z) upright(bold(1)) \) . $

Thus we quotient by simultaneous full turns, not by cyclic relabeling. We use the product chamber $cal(X) = cal(C) times cal(C)$ for $\( x \, y \)$. All statements about distances or derivatives on this chamber use local angle lifts. Constants are uniform as angles approach a collision; moduli are bounded below by a fixed positive constant.

#thm([Proposition 4.1.])[
  (Modulus equation).  #emph[The functions $T^plus.minus$ are smooth on $\( 0 \, oo \) times cal(X)$ and satisfy 
#[#set math.equation(numbering: n => "(4.1)")
 $ partial_p T = \( L + B_p dot.op nabla \) T \, #h(2em) L = 1 / 8 sum_(w = x \, y) (3 sum_(i = 1)^4 partial_(w_i w_i) + sum_(i = 1)^4 sum_(j eq.not i) cot frac(w_i - w_j, 2) thin partial_(w_i)) . $ <sp:pde>]

 For every $p_0 > 0$ and every fixed finite derivative order $k$, the vector field $B_p$ extends smoothly across angle collisions and 
$ parallel B_p parallel_(C^k) lt.eq C_(k \, p_0) e^(- p) #h(2em) \( p gt.eq p_0 \) . $

 It is equivariant under permutations within either tuple, common rotations, and cyclic relabelings. In particular, its normal component at every collision face is zero.]
] <sp:annular-pde>

#proof[
  We first derive a local equation with just one switch active. Write the annulus as the cylinder $0 < "Im" z < p$, with real period $2 pi$, and take the active switch on its lower boundary. Parametrize its exploration by the decrease of the modulus. In the annulus Loewner normalization with zero regular constant at the driving pole, the angular kernel is
  $ H_p \( u \) = lim_(N arrow.r oo) sum_(k = - N)^N cot frac(u - 2 i k p, 2) . $
  The pole has residue $2$, and the imaginary part on the other boundary is $- 1$. The locality theorem for annulus $upright("SLE")_6$ [17] identifies the local driving angle with Brownian motion of variance parameter $6$. Only locality before leaving a small simply connected neighborhood of the active switch is used here.
  For completeness, the absence of an additional driving drift depends on the normalization. In a chordal chart the pole part is $2 \/ \( z - U_t \)$. If $F_t$ is a changing local conformal coordinate, comparison of pole residues gives the new clock $F'_t \( U_t \)^2 thin d t$. Comparison of the regular terms, both normalized to have zero constant, gives $partial_t F_t \( U_t \) = - 3 F''_t \( U_t \)$. This cancels the Itô correction $kappa F''_t \( U_t \) \/ 2$ precisely for $kappa = 6$. No condition on a remote target in the annulus enters this calculation.
  Other switches on the active boundary have velocity $H_p \( u \)$, at angular difference $u$ from the active one. Switches on the opposite boundary have angular velocity $"Re" H_p \( u + i p \)$. Pairing the positive and negative terms of the series gives, uniformly with any fixed number of derivatives,
  #[#set math.equation(numbering: n => "(4.2)")
   $ H_p \( u \) - cot \( u \/ 2 \) = O \( e^(- 2 p) \) \, #h(2em) "Re" H_p \( u + i p \) = O \( e^(- p) \) . $ <sp:kernel-errors>]
  The remainders are smooth periodic functions of $u$, including at $u = 0$. Thus, when $x_i$ is the active switch, its equation is
  #[#set math.equation(numbering: n => "(4.3)")
   $ 0 =  & - partial_p T + 3 partial_(x_i x_i) T + sum_(j eq.not i) H_p \( x_j - x_i \) thin partial_(x_j) T\
 & + sum_(j = 1)^4 "Re" H_p \( y_j - x_i + i p \) thin partial_(y_j) T . $ <sp:active-equation>]
  For an active switch $y_i$, the equation is obtained by exchanging $x$ and $y$. Indeed the cylinder change $z mapsto - z + i p$ exchanges the boundaries and reverses both angle coordinates; the angular kernels are odd, so transforming back preserves the displayed signs. Averaging these eight equations gives (4.1). The series estimates give the asserted bounds on $B_p$. The averaged expression treats the labels within each tuple symmetrically; therefore it is permutation equivariant. At a collision its two corresponding components agree, proving tangency. The other symmetries follow in the same way from the kernels.
  We justify the Markov identity underlying these equations before assuming differentiability. On a round annulus choose an arbitrarily small crosscut around the active switch, separated from all other switches and from the other boundary component. Approximate the smooth bank by chord-free graph boundaries and complete the neighborhood to a Jordan patch, putting its second color switch remotely. Up to the pre-query stop at the crosscut, the exploration in this patch is exactly the exploration in the annulus: no color beyond the crosscut is read. The stopped-exploration results of [10] Lemmas 3.6–3.7 give convergence of the path together with its remaining domains. Crosscuts may be chosen as the semicircle crosscuts in the stopped-target construction; the probability of an endpoint stop vanishes when endpoint neighborhoods shrink.
  The unaltered part, obtained by cutting off the fixed crosscut neighborhood, is a Jordan annular back with unchanged boundary traversal. For the remaining face containing this back, the stopped-target-face and remaining-domain statements of [10] Lemmas 3.6–3.7 give finitely many Jordan side pieces attached to the back along open subintervals of that crosscut. Components already disconnected from this face are discarded; no assertion of finiteness is being made about all components swallowed by the exploration. We check that its limit is still doubly connected. In the closed crosscut neighborhood, remove the side-lobe interiors and their open attaching intervals. The remaining closed set is connected to the original outer complement. Indeed join any of its points to the old outer bank by a path in that neighborhood whose interior avoids the crosscut. If this path enters a lobe, replace its portion from first entry to last exit by the corresponding subarc of the lobe boundary off its open attachment. The entry and exit lie on this retained bank, not on the crosscut. This bank meets the crosscut only at its own endpoints and enters no other lobe interior, since the Jordan interiors are disjoint. Thus each replacement avoids all lobe interiors and open attachments; finitely many replacements give a path in the complement. The unchanged inner hole is separated from this connected outer complement by the persisting annular back. These are precisely the two nondegenerate complementary components. Lemma 9 gives convergence of annular uniformizations on their closures, with the prime-end traversals and marks in order. The hole and a separating open bulk persist throughout this local exploration, so the moduli remain nondegenerate. Thus the residual annuli satisfy the hypotheses of Proposition 12. The stopping edge becomes the replacement switch, the other marks are unchanged, and the colors in the remaining face are fresh. Transmission topology and bounded convergence therefore give the local mean-value identity for $T^plus.minus$ at each of these hull stops.
  This identity first implies the active equations in the viscosity sense. Work modulo simultaneous rotation and let a smooth test function touch $T$ from above or below. On a sufficiently small crosscut stop the modulus and image marks remain in the touching neighborhood. Indeed the hull capacity tends to zero, and annular maps normalized at a remote mark tend to the identity on the other compact bank intervals, by reflection. The image of the tip is squeezed between neighboring unaffected bank points. Applying Itô’s formula to the touching function contradicts a strict inequality with the wrong sign in the active equation, because the stop takes positive time. The same touching function can be used for all eight active equations, so their average also holds in viscosity form. On every compact subset of the open chamber the averaged equation is a smooth, uniformly parabolic linear equation, also after the rotation quotient. Interior parabolic regularity then gives smoothness and the classical equation. Simultaneous rotation invariance removes the quotient. ◻
]

=== 4.2 The ground-state transform <the-ground-state-transform>

Define positive functions on the open chamber by

#[#set math.equation(numbering: n => "(4.4)")
 $ J \( w \) = product_(1 lt.eq i < j lt.eq 4) sin frac(w_j - w_i, 2) \, #h(2em) h \( x \, y \) = J \( x \)^(1 \/ 3) J \( y \)^(1 \/ 3) \, #h(2em) lambda = 5 / 4 . $ <sp:ground-state>]

The product $J$ is unchanged by a cyclic relabeling. For one tuple put $s_i = sum_(j eq.not i) cot \( \( w_i - w_j \) \/ 2 \)$. The elementary three-angle cotangent identity gives

$ sum_i s_i^2 = sum_(i eq.not j) csc^2 frac(w_i - w_j, 2) - 20 \, #h(2em) partial_(w_i) log J^(1 \/ 3) = s_i / 6 . $

Substitution in $L$ shows that each tuple contributes $- 5 \/ 8$ to $h^(- 1) L h$. Hence $L h = - lambda h$.

This ground-state calculation is the cotangent-diffusion form of the SLE–Calogero–Sutherland structure studied in [4]; we give the estimates needed here directly. The transformed generator and its invariant density are

#[#set math.equation(numbering: n => "(4.5)")
 $ D = 3 / 8 #scale(x: 120%, y: 120%)[\(] Delta + nabla log m dot.op nabla #scale(x: 120%, y: 120%)[\)] \, #h(2em) m \( x \, y \) = J \( x \)^(4 \/ 3) J \( y \)^(4 \/ 3) . $ <sp:doob-generator>]

Let $mu$ be the probability measure proportional to $m$ times Lebesgue angle measure. For $T = T^(+) \, T^(-)$, or a linear combination of them, set $W \( p \) = e^(lambda p) T \( p \) \/ h$. Equation (4.1) becomes

#[#set math.equation(numbering: n => "(4.6)")
 $ partial_p W = D W + B_p dot.op nabla W + V_p W \, #h(2em) V_p = B_p dot.op nabla log h . $ <sp:transformed-pde>]

The apparent singularities of $V_p$ at collisions are removable. Every cotangent is multiplied by a difference of two components of $B_p$, which vanishes on the corresponding collision face. Periodicity handles the face $w_4 = w_1 + 2 pi$. Thus $V_p$ has smooth bounds $O \( e^(- p) \)$ up to the chamber boundary, as does $B_p$.

#thm([Lemma 4.2.])[
  (Smoothing on the chamber).  #emph[Fix $p_0 > 0$. For either transmission function, or its sum or difference, the transformed solution satisfies 
#[#set math.equation(numbering: n => "(4.7)")
 $ parallel W \( p \) parallel_oo + "Lip" \( W \( p \) \) lt.eq C_(p_0) #h(2em) \( p gt.eq p_0 + 2 \) . $ <sp:uniform-smoothing>]

 The semigroup $P_t$ of $D$ is symmetric on $L^2 \( mu \)$ and, for every $q > 1$, maps $L^q \( mu \)$ to bounded functions at every fixed positive time. At unit time the evolution in (4.6) maps bounded functions to Lipschitz functions with a constant uniform in the starting modulus $p gt.eq p_0$.]
] <sp:smoothing>

#proof[
  We first justify using the diffusion all the way to the chamber boundary. The drift in one tuple is $1 / 4 \( sum_(j eq.not i) cot \( \( w_i - w_j \) \/ 2 \) \)_(i = 1)^4$. On the lifted convex chamber, use $- log m$, shifted to be nonnegative, as a Lyapunov function. If $alpha = 4 \/ 3$ is the density exponent, the cotangent identity shows that its generator has a singular contribution proportional to $\( alpha - alpha^2 \) sum_(i < j) csc^2 \( \( w_i - w_j \) \/ 2 \)$. This coefficient is negative, so the generator is bounded above. More explicitly, the one-tuple contribution is
  $ D \( - log J^(4 \/ 3) \) = 10 / 3 - 1 / 24 sum_(i eq.not j) csc^2 frac(w_i - w_j, 2) . $
  Stopping on inner exhaustions proves that no collision occurs in finite time. Interior existence and pathwise uniqueness therefore give a global diffusion. A bounded added drift, such as the time-dependent $B_p$, preserves noncollision by Girsanov’s theorem on each bounded time interval. The divergence form of $D$ gives symmetry and invariance of $mu$, first on interior exhaustions and then by noncollision.
  The Feynman–Kac representation for (4.6) uses $D + B dot.op nabla$ and potential $V$, with coefficients read at decreasing moduli from the evaluation modulus down to the initial modulus. Its initial data at $p_0$ obey $\| W \( p_0 \) \| lt.eq C \/ h$. To justify this representation despite the unbounded transformed data, first apply the killed representation to $T$ on inner chamber exhaustions. Lemma 13 says that the lateral values of $T$ tend uniformly to zero on each compact modulus interval. Their contribution therefore disappears. The $h$-transform on the exhaustion gives the stated representation; pass to the limit using noncollision. It suffices to do this for the nonnegative $T^plus.minus$ and then use linearity.
  Here are the uniform smoothing estimates. The negative logarithm of $m$ is convex on the lifted chamber, so the drift of $D$ is monotone dissipative. Couple two diffusions by the same Brownian motion and add to the second a drift toward the first of magnitude their initial distance divided by the allotted time, until they meet. Dissipativity forces meeting by that time. Girsanov’s theorem removes the extra drift with all fixed moments bounded in terms of the time and the initial distance. Localization inside the chamber justifies the coupling, and the preceding change-of-measure argument excludes collisions for the controlled diffusion. Hölder’s inequality gives the dimension-free form
  $ \| P_t F \( z \) \|^q lt.eq C \( q \, t \, "dist" \( z \, z' \) \) P_t \( \| F \|^q \) \( z' \) . $
  One can always choose lifts of $z \, z'$ at bounded distance. Integration in $z'$ against the invariant probability $mu$ proves the asserted $L^q$-to-supremum estimate.
  A bounded drift perturbation and a bounded potential on a unit time interval preserve initial smoothing from $L^4 \( mu \)$. Indeed Cauchy–Schwarz applied to the Girsanov density bounds the perturbed expectation of $\| f \|$ by $C \( P_1 \| f \|^2 \)^(1 \/ 2)$; the unperturbed $L^2$-to-supremum bound for $\| f \|^2$ then gives $C parallel f parallel_(L^4 \( mu \))$. There is exactly this integrability here: $h^(- 1) in L^4 \( mu \)$, since $h^(- 4) m = 1$. After the first unit interval $W$ is bounded. Its bound persists for all subsequent times because $integral_(p_0)^oo parallel V_p parallel_oo thin d p < oo$.
  The same coupling proves a Lipschitz estimate for bounded data on a unit interval. In the presence of $B$, a control of size at most a fixed constant times the initial distance forces meeting; before meeting the distance stays bounded by the same multiple of the initial distance. The second moment estimate for the Girsanov exponential bounds its total-variation cost by that distance. The two Feynman–Kac weights differ by at most the same order, since $V$ has a uniform Lipschitz bound. Thus the unit-time Lipschitz norm is bounded by a constant times the initial supremum norm. Apply this on the last unit interval to obtain (4.7). ◻
]

=== 4.3 The two symmetry gaps <the-two-symmetry-gaps>

The role of rotation averaging can now be seen explicitly. For a tuple with real ordered lift $w$, write

$ macron(w) = 1 / 4 sum_i w_i \, #h(2em) r = w - macron(w) upright(bold(1)) \, #h(2em) theta = macron(w) med \( mod med 2 pi \) . $

The relative coordinate lies in the bounded convex alcove

$ cal(A) = { r in bb(R)^4 : sum_i r_i = 0 \, med r_1 < r_2 < r_3 < r_4 < r_1 + 2 pi } . $

This identifies $cal(C)$ with a product of a circle and $cal(A)$. Its invariant law is a product as well, since $J$ depends only on the relative angles. The center part of $D$ is $\( 3 \/ 32 \) partial_theta^2$ for each tuple.

#thm([Lemma 4.3.])[
  (Spectral gaps).  #emph[The relative-angle diffusion for one tuple has Poincaré gap at least $1 \/ 2$. Consider the subspace of $L^2 \( mu \)$ consisting of functions invariant under simultaneous rotation of the two tuples and changing sign under one cyclic relabeling of either tuple. On this subspace $- D$ has gap at least $3 \/ 4$. On its subspace with both center frequencies zero the gap is at least $1$.]
] <sp:gaps>

#proof[
  For a mean-zero vector $v in bb(R)^4$ the Hessian of the negative logarithm of the one-tuple density satisfies
  $ nabla^2 \( - log J^(4 \/ 3) \) \[ v \, v \] = 1 / 3 sum_(i < j) csc^2 frac(r_i - r_j, 2) \( v_i - v_j \)^2 gt.eq 4 / 3 \| v \|^2 . $
  The Brascamp–Lieb inequality [1,7], applied on the convex alcove, therefore gives
  $ "Var" \( F \) lt.eq 3 / 4 integral \| nabla_r F \|^2 thin d mu_r . $
  The Dirichlet form has factor $3 \/ 8$, yielding the gap $1 \/ 2$. One may first use inner convex exhaustions of the alcove and then pass to the limit.
  For the two tuples, simultaneous rotation invariance allows only center frequencies $\( n \, - n \)$, whose energy cost is $3 n^2 \/ 16$. A cyclic relabeling sends $theta$ to $theta + pi \/ 2$ and acts on $cal(A)$ by a measure-preserving affine isometry. If a function changes sign under this relabeling, its relative-angle mean must vanish unless $e^(i n pi \/ 2) = - 1$, that is, unless $n equiv 2 med \( mod med 4 \)$. The same assertion holds separately for the other tuple. Therefore frequencies not congruent to $2$ modulo $4$ pay at least $1 \/ 2 + 1 \/ 2 = 1$ in relative energy. The remaining frequencies have $\| n \| gt.eq 2$ and pay at least $3 \/ 4$ in center energy. At $\( n \, - n \) = \( 0 \, 0 \)$ the two relative means vanish, giving the gap $1$.
  These inequalities give $L^2$ semigroup decay through the symmetric Dirichlet form
  $ cal(E) \( F \, F \) = 3 / 8 integral \| nabla F \|^2 thin d mu . $
  There is no hidden absorbing boundary: the constant function is in the form domain. Cutoffs approaching the collision faces have vanishing energy because the density vanishes with power $4 \/ 3 > 1$. ◻
]

Let $W_(-) = e^(lambda p) \( T^(+) - T^(-) \) \/ h$, and define

$ \( Pi F \) \( x \, y \) = frac(1, 2 pi) integral_0^(2 pi) F \( x \, y + phi.alt upright(bold(1)) \) thin d phi.alt $

on simultaneous-rotation-invariant functions. Equivalently, $Pi$ is projection to center frequencies $\( 0 \, 0 \)$. A one-step cyclic relabeling switches $T^(+)$ and $T^(-)$, while $h$ is unchanged. Thus $W_(-)$ has exactly the symmetries of Lemma 16.

#thm([Proposition 4.4.])[
  (Uniform transmission asymptotics).  #emph[There are constants $K gt.eq 0$, $sigma > 0$, and $C < oo$ such that, uniformly over the open angle chamber and all sufficiently large $p$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ parallel W_(-) \( p \) parallel_oo & lt.eq C e^(- 3 p \/ 4) \, & parallel Pi W_(-) \( p \) parallel_oo & lt.eq C \( 1 + p \) e^(- p) \,\
T^plus.minus \( p \, x \, y \) & = e^(- lambda p) #scale(x: 120%, y: 120%)[\(] K h \( x \, y \) + O \( e^(- sigma p) \) #scale(x: 120%, y: 120%)[\)] . $ <sp:odd-decay>]

 Moreover, 
#[#set math.equation(numbering: n => "(4.9)")
 $ "Lip" \( W_(-) \( p \) \) lt.eq C e^(- 3 p \/ 4) \, #h(2em) parallel W_(-) \( p + ell \) - W_(-) \( p \) parallel_oo lt.eq C e^(- 3 p \/ 4) sqrt(ell) quad \( 0 lt.eq ell lt.eq 1 \) . $ <sp:odd-regularity>]

 The function $h$ is uniformly $1 \/ 3$-Hölder on the closed chamber.]
] <sp:transmission-asymptotics>

#proof[
  For any transformed solution put $F_p = B_p dot.op nabla W \( p \) + V_p W \( p \)$. Lemma 15 implies $parallel F_p parallel_oo lt.eq C e^(- p)$ once $p$ is sufficiently large. Variation of constants gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ W \( p \) = P_(p - p_1) W \( p_1 \) + integral_(p_1)^p P_(p - s) F_s thin d s . $ <sp:duhamel>]
  This identity also follows directly by Itô’s formula with $D$, first stopping on inner exhaustions: on the interval in question the solution and the forcing are bounded, and collisions are not hit.
  For $W_(-)$ the forcing respects simultaneous rotation invariance and the two cyclic sign changes. Apply the $3 \/ 4$ gap to (4.10), and then apply the unit-time $L^2$-to-supremum smoothing to all semigroup times at least one. For shorter times use the supremum bound on $F_s$. The convolution with $e^(- s)$ is $O \( e^(- 3 p \/ 4) \)$. After projecting by $Pi$, which commutes with $D$, the gap is $1$ and the convolution is $O \( \( 1 + p \) e^(- p) \)$. This proves (4.8). It does not require $B_p$ to commute with independent rotations: the projected forcing is estimated after projection.
  For either $W^(+)$ or $W^(-)$ separately, $D$ has a positive gap off constants. Indeed the center gap is $3 \/ 32$ and the relative gap is at least $1 \/ 2$. The same argument shows exponential convergence of $W - integral W thin d mu$ to zero. Also $partial_p integral W thin d mu = integral F_p thin d mu = O \( e^(- p) \)$, so its mean converges exponentially. The first estimate of (4.8) makes the two limiting constants equal; call their common value $K$. Multiplication by $e^(- lambda p) h$ proves (4.8).
  The unit-interval Lipschitz estimate in Lemma 15, applied to the homogeneous perturbed evolution for $W_(-)$, improves its Lipschitz bound to $C e^(- 3 p \/ 4)$. To obtain time regularity, the same diffusion has expected angle displacement at most $C sqrt(ell)$ in time $ell lt.eq 1$, uniformly in its initial point. Here is a bound that remains valid near a collision. Apply Itô’s formula to squared distance from the initial lift. Each pair in the scalar product with the singular drift contributes a constant multiple of
  $ \( v - v_0 \) cot \( v \/ 2 \) \, #h(2em) v \, v_0 in \( 0 \, 2 pi \) \, $
  which is bounded above uniformly: use $v - v_0 lt.eq v$ for $v lt.eq pi$ and $v - v_0 gt.eq v - 2 pi$ for $v gt.eq pi$. The bounded additional drift and the Brownian quadratic variation then give $bb(E) \| Z_ell - Z_0 \|^2 lt.eq C ell$, by localization and Gronwall’s inequality. The Feynman–Kac representation over time $ell$, the spatial Lipschitz bound, and the bounded potential give the time estimate in (4.9). Finally $J$ is a bounded Lipschitz nonnegative function on the closed chamber, and taking a cube root is $1 \/ 3$-Hölder. The assertion for $h$ follows by taking products. ◻
]

== 5 Separating the conformal data of the two ends <sh:section>

The estimates of Section 4 are expressed in the uniformizing coordinates of the entire annulus. To use them in a transfer operator, their leading term must instead depend separately on the inner and outer explored regions. We prove the requisite comparison uniformly over their shapes. Only separation of the two ends is needed; no boundary smoothness bound is imposed.

Let $K_i$ be a closed Jordan region containing $0$ in its interior, and let $U_o$ be a bounded Jordan domain containing $K_i$. The annulus under consideration is $U_o \\ K_i$. Fix constants $c_(*) \, C_(*) > 0$ and assume that

#[#set math.equation(numbering: n => "(5.1)")
 $ K_i subset { \| z \| lt.eq a } \, quad "diam" K_i gt.eq c_(*) a \, #h(2em) { \| z \| < b } subset U_o \, quad min_(z in partial U_o) \| z \| lt.eq C_(*) b . $ <sh:shape-hypotheses>]

We take $b \/ a$ larger than a constant depending only on $c_(*) \, C_(*)$. Each boundary carries four distinct marked prime ends and alternating color prescriptions.

Normalize the two ends separately. Let

$ w_i : hat(bb(C)) \\ K_i arrow.r { \| w \| > 1 } \, #h(2em) w_i \( z \) = z \/ l_i + O \( 1 \) quad \( z arrow.r oo \) \, $

with $l_i > 0$, and let

$ w_o : U_o arrow.r { \| w \| < 1 } \, #h(2em) w_o \( 0 \) = 0 \, quad w'_o \( 0 \) = 1 \/ l_o > 0 . $

Thus $l_i$ is the logarithmic capacity of $K_i$ and $l_o$ is the conformal radius of $U_o$ at $0$. Write $y^0 \, x^0$ for the angles of the inner and outer marks in these maps. Capacity-diameter bounds for continua and the Koebe estimates imply

#[#set math.equation(numbering: n => "(5.2)")
 $ l_i asymp a \, #h(2em) l_o asymp b \, $ <sh:end-scales>]

with constants depending only on $c_(*) \, C_(*)$.

#thm([Lemma 5.1.])[
  (Uniform end-map comparison).  #emph[Let $\( p \, x \, y \)$ be the modulus and marked angles in a uniformization of $U_o \\ K_i$, with angular direction the same on both boundary components. Put $p' = log \( l_o \/ l_i \)$. The common rotational normalization of the annulus map can be chosen so that 
#[#set math.equation(numbering: n => "(5.3)")
 $ \| p - p' \| lt.eq C a / b \, #h(2em) \| x - x^0 \| + \| y - y^0 \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + log \( b \/ a \) #scale(x: 120%, y: 120%)[\)] a / b . $ <sh:comparison-estimate>]

 Distances in the second inequality use compatible cyclic lifts. The constant is uniform over all Jordan boundaries satisfying (5.1), including all placements of the marks.]
] <sh:comparison>

#proof[
  Define the single-valued analytic corrections
  $ g_i \( z \) = log frac(l_i w_i \( z \), z) \, #h(2em) g_o \( z \) = log frac(l_o w_o \( z \), z) \, $
  with branches vanishing at infinity and at zero, respectively. The quotient defining $g_o$ has no zeros in $U_o$ and the apparent singularity at zero is removable; the exterior quotient has zero winding and its logarithm is normalized at infinity. Univalent distortion and (5.2) give
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| g_o \( z \) \| lt.eq C a \/ b quad \( \| z \| lt.eq C_1 a \) \, #h(2em) \| g_i \( z \) \| lt.eq C a \/ b quad \( \| z \| gt.eq c_1 b \) \, $ <sh:correction-bounds>]
  for every fixed $C_1 < oo$ and $c_1 > 0$, once $a \/ b$ is small enough. The relevant sets in these inequalities are contained in the respective map domains. The same bounds hold in fixed round collars in the single-end coordinates. If $psi_i = w_i^(- 1)$, the maximum principle applied to $psi_i \( w \) \/ w$ gives $\| psi_i \( w \) \| lt.eq a \| w \|$ for $\| w \| > 1$. For $psi_o = w_o^(- 1)$, Koebe’s distortion bound gives $\| psi_o \( w \) \| gt.eq l_o \| w \| \/ \( 1 + \| w \| \)^2$. Thus the inverse exterior map sends $1 lt.eq \| w_i \| lt.eq 2$ into $\| z \| lt.eq 2 a$, and the inverse interior map sends, for example, $1 \/ 2 lt.eq \| w_o \| < 1$ into $\| z \| gt.eq c b$. These observations are the reason arbitrary roughness of the physical boundaries does not change the constants.
  Consider the multivalued analytic function
  $ H \( z \) = log \( z \/ l_i \) + g_i \( z \) + g_o \( z \) . $
  It has period $2 pi i$, and its real part is within $C a \/ b$ of $0$ on the inner boundary and of $p'$ on the outer boundary. Let $A \( z \)$ be an annulus logarithm, normalized by $0 < "Re" A < p$. Its period is also $2 pi i$. The difference $H - A$ is therefore single-valued. In the cylinder coordinate $A$, the circular average of the real part of any single-valued analytic function is constant across the cylinder. At the two boundary circles the averages of $"Re" \( H - A \)$ are, respectively, $O \( a \/ b \)$ and $p' - p + O \( a \/ b \)$. Equality of the averages proves $\| p - p' \| lt.eq C a \/ b$. The maximum principle now yields
  #[#set math.equation(numbering: n => "(5.5)")
   $ \| "Re" \( A - H \) \| lt.eq C a \/ b quad upright("throughout ") U_o \\ K_i . $ <sh:real-error>]
  It remains to compare the angular parts; a bound on real parts alone would not control them on arbitrary boundaries. Use instead the round collars in the single-end coordinates. The relevant single-valued functions satisfy
  $ A - log w_i = \( A - H \) + g_o \, #h(2em) A - p - log w_o = \( A - H \) + \( p' - p \) + g_i . $
  Near the inner end, $A - log w_i$ has real part bounded by $C a \/ b$, by (5.4) and (5.5), and its real part is exactly zero on $\| w_i \| = 1$. Schwarz reflection across this circle, followed by interior gradient bounds on a smaller fixed collar, bounds the variation of its imaginary part along the entire end circle by $C a \/ b$. Near the outer end apply the same argument to $A - p - log w_o$. Its real part is zero on $\| w_o \| = 1$ and is bounded by $C a \/ b$ in a fixed inner collar. This gives the analogous angular bound, initially with possibly different additive constants at the two ends.
  To match these constants, choose $C_1$ large and $c_1$ small, both fixed. The round annulus $C_1 a < \| z \| < c_1 b$ is contained in the physical annulus. Along a radial segment across it, use $O \( 1 + log \( b \/ a \) \)$ overlapping disks of fixed relative size. The gradient estimate for the analytic function $A - H$, whose real part obeys (5.5), bounds the variation of its imaginary part on each disk by $C a \/ b$. At either end, distortion in the corresponding single-end chart connects this radial segment to the fixed collar with a bounded additional chart distance. The same interior estimate and the collar reflection estimate apply there. Thus the two additive constants differ by at most $C \( 1 + log \( b \/ a \) \) a \/ b$. Choose the common rotation to fix the inner constant. The comparison of all marked angles, uniformly even when marks are very close, follows. This proves (5.3). ◻
]

#thm([Proposition 5.2.])[
  (Separated-end transmission).  #emph[There are constants $sigma_1 \, sigma_2 > 0$ and $C < oo$, depending only on the fixed constants in (5.1), such that the transmission probabilities of every such marked annulus satisfy 
#[#set math.equation(numbering: n => "(5.6)")
 $ lr(|T^plus.minus - K thin l_i^lambda J \( y^0 \)^(1 \/ 3) thin l_o^(- lambda) J \( x^0 \)^(1 \/ 3)|) lt.eq C \( a \/ b \)^(lambda + sigma_1) . $ <sh:rank-one>]

 Here $K$ is the common constant in Proposition 17. If one rotates the inner end, with its marks and prescribed colors, through angle $phi.alt$ about $0$ while keeping the outer end fixed, then 
#[#set math.equation(numbering: n => "(5.7)")
 $ lr(|frac(1, 2 pi) integral_0^(2 pi) #scale(x: 120%, y: 120%)[\(] T_phi.alt^(+) - T_phi.alt^(-) #scale(x: 120%, y: 120%)[\)] thin d phi.alt|) lt.eq C \( a \/ b \)^(2 + sigma_2) . $ <sh:rotation-average>]

 The same conclusion holds if the outer end is rotated instead. Both estimates remain uniform for Jordan approximants to the prime-end boundaries of Section 3, provided they satisfy (5.1) with the same fixed constants.]
] <sh:separated-ends>

#proof[
  Write $rho = a \/ b$ and $q = log \( 1 \/ rho \)$. By (5.2), $p' = q + O \( 1 \)$. Set $eta = C \( 1 + q \) rho$, the angular error in Lemma 18. The $1 \/ 3$-Hölder bound for $h$ and the first inequality of that lemma give
  $ \| e^(- lambda p) h \( x \, y \) - e^(- lambda p') h \( x^0 \, y^0 \) \| lt.eq C rho^lambda \( rho + eta^(1 \/ 3) \) . $
  Combining this with (4.8) proves (5.6); for example any $0 < sigma_1 < min { sigma \, 1 \/ 3 }$ is sufficient after changing the constant. Since $e^(- lambda p') = \( l_i \/ l_o \)^lambda$, the leading term has exactly the displayed separated form.
  For the signed estimate put $U = T^(+) - T^(-) = e^(- lambda p) h W_(-)$. Equations (4.8) and (4.9), together with the Hölder bound for $h$, show that replacing the actual annular data by the two single-end data costs at most
  #[#set math.equation(numbering: n => "(5.8)")
   $ C rho^2 #scale(x: 120%, y: 120%)[\(] rho^(1 \/ 2) + eta + eta^(1 \/ 3) #scale(x: 120%, y: 120%)[\)] . $ <sh:signed-shape-error>]
  This bound is uniform over the rotation of either physical end. In particular it is a power improvement on $rho^2$.
  The capacity $l_i$ is unchanged by rotation of the inner end, and its normalized map is $w_(i \, phi.alt) \( z \) = e^(i phi.alt) w_i \( e^(- i phi.alt) z \)$. Consequently its marked single-end angles are exactly $y^0 + phi.alt upright(bold(1))$. The factor $h$ is unchanged by rotating either tuple separately. Thus the rotation average in the unperturbed data is
  $ e^(- lambda p') h \( x^0 \, y^0 \) \( Pi W_(-) \) \( p' \, x^0 \, y^0 \) \, $
  whose absolute value is at most $C \( 1 + q \) rho^(lambda + 1) = C \( 1 + q \) rho^(9 \/ 4)$ by (4.8). Add the uniform error (5.8). Any $0 < sigma_2 < 1 \/ 4$ is then admissible, after increasing the constant and restricting to sufficiently small $rho$. Rotating the outer end gives the same projection, by simultaneous rotation invariance.
  Every estimate was obtained with constants depending only on the separation and scale conditions, not on boundary smoothness or mark separation. It can therefore be applied directly to the continuum function $T$ evaluated on the conformal data of the Jordan cycles approximating an explored domain. Under admissible convergence, Proposition 12 separately identifies the limit of the discrete transmission probabilities with that continuum function; no reflection across a physically nonsimple limiting bank is being asserted. ◻
]

== 6 Uniform transfer of signed connection states <tr:section>

The estimates of the preceding section concern annuli with four prescribed switches at each end. A discrete crossing test, however, can present an arbitrarily complicated connection state to an annulus. Moreover, the outside of that annulus need not have a scaling limit. We now prove operator estimates that are uniform over these states and outside data. The important distinction is between the two annular ends, where arbitrary data are allowed, and an independent region between them, where the scaling-limit arguments take place.

Throughout this section the Poisson intensity is one, the center of all circles is fixed, and $lambda = 5 \/ 4$. We use the localization and mesh-first arm estimates recalled above from [10] Sections 2–3. The constants implicit in choices of collars and buffers are fixed once and for all.

=== 6.1 Cuts, connection states, and transfer operators <cuts-connection-states-and-transfer-operators>

Fix a sufficiently small constant $eta > 0$. A #emph[seam at radius $r$] consists of the marked Poisson process in the collar

$ \( 1 - eta \) r < \| z \| < \( 1 + eta \) r \, $

together with auxiliary randomness used to select a graph cycle. A local occupancy test, denoted $G_r$, ensures that the graph and the vertex stars through a narrower collar are determined by these variables and that their diameters are smaller than a fixed small fraction of $eta r$. We choose the test and the narrower collar with buffers at both ends, so that

#[#set math.equation(numbering: n => "(6.1)")
 $ bb(P) \( G_r^c \) lt.eq C e^(- c r^2) . $ <tr:screen>]

On $G_r$ choose a simple site cycle $Gamma_r$ surrounding the center, inside the narrower collar. The choice uses the geometry but not the colors. The test and the choice are rotation equivariant; an independent uniform angular axis may be included among the seam variables to break ties.

For completeness, such a screen can be obtained by requiring that every point in a closed intermediate collar be within a sufficiently small distance, proportional to $r$, of a nucleus in the larger collar. This covering-distance condition is rotation invariant and has the exponential failure bound in (6.1). Following a circle in the site triangulation and deleting loops gives the required cycle. Buffers and the same covering condition determine all its vertex stars. A nucleus beyond either extremity of the collar cannot affect the graph on the other side: its cell would have to pass through the screened intermediate collar, where all cells are small. Consequently the graph on each side of $Gamma_r$, including its attachments to the cycle, can be read from the seam and the Poisson variables on that side. Conditional on the seam, the variables used on the two sides are independent.

The colors on $Gamma_r$ determine an even number of switches. An inside connection state is a noncrossing pairing of those switches by interface strands in the disk on the inside. The pairing, together with the monochromatic runs on the cycle, determines all boundary connectivity. Closed interface loops carry no information and are not stored. We allow every formal noncrossing pairing as a state, whether or not it is realized by a particular inside graph. Such pairings respect the alternating color convention: the endpoints of each pair have opposite parity in cyclic order. Gluing a pairing to the annular strands is therefore defined without a realizability restriction.

Write $Sigma_r$ for the seam variables and $cal(S)_r \( Sigma_r \)$ for this finite state set on $G_r$. A #emph[message] is a measurable field of signed measures $v_(Sigma_r)$ on $cal(S)_r \( Sigma_r \)$ such that

$ v_(Sigma_r) \( cal(S)_r \( Sigma_r \) \) = 0 \, #h(2em) v_(Sigma_r) = 0 med upright("on ") G_r^c . $

Its norm is

#[#set math.equation(numbering: n => "(6.2)")
 $ parallel v parallel_r = "ess sup"_(Sigma_r) parallel v_(Sigma_r) parallel_(upright("TV")) . $ <tr:message-norm>]

Here total variation is the sum of the absolute point masses, so that a difference of probability measures has norm at most two. Finite state sets can be numbered measurably; the bounded fields of zero-mass measures, modulo seam-law null sets, form a Banach space $cal(B)_r$.

If the collars at radii $r < s$ are disjoint, gluing through the intervening annulus defines a linear map

$ M_(r \, s) : cal(B)_r arrow.r cal(B)_s . $

More explicitly, conditional on $Sigma_s$, integrate $Sigma_r$ and the intervening marked process, impose both seam successes, and push $v_(Sigma_r)$ through the annular strands. Closed loops have weight one. For every fixed realization, this push is a map between finite state spaces and contracts total variation. Its mass remains zero. The success restrictions are indicators in this integral, not a conditioning followed by renormalization. Only the output seam is conditioned on in the definition of its message field. Intermediate successful seams therefore give exactly the composition of these operators, with the corresponding success indicators imposed. This construction does not assert independence for unrestricted Voronoi events in neighboring regions; independence is used only for the underlying marked Poisson variables separated by the specified buffers.

Rotation and global color reversal act on seam variables and states. A message is #emph[isotropic] if it is fixed by the rotation action and #emph[even] if it is fixed by color reversal. Both symmetries are exact for $M_(r \, s)$, since the screens and cycle choices have those symmetries.

#thm([Proposition 6.1.])[
  (Fixed-ratio transfer).  #emph[There are $delta > 0$ and $C < oo$ with the following property. For every sufficiently large integer $n$, set $L = 2^n$. There is a threshold $r_0 \( L \)$ such that, for $r gt.eq r_0 \( L \)$, the transfer $M = M_(r \, L r)$ satisfies 
#[#set math.equation(numbering: n => "(6.3)")
 $ parallel M parallel & lt.eq C L^(- lambda) \,\
M & = M_1 + E \, #h(2em) "rank" M_1 lt.eq 1 \, #h(2em) parallel E parallel lt.eq C L^(- lambda - delta) \,\
parallel M \|_(cal(B)_r^(upright(e v e n \, i s o))) parallel & lt.eq C L^(- 2 - delta) . $ <tr:block-size>]

 The constants $C \, delta$ do not depend on $L$ or $r$. Every norm in the conclusion includes the essential supremum over successful output seams, including their colors. The rank-one operator may depend on $r$ and $L$.]
] <tr:block>

The reduction has a simple mechanism. Six surviving interfaces already cost a power strictly greater than two, while four interfaces leave just one signed connection coordinate. We isolate an independent region in which to obtain four-tip boundaries, verify their convergence, and then apply the separated-end estimates to that coordinate. Summing over the first four-tip scales gives both the rank-one approximation and the color–rotation cancellation.

=== 6.2 An independent region for the limiting argument <an-independent-region-for-the-limiting-argument>

Fix $L$ for the moment and rescale by $r$. Thus the mesh tends to zero as $r arrow.r oo$, whereas all radii used in the present argument lie in a fixed finite range. Choose auxiliary starting cycles near radii $8 r$ and $L r \/ 8$. Their geometry is determined in small collars separated from both original seams. From either starting cycle we shall explore towards the middle of the annulus, stopping at one of finitely many #emph[barriers]: color-independent site cycles approximating specified concentric circles in curve order. Their colors remain unread until the exploration proceeds past them. A #emph[stopping circle] means the limiting circle of the current barrier. All cycles may be made chord free on the side approached by the exploration.

We impose auxiliary occupancy tests in this intervening region. Unlike the actual seam tests, these may require a relative mesh tending to zero: use covering distances that tend slowly to zero in rescaled coordinates. For the fixed finite collection of collars under consideration, their total failure probability is $o \( 1 \)$. Their supports are separated from the input and output seams. On success, geometry around the two starting cycles and throughout the region between them agrees with the geometry of a full-plane Poisson sample, obtained by adjoining independent variables outside that region. In particular, all these $o \( 1 \)$ failure bounds hold uniformly conditional on either or both original seam variables.

There is also a local version of this construction. An end experiment stopped at a barrier uses only variables from a buffer just before its starting cycle through a small fixed-factor enlargement past that barrier, together with the variables between its starting cycle and its own seam. Its localization tests stop at that enlargement. If two barriers are separated by a sufficiently large fixed factor, the supports for the two end experiments are disjoint. Extra tests across the middle can then be added when evaluating an actual annular transmission. Deleting those extra tests from an integral with bounded weights changes it by $o \( 1 \)$, uniformly in the original seams. It is only after this deletion that the two end integrals are factored. Figure 2 records the radial order and the gaps between the supports of the two end experiments.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, -0.195), (0.3696, 0.195), fill: rgb("#e0e0e0"), stroke: none)
  rect((10.19, -0.195), (10.56, 0.195), fill: rgb("#e0e0e0"), stroke: none)
  rect((1.364, -0.135), (3.564, 0.135), fill: rgb("#f2f2f2"), stroke: none)
  rect((6.996, -0.135), (9.196, 0.135), fill: rgb("#f2f2f2"), stroke: none)
  line((0, 0), (10.56, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.176, -0.105), (0.176, 0.105), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.76, -0.105), (1.76, 0.105), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.256, -0.105), (3.256, 0.105), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.304, -0.105), (7.304, 0.105), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.8, -0.105), (8.8, 0.105), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((10.38, -0.105), (10.38, 0.105), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.176, -0.315), [#text(size: 9pt)[input#linebreak()seam]], anchor: "north", padding: 0.1176cm)
  content((1.76, -0.315), [#text(size: 9pt)[inner start#linebreak()$8r$]], anchor: "north", padding: 0.1176cm)
  content((3.256, -0.315), [#text(size: 9pt)[barrier#linebreak()$a$]], anchor: "north", padding: 0.1176cm)
  content((7.304, -0.315), [#text(size: 9pt)[barrier#linebreak()$b$]], anchor: "north", padding: 0.1176cm)
  content((8.8, -0.315), [#text(size: 9pt)[outer start#linebreak()$"Lr""/"8$]], anchor: "north", padding: 0.1176cm)
  content((10.38, -0.315), [#text(size: 9pt)[output#linebreak()seam]], anchor: "north", padding: 0.1176cm)
  line((1.76, 0.4875), (3.256, 0.4875), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((8.8, 0.4875), (7.304, 0.4875), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.28, 0.54), [#text(size: 9pt)[unexplored annulus]])
  line((1.056, 1.125), (9.504, 1.125), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((5.28, 1.125), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[independent Poisson region]]])])
})],
  caption: [Figure 2: The radial order of two end experiments with separated barriers, on a schematic logarithmic scale. Explorations start inside the transfer block, independently of its two seams. Each shaded end support extends a little beyond its last barrier; the gap between those supports permits their independent integration. The original seam screens remain imposed throughout. ],
) <tr:figure>

The following elementary observation is the uniformity mechanism used below. Its purpose is to avoid any assertion of a uniform scaling limit conditional on an atypical explored shape.

#thm([Lemma 6.2.])[
  (Domination before conditioning on end shapes).  #emph[Suppose a contribution to $M_(r \, L r) v$ is expressed, after exploring from the auxiliary starting cycles, as an integral of an inner scalar coefficient, a bounded middle test, and an outer signed state measure. If the middle test is replaced with absolute error $F gt.eq 0$, where $F$ depends only on the independent region just described, then the error in output norm is at most 
#[#set math.equation(numbering: n => "(6.4)")
 $ C parallel v parallel_r thin bb(E)_(upright("core")) F + o \( 1 \) parallel v parallel_r . $ <tr:domination-bound>]

 The same bound applies to discarding an event there, by taking $F$ to be its indicator. The expectation is under the unweighted full-plane comparison law; the bound is uniform over successful output seams.]
] <tr:domination>

#proof[
  For a fixed realization, pushing $v_(Sigma_r)$ to any intermediate state set contracts total variation. When that set has two states, its zero-mass image has the form $alpha \( delta_B - delta_W \)$, with $\| alpha \| lt.eq parallel v parallel_r$. Pushing the two-state difference through the other end gives a signed measure $q$ with $parallel q parallel_(upright("TV")) lt.eq 2$. Hence the pointwise norm of the replacement error is bounded by $2 parallel v parallel_r F$. The same argument, summing absolute masses before a two-state reduction, handles discarded events. No regularity of the dependence of $alpha$ or $q$ on the seam data is needed.
  On the auxiliary localization successes, $F$ is a function of marked Poisson variables independent of both original seams and has the stated full-plane comparison law. Integrate the pointwise bound conditional on the output seam. Auxiliary failures contribute the final $o \( 1 \)$ term, also uniformly, because their supports are off the original seams. The seam success indicators themselves are not deleted. ◻
]

=== 6.3 Exploration up to the first four-tip frontier <exploration-up-to-the-first-four-tip-frontier>

First push the input message from its original seam to the inner auxiliary starting cycle, using the marked variables in the intervening attachment region. The subsequent exploration uses the colored starting cycle and the variables towards its barrier; it never consults an attached cap state. Dependence on the input message stays in the pushed signed coefficients. At the outer end the corresponding attachment operation pushes states from its auxiliary cycle towards the original output seam.

At the inner auxiliary cycle, reveal its colors and trace every switch into the annulus. A wall is followed until it pairs with another traced wall or until its next color query would read a vertex on the current barrier. In the second case, stop before that query. The stopped wall ends at a switch edge whose next triangle has its opposite vertex on the barrier. No barrier colors have been read. The analogous outer experiment is directed inwards. Increasing the inner barrier radius by a factor two, or decreasing the outer barrier radius by a factor two, continues the same wall system. Tracing all walls in a previously colored sample shows that the outcome does not depend on their tracing order.

We call the unpaired stopped wall ends the #emph[surviving tips]. Their number is even and decreases as the barrier is advanced. The first barrier with at most four surviving tips will be the end’s reduction barrier. A reduction to zero or two tips kills every zero-mass message. A reduction to exactly four leaves precisely two cap states. We next verify both this assertion and the geometric properties needed for the annular transmission limit.

#thm([Lemma 6.3.])[
  (Frontier and arm counts).  #emph[For either end experiment, outside an event whose probability tends to zero as the permitted separation of tips tends to zero, mesh first, the tips at each of finitely many fixed-scale barriers have distinct limiting positions. The boundary facing the unqueried barrier is a simple site cycle whose switches are exactly these tips. In particular:]
  + #emph[If there are zero or two tips, the induced map on zero-mass connection-state measures is zero.]
  + #emph[If there are at least six tips, six disjoint bulk arms cross the region from the starting cycle to the barrier, after fixed-factor crops at the two ends.]
  #emph[All probabilistic assertions are made under the unweighted exploration law, before conditioning on a particular history.]
] <tr:frontier>

#proof[
  First consider two tips approaching the same point of the barrier. Use a graph disk patch with its base on the barrier and a half-annulus on the exploration side. Extend each stopped wall through its last triangle to the base, only for this geometric argument; no barrier color is queried. The two wall fingers give two proper traversals of the half-annulus, with fixed margins at its two semicircular ends. Following the sites on their banks gives three disjoint free arms in the sectors on the two exterior sides and between the fingers. These sites are on the exploration side, not on the barrier. Short spokes through successive wall triangles keep each bank in its sector. The base through the tips prevents an exterior bank from escaping around a finger’s end. Cropping the last mesh steps gives the same count when two stopping triangles share a barrier vertex.
  This is the free-bank-shadow count for two traversals in the boundary argument of [10] Section 3. The local boundary three-arm exponent is strictly greater than one. Covering the barrier by $O \( s^(- 1) \)$ patches of radius $s$ therefore excludes colliding tips as $s arrow.b 0$, mesh first. The BK inequality applied to the free shadows also makes the number of fixed-scale traversals tight.
  For the frontier assertion, fill the starting side of the starting cycle with a disk, using the sphere for the outside experiment. Attach the queried triangles along the explored bands and add all edges between revealed vertices. The resulting graph is two-connected: attaching a triangle along an existing edge preserves two-connectivity, as does adding an edge between existing vertices. Thus the boundary of its face containing the unqueried barrier is a simple cycle. The barrier and its paths towards the unexplored middle remain in that face. In particular each stopping triangle is incident with this same face on its unread side.
  There is a useful invariant: every revealed vertex has a revealed path of its own color to the starting cycle. It holds initially, and a newly queried triangle vertex has the color of one endpoint of the incoming heterochromatic edge, extending such a path. Thus an added heterochromatic edge between revealed vertices cannot belong to an unstarted wall. Such a wall would either close in the annulus or return to the barrier without visiting the starting cycle; in either case it would separate one bank from that cycle, contradicting its revealed same-color path. Every heterochromatic revealed-vertex edge therefore belongs to the traced wall system.
  To identify the colors along the frontier, extend the stopped walls to the barrier as above. These proper arcs, together with the walls that paired back to the starting cycle, divide the explored collar into regions with their consistent bank colors. Every revealed vertex is either a starting-cycle vertex or was queried in a wall triangle. Its color agrees with the relevant bank. An added edge cannot cross one of these wall arcs, and the preceding invariant excludes any untraced switch there. Previously crossed switch edges have triangles on both sides in the revealed bands. The only switches exposed to the remaining face are consequently the surviving stopping edges.
  With zero or two switches there is just one noncrossing cap pairing. Every input state gives that same pairing, so a zero-mass difference vanishes. With six or more surviving wall fingers, their bank shadows give six disjoint site arms in successive sectors between the starting cycle and the barrier. Fixed-factor crops remove the two ends, where different shadows could otherwise meet. The arbitrary-color six-arm bound is applicable, so no particular numbering or color order of the six arms is required. ◻
]

The next lemma verifies the non-Jordan boundary issue rather than presuming that scalar Cardy convergence applies to a random annulus.

#thm([Lemma 6.4.])[
  (Admissibility of four-tip frontiers).  #emph[At a fixed barrier, restrict the unweighted exploration law to the event of exactly four surviving tips. Along subsequences with good geometry as in [10] Section 2, the four monochromatic frontier arcs are tight in curve order. In every coupled subsequential limit, after constant pauses are erased, each arc is simple and meets the stopping circle only at its two prescribed endpoints. The four endpoints are distinct.]
  #emph[For two such experiments ending at well-separated barriers, their residual annulus satisfies the admissibility conditions of Proposition 12. If $t_r$ is the discrete through-transmission probability conditional on the complete geometry and the two end histories, and $T_r$ is the continuum transmission function evaluated on its actual conformal data, then, for fixed $L$ and the fixed finite list of barriers, 
#[#set math.equation(numbering: n => "(6.5)")
 $ bb(E)_(upright("core")) #h(-0.16667em) [bold(1)_({ upright("four tips at both ends") }) \| t_r - T_r \|] = o \( 1 \) . $ <tr:mean-limit>]

 The expectation concerns unweighted histories, not a uniform conditional estimate for all possible histories.]
] <tr:admissible>

#proof[
  The BK and successive-excursion argument gives tightness of the four frontier arcs. Indeed repeated annular traversals provide disjoint free arms; all sites used, including those on the auxiliary starting cycle, have their original fair colors. This is applied first at fixed radii and then at successively smaller excursion scales. The contact arguments below are the face-boundary arguments in [10] Section 3; we give the details relevant to the present frontier.
  Every frontier vertex off the starting cycle belongs to a revealed wall band. On its revealed side it has an opposite-colored neighbor with a bank path back to the starting cycle. Consequently a visit of a frontier arc to the stopping circle other than at its designated endpoint, with a positive excursion on both sides of the visit, gives three free arms in a half-patch: two along the arc and one along the opposite bank. The same argument excludes an intermediate return to an endpoint. The boundary three-arm exponent and a covering of the circle exclude all such visits. A nonconstant interval contained in the circle is excluded by the one-arm bound at a countable dense set of circle points. Constant pauses can be removed from the parametrization. Distinctness of the four tips follows from Lemma 22.
  Consider next a self-return of one monochromatic frontier arc at a point away from the starting and stopping circles. Separate the two visits by a fixed positive excursion scale. In a smaller annulus around the proposed contact, the arc supplies four proper traversals. Its opposite bank paths lie on the revealed side of the frontier cycle. They may all be joined through the starting cycle when making the planar separation argument. This joining set need not be monochromatic at the starting cycle: the working annulus misses that cycle, and within the working annulus every part of the joining set is genuinely of the opposite color.
  At least two complementary sectors have a frontier traversal on their boundary whose revealed side faces the sector. Each such sector contains an opposite-colored longitudinal crossing. To verify this assertion, choose transverse cuts at intermediate scales with margins, leaving both ends of that frontier traversal beyond the cuts. If the joined neighbor set did not cross the sector longitudinally, planar duality would provide a transverse crosscut avoiding it. Start this crosscut from that frontier traversal and stop at its first subsequent hit of the frontier cycle. In the disk on the revealed side, the two traversal ends and the two crosscut ends alternate along the frontier. The crosscut therefore separates their neighbor spokes, contradicting the joined neighbor set, which lies on the revealed side and avoids the crosscut.
  The argument remains valid when the traversals backtrack. Choose the transverse cuts along intermediate graph cycles, or apply Hex duality with such a cycle temporarily wired in the sector. Two disjoint cuts bound a quadrilateral whose side arcs belong to the chosen traversals and whose interior avoids those whole proper traversals, not merely the selected side subarcs. Thus the crosscut’s first subsequent frontier hit lies outside the whole traversal from which it started, so the alternating boundary order used above persists under backtracking. The crosscut is in the quadrilateral’s interior, whereas the end spokes are beyond the cuts. They thus avoid the crosscut even if other portions of the frontier enter the sector. Cropping the margins leaves two disjoint opposite-colored arms in different sectors, in addition to the four arms along the monochromatic arc. This gives six disjoint bulk arms. The bulk exponent strictly greater than two excludes these contacts by a covering argument. At a self-contact on the starting circle, the four arc traversals alone suffice: the arbitrary-color four-arm exponent is strictly greater than one, and the possible contact locations lie on a fixed circle.
  All these exclusions are made for distinct visits with fixed positive excursion scales before those scales decrease. Countably many scales and finite ball coverings make the assertions simultaneous. They bound joint probabilities with the four-tip event; no division by the probability of a rare history is involved.
  We now identify the remaining domain; see Figure 3. Cut along the barrier, using the four short incidences from the tip edges through their terminal triangles. Between consecutive tips, the frontier arc and its corresponding barrier interval bound a lobe polygon. The four lobes are attached over open intervals to the untouched region on the middle side of the barrier. Each lobe converges in order to a Jordan lobe, because its frontier arc is simple and meets the barrier only at its endpoints. Different lobe boundaries may touch in physical projection; their interiors remain disjoint, and their distinct accesses are retained. With two well-separated barriers there is a fixed open annular region between the ends.
  We verify that adjoining the lobes still gives an annulus, even when their boundaries touch. On either side of this open annular region, start with the closed disk bounded by the corresponding stopping circle, using the sphere for the outer side. The complementary set on that side is obtained by removing the lobe interiors and their open attachment intervals. Each lobe’s free frontier arc remains in this complement: it cannot enter another lobe’s interior, since their Jordan interiors are disjoint, and it meets the stopping circle only at its own endpoints, never on another open attachment. Connect a point of the remaining closed set to the preserved starting-side region by a path in the closed disk, with its interior off the stopping circle. Whenever the path enters a lobe, replace the portion from its first entry to its last exit by the intervening subarc of that lobe’s free frontier. The entry and exit lie on this free arc. The replacement avoids every lobe interior and every open attachment, so it cannot undo previous replacements. There are only four lobes; after finitely many replacements the path is wholly in the complementary set. Thus each side has a connected complement. The two such nondegenerate continua are separated by the open annular region and exhaust the complement of the residual domain. The domain is therefore doubly connected, with its two boundary components physically apart.
  Lemma 9 now gives uniform convergence of the closed-annulus parametrizations with their prime-end order. The boundary traversal consists of finitely many individually simple arcs. These are exactly the hypotheses required by Proposition 12.
  Finally extract, from any sequence of scales, a further sequence on which the localized full-plane geometries are good in the sense of [10] Section 2. Conditional on those geometries, couple convergent subsequences of the frontier histories just described. All unqueried colors in the residual face remain independent and fair. Apply Proposition 12 path by path to the converging graph annuli. The continuum function on the actual approximating conformal data also converges, by its continuity. Bounded convergence proves (6.5) along the further sequence and hence along the original sequence. Unused colors on the removed sides of the frontiers may be revealed or integrated in their own end variables; they do not affect this argument. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0.3, 0), radius: 2.65, fill: rgb("#ebebff"), stroke: none)
  merge-path({bezier((2.3, 0), (0.3, 2), (1.55, 0.25), (0.55, 1.25)); bezier((0.3, 2), (-1.7, 0), (0.05, 1.25), (-0.95, 0.25)); bezier((-1.7, 0), (0.3, -2), (-0.95, -0.25), (0.05, -1.25))}, close: true, fill: rgb("#e8e8e8"), stroke: none)
  circle((0.3, 0), radius: 2, stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", miter-limit: 10, dash: "densely-dashed"))
  bezier((2.3, 0), (0.3, 2), (1.55, 0.25), (0.55, 1.25), stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  bezier((0.3, 2), (-1.7, 0), (0.05, 1.25), (-0.95, 0.25), stroke: (paint: rgb("#b9b9b9"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  bezier((-1.7, 0), (0.3, -2), (-0.95, -0.25), (0.05, -1.25), stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  bezier((0.3, -2), (2.3, 0), (0.55, -1.25), (1.55, -0.25), stroke: (paint: rgb("#b9b9b9"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  circle((2.3, 0), radius: 0.07056, fill: black, stroke: none)
  circle((0.3, 2), radius: 0.07056, fill: black, stroke: none)
  circle((-1.7, 0), radius: 0.07056, fill: black, stroke: none)
  circle((0.3, -2), radius: 0.07056, fill: black, stroke: none)
  circle((0.3, 0), radius: 0.58, stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, cap: "round", miter-limit: 10))
  content((0.3, 0), [#text(size: 7pt)[starting#linebreak()side]])
  content((1.45, 1.15), [#text(size: 8pt)[$L_1$]])
  content((-0.85, 1.15), [#text(size: 8pt)[$L_2$]])
  content((-0.85, -1.15), [#text(size: 8pt)[$L_3$]])
  content((1.45, -1.15), [#text(size: 8pt)[$L_4$]])
  content((0.3, 2.97), [#text(size: 8pt)[unqueried annular back]])
  line((1.08, 2.87), (1.45, 2.18), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.1, 0.95), [#text(size: 8pt)[four-tip#linebreak()frontier]], anchor: "west", padding: 0.1176cm)
  line((3.08, 0.77), (1.73, 0.3), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.1, -0.8), [#text(size: 8pt)[open attachment#linebreak()interval]], anchor: "west", padding: 0.1176cm)
  line((3.08, -0.7), (2.04, -0.97), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0.3, -3.05), [#text(size: 8pt)[Dashed circle: stopping barrier.#linebreak()Its open intervals lie inside the glued domain.]])
  content((8.85, 2.48), [#text(size: 8pt)[Two distinct banks at a contact]])
  merge-path({line((7.3, 1.9), (10.4, 1.9), (10.4, 1.05)); bezier((10.4, 1.05), (8.85, 0.2), (9.7, 1.05), (9.35, 0.2)); bezier((8.85, 0.2), (7.3, 1.05), (8.35, 0.2), (8, 1.05))}, close: true, fill: rgb("#ebebff"), stroke: none)
  merge-path({line((7.3, -1.5), (10.4, -1.5), (10.4, -0.65)); bezier((10.4, -0.65), (8.85, 0.2), (9.7, -0.65), (9.35, 0.2)); bezier((8.85, 0.2), (7.3, -0.65), (8.35, 0.2), (8, -0.65))}, close: true, fill: rgb("#ebebff"), stroke: none)
  bezier((7.3, 1.05), (8.85, 0.2), (8, 1.05), (8.35, 0.2), stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  bezier((8.85, 0.2), (10.4, 1.05), (9.35, 0.2), (9.7, 1.05), stroke: (thickness: 1.2pt, cap: "round", miter-limit: 10))
  bezier((7.3, -0.65), (8.85, 0.2), (8, -0.65), (8.35, 0.2), stroke: (paint: rgb("#b9b9b9"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  bezier((8.85, 0.2), (10.4, -0.65), (9.35, 0.2), (9.7, -0.65), stroke: (paint: rgb("#b9b9b9"), thickness: 1.2pt, cap: "round", miter-limit: 10))
  circle((8.85, 0.2), radius: 0.07761, fill: black, stroke: none)
  content((8.85, 1.5), [#text(size: 8pt)[first access]])
  content((8.85, -1.1), [#text(size: 8pt)[second access]])
  line((8.85, 1.16), (8.85, 0.4), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((8.85, -0.76), (8.85, 0), stroke: (thickness: 0.4pt, cap: "round", miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((8.85, -2.1), [#text(size: 8pt)[The contact is boundary,#linebreak()not a gluing interval.]])
})],
  caption: [Figure 3: The decomposition at an inner four-tip frontier. The four monochromatic frontier arcs, drawn alternately black and gray, bound Jordan lobes $L_1 \, dots.h \, L_4$ with the stopping barrier. Each lobe is attached to the untouched annular back along an open barrier interval; the common shading denotes the resulting unqueried domain. The starting side remains in the complement. At the other end the construction is reversed. The inset records two accesses at a possible contact between different banks: the contact is not added to the fluid and does not join the accesses. All curves are schematic. Actual banks may be rough and may touch each other, although each individual frontier arc is simple. ],
) <fig:frontier-lobes>

The probabilistic conclusions of the last two lemmas all concern the independent region. Lemma 21 therefore makes their discarded probabilities and the error in (6.5) uniform for the operator norm, even when a message depends arbitrarily on the seam and on its attachment information. This is the reason the explorations start at auxiliary cycles rather than at the original seams.

=== 6.4 The first-reduction decomposition <the-first-reduction-decomposition>

Index the inner barriers by radii

$ a_j = 8 dot.op 2^j r \, #h(2em) j = 1 \, 2 \, dots.h \, $

and the outer barriers by

$ b_k = 2^(- k) L r \/ 8 \, #h(2em) k = 1 \, 2 \, dots.h . $

Each list is finite, ending before the opposite starting region. Fix a large integer $d$ so that

#[#set math.equation(numbering: n => "(6.6)")
 $ j + k lt.eq n - d $ <tr:used-pairs>]

ensures disjoint buffered end supports and sufficient separation for Proposition 19. A #emph[used pair] is a pair satisfying (6.6) at which the two experiments first reduce to exactly four tips. A first reduction to fewer than four contributes zero by Lemma 22.

Choose $tau > 0$ smaller than the excess of the mesh-first six-arm exponent over two. Let $rho_j^(upright("in"))$ and $rho_k^(upright("out"))$ be the subprobability laws of the corresponding first four-tip histories, including local screens and the variables attaching each history to its original seam. The inner law integrates the input seam. All outer laws and outer integrals below are conditional on the fixed output seam $Sigma_(L r)$; in particular they define fields over that seam, not averages of it. The dependence on seam variables in the attachments will be kept in the scalar and signed measure factors below, rather than in any assertion about typical shapes. We first bound the masses of these unweighted history laws; pointwise bounded message factors will then preserve the bounds up to constants.

#thm([Lemma 6.5.])[
  (First-reduction tails).  #emph[For fixed $L$, the end-history subprobability masses satisfy, in the mesh-first limit, 
#[#set math.equation(numbering: n => "(6.7)")
 $ parallel rho_j^(upright("in")) parallel_(upright("TV")) "ess sup"_(Sigma_(L r)) parallel rho_k^(upright("out")) \( dot.op divides Sigma_(L r) \) parallel_(upright("TV")) lt.eq C 2^(- \( 2 + tau \) j) 2^(- \( 2 + tau \) k) + o \( 1 \) $ <tr:history-weight>]

 for each used pair $\( j \, k \)$. Consequently, after inserting arbitrary middle tests of modulus at most one, the same bound up to a constant holds for the corresponding operator contribution on inputs of norm at most one. The part of the transfer not represented by used pairs has norm at most 
#[#set math.equation(numbering: n => "(6.8)")
 $ C \( n + 1 \)^2 L^(- 2 - tau) + o \( 1 \) . $ <tr:unused>]

 Both estimates are uniform for input messages of norm at most one and for successful output seams.]
] <tr:tails>

#proof[
  Before the first reduction at level $j$, there are at least six tips at the preceding level. Lemma 22 then requires six arms from the starting region to that level. The mesh-first six-arm bound gives $C 2^(- \( 2 + tau \) j)$, with a changed constant for the first few levels. The same statement holds at the outer end, uniformly in its original seam: the necessary six-arm event is read in the independent region, while attachment variables and success indicators have total conditional mass at most one. Multiplying the two separate mass bounds proves (6.7). For used pairs the physical end experiments also have disjoint buffered supports, so their joint law is the product used in the operator contribution. Arbitrary input weights are bounded pointwise by their total variation, as in Lemma 21; the number of switches on the input seam does not enter the estimate.
  To bound the remainder, run the inner exploration to its longest allowed level. If it never reduces, it has paid a six-arm probability over $n - O \( 1 \)$ dyadic levels. Otherwise let $j$ be its first reduction level. If the reduction has fewer than four tips, its contribution is zero. In the remaining case run the outer experiment as far as (6.6) allows, possibly through no additional level. If it does not reduce in time, the two experiments together have paid six-arm probabilities over at least $n - O \( 1 \)$ levels. Their buffered supports remain disjoint. Summing the resulting bounds over the at most $O \( \( n + 1 \)^2 \)$ possible terminal levels proves (6.8). The finitely many auxiliary localization failures and near-coincidences of tips cost $o \( 1 \)$ for fixed $L$, uniformly by Lemma 21. ◻
]

At a four-tip inner frontier let $B$ and $W$ denote respectively the black-join and white-join cap states. The pushed input message is

#[#set math.equation(numbering: n => "(6.9)")
 $ alpha_j \( v \; H_i \) \( delta_B - delta_W \) \, #h(2em) \| alpha_j \( v \; H_i \) \| lt.eq parallel v parallel_r \, $ <tr:inner-coefficient>]

where $H_i$ includes the inner history and its attachment to the input seam. The coefficient is linear in $v$. Similarly, pushing $delta_B - delta_W$ from an outer four-tip frontier to the output seam gives a signed measure $q_k \( H_o \)$ satisfying

#[#set math.equation(numbering: n => "(6.10)")
 $ parallel q_k \( H_o \) parallel_(upright("TV")) lt.eq 2 . $ <tr:outer-coefficient>]

Lemma 7 says that the residual annulus sends the first cap difference to the second multiplied by its through-transmission probability. Thus the used-pair contribution has the form

#[#set math.equation(numbering: n => "(6.11)")
 $ integral alpha_j \( v \; H_i \) thin bb(E)_(upright("mid")) #h(-0.16667em) [bold(1)_(G_(upright("aux"))) t_r divides H_i \, H_o] q_k \( H_o \) thin d rho_j^(upright("in")) \( H_i \) d rho_k^(upright("out")) \( H_o \) \, $ <tr:integral>]

where $G_(upright("aux"))$ denotes the additional middle screens and $bb(E)_(upright("mid"))$ integrates the middle Poisson geometry conditional on the two end histories. The probability $t_r$ already integrates the fresh colors in the remaining face, conditional on all geometry. The end laws are a product because their buffered supports are disjoint. The conditional factor in square brackets still couples the ends, and must not yet be factored.

On the auxiliary localization successes, the residual frontiers and both $t_r$ and $T_r$ depend only on the auxiliary-cycle explorations and the intervening independent geometry. Attachments to the original seams enter only the signed coefficients. The error $\| t_r - T_r \|$ thus has exactly the independent-region measurability required by Lemma 21.

By Lemmas 23 and 21, replace $t_r$ by $T_r$ in (6.11) with $o \( 1 \) parallel v parallel_r$ error in output norm. For fixed $n$, this error may be summed over all used pairs. The frontiers themselves are still the actual graph cycles. Their single-end conformal maps and capacities can therefore be used directly in Proposition 19, without asserting smoothness at contacts of a limiting boundary.

=== 6.5 Rank-one factorization and signed cancellation <rank-one-factorization-and-signed-cancellation>

We now complete Proposition 20. An inner frontier at level $j$ surrounds the center, stays inside radius comparable to $a_j$, and reaches that radius at its tips. Its logarithmic capacity $l_i$ is therefore comparable to $a_j$. An outer frontier at level $k$ surrounds a disk of radius comparable to $b_k$ and has a point at distance comparable to $b_k$; its conformal radius $l_o$ is comparable to $b_k$. Write $y^0$ and $x^0$ for their single-end switch angles. By (5.6),

#[#set math.equation(numbering: n => "(6.12)")
 $ T_r \( H_i \, H_o \) = K thin U \( H_i \) V \( H_o \) + O #scale(x: 120%, y: 120%)[\(] \( a_j \/ b_k \)^(lambda + sigma_1) #scale(x: 120%, y: 120%)[\)] \, $ <tr:separated-formula>]

where

$ U \( H_i \) = l_i^lambda J \( y^0 \)^(1 \/ 3) \, #h(2em) V \( H_o \) = l_o^(- lambda) J \( x^0 \)^(1 \/ 3) . $

These factors depend on their own end histories only, and

#[#set math.equation(numbering: n => "(6.13)")
 $ \| U \( H_i \) V \( H_o \) \| lt.eq C L^(- lambda) 2^(lambda \( j + k \)) . $ <tr:factor-size>]

For the separated leading term, delete the extra middle screens. This changes the integral by $o \( 1 \) parallel v parallel_r$ for fixed $L$: the screens use independent interior variables and fail with probability $o \( 1 \)$, while all weights at these fixed scales are bounded. Keep the original seam screens and the local end screens. The remaining end experiments now use disjoint Poisson supports for every used pair. Define the scalar functionals and output messages

$ u_j \( v \) = integral alpha_j \( v \; H_i \) U \( H_i \) thin d rho_j^(upright("in")) \( H_i \) \, #h(2em) v_k = integral V \( H_o \) q_k \( H_o \) thin d rho_k^(upright("out")) \( H_o \) . $

The leading contribution of that pair is exactly $K u_j \( v \) v_k$. The same definitions make sense separately for every level in each finite list, whether or not a pair of levels has disjoint supports. For such additional pairs we use the product of the two separate integrals, not a claim about simultaneous experiments.

Set

#[#set math.equation(numbering: n => "(6.14)")
 $ M_1 v = K (sum_j u_j \( v \)) (sum_k v_k) . $ <tr:rank-one-definition>]

This operator has rank at most one. By the separate six-arm bounds and (6.13), its norm is at most

#[#set math.equation(numbering: n => "(6.15)")
 $ C L^(- lambda) sum_(j \, k) 2^(- \( 2 + tau - lambda \) \( j + k \)) lt.eq C L^(- lambda) . $ <tr:rank-one-size>]

The extra product terms introduced by allowing $j + k > n - d$ have norm at most

#[#set math.equation(numbering: n => "(6.16)")
 $ C L^(- lambda) sum_(j + k > n - d) 2^(- \( 2 + tau - lambda \) \( j + k \)) lt.eq C \( n + 1 \)^2 L^(- 2 - tau) . $ <tr:artificial-pairs>]

This numerical estimate requires no independence for overlapping actual experiments.

Decrease $sigma_1$ if necessary so that $lambda + sigma_1 < 2 + tau$. The errors in (6.12), summed using Lemma 24, have norm at most

#[#set math.equation(numbering: n => "(6.17)")
 $ C L^(- lambda - sigma_1) sum_(j + k lt.eq n - d) 2^(- \( 2 + tau - lambda - sigma_1 \) \( j + k \)) + o \( 1 \) lt.eq C L^(- lambda - sigma_1) + o \( 1 \) . $ <tr:rank-error-sum>]

Together with (6.8) and (6.16), this proves the first two estimates of Proposition 20, with a smaller positive exponent saving, in the mesh-first limit. All errors are measured in output total variation, not merely after testing a fixed continuum event.

It remains to prove the stronger estimate for an even isotropic input $v$. After the continuum replacement, delete the extra middle screens as above. Only $T_r$ then depends on both ends; all other factors belong to their separate, independently integrated end laws. Rotate all inner end data, including the seam and the revealed history. By equivariance of $v$, the coefficient $alpha_j \( v \; H_i \)$ in (6.9) is unchanged. Reverse all colors of the inner data instead. The message is still unchanged as a geometrically transformed signed measure, but the reference vector $delta_B - delta_W$ changes sign. Thus

#[#set math.equation(numbering: n => "(6.18)")
 $ alpha_j \( v \; "rot"_theta H_i \) = alpha_j \( v \; H_i \) \, #h(2em) alpha_j \( v \; "flip" H_i \) = - alpha_j \( v \; H_i \) . $ <tr:coefficient-symmetry>]

The inner end law is rotation and color-reversal invariant. The outer measure factor is unaffected by either transformation of the inner data. Labels for the four tips may be chosen independently of colors using the auxiliary angular axis, and transported under rotations. For each fixed outer history $H_o$, color reversal gives the identity

#[#set math.equation(numbering: n => "(6.19)")
 $ & integral alpha_j \( v \; H_i \) T_r \( H_i \, H_o \) thin d rho_j^(upright("in")) \( H_i \)\
 & quad = 1 / 2 integral alpha_j \( v \; H_i \) #scale(x: 120%, y: 120%)[\[] T_r \( H_i \, H_o \) - T_r \( "flip" H_i \, H_o \) #scale(x: 120%, y: 120%)[\]] thin d rho_j^(upright("in")) \( H_i \) . $ <tr:flip-integral>]

Now average rotations of the inner data in the right side. Since $alpha_j$ and the inner law are rotation invariant, its contribution is one half of the integral against the rotation average of $T^(+) - T^(-)$, with its appropriate inner prescriptions. In particular one must retain the sign; replacing this difference by an unsigned four-arm event would lose the required exponent.

Equation (5.7) bounds the averaged difference by $C \( a_j \/ b_k \)^(2 + sigma_2)$. The local end experiments and screens can be chosen rotation and color-reversal invariant. Decrease $sigma_2$ so that $0 < sigma_2 < tau$. The used-pair contributions are bounded in total variation by

#[#set math.equation(numbering: n => "(6.20)")
 $ C L^(- 2 - sigma_2) sum_(j + k lt.eq n - d) 2^(- \( tau - sigma_2 \) \( j + k \)) + o \( 1 \) lt.eq C L^(- 2 - sigma_2) + o \( 1 \) . $ <tr:signed-sum>]

Adding the unused contribution (6.8) proves the desired power strictly greater than two.

Finally choose $delta > 0$ smaller than all the positive savings just obtained, decreasing it to absorb the polynomial factors in $n$. For each fixed sufficiently large $n$, choose $r_0 \( 2^n \)$ so that every $o \( 1 \)$ term is smaller than the required fixed power of $L$. This proves (6.3)–(6.3). Notice the order: the ratio is chosen first and the scale threshold afterwards. No rate of convergence in Cardy’s formula, in the good-sequence extraction, or near a nonsimple limiting bank is used.

=== 6.6 Iteration and failed screens <iteration-and-failed-screens>

The block estimates have two consequences. The first uses the signed symmetry estimate to control a Poisson insertion. The second uses the rank-one approximation to compare two responses at different distant boundaries.

#thm([Corollary 6.6.])[
  (Fair-insertion message).  #emph[There are $0 < nu < 1$ and $C < oo$ such that the following holds. Insert a nucleus at the center of a cut, with an independent fair color. At a seam of radius $s$, take the difference of the inside state laws “with this insertion” minus “without this insertion,” conditional on the seam and with its screen success imposed. Its message $I_s$ satisfies 
#[#set math.equation(numbering: n => "(6.21)")
 $ parallel I_s parallel_s lt.eq C s^(- 2 - nu) $ <tr:insertion-bound>]

 for all sufficiently large $s$. The estimate remains valid in the presence of fixed data outside the screened collar that do not enter its inside. The seam tests and the selected cycle are those of the base process, without the insertion.]
] <tr:insertion>

#proof[
  Choose a ratio $L$ from Proposition 20 so large that the constant per block in (6.3) is absorbed by a smaller power saving. Choose $s_(*) > r_0 \( L \)$ sufficiently large. For given $s$, use radii
  $ r_j = L^j r_0 \, #h(2em) 0 lt.eq j lt.eq N \, #h(2em) r_N = s \, quad s_(*) lt.eq r_0 < L s_(*) . $
  All screens use the base process. At a successful seam, the inserted point cannot reach or alter its cycle, by localization. The two inside state laws consequently have the same state space and each has mass one. Their difference has zero mass, norm at most two, and is even and isotropic.
  If every seam is successful, iterating (6.3) bounds the message by $C \( s \/ r_0 \)^(- 2 - nu)$ for some $0 < nu < 1$. Since $r_0$ stays in a fixed compact range of positive scales, this gives (6.21) for that contribution.
  For the remaining contribution, group configurations by the largest failed radius $v = r_j < s$. The exact partition, with the final success kept in every term, is
  $ bold(1)_(G_(r_N)) = product_(i = 0)^N bold(1)_(G_(r_i)) + sum_(j = 0)^(N - 1) bold(1)_(G_(r_j)^c) product_(i = j + 1)^N bold(1)_(G_(r_i)) . $
  Form a fresh difference of inside state laws at the next cut $L v = r_(j + 1)$, multiplying both laws by the same base-process indicator $bold(1)_(G_v^c)$. Earlier screen outcomes are left unrestricted. This weighted difference still has zero mass for each successful seam at $L v$: for each common base configuration the two state laws have equal total mass. It is also even and isotropic. The collar at $v$ is disjoint from that at $L v$, so conditional on the latter seam its norm is at most
  #[#set math.equation(numbering: n => "(6.22)")
   $ 2 bb(P) \( G_v^c divides Sigma_(L v) \) lt.eq C e^(- c v^2) . $ <tr:reset>]
  Success at $L v$ ensures that both configurations use the same cut there, independently of what happened at smaller radii.
  Transfer this reset message through the successful cuts above $L v$. Those success restrictions ensure that $v$ is indeed the largest failed radius; no restriction on earlier failures was needed. The sum of these contributions is bounded by
  $ C sum_(v in { r_0 \, dots.h \, r_(N - 1) }) e^(- c v^2) (frac(s, L v))^(- 2 - nu) lt.eq C s^(- 2 - nu) . $
  The final inequality follows by summing the exponentially decaying weights times $v^(2 + nu)$ over the geometric sequence. This proves the claim. Outside data beyond the final screened collar have no effect on the inside law or on the argument, which proves the stated stability. ◻
]

For a message space $cal(B)_t$, the projective norm on its algebraic tensor square is

$ parallel z parallel_pi = inf {sum_(i = 1)^m parallel u_i parallel_t parallel v_i parallel_t : z = sum_(i = 1)^m u_i ⊗ v_i \, quad m < oo} . $

We may complete in this norm. Bounded linear functionals $ell \, ell'$ on $cal(B)_t$ satisfy

$ \| \( ell ⊗ ell' \) \( z \) \| lt.eq parallel ell parallel thin parallel ell' parallel thin parallel z parallel_pi . $

In particular, evaluating $u ⊗ v - v ⊗ u$ gives the determinant $ell \( u \) ell' \( v \) - ell \( v \) ell' \( u \)$.

#thm([Corollary 6.7.])[
  (Contraction of antisymmetric products).  #emph[There are $nu' > 0$, $s_0 < oo$, and a fixed ratio $L > 1$ such that, for $r gt.eq s_0$ and $s \/ r = L^N$, the transfer 
$ cal(M) = M_(s \/ L \, s) dots.h.c M_(r \, L r) $

 with all intermediate seam successes imposed satisfies 
#[#set math.equation(numbering: n => "(6.23)")
 $ parallel cal(M) u and cal(M) v parallel_pi lt.eq C \( s \/ r \)^(- 2 lambda - nu') parallel u parallel_r parallel v parallel_r $ <tr:wedge-bound>]

 for any two zero-mass input messages $u \, v in cal(B)_r$. Here $u and v = u ⊗ v - v ⊗ u$ and $parallel dot.op parallel_pi$ is the projective tensor norm. Fixed-factor unused intervals at the two ends change only the constant. No assertion of this contraction through a failed intermediate cut is made.]
] <tr:wedge>

#proof[
  For one block write $M = M_1 + E$ as in (6.3). Since $M_1$ has rank at most one, $M_1 ⊗ M_1$ vanishes on antisymmetric tensors. On that subspace,
  $ parallel M ⊗ M parallel lt.eq 2 parallel M_1 parallel thin parallel E parallel + parallel E parallel^2 lt.eq C L^(- 2 lambda - delta) . $
  Choose $L$ large enough to absorb $C$ into a smaller exponent saving $nu' > 0$, simultaneously with its choice in Corollary 25. Iterating the estimate and using $parallel u and v parallel_pi lt.eq 2 parallel u parallel_r parallel v parallel_r$ gives (6.23). The argument holds first for finite tensor sums and then for their projective-norm completion. Ordinary Markov pushes contract total variation, so fixed-factor omitted end intervals affect only the constant after rounding to the ratio-$L$ grid. ◻
]

== 7 The intensity derivative and the pivotal amplitude <sec:amplitude>

The preceding section supplies two estimates with different roles. Corollary 25 makes the effect of a distant fair insertion integrable, even after division by the central pivotal probability. Corollary 26 makes the normalized effect of a nearby insertion almost independent of the size of the rectangle. Together they give a summable error for the logarithmic derivative of $f$. Throughout this section the Poisson intensity is one, unless otherwise specified, and $lambda = 5 \/ 4$.

=== 7.1 Differentiating the intensity <differentiating-the-intensity>

Let $X_R \( eta \)$ be the indicator of a black left–right crossing of $R Q_0$ for a colored point configuration $eta$, with the closed-cell convention of Theorem 2. If $0^(upright(b))$ and $0^(upright(w))$ denote an inserted black and white point at the origin, respectively, put

$ H_R \( eta \) = X_R \( eta union { 0^(upright(b)) } \) - X_R \( eta union { 0^(upright(w)) } \) . $

Thus $H_R in { 0 \, 1 }$, and $f \( R \) = bb(E) H_R \( eta \)$ for the unit-intensity fairly colored process. For $y eq.not 0$, write $y^(upright(f))$ for an independently fairly colored inserted point and define

#[#set math.equation(numbering: n => "(7.1)")
 $ K_R \( y \) = bb(E) #scale(x: 120%, y: 120%)[\[] H_R \( eta union { y^(upright(f)) } \) - H_R \( eta \) #scale(x: 120%, y: 120%)[\]] . $ <cl:kernel>]

The expectation includes the extra color. Values at $y = 0$ and at null nongeneric insertion locations are immaterial to the integrals below. In particular, $K_R$ is an insertion difference of a #emph[color]-pivotal probability, not a probability of Poisson pivotality.

#thm([Lemma 7.1.])[
  (Intensity differentiation).  #emph[The function $f$ is continuously differentiable on $\( 0 \, oo \)$. For every $R > 0$, $K_R$ is absolutely integrable and 
#[#set math.equation(numbering: n => "(7.2)")
 $ R / 2 f' \( R \) = integral_(bb(R)^2) K_R \( y \) thin d y . $ <cl:derivative-eq>]

]
] <cl:derivative>

#proof[
  Let $eta_t$ have intensity $t$ and fair colors. Euclidean scaling gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ G_R \( t \) := bb(E) H_R \( eta_t \) = f \( sqrt(t) thin R \) . $ <cl:scaling-intensity>]
  We justify differentiation of the full-plane expectation before using this identity. All the estimates in this paragraph are uniform for $t$ in a compact subinterval of $\( 0 \, oo \)$.
  For $n gt.eq n_0 \( R \)$, let $H_(R \, n)$ be the same test computed from the points in $B \( 0 \, 2^n \)$, together with the central insertion. A locality screen in a collar well inside $B \( 0 \, 2^n \)$ determines every cell meeting $R Q_0$, including its intersections with the boundary. Consequently $H_(R \, n) = H_R$ outside an event of probability at most $C_R exp \( - c_R 4^n \)$. The same screen gives $H_(R \, n + 1) = H_(R \, n)$. Finite-volume Poisson differentiation follows by differentiating the absolutely convergent Poisson series; see also [8] Theorem 19.1. Equivalently, for a bounded function $F$ of the process in a bounded set $D$,
  #[#set math.equation(numbering: n => "(7.4)")
   $ frac(d, d t) bb(E) F \( eta_t ∩ D \) = bb(E) [F \( eta_t ∩ D \) (frac(N_t \( D \), t) - \| D \|)] . $ <cl:poisson-score>]
  Here $N_t \( D \)$ is the number of Poisson points in $D$. Apply this to $F = H_(R \, n + 1) - H_(R \, n)$ on $D = B \( 0 \, 2^(n + 1) \)$. The score in parentheses has second moment $\| D \| \/ t$. Cauchy–Schwarz therefore bounds the derivative by $C_R 2^n exp \( - c_R 4^n \)$. The differences of the expectations and of their derivatives are uniformly summable. Hence $G_R$ is $C^1$ and its derivative is the limit of the finite-volume derivatives.
  The add-one version of finite-volume differentiation is
  $ frac(d, d t) bb(E) H_(R \, n) \( eta_t \) = integral_(B \( 0 \, 2^n \)) bb(E) #scale(x: 120%, y: 120%)[\[] H_(R \, n) \( eta_t union { y^(upright(f)) } \) - H_(R \, n) \( eta_t \) #scale(x: 120%, y: 120%)[\]] thin d y . $
  For fixed $y$ the integrand converges to its full-plane counterpart. For $\| y \| gt.eq C R + C$, a screen surrounding $R Q_0$ and the origin, at distance comparable to $\| y \|$ and strictly short of $y$, prevents the insertion from changing any cell used by the test. Its failure probability is at most $C_R e^(- c_R \| y \|^2)$. The screen can be taken inside $B \( 0 \, 2^n \)$ whenever $y in B \( 0 \, 2^n \)$ and $n$ is sufficiently large; thus this is also a dominating bound for the finite-volume integrands. On a fixed bounded set the bound $2$ suffices. Dominated convergence proves absolute integrability and identifies $G'_R \( 1 \)$ with the integral in (7.2). Equation (7.3) proves the asserted derivative formula and, locally at each $R$, the $C^1$ assertion for $f$. ◻
]

=== 7.2 An integrable tail after normalization <an-integrable-tail-after-normalization>

The exponential localization in Lemma 27 is a finite-scale statement. We need a bound uniform as $R$ grows, with the small factor $f \( R \)$ retained. This is where the signed insertion estimate is essential.

#thm([Lemma 7.2.])[
  (Normalized insertion tail).  #emph[There are constants $xi > 0$, $m_0 < oo$, and $C < oo$ such that for $m_0 lt.eq m lt.eq R \/ 100$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ integral_(\| y \| > m) \| K_R \( y \) \| thin d y lt.eq C f \( R \) #scale(x: 120%, y: 120%)[\(] m^(- xi) + R^(- xi) #scale(x: 120%, y: 120%)[\)] . $ <cl:tail-eq>]

]
] <cl:tail>

#proof[
  Use the exponent $0 < nu < 1$ of Corollary 25 and the one-arm exponent $beta > 0$ from the critical inputs. All screens and arm probes below have fixed-factor buffers. Independent probes mean probes determined by disjoint sets of Poisson coordinates, not unrestricted Voronoi events in disjoint planar regions.
  We first explain how arm requirements can be multiplied by a signed message estimate. The integrand in (7.1) is a mixed difference: one difference changes the central color, and the other inserts the point at $y$. If this mixed difference is nonzero, changing the central color changes a crossing for at least one setting of the insertion, and changing the insertion changes a crossing for at least one setting of the central color. A screened probe separated from both changes reads the same base colors in all four configurations. Thus the necessary-arm implications for a local change apply to these common colors; see [10] Section 2, “Necessary arms for a local change”. They apply even when the two crossing changes occur in different configurations.
  The conditional version is equally important. Every formal noncrossing pairing can be drawn as disjoint wall arcs in a topological disk. Coloring its complementary regions alternately realizes the prescribed boundary runs and the pairing. Thus two formal cap states give two planar fillings agreeing on every exterior probe; the deterministic necessary-arm argument does not require Poisson geometry inside the replaced disk. Fix a successful cut about $y$, its seam, and all exterior variables. The exterior test is now a function of the inside connection state. If a necessary central or enclosing four-arm event does not occur, the central black-minus-white test is zero for every such state. If a necessary side or corner arm event does not occur, each crossing test with the central color fixed is constant across inside states. These are the same planar necessary-arm implications, applied to two possible cap states on the cut. The insertion message has zero mass, so it annihilates the latter constants. Its conditional answer is consequently bounded by its total variation norm times the necessary probe indicators. Those indicators are measurable outside the cut. Disjoint buffered supports then allow their probabilities to be multiplied.
  We use screened arm probes with failures allowed, whose probabilities are still bounded by a constant times their intended arm bounds; see the convention in Section 2 and [10] Section 2, “Buffered localization”. Indeed, group failures by the largest failed radius $v$ and retain the arm test starting a fixed factor beyond $v$, independently of the failure. For a four-arm probe starting at $r$, the relevant estimate is
  $ e^(- c v^2) A \( C_0 v \, R \) lt.eq C A \( r \, R \) \( v \/ r \)^g e^(- c v^2) #h(2em) \( C_0 v < R \) \, $
  where $g$ is the polynomial exponent in (2.1). For a side or corner probe the corresponding endpoint losses are bounded by $C \( v \/ d \)^2$ or $C \( v \/ u \)^beta$, respectively. If a failed screen crosses the junction between side and corner probes, the lost factors are therefore only polynomial. If the retained test has no remaining radial range, the same comparison follows from the polynomial lower bound, or directly from the displayed power factor for a side or corner probe. Summing over geometric $v$ preserves the indicated arm cost as long as the retained probes and the failure event have disjoint buffered supports. A failure large enough to reach the central probe requires a separate argument below: that probe is then dropped, not treated as independent. An unweighted exponentially small error alone would not suffice when $R$ is arbitrarily large.
  ===== 7.2.1 Insertions near the center. <insertions-near-the-center.>
  Put $t = \| y \|$ and suppose $m < t lt.eq R \/ 100$. First fix a small constant $c_1 > 0$, and then choose $a > 0$ sufficiently small relative to $c_1$. Choose a cut about $y$ of radius $a t$, a central four-arm probe from $b_(*)$ to $a t$, and a four-arm probe surrounding both insertions from $a^(- 1) t$ to $a R$. Short or overlapping endpoint ranges are omitted at constant cost. The buffers of these three constructions can be chosen disjoint. On cut success, Corollary 25 gives a bound $C t^(- 2 - nu)$ for the insertion message. The central color difference requires the first four-arm probe; transmission of a change from the region containing both insertions to the crossing requires the second. Thus the success contribution is at most $C t^(- 2 - nu) A \( b_(*) \, t \) A \( t \, R \)$.
  For failures, let $v$ be the largest failed radius about $y$, with the initial radius comparable to $t$. If $v < c_1 t$, the central probe and an enclosing probe retain disjoint supports after the fixed buffer adjustments. The preceding failed-screen estimate bounds their total contribution by $C e^(- c t^2) A \( b_(*) \, t \) A \( t \, R \)$. If $v gt.eq c_1 t$, drop the central probe. Retain instead a screened four-arm probe centered at the origin, from radius $C_1 \( v + t \)$ to $a R$, enclosing both modifications and with its support separated from the failed screen. The same necessary-arm implication supplies this probe. When its radial range is nonempty, quasi-multiplicativity and (2.1) give
  $ e^(- c v^2) A \( C_1 \( v + t \) \, a R \) lt.eq C A \( b_(*) \, R \) \( v + t \)^g e^(- c v^2) . $
  Since $t lt.eq c_1^(- 1) v$, summation over these geometric $v$ is at most $C A \( b_(*) \, R \) e^(- c' t^2)$. If the retained radial range is empty, then $R lt.eq C \( v + t \) lt.eq C' v$; the absolute failure bound and $A \( b_(*) \, R \) gt.eq c R^(- g)$ give the same conclusion. Combining success and both failure cases proves
  #[#set math.equation(numbering: n => "(7.6)")
   $ \| K_R \( y \) \| & lt.eq C t^(- 2 - nu) A \( b_(*) \, t \) A \( t \, R \) + C A \( b_(*) \, R \) e^(- c t^2)\
 & lt.eq C f \( R \) t^(- 2 - nu) . $ <cl:bulk-kernel>]
  In the last line we used quasi-multiplicativity and (2.3). In particular,
  #[#set math.equation(numbering: n => "(7.7)")
   $ integral_(m < \| y \| lt.eq R \/ 100) \| K_R \( y \) \| thin d y lt.eq C f \( R \) integral_m^oo t^(- 1 - nu) thin d t lt.eq C f \( R \) m^(- nu) . $ <cl:bulk-integral>]
  ===== 7.2.2 Insertions near a side or corner. <insertions-near-a-side-or-corner.>
  Consider $R \/ 100 < \| y \| lt.eq 10 R$, including points outside the rectangle. Fix a sufficiently large constant $d_(*)$, and then a sufficiently small constant $rho > 0$. If $cal(C)_R$ is the set of the four corners of $R Q_0$, set
  $ d \( y \) = min { rho R \, max { d_(*) \, "dist" \( y \, partial \( R Q_0 \) \) } } \, #h(2em) u \( y \) = min { rho R \, max { d_(*) \, "dist" \( y \, cal(C)_R \) } } . $
  We take $R$ large enough that $d_(*) < rho R$. Always $d_(*) lt.eq d \( y \) lt.eq u \( y \) lt.eq rho R$; write $d = d \( y \)$ and $u = u \( y \)$. The constants in the estimates may depend on $d_(*)$ and $rho$. There is a central four-arm probe up to radius $c R$, where $c$ is fixed and much smaller than $1 \/ 100$, disjoint from the other regions used below. Its cost is at most $C A \( b_(*) \, R \)$.
  At an interior point $y$, use the insertion estimate on a cut of radius a small fixed fraction of $d$. At the bottom cutoff a constant bound suffices, and can be bounded by $C d^(- 2 - nu)$ because $d_(*)$ is fixed. At an exterior point with distance above the bottom cutoff, successful screening at this scale leaves the quad unchanged. Only screen failures contribute there, with a bound exponential in $d^2$, which is no larger than $C d^(- 2 - nu)$.
  If $u \/ d$ is larger than a sufficiently large constant, the closest part of the boundary is a straight side. A crossing change then requires three alternating free arms in a half-plane probe centered at the projection onto that side, from radius $C d$ to radius $c u$. Its cost is at most $C \( d \/ u \)^2$. If the projection is at a corner, the two distances are comparable and this probe is unnecessary. When $u$ is uncapped and is a sufficiently small fraction of $R$, retain a one-arm probe centered at the nearest corner from radius $C u$ to radius $c R$. Its cost is at most $C \( u \/ R \)^beta$. For $u$ capped above, this factor is a fixed positive constant, so the corresponding probe can be omitted. These are precisely the local-change arm implications for the unwired, closed-cell crossing convention. They also cover a modified cell meeting a side or a corner.
  The insertion cut, the side probe, the corner probe, and the central probe can be given disjoint buffered supports. To arrange this, first fix the central radius $c R$, then choose the distance cap $rho R$ much smaller. A corner probe is used only in a corner neighborhood, far from the center. Fixed multiples are lost between consecutive probes, which changes only constants. To include failures, choose a sufficiently small fixed $c_2 > 0$. For a largest failed radius $v < c_2 R$ about $y$, the central probe remains disjoint from the failed-screen support. Retain the side and corner probes only beyond that support. If a junction has been passed, the center of the affected side or corner stage lies within $O \( v \)$ of $y$, so a fixed-factor enlargement provides the required separation. Omitting an entire side stage loses at most $C \( 1 + v \/ d \)^2$, and shifting or omitting a corner stage loses at most $C \( 1 + v \/ u \)^beta$. Since the first possible failed radius is a fixed fraction of $d$,
  $ sum_(v gt.eq c_3 d) e^(- c v^2) \( 1 + v \/ d \)^2 \( 1 + v \/ u \)^beta lt.eq C d^(- 2 - nu) . $
  The retained central probe supplies $A \( b_(*) \, R \)$ throughout this case. For $v gt.eq c_2 R$, discard all arm probes and sum the absolute failure probabilities, obtaining $C e^(- c' R^2)$. This is bounded by the right side of (7.8): $A \( b_(*) \, R \) gt.eq c R^(- g)$ and $d_(*) lt.eq d lt.eq u lt.eq rho R$ make the reciprocal of that right side at most a fixed power of $R$. This case includes every failure whose support reaches the central probe, because $\| y \| gt.eq R \/ 100$ and the central probe radius was chosen much smaller than $R \/ 100$. Thus no overlapping supports have been treated as independent. The conditional total-variation argument on screen success, together with these failure bounds, proves uniformly that
  #[#set math.equation(numbering: n => "(7.8)")
   $ \| K_R \( y \) \| lt.eq C A \( b_(*) \, R \) thin d^(- 2 - nu) (d / u)^2 (u / R)^beta . $ <cl:boundary-kernel>]
  For completeness, a dyadic class with distances comparable to $d \, u$ has area at most $C u d$. Below the upper cap, it lies in corner disks of radius $C u$ and boundary strips of width $C d$. If $u$ is capped, the total strip length is $O \( R \) = O \( u \)$; if both distances are capped, the ambient region has area $O \( R^2 \) = O \( u d \)$. These assertions apply equally outside the rectangle. The bottom classes have the same bounds with $d_(*)$ in place of a smaller distance. Summing (7.8) first over dyadic $d lt.eq u$ gives
  $ sum_(d lt.eq u) C u d thin d^(- 2 - nu) \( d \/ u \)^2 \( u \/ R \)^beta & = C / u (u / R)^beta sum_(d lt.eq u) d^(1 - nu)\
 & lt.eq C u^(- nu) \( u \/ R \)^beta \, $
  where $nu < 1$ is used. The remaining dyadic sum is bounded by
  $ C R^(- beta) sum_(d_(*) lt.eq u lt.eq rho R) u^(beta - nu) lt.eq C R^(- xi_0) #h(2em) upright("for every ") 0 < xi_0 < min { beta \, nu } . $
  The strict inequality accommodates the logarithm when $beta = nu$. Together with (2.3), this proves
  #[#set math.equation(numbering: n => "(7.9)")
   $ integral_(R \/ 100 < \| y \| lt.eq 10 R) \| K_R \( y \) \| thin d y lt.eq C f \( R \) R^(- xi_0) . $ <cl:boundary-integral>]
  ===== 7.2.3 Far exterior insertions. <far-exterior-insertions.>
  For $\| y \| > 10 R$ an agreement screen between the test rectangle and $y$ gives $\| K_R \( y \) \| lt.eq C e^(- c \| y \|^2)$. Its integral is at most $C e^(- c R^2)$. The polynomial lower bound for $f$ following from (2.3) absorbs this into $C f \( R \) R^(- xi_0)$. Combining this with (7.7) and (7.9), and decreasing the exponent, proves (7.5). ◻
]

=== 7.3 Comparing the normalized derivatives <comparing-the-normalized-derivatives>

The tail estimate permits us to discard insertions far from the origin. For the remaining insertions we use the same interior messages in two different rectangles. Rank-one approximation then controls a determinant, so that no unknown leading factor needs to be identified.

#thm([Lemma 7.3.])[
  (Two-size determinant).  #emph[Let $nu' > 0$ be the exponent in Corollary 26. There are constants $C \, c > 0$ such that, for sufficiently large $m$, $100 m lt.eq R lt.eq R' lt.eq 2 R$, and almost every $0 < \| y \| lt.eq m$, 
#[#set math.equation(numbering: n => "(7.10)")
 $ \| K_R \( y \) f \( R' \) - K_(R') \( y \) f \( R \) #scale(x: 120%, y: 120%)[\|] lt.eq C \( m \/ R \)^(2 lambda + nu') + C e^(- c m^2) . $ <cl:determinant-eq>]

 The constants are independent of the distance from $y$ to the origin.]
] <cl:determinant>

#proof[
  Take concentric cuts about the origin, starting at radius $10 m$ and ending at a radius comparable with a small fixed fraction of $R$, with consecutive radii in ratio $L$. Round the final radius down to the last such scale. Its ratio to $R$ is bounded below by a positive constant depending only on the already fixed $L$. All cut collars lie strictly inside both rectangles and outside both inserted points. If necessary, enlarge the fixed lower bound on $R \/ m$; the remaining bounded ratios follow by increasing $C$, since all four scalar quantities in the determinant are bounded.
  First restrict every test to success of every cut screen, with the screens evaluated on the common base process. The probability discarded is bounded by
  $ C sum_(j gt.eq 0) exp #scale(x: 120%, y: 120%)[\(] - c m^2 L^(2 j) #scale(x: 120%, y: 120%)[\)] lt.eq C e^(- c' m^2) . $
  At the first cut let $a$ be the signed connection-state message obtained by changing the central color. Let $b_y$ be the difference of this message with and without the extra fair point at $y$. Both have zero mass conditional on each seam, and their total variation norms are bounded by $2$ and $4$, respectively. They depend on neither $R$ nor $R'$: on screen success their construction uses only the common interior Poisson variables and the first seam. In particular this description does not require disjoint neighborhoods of $0$ and $y$.
  Let $T$ be the composed transfer through the intervening cuts. The exterior crossing tests in $R Q_0$ and $R' Q_0$ define bounded linear functionals $ell_R$ and $ell_(R')$ at the final cut. The four restricted expectations are
  $ ell_R \( T a \) \, quad ell_(R') \( T a \) \, quad ell_R \( T b_y \) \, quad ell_(R') \( T b_y \) . $
  Their determinant is the evaluation of $T^(⊗ 2)$ on $b_y ⊗ a - a ⊗ b_y$ by $ell_R ⊗ ell_(R')$. Corollary 26 therefore bounds it by $C \( m \/ R \)^(2 lambda + nu')$. Restoring the discarded events changes the determinant by at most $C e^(- c m^2)$, because each scalar factor is bounded. This proves (7.10). ◻
]

#thm([Proposition 7.4.])[
  (Summable logarithmic error).  #emph[There are constants $alpha > 0$ and $C < oo$ such that 
#[#set math.equation(numbering: n => "(7.11)")
 $ lr(|frac(R f' \( R \), f \( R \)) + lambda|) lt.eq C R^(- alpha) $ <cl:log-derivative-eq>]

 for all sufficiently large $R$.]
] <cl:log-derivative>

#proof[
  Set $g \( R \) = R f' \( R \) \/ f \( R \)$, which is defined and continuous for large $R$ by Lemma 27 and (2.3). We first prove a uniform estimate on each interval $\[ R \, 2 R \]$. Fix
  $ zeta = frac(nu', 4 \( 2 + 2 lambda + nu' \)) \, #h(2em) eta = nu' / 8 \, #h(2em) m = R^zeta . $
  The exponent estimate (2.4) implies $f \( s \) gt.eq s^(- lambda - eta)$ for all sufficiently large $s$. For $R lt.eq R' lt.eq 2 R$, divide (7.10) by $f \( R \) f \( R' \)$ and integrate over $\| y \| lt.eq m$. The result is
  #[#set math.equation(numbering: n => "(7.12)")
   $ lr(|integral_(\| y \| lt.eq m) frac(K_R \( y \), f \( R \)) thin d y - integral_(\| y \| lt.eq m) frac(K_(R') \( y \), f \( R' \)) thin d y|) & lt.eq C R^(2 lambda + 2 eta) m^2 #scale(x: 120%, y: 120%)[\[] \( m \/ R \)^(2 lambda + nu') + e^(- c m^2) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq C R^(- nu' \/ 2) . $ <cl:normalized-near>]
  Indeed the power in the first term is exactly
  $ - nu' + 2 eta + zeta \( 2 + 2 lambda + nu' \) = - nu' \/ 2 \, $
  and the exponential term is smaller. For large $R$, the chosen $m$ satisfies all the scale restrictions of Lemmas 28 and 29. Lemma 28 bounds each complementary normalized integral by $C R^(- zeta xi)$. Since $g \( R \) = 2 integral K_R \( y \) \/ f \( R \) thin d y$ by (7.2), we obtain
  #[#set math.equation(numbering: n => "(7.13)")
   $ sup_(R lt.eq R' lt.eq 2 R) \| g \( R' \) - g \( R \) \| lt.eq C R^(- alpha) \, #h(2em) alpha = min { nu' \/ 2 \, zeta xi } > 0 . $ <cl:dyadic-oscillation>]
  The values $g \( 2^n R_0 \)$ form a Cauchy sequence, because the successive errors in (7.13) are summable. The same estimate between dyadic points shows that $g \( R \)$ has a finite limit $gamma$ as $R arrow.r oo$, and summing along $R \, 2 R \, 4 R \, dots.h$ gives
  $ \| g \( R \) - gamma \| lt.eq C sum_(j gt.eq 0) \( 2^j R \)^(- alpha) lt.eq C' R^(- alpha) . $
  It remains to identify this limit. Integration yields
  $ log f \( R \) - log f \( R_0 \) = integral_(R_0)^R g \( s \) thin frac(d s, s) . $
  Dividing by $log R$ shows that $log f \( R \) \/ log R arrow.r gamma$. By (2.4) the same limit is $- lambda$. Thus $gamma = - lambda$, proving (7.11). ◻
]

=== 7.4 Completion of the normalization <completion-of-the-normalization>

#proof[
  By Proposition 30,
  $ frac(d, d R) log #scale(x: 120%, y: 120%)[\(] R^lambda f \( R \) #scale(x: 120%, y: 120%)[\)] = O \( R^(- 1 - alpha) \) . $
  The right side is integrable at infinity. Since $f \( R \) > 0$ for large $R$, the logarithm has a finite real limit. Consequently
  #[#set math.equation(numbering: n => "(7.14)")
   $ R^(5 \/ 4) f \( R \) arrow.r a in \( 0 \, oo \) . $ <cl:amplitude>]
  Positivity and finiteness follow from convergence of the #emph[logarithm], rather than merely boundedness of the normalized probabilities. In fact the argument also gives $R^(5 \/ 4) f \( R \) = a \( 1 + O \( R^(- alpha) \) \)$.
  Recall that $S_epsilon = f \( 1 \/ epsilon \)$, $m_epsilon = epsilon^(- 2)$, and $q_epsilon = \( bb(E) N_epsilon \( Q_0 \) \)^(- 1)$. The calibration limits (2.2) are
  $ m_epsilon q_epsilon S_epsilon arrow.r c in \( 0 \, oo \) \, #h(2em) q_epsilon bb(E) N_epsilon arrow.r B in \( 0 \, oo \) . $
  Equation (7.14) gives $S_epsilon tilde.op a epsilon^(5 \/ 4)$, hence $q_epsilon tilde.op \( c \/ a \) epsilon^(3 \/ 4)$. It follows that
  $ epsilon^(3 \/ 4) bb(E) N_epsilon arrow.r frac(B a, c) = : c_V in \( 0 \, oo \) . $
  Here $N_epsilon$ counts color-pivotal sites for the original unwired unit-square event. The Poisson insertion was used only to differentiate $f$; it has not changed the pivotal count in this last formula. Taking reciprocals proves the equivalent assertion for the near-critical scale. ◻
]

#heading(level: 1)[References]
#bibitem([1])[H.~J. Brascamp and E.~H. Lieb, On extensions of the Brunn--Minkowski and Prékopa--Leindler theorems, including inequalities for log concave functions, and with an application to the diffusion equation, #emph[J. Funct. Anal.] #strong[22] (1976), no.~4, 366--389. #link("https://doi.org/10.1016/0022-1236(76)90004-5")[doi:10.1016/0022-1236(76)90004-5].]
#bibitem([2])[F.~Camia and C.~M. Newman, Two-dimensional critical percolation: the full scaling limit, #emph[Comm. Math. Phys.] #strong[268] (2006), no.~1, 1--38. #link("https://doi.org/10.1007/s00220-006-0086-1")[doi:10.1007/s00220-006-0086-1].]
#bibitem([3])[J.~L. Cardy, Critical percolation in finite geometries, #emph[J. Phys. A: Math. Gen.] #strong[25] (1992), no.~4, L201--L206. #link("https://doi.org/10.1088/0305-4470/25/4/009")[doi:10.1088/0305-4470/25/4/009].]
#bibitem([4])[J.~Cardy, Calogero--Sutherland model and bulk-boundary correlations in conformal field theory, #emph[Phys. Lett. B] #strong[582] (2004), nos.~1--2, 121--126. #link("https://doi.org/10.1016/j.physletb.2003.12.029")[doi:10.1016/j.physletb.2003.12.029].]
#bibitem([5])[H.~Du, Y.~Gao, X.~Li, and Z.~Zhuang, Sharp asymptotics for arm probabilities in critical planar percolation, #emph[Comm. Math. Phys.] #strong[405] (2024), Article~182. #link("https://doi.org/10.1007/s00220-024-05028-0")[doi:10.1007/s00220-024-05028-0].]
#bibitem([6])[C.~Garban, G.~Pete, and O.~Schramm, Pivotal, cluster, and interface measures for critical planar percolation, #emph[J. Amer. Math. Soc.] #strong[26] (2013), no.~4, 939--1024. #link("https://doi.org/10.1090/S0894-0347-2013-00772-9")[doi:10.1090/S0894-0347-2013-00772-9].]
#bibitem([7])[A.~V. Kolesnikov and E.~Milman, Brascamp--Lieb-type inequalities on weighted Riemannian manifolds with boundary, #emph[J. Geom. Anal.] #strong[27] (2017), 1680--1702. #link("https://doi.org/10.1007/s12220-016-9736-5")[doi:10.1007/s12220-016-9736-5].]
#bibitem([8])[G.~Last and M.~Penrose, #emph[Lectures on the Poisson Process], Institute of Mathematical Statistics Textbooks, vol.~7, Cambridge University Press, Cambridge, 2017.]
#bibitem([9])[G.~F. Lawler, O.~Schramm, and W.~Werner, Values of Brownian intersection exponents, II: Plane exponents, #emph[Acta Math.] #strong[187] (2001), no.~2, 275--308. #link("https://doi.org/10.1007/BF02392619")[doi:10.1007/BF02392619].]
#bibitem([10])[OpenAI, #emph[From critical crossings to quenched near-critical universality in Voronoi percolation], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/From-critical-crossings-to-quenched-near-critical-universality-in-Voronoi-percolation-October-5-2026/critical-crossings-quenched-near-critical-universality-voronoi-percolation.pdf")[OAI:From-critical-crossings-to-quenched-near-critical-universality-in-Voronoi-percolation-October-5-2026], 2026.]
#bibitem([11])[O.~Schramm, Scaling limits of loop-erased random walks and uniform spanning trees, #emph[Israel J. Math.] #strong[118] (2000), 221--288. #link("https://arxiv.org/abs/math/9904022")[arXiv:math/9904022].]
#bibitem([12])[O.~Schramm and S.~Smirnov, On the scaling limits of planar percolation, #emph[Ann. Probab.] #strong[39] (2011), no.~5, 1768--1814. #link("https://doi.org/10.1214/11-AOP659")[doi:10.1214/11-AOP659].]
#bibitem([13])[S.~Smirnov, Critical percolation in the plane: conformal invariance, Cardy's formula, scaling limits, #emph[C. R. Acad. Sci. Paris Sér. I Math.] #strong[333] (2001), no.~3, 239--244. #link("https://doi.org/10.1016/S0764-4442(01)01991-7")[doi:10.1016/S0764-4442(01)01991-7].]
#bibitem([14])[S.~Smirnov and W.~Werner, Critical exponents for two-dimensional percolation, #emph[Math. Res. Lett.] #strong[8] (2001), 729--744. #link("https://doi.org/10.4310/MRL.2001.v8.n6.a4")[doi:10.4310/MRL.2001.v8.n6.a4].]
#bibitem([15])[V.~Tassion, Crossing probabilities for Voronoi percolation, #emph[Ann. Probab.] #strong[44] (2016), no.~5, 3385--3398. #link("https://doi.org/10.1214/15-AOP1052")[doi:10.1214/15-AOP1052].]
#bibitem([16])[H.~Vanneuville, Annealed scaling relations for Voronoi percolation, #emph[Electron. J. Probab.] #strong[24] (2019), Paper~39, 71~pp. #link("https://doi.org/10.1214/19-EJP293")[doi:10.1214/19-EJP293].]
#bibitem([17])[D.~Zhan, Stochastic Loewner evolution in doubly connected domains, #emph[Probab. Theory Related Fields] #strong[129] (2004), no.~3, 340--380. #link("https://doi.org/10.1007/s00440-004-0343-1")[doi:10.1007/s00440-004-0343-1].]


