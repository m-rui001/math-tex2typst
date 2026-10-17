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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform real Lipschitz surfaces \
on the triangular lattice]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 The Model and the Theorem <sec:model>

Let $D subset bb(R)^2$ be a bounded smooth simply connected domain, with distinct marked boundary points $a \, b$. Write $A_(+)$ and $A_(-)$ for its intervening open boundary arcs. The unit triangular lattice has basis

$ e_1 = \( 1 \, 0 \) \, #h(2em) e_2 = \( 1 \/ 2 \, sqrt(3) \/ 2 \) \, $

and nearest-neighbor steps $plus.minus e_1 \, plus.minus e_2 \, plus.minus \( e_1 - e_2 \)$. For mesh $delta > 0$, take a simply connected triangular-lattice polygon $D_delta$ whose marked boundary converges uniformly to $\( D \; a \, b \)$. Place the two discrete marks at the midpoints of distinct boundary edges. The resulting open arcs partition the boundary vertices, so no vertex receives two boundary values.

For $0 < lambda lt.eq 1 \/ 2$, let $h_delta$ have normalized Lebesgue measure on the set of real vertex heights satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ h_delta = lambda upright(" on ") A_(+ \, delta) \, #h(2em) h_delta = - lambda upright(" on ") A_(- \, delta) \, #h(2em) \| h_delta \( x \) - h_delta \( y \) \| lt.eq 1 quad \( x tilde.op y \) . $ <eq:model>]

The polytope is bounded because every vertex is at finite graph distance from the prescribed boundary. In its free coordinates it has nonempty interior: assigning zero to every free vertex leaves all inequalities involving a free vertex strict. Fixed–fixed inequalities are already satisfied by $2 lambda lt.eq 1$.

Extend heights affinely across faces. Almost surely no free vertex has height zero, since that event is a hyperplane of Lebesgue measure zero. Each triangle then has either no zero segment or a unique segment joining two edges. These segments form loops and one chordal interface $gamma_delta$ joining the discrete marks. The chord is simple: no face contains two strands and no vertex is a branching point. Replacing its within-face placement by the corresponding dual-lattice strand changes uniform distance by $O \( delta \)$.

For continuous curves, use uniform distance modulo increasing reparametrization:

$ d_(upright("unif")) \( alpha \, beta \) = inf_(phi.alt \, psi) sup_(t in \[ 0 \, 1 \]) \| alpha \( phi.alt \( t \) \) - beta \( psi \( t \) \) \| \, $

where $phi.alt \, psi$ are increasing homeomorphisms of $\[ 0 \, 1 \]$, and curves at zero distance are identified. The Dirichlet GFF convention throughout is covariance $G_D = \( - Delta_D \)^(- 1)$.

#thm([Theorem 1.1.])[
  #emph[There are constants $A > 0$, $sigma > 0$, and $lambda in \( 0 \, 1 \/ 2 \]$, independent of $D \, a \, b$, such that the model (1.1) has 
$ gamma_delta arrow.r.double upright("SLE")_4 \( D \; a \, b \) \, #h(2em) frac(h_delta - bb(E) h_delta, sigma) arrow.r.double upright("GFF")_D $

 in the stated curve metric and as random distributions, respectively. The constants and limiting mean are 
#[#set math.equation(numbering: n => "(1.2)")
 $ v & = 2 \/ sqrt(3) \, & sigma^2 & = \( v A \)^(- 1) \, & lambda^2 & = frac(pi, 8 v A) \,\
m_D \( z \) & = lambda #scale(x: 120%, y: 120%)[\[] omega_D \( z \, A_(+) \) - omega_D \( z \, A_(-) \) #scale(x: 120%, y: 120%)[\]] . &  &  & $ <eq:target-constants>]

 Here $omega_D$ is harmonic measure and $A$ is the tangent-flux coefficient defined in the cell construction. The stiffness is $v A$; no elementary closed form for it is proposed.]
] <thm:main>

The normalization of chordal SLE$""_4$ in the half-plane is $partial_t g_t \( z \) = 2 \/ \( g_t \( z \) - 2 B_t \)$ with standard real Brownian motion $B$. There is no logarithmic rescaling of the heights in the distributional limit. Pointwise height tightness is neither asserted nor required.

=== 1.1 History and scope <history-and-scope>

Schramm’s Problem 2.3 asks for SLE$""_4$ and GFF limits for this real-valued hard-constraint model [13]. It is distinct from the integer-valued model in the preceding problem. Schramm–Sheffield establish the discrete Gaussian contour result [14]; Miller extends contour universality to smooth symmetric uniformly convex gradient potentials [6]. The hard potential here is constant on $\[ - 1 \, 1 \]$ and infinite outside. It does not satisfy those convexity hypotheses. An approximation by smooth potentials is therefore not, by itself, a solution.

The identification of effective stiffness and Gaussian fluctuations belongs to the gradient-field homogenization tradition of Naddaf and Spencer [9] and Giacomin, Olla and Spohn [4]. For smooth symmetric uniformly convex interactions, Miller proved a bounded-domain field limit by coupling boundary-conditioned fields so that their difference is harmonic in the bulk with high probability [7]. Miłoś and Peled [8] studied hard-core fluctuations, including the uniform Lipschitz potential, on even square tori with one pinned height. Their delocalization and controlled-gradient arguments provide related finite-volume methods. Cohen-Alloro and Peled’s later gradient control also extends the delocalization argument to square-lattice domains with zero Dirichlet data [3] Section 6. These hard-core delocalization results do not give the bounded-domain field or contour limits considered here. More recently, Buchholz, Cotar and Schweiger [2] proved infinite-volume gradient-field universality for a class of nonconvex potentials. Their scaling theorem retains smooth, uniformly curved mixture components and does not cover the flat/infinite hard potential.

The convex-volume foundation uses Prékopa’s integral log-concavity theorem [10]; the quantitative facet deficit, triangular exposure and average anchoring are proved here. The controlled-gradient estimate of Cohen-Alloro and Peled [3] supplies the zero-pinned starting point. Extending it to bounded data and sign observations requires separate finite-volume arguments. Those extensions are needed because an interface exploration continually changes the conditioned height polytope.

For the finite reflected dynamics we use Słomiński’s fixed-domain Skorokhod approximation [18], the Neumann semimartingale identification of Bass and Hsu [1], and the stationary forward–reverse decomposition of Lyons and Zheng [5]. The uniform changing-polytope force argument and weighted constant-drift identification are proved locally. At the curve stage, we adapt the harmonic-observable method of Schramm and Sheffield [14] and use the two-orientation path criterion of Sheffield and Sun [17]. The hard-constraint model must supply its own conditional covariance, height gap and stopping-time-uniform observable before those deterministic and diffusion arguments apply.

=== 1.2 Plan of the proof <plan-of-the-proof>

The proof has four parts. First, local volume curvature and sparse defects give unscaled moments of macroscopic averages (Section 3). Second, synchronous reflected couplings turn Brownian contact events into weighted control of differences and their errors at observed sites (Section 4). Third, the stationary tangent update identifies a scalar flux law and, through small tilts, a Gaussian field (Section 5). Analytic trace estimates on varying observed sets then give conditional Dirichlet covariance (Sections 6 and 7). Finally, feasible shifts with controlled volume cost turn crossing estimates into barriers (Section 8). These barriers and conditional field estimates give sampled-interface separation, then the height gap and the stopped harmonic observable (Sections 9 and 10).

The demanding uniformity is part of the assertions, not an optional strengthening: random observations are used only with their exact conditional Gibbs kernels, and the curve argument needs estimates uniform over the stopping rules used to test its driving function. In particular, conditional covariance, survival reweighting, and convergence of labelled harmonic accesses are established before the driving criterion is applied.

== 2 Conventions for the Estimates <sec:conventions>

For local arguments rescale the lattice to spacing one and write $n$ for the macroscopic length. Discrete edge gradients do not include a factor $n$. Continuum tests use the Riemann pairing

$ chevron.l h \, f chevron.r_n = frac(1, v n^2) sum_x f \( x \/ n \) h_x . $

In the continuum trace sections, the lattice is instead already embedded at physical mesh $n^(- 1)$; there $x$ denotes the physical location and the same pairing is written with $f \( x \)$. These are the same normalization. Constants may depend on a fixed compact test region and on explicitly fixed scale ratios, but not on $n$ or the microscopic shape of admissible observed strings. An oriented sign string prescribes the signs adjacent to an interface piece. Each such vertex has an opposite-sign neighbor, hence its height belongs to $\[ - 1 \, 1 \]$. Newly revealed exact values are instead pins; their annealed estimates must be justified by conditioning, not by treating arbitrary revealed values as uniformly bounded.

The reflected bath has Brownian variance parameter two in free coordinates and normal reflection on the convex height polytope. A density tilted by $exp \( sum_x b_x h_x \)$ adds drift $b$. Finite-dimensional normal-reflection existence, continuity, invariance of the stated density, and the stationary forward/reverse martingale decomposition are the standard stochastic tools used below. Exact-value conditional laws are taken on their almost-sure positive-volume fibers after the recorded coordinates are removed; null-volume conditionings are discarded. Reflection and its martingale decomposition are applied on these free coordinates. The finite-body references and the separate uniform forcing argument appear in Section 4.

== 3 Local Slack and Macroscopic Averages <f:section>

The estimates in this section provide the spatial compactness and moment bounds used in the comparison argument. The principal probabilistic input is the controlled-gradient theorem of Cohen–Alloro and Peled [3]. The local convex-volume argument uses integral log-concavity [10] Theorems 3 and 6. Its quantitative facet and block estimates are proved below for the present triangular lattice.

=== 3.1 The finite-volume laws and the moment statement <the-finite-volume-laws-and-the-moment-statement>

We identify the triangular lattice with $bb(Z)^2$, with edges in the directions $plus.minus e_1 \, plus.minus e_2 \, plus.minus \( e_1 - e_2 \)$. Distances are graph distances. Let $V$ be a finite set of free vertices, and prescribe height zero on its exterior vertex boundary and on any additional pins. Write $mu_0$ for uniform Lebesgue measure on the remaining heights satisfying the edge constraints. A zero-pinned sample is extended by zero to the whole lattice. Its defining polytope is compact and has positive volume on its free coordinates. A bounded-data law $mu_b$ has the same fixed set and prescribed values $b$ with $\| b \| lt.eq B$, and is considered only when its polytope has positive volume. Constants below are independent of the number and shape of the components of $V$.

#thm([Proposition 3.1.])[
  (Macroscopic exponential moments).  #emph[Fix $c \, C > 0$ and $B < oo$. Let $R gt.eq 1$ and let deterministic real weights $q_x$ obey 
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_x \| q_x \| lt.eq C \, #h(2em) max_x \| q_x \| lt.eq C R^(- 2) \, #h(2em) "supp" q subset Q \, quad "diam" Q lt.eq C R \, $ <f:weights>]

 where $Q$ is an ambient coordinate box. Assume either $sum_x q_x = 0$, or there is a connected set of pins $K$, of diameter at least $c R$, such that $K union Q$ lies in a coordinate box of diameter at most $C R$. For a sample $h$ from $mu_b$, there are $a > 0$ and $M < oo$, depending only on $c \, C \, B$, such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(E) exp (a lr(|sum_x q_x h \( x \)|)) lt.eq M . $ <f:average-mgf>]

 The conclusion is uniform over mixtures of bounded pin values whenever conditioning on those values leaves exactly the specified uniform law.]
] <f:averages>

The zero-mass alternative covers differences of comparable-scale averages in a free ball even when the nearest pin is much farther away. An ordinary ball average, or a smooth average of that scale, satisfies (3.1). Restriction of its original positive weights to the domain also satisfies that condition. Renormalization after restriction requires a new verification of the bound $max \| q_x \| lt.eq C R^(- 2)$. We first prove the proposition for zero pins. The proof will also identify the exact deterministic estimates required of later comparison fields.

=== 3.2 A local filling-volume deficit <a-local-filling-volume-deficit>

Fix a large even integer $L$ and tile the lattice by $Q_z = L z + { 0 \, dots.h \, L }^2$. The interiors of distinct blocks have no connecting edge. For shell data $s$ on $partial Q$, let $K_Q \( s \)$ be the polytope of fillings and put

$ F_Q \( s \) = log "vol"_(\( L - 1 \)^2) K_Q \( s \) \, $

with value $- oo$ when the volume is zero. The inclusion $1 / 2 \( K_Q \( s_1 \) + K_Q \( s_2 \) \) subset K_Q \( \( s_1 + s_2 \) \/ 2 \)$ and Brunn–Minkowski imply concavity of $F_Q$.

Concavity gives a nonnegative midpoint loss. We next show that, on blocks with slack, this loss controls differences between the perturbations of the shell heights at the four side midpoints. It cannot control a common height shift, which leaves filling volume unchanged. The later coarse-grid argument combines these differences; the connected pins or the zero-mass hypothesis in Proposition 2 remove the additive constant.

For each of the four sides, let $v$ be its midpoint and let $r$ be the coordinate unit step pointing toward the block center. The inward path is $v + k r$, $0 lt.eq k lt.eq L \/ 2$. Of the two tangential unit steps on that side, let $t$ be the one with $r dot.op t = 1 \/ 2$. The #emph[compressed ray] is $v + ell t$, $0 lt.eq ell lt.eq L \/ 2$: its graph distance to $v + k r$ is $max \( k \, ell \)$. These choices define the four tests below. Figure 1 illustrates one of them.

For fixed $0 < delta lt.eq delta_0 lt.eq 1 \/ 16$, an integer $k_0 gt.eq 4 \/ delta_0$, and $s_0 > 0$, call a block #emph[convex-good] for $h$ if

#[#set math.equation(numbering: n => "(3.3)")
 $ \| h \( x \) - h \( y \) \| & lt.eq 1 - delta &  & \( x tilde.op y upright(" in ") Q \) \,\
\| h \( x \) - h \( y \) \| & lt.eq \( 1 - delta_0 \) "dist" \( x \, y \) &  & \( x \, y in Q \, med "dist" \( x \, y \) gt.eq k_0 \) \, $ <f:near>]

and the following four non-tie conditions hold. For each face center $v$, take the radial coordinate path from $v$ to the block center. Exactly one ray on its starting face has compressed triangular distances to that path; if $b_1$ is its first vertex, require $\| h \( b_1 \) - h \( v \) \| gt.eq s_0$. Take $L gt.eq 8 \( k_0 + 2 \) \/ delta_0$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((0.525, 0.9093), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((1.05, 1.819), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((1.575, 2.728), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((1.05, 0), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((1.575, 0.9093), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((2.1, 1.819), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((2.625, 2.728), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((2.1, 0), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((2.625, 0.9093), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((3.15, 1.819), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((3.675, 2.728), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((3.15, 0), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((3.675, 0.9093), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((4.2, 1.819), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((4.725, 2.728), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((4.2, 0), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((4.725, 0.9093), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((5.25, 1.819), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  circle((5.775, 2.728), radius: 0.03881, fill: rgb("#808080"), stroke: none)
  line((0, 0), (1.05, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0.525, 0.9093), (1.575, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.05, 1.819), (2.1, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.575, 2.728), (2.625, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.05, 0), (2.1, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.575, 0.9093), (2.625, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.1, 1.819), (3.15, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.625, 2.728), (3.675, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.1, 0), (3.15, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.625, 0.9093), (3.675, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.15, 1.819), (4.2, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.675, 2.728), (4.725, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.15, 0), (4.2, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.675, 0.9093), (4.725, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.2, 1.819), (5.25, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 2.728), (5.775, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (0.525, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0.525, 0.9093), (1.05, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.05, 1.819), (1.575, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.05, 0), (1.575, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.575, 0.9093), (2.1, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.1, 1.819), (2.625, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.1, 0), (2.625, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.625, 0.9093), (3.15, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.15, 1.819), (3.675, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.15, 0), (3.675, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.675, 0.9093), (4.2, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.2, 1.819), (4.725, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.2, 0), (4.725, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 0.9093), (5.25, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.25, 1.819), (5.775, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.05, 0), (0.525, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((1.575, 0.9093), (1.05, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.1, 1.819), (1.575, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.1, 0), (1.575, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((2.625, 0.9093), (2.1, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.15, 1.819), (2.625, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.15, 0), (2.625, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.675, 0.9093), (3.15, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.2, 1.819), (3.675, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.2, 0), (3.675, 0.9093), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.725, 0.9093), (4.2, 1.819), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.25, 1.819), (4.725, 2.728), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (1.575, 2.728), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((2.1, 0), (3.15, 0), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((2.1, 0), (1.575, 0.9093), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((1.575, 0.9093), (1.05, 1.819), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((1.05, 1.819), (1.575, 2.728), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((3.15, 0), (2.625, 0.9093), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10, dash: "dotted"))
  line((2.625, 0.9093), (2.1, 1.819), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10, dash: "dotted"))
  line((2.1, 1.819), (1.575, 2.728), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10, dash: "dotted"))
  content((0, 0), [$v$], anchor: "north-east", padding: 0.1176cm)
  content((0.525, 0.9093), [$v+e_2$], anchor: "east", padding: 0.1176cm)
  content((1.575, 2.728), [$v+3e_2$], anchor: "south", padding: 0.1176cm)
  content((2.1, 0), [$x_2$], anchor: "north", padding: 0.1176cm)
  content((3.15, 0), [$x_3$], anchor: "north", padding: 0.1176cm)
  line((4.725, 0.3675), (5.46, 0.3675), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.46, 0.3675), [$e_1$], anchor: "west", padding: 0.1176cm)
  line((4.725, 0.3675), (5.093, 1.004), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.093, 1.004), [$e_2$], anchor: "south-west", padding: 0.1176cm)
})],
  caption: [Figure 1: The compressed ray in the triangular exposure argument. Here $x_k = v + k e_1$, and the highlighted test edge is $x_2 x_3$. Both drawn paths from its endpoints to $v + 3 e_2$ have length three. For a ray vertex $v + ell e_2$, the two distances are $max \( k \, ell \)$ and $max \( k + 1 \, ell \)$, rather than $k + ell$ and $k + 1 + ell$. The sign of $h \( v + e_2 \) - h \( v \)$ selects which facet can be exposed with uniform slack; its near-zero case must be excluded in that argument. ],
) <fig:triangular>

#thm([Lemma 3.2.])[
  (Triangular block deficit).  #emph[For these fixed parameters there is $c_(*) > 0$ such that, if $Q$ is convex-good for $h$, $s = h \|_(partial Q)$, $chi : partial Q arrow.r bb(R)$, and both $K_Q \( s + chi \)$ and $K_Q \( s - chi \)$ have positive volume, then every two face centers $v \, w$ satisfy 
#[#set math.equation(numbering: n => "(3.4)")
 $ g_Q := F_Q \( s \) - 1 / 2 #scale(x: 120%, y: 120%)[\(] F_Q \( s + chi \) + F_Q \( s - chi \) #scale(x: 120%, y: 120%)[\)] gt.eq c_(*) \| chi \( v \) - chi \( w \) \|^2 . $ <f:block-deficit>]

]
] <f:block>

#proof[
  We first expose one sign of each radial edge with uniform slack in all other constraints. Write $x = v + k e_1$, $y = v + \( k + 1 \) e_1$ after applying a lattice symmetry. If $k gt.eq k_0$, prescribe $a \( x \) = h \( x \)$ and $a \( y \) = h \( x \) + 1$. Both points are at distance at least $k_0$ from the shell, and the change at $y$ is at most two. Hence, for sufficiently small $beta lt.eq delta \/ 2$,
  $ \| a \( z \) - h \( b \) \| lt.eq \( 1 - delta_0 \) "dist" \( z \, b \) + 2 lt.eq \( 1 - beta \) "dist" \( z \, b \) quad \( z = x \, y \, med b in partial Q \) . $
  If $k < k_0$, put $b_l = v + l e_2$ on the compressed ray and $f_l = h \( b_l \) - h \( v \)$. Its distances are
  $ "dist" \( x \, b_l \) = max \( k \, l \) \, #h(2em) "dist" \( y \, b_l \) = max \( k + 1 \, l \) . $
  Choose $tau = "sign" f_1$, and prescribe $a \( x \) = h \( v \)$ and $a \( y \) = h \( v \) + tau$. For $l gt.eq 1$,
  $ s_0 - \( 1 - delta \) \( l - 1 \) lt.eq tau f_l lt.eq \( 1 - delta \) l \, $
  so
  #[#set math.equation(numbering: n => "(3.5)")
   $ \| tau - f_l \| lt.eq l - min { s_0 + delta \( l - 1 \) \, 1 + delta l } lt.eq \( 1 - min { s_0 \, delta } \) l . $ <f:triangular-slack>]
  The difference at $x$ is bounded by $\( 1 - delta \) l$. On the opposite ray, the distances are $k + l \, k + 1 + l$. The estimate $1 + \( 1 - delta \) l lt.eq \( 1 - delta \/ 2 \) \( k + 1 + l \)$ holds when $k + l gt.eq 1$. The omitted case is the designated edge itself. For another face, put $l = "dist" \( v \, b \) gt.eq L \/ 2$. Both prescribed differences are at most $1 + \( 1 - delta_0 \) l$ and both distances are at least $l - k - 1$. The choice of $L$ gives the required relative slack there as well.
  Choose $beta < min { delta \/ 2 \, s_0 \/ 2 \, 1 \/ 4 }$, decreasing it if necessary. Give the designated edge length one and all other edges length $1 - beta$. All prescribed pairs are Lipschitz for this weighted metric. Its distance across the designated edge is one, since every alternative path has at least two edges and $2 \( 1 - beta \) > 1$. Extending by the minimum of the upper distance cones gives a filling with designated gradient $tau$ and all other gradients at most $1 - beta$ in absolute value.
  We need the following quantitative finite-dimensional consequence of slice log-concavity, and give its proof. If positive-volume convex bodies $K_(-) \, K_(+) subset bb(R)^m$ have projection widths at most $A$ in a unit direction $u$, their top facet areas divided by volume are at least $c_0 > 0$, and $K supset \( K_(-) + K_(+) \) \/ 2$, then
  #[#set math.equation(numbering: n => "(3.6)")
   $ log frac(\| K \|, sqrt(\| K_(-) \| \| K_(+) \|)) gt.eq kappa #scale(x: 120%, y: 120%)[\[] \( b_(+) - u dot.op m_(+) \) - \( b_(-) - u dot.op m_(-) \) #scale(x: 120%, y: 120%)[\]]^2 . $ <f:facet-input>]
  Here $m_plus.minus$ are the centroids, $b_plus.minus$ the top projection endpoints, and $kappa > 0$ depends only on $A \, c_0$. This is a finite-dimensional lemma; it has no restriction on the spatial dimension of the lattice.
  To prove (3.6), let $f_i$ be the normalized density of the projection of uniform measure on $K_i$, and let $q_i \( p \)$ be its quantile, $0 < p < 1$, for $i in { - \, + }$. Parallel-slice Brunn–Minkowski makes $f_i$ log-concave, with $f_i \( b_i \) gt.eq c_0$. If $f_i \( q_i \( p \) \) < c_0$, every density value to its left is at most $f_i \( q_i \( p \) \)$: otherwise log-concavity between that value and the top slice gives a contradiction. Integration over an interval of length at most $A$ then gives $p lt.eq A f_i \( q_i \( p \) \)$. In the other case $q'_i \( p \) = 1 \/ f_i \( q_i \( p \) \) lt.eq c_0^(- 1)$. Thus, with $C = max { A \, c_0^(- 1) }$,
  $ 0 < q'_i \( p \) lt.eq C \/ p . $
  The midpoint slice of $K$ at $\( q_(-) \( p \) + q_(+) \( p \) \) \/ 2$ contains the midpoint sum of the two corresponding slices. Slice Brunn–Minkowski and change of variable along these increasing levels yield
  $ frac(\| K \|, sqrt(\| K_(-) \| \| K_(+) \|)) gt.eq integral_0^1 frac(q'_(-) + q'_(+), 2 sqrt(q'_(-) q'_(+))) thin upright(d) p gt.eq 1 + frac(1, 8 C^2) integral_0^1 p^2 \( q'_(-) - q'_(+) \)^2 thin upright(d) p . $
  For the second inequality, subtract one from the integrand; its numerator is $\( q'_(-) - q'_(+) \)^2$ and its denominator is $2 sqrt(q'_(-) q'_(+)) \( sqrt(q'_(-)) + sqrt(q'_(+)) \)^2 lt.eq 8 C^2 \/ p^2$. Tonelli gives $b_i - u dot.op m_i = integral_0^1 p q'_i \( p \) thin upright(d) p$. Cauchy–Schwarz therefore bounds the last integral below by the squared difference $d^2$ of the centroid gaps. Since $\| d \| lt.eq A$, $log \( 1 + x \) gt.eq x \/ \( 1 + x \)$ proves (3.6) with $kappa = \( 8 C^2 + A^2 \)^(- 1)$. All slice integrals may first be taken over compact subintervals of $\( 0 \, 1 \)$ and then by monotone limits.
  Apply it to $K_plus.minus = K_Q \( s plus.minus alpha chi \)$ with $alpha lt.eq beta \/ \( 8 L \)$. Endpoint feasibility implies $\| chi \( b \) - chi \( c \) \| lt.eq "dist" \( b \, c \) lt.eq 2 L$ on the shell. Shift every interior coordinate in the exposed filling by $plus.minus alpha chi \( v \)$ and use the new shell data. Every undesignated edge retains slack at least $beta \/ 2$. Thus each selected facet contains a Euclidean ball of radius $beta \/ 8$ in its hyperplane. Body volumes are at most $\( 4 L \)^(\( L - 1 \)^2)$, and the projection widths are at most two. The hypotheses of (3.6) therefore hold uniformly.
  Define $U = m_(+) - m_(-)$ on the interior and $U = 2 alpha chi$ on the shell. For an interior radial edge use the direction $tau \( e_y - e_x \) \/ sqrt(2)$. The top projection endpoints are both $1 \/ sqrt(2)$, so the difference of the two centroid gaps in (3.6) is $- tau \( U \( y \) - U \( x \) \) \/ sqrt(2)$. For an edge from a face center $v$ to an interior vertex $y$, use the direction $tau e_y$. Its top endpoints are $1 + tau \( s \( v \) plus.minus alpha chi \( v \) \)$, so the difference of the centroid gaps is $- tau \( U \( y \) - U \( v \) \)$. Thus (3.6) bounds every $\| U \( y \) - U \( x \) \|^2$ by a fixed multiple of the common midpoint gap $g_alpha$. The bodies and their centroids are the same for all radial edges; varying $tau$ changes no squared increment. Telescoping at most $L$ radial edges between $v \, w$ and using $g_alpha lt.eq g_Q$ proves the lemma. ◻
]

When $f_1 = 0$ and $k = 0$, both choices $a \( y \) = h \( v \) plus.minus 1$ also saturate the edge $y b_1$. The non-tie requirement above repairs this actual triangular obstruction; it is not supplied by the square-lattice facet argument.

=== 3.3 Sparse exceptions and short stationary steps <sparse-exceptions-and-short-stationary-steps>

#thm([Lemma 3.3.])[
  (Zero-pinned sparse blocks).  #emph[For every $rho > 0$ the fixed parameters above and a fixed enlargement $Q_z^(*)$ can be chosen so that the following holds uniformly over zero-pinned finite volumes. Declare every block within a fixed block distance of a pin to be a pin block. Among the remaining blocks declare a block bad when it fails (3.3), the long-distance condition (3.3) on $Q_z^(*)$, or one of the four non-tie tests. Then 
#[#set math.equation(numbering: n => "(3.7)")
 $ bb(P) \( A upright(" is entirely bad") \) lt.eq rho^(\| A \|) $ <f:animal>]

 for every finite set $A$ of block indices. The collar defining pin blocks contains all enlargements $Q_z^(*)$. Fixed finite thickenings of the bad set also satisfy such a bound with an arbitrarily small parameter, after adjusting the initial parameters.]
] <f:sparse>

#proof[
  The controlled-gradient theorem [3] Theorem 1.1, on a graph of maximum degree six with an arbitrary nonempty zero fixed set, states that for distinct edges $e_1 \, dots.h \, e_j$ and $0 < u lt.eq 1 \/ 8$,
  $ bb(P) #scale(x: 120%, y: 120%)[\(] \| nabla_(e_i) h \| gt.eq 1 - u upright(" for all ") i #scale(x: 120%, y: 120%)[\)] lt.eq \( C_6 u \)^(j \/ C_6) . $
  Fix one shortest path for every pair in an enlarged block. A path of length $m$ violating linear slack with $delta_0 = epsilon \/ 2$ has at least $m \/ 2$ gradients of magnitude at least $1 - epsilon$. Choose $epsilon$ sufficiently small to dominate the $2^m$ subsets of this path, then $k_0$ large enough to dominate the polynomial number of pairs. Choose $L$ at a fixed sufficiently large multiple of $k_0 \/ delta_0$, and finally choose $delta$ small enough to dominate the finite edge count. For disjoint enlargements, the edge witnesses are distinct. Apply the controlled-gradient bound to the short-edge and long-path witnesses separately and bound the intersection by the geometric mean of these two bounds. This gives an arbitrarily small product bound for failures of the first two tests.
  For a non-tie test, condition on its enlarged shell. If there is a filling with the stated long slack, fix one such filling and write $x \, y$ for the tested edge. Prescribe its values to be $h \( x \) \, h \( x \) + 1 \/ 2$, or $h \( x \) \, h \( x \) - 1 \/ 2$. The distance of the edge to the shell is a sufficiently large fixed multiple of $1 \/ delta_0$; long slack and the triangle inequality make both prescriptions compatible with the shell. Upper-cone extension produces two feasible fillings. Contracting the entire conditional body toward either filling with ratio $1 \/ 4$ gives a volume fraction $4^(- m)$ in each of the difference intervals $\[ 1 \/ 8 \, 5 \/ 8 \]$ and $\[ - 5 \/ 8 \, - 1 \/ 8 \]$, where $m$ is the fixed number of free coordinates. The difference marginal is log-concave. A one-dimensional log-concave density placing a fixed positive mass in these separated intervals has bounded supremum: its half-height points lie within $2 \/ sup f$ of a mode, and concavity of $log f$ bounds the farther tails exponentially. Consequently
  $ bb(P) #scale(x: 120%, y: 120%)[\(] \| h \( x \) - h \( y \) \| < s_0 \, med upright("long slack") divides upright("shell") #scale(x: 120%, y: 120%)[\)] lt.eq C_L s_0 . $
  If no long-slack filling exists the event is empty. Conditional laws in disjoint enlarged interiors are independent given their complement. Choosing $s_0$ small, combining the possible witnesses, and coloring the block grid by finitely many residue classes proves (3.7). For a fixed thickening, extract a separated positive fraction of witnesses in the original set; the same counting proves the last assertion. ◻
]

#thm([Lemma 3.4.])[
  (Stationary step displacement).  #emph[Let $\( H_t \)_(0 lt.eq t lt.eq T)$ be a stationary reversible normally reflected diffusion in a finite convex polytope, with Brownian covariance $2 I$ and invariant uniform law. The same assertion holds with constant drift $b$ and invariant density proportional to $e^(b dot.op h)$. For distinct free coordinates $x_1 \, dots.h \, x_j$, 
#[#set math.equation(numbering: n => "(3.8)")
 $ bb(P) (sup_(t lt.eq T) \| H_t \( x_i \) - H_0 \( x_i \) \| > r upright(" for all ") i) lt.eq #scale(x: 120%, y: 120%)[\(] C e^(- r^2 \/ \( C T \)) #scale(x: 120%, y: 120%)[\)]^(j \/ 2) . $ <f:step-tail>]

 Thus the zero-pinned good-block conditions persist with relaxed fixed constants throughout a sufficiently short step, apart from arbitrarily sparse exceptional blocks. The same implication holds for any other stationary constrained law for which the initial block tests have the joint sparse bound.]
] <f:step>

#proof[
  Normal reflection has a forward Brownian martingale part and a finite-variation part consisting of boundary reflection and any constant drift. Reversibility gives the same decomposition backwards from $T$. Adding the forward increment and the negative reversed increment cancels the finite-variation terms, so each coordinate displacement is half the sum of the corresponding forward and reversed martingale increments. Each of the two martingale vectors has independent variance-two Brownian coordinates, although the two vectors need not be independent. If all $j$ coordinate displacements exceed $r$, at least $j \/ 2$ are witnessed in one of the two directions. A union over subsets and the Brownian maximal inequality prove (3.8). A failed block persistence test is witnessed by a coordinate displacement exceeding a fixed constant. Separated blocks have distinct witnesses; their finite coordinate count is absorbed by taking $T$ smaller. Edge slack, long-distance slack, and non-ties all persist once their two endpoint displacements are below the appropriate fixed fraction of their original margins. ◻
]

=== 3.4 Filling holes and testing macroscopic averages <filling-holes-and-testing-macroscopic-averages>

We next isolate the deterministic geometry. It is valid for comparison fields as well as the displacements of shell data used below.

#thm([Lemma 3.5.])[
  (Sparse-hole extension).  #emph[Let a random bad set on the square grid satisfy (3.7) with sufficiently small parameter. Fill the bounded complementary components of each bad star-connected cluster and retain its outermost filled hulls. A fixed layer of enlargement is allowed. There is an extension procedure which, for a field $u$ on good sites, fills each hole by its value at one surrounding good site. Here good sites lie outside the filled holes and good edges join neighboring good sites. Write $v$ for the resulting field. A hole is incident to $z$ if it contains $z$ or a neighbor of $z$; let $d_z$ be the largest diameter of an incident hole, zero if none, and put $d_e = max \( d_x \, d_y \)$ for $e = { x \, y }$. Uniformly in deterministic $z$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ bb(P) \( d_z gt.eq r \) lt.eq C e^(- c r) . $ <f:hole-tail>]

 For every $1 < p < 2$, on a square of side $N$ with a fixed larger buffer, 
#[#set math.equation(numbering: n => "(3.10)")
 $ parallel nabla v parallel_(ell^p) lt.eq E^(1 \/ 2) (sum_e W_e^(2 \/ \( 2 - p \)) a_e^(- p \/ \( 2 - p \)))^(\( 2 - p \) \/ \( 2 p \)) \, quad W_e lt.eq C_p \( 1 + d_e \)^(2 p) \, $ <f:hole-weighted>]

 where $E = sum_(e upright(" good")) a_e \| nabla u \( e \) \|^2$, $a_e > 0$. In particular, bounded spatial moments of sufficiently high powers of $d_e$ and $a_e^(- 1)$ imply 
#[#set math.equation(numbering: n => "(3.11)")
 $ parallel nabla v parallel_(ell^p) lt.eq C N^(2 \/ p - 1) sqrt(E) . $ <f:hole-scaled>]

 If $u$ is the restriction of a globally $K$-Lipschitz field on the grid, then $\| u \( z \) - v \( z \) \| lt.eq C K \( 1 + d_z \)$.]
  #emph[For every fixed $q \, D < oo$, the spatial average of $\( 1 + d_z \)^q$ in a square of side $N$ is bounded by a deterministic constant outside an event of probability $O \( N^(- D) \)$. In a box of side $n$, these bounds hold simultaneously on all subboxes of radius at least $n^(1 \/ 2)$, after altering the failure exponent. Filling can be chosen equivariantly under translations of the block grid. No reciprocal-weight assertion follows from sparsity alone; those moments are separate hypotheses in (3.10).]
] <f:hole>

#proof[
  Follow the filled outer grid contour of a hole and its exterior good rim. After a fixed thickening this gives nearest-neighbor rim paths. A hole of diameter $d$ has at most $C \( d + 1 \)^2$ vertices and boundary edges, and any required rim path has at most that length. Choose the lexicographically first rim site as the filling value. For an edge entering a hole, telescope along its rim; the inequality $\| sum_(i = 1)^m t_i \|^p lt.eq m^(p - 1) sum_i \| t_i \|^p$, followed by the boundary-edge count, gives
  $ sum \| nabla v \|^p lt.eq sum_(e upright(" good")) W_e \| nabla u \( e \) \|^p \, #h(2em) W_e lt.eq C_p \( 1 + d_e \)^(2 p) . $
  Outer rims have bounded overlap. Holder with exponents $2 \/ p$ and $2 \/ \( 2 - p \)$ gives (3.10). For unweighted energy the required hole exponent is $4 p \/ \( 2 - p \)$; in the weighted case another Holder inequality separates the hole and reciprocal-weight moments. A hole filling value lies within distance $C \( d + 1 \)$ of each of its sites, proving the pointwise error.
  If a deterministic site belongs to a hull of diameter at least $r$, a bad star-animal of size $m gt.eq c r$ has a vertex within $C m$ of it. There are $O \( m^2 \)$ root choices and at most $C_0^m$ such animals. Applying (3.7), or extracting a fixed-fraction separated subset before doing so, proves (3.9). In particular all fixed moments have uniformly bounded expectations.
  Here is the stronger spatial statement. Clusters with size in $\[ k \, 2 k \)$ contribute at most $C k^(q + 2)$ each to the sum of hole moments. For $r$ disjoint such cluster witnesses in an $O \( N \)$ box, root and animal counting and (3.7) bound the probability by
  $ frac(\( C N^2 \)^r, r !) C_0^(2 k r) rho^(c k r) lt.eq (C N^2 / r e^(- c' k))^r . $
  For all sufficiently large fixed $k$, take $r = ceil.l N^2 k^(- \( q + 4 \)) ceil.r$. For $k lt.eq A log N$ and large $N$, the resulting bound is
  $ exp \( - c N^2 \/ k^(q + 3) \) . $
  Larger clusters occur with probability at most $C N^2 e^(- c A log N)$, which is $O \( N^(- D) \)$ by choosing $A$ large. On all dyadic size ranges the resulting contribution to $N^(- 2) sum_z \( 1 + d_z \)^q$ is summable; clusters below the fixed cutoff give a fixed deterministic bound. This proves the assertion. The same argument excludes holes crossing the macroscopic buffer, and a union over the polynomially many subboxes proves the stated simultaneous version. Lexicographic selection commutes with translation; a random grid phase can be adjoined when invariance under single lattice steps is desired. ◻
]

#thm([Lemma 3.6.])[
  (Discrete trace against a spread measure).  #emph[Let $nu$ be a positive measure of bounded mass in a square of side $O \( N \)$, and assume $nu \( B \( x \, r \) \) lt.eq C \( \( r + 1 \) \/ N \)^alpha$ for $0 lt.eq r lt.eq C N$. If $1 < p < 2$ and $alpha > 2 - p$, then 
$ \| nu \( v \) - nu \( 1 \) overline(v) \| lt.eq C N^(1 - 2 \/ p) parallel nabla v parallel_(ell^p) \, $

 where $overline(v)$ is the ordinary average over that square.]
] <f:trace-average>

#proof[
  Discrete $L^1$ Poincare on successive dyadic squares, clipped to the ambient square at its boundary, gives
  $ \| v \( x \) - overline(v) \| lt.eq C sum_e frac(\| nabla v \( e \) \|, 1 + "dist" \( x \, e \)) . $
  For $p' = p \/ \( p - 1 \)$, a dyadic contribution to the averaged kernel is $F_r \( e \) = C r^(- 1) nu \( B \( e \, C r \) \)$. Its supremum is at most $C N^(- alpha) r^(alpha - 1)$ and its $ell^1$ norm at most $C r$. Thus
  $ parallel F_r parallel_(ell^(p')) lt.eq C N^(- alpha \/ p) r^(1 + \( alpha - 2 \) \/ p) . $
  The dyadic series is bounded by $C N^(1 - 2 \/ p)$ precisely under the stated strict inequality on $alpha$. Holder finishes the proof. ◻
]

A connected set of coarse pins of diameter at least $c N$ carries a deterministic probability measure $nu$ with the preceding ball bound for $alpha = 1$: choose a coordinate projection of length at least $c' N$ and one pin site over each attained integer coordinate. Connectivity ensures there are no missing intermediate coordinates. Equal weights on the chosen sites have ball masses at most $C \( r + 1 \) \/ N$.

#thm([Lemma 3.7.])[
  (Uniform average coercivity).  #emph[Suppose $X$ is globally $K$-Lipschitz on the block grid, with fixed $K$. Suppose either $u = X$, or $u = T_M \( X \)$ for fixed $T_M \( t \) = "sign" \( t \) \( \| t \| - M \)_(+)$. Let $E = sum_(e upright(" good")) \| nabla u \( e \) \|^2$. For deterministic weights $w$ supported in an $O \( N \)$ square with $sum \| w \| lt.eq C$ and $max \| w \| lt.eq C N^(- 2)$, assume either $sum w = 0$, or $u = 0$ on a connected deterministic coarse pin set of diameter comparable to $N$ at distance $O \( N \)$. There is an event of probability at least $1 \/ 2$, determined only by the bad set, on which simultaneously for every such field $X$, 
#[#set math.equation(numbering: n => "(3.12)")
 $ lr(|sum_z w_z X_z|) lt.eq C_0 + C_1 sqrt(E) . $ <f:coercivity>]

]
] <f:average-coercivity>

#proof[
  Use Lemma 6 with $p = 3 \/ 2$. A Markov bound on the twelfth spatial hole moment, and exclusion of holes crossing a fixed buffer, give $parallel nabla v parallel_(3 \/ 2) lt.eq C N^(1 \/ 3) sqrt(E)$. The filling error tested against $\| w \|$ is bounded by the same spatial moment. In the anchored case choose the deterministic pin measure $nu$ just constructed. Although filling may overwrite a pin value, the Lipschitz bound gives
  $ \| nu \( v \) \| lt.eq C K sum_z nu \( z \) \( 1 + d_z \) . $
  The right side has bounded expectation by (3.9); another Markov bound makes it a fixed constant. Applying Lemma 7 to $nu$ and $\| w \|$ proves (3.12). In the zero-mass case the ordinary mean cancels and no pin measure is needed. The truncation error is at most $M sum \| w \|$. Choose the two moment thresholds so their failure probabilities sum to at most $1 \/ 4$; the buffer event has failure at most $1 \/ 4$ for large $N$. Bounded $N$ is absorbed by deterministic Lipschitzness and the anchor or zero-mass condition. All error bounds depend on hole sizes rather than on $X$, which proves the simultaneous assertion. ◻
]

This last lemma is an unscaled estimate. Its bounded additive error on the pin set does not assert convergence to zero Sobolev trace in a later rescaled limit.

=== 3.5 From deficits to an exponential moment <from-deficits-to-an-exponential-moment>

#proof[
  For $R \/ L$ large integrate the interiors of pin-free blocks in a fixed large box around the statistic and its anchor. Retain all other vertices, including every vertex of pin blocks, and write $s$ for their heights. The unnormalized marginal density is exactly
  #[#set math.equation(numbering: n => "(3.13)")
   $ p \( s \) = upright(bold(1))_(cal(A)) \( s \) product_Q e^(F_Q \( s \|_(partial Q) \)) \, $ <f:product>]
  where $cal(A)$ imposes the remaining edge constraints. This density is even, log-concave, compactly supported, and upper semicontinuous. Let $Z = integral p > 0$.
  For feasible $s plus.minus chi$ with positive density, put $X_z = chi \( v_z \)$ at a fixed face-center representative of each block. The difference of any two full endpoint fillings, divided by two, extends $chi$ as a 1-Lipschitz field vanishing on pins. Consequently neighboring $X$ values differ by at most $C L$. Choose $M$ above the distance of every representative and shared face center in or next to a pin block to a pin, and use $u = T_M \( X \)$. It vanishes on pin blocks. For neighboring ordinary good blocks $z \, w$, their common face center and Lemma 3 give
  $ \| u_z - u_w \|^2 lt.eq 2 c_(*)^(- 1) \( g_z + g_w \) . $
  For a good block next to a pin block, the common face center $f$ satisfies $\| chi \( f \) \| lt.eq M$, so $\| u_z \|^2 lt.eq \| chi \( v_z \) - chi \( f \) \|^2 lt.eq g_z \/ c_(*)$. Treating pin blocks as good zero blocks therefore gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_(e upright(" good")) \| nabla u \( e \) \|^2 lt.eq C sum_Q g_Q . $ <f:energy-deficits>]
  Partition vertices into half-open blocks and replace the statistic by the retained linear functional $ell \( s \) = sum_z w_z s \( v_z \)$, where $w_z = sum_(x upright(" in block ") z) q_x$. On every original configuration,
  #[#set math.equation(numbering: n => "(3.15)")
   $ lr(|sum_x q_x h \( x \) - ell \( s \)|) lt.eq C L sum_x \| q_x \| . $ <f:representative-error>]
  The coarse weights satisfy the hypotheses of Lemma 8, and exact zero mass is preserved. That lemma and (3.14) show, on a full-configuration event of probability at least $1 \/ 2$, simultaneously for every feasible $chi$,
  $ \| ell \( chi \) \| lt.eq C_0 + C_2 sqrt(sum_Q g_Q) . $
  Take fixed $t > C_0$ and $D = \( \( t - C_0 \) \/ C_2 \)^2 > 0$. Since the logarithmic midpoint deficit of (3.13) is $sum_Q g_Q$, it follows that
  #[#set math.equation(numbering: n => "(3.16)")
   $ sqrt(p \( s + chi \) p \( s - chi \)) lt.eq e^(- D) p \( s \) quad upright("whenever ") ell \( chi \) = t . $ <f:pointwise-overlap>]
  Define $A_t \( s \) = sup_(ell \( chi \) = t) sqrt(p \( s + chi \) p \( s - chi \))$. Compactness of the support restricts the supremum to a compact set; upper semicontinuity gives measurability. Log-concavity implies $0 lt.eq A_t lt.eq p$. The good event may depend on discarded midpoint coordinates: the simultaneous assertion (3.16) still holds for its retained vector. Thus
  $ Z^(- 1) integral A_t lt.eq 1 - rho_0 \, #h(2em) rho_0 = \( 1 - e^(- D) \) \/ 2 > 0 . $
  If $ell$ is zero on the free coordinates there is nothing to prove. Otherwise choose linear coordinates $s = \( r \, sigma \)$ with $r = ell \( s \)$, absorbing their constant Jacobian into the complementary measure. For the density $a \( r \)$ of $ell \( S \)$, Prékopa–Leindler in $sigma$ [10] Theorems 3 and 6 gives
  $ sqrt(a \( r - t \) a \( r + t \)) lt.eq Z^(- 1) integral A_t \( r \, sigma \) thin upright(d) sigma . $
  Integrating yields overlap at most $1 - rho_0$. Since $a$ is even and log-concave, this overlap is at least $integral min { a \( r - t \) \, a \( r + t \) } thin upright(d) r = 1 - integral_(- t)^t a$. Hence $bb(P) \( \| ell \( S \) \| lt.eq t \) gt.eq rho_0$. Its survival function is log-concave, again by Prekopa–Leindler, so
  $ bb(P) \( \| ell \( S \) \| > j t \) lt.eq \( 1 - rho_0 \)^j quad \( j gt.eq 1 \) . $
  This gives a positive uniform exponential moment. Equation (3.15) transfers it to the original statistic. For bounded $R \/ L$, distance to the anchor, or cancellation of $q$, gives the required deterministic bound. ◻
]

=== 3.6 Bounded values, sign constraints, and small tilts <bounded-values-sign-constraints-and-small-tilts>

#thm([Lemma 3.8.])[
  (One-sample bounded-data comparison).  #emph[There is a coupling of $h_b tilde.op mu_b$ and one sample $h_0 tilde.op mu_0$ with $\| h_b - h_0 \| lt.eq B$ at every vertex, whenever $\| b \| lt.eq B$. Consequently Proposition 2 holds for bounded data and their admissible mixtures.]
] <f:bounded>

#proof[
  Run monotone single-site uniform heat baths with common update variables for pin values $- B \, b \, + B$. The two extreme chains can be maintained as exact translates, since their conditional intervals are translates. The middle chain remains between them: both endpoints of a conditional interval are increasing functions of the neighboring heights. A stationary subsequential coupling on the finite compact polytopes gives the asserted coupling with the uniform marginals. Each tested statistic changes by at most $B sum \| q_x \|$. Condition first on mixed pin values and integrate the same uniform bound. ◻
]

A string here is a prescribed set of positive or negative sites, each having an oppositely prescribed neighbor. Thus its heights lie in $\[ - 1 \, 1 \]$. Additional intervals $0 lt.eq h lt.eq epsilon$ on positive string sites are allowed. After all string values are frozen, the remaining conditional law is uniform on the corresponding Lipschitz polytope. Lemma 9 therefore proves the moment assertion with $B = 1$ on each component, provided the anchor or zero-mass hypotheses are checked for the tested statistic. A finite collection of components can instead be considered together with the common pinned set. Cutting along pins and zero-extending the zero-pinned comparison use the ambient lattice; neither operation requires a regular shape for the boundary.

The same comparison transfers long-distance slack from zero pins to bounded data at additive cost $2 B$. At distances beyond a sufficiently large fixed threshold this is absorbed into a relaxed linear slack. It does not transfer microscopic strict gradients by itself.

#thm([Lemma 3.9.])[
  (Small linear tilts).  #emph[Under Proposition 2, let $Y = sum_x b_x h \( x \)$, with support in an $O \( R \)$ box and $\| b_x \| lt.eq c R^(- 2)$. Assume its box has the specified connected pin anchor, or that $sum_x b_x = 0$. For sufficiently small fixed $c > 0$, the tilted density $e^Y \/ bb(E) e^Y$ has uniformly bounded $L^2$ norm. Hence for every event $A$, 
$ bb(P)_Y \( A \) lt.eq C bb(P) \( A \)^(1 \/ 2) . $

 All fixed moments of admissible average statistics remain bounded under this tilt, and any established arbitrary-parameter animal estimate is inherited, with a harmless constant prefactor and changed parameter.]
] <f:tilts>

#proof[
  Apply (3.2) to $Y \/ c$ to bound $bb(E) e^(2 Y)$, and use Jensen together with the uniform bound on $\| bb(E) Y \|$ to bound $bb(E) e^Y$ away from zero. Cauchy–Schwarz gives the assertions; for moments apply it with the square of the desired moment. Multiple bounded tests can be combined by Holder and a further reduction of $c$. ◻
]

#thm([Lemma 3.10.])[
  (Strict filling with sign intervals).  #emph[In a finite patch, prescribe arbitrary shell values, interior fixed pins in $\[ - 1 \/ 2 \, 1 \/ 2 \]$, and intervals containing zero at any other prescribed vertices. The intervals may be one-sided or of the form $\[ 0 \, epsilon \]$. Suppose a feasible filling $h$ satisfies 
#[#set math.equation(numbering: n => "(3.17)")
 $ \| h \( x \) - b \( s \) \| lt.eq "dist" \( x \, s \) - 2 $ <f:shell-room>]

 for every movable endpoint $x$ of a tested central edge and every shell vertex $s$. If the edge is not fixed–fixed, there is a feasible filling whose absolute gradient on that edge is at most $1 \/ 2$.]
] <f:strict-filling>

#proof[
  Recall the interval extension criterion. Data $\[ alpha_z \, beta_z \]$ at specified vertices admit a 1-Lipschitz selection exactly when $alpha_z lt.eq beta_w + "dist" \( z \, w \)$ for every pair. Sufficiency follows from the lower-cone function $g \( y \) = sup_z { alpha_z - "dist" \( z \, y \) }$, which is Lipschitz, lies above every lower endpoint and below every upper endpoint. Infinite interval endpoints are omitted from the corresponding bound.
  At a movable vertex $x$, the intervals propagated from all non-shell data contain both $h \( x \)$ and zero. Indeed feasibility gives the first assertion. For a nonfixed interval datum the second follows because its interval contains zero. For a fixed pin $p$, its distance to $x$ is at least one, whereas $\| h \( p \) \| lt.eq 1 \/ 2$, so its propagated interval contains zero as well. The datum at $x$ itself, if present, also contains zero.
  If both endpoints $u \, v$ are movable, put $c = "median" \( 0 \, h \( u \) \, h \( v \) \)$ and prescribe $g \( u \) = g \( v \) = c$. The value $c$ lies between zero and each old endpoint value; thus it respects every propagated non-shell interval at both endpoints. Moreover $\| c - h \( u \) \| \, \| c - h \( v \) \| lt.eq \| h \( u \) - h \( v \) \| lt.eq 1$. Equation (3.17) preserves all endpoint–shell inequalities. The new endpoint pair has difference zero, and every pair among the old data was already consistent. The interval criterion therefore extends the new prescriptions to a feasible filling.
  If one endpoint is a fixed pin, prescribe zero at the other endpoint. Its original height has absolute value at most $3 \/ 2$, so (3.17) again preserves all shell inequalities. The propagated non-shell intervals contain zero, and the resulting edge gradient has absolute value at most $1 \/ 2$. Apply the same extension criterion. ◻
]

#thm([Corollary 3.11.])[
  (Sparse contacts with signs).  #emph[Fix a domain, fixed pin values in $\[ - 1 \/ 2 \, 1 \/ 2 \]$, and deterministic sign strings as described above, allowing additional intervals $\[ 0 \, epsilon \]$. For every prescribed animal parameter there are a fixed box size and $s > 0$ such that, except on a bad set with that animal bound, the tested central edges involving nonfixed vertices have $\| nabla h \| lt.eq 1 - s$. String sites are included among the nonfixed vertices. Long-distance slack and this edge slack persist with relaxed constants during a sufficiently short stationary reflected step. Constants are uniform over the strings’ shape and over the positive interval lengths.]
] <f:conditioned-sparse>

#proof[
  First freeze all string values, making them pins in $\[ - 1 \, 1 \]$. Lemma 9 couples the conditional field within coordinatewise distance one of the corresponding zero-pinned field. The controlled-gradient witness argument gives arbitrary-parameter long-distance slack, with the additive comparison loss absorbed by increasing its fixed threshold. This bound is uniform over the conditioned string values, so integrating preserves its joint form.
  Now condition only on the exterior of each enlarged patch; its interior strings remain variable. On a shell for which a filling has the preceding long slack, central endpoints satisfy (3.17). Apply Lemma 11. If the conditional body has dimension $m$, contraction toward its strict filling with ratio $1 - 2 s$ sends the entire body into ${ \| nabla h \| lt.eq 1 - s }$. Therefore the conditional relative volume of the near-contact region is at most $1 - \( 1 - 2 s \)^m lt.eq 2 m s$. This remains true for arbitrarily thin sign intervals; their effect on the body’s total volume cancels in the relative-volume estimate. Degenerate prescribed intervals are treated as fixed coordinates.
  For disjoint enlarged patches the conditional laws are independent. For a specified collection of bad boxes, either at least half have long-slack failures, or at least half have near contacts with good long slack. The joint bounds just proved apply to these two alternatives; the subset count is absorbed by choosing the preliminary parameters and then $s$ small enough. A finite coloring removes the separation restriction. Lemma 5 gives the short-step statement. The tilt transfer, when its statistic meets the anchored or zero-mass hypotheses, is Lemma 10. ◻
]

#prodef([Remark 3.12.])[
  (Fixed values after further reveals).  The strict-filling proof uses the numerical bound $1 \/ 2$ on fixed interior pins and uses intervals containing zero on movable sign sites. After additional values are frozen, these hypotheses must be checked again. In particular, arbitrary revealed values in $\[ - 1 \, 1 \]$ cannot be substituted for the fixed $\[ - 1 \/ 2 \, 1 \/ 2 \]$ pins in Lemma 11. Uniform quenched contact sparsity under such reveals is not asserted. The adapted comparisons below instead use the annealed marginal-preservation argument of Lemma 16, with good marks recomputed after rejoining.
] <f:reveal-obligation>

=== 3.7 Distributional tightness and conditioning scope <distributional-tightness-and-conditioning-scope>

#thm([Corollary 3.13.])[
  (Negative Sobolev tightness).  #emph[Suppose the rescaled free sets lie in a fixed bounded box, their exterior data are bounded, and a connected exterior pin set of macroscopic diameter is available in a fixed larger box. The centered fields, made constant on fundamental lattice cells of mesh $n^(- 1)$ and extended by zero outside, are tight in $H^(- s)$ on a fixed surrounding torus for every $s > 0$.]
] <f:tightness>

#proof[
  Embed the lattice cells in a dyadic coordinate square with $2^J$ cells on each side, where $2^J$ is comparable to $n$. Its physical size remains bounded above and below. Expand the piecewise constant field in the orthonormal two-dimensional Haar basis; the expansion terminates at the cell scale. A Haar coefficient on a cell of physical side $r = R \/ n$ is $r$ times a statistic satisfying (3.1) and having exactly zero total mass. For zero pins the tests include all ambient lattice vertices, including the zero extension, so this cancellation also holds across the boundary. Bounded data differ from the same zero-pinned sample by a uniformly bounded field. Proposition 2 consequently gives a second moment at most $C r^2$ for each centered coefficient. The coarse scaling coefficient is bounded by the anchored assertion.
  Write $F_j$ for the sum of wavelets at level $j$. There are $O \( r_j^(- 2) \)$ coefficients there, so $bb(E) parallel F_j parallel_2^2 lt.eq C$. Each parent-cell integral of $F_j$ vanishes. For $0 < t lt.eq 1$, fractional Poincare on the parent cells and duality give
  $ parallel F_j parallel_(H^(- t)) lt.eq C r_j^t parallel F_j parallel_2 . $
  Minkowski in $L^2 \( bb(P) \; H^(- t) \)$ and the geometric sum of $r_j^t$ give a uniform second moment in $H^(- t)$. Choose $0 < t < s$ and use compactness of its embedding into $H^(- s)$ on the fixed torus. ◻
]

For affine interpolation on full lattice triangles the same conclusion holds. Its nodal basis and the fundamental-cell constant basis have equal mass, bounded overlap, and supports at distance $O \( n^(- 1) \)$ from the node. Testing their difference against $H^1$ functions gives an $H^(- 1)$ error at most $C n^(- 1)$ times the piecewise constant $L^2$ norm; interpolation gives $C n^(- t)$ for $0 < t lt.eq 1$. Haar orthogonality in the preceding proof gives $bb(E) parallel h - bb(E) h parallel_2^2 lt.eq C \( 1 + log n \)$, so this error tends to zero in every $H^(- t)$ with $t > 0$. When interpolation is restricted to a polygon, the boundary-cell contribution must also have vanishing area; this holds for the stated smooth-domain approximation and bounded heights adjacent to its fixed boundary.

Finally, all conditioning statements above specify the resulting kernel. If a random exploration followed by freezing preserves a marginal law, the corresponding annealed estimates are inherited by that marginal. This does not give the same estimates uniformly for each realized revealed set and every realized revealed value. Any later use of a quenched bound must separately verify the fixed-value, geometric, and conditional-law hypotheses of the result being invoked.

== 4 Stationary Reflected Comparisons <s:coupling>

We prove the local comparison estimate used to pass from the constrained microscopic dynamics to a continuum equation. The input consists of the sparse-box estimates 4 and 12, the extension over their holes in 6, and the average bounds in 2. The principal new point is a lower bound on dissipation obtained by forcing a contact inside a fixed box. Its constants remain uniform when a constraint becomes redundant, and after adapted exact-value observations.

=== 4.1 Experiments and the comparison statement <experiments-and-the-comparison-statement>

We use the unit triangular lattice, with macroscopic scale $n$. Write $Q_r = x_0 + \[ - r n \, r n \]^2$, using any fixed pair of lattice coordinates, and $hat(Q)_r = n^(- 1) Q_r$ for its scaled version. For a vertex function, $integral_(n \, Q) F = n^(- 2) sum_(x in Q) F \( x \)$; for an edge function the same notation sums over unoriented lattice edges with midpoint in $Q$. Omitting $Q$ means the currently specified localization box. Constants may depend on fixed box ratios but not on $n$ or on the diameter of the ambient finite domain. After choosing an orientation $e = \( x \, y \)$, a lattice gradient is the unscaled difference $nabla_e f = f \( y \) - f \( x \)$. The notation $bb(P)_(upright("vol"))$ denotes the annealed law obtained by first sampling the experiment and then an independent uniform vertex in the indicated box, or an independent uniform edge for an edge quantity. In a vertex-sampled gradient one fixes a lattice step $upright(bold(e))$ and uses the edge $\( X_n \, X_n + upright(bold(e)) \)$.

An experiment starts with two finite-volume Lipschitz fields. Each has bounded Dirichlet data and finitely many prescribed sign strings of the type covered by 4 and 2. On the common free graph in $Q_2$ their individual sign walls, when present, agree. We allow the following additional observations. Starting from independent samples, an algorithm queries both heights at a common sequence of vertices, with each query and its stopping decision determined by the previous answers and independent auxiliary randomness. Conditional on the complete transcript, the queried heights are fixed. The two remaining conditional laws are then put in a stationary synchronous joining. All estimates for such an experiment are averaged over the original transcript as well as the joining. The phrase “uniform in the observations” below has this annealed meaning; it does not mean uniform over every possible exact-height transcript.

We also allow jointly sampled boundary data when, conditional on those data, the two interiors have their specified Gibbs kernels. Replacing their conditional product by a stationary synchronous joining must preserve each annealed marginal. The sparse-contact and average bounds are required for those annealed marginals, with the same constants as in the theorem below. This includes coupled random pins; it does not assert a quenched estimate for an arbitrary realized pin vector. The fixed set and the component on which a kernel is sampled may be part of these recorded data. For example, a zero-pinned kernel on a recorded component has the required bounds uniformly in that component, provided its tested averages have the stipulated anchor. Its mixture therefore has the same bounds. The other marginal must still satisfy its own annealed estimates; selecting a component supplies no such estimate by itself.

Let $P$ be the common fixed set in $Q_2$ and let $S$ be the set of common individual sign walls. At time $t$ write $z_t = h_t - tilde(h)_t$. For constants $a lt.eq b$, if $a lt.eq z \|_P lt.eq b$, set

#[#set math.equation(numbering: n => "(4.1)")
 $ u_t^(+) = \( z_t - b \)_(+) \, #h(2em) u_t^(-) = \( a - z_t \)_(+) . $ <c:tails>]

These functions have zero fixed input on $P$. When $S$ is nonempty we take $a = b = 0$ and use the two tails of $z$; square penalties at $S$ will anchor their sum. In a region with no observations, we can instead use $z$ modulo a spatial constant. Boundaries of $Q_2$ are artificial: conditions outside that box need not agree.

The local average bounds required below are precisely those supplied by 2: averages of both marginals are bounded in every fixed moment on the scale of $Q_2$ and its fixed-fraction subboxes, or differences of equal-mass averages are so bounded in the free, centered case. The constants for subbox side $ell n$ may grow polynomially in $ell^(- 1)$. For an adapted experiment these bounds concern the original marginal laws; the conditioning argument below transfers them to the joined fields. In a one-sided experiment we only require $z \|_P gt.eq a$, and use $u^(-)$. An observed boundary is #emph[controlled for the lower tail] if its fixed values satisfy $z gt.eq a$; for the upper tail the condition is $z lt.eq b$. When extending a tail by zero behind such a boundary, we mean the side removed from the common free graph, whose edges to the retained side all pass through that observed boundary. An #emph[uncontrolled seed] is a prescribed initial queried set on which no such inequality is assumed. Any uncontrolled seed or other uncontrolled boundary must remain a fixed positive scaled distance from the box on which an estimate is asserted.

For a fixed step length $T$ and contact tolerance $delta > 0$, a #emph[transmission edge] is a free–free lattice edge whose constraint has slack at most $delta$ at some time in $\[ 0 \, T \]$ in either replica. The components of their union on the free vertices, including singletons, are the transmission clusters. Write $C_x$ for the cluster containing $x$ and $H_x = \| C_x \|$; also write $H_C = \| C \|$. Contacts with fixed vertices or individual walls supply boundary input to a cluster and do not connect clusters through a fixed vertex. For a zero-drift cluster with zero tail input, its square dissipation is

$ D_C = sum_(x in C) u_0 \( x \)^2 - sum_(x in C) u_T \( x \)^2 . $

For two tails their dissipations are added. With drift, $D_C$ means the sum of the nonnegative square losses at projection substeps, with the source contribution kept separately. Lemma 18 proves nonnegativity and the projection interpretation. Dissipation sums concern clusters insulated from uncontrolled data; the remaining clusters contribute the localization errors estimated below. The theorem chooses $T$ and $delta$ through its fixed testing parameters.

#thm([Theorem 4.1.])[
  (Local reflected comparison).  #emph[Consider the experiments just specified, with $\| a \| + \| b \|$ bounded. Assume the conclusions of 12, 6, and 2 for their original marginal laws. Individual reflecting constraints are ordinary one-sided sign walls, not pairs $0 lt.eq h_x lt.eq epsilon$ with $epsilon$ allowed to tend to zero. Fix $0 < r < R < 2$, $1 < p < 2$, and a desired defect parameter $rho > 0$. There are fixed testing parameters, a step length $T_rho > 0$, good edges $G_n$ and good wall sites $S_n^(upright(g))$, and positive weights $w_e \, w_x lt.eq 1$ with the following properties.]
  #emph[For either tail in (4.1), or for their signed difference, let 
#[#set math.equation(numbering: n => "(4.2)")
 $ cal(E)_n \( Q \) = sum_(e in G_n \, med e subset Q) w_e \| nabla_e u_0 \|^2 + sum_(x in S_n^(upright(g)) ∩ Q) w_x \| u_0 \( x \) \|^2 . $ <c:energy>]

 In the two-tail statement the energies are added. In a free comparison the energy is that of $z$ and there is no wall sum. Then 
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) cal(E)_n \( Q_r \) lt.eq C \, #h(2em) bb(E) sum_(C : thin C ∩ Q_r eq.not diameter) D_C lt.eq C . $ <c:energy-bound>]

 Here $C$ and $D_C$ have the preceding step-cluster meaning. The constants in (4.3) may depend on $rho \, p \, r \, R$ and the average bounds. Defective boxes satisfy the prescribed sparse-animal bound. For every fixed $q < oo$ and $A < oo$, the normalized spatial sums of $w^(- q)$, cluster-size moments, and hole-diameter moments are bounded by deterministic constants outside an event of probability $O \( n^(- A) \)$. The relevant finite collection of moment orders can be chosen in advance.]
  #emph[Let $U_n$ be the extension over holes supplied by 6, with a fixed choice of the testing parameters. It can be set to zero on the exceptional event. In scaled coordinates, 
#[#set math.equation(numbering: n => "(4.4)")
 $ bb(E) parallel U_n parallel_(W^(1 \, p) \( n^(- 1) Q_r \))^2 lt.eq C \, #h(2em) bb(E) integral_(n \, Q_r) \| U_n - u_0 \| arrow.r 0 . $ <c:compactness>]

 In a free comparison subtract a local cutoff-weighted average from both $U_n$ and $z_0$. Its gradient and dissipation estimates are unchanged. All these centered estimates are uniform in the size of the ambient domain. The same bounds hold for a rough one-sided adapted experiment with only $z \|_P gt.eq a$, for $u^(-) = \( a - z \)_(+)$, and with zero extension behind a controlled observed boundary. They hold uniformly after replacing $z$ by $z \/ K$, $K gt.eq 1$, with bounded rescaled thresholds.]
  #emph[#emph[Threshold-uniform specialization.] In the one-sided case, for each threshold $a$ satisfying the required condition $z \|_P gt.eq a$, the weights may be chosen independently of $a$. With the original marginal moment bounds fixed, 
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) cal(E)_n #scale(x: 120%, y: 120%)[\(] \( a - z \)_(+) \; Q_r #scale(x: 120%, y: 120%)[\)] + bb(E) parallel U_n^(\( a \)) parallel_(W^(1 \, p) \( n^(- 1) Q_r \))^2 lt.eq C_0 \( 1 + a^2 \) . $ <c:threshold-scaling>]

 Thus, when $a = K gt.eq 1$ and the observed values satisfy $z \|_P gt.eq K$, the energy and squared Sobolev norm of $\( 1 - z \/ K \)_(+)$ are bounded by $2 C_0$, uniformly in $K$.]
  #emph[For an ordinary simply connected polygon domain with identical fixed boundary data, the exterior-preserving construction in Lemma 21 gives a bounded $W^(1 \, p) \( bb(R)^2 \)$ extension which is exactly zero outside the lattice polygon. This construction uses connectivity of its zero exterior; it is not asserted for an arbitrary disconnected internal observed set.]
  #emph[If $Q_R$ has no observations or individual walls, and $X_n$ is sampled from normalized ambient volume in $Q_r$, then $n nabla_(\( X_n \, X_n + upright(bold(e)) \)) z_0$ for each fixed lattice step $upright(bold(e))$, $n \( z_0 \( X_n + i \) - z_0 \( X_n \) \)$ for each fixed lattice offset $i$, and $n sup_(t lt.eq T_0) \| z_t \( X_n \) - z_0 \( X_n \) \|$ are tight. Thus this untruncated conclusion has a fixed positive macroscopic free buffer. It also holds up to controlled observations when $a = b$, because the two tails then control $z - a$. For general $a < b$, corresponding tightness statements hold only for the controlled tails up to observations. Here $T_0$ is one fixed sufficiently short step. Sampling is not conditioned on an arbitrarily small random free set.]
  #emph[Finally these statements allow a drift difference bounded by $c n^(- 2)$, with bounded support on the macroscopic scale, including a sufficiently small smooth exponential tilt of either marginal. Constants may depend on a fixed bound for $c$; the smallness needed for the change of marginal law is that in 2.]
] <c:comparison>

The wall sum in (4.2) is retained for the subsequent trace argument. It controls actual values at common walls, not a trace inferred from interior convergence. The $L^1$ conclusion in (4.4) will also be proved for a fixed hole construction; its holes need not have density tending to zero.

=== 4.2 Conditioning and sparse exceptional events <conditioning-and-sparse-exceptional-events>

#thm([Lemma 4.2.])[
  (Adapted freezing).  #emph[Conditional on an adapted exact-value transcript, the unqueried fields have the product of their Gibbs laws with those values pinned. Replacing this product by a stationary synchronous coupling preserves each annealed marginal and makes the coupled process stationary. The same marginal-preservation statement holds for jointly sampled boundary data with the conditional Gibbs kernels specified above.]
] <c:freezing>

#proof[
  For a fixed finite query history, every decision indicator is a function of recorded values and auxiliary randomness. Disintegrate the original product density over these values. The indicators introduce no factor depending on an unqueried coordinate, so the remaining density is the product of the two conditional Gibbs densities. Induction on the query count, followed by partitioning over the stopping count, proves the claim. Any coupling of these two kernels has the same individual conditional marginals. Integration over the transcript recovers the original marginals. A conditional invariant joining, obtained by time averaging the synchronous semigroup on its compact state space, is stationary. One may first take this time average jointly with the transcript; disintegration of a weak limit supplies a measurable choice of conditional invariant joinings. For the boundary-data version, disintegrate directly over the joint boundary vector and any recorded fixed set or component. Integrating either marginal of a coupling of the two conditional Gibbs kernels restores its original annealed law. The subsequent sparse-event bounds use only these individual marginals; independence of the two boundary vectors is unnecessary. ◻
]

Good-box marks must be recomputed on the initial pair of this joining. Marks depending on unrevealed coordinates of the original independent pair are not preserved. Their annealed estimates are preserved because each rejoined marginal has its original law. If either marginal has a $rho^k$ bound on a separated $k$-set, the union of the two defective sets has bound at most $2^k rho^(k \/ 2)$; this uses no independence of the rejoined replicas.

#thm([Lemma 4.3.])[
  (Conditional failures and moments).  #emph[Let $A_i$ be future events and $cal(I)$ the initial sigma-field. If every subset $J$ of a separated set satisfies $bb(P) \( ⋂_(i in J) A_i \) lt.eq rho^(\| J \|)$, then, for $0 < q < 1$, 
$ bb(P) (⋂_(i in I) { bb(P) \( A_i divides cal(I) \) > q }) lt.eq 2 / q #scale(x: 120%, y: 120%)[\(] 2 rho^(q \/ 2) #scale(x: 120%, y: 120%)[\)]^(\| I \|) . $

 Also, if $0 lt.eq X_n lt.eq n^B$ and $bb(P) \( X_n > M \) lt.eq n^(- A)$, then 
$ bb(P) { bb(E) \[ X_n divides cal(I) \] > M + 1 } lt.eq n^(B - A) . $

]
] <c:conditional>

#proof[
  On the first event let $N = sum_(i in I) upright(bold(1))_(A_i)$ and $k = \| I \|$. Then $bb(E) \[ N divides cal(I) \] > q k$ and $N lt.eq k$, so $bb(P) \( N gt.eq q k \/ 2 divides cal(I) \) gt.eq q \/ \( 2 - q \) gt.eq q \/ 2$. The unconditional probability is at most $2^k rho^(ceil.l q k \/ 2 ceil.r)$ by choosing a witnessing subset. For the second assertion use conditional Markov on $bb(E) \[ X_n upright(bold(1))_(X_n > M) divides cal(I) \]$. ◻
]

In particular, for $q gt.eq 1$, Jensen’s inequality gives

#[#set math.equation(numbering: n => "(4.6)")
 $ n^(- 2) sum_x #scale(x: 120%, y: 120%)[\(] bb(E) \[ H_x^k divides cal(I) \] #scale(x: 120%, y: 120%)[\)]^q lt.eq bb(E) [n^(- 2) sum_x H_x^(k q) divides cal(I)] . $ <c:conditional-moments>]

Lower positive moment orders follow from any larger moment order. The deterministic spatial moment bounds from 6, with an arbitrarily fast polynomial exceptional probability, pass to the conditional moments in (4.6). First truncate local clusters at a power of $n$ and discard the tail using the arbitrarily high cluster moments. No bound involving the total ambient volume is used. Mere finiteness of random all-order moment constants would not suffice for the expectation arguments below.

For later use we recall why short stationary steps have the requisite spatial sparsity. Conditional on a fixed transcript, each marginal is reversible normally reflected Brownian motion, with variance parameter two in every free coordinate. We use the symmetric Neumann identification of the fixed-polytope process [1] and the form-domain forward–reverse identity [5] Section 1, equation (1.5). The forward–reverse martingale decomposition bounds each coordinate’s displacement during $\[ 0 \, T \]$ by a fixed multiple of the suprema of its forward and reversed Brownian martingales. Within either direction the coordinate martingales have independent Brownian coordinates. If $k$ separated boxes have a displacement exceeding $d > 0$, select one of their finitely many shell sites in each box; at least $k \/ 2$ witnesses occur in one time direction. The reflection principle and a union bound give

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(P) \( upright("all these boxes move by more than ") d \) lt.eq C #scale(x: 120%, y: 120%)[\(] C_L e^(- c d^2 \/ T) #scale(x: 120%, y: 120%)[\)]^(k \/ 2) . $ <c:short-step>]

The constants are independent of the pinned values and of the number of free coordinates. Fixed coordinates contribute no displacement. Mix over transcripts. Combining (4.7) with initial edge slack in 12, and taking $T$ small after the slack parameter, shows that transmission edges are confined to clusters of sparse boxes. Connected-animal counting gives all cluster-size moments, their spatial concentration, and arbitrarily small defect density by improving the fixed parameters and shortening the testing step. Small constant drifts are covered by the same reversible decomposition for their tilted invariant measures, or by the bounded drift correction.

Here is the constant-drift extension of the finite-body identification. After removing exact pins, let $K subset bb(R)^m$, $m gt.eq 1$, be the positive-volume polytope of free coordinates and put

$ mu_b \( thin upright(d) h \) = Z_b^(- 1) e^(b dot.op h) thin thin upright(d) h \, #h(2em) cal(E)_b \( f \, g \) = integral_K nabla f dot.op nabla g thin thin upright(d) mu_b . $

Its form domain is $H^1 \( K^compose \)$. An all-pinned fiber is deterministic and requires no reflected process. The density is smooth and bounded above and below on this fixed compact body. Integration by parts for a smooth function $g$ with zero normal derivative gives

$ integral_K f \( Delta g + b dot.op nabla g \) thin thin upright(d) mu_b = - cal(E)_b \( f \, g \) . $

Thus the weighted Neumann form identifies a stationary reversible process with generator $Delta + b dot.op nabla$. For the coordinate $h_i$, writing $rho_b$ for the density and $n_(upright("out"))$ for the outward unit normal, the same calculation gives

$ cal(E)_b \( h_i \, g \) = - b_i integral_K g thin thin upright(d) mu_b + integral_(partial K) g thin n_(upright("out") \, i) rho_b thin thin upright(d) cal(H)^(m - 1) . $

The coordinate additive-functional argument in [1] therefore gives drift $b_i thin upright(d) t$ and an inward normal regulator. Its coordinate martingale brackets are $2 delta_(i j) t$, since the energy density is $2 nabla f dot.op nabla g$. The coordinate functions belong to the form domain, so the Lyons–Zheng identity applies even though they need not satisfy the generator’s Neumann boundary condition. Convex Skorokhod uniqueness identifies this process with the reflected bath driven by variance-two Brownian motion and drift $b$. This weighted-form argument is separate from the zero-drift assertion of [1].

=== 4.3 Projection updates and square dissipation <projection-updates-and-square-dissipation>

#thm([Lemma 4.4.])[
  (Averaging structure and cluster displacement).  #emph[On a zero-drift step, normal reflection of a difference acts on each transmission cluster by compositions of averaging projections and their convex mixtures. Free-input matrices are symmetric positive contractions at each projection, with nonnegative entries and row and column sums at most one. Pins supply their fixed difference; common individual walls supply zero. For a tail with zero pinned input, insert coordinate contractions after the averaging updates. If a cluster has $H$ free vertices and total square loss $D$, then 
#[#set math.equation(numbering: n => "(4.8)")
 $ sup_(t lt.eq T) max_(x in C) \| u_t \( x \) - u_0 \( x \) \| lt.eq C \( H + 1 \) sqrt(D) . $ <c:displacement>]

 The same estimate holds for an untruncated conservative difference, and is invariant under addition of a constant.]
] <c:cluster>

#proof[
  Use the finite-dimensional construction by projecting after each common Brownian increment. Interpolate the two preprojection inputs, and also their pinned values. Except at finitely many parameter breakpoints, the derivative of projection is computed on a fixed active face. An active edge makes its two free derivatives equal. A free component therefore receives the average of its input derivatives, unless it touches a pin or individual wall, when it receives the prescribed derivative. Several pins active on a parameter interval have equal derivatives. Integrating over the interpolation parameter gives the asserted convex mixture of orthogonal averaging projections and zero blocks. All intermediate contacts belong to the union of endpoint near-contact clusters: an infinitesimal projection cannot contact an edge whose slacks in both endpoint fields are bounded below.
  For $u = \( z - b \)_(+)$, convexity and the pin bound $z \|_P lt.eq b$ give $u' lt.eq A u$ coordinatewise. Write this as $u' = R A u$ with a diagonal matrix $0 lt.eq R lt.eq I$. The lower tail is identical after changing sign. Each elementary matrix $A$ or $R$ is a positive self-adjoint contraction, hence
  $ parallel v - A v parallel_2^2 lt.eq parallel v parallel_2^2 - parallel A v parallel_2^2 . $
  Add zero as a possible initial level. Every intermediate coordinate is a substochastic mixture of the initial levels, with lost mass put at zero. Jensen’s identity and the column deficits show that its variance about that mixture is at most the total loss $D$. It is therefore within $sqrt(D)$ of some initial level. Each elementary jump is at most $sqrt(D)$. A gap greater than $4 sqrt(D)$ between successive initial levels cannot be crossed. There are at most $H + 1$ levels, which proves (4.8) uniformly in the projection mesh. Passing to the reflected limit proves the assertion. ◻
]

We use $D_C = sum_(x in C) u_0 \( x \)^2 - sum_(x in C) u_T \( x \)^2$ in the zero-drift case. For two tails, add their losses. With drift, $D_C$ denotes the sum of the nonnegative losses at projection substeps; the separate source terms are estimated at the end of the proof. General doubly stochastic matrices cannot replace the projections in this lemma: a permutation has no square loss.

=== 4.4 Accessible contacts in a fixed box <accessible-contacts-in-a-fixed-box>

The next construction supplies coercivity even when a nominated edge inequality is redundant. Choose a fixed enlarged testing box, containing at most $N$ free coordinates, and a collar $B$ separated from its central test patch by the long-slack range. In the initial field use coordinates $y_x = h_x - h_x \( 0 \)$. Adjoin a ground coordinate $y_(*) = 0$ for all individual constraints, and add the auxiliary bounds $\| y_x \| lt.eq r_0$ on the collar. These bounds restrict the paths we construct; they are not extra reflecting walls of the original process.

#thm([Lemma 4.5.])[
  (Facet paths and uniform forcing).  #emph[Suppose every original edge involving a free coordinate has initial slack at least $s > 0$. Assume that in both directed orientations every original-edge path between a central test vertex and the collar, without an individual-constraint edge to ground, has residual slack greater than $Lambda > 2$. Every free component is required to reach the collar or an observed fixed vertex through original edges. Ordinary sign walls are allowed, and a tested wall has initial slack at most one.]
  #emph[For every central edge there are at most $N + 1$ genuine facet constraints joining its endpoints, or grounding both endpoints at genuine pins or walls. A tested individual wall is grounded by such a path. For any fixed $T > 0$ there are $p_0 \, I_0 > 0$, depending only on these fixed parameters, such that every facet selected in these paths can receive normal impulse at least $I_0$ in time $T$, on an event of the interior Brownian noises of probability at least $p_0$, while all collar coordinates move by less than $r_0$. Take $r_0 < s \/ 8$.]
] <c:force>

#proof[
  Write the inequalities in residual form $y_i - y_j lt.eq c_(i j)$, with individual inequalities using the ground vertex. All costs are nonnegative because $y = 0$ is feasible. Delete redundant inequalities. The strongest bound on a difference in a finite system of difference constraints is the shortest directed path cost in its constraint graph: summing a path proves one direction, and shortest-path potentials give the converse. The original central bound has cost at most two, so the facet graph contains a path of cost at most two. Remove cycles. If it uses ground, split the path there. Neither part can use an artificial collar bound, since its segment from or to the tested endpoint would already cost more than $Lambda$. For a wall use the same argument with budget one. A visit to a vertex carrying a wall is not itself a visit to ground; only its individual-constraint edge gives ground input.
  We justify uniformity of the forcing construction. Move every signed coordinate a distance $tau lt.eq min \( s \/ 8 \, r_0 \/ 4 \)$ toward its allowed side, leaving other coordinates unchanged. All edge constraints retain slack at least $s - 2 tau$, and the artificial collar retains slack at least $r_0 - tau$. A fixed-radius Euclidean ball about the new point lies in the auxiliary polytope. Every feasible displacement satisfies $\| y_x \| lt.eq 2 N + r_0$, by following a path to a pin or collar. Individual bounds with greater slack than $2 N + r_0 + 1$ may be capped at that value: they remain redundant. Thus, after fixing one of finitely many graph and sign patterns, the effective parameters form a compact family with a uniform interior ball.
  Fix a parameter value and take the facet paths just obtained for its polytope. For one facet choose a point in its relative interior where all other distinct-normal inequalities are strict. The artificial collar inequalities are among the strict ones. Drive the coordinates from the initial point along a feasible segment to this point, and then a fixed distance in the outward normal direction. The reflected trajectory stays at the facet during the outward part and acquires a positive impulse. An initial segment toward the interior-ball center can be inserted. A sufficiently small uniform tube around this piecewise linear driver preserves the collar inequality and at least half of the final impulse.
  For a fixed polytope, uniform-driver continuity and convergence of the projection recursion are the deterministic Skorokhod assertions in [18] Section 2, Corollaries 3–4. The geometric hypotheses hold here: if $B \( a \, r \) subset K$ and $\| a - x \| lt.eq R$ on $K$, every inward unit supporting normal at $y$ has scalar product at least $r$ with $a - y$; within distance $r \/ 2$ of $x$ its scalar product with $\( a - x \) \/ \| a - x \|$ is at least $r \/ \( 2 R \)$. Convexity supplies the exterior sphere condition. On the final interval only one distinct facet normal is active, and the one-dimensional running-minimum formula gives impulse stability.
  Parameter stability does not require interpreting this fixed-body reference as a changing-body theorem. Fix the graph and the free coordinates, and perturb initial heights and individual pin or wall levels by at most $delta$, in absolute height coordinates. Apply the projection derivative argument of Lemma 18, now allowing these individual inputs to vary. Every output difference is a subconvex combination of the previous free differences and the individual-input differences. Under the same driver its supremum norm is therefore at most $delta$ at every projection step and in the reflected limit. The original edge bounds remain exactly one. Combining this parameter bound with fixed-body driver continuity preserves the chosen tube in a parameter neighborhood. In the final single-normal interval, normal balance also preserves the positive impulse. Graph or free-coordinate patterns belong to a finite list and are treated separately.
  Brownian motion has positive probability of belonging to the chosen tube: its piecewise linear center has square-integrable derivative, so translation by that center preserves positivity of a Brownian small-ball event. The construction persists in a neighborhood of the parameter value. Merge identical free normals by retaining the strongest bound. The selected relative-interior facet point then moves slightly along its normal, with every other inequality still strict. Use facets of each limiting polytope rather than following a facet that disappears in a limit. A finite cover of the compact parameter family supplies positive minimum probability and impulse. ◻
]

The long-slack assertion in 4 verifies both orientations required by Lemma 19: residual costs telescope to path length minus an oriented height difference. Absolute slack greater than two excludes either direction of grounding through the far collar. The uniform interior-ball argument deliberately excludes shrinking two-sided intervals. Their initial edge-slack estimates can be uniform, but this does not supply the full-dimensional forcing statement above.

#thm([Lemma 4.6.])[
  (Insulation).  #emph[Outside a sparse set of initially selected boxes, every interior forcing event in Lemma 19 has conditional probability at least $p_0 \/ 2$ of occurring in the uncut process, given the initial pair and transcript.]
] <c:insulation>

#proof[
  Cut the edges across an initially strictly slack shell. For the cut exterior process let $A_B$ be the event that an exterior endpoint moves by more than $s \/ 4$. If in the original stationary process every endpoint of a cut edge moves by less than $s \/ 4$, none of these edges is contacted. Until a first cut contact the cut and uncut solutions agree. Uniqueness therefore makes them agree throughout this quiet event. In particular $A_B$ implies a shell-displacement event of the original process. Equation (4.7) gives joint sparse bounds for these events on separated boxes. Lemma 17, with $q = 1 \/ 2$, shows that boxes with $bb(P) \( A_B divides cal(I) \) > 1 \/ 2$ are still arbitrarily sparse. On the remaining initial configurations exterior quietness has probability at least $1 \/ 2$ and depends only on exterior noises. The controlled interior noises are independent of them. Their intersection has probability at least $p_0 \/ 2$, and no cut edge is contacted there. Thus the cut controlled path is a path of the original process. ◻
]

=== 4.5 Coercivity and the cutoff estimate <coercivity-and-the-cutoff-estimate>

At an upper-edge contact of the first replica, $h_i - h_j = 1$ and feasibility of the second implies $z_i - z_j gt.eq 0$. The contribution to the upper-tail square loss is $2 \( u_i - u_j \) thin upright(d) L gt.eq 0$. The lower tail follows by reversing the sign. Pin contacts and common walls have the same dissipative order. Let $g$ be the initial jump at a facet selected in Lemma 19. It has a fixed bound in absolute value: use two for a lattice edge or a zero-input pin edge, and the string height bound for an individual wall. On the forced event, either a relevant coordinate moves by at least $\| g \| \/ 4$, or the jump retains magnitude at least $\| g \| \/ 2$ during the impulse. Lemma 18 in the first case, and the impulse in the second, give

#[#set math.equation(numbering: n => "(4.9)")
 $ D_C gt.eq c g^2 H_C^(- m) $ <c:force-loss>]

for a fixed $m$. If the initial jump has the wrong sign for this facet, the large-movement alternative must occur before contact. Forcing one replica suffices; no force of the second replica is imposed.

To sum the local tests without counting a cluster loss once per vertex, associate to a testing box $B$ the quantity

$ d_B = sum_(C : thin C ∩ B^(+) eq.not diameter) D_C / H_C \, $

where $B^(+)$ is its fixed enlargement. A cluster meets at most $C_L H_C$ such boxes, so

#[#set math.equation(numbering: n => "(4.10)")
 $ sum_B d_B lt.eq C_L sum_C D_C . $ <c:allocation>]

Let $H_B$ be the maximum incident cluster size in $B^(+)$. Increasing $m$ in (4.9) absorbs the division by $H_C$. Conditional Cauchy–Schwarz on the forced event $F$ gives

$ bb(E) \[ d_B divides cal(I) \] gt.eq frac(c p_0^2 g^2, 1 + bb(E) \[ H_B^m divides cal(I) \]) \, #h(2em) bb(P) \( F divides cal(I) \)^2 lt.eq bb(E) \[ H_B^m divides cal(I) \] bb(E) \[ upright(bold(1))_F H_B^(- m) divides cal(I) \] . $

Choose the edge and wall weights to be a fixed small multiple of $\[ 1 + bb(E) \( H_B^m divides cal(I) \) \]^(- 1)$. Telescoping along the finite facet paths controls each tested original edge or anchor. Equation (4.6) supplies all required reciprocal moments, and (4.10) supplies the expected coercivity inequality.

We now bound the dissipation without already assuming pointwise tightness of $z$. Let $eta$ be a deterministic cutoff, equal to one on an inner box, zero outside an outer box. Let $d_(upright("lat"))$ denote the gap between those boxes in lattice units, so the cutoff has lattice Lipschitz constant $C \/ d_(upright("lat"))$. For a cluster put $eta_C = max_C eta$. Lemma 18 and contraction give

$ sum_(x in C) \| u_T \( x \)^2 - u_0 \( x \)^2 \| lt.eq C H_C^m sqrt(D_C) thin parallel u_0 parallel_(ell^2 \( C \)) . $

Since $\| eta_x^2 - eta_C^2 \| lt.eq C eta_C "diam" \( C \) \/ d_(upright("lat"))$, Young’s inequality yields

#[#set math.equation(numbering: n => "(4.11)")
 $ sum_(x in C) eta_x^2 \( u_T \( x \)^2 - u_0 \( x \)^2 \) lt.eq - 1 / 2 eta_C^2 D_C + C d_(upright("lat"))^(- 2) H_C^m sum_(x in C) u_0 \( x \)^2 . $ <c:cutoff-cluster>]

Using the maximum cutoff avoids division by a possibly zero minimum on clusters crossing the support boundary. Sum and take expectations; stationarity cancels the left side. Cluster multiplicities and diameters can be included in a larger fixed moment of $H_x$. Combining with the force bound and using $d_(upright("lat")) asymp n \( s - r \)$ gives, for $r < s < R$,

#[#set math.equation(numbering: n => "(4.12)")
 $ bb(E) cal(E)_n \( Q_r \) + bb(E) sum_(C : thin C ∩ Q_r eq.not diameter) D_C lt.eq C \( s - r \)^(- 2) bb(E) N_n \( Q_s \) + C \, #h(2em) N_n \( Q \) = integral_(n \, Q) H_x^m \( u_0 \( x \)^2 + 1 \) . $ <c:caccioppoli>]

Testing enlargements are absorbed by an intermediate box.

For a free comparison choose at each time the constant minimizing $sum_x eta_x^2 \( z_t \( x \) - c \)^2$. The minimum at the next time is no larger than the value at the previous minimizer. Its expectation is stationary, so (4.11) gives the same estimate. This step uses local oscillations, bounded deterministically by $C n$, rather than absolute heights or the ambient diameter.

Here are the localization details relevant to that uniformity. On a conservative cluster, constant cancellation and $\| nabla z \| lt.eq 2$ give

$ \| z_t \( x \) - z_0 \( x \) \| lt.eq 2 "diam" \( C \) \, #h(2em) D_C lt.eq 4 H_C "diam" \( C \)^2 . $

In a cluster intersecting a cutoff support, compare every value with one value in the support; the additional error is at most $2 H_C$. Thus the right side of (4.11) is bounded by local incident-size moments times local squared values plus a higher size moment. Clusters reaching uncontrolled data across a margin of order $n$ have negligible errors: their local contribution is bounded by a constant times

$ sum_(x in Q_s) \( n H_x + H_x^2 \) upright(bold(1))_({ "diam" \( C_x \) gt.eq c n }) \, $

whose expectation tends to zero faster than any chosen negative power by increasing the moment order. Alternatively, the marginal forward–reverse decomposition gives ambient-uniform moments of $sup_(t lt.eq T) \| z_t \( x \) - z_0 \( x \) \|$; Holder with the crossing probability gives the same result. Neither calculation introduces the number of vertices outside the localization box.

=== 4.6 Absorbing the weighted square norm <absorbing-the-weighted-square-norm>

We have proved coercivity and (4.12). It remains to bound the weighted norm on its right from macroscopic averages. On the deterministic spatial-moment event, 6 supplies an extension $U$ of a signed combination $F$ of the tails, with

$ parallel nabla U parallel_(L^p) lt.eq M cal(E)_n^(1 \/ 2) \, #h(2em) parallel W parallel_(L^t) lt.eq M \, #h(2em) parallel F - U parallel_(L^(2 t')) lt.eq M \, $

where $W = H^m$, all norms are in scaled coordinates, and $M$ is deterministic. Choose $t > p \/ \[ 2 \( p - 1 \) \]$ and put $alpha = 2 - 2 \/ p - 1 \/ t > 0$. Partition a fixed box into squares of side $ell$. Poincare–Sobolev on each square followed by Holder gives

#[#set math.equation(numbering: n => "(4.13)")
 $ integral W F^2 lt.eq C ell^(2 alpha) cal(E)_n + C ell^(- 2 \/ t) (1 + ell^2 sum_B \| "avg"_B F \|^2) . $ <c:interpolation>]

Indeed the oscillation estimate on one square is $parallel U - U_B parallel_(2 t') lt.eq C ell^alpha parallel nabla U parallel_p$; sum using $2 t' > p$. For the piecewise constant averages use $sum_B ell^2 \| U_B \|^(2 t') lt.eq ell^(- 2 \( t' - 1 \)) \( sum_B ell^2 \| U_B \|^2 \)^(t')$. The hole error is bounded by Holder with its stated moment.

For two tails take $F = \( z - b \)_(+) - \( a - z \)_(+)$. Their squares add to $F^2$, and $F - z$ is bounded by a constant depending only on $a \, b$. Consequently 2 controls the averages in (4.13). In the free version subtract the same local average from $z$ and use equal-mass average differences. In a uniformly bounded ordered comparison the weighted norm is already controlled. Choosing $ell$ after a desired $epsilon > 0$ yields

#[#set math.equation(numbering: n => "(4.14)")
 $ bb(E) N_n \( Q_r \) lt.eq epsilon bb(E) cal(E)_n \( Q_s \) + C epsilon^(- m) \( s - r \)^(- k) $ <c:absorb>]

with finite deterministic exponents. For instance $p = 3 \/ 2 \, t = 4$ gives energy coefficient $ell^(5 \/ 6)$ and average coefficient $ell^(- 1 \/ 2)$. No higher energy moment is used. Exceptional events are discarded using their arbitrarily fast polynomial probability, local Lipschitz bounds, and the moments of one local average.

For completeness, combine (4.14) and (4.12) with an intermediate box. There exist finite $A \, m$ such that, for each $0 < theta < 1$,

$ bb(E) N_n \( Q_r \) lt.eq theta bb(E) N_n \( Q_s \) + C theta^(- m) \( s - r \)^(- A) . $

Use successive gaps $d_j = d_02^(- j)$, with fixed $theta 2^A < 1$. The resulting series is bounded. Stop after $J = floor.l kappa log_2 n floor.r$ iterations, with $kappa > 0$ small enough that every auxiliary interpolation box is still larger than $n^(1 \/ 2)$. The terminal bound is polynomial in $n$, from local Lipschitzness and one average moment. After fixing $kappa$, decrease $theta$ so that $theta^J n^B arrow.r 0$ for that polynomial exponent $B$. Choose the exceptional-event exponent last. This proves the local bounded norm and (4.3), and 6 then gives the first assertion of (4.4) for every $1 < p < 2$.

=== 4.7 Rough one-sided observations <rough-one-sided-observations>

A single lower tail need not have controlled averages. We instead use the averages of $z$ to obtain a negative Sobolev bound. Here and below the analytic norms and integrals are in scaled coordinates. Choose a smooth cutoff $chi_0$ supported in $hat(Q)_R$, equal to one on a slightly smaller box containing the supports of the test cutoffs used below. If $z^(upright("sc")) \( y \) = z \( n y \)$ denotes the scaled field with the fixed exterior convention of the experiment, write

$ parallel z parallel_(H^(- eta)) := parallel chi_0 z^(upright("sc")) parallel_(H^(- eta) \( bb(R)^2 \)) . $

The dual space in the pairing is $H^eta \( bb(R)^2 \)$; a test such as $chi^2 U$ is extended by zero outside its compact support in the region where $chi_0 = 1$. Thus no boundary condition on $z$ at the artificial box boundary is imposed by this norm. Dyadic smoothing, 2, and the bottom-scale Lipschitz bound give, for any fixed $eta > 0$ on a compact box,

#[#set math.equation(numbering: n => "(4.15)")
 $ bb(E) parallel z parallel_(H^(- eta))^2 lt.eq C sum_(j gt.eq 0) 2^(- 2 eta j) \( 1 + j \)^2 < oo . $ <c:negative>]

The zeroth-scale average is included. Equal-mass difference bounds alone would not suffice: the constants $z = - n$ have zero such differences. The centered version uses its fixed local average in this zeroth-scale term.

Let $u = \( a - z \)_(+)$ and let its extension $U$ copy a surrounding positive tail value into each hole. If $D_x$ is a fixed multiple of the hole diameter, the original Lipschitz bound gives pointwise

#[#set math.equation(numbering: n => "(4.16)")
 $ U^2 lt.eq \( a - z \) U + D U . $ <c:one-sided-pointwise>]

For $U_x > 0$, write $U_x = a - z_y$ at its copied rim site and use $z_x - z_y lt.eq D_x$; for $U_x = 0$ the inequality is immediate. Across a controlled observed boundary the original tail is zero, and its zero extension is uniformly Lipschitz. Zero filling behind such a boundary preserves (4.16). An uncontrolled seed is excluded by the stipulated positive margin.

Here is a quantitative absorption using only the first energy moment. Choose $p = 3 \/ 2$, $t = 4$, and $eta = 1 \/ 6$. Let $chi$ equal one on $hat(Q)_r$, be supported in $hat(Q)_s$, and satisfy $\| nabla chi \| lt.eq C \/ \( s - r \)$. Put $X = parallel chi U parallel_2$, $Z = parallel z parallel_(H^(- 1 \/ 6))$, and $d = s - r$. This $d$ is the dimensionless scaled gap; the corresponding lattice gap is $n d$, as in the cutoff calculation above. Pair (4.16) with $chi^2$. Fractional interpolation between $L^2$ and $W^(1 \, 3 \/ 2)$ has exponent $1 \/ 4$ for $H^(1 \/ 6)$, while

$ parallel nabla \( chi^2 U \) parallel_(3 \/ 2) lt.eq C \( cal(E)_n^(1 \/ 2) + d^(- 1) X \) . $

Duality and two applications of Young’s inequality give

$ X^2 lt.eq delta cal(E)_n + C \( 1 + delta^(- 1 \/ 4) + d^(- 1 \/ 2) \) \( 1 + Z^2 \) . $

The derivative of $chi^2 U$ contains $chi U$, which explains why no uncontrolled larger-box $L^2$ term is introduced. Weighted Sobolev interpolation to $L^(8 \/ 3)$, with exponent $3 \/ 8$, gives

$ integral_(hat(Q)_r) W U^2 lt.eq C cal(E)_n^(3 \/ 8) X^(5 \/ 4) + C \( 1 + d^(- 3 \/ 4) \) X^2 . $

Choose $delta$ after $epsilon$ and $d$ to obtain

#[#set math.equation(numbering: n => "(4.17)")
 $ integral_(hat(Q)_r) W F^2 lt.eq epsilon cal(E)_n \( Q_s \) + C epsilon^(- 1) d^(- k) \( 1 + Z^2 \) \, $ <c:one-sided-absorb>]

where $F = u$, and the filling error has been included by Holder. One may take $k = 5 \/ 4$ if the extension constants have no additional gap dependence; only a finite polynomial exponent is used. Take expectations using (4.15), and repeat the interior iteration. This proves the one-sided part of the theorem. The argument is annealed over the actual transcript by Lemma 16. To track the threshold, retain $a$ in (4.16): its pairing contributes at most $\| a \| X$, and hence $C a^2$ after absorption. All later estimates are linear in this lower-order bound. The weights depend on the original fields and force tests, not on $a$. This proves (4.5). For $z \/ K$ the force impulse in its difference is divided by $K$, while a facet jump is bounded by $2 \/ K$; thus the implication from linear impulse loss to the square of that jump has the same constant. Division by $K gt.eq 1$ also improves the Lipschitz and negative-Sobolev bounds.

=== 4.8 Removing filled holes and obtaining microscopic tightness <removing-filled-holes-and-obtaining-microscopic-tightness>

Fix first one hole construction. To prove its error tends to zero, use a sequence of improved initial good parameters, indexed by $j$, whose defective-edge densities are $rho_j arrow.b 0$. They may use shorter forcing steps; the original hole construction is unchanged. For every fixed $j$, the estimates already proved give good edges $G_(j \, n)$ and weights with

$ bb(E) sum_(e in G_(j \, n)) w_(j \, e) \| nabla_e u \|^2 lt.eq C_j \, #h(2em) bb(E) integral_n upright(bold(1))_({ e in.not G_(j \, n) }) lt.eq rho_j + o \( 1 \) \, $

and low-weight density at most $C_j a^q + o \( 1 \)$ for $w_(j \, e) < a$. Since $\| nabla_e u \| lt.eq 2$, split into defective edges, low-weight edges, and the remaining edges. Cauchy–Schwarz on the last class gives

#[#set math.equation(numbering: n => "(4.18)")
 $ bb(E) integral_n \| nabla_e u \| lt.eq 2 rho_j + 2 C_j a^q + frac(C_j^(1 \/ 2), n sqrt(a)) + o \( 1 \) . $ <c:all-edge-l1>]

Send $n arrow.r oo$, then $a arrow.b 0$, then $j arrow.r oo$. Thus the annealed mean absolute jump over all edges tends to zero.

For holes of diameter at most a fixed $M$, telescope from each hole site to its copied rim value. Paths and their edge congestion have a fixed polynomial bound in $M$. The paths may use edges omitted from the energy, since (4.18) now covers all edges. For larger holes use the original Lipschitz bound and their uniformly bounded high moments. Consequently

$ bb(E) integral_(n \, Q_r) \| U_n - u \| lt.eq C M^k bb(E) integral_(n \, Q_s) \| nabla_e u \| + C_q M^(- q) + o \( 1 \) . $

First send $n arrow.r oo$ and then $M arrow.r oo$. This proves the second part of (4.4). The same argument applies to the free centered difference. At a controlled observed boundary use the Lipschitz zero extension of a tail. For common-wall comparisons use the original difference on the full common graph; the wall penalties are retained separately in (4.2).

The same decomposition yields the volume-tail bound

$ bb(P)_(upright("vol")) \( n \| nabla_e u \| > M \) lt.eq rho_j + C_j a^q + frac(C_j, a M^2) + o \( 1 \) . $

Choose $j$, then $a$, then $M$ to prove tightness. A finite path gives each fixed-neighborhood difference. On a fixed step the cluster displacement estimate and (4.3) give

$ bb(P)_(upright("vol")) (n sup_(t lt.eq T_0) \| u_t - u_0 \| > M) lt.eq bb(P)_(upright("vol")) \( H > K \) + frac(C K^m, M^2) + o \( 1 \) . $

For an untruncated difference in a free region use the conservative cluster estimate, or $n sup \| z_t \( x \) - z_0 \( x \) \| lt.eq H_x max_(e subset C_x) n \| nabla_e z_0 \|$ and first restrict $H_x lt.eq K$. When $a < b$, the two tails do not control the part of $z$ inside $\[ a \, b \]$; the assertion about $nabla z$ therefore uses the free centered comparison on a ball of radius a fixed positive multiple of $n$ about the sampled region. A finite microscopic free neighborhood is insufficient when nearby pinned differences oscillate within $\[ a \, b \]$. These are fixed-step tightness assertions, not an asserted modulus of continuity for the $n$-rescaled process as $T arrow.b 0$.

#thm([Lemma 4.7.])[
  (Preserving a connected zero exterior).  #emph[Let $D_n$ be a finite simply connected triangular-lattice polygon. Let $E_n$ consist of its boundary vertices and all vertices outside its interior, and put $u = 0$ on $E_n$. Assume $u$ is uniformly Lipschitz on the full lattice and has the good-edge energy and inverse-weight bounds established above, including edges incident to its fixed boundary. The hole extension can be chosen so that $U = 0$ on $E_n$, with the same Sobolev estimate as in 6. Its normalized annealed $L^1$ error tends to zero under the improved-parameter bounds used in (4.18). Thus the same-boundary comparison difference, extended by zero, has a filled extension satisfying 
$ sup_n bb(E) parallel U_n parallel_(W^(1 \, p) \( bb(R)^2 \))^2 < oo \, #h(2em) U_n = 0 med upright("on ") bb(R)^2 \\ D_n $

 after scaling and affine interpolation, for every $1 < p < 2$.]
] <c:exterior-zero>

#proof[
  Use the original lattice vertices for the extension. Bad boxes are first enlarged by the fixed amount needed to control every original edge on a surrounding good rim. Their outer filled hulls give the holes of 6; passing from boxes to their unions of lattice sites changes diameter and counting constants only by the fixed box size. Enlarge the rim by a fixed layer if needed to include an exit by a triangular-lattice diagonal edge. The same square-coordinate contour construction supplies connected good rim paths of length at most $C \( d + 1 \)^2$ for a hole of diameter $d$. No extra probabilistic claim for independently marked individual sites is needed.
  The zero set $E_n$ is connected to infinity in the lattice graph. Indeed the polygon has one connected boundary cycle, and its exterior is the unbounded complementary component; including boundary vertices removes any vertex-level corner separation. For a hole $H$ which meets $E_n$, follow an $E_n$-path from a vertex in $H$ to infinity. Since $H$ is finite, the path exits it. Its first exterior rim vertex lies in $E_n$ and has value zero. Choose this vertex as the anchor of $H$, and fill all of $H$ with zero. If $H$ does not meet $E_n$, choose any surrounding good anchor as before. Outside the holes retain the original values. The resulting field is zero on every vertex of $E_n$.
  We verify the energy bound for this choice, rather than relying on preservation by an arbitrary anchor. If an edge joins a good vertex $x$ to a hole, its new jump is the difference of $u \( x \)$ and the value at that hole’s chosen rim anchor. Join these two rim vertices by the good rim path just described and telescope. The path length, the number of incident edges, and the repeated uses of a rim edge have the same polynomial diameter bounds for every choice of anchor. Applying the path inequality and then Holder gives exactly the weighted bound in 6, with possibly a changed fixed exponent of $1 + d$. Edges with both endpoints in a filled hole have zero jump. Edges outside the holes retain their old jump; exterior zero–zero edges may be given weight one and contribute no energy. In particular the weighted gradient estimate holds across the actual polygon boundary. The spatial moment estimates and expected energy bound then give its squared $W^(1 \, p)$ gradient bound. The local weighted square bound already proved controls its $L^p$ norm.
  The new anchor also preserves the vanishing filling error. For holes of diameter at most $M$, join each vertex to its selected anchor by a full-lattice path of length at most $C M$. Such paths lie in a fixed enlargement of the hole’s bounding box, and their congestion is bounded by a fixed polynomial of $M$. The all-edge estimate (4.18) applies to the zero-extended original field, including boundary-incident edges. It makes the expected error from these holes tend to zero for each fixed $M$. For larger holes, $\| U \( x \) - u \( x \) \| lt.eq C \( 1 + d_x \)$ by full-lattice Lipschitzness; high diameter moments make their error tend to zero as $M arrow.r oo$. These estimates also cover the exceptional event by setting $U = 0$ there and using the established moment bounds.
  For a comparison with identical boundary heights, $z = h - tilde(h) = 0$ on the boundary. Its extension by zero is $2$-Lipschitz on the full lattice: edges crossing the boundary first meet a fixed boundary vertex, and exterior edges have zero difference. Apply the construction to $z$, or to both of its tails and subtract. All triangle vertices outside the lattice polygon have value zero, so affine interpolation vanishes there as well. Norm equivalence on the fixed lattice triangles gives the displayed global Sobolev bound. This proof uses the unbounded connected exterior, and does not apply to a hole containing an entire isolated internal component of observed vertices. ◻
]

=== 4.9 Small drifts and completion of the proof <small-drifts-and-completion-of-the-proof>

In the projection scheme a relative drift of supremum norm $c n^(- 2)$ is inserted between averaging updates. The substochastic matrices do not increase its supremum norm, so its transported contribution during one step is at most $c T n^(- 2)$. The displacement bound acquires only a polynomial cluster factor times this quantity. At the square-energy identity the additional source term is bounded by

$ C n^(- 2) integral_0^T sum_x eta_x^2 \( \| u_t \( x \) \| + 1 \) thin upright(d) t lt.eq C n^(- 2) integral_0^T sum_x eta_x^2 \( u_t \( x \)^2 + 1 \) thin upright(d) t . $

After stationarity this has the same form as the cutoff error, since the lattice gap is at most $C n$. The force test acquires an error $C H^m n^(- 4)$ in its square bound. Its spatial sum is bounded, and indeed tends to zero on the normalized scales in use. The preceding coercivity, absorption, and localization therefore remain valid.

It remains to check the change of marginal law for a smooth tilt. Its density is proportional to $exp \( n^(- 2) sum_x b \( x \/ n \) h \( x \) \)$, with bounded support at scale $n$. For sufficiently small $parallel b parallel_oo$, the exponential average bound in 2 bounds a fixed moment greater than one of this density and its normalizing factor. Holder transfers any sparse event probability $C rho^k$ to $C' rho^(c k)$, and an arbitrarily fast polynomial exceptional bound to another such bound. It also transfers the finitely many average and cluster moments used above. This argument is applied before adaptive revealing; Lemma 16 then preserves the tilted marginals. There is no claim of a uniformly bounded density for each exact transcript. These observations complete the proof of Theorem 15.

#prodef([Remark 4.8.])[
  The dependencies 12, 6, and 2 must hold with their stated bounded-data and sign-string scope. The zero-pinned controlled-gradient theorem alone does not give that scope. In particular initial edge strictness is established there by a conditional cone filling and homothetic volume estimate, before Lemma 19 is used. The present proof also uses the deterministic spatial moment bounds outside arbitrarily rare events, not merely annealed finiteness of moment constants. No assertion about uniform forcing on shrinking two-sided wall polytopes is made.
] <c:scope>

== 5 The Stationary Cell Problem and the Field Limit <sec:cell>

The comparison estimate controls how two constrained fields respond to a small change of law. In a bulk synchronous coupling the common Brownian noises cancel, leaving the imposed relative drift and the averaging action of edge contacts. We retain the order of those contacts in a stationary bulk limit, then use the average transport of relative heights to identify the macroscopic equation. A positive source will show that its coefficient is a positive scalar, and exponential tilting will identify the Gaussian field law.

Throughout this section lattice vertices have unit spacing: $V_n subset Lambda$, where $Lambda$ is the triangular lattice, and $x in V_n$ represents the physical point $x \/ n$. The vertex density is $v = 2 \/ sqrt(3)$. All bulk sampling regions have a fixed positive macroscopic buffer from fixed pins and reflecting sign walls. Trace estimates up to walls are separate from these bulk estimates.

Here are the quantitative comparison bounds used in the construction. For a stationary synchronous difference $z = h - tilde(h)$, a fixed short time interval has finite transmission clusters $C$, whose sizes have all fixed moments under volume sampling. Write $e_C^2$ for their quadratic loss, denoted by $D_C$ in the conservative comparison of Section 4. On each fixed interior macroscopic set $Q$,

#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E) sum_(C : C ∩ n Q eq.not diameter) e_C^2 lt.eq C_Q . $ <b:energy-input>]

The version with a drift difference $n^(- 2) b \( x \/ n \)$ has an additional uniformly bounded error. The filled differences $U_n$ obey, for every $1 < p < 2$,

$ sup_n bb(E) parallel U_n parallel_(W^(1 \, p) \( Q \))^p < oo \, #h(2em) bb(E) parallel U_n - z parallel_(L^1 \( Q \)) arrow.r 0 \, $

where the second norm uses the original interpolated difference. The $p$-th moment follows from the hole estimate and expected energy bound after restricting the weight and hole moments to their deterministic high-probability bounds; polynomial exceptional-event bounds remove the restriction. A bound only on $bb(E) parallel U_n parallel_(W^(1 \, p))$ would not suffice for the uniform-integrability argument below. At a volume-sampled vertex, the spatial increments of $z$ on every fixed finite neighborhood, multiplied by $n$, and the corresponding scaled step displacements are tight. These estimates remain local when the ambient domain is arbitrarily larger than the comparison box, allow centering in a free box, and include small smooth exponential tilts.

These bounds are supplied by Theorem 15: initial slack comes from 4 and 12, short-step sparsity from 5 and (4.7), dissipation and compactness from (4.3)–(4.4), using 6 and 2. They apply to the bounded-pin and ordinary one-sided sign-string laws specified there. Exact-value adaptive freezing is used only with its full transcript and the annealed marginal interpretation of Lemma 16; preservation of a marginal supplies no estimate for an arbitrary fixed transcript. Shrinking two-sided reflecting intervals are excluded. The finite-volume force covers and insulation are Lemmas 19 and 20; Lemma 28 below passes their conditional inequalities to the limiting forward filtration. The ordinary fixed-boundary extension is Lemma 21.

=== 5.1 The bulk environment <the-bulk-environment>

We first retain the driving Brownian motions as part of the local limit. This is necessary because the tangent operator records the order of contacts, not just the initial gradient configuration.

#thm([Proposition 5.1.])[
  (Stationary bulk law).  #emph[Under the inputs specified above, the gradient process and its driving Brownian increments, viewed from a uniformly sampled vertex in a compact macroscopic region separated by a fixed positive macroscopic distance from all fixed pins and reflecting sign walls, have a unique local limit. This limit is independent of the bounded boundary data and of the small smooth tilts under consideration. It is stationary in space and time and spatially ergodic. Its local trajectories are continuous and have normal reflection. On a fixed short step, every vertex belongs to a finite transmission cluster; there are almost surely no simultaneous distinct-face contacts. A face visited away from the endpoints of a contact episode has positive reflection impulse in that episode.]
] <b:bulk>

#proof[
  First consider bounded continuous cylinder functions of finitely many gradients and Brownian increments in a fixed time window. Tile an interior region by disjoint boxes of side $L$. In each box run a zero-boundary equilibrium bath using the original Brownian drivers at its free sites. The simultaneous stationary joining exists by time averaging the finite reflected semigroup. The reference baths have independent path laws: their drivers are independent, and the unique invariant marginal of their product dynamics is the product of their equilibrium measures.
  Discard a boundary layer of relative width $eta$ in each box. The centered free comparison, uniform in the ambient domain size, makes the difference of each fixed local gradient tend to zero in volume probability as $L arrow.r oo$. Stationarity gives the same assertion at any fixed finite list of times. The drivers are identical. Consequently cylinder averages for the original bath differ in $L^1$ from those for the references by a quantity tending to zero, followed by an error $O \( eta \)$ from discarded sites. Comparing two original systems through reference boxes of the same size proves that their volume-sampled cylinder laws are Cauchy.
  For a spatial observation box of side $R gt.double L$, its reference-box averages are independent and bounded. Their average has variance at most $C \( L \/ R \)^2$. Choose $L arrow.r oo$ slowly with $L \/ R arrow.r 0$, and then let $eta arrow.b 0$. This proves concentration of spatial cylinder averages. The estimates allow $R$ itself to grow arbitrarily slowly relative to the original domain, so the concentration passes to the infinite-volume local limit. Cylinder approximation then proves spatial ergodicity of the full gradient-and-driver law. Spatial stationarity follows by shifting the uniform root, and time stationarity passes from the finite stationary laws. The same comparison includes the small smooth tilts and proves their independence in the unscaled limit.
  We give the path and reflection details separately from this static comparison. For a stationary finite-volume bath, Lemma 5 and the forward and reversed martingale decompositions express each coordinate increment as half the sum of two variance-two Brownian increments. The usual Brownian modulus bound therefore gives tightness of each coordinate path after subtracting its initial value. Relative initial heights in a fixed neighborhood are bounded by graph distance. This gives tightness of all local continuous paths, jointly with their drivers. A bounded drift of order $n^(- 2)$ contributes a vanishing term. Independence of future Brownian increments from the forward past passes first for finite cylinder tests and then, by a monotone-class argument, for the full forward sigma-field.
  Fix one short step and a finite set of vertices. Outside an event of arbitrarily small probability, its incident transmission clusters lie in a fixed finite neighborhood, and all edges crossing their boundary have positive slack throughout the step. This is the short-time isolation input. There are only finitely many possible clusters under this restriction. Include their markings in the joint extraction. On the event corresponding to a particular finite cluster $C$, the trajectory coincides with the normally reflected motion using only the internal edge constraints of $C$: removed edges exert no force. The finite-dimensional Skorokhod map is continuous in the initial point and the common continuous drive on this isolated problem. Use the orthonormal constant vector $\| C \|^(- 1 \/ 2) upright(bold(1))_C$ and an orthonormal basis of its orthogonal complement. The constant coordinate is unconstrained variance-two Brownian motion; every edge normal lies in the orthogonal complement, where the Brownian covariance remains $2 I$ and the edge polytope is compact. The arithmetic mean, in contrast, has variance parameter $2 \/ \| C \|$. Thus the limiting trajectory has the same normal reflection. Letting the cluster restriction increase identifies the dynamics everywhere locally.
  The improving initial strict-slack bounds imply that each fixed initial edge is strict almost surely in the limit. On an isolated finite cluster, a union of intersections of two distinct facets is polar for normal reflection. One can verify this from the Neumann Dirichlet form: a logarithmic cutoff in the two transverse coordinates has energy tending to zero. Starting at an interior point, such a polar set is not reached. This applies before restricting to the isolation event, so conditioning on that future event is unnecessary. The countable collection of finite clusters and time intervals proves absence of simultaneous contacts. The one-dimensional normal coordinate and the strong Markov property at its first hit show that a visited face has positive regulator increment on an interval containing that hit in its interior. Applying this assertion to rational enclosing intervals makes it simultaneous for all episodes used below. Stationarity and strict initial slack also exclude contact at either fixed step endpoint. ◻
]

=== 5.2 The tangent update <the-tangent-update>

Fix a sufficiently short step length $T$. We choose its transmission partition as a function of the unmarked environment. Take a tolerance $s > 0$ below the one supplied by short-step sparsity, and join an edge when its minimum slack during the step is at most $s$. Choose $s$ off the atoms of the distributions of these minima; only countably many values are excluded. The resulting components are finite with the stated moments. On every fixed finite neighborhood their membership is stable under local path convergence, except on a null event. This convention also applies to the union of the two approximating replicas’ edges. It avoids retaining an unspecified auxiliary partition in the cell law. For an oriented edge facet write its normal as $a_e$; the sign does not affect the matrix

$ P_e = I - frac(a_e a_e^(sans(T)), \| a_e \|^2) . $

This matrix averages the two incident coordinates and fixes all others. It is an orthogonal projection, is doubly stochastic, and preserves constants.

#thm([Lemma 5.2.])[
  (A stable finite product).  #emph[On a finite isolated cluster, consider a normal-reflection trajectory with interior endpoints, no simultaneous distinct-face contacts, and positive impulse in each visited-face episode. For two compared trajectories whose initial states are sufficiently close to the reference initial state and which use the same driving path, sufficiently close to the reference drive, their synchronous difference update is exactly a finite product 
$ J = P_(e_k) dots.h.c P_(e_1) . $

 Consequently, if the initial relative differences multiplied by $n$ are tight, their limiting update is $w' = J w$ modulo constants. An additional relative drift bounded by $C n^(- 2)$ makes a vanishing error after this multiplication by $n$.]
] <b:tangent>

#proof[
  For each facet $e$, its contact times form a compact subset of $\[ 0 \, T \]$. Different nonempty contact sets are disjoint and thus have positive distance. Since the number of facets is finite, there can be only finitely many switches of contact label. Repetitions of the same label can be grouped. Choose a finite partition with endpoints off all facets so that each contact interval allows only its designated facet, and each remaining interval has no contact. All undesignated inequalities on each such interval have positive minimum slack.
  Continuity of the finite Skorokhod map preserves these inactive margins under small perturbations. Positive impulse supplies a strict running-minimum witness in the normal coordinate. Therefore both sufficiently close synchronous paths reach the designated face within that interval. The one-dimensional reflection formula then removes their normal difference exactly; their tangential difference stays unchanged. Their difference at the end of the interval is $P_e$ times its input difference. Contact-free intervals preserve the difference. Composition proves the exact identity.
  The conclusion is stronger than an error $o \( 1 \)$, which would not survive multiplication by $n$. On each fixed regular path neighborhood the identity is exact. Normal monotonicity bounds a finite-dimensional perturbation from a differential drift by its integrated Euclidean magnitude, at most $C \( C \) T n^(- 2)$. Its product with $n$ tends to zero.
  For the random application, first bound the cluster size and the scaled initial oscillation. Next bound the positive inactive margins, temporal separations, and impulse witnesses away from zero. Each restriction has probability tending to one when its bound is relaxed. The deterministic argument applies on the restricted event. Remove the restrictions last. The union of the two replicas’ near-contact clusters provides the needed isolation. Subtracting a common spatial constant is harmless because all free edge constraints are invariant under that translation. ◻
]

Write $cal(E)$ for the two-sided stationary bulk environment, including the gradient trajectories and drivers. On each step, Lemma 24 defines $J$ separately on its finite clusters. We now describe the class of relative height solutions for which the mean flux will be unique. The comparison bounds control filled relative gradients in $L^p$, whereas the correction at a volume-sampled site is controlled by tightness. We therefore record the large-scale slope by affine growth in volume, which survives these stationary corrections. A slope is called attained only when a stationary solution with the bounds below exists.

#prodef([Definition 5.3.])[
  (Controlled tangent solution).  A controlled solution of slope $q in bb(R)^2$ is a space-time stationary joining of $cal(E)$ with real relative heights $\( w_x \( k \) \)$, defined modulo a spatial additive constant at each $k in bb(Z)$, such that:
  + The relative heights form a spatial cocycle: after choosing $w_0 = 0$, they obey $w_(x + y) - w_x = w_y compose tau_x$, where $tau_x$ shifts the joined environment and relative field by $x$. They update by $w \( k + 1 \) = J_k w \( k \)$ modulo constants.
  + For every $delta > 0$ there are spatial constants $c_R$ for which
    $ frac(1, \| Lambda ∩ B_R \|) \# { x in Lambda ∩ B_R : \| w_x - q dot.op x - c_R \| > delta R } arrow.r 0 $
    in probability as $R arrow.r oo$.
  + If $C_x$ is the step cluster of $x$, $H_x = \| C_x \|$, and
    $ d_x = frac(1, \| C_x \|) sum_(y in C_x) #scale(x: 120%, y: 120%)[\(] w_y^2 - \( J w \)_y^2 #scale(x: 120%, y: 120%)[\)] \, $
    then $bb(E) d_0 < oo$. For every fixed $a gt.eq 0$, $bb(E) \[ H_0^a \| \( J w - w \)_0 \| \] < oo$.
  The loss defining $d_x$ is nonnegative and invariant under addition of a constant. A slope is called attained if such a solution exists.
] <b:controlled>

=== 5.3 Extraction and growth of the relative heights <extraction-and-growth-of-the-relative-heights>

#thm([Lemma 5.4.])[
  (Volume-sampled tangent solutions).  #emph[Let $z$ be a stationary comparison on scale $n$ covered by Theorem 15, with relative drift $n^(- 2) b \( x \/ n \)$. Sample $x$ in a fixed compact macroscopic region separated by a positive macroscopic distance from all fixed pins and reflecting sign walls. Extract local limits of $n \( z_(x + i) - z_x \)$, jointly with $x \/ n$ and the bulk environment. Conditional on the macroscopic position, the limit is a stationary spatial cocycle, has update $w' = J w$ modulo constants, and has affine volume growth with a possibly random slope $q$. Conditional on almost every value of $q$, it is a controlled solution on the original environment law. If the expected macroscopic difference converges to $m$, then 
$ bb(E) \[ q divides x \/ n = y \] = nabla m \( y \) $

 in the distributional sense in the interior.]
] <b:extraction>

#proof[
  The comparison estimates give tightness on every finite neighborhood and every finite set of step times. A diagonal extraction preserves the exact additivity of the differences. Shifting the root by a fixed lattice vector changes its macroscopic position by $o \( 1 \)$ and changes its sampling law only by a vanishing boundary error. The conditional local law is therefore spatially stationary. Time stationarity passes directly. Its environmental marginal is the same ergodic law at every macroscopic position by Proposition 23. Lemma 24 identifies the update.
  For integrability, distribute $n^2 e_C^2$ equally among the vertices of $C$. Its expectation at a volume-sampled site is bounded by (5.1). Cluster displacement is bounded by a fixed polynomial in cluster size times the square root of cluster loss. For any $1 < r < 2$, Holder’s inequality consequently bounds the $r$-th moment of each scaled displacement multiplied by any fixed cluster power. Lower semicontinuity and finite-cluster testing give the corresponding integrability for the limit.
  Include a marking for one fixed sparse-hole construction in the extraction. Randomize the block-grid phase, and choose a rim representative by a translation-equivariant rule. By 6, the filled limiting potential $hat(w)$ has stationary gradients in $L^p$ for some $p > 1$. Let $cal(I)$ be the invariant sigma-field of this joint spatial law. The spatial ergodic theorem makes the rescaled gradients converge weakly to their conditional mean $q$ given $cal(I)$. To see that the potential has affine growth, subtract its mean on each box and rescale by $R$. Poincare’s inequality and the spatial $L^p$ bound give weak $W^(1 \, p)$ compactness and strong $L^p$ compactness. Every compact limit has distributional gradient $q$, and is therefore affine. This proves the asserted volume growth for $hat(w)$.
  The correction $w_x - hat(w)_x$ is a finite stationary random variable: the hole has finite diameter and every finite collection of original scaled differences is tight. No integrability of this correction is required to transfer volume growth. For fixed $delta > 0$, stationarity and bounded convergence show that the expected fraction of sites where $\| w_x - hat(w)_x \| > delta R$ tends to zero. The original cocycle thus has the same slope. The identical argument for its stationary step displacement shows that $q$ is time invariant.
  For any Borel slope event $B$, the function $bb(P) \( q in B divides cal(E) \)$ is spatially invariant. Ergodicity of $cal(E)$ makes it constant. Conditioning on $q$ therefore leaves the environmental marginal unchanged. Stationarity and the controlled bounds disintegrate for almost every slope value, proving the claimed deterministic-slope solutions.
  Finally, the filled gradients are uniformly integrable in volume sampling. Discrete summation by parts against a smooth macroscopic test identifies their expected weak limit with $nabla m$. The expected filled and original potentials have the same limit by their vanishing $L^1$ difference. The conditional spatial mean of the extracted filled gradients is $q$, so its expectation is precisely the stated derivative. ◻
]

We next prove uniqueness at each attained slope. Two ingredients are needed: dissipation removes a sublinear stationary difference, and the actual contact graph connects the lattice. The latter is a statement about the environment, not about any particular solution joined to it.

#thm([Lemma 5.5.])[
  (Forward recurrence of contact tests).  #emph[Fix an edge. Suppose that there are forward-past measurable events $G_j$ with $bb(P) \( G_j \) arrow.r 1$. For each $j$, suppose a finite measurable cover of $G_j$ assigns to each class a fixed finite path of genuine free facets connecting the edge endpoints. Assume each assigned facet can be forced during a bounded time interval with conditional probability at least $p_j > 0$, given the entire forward history at the start of that interval. Then the future contact graph connects the edge endpoints almost surely. If these assumptions hold for every lattice edge, that graph is connected.]
] <b:recurrence>

#proof[
  Use a time grid whose spacing accommodates a force attempt and is a multiple of $T$. Choose measurably one class at an overlap. Maintain a separate visit counter for each class and cycle through its assigned facets. On infinitely many visits to that class, each facet is attempted infinitely often. Conditional Borel–Cantelli, applied to the forward filtration, makes each such facet occur infinitely often: its conditional success probability at an attempted step is at least $p_j$.
  Stationarity and Poincare recurrence imply
  $ bb(P) \( upright("infinitely many visits to ") G_j \) gt.eq bb(P) \( G_j \) . $
  Some class is visited infinitely often on this event, and its contact path connects the prescribed endpoints. Let $j arrow.r oo$, and then intersect the resulting probability-one events over the countably many edges. Neither temporal ergodicity nor conditioning on a temporal invariant event is used. ◻
]

We next verify the forward-past premise in the infinite-volume law. This requires more than independence of future drives: finite-volume insulation marks may depend on distant initial data.

#thm([Lemma 5.6.])[
  (Passage of force opportunities to the bulk).  #emph[The finite-cover force and insulation estimates of Lemmas 19 and 20, with the improving good-configuration probabilities in 12 and (4.7), imply the hypotheses of Lemma 27 for the bulk environment.]
] <b:force-transfer>

#proof[
  Fix a lattice edge and a quality index $j$. Use the finite cover in Lemma 19, choosing the first neighborhood at an overlap. It has finitely many labels $1 \, dots.h \, M_j$, each carrying a fixed path of genuine free facets joining the edge endpoints. Artificial grounding is excluded by the collar slack, and there are no genuine pins or walls in this bulk test box. Let $G_(j \, n)$ mark the configurations satisfying the initial slack and insulation conditions, and let $L_(j \, n)$ be their cover label. The estimates give $bb(P) \( G_(j \, n) = 0 \) lt.eq delta_j + o \( 1 \)$ with $delta_j arrow.b 0$. The force duration and its positive probability $p_j$ may depend on $j$.
  At each time of a grid accommodating the force duration, these marks are functions of the full finite-volume initial configuration, before future drives are sampled. For an assigned facet $e$ write $C_e$ for the event of visiting that facet during the next force interval. The force and insulation proof, conditional on the full initial data, and independence of subsequent Brownian increments from the past give
  #[#set math.equation(numbering: n => "(5.2)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] Psi upright(bold(1))_({ G_(j \, n) = 1 \, L_(j \, n) = ell }) upright(bold(1))_(C_e) #scale(x: 120%, y: 120%)[\]] gt.eq p_j bb(E) #scale(x: 120%, y: 120%)[\[] Psi upright(bold(1))_({ G_(j \, n) = 1 \, L_(j \, n) = ell }) #scale(x: 120%, y: 120%)[\]] $ <b:finite-force-inequality>]
  for every bounded nonnegative function $Psi$ of the forward past. Here the initial bad-insulation event was discarded before forcing; no conditioning on a future cluster or future success event is used.
  Retain the finite-valued marks in the local extraction constructing the bulk law, for every fixed quality, spatial translate, and time $k T$. For attempts of a particular quality use a coarser subgrid whose spacing accommodates its force duration. A diagonal extraction is possible because these index sets are countable. The resulting marked extension is stationary. Its unmarked marginal is still the unique bulk environment of Proposition 23. The limiting marks need not be functions of the limiting initial state, and we do not assert that they are.
  Take $Psi$ to be a bounded nonnegative continuous cylinder function of the unmarked past. Visiting a specified facet in a fixed compact time interval is closed in the uniform local path topology: the maximum of its oriented edge gradient equals the facet bound. The discrete mark event is clopen. Thus the left integrand in (5.2) is upper semicontinuous, and Portmanteau gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] Psi upright(bold(1))_({ G_j = 1 \, L_j = ell }) upright(bold(1))_(C_e) #scale(x: 120%, y: 120%)[\]] gt.eq limsup_n bb(E) #scale(x: 120%, y: 120%)[\[] Psi upright(bold(1))_({ G_(j \, n) = 1 \, L_(j \, n) = ell }) upright(bold(1))_(C_e) #scale(x: 120%, y: 120%)[\]] gt.eq p_j bb(E) #scale(x: 120%, y: 120%)[\[] Psi upright(bold(1))_({ G_j = 1 \, L_j = ell }) #scale(x: 120%, y: 120%)[\]] . $
  The last expectation passes exactly by continuity. Approximation of finite-dimensional past laws by continuous functions, followed by a monotone-class argument over past cylinders, extends the inequality to every bounded nonnegative function of the full unmarked forward past $cal(F)_0$. Contact at a deterministic interval endpoint is a null event by Proposition 23, so the closed-event passage does not create an endpoint-only contact for the later tangent argument.
  Define
  $ a_ell = bb(P) \( G_j = 1 \, L_j = ell divides cal(F)_0 \) \, #h(2em) a = sum_(ell = 1)^(M_j) a_ell . $
  Dropping the mark from the left side of the preceding inequality gives $bb(P) \( C_e divides cal(F)_0 \) gt.eq p_j a_ell$ for every facet of the path with label $ell$. Since $bb(E) \( 1 - a \) lt.eq delta_j$, $bb(P) \( a < 1 \/ 2 \) lt.eq 2 delta_j$. On ${ a gt.eq 1 \/ 2 }$ choose a maximizing label, with a fixed tie rule. Every facet of its path then has conditional contact probability at least $p_j \/ \( 2 M_j \)$. These are the required forward-past measurable opportunity classes. Choose conditional-expectation versions equivariantly under the countable spatial and time shifts; their joint law is stationary. Their probabilities approach one, so Lemma 27 applies. The auxiliary marks served only in the transfer; the resulting contact-connectivity assertion concerns the original environment alone. ◻
]

#thm([Lemma 5.7.])[
  (Zero-slope uniqueness).  #emph[A controlled tangent solution of slope zero is spatially constant.]
] <b:zero-slope>

#proof[
  Let $a$ be a nonnegative compactly supported Lipschitz function, equal to one on the unit ball. For $M = epsilon R$, let
  $ Phi_M \( s \) = cases(delim: "{", s^2 \, & \| s \| lt.eq M \,, 2 M \| s \| - M^2 \, & \| s \| > M \,) #h(2em) F_R \( w \) = min_c sum_x a \( x \/ R \) Phi_M \( w_x - c \) . $
  Its Lipschitz constant in each input coordinate is bounded by $2 M a \( x \/ R \)$. Hence $F_R \( J w \) - F_R \( w \)$ is integrable, although the two terms need not separately have finite expectations. They have the same distribution by time stationarity. Truncate each scalar minimum at level $K$ and use $\| \( s and K \) - \( t and K \) \| lt.eq \| s - t \|$; dominated convergence gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ bb(E) \[ F_R \( J w \) - F_R \( w \) \] = 0 . $ <b:stationary-loss>]
  Choose a minimizing center $c_R$. On a cluster $C$ set $a_C = min_(x in C) a \( x \/ R \)$ and
  $ D_C^Phi = sum_(x in C) { Phi_M \( w_x - c_R \) - Phi_M \( \( J w \)_x - c_R \) } gt.eq 0 . $
  Clusterwise Jensen and evaluation of the new minimum at $c_R$ give
  #[#set math.equation(numbering: n => "(5.4)")
   $ F_R \( J w \) - F_R \( w \) lt.eq - sum_C a_C D_C^Phi + C epsilon sum_(C : C ∩ "supp" \( a \( dot.op \/ R \) \) eq.not diameter) sum_(x in C) H_x^k \| \( J w - w \)_x \| . $ <b:huber-cutoff>]
  Indeed the cutoff oscillation on $C$ is at most $C "diam" \( C \) \/ R$, while $Phi_M$ is $2 epsilon R$-Lipschitz. The controlled displacement moments bound the expectation of the last sum by $C R^2$; clusters reaching the support from outside are covered by a further fixed power of $H_x$. Equations (5.3)–(5.4) therefore bound the normalized expected convex loss by $C epsilon$.
  For fixed $epsilon > 0$, volume sublinearity puts all but a vanishing fraction of the weighted sites within $o \( R \)$ of a common center. The Huber minimizer is itself $o \( R \)$ from that center. To verify this, the derivative from an exceptional fraction $delta$ of sites is at most $2 epsilon R delta$ times total weight; the derivative from the remaining sites has a fixed sign and larger magnitude if the center is displaced by more than their oscillation plus $C epsilon R delta$. Thus such a displacement cannot minimize the loss.
  First bound cluster size. The entire input of a typical interior cluster then lies in the quadratic region, with probability tending to one. Stochastic averaging keeps its output there. On that cluster $D_C^Phi = sum_C \( w_x^2 - \( J w \)_x^2 \)$, independently of the center. The stationary integrable quadratic loss allows the exceptional fraction to be discarded by truncating that loss before taking $R arrow.r oo$. The cluster-size restriction is then removed using its moments. It follows that $bb(E) d_0 lt.eq C epsilon$. Send $epsilon arrow.b 0$.
  Each factor of $J$ is an orthogonal averaging projection. Its quadratic loss is nonnegative, and the losses telescope. Zero total loss therefore makes every constituent projection fix its input. The relative heights are constant in time, and each actual contact equates its incident values. Lemma 27 connects every pair of neighboring sites and proves spatial constancy. This argument never conditions on the tangent solution, which may depend on future drives. ◻
]

=== 5.4 Mean flux and the macroscopic equation <mean-flux-and-the-macroscopic-equation>

For a controlled solution define the cluster-averaged flux at $x$ by

#[#set math.equation(numbering: n => "(5.5)")
 $ cal(J)_x \( w \) = - frac(1, T \| C_x \|) sum_(y in C_x) \( y - overline(C)_x \) \( J w - w \)_y \, #h(2em) overline(C)_x = frac(1, \| C_x \|) sum_(y in C_x) y . $ <b:flux-definition>]

Conservation makes this independent of the chosen cluster origin, and the controlled moments make it integrable. Write $j \( q \) = bb(E) cal(J)_0 \( w \)$ when the slope is $q$. The minus sign is the sign of down-gradient transport.

#thm([Proposition 5.8.])[
  (The cell flux and weak equation).  #emph[Under the preceding inputs, $j \( q \)$ is well defined on the vector space of attained slopes and is linear there. If any nonzero slope is attained, every slope in $bb(R)^2$ is attained and $j \( q \) = A q$ for a finite scalar $A$. For a stationary comparison with drift difference $n^(- 2) b \( x \/ n \)$, every subsequential expected macroscopic difference $m$ satisfies 
#[#set math.equation(numbering: n => "(5.6)")
 $ integral j \( nabla m \) dot.op nabla f = integral b f \, #h(2em) f in C_c^oo \( U \) \, $ <b:weak-equation>]

 in each limiting open region $U$ free of observations.]
] <b:cell>

#proof[
  Join two solutions of the same slope relatively independently over the full two-sided environment. The joining is invariant under space and time shifts. Their difference has zero slope; its dissipation and controlled displacements are bounded by constant multiples of the sums for the two solutions. Lemma 29 makes their relative heights identical. This proves uniqueness of flux, including conditional uniqueness given the environment. Addition of joined solutions and scalar multiplication preserve the controlled class. Hence the attained slopes form a vector subspace and the flux is linear on it.
  The bulk law is invariant under lattice rotations and reflections, since it is the unique limit of the symmetric zero-boundary model. A nonzero attained slope and its sixty-degree rotation span $bb(R)^2$. The resulting linear flux map commutes with these rotations and reflections. A real two-dimensional map commuting with a nontrivial sixty-degree rotation is a scalar matrix plus a scalar multiple of the quarter-turn matrix; a reflection eliminates the latter. Thus $j \( q \) = A q$. Its coefficient is finite by the integrability of (5.5).
  We justify passage of fluxes to expectations. At a volume-sampled site let $D_n = n^2 e_C^2 \/ \| C \|$ and $H_n = \| C \|$. A scaled step displacement, or the scaled cluster first moment per site, obeys
  $ \| F_n \| lt.eq C H_n^a sqrt(D_n) $
  for a fixed $a$. For $1 < r < 2$,
  #[#set math.equation(numbering: n => "(5.7)")
   $ bb(E) \| F_n \|^r lt.eq C \( bb(E) D_n \)^(r \/ 2) \( bb(E) H_n^(2 a r \/ \( 2 - r \)) \)^(\( 2 - r \) \/ 2) . $ <b:flux-ui>]
  The right side is bounded. Thus these fluxes are uniformly integrable; a moment of $D_n$ larger than one is not needed. Exceptional localization events are removed using the polynomial error bounds in the comparison estimate before applying this calculation.
  Test stationarity of $z$ over one step against $f \( x \/ n \)$. On each complete free cluster, the constant Taylor term sees only the added mass $T n^(- 2) sum_(x in C) b \( x \/ n \)$, because reflections conserve the sum. The first-order Taylor term is the negative of the cluster first moment in (5.5), with the height differences multiplied by $n$ and with an overall factor $T n^(- 2)$. The second-order remainder has expected magnitude bounded by
  $ C n^(- 3) bb(E) sum_(x in n "supp" \( f \) + O \( H_x \)) H_x^a \| n \( z_T \( x \) - z_0 \( x \) \) \| = O \( n^(- 1) \) . $
  The same moment estimate handles clusters touching the edge of the testing region. The contribution of the added drift to the cluster first moment is also $o \( 1 \)$. Lemmas 24 and 26, finite-cluster truncation, and (5.7) identify the limiting transport term as the conditional mean of $j \( q \)$. The source and flux Riemann sums both carry the density $v$, which cancels. Linearity and Lemma 26 give $bb(E) \[ j \( q \) divides y \] = j \( nabla m \( y \) \)$, proving (5.6). If the attained subspace is zero, this argument still applies and its flux is identically zero. ◻
]

=== 5.5 Positive response and the limiting mean <positive-response-and-the-limiting-mean>

The scalar has not yet been shown nonzero. A positive source in a domain with fixed zero boundary data supplies this information and, at the same time, fixes the boundary condition in the response equation.

#thm([Proposition 5.9.])[
  (Dirichlet response).  #emph[Assume the comparison and average estimates hold up to identical fixed boundaries of lattice domains converging to a bounded smooth domain $D$. Then every slope is attained and the scalar in Proposition 30 satisfies $0 < A < oo$. For sufficiently small smooth sources $b$, the mean response to relative drift $n^(- 2) b \( x \/ n \)$ converges to 
$ A^(- 1) \( - Delta_D \)^(- 1) b . $

 For boundary values $+ lambda$ and $- lambda$ on the two marked arcs, the untilted mean converges to their bounded harmonic extension.]
] <b:response>

#proof[
  Begin with zero fixed boundary values, and compare the untilted law with its tilt by a nonzero nonnegative smooth source. The filled coupled difference, extended by zero across its common pinned boundary, is bounded in $W^(1 \, p) \( bb(R)^2 \)$ for some $p > 1$, by Lemma 21. To recall its geometric content, put the original difference equal to zero on the boundary and exterior, and retain the coercive edges incident to the common pins. Whenever a hole meets this connected zero set, a path to infinity exits through a zero rim vertex; choose that vertex as the hole’s anchor. The usual rim energy estimate holds for this anchor, so the extension is still bounded in $W^(1 \, p)$ and remains exactly zero outside the polygon. Its expected value is therefore weakly compact in that space and strongly compact locally in $L^p$. The original and filled expectations have the same limit.
  Uniform convergence of the polygonal boundaries to the smooth boundary implies that this zero extension vanishes outside an arbitrarily small neighborhood of $overline(D)$. Its limiting extension consequently vanishes outside $D$. The Sobolev trace theorem for a smooth domain gives $m in W_0^(1 \, p) \( D \)$. Thus no assertion about random slit covariance is needed for this ordinary boundary identification.
  If only slope zero were attained, (5.6) would give $integral b f = 0$ for every compact test, a contradiction. A nonzero slope is therefore attained, so the cell flux is $A q$ on all of $bb(R)^2$. The same identity excludes $A = 0$.
  For completeness, the zero-trace weak equation has a unique $W_0^(1 \, p) \( D \)$ solution even before an energy-space conclusion is known. If $u$ is the difference of two such solutions, take a smooth compact test $g$ and solve $- Delta phi.alt = g$ with zero boundary data on smooth $D$. The solution is smooth up to the boundary. Approximate $phi.alt$ in $W_0^(1 \, p') \( D \)$ by compactly supported smooth functions in the weak harmonic equation, and integrate by parts using the zero trace of $u$. This gives $integral u g = 0$. Hence $m = A^(- 1) \( - Delta_D \)^(- 1) b$. Monotonicity under the nonnegative tilt gives $m gt.eq 0$. The Dirichlet Green solution of a nonzero nonnegative source is positive, so $A < 0$ is impossible. This proves $A > 0$.
  For arbitrary identical bounded boundary data, the same zero-extension argument and weak identity identify every mean-response subsequence with $A^(- 1) \( - Delta_D \)^(- 1) b$. Compactness therefore gives full convergence.
  For the untilted mean, compare the prescribed-boundary bath with the zero-boundary bath on the same domain. The latter has mean zero by height reflection symmetry. Proposition 30, with source zero, makes every limiting prescribed mean harmonic. Monotone comparison with the zero-boundary law shifted by $plus.minus lambda$ bounds this mean between $- lambda$ and $lambda$. Near a compact subarc, compare instead with the zero-boundary law shifted by that arc’s prescribed value. The coupled difference has exact zero boundary on that subarc. A cutoff supported away from the marks permits the same local zero-extension argument, giving the stated trace. A bounded harmonic function in smooth $D$ is uniquely determined by these two open-arc values; the two marked points have zero harmonic measure. This identifies the mean and every subsequence. ◻
]

=== 5.6 Gaussian fluctuations <gaussian-fluctuations>

#thm([Theorem 5.10.])[
  (Field limit).  #emph[Under the inputs of this section for the ordinary fixed-boundary domains, the centered affinely interpolated field converges as a random distribution to $sigma$ times the Dirichlet Gaussian free field with covariance $\( - Delta_D \)^(- 1)$, where 
$ sigma^2 = \( v A \)^(- 1) . $

 The stiffness is $v A$, and the limiting mean is the harmonic extension identified in Proposition 31.]
] <b:gff>

#proof[
  For real $f in C_c^oo \( D \)$ define
  $ X_n \( f \) = frac(1, v n^2) sum_(x in V_n) f \( x \/ n \) \( h_x - bb(E) h_x \) \, #h(2em) L_n \( t \) = log bb(E) e^(t X_n \( f \)) . $
  By 2, there is $a_f > 0$ such that $sup_n bb(E) e^(a_f \| X_n \( f \) \|) < oo$. Tilting by $e^(t X_n \( f \))$ adds drift $n^(- 2) t f \/ v$ to the variance-two reflected diffusion. Proposition 31 therefore gives, for sufficiently small $t$,
  $ L'_n \( t \) = bb(E)_(n \, t) X_n \( f \) arrow.r frac(t, v A) integral_D f \( - Delta_D \)^(- 1) f . $
  For $\| t \| lt.eq a_f \/ 2$, Jensen’s inequality bounds the denominator of the tilted expectation below by one, while
  $ \| L'_n \( t \) \| lt.eq bb(E) \[ \| X_n \( f \) \| e^(a_f \| X_n \( f \) \| \/ 2) \] lt.eq C_(a_f) bb(E) e^(a_f \| X_n \( f \) \|) . $
  Integration from zero and dominated convergence yield the Gaussian log moment-generating function near zero. The exponential bound gives tightness and uniform integrability of these moment-generating functions; uniqueness identifies every subsequential scalar law. Apply the same argument to every finite real linear combination of tests to obtain Gaussian finite-dimensional laws with covariance $\( v A \)^(- 1) \( - Delta_D \)^(- 1)$.
  Here is the required distributional tightness. The anchored and equal-mass average bounds in 2 give bounded second moments for the coarse coefficients of a compactly supported wavelet expansion. A normalized two-dimensional wavelet at spatial scale $2^(- j)$ has coefficient equal to $O \( 2^(- j) \)$ times a smooth average difference. Thus its variance is $O \( 2^(- 2 j) \)$ while there are $O \( 2^(2 j) \)$ coefficients at that scale. Summation with weights $2^(- 2 s j)$ gives a uniform local $H^(- s)$ second moment for each $s > 0$, down to the lattice scale. At finer scales the deterministic physical Lipschitz bound $O \( n \)$ for the interpolant gives total squared coefficients $O \( n^2 2^(- 2 j) \)$, whose weighted tail is bounded as well. Compact Sobolev embedding into a slightly more negative order and a countable interior exhaustion give tightness as distributions.
  Finally the Riemann pairing and affine pairing have vanishing difference. An interior nodal hat function has integral $\( v n^2 \)^(- 1)$ and, by the symmetry of its triangular star, zero first moment about its vertex. Taylor expansion of $f$ therefore gives
  $ integral f h^(upright("aff")) - frac(1, v n^2) sum_x f \( x \/ n \) h_x = O #h(-0.16667em) (n^(- 2) 1 / n^2 sum_(x upright(" near ") n "supp" \( f \)) \| h_x \|) . $
  Deterministic Lipschitzness and bounded boundary values give $\| h_x \| = O \( n \)$ in the bounded rescaled domain, so this error is $O \( n^(- 1) \)$. The same is true after centering. The scalar limits and tightness thus identify the asserted affinely interpolated distributional limit. ◻
]

== 6 Traces on varying planar continua <sec:trace-analysis>

The cell construction has identified the interior equation for a limiting mean response. To identify that response in a domain cut by observed sign strings, we must also recover the zero boundary values on their limiting closed set. This set may have positive area, so we must identify the response almost everywhere on this set as well as in its open complement. The following analytic argument uses Sobolev bounds, weighted errors at observed sites, and the geometry of connected observed sets to identify the Dirichlet Poisson solution.

Fix a bounded square $Q$ and a larger square $Q^(*)$ with $overline(Q) subset Q^(*)$. All Sobolev functions below are defined on $Q^(*)$; only their restrictions to $Q$ are relevant. This convention removes extension issues when taking averages near $partial Q$. Choose a nonnegative smooth radial function $phi$ supported in the unit disk, of integral one, and write $P_r u = phi_r * u$ wherever the averaging disk lies in $Q^(*)$. The Dirichlet Green operator on an arbitrary open set $V subset Q$ is denoted by $G_V = \( - Delta_V \)^(- 1)$. Its solutions and its quadratic form are extended by zero outside $V$.

#prodef([Definition 6.1.])[
  (Thickness of an observed set).  A compact set $K subset overline(Q)$ containing $partial Q$ has #emph[continuum thickness below $r_0$] if, for each $x in K$ and $0 < r < r_0$, there is a compact connected set
  $ x in L subset K ∩ overline(B) \( x \, 2 r \) \, #h(2em) "diam" L gt.eq r . $
  For mesh approximants the same condition is required only for $c \/ n lt.eq r < r_0$, with fixed $c$. All uniform assertions about a family of observed sets use common constants $c \, r_0$.
] <t:thickness>

A connected compact set of diameter at least $4 r_0$ has this property: the component through $x$ of its intersection with a closed ball meets the boundary of that ball whenever the original continuum leaves the ball. This is the elementary boundary-bumping property of continua. Thus a fixed finite union of continua whose diameters have a common positive lower bound also qualifies, after decreasing $r_0$. Connectedness of the whole observed set $K$ is sufficient after decreasing $r_0$, but not necessary. In a localized application one works below the lower bound on the diameters of the components that meet the window. A singleton observation does not qualify.

#prodef([Definition 6.2.])[
  (Frostman testing measures).  For $0 < alpha lt.eq 1$ and $M < oo$, let $cal(M)_alpha \( M \)$ consist of positive measures supported in $overline(Q)$ satisfying
  $ mu \( overline(Q) \) lt.eq M \, #h(2em) mu \( B \( x \, r \) \) lt.eq M r^alpha quad \( 0 < r lt.eq 1 \) . $
  The statement that a Sobolev function has zero $alpha$-Frostman trace on $K$ means that its trace vanishes in $L^1 \( mu \)$ for every $mu in union.big_(M < oo) cal(M)_alpha \( M \)$ supported on $K$.
] <t:frostman-definition>

#thm([Lemma 6.3.])[
  (Quantitative averaged traces).  #emph[Let $1 < p < 2$, $0 < alpha lt.eq 1$, and $p + alpha > 2$. Every $u in W^(1 \, p) \( Q^(*) \)$ has a trace $T_mu u in L^1 \( mu \)$ for $mu in cal(M)_alpha \( M \)$, and 
#[#set math.equation(numbering: n => "(6.1)")
 $ integral \| T_mu u - P_r u \| thin upright(d) mu lt.eq C r^beta parallel nabla u parallel_(L^p \( Q^(*) \)) \, #h(2em) beta = 1 - frac(2 - alpha, p) > 0 . $ <t:trace-rate>]

 The constant is uniform over $cal(M)_alpha \( M \)$.]
  #emph[For a piecewise affine mesh function $u_n$, suppose instead that a measure on mesh vertices satisfies 
#[#set math.equation(numbering: n => "(6.2)")
 $ mu_n \( B \( x \, r \) \) lt.eq C \( r + ell_n \/ n \)^alpha \, #h(2em) mu_n \( overline(Q) \) lt.eq C \, $ <t:coarse-frostman>]

 where $1 lt.eq ell_n lt.eq C \( log n \)^C$. Then, for fixed $r > 0$, 
#[#set math.equation(numbering: n => "(6.3)")
 $ integral \| u_n - P_r u_n \| thin upright(d) mu_n lt.eq C (r^beta + ell_n^(alpha \/ p) n^(- beta)) parallel nabla u_n parallel_(L^p \( Q^(*) \)) . $ <t:mesh-trace-rate>]

]
] <t:frostman>

#proof[
  Poincare’s inequality for two nested averaging disks gives
  $ \| P_s u \( x \) - P_(s \/ 2) u \( x \) \| lt.eq C s integral.slash_(B \( x \, C s \)) \| nabla u \( y \) \| thin upright(d) y . $
  Holder’s inequality with respect to $mu$, followed by Fubini, bounds its integral by
  $ C s (integral integral.slash_(B \( x \, C s \)) \| nabla u \( y \) \|^p thin upright(d) y thin upright(d) mu \( x \))^(1 \/ p) lt.eq C s^(1 + \( alpha - 2 \) \/ p) parallel nabla u parallel_p . $
  The positive exponent makes the dyadic sum converge. Its limit constructs the trace and proves (6.1); smooth approximation shows that the construction is independent of the chosen averaging kernel.
  For (6.3), use the same sum down to the mesh scale. Above $ell_n \/ n$ it is bounded as before. Below that scale its terms are at most $C s^(1 - 2 \/ p) \( ell_n \/ n \)^(alpha \/ p) parallel nabla u_n parallel_p$. Their sum down to $1 \/ n$ is bounded by the smallest-scale term, namely $C ell_n^(alpha \/ p) n^(- beta) parallel nabla u_n parallel_p$. The difference between a vertex value and its mesh-scale average has the same bound, by affine interpolation on the bounded number of incident triangles and the same Holder calculation. ◻
]

#thm([Lemma 6.4.])[
  (Transporting testing measures).  #emph[Suppose $K$ has continuum thickness below $r_0$. If $mu in cal(M)_alpha \( M \)$ is supported within distance $eta$ of $K$, where $0 < eta < r_0 \/ 10$, there is a measure $nu in cal(M)_alpha \( C M \)$ supported on $K$ and a coupling $pi$ of $mu \, nu$ supported on $\| x - y \| lt.eq C eta$. Consequently 
#[#set math.equation(numbering: n => "(6.4)")
 $ integral \| T_mu u \( x \) - T_nu u \( y \) \| thin upright(d) pi \( x \, y \) lt.eq C eta^beta parallel nabla u parallel_p $ <t:transport-trace>]

 under the exponent assumptions of Lemma 35.]
  #emph[If mesh sets $K_n$ have the common thickness constants and converge to $K$ in Hausdorff distance, every such measure supported on $K$ is the weak limit of continuous measures in $cal(M)_alpha \( C M \)$ supported on $K_n$. For geometric mesh graphs, these may additionally be projected onto their vertices, giving the common bound $C \( r + n^(- 1) \)^alpha$.]
] <t:transport>

#proof[
  Partition the plane into squares of side $eta$. For each square with positive mass choose a nearby point of $K$ and, by thickness, a continuum of diameter at least $eta$ within distance $C eta$ of the square. Such a continuum supports a probability measure $nu_S$ with
  $ nu_S \( B \( x \, r \) \) lt.eq C min { 1 \, r \/ eta } . $
  To construct it, project onto a coordinate axis on which the diameter is at least $eta \/ sqrt(2)$ and lift normalized Lebesgue measure on the projection interval by choosing the point with smallest remaining coordinate in each fiber. Compactness makes this selection Borel. The projection of a disk of radius $r$ has length at most $2 r$.
  Move the mass of each square to this measure. If $r < eta$, at most a bounded number of the chosen continua can meet a specified $r$-ball, since each is within $C eta$ of its assigned square. The resulting mass is at most $C M eta^alpha \( r \/ eta \) lt.eq C M r^alpha$. For $r gt.eq eta$, use the original mass bound in the $C eta$ enlargement of the ball. This proves the measure assertion and the displacement bound. Compare each trace value with its $eta$ average using (6.1). For paired points the difference of their averages is at most $C eta integral.slash_(B \( x \, C eta \)) \| nabla u \|$. Integrating as in the preceding proof gives (6.4).
  For the final assertion take $eta_n arrow.b 0$ larger than both the Hausdorff distance and a fixed multiple of $n^(- 1)$. Perform the same construction on $K_n$ at scale $eta_n$, and project its measures onto vertices at distance $O \( n^(- 1) \)$ only if desired. Before this projection the measures are genuinely Frostman at every scale. Projection changes the mass bound to $C \( r + n^(- 1) \)^alpha$ and does not change the weak limit. ◻
]

The next calculation records exactly how weighted common-wall errors enter the trace. It requires more than an estimate for free-edge gradients.

#thm([Lemma 6.5.])[
  (Weighted anchor errors).  #emph[Let $q > 1$, and let $S_n$ be retained observed vertices with positive weights $w_x$. Suppose 
$ sum_(x in S_n) w_x \| z_x \|^2 lt.eq E_n \, #h(2em) n^(- 2) sum_(x in S_n) w_x^(- q) lt.eq C_q . $

 For a probability measure $mu_n$ on these vertices with $a_n = max_x mu_n \( { x } \)$, 
#[#set math.equation(numbering: n => "(6.5)")
 $ sum_x mu_n \( { x } \) \| z_x \| lt.eq C_q E_n^(1 \/ 2) n^(1 \/ q) a_n^(\( 1 + 1 \/ q \) \/ 2) . $ <t:anchor-rate>]

 In particular, if $a_n lt.eq C \( ell_n \/ n \)^alpha$, the bound tends to zero in expectation when $sup_n bb(E) E_n < oo$ and $q > \( 2 - alpha \) \/ alpha$. The deterministic inverse-weight bound may hold outside exceptional events, provided their contributions to the displayed quantities tend to zero.]
] <t:anchors>

#proof[
  Cauchy–Schwarz gives the upper bound $E_n^(1 \/ 2) \( sum_x mu_n \( x \)^2 \/ w_x \)^(1 \/ 2)$. Holder and $sum_x mu_n \( x \) = 1$ give
  $ sum_x frac(mu_n \( x \)^2, w_x) lt.eq (sum_x w_x^(- q))^(1 \/ q) (sum_x mu_n \( x \)^(2 q \/ \( q - 1 \)))^(\( q - 1 \) \/ q) lt.eq C_q n^(2 \/ q) a_n^(1 + 1 \/ q) . $
  The resulting power of $n$ is $- alpha \/ 2 + \( 2 - alpha \) \/ \( 2 q \) < 0$. Polylogarithmic factors do not affect convergence, and $bb(E) E_n^(1 \/ 2) lt.eq \( bb(E) E_n \)^(1 \/ 2)$. ◻
]

#thm([Proposition 6.6.])[
  (Varying observed sets and filled values).  #emph[Let $K_n$ have the mesh thickness property with common constants and converge in Hausdorff distance to $K$. Let their mesh vertices carry random values $z_n$, and let $U_n$ be random piecewise affine extensions on $Q^(*)$. Fix $3 \/ 2 < p < 2$. Assume the following bounds, uniformly in $n$:]
  + #emph[$bb(E) parallel U_n parallel_(W^(1 \, p)) lt.eq C$, and the means $bb(E) U_n$ have a subsequence converging strongly in $L^p$ to $u$;]
  + #emph[every vertex on $K_n$ can be moved to a retained vertex on $K_n$ within distance $ell_n \/ n$, where $ell_n lt.eq C \( log n \)^C$;]
  + #emph[$U_n = z_n$ at retained vertices, and their values satisfy Lemma 37 for some $q > 3$, with $bb(E) E_n lt.eq C$;]
  + #emph[exceptional events in these assertions have vanishing contribution to the Sobolev, anchor, and fixed-scale averaged quantities used here.]
  #emph[Then $u$ has zero $1 \/ 2$-Frostman trace on $K$ and is zero Lebesgue-almost everywhere on $K$. If the original interpolated values also satisfy 
#[#set math.equation(numbering: n => "(6.6)")
 $ bb(E) parallel z_n - U_n parallel_(L^1 \( Q \)) arrow.r 0 \, $ <t:original-filled>]

 then the original mean responses have the same distributional limit, including for smooth tests whose supports meet $K$.]
] <t:varying-trace>

#proof[
  Fix a $1 \/ 2$-Frostman measure $mu$ on $K$ and approximate it by the deterministic measures of Lemma 36. Move their mass to the retained vertices by the map in the hypotheses. The moved measures may depend on the sample; they obey (6.2) with the same deterministic constants. Lemma 37 makes their integrals of $\| U_n \|$ tend to zero in expectation. Lemma 35 bounds the error on replacing $U_n$ by $P_r U_n$ by $C r^beta + o \( 1 \)$.
  Keep $r > 0$ fixed before removing the random movement of the testing sites. Its additional error is at most
  $ C ell_n n^(- 1) parallel nabla P_r U_n parallel_oo lt.eq C_r ell_n n^(- 1) parallel U_n parallel_(W^(1 \, p)) \, $
  whose expectation tends to zero. We may now take expectation with the original deterministic testing measure. This order is essential: expectations of field–measure products have not been factorized. Strong $L^p$ convergence makes $P_r bb(E) U_n$ converge uniformly to $P_r u$. Weak convergence of the deterministic measures therefore gives
  $ integral \| P_r u \| thin upright(d) mu lt.eq C r^beta . $
  Another application of (6.1), followed by $r arrow.b 0$, proves the zero trace. Lebesgue measure restricted to $K$ belongs, up to a constant, to $cal(M)_(1 \/ 2) \( M \)$ on the bounded square. Its Sobolev trace agrees almost everywhere with $u$, which proves the area assertion. Finally (6.6) proves the equality of the two distributional limits. ◻
]

#thm([Lemma 6.7.])[
  (Uniform Brownian approach measures).  #emph[Let $K$ have continuum thickness, put $V = Q \\ K$, and fix $z in V$. For sufficiently small $epsilon > 0$, let $V_epsilon$ be the component containing $z$ of ${ x in V : "dist" \( x \, V^c \) > epsilon }$. The exit law $mu_(z \, epsilon)$ of Brownian motion from $V_epsilon$ satisfies 
#[#set math.equation(numbering: n => "(6.7)")
 $ mu_(z \, epsilon) \( B \( x \, r \) \) lt.eq C_z r^(1 \/ 2) \, $ <t:exit-frostman>]

 uniformly in $epsilon$. The constant is uniform for $z$ a positive distance from $K$, and depends on the common thickness constants and $Q$.]
] <t:exit>

#proof[
  We use the planar Beurling estimate in its equivalent inward form: if an obstacle contains a continuum crossing the annulus between radii $r$ and $R$, the probability, from outside the outer circle, of reaching the inner circle before the obstacle is at most $C \( r \/ R \)^(1 \/ 2)$. The inward form follows from the usual outward estimate by inversion; this is the Brownian estimate used in the boundary sampling arguments of [14].
  Each component of the closed $epsilon$ neighborhood of $K$ contains a continuum of diameter bounded below by the thickness scale. The same is true of the exterior obstacle. If an $r$-ball meets the support of the exit law, its obstacle component therefore crosses an annulus from radius $O \( r \)$ to a fixed radius $R < c min { r_0 \, "dist" \( z \, K \) }$, unless $r$ is already comparable to $R$. Apply the inward estimate; in the latter case total mass one suffices. The argument is unchanged when $V_epsilon$ has several boundary components. ◻
]

#thm([Theorem 6.8.])[
  (Poisson uniqueness from Frostman traces).  #emph[Let $K subset overline(Q)$ contain $partial Q$ and have continuum thickness below $r_0$. Let $3 \/ 2 < p < 2$, $A > 0$, and $b in L^oo \( Q \)$. Suppose $u in W^(1 \, p) \( Q^(*) \)$ has zero $1 \/ 2$-Frostman trace on $K$ and 
$ - A Delta u = b quad upright("in ") V = Q \\ K $

 in the sense of distributions. Then, on $Q$, 
#[#set math.equation(numbering: n => "(6.8)")
 $ u = A^(- 1) G_V b \, $ <t:poisson-identification>]

 where the right side is extended by zero on $K$. In particular the restriction of $u$ to $V$ belongs to $H_0^1 \( V \)$.]
] <t:trace>

#proof[
  Let $v = A^(- 1) G_V b$, defined variationally in $H_0^1 \( V \)$ and extended by zero. The Poincare inequality inherited from $Q$ gives existence. Its zero extension is in $W^(1 \, p) \( Q^(*) \)$. Approximating it in $H^1$ by functions in $C_c^oo \( V \)$, and using Lemma 35, proves that $v$ has zero $1 \/ 2$-Frostman trace on $K$.
  Thus $w = u - v$ is harmonic on $V$ and has the same zero traces. Fix $z in V$ and use Lemma 39. Transport $mu_(z \, epsilon)$ to a measure on $K$ by Lemma 36; its support is within distance $epsilon$ of $K$. Since $beta = 1 - 3 \/ \( 2 p \) > 0$, (6.4) yields
  $ bb(E)_z \| w \( B_(tau_(V_epsilon)) \) \| lt.eq C_z epsilon^(1 - 3 \/ \( 2 p \)) parallel nabla w parallel_p arrow.r 0 . $
  The Sobolev trace on this interior boundary equals the smooth harmonic representative of $w$. For each fixed $epsilon$, that representative is bounded on the compact closure of $V_epsilon$. Optional stopping, or the mean-value characterization of harmonic measure, gives $w \( z \) = bb(E)_z w \( B_(tau_(V_epsilon)) \) = 0$ in the limit. This works in each component of $V$. The zero trace tested against Lebesgue measure on $K$ also gives $u = 0$ almost everywhere there, completing (6.8) on all of $Q$. ◻
]

#prodef([Remark 6.9.])[
  (The boundary notion and the order of limits).  The proof does not promote a $W^(1 \, p)$ trace directly to an $H^1$ capacity trace. It first proves equality with the variational Green solution; the $H^1$ assertion follows afterwards. In a lattice application, fix $epsilon$ and use radial ball averages of radius less than $epsilon \/ 2$ before passing to a limit. Their limits equal the harmonic function at their centers by the mean-value property. No convergence of unaveraged lattice point values is required.
  Thickness cannot simply be dropped. On the punctured unit disk, $log \( 1 \/ \| x \| \)$ is harmonic, has zero outer trace, and belongs to $W^(1 \, p)$ for every $p < 2$. The singleton has zero $p$-capacity, and its neighborhood hitting probabilities decay only logarithmically, so (6.7) fails. Conversely, the usual slit-tip singularity $r^(- 1 \/ 2) sin \( theta \/ 2 \)$ has gradient in $L^p$ only for $p < 4 \/ 3$ and does not satisfy the hypotheses above.
]

== 7 Conditional Dirichlet covariance <sec:conditional-covariance>

The response argument in Section 5 identified the Gaussian covariance for ordinary fixed-boundary domains. We now identify the conditional covariance when internal oriented strands have also been observed. A common sign wall does not make the two coupled heights equal there. Instead, the squared common-wall errors in the comparison estimate, together with thickness of the observed set, give zero trace for the limiting response. The preceding analytic section then identifies the response as the Dirichlet Green solution, and exponential tilting gives the covariance. This argument uses no interface convergence or height-gap theorem.

=== 7.1 The uniform input and the conditioning class <the-uniform-input-and-the-conditioning-class>

For each mesh $n^(- 1)$ let $cal(S)_n$ be a family of deterministic oriented sign-string configurations with ordinary one-sided sign walls, fixed Dirichlet values in $\[ - 1 \/ 2 \, 1 \/ 2 \]$, and positive-volume conditional height polytopes. The sign strings are of the type specified in 12; no further exact-height transcript is fixed. Denote their conditional laws by $P_(n \, s)$, $s in cal(S)_n$. Realize each observed set as a closed geometric set $K_(n \, s) subset overline(Q)$ containing $partial Q$: join the observed lattice vertices along their strings, include the exterior fixed region, and use a fixed $O \( n^(- 1) \)$ convention at faces. Such conventions have the same Hausdorff limits. Require the common mesh thickness constants of Definition 33. Write $V_(n \, s) = Q \\ K_(n \, s)$.

The following are the exact forms of the preceding estimates used here. They make the scope of the uniform assertion explicit. All constants may depend on a fixed compact family $cal(C) subset C_c^oo \( Q \)$ of real test functions, but not on $n$ or $s$.

+ The centered Riemann pairings
  $ X_(n \, s) \( f \) = frac(1, v n^2) sum_x f \( x \) #scale(x: 120%, y: 120%)[\(] h_n \( x \) - bb(E)_(n \, s) h_n \( x \) #scale(x: 120%, y: 120%)[\)] $
  obey $sup_(n \, s \, f in cal(C)) bb(E)_(n \, s) e^(a \| X_(n \, s) \( f \) \|) < oo$ for some $a > 0$. The estimate also holds for the fixed finite linear combinations used for joint tests. This is the form of 2 used below.
+ For each fixed $\| t \| < a \/ 2$ couple $P_(n \, s)$ to its tilt by $e^(t X_(n \, s) \( f \))$ using the common sign walls. For their difference $z_(n \, s \, t)$, the filled extension $U_(n \, s \, t)$ supplied by 6 and 15 satisfies every hypothesis of Proposition 38, including (6.6), uniformly in $s$ and in $f in cal(C)$. In particular its energy includes squared common-wall errors. Its inverse-weight spatial moments have deterministic bounds off exceptional events whose contributions vanish. Expectation-only bounds for a random weight constant are not silently multiplied by an energy known only in $L^1$.
+ For every deterministic sequence $s_n \, f_n$ with $f_n$ converging in $cal(C)$ and $K_(n \, s_n)$ converging in Hausdorff distance to $K$, the bulk identity 30 identifies each limit of the mean response by
  #[#set math.equation(numbering: n => "(7.1)")
   $ A integral_(Q \\ K) nabla m dot.op nabla phi.alt thin upright(d) x = t / v integral_(Q \\ K) f phi.alt thin upright(d) x \, #h(2em) phi.alt in C_c^oo \( Q \\ K \) \, $ <t:weak-response>]
  with the same scalar $A$, positive by 31. The pairings with the actual fields and their piecewise affine interpolants differ by $o \( 1 \)$ in the needed expectations.

These clauses are used below as conclusions of the indicated finite-volume results, not as consequences of the trace theorem. In particular, interior homogenization by itself supplies neither Section 7.1 nor uniformity over $cal(S)_n$.

We explain the retained-site requirement in Proposition 38. Outside the exceptional event, every filled hole has diameter at most a fixed power of $log n$ in lattice units. Mesh thickness ensures that an observed component through a vertex in such a hole reaches a fixed positive physical scale. It therefore has an observed graph path exiting the hole, whose first good rim vertex remains observed and lies within a polylogarithmic lattice distance. Move the testing mass to that vertex. At a common fixed pin its difference is zero; at a retained common sign wall its squared value appears in (4.2). The rim construction retains these values and has the stated reciprocal-weight moments. Thus this movement verifies the anchor hypothesis, including for internal components; thickness rules out an entire component hidden inside a microscopic filled hole.

#thm([Theorem 7.1.])[
  (Conditional covariance for deterministic strings).  #emph[Suppose the class $cal(S)_n$ and the estimates Section 7.1–Section 7.1 hold, and set $sigma^2 = \( v A \)^(- 1)$. Along every deterministic sequence $s_n in cal(S)_n$ with $K_(n \, s_n) arrow.r K$ in Hausdorff distance, 
#[#set math.equation(numbering: n => "(7.2)")
 $ log bb(E)_(n \, s_n) e^(t X_(n \, s_n) \( f \)) arrow.r frac(t^2 sigma^2, 2) chevron.l f \, G_(Q \\ K) f chevron.r $ <t:conditional-mgf>]

 for $t$ in a neighborhood of zero. The conclusion holds for convergent sequences of tests from a compact family and jointly for finitely many tests. In particular, 
#[#set math.equation(numbering: n => "(7.3)")
 $ sup_(s in cal(S)_n) sup_(f \, g in cal(C)) lr(|"Cov"_(n \, s) \( X_(n \, s) \( f \) \, X_(n \, s) \( g \) \) - sigma^2 chevron.l f \, G_(V_(n \, s)) g chevron.r|) arrow.r 0 . $ <t:uniform-covariance>]

 There is no requirement that $K$ have zero area or that the test supports be disjoint from $K$.]
] <t:covariance>

#proof[
  Fix a deterministic sequence as in the statement. For fixed $t$, Section 7.1 and Proposition 38 give subsequential compactness of the mean filled response in $L^p$, for a fixed $3 \/ 2 < p < 2$, and a zero $1 \/ 2$-Frostman trace on $K$. The original response has the same distributional limit. By (7.1) and Theorem 40, that limit is uniquely
  #[#set math.equation(numbering: n => "(7.4)")
   $ m_t = frac(t, v A) G_(Q \\ K) f . $ <t:response>]
  It is zero almost everywhere on $K$, including its positive-area parts. This proves convergence against general smooth $f$, rather than only against tests separated from the strings. Uniqueness removes the need to choose a further subsequence.
  Set $L_n \( t \) = log bb(E)_(n \, s_n) e^(t X_(n \, s_n) \( f \))$. Differentiation of the finite-volume integral gives
  $ L'_n \( t \) = frac(1, v n^2) sum_x f \( x \) #scale(x: 120%, y: 120%)[\(] bb(E)_(n \, s_n \, t) h_n \( x \) - bb(E)_(n \, s_n) h_n \( x \) #scale(x: 120%, y: 120%)[\)] arrow.r t sigma^2 chevron.l f \, G_(Q \\ K) f chevron.r . $
  The factor $1 \/ v$ in the source is necessary: the tilt adds the microscopic drift $t f \( x \) \/ \( v n^2 \)$ to the reflected bath. No boundary term is added, since the walls and the exterior values are common to both laws.
  The exponential moment in Section 7.1 makes these derivatives uniformly bounded for $\| t \| lt.eq a \/ 4$. Indeed the denominator of a centered moment generating function is at least one, and
  $ \| L'_n \( t \) \| lt.eq bb(E)_(n \, s_n) #scale(x: 120%, y: 120%)[\[] \| X_(n \, s_n) \( f \) \| e^(a \| X_(n \, s_n) \( f \) \| \/ 4) #scale(x: 120%, y: 120%)[\]] lt.eq C_a . $
  Integrating from zero proves (7.2). The same exponential bound gives tightness and uniform integrability of every fixed moment. Each limiting law is the Gaussian determined by this moment generating function near zero; hence the second moments converge. Applying this to linear combinations and polarizing gives cross covariances and the finite-dimensional conclusion.
  The proof also works with $f_n$ in a compact family converging to $f$. Choose $d_n arrow.b 0$ sufficiently slowly that $\( f_n - f \) \/ d_n$ belongs to a compact family in $C_c^oo \( Q \)$. Apply Section 7.1 to this additional compact family. Linearity then makes the change of the pairing tend to zero in every fixed moment. This uses the stated estimates for each fixed compact family, with its own constants, and requires no uniform constant over all such families. To obtain (7.3), suppose its supremum did not tend to zero and select a deterministic sequence realizing a fixed positive error. Hausdorff compactness and compactness of the test family give a convergent subsequence. The convergence already proved contradicts that error, once the continuity of the Green form is checked. That continuity is proved in the following lemma and is purely analytic. ◻
]

#thm([Lemma 7.2.])[
  (Green continuity for this class).  #emph[If compact sets $K_n$ containing $partial Q$ satisfy the common thickness condition and tend in Hausdorff distance to $K$, then 
$ chevron.l f_n \, G_(Q \\ K_n) g_n chevron.r arrow.r chevron.l f \, G_(Q \\ K) g chevron.r $

 whenever bounded smooth tests $f_n \, g_n$ converge uniformly to $f \, g$. The same assertion holds for mesh-thick approximants.]
] <t:green-continuity>

#proof[
  Put $v_n = G_(Q \\ K_n) g_n$ and extend by zero. Their variational identities and the Poincare inequality on $Q$ give a common $H^1$ bound. After taking a subsequence they converge strongly in $L^2$ and weakly in $H^1$ to $v$. Every compact subset of $Q \\ K$ is eventually in $Q \\ K_n$, so $- Delta v = g$ there.
  The zero traces pass to $K$ by the deterministic version of the proof of Proposition 38: use the continuous, uniformly Frostman approximating measures from Lemma 36, before its optional projection onto lattice vertices. The $H_0^1 \( Q \\ K_n \)$ approximation by compactly supported smooth functions and Lemma 35 show that $v_n$ has zero trace on these measures. Atomic vertex traces of $v_n$ are neither asserted nor used. There are no wall errors or filling maps in this case. The $H^1$ bound implies the required $W^(1 \, p)$ bound, and the averaging estimate passes the traces. Theorem 40 identifies $v = G_(Q \\ K) g$ on all of $Q$. Thus every subsequence has this same limit. Strong $L^2$ convergence and uniform convergence of $f_n$ prove the assertion. For mesh-thick sets perform the measure construction only at scales larger than $c \/ n$; its errors tend to zero before the fixed averaging scale is removed. ◻
]

=== 7.2 Random strings and boundary sampling <random-strings-and-boundary-sampling>

#thm([Corollary 7.3.])[
  (Transfer through an exact conditional kernel).  #emph[Let $S_n$ take values in $cal(S)_n$, and suppose 
#[#set math.equation(numbering: n => "(7.5)")
 $ "Law" \( h_n divides S_n = s \) = P_(n \, s) quad upright("for almost every ") s . $ <t:kernel>]

 Then, for fixed tests or compact families as in Theorem 42, the conditional covariance differs in $L^1$ from $sigma^2 chevron.l f \, G_(V_(n \, S_n)) g chevron.r$ by $o \( 1 \)$. If $K_(n \, S_n)$ converges in distribution to $K$, these random Green forms converge in distribution and in expectation to those on $Q \\ K$. Convergence in $L^1$ to a limiting random form additionally requires that the sets converge in probability on a common probability space.]
] <t:random-covariance>

#proof[
  Condition on $S_n$ and apply the deterministic uniform error (7.3); its expectation is no larger than that error. Lemma 43 gives convergence of the random Green forms. They are uniformly bounded for bounded tests, because the Dirichlet Green quadratic form of every subdomain is bounded above by that of $Q$. This also gives convergence of expectations and the stated $L^1$ assertion under a common coupling. ◻
]

For an exploration that queries signs and makes every next query or stopping decision from its previous answers and independent randomness, the full transcript has the conditional-kernel property: its decision indicators introduce no factor depending on an unqueried height. Disintegrating the finite-dimensional Lebesgue density therefore leaves exactly the uniform density with the recorded signs imposed. An exact-value exploration gives instead the corresponding frozen-value kernel; it is covered only when the finite-volume estimates have been proved for that class. An arbitrary field-dependent selection of a string need not satisfy (7.5). For example a label chosen by the sign of a standard Gaussian variable changes its conditional variance from one to $1 - 2 \/ pi$, although either deterministic label could have been assigned the original reference kernel. Uniform estimates for reference kernels do not identify the law of such a selection.

#thm([Proposition 7.4.])[
  (Vanishing covariance near a continuum).  #emph[Let $K$ satisfy Definition 33 and let $V = Q \\ K$. Let $mu_epsilon$ be positive measures of mass at most one, supported in $V$ within distance $C epsilon$ of $K$, with a common $1 \/ 2$-Frostman constant. Then 
#[#set math.equation(numbering: n => "(7.6)")
 $ chevron.l mu_epsilon \, G_V mu_epsilon chevron.r arrow.r 0 . $ <t:boundary-energy>]

 The conclusion holds for any unnormalized restriction of such a measure. It holds uniformly after adding further observed sets: if $K' supset K$ and $V' = Q \\ K'$, the Green quadratic form on $V'$ is bounded above by that on $V$.]
] <t:boundary-variance>

#proof[
  The Green function of $V$ is bounded above by that of a fixed disk containing $Q$, hence by $C \( 1 + log^(+) \( 1 \/ \| x - y \| \) \)$. Dyadic summation with the Frostman bound gives
  $ integral.double_(\| x - y \| < rho) G_V \( x \, y \) thin upright(d) mu_epsilon \( x \) thin upright(d) mu_epsilon \( y \) lt.eq C rho^(1 \/ 2) \( 1 + \| log rho \| \) . $
  For $\| x - y \| gt.eq rho$, a Brownian path started at $x$ must leave a $c rho$-neighborhood of a nearest point of $K$ before it contributes to the Green function at $y$. Beurling bounds that probability by $C \( epsilon \/ rho \)^(1 \/ 2)$. On the exit circle the Green function is at most $C \( 1 + \| log rho \| \)$. Thus the remaining contribution is at most $C \( epsilon \/ rho \)^(1 \/ 2) \( 1 + \| log rho \| \)$. First send $epsilon$ to zero and then $rho$ to zero. Restricting the measure preserves all these bounds.
  For the last assertion, the inclusion $H_0^1 \( V' \) subset H_0^1 \( V \)$ and the variational formula
  $ chevron.l f \, G_V f chevron.r = sup_(u in H_0^1 \( V \)) {2 chevron.l f \, u chevron.r - integral_V \| nabla u \|^2} $
  give the quadratic-form inequality, also for signed tests. Apply it first to smooth measures and then use the finite logarithmic energy to pass to the stated measures. ◻
]

#thm([Corollary 7.5.])[
  (Local boundary variance, independently of ambient size).  #emph[Fix nested squares $Q_0 subset.double Q_1 subset.double Q_2 subset.double Q_3$ and positive geometric separation constants. Consider finite triangular-lattice domains of mesh $n^(- 1)$, with arbitrary ambient diameter, fixed data in $\[ - 1 \/ 2 \, 1 \/ 2 \]$, and deterministic sign strings. Suppose a connected observed piece of diameter at least $c > 0$ lies within bounded distance of $Q_2$. Assume the local hypotheses of 2 and 15, with constants independent of ambient diameter. Assume also that restricting the observed system to $Q_3$ and adjoining its artificial exterior gives the common mesh thickness constants of Definition 33. This holds for connected strands attached to the original exterior, or for components of uniformly positive diameter: cut pieces meeting the artificial boundary join that boundary, and pieces entirely inside are whole original components.]
  #emph[For each fixed $eta > 0$, let $mu_(n \, eta)$ be a deterministic smooth probability test supported in $Q_0$, at distance at most $C eta$ from the observed set in $Q_1$. Suppose these measures have a common $1 \/ 2$-Frostman constant, independent of $n \, eta$, and for fixed $eta$ their densities range over a compact smooth-test family. If $X_n \( mu \)$ denotes the Riemann pairing of the centered field with that density, then 
#[#set math.equation(numbering: n => "(7.7)")
 $ lim_(eta arrow.b 0) limsup_(n arrow.r oo) sup "Var" X_n \( mu_(n \, eta) \) = 0 . $ <t:local-variance-limit>]

 The supremum is over the stated local geometries, tests, and arbitrary ambient domains. The inner limit is always taken at fixed $eta$.]
] <t:local-boundary-variance>

#proof[
  Construct an auxiliary height law in the portion of the original domain inside $Q_3$. Retain all original fixed data and all sign constraints on its free vertices, and put zero values on the new artificial boundary. At a vertex already fixed by the original problem retain that original value. Drop sign walls on vertices newly fixed at the artificial rim; their values are now prescribed to be zero. The two models have exactly the same graph, fixed data, and sign walls in $Q_2$ once $n$ is large. A strict feasible filling for the auxiliary free coordinates is obtained by assigning small signed values at the sign sites and small values at the other free sites: each original fixed value has absolute value at most $1 \/ 2$. Thus the auxiliary conditional polytope has positive volume. At a cut string endpoint, a free sign site whose opposite neighbor was removed is adjacent to the zero artificial boundary; it therefore remains bounded. Every truncated observed component reaching the artificial boundary joins the exterior observed set. The stated thickness assumption consequently puts this auxiliary law within the bounded domain class of Theorem 42.
  Let $h_n^(upright("loc"))$ denote the auxiliary field. Put it and the original field $h_n$ in the stationary synchronous joining supplied by 15, using the common walls in $Q_2$. The artificial outer data may differ, as permitted in that local comparison theorem. The original marginal has uniform local average bounds from the nearby observed piece. The auxiliary marginal has them from its artificial boundary, or the retained observed piece. If $U_n$ is the filled extension of $z_n = h_n - h_n^(upright("loc"))$ in $Q_1$, its energy and squared Sobolev norm satisfy
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(E) E_n + bb(E) parallel U_n parallel_(W^(1 \, p) \( Q_1 \))^2 lt.eq C_p \, #h(2em) 3 \/ 2 < p < 2 \, $ <t:local-difference-energy>]
  with constants independent of the original ambient diameter and of $eta$. The coupling is constructed before choosing the test.
  Transport $mu_(n \, eta)$ to the nearby common observed continuum, then to its mesh vertices and past the holes to retained vertices. The transport in Lemma 36 moves points by $O \( eta \)$; the last two movements are $O \( ell_n \/ n \)$ and give the coarse Frostman bound (6.2). The squared anchor estimate is
  $ (sum_x nu_n \( x \) \| U_n \( x \) \|)^2 lt.eq E_n sum_x frac(nu_n \( x \)^2, w_x) lt.eq C E_n n^(- 1 \/ 2 + 3 \/ \( 2 q \)) \( log n \)^C \, #h(2em) q > 3 . $
  Its expectation tends to zero. Compare each testing value with its $eta$ average as in Lemmas 35 and 36. The bottom mesh scales contribute $o \( 1 \)$ at fixed $eta$. Squaring these inequalities and using (7.8) gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ limsup_(n arrow.r oo) bb(E) lr(|chevron.l mu_(n \, eta) \, U_n chevron.r|)^2 lt.eq C_p eta^(2 beta) \, #h(2em) beta = 1 - frac(3, 2 p) > 0 . $ <t:local-difference-trace>]
  All these inequalities are samplewise before expectation; the moved measure may depend on the holes. No independence between that measure and $U_n$ is required.
  It remains to transfer the upper bound to the original difference. At fixed $eta$, put
  $ Z_n = chevron.l mu_(n \, eta) \, h_n - h_n^(upright("loc")) chevron.r \, #h(2em) W_n = chevron.l mu_(n \, eta) \, U_n chevron.r . $
  The original–filled $L^1$ estimate in 15, together with the bounded test density at this fixed scale, gives $bb(E) \| Z_n - W_n \| arrow.r 0$. The marginal fourth-moment estimates in 2 make $Z_n^2$ uniformly integrable. Their constants may depend on $eta$, which is harmless for this order of limits. For $M > 0$, the function $x mapsto min { x^2 \, M }$ is $2 sqrt(M)$-Lipschitz, so
  $ limsup_n bb(E) min { Z_n^2 \, M } lt.eq limsup_n bb(E) W_n^2 lt.eq C_p eta^(2 beta) . $
  Letting $M arrow.r oo$ proves $limsup_n bb(E) Z_n^2 lt.eq C_p eta^(2 beta)$. No $L^2$ estimate for the original–filled error has been assumed.
  The auxiliary domain has uniformly bounded diameter in these scaled coordinates. At each fixed $eta$, Theorem 42 applies uniformly to its compact family of tests, and Proposition 45 makes its limiting tested variance tend to zero as $eta arrow.b 0$. Finally the coupling inequality
  $ sqrt("Var" chevron.l mu_(n \, eta) \, h_n chevron.r) lt.eq sqrt("Var" chevron.l mu_(n \, eta) \, h_n^(upright("loc")) chevron.r) + parallel Z_n parallel_2 $
  and (7.9) prove (7.7). The proof identifies no Poisson solution on an unbounded domain and imposes no condition at infinity. ◻
]

For the harmonic tests used later, first stop Brownian motion a positive distance $epsilon$ from the observed set and smear the exit law into balls of radius $c epsilon$, $c < 1 \/ 2$, contained in the open component. Lemma 39 gives the required Frostman bound, which smearing preserves. At this fixed scale the smoothed densities form a compact family of smooth tests with uniform derivative bounds. Apply Theorem 42, including if further strings meet their supports, and only afterwards send $epsilon$ to zero using Proposition 45. The zero-response assertion on positive-area limits is what permits a fixed test to meet the additional closed set. No estimate uniform in $epsilon$ before taking the lattice limit has been used.

#prodef([Remark 7.6.])[
  (Finite-volume dependencies and conditioning scope).  For the deterministic class specified above, clause Section 7.1 uses the following parts of the finite-volume proof. Corollary 12 supplies sparse initial contacts uniformly over the sign strings. The forcing and loss allocation in Lemma 19 and equations (4.9)–(4.10) retain the common-wall square penalties in (4.2). Equation (4.6) gives deterministic spatial inverse-weight bounds outside arbitrarily rare exceptional events. The interpolation and absorption estimates (4.13)–(4.14), followed by the hole estimate 6, give the squared $W^(1 \, p)$ bound in (4.4) for every $1 < p < 2$; in particular one may choose $p > 3 \/ 2$. The all-edge estimate (4.18) and the subsequent fixed-construction hole truncation give the vanishing original–filled $L^1$ error, not merely its boundedness. Lemma 21 preserves the common zero exterior, while the common-wall penalties and the thickness hypothesis give the internal traces through Proposition 38. Lemma 10 and the small-drift completion of the comparison proof preserve these estimates under the small smooth tilts used here.
  This argument concerns ordinary one-sided sign constraints and the stated range of original fixed data. It does not include shrinking two-sided wall intervals or assert uniform estimates after an arbitrary exact-value transcript is fixed. The adapted exact-value comparisons in Lemma 16 are annealed over their actual transcript; they do not enlarge the deterministic class $cal(S)_n$ of Theorem 42. Random use of that theorem still requires the exact conditional-law identity in Corollary 44. The normalization of the resulting covariance is the $\( - Delta \)^(- 1)$ convention used in [15].
]

== 8 Feasible Shifts and Volume Distortion <sec:feasible-shifts>

The geometric arguments will need to raise or lower heights slowly across a corridor while retaining an event of uniformly positive probability. Simply adding the prescribed shift can violate a nearly saturated edge constraint. We correct the shift by averaging it over clusters of such edges, so that the two corrected endpoint shifts agree at every exact edge contact. A determinant identity for vector fields tangent to the height polytope then controls the volume lost by this height-dependent correction. The resulting proposition transfers any event of probability bounded below to a feasible shifted event of probability bounded below; the geometric application must supply that initial event.

Constraint-preserving perturbations and their volume cost also underlie Richthammer’s deformed translations for hard-core particles [12] Sections 5.4 and 6.5–6.7 and the addition algorithm of Miłoś and Peled for hard-constraint surfaces [8] Sections 1.1.2 and 2. The threshold-averaged component construction below differs from those algorithms and supplies its own tangential-vector-field determinant identity.

All heights in this section are in lattice units, and the law is normalized Lebesgue measure on a positive-volume conditional height polytope. Conditioning specifies signs along oriented strands and may include the bounded fixed data allowed in Corollary 12. Sites with specified signs will be left unchanged by the map. The sparse edge estimates of that corollary apply also to zero-pinned laws by taking no sign strings.

=== 8.1 The cluster consequence of sparseness <the-cluster-consequence-of-sparseness>

Fix a bounded-degree lattice graph and a set of at most $C n^2$ vertices. For a sufficiently small fixed $s_(*) > 0$, join neighboring vertices when

$ \| h_x - h_y \| gt.eq 1 - s_(*) . $

Ignore edges whose two endpoints are fixed. The sparse edge estimate of Corollary 12, including its zero-pin specialization, implies that the size $H_x$ of the resulting component containing $x$ satisfies

#[#set math.equation(numbering: n => "(8.1)")
 $ sup_x bb(E) H_x^k lt.eq C_k \, #h(2em) k < oo . $ <eq:shift-cluster-moments>]

The constants are uniform over the conditioning systems covered by that corollary. To see the implication, use its overlapping fixed-box cover: the central-edge tests include every edge with a nonfixed endpoint, also near fixed pins. A nontrivial component can occupy only bad boxes, apart from a bounded enlargement at its endpoints, since a good box has slack on every edge incident to its central box. A connected collection of $m$ occupied boxes contains a separated subcollection of at least $m \/ C$ boxes. Its probability is at most $rho^(m \/ C)$. Taking $rho$ smaller than the reciprocal of the lattice-animal counting constant gives an exponential tail for the number of occupied boxes, hence (8.1). Deleting edges or restricting the graph preserves this conclusion. In particular, for any fixed $alpha > 0$,

#[#set math.equation(numbering: n => "(8.2)")
 $ bb(P) [max_x H_x > n^alpha] lt.eq C_k n^(2 - alpha k) = o \( 1 \) $ <eq:shift-largest-cluster>]

after choosing $k > 2 \/ alpha$. No convergence rate from homogenization enters this assertion.

=== 8.2 A determinant identity on polytopes <a-determinant-identity-on-polytopes>

#thm([Lemma 8.1.])[
  (Tangential vector fields).  #emph[Let $P subset bb(R)^N$ be a compact full-dimensional polytope, with normalized Lebesgue measure. Suppose that $u : P arrow.r bb(R)^N$ is Lipschitz and tangent to each facet of $P$. Then 
#[#set math.equation(numbering: n => "(8.3)")
 $ bb(E) "div" u = 0 \, #h(2em) bb(E) \( "div" u \)^2 = bb(E) "tr" #scale(x: 120%, y: 120%)[\(] \( D u \)^2 #scale(x: 120%, y: 120%)[\)] lt.eq bb(E) parallel D u parallel_(upright("HS"))^2 . $ <eq:shift-divergence>]

]
] <lem:shift-divergence>

#proof[
  Write $ell_i gt.eq 0$ for the normalized affine slack of facet $F_i$. There is a finite constant $C_i$, depending here on the polytope, such that $"dist" \( x \, F_i \) lt.eq C_i ell_i \( x \)$ for $x in P$. Indeed, express $x$ as a convex combination of vertices, fix $v_0 in F_i$, and replace each vertex $v in.not F_i$ in that combination by $v_0$; use the maximum of $\| v - v_0 \| \/ ell_i \( v \)$ over these finitely many vertices. Tangency and Lipschitz continuity give
  $ \| nabla ell_i dot.op u \( x \) \| lt.eq C_i "Lip" \( u \) ell_i \( x \) . $
  Consequently, for sufficiently small positive or negative $t$, $T_t = I + t u$ maps $P$ into itself and maps $partial P$ into $partial P$. It is injective when $\| t \| "Lip" \( u \) < 1$. To prove surjectivity, fix $y in P$. The map $x mapsto Pi_P \( y - t u \( x \) \)$, where $Pi_P$ is Euclidean projection, is a contraction of $P$ and has a fixed point $x$. Put $n = y - t u \( x \) - x$. The projection inequality says that $n$ is an outward normal to $P$ at $x$, so $n dot.op \( y - x \) lt.eq 0$. Tangency to every facet containing $x$ gives $n dot.op u \( x \) = 0$, because the normal cone is generated by those facet normals. Consequently $0 gt.eq n dot.op \( y - x \) = \| n \|^2$, so $n = 0$ and $T_t \( x \) = y$.
  The Lipschitz area formula now gives
  $ integral_P det \( I + t D u \( x \) \) thin d x = \| P \| . $
  For the piecewise affine field constructed below, this identity is elementary: subdivide $P$ into its finitely many affine regions, apply the linear determinant formula on each region, and sum. Injectivity makes the image interiors disjoint, while their boundaries have zero volume; surjectivity makes their union all of $P$. The determinant is positive for these $t$. Comparing the linear and quadratic coefficients of this polynomial identity proves (8.3), since the quadratic coefficient is $\( \( "div" u \)^2 - "tr" \( \( D u \)^2 \) \) \/ 2$. Finally $\| "tr" \( A^2 \) \| lt.eq parallel A parallel_(upright("HS"))^2$. Thus no integration by parts across corners or nonsmooth interfaces is required. The polytope-dependent restriction on $t$ has disappeared from the resulting identity. ◻
]

=== 8.3 Construction and quantitative bounds <construction-and-quantitative-bounds>

Let $V_n$ contain the sites on which the prescribed shift may be nonzero. Assume $\| V_n \| lt.eq C n^2$, and adjoin all their neighbors. Declare all adjoined vertices, all fixed sites, and all sites carrying sign or additional wall conditions to be grounded. Include graph edges with at least one nongrounded vertex, and omit edges with two grounded endpoints. Grounding means only that the shift is zero there; a grounded height need not be fixed under the original law.

Let $f = f_n$ be a deterministic prescription, zero at every grounded site and outside $V_n$, such that

#[#set math.equation(numbering: n => "(8.4)")
 $ \| f_x \| lt.eq M \, #h(2em) \| f_x - f_y \| lt.eq L \/ n quad upright("for every lattice edge ") x y . $ <eq:shift-prescription>]

The constants $L \, M$ may be arbitrarily large fixed constants. They do not depend on $n$. Choose fixed $0 < s_0 < s_1 < s_2 < s_(*)$, and put $Delta = s_1 - s_0$. For an edge $e = x y$, put $t_e \( h \) = 1 - \| h_x - h_y \|$. For $s in \[ s_0 \, s_1 \]$, let $C_s \( x \)$ be the component of $x$ using edges with $t_e \( h \) lt.eq s$, and define

$ v_s \( h \)_x = cases(delim: "{", \| C_s \( x \) \|^(- 1) sum_(y in C_s \( x \)) f_y \, & C_s \( x \) upright(" has no grounded vertex") \,, 0 \, & C_s \( x \) upright(" has a grounded vertex") .) #h(2em) u \( h \) = Delta^(- 1) integral_(s_0)^(s_1) v_s \( h \) thin d s . $

Set $u = 0$ outside the local graph. Let $H_x$ now denote the size of the $s_2$-component containing $x$, and write $H_max = max_x H_x$. The definitions give the deterministic approximation estimate

#[#set math.equation(numbering: n => "(8.5)")
 $ \| u \( h \)_x - f_x \| lt.eq L H_x \/ n . $ <eq:shift-error>]

For an ungrounded component this is the oscillation bound for its average. For a grounded component, join $x$ to a grounded vertex along its component and use $f = 0$ at the latter vertex.

The vector field $u$ is globally Lipschitz and piecewise affine on the finite-dimensional height polytope. Indeed, subdivide into the finitely many regions on which the signs of edge differences and the ordering of $s_0 \, s_1 \, t_e \( h \)$ are fixed. On each such region the component partitions between consecutive thresholds are fixed and the lengths of the corresponding integration intervals are affine. The resulting formulas agree continuously at common boundaries. A direct continuity bound follows also by noting that changed edge statuses can occur only for $s$ between $t_e \( h \)$ and $t_e \( tilde(h) \)$ and summing these interval lengths.

At an edge facet $\| h_x - h_y \| = 1$, its endpoints belong to the same component for every $s in \[ s_0 \, s_1 \]$, so $u_x = u_y$. At every wall or fixed site, $u_x = 0$. Thus $u$ is tangent to every facet of the height polytope, as required in Lemma 48.

Here is an explicit derivative bound. When $s$ passes $t_e$, write $J_e = v_(t_e +) - v_(t_e -)$ for the change of the component prescription. If the edge is redundant, $J_e = 0$. Otherwise it merges two components; $J_e$ is supported on their union, and $\| \( J_e \)_x \| lt.eq L H_x \/ n$ at each affected vertex. This remains true when one component is grounded. Almost everywhere,

#[#set math.equation(numbering: n => "(8.6)")
 $ D u = - Delta^(- 1) sum_({ e : s_0 < t_e < s_1 }) J_e ⊗ nabla t_e . $ <eq:shift-derivative>]

Equal thresholds can be ordered by a fixed tie rule; simultaneous mergers then telescope to the same formula. Each $nabla t_e$ is supported on the two endpoints of $e$ and has entries of magnitude at most one. Hence each column of (8.6) receives contributions from at most the graph degree many edges. Matrix entries connecting different $s_1$-components vanish. On a component of size $H$, each entry has magnitude at most $C L H \/ n$. Summing entries, and then squares, yields

#[#set math.equation(numbering: n => "(8.7)")
 $ parallel D u parallel_(upright("op")) lt.eq C L H_max^2 \/ n \, #h(2em) parallel D u parallel_(upright("HS"))^2 lt.eq C L^2 n^(- 2) sum_x H_x^3 . $ <eq:shift-matrix-bounds>]

All constants may depend on the fixed thresholds. In particular, (8.1) and Lemma 48 imply

#[#set math.equation(numbering: n => "(8.8)")
 $ bb(E) parallel D u parallel_(upright("HS"))^2 lt.eq C_L \, #h(2em) bb(E) \( "div" u \)^2 lt.eq C_L . $ <eq:shift-mean-bounds>]

These expectations are under the original conditional law; no derivative bound is assumed after an additional exploration.

=== 8.4 Feasibility, injectivity, and volume <feasibility-injectivity-and-volume>

#thm([Proposition 8.2.])[
  (Feasible shifts).  #emph[Under the sparse-box estimates 4 and 12 in the applicable conditioning class, let $f_n$ satisfy (8.4). For each $p_0 > 0$ there are $c > 0$ and $n_0$, uniform over the allowed conditioning systems, with the following property. For $n gt.eq n_0$ and every measurable event $E$ with $bb(P) \( E \) gt.eq p_0$, there is a measurable $E' subset E$ with $bb(P) \( E' \) gt.eq p_0 \/ 2$ such that $T \( h \) = h + u \( h \)$ is injective on $E'$, has feasible image, and 
$ sup_(h in E') parallel T \( h \) - h - f_n parallel_oo = o \( 1 \) \, #h(2em) bb(P) \( T \( E' \) \) gt.eq c . $

 The statement also holds for a fixed finite product of independent conditional surfaces.]
] <g:shifts>

#proof[
  Take $alpha = 1 \/ 8$ and $G_n = { H_max lt.eq n^alpha }$, using the enlarged threshold $s_2$. By (8.2), $bb(P) \( G_n^c \) = o \( 1 \)$ uniformly. If $h in G_n$, then (8.5) gives $parallel u - f parallel_oo lt.eq L n^(alpha - 1)$. For an edge with $t_e lt.eq s_0$, its two shifts agree exactly. For every other edge the original slack is greater than $s_0$, whereas
  $ \| u_x - u_y \| lt.eq L \( 2 n^alpha + 1 \) \/ n < s_0 $
  for large $n$. Thus $h + u \( h \)$ is feasible. Walls are preserved because their sites are grounded.
  To prove injectivity, suppose $h \, k in G_n$ and $h + u \( h \) = k + u \( k \)$. The prescribed $f$ is the same for both fields, so
  #[#set math.equation(numbering: n => "(8.9)")
   $ parallel h - k parallel_oo lt.eq 2 L n^(alpha - 1) . $ <eq:shift-collision>]
  The whole segment $h_t = \( 1 - t \) h + t k$ belongs to the convex polytope. If an edge has $t_e \( h_t \) lt.eq s_1$, then
  $ t_e \( h \) lt.eq s_1 + 2 parallel h_t - h parallel_oo lt.eq s_1 + 4 L n^(alpha - 1) < s_2 $
  for large $n$. Every $s_1$-component anywhere along this segment is therefore contained in an $s_2$-component of $h$ and has size at most $n^alpha$. Apply the component proof of (8.7) along the segment to get
  $ parallel u \( k \) - u \( h \) parallel_2 lt.eq C L n^(2 alpha - 1) parallel k - h parallel_2 . $
  For a segment lying on a subdivision boundary, the same conclusion follows by restricting the continuous piecewise-affine formula to that segment; the tangential derivatives agree with limits from adjacent pieces. Since the coefficient tends to zero, the collision equation forces $h = k$. Notice that this argument does not presume that $G_n$ is convex.
  On $G_n$, $parallel D u parallel_(upright("op")) = o \( 1 \)$, so for large $n$ the determinant of $I + D u$ is positive and
  #[#set math.equation(numbering: n => "(8.10)")
   $ log det \( I + D u \) gt.eq "div" u - parallel D u parallel_(upright("HS"))^2 . $ <eq:shift-logdet>]
  Indeed, use the power series for $log \( I + A \)$ and $\| "tr" \( A^j \) \| lt.eq parallel A parallel_(upright("HS"))^2 parallel A parallel_(upright("op"))^(j - 2)$ for $j gt.eq 2$; the remainder is at most $parallel A parallel_(upright("HS"))^2$ when $parallel A parallel_(upright("op")) lt.eq 1 \/ 2$. By (8.8), choose a fixed $K = K \( p_0 \, L \)$ sufficiently large that
  $ bb(P) #scale(x: 120%, y: 120%)[\[] \| "div" u \| > K med upright("or") med parallel D u parallel_(upright("HS"))^2 > K #scale(x: 120%, y: 120%)[\]] < p_0 \/ 4 . $
  For sufficiently large $n$, $bb(P) \( G_n^c \) < p_0 \/ 4$ also. Intersecting $E$ with the complementary good events gives $E'$ of probability at least $p_0 \/ 2$, and (8.10) gives $det D T gt.eq e^(- 2 K)$ almost everywhere on $E'$. The area formula and injectivity now imply
  $ bb(P) \( T \( E' \) \) = frac(1, \| P \|) integral_(E') det D T \( h \) thin d h gt.eq e^(- 2 K) p_0 \/ 2 . $
  This proves the claim. For finitely many independent replicas use the product polytope and the block-diagonal map, or intersect the corresponding good events and multiply the determinant lower bounds. ◻
]

The construction also preserves the direction of a reinforcing shift. If $f$ is nonnegative on an $s_1$-component, its corrected shift is nonnegative there, including when it is grounded. If positive and negative prescription regions have separation of order $n$, the components on $G_n$ cannot connect them. This observation permits opposite prescribed signs in separated corridors. A crossing application must still establish its own initial event $E$ and verify that an $o \( 1 \)$ error in the prescribed shift leaves its required strict inequalities intact.

== 9 Harmonic sampling and stopped-interface geometry <sec:geometry>

We use lattice units in this section. A strand observation specifies the orientation of finitely many pieces of zero interface, hence only the signs of adjacent heights. Its conditional law is uniform on the corresponding convex height polytope. All assertions below concern admissible observations, that is, observations of positive probability. Constants are uniform in the number of lattice edges in an observed strand. The number of distinct macroscopic strands in a comparison is bounded. The exterior heights have absolute value at most $1 \/ 2$.

The geometric constructions and the random-walk estimates used below are those of [14] Sections 2.3 and 3.3–3.7. We specify their hypotheses and prove the replacements that concern the law of the field. In particular, a result for Gaussian interfaces is not used as a theorem about the present field.

=== 9.1 Local insertion, signs, and crossings <local-insertion-signs-and-crossings>

#thm([Lemma 9.1.])[
  (Bounded local insertion).  #emph[For every fixed $L < oo$ there is $p_L > 0$ with the following property. Condition on any admissible exact oriented strands. In a patch of diameter at most $L$, at distance at most $L$ from one of their tips or from bounded Dirichlet boundary, prescribe a compatible sign pattern on at most $L$ additional vertices. The probability of that pattern is at least $p_L$. In particular every feasible prescribed extension of at most $L$ interface steps has a probability bounded below by a constant depending only on $L$. The assertion remains valid when other positive string sites have additional upper bounds in $\( 0 \, d \]$, provided no prescribed new positive site is one of those upper-bounded sites.]
] <g:insertion>

#proof[
  String heights have absolute value at most one. Lipschitzness therefore bounds heights in the patch by a deterministic $M = M \( L \)$. Enclose it in a larger fixed box and use Corollary 12 with a long-distance deficit greater than $2 M + 20$; the small linear-slack version gives this by enlarging the fixed box. The good-shell event has probability at least $1 \/ 2$, uniformly in the original strand conditioning.
  Fix such a shell and give the new vertices their requested values $plus.minus b$, where $0 < b < 1 \/ 4$. Clip any feasible filling between the lower and upper distance cones of these prescriptions. At each other sign-constrained vertex the clipping interval contains zero, since that vertex has graph distance at least one from the prescribed vertices. Consequently clipping preserves its sign. Since the clipping interval contains zero, it also preserves every old interval $\[ 0 \, d \]$, without making $b$ depend on $d$, and preserves fixed exterior values of absolute value at most $1 \/ 2$. The shell remains unchanged because of the long-distance deficit. This is the local feasible-filling construction underlying Lemma 11.
  Let $g$ be the resulting filling. For every original filling $h$, the map $h mapsto t h + \( 1 - t \) g$, with $0 < t < b \/ \( 2 \( M + b \) \)$, gives the required signs on the patch. Convexity preserves all the old constraints. If the number of free box coordinates is $N$, its Jacobian is $t^N$; both $N$ and $t$ depend only on the fixed patch and box. Integrating the conditional volume bound over good shells proves the result. For an interface extension prescribe the signs on the two sides of its finitely many edges. ◻
]

#thm([Lemma 9.2.])[
  (Positive trace on a pure sign side).  #emph[In a local sector with only positive string boundary, the limiting bounded harmonic conditional mean has Brownian boundary trace at least $c > 0$, away from endpoints and incompatible sides. On a negative sector its trace is at most $- c$. On an exterior boundary arc alone the trace is its prescribed value. These statements are sequentially uniform at diverging lattice scales.]
] <g:sign-trace>

#proof[
  The conditional law is log-concave and monotone in its boundary data and in its one-sided constraints. Lemma 50 gives a uniform positive chance that a tested positive string height exceeds some fixed $b > 0$, even after other positive sites have been restricted to $\( 0 \, d \]$. A one-dimensional log-concave density on $\[ 0 \, 1 \]$ with this tail bound assigns at most $C d$ mass to $\[ 0 \, d \]$. One proof integrates the chord lower bounds for its logarithm between a point in $\[ 0 \, d \]$ and a point carrying the prescribed tail mass. Thus, for small fixed $d > 0$, the tested height exceeds $d$ with conditional probability at least $1 \/ 2$. Monotonicity makes the conditioning that all earlier indicators vanish the worst one. Successive uniform couplings show that the positive string heights dominate $d$ times independent fair Bernoulli variables.
  Write $A$ for the full original string-height vector. Couple its positive coordinates with independent fair pins $B_x in { 0 \, d }$ so that $B_x lt.eq A_x$ on the positive portion, and extend this coupling to the remaining coordinates of $A$ by disintegration. Conditional on $\( A \, B \)$, sample the original Gibbs interior given $A$ and a comparison Gibbs interior pinned to $B$ on the positive portion and to $d \/ 2$ on the remaining comparison boundary. Then replace this conditional product by its stationary synchronous joining. Lemma 16 preserves the original field marginal and the comparison mixture. The latter has the required estimates uniformly in its pins, which lie in $\[ 0 \, d \] subset \[ - 1 \/ 2 \, 1 \/ 2 \]$. Its law is invariant under $h mapsto d - h$, because this map sends the kernel with pins $B$ to the kernel with pins $d - B$, and the fair product law is unchanged. Its mean is therefore $d \/ 2$. The filled lower tail of the comparison has zero fixed input on the positive portion. Theorem 15 and Proposition 38 give zero trace for every limit of its mean there; no harmonic equation for the tail is used. Jensen’s inequality bounds the negative part of the limiting mean difference by this nonnegative zero-trace limit. The two field means are bounded, harmonic away from the observed sets, and their remote contribution is bounded by a constant times the harmonic probability of reaching an endpoint or an incompatible side. This probability tends to zero along Brownian approaches to the pure portion, by Beurling. The lower trace is therefore at least $d \/ 2$. All bounds used are uniform for each deterministic admissible conditioning sequence, which gives the claimed sequential uniformity. Reflect the field for the negative statement. ◻
]

#thm([Lemma 9.3.])[
  (The complete-crosscut upper bound).  #emph[For a complete single crosscut, the positive-side conditional mean is at most $1 \/ 2$, and the negative-side conditional mean is at least $- 1 \/ 2$. This assertion is not made at an open interface tip.]
] <g:upper-half>

#proof[
  Condition on all heights on the negative side. At a positive string vertex, a crossing edge gives an upper bound at most one. Delete the crossing edges and replace these bounds by independent walls $\[ 0 \, 1 \]$. This raises the conditional field by monotonicity. Raising the exterior positive data to $1 \/ 2$ raises it again. The resulting positive-component law is invariant under $h mapsto 1 - h$, so its mean equals $1 \/ 2$. Average the comparison over the conditioned negative heights. The negative statement follows by reflection. Disconnection of the two components by the full crosscut justifies deletion of precisely these crossing constraints. ◻
]

#thm([Lemma 9.4.])[
  (High crossings).  #emph[In a compact corridor of fixed shape and size $n$, with an observed component of comparable size and distance, the probability of a path of heights at least $K$ crossing a fixed positive fraction of that corridor tends to zero as $K arrow.r oo$, after $n arrow.r oo$. The same is true for the difference of two independent samples under possibly different bounded exterior or strand conditionings. In both statements the corridor has an enlarged neighborhood of width $c n$, for a fixed $c > 0$, containing no original fixed pins or sign walls. In the two-field statement this neighborhood lies in both domains with the same unconditioned lattice graph, and each original law has the stated macroscopic anchor. The two conditionings may differ outside this neighborhood.]
] <g:high-crossing>

#proof[
  We give the two-field proof. Explore every cluster of $h_1 - h_2 gt.eq K$ connected to a deterministic transverse seed. Every queried vertex away from the seed has difference at least $K - 2$: positive queries satisfy the threshold, and failed queries are adjacent to a positive query. Freeze both samples on the common queried set, then use the stationary synchronous joining of their conditional laws. The exploration decisions used only recorded values; hence this replacement preserves each annealed marginal. All statements below are annealed over this transcript, not asserted for every possible conditional pin value. Use a middle testing subcorridor a fixed positive distance from the transverse seed. The free-buffer hypothesis removes all original pins and sign walls from its larger comparison window; the newly queried common pins there satisfy the displayed threshold inequality. Thus the one-sided comparison has no uncontrolled original boundary in that window.
  Away from the seed, set
  $ u_K = (1 - frac(h_1 - h_2, K - 2))_(+) . $
  It has zero data on the revealed set. The local truncated comparison estimate in Theorem 15, applied after division by $K - 2$, gives compact filled extensions with uniformly bounded local Sobolev energy. Here the cutoff energy grows at most quadratically with the truncation level: after division it is bounded by the squared cutoff norm and the macroscopic second moments of $h_1 \/ \( K - 2 \)$ and $h_2 \/ \( K - 2 \)$. Proposition 2 controls these moments uniformly. The same bounds hold after conditioning on an event of probability bounded below, with its reciprocal as a constant.
  Suppose a crossing had probability bounded below along $K arrow.r oo$ and $n arrow.r oo$. On that event the revealed set contains a connected continuum of fixed positive diameter away from the seed. Pass to a subsequence jointly with this continuum and the filled extensions. Macroscopic averaged field tightness gives $\( h_1 - h_2 \) \/ \( K - 2 \) arrow.r 0$ as a distribution in this iterated limit. Since $u_K gt.eq 1 - \( h_1 - h_2 \) \/ \( K - 2 \)$, its limit is at least one almost everywhere. The varying-set anchor argument of Proposition 38 gives zero trace for that same limit. Here one uses its samplewise inequalities, without a Poisson equation for the truncated tail. Choose a probability measure on the crossing continuum by coordinate projection, with ball masses bounded by $C r$ in physical units. Move it along the revealed set past each hole to a retained zero vertex. The maximum hole diameter is polylogarithmic outside the negligible exceptional event, and the crossing component cannot be contained in such a hole. Lemma 35 bounds the integral of a radius-$r$ average of the filled tail by $C \( r^beta + o \( 1 \) \) parallel U_n parallel_(W^(1 \, p))$, for some $beta > 0$. These inequalities hold for the random measure before expectation. Joint compactness and strong local $L^p$ convergence permit the mesh limit at fixed $r$; the bounded conditional Sobolev norm permits $r arrow.b 0$. This proves the zero trace. A $W^(1 \, p)$ function which is at least one almost everywhere cannot have zero trace on a continuum carrying a fixed positive-diameter Frostman test with exponent greater than $2 - p$. This is a contradiction.
  For one field retain the entire original field on the deterministic testing window. Given its transcript, compare its unvisited Gibbs kernel with a symmetric field zero-pinned on the revealed set and original exterior, and extend this comparison field by zero on its fixed coordinates. Keep the original field, not its restriction to a random unvisited component, in the full-window difference. For each recorded set, deterministic ambient tests of the comparison field have the bounds of Proposition 2; the revealed crossing component provides a macroscopic anchor on the crossing event. The original full field keeps its annealed bounds by disintegration. Queried nonseed differences are at least $K - 1$, and the same lower tail with $K - 1$ has zero input there. The free buffer excludes all original walls from this comparison window. The preceding argument therefore applies without a random mask on the original field. ◻
]

=== 9.2 Barriers and exact strand comparison <barriers-and-exact-strand-comparison>

For a union $K$ of observed strands, let $D \( K \)$ be the domain obtained by deleting closed lattice triangles meeting $K$. Write

$ d_U \( A \, B \) = inf { "diam" alpha : alpha subset overline(U) upright(" joins ") A upright(" to ") B } . $

The distinction between this internal diameter distance and Euclidean distance is essential below.

A $\( theta \, R \)$-barrier is a path $Upsilon$ of diameter in $\( theta R \, R \]$, with an observed or exterior boundary component of diameter at least $theta R$ within distance $theta^(- 1) R$. Its interior is in $D \( K \)$. At each endpoint $z$ on the boundary, the first encountered circular crosscut at radius $theta R$ bounds a pocket $A_z$ with one simple boundary arc; the path meets every smaller centered circle once inside this pocket. If a point of the barrier is within $theta R \/ 5$ of the observed boundary, it belongs to one of these pockets and lies within $theta R \/ 2$ of its endpoint. These are the four geometric conditions of [14] Section 3.4. A signed barrier is compatible if the boundary arc of each endpoint pocket has the indicated sign. Oppositely signed barriers must have internal distance at least $2 theta R$. At bounded lattice scales no hexagon may meet both prescribed signs.

#thm([Proposition 9.5.])[
  (Uniform barriers).  #emph[For every $theta > 0$ and $m < oo$ there is $p = p \( theta \, m \) > 0$ such that the following holds at every lattice scale. Condition on any admissible collection $K$ of exact oriented strands. For a compatible collection of at most $m$ $\( theta \, R \)$-barriers, the probability that all continuations of the observed strands avoid these barriers is at least $p$. Endpoints on pure exterior arcs are allowed provided, for a fixed $lambda_(*) > 0$, their positive attachment arcs have prescribed heights at least $lambda_(*)$, and their negative attachment arcs have prescribed heights at most $- lambda_(*)$. For these barriers $p$ may also depend on $lambda_(*)$. Interior attachment constants do not depend on $lambda_(*)$. For diverging-scale applications assume local thickness of the observed set in the endpoint testing windows: after restriction to a generous square of side comparable to $theta R$ around such a window, every retained observed component either meets the square’s rim or has diameter at least $c \( theta \) R$. The nearby attachment component has diameter at least $c \( theta \) R$. Arbitrarily many isolated microscopic observed islands in these windows are not included.]
] <g:barriers>

#proof[
  We first treat $R arrow.r oo$. Away from endpoint pockets the barrier has clearance $theta R \/ 5$. A grid of mesh $eta R \/ 100$, with $eta lt.double theta$, meets its bounded thickening in at most $C m eta^(- 2)$ cells. Circuits and crossings in those cells form a fence around the barrier; fill bounded holes in the thickening before taking its outer fence. Opposite signs have disjoint enlarged supports. The grid crossings and circuits can be chosen in overlapping rectangles so that, together with their endpoint attachments, they form a connected fence. Their number depends on $eta \, m$, not on the length or microscopic oscillation of the barrier. We first construct the attachments to the pure boundary. We will then force the interior fence using Lemma 53 and Proposition 49.
  Each interior crossing rectangle has a fixed enlargement contained in the free part of the corridor, by the clearance $theta R \/ 5$. In the endpoint construction only rectangles in the free core are used, with enlargements smaller than their distance from the removed boundary neighborhood. Attachment across that neighborhood is the separate collar problem treated next.
  We verify the endpoint attachments, including irregular pockets. In the annulus with radii $5 theta R \/ 8$ and $7 theta R \/ 8$ about an endpoint $z$, delete the union $Q$ of coarse cells meeting the $2 eta R$-neighborhood of the conditioned boundary. Keep the component containing the barrier as a core. On either side there is a collar between the core and the pure boundary. Its central testing arc has diameter at least $theta R \/ 32$, distance $O \( eta R \)$ to that boundary, and access distance at least $theta R \/ 32$ to other conditioned boundary or to either lateral cutoff. These assertions follow from the radial-pocket and clearance conditions: a path violating the last assertion would either leave the annulus or cross the barrier where its clearance is at least $theta R \/ 5$. Corner contacts are resolved by a deterministic perturbation of at most one coarse cell.
  Radially select points on the testing arc, move them to centers of adjacent core cells, and smear them in balls of radius $eta R \/ 400$ inside those cells. For the resulting probability test $mu$,
  $ mu \( B \( x \, t R \) \) lt.eq C \( t + eta \) \/ theta . $
  For fixed $eta \, theta$, all these are smooth tests with uniformly bounded rescaled norms. The number of coarse cells is bounded, so subsequential uniformity applies to arbitrary varying old strands. Beurling and the access separation show that the original mean of the test is at least $c + o \( 1 \)$ by Lemma 51; for an exterior attachment replace $c$ by $c and lambda_(*)$. Its centered variance tends to zero as $eta \/ theta arrow.r 0$ by Corollary 46. Indeed the smearing improves the displayed ball-mass bound to $mu \( B \( x \, t R \) \) lt.eq C t \/ theta$ at every scale: for $t < eta$, the density bound is $C \/ \( theta eta R^2 \)$, giving $C t^2 \/ \( theta eta \) lt.eq C t \/ theta$. Thus the tests are uniformly Frostman and, for fixed $eta$, form a compact smooth family. The stated local-cut condition supplies the corollary’s thickness hypothesis; no bound on the ambient diameter divided by $R$ is imposed.
  Explore, within the collar only, the positive cluster attached to its pure positive boundary. Query a vertex only from an already discovered positive neighbor. A failed query is negative, and its height is bounded in absolute value by one. On the negative-crossing event, the core-facing failed queries contain a negative frontier joining the two lateral cutoffs and screening the testing cells. The queried positive vertices lie behind that frontier. This is an adapted exploration, not a crossing selected after the full field is seen.
  Here is the comparison on this event, denoted by $E$. Include all original string heights in the exact-value transcript; they may be recorded before the adapted queries. Given the complete transcript, restrict to the core-facing component cut off by its negative frontier $F$. The original interior has its exact Gibbs kernel with the recorded boundary values. As comparison kernel take the uniform law on this same component with all fixed boundary values replaced by zero, and denote its field by $h^0$. It is symmetric under height reflection, so its conditional mean is zero. The zero-pinned laws have sparse contacts and average bounds uniformly over these component shapes, using $F$ as a connected anchor. The original estimates remain annealed estimates under its original strand-conditioned marginal. Disintegrating and rejoining the two kernels as in Lemma 16 preserves these marginals. It does not require microscopic slack uniformly for every recorded nonzero pin vector.
  For the analytic estimate, retain $h$ on the entire deterministic testing window, including its coordinates outside the selected component $C$. Extend only $h^0$ by zero at every vertex outside $C$, so it is a full ambient zero-pinned field for each recorded shape. Rejoining may be performed with the full original conditional Gibbs kernel: its other components retain their conditional baths. Consequently the full $h$ still has its original annealed marginal. Put $z = h - h^0$ on this whole window; no component indicator multiplies $h$. Deterministic ambient zero-mass tests of $h^0$ satisfy Proposition 2 uniformly for every recorded shape, and the coarse coefficient is anchored by $F$. The full original $h$ has its original anchored and zero-mass bounds. The localized dyadic argument in (4.15) therefore gives
  $ bb(E) \[ parallel chi_0 z parallel_(H^(- alpha))^2 divides E \] lt.eq C_(alpha \, p_(*)) \, #h(2em) alpha > 0 \, $
  when $bb(P) \( E \) gt.eq p_(*)$, with the deterministic cutoff $chi_0$ supported in the fixed larger testing window. Only the original marginal costs the reciprocal event probability; the zero-pinned bound is uniform conditional on the recorded shape.
  On $F$ the original values are nonpositive. The upper comparison tail $u = \( h - h^0 \)_(+)$ consequently has zero fixed input there. Extend it by zero behind $F$ and apply the one-sided part of Theorem 15. Use the core-facing components of windows of a fixed positive fraction of $theta R$ around the central testing arc. The lateral cutoffs and any uncontrolled seed cannot be reached within the corresponding larger window component, by the access separation above. Thus the cutoff is localized in that component; all edges to the removed positive cluster pass through $F$. The nearby original boundary anchors the original marginal, and $F$ anchors the comparison marginal. The zero-extended tail is uniformly Lipschitz across the frontier. If its hole extension has a positive copied value $U \( x \) = u \( y \)$, the retained rim site $y$ lies in $C$ and $u \( y \) = z \( y \) > 0$. Full-window Lipschitzness of $z$ gives
  $ U \( x \)^2 lt.eq z \( x \) U \( x \) + C \( 1 + d_x \) U \( x \) . $
  At $U \( x \) = 0$ this is automatic. The inequality remains valid even if a hole copies a positive value into the removed side; it does not require an exact-zero filled extension on every internal component. Pairing it with a deterministic cutoff uses the full $z$ in Sobolev duality, as in (4.16)– (4.17), rather than a randomly masked original field. Retained frontier vertices still have value zero. Thus the expected energy and squared $W^(1 \, p)$ norm of the filled tail $U$, for $3 \/ 2 < p < 2$, have bounds independent of $eta$. Restricting to $E$ of probability at least $p_(*) > 0$ costs only a factor $p_(*)^(- 1)$ in these annealed bounds.
  The testing measure is within $C eta R$ of $F$: a testing cell has a path of that diameter to its nearest pure boundary piece, and the screening frontier must intersect this path. Transport its mass to $F$ and then past the polylogarithmic holes to retained zero vertices. The frontier is connected between the lateral cutoffs and has diameter comparable to $theta R$, so this transport has the common Frostman bounds. The samplewise averaging and anchor estimates of Lemmas 35–37, in units of $theta R$, give, for some $beta > 0$,
  $ limsup_(R arrow.r oo) bb(E) #scale(x: 120%, y: 120%)[\[] \| chevron.l mu \, U chevron.r \|^2 divides E #scale(x: 120%, y: 120%)[\]] lt.eq C_(p_(*)) \( eta \/ theta \)^(2 beta) . $
  All geometry and $eta > 0$ are fixed before this lattice-scale limit. The original–filled $L^1$ estimate transfers the tested first moment at that fixed scale. Since $h lt.eq h^0 + u$ and the comparison kernel has zero mean conditional on the transcript,
  $ limsup_(R arrow.r oo) bb(E) \[ chevron.l mu \, h chevron.r divides E \] lt.eq C_(p_(*)) \( eta \/ theta \)^beta . $
  This is not a nonpositive bound at fixed $eta$; its right side vanishes only afterwards as $eta \/ theta arrow.b 0$. No Poisson equation or Poisson uniqueness theorem is applied to the comparison tail. For a variable $X$ with variance $v$,
  $ \| bb(E) \[ X divides E \] - bb(E) X \| lt.eq sqrt(v \/ bb(P) \( E \)) . $
  Thus the collar-crossing probability tends to zero. The reflected argument treats a negative pocket.
  It remains to join these attachments by the interior fence. Choose $eta$ so that the collar failures together have probability less than $1 \/ 10$ for large $R$. In each positive fence rectangle, planar crossing duality gives a path with heights greater than $- H$ unless there is a transverse path with heights at most $- H$. Apply Lemma 53 to the reflected field to exclude the latter event. The reflected construction supplies paths with heights less than $H$ in negative rectangles. The same crossing construction in the finitely many overlapping rectangles supplies any required circuits. Choose fixed $H$ sufficiently large that all these threshold-crossing failures together have probability less than $1 \/ 10$. The successful threshold crossings and collar attachments therefore occur together on an event $E_(upright("fence"))$ of probability at least $4 \/ 5$.
  The prescribed shift is deterministic given the conditioned geometry: set it equal to $H + 1$ on each positive crossing rectangle and to $- \( H + 1 \)$ on each negative crossing rectangle. Interpolate to zero within their fixed free enlargements, keeping zero at all observed sites. The separated supports give a bounded prescription with edge differences at most $C \( H \, theta \, eta \) \/ R$, as required by Proposition 49. Keep its sign reinforcing on the corresponding collar. The corrected shift differs from this prescription by $o \( 1 \)$, so it turns each threshold path into a strict sign path. It also preserves the successful collar attachments: the compatibility and clearance conditions give internal diameter distance at least $c R$ from a collar or prescription support of one sign to a prescription support of the other. The near-contact components used by the shift construction have diameter $o \( R \)$ in the free graph. A component meeting a positive collar therefore contains no negative prescription, and its averaged shift is nonnegative; the negative case is reflected. Grounded components have zero shift.
  All of $theta \, eta \, H$ are fixed before $R arrow.r oo$. Apply Proposition 49 once to $E_(upright("fence"))$. It gives a uniformly positive probability for the connected sign fence under the original law. That fence prevents every continuation from entering the protected side. This proves the lower bound above a fixed threshold $R_0 \( theta \, m \)$.
  For $R lt.eq R_0$, the barrier thickening and the required finite sign fences lie in bounded patches at bounded distance from the anchoring components. Lemma 50 forces them with probability bounded below. Taking the smaller of the two bounds proves the all-scale statement.
  Here is the local-thickness check for the applications below. External arms and adapted continuations are attached to the original exterior. An internal record is a connected incident strand through the sampling center, of diameter comparable to its record radius when its quality is positive. An endpoint testing square can be chosen small enough not to contain that center. If an internal record of smaller diameter meets such a square, its connection to the center crosses the square’s rim. Otherwise its diameter is already comparable to the square’s scale. In the extra-excursion construction the endpoint squares lie near radius $rho$, have size at most $c rho$, and are disjoint from the center even when the inner record radius is much smaller than $rho$. Thus no global lower bound on all observed strand diameters is being presumed there. In the strand-swap application the comparison annulus is free of all the inner observations. ◻
]

#thm([Lemma 9.6.])[
  (Exact-strand comparison).  #emph[Fix concentric inner and outer disks with radii in a fixed ratio strictly greater than one. Consider two base conditioning systems whose domains contain the closed outer disk and have the same unconditioned lattice graph there. All vertices constrained by the original strand observations, additional walls, or Dirichlet data must be outside the outer disk in both systems. Thus the entire outer disk, not just its annulus, is free in the two base laws. Each system has anchored observed or Dirichlet pieces of comparable diameter and distance outside this disk. Let $I$ specify a bounded collection of oriented strands all of whose adjacent sign-constrained vertices lie in the inner disk. Then 
$ C^(- 1) bb(P)_2 \( I \) lt.eq bb(P)_1 \( I \) lt.eq C bb(P)_2 \( I \) \, $

 with a constant depending only on the fixed ratios and number of strands. The graphs need agree only inside the outer disk. The assertion does not compare laws with different pre-existing inner observations.]
] <g:strand-comparison>

#proof[
  Take two independent samples from these base laws, conditioning the first additionally on $I$. The only observations inside the outer disk are now this additional event in the first replica, and their support lies inside the inner disk. Hence the annulus remains free in both replicas. Each corridor used there has an anchor at comparable distance under each law; an inner strand from $I$ is also an allowed anchor for the first replica. Choose the two circuit supports in a closed middle subannulus and cover them by finitely many corridors whose fixed enlargements remain in that annulus. They satisfy the free-buffer hypothesis of Lemma 53 in both replicas. Lemmas 53 and 49 therefore give a uniformly positive probability of two nested circuits in the free annulus on which $h_1 - h_2$ has opposite strict signs. We use the cluster-swapping construction of Sheffield [16] Chapter 8, in the hard-constraint form described below; see also [3] Section 2. For each edge declare it a dependency edge when swapping the replicas at just one endpoint violates an edge constraint in one of the replicas. This graph depends only on the unordered height pairs. If the order of the replicas reverses across an edge, either partial swap is feasible: each mixed endpoint difference lies between differences of the original feasible samples. Hence a dependency path cannot change the sign of $h_1 - h_2$. No dependency component meeting the inner disk reaches outside the two opposite-order circuits.
  Swap both replicas at every vertex in a dependency component meeting the inner disk. Every swapped component stays inside the outer disk. The base laws impose no vertex observations there; all their original observations therefore remain at untouched vertices. A graph edge across a swapped-component boundary is not a dependency edge, so the partial swap on that edge is feasible. This proves preservation of both base polytopes. All vertices tested by $I$ are swapped, which transfers $I$ from the first replica to the second; the first replica is not required to retain this additional event. The operation is an involution because the dependency graph and selected components are invariant under swaps. On each component-selection region it is a coordinate permutation, so it preserves Lebesgue measure. If $V_i$ is the volume of the polytope with exterior conditioning $i$, the uniform positive fraction of swappable pairs gives
  $ c thin V_1 \( I \) V_2 lt.eq V_1 V_2 \( I \) . $
  Reverse the experiments for the other inequality. ◻
]

=== 9.3 The harmonic-landing records <the-harmonic-landing-records>

Use rounded disks $frak(B)_R$ made of dual hexagons. Fix the origin and an incident dual edge $e_sigma^(*)$. Let $S$ be independent simple random walk from $v$, let $tau_0$ be its first visit to zero, and reverse its portion up to $tau_0$ to obtain $breve(S)$. Let $tau$ be the first visit to a vertex adjacent to the completed chord or to exterior boundary. Define

$ Z^sigma = { S_tau = 0 \, med e_sigma^(*) subset gamma } . $

Let $"ext"_R gamma$ consist of the two initial pieces grown from the marked endpoints until first entering $frak(B)_R$; it is the whole chord if the disk is missed. Let $beta_R^sigma$ be the part in $frak(B)_R$ of the zero interface through $e_sigma^(*)$, connected to that edge, and put it equal to the empty path if there is no such interface. Let $"ext"_R S$ end at the first entrance to $frak(B)_R$, and let $"int"_R breve(S)$ end at its first exit. Set

$ Phi_R = \( D \, partial_(+) \, h_partial \, v \, "ext"_R gamma \, "ext"_R S \) \, #h(2em) Theta_R = \( beta_R^sigma \, "int"_R breve(S) \) . $

The geometric path in $Theta_R$ is initially unoriented. Conditioning on its orientation means specifying the adjacent signs. Every subsequent field-law application below conditions on these exact signs, then averages over the orientations.

Let $x \, y$ be the two external strand tips and $q$ the external walk tip at radius $R$. When there has been no forbidden contact, define

$ Q \( Phi_R \) = 1 / 100 and frac(d \( x \, "ext"_R S \) and d \( y \, "ext"_R S \) and d \( q \, "ext"_R gamma \) and \| x - y \|, R) . $

Put $Q = 0$ if the disk is missed by the chord or the revealed walk hits a revealed strand. Define $Q \( Theta_R \)$ by the same formula using the two inner strand tips and reversed-walk tip; put it equal to zero for a closed inner interface or a forbidden walk contact.

Figure 2 depicts the two records and the unexposed annulus between them.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 2.4, fill: rgb("#f2f2f2"), stroke: none)
  circle((0, 0), radius: 0.92, fill: rgb("#ffffff"), stroke: none)
  circle((0, 0), radius: 2.4, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((0, 0), radius: 0.92, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  bezier((0.12, 2.92), (0.16, 2.4), (-0.08, 2.72), (0.28, 2.56), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((0.08, -2.92), (0.04, -2.4), (0.32, -2.72), (-0.12, -2.56), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((0.024, -0.92), (0.12, 0.04), (-0.08, -0.52), (0.16, -0.32), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((0.12, 0.04), (0.128, 0.912), (0.08, 0.4), (0.28, 0.64), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((-3.12, 0.24), (-2.4, 0.08), (-2.88, 0.08), (-2.64, 0.24), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  bezier((0, 0), (-0.912, 0.096), (-0.32, -0.12), (-0.56, 0.144), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  circle((0, 0), radius: 0.036, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((-2.96, 0.256), [#text(size: 9pt)[$v$]], anchor: "south-east", padding: 0.1176cm)
  content((1.08, 0.76), [#text(size: 9pt)[$Theta_r$: inner record]], anchor: "west", padding: 0.1176cm)
  line((1.04, 0.72), (0.52, 0.48), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((1.92, 2.12), [#text(size: 9pt)[$Phi_R$: outer record]], anchor: "west", padding: 0.1176cm)
  line((1.88, 2.12), (0.28, 2.56), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((1.44, -1.32), [#text(size: 9pt)[buffer]])
  content((-0.76, -1.44), [#text(size: 9pt)[sampled side]], anchor: "east", padding: 0.1176cm)
  line((-0.84, -1.24), (-0.36, -0.32), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((0.616, 0.616), [#text(size: 9pt)[$r$]], anchor: "south-west", padding: 0.1176cm)
  content((1.68, 1.68), [#text(size: 9pt)[$R$]], anchor: "south-west", padding: 0.1176cm)
  line((-1.6, -3.32), (-1.16, -3.32), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((-1.04, -3.32), [#text(size: 9pt)[observed interface]], anchor: "west", padding: 0.1176cm)
  line((-1.6, -3.64), (-1.16, -3.64), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  content((-1.04, -3.64), [#text(size: 9pt)[observed walk pieces]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: The two records leave an annulus available for separation and hookup. The inner walk arrow indicates reversal from the harmonic landing. The shaded annulus is unexposed; no interface connection there has yet been required. ],
) <fig:harmonic-records>

#thm([Lemma 9.7.])[
  (Hookup probability).  #emph[For $9 R \/ 8 < R' < 5 R$, with the observer and exterior boundary outside $frak(B)_(6 R)$, there is a universal upper bound for all $R gt.eq R_0$, where $R_0 > 1$ is fixed: 
#[#set math.equation(numbering: n => "(G1)")
 $ bb(P) \( Z^sigma divides Phi_(R') \, Theta_R \) lt.eq C \/ log R . $]

 For every $a > 0$ there is $c \( a \) > 0$ such that the same probability is at least $c \( a \) \/ log R$ when $Q \( Phi_(R') \) and Q \( Theta_R \) gt.eq a$ and $R gt.eq R_0 \( a \)$.]
] <g:hookup>

#proof[
  The field part of $Phi_(R')$ constrains only sites adjacent to the external arms, hence outside radius $R' - O \( 1 \)$. The sites specifying $beta_R^sigma$ lie inside radius $R + O \( 1 \)$. Choose comparison disks between these two radii, with outer radius $\( R + R' \) \/ 2$ and inner radius $R + \( R' - R \) \/ 4$. For sufficiently large $R$, they have a free intervening annulus of fixed relative width. The original base observations are all outside the outer disk, and the external arms give the required anchors. Thus Lemma 55 applies to the two orientations of the inner strand, comparing the exterior data with their global sign reversal. Together with sign symmetry it gives a uniformly positive probability that the two observed unoriented configurations have compatible signs on the side containing the walk. In that case join corresponding interface tips and the two walk tips by three disjoint corridors, of width $c \( a \) R$. Four signed barriers alongside the two interface corridors have the required pure endpoint pockets. Proposition 54 forces the interface joins within these corridors with uniformly positive probability. Planarity forces the outer arms to merge with the corresponding inner arms; there is no other exit through the fences.
  The remaining walk bridge must reach the joining vertex of the reversed inner piece. Its conditioning to reach this vertex before zero has probability bounded below. Harnack gives a positive probability to follow the free third corridor to a fixed relative neighborhood of that vertex; the two-dimensional point-hitting estimate gives probability comparable to $1 \/ log R$ to hit it there. The loop portion between its first and last visits stays in that corridor with probability bounded below, by the last-exit decomposition. This proves the lower bound. Conditional on any completed field configuration, hitting the same vertex before a nearby interface continuum has probability at most $C \/ log R$; this proves the upper bound. These are precisely the walk hypotheses of [14] Lemma 3.14: radii in the specified compact ratio range, observer outside the larger disk, and two prescribed first/last walk pieces. All field estimates used in its corridor construction have been supplied above.
  We record the two augmented upper bounds used below. First, the upper bound still holds after the whole field, hence $gamma$, is fixed; the middle walk bridge remains unexposed. Second, put $H = \( Phi_(3 r) \, Theta_(2 r) \)$, and expose that middle walk only until its first exit from a circle of radius $rho \/ 3 > 10 r$, if this occurs before its prescribed terminal piece. Call this stopped prefix $S_(* *)$. On this escape event,
  #[#set math.equation(numbering: n => "(GK)")
   $ bb(P) \( Z^sigma divides H \, S_(* *) \, upright("escape") \) lt.eq C \/ log r . $]
  For verification, let $hat(q)$ be the joining vertex of the fixed reversed inner piece. The first-hit/last-exit decomposition leaves a walk from the current exit vertex to $hat(q)$, conditioned to hit $hat(q)$ before zero, followed by its last-exit loop. Harnack bounds the conditioning probability below by a fixed constant, since the exit vertex is outside $B_(10 r)$ while $\| hat(q) \| = 2 r + O \( 1 \)$. To realize $Z^sigma$, this first part must hit $hat(q)$ before the connected inner interface. The same point-versus-continuum estimate as above is at most $C \/ log r$; the remaining loop can only reduce the probability. This argument holds for every completed field consistent with the records, and averaging gives (GK). It does not expose the later successful bridge. ◻
]

#thm([Lemma 9.8.])[
  (Separation under a harmonic landing).  #emph[For every $epsilon > 0$ there is $c \( epsilon \) > 0$ such that, for all sufficiently large $R$, 
#[#set math.equation(numbering: n => "(G2)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] Q \( Phi_(3 R) \) and Q \( Theta_(2 R) \) > c \( epsilon \) divides Phi_(4 R) \, Theta_R \, Z^sigma #scale(x: 120%, y: 120%)[\)] > 1 - epsilon $]

 uniformly in all admissible records for which the conditioning has positive probability. The observer and original boundary are outside $frak(B)_(6 R)$.]
] <g:separation>

#proof[
  First suppose the inner quality is bounded below. Expose the external arms inward, taking $r_(j + 1) = \( 1 - 10 Q_j \) r_j$, where $Q_j$ is their quality or zero if the hookup has become impossible. Conditional on the current records, but not on $Z^sigma$, there are constants $c_0 \, c_1 > 0$ such that
  #[#set math.equation(numbering: n => "(G3)")
   $ bb(P) \( Q_(j + 1) gt.eq \( 2 Q_j \) and 1 \/ 100 divides Phi_(r_j) \, Theta_R \) gt.eq c_0 \, $]
  #[#set math.equation(numbering: n => "(G4)")
   $ bb(P) \( Q_(j + 2) = 0 divides Phi_(r_j) \, Theta_R \, Q_(j + 1) < 2 Q_j \) gt.eq c_1 . $]
  For (G3), steer the two interface tips and the walk into three separated corridors of size $r_j Q_j$. Their annulus is disjoint from the fixed inner observations. Proposition 54 and the local Harnack bound for the walk bridge give the required probability whenever $r_j Q_j$ exceeds a fixed threshold. Below that threshold the finite step construction of Lemma 50 applies. The steering sites lie within a bounded distance of the existing tips.
  For (G4), put $cal(F)_j = sigma \( Phi_(r_j) \, Theta_R \)$, $q = Q_j > 0$, $r' = r_(j + 1)$, and $F = { Q_(j + 1) < 2 q }$. Reveal the two external arms to radius $r'$, but do not yet reveal the whole intervening walk. Write $x \, y$ for their tips, $w$ for the eventual walk tip at radius $r'$, and $S^dagger$ for the walk between its first radius-$r_j$ and radius-$r'$ entrances. The following five events cover $F$:
  #[#set math.equation(numbering: n => "(G4a)")
   $ M_0 & = { Q_(j + 1) = 0 } \,\
M_1 & = { d \( S^dagger \, { x \, y } \) < \( 2 q r' \) and \| x - y \| } \,\
M_2 & = F ∩ { r' Q_(j + 1) = d \( w \, "ext"_(r') gamma \) } \,\
M_3 & = F ∩ { 0 < r' Q_(j + 1) = \| x - y \| } \,\
M_4 & = F ∩ { Q_(j + 1) = 1 \/ 100 } . $]
  An event involving tips is empty if those tips do not exist; this case is already in $M_0$. The old walk outside radius $r_j$ cannot cause the new insufficient separation, since $r_j - r' = 10 q r_j > 2 q r'$, with the rounded-disk lattice margin absorbed in these constants. Thus $M_i subset F$ and their union is $F$, including ties in the quality minimum.
  Let $L = { Q_(j + 2) = 0 }$. The field-free stopped-walk estimate in [14] proof of (3.38), case $i = 1$ gives
  #[#set math.equation(numbering: n => "(G4b)")
   $ bb(P) \( L ∩ M_1 divides cal(F)_j \) gt.eq c bb(P) \( M_1 divides cal(F)_j \) . $]
  Here are the conditioning and geometric hypotheses for that estimate. After fixing $"ext"_(r') gamma$, stop $S^dagger$ at its first visit within $a = \( 2 q r' \) and \| x - y \|$ of either tip. Reveal only the walk up to this first approach. The conditioned inner reversed record leaves the first walk bridge as a simple walk transformed to hit its joining vertex before zero. Harnack compares this transform with ordinary walk by fixed factors in the approach neighborhood: the fixed inner record is at distance comparable to $R$, whereas $a lt.eq 2 q r' lt.eq r' \/ 50$. The approached strand extends a distance comparable to $a$, the other tip is at distance at least $a$, and the preceding annular width is at least $5 a$. These are exactly the hypotheses of the source’s first-approach walk argument. Its strong Markov and planar hitting estimate have a numerical lower bound, independent of $a \/ r_j$, and force a strand hit before the next quality-controlled annulus is passed. Integrating this stopped-record estimate gives (G4b). In particular one must not additionally fix the later walk segment after it has escaped from this close approach; a uniform estimate for each such completed record would be false.
  For $M_2$ and $M_4$ the same hitting bound starts at the current walk tip and does apply after that radius-$r'$ record is fixed. On $M_3$, a compatible barrier around the midpoint of $\[ x \, y \]$ at radius $2 \| x - y \|$ forces the two strands to join before the next inner circle, since its radial gap is $10 \| x - y \|$. This kills hookup without meeting the fixed inner strand. Proposition 54 applies, and bounded scales use Lemma 50. The case $M_0$ is immediate. Hence (G4b) holds for every $M_i$, with a common $c > 0$. The events need not be disjoint: summing yields
  $ 5 bb(P) \( L ∩ F divides cal(F)_j \) gt.eq sum_(i = 0)^4 bb(P) \( L ∩ M_i divides cal(F)_j \) gt.eq c bb(P) \( F divides cal(F)_j \) . $
  Division by $bb(P) \( F divides cal(F)_j \) > 0$ proves (G4).
  Iterating (G3), followed by Lemma 56, shows that a quality $q > 0$ with a fixed annular buffer remaining has
  #[#set math.equation(numbering: n => "(G5)")
   $ bb(P) \( Z^sigma divides upright("current records") \) gt.eq c q^alpha \/ log R $]
  for a fixed $alpha > 0$. The radial loss while doubling the quality is bounded by a geometric sum. Let $M_n$ count visits to $\( 2^(- n) \, 2^(1 - n) \]$. By (G4), survival for $2 m$ such visits has unconditioned probability at most $\( 1 - c_1 \)^m$. Multiply by the upper bound in (G1), and divide by (G5) at the first visit to the band. This yields
  #[#set math.equation(numbering: n => "(G6)")
   $ bb(P) \( M_n > 2 m divides Phi_(4 R) \, Theta_R \, Z^sigma \) lt.eq C c_0^(- n) \( 1 - c_1 \)^m . $]
  For a sufficiently large fixed $A$, the bounds in (G6) with $m = A n$ have a geometric tail in $n$. Choose $N$ so that their sum over $n gt.eq N$ is less than $epsilon \/ 3$, and so that
  $ C A sum_(n gt.eq N) n 2^(- n) < 1 \/ 2 . $
  Here $C$ bounds the radial loss: one visit to the $n$-th band costs at most $10 dot.op 4 R dot.op 2^(1 - n)$, since $r_j - r_(j + 1) = 10 Q_j r_j$. Outside the exceptional event in (G6), there are at most $2 A n$ such visits. Thus, while the quality stays below $2^(- N)$, the total radial loss is less than $R \/ 2$. With probability at least $1 - epsilon \/ 3$, a fixed positive quality is therefore attained before the radius falls from $4 R$ to $7 R \/ 2$.
  To rule out a subsequent collapse at $3 R$, use the two mechanisms in [14] proof of Lemma 3.15, equations (3.40)–(3.42). Condition on the first record at which that positive quality is attained, and reveal the external strands to radius $3 R$. If their tips are within $s R$, their midpoint is now fixed. Expose the continuations successively to barriers at radii $2 s R \, 4 s R \, dots.h \, c R$ about that midpoint. Hookup requires breaching each barrier. Proposition 54 bounds each conditional breach probability by $1 - p$; the number of scales is comparable to $log \( 1 \/ s \)$, giving $C s^beta$ for a fixed $beta > 0$. Fixing the completed field while leaving the walk bridge unexposed supplies the additional upper factor $C \/ log R$ from (G1). For a walk–strand approach, fix $"ext"_(3 R) gamma$ and reveal the walk only to its first $s R$-approach to that strand. Beurling gives $C s^zeta$, for a fixed $zeta > 0$, for reaching radius $5 R \/ 2$ without a hit. At its first entrance there, the remaining unexposed bridge again contributes $C \/ log R$. Hence the joint probability of late collapse and hookup is at most $C \( s^beta + s^zeta \) \/ log R$. Divide by (G5) at the already attained positive quality, then take $s$ small.
  For general inner quality expose both records: increase the inner radius by factor $1 + 10 Q_j$ while decreasing the outer radius by $1 - 10 Q_j$, using the smaller of their qualities. Until the target radii $2 R$ and $3 R$, their annuli are disjoint. The same finite collection of compatible barriers proves (G3)–(G4) for this minimum; independence of the fields in the two annuli is not needed. The same band calculation and late-collapse bound establish (G2). The conditional records in these steps are exactly the two-sided exploration records used in [14] Lemma 3.15; their field part consists solely of specified oriented strands. ◻
]

#thm([Proposition 9.9.])[
  (Comparison of sampled configurations).  #emph[There are $C < oo$ and $R_0 < oo$ such that the following holds for $R gt.eq R_0$. Take two domains containing $frak(B)_(6 R)$, with observers outside that disk, and any two external records $phi.alt \, phi.alt'$ at radius $4 R$ having positive hookup probability. For every event $H$ determined by $Theta_R$, with the same specified incident-edge label and landing side in the two experiments, 
#[#set math.equation(numbering: n => "(G7)")
 $ C^(- 1) bb(P)' \( H divides Phi'_(4 R) = phi.alt' \, Z' ""^sigma \) lt.eq bb(P) \( H divides Phi_(4 R) = phi.alt \, Z^sigma \) lt.eq C bb(P)' \( H divides Phi'_(4 R) = phi.alt' \, Z' ""^sigma \) . $]

 The constant is independent of $R$ and of additional unused annuli outside radius $4 R$.]
] <g:sample-comparison>

#proof[
  Before hookup conditioning, the field observations in each $Phi_(3 R)$ are only the signs adjacent to its two external arms, supported outside radius $3 R - O \( 1 \)$. The event specifying an oriented $beta_(2 R)^sigma$ tests vertices inside radius $2 R + O \( 1 \)$. Apply Lemma 55 with inner disk of radius $9 R \/ 4$ and outer disk of radius $5 R \/ 2$. Both base laws have no observations in this outer disk, their graphs agree there, and their external arms connect scale $3 R$ to the original boundary outside scale $6 R$, providing the anchors. Thus the inner oriented-strand laws are comparable by a fixed factor under these different external records. At this step no $Theta$-record has already been imposed in either base law: the inner record is precisely the additional event being compared. The reversed-walk law is also comparable by a fixed factor: a walk from either entrance point has probability bounded below to visit the other before reaching zero. Apply the strong Markov property at that visit. The field and walk factors are independent before hookup. Thus there is a reference weight $p_(2 R) \( theta \)$ for inner records such that their probabilities given a record at radius $3 R$ are comparable to this weight.
  Choose the quality threshold in Lemma 57 with error $1 \/ 2$, and let $X$ be the inner records at $2 R$ exceeding it. Let $cal(Q)$ be the event that both the $2 R$ inner and $3 R$ outer records exceed it. Separation holds even conditional on a specified $Theta_R = theta.alt$. Hence conditioning further on $cal(Q)$ changes the probability of this specified inner record by at most a fixed factor. On $cal(Q)$, Bayes’ formula, the reference-weight comparison, and Lemma 56 give
  $ bb(P) \( Theta_(2 R) = theta divides cal(Q) \, Z^sigma \, Phi_(3 R) \) asymp frac(p_(2 R) \( theta \), sum_(xi in X) p_(2 R) \( xi \)) quad \( theta in X \) . $
  Indeed the numerator before normalization is comparable to $p_(2 R) \( theta \) \/ log R$, and summing determines its normalization. Average over $Phi_(3 R)$, then sum over all $theta in X$ whose restriction to radius $R$ is $theta.alt$. The resulting reference ratio is independent of the external experiment, proving (G7) first for single records, then for events. Conditioning on data farther out and averaging over the radius $4 R$ records preserves the same constant. ◻
]

#thm([Lemma 9.10.])[
  (No additional sampled excursions).  #emph[Let $cal(J) \( r \, R \)$ be the event that more than two disjoint interface arcs cross from $frak(B)_r$ to $partial frak(B)_R$, or that the walk exits $frak(B)_R$ after first entering $frak(B)_r$ and before its landing at zero. For every $epsilon > 0$ there are $A \( epsilon \) < oo$ and $r_0 \( epsilon \) < oo$ such that 
#[#set math.equation(numbering: n => "(G8)")
 $ bb(P) \( cal(J) \( r \, R \) divides Phi_R \, Theta_r \, Z^sigma \) < epsilon $]

 when $r gt.eq r_0 \( epsilon \)$, $R > A \( epsilon \) r$, the observer and boundary are outside $frak(B)_(4 R)$, and the conditioning has positive probability. The same holds, with a harmless change of $epsilon$, conditioned only on $Phi_R$ and $Z = { S_tau = 0 }$.]
] <g:extra>

#proof[
  Separation in inner and outer buffers makes all four records at scales $2 r \, 3 r \, R \/ 2 \, 3 R \/ 4$ have quality at least $c \( epsilon \)$, except with probability $O \( epsilon \)$. Put $rho asymp sqrt(r R)$. Let $H = \( Phi_(3 r) \, Theta_(2 r) \)$. The walk portion $S_(*)$ from its first radius-$3 r$ entrance to the last visit, before zero, to the endpoint of its radius-$r$ reversed piece is unlikely to leave $frak(B)_(rho \/ 3)$ without hitting the external arms. The ordinary Beurling estimate and first-hit/last-exit decomposition bound this probability, conditional on $H$, by $b \( R \/ r \) arrow.r 0$. If it escapes, reveal only its prefix $S_(* *)$ up to first exit. The augmented bound (GK), not a bound conditioned on the completed walk, gives
  $ bb(P) \( S_(*) subset.not frak(B)_(rho \/ 3) \, Z^sigma divides H \) lt.eq C b \( R \/ r \) \/ log r . $
  Divide by the lower bound $c \( epsilon \) \/ log r$ on separated records and average over them. This proves confinement under the landing law.
  For the outer construction, use only $"ext"_(3 r) S$. Let $S'$ be its terminal path from its last exit of $frak(B)_(R \/ 3)$ to its endpoint at radius $3 r$. Choose measurably from $S'$ an arc on the circle of radius $rho$ whose union with $S'$ separates the inner and outer circles. Intersect this open circular arc with $D \( "ext"_(3 r) gamma \)$. Its two components next to $S'$ have other endpoints on the boundary of this deleted-triangle domain, not on the interface itself; call them $alpha_1 \, alpha_2$. Thus an endpoint attachment does not already count as an interface intersection. They are $Phi_(3 r)$-measurable. In the component on either side, place nested barriers separating such a piece from the inner circle. The deterministic construction is the clearance construction in [14] proof of (3.48): take a separating circular arc; if its middle has adequate boundary clearance, attach shortest endpoint segments, and otherwise repeat at the smaller distance between its two facing pure boundary pieces. The procedure terminates because the two boundary pieces are disjoint. Each output has a fixed relative barrier parameter, although its lattice diameter may be small. Barriers selected in distinct dyadic annuli remain mutually separated.
  After exposing the two interface arms to one barrier, the next barrier satisfies Proposition 54, including its bounded-scale case. Thus crossing $N$ barriers has probability at most $\( 1 - c \)^N$, conditional on $H$ but not on the landing. For $F = { gamma ∩ \( alpha_1 union alpha_2 \) eq.not diameter }$, fix the completed field while retaining the unexposed walk bridge. The first augmented upper bound following (G1) gives
  $ bb(P) \( F \, Z^sigma divides H \) = bb(E) \[ 1_F bb(P) \( Z^sigma divides H \, gamma \) divides H \] lt.eq frac(C, log r) bb(P) \( F divides H \) . $
  The same lower normalization gives $C \( epsilon \) \( 1 - c \)^N$ under the landing law, where $N arrow.r oo$ with $R \/ r$. Repeat the whole construction from the inner reversed record $Theta_(R \/ 3)$, without also revealing the forward intermediate bridge.
  Outside these exceptional events, confinement identifies the terminal forward path $S'$ with the corresponding portion of the reversed inner record. The same deterministic circular-arc selection then makes the two crosscuts from the separate descriptions coincide. Their boundary endpoints therefore attach to lattice edges incident to both the inner incident strand and the two external arms. These strand attachments are on opposite sides of the incident edge: the other possibility contradicts the winding number of the circular separator completed along the common walk path. This is the deterministic Jordan-curve conclusion in [14] final paragraphs of Lemma 3.17; its hypotheses are the two coinciding crosscuts, a simple interface, and the common walk avoiding it before zero, all obtained above. Thus each external arm has merged with a distinct inner arm, and there can be no additional annular interface crossing.
  The total error is $C epsilon + o_(R \/ r) \( 1 \) + C \( epsilon \) \( 1 - c \)^N$. Choose the buffer error first and then $R \/ r$ large. Average over $Theta_r$ and the six possible incident edges for the external-only statement. ◻
]

=== 9.4 Boundary clearance, survival, and nonreturn <boundary-clearance-survival-and-nonreturn>

The survival and nonreturn arguments adapt [14] Lemma 3.26, especially equation (3.62), using the barrier and sampled-excursion estimates proved above. For the boundary-attaching arguments in this subsection, fix $lambda_(*) > 0$ and assume the exterior Dobrushin data satisfy

#[#set math.equation(numbering: n => "(GB)")
 $ h_partial in \[ lambda_(*) \, 1 \/ 2 \] upright(" on ") partial_(+) \, #h(2em) h_partial in \[ - 1 \/ 2 \, - lambda_(*) \] upright(" on ") partial_(-) . $]

All constants may depend on $lambda_(*)$. This includes the reference data $plus.minus 1 \/ 2$, and the candidate matched data $plus.minus l$ with $l gt.eq c$ from Lemma 51. No uniform assertion as $l arrow.b 0$ is required. The source’s boundary condition [14] condition $\( partial \)$, Section 3.7 is more permissive, allowing small wrong-sign heights; we do not need or invoke that additional Gaussian statement.

#thm([Lemma 9.11.])[
  (Clearance from the original boundary).  #emph[Let $S$ be an independent full walk from $v$, stopped only on the original boundary at $tau_D$, and let $gamma$ be the completed interface. Put $d = "dist" \( v \, partial D \)$ and 
$ M = { S_j : j < tau_D \, med S_j upright(" is adjacent to ") gamma } . $

 Under $\( upright("GB") \)$, uniformly over domains, observers, and the indicated exterior data, 
#[#set math.equation(numbering: n => "(GB1)")
 $ lim_(eta arrow.b 0) limsup_(d arrow.r oo) bb(P) #scale(x: 120%, y: 120%)[\(] "dist" \( M \, partial D \) < eta d #scale(x: 120%, y: 120%)[\)] = 0 . $]

 The distance of the empty set is infinity. In particular the assertion holds for a terminal harmonic landing, or simultaneously for every old-prefix landing of this walk that is not on $partial D$.]
] <g:boundary-landing>

#proof[
  We adapt the full-walk argument of [14] Lemma 3.23, especially equations (3.53) and (3.55). We first establish pure-arc repulsion. For $y in partial_(+)$, choose any deterministic lower bound $b lt.eq d_D \( y \, partial_(-) \)$. At successive fixed-ratio scales between $b$ and $r$, take the component of $B \( y \, rho \) ∩ D$ accessible from $y$, and its circular crosscut separating $y$ from $partial_(-)$. The clearance construction used in Lemma 59 supplies a barrier attached to the two positive boundary pieces on either side of $y$. Its endpoint pockets stay on $partial_(+)$, since their diameter is smaller than $b$. Explore the interface only up to the next outer crosscut. Its exact sign transcript leaves the inner barrier compatible, so Proposition 54 gives a fixed conditional chance of avoiding this crosscut and every smaller access to $y$. Iterating, then reflecting for $y in partial_(-)$, gives constants $C \, zeta > 0$ such that
  #[#set math.equation(numbering: n => "(GB2)")
   $ bb(P) { d_D \( y \, gamma \) < r } lt.eq C \( r \/ b \)^zeta + o_d \( 1 \) \, $]
  when $r \, b$ are fixed positive multiples of $d$ and $r < b$. The lattice error is uniform for these fixed multiples. This is the deterministic crosscut argument of [14] Theorem 3.22, with its field input replaced by our exterior version of Proposition 54.
  Fix $r = eta d$, and condition on $gamma$. At the first walk visit to $M$ at distance less than $r$ from $partial D$, the strong Markov property and the planar walk estimate give a fixed probability of exiting $D$ in the ball of radius $2 r + O \( 1 \)$ about a closest boundary point. One can force the walk to surround that point inside this ball, which forces the exit. Its continuation and the adjacent interface edge then give an internal path of diameter at most $4 r + O \( 1 \)$ from the exit $Y = S_(tau_D)$ to $gamma$. Consequently
  #[#set math.equation(numbering: n => "(GB3)")
   $ bb(P) { "dist" \( M \, partial D \) < r } lt.eq C bb(P) { d_D \( Y \, gamma \) < 4 r + O \( 1 \) } . $]
  Here $Y$, unlike the interface landing, is independent of $gamma$. Conditional on $Y$, apply (GB2) whenever its internal distance to the opposite arc exceeds $s = sqrt(eta) thin d$, using the deterministic lower bound $b = s$ in that estimate. This gives $C eta^(zeta \/ 2) + o_d \( 1 \)$.
  It remains to bound exits within internal distance $s$ of both sign arcs. Delete all paths of diameter at most $2 s$ joining the two arcs and retain the component of $v$. Its new boundary lies in two balls of radius $4 s$. To verify this elementary fact, classify each deleted crosscut by which marked sign-change endpoint it separates from $v$. Any two crosscuts in the same class which touch the retained component intersect: otherwise their separation order prevents one of them from touching that component. Their diameter bound puts the whole class in one ball. There are two classes. An exit near both arcs is beyond this new boundary. The walk hitting estimate for these two balls gives $C \( s \/ d \)^(1 \/ 2) = C eta^(1 \/ 4)$. Combining with (GB3) proves (GB1).
  Every nonexterior old-prefix landing is a vertex of $M$, pathwise, because the prefix is contained in $gamma$ and the full walk has not yet exited $D$. This proves the simultaneous assertion without conditioning on any landing event or on any stopping time. ◻
]

#thm([Lemma 9.12.])[
  (Clearance from the observer).  #emph[Uniformly over the same bounded-data experiments, 
#[#set math.equation(numbering: n => "(GB4)")
 $ lim_(eta arrow.b 0) limsup_(d arrow.r oo) bb(P) { "dist" \( v \, gamma \) < eta d } = 0 . $]

 This assertion does not require the lower bound in $\( upright("GB") \)$.]
] <g:observer-landing>

#proof[
  The nested shielding argument follows [14] Lemma 3.24, using Proposition 54. Expose the first interface approach to the circles centered at $v$ of radii $2^(- j - 1) d$. Given its exact sign transcript at one such circle, the circular clearance construction and Proposition 54 give a fixed chance of protecting the next smaller disk. All attachments are to the observed strands, not to the original boundary. Thus failure through $N$ scales has probability at most $\( 1 - p \)^N$. Fix $N$ first and let $d arrow.r oo$, so every used scale diverges; then let $N arrow.r oo$. This proves (GB4). It also excludes all terminal and old-prefix landings within $eta d$ of $v$, up to one lattice spacing. ◻
]

#thm([Lemma 9.13.])[
  (Survival of a stopped harmonic landing).  #emph[Let $T$ be any stopping time for the filtration generated by oriented initial interface pieces, $K = gamma \[ 0 \, T \]$, and $d = "dist" \( v \, partial D \)$. Let $X_T$ be the first landing of an independent full walk $S$ on $partial D \( K \)$; let $Y$ be its landing for the completed interface. For every $epsilon > 0$ there are $p > 0$, $d_0 < oo$ such that 
#[#set math.equation(numbering: n => "(G9)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] bb(P) \( Y = X_T divides K \, S \) < p #scale(x: 120%, y: 120%)[\)] < epsilon #h(2em) \( d > d_0 \) \, $]

 uniformly over the domains, observers, and stopping times under $\( upright("GB") \)$.]
] <g:survival>

#proof[
  Conditional on an exact stopped prefix $K$, the field has the ordinary strand-conditioned law: whether the rule stopped at this prefix is already decided by that prefix. The independent walk adds no field conditioning. Put $U = D \( K \)$. For small fixed $delta > 0$, except on an event tending uniformly to zero with $delta$, the following four conditions hold:
  #[#set math.equation(numbering: n => "(G10)")
   $ & d_U \( X_T \, upright("opposite-sign side") \) gt.eq 2 delta d \,\
 & "diam" S \[ 0 \, tau_T \] < delta^(- 1) d \,\
 & "diam" S \[ t_(*) \, tau_T \] < delta d \/ 4 \, quad t_(*) = inf { t : d \( S_t \, partial U \) lt.eq delta^2 d } \,\
 & d \( v \, K \) gt.eq delta^(1 \/ 2) d . $]
  The middle two statements are the planar walk hitting estimate uniform in $U$. The last statement follows from Lemma 61 and $K subset gamma$. For the observer-separated stopping times needed in the driving argument, the last condition can instead be imposed deterministically.
  For the first condition delete all crosscuts of diameter at most $4 delta d$ joining the two sign sides. The new boundary of the component containing $v$ lies in two balls of radius $8 delta d$. Indeed each deleted crosscut separates $v$ from one of the two sign-change points; any two crosscuts for the same point which touch the retained component must intersect. All such crosscuts are consequently within twice their diameter of a fixed one. Apply the walk hitting estimate to those two balls, using the last condition. This also explains why arbitrary narrowing of $U$ does not invalidate (G10).
  Fix records satisfying (G10), and suppose the landing is positive. The deterministic clearance construction used in Lemma 59 gives a compatible crosscut $Upsilon_0$ in $B \( X_T \, delta d \) \\ B \( X_T \, delta d \/ 2 \)$, joining the positive boundary pieces on either side of $X_T$ and separating it from the negative side. If no hexagon centered at a vertex of the stopped walk meets this crosscut, avoidance of this crosscut protects the entire walk. Otherwise add the boundaries of the walk hexagons on its unprotected side and take the boundary facing the negative side. Its diameter is at most $2 delta^(- 1) d$; its new part is at distance at least $delta^2 d \/ 2$ from $partial U$, by the terminal-walk condition. Indeed a contacting walk hexagon occurs before $t_(*)$, since the terminal walk piece lies in $B \( X_T \, delta d \/ 4 \)$, whereas the crosscut lies outside $B \( X_T \, delta d \/ 2 \)$. That contact is at distance at least $delta^2 d - O \( 1 \)$ from $partial U$; therefore the boundary-attached original crosscut has diameter at least $delta^2 d - O \( 1 \)$ as well. The old endpoints retain their pure pockets. It is therefore a barrier with parameter $c delta^3$ and scale $2 delta^(- 1) d$.
  Proposition 54 gives probability at least $p_delta > 0$ that the future interface avoids the resulting barrier. On this event it is adjacent to no vertex of the stopped walk, so $Y = X_T$. In the first branch $Upsilon_0$ can have bounded lattice diameter; this is covered by the all-scale part of that proposition. Reflect signs for a negative landing. Choose $delta$ to make the failure probability of (G10) smaller than $epsilon$, and then take $d$ sufficiently large. ◻
]

#thm([Proposition 9.14.])[
  (Nonreturn at stopped harmonic landings).  #emph[For every $epsilon > 0$ there are $s > 0$ and $d_0 < oo$ such that 
#[#set math.equation(numbering: n => "(G11)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] d \( X_T \, gamma \\ gamma \[ 0 \, T \] \) < s d \, thin X_T in.not partial D #scale(x: 120%, y: 120%)[\)] < epsilon #h(2em) \( d > d_0 \) \, $]

 uniformly over all sign-filtration stopping times $T$, with $d = "dist" \( v \, partial D \)$, under $\( upright("GB") \)$.]
] <g:nonreturn>

#proof[
  Let $cal(G) = sigma \( K \, S \)$, $A = { Y = X_T }$, and $q = bb(P) \( A divides cal(G) \)$. Lemma 62 implies, for every $cal(G)$-measurable event $E$,
  #[#set math.equation(numbering: n => "(G12)")
   $ bb(P) \( E \) lt.eq epsilon_1 + p^(- 1) bb(P) \( E ∩ A \) . $]
  Take $E$ to be the event that the old prefix has more than two crossings of an annulus about its walk landing. On $A$, this implies the corresponding event for the completed interface at its completed harmonic landing. Lemma 59, with error smaller than $p epsilon_1$, therefore removes all additional old excursions from a small comparison window.
  Exclude landings close to the old tip using the walk hitting bound. Lemmas 60 and 61 exclude landings close to the original boundary or observer, uniformly over all prefixes. Choose the largest comparison window smaller than one tenth of this retained clearance. This verifies the original boundary and observer exclusions when Lemma 59 is applied after recentering at the landing.
  In the remaining window exactly two incident old arms reach the outer circle, and the old tip lies outside it. There are two relevant complementary components. In each, select nested compatible barriers attached to its pure old side. After each failed shield, reveal the future arms up to that barrier; the conditional field law is again an exact-strand law, so the next shield succeeds with probability at least a fixed $c > 0$. Failure through $N$ scales has probability at most $\( 1 - c \)^N$. When neither complementary component is traversed, the future cannot enter the innermost Euclidean ball. The removal of additional old excursions is what converts this internal-access conclusion to Euclidean nonreturn.
  Choose $epsilon_1$, obtain $p$ from survival, choose the completed excursion error below $p epsilon_1$, choose $N$, and then let all the finitely many retained scales tend to infinity in lattice units. Finally choose their innermost relative radius $s$. The sum of the discarded probabilities can be made less than $epsilon$, proving (G11). ◻
]

#prodef([Remark 9.15.])[
  (What the geometric result supplies).  The random mass of old-boundary accesses revisited by the future is the conditional harmonic probability of the event in (G11). Its expectation tends to zero, uniformly over stopping rules. Consequently bounded harmonic boundary tests may discard this mass. This is the estimate needed before a tower-property argument for a stopped observable. Absolute continuity of access in each fixed domain alone would not give its uniform form.
]

== 10 Height Gap and Curve Identification <sec:interface>

The field results identify harmonic conditional means away from prescribed strands. To identify the curve, we must determine their boundary traces on the strand and retain those traces when the strand is stopped. This section separates the corresponding implications. Every application below requires the uniform versions of the preceding field and geometric estimates; a statement for one fixed conditioning would not suffice.

=== 10.1 Conditional means viewed from harmonic landings <conditional-means-viewed-from-harmonic-landings>

Throughout this section $gamma_n$ denotes the ordered #emph[dual sign strand], rather than the affine zero segments. Write $cal(F)_t^n$ for the sigma-field generated by its oriented prefix up to time $t$. It reveals adjacent signs, rather than the height ratios encoded by affine crossing positions. Let $T$ be a stopping time for this filtration. For a deterministic smooth test $f$ define

$ X_n \( f \) = integral_(D_n) f \( z \) h_n \( z \) thin upright(d) z \, #h(2em) M_T^n \( f \) = bb(E) \[ X_n \( f \) divides cal(F)_T^n \] . $

Thus $M_t^n \( f \)$ is an exact martingale. A test chosen afresh after $T$ does not define this martingale and will not be used in the driving argument. For a complete strand, write $m_n \( z \) = bb(E) \[ h_n \( z \) divides gamma_n \]$. The same notation with a superscript $T$ denotes the stopped conditional mean. Comparisons with bounded pinned data bound these profiles uniformly. Their subsequential limits are harmonic on the complementary open sets: Proposition 30 supplies the interior weak equation, Proposition 31 gives $A > 0$, and the common-wall comparison supplies compactness.

Let $v_n$ be an interior observer vertex, with a fixed positive physical distance from the original boundary. An independent walk from $v_n$ samples the harmonic measure of the complete strand and the original boundary. A landing on the positive side is understood as an oriented access; two prime ends with the same Euclidean location need not have the same sign. We condition on that side and, when necessary, on the finitely many possible orientations of the incident lattice edge. All statements about boundary samples below are made under this harmonic sampling law. Lemma 59 is needed to exclude additional excursions near the incident strand.

For the global boundary-sampling statements, an experiment means a Dobrushin domain with sign-compatible exterior heights $+ lambda$ and $- lambda$, where $lambda$ is fixed as $n arrow.r oo$. For any finite collection of experiments fix $0 < lambda_0 lt.eq min lambda lt.eq 1 \/ 2$. Constants in estimates whose barriers attach to original boundary may depend on $lambda_0$. The artificial bounded-data conditionings used for local comparison are not additional global experiments to which boundary avoidance is asserted.

Here is the exclusion required before using the interior records of (G7)–(G8). Let $xi_n$ be the walk landing and let $d_n = "dist" \( v_n \, partial D_n \)$ in lattice units. Lemmas 60 and 61 give

#[#set math.equation(numbering: n => "(10.1)")
 $ lim_(eta arrow.b 0) limsup_(n arrow.r oo) bb(P) (xi_n upright(" lies on a strand side") \, med "dist" \( xi_n \, partial D_n union { v_n } \) < eta d_n) = 0 . $ <h:landing-exclusions>]

The boundary estimate is the consequence of exterior-attaching barriers and the independent full-walk exit comparison proved there; it does not use SLE or a matched height gap. Its stronger full-walk form also applies to landings on an arbitrary stopped prefix.

When conditioning on a side or on an incident-edge label, first take a subsequence along which its probability converges. If the limit is zero, its entire contribution to a bounded harmonic test vanishes. Otherwise its probability is bounded below along that subsequence, so dividing (10.1) by that lower bound gives the same exclusion for the conditioned sampling law. There are only finitely many such labels at each stage. This is the only normalization needed to pass the exclusion to the boundary samples used below.

#thm([Lemma 10.1.])[
  (Harmonic sampling in the physical slit).  #emph[Let the original Jordan lattice domains be contained in one fixed bounded set. Let $U_n$ be the component containing an observer $z_n$ after removing a simple dual prefix, or after cutting along a complete simple dual crosscut. Suppose $"dist" \( z_n \, partial U_n \) gt.eq rho > 0$ in physical units. Label its prime-end boundary by the original positive and negative arcs and the two oriented strand sides; empty arcs are allowed. There are at most four cyclic arcs before completion and at most two in a completed component.]
  #emph[Kill triangular-lattice walk on its first visit to the original boundary or to a vertex adjacent to the explored strand. Original boundary values take priority at a vertex of both types. Let $xi_n$ denote this landing with its incident-side label. There is a coupling with Brownian exit $xi_n^(upright(B))$ from $U_n$ such that, for every $a > 0$, 
#[#set math.equation(numbering: n => "(H2)")
 $ sup_(U_n \, z_n) bb(P) { \| xi_n - xi_n^(upright(B)) \| > a upright(" or their labels differ") } arrow.r 0 . $]

 The supremum includes all such prefixes, hence all stopping rules. Repeated Euclidean boundary points are distinguished by their incident accesses.]
] <h:slit-sampling>

#proof[
  We first recall the required deterministic screening argument. For a simply connected polygonal slit $U$, two complementary prime-end arcs, and $R > 0$, let $L_R$ be the union of internal paths of diameter at most $R$ joining those arcs. The frontier of the observer component of $U \\ L_R$ is contained in two balls of radius $2 R$. Indeed, classify a crosscut by which of the two arc endpoints it separates from the observer. Two crosscuts in one class touching the observer component must intersect, and their diameter bound then puts that entire class in one ball. The argument uses prime ends on a slit, not an identification of its two sides. This is the planar argument in [14] equation (3.55). Beurling’s estimate therefore gives
  $ bb(P)_z { upright("Brownian motion enters ") L_R } lt.eq C \( R \/ rho \)^alpha . $
  Apply this to each arc against its complementary arc. For a partition into $m$ cyclic arcs, entrance into the union of short paths joining different labels has probability at most $C m \( R \/ rho \)^alpha$, for a fixed $alpha > 0$.
  The lattice walk has the required physical incidence. Every primal edge crossed by an explored dual edge has both endpoints observed and absorbing. Thus the interpolated walk cannot cross the dual strand before it is killed. An interior killing vertex has a connector of diameter $C \/ n$ through its own dual hexagon to an incident strand edge, on the side bearing its sign. If several strand edges are incident, every such access has that same sign. At original boundary the connector is trivial and the incoming edge specifies its access. Consecutive explored dual edges cross primal edges belonging to a common triangle; their absorbing endpoints form a connected set attached to the original absorbing boundary. This set lies within $C \/ n$ of the physical boundary and reaches across the annuli used below. It supplies the connected obstacle for the discrete Beurling estimate, including at the last explored dual vertex.
  Fix $n^(- 1) lt.double r lt.double R lt.double rho$. Couple the unrestricted interpolated walk, with its diffusive clock, and Brownian motion so that their distance up to a fixed time cutoff is less than $r \/ 4$, except with probability $o_n \( 1 \)$. The ordinary planar invariance principle gives this coupling independently of the slit; the triangular walk is isotropic. Both exit-time tails at the cutoff are bounded by those for a fixed enclosing ball. For each process use its #emph[own] first entrance into the $2 r$ boundary layer. Beurling’s estimate at these two marginal stopping times confines each remaining tail to diameter $R$, except with total probability $C \( \( r + n^(- 1) \) \/ R \)^alpha$. No Markov assertion about the joint coupling filtration is made.
  Let $theta$ be the first time either coupled path is within $r$ of the physical boundary. On successful coupling both paths are still alive, both of their $2 r$ layer times have occurred, and their positions at $theta$ can be joined by a segment inside $U_n$. If the exit labels differ, their confined tails, this segment, and the lattice terminal connector give an internal path of diameter $C R$ joining different labels. The Brownian path has therefore entered the corresponding mixed-access set. The preceding screening bound gives
  #[#set math.equation(numbering: n => "(H3)")
   $ bb(P) { upright("label mismatch or exit distance") > C R } lt.eq o_n \( 1 \) + C \( r \/ R \)^alpha + C m \( R \/ rho \)^alpha + upright("cutoff error") . $]
  Take the time cutoff large, then $R$ small, then $r \/ R$ small, and finally $n$ large. This proves (H2). In particular the proof compares the walk directly with the physical dual slit, not with an unmarked Hausdorff approximation or a thickened domain with possibly many label changes. ◻
]

#thm([Lemma 10.2.])[
  (Marked limits and local access).  #emph[In the setting of Lemma 65, let the observers converge, $z_n arrow.r z$, and take a Hausdorff subsequence of the closed removed sets consisting of the explored slit and the original exterior. Retain the conformal maps from the disk to the observer components, normalized by $f_n \( 0 \) = z_n$ and $f'_n \( 0 \) > 0$, and the inverse images of all boundary-label transition accesses. After a further subsequence on which these marks converge, bounded harmonic functions with the prescribed finite label values converge on compact subsets to the Poisson extension of the limiting marked arc data. Their harmonic boundary samples converge with these marks. At a surviving common local boundary piece of two such domains, the limit preserves the incident-side identification.]
] <h:marked-limits>

#proof[
  The protected observer and the common enclosing ball make the normalized inverse maps a nondegenerate normal family. Kernel convergence identifies their limit with the observer component. Extract also all transition angles on the unit circle, preserving their cyclic order. The associated bounded step functions converge at every angle except the finitely many limiting transitions. Poisson integration proves compact convergence; normalized arclength gives zero mass to those transitions. Colliding transitions merely delete an arc of vanishing harmonic mass. This retains the boundary marks rather than reconstructing them from the limiting closed set.
  For approach samples, use a free Brownian path independent of all domain and field records. At fixed positive distance from the boundary, kernel convergence and compact harmonic convergence give convergence of its smoothed readings. The boundary-layer tail estimate in the preceding proof lets that distance decrease to zero after taking the mesh limit. Equivalently, the normalized conformal maps give the limiting Brownian exit angle.
  Finally suppose the two finite domains and their labels agree on the component of a ball of radius $R$ next to a common oriented strand. Their bounded label-Poisson extensions differ, at a point in the concentric ball of radius $R \/ 2$ and at distance $r lt.double R$ from that strand, by at most $C M \( r \/ R \)^alpha$: the difference is zero on the common local boundary, and Beurling bounds escape from the ball. The same bound holds if the common boundary is an original arc. It is uniform in the domains, so it persists in marked kernel limits. The mixed-access screening in the preceding proof excludes conflating distinct sides in this procedure. This proves the asserted local identification, without claiming continuity of prime-end labels from closed sets alone. ◻
]

For the global experiments, the original domain approximations supply the common bounded enclosure. Before applying these lemmas to complete-strand samples, fix $rho > 0$ below the observer’s original boundary clearance and discard the bounded contribution from configurations whose observer-to-strand distance is less than $rho$ in physical units. Lemma 61 makes this contribution vanish as $rho arrow.b 0$ after the mesh limit. On the retained configurations both lemmas apply with this fixed clearance. For a positive-probability side or orientation branch, divide the discarded probability by its lower bound as above. This localization estimates reading errors under the original sampling law; the lower comparison in (G7) remains on all its admissible records.

For a bounded harmonic limiting profile $m$ and an independent Brownian motion $W$ in its component, $m \( W_t \)$ has an almost sure limit as $W$ approaches its exit. Denote that limit by $Y$. It is a random boundary value, not yet a deterministic height gap. The following elementary lemma specifies the comparison needed to make it deterministic.

#thm([Lemma 10.3.])[
  (A common lower bound for two-scale readings).  #emph[For $1 lt.eq i lt.eq k$, let $U_n^i \, V_n^i$ take values in $\[ - M \, M \]$, with $U_n^i$ measurable with respect to a sigma-field $cal(A)_n^i$. Suppose that 
$ bb(E) \| U_n^i - V_n^i \| arrow.r 0 . $

 Suppose there are probability measures $nu_n$ on $\[ - M \, M \]$, a constant $c > 0$, and events $G_n^i in cal(A)_n^i$ of probability tending to one, such that, on $G_n^i$, 
$ bb(P) \( V_n^i in B divides cal(A)_n^i \) gt.eq c thin nu_n \( B \) quad upright("for every Borel set ") B . $

 Then every subsequence has a further subsequence on which all the $U_n^i \, V_n^i$ converge in probability to the same deterministic constant.]
] <h:common-kernel>

#proof[
  Pass to a subsequence on which $nu_n$ and the laws of all $U_n^i$ converge. Conditional integration gives
  $ bb(E) \| U_n^i - V_n^i \| gt.eq c thin bb(E) [upright(bold(1))_(G_n^i) integral \| U_n^i - y \| thin nu_n \( thin upright(d) y \)] . $
  The lost contribution outside $G_n^i$ is at most $2 M bb(P) \( \( G_n^i \)^c \)$. If $mu_i$ and $nu$ are the limiting laws, bounded continuity yields $integral \| x - y \| thin mu_i \( thin upright(d) x \) nu \( thin upright(d) y \) = 0$. A product of two probability measures supported on the diagonal must consist of the same point mass in each coordinate. The point is common to all $i$ because $nu$ is common. Agreement of the readings completes the proof. ◻
]

The constant $c$ in this lemma need not approach one. It must, however, stay positive as unused scale buffers grow. A different reference law for each external configuration would not provide the stated conclusion.

#thm([Lemma 10.4.])[
  (Locality of bounded conditional means).  #emph[Assume the sequentially uniform comparison and trace estimates of Theorem 15 and Theorem 40, and the local weak equation of Proposition 30. Consider two conditioning systems with uniformly bounded mean profiles and the same lattice domain and original fixed data inside a ball of radius $R$. Suppose they share a connected oriented strand across that ball and all sign observations inside it. For averaged observations at distance of order $r$ from that strand, supported in the concentric ball of radius $R \/ 2$, where $r arrow.r oo$ in lattice units and $r \/ R arrow.r 0$, the two conditional means differ by a quantity tending to zero.]
  #emph[There is also an exterior version. If the two systems agree outside a ball of radius $rho$, their original exterior data agree, and their unchanged strands connect that ball to radius $R$, then at distance of order $r$ from its center, with $rho lt.double r lt.double R$, the limiting mean difference is at most $C M \( rho \/ r \)^(1 \/ 2)$. Here $M$ bounds the individual profiles. In both assertions use translates and dilates of the fixed radial probability kernel from Section 6. A sampling ball centered at $y$ has radius $s$ less than one tenth of both $r$ and the distance from $y$ to the boundary of the common free region. For each fixed $a > 0$, retain $s gt.eq a r$ while taking the mesh limit in coordinates rescaled by $r$; the cutoff may then decrease to zero.]
] <h:locality>

#proof[
  For the first assertion compare the two fields with common reflecting sign walls. On shared strands their limiting mean difference has zero Brownian-tested trace by the comparison and trace estimates. The common original fixed data give zero differences at the corresponding pins, so the same trace argument gives zero trace on the common original boundary pieces. Away from these observed boundaries the difference is harmonic by the weak equation and $A > 0$. Its absolute value on the other boundary pieces is at most $2 M$. The maximum principle therefore bounds it by $2 M$ times the probability of escaping the common ball before hitting the connected common strand. Beurling bounds that probability by $C \( r \/ R \)^(1 \/ 2)$. For arbitrary sequences with $r arrow.r oo$ and $r \/ R arrow.r 0$, rescale by $r$ and first restrict to a common ball of radius $L r$ about a nearest strand point, with $L$ fixed. Centrality puts this ball inside the shared region for all sufficiently large scales. Local $L^1$ compactness transfers its $C M L^(- 1 \/ 2)$ bound to the fixed-cutoff averages. First take the mesh limit, then $L arrow.r oo$, and finally remove the averaging cutoff. Sequential uniformity gives the assertion for every admissible conditioning sequence.
  For the second assertion apply the identical argument in the common exterior region, with the small changed window as the only uncontrolled boundary. The probability of reaching that window from distance $r$ before hitting a connected common arm is at most $C \( rho \/ r \)^(1 \/ 2)$. The bounds persist under averaging in a sufficiently small ball about the observation point. In both assertions the zero trace is a conclusion of the common-wall comparison, not an equality of the sampled wall heights. ◻
]

#thm([Proposition 10.5.])[
  (The two readings required for the height gap).  #emph[Assume the harmonic-mean compactness and common-sign trace comparison of Proposition 30, Theorem 15, and Theorem 40. Assume also the landing exclusions (10.1) and the sampled-configuration estimates of Proposition 58 and Lemma 59. Then, along any joint subsequence of finitely many experiments, the following construction gives the hypotheses of Lemma 67. The limiting variables are the Brownian boundary samples of the conditional mean profiles.]
] <h:readings>

#proof[
  Fix the positive-probability side and orientation branches described above. We construct an inner reading $V_n$ from the incident strand and an outer reading $U_n$ from the external arms. Both approximate the same boundary sample. The comparison of sampled configurations will then bound the conditional law of $V_n$ below by one common reference law, independently of the external record.
  For a target error, first use (10.1) to discard strand landings within distance $eta d_n$ of the original boundary or observer, choosing $eta > 0$ so that their probability is small. Recenter a retained landing at zero. Choose the lattice radii
  #[#set math.equation(numbering: n => "(H1)")
   $ 1 lt.double r_(upright("in")) lt.double R_(upright("core")) lt.double R_(upright("in")) lt.double R_(upright("mid")) lt.double R_(upright("conn")) lt.double r_(upright("out")) lt.double n . $]
  Require also $r_(upright("out")) < eta d_n \/ 20$. Thus the largest disks used by (G7)–(G8), including their factors $6$ and $4$, lie inside the original domain and exclude the observer. Clearance is measurable in the outer record, which includes the domain and observer; retaining it imposes no additional condition on the inner strand. Write $cal(A)_n = sigma \( Phi_(R_(upright("mid"))) \)$ under the specified landing event $Z^sigma$, and let $G_n in cal(A)_n$ be the retained clearance event. The diagonal choices below make $bb(P) \( G_n \) arrow.r 1$.
  #emph[Agreement of complete-profile readings.] First take mesh limits at fixed positive physical approach distances. In each limiting component the bounded harmonic martingale has a boundary limit. Its values at first entrances into balls of radii tending to zero about the eventual landing have that same limit: these entrance times approach the exit time pathwise. They need not be stopping times after the future-dependent center is specified.
  At an interior approach point use a radial smooth average in a ball smaller than one tenth of its distance to the strand and of the approach radius, with the fixed probability kernel defining $P_s$ in Section 6. The limiting harmonic average equals the value at its center. Impose a positive lower cutoff on the averaging radius before taking the mesh limit, then remove it. At each fixed positive physical approach scale the sampling point is interior almost surely, so this cutoff loses arbitrarily little probability. The comparison compactness and the vanishing original–filled $L^1$ error give convergence of the conditional means in $L^1$ on every compact subset of the limiting free regions, on a joint subsequential realization. At a fixed radius cutoff $a > 0$, the sampling supports have distance at least $9 a$ from the strand; the retained landing clearance and (H1) also keep them a fixed positive distance from the original exterior. Hausdorff convergence therefore places all these supports in one compact subset $C_a$ of the limiting free regions. Since the kernels have supremum norm at most $parallel phi parallel_oo a^(- 2)$, the discrepancy of their readings is bounded uniformly by $parallel phi parallel_oo a^(- 2) parallel m_n - m parallel_(L^1 \( C_a \))$, which tends to zero. This transfers both readings to the lattice, including for kernels selected from the records. A diagonal choice of the radii in (H1) therefore makes the readings of the complete profile at $r_(upright("in"))$ and $r_(upright("out"))$ agree in $L^1$. The scales are chosen slowly; no convergence rate is asserted.
  #emph[The reading determined by the inner record.] Retain the incident oriented strand and terminal walk piece in $Theta_(R_(upright("in")))$. Define its canonical mean in the disk of radius $2 R_(upright("in"))$, with zero exterior heights and precisely those oriented strand observations. This conditioning is feasible by assigning sufficiently small signed heights. The construction is the same measurable function of the inner record in every experiment.
  Apply (G8) at $\( R_(upright("core")) \, R_(upright("in")) \)$ and average its conditional bound. Except on an event of vanishing probability under $Z^sigma$, the walk does not leave $R_(upright("in"))$ after its first entrance at $R_(upright("core"))$. Its first entrance at $r_(upright("in"))$ therefore belongs to the recorded terminal piece, and reversing that piece determines the sampling point. Any complete-chord piece in $B \( 0 \, R_(upright("core")) \)$ other than the incident strand $beta_(R_(upright("in")))^sigma$ would give two additional crossings of the same annulus. Outside the same type of exceptional event, the canonical and complete conditionings thus agree throughout $B \( 0 \, R_(upright("core")) \)$.
  Choose the inner radial kernel using the distance to the recorded strand and the cutoff just described. Its canonical mean reading, denoted $V_n$, is determined by $Theta_(R_(upright("in")))$ alone. If this record does not contain the required approach point, or its kernel cutoff fails, set $V_n = 0$. This is the same bounded function of the inner record in every experiment; it does not use $G_n$. Lemma 68, with $r_(upright("in")) \/ R_(upright("core")) arrow.r 0$, makes its difference from the complete-profile inner reading tend to zero. The extra-excursion estimate supplies both the common strand neighborhood and the presence of the chosen approach point in the recorded walk.
  #emph[The reading determined by the outer record.] Retain the external arms and initial walk in $Phi_(R_(upright("mid")))$. Delete every oriented dual-edge observation whose adjacent primal sign pair meets $B \( 0 \, R_(upright("conn")) \)$; retain the remaining external-arm edge observations and both vertices of each pair. Every retained sign vertex still has an oppositely constrained neighbor.
  Apply (G8) at $\( R_(upright("mid")) \, R_(upright("conn")) \)$ and average its bound. Except on an event of vanishing probability under $Z^sigma$, the unrecorded connection of the two external arms stays inside $B \( 0 \, R_(upright("conn")) \)$: the arms already supply two disjoint annular crossings, and an excursion of their connection would supply two more. Hence the modified and complete conditionings agree outside $B \( 0 \, R_(upright("conn")) + C \)$, with an absolute lattice constant $C$. All retained observations are determined by $Phi_(R_(upright("mid")))$. The first walk entrance at $r_(upright("out"))$ is also in that record, since it precedes the first entrance at $R_(upright("mid"))$.
  Use a radial kernel smaller than one tenth of $r_(upright("out"))$ and of the distance to the recorded external strands, with a positive lower cutoff as above. Its support stays outside the changed window. The mean under the modified conditioning, tested with this kernel, is $cal(A)_n$-measurable; denote it by $U_n$. Set $U_n = 0$ when its required outer clearance or kernel cutoff fails. In the common exterior component, limiting mean differences are bounded harmonic functions with zero trace on the unchanged strands and original boundary. The only uncontrolled boundary is the deleted window, where the difference has absolute value at most $2 M$. A connected common arm crosses the intervening annulus. The maximum principle and Beurling’s estimate therefore bound the influence of this window at the sampling ball by
  $ C M \( R_(upright("conn")) \/ r_(upright("out")) \)^(1 \/ 2) . $
  The bounded enlargement by $C$ is negligible at these scales. Sequentially uniform compactness and trace comparison transfer the bound to the lattice with an error tending to zero. Combining the two localizations with complete-profile agreement gives $bb(E) \| U_n - V_n \| arrow.r 0$.
  #emph[One common lower kernel and the order of limits.] For each $n$, fix one admissible reference external record at radius $4 R_(upright("in"))$. Equation (G7) bounds every inner-record law below by $C^(- 1)$ times this reference law, for every admissible external record at that radius in every experiment. Since $R_(upright("mid")) > 4 R_(upright("in"))$, the record at $R_(upright("mid"))$ is a restriction of the record at $4 R_(upright("in"))$. Averaging the bound over the latter conditional on $Phi_(R_(upright("mid"))) \, Z^sigma$ preserves $C^(- 1)$. Push this one reference law through the canonical inner-mean function defining $V_n$ to obtain $nu_n$. Lattice symmetries identify the finite list of landing orientations. The exceptional events used to make the readings agree do not restrict this lower comparison, and no factor is paid for unused annuli.
  Here is the scale order for a finite collection of limiting Brownian boundary readings and a requested error less than $epsilon > 0$. Choose the clearance exclusion before any physical buffers. Choose the outer physical approach scale for both the boundary-reading error and the retained clearance. Next choose $R_(upright("conn")) \/ r_(upright("out"))$ for exterior locality and $R_(upright("mid")) \/ R_(upright("conn"))$ for its excursion error. Choose $R_(upright("in")) lt.double R_(upright("mid"))$, then $R_(upright("core")) \/ R_(upright("in"))$ for the inner excursion error, and finally $r_(upright("in")) \/ R_(upright("core"))$ for inner locality and the inner boundary reading. These choices are in physical units before the mesh limit, so every retained lattice scale diverges. Hold the scales and kernel cutoffs fixed while taking that limit, and then remove the cutoffs. Repeat for $epsilon arrow.b 0$ and take a diagonal subsequence. The comparison constant in (G7) is independent of all these unused buffers. Lemma 67 now applies. ◻
]

#thm([Proposition 10.6.])[
  (Subsequential universal height gap).  #emph[Assume the uniform inputs of Proposition 69 and the trace bounds of Lemmas 51 and 52. Every mesh subsequence has a further subsequence and a deterministic $l in \( 0 \, 1 \/ 2 \]$ such that all terminal conditional mean profiles in any prescribed finite collection of the sign-compatible Dobrushin experiments specified above have Brownian boundary trace $+ l$ on a positive strand side and $- l$ on a negative strand side.]
] <h:height-gap>

#proof[
  Include a fixed reference Dobrushin experiment with original boundary heights $plus.minus 1 \/ 2$. The barrier estimate gives nonzero harmonic mass to its path sides. Compactness supplies joint mean profiles and harmonic samples. Proposition 69 and Lemma 67 make the sampled positive boundary value a single deterministic constant, shared by all included experiments. The reference experiment’s positive lower trace bound gives $l > 0$, and its complete-crosscut comparison gives $l lt.eq 1 \/ 2$. Sign reflection identifies the negative value as $- l$.
  Apply this argument to a countable collection of interior balls, with a diagonal subsequence. If a terminal profile had a set of incorrect boundary values of positive harmonic measure from any ball in that collection, its sampled boundary value would have positive probability of differing from $l$. Thus the statement holds almost surely in every component seen from that exhaustion. Original boundary arcs retain their prescribed values by the boundary comparison, rather than by the height-gap argument. ◻
]

=== 10.2 Passing to a stopped strand <passing-to-a-stopped-strand>

For an independent walk from $z$, let $mu_(n \, T)^z$ be harmonic measure on the boundary of the component of $D_n \\ gamma_n \[ 0 \, T \]$ containing $z$. The nonreturn input needed here is the following consequence of Proposition 63: for each compact set of protected observers,

#[#set math.equation(numbering: n => "(10.2)")
 $ lim_(s arrow.b 0) limsup_(n arrow.r oo) sup_T bb(E) integral_(gamma_n \[ 0 \, T \]) upright(bold(1))_({ "dist" \( x \, gamma_n \( T \, upright("end") \] \) < s }) thin mu_(n \, T)^z \( thin upright(d) x \) = 0 . $ <h:nr>]

This is an annealed harmonic-mass estimate, uniformly in the stopping rule. It does not assert that every realized stopped prefix has a small conditional return probability.

#thm([Proposition 10.7.])[
  (Stopped harmonic observable).  #emph[Fix a subsequence furnished by Proposition 70 and its deterministic height gap $l$. In this proposition $n$ tends to infinity only along that subsequence. Assume (10.2), the survival bound of Lemma 62, and the sequentially uniform field comparisons. Harmonic sampling and boundary marks are as in Lemmas 65 and 66. Let $H_(n \, T)^l$ be the continuum harmonic function in the stopped physical domain with the original exterior values and values $+ l \, - l$ on the new sides. For every deterministic smooth test $f$ supported in a protected interior ball, 
#[#set math.equation(numbering: n => "(10.3)")
 $ sup_T bb(E) lr(|M_T^n \( f \) - integral f \( z \) H_(n \, T)^l \( z \) thin upright(d) z|) arrow.r 0 . $ <h:stopped-observable>]

 The supremum is over stopping rules before a fixed neighborhood of that ball is reached, and the assertion holds in either direction of exploration.]
] <h:stopped>

#proof[
  It suffices to treat an arbitrary sequence $T_n$, since failure of the supremum would select a counterexample sequence. Use one independent full walk $S$. Write $xi$ for its old-prefix landing, $upsilon$ for its completed-strand landing, and set
  $ cal(G)_n = sigma \( gamma_n \[ 0 \, T_n \] \, S \) \, #h(2em) A_n = { xi = upsilon } \, #h(2em) q_n = bb(P) \( A_n divides cal(G)_n \) . $
  For any $cal(G)_n$-measurable $Z_n in \[ 0 \, 2 M \]$,
  #[#set math.equation(numbering: n => "(10.4)")
   $ bb(E) Z_n lt.eq 2 M bb(P) \( q_n < p \) + p^(- 1) bb(E) \[ Z_n upright(bold(1))_(A_n) \] . $ <h:reweight>]
  Indeed, on ${ q_n gt.eq p }$ integrate the identity $bb(E) \[ Z_n upright(bold(1))_(A_n) divides cal(G)_n \] = Z_n q_n$. Lemma 62 makes the first term arbitrarily small with a fixed $p > 0$, uniformly in $T_n$. This is the required change of sampling law; mere absolute continuity is not used.
  At physical radius $r$ let $V_(n \, r)^(upright("old"))$ be a small radial average of the stopped conditional mean at the first walk entrance into $B \( xi \, r \)$. Its averaging radius is less than one tenth of the distance to the observed strand and one tenth of $r$. Define $V_(n \, r)^(upright("end"))$ in the same way with the complete strand and $upsilon$. Positive cutoffs on the averaging radius are removed after the mesh limit, as in Proposition 69. Let $b \( xi \)$ be $+ l$ or $- l$ according to the old oriented side, and put
  $ Z_n = \| V_(n \, r)^(upright("old")) - b \( xi \) \| upright(bold(1))_({ xi in.not partial D_n }) . $
  This is measurable with respect to $cal(G)_n$. By Proposition 70 and Lemmas 65–66,
  #[#set math.equation(numbering: n => "(H4)")
   $ lim_(r arrow.b 0) limsup_n bb(E) #h(-0.16667em) [\| V_(n \, r)^(upright("end")) - b \( upsilon \) \| upright(bold(1))_({ upsilon in.not partial D_n })] = 0 . $]
  This is the bounded harmonic martingale boundary limit in the completed component, sampled by the lattice walk through (H2). First discard arbitrarily small completed-observer clearances using Lemma 61; (H2) then applies with a fixed protected observer. The first entrance around its eventual landing need not itself be a stopping time: these approach points tend to the exit pathwise, which is all that this boundary-limit assertion uses.
  Discard old-side landings within distance $2 R$ of the original boundary and those within distance $2 R$ of the future strand. Their total probability, denoted $e_n \( R \)$, satisfies $lim_(R arrow.b 0) limsup_n e_n \( R \) = 0$ by (10.1) and (10.2). On the remaining event, and on $A_n$, the two readings use the same walk segment, the same label, and the same averaging kernel when $r < R \/ 10$. The prefix extends across this common ball: its starting point is on the distant original boundary and its tip belongs to the distant future, or to the original boundary if exploration is complete. The stopped and completed conditionings have exactly the same sign observations there. Lemma 68 therefore bounds their mean difference by $C M \( r \/ R \)^alpha + o_n \( 1 \)$ at fixed $r \, R$. Consequently
  #[#set math.equation(numbering: n => "(H5)")
   $ bb(E) \[ Z_n upright(bold(1))_(A_n) \] lt.eq bb(E) #h(-0.16667em) [\| V_(n \, r)^(upright("end")) - b \( upsilon \) \| upright(bold(1))_({ upsilon in.not partial D_n })] + C M \( r \/ R \)^alpha + 2 M e_n \( R \) + o_n \( 1 \) . $]
  First choose the survival error in (10.4), obtaining $p > 0$. Choose $R$ so that the discarded mass is small compared with $p$ times the desired final error. Then choose $r lt.double R$ to make both (H4) and the locality error equally small. Keep these physical scales and the kernel cutoffs fixed while taking $n arrow.r oo$. This order proves that the old-side boundary reading equals its prescribed label in $L^1$, uniformly in the chosen sequence of stopping rules.
  Original boundary accesses retain their original values. For clarity, the argument proving (GB2)–(GB3) also yields
  #[#set math.equation(numbering: n => "(H6)")
   $ lim_(R arrow.b 0) limsup_n bb(P) { d_(D_n) \( S_(tau_(D_n)) \, gamma_n \) < R } = 0 $]
  in physical units: condition on the independent original-boundary exit, apply pure-arc repulsion away from the opposite arc, and use the two-ball bound at the two sign-change accesses. On the complementary event the final approach has a neighborhood, in its original-domain component, free of the completed strand. The original-boundary comparison gives the prescribed trace there. The pathwise coupling used for (H2), including confinement of the terminal tails, transfers this internal-access assertion to Brownian motion. Thus (H6) applies also on the event that the old landing lies on the original boundary. No boundary avoidance deduced from SLE is used.
  Finally extract jointly the stopped closed sets, bounded conditional profiles, normalized conformal maps, and their boundary marks. The limiting stopped profile is harmonic by the weak equation. The preceding readings give its boundary values at Brownian-almost every marked access. Bounded harmonic uniqueness and Lemma 66 identify this profile with the limit of $H_(n \, T_n)^l$. The comparison compactness and original–filled $L^1$ estimate give convergence of the lattice conditional means against the fixed smooth test $f$. The harmonic functions $H_(n \, T_n)^l$ converge uniformly on its protected support. Integration against $f$ and boundedness therefore prove (10.3). Proposition 2 supplies the moments of the underlying field averages if those averages are retained in the joint limit.
  Reverse exploration reveals the same kind of sign prefixes and satisfies the same comparisons and nonreturn estimate. Repeating the proof gives the reverse assertion. ◻
]

#prodef([Remark 10.8.])[
  (No transfer from absolute continuity alone).  A sequence of equivalent measures can give vanishing mass to a set whose mass stays positive under another access law. For example, on $\[ 0 \, 1 \]$ let $nu$ be Lebesgue measure and give $mu_n$ density $2 \/ n$ on $\[ 0 \, 1 \/ 2 \]$ and $2 \( 1 - 1 \/ n \)$ on its complement. Then $mu_n \( \[ 0 \, 1 \/ 2 \] \) arrow.r 0$ while $nu \( \[ 0 \, 1 \/ 2 \] \) = 1 \/ 2$. The survival reweighting and nonreturn estimate supply the uniform local transfer in the preceding proof. The exact tower identity for conditional means does not replace either estimate.
]

=== 10.3 Driving convergence and the uniform curve metric <driving-convergence-and-the-uniform-curve-metric>

First obtain the deterministic $l$ on a subsequence using the reference experiment with exterior heights $plus.minus 1 \/ 2$. Now add the experiment with exterior heights $plus.minus l$ and apply Proposition 70 to these two experiments on that subsequence. Any further extracted height gap must still equal $l$, since the reference readings already converge to $l$. This yields the stopped observable for the matched experiment without assuming its existence before $l$ was fixed.

On this height-gap subsequence we use original boundary heights $plus.minus l$, matching the value on the new sides. Map the marked domain to the upper half-plane, with the starting point at zero and the target at infinity. If $g_t$ is its capacity-parametrized Loewner map and $U_t$ its driver, the harmonic observable is, with a fixed choice of side orientation,

#[#set math.equation(numbering: n => "(10.5)")
 $ H_t^l \( z \) = l - frac(2 l, pi) arg \( g_t \( z \) - U_t \) . $ <h:angle>]

There is no boundary force-point term because the old and new heights match.

#thm([Lemma 10.9.])[
  (The observable input for driving convergence).  #emph[For simple lattice crosscuts in marked Jordan domains, suppose that the exact conditional-mean martingales of deterministic protected interior averages satisfy (10.3), uniformly over the stopping rules of the driving argument, with matched exterior heights $plus.minus l$, where $l > 0$. Suppose the comparison is to the continuum slit-domain function (10.5). Then the forward chordal drivers converge, locally uniformly in capacity time in law, to $2 B$.]
] <h:driving>

#proof[
  We specify which part of the harmonic-observable criterion is used. Let $x_t < y_t$ be the two images of the starting point under $g_t$. For $t > 0$ introduce the bounded-driver coordinates
  $ s = log \( y_t - x_t \) \, #h(2em) G_s \( z \) = frac(2 g_t \( z \) - x_t - y_t, y_t - x_t) \, #h(2em) tilde(U)_s = frac(2 U_t - x_t - y_t, y_t - x_t) in \[ - 1 \, 1 \] . $
  Let $cal(F)_s$ be the sign-prefix filtration at the corresponding time, equivalently the filtration of the explored dual curve after this deterministic coordinate change. In these coordinates, as in [14] Sections 4.2–4.5, fix a finite interval $\[ - S \, S \]$ and the two deterministic interior probes protected throughout that interval. Replace each point probe by a radial smooth average in a sufficiently small protected disk. The harmonic mean-value property makes the average of the continuum observable equal to its value at the center. Thus (10.3) supplies the same two approximate martingales as the point probes.
  For stopping times $s_0 lt.eq s_1$ with $s_1 - s_0 lt.eq epsilon^2$ and driver oscillation at most $epsilon$, the two-probe Taylor calculation gives, outside an event of arbitrarily small prescribed probability,
  #[#set math.equation(numbering: n => "(10.6)")
   $ lr(|bb(E) \[ Delta tilde(U) + 2 tilde(U)_(s_0) Delta s divides cal(F)_(s_0) \]|) & lt.eq C_S epsilon^3 \,\
lr(|bb(E) \[ \( Delta tilde(U) \)^2 - 2 \( 1 - tilde(U)_(s_0)^(thin 2) \) Delta s divides cal(F)_(s_0) \]|) & lt.eq C_S epsilon^3 . $ <h:driver-first>]
  Here $Delta s = s_1 - s_0$ and $Delta tilde(U) = tilde(U)_(s_1) - tilde(U)_(s_0)$. To obtain these estimates from qualitative convergence, fix $S \, epsilon$ and the exceptional probability first, and only then take the mesh sufficiently fine. Conditional Markov inequality converts the $L^1$ observable errors into the needed conditional errors. No predetermined rate is required.
  To apply the approximate-diffusion criterion, start the comparison diffusion at the same bounded-driver value as the discrete process. For a fixed comparison horizon $S$, choose the exceptional tolerance $eta < delta^5 \/ S^2$, where $delta$ is the criterion’s approximation parameter, before choosing the mesh; Proposition 4.5 of [14] then gives its comparison on $\[ 0 \, S - 1 \]$. For a limiting window $\[ - S \, S \]$, start instead at $- S'$ and let $S' arrow.r oo$ after the mesh limit. The coupling argument in the proof of Theorem 4.1 of [14], pp. 115–116, removes the initial value and identifies the stationary whole-line bounded-coordinate diffusion. Thus an arbitrary initial Jacobi law is not substituted for the chordal limit.
  The deterministic Taylor argument and the approximate-diffusion argument of [14] Propositions 4.2 and 4.5 use precisely these martingale and harmonic-observable inputs; no Gaussian conditional law enters these steps. They identify the bounded-coordinate diffusion with squared diffusion coefficient $2 \( 1 - u^2 \)$ and drift $- 2 u$. The inverse coordinate change [14] Section 4.6 gives the chordal driver $2 B$. The discrete harmonic-measure comparison in that source is replaced here by the explicit continuum comparison assumed in (10.3). ◻
]

For completeness, the normalization of this identification can also be seen directly in any continuous Loewner subsequential limit. If the angle at one protected point is a continuous martingale, the identity

$ U_t = "Re" g_t \( z \) - "Im" g_t \( z \) cot arg \( g_t \( z \) - U_t \) $

makes the driver a semimartingale after localization. Writing $U = V + N$, where $V$ has finite variation and $N$ is a continuous local martingale, and $Z_t = g_t \( z \) - U_t$, Itô’s formula gives the finite-variation part of its angle as

$ - "Im" \( Z_t^(- 1) \) thin upright(d) V_t + "Im" \( Z_t^(- 2) \) (2 thin upright(d) t - 1 / 2 thin upright(d) \[ N \]_t) . $

Two protected points with different $"Re" \( Z_t^(- 1) \)$ force $thin upright(d) V_t = 0$ and $thin upright(d) \[ N \]_t = 4 thin upright(d) t$. A dense set of probes provides such a pair locally. Lévy’s characterization then gives $U = 2 B$. This calculation identifies a continuous limit; the approximate-diffusion argument is still needed to obtain driving tightness.

#thm([Proposition 10.10.])[
  (Uniform convergence of the whole curve).  #emph[If the hypotheses of Lemma 73 hold for both exploration directions, the interfaces converge to chordal $upright("SLE")_4$ in uniform Euclidean distance modulo increasing reparametrization.]
] <h:uniform-path>

#proof[
  The dual interfaces are simple crosscuts and are continuously driven in each direction. Forward and reverse driving convergence follows from Lemma 73. Corollary 1.8 of [17] applies to these two separate convergence-in-law statements for $kappa lt.eq 4$; it does not require a previously constructed joint limit of the two drivers. Its conclusion is convergence of the entire curve, including its endpoints, in the uniform curve metric on the compactified reference domain.
  Uniform convergence of the marked Jordan boundary parametrizations to the smooth limit boundary gives uniform convergence of the normalized inverse conformal maps on the closed reference disk by Radó’s theorem [11] Section 1, p. 182. One way to see the boundary part is to use uniform local connectivity of these parametrized Jordan boundaries to turn small reference crosscuts into uniformly small physical crosscuts; interior convergence is the kernel theorem. Thus uniform curve convergence transfers to Euclidean distance in $D$. If the meaning of boundary convergence were weakened to kernel convergence alone, this last inference would need an additional hypothesis.
  In every traversed triangular face, the affine zero segment and the corresponding ordered dual strand stay within $C \/ n$ of each other. Their order agrees, so an increasing reparametrization gives the same $C \/ n$ bound for the complete curves. Hence the choice of polygonal representative does not alter the conclusion. ◻
]

=== 10.4 The variance normalization <the-variance-normalization>

The height-gap argument so far allows $l$ to depend on the extracted subsequence. The conditional covariance identifies it.

#thm([Proposition 10.11.])[
  (Identification of the gap).  #emph[Assume the joint conclusions of Proposition 71, Theorem 42, and the field limit Theorem 32, with the uniform moments needed to pass conditional second moments. Then every subsequential height gap satisfies 
$ l^2 = frac(pi sigma^2, 8) . $

]
] <h:normalization>

#proof[
  Use the experiment with original heights $plus.minus l$, whose interface limit is $upright("SLE")_4$ by the preceding propositions. Stop before compact smooth tests approach the curve. The conditional means are the corresponding harmonic observables, while their conditional covariance is $sigma^2$ times the Dirichlet Green kernel of the remaining domain. The sequential uniformity of Theorem 42 is used to apply it to the actual random stopped strings. The moments from Proposition 2 justify convergence of the averaged conditional variances.
  In the half-plane set $Z_t \( z \) = g_t \( z \) - 2 B_t$. Itô’s formula yields
  $ thin upright(d) log Z_t \( z \) = - frac(2, Z_t \( z \)) thin upright(d) B_t . $
  The cross variation of the harmonic observables is therefore
  #[#set math.equation(numbering: n => "(10.7)")
   $ frac(16 l^2, pi^2) "Im" frac(1, Z_t \( z \)) "Im" frac(1, Z_t \( w \)) thin upright(d) t . $ <h:mean-bracket>]
  For covariance $\( - Delta \)^(- 1)$ the half-plane Green function is
  $ G_(bb(H)) \( z \, w \) = frac(1, 2 pi) log lr(|frac(z - overline(w), z - w)|) . $
  Differentiating its conformal pullback gives
  #[#set math.equation(numbering: n => "(10.8)")
   $ - partial_t G_(D_t) \( z \, w \) = 2 / pi "Im" frac(1, Z_t \( z \)) "Im" frac(1, Z_t \( w \)) . $ <h:green-loss>]
  These normalizations and the observable-bracket/Green-loss comparison agree with [15] preprint version, Lemmas 2.5–2.6, equations (2.3)–(2.4). Only this calculation is used; the stronger conditional coupling in that work is not an input.
  Integrate both identities against a nonzero nonnegative smooth test $f$ twice. No pointwise value of the limiting field is used. The law of total variance equates the gained variance of the conditional-mean martingale with the expected loss of the residual Green variance. For a nonzero localized time interval this gives
  $ frac(16 l^2, pi^2) thin bb(E) integral (integral f \( z \) "Im" \( 1 \/ Z_t \( z \) \) thin upright(d) z)^2 thin upright(d) t = frac(2 sigma^2, pi) thin bb(E) integral (integral f \( z \) "Im" \( 1 \/ Z_t \( z \) \) thin upright(d) z)^2 thin upright(d) t . $
  The common factor is finite and strictly positive. Cancelling it proves the formula. ◻
]

#thm([Corollary 10.12.])[
  (Universality).  #emph[For the model of Section 1, the constant 
$ lambda_(*) = sigma sqrt(pi \/ 8) $

 belongs to $\( 0 \, 1 \/ 2 \]$, is independent of the marked domain, and gives the curve conclusion of Theorem 1. The field stiffness is $v A = sigma^(- 2)$, and its limiting mean is the harmonic extension of the prescribed exterior values.]
] <h:assembly>

#proof[
  Apply the reference height-gap extraction to every subsequence. Proposition 75 gives the same value $lambda_(*)$ on each extraction; its membership in $\( 0 \, 1 \/ 2 \]$ comes from the reference complete-crosscut bounds. Include, in each finite comparison, the fixed experiment with exterior heights $plus.minus lambda_(*)$. Every subsequence then has a further subsequence to which the driving and uniform-path conclusions apply with the same matched value. This proves full convergence. The field assertions are the identifications in Theorem 32 and Proposition 31. ◻
]

== 11 Proof of the Main Theorem <sec:assembly>

#proof[
  The ordinary fixed-boundary domains satisfy the hypotheses of Proposition 2, Theorem 15, and Lemma 21. Proposition 31 therefore defines a positive, domain-independent scalar $A$, identifies the mean, and supplies the small-tilt response. Theorem 32 gives the distributional field limit with $sigma^2 = \( v A \)^(- 1)$.
  All interface observations used here are dual sign prefixes, complete crosscuts, or the explicitly separated inner and outer records. Field estimates are applied to their sign-conditioned kernels before the harmonic-landing reweighting. The prefix and crosscut kernels used for conditional covariance satisfy the connected-set thickness condition of Theorem 42. Local barrier estimates use Corollary 46, with the endpoint-window condition checked in Proposition 54, including for the two-sided records. Extra exact values occur only in the annealed comparison experiments of Lemma 16. Thus no uniform quenched assertion about arbitrary frozen values is needed.
  Propositions 58 and 63, together with Lemma 62, give the two-scale and stopped sampling estimates. Lemmas 65 and 66 retain the oriented harmonic accesses. The resulting height gap and stopped observable are Propositions 70 and 71. In each finite collection of experiments the positive exterior heights have a positive lower bound, as required by the exterior barriers.
  The reference-first extraction in Section 10 then permits matching the exterior height to the extracted gap. Forward and reverse driving convergence and the strong-path criterion give the stated uniform curve limit. Proposition 75 identifies every extracted gap as $sigma sqrt(pi \/ 8)$; Corollary 76 removes the subsequences and places this constant in $\( 0 \, 1 \/ 2 \]$. This proves all assertions, including (1.2) and (1.2). ◻
]

#heading(level: 1)[References]
#bibitem([1])[R. F. Bass and P. Hsu, #emph[The semimartingale structure of reflecting Brownian motion], Proceedings of the American Mathematical Society #strong[108] (1990), 1007--1010, Theorem 1.]
#bibitem([2])[S. Buchholz, C. Cotar and F. Schweiger, #emph[Gradient Gibbs measures with non-convex potentials and the universality class of the Gaussian Free Field], arXiv:2608.14526v1 (2026). #link("https://arxiv.org/abs/2608.14526v1").]
#bibitem([3])[O. Cohen-Alloro and R. Peled, #emph[Rarity of extremal edges in random surfaces and other theoretical applications of cluster algorithms], Annals of Applied Probability #strong[30] (2020), 2439--2464. Theorem~1.1 in arXiv:1711.00259v2. #link("https://doi.org/10.1214/20-AAP1562"). #link("https://arxiv.org/abs/1711.00259v2").]
#bibitem([4])[G. Giacomin, S. Olla and H. Spohn, #emph[Equilibrium fluctuations for $nabla phi$ interface model], Annals of Probability #strong[29] (2001), 1138--1172. #link("https://doi.org/10.1214/aop/1015345600").]
#bibitem([5])[T. J. Lyons and W. Zheng, #emph[A crossing estimate for the canonical process on a Dirichlet space and a tightness result], Asterisque #strong[157--158] (1988), 249--271, Section 1, equations (1.2)--(1.5). #link("https://www.numdam.org/item/AST_1988__157-158__249_0.pdf").]
#bibitem([6])[J. Miller, #emph[Universality for SLE(4)], arXiv:1010.1356v1 (2010). #link("https://arxiv.org/abs/1010.1356v1").]
#bibitem([7])[J. Miller, #emph[Fluctuations for the Ginzburg--Landau $nabla phi.alt$ interface model on a bounded domain], Communications in Mathematical Physics #strong[308] (2011), 591--639. #link("https://doi.org/10.1007/s00220-011-1315-9"). #link("https://arxiv.org/abs/1002.0381v2").]
#bibitem([8])[P. Miłoś and R. Peled, #emph[Delocalization of two-dimensional random surfaces with hard-core constraints], Communications in Mathematical Physics #strong[340] (2015), 1--46. #link("https://doi.org/10.1007/s00220-015-2419-4"). #link("https://arxiv.org/abs/1404.5895v3").]
#bibitem([9])[A. Naddaf and T. Spencer, #emph[On homogenization and scaling limit of some gradient perturbations of a massless free field], Communications in Mathematical Physics #strong[183] (1997), 55--84. #link("https://doi.org/10.1007/BF02509796").]
#bibitem([10])[A. Prékopa, #emph[On logarithmic concave measures and functions], Acta Scientiarum Mathematicarum (Szeged) #strong[34] (1973), 335--343, Theorems 3 and 6. #link("https://acta.bibl.u-szeged.hu/14411/1/math_034_335-343.pdf").]
#bibitem([11])[T. Radó, #emph[Sur la représentation conforme de domaines variables], Acta Scientiarum Mathematicarum (Szeged) #strong[1] (1923), 180--186, Section~1, theorem on p.~182. #link("https://acta.bibl.u-szeged.hu/13291/").]
#bibitem([12])[T. Richthammer, #emph[Translation-invariance of two-dimensional Gibbsian point processes], Communications in Mathematical Physics #strong[274] (2007), 81--122. #link("https://doi.org/10.1007/s00220-007-0274-7"). #link("https://arxiv.org/abs/0706.3637v1").]
#bibitem([13])[O. Schramm, #emph[Conformally invariant scaling limits (an overview and a collection of problems)], International Congress of Mathematicians, Vol. I, European Mathematical Society (2007), 513--543, Problem~2.3, p.~528. #link("https://doi.org/10.4171/022-1/20"). #link("https://arxiv.org/abs/math/0602151").]
#bibitem([14])[O. Schramm and S. Sheffield, #emph[Contour lines of the two-dimensional discrete Gaussian free field], Acta Mathematica #strong[202] (2009), 21--137. Detailed locators refer to arXiv:math/0605337v3 (2008). #link("https://doi.org/10.1007/s11511-009-0034-y"). #link("https://arxiv.org/abs/math/0605337v3").]
#bibitem([15])[O. Schramm and S. Sheffield, #emph[A contour line of the continuum Gaussian free field], Probability Theory and Related Fields #strong[157] (2013), 47--80. #link("https://doi.org/10.1007/s00440-012-0449-9"). #link("https://arxiv.org/abs/1008.2447v1").]
#bibitem([16])[S. Sheffield, #emph[Random surfaces], Astérisque #strong[304] (2005), vi+175 pp. #link("https://numdam.org/item/AST_2005__304__R1_0/").]
#bibitem([17])[S. Sheffield and N. Sun, #emph[Strong path convergence from Loewner driving function convergence], Annals of Probability #strong[40] (2012), 578--610. #link("https://doi.org/10.1214/10-AOP627"). #link("https://arxiv.org/abs/1003.4675v2").]
#bibitem([18])[L. Słomiński, #emph[On existence, uniqueness and stability of solutions of multidimensional SDE's with reflecting boundary conditions], Annales de l'Institut Henri Poincare, Probabilites et Statistiques #strong[29] (1993), 163--198, Section 2, Corollaries 3--4. #link("https://www.numdam.org/item/AIHPB_1993__29_2_163_0.pdf").]


