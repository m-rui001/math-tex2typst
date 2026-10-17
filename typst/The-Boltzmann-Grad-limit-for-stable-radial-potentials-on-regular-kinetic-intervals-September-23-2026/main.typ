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

#align(center)[#text(size: 16pt, weight: "bold")[The Boltzmann--Grad limit for stable radial potentials \
on regular kinetic intervals]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Boltzmann–Grad limit describes a gas whose interaction range tends to zero while the collision frequency remains of order one. In three dimensions the activity is $mu_epsilon = epsilon^(- 2)$. The microscopic dynamics is Newtonian, whereas the limiting collision operator is determined by the actual two-body scattering of the pair potential. We prove this limit for stable finite-range radial potentials on every finite interval where the Boltzmann solution has the regularity and Gaussian bound specified below.

Write $z = \( x \, v \) in bb(R)^3 times bb(R)^3$. For a phase-space function $h$ and $gamma > 0$, write

#[#set math.equation(numbering: n => "(1.1)")
 $ parallel h parallel_(upright("Bol") \, gamma) := sum_(k in bb(Z)^3) #h(0.27778em) sup_(\| x - k \| lt.eq 1\
v in bb(R)^3) e^(gamma \| v \|^2) \| h \( x \, v \) \| . $ <intro:norm>]

For a vector-valued function we use its Euclidean length inside this definition. The precise potential class, grand-canonical law, Newton equations, and scattering operator are given in Assumption 1 and Equations (2.6), (2.2), and (2.16). In brief, the potential is radial, vanishes beyond unit distance, and is $C^2$, with either a finite value or a repulsive singularity at the origin. Its only sign condition is thermodynamic stability, in the classical sense of #cite(label("Ruelle69")). The initial law is the product activity $f_0$ conditioned by pairwise exclusion at distance $epsilon$, with its exact grand-canonical normalization. For each fixed integer $s gt.eq 1$, the scaled factorial density $F_s^epsilon \( t \)$ is characterized by

#[#set math.equation(numbering: n => "(1.2)")
 $ integral a \( Z_s \) F_s^epsilon \( t \, Z_s \) thin d Z_s = mu_epsilon^(- s) bb(E) sum_(1 lt.eq i_1 \, dots.h \, i_s lt.eq N\
i_1 \, dots.h \, i_s med upright("distinct")) a \( z_(i_1) \( t \) \, dots.h \, z_(i_s) \( t \) \) $ <intro:factorial-test>]

for bounded measurable tests $a$ on $\( bb(R)^3 times bb(R)^3 \)^s$. The sum runs over ordered distinct labels and is zero when $N < s$; $Z_s = \( z_1 \, dots.h \, z_s \)$ denotes an ordered phase-space configuration.

#thm([Theorem 1.])[
  (Regular-lifespan kinetic limit).  #emph[Let $Phi$ satisfy Assumption 1, and let $beta > 0$. Let $f_0 gt.eq 0$ be a $C^1$ probability density on $bb(R)^3 times bb(R)^3$ such that 
#[#set math.equation(numbering: n => "(1.3)")
 $ parallel f_0 parallel_(upright("Bol") \, 2 beta) + parallel nabla_x f_0 parallel_(upright("Bol") \, 2 beta) < oo . $ <intro:data-bound>]

 Fix $0 < T < oo$ for which the equation 
#[#set math.equation(numbering: n => "(1.4)")
 $ \( partial_t + v dot.op nabla_x \) f = Q_Phi \( f \, f \) \, #h(2em) f \|_(t = 0) = f_0 \, $ <intro:boltzmann>]

 has a nonnegative classical probability-density solution satisfying 
#[#set math.equation(numbering: n => "(1.5)")
 $ sup_(0 lt.eq t lt.eq T) sup_(x \, v) e^(2 beta \| v \|^2) f \( t \, x \, v \) < oo . $ <intro:solution-bound>]

 Start the exact Newtonian process from the grand-canonical law (2.6). For its scaled factorial densities $F_s^epsilon$, defined in (2.7), every fixed integer $s gt.eq 1$ satisfies 
#[#set math.equation(numbering: n => "(1.6)")
 $ lim_(epsilon arrow.b 0) #h(0.27778em) sup_(0 lt.eq t lt.eq T) parallel F_s^epsilon \( t \) - f \( t \)^(⊗ s) #scale(x: 120%, y: 120%)[parallel]_(L^1 \( \( bb(R)^3 times bb(R)^3 \)^s \)) = 0 . $ <intro:chaos>]

]
] <thm:main>

The potential and $T$ are fixed independently of $epsilon$. The convergence modulus may depend on the potential and on the bounds in (1.3)–(1.5). Attractive wells, long scattering delays, and noninjective scattering maps are permitted. The exclusion belongs solely to the initial law. The Newtonian evolution retains simultaneous interactions, recollisions, and any clusters it creates.

#thm([Corollary 2.])[
  (Empirical observables).  #emph[Under the hypotheses of Theorem 1, let $a in C_c^oo \( bb(R)^3 times bb(R)^3 \; bb(R) \)$ and $eta > 0$. Then 
#[#set math.equation(numbering: n => "(1.7)")
 $ lim_(epsilon arrow.b 0) #h(0.27778em) sup_(0 lt.eq t lt.eq T) bb(P) #h(-0.16667em) (lr(|mu_epsilon^(- 1) sum_(i = 1)^N a \( z_i \( t \) \) - integral a \( z \) f \( t \, z \) thin d z|) > eta) = 0 . $ <intro:empirical>]

]
] <cor:empirical>

The supremum in (1.7) is over deterministic observation times. The conclusion follows from the first two factorial marginals and conservation of particle number; see Section 7.

=== 1.1 History and scope <history-and-scope>

The Boltzmann–Grad scaling goes back to Grad #cite(label("Grad49")) #cite(label("Grad58")). Lanford established the hard-sphere limit on a short time interval #cite(label("Lanford75")), and King’s thesis treated positive finite-range potentials #cite(label("King75")). Gallagher, Saint-Raymond, and Texier gave a detailed geometric analysis of recollisions for hard spheres and a class of repulsive potentials, including a convergence rate in the hard-sphere case #cite(label("GST14")). Pulvirenti, Saffirio, and Simonella proved a short-time theorem for the stable radial class used here; see their Section 8, Hypothesis 1$'$ and Theorem 1$'$ #cite(label("PSS14")). Their treatment permits attractive parts and does not require a globally single-valued differential cross-section.

The time restriction in a collision-tree expansion reflects the growth of correlated histories. Global-time results were obtained for sufficiently rare, spatially dispersive gases in vacuum by Illner and Pulvirenti #cite(label("IllnerPulvirenti86")) #cite(label("Pulvirenti87")) #cite(label("IllnerPulvirenti89")); the last reference corrects and improves the earlier results. For general data, extending a short-time limit requires control of the correlations already present at the next starting time. Pulvirenti and Simonella quantified the correlation errors remaining after independent factors are removed #cite(label("PulvirentiSimonella2017")). Bodineau, Gallagher, Saint-Raymond, and Simonella developed a cluster expansion directly on physical trajectories #cite(label("BGSSCluster2022")), distinguishing genuine collisions from geometric overlaps between independently evolved components.

Deng, Hani, and Ma proved the hard-sphere limit throughout every regular finite kinetic interval #cite(label("DHM25")) Theorem 1. Their layered expansion retains the earlier histories of correlated remainders while extracting the factors approximated by the kinetic solution. This strategy has an antecedent in the long-time wave-kinetic work of Deng and Hani #cite(label("DengHani2024")). The exposition #cite(label("BGSS26")) explains both the accumulated correlations and the loss of topology that prevent restarting a short-time chaos theorem as a black box.

Smooth potentials require additional control because encounters last for positive time and several particles can interact simultaneously. Deng, Hani, and Ma discuss this extension as a further problem in #cite(label("DHM25")) Section 1.4.2. The present whole-component expansion retains the potential energy of these interactions. Its stability and causal exposure estimates are proved below; they are not supplied by the hard-sphere convergence theorem. Similarly, the assumed classical kinetic solution is an input to the theorem, while its additional spatial envelopes are derived in Section 2 by adapting the argument of #cite(label("DHM25")) Proposition A.1.

Theorem 1 proves the regular-lifespan Boltzmann–Grad statement for the full stable radial class. Its lifespan assumption concerns the kinetic solution itself and imposes no small-data or near-equilibrium condition. The conclusion is convergence of all fixed factorial marginals in full phase-space $L^1$.

=== 1.2 Structure of the proof <structure-of-the-proof>

The argument uses a finite number of macroscopic layers of length $b = T \/ L$, each divided into a much finer mesh. The fine cells permit an exact finite expansion by whole interaction components. The coarse layers permit centering against the known Boltzmann solution. Several features of the construction are useful beyond ordinary binary collision trees. Throughout the proof, $P = 1 + \| log epsilon \|$; polynomial cutoffs mean fixed powers of $P$, chosen after the finite number $L$ of layers.

===== 1.2.1 Exact component identities. <exact-component-identities.>

The expansion groups particles into their entire instantaneous interaction components at every cut. A finite inclusion-exclusion over successive generations of components represents each coefficient by independent subsystem flows and contact indicators. This preserves the potential energy needed for estimates even when a component has many internal encounters. Centering acts only on isolated singleton slots. Its cancellation requires separation of every displayed trajectory, including the detached trajectories in the signed terms.

===== 1.2.2 One energy budget across all layers. <one-energy-budget-across-all-layers.>

Each formal particle lifetime contributes an independent input once and departs once. Stability applied to intact departed components gives a single Gaussian budget for the whole history. Repeatedly carried velocities can then cost $L^(p \/ 2)$ for a history with $p$ labels, while the time factors contribute $\( T \/ L \)^(p - h_0)$ for $h_0$ top roots. The $h_0$ roots are the labels at the upper end from which the backward history starts. After bounding their contribution, the resulting base $C T \/ sqrt(L)$ is small for a sufficiently large fixed $L$. This is the mechanism that passes beyond the convergence interval of one collision-tree series.

===== 1.2.3 Causal exposure of defects. <causal-exposure-of-defects.>

The first estimates integrate all positions and velocities at the ends of a fine time cell. They bound histories with crowded groups or several additions in one cell. The remaining histories can be represented by trees whose edges follow the order in which particles are added. If extra contacts affect a positive fraction of the particle lives, a counting argument selects many disjoint trees of bounded size. Their fresh scattering parameters give small angular sets for contacts with paths that are independent of those parameters. To multiply these small factors, both outputs of an unexposed genuine scattering must remain hidden, whereas a virtual crossing hides only the new branch; Figure 1 explains the distinction. The trees used to choose integration coordinates need not coincide with the families used in the signed cancellation identity.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-2.444, 2.914), (-2.444, -0.047), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#737373"))))
  content((-2.557, 1.41), [#text(size: 8pt)[backward time]], anchor: "south", angle: 90deg, padding: 0.1176cm)
  content((0.141, 3.431), [#text(size: 9pt)[Genuine scattering]])
  rect((-1.551, -0.141), (1.504, 1.711), fill: rgb("#f5f5ff"), stroke: none)
  rect((-1.551, -0.141), (1.504, 1.711), stroke: (paint: rgb("#a6a6ff"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 3pt)
  line((0, 2.961), (0, 1.974), stroke: (paint: rgb("#404040"), thickness: 1.05pt, miter-limit: 10))
  line((0, 1.974), (-1.109, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((0, 1.974), (1.109, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((0, 1.974), radius: 0.05997, fill: rgb("#000000"), stroke: none)
  content((-0.1222, 2.181), [#text(size: 8pt)[launch]], anchor: "east", padding: 0.1176cm)
  bezier((2.068, 2.961), (0.7398, 0.658), (2.068, 1.739), (1.645, 0.987), stroke: (paint: rgb("#404040"), thickness: 1.05pt, miter-limit: 10))
  circle((0.7398, 0.658), radius: 0.09978, fill: rgb("#a60000"), stroke: none)
  content((1.41, 0.3572), [#text(size: 8pt)[first exposure]], anchor: "west", padding: 0.1176cm)
  content((-1.109, -0.4512), [#text(size: 8pt)[new label]])
  content((1.109, -0.4512), [#text(size: 8pt)[continued parent]])
  content((0.047, -0.9212), [#text(fill: rgb("#0000a6"))[#text(size: 8pt)[both descendant branches hidden]]])
  content((7.235, 3.431), [#text(size: 9pt)[Passage or virtual crossing]])
  rect((7.169, -0.141), (8.551, 1.711), fill: rgb("#f5f5ff"), stroke: none)
  rect((7.169, -0.141), (8.551, 1.711), stroke: (paint: rgb("#a6a6ff"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 3pt)
  line((7, 2.961), (7, 0), stroke: (paint: rgb("#404040"), thickness: 1.05pt, miter-limit: 10))
  line((7, 1.974), (8.109, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((7, 1.974), radius: 0.05997, fill: rgb("#000000"), stroke: none)
  content((6.878, 2.181), [#text(size: 8pt)[launch]], anchor: "east", padding: 0.1176cm)
  bezier((9.068, 2.961), (7.74, 0.658), (9.068, 1.739), (8.645, 0.987), stroke: (paint: rgb("#404040"), thickness: 1.05pt, miter-limit: 10))
  circle((7.74, 0.658), radius: 0.09978, fill: rgb("#a60000"), stroke: none)
  content((6.944, -0.4512), [#text(size: 8pt)[visible parent]], anchor: "east", padding: 0.1176cm)
  content((7.846, -0.4512), [#text(size: 8pt)[new label]], anchor: "west", padding: 0.1176cm)
  content((7.282, -0.9212), [#text(fill: rgb("#0000a6"))[#text(size: 8pt)[only the new branch hidden]]])
})],
  caption: [Figure 1: The auxiliary exposure used to multiply contact savings. Blue branches carry an unrevealed launch parameter. A genuine scattering changes the continued parent’s velocity, so both descendant branches must be hidden. Passage leaves the parent unchanged. Until first exposure, the black trajectories can be computed without the hidden parameter. The construction is applied to exact signed histories; no particles are deleted from the microscopic dynamics. The drawing shows one selected tree. The full construction also omits added groups whose positions have not yet been fixed relative to the visible particles, including groups not selected for exposure; Proposition 39 gives the complete construction. ],
) <fig:exposure>

Section 2 establishes the flow, initial estimates, scattering facts, and uniform smooth-input bounds. Section 3 constructs the exact finite expansion. Section 4 gives the centered identities and the short-layer approximation to the kinetic solution. Sections 5 and Section 6 prove the finite-history measure estimates and the exposure bound. Section 7 chooses the thresholds, removes every cutoff, and proves Theorem 1 and Corollary 2.

== 2 Microscopic flow, scattering, and kinetic envelopes <sec:preliminaries>

The microscopic expansion uses globally defined finite-particle flows and small initial centered correlations. We establish these facts, identify the collision operator by two-body flux, and derive fixed spatially summable Gaussian bounds for the assumed kinetic solution and its spatial gradient. The scattering arguments require neither a monotone potential nor a regular differential cross-section.

=== 2.1 Potential assumptions and finite-particle flow <potential-assumptions-and-finite-particle-flow>

#prodef([Assumption 2.1.])[
  (Potential class).  Write $Phi \( q \) = phi.alt \( \| q \| \)$, with $Phi \( q \) = 0$ for $\| q \| gt.eq 1$. Assume either $Phi in C^2 \( bb(R)^3 \; bb(R) \)$, or $Phi in C^2 \( bb(R)^3 \\ { 0 } \)$ with $Phi \( q \) arrow.r + oo$ as $q arrow.r 0$. In the latter case set $Phi \( 0 \) = + oo$. Assume thermodynamic stability: for some $B gt.eq 0$,
  #[#set math.equation(numbering: n => "(2.1)")
   $ sum_(i \, j in R\
i < j) Phi \( q_i - q_j \) gt.eq - B \| R \| $ <eq:pre-stability>]
  for every finite configuration of distinct points. The potential is fixed independently of $epsilon$.
] <pre:potential>

These are the assumptions of Hypothesis $1'$ in #cite(label("PSS14")) Section 8. Set

$ Phi_epsilon \( x \) = Phi \( x \/ epsilon \) \, #h(2em) cal(H)_R \( Z_R \) = 1 / 2 sum_(i in R) \| v_i \|^2 + sum_(i \, j in R\
i < j) Phi_epsilon \( x_i - x_j \) . $

The exact microscopic equations are

#[#set math.equation(numbering: n => "(2.2)")
 $ dot(x)_i = v_i \, #h(2em) dot(v)_i = - 1 / epsilon sum_(j in R \\ { i }) nabla Phi \( \( x_i - x_j \) \/ epsilon \) . $ <pre:dynamics>]

#thm([Proposition 2.2.])[
  (Global finite-particle flow).  #emph[For each fixed $epsilon > 0$ and finite label set $R$, (2.2) has a unique global flow from every finite-energy initial state in its domain. The flow preserves phase volume and $cal(H)_R$. In the singular case, every pair distance along a given trajectory is bounded away from zero. In the nonsingular case coincident positions are permitted.]
] <pre:flow>

#proof[
  Taking two particles in (2.1) gives $phi.alt \( r \) gt.eq - 2 B$ for $r > 0$. In the nonsingular case, approximation by distinct configurations extends stability to coincident positions. The vector field is locally Lipschitz on its domain and hence has a unique maximal local solution. Differentiation gives energy conservation on its existence interval. For $n = \| R \|$,
  #[#set math.equation(numbering: n => "(2.3)")
   $ 1 / 2 sum_(i in R) \| v_i \( t \) \|^2 lt.eq cal(H)_R \( Z_R \( 0 \) \) + B n . $ <eq:pre-speed>]
  For $n gt.eq 2$, bounding every pair except one below gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ Phi_epsilon \( x_i \( t \) - x_j \( t \) \) lt.eq cal(H)_R \( Z_R \( 0 \) \) + 2 B (binom(n, 2) - 1) . $ <eq:pre-pairupper>]
  In the singular case this bounds every pair distance away from zero. Equation (2.3) prevents escape to spatial infinity in finite time. Thus on each bounded time interval the solution remains in a compact subset of the vector field’s domain and extends beyond any proposed finite endpoint, forward or backward. In the nonsingular case one can also use the globally Lipschitz gradient of the compactly supported $C^2$ potential directly. The cases $n = 0 \, 1$ are immediate.
  The vector field has zero divergence in $\( x_i \, v_i \)_(i in R)$: $dot(x)_i$ is independent of $x_i$ and $dot(v)_i$ is independent of $v_i$. Its flow Jacobian therefore solves $dot(J) = 0$ with $J \( 0 \) = 1$. ◻
]

=== 2.2 The ensemble and external isolation <the-ensemble-and-external-isolation>

#prodef([Definition 2.3.])[
  (Exact initial ensemble).  Let $mu = epsilon^(- 2)$ and
  $ cal(D)_R^epsilon = { Z_R : \| x_i - x_j \| > epsilon upright(" for all ") i eq.not j in R } . $
  For the prescribed $C^1$ nonnegative probability density $f_0$, set
  #[#set math.equation(numbering: n => "(2.5)")
   $ cal(Z)_epsilon & = sum_(n = 0)^oo frac(mu^n, n !) integral f_0^(⊗ n) \( Z_n \) upright(bold(1))_(cal(D)_(\[ n \])^epsilon) \( Z_n \) thin d Z_n \,\
W_(0 \, n) \( Z_n \) & = cal(Z)_epsilon^(- 1) mu^n f_0^(⊗ n) \( Z_n \) upright(bold(1))_(cal(D)_(\[ n \])^epsilon) \( Z_n \) . $ <eq:pre-partition>]
  Here $\[ n \] = { 1 \, dots.h \, n }$ and empty products equal one. The probability law on ordered coordinates is
  #[#set math.equation(numbering: n => "(2.6)")
   $ bb(P) \( N = n \, Z_n in d Z_n \) = frac(1, n !) W_(0 \, n) \( Z_n \) thin d Z_n . $ <pre:model>]
  Thereafter the cloud evolves by (2.2).
]

Since $1 lt.eq cal(Z)_epsilon lt.eq e^mu$, this is a probability law with finite $N$ almost surely. Initial exclusion gives zero potential energy and finite kinetic energy. Proposition 2 therefore defines its exact evolution. Let $W_(t \, n)$ be the transported density.

For $r = \| R \|$, the rescaled factorial density is

#[#set math.equation(numbering: n => "(2.7)")
 $ F_R^epsilon \( t \, Z_R \) = mu^(- r) sum_(n = 0)^oo frac(1, n !) integral W_(t \, r + n) \( Z_R \, Z_(\[ n \])^(upright("ext")) \) thin d Z_(\[ n \])^(upright("ext")) . $ <pre:factorial>]

External labels are distinct from those in $R$. Symmetry makes the formula independent of their temporary names. It equals the density defined by the ordered distinct-label sum in the statement: in a cloud of size $r + n$, there are $\( r + n \) ! \/ n !$ such selections.

The externally isolated factorial density is

#[#set math.equation(numbering: n => "(2.8)")
 $ tilde(F)_R^epsilon \( t \, Z_R \) = mu^(- r) sum_(n = 0)^oo frac(1, n !) integral W_(t \, r + n) \( Z_R \, Z_(\[ n \])^(upright("ext")) \) product_(i in R\
j in \[ n \]^(upright("ext"))) upright(bold(1))_({ \| x_i - x_j \| > epsilon }) thin d Z_(\[ n \])^(upright("ext")) . $ <eq:pre-isolated>]

Set $F_diameter^epsilon = tilde(F)_diameter^epsilon = 1$. External isolation imposes no condition on distances within $R$. In particular an interacting displayed component can be externally isolated, and $0 lt.eq tilde(F)_R^epsilon lt.eq F_R^epsilon$. A polymer is a connected component of the instantaneous graph with edges $\| x_i - x_j \| lt.eq epsilon$. The condition in (2.8) says exactly that the displayed labels form a union of entire polymers of the full cloud.

#thm([Proposition 2.4.])[
  (Initial insertion and centering).  #emph[Put $rho_0 \( x \) = integral f_0 \( x \, v \) thin d v$, and assume $parallel rho_0 parallel_oo < oo$. At time zero, 
#[#set math.equation(numbering: n => "(2.9)")
 $ tilde(F)_R^epsilon \( 0 \, Z_R \) & = F_R^epsilon \( 0 \, Z_R \)\
 & = f_0^(⊗ R) \( Z_R \) upright(bold(1))_(cal(D)_R^epsilon) \( Z_R \) bb(E) product_(i in R) upright(bold(1))_({ N \( B_i \) = 0 }) \, #h(2em) B_i = overline(B) \( x_i \, epsilon \) . $ <eq:pre-insertion>]

 The expectation is over an independent cloud with the original law, and $N \( B \)$ counts its positions in $B$. Consequently $0 lt.eq F_R^epsilon \( 0 \) lt.eq f_0^(⊗ R)$.]
  #emph[For $Z_R in cal(D)_R^epsilon$, define 
#[#set math.equation(numbering: n => "(2.10)")
 $ E_R^epsilon \( 0 \, Z_R \) = sum_(S subset R) \( - 1 \)^(\| R \\ S \|) f_0^(⊗ \( R \\ S \)) \( Z_(R \\ S) \) tilde(F)_S^epsilon \( 0 \, Z_S \) . $ <eq:pre-initialcenter>]

 There are $c_0 > 0 \, C_0 < oo$, independent of $R \, epsilon$, such that for sufficiently small $epsilon$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ \| E_R^epsilon \( 0 \, Z_R \) \| lt.eq \( C_0 epsilon^(c_0) \)^(\| R \|) f_0^(⊗ R) \( Z_R \) . $ <eq:pre-centersmall>]

 One may take $c_0 = 1 \/ 125$. For fixed $r$, 
#[#set math.equation(numbering: n => "(2.12)")
 $ 0 lt.eq 1 - integral F_R^epsilon \( 0 \, Z_R \) thin d Z_R lt.eq C r epsilon + C r^2 epsilon^3 \, #h(2em) integral F_R^epsilon \( t \) = integral F_R^epsilon \( 0 \) . $ <eq:pre-mass>]

]
] <pre:initial>

#proof[
  Insert $r$ particles into (2.7) at time zero. Their mutual exclusions give $upright(bold(1))_(cal(D)_R^epsilon)$. The remaining partition sum is $cal(Z)_epsilon$ times the probability that the original cloud misses $union.big_i B_i$. This proves (2.9). Initial exclusion already gives external isolation.
  On $cal(D)_R^epsilon$ every subset is separated, so substitution into (2.10) gives the exact identity
  #[#set math.equation(numbering: n => "(2.13)")
   $ E_R^epsilon \( 0 \, Z_R \) = \( - 1 \)^(\| R \|) f_0^(⊗ R) \( Z_R \) bb(P) { N \( B_i \) gt.eq 1 upright(" for every ") i in R } . $ <eq:pre-occupancy>]
  Choose a maximal subcollection of centers with mutual distance greater than $2 epsilon$. Its balls $B_i$ are disjoint up to null boundaries. A ball of radius $2 epsilon$ contains at most $125$ original centers: their disjoint balls of radius $epsilon \/ 2$ fit inside a ball of radius $5 epsilon \/ 2$. Hence the chosen subcollection has size $m gt.eq \| R \| \/ 125$. Disjointness ensures that occupants are distinct, and the factorial upper bound gives
  $ bb(P) { N \( B_i \) gt.eq 1 upright(" for every chosen ") i } & lt.eq bb(E) product_(upright("chosen ") i) N \( B_i \)\
 & = mu^m integral_(product_i \( B_i times bb(R)^3 \)) F_m^epsilon \( 0 \) thin d Z_m\
 & lt.eq #scale(x: 120%, y: 120%)[\(] mu parallel rho_0 parallel_oo \| B \( 0 \, epsilon \) \| #scale(x: 120%, y: 120%)[\)]^m lt.eq \( C epsilon \)^m . $
  For $C epsilon lt.eq 1$ this proves (2.11).
  The loss from mutual exclusion of $r$ independent inserted positions is at most $C r^2 epsilon^3$, by a union bound and bounded $rho_0$. For each inserted position,
  $ bb(P) { N \( B_i \) gt.eq 1 } lt.eq bb(E) N \( B_i \) = mu integral_(B_i times bb(R)^3) F_1^epsilon \( 0 \, z \) thin d z lt.eq C epsilon . $
  A second union bound proves the first estimate in (2.12). The integral of (2.7) is $mu^(- r) bb(E) \( N \)_r$, where $\( N \)_r = N \( N - 1 \) dots.h.c \( N - r + 1 \)$. It is finite by the initial factorial bound and conserved since $N$ is conserved. ◻
]

=== 2.3 Scattering flux and the collision operator <scattering-flux-and-the-collision-operator>

Use microscopic relative coordinates in this subsection. For $g eq.not 0$ and $b in g^perp$, $\| b \| < 1$, the incoming free trajectory meets the interaction sphere at

$ n = b - sqrt(1 - \| b \|^2) thin frac(g, \| g \|) \, #h(2em) n dot.op g < 0 . $

Time translation identifies the asymptotic prescription $q \( tau \) - \( b + tau g \) arrow.r 0$, $q' \( tau \) arrow.r g$ as $tau arrow.r - oo$, with $q \( 0 \) = n$, $q' \( 0 \) = g$ for $q'' = - 2 nabla Phi \( q \)$. Let $tau_(*) \( n \, g \) in \( 0 \, oo \]$ be its first subsequent exit time from the open unit ball. Projection onto the impact disk has Jacobian

#[#set math.equation(numbering: n => "(2.14)")
 $ \| n dot.op g \| thin d sigma \( n \) = \| g \| thin d^2 b . $ <eq:pre-fluxdisk>]

#thm([Lemma 2.5.])[
  (Residence-time flux).  #emph[For every $M < oo$ there is $C_M < oo$ such that 
#[#set math.equation(numbering: n => "(2.15)")
 $ integral_(\| g \| lt.eq M\
n in S^2 \, med n dot.op g < 0) tau_(*) \( n \, g \) \| n dot.op g \| thin d sigma \( n \) thin d g lt.eq C_M . $ <eq:pre-duration>]

 The incoming flux of ${ tau_(*) > D \, med \| g \| lt.eq M }$ is at most $C_M \/ D$. In particular $tau_(*) < oo$ almost everywhere in incoming flux. The entrance-to-exit scattering map preserves flux.]
] <pre:duration>

#proof[
  Relative energy is
  $ 1 / 4 \| q' \|^2 + phi.alt \( \| q \| \) = 1 / 4 \| g \|^2 . $
  Since $phi.alt gt.eq - 2 B$, we have $\| q' \|^2 lt.eq M^2 + 8 B$ throughout the encounter. Consider
  $ \( n \, g \, s \) mapsto \( q \( s \) \, q' \( s \) \) \, quad n dot.op g < 0 \, quad \| g \| lt.eq M \, quad 0 < s < tau_(*) \( n \, g \) . $
  Its volume element is $\| n dot.op g \| thin d sigma \( n \) thin d g thin d s$. At $s = 0$, append the velocity vector field to five tangent vectors of the entrance section. Its normal component in position space is $n dot.op g$. Phase-volume preservation propagates that determinant.
  The map is injective. Two representations of an interior state lie on the same orbit by uniqueness. A preceding outward crossing cannot be followed by an inward crossing: outside the ball the path is a straight line with increasing distance from the origin. If the orbit repeated an interior state it would be periodic, so it could not have a past entrance from outside. Hence there is at most one entrance and elapsed time.
  Apply change of variables on compact pieces of the entrance section and bounded elapsed-time intervals, then exhaust the domain. The image lies in $B \( 0 \, 1 \) times B \( 0 \, sqrt(M^2 + 8 B) \)$. Its finite volume proves (2.15). Markov’s inequality gives the tail and excludes infinite duration outside a null set. The same flow-box determinant on the transverse exit section proves flux preservation. Tangential section data carry zero flux. ◻
]

#prodef([Definition 2.6.])[
  (The scattering collision operator).  Write $c = \( v + v_(*) \) \/ 2$, $g = v - v_(*)$, and, for almost every incoming datum, let $g_(upright("out"))$ be the velocity after exit. Set
  $ v' = c + 1 / 2 g_(upright("out")) \, #h(2em) v'_(*) = c - 1 / 2 g_(upright("out")) . $
  For $psi in C_c^oo \( bb(R)^3 \)$, define $Q_Phi$ at each $x$ by
  #[#set math.equation(numbering: n => "(2.16)")
   $ integral Q_Phi \( f \, f \) \( x \, v \) psi \( v \) thin d v = 1 / 2 integral_(bb(R)^3 times bb(R)^3) & f \( x \, v \) f \( x \, v_(*) \) \| v - v_(*) \|\
 times integral_(b in \( v - v_(*) \)^perp\
\| b \| < 1) & \[ thin psi \( v' \) + psi \( v'_(*) \) - psi \( v \) - psi \( v_(*) \) thin \] thin d^2 b thin d v thin d v_(*) . $ <pre:collision>]
  Here $d^2 b$ is Euclidean area, and the $g = 0$ contribution is zero. Null exceptional scattering data are ignored.
]

#thm([Lemma 2.7.])[
  (Reversibility and normalization).  #emph[The measure $d Lambda = \| v - v_(*) \| thin d v thin d v_(*) thin d^2 b$ is preserved by exchanging incoming and outgoing velocity pairs with the corresponding entrance parameter. The weak definition (2.16) equals 
#[#set math.equation(numbering: n => "(2.17)")
 $ Q_Phi \( f \, f \) \( x \, v \) = integral_(bb(R)^3) \| v - v_(*) \| integral_(b in \( v - v_(*) \)^perp\
\| b \| < 1) \[ thin f \( x \, v' \) f \( x \, v'_(*) \) - f \( x \, v \) f \( x \, v_(*) \) thin \] thin d^2 b thin d v_(*) . $ <eq:pre-Qstrong>]

 These identities hold whenever the integrals are absolutely convergent, in particular for Gaussian bounded functions. All scattering branches are included, and the impact disk has area $pi$.]
] <pre:operator>

#proof[
  Let $\( n_(+) \, g_(upright("out")) \)$ be the exit state of the relative orbit with entrance $\( n \, g \)$. Since $Phi$ is even, $- q \( tau_(*) - s \)$ has entrance $\( - n_(+) \, g_(upright("out")) \)$ and exit $\( - n \, g \)$. Thus $\( n \, g \) mapsto \( - n_(+) \, g_(upright("out")) \)$ is an involution of the incoming section outside a null set. It preserves flux by Lemma 5 and the reflection $n_(+) mapsto - n_(+)$. The center velocity is unchanged, and $\( v \, v_(*) \) arrow.l.r \( c \, g \)$ has absolute determinant one. Equation (2.14) proves invariance of $d Lambda$.
  Particle exchange also preserves $d Lambda$, so the two test-function terms in either pair of (2.16) give equal integrals. This cancels the factor $1 \/ 2$. The scattering involution transfers the remaining outgoing test to the incoming variable, giving (2.17). Energy conservation gives $\| v' \|^2 + \| v'_(*) \|^2 = \| v \|^2 + \| v_(*) \|^2$. The finite disk area and Gaussian integration justify absolute convergence. No scattering-angle density or choice of one branch is introduced. ◻
]

=== 2.4 Exceptional deflections and rotational parameters <exceptional-deflections-and-rotational-parameters>

#thm([Proposition 2.8.])[
  (Scattering nondegeneracy).  #emph[Outside a set of zero incoming flux, an encounter either is a straight force-free passage or satisfies 
#[#set math.equation(numbering: n => "(2.18)")
 $ v' eq.not v \, #h(2em) v'_(*) eq.not v . $ <eq:pre-increments>]

 For $M < oo$ and $eta > 0$, the non-free relative incoming data $\( n \, g \)$ with $\| g \| lt.eq M$ can be restricted to a rotation-invariant compact set, losing at most $eta$ relative incoming flux, on which the duration is bounded and $\| g \|$, $\| v' - v \|$, and $\| v'_(*) - v \|$ have positive lower bounds. For fixed radial scattering parameters, each of these nonzero increments has a uniform spherical directional marginal under common rotation. The two increments need not be independent.]
] <pre:scattering>

#proof[
  Put $G = \| g \|$, $rho = \| b \|$, $J = G rho$, and $E = G^2 \/ 4$. The cases $G = 0$, $J = 0$, and $rho = 1$ are null in incoming flux. For $J > 0$, the effective radial potential is
  $ W_J \( r \) = phi.alt \( r \) + frac(J^2, 4 r^2) . $
  An incoming turning radius $y$ satisfies $E = W_J \( y \)$. A nonsimple turning point also requires $W'_J \( y \) = 0$. At each fixed $J$, the critical values of the $C^2$ function $W_J$ on $\( 0 \, 1 \)$ are Lebesgue null, by the one-dimensional Sard theorem on a countable compact exhaustion. The radial incoming flux is
  #[#set math.equation(numbering: n => "(2.19)")
   $ G^3 rho thin d G thin d rho = 2 J thin d E thin d J . $ <eq:pre-Sardflux>]
  Fubini excludes nonsimple turning energies up to zero flux. Lemma 5 has already excluded infinite duration.
  At a simple incoming turning radius $y in \( 0 \, 1 \)$, $W'_J \( y \) < 0$ and $E > W_J \( r \)$ for all $r > y$. Set $a = J^(- 2)$ and
  $ A_y \( r \) = y^(- 2) - r^(- 2) \, #h(2em) C_y \( r \) = 4 \( phi.alt \( y \) - phi.alt \( r \) \) \, #h(2em) H_(y \, a) \( r \) = A_y \( r \) + a C_y \( r \) . $
  The half angular sweep is
  #[#set math.equation(numbering: n => "(2.20)")
   $ cal(A)_y \( a \) = integral_y^oo frac(d r, r^2 sqrt(H_(y \, a) \( r \))) . $ <eq:pre-halfangle>]
  Indeed $dot(r)^2 = J^2 H_(y \, a) \( r \)$ and the angular speed is $J \/ r^2$. For admissible $a$, one has $H_(y \, a) \( r \) > 0$ for $r > y$, $partial_r H_(y \, a) \( y \) > 0$, and $lim_(r arrow.r oo) H_(y \, a) \( r \) > 0$. The ratios $C_y \/ A_y$ and $H_(y \, a) \/ A_y$ extend continuously to $\[ y \, oo \]$. At $y$ use the ratios of first derivatives; at infinity use finite range. The second ratio is strictly positive on this compact interval, so it has a positive minimum, while $C_y \/ H_(y \, a)$ is bounded. These properties also show that the admissible set of $a$ is open.
  For $a'$ near $a$, the binomial expansion in
  $ H_(y \, a')^(- 1 \/ 2) = H_(y \, a)^(- 1 \/ 2) (1 + \( a' - a \) C_y / H_(y \, a))^(- 1 \/ 2) $
  converges uniformly after multiplication by the integrable majorant $r^(- 2) H_(y \, a)^(- 1 \/ 2)$. Thus $cal(A)_y$ is real analytic in the parameter $a$, although $phi.alt$ is only $C^2$. Twice differentiating gives
  #[#set math.equation(numbering: n => "(2.21)")
   $ cal(A)''_y \( a \) = 3 / 4 integral_y^oo frac(C_y \( r \)^2 thin d r, r^2 H_(y \, a) \( r \)^(5 \/ 2)) . $ <eq:pre-convex>]
  Near $y$ the integrand is $O \( \( r - y \)^(- 1 \/ 2) \)$, since $C_y \( r \) = O \( r - y \)$ and $H_(y \, a)$ has a simple root. It is also integrable at infinity. It is strictly positive unless $phi.alt \( r \) = phi.alt \( y \)$ for every $r gt.eq y$. Finite range makes this constant zero; the encountered orbit is then a straight force-free passage.
  For a non-free encounter $cal(A)_y$ is strictly convex. The deflection angle is $pi - 2 cal(A)_y$ modulo $2 pi$. Therefore $g_(upright("out")) = g$ or $g_(upright("out")) = - g$ requires $cal(A)_y in \( pi \/ 2 \) bb(Z)$. Each such level has at most two preimages on an admissible interval. There are countably many levels and countably many open intervals. On a simple turning branch, $\( y \, J \) mapsto \( E \, J \)$, $E = W_J \( y \)$, is a local $C^1$ diffeomorphism. A countable cover by these charts, Fubini in $\( y \, a \)$, and (2.19) prove flux nullness. These exceptional equalities are exactly the two failures of (2.18).
  For the compact-set assertion, exhaust the simple-scattering non-free radial parameter domain by compact subsets avoiding $G = 0$, $J = 0$, $rho = 1$, and the zero-increment levels. This covers all non-free data outside a null set. On each such compact subset, continuous dependence for the $C^1$ ODE flow and transversality of the finite exit give a continuous exit time and scattering map. Thus durations are bounded and all the listed nonzero quantities have positive minima. The relative flux measure on $G lt.eq M$ is finite, so an exhaustion member loses at most $eta$ flux. Lifting with all rotations makes the set rotation-invariant.
  Finally, write $\( g \, b \) = \( G R e_1 \, rho R e_2 \)$, $R in S O \( 3 \)$. At fixed $\( G \, rho \)$ the orientation factor in incoming flux is a constant multiple of Haar measure on $S O \( 3 \)$. Central-force rotation equivariance maps each nonzero increment to $R$ times a fixed vector. Its direction has uniform measure on $S^2$. This is a marginal statement and leaves the joint pair correlated. ◻
]

=== 2.5 A fixed spatial Gaussian envelope on the kinetic interval <a-fixed-spatial-gaussian-envelope-on-the-kinetic-interval>

Use the norm $parallel dot.op parallel_(upright("Bol") \, alpha)$ defined in (1.1), and put

$ parallel h parallel_(oo \, alpha) = sup_(x \, v) e^(alpha \| v \|^2) \| h \( x \, v \) \| . $

For vector-valued functions use Euclidean norm. The following proof adapts the weighted transport estimate in #cite(label("DHM25")) Proposition A.1. Only finite impact area and kinetic energy conservation are needed, so the argument applies to $Q_Phi$.

#thm([Proposition 2.9.])[
  (Known-solution envelopes).  #emph[Suppose $f$ is the classical nonnegative solution in the statement, and 
$ A = sup_(0 lt.eq t lt.eq T) parallel f \( t \) parallel_(oo \, 2 beta) < oo \, #h(2em) B_0 = parallel f_0 parallel_(upright("Bol") \, 2 beta) + parallel nabla_x f_0 parallel_(upright("Bol") \, 2 beta) < oo . $

 Then 
#[#set math.equation(numbering: n => "(2.22)")
 $ sup_(0 lt.eq t lt.eq T) (parallel f \( t \) parallel_(upright("Bol") \, beta) + parallel nabla_x f \( t \) parallel_(upright("Bol") \, beta)) lt.eq C \( A \, B_0 \, beta \, T \) < oo . $ <eq:pre-envelope>]

 Fix, once and for all, 
#[#set math.equation(numbering: n => "(2.23)")
 $ beta_0 = beta \/ 2 . $ <eq:pre-beta0>]

 Thus all independent inputs $f \( t \)$ and their spatial Lipschitz envelopes have a common bound with the fixed margin $beta - beta_0$. Constants in (2.22) are independent of the subsequent time-layer subdivision.]
] <pre:envelopes>

#proof[
  Set
  $ gamma \( t \) = frac(3 beta, 2) - frac(beta t, 2 T) \, #h(2em) c = frac(beta, 2 T) \, #h(2em) M \( v \) = e^(- 2 beta \| v \|^2) \, $
  and $\( S \( r \) h \) \( x \, v \) = h \( x - r v \, v \)$. Notice $beta lt.eq gamma \( t \) lt.eq 3 beta \/ 2$. Define a positive linear operator for $h gt.eq 0$ by
  #[#set math.equation(numbering: n => "(2.24)")
   $ \( cal(B) h \) \( x \, v \) = integral_(bb(R)^3) \| v - v_(*) \| integral_(\| b \| < 1) #scale(x: 120%, y: 120%)[\[] & M \( v'_(*) \) h \( x \, v' \) + M \( v' \) h \( x \, v'_(*) \)\
 & + M \( v_(*) \) h \( x \, v \) + M \( v \) h \( x \, v_(*) \) #scale(x: 120%, y: 120%)[\]] thin d^2 b thin d v_(*) . $ <eq:pre-positiveB>]
  The disk is in $\( v - v_(*) \)^perp$.
  We first prove that for $0 lt.eq s < t lt.eq T$, $r = t - s$,
  #[#set math.equation(numbering: n => "(2.25)")
   $ parallel S \( r \) cal(B) h parallel_(upright("Bol") \, gamma \( t \)) & lt.eq C r^(- 1 \/ 2) parallel h parallel_(upright("Bol") \, gamma \( s \)) \,\
parallel S \( r \) cal(B) h parallel_(oo \, gamma \( t \)) & lt.eq C r^(- 1 \/ 2) parallel h parallel_(oo \, gamma \( s \)) . $ <eq:pre-VolterraBol>]
  Let $H_s \( y \) = sup_u e^(gamma \( s \) \| u \|^2) h \( y \, u \)$. For each product in (2.24), energy conservation, or its identity version for a loss product, gives
  $ M \( u_(*) \) h \( y \, u \) lt.eq H_s \( y \) e^(- gamma \( s \) \( \| v \|^2 + \| v_(*) \|^2 \)) . $
  After multiplication by $e^(gamma \( t \) \| v \|^2)$ this is at most
  $ H_s \( y \) e^(- beta \| v_(*) \|^2) e^(- c r \( \| v \|^2 + \| v_(*) \|^2 \)) . $
  Since
  $ \| v - v_(*) \| e^(- c r \( \| v \|^2 + \| v_(*) \|^2 \) \/ 2) lt.eq C_c r^(- 1 \/ 2) \, $
  the disk area $pi$ and the Gaussian integral in $v_(*)$ imply
  #[#set math.equation(numbering: n => "(2.26)")
   $ e^(gamma \( t \) \| v \|^2) \( S \( r \) cal(B) h \) \( x \, v \) lt.eq C r^(- 1 \/ 2) e^(- c r \| v \|^2 \/ 2) H_s \( x - r v \) . $ <eq:pre-spatialmajorant>]
  This proves (2.25).
  For the summed spatial estimate put $a_k = sup_(\| y - k \| lt.eq 1) H_s \( y \)$. If $m lt.eq r \| v \| < m + 1$ and $\| x - k \| lt.eq 1$, then $\| x - r v - k \| lt.eq m + 2$, whence
  $ H_s \( x - r v \) lt.eq sum_(ell in bb(Z)^3\
\| ell - k \| lt.eq m + 3) a_ell . $
  Indeed lattice-centered unit balls cover $bb(R)^3$. For $r lt.eq T$, the damping factor on that shell is at most $e^(- c m^2 \/ \( 2 T \))$. Bound the supremum over $v$ by summation over $m gt.eq 0$ and then sum over $k$. Each $a_ell$ occurs at most $C \( m + 4 \)^3$ times. Convergence of $sum_(m gt.eq 0) e^(- c m^2 \/ \( 2 T \)) \( m + 4 \)^3$ proves (2.25). The same shell argument, now using
  $ e^(gamma \( t \) \| v \|^2) \| S \( t \) h_0 \( x \, v \) \| lt.eq e^(- c t \| v \|^2) sup_u e^(gamma \( 0 \) \| u \|^2) \| h_0 \( x - t v \, u \) \| \, $
  gives
  #[#set math.equation(numbering: n => "(2.27)")
   $ sup_(0 lt.eq t lt.eq T) parallel S \( t \) h_0 parallel_(upright("Bol") \, gamma \( t \)) lt.eq C parallel h_0 parallel_(upright("Bol") \, gamma \( 0 \)) . $ <eq:pre-freebound>]
  At $t = 0$ this is immediate.
  Define
  $ \( cal(V) h \) \( t \) = A integral_0^t S \( t - s \) cal(B) h \( s \) thin d s . $
  The characteristic equation, $f gt.eq 0$, and $f lt.eq A M$ imply
  #[#set math.equation(numbering: n => "(2.28)")
   $ 0 lt.eq f \( t \) lt.eq S \( t \) f_0 + \( cal(V) f \) \( t \) . $ <eq:pre-linearcomparison>]
  Its $n$-fold iteration is the finite inequality
  $ f lt.eq sum_(j = 0)^(n - 1) cal(V)^j \( S \( dot.op \) f_0 \) + cal(V)^n f . $
  No finiteness of the unknown summed spatial norm has been assumed. Using (2.25) and $parallel f \( t \) parallel_(oo \, gamma \( t \)) lt.eq A$ yields
  #[#set math.equation(numbering: n => "(2.29)")
   $ parallel \( cal(V)^n f \) \( t \) parallel_(oo \, gamma \( t \)) lt.eq A frac(\( C A Gamma \( 1 \/ 2 \) \)^n t^(n \/ 2), Gamma \( 1 + n \/ 2 \)) . $ <eq:pre-remaindergamma>]
  This tends to zero uniformly for $t lt.eq T$. The time-convolution formula follows inductively from
  $ integral_0^t \( t - s \)^(- 1 \/ 2) s^(n \/ 2) thin d s = t^(\( n + 1 \) \/ 2) frac(Gamma \( 1 \/ 2 \) Gamma \( 1 + n \/ 2 \), Gamma \( 1 + \( n + 1 \) \/ 2 \)) . $
  Equations (2.25) and (2.27) bound the summed spatial norm of the $j$th series term by
  $ C B_0 frac(\( C A Gamma \( 1 \/ 2 \) \)^j T^(j \/ 2), Gamma \( 1 + j \/ 2 \)) . $
  The sum is finite. Letting $n arrow.r oo$ in the pointwise comparison and then taking the summed spatial norm proves the required bound for $f$ at exponent $gamma \( t \)$.
  To handle the derivative without assuming its envelope, fix a coordinate unit vector $e$ and $0 < \| delta \| lt.eq 1$, and put
  $ d_delta \( t \, x \, v \) = frac(f \( t \, x + delta e \, v \) - f \( t \, x \, v \), delta) . $
  Use $a' b' - a b = \( a' - a \) b' + a \( b' - b \)$ for both gain and loss products in (2.17). Each undifferenced factor is a spatial translate of $f$, bounded by $A M$, so
  $ \| d_delta \( t \) \| lt.eq S \( t \) \| d_delta \( 0 \) \| + cal(V) \| d_delta \| \( t \) . $
  For fixed $delta$, $parallel d_delta \( t \) parallel_(oo \, gamma \( t \)) lt.eq 2 A \/ \| delta \|$. The remainder argument (2.29) therefore applies and vanishes as $n arrow.r oo$, before taking $delta arrow.r 0$. The fundamental theorem of calculus gives
  $ \| d_delta \( 0 \, x \, v \) \| lt.eq integral_0^1 \| partial_e f_0 \( x + theta delta e \, v \) \| thin d theta . $
  Translations of length at most one change the summed spatial supremum norm by at most an absolute factor, since each translated unit ball is covered by a fixed number of lattice-centered unit balls and each covering ball occurs a bounded number of times. Hence $parallel d_delta \( 0 \) parallel_(upright("Bol") \, gamma \( 0 \)) lt.eq C B_0$, uniformly in $delta$. The same series estimate bounds $parallel d_delta \( t \) parallel_(upright("Bol") \, gamma \( t \))$ uniformly in $t \, delta$. Pointwise convergence to $partial_e f$, followed by Fatou’s inequality for the sum of local suprema, gives the derivative bound. Sum over the three coordinate directions and use $gamma \( t \) gt.eq beta$ to obtain (2.22). ◻
]

#prodef([Remark 2.10.])[
  Lemma 5 concerns isolated two-body encounters, not dynamically formed many-particle bound components. Proposition 8 supplies rotational marginals, not independence from a trajectory that already depends on the same parameters. The history estimates must establish the required many-particle and conditional parameter statements separately.
] <pre:no-manybody-conclusion>

== 3 An exact finite expansion on one cell <sec:cell>

The identities in this section concern a finite cloud. In particular, they do not assume that large components, recollisions, or long encounters are unlikely. Their signed auxiliary trajectories are distinguished throughout from the trajectory of the full microscopic cloud. The use of autonomous physical trajectory components and signed geometric overlap constraints has its antecedent in #cite(label("BGSSCluster2022")). For smooth potentials, the identities below retain entire interacting components and their potential energy.

=== 3.1 Contact components and kernels <contact-components-and-kernels>

Fix a cell $I = \[ a \, b \]$, put $delta = b - a$, and let $S$ be a finite label set. For $A subset S$ write

$ X_i^A \( u \; Z_A \) \, quad V_i^A \( u \; Z_A \) \, #h(2em) i in A \, quad 0 lt.eq u lt.eq delta \, $

for the isolated Hamiltonian flow of precisely the labels in $A$, started from $Z_A$ at $a$. The empty flow has its evident meaning. Statements about these flows are made outside their null sets of undefined initial data. The flow and its measurability are supplied by Proposition 2.

Let $pi_0 \( S \) = pi_0 \( Z_S \)$ be the partition into connected components of the graph with edges $\| x_i - x_j \| lt.eq epsilon$. A subset is #emph[initially admissible] if it is a union of blocks of $pi_0 \( S \)$. Let $Pi_I \( A \)$ be the connected-component partition of the graph on $A$ with an edge $i j$ whenever

$ min_(0 lt.eq u lt.eq delta) \| X_i^A \( u \) - X_j^A \( u \) \| lt.eq epsilon . $

Thus a contact includes a force-free passage or a tangency. Set

$ c_I \( A \) = upright(bold(1))_({ Pi_I \( A \) = { A } }) quad \( A eq.not diameter \) \, #h(2em) c_I^R \( A \) = upright(bold(1))_({ upright("every block of ") Pi_I \( A \) upright(" meets ") R }) \, quad R subset A . $

The latter indicator is one for $A = R = diameter$. It is zero for nonempty $A$ and empty $R$.

If $A$ and $B$ are disjoint, their two trajectories in the following definition are computed #emph[separately]:

$ tau_I \( A \, B \) = upright(bold(1))_({ exists u in \[ 0 \, delta \] \, med i in A \, med j in B : \| X_i^A \( u \) - X_j^B \( u \) \| lt.eq epsilon }) \, #h(2em) alpha_I \( A \, B \) = 1 - tau_I \( A \, B \) . $

For a collection $cal(B)$ of disjoint force groups, use

$ tau_I \( cal(B) \, C \) = 1 - product_(B in cal(B)) alpha_I \( B \, C \) . $

The union of groups in $cal(B)$ is not assigned a new interacting flow in this notation. Its paths remain the indicated separate paths. For a prescribed collection of paths $cal(X)$ and a remaining cloud $V$, define

#[#set math.equation(numbering: n => "(3.1)")
 $ Xi_I \( cal(X) \; V \) = product_(C in Pi_I \( V \)) #scale(x: 120%, y: 120%)[\(] 1 - tau_I \( cal(X) \, C \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cell-Xi>]

The components on the right follow their isolated flows, which coincide with their restrictions of the $V$-flow. Empty products are one.

For $R subset A$ the endpoint isolation indicator is

$ e_I^R \( A \) = product_(i in R) product_(j in A \\ R) upright(bold(1))_({ \| X_i^A \( delta \) - X_j^A \( delta \) \| > epsilon }) . $

It imposes no separation between two labels of $R$. Introduce the positive measure kernel

#[#set math.equation(numbering: n => "(3.2)")
 $ sans(H)_(R \, A)^I \( Z_A \; thin d Y_R \) = e_I^R \( A \) thin delta_(\( X_i^A \( delta \) \, V_i^A \( delta \) \)_(i in R)) \( thin d Y_R \) . $ <eq:cell-H>]

The Dirac measure notation avoids introducing a density for a lower-dimensional transport kernel.

The only flow fact needed for the algebra is the following equivalence. If separate groups avoid one another throughout $I$, their separate flows are the restrictions of the flow of their union. Conversely, different blocks of $Pi_I \( S \)$ avoid one another, and their restrictions are isolated flows. Indeed cross forces vanish in the first assertion, so uniqueness proves it; the second follows from the definition of the contact graph and the same uniqueness argument.

#prodef([Definition 3.1.])[
  (A cell diagram).  For $R subset S$, with $R eq.not diameter$, a cell diagram on $\( R \, S \)$ is
  $ gamma = \( A \; Gamma_1 \, dots.h \, Gamma_ell \) . $
  Here $R subset A subset S$; the nonempty sets in all the $Gamma_g$ together partition $S \\ A$; and each $Gamma_g$ is a nonempty unordered collection of these sets. Put $Gamma_0 = { A }$. Different members of the diagram are different force groups. Let $iota_0 \( gamma \)$ be the indicator that every force group in the diagram is a union of blocks of $pi_0 \( S \)$. Equivalently, all pairs in different force groups have distance greater than $epsilon$ at $a$. Define
  #[#set math.equation(numbering: n => "(3.3)")
   $ w_I \( gamma \; Z_S \) =  & iota_0 \( gamma \) c_I^R \( A \) product_(g = 1)^ell [product_(B in Gamma_g) c_I \( B \) tau_I \( Gamma_(g - 1) \, B \) product_({ B \, C } subset Gamma_g) alpha_I \( B \, C \)] \,\
sigma \( gamma \) =  & \( - 1 \)^(sum_(g = 1)^ell \| Gamma_g \|) . $ <eq:cell-weight>]
  Only the root group $A$ uses a joint flow containing roots. In particular, a contact between different generations is a condition on separate trajectories, not a force exerted between their groups. The empty list of generations is allowed when $S = A$.
] <def:cell-diagram>

Define the signed kernel

#[#set math.equation(numbering: n => "(3.4)")
 $ sans(K)_(R \, S)^I \( Z_S \; thin d Y_R \) = sum_(gamma upright(" on ") \( R \, S \)) sigma \( gamma \) w_I \( gamma \; Z_S \) sans(H)_(R \, A)^I \( Z_A \; thin d Y_R \) . $ <eq:cell-K>]

The sum is finite. Set $sans(K)_(diameter \, diameter)^I = 1$ and $sans(K)_(diameter \, S)^I = 0$ for $S eq.not diameter$. For a function or density $g$ on the input coordinates define $cal(T)_(R \, S)^I g$ as a signed measure by

#[#set math.equation(numbering: n => "(3.5)")
 $ chevron.l psi \, cal(T)_(R \, S)^I g chevron.r = integral g \( Z_S \) integral psi \( Y_R \) sans(K)_(R \, S)^I \( Z_S \; thin d Y_R \) thin thin d Z_S . $ <eq:cell-T>]

#prodef([Remark 3.2.])[
  (One additional label).  If an extra label $e$ is initially separate from all roots, its two diagram terms are
  $ c_I^R \( R union { e } \) sans(H)_(R \, R union { e })^I #h(0.27778em) - #h(0.27778em) tau_I \( R \, { e } \) sans(H)_(R \, R)^I . $
  The first follows the full force group and the second follows the root group and a free extra particle separately. If $e$ belongs to an initial root polymer, it is mandatory and only the full-group term is present. No extra family-selection multiplicity is introduced by this identity.
] <rem:cell-single>

=== 3.2 Boolean inversion and the generation identity <boolean-inversion-and-the-generation-identity>

#thm([Proposition 3.3.])[
  (Exact cell expansion).  #emph[Let $R subset S$ and let $A_0$ be the union of the blocks of $pi_0 \( S \)$ meeting $R$. For $R eq.not diameter$, let $cal(P)$ be the collection of the other blocks of $pi_0 \( S \)$. Then 
#[#set math.equation(numbering: n => "(3.6)")
 $ sans(H)_(R \, S)^I = sum_(cal(U) subset cal(P)) sans(K)_(R \, A_0 union union.big cal(U))^I \, $ <eq:cell-subset-sum>]

 and, as an equality of signed measures, 
#[#set math.equation(numbering: n => "(3.7)")
 $ sans(K)_(R \, A_0 union union.big cal(U))^I = sum_(cal(V) subset cal(U)) \( - 1 \)^(\| cal(U) \| - \| cal(V) \|) sans(H)_(R \, A_0 union union.big cal(V))^I . $ <eq:cell-boolean>]

 Every coefficient is evaluated on its displayed input coordinates. If $m = \| S \\ R \|$, the number of diagrams in (3.4) is at most $\( C \( 1 + m \) \)^(C m)$, with a universal $C$. There is no partition of the roots in this count.]
] <cell:expansion>

#proof[
  First decompose the full flow according to its unique union of contact components meeting $R$. The flow observation preceding Definition 11 gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ sans(H)_(R \, S)^I = sum_(R subset A subset S\
A upright(" union of blocks of ") pi_0 \( S \)) c_I^R \( A \) sans(H)_(R \, A)^I Xi_I \( { A } \; S \\ A \) . $ <eq:cell-root-decomposition>]
  Precisely one term has its two component indicators nonzero: the actual union of rooted contact components. Endpoint isolation of $R$ against the rest of $S$ can then be checked inside $A$, because $A$ and its complement avoid throughout the cell.
  Here is the finite identity that expands the last factor. Fix $cal(X)$, and consider a collection $cal(B)$ of disjoint nonempty subsets of $V$, each a union of the fixed initial polymers. Put $U_(cal(B)) = union.big cal(B)$ and
  $ d_I \( cal(B) \) = product_(B in cal(B)) c_I \( B \) product_({ B \, C } subset cal(B)) alpha_I \( B \, C \) . $
  Then
  #[#set math.equation(numbering: n => "(3.9)")
   $ Xi_I \( cal(X) \; V \) = sum_(cal(B)) \( - 1 \)^(\| cal(B) \|) d_I \( cal(B) \) product_(B in cal(B)) tau_I \( cal(X) \, B \) Xi_I \( cal(B) \; V \\ U_(cal(B)) \) . $ <eq:cell-generation-recursion>]
  The term with $cal(B) = diameter$ equals one. To prove (3.9), expand the product (3.1) over subsets of its actual components. A given collection $cal(B)$ consists of components of $V$ exactly when its members are connected, mutually avoid, and avoid the remaining $V \\ U_(cal(B))$ flow. These conditions are respectively $product c_I \( B \)$, the pair product in $d_I$, and the last $Xi_I$ in (3.9). On their support the required flows agree. This proves the formula, including all signs.
  Apply (3.9) repeatedly to (3.8). Every nonempty selection strictly decreases the number of remaining labels, so the process terminates. At termination its coefficient is exactly (3.3)–(3.3); the unselected labels have no remaining restriction. Grouping by the union of selected initial polymers proves (3.6). The initial partition of such a union is the restriction of $pi_0 \( S \)$, so its coefficient is exactly the kernel defined in (3.4), not a kernel depending on unselected coordinates. Finite Boolean inversion proves (3.7).
  There are at most $2^m$ choices of $A \\ R$, at most $m^m$ partitions of the remaining labels, and at most $m^m$ assignments of their blocks to successive nonempty generations. This proves the count, with the cases $m = 0 \, 1$ understood separately. ◻
]

=== 3.3 Expectations and normalization <expectations-and-normalization>

For any finite random cloud let its scaled factorial measure with external isolation be denoted by $tilde(F)_R$. Its weak definition is the usual factorial sum with the additional indicator that every label outside the displayed set has distance greater than $epsilon$ from it. This definition permits internal contacts. For the actual evolved initial ensemble, all exponential moments of the total particle number are finite. Indeed its initial probability of $N = n$ is bounded by $mu^n \/ n !$, and $N$ is conserved.

#thm([Corollary 3.4.])[
  (Factorial normalization).  #emph[For the actual microscopic cloud and $r = \| R \|$, the cell identity is written after relabelling the ordered roots as $R = { 1 \, dots.h \, r }$: 
#[#set math.equation(numbering: n => "(3.10)")
 $ tilde(F)_R \( b \) = sum_(m gt.eq 0) frac(mu^m, m !) cal(T)_(R \, R union.sq { r + 1 \, dots.h \, r + m })^I tilde(F)_(r + m) \( a \) . $ <eq:cell-factorial>]

 The right side is interpreted with each finite Boolean coefficient grouped before summing over $m$. Equivalently, one may first restrict the ensemble to $N lt.eq M$, apply the finite identity, and then let $M arrow.r oo$. No assertion of absolute summability of the #emph[ungrouped] generation series is made here.]
] <cor:cell-factorial>

#proof[
  Apply (3.6) to each ordered tuple of roots in a realization of the cloud at $a$. A selected union of its initial polymers is exactly an externally isolated displayed subset at $a$. Consequently the expectation of each selected union uses $tilde(F)_(r + m) \( a \)$. Its $m$ extra labels were unordered, whereas the factorial sum orders them, giving the divisor $m !$. The scaling of the original $r$ roots is $mu^(- r)$, and that of the new factorial measure is $mu^(- \( r + m \))$, giving $mu^m$.
  For a bounded test $psi$, Boolean inversion bounds a coefficient in total variation by $2^(\| cal(U) \|) parallel psi parallel_oo$. Summing this over all selected polymer subsets in a fixed cloud costs at most $3^N parallel psi parallel_oo$, and the root tuple count costs at most $N^r$. The integrable bound $mu^(- r) N^r 3^N parallel psi parallel_oo$ justifies the stated grouped limit. Expanding every large-order coefficient into all its diagrams before taking absolute values would give a different, unproved convergence assertion and is unnecessary. ◻
]

=== 3.4 Factorization on all displayed trajectories <factorization-on-all-displayed-trajectories>

#thm([Proposition 3.5.])[
  (Diagramwise factorization).  #emph[Split the labels into $S = S_1 union.sq S_2$ and the roots into $R = R_1 union.sq R_2$, where $R_i subset S_i$. Let $gamma_i$ be a diagram on $\( R_i \, S_i \)$. Define $eta_I \( gamma_1 \, gamma_2 \)$ to be the indicator that every displayed particle trajectory of $gamma_1$ has distance greater than $epsilon$ throughout $I$ from every displayed trajectory of $gamma_2$. This includes detached groups and includes the initial and terminal times. For a single global diagram $gamma$, define $eta_I \( gamma \; S_1 \, S_2 \)$ by the same condition between its labelled paths in $S_1$ and $S_2$, using their prescribed force-group flows.]
  #emph[On this indicator, merge the two root groups, and take the union of the two batches at each generation, padding a finished list by empty batches. This gives a diagram on $\( R \, S \)$. Conversely, every nonzero diagram term satisfying $eta_I \( gamma \; S_1 \, S_2 \) = 1$ splits uniquely in this manner. Its detached groups necessarily belong to one $S_i$, and its root flow splits over its two intersections with $S_i$. Under this bijection the signed transport measures, with this indicator imposed, agree with the tensor product of the two diagram transport measures: 
#[#set math.equation(numbering: n => "(3.11)")
 $ sigma \( gamma \) w_I \( gamma \) sans(H)_(R \, A)^I thin eta_I = eta_I #scale(x: 120%, y: 120%)[\[] sigma \( gamma_1 \) w_I \( gamma_1 \) sans(H)_(R_1 \, A_1)^I ⊗ sigma \( gamma_2 \) w_I \( gamma_2 \) sans(H)_(R_2 \, A_2)^I #scale(x: 120%, y: 120%)[\]] . $ <eq:cell-factorization>]

 Summation over the bijection preserves this equality. Factorial weights split as 
#[#set math.equation(numbering: n => "(3.12)")
 $ binom(m_1 + m_2, m_1) frac(mu^(m_1 + m_2), \( m_1 + m_2 \) !) = frac(mu^(m_1), m_1 !) frac(mu^(m_2), m_2 !) . $ <eq:cell-factorial-split>]

]
] <cell:factorization>

#proof[
  Cross avoidance makes the joint root flow equal to the two separate root flows. Its rooted-component and endpoint-isolation indicators therefore split. Initial-polymer admissibility also splits, since all cross initial distances are greater than $epsilon$. Within a merged generation, all additional cross avoidance factors are one. A detached component in $S_i$ can touch the preceding generation only through that generation’s $S_i$ part. Hence its touch indicator is exactly its original touch indicator. The number of detached groups is additive, so the signs multiply. The output Dirac measures split with the root flow. These facts give (3.11).
  For the inverse map, a connected detached group cannot contain labels from both families: a connected graph across that partition would have a cross contact, contrary to $eta_I = 1$. The same avoidance splits the root group’s flow by uniqueness. A nonempty generation in one family must have a predecessor in that same family unless it is the first generation: otherwise its required touch indicator vanishes. There can therefore be no gap followed by a later nonempty generation in one family. Removing its terminal empty batches produces its unique local generation list. This proves the asserted bijection. Formula (3.12) is the ordinary ordered-label count. ◻
]

The avoidance condition in Proposition 15 is #emph[diagramwise]. It is not a single condition on the flow of $S$. For example, a third particle can deflect a prospective collision partner away from a root in the full flow while a smaller subflow still changes that root. Such configurations are included in the subset coefficient and cannot be removed using full-flow separation. For more than two factors the proposition applies successively; its indicator must include all displayed paths from all factors. This is the precise factorization used by the centered identities below.

=== 3.5 A deterministic stopped identity <a-deterministic-stopped-identity>

We give a stopped version before any probabilistic tail estimate. Its stopping parameter $k$ counts all selected labels, including the roots. The threshold is allowed to include labels already selected in later cells: in that case subtract that fixed offset from the remaining threshold in the construction below.

Order components by the lexicographically least initial position in each component; denote this position by $kappa \( C \) in bb(R)^3$. Different actual contact components have different such positions, since particles with the same initial position belong to the same initial polymer. This is a measurable, label-equivariant deterministic order. The following elementary weighted product identity is useful. For $I_1 \, dots.h \, I_n in { 0 \, 1 }$, positive integer weights $w_1 \, dots.h \, w_n$, and an integer $d > 0$, let $w \( J \) = sum_(j in J) w_j$. Then

#[#set math.equation(numbering: n => "(3.13)")
 $ product_(j = 1)^n \( 1 - I_j \) =  & sum_(J subset { 1 \, dots.h \, n }\
w \( J \) < d) \( - 1 \)^(\| J \|) product_(j in J) I_j\
 & + sum_(diameter eq.not J subset { 1 \, dots.h \, n }\
w \( J \\ { max J } \) < d lt.eq w \( J \)) \( - 1 \)^(\| J \|) product_(j in J) I_j product_(j > max J) \( 1 - I_j \) . $ <eq:cell-stopped-product>]

To verify it, expand the factors in their prescribed order, stopping a branch at its first selected factor whose accumulated weight is at least $d$. Branches that finish without stopping are the first sum, and stopped branches are the second. The factors remaining on a stopped branch lie in $\[ 0 \, 1 \]$.

Apply (3.13) to $Xi_I \( cal(X) \; V \)$, with the actual components of $V$ as its ordered indices, $I_j = tau_I \( cal(X) \, C_j \)$ and $w_j = \| C_j \|$. For a selected collection $cal(B)$, denote its last component in this order by $B_(*)$ and set $V' = V \\ U_(cal(B))$. After extracting the selected components, the extra factor on a stopped branch is

#[#set math.equation(numbering: n => "(3.14)")
 $ theta.alt_I \( cal(X) \, cal(B) \; V' \) = Xi_I \( cal(B) \; V' \) product_(C in Pi_I \( V' \)\
kappa \( C \) >_(upright("lex")) kappa \( B_(*) \)) #scale(x: 120%, y: 120%)[\(] 1 - tau_I \( cal(X) \, C \) #scale(x: 120%, y: 120%)[\)] . $ <eq:cell-stop-theta>]

It belongs to $\[ 0 \, 1 \]$. The condition that the selected components are actual components of $V$ is represented, exactly as in (3.9), by $d_I \( cal(B) \)$ and the first factor in (3.14). On that condition the order of the components of $V$ is the merged order of $cal(B)$ and $Pi_I \( V' \)$, which proves (3.14). Completed branches with $\| U_(cal(B)) \| < d$ use the full extraction identity and continue with $Xi_I \( cal(B) \; V' \)$. A nonempty continued batch strictly decreases the number of remaining labels.

#thm([Proposition 3.6.])[
  (Stopped cell expansion and positive domination).  #emph[For $k > \| R \|$, the finite-cloud expansion equals its complete diagrams with fewer than $k$ selected labels plus a finite signed remainder. Each remainder term is of one of the following types.]
  + #emph[Its root group $A$ already has $\| A \| gt.eq k$. Its transport is $c_I^R \( A \) sans(H)_(R \, A)^I$ times the factor $Xi_I \( { A } \; S \\ A \) in \[ 0 \, 1 \]$.]
  + #emph[Its completed generations and its final partial generation select a union $U$ with $\| U \| gt.eq k$. Immediately before the last selected component $B_(*)$, the number of selected labels is less than $k$. All displayed groups satisfy the connectivity, initial-polymer, same-generation avoidance, and preceding-generation touch conditions of Definition 11. Its weight is the corresponding sign and indicators times a factor $theta.alt_I$ of the form (3.14), lying in $\[ 0 \, 1 \]$.]
  #emph[In the second case the overshoot is by at most one additional component. In particular, if every component of every trial subsystem formed from initial polymers has size at most $D$, then $\| A \| lt.eq \| R \| D$, and a stopped union has size at most $max { \| R \| D \, k - 1 + D }$.]
  #emph[Replacing the sign by $+ 1$ and dropping the last factor gives a pointwise positive domination of the total variation of the remainder. Its expected version is a sum of these positive contact expressions integrated against the initial isolated factorial measures of the selected unions, with the factors $mu^m \/ m !$ of (3.10). This is an identity and a domination statement, not a claim that this sum tends to zero.]
] <cell:stopping>

#proof[
  Use (3.8). Stop a summand immediately if its root group reaches the threshold. Otherwise apply the weighted product expansion with $d = k - \| A \|$, extract its selected components, and continue its nonempty completed selections by the same rule with the updated remaining threshold. Empty selections terminate a complete diagram. The explicit finite identities (3.13) and (3.14) prove the resulting equality at every stage. A diagram of total size less than $k$ never triggers the stopping rule and appears with exactly its original coefficient. Every other branch stops in one of the two stated ways.
  Weights are positive before their displayed inclusion-exclusion sign, and the unexpanded factors are in $\[ 0 \, 1 \]$, proving the variation bound. All selected groups are unions of the original initial polymers. Their union is consequently externally isolated in the original cloud at the initial cut; removing the last factor does not remove this initial-polymer selection condition. Taking factorial expectations therefore gives the asserted input measures and normalization. On the stated trial-component bound each component of the root group contains a root and has at most $D$ labels, proving $\| A \| lt.eq \| R \| D$; the other size bound follows from the one-component overshoot.
  These expected finite stopped identities are well defined for the grand ensemble without a tail theorem. Prior to the last selected component there are fewer than $k$ selected labels, and therefore at most $k$ selected groups. The root-large branch has one group. At fixed $k$ the number of stopped descriptions in an $N$-particle cloud is bounded by $C_k^(N + 1)$: assign each label to one of at most $k + 2$ group or remainder slots, and then order the bounded number of selected groups and generations. The exponential moments of $N$, with its root-tuple polynomial factor, justify expectation and the finite-$N$ limit. This argument establishes finiteness only; it supplies no useful uniform bound as $epsilon arrow.r 0$. ◻
]

=== 3.6 Whole-cell histories <whole-cell-histories>

#prodef([Definition 3.7.])[
  (A prescribed whole-cell history).  A finite whole-cell history is a composition of the diagram kernels above on successive cells, together with any tensor products and singleton-slot deletions or independent insertions specified by the exact centered identities at layer cuts. Its discrete prescription records the following data:
  + every formal label and its lifetime, with a fresh label for each independent input and no reuse of an independent source;
  + on each occupied cell, the required root labels $R$, the full set $S$, its root force group, and its detached groups and generations;
  + all the indicators in (3.3) and the endpoint isolation indicators, including the initial polymer restrictions restored at every deleted singleton slot;
  + the signs, factorial weights, and any deterministic stopping marks and unexpanded factors.
  On an ordinary hierarchy cell, labels in $R$ persist through its upper endpoint; labels in $S \\ R$ end their cell lifetime there. In the forward direction they were present throughout the cell, not created at a first-contact time. The root group is isolated from its departing members at the upper endpoint by $e_I^R \( A \)$. Detached groups have separate force systems; their geometric contacts with other generations at that endpoint are unrestricted. At the lower endpoint all force groups are unions of initial polymers. At a layer cut a nonsingleton polymer remains intact; independent singleton inputs are inserted only with the full polymer-pattern restrictions of the centered identity.
  The size $p$ is the number of distinct formal label lifetimes, not the number of their repeated appearances at cuts. All transport maps and indicators are defined on the full coordinates of these lifetimes. A history with a stopped factor can still depend on the unexpanded microscopic cloud through its last factor in $\[ 0 \, 1 \]$; its positive majorant drops that factor.
] <cell:histories>

There is also a positive version needed before a stopped cell. If a nonnegative observable of displayed labels, carrying their external isolation indicator at the top of a cell, is evaluated along the actual cloud, extract its actual union of whole-cell components containing those labels, as in (3.8). Retain its root endpoint isolation requirement and drop external avoidance against the remaining cloud for an upper bound. Repeat backwards over earlier cells. This produces only positive root-group histories, each connected by contacts to the preceding required set, with whole initial polymers at each cut. The construction is an exact decomposition followed by inequalities between nonnegative functions. Polynomial caps or probabilities for such histories are not presumed in this definition; they are proved in 7.2.

=== 3.7 The terminal boundary of a positive witness <the-terminal-boundary-of-a-positive-witness>

The positive histories just described retain the usual endpoint isolation at every cut. To detect a large component in the actual cloud, we will also use a final block whose distinguished label may still be interacting at the observation endpoint. The next variant keeps that entire final force group in the integral. This boundary condition is needed for the energy estimate as well as for the witness construction in Section 7.

#prodef([Definition 3.8.])[
  (An unisolated terminal witness block).  A terminal witness is permitted a different upper boundary condition from an ordinary hierarchy cell. For $R subset A$ put
  #[#set math.equation(numbering: n => "(3.15)")
   $ sans(J)_(R \, A)^I \( Z_A \; thin d Y_R \) = delta_(\( X_i^A \( delta \) \, V_i^A \( delta \) \)_(i in R)) \( thin d Y_R \) \, $ <eq:cell-J>]
  with no endpoint isolation factor. Its exact positive root-component decomposition is
  #[#set math.equation(numbering: n => "(3.16)")
   $ sans(J)_(R \, S)^I = sum_(R subset A subset S\
A upright(" union of blocks of ") pi_0 \( S \)) c_I^R \( A \) sans(J)_(R \, A)^I Xi_I \( { A } \; S \\ A \) . $ <eq:cell-unisolated-root-decomposition>]
  Indeed the unique actual union of rooted contact components is still the unique nonzero summand, and its root trajectories agree with the full ones. This proves the identity without asserting endpoint isolation. Integrating a nonnegative test and dropping its last avoidance factor gives the corresponding positive bound.
  For a terminal witness block, all selected force groups end their formal lifetimes together at the fixed upper endpoint $b$. The distinguished labels $R$—usually a single label—serve only for factorial normalization and spatial integration anchors. They do not persist as a force subsystem after that endpoint. All terminal coordinates of every selected group are retained in the integration and energy bookkeeping before any projection in (3.15). In particular one keeps the full terminal group Hamiltonians; one does not split $R$ away from close companions. Geometric isolation of $R$ from $A \\ R$ at $b$ is neither required nor inferred.
  A selected block may also carry a measurable nonnegative trajectory indicator $W_I \( A \; Z_A \) lt.eq 1$ specifying the witness. Such an indicator is evaluated on its isolated group flow. If the witness was identified at an earlier time inside the cell, keep that prefix condition and continue the isolated group to the fixed endpoint $b$ before using whole-cell coordinates. This is a finite prescription with an extra indicator, not a stopping-time change of phase-volume variables. Establishing that an actual bad event admits a selected witness of this form belongs to 7.2.
  At every earlier cut the ordinary rules of Definition 17 remain in force. In particular, a selected union is initially externally isolated and its backward continuation across the preceding cell retains the usual endpoint isolation indicator. Only the final witness boundary uses (3.15). These are formal operations in the witness integral; the microscopic evolution is not stopped or modified.
] <def:cell-terminal-witness>

=== 3.8 Contact records and coordinate refinements <cell:contact-records>

The ownership rule at a centered cut needs a record of which contacts connect new labels to the old array. We specify the data here; Lemma 29 constructs the corresponding integration charts and proves their Jacobian and counting bounds.

For each occupied cell and each original tensor factor, an #emph[original contact record] is an ordered list of edges between displayed labels. An edge records its two labels and either their relative displacement at an endpoint overlap or their contact time and sphere normal. Starting at the late endpoint, with all old labels in one anchored coordinate group and the new labels in separate groups, each edge joins two groups not previously joined. The edge list connects every new label to the old array. Endpoint overlaps are processed first; subsequent edges are ordered by successive first backward contacts, with the prescribed deterministic tie rule. All edges stay within the original tensor factor. When there is exactly one added label across the cell and it is separated from its own roots at the late endpoint, the record retains its first backward contact with that factor and the old label met there as its original parent. These groupings record contact coordinates; they do not replace any prescribed force group.

The algebraic generations and the geometric pinning forest need not coincide. A diagram can be partitioned measurably according to the first contact of a floating group with #emph[any] already displayed path, including a path from another tensor factor. Such a partition inserts indicators whose sum is one on the original term, and leaves its force systems, signs, and original required contact indicators unchanged. A cross-factor geometric pin is therefore permitted even if it is not an edge of its algebraic generation. All equalities above survive any such measurable refinement. The Jacobians and causal properties of the refinements used for estimates are proved separately in 29; they are not consequences of Boolean inversion alone.

== 4 Centering at the layer cuts <sec:centering>

We subtract independent kinetic factors while keeping each nonsingleton interaction component intact. Correlation errors obtained by removing independent factors were developed in #cite(label("PulvirentiSimonella2017")); their propagation across time layers with the earlier histories retained is central to #cite(label("DHM25")). This section proves the componentwise centering identities needed for the present potential class. We obtain an exact recurrence across the layers, then show that each surviving centered root must lead to a small input or to a contact that prevents its family from evolving independently.

=== 4.1 The patternwise transform <the-patternwise-transform>

For a partition $pi$ of a finite label set $R$, write $chi_pi^epsilon \( Z_R \)$ for the indicator that the connected components of ${ { i \, j } : \| x_i - x_j \| lt.eq epsilon }$ are exactly the blocks of $pi$. Let $S \( pi \)$ be the set of labels in singleton blocks and let $B \( pi \) = R \\ S \( pi \)$. For $A subset S \( pi \)$, the partition $pi_A$ consists of the nonsingleton blocks of $pi$ and the singletons in $A$; its label set is $B \( pi \) union A$. We use $f_D \( t \, Z_D \) = product_(i in D) f \( t \, z_i \)$, with $f_diameter = 1$.

#prodef([Definition 4.1.])[
  (Patternwise centered marginal).  The centered marginal on pattern $pi$ is
  #[#set math.equation(numbering: n => "(4.1)")
   $ E_pi^epsilon \( t \, Z_R \) = chi_pi^epsilon \( Z_R \) sum_(A subset S \( pi \)) \( - 1 \)^(\| S \( pi \) \\ A \|) f_(S \( pi \) \\ A) \( t \, Z_(S \( pi \) \\ A) \) tilde(F)_(B \( pi \) union A)^epsilon \( t \, Z_(B \( pi \) union A) \) . $ <cent:definition-eq>]
  We set $E_diameter^epsilon = 1$. A nonsingleton block is always retained as a whole; its individual labels are not centered.
] <cent:definition>

The indicator in (4.1) belongs to the full array. For example, deleting a singleton $i$ from a lower marginal does not remove the conditions $\| x_i - x_j \| > epsilon$ for the other displayed labels. These conditions multiply the lower marginal and the independent factor $f \( t \, z_i \)$.

#thm([Proposition 4.2.])[
  (Centering and inversion).  #emph[For every $pi$ and almost every $Z_R$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ chi_pi^epsilon tilde(F)_R^epsilon \( t \) = chi_pi^epsilon sum_(A subset S \( pi \)) f_(S \( pi \) \\ A) \( t \) E_(pi_A)^epsilon \( t \) . $ <cent:inverse>]

 Both formulas hold for arbitrary factorial densities, without a smallness or factorization assumption.]
] <cent:identity>

#proof[
  On ${ chi_pi^epsilon = 1 }$ every restricted pattern $pi_A$ has indicator one. Substitute (4.1) on the right of (4.2). For $D subset S \( pi \)$, the coefficient of $f_(S \( pi \) \\ D) tilde(F)_(B \( pi \) union D)^epsilon$ is
  $ sum_(D subset A subset S \( pi \)) \( - 1 \)^(\| A \\ D \|) = \( 1 - 1 \)^(\| S \( pi \) \\ D \|) . $
  Only $D = S \( pi \)$ survives. Off that pattern both sides vanish. ◻
]

#thm([Corollary 4.3.])[
  (Collapsing the pattern sum).  #emph[For $D subset R$ let 
#[#set math.equation(numbering: n => "(4.3)")
 $ iota_D^R \( Z_R \) = product_(i in D) product_(j in R \\ { i }) upright(bold(1))_({ \| x_i - x_j \| > epsilon }) \, #h(2em) cal(E)_R = sum_(pi in cal(P) \( R \)) E_pi \, $ <cent:singleton-deletion>]

 where $cal(P) \( R \)$ is the set of partitions of $R$. Then 
#[#set math.equation(numbering: n => "(4.4)")
 $ cal(E)_R & = sum_(D subset R) \( - 1 \)^(\| D \|) iota_D^R f_D tilde(F)_(R \\ D) \,\
tilde(F)_R & = sum_(D subset R) iota_D^R f_D cal(E)_(R \\ D) . $ <cent:collapsed-centering>]

 Thus a cut carries subset choices, but no additional factor equal to the number of partitions. For arbitrary signed families $G$ and $e$ with each $e_pi$ supported on its pattern, write 
$ parallel G parallel_(1 \, lt.eq U) = max_(0 lt.eq r lt.eq U) parallel G_(\[ r \]) parallel_1 \, #h(2em) parallel e parallel_(pi \, 1 \, lt.eq U) = max_(0 lt.eq r lt.eq U) sum_(pi in cal(P) \( \[ r \] \)) parallel e_pi parallel_1 . $

 Let $sans(M)_t$ be the transform (4.1) and $sans(I)_t$ its inverse (4.2), summed over full patterns. They satisfy 
#[#set math.equation(numbering: n => "(4.5)")
 $ parallel sans(M)_t G parallel_(pi \, 1 \, lt.eq U) lt.eq 2^U parallel G parallel_(1 \, lt.eq U) \, #h(2em) parallel sans(I)_t e parallel_(1 \, lt.eq U) lt.eq 2^U parallel e parallel_(pi \, 1 \, lt.eq U) . $ <cent:centering-norm>]

]
] <cent:pattern-collapse>

#proof[
  At a fixed array exactly one full pattern occurs. Its singleton labels are exactly the labels which may belong to a set $D$ with $iota_D^R = 1$. Deleting these labels leaves the unique restricted pattern. Summing (4.1) and (4.2) therefore gives (4.4)–(4.4). For disjoint $D \, A$ one can also check inversion directly from
  $ iota_D^R thin iota_A^(R \\ D) = iota_(D union A)^R $
  and the binomial cancellation in Proposition 20. Because pattern supports are disjoint, the sum of the patternwise absolute values is the absolute value of their assembled density. Taking absolute values in the collapsed formulas, dropping $iota_D^R lt.eq 1$, and integrating each deleted factor using $integral f \( t \) = 1$ proves (4.5). ◻
]

At time zero, the insertion formula of Proposition 4 gives $E_pi^epsilon \( 0 \) = 0$ if $B \( pi \) eq.not diameter$: every term in (4.1) retains all nonsingleton blocks, hence contains a close pair on the full pattern and has zero initial factorial density. The full-array indicator remains in place when singleton labels are deleted. For a singleton pattern with $k$ labels, the separated-array estimate of that proposition gives

#[#set math.equation(numbering: n => "(4.6)")
 $ \| E_pi^epsilon \( 0 \, Z_R \) \| lt.eq \( C epsilon^c \)^k f_(0 \, R) \( Z_R \) . $ <cent:initial-use>]

In particular, this small initial factor is attached to each retained singleton slot, rather than to each layer through which it is carried.

=== 4.2 An explicit one-root reference sum <an-explicit-one-root-reference-sum>

We next construct the signed binary histories against which an independently evolving singleton family will cancel. Their construction determines the exact pairing in Proposition 23. The separate comparison with $f \( t \)$ bounds the residual left by this replacement at one fixed Gaussian exponent.

Fix $u < t$ with $t - u lt.eq b$. Use the cells of this layer, of length at most $b \/ J$. In the following construction $z_1 \( t \) = z$ is fixed. A tree with $n$ births has chronological backward labels $2 \, dots.h \, n + 1$, ordered times

$ t > s_1 > dots.h.c > s_n > u \, #h(2em) a_i in { 1 \, dots.h \, i } \, quad sigma_i in { + \, - } . $

At $s_i$ label $i + 1$ is placed at $x_(a_i) \( s_i \) + epsilon omega_i$, with velocity $w_i$; write $g_i = w_i - v_(a_i) \( s_i + \)$. Here $omega_i in bb(S)^2$ and $g_i dot.op omega_i > 0$. The plus choice follows the isolated two-body flow backward from this outgoing sphere crossing until the incoming sphere crossing, then continues the two lines freely. The minus choice continues both lines freely through the ball. Its sign is $- 1$. All other lines move freely while this pair is being resolved. The contact time is an integration parameter, not a force-system cut: the new label also has its outgoing free segment from $s_i$ to the #emph[upper boundary of its insertion cell]. Its formal lifetime ends at that cell boundary, where it is separated from the other labels. That outgoing segment is a displayed trajectory in every avoidance test, for both signs. The free passage has duration $2 epsilon \( g_i dot.op omega_i \) \/ \| g_i \|^2$; the true passage has the duration controlled by Lemma 5.

Keep only parameters for which each scheduled pair passage finishes before the earlier boundary of its insertion cell, no two births of this tree occupy one cell, and there are no other contacts between any of its displayed lines. At every cut at which a line starts or stops, require separation from the other displayed lines. In particular the array at $u$ consists of singleton blocks. Denote this indicator by $cal(S)_n^(epsilon \, J)$. It is zero if any scheduled passage fails to exit. The resulting bottom array is $Z_(n + 1)^epsilon \( u \)$. These are #emph[reference histories]: the free negative passage is a term of a signed identity, not a modification of the particle process. A one-root displayed family satisfying these conditions is called #emph[simple].

The measure in this representation is

#[#set math.equation(numbering: n => "(4.7)")
 $ d lambda_n = product_(i = 1)^n d s_i thin d w_i thin d omega_i thin \( g_i dot.op omega_i \)_(+) . $ <cent:tree-measure>]

Surface measure is the ordinary area measure on $bb(S)^2$. To see the Jacobian directly, let $c_i$ be the upper boundary of the insertion cell. On its outgoing segment the new label’s relative position at $c_i$ is

$ x_(i + 1) \( c_i \) - x_(a_i) \( c_i \) = epsilon omega_i + \( c_i - s_i \) \( w_i - v_(a_i) \( s_i + \) \) . $

The normal component of the derivative with respect to $s_i$ is $- g_i dot.op omega_i$, and the two tangential derivatives have area factor $epsilon^2$. Thus the spatial Jacobian is $epsilon^2 \( g_i dot.op omega_i \)_(+)$. Restricting to the first backward crossing makes this parametrization one-to-one, up to the null set of tangencies. Hamiltonian volume preservation supplies the remaining phase coordinates for the plus sign; the minus sign uses free transport. The factor $epsilon^2$ is canceled by $mu = epsilon^(- 2)$. Birth labels are in chronological order, so there is no additional $1 \/ n !$ in (4.7); the ordered time domain supplies the factorial in estimates. Define

#[#set math.equation(numbering: n => "(4.8)")
 $ cal(G)_(u \, t)^(epsilon \, J \, K) \( z \) = sum_(0 lt.eq n < K - 1) med sum_(a_1 \, dots.h \, a_n) med sum_(sigma_1 \, dots.h \, sigma_n) (product_(i = 1)^n sigma_i) integral cal(S)_n^(epsilon \, J) f_(n + 1) \( u \, Z_(n + 1)^epsilon \( u \) \) thin d lambda_n . $ <cent:simple-sum>]

Here $sigma_i$ in the product means $1$ or $- 1$; the $n = 0$ term is $f \( u \, x - \( t - u \) v \, v \)$. The number of particles is strictly less than $K$.

#thm([Proposition 4.4.])[
  (Short-layer residual).  #emph[Set $beta_0 = beta \/ 2$. There is $b_(*) > 0$, depending only on the fixed bounds in Proposition 9, for which the following holds. Suppose $b lt.eq b_(*)$, $K \( epsilon \) arrow.r oo$, and $J \( epsilon \) arrow.r oo$ is a fixed power of $1 + \| log epsilon \|$. Then 
#[#set math.equation(numbering: n => "(4.9)")
 $ r_(u \, t)^epsilon = f \( t \) - cal(G)_(u \, t)^(epsilon \, J \, K) \, #h(2em) sup_(0 lt.eq u lt.eq t lt.eq T\
t - u lt.eq b) parallel r_(u \, t)^epsilon parallel_(upright("Bol") \, beta_0) = : eta_epsilon arrow.r 0 . $ <cent:residual-def>]

 All the reference sums and residuals have uniformly bounded norms at this one fixed exponent. The proof uses only short-layer tree summability and two-body scattering.]
] <cent:residual>

#proof[
  We give the majorant and the limiting argument separately. Put $p = n + 1$ and $cal(E) = \| v \|^2 + sum_(i = 1)^n \| w_i \|^2$. At every insertion sphere the pair potential is zero. Elasticity consequently gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ sum_(k = 1)^p \| v_k \( u \) \|^2 = cal(E) . $ <cent:tree-energy>]
  Intermediate pair speeds are bounded by $C \( cal(E) + p \)^(1 \/ 2)$ by stability. These bounds hold for both signs. At a birth, summing the flux over possible parents, with unused parent choices assigned zero, gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ sum_(a med upright("available")) integral_(bb(S)^2) \( \( w - v_a \) dot.op omega \)_(+) thin d omega lt.eq C p #scale(x: 120%, y: 120%)[\(] 1 + \| w \|^2 + cal(E) \/ p #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <cent:parent-sum>]
  The inequality follows from $sum_a \| v_a \| lt.eq sqrt(p sum_a \| v_a \|^2)$. It may be used successively, since its right side no longer depends on the chosen parents or the angular variables. The product satisfies
  #[#set math.equation(numbering: n => "(4.12)")
   $ product_(i = 1)^n #scale(x: 120%, y: 120%)[\(] 1 + \| w_i \|^2 + cal(E) \/ p #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C^p \( 1 + cal(E) \/ p \)^(p \/ 2) . $ <cent:velocity-product>]
  Indeed the arithmetic–geometric mean inequality bounds the product by the $n$th power of its arithmetic mean, and $sum_i \| w_i \|^2 lt.eq cal(E)$.
  Let $M$ bound both the uniform Gaussian norm and the summed spatial Gaussian norm of $f \( u \)$ at exponent $beta$. Use the spatial envelope on the continued label $1$ and the uniform bound on all other bottom labels. Every displacement of that label has length at most $C b \( cal(E) + p \)^(1 \/ 2)$. Translation of its summability boxes therefore costs at most $C \( 1 + b sqrt(cal(E) + p) \)^3$: any unit box enlarged by that radius is covered by this number of unit boxes. To handle the velocity supremum without interchanging it with the spatial sum, first split the root velocities into shells $m lt.eq \| v \| < m + 1$. On each shell the displacement radius is at most $C b sqrt(\( m + 1 \)^2 + \| W \|^2 + p)$, independently of the root velocity. Sum the spatial boxes with this enlarged radius and then sum over $m$, reserving a Gaussian factor $e^(- c m^2)$. This proves the same bound with a convergent Gaussian shell sum in place of a root supremum. Reserve the fixed Gaussian margin $beta - beta_0$. For a fixed $delta > 0$ smaller than that margin,
  #[#set math.equation(numbering: n => "(4.13)")
   $ sup_v e^(- delta \| v \|^2) integral_(bb(R)^(3 n)) e^(- delta sum_i \| w_i \|^2) \( 1 + cal(E) \/ p \)^(p \/ 2) \( 1 + b sqrt(cal(E) + p) \)^3 thin d W lt.eq C^p . $ <cent:moment-bound>]
  To verify this, use $1 + y lt.eq C_delta e^(delta y)$ with $y = cal(E) \/ p$, choose its exponent smaller than the remaining Gaussian exponent, and absorb the fixed cubic polynomial with another fixed part of that exponent. The resulting Gaussian integral is $C^n$; its root supremum is finite. Its Gaussian velocity-shell version, needed in the preceding spatial estimate, has the same $C^p$ bound. Adjusting $C$ includes the finitely many cases $p lt.eq 3$.
  The ordered simplex has volume $\( t - u \)^n \/ n !$, and $p^n \/ n ! lt.eq e^(2 p)$. Equations (4.10)–(4.13), including the $2^n$ sign choices, prove the absolute estimate
  #[#set math.equation(numbering: n => "(4.14)")
   $ ∥sum_(a \, sigma) integral cal(S)_n^(epsilon \, J) f_p \( u \, Z_p^epsilon \( u \) \) thin d lambda_n∥_(upright("Bol") \, beta_0) lt.eq C_0 \( C_1 b \)^n \, $ <cent:geometric-tail>]
  where the sum inside the norm is understood with absolute integrands. Choose $b_(*)$ so that $C_1 b_(*) < 1 \/ 2$. The identical estimate holds for instantaneous scattering trees.
  Fix now $n$ and truncate the velocity and relative insertion parameters to a compact set. The Gaussian majorant just proved makes the omitted part arbitrarily small, uniformly in $u \, t$ and $epsilon$. Remove incoming parameters whose unscaled residence time exceeds $D$, whose relative speed is too small, or which belong to the null exceptional sets of Proposition 8. Lemma 5 controls the residence-time cutoff. The omitted flux tends to zero as $D arrow.r oo$ and the other cutoffs are removed. On the retained set a true or free passage has length $O \( epsilon D \)$ and displacement $O \( epsilon D \)$. The set of insertion times lying within $C epsilon D$ of a cell boundary has measure at most $C_n J epsilon D$; two insertion times in one cell cost $C_n \/ J$. Both quantities vanish, taking $D$ fixed first. Shortened endpoint cells obey the same estimates.
  Here is the needed null-set assertion for other meetings. Parameterize each later birth by its velocity relative to its current parent in laboratory axes. This is a triangular translation of the $w_i$ variables with Jacobian one. By Galilean invariance, later relative increments do not depend on an earlier common velocity boost. At the first divergence of two distinct rays, keep the relative speed and the scalar scattering parameters fixed, and rotate the relative incident velocity and impact configuration together. The separating relative velocity has nonzero length and a spherical direction with absolutely continuous area measure. On any subsequent interval between scheduled births, the relative position of the two rays has the form
  #[#set math.equation(numbering: n => "(4.15)")
   $ \( s - s_(*) \) thin xi + Gamma \( s \) \, $ <cent:meeting-null>]
  where $s_(*)$ is their divergence time, $xi$ is that relative velocity, and $Gamma$ is a fixed affine function after the later relative increments and times have been fixed. There are finitely many such intervals. For $s eq.not s_(*)$, equality to zero confines the direction of $xi$ to a finite union of curves on a sphere, which has area zero. The interval immediately after divergence is free of other scheduled births and its nonzero relative speed separates the two rays. For a true scattering both outgoing rays must be included when identifying this divergence; their directions are not asserted to be independent. This argument also covers the free sign. Fubini’s theorem therefore excludes every unprescribed meeting for fixed $n$. Relative positions and this exceptional set are independent of the root position and root velocity, by translation and Galilean invariance. Thus the compact exceptional estimates are uniform for the root supremum in the spatial norm.
  Away from these exceptions, the microscopic paths converge to the instantaneous paths, with the same velocities outside the short pair arcs. All input positions differ by $O_n \( epsilon D \)$, while their input velocities agree exactly. The outgoing segments between a contact and its upper cell boundary have length $O \( b \/ J \)$ and are also checked for unwanted contacts. Their length tends to zero, so the same null-set argument covers their avoidance indicators. Proposition 9 and the spatial mean-value inequality give convergence of the products of input densities in the summed spatial norm, uniformly in $u \, t$. Dominated convergence in the compact parameters, followed by removal of the compact cutoffs, proves convergence of every fixed term. For uniformity in the layer length, use backward elapsed times in the fixed simplex $0 < tau_1 < dots.h.c < tau_n < b$ and restrict by $tau_n < t - u$. Extend the bottom rays freely to elapsed time $b$ in the null-set test. This tests a larger finite time interval and still has zero exceptional measure. The estimates for short arcs and endpoint cells are uniform in $t - u$. If $t - u arrow.r 0$, the terms with $n gt.eq 1$ are directly bounded by $C_n \( t - u \)^n$. These observations justify the asserted supremum over all shortened layers.
  Finally the limiting insertion integrates over the outgoing hemisphere with weight $\( g dot.op omega \)_(+)$. For the plus sign its bottom velocities are the inverse scattering velocities; for the minus sign they are the unaltered velocities. The flux-preserving scattering change of variables in Lemma 7 and the sphere-to-disk identity (2.14) identify their difference with precisely $Q_Phi$, with ordinary disk area. Iterating the mild kinetic equation on $\[ u \, t \]$ gives the instantaneous tree sum. Its remainder tends to zero by (4.14), using the same Gaussian bound for the terminal $f$; this also proves uniqueness on this short interval in the class at issue. First make the common geometric tail small, then use fixed-term convergence. This proves (4.9) without any statement about a microscopic large-history remainder. ◻
]

=== 4.3 Finite layer identities and cancellation <finite-layer-identities-and-cancellation>

Let $sans(M)_t$ denote (4.1), acting on a family of marginals of all orders and all patterns, and let $sans(I)_t$ denote (4.2), summed over the full-array patterns. They are inverse triangular transforms. Every occurrence of either transform includes its full-array pattern indicator. Fix a cap $U_j$ on the number of upper root labels and an integer $K_j gt.eq 2$. For a layer $\[ t_(j - 1) \, t_j \]$, compose the cell kernels $cal(T)_(R \, S)^I$ of Proposition 13 in backward order and stop by the #emph[physical] total size $K_j$, as in Proposition 16. Denote its completed operator by $sans(C)_j^(upright("phys") \, < K_j)$ and its exact physical remainder by $sans(R)_j^(upright("phys"))$. Before any reference-tree replacement, the exact identity is

#[#set math.equation(numbering: n => "(4.16)")
 $ tilde(F) \( t_j \) = sans(C)_j^(upright("phys") \, < K_j) tilde(F) \( t_(j - 1) \) + sans(R)_j^(upright("phys")) . $ <cent:physical-layer>]

Only this physical remainder is associated with the stopped-cloud functional of Proposition 16. For clarity, a completed physical term with successive arrays $R_0 \, dots.h \, R_J$ has pairing against an endpoint test $psi$ equal to

#[#set math.equation(numbering: n => "(4.17)")
 $ product_(c = 1)^J frac(mu^(\| R_c \\ R_(c - 1) \|), \| R_c \\ R_(c - 1) \| !) integral psi \( Z_(R_0) \) product_(c = 1)^J sans(K)_(R_(c - 1) \, R_c)^(I_c) \( Z_(R_c) \; d Z_(R_(c - 1)) \) thin G_(R_J) \( Z_(R_J) \) thin d Z_(R_J) . $ <cent:layer-kernel>]

The cell order is backward from the observation cut; intermediate integrations are kernel composition. Every factor $sans(K)$ is its finite signed generation sum with all indicators retained.

Apply the exact transforms to (4.16). In the resulting finite expression

$ hat(sans(A))_j = sans(M)_(t_j) sans(C)_j^(upright("phys") \, < K_j) sans(I)_(t_(j - 1)) \, $

replace each upper $f \( t_j \)$ factor by $cal(G)_(t_(j - 1) \, t_j)^(epsilon \, J \, K_j) + r_(t_(j - 1) \, t_j)^epsilon$. Use fresh labels for the nonroot labels of each reference tree; its root #emph[reuses the deleted upper label]. A residual is a one-body factor on that upper label and has no trajectory inside the layer. The lower inverse transform merely assigns existing lower labels to independent $f \( t_(j - 1) \)$ factors or to retained centered slots.

For each term of this expansion let $p$ count all distinct formal label lifetimes in the upper block: physical labels, reference-tree labels, and residual upper labels, counting a reused root once. Let $sans(P)_(< K_j)$ and $sans(P)_(gt.eq K_j)$ denote the projections that retain the terms with the indicated value of $p$. These are projections on the finite expanded list, not on the microscopic configuration. Define

#[#set math.equation(numbering: n => "(4.18)")
 $ sans(A)_j := sans(P)_(< K_j) hat(sans(A))_j \, #h(2em) B_j := sans(P)_(gt.eq K_j) hat(sans(A))_j \, #h(2em) hat(sans(A))_j = sans(A)_j + B_j . $ <cent:reference-mismatch>]

Here $B_j$ is a finite signed linear operator on the lower centered family, with fixed independent reference and residual factors. It is the #emph[reference cutoff mismatch], and is distinct from $sans(R)_j^(upright("phys"))$.

To record a uniform size bound, let $r lt.eq U_j$ be the full upper order and let $d lt.eq r$ upper singleton slots be deleted by $sans(M)_(t_j)$. The physical block has $q < K_j$ labels. Each of the $d$ deleted slots contributes either a reference tree with fewer than $K_j$ labels, including its reused root, or one residual label. Consequently every term in $B_j$ has

#[#set math.equation(numbering: n => "(4.19)")
 $ K_j lt.eq p lt.eq \( K_j - 1 \) + d \( K_j - 1 \) lt.eq \( U_j + 1 \) \( K_j - 1 \) < \( U_j + 1 \) K_j \, #h(2em) h_0 = r lt.eq U_j . $ <cent:mismatch-size>]

The case of no physical root uses $q = 0$ and satisfies the same bound. No reference root creates an additional restarting top.

The exact centered recurrence is now

#[#set math.equation(numbering: n => "(4.20)")
 $ E \( t_j \) = sans(A)_j E \( t_(j - 1) \) + sans(M)_(t_j) sans(R)_j^(upright("phys")) + B_j \[ E \( t_(j - 1) \) \] . $ <cent:layer-identity>]

Its finite iteration gives

#[#set math.equation(numbering: n => "(4.21)")
 $ E \( t_L \) =  & sans(A)_L dots.h.c sans(A)_1 E \( 0 \)\
 & + sum_(j = 1)^L sans(A)_L dots.h.c sans(A)_(j + 1) {sans(M)_(t_j) sans(R)_j^(upright("phys")) + B_j \[ E \( t_(j - 1) \) \]} . $ <cent:finite-layers>]

Both remainder types remain in this identity. In particular the input of $B_j$ is the true lower centered family. Its estimate in Section 7 expands that input only in layers strictly earlier than $j$, treating this finite mixed upper block as uncentered. It does not use positive stopped-cloud domination for $B_j$, or assume an estimate of its own layer’s remainder. All these identities can first be read with the finite particle-number restriction of Corollary 14.

#thm([Proposition 4.5.])[
  (Exact simple-family cancellation).  #emph[In the retained operator $sans(A)_j$ of (4.18), a singleton root whose displayed family satisfies the reference-history conditions $cal(S)_n^(epsilon \, J)$ above, ends entirely on independent $f \( t_(j - 1) \)$, and avoids every displayed trajectory of every other family throughout the layer cancels with its tensor-subtraction term. The avoidance requirement includes all detached generation groups and all reference trees coming from tensor subtraction. It also includes the full-array pattern restrictions at cuts. A residual factor is treated as a stopped slot, not as an unexamined trajectory. The pairing is exact coefficientwise for total formal size $p < K_j$. The finite complementary operator $B_j$ stays in (4.20); no cancellation or positive physical remainder bound is asserted for it.]
] <cent:cancellation>

#proof[
  Retain a tag saying whether each centered singleton root belongs to the microscopic marginal in $sans(M)_(t_j)$ or to its negative $f \( t_j \)$ factor. In either case expand a simple candidate family all the way to the lower cut and label every line it displays. Split the domain of every diagram into the event of no cross contact with this family and its complement.
  On the no-cross-contact event, Proposition 15 splits the cell generation diagram into its restriction to that family and its restriction to the other families. Explicitly, the root subsystem flow splits; a detached connected group cannot meet two families; each generation is the disjoint union of its family generations. Deleting empty terminal generations in each restriction and padding them when merging are inverse operations. The signs are the products of the signs of the two restrictions, and the within-generation avoidance tests split. This statement uses the trajectories in the displayed signed diagram, including the detached ones. Avoidance merely in the full interacting system would not justify any of these operations.
  The one-label rule in each occupied cell is exactly the plus/minus insertion used in (4.7). Empty cells propagate freely. Thus the family restriction is one of the terms of (4.8), with identical times, sphere normals, velocities, indicators, and input factors on the two tagged sides. The inverse transform at the lower cut supplies exactly the independent $f$ factors on its leaves. Restoring the full pattern indicators makes the deletion and reinsertion operations inverse also at the cuts. In particular, a nonsingleton polymer cannot enter this pairing.
  If $m$ extra labels split into $r$ in this family and $m - r$ in the rest, the label choice contributes $binom(m, r)$ and
  $ frac(mu^m, m !) binom(m, r) = frac(mu^r, r !) frac(mu^(m - r), \( m - r \) !) . $
  Applying this in the occupied cells proves equality of the measures and all factorial coefficients. Change only the root tag. The centering sign reverses and every other factor stays the same. The first eligible root in a fixed order defines an involution: eligibility depends on the displayed paths and lower retained slots, which the tag change preserves. The paired contributions sum to zero.
  Perform the pairing coefficient by coefficient for $p < K_j$, counting all formal lifetimes and reusing the upper root label when its tag changes. Both the resulting physical block and each individual reference tree then have size less than $K_j$. Hence both tagged terms occur in the separately truncated expansion, and both belong to $sans(A)_j$. The pairing preserves $p$ and is an exact involution on this retained part. The complementary terms are precisely the already defined finite operator $B_j$, with the size bound (4.19); they are not identified with the physical stopped remainder. ◻
]

=== 4.4 Counting the reasons a root can survive <counting-the-reasons-a-root-can-survive>

The genealogy in this subsection is the #emph[algebraic] root-family forest. The original contact record in Section 3.8 supplies its ordered edges. The ownership rule below uses only that record; it does not partition a physical force group or presume that its contact components have one root. The coordinate Jacobians are proved later in Lemma 29.

#prodef([Definition 4.6.])[
  (Disjoint ownership).  Fix the labels, their order, and an original contact record for each occupied cell. At the top of a layer give each root label its own owner. Carry these owners backward through the cells. In a cell form the finite graph of physical and required virtual contacts of each original factor’s displayed generation diagram, including initial-polymer edges. Take the disjoint union over tensor factors; contacts with other factors remain tests and marks below, and are not used to assign original parents. The selected original pin edges, together with internal contact trees of its pinned groups, connect every new label to the old array. For an internal tree choose the lexicographically first spanning tree of the finite contact graph. Root the resulting forest at the old array, retaining the prescribed original parent in the singleton case of Section 3.8. More explicitly, process the selected edges in their record order, with the internal-tree and label orders resolving ties: keep an edge joining two distinct components when at least one is rootless, and omit an edge within one component or between two components that already contain old labels. Orient the retained trees toward their old-label endpoints. If needed, process the remaining required contact edges in the same fixed order to finish this rooted forest. Connectivity guarantees that no new label remains rootless.
  Every new label inherits the owner of its old-label endpoint; an old label never changes owner. An omitted edge between two already owned components is still a displayed contact. If its endpoint owners differ, mark both endpoint lives. Likewise mark both endpoints of every other contact between different owners, whether or not the record selected that contact as a pin. A multiple addition marks every new label and each old label participating in its pins or contacts. The #emph[family] of a root is the set of labels with that root as owner. This definition changes neither a force group nor a trajectory, and its families are disjoint by construction.
] <cent:ownership>

If a joint root force group contains several roots, they therefore keep different owners. A root–root encounter marks both participants; a new connected group touching several such roots is assigned by its chosen parent edges, while every contact to another owner marks both sides. Thus the construction introduces no partition sum over roots and does not silently replace a joint force group by separate flows. Only an unmarked family will subsequently be separated, using the absence of cross contacts and uniqueness of the prescribed flow.

For an expanded layer, also mark a displayed particle life whenever it participates in a contact outside its scheduled isolated pair passage, in a cross-family contact of displayed trajectories, in a nonsingleton cut, or in a passage that crosses a required cut or fails to finish before an interfering birth. Mark participants of a multiple addition or endpoint-overlap insertion as well. Additional parameter restrictions used later may mark further lives. The #emph[participants] of a binary event are its two labels; for a multiple event they are the added labels and every existing label whose contact or required constraint prevents its family from being simple. An unrelated root in the same cell is not a participant. A particle life here is a formal label with its prescribed lifetime; revisiting that life in another layer does not create a new life.

#thm([Proposition 4.7.])[
  (Cross-layer charge count).  #emph[Consider a term remaining after Proposition 23, with no unresolved cutoff interruption. Let $H$ count the root slots entering each expanded layer at its upper cut, including the starting roots and residual slots, summed over those layers. Retained inputs at time zero are terminal charges, not additional root occurrences in $H$. Let $h_0$ count uncentered restarting top roots, let $d$ be the number of distinct marked lives, let $r$ be the number of residual factors, and let $i$ be the number of retained singleton factors at time zero. With at most $L$ expanded layers, 
#[#set math.equation(numbering: n => "(4.22)")
 $ H lt.eq L h_0 + L^2 d + L r + L i . $ <cent:charge-bound>]

 In particular, if $H gt.eq delta p$ and $h_0 lt.eq delta p \/ \( 2 L \)$, then 
#[#set math.equation(numbering: n => "(4.23)")
 $ d + r + i gt.eq frac(delta, 2 L^2) p . $ <cent:extensive-charges>]

 The statement is purely combinatorial and imposes no smallness on an uncentered restarting top.]
] <cent:charges>

#proof[
  Use the disjoint ownership of Definition 24 in each layer. Every original singleton birth has its parent’s owner. If a family has no marked member, its births are single and every passage is isolated, complete, and separated at its required cuts. Every cross-owner contact would mark its endpoint in that family, so none exists. In a joint root force group the cross potentials therefore vanish along these trajectories, and uniqueness splits off this family’s flow. A connected detached group cannot straddle this family and another one without a cross-owner contact. Its generation diagram consequently splits by Proposition 15. This proves that an unmarked family is precisely eligible for the simple reference construction; it is not an assumption about the components of the joint root group. A centered singleton root of this family must therefore either have a residual factor, or have a retained lower singleton descendant: otherwise its family would cancel by Proposition 23. A root in a nonsingleton block is already marked.
  For each uncharged centered root choose one retained lower descendant, using the first one in a fixed order. Different unmarked families have disjoint labels, so these choices are distinct. Draw an arrow from that root occurrence to the chosen root entering the next lower expanded layer, or end its path at the chosen initial factor if the lower cut is time zero. The counted vertices are precisely the entering-layer root occurrences in $H$. Root occurrences charged to marked families have no arrow; assign each such root one marked member of its family. This assignment is injective within a layer because the families are disjoint. Residual roots and uncentered restarting roots also terminate paths. Every other vertex has one downward continuation, and every vertex receives at most one arrow. Hence the graph is a disjoint union of downward paths. Every path has at most $L$ counted root occurrences and ends at one of the specified charges.
  At most $h_0$ ends are restarting roots, at most $r$ are residual roots, and at most $i$ are initial roots. At any layer the marked family ends inject into the marked lives. One life occurs in at most $L$ layers, so there are at most $L d$ such ends. Multiplying the number of ends by the maximal path length proves (4.22). The last inequality follows immediately. ◻
]

#prodef([Remark 4.8.])[
  (Changing the pin forest).  Ordinary parent counting, compact-parameter estimates, and the terminal-subtree selection use the original forest just defined. Only the final extensive-defect estimate changes to global earliest contact coordinates; its full $p^(C p)$ multiplicity is then paid by an extensive geometric gain. No gain is assigned to an arbitrary irregular rerouting. Lemma 36 first controls premature contacts outside the original parameter exceptions, and the few remaining affected births are marked irregular.
  For a singleton whose global pin is rerouted to an earlier contact with another factor, mark its new child and its old and new parent lives, at most three labels. That earlier contact was already a cross-family contact in the algebraic diagram, and its later required original-factor encounter remains a geometric defect. For a multiple insertion retain all participant marks. This finite-participant transfer, detailed in Proposition 40, permits a fixed-factor adjustment of (4.23). It neither changes family ownership in the toggle nor asserts an additional small factor for every irregular pin.
] <cent:pin-forest>

For a fixed total number of labels, a surviving centered root has, by the same path argument, an initial factor, a residual, or a marked history. The first two contributions vanish by (4.6) and (4.9). Fixed-size marked-history contributions vanish by Corollary 41, with all independent top phase points integrated. That corollary also supplies the finite-size majorant for the small initial and residual factors. This uses only finite-history estimates and does not presume that an actual-process large history is already rare.

== 5 Finite history integrals <sec:histories>

All estimates in this section concern a finite prescribed term of Section 3. Its inputs have independent envelopes. They do not concern the probability of a good event for the interacting particle process. In particular, no estimate on an evolved factorial marginal is used here.

=== 5.1 Sources, lifetimes, and a common energy weight <sources-lifetimes-and-a-common-energy-weight>

Fix the discrete choices in a history: its labels, cell diagrams, tensor factors, and retained slots at layer cuts. Write $Gamma$ for this prescription and $cal(D)_Gamma$ for the domain of all its indicators. The number of labels is $p$ and the number of final, or restarting, roots is $h_0 gt.eq 1$. Empty scalar terms have their usual separate interpretation. Throughout this section $P = 1 + \| log epsilon \|$. Every label has one source time and one departure time. A label at a source is supplied by one independent factor; a label which survives to the top departs at the observation time. These times are fixed mesh times. The extra labels in a cell depart at its later endpoint in forward time. A contact time used below is an integration coordinate, not a time at which the prescribed force system is changed.

We also include the positive terminal witness of Definition 18. At its last cell the distinguished roots are spatial anchors and normalization labels only. There is no endpoint isolation requirement between those anchors and the other final participants. All labels of each final force group depart together, and the whole terminal Hamiltonian and all of its velocity coordinates are retained until integration. Earlier cuts obey the usual isolation rule. Thus this variant does not cut a persisting cluster into an anchor and its companions. The number $h_0$ still counts distinguished anchors; all $p - h_0$ other terminal positions are integrated by the pins below.

Let the absolute value of the source for label $i$ be bounded by

#[#set math.equation(numbering: n => "(5.1)")
 $ \| u_i \( x \, v \) \| lt.eq eta_i g_i \( x \) e^(- beta_0 \| v \|^2) \, #h(2em) sum_(k in bb(Z)^3) sup_(\| x - k \| lt.eq 1) g_i \( x \) lt.eq M \, #h(2em) 0 lt.eq eta_i lt.eq 1 . $ <eq:hist-source-envelope>]

The constants $beta_0 > 0$ and $M$ are fixed independently of the number of layers. The factors $eta_i$ record small initial or residual inputs. Put $eta_Gamma = product_i eta_i$. One can take $g_i$ to be the Gaussian-weighted velocity supremum of $u_i \/ eta_i$ when $eta_i > 0$; if $eta_i = 0$, the term is zero. Thus (5.1) follows from the norm used in Propositions 9 and 22.

Before the contact changes of variables, the absolute integral for $Gamma$ is the integral of the product of its absolute source factors over $cal(D)_Gamma$ in the $p$ source phase coordinates, multiplied by the inherited factorial coefficients and the activity factor $mu^(p - h_0)$. A test of the top phase points with absolute value at most one may be included; those phase points are integrated as well. An initial centered input is first replaced by its pointwise product bound. We never divide this integral by the mass of $cal(D)_Gamma$.

For each label retain a position and a velocity coordinate at all times in $\[ 0 \, T \]$. Before its source and after its departure freeze both coordinates. On its lifetime evolve it with its prescribed force group. At a fixed time this gives $p$ phase coordinates, including the frozen ones. Denote them by $hat(Z) \( t \)$, and write

#[#set math.equation(numbering: n => "(5.2)")
 $ S = sum_(i = 1)^p \| v_i^(upright("source")) \|^2 \, #h(2em) cal(E) = S + 2 B p . $ <eq:hist-source-energy>]

The quantity $S$ is a function of the whole history coordinates. It is not, in general, a quadratic function of the departure velocities.

#thm([Lemma 5.1.])[
  (Augmented volume and the once-counted Gaussian).  #emph[For every fixed prescription $Gamma$, the map from its $p$ source coordinates to $hat(Z) \( t \)$ is one-to-one and volume preserving outside null sets. On $cal(D)_Gamma$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(i = 1)^p \| hat(v)_i \( t \) \|^2 lt.eq S + 2 B p \, #h(2em) sup_(0 lt.eq t lt.eq T) sum_(i : thin i upright(" active at ") t) \| v_i \( t \) \|^2 lt.eq S + 2 B p . $ <eq:hist-mixed-energy>]

 In particular, with $V \( t \) = \( hat(v)_i \( t \) \)_(i = 1)^p$, 
#[#set math.equation(numbering: n => "(5.4)")
 $ e^(- beta_0 S) lt.eq e^(beta_0 B p) e^(- beta_0 \| V \( t \) \|^2 \/ 2) e^(- beta_0 S \/ 2) . $ <eq:hist-split-gaussian>]

 The same assertions hold at the last time, when the mixed coordinates consist of the top coordinates and the departure coordinates of every other label. The exponent in (5.4) is not changed at a layer cut.]
] <hist:gaussian>

#proof[
  Between two consecutive mesh times the augmented map is a product of Hamiltonian maps and identity maps. Each factor is invertible and volume preserving by Proposition 2. Injection merely changes which of the already present coordinates is active; departure changes which coordinate is frozen. Both operations are identity maps on the augmented space. A fixed prescription therefore gives a finite composition of volume preserving maps. Coincident singular positions at a switch form a null set; apply the argument first on compact sets avoiding them and then exhaust the domain.
  For the energy identity, keep the Hamiltonian of every force group. At the earlier endpoint of a cell its distinct force groups are unions of distinct whole initial polymers. Their cross potentials are zero. Thus passing from the preceding force partition to this partition changes no interaction energy. At the later endpoint the root group $A$ splits into its surviving labels $R$ and $A \\ R$. The indicator $e_I^R \( A \)$ makes their cross potentials zero. The other force groups depart in their entirety. Store the Hamiltonian of each departing group at that time. At a layer cut the singleton sources are inserted on the restored polymer pattern, so their cross potentials with each other and with all existing groups in the new force system are zero. A nonsingleton polymer is never split by this operation.
  At the top of a terminal witness all final groups are stored intact, including their distinguished anchors. No split into $R$ and $A \\ R$ is made there, and no endpoint isolation is used. The mixed tuple still has one terminal velocity for every label. This proves the same identity for the positive witness variant.
  There is a relevant distinction at a late cell endpoint. A detached group may geometrically overlap a different-generation group or the root group. Those groups had separate Hamiltonians throughout the cell. Their geometric overlap introduces no term into either Hamiltonian, and they are not merged when the detached group departs. Consequently it causes no missing cross-energy term in this calculation.
  Starting with the empty active system, conservation on open cells and the preceding switch identities give, at every time $t$,
  #[#set math.equation(numbering: n => "(5.5)")
   $ 1 / 2 sum_(i : thin upright("source")_i lt.eq t) \| v_i^(upright("source")) \|^2 = sum_(A : thin A upright(" current at ") t) cal(H)_A \( t \) + sum_(D : thin D upright(" departed by ") t) cal(H)_D \( upright("departure")_D \) . $ <eq:hist-energy-ledger>]
  The current and departed groups partition the injected labels. Stability on each group therefore subtracts at most $B$ times the number of those labels, not $B$ times that number at every cell. Adding the kinetic energy of future sources to both sides proves (5.3). Splitting the source exponential into two equal factors and using the first inequality gives (5.4). ◻
]

#prodef([Remark 5.2.])[
  (Positive potential energy is retained).  The reverse inequality $S lt.eq \| V \( T \) \|^2 + C p$ is not asserted. An interacting group can depart with large positive potential energy and small kinetic energy. Bounds on intermediate speeds consequently use $cal(E) = S + 2 B p$. The last factor in (5.4) pays for functions of this source energy. This distinction is necessary for singular repulsive cores and is also useful for bounded potentials.
] <hist:positive-potential>

Here is a convenient precise way of using that last factor. Divide the domain into the shells

#[#set math.equation(numbering: n => "(5.6)")
 $ r p lt.eq S < \( r + 1 \) p \, #h(2em) r = 0 \, 1 \, dots.h \, #h(2em) E_r = \( r + 1 + 2 B \) p . $ <eq:hist-shells>]

On such a shell every active or mixed squared-velocity sum is at most $E_r$. After reserving any fixed positive part of the last exponential in (5.4), the shell has an extra factor $e^(- c r p)$. Parent choices may now be summed using the same scalar $E_r$ on every branch. This is also a rigorous implementation of expressions of the form

#[#set math.equation(numbering: n => "(5.7)")
 $ C^p sup_(s gt.eq 0) { W \( s \) e^(- c s) } . $ <eq:hist-energy-payment>]

One must not first replace $S$ by a terminal kinetic energy, or pull its branch-dependent value through a parent sum.

=== 5.2 Translation charts on a cell <translation-charts-on-a-cell>

The following construction is used in two versions. The fine version preserves the original tensor-factor parent of a singleton addition; it is used for exponential counting. The coarse version is permitted to record every geometric contact and is used when an extensive power of $epsilon$ pays its larger combinatorial cost. Neither version alters a force in the prescribed history.

#thm([Lemma 5.3.])[
  (First-contact translation charts).  #emph[Consider one cell of length $Delta$ with $q$ prescribed terminal root labels and $m$ extra labels. Products of simultaneous cell diagrams are allowed. Keep all root coordinates and all terminal velocities fixed. On the domain where every extra label is linked by the prescribed cell contacts to a root, the extra terminal positions are covered by finitely many charts with the following properties.]
  + #emph[Each extra label costs one three-dimensional pin. A pin is either a relative endpoint displacement in $B \( 0 \, epsilon \)$, with Jacobian one, or a contact time $t$, a normal $omega in bb(S)^2$, and the Jacobian 
#[#set math.equation(numbering: n => "(5.8)")
 $ epsilon^2 \| \( v_i \( t \) - v_j \( t \) \) dot.op omega #scale(x: 120%, y: 120%)[\|] thin d t thin d omega . $ <eq:hist-contact-jacobian>]

 The velocities in this formula are those of the separately computed translation components immediately before their merger.]
  + #emph[The number of discrete pin charts, including a cell’s generation choices, is at most $\( C \( p + 1 \) \)^(C m)$. No partition of the roots is introduced. The full spatial Jacobian is the product of the pin Jacobians. No norm of a derivative of a many-particle flow occurs.]
  + #emph[If $m = 1$ globally in that cell and the extra label is separated from its own roots at the late endpoint, its first backward contact with its own tensor factor gives the exact chart 
#[#set math.equation(numbering: n => "(5.9)")
 $ y = x_a \( t \) + epsilon omega + \( b_I - t \) w \, #h(2em) d y thin d w = epsilon^2 \| \( w - v_a \( t \) \) dot.op omega \| thin d t thin thin d omega thin thin d w . $ <eq:hist-single-chart>]

 Here $b_I$ is the late endpoint, $y \, w$ are the extra terminal position and velocity, and the root trajectory is computed without that extra label. Apart from the full or virtual choice in Remark 12, there is no multiplicity independent of the choice of $a$.]
  #emph[On the energy shell (5.6), multiplication by $mu^m$ and integration over the $m$ pin coordinates gives the coarse bound 
#[#set math.equation(numbering: n => "(5.10)")
 $ \( C p \)^(C m) \( 1 + E_r \)^(m \/ 2) \( Delta + epsilon \)^m . $ <eq:hist-multi-cell>]

 The convention $p + 1$ can replace $p$ in this and subsequent bounds at zero size.]
] <hist:pinning>

#proof[
  At the late endpoint initially tie all root labels into one anchored translation component. This is a convention about fixed coordinates, not an assertion that the roots interact. Process cross-component endpoint overlaps, choosing a pair by a fixed label order. An overlap fixes the relative translation by an offset of length at most $epsilon$. Ties between two already anchored pieces fix no new coordinate and are ignored. Repeat until every remaining floating component is separated from all other components at that endpoint.
  Every component carries the original force partition restricted to its labels. Translate the component as a whole. Its restricted dynamics commutes with that translation. Starting at the late endpoint, evolve all these components backward. Until their first intercomponent geometric contact, they exert no cross force and these restricted motions equal the original prescribed motions. At that contact fix one relative component translation, merge the two translation components, and continue with the restricted original force partition on their union. Physical interactions are included when the original partition includes them; a virtual contact only merges translation coordinates. Interactions already internal to a component need not be enumerated. Because the prescribed contact graph links every extra label to roots, the algorithm eventually anchors every extra coordinate.
  For two floating components write their paths as $a_A + q_i^A \( t \)$ and $a_B + q_j^B \( t \)$, where all internal coordinates are fixed. At the selected contact,
  $ a_B - a_A = epsilon omega + q_i^A \( t \) - q_j^B \( t \) . $
  The derivative in time is the relative velocity; the other two derivatives span the tangent plane of the sphere of radius $epsilon$. Their determinant is (5.8). A contact with the anchored component uses the same formula with its position already fixed. Endpoint pins are linear changes from a relative translation to an offset and have determinant one.
  At each stage keep the previously chosen internal and pin coordinates unchanged. The next change acts only on one still free relative translation. Thus the changes are triangular in merger order. Large derivatives with respect to earlier pin coordinates enter only off-diagonal blocks. This proves the product assertion, including for singular potentials by compact exhaustion of the regular flow domains.
  There are at most $m$ mergers that remove an extra translation degree of freedom. Choosing their pairs, representatives, orders, and endpoint/contact types costs at most $\( C p \)^(C m)$. The extra-label partitions and generations have the same type of bound by Proposition 13. Roots have already been anchored together and require no partition sum. On each original first-contact domain the construction recovers the starting configuration. For an upper bound the area formula permits summing the images of all these charts. It does not require a uniform bound on repeated physical contacts. Tangencies lie in zero-Jacobian portions of the contact maps, and deterministic tie rules suffice at multiple choices.
  When there is one extra label, before its first contact with its own factor that label is free and the old roots follow their isolated root flow. This proves (5.9). An earlier contact with a different tensor factor exerts no force and hence does not invalidate this original-factor chart. Its indicators remain part of the term. The force group and original factor are determined by the chosen original parent and the full/virtual choice.
  Finally, on the valid energy shell every velocity at a selected contact has magnitude at most $E_r^(1 \/ 2)$. A contact pin therefore integrates to at most $C epsilon^2 E_r^(1 \/ 2) Delta$, whereas an endpoint pin costs $C epsilon^3$. After $mu^m = epsilon^(- 2 m)$, (5.10) follows. The energy bound is used on the original chart domain before other restrictions are dropped; no energy bound on an artificially reconstructed off-domain trajectory is presumed. ◻
]

#prodef([Remark 5.4.])[
  (Coarse global pins and relative variables).  For a geometric estimate one may run the same algorithm with all currently displayed root paths, across tensor factors, in the anchored component. A singleton then has its primary pin at its earliest backward contact with any displayed path. If this is in a different factor, the primary contact is virtual and its later required original-factor contact is still an indicator. This is only a new coordinate chart for the same force prescription.
  At a singleton pin put $g = w - v_a \( t \)$. All root trajectories at $t$ are determined before this new block is introduced. The map $w mapsto g$ has determinant one. Combining it with the normal-to-disk map gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ mu thin d y thin d w = \| g \| thin d t thin d g thin d^2 zeta \, #h(2em) zeta in g^perp \, quad \| zeta \| < 1 \, $ <eq:hist-disk-chart>]
  on the incoming hemisphere. This identity is a contact-flux identity, not an inverse differential cross-section. A measurable orthonormal frame identifies each disk with a fixed unit disk and preserves area.
  These substitutions are triangular in backward cell order. A whole multiple-addition cell is one coordinate block; all its variables are introduced before any earlier cell is computed. Consequently an ordinary parent state is determined by preceding blocks, never by the fresh velocity or impact variable at that pin. This remains true with arbitrarily complicated old-root dynamics.
  On $S lt.eq R p$, after fixing source summability boxes, all velocity, root-position, and remaining relative-coordinate ranges have polynomial size in $p$. Rescale endpoint offsets by $epsilon$. The preceding determinant calculation then bounds the activity-normalized chart density, in the product of contact blocks and remaining auxiliary variables, by $\( C p \)^(C p)$ for a fixed cell prescription. Summing discrete cell prescriptions replaces this by $P^(C_(A \, Q \, L) p)$ when $p lt.eq P^A$ and $J = ceil.l P^Q ceil.r$. This coarse bound is used only with an extensive geometric gain. Reassigning a primary pin across factors can lose the original factor choice; it is not used in the exponential parent count below. Section 6 records the additional exclusions that make the coarse charts causal for selected terminal trees.
] <hist:coarse-chart>

=== 5.3 Spatial anchors and the finite exponential bound <spatial-anchors-and-the-finite-exponential-bound>

There is one independent three-dimensional velocity coordinate for each formal label: the terminal velocity of a top or the departure velocity of an extra. Lemma 29 changes position coordinates only, before the optional relative substitution. Thus these $3 p$ velocity coordinates, denoted by $V$, have a common Gaussian majorant in all the original-factor charts.

For spatial integration use the cubes $Q_k = k + \[ - 1 \/ 2 \, 1 \/ 2 \)^3$ and numbers $a_(i \, k) = sup_(\| x - k \| lt.eq 1) g_i \( x \)$. Expand each spatial source envelope over these cubes. Their coefficients sum to at most $M$ per label. For a fixed list of boxes, a top label and its unique source position satisfy

#[#set math.equation(numbering: n => "(5.12)")
 $ sum_(i : thin i upright(" a top")) \| x_i^(upright("top")) - x_i^(upright("source")) \|^2 lt.eq T integral_0^T sum_(i : thin i upright(" a top, active at ") t) \| v_i \( t \) \|^2 d t lt.eq T^2 E_r . $ <eq:hist-top-displacement>]

There is no positional jump at a change of force group. After all extra positions have been pinned, the remaining top positions therefore range in a ball in $bb(R)^(3 h_0)$ of squared radius at most $C_T \( E_r + h_0 \)$ about their source boxes. Its volume is bounded by

#[#set math.equation(numbering: n => "(5.13)")
 $ sans(S) \( h_0 \, E_r \) = [C_T (1 + E_r / h_0)^(3 \/ 2)]^(h_0) . $ <eq:hist-spatial-factor>]

The other spatial box indicators may be discarded. Summing all box coefficients costs $M^p$. In particular, for $h_0 = o \( p \)$ and $E_r = O \( p \)$ the logarithm of (5.13) is $o \( p \)$.

Here and below cell occupancy means the total occupancy across all simultaneous tensor factors. Let $m_(*)$ count labels in cells with at least two additions, and let $o_(*)$ count singleton endpoint pins. The remaining $n_(*) = p - h_0 - m_(*) - o_(*)$ additions are called ordinary pins. The interlayer retained-slot choices are either fixed, or retained explicitly as their binomial selection factors. They are never replaced by $2^(C H)$.

#thm([Proposition 5.5.])[
  (Finite-term bound with its time factors).  #emph[Fix $A < oo$ and the finite number $L$ of layers. There is a numerical exponent $d$ in the cell estimates such that, if $J = ceil.l P^Q ceil.r$ with $Q > 2 d A$, all the following bounds hold uniformly for $1 lt.eq p lt.eq P^A$, for sufficiently small $epsilon$. Put $n_j$ for the total additions in layer $j$, $h_j$ for its incoming roots, and $q_j = h_j + n_j$. After summing cell choices, cell diagrams, and original parents, the absolute integral on the shell (5.6) is bounded by 
#[#set math.equation(numbering: n => "(5.14)")
 $ & eta_Gamma C^p e^(- c r p) sans(S) \( h_0 \, E_r \) chi_epsilon^(m_(*) + o_(*)) \( r + 2 \)^(\( m_(*) + o_(*) \) \/ 2) product_(j = 1)^L frac(b^(n_j) q_j^(n_j), n_j !)\
 & #h(22mm)  times integral_(bb(R)^(3 p)) product_(i : thin i upright(" an ordinary pin")) (1 + \| w_i \|^2 + E_r / q_(j \( i \)))^(1 \/ 2) d gamma \( V \) \, $ <eq:hist-finite-bound>]

 where $d gamma$ is a normalized product Gaussian of one fixed exponent, the integral may retain the common indicator $\| V \|^2 lt.eq E_r$, and one may take 
#[#set math.equation(numbering: n => "(5.15)")
 $ chi_epsilon = C P^(d A) (J^(- 1 \/ 2) + frac(epsilon J, b)) . $ <eq:hist-mesh-gain>]

 Harmless increases of $d$ absorb the fixed extra powers occurring in the finite diagrams. Constants $C \, c$ in (5.14) do not depend on $L$ or on later rarity cutoffs. The threshold of sufficiently small $epsilon$ may depend on the fixed $b = T \/ L$.]
  #emph[In particular, after summing layer occupancies and retained slots the total finite integral of order $p$ is at most 
#[#set math.equation(numbering: n => "(5.16)")
 $ eta_Gamma C_L^p . $ <eq:hist-coarse-exponential>]

 Its portion with $S > R p$ is at most 
#[#set math.equation(numbering: n => "(5.17)")
 $ eta_Gamma C_L^p e^(- c R p) \, $ <eq:hist-source-tail>]

 after changing $c > 0$ and taking $R$ above a fixed constant. These are estimates of finite independently enveloped terms, not assertions about the actual process.]
] <hist:basic>

#proof[
  For a set of at most $q$ old labels with squared-velocity sum at most $E$, direct Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(5.18)")
   $ sum_a \| v_a - w \|^2 lt.eq 2 q \| w \|^2 + 2 E \, #h(2em) sum_a \| v_a - w \| lt.eq C q (1 + \| w \|^2 + E / q)^(1 \/ 2) . $ <eq:hist-parent-sums>]
  The root state at an ordinary pin is determined before its parent and new velocity are chosen. On a fixed source-energy shell, retain the adapted gate that this root state has squared-velocity sum at most $E_r$. Every original term in the shell satisfies that gate. Sum the last parent first using (5.18), then the preceding one, and continue. The resulting factors are independent of the parent states. This proves the ordinary-pin product in (5.14). Remaining future admissibility indicators can now be dropped. The majorant in $V$ is the fixed Gaussian of Lemma 27, so these integrations introduce no additional per-layer exponent loss.
  For globally ordinary cells the first contact times are chronologically ordered. Summing their disjoint cell boxes is an integral over a subset of the corresponding ordered simplex. Hence it supplies $b^n \/ n !$, not $J^n$ times this quantity. A maximal stretch of empty cells simply composes the same prescribed root flows. It has one deterministic map and no independent empty-cell choice.
  If a cell has $m gt.eq 2$ additions, use (5.10), without a factorial improvement in its internal contact times. For a total of $m_(*)$ such participants there are at most $m_(*) \/ 2$ occupied cells. Their location choices cost at most $J^(m_(*) \/ 2)$ in a layer. The time factors supply $\( b \/ J \)^(m_(*))$, since $epsilon J lt.eq b$ eventually. Distributing the participants among those cells and choosing their pin/generation data costs $p^(C m_(*))$. A missing ordered-time factorial for these participants is restored with $n_j ! \/ \( n_j - m_j \) ! lt.eq p^(m_j)$. On the energy shell, their speed factors cost at most $p^(m_(*) \/ 2) \( r + 2 \)^(m_(*) \/ 2)$ times a fixed exponential. All these polynomial powers are absorbed in $d$ in (5.15).
  A singleton endpoint pin has factor $C epsilon$ after its activity normalization, instead of a contact-time integral. Its cell choice costs at most $J$. Restoring the time simplex and any parent factor loses at most a further fixed power of $p$ per such pin. This gives the second term in (5.15). The unordered-extra factorials of Corollary 14 cancel permutations of new names; at a singleton no independent factor assignment remains after choosing its original parent. At multiple cells all remaining assignments are among the polynomial costs just counted.
  The energy and spatial bounds were proved in (5.4)–(5.13). Combining them with these changes of variables proves (5.14). Notice that $chi_epsilon arrow.r 0$ uniformly for $p lt.eq P^A$. No rarity cutoff has entered its exponent.
  For the coarse consequence replace every parent capacity by $p$ and use the global ordered simplex. For $n = p - h_0 lt.eq p$,
  $ p^n frac(T^n, n !) lt.eq e^p max \( 1 \, T \)^p . $
  The source shell gives $sum_i \| w_i \|^2 lt.eq E_r$ on its original domain. Alternatively integrating the product Gaussian moments gives the same bound $C^p \( r + 2 \)^(C p)$ for the speed product and the spatial factor, since $h_0 lt.eq p$ and $h_0 log \( 1 + p \/ h_0 \) lt.eq C p$. Thus the shell sum is bounded by
  $ C^p sum_(r gt.eq 0) e^(- c r p) \( r + 2 \)^(C p) lt.eq C^p . $
  All retained-slot binomials are at most $2^(sum_j q_j) lt.eq 2^(\( L + 1 \) p)$, and all other fixed layer choices cost a further $C_L^p$. This proves (5.16). Starting the shell sum at $r gt.eq R - 1$ proves (5.17). Polynomial costs of special cells have already been paid by their mesh factors before this shell sum or a later constant-cutoff estimate is used. ◻
]

=== 5.4 Compact parameters and adapted parent counting <compact-parameters-and-adapted-parent-counting>

For this subsection work on $S lt.eq R p$ and put $R_1 = R + 2 B$. The original-factor charts have an explicit auxiliary product measure. Normalize their Gaussian velocities and disk areas, choose every ordinary parent uniformly from a fixed list of $p$ slots, and kill inactive or otherwise illegal choices by indicators. Root coordinates and all auxiliary multiple-cell blocks are integrated against the majorants already used above. A whole such block is revealed before proceeding to an earlier ordinary cell. Fix the ordered contact times when discussing a conditional mark. The past of pin $i$ contains all preceding blocks, its time, and its old-root state, but not its parent choice or its new $w_i \, zeta_i$.

Let $G_i$ be the adapted gate that the old-root squared-velocity sum is at most $R_1 p$, together with any other adapted restrictions explicitly retained. Write $F_i = \| v_(i \, I_i) - w_i \|$, where $I_i$ is the uniform parent slot. From (5.18),

#[#set math.equation(numbering: n => "(5.19)")
 $ bb(E)_(upright("ref")) \( G_i F_i^2 divides upright("past of ") i \) lt.eq C \( 1 + R_1 \) . $ <eq:hist-reference-square>]

For any prescribed set of $k$ pins whose marks have conditional reference probability at most $eta$, repeated conditional integration gives a probability at most $eta^k$. Applying one Cauchy–Schwarz inequality to the whole product of fluxes, and integrating the last fresh block first in each factor, proves

#[#set math.equation(numbering: n => "(5.20)")
 $ bb(E)_(upright("ref")) #h(-0.16667em) [product_i G_i F_i thin upright(bold(1))_({ N_(upright("mark")) gt.eq k })] lt.eq \[ C \( 1 + R_1 \) \]^(n_(*) \/ 2) binom(n_(*), k)^(1 \/ 2) eta^(k \/ 2) . $ <eq:hist-reference-discard>]

Physical parent velocities need not be independent. What is used is that they are measurable before their own new block is introduced. Later admissibility restrictions may be dropped; this does not allow one to drop a future dependence of a parent state.

#thm([Proposition 5.6.])[
  (Finite parameter discards).  #emph[Fix $L$, $A$, $delta > 0$, and $M_0 < oo$. The source-energy cutoff $R$ and fixed numbers 
$ U \, W < oo \, #h(2em) gamma \, kappa > 0 $

 can be chosen so that, for all sufficiently small $epsilon$, the total finite history integral with at least $delta p$ marked additions is at most $eta_Gamma e^(- M_0 p)$. An addition is marked if it is in a multiple-addition cell, is an endpoint pin, or is an ordinary pin satisfying any of the following conditions:]
  + #emph[its original parent speed exceeds $U$, its added absolute velocity exceeds $W$, or its relative speed is below $gamma$;]
  + #emph[for a genuine non-force-free isolated continuation, either output increment relative to the incoming parent has magnitude below $kappa$;]
  + #emph[its isolated two-body duration in physical time exceeds $epsilon^.96$;]
  + #emph[its contact time is within $epsilon^.95$ of a cell boundary, or it belongs to a pair of birth times separated by less than $2 epsilon^.9$.]
  #emph[The contribution of $S > R p$ has the same bound. The constants in this proposition may depend on $L$; they do not enter the $C$ in (5.14).]
] <hist:irregular>

#proof[
  Choose $R$ using (5.17). Given an old-root state with squared-velocity sum at most $R_1 p$, at most $R_1 p \/ U^2$ of its parent slots have speed above $U$. The conditional reference probability of choosing one is therefore at most $R_1 \/ U^2$. A large added absolute velocity has Gaussian probability at most $C e^(- c W^2)$. The ball $\| w - v \| < gamma$ has reference probability at most $C gamma^3$, uniformly in $v$.
  On the remaining compact set let $G_(*) = U + W$. In the incoming disk variables, relative velocities and impact parameters have reference density bounded by a constant with respect to $d g thin d^2 zeta$. On $gamma lt.eq \| g \| lt.eq G_(*)$ this measure is equivalent to incoming flux. Proposition 8 therefore gives a function $omega_Phi \( kappa \; gamma \, G_(*) \) arrow.r 0$ as $kappa arrow.b 0$ such that the second mark has conditional probability at most $C omega_Phi$. The bound is uniform over $\| v \| lt.eq U$: translate $w$ to $g = w - v$, bound its Gaussian density above, and enlarge to the fixed relative-velocity annulus. Force-free passages are crossings and are not marked for their zero parent increment.
  Lemma 5 gives
  $ integral_(\| g \| lt.eq G_(*)) integral_(\| zeta \| < 1) \| g \| thin upright(bold(1))_({ tau \( g \, zeta \) > D }) thin d^2 zeta thin d g lt.eq C_(Phi \, G_(*)) \/ D . $
  Dividing by $\| g \| gt.eq gamma$ shows that the duration mark has conditional probability at most $C_(Phi \, G_(*)) gamma^(- 1) epsilon^.04$. This is the duration of the isolated continuation, not an assumption that an actual many-particle encounter is isolated. An interruption will be an encounter defect in Section 6.
  Take $U \, W$ large and then $gamma \, kappa$ small to make the sum of the first two reference-mark probabilities as small as needed. Equation (5.20), $binom(n_(*), k) lt.eq 2^p$, and the finite exponential normalization give the required bound for an extensive number of these marks. For fixed $delta$ any prescribed exponential is obtained by making their one-step probability sufficiently small. Multiple cells and endpoint pins have instead the factor $chi_epsilon^(m_(*) + o_(*))$ from Proposition 31, which proves their assertion.
  For the time marks use unordered uniform times before sorting in each layer. A fixed time lies within $epsilon^.95$ of a cell boundary with probability at most $C J epsilon^.95 \/ b$. If $k$ birth times have a neighbor at distance below $2 epsilon^.9$, their closeness graph on the line has a matching or a disjoint consecutive-pair selection of size at least a fixed multiple of $k$. For a prescribed disjoint pair selection the probability is at most $\( C_L epsilon^.9 \)^(c k)$. There are at most $p^(C k)$ selections. Times in distinct layers which are this close lie near their common boundary and can be charged there. Since $p lt.eq P^A$ and $J$ is a power of $P$, these bounds tend to zero with a positive power of $epsilon$ per fixed fraction of marked times. Apply the same global Cauchy–Schwarz estimate to the fluxes. A finite union bound, with thresholds reduced by the number of categories, completes the proof. ◻
]

=== 5.5 A two-sided volume estimate for crowding <a-two-sided-volume-estimate-for-crowding>

Crowding here concerns the displayed paths of a finite term. In particular, they may belong to different prescribed force groups. The frozen extension is useful: its positions are continuous at every fixed lifetime and force-partition switch, and on $S lt.eq R p$ their speeds are bounded by $C_R sqrt(p)$.

#thm([Lemma 5.7.])[
  (A fixed-pivot forest).  #emph[Fix a time $t_(*)$, a forest of $r$ edges on the $p$ labels, and $rho gt.eq epsilon$. For one fixed force/lifetime prescription whose required contacts connect every label to a top, the source integral before multiplication by $mu^(p - h_0)$, on $S lt.eq R p$ with $\| x_i \( t_(*) \) - x_j \( t_(*) \) \| lt.eq rho$ on every forest edge is at most 
#[#set math.equation(numbering: n => "(5.21)")
 $ eta_Gamma C^p p^(C p) rho^(3 r) epsilon^(2 \( p - r - h_0 \)_(+)) . $ <eq:hist-pivot-bound>]

 More precisely, a stratum with $k$ final translation components has the factor $rho^(3 r) epsilon^(2 \( p - r - k \))$, with $k lt.eq h_0$. There is no factor equal to the number of cells in this geometric bound.]
] <hist:pivot>

#proof[
  Use the augmented phase coordinates at $t_(*)$ from Lemma 27 and first fix their velocities. Root each component of the forest at its least label. Replace its positions by one common translation and the edge differences along that rooted tree. The linear map has determinant one. The $r$ relative vectors range in balls of radius $rho$, at cost $\( C rho^3 \)^r$.
  Each current translation component carries the original time-dependent force partitions restricted to its labels, as well as the frozen coordinates outside their lifetimes. Begin by merging any remaining cross-component overlaps at the pivot, using endpoint offsets in $B \( 0 \, epsilon \)$. Next scan #emph[all] geometric contacts of the extended paths, both forward and backward from $t_(*)$. This includes contacts between different physical force systems and contacts of inactive frozen coordinates. Choose the first remaining contact in increasing distance $\| t - t_(*) \|$, with a deterministic rule for ties, fix its relative translation, and merge the two translation components. Recompute the merged component’s restricted prescribed motion from the pivot in both directions. Continue until no cross-component contact remains anywhere in $\[ 0 \, T \]$.
  The reconstruction has a useful induction. Inside the already explored two-sided time window, distinct translation components have had no geometric contact. Hence they exert no physical force, and their separately computed motions agree with the full prescribed motion. A newly chosen earliest contact lies on the boundary of an extension of that window. Merging its two components changes no motion inside the old window. This statement holds even when successive mergers occur on opposite sides of the pivot. Interactions beyond the known window are recomputed with the original force partitions after the merger. A virtual merger never adds a force.
  The contact Jacobian is again (5.8); for a frozen coordinate its position derivative is zero. Its integral over all possible times is bounded by $C_T epsilon^2 sqrt(R_1 p)$. Piecewise smooth time intervals are summed as one time integral. There is no independent endpoint choice at each mesh time: extended positions are continuous, so an overlap which becomes physically relevant at a switch was either already a pivot overlap or was preceded by a geometric sphere contact. This is why all extended geometric contacts, rather than only currently interacting pairs, were included in the scan.
  The triangular determinant and area-formula argument of Lemma 29 applies verbatim. At a fixed-time kink use the adjacent smooth time intervals; the endpoint itself has zero three-dimensional contact-parameter measure unless it is covered by an already counted overlap. Tangent and repeated contacts need no separate counting. Compact exhaustion avoids singular physical configurations. There are at most $p - 1$ mergers, with at most $p^(C p)$ choices of pairs, directions, orders, and contact/overlap types.
  After the first $r$ forest links, if the final number of components is $k$, there have been exactly $p - r - k$ further pins. At termination there are no remaining geometric contacts between these components. Every required contact belongs to the scanned set, so each final component contains a top and $k lt.eq h_0$. Every extra pivot overlap costs $epsilon^3 lt.eq epsilon^2$; every other pin has the $C_T sqrt(R_1 p) epsilon^2$ bound just proved.
  It remains to integrate the $k$ free translations. In a final component all of its source positions have the form $a + d_i$ and its source velocities are independent of $a$. Choose one source label in that component. Integrate its $g_i \( a + d_i \)$ using its $L^1$ norm and bound the other spatial envelopes by their $L^oo$ norms. Both norms are at most $C M$ by (5.1). On the original stratum the restricted component flows equal the full flows; extending these restricted functions after discarding the stratum indicators preserves their translation property. Thus all free translations cost $C^p$. The mixed Gaussian integrates to $C^p$, and the speed powers cost $p^(C p)$. This proves the sharper stratum bound and hence (5.21). ◻
]

#thm([Proposition 5.8.])[
  (Extensive simultaneous crowding).  #emph[Fix $A \, Q \, L \, R$ and $delta > 0$. Among independently enveloped finite histories with $p lt.eq P^A$ and $S lt.eq R p$, the activity-normalized integral for which at some time at least $delta p$ displayed labels have a companion within $rho = epsilon^.85$ is bounded by 
#[#set math.equation(numbering: n => "(5.22)")
 $ eta_Gamma P^(C_(A \, Q \, L \, R) p) epsilon^(.275 delta p - 1) . $ <eq:hist-crowding-explicit>]

 For $delta p gt.eq 8$ this is at most $eta_Gamma epsilon^(.1 delta p)$ for sufficiently small $epsilon$, uniformly in the stated range of $p$.]
] <hist:crowding>

#proof[
  The proximity graph of $m$ crowded labels has a forest of at least $m \/ 2$ edges: each nontrivial connected component with $s$ vertices contributes $s - 1 gt.eq s \/ 2$. Summing possible forests costs at most $p^(C p)$. Take a grid of spacing at most $epsilon$ in $\[ 0 \, T \]$. On $S lt.eq R p$, the displacement of an extended path to its closest grid point is at most $C_R sqrt(p) thin epsilon lt.eq rho \/ 2$ for small $epsilon$. Thus an active-path crowding event gives the same forest with radius $2 rho$ at a grid point, even across a lifetime boundary. The grid costs at most $C_T epsilon^(- 1)$.
  Use the sharper form of Lemma 33. On a stratum with $k lt.eq h_0$, multiplying by $mu^(p - h_0) = epsilon^(- 2 \( p - h_0 \))$ leaves the exponent
  $ 3 \( .85 \) r + 2 \( p - r - k \) - 2 \( p - h_0 \) = .55 r + 2 \( h_0 - k \) gt.eq .55 r . $
  Since $r gt.eq delta p \/ 2$, this gives (5.22) for a fixed prescription up to a $p^(C p)$ factor. There are only $O_L \( p \)$ nontrivial cell and retained-slot choices: empty stretches introduce no new prescription. Even the crude count $\( L J \)^(C p) p^(C_L p)$ of all their locations and finite partitions is $P^(C_(A \, Q \, L) p)$. This proves the asserted summed estimate. When $delta p gt.eq 8$, the grid loss leaves an exponent at least $.15 delta p$; the remaining logarithmic powers are absorbed by $.05 delta p$ for small $epsilon$. ◻
]

#thm([Corollary 5.9.])[
  (Separated original parents).  #emph[Given $L \, A \, delta > 0$ and $M_0 < oo$, one can discard finite terms of total integral at most $eta_Gamma e^(- M_0 p)$ so that, except at fewer than $delta p$ ordinary pins, the original parent is at distance greater than $epsilon^.85$ from every other already displayed path immediately before the insertion. This assertion is used for large histories; fixed bounded orders are treated by their direct geometric estimates.]
] <hist:separated>

#proof[
  First remove $S > R p$ with Proposition 31. Apply Proposition 34 with a sufficiently small fixed crowding fraction $theta$, to be chosen below. On its complement, at every ordinary pin at most $theta p$ of the known old paths have another known path within $epsilon^.85$. Their known states at the original first-contact time equal the corresponding states of the prescribed term before the insertion. Exclude the new label itself in this count.
  In the reference measure retain the adapted gate that the known old-path crowding count is at most $theta p$. It contains every term under consideration. Uniform parent selection now gives conditional probability at most $theta$ of choosing a crowded old parent. Equation (5.20) bounds the integral with at least $delta p$ such choices by $C_(L \, R)^p 2^(p \/ 2) theta^(delta p \/ 2)$. Choose $theta$ small enough to make this $e^(- \( M_0 + 1 \) p)$. The extensive crowding estimate with this fixed $theta$ is smaller than the same quantity once the history size and $P$ are sufficiently large. This proves the claim. Neither step presupposes a good event for the exact cloud. ◻
]

All constants used for the last two propositions are chosen after $L$ and the requested discard exponent. In contrast, the source exponent, the parent inequalities, and the constants in (5.14) were fixed before those choices. This separation is what permits the few-crossing estimate in Section 7 to retain its base $C b sqrt(L)$.

== 6 Terminal trees and exposure of first defects <exp:section>

The signed terms of Definition 17 are deterministic whole-cell transports. Randomness in this section means integration against coordinates for such a term. In particular, none of the auxiliary omissions below is an operation on the microscopic process. We use the fixed Gaussian bound of Lemma 27, the contact charts of Lemma 29, and the exceptional-parameter and crowding estimates of Propositions 32 and 34. Throughout the geometric applications use

#[#set math.equation(numbering: n => "(6.1)")
 $ tau_epsilon = 1 / 4 epsilon^.95 . $ <exp:time-scale>]

The existing boundary exclusion of width $epsilon^.95$ leaves no cell or layer cut in an initial interval of length $2 tau_epsilon$. The retained birth spacing $2 epsilon^.9$ is stronger than needed on this shorter interval. With arc error $C_M epsilon^.96$ the tube ratio is $O \( epsilon^.01 \)$, and every fixed polynomial in $p$ times $tau_epsilon$ is $o \( epsilon^.85 \)$.

=== 6.1 Two coordinate systems, used at different stages <two-coordinate-systems-used-at-different-stages>

The #emph[original forest] uses the first pin required by the factor in the exact expansion: for a singleton addition, this is its first backward contact with any root of that factor. All ordinary parent counts, compact-parameter exclusions, and increasing-tree estimates below use these original coordinates. A parent’s identity determines its factor; there is no additional choice of a factor after the parent is chosen.

The final exposure estimate uses a second, #emph[global forest]. Its anchored pool includes every displayed path, including paths from other tensor factors. A floating translation is pinned at its first backward contact with this entire pool. With several floating groups, their first mutual contacts are used as well. Coordinate groups merge at these pins, but forces remain those of the original whole-cell prescription. Thus a new contact used only for this coordinate construction is virtual. All original required-contact, isolation, and first-contact tests remain indicators. This change of coordinates is used only after an extensive number of fresh terminal trees has been selected, when its full $p^(C p)$ multiplicity is affordable.

A singleton global pin still produces exactly one new label. A genuine isolated scattering has both the continuing parent and the new child as outputs. A virtual contact or force-free passage changes only the new branch. A formerly prescribed genuine encounter following an earlier virtual global pin remains an actual encounter, but is an additional contact in the global forest.

Call a contact of the free added ray with another factor #emph[premature] if it occurs before its original pin in backward time. In the presence of such a contact the global pin may be #emph[rerouted]. The next lemma is proved in the original coordinates, so it incurs no extra factor choice. Bad original pins are handled by the original exceptional-parameter bounds, rather than being assigned an unjustified small angular measure.

#thm([Lemma 6.1.])[
  (Premature contacts in original coordinates).  #emph[Outside the original compact-parameter, crowded-parent, and multi-addition exceptions, the contribution with a specified set of $k$ singleton cells having a premature contact has bound 
#[#set math.equation(numbering: n => "(6.2)")
 $ C_L^p #scale(x: 120%, y: 120%)[\(] p^C epsilon^c #scale(x: 120%, y: 120%)[\)]^k . $ <exp:reroute-bound>]

 Consequently an extensive number of premature contacts has arbitrarily strong exponential suppression. The remaining premature births may be marked irregular before selecting terminal subtrees. No global reparenting multiplicity is included or needed in this estimate.]
] <exp:rerouting>

#proof[
  There is exactly one added label across all expansions in the cell under consideration. Let $sigma$ be its original backward pin time, and $a$ its original parent. The original first-pin condition says that on its prelaunch interval the new label is free and has no contact with any root of its own factor. The current-cell root paths of all other factors are also independent of its free velocity $w$ and position. These paths are known after the root states at the later cell endpoint are fixed.
  Write $v = v_a \( sigma \)$ and $g = w - v$. With $u > 0$ denoting elapsed time from $sigma$ in the prelaunch direction, the new ray is
  $ x_a \( sigma \) + epsilon n + u \( v + g \) . $
  The original parent is separated by $epsilon^.85$ from every other already anchored path at time $sigma$, outside the original crowding exception. Hence, with polynomial speed bounds, a premature contact is impossible for $u < tau_epsilon$. For fixed $sigma \, n \, \| g \|$, the remaining angular measure is bounded by a constant times spherical area. Indeed, $w mapsto g$ is a translation, the Gaussian density in $w$ is bounded above on the retained compact range, and the incoming-hemisphere restriction and bounded flux weight preserve this upper bound. Uniformity of the original angular law is not needed. The proof of Lemma 38, with time run in this prelaunch direction, bounds the contact measure against each fixed other-factor root curve by $p^C epsilon^.01$. The union over target lives costs only a polynomial factor. An endpoint contact is included in the same estimate.
  Use the product Gaussian/normal reference measure in the Cauchy–Schwarz parent comparison of Proposition 31, retaining all first-pin tests as indicators. Fix the entire ordered time vector and the discrete original parent choices before this argument. Index the remaining coordinate blocks in backward cell order, including an entire multi-addition block whenever necessary, and let $cal(F)_i$ contain all fixed times and choices, the top coordinates, and the first $i$ blocks. A complete path or prelaunch segment from a previously processed block is then fixed. The current cell’s roots and the other factors’ current-cell root paths are $cal(F)_(i - 1)$-measurable. There is no other new label in a designated singleton cell. Its absolute velocity and normal are fresh coordinates of block $i$.
  Define $A_i$ using only these paths and block $i$: its original parent is separated at the pin, the paths on the tested prelaunch interval have the required polynomial speed bound, the relative velocity has the retained compact bounds, and the free new ray meets an already anchored path of another factor before its original pin. In particular we do not include any test against a future pin or condition on the eventual set of marks. The separation and exterior-speed requirements are $cal(F)_(i - 1)$-measurable. On an original good history the global energy bound implies these local speed requirements; outside that domain we may simply omit the history. The angular calculation gives, uniformly in all past values,
  $ A_i in cal(F)_i \, #h(2em) bb(E)_(upright("ref")) \[ upright(bold(1))_(A_i) divides cal(F)_(i - 1) \] lt.eq rho_p := p^C epsilon^.01 . $
  This is an adapted assertion, not a separate conditional bound with every other block held fixed. For any fixed set $S$ of $k$ designated indices, let $i$ be its largest element. The product of all other designated indicators is $cal(F)_(i - 1)$-measurable. Conditional expectation removes $upright(bold(1))_(A_i)$ at cost $rho_p$. Iterating gives
  $ bb(E)_(upright("ref")) product_(i in S) upright(bold(1))_(A_i) lt.eq rho_p^k . $
  All original-domain indicators not used in $A_i$ can be dropped for this upper bound, without changing the normalized reference kernels. Finally sum over possible fixed sets $S$; this is a union bound, not conditioning on which indices turn out to be marked. The square-flux comparison contributes $C_L^p$ and at worst halves the positive exponent. Choices of target lives cost $p^(C k)$; choices of the $k$ cells cost at most $2^p$ when summed. This proves (6.2). Since $p$ is a fixed power of $P$, an extensive $k$ supplies the claimed suppression. ◻
]

=== 6.2 Increasing trees and a terminal antichain <increasing-trees-and-a-terminal-antichain>

Endpoint-overlap pins, including compulsory labels in a top endpoint polymer of a positive component witness, are included among irregular vertices. Such witnesses need only $h_0$ distinguished spatial anchors; no isolation of those anchors at the final endpoint is used here. A large endpoint polymer is paid for by its endpoint-volume pins before the regular-tree count. If only a small number of endpoint participants remain, they create only that many irregular vertices and additional roots when cut out. Thus a witness with one distinguished anchor does not quietly assume that its entire final component is a singleton.

For a rooted plane binary forest $cal(T)$, let $s \( v \)$ be the number of internal vertices in the subtree rooted at an internal vertex $v$. A continuing-parent edge is an ordinary child edge in this definition.

#thm([Lemma 6.2.])[
  (Terminal subtree selection).  #emph[Fix $0 < alpha lt.eq 1$ and an exponential accuracy $A > 0$, with the layer count and polynomial size exponent $a > 0$ fixed. There are constants $theta = theta \( alpha \, A \) > 0$, $M < oo$, $p_0 < oo$, and $epsilon_0 > 0$, independent of $epsilon$, such that the following statement holds uniformly for 
$ 0 < epsilon < epsilon_0 \, #h(2em) p_0 lt.eq p lt.eq P^a \, #h(2em) h_0 lt.eq theta p . $

 In the absolute history integrals with $p$ labels and $h_0$ tops, the following exclusions have total cost at most $e^(- A p)$ times the unrestricted exponential majorant, after choosing the compact and irregularity cutoffs sufficiently strongly: there are more than $alpha p \/ 8$ insertion vertices whose original descendant subtree has more than $M$ vertices, or too many vertices influenced by an irregular insertion. Here $M$ is a fixed constant, chosen before $epsilon arrow.b 0$.]
  #emph[After these exclusions, if at least $alpha p$ distinct new-particle lives have an extra contact or an uncharged defect, there are at least $c_(alpha \, M) p$ pairwise disjoint regular terminal trees, of size at most $M$, each containing a defect. For a genuine launch its selected tree contains both output branches; for a passage launch it need contain only the new branch. The selection can additionally ensure that no outside primary pin in the global coordinates attaches to a selected tree, and that the original and global genealogies agree on every selected tree.]
] <exp:terminal>

#proof[
  For a fixed forest shape with $n$ internal vertices, the number of increasing numberings is
  #[#set math.equation(numbering: n => "(6.3)")
   $ frac(n !, product_(v in cal(T)) s \( v \)) . $ <exp:hook>]
  Indeed, assign the smallest available number to each tree root, distribute the remaining numbers between its two child subtrees with the appropriate binomial coefficient, and repeat. The resulting factorials cancel at every internal edge and give (6.3); the same multinomial calculation distributes numbers between forest components. A plane binary forest with $h_0$ roots has at most $C^(n + h_0)$ shapes. Ordered times in an interval of length $T$ have volume $T^n \/ n !$. Dropping the layer and lifetime restrictions only increases this volume. Consequently, if $alpha n \/ 8$ vertices have $s \( v \) > M$, summation over their shapes and numberings has bound
  #[#set math.equation(numbering: n => "(6.4)")
   $ C_T^(n + h_0) M^(- alpha n \/ 8) . $ <exp:large-subtrees>]
  The Cauchy–Schwarz comparison with uniform parent counting in Proposition 31 can replace the last exponent by a fixed positive fraction of it, which still allows arbitrary exponential suppression by increasing $M$. Quantitatively, choose $theta lt.eq min { 1 \/ 4 \, alpha \/ 8 }$, so that $n = p - h_0 gt.eq p \/ 2$. Let $zeta > 0$ be the fixed exponent left by the parent comparison. Choose $M$ so large that
  $ frac(zeta alpha, 16) log M gt.eq A + log C_(*) + 2 \, $
  where $C_(*)^p$ bounds the shape and fixed-layer constants in the comparison. Then the large-subtree exclusion is exponentially small uniformly for every admissible $p$, without requiring $h_0 \/ p$ to tend to zero.
  By Lemma 36, include the few remaining premature births among the irregular vertices. This count still uses the original forest; no global-parent multiplicity has been introduced. Irregular vertices can be cut out before this count. Alternatively order the pins inside an irregular cell consistently with attachment to the anchored pool and refine them to binary vertices. The additional orderings are bounded by the factorial in that cell’s number of labels. The multi-addition estimates in Proposition 32 absorb these factors. Cutting $r$ vertices creates at most $2 r$ extra roots, so the shape count remains exponential. Here the irregular count concerns added insertion vertices and the old lives targeted by their primary pins, not all old lives that the added group may subsequently meet. A cell with $m$ added labels has at most $m$ primary attachment edges, even if its motion later touches many more old labels. Those secondary contacts remain defects on the corresponding regular candidate trees; they are not removed as $O \( m \)$ contaminated participants. Choose the allowed irregular fraction only after $M$ is fixed.
  A vertex of a subtree with at most $M$ internal vertices has at most $M$ ancestors whose subtrees also have at most $M$ vertices. Thus $r$ irregular vertices contaminate at most $M r$ candidate launch vertices. Distinct new-particle lives have distinct birth vertices. Excluding the $h_0$ top lives and the contaminated candidates leaves a fixed fraction of the $alpha p$ affected lives. Their candidate subtrees are nested or disjoint; each contains at most $M$ candidate birth vertices. Choose an inclusion maximal candidate, discard its at most $M$ nested candidates, and repeat. This produces a disjoint family with at least a $1 \/ M$ fraction of the remaining candidates. There is one additional mark needed before this greedy selection. Form the global pins only as combinatorial data on the current configuration. For each rerouted singleton birth mark its new global parent life, and for each irregular multi-pin mark the lives to which its pins attach. There are at most a constant times the number of irregular participants such marks. Count a target at its actual attachment segment; a life persists through a cut along the same continuation path, so no new mark is created merely by crossing a layer. An original bounded subtree containing a marked life is among at most $M$ candidate ancestors of that life, with another constant to include the life itself. Remove these candidates also. For example, take $h_0 lt.eq alpha p \/ 8$ and choose the irregular participant bound so that all child and target marks together eliminate at most $alpha p \/ 8$ bounded candidates; a bound $r lt.eq c alpha p \/ \( M + 1 \)$ with a sufficiently small absolute $c$ suffices. Together with the $alpha p \/ 8$ large candidates, this leaves at least $alpha p \/ 2$ affected candidates. Greedy selection therefore retains at least $alpha p \/ \( 2 \( M + 1 \) \)$ disjoint trees, up to integer rounding. Now an outside global pin cannot attach to a selected tree: an unchanged singleton attachment would already be its original descendant, a rerouted attachment has a marked target, and a multi-pin has a marked target. No vertex within a selected tree is rerouted. Thus both genealogies agree there. This target marking is necessary; marking only the rerouted child’s original ancestors would not exclude attachment to an unrelated hidden parent.
  The marks and the selected antichain can depend on the phase coordinates. No probability estimate is obtained by conditioning on this selection. In the later exposure bound we sum over its possible labels and choices at cost $p^(C p)$, paid by an extensive geometric gain. Replacing a selected passage subtree by its new-child part preserves disjointness and its designated affected life. Choose the irregular fraction after $M$, as specified above, and increase the requested accuracy of its finitely many exclusions by a fixed constant to sum them. Finally take $p_0 gt.eq 8 \( M + 1 \) \/ alpha$ to absorb integer rounding; for example the number of selected trees is then at least $alpha p \/ \( 4 \( M + 1 \) \)$. All these choices are fixed before $epsilon arrow.b 0$. ◻
]

=== 6.3 Launch coordinates and a tube estimate <launch-coordinates-and-a-tube-estimate>

Histories are ordered backward, but $t$ in the geometric formulas denotes physical time and velocities are physical velocities. At a regular singleton pin, write $v$ for the already known parent velocity and $w$ for the free added velocity. The change

#[#set math.equation(numbering: n => "(6.5)")
 $ g = w - v $ <exp:relative-chart>]

has Jacobian one: before the first pin the parent trajectory is independent of the new label. In insertion order these changes form a triangular transformation, including when the parent velocity has been changed by previous genuine scatterings. Later relative parameters on a selected tree will always be fixed in laboratory axes.

The measure on an entering sphere, or on its time reverse, is $\| g dot.op n \| thin d sigma \( n \) thin d g$. Equivalently, with $s = \| g \|$, impact radius $rho in \( 0 \, 1 \)$, and normalized Haar measure $d R$ on $S O \( 3 \)$, it is

#[#set math.equation(numbering: n => "(6.6)")
 $ 8 pi^2 s^3 rho thin d s thin d rho thin d R . $ <exp:rotation-measure>]

This follows by writing $d g = s^2 d s thin d omega$ and the impact area as $rho thin d rho thin d phi$. It uses no inverse of the scattering angle. On the retained compact parameter sets, $s$ and both genuine output increments relative to the original parent are bounded above and away from zero. Their body-frame vectors depend on $\( s \, rho \)$; common rotation multiplies both by $R$. Each nonzero vector separately has a uniform spherical marginal. The two output vectors need not be independent.

Galilean covariance gives a useful affine representation. Fix all relative parameters after a launch, its launch time $t_0$, and all its radial parameters. Up to the first defect, every descendant of output $i$ has position

#[#set math.equation(numbering: n => "(6.7)")
 $ x_a \( t \) = x_0 + \( t - t_0 \) v + \( t - t_0 \) R a_i + G_a \( t \) + e_a \( t \) \, #h(2em) \| e_a \( t \) \| lt.eq C_M epsilon^.96 . $ <exp:affine>]

Here $G_a$ is independent of $R$ and is Lipschitz with the retained speed bound. At a later birth the two velocities equal the current parent velocity plus increments depending only on that birth’s relative data. Induction proves (6.7) for the broken rays. Each exact scattering arc has duration at most $epsilon^.96$ and bounded speed; its replacement by an instantaneous broken ray changes positions by at most a constant times that duration. There are at most $M$ such arcs. The displacement $epsilon n$ at an insertion is absorbed in the same error. This also proves the estimate during a later arc.

For two descendants diverging at a genuine vertex, subtract their representations at that vertex. The relevant coefficient is the nonzero outgoing relative velocity, whose direction is again spherical under the common rotation. If they diverge at a passage, use the nonzero incoming relative velocity. Fixing parameters strictly below the divergence leaves these directions available for integration.

#thm([Lemma 6.3.])[
  (A ray with an independent exterior).  #emph[Let $omega$ have normalized surface measure on $bb(S)^2$, let $0 < r_0 lt.eq r lt.eq r_1$, and let $H : \[ tau \, T \] arrow.r bb(R)^3$ be independent of $omega$ and Lipschitz with constant at most $V$. If $0 < delta lt.eq tau r_0 \/ 10$, then 
#[#set math.equation(numbering: n => "(6.8)")
 $ integral_(bb(S)^2) upright(bold(1))_({ exists t in \[ tau \, T \] : \| t r omega - H \( t \) \| lt.eq delta }) thin d omega lt.eq C frac(\( V + r_1 \) delta, r_0^2 tau) . $ <exp:tube-bound>]

 For the tree consequence, fix $M in bb(N)$ and $a > 0$, let $p lt.eq P^a$, and retain the compact scattering, duration, birth-spacing, and boundary gates of Proposition 32. Test at most polynomially many exterior lifetime segments, independent of the tested launch rotation and with polynomial Lipschitz speed. Each such segment must either be tested only at elapsed times at least $tau_epsilon$, or admit such an independent extension back to the launch whose point there is at distance greater than $epsilon^.85$ from the launch parent. The unchanged parent of a passage is also allowed if it is free during the initial $2 tau_epsilon$ interval. Prescribed scattering and passage encounters are exempt. Under these hypotheses, a regular tree of at most $M$ vertices has a first unprescribed internal or tested exterior contact with parameter measure at most $p^C epsilon^c$, for some $c > 0$, in the unconditioned bounded-density reference measures described above.]
] <exp:tube>

#proof[
  On $\[ a \, 2 a \] ∩ \[ tau \, T \]$, take a mesh of spacing $delta \/ \( 2 \( V + r_1 \) \)$. A hit implies that a mesh point satisfies the same inequality with $2 delta$ in place of $delta$. There are at most $C \( 1 + a \( V + r_1 \) \/ delta \)$ points. At a fixed time the allowed directions are empty or contained in a spherical cap with area at most $C delta^2 \/ \( r_0^2 a^2 \)$. The mesh union therefore has measure at most $C \( V + r_1 \) delta \/ \( r_0^2 a \)$. Sum this geometric bound over $a = 2^k tau$ to obtain (6.8).
  Apply the estimate to (6.7), with $delta = C_M epsilon^.96$ enlarged to include the interaction radius, and $tau = tau_epsilon = epsilon^.95 \/ 4$. On the earlier side of a physical launch time use elapsed time $a = t_0 - t$ and replace the spherical direction by its negative; on the prelaunch side use $a = t - t_0$. The quotient $delta \/ tau$ is $O \( epsilon^.01 \)$. Polynomial speed and finite choices of descendant rays cost a factor $p^C$. A lifetime segment tested only after $tau_epsilon$ needs no launch-separation condition: extend its independent comparison curve to $\[ tau_epsilon \, T \]$ without increasing its Lipschitz constant and apply (6.8). The following initial-interval argument concerns only segments that are tested before $tau_epsilon$. The launch parent is separated from all other anchored paths by $epsilon^.85$, except for the already excluded crowded-parent choices. Since $tau p^C = o \( epsilon^.85 \)$, no hit with these other exterior paths occurs at smaller elapsed time. For a passage tree the unchanged launch parent remains visible and is not separated from the new child at launch. Their prescribed passage is exempt. Separation from all other paths and the absence of another birth or a cut in the initial $2 tau_epsilon$ interval leave that parent free there. The no-cut assertion follows from (6.1) and the original boundary gate; consequently no component from another cell can be installed during this interval. The nonzero relative straight ray cannot return after its prescribed passage. For later times that parent is included among the exterior curves in (6.8). For internal contacts, use the last common divergence and use the retained exclusion of other births within $2 epsilon^.9 > 2 tau_epsilon$ of it. The initial scattering itself is prescribed and finishes before this interval ends. The next free outgoing relative ray cannot return to its partner without a later change of velocity. A union over the at most $M^2$ relevant divergence/ray pairs completes the proof. ◻
]

=== 6.4 The joint measure and chronological exposure <the-joint-measure-and-chronological-exposure>

We state the measure argument explicitly because a Gaussian upper bound alone does not imply independence after conditioning.

For a product of independent input functions $u_1 \, dots.h \, u_p$, set

#[#set math.equation(numbering: n => "(6.9)")
 $ a_(i \, k) = sup_(\| x - k \| lt.eq 1 \, thin v) e^(beta_0 \| v \|^2) \| u_i \( x \, v \) \| \, #h(2em) cal(A)_p = product_(i = 1)^p sum_(k in bb(Z)^3) a_(i \, k) = product_(i = 1)^p parallel u_i parallel_(upright("Bol") \, beta_0) . $ <exp:source-factor>]

Any scalar small factor multiplying these inputs is left outside the estimate. Write $V_i^(upright("in"))$ for the velocity at label $i$’s unique independent source and define the input kinetic budget

$ cal(K) = 1 / 2 sum_(i = 1)^p \| V_i^(upright("in")) \|^2 = S \/ 2 . $

The once-counted energy inequality of Lemma 27 implies polynomial speed bounds on the shell $cal(K) lt.eq R p$, including the current, departed, and not-yet-injected coordinate states. In the next proposition the phrase “source factor” always means the explicit number $cal(A)_p$ in (6.9).

#thm([Proposition 6.4.])[
  (Causal exposure for mixed prescriptions).  #emph[Fix an admissible mixed whole-cell prescription with $p lt.eq P^a$ labels and a total energy budget $cal(K) lt.eq R p$. Fix a collection of $k$ disjoint regular terminal trees as in Lemma 37. Sum the absolute activity-normalized chart integrals over the event that every selected tree has a first defect. The result is bounded by 
#[#set math.equation(numbering: n => "(6.10)")
 $ cal(A)_p thin \( p J \)^(C p) #scale(x: 120%, y: 120%)[\(] p^C epsilon^c #scale(x: 120%, y: 120%)[\)]^(k \/ 2) \, $ <exp:exposure-bound>]

 The factor $\( p J \)^(C p)$ includes cell-segment choices. Constants may depend on the fixed layer count, compact cutoffs, $M$, and $R$.]
] <exp:exposure>

#proof[
  #emph[The unconditioned charts.] Fix the cells, force partitions, lifetimes, and labels of the translation pins. Inactive labels may be extended freely. The augmented map from independent input coordinates to the current/departed coordinates preserves volume by Lemma 27. At a cell, keep the end coordinates of all its roots anchored and decompose the added coordinates into velocities, internal relative positions, and one common translation for each floating group. Grow the groups backward using the common first-contact convention. Until a merger, each group’s motion is independent of the other group’s common translation. If the contact is at $t$ between labels $i$ and $j$, its relative translation is
  #[#set math.equation(numbering: n => "(6.11)")
   $ r = epsilon n + X_i \( t \) - X_j \( t \) \, #h(2em) \| det D_(\( t \, n \)) r \| = epsilon^2 \| n dot.op \( V_i \( t \) - V_j \( t \) \) \| . $ <exp:pin-jacobian>]
  Internal coordinates in this formula are held fixed. Once a relative translation is fixed, regard its groups as a single coordinate group, retaining the prescribed forces, including absence of force across a virtual contact. Ordering the internal merger edges before their enclosing edges makes the full change of variables triangular. Its Jacobian is the product of (6.11) and the endpoint-overlap volume factors. No derivative of a many-particle scattering map is introduced.
  Earliest-contact and no-prior-hit tests are kept as indicators. Fix a deterministic ordering of candidate contact pairs and resolve simultaneous first contacts by that ordering; retain the resulting strata rather than asserting that all ties are null. The area formula applied to the translation map in (6.11) gives zero spatial-translation measure to its nontransverse images. Endpoint overlaps are represented separately by their volume pins. For each discrete merger forest and tie stratum the inverse reconstruction is unique outside the nontransverse images: the pin data recover its relative translations, and the prescribed flows recover the coordinates. There are at most $\( p J \)^(C p)$ merger/partner choices. Singleton cells have one ordinary parent choice, in the original coordinates. In the global coordinates there can be additional choices even for an irregular reroute; they are included in the present $\( p J \)^(C p)$ bound. This coarse multiplicity is used only in the present geometric-gain estimate. The factors $epsilon^2$ cancel the activity normalization. Multi-pin internal volumes and endpoint factors retain the bounds of Lemma 29.
  For regular singleton vertices belonging to the selected trees make (6.5), followed by (6.6). Keep the absolute terminal velocities of every other floating component among the known coordinates $xi$; do not replace them by relative velocities depending on a future anchor. The parent state is known before that vertex, so these substitutions remain triangular across cells. Partition the source positions into summability boxes. The energy bound restricts all velocities and displacements to polynomial ranges; source boxes contribute the weights $product_i a_(i \, k_i)$ of (6.9). Every integrated top position is within a polynomial displacement of its own source box, giving a polynomial volume per top. The sum of the source-box weights is exactly $cal(A)_p$. On each box choice, bound every remaining flux and compact radial density by a polynomial in $p$, and enlarge coordinate domains to product ranges. Let $d \| frak(I)_(bold(k)) \|$ be the absolute chart measure of the activity-normalized integral of Section 5, restricted to these source boxes. It has the domination
  #[#set math.equation(numbering: n => "(6.12)")
   $ d \| frak(I)_(bold(k)) \| lt.eq #scale(x: 180%, y: 180%)[\(] product_i a_(i \, k_i) #scale(x: 180%, y: 180%)[\)] \( p J \)^(C p) thin d nu_0 \( xi \) product_(ell = 1)^k d nu_ell \( theta_ell \) . $ <exp:product-domination>]
  The reference measures are finite product measures. Put the entire ordered #emph[global-chart] time vector in $xi$, including all selected launch times, internal birth times, removals, and lifetime cuts. It is fixed before exposure: a visible parent must be removed at a known time, even while the output velocities of its genuine launch remain hidden. The block $theta_ell$ contains the relative velocities, radial impact parameters, and rotations in tree $ell$. The variable $xi$ contains all other chart coordinates and the fixed genuine/passage types. At a rerouted vertex, the original required contact time is derived from the reconstructed flow and retained only through its indicator; it is not an additional independent time. Original and global pin times coincide on the selected trees. The tube estimate is uniform in the fixed time vector, including all retained spacing restrictions. Normalize their polynomially bounded total masses and absorb them in $\( p J \)^(C p)$. Equation (6.12) is applied to the entire joint integral. We never divide by a conditional mass of an admissible sector. In particular, a rare sector is not asserted to have bounded normalized conditional density.
  #emph[Visible, dormant, and private states.] Fix a list specifying the order of exposures, the one or two selected trees revealed at each exposure, and the partner lives or internal divergences and cell/ray segments involved. There are at most $\( p J \)^(C p)$ such discrete choices. Each selected tree is revealed once. The list does not fix the exposure times; these will be recovered successively from the blocks it reveals. We first describe the state and its updates between exposures.
  Within a cell the state has three parts: anchored visible labels with known phase points; selected trees that have already launched and remain hidden; and components of added labels that have not yet merged with any rooted component. Call the last components #emph[dormant]. Every dormant component is omitted from the bath, whether or not it contains a selected label. In particular, a nonselected singleton or a multi-label addition is not represented in the bath by an absolute prelaunch path whose later anchor has yet to be determined.
  For a dormant component $C$ with known parameters, choose one terminal position as origin. Its terminal velocities, internal endpoint offsets, and already specified internal merger pins determine relative paths $q_i^C \( t \)$ and velocities $v_i^C \( t \)$, up to one common translation. Use the original force partition restricted to $C$ to compute these paths; a virtual internal merger changes the coordinate component, not the force partition. These are functions of $xi$ and already revealed blocks only. A selected regular addition is a singleton in its cell. Its as yet unknown relative velocity is kept in its hidden block and is used only when its known parent state is available at launch. Internal additions on an already hidden selected tree are handled privately in that tree, using its block. They are not part of the visible bath. Its private paths follow the scheduled isolated binary scatterings and free passages, with all later relative parameters fixed in laboratory axes. On the enlarged product domain these paths continue through unlisted hypothetical contacts without adding forces. They therefore retain the affine representation (6.7). Agreement with the prescribed whole-cell dynamics is required only up to the tree’s first defect on the retained domain.
  Read the fixed global merger times in backward order. If two dormant components merge, the contact normal and time fix their relative translation by (6.11). Install that relative translation inside their union and continue the restricted dynamics of the union, retaining one free common translation. It remains dormant. No absolute position or force from it is used in the visible evolution. Its internal mergers precede its first rooted merger in this construction.
  Suppose next that $C$ first merges with the rooted pool at fixed time $t$, through its label $i$ and a visible label $j$. With the normal oriented from $j$ to $i$, set
  #[#set math.equation(numbering: n => "(6.13)")
   $ a_C = x_j \( t \) + epsilon n - q_i^C \( t \) . $ <exp:dormant-install>]
  Install every label $ell in C$ at $\( a_C + q_ell^C \( t \) \, v_ell^C \( t \) \)$ and thereafter evolve the enlarged rooted system with its original prescribed forces. The common translation uses only the visible anchor and the known relative state. Endpoint rooting uses the corresponding overlap displacement in place of $epsilon n$. For a selected launch this rule first computes its parent point and velocity independently of its hidden block. A genuine launch then hides both outputs, including the continuing parent; a passage launch hides only the new child. No velocity of an unrevealed selected output is needed to continue the remaining visible system.
  The selection in Lemma 37 rules out an outside primary pin whose first rooted target belongs to a selected hidden tree. This includes rerouted singleton targets, multi-pin targets, and endpoint targets. An unchanged singleton pin into a hidden branch is its original descendant and uses that tree’s private block. The launch antichain therefore ensures that the parent of a different selected tree is visible when that tree launches.
  At a listed exposure, reveal the indicated block or pair of blocks, install the current private states, and resume the original prescribed force systems. A virtual contact reveals the block without changing a force. An internal defect reveals its tree and resumes its prescribed internal system. Future additions whose data have just been revealed remain dormant until their own merger times; revealing a block does not insert all its future labels immediately. No coordinate change at the random exposure time is made. The independent variables remain the global whole-cell coordinates in (6.12).
  At a cell boundary carry the visible root states to the next cell, retain the private states of continuing hidden lines, and initialize that cell’s new additions as dormant. A line that terminates is removed according to its prescribed lifetime. These updates use the global time vector already fixed in $xi$, including the removal time of a parent hidden by a genuine launch.
  #emph[Recovering the listed exposure times.] Suppose the first $m - 1$ entries have been replayed. The visible evolution now uses only $xi$ and those revealed blocks. To replay entry $m$, supply the one or two blocks named in that entry and construct their private paths from their launch states. Starting after the preceding replayed exposure, find the first eligible contact of the listed type on its listed segments, in backward chronological order with a fixed order for ties. At that time make the revelation update just described. If there is no such contact, the list contributes zero. The same tie order permits successive entries at the same physical time. In this search we neither compare with a contact involving another still-hidden block nor test that such a block has had no earlier hit. These restrictions from the original first-exposure event are dropped.
  The replay retains a revealed tree’s private path before revelation and its resumed path afterward. They join at the installed phase point. Thus a later test may use the whole past of a previously revealed life, even when that life was hidden at the later-tested tree’s launch. Both this past and the replayed revelation time depend only on the previously revealed blocks. In particular, revelation is not a new spatial placement.
  #emph[Definition on the product domain and agreement.] The enlarged product ranges need not satisfy the original energy and isolation tests. Choose a polynomial speed limit $V_p$ strictly larger than the actual speed bound on $cal(K) lt.eq R p$. Stop each visible simulation at its first violation of that limit or at failure of a validity condition for its known finite flow. Apply the same known-data rule to a dormant relative flow needed for an installation. Keep stopped positions constant afterward, with zero velocity for any subsequent launch. If a prescribed visible anchor is unavailable, the list contributes zero and its replay ends. These rules use only visible and already revealed data. In particular, neither future contact compatibility nor a dormant or hidden no-prior-hit test is used to continue the simulation. Its visible portions are $V_p$-Lipschitz for every value of the product coordinates.
  This exterior stopping rule is not a bound obtained by inspecting a hidden tree. Its private scheduled paths instead inherit the known launch-parent velocity and add at most $M$ compactly bounded relative increments and isolated scattering arcs. Their speeds therefore have a polynomial bound, uniform in the hidden rotations. The common Galilean drift cancels in the arc-to-ray error, leaving the bound $C_M epsilon^.96$ in (6.7). Unlisted contacts do not alter those paths. Their private pasts and the resumed visible portions thus give polynomially Lipschitz exterior curves. The affine representation and tube estimate remain available on the enlarged domain, without asserting an energy inequality for its artificial trajectories.
  We verify agreement on the retained chart stratum with the specified actual exposure list. Before a component’s first rooted merger it has no contact with an anchored path. An earlier contact with a selected hidden path would itself be an earlier rooted merger, and its outside hidden target would have been excluded. Omitting a dormant component therefore changes no rooted motion before its scheduled installation. This remains true within an original force group, since finite range makes the cross force zero before contact. A dormant–dormant merger recovers the relative states up to one common translation, and (6.13) recovers that translation at a rooted merger.
  Before the next actual first defect, the hidden private continuations are their original isolated binary paths. Thus the next listed contact found by the replay occurs at its actual time and installs its actual phase points. Uniqueness then gives agreement of the resumed visible flow. Induction over the list proves agreement at every revelation; the energy bound ensures that the visible stop is not reached before any tested exposure. No bound on the number of internal bath collisions is used. Connectivity roots every added component by the earlier cell boundary on this stratum. A hidden–visible contact at a cut is an exposure or an excluded cut irregularity, and the intact-polymer condition prevents a hidden force from being transferred silently through a cut. Hence the same induction passes through all cells and macro cuts.
  We have defined curves on the entire product domain and proved that they contain every hit event from the retained stratum. Outside that stratum they need only have the stated dependence on revealed blocks and the uniform speed bounds. No hidden coordinate has been conditioned on or renormalized in this construction.
  #emph[First-hit blocks.] A hit of two hidden trees reveals them both and uses one estimate; every other exposure reveals one tree. Thus the fixed list has at least $k \/ 2$ entries. Before its next test the bath and launch anchors depend only on $xi$ and previously revealed blocks. Fixing the nonangular parameters of the next block gives (6.7) against an independent exterior.
  For a one-tree test of $B$, the initial-interval hypothesis of Lemma 38 also needs verification after earlier exposures. Fix $xi$ and the previously revealed blocks. Their replayed paths, including the private pasts retained at their revelations, use no parameter of $B$. Before its own launch the continuing parent of $B$ remains visible. On the retained domain these curves agree with the original paths; on the enlarged domain their speed bounds were supplied above.
  The launch cell of $B$ has exactly one addition across all factors, and its boundary gate excludes a cut in the initial $2 tau_epsilon$ interval. Thus every exterior life tested before elapsed time $tau_epsilon$ was already displayed at $B$’s launch; an earlier tree’s revelation during this interval merely makes its independent private past available. Extend the tested life back to that launch using the paths just constructed. Except for the unchanged parent of a passage, retain the gate that this extension starts farther than $epsilon^.85$ from $B$’s launch parent, and declare the enlarged early test empty if the gate fails. The gate depends only on $xi$ and previously revealed blocks, and it holds on the selected good domain by separated original parents and the agreement induction. The initial offset is $O \( epsilon \)$ and $V_p tau_epsilon = o \( epsilon^.85 \)$, so the gate rules out an early hit.
  For the unchanged passage parent, first consider the retained domain. At launch it is separated from every other old displayed path by $epsilon^.85$. The original polynomial speed bound and the absence of another birth or cut in the initial $2 tau_epsilon$ interval preclude a third-path force there. After the prescribed passage the nonzero free relative ray cannot return to that parent. Thus an original first defect against the unchanged parent cannot occur at elapsed time below $tau_epsilon$. On the product domain we consequently make this parent test only at elapsed times at least $tau_epsilon$; no freeness of its artificial stopped path is asserted. The tube estimate then applies without an initial-interval gate.
  Exterior segments born later are tested only after $tau_epsilon$; the same globally singleton cell and boundary gate exclude an earlier installation. For all tests at elapsed times at least $tau_epsilon$, apply the tube bound without a launch-separation gate. These extensions and gates are independent of $B$’s tested rotation.
  For a two-tree test, call $A$ the earlier-launched tree and $B$ the later-launched tree in backward chronology; the retained spacing excludes equal launch times. Fix all of $A$’s block first and integrate $B$’s launch rotation. Both launch anchors were computed without either hidden block. Retain the gate that $B$’s launch parent is at least $rho = epsilon^.85$ from the already anchored paths of $A$ at that launch. The gate depends on $A$’s fixed block and the visible anchor of $B$, not on $B$’s launch rotation. If it fails, define this enlarged pair test to be empty. On the original selected good domain it holds by parent separation. During elapsed time $u < tau = tau_epsilon$ after $B$’s launch, the initial offsets and displacements are bounded by $C epsilon + C p^C tau = o \( rho \)$. The retained time spacing and boundary gate leave no other birth or cut in this interval. Thus no $A$–$B$ hit is possible there; $B$’s own prescribed pair is not an $A$ path. For $u gt.eq tau$, apply Lemma 38 to $B$ against the fixed paths of $A$. The bound is uniform in $A$’s block, so its subsequent integration preserves it. Internal defects use their divergence parameters as in that lemma. The uniform bound for each one- or two-tree test is $rho_p = p^C epsilon^c$.
  For a fixed list, let $B_m$ denote the one- or two-tree block revealed by its $m$th entry, and let $A_m$ require that its replay finds the listed contact and satisfies the gates used in the corresponding test. If the replay has already failed, set $A_m = diameter$. The construction and the uniform one-test bound give
  $ A_m = A_m \( xi \, theta_(B_1) \, dots.h \, theta_(B_m) \) \, #h(2em) integral upright(bold(1))_(A_m) thin d nu_(B_m) lt.eq rho_p \, $
  The blocks $B_m$ are disjoint, and the retained event for this list is contained in $⋂_m A_m$. The preceding no-hit requirements on unexposed blocks have been dropped, without renormalizing their measures. Integrate in reverse block order in (6.12). Each last remaining restriction gives the factor $rho_p$, while all earlier restrictions are independent of that block. The resulting factor is $rho_p^(\# { B_m })$. Summation over the guessed lists and the source-box weights, whose sum is $cal(A)_p$, proves (6.10). ◻
]

=== 6.5 Extensive defects <extensive-defects>

#thm([Proposition 6.5.])[
  (An extensive-defect gain).  #emph[Fix $0 < alpha lt.eq 1$, $A > 0$, the layer count, and the polynomial size exponent $a > 0$. There exist fixed constants $theta = theta \( alpha \, A \) > 0$, $p_0 < oo$, and sufficiently small $epsilon_0 > 0$ such that, after the compact cutoffs are chosen, the following bound holds uniformly for 
$ 0 < epsilon < epsilon_0 \, #h(2em) p_0 lt.eq p lt.eq P^a \, #h(2em) h_0 lt.eq theta p . $

 For histories with at least $alpha p$ affected lives, their absolute integral, divided by the source factor $cal(A)_p$ of (6.9), is bounded by the sum of the exceptional-parameter contributions bounded by $e^(- A p)$ and a contribution bounded by 
#[#set math.equation(numbering: n => "(6.14)")
 $ P^(C_L p) epsilon^(c_L p) . $ <exp:extensive>]

 The constants $c_L > 0$ and $C_L$ are fixed before $epsilon arrow.b 0$. The assertion includes recollisions, interference with a long-lived cluster, and contacts with detached or subtracted trajectories.]
] <exp:defects>

#proof[
  We divide by the explicit source factor $cal(A)_p$; if that factor is zero the integral is zero. First make the high-energy, multi-addition, endpoint, noncompact, long scattering, close-time, and crowded-parent exclusions of Propositions 32 and 34. Apply Lemma 36 to premature contacts in the original coordinates. Next choose $M$ and the irregular fraction in Lemma 37. A positive fraction of the affected lives then yields $k gt.eq c_(alpha \, M) p$ regular disjoint trees. Choose $theta$ and $p_0$ from Lemma 37, decreasing $theta$ if the finite-participant transfer below requires a smaller affected fraction. Every exclusion is requested at a sufficiently increased fixed accuracy so that their sum is at most $e^(- A p)$. Proposition 39 gives (6.14). Since $p$ and $J$ are fixed powers of $P$, their logarithms are $O \( log P \) = o \( P \)$, and hence the expression in (6.14) is smaller than $e^(- A p)$ for all sufficiently small $epsilon$, uniformly in the indicated range of $p$: its logarithm per label is at most $C_L log P - c_L \| log epsilon \|$. For a fixed number $s$ of top roots, this applies to every $p gt.eq m$ once
  $ m gt.eq max { p_0 \, ceil.l s \/ theta ceil.r } . $
  Thus it supplies a uniform tail in $p$, rather than a statement requiring an $epsilon$-dependent limit of $s \/ p$.
  The affected lives used by the algebraic centering argument transfer to this geometric count with a fixed finite-participant loss. An unchanged algebraic extra contact marks its participating geometric lives. If a birth is rerouted to an earlier virtual global pin, mark its new child and the old and new parents, at most three lives. The later original required contact is then a geometric defect of that child unless it is an already charged irregularity. A rerouted genuine contact cannot disappear by calling it a different primary birth: each added label has exactly one primary geometric pin. This accounts for all discrepancies between the two forests. The charging statement of Proposition 25 may therefore be used with a reduced positive fraction.
  No estimate asserts that an already exposed bath has few collisions or no bound cluster. Such a bath is allowed in Lemma 38 through its speed bound. Its first influence on each fresh regular tree costs a geometric factor; primary births into a small crowded bath are included in the parent-choice exclusions. This is why the argument treats interference with clusters without deleting clusters from the actual dynamics. ◻
]

=== 6.6 A marked history of fixed size <a-marked-history-of-fixed-size>

The extensive estimate is not needed, and does not directly apply, when the number of displayed labels is fixed. In particular, it does not cover an array consisting only of several top roots. We record the required finite-size statement separately.

#thm([Corollary 6.6.])[
  (Finite marked histories).  #emph[Fix the layer count and an integer $p_(*)$. Sum the absolute integrals of the original prescribed histories with at most $p_(*)$ labels, integrating all top phase points, and suppose their independent source norms in (6.9) are uniformly bounded. The contribution with at least one unprescribed contact, an incomplete isolated scattering at a required cut, an interfering birth, or an endpoint-polymer defect tends to zero as $epsilon arrow.b 0$. This statement includes $p = h_0$ and contacts between distinct top roots. The bounds are uniform over the observation times and shortened endpoint cells in the fixed interval. If instead a source has norm tending to zero, its finite-history integral tends to zero by the same uniform finite-size majorant.]
] <exp:finite>

#proof[
  Work throughout in the original charts, without the coarse global-chart multiplicity. The ordinary parent/time bound of Proposition 31 gives a finite constant depending on $p_(*)$ and $T$ after summing cell locations. Empty cells introduce no extra choice. Its Gaussian bound allows velocity truncation at a fixed large constant, with uniformly small error. The summability-box decomposition may be retained throughout; its weights sum to (6.9), so no spatial truncation depending on the observation time is required.
  Fix next $eta > 0$. Delete births whose time is within $eta$ of another birth and parameters with incoming relative speed or a nonzero output increment smaller than $eta$. The time error tends to zero with $eta$ by the finite-dimensional simplex measure. The parameter error tends to zero by the flux-null statement of Proposition 8 and continuity from above of finite measure. There is no claim of an algebraic rate in $eta$. A scattering lasting more than $epsilon^.96$ has vanishing flux measure. Births within that distance of a cell endpoint have total time measure at most $C_(p_(*)) J epsilon^.96 arrow.r 0$. The multi-addition bounds give a vanishing factor in a cell containing at least two additions, while an overlap pin of an added label costs $mu epsilon^3 = epsilon$ in place of a normalized flux. A close pair of already integrated top roots instead costs an unnormalized spatial volume $O \( epsilon^3 \)$. Endpoint polymers are handled by a spatial spanning forest of these pins. Thus no isolation of a top array has been assumed in this deletion.
  First test additional force-bearing encounters. Before the first such encounter every factor is a finite collection of isolated binary trees, with completed scattering arcs replaced, at a position error $delta_epsilon = C_(p_(*) \, eta) epsilon^.96$, by their elastic broken rays. Purely virtual contacts do not change this reconstruction and are not excluded at this stage. The exact prescribed dynamics after the first force-bearing event is unrestricted. Only its volume and Gaussian majorants are used. There are finitely many ray pairs, divergence vertices, and birth/cut incidences to test.
  Consider first a force-bearing contact between two families issuing from different top roots. Keep the internal collision data of both families fixed and float one family by a common spatial translation $r$. Before their first contact, their motions are independent and translation equivariant. The relative position is $r + G \( t \)$ with $G$ uniformly Lipschitz on the compact parameter set. The translations producing a hit within radius $delta$ have volume at most
  #[#set math.equation(numbering: n => "(6.15)")
   $ C #scale(x: 120%, y: 120%)[\(] delta^3 + T thin "Lip" \( G \) delta^2 #scale(x: 120%, y: 120%)[\)] . $ <exp:spatial-tube>]
  Indeed, sample the time interval at spacing $delta \/ \( 1 + "Lip" \( G \) \)$ and cover each sampled point by a ball of radius $2 delta$. Formula (6.15) is uniform in the locations of the source boxes. Integrating their envelope weights proves that root–root and cross-family contacts have vanishing integral. The same calculation controls two top roots already close at an endpoint. This argument uses the integrated top translations; it asserts no pointwise smallness at fixed top positions.
  For two rays within one family, use their last common divergence. Its nonzero relative output direction is spherical, even though the two individual output velocities can be correlated. Fix all relative data below that divergence in laboratory axes. Their relative position then has the form used in Lemma 38, with elapsed time at least $eta$ whenever another descendant has been born. Before that time the prescribed pair is a straight outgoing relative ray and cannot return. Taking $delta$ larger than $epsilon + 2 delta_epsilon$ gives a vanishing bound. This proves smallness of internal force-bearing recollisions without restricting what happens after the first one. Remove these vanishing physical-defect sets. The complete remaining factor paths are then their prescribed binary paths and free virtual rays throughout their lifetimes. We may now test all virtual contacts on these complete paths; they introduce no new dynamical dependence. Cross-family virtual contacts obey (6.15), and internal virtual contacts obey the same divergence-direction argument.
  The same two tests control a parent being within $epsilon^.85$ of a third path at a scheduled birth: use the spatial translation for different top families and the divergence direction for one family. The prescribed new child is exempt; all other divergences are separated in time by the retained $eta$. Hence the near-parent exclusions needed for finite singleton geometry have vanishing measure without invoking the extensive crowding estimate. For a premature cross-factor contact of an added particle’s full-cell prelaunch ray, use its fresh incoming direction in the original chart, exactly as in Lemma 36; the comparison is with already anchored paths, and no global reparenting is necessary. The unchanged parent of a passage is treated as in the proof of Lemma 38. Thus full-cell ghost segments are included in the finite event list.
  These estimates exhaust a first extra contact or interference of the retained binary histories. They also cover the short displacement and cut errors, after the already removed duration and endpoint-time sets. For fixed $p_(*)$, the number of combinatorial cases is finite and the time sums are the original simplex integrals. Take $epsilon arrow.b 0$ with the velocity and $eta$ cutoffs fixed, then let $eta arrow.b 0$ and the velocity cutoff tend to infinity. The resulting upper bounds depend on the observation time only through its upper bound $T$; shortened cells only reduce their integration domains. This proves uniformity. Finally, replacing one source norm in the finite majorant by a vanishing norm gives the last assertion directly. ◻
]

== 7 Summation, stopping, and convergence <sec:closure>

We now remove the size restrictions used in the finite identities. There are two distinct inductions. The numerical cutoffs are chosen backwards, starting with the last layer. The estimates for events of the actual process are proved forwards, starting with the first layer. An event in layer $j$ is bounded by a finite witness whose input is at the beginning of that layer; only layers strictly before $j$ are expanded to estimate that input. In particular, no propagation-of-chaos assertion is used to bound a stopping event.

All constants denoted by $C$ in the few-crossing calculation below are independent of the number $L$ of layers. They may depend on $T$, on the potential, on the fixed exponent $beta_0$ of Proposition 9, and on the corresponding bounds for $f$ and the initial data. Constants denoted by $C_L$ may also depend on $L$. The compact scattering cutoffs used in Propositions 32 and 40 will be chosen after $L$; they do not enter the few-crossing constant $C$.

=== 7.1 Completed finite histories <completed-finite-histories>

A #emph[completed history] has no unresolved stopped factor, has been expanded through all the layers that it enters, and has undergone the simple-family cancellations at its centered cuts. Its inputs are independent copies of $f$, a one-body residual from Proposition 22, or an initial centered factor from Proposition 4.

We shall need summability also when the highest expanded layer is left uncentered. There are three applications: the finite reference cutoff mismatch $B_j$ in (4.18); a positive history ending in the terminal witness of Definition 18; and the completed cells above a physical stop, together with its positive whole-component continuation. In each case we fix the finite upper block and expand only its lower centered inputs through earlier layers.

An #emph[admissible mixed uncentered upper block] lies within one, possibly shortened, layer. It consists of the signed completed whole-cell terms of Section 3, any independent reference families and residual upper slots from Section 4, and, when a physical stop or a witness requires it, a positive actual-component prefix and an optional final trial cell. All original force systems, contact indicators, pattern restrictions, and whole-component cut rules are retained. Only its lower centered inputs are expanded through earlier layers, with the usual simple-family cancellations there. No cancellation of the upper block’s roots is required.

The starting top labels are counted once. A reference root reuses its deleted upper label and a residual is a one-body source on that label. Choosing physical versus deleted-reference top slots costs at most $2^(h_0)$. Bounded residual and sign alternatives cost at most another $C^(h_0)$, included in the baseline $C^p$. At a birth its original parent fixes its physical or reference family. There is no additional per-birth family choice, and no independent choice of a layer for an already chronologically numbered birth.

At the final endpoint of a one-root witness, “root” means a distinguished label and spatial anchor only. All particles of the final trial system terminate together there, with their full component Hamiltonians retained. No singleton-isolation condition is imposed on the distinguished label at that endpoint. The positive-observable variant in Definition 18 and the terminal convention in Lemma 27 include this case. Earlier cuts obey the usual whole-component rules.

Write

$ p = h_0 + n \, #h(2em) n = sum_j n_j \, #h(2em) q_j = h_j + n_j \, #h(2em) H = sum_j h_j . $

Here $p$ counts independent formal label lifetimes once, $h_0$ is the number of starting upper roots, $n_j$ is the number of labels added in layer $j$, and $h_j$ is the number of roots entering that layer. Starting roots may be centered; after a restart they need not be. In the charge inequality we use $h_0$ as an upper bound for the number of uncentered restarting roots. Thus $H$ counts entries into expanded layers, including the first one, but not the initial inputs at time zero. Those inputs are the initial charges in Proposition 25. Every root position in this section is integrated. A bounded test of those positions and velocities is permitted.

#thm([Lemma 7.1.])[
  (Retained-slot entropy).  #emph[Suppose a term retains $k_j$ slots among $q_j$ available slots at successive cuts. Put $Q = sum_j q_j$ and $H' = sum_j k_j$. Then 
#[#set math.equation(numbering: n => "(7.1)")
 $ product_j binom(q_j, k_j) lt.eq binom(Q, H') lt.eq exp {H' log frac(e Q, H')} quad \( H' > 0 \) . $ <close:slot-bound>]

 In the history expansion $Q lt.eq p + C H$ and $H' lt.eq C H$, up to a fixed number of choices per retained slot. Consequently, when $H lt.eq delta p$, the logarithmic selection cost is at most 
#[#set math.equation(numbering: n => "(7.2)")
 $ C delta p (1 + log 1 / delta) . $ <close:entropy-small>]

 For general $H lt.eq L p$, its cost is at most $C_L^p$.]
] <close:entropy>

#proof[
  The coefficient of $z^(H')$ in $product_j \( 1 + z \)^(q_j) = \( 1 + z \)^Q$ is the sum of the products on the left of (7.1) over all allocations of $H'$. The first inequality follows. The second follows from $binom(Q, k) lt.eq \( e Q \/ k \)^k$. A label contributes an available slot at its first input cut, and an additional available slot each time it is retained across another cut. This gives the asserted bound on $Q$. A bounded number of choices per retained slot contributes $exp \( C H \)$. Bounded choices at first-input slots instead cost $C^p$; these belong to the baseline constant in the history estimate, not to its small retained-slot entropy. The last two assertions follow from the displayed inequalities, using $binom(Q, k) lt.eq 2^Q$ in the general case. ◻
]

#thm([Lemma 7.2.])[
  (Energy and the short-layer factors).  #emph[For a completed history with the above counts, the parent, time, and velocity factors in Proposition 31, before retained-slot and spatial losses, have total integral at most 
#[#set math.equation(numbering: n => "(7.3)")
 $ \( C b sqrt(L) \)^p exp { H + h_0 log_(+) \( 1 \/ b \) } \, #h(2em) b lt.eq 1 . $ <close:energy-factor>]

 The constant $C$ is independent of $L$. A fixed part of the source Gaussian remains available for the spatial estimates.]
] <close:energy>

#proof[
  Use the source sum and augmented squared-speed budget of Lemma 27:
  $ S = sum_(upright("independent inputs ") a) \| v_a \|^2 \, #h(2em) cal(E) = S + 2 B p . $
  By Lemma 27, every active or mixed sum of squared speeds is at most $cal(E)$. The same assertion bounds the sum of squares of the velocities of the independently added free rays. The source sum $S$ is not replaced by terminal kinetic energy: a departing interacting component may have positive potential energy. Retaining its full Hamiltonian gives instead the Gaussian comparison
  #[#set math.equation(numbering: n => "(7.4)")
   $ e^(- beta_0 S) lt.eq e^(beta_0 B p) e^(- \( beta_0 \/ 2 \) sum_a \| V_a \|^2) e^(- \( beta_0 \/ 2 \) S) \, $ <close:source-gaussian>]
  where $V$ is the vector of mixed terminal velocities. Further splitting into a fixed number of portions is allowed. All these exponents are fixed independently of the layer subdivision.
  The source energy depends on the parent prescription. We therefore first partition its domain into shells
  $ r p lt.eq S < \( r + 1 \) p \, #h(2em) r = 0 \, 1 \, dots.h . $
  On shell $r$ use the deterministic upper budget $E_r = \( r + 1 + 2 B \) p$. Parent choices that cannot belong to this shell are killed. The parent-sum bound of Proposition 31 then applies with this common budget; it does not require moving a prescription-dependent energy through a sum over parents. At a birth in layer $j$, if $u lt.eq q_j$ paths are present, its summed flux is bounded by
  $ C u (1 + \| w \| + sqrt(E_r \/ u)) lt.eq C q_j (1 + \| w \| + sqrt(E_r \/ q_j)) . $
  Let $m$ count multiple-insertion participants and endpoint pins, and let $cal(O)$ be the ordinary births. The nonordinary shell-speed factor in Proposition 31 is $\( r + 2 \)^(m \/ 2)$. Pad the speed product with $h_0$ unit factors. AM–GM and $sum_j n_j \/ q_j lt.eq L$ give
  #[#set math.equation(numbering: n => "(7.5)")
   $ & \( r + 2 \)^(m \/ 2) product_(i in cal(O)) (1 + \| w_i \|^2 + E_r / q_(j \( i \)))^(1 \/ 2)\
 & #h(12mm)  lt.eq (C L \( r + 2 \) + frac(\| V \|^2, p))^(p \/ 2) . $ <close:amgm>]
  Indeed the sum of the $p$ squared factors is at most $p + m \( r + 1 \) + \| V \|^2 + L E_r$. This form of the estimate remains valid after the parent majorization has enlarged the velocity integral to the full product Gaussian; it does not incorrectly retain a source-shell constraint on that enlarged integration domain.
  For a fixed product Gaussian $gamma$,
  $ integral (1 + frac(\| V \|^2, p))^(p \/ 2) thin d gamma \( V \) lt.eq C^p . $
  To check this, reserve half of its Gaussian exponent and bound $e^(- c u) \( 1 + u \/ p \)^(p \/ 2)$ by $C^p$ for $u gt.eq 0$; the remaining Gaussian integrates with an exponential-in-$p$ normalization. Applying this to (7.5) gives $\[ C sqrt(L \( r + 2 \)) \]^p$. A fixed portion of the source-energy factor in (7.4) gives $e^(- c r p)$. Thus the sum of the shell bounds is at most
  #[#set math.equation(numbering: n => "(7.6)")
   $ C^p sum_(r gt.eq 0) e^(- c r p) #scale(x: 120%, y: 120%)[\(] C L \( r + 2 \) #scale(x: 120%, y: 120%)[\)]^(p \/ 2) lt.eq \( C sqrt(L) \)^p . $ <close:shell-sum>]
  For the last inequality, bound $e^(- c r \/ 2) sqrt(1 + C \( r + 1 \))$ uniformly in $r$ and sum the remaining geometric series. Reserve an additional fixed Gaussian portion before this calculation if spatial factors are present.
  In each layer the ordered-time volume is $b^(n_j) \/ n_j !$. Moreover,
  $ frac(q_j^(n_j), n_j !) lt.eq e^(n_j + h_j) \, $
  because $n ! gt.eq \( n \/ e \)^n$ and $n log \( 1 + h \/ n \) lt.eq h$. Hence the parent and time product is at most $b^n e^(n + H)$. Combining this with (7.6), and using $n = p - h_0$, proves (7.3). ◻
]

There are two further summation points. First, the number of nonnegative layer occupancies with total $n$ is

#[#set math.equation(numbering: n => "(7.7)")
 $ binom(n + L - 1, L - 1) = exp \( o \( p \) \) $ <close:layer-count>]

for fixed $L$ and growing $p$. Births are chronologically ordered within consecutive layer blocks; there is no independent choice among $L$ layers for each already numbered birth. Second, the spatial factors in Proposition 31, allowing even a separate localization at each cut, have logarithm at most

#[#set math.equation(numbering: n => "(7.8)")
 $ C H + C H log (1 + frac(L cal(E), H)) \, $ <close:spatial-loss>]

with $H$ replaced by $H + h_0$ if the upper-cut convention requires it. This follows by the weighted concavity of the logarithm applied to the displayed top-line displacement bound in that proposition. On shell $r$, a reserved factor $e^(- c r p)$ absorbs the dependence on $r$ in (7.8). If $H lt.eq delta p$, the remaining logarithmic cost is

#[#set math.equation(numbering: n => "(7.9)")
 $ C delta p (1 + log (1 + L / delta)) . $ <close:spatial-small>]

For example, use $1 + a \( r + c \) lt.eq \( 1 + a c \) \( 1 + r \/ c \)$ with $c > 0$ fixed, and reserve part of $e^(- c r p)$ for $delta p log \( 1 + r \/ c \)$. This also explains why no independent Gaussian is needed for a carried root at each cut.

The multiple-insertion and endpoint-overlap mesh factors in Lemma 29 and Proposition 31 may be bounded by their ordinary birth factors after $J$ is chosen. Indeed their extra factors are negative powers of $J$ or positive powers of $epsilon$, whereas all their remaining per-participant costs are fixed powers of the polynomial label cap. Choosing the power in $J$ last makes each such extra product at most one. This step absorbs their constants, including constants depending on $L$; it does not introduce a new $C_L$ for every ordinary single birth. Their unbounded shell-energy factors have already been included in (7.5), rather than absorbed by a fixed mesh power.

#thm([Proposition 7.3.])[
  (Summability of completed finite terms).  #emph[Fix any desired number $a > 0$. One can choose a finite $L$, then the rarity cutoffs, with the following property. For every fixed polynomial label cap $p lt.eq P^A$, choose $J$ to be a sufficiently large fixed power of $P$. There exist $eta_L > 0$ and $p_L < oo$ such that, for sufficiently small $epsilon$, the sum of the integrated absolute weights of completed histories with exactly $p$ labels is at most 
#[#set math.equation(numbering: n => "(7.10)")
 $ e^(- a p) \, #h(2em) p gt.eq p_L \, #h(2em) h_0 lt.eq eta_L p . $ <close:complete-tail>]

 The same bound holds for an admissible mixed uncentered upper block followed by centered lower layers, after the lower simple-family cancellations. It is uniform over shortened endpoint cells and layers and over tests of absolute value at most one. For the original centered expansion, in which the upper simple-family cancellations are also made, every fixed-size term with a retained centered upper root tends to zero after integration.]
] <close:summability>

#proof[
  First choose $L$ so that $b = T \/ L$ is within the short interval of Proposition 22, is at most one, and satisfies
  $ C T \/ sqrt(L) < e^(- 4 a - 20) . $
  Here $C$ is the constant in Lemma 43, including the independent source-envelope constants. Its independence of $L$ is essential. Next choose $delta > 0$ small enough that (7.2), (7.9), and the factor $e^H$ together cost at most $e^(a p \/ 4)$ whenever $H lt.eq delta p$. Choose $eta_L$ still smaller so that the upper-root factor in (7.3) and any upper-root localization also have logarithm at most $a p \/ 4$ for $h_0 lt.eq eta_L p$. The finite occupancy factors in (7.7) are absorbed by increasing $p_L$. The histories with few crossings, $H lt.eq delta p$, then obey (7.10) with room to spare.
  For the complementary histories apply Proposition 25, after reducing $eta_L$ to at most $delta \/ \( 2 L \)$. If $d$ is the number of distinct marked lives, $r$ the number of residual factors, and $i$ the number of retained initial singleton inputs, then
  $ d + r + i gt.eq theta_L p \, #h(2em) theta_L = frac(delta, 2 L^2) > 0 . $
  The fixed-factor transfer between algebraic families and the geometric pin forest in Remark 26 can be absorbed by reducing $theta_L$. A new geometric first pin is still a single birth. If it reroutes a birth to another displayed family, the original required later encounter is a defect; it is not counted as another birth.
  The unrestricted finite-term bound is $C_L^p$ by Proposition 31. If at least $theta_L p \/ 3$ charges are residual or initial factors, their additional weight is at most
  $ gamma_epsilon^(theta_L p \/ 3) \, #h(2em) gamma_epsilon = max { C epsilon^c \, C eta_epsilon } arrow.r 0 \, $
  where $eta_epsilon$ is the supremum of the fixed summed spatial Gaussian residual norms in Proposition 22, taking the maximum over the finitely many choices $K_j$. Its common exponent is not weakened through the layers. This contribution beats any fixed $C_L^p$ once $epsilon$ is small. No rate for the residual is needed.
  Otherwise an extensive number of lives is marked. The tunable parameter, tree, and multiple-insertion discards of Proposition 32 and Lemma 37, followed by Proposition 40, give a bound of the form
  #[#set math.equation(numbering: n => "(7.11)")
   $ C_L^p e^(- A_1 p) + P^(C_L p) epsilon^(c_L p) . $ <close:many-cross>]
  The desired $A_1$ is chosen after $L$ and $theta_L$. Choose it larger than all the fixed exponential costs plus $4 a + 20$. Reduce $eta_L$ to the top-root fraction supplied by Proposition 40 for affected fraction $theta_L \/ 3$ and this accuracy, and increase $p_L$ to its fixed size threshold. These choices leave the preceding few-crossing estimates valid. The second term is also at most $e^(- \( 4 a + 20 \) p)$ for small $epsilon$, because $p lt.eq P^A$ and $log P = o \( \| log epsilon \| \)$. The expensive exposure guesses occur only in this geometric-gain term, not in the term controlled solely by residual smallness. This proves (7.10) in the many-crossing case.
  The argument used only the finite-history estimates and the finite centered identities. An admissible mixed upper block is allowed because the charge estimate imposes no condition on its $h_0$ upper roots. Signed completed cells, reference families, and a positive actual prefix are all admissible finite terms; taking their absolute weights does not change their force rules or contact constraints. The upper physical/reference choices cost only $2^(h_0)$, with bounded alternatives absorbed in $C^p$. The original parent determines a birth’s factor, so these choices introduce no extra parent power. Ordinary births across all simultaneous factors retain the ordered-time bound; multiple insertions have the mesh factors already estimated. Below this one upper layer every retained input is an ordinary centered slot, so Proposition 25 applies with precisely the same allowance $L h_0$. The source, spatial, and parent bounds, and hence both crossing cases, remain unchanged.
  Finally fix the total number of labels. The path argument in Proposition 25 makes every surviving centered upper root lead to an initial small factor, a vanishing residual, or a marked finite history. For the last case, first restrict velocities and scattering parameters to compact regular sets. Corollary 41 makes its integral tend to zero. The complement has arbitrarily small integral by the Gaussian and flux bounds, so the compact restriction may then be removed. This finite-size argument does not mistake a fixed small-parameter cutoff for a quantity tending to zero. Ordered time domination and shortened cells make the argument uniform in the endpoint time. ◻
]

#prodef([Remark 7.4.])[
  (Dependence on the polynomial size cap).  The rarity cutoffs, top-root fraction, and fixed size threshold in Proposition 44 can be chosen independently of the exponent $A$ in $p lt.eq P^A$. Indeed, the source-energy cutoff follows from $C_L^p e^(- c R p)$, the compact-parameter cutoffs from their one-step probabilities, and the terminal-tree cutoff from $C_(*)^p M^(- zeta alpha p \/ 16)$, with affected fraction $alpha$ and fixed comparison exponent $zeta > 0$ as in Lemma 37. These choices depend on the fixed layer count, source bounds, affected fraction, and requested exponential accuracy, but not on $A$. In the geometric estimates, the losses involving $p$ and $J = ceil.l P^Q ceil.r$ are polynomial powers paid by positive powers of $epsilon$. For each fixed $A \, Q$ and $c > 0$,
  $ P^(C \( A \, Q \) p) epsilon^(c p) = exp #h(-0.16667em) {p #scale(x: 120%, y: 120%)[\(] C \( A \, Q \) log P - c \| log epsilon \| #scale(x: 120%, y: 120%)[\)]} $
  is smaller than any prescribed exponential in $p$ for sufficiently small $epsilon$. For a fixed crowding fraction $delta$, the grid loss is absorbed by the fixed threshold $p gt.eq 8 \/ delta$. For the multiple-insertion mesh factor, choose $Q > 2 d A$ as in Proposition 31. Thus only the required mesh exponent and the sufficiently-small-$epsilon$ threshold depend on the polynomial cap. This permits that cap to be calculated from the deterministic stopping schedule after the rarity cutoffs have been fixed, and the cell mesh to be chosen last.
]

=== 7.2 Finite witnesses for actual-process events <close:witnesses>

We give an auxiliary event slightly stronger than separate caps on trial components and actual backward histories. It makes the inherited-threshold issue explicit.

Fix a full mesh of $\[ 0 \, T \]$ with layers $1 \, dots.h \, L$ and cells of length $Delta = b \/ J$. At the start of a layer, the ancestry of a label is its entire instantaneous polymer. At the end of a cell, define its #emph[actual layer ancestry] recursively as the union of the ancestries, at the start of that cell, of all labels in its actual whole-cell contact component. This definition uses the full Newtonian dynamics and resets at each layer start. Labels in one instantaneous polymer at a mesh cut have the same ancestry: they belonged to the same preceding whole-cell component, or to the same initial polymer at the layer start.

At a cell start take any trial subsystem that is a union of the actual instantaneous polymers. Evolve that subsystem in isolation during the cell. For each component of its cumulative contact graph, take the union of the actual layer ancestries of its labels at the cell start. Its #emph[ancestral size] is the cardinality of that union. For a threshold $D$, let $cal(B)_j \( D \)$ be the event that an ancestral size exceeds $D$ somewhere in the first $j$ layers, or that a layer-start polymer there already exceeds $D$. All trial subsystems are included in this definition. In particular, on its complement every trial cell component has at most $D$ labels, and every actual backward history within a layer has at most $D$ labels.

#thm([Lemma 7.5.])[
  (First witness at an inherited threshold).  #emph[Let $D gt.eq 1$ be an integer. For a finite microscopic cloud, a first occurrence of $cal(B)_j \( D \)$ admits a witness in some layer $i lt.eq j$ with one distinguished integrated upper label and between $D$ and $2 D^2$ formal labels. The witness consists of positive actual component histories before its last cell and one trial subsystem in its last cell. Every starting or departing set respects whole instantaneous polymers. The bound is independent of the cutoff assigned separately to any earlier layer. The weighted ancestral construction above in fact permits $D < p lt.eq 2 D$.]
] <close:witness-extraction>

#proof[
  Throughout this proof the threshold is the same number $D$. Take the first violating cell in the preceding prefix. There cannot be a previously unaccounted giant polymer at its start. A giant polymer at a layer boundary was contained in the preceding actual cell component, and hence would have violated the same threshold earlier. Initially the exclusion makes all polymers singletons.
  Before the violating cell, every current polymer has an actual ancestry of size at most $D$. Regard these polymers as atoms, with their ancestry sets as weights. In a violating trial system follow the increasing contact-component graph until a union of weights first exceeds $D$. Before this merger all participating components have weight at most $D$. At a binary merger their union has size at most $2 D$. If several contacts occur together, select connected pre-contact components one at a time, stopping when the union first exceeds $D$. The last added component has weight at most $D$, so the same bound holds. Thus ties require no probabilistic convention. Before the selected merger these components have had no contacts with the other trial components; their trajectories up to that time are consequently their own isolated trajectories.
  Let $U$ be the union of the selected current polymers and let $W$ be the union of their actual ancestries. Then
  $ D < \| W \| lt.eq 2 D \, #h(2em) U subset.eq W . $
  Trace the members of $U$ backwards through their actual whole-cell components to the beginning of layer $i$. The union of these histories has exactly the required ancestry labels in $W$. An ancestor not in $U$ terminates at its prescribed earlier cut. In particular, it is not kept artificially active in the last trial cell. The last cell runs only the isolated flow on $U$. At every such removal a whole close component departs; otherwise a contact across that cut would have included the departing label in the next required polymer.
  Extend this last isolated trial flow to the fixed end of its cell. It already has the required connected-contact event before the selected merger, even if its subsequent path differs from the original larger trial system. All coordinate changes can therefore be made at fixed times; no stopping-time Jacobian is introduced. Choose a label $a in U$ as the upper distinguished label. The trial contact graph connects $U$ to this label, and the actual ancestry graphs connect all remaining labels in $W$ to $U$ backwards, cell by cell. All of $U$ terminates at this final endpoint. Its distinguished label need not be isolated from $U \\ { a }$ there; in particular, this construction does not exclude a cluster persisting to the end of the cell. Keep the full terminal Hamiltonian before applying stability, and integrate all terminal coordinates. Connectivity supplies $p - 1$ translation pins, with one spatial anchor and hence $h_0 = 1$; endpoint close components use the endpoint pins of Lemma 29. This gives the asserted positive history. Keeping the cruder union of at most $2 D$ histories of size at most $D$ would give the stated safe bound $2 D^2$. ◻
]

The lemma is used as a union bound, not as a statement about a conditioned law. The prior-good and first-occurrence restrictions are used to extract the bounded witness and are then dropped. Its start set is a union of actual polymers, so factorial expectation integrates its nonnegative kernel against the #emph[unconditional] isolated marginal at the start of layer $i$. Only its last cell is a trial cell. There is no factor for choosing an arbitrary subset of all $N$ polymers: the extracted witness already records the selected labels, and the factorial sum counts those labels once.

Index the witness sum by the resulting positive whole-cell prescriptions, counting each prescription once. For a fixed final set $U$ and distinguished label $a$, its last-cell kernel is $c_I^({ a }) \( U \) sans(J)_({ a } \, U)^I$, with any retained witness restriction included as an indicator bounded by one. The earlier cells are the successive positive root-component decompositions described after Definition 17. Different extraction choices that yield the same prescription do not produce additional summands.

Writing $cal(W)_(i \, m \, D)$ for the sum of these positive one-root witness kernels in cell $m$, the preceding observation gives the finite inequality

#[#set math.equation(numbering: n => "(7.12)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] cal(B)_j \( D \) #scale(x: 120%, y: 120%)[\)] lt.eq mu sum_(i lt.eq j) sum_(m lt.eq J) ⟨cal(W)_(i \, m \, D) \, tilde(F)^epsilon \( t_(i - 1) \)⟩ . $ <close:witness-union>]

The notation on the right sums the relevant input orders between $D + 1$ and $2 D^2$ with their factorial weights. The factor $mu$ undoes the normalization of the single distinguished label. Birth-cell choices inside each witness are summed by ordered contact times as in Proposition 31; they introduce no additional empty-cell multiplicity. The displayed $L J$ choices locate only the final witnessing cell.

=== 7.3 Raw amplification and the cutoff schedule <raw-amplification-and-the-cutoff-schedule>

#thm([Lemma 7.6.])[
  (Integrated amplification and bad clouds).  #emph[Consider a finite completed block containing at most $M$ labels and acting on an input signed array in integrated total variation. For $M$ and $J$ bounded by fixed powers of $P$, its operator norm is at most 
#[#set math.equation(numbering: n => "(7.13)")
 $ exp \( C_L M P \) . $ <close:raw-amplification>]

 The same bound holds for the pattern-summed centered norm of (4.5). If a physical layer is stopped below $K$ labels, the contribution of a microscopic event $cal(A)$ to the exact observable minus its completed physical below-$K$ expansion is at most 
#[#set math.equation(numbering: n => "(7.14)")
 $ exp \( C_L K P \) thin bb(P) \( cal(A) \)^(1 \/ 2) \, $ <close:bad-discard>]

 provided its upper root count is less than $K$. This discard is made before estimating any overshoot.]
] <close:amplification>

#proof[
  For a fixed term, product Hamiltonian transport preserves phase volume, marginalization decreases total variation, and every contact or isolation indicator has absolute value at most one. Tensoring with an independent input has bounded integrated norm. The factorial normalization costs at most $mu^M$. With at most $M$ labels, the finite subset, generation, cut, and parent descriptions cost at most $\( C_L M J \)^(C_L M)$. This proves (7.13), since $log M + log J = O \( log P \) = o \( P \)$. The centering and inverse transforms have norm at most $2^M$ by (4.5); this factor is absorbed by (7.13). Pattern summation introduces no additional partition count, by Corollary 21.
  For (7.14), first work on an $N$-particle cloud. The exact root observable is bounded by its root-tuple count. Every completed below-$K$ term involves fewer than $K$ labels. Its absolute value, summed over their choices, is thus bounded by $\( C_L K J \)^(C_L K) \( 1 + N \)^K$, times normalization factors no larger than $mu^K$. No bound for the number of terms with an unbounded last component is used here: we are bounding the exact observable minus the completed small terms on $cal(A)$.
  The initial factorial bound gives $bb(E) \( N \)_ell lt.eq mu^ell$, and $N$ is conserved. Expanding ordinary moments in factorial moments therefore gives, for integer $r gt.eq 1$,
  $ bb(E) \( 1 + N \)^r lt.eq #scale(x: 120%, y: 120%)[\(] C r \( 1 + mu \) #scale(x: 120%, y: 120%)[\)]^r . $
  Cauchy–Schwarz with $r = 2 K$, followed by $log mu = 2 \| log epsilon \|$, proves (7.14). These finite polynomial moments also justify truncating first to $N lt.eq N_0$ and then taking $N_0 arrow.r oo$ in all the capped identities. The original unconditioned ensemble is used throughout; no truncated ensemble is recentered in place of it. ◻
]

Here is an explicit noncircular schedule. Choose $L$, the crossing fraction, and the fixed rarity cutoffs as in Proposition 44, with $a = 32$. Choose a fixed integer $nu gt.eq 4$ large enough to dominate the polynomial description and witness-size bounds in the finite constructions. Starting at layer $L$, put $U_L = ceil.l P ceil.r$. For $j = L \, L - 1 \, dots.h \, 1$, define

#[#set math.equation(numbering: n => "(7.15)")
 $ K_j & = ceil.l P^3 U_j ceil.r \, & D_j & = ceil.l P^3 K_j ceil.r \,\
W_j & = ⌈\( 1 + U_j + K_j + D_j \)^nu⌉ . $ <close:cutoffs>]

When $j > 1$, choose

#[#set math.equation(numbering: n => "(7.16)")
 $ U_(j - 1) = ⌈(1 + U_j + W_j + sum_(ell > j) W_ell)^nu⌉ . $ <close:upper-cap>]

The symbols $U_j$ are caps for the entire already constructed upper block, not just for its currently retained roots. Increasing $nu$ once, if necessary, covers every finite composition of the stated deterministic polynomial bounds. There are only $L$ levels. All these quantities are fixed powers of $P$ up to constant factors. In particular,

#[#set math.equation(numbering: n => "(7.17)")
 $ frac(K_j, U_j P) arrow.r oo \, #h(2em) frac(D_j, K_j P) arrow.r oo \, #h(2em) U_i gt.eq W_j quad \( i < j \) . $ <close:hierarchy>]

Every possible inherited $D_j$-witness in an earlier layer is bounded by a polynomial in this same $D_j$, and is included in the downstream demands in (7.16). We never require $K_i$ to dominate its own $D_i$.

Choose a fixed $A_(*)$ with every complete or stopped capped history containing at most $P^(A_(*))$ labels. Finally take $J = ceil.l P^(A_(upright("cell"))) ceil.r$, with $A_(upright("cell"))$ larger than all the fixed polynomial exponents required by the estimates in Propositions 31, 32, 34, and 40. Increasing $A_(upright("cell"))$ affects raw amplifications only through $O \( log P \)$, so it does not change (7.17). This is why the cell mesh is chosen last.

=== 7.4 Chronological removal of the stopped terms <chronological-removal-of-the-stopped-terms>

For each layer distinguish the two exact remainders in (4.20). The physical stopping identity (4.16) has remainder $sans(R)_j^(upright("phys"))$. After centering and the exact replacement $f = cal(G) + r$, the finite high-total-size part $B_j$ of (4.18) is also present. Thus

#[#set math.equation(numbering: n => "(7.18)")
 $ E \( t_j \) = sans(A)_j E \( t_(j - 1) \) + sans(Z)_j \, #h(2em) sans(Z)_j = sans(M)_(t_j) sans(R)_j^(upright("phys")) + B_j \[ E \( t_(j - 1) \) \] . $ <close:centered-remainder>]

The argument of $B_j$ is the true lower centered family. This finite reference cutoff mismatch is not a stopped-cloud functional and is not bounded by positive physical domination.

Use the physical and pattern-summed norms from (4.5), taking a supremum also over shortened ending times in layer $j$, and put

#[#set math.equation(numbering: n => "(7.19)")
 $ Q_j & = sup_t parallel sans(R)_j^(upright("phys")) \( t \) parallel_(1 \, lt.eq U_j) \,\
V_j & = sup_t parallel B_(j \, t) \[ E \( t_(j - 1) \) \] parallel_(pi \, 1 \, lt.eq U_j) \,\
Z_j & = sup_t parallel sans(Z)_j \( t \) parallel_(pi \, 1 \, lt.eq U_j) \, #h(2em) R_j = max { Q_j \, Z_j } . $ <close:remainder-norms>]

Here $B_(j \, t)$ denotes the same finite operator with the layer shortened at $t$. In particular,

#[#set math.equation(numbering: n => "(7.20)")
 $ Z_j lt.eq 2^(U_j) Q_j + V_j . $ <close:centering-remainder-norm>]

The scalar $R_j$ therefore controls both the physical interruption and the complete centered remainder used in the lower-layer recurrence. Physical remainders are aggregate signed differences, not sums of the norms of unbounded stopped descriptions. On a good cloud we use their positive domination; on a bad cloud we use the exact difference before taking absolute values.

#thm([Proposition 7.7.])[
  (Actual witnesses and layer remainders).  #emph[With the preceding schedule, for sufficiently small $epsilon$ and every $1 lt.eq j lt.eq L$, 
#[#set math.equation(numbering: n => "(7.21)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] cal(B)_j \( D_j \) #scale(x: 120%, y: 120%)[\)] lt.eq e^(- 8 D_j) \, #h(2em) R_j lt.eq e^(- 8 K_j) . $ <close:actual-tail-bounds>]

 The estimates use the original Newtonian process, without conditioning it to stay in a good set.]
] <close:tails>

#proof[
  The finite-cloud stopping and witness constructions are performed first. Integrate their finite identities with $N lt.eq N_0$ and then let $N_0 arrow.r oo$, using Lemma 47 and the finite expectations in Proposition 16. Only after this passage do we apply the centered identities to the original ensemble and its initial insertion formula. In particular, no centering bound for a law conditioned on $N lt.eq N_0$ is asserted.
  We induct on $j$ in chronological order, with $R_k$ already controlling both remainder types whenever $k < j$. First estimate the finite reference cutoff mismatch. By (4.19), every term of $B_j$ has
  $ K_j lt.eq p < \( U_j + 1 \) K_j \, #h(2em) h_0 lt.eq U_j . $
  This cap is below $W_j$. Treat this finite product of signed physical terms, reference families, and residual upper slots as an uncentered mixed upper block. Expand its true input $E \( t_(j - 1) \)$ by (4.20) only through the strictly earlier layers $j - 1 \, dots.h \, 1$. Apply the usual simple-family cancellations at those lower cuts. Every completed history still contains at least $K_j$ labels, and its starting top count is at most $U_j = o \( K_j \)$. Therefore Proposition 44 bounds their total norm by $C_L e^(- 32 K_j)$. Every interruption in a layer $k < j$ contains the complete centered remainder $sans(Z)_k$ from (7.18). Its upper block fits $U_k$ by (7.16), so Lemma 47 bounds it by $e^(C_L U_k P) R_k$. We have proved
  #[#set math.equation(numbering: n => "(7.22)")
   $ V_j lt.eq C_L e^(- 32 K_j) + C_L sum_(k < j) e^(C_L U_k P) R_k . $ <close:reference-cutoff-bound>]
  No good-cloud event or physical overshoot is used in this estimate. In particular, neither $R_j$ nor a bound on $cal(B)_j \( D_j \)$ occurs on its right side: $B_j$ is already a finite upper block, and no layer-$j$ expansion is inserted below it.
  To prove the probability bound for $cal(B)_j \( D_j \)$, apply Lemma 46 with the fixed threshold $D_j$ throughout the preceding prefix. A witness whose last cell is in layer $i lt.eq j$ has more than $D_j$ labels and at most $2 D_j^2$. Drop its first-occurrence restrictions, as in (7.12). Expand its start marginal through layers $1 \, dots.h \, i - 1$, using the exact finite centered recurrence (4.20), including both remainder terms. Every completed term has at least $D_j$ labels and one integrated uncentered upper root. Its total integral is therefore at most $C e^(- 32 D_j)$ by Proposition 44. This is a statement about finite terms with independent inputs; it does not presume a bound for the probability being proved.
  Every interrupted lower term occurs in a layer $k < i$. Its upper block is bounded by $U_k$ by construction. Its contribution is at most $e^(C_L U_k P) R_k$ by Lemma 47, and $R_k$ is already bounded by the induction hypothesis. Thus
  #[#set math.equation(numbering: n => "(7.23)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] cal(B)_j \( D_j \) #scale(x: 120%, y: 120%)[\)] lt.eq mu L J (C_L e^(- 32 D_j) + C_L sum_(k < j) e^(C_L U_k P) R_k) . $ <close:prob-induction>]
  For $j = 1$ the sum is empty and all input estimates are initial ones. For $k < j$, (7.17) makes $e^(C_L U_k P) R_k lt.eq e^(- 7 K_k)$ for small $epsilon$. The same schedule makes each $K_k$ exceed every fixed multiple of $D_j + P + log J$. Since $log mu = 2 \| log epsilon \|$, the right side of (7.23) is at most $e^(- 8 D_j)$.
  Now estimate the physical remainder norm $Q_j$. On $cal(B)_j \( D_j \)$, discard the exact observable minus the completed below-$K_j$ terms before estimating an overshoot. Lemma 47 bounds this part by
  #[#set math.equation(numbering: n => "(7.24)")
   $ e^(C_L K_j P) bb(P) #scale(x: 120%, y: 120%)[\(] cal(B)_j \( D_j \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <close:own-bad-cost>]
  On the complementary cloud, all trial components have at most $D_j$ labels and every earlier actual history within the layer has at most $D_j$ labels. In the first stopped cell, Proposition 16 therefore bounds its selected union by
  $ max { U_j D_j \, K_j - 1 + D_j } . $
  Its positive continuation through the earlier cells of the layer adds at most a factor $D_j$ in label count. Together with the already completed upper part of that layer, this is less than $W_j$ in (7.15). Every such history still has at least $K_j$ labels: the positive continuation never removes a label counted by the stopping rule. Its upper root count is at most $U_j$, and $U_j \/ K_j arrow.r 0$.
  The completed signed cells above the stopped cell and the positive actual prefix below it form an admissible mixed upper block. Drop the remaining good-set restrictions and expand its input through the strictly earlier layers, using the full centered recurrence there. Completed terms are bounded by $C_L e^(- 32 K_j)$ using Proposition 44; all their labels are below the fixed polynomial cap. Earlier interruptions again cost at most $e^(C_L U_k P) R_k$. Consequently
  #[#set math.equation(numbering: n => "(7.25)")
   $ Q_j lt.eq C_L e^(- 32 K_j) + e^(C_L K_j P) bb(P) #scale(x: 120%, y: 120%)[\(] cal(B)_j \( D_j \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) + C_L sum_(k < j) e^(C_L U_k P) R_k . $ <close:physical-remainder-induction>]
  Polynomially many final-cell and stopping choices are absorbed by the exponential margins in this inequality.
  Finally combine (7.22), (7.25), and (7.20). Since $U_j = o \( K_j \)$, the factor $2^(U_j)$ changes $e^(- 32 K_j)$ to at most $e^(- 31 K_j)$ for small $epsilon$. Its multiplication of the other terms is absorbed by increasing $C_L$ in their raw amplifications. Thus the common scalar obeys
  #[#set math.equation(numbering: n => "(7.26)")
   $ R_j lt.eq C_L e^(- 31 K_j) + e^(C_L K_j P) bb(P) #scale(x: 120%, y: 120%)[\(] cal(B)_j \( D_j \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) + C_L sum_(k < j) e^(C_L U_k P) R_k . $ <close:remainder-induction>]
  By the probability bound just proved and (7.17), its middle term is at most $e^(- 3 D_j)$. Every earlier term is at most $e^(- 7 K_k)$, and the earlier $K_k$ dominate $K_j$. The right side is at most $e^(- 8 K_j)$ for small $epsilon$.
  This completes the induction. Notice its order: the reference cutoff mismatch and the probability of a layer-$j$ witness used only remainders with index less than $j$; the physical layer-$j$ remainder then used that newly proved probability. Centering its physical remainder and adding the separately estimated finite mismatch produced $sans(Z)_j$ and the common bound $R_j$. No estimate assumed its own layer’s remainder. The larger threshold $D_i$ assigned to a preceding layer was never used to infer that a polymer exceeding $D_j$ was absent. The same-$D_j$ first-witness construction is what justifies that inference. ◻
]

=== 7.5 Fixed-order chaos and the empirical consequence <fixed-order-chaos-and-the-empirical-consequence>

#proof[
  Fix $s$. For sufficiently small $epsilon$, it is at most $U_L$. Expand a retained centered singleton array of this order with the exact finite identity (4.21). Proposition 48 and (7.13) remove both the physical and the reference cutoff remainders: the total error is bounded by a finite sum of $e^(C_L U_j P) R_j$, which tends to zero.
  For the completed terms, first fix an integer $m$ larger than the finite constants required in Proposition 44. The sum of all terms with more than $m$ labels is at most $C_(s \, L) e^(- m)$, uniformly for small $epsilon$. The finitely sized part, with at most $m$ labels, tends to zero by the last assertion of that proposition. Here finiteness refers to the number of labels and tree shapes; the contact times are integrated over their ordered simplices. Letting first $epsilon arrow.r 0$ and then $m arrow.r oo$ proves integrated convergence of every fixed retained centered singleton array.
  These estimates are uniform over deterministic observation times. Use the fixed full mesh of $\[ 0 \, T \]$ and truncate only its last cell at the observation time. Full-cell trial-component and ancestry caps imply the corresponding caps on every prefix of that cell. All ordered-time estimates use intervals of length at most $b$ and remain valid after shortening. The residual and finite-size convergence are uniform for these endpoints by Proposition 22. At $t = 0$ the expansion is empty and Proposition 4 supplies the conclusion directly. Thus no positive lower bound on the observation time is needed.
  Let
  $ cal(D)_s^epsilon = { Z_s : \| x_i - x_j \| > epsilon upright(" for every ") i eq.not j } \, #h(2em) G_s^epsilon = upright(bold(1))_(cal(D)_s^epsilon) tilde(F)_s^epsilon . $
  The inverse centered identity in Proposition 20, with the pattern restrictions restored, gives
  #[#set math.equation(numbering: n => "(7.27)")
   $ sup_(0 lt.eq t lt.eq T) parallel G_s^epsilon \( t \) - f \( t \)^(⊗ s) parallel_1 arrow.r 0 . $ <close:isolated-limit>]
  Indeed every nonempty retained subset contributes one of the centered arrays just bounded. Integrating the other independent $f$ slots costs at most their mass one; the separation indicators only decrease this bound. The missing independent mass outside $cal(D)_s^epsilon$ is $O_s \( epsilon^3 \)$, uniformly in time, because the spatial density of $f$ is bounded by its uniform Gaussian envelope.
  We have $0 lt.eq G_s^epsilon lt.eq F_s^epsilon$. Since $N$ is conserved,
  $ m_s^epsilon := integral F_s^epsilon \( t \) = mu^(- s) bb(E) \( N \)_s = integral F_s^epsilon \( 0 \) arrow.r 1 $
  by Proposition 4. Hence
  $ parallel F_s^epsilon - f^(⊗ s) parallel_1 & lt.eq parallel G_s^epsilon - f^(⊗ s) parallel_1 + integral \( F_s^epsilon - G_s^epsilon \)\
 & lt.eq 2 parallel G_s^epsilon - f^(⊗ s) parallel_1 + \| m_s^epsilon - 1 \| . $
  Together with (7.27), this proves (1.6). Thus close configurations, including any bound clusters formed by the actual dynamics, are removed by their nonnegative mass. They have never been excluded from the microscopic evolution.
  Finally put
  $ A_epsilon \( t \) = mu^(- 1) sum_(i = 1)^N a \( z_i \( t \) \) \, #h(2em) a_f \( t \) = integral a \( z \) f \( t \, z \) thin d z . $
  Factorial normalization gives
  $ bb(E) A_epsilon \( t \) = integral a F_1^epsilon \( t \) \, #h(2em) bb(E) A_epsilon \( t \)^2 = integral a \( z_1 \) a \( z_2 \) F_2^epsilon \( t \) + mu^(- 1) integral a \( z \)^2 F_1^epsilon \( t \, z \) thin d z . $
  It follows that
  $ bb(E) \| A_epsilon \( t \) - a_f \( t \) \|^2 lt.eq parallel a parallel_oo^2 #scale(x: 120%, y: 120%)[\(] & parallel F_2^epsilon \( t \) - f \( t \)^(⊗ 2) parallel_1 + 2 parallel F_1^epsilon \( t \) - f \( t \) parallel_1 + mu^(- 1) m_1^epsilon #scale(x: 120%, y: 120%)[\)] . $
  The right side tends to zero uniformly over deterministic $t$. Chebyshev’s inequality proves (1.7). This conclusion is the stated uniformity of probabilities at deterministic times; it makes no assertion about a supremum inside a sample path. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
