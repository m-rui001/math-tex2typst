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

#align(center)[#text(size: 16pt, weight: "bold")[Ground-state condensation in the dilute hard-sphere gas]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <main:introduction>

Bose–Einstein condensation means that a single one-particle state carries a macroscopic part of a many-particle
  system. For a homogeneous gas the natural candidate is the constant orbital.
  We prove that this orbital contains a fixed positive fraction of every ground state of a sufficiently dilute
  three-dimensional hard-sphere Bose gas, in the thermodynamic limit at fixed density and fixed exclusion
  distance. The conclusion permits complex wave functions and a degenerate ground space.

=== 1.1 The result <the-result>

Let $Lambda_L = \( bb(R) \/ L bb(Z) \)^3$ be the three-dimensional flat torus,
  with its Euclidean torus distance $d_L$. For $N$ particles and exclusion distance $a > 0$,
  define the open configuration set

$ Omega_(N \, L \, a) = { X in Lambda_L^N : d_L \( x_i \, x_j \) > a upright(" whenever ") i < j } . $

The hard-sphere Hamiltonian is the operator associated with the Dirichlet form

$ q_(N \, L \, a) \[ f \] = sum_(i = 1)^N integral_(Omega_(N \, L \, a)) \| nabla_i f \|^2 \, wide
  f in H_0^1 \( Omega_(N \, L \, a) \) \, $

restricted to symmetric functions. Thus its kinetic energy is $- sum_i Delta_i$,
  and the wave function vanishes at forbidden configurations. The exclusion distance $a$ is the scattering length:
  the exterior zero-energy scattering solution is $1 - a \/ \| x \|$.
  All wave functions below are extended by zero to $Lambda_L^N$.

For a normalized bosonic vector $Psi$, its one-particle density matrix and the normalized constant orbital are

$ Gamma_Psi^(\( 1 \)) \( x \; y \) = N integral_(Lambda_L^(N - 1)) Psi \( x \, Y \) overline(Psi \( y \, Y \))
  thin thin upright(d) Y \, wide phi_(0 \, L) = L^(- 3 \/ 2) . $

In particular, $"Tr" Gamma_Psi^(\( 1 \)) = N$. We measure condensation by

#[#set math.equation(numbering: n => "(1.1)")
 $ B \( Psi \) = frac(chevron.l phi_(0 \, L) \, Gamma_Psi^(\( 1 \)) phi_(0 \, L) chevron.r, N) = 1 /
   L^3 integral lr(|integral Psi \( x \, Y \) thin thin upright(d) x|)^2 thin upright(d) Y . $ <main:occupation>]

This quantity lies in $\[ 0 \, 1 \]$.

#thm([Theorem 1.1.])[
  (Condensation in every ground state).  #emph[There are absolute constants $epsilon_0 \,
    c_0 > 0$ with the following property. Fix $a \, rho > 0$ satisfying $rho a^3 < epsilon_0$.
    For every sequence of particle numbers $N_k$ and lengths $L_k$ such that
$ N_k arrow.r oo \, wide L_k arrow.r oo \, wide N_k / L_k^3 arrow.r rho \, $

 and every choice of normalized, possibly complex, bosonic ground eigenvectors $Psi_k$ of the hard-sphere Hamiltonians,
#[#set math.equation(numbering: n => "(1.2)")
 $ liminf_(k arrow.r oo) B \( Psi_k \) gt.eq c_0 . $ <main:limit>]

]
] <main:theorem>

The same constant $c_0$ works at all sufficiently small fixed gas parameters $rho a^3$.
  The volume needed to approach this bound may depend on $a$ and $rho$.
  We prove a positive fraction; we do not estimate the optimal depletion or show that the fraction tends to one as
  $rho a^3$ tends to zero.

#thm([Corollary 1.2.])[
  (Ground-space states).  #emph[Under the hypotheses of Theorem 1,
    the same lower bound holds for every sequence of density operators supported on the bosonic ground
    eigenspaces. In particular, it holds for the normalized ground-space projections $Pi_k \/ "Tr" Pi_k$,
    and for every sequence of normalized nonnegative ground functions.]
] <main:mixed>

Here the one-particle density matrix of a density operator is defined by linearity.
  The proof below is uniform over its pure ground vectors; convexity then proves the corollary.
  No choice of a preferred ground vector or a basis of positive ground functions is required.

=== 1.2 Context <context>

The ideal-gas prediction grew from Bose’s counting of light quanta and Einstein’s extension to a gas of material
  particles #cite(label("Bose1924")) #cite(label("Einstein1924IdealGas")) #cite(label("Einstein1925IdealGas")).
  For an interacting gas, the density-matrix criterion of Penrose and Onsager #cite(label("PenroseOnsager1956"))
  identifies condensation through a macroscopic one-particle occupation.
  Bogoliubov’s theory assumes a macroscopically occupied zero mode to derive the weakly interacting gas’s
  excitation picture #cite(label("Bogoliubov1947")) pp. 24–25.
  For hard spheres, Lee, Huang and Yang’s pseudopotential calculation predicts a depleted fraction of order
  $sqrt(rho a^3)$ #cite(label("LeeHuangYang1957")) Section III.
  The rigorous occupation problem is to justify macroscopic condensation itself before seeking this sharper
  depletion law.

The hard-sphere energy theory runs from Dyson’s bounds #cite(label("Dyson1957")) and the leading dilute
  asymptotics of Lieb and Yngvason #cite(label("LiebYngvason1998")) to the sharp Lee–Huang–Yang lower bound of
  Fournais and Solovej, which includes hard cores #cite(label("FournaisSolovej2023")).
  Basti, Brooks, Cenatiempo, Olgiati and Schlein proved the matching upper coefficient for hard spheres and
  subsequently for a class of general nonnegative potentials #cite(label("BastiEtAl2026HardSpheres"))
  #cite(label("BastiEtAl2026GeneralPotentials")). These energy asymptotics do not determine single-orbital
  occupation as the one-particle spectral gap vanishes in large volume.
  Lieb and Yngvason explicitly separated that question from their energy theorem #cite(label("LiebYngvason1998")).

Continuum condensation results allowing scaled hard cores include the trapped Gross–Pitaevskii theorem of Lieb and
  Seiringer #cite(label("LiebSeiringer2002")) and the homogeneous canonical positive-temperature theorem of
  Deuchert and Seiringer #cite(label("DeuchertSeiringer2020GP")).
  Low-energy results of Fournais and of Chong, Liang and Nam #cite(label("Fournais2021"))
  #cite(label("ChongLiangNam2026")), and Junge’s canonical low-temperature result in Neumann boxes
  #cite(label("Junge2026")) Corollary 6, treat joint dilute and increasing-volume limits.
  These regimes permit the gas parameter to decrease as the volume grows.
  Here $a$ and a positive $rho$ are fixed before the volume grows without restriction,
  and the lower fraction is uniform over all ground vectors.

Sütő’s thermodynamic condensation theorem, above a temperature-dependent density threshold,
  assumes nonnegative potentials with nonnegative Fourier transform and additional regularity and integrability
  #cite(label("Suto2023TwoStep")) Theorem 1.2; these hypotheses exclude a literal hard core.
  Galanda and Pinamonti construct algebraic equilibrium states for smooth interactions,
  using coupled cutoff-removal and weak-interaction limits in one setting and Gross–Pitaevskii scaling in another
  #cite(label("GalandaPinamonti2025Equilibrium")) #cite(label("GalandaPinamonti2026GP")).
  Their state formulations and limit orders differ from the present hard-sphere problem.
  Solovej’s 2025 survey identifies fixed-density ground-state condensation as a major open
  problem #cite(label("Solovej2025")) Section 5. Theorem 1 establishes a positive lower limiting occupation
  fraction for sufficiently dilute three-dimensional hard spheres,
  with the fixed-parameter order of limits in Equation (1.2).

The path method has separate antecedents. Benjamini, Pemantle and Peres constructed unpredictable paths with
  controlled intersections #cite(label("BPP1998")) Theorem 1.3 and Lemma 3.1.
  Abbe, Massoulié, Montanari, Sly and Srivastava averaged noisy group differences along paths joining prescribed
  endpoints #cite(label("AbbeMassoulieMontanariSlySrivastava2018"));
  Garban and Spencer adapted this averaging method to symmetry breaking in classical disordered spin
  systems #cite(label("GarbanSpencer2023")). Averaging path likelihoods before taking their second moments also
  underlies trail detection #cite(label("AriasCastroCandesHelgasonZeitouni2008")) #cite(label("BergerPeres2013"))
  and the point-reassignment argument of Peres and Sly #cite(label("PeresSly2014")) Proposition 2.1.
  Our exterior-shell detours use Kesten’s boundary-connectivity theorem in Timár’s formulation
  #cite(label("Timar2013")) arXiv version 2, Theorem 4.

Our sole companion input is the explicit random lattice skeleton and both encounter moments in #emph[A
  density-uniform condensate bound for dilute Bose gases] #cite(label("SoftCompanion")) Section 8.1, pp. 22–24;
  Lemma 8.1 and Equations (24)–(25), p. 23. These statements contain no physical parameters.
  The hard-core energy bounds, obstacle adaptation, conditional-normalizer calculation and phase argument are
  proved here.

=== 1.3 How the proof works <how-the-proof-works>

Write $Phi = \| Psi \|$. The modulus is again a ground function,
  and we first seek a lower bound for $B \( Phi \)$. Expanding the occupation formula gives

$ B \( Phi \) = 1 / L^3 integral Phi \( x \, Y \) Phi \( y \, Y \) thin thin upright(d) x thin thin upright(d) y
  thin thin upright(d) Y . $

The same bath $Y$ occurs at the two tagged positions $x$ and $y$.
  After partitioning the box into cells, we will obtain a uniformly positive contribution to this formula from a
  fixed positive fraction of ordered cell pairs whose separation is comparable to the box size.
  A separate phase estimate will then recover $B \( Psi \)$.

Local trajectory changes provide the comparisons between neighboring cells.
  Multiplying their costs along a long route would lose a factor at every step.
  Instead we average changes over random routes and bound the second moment of the averaged likelihood.
  Exact cancellation will leave a cost determined by mutual encounters of two routes,
  with a bound independent of their lengths.

===== 1.3.1 Local trajectories and the exposed environment. <local-trajectories-and-the-exposed-environment.>

Change length units so that each unit cell contains on average $D$ particles and the exclusion distance is $r =
  alpha \/ D$, with $alpha$ in a fixed interval. Dilution then corresponds to large $D$;
  Equation (2.2) records the invariant gas parameter. Local kinetic inequalities and normalized particle insertion
  show that cells with too few particles or too many close neighbors have small #emph[joint] probabilities.
  An exact stationary killed-Brownian law, whose position marginal is $Phi^2$,
  turns these estimates into a supply of short trajectories that can be replaced through a home cell or a
  face-neighbor cell.

At each cell we allocate the movable labels to many disjoint groups.
  For one group at a time, expose the outer endpoints and all trajectories outside the group.
  A cell is usable when enough of its remaining labels admit successful replacements against these frozen
  trajectories. The unexposed law is a product of bridge laws that already impose individual oscillation and
  confinement cutoffs and avoidance of the frozen paths, conditioned further on mutual hard avoidance.
  This exact conditional law, and an unconditional joint bound on unusable cells,
  are the two outputs of Section 6. We keep the two probability statements separate throughout the comparison.

===== 1.3.2 Distant cells and a common bath. <distant-cells-and-a-common-bath.>

For each required pair of distant cells, the joint obstacle bounds retain a set of exposed environments of fixed
  positive probability. On this set, draw a random lattice route from the companion’s skeleton law and reroute it
  around encountered finite unusable clusters along their good exterior shells.
  The resulting route uses nearest-neighbor steps, so every step admits the local replacements.
  Averaging the retained distribution of environments, with two independent route choices drawn in each common
  environment, gives a bounded exponential moment for their mutual encounters.
  One imported estimate controls encounters of the nominal skeletons;
  the other controls the additional encounters caused by detours,
  after the local obstacle probabilities have been summed.

Along a route, choose one group label from each departure cell.
  Construct two copies of the selected trajectories, preserving each label’s two outer endpoints.
  Its midpoint lies in its departure cell in the first copy and in the next cell in the second.
  At every intermediate cell the two different labels share one midpoint.
  Removing the initial tag from the first copy and the terminal tag from the second leaves the same bath of $N -
  1$ midpoints; Figure 1 depicts these assignments. This produces a common finite measure for two position
  measures that place a tagged particle in the respective endpoint cells and retain the same observed bath.
  Their square-root overlap contributes to $B \( Phi \)$ through the exact cell-average identity in Equation (8.3).

To lower-bound this overlap, average the change of measure over routes and label choices,
  and bound its second moment. The interaction normalizers are retained exactly.
  In the product of two likelihoods, the normalizers from portions of the routes far from one another cancel;
  only nearby encounters and shared labels contribute a cost.
  The preceding encounter moment controls that cost uniformly in the endpoint separation.
  Section 8 constructs the two-copy measure before proving and applying this cancellation.
  Finally, summing the overlap contributions of a number of disjoint groups proportional to $D$ compensates for
  the normalization of one tagged particle and yields a fixed lower bound for $B \( Phi \)$.

===== 1.3.3 Recovering the phases. <recovering-the-phases.>

Equality of the kinetic energies of $Psi$ and $Phi$ forces a constant phase on each connected component of the
  allowed configuration set. Those phases may differ between components.
  Fix the bath and cover its forbidden balls by small closed cubes,
  filling the bounded holes of each connected cluster. The points left outside the filled regions communicate
  through the open allowed one-particle slice and hence share one phase.
  Small clusters have little total filled volume. A large cluster would force many nearby particles with close
  partners, an event controlled by the joint spatial estimates.
  If $delta_(upright("geom"))$ is the discarded volume fraction averaged under the ground-state bath marginal,
  the elementary estimate

$ B \( Psi \) gt.eq B \( Phi \) - 4 sqrt(delta_(upright("geom"))) $

transfers the modulus bound to the original vector. We first fix the positive modulus fraction and only then
  strengthen the dilution threshold to make this phase loss smaller.

Section 2 gives the form and phase facts. Sections 3–5 supply the spatial,
  path and bridge estimates for the local replacements. Section 6 organizes the groups and their conditional law,
  Section 7 constructs the routes, and Section 8 proves the modulus bound. Section 9 controls the filled regions.
  Section 10 fixes the constants and returns to arbitrary thermodynamic sequences in the original units.

== 2 Ground states and phase transfer <setup:section>

The probabilistic part of the proof uses the squared modulus of a ground state.
  This section justifies that reduction and identifies the additional estimate needed to recover the occupation of
  an arbitrary complex state. The relevant phase information is local:
  moving one particle with the bath fixed preserves its phase whenever the motion stays in the allowed region.

=== 2.1 Length units and the occupation fraction <length-units-and-the-occupation-fraction>

We work on the scaled torus $Lambda_K = \( bb(R) \/ K bb(Z) \)^3$, with integer side $K$, volume $V = K^3$,
  and exclusion distance $r > 0$. Its distance is denoted by $d$. For every integer $n gt.eq 0$ put

$ Omega_n = { \( x_1 \, dots.h \, x_n \) in Lambda_K^n : d \( x_i \, x_j \) > r upright(" for ") i < j } \, $

with $Omega_0$ a single point. The full, labelled-particle Dirichlet form, without a symmetry restriction, is

$ q_n \[ f \] = sum_(i = 1)^n integral_(Omega_n) \| nabla_i f \|^2 \, wide D \( q_n \) = H_0^1 \( Omega_n \) . $

Here $H_0^1$ is the closure of smooth functions compactly supported in the open configuration set.
  The bosonic form is its restriction to functions invariant under coordinate permutations.
  Write $E_n$ for the full bottom energy when $Omega_n$ is nonempty, set $E_n = + oo$ otherwise, and put $E_0 =
  0$. We consider nonempty $Omega_N$. The particle-insertion argument in the next section proves nonemptiness for
  every additional particle number at which an energy is used.
  Every wave function is extended by zero outside its allowed set.

The mean particle count per unit cell and its product with the exclusion distance are

#[#set math.equation(numbering: n => "(2.1)")
 $ D = N / K^3 \, wide alpha = D r \, wide alpha_0 / 2 lt.eq alpha lt.eq 2 alpha_0 \, wide D gt.eq
   D_0 . $ <setup:scales>]

The numerical constant $alpha_0$ will be fixed sufficiently large, and $D_0$ will subsequently be increased.
  Partition the torus into unit cells $B_v = v + \[ - 1 \/ 2 \, 1 \/ 2 \)^3$,
  indexed by $cal(L) = \( bb(Z) \/ K bb(Z) \)^3$; these sets are understood modulo $K$.
  All estimates are uniform in the ground state and in the displayed $alpha$ window.
  A constant may depend on parameters already fixed, but not on $N$ or $K$.
  Volume thresholds may depend on the fixed density; where needed,
  they will be uniform when $D$ ranges over a compact subinterval of $\[ D_0 \, oo \)$.

To relate these units to the original torus of side $L$ and exclusion $a$, choose a length unit $s =
  L \/ K$ and set $r = a \/ s$. The map

$ tilde(Psi) \( z_1 \, dots.h \, z_N \) = s^(3 N \/ 2) Psi \( s z_1 \, dots.h \, s z_N \) $

is unitary and multiplies the quadratic form by $s^2$. It therefore preserves ground states.
  The gas parameter is unchanged:

#[#set math.equation(numbering: n => "(2.2)")
 $ D r^3 = N / L^3 a^3 = alpha^3 / D^2 . $ <setup:gas-parameter>]

Thus, with $alpha$ in its fixed window, increasing the particle count $D$ per unit cell corresponds to increasing
  physical dilution. The integer $K$ will be chosen at the end of the proof.

Let $Psi$ be a normalized, possibly complex, bosonic ground state on $Lambda_K$.
  Write $Y = \( x_2 \, dots.h \, x_N \)$ and define

$ Gamma_Psi^(\( 1 \)) \( x \; y \) = N integral Psi \( x \, Y \) overline(Psi \( y \, Y \)) thin thin upright(d)
  Y \, wide phi_0 \( x \) = V^(- 1 \/ 2) . $

The operator with kernel $Psi \( x \, Y \)$ is Hilbert–Schmidt with squared norm one,
  so $Gamma_Psi^(\( 1 \))$ is positive, trace class, and has trace $N$.
  Consequently the normalized constant-orbital occupation is

#[#set math.equation(numbering: n => "(2.3)")
 $ B \( Psi \) = frac(chevron.l phi_0 \, Gamma_Psi^(\( 1 \)) phi_0 chevron.r, N) = 1 /
   V integral lr(|integral Psi \( x \, Y \) thin thin upright(d) x|)^2 thin upright(d) Y . $ <setup:occupation>]

Changing variables in this identity proves its invariance under the unitary rescaling above.
  For the rest of the proof put

#[#set math.equation(numbering: n => "(2.4)")
 $ Phi = \| Psi \| \, wide mu \( thin upright(d) X \) = Phi \( X \)^2 thin thin upright(d) X \, wide m \( Y \) =
   integral Phi \( x \, Y \)^2 thin thin upright(d) x . $ <setup:position-law>]

Thus $m \( Y \) thin upright(d) Y$ is the bath marginal of the probability measure $mu$.

=== 2.2 The full ground equation and its equality case <the-full-ground-equation-and-its-equality-case>

The componentwise positivity mechanism is classical; compare Faris and Simon
  #cite(label("FarisSimon1975GroundStates")) Lemmas 1 and 3.
  We give the form argument to include the symmetry restriction and the possibly disconnected torus domain.
  The multiplier identity below is the classical ground-state representation;
  see #cite(label("FrankSeiringer2008")) Section 2.3. Its direct proof here supplies the required form-domain statement.

#thm([Lemma 2.1.])[
  (Ground states and component phases).  #emph[For every integer $n gt.eq 1$ with nonempty $Omega_n$,
    the full and bosonic Dirichlet operators have compact resolvent and the same bottom energy $E_n$.
    In particular, both $Psi$ and $Phi = \| Psi \|$ are full ground eigenfunctions at energy $E_N$.
    They have smooth representatives in $Omega_N$. On every connected component $C$ of $Omega_N$,
    either both vanish identically or
$ Phi > 0 \, wide Psi = e^(i theta.alt_C) Phi $

 for one constant $theta.alt_C in bb(R)$. For every real bounded Lipschitz function $u$ on $Lambda_K^N$,
#[#set math.equation(numbering: n => "(2.5)")
 $ q_N \[ u Phi \] - E_N lr(bar.v.double u Phi bar.v.double)_2^2 =
   integral Phi^2 \| nabla u \|^2 . $ <setup:multiplier>]

 The gradient on the right includes all particle coordinates.]
] <setup:ground>

#proof[
  Zero extension maps $H_0^1 \( Omega_n \)$ isometrically into $H^1 \( Lambda_K^n \)$.
    On a bounded set in that Sobolev space, the squared $L^2$ Fourier tail outside frequencies of length at most
    $R$ is bounded by $C R^(- 2)$. The remaining Fourier space is finite dimensional.
    This proves compactness of the form embedding, hence compact resolvent and attainment of the bottom energy.
    Restricting to the closed symmetric subspace preserves compactness.
  For $f in H_0^1 \( Omega_n \)$ define its root-mean-square symmetrization by
  $ F \( X \) = (frac(1, n !) sum_(pi in S_n) \| f \( pi X \) \|^2)^(1 \/ 2) . $
  The gradient inequality for the Euclidean norm of a vector gives $lr(bar.v.double  bar.v.double) F_2 =
    lr(bar.v.double  bar.v.double) f_2$ and $q_n \[ F \] lt.eq q_n \[ f \]$.
    It also preserves zero Dirichlet data. More explicitly, apply the construction to smooth compactly supported
    approximants of $f$. Their vector norms have compact support in $Omega_n$ and admit interior smooth
    approximation. They converge to $F$ in $L^2$ and remain bounded in $H^1$.
    Weak closedness of $H_0^1$ and lower semicontinuity prove the assertion and the energy inequality for $f$.
    Since $F$ is symmetric, the bosonic bottom is at most the full bottom.
    Inclusion of the domains gives the reverse inequality.
  The bosonic minimizer $Psi$ therefore minimizes the full Rayleigh quotient.
    First variation against arbitrary full form-domain functions gives its full weak eigenfunction equation.
    The modulus contraction and the full variational principle yield
  $ E_N lt.eq q_N \[ Phi \] lt.eq q_N \[ Psi \] = E_N \, wide lr(bar.v.double Phi bar.v.double)_2 = 1 . $
  Thus $Phi$ satisfies the same full weak eigenfunction equation.
    Interior elliptic regularity makes both functions smooth in the open set.
    Their almost-everywhere identity $Phi = \| Psi \|$ holds everywhere there by continuity.
    Since $Delta Phi = - E_N Phi lt.eq 0$, the strong minimum principle makes $Phi$ either strictly positive on a
    connected component or identically zero there.
  On a positive component set $v = Psi \/ Phi$. It is smooth and has $\| v \| = 1$,
    so $"Re" \( overline(v) nabla v \) = 0$ and
  $ \| nabla Psi \|^2 = \| nabla Phi \|^2 + Phi^2 \| nabla v \|^2 . $
  There are at most countably many open components. Summing their energy identities and using $q_N \[ Psi \] =
    q_N \[ Phi \]$ shows that the last, nonnegative term has zero integral on each.
    Hence $nabla v = 0$, and $v$ is constant on that component.
    On a component where $Phi = 0$, $Psi$ is also zero. This leaves unrelated phases on distinct positive
    components; no assertion of global connectedness or uniqueness is used.
  Finally, multiplication by a bounded Lipschitz function preserves the form domain.
    Test the weak equation for $Phi$ with $u^2 Phi$ and expand its gradient.
    Subtracting the resulting identity from the expansion of $q_N \[ u Phi \]$ gives Equation (2.5). ◻
]

#thm([Lemma 2.2.])[
  (Allowed slices).  #emph[For almost every fixed bath $Y$,
    a function $f in H_0^1 \( Omega_N \)$ restricts to an element of $H_0^1 \( S_Y \)$, where
$ S_Y = { x in Lambda_K : \( x \, Y \) in Omega_N } . $

 The same assertion holds when any nonempty subset of coordinates is left unfixed.
   For the smooth ground representatives, every connected subset of $S_Y$ has one common phase on its nonzero
   points, or the wave function vanishes throughout it.]
] <setup:slices>

#proof[
  Choose $f_j in C_c^oo \( Omega_N \)$ converging to $f$ in the form norm, and zero-extend.
    Fubini’s theorem gives a subsequence converging in $H^1$ in the unfixed coordinates for almost every bath.
    For each $j$, the restricted function is smooth and compactly supported in its allowed slice,
    because the full support of $f_j$ is compact in $Omega_N$.
    Taking the limit proves membership in the slice’s $H_0^1$ space.
    This proof works for every choice of unfixed coordinates.
    Dropping obstacles contributed by the fixed coordinates enlarges that domain and preserves membership by zero
    extension.
  The continuous map $x mapsto \( x \, Y \)$ sends a connected subset of $S_Y$ into one connected component of
    $Omega_N$. The final assertion now follows from Lemma 3. In particular it holds whenever two points can be
    joined by motion of the first coordinate entirely inside $S_Y$. ◻
]

The slicing statement uses compactly supported approximation rather than a boundary trace theorem.
  It therefore applies even when the allowed slice has several components or an irregular boundary.
  Moreover $m \( Y \)$ is finite for almost every bath, and baths outside the allowed bath domain have
  $m \( Y \) = 0$. Zero marginal slices contribute nothing to the integral formulas below.

=== 2.3 The price of removing a part of each slice <the-price-of-removing-a-part-of-each-slice>

The triangle inequality in Equation (2.3) gives $B \( Psi \) lt.eq B \( Phi \)$.
  A lower bound for the modulus therefore needs a separate phase estimate.
  We will retain points that communicate through the open allowed slice and control the volume that was removed.

#thm([Lemma 2.3.])[
  (Phase transfer).  #emph[Let ${ \( x \, Y \) : x in U_Y }$ be measurable.
    Suppose that for almost every bath with $m \( Y \) > 0$, the set $U_Y$ is contained in one connected component
    of $S_Y$, or is empty. Define
$ A_Y = Lambda_K \\ U_Y \, wide delta_(upright("geom")) =
  integral m \( Y \) frac(\| A_Y \|, V) thin thin upright(d) Y . $

 Then
#[#set math.equation(numbering: n => "(2.6)")
 $ B \( Psi \) gt.eq B \( Phi \) - 4 sqrt(delta_(upright("geom"))) . $ <setup:phase-loss>]

 In particular, if $B \( Phi \) gt.eq c_(*) > 0$ and $delta_(upright("geom")) lt.eq c_(*)^2 \/ 64$,
   then $B \( Psi \) gt.eq c_(*) \/ 2$.]
] <setup:phase-transfer>

#proof[
  By Lemma 4, the real part of $Psi \( x \, Y \) overline(Psi \( y \, Y \))$ equals $Phi \( x \, Y \)
    Phi \( y \, Y \)$ whenever $x \, y in U_Y$. This includes the case in which the wave function vanishes there.
    At all other points their difference is between zero and $2 Phi \( x \, Y \) Phi \( y \, Y \)$.
    Thus the double-integral formula for the occupation gives
  $ B \( Phi \) - B \( Psi \) lt.eq 2 / V integral #h(-0.16667em) #h(-0.16667em) integral #h(-0.16667em)
    #h(-0.16667em) integral #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(A_Y) \( x \) +
    upright(bold(1))_(A_Y) \( y \) #scale(x: 120%, y: 120%)[\)] Phi \( x \, Y \) Phi \( y \, Y \) thin thin
    upright(d) x thin thin upright(d) y thin thin upright(d) Y . $
  For the term containing $upright(bold(1))_(A_Y) \( x \)$, apply Cauchy–Schwarz to
  $ V^(- 1 \/ 2) Phi \( x \, Y \) \, wide V^(- 1 \/ 2) upright(bold(1))_(A_Y) \( x \) Phi \( y \, Y \) . $
  Their squared norms, with respect to $thin upright(d) x thin thin upright(d) y thin thin upright(d) Y$,
    are $1$ and $delta_(upright("geom"))$, respectively. The corresponding term is therefore at most
    $sqrt(delta_(upright("geom")))$. Interchanging $x$ and $y$ proves the same bound for the other term,
    giving Equation (2.6). The final assertion follows by substitution.
    This argument chooses no phase as a function of the bath; all quantities integrated are already measurable. ◻
]

The rest of the proof must now supply two estimates with compatible constants:
  a lower bound $B \( Phi \) gt.eq c_(*) > 0$ that remains valid as the lower threshold on $D$ is increased,
  and a retained region for which $delta_(upright("geom"))$ becomes sufficiently small.
  Lemma 5 will then recover the occupation of every original ground vector.

== 3 Energy comparisons and joint spatial bounds <sp:section>

We need a supply of particles in most unit cells, and a small probability that many prescribed cells contain too
  many close neighbors. The estimates must hold jointly for arbitrary sets of cells.
  They will follow from local energy penalties, tested against products of count cutoffs.

Throughout this section the torus is $Lambda_K = \( bb(R) \/ K bb(Z) \)^3$, with integer $K gt.eq 100$, and

$ V = K^3 \, wide D = N \/ V \, wide r = alpha \/ D \, wide alpha_0 \/ 2 lt.eq alpha lt.eq 2 alpha_0 . $

The fixed constant $alpha_0$ will be chosen large. We then take $D$ sufficiently large.
  Let $cal(L) = \( bb(Z) \/ K bb(Z) \)^3$ and $B_v = v + \[ - 1 \/ 2 \, 1 \/ 2 \)^3$, using their periodic images.
  Distances below are torus distances. We write $E_n$ for the full labelled $n$-particle Dirichlet ground energy
  on this same torus with core $r$, and $E_0 = 0$. The function $Phi$ is a normalized nonnegative symmetric ground
  function, and $mu \( thin upright(d) X \) = Phi \( X \)^2 thin upright(d) X$.

For a subset $I$ of the particle labels, put

$ q_I \[ F \] = sum_(i in I) integral \| nabla_i F \|^2 \, wide n_v^I \( X \) = \# { i in I : x_i in B_v } \, wide
  n_v = n_v^({ 1 \, dots.h \, N }) . $

Integrals of form functions use their zero extensions. Constants $c \, C$ are positive and may change;
  dependence on fixed cutoff profiles and on the fixed window for $alpha$ is allowed.
  They never depend on $K \, N \, D$ or the choice of ground function. Any additional dependence is stated.

=== 3.1 Two local kinetic inequalities <two-local-kinetic-inequalities>

We use the hard-core two-particle coercivity underlying local exclusion bounds
  #cite(label("LundholmPortmannSolovej2015")) Proposition 10 and the Neumann subdivision method
  #cite(label("LiebYngvason1998")). The following ray and subdivision argument proves the occupation estimate
  needed here.

#thm([Lemma 3.1.])[
  (Cube energy).  #emph[Let $Q$ be a Euclidean cube of side $l$,
    and let $F in H^1 \( Q^n \)$ vanish almost everywhere whenever $\| x_i - x_j \| lt.eq
    r$ for some $i eq.not j$. With no boundary condition on the outer faces,
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(i = 1)^n integral_(Q^n) \| nabla_i F \|^2 gt.eq c_(upright("cube")) r /
   l^3 n \( n - 1 \) integral_(Q^n) \| F \|^2 \, wide c_(upright("cube")) = frac(1, 64 sqrt(3)) . $ <sp:cube-bound>]

 Consequently, for every torus form function $F in H_0^1 \( Omega_N \)$ and every fixed label subset $I subset {
   1 \, dots.h \, N }$,
#[#set math.equation(numbering: n => "(3.2)")
 $ q_I \[ F \] gt.eq c_(upright("cube")) r integral sum_(v in cal(L)) n_v^I \( n_v^I - 1 \) \| F \|^2 .
   $ <sp:cell-energy>]

 For $D gt.eq 2$ this implies
#[#set math.equation(numbering: n => "(3.3)")
 $ E_N / N gt.eq c_E alpha \, wide c_E = c_(upright("cube")) \/ 2 . $ <sp:energy-lower>]

]
] <sp:cube>

#proof[
  Fix a partner $y in Q$. A first-coordinate slice $f$ vanishes where $\| x - y \| lt.eq r$.
    On a ray $x = y + s omega$ in the cube, let $R \( omega \)$ be its terminal radius.
    Convexity makes the ray intersection an interval, and $R \( omega \) lt.eq sqrt(3) l$. For $r < s < R \( omega \)$,
  $ \| f \( y + s omega \) \|^2 lt.eq (integral_r^s t^(- 2) thin upright(d) t)
    (integral_r^s \| partial_t f \( y + t omega \) \|^2 t^2 thin upright(d) t) lt.eq 1 /
    r integral_r^(R \( omega \)) \| partial_t f \|^2 t^2 thin upright(d) t . $
  Integrating in $s$ and $omega$ proves
  #[#set math.equation(numbering: n => "(3.4)")
   $ integral_Q \| f \|^2 lt.eq frac(sqrt(3) l^3, r) integral_Q \| nabla f \|^2 . $ <sp:ray>]
  Rays ending before $r$ contribute zero. The argument first applies to smooth restrictions and then to Sobolev
    slices by approximation. In a torus cube lift, Euclidean distance at most $r$ also implies torus distance at
    most $r$, so the required zero region is present.
  For $n gt.eq 2$, subdivide $Q$ into $j^3$ equal cubes, where $j = floor.l \( n \/ 2 \)^(1 \/ 3) floor.r$.
    Then $n \/ 16 lt.eq j^3 lt.eq n \/ 2$. In every sector assigning the $n$ coordinates to these cubes,
    at most $j^3$ coordinates are in singleton cubes. For each of the at least $n \/
    2$ remaining coordinates choose a partner in its cube, using a fixed label ordering.
    Applying (3.4) to each such coordinate gives at least
  $ frac(r j^3, sqrt(3) l^3) n / 2 gt.eq frac(r n^2, 32 sqrt(3) l^3) $
  times the sector norm. We only restrict the coordinate integrals to sectors;
    no derivative of a sector indicator is taken. Sum these inequalities over sectors.
    The cases $n = 0 \, 1$ have zero lower bound, and impossible sectors have zero norm.
    This proves (3.1), with the stated smaller constant.
  Apply the cube bound to all unit-cell assignment sectors of the labels in $I$, fixing the other coordinates,
    and integrate them. This gives (3.2). Finally, $sum_v n_v \( n_v - 1 \) gt.eq N^2 \/ V - N$,
    so $E_N \/ N gt.eq c_(upright("cube")) r \( D - 1 \) gt.eq c_E alpha$. ◻
]

#thm([Lemma 3.2.])[
  (Close-neighbor energy).  #emph[Let $0 < r < s < 1$, let $F in H_0^1 \( Omega_N \)$,
    and fix a label set $I subset { 1 \, dots.h \, N }$. Define $d_i^I =
    min_(j in I \\ { i }) d \( x_i \, x_j \)$, with value $+ oo$ when the minimizing set is empty. Then
#[#set math.equation(numbering: n => "(3.5)")
 $ q_I \[ F \] gt.eq c_(upright("near")) thin r s^(- 3) integral \# { i in I : d_i^I lt.eq 2 s } \| F \|^2 \, wide
   c_(upright("near")) = frac(27, 262144 sqrt(3)) . $ <sp:close-energy-bound>]

]
] <sp:close-energy>

#proof[
  Partition each coordinate circle into $floor.l K \/ \( 8 s \)
    floor.r$ equal intervals and translate the resulting grid uniformly.
    Its cube side $l$ belongs to $\[ 8 s \, 16 s \]$. Two points at distance at most $2
    s$ lie in one cube with probability at least $\( 1 - 2 s \/ l \)^3 gt.eq 27 \/ 64$.
    For each coordinate having a partner in its cube, (3.4) gives kinetic energy at least $r \/ \( sqrt(3) l^3 \)$
    times its squared norm. Choose a nearest partner for each $i$ with $d_i^I lt.eq 2 s$,
    and average the restricted inequalities over the grid translation.
    Each such coordinate is counted with probability at least $27 \/ 64$.
    Since $l^3 lt.eq 4096 s^3$, this proves the displayed constant. ◻
]

=== 3.2 Normalized insertion and energy differences <normalized-insertion-and-energy-differences>

We next compare energies at different particle numbers. Normalizing the inserted orbital separately for each old
  configuration prevents the old kinetic energy from acquiring a multiplicative error.
  The trial follows the nearest-neighbor construction of Lieb, Seiringer,
  and Yngvason #cite(label("LiebSeiringerYngvason2000")) Section 3.2;
  the configurationwise normalization below preserves the old marginal for arbitrary old form functions.

#thm([Lemma 3.3.])[
  (Normalized insertion).  #emph[Let $w$ be a real normalized smooth one-particle orbital and $F$ an $n$-particle
    form function. For every configuration $X$ in the support of $F$,
    suppose at most $k$ old positions lie within distance $2 r$ of $"supp" w$. If
#[#set math.equation(numbering: n => "(3.6)")
 $ C lr(bar.v.double w bar.v.double)_oo^2 k r^3 lt.eq 1 / 4 \, $ <sp:insertion-smallness>]

 there is an admissible function $tilde(F)$ with one more coordinate, having the same norm as $F$, such that
#[#set math.equation(numbering: n => "(3.7)")
 $ q_(n + 1) \[ tilde(F) \] lt.eq q_n \[ F \] +
   C (lr(bar.v.double nabla w bar.v.double)_2^2 + lr(bar.v.double w bar.v.double)_oo^2 k r)
   lr(bar.v.double  bar.v.double) F_2^2 . $ <sp:insertion-cost>]

 The constants depend only on a fixed radial cutoff profile.]
] <sp:insertion>

#proof[
  Choose a nondecreasing Lipschitz function $h_r$ between zero and one, zero up to $1.1 r$, one beyond $2 r$,
    and with Lipschitz constant at most $C \/ r$. For old positions $X$ put
  $ f_X \( y \) = w \( y \) min_(1 lt.eq i lt.eq n) h_r \( d \( y \, x_i \) \) \, wide Z \( X \) =
    integral f_X \( y \)^2 thin upright(d) y . $
  The empty minimum is one. The union of the relevant radius-$2 r$ balls has volume at most $C k r^3$, so $Z gt.eq
    3 \/ 4$ under (3.6). Where a nearest minimizer is unique,
    only that old coordinate and $y$ contribute to its cutoff derivative.
    The same bound holds almost everywhere for the Lipschitz minimum. Therefore
  #[#set math.equation(numbering: n => "(3.8)")
   $ integral (\| nabla_y f_X \|^2 + sum_(i = 1)^n \| nabla_i f_X \|^2) thin upright(d) y lt.eq
     C (lr(bar.v.double nabla w bar.v.double)_2^2 + lr(bar.v.double  bar.v.double) w_oo^2 k r) .
     $ <sp:unnormalized-gradient>]
  Indeed cutoff derivatives have squared size at most $C \/ r^2$ and are supported in the relevant balls.
  Set $a_X = f_X \/ sqrt(Z)$ wherever $Z > 1 \/ 4$. For an old-coordinate derivative,
    normalization gives the orthogonal-projection identity
  $ partial a_X = Z^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] partial f_X - a_X chevron.l a_X \,
    partial f_X chevron.r_(L^2 \( thin upright(d) y \)) #scale(x: 120%, y: 120%)[\)] . $
  It follows that its squared $L^2 \( thin upright(d) y \)$ norm is at most $Z^(- 1)
    lr(bar.v.double partial f_X bar.v.double)_2^2$. The new-coordinate derivative has the same upper bound because
    $Z$ does not depend on $y$. Also
  $ integral a_X^2 thin upright(d) y = 1 \, wide integral a_X nabla_i a_X thin upright(d) y = 0 . $
  Thus the cross term vanishes on differentiating $F \( X \) a_X \( y \)$ and integrating $y$.
    Equation (3.8) proves (3.7).
  For a globally defined multiplier replace $sqrt(Z)$ by $max \( sqrt(Z) \, 1 \/ 2 \)$.
    The resulting $y$-norm is at most one and equals one on a neighborhood of the support where the hypothesis is
    used. A Sobolev function and its weak gradient vanish almost everywhere on its zero set,
    so this extension changes none of the preceding integrals.
    The extra clearance $1.1 r$ and compactly supported approximation of the old function show that $tilde(F) =
    F a_X$ belongs to the enlarged Dirichlet form domain. This also justifies the calculation for arbitrary old
    form functions. ◻
]

#thm([Corollary 3.4.])[
  (Energy differences).  #emph[For all sufficiently large $D$, uniformly in the stated $alpha$ window,
#[#set math.equation(numbering: n => "(3.9)")
 $ E_N - E_(N - m) lt.eq C alpha m wide \( 0 lt.eq m lt.eq N \) . $ <sp:removal-bound>]

 Moreover $E_n \/ n$ is nondecreasing among positive particle numbers with nonempty form domain, at fixed $K \, r$.]
] <sp:removal>

#proof[
  Use $w = V^(- 1 \/ 2)$ in Lemma 8. For at most $N$ old particles its norm loss is at most $C D r^3 =
    C alpha^3 \/ D^2$, and its energy cost is at most $C D r = C alpha$.
    Starting from the constant one-particle function constructs nonzero trials at every particle number up to $N$.
    Apply the variational principle at each addition and sum the costs to obtain (3.9).
  For the last assertion, fix $k < n$ and average the kinetic energy of all $k$-label subsets of a normalized
    $n$-particle form function. Each coordinate is counted with probability $k \/ n$,
    whereas slicing in the other coordinates bounds each subset energy below by $E_k$.
    Consequently $\( k \/ n \) q_n \[ F \] gt.eq E_k$; taking the infimum gives $E_n \/ n gt.eq E_k \/ k$. ◻
]

=== 3.3 A joint bound for deficient cells <a-joint-bound-for-deficient-cells>

We apply the ground-state multiplier identity, Equation (2.5), to products of local count cutoffs.

#thm([Proposition 3.5.])[
  (Joint low-count bound).  #emph[One can fix $alpha_0$ sufficiently large and then $ell >
    0$ sufficiently small so that, for every $A subset cal(L)$ and all sufficiently large $D$,
#[#set math.equation(numbering: n => "(3.10)")
 $ mu { n_v < ell D upright(" for every ") v in A } lt.eq \( C \/ D^2 \)^(\| A \|) . $ <sp:low-count-bound>]

 These choices and the constant $C$ are independent of $K$ and of the ground function.]
] <sp:low-counts>

#proof[
  Fix translates $w_v$ of a smooth normalized real orbital supported strictly inside $B_v$.
    Choose translates $chi_v in \[ 0 \, 1 \]$ supported inside $B_v$,
    equal to one on a fixed neighborhood of $"supp" w_v$, and satisfying $\| nabla chi_v \|^2 lt.eq C chi_v$.
    Put $m_v = sum_i chi_v \( x_i \)$. The neighborhood is chosen before $r$,
    so for sufficiently small $r$ any old center whose cutoff ball reaches $"supp" w_v$ has $chi_v = 1$.
  Suppose $F$ vanishes unless $m_v lt.eq 2 ell D$ for all $v in A$.
    The case $F = 0$ is trivial, so assume $lr(bar.v.double  bar.v.double) F_2 > 0$.
    Insert $floor.l ell D floor.r$ particles at each of these sites, successively using $w_v$.
    At each insertion at most $3 ell D$ old centers can affect its orbital.
    Supports at distinct sites have a fixed positive separation,
    so insertions at other sites cause no additional cutoff. Lemma 8 applies for large $D$ and gives cost at most
    $C \( 1 + 3 ell alpha \)$ per inserted particle.
  First choose $alpha_0$ large, and then $ell$ small, so that this cost is at most $c_E alpha \/
    2$ throughout the $alpha$ window. Writing $k = floor.l ell D floor.r \| A \|$,
    the enlarged trial has norm $lr(bar.v.double  bar.v.double)
    F_2$ and energy at most $q_N \[ F \] + \( c_E alpha \/ 2 \) k lr(bar.v.double  bar.v.double) F_2^2$.
    In particular it is nonzero, so $E_(N + k) < oo$. The monotonicity in Corollary 9 and (3.3) give $E_(N + k)
    gt.eq E_N + k E_N \/ N gt.eq E_N + c_E alpha k$. The variational principle therefore proves
  #[#set math.equation(numbering: n => "(3.11)")
   $ q_N \[ F \] - E_N lr(bar.v.double  bar.v.double) F_2^2 gt.eq
     c alpha D \| A \| lr(bar.v.double  bar.v.double) F_2^2 \, $ <sp:deficiency-penalty>]
  where $c > 0$ includes the fixed $ell$ and $D$ is large enough that $floor.l ell D floor.r gt.eq ell D \/ 2$.
  Let $zeta : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ be a Lipschitz function equal to one up to $1$ and zero from $2$
    onwards, and set $u_A = product_(v in A) zeta \( m_v \/ \( ell D \) \)$.
    Since distinct $chi_v$ have disjoint supports,
  $ \| nabla m_v \|^2 = sum_i \| nabla chi_v \( x_i \) \|^2 lt.eq C m_v \, wide \| nabla u_A \|^2 lt.eq C /
    D sum_(v in A) u_(A \\ { v })^2 . $
  The second estimate uses $m_v lt.eq 2 ell D$ wherever the corresponding cutoff derivative is nonzero.
    Apply (3.11) and (2.5) to $u_A Phi$. With $a \( A \) = integral u_A^2 thin upright(d) mu$, this gives
  $ a \( A \) lt.eq frac(C, D^2 \| A \|) sum_(v in A) a \( A \\ { v } \) quad \( A eq.not diameter \) . $
  Starting from $a \( diameter \) = 1$, induction on $\| A \|$ yields $a \( A \) lt.eq \( C \/ D^2 \)^(\| A \|)$.
    Finally $m_v lt.eq n_v$, so every configuration in the event of (3.10) has $u_A = 1$. ◻
]

The same constants work for arbitrarily many prescribed cells.
  We now obtain an upper count bound and a close-neighbor bound with that same joint scope.
  Their common input is a localized energy inequality.

=== 3.4 Exponential spatial localization <exponential-spatial-localization>

For nonempty $A subset cal(L)$, use its site centers as a subset of the torus and define

#[#set math.equation(numbering: n => "(3.12)")
 $ f_A \( X \) & = sum_(i = 1)^N e^(- d \( x_i \, A \)) \,\
k_A \( X \) & = \# { i : d \( x_i \, A \) lt.eq 6 \, med d_i lt.eq 2 s_0 } \, wide d_i =
  min_(j eq.not i) d \( x_i \, x_j \) \,\
s_0 & = b D^(- 1 \/ 3) \, wide 0 < b < 1 . $ <sp:weighted-count>]

The parameter $b$ will be fixed small below. We use $D$ large enough that $r < s_0 < 1 \/ 2$.

The particle-number localization uses the many-body IMS construction; compare #cite(label("Lewin2011")) Section 3.
  We prove the product partition and its weighted penalty explicitly.
  We separate particles near $A$ from the remaining particles.
  The latter retain at least their own ground energy; the former have enough local kinetic energy to pay the
  removal cost and leave a positive penalty for excessive counts or close neighbors.

#thm([Lemma 3.6.])[
  (Weighted local penalty).  #emph[There are constants $C \, c > 0$, independent of $b$,
    such that every $N$-particle form function $F$ satisfies
#[#set math.equation(numbering: n => "(3.13)")
 $ q_N \[ F \] - E_N lr(bar.v.double  bar.v.double) F_2^2 gt.eq alpha integral #scale(x: 120%, y: 120%)[\(] f_A -
   C D \| A \| + c b^(- 3) k_A #scale(x: 120%, y: 120%)[\)] \| F \|^2 . $ <sp:localized-form-bound>]

]
] <sp:localized-form>

#proof[
  #emph[Partitioning the particles.] Let $H gt.eq 0$ be an auxiliary random radius with $bb(P) \( H gt.eq h \) =
    e^(- h)$. Choose a fixed Lipschitz profile $theta.alt$ equal to $pi \/ 2$ on $\( - oo \, 0 \]$,
    zero on $\[ 1 \, oo \)$, and with bounded derivative. Set
  $ a_H \( x \) = sin theta.alt \( d \( x \, A \) - H \) \, wide c_H \( x \) =
    cos theta.alt \( d \( x \, A \) - H \) . $
  Thus $a_H^2 + c_H^2 = 1$, $a_H = 1$ at distance at most $H$, and its support is within distance $H + 1$.
    Both squared gradients sum to at most $C upright(bold(1))_({ H < d \( x \, A \) < H + 1 })$.
    For $I subset { 1 \, dots.h \, N }$ define
  $ F_(I \, H) \( X \) = F \( X \) product_(i in I) a_H \( x_i \) product_(j in.not I) c_H \( x_j \) . $
  Expanding the gradients, using $a_H nabla a_H + c_H nabla c_H = 0$, gives the exact localization identity
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_I q_N \[ F_(I \, H) \] = q_N \[ F \] + integral sum_i #scale(x: 120%, y: 120%)[\(] \| nabla
     a_H \( x_i \) \|^2 + \| nabla c_H \( x_i \) \|^2 #scale(x: 120%, y: 120%)[\)] \| F \|^2 . $ <sp:ims>]
  The squared norms sum to $lr(bar.v.double  bar.v.double) F_2^2$.
  #emph[The energy retained outside the localized set.] The index set $I$ consists of the particles localized near
    $A$. For each $I$, slicing in the coordinates of $I$ and dropping their exclusions from the others gives
  $ q_(I^c) \[ F_(I \, H) \] gt.eq E_(N - \| I \|) lr(bar.v.double F_(I \, H) bar.v.double)_2^2
    gt.eq \( E_N - C alpha \| I \| \) lr(bar.v.double F_(I \, H) bar.v.double)_2^2 . $
  To sum these removal costs, regard the squared product factors at fixed $X \,
    H$ as probabilities of independent choices of membership in $I$, with probabilities $a_H \( x_i \)^2$.
    In particular,
  $ sum_I \| I \| product_(i in I) a_H \( x_i \)^2 product_(j in.not I) c_H \( x_j \)^2 = sum_i a_H \( x_i \)^2 . $
  Since
  $ bb(E)_H a_H \( x \)^2 lt.eq e thin e^(- d \( x \, A \)) \, wide
    bb(E)_H upright(bold(1))_({ H < d \( x \, A \) < H + 1 }) lt.eq e thin e^(- d \( x \, A \)) \, $
  the mean removal cost and the mean localization error together are at most $C alpha integral f_A \| F \|^2$;
    we used the fixed positive lower bound for $alpha$ to absorb the error without $alpha$.
  #emph[The local energy that pays for removal.] The kinetic energy in the coordinates of $I$ is still available.
    Apply half of (3.2) and half of (3.5) to $q_I \[ F_(I \, H) \]$. Put $p_v = e^(- d \( v \, A \))$.
    If $H gt.eq d \( v \, A \) + 1$, the whole centered unit cell $B_v$ is on the $a_H = 1$ side.
    Summing over $I$ and averaging $H$ therefore makes the first term at least
  $ c r integral sum_v p_v n_v \( n_v - 1 \) \| F \|^2 . $
  For a coordinate counted by $k_A$, some partner lies within $2 s_0 < 1$,
    and hence both are at distance less than $7$ from $A$. On $H gt.eq 8$ both labels are certainly in $I$.
    This event has fixed probability $e^(- 8)$, so the second kinetic term is at least
  $ c r s_0^(- 3) integral k_A \| F \|^2 = c alpha b^(- 3) integral k_A \| F \|^2 . $
  In particular the partner used here belongs to the removed set before the subset-label inequality is applied.
  Combining these estimates with (3.14) gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ q_N \[ F \] - E_N lr(bar.v.double  bar.v.double) F_2^2 gt.eq
     integral (c r sum_v p_v n_v \( n_v - 1 \) - C alpha f_A + c alpha b^(- 3) k_A) \| F \|^2 . $ <sp:before-square>]
  #emph[Leaving a positive count penalty.] Within each unit cell its distance to $A$ differs from its center’s
    distance by at most $1$. Consequently
  $ f_A lt.eq e sum_v p_v n_v \, wide sum_v p_v lt.eq sum_(w in A) sum_v e^(- d \( v \, w \)) lt.eq C \| A \| . $
  The last lattice exponential sum is uniformly bounded on every periodic unit grid.
    Since $r = alpha \/ D$, completing a scalar square gives, for all integers $n gt.eq 0$ and $D gt.eq 1$,
  $ c / D n \( n - 1 \) - \( C + 1 \) e n gt.eq - C' D . $
  Multiply by $alpha p_v$ and sum. In (3.15) this leaves the positive term $alpha f_A$ and proves (3.13).
    None of the constants in this calculation depends on $b$. ◻
]

=== 3.5 Joint count and close-neighbor tails <joint-count-and-close-neighbor-tails>

#thm([Proposition 3.7.])[
  (Joint spatial bounds).  #emph[For every $A subset cal(L)$,
#[#set math.equation(numbering: n => "(3.16)")
 $ log integral e^(z f_A) thin upright(d) mu lt.eq C z D \| A \| wide \( 0 lt.eq z lt.eq 1 \) \, $ <sp:count-mgf>]

 where $f_diameter = 0$. Fix any $theta > 0$. One can choose $b > 0$ sufficiently small depending on $theta$,
   then take $D$ sufficiently large, so that the random site set
#[#set math.equation(numbering: n => "(3.17)")
 $ cal(Q) \( X \) = {v in cal(L) : \# { i : d \( x_i \, v \) lt.eq 5 \, med d_i lt.eq s_0 } gt.eq
   theta D} $ <sp:close-bad-set>]

 satisfies
#[#set math.equation(numbering: n => "(3.18)")
 $ mu { A subset cal(Q) } lt.eq p_D^(\| A \|) \, wide p_D = (C_theta b^(- 2) D^(- 4 \/ 3))^(1 \/ Q) arrow.r
   0 . $ <sp:close-tail>]

 Here $Q$ is an absolute integer; $D$ is taken large enough that the displayed base is at most one.
   All statements are uniform for $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$, $K gt.eq 100$, and the ground function.]
] <sp:joint-tails>

#proof[
  Distance is $1$-Lipschitz and $e^(- d) lt.eq 1$, so $\| nabla f_A \|^2 lt.eq f_A$ almost everywhere.
    Let $M \( z \) = integral e^(z f_A) thin upright(d) mu$. Apply (2.5) and (3.13) with $u = e^(z f_A \/ 2)$,
    dropping the nonnegative close-count term. This gives
  $ alpha #scale(x: 120%, y: 120%)[\(] M' \( z \) - C D \| A \| M \( z \) #scale(x: 120%, y: 120%)[\)] lt.eq z^2 /
    4 M' \( z \) . $
  Our choice of $alpha_0$ ensures $alpha gt.eq 1$. For $0 lt.eq z lt.eq
    1$ we therefore obtain $M' \( z \) \/ M \( z \) lt.eq C D \| A \|$.
    Integrating from $M \( 0 \) = 1$ proves (3.16). These differentiations are ordinary finite-volume ones,
    since $0 lt.eq f_A lt.eq N$.
  For the second statement first assume that distinct sites of $A$ have distance greater than $20$.
    Choose translates $a_v in \[ 0 \, 1 \]$, equal to one on the radius-$5$ ball and supported on the radius-$6$
    ball, with $\| nabla a_v \|^2 lt.eq C a_v$. Let $chi in \[ 0 \, 1 \]$ equal one on $\[ 0 \, 1 \]$,
    zero on $\[ 2 \, oo \)$, and satisfy $\| chi' \|^2 lt.eq C chi$.
    Such cutoffs are squares of fixed Lipschitz profiles. Define
  $ tilde(m)_v \( X \) = sum_i a_v \( x_i \) chi \( d_i \/ s_0 \) . $
  Then $sum_(v in A) tilde(m)_v lt.eq k_A$, and each close count in (3.17) is at most $tilde(m)_v$.
  We verify the gradient estimate
  #[#set math.equation(numbering: n => "(3.19)")
   $ \| nabla tilde(m)_v \|^2 lt.eq C s_0^(- 2) tilde(m)_v . $ <sp:nearest-gradient>]
  Away from a null set, every nearest neighbor is unique. If $x_i \, x_j$ have the same nearest neighbor $x_k$,
    with the first incoming distance at least the second, then $\| x_i - x_j \| gt.eq \| x_i - x_k \|$.
    The cosine law shows that the two directions at $x_k$ have angle at least $pi \/ 3$.
    For the edges of length at most $2 s_0$ used by the derivatives,
    consistent Euclidean lifts exist because $s_0 < 1 \/ 2$ and $K gt.eq 100$.
    Packing directions on the unit sphere bounds the incoming degree by a numerical constant.
    Each coordinate derivative therefore meets only a bounded number of summands of $tilde(m)_v$.
    The inequalities for $a_v \, chi$ bound the squared full gradient of each summand by $C s_0^(- 2)
    a_v \( x_i \) chi \( d_i \/ s_0 \)$. Summing with bounded overlap proves (3.19).
    All coordinates in those derivatives are within $6 + 2 s_0 < 7$ of $v$.
  Choose a Lipschitz increasing function $eta$ equal to zero on $\[ 0 \, 1 \/ 2 \]$ and one on $\[ 1 \, oo \)$, and put
  $ u_A = product_(v in A) eta \( tilde(m)_v \/ \( theta D \) \) \, wide a \( A \) =
    integral u_A^2 thin upright(d) mu . $
  On the nonzero set of $u_A$ we have $k_A gt.eq \( theta D \/ 2 \) \| A \|$.
    Choose $b$ so small that the constants in (3.13) satisfy $c b^(- 3) theta \/ 2 - C gt.eq 1$.
    That form inequality gives
  $ q_N \[ u_A Phi \] - E_N lr(bar.v.double u_A Phi bar.v.double)_2^2 gt.eq alpha D \| A \| a \( A \) . $
  At almost every configuration, gradients belonging to distinct sites involve disjoint particle coordinates,
    by the separation of the sites. Using (3.19) on the transition region $tilde(m)_v lt.eq theta D$ therefore gives
  $ \| nabla u_A \|^2 lt.eq frac(C, theta D s_0^2) sum_(v in A) u_(A \\ { v })^2 . $
  Equation (2.5) and induction from $a \( diameter \) = 1$ now imply
  $ a \( A \) lt.eq (frac(C, alpha theta D^2 s_0^2))^(\| A \|) lt.eq (C_theta b^(- 2) D^(- 4 \/ 3))^(\| A \|) . $
  On $A subset cal(Q)$, every cutoff equals one, proving this bound for separated $A$.
  Finally the graph joining distinct lattice sites at distance at most $20$ has uniformly bounded degree,
    also on the torus. It admits a coloring with an absolute number $Q$ of colors.
    Every prescribed $A$ contains a separated color class $A'$ of size at least $\| A \| \/ Q$.
    The event $A subset cal(Q)$ implies $A' subset cal(Q)$. Applying the separated estimate,
    with its base at most one, proves (3.18) for all $A$. ◻
]

These estimates concern the actual law $mu$, without conditioning on the bath or on future path data.
  A close-pair defect defined using only the bath coordinates is contained in the corresponding full-configuration
  defect. It therefore inherits (3.18) under the bath marginal by integrating out the first coordinate.
  This inclusion will be used for the one-coordinate geometry.

The choices have a fixed order: $alpha_0$ large, then $ell$ small; next any required fixed $theta$,
  then $b$ small; finally $D$ large. Every lower threshold on $D$ above is independent of $K gt.eq 100$.
  In particular these spatial bounds remain uniform when $D$ varies in a compact subinterval of its allowed range
  along a thermodynamic sequence.

== 4 A stationary sample of hard-core paths <path:section>

The spatial estimates will supply many particles whose short trajectories can later be changed.
  We first represent the position law by an exact killed-Brownian sample,
  and prove that prescribed cells simultaneously lack the required trajectories with very small probability.
  All probabilities in this section refer either to that sample or to explicitly specified free Brownian paths;
  the interacting trajectories are never assumed independent.

We use the scaled torus, cells, and parameters of Equation (2.1). In particular,

$ V = K^3 \, wide D = N \/ V \, wide r = alpha \/ D \, wide alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \] \, wide
  mu \( thin upright(d) X \) = Phi \( X \)^2 thin upright(d) X . $

The constants $alpha_0 \, ell \, theta \, b$ have the meanings fixed in the spatial estimates, and $s_0 =
  b D^(- 1 \/ 3)$. Choose $theta$ with $3 theta < ell \/ 2$ before fixing $b$ as in Proposition 12.
  The time $t in \( 0 \, 1 \]$ will be small but fixed before the lower threshold on $D$ is chosen.

=== 4.1 The endpoint-weighted law <the-endpoint-weighted-law>

For the killed Dirichlet semigroup on arbitrary open Euclidean domains,
  see #cite(label("BroderixHundertmarkLeschke2000Semigroups")) arXiv version 2, Proposition 2.9 and Theorem 6.1.
  That reference uses Brownian generator $Delta \/ 2$; our convention is $Delta$.
  The exhaustion argument below gives the required torus realization.

Let $nu_N$ be the measure on $N$ independent torus Brownian motions of generator $Delta$, on $\[ 0 \, 2 t \]$,
  with Lebesgue initial measure. Write $omega = \( omega_1 \, dots.h \, omega_N \)$ and
  $X \( u \) = \( omega_1 \( u \) \, dots.h \, omega_N \( u \) \)$. Set $Y = X \( 0 \)$ and $Z = X \( 2 t \)$. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ thin upright(d) cal(R) \( omega \) = e^(2 t E_N) Phi \( Y \) Phi \( Z \)
   upright(bold(1))_({ d \( omega_i \( u \) \, omega_j \( u \) \) > r med forall u \, med i < j }) thin upright(d)
   nu_N \( omega \) . $ <path:law>]

Here and below $d$ is the torus distance. A continuous path has a continuous Euclidean lift after its initial
  representative is chosen; its lifted increments and diameter do not depend on that representative.

#thm([Lemma 4.1.])[
  (Stationary killed paths).  #emph[Equation (4.1) defines a probability measure. Every time marginal is $mu$.
    Its restriction to an interval of length $s$ has the same construction with endpoint multiplier $e^(s E_N)
    Phi \( X_(-) \) Phi \( X_(+) \)$, and it is invariant under time reversal.
    Given both endpoint configurations, it is the product torus-bridge law conditioned on mutual hard avoidance.
    If the winding increments are also fixed, the underlying product consists of the corresponding Euclidean bridges.]
] <path:slab>

#proof[
  For the Dirichlet Laplacian on the open allowed configuration set $Omega$,
    the killed heat kernel represents $e^(- s H_N)$. This representation applies to the exact form domain
    $H_0^1 \( Omega \)$. One way to see that no regularity assumption on the collision boundary is needed is to
    exhaust $Omega$ by increasing smooth relatively compact open sets.
    On each set the stopped heat equation gives the killed representation.
    The union of their form domains is dense in $H_0^1 \( Omega \)$,
    since every smooth compactly supported function is supported in one exhaustion member.
    The variational characterization of resolvents therefore gives strong resolvent convergence,
    and then strong heat-semigroup convergence. A continuous path remaining in $Omega$ throughout a compact time
    interval has compact image in $Omega$, hence lies in one exhaustion member.
    Monotone convergence on paths identifies the limiting kernel.
  The integral in Equation (4.1) is $e^(2 t E_N) chevron.l Phi \, e^(- 2 t H_N) Phi chevron.r = 1$.
    Splitting the killed kernel at time $u$ gives the marginal density
  $ e^(2 t E_N) \( e^(- u H_N) Phi \) \( x \) \( e^(- \( 2 t - u \) H_N) Phi \) \( x \) = Phi \( x \)^2 . $
  Integrating an added initial or terminal interval proves the restriction statement.
    Symmetry of the killed kernel proves reversal. At fixed endpoints the two factors $Phi$ are constant,
    so disintegration of the free measure leaves exactly its independent bridges and the avoidance indicator.
    Resolving the endpoint heat kernel into its Euclidean translates gives the last assertion.
    All conditional statements are understood for almost every datum under its stated law. ◻
]

The next inequality transfers a rare event for one free trajectory to an estimate for any specified set of
  labelled trajectories. It uses only the removal-energy estimate, not independence under $cal(R)$.

#thm([Lemma 4.2.])[
  (Dropping selected interactions).  #emph[Let $I subset { 1 \, dots.h \, N }$ have cardinality $m$.
    If $h$ is a nonnegative measurable single-path functional invariant under reversal, then
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E)_(cal(R)) product_(i in I) h \( omega_i \) lt.eq e^(C t alpha m) integral mu \( thin upright(d) Y \)
   product_(i in I) bb(E)_(upright("free"))^(Y_i) h . $ <path:deletion-bound>]

 The free expectation uses a Brownian path of length $2 t$.]
] <path:deletion>

#proof[
  First take bounded $h$. Drop every collision restriction involving a label in $I$.
    For fixed selected endpoint vectors $y \, z$, integrate the other paths with their killed semigroup.
    The resulting matrix element between the corresponding slices of $Phi$ is at most
  $ e^(- 2 t E_(N - m)) a \( y \) a \( z \) \, wide a \( y \)^2 = integral Phi \( y \, x' \)^2 thin upright(d) x' . $
  The free selected paths, weighted by $product h$, give a symmetric endpoint kernel, by reversal invariance.
    More explicitly, let $nu_I$ be their product free-path measure with Lebesgue initial measure, and write $y =
    omega_I \( 0 \)$ and $z = omega_I \( 2 t \)$. Then
  $ integral a \( y \) a \( z \) product_(i in I) h \( omega_i \) thin upright(d) nu_I & lt.eq 1 /
    2 integral #scale(x: 120%, y: 120%)[\(] a \( y \)^2 + a \( z \)^2 #scale(x: 120%, y: 120%)[\)]
    product_(i in I) h \( omega_i \) thin upright(d) nu_I\
 & = integral a \( y \)^2 product_(i in I) bb(E)_(upright("free"))^(y_i) h thin thin upright(d) y . $
  Here the equality reverses the paths in the term containing $a \( z \)^2$;
    independence is used only under the free measure. By the definition of $a$,
    the last integral is $integral mu \( thin upright(d) Y \) product_(i in I) bb(E)_(upright("free"))^(Y_i) h$.
    Reinstating the factor $e^(2 t \( E_N - E_(N - m) \))$ and applying Corollary 9 proves Equation (4.2).
    Applying this to $h and M$ and letting $M$ increase proves the general case. ◻
]

=== 4.2 Uniform path cutoffs <uniform-path-cutoffs>

Put

#[#set math.equation(numbering: n => "(4.3)")
 $ gamma = 1 / 12 \, wide h_0 = D^(- 1) \, wide m_t = ceil.l t \/ r^2 ceil.r \, wide tau =
   t \/ m_t . $ <path:cutoff-parameters>]

We henceforth take $D$ large enough that $h_0 < t$ and $r^2 \/ 2 lt.eq tau lt.eq r^2$.
  The two halves of $\[ 0 \, 2 t \]$ are divided into $m_t$ intervals each.
  If these intervals are $I_1 \, dots.h \, I_(2 m_t)$, write

$ A_j \( omega \) = r^(- 1) "diam" \( tilde(omega) \( I_j \) \) \, $

where $tilde(omega)$ is a continuous lift.

#prodef([Definition 4.3.])[
  Fix a sufficiently large numerical constant $C_(upright("reg"))$. A path is #emph[regular] if
  #[#set math.equation(numbering: n => "(4.4)")
   $ max_j A_j lt.eq D^gamma \, wide frac(1, 2 m_t) sum_(j = 1)^(2 m_t) \( 1 + A_j \)^3 lt.eq
     C_(upright("reg")) \, $ <path:regular-conditions>]
  and its lifted diameter on each of $\[ 0 \, h_0 \]$ and $\[ 2 t - h_0 \, 2 t \]$ is at most $s_0 \/ 8$.
] <path:regular-path>

For two regular paths whose corresponding outer endpoints are more than $s_0$ apart,
  the endpoint-window condition leaves a gap of at least $3 s_0 \/ 4$ in those windows.
  Away from these windows, the averaged mesh bound controls the sum of collision probabilities over all intervals.
  The maximum bound controls the same sum where a bridge’s time density is large near an outer endpoint;
  these two uses are separated in Proposition 21.

#thm([Lemma 4.4.])[
  (Free cutoff bounds).  #emph[For every fixed $q > 0$ and fixed $t > 0$,
    a free Brownian path fails regularity with probability at most $C_(q \, t) D^(- q)$.
    The bound is uniform in its initial point, $K$, and the allowed $alpha$-window.
    It also holds for a Euclidean bridge of duration $2 t$ with bounded endpoint displacement,
    or for two independent Euclidean bridge legs of duration $t$ joined at a prescribed middle point,
    when the endpoints and middle point lie in a fixed bounded region.
    The bound and the required lower threshold on $D$ may depend on that region and on $t$;
    the numerical regularity threshold $C_(upright("reg"))$ is fixed once for all these laws.]
  #emph[If all three prescribed points lie within distance $3$ of a fixed site $v$,
    the probability that the two-leg path leaves the ball of radius $10$ about $v$ is at most $C e^(- c \/ t)$,
    with numerical $c \, C > 0$.]
] <path:regularity>

#proof[
  For Brownian motion, the variables $A_j$ use independent increments.
    Their tails are uniformly Gaussian, since $tau \/ r^2 in \[ 1 \/ 2 \, 1 \]$.
    Thus the maximum condition fails with probability at most $C m_t e^(- c D^(2 gamma))$.
    Put $U_j = \( 1 + A_j \)^3$. Their moments of every fixed order are uniformly bounded.
    In the expansion of the $2 k$th moment of $sum_j \( U_j - bb(E) U_j \)$,
    a nonzero term uses each of its indices at least twice; there are at most $C_k m_t^k$ such terms. Consequently
  $ bb(E) lr(|frac(1, 2 m_t) sum_j \( U_j - bb(E) U_j \)|)^(2 k) lt.eq C_k m_t^(- k) . $
  Choose $C_(upright("reg"))$ greater than a fixed multiple of $1 + sup bb(E) U_j$.
    Since $m_t$ is comparable to $D^2$ at fixed $t$, Markov’s inequality proves every desired polynomial bound for
    the average condition. On an endpoint window the maximal Gaussian bound has exponent a constant times
  $ s_0^2 \/ h_0 = b^2 D^(1 \/ 3) \, $
  which proves the remaining free estimate.
  For a bridge leg of duration $t$, write its centered part as $W \( u \) - \( u \/ t \) W \( t \)$,
    using a Brownian motion $W$, and add its fixed endpoint line.
    The extra increment on a mesh interval, divided by $r$, is at most
  $ r / t #scale(x: 120%, y: 120%)[\(] \| W \( t \) \| + C #scale(x: 120%, y: 120%)[\)] . $
  Outside an event of arbitrarily small polynomial probability this tends to zero,
    uniformly for bounded endpoint displacement. The inequality $\( x + y \)^3 lt.eq 4 x^3 +
    4 y^3$ transfers the averaged cutoff bound after the numerical choice of $C_(upright("reg"))$ is enlarged
    once. On an endpoint window the extra displacement is $h_0 \( \| W \( t \) \| + C \) \/ t =
    o \( s_0 \)$ with the same probability control. These estimates prove the assertion for two legs,
    using their two Brownian representations and a union bound.
    A duration-$2 t$ bridge uses the identical representation with $2 t$ in place of $t$.
  Finally the endpoint lines of the two legs remain in the radius-$3$ ball.
    Leaving the radius-$10$ ball requires a centered fluctuation of size at least seven on one leg.
    The Brownian representation and the maximal Gaussian bound give the stated $C e^(- c \/ t)$ estimate. ◻
]

=== 4.3 Many paths visiting a prescribed set <many-paths-visiting-a-prescribed-set>

For a set $A$ of lattice sites let $J_A \( omega \)$ be the number of sites $v in
  A$ whose radius-$12$ ball the path visits. Let $cal(D)$ be a reversal-invariant single-path event and put
  $epsilon_(cal(D)) = sup_y bb(P)_(upright("free"))^y \( cal(D) \)$.
  All bounds below are uniform for $t lt.eq 1$ and sufficiently large $K$.

#thm([Lemma 4.5.])[
  (A free visit bound).  #emph[For every $lambda > 0$,
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E)_(upright("free"))^y #scale(x: 120%, y: 120%)[\[] e^(lambda J_A upright(bold(1))_(cal(D))) -
   1 #scale(x: 120%, y: 120%)[\]] lt.eq zeta e^(- d \( y \, A \)) \, wide zeta =
   C_lambda lambda epsilon_(cal(D))^(1 \/ 3) . $ <path:free-visit-bound>]

 Here $d \( y \, A \)$ is the distance from $y$ to the set of site centers.
   The constants $C_lambda$ are bounded when $lambda$ ranges over a bounded interval.]
] <path:free-visits>

#proof[
  Mark the lifted Brownian path at its initial point and at each first exit from the unit ball about its last
    mark. If $Q$ is the number of completed exits by time $2 t$, then $J_A lt.eq C \( Q + 1 \)$:
    between successive marks the path remains in a unit ball,
    so it can visit radius-$12$ balls about only a bounded number of lattice sites.
    Projection to the torus cannot increase this bound.
  The exit durations are iid copies of a positive random variable $sigma$. For $s > 0$,
  $ bb(P) \( Q gt.eq k \) lt.eq e^(2 s) \( bb(E) e^(- s sigma) \)^k . $
  Since $bb(E) e^(- s sigma) arrow.r 0$ as $s arrow.r oo$, $Q$ has every fixed exponential moment,
    uniformly for $t lt.eq 1$. Moreover $J_A > 0$ requires a lifted displacement at least
    $\( d \( y \, A \) - 12 \)_(+)$, and hence has a Gaussian tail in that distance.
    Using $e^(lambda J_A) - 1 lt.eq lambda J_A e^(lambda J_A)$ and Hölder with three equal exponents gives
  $ bb(E) \[ \( e^(lambda J_A) - 1 \) upright(bold(1))_(cal(D)) upright(bold(1))_({ J_A > 0 }) \] lt.eq
    lambda #scale(x: 120%, y: 120%)[\(] bb(E) \[ J_A^3 e^(3 lambda J_A) \] #scale(x: 120%, y: 120%)[\)]^(1 \/ 3)
    epsilon_(cal(D))^(1 \/ 3) bb(P) \( J_A > 0 \)^(1 \/ 3) . $
  The exponential moment and Gaussian travel bound imply Equation (4.5), after changing its constant. ◻
]

#thm([Lemma 4.6.])[
  (Interacting visit moments).  #emph[If $e^(C t alpha) zeta lt.eq 1$, then
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E)_(cal(R)) exp (lambda sum_i J_A \( omega_i \) upright(bold(1))_(cal(D)) \( omega_i \)) lt.eq
   exp #scale(x: 120%, y: 120%)[\(] C e^(C t alpha) zeta D \| A \| #scale(x: 120%, y: 120%)[\)] . $ <path:visit-mgf>]

]
] <path:visit-moments>

#proof[
  Set $h \( omega \) = e^(lambda J_A \( omega \) upright(bold(1))_(cal(D)) \( omega \)) - 1$.
    Expand $product_i \( 1 + h \( omega_i \) \)$ over subsets of labels and apply Lemma 14 to each term.
    Lemma 17 then bounds the result by
  $ integral mu \( thin upright(d) Y \) product_i \[ 1 + e^(C t alpha) zeta e^(- d \( Y_i \, A \)) \] lt.eq
    integral e^(e^(C t alpha) zeta f_A) thin upright(d) mu \, wide f_A = sum_i e^(- d \( Y_i \, A \)) . $
  Equation (3.16) applies with the indicated exponent at most one, and proves Equation (4.6). ◻
]

=== 4.4 Cells with a supply of movable paths <cells-with-a-supply-of-movable-paths>

Let $d_i \( X \) = min_(j eq.not i) d \( X_i \, X_j \)$, taking the minimum to be $+ oo$ when $N = 1$.
  Define the endpoint close count

$ C_v \( X \) = \# { i : d \( X_i \, v \) lt.eq 5 \, med d_i \( X \) lt.eq s_0 } . $

We call the following conditions a #emph[certificate at $v$]:

+ $n_v \( Y \) gt.eq ell D$, and $C_v \( Y \) \, C_v \( Z \) < theta D$;
+ at most $H_1 D$ trajectories visit the radius-$12$ ball about $v$, every visiting trajectory is regular,
  and fewer than $theta D$ of the visiting trajectories have lifted diameter greater than one.

The certificate is an event of the full path sample. Later it will be used to estimate the probability of suitable
  exposed data; it will not be added to the conditioning on unexposed trajectories.

#thm([Proposition 4.7.])[
  (Joint certificate supply).  #emph[Fix any $p_1 > 0$. One can choose $H_1$ large,
    then $t > 0$ sufficiently small, and then $D_0$ sufficiently large, such that
#[#set math.equation(numbering: n => "(4.7)")
 $ cal(R) { v upright(" has no certificate for every ") v in A } lt.eq p_1^(\| A \|) $ <path:certificate-bound>]

 for every set $A$ of distinct sites, every $D gt.eq D_0$, and sufficiently large $K$.
   The bound is uniform over the chosen ground function and the allowed $alpha$-window.
   After $H_1$ is fixed, $t$ may be reduced further before increasing $D_0$.]
] <path:certificates>

#proof[
  We bound simultaneous failures of each individual test first.
    The low-count estimate in Proposition 10 and the close-count estimate in Equation (3.18) apply at both
    endpoints by Lemma 13. Their per-site parameters tend to zero as $D$ increases.
  For excessive visiting paths use $cal(D)$ equal to all paths.
    Choose a small fixed $lambda > 0$ so that $e^(C t alpha) C_lambda lambda lt.eq 1$ for every $t lt.eq
    1$ and the allowed $alpha$. If every site in $A$ has more than $H_1 D$ visitors,
    then $sum_i J_A \( omega_i \) > H_1 D \| A \|$. Equation (4.6) and exponential Markov inequality give
  $ cal(R) \( upright("this event") \) lt.eq exp { - \[ lambda H_1 - C e^(C t alpha) C_lambda lambda \] D \| A \| } . $
  Take $H_1$ large enough to make the bracket positive uniformly.
  For visitors of diameter greater than one take $lambda = 1$ and $cal(D) = { "diam" tilde(omega) > 1 }$.
    Its free probability is at most $C e^(- c \/ t)$. Choose $t$ small enough that the right-hand coefficient in
    Equation (4.6) is at most $theta \/ 2$. If every site in $A$ has at least $theta D$ such visitors,
    their sum of visits is at least $theta D \| A \|$, so the probability is at most $e^(- theta D \| A \| \/ 2)$.
  Finally let $cal(D)$ be failure of regularity. For any fixed large $lambda$, Lemma 16 gives $D zeta arrow.r 0$.
    If every site in $A$ has a nonregular visitor, the sum of visits by such paths is at least $\| A \|$.
    Thus Equation (4.6) bounds this probability by $exp \[ - \( lambda - o \( 1 \) \) \| A \| \]$.
    Choosing $lambda$ first and then $D$ makes its per-site parameter as small as desired.
    The same increase of $D$ makes the preceding five individual failure bounds arbitrarily small.
  There are six failure types. If every site of $A$ fails some test, assign one type to each failing site.
    In each of the at most $6^(\| A \|)$ assignments, one type occurs on a subset of size at least $\| A \| \/ 6$.
    If each single-type bound has parameter at most $epsilon$,
    the union has probability at most $\( 6 epsilon^(1 \/ 6) \)^(\| A \|)$.
    Choose $epsilon lt.eq \( p_1 \/ 6 \)^6$. This proves Equation (4.7).
    The free estimates remain valid when the already chosen $t$ is reduced and $D_0$ is then increased,
    which proves the final assertion. ◻
]

We have obtained an unconditional joint bound for the cells where the full sample is unsuitable.
  The next section estimates a trial path against a deterministic collection of such trajectories.
  We will then expose most paths in a way that preserves an exact conditional product representation for the paths
  still to be changed.

== 5 Moving a path through a neighboring cell <bridge:section>

We next estimate the cost of replacing one particle’s trajectory while preserving its two outer endpoints.
  The replacement passes through a point chosen uniformly in its home cell or a face-neighbor cell.
  Two estimates serve different purposes: averaging over many separated endpoints makes the total collision
  probability against order $D$ obstacles small, whereas a single replacement has collision probability tending to
  zero against each fixed regular obstacle.

We use the regularity conditions of Definition 15. Thus $r = alpha \/ D$, $s_0 = b D^(- 1 \/ 3)$, $h_0 = D^(- 1)$,
  and $gamma = 1 \/ 12$. Each half of $\[ 0 \, 2 t \]$ has $m_t =
  ceil.l t \/ r^2 ceil.r$ mesh intervals of length $tau = t \/ m_t$.
  For a regular path $c$, its lifted diameter on interval $k$ is $r A_k \( c \)$, where

#[#set math.equation(numbering: n => "(5.1)")
 $ max_k A_k \( c \) lt.eq D^gamma \, wide sum_(k = 1)^(2 m_t) \( 1 + A_k \( c \) \)^3 lt.eq
   2 C_(upright("reg")) m_t . $ <bridge:oscillations>]

Its diameter in each outer time window of length $h_0$ is at most $s_0 \/ 8$.
  All estimates below hold for each fixed $0 < t lt.eq 1$ and sufficiently large $D$,
  uniformly in $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$. In particular, we may require

#[#set math.equation(numbering: n => "(5.2)")
 $ tau lt.eq h_0 \/ 2 \, wide h_0 < t \/ 4 \, wide r D^gamma < 1 \, wide C tau \/ t lt.eq
   r $ <bridge:scale-restrictions>]

for any fixed geometric constant $C$ used below.

Fix a cell $B_v = v + \[ - 1 \/ 2 \, 1 \/ 2 \)^3$. Suppose that a path’s outer endpoints $y \,
  z$ have local lifts satisfying $y in B_v$ and $\| z - v \| lt.eq 3$.
  A #emph[target cell] is $B_v$ or one of its six face-neighbor cells.
  For $u$ in a target cell $B$, let $Q_(y \, z)^u$ be the law obtained by joining two independent Euclidean
  Brownian bridges, of generator $Delta$, from $y$ to $u$ and from $u$ to $z$, each of duration $t$.
  We project this path to the torus. Let

$ Q_(y \, z)^B = integral_B Q_(y \, z)^u thin upright(d) u \, wide Q_(y \, z)^0 =
  upright("the Euclidean bridge from ") y upright(" to ") z upright(" of duration ") 2 t . $

Both laws are projected to the torus. Unit cells have volume one, so $Q_(y \, z)^B$ is a probability measure.
  Write $cal(C)_v$ for the event that the replacement is regular and its local lift stays in the closed ball of
  radius $10$ about $v$. For a deterministic torus path $c$, define its collision event by

$ cal(H) \( c \) = { omega : d \( omega \( s \) \, c \( s \) \) lt.eq r upright(" for some ") s in \[ 0 \, 2 t \] } . $

The estimates concern $cal(C)_v ∩ cal(H) \( c \)$ under the unconditioned bridge laws.
  No independence between the cutoff event and the collision event is assumed.

=== 5.1 Separated endpoints and Gaussian densities <separated-endpoints-and-gaussian-densities>

#thm([Lemma 5.1.])[
  (Averaged Gaussian density).  #emph[Let $y_1 \, dots.h \,
    y_m in bb(R)^3$ have pairwise distances at least $s_0$, where $m gt.eq ell D \/ 2$ and $s_0 = b D^(- 1 \/ 3)$.
    Fix $u in bb(R)^3$ and $0 < s lt.eq t \/ 2$. The average of the time-$s$ densities of duration-$t$ Brownian
    bridges from $y_i$ to $u$ is bounded everywhere by
#[#set math.equation(numbering: n => "(5.3)")
 $ C (1 + frac(1, D s^(3 \/ 2))) . $ <bridge:packed-density>]

 Here $C$ depends on $b \, ell$, but not on $t \, s \, D$ or $u$.]
] <bridge:gaussian-packing>

#proof[
  The means are $a y_i + \( 1 - a \) u$, where $a = 1 - s \/ t gt.eq 1 \/ 2$,
    and the covariance matrix is $2 s \( 1 - s \/ t \)$ times the identity.
    The means are therefore $s_0 \/ 2$-separated. For points $q_i$ separated by $s_0 \/ 2$,
    disjoint balls of radius $s_0 \/ 4$ give
  $ \# { i : \| q_i - x \| lt.eq R } lt.eq C \( 1 + R \/ s_0 \)^3 . $
  Split the Gaussian sum into the ball of radius $sqrt(s)$ about $x$ and the annuli with radii $j
    sqrt(s) \, \( j + 1 \) sqrt(s)$, $j gt.eq 1$. The last bound,
    multiplied by the Gaussian decay on each annulus, yields
  $ sum_i exp #h(-0.16667em) (- frac(\| x - q_i \|^2, 4 s)) lt.eq C (1 + s^(3 \/ 2) / s_0^3) . $
  The covariance lies between $s$ and $2 s$ times the identity, so the averaged density is at most
  $ frac(C, m s^(3 \/ 2)) + frac(C, m s_0^3) lt.eq C (frac(1, D s^(3 \/ 2)) + 1) . $
  ◻
]

=== 5.2 Collision with a deterministic obstacle <collision-with-a-deterministic-obstacle>

#thm([Proposition 5.2.])[
  (Averaged collision bound).  #emph[Fix $m gt.eq ell D \/ 2$ pairs $\( y_i \, z_i \)$ with $y_i in B_v$ and $\|
    z_i - v \| lt.eq 3$. Assume that each of the two endpoint lists is $s_0$-separated.
    Let $c$ be a deterministic regular torus path whose outer endpoints are at distance greater than $s_0$ from
    the corresponding endpoints of every label under consideration. Then, for every target cell $B$,
#[#set math.equation(numbering: n => "(5.4)")
 $ 1 / m sum_(i = 1)^m Q_(y_i \, z_i)^B \( cal(C)_v ∩ cal(H) \( c \) \) lt.eq C t r +
   C frac(r D^(3 gamma), D sqrt(h_0)) . $ <bridge:averaged-estimate>]

 The same conclusion holds if $c$ is the original path of one of these labels:
   omit that label’s summand and retain the divisor $m$, assuming endpoint separation for all the remaining
   labels. The constant $C$ may depend on $b \, ell \, C_(upright("reg"))$, but is independent of small $t$.]
] <bridge:averaged-hit>

#proof[
  We estimate the first leg from an outer endpoint $y_i$ to the random midpoint $u$;
    reversing time gives the identical estimate for the leg from $z_i$ to $u$.
    On $cal(C)_v$, the endpoint windows of both paths have diameter at most $s_0 \/ 8$.
    Endpoint separation consequently leaves distance at least $3 s_0 \/ 4 > r$ throughout $\[ 0 \, h_0 \]$.
    Every mesh interval on which a collision remains possible starts at $s gt.eq h_0 - tau gt.eq h_0 \/ 2$.
  We first explain the use of lifts. On a mesh interval, the obstacle has diameter at most $r D^gamma < 1$.
    A collision with a confined replacement therefore requires $d \( c \( s \) \, v \) <
    12$ at the interval’s starting time. For $K > 50$ this determines a unique lift $tilde(c) \( s \)$ within
    distance $12$ of the chosen lift of $v$; continue that lift over the interval.
    Its displacement is at most $r A_k \( c \)$. Intervals for which no such lift exists make no contribution.
    We may thus use Euclidean Gaussian densities without summing over windings.
  ===== 5.2.1 The first half of a leg. <the-first-half-of-a-leg.>
  Suppose $s lt.eq t \/ 2$ and condition on $u$. If $X_s$ is the position of the trial bridge at time $s$,
    its segment of length $tau$ has the representation
  #[#set math.equation(numbering: n => "(5.5)")
   $ X_(s + q) = X_s + frac(q, t - s) \( u - X_s \) + R_q \, wide 0 lt.eq q lt.eq tau . $ <bridge:markov-segment>]
  Here $R$ is the initial segment of a centered bridge of duration $t - s$, independent of $X_s$.
    Its law does not depend on $u$ or on the endpoint label. This is the Gaussian conditional law of a bridge
    after its time-$s$ position has been specified. Equivalently, $R_q = W_q -
    q W_(t - s) \/ \( t - s \)$ for a Brownian motion $W$ of generator $Delta$.
    Gaussian maximal estimates, or the Brownian reflection bound integrated against $3 a^2 thin upright(d) a$, give
  #[#set math.equation(numbering: n => "(5.6)")
   $ B_s = 1 / r sup_(0 lt.eq q lt.eq tau) \| R_q \| \, wide bb(E) B_s^3 lt.eq C \, $ <bridge:noise-moment>]
  because $tau lt.eq r^2$ and $tau lt.eq t - s$.
  On the cutoff event, $\| X_s - v \| lt.eq 10$, whereas every target point is within distance $2$ of $v$.
    The drift term in (5.5) is thus at most $C tau \/ t lt.eq r$.
    A collision on this interval, together with the cutoff, implies
  #[#set math.equation(numbering: n => "(5.7)")
   $ \| X_s - tilde(c) \( s \) \| lt.eq r #scale(x: 120%, y: 120%)[\(] 2 + A_k \( c \) +
     B_s #scale(x: 120%, y: 120%)[\)] . $ <bridge:necessary-ball>]
  We use the cutoff only to obtain this necessary event. We now discard it and integrate the unrestricted bridge
    law. By Lemma 20, the density of $X_s$, averaged over the labels, is bounded by (5.3).
    Since $B_s$ is independent of $X_s$ and has the common bound (5.6), the averaged probability of (5.7) is at most
  #[#set math.equation(numbering: n => "(5.8)")
   $ C r^3 \( 1 + A_k \( c \) \)^3 (1 + frac(1, D s^(3 \/ 2))) . $ <bridge:early-step>]
  This estimate holds for each $u$, hence also after averaging $u$ over the target cell.
    Omitting one label only decreases the unnormalized Gaussian sum and leaves the same bound with divisor $m$.
  ===== 5.2.2 The second half of a leg. <the-second-half-of-a-leg.>
  Suppose $s > t \/ 2$. For a fixed label, write the whole unrestricted leg as
  $ X_q = \( 1 - q \/ t \) y_i + \( q \/ t \) U + beta_q \, wide 0 lt.eq q lt.eq t \, $
  where $U$ is uniform in $B$ and the centered bridge $beta$ is independent of $U$.
    Condition on the entire path $beta$. The conditional density of $X_s$ is at most $\( t \/ s \)^3 lt.eq 8$.
    The mean displacement during the mesh interval is at most $C tau \/ t lt.eq r$, uniformly in $U in B$. Put
  $ tilde(B)_s = r^(- 1) sup_(0 lt.eq q lt.eq tau) \| beta_(s + q) - beta_s \| . $
  Writing $beta_q = W_q - q W_t \/ t$ gives $bb(E) tilde(B)_s^3 lt.eq C$:
    the Brownian increment contributes $C tau^(3 \/ 2) \/ r^3$,
    and the linear correction contributes $C tau^3 \/ \( r^3 t^(3 \/ 2) \)$, both bounded.
    Conditional on $beta$, a collision requires the ball in (5.7), with $B_s$ replaced by $tilde(B)_s$.
    Both its radius and center are then fixed while $U$ retains its uniform distribution.
    Integrating first over $U$ and then over $beta$ bounds the probability by
  #[#set math.equation(numbering: n => "(5.9)")
   $ C r^3 \( 1 + A_k \( c \) \)^3 . $ <bridge:late-step>]
  In particular, no independence between $X_s$ and the fluctuation increment is needed here.
  ===== 5.2.3 Summing the intervals. <summing-the-intervals.>
  Apply the two bounds to both legs. The terms without $s^(- 3 \/ 2) \/ D$ use the averaged regularity condition:
  $ C r^3 sum_(k = 1)^(2 m_t) \( 1 + A_k \( c \) \)^3 lt.eq C r^3 m_t lt.eq C t r . $
  Here $m_t = t \/ tau$ and $tau gt.eq r^2 \/ 2$. For the remaining terms use $\( 1 + A_k \( c \) \)^3 lt.eq
    C D^(3 gamma)$ and
  $ sum_(s = j tau gt.eq h_0 \/ 2\
s lt.eq t \/ 2) s^(- 3 \/ 2) lt.eq frac(C, tau sqrt(h_0)) lt.eq frac(C, r^2 sqrt(h_0)) . $
  Their contribution is therefore at most $C r^3 D^(3 gamma) \/ \( D r^2 sqrt(h_0) \) =
    C r D^(3 gamma) \/ \( D sqrt(h_0) \)$. These two sums give (5.4).
    Every constant in these sums is independent of $t$; making $t$ smaller only increases the required lower
    threshold on $D$ in (5.2). ◻
]

#thm([Proposition 5.3.])[
  (A single replacement).  #emph[Let $y in B_v$, $\| z - v \| lt.eq 3$,
    and let $c$ be a deterministic regular path satisfying $d \( y \, c \( 0 \) \) >
    s_0$ and $d \( z \, c \( 2 t \) \) > s_0$. For either $Q = Q_(y \, z)^B$, with any target cell $B$, or $Q =
    Q_(y \, z)^0$, one has
#[#set math.equation(numbering: n => "(5.10)")
 $ Q \( cal(C)_v ∩ cal(H) \( c \) \) lt.eq C t r + C frac(r D^(3 gamma), sqrt(h_0)) lt.eq
   C alpha #scale(x: 120%, y: 120%)[\(] t D^(- 1) + D^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\)] .
   $ <bridge:single-estimate>]

 Thus this probability tends to zero with $D$ for each fixed $t$.]
] <bridge:single-hit>

#proof[
  For $Q_(y \, z)^B$, repeat the preceding proof with one endpoint.
    At $s lt.eq t \/ 2$ its Gaussian density is at most $C s^(- 3 \/ 2)$;
    the bound (5.8) becomes $C r^3 \( 1 + A_k \( c \) \)^3 s^(- 3 \/ 2)$.
    The second half of each leg retains (5.9). The same two sums give the first inequality.
  For $Q_(y \, z)^0$, use the forward orientation up to time $t$ and the reversed orientation for the rest.
    In either orientation the remaining bridge duration is at least $t$.
    Formula (5.5) holds with $2 t$ in place of $t$, its drift on the cutoff event is at most $C tau \/ t$,
    and its time-$s$ density is bounded by $C s^(- 3 \/ 2)$ for $0 < s lt.eq t$.
    Endpoint separation again excludes the window $\[ 0 \, h_0 \]$.
    Consequently the first-half argument and its mesh sum apply over both orientations,
    giving $C r D^(3 gamma) \/ sqrt(h_0)$. Adding the nonnegative term $C t r$ yields the stated common bound.
    Finally $r = alpha \/ D$, $h_0 = D^(- 1)$ and $3 gamma = 1 \/ 4$ give the last inequality. ◻
]

#prodef([Remark 5.4.])[
  The midpoint in $Q_(y \, z)^B$ is averaged over a unit cell.
    An estimate uniform in a prescribed midpoint is false: if $u = c \( t \)$, the trial collides at time $t$.
    Restricting a uniform midpoint to a measurable set of volume at least $a >
    0$ multiplies an upper bound for a nonnegative event by at most $a^(- 1)$.
    Conditioning a trial on an event of probability at least $a$ has the same cost.
    These elementary changes of measure will allow us to use Proposition 22 after choosing successful trials.
] <bridge:midpoint-quantifier>

=== 5.3 Many paths can be moved successfully <many-paths-can-be-moved-successfully>

The averaged estimate now pays for all nearby obstacles. The following statement separates that deterministic
  estimate from the random cell certificates that will supply its hypotheses.

#thm([Corollary 5.5.])[
  (Supply of successful labels).  #emph[Consider a collection of deterministic torus paths with endpoints
    $\( y_j \, z_j \)$, and fix a cell $v$. Suppose that at most $H_1
    D$ of these paths visit the ball of radius $12$ about $v$, and that every visiting path is regular.
    Suppose a list of $m gt.eq ell D \/ 2$ labels satisfies $y_i in B_v$, $\| z_i - v \| lt.eq 3$,
    and that both endpoints of every listed label are at distance greater than $s_0$ from every other endpoint in
    the corresponding full configuration.]
  #emph[Call a trial for label $i$ successful if it satisfies $cal(C)_v$ and avoids every obstacle path except the
    original path of $i$. For sufficiently small fixed $t > 0$ and then sufficiently large $D$,
    at least $9 m \/ 10$ listed labels have the following property: for each of the seven target cells $B$, the set
#[#set math.equation(numbering: n => "(5.11)")
 $ T_(i \, B) = { u in B : Q_(y_i \, z_i)^u \( upright("successful trial") \) gt.eq
   9 \/ 10 } $ <bridge:successful-target-set>]

 has volume at least $99 \/ 100$. All choices are uniform in the deterministic collection, $v$,
   and $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$.]
] <bridge:success-supply>

#proof[
  The linear means of both bridge legs stay within distance $3$ of $v$.
    The Gaussian maximal bound therefore makes confinement failure at most $C e^(- c \/ t)$.
    Lemma 16 gives a regularity failure probability $epsilon_D \( t \) arrow.r 0$,
    uniformly over the listed endpoints and the target points.
    A confined trial can collide only with an obstacle visiting the ball of radius $12$, since $r < 1$.
    Union-bounding over those obstacles and using Proposition 21,
    with a self-label summand omitted when necessary, gives for each target cell
  #[#set math.equation(numbering: n => "(5.12)")
   $ 1 / m sum_i integral_B Q_(y_i \, z_i)^u \( upright("failure") \) thin upright(d) u & lt.eq C e^(- c \/ t) +
     epsilon_D \( t \) + C H_1 D (t r + frac(r D^(3 gamma), D sqrt(h_0)))\
 & lt.eq C e^(- c \/ t) + epsilon_D \( t \) + C H_1 alpha #scale(x: 120%, y: 120%)[\(] t +
   D^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\)] . $ <bridge:total-failure>]
  The constant multiplying $t$ is independent of small $t$,
    which is the reason for the two parts of the bridge estimate.
    First choose $t$ small and then $D$ large so that the last bound is less than $1 \/
    70000$ for every $alpha$ in the fixed window.
  If $\| T_(i \, B) \| < 99 \/ 100$, the integral of the failure probability over $B$ is greater than
    $\( 1 \/ 100 \) \( 1 \/ 10 \) = 1 \/ 1000$. Thus fewer than $m \/
    70$ labels fail the conclusion for a specified target cell.
    There are seven target cells, so fewer than $m \/ 10$ labels fail for at least one of them.
    All the remaining labels have the asserted property. ◻
]

== 6 Exposing the environment and retaining movable groups <group:section>

The bridge estimates provide successful local trials. We now select many disjoint groups of labels and expose
  everything outside one group. The two outputs are different:
  most cells retain many useful labels in an unconditional probabilistic sense,
  while at each fixed exposed datum the unexposed law has an exact constrained-product formula.
  Keeping these statements separate is essential for the later likelihood comparison.

=== 6.1 Eligible labels and their local trial laws <eligible-labels-and-their-local-trial-laws>

The endpoints $Y \, Z$ and path regularity are those of Section 4. A label $i$ is #emph[eligible at $v$] if

+ $Y_i in B_v$ and $d \( Z_i \, v \) lt.eq 3$;
+ $d \( Y_i \, Y_j \) > s_0$ and $d \( Z_i \, Z_j \) > s_0$ for every $j eq.not i$;
+ its trajectory is regular and remains in the radius-$10$ ball about $v$.

The eligible sets at distinct sites are disjoint, since the starting cells form a partition.
  When $K$ is large, the confinement ball lifts injectively to Euclidean space,
  so the endpoints have unique lifts near the chosen lift of $v$.

For each eligible label $i$ at $v$, a #emph[target cell] is $B_v$ or one of its six face-neighbor cells.
  Write $Q_i^u$ for the probability law of two independent Euclidean bridges, each of duration $t$,
  from $Y_i$ to $u$ and from $u$ to $Z_i$, projected to the torus. All lifts in this definition are near $v$.
  For a collection $F$ of fixed obstacle paths with distinct labels other than $i$, put

#[#set math.equation(numbering: n => "(6.1)")
 $ C_i \( F \) = { & upright("the trial is regular and stays within distance ") 10 upright(" of ") v upright(";")\
 & upright("it avoids every path in ") F upright(" at distance ") r } . $ <group:success-event>]

Avoidance throughout means strict distance greater than $r$ at every time. The endpoints are fixed in this notation.

#thm([Lemma 6.1.])[
  (Useful labels in a certified cell).  #emph[At a cell with a certificate there are at least $ell D \/
    2$ eligible labels. After $t$ has been chosen sufficiently small and $D$ sufficiently large,
    at least nine tenths of these labels satisfy the following stronger property: for every target cell $B_w$,
#[#set math.equation(numbering: n => "(6.2)")
 $ lr(|{u in B_w : Q_i^u \( C_i \( F_i^(upright("all")) \) \) gt.eq 0.9}|) gt.eq 0.99 . $ <group:full-success>]

 Here $F_i^(upright("all"))$ consists of all other trajectories in the sampled configuration,
   and $\| dot.op \|$ denotes spatial volume.]
] <group:certified-labels>

#proof[
  Start with the at least $ell D$ labels having $Y_i in B_v$.
    Every such path visits the radius-$12$ ball and is therefore regular.
    Discard the fewer than $theta D$ visiting paths of diameter greater than one.
    The remaining paths stay within distance $2$ of $v$ and end within distance $2$ of $v$.
    Discard also those whose initial or terminal endpoint has another endpoint within distance $s_0$.
    The certificate bounds these two losses by $theta D$ each,
    since the endpoints in question lie in the radius-$5$ ball about $v$.
    The remaining labels are eligible, and their number is at least $\( ell - 3 theta \) D gt.eq ell D \/ 2$.
  We now apply Corollary 24 to the #emph[entire] eligible list at this site,
    not merely the subset just used to prove its lower cardinality bound.
    Every eligible label has its initial endpoint in $B_v$, terminal endpoint within distance three of $v$,
    and both endpoints separated from all corresponding endpoints of other labels by more than $s_0$.
    The certificate supplies at most $H_1 D$ visiting obstacles, all regular.
    These are precisely the hypotheses of that corollary. It gives Equation (6.2) for at least nine tenths of the
    entire eligible list, with choices uniform in the certificate. ◻
]

=== 6.2 Disjoint groups and the information retained <disjoint-groups-and-the-information-retained>

Choose an integer $M gt.eq 1$, to be fixed after the one-path comparison constant below, and put

#[#set math.equation(numbering: n => "(6.3)")
 $ G_D = ⌊frac(ell D, 4 M)⌋ . $ <group:number>]

At a site with at least $M G_D$ eligible labels, choose an ordered list of $M
  G_D$ distinct eligible labels uniformly without replacement,
  and divide it into $G_D$ successive groups of size $M$. If there are fewer, all groups at that site are empty.
  The allocation randomizations are independent between sites conditional on the full path sample,
  and use the eligible lists only.

Fix one group index $g in { 1 \, dots.h \, G_D }$. Let $cal(I)$ be the union of its labels over all sites.
  The #emph[exposed datum] $cal(B)$ comprises

- both endpoint configurations, every eligibility indicator, and all allocation information;
- the complete trajectories of labels outside $cal(I)$.

These last trajectories form the frozen family $F$. The law of $cal(B)$ is the pushforward of the stationary path
  law and the allocation randomizations. No certificate event is included in this datum.
  Subsequent expectations over $cal(B)$ always use this unconditional law.

For $i in cal(I)$ at site $v$, let $B_i$ be the unconditioned Euclidean bridge law of duration $2
  t$ between its near endpoint lifts. Define

#[#set math.equation(numbering: n => "(6.4)")
 $ P_i \( thin upright(d) omega_i \) =
   frac(upright(bold(1))_(C_i \( F \)) thin B_i \( thin upright(d) omega_i \), a_i) \, wide a_i =
   B_i \( C_i \( F \) \) . $ <group:reference>]

The event $C_i \( F \)$ includes the individual regularity and confinement cutoffs, as in Equation (6.1).

#thm([Proposition 6.2.])[
  (Exact conditional law).  #emph[For almost every exposed datum the normalizers in Equation (6.4) are positive,
    and the conditional law of the unexposed trajectories is
#[#set math.equation(numbering: n => "(6.5)")
 $ lambda_(cal(I)) \( thin upright(d) omega_(cal(I)) \) = 1 /
   Z_(cal(I)) upright(bold(1))_({ upright("all pairs in ") cal(I) upright(" avoid each other") })
   product_(i in cal(I)) P_i \( thin upright(d) omega_i \) \, wide Z_(cal(I)) > 0 . $ <group:product-law>]

 All reference trajectories obey their own regularity and confinement cutoffs.
   Each label has at most $C M$ other labels in this group with which a collision can be possible,
   where $C$ is a fixed geometric constant.]
] <group:conditional-law>

#proof[
  Condition first on the endpoints. By Lemma 13, the free reference is a product of torus bridges and the
    remaining interaction is the hard-avoidance indicator. At fixed endpoints,
    eligibility of an individual path consists of its own regularity and confinement conditions:
    its starting cell, endpoint displacement and endpoint separation are already fixed.
    The probabilities of all allocations depend only on the recorded eligibility indicators,
    and are consequently constant on the conditional fiber.
  Now expose all paths outside $cal(I)$. Every retained label was eligible,
    so the only remaining individual restrictions are exactly its two cutoffs and avoidance of the fixed frozen
    paths. Confinement to its radius-$10$ ball selects a single Euclidean lift when $K$ is large.
    The winding weights of the original torus bridge then depend only on the fixed endpoints and cancel in
    normalization. The remaining nonfactorizing restriction is mutual avoidance inside $cal(I)$.
    This proves Equation (6.5) by disintegration on the continuous-path spaces.
    Equivalently, integrate the asserted formula against bounded functions of the exposed and unexposed variables
    and use Fubini; all factors just identified reproduce Equation (4.1) and the allocation probabilities.
  The integral of the conditional density is positive for almost every sampled datum.
    Its positivity implies positivity of each $a_i$ and of $Z_(cal(I))$;
    otherwise that fiber would have zero weight. Finally a retained trajectory stays within distance ten of its
    home site. Two such tubes can meet at distance $r < 1$ only when their home sites are within a fixed lattice
    distance. There are at most $M$ labels per site and a fixed number of such sites, proving the last assertion.
    In particular Equation (6.5) is a conditioned product, not a claim that its trajectories are independent. ◻
]

=== 6.3 Accessibility and the probability of bad cells <accessibility-and-the-probability-of-bad-cells>

For $i in cal(I)$ and one of its target cells $B_w$, set

#[#set math.equation(numbering: n => "(6.6)")
 $ T_i \( w \) = { u in B_w : Q_i^u \( C_i \( F \) \) gt.eq 0.9 } . $ <group:targets>]

A label is #emph[accessible] if $\| T_i \( w \) \| gt.eq 0.99$ for all seven target cells.
  This property and all the sets $T_i \( w \)$ depend only on $cal(B)$.
  Let $cal(A)_v$ be the accessible labels of the fixed group at $v$.
  A site is #emph[good] if $\| cal(A)_v \| gt.eq M \/ 2$, and #emph[bad] otherwise.
  The sets in Equation (6.6) are measurable: bridge kernels are measurable in their endpoints, and regularity,
  confinement and strict avoidance are Borel events of continuous paths.

#thm([Proposition 6.3.])[
  (Unconditional supply of good cells).  #emph[For any prescribed $p > 0$,
    the constants before $M$ can be chosen as above, and then $M$ can be chosen sufficiently large,
    so that for sufficiently large $D$ and $K$,
#[#set math.equation(numbering: n => "(6.7)")
 $ bb(P)_(cal(B)) { A subset { upright("bad sites") } } lt.eq p^(\| A \|) $ <group:bad-bound>]

 for every set $A$ of distinct sites. The bound is uniform in the group index, the ground function,
   and the allowed $alpha$-window. It remains valid if $M$ is increased before increasing the lower threshold on $D$.]
] <group:supply>

#proof[
  Choose $p_1 < p \/ 2$ in Proposition 19 and meet also the requirements of Lemma 25.
    Fix the full path sample before the allocation randomizations.
    At a certified cell there are at least $ell D \/ 2 gt.eq M G_D$ eligible labels,
    and at least nine tenths satisfy Equation (6.2). For a fixed group,
    its $M$ labels form a uniform sample without replacement from this list.
    For any $k$ specified positions in that sample, the probability that all $k$ lack the stronger property is at
    most $10^(- k)$. A union bound therefore gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ bb(P) { upright("fewer than ") M \/ 2 upright(" stronger labels in the group") divides
     upright("full sample") } lt.eq q_M := 2^M 10^(- M \/ 2) . $ <group:sampling-failure>]
  This tends to zero exponentially in $M$.
  A label with the stronger property is accessible after allocation:
    its frozen obstacle family is a subset of all other sampled paths,
    so removing obstacles can only increase its success probabilities.
    Moreover the auxiliary sampling tests at distinct certified cells are independent conditional on the full
    sample. For each subset $A_0 subset A$, designate the cells of $A_0$ as lacking certificates and the other
    cells as certified but failing the sampling test. The probability of this event is at most $p_1^(\| A_0 \|)
    q_M^(\| A \\ A_0 \|)$, by conditioning first on the full sample and then using Equation (4.7).
    Summing over $A_0$ bounds the probability in Equation (6.7) by $\( p_1 + q_M \)^(\| A \|)$.
    Take $M$ large enough that $q_M < p \/ 2$. The argument applies to each group without conditioning on its tag
    or on its unexposed trajectories. ◻
]

=== 6.4 One-path comparisons at fixed exposed data <one-path-comparisons-at-fixed-exposed-data>

The remaining estimates apply at a fixed datum, even when its unexposed trajectories no longer satisfy any
  full-sample certificate. Let $i$ be accessible, let $B_w$ be a target cell,
  and let $U subset T_i \( w \)$ be a measurable set of volume at least $0.98$.
  Define the proposal $Pi_i^U$ by choosing $u$ uniformly in $U$ and then sampling $Q_i^u$ conditioned on
  $C_i \( F \)$. The target set is chosen using exposed data only;
  it must not depend on the trajectories of other unexposed labels.

#thm([Proposition 6.4.])[
  (Density and deterministic compatibility).  #emph[There is a constant $G gt.eq 2$,
    fixed after $t$ and independent of $D \, K \, M$, such that
#[#set math.equation(numbering: n => "(6.9)")
 $ Pi_i^U lt.double P_i \, wide 0 lt.eq frac(thin upright(d) Pi_i^U, thin upright(d) P_i) lt.eq G \, wide
   integral frac(thin upright(d) Pi_i^U, thin upright(d) P_i) thin upright(d) P_i = 1 . $ <group:density-bound>]

 There is also $eta_D arrow.r 0$, uniform in the exposed datum, with the following property.
   Fix any regular, confined trajectory of a distinct label in $cal(I)$, keeping its recorded endpoints.
   Under either $P_i$ or $Pi_i^U$, the probability of colliding with that deterministic trajectory is at most
   $eta_D$. Its label need not be accessible. One may take
#[#set math.equation(numbering: n => "(6.10)")
 $ eta_D = C_t #scale(x: 120%, y: 120%)[\(] t r + r D^(3 gamma) h_0^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
   C'_t D^(- 1 \/ 4) . $ <group:eta>]

]
] <group:comparison>

#proof[
  The midpoint density $g_i$ of $B_i$ is the Euclidean Gaussian with mean $\( Y_i + Z_i \) \/ 2$ and covariance $t
    I$. On every target cell it has a lower bound $c_t > 0$, uniform in the eligible endpoint data.
    Indeed those endpoints are within distance three of $v$, and every target cell lies in a fixed bounded
    neighborhood of $v$; the explicit Gaussian density gives such a bound.
    Disintegrating $B_i$ at its midpoint gives the conditional laws $Q_i^u$. Hence
  $ a_i = integral g_i \( u \) Q_i^u \( C_i \( F \) \) thin upright(d) u gt.eq 0.99 dot.op 0.9 thin c_t = : a_t > 0 . $
  At a successful trajectory with midpoint $u$, the proposal density relative to $P_i$ is
  $ frac(a_i upright(bold(1))_U \( u \), \| U \| g_i \( u \) Q_i^u \( C_i \( F \) \)) lt.eq
    frac(1, 0.98 dot.op 0.9 thin c_t) \, $
  since $a_i lt.eq 1$. Taking $G$ to be the maximum of two and this constant proves Equation (6.9);
    its final identity holds because both measures are probabilities.
  For collision with the fixed opponent, first use the unconditioned bridge $B_i$.
    The event contributing under $P_i$ satisfies the regularity and confinement cutoffs.
    Proposition 22 bounds its probability by $C \( t r + r D^(3 gamma) h_0^(- 1 \/ 2) \)$.
    Dividing by $a_i gt.eq a_t$ proves the required estimate for $P_i$.
    For the proposal, integrate that proposition’s two-leg estimate over the whole target cell;
    restricting the integral to $U$ can only decrease it. Division by $\| U \| gt.eq
    0.98$ and by the through-$u$ success probability, which is at least $0.9$, proves the proposal estimate.
    The endpoint separation required in that proposition holds because $i$ was eligible and the opponent has a
    distinct recorded label.
  Finally $gamma = 1 \/ 12$, $h_0 = D^(- 1)$ and $r = alpha \/ D$ give $r D^(3 gamma) h_0^(- 1 \/ 2) =
    alpha D^(- 1 \/ 4)$ and $t r = O_t \( D^(- 1) \)$. The $alpha$-window is fixed.
    This proves Equation (6.10), with constants depending on the already fixed $t$ but not on the later choice of
    $M$ or the dilution threshold. ◻
]

Each changed path has only $C M$ potential opponents by confinement.
  Consequently a union of a fixed number of comparison copies has a one-variable failure bound of the form $C M
  eta_D$. The comparison argument will choose $M$ after $G$, then increase $D$ so that this quantity is small.
  No success probability is multiplied along the entire length of a lattice path:
  the normalizers for separated changes will cancel in the second-moment calculation.

== 7 Paths through a sparse set of obstacles <lat:section>

The comparison of particle laws will move labels along paths of usable cells.
  Two such paths may each be long, but their mutual encounters must have a bounded exponential moment.
  We combine a purely geometric skeleton law from the companion article with the joint bad-cell bound.
  The detours and their probability estimates are proved here;
  the bad cells need not be independent or translation invariant.

Write $cal(L)_K = \( bb(Z) \/ K bb(Z) \)^3$, with periodic maximum distance $d_oo$.
  Nearest-neighbor edges join vertices differing by one in one coordinate;
  $*$-edges join distinct vertices at maximum distance one.
  A random datum $cal(D)$ determines a bad set $cal(B) subset cal(L)_K$. All other vertices are called good.
  Our assumption is

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(P) \( A subset cal(B) \) lt.eq p^(\| A \|) wide \( A subset cal(L)_K \) . $ <lat:bad-law>]

An ordered pair $\( v \, w \)$ is admissible if the forward displacement of its first coordinate has an integer
  representative $n$ with $ceil.l K \/ 10 ceil.r lt.eq n lt.eq floor.l K \/ 8 floor.r$,
  and its two transverse displacements have representatives $d_2 \, d_3$ satisfying $\| d_i \| lt.eq n$.
  These representatives determine the lift displacement $\( n \, d_2 \, d_3 \)$ uniquely.
  Set $upsilon_0 = 1 \/ 2000$. For two simple paths $pi \, pi'$ define

#[#set math.equation(numbering: n => "(7.2)")
 $ J_R \( pi \, pi' \) = sum_(z in pi) sum_(z' in pi') upright(bold(1))_({ d_oo \( z \, z' \) lt.eq R }) .
   $ <lat:contact-definition>]

Here a simple path visits each vertex at most once.

#thm([Proposition 7.1.])[
  (Good paths with bounded encounters).  #emph[Fix an integer $R gt.eq 1$.
    There are constants $p_0 \, kappa > 0$, $C_(upright("path")) < oo$, and an integer $K_0$,
    depending only on $R$, with the following property. Suppose $K gt.eq K_0$ and (7.1) holds with $p lt.eq p_0$.
    For every admissible ordered pair $\( v \, w \)$ there is a $cal(D)$-measurable event $cal(E)_(v \, w)$ of
    probability at least $1 \/ 2$. On this event there is a measurable probability kernel on simple good
    nearest-neighbor paths from $v$ to $w$. Two independent draws from this kernel, conditional on $cal(D)$, satisfy
#[#set math.equation(numbering: n => "(7.3)")
 $ bb(E) [upright(bold(1))_(cal(E)_(v \, w)) bb(E) [e^(kappa J_R \( pi \, pi' \)) divides cal(D)]] lt.eq
   C_(upright("path")) . $ <lat:encounter>]

 The constants are uniform in the datum, its law, and the endpoint pair.
   For every sufficiently large $K$, at least $upsilon_0 K^6$ ordered pairs are admissible.]
] <lat:paths>

The event is determined before drawing the paths. The expectation in (7.3) averages over one common environment
  and two fresh path samples; it is not a bound for every fixed environment. We will use the proposition with $R = 30$.

=== 7.1 The geometric skeleton input <lat:skeleton-law>

The geometric input is the explicit law in #cite(label("SoftCompanion")) Section 8.1, pp. 22–24;
  Lemma 8.1 and Equations (24)–(25), p. 23. Its use of unpredictability and intersection moments follows
  Benjamini, Pemantle and Peres #cite(label("BPP1998")) Theorem 1.3 and Lemma 3.1;
  finite-endpoint synchronization averages were developed by Abbe, Massoulié, Montanari,
  Sly and Srivastava #cite(label("AbbeMassoulieMontanariSlySrivastava2018")) Section 6, Lemma 6.1.
  Garban and Spencer #cite(label("GarbanSpencer2023")) Theorem 2.4 and Lemma 2.5 adapt this path-averaging method
  to symmetry breaking in classical disordered spin systems.
  We restate the law and both estimates independently of any gas parameters.

Fix an admissible pair, choose a lift of $v$, and give $w$ the lift $v + \( n \, d_2 \, d_3 \)$.
  For each $j in { 2 \, 3 }$ use independent random variables $U_(ell \, k)^(\( j \))$,
  uniform on $\[ - 1 \, 1 \]$, for integers $ell \, k gt.eq 0$. Put

#[#set math.equation(numbering: n => "(7.4)")
 $ v_i^(\( j \)) = c_(upright("vel")) sum_(ell gt.eq 0) 2^(- ell \/ 4)
   U_(ell \, floor.l \( i - 1 \) \/ 2^ell floor.r)^(\( j \)) \, wide Z_t^(\( j \)) =
   sum_(i = 1)^t v_i^(\( j \)) \, wide Z_0^(\( j \)) = 0 . $ <lat:velocity-law>]

As in the companion, fix $c_(upright("vel")) = \( 1 - 2^(- 1 \/ 4) \) \/ 2$,
  so that $c_(upright("vel")) sum_(ell gt.eq 0) 2^(- ell \/ 4) = 1 \/ 2$.
  The series converges absolutely for every sample. The base vertices are

#[#set math.equation(numbering: n => "(7.5)")
 $ u_t = v +
   (t \, ⌊t d_2 \/ n + Z_(min \( t \, n - t \))^(\( 2 \))⌋ \, ⌊t d_3 \/ n + Z_(min \( t \, n - t \))^(\(
   3 \))⌋) \, wide 0 lt.eq t lt.eq n . $ <lat:nominal>]

The endpoints are $v \, w$. Each base increment advances the first coordinate by one and changes each transverse
  coordinate by at most two. Refine it by first making the first-coordinate step,
  then all required steps in coordinate two, then those in coordinate three.
  This takes at most five nearest-neighbor steps. The occurrence list consists of the initial vertex and the
  vertex reached after each step, without adding an extra copy at the join between consecutive refinements.
  Denote the projected walk by $Gamma$ and retain this lift for the detour construction.

For two independent copies $Gamma \, Gamma'$ of this law and a fixed integer $R_s gt.eq 1$, define the occurrence count

#[#set math.equation(numbering: n => "(7.6)")
 $ J_(upright("occ"))^(\( R_s \)) = sum_(z in Gamma) upright(bold(1))_({ d_oo \( z \, Gamma' \) lt.eq R_s }) +
   sum_(z' in Gamma') upright(bold(1))_({ d_oo \( z' \, Gamma \) lt.eq R_s }) . $ <lat:occurrence-count>]

Both sums count occurrences, including any repetitions. For a fixed $B > 0$, put

$ S_B \( Gamma \, Gamma' \) = sum_(z in Gamma) e^(- d_oo \( z \, Gamma' \) \/ B) \, $

again counting occurrences. The companion estimates are

#[#set math.equation(numbering: n => "(7.7)")
 $ bb(E) e^(alpha_s J_(upright("occ"))^(\( R_s \))) & lt.eq C_(upright("hit")) \, & alpha_s & =
   frac(c_(upright("hit")), \( 1 + R_s \)^2) \,\
bb(E) e^(xi \( B \) S_B \( Gamma \, Gamma' \)) & lt.eq C \( B \) \, & xi \( B \) & > 0 . $ <lat:imported-hit>]

Here $c_(upright("hit")) > 0$ and $C_(upright("hit")) < oo$ are absolute,
  and the second line’s constants depend only on $B$. Both bounds are uniform in $K$ and the admissible endpoint
  pair. The law and these two bounds are the sole companion input; no interaction, density, temperature,
  or many-body measure occurs in their hypotheses. We use independent skeleton seeds,
  also independent of the exposed datum $cal(D)$.

For later use we convert the occurrence count to our pair count.
  Every first-coordinate level of a lifted skeleton contains at most five occurrences:
  level zero has only the initial vertex, and all vertices created in the $t$th refinement have first coordinate
  $v_1 + t$. The first-coordinate span is $n lt.eq K \/ 8$,
  so the periodic distance between two such levels is their ordinary distance.
  A fixed occurrence of $Gamma$ can therefore have at most $5 \( 2 R + 1 \)$ opposing occurrences within distance
  $R$. With $R_s = R$, this proves

#[#set math.equation(numbering: n => "(7.8)")
 $ J_R \( Gamma \, Gamma' \) lt.eq 5 \( 2 R + 1 \) J_(upright("occ"))^(\( R \)) . $ <lat:pair-occurrence>]

The left side uses the double occurrence sum from Equation (7.2).
  This conversion uses the actual refinement law, as well as its moment bounds.

=== 7.2 Finite components and their exterior boundaries <finite-components-and-their-exterior-boundaries>

We record the deterministic facts used to move a lattice path around bad vertices.
  For a finite $*$-connected nonempty set $C subset bb(Z)^3$,
  let $"fill" \( C \)$ consist of $C$ and all finite nearest-neighbor components of $bb(Z)^3 \\ C$.
  The remaining component is the exterior. There is only one infinite component:
  outside any box containing $C$, nearest-neighbor vertices communicate, and every infinite component meets that region.

#thm([Lemma 7.2.])[
  (Exterior shell).  #emph[The set $"fill" \( C \)$ lies in the coordinate bounding box of $C$.
    The exterior vertices at maximum distance one from $C$ form a nearest-neighbor connected set,
    denoted $partial_(*)^(upright("ext")) C$, with at most $26 \| C \|$ vertices.
    If $C$ is a $*$-component of a larger bad set, every vertex of this shell is good.]
] <lat:boundary>

#proof[
  A vertex outside the coordinate box has a coordinate ray to infinity that misses $C$,
    so it is not in a finite complementary component. For the shell’s connectivity we apply Kesten’s
    boundary-connectivity theorem in the formulation of Timár #cite(label("Timar2013")) arXiv version 2,
    Theorem 4: for a finite $*$-connected subset of $bb(Z)^3$, its exterior $*$-neighbors,
    accessible from infinity through its nearest-neighbor complement, are nearest-neighbor connected.
    These are exactly the vertices in the shell just defined.
    There are at most $26$ possible $*$-neighbors per vertex of $C$.
    A bad shell vertex would be $*$-adjacent to $C$ and hence belong to the same bad component,
    which is impossible for a vertex outside $C$. ◻
]

For an integer $a gt.eq 1$, range-$a$ adjacency joins distinct torus vertices whose maximum distance is at most $a$.

#thm([Lemma 7.3.])[
  (Small periodic components).  #emph[Suppose $K > 2 a$, and a range-$a$ component on $cal(L)_K$ has $m$ vertices
    with $a m < K$. Each of its lifts to $bb(Z)^3$ is a finite component projecting bijectively onto it.
    The coordinate span of a lift is at most $a \( m - 1 \)$.]
] <lat:small-lifts>

#proof[
  Choose a spanning tree, lift its root, and lift each tree edge by its unique displacement in $\[ - a \, a \]^3$.
    Distinct torus vertices have distinct lifts. The difference between any two lifted vertices has maximum norm
    at most $a \( m - 1 \)$, by their tree path. For a remaining edge,
    its assigned endpoint difference minus its short displacement belongs to $K
    bb(Z)^3$ and has maximum norm at most $a m < K$. It must therefore vanish.
    All edges are consistent with these lifts. The full inverse image is their disjoint translates by $K bb(Z)^3$;
    no edge connects two translates. ◻
]

We will also use a basic counting bound. For each fixed range $a$,
  there is a constant $A_a$ such that the number of connected sets of $m$ vertices containing a specified root is
  at most $A_a^m$, on either $bb(Z)^3$ or the torus. To see this,
  choose deterministically a rooted spanning tree for each set and traverse it depth first.
  The traversal has $2 \( m - 1 \)$ steps, each chosen from a fixed finite set of possible displacements,
  and its visited vertices recover the set. Increasing $A_a$ covers $m = 1$. Together with (7.1), this gives

#[#set math.equation(numbering: n => "(7.9)")
 $ bb(P) \( upright("a range-") a upright(" bad component has at least ") m upright(" vertices") \) lt.eq
   K^3 \( A_a p \)^m . $ <lat:large-animal>]

A component of size at least $m$ contains a connected subset of exactly $m$ vertices,
  by growing a spanning tree one vertex at a time.

Fix $a_1 = R + 2$. Reject the environment if it contains a range-$a_1$ bad component of size at least

$ m_K = ⌊frac(K, 10 a_1)⌋ . $

For large $K$, every remaining bad $*$-component has finite periodic lifts, by Lemma 31.
  Reject also if either endpoint belongs to the projection of the fill of one of these components.
  The event on which neither rejection occurs is $cal(E)_(v \, w)$.

If the fill of a lifted $*$-component of size $m$ contains a lift of an endpoint,
  some root of the component lies within maximum distance $m$ of that endpoint.
  This follows from the bounding-box assertion and the coordinate span in Lemma 31.
  There are at most $C m^3$ possible roots modulo $K$. Counting connected sets and using (7.1) thus yields

#[#set math.equation(numbering: n => "(7.10)")
 $ bb(P) \( cal(E)_(v \, w)^c \) lt.eq K^3 \( A_(a_1) p \)^(m_K) +
   C sum_(m gt.eq 1) m^3 \( A_1 p \)^m . $ <lat:rejection>]

The constant includes both endpoints. First make $p_0$ small enough that the series is at most $1 \/ 4$,
  then make $K_0$ large enough that the first term is at most $1 \/ 4$ for $p lt.eq p_0$ and $K gt.eq K_0$.
  This proves $bb(P) \( cal(E)_(v \, w) \) gt.eq 1 \/ 2$. We may decrease $p_0$ further below.

=== 7.3 Nearest-neighbor detours <nearest-neighbor-detours>

Draw the skeleton of Section 7.1 independently of the datum.
  Its folding in Equation (7.5) fixes the final endpoint without conditioning the random process on a future
  value. We now adapt this nearest-neighbor walk to the bad set while keeping the endpoint rejection event fixed.

On $cal(E)_(v \, w)$, replace the visits of this lifted walk to bad components as follows.
  If it meets a lifted bad $*$-component $C$, take its first and last visits to $C$.
  The vertices immediately before and after these visits belong to $partial_(*)^(upright("ext")) C$:
  the path from the first endpoint to the first such vertex misses $C$,
  and the path from the last such vertex to the other endpoint misses $C$;
  both endpoints are outside $"fill" \( C \)$. By Lemma 30,
  join these two shell vertices by a simple nearest-neighbor path in the shell,
  replacing the intervening part of the walk. The added vertices are all good.
  Each replacement removes at least one bad visit, and no replacement introduces a bad visit.
  The process therefore terminates after finitely many steps.

Every component treated in this procedure was met by the original nominal refinement:
  any remaining bad vertex still belongs to that original walk.
  Project the final walk to the torus and erase loops in chronological order.
  The result is a simple good nearest-neighbor path from $v$ to $w$.
  Every nonnominal vertex belongs to the shell of a bad $*$-component met by $Gamma$.
  All choices in the refinement, shell paths, and erasure can be made using fixed orderings.
  Thus the construction gives the measurable kernel in Proposition 29.

We now bound the encounters introduced by this construction.
  Use two independent nominal samples $Gamma \, Gamma'$ in the same environment, and let $pi \,
  pi'$ be their final simple paths. Let $H$ range over the range-$a_1$ bad components on the torus.
  Fix $C_R = 52 \( 2 R + 1 \)^3$, which also exceeds $5 \( 2 R + 1 \)$ in Equation (7.8). On $cal(E)_(v \, w)$,

#[#set math.equation(numbering: n => "(7.11)")
 $ J_R \( pi \, pi' \) & lt.eq J_R \( Gamma \, Gamma' \)\
 & quad +
   C_R sum_H \| H \|
   upright(bold(1))_({ d_oo \( H \, Gamma \) lt.eq a_1 \, thin d_oo \( H \, Gamma' \) lt.eq a_1 }) .
   $ <lat:detour-charge>]

For nominal walks, $J_R$ here counts vertex occurrences, which only increases the bound.

To prove (7.11), first count encounters where both vertices are nominal. These are bounded by the first term.
  If a nonnominal vertex belongs to the shell of $C$ and encounters a nominal vertex of the other walk,
  then $C$ is within distance $R + 1 lt.eq a_1$ of that other walk, and $C$ meets its own nominal walk.
  If two nonnominal vertices belong to shells of $C \, C'$, then $d_oo \( C \, C' \) lt.eq R + 2 lt.eq a_1$,
  so both components belong to one range-$a_1$ component $H$ meeting both nominal walks.
  Charge each such encounter to one of its nonnominal vertices and to this $H$.
  There are at most $26 \| H \|$ possible added vertices associated to the $*$-components inside $H$,
  even if several lifted copies were used: projection can only decrease this number.
  Each such vertex encounters at most $\( 2 R + 1 \)^3$ vertices of the other simple path.
  Charging from either path costs at most an additional factor two. This proves the claimed bound.

=== 7.4 Averaging the environment and applying both moments <averaging-the-environment-and-applying-both-moments>

Fix both complete nominal paths. Their independence from $cal(D)$ leaves (7.1) available for any prescribed
  collection of bad vertices. Expand the exponential of the second term in (7.11) as a product over the actual
  range-$a_1$ components. A term corresponding to distinct components has disjoint vertex sets.
  Drop maximality, sum over all disjoint connected candidate sets, and apply (7.1).
  Finally drop the disjointness restriction and use $1 + x lt.eq e^x$. The resulting bound is

#[#set math.equation(numbering: n => "(7.12)")
 $ & bb(E)_(cal(D))
   [upright(bold(1))_(cal(E)_(v \, w)) exp (kappa C_R sum_H \| H \| upright(bold(1))_({ d_oo \( H \, Gamma \) \,
   d_oo \( H \, Gamma' \) lt.eq a_1 }))]\
 & wide lt.eq
   exp
   (sum_F \( p e^(kappa C_R) \)^(\| F \|) upright(bold(1))_({ d_oo \( F \, Gamma \) \, d_oo \( F \, Gamma' \)
   lt.eq a_1 })) \, $ <lat:environment-expansion>]

where $F$ ranges over all nonempty range-$a_1$ connected torus sets.
  The factor $e^(kappa C_R \| F \|) - 1$ from the expansion was bounded above by $e^(kappa C_R \| F \|)$.
  Thus only joint bad-set probabilities were used; there is no independence assumption on the environment.

We bound the exponent by the soft-distance statistic in Equation (7.7).
  If a contributing set $F$ has size $m$, choose an occurrence $z in
  Gamma$ within distance $a_1$ of a root of $F$. There are at most $\( 2 a_1 + 1 \)^3$ root choices for each $z$,
  and at most $A_(a_1)^m$ connected sets at each root. A spanning-tree path in $F$ has at most $m - 1$ edges,
  each of length at most $a_1$ in the periodic maximum metric.
  Since $F$ is also within $a_1$ of $Gamma'$, the triangle inequality gives

$ d_oo \( z \, Gamma' \) lt.eq 2 a_1 + a_1 \( m - 1 \) = a_1 \( m + 1 \) . $

This argument applies even to wrapping candidate sets; only the actual components used for detours required the
  earlier lift and rejection test. Absorb the root choices into a constant $A_R gt.eq 1$.
  The exponent in Equation (7.12) is at most

#[#set math.equation(numbering: n => "(7.13)")
 $ sum_(z in Gamma) sum_(m gt.eq 1) q^m upright(bold(1))_({ d_oo \( z \, Gamma' \) lt.eq a_1 \( m + 1 \) }) \,
   wide q = A_R p e^(kappa C_R) . $ <lat:animal-series>]

All constants here depend only on the fixed $R$. Counting the same set more than once only increases this
  nonnegative upper bound.

Require $q lt.eq e^(- 2)$. If $d lt.eq a_1 \( m + 1 \)$, split $q^m$ into two equal powers and use

$ q^m = q^(m \/ 2) q^(m \/ 2) lt.eq q^(m \/ 2) e^(- m) lt.eq e thin q^(m \/ 2) e^(- d \/ a_1) . $

Summing the first factor over $m gt.eq 1$ proves

#[#set math.equation(numbering: n => "(7.14)")
 $ sum_(m gt.eq 1) q^m upright(bold(1))_({ d lt.eq a_1 \( m + 1 \) }) lt.eq eta \( p \, kappa \) e^(- d \/ a_1) \,
   wide eta \( p \, kappa \) = frac(e sqrt(q), 1 - sqrt(q)) . $ <lat:soft-animal-sum>]

In particular $eta \( p \, kappa \) arrow.r 0$ as $p arrow.r 0$ at fixed $kappa$. Set $B = a_1$.
  Equations (7.11), (7.8), and (7.12)–(7.14) give

#[#set math.equation(numbering: n => "(7.15)")
 $ bb(E)_(cal(D)) [upright(bold(1))_(cal(E)_(v \, w)) e^(kappa J_R \( pi \, pi' \)) divides Gamma \, Gamma'] lt.eq
   exp (kappa C_R J_(upright("occ"))^(\( R \)) + eta \( p \, kappa \) S_B \( Gamma \, Gamma' \)) .
   $ <lat:moment-reduction>]

On the left, the adapted paths are used only on $cal(E)_(v \, w)$.
  The environment was averaged once, with both entire skeletons fixed.

First choose $kappa > 0$ with $2 kappa C_R lt.eq alpha_R$, where $alpha_R = c_(upright("hit")) \/ \( 1 + R \)^2$.
  Next choose $p_0 > 0$ so small that $q lt.eq e^(- 2)$ and $2 eta \( p \, kappa \) lt.eq xi \( B \)$ for $p lt.eq
  p_0$, as well as the earlier endpoint rejection requirements.
  The constants $K_0$ can then be enlarged to cover those rejection estimates.
  Cauchy–Schwarz and both imported moments imply

$ bb(E) exp (kappa C_R J_(upright("occ"))^(\( R \)) + eta S_B) & lt.eq
  (bb(E) e^(2 kappa C_R J_(upright("occ"))^(\( R \))))^(1 \/ 2) (bb(E) e^(2 eta S_B))^(1 \/ 2)\
 & lt.eq sqrt(C_(upright("hit")) C \( B \)) = : C_(upright("path")) < oo . $

Together with Equation (7.15), this proves the annealed bound (7.3).
  Both path draws use one common datum and independent skeleton seeds.
  The event retains its original mass; there is no renormalization by conditioning on acceptance and no assertion
  of a bound for each fixed environment.

Finally, for $K gt.eq 80$ the interval $\[ ceil.l K \/ 10 ceil.r \, floor.l K \/ 8 floor.r \]$ contains at least
  $K \/ 40 - 1 gt.eq K \/ 80$ integers. For each such $n$, there are $\( 2 n + 1 \)^2 gt.eq
  K^2 \/ 25$ transverse choices. They are distinct modulo $K$, since $2 n < K$.
  Multiplying by the $K^3$ choices of starting vertex gives at least $K^6 \/ 2000 =
  upsilon_0 K^6$ admissible ordered pairs. This completes Proposition 29.

== 8 A common measure and a uniform modulus bound <cmp:section>

We now prove that the nonnegative ground function $Phi$ has a fixed positive constant-orbital occupation.
  The input is the conditional product law of the unexposed trajectories from Section 6,
  together with the good lattice paths of Proposition 29. We change selected trajectories along one such path.
  Two assignments of their midpoints give the same observed bath after different tagged particles are removed.
  The main estimate shows that the second moment of this change of measure costs only encounters between two
  lattice paths, rather than their lengths.

All constants in this section are independent of $D$, $K$,
  and the ground vector once the earlier fixed parameters have been chosen.
  We first express the occupation as a sum of affinities between two tagged position measures and construct a
  common measure for them. We then prove the conditional normalizer estimate that bounds this measure’s second moments.

=== 8.1 Affinity and a common finite measure <affinity-and-a-common-finite-measure>

For finite nonnegative measures $P \, Q$ on the same measurable space, define their affinity by

$ sans(H) \( P \, Q \) = integral sqrt(p q) thin upright(d) xi \, wide p =
  frac(thin upright(d) P, thin upright(d) xi) \, quad q = frac(thin upright(d) Q, thin upright(d) xi) \, quad xi =
  P + Q . $

Using another dominating measure gives the same value. We will use three elementary properties.
  If $P gt.eq P'$ and $Q gt.eq Q'$, then $sans(H) \( P \, Q \) gt.eq sans(H) \( P' \, Q' \)$.
  For finite lists of measure pairs,

#[#set math.equation(numbering: n => "(8.1)")
 $ sans(H) (sum_j P_j \, sum_j Q_j) gt.eq sum_j sans(H) \( P_j \, Q_j \) . $ <cmp:affinity-superadditive>]

Indeed, pointwise Cauchy–Schwarz gives $sum_j sqrt(p_j q_j) lt.eq sqrt(\( sum_j p_j \) \( sum_j q_j \))$.
  Finally, applying the same probability kernel to both measures cannot decrease affinity.
  To see this, form the joint measures with that kernel and then condition a common dominating measure on the
  output. Conditional Cauchy–Schwarz gives $bb(E) \( sqrt(p q) divides upright("output") \) lt.eq
  sqrt(bb(E) \( p divides upright("output") \) bb(E) \( q divides upright("output") \))$.
  Integration proves the assertion. Projection is a special case.

#thm([Lemma 8.1.])[
  (A common finite measure).  #emph[Let $P \, Q$ be finite nonnegative measures and let $nu$ be a finite measure
    of mass $m > 0$, absolutely continuous with respect to both. If
$ integral (frac(thin upright(d) nu, thin upright(d) P))^2 thin upright(d) P lt.eq C_P \, wide
  integral (frac(thin upright(d) nu, thin upright(d) Q))^2 thin upright(d) Q lt.eq C_Q \, $

 then $sans(H) \( P \, Q \) gt.eq m^2 \/ sqrt(C_P C_Q)$.]
] <cmp:holder>

#proof[
  With densities $p \, q \, s$ relative to a common dominating measure, Hölder’s inequality with exponents $4 \,
    4 \, 2$ gives
  $ m = integral (s^2 / p)^(1 \/ 4) (s^2 / q)^(1 \/ 4) \( p q \)^(1 \/ 4) lt.eq
    C_P^(1 \/ 4) C_Q^(1 \/ 4) sans(H) \( P \, Q \)^(1 \/ 2) . $
  The ratios can be set to zero where their denominators vanish, since $s$ is zero there.
    Squaring and rearranging proves the claim. ◻
]

=== 8.2 Cell measures and disjoint groups of tags <cell-measures-and-disjoint-groups-of-tags>

Recall $V = K^3$, $D = N \/ V$, and the unit cells $B_v$.
  From this point onward, $Y = \( x_2 \, dots.h \, x_N \)$ again denotes the ordered bath,
  rather than a full outer endpoint configuration. For ordered cells $v \, w$,
  define finite measures on $\( x \, y \, Y \) in B_v times B_w times Lambda_K^(N - 1)$ by

#[#set math.equation(numbering: n => "(8.2)")
 $ thin upright(d) P_(v w) = V Phi \( x \, Y \)^2 thin upright(d) x thin upright(d) y thin upright(d) Y \, wide
   thin upright(d) Q_(v w) = V Phi \( y \, Y \)^2 thin upright(d) x thin upright(d) y thin upright(d) Y .
   $ <cmp:cell-measures>]

The occupation formula gives the exact identity

#[#set math.equation(numbering: n => "(8.3)")
 $ B \( Phi \) = 1 / V^2 sum_(v \, w) sans(H) \( P_(v w) \, Q_(v w) \) . $ <cmp:cell-affinity>]

Fix a group index $1 lt.eq g lt.eq G_D := floor.l ell D \/ \( 4 M \) floor.r$ from Section 6.
  Its exposed data are $cal(B)$, its unexposed label set is $cal(I)$,
  and its conditional path law is $lambda_(cal(I))$ from Proposition 26.
  Define measures $hat(P)_g \, hat(Q)_g$ that retain $cal(B)$ as well as $\( x \, y \, Y \)$.
  For $hat(P)_g$, sample the data and the conditional unexposed paths,
  and #emph[sum] the following contributions over all $i in cal(I)$:
  take $x = omega_i \( t \)$, restrict to $x in B_v$, order the remaining $N -
  1$ midpoints by a fresh uniform permutation to form $Y$, and sample $y$ uniformly in $B_w$.
  For $hat(Q)_g$, take the tagged midpoint as $y in B_w$ and sample the extra point $x$ uniformly in $B_v$.
  The use of a sum, rather than a uniformly chosen tag, fixes their normalization.

#thm([Lemma 8.2.])[
  (Tag normalization).  #emph[For each ordered pair of cells,
#[#set math.equation(numbering: n => "(8.4)")
 $ sans(H) \( P_(v w) \, Q_(v w) \) gt.eq 1 / D sum_(g = 1)^(G_D) sans(H) \( hat(P)_g \, hat(Q)_g \) .
   $ <cmp:group-affinity>]

]
] <cmp:tag-normalization>

#proof[
  Put all groups on the original stationary sample, with all allocation randomizations and a fresh uniform
    permutation of the full label set. After deleting a tag, the restricted permutation uniformly orders its bath.
    Each group’s conditional construction is a disintegration of this common sample with respect to its own
    exposed data. Thus the differing data spaces are projected away before the following comparison;
    no conditional symmetry of the unexposed-path law is asserted.
    For every sampled path configuration, group label sets are disjoint.
    Their sum of tag contributions is bounded by the sum over all $N$ trajectory labels.
    The unrestricted midpoint vector has the symmetric density $Phi^2$.
    For each fixed tag label, uniform ordering of the bath therefore gives the same density $Phi \( x \, Y \)^2$.
    Summing all tags gives $N$ times that density. Since the extra target cell has volume one and $V \/ N =
    1 \/ D$, projecting away the data yields
  $ 1 / D sum_g "proj" hat(P)_g lt.eq P_(v w) \, wide 1 / D sum_g "proj" hat(Q)_g lt.eq Q_(v w) . $
  Use monotonicity, (8.1), and the increase of affinity under projection.
    Its homogeneity supplies the factor $1 \/ D$. ◻
]

The remaining task is to find, for each retained group and each of many ordered cell pairs,
  a common measure of mass at least $1 \/ 2$ whose squared likelihood integrals against $hat(P)_g$ and $hat(Q)_g$
  are bounded by one constant $C_2$. Lemma 32 would then give affinity at least $1 \/ \( 4 C_2 \)$ per group.
  The factor $1 \/ D$ in Equation (8.4) can be paid because the number of disjoint groups is proportional to $D$.

=== 8.3 Two midpoint assignments with the same observed bath <two-midpoint-assignments-with-the-same-observed-bath>

Take $R = 30$ in Proposition 29, and fix an admissible ordered cell pair $v \, w$:
  its lift displacement $\( n \, d_2 \, d_3 \)$ satisfies $ceil.l K \/ 10 ceil.r lt.eq n lt.eq
  floor.l K \/ 8 floor.r$ and $\| d_i \| lt.eq n$. Choose the good-site parameters of Proposition 27 to meet the
  bad-set hypothesis of Proposition 29. Let $cal(E)_(v w)$ be the data-measurable event supplied by
  Proposition 29, of probability at least $1 \/ 2$. On this event draw a simple nearest-neighbor path

$ z_0 = v \, z_1 \, dots.h \, z_d = w $

through good sites. For each $k < d$, independently choose a uniform accessible label $i_k$ anchored at $z_k$.
  The choices inspect only $cal(B)$ and the lattice path. In particular,
  they do not inspect any latent trajectory. The selected labels are distinct because their anchors are distinct.

We construct two path configurations that share their observed $\( x \, y \, Y \)$.
  First sample all unselected unexposed trajectories from their exact marginal under $lambda_(cal(I))$.
  For every vertex $z_k$, prepare a factor as follows. The first copy needs label $i_k$ through this cell if $k <
  d$, and the second copy needs label $i_(k - 1)$ through it if $k > 0$.
  Intersect the corresponding good-target sets $T_(i_k) \( z_k \)$ and $T_(i_(k - 1)) \( z_k \)$ from Section 6,
  using only the one required set at an endpoint. The intersection, denoted by $A_k$, has volume at least $0.98$.
  Sample $U_k$ uniformly in $A_k$, and then independently sample the one or two required bridge trials through
  $U_k$, each conditioned on its individual success against the frozen paths.
  All $d + 1$ vertex factors are independent before the additional conditioning below.
  Figure 1 shows the two midpoint assignments.

Use $U_d$ as the extra point in the first copy and $U_0$ as the extra point in the second copy.
  Impose all remaining hard-avoidance checks in both copies:
  selected paths must avoid the unselected unexposed paths and one another within their respective copies.
  Condition the product of vertex factors on these checks, separately for each fixed collection of unselected
  paths. The sampled unselected-path marginal therefore remains its original marginal under $lambda_(cal(I))$.

We verify that this conditional construction is defined. A vertex factor carries at most two paths,
  each with a marginal of the form $Pi_i^(A_k)$ in Proposition 28.
  Its paths are confined within distance ten of their anchors,
  and there are at most $M$ unexposed labels per anchor. Consequently each factor has at most $C_(upright("col"))
  M$ possible opponents in the two copies, for a fixed geometric constant $C_(upright("col"))$.
  All opponents have distinct labels within the copy in which a check is imposed.
  The deterministic-opponent estimate, summed over those checks, gives

#[#set math.equation(numbering: n => "(8.5)")
 $ chi_D = C_(upright("col")) M eta_D arrow.r 0 wide \( D arrow.r oo \, med M upright(" fixed") \) .
   $ <cmp:compatibility>]

For any fixed regular and confined values of the other paths with their recorded endpoints,
  the factor passes every incident check with probability at least $1 - chi_D$.
  This statement averages its common midpoint over $A_k$; it makes no claim at a prescribed midpoint.
  It uses the two path marginals and a union bound, so no independence of the paths within the factor is required.
  Inserting the $d + 1$ factors successively now bounds the two-copy conditioning probability below by
  $\( 1 - chi_D \)^(d + 1) > 0$ for sufficiently large $D$.

Tag $i_0$ in the first copy and $i_(d - 1)$ in the second.
  In each copy the tag and the extra point then give $x = U_0$, $y = U_d$.
  The selected bath midpoints in both copies are exactly $U_1 \, dots.h \, U_(d - 1)$;
  the unselected midpoints also agree. Choose a common uniform ordering of the shared midpoint instances;
  their physical labels in the two copies may differ. In each copy separately,
  this has the uniform ordering law determined by its paths and its tag.
  This defines a single finite measure $hat(nu)$ on $\( cal(B) \, x \, y \, Y \)$ after averaging the data,
  routes and labels, with zero mass off $cal(E)_(v w)$. Each conditional sampling law on this event is a
  probability measure, so

#[#set math.equation(numbering: n => "(8.6)")
 $ hat(nu) \( upright("all") \) = bb(P) \( cal(E)_(v w) \) gt.eq 1 / 2 . $ <cmp:common-mass>]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.8925), [#text(size: 9pt)[$U_0$]])
  content((2.45, 0.8925), [#text(size: 9pt)[$U_1$]])
  content((4.9, 0.8925), [#text(size: 9pt)[$U_2$]])
  content((7.35, 0.8925), [#text(size: 9pt)[$U_d$]])
  content((-0.98, 0), [#text(size: 9pt)[first copy]], anchor: "east", padding: 0.1176cm)
  content((-0.98, -1.02), [#text(size: 9pt)[second copy]], anchor: "east", padding: 0.1176cm)
  content((0, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_0$ \(tag\)]]])])
  content((2.45, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_1$]]])])
  content((4.9, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_2$]]])])
  content((7.35, 0), [#text(size: 9pt)[extra point]])
  content((0, -1.02), [#text(size: 9pt)[extra point]])
  content((2.45, -1.02), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_0$]]])])
  content((4.9, -1.02), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_1$]]])])
  content((7.35, -1.02), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_(d-1)$ \(tag\)]]])])
  line((0.6803, -0.2832), (2.19, -0.9119), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((2.71, -0.1081), (4.64, -0.9119), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((6.076, -0.442), [#text(size: 9pt)[$dots.h$]])
})],
  caption: [Figure 1: The two midpoint assignments. Each departure label moves one cell along the path in the second copy; the drawing suppresses the intermediate cells before $U_d$. Removing the highlighted tags leaves the same bath midpoints. Each vertical column is one proposal factor, with a common midpoint and one path in each copy when both are required. ],
) <cmp:shift-figure>

=== 8.4 Cancellation of conditional normalizers <cancellation-of-conditional-normalizers>

The midpoint construction has two path copies in each internal vertex factor.
  To estimate its likelihood, designate one copy as primary and regard the other as auxiliary.
  At an internal vertex $z_k$, $1 lt.eq k < d$, the primary path has label $i_k$ in the first-copy view,
  whereas the auxiliary path has label $i_(k - 1)$. Thus deleting a factor is not the same operation as deleting
  all instances of one particle label. The following lemma keeps this distinction explicit and isolates the
  normalizers that cancel when two routes are far apart. Its coordinates and factors are abstract;
  we identify them with the midpoint construction immediately after the proof.

The next lemma concerns finitely many coordinates in standard Borel spaces,
  each with a probability reference $P_i$. All auxiliary spaces below are standard Borel as well.
  A #emph[check] will mean an indicator imposing a constraint on one or two coordinates.
  The joint reference law $lambda$ is the product $⨂_i P_i$ conditioned on a finite collection of checks.
  An additional independent coordinate is allowed; it simply has no checks.

A change indexed by a set $S$ leaves the marginal outside $S$ unchanged.
  Inside $S$, it starts from independent factors $Pi_(S \, i)$, $i in S$.
  Each factor includes a #emph[primary coordinate] in the space of $P_i$ and possibly auxiliary coordinates.
  Its primary marginal is $g_(S \, i) P_i$, with

#[#set math.equation(numbering: n => "(8.7)")
 $ 0 lt.eq g_(S \, i) lt.eq G \, wide integral g_(S \, i) thin upright(d) P_i = 1 . $ <cmp:factor-density>]

The factors are fixed before the outside coordinates are sampled.
  The product is conditioned on specified checks, including every reference check involving the primary
  coordinates in $S$. Checks involving only fixed outside coordinates are already satisfied almost surely under
  the unchanged outside marginal; otherwise the conditional proposal would not be defined there.
  Omit these redundant checks. Every remaining proposal check therefore involves a coordinate carried by a changed
  factor. Auxiliary coordinates are then forgotten. The resulting primary likelihood relative to $lambda$ is
  denoted by $L_S$.

For each primary and auxiliary coordinate, fix a measurable allowed set on which all its relevant reference and
  proposal marginals are concentrated. These sets, like the proposal factors,
  are fixed before sampling outside coordinates. A configuration is #emph[individually permitted] when each
  coordinate lies in its allowed set; this imposes no pairwise checks.
  The compatibility hypothesis below is uniform on these sets, including configurations that fail some pairwise checks.

We make explicit the deletion convention for this construction.
  When some factors are removed, remove their coordinates and all checks incident to them.
  Do not replace a removed auxiliary coordinate by an original reference coordinate.
  Coordinates fixed outside the sets under discussion remain as obstacles in all the checks in which they occur.
  Coordinates here are path instances in a specified copy. If an auxiliary with label $j$ belongs to a retained
  factor, it remains integrated in that factor even when a different factor carrying the primary label $j$ is
  deleted. It is never replaced by the original path with label $j$.

#thm([Lemma 8.3.])[
  (Cancellation away from an overlap).  #emph[Consider two changes $S \, T$ of the preceding kind, with $G gt.eq
    1$, and put $U = S union T$. Suppose that the following conditions hold.]
  + #emph[There is $chi in \[ 0 \, 1 \)$ such that inserting any coordinate of $U$ from its reference $P_i$,
    or any factor of either proposal from its $Pi_(S \, i)$ or $Pi_(T \, i)$,
    satisfies all checks incident to that insertion with probability at least $1 - chi$.
    This bound is uniform in every fixed choice of the other individually permitted coordinates.
    It remains valid when any checks or coordinates have been deleted.]
  + #emph[There are decompositions $S = C_S union.sq F_S$ and $T = C_T union.sq F_T$, with $F_S ∩ T = F_T ∩ S =
    diameter$. No coordinate carried by an $F_S$ factor has a check with any coordinate carried by a $T$ factor,
    or with the original primary coordinates indexed by $T$; the corresponding assertion holds with $S \,
    T$ interchanged. The reference coordinates in $F_S \, F_T$ also have no mutual checks.]
  #emph[Then
#[#set math.equation(numbering: n => "(8.8)")
 $ integral L_S L_T thin upright(d) lambda lt.eq G^(\| S ∩ T \|) \( 1 - chi \)^(- 2 \( \| C_S \| + \| C_T \| \)) .
   $ <cmp:cancellation-bound>]

 It is enough that the assumptions hold for almost every fixed admissible configuration outside $U$.]
] <cmp:cancellation>

#proof[
  Put $a_chi = 1 - chi$ and $c = \| C_S \| + \| C_T \|$. Fix the primary coordinates outside $U$.
    All normalizers below are conditional on these fixed values;
    we first work on a configuration for which this conditional law is defined.
  For any selected set, its reference normalizer is the integral of its reference-check indicator against its
    product references. In particular, write $Z_U$ for this integral over $U$.
    When the coordinates outside $S$ are fixed, write $Z_S$ for the corresponding integral over $S$.
    Thus $Z_S$ can depend on coordinates in $T \\ S$. Write $Y_S$ for the integral of the proposal-check indicator
    $J_S$ against $⨂_(i in S) Pi_(S \, i)$, with the same outside values fixed.
  Disintegrate each factor in the form
  $ Pi_(S \, i) \( thin upright(d) x_i thin thin upright(d) zeta_i \) =
    P_i \( thin upright(d) x_i \) K_(S \, i) \( x_i \, thin upright(d) zeta_i \) \, wide
    K_(S \, i) \( x_i \, upright("all") \) = g_(S \, i) \( x_i \) . $
  Here $zeta_i$ denotes all its auxiliary coordinates. Define
  $ H_S \( x_S \; x_(S^c) \) = integral J_S product_(i in S) K_(S \, i) \( x_i \, thin upright(d) zeta_i \) . $
  On the reference-admissible configurations, the exact likelihood is
  #[#set math.equation(numbering: n => "(8.9)")
   $ L_S = Z_S / Y_S H_S . $ <cmp:exact-likelihood>]
  Indeed, the conditional reference density is its check indicator divided by $Z_S$,
    whereas the new primary density is $H_S \/ Y_S$, both relative to $⨂_(i in S) P_i$.
    The outside marginal is identical. The inclusion of primary reference checks ensures that the new density is
    zero on reference-forbidden configurations.
  Now retain only the factors indexed by $F_S$, together with coordinates fixed outside $U$,
    using the stated deletion convention. Denote their reference normalizer,
    proposal normalizer and primary proposal density by $Z_(F_S) \, Y_(F_S) \, H_(F_S)$.
    Define the three corresponding $F_T$ quantities using the factors from the $T$ change.
    These quantities depend only on the outside of $U$ and, for $H_(F_S) \, H_(F_T)$,
    on their own primary coordinates. They do not depend on the omitted near coordinates.
  Successive insertion using assumption (i), and noninteraction in assumption (ii), give
  #[#set math.equation(numbering: n => "(8.10)")
   $ Z_U & gt.eq a_chi^c Z_(F_S) Z_(F_T) \,\
Z_S & lt.eq Z_(F_S) \, wide Y_S gt.eq a_chi^(\| C_S \|) Y_(F_S) \,\
Z_T & lt.eq Z_(F_T) \, wide Y_T gt.eq a_chi^(\| C_T \|) Y_(F_T) . $ <cmp:union-normalizer>]
  For the first inequality, the reference integral over the two far sets factorizes;
    add every remaining distinct coordinate with its uniform compatibility bound.
    There are at most $c$ such coordinates. For the upper bound on $Z_S$,
    delete the checks involving $C_S$ and integrate those reference coordinates freely.
    Coordinates in $T \\ S$ have no checks with the far set. For its proposal lower bound,
    start with the reduced $F_S$ integral and add the $C_S$ factors.
    The fixed original coordinates in $T \\ S$ still do not meet the far factors.
    Each addition retains at least the factor $a_chi$. Applying these two arguments to the $T$ change proves the
    last line. These statements are pointwise in the opposing coordinates;
    they do not assert that $Z_S$ or $Y_S$ is constant in them.
  The insertion bounds also prove positivity of the divisors.
    In particular, integrating coordinates one at a time gives a positive product lower bound for every reduced
    normalizer. The full reference conditional is defined on the outside configurations under consideration.
  Deleting proposal checks involving a near factor gives
  $ H_S lt.eq H_(F_S) product_(i in C_S) g_(S \, i) \, wide H_T lt.eq H_(F_T) product_(i in C_T) g_(T \, i) . $
  After dropping the reference admissibility indicator in an upper bound,
    the two far primary integrals equal $Y_(F_S)$ and $Y_(F_T)$.
    The remaining coordinates carry only the displayed marginal densities.
    A coordinate occurring once integrates to one. A coordinate occurring in both lists costs at most $G$,
    by (8.7). Therefore
  #[#set math.equation(numbering: n => "(8.11)")
   $ integral H_S H_T upright(bold(1))_(upright("admissible")) product_(i in U) P_i \( thin upright(d) x_i \)
     lt.eq Y_(F_S) Y_(F_T) G^(\| S ∩ T \|) . $ <cmp:kernel-product>]
  The conditional reference law on $U$ has normalizer $Z_U$. Combine (8.9)–(8.11).
    The two pointwise ratio bounds contribute $a_chi^(- c) Z_(F_S) Z_(F_T) \/ \( Y_(F_S) Y_(F_T) \)$;
    division by $Z_U$ contributes at most $a_chi^(- c) \/ \( Z_(F_S) Z_(F_T) \)$.
    All four far normalizers cancel, leaving $G^(\| S ∩ T \|) a_chi^(- 2 c)$.
    Finally integrate the outside coordinates. This proves (8.8). ◻
]

=== 8.5 The likelihood cost is confined to encounters <the-likelihood-cost-is-confined-to-encounters>

Fix the data, the route and the selected labels. Regard either copy as the primary one.
  The reference for that copy is $lambda_(cal(I)) ⊗ P_(*)$,
  where $P_(*)$ is the uniform law of the extra point in its endpoint cell. Let

$ S = { i_0 \, dots.h \, i_(d - 1) } union { * } . $

The objects in Lemma 34 now have the following meaning:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[Primary coordinate
], table.cell(rowspan: 1, colspan: 1)[The chosen copy’s path, or its endpoint extra point.
],
  table.cell(rowspan: 1, colspan: 1)[Auxiliary coordinate
], table.cell(rowspan: 1, colspan: 1)[The other copy’s path or extra point through the same midpoint.
],
  table.cell(rowspan: 1, colspan: 1)[Checks
], table.cell(rowspan: 1, colspan: 1)[Collision exclusions within each copy.
],
)
]

Index a vertex factor by its primary label, using $*$ for the extra point; its center is its midpoint cell $z_k$.
  The two paths in one factor may have different labels, and each copy contributes at most one path.
  The allowed set for each path consists of the regular, confined,
  frozen-avoiding paths with its own recorded endpoints. Each extra point lies in its target cell.
  These are individual restrictions; the remaining collision checks still couple different factors.

By Proposition 28, the primary marginal of each path factor has density at most $G$ relative to $P_i$,
  and integrates to one. For the extra point the density is $upright(bold(1))_(A_k) \/ \|
  A_k \|$ relative to $P_(*)$, which is at most $1 \/ 0.98$.
  Enlarge the fixed $G$ to be at least two, covering this factor as well.
  These marginal densities and their auxiliary kernels depend on the exposed data and the route and label choices;
  they do not depend on the unselected unexposed paths.

The union bound proving Equation (8.5) verifies hypothesis (i) for each proposal factor.
  The same argument with $P_i$ in place of $Pi_i^(A_k)$ verifies it for insertion of a selected reference path,
  by Proposition 28. The reference extra point has no checks.
  These estimates are uniform over all individually permitted opponent paths,
  whether or not their labels are accessible, and deleting checks can only improve them.
  Thus the bound remains available for every reduced normalizer in Lemma 34.

Take two independent route and label choices at the same data and endpoint pair,
  and denote their selected index sets by $S \, T$. For the chosen primary side,
  declare a factor of $S$ near if its center is at lattice supremum distance at most $R$ from some center of $T$,
  and declare every other factor far. Define $C_S \, F_S \, C_T \, F_T$ accordingly.
  A shared real label has centers at distance at most two in the two assignments, so it is near;
  the shared extra index has the same endpoint center. Consequently the far index sets are disjoint from the
  opposing lists.

All paths carried by a factor lie within distance eleven of its center.
  The original path of an opposing real label also lies within distance eleven of that opposing factor’s center.
  Since $R = 30$, far factors cannot interact with any coordinate carried by the opposite list or with those
  original paths. This includes the auxiliary-copy paths. Far sets therefore meet the separation assumptions of
  Lemma 34.

For clarity, a reduced far proposal retains exactly the paths carried by its far vertex factors and the fixed
  paths outside $S union T$. It deletes the omitted near factors in both copies.
  It does not put their original trajectories back as unselected obstacles.
  With this convention all the normalizers in (8.10)–(8.11) are the ones arising from the present construction.

Write $L_S \, L_T$ for the two primary likelihoods. If

$ J_R = \# { \( j \, k \) : d_oo \( z_j \, z'_k \) lt.eq R } \, $

then $\| C_S \| + \| C_T \| lt.eq 2 J_R$. Lemma 34 gives, at the fixed data,

#[#set math.equation(numbering: n => "(8.12)")
 $ integral L_S L_T thin upright(d) \( lambda_(cal(I)) ⊗ P_(*) \) lt.eq
   G^(\| S ∩ T \|) \( 1 - chi_D \)^(- 4 J_R) . $ <cmp:two-choice-bound>]

In particular, no factor is paid for a long portion of one route that stays away from the other.

=== 8.6 Averaging labels and forgetting the paths <averaging-labels-and-forgetting-the-paths>

Condition on the data and the two lattice paths before choosing their labels.
  Each common departure cell has at least $M \/ 2$ accessible labels.
  The two uniform choices at that cell match with probability at most $2 \/ M$,
  and the match events are independent between distinct common cells.
  Real labels anchored at different cells cannot agree. The shared extra point contributes one factor $G$, so

#[#set math.equation(numbering: n => "(8.13)")
 $ bb(E)_(upright("labels")) G^(\| S ∩ T \|) lt.eq G exp (frac(2 \( G - 1 \), M) J_R) . $ <cmp:label-average>]

Choose the fixed integer $M$ sufficiently large for the good-site supply and for

#[#set math.equation(numbering: n => "(8.14)")
 $ frac(2 \( G - 1 \), M) lt.eq kappa / 2 . $ <cmp:M-choice>]

Then increase $D_0$ so that, for every $D gt.eq D_0$ in the allowed $alpha$ window, all earlier estimates hold and

#[#set math.equation(numbering: n => "(8.15)")
 $ - 4 log \( 1 - chi_D \) lt.eq kappa / 2 \, wide G_D / D gt.eq frac(ell, 8 M) . $ <cmp:D-choice>]

The first requirement is possible by (8.5); the second follows once $ell D \/ \( 4 M \) gt.eq 2$.
  These choices do not change $G$, $kappa$, or $C_(upright("path"))$.

The following use of an averaged likelihood and a two-route second moment also occurs in the point-reassignment
  argument of Peres and Sly #cite(label("PeresSly2014")) Proposition 2.1.
  Here Lemma 34 supplies the additional conditional-normalizer estimate required by the hard-core path law.

Let $overline(L)$ be the likelihood averaged over the conditional route and label choices,
  with value zero off $cal(E)_(v w)$. Tonelli’s theorem expresses its square integral using two independent such
  choices. Combining (8.12)–(8.15) and the annealed encounter bound in Proposition 29 gives

#[#set math.equation(numbering: n => "(8.16)")
 $ bb(E)_(cal(B)) integral overline(L)^2 thin upright(d) \( lambda_(cal(I)) ⊗ P_(*) \) lt.eq
   G bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(E)_(v w)) e^(kappa J_R) #scale(x: 120%, y: 120%)[\]]
   lt.eq C_2 \, wide C_2 := G C_(upright("path")) . $ <cmp:latent-second-moment>]

Here the two route randomizations share the same data; the expectation over the data is taken only once.
  The event is not conditioned to have probability one. Its indicator is part of both likelihoods,
  and its square is itself. The calculation applies separately with either copy primary, with the same constant $C_2$.

We next check carefully that tagging and observing the bath do not increase this bound.
  At fixed data, split $overline(L) = sum_(i in cal(I)) f_i$,
  where $f_i$ contains exactly the choices designating $i$ as the primary tag. The functions are nonnegative.
  In the first copy $f_i$ is supported where $omega_i \( t \) in B_v$;
  in the second it is supported where $omega_i \( t \) in B_w$. Since

$ sum_i f_i^2 lt.eq (sum_i f_i)^2 \, $

the measure that retains the tag index has squared likelihood integral at most $C_2$ relative to the #emph[sum] of
  the tag-restricted reference measures on the disjoint copies indexed by $i$.
  Now apply the observation kernel that orders the bath and retains $cal(B) \, x \, y \, Y$,
  and forget the tag and all the paths. If a finite measure has density $f$ relative to a reference $P$,
  the density after applying a common kernel is the conditional average of $f$ in the corresponding joint
  reference measure. Conditional Cauchy–Schwarz bounds its squared integral by $integral f^2 thin upright(d) P$.
  This remains valid for finite reference measures, by normalization when their mass is nonzero.

For either primary copy, the resulting measure is the common observed $hat(nu)$ already constructed.
  Its corresponding reference is precisely $hat(P)_g$ or $hat(Q)_g$. We have proved

#[#set math.equation(numbering: n => "(8.17)")
 $ integral (frac(thin upright(d) hat(nu), thin upright(d) hat(P)_g))^2 thin upright(d) hat(P)_g lt.eq C_2 \, wide
   integral (frac(thin upright(d) hat(nu), thin upright(d) hat(Q)_g))^2 thin upright(d) hat(Q)_g lt.eq
   C_2 . $ <cmp:observed-second-moments>]

Together with (8.6), Lemma 32 now gives

#[#set math.equation(numbering: n => "(8.18)")
 $ sans(H) \( hat(P)_g \, hat(Q)_g \) gt.eq frac(1, 4 C_2) . $ <cmp:one-group-gain>]

This lower bound is uniform in the group index and in every admissible ordered pair of cells.

#thm([Proposition 8.4.])[
  (Uniform modulus occupation).  #emph[After the fixed choices above, there are constants $D_0 < oo$ and
#[#set math.equation(numbering: n => "(8.19)")
 $ c_(*) := frac(upsilon_0 ell, 32 M G C_(upright("path"))) > 0 \, wide upsilon_0 = 1 / 2000 $ <cmp:c-star>]

 such that, whenever $D gt.eq D_0$, $alpha = D r in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$,
   and $K$ is sufficiently large, every normalized nonnegative bosonic ground function satisfies $B \( Phi \)
   gt.eq c_(*)$. The constant $c_(*)$ is unchanged if the lower threshold on $D$ is subsequently increased.
   The volume thresholds can be taken locally uniform for $D$ in compact subintervals of $\[ D_0 \, oo \)$.]
] <cmp:modulus>

#proof[
  For large $K$, at least $upsilon_0 V^2$ ordered cell pairs meet the displacement condition of Proposition 29.
    For each such pair, Lemma 33, (8.15) and (8.18) give
  $ sans(H) \( P_(v w) \, Q_(v w) \) gt.eq frac(G_D, 4 D C_2) gt.eq frac(ell, 32 M C_2) . $
  Sum these nonnegative contributions in (8.3) to obtain $B \( Phi \) gt.eq upsilon_0 ell \/ \( 32 M C_2 \)$,
    which is (8.19). All ingredients are uniform in the ground vector.
    The threshold and local-uniformity assertions follow from the preceding path and group estimates and
    Proposition 29. No parameter entering $c_(*)$ is chosen after $D_0$. ◻
]

The modulus occupation has now been bounded below by a fixed number.
  To treat the original complex ground vector, it remains to show that a small part of each one-coordinate slice
  contains every possible phase obstruction. That estimate may require a larger lower bound on $D$;
  Proposition 35 permits that increase without changing the gain.

== 9 A common component in each one-particle slice <geom:section>

We now construct the retained sets required by Lemma 5. With the bath fixed,
  we cover its forbidden balls by microscopic cubes and fill the bounded pockets enclosed by each bad cluster.
  The retained points will lie in one component of the open allowed slice.
  To bound the removed volume, we separate clusters whose coordinate spans are at most one from larger clusters.
  The former cost at most $C r^2 N$ in total filled volume.
  Each larger cluster forces order $1 \/ r$ distinct nearby bath particles with close partners,
  so the joint spatial estimates control its occurrence. This argument requires no connectivity of the full
  configuration space.

We retain the scaled torus $Lambda_K$, its volume $V = K^3$, and the centered unit cells $B_v$,
  where $v in \( bb(Z) \/ K bb(Z) \)^3$. Write

$ Y = \( x_2 \, dots.h \, x_N \) \, wide m \( Y \) = integral_(Lambda_K) Phi \( x \, Y \)^2 thin upright(d) x \,
  wide nu \( thin upright(d) Y \) = m \( Y \) thin upright(d) Y . $

Thus $nu$ is the bath marginal of $mu \( thin upright(d) X \) = Phi \( X \)^2 thin upright(d) X$.
  Call a bath admissible if $d \( x_i \, x_j \) > r$ for $2 lt.eq i < j lt.eq N$.
  Other baths have $m \( Y \) = 0$. For an admissible bath, its open one-coordinate slice is

#[#set math.equation(numbering: n => "(9.1)")
 $ S_Y = Lambda_K \\ union.big_(j = 2)^N overline(B) \( x_j \, r \) . $ <geom:allowed-slice>]

We first work deterministically with admissible baths. The probability estimate at the end uses the joint
  close-neighbor bound from Equation (3.18).

=== 9.1 Microcubes and filled components <microcubes-and-filled-components>

Put

$ q_r = ceil.l 1 \/ r ceil.r \, wide h = q_r^(- 1) \, wide J = K q_r . $

For $r lt.eq 1$, we have $r \/ 2 lt.eq h lt.eq r$. Subdivide every unit cell into $q_r^3$ microcubes.
  In the periodic lift, their closed cubes are

$ Q_z = h #scale(x: 120%, y: 120%)[\(] z + \[ 0 \, 1 \]^3
  #scale(x: 120%, y: 120%)[\)] - \( 1 \/ 2 \, 1 \/ 2 \, 1 \/ 2 \) \, wide z in bb(Z)^3 . $

Their index period is $J$ in every coordinate. A microcube is #emph[bad] if its closure intersects a closed ball
  in (9.1); otherwise it is #emph[good]. Marking is periodic.
  Distinct index sites are $*$-adjacent when their maximum coordinate distance is one.
  For a finite bad $*$-component $C$, let $H_oo \( C \)$ be the unique infinite nearest-neighbor component of
  $bb(Z)^3 \\ C$, and put

$ "Fill" \( C \) = bb(Z)^3 \\ H_oo \( C \) . $

Thus the fill adds all finite nearest-neighbor holes to $C$.
  Define $cal(A) \( Y \) subset Lambda_K$ as the projection of all closed cubes with indices in the fills of the
  bad components. If the lifted bad set has an infinite component, define $cal(A) \( Y \) = Lambda_K$.
  Use this convention also for inadmissible baths. The retained region is

$ G \( Y \) = Lambda_K \\ cal(A) \( Y \) . $

The fills remove bounded pockets behind the obstacles. This is the same discrete filling operation used in
  Lemma 30; here its scale is comparable to the exclusion distance.
  Phase transfer requires the points of $G \( Y \)$ to lie in one component of $S_Y$;
  a connecting path may use any good microcubes. Figure 2 distinguishes bad cubes, their fill, and such a route.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((1.53, 1.02), (2.04, 1.53), fill: rgb("#adadad"), stroke: none)
  rect((2.04, 1.02), (2.55, 1.53), fill: rgb("#adadad"), stroke: none)
  rect((2.55, 1.02), (3.06, 1.53), fill: rgb("#adadad"), stroke: none)
  rect((3.06, 1.02), (3.57, 1.53), fill: rgb("#adadad"), stroke: none)
  rect((1.53, 1.53), (2.04, 2.04), fill: rgb("#adadad"), stroke: none)
  rect((3.06, 1.53), (3.57, 2.04), fill: rgb("#adadad"), stroke: none)
  rect((1.53, 2.04), (2.04, 2.55), fill: rgb("#adadad"), stroke: none)
  rect((3.06, 2.04), (3.57, 2.55), fill: rgb("#adadad"), stroke: none)
  rect((1.53, 2.55), (2.04, 3.06), fill: rgb("#adadad"), stroke: none)
  rect((2.04, 2.55), (2.55, 3.06), fill: rgb("#adadad"), stroke: none)
  rect((2.55, 2.55), (3.06, 3.06), fill: rgb("#adadad"), stroke: none)
  rect((3.06, 2.55), (3.57, 3.06), fill: rgb("#adadad"), stroke: none)
  rect((2.04, 1.53), (3.06, 2.55), fill: rgb("#ffdbb8"), stroke: none)
  line((0, 0), (0, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0.51, 0), (0.51, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((1.02, 0), (1.02, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((1.53, 0), (1.53, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((2.04, 0), (2.04, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((2.55, 0), (2.55, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((3.06, 0), (3.06, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((3.57, 0), (3.57, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((4.08, 0), (4.08, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((4.59, 0), (4.59, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((5.1, 0), (5.1, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (5.1, 0), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.51), (5.1, 0.51), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.02), (5.1, 1.02), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.53), (5.1, 1.53), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.04), (5.1, 2.04), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.55), (5.1, 2.55), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 3.06), (5.1, 3.06), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 3.57), (5.1, 3.57), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0, 4.08), (5.1, 4.08), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  line((0.765, 1.785), (1.275, 1.785), (1.275, 3.315), (3.825, 3.315), (3.825, 1.785), (4.335, 1.785), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.1764cm, fill: rgb("#0000a6"))))
  circle((0.765, 1.785), radius: 0.0612, fill: rgb("#0000a6"), stroke: none)
  circle((4.335, 1.785), radius: 0.0612, fill: rgb("#0000a6"), stroke: none)
  line((0.765, 1.785), (4.335, 1.785), fill: rgb("#0000a6"), stroke: none)
  content((0.765, 1.785), [$x$], anchor: "north-east", padding: 0.1176cm)
  content((4.335, 1.785), [$y$], anchor: "north-west", padding: 0.1176cm)
  content((5.61, 3.06), [bad microcubes], anchor: "west", padding: 0.1176cm)
  rect((5.228, 2.907), (5.482, 3.162), fill: rgb("#adadad"), stroke: none)
  content((5.61, 2.295), [filled pocket], anchor: "west", padding: 0.1176cm)
  rect((5.228, 2.142), (5.482, 2.397), fill: rgb("#ffdbb8"), stroke: none)
  content((5.61, 1.53), [route in good cubes], anchor: "west", padding: 0.1176cm)
  line((5.202, 1.53), (5.508, 1.53), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
})],
  caption: [Figure 2: A planar schematic of the filling operation. The argument uses three-dimensional microcubes. Each closed good cube avoids every closed forbidden ball, so a finite route through good cubes has positive clearance. The picture concerns a single-coordinate slice with the bath fixed. ],
) <geom:figure>

#thm([Lemma 9.1.])[
  (Connectivity with strict clearance).  #emph[For every bath $Y$,
    any two points of $G \( Y \)$ can be joined by a continuous path in $S_Y$ whose distance from the forbidden
    set is strictly positive.]
] <geom:connectivity>

#proof[
  There is nothing to prove when $G \( Y \)$ is empty. Otherwise the bath is admissible and all lifted bad
    components are finite. Choose lifted microcube sites containing the two points.
    Each lies outside the fill of every lifted bad component,
    and hence in its infinite nearest-neighbor complement component.
  Start with any finite nearest-neighbor path between these sites.
    If it visits a bad component $C$, let $u$ precede the first visit and let $w$ follow the last visit.
    The path prefix before $u$ avoids $C$ and connects $u$ to an endpoint outside its fill.
    The reversed suffix does the same for $w$. Thus both vertices belong to the exterior $*$-boundary of $C$
    visible from infinity by nearest-neighbor paths. Lemma 30 joins them by a nearest-neighbor path in this
    boundary. All its vertices are good: a bad $*$-neighbor of $C$ would already be in $C$.
  This replacement removes bad vertices and introduces none.
    Repetition therefore terminates, since the original path had finitely many bad vertices.
    First and last visits are taken for one fixed lifted component;
    different periodic copies are treated separately. Projecting the resulting good-cube path gives a route on the
    torus.
  Join successive cube centers through their common faces, and join the original points to their cube centers.
    A point on a grid face can be assigned any adjacent cube:
    membership outside $cal(A) \( Y \)$ ensures that each such cube is good and outside every fill.
    Every closed good cube is disjoint from every closed forbidden ball.
    The finite union of cubes used by the route is compact, so its distance from the union of the closed forbidden
    balls is positive. All the line segments stay in these cubes.
    This proves both open-slice connectivity and strict clearance. ◻
]

=== 9.2 Small fills and distinct close-particle witnesses <small-fills-and-distinct-close-particle-witnesses>

Call a finite microcomponent $C$ #emph[small] if $h "diam"_oo C lt.eq 1$.
  All other components, including infinite ones, are called #emph[large].
  For a small fill, each occupied column has cross-sectional area $h^2$ and length at most order one;
  charging each occupied column to a bad cube gives the deterministic volume bound below.
  Large components will instead force the close-neighbor events already estimated under $mu$.

#thm([Lemma 9.2.])[
  (Volume of small fills).  #emph[For $K > 10$ and $r lt.eq 1$,
    the projected union of small fills has volume at most $C r^2 N$, with an absolute constant $C$.]
] <geom:small-fills>

#proof[
  The fill of a finite component lies in its coordinate bounding box by Lemma 30.
    Moreover, every column parallel to the first coordinate axis that meets the fill also meets the component.
    Otherwise that entire column would avoid the component and connect each of its vertices to infinity,
    precluding a finite hole there.
  For a small component $C$, there are at most $\| C \|$ such columns.
    Each contributes length at most $1 + 2 h$ in physical units and cross-sectional area $h^2$.
    Hence its filled cubes have volume at most
  #[#set math.equation(numbering: n => "(9.2)")
   $ \( 1 + 2 h \) h^2 \| C \| lt.eq 3 h^2 \| C \| . $ <geom:column-volume>]
  A closed radius-$r$ ball meets at most $C_0 = 343$ microcubes, since $r \/ h lt.eq
    2$ and in each coordinate at most seven closed grid intervals can meet its projection.
  Choose one representative of each small component modulo the torus period.
    Its projection is injective because each physical coordinate span is at most one and $K > 10$.
    The projected components are disjoint, and their total number of bad microcubes is at most $C_0 \( N - 1 \)$.
    Summing Equation (9.2), and allowing overlaps of their fills in this upper bound,
    gives $3 C_0 h^2 \( N - 1 \) lt.eq C r^2 N$. ◻
]

#thm([Lemma 9.3.])[
  (Distinct witnesses in a large component).  #emph[There are absolute constants $r_1 \,
    c_(upright(g)) > 0$ such that the following holds for $r lt.eq r_1$ and $K > 10$.
    If a unit cell $B_v$ contains a microcube from a large bad component,
    then at least $c_(upright(g)) \/ r$ distinct bath particles lie within distance $5$ of $v$,
    and each has a distinct bath particle within distance $6 r$.
    One may take $c_(upright(g)) = 1 \/ \( 8 C_0 \)$ with $C_0 = 343$.]
] <geom:large-witnesses>

#proof[
  Fix a lifted microcube index $z$ in that component and in a lift of $B_v$.
    There is a component vertex at scaled maximum distance greater than $1 \/ 2$ from $z$.
    For a finite component this follows from its diameter being greater than one;
    for an infinite component it follows from local finiteness.
    Follow a simple $*$-path from $z$, stopping when its scaled maximum distance first reaches $1 \/ 4$.
    It contains at least $1 \/ \( 4 h \)$ distinct vertices and remains within scaled distance $1 \/ 4 + h$ of $z$.
  Choose one bath ball witnessing badness at each path vertex.
    A fixed ball witnesses at most $C_0$ of these vertices. All the chosen centers are in a fixed small
    neighborhood of $v$, contained in its radius-$5$ ball for sufficiently small $r$.
    This neighborhood and the cubes under consideration have diameter less than $K$,
    so no two periodic copies of the same label occur. The witness sequence therefore contains at least
    $1 \/ \( 4 C_0 h \) gt.eq 1 \/ \( 4 C_0 r \)$ distinct labels.
    Shrink $r_1$ so this number is at least two, and retain the stated smaller constant $c_(upright(g))$.
  Repeated labels do not destroy the close-partner conclusion.
    Form a graph whose vertices are the distinct witness labels,
    joining different labels whenever they occur consecutively in the sequence.
    This graph is connected and has at least two vertices, so none is isolated.
    Two adjacent closed microcubes meet. The centers of balls intersecting those cubes are therefore at distance at most
  $ 2 r + 2 sqrt(3) thin h lt.eq 6 r . $
  Every distinct label thus has a different close partner, including labels that recur in separated portions of
    the witness sequence. ◻
]

We now fix the geometric restriction on the close-count threshold:

#[#set math.equation(numbering: n => "(9.3)")
 $ 0 < theta < frac(c_(upright(g)), 2 alpha_0) . $ <geom:theta-choice>]

This restriction is imposed before the choice of $b$ in the spatial estimates.
  Since $r = alpha \/ D$ and $alpha lt.eq 2 alpha_0$, increasing the lower threshold on $D$ ensures

#[#set math.equation(numbering: n => "(9.4)")
 $ 6 r < s_0 = b D^(- 1 \/ 3) \, wide r lt.eq r_1 . $ <geom:scale-separation>]

For a full configuration $X = \( x \, Y \)$, recall the close-count set from Equation (3.17):

#[#set math.equation(numbering: n => "(9.5)")
 $ cal(Q) \( X \) = {v : \# {i : d \( x_i \, v \) lt.eq 5 \, min_(j eq.not i) d \( x_i \, x_j \) lt.eq s_0} gt.eq
   theta D} . $ <geom:coarse-bad-set>]

By Equation (3.18), for every deterministic set $S$ of distinct coarse sites,

#[#set math.equation(numbering: n => "(9.6)")
 $ mu { S subset cal(Q) \( X \) } lt.eq p_D^(\| S \|) \, wide p_D arrow.r 0 . $ <geom:coarse-joint-bound>]

Lemma 38 and Equations (9.3)–(9.4) show that every parent cell of a large microcomponent belongs to
  $cal(Q) \( X \)$. Indeed $c_(upright(g)) \/ r > theta D$,
  and adding the distinguished point $x$ to the bath can only decrease the relevant nearest-neighbor distances.
  This implication holds for every $x$; it does not identify $nu$ with an $\( N - 1 \)$-particle ground-state law.

=== 9.3 Periodic animals and the omitted volume <periodic-animals-and-the-omitted-volume>

#thm([Proposition 9.4.])[
  (Small omitted volume).  #emph[Fix the constants as above and take $D$ sufficiently large.
    There are absolute constants $C \, C_(upright("an"))$ such that, for $K gt.eq
    100$ and $C_(upright("an")) p_D lt.eq 1 \/ 2$,
#[#set math.equation(numbering: n => "(9.7)")
 $ delta_(upright("geom")) := integral frac(\| cal(A) \( Y \) \|, V) thin nu \( thin upright(d) Y \) lt.eq
   C r^2 D + C p_D + K^3 \( C_(upright("an")) p_D \)^(floor.l K \/ 10 floor.r) . $ <geom:volume-bound>]

 The retained points belong to one component of the open slice $S_Y$ whenever the retained set is nonempty.
   The estimate is uniform over the normalized ground vector and $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$.]
] <geom:omitted-volume>

#proof[
  We estimate the bath-dependent volume by integrating under the full configuration law:
  #[#set math.equation(numbering: n => "(9.8)")
   $ delta_(upright("geom")) = integral_(Lambda_K^N) frac(\| cal(A) \( Y \) \|, V) thin
     mu \( thin upright(d) x thin thin upright(d) Y \) . $ <geom:bath-volume-identity>]
  This is the marginal identity $integral Phi \( x \, Y \)^2 thin upright(d) x = m \( Y \)$.
    The coarse bad events used next may therefore depend on $x$ as well as on the bath.
  Set $m_K = floor.l K \/ 10 floor.r$ and let $cal(E)_K$ be the event that the coarse bad set in (9.5) has a
    $*$-component of size at least $m_K$. In a graph of degree $26$,
    the number of connected vertex sets of size $m$ containing a prescribed root is at most $C_(upright("an"))^m$.
    To see this, choose for each set a deterministic spanning tree and its depth-first traversal:
    the resulting walk has $2 \( m - 1 \)$ steps, and its visited set recovers the original set.
    There are at most $26^(2 \( m - 1 \))$ such walks. A connected set of size at least $m_K$ contains a connected
    subset of size exactly $m_K$, by taking the first $m_K$ vertices in a tree exploration.
    Equation (9.6) and a union bound over roots give
  #[#set math.equation(numbering: n => "(9.9)")
   $ mu \( cal(E)_K \) lt.eq K^3 \( C_(upright("an")) p_D \)^(m_K) . $ <geom:large-animal-error>]
  On $cal(E)_K^c$, every coarse bad component has fewer than $K \/ 10$ vertices.
    We make its periodic lifting explicit. Lift a spanning tree of a component with $m$ vertices.
    Each additional edge and its tree path form a loop of length at most $2 m - 1 < K$.
    Such a loop has zero winding: every step changes each coordinate by at most one,
    whereas nonzero winding requires displacement of magnitude at least $K$ in one coordinate.
    Every additional edge therefore closes in the chosen finite tree lift.
    This proves that the full lifted component is finite, projects bijectively,
    and has coordinate span at most $m - 1$. It is the nearest-range case of Lemma 31.
  The parent-cell map sends adjacent microcubes to equal or $*$-adjacent unit cells.
    Every large microcomponent is therefore contained in the unit cubes of one lifted coarse bad component.
    In particular it is finite on $cal(E)_K^c$: each of those finitely many unit cubes contains only $q_r^3$
    microcubes. Its fill lies in its own coordinate bounding box and thus in the coordinate box of those unit cubes.
  Consequently, if a prescribed unit cell is affected by a large fill,
    there is a coarse bad animal of some size $m gt.eq 1$ with a root within maximum distance $C m$ of that cell.
    There are at most $C m^3$ possible roots, even after projecting to the torus.
    The rooted-animal count and Equation (9.6) give
  #[#set math.equation(numbering: n => "(9.10)")
   $ mu { cal(E)_K^c upright(" and the cell meets a large fill") } lt.eq
     sum_(m gt.eq 1) C m^3 \( C_(upright("an")) p_D \)^m lt.eq C' p_D . $ <geom:filled-animal-sum>]
  The last inequality follows by summing the convergent power series on $C_(upright("an")) p_D lt.eq 1 \/ 2$.
    No independence of coarse sites is used.
  Sum Equation (9.10) over unit cells and divide by $V$. On $cal(E)_K$, bound the discarded fraction by one.
    Lemma 37 bounds the small-fill contribution by $C r^2 N \/ V = C r^2 D$.
    Combining these bounds with Equation (9.9) proves Equation (9.7), by Equation (9.8).
    Lemma 36 gives the connectivity assertion.
  All sets used here are measurable. Bad-cube membership is a finite family of distance tests in one period.
    A finite periodic component has a finite lift precisely when its spanning-tree lift closes along every
    additional edge. In that case its fill is determined by connectivity in a finite bounding box,
    with the exterior attached. These finite procedures determine the projected discarded cubes and their volume
    from the bath positions. ◻
]

The right side of Equation (9.7) has the needed order of limits.
  Since $r^2 D = alpha^2 \/ D$, its first two terms can be made arbitrarily small by increasing the lower
  threshold on $D$. At each such fixed density, the last term tends to zero as $K$ grows.
  Its displayed bound also gives uniform convergence for all $D$ above a threshold at which $C_(upright("an")) p_D
  lt.eq 1 \/ 2$. The estimate is therefore ready for the phase-transfer lemma and the final parameter choice.

== 10 Choice of constants and the thermodynamic limit <main:conclusion>

We now combine the uniform modulus bound with the phase estimate. The order of the choices is essential:
  the modulus fraction is fixed before we make the discarded volume small enough to preserve it.

=== 10.1 A bound in the scaled variables <a-bound-in-the-scaled-variables>

#thm([Proposition 10.1.])[
  #emph[There are absolute constants $alpha_0 \, D_(*) \, c_(*) > 0$ such that, for $D = N \/ K^3 gt.eq
    D_(*)$ and $r = alpha \/ D$ with $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$,
    every normalized complex bosonic ground vector satisfies
$ B \( Psi \) gt.eq c_(*) \/ 2 $

 for all sufficiently large integer $K$. The volume threshold can be chosen uniformly when $D$ ranges over a fixed
   compact subinterval of $\[ D_(*) \, oo \)$, and is independent of the chosen ground vector.]
] <main:scaled>

#proof[
  We first list the choices that yield Proposition 35. Fix the local cutoff profiles and the exponent $gamma =
    1 \/ 12$ in the path regularity conditions. Choose $alpha_0$ large enough for the insertion and spatial
    estimates, and then choose the small lower-count constant $ell$. Choose the close-count threshold $theta$ so that
  $ 3 theta < ell \/ 2 \, wide theta < c_(upright(g)) \/ \( 2 alpha_0 \) . $
  The first inequality leaves the required eligible labels; the second is the witness condition in Equation (9.3).
    Next fix the separation constant $b$ in $s_0 = b D^(- 1 \/ 3)$.
  At the fixed encounter radius $R = 30$, Proposition 29 supplies a bad-site tolerance $p$,
    an exponential-moment parameter $kappa > 0$, and a bound $C_(upright("path"))$.
    Fix the visitor threshold $H_1$ and the regularity threshold in the certificate estimates,
    and then the small time $t > 0$ in the bridge estimates. All these constants are fixed before $D$ is
    increased. The local comparison bound $G gt.eq 2$ of Proposition 28 is now fixed as well.
    Choose the integer group size $M$ large enough for the grouping failure estimate and for
  $ frac(2 \( G - 1 \), M) lt.eq kappa / 2 . $
  Finally choose $D_0$ large enough for all the preceding estimates, for $ell D gt.eq 8 M$, and for
  $ - 4 log \( 1 - chi_D \) lt.eq kappa / 2 \, wide chi_D = C_(upright("col")) M eta_D . $
  Here $eta_D arrow.r 0$ is the deterministic-opponent collision bound from Proposition 28.
    We may replace each vanishing error by its nonincreasing upper envelope,
    so these requirements hold for all $D gt.eq D_0$.
  Proposition 35 then gives
  #[#set math.equation(numbering: n => "(10.1)")
   $ B \( Phi \) gt.eq c_(*) := frac(upsilon_0 ell, 32 M G C_(upright("path"))) > 0 \, wide upsilon_0 = 1 /
     2000 . $ <main:cstar>]
  None of $upsilon_0 \, ell \, M \, G \, C_(upright("path"))$ changes when the lower threshold on $D$ is
    subsequently increased.
  By Proposition 39, the retained points lie in a common component of each allowed slice,
    and their discarded-volume expectation satisfies
  #[#set math.equation(numbering: n => "(10.2)")
   $ delta_(upright("geom")) lt.eq C alpha^2 / D + C p_D + C
     K^3 \( C_(upright("an")) p_D \)^(floor.l K \/ 10 floor.r) \, wide p_D arrow.r 0 . $ <main:geometry-error>]
  The constants in this estimate use only choices already fixed.
    Increase $D_0$ to $D_(*)$ so that, for every $D gt.eq D_(*)$ and every $alpha$ in its fixed window,
  $ C alpha^2 / D + C p_D lt.eq c_(*)^2 / 256 \, wide C_(upright("an")) p_D lt.eq 1 / 2 . $
  For sufficiently large $K$ the last term in Equation (10.2) is at most $c_(*)^2 \/ 256$.
    In particular $delta_(upright("geom")) lt.eq c_(*)^2 \/ 64$, and Lemma 5 gives $B \( Psi \) gt.eq c_(*) \/ 2$.
  Proposition 35 supplies volume thresholds locally uniform in $D$,
    independently of the ground vector and of $alpha$ in its fixed window.
    The geometric restrictions above hold for all $D gt.eq D_(*)$,
    and the remaining volume error is uniformly at most $C K^3 2^(- floor.l K \/ 10 floor.r)$.
    Combining these two facts proves the asserted local uniformity in $D$ for the complex ground vector. ◻
]

=== 10.2 Return to fixed exclusion distance and density <return-to-fixed-exclusion-distance-and-density>

#proof[
  Let $alpha_0 \, D_(*) \, c_(*)$ be the constants of Proposition 40, and set
  $ epsilon_0 = frac(alpha_0^3, 4 D_(*)^2) \, wide c_0 = c_(*) \/ 2 . $
  Decrease $epsilon_0$ if needed to meet the fixed dilute-regime prerequisites.
    Fix $a \, rho > 0$ with $rho a^3 < epsilon_0$, and let $N_k \, L_k \, Psi_k$ be any sequence in the theorem.
    We choose the integer side to keep the product of scaled density and exclusion distance close to $alpha_0$.
    Equation (2.2) will then turn the small physical gas parameter into a large scaled density.
    For all sufficiently large $k$ define
  $ q_k = sqrt(frac(a N_k, alpha_0 L_k)) \, wide K_k = floor.l q_k floor.r \, wide r_k = frac(a K_k, L_k) \, wide
    D_k = N_k / K_k^3 . $
  Since $q_k \/ L_k arrow.r sqrt(a rho \/ alpha_0) > 0$, we have $K_k arrow.r oo$ and $K_k \/ q_k arrow.r 1$.
    Consequently
  $ alpha_k := D_k r_k & = frac(a N_k, L_k K_k^2) = alpha_0 (q_k / K_k)^2 arrow.r alpha_0 \,\
D_k & arrow.r D_oo := alpha_0^(3 \/ 2) / sqrt(rho a^3) > 2 D_(*) . $
  Thus $alpha_k$ lies in the required window and $D_k$ lies in a compact subinterval of $\( D_(*) \, oo \)$ for
    all sufficiently large $k$. The local uniformity in Proposition 40 applies to this varying sequence of scaled
    densities.
  Use the unitary change of length from Section 2, with $s_k = L_k \/ K_k$.
    It carries $Psi_k$ to a normalized bosonic ground vector on $Lambda_(K_k)$ with exclusion distance $r_k$,
    and preserves $B$. Proposition 40 therefore gives $B \( Psi_k \) gt.eq c_0$ for all sufficiently large $k$.
    The argument is uniform over the choice of ground vector, so it proves Equation (1.2) for every such sequence. ◻
]

#proof[
  The bosonic ground eigenspace is finite dimensional by compactness of the form embedding.
    Every density operator supported on it is a convex combination of rank-one projections onto normalized ground
    vectors. For all sufficiently large members of the sequence,
    the proof of Theorem 1 gives the same lower bound $c_0$ for each of those vectors.
    Constant-orbital occupation is linear in the density operator.
    The lower bound therefore holds for their convex combination, including $Pi_k \/ "Tr" Pi_k$.
    A nonnegative ground vector is already covered by the theorem. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
