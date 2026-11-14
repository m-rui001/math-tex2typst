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

#align(center)[#text(size: 16pt, weight: "bold")[Quenched $upright(S L E)_3$ Universality for the \
Weak Random-Bond Ising Model]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

At the critical point of the planar Ising model, a boundary between plus and minus spins has a conformally invariant scaling limit. Independent random variations of the bond strengths break the spatial symmetries in every typical realization. The question considered here is whether, when the variations are sufficiently weak, the interface in a fixed environment still approaches the same deterministic probability law.

We prove this for symmetric two-valued ferromagnetic bonds. The disorder strength is held fixed while the mesh tends to zero. The limiting object is the full oriented chordal curve, and the temperature is specified by the onset of spontaneous magnetization.

=== 1.1 The random ferromagnet and its critical point <the-random-ferromagnet-and-its-critical-point>

Let $E^bullet$ be the set of unordered nearest-neighbor edges of $bb(Z)^2$, each counted once. On a probability space $\( Omega_(upright("env")) \, bb(P)_(upright("env")) \)$, let $\( xi_e \)_(e in E^bullet)$ be independent with

$ bb(P)_(upright("env")) \( xi_e = 1 \) = bb(P)_(upright("env")) \( xi_e = - 1 \) = 1 / 2 . $

Fix $0 < epsilon.alt < 1$ and set

#[#set math.equation(numbering: n => "(1.1)")
 $ J_e \( omega \) = 1 + epsilon.alt xi_e \( omega \) . $ <intro:bonds>]

The same infinite environment is used for all finite volumes. There is no magnetic field. For $Lambda_m = { - m \, dots.h \, m }^2$, extend spins by $+ 1$ outside $Lambda_m$ and define

$ H_(m \, omega)^(+) \( sigma \) = - sum_(e = { x \, y } in E^bullet : med e ∩ Lambda_m eq.not diameter) J_e \( omega \) sigma_x sigma_y . $

Write $chevron.l dot.op chevron.r_(m \, beta \, omega)^(+)$ for the normalized Gibbs expectation with weight $e^(- beta H_(m \, omega)^(+))$. Put

#[#set math.equation(numbering: n => "(1.2)")
 $ m_epsilon.alt \( beta \) = bb(E)_(upright("env")) #h(-0.16667em) [lim_(m arrow.r oo) chevron.l sigma_0 chevron.r_(m \, beta \, omega)^(+)] \, #h(2em) beta_c \( epsilon.alt \) = inf { beta gt.eq 0 : m_epsilon.alt \( beta \) > 0 } . $ <intro:critical-definition>]

Ferromagnetic monotonicity gives the limit and, with $K_0 = 1 / 2 log \( 1 + sqrt(2) \)$,

#[#set math.equation(numbering: n => "(1.3)")
 $ 0 < frac(K_0, 1 + epsilon.alt) lt.eq beta_c \( epsilon.alt \) lt.eq frac(K_0, 1 - epsilon.alt) < oo . $ <intro:critical-bounds>]

The Gibbs normalization in this definition, and in every finite-volume law below, is taken separately for each environment.

=== 1.2 Domains and interfaces <domains-and-interfaces>

The dual lattice has vertex set $F = bb(Z)^2 + \( 1 / 2 \, 1 / 2 \)$ and nearest-neighbor edge set $E$. For $e in E$, write $e^bullet$ for the crossing primal edge. If $V subset bb(Z)^2$ is finite, set

$ Q_V = union.big_(v in V) #scale(x: 120%, y: 120%)[\(] v + \[ - 1 / 2 \, 1 / 2 \]^2 #scale(x: 120%, y: 120%)[\)] \, #h(2em) D_V = "int" Q_V . $

We require $Q_V$ to be the closure of a Jordan domain. Let $E_V$ be the dual edges crossing primal bonds with at least one endpoint in $V$. Choose distinct marks $f_(upright("in")) \, f_(upright("out")) in F ∩ partial D_V$. At each mark choose an exterior stub: a dual edge outside $E_V$ joining that mark to a vertex outside $Q_V$. Denote these stubs by $e_(upright("in"))$ and $e_(upright("out"))$.

For an edge set $A$, let $d_f \( A \)$ be its degree at $f$. The permitted interior contour sets are

#[#set math.equation(numbering: n => "(1.4)")
 $ cal(P)_V = {P subset E_V : d_f \( P \) + upright(bold(1))_({ f = f_(upright("in")) }) + upright(bold(1))_({ f = f_(upright("out")) }) upright(" is even for every ") f in F} . $ <intro:contour-space>]

Require $cal(P)_V eq.not diameter$ and the existence of a finite completion $P_o subset E \\ E_V$ containing both stubs, with the same two odd-degree marks and even degree elsewhere. These choices will be called #emph[admissible lattice data]. The completion is fixed deterministically. For $P in cal(P)_V$, the union $P union P_o$ is even and determines spins equal to plus far away, changing sign across its edges. The resulting exterior spins are independent of $P$ and give opposite boundary signs on the two marked arcs.

For a fixed environment, at inverse temperature $beta$, use the law

#[#set math.equation(numbering: n => "(1.5)")
 $ mu_(V \, beta \, epsilon.alt \, omega) \( P \) = 1 / Z_(V \, beta \, epsilon.alt \, omega) exp (- 2 beta sum_(e in P) J_(e^bullet) \( omega \)) \, #h(2em) P in cal(P)_V \, $ <intro:quenched-contours>]

where the denominator is the sum of the numerator over $cal(P)_V$. In particular, the weights include bonds crossing the boundary of $V$.

#thm([Lemma 1.1.])[
  (Contour and spin laws).  #emph[The law (1.5) is the contour image of the nearest-neighbor Ising law on $V$ with the exterior spins determined by $P_o$. It is independent of the choice of completion $P_o$.]
] <intro:contour-spin>

#proof[
  An even finite dual edge set determines a unique spin configuration equal to plus far away: the sign at a primal vertex is the parity of crossings of any path from that vertex to infinity. Evenness makes this parity independent of the path. Restricting the contour to $E_V$ gives a bijection between the compatible spin configurations on $V$ and $cal(P)_V$. Across a primal bond, the spin product is $- 1$ exactly when its crossing dual edge belongs to the contour. Thus
  $ exp (beta sum_({ x \, y } : { x \, y } ∩ V eq.not diameter) J_({ x \, y }) sigma_x sigma_y) = exp (beta sum_(e in E_V) J_(e^bullet)) exp (- 2 beta sum_(e in P) J_(e^bullet)) . $
  The first factor is constant over $P$. Every exterior-only energy is constant as well. Normalization therefore gives (1.5), whose formula does not involve $P_o$. ◻
]

Add to $P$ the half of each stub from its mark to its midpoint. At degree two join the two occupied edges. At degree four, pair north with east and south with west, also at marked vertices. Draw these pairings disjointly in disks of radius less than $1 \/ 10$ about the dual vertices, using any fixed local drawing. The resolved component from the incoming stub midpoint to the outgoing midpoint is a simple oriented curve, denoted $gamma \( P \)$.

=== 1.3 The limiting law <the-limiting-law>

For continuous oriented curves in $bb(C)$, represented on $\[ 0 \, 1 \]$, let

#[#set math.equation(numbering: n => "(1.6)")
 $ d_(upright("curv")) \( gamma \, eta \) = inf_(alpha \, rho) sup_(t in \[ 0 \, 1 \]) \| gamma \( alpha \( t \) \) - eta \( rho \( t \) \) \| \, #h(2em) macron(d) = min { 1 \, d_(upright("curv")) } \, $ <intro:curve-distance>]

where $alpha \, rho$ run over increasing homeomorphisms of $\[ 0 \, 1 \]$; curves at distance zero are identified. For probability measures $nu \, nu'$ on this curve space define

#[#set math.equation(numbering: n => "(1.7)")
 $ d_(upright("BL")) \( nu \, nu' \) = sup_(\| F \| lt.eq 1\
\| F \( gamma \) - F \( eta \) \| lt.eq macron(d) \( gamma \, eta \)) lr(|integral F thin upright(d) nu - integral F thin upright(d) nu'|) . $ <intro:BL-distance>]

Let $D$ be a bounded Jordan domain and $a \, b$ distinct boundary points. Chordal $"SLE"_3 \( D \; a \, b \)$ is the law obtained by conformally mapping the upper-half-plane Loewner trace

$ partial_t g_t \( z \) = frac(2, g_t \( z \) - sqrt(3) B_t) \, #h(2em) g_0 \( z \) = z \, $

to $D$, with $0$ mapped to $a$ and $oo$ to $b$; $B_t$ is standard real Brownian motion. We retain the oriented curve modulo reparametrization.

#thm([Theorem 1.2.])[
  (Quenched interface universality).  #emph[There is $epsilon.alt_0 > 0$ such that the following holds for every fixed $epsilon.alt in \( 0 \, epsilon.alt_0 \)$. Let $D$ be a bounded Jordan domain and $a \, b in partial D$ distinct. Take any deterministic sequence of admissible lattice data with meshes $delta_n arrow.b 0$ and boundary homeomorphisms 
$ phi.alt_n : partial D arrow.r partial \( delta_n D_(V_n) \) \, #h(2em) sup_(z in partial D) \| phi.alt_n \( z \) - z \| arrow.r 0 \, $

 such that $phi.alt_n \( a \) = delta_n f_(upright("in") \, n)$ and $phi.alt_n \( b \) = delta_n f_(upright("out") \, n)$. Let $Q_(n \, omega)$ be the law of $delta_n gamma \( P \)$ under $mu_(V_n \, beta_c \( epsilon.alt \) \, epsilon.alt \, omega)$. Then for every $eta > 0$, 
#[#set math.equation(numbering: n => "(1.8)")
 $ bb(P)_(upright("env")) #h(-0.16667em) [d_(upright("BL")) #scale(x: 120%, y: 120%)[\(] Q_(n \, omega) \, "SLE"_3 \( D \; a \, b \) #scale(x: 120%, y: 120%)[\)] > eta] arrow.r 0 . $ <intro:main-convergence>]

]
] <thm:main>

The domain approximations are independent of the environment, and the convergence uses their original Euclidean embedding. The strength $epsilon.alt$ is fixed throughout the limit. The proof also identifies the critical point: for sufficiently small $epsilon.alt$,

#[#set math.equation(numbering: n => "(1.9)")
 $ #scale(x: 120%, y: 120%)[\(] e^(2 beta_c \( epsilon.alt \) \( 1 + epsilon.alt \)) - 1 #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] e^(2 beta_c \( epsilon.alt \) \( 1 - epsilon.alt \)) - 1 #scale(x: 120%, y: 120%)[\)] = 2 . $ <intro:selfdual-beta>]

This identity is proved through magnetization and random-cluster crossing estimates in Section 8.

=== 1.4 History and related work <history-and-related-work>

Harris’s criterion gives a basic test for the relevance of quenched disorder [16]. It leaves the marginal case of the two-dimensional Ising model undecided. The renormalization-group analysis of Dotsenko and Dotsenko [8,9] predicted a double-logarithmic specific-heat singularity. Subsequent work of Shalaev, Shankar, and Ludwig [24,25,19] developed the picture of unchanged leading critical exponents together with logarithmic corrections, revising the earlier prediction for spin correlations. This is the physical setting of marginal irrelevance: weak bond disorder decreases under coarse graining, but only slowly enough that its cumulative effect can remain visible in logarithmic factors. These calculations concern thermodynamic quantities and correlations; a quenched law for an entire interface requires additional geometric control.

For the homogeneous critical model, the conformal description is rigorous. Schramm introduced stochastic Loewner evolution, which now describes many planar interface limits [23]. Smirnov proved conformal convergence of the FK-Ising fermionic observable [27], and Chelkak and Smirnov developed fermionic-observable universality on critical isoradial graphs [7]. Chelkak, Duminil-Copin, Hongler, Kemppainen, and Smirnov then proved convergence of the critical square-lattice Dobrushin spin interface to chordal $"SLE"_3$ [6] Theorem 1 and Equation (1). Their conclusion is convergence of curves in uniform distance modulo orientation-preserving reparametrization, the topology used here.

Two other directions provide relevant comparisons. For weak, translation- and rotation-invariant finite-range pair perturbations, Giuliani, Greenblatt, and Mastropietro proved universality of infinite-plane energy-correlation scaling limits [14] Theorems 1.1–1.2. Greenblatt and Peltola constructed a Grassmann martingale observable for non-integrable spin interfaces and formulated asymptotic conditions that would imply an $"SLE"_3$ limit [15]. The companion [22] supplies the deterministic transfer and interface comparison results used in this paper. For random couplings, Mahfouf proved quenched FK-interface convergence to $"SLE"_(16 \/ 3)$ in a regime in which the disorder strength vanishes with the mesh [20] Theorem 1.6; Avérous and Mahfouf proved quenched crossing estimates for near-critical random bond FK-percolation in related regimes [3] Theorem 1.6. The disorder distribution in the present theorem is fixed as the mesh tends to zero, and the conclusion concerns spin rather than FK interfaces.

Rigorous results on disordered phase transitions also distinguish the location of a transition from its scaling behavior. Aizenman and Wehr proved that quenched bond randomness rounds energy discontinuities in two-dimensional ferromagnets at positive temperature [2] Theorem 4.1. Chayes and Shtengel proved zero magnetization, uniqueness of the limiting disorder-averaged state, and divergent averaged susceptibility at self-dual iid ferromagnetic coupling laws [5] Theorems $1'$–$2'$. Their result does not by itself exclude a critical interval containing the self-dual point. In this paper the identification with the physical magnetization threshold is proved separately from the construction of the critical scale trajectory.

The proof also uses established geometric and probabilistic methods. Kramers–Wannier duality [18], including its four-sector torus form [4] Equations (4)–(5), identifies the symmetric tuning. The random-cluster representation of Fortuin and Kasteleyn [12], the Edwards–Sokal coupling [11], and positive association [13] connect spin and crossing events. The decision-tree inequality of O’Donnell, Saks, Schramm, and Servedio [21] and its extension to monotonic measures by Duminil-Copin, Raoufi, and Tassion [10] Theorem 1.1 supply the sharpness argument at fixed environment, after which we average over the disorder. Finally, the use of crossing estimates to control curves has precedents in Aizenman–Burchard [1] and Kemppainen–Smirnov [17]; Sheffield–Sun [26] explain why convergence of Loewner driving functions alone does not supply the full curve topology. Here the needed geometric comparison and exclusion of macroscopic reverse traversals are proved within the argument.

=== 1.5 Proof strategy and the new estimates <proof-strategy-and-the-new-estimates>

Our starting point is the pure-model analysis and deterministic geometry of the companion paper [22]. We use its pure conditional-law comparisons, transfer estimates for spatially symmetric observables, crossing and passage bounds, and geometric passage from boundary barriers to curves. Section 2 derives the additional transfer and separated-product estimates needed for observables without spatial symmetry. A typical random realization has no such symmetry, so the subsequent scale analysis must control a random family of local interactions uniformly in the exterior field data.

The scale transformation keeps the interactions local by adding auxiliary fair coins. These coins belong to the reference Gibbs field; they are distinct from the random environment. After conditioning on them, a separated collection of squares can be integrated exactly. The resulting interactions depend only on bounded neighborhoods of the enlarged scale. A separate operation treats isolated concentrations of large interactions, so estimates use environmental moments rather than a supremum over environments.

The relevant local coordinate is the coefficient of the pure energy field. We construct a linear functional $Q$ on bounded even local observables that is exactly preserved by transfer through a pure annulus. A covariance sum of these charges measures the leading disorder strength. Its variance receives a negative quadratic correction under one scale step. The sign comes from the normalization of a joint insertion of two separated interactions. A finite polynomial correction to the covariance sum makes this calculation compatible with the local transformation and its allocation of interactions to larger cells.

The resulting disorder decays only logarithmically with length scale. For crossings, this is sufficient because a change in a small square can alter a macroscopic test only when several paths reach away from that square. Pure passage bounds supply a positive power of the ratio of the square size to the test size. Summing these geometrically weighted errors makes the full comparison tend to zero. We first take a supremum over exterior spin data; the resulting local functions of the environment can then be multiplied for disjoint ring neighborhoods. This order of operations gives the conditional estimates needed both for criticality and for boundary comparisons.

Finally, the target interface is coupled to pure comparison chords whose law is deterministic even after conditioning on the environment. The expected distance in these couplings bounds the expected bounded-Lipschitz distance between the quenched laws. Boundary barriers and an interior multiple-passage estimate turn this comparison into convergence of the full oriented curve.

The exact local transformation, its treatment of large interactions, and the polynomial variance coordinate provide reusable methods for random perturbations with a marginal energy direction. Their use here requires the stated pure transfer and geometric estimates. All scale parameters and the allowed disorder interval are fixed before the target domain is chosen.

===== 1.5.1 Organization. <organization.>

Section 2 develops the pure energy charge and its product estimates. Sections 3 and 4 construct the local transformation and prove its moment bounds. Sections 5 and 6 establish the variance recursion and tune a trajectory with decaying disorder. Section 7 transfers those bounds to crossings and passages. Section 8 identifies the physical critical point. Section 9 proves Theorem 2.

== 2 An exactly normalized pure energy coefficient <sec:pure>

The scale argument needs a coefficient that is preserved exactly when a local observable is integrated through a pure annulus. The approximate coefficients in the companion transfer theorem identify the relevant one-dimensional direction, but do not by themselves fix its normalization through infinitely many scales. We fix that normalization by the known energy covariance. We then prove two estimates needed below: cancellation of the energy coefficient of a product of separated centered observables, and a transfer bound for an arbitrarily large positive local weight.

Let $mu_0$ be the full-plane nearest-neighbor Ising state at $K_0 = 1 / 2 log \( 1 + sqrt(2) \)$, and write $bb(E)_0$ for its expectation. Set $B_s \( x \) = x + \[ - s \, s \]^2 ∩ bb(Z)^2$ and $partial B_s \( x \) = B_s \( x \) \\ B_(s - 1) \( x \)$, initially for integer $s gt.eq 1$, and abbreviate $B_s = B_s \( 0 \)$. Observables in this section are real-valued. A local observable is #emph[even] if it is unchanged by simultaneously reversing all spins. It may also depend on independent auxiliary variables attached to its support. These variables are integrated before a pure transfer; spin reversal leaves them unchanged. All norms in this section are supremum norms, and all centered observables have mean zero under $bb(E)_0$, including this auxiliary integration.

For an observable supported strictly inside $B_R \( x \)$ define

$ P_(R \, x) f = bb(E)_0 \[ f divides sigma_(partial B_R \( x \)) \] - bb(E)_0 f \, #h(2em) P_R = P_(R \, 0) . $

We use $P_(R \, x)^(upright("unc"))$ for the same conditional expectation without subtracting the mean. The spatial Markov property gives exact composition for nested squares. It also permits simultaneous integration inside disjoint squares while preserving every correlation with their exterior. Integer roundings of fixed radius ratios will always be understood.

Critical duality gives $bb(E)_0 sigma_z sigma_(z') = 1 \/ sqrt(2)$ on every nearest-neighbor edge. Indeed, differentiating the finite planar partition-function duality once and passing to the unique critical full-plane state gives $bb(E)_0 sigma_z sigma_(z') = coth \( 2 K_0 \) - bb(E)_0 sigma_z sigma_(z')$, and $coth \( 2 K_0 \) = sqrt(2)$ [18]. For an unordered nearest-neighbor edge $e = { z \, z' }$ put

$ b_e = sigma_z sigma_(z') - 1 / sqrt(2) \, #h(2em) B_x = 1 / 4 sum_(e in.rev x) b_e \, #h(2em) B = B_0 \, #h(2em) kappa = 1 / pi^2 . $

The symbol $B_x$ denotes this observable, whereas $B_s \( x \)$ denotes a square.

=== 2.1 The companion inputs and their nonsymmetric consequence <the-companion-inputs-and-their-nonsymmetric-consequence>

We use the following statements of the companion at the scopes specified here. These are pure-model statements throughout.

First, the Proposition “Buffered and small-patch comparisons” in [22] Section 2 bounds the density of the spin law on one side of a fixed proportional unpinned collar, under any data on the other side, between $K^(- 1)$ and $K$ relative to the full-plane marginal. The constant depends only on the collar ratios. The assertion holds with the two terminal sets interchanged and for mixtures of boundary data. In particular, conditional expectation through such a collar maps $L^1 \( mu_0 \)$ to bounded functions with norm at most $K$ times the $L^1$ norm.

Second, the Proposition “Positive energy covariance” in [22] Section 2 gives, for either orientation of each bond,

#[#set math.equation(numbering: n => "(2.1)")
 $ "Cov"_0 \( b_e \, b_(e' + x) \) = frac(kappa + o \( 1 \), \| x \|^2) quad \( \| x \| arrow.r oo \) . $ <pure:energy-input>]

The same formula holds for $B \, B_x$. Fixed displacements of the bonds do not change its coefficient.

Third, we use the Lemma “Bounded replacement across a gap”, the radial Hilbert-space construction, and the Proposition “Radial spectral gap” of [22] Section 3. Bounded replacement concerns arbitrary bounded lattice observables on finitely many positively separated square or band supports. Their pairings can be approximated simultaneously by bounded continuum spin-field tests, with the same supremum bounds. The menus of spatial smears are fixed before the mesh tends to zero. The radial dilation semigroup has a positive spectral representation on the Hilbert space generated by spin-field tests supported in the unit disk, and its Hilbert norm is bounded by ordinary $L^2$. We denote its inner product by $\( dot.op \, dot.op \)_(upright("rad"))$ and its inward-dilation semigroup by $D_t$, with radius ratio $e^(- t)$. On even quarter-turn-invariant tests its spectrum below $3$ consists of the constant state at $0$ and a single state at $1$. The full-plane spin-correlation formula and moment bounds used below are those in the Proposition “Spin normalization and moment bounds” of [22] Section 2. Write $S \( z_1 \, dots.h \, z_n \)$ for the continuum $n$-point spin correlation in its normalization, so that $S \( z \, z' \) = \| z - z' \|^(- 1 \/ 4)$. A smooth lattice smear at scale $s$ is

$ Phi_s \( psi \) = a_sigma^(- 1) s^(- 15 \/ 8) sum_(z in bb(Z)^2) psi \( z \/ s \) sigma_z \, $

where $a_sigma > 0$ is the lattice normalization in that proposition. Every fixed finite collection of these smears has convergent moments of all orders; the bounds are uniform in $s$.

Here is the consequence of these inputs that also treats observables without spatial symmetry. If $cal(A)_s$ denotes quarter-turn averaging about the center of $B_s$, the subspace $ker cal(A)_s$ means that the average of the observable, rather than its individual values, vanishes.

#thm([Lemma 2.1.])[
  (Fixed-ratio pure transfer).  #emph[There is a constant $C$ with the following property. Fix finitely many sufficiently large integer ratios $d$. A common measurement ratio $H$ and then a threshold $s_(*)$ can be chosen so that, for every integer $s gt.eq s_(*)$, there are linear functionals $ell_s$ on centered even quarter-turn-invariant observables in $B_s$, of norm at most $C$, and centered right inverses $e_s$ with $ell_s \( e_s \) = 1$ and $parallel e_s parallel_oo lt.eq C$. For each chosen ratio, with $T_(s \, d) = P_(d s)$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ parallel T_(s \, d) f parallel_oo & lt.eq C d^(- 1) \| ell_s \( f \) \| + C d^(- 3) parallel f parallel_oo \,\
\| ell_(d s) \( T_(s \, d) f \) - d^(- 1) ell_s \( f \) \| & lt.eq C d^(- 3) parallel f parallel_oo . $ <pure:ratio-main>]

 If $f$ is even and $cal(A)_s f = 0$, then 
#[#set math.equation(numbering: n => "(2.3)")
 $ parallel T_(s \, d) f parallel_oo lt.eq C d^(- 2) parallel f parallel_oo . $ <pure:ratio-nonscalar>]

 The constant $C$ is independent of the chosen large ratios.]
] <pure:fixed-ratio>

#proof[
  For the invariant subspace use the displayed upper-limit estimates in [22] Section 3, “Compatible lattice coefficients and arbitrary boundary data”, dividing the companion’s density-normalized operator by $d^2$. The measured coefficient is
  $ ell_s \( f \) = H / g "Cov"_0 \( f \, W_(H s) \) \, $
  where $W$ is the fixed exterior annular test there and $g eq.not 0$ is its radial degree-one coefficient. The remainder in the transfer norm is $C d^(- 3) + C \/ \( d H^2 \)$, and that in coefficient compatibility is $C \/ \( d H^2 \)$. Choose $H$ large enough for all the prescribed ratios, then the replacement accuracies, and finally $s_(*)$ to absorb the uniform upper-limit errors into $C d^(- 3)$. Center the companion’s fixed interior reference test under $bb(E)_0$ and divide it by its measured coefficient to obtain the centered bounded right inverse. Centering changes neither that coefficient nor the transfer estimates. The radial spectral gap requires only quarter turns, so reflection averaging in this application is unnecessary.
  For completeness, the same method proves (2.3). Before the angular averaging in the proof of the companion’s radial gap, the polynomial expansion has the form
  $ \( F \, D_(- log r) G \)_(upright("rad")) = bb(E) overline(F) thin bb(E) G + r thin overline(c \( F \)) c \( G \) + O_(F \, G) \( r^2 \) . $
  Both displayed coefficients are rotation scalars. Before smearing, the second factor is $c \( product_i sigma \( z_i \) \) = S \( z_1 \, dots.h \, z_(2 m) \) A_2 \( z \) \/ A_0 \( z \)$, where
  $ A_q \( z \) = sum_(u_i in { - 1 \, 1 }\
sum_i u_i = q) product_(i < j) \| z_i - z_j \|^(u_i u_j \/ 2) . $
  All distances in this expression are rotation invariant. Thus both vanish on the even zero-quarter-turn-average subspace. A polynomial self-pairing there is the integral of $r^a$ against a positive spectral measure and is $O_F \( r^2 \)$. Positive mass in any compact subinterval of $\[ 0 \, 2 \)$ would contradict this bound as $r arrow.b 0$. Polynomial density therefore places the whole spectrum of this subspace in $\[ 2 \, oo \)$, giving the uniform radial bound $r^2 parallel F parallel_2 parallel G parallel_2$.
  Apply bounded replacement to the observable and to the buffered boundary density used in the proof of uniform transfer. Project the first proxy with $I - cal(A)$; this changes its norm and the replacement error by at most a factor two. The radial bound just proved then gives $C d^(- 2)$, uniformly over the boundary assignment. The same finite-list choice of accuracies and threshold makes the lattice inequality uniform in $s$ and in the observable. This proves the lemma without a spatial symmetry assumption on the original even observable. ◻
]

=== 2.2 Exact normalization by the energy covariance <exact-normalization-by-the-energy-covariance>

Fix

$ u = 9 / 5 \, #h(2em) w = 12 / 5 . $

We first extract an exact invariant hyperplane from the approximate coefficient and then calibrate its one-dimensional complement. The latter step is what prevents small coefficient errors from accumulating over infinitely many scales.

#thm([Lemma 2.2.])[
  (The stable hyperplane).  #emph[Fix a sufficiently large ratio $d$ and a geometric sequence $s_j = s_(*) d^j$. On centered even quarter-turn-invariant observables in $B_(s_j)$ there are uniformly bounded linear functionals $beta_j$ such that 
$ \| beta_j \( f \) - ell_(s_j) \( f \) \| lt.eq C d^(- 2) parallel f parallel_oo \, #h(2em) beta_(j + 1) \( P_(s_(j + 1)) f \) = m_j beta_j \( f \) \, $

 where $m_j = d^(- 1) \( 1 + O \( d^(- 2) \) \) > 0$. An observable in $ker beta_j$ satisfies 
#[#set math.equation(numbering: n => "(2.4)")
 $ parallel P_(s_(j + n)) f parallel_oo lt.eq C d^(- w n) parallel f parallel_oo #h(2em) \( n gt.eq 1 \) . $ <pure:stable-decay>]

 Every observable outside this kernel eventually enters an invariant cone 
#[#set math.equation(numbering: n => "(2.5)")
 $ parallel f parallel_oo lt.eq M \| ell_(s_j) \( f \) \| \, $ <pure:cone>]

 where $M$ is independent of $j$ and of sufficiently large $d$.]
] <pure:hyperplane>

#proof[
  Start with a bounded right inverse $v_0$ of $ell_(s_(*))$ and propagate it by
  $ m_j = ell_(s_(j + 1)) \( P_(s_(j + 1)) v_j \) \, #h(2em) v_(j + 1) = m_j^(- 1) P_(s_(j + 1)) v_j . $
  Equations (2.2)–(2.2) show by induction that $parallel v_j parallel_oo$ stays bounded and $m_j = d^(- 1) \( 1 + O \( d^(- 2) \) \)$. Indeed, choose a fixed bound larger than four times the constant in (2.2), then choose $d$ so large that the $d^(- 2)$ errors preserve it.
  Write $f_j = a_j v_j + k_j$, where $ell_(s_j) \( k_j \) = 0$. Transfer has the triangular form
  $ a_(j + 1) = m_j a_j + t_j k_j \, #h(2em) k_(j + 1) = K_j k_j \, #h(2em) parallel t_j parallel + parallel K_j parallel lt.eq C d^(- 3) . $
  The last estimate follows by subtracting $v_(j + 1) ell_(s_(j + 1)) \( P_(s_(j + 1)) k_j \)$ from the transferred kernel vector. Put $M_(j \, n) = product_(h = j)^(n - 1) m_h$, with $M_(j \, j) = 1$, and define
  $ beta_j \( a v_j + k \) = a + sum_(n = j)^oo frac(t_n K_(n - 1) dots.h.c K_j k, M_(j \, n + 1)) . $
  For $n = j$ the product of $K$’s is the identity. The series converges in operator norm because the ratio of its successive bounds is $O \( d^(- 2) \)$; its correction to $a$ has norm $O \( d^(- 2) \) parallel k parallel_oo$. Shifting the series proves exact compatibility with multiplier $m_j$.
  If $beta_j \( f \) = 0$, the scalar at each later time is the negative of the remaining tail and has magnitude at most $C d^(- 2) parallel k_n parallel_oo$. Hence the whole vector contracts at rate $\( C d^(- 3) \)^(n - j)$. Enlarge $d$ so that this is bounded by $d^(- w \( n - j \))$. If $beta_j \( f \) eq.not 0$, division by $M_(j \, n)$ shows that its scalar converges to the nonzero value $beta_j \( f \)$ while its kernel part tends to zero. It therefore enters (2.5). Finally, for a vector in that cone,
  $ frac(parallel P_(d s) f parallel_oo, \| ell_(d s) \( P_(d s) f \) \|) lt.eq frac(C + C d^(- 2) M, 1 - C d^(- 2) M) . $
  Choose $M$ first, larger than the limiting bound, and then $d$ large. This proves invariance of the cone. ◻
]

#thm([Lemma 2.3.])[
  (Energy calibration).  #emph[For all sufficiently large integer $s$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ c \/ s lt.eq parallel P_s B parallel_oo lt.eq C \/ s . $ <pure:energy-norm>]

 Along the geometric scales above, $P_s B$ eventually belongs to the cone (2.5).]
] <pure:calibration>

#proof[
  If a transferred $B$ belonged to the stable hyperplane, then (2.4) and the Markov property, tested against a distant $B_x$, would give $bb(E)_0 B B_x = O \( \| x \|^(- w) \)$. This contradicts (2.1), since $w > 2$. The cone assertion follows from Lemma 4.
  We next show that, for one sufficiently large fixed $T$, any centered unit-norm cone observable $f_s$ satisfies
  #[#set math.equation(numbering: n => "(2.7)")
   $ bb(E)_0 \[ f_s thin tau_(T s e_1) f_s \] gt.eq c_T > 0 \, $ <pure:cone-pairing>]
  uniformly for all sufficiently large $s$; choose $T$ divisible by $8$, and $tau_x$ translates an observable by $x$. The value $c_T$ can be chosen of order $T^(- 2)$.
  To see this, choose nonzero nonnegative smooth bumps $psi_1 \, psi_2$ in two disjoint regions strictly inside the unit square. Let $Y_s$ be the quarter-turn average of $Phi_s \( psi_1 \) Phi_s \( psi_2 \)$, centered under $bb(E)_0$. The corresponding continuum spin-smear product, averaged under quarter turns and centered, has nonzero scalar coefficient. For two unsmeared pairs $z_1 \, z_2$ and $T e_1 + y_1 \, T e_1 + y_2$, the squared four-spin formula of the companion gives
  $ "Cov" #scale(x: 120%, y: 120%)[\(] sigma \( z_1 \) sigma \( z_2 \) \, sigma \( T e_1 + y_1 \) sigma \( T e_1 + y_2 \) #scale(x: 120%, y: 120%)[\)] = frac(\| z_1 - z_2 \|^(3 \/ 4) \| y_1 - y_2 \|^(3 \/ 4), 4 T^2) + o \( T^(- 2) \) . $
  Here the neutral assignments within each pair give the product term; their cross logarithms are $O \( T^(- 2) \)$ and cancel to first order after sign summation. The two assignments with charge $2$ and $- 2$ on the respective pairs give the displayed strictly positive coefficient after taking the positive square root. The expansion is uniform on the separated bump supports, so it survives smearing and averaging.
  Take a sufficiently large fixed $A$ and put $V_s = chi_A \( Y_s \) - bb(E)_0 chi_A \( Y_s \)$, where $chi_A \( t \) = max { - A \, min { A \, t } }$. The nonzero scalar coefficient survives for all sufficiently large $A$: the moment bounds give ordinary $L^2$ convergence of the truncated continuum test, and the radial coefficient is continuous in that norm. Its measured lattice coefficient is then bounded away from zero once $H$ and the lattice threshold are large.
  To see why $A$ may be fixed before $T$, put $epsilon_A = sup_s bb(E)_0 \| Y_s - V_s \|$, which tends to zero by the moment bounds. Buffered comparison gives
  $ parallel P_(2 s) \( Y_s - V_s \) parallel_oo lt.eq K epsilon_A \, #h(2em) parallel P_(2 s) Y_s parallel_oo + parallel P_(2 s) V_s parallel_oo lt.eq C . $
  The last constant is independent of $A$, since $bb(E)_0 \| V_s \| lt.eq 2 bb(E)_0 \| Y_s \|$. Apply the overall $C \/ T$ transfer bound of Lemma 3 to both factors, now conditioned on these radius-$2 s$ collars, and integrate in the two disjoint radius-$T s \/ 4$ squares. Expanding the difference of the two products yields
  $ \| bb(E)_0 \[ Y_s tau_(T s e_1) Y_s \] - bb(E)_0 \[ V_s tau_(T s e_1) V_s \] #scale(x: 120%, y: 120%)[\|] lt.eq C T^(- 2) epsilon_A . $
  Thus a fixed large $A$ preserves the positive $T^(- 2)$ coefficient. For all large fixed $T$, the covariance of $V_s$ is at least $c T^(- 2)$ once the lattice threshold is large enough.
  Now put $a_s = ell_s \( f_s \) \/ ell_s \( V_s \)$. The cone condition and the uniform coefficient bounds give $0 < c lt.eq \| a_s \| lt.eq C$. The observable $f_s - a_s V_s$ has measured coefficient zero. Transfer it and the other factor into the disjoint squares of radius $T s \/ 4$ about their centers. Lemma 3 bounds the first factor by $C T^(- 3)$ and the other centered factor by $C T^(- 1)$. Thus
  $ bb(E)_0 \[ f_s thin tau_(T s e_1) f_s \] = a_s^2 bb(E)_0 \[ V_s thin tau_(T s e_1) V_s \] + O \( T^(- 4) \) \, $
  which proves (2.7). In this argument choose the truncation, then $T$, then a common measurement distance for the finite list $d \, T \/ 4 \, T \/ 8$, and finally the lattice threshold. The ratio $T \/ 8$ is used after transferring a truncation error to its radius-$2 s$ collar. Reapply Lemma 4 with these choices; its constants are uniform and its conclusions are unchanged. For this final choice, the covariance contradiction at the start of the proof again shows that $P_s B$ is not stable, so it eventually enters the newly constructed cone.
  Apply (2.7) to $f_s = P_s B \/ parallel P_s B parallel_oo$. By simultaneous Markov integration in the two disjoint squares,
  $ bb(E)_0 \[ \( P_s B \) thin tau_(T s e_1) \( P_s B \) \] = bb(E)_0 \[ B B_(T s e_1) \] . $
  The cone lower bound and (2.1) give the upper bound in (2.6). The inequality $\| bb(E)_0 \[ f_s tau_(T s e_1) f_s \] \| lt.eq 1$ gives its lower bound. We first obtain these estimates along the geometric scales. For an intermediate radius, the tower property bounds its norm between the norms at the two adjacent scales, proving (2.6) for every large $s$. ◻
]

#thm([Theorem 2.4.])[
  (Exact pure energy charge).  #emph[For every bounded even local observable $f$, the limit 
#[#set math.equation(numbering: n => "(2.8)")
 $ Q \( f \) = kappa^(- 1) lim_(\| x \| arrow.r oo) \| x \|^2 bb(E)_0 \[ f B_x \] $ <pure:charge-definition>]

 exists. It defines a linear functional that kills constants, is invariant under lattice translations and square symmetries, and satisfies $Q \( b_e \) = 1$. Pure transfer preserves $Q$ exactly. If $f$ is supported in $B_s \( x \)$, then 
#[#set math.equation(numbering: n => "(2.9)")
 $ \| Q \( f \) \| lt.eq C s parallel f parallel_oo . $ <pure:charge-bound>]

 For centered $f$ and $R gt.eq 4 s$, 
#[#set math.equation(numbering: n => "(2.10)")
 $ parallel P_(R \, x) f parallel_oo lt.eq C \( s \/ R \) parallel f parallel_oo . $ <pure:even-transfer>]

 If $Q \( f \) = 0$, the factor $s \/ R$ improves to $\( s \/ R \)^u$; it improves to $\( s \/ R \)^w$ if, after auxiliary integration, $f$ is also invariant under quarter turns about $x$. More generally, with $v = u$ or $v = w$ according to these two symmetry classes, 
#[#set math.equation(numbering: n => "(2.11)")
 $ parallel P_(R \, x) f - Q \( f \) P_(R \, x) B_x parallel_oo lt.eq C \( s \/ R \)^v parallel f parallel_oo . $ <pure:energy-remainder>]

 All constants are independent of $s \, R$, and $f$.]
] <pure:charge>

#proof[
  We first work at the origin on the geometric scales and with quarter-turn-invariant centered functions. By Lemma 5, the vector $E_j = P_(s_j) B$ lies eventually in the cone and has norm comparable to $s_j^(- 1)$. Since $beta_j = ell_(s_j) + O \( d^(- 2) \)$ and $d$ is large,
  $ c \/ s_j lt.eq \| beta_j \( E_j \) \| lt.eq C \/ s_j . $
  Define temporarily $tilde(Q) \( f \) = beta_j \( f \) \/ beta_j \( E_j \)$ for a function supported in $B_(s_j)$. Exact compatibility of both numerator and denominator makes this definition invariant under transfer to later geometric scales. This is also consistent when the same function is regarded as belonging to a later support space: the difference between it and its transfer vanishes after the next transfer, hence has zero $beta$ by compatibility. Its kernel is exactly the stable hyperplane, and $\| tilde(Q) \( f \) \| lt.eq C s_j parallel f parallel_oo$.
  Increase the fixed starting scale once so that the calibration holds on the whole grid. For a function supported in radius $s$ above this threshold, use the next containing geometric scale $r$, so that $s lt.eq r lt.eq d s$. At that scale compare $f$ with $tilde(Q) \( f \) P_r B$, whose norm is at most $C parallel f parallel_oo$ by (2.6). Their difference is stable. Lemma 4, followed by norm contraction between adjacent scales, proves (2.11) with $v = w$ and $tilde(Q)$ in place of $Q$. Radii $R$ within a fixed factor of $s$ are absorbed by increasing the constant.
  For a general even function, apply this construction to its quarter-turn average and set $tilde(Q) \( f \) = tilde(Q) \( cal(A)_s f \)$. The complementary component contracts at rate $\( C d^(- 2) \)^j$ by (2.3). Choose $d$ large enough that this is at most $d^(- u j)$. This proves the general remainder estimate with $v = u$. Together with $parallel P_R B parallel_oo lt.eq C \/ R$, it proves (2.10).
  For fixed $f$, pair its remainder with $B_x$ and integrate both factors in disjoint squares of radii proportional to $\| x \|$. The remainder has norm $O_f \( \| x \|^(- u) \)$, and the transferred $B_x$ has norm $O \( \| x \|^(- 1) \)$. Since $u > 1$, their covariance is $o \( \| x \|^(- 2) \)$. Equation (2.1) therefore gives
  $ \| x \|^2 bb(E)_0 \[ f B_x \] arrow.r kappa tilde(Q) \( f \) . $
  This proves existence of (2.8) and identifies $Q = tilde(Q)$. In particular the definition is independent of the geometric grid and its starting scale. Translation and square invariance follow from this intrinsic limit and the corresponding symmetries of $mu_0$; the limit is unchanged by a fixed displacement of its distant test. Equation (2.1) gives $Q \( b_e \) = 1$ for every edge. Finally the Markov property preserves the covariance with every sufficiently distant $B_x$, so it preserves $Q$ under transfer through any containing square. This also establishes the stated results about arbitrary centers. For the finitely many radii below the fixed threshold, transfer first to that threshold and enlarge the universal constants. Integrating independent auxiliary variables at the outset proves the asserted extension to them. ◻
]

=== 2.3 Separated products and positive local weights <separated-products-and-positive-local-weights>

We now use the exact normalization to control the energy component of a product. Write $q_s \( f \) = Q \( f \) \/ s$. A product of two centered energy observables has a much smaller charge than either factor; duality supplies the cancellation responsible for this gain.

#thm([Proposition 2.5.])[
  (Covariance and charge of separated products).  #emph[Fix $D < oo$. Let $f \, g$ be centered even observables of norm at most one, supported respectively in $B_(D s) \( x \)$ and $B_(D s) \( y \)$, where $s gt.eq 1$ and $\| x - y \| = l s$. For sufficiently large $l$, uniformly in $s \, x \, y$ and in the observables, 
#[#set math.equation(numbering: n => "(2.12)")
 $ bb(E)_0 f g & = l^(- 2) #scale(x: 120%, y: 120%)[\(] kappa q_s \( f \) q_s \( g \) + o_D \( 1 \) #scale(x: 120%, y: 120%)[\)] \,\
\| q_s \( f g \) \| & lt.eq C_D l^(- u) . $ <pure:fusion-covariance>]

 If each observable is invariant under quarter turns about its own center after auxiliary integration, the last bound improves to $C_D l^(- w)$. The term $o_D \( 1 \)$ tends to zero as $l arrow.r oo$ independently of $s$.]
] <pure:fusion>

#proof[
  Put $r = \| x - y \|$ and integrate in disjoint squares of radius a small fixed fraction of $r$. Write $F \, G$ for the transferred observables and $U_x \, U_y$ for the corresponding transfers of $B_x \, B_y$. Theorem 6 gives
  $ parallel F parallel_oo + parallel G parallel_oo lt.eq C_D l^(- 1) \, #h(2em) parallel F - Q \( f \) U_x parallel_oo + parallel G - Q \( g \) U_y parallel_oo lt.eq C_D l^(- v) \, $
  where $v = u$, or $v = w$ in the symmetric case. Notice that these estimates compare with the bond observable after transfer to a containing scale; the untransferred $Q \( f \) B_x$ can have norm of order $s$. It follows that
  #[#set math.equation(numbering: n => "(2.13)")
   $ \| bb(E)_0 f g - Q \( f \) Q \( g \) bb(E)_0 B_x B_y #scale(x: 120%, y: 120%)[\|] lt.eq C_D l^(- v - 1) . $ <pure:product-covariance-error>]
  Since $v > 1$, (2.1) proves (2.12). Its error is uniform: $r = l s gt.eq l$, the energy remainder tends uniformly to zero outside growing disks, and $\| q_s \( f \) \| + \| q_s \( g \) \| lt.eq C_D$.
  Simultaneous integration in the disjoint squares also preserves the charge of their product. Indeed it preserves its correlation with every sufficiently distant energy test, so (2.8) applies. All transferred products fit in a square of radius $C r$. The charge bound, applied to the same product difference as in (2.13), therefore gives
  #[#set math.equation(numbering: n => "(2.14)")
   $ 1 / s \| Q \( f g \) - Q \( f \) Q \( g \) Q \( B_x B_y \) #scale(x: 120%, y: 120%)[\|] lt.eq C_D r / s l^(- v - 1) = C_D l^(- v) . $ <pure:product-charge-error>]
  It remains to prove
  #[#set math.equation(numbering: n => "(2.15)")
   $ \| Q \( B_x B_y \) \| lt.eq C r^(- w) . $ <pure:bond-fusion>]
  For distinct edges, Kramers–Wannier duality at the critical coupling gives
  #[#set math.equation(numbering: n => "(2.16)")
   $ bb(E)_0 product_(i = 1)^n b_(e_i) = \( - 1 \)^n bb(E)_0^(*) product_(i = 1)^n b_(e_i^(*)) . $ <pure:duality-centered>]
  Here $e_i^(*)$ is the crossing dual edge. To check the centering directly, differentiate the finite planar partition-function duality [18] in the distinct couplings. Its coupling-dependent prefactor is $product_e \( sinh \( 2 K_e \) \)^(1 \/ 2)$, and $sinh \( 2 K_e \) sinh \( 2 K_e^(*) \) = 1$. At $K_0$ the logarithmic prefactor derivative is $sqrt(2)$ and $upright(d) K_e^(*) \/ upright(d) K_e = - 1$; thus $partial_(K_e) - 1 \/ sqrt(2)$ becomes $- \( partial_(K_e^(*)) - 1 \/ sqrt(2) \)$. Distinct derivatives introduce no contact terms. Exhausting the plane and using uniqueness of its pure critical state proves (2.16).
  Apply (2.16) to the three separated bond averages in the definition of $Q \( B_x B_y \)$. After identifying the dual lattice with the original lattice, the distant dual average $B'_z$ is centered and has charge one. Thus $B'_z - B_z$ is centered and has charge zero. With $x \, y$ fixed, separately transfer the centered product $B'_x B'_y - bb(E)_0 \( B'_x B'_y \)$ and this distant difference into squares of radii proportional to $\| z \|$. Their norms are respectively $O_(x \, y) \( \| z \|^(- 1) \)$ and $O \( \| z \|^(- u) \)$, by Theorem 6. Their covariance is therefore $O_(x \, y) \( \| z \|^(- u - 1) \) = o \( \| z \|^(- 2) \)$. Replacing the distant dual average by $B_z$ leaves the charge limit unchanged, and consequently
  $ Q \( B_x B_y \) = - Q \( B'_x B'_y \) \, $
  where the primed average consists of the four dual edges surrounding the original site.
  There are four identifications obtained by the translations $h = \( plus.minus 1 / 2 \, plus.minus 1 / 2 \)$. They send the dual average about $x$ to the boundary-edge averages of the four unit plaquettes incident to $x$. Let $B'_(i \, x)$, $1 lt.eq i lt.eq 4$, denote the resulting observables, and put
  $ C_x = 1 / 4 sum_(i = 1)^4 B'_(i \, x) \, #h(2em) D_(i \, x) = B'_(i \, x) - C_x . $
  The observable $C_x$ is quarter-turn invariant about $x$, has charge one, and is supported in a fixed-radius square. Each $D_(i \, x)$ has charge zero, and their average vanishes. Hence
  $ 1 / 4 sum_i Q \( B'_(i \, x) B'_(i \, y) \) = Q \( C_x C_y \) + 1 / 4 sum_i Q \( D_(i \, x) D_(i \, y) \) . $
  The charge bound after separate transfers gives
  $ \| Q \( D_(i \, x) D_(i \, y) \) \| lt.eq C r^(1 - 2 u) \, #h(2em) \| Q \( C_x C_y \) - Q \( B_x B_y \) \| lt.eq C r^(- w) . $
  For the first estimate both factors have zero charge and decay as $r^(- u)$. For the second, expand the difference with one factor $C - B$; it is quarter-turn invariant and has zero charge, while the other centered factor decays as $r^(- 1)$. The common-support charge bound supplies the factor $C r$ in each case. Averaging the negative duality identity now gives $2 \| Q \( B_x B_y \) \| lt.eq C \( r^(- w) + r^(1 - 2 u) \)$. Since $2 u - 1 > w$, this is (2.15).
  Finally, its contribution in (2.14) is at most
  $ frac(\| Q \( f \) Q \( g \) \|, s) thin C r^(- w) lt.eq C_D s \( l s \)^(- w) = C_D s^(1 - w) l^(- w) lt.eq C_D l^(- w) . $
  This proves both charge bounds uniformly for $s gt.eq 1$. ◻
]

#thm([Lemma 2.6.])[
  (Transfer of a positive local weight).  #emph[There is a constant $C < oo$ with the following property. Let $m \, R$ be integers with $m gt.eq 1$ and $R gt.eq 8 m$. Let $eta$ be a finite family of independent auxiliary variables, with arbitrary reference laws, independent of the full-plane pure critical Ising field. Suppose that $G = G \( sigma_(B_m) \, eta \)$ is a bounded measurable real function satisfying $G \( - sigma \, eta \) = G \( sigma \, eta \)$. Write 
$ parallel G parallel_oo = max_(sigma_(B_m)) "ess sup"_eta \| G \( sigma_(B_m) \, eta \) \| \, #h(2em) cal(Z)_R^G \( tau \) = bb(E)_0 #h(-0.16667em) [e^G divides sigma_(partial B_R) = tau] \, $

 where $bb(E)_0$ includes integration over all the auxiliary variables used by $G$. Then 
#[#set math.equation(numbering: n => "(2.17)")
 $ "osc"_tau log cal(Z)_R^G \( tau \) lt.eq C m / R min { 1 \, parallel G parallel_oo } . $ <pure:positive-weight-bound>]

 Here $"osc"$ is the supremum minus the infimum over all boundary spin assignments, and $C$ is independent of the number and laws of the auxiliary variables. For a patch of real radius $a gt.eq 0$, one may take $m = max { 1 \, ceil.l a ceil.r }$.]
] <pure:positive-weight>

#proof[
  First integrate the auxiliary variables and put
  $ W \( sigma_(B_m) \) = bb(E)_eta e^(G \( sigma_(B_m) \, eta \)) \, #h(2em) Z = bb(E)_0 W \, #h(2em) h \( xi \) = frac(bb(E)_0 \[ W divides sigma_(partial B_(2 m)) = xi \], Z) . $
  The function $W$ is positive and even. The fixed-ratio buffered comparison of [22] Section 2, Proposition “Buffered and small-patch comparisons”, applied to $B_m$ and $partial B_(2 m)$, gives a constant $K gt.eq 1$ such that
  $ K^(- 1) lt.eq h \( xi \) lt.eq K quad upright("for every ") xi . $
  Indeed, the conditional law on $B_m$ has pointwise density between $K^(- 1)$ and $K$ relative to its full-plane marginal: the latter is a mixture of the same conditional laws. Integrating the positive function $W$ proves the displayed bounds, regardless of its size.
  Spin-flip symmetry gives $h \( - xi \) = h \( xi \)$, and the tower property gives $bb(E)_0 h = 1$. If $t = parallel G parallel_oo$, then both $W$ and $Z$ lie between $e^(- t)$ and $e^t$. Consequently
  $ parallel h - 1 parallel_oo lt.eq min { K + 1 \, e^(2 t) - 1 } lt.eq C_K min { 1 \, t } . $
  Apply the even transfer estimate in Theorem 6 to the centered even function $h - 1$, supported in $B_(2 m)$. Since $R gt.eq 8 m$, it gives
  $ parallel P_R \( h - 1 \) parallel_oo lt.eq C m / R min { 1 \, t } . $
  The Ising Markov property, followed by conditional expectation, yields
  $ frac(cal(Z)_R^G \( tau \), Z) = bb(E)_0 \[ h divides sigma_(partial B_R) = tau \] = 1 + P_R \( h - 1 \) \( tau \) gt.eq K^(- 1) . $
  The logarithm is $K$-Lipschitz on $\[ K^(- 1) \, oo \)$. Its oscillation in the last display is therefore at most $2 K parallel P_R \( h - 1 \) parallel_oo$, which proves (2.17). ◻
]

== 3 An exact local change of scale <sec:local-map>

The scale transformation must preserve finite dependence on the random environment: every output must be determined within a fixed neighborhood. We use auxiliary coins to select separated squares, move their interactions to the boundaries, and retain all unintegrated variables. The selection respects translations and square symmetries in distribution. The output is again a family of bounded-range logarithmic weights on the original spin lattice. Its exterior marginals are exact, which will also allow us to couple consecutive scales.

=== 3.1 Fields, environments, and reference variables <fields-environments-and-reference-variables>

Fix an integer spacing $s$. A cell has center $s i$, $i in bb(Z)^2$. Besides the spins, the reference probability space may contain a locally finite family of independent finite-valued auxiliary variables with specified locations in the plane. We write $bb(E)_0$ for the pure critical Ising expectation together with these independent reference variables. They are part of the Gibbs field and will be integrated or conditioned along with the spins. In contrast, $bb(E)$ denotes expectation over the bond environment and the independent choices used to construct the transformation. Those choices include priorities and thresholds; they are fixed when a Gibbs law is sampled. The product reference law of the auxiliary variables is preserved by the translations and square symmetries acting on their locations and labels. The fresh fair comparison coins introduced below have this property as well.

The input consists of random functions $f_i$ of spins and reference variables. For each environment, $f_i$ is real, bounded, spin-flip even, and centered by $bb(E)_0 f_i = 0$. Its field support and the environment variables on which it depends lie within $C s$ of $s i$, in the supremum norm. Here $C$ is a fixed sufficiently large numerical constant. The primitive environment variables are independent. In particular, collections of $f_i$ whose dependence neighborhoods are disjoint are independent as random functions. We assume invariance in law under translations of the $s$-grid and the symmetries of a square, acting also on the auxiliary variables and their locations. Individual environments need not have these symmetries.

In a finite volume the logarithmic addition to the reference density is $sum_i f_i$, with the sum over potentials meeting that volume and with old exterior field variables prescribed. Every nontrivially decorated fresh coin is sampled as part of the construction. Exactness holds for each fixed environment and arbitrary old exterior assignment; the local implementation below keeps the complete decoration stencils inside the free chart. It does not assert the same input kernel after independently pinning some of those fresh coins. The construction can equally be performed on a sufficiently large torus. Infinite arrays are used only to define local formulas and their distributions; a sequential sampling procedure is needed only in a finite volume.

Choose a large odd integer $L$ and put $s' = L s$. The children of parent $j$ are

$ cal(C)_j = L j + { - \( L - 1 \) \/ 2 \, dots.h \, \( L - 1 \) \/ 2 }^2 \, #h(2em) F_j = sum_(i in cal(C)_j) f_i . $

Once $L$ is large compared with $C$, the support of $F_j$ lies in the square of radius $s'$ about $s' j$. Let $I_j$ be the open square of radius $4 s'$ about this center, including the old auxiliary variables located there. The first construction, called the #emph[regular map], has no size restrictions on the real $f_i$. Its Taylor estimates will be used only near zero.

=== 3.2 Selecting disjoint integrations <selecting-disjoint-integrations>

Fix $D = 100$. Join each pair of distinct parents at supremum distance at most $D$ by a comparison edge. Give each edge $e = { j \, k }$ a reference fair coin $c_e$, located at its midpoint, that favors one endpoint. A parent is selected if all its incident coins favor it. Write $A_j$ for its selection indicator and

$ p = bb(E)_(upright("ref")) A_j = 2^(- \( \( 2 D + 1 \)^2 - 1 \)) . $

Two selected parents have distance greater than $D$; hence their $I_j$ are disjoint with a free gap between them.

Order the comparison edges first by length and then by independent continuous priorities. The priorities belong to the environment. This rule is invariant in law under translations and square symmetries. For an edge $e$, let $d_e A_j$ be the Doob martingale difference of $A_j$ when $c_e$ is revealed under the reference coin law. It is zero unless $e$ is incident to $j$, and depends only on $c_e$ and earlier incident coins. If an earlier incident coin has already disfavored $j$, it is identically zero for both outcomes of $c_e$. Thus its definition uses a finite local star, regardless of the length of the global reveal order.

For fixed old field variables, give the new coins the successive conditional likelihoods

#[#set math.equation(numbering: n => "(3.1)")
 $ frac(exp U_e, bb(E)_e exp U_e) \, #h(2em) U_e = p^(- 1) sum_j F_j d_e A_j \, $ <map:coin-likelihood>]

where $bb(E)_e$ averages the current fair coin with all earlier coins fixed. Each factor is positive and normalized. Consequently the decoration preserves the original marginal law of spins and old reference variables. The telescoping identity $sum_e d_e A_j = A_j - p$ gives the following exact expression for the new logarithmic density:

#[#set math.equation(numbering: n => "(3.2)")
 $ sum_j F_j + sum_e #scale(x: 120%, y: 120%)[\(] U_e - log bb(E)_e e^(U_e) #scale(x: 120%, y: 120%)[\)] = p^(- 1) sum_j A_j F_j - sum_e log bb(E)_e e^(U_e) . $ <map:coin-identity>]

#thm([Lemma 3.1.])[
  (Separation of the terms to be integrated).  #emph[Fix all new coins. Each normalizer $log bb(E)_e e^(U_e)$ in (3.2) meets at most one selected square $I_j$ in its spin and old-auxiliary support. The same holds for each selected term $A_j F_j$.]
] <map:separated-integrations>

#proof[
  A parent whose $F_i$ meets $I_a$ is within $6$ parent units of $a$. Suppose a comparison edge has endpoint neighborhoods meeting two selected squares, centered at $a$ and $b$. An edge of length at most $12$ cannot do this, since it would give $parallel a - b parallel_oo lt.eq 24 < D$. For a longer edge, an endpoint $i$ within $6$ of a selected parent $a eq.not i$ has already lost the shorter comparison ${ i \, a }$. Its martingale difference is therefore identically zero. For both endpoint contributions to survive, both endpoints would have to be selected; their common comparison coin makes this impossible. We may consequently declare the support of a normalizer using only those endpoint supports whose differences have not vanished. These declarations depend on coins and priorities, not on the functions being Taylor-expanded. Selected $F_j$ themselves have radius less than one parent unit, so their separation is immediate. ◻
]

Figure 1 illustrates the shorter comparison that eliminates a possible interaction between two selected squares.

#figure(
  [#image("fig/separated-integrations.pdf.png", width: 100%)],
  caption: [Figure 1: The geometry in Lemma 9, in parent units. The orange supports meet the two selected squares. When $i eq.not a$ and $j eq.not b$, both endpoints have already lost a shorter comparison before the long comparison ${ i \, j }$. If an endpoint equals its selected center, the proof uses the loss at the other endpoint. Distances and support sizes are schematic; the separating gap is compressed. ],
) <map:separation-figure>

Given the new coins, collect all terms in (3.2) meeting a selected $I_j$ into $H_j$. Replace $H_j$ by

#[#set math.equation(numbering: n => "(3.3)")
 $ log bb(E)_0 \[ e^(H_j) divides upright("field variables outside ") I_j \] . $ <map:conditional-addition>]

All other terms remain. The pure conditional laws in the selected squares are independent given their exterior. Lemma 9 therefore shows, pointwise in the new coins and exterior variables, that these replacements preserve the integrated weight. The output still contains every spin and old auxiliary variable, together with the new coins; replacing the logarithmic weight makes the updated old variables conditionally pure. Their old law is recovered by the conditional tilt $e^(H_j)$.

Allocate a term in (3.3) to its integration parent. Allocate untreated terms to their original parents, splitting a pair term equally between its endpoints. Fix these rules symmetrically once and for all. The allocated terms are functions of the new coins as well as the remaining old field. Center each by its full-plane pure/reference mean. The resulting potentials are denoted $f'_j$. Centering changes only a scalar partition factor, which can depend on the environment but not on any field variable.

#thm([Lemma 3.2.])[
  (Regular linearization).  #emph[The regular map is analytic on a fixed supremum-norm neighborhood of zero after $L$ is fixed. Its derivatives of every prescribed finite order are bounded uniformly in $s$ and depend on a bounded local stencil of children. Its first derivative is 
#[#set math.equation(numbering: n => "(3.4)")
 $ f'_(j \, upright("lin")) = p^(- 1) A_j sum_(i in cal(C)_j) P_(I_j)^0 f_i \, $ <map:linear-formula>]

 where $P_(I_j)^0$ integrates the old reference field inside $I_j$. The transferred sum is already centered. In particular the linear formula is independent of the reveal priorities.]
] <map:linearization>

#proof[
  Since $bb(E)_e U_e = 0$, every coin normalizer starts at degree two in the child potentials. The derivative of (3.3) at zero is conditional expectation. These facts give (3.4). Averaging the transfer in the full-plane reference law gives zero by the centering of each child; averaging $A_j$ also preserves this centering. On a small ball, real conditional exponentials are uniformly bounded above and below. The ordinary power series for the exponential and logarithm consequently give the asserted bounds in the supremum norm. There are only finitely many terms in each stencil, independently of $s$. ◻
]

=== 3.3 Large terms and isolated concentrations <large-terms-and-isolated-concentrations>

A moment estimate cannot assume that every realized potential is small. We now modify the map where large child terms occur. Fix $b > 0$ and independently attach to each child an environmental threshold uniform on $\[ b \, 2 b \]$. A child is a #emph[flag] if its norm exceeds its threshold. The continuous thresholds will also make finite-step moment data continuous in the initial coupling.

Declare a parent inactive when its center is within $10 D$ parent units of a flag. In (3.1), set its $F_j$ to zero and retain its child terms separately. Its coins remain as dummy comparisons in the full local stars. Active selected parents are integrated as before. Every retained term that involves an updated interior variable is included in that integration; retained terms supported entirely outside may simply be left in place. Such a child term has support much smaller than parent spacing and cannot meet two selected squares. Thus the same exact identity applies at the boundary between active and inactive parents.

A further operation controls one isolated concentration of large terms. Put $d_0 = 4 C + 10$. An isolated group is a nonempty set $A$ of flags with child-grid diameter at most $6 d_0$ and with no flag outside $A$ within $100 D$ parent units of $A$. Distinct such groups are separated. Choose one flag in $A$ using independent environmental priorities, and let $j \( A \)$ be its parent. Let

$ G_A = sum_(i : thin "dist" \( i \, A \) lt.eq 3 d_0) f_i \, #h(2em) I_A = I_(j \( A \)) . $

Taking $L$ sufficiently large puts the support of $G_A$ deep inside $I_A$. All these children are in the inactive region. No active integration, or coin normalizer involving active old-field terms, reaches $I_A$.

We remove $G_A$ while retaining all other interactions. Let $B_A$ be the sum of the remaining logarithmic terms that touch $I_A$. With the exterior fixed, replace $G_A$ by

#[#set math.equation(numbering: n => "(3.5)")
 $ R_A = log bb(E)_0 \[ e^(B_A + G_A) divides I_A^c \] - log bb(E)_0 \[ e^(B_A) divides I_A^c \] . $ <map:isolated-ratio>]

Here $I_A^c$ denotes all field variables not updated in $I_A$; new coins are held fixed. The identity

#[#set math.equation(numbering: n => "(3.6)")
 $ bb(E)_0 \[ e^(B_A + R_A) divides I_A^c \] = bb(E)_0 \[ e^(B_A + G_A) divides I_A^c \] $ <map:isolated-exactness>]

proves that the exterior weight is unchanged. The new conditional law inside $I_A$ is tilted by $e^(B_A)$, and the old one by $e^(B_A + G_A)$. In particular, retaining $B_A$ is part of the exact replacement. Allocate $R_A$ to $j \( A \)$, and group all remaining terms at their parents. These special integrations take priority over the preceding rule of carrying inactive terms. Their separation makes their order immaterial.

#thm([Proposition 3.3.])[
  (The local scale map).  #emph[There is a fixed support constant $C$ such that, for all sufficiently large odd $L$ and every $b > 0$, the preceding construction maps a field with spacing $s$ and support/dependence radius $C s$ to a field with spacing $s' = L s$ and support/dependence radius $C s'$. Its outputs are centered, spin-flip even, stationary on the parent grid, and square symmetric in distribution. For a fixed numerical $K$ and a constant $C_L$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ parallel f'_j parallel lt.eq C_L sum_(i : thin parallel s i - s' j parallel_oo lt.eq K s') parallel f_i parallel . $ <map:raw-bound>]

 All replacements preserve exterior-integrated weights exactly, up to the scalar constants removed by centering, and admit the reversals described above. The same formulas and centering constants apply in embedded plane and torus charts.]
] <map:step>

#proof[
  Choose $C$ large enough to contain the comparison, inactivity, and isolation ranges in parent units. Then choose $L$ so large that old supports overhang a parent by less than $1 \/ 10$ parent unit and $100 d_0 \/ L < 1 \/ 10$. Every selection or status check, local allocation, and conditional partition function then uses a fixed parent stencil. Old environment dependence adds only an overhang $C \/ L$ in these units. The new priorities and thresholds are independent and located in the same stencil. Increasing $C$ once, before fixing $L$, covers all these supports. No integration requires environment variables beyond the terms that touch its finite square.
  For any probability kernel $P$ and real bounded $H$, $\| log P e^H \| lt.eq parallel H parallel$. The same inequality and its Lipschitz version bound (3.3) and (3.5) by sums of the input norms. The factors $p^(- 1)$ and the finite numbers of terms depend only on the fixed step. Centering at most doubles this bound, proving (3.7). Spin flip commutes with every operation. The symmetric choices and allocation rules give the stated invariance in distribution. Exactness follows from the normalized decoration, (3.3), and (3.6). Pure conditional kernels in an embedded square depend only on its boundary assignment, so the same identities hold on a torus. We always subtract the same full-plane centering constants, rather than torus means. ◻
]

#thm([Corollary 3.4.])[
  (Local implementation).  #emph[In a finite free chart $W$ with arbitrary exterior field data, the map can be performed away from its boundary so that the resulting specification agrees with the full scale-$s'$ specification in $W$ eroded by $K_1 s'$, for a fixed numerical $K_1$.]
] <map:locality>

#proof[
  Use the full local comparison stars. If a parent’s complete decoration and allocation stencil leaves $W$, set its $F_j$ to zero in every $U_e$ and retain its original child logs separately. Thus every fresh coin with a nontrivial likelihood is inside $W$ and is sampled. Skip integrations whose stencils leave $W$. Include retained terms in any interior integration they meet. Skip special integrations near the boundary and keep active ones separated from them as above. Every operation affecting the eroded chart then uses precisely its full stencil. All remaining discrepancies are supported in the removed boundary layer. The argument applies also to annular charts. ◻
]

=== 3.4 Reversing the map and measuring finite insertions <reversing-the-map-and-measuring-finite-insertions>

#thm([Proposition 3.5.])[
  (A coupling of consecutive fields).  #emph[For each fixed environment, the input and output spin fields of the torus construction, or of the local construction with prescribed old exterior field variables, can be coupled so that they agree outside squares of radius $5 s'$ about marked parent centers. The marks are mutually independent conditional on the environment, independent of the output Gibbs sample, and have local environmental parameters $p_j$ satisfying 
#[#set math.equation(numbering: n => "(3.8)")
 $ p_j lt.eq min {1 \, C_L sum_(i : thin parallel s i - s' j parallel_oo lt.eq K s') parallel f_i parallel} . $ <map:mark-parameter>]

 For any $P gt.eq 1$ and a stationary field with a finite $P$th environmental moment, $bb(E) p_j lt.eq C_L \( bb(E) parallel f_0 parallel^P \)^(1 \/ P)$. These conclusions hold uniformly over the old exterior assignments in the local implementation of Corollary 12.]
] <map:reversal>

#proof[
  First sample the entire output Gibbs field, including the new coins. Independently sample a uniform variable at every candidate parent center, and mark $j$ when it is at most $p_j = 1 - e^(- C_L S_j)$, with $S_j$ the environmental norm sum in (3.8). These parameters depend only on the environment, so the marks have exactly the independence stated in the proposition, before any further conditioning.
  Condition now on the new coins and the common exterior of the updated squares. The ratio of the old conditional density to the new one is bounded below by $e^(- C_L S_j)$, where $S_j$ is the local norm sum in (3.8). This follows from the real log bounds used in Proposition 11; for a special square it applies to the tilt from $B_A$ to $B_A + G_A$. If two laws satisfy $mu gt.eq \( 1 - p \) nu$ and $p > 0$, sample from $nu$, retain that sample with probability $1 - p$, and otherwise sample from $\[ mu - \( 1 - p \) nu \] \/ p$. The Bernoulli decision can be independent of the $nu$ sample; when $p = 0$ the laws agree and the sample is retained. Use this residual resampling in each marked updated square. Conditional factorization over the separated squares proves that the resampled field has the old conditional law. Unused centers keep their dummy marks and cause no change. Each update lies inside its radius-$5 s'$ square. Finally discard the conditionally decorated coins. Their decoration was normalized at each old field, so this recovers the input marginal. Taking environmental expectation in (3.8) gives the last bound. ◻
]

One further consequence of exactness is needed for the variance calculation. For a finite family of labeled potentials at scale $s$, define its normalized insertion density and charge by

$ D_f = frac(exp \( sum_i f_i \), bb(E)_0 exp \( sum_i f_i \)) \, #h(2em) T_s \( f \) = q_s \( D_f \) . $

The following statement concerns the regular map, before flags are introduced, and therefore also its Taylor coefficients at zero.

#thm([Corollary 3.6.])[
  (Charge of a finite insertion).  #emph[For every finite family of input labels, each fixed environment, and each realization of the reveal priorities, the regular map satisfies 
$ T_(L s) \( f' \) = L^(- 1) T_s \( f \) . $

 The identity holds coefficientwise when separate indeterminates are attached to the input labels.]
] <map:insertion-charge>

#proof[
  Only a finite neighborhood of the insertion has nonzero decorations or replacement terms. Every observable outside a larger buffered region has the same expectation against the normalized input and output densities, because the decorations and replacements preserve its unnormalized pairing and the partition function. Apply this to a pure bond tending to infinity. Theorem 6 identifies the limiting pairing with $Q$, so the total lattice charge is unchanged. Dividing by the output scale $L s$ instead of $s$ gives the factor $L^(- 1)$. Scalar centering constants cancel in $D_f$. Analyticity near zero gives the coefficientwise assertion. ◻
]

== 4 One-step moment bounds <sec:moments>

We now estimate the local map in environmental moments. The distinction between the environmental mean and fluctuations is essential: the mean has square symmetry and gains the stronger pure transfer exponent, whereas centered fluctuations gain a square-root saving from finite dependence. Rare large terms require the isolated integrations of Section 3.

Fix the even moment order $P = 40$. For a stationary scale-$s$ field, put

#[#set math.equation(numbering: n => "(4.1)")
 $ X & = \( bb(E) parallel f_0 parallel^P \)^(1 \/ P) \, #h(2em) Y = parallel bb(E) f_0 parallel \, #h(2em) m = bb(E) q_s \( f_0 \) \,\
W & = sum_(i in bb(Z)^2) "Cov" #scale(x: 120%, y: 120%)[\(] q_s \( f_0 \) \, q_s \( f_i \) #scale(x: 120%, y: 120%)[\)] . $ <mom:coordinates>]

All norms are supremum norms over field variables; expectations in (4.1) are environmental. Finite dependence makes the covariance sum finite. Moreover $W gt.eq 0$: if $Lambda$ is a growing square of cell indices, then

$ frac(1, \| Lambda \|) "Var" #h(-0.16667em) (sum_(i in Lambda) q_s \( f_i \)) arrow.r W . $

Primes will denote the same coordinates for the output field at scale $L s$, in particular $q_(L s) = Q \/ \( L s \)$.

#thm([Proposition 4.1.])[
  (One-step estimates).  #emph[One can choose $L$ large, then $b > 0$ small, and finally $x_(*) > 0$ such that for every input field of Section 3 with $X lt.eq x_(*)$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ \| m' - L m \| & lt.eq C_L X^2 \,\
Y' & lt.eq rho Y + C_L \( \| m \| + X^2 \) \,\
X' & lt.eq rho X + C_L \( sqrt(W) + Y \) \, $ <mom:bounds>]

 where $rho < 1$ and all constants are independent of the scale $s$. The constants denoted by $C_L$ may depend on all the fixed step parameters, including the subsequently chosen $b$.]
] <mom:one-step>

We first establish the fluctuation estimate for the linearized map. It is useful to isolate the dimension-free moment fact that permits us to take a supremum over an exponentially large spin boundary.

#thm([Lemma 4.2.])[
  (Moments of finitely dependent Hilbert vectors).  #emph[Let $\( V_i \)_(i in I)$ be centered random vectors in a real Hilbert space, where $\| I \| = N$. Suppose a graph of bounded degree on $I$ is a dependency graph: subfamilies with no graph edge between them are independent. Write $a = max_i \( bb(E) parallel V_i parallel^P \)^(1 \/ P)$ and $S = sum_i V_i$. Then 
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) parallel S parallel^P lt.eq C_P \( bb(E) parallel S parallel^2 \)^(P \/ 2) + C_(P \, upright("dep")) N^(P \/ 2 - 1) a^P . $ <mom:hilbert-bound>]

 The constants do not depend on the dimension of the Hilbert space. In particular, $parallel S parallel_(L^P) lt.eq C_(P \, upright("dep")) N^(1 \/ 2) a$.]
] <mom:hilbert>

#proof[
  Write $P = 2 r$ and expand $parallel S parallel^(2 r) = \( sum_(i \, j) chevron.l V_i \, V_j chevron.r \)^r$. For each tuple of $2 r$ occurrences, connect two occurrences when their indices coincide or are neighbors in the dependency graph. A singleton component has expectation zero by centering and independence. If all components have size at least two and one has size greater than two, there are at most $r - 1$ components. Bounded graph degree gives at most $C_(P \, upright("dep")) N^(r - 1)$ such tuples: choose one index per component, then the remaining indices along a spanning tree. Hölder’s inequality bounds each expectation in absolute value by $a^(2 r)$.
  For the remaining tuples every component is a pair. Independence factors their expectation into contractions of pair covariance operators. Sum these contractions over all pairings and allow the indices belonging to different pairs to be adjacent. The added tuples have merged components and incur the same $C_(P \, upright("dep")) N^(r - 1) a^(2 r)$ error. The unrestricted sum is exactly the Wick expression for $bb(E) parallel Z parallel^(2 r)$, where $Z$ is a centered Gaussian Hilbert vector with the covariance operator of $S$. This operator is positive even though individual cross-covariances need not be positive. Diagonalizing it gives $bb(E) parallel Z parallel^(2 r) lt.eq C_P \( bb(E) parallel Z parallel^2 \)^r = C_P \( bb(E) parallel S parallel^2 \)^r$. Finite-dimensional projection and monotone convergence give the same conclusion in a general Hilbert space. Finally bounded dependence gives $bb(E) parallel S parallel^2 lt.eq C_(upright("dep")) N a^2$. ◻
]

=== 4.1 Fluctuations of the linear map <fluctuations-of-the-linear-map>

Fix a parent, translated to the origin, and transfer first to the boundary of the square of radius $3 L s$. Take the Hilbert norm there with respect to the pure full-plane boundary marginal. The pure buffered density comparison, as stated in [22] Section 2, Proposition “Buffered and small-patch comparisons”, bounds the final conditional transfer from this boundary to $partial I_0$ in supremum norm by a fixed constant times the Hilbert norm. Thus random Hilbert sums control the supremum in (3.4); the factor $p^(- 1) A_0$ costs at most $p^(- 1)$. This factor is fixed independently of $L$.

Let

$ g_i = f_i - bb(E) f_i \, #h(2em) t_i = q_s \( g_i \) . $

Choose the bounded energy representatives $e_i = s P_(C s \, s i) B_(s i)$, enlarging the fixed support constant if necessary; $B_(s i)$ is the bond average of Theorem 6 at $s i$, and the transfer is through a square centered there. Then $Q \( e_i \) = s$, $q_s \( e_i \) = 1$, and $parallel e_i parallel lt.eq C$. Decompose

$ g_i = h_i + t_i e_i \, #h(2em) Q \( h_i \) = 0 . $

Both $h_i$ and $t_i$ are centered in the environment, and $parallel h_i parallel_(L^P \( bb(E) \; oo \)) + parallel t_i parallel_(L^P \( bb(E) \)) lt.eq C X$.

The transferred $h_i$ have supremum norm at most $C L^(- u) parallel h_i parallel$, by Theorem 6. One may first transfer across a square centered at the child and then condition onto the intermediate parent boundary. There are $L^2$ children, with a fixed dependence range in child units. Lemma 16 bounds their sum in $L^P \( bb(E) \; L^2 \)$ by

#[#set math.equation(numbering: n => "(4.4)")
 $ C L^(1 - u) X . $ <mom:stable-fluctuation>]

For the charge part, let $w_i$ be the transfer of $e_i$ to the same intermediate boundary. These are deterministic Hilbert vectors with

#[#set math.equation(numbering: n => "(4.5)")
 $ parallel w_i parallel lt.eq C \/ L \, #h(2em) parallel w_i - w_j parallel lt.eq C L^(- u) quad upright("if ") parallel i - j parallel_oo lt.eq 2 C . $ <mom:energy-vectors>]

For the second estimate, $e_i - e_j$ has zero charge and is supported in a fixed enlargement of one child neighborhood, so the zero-charge transfer estimate applies.

Here the total covariance $W$ gives a sharper bound than the variance of a single child. Put $c \( h \) = "Cov" \( t_0 \, t_h \)$ and let $I = cal(C)_0$. Stationarity and finite dependence give the identity

#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) ∥sum_(i in I) t_i w_i∥^2 & = W sum_(i in I) parallel w_i parallel^2\
 & quad + sum_(i in I \, h\
i + h in I) c \( h \) chevron.l w_i \, w_(i + h) - w_i chevron.r - sum_(i in I \, h\
i + h in.not I) c \( h \) parallel w_i parallel^2 . $ <mom:covariance-regrouping>]

Only a fixed number of $h$ contribute, and $\| c \( h \) \| lt.eq C X^2$. The first term is at most $C W$ because $W gt.eq 0$ and $sum_i parallel w_i parallel^2 lt.eq C$. By (4.5), the second term is $O \( L^(1 - u) X^2 \)$. The last term has only $O \( L \)$ indices $i$ within a fixed distance of the block boundary, so it is $O \( L^(- 1) X^2 \)$. Consequently

#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) ∥sum_(i in I) t_i w_i∥^2 lt.eq C W + C \( L^(1 - u) + L^(- 1) \) X^2 . $ <mom:charge-variance>]

Applying Lemma 16 with $N = L^2$ and $a = C X \/ L$ gives

#[#set math.equation(numbering: n => "(4.8)")
 $ ∥sum_(i in I) t_i w_i∥_(L^P \( bb(E) \; L^2 \)) lt.eq C sqrt(W) + C #scale(x: 120%, y: 120%)[\(] L^(\( 1 - u \) \/ 2) + L^(- 1 \/ 2) + L^(- 2 \/ P) #scale(x: 120%, y: 120%)[\)] X . $ <mom:charge-P>]

The bound has no dependence on the dimension of the spin boundary. Together with (4.4) and the final buffered transfer, it implies

#[#set math.equation(numbering: n => "(4.9)")
 $ parallel f'_(0 \, upright("lin")) \( f - bb(E) f \) parallel_(L^P \( bb(E) \; oo \)) lt.eq eta_L X + C sqrt(W) \, #h(2em) eta_L arrow.r 0 . $ <mom:linear-fluctuation>]

All constants in the limit statement use only the support range and $p$, fixed before $L$.

=== 4.2 Charge, mean, and small Taylor remainders <charge-mean-and-small-taylor-remainders>

The exact normalization of $Q$ makes the first line of (4.2) especially simple. Applying $q_(L s)$ to (3.4) integrates the new selection coins, so that $p^(- 1)$ cancels $bb(E)_0 A_j = p$. Charge is preserved by pure transfer. Therefore

#[#set math.equation(numbering: n => "(4.10)")
 $ bb(E) q_(L s) \( f'_(0 \, upright("lin")) \) = 1 / L sum_(i in cal(C)_0) bb(E) q_s \( f_i \) = L m . $ <mom:linear-charge>]

For the environmental mean, let $macron(f)_i = bb(E)_(upright("aux")) bb(E) f_i$, where the auxiliary expectation uses their independent reference law and leaves the spins fixed. Then $parallel macron(f)_i parallel lt.eq Y$ and $q_s \( macron(f)_i \) = m$. The deterministic spin function $macron(f)_i$ is quarter-turn invariant about its center, because both the environmental distribution and the auxiliary reference law respect this symmetry. The transfer inside $I_0$ integrates all these old auxiliary variables, so its mean is the transfer of $macron(f)_i$. Subtract $m e_i$ from $macron(f)_i$. The difference has zero charge and norm at most $C Y$, since $\| m \| lt.eq C Y$. Its transfer costs $C L^(- w) Y$ per child. The charge part costs $C_L \| m \|$. Thus

#[#set math.equation(numbering: n => "(4.11)")
 $ parallel bb(E) f'_(0 \, upright("lin")) parallel lt.eq C L^(2 - w) Y + C_L \| m \| . $ <mom:linear-mean>]

For use in the last line of (4.2), the simpler general transfer bound also gives

#[#set math.equation(numbering: n => "(4.12)")
 $ parallel f'_(0 \, upright("lin")) parallel_(L^P \( bb(E) \; oo \)) lt.eq eta_L X + C_L \( sqrt(W) + Y \) . $ <mom:linear-total>]

We record how flagged stencils affect low moments. Enlarge a parent stencil to include every comparison, threshold, and isolation check that can affect its output, and put $S = sum_(i in cal(S)) parallel f_i parallel$. Its size depends only on the fixed step. Let $cal(B)$ be the event that it contains a flag. Markov’s inequality and Hölder give

#[#set math.equation(numbering: n => "(4.13)")
 $ bb(P) \( cal(B) \) lt.eq C_(L \, b) X^P \, #h(2em) bb(E) \[ S^r upright(bold(1))_(cal(B)) \] lt.eq C_(L \, b) X^P quad \( 1 lt.eq r lt.eq P \) . $ <mom:bad-low-moments>]

For example, for $r < P$ the second bound follows from $\( bb(E) S^P \)^(r \/ P) bb(P) \( cal(B) \)^(1 - r \/ P)$; for $r = P$ it is immediate. Choose $b$ after $L$ so small that $2 \| cal(S) \| b$ lies in the uniform Taylor neighborhood of Lemma 10. If there is no flag, every child norm is at most $2 b$, and the regular Taylor remainder $R$ satisfies

#[#set math.equation(numbering: n => "(4.14)")
 $ parallel R parallel lt.eq C_L S^2 lt.eq C_L b S . $ <mom:regular-remainder>]

In the second inequality the constant is independent of $b$. The raw bound (3.7) and (4.13) show that the actual map differs from its linearization by $O_L \( X^2 \)$ in first environmental moment. Equations (4.10) and (4.11), together with the charge norm bound of Theorem 6, now prove the first two lines of (4.2), once $L$ is large enough that $C L^(2 - w) < 1$.

The same reasoning does not yet prove a contraction in the $P$th moment: the bound for $r = P$ in (4.13) has size $X^P$, not a higher power. The next argument uses the location of the flags to recover a small factor.

=== 4.3 The contribution of isolated large terms <the-contribution-of-isolated-large-terms>

Consider one contributing child log $f_i$ in the raw output stencil of (3.7). Enlarge the determining stencil to contain the child-grid square of radius $100 D L + 2 C$ about each such index $i$, as well as every status check that can affect the output. In particular, this enlargement contains the full isolation neighborhood of any flag group lying within $2 C$ of a contributing log. If a flag in this stencil $k$ has $parallel i - k parallel_oo > 2 C$, then $f_i$ is independent of that flag, including its fresh threshold. Hence

#[#set math.equation(numbering: n => "(4.15)")
 $ bb(E) \[ parallel f_i parallel^P upright(bold(1))_({ k upright(" is a flag") }) \] = bb(E) parallel f_i parallel^P thin bb(P) \( k upright(" is a flag") \) lt.eq C_b X^(2 P) . $ <mom:independent-flag>]

A union bound over the fixed enlarged stencil makes all such contributions $O_(L \, b) \( X^2 \)$ in $P$th-root norm.

It remains to consider contributions for which every flag in this stencil lies within $2 C$ of $i$. The flags then have diameter at most $4 C$. The inclusion of the full isolation neighborhoods ensures that they form an isolated group of the construction. All logs that can depend on these flags lie within the $3 d_0$ neighborhood transferred as $G_A$. Equivalently, if isolation fails because of a distant additional flag, that flag is independent of the contributing log and (4.15) applies. This is the needed dichotomy; small flag probability alone would not suffice.

For the isolated group, compare (3.5) with the same expression after the other touching logs $B_A$ have been removed. For every probability kernel $P_0$,

#[#set math.equation(numbering: n => "(4.16)")
 $ lr(|log frac(P_0 e^(B_A + G_A), P_0 e^(B_A)) - log P_0 e^(G_A)|) lt.eq 2 parallel B_A parallel . $ <mom:remove-background>]

Each child log in $B_A$ lies outside the group neighborhood and is independent of an actual triggering flag. On the event that this group occurs, its $P$th-root contribution is therefore $O_(L \, b) \( X^2 \)$ by (4.15). The same is true for every other log omitted from the concentrated contribution.

After this removal, Lemma 8 gives

#[#set math.equation(numbering: n => "(4.17)")
 $ ∥log bb(E)_0 \[ e^(G_A) divides I_A^c \] - bb(E)_0 log bb(E)_0 \[ e^(G_A) divides I_A^c \]∥ lt.eq C / L sum_(i : thin "dist" \( i \, A \) lt.eq 3 d_0) parallel f_i parallel . $ <mom:isolated-contraction>]

Indeed $G_A$ lies in a patch of radius a fixed multiple of $s$. If this patch is not concentric with $I_A$, first transfer to the square of radius $2 L s$ about the representative flag, which is contained in $I_A$, and then condition onward. Averaging a positive density cannot increase its log oscillation. Centering increases the oscillation bound by at most a fixed factor.

There are a bounded number of possible flag patterns within a fixed child-radius neighborhood of an anchor, and $O \( L^2 \)$ possible anchoring children for a given output stencil. Separation bounds the number of simultaneous isolated groups in that stencil by a constant independent of $L$. Raising (4.17) to the $P$th power, using the bounded number of logs in each group, and summing over anchors therefore gives

#[#set math.equation(numbering: n => "(4.18)")
 $ parallel upright(bold(1))_(cal(B)) f'_0 parallel_(L^P \( bb(E) \; oo \)) lt.eq C L^(2 \/ P - 1) X + C_(L \, b) X^2 . $ <mom:outlier-output>]

The first constant uses only the fixed child support radius; in particular it is independent of $L$ and $b$. This counting may be done without disjointness of the anchoring events: use their union bound before taking the $P$th root.

For completeness the linear output on the same event satisfies the same bound, with a possibly different fixed constant. Charge each child term to a flag farther than $2 C$ whenever one is present and use (4.15). Otherwise only a bounded child-radius cluster can contribute a dependent large term. The ordinary even transfer to the parent boundary costs $C \/ L$ for that cluster. The same $O \( L^2 \)$ anchor count then gives

#[#set math.equation(numbering: n => "(4.19)")
 $ parallel upright(bold(1))_(cal(B)) \( f'_0 - f'_(0 \, upright("lin")) \) parallel_(L^P \( bb(E) \; oo \)) lt.eq C L^(2 \/ P - 1) X + C_(L \, b) X^2 . $ <mom:outlier-difference>]

Fixed multiplicities from the allocation of terms are included in the constants.

#proof[
  #emph[Completion of Proposition 15.] The last line follows by combining (4.12), (4.14), and (4.19):
  $ X' lt.eq #scale(x: 120%, y: 120%)[\(] eta_L + C L^(2 \/ P - 1) + C_L b #scale(x: 120%, y: 120%)[\)] X + C_(L \, b) X^2 + C_L \( sqrt(W) + Y \) . $
  Choose $L$ large enough that the first two coefficients, and the coefficient $C L^(2 - w)$ in (4.11), leave a strict margin below one. This is possible because $u > 1$, $w > 2$, and $P > 2$. Choose $b$ next to put flag-free stencils in the Taylor neighborhood and make $C_L b$ smaller than the remaining margin. Finally choose $x_(*)$ so that $C_(L \, b) X$ is smaller than that margin for $X lt.eq x_(*)$. Increasing the resulting contraction factor to one common $rho < 1$ proves all three assertions. ◻
]

The mark parameters in Proposition 13 consequently satisfy $bb(E) p_j lt.eq C_L X$. We also record the precise Taylor consequence needed below.

#thm([Corollary 4.3.])[
  (Fourth-order moment substitution).  #emph[Fix finitely many output stencils and a bounded multilinear expression in at most four output potentials in total, allowing pure expectations, environmental expectations, and products of such expectations. The multilinear kernels are uniformly bounded in the scale; constants may depend on these kernels and their fixed stencils. Substitute the regular map’s Taylor polynomial through degree four and retain only total input degree at most four. The resulting environmental moment differs from that of the actual map by $O_L \( X^5 \)$, uniformly in $s$.]
] <mom:taylor-substitution>

#proof[
  On the unflagged stencils, the fifth-order Taylor remainder and Hölder’s inequality give $O_L \( X^5 \)$. On flagged stencils use the raw bound for the actual outputs and (4.13). Products of four fourth-order Taylor polynomials have degree at most $16 < P$, so the same bound controls every term there. Terms of input degree between five and sixteen have expectation $O_L \( X^5 \)$ when $X lt.eq 1$. Products of separately taken expectations obey the identical estimates. ◻
]

== 5 A variance coordinate and its marginal decay <sec:variance>

The estimates of Proposition 15 leave one quantity uncontracted: the variance density $W$ of the energy charges. We now replace $W$ by a polynomial coordinate whose leading change under one scale step is a negative multiple of $W^2$. The normalization of a finite insertion is responsible for that sign.

The coordinate’s quadratic part will be exactly $W$. In a product of two independent centered insertions, the normalizing denominator first affects the variance at degree four; its distant energy contribution is negative. Including the local cubic and quartic insertion coefficients makes this calculation compatible with an exact scale step. We define those coefficients before computing their change.

Throughout this section the spacing is $s$, and $q_s = Q \/ s$. All input potentials are centered under the pure reference law $bb(E)_0$, which includes the auxiliary variables. Environmental expectation $bb(E)$ does not integrate these auxiliary variables; it does integrate the independent priorities and thresholds used to construct the scale map. Write $R_0$ for a fixed dependence range in cell units, enlarged so that disjoint sets of cells at distance greater than $R_0$ use disjoint environment variables and have disjoint declared supports.

=== 5.1 Normalized insertion coefficients <normalized-insertion-coefficients>

For a finite set of cell indices $I$ and real indeterminates $upright(bold(t)) = \( t_i \)_(i in I)$, set

#[#set math.equation(numbering: n => "(5.1)")
 $ F_I \( upright(bold(t)) \) = sum_(i in I) t_i f_i \, #h(2em) cal(T)_I \( upright(bold(t)) \) = q_s (frac(e^(F_I \( upright(bold(t)) \)), bb(E)_0 e^(F_I \( upright(bold(t)) \)))) . $ <var:insertion>]

For each fixed environment these expressions are analytic near the origin. We use only their Taylor coefficients, so no exponential integrability with respect to the environment is required. In particular, since $bb(E)_0 F_I = 0$ and $q_s$ kills constants, the first three homogeneous terms are

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(T)_1 \( F \) & = q_s \( F \) \, & cal(T)_2 \( F \) & = 1 / 2 q_s \( F^2 \) \,\
cal(T)_3 \( F \) & = 1 / 6 q_s \( F^3 \) - 1 / 2 q_s \( F \) bb(E)_0 F^2 . $ <var:charge-expansion>]

Consequently the terms of degrees two, three, and four in the environmental variance of $cal(T)_I$ are, respectively,

#[#set math.equation(numbering: n => "(5.3)")
 $ "Var" \( cal(T)_1 \) \, #h(2em) 2 "Cov" \( cal(T)_1 \, cal(T)_2 \) \, #h(2em) "Var" \( cal(T)_2 \) + 2 "Cov" \( cal(T)_1 \, cal(T)_3 \) . $ <var:variance-expansion>]

All covariances in this section are environmental unless a subscript $0$ is present.

Here is an explicit convention for the coefficients, including repeated indices. For an ordered tuple $bold(i) = \( i_1 \, dots.h \, i_d \)$, give its $d$ occurrences separate indeterminates $t_1 \, dots.h \, t_d$, even when some $i_a$ coincide. Define the symmetric multilinear coefficient

#[#set math.equation(numbering: n => "(5.4)")
 $ C_d \( bold(i) \) = partial_(t_1) dots.h.c partial_(t_d) "Var" [q_s (frac(exp \( sum_(a = 1)^d t_a f_(i_a) \), bb(E)_0 exp \( sum_(a = 1)^d t_a f_(i_a) \)))]\|_(upright(bold(t)) = 0) \, #h(2em) 2 lt.eq d lt.eq 4 . $ <var:polarized-coefficient>]

The derivative in this formula means coefficient extraction using (5.2)–(5.3); thus it is a finite sum of moments. In particular its definition remains valid when the random potentials have only the finite moments assumed in Section 4.

#prodef([Definition 5.1.])[
  (Variance coordinate).  For $H > R_0$, define
  #[#set math.equation(numbering: n => "(5.5)")
   $ v_H = sum_(d = 2)^4 frac(1, d !) sum_(i_2 \, dots.h \, i_d in bb(Z)^2) upright(bold(1))_({ "diam" \( 0 \, i_2 \, dots.h \, i_d \) lt.eq H }) C_d \( 0 \, i_2 \, dots.h \, i_d \) . $ <var:coordinate-formula>]
  The diameter is Euclidean diameter in cell units. The coordinate is real and need not be nonnegative for an arbitrary field.
] <var:coordinate>

The factorial and the ordered slots in (5.5) are the usual Taylor convention. An equivalent definition sums over all ordered tuples in a large cell box, divides by the number of cells, and takes the limit. Stationarity and the finite diameter cutoff give this equivalence. This latter definition also applies when an intermediate allocation is periodic on parent cells: average over complete parent periods before passing to the limit.

#thm([Lemma 5.2.])[
  #emph[For each fixed $H > R_0$, there is $C_H < oo$, independent of $s$, such that 
#[#set math.equation(numbering: n => "(5.6)")
 $ \| v_H - W \| lt.eq C_H X^3 #h(2em) upright("if ") X lt.eq 1 . $ <var:near-W-bound>]

]
] <var:near-W>

#proof[
  The quadratic coefficient is $C_2 \( i \, j \) = 2 "Cov" \( q_s \( f_i \) \, q_s \( f_j \) \)$. Its contribution is therefore exactly $W$, because covariances vanish past the dependence range. Every remaining coefficient has three or four potential occurrences. Their supports fit in a ball of radius $O \( H s \)$. The charge bound in Theorem 6, the boundedness of pure expectation, and Hölder’s inequality bound each coefficient of degree $d$ by $C_H X^d$. There are finitely many tuples with first slot zero and diameter at most $H$. ◻
]

=== 5.2 The change of cutoff <the-change-of-cutoff>

We first change $H$ to $L H$ without changing the field. This calculation contains the sign of the flow. Later we compare this larger cutoff with the coordinate of the output field.

#thm([Lemma 5.3.])[
  (Shell calculation).  #emph[Fix finite constants $A \, B$. If $0 < z lt.eq 1$, $X lt.eq A z$, and $Y lt.eq B z^2$, then 
#[#set math.equation(numbering: n => "(5.7)")
 $ v_(L H) - v_H = - 2 kappa W^2 sum_(y in bb(Z)^2 : med H < \| y \| lt.eq L H) \| y \|^(- 2) + e_H z^4 + O_H \( z^5 \) \, $ <var:shell-formula>]

 where $\| e_H \|$ is bounded by a deterministic function tending to zero as $H arrow.r oo$. The constants may depend on $A \, B$ and the fixed scale-step parameters, but are uniform in $s$.]
] <var:shell>

#proof[
  Decompose $f_i = macron(f)_i + tilde(f)_i$, where $macron(f)_i = bb(E) f_i$. An occurrence of $tilde(f)_i$ has size order one, and an occurrence of $macron(f)_i$ has size order two. Products of total size order at least five contribute $O_H \( z^5 \)$ by Hölder’s inequality. For the remaining coefficients connect two occurrences when their cell indices are within $R_0$. A connected component containing at most four occurrences has bounded diameter. Moreover, a component consisting of a single centered occurrence has zero environmental expectation in every term of the covariance expansion. Thus, once $H$ is large, a nonzero coefficient in the shell has precisely two distant groups: either a centered pair and one mean, or two centered pairs. Each has total size order four. This argument applies also to the products of means subtracted in a covariance.
  Call the two groups $A$ and $B$. Let $1 + g_A$ and $1 + g_B$ be their separately normalized insertion densities, expanded formally in their own indeterminates. Every coefficient of $g_A \, g_B$ is pure centered. Define
  #[#set math.equation(numbering: n => "(5.8)")
   $ T_A = q_s \( g_A \) \, quad T_B = q_s \( g_B \) \, quad h_(A B) = q_s \( g_A g_B \) \, quad c_(A B) = bb(E)_0 \( g_A g_B \) . $ <var:two-group-quantities>]
  Multiplying the two densities and normalizing again gives the exact formal identity
  #[#set math.equation(numbering: n => "(5.9)")
   $ cal(T)_(A union B) = frac(T_A + T_B + h_(A B), 1 + c_(A B)) . $ <var:two-group-identity>]
  If the anchor distance is $l$, Proposition 7 gives, coefficient by coefficient,
  #[#set math.equation(numbering: n => "(5.10)")
   $ h_(A B) = O \( l^(- u) \) \, #h(2em) c_(A B) = l^(- 2) #scale(x: 120%, y: 120%)[\(] kappa T_A T_B + o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $ <var:cross-coefficient-bounds>]
  The estimates carry the product of the norms of the local coefficient functions. All group diameters are bounded, so their constants are uniform in the slots and in $s$.
  The variance of $T_A + T_B$ has no coefficient using both independent groups. Contributions with two cross factors $h_(A B)$ or $c_(A B)$ have shell sum bounded by $C H^(2 - 2 u) z^4 = o_H \( 1 \) z^4$. For a single $h_(A B)$ we use the stronger, symmetric part of Proposition 7. To justify its applicability, first replace the cutoff on total diameter by the cutoff on anchor distance and sum all bounded relative positions inside each group. Environmental factorization turns the required coefficient into a finite sum of bilinear charge pairings of deterministic functions. More explicitly, the two possible local sums, besides $macron(f)_x$, are
  $ D_x & = sum_(\| a \| lt.eq R_0) bb(E) #scale(x: 120%, y: 120%)[\[] q_s \( tilde(f)_x \) tilde(f)_(x + a) #scale(x: 120%, y: 120%)[\]] \,\
M_x & = sum_(\| a \| lt.eq R_0) bb(E) #scale(x: 120%, y: 120%)[\[] tilde(f)_x tilde(f)_(x + a) - bb(E)_0 \( tilde(f)_x tilde(f)_(x + a) \) #scale(x: 120%, y: 120%)[\]] . $
  The pair-plus-mean sector gives pairings $q_s \( D_x macron(f)_y \)$; the pair-plus-pair sector gives $q_s \( D_x M_y \)$, with their exchanges and the fixed scalar factors from Taylor expansion. This list follows by taking the linear charge from one group and the term linear in that group in $h_(A B)$; the other group supplies its mean or its quadratic normalized density. Terms leaving a centered singleton vanish as above. All displayed functions are pure centered, and $D_x \, M_x$ have norm $O \( z^2 \)$. Rotation of the offset sum preserves both its index set and the environment law, while charge is a rotation-invariant scalar. Thus each function is quarter-turn invariant about its anchor. The resulting bound is $C l^(- w) z^4$, whose shell sum is $O \( H^(2 - w) \) z^4 = o_H \( 1 \) z^4$.
  The replacement of diameter by anchor distance affects only strips of bounded thickness at the two ends of the shell. There are $O \( H \)$ possible anchor displacements in these strips, and the unsymmetrized bound $O \( H^(- u) \)$ gives an error $O \( H^(1 - u) \) z^4$. Thus the replacement and its reversal both have vanishing error as $H arrow.r oo$.
  Only the single-$c_(A B)$ contribution remains. Up to size order four it is
  #[#set math.equation(numbering: n => "(5.11)")
   $ - 2 "Cov" #scale(x: 120%, y: 120%)[\(] T_A + T_B \, \( T_A + T_B \) c_(A B) #scale(x: 120%, y: 120%)[\)] . $ <var:normalization-term>]
  Its four occurrences must all be centered; a mean would increase the size order. Write $U = T_(A \, 1)$ and $V = T_(B \, 1)$. These are independent centered random scalars. At bidegree $\( 2 \, 2 \)$,
  #[#set math.equation(numbering: n => "(5.12)")
   $ - 2 "Cov" \( U + V \, \( U + V \) kappa l^(- 2) U V \) & = - 2 kappa l^(- 2) bb(E) \[ \( U + V \)^2 U V \]\
 & = - 4 kappa l^(- 2) bb(E) U^2 bb(E) V^2 . $ <var:quartic-sign>]
  The $o \( 1 \)$ in (5.10) gives $o_H \( 1 \) z^4$ after shell summation, since $L$ is fixed and $sum_(H < \| y \| lt.eq L H) \| y \|^(- 2)$ is bounded.
  We finally spell out the slot count. Put $a_(i j) = "Cov" \( q_s \( f_i \) \, q_s \( f_j \) \)$. Suppose the four labeled slots split into the far pairs ${ 1 \, 2 }$ and ${ 3 \, 4 }$. The coefficient of $t_1 t_2$ in $bb(E) U^2$ is $2 a_(i_1 i_2)$, even when the two cell indices coincide; the occurrences still have distinct indeterminates. The other pair contributes $2 a_(i_3 i_4)$. Hence the polarized normalization contribution is
  $ - 16 kappa \| i_3 - i_1 \|^(- 2) a_(i_1 i_2) a_(i_3 i_4) . $
  There are three partitions of four labeled slots into two unordered pairs. Their sums agree by permutation of the dummy slots, and a tuple in a sufficiently distant shell has at most one such far pairing. The prefactor from (5.5) is $1 \/ 4 !$, so the numerical coefficient is $- 16 dot.op 3 \/ 4 ! = - 2$. For the pairing just displayed, anchoring $i_1 = 0$ and writing $y = i_3$ gives
  $ sum_(i_2) a_(0 i_2) sum_(i_4) a_(y i_4) = W^2 . $
  Both sums are finite, and stationarity makes the second equal to $W$. Changes of the cutoff caused by bounded shifts of anchors have the strip bounds already proved. A change of anchor in the kernel itself also has vanishing error: for bounded $delta$ and $\| y \| asymp H$, $\| \| y + delta \|^(- 2) - \| y \|^(- 2) #scale(x: 120%, y: 120%)[\|] lt.eq C \| delta \| H^(- 3)$, whose shell sum is $O \( H^(- 1) \)$. This proves (5.7). ◻
]

=== 5.3 Passing to the output coordinate <passing-to-the-output-coordinate>

Let $f'_j$ be the output potentials at spacing $L s$, and let $v'_H$ be their coordinate. A finite insertion has the same exterior marginal before and after the regular scale map. The next argument explains why this identity applies to the truncated, locally allocated coordinate.

#thm([Lemma 5.4.])[
  (Compatibility of the coordinate).  #emph[Under the hypotheses of Lemma 20, 
#[#set math.equation(numbering: n => "(5.13)")
 $ v'_H - v_(L H) = e_H z^4 + O_H \( z^5 \) \, $ <var:compatibility-bound>]

 with the same uniformity convention for $e_H$.]
] <var:compatibility>

#proof[
  First use the regular map and retain the child indeterminates. For finitely many labeled inputs its normalized total insertion charge obeys
  #[#set math.equation(numbering: n => "(5.14)")
   $ cal(T)_(upright("out")) = L^(- 1) cal(T)_(upright("in")) $ <var:total-charge-preservation>]
  by Corollary 14. One can also see the normalization directly: the conditional coin likelihood integrates to one at every fixed old configuration, and each conditional integration preserves pairing with a test outside the affected region. Pairing with a distant pure bond identifies $Q$ by Theorem 6. Centering the allocated output logs changes only a scalar, which disappears from the normalized insertion. The factor $L^(- 1)$ in (5.14) is exactly the change from $Q \/ s$ to $Q \/ \( L s \)$.
  This argument holds for every fixed realization of the fresh priorities. Taking environmental variance and then Taylor coefficients therefore preserves complete coefficients, including their mean subtractions. The variance factor $L^(- 2)$ cancels the $L^2$ children per parent when sums are taken per unit area. If an allocation distinguishes positions within a parent, take the area average over complete parent periods. There is no assumption of invariance of individual allocated coefficients under child translations.
  We must compare the two cutoffs. Every output Taylor coefficient uses children in a fixed stencil. Thus classifying a coefficient by parent diameter $H$ rather than child diameter $L H$ changes its classification only when the child diameter lies in a strip of width $O_L \( 1 \)$ about $L H$. Keep together the full covariance coefficient for each fixed tuple of output arguments, including all its mean subtractions, and only then expand its arguments in child slots. The parent cutoff is constant on precisely this grouping. More explicitly, write $R_j$ for the regular output at parent $j$, as a function of its child potentials. A Taylor contribution with $m$ output arguments and child degree $d$, where $2 lt.eq m lt.eq d lt.eq 4$, assigns its $d$ occurrence slots to nonempty blocks $B_1 \, dots.h \, B_m$ and uses the random functions
  #[#set math.equation(numbering: n => "(5.15)")
   $ G_a = D^(\| B_a \|) R_(j_a) \( 0 \) \[ f_(i_b) : b in B_a \] \, #h(2em) 1 lt.eq a lt.eq m . $ <var:taylor-blocks>]
  The directions in this derivative are supported at their indicated child labels; repeated labels are allowed. Multilinear substitution gives the complete polarized covariance coefficient of $G_1 \, dots.h \, G_m$, with its Taylor factors and the single common weight $upright(bold(1))_({ "diam" \( j_1 \, dots.h \, j_m \) lt.eq H })$.
  Discard size orders at least five, at cost $O_H \( z^5 \)$, and connect child slots when their enlarged stencils can share environment variables. A singleton centered child has zero expectation even conditional on the fresh priorities: the Taylor kernel depends on those independent priorities and takes the child function as a multilinear argument. A singleton mean costs size order two. Two components containing means only cannot create a lower-order term through random allocation. At the only relevant order their output is the linear map of Lemma 10, which is independent of priorities; its selection indicators are reference auxiliary variables, integrated by $Q$. In particular its charges are deterministic when its inputs are deterministic. We are therefore left with two distant components of bounded diameter and size order two each.
  Every output argument receiving a child slot lies in that slot’s bounded stencil. These components consequently partition the relevant output arguments into two distant groups as well: each block $B_a$ in (5.15) lies wholly in one component. Apply (5.9) to the two finite lists of output arguments $G_a$, with separate insertion indeterminates $u_a$. The groups are independent in the environment, including their fresh priorities. For their separate charges the formal identity
  $ "Var" #scale(x: 120%, y: 120%)[\(] T_A \( upright(bold(u))_A \) + T_B \( upright(bold(u))_B \) #scale(x: 120%, y: 120%)[\)] = "Var" T_A \( upright(bold(u))_A \) + "Var" T_B \( upright(bold(u))_B \) $
  has zero coefficient involving variables from both groups, regardless of their separate means. Thus the unmixed contribution cancels for each fixed output tuple and each child-block partition, before any sum over output labels. Repeated child labels merely repeat derivative directions inside a group; no within-group independence is used. The remaining terms have a cross factor and hence an $O_L \( H^(- u) \)$ bound from Proposition 7. The strip therefore costs $O_L \( H^(1 - u) \) z^4 = o_H \( 1 \) z^4$. Keeping the covariance subtractions with each coefficient is essential here and is permitted because the cutoff depends only on the tuple of labels.
  Finally apply Corollary 17. For each fixed output tuple, (5.3) is a sum of bounded multilinear expressions in at most four output potentials, including products of separately taken expectations. The charge bound on its fixed-$H$ support makes the kernels uniformly bounded in $s$. The corollary applies to the finite union of all determining stencils, including their status checks. It therefore replaces the regular Taylor output by the actual output and removes child degrees above four with total error $O_H \( X^5 \) = O_H \( z^5 \)$. In particular the highest intermediate degree is $4 dot.op 4 = 16 < P = 40$, so the finite moment assumption suffices. This proves (5.13). ◻
]

#thm([Proposition 5.5.])[
  (Marginal variance flow).  #emph[Fix the scale-step parameters and finite constants $A \, B$. For every sufficiently large fixed $H$, the polynomial coordinate of Definition 18 satisfies, whenever $0 < z lt.eq 1$, $X lt.eq A z$, and $Y lt.eq B z^2$, 
#[#set math.equation(numbering: n => "(5.16)")
 $ v'_H - v_H = - 2 kappa W^2 sum_(y in bb(Z)^2 : med H < \| y \| lt.eq L H) \| y \|^(- 2) + e_H z^4 + O_H \( z^5 \) \, $ <var:flow-formula>]

 where $\| e_H \| arrow.r 0$ as $H arrow.r oo$, uniformly in the lattice scale. Moreover $\| v_H - W \| lt.eq C_H X^3$ for $X lt.eq 1$.]
] <var:flow>

#proof[
  Combine Lemmas 19, 20, and 21. ◻
]

The shell sum tends to $2 pi log L$ as $H arrow.r oo$. Thus the leading coefficient in (5.16) is strictly negative. In the next section the temperature is chosen so that the mean charge stays small enough for this variance decay to continue at every scale.

== 6 Tuning a trajectory with vanishing perturbations <sec:trajectory>

We choose a temperature parameter for which the scale iteration remains small and its potentials tend to zero in environmental moments. This is an existence argument for the iteration. Its relation to the physical critical point will be proved in Section 8.

=== 6.1 Initial couplings <initial-couplings>

Write the dimensionless nearest-neighbor coupling as

#[#set math.equation(numbering: n => "(6.1)")
 $ K \( t \) = 1 / 2 log \( 1 + sqrt(2) e^t \) \, #h(2em) K_e = K \( h + theta xi_e \) \, #h(2em) theta > 0 . $ <traj:couplings>]

Thus $K \( 0 \) = K_0$ and $log \( \( e^(2 K_e) - 1 \) \/ sqrt(2) \) = h + theta xi_e$. The random variables $xi_e$ are the independent symmetric signs of the model. This coordinate will also make duality particularly simple.

Fix an initial spacing $s_0$, large enough for the pure estimates and the scale construction. Allocate each bond to its nearest cell center, splitting ties equally. If $alpha_(i \, e)$ is the resulting nonnegative allocation, then $sum_i alpha_(i \, e) = 1$, and the rule is equivariant under grid translations and square symmetries. Set

#[#set math.equation(numbering: n => "(6.2)")
 $ f_i^(\( 0 \)) = sum_e alpha_(i \, e) \( K_e - K_0 \) b_e \, #h(2em) b_e = sigma_x sigma_y - bb(E)_0 \( sigma_x sigma_y \) . $ <traj:initial-potentials>]

These potentials are pure centered and their sum is precisely the change in the Ising log weight, modulo a spin-independent constant.

#thm([Lemma 6.1.])[
  (Initial moment bounds).  #emph[Let $a = K' \( 0 \) > 0$. For every fixed $T < oo$, uniformly for $\| h \| lt.eq T theta^2$, as $theta arrow.b 0$, 
#[#set math.equation(numbering: n => "(6.3)")
 $ W_0 & = 2 a^2 theta^2 + O \( theta^3 \) \, & X_0 & = O_(s_0) \( theta \) \,\
Y_0 & = O_(s_0) \( theta^2 + \| h \| \) \, & partial_h m_0 \( 0 \, 0 \) & = 2 s_0 a > 0 . $ <traj:initial-bounds>]

 For every fixed cutoff $H > R_0$, $v_(H \, 0) = 2 a^2 theta^2 + O_H \( theta^3 \)$ on such an interval.]
] <traj:initialization>

#proof[
  There are two bonds per lattice site. Periodicity of the allocation therefore gives $sum_e alpha_(0 \, e) = 2 s_0^2$. Since $Q \( b_e \) = 1$,
  $ m_0 = 2 s_0 bb(E) \[ K \( h + theta xi \) - K_0 \] . $
  Independence of distinct bond signs and $sum_i alpha_(i \, e) = 1$ give the exact identity
  $ W_0 = s_0^(- 2) sum_e alpha_(0 \, e) #scale(x: 180%, y: 180%)[\(] sum_i alpha_(i \, e) #scale(x: 180%, y: 180%)[\)] "Var" \( K \( h + theta xi \) \) = 2 "Var" \( K \( h + theta xi \) \) . $
  Taylor expansion of the smooth function $K$ proves the claimed asymptotics and derivative. The finite number of bounded bond functions in a cell gives the bounds on $X_0$ and $Y_0$. Lemma 19 gives the assertion about $v_(H \, 0)$. ◻
]

=== 6.2 The shooting argument <the-shooting-argument>

The charge mean has an expanding linear term $L m$, whereas the variance has a negative quadratic correction. We choose the initial $h$ so that the expanding coordinate never leaves a narrow interval of width proportional to the running variance.

#thm([Theorem 6.2.])[
  (A small critical trajectory).  #emph[Fix the scale-step parameters chosen in Proposition 15 and a sufficiently large initial spacing $s_0$. There are constants $A \, B \, D \, c > 0$, a fixed cutoff $H$, and $theta_0 > 0$ such that, for each $0 < theta < theta_0$, one can choose a deterministic $h = h \( theta \) = O \( theta^2 \)$ with the following property. The iterates at spacings $s_k = s_0 L^k$ satisfy, with $v_k = v_(H \, k)$, 
#[#set math.equation(numbering: n => "(6.4)")
 $ v_k > 0 \, #h(2em) X_k lt.eq A sqrt(v_k) \, #h(2em) Y_k lt.eq B v_k \, #h(2em) \| m_k \| lt.eq D v_k \, $ <traj:invariant-bounds>]

 and 
#[#set math.equation(numbering: n => "(6.5)")
 $ v_k lt.eq frac(1, v_0^(- 1) + c k) . $ <traj:variance-decay>]

 In particular $X_k \, Y_k \, m_k arrow.r 0$. Their uniform bounds over all $k$ can be made arbitrarily small by decreasing $theta_0$.]
] <traj:critical-trajectory>

#proof[
  We first choose constants so that the moment bounds propagate whenever the mean remains between the walls $m = plus.minus D v$. In the estimates of Proposition 15, write $C_1$ for a common constant and retain its contraction constant $rho < 1$. Choose $A$ large enough for the initial $X_0 \/ sqrt(v_0)$ bound and so that
  #[#set math.equation(numbering: n => "(6.6)")
   $ rho A + 2 C_1 < A . $ <traj:A-choice>]
  Choose $D$ next, with
  #[#set math.equation(numbering: n => "(6.7)")
   $ \( L - 1 \) D > C_1 A^2 + 1 . $ <traj:D-choice>]
  Choose $T$ next so that, for every subsequently fixed $H$, the initial ratios $m_0 \/ \( D v_(H \, 0) \)$ at $h = - T theta^2$ and $h = T theta^2$ are strictly below $- 1$ and above $1$ for small $theta$. Lemma 23 permits this choice independently of $H$: the leading denominator is $2 D a^2 theta^2$, whereas the leading numerator divided by $theta^2$ is an affine function of $h \/ theta^2$ with positive slope $2 s_0 a$. Finally choose $B$ sufficiently large that
  #[#set math.equation(numbering: n => "(6.8)")
   $ rho B + C_1 \( D + A^2 \) < B $ <traj:B-choice>]
  and $Y_0 lt.eq B v_(H \, 0)$ for $\| h \| lt.eq T theta^2$ and sufficiently small $theta$, for every subsequently fixed $H$. This last choice is possible from $Y_0 lt.eq C_(s_0) \( 1 + T \) theta^2$ and $v_(H \, 0) \/ theta^2 arrow.r 2 a^2$. The order so far is $A \, D \, T \, B$.
  For data satisfying (6.4), Lemma 19 gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ W = v + O_H \( v^(3 \/ 2) \) \, $ <traj:W-comparison>]
  where the implicit constant includes $A^3$. Use Proposition 22 with $z = sqrt(v)$. Its constants $A \, B$ are now fixed. Choose $H$ sufficiently large that the $e_H v^2$ error is smaller than one quarter of the negative leading term, using the positive limit $2 pi log L$ of the shell sum. Then restrict $v$ to a sufficiently small interval, also within the smallness requirement of Proposition 15, so that (6.9) and the $O_H \( v^(5 \/ 2) \)$ remainder yield
  #[#set math.equation(numbering: n => "(6.10)")
   $ - C_2 v^2 lt.eq v' - v lt.eq - c v^2 \, #h(2em) v' > 0 \, #h(2em) v' \/ v = 1 + O \( v \) . $ <traj:scalar-recursion>]
  Here $c \, C_2 > 0$ are fixed and the smallness interval is uniform in the scale. Positivity follows, for example, by taking $C_2 v < 1 \/ 2$.
  The $X$ estimate now gives
  $ X' lt.eq rho A sqrt(v) + C_1 sqrt(W) + C_1 B v lt.eq #scale(x: 120%, y: 120%)[\(] rho A + C_1 + o \( 1 \) #scale(x: 120%, y: 120%)[\)] sqrt(v) lt.eq A sqrt(v') . $
  The last inequality follows from (6.6) and $v' \/ v arrow.r 1$. Similarly,
  $ Y' lt.eq #scale(x: 120%, y: 120%)[\(] rho B + C_1 \( D + A^2 \) #scale(x: 120%, y: 120%)[\)] v lt.eq B v' $
  by (6.8). At the upper wall, the mean estimate gives
  $ m' gt.eq L D v - C_1 A^2 v > D v' \; $
  at the lower wall it gives $m' < - D v'$. We decreased the smallness interval if necessary to use (6.7) and (6.10). Thus the walls point outward, while both norm bounds propagate up to and including the first exit step.
  We now restrict $theta$ so that the initial interval $\[ - T theta^2 \, T theta^2 \]$ has all the properties fixed above and lies in the uniform smallness range just obtained. On this interval $v_0 = 2 a^2 theta^2 + o \( theta^2 \)$ uniformly. The initial $X$ bound is covered by $A$, because changing $h$ by $O \( theta^2 \)$ does not change the leading $O \( theta \)$ bound on $X_0$. Thus the complete parameter order is $A \, D \, T \, B \, H$, followed by the small interval for $theta$.
  All moment data are continuous in $h$ at every finite number of steps. To check the only possible discontinuities, fix $h$ and couple the constructions for nearby parameters with the same environment, priorities, and threshold variables. At a threshold comparison, the threshold is independent of the data being compared and has a continuous distribution. Equality therefore has probability zero. At finitely many steps only finitely many comparisons enter any specified local stencil, so the corresponding potentials are almost surely continuous at the fixed $h$. The crude real-log bounds of Proposition 11 dominate them on every compact initial parameter interval by a finite deterministic bound at each fixed number of steps. Dominated convergence applies to $X \, Y \, m \, W$ and to the finite polynomial $v_H$.
  Continuity first supplies a closed initial subinterval $I_0$ on which $- 1 lt.eq m_0 \/ \( D v_0 \) lt.eq 1$, with its two endpoints mapped to $- 1$ and $1$. Suppose $I_k$ has been chosen so that all parameters in it satisfy (6.4) through time $k$, and the endpoints lie on opposite time-$k$ walls. The estimates just proved give positive $v_(k + 1)$ and the two norm bounds throughout $I_k$. Its endpoints map strictly outside the opposite time-$\( k + 1 \)$ walls. The intermediate value theorem therefore gives a closed subinterval $I_(k + 1) subset I_k$ on which $- 1 lt.eq m_(k + 1) \/ \( D v_(k + 1) \) lt.eq 1$, with endpoints on the two walls. For example, take a last crossing of the lower wall before a first subsequent crossing of the upper wall. The preceding-time bounds remain valid on this smaller interval. Compactness gives a parameter $h in ⋂_(k gt.eq 0) I_k$. No monotonicity of an iterated coordinate in $h$ is needed.
  For this parameter, (6.10) holds at every step. Taking reciprocals yields
  $ 1 / v_(k + 1) gt.eq 1 / v_k + c \, $
  and proves (6.5). The other conclusions follow from (6.4) and $v_0 = O \( theta^2 \)$. ◻
]

Every constant in Theorem 24 is chosen before a domain or a mesh approximation is specified. The resulting decay need not be summable over scales. Section 7 will use the locality of each scale step to attach a geometric weight to its contribution to a fixed macroscopic crossing test.

== 7 Crossing comparisons along the random trajectory <sec:crossings>

The trajectory of Theorem 24 has $X_k arrow.r 0$, but its decay need not be summable. We prove that every fixed finite collection of macroscopic crossing and passage tests nevertheless has asymptotically the same law as in the pure model. The gain comes from the size of the square changed at one step: small squares can affect a macroscopic test only when several contour passages reach far beyond that square. We first establish uniform conditional bounds for those passages, keeping the marks of each reversal separate throughout the argument.

=== 7.1 Geometric tests and the deterministic inputs <geometric-tests-and-the-deterministic-inputs>

Use the triangulation obtained by drawing the northwest–southeast diagonal in every lattice square, and interpolate the spins affinely. Its zero contours implement the prescribed north–east, south–west resolution up to a matched displacement of order one lattice spacing. A colored path uses vertices of one spin sign and edges of this triangulation. A polygonal corridor is a closed topological rectangle with two opposite boundary arcs designated as gates; its crossing test asks for a colored path between the gates. A polygonal band is the region between two disjoint simple polygons; its circuit test asks for a colored path separating its boundary components. We approximate these sets by subcomplexes of the triangulation, preserving the cyclic order of their marked sides, with error of order one lattice spacing. The polygons are fixed and nondegenerate, and every test has a specified open neighborhood in which spins remain free.

A contour passage between two terminal sets is a contour subarc joining them whose interior lies in the prescribed permitted region. Different passages have disjoint open parameter intervals on each contour; their endpoints may coincide at terminal hits. Thus repeated passages of one contour are counted separately. Cropping at the last visit to the first terminal before the first visit to the second gives this convention. It is the passage convention of [22] Section 5, “Tests, passages, and independent marks”.

For a center $z$, direction $alpha$, and $0 < r < R$, put

$ S_r \( z \, alpha \) = z + e^(i alpha) \[ - r \, r \]^2 \, #h(2em) A \( z \, alpha \; r \, R \) = S_R \( z \, alpha \) \\ "int" S_r \( z \, alpha \) . $

We use three checks:

#[#set math.equation(numbering: n => "(7.1)")
 $ F_4 \( z \, alpha \; r \, R \) & = { upright("at least four passages across ") A \( z \, alpha \; r \, R \) } \,\
H_2 \( z \, alpha \; r \, R \) & = { upright("at least two such passages confined to ") z + e^(i alpha) { "Im" w gt.eq 0 } } \,\
F_1 \( z \, alpha \; r \, R \) & = { upright("at least one passage across ") A \( z \, alpha \; r \, R \) } . $ <cross:checks>]

The straight line in $H_2$ is a confinement wall inside a bulk chart; no spins are pinned on that line. Its terminals are the inner and outer square boundaries. Fixed proportional crops, and fixed unions covering the two possible half-planes, will be included whenever the geometry requires them.

Here are the deterministic inputs from the companion, with their order of limits. For pure critical spins in buffered bulk charts,

#[#set math.equation(numbering: n => "(7.2)")
 $ limsup_(delta arrow.b 0) bb(P)_0 \( F_4 \( r \, R \) \) & lt.eq C \( r \/ R \)^(2 + c_0) \, & limsup_(delta arrow.b 0) bb(P)_0 \( F_1 \( r \, R \) \) & lt.eq C \( r \/ R \)^(c_0) \,\
limsup_(delta arrow.b 0) bb(P)_0 \( H_2 \( r \, R \) \) & = o \( r \/ R \) . $ <cross:pure-input>]

Here $c_0 > 0$, and the ratio is fixed before the mesh limit. These are [22] Section 2, Propositions “Iterated four-passage bound” and “Pure buffered RSW consequences”; Section 5, Proposition “Two bulk passages confined to a half-plane”. The conditional density comparison in [22] Section 2, Corollary “Two collars around an annulus” bounds the law on an annular support under arbitrary pins outside fixed proportional inner and outer collars by $D$ times its pure bulk marginal. The constant $D$ does not grow with the annulus ratio. These inputs also allow translations, rotations, and the fixed crops just specified.

Choose a fixed gap factor $G$ large enough to separate the collars in successive rings. Fix in advance smaller proportional collars that will survive the boundary erosions below. Include in $D$ the comparison constant for those collars and the finite losses for crops and half-plane choices, then choose a large fixed ratio $a$. The bounds in (7.2) give exponents and positive tolerances satisfying

#[#set math.equation(numbering: n => "(7.3)")
 $ p_4 > 2 \, #h(2em) p_h > 1 \, #h(2em) p_1 > 0 \, #h(2em) q_i^0 + tau_i < \( G a \)^(- p_i) quad \( i = 4 \, h \, 1 \) \, $ <cross:slack>]

where $q_i^0$ already includes the conditional density loss. For the middle inequality, first use $o \( a^(- 1) \)$ to obtain strict slack below $\( G a \)^(- 1)$, and only then choose $p_h > 1$ sufficiently close to one. No specified half-plane power law is required. Increase the starting scale so that the same $q_i^0$ bounds hold at finite mesh for all three fixed shapes of ratio $a$. Uniformity in the frame follows by compactness of directions and normalized offsets, using slightly relaxed radii. All these choices precede the choice of the weak-randomness interval.

We also use the following purely geometric implication from [22] Section 5, Lemma “Passages forced by a pivotal square”. For a corridor crossing, band circuit, or one of the three checks $T$, there is a positive geometry scale $a_T$ such that a change confined to a square of radius $b < a_T$ about $z$ can change $T$ only if its common exterior contours supply four passages between scales $b$ and $u$, two half-plane passages between $u$ and $v$, and one passage between $v$ and $a_T$, where

#[#set math.equation(numbering: n => "(7.4)")
 $ u = min { a_T \, max { b \, "dist" \( z \, cal(E)_T \) } } \, #h(2em) v = min { a_T \, max { b \, "dist" \( z \, cal(V)_T \) } } . $ <cross:distances>]

Here $cal(E)_T$ and $cal(V)_T$ are the unions of the sides and vertices of its polygons. In particular $b lt.eq u lt.eq v lt.eq a_T$. The scale $a_T$ is smaller than every relevant side length, terminal separation, and separation of nonincident sides. A fixed number of rings may be omitted near transitions; half-plane rings may be recentered on a side and the last rings near a vertex. For each of the three check shapes, $a_T$ is a fixed small multiple of its inner radius $r$. We choose that multiple small enough that every retained ring has inner radius at most $r \/ 2$ and its collars remain in the prescribed free neighborhood. This implication concerns arbitrary fillings of the changed square and therefore also applies to a square whose values may be chosen after other edits.

#figure(
  [#image("fig/pivotal-rings.pdf.png", width: 100%)],
  caption: [Figure 2: The three ranges of checks forced by a pivotal square, schematically. Blue rings have separated dotted collars; their centers may change between ranges. Orange denotes the edit square, a side, and a vertex of the test, respectively, rather than a domain boundary. The drawing suppresses the actual contour passages and does not depict the literal gap ratios. Enlarged environment neighborhoods fit in these separated collars, and the first retained ring avoids the environment stencil of the inserted mark. ],
) <cross:fig-rings>

=== 7.2 Conditional specifications and one reversal <conditional-specifications-and-one-reversal>

In the remainder of the proof lengths are lattice lengths unless a factor $delta$ is displayed. Write $eta$ for the full environment, including the independent priorities and thresholds used to construct the potentials. A Gibbs variable includes both spins and reference auxiliary variables, and is denoted by $chi$. At level $k$, in a finite free chart $W$, with exterior configuration $zeta$, the specification is

#[#set math.equation(numbering: n => "(7.5)")
 $ mu_(k \, eta \, W)^zeta \( upright(d) chi_W \) = frac(exp F_(k \, W)^zeta \( chi_W \), mu_(0 \, W)^zeta \( exp F_(k \, W)^zeta \)) mu_(0 \, W)^zeta \( upright(d) chi_W \) \, #h(2em) F_(k \, W)^zeta = sum_(j : thin "supp" f_j^(\( k \)) ∩ W eq.not diameter) f_j^(\( k \)) \( chi_W zeta_(W^c) \) . $ <cross:specification>]

The reference specification is pure critical Ising times its independent reference auxiliary variables. We may condition again in a smaller free chart. All suprema below include every exterior spin and auxiliary assignment, so they also bound conditional laws with a random exterior.

Corollary 12 allows the local construction to be performed inside a free chart. The prescribed exterior $zeta$ contains only level-$k$ field variables. If a parent’s complete decoration and allocation stencil leaves $W$, set its $F_j$ to zero in every new coin likelihood and retain its child logs. Keep the full comparison stars and the usual dummy coins. Every fresh coin with a nontrivial decoration is then sampled inside $W$. Perform integrations only when their full stencils lie in $W$. Frozen terms, including terms entering from outside $W$, are included in any integration they meet; the exclusion rule still prevents a term from meeting two integration squares. Skip special integrations near the boundary by the same rule. The resulting identity is exact, and its conditional specification agrees with the full level-$\( k + 1 \)$ specification at distance at least $C_1 s_(k + 1)$ from the boundary. Only after constructing this joint output law do we condition outside the eroded interior, whose exterior may now include fresh coins. Disintegration gives a mixture of level-$\( k + 1 \)$ conditional specifications; each is bounded by the corresponding exterior supremum. This argument uses local conditional identities, and does not condition on a favorable boundary event.

For a check on $A \( z \, alpha \; r \, a r \)$ take the surrounding chart $W = S_(2 a r) \( z \, alpha \) \\ S_(r \/ 2) \( z \, alpha \)$. To iterate the local construction in this fixed chart, allow the available chart at level $k$ to be $W_k = W ⊖ M_1 s_k$, where $⊖ t$ removes points within distance $t$ of its boundary. Choose $M_1$ so that $M_1 s_(k + 1) gt.eq M_1 s_k + C_1 s_(k + 1)$; it may also absorb allocated-support overhangs. Choose $M_0$ much larger than $M_1$ and all stencil constants. Then a check with inner radius $r gt.eq M_0 s_k$ retains the smaller proportional collars chosen above in $W_k$, and successive interior steps retain them as long as the check is still in this range. Raise the first retained radius, if necessary, so that the already fixed ring gaps separate all environment stencils as well as the free charts. The factor $G$ and the slack in (7.3) remain fixed.

By Proposition 13, reversing step $k$ can change spins only in squares of radius

#[#set math.equation(numbering: n => "(7.6)")
 $ b_k = 5 s_(k + 1) \, #h(2em) bb(E) p_(x \, k) \( eta \) lt.eq C_L X_k \, $ <cross:mark-bound>]

centered on the parent grid; increasing the fixed factor five absorbs rounding if necessary. Conditional on $eta$, these Bernoulli marks are mutually independent and independent of the entire new Gibbs sample, including its fresh coins, before any further conditioning. Their parameters depend only on environment variables within a fixed multiple of $s_(k + 1)$ of the center. They can be placed at every candidate center, independently of which integrations were selected. The same upper parameter envelope works for the localized construction.

For clarity, the elementary reason for this domination is a lower likelihood-ratio bound. If $S_x$ is a fixed constant times the sum of child norms in the update stencil, then, conditional on the fresh coins and the common exterior of the integration squares, the before-integration law has density at least $e^(- S_x)$ relative to the after-integration law. It is therefore a mixture with weight $e^(- S_x)$ of the new law and a residual probability law. On a Bernoulli mark of parameter $1 - e^(- S_x)$ use the residual law; otherwise retain the new sample. Uniformly in all boundary data, $1 - e^(- S_x) lt.eq min { 1 \, S_x }$, which gives (7.6). Conditional separation of the update squares permits independent marks, including for the special ratio integrations. Integrating the discarded fresh coins out of the reconstructed decorated law recovers the old spin law with its originally prescribed level-$k$ exterior.

Given a spin configuration $sigma$ and marks $M$ from just one reversal, let $cal(C) \( sigma \, M \)$ be the configurations agreeing with $sigma$ off the marked squares. For a Boolean test $T$, put

#[#set math.equation(numbering: n => "(7.7)")
 $ T^(+) \( sigma \, M \) & = upright(bold(1)) { T \( tilde(sigma) \) = 1 upright(" for some ") tilde(sigma) in cal(C) \( sigma \, M \) } \,\
D_T \( sigma \, M \) & = upright(bold(1)) { T upright(" is not constant on ") cal(C) \( sigma \, M \) } . $ <cross:possibility>]

Both are increasing in the marks, irrespective of spin monotonicity. For a check $T$ of inner radius $r$ in its prescribed annular chart, define

#[#set math.equation(numbering: n => "(7.8)")
 $ B_(k \, T) \( eta \) & = sup_zeta mu_(k \, eta \, W_k)^zeta \( T \) \,\
B_(k \, T)^(+) \( eta \) & = sup_zeta \( mu_(k \, eta \, W_k)^zeta ⊗ pi_(k - 1 \, eta) \) \( T^(+) \) \, $ <cross:envelopes>]

where $pi_(k - 1 \, eta)$ is the independent mark law for reversal of step $k - 1$. At $k = 0$ only the plain bound is used. The supremum is taken before environmental expectation. Only finitely many exterior field variables can enter these finite charts; the auxiliary variables have finite alphabets, so these suprema are measurable finite maxima. Each quantity is a function only of the environment in the chart and a fixed $O \( s_k \)$ neighborhood: these are the supports of the potentials touching the chart and of the mark parameters whose squares meet the test. Mixtures over exterior data need not have this locality; the suprema do.

=== 7.3 The product bound and the location count <the-product-bound-and-the-location-count>

The next lemma supplies the single-step error. Its hypothesis will be proved by induction, first for the three fixed check shapes, and then used for any prescribed polygonal test.

#thm([Lemma 7.1.])[
  (A single-level pivotal bound).  #emph[Let spins have the level-$k$ specification in a free chart, and allow marks from step $k - 1$, of radius $b = 5 s_k$. Suppose the possibility envelope for every retained ring check satisfies $bb(E) B_(k \, T_i)^(+) lt.eq q_i^0 + tau_i$. The rings start at a sufficiently large fixed multiple of $b$ and have disjoint collars enlarged by all spin, mark, and environment stencils. Then the expected conditional supremum of the probability that a fixed test $T$ is changed by these marks is at most 
#[#set math.equation(numbering: n => "(7.9)")
 $ C_T X_(k - 1) min { 1 \, \( s_k \/ a_T \)^c } \, $ <cross:one-step-error>]

 for a fixed $c > 0$. The same bound controls the increase from $T$ to $T^(+)$. Constants are uniform over translates, rotations, and dilates of each of the three check shapes. Any deterministic partial activation of the marks satisfies the same estimates.]
] <cross:single-level>

#proof[
  Activate the finitely many relevant marks in deterministic order. For fixed $eta$ and exterior data, conditioning on all previous marks charges the first instability at $x$ to $p_(x \, k - 1) \( eta \)$ times a pivotal possibility event with that mark omitted. If adding its square first permits two test values, choose a witnessing assignment and revert the new square, retaining all the other assigned values. The resulting pair differs only in that square. Every passage required outside it by the geometric implication is consequently possible using only the previous marks. We may enlarge these to all other marks in their respective ring neighborhoods.
  Consider a retained family of rings with checks $T_1 \, dots.h \, T_m$. For fixed environment, condition off the first ring’s eroded chart $W_(1 \, k)$ and on the marks whose squares do not meet its spin support. The other ring checks are measurable under this conditioning; the remaining spins have the specified conditional Gibbs law, and the remaining marks retain their independent law. Its factor is at most $B_(k \, T_1)^(+) \( eta \)$. Remove each ring in turn. Pointwise in the original exterior data this proves
  #[#set math.equation(numbering: n => "(7.10)")
   $ sup_zeta #scale(x: 120%, y: 120%)[\[] p_(x \, k - 1) \( eta \) bb(P)_(k \, eta)^zeta \( T_1^(+) ∩ dots.h.c ∩ T_m^(+) \) #scale(x: 120%, y: 120%)[\]] lt.eq p_(x \, k - 1) \( eta \) product_(ell = 1)^m B_(k \, T_ell)^(+) \( eta \) . $ <cross:quenched-product>]
  The enlarged ring neighborhoods are disjoint and avoid the environment stencil of $p_(x \, k - 1)$. All factors on the right are therefore functions of disjoint sets of the underlying independent environment variables. Taking their expectation, including that of the inserted mark, gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ bb(E) [p_(x \, k - 1) product_(ell = 1)^m B_(k \, T_ell)^(+)] = bb(E) p_(x \, k - 1) product_(ell = 1)^m bb(E) B_(k \, T_ell)^(+) lt.eq C_L X_(k - 1) product_(ell = 1)^m \( q_(i \( ell \))^0 + tau_(i \( ell \)) \) . $ <cross:annealed-product>]
  This is why conditional exterior suprema, and the omission of rings near the inserted square, are needed. A product of unconditional quenched check probabilities would not justify this equality.
  Retain rings of ratio $a$ with successive inner radii in ratio $G a$ in each of the three ranges in (7.4), illustrated in Figure 2. A fixed number of omissions handles their endpoints, recenterings, and transitions. By (7.3), the product in (7.11), apart from $C_L X_(k - 1)$, is at most
  #[#set math.equation(numbering: n => "(7.12)")
   $ C_T \( b \/ u \)^(p_4) \( u \/ v \)^(p_h) \( v \/ a_T \)^(p_1) . $ <cross:pivotal-power>]
  If a range has too few scales for a retained ring, its bounded factor loss is included in $C_T$.
  It remains to sum over edit locations. Normalize $a_T = 1$ and suppose $b < 1$. The centers with dyadically specified truncated distances $u \, v$ occupy area at most $C_T u v$: near a vertex, the portion of side at distance $O \( v \)$ has length $O_T \( v \)$ and its $u$-neighborhood has that area; away from vertices use the finite total side length. The class $u = v = 1$ covers the remaining interior centers. Since the center grid has spacing comparable to $b$, enlarging each class by one grid cell gives at most $C_T u v \/ b^2$ centers. Its contribution is bounded by
  #[#set math.equation(numbering: n => "(7.13)")
   $ C_T X_(k - 1) frac(u v, b^2) \( b \/ u \)^(p_4) \( u \/ v \)^(p_h) v^(p_1) & = C_T X_(k - 1) \( b \/ u \)^(p_4 - 2) \( u \/ v \)^(p_h - 1) v^(p_1) . $ <cross:area-sum>]
  Put $d = min { p_4 - 2 \, p_h - 1 \, p_1 } > 0$. The three base ratios in the last expression have product $b$; each dyadic class therefore contributes at most $C_T X_(k - 1) b^d$. There are $O_T \( \( 1 + log \( 1 \/ b \) \)^2 \)$ classes. Absorb this factor into $b^(d \/ 2)$ and take $c = d \/ 2$. For $b gt.eq 1$, only $O_T \( 1 \)$ grid centers have squares meeting the test support, and the crude pivotal bound one gives $C_T X_(k - 1)$. This proves (7.9), after restoring $a_T$. Finally $T^(+) - T lt.eq D_T$, and partial activation only reduces the permitted mark parameters. ◻
]

=== 7.4 A bootstrap with geometrically weighted errors <a-bootstrap-with-geometrically-weighted-errors>

#thm([Proposition 7.2.])[
  (Uniform conditional check bounds).  #emph[Fix the preceding geometry and step constants. There is $epsilon_(*) > 0$ such that if the tuned trajectory satisfies $sup_j X_j lt.eq epsilon_(*)$, then, for every check $T_i$ of ratio $a$ and inner radius $r gt.eq M_0 s_k$, 
#[#set math.equation(numbering: n => "(7.14)")
 $ bb(E) B_(k \, T_i) & lt.eq q_i^0 + C_(upright("boot")) sum_(j = k)^(J \( r \)) X_j \( s_j \/ r \)^c \,\
bb(E) B_(k \, T_i)^(+) & lt.eq q_i^0 + C_(upright("boot")) sum_(j = k)^(J \( r \)) X_j \( s_j \/ r \)^c + C_(upright("boot")) X_(k - 1) \( s_k \/ r \)^c #h(2em) \( k gt.eq 1 \) \, $ <cross:plain-bootstrap>]

 where $J \( r \) = max { j : M_0 s_j lt.eq r }$. Both right sides are at most $q_i^0 + tau_i$. The bounds hold uniformly over exterior data, frames, and bulk torus charts, with the suprema interpreted as in (7.8).]
] <cross:bootstrap>

#proof[
  We prove both assertions by strong induction on dyadic ranges of $r \/ s_k$. This induction includes all levels and all frames at once. At a terminal ratio, $M_0 s_k lt.eq r < M_0 s_(k + 1)$, only a bounded number of level-$k$ potentials meet the free annular chart. Put $S$ equal to the sum of their norms. Formula (7.5) implies, for every exterior assignment,
  $ parallel mu_(k \, eta \, W_k)^zeta - mu_(0 \, W_k)^zeta parallel_("TV") lt.eq min { 1 \, 2 S } \, #h(2em) bb(E) S lt.eq C_(upright("boot")) X_k . $
  Together with the pure bound $q_i^0$ this proves the terminal plain estimate. Since $s_k \/ r gt.eq \( M_0 L \)^(- 1)$, increasing the fixed constant puts it in the form (7.14).
  For a nonterminal plain check, perform one step in its free chart. Conditional on the remaining exterior, the new interior has its level-$\( k + 1 \)$ specification. Reversal and (7.7) bound its old probability by the new plain probability plus the probability of instability under marks from step $k$. The new plain check has ratio $r \/ s_(k + 1) = \( r \/ s_k \) \/ L$ and is already covered by induction. Every ring used to bound the instability has inner radius at most $r \/ 2$ and is evaluated at level $k + 1$, with the single-level possibility law there. Its ratio to the level spacing is strictly smaller than $r \/ s_k$, and it is monitored because the first retained radius was chosen above a sufficiently large multiple of $s_(k + 1)$. Its eroded collars remain in the region where the new specification is valid. Thus the inductive possibility bound supplies the hypothesis of Lemma 25. That lemma costs $C X_k \( s_(k + 1) \/ r \)^c$, which is a fixed multiple of $X_k \( s_k \/ r \)^c$. Adding it to the inductive plain estimate gives (7.14).
  Once the plain estimate at a given ratio has been proved, bound its possibility increase using marks from step $k - 1$. Its pivotal rings are now at level $k$, with inner radii at most $r \/ 2$, so their possibility bounds belong to strictly smaller dyadic ranges of $r \/ s_k$. Lemma 25 gives the last term in (7.14). This also proves the terminal possibility estimate. If no monitored ring fits between the required first radius and the cutoff, the test size and edit radius differ by a bounded factor; the crude bounded count of candidate marks gives the same estimate without a recursive call. This starts the induction.
  To close it, the geometric spacing gives
  $ sum_(j = k)^(J \( r \)) \( s_j \/ r \)^c lt.eq frac(M_0^(- c), 1 - L^(- c)) . $
  Choose $C_(upright("boot"))$ to cover the terminal comparison and the two one-level additions, and then choose $epsilon_(*)$ so that this weighted sum and the additional single-level term are smaller than $min_i tau_i$. In each inductive call only these fixed tolerances were used to obtain the pivotal power. This proves both estimates without any assumption about a configuration edited at several levels. ◻
]

We have obtained the passage bounds needed for a test of any fixed geometry. Its geometry changes $C_T$ and $a_T$, but never the smallness threshold: Lemma 25 can now use Proposition 26 on every retained ring.

=== 7.5 Macroscopic and local comparisons <macroscopic-and-local-comparisons>

The elementary limit underlying all the remaining comparisons is

#[#set math.equation(numbering: n => "(7.15)")
 $ sum_(j = 0)^(K - 1) X_j min { 1 \, \( delta s_(j + 1) \/ a_(*) \)^c } arrow.r 0 quad upright("if ") X_j arrow.r 0 \, quad K arrow.r oo \, quad sup_K delta s_K < oo \, $ <cross:weighted-vanishing>]

for every fixed $a_(*) > 0$. Indeed, for $j gt.eq m$, replace $X_j$ by $sup_(j gt.eq m) X_j$. The remaining geometric weights have a uniformly bounded sum, because $s_(j + 1) \/ s_K = L^(j + 1 - K)$; the finitely many indices $j < m$ tend to zero separately. Send $m arrow.r oo$ afterwards. Thus (7.15) uses decay of $X_j$, not its summability.

#thm([Proposition 7.3.])[
  (Quenched torus test comparison).  #emph[Fix a finite family $cal(T)$ of polygonal corridor crossings, band circuits, and the three annular passage checks, in a common buffered planar chart. Take tori of period $M s_K$, where $M$ is a sufficiently large fixed integer, $K arrow.r oo$, and their physical periods $delta M s_K$ stay in a fixed compact interval large enough to contain this chart. If $nu_(0 \, omega)^(cal(T))$ and $nu_(upright("pure"))^(cal(T))$ are the quenched level-zero and pure laws of the whole test vector, then 
#[#set math.equation(numbering: n => "(7.16)")
 $ bb(E)_(upright("env")) parallel nu_(0 \, omega)^(cal(T)) - nu_(upright("pure"))^(cal(T)) parallel_("TV") arrow.r 0 . $ <cross:torus-tv>]

 Such periods can be chosen for every sequence $delta arrow.b 0$.]
] <cross:torus-comparison>

#proof[
  Couple each successive level by the reversal in Proposition 13. After averaging over the environment, the probability that a test changes at step $j$ is at most
  $ C_T X_j min { 1 \, \( delta s_(j + 1) \/ a_T^(upright("phys")) \)^c } . $
  This follows from Lemma 25 and Proposition 26; if the test is no larger than the edit square, use the crude candidate count. Sum over steps and the fixed family. Equation (7.15) makes the sum vanish. At level $K$ only a bounded number of potentials remain on the torus, so their expected total norm is $O_M \( X_K \)$. The same density comparison as in the terminal bootstrap couples this level to the pure torus with expected total variation tending to zero. Gluing the successive couplings and using the union bound proves (7.16). Only the errors of individual reversals were summed; no probability estimate was imposed on the union of their marks.
  The level-zero quenched probabilities depend only on the original bond environment $omega$. Averaging the bounds over the auxiliary algorithm choices therefore leaves exactly the expectation in (7.16). Finally, choosing $K$ by the first scale above a fixed multiple of $delta^(- 1)$ keeps the physical period between two fixed bounds whose ratio is $L$. ◻
]

#thm([Proposition 7.4.])[
  (Uniform local conditional comparison).  #emph[Fix a bounded polygonal geometry with a finite family $cal(T)$ of corridor crossings, band circuits, or the three annular passage checks strictly inside its free buffers; annular windows may have both an inner and an outer free collar. Dilate this geometry by $r$ in lattice units, where $r arrow.r oo$. There is a nonnegative envelope $cal(E)_r \( eta \)$, independent of exterior Gibbs data, such that $bb(E) cal(E)_r arrow.r 0$, uniformly in the translated center and the position of the scale grids. For every exterior assignment the quenched joint test law is within $cal(E)_r \( eta \)$ in total variation of a mixture of pure conditional test laws on a still-buffered interior window. Consequently every positive pure lower bound uniform over those conditional laws transfers with any strictly smaller bound, outside an environment event whose probability tends to zero.]
] <cross:local-comparison>

#proof[
  Choose the terminal spacing $s_K$ comparable to $r$ with a sufficiently small fixed proportionality constant depending on this geometry. Run the local construction through level $K$. The sum of the removed boundary thicknesses is $O \( s_K \)$, so this choice leaves all prescribed buffers free. At each reversal use the conditional-supremum version of (7.10). For example, a measurable upper bound for the error is the sum over inserted centers of their mark parameters times the products of local ring suprema, with the factor one when only the crude count is used. These functions depend on local environment, and bound the error for every exterior assignment before any mixture of those assignments is taken. Summing them over steps and the finite family gives an envelope with expectation at most
  $ C_(cal(T)) sum_(j = 0)^(K - 1) X_j min { 1 \, \( s_(j + 1) \/ r \)^c } . $
  At the terminal scale add $C min { 1 \, sum_j parallel f_j^(\( K \)) parallel }$ over potentials touching the remaining window. Their number is bounded, so this contribution has expectation $O_(cal(T)) \( X_K \)$. Conditional on its exterior, deleting those potentials gives the pure conditional law; integrating the exterior produces the stated mixture. Formula (7.15), with effective mesh $r^(- 1)$, proves the vanishing expectation.
  If every pure conditional law gives an event probability at least $c_(*) > 0$, the perturbed probability is at least $c_(*) - cal(E)_r \( eta \)$ for every initial exterior. Markov’s inequality then transfers any lower bound less than $c_(*)$. In particular this applies to the fixed compatible systems of buffered colored corridors and circuits in [22] Section 2, Proposition “Pure buffered RSW consequences”. To state the result using only the original bond environment, average the envelope over the algorithm choices. The worst level-zero conditional probability itself depends only on the bonds in the window and its incident layer; hence its good-environment event is local. All estimates are uniform in the center, whereas their convergence rate may depend on the fixed geometry. ◻
]

#thm([Corollary 7.5.])[
  (No interior four-passage bottlenecks).  #emph[Let a compact set $K_0$ have fixed positive clearance from the boundary of a finite domain, and fix a sufficiently small physical radius $R > 0$. At the tuned couplings, uniformly in boundary spin assignments, 
#[#set math.equation(numbering: n => "(7.17)")
 $ lim_(r arrow.b 0) limsup_(delta arrow.b 0) bb(E)_(upright("env")) mu_omega #scale(x: 120%, y: 120%)[\(] upright("some ") z in K_0 upright(" has four passages from ") r upright(" to ") R #scale(x: 120%, y: 120%)[\)] = 0 . $ <cross:four-passages-limit>]

 Passages are counted with the parameter-interval convention above.]
] <cross:four-passages>

#proof[
  For a specified center, pack separated rings of ratio $a$ from a fixed multiple of $r$ to a fixed fraction of $R$. At every fixed physical $r > 0$, their inner lattice radii eventually exceed $M_0 s_0$. Condition off their free charts as in (7.10) and use the plain bound of Proposition 26. Their environment neighborhoods are disjoint, so (7.11), without an inserted mark, yields
  $ bb(E)_(upright("env")) mu_omega \( F_4 \( z \; r \, R \) \) lt.eq C \( r \/ R \)^(p_4) $
  in the mesh upper limit, with $p_4 > 2$. The bound already includes the supremum over exterior data of the ambient domain. For fixed $r$, cover $K_0$ by an $r$-grid of $O_(K_0) \( r^(- 2) \)$ centers. Enlarge the inner squares and reduce the outer radius by fixed factors, so four passages about any center imply a grid check. A union bound gives $C_(K_0 \, R) r^(p_4 - 2)$ after the mesh limit, which tends to zero. The finite test family is enlarged only after its mesh limit has been taken; lattice rounding is absorbed by the same fixed crops. ◻
]

All smallness conditions in this section involve the three check shapes and fixed flow parameters. They can therefore be imposed by shrinking one weak-randomness interval before any final domain or test geometry is chosen. The local comparison supplies FK barriers for the identification of the physical threshold. The torus comparison supplies the signed boundary barriers used to identify the limiting interface, and the passage exclusion controls its backtracking.

== 8 Identification of the physical critical point <sec:criticality>

The parameter furnished by Theorem 24 was chosen by its scale evolution. We first identify that parameter by torus duality, and then show that it is the threshold for plus magnetization. The second step uses the uniform local comparison from Proposition 28; self-duality alone will not be used as a criterion for criticality.

Fix a sufficiently small $theta > 0$. Throughout this section the bond couplings and their FK odds are

#[#set math.equation(numbering: n => "(8.1)")
 $ v_e \( h \, omega \) := e^(2 K_e \( h \, omega \)) - 1 = sqrt(2) thin e^(h + theta xi_e \( omega \)) \, #h(2em) h in bb(R) . $ <crit:odds>]

The original signs $xi_e$ are independent and symmetric. Auxiliary random choices used in the scale construction are integrated out whenever we discuss the original spin or FK law.

For a finite graph $G = \( V \, E \)$ and a partition $pi$ of its boundary vertices, write $phi.alt_(G \, h \, omega)^pi$ for the random-cluster measure

#[#set math.equation(numbering: n => "(8.2)")
 $ phi.alt_(G \, h \, omega)^pi \( eta \) = 1 / cal(Z)_(G \, h \, omega)^pi 2^(k_pi \( eta \)) product_(e in E) v_e \( h \, omega \)^(eta_e) \, #h(2em) eta in { 0 \, 1 }^E . $ <crit:fk>]

Here $k_pi \( eta \)$ counts open clusters after identifying the vertices in each part of $pi$. The superscript $upright(w)$ means that all boundary vertices are identified. Unless explicitly stated otherwise, a path uses ordinary lattice edges and does not use these identifications. At fixed environment the measures in (8.2) are monotonic, satisfy FKG, and increase with each edge odds and with boundary wiring. These are the usual finite-volume FK properties; their Edwards–Sokal coupling to the Ising model is given in [11]. We write $phi.alt_(h \, omega)^(upright(w))$ for the infinite-volume wired measure, obtained by the monotone limits of finite wired boxes.

We use the following form of the decision-tree inequality. If $A$ is an increasing event and a decision tree determines $A$ under a finite monotonic measure $phi.alt$, then

#[#set math.equation(numbering: n => "(8.3)")
 $ phi.alt \( A \) #scale(x: 120%, y: 120%)[\(] 1 - phi.alt \( A \) #scale(x: 120%, y: 120%)[\)] lt.eq sum_(e in E) delta_e thin "Cov"_phi.alt \( upright(bold(1))_A \, eta_e \) \, $ <crit:osss>]

where $delta_e$ is the probability that the tree queries $e$ [10] Theorem 1.1. The inequality also holds after averaging over an independent choice of tree. For (8.2), differentiation at fixed environment gives the exact identity

#[#set math.equation(numbering: n => "(8.4)")
 $ frac(upright(d), upright(d) h) phi.alt_(G \, h \, omega)^pi \( A \) = sum_(e in E) "Cov"_(phi.alt_(G \, h \, omega)^pi) \( upright(bold(1))_A \, eta_e \) . $ <crit:derivative>]

Indeed, varying $h$ multiplies the unnormalized weight by $exp \( h sum_e eta_e \)$, apart from its $h$-independent factors. Both (8.3) and (8.4) will be applied before averaging over environments.

=== 8.1 Torus duality fixes the tuned parameter <torus-duality-fixes-the-tuned-parameter>

Let $bb(T)_N = \( bb(Z) \/ N bb(Z) \)^2$, with $N gt.eq 3$. A spin holonomy $alpha = \( alpha_1 \, alpha_2 \) in { 0 \, 1 }^2$ prescribes the signs acquired by a spin after one turn around the two coordinate cycles. Equivalently, choose edge signs $tau_e^alpha$ whose product around every elementary face is $1$ and whose products around the two coordinate cycles are $\( - 1 \)^(alpha_1)$ and $\( - 1 \)^(alpha_2)$. Define

$ Z_alpha \( K \) = sum_(sigma in { - 1 \, 1 }^(bb(T)_N)) exp (sum_(e = { x \, y }) K_e tau_e^alpha sigma_x sigma_y) . $

Changing the representative $tau^alpha$ by a vertex gauge transformation does not change this sum. Write $Z \( K \)$ for the vector of these four partition functions, ordered as $00 \, 10 \, 01 \, 11$, and put $hat(Z) \( K \) = Z \( K \) \/ parallel Z \( K \) parallel_2$.

#thm([Lemma 8.1.])[
  (The four torus partition functions).  #emph[For positive couplings on $bb(T)_N$, $N gt.eq 3$, let the dual couplings satisfy $e^(- 2 K_(e^(*))^(*)) = tanh K_e$. Identify the dual square torus with the original one by a half-lattice translation. Then 
#[#set math.equation(numbering: n => "(8.5)")
 $ Z \( K \) = a \( K \) sans(H) Z \( K^(*) \) \, #h(2em) a \( K \) = product_e sqrt(sinh \( 2 K_e \)) \, #h(2em) sans(H) = 1 / 2 mat(delim: "(", 1, 1, 1, 1; 1, 1, - 1, - 1; 1, - 1, 1, - 1; 1, - 1, - 1, 1) . $ <crit:torus-duality>]

 In particular $sans(H)$ is orthogonal and fixes the pure critical vector. For every holonomy $alpha$, 
#[#set math.equation(numbering: n => "(8.6)")
 $ frac(Z_alpha \( K \), Z_00 \( K \)) = phi.alt_(bb(T)_N \, K) (alpha \( \[ gamma \] \) = 0 upright(" for every open cycle ") gamma) \, $ <crit:torus-ratio>]

 where $\[ gamma \] in \( bb(Z) \/ 2 bb(Z) \)^2$ is the cycle’s winding class and $phi.alt_(bb(T)_N \, K)$ is the untwisted torus FK law.]
] <crit:torus-identities>

#proof[
  We record the finite-volume form of Kramers–Wannier duality [18], including its homology convention; the four-sector matrix also appears in [4] Equations (4)–(5). For $b in \( bb(Z) \/ 2 bb(Z) \)^2$, let
  $ W_b \( K \) = sum_(A subset E \( bb(T)_N \) upright(" even")\
 \[ A \] = b) product_(e in A) tanh K_e . $
  The high-temperature expansion gives
  $ Z_alpha \( K \) = 2^(N^2) product_e cosh K_e sum_b \( - 1 \)^(alpha dot.op b) W_b \( K \) . $
  The low-temperature expansion of the dual spin system with holonomy $beta$ has domain walls of winding class $\( beta_2 \, beta_1 \)$. Each admissible wall configuration comes from two spin configurations, so
  $ Z_beta \( K^(*) \) = 2 e^(sum_e K_(e^(*))^(*)) W_(\( beta_2 \, beta_1 \)) \( K \) . $
  Substitution gives the sign $\( - 1 \)^(alpha_1 beta_2 + alpha_2 beta_1)$ in (8.5). Its prefactor follows from $\| E \( bb(T)_N \) \| = 2 N^2$ and $e^(- K_(e^(*))^(*)) cosh K_e = sqrt(sinh \( 2 K_e \) \/ 2)$. At $K_e = K_0$, the dual couplings equal $K_0$ and $a \( K \) = 1$; hence $sans(H) Z \( K_0 \) = Z \( K_0 \)$. The displayed matrix satisfies $sans(H)^2 = I$.
  For the ratio, expand each edge factor as
  $ e^(K_e tau_e^alpha sigma_x sigma_y) = e^(- K_e) (1 + v_e thin upright(bold(1))_({ sigma_x = tau_e^alpha sigma_y })) . $
  On a chosen open subgraph the spin constraints are consistent exactly when every open cycle has zero evaluation under $alpha$. In that case there are $2^(k \( A \))$ compatible spin assignments. Dividing the resulting sum by its untwisted version proves (8.6). ◻
]

#thm([Proposition 8.2.])[
  (Identification of the tuned parameter).  #emph[The value $h_(*)$ furnished by Theorem 24 is zero.]
] <crit:self-dual-tuning>

#proof[
  Choose a fixed large integer $M$ and torus periods $N_k = M s_k$, so that every complete support and environment-dependence neighborhood of Proposition 11, through scale $k$, embeds in the torus. The primitive environment variables in each such neighborhood have their plane distribution, so each resulting potential has its plane law when expressed in local spin coordinates. Apply the scale construction with iid torus disorder, simultaneously in the four spin holonomies. Let $zeta$ denote the independent algorithmic choices used in this run. In every contractible neighborhood a flat twist has a spin trivialization; changes of trivialization on overlaps are constant spin flips. Every interaction is even, and the auxiliary variables are unchanged by spin flip. The local identities therefore hold in each holonomy, with the same scalar factors removed by centering. In particular, for a common positive factor $c_k \( omega \, zeta \)$ the resulting partition functions satisfy
  $ e^(- S_k) Z_alpha \( K_0 \) lt.eq c_k \( omega \, zeta \)^(- 1) Z_alpha \( K \( h_(*) \, omega \) \) lt.eq e^(S_k) Z_alpha \( K_0 \) \, $
  where $S_k = S_k \( omega \, zeta \)$ can be the largest, over the four holonomies, of the sums of norms of the remaining potentials. There are only $M^2$ cells at the last scale. The trajectory bound $X_k arrow.r 0$ gives $bb(E) S_k lt.eq C M^2 X_k arrow.r 0$. Consequently
  #[#set math.equation(numbering: n => "(8.7)")
   $ parallel hat(Z) \( K \( h_(*) \, omega \) \) - hat(Z) \( K_0 \) #scale(x: 120%, y: 120%)[parallel]_2 arrow.r 0 quad upright("in environmental probability") . $ <crit:torus-terminal>]
  The partition vector itself does not depend on the algorithmic choices, so this conclusion also holds after retaining only the original bond environment.
  The dual odds satisfy $v_(e^(*))^(*) = 2 \/ v_e$. Thus duality sends $\( h \, xi_e \)$ to $\( - h \, - xi_e \)$, with the signs transported along the crossing-edge bijection. This transformation preserves their iid law. By Lemma 30, the normalized duality transform is the orthogonal matrix $sans(H)$, and its pure target is fixed. Therefore (8.7) holds with $- h_(*)$ as well.
  Take $alpha = 10$, and let $A_alpha$ be the increasing event that some open cycle has odd evaluation under $alpha$. Its pure probability $q_N^0$ satisfies
  #[#set math.equation(numbering: n => "(8.8)")
   $ c lt.eq q_N^0 lt.eq 1 - c $ <crit:pure-torus-nondegeneracy>]
  uniformly for large $N$. For the lower bound, a finite chain of pure FK rectangle crossings in a torus band constructs an open cycle winding once horizontally. For the upper bound, the corresponding construction of a closed-dual cycle winding once vertically prevents such an open cycle. The constructions use finitely many embedded rectangles of fixed aspect ratios and the uniform pure FK bounds recalled in [22] Section 2, “Pure buffered RSW consequences”. They can be imposed successively with arbitrary induced boundary wiring; for a closed-dual crossing use the worst, fully wired primal boundary.
  All ratios in (8.6) belong to $\[ 0 \, 1 \]$, so the untwisted coordinate of $hat(Z)$ is at least $1 \/ 2$. Hence (8.7) implies, on the same original signs,
  $ q_(N_k \, omega) \( h_(*) \) - q_(N_k)^0 arrow.r 0 \, #h(2em) q_(N_k \, omega) \( - h_(*) \) - q_(N_k)^0 arrow.r 0 $
  in probability, where $q_(N \, omega) \( h \) = phi.alt_(bb(T)_N \, h \, omega) \( A_alpha \)$. The two convergence statements hold simultaneously by a union bound. Querying every edge in (8.3) and using (8.4) gives $q'_(N \, omega) \( h \) gt.eq q_(N \, omega) \( h \) \( 1 - q_(N \, omega) \( h \) \)$. If $h_(*) eq.not 0$, monotonicity and (8.8) keep this product bounded below on the interval between $- h_(*)$ and $h_(*)$, with probability tending to one. Integration forces an endpoint difference bounded below by a positive constant, whereas both endpoints approach the same $q_(N_k)^0$. This contradiction proves $h_(*) = 0$. ◻
]

=== 8.2 From local barriers to sharpness <from-local-barriers-to-sharpness>

We now use the local crossing comparison at $h = 0$. Put $B_r \( x \) = { y in bb(Z)^2 : \| y - x \|_oo lt.eq r }$ and $B_r = B_r \( 0 \)$. All annuli below have deterministic lattice boundaries; changing them by a bounded incident layer changes none of the estimates.

#thm([Lemma 8.3.])[
  (Local FK barriers).  #emph[There are fixed $a > 1$ and $c_0 > 0$ with the following property. Let $cal(A) \( x \, r \)$ be the lattice annulus $B_(a r) \( x \) \\ B_r \( x \)$, and let $cal(R) \( x \, r \)$ be its ordinary radial crossing event. Call its bond environment good if 
$ phi.alt_(cal(A) \( x \, r \) \, 0 \, omega)^(upright(w)) \( cal(R) \( x \, r \) \) lt.eq 1 - c_0 \, $

 where both boundary components are wired together. The probability that the environment is not good tends to zero as $r arrow.r oo$, uniformly in $x$. Goodness is a function only of the bonds of that annulus and its incident layer. Every good annulus has the same crossing upper bound for all $h lt.eq 0$ and all less wired boundary conditions. In particular, 
#[#set math.equation(numbering: n => "(8.9)")
 $ bb(E) phi.alt_(0 \, omega)^(upright(w)) \( 0 arrow.l.r oo \) = 0 . $ <crit:no-percolation-at-tuning>]

]
] <crit:ring-barrier>

#proof[
  Choose two separated buffered subbands of an annulus of fixed sufficiently large ratio $a$. The pure probability of simultaneous plus and minus spin circuits, one in each subband, is bounded below by a constant $2 c_0 > 0$, uniformly over pins outside the buffers; this is precisely [22] Section 2, Proposition “Pure buffered RSW consequences”. Proposition 28 transfers this lower bound to the random spin law, with probability tending to one over the local environment and uniformly over the boundary pins. Apply it to Edwards–Sokal spins with the wired boundary cluster pinned plus. An ordinary open FK path has a constant spin. Such a path cannot cross both separating circuits of opposite colors. The common triangulation used for spin circuits causes no exception: a nearest-neighbor lattice path can cross a circuit only through a vertex of that circuit. The ordinary radial FK crossing probability is thus at most $1 - c_0$.
  Defining goodness by this wired crossing probability makes it a function of the original local bonds alone. Its failure probability tends to zero after integrating out all algorithmic choices. FK monotonicity gives the assertion for $h lt.eq 0$ and for weaker wiring.
  For completeness, this also rules out percolation at $h = 0$. Pack concentric annuli with a fixed large geometric separation, so that their bond sets, including incident layers, are disjoint. Conditional on all edges off one annulus, its induced FK boundary partition is dominated by full wiring. The probability of an arm crossing $m$ such annuli is therefore bounded, at fixed environment, by the product of their fully wired crossing bounds. Choose the first radius large enough that every bad-annulus probability is at most $1 \/ 2$. Independence of the local bond sets bounds the environmental mean of this product by $\( 1 - c_0 \/ 2 \)^m$. Letting $m arrow.r oo$ in the wired infinite-volume limit proves (8.9). ◻
]

The preceding lemma gives no rate for the probability of a bad annulus. The next proof obtains the rate needed for sharpness by using many independent annuli, before applying the decision-tree inequality.

#thm([Lemma 8.4.])[
  (Subcritical arms).  #emph[For every $b > 0$ and $A > 0$ there is $C_(b \, A) < oo$ such that 
#[#set math.equation(numbering: n => "(8.10)")
 $ bb(E) phi.alt_(B_(2 N) \( x \) \, - b \, omega)^(upright(w)) #scale(x: 120%, y: 120%)[\(] x arrow.l.r partial B_N \( x \) upright(" inside ") B_N \( x \) #scale(x: 120%, y: 120%)[\)] lt.eq C_(b \, A) N^(- A) . $ <crit:annealed-arm>]

 The same bound holds for the ordinary path event under any finite or infinite-volume FK law whose domain contains $B_(2 N) \( x \)$, with arbitrary boundary condition outside that box.]
] <crit:subcritical-arms>

#proof[
  We work at $x = 0$; the estimates are uniform over translates. For every vertex $z in B_(N + 1)$, pack $m_N gt.eq c log N$ separated annuli centered at $z$, with inner radii between $N^(1 \/ 4)$ and a sufficiently small multiple of $N^(1 \/ 2)$. Their full annular graphs lie in $B_(N^(1 \/ 2)) \( z \)$, and their bond neighborhoods are disjoint. Let $eta_N arrow.r 0$ be an upper bound for their bad-environment probabilities, uniformly over all these radii and centers, provided by Lemma 32. Independence for the annuli around one fixed $z$ gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] upright("at least ") m_N \/ 2 upright(" annuli at ") z upright(" are bad") #scale(x: 120%, y: 120%)[\)] lt.eq 2^(m_N) eta_N^(m_N \/ 2) . $
  Let $cal(G)_N$ be the event that fewer than half are bad at every $z in B_(N + 1)$. A union bound, without any independence assertion between distinct centers, gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ bb(P) \( cal(G)_N^c \) lt.eq C N^2 2^(m_N) eta_N^(m_N \/ 2) = o \( N^(- A) \) #h(2em) upright("for every ") A > 0 . $ <crit:environment-exception>]
  Indeed $m_N$ is bounded above and below by constant multiples of $log N$, while $log \( 1 \/ eta_N \) arrow.r oo$.
  On $cal(G)_N$, multiplication of the good-annulus bounds gives, for some fixed $alpha > 0$,
  #[#set math.equation(numbering: n => "(8.12)")
   $ phi.alt_(B_(2 N) \, h \, omega)^(upright(w)) #scale(x: 120%, y: 120%)[\(] z arrow.l.r partial B_(N^(1 \/ 2)) \( z \) upright(" inside ") B_(N^(1 \/ 2)) \( z \) #scale(x: 120%, y: 120%)[\)] lt.eq C N^(- alpha) \, #h(2em) z in B_(N + 1) \, quad h lt.eq 0 . $ <crit:uniform-short-arm>]
  For large $N$ all these small boxes lie within $B_(2 N)$. Induced boundary conditions are harmless because the annular bounds already use full wiring. The event $cal(G)_N$ works simultaneously for every $h lt.eq 0$ by monotonicity.
  Fix such an environment and write
  $ q_omega \( h \) = phi.alt_(B_(2 N) \, h \, omega)^(upright(w)) \( 0 arrow.l.r partial B_N upright(" inside ") B_N \) . $
  Choose an integer $ell$ uniformly between $N \/ 4$ and $N \/ 2$, and explore all ordinary open clusters in $B_N$ that meet the layer $partial B_ell$. This determines the event defining $q_omega$: every path from $0$ to $partial B_N$ meets that layer. The exploration uses only ordinary edges in $B_N$, although its law is the marginal of the wired measure on $B_(2 N)$. This is the layer exploration of [10] Lemma 3.2 and its proof.
  An edge is queried only if an endpoint lies on the chosen layer or has an ordinary open path to it. For a fixed endpoint $z$, the probability, over $ell$, that the layer is within distance $N^(1 \/ 2)$ of $z$ is at most $C N^(- 1 \/ 2)$. Otherwise such a path forces an arm of length $N^(1 \/ 2)$ at $z$. Thus (8.12) bounds the maximum averaged revealment by
  $ max_e delta_e lt.eq C #scale(x: 120%, y: 120%)[\(] N^(- 1 \/ 2) + N^(- alpha) #scale(x: 120%, y: 120%)[\)] lt.eq C N^(- d) \, #h(2em) d = min { 1 \/ 2 \, alpha } > 0 . $
  Edges outside $B_N$ have revealment zero. Their covariances are nonnegative, so retaining them in the derivative sum only strengthens the bound obtained from (8.3). Equations (8.3)–(8.4) yield, for all $h lt.eq 0$,
  #[#set math.equation(numbering: n => "(8.13)")
   $ q'_omega \( h \) gt.eq c N^d q_omega \( h \) \( 1 - q_omega \( h \) \) . $ <crit:sharp-differential>]
  Moreover (8.12) at $z = 0$ gives $q_omega \( 0 \) lt.eq C N^(- alpha)$. For sufficiently large $N$, integrating the derivative of $log \( q_omega \/ \( 1 - q_omega \) \)$ over $\[ - b \, 0 \]$ gives
  $ frac(q_omega \( - b \), 1 - q_omega \( - b \)) lt.eq frac(q_omega \( 0 \), 1 - q_omega \( 0 \)) e^(- c b N^d) lt.eq e^(- c b N^d) . $
  Combining this estimate with (8.11) proves (8.10). In a larger graph, condition outside $B_(2 N) \( x \)$ and dominate the induced boundary partition by full wiring. This proves the final assertion, including infinite-volume limits. ◻
]

=== 8.3 The magnetization threshold <the-magnetization-threshold>

The preceding results now identify the physical temperature. Put $m_theta \( h \) = bb(E) phi.alt_(h \, omega)^(upright(w)) \( 0 arrow.l.r oo \)$. Edwards–Sokal identifies this with the environmental mean of the infinite-volume plus magnetization. Under the plus boundary convention of Section 1, the finite FK graph contains all bonds meeting the spin box, and all exterior endpoints are wired and assigned spin plus. Shifting the wired boundary by one lattice layer sandwiches this law between the usual wired-box laws, so their infinite-volume limits agree.

#thm([Theorem 8.5.])[
  (Physical critical point).  #emph[For every sufficiently small fixed $theta > 0$, 
$ m_theta \( h \) = 0 quad \( h lt.eq 0 \) \, #h(2em) m_theta \( h \) > 0 quad \( h > 0 \) . $

 Consequently, for every sufficiently small $epsilon.alt > 0$, the critical inverse temperature in Theorem 2 is the unique positive solution of 
#[#set math.equation(numbering: n => "(8.14)")
 $ #scale(x: 120%, y: 120%)[\(] e^(2 beta_c \( epsilon.alt \) \( 1 + epsilon.alt \)) - 1 #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] e^(2 beta_c \( epsilon.alt \) \( 1 - epsilon.alt \)) - 1 #scale(x: 120%, y: 120%)[\)] = 2 . $ <crit:physical-equation>]

 The plus magnetization is zero at this temperature.]
] <crit:physical>

#proof[
  Lemma 32 and monotonicity give $m_theta \( h \) = 0$ for $h lt.eq 0$. Fix $h = b > 0$. Planar FK duality replaces the edge odds by $2 \/ v_e$, so the dual environment has the law of the model at $- b$. In finite domains the dual boundary condition is dominated by full wiring. Taking limits, the dual of the infinite-volume wired primal law therefore satisfies the local annealed arm bounds of Lemma 33.
  A closed-dual circuit surrounding $B_M$ whose farthest distance from the origin lies in $\[ R \, 2 R \)$ has diameter at least $c R$. It consequently contains an ordinary dual arm of length $c' R$ from some dual vertex in $B_(2 R)$, with absolute positive constants $c \, c'$. There are $O \( R^2 \)$ possible vertices. Using (8.10) with any $A > 2$ and summing over dyadic $R gt.eq c'' M$ gives
  #[#set math.equation(numbering: n => "(8.15)")
   $ bb(E) phi.alt_(b \, omega)^(upright(w)) #scale(x: 120%, y: 120%)[\(] upright("a closed-dual circuit surrounds ") B_M #scale(x: 120%, y: 120%)[\)] lt.eq C_(b \, A) sum_(j gt.eq 0) \( 2^j M \)^(2 - A) arrow.r 0 . $ <crit:dual-circuits>]
  Here the arm bound is applied in a box of radius comparable with $R$, with a further collar of comparable width; its validity for arbitrary exterior boundary conditions was part of Lemma 33.
  If every open cluster meeting $B_M$ were finite, their union would be finite. It contains $B_M$, and its lattice edge boundary consists of closed edges. Connecting the union through the box, if necessary, does not change its exterior boundary. Its outer dual boundary therefore contains a closed-dual circuit surrounding $B_M$. The complement of the event in (8.15) thus forces some vertex of $B_M$ to belong to an infinite open cluster. For large $M$ this has positive joint probability. The joint environment–wired FK law is translation invariant, whence
  $ 0 < bb(E) phi.alt_(b \, omega)^(upright(w)) \( B_M arrow.l.r oo \) lt.eq \| B_M \| thin m_theta \( b \) . $
  This proves positivity for every $b > 0$.
  Finally, the left side of (8.14), viewed as a function of $beta gt.eq 0$, is continuous and strictly increasing from zero to infinity. Let $beta_(*)$ be its unique solution, and set
  $ v_plus.minus = e^(2 beta_(*) \( 1 plus.minus epsilon.alt \)) - 1 \, #h(2em) theta_epsilon.alt = 1 / 2 log v_(+) / v_(-) . $
  Then $v_plus.minus = sqrt(2) e^(plus.minus theta_epsilon.alt)$. Comparison with the constant couplings gives $K_0 \/ \( 1 + epsilon.alt \) lt.eq beta_(*) lt.eq K_0 \/ \( 1 - epsilon.alt \)$, so $theta_epsilon.alt arrow.r 0$ as $epsilon.alt arrow.r 0$. The model at $beta_(*)$ therefore falls within the result just proved and has zero plus magnetization. The same holds below $beta_(*)$ by monotonicity. For $beta > beta_(*)$ both log odds increase, and
  $ b := min_(s in { - 1 \, 1 }) log frac(e^(2 beta \( 1 + s epsilon.alt \)) - 1, e^(2 beta_(*) \( 1 + s epsilon.alt \)) - 1) > 0 . $
  The bonds at $beta$ dominate those of (8.1) with parameters $\( b \, theta_epsilon.alt \)$ in the same sign environment. Their plus magnetization is consequently positive. This proves $beta_(*) = beta_c \( epsilon.alt \)$ with the normalization and plus boundary convention of Theorem 2. ◻
]

== 9 From bulk comparisons to quenched curves <sec:curves>

We now work at the physical critical point identified in Theorem 34. The bulk comparisons of Section 7 will yield couplings between the target interface and pure interfaces in slightly displaced domains. The pure marginal in each coupling will remain fixed after conditioning on the environment. This conditional marginal property is what turns the geometric argument into convergence of quenched probability measures. In this section, unsubscripted probabilities and expectations include the sampled spins and coupling randomness as well as the environment.

Fix the marked Jordan domain and an admissible approximation from Theorem 2, and write

$ D_n = delta_n D_(V_n) \, #h(2em) Gamma_n = delta_n gamma \( P \) . $

The contour–spin correspondence gives a nearest-neighbor ferromagnetic spin law with the actual exterior pins induced by the fixed completion $P_(o \, n)$. Every bond meeting $V_n$, including a bond crossing its boundary, retains its prescribed coupling. The correspondence is the bijection proved in Lemma 1. Thus the conditional law of $Gamma_n$ given the original environment $omega$ is exactly $Q_(n \, omega)$.

Along a subsequence the designation of the two signed boundary arcs is fixed. Denote the open plus and minus arcs of $partial D$ by $I_(+)$ and $I_(-)$. All paths and crossings below use the fixed triangulation and resolution convention of Section 7. Changing between its interpolated contour and the prescribed locally resolved curve changes $d_(upright("curv"))$ by $O \( delta_n \)$: match occupied edges in their traversal order, and match the connections inside the vertex disks.

=== 9.1 A conditional comparison device <a-conditional-comparison-device>

We first isolate the probability argument used to transfer a finite family of boundary barriers. For vectors in ${ 0 \, 1 }^m$, the symbol $prec.curly.eq$ denotes coordinatewise order, and for their laws it denotes the existence of a coupling supported on that order.

#thm([Lemma 9.1.])[
  (Conditioning and gluing at fixed environment).  #emph[Let $lambda$ be a deterministic law on a finite set, let $mu_omega$ be an environment-dependent law on another finite set, and let $U$ and $W$ be maps from these sets to ${ 0 \, 1 }^m$. Let $p$ and $q_omega$ be laws of $\( e \, v \) in { 0 \, 1 } times { 0 \, 1 }^m$, where $p$ is deterministic and $p \( e = 1 \) gt.eq a > 0$. Suppose that 
$ cal(L)_lambda \( U \) prec.curly.eq p \( v in dot.op divides e = 1 \) \, #h(2em) q_omega \( v in dot.op divides e = 1 \) prec.curly.eq cal(L)_(mu_omega) \( W \) $

 whenever $q_omega \( e = 1 \) > 0$. Put $epsilon \( omega \) = parallel p - q_omega parallel_("TV")$. There is a measurable family of couplings $pi_omega$ of $lambda$ and $mu_omega$ such that 
#[#set math.equation(numbering: n => "(9.1)")
 $ bb(E)_(upright("env")) thin pi_omega { U prec.curly.eq.not W } lt.eq 6 / a bb(E)_(upright("env")) epsilon \( omega \) . $ <curv:gluing-error>]

 In particular, the first marginal under $pi_omega$ is $lambda$ for every environment, including those on which the comparison fails.]
] <curv:conditional-gluing>

#proof[
  On ${ epsilon lt.eq a \/ 2 }$, the second conditioning probability is at least $a \/ 2$. Subtracting the two conditional probability fractions gives
  $ parallel p \( v in dot.op divides e = 1 \) - q_omega \( v in dot.op divides e = 1 \) #scale(x: 120%, y: 120%)[parallel]_("TV") lt.eq frac(4 epsilon \( omega \), a) . $
  Couple these two vectors maximally and glue this coupling to the two order couplings. Extend the outer vectors to samples with laws $lambda$ and $mu_omega$ by their conditional laws given $U$ and $W$. The outer vectors are ordered unless the two middle vectors disagree. On ${ epsilon > a \/ 2 }$ take any coupling with the same outer marginals. Markov’s inequality bounds this exceptional environmental probability by $2 bb(E)_(upright("env")) epsilon \/ a$, proving (9.1). All sets are finite. The coupling matrices and subsequent conditional probabilities can be selected measurably; for instance, fix an enumeration of feasible basic solutions of the finite coupling constraints and choose the first available one. ◻
]

The lemma compares conditional laws for each fixed environment. It does not condition the environment on $e = 1$; doing so would change the environmental distribution and lose the marginal property needed at the end of the proof.

=== 9.2 Displaced domains and finite boundary barriers <displaced-domains-and-finite-boundary-barriers>

We record the precise geometric constructions from the companion that will be used. They are deterministic statements about Jordan domains, signed paths, and the prescribed triangulation.

Fix a Schoenflies homeomorphism $Psi$ of the plane taking the unit disk to $D$, the points $1 \, - 1$ to $a \, b$, and the upper semicircle to $I_(+)$. For each sufficiently small displacement $h > 0$, there are polygonal marked Jordan domains $A_h^(-)$ and $A_h^(+)$, with marks $a_h^plus.minus \, b_h^plus.minus$ tending to $a \, b$, whose boundary parametrizations tend uniformly to that of $D$ as $h arrow.b 0$. The superscript indicates the favored spin sign. For $A_h^(-)$, its middle plus arc is displaced outside $D$, and the rest of its boundary is displaced inside $D$, with transitions near the marks. There are two disjoint polygonal cutting corridors $C_h^(-)$ and $C_h^(+)$, with slightly larger disjoint reveal regions, having the following properties:

+ The minus corridor and its reveal region lie outside $overline(A_h^(-))$. A lengthwise minus crossing separates the minus boundary of $D_n$ from the common central region.
+ The plus corridor and its reveal region lie outside $overline(D)$. A lengthwise plus crossing separates the plus boundary of $A_h^(-)$ from that region.
+ The corridor caps extend across the boundary portions they cut. All the stated separations have positive clearance at fixed $h$ and persist for all sufficiently large $n$.

An #emph[allowed plus strip] is a polygonal topological rectangle whose closure lies in $A_h^(-)$ on the central side of the cuts, disjoint from the reveal regions, whose two end gates lie outside $overline(D)$ on its enlarged plus side. Every contact of the strip with $partial D$ is on $I_(+)$, away from $a \, b$, and the strip lies in $Psi \( { rho < 1 + h \/ 2 } \)$, with fixed positive clearance from that outer bound. A crossing in the target is defined after filling the portions outside $D_n$ virtually with plus. For $A_h^(+)$ the construction is obtained by interchanging plus and minus. These objects, including the requirements on strip gates, are constructed in [22] Section 7, “Fixed displaced domains and their boundary incidences”.

Figure 3 shows the distinction between the corridor caps and the strip gates. The plus corridor crosses the minus shoulders of $A_h^(-)$, whereas the strip gates lie inside its enlarged plus portion. These placements give the ordered incidences used below.

#figure(
  [#image("fig/boundary-squeeze.pdf.png", width: 100%)],
  caption: [Figure 3: Boundary squeeze favoring minus, in fixed Schoenflies coordinates. (a) The dashed circle is $partial D$; the shaded comparison domain has blue plus and orange minus boundary arcs. The blue corridor $C_h^(+)$ lies outside $D$, with caps crossing the minus shoulders of $partial A_h^(-)$; the orange corridor $C_h^(-)$ lies outside $A_h^(-)$ and screens the minus arc of $D$. Dotted bands are disjoint reveal regions. (b) An allowed plus strip $S$ lies on the central side of both cuts. Its gates $g_a \, g_b$ are outside $D$, while its closure remains inside $A_h^(-)$ and avoids the reveal regions. The thin blue line inside $S$ illustrates a plus spin crossing. The drawing shows the preliminary topological configuration; the proof uses close polygonal approximations in the physical plane. Displacements and widths are schematic. ],
) <curv:boundary-squeeze>

The boundary hypothesis in Theorem 2 is exactly what is needed here. If $c$ parametrizes $partial D$, then $phi.alt_n compose c$ converges uniformly to $c$. Winding numbers therefore determine the same inside and outside on each compact set disjoint from $partial D$, and the marked boundary order gives the same signed-arc incidences away from the marks. Fine teeth of $D_n$ remain in a shrinking boundary collar and cannot enter any of the fixed clearances above. Virtual filling records a geometric crossing only: it changes neither a coupling nor an exterior pin. The corner check in [22] Section 7, paragraph following “Fixed-geometry boundary squeeze” ensures that such a signed path cannot cross the target resolved contour, including at reflex corners.

#thm([Proposition 9.2.])[
  (Quenched transfer of a finite strip family).  #emph[Fix $h > 0$ and a finite family of allowed plus strips in $A_h^(-)$. Let $Sigma_(h \, n)^(-)$ have the pure Dobrushin spin law in an ordinary lattice approximation of $A_h^(-)$, and let $Sigma_(n \, omega)$ have the target spin law. These samples admit couplings conditional on $omega$ whose two marginals are the stated laws and for which 
#[#set math.equation(numbering: n => "(9.2)")
 $ bb(P) #h(-0.16667em) (upright("every strip crossed by plus in ") Sigma_(h \, n)^(-) upright(" is crossed by plus in ") Sigma_(n \, omega)) = 1 - o \( 1 \) . $ <curv:strip-order>]

 The probability in (9.2) includes environment and coupling randomness. The pure marginal conditional on $omega$ is its deterministic Dobrushin law. The corresponding assertion holds for minus strips in $A_h^(+)$.]
] <curv:strip-transfer>

#proof[
  Put the corridors, their reveal regions, and the finitely many strips inside a torus chart with a fixed positive external buffer. Choose a torus period allowed by Proposition 27. In this chart use the same bond environment as the target; complete the torus with independent bonds. Write $E_h$ for the event that both cutting corridors have their prescribed lengthwise colored crossings, and write $V$ for the vector of ordinary plus crossings of the strips on the torus. The pure buffered crossing bounds give
  $ p_n \( E_h \) gt.eq a_h > 0 \, #h(2em) p_n = cal(L)_0 \( upright(bold(1))_(E_h) \, V \) \, $
  for all sufficiently fine meshes. Here $a_h$ may depend on the fixed geometry. With $q_(n \, omega)$ denoting the corresponding quenched torus vector law, Proposition 27 gives
  #[#set math.equation(numbering: n => "(9.3)")
   $ bb(E)_(upright("env")) parallel q_(n \, omega) - p_n parallel_("TV") arrow.r 0 . $ <curv:middle-tv>]
  At this stage the environmental expectation includes the independently added torus bonds.
  We verify the two order comparisons needed for Lemma 35. In either torus, conditional on $E_h$, reveal the prescribed crossing nearest the exterior side of each corridor. The stopped reveal of [22] Section 6, Lemma “Reveals with a monochromatic facing boundary”; Section 7, proof of “Fixed-geometry boundary squeeze” leaves only pins of the prescribed color facing the unrevealed center. The transcript already determines crossing existence, so no additional conditioning on $E_h$ remains in that center. Disjoint reveal regions allow both explorations.
  First compare the pure Dobrushin law in $A_h^(-)$ with the conditioned pure torus. The revealed plus path is an upper plus pin against a lower free spin. It screens the plus arc of $A_h^(-)$; every accessible remaining boundary incidence is a lower minus pin against an upper free spin. Meetings of a cut and boundary give upper plus against lower minus. The minus reveal is outside $A_h^(-)$. Ferromagnetic boundary comparison therefore puts the pure-domain strip vector below $p_n \( V in dot.op divides E_h \)$.
  Next compare the conditioned random torus, as the lower law, with the target, as the upper law. They have identical couplings on every bond in their common free region. The minus path screens the target minus arc. The remaining boundary incidences, with upper entry first, are exactly
  $ \( + \, upright("free") \) \, #h(2em) \( upright("free") \, - \) \, #h(2em) \( + \, - \) . $
  Each comparison follows by conditioning a free spin to its extremal value and using the nearest-neighbor ferromagnetic order. This also explains why no comparison between different random bond strengths is needed. The source’s geometric incidence check, including the corridor caps, shows that these are all incidences encountered by the common components containing the strips. A nearest-neighbor edge cannot cross the interior of a separating triangulated diagonal. Virtual plus values outside $D_n$ give the same order for portions of a strip that exit and reenter the target. Thus $q_(n \, omega) \( V in dot.op divides E_h \)$ is below the target strip vector.
  Apply Lemma 35 with $a = a_h$ and (9.3). It gives (9.2), extending the strip vectors to the complete spin samples with their conditional laws. Finally average over the extra torus bonds while retaining the original environment. The conditional pure marginal is unchanged, and the target marginal never used the extra bonds. Interchanging the signs proves the other assertion. ◻
]

=== 9.3 The geometric curve inputs <the-geometric-curve-inputs>

For completeness, we state the three further conclusions of the companion’s boundary argument in the form needed here. Their geometric parts apply to marked target interfaces with the designated boundary signs and noncrossing signed barriers; they assume no symmetry of the target spin law.

#thm([Lemma 9.3.])[
  (Finite strips and limiting barriers).  #emph[For either sign of displacement, the continuum laws $upright("SLE")_3 \( A_h^plus.minus \; a_h^plus.minus \, b_h^plus.minus \)$ converge in $d_(upright("curv"))$, as $h arrow.b 0$, to $upright("SLE")_3 \( D \; a \, b \)$. Given errors $eta_j arrow.b 0$, one can choose displacements $h_j arrow.b 0$ and, for each $j$, a finite deterministic family of allowed strips of each sign with the following property. Outside an event of pure probability at most $eta_j$, a continuum comparison chord selects a strip from its family and traverses it with strict margins from its long sides and across its end gates. Only terminal pieces of diameter at most $eta_j$ are omitted. The strip has cross-sections of diameter at most $eta_j$ following a simple prototype within $eta_j$, in $d_(upright("curv"))$, of that middle subarc. For all sufficiently fine pure lattice approximations, the pure lattice interface selects such a strip and has the corresponding traversal, with geometric errors at most $2 eta_j$; its adjacent signed spin path crosses the strip, outside an event of probability at most $2 eta_j$.]
  #emph[Suppose the prescribed target contours in $D_n$, with their designated boundary signs, have the corresponding two signed strip barriers with failure probability tending to zero along such a sequence, and let $\( K \, L \, U \)$ be any joint subsequential limit of their traces and the two comparison chords, in Hausdorff distance for the traces and $d_(upright("curv"))$ for the comparison chords. Here $L$ is the limit from $A_h^(-)$ and $U$ the limit from $A_h^(+)$. Then almost surely 
#[#set math.equation(numbering: n => "(9.4)")
 $ K subset overline(M \( L \)) ∩ overline(P \( U \)) . $ <curv:forbidden-sides>]

 For a simple chord $C$ in $D$, $P \( C \)$ and $M \( C \)$ denote the components of $D \\ C$ adjacent to $I_(+)$ and $I_(-)$; closures are taken in $overline(D)$.]
] <curv:geometric-input>

#proof[
  #emph[Source and scope.] The first assertions are [22] Section 7, “From fixed strip tests to limiting barriers”. Uniform boundary parametrization gives uniform convergence of the normalized conformal maps on the closed disk, including the two marks. Mapping one disk $upright("SLE")_3$ by these maps proves the displaced continuum convergence. For fixed $h$, only pure convergence in an ordinary polygonal approximation is used.
  The finite family is obtained by covering favorable simple comparison chords with open neighborhoods described by rational polygonal strips, transverse gates, and strict crossing margins. Compact middle subarcs are in $D$; the two short terminal pieces tend to the marks. A countable such cover has a finite subfamily carrying arbitrarily large probability. Its entire list is fixed before taking the lattice limit; the sampled pure chord may select a strip only after the joint vector coupling has been made. Following the signed side of the lattice interface supplies the crossing with $O \( delta_n \)$ drawing error.
  The last assertion is the winding and boundary-order argument of [22] Section 7, “Forbidden sides, order, and identification of the trace”. A signed crossing in one of these strips blocks a target contour from the corresponding side. To include the open signed boundary arc, erase loops from the crossing and close it outside $D_n$. In the fixed $Psi$ coordinates, take radial connectors from its gates to a circle $rho = rho_(*) > 1$ and the circular arc on the signed side, where $rho_(*)$ is independent of $h \, n$. At fixed $h$, the added path has positive clearance from $overline(D)$ and hence lies outside $D_n$ for large $n$. Include this threshold in the diagonal choice. The target marks are on the zero-winding side of the closed barrier. As the strip widths and terminal errors vanish, the gate centers tend to the marks, while the fixed-radius closure stays a positive distance beyond every compact subarc of the signed boundary. The winding exclusions therefore hold on every compact neighborhood of the forbidden side or boundary arc, giving (9.4). The argument uses only the deterministic geometry and noncrossing of opposite signed paths with the target contour; it applies to the couplings in Proposition 36. ◻
]

#thm([Lemma 9.4.])[
  (Ordered chords with equal laws).  #emph[Let $L \, U$ be random simple chords from $a$ to $b$ with their interiors in $D$, and let $K subset overline(D)$ be random, compact, connected, and contain $a \, b$. If (9.4) holds almost surely, then $P \( L \) subset P \( U \)$ almost surely. If $L$ and $U$ have the same trace law, then $K = L = U$ as compact sets almost surely.]
] <curv:ordered-chords>

#proof[
  This is [22] Section 7, Lemma “Ordered chords with equal laws”. Here is the argument. A point of $P \( L \) ∩ M \( U \)$ could be connected inside this union to both signed boundary arcs. Removing loops gives a crosscut between those arcs that avoids $K$. Its endpoints alternate with $a \, b$, so it separates $a$ from $b$, contradicting the connectedness of $K$. Hence $P \( L \) subset P \( U \) union U$. No point of $U$ can belong to the open set $P \( L \)$, since every neighborhood of an interior point of $U$ meets $M \( U \)$. Thus $P \( L \) subset P \( U \)$.
  Use a fixed Schoenflies homeomorphism to the disk and take the planar areas of the images of these two plus sides. They are bounded, ordered random variables with the same distribution, so their difference vanishes almost surely. If the inclusion of plus sides were proper, take $z in P \( U \) \\ P \( L \)$. It either lies in $M \( L \)$, or lies on $L$. In the latter case a neighborhood of $z$ inside $P \( U \)$ meets $M \( L \)$, by the two-sidedness of a Jordan chord. In either case the difference contains a nonempty open subset of $M \( L \)$, and hence has positive area. The plus sides are therefore equal, and so are their interior boundary chords. By (9.4), $K$ lies on this chord. The inverse chord parametrization maps it to a connected subset of $\[ 0 \, 1 \]$ containing both endpoints, which is all of $\[ 0 \, 1 \]$. ◻
]

The remaining issue is traversal order: Hausdorff convergence alone would allow repeated forward and backward travel close to one simple chord. The next source lemma isolates the required exclusion.

#thm([Lemma 9.5.])[
  (Progress criterion for the curve metric).  #emph[Let $g_n$ be simple oriented curves with endpoints tending to $a \, b$, and let $G$ be a continuous injective chord with those endpoints and interior in $D$. Suppose their traces converge to the trace of $G$. There are continuous $u_n : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ with endpoint values tending to $0 \, 1$ such that 
$ e_n = sup_t \| g_n \( t \) - G \( u_n \( t \) \) \| arrow.r 0 . $

 If $B_n = sup_(s < t) \( u_n \( s \) - u_n \( t \) \)$ tends to zero, then $d_(upright("curv")) \( g_n \, G \) arrow.r 0$. For each fixed $0 < eta < 1$, a drop $B_n gt.eq eta$ instead forces six disjoint passages across an annulus with center on $G \( \[ eta \/ 2 \, 1 - eta \/ 2 \] \)$ and radii $r \, R_eta$, for every $e_n < r < R_eta$, once $n$ is sufficiently large; here $R_eta > 0$ depends on $G$ and $eta$.]
  #emph[Consequently, for random curves coupled with such a random $G$, trace and endpoint convergence in probability imply curve convergence in probability if, for every deterministic compact $F subset.double D$ and all sufficiently small fixed $R > 0$, 
#[#set math.equation(numbering: n => "(9.5)")
 $ lim_(r arrow.b 0) limsup_(n arrow.r oo) bb(P) { g_n upright(" has four passages from ") r upright(" to ") R upright("
 about some center in ") F } = 0 . $ <curv:passage-criterion>]

]
] <curv:progress>

#proof[
  #emph[Source and interpretation.] This is [22] Section 7, Lemma “Progress coordinates and the full curve metric”, with its passage convention of disjoint parameter intervals. Extend the inverse parametrization of $G$ continuously to an ambient neighborhood and compose it with $g_n$ to obtain $u_n$. When $B_n arrow.r 0$, the running maximum of $u_n$, normalized to endpoint values $0 \, 1$ and perturbed by a vanishing strictly increasing linear function, is an increasing homeomorphism uniformly close to $u_n$. Uniform continuity of $G$ gives the asserted metric convergence. The other implication is the companion’s deterministic passage argument. In the random statement, compact exhaustion of $D$ and deterministic lower bounds on $R_eta$ on events of increasing probability reduce its random centers and radii to (9.5). Six passages imply four, so the latter condition suffices. No bound on target path lengths is assumed. ◻
]

=== 9.4 Assembly of the quenched limit <assembly-of-the-quenched-limit>

#proof[
  #emph[Completion of the proof of Theorem 2.] Fix $epsilon.alt$ in the interval already chosen in Sections 7 and 8. Begin with any subsequence of the given approximations, and pass further so that the designation of $I_(+)$ is fixed. We will construct, along this subsequence, deterministic comparison laws $R_n$ and couplings such that
  #[#set math.equation(numbering: n => "(9.6)")
   $ cal(L) \( L_n divides omega \) = R_n \, #h(2em) cal(L) \( Gamma_n divides omega \) = Q_(n \, omega) \, #h(2em) bb(E) thin min { 1 \, d_(upright("curv")) \( Gamma_n \, L_n \) } arrow.r 0 \, $ <curv:quenched-coupling>]
  where $R_n arrow.r.double upright("SLE")_3 \( D \; a \, b \)$ in the curve metric.
  Choose $eta_j arrow.b 0$ and the displacements and finite strip families of Lemma 37. For each fixed $j$, apply Proposition 36 to the two entire families. Choose increasing deterministic thresholds $n_j$ so that for all $n gt.eq n_j$ the geometric placements are valid, the pure comparison laws have their required approximation bounds, and each strip-transfer failure probability is at most $eta_j$. The threshold may absorb the reciprocal of $a_(h_j)$ from the conditioning estimate. Put
  $ j \( n \) = max { j lt.eq n : n_j lt.eq n } \, $
  with any definition before $n_1$. This deterministic index tends to infinity, as slowly as necessary. Let $L_n$ and $U_n$ be the two pure comparison chords at displacement $h_(j \( n \))$, and denote the law of $L_n$ by $R_n$. Their deterministic marginal laws converge to the same $upright("SLE")_3 \( D \; a \, b \)$ law.
  For each $n$, glue the two strip-transfer couplings over the common pair $\( omega \, Sigma_(n \, omega) \)$. Equivalently, disintegrate each comparison sample conditional on that pair and then sample both conditional kernels. Each comparison marginal conditional on $omega$ is still its prescribed pure law. With probability tending to one, the target has both signed barriers selected from the finite lists by its two comparison chords.
  All target traces lie eventually in one fixed compact planar set. Indeed uniform boundary convergence bounds $partial D_n$, and the bounded components it encloses are bounded by the same large disk. The space of nonempty compact subsets of this disk is compact in Hausdorff distance. The ambient curve space is complete and separable: rational polygonal paths are dense, and from a Cauchy sequence one can select a subsequence with successive curve distances less than $2^(- j)$. Recursively choose parametrizations of its representatives with successive uniform distances less than $2^(1 - j)$. They converge uniformly to a continuous path, which represents the limit of the original Cauchy sequence. Thus this space is Polish and the usual weak-convergence and representation theorems apply. The comparison chord laws are tight in this space. Along any further subsequence, pass again to a joint limit $\( K \, L \, U \)$ of the target trace and comparison chords. The limit $K$ is connected, contains $a \, b$, and lies in $overline(D)$; connectedness and endpoint inclusion pass under Hausdorff convergence, and points at positive distance outside $overline(D)$ are eventually outside $D_n$ by the boundary winding argument. Lemma 37 gives (9.4). Since $L$ and $U$ have the same simple chord law, Lemma 38 gives
  $ K = L = U #h(2em) upright("almost surely as traces") . $
  Represent this joint convergence with almost-sure convergence of the trace and comparison variables, and lift it to the target paths by their original conditional laws given those variables. At each mesh the target configuration space is finite, so this lift is immediate. It preserves every target passage probability and requires no prior tightness of the target paths in the curve metric. The marginal estimate Corollary 29 is precisely (9.5) for these target curves, including after this lift. Lemma 39 therefore gives $d_(upright("curv")) \( Gamma_n \, L \) arrow.r 0$ in probability in the representation. The represented $L_n$ already converges to $L$ in that metric. The triangle inequality yields $d_(upright("curv")) \( Gamma_n \, L_n \) arrow.r 0$ in probability. This statement depends only on the joint law of the pair at each $n$, so it holds in the original couplings as well. Since every further subsequence admits this argument, it holds along the whole chosen subsequence. Boundedness then proves the expectation assertion in (9.6).
  Let $pi_(n \, omega)$ be the conditional joint law of $\( Gamma_n \, L_n \)$ in that coupling, and write $overline(d) = min { 1 \, d_(upright("curv")) }$. Every function $F$ in the defining class for $d_(upright("BL"))$ satisfies
  $ lr(|integral F thin upright(d) Q_(n \, omega) - integral F thin upright(d) R_n|) lt.eq integral overline(d) \( gamma \, ell \) thin upright(d) pi_(n \, omega) \( gamma \, ell \) . $
  The right side is independent of $F$, so taking its supremum and then environmental expectation gives
  #[#set math.equation(numbering: n => "(9.7)")
   $ bb(E)_(upright("env")) d_(upright("BL")) \( Q_(n \, omega) \, R_n \) lt.eq bb(E) thin overline(d) \( Gamma_n \, L_n \) arrow.r 0 . $ <curv:bl-bound>]
  This step uses the conditional pure marginal in (9.6); its annealed counterpart alone would not give (9.7). The deterministic laws $R_n$ converge in the same separable curve space to the required SLE law, and hence their bounded-Lipschitz distances to that law tend to zero. The triangle inequality and Markov’s inequality prove, for every $eta > 0$,
  $ bb(P)_(upright("env")) #h(-0.16667em) {d_(upright("BL")) #scale(x: 120%, y: 120%)[\(] Q_(n \, omega) \, upright("SLE")_3 \( D \; a \, b \) #scale(x: 120%, y: 120%)[\)] > eta} arrow.r 0 $
  on the chosen subsequence. If convergence failed on the original sequence, a subsequence with the displayed probability bounded below would contradict the construction just given. This proves the full sequence assertion.
  All couplings used only finitely many bond variables at each mesh; integrating out added torus bonds and algorithmic variables preserves the conditional laws given the original infinite environment. The bounded-Lipschitz distances are measurable, since $Q_(n \, omega)$ takes only finitely many values. Finally restore the prescribed half-stubs and local drawing. Their matched displacement is $O \( delta_n \)$ and their orientation remains incoming to outgoing. Every displacement, strip, and comparison above was made in the original Euclidean embedding, and the interval of allowed $epsilon.alt$ was fixed before choosing any target geometry. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Aizenman and A.~Burchard, #emph[Hölder regularity and dimension bounds for random curves], Duke Math. J. #strong[99] (1999), 419--453. #link("https://doi.org/10.1215/S0012-7094-99-09914-3")[doi:10.1215/S0012-7094-99-09914-3].]
#bibitem([2])[M.~Aizenman and J.~Wehr, #emph[Rounding effects of quenched randomness on first-order phase transitions], Comm. Math. Phys. #strong[130] (1990), 489--528. #link("https://doi.org/10.1007/BF02096933")[doi:10.1007/BF02096933].]
#bibitem([3])[E.~Avérous and R.~Mahfouf, #emph[The near-critical random bond FK-percolation model], preprint (2025), #link("https://arxiv.org/abs/2509.08938v1")[arXiv:2509.08938v1].]
#bibitem([4])[A.~I.~Bugrij and V.~N.~Shadura, #emph[Duality of a two-dimensional nonhomogeneous Ising model on a finite lattice], Phys. Rev. B #strong[55] (1997), 11045--11049. #link("https://doi.org/10.1103/PhysRevB.55.11045")[doi:10.1103/PhysRevB.55.11045]. Equation locators refer to the preprint #emph[Duality of the 2D Nonhomogeneous Ising Model on the Torus], #link("https://arxiv.org/abs/hep-th/9703037v1")[arXiv:hep-th/9703037v1].]
#bibitem([5])[L.~Chayes and K.~Shtengel, #emph[Critical behavior for 2D uniform and disordered ferromagnets at self-dual points], Comm. Math. Phys. #strong[204] (1999), 353--366. #link("https://doi.org/10.1007/s002200050649")[doi:10.1007/s002200050649]. Theorem locators refer to #link("https://arxiv.org/abs/cond-mat/9811203v1")[arXiv:cond-mat/9811203v1].]
#bibitem([6])[D.~Chelkak, H.~Duminil-Copin, C.~Hongler, A.~Kemppainen, and S.~Smirnov, #emph[Convergence of Ising interfaces to Schramm's SLE curves], C. R. Math. Acad. Sci. Paris #strong[352] (2014), 157--161. #link("https://doi.org/10.1016/j.crma.2013.12.002")[doi:10.1016/j.crma.2013.12.002]. Theorem locators refer to #link("https://arxiv.org/abs/1312.0533v2")[arXiv:1312.0533v2].]
#bibitem([7])[D.~Chelkak and S.~Smirnov, #emph[Universality in the 2D Ising model and conformal invariance of fermionic observables], Invent. Math. #strong[189] (2012), 515--580. #link("https://doi.org/10.1007/s00222-011-0371-2")[doi:10.1007/s00222-011-0371-2].]
#bibitem([8])[Vik.~S.~Dotsenko and Vl.~S.~Dotsenko, #emph[Critical behaviour of the 2D Ising model with impurity bonds], J. Phys. C: Solid State Phys. #strong[15] (1982), 495--507. #link("https://doi.org/10.1088/0022-3719/15/3/015")[doi:10.1088/0022-3719/15/3/015].]
#bibitem([9])[Vik.~S.~Dotsenko and Vl.~S.~Dotsenko, #emph[Critical behaviour of the phase transition in the 2D Ising model with impurities], Adv. Phys. #strong[32] (1983), 129--172. #link("https://doi.org/10.1080/00018738300101541")[doi:10.1080/00018738300101541].]
#bibitem([10])[H.~Duminil-Copin, A.~Raoufi, and V.~Tassion, #emph[Sharp phase transition for the random-cluster and Potts models via decision trees], Ann. of Math. (2) #strong[189] (2019), 75--99. #link("https://doi.org/10.4007/annals.2019.189.1.2")[doi:10.4007/annals.2019.189.1.2]. Locators refer to #link("https://arxiv.org/abs/1705.03104v2")[arXiv:1705.03104v2].]
#bibitem([11])[R.~G.~Edwards and A.~D.~Sokal, #emph[Generalization of the Fortuin--Kasteleyn--Swendsen--Wang representation and Monte Carlo algorithm], Phys. Rev. D #strong[38] (1988), 2009--2012. #link("https://doi.org/10.1103/PhysRevD.38.2009")[doi:10.1103/PhysRevD.38.2009].]
#bibitem([12])[C.~M.~Fortuin and P.~W.~Kasteleyn, #emph[On the random-cluster model. I. Introduction and relation to other models], Physica #strong[57] (1972), 536--564. #link("https://doi.org/10.1016/0031-8914(72)90045-6")[doi:10.1016/0031-8914(72)90045-6].]
#bibitem([13])[C.~M.~Fortuin, P.~W.~Kasteleyn, and J.~Ginibre, #emph[Correlation inequalities on some partially ordered sets], Comm. Math. Phys. #strong[22] (1971), 89--103. #link("https://doi.org/10.1007/BF01651330")[doi:10.1007/BF01651330].]
#bibitem([14])[A.~Giuliani, R.~L.~Greenblatt, and V.~Mastropietro, #emph[The scaling limit of the energy correlations in non-integrable Ising models], J. Math. Phys. #strong[53] (2012), 095214. #link("https://doi.org/10.1063/1.4745910")[doi:10.1063/1.4745910]. Theorem locators refer to #link("https://arxiv.org/abs/1204.4040v1")[arXiv:1204.4040v1].]
#bibitem([15])[R.~L.~Greenblatt and E.~Peltola, #emph[On the spin interface distribution for non-integrable variants of the two-dimensional Ising model], preprint (2024), #link("https://arxiv.org/abs/2404.12375v3")[arXiv:2404.12375v3].]
#bibitem([16])[A.~B.~Harris, #emph[Effect of random defects on the critical behaviour of Ising models], J. Phys. C: Solid State Phys. #strong[7] (1974), 1671--1692. #link("https://doi.org/10.1088/0022-3719/7/9/009")[doi:10.1088/0022-3719/7/9/009].]
#bibitem([17])[A.~Kemppainen and S.~Smirnov, #emph[Random curves, scaling limits and Loewner evolutions], Ann. Probab. #strong[45] (2017), 698--779. #link("https://doi.org/10.1214/15-AOP1074")[doi:10.1214/15-AOP1074].]
#bibitem([18])[H.~A.~Kramers and G.~H.~Wannier, #emph[Statistics of the two-dimensional ferromagnet. Part I], Phys. Rev. #strong[60] (1941), 252--262. #link("https://doi.org/10.1103/PhysRev.60.252")[doi:10.1103/PhysRev.60.252].]
#bibitem([19])[A.~W.~W.~Ludwig, #emph[Critical behavior of the two-dimensional random $q$-state Potts model by expansion in $\( q - 2 \)$], Nucl. Phys. B #strong[285] (1987), 97--142. #link("https://doi.org/10.1016/0550-3213(87)90330-0")[doi:10.1016/0550-3213(87)90330-0].]
#bibitem([20])[R.~Mahfouf, #emph[The near critical random bond Ising model via embedding deformation], preprint (2025), #link("https://arxiv.org/abs/2509.08928v1")[arXiv:2509.08928v1].]
#bibitem([21])[R.~O'Donnell, M.~Saks, O.~Schramm, and R.~A.~Servedio, #emph[Every decision tree has an influential variable], in Proceedings of the 46th Annual IEEE Symposium on Foundations of Computer Science, IEEE (2005), 31--39. #link("https://doi.org/10.1109/SFCS.2005.34")[doi:10.1109/SFCS.2005.34].]
#bibitem([22])[OpenAI, #emph[$upright(S L E)_3$ universality for weak finite-range Ising interactions], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/SLE3-universality-for-weak-finite-range-Ising-interactions-September-23-2026/paper.pdf")[OAI:SLE3-universality-for-weak-finite-range-Ising-interactions-September-23-2026], 2026.]
#bibitem([23])[O.~Schramm, #emph[Scaling limits of loop-erased random walks and uniform spanning trees], Israel J. Math. #strong[118] (2000), 221--288. #link("https://doi.org/10.1007/BF02803524")[doi:10.1007/BF02803524].]
#bibitem([24])[B.~N.~Shalaev, #emph[Correlation function and susceptibility of the two-dimensional Ising model with impurities], Sov. Phys. Solid State #strong[26] (1984), 1811--1813; Russian original, Fiz. Tverd. Tela #strong[26] (1984), 3002--3005.]
#bibitem([25])[R.~Shankar, #emph[Exact critical behavior of a random bond two-dimensional Ising model], Phys. Rev. Lett. #strong[58] (1987), 2466--2469; erratum, #strong[59] (1987), 380. #link("https://doi.org/10.1103/PhysRevLett.58.2466")[doi:10.1103/PhysRevLett.58.2466]\; #link("https://doi.org/10.1103/PhysRevLett.59.380.2")[doi:10.1103/PhysRevLett.59.380.2].]
#bibitem([26])[S.~Sheffield and N.~Sun, #emph[Strong path convergence from Loewner driving function convergence], Ann. Probab. #strong[40] (2012), 578--610. #link("https://doi.org/10.1214/10-AOP627")[doi:10.1214/10-AOP627].]
#bibitem([27])[S.~Smirnov, #emph[Conformal invariance in random cluster models. I. Holomorphic fermions in the Ising model], Ann. of Math. (2) #strong[172] (2010), 1435--1467. #link("https://doi.org/10.4007/annals.2010.172.1435")[doi:10.4007/annals.2010.172.1435].]


