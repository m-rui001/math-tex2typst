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

#align(center)[#text(size: 16pt, weight: "bold")[Quenched $upright(S L E)_3$ limits for general \
weak random-bond Ising models]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The critical planar Ising model has a conformally invariant interface limit. For a random ferromagnet, the corresponding question asks whether weak microscopic disorder disappears from the macroscopic law when the environment is held fixed. In two dimensions the disorder is marginal, so a scale-by-scale decay estimate is needed in place of a uniform contraction. We extend the weak symmetric two-valued result of [22] to general bounded iid bond laws. The law need not be preserved by planar duality, so the proof must identify the critical temperature without assuming distributional self-duality.

=== 1.1 Model and statement <model-and-statement>

Let $rho$ be a probability measure supported on $\[ - 1 \, 1 \]$ such that

#[#set math.equation(numbering: n => "(1.1)")
 $ integral x thin rho \( upright(d) x \) = 0 \, #h(2em) sigma_rho^2 := integral x^2 thin rho \( upright(d) x \) > 0 . $ <eq:law-assumptions>]

On the unoriented nearest-neighbor edges of $bb(Z)^2$, let $\( xi_e \)_e$ be independent with law $rho$, and set

#[#set math.equation(numbering: n => "(1.2)")
 $ J_e = 1 + epsilon xi_e \, #h(2em) 0 < epsilon < 1 . $ <eq:bond-model>]

Write $omega = \( xi_e \)_e$ for the environment and $bb(P)_rho$ for its product law. For a finite spin domain $Lambda$, inverse temperature $beta gt.eq 0$, and prescribed exterior spins $tau$, the quenched Ising law has weight

$ exp #h(-0.16667em) (beta sum_({ x \, y } : { x \, y } ∩ Lambda eq.not diameter) J_({ x \, y }) sigma_x sigma_y) \, #h(2em) sigma_x = tau_x quad \( x in.not Lambda \) \, $

where the sum runs over nearest-neighbor edges with at least one free endpoint. Expectations for this law are denoted by $chevron.l thin dot.op thin chevron.r_(Lambda \, beta \, J)^tau$. Put $B_m = \[ - m \, m \]^2 ∩ bb(Z)^2$ and define

#[#set math.equation(numbering: n => "(1.3)")
 $ beta_c^rho \( epsilon \) = inf {beta gt.eq 0 : bb(E)_rho #h(-0.16667em) [lim_(m arrow.r oo) chevron.l sigma_0 chevron.r_(B_m \, beta \, J)^(+)] > 0} . $ <eq:critical-definition>]

The plus-state limit exists by ferromagnetic monotonicity. Throughout the paper, averaging a quenched law means integrating it against $bb(P)_rho$; the environment is never reweighted by a partition function. We write $K_0 = 1 / 2 log \( 1 + sqrt(2) \)$ for the pure critical coupling.

Let $D subset bb(C)$ be a bounded Jordan domain with distinct marked boundary points $a \, b$. A lattice approximation is a simply connected square-lattice domain containing every interior nearest-neighbor bond, embedded with mesh $delta$, with a Jordan boundary and marked interface endpoints $a_delta \, b_delta$. We call such a domain full. The boundary approximation used here means that there are homeomorphisms

#[#set math.equation(numbering: n => "(1.4)")
 $ h_n : partial D arrow.r partial D_n \, #h(2em) sup_(z in partial D) \| h_n \( z \) - z \| arrow.r 0 \, #h(2em) \( a_n \, b_n \) arrow.r \( a \, b \) . $ <eq:boundary-approximation>]

The graphs and bond variables live on the unit lattice and are then embedded by multiplication by $delta_n$. This convention allows all $n$ to use one environment. The exterior-neighbor and pinned-boundary-vertex conventions are specified in Section 7.

Dobrushin conditions fix plus spins on one marked arc and minus spins on the other. The arc assignments must give a consistent spin at every pinned site. The spin interface is oriented from $a_n$ to $b_n$ and uses the deterministic north-east/south-west pairing whenever a contour vertex has degree four. We use continuous polygonal representatives of the resulting oriented curves. For two such curves, let

#[#set math.equation(numbering: n => "(1.5)")
 $ d_(upright("curv")) \( gamma \, eta \) = inf_(phi.alt \, psi) sup_(t in \[ 0 \, 1 \]) \| gamma \( phi.alt \( t \) \) - eta \( psi \( t \) \) \| \, #h(2em) macron(d)_(upright("curv")) = 1 and d_(upright("curv")) \, $ <eq:curve-metric>]

where $phi.alt \, psi$ range over increasing homeomorphisms of $\[ 0 \, 1 \]$; curves at zero distance are identified. For probability laws on this space, set

#[#set math.equation(numbering: n => "(1.6)")
 $ d_(upright("BL")) \( mu \, nu \) = sup {lr(|integral F thin upright(d) mu - integral F thin upright(d) nu|) : parallel F parallel_oo lt.eq 1 \, med \| F \( gamma \) - F \( eta \) \| lt.eq macron(d)_(upright("curv")) \( gamma \, eta \)} . $ <eq:BL-definition>]

This is a bounded-Lipschitz metric for weak convergence in the oriented uniform-curve topology. Write $Q_(n \, omega)$ for the quenched Dobrushin interface law and $sans(S)_(D \; a \, b)$ for chordal $"SLE"_3 \( D \; a \, b \)$.

#thm([Theorem 1.1.])[
  #emph[For every law $rho$ satisfying (1.1), there exists $epsilon_0 \( rho \) > 0$ with the following property. Fix $0 < epsilon < min { 1 \, epsilon_0 \( rho \) }$. For every bounded Jordan domain $D$, distinct $a \, b in partial D$, and deterministic square-lattice approximations satisfying (1.4) with $delta_n arrow.b 0$, the interface law at $beta = beta_c^rho \( epsilon \)$ satisfies 
#[#set math.equation(numbering: n => "(1.7)")
 $ d_(upright("BL")) \( Q_(n \, omega) \, sans(S)_(D \; a \, b) \) arrow.r_(n arrow.r oo)^(bb(P)_rho) 0 . $ <eq:main-convergence>]

 The disorder threshold depends on $rho$ and not on $D$, its marked points, or the approximation sequence. Moreover, $beta_c^rho \( epsilon \) = 1 / 2 log \( 1 + sqrt(2) \) + O_rho \( epsilon^2 \)$.]
] <thm:main>

=== 1.2 History and relation to earlier work <history-and-relation-to-earlier-work>

The effect of weak bond disorder is especially delicate in two dimensions. Harris’s relevance criterion places the pure Ising model at the marginal case, where the specific-heat exponent is zero and the criterion alone does not decide the effect of randomness [15]. Dotsenko and Dotsenko’s fermionic analysis predicted a double logarithmic specific-heat singularity [7,8]. Renormalization-group work of Jug, Shalaev, Shankar, and Ludwig developed and refined the description of logarithmic corrections to pure-model critical behavior [16,25,26,19]. The predictions for different correlation observables were not identical throughout this development. The relevant physical picture here is marginal irrelevance: weak disorder decreases under changes of scale, but only logarithmically. These works concern thermodynamic quantities and correlations; control of a quenched law for an entire interface also requires geometric estimates.

For the homogeneous critical model, the conformal description is rigorous. Schramm’s stochastic Loewner evolution supplies the candidate interface laws [24]. Smirnov established conformal convergence of the FK-Ising fermionic observable [28], and Chelkak and Smirnov proved fermionic-observable universality for critical isoradial Ising models [6]. Chelkak, Duminil-Copin, Hongler, Kemppainen, and Smirnov proved that the critical square-lattice spin interface with Dobrushin boundary conditions converges to chordal $upright("SLE")_3$ in uniform distance modulo increasing reparametrization [5] Theorem 1 and Equation (1). This is the pure interface theorem underlying our comparison argument.

Rigorous universality results for deterministic interactions provide a second point of comparison. Giuliani, Greenblatt, and Mastropietro proved universality of infinite-plane energy-correlation scaling limits for weak finite-range pair perturbations with lattice symmetries [13] Theorems 1.1–1.2. For non-integrable spin interfaces, Greenblatt and Peltola constructed a Grassmann representation of a discrete martingale and formulated the correlation estimates needed for a proposed route to $upright("SLE")_3$ [14] Theorem 4.4 and Conjecture 4.5. Their paper does not prove interface convergence. For random bonds, Mahfouf proved quenched FK-interface convergence to $upright("SLE")_(16 \/ 3)$ in a regime where the disorder strength tends to zero with the mesh [20] Theorem 1.6. Avérous and Mahfouf established high-probability crossing estimates for near-critical random-bond FK models, also with vanishing disorder for $1 < q lt.eq 4$ [2] Theorems 1.5–1.6. In the present theorem the nonzero disorder strength is fixed as the mesh tends to zero, and the interface separates spin clusters.

The main theorem of [22] treats symmetric two-valued bond disorder, whereas its local scale transformation, moment estimates, and marginal variance estimate are formulated for more general random local potentials. We verify their hypotheses for the law $rho$ and its exact dual, and use the pure and deterministic boundary-comparison results of [23] through their formulations in [22]. The critical-point argument adapts the torus method of [22] Section 8 to match two separately tuned trajectories within the same physical temperature family. This matching replaces distributional self-duality.

Duality has a substantial history in the study of disordered critical points. Chayes and Shtengel established vanishing magnetization and critical correlation properties for self-dual disordered ferromagnets under their stated hypotheses [4] Theorems $1'$–$2'$. Our general one-edge law need not be self-dual. We use Kramers–Wannier duality [18] in the finite-torus form of Bugrij and Shadura, which relates the four periodic/antiperiodic partition functions for arbitrary positive inhomogeneous couplings [3] Equations (4)–(5). The torus comparison identifies the two tuned temperatures; a separate argument identifies their common value with the spontaneous-magnetization threshold.

The remaining argument combines classical probabilistic tools with the geometric inputs of [22,23]. The Fortuin–Kasteleyn representation [11], the Edwards–Sokal coupling [10], and the FKG lattice inequality [12] relate spin barriers, random-cluster connections, and boundary monotonicity. The decision-tree inequality of O’Donnell, Saks, Schramm, and Servedio [21], extended to monotonic measures by Duminil-Copin, Raoufi, and Tassion [9] Theorem 1.1, is applied at each fixed environment before averaging over the bonds. The geometric use of crossing estimates to control random curves has precedents in Aizenman–Burchard [1] and Kemppainen–Smirnov [17]; Sheffield–Sun [27] distinguish convergence of driving functions from convergence in the uniform curve topology. The specific passage from boundary barriers and trace convergence to oriented-curve convergence used here is the progress criterion of [22] Section 9.

=== 1.3 The extension and the proof <the-extension-and-the-proof>

The local scale transformation of [22] rewrites the model as a sequence of random local perturbations of pure critical Ising. Section 2 states the analytic estimates, and Section 3 verifies their hypotheses for the primal and exact dual families and chooses a temperature for each at which the perturbations tend to zero in environmental moments. The variance coordinate retains local cubic terms, so the estimates also cover laws with nonzero third moment.

The two families are parametrized by the same physical inverse temperature, but their selected temperatures need not initially agree. Section 4 compares the four torus partition functions along these trajectories. Exact duality shows that, at both selected temperatures, the same primal FK winding event has probability asymptotic to its pure critical probability. Monotonicity and a quantitative lower bound for its temperature derivative then force the temperatures to agree. This identifies a common primal-dual temperature without assuming symmetry of the disorder law.

Section 5 transfers the decaying perturbations to local conditional crossing estimates and joint laws of finitely many crossing tests on tori. The error terms are geometrically weighted; decay suffices even though the scale norms need not be summable. Section 6 uses the estimates on both lattices to identify the common temperature with (1.3). Barriers in annuli with disjoint bond neighborhoods first rule out percolation there. Above that temperature, an environmental amplification argument and the decision-tree inequality give rapid dual-arm decay and positive primal magnetization.

Section 7 uses the boundary-comparison results of [22,23] to compare the random interface with pure interfaces in slightly displaced domains. The couplings retain the pure comparison law conditional on the original environment. This conditional marginal turns the comparison into a quenched statement. A planar sandwich identifies the trace, and a separate multi-passage estimate controls its order of traversal, giving the full metric in (1.5).

== 2 Scale estimates for general local arrays <sec:scale>

We first state the scale estimates that will be used to choose the temperature. These are results about local random potentials, rather than about a particular one-edge distribution. We use the exact energy charge, local transformation, moment estimates, and variance coordinate of [22] Sections 2–5. The hypotheses below explain why those results apply to the present law $rho$, although the main theorem of [22] concerns symmetric two-valued disorder. The pure-model inputs behind that construction are developed in [23] Sections 2–3.

=== 2.1 The reference field and its energy charge <the-reference-field-and-its-energy-charge>

Let $bb(E)_0$ denote expectation under the full-plane critical Ising law at $K_0$, together with a locally finite family of independent, finite-valued reference variables attached to specified locations. These variables are part of the Gibbs field: they are integrated or conditioned along with the spins. Spin reversal leaves them unchanged. Their product reference law, including their locations and labels, respects lattice translations and square symmetries. At the initial scale there are no such variables.

For an edge $e = { x \, y }$, put

$ b_e = sigma_x sigma_y - bb(E)_0 \( sigma_x sigma_y \) \, #h(2em) B_x = 1 / 4 sum_(e in.rev x) b_e . $

The theorem “Exact pure energy charge” in [22] Section 2 provides the linear functional

#[#set math.equation(numbering: n => "(2.1)")
 $ Q \( f \) = kappa^(- 1) lim_(\| x \| arrow.r oo) \| x \|^2 bb(E)_0 \( f B_x \) \, #h(2em) kappa = pi^(- 2) \, $ <eq:energy-charge>]

on bounded, spin-flip-even local observables. The reference variables are included in this expectation. Thus $Q$ measures the energy component of a local perturbation through its correlation with a distant energy observable. The functional kills constants, is invariant under lattice translations and square symmetries, and satisfies $Q \( b_e \) = 1$. Pure conditional integration across a surrounding square preserves $Q$ exactly. If the support of $f$ lies in a square of radius $r$, then

#[#set math.equation(numbering: n => "(2.2)")
 $ \| Q \( f \) \| lt.eq C r parallel f parallel_oo . $ <eq:charge-bound>]

This normalization permits charges at successive scales to be compared without accumulating a normalization error.

=== 2.2 Arrays and the exact scale transformation <arrays-and-the-exact-scale-transformation>

At an integer spacing $s$, a local array is a family $f = \( f_i \)_(i in bb(Z)^2)$ of random functions based at the cell centers $s i$. We impose the following hypotheses. For every environment, each $f_i$ is real, bounded, spin-flip even, and pure centered: $bb(E)_0 f_i = 0$. Both its field support and the primitive environmental variables determining it lie within distance $C s$ of $s i$, in supremum norm, for the fixed support constant of the scale construction. The primitive environmental variables are independent. The law of the array is invariant under translations of the $s$-grid and the symmetries of a square, acting also on reference-variable locations and labels. These are symmetries in distribution; an individual array need not have them. Finally, $bb(E) parallel f_0 parallel_oo^40 < oo$.

Here and throughout the scale argument, $bb(E)$ averages the bond environment and the independent priorities and thresholds used to construct the transformation. These choices are held fixed when sampling the Gibbs field. They are distinct from the reference variables averaged by $bb(E)_0$. In a finite volume, the array adds $sum_i f_i$ to the logarithm of the reference density, with all old exterior field variables prescribed. The sum includes the potentials meeting the volume.

The proposition “The local scale map” in [22] Section 3 gives, for a sufficiently large odd integer $L$ and a threshold parameter $b > 0$, a map from such arrays at spacing $s$ to arrays at spacing $s' = L s$ with the same support constant. The construction uses independent continuous priorities and independent environmental thresholds uniform on $\[ b \, 2 b \]$ to determine its local choices and to flag large input terms. The map introduces normalized conditional likelihoods for fresh reference coins, then uses conditional integrations in separated squares to replace local logarithmic interactions. These are changes of the interaction functions: the enlarged field alphabet retains every old spin and reference variable. Centering the resulting potentials changes only a scalar factor. For each fixed environment and arbitrary old exterior assignment, these operations preserve the exterior-integrated weight exactly. The same formulas and full-plane centering constants apply in embedded torus charts. In particular, the construction is compatible with a flat spin twist: a change of trivialization in a local chart is a constant spin flip, under which all potentials are invariant.

We will use three quantitative and local features of that proposition, the corollary “Local implementation”, and the proposition “A coupling of consecutive fields” in the same section. There are fixed numerical constants $K \, K_1$ and a constant $C_L$, depending on the fixed step parameters, such that

#[#set math.equation(numbering: n => "(2.3)")
 $ parallel f'_j parallel_oo lt.eq C_L sum_(i : thin parallel s i - s' j parallel_oo lt.eq K s') parallel f_i parallel_oo . $ <eq:raw-scale-bound>]

In a finite free chart with prescribed old exterior field data, the transformation agrees with the full output specification after erosion by $K_1 s'$. This assertion includes annular charts. Every fresh reference variable with a nonconstant likelihood is sampled as part of the construction. Exactness does not assert the same input kernel if fresh coins are independently prescribed before the construction; disintegration over the sampled output exterior remains available. Finally, consecutive fields can be coupled to agree outside squares of radius $5 s'$ about marked parent centers. Conditional on the enlarged environment, these marks are independent of one another and of the output Gibbs sample, with local parameters satisfying

#[#set math.equation(numbering: n => "(2.4)")
 $ p_j lt.eq min {1 \, C_L sum_(i : thin parallel s i - s' j parallel_oo lt.eq K s') parallel f_i parallel_oo} \, #h(2em) bb(E) p_j lt.eq C_L \( bb(E) parallel f_0 parallel_oo^40 \)^(1 \/ 40) . $ <eq:scale-marks>]

Both the coupling and these bounds are uniform over the prescribed old exterior assignments. These exactness and locality statements will later connect the moment estimates to crossing events.

=== 2.3 Moment and variance coordinates <moment-and-variance-coordinates>

Write $q_s = Q \/ s$, and define

#[#set math.equation(numbering: n => "(2.5)")
 $ X & = \( bb(E) parallel f_0 parallel_oo^40 \)^(1 \/ 40) \, & Y & = parallel bb(E) f_0 parallel_oo \,\
m & = bb(E) q_s \( f_0 \) \, & W & = sum_(i in bb(Z)^2) "Cov" #scale(x: 120%, y: 120%)[\(] q_s \( f_0 \) \, q_s \( f_i \) #scale(x: 120%, y: 120%)[\)] . $ <eq:scale-coordinates>]

All covariances here are environmental. The covariance sum is finite by the dependence hypothesis. It is nonnegative because, for growing squares $Lambda subset bb(Z)^2$,

$ W = lim_(Lambda arrow.t bb(Z)^2) frac(1, \| Lambda \|) "Var" (sum_(i in Lambda) q_s \( f_i \)) . $

The mean charge $m$ is the expanding coordinate of the map. The variance density $W$ is marginal at its linearization. To see its decay, one needs a coordinate that also retains local cubic and quartic terms.

The construction in [22] Section 5, Definition “Variance coordinate” begins with a finite random insertion $F = sum_(i in I) t_i f_i$, where $I subset bb(Z)^2$ is finite and the $t_i$ are real parameters. Its normalized charge is

$ T \( F \) = q_s (frac(e^F, bb(E)_0 e^F)) . $

We take Taylor coefficients at zero for each fixed environment; the expansions below use only finite moments, not environmental exponential integrability. Since $bb(E)_0 F = 0$ and $q_s$ kills constants, the first three homogeneous terms are

$ T_1 = q_s \( F \) \, #h(2em) T_2 = 1 / 2 q_s \( F^2 \) \, #h(2em) T_3 = 1 / 6 q_s \( F^3 \) - 1 / 2 q_s \( F \) bb(E)_0 F^2 . $

The terms of degrees two, three, and four in the formal environmental variance of $T \( F \)$ are therefore

$ "Var" \( T_1 \) \, #h(2em) 2 "Cov" \( T_1 \, T_2 \) \, #h(2em) "Var" \( T_2 \) + 2 "Cov" \( T_1 \, T_3 \) . $

The cubic term need not vanish for a nonsymmetric law. We retain it while estimating the degree-four drift: an uncontrolled cubic error would be larger than the quartic change we seek to determine.

The coordinate $v_H$ is this variance polynomial through degree four, per cell, with a cutoff on the diameter of the input labels. More precisely, choose a dependence range $R_0$ in cell units so that sets separated by more than $R_0$ use disjoint environmental variables and have disjoint declared supports. For an ordered tuple $bold(i) = \( i_1 \, dots.h \, i_d \)$, $2 lt.eq d lt.eq 4$, give each occurrence its own indeterminate, including repeated indices, and set

#[#set math.equation(numbering: n => "(2.6)")
 $ C_d \( bold(i) \) = partial_(t_1) dots.h.c partial_(t_d) thin "Var" [q_s (frac(exp \( sum_(a = 1)^d t_a f_(i_a) \), bb(E)_0 exp \( sum_(a = 1)^d t_a f_(i_a) \)))]\|_(bold(t) = 0) . $ <eq:variance-coefficients>]

The derivatives mean coefficient extraction from the displayed variance polynomial. For $H > R_0$, define

#[#set math.equation(numbering: n => "(2.7)")
 $ v_H = sum_(d = 2)^4 frac(1, d !) sum_(i_2 \, dots.h \, i_d in bb(Z)^2) upright(bold(1))_({ "diam" \( 0 \, i_2 \, dots.h \, i_d \) lt.eq H }) C_d \( 0 \, i_2 \, dots.h \, i_d \) \, $ <eq:variance-coordinate>]

where diameter is Euclidean diameter in cell units. This is a real polynomial coordinate, not necessarily positive on an arbitrary array. Its quadratic part is exactly $W$.

#thm([Proposition 2.1.])[
  (Imported scale estimates).  #emph[For the local arrays just specified, the scale-step parameters can be chosen in the order $L$ sufficiently large, then $b > 0$ sufficiently small, then $x_(*) > 0$. There are constants $0 < lambda < 1$ and $C_1 < oo$, independent of the spacing, such that every input with $X lt.eq x_(*)$ satisfies 
#[#set math.equation(numbering: n => "(2.8)")
 $ \| m' - L m \| & lt.eq C_1 X^2 \,\
Y' & lt.eq lambda Y + C_1 \( \| m \| + X^2 \) \,\
X' & lt.eq lambda X + C_1 \( sqrt(W) + Y \) . $ <eq:one-step-estimates>]

 Primes denote the output coordinates, with charge normalization $q_(L s)$. For every fixed $H > R_0$, 
#[#set math.equation(numbering: n => "(2.9)")
 $ \| v_H - W \| lt.eq C_H X^3 #h(2em) \( X lt.eq 1 \) . $ <eq:variance-near-W>]

 Furthermore, fix finite constants $A \, B$. For every sufficiently large fixed $H$, whenever $0 < z lt.eq 1$, $X lt.eq A z$, and $Y lt.eq B z^2$, one has 
#[#set math.equation(numbering: n => "(2.10)")
 $ v'_H - v_H = - 2 kappa W^2 sum_(y in bb(Z)^2 : thin H < \| y \| lt.eq L H) \| y \|^(- 2) + e_H z^4 + O_H \( z^5 \) . $ <eq:marginal-variance-flow>]

 Here $\| e_H \|$ is bounded by a deterministic quantity tending to zero as $H arrow.r oo$. The constants may depend on $A \, B$ and the fixed step parameters, but are uniform in the lattice spacing.]
] <prop:scale-estimates>

These are respectively the propositions “One-step estimates” and “Marginal variance flow” of [22] Sections 4–5, with the near-$W$ estimate included in the latter. Their hypotheses are the array hypotheses above. The required symmetry is spatial symmetry in law, together with spin-flip evenness of the potentials; there is no assumption of invariance under negating the bond randomness. In the variance calculation, independence eliminates isolated centered environmental occurrences, while the cubic terms in (2.7) are kept. Thus an asymmetric law does not require any alteration of the imported estimates. The next section verifies their hypotheses for both temperature families and uses the negative term in (2.10) to keep the entire iteration small.

== 3 Two temperature tunings <sec:tuning>

The scale estimates select a temperature at which the perturbation decays. For a general law $rho$, there is no reason for that selection to be self-dual. We therefore apply the selection separately to the physical family and to its exact dual, using the same physical inverse temperature as the parameter. This section constructs the two trajectories; their temperatures will be compared afterward.

=== 3.1 Primal and dual initial arrays <primal-and-dual-initial-arrays>

Write $K_e \( beta \) = beta J_e = beta \( 1 + epsilon xi_e \)$ for the coupling including inverse temperature. For $K > 0$, define its dual coupling $g \( K \)$ by

#[#set math.equation(numbering: n => "(3.1)")
 $ e^(2 g \( K \)) - 1 = frac(2, e^(2 K) - 1) . $ <eq:dual-coupling>]

Thus $g$ is a smooth decreasing involution, $g \( K_0 \) = K_0$, $g' \( K_0 \) = - 1$, and $g'' \( K_0 \) = 2 sqrt(2)$. The edge odds and their duals are

$ w_e \( beta \) = e^(2 K_e \( beta \)) - 1 \, #h(2em) w_(e^(*))^(*) \( beta \) = frac(2, w_e \( beta \)) \, #h(2em) K_(e^(*))^(*) \( beta \) = g \( K_e \( beta \) \) \, $

where $e^(*)$ crosses $e$. We identify the dual square lattice with a translate of the square lattice.

Use the scale-step parameters of Proposition 2 and choose an integer starting spacing $s_0$ sufficiently large for the construction. We also take it large enough for the fixed geometric checks used later in the crossing estimates of [22] Section 7. Both lattices use the spacings $s_k = s_0 L^k$. The two input families, parametrized by a small number $h$, are

#[#set math.equation(numbering: n => "(3.2)")
 $ upright("family") & upright("physical inverse temperature") & upright("couplings supplied to the scale map")\
upright(p) & K_0 + h & \( K_0 + h \) \( 1 + epsilon xi_e \)\
upright(d) & K_0 - h & g \( \( K_0 - h \) \( 1 + epsilon xi_e \) \) . $ <eq:two-input-families>]

The opposite sign of $h$ in the second row makes the mean charge increase with $h$ in both initializations. No symmetry of the distribution is involved in this parametrization.

Write $tilde(K)_e$ for the coupling in either row, on the lattice of that row. Allocate each edge to its nearest $s_0$-grid center, with distance measured from its midpoint and ties split equally. If $alpha_(i \, e)$ is its allocation to $s_0 i$, then $alpha_(i \, e) gt.eq 0$, $sum_i alpha_(i \, e) = 1$, and the allocation respects grid translations and square symmetries. Define

#[#set math.equation(numbering: n => "(3.3)")
 $ f_i^(\( 0 \)) = sum_e alpha_(i \, e) \( tilde(K)_e - K_0 \) b_e . $ <eq:initial-array>]

The sum of these functions is precisely the change from the pure Ising logarithmic weight, up to a spin-independent constant. This remains true for conditional specifications with exterior pins, including the bonds incident to the free spins.

Each initial potential is bounded, even, pure centered, and determined by bonds in a fixed multiple of its cell. The iid bond law and the equivariant allocation give grid stationarity and square symmetry in law. For the dual array, the crossing-edge correspondence is a bijection, so the transformed bonds are again iid on the dual lattice. All the array hypotheses of Section 2 therefore hold for both families. They persist under iteration. Moreover, boundedness of the initial disorder and (2.3) give a deterministic bound on each potential at every fixed number of steps, uniformly on a compact interval of $h$.

Recall $sigma_rho^2 = bb(E)_rho xi^2 > 0$, and put

$ C_rho = 2 K_0^2 sigma_rho^2 . $

The strict positivity is where nondegeneracy of $rho$ enters the tuning. The following estimates also locate both temperatures to second order in the disorder strength.

#thm([Lemma 3.1.])[
  (Initial coordinates).  #emph[Fix $T < oo$. Uniformly for $\| h \| lt.eq T epsilon^2$, either family in (3.2) satisfies 
#[#set math.equation(numbering: n => "(3.4)")
 $ X_0 & lt.eq C \( s_0 \) epsilon + O_(T \, s_0) \( epsilon^2 \) \, & Y_0 & = O_(T \, s_0) \( epsilon^2 \) \,\
m_0 & = 2 s_0 #scale(x: 120%, y: 120%)[\(] h + d_rho epsilon^2 + O_T \( epsilon^3 \) #scale(x: 120%, y: 120%)[\)] \, & W_0 & = C_rho epsilon^2 + O_T \( epsilon^3 \) \, $ <eq:initial-coordinate-bounds>]

 where $d_rho = 0$ for the primal family and $d_rho = 1 / 2 g'' \( K_0 \) K_0^2 sigma_rho^2$ for the dual family. For every subsequently fixed $H > R_0$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ v_(H \, 0) = C_rho epsilon^2 + O_(T \, H \, s_0) \( epsilon^3 \) . $ <eq:initial-variance>]

]
] <lem:initial-coordinates>

#proof[
  The primal coupling displacement is
  $ tilde(K)_e - K_0 = h + K_0 epsilon xi_e + O_T \( epsilon^3 \) . $
  For the dual family, Taylor expansion at $K_0$ gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ tilde(K)_e - K_0 = h - K_0 epsilon xi_e + 1 / 2 g'' \( K_0 \) K_0^2 epsilon^2 xi_e^2 + O_T \( epsilon^3 \) . $ <eq:dual-initial-expansion>]
  The remainders are uniform because $\| xi_e \| lt.eq 1$. In particular, the dual mean contains a quadratic shift even though $bb(E)_rho xi = 0$. There is no claim that its cubic remainder vanishes.
  There are two edges per square-lattice vertex. Averaging the allocation over a period consequently gives $sum_e alpha_(0 \, e) = 2 s_0^2$. The charge normalization and independence of different edges give the exact identities
  #[#set math.equation(numbering: n => "(3.7)")
   $ m_0 & = 2 s_0 bb(E) \( tilde(K)_e - K_0 \) \,\
W_0 & = s_0^(- 2) sum_e alpha_(0 \, e) (sum_i alpha_(i \, e)) "Var" \( tilde(K)_e \) = 2 "Var" \( tilde(K)_e \) . $ <eq:initial-charge-variance>]
  Substitution of the two expansions proves the asserted bounds for $m_0 \, W_0$. The finite number of uniformly bounded functions $b_e$ in a cell gives the bounds for $X_0 \, Y_0$; the coefficient of the leading $epsilon$ bound for $X_0$ is independent of $T$. Finally, (2.9) yields (3.5). ◻
]

=== 3.2 Keeping the expanding coordinate between two walls <keeping-the-expanding-coordinate-between-two-walls>

We now adapt the shooting argument of [22] Section 6 to these two initializations. The purpose of the argument is to control the expanding mean charge while the variance slowly decreases. Its continuity step must accommodate atoms in $rho$, and will use the independent continuous thresholds of the scale construction.

#thm([Proposition 3.2.])[
  (Two small trajectories).  #emph[Let $rho$ be a nondegenerate mean-zero law supported on $\[ - 1 \, 1 \]$. There are constants $A \, B \, D \, c > 0$, a fixed cutoff $H$, and $epsilon_0 \( rho \) in \( 0 \, 1 \)$ with the following property. For each $0 < epsilon < epsilon_0 \( rho \)$, there are positive deterministic physical inverse temperatures 
#[#set math.equation(numbering: n => "(3.8)")
 $ beta_(upright(p)) = K_0 + O_rho \( epsilon^2 \) \, #h(2em) beta_(upright(d)) = K_0 + O_rho \( epsilon^2 \) $ <eq:tuned-temperatures>]

 such that the primal array at $beta_(upright(p))$ and the dual array at $beta_(upright(d))$ have, at the common spacings $s_k = s_0 L^k$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ v_k := v_(H \, k) > 0 \, #h(2em) X_k lt.eq A sqrt(v_k) \, #h(2em) Y_k lt.eq B v_k \, #h(2em) \| m_k \| lt.eq D v_k \, $ <eq:trajectory-region>]

 and 
#[#set math.equation(numbering: n => "(3.10)")
 $ v_k lt.eq frac(1, v_0^(- 1) + c k) . $ <eq:trajectory-decay>]

 In particular, $X_k arrow.r 0$ for both arrays. Given any $eta > 0$, the same choices can be made with $sup_k X_k lt.eq eta$ by decreasing $epsilon_0 \( rho \)$. All choices precede the specification of a domain or its lattice approximations.]
] <prop:two-trajectories>

#proof[
  We arrange that the two norm bounds persist whenever $\| m \| lt.eq D v$, while the map sends the two mean walls strictly outward. Continuity will then select a parameter that never exits the region. The constants $A \, B$ control the norm bounds, $D$ controls the mean walls, and the cutoff $H$ makes the variance decrease.
  We choose constants common to the two families. First take $A$ large enough for the leading initial bound $X_0 \/ sqrt(v_(H \, 0))$, and so that
  #[#set math.equation(numbering: n => "(3.11)")
   $ lambda A + 2 C_1 < A . $ <eq:choose-A>]
  This choice is possible before $T \, H$ are fixed: the leading variance is $C_rho epsilon^2$, and the leading norm bound in Lemma 3 is independent of those parameters. Next choose $D > 0$ so that
  #[#set math.equation(numbering: n => "(3.12)")
   $ \( L - 1 \) D > C_1 A^2 + 1 . $ <eq:choose-D>]
  Choose $T$ large enough that, in both families, the initial ratio $m_0 \/ \( D v_(H \, 0) \)$ is below $- 1$ at $h = - T epsilon^2$ and above $1$ at $h = T epsilon^2$, for sufficiently small $epsilon$ and every subsequently fixed $H$. Indeed its leading value is
  $ frac(2 s_0, D C_rho) (h / epsilon^2 + d_rho) \, $
  an affine function with positive slope. Finally choose $B$ large enough for $Y_0 lt.eq B v_(H \, 0)$ on this full interval, and for
  #[#set math.equation(numbering: n => "(3.13)")
   $ lambda B + C_1 \( D + A^2 \) < B . $ <eq:choose-B>]
  The order of choices so far is $A \, D \, T \, B$.
  Suppose an array satisfies the inequalities (3.9), with $v = v_H$ sufficiently small. Then (2.9) gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ W = v + O_H \( v^(3 \/ 2) \) . $ <eq:W-along-region>]
  Apply (2.10) with $z = sqrt(v)$. Since
  $ sum_(H < \| y \| lt.eq L H) \| y \|^(- 2) arrow.r 2 pi log L > 0 \, $
  we may now choose $H$ sufficiently large that the deterministic bound on $\| e_H \|$ is less than one quarter of $2 kappa sum_(H < \| y \| lt.eq L H) \| y \|^(- 2)$. After fixing this $H$, restrict $v$ to a sufficiently small interval, ensuring also $A sqrt(v) lt.eq min { 1 \, x_(*) }$. Equation (3.14) and the $O_H \( v^(5 \/ 2) \)$ remainder then imply, for fixed $c \, C_2 > 0$,
  #[#set math.equation(numbering: n => "(3.15)")
   $ v - C_2 v^2 lt.eq v' lt.eq v - c v^2 \, #h(2em) v' > 0 \, #h(2em) v' / v = 1 + O \( v \) . $ <eq:variance-trap>]
  Positivity follows by requiring $C_2 v < 1 \/ 2$. All these restrictions are uniform in the scale.
  The norm inequalities point into the region. Indeed,
  $ X' lt.eq lambda A sqrt(v) + C_1 sqrt(W) + C_1 B v lt.eq \( lambda A + C_1 + o \( 1 \) \) sqrt(v) lt.eq A sqrt(v') \, $
  by (3.11) and $v' \/ v arrow.r 1$. Similarly,
  $ Y' lt.eq #scale(x: 120%, y: 120%)[\(] lambda B + C_1 \( D + A^2 \) #scale(x: 120%, y: 120%)[\)] v lt.eq B v' $
  by the strict slack in (3.13). Conversely the two mean walls point outward: at $m = D v$,
  $ m' gt.eq L D v - C_1 A^2 v > D v' \, $
  and at $m = - D v$ the corresponding upper bound gives $m' < - D v'$. Here (3.12) and (3.15) supply the strict inequalities. Thus the variance and norm requirements persist up to and including a first exit through either mean wall.
  We have fixed $A \, D \, T \, B \, H$ and a small interval of permitted $v$. Only now decrease $epsilon_0 \( rho \)$. The initial estimates then give positive $v_0$ in this interval, together with both norm bounds, for every $h in \[ - T epsilon^2 \, T epsilon^2 \]$. They also give the two strict endpoint inequalities for $m_0 \/ \( D v_0 \)$.
  To apply a shooting argument we next verify continuity in $h$ at every finite time. Couple nearby parameters using the same bond variables, construction priorities, and thresholds. At a fixed number of steps, a prescribed finite collection of determining stencils uses a deterministic finite set of spin sites and potential coin labels. The comparison graph is chosen independently of the flag statuses; unused coins remain as dummy variables, and integrations retain all old field variables. Thus all the potentials in these stencils can be viewed on a common finite field alphabet, independently of $h$. Fix a parameter $h$. Only finitely many comparisons determine these potentials. Priorities have no ties almost surely. At each flag comparison, its threshold is independent of the input data and has a continuous law, so equality has probability zero, even when $rho$ has atoms. Inductively, the statuses are locally constant at the fixed $h$ almost surely, and all remaining finite conditional sums and logarithms are continuous. Consequently the potentials are almost surely continuous at this fixed $h$ in supremum norm. The deterministic finite-step bound following (3.3) permits dominated convergence. In particular, as $h_n arrow.r h$,
  $ parallel bb(E) f_0^(\( k \)) \( h_n \) - bb(E) f_0^(\( k \)) \( h \) #scale(x: 120%, y: 120%)[parallel]_oo lt.eq bb(E) parallel f_0^(\( k \)) \( h_n \) - f_0^(\( k \)) \( h \) #scale(x: 120%, y: 120%)[parallel]_oo arrow.r 0 \, $
  which proves continuity of $Y_k$. The same domination, the bounded linear charge, and the finite covariance and coefficient sums prove continuity of $X_k \, m_k \, W_k \, v_(H \, k)$.
  For either family, this continuity first gives a closed interval $I_0 subset \[ - T epsilon^2 \, T epsilon^2 \]$ on which $- 1 lt.eq m_0 \/ \( D v_0 \) lt.eq 1$, with the left and right endpoints on the lower and upper walls, respectively. Suppose a nonempty closed interval $I_k$ has been chosen so that every parameter in it satisfies (3.9) through time $k$, and its endpoints lie on the opposite time-$k$ walls in that order. The estimates above give $v_(k + 1) > 0$ and the two norm bounds throughout $I_k$. Its endpoints have $m_(k + 1) \/ \( D v_(k + 1) \) < - 1$ and $> 1$, respectively. Take the first point, starting at the left endpoint, where this continuous ratio is $1$, and then its last preceding point where the ratio is $- 1$. Between those points the ratio lies in $\[ - 1 \, 1 \]$. They therefore bound a closed interval $I_(k + 1) subset I_k$ with all the required properties at time $k + 1$; the earlier-time requirements are retained. The identical first-and-last-hit construction gives $I_0$.
  Compactness supplies $h in ⋂_(k gt.eq 0) I_k$. No monotonicity of the iterated coordinates in $h$ is needed. For this parameter, (3.15) holds at every step, and hence
  $ 1 / v_(k + 1) gt.eq 1 / v_k + c . $
  This proves (3.10) and $X_k arrow.r 0$. Since $v_k lt.eq v_0 = O_rho \( epsilon^2 \)$, it also proves the arbitrarily small uniform bound on $X_k$.
  Apply this argument to both rows of (3.2), obtaining parameters $h_(upright(p))$ and $h_(upright(d))$. The physical temperatures are $beta_(upright(p)) = K_0 + h_(upright(p))$ and $beta_(upright(d)) = K_0 - h_(upright(d))$. Their positivity and (3.8) follow from $\| h_(upright(p)) \| \, \| h_(upright(d)) \| lt.eq T epsilon^2$. ◻
]

The shooting construction alone does not establish uniqueness. Each selected temperature gives an exact small-potential representation at every scale, with the perturbation vanishing in environmental moments. The next argument compares these representations on a common torus and forces their physical temperatures to agree.

== 4 Matching the primal and dual temperatures <sec:matching>

Proposition 4 supplies a small trajectory for the primal couplings at $beta_(upright(p))$ and another for the dual couplings at $beta_(upright(d))$. We now prove that these physical temperatures coincide. The comparison takes place in the same bond environment on a torus. Exact duality relates the four spin partition functions, while FK monotonicity separates two distinct temperatures. The argument extends the torus identification in [22] Section 8, Proposition “Identification of the tuned parameter”; it uses the two trajectories in place of symmetry of the disorder law.

=== 4.1 FK differentiation at fixed environment <fk-differentiation-at-fixed-environment>

For a finite graph $G = \( V \, E \)$ and a partition $pi$ of its boundary vertices, let

#[#set math.equation(numbering: n => "(4.1)")
 $ phi.alt_(G \, beta \, omega)^pi \( eta \) = 1 / cal(Z)_(G \, beta \, omega)^pi 2^(k_pi \( eta \)) product_(e in E) w_e \( beta \)^(eta_e) \, #h(2em) eta in { 0 \, 1 }^E \, $ <eq:fk-law>]

where $w_e \( beta \) = e^(2 beta J_e) - 1$ and $k_pi$ counts open clusters after the boundary identifications. The superscript $upright(w)$ denotes full wiring. All connection events below use ordinary edges; boundary identifications are not steps in a path. At fixed environment, these measures are monotonic measures: every edge’s conditional open probability increases when more of the other edges are open. They satisfy positive association, increase with the edge odds and the boundary wiring, and have the domain Markov property [11,12]. Edwards–Sokal coloring couples them to the Ising law [10]. The dual measure, denoted by an additional superscript $*$, has odds $w_(e^(*))^(*) \( beta \) = 2 \/ w_e \( beta \)$ as in (3.1). The parameter $beta$ in this notation is always the physical primal inverse temperature.

Two finite-volume formulas will be used both here and in Section 6. For an increasing event $A$, set $q \( beta \) = phi.alt_(G \, beta \, omega)^pi \( A \)$. Differentiating the finite sum in (4.1) gives

#[#set math.equation(numbering: n => "(4.2)")
 $ q' \( beta \) = sum_(e in E) a_e \( beta \) "Cov"_(phi.alt_(G \, beta \, omega)^pi) \( upright(bold(1))_A \, eta_e \) \, #h(2em) a_e \( beta \) = frac(upright(d), upright(d) beta) log w_e \( beta \) = frac(2 J_e, 1 - e^(- 2 beta J_e)) . $ <eq:weighted-derivative>]

On every compact interval in $\( 0 \, oo \)$ these coefficients have uniform positive lower bounds, because $1 - epsilon lt.eq J_e lt.eq 1 + epsilon$. For the dual law the same identity holds with coefficient $- a_e \( beta \)$ at the crossing edge. All the covariances are nonnegative.

If a decision tree determines $A$ and queries edge $e$ with probability $delta_e$, the decision-tree inequality for monotonic measures gives

#[#set math.equation(numbering: n => "(4.3)")
 $ phi.alt \( A \) \( 1 - phi.alt \( A \) \) lt.eq C_(upright("DT")) sum_(e in E) delta_e "Cov"_phi.alt \( upright(bold(1))_A \, eta_e \) . $ <eq:fk-osss>]

Here $C_(upright("DT"))$ is an absolute constant; an independent randomized choice of tree is allowed. We use the monotonic-measure extension [9] Theorem 1.1 of the OSSS inequality [21]. Both (4.2) and (4.3) are applied at fixed environment, before any environmental expectation.

=== 4.2 Four sectors on a torus <four-sectors-on-a-torus>

Torus duality mixes partition functions with different spin twists, so we retain all four sectors. Normalizing their vector removes a common bulk factor introduced by the scale transformations. The resulting comparison will make the primal FK winding probabilities at the two tuned temperatures asymptotically equal. The derivative bound will then force those temperatures to agree.

Let $bb(T)_N = \( bb(Z) \/ N bb(Z) \)^2$, $N gt.eq 3$. A flat spin twist with holonomy $alpha = \( alpha_1 \, alpha_2 \) in { 0 \, 1 }^2$ is an assignment of edge signs $tau_e^alpha$ whose product around every elementary face is $1$ and whose products around the two coordinate cycles are $\( - 1 \)^(alpha_1)$ and $\( - 1 \)^(alpha_2)$. Define

$ Z_alpha \( K \) = sum_(sigma in { - 1 \, 1 }^(bb(T)_N)) exp (sum_(e = { x \, y }) K_e tau_e^alpha sigma_x sigma_y) . $

A change of the twist by a vertex gauge transformation is absorbed by changing the spin variables. Thus $Z_alpha$ depends only on the holonomy. Order the four entries as $00 \, 10 \, 01 \, 11$, and write $Z \( K \) = \( Z_alpha \( K \) \)_alpha$ and $hat(Z) \( K \) = Z \( K \) \/ parallel Z \( K \) parallel_2$.

#thm([Lemma 4.1.])[
  (Inhomogeneous torus duality).  #emph[For positive couplings $K$ on $bb(T)_N$, let $K_(e^(*))^(*) = g \( K_e \)$ and identify the dual square torus with a translate of the primal torus. Then 
#[#set math.equation(numbering: n => "(4.4)")
 $ Z \( K \) = a \( K \) sans(H) Z \( K^(*) \) \, #h(2em) a \( K \) = product_e sqrt(sinh \( 2 K_e \)) \, #h(2em) sans(H) = 1 / 2 mat(delim: "(", 1, 1, 1, 1; 1, 1, - 1, - 1; 1, - 1, 1, - 1; 1, - 1, - 1, 1) . $ <eq:torus-duality>]

 The matrix $sans(H)$ is orthogonal and fixes $Z \( K_0 \)$. Moreover, under the untwisted torus FK law, 
#[#set math.equation(numbering: n => "(4.5)")
 $ frac(Z_alpha \( K \), Z_00 \( K \)) = phi.alt_(bb(T)_N \, K) #scale(x: 120%, y: 120%)[\(] alpha dot.op \[ gamma \] = 0 upright(" for every open cycle ") gamma #scale(x: 120%, y: 120%)[\)] \, $ <eq:torus-ratio>]

 where $\[ gamma \] in \( bb(Z) \/ 2 bb(Z) \)^2$ is the mod-two winding class.]
] <lem:torus-duality>

#proof[
  This is the finite-volume Kramers–Wannier identity [18]; the four-sector formulation is also given in [3] and proved in [22] Section 8, Lemma “The four torus partition functions”. We include the expansions to specify the homology and normalization. For $b in \( bb(Z) \/ 2 bb(Z) \)^2$, put
  $ U_b \( K \) = sum_(F subset E \( bb(T)_N \) med upright("even")\
 \[ F \] = b) product_(e in F) tanh K_e . $
  Here even means that every vertex has even degree in $F$. The high-temperature expansion is
  $ Z_alpha \( K \) = 2^(N^2) product_e cosh K_e sum_b \( - 1 \)^(alpha dot.op b) U_b \( K \) . $
  Since $e^(- 2 K_(e^(*))^(*)) = tanh K_e$, the low-temperature expansion of the dual spin system with holonomy $gamma$ gives
  $ Z_gamma \( K^(*) \) = 2 e^(sum_e K_(e^(*))^(*)) U_(\( gamma_2 \, gamma_1 \)) \( K \) . $
  The exchange of coordinates expresses the intersection pairing of primal and dual cycles; the factor $2$ counts the two spin assignments with a prescribed domain-wall configuration. Substitution yields the sign $\( - 1 \)^(alpha_1 gamma_2 + alpha_2 gamma_1)$ in (4.4). Its prefactor follows from $\| E \( bb(T)_N \) \| = 2 N^2$ and $e^(- K_(e^(*))^(*)) cosh K_e = sqrt(sinh \( 2 K_e \) \/ 2)$. Direct multiplication gives $sans(H)^2 = I$. At constant coupling $K_0$, duality leaves the couplings unchanged and $a \( K_0 \) = 1$, so $sans(H) Z \( K_0 \) = Z \( K_0 \)$.
  For the ratio, use
  $ e^(K_e tau_e^alpha sigma_x sigma_y) = e^(- K_e) (1 + \( e^(2 K_e) - 1 \) upright(bold(1))_({ sigma_x = tau_e^alpha sigma_y })) . $
  On an open subgraph the constraints are consistent exactly when every open cycle has zero evaluation under $alpha$. If consistent, they admit $2^(k \( F \))$ spin assignments. Summation over the subgraphs and division by the untwisted partition function prove (4.5). ◻
]

#thm([Proposition 4.2.])[
  (Matching of the two trajectories).  #emph[The physical temperatures in Proposition 4 coincide: 
#[#set math.equation(numbering: n => "(4.6)")
 $ beta_(*) := beta_(upright(p)) = beta_(upright(d)) . $ <eq:matched-temperature>]

 Thus both the primal and the exact dual coupling arrays at $beta_(*)$ have uniformly small scale trajectories with $X_k arrow.r 0$.]
] <prop:matching>

#proof[
  Choose a fixed sufficiently large integer $M$ and set $N_k = M s_k$. The torus is large enough that every complete update stencil used through level $k$, including field supports, integration boundaries, and environment-dependence neighborhoods, fits in an embedded square of diameter less than $N_k \/ 4$. These connected square carriers give contractible charts with connected nonempty overlaps. Put iid bonds on this torus and use the same bond variables at all temperatures being compared.
  First consider either of the two trajectories, with couplings $tilde(K)$. Run its local scale map in all four holonomies, using the same algorithmic variables, denoted by $zeta$. In a contractible chart the flat twist can be removed by a local spin trivialization. On connected overlaps two such trivializations differ by a constant spin flip. The potentials are even, and the reference auxiliary variables are unchanged by spin flip. The local change of spin coordinates preserves the supremum norms and the flag decisions made using the shared thresholds, and identifies the twisted pure conditional kernels with their plane counterparts. Centering uses the full-plane reference law in these local coordinates, so its scalar is independent of the sector; it does not use a twisted torus expectation. The sector-dependent global correlations remain in the reference partition functions $Z_alpha \( K_0 \)$. The bare centering has the same property: writing $c_(upright("en")) = bb(E)_0 \( sigma_x sigma_y \)$, the centered twisted bond is $tau_e^alpha sigma_x sigma_y - c_(upright("en"))$, and the scalar removed from the initial logarithmic perturbation is $c_(upright("en")) sum_e \( tilde(K)_e - K_0 \)$ in every holonomy. Consequently every local integration identity holds with the same centering factor in all four sectors. This is the all-sector use of the exact local map, as in the torus argument of [22] Section 8.
  After $k$ steps there is therefore a common positive factor $c_k \( omega \, zeta \)$ such that, for every $alpha$,
  #[#set math.equation(numbering: n => "(4.7)")
   $ e^(- S_k) Z_alpha \( K_0 \) lt.eq c_k \( omega \, zeta \)^(- 1) Z_alpha \( tilde(K) \) lt.eq e^(S_k) Z_alpha \( K_0 \) . $ <eq:sector-sandwich>]
  One may take $S_k$ to be the sum, over the four sectors, of the supremum norms of all remaining potentials. Integrations in the reference auxiliary variables are with probability measures and do not enlarge this bound. There are $M^2$ cells at the final scale, and embedded stencils have their plane laws. Hence
  $ bb(E) S_k lt.eq C M^2 X_k arrow.r 0 . $
  Normalizing (4.7) in Euclidean norm gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ parallel hat(Z) \( tilde(K) \) - hat(Z) \( K_0 \) #scale(x: 120%, y: 120%)[parallel]_2 arrow.r 0 quad upright("in environmental probability") . $ <eq:tuned-sector-convergence>]
  The partition functions themselves do not involve $zeta$, so this conclusion remains true for the original bond environment alone.
  For the primal trajectory, (4.8) applies directly at $beta_(upright(p))$. For the dual trajectory it applies to $K^(*) \( beta_(upright(d)) \)$. By Lemma 5, $hat(Z) \( K \) = sans(H) hat(Z) \( K^(*) \)$ and the target is fixed by $sans(H)$. Thus the #emph[primal] normalized partition vector approaches the pure vector at both $beta_(upright(p))$ and $beta_(upright(d))$. This uses exact duality in the given environment; it makes no assertion that the primal and dual environments have the same distribution.
  Take $alpha = 10$, and let $A_alpha$ be the increasing event that there is an open cycle with odd evaluation under $alpha$. Write $q_(N \, omega) \( beta \) = phi.alt_(bb(T)_N \, beta \, omega) \( A_alpha \)$ and let $q_N^0$ be its pure critical probability. The pure torus crossing bounds give a constant $c > 0$ such that
  #[#set math.equation(numbering: n => "(4.9)")
   $ c lt.eq q_N^0 lt.eq 1 - c $ <eq:pure-torus-nondegeneracy>]
  for all sufficiently large $N$. Indeed, a fixed chain of overlapping FK rectangle crossings constructs a horizontal open winding cycle. A vertical closed-dual winding cycle excludes every open cycle of odd horizontal winding. Each construction has a uniform positive probability by pure FK rectangle bounds, imposed successively under arbitrary induced wirings; see [22] Section 8 and [23] Section 2, “Pure buffered RSW consequences”.
  Equation (4.5) identifies $1 - q_(N \, omega) = Z_10 \/ Z_00$. All four partition-function ratios belong to $\[ 0 \, 1 \]$, so the untwisted coordinate of every normalized vector is at least $1 \/ 2$. Taking ratios in (4.8) therefore gives, jointly,
  #[#set math.equation(numbering: n => "(4.10)")
   $ q_(N_k \, omega) \( beta_(upright(p)) \) - q_(N_k)^0 arrow.r 0 \, #h(2em) q_(N_k \, omega) \( beta_(upright(d)) \) - q_(N_k)^0 arrow.r 0 $ <eq:matching-endpoints>]
  in environmental probability.
  Suppose that $beta_(-) := min { beta_(upright(p)) \, beta_(upright(d)) }$ is strictly less than $beta_(+) := max { beta_(upright(p)) \, beta_(upright(d)) }$. Querying every edge in (4.3) and using (4.2) yields, uniformly over this interval,
  $ q'_(N_k \, omega) \( beta \) gt.eq c_1 q_(N_k \, omega) \( beta \) \( 1 - q_(N_k \, omega) \( beta \) \) . $
  With probability tending to one, both endpoint values lie in $\[ c \/ 2 \, 1 - c \/ 2 \]$ by (4.10). Monotonicity keeps the whole intervening curve in this interval. Integration then gives
  $ q_(N_k \, omega) \( beta_(+) \) - q_(N_k \, omega) \( beta_(-) \) gt.eq c_2 \( beta_(+) - beta_(-) \) > 0 $
  on events of probability tending to one. The left side tends to zero in probability by (4.10), a contradiction. ◻
]

== 5 From decaying potentials to crossing comparisons <sec:crossings>

Propositions 4 and 6 give potential arrays with small, decaying moment bounds on both lattices at the same physical temperature $beta_(*)$. We now turn this information into three geometric consequences: local conditional lower bounds, comparison of finite test vectors on tori, and exclusion of interior four-passage bottlenecks. The distinction between smallness and decay matters. Smallness supplies uniform passage estimates; decay makes the comparison errors vanish, although $sum_k X_k$ need not be finite.

The crossing propositions of [22] Section 7 are stated along its binary tuned trajectory. Their proofs use the local scale construction and independent primitive environment variables, together with

#[#set math.equation(numbering: n => "(5.1)")
 $ sup_k X_k lt.eq x_(upright("cr")) \, #h(2em) X_k arrow.r 0 . $ <eq:crossing-hypothesis>]

We give the extension to the arrays used here, including the conditional product estimate on which it depends. Throughout, the arrays form an actual trajectory of the exact local map of [22] Section 3, with its conditional implementations and reversals specified below. On a torus we use the same local formulas and independent primitive variables, so that every embedded stencil has its plane law. Merely assuming the displayed bounds for unrelated arrays would not suffice. Throughout the section $s_k = s_0 L^k$; $eta$ denotes the enlarged environment, including the independent priorities and thresholds of the scale construction. The Gibbs field contains spins and a locally finite family of finite-valued auxiliary variables, whose reference law is a product. These auxiliary variables are distinct from $eta$; their decorated Gibbs law need not be a product.

=== 5.1 Buffered tests and the three passage estimates <buffered-tests-and-the-three-passage-estimates>

Draw the northwest–southeast diagonal in each lattice square and interpolate spins affinely. The zero contours have the prescribed north-east/south-west pairing, up to a displacement of one mesh unit. A colored path uses vertices with the specified sign and edges of this triangulation; the diagonals introduce no additional Ising interactions. A #emph[corridor] is a polygonal topological rectangle with two opposite marked boundary arcs, called gates. Its crossing test asks for a colored path between the gates. A #emph[band] is the closed region between two disjoint simple polygons; its circuit test asks for a colored path separating them. We approximate these fixed nondegenerate polygons by subcomplexes, preserving the order of marked sides, with an error of order one lattice spacing. Each test comes with a specified open neighborhood in which spins, and the incident lattice edges, remain free. This neighborhood is its buffer.

A passage between two terminal sets is a contour subarc joining them, with interior in the prescribed region. Distinct passages have disjoint open parameter intervals on each contour, although endpoints at terminal hits may coincide. Thus several passages of one contour are counted separately. Cropping at the last hit of the first terminal before the first hit of the second gives precisely this convention.

For $S_r \( z \, alpha \) = z + e^(i alpha) \[ - r \, r \]^2$, consider the annulus $A \( z \, alpha \; r \, R \) = S_R \( z \, alpha \) \\ "int" S_r \( z \, alpha \)$. Write $F_4$ and $F_1$ for the events of at least four and at least one passage across this annulus. Write $H_2$ for two passages across it confined to $z + e^(i alpha) { "Im" w gt.eq 0 }$. The line in this last definition is a geometric constraint inside a free bulk chart; it carries no boundary pins.

We use the pure inputs of [23] Section 2, “Iterated four-passage bound”, “Pure buffered RSW consequences”, and “Two collars around an annulus”; Section 5, “Two bulk passages confined to a half-plane”. For some $c_0 > 0$, they give

#[#set math.equation(numbering: n => "(5.2)")
 $ limsup_(delta arrow.b 0) bb(P)_0 \( F_4 \( r \, R \) \) & lt.eq C \( r \/ R \)^(2 + c_0) \,\
limsup_(delta arrow.b 0) bb(P)_0 \( F_1 \( r \, R \) \) & lt.eq C \( r \/ R \)^(c_0) \,\
limsup_(delta arrow.b 0) bb(P)_0 \( H_2 \( r \, R \) \) & = o \( r \/ R \) . $ <eq:crossing-pure-inputs>]

The ratio $r \/ R$ is fixed before the mesh limit. Conditional laws with arbitrary pins beyond proportional inner and outer free collars have density at most a fixed factor $D$ relative to the pure bulk marginal; $D$ does not grow with $R \/ r$. These assertions permit the fixed crops, rotations, and translations needed below.

Fix a gap factor $G$ that separates successive ring collars, including their enlarged environmental neighborhoods. Choose smaller collars that will survive the local scale changes. For a candidate ratio $a > 1$ and each shape $i = 4 \, h \, 1$, let $q_i^0$ be a deterministic upper bound for its pure conditional probability at ratio $a$, uniform over placements and arbitrary pins beyond these smaller collars, once its inner lattice radius is sufficiently large. These bounds include the conditional density factor and the fixed crop losses. The pure estimates allow us to choose a large fixed $a$, such bounds $q_i^0$, exponents, and tolerances satisfying

#[#set math.equation(numbering: n => "(5.3)")
 $ p_4 > 2 \, #h(2em) p_h > 1 \, #h(2em) p_1 > 0 \, #h(2em) q_i^0 + tau_i < \( G a \)^(- p_i) \, quad tau_i > 0 \, quad i = 4 \, h \, 1 . $ <eq:crossing-slack>]

For $H_2$, first obtain strict slack below $\( G a \)^(- 1)$ from the little-oh bound and then choose $p_h > 1$ sufficiently close to one. Require $s_0$ large enough that these pure bounds hold at finite lattice scales for the three fixed shapes; this is the additional starting-scale choice reserved in Section 3. Slightly relaxed radii and compactness of directions and normalized offsets give uniformity over their placements. All choices in this paragraph precede the choice of the disorder interval.

One deterministic input explains why exactly these three exponents occur. By [23] Section 5, “Passages forced by a pivotal square”, if changing spins in a square of radius $b$ about $z$ changes a test $T$, the common exterior contours force successive four-passage, half-plane two-passage, and one-passage checks. More precisely, let $a_T > 0$ be smaller than the relevant side lengths and separations, and put

#[#set math.equation(numbering: n => "(5.4)")
 $ u = min { a_T \, max { b \, "dist" \( z \, cal(E)_T \) } } \, #h(2em) v = min { a_T \, max { b \, "dist" \( z \, cal(V)_T \) } } \, $ <eq:crossing-pivotal-distances>]

where $cal(E)_T$ and $cal(V)_T$ are its polygon sides and vertices, including confinement walls for $H_2$. The three checks are forced between scales $b \, u$, then $u \, v$, then $v \, a_T$. A bounded number of rings may be omitted at transitions, and their centers may move to the nearby side or vertex. The implication permits arbitrary fillings of the changed square. For the three fixed annular shapes, choose $a_T$ as a sufficiently small multiple of the inner radius $r$, so every retained ring has inner radius at most $r \/ 2$ and its collars stay in the free buffer.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.75, 2.2), [#text(size: 9pt)[Bulk range]])
  rect((0.55, 0.25), (2.95, 1.85), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 1pt)
  rect((1.55, 0.85), (1.95, 1.25), stroke: (thickness: 0.7pt, miter-limit: 10))
  bezier((1.55, 0.92), (0.55, 0.53), (1.12, 0.77), (0.91, 0.63), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((1.59, 1.25), (1.02, 1.85), (1.3, 1.48), (1.15, 1.67), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((1.92, 1.25), (2.63, 1.85), (2.22, 1.36), (2.46, 1.63), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((1.95, 0.94), (2.95, 0.57), (2.28, 0.69), (2.59, 0.69), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((1.75, 1.04), [#text(size: 7pt)[$z$]])
  content((1.75, -0.25), [#text(size: 9pt)[$b< ell <u$#linebreak()four passages]])
  content((6.3, 2.2), [#text(size: 9pt)[Side range]])
  rect((5.1, 0.25), (7.5, 1.85), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 1pt)
  line((4.85, 0.7), (7.75, 0.7), stroke: (thickness: 1.0pt, miter-limit: 10))
  rect((6.13, 0.94), (6.41, 1.22), stroke: (thickness: 0.7pt, miter-limit: 10))
  bezier((6, 0.76), (5.27, 1.85), (5.57, 0.96), (5.37, 1.42), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((6.52, 0.76), (7.28, 1.85), (6.85, 1.01), (7.15, 1.39), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((7.35, 0.71), (7.35, 1.08), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((7.38, 0.9), [#text(size: 7pt)[$u$]], anchor: "west", padding: 0.1176cm)
  content((4.87, 0.47), [#text(size: 7pt)[test side]], anchor: "west", padding: 0.1176cm)
  content((6.3, -0.25), [#text(size: 9pt)[$u< ell <v$#linebreak()two confined passages]])
  content((10.85, 2.2), [#text(size: 9pt)[Vertex range]])
  rect((9.65, 0.25), (12.05, 1.85), stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 1pt)
  line((9.45, 0.7), (10.44, 0.7), (10.44, 1.97), stroke: (thickness: 1.0pt, miter-limit: 10))
  circle((10.44, 0.7), radius: 0.04, fill: black, stroke: none)
  rect((10.77, 0.99), (11.05, 1.27), stroke: (thickness: 0.7pt, miter-limit: 10))
  bezier((11.06, 1.13), (12.05, 1.67), (11.33, 1.37), (11.67, 1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((10.48, 0.68), (10.91, 1.07), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((10.62, 0.82), [#text(size: 7pt)[$v$]], anchor: "north-west", padding: 0.1176cm)
  content((9.45, 0.47), [#text(size: 7pt)[test vertex]], anchor: "west", padding: 0.1176cm)
  content((10.85, -0.25), [#text(size: 9pt)[$v< ell <a_T$#linebreak()one passage]])
  line((1.1, -0.98), (12.3, -0.98), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#737373"))))
  line((1.15, -0.92), (1.15, -1.04), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((1.15, -1.04), [#text(size: 9pt)[$b$]], anchor: "north", padding: 0.1176cm)
  line((4.18, -0.92), (4.18, -1.04), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((4.18, -1.04), [#text(size: 9pt)[$u$]], anchor: "north", padding: 0.1176cm)
  line((8.45, -0.92), (8.45, -1.04), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((8.45, -1.04), [#text(size: 9pt)[$v$]], anchor: "north", padding: 0.1176cm)
  line((12.25, -0.92), (12.25, -1.04), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  content((12.25, -1.04), [#text(size: 9pt)[$a_T$]], anchor: "north", padding: 0.1176cm)
  content((6.7, -1.59), [#text(fill: rgb("#4d4d4d"))[#text(size: 7pt)[Increasing distance from the edit square]]])
})],
  caption: [Figure 1: The three geometric ranges in the pivotal-square implication. Orange squares indicate edits; orange sides and vertices belong to the test polygons, not to a pinned domain boundary. Blue arcs represent the required exterior passages, schematically, at an intermediate scale $ell$. The actual checks use separated rings, may be recentered on a side or vertex, and omit rings near the transition scales. Dashed frames illustrate free neighborhoods, not literal ring placements. The distinction between bulk, side, and vertex locations yields the exponent requirements $p_4 > 2$, $p_h > 1$, and $p_1 > 0$ in the location count. ],
) <fig:pivotal-ranges>

Figure 1 summarizes these ranges. The scales $u$ and $v$ locate the change from a two-dimensional set of possible edit centers to neighborhoods of sides and then vertices.

=== 5.2 Local conditional laws and a single reversal <local-conditional-laws-and-a-single-reversal>

Here and until physical lengths are explicitly introduced, distances are in lattice units. If $W$ is a free chart and $zeta$ specifies the exterior spin and reference auxiliary variables, the level-$k$ specification is

#[#set math.equation(numbering: n => "(5.5)")
 $ mu_(k \, eta \, W)^zeta \( upright(d) chi_W \) = frac(exp F_(k \, W)^zeta \( chi_W \), mu_(upright("pure") \, W)^zeta \( exp F_(k \, W)^zeta \)) mu_(upright("pure") \, W)^zeta \( upright(d) chi_W \) \, #h(2em) F_(k \, W)^zeta = sum_(i : thin "supp" f_i^(\( k \)) ∩ W eq.not diameter) f_i^(\( k \)) \( chi_W zeta_(W^c) \) . $ <eq:crossing-specification>]

The reference law is pure critical Ising times the product law of its auxiliary variables. At level zero, $mu_(0 \, eta \, W)^zeta$ is the conditional nearest-neighbor Ising law under consideration.

We import the “Local implementation” and “A coupling of consecutive fields” of [22] Section 3. Their hypotheses are the array hypotheses used in the scale construction: each potential is bounded, real, spin-flip even and pure centered, with field support and primitive environmental dependence within $C s_k$ of its cell; the primitive variables are independent; and the array is stationary on the scale grid and square symmetric in law. A finite first moment suffices for the mark estimate below, and follows here from the fortieth moment. No symmetry under negating a bond variable is required.

The local implementation has the following precise conditional scope. With #emph[old] exterior field variables fixed, the step can be performed inside $W$ and is exact. Nontrivial fresh-coin decorations whose full stencils leave $W$ are suppressed, their old logarithmic terms are retained, and integrations whose full stencils leave $W$ are skipped. All pairwise coin comparisons used to select separated parent cells are retained, including comparisons that do not lead to an integration; retained logarithmic terms are included in each permitted integration they meet. Every nontrivially decorated fresh coin is therefore sampled inside $W$. The output specification agrees with the full level-$\( k + 1 \)$ specification at distance at least $C_1 s_(k + 1)$ from $partial W$. Conditioning on the exterior of this eroded chart #emph[after] sampling the output gives a mixture of its conditional specifications. Exactness does not assert an unchanged input kernel if the fresh coins are independently pinned beforehand.

For fixed $eta$, reversal changes spins only in marked squares of radius $b_k = 5 s_(k + 1)$ about parent centers. The marks are independent conditional on $eta$ and independent of the entire output Gibbs sample. Choose the parameters themselves as exterior-independent measurable functions of the local primitive-variable stencil, with

#[#set math.equation(numbering: n => "(5.6)")
 $ p_(x \, k) \( eta \) lt.eq min {1 \, C_L sum_(i : thin \| s_k i - x \|_oo lt.eq C_L s_(k + 1)) parallel f_i^(\( k \)) parallel} \, #h(2em) bb(E) p_(x \, k) lt.eq C_L X_k . $ <eq:crossing-marks>]

This applies also to the localized step and to unused candidate centers. For example, if $S_x$ bounds the local logarithmic change, the old conditional density is at least $e^(- S_x)$ times the new one. Keeping the new sample with probability $e^(- S_x)$ and otherwise sampling the residual law proves the assertion, since $1 - e^(- S_x) lt.eq min { 1 \, S_x }$. Separation of the integration squares permits independent decisions.

For a check of inner radius $r$, start with $W = S_(2 a r) \( z \, alpha \) \\ S_(r \/ 2) \( z \, alpha \)$ and use $W_k = W ⊖ M_1 s_k$, where erosion removes a layer along both boundary components. Choose $M_1 s_(k + 1) gt.eq M_1 s_k + C_1 s_(k + 1)$ and then $M_0$ large enough that $r gt.eq M_0 s_k$ leaves the smaller proportional collars fixed above. Raise the first retained ring radius by a fixed factor if necessary so all enlarged stencils fit in disjoint collars.

For marks $M$ from just one reversal and a spin sample $sigma$, let $cal(C) \( sigma \, M \)$ be the configurations agreeing with $sigma$ outside their marked squares. Define

$ T^(+) \( sigma \, M \) & = upright(bold(1)) { T = 1 upright(" for some configuration in ") cal(C) \( sigma \, M \) } \,\
D_T \( sigma \, M \) & = upright(bold(1)) { T upright(" is nonconstant on ") cal(C) \( sigma \, M \) } . $

With $pi_(k - 1 \, eta)$ the mark law for reversing step $k - 1$, set

#[#set math.equation(numbering: n => "(5.7)")
 $ B_(k \, T) \( eta \) = sup_zeta mu_(k \, eta \, W_k)^zeta \( T \) \, #h(2em) B_(k \, T)^(+) \( eta \) = sup_zeta \( mu_(k \, eta \, W_k)^zeta ⊗ pi_(k - 1 \, eta) \) \( T^(+) \) \, quad k gt.eq 1 . $ <eq:crossing-envelopes>]

Only $B_(0 \, T)$ is used at level zero. Each supremum is a finite maximum: only finitely many exterior variables can enter the chart, and their alphabets are finite. It is consequently measurable and depends only on primitive environmental variables in the chart and a fixed $O \( s_k \)$ neighborhood. Taking the supremum #emph[before] environmental expectation preserves this locality and bounds arbitrary mixtures of exterior assignments: each fixed exterior kernel uses the same local primitive variables, so maximizing over exterior values introduces no additional environmental variables.

#thm([Lemma 5.1.])[
  (Error from one reversal).  #emph[Consider a fixed buffered test $T$ under a level-$k$ specification, with marks from step $k - 1$. Suppose every retained ring check satisfies $bb(E) B_(k \, T_i)^(+) lt.eq q_i^0 + tau_i$. Retain rings only beyond a fixed large multiple of $s_k$, with their collars enlarged by all field, mark, and environmental stencils disjoint and avoiding the inserted mark’s primitive-variable stencil. There is $c > 0$, independent of $T$, such that 
#[#set math.equation(numbering: n => "(5.8)")
 $ bb(E) sup_zeta \( mu_(k \, eta)^zeta ⊗ pi_(k - 1 \, eta) \) \( D_T \) lt.eq C_T X_(k - 1) min { 1 \, \( s_k \/ a_T \)^c } . $ <eq:crossing-one-step>]

 The same estimate bounds $T^(+) - T$, and holds for deterministic partial activation of the marks. Constants are uniform over the placements and dilations of the three fixed check shapes.]
] <lem:crossing-one-step>

#proof[
  Hold the output spin sample fixed and activate relevant squares in a deterministic order. The first square whose addition permits two values of $T$ is pivotal for some assignment inside the preceding squares. Reverting only the new square in that assignment shows that the passages forced by (5.4) are possible using previous marks. Enlarging to all other marks in each ring can only increase this event.
  For an inserted mark at $x$ and retained rings $T_1 \, dots.h \, T_m$, condition on all Gibbs variables outside one eroded ring chart and on all marks whose squares do not meet its test support. The enlarged collars put every square relevant to this support inside the chart and make the other ring events measurable under this conditioning. The remaining field has conditional law (5.5), with every potential touching the chart included, and the remaining marks retain their independent law. This conditions on output auxiliary variables only after their joint law has been constructed. It does not condition on the reconstructed old spins or on the other possibility events themselves. Iterating gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ sup_zeta #scale(x: 120%, y: 120%)[\[] p_(x \, k - 1) \( eta \) bb(P)_(k \, eta)^zeta \( T_1^(+) ∩ dots.h.c ∩ T_m^(+) \) #scale(x: 120%, y: 120%)[\]] lt.eq p_(x \, k - 1) \( eta \) product_(ell = 1)^m B_(k \, T_ell)^(+) \( eta \) . $ <eq:crossing-conditional-product>]
  The ring neighborhoods are disjoint and avoid the primitive-variable stencil of $p_(x \, k - 1)$. Independence of these primitive variables, including the priorities and thresholds, therefore gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ bb(E) [p_(x \, k - 1) product_(ell = 1)^m B_(k \, T_ell)^(+)] = bb(E) p_(x \, k - 1) product_(ell = 1)^m bb(E) B_(k \, T_ell)^(+) lt.eq C_L X_(k - 1) product_(ell = 1)^m \( q_(i \( ell \))^0 + tau_(i \( ell \)) \) . $ <eq:crossing-independent-product>]
  This factorization uses no property of the one-edge distribution beyond primitive independence. Unconditional quenched passage probabilities would not provide the local factors needed for it.
  Let $b = 5 s_k < a_T$. Rings of ratio $a$ spaced in ratio $G a$ and (5.3) bound the last product, including the bounded losses at transitions, by
  $ C_T \( b \/ u \)^(p_4) \( u \/ v \)^(p_h) \( v \/ a_T \)^(p_1) . $
  Normalize $a_T = 1$. Centers in a dyadic distance class $\( u \, v \)$ occupy area at most $C_T u v$: near a vertex the relevant side length is $O_T \( v \)$ and its transverse width is $O \( u \)$; the class $u = v = 1$ includes the remaining interior. Since centers have spacing comparable to $b$, there are at most $C_T u v \/ b^2$ such centers, including cell overhangs. Their total contribution is at most
  $ C_T X_(k - 1) \( b \/ u \)^(p_4 - 2) \( u \/ v \)^(p_h - 1) v^(p_1) . $
  The three ratios multiply to $b$, so this is bounded by $C_T X_(k - 1) b^d$ for $d = min { p_4 - 2 \, p_h - 1 \, p_1 } > 0$. There are $O_T \( \( 1 + log \( 1 \/ b \) \)^2 \)$ classes; absorbing this factor gives $c = d \/ 2$. If $b gt.eq a_T$, only a bounded number of candidate squares meet the fixed test, and the crude mark estimate suffices. Finally, $T^(+) - T lt.eq D_T$, and partial activation decreases the possibility events. ◻
]

=== 5.3 Closing the fixed-shape bootstrap <closing-the-fixed-shape-bootstrap>

#thm([Lemma 5.2.])[
  (Uniform conditional passage bounds).  #emph[There is a fixed $x_(upright("cr")) > 0$ such that $sup_j X_j lt.eq x_(upright("cr"))$ implies, for each of the three checks $T_i$ with inner radius $r gt.eq M_0 s_k$, 
#[#set math.equation(numbering: n => "(5.11)")
 $ bb(E) B_(k \, T_i) & lt.eq q_i^0 + C_(upright(b)) sum_(j = k)^(J \( r \)) X_j \( s_j \/ r \)^c \,\
bb(E) B_(k \, T_i)^(+) & lt.eq q_i^0 + C_(upright(b)) sum_(j = k)^(J \( r \)) X_j \( s_j \/ r \)^c + C_(upright(b)) X_(k - 1) \( s_k \/ r \)^c \, #h(2em) k gt.eq 1 \, $ <eq:crossing-bootstrap-plain>]

 where $J \( r \) = max { j : M_0 s_j lt.eq r }$. Both upper bounds are at most $q_i^0 + tau_i$. They hold for all placements, including embedded bulk torus charts, with arbitrary exterior Gibbs data.]
] <lem:crossing-bootstrap>

#proof[
  Use strong induction on dyadic ranges of $r \/ s_k$, simultaneously for all levels and placements. At terminal ratios $M_0 s_k lt.eq r < M_0 s_(k + 1)$ only a bounded number of potentials meet the chart. If $S$ is their total norm, the bounded logarithmic tilt in (5.5) gives
  $ sup_zeta parallel mu_(k \, eta \, W_k)^zeta - mu_(upright("pure") \, W_k)^zeta parallel_("TV") lt.eq min { 1 \, 2 S } \, #h(2em) bb(E) S lt.eq C X_k . $
  Since $\( s_k \/ r \)^c gt.eq \( M_0 L \)^(- c)$, this proves the terminal plain bound with a fixed $C_(upright(b))$.
  For a nonterminal plain check, the local scale change expresses the new interior law as a mixture of level-$\( k + 1 \)$ specifications. Its plain check has smaller ratio $r \/ s_(k + 1)$. Every ring controlling the reversal has inner radius at most $r \/ 2$, is evaluated at level $k + 1$, and has the required free collars. Its ratio to its spacing lies in a strictly smaller induction range. The inductive possibility estimates therefore justify Lemma 7, at cost $C X_k \( s_(k + 1) \/ r \)^c$. This is a fixed multiple of the $j = k$ term in (5.11); the next-level plain bound supplies the remaining terms.
  After proving the plain bound at a given ratio, compare its possibility event using marks from step $k - 1$. Its rings are now evaluated at level $k$, still have inner radii at most $r \/ 2$, and hence again belong to strictly smaller induction ranges. Lemma 7 adds $C X_(k - 1) \( s_k \/ r \)^c$. If no admissible ring fits, the test and edit scales differ by a bounded factor, so a bounded count of candidate marks gives the same estimate. This also starts the terminal possibility induction without a circular appeal to a passage estimate at its own ratio.
  The errors remain within the fixed tolerances because
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(j = k)^(J \( r \)) \( s_j \/ r \)^c lt.eq frac(M_0^(- c), 1 - L^(- c)) . $ <eq:crossing-geometric-sum>]
  Choose $C_(upright(b))$ to cover the terminal and one-step constants, and then choose $x_(upright("cr"))$ so that $C_(upright(b)) x_(upright("cr"))$ times this bound, plus the additional single-level term, is below $min_i tau_i$. These choices use only the three fixed check shapes and the fixed scale parameters. Each invocation of the induction uses precisely these tolerances, which closes both estimates. ◻
]

Lemma 7 now applies to every prescribed finite family of buffered polygonal tests. Such a family changes its constants $C_T \, a_T$, but does not change $x_(upright("cr"))$. The remaining convergence arguments use the elementary consequence of geometric spacing

#[#set math.equation(numbering: n => "(5.13)")
 $ sum_(j < K) X_j min { 1 \, \( s_(j + 1) \/ r \)^c } + X_K arrow.r 0 $ <eq:crossing-weighted-decay>]

as $r \, K arrow.r oo$, provided $s_K \/ r$ stays between fixed positive bounds. Indeed the sum of the weights is uniformly bounded. For $j gt.eq m$ bound $X_j$ by $sup_(j gt.eq m) X_j$, and for the finitely many $j < m$ let $r arrow.r oo$. Then let $m arrow.r oo$. This is where decay, rather than summability, is sufficient.

=== 5.4 The three geometric consequences <the-three-geometric-consequences>

#thm([Proposition 5.3.])[
  (Uniform local conditional comparison).  #emph[Assume the array hypotheses above and (5.1). Fix a bounded polygonal window with a finite family $cal(T)$ of corridor crossings, band circuits, or passage checks, strictly inside specified free buffers. Annular windows may have an inner and an outer free collar. Dilate the whole geometry by $r arrow.r oo$ in lattice units. There is an exterior-independent measurable envelope $cal(E)_r \( eta \)$ with $bb(E) cal(E)_r arrow.r 0$, uniformly over translations and scale-grid positions, such that every level-zero conditional test-vector law is within $cal(E)_r \( eta \)$ in total variation of a mixture of pure conditional test-vector laws on a still-buffered interior window.]
  #emph[Consequently, if an event in the test vector has pure conditional probability at least $c_(*) > 0$ under all exterior assignments after a sufficiently small fixed erosion of the buffers, its level-zero probability is at least any $c < c_(*)$, uniformly over exterior assignments, outside an environmental event of probability tending to zero. For a nearest-neighbor initial law, the event that this worst-boundary lower bound holds depends only on the bonds in the window and its incident layer.]
] <prop:local-comparison>

#proof[
  Choose a terminal level with $s_K \/ r$ between two sufficiently small fixed positive constants. The cumulative erosion has width $O \( s_K \)$, so all tests retain their prescribed buffers. At each reversal, (5.9) supplies an error bound for every exterior assignment before taking any mixture. Concretely it is the sum over inserted centers of their mark parameters times the products of the appropriate ring envelopes, or just the mark parameters when no ring fits. Summing over the finite family and steps gives an envelope whose expectation is bounded by
  #[#set math.equation(numbering: n => "(5.14)")
   $ bb(E) cal(E)_r lt.eq C_(cal(T)) (sum_(j < K) X_j min { 1 \, \( s_(j + 1) \/ r \)^c } + X_K) . $ <eq:crossing-local-error>]
  The final term comes from deleting the bounded number of level-$K$ potentials touching the remaining window, using the logarithmic-tilt bound in the preceding proof. Conditional on the final exterior this leaves the pure law, and disintegration gives the stated mixture. Equation (5.13) proves convergence.
  Every member of the pure mixture gives the selected event probability at least $c_(*)$. Thus every initial exterior assignment gives probability at least $c_(*) - cal(E)_r$. Average this inequality over the algorithmic choices conditional on the original bond environment $omega$, then apply Markov’s inequality. The resulting exceptional probability is at most $bb(E) cal(E)_r \/ \( c_(*) - c \)$. Although the bounding envelope may use more variables, the actual worst-boundary probability in the initial nearest-neighbor law uses only the window bonds and incident layer; its lower-bound event is therefore local. Uniformity means a bound for each placement with the same error rate, not simultaneous success at all placements. ◻
]

#thm([Proposition 5.4.])[
  (Expected total variation for torus tests).  #emph[Assume the same array hypotheses and (5.1). Fix finitely many buffered tests $cal(T)$ in a common planar chart, now in physical units. Let $delta arrow.b 0$ and choose tori of lattice period $M s_K$, with $M$ a sufficiently large fixed integer, $K arrow.r oo$, and physical periods $delta M s_K$ in a fixed compact subinterval of $\( 0 \, oo \)$ large enough for the chart and the complete scale stencils to embed. Give the torus iid bonds with the original law. If $nu_omega^(cal(T))$ and $nu_(upright("pure"))^(cal(T))$ are the initial quenched and pure critical laws of the whole Boolean test vector, then 
#[#set math.equation(numbering: n => "(5.15)")
 $ bb(E)_omega parallel nu_omega^(cal(T)) - nu_(upright("pure"))^(cal(T)) parallel_("TV") arrow.r 0 . $ <eq:crossing-torus-tv>]

 Such tori can be chosen for every deterministic mesh sequence.]
] <prop:torus-tests>

#proof[
  Embedded stencils have exactly their plane primitive-variable laws and the disjointness properties used above. Couple consecutive levels at fixed enlarged environment. The expected error for test $T$ at step $j$ is at most
  $ C_T X_j min { 1 \, \( delta s_(j + 1) \/ a_T^(upright("phys")) \)^c } \, $
  by Lemmas 7 and 8. Their sum tends to zero by the same geometric-weight argument as (5.13). At level $K$ the torus contains $O \( M^2 \)$ potentials, whose expected total norm is $O_M \( X_K \)$. Deleting them couples the entire terminal law to the pure torus with vanishing expected total variation. Glue these couplings and take a union bound over steps and the fixed test list. No estimate on the union of marks from different levels is needed.
  The initial test law depends only on $omega$, whereas the final pure law is deterministic. Averaging the coupling bounds over algorithmic choices therefore proves exactly (5.15), rather than merely comparison of annealed test laws. Finally, choosing $K$ as the first scale with $s_K gt.eq A delta^(- 1)$, for a sufficiently large fixed $A$, places the physical periods between $M A$ and $M A L$. ◻
]

#thm([Corollary 5.5.])[
  (No interior four-passage bottlenecks).  #emph[At $beta_(*)$, let $F$ be a fixed compact set with positive clearance inside the free part of the approximating domains, and choose a sufficiently small fixed physical radius $R > 0$ so that the required annular charts about $F$ remain free. Uniformly over all exterior spin assignments, 
#[#set math.equation(numbering: n => "(5.16)")
 $ lim_(r arrow.b 0) limsup_(delta arrow.b 0) bb(E)_omega mu_omega #scale(x: 120%, y: 120%)[\(] upright("four contour passages from ") r upright(" to ") R upright(" about some ") z in F #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:crossing-four-passages>]

 Passages have the parameter-interval multiplicities specified above. Fixed-factor changes of radii and local contour redrawing errors are permitted after corresponding crops.]
] <cor:four-passages>

#proof[
  At a fixed center, pack rings of ratio $a$, separated by factor $G$, between a fixed multiple of $r$ and a fixed fraction of $R$. For fixed physical $r > 0$, their lattice radii exceed $M_0 s_0$ once the mesh is small. Conditioning off their charts as in (5.9), and then applying (5.10) without an inserted mark, bounds the passage probability by the product of the plain envelopes. Their expectations are at most $q_4^0 + tau_4 < \( G a \)^(- p_4)$. Consequently the mesh upper limit is at most $C \( r \/ R \)^(p_4)$, uniformly over the ambient exterior data.
  Cover $F$ by an $r$-grid with $O_F \( r^(- 2) \)$ centers. Enlarging the inner radius and decreasing the outer radius by fixed factors makes four passages about any point imply a grid check. The union bound gives $C_(F \, R) r^(p_4 - 2)$ after the mesh limit. Since $p_4 > 2$, this tends to zero. The same crops absorb lattice rounding and the local matched drawings of the resolved contours. ◻
]

The initializations and their scale outputs satisfy every array hypothesis used here. Proposition 4 makes the uniform bound on $X_k$ in (5.1) as small as needed by reducing $epsilon_0 \( rho \)$, and makes $X_k$ decay. The fixed threshold $x_(upright("cr"))$ depends only on the three check shapes and the scale parameters. Thus this reduction of $epsilon_0 \( rho \)$ precedes the choice of a final domain, test family, or approximation sequence. Proposition 6 places these conclusions on both lattices at $beta_(*)$. The local comparison will give FK annular barriers; the torus comparison and four-passage exclusion will control the interface.

== 6 Identification of the physical critical point <sec:criticality>

The matched temperature $beta_(*)$ was selected by the scale map. To identify it with the magnetization threshold, we first construct local FK barriers at $beta_(*)$ on both lattices. These barriers rule out percolation at the matched temperature. Above $beta_(*)$, the dual odds decrease; a decision-tree argument then makes dual connections rare enough to force primal percolation. This is the local sharpness argument of [22] Section 8, applied to the exact dual family rather than to a distributionally self-dual model.

Write $B_r \( x \) = { y : \| y - x \|_oo lt.eq r }$ on the lattice under consideration; radii may be rounded to integers. Let $phi.alt_(beta \, omega)^(upright(w))$ be the primal infinite-volume wired FK measure. It is obtained by decreasing limits of finite wired-box laws on local increasing events, and the limit does not depend on the exhaustion. The analogous notation with a star refers to the dual odds at the same physical parameter $beta$.

=== 6.1 Annular barriers at the matched temperature <annular-barriers-at-the-matched-temperature>

#thm([Lemma 6.1.])[
  (Local FK barriers on both lattices).  #emph[There exist $a_0 > 1$ and $c_0 > 0$ with the following property, separately for the primal and dual lattices. Let $cal(A) \( x \, r \)$ be the annular graph between the lattice layers of radii $r$ and $a_0 r$, and let $cal(R) \( x \, r \)$ be the event of an ordinary open path between these layers. Call its bond environment good if 
#[#set math.equation(numbering: n => "(6.1)")
 $ phi.alt_(cal(A) \( x \, r \) \, beta_(*) \, omega)^(upright(w)) \( cal(R) \( x \, r \) \) lt.eq 1 - c_0 \, $ <eq:good-annulus>]

 using the odds of that lattice and wiring both boundary components together. Goodness depends only on the original bonds in the annulus and an incident layer, and 
#[#set math.equation(numbering: n => "(6.2)")
 $ sup_x bb(P) #scale(x: 120%, y: 120%)[\(] cal(A) \( x \, r \) upright(" is not good") #scale(x: 120%, y: 120%)[\)] arrow.r 0 #h(2em) \( r arrow.r oo \) . $ <eq:annulus-good-probability>]

 For a good annulus, the same crossing upper bound holds with any less wired boundary condition and after any decrease in its edge odds. In particular, 
#[#set math.equation(numbering: n => "(6.3)")
 $ bb(E)_rho phi.alt_(beta_(*) \, omega)^(upright(w)) \( 0 arrow.l.r oo \) = 0 . $ <eq:no-percolation-at-matching>]

]
] <lem:fk-barriers>

#proof[
  Choose $a_0$ large enough to place two disjoint annular subbands between the boundary layers, with positive-width free buffers around each. In the pure critical Ising model, simultaneous plus and minus spin circuits, one in each subband, have probability at least $2 c_0 > 0$, uniformly over spin pins beyond those buffers. This is [23] Section 2, Proposition “Pure buffered RSW consequences”: the two prescribed colors have disjoint buffered rectangle constructions. Fix the subbands with enough clearance that a small erosion of the buffers preserves this lower bound.
  Proposition 9, applied to these two circuit tests, transfers the lower bound to the quenched model, with environmental probability tending to one. Proposition 6 makes this comparison available for both the primal and dual arrays at $beta_(*)$. Apply it to Edwards–Sokal spins for the annular FK measure with its fully wired boundary cluster pinned plus. Every ordinary open FK path has constant spin. A radial path would have to meet both separating circuits, and hence could not be open. The triangulation used for the spin tests causes no exception: ordinary nearest-neighbor edges cannot cross a triangulated circuit without meeting one of its vertices. Thus the simultaneous circuit event implies the complement of $cal(R) \( x \, r \)$ and proves (6.1) outside an event of probability tending to zero.
  Defining goodness by the original finite-volume FK probability in (6.1) removes the auxiliary random choices of the scale construction. It is a measurable function of the stated local bond set. The all-exterior-pin scope of Proposition 9 gives (6.2) uniformly in placement. Monotonicity in the odds and in boundary wiring gives the remaining finite-volume assertion.
  To deduce (6.3), choose concentric annuli with a fixed large geometric separation, so that their full bond neighborhoods are disjoint. Start at a radius beyond which the probability of a bad annulus is at most $1 \/ 2$. For annulus $i$ put $a_i \( omega \) = 1 - c_0 upright(bold(1))_({ i upright(" is good") })$. In any containing finite wired box $G$, condition on all edges off this annulus. Its conditional law has a boundary partition dominated by full wiring; therefore
  $ phi.alt_(G \, beta_(*) \, omega)^(upright(w)) \( cal(R)_i divides upright("edges off annulus ") i \) lt.eq a_i \( omega \) . $
  Successively applying these conditional bounds shows that the probability of crossing $ell$ such annuli is at most $product_(i = 1)^ell a_i \( omega \)$. No independence of FK crossings is asserted here. Independence of the original bond neighborhoods does give
  $ bb(E)_rho product_(i = 1)^ell a_i \( omega \) = product_(i = 1)^ell bb(E)_rho a_i \( omega \) lt.eq \( 1 - c_0 \/ 2 \)^ell . $
  The same local bounds pass to the wired infinite-volume limit. Every infinite path crosses all the annuli, so letting $ell arrow.r oo$ proves the claim. ◻
]

=== 6.2 Dual arms above the matched temperature <dual-arms-above-the-matched-temperature>

The local comparison supplies no rate in (6.2). We first obtain a useful rate by using disjoint bond sets in many separated annuli at each center. The resulting environmental exceptional probability decays faster than every power of the box size. Outside this exceptional set a layer exploration has small revealment, and the weighted derivative strengthens polynomial arm decay to a stretched exponential bound.

#thm([Lemma 6.2.])[
  (Rapid annealed decay of dual arms).  #emph[For every $beta' > beta_(*)$ and $A > 0$ there is a finite constant $C_(beta' \, A)$ such that, on the dual lattice, 
#[#set math.equation(numbering: n => "(6.4)")
 $ bb(E)_rho phi.alt_(B_(2 N) \( x \) \, beta' \, omega)^(upright(w) \, *) #scale(x: 120%, y: 120%)[\(] x arrow.l.r partial B_N \( x \) upright(" inside ") B_N \( x \) #scale(x: 120%, y: 120%)[\)] lt.eq C_(beta' \, A) N^(- A) . $ <eq:dual-arm-bound>]

 The estimate is uniform in the center. It also holds for the same ordinary path event under any finite or infinite-volume dual FK law whose domain contains $B_(2 N) \( x \)$, with arbitrary boundary conditions outside that box.]
] <lem:dual-arms>

#proof[
  Fix $x$. For every $z in B_(N + 1) \( x \)$, choose $ell_N asymp log N$ concentric annuli of the type in Lemma 12, with inner radii between $N^(1 \/ 4)$ and a sufficiently small multiple of $N^(1 \/ 2)$. Choose their geometric spacing so that their full bond neighborhoods are disjoint and all lie inside $B_(N^(1 \/ 2)) \( z \)$. Let $eta_N$ be an upper bound for their bad-environment probabilities, uniformly over centers and the selected radii. Equation (6.2) gives $eta_N arrow.r 0$.
  Independence of the annuli at one fixed center shows that
  $ bb(P) #scale(x: 120%, y: 120%)[\(] upright("at least ") ell_N \/ 2 upright(" annuli at ") z upright(" are bad") #scale(x: 120%, y: 120%)[\)] lt.eq 2^(ell_N) eta_N^(ell_N \/ 2) . $
  Let $cal(G)_N$ be the event that fewer than half the annuli are bad at every $z in B_(N + 1) \( x \)$. A union bound gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ bb(P) \( cal(G)_N^c \) lt.eq C N^2 2^(ell_N) eta_N^(ell_N \/ 2) = o \( N^(- A) \) #h(2em) upright("for every ") A > 0 . $ <eq:amplified-environment-bound>]
  Indeed, $ell_N$ is bounded above and below by positive multiples of $log N$, while $log \( 1 \/ eta_N \) arrow.r oo$. There is no independence assertion between the annulus families at different centers.
  In an environment in $cal(G)_N$, multiply the conditional annulus bounds exactly as in the preceding proof. Since the dual odds decrease as $beta$ increases, the same environment gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ phi.alt_(B_(2 N) \( x \) \, beta \, omega)^(upright(w) \, *) #scale(x: 120%, y: 120%)[\(] z arrow.l.r partial B_(N^(1 \/ 2)) \( z \) upright(" inside ") B_(N^(1 \/ 2)) \( z \) #scale(x: 120%, y: 120%)[\)] lt.eq \( 1 - c_0 \)^(ell_N \/ 2) lt.eq C N^(- alpha) $ <eq:uniform-short-dual-arms>]
  for a fixed $alpha > 0$, all $z in B_(N + 1) \( x \)$, and every $beta in \[ beta_(*) \, beta' \]$. For large $N$ all the small boxes are contained in $B_(2 N) \( x \)$; their induced boundary conditions are covered by full annular wiring.
  Fix such an environment and let
  $ q_omega \( beta \) = phi.alt_(B_(2 N) \( x \) \, beta \, omega)^(upright(w) \, *) #scale(x: 120%, y: 120%)[\(] x arrow.l.r partial B_N \( x \) upright(" inside ") B_N \( x \) #scale(x: 120%, y: 120%)[\)] . $
  Choose an integer $i$ uniformly between $N \/ 4$ and $N \/ 2$, and explore all ordinary open clusters in $B_N \( x \)$ that meet the layer $partial B_i \( x \)$. This exploration determines the event defining $q_omega$: any path from $x$ to $partial B_N \( x \)$ meets the chosen layer, and all clusters meeting it have been completely explored inside $B_N \( x \)$. This adapts the layer exploration in [9] Lemma 3.2 and its proof.
  An edge is queried only when an endpoint lies on, or has an ordinary open path to, the chosen layer. For each fixed endpoint $z$, the fraction of choices of $i$ whose layer comes within distance $2 N^(1 \/ 2)$ of $z$ is at most $C N^(- 1 \/ 2)$. For any other choice, the connection to the layer forces an ordinary arm from $z$ to $partial B_(N^(1 \/ 2)) \( z \)$. Thus (6.6) gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ max_e delta_e lt.eq C #scale(x: 120%, y: 120%)[\(] N^(- 1 \/ 2) + N^(- alpha) #scale(x: 120%, y: 120%)[\)] lt.eq C N^(- d) \, #h(2em) d = min { 1 \/ 2 \, alpha } > 0 . $ <eq:layer-revealment>]
  The tree queries only edges in $B_N \( x \)$, but its law is the full wired measure on $B_(2 N) \( x \)$. In particular, it never follows a wired boundary identification. Edges outside $B_N \( x \)$ have zero revealment.
  All finite odds are positive, so $0 < q_omega \( beta \) < 1$. Apply (4.3) to this finite wired measure. In the dual version of (4.2), the coefficients of $- q'_omega$ are $a_e \( beta \)$, uniformly bounded below on $\[ beta_(*) \, beta' \]$. Covariances for edges outside the explored box remain nonnegative. Consequently
  #[#set math.equation(numbering: n => "(6.8)")
   $ - q'_omega \( beta \) gt.eq c_(beta') N^d q_omega \( beta \) \( 1 - q_omega \( beta \) \) \, #h(2em) beta in \[ beta_(*) \, beta' \] . $ <eq:dual-differential-inequality>]
  Moreover (6.6) at $z = x$ gives $q_omega \( beta_(*) \) lt.eq C N^(- alpha)$. Integrating the derivative of the logit, for all sufficiently large $N$,
  $ frac(q_omega \( beta' \), 1 - q_omega \( beta' \)) lt.eq frac(q_omega \( beta_(*) \), 1 - q_omega \( beta_(*) \)) e^(- c_(beta') \( beta' - beta_(*) \) N^d) lt.eq e^(- c_(beta') \( beta' - beta_(*) \) N^d) . $
  Averaging this estimate on $cal(G)_N$ and using (6.5) on its complement proves (6.4). In a larger graph, condition outside $B_(2 N) \( x \)$ and dominate the induced boundary partition by full wiring. This proves the final assertion, which then passes to infinite-volume limits. ◻
]

=== 6.3 Percolation and plus magnetization <percolation-and-plus-magnetization>

#thm([Proposition 6.3.])[
  (Physical criticality).  #emph[For the original iid bond law and every sufficiently small fixed $epsilon > 0$, the temperature in Proposition 6 satisfies 
#[#set math.equation(numbering: n => "(6.9)")
 $ beta_(*) = beta_c^rho \( epsilon \) . $ <eq:physical-critical-point>]

 The environmental mean of the infinite-volume plus magnetization is zero for $0 lt.eq beta lt.eq beta_(*)$ and strictly positive for every $beta > beta_(*)$.]
] <prop:physical-criticality>

#proof[
  By Lemma 12 and monotonicity,
  $ bb(E)_rho phi.alt_(beta \, omega)^(upright(w)) \( 0 arrow.l.r oo \) = 0 \, #h(2em) 0 < beta lt.eq beta_(*) . $
  Fix $beta' > beta_(*)$. Finite planar FK duality sends the primal odds to $2 \/ w_e \( beta' \)$, exactly the dual family considered in Lemma 13. In each buffered interior box the induced dual boundary condition is dominated by full wiring. Thus the lemma bounds ordinary closed-dual arms under finite primal wired laws and, by taking local limits, under $phi.alt_(beta' \, omega)^(upright(w))$. Only this local comparison is needed; no distributional self-duality is used.
  A closed-dual circuit surrounding $B_m \( 0 \)$ whose maximal distance from the origin lies in $\[ R \, 2 R \)$ has diameter at least $c R$. It therefore contains an ordinary dual arm reaching distance $c' R$ from some dual vertex in $B_(2 R + 1) \( 0 \)$. Sum (6.4) over the $O \( R^2 \)$ possible vertices, using the bound with its surrounding collar, and then over dyadic $R$ comparable with or larger than $m$. For any $A > 2$ this gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ bb(E)_rho phi.alt_(beta' \, omega)^(upright(w)) #scale(x: 120%, y: 120%)[\(] upright("a closed-dual circuit surrounds ") B_m \( 0 \) #scale(x: 120%, y: 120%)[\)] lt.eq C_(beta' \, A) sum_(j gt.eq 0) \( 2^j m \)^(2 - A) arrow.r 0 . $ <eq:surrounding-dual-circuits>]
  If every open cluster meeting $B_m \( 0 \)$ were finite, their finite union would contain the box and would be connected as a vertex set: each of its vertices is joined by an open path to the box, and the box itself is nearest-neighbor connected. Every outgoing edge of this union is closed. Its outer dual boundary therefore contains a surrounding closed-dual circuit: one may first fill the finite complementary components, after which all edges toward the infinite complementary component are still closed. The complement of the event in (6.10) forces an infinite open cluster to meet $B_m \( 0 \)$. For all sufficiently large $m$ this has positive probability under the joint environment–FK law. That law is translation invariant: the environment is iid and the wired infinite-volume specification is covariant under translations. Hence
  $ 0 < bb(E)_rho phi.alt_(beta' \, omega)^(upright(w)) \( B_m \( 0 \) arrow.l.r oo \) lt.eq \| B_m \( 0 \) \| thin bb(E)_rho phi.alt_(beta' \, omega)^(upright(w)) \( 0 arrow.l.r oo \) . $
  This proves positive expected wired percolation for every $beta' > beta_(*)$.
  It remains to identify this order parameter with the precise plus magnetization used in the definition of $beta_c^rho \( epsilon \)$. Fix an environment and $beta > 0$. In the finite spin box, include all bonds with at least one endpoint in that box and wire the exterior endpoints, pinning their cluster plus. Edwards–Sokal gives
  $ chevron.l sigma_0 chevron.r_(B_m \, beta \, J)^(+) = phi.alt_(beta \, omega)^(+ \, m) \( 0 arrow.l.r upright("wired exterior boundary") \) . $
  For these square boxes the boundary probability is exactly $u_(m + 1) \( omega \)$, where $u_n$ is the root-to-boundary probability in the ordinary wired box $B_n$. Indeed, completing the exterior endpoints to $partial B_(m + 1)$ adds only wired vertices and wired-to-wired edges, which do not affect this probability. The monotone limit of $u_n$ exists. To identify it with percolation in the local infinite-volume limit, first use wired domination:
  $ phi.alt_(beta \, omega)^(upright(w)) \( 0 arrow.l.r oo \) lt.eq u_m \( omega \) quad upright("for every ") m . $
  Conversely, for every fixed $r < m$, the root-to-boundary event in $B_m$ implies an ordinary connection from $0$ to $partial B_r$. Taking $m arrow.r oo$ for this local event and then $r arrow.r oo$ shows
  $ lim_m u_m \( omega \) lt.eq lim_r phi.alt_(beta \, omega)^(upright(w)) \( 0 arrow.l.r partial B_r \) = phi.alt_(beta \, omega)^(upright(w)) \( 0 arrow.l.r oo \) . $
  The equality with $u_(m + 1)$ gives the same limit for the exterior-plus convention. Thus, in each environment,
  #[#set math.equation(numbering: n => "(6.11)")
   $ lim_(m arrow.r oo) chevron.l sigma_0 chevron.r_(B_m \, beta \, J)^(+) = phi.alt_(beta \, omega)^(upright(w)) \( 0 arrow.l.r oo \) . $ <eq:magnetization-percolation>]
  All variables lie in $\[ 0 \, 1 \]$, so environmental expectations preserve this equality. At $beta = 0$ the magnetization is zero directly. The vanishing and positivity already proved establish (6.9) from the definition of the critical inverse temperature. ◻
]

== 7 Signed barriers and the quenched interface limit <sec:interface>

By Proposition 14, the common tuning parameter is $beta_(*) = beta_c^rho \( epsilon \)$. We now use the finite-vector comparison of Proposition 10 to place the target interface between two pure comparison interfaces. The comparisons will preserve the pure marginal conditional on the original bond environment. This is the property that will yield convergence of quenched laws, rather than only convergence after averaging over bonds. Throughout this section, probabilities without an environmental subscript include spins and coupling randomness as well as bonds.

=== 7.1 Boundary conventions and signed geometry <boundary-conventions-and-signed-geometry>

Fix a bounded Jordan domain $D$, distinct marks $a \, b in partial D$, and the deterministic approximations in Theorem 1. Write $D_n$ for their domains in physical coordinates, after multiplication by $delta_n$. A lattice Jordan domain here is a full square-lattice domain: bonds have not been deleted in its interior. One standard convention surrounds the union of closed square cells centered at the free spin sites, fixes the exterior nearest neighbors, and retains every bond incident to a free spin. The interface then has a local half-edge at each boundary change. Equivalently one can use a lattice polygon made of plaquettes, with the boundary vertices pinned and all interior vertices free. The argument below applies to both conventions. In the first convention the exterior pin assignment is an actual assignment to sites, so repeated incidences at one site must have the same value. The marked boundary changes and any half-edge endpoints differ by at most $O \( delta_n \)$.

We may take the boundary homeomorphisms to match the marks exactly. Indeed, their inverse images of the discrete marks converge to $a \, b$; in a fixed circle parametrization, precompose by circle homeomorphisms converging uniformly to the identity and taking $a \, b$ to those inverse images. After passage to a subsequence the designation of the plus arc is fixed. Denote the open limiting arcs by $I_(+)$ and $I_(-)$. Thus boundary order and signs, as well as positions, converge. Winding number stability then implies that each compact subset of $D$ is eventually inside $D_n$, and each compact subset of $bb(C) \\ overline(D)$ is eventually outside $D_n$.

Let $Gamma_n$ be the target contour, oriented from the mark near $a$ to the mark near $b$. Its conditional law given the original environment $omega$ is $Q_(n \, omega)$. We use the prescribed NE/SW resolution, or a simple drawing of the same resolution inside small vertex disks. Matching the contour pieces in their traversal order changes $d_(upright("curv"))$ by $O \( delta_n \)$. The resolved graph has degree two except at its two marked ends, so this drawing of its connecting component is a simple arc. Spin paths use the fixed triangulation by NW/SE diagonals from the crossing section. In the bulk its zero contours have precisely these resolved connections.

We next describe the boundary placements used in [22] Section 9, “Displaced domains and finite boundary barriers” and [23] Section 7, “Fixed displaced domains and their boundary incidences”. To obtain the lower pure comparison, move the middle plus boundary outward and the minus boundary inward. Two cuts allow comparison through a torus: a plus crossing screens the comparison domain’s plus boundary, and a minus crossing screens the target’s minus boundary. After revealing these crossings, the remaining boundary incidences have the orders needed for two comparisons with identical couplings. The strips on the central side of both cuts will transfer signed barriers between the domains.

Fix a plane Schoenflies homeomorphism $Psi$ taking the unit disk to $D$, $1 \, - 1$ to $a \, b$, and the upper semicircle to $I_(+)$. These coordinates describe topology only; all tests below are polygonal tests in the physical plane.

For small $h > 0$, first take a radial boundary equal to $1 + 3 h$ on $\[ 4 h \, pi - 4 h \]$, equal to $1 - 3 h$ off $\( 3 h \, pi - 3 h \)$, and affine on the two intervening angular intervals. Its image under $Psi$ encloses a preliminary domain favoring minus. Put its marks at angles $6 h \, pi - 6 h$, and give the intervening upper arc the plus sign. The remaining arc is minus. A minus cutting corridor $C_h^(-)$ follows $rho = 1 - h$ on $\[ pi - h \, 2 pi + h \]$, bending outward at its ends past $rho = 1 + h$; it is outside this comparison domain. A plus corridor $C_h^(+)$ follows $rho = 1 + h$ from $5 h$ to $pi - 5 h$, bending outward at its ends past $1 + 4 h$. It is outside $D$, and its caps cross the minus shoulders of the comparison boundary. Give the corridors small positive widths and slightly larger, mutually disjoint reveal regions on their exterior sides. Their caps extend beyond the boundaries they cut. The minus reveal region stays outside the comparison domain; the plus reveal region stays outside $overline(D)$. The #emph[central side] of a cut means its side toward $Psi \( 0 \)$.

Replace this finite configuration by sufficiently close polygonal arcs in the physical plane, preserving order, the cap crossings, and all the stated positive clearances. Such approximations can be made inside the transported rectangular neighborhoods of the arcs; this is the deterministic construction in the cited section of [23]. Call the polygonal domain $A_h^(-)$ and its marks $a_h^(-) \, b_h^(-)$. Choose the approximation errors to vanish with $h$. Its boundary parametrizations therefore converge uniformly to those of $D$. Rotating the coordinate construction by $pi$ and interchanging signs gives a domain $A_h^(+)$ favoring plus, still oriented from the mark near $a$ to that near $b$.

An #emph[allowed plus strip] is a polygonal topological rectangle whose closure lies inside $A_h^(-)$, on the central side of both cuts, and is disjoint from the closed reveal regions. Its two end gates lie outside $overline(D)$ on the enlarged plus side. Its closure stays in $Psi \( { rho < 1 + h \/ 2 } \)$ with a positive margin. All its contacts with $partial D$ lie on $I_(+)$, away from the marks. In a target sample a plus crossing of the strip is tested by filling its portions outside $D_n$ virtually with plus. This specifies a geometric event; it changes no actual spin or Gibbs weight. Minus strips in $A_h^(+)$ are defined with the signs reversed. Figure 2 distinguishes the cutting corridors from the strips they will protect.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.806), [#text(size: 9pt)[\(a\) Cutting corridors]])
  merge-path({arc((1.998, 0.8483), start: 23deg, stop: 157deg, radius: 2.171); line((-1.998, 0.8483), (-1.118, 0.3418)); arc((-1.118, 0.3418), start: 163deg, stop: 377deg, radius: 1.169)}, close: true, fill: rgb("#f2f2f2"), stroke: none)
  circle((0, 0), radius: 1.67, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((-1.998, 0.8483), (-1.118, 0.3418), stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((-1.118, 0.3418), start: 163deg, stop: 377deg, radius: 1.169, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  line((1.118, 0.3418), (1.998, 0.8483), stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((1.998, 0.8483), start: 23deg, stop: 34deg, radius: 2.171, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((-1.8, 1.214), start: 146deg, stop: 157deg, radius: 2.171, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((1.8, 1.214), start: 34deg, stop: 146deg, radius: 2.171, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  line((2.147, 1.19), (1.607, 0.8906), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  arc((1.607, 0.8906), start: 29deg, stop: 151deg, radius: 1.837, stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  line((-1.607, 0.8906), (-2.147, 1.19), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  line((-1.943, 0.2042), (-1.495, 0.1571), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  arc((-1.495, 0.1571), start: 174deg, stop: 366deg, radius: 1.503, stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  line((1.495, 0.1571), (1.943, 0.2042), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  content((0, 1.887), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$C_h^+$]]])])
  content((0, -1.52), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$C_h^-$]]])])
  content((0, -0.5511), [#text(size: 9pt)[$A_h^-$]])
  content((-1.92, -0.8851), [#text(fill: rgb("#808080"))[#text(size: 9pt)[$partial D$]]])
  circle((1.67, 0), radius: 0.03674, fill: black, stroke: none)
  content((1.67, 0), [#text(size: 9pt)[$a$]], anchor: "north-west", padding: 0.1176cm)
  circle((-1.67, 0), radius: 0.03674, fill: black, stroke: none)
  content((-1.67, 0), [#text(size: 9pt)[$b$]], anchor: "north-east", padding: 0.1176cm)
  circle((1.8, 1.214), radius: 0.03841, fill: black, stroke: none)
  content((1.8, 1.214), [#text(size: 9pt)[$a_h^-$]], anchor: "west", padding: 0.1176cm)
  circle((-1.8, 1.214), radius: 0.03841, fill: black, stroke: none)
  content((-1.8, 1.214), [#text(size: 9pt)[$b_h^-$]], anchor: "east", padding: 0.1176cm)
  content((0, 2.405), [#text(size: 9pt)[$+$]])
  content((0, -1.019), [#text(size: 9pt)[$-$]])
  content((5.928, 2.806), [#text(size: 9pt)[\(b\) An allowed strip]])
  merge-path({arc((7.927, 0.8483), start: 23deg, stop: 157deg, radius: 2.171); line((3.93, 0.8483), (4.811, 0.3418)); arc((4.811, 0.3418), start: 163deg, stop: 377deg, radius: 1.169)}, close: true, fill: rgb("#f2f2f2"), stroke: none)
  circle((5.928, 0), radius: 1.67, stroke: (paint: rgb("#808080"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((3.93, 0.8483), (4.811, 0.3418), stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((4.811, 0.3418), start: 163deg, stop: 377deg, radius: 1.169, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  line((7.046, 0.3418), (7.927, 0.8483), stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((7.927, 0.8483), start: 23deg, stop: 34deg, radius: 2.171, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((4.129, 1.214), start: 146deg, stop: 157deg, radius: 2.171, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  arc((7.728, 1.214), start: 34deg, stop: 146deg, radius: 2.171, stroke: (thickness: 1.4pt, cap: "round", join: "round"))
  line((8.076, 1.19), (7.535, 0.8906), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  arc((7.535, 0.8906), start: 29deg, stop: 151deg, radius: 1.837, stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  line((4.322, 0.8906), (3.781, 1.19), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  line((3.985, 0.2042), (4.434, 0.1571), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  arc((4.434, 0.1571), start: 174deg, stop: 366deg, radius: 1.503, stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  line((7.423, 0.1571), (7.872, 0.2042), stroke: (thickness: 4.0pt, cap: "round", join: "round"))
  bezier((6.847, 1.52), (5.979, -0.668), (6.713, 1.002), (6.797, -0.4175), stroke: (thickness: 0.7pt, cap: "round", join: "round", dash: "dashed"))
  bezier((5.979, -0.668), (4.843, 1.403), (5.21, -0.6346), (5.11, 0.8851), stroke: (thickness: 0.7pt, cap: "round", join: "round", dash: "dashed"))
  line((4.843, 1.403), (4.993, 1.52), stroke: (thickness: 0.7pt, cap: "round", join: "round", dash: "dashed"))
  bezier((4.993, 1.52), (5.962, -0.4843), (5.244, 0.9686), (5.427, -0.3674), stroke: (thickness: 0.7pt, cap: "round", join: "round", dash: "dashed"))
  bezier((5.962, -0.4843), (6.697, 1.62), (6.513, -0.334), (6.53, 1.019), stroke: (thickness: 0.7pt, cap: "round", join: "round", dash: "dashed"))
  line((6.847, 1.52), (6.697, 1.62), stroke: (thickness: 1.8pt, cap: "round", join: "round"))
  line((4.843, 1.403), (4.993, 1.52), stroke: (thickness: 1.8pt, cap: "round", join: "round"))
  content((7.398, 1.52), [#text(size: 9pt)[$g_a$]])
  content((4.392, 1.386), [#text(size: 9pt)[$g_b$]])
  content((6.329, -0.6346), [#text(size: 9pt)[$S$]])
  content((5.928, 0.6179), [#text(size: 9pt)[central side]])
  circle((7.598, 0), radius: 0.03674, fill: black, stroke: none)
  content((7.598, 0), [#text(size: 9pt)[$a$]], anchor: "north-west", padding: 0.1176cm)
  circle((4.258, 0), radius: 0.03674, fill: black, stroke: none)
  content((4.258, 0), [#text(size: 9pt)[$b$]], anchor: "north-east", padding: 0.1176cm)
})],
  caption: [Figure 2: Schematic geometry in Schoenflies coordinates for the minus-favoring comparison. The dashed circle represents $partial D$. The boundary of $A_h^(-)$ is enlarged along its middle plus arc and moved inward elsewhere. The blue cutting corridor is outside $D$; its caps cross the minus shoulders of $A_h^(-)$. The orange corridor is outside $A_h^(-)$ and cuts off the target minus arc. In the second panel an allowed plus strip lies on the central side of both cuts, with gates outside $D$. Widths and displacements are exaggerated. The strip is a deterministic test region, not a sampled interface, and the physical construction uses polygonal approximations. ],
) <fig:strip-squeeze>

At each fixed $h$ these placements are valid for every sufficiently large $n$. Boundary winding controls the compact clearances, and the marked boundary order controls signs near each contact. The caps prevent paths from going around the ends of a cut. This remains true for a free path ending next to an exterior pin: append its final incident bond before applying separation. With pinned boundary vertices that last bond already lies in the polygon. The difference between the two conventions is contained in one lattice layer and cannot defeat a fixed-clearance cap.

=== 7.2 Conditioning at a fixed environment <conditioning-at-a-fixed-environment>

For laws of vectors in ${ 0 \, 1 }^m$, write $prec.curly.eq$ for stochastic order with respect to coordinatewise order. We record the elementary coupling fact from [22] Section 9, Lemma “Conditioning and gluing at fixed environment”, including its proof because its conditional marginal is essential here.

#thm([Lemma 7.1.])[
  (Conditional gluing).  #emph[Let $lambda$ be a deterministic law on a finite set and $mu_omega$ a measurable environmental family of laws on another finite set. Let $U \, W$ be vector-valued functions on these sets with values in ${ 0 \, 1 }^m$. Suppose $p \, q_omega$ are laws of $\( e \, v \) in { 0 \, 1 } times { 0 \, 1 }^m$, with $q_omega$ measurable, $p$ deterministic, and $p \( e = 1 \) gt.eq c > 0$, such that 
$ cal(L)_lambda \( U \) prec.curly.eq p \( v in dot.op divides e = 1 \) \, #h(2em) q_omega \( v in dot.op divides e = 1 \) prec.curly.eq cal(L)_(mu_omega) \( W \) $

 whenever the second conditional law is defined. There is a measurable coupling $pi_omega$ of $lambda \, mu_omega$ satisfying 
$ bb(E)_(upright("env")) pi_omega { U prec.curly.eq.not W } lt.eq 6 / c bb(E)_(upright("env")) parallel p - q_omega parallel_("TV") . $

 In particular its first marginal is $lambda$ in every environment.]
] <lem:conditional-gluing>

#proof[
  Put $e_omega = parallel p - q_omega parallel_("TV")$. On $e_omega lt.eq c \/ 2$, $q_omega \( e = 1 \) gt.eq c \/ 2$, and subtraction of the conditional fractions gives
  $ parallel p \( v in dot.op divides e = 1 \) - q_omega \( v in dot.op divides e = 1 \) parallel_("TV") lt.eq 4 e_omega \/ c . $
  Couple these middle vectors maximally and glue to the two order couplings. Extend the outer vectors to complete samples using their conditional laws given $U \, W$. Order fails only when the middle vectors disagree. On $e_omega > c \/ 2$ use any coupling with the same prescribed marginals; this exceptional set has probability at most $2 bb(E)_(upright("env")) e_omega \/ c$. This proves the bound. All required couplings are measurable finite-dimensional kernels: enumerate the finitely many linear-programming bases of each coupling problem and select the first feasible basic solution. Subsequent conditional probabilities are explicit finite ratios, with a fixed arbitrary probability law on each zero-mass fiber. ◻
]

The environment has not been conditioned on $e = 1$. We condition spin laws separately at each fixed environment, including when deciding which environments require an arbitrary coupling.

#thm([Proposition 7.2.])[
  (Transfer of a finite strip family).  #emph[Fix $h > 0$ and a finite family of allowed plus strips in $A_h^(-)$. The pure critical Dobrushin sample in an ordinary mesh approximation of $A_h^(-)$ and the target sample in $D_n$ admit couplings conditional on the original environment such that every strip crossed by plus in the pure sample is crossed by plus in the virtually filled target, with annealed probability $1 - o \( 1 \)$. The pure marginal conditional on the original environment is its deterministic pure law. The analogous assertion holds for minus strips in $A_h^(+)$.]
] <prop:strip-transfer>

#proof[
  Embed the target and comparison domains, their incident bond layers, the two corridors, their reveal regions, and the strips in a torus chart with a fixed positive buffer. Use the target bond environment in that chart and independent bonds to complete the torus, whose period is chosen as in Proposition 10. Until the final averaging step include those extra bonds in the environment. Let $E_h$ be the event of the two required cutting crossings, and $V$ the vector of ordinary plus strip crossings in the torus. For the pure and quenched torus vector laws $p_n \, q_(n \, omega)$,
  #[#set math.equation(numbering: n => "(7.1)")
   $ p_n \( E_h \) gt.eq c_h > 0 \, #h(2em) bb(E)_(upright("env")) parallel p_n - q_(n \, omega) parallel_("TV") arrow.r 0 . $ <eq:strip-middle-laws>]
  The first assertion is the pure buffered RSW construction for two disjoint prescribed-color corridors [23] Section 2, Proposition “Pure buffered RSW consequences”; the second is Proposition 10, applied to the fixed finite vector $\( upright(bold(1))_(E_h) \, V \)$. No comparison of the entire torus spin configurations is asserted.
  We verify the two stochastic orders needed for Lemma 15. In either torus conditioned on $E_h$, inspect each corridor from its exterior side, stopping at its first crossing of the required color. The construction is [23] Section 6, Lemma “Reveals with a monochromatic facing boundary”. It can be described by querying the inspecting boundary and expanding the queried cluster of the opposite color. Every unqueried neighbor of that cluster is queried; queried vertices of the required color are not expanded. On success the facing boundary is the required monochromatic crossing, and nothing beyond it toward the center is queried. Planarity of the triangulation gives this facing crossing; the cap extensions ensure that every nearest-neighbor incidence across the explored side meets one of its pins. The two reveal regions are disjoint.
  For clarity, an adaptive stopped reveal has exactly the required conditional law. Its next queried site and its stopping decision are functions of the preceding answers. A completed transcript $\( v_1 \, s_1 \) \, dots.h \, \( v_k \, s_k \)$ therefore occurs precisely when those queried spins have those values. Conditioning on the transcript pins those spins and imposes no further restriction. Since the transcripts determine $E_h$, conditioning on $E_h$ adds nothing once the transcripts are specified.
  In the first comparison, the lower law is pure Dobrushin in $A_h^(-)$ and the upper law is the pure torus conditioned on $E_h$. In the union of the whole common nearest-neighbor free components containing the strip portions on the central side, the revealed plus path is an upper plus pin against a lower free site. It screens the comparison domain’s plus boundary. All remaining accessible domain boundary incidences are lower minus pins against upper free sites. At a meeting they are upper plus against lower minus. The minus reveal is outside $A_h^(-)$. Thus the pure-domain strip vector is below $p_n \( V in dot.op divides E_h \)$.
  In the second comparison, the lower law is the quenched torus conditioned on $E_h$ and the upper law is the target. Again use the whole common nearest-neighbor free components containing the interior strip portions on the central side. Now the minus path screens the target minus boundary, and the plus reveal is outside the target. With the upper entry first, the incidences are
  $ \( + \, upright("free") \) \, #h(2em) \( upright("free") \, - \) \, #h(2em) \( + \, - \) . $
  All bonds incident to common free vertices have identical couplings in the two laws being compared. Condition on the other spins. Each displayed pair orders the resulting boundary fields, regardless of the value of a free site in that pair. The nearest-neighbor ferromagnetic boundary comparison therefore orders the conditional spin laws; averaging over these other spins preserves the order. This argument takes place at fixed environment and uses only $K_e \( beta_(*) \) > 0$. It does not compare pure bond strengths with random bond strengths.
  The geometric incidence verification is precisely that of [22] Section 9, proof of “Quenched transfer of a finite strip family” and [23] Section 7, proof of “Fixed-geometry boundary squeeze”. A nearest-neighbor edge cannot cross a triangulated path in the interior of an edge; the caps prevent an incidence from escaping around a cut. The marked clearances established above exclude a wrongly signed accessible boundary pin. These statements also cover the last edge to an exterior pin and the boundary-vertex convention. Virtual plus values give the upper value on every portion of a strip outside $D_n$. We obtain, jointly for the entire finite list,
  $ cal(L) \( V_(A_h^(-)) \) prec.curly.eq p_n \( V in dot.op divides E_h \) \, #h(2em) q_(n \, omega) \( V in dot.op divides E_h \) prec.curly.eq cal(L)_omega \( V_(D_n) \) . $
  Lemma 15 and (7.1) give the result for vector laws and, by disintegration, for full spin samples. Average over the added torus bonds conditional on the original environment. The target marginal never used those bonds, and the pure marginal remains its fixed pure law. The sign-reversed construction is identical. ◻
]

=== 7.3 From strips to ordered traces <from-strips-to-ordered-traces>

To use a virtually filled crossing as a barrier, one needs exact noncrossing, rather than just two drawings at distance $O \( delta_n \)$. We give the boundary check from [23] Section 7, Lemma “Local drawing beside a signed strip”. For a fixed finite strip list, its boundary contacts lie on compact signed arcs separated from the marks. Near a plus contact every exterior nearest neighbor of a free site is already plus. Fill the other exterior vertices of incident faces with plus for drawing purposes. In the cell convention, a boundary dual vertex meets one, two adjacent, or three interior cells; two opposite cells alone would violate the Jordan condition. With one interior cell, the two nearest exterior neighbors already have the filling sign, so filling the opposite exterior corner changes no bond incident to that cell. With two adjacent or three interior cells, all exterior corners are already nearest neighbors. Triangular interpolation consequently preserves every target disagreement edge and every resolved local connection. With pinned boundary vertices the same assertion follows directly by interpolating the plaquettes with their given arc values.

Redraw the target in the faces meeting the strips and one adjacent layer using these zero segments. They glue at the same edge midpoints, preserve traversal order, and avoid all corresponding monochromatic paths. Plus and minus contact sets are separated, so the two fillings can be made simultaneously. The half-edge ends and neighborhoods of the marks are untouched. Denote the resulting drawing by $tilde(Gamma)_n$; then

#[#set math.equation(numbering: n => "(7.2)")
 $ d_(upright("curv")) \( tilde(Gamma)_n \, Gamma_n \) = O \( delta_n \) \, #h(2em) tilde(Gamma)_n upright(" is disjoint from every selected barrier") . $ <eq:barrier-redrawing>]

This changes the drawing only, including in a domain with narrow fjords: no exterior spin or incident interaction is removed.

We use the following pure geometric input from [22] Section 9, Lemma “Finite strips and limiting barriers”, proved in [23] Section 7, “From fixed strip tests to limiting barriers”. Given $eta_j arrow.b 0$, one can choose $h_j arrow.b 0$ and a deterministic finite list of allowed strips of each sign at displacement $h_j$ such that, outside pure probability $O \( eta_j \)$, a comparison chord selects a strip whose end gates it crosses with strict margins. Its omitted terminal pieces have diameter at most $eta_j$. The strip has cross-sections of diameter at most $eta_j$ following a simple prototype within $eta_j$ in curve distance of the remaining subarc. For sufficiently fine ordinary lattice approximations the same assertion holds, with errors $O \( eta_j \)$, and the signed side of the lattice interface supplies a monochromatic crossing of that strip.

Here are the relevant hypotheses and parameter order behind this input. The pure Dobrushin convergence to $"SLE"_3$ is used only in a fixed polygonal domain, with the full curve convergence supplied by [5,17]; see also the pure input statements in [22,23]. Uniform convergence of Jordan boundary parametrizations gives uniform convergence on the closed disk of the normalized conformal maps, by Radó’s domain-continuity theorem as stated and explained in [23] Section 7, beginning of “From fixed strip tests to limiting barriers”. In particular the hypotheses give a common boundary local-connectedness modulus. Uniform convergence transfers nearby points on the varying boundaries to nearby points of the limiting boundary; uniform continuity of the limiting inverse and of the parametrizations then controls a joining boundary subarc. The boundary crosscut proof of the conformal extension theorem upgrades kernel convergence using this modulus. Thus boundary fjords do not require an extra regularity assumption. Mapping a single disk $"SLE"_3$ by those maps shows that the continuum laws in $A_h^plus.minus$ converge in the oriented curve metric to $"SLE"_3 \( D \; a \, b \)$ as $h arrow.b 0$. Simplicity and avoidance of the boundary away from the two endpoints imply that compact middle subarcs stay inside $D$. In the enlarged domain, take the last and first hits of $rho = 1 + h \/ 3$ around an interior point and extend slightly at their ends. These hits are on the enlarged signed side, outside $D$; the extensions stay below $1 + h \/ 2$. Polygonal tolerances are chosen smaller than the gaps between these radial levels. This gives the allowed gates, and the omitted terminal diameters tend to zero. Thin rectangular neighborhoods of these simple subarcs can be chosen polygonal with strict traversal margins. Rational choices form a countable open cover of the favorable curves; a finite subcover in probability loses at most another $eta_j$. To see the signed crossing in a fine lattice approximation, follow the selected interface traversal through its successive interpolation triangles. Their plus-side vertices are connected by plus edges of those triangles, with common vertices or edges across each consecutive face. They form a plus walk at distance $O \( delta_n \)$ from the traversal. The positive long-side clearance keeps this walk inside the strip; the transverse crossing margins carry it beyond both end gates. Crop it at those gates and erase loops. Backtracking of the interface does not affect this existence argument. The entire finite list is fixed before Proposition 16 is applied. The sampled curve chooses its strip only afterwards.

Choose increasing deterministic integers $n_j gt.eq j$ so that for every $n gt.eq n_j$ all fixed-$j$ placements, pure approximation bounds, and both strip transfers have errors at most $O \( eta_j \)$, and the pure comparison laws are within $eta_j$ of their continuum laws in bounded-Lipschitz distance. Include the fixed-clearance exterior closures described below among these requirements. This absorbs the possibly small $c_(h_j)$ in the conditional coupling estimate. Set

#[#set math.equation(numbering: n => "(7.3)")
 $ j \( n \) = max { j lt.eq n : n_j lt.eq n } . $ <eq:interface-diagonal>]

Before $n_1$ make any choice. Then $j \( n \) arrow.r oo$. Let $L_n$ be the pure comparison chord in $A_(h_(j \( n \)))^(-)$ and $U_n$ the pure comparison chord in $A_(h_(j \( n \)))^(+)$, both oriented from the mark near $a$ to that near $b$. Glue their couplings over the common pair consisting of the original environment and target spin sample, by sampling the two conditional comparison kernels given that pair. Each comparison marginal conditional on the original environment remains its deterministic pure law. Both marginal laws converge to $"SLE"_3 \( D \; a \, b \)$, and with probability tending to one the target has both selected barriers.

All target traces eventually lie in a fixed compact planar disk. The space of its nonempty compact subsets is compact in Hausdorff distance. Together with tightness of $L_n \, U_n$ in the curve metric, this gives, along any further subsequence, a joint subsequential limit

$ \( "tr" Gamma_n \, L_n \, U_n \) arrow.r.double \( K \, L \, U \) . $

Here $K$ is connected, contains $a \, b$, and lies in $overline(D)$; these facts follow respectively from Hausdorff convergence, endpoint convergence, and the boundary winding argument. Both $L \, U$ are simple $"SLE"_3$ chords with interiors in $D$. For such a chord $C$, let $P \( C \) \, M \( C \)$ denote the open components of $D \\ C$ adjacent to $I_(+) \, I_(-)$, respectively.

The barriers imply

#[#set math.equation(numbering: n => "(7.4)")
 $ K subset overline(M \( L \)) ∩ overline(P \( U \)) \, $ <eq:trace-squeeze>]

where closures are in $overline(D)$. We spell out why this includes the open boundary arcs, following [23] Section 7, “Forbidden sides, order, and identification of the trace”. Represent the subsequential convergence almost surely and, after a further subsequence, make barrier failures summable. Erase loops in a successful plus crossing, join its ends to the gate centers within the exterior gate neighborhoods, and close it by radial paths in $Psi$ coordinates to a fixed circle $rho = rho_(*) > 1$, followed by its plus-side circular arc. The added paths have positive clearance from $overline(D)$ at each fixed $j$; the thresholds $n_j$ ensure that they are outside $D_n$. Both target marks are on the zero-winding side: their outward escape paths lie beyond the ends of the extended plus arc. Exact disjointness in (7.2) keeps the entire target on that side.

The closed path need not be simple; its winding number is constant along any curve disjoint from it. Every crossing between the strip gates is homotopic within the rectangular strip, relative to its gates, to its prototype. Thus backtracking of that crossing cannot alter its winding about points outside the strip. Vanishing strip widths, prototype errors, and terminal diameters make this winding equal eventually to the nonzero winding of $L$ closed on the plus side, on each compact subset of $P \( L \)$. The fixed outer circular arc remains a positive distance beyond each compact subarc of $I_(+)$, and the connectors tend to the two endpoint connectors. The same nonzero winding therefore holds in a neighborhood of every point of $I_(+)$ other than $a \, b$. The target avoids all these neighborhoods. Its limit lies in $overline(M \( L \))$, and the minus barrier gives the other inclusion in (7.4).

#thm([Lemma 7.3.])[
  (Ordered chords with equal laws).  #emph[Let $L \, U$ be random simple chords from $a$ to $b$ with interiors in $D$, and let $K subset overline(D)$ be random, compact, connected, and contain $a \, b$. If (7.4) holds, then $P \( L \) subset P \( U \)$ almost surely. If $L \, U$ have the same trace law, then $K = L = U$ as compact sets almost surely.]
] <lem:ordered-chords>

#proof[
  This elementary planar argument is [23] Section 7, Lemma “Ordered chords with equal laws”. If $P \( L \) ∩ M \( U \)$ were nonempty, a point in the intersection could be joined inside these side domains to the two opposite open boundary arcs. Removing loops gives a crosscut between those arcs disjoint from $K$, by (7.4). Its endpoints alternate with $a \, b$, so it separates $a$ from $b$, contradicting connectedness. Thus $P \( L \) subset P \( U \) union U$. An interior point of $U$ cannot lie in the open set $P \( L \)$, because every neighborhood of that point meets $M \( U \)$. Hence $P \( L \) subset P \( U \)$.
  Map to the disk by the fixed Schoenflies map and take the ordinary areas of the two plus sides. These bounded random variables are ordered and have the same distribution, so their difference is zero almost surely. A proper inclusion of the side domains would give positive area difference: a point in $P \( U \) \\ P \( L \)$ is either in $M \( L \)$, or on $L$, in which case its neighborhood in $P \( U \)$ meets $M \( L \)$. The difference therefore contains a nonempty open set. The plus sides, and hence their interior boundary chords, are equal. Finally (7.4) puts $K$ on that chord. Its inverse parametrization sends $K$ to a connected subset of $\[ 0 \, 1 \]$ containing both endpoints, necessarily all of $\[ 0 \, 1 \]$. No zero-area assertion about the chords was needed. ◻
]

Consequently every joint trace limit satisfies $K = L = U$. It remains to rule out repeated forward and backward traversal near this trace.

=== 7.4 Passages control traversal order <passages-control-traversal-order>

The passage criterion below is proved in [23] Section 7, Lemma “Progress coordinates and the full curve metric”; we include its proof to make the passage from compact sets to oriented curves explicit. It uses the interior estimate of Corollary 11. This is a concrete version of the role of multiple-crossing bounds in curve compactness arguments [1,17].

#thm([Lemma 7.4.])[
  (Progress along a simple limiting chord).  #emph[Suppose $g_n$ are simple oriented curves, their endpoints tend to $a \, b$, and their traces converge in Hausdorff distance to that of an injective continuous chord $G : \[ 0 \, 1 \] arrow.r overline(D)$ with endpoints $a \, b$ and $G \( \( 0 \, 1 \) \) subset D$. There are continuous $u_n : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$, with endpoint values tending to $0 \, 1$, such that 
$ e_n := sup_t \| g_n \( t \) - G \( u_n \( t \) \) \| arrow.r 0 . $

 If $B_n := sup_(s < t) \( u_n \( s \) - u_n \( t \) \) arrow.r 0$, then $d_(upright("curv")) \( g_n \, G \) arrow.r 0$. Conversely, for each $0 < eta < 1$, a drop $B_n gt.eq eta$ forces six disjoint passages from radius $r$ to radius $R_eta > 0$ about a point of $G \( \[ eta \/ 2 \, 1 - eta \/ 2 \] \)$, for every $e_n < r < R_eta$ and all sufficiently large $n$. Here $R_eta$ depends only on $G \, eta$.]
  #emph[The corresponding convergence in probability holds for random coupled curves if trace and endpoint convergence hold in probability and, for every deterministic $F subset.double D$ and all sufficiently small fixed $R > 0$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ lim_(r arrow.b 0) limsup_n bb(P) { g_n upright(" has four passages from ") r upright(" to ") R upright(" about some point of ") F } = 0 . $ <eq:progress-passage>]

 Passages are counted on disjoint open parameter intervals.]
] <lem:progress>

#proof[
  Extend the continuous inverse coordinate $G^(- 1)$ from its compact trace continuously to an ambient neighborhood, with values in $\[ 0 \, 1 \]$, and compose it with $g_n$. Uniform continuity gives the assertions about $u_n \, e_n$ and their endpoints. If $B_n arrow.r 0$, the running maximum $m_n \( t \) = max_(s lt.eq t) u_n \( s \)$ satisfies $0 lt.eq m_n \( t \) - u_n \( t \) lt.eq B_n$. Normalize its endpoint values to $0 \, 1$, obtaining a nondecreasing continuous $v_n$ with $parallel v_n - u_n parallel_oo arrow.r 0$. For any $kappa_n arrow.b 0$ with $kappa_n > 0$, the function $h_n \( t \) = \( 1 - kappa_n \) v_n \( t \) + kappa_n t$ is an increasing homeomorphism of $\[ 0 \, 1 \]$. If $omega_G$ is the modulus of continuity of $G$, then
  $ d_(upright("curv")) \( g_n \, G \) lt.eq e_n + omega_G \( parallel h_n - u_n parallel_oo \) arrow.r 0 . $
  If instead $u_n \( s \) - u_n \( t \) gt.eq eta$ for some $s < t$, put $c_n = \( u_n \( s \) + u_n \( t \) \) \/ 2 in \[ eta \/ 2 \, 1 - eta \/ 2 \]$. Once endpoint coordinate errors are less than $eta \/ 4$, each of $\[ 0 \, s \] \, \[ s \, t \] \, \[ t \, 1 \]$ has endpoints on opposite sides of $c_n$, at coordinate distance at least $eta \/ 4$. Each interval contains a visit to $c_n$. Injectivity and compactness give
  $ q_eta = min_(\| v - w \| gt.eq eta \/ 4) \| G \( v \) - G \( w \) \| > 0 \, #h(2em) d_eta = "dist" \( G \( \[ eta \/ 2 \, 1 - eta \/ 2 \] \) \, partial D \) > 0 . $
  Choose $R_eta < min \( q_eta \, d_eta \) \/ 4$. For $e_n < R_eta$, the four anchor points at parameters $0 \, s \, t \, 1$ are outside the radius-$R_eta$ disk about $G \( c_n \)$, whereas the three level visits are within $e_n$ of its center. Cropping the incoming and outgoing pieces at the inner and outer hits gives two annular passages in each interval. Their open parameter intervals are disjoint, and simplicity makes their spatial interiors disjoint. Thus there are six passages, in particular four. Fixed-factor crops give the same conclusion for square annuli if those are used in Corollary 11.
  For the random assertion, use a measurable continuous representative of $G$. Measurable progress coordinates are obtained without choosing a random extension: write $Delta_n = d_H \( "tr" g_n \, "tr" G \)$, $z_n = 2 Delta_n + 1 \/ n$, and set
  $ u_n \( t \) = frac(integral_0^1 v thin \( z_n - \| g_n \( t \) - G \( v \) \| \)_(+) thin upright(d) v, integral_0^1 \( z_n - \| g_n \( t \) - G \( v \) \| \)_(+) thin upright(d) v) . $
  The denominator is positive, and this is continuous in $t$ and jointly measurable. Put $iota_G \( r \) = sup { \| v - w \| : \| G \( v \) - G \( w \) \| lt.eq r }$, which tends to zero with $r$. Parameters receiving positive weight have diameter at most $iota_G \( 2 z_n \)$, so
  $ e_n lt.eq z_n + omega_G \( iota_G \( 2 z_n \) \) arrow.r 0 $
  in probability; endpoint coordinate errors also tend to zero. These statements follow almost surely along any subsequence on which the trace and endpoint errors converge almost surely, and hence in probability for the full sequence.
  Fix $eta > 0$ and an exceptional probability $zeta > 0$. Choose deterministic $q \, d > 0$ with $bb(P) \( q_eta < q upright(" or ") d_eta < d \) < zeta$. The random centers then lie in the deterministic compact set $F_d = { z in overline(D) : "dist" \( z \, partial D \) gt.eq d }$. Fix a deterministic $R < min \( q \, d \) \/ 8$ small enough for (7.5). For every fixed $0 < r < R$, the six-passage argument bounds
  $ limsup_n bb(P) \( B_n gt.eq eta \) lt.eq zeta + limsup_n bb(P) { upright("four passages about some point of ") F_d upright(" from ") r upright(" to ") R } . $
  Let $r arrow.b 0$ and then $zeta arrow.b 0$. Thus $B_n arrow.r 0$ in probability. Localizing the random continuity modulus $omega_G$ outside another event of probability $zeta$ and using the running-maximum construction gives the asserted curve convergence. All compact sets and radii used in the passage estimate are deterministic before taking the mesh limit. ◻
]

=== 7.5 Completion of the main theorem <completion-of-the-main-theorem>

#proof[
  The tuning, matching, and criticality arguments give $beta_(*) = beta_c^rho \( epsilon \)$ for all sufficiently small fixed $epsilon > 0$. The tuning estimate $beta_(*) = K_0 + O_rho \( epsilon^2 \)$ also gives the critical-temperature estimate in the theorem. Choose $epsilon_0 \( rho \)$ once to meet their smallness conditions and the fixed-shape crossing bootstrap. These choices precede every final domain, strip family, and approximation sequence.
  Begin with any subsequence of the deterministic approximations, and pass further to fix the signed arc designation. The slow diagonal (7.3) constructs couplings of the target and two comparison chords satisfying
  $ cal(L) \( Gamma_n divides omega \) = Q_(n \, omega) \, #h(2em) cal(L) \( L_n divides omega \) = R_n \, #h(2em) R_n arrow.r.double "SLE"_3 \( D \; a \, b \) \, $
  where $R_n$ is deterministic. Every further subsequence has a joint trace and comparison-curve limit, and the barrier argument and Lemma 17 identify it as $\( L \, L \, L \)$ in traces.
  We explain the probabilistic passage to curves without assuming target curve tightness. The space of continuous oriented curves modulo zero uniform reparametrization distance is Polish. Rational polygonal paths are dense. For completeness, select a Cauchy subsequence with successive distances less than $2^(- j)$, choose parametrized representatives $g_j$, and put $f_1 = g_1$. Given a fixed representative $f_j$, choose increasing homeomorphisms $alpha \, beta$ such that $parallel f_j compose alpha - g_(j + 1) compose beta parallel_oo < 2^(1 - j)$, and put $f_(j + 1) = g_(j + 1) compose beta compose alpha^(- 1)$. Then $parallel f_(j + 1) - f_j parallel_oo < 2^(1 - j)$. The representatives converge uniformly to a continuous path $f$, and $d_(upright("curv")) \( f_j \, f \) lt.eq parallel f_j - f parallel_oo arrow.r 0$; the original Cauchy sequence has the same limit. Pauses are permitted in this ambient continuous-curve space and removed by the zero-distance identification when appropriate. Thus the joint trace and comparison convergence admits an almost surely convergent representation. Lift that representation to target paths by their original conditional laws given the trace and the two comparison curves. At each mesh the target has finite configuration space, so these kernels exist directly. The lift preserves every joint law at that mesh, and in particular every annealed target passage bound.
  Corollary 11 gives (7.5) for these target curves: interior charts have fixed free buffers, arbitrary exterior spins are allowed, and target passages are bounded by the local event that any resolved contours supply the required passages. Local redrawings are absorbed by fixed-factor radius crops. Lemma 18 now gives $d_(upright("curv")) \( Gamma_n \, L \) arrow.r 0$ in probability in the representation. Since also $L_n arrow.r L$ in curve distance, $d_(upright("curv")) \( Gamma_n \, L_n \) arrow.r 0$ there and hence in the original couplings. Every further subsequence permits this argument, so it holds along the chosen sequence. In particular
  #[#set math.equation(numbering: n => "(7.6)")
   $ bb(E) min { 1 \, d_(upright("curv")) \( Gamma_n \, L_n \) } arrow.r 0 . $ <eq:quenched-coupling-error>]
  Write $macron(d) = min { 1 \, d_(upright("curv")) }$. For any test function in the bounded-Lipschitz class for $macron(d)$, the conditional coupling and its two correct marginals give
  $ lr(|integral F thin upright(d) Q_(n \, omega) - integral F thin upright(d) R_n|) lt.eq bb(E) #scale(x: 120%, y: 120%)[\[] macron(d) \( Gamma_n \, L_n \) divides omega #scale(x: 120%, y: 120%)[\]] . $
  Taking the supremum over that class and then environmental expectation,
  #[#set math.equation(numbering: n => "(7.7)")
   $ bb(E)_(upright("env")) d_(upright("BL")) \( Q_(n \, omega) \, R_n \) lt.eq bb(E) macron(d) \( Gamma_n \, L_n \) arrow.r 0 . $ <eq:quenched-bl>]
  The conditional pure marginal is essential in this step. Measurability holds also for a nonatomic bond law: at each mesh $Q_(n \, omega)$ has a fixed finite curve support and measurable probabilities, and its distance to a fixed law is a continuous function of these probabilities. Added torus bonds and auxiliary coupling variables have already been integrated out conditional on the original environment.
  The deterministic laws $R_n$ converge in bounded-Lipschitz distance to the stated SLE law. Equation (7.7), the triangle inequality, and Markov’s inequality prove convergence in environmental probability on the chosen subsequence. If it failed for the original sequence, a subsequence on which the failure probability stayed positive would contradict this construction. Finally restore the prescribed lattice drawing and half-edges; their matched displacement is $O \( delta_n \)$, with the same orientation. This proves the theorem in the required uniform oriented-curve metric. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Aizenman and A.~Burchard, #emph[Hölder regularity and dimension bounds for random curves], Duke Math. J. #strong[99] (1999), 419--453. #link("https://doi.org/10.1215/S0012-7094-99-09914-3")[doi:10.1215/S0012-7094-99-09914-3].]
#bibitem([2])[E.~Avérous and R.~Mahfouf, #emph[The near-critical random bond FK-percolation model], preprint (2025), #link("https://arxiv.org/abs/2509.08938v1")[arXiv:2509.08938v1].]
#bibitem([3])[A.~I.~Bugrij and V.~N.~Shadura, #emph[Duality of a two-dimensional nonhomogeneous Ising model on a finite lattice], Phys. Rev. B #strong[55] (1997), 11045--11049. #link("https://doi.org/10.1103/PhysRevB.55.11045")[doi:10.1103/PhysRevB.55.11045]. Equation locators refer to the preprint #emph[Duality of the 2D Nonhomogeneous Ising Model on the Torus], #link("https://arxiv.org/abs/hep-th/9703037v1")[arXiv:hep-th/9703037v1].]
#bibitem([4])[L.~Chayes and K.~Shtengel, #emph[Critical behavior for 2D uniform and disordered ferromagnets at self-dual points], Comm. Math. Phys. #strong[204] (1999), 353--366. #link("https://doi.org/10.1007/s002200050649")[doi:10.1007/s002200050649]. Theorem locators refer to #link("https://arxiv.org/abs/cond-mat/9811203v1")[arXiv:cond-mat/9811203v1].]
#bibitem([5])[D.~Chelkak, H.~Duminil-Copin, C.~Hongler, A.~Kemppainen, and S.~Smirnov, #emph[Convergence of Ising interfaces to Schramm's SLE curves], C. R. Math. Acad. Sci. Paris #strong[352] (2014), 157--161. #link("https://doi.org/10.1016/j.crma.2013.12.002")[doi:10.1016/j.crma.2013.12.002]. Theorem locators refer to #link("https://arxiv.org/abs/1312.0533v2")[arXiv:1312.0533v2].]
#bibitem([6])[D.~Chelkak and S.~Smirnov, #emph[Universality in the 2D Ising model and conformal invariance of fermionic observables], Invent. Math. #strong[189] (2012), 515--580. #link("https://doi.org/10.1007/s00222-011-0371-2")[doi:10.1007/s00222-011-0371-2].]
#bibitem([7])[Vik.~S.~Dotsenko and Vl.~S.~Dotsenko, #emph[Critical behaviour of the 2D Ising model with impurity bonds], J. Phys. C: Solid State Phys. #strong[15] (1982), 495--507. #link("https://doi.org/10.1088/0022-3719/15/3/015")[doi:10.1088/0022-3719/15/3/015].]
#bibitem([8])[Vik.~S.~Dotsenko and Vl.~S.~Dotsenko, #emph[Critical behaviour of the phase transition in the 2D Ising model with impurities], Adv. Phys. #strong[32] (1983), 129--172. #link("https://doi.org/10.1080/00018738300101541")[doi:10.1080/00018738300101541].]
#bibitem([9])[H.~Duminil-Copin, A.~Raoufi, and V.~Tassion, #emph[Sharp phase transition for the random-cluster and Potts models via decision trees], Ann. of Math. (2) #strong[189] (2019), 75--99. #link("https://doi.org/10.4007/annals.2019.189.1.2")[doi:10.4007/annals.2019.189.1.2]. Locators refer to #link("https://arxiv.org/abs/1705.03104v2")[arXiv:1705.03104v2].]
#bibitem([10])[R.~G.~Edwards and A.~D.~Sokal, #emph[Generalization of the Fortuin--Kasteleyn--Swendsen--Wang representation and Monte Carlo algorithm], Phys. Rev. D #strong[38] (1988), 2009--2012. #link("https://doi.org/10.1103/PhysRevD.38.2009")[doi:10.1103/PhysRevD.38.2009].]
#bibitem([11])[C.~M.~Fortuin and P.~W.~Kasteleyn, #emph[On the random-cluster model. I. Introduction and relation to other models], Physica #strong[57] (1972), 536--564. #link("https://doi.org/10.1016/0031-8914(72)90045-6")[doi:10.1016/0031-8914(72)90045-6].]
#bibitem([12])[C.~M.~Fortuin, P.~W.~Kasteleyn, and J.~Ginibre, #emph[Correlation inequalities on some partially ordered sets], Comm. Math. Phys. #strong[22] (1971), 89--103. #link("https://doi.org/10.1007/BF01651330")[doi:10.1007/BF01651330].]
#bibitem([13])[A.~Giuliani, R.~L.~Greenblatt, and V.~Mastropietro, #emph[The scaling limit of the energy correlations in non-integrable Ising models], J. Math. Phys. #strong[53] (2012), 095214. #link("https://doi.org/10.1063/1.4745910")[doi:10.1063/1.4745910]. Theorem locators refer to #link("https://arxiv.org/abs/1204.4040v1")[arXiv:1204.4040v1].]
#bibitem([14])[R.~L.~Greenblatt and E.~Peltola, #emph[On the spin interface distribution for non-integrable variants of the two-dimensional Ising model], preprint (2024), #link("https://arxiv.org/abs/2404.12375v3")[arXiv:2404.12375v3], October 17, 2024.]
#bibitem([15])[A.~B.~Harris, #emph[Effect of random defects on the critical behaviour of Ising models], J. Phys. C: Solid State Phys. #strong[7] (1974), 1671--1692. #link("https://doi.org/10.1088/0022-3719/7/9/009")[doi:10.1088/0022-3719/7/9/009].]
#bibitem([16])[G.~Jug, #emph[Critical singularities of the random two-dimensional Ising model], Phys. Rev. B #strong[27] (1983), 4518(R). #link("https://doi.org/10.1103/PhysRevB.27.4518")[doi:10.1103/PhysRevB.27.4518].]
#bibitem([17])[A.~Kemppainen and S.~Smirnov, #emph[Random curves, scaling limits and Loewner evolutions], Ann. Probab. #strong[45] (2017), 698--779. #link("https://doi.org/10.1214/15-AOP1074")[doi:10.1214/15-AOP1074].]
#bibitem([18])[H.~A.~Kramers and G.~H.~Wannier, #emph[Statistics of the two-dimensional ferromagnet. Part I], Phys. Rev. #strong[60] (1941), 252--262. #link("https://doi.org/10.1103/PhysRev.60.252")[doi:10.1103/PhysRev.60.252].]
#bibitem([19])[A.~W.~W.~Ludwig, #emph[Critical behavior of the two-dimensional random $q$-state Potts model by expansion in $\( q - 2 \)$], Nucl. Phys. B #strong[285] (1987), 97--142. #link("https://doi.org/10.1016/0550-3213(87)90330-0")[doi:10.1016/0550-3213(87)90330-0].]
#bibitem([20])[R.~Mahfouf, #emph[The near critical random bond Ising model via embedding deformation], preprint (2025), #link("https://arxiv.org/abs/2509.08928v1")[arXiv:2509.08928v1].]
#bibitem([21])[R.~O'Donnell, M.~Saks, O.~Schramm, and R.~A.~Servedio, #emph[Every decision tree has an influential variable], in Proceedings of the 46th Annual IEEE Symposium on Foundations of Computer Science, IEEE (2005), 31--39. #link("https://doi.org/10.1109/SFCS.2005.34")[doi:10.1109/SFCS.2005.34].]
#bibitem([22])[OpenAI, #emph[Quenched $upright(S L E)_3$ Universality for the Weak Random-Bond Ising Model], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Quenched-SLE3-Universality-for-the-Weak-Random-Bond-Ising-Model-October-5-2026/quenched-sle3-weak-random-bond-ising.pdf")[OAI:Quenched-SLE3-Universality-for-the-Weak-Random-Bond-Ising-Model-October-5-2026], 2026.]
#bibitem([23])[OpenAI, #emph[$upright(S L E)_3$ universality for weak finite-range Ising interactions], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/SLE3-universality-for-weak-finite-range-Ising-interactions-September-23-2026/paper.pdf")[OAI:SLE3-universality-for-weak-finite-range-Ising-interactions-September-23-2026], 2026.]
#bibitem([24])[O.~Schramm, #emph[Scaling limits of loop-erased random walks and uniform spanning trees], Israel J. Math. #strong[118] (2000), 221--288. #link("https://doi.org/10.1007/BF02803524")[doi:10.1007/BF02803524].]
#bibitem([25])[B.~N.~Shalaev, #emph[Correlation function and susceptibility of the two-dimensional Ising model with impurities], Sov. Phys. Solid State #strong[26] (1984), 1811--1813; Russian original, Fiz. Tverd. Tela #strong[26] (1984), 3002--3005.]
#bibitem([26])[R.~Shankar, #emph[Exact critical behavior of a random bond two-dimensional Ising model], Phys. Rev. Lett. #strong[58] (1987), 2466--2469; erratum, #strong[59] (1987), 380. #link("https://doi.org/10.1103/PhysRevLett.58.2466")[doi:10.1103/PhysRevLett.58.2466]\; #link("https://doi.org/10.1103/PhysRevLett.59.380.2")[doi:10.1103/PhysRevLett.59.380.2].]
#bibitem([27])[S.~Sheffield and N.~Sun, #emph[Strong path convergence from Loewner driving function convergence], Ann. Probab. #strong[40] (2012), 578--610. #link("https://doi.org/10.1214/10-AOP627")[doi:10.1214/10-AOP627].]
#bibitem([28])[S.~Smirnov, #emph[Conformal invariance in random cluster models. I. Holomorphic fermions in the Ising model], Ann. of Math. (2) #strong[172] (2010), 1435--1467. #link("https://doi.org/10.4007/annals.2010.172.1435")[doi:10.4007/annals.2010.172.1435].]


