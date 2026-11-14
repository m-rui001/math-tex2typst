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

#align(center)[#text(size: 16pt, weight: "bold")[Bose--Einstein condensation at positive temperature \
in the dilute hard-sphere gas]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Bose–Einstein condensation is a statement about coherence across a macroscopic sample.
  For an interacting gas, local density estimates or accurate thermodynamic energies do not by themselves give
  that coherence. The question addressed here is whether a dilute three-dimensional gas with an impenetrable core
  has a macroscopically occupied orbital at a positive temperature that stays fixed as the volume grows.

=== 1.1 The model and the result <the-model-and-the-result>

Fix an exclusion distance $a > 0$. On the flat torus $Lambda_L = \( bb(R) \/ L bb(Z) \)^3$,
  let $d_L$ denote Euclidean torus distance and set

$ Omega_(N \, L \, a) = { \( x_1 \, dots.h \, x_N \) in Lambda_L^N :
  d_L \( x_i \, x_j \) > a upright(" whenever ") i eq.not j } . $

In units $ℏ^2 \/ \( 2 m \) = k_B = 1$, the hard-sphere Hamiltonian $H_(N \, L \, a)$ is the self-adjoint operator
  associated with

$ q \[ f \] = sum_(i = 1)^N integral_(Omega_(N \, L \, a)) \| nabla_i f \|^2 \, wide
  f in H_0^1 \( Omega_(N \, L \, a) \) upright(" symmetric") . $

For $T > 0$, its canonical state and one-particle density matrix are

$ Gamma_(N \, L \, T) = frac(e^(- H_(N \, L \, a) \/ T), "Tr" e^(- H_(N \, L \, a) \/ T)) \, wide
  gamma_(N \, L \, T)^(\( 1 \)) = N "Tr"_(2 \, dots.h \, N) Gamma_(N \, L \, T) . $

We use zero extension from the allowed configuration set when taking partial traces.
  Thus $gamma_(N \, L \, T)^(\( 1 \))$ acts on $L^2 \( Lambda_L \)$ and has trace $N$.
  The constant orbital is $u_(0 \, L) = L^(- 3 \/ 2)$. Macroscopic occupation of this orbital means that $N^(- 1)
  chevron.l u_(0 \, L) \, gamma_(N \, L \, T)^(\( 1 \)) u_(0 \, L) chevron.r$ has a positive lower limit as $L
  arrow.r oo$ with $N \/ L^3$ tending to a fixed density. Translation invariance makes the constant orbital an
  eigenvector of the density matrix, so this gives condensation in the sense of
  #cite(label("PenroseOnsager1956"), form: "prose").

#thm([Theorem 1.1.])[
  #emph[For every $a > 0$, there is $rho_(*) \( a \) > 0$ such that for each fixed $0 < rho <
    rho_(*) \( a \)$ there is a fixed temperature $T = T \( a \, rho \) > 0$ for which
$ liminf_(L arrow.r oo\
N \/ L^3 arrow.r rho) frac(chevron.l u_(0 \, L) \, gamma_(N \, L \, T)^(\( 1 \)) u_(0 \, L) chevron.r, N) > 0 . $

 The exclusion distance, density, and temperature are held fixed in this limit.]
] <thm:main>

The conclusion concerns the exact canonical Gibbs state. The temperature obtained by the proof is small and is not
  intended to locate the phase transition. Its role is to provide a strictly positive temperature at every
  sufficiently small fixed gas parameter $rho a^3$.

=== 1.2 Historical context and related methods <historical-context-and-related-methods>

The statistical origin of Bose–Einstein condensation is Bose’s counting of light quanta and Einstein’s extension
  to material particles #cite(label("Bose1924")) #cite(label("Einstein1924IdealGas"))
  #cite(label("Einstein1925IdealGas")). For interacting particles,
  Penrose and Onsager formulated condensation through a macroscopic eigenvalue of the one-particle density matrix
  #cite(label("PenroseOnsager1956")). In a translation-invariant gas,
  the constant orbital is the natural candidate. Bogoliubov’s theory expands about its macroscopic occupation to
  obtain the low-energy excitation spectrum #cite(label("Bogoliubov1947")); the hard-sphere calculation of Lee,
  Huang and Yang predicts the leading energy correction and depletion #cite(label("LeeHuangYang1957")).
  Establishing the occupation for the exact equilibrium state is a separate mathematical question from deriving
  these expansions.

For hard spheres, rigorous energy bounds began with Dyson #cite(label("Dyson1957")),
  and Lieb and Yngvason obtained the leading dilute asymptotics #cite(label("LiebYngvason1998")).
  Fournais and Solovej proved the Lee–Huang–Yang lower bound for interactions including hard cores
  #cite(label("FournaisSolovej2023")); Basti, Brooks, Cenatiempo,
  Olgiati and Schlein proved the matching upper bound for hard spheres and then for general nonnegative
  short-range interactions #cite(label("BastiEtAl2026HardSpheres"))
  #cite(label("BastiEtAl2026GeneralPotentials")). At positive temperature, Fournais, Junge, Girardot, Morin,
  Olivieri and Triay obtained a low-temperature free-energy lower bound that includes hard cores
  #cite(label("FournaisEtAl2026FreeEnergy")). These results control thermodynamic energies.
  They do not by themselves give a volume-uniform lower bound on a single orbital’s occupation:
  the one-particle kinetic gap tends to zero as the box grows.

Rigorous continuum condensation has been established in several scaling regimes.
  Lieb and Seiringer proved complete ground-state condensation in the trapped Gross–Pitaevskii limit
  #cite(label("LiebSeiringer2002")). At positive temperature, Deuchert,
  Seiringer and Yngvason treated a trapped gas in a combined thermodynamic and Gross–Pitaevskii limit
  #cite(label("DeuchertSeiringerYngvason2019")), and Deuchert and Seiringer treated the homogeneous canonical gas
  in Gross–Pitaevskii scaling #cite(label("DeuchertSeiringer2020GP")).
  The latter theorem allows hard cores, but their scattering length is proportional to $L \/
  N$ and therefore vanishes at fixed density as $N$ grows. Further results of Fournais, Chong, Liang and Nam,
  and Junge allow increasing box sizes coupled to increasing dilution #cite(label("Fournais2021"))
  #cite(label("ChongLiangNam2026")) #cite(label("Junge2026")).
  Such coupled limits do not permit unrestricted volume growth at a fixed positive gas parameter.
  Deuchert and Seiringer also established positive-temperature condensation in a combined semiclassical and
  mean-field limit for a trapped gas #cite(label("DeuchertSeiringer2021MeanField")).

Fixed-parameter thermodynamic condensation also has precedents with different interactions and state formulations.
  Aizenman, Lieb, Seiringer, Solovej and Yngvason proved low-temperature condensation for a hard-core lattice gas
  at half filling #cite(label("AizenmanLiebSeiringerSolovejYngvason2004")).
  Sütő’s continuum theorem assumes both the potential and its Fourier transform to be nonnegative,
  with integrability and regularity hypotheses that exclude a literal hard core #cite(label("Suto2023TwoStep"))
  Theorem 1.2. Galanda and Pinamonti construct algebraic equilibrium states for smooth interactions in coupled
  weak-interaction limits and, after renormalization, in Gross–Pitaevskii scaling with vanishing temperature
  #cite(label("GalandaPinamonti2025Equilibrium")) #cite(label("GalandaPinamonti2026GP")).
  The present theorem concerns the exact canonical hard-sphere state with the exclusion distance,
  positive density, and positive temperature all fixed before the volume grows.
  It gives a positive condensate fraction at sufficiently low temperature;
  it does not determine the transition temperature or the leading depletion.

Two companion articles provide the immediate starting point.
  #emph[Ground-state condensation in the dilute hard-sphere gas] #cite(label("HS")) treats the fixed-parameter
  ground-state problem and develops hard-core bridge replacements, movable groups of particles,
  routes avoiding unusable cells, and cancellation of conditional normalizers.
  #emph[A density-uniform condensate bound for dilute Bose gases] #cite(label("B")) treats bounded finite-range
  repulsive potentials at positive temperature and supplies localization and short-slab trajectory estimates,
  as well as the underlying lattice-path construction. We reproduce the arguments needed here.
  The additional issue is to obtain joint spatial and trajectory estimates for the hard-core canonical Gibbs
  state, and to make the short-path comparison control its one-particle density matrix.

The local analysis builds on established tools. The hard-core ray estimate belongs to the Dyson local-energy
  method, and the subdivision and two-particle bounds are related to the work of Lieb and Yngvason and of
  Lundholm, Portmann and Solovej #cite(label("Dyson1957")) #cite(label("LiebYngvason1998"))
  #cite(label("LundholmPortmannSolovej2015")). Particle insertion has antecedents in the nearest-neighbor trial
  states of Dyson and Lieb, Seiringer and Yngvason #cite(label("Dyson1957"))
  #cite(label("LiebSeiringerYngvason2000")). Localization into two particle species uses the Fock-space
  localization formalism of Dereziński and Gérard, its many-body development by Lewin,
  and its thermal application by Deuchert, Seiringer and Yngvason #cite(label("DerezinskiGerard1999"))
  #cite(label("Lewin2011")) #cite(label("DeuchertSeiringerYngvason2019")).
  Strong subadditivity and monotonicity of relative entropy provide the entropy comparisons
  #cite(label("LiebRuskai1973Entropy")) #cite(label("Lindblad1975")).
  The use of positive imaginary-time paths goes back to Feynman’s formulation
  #cite(label("Feynman1953AtomicLambda")); Ueltschi’s account distinguishes cycle information from one-particle
  off-diagonal order #cite(label("Ueltschi2006FeynmanCycles")).
  Here the overlap identity addresses the one-particle occupation directly.

The long-distance comparison has a separate probabilistic ancestry.
  Benjamini, Pemantle and Peres constructed paths with exponential intersection tails #cite(label("BPP1998"));
  Häggström and Mossel developed a construction using random biases on blocks at several scales
  #cite(label("HaggstromMossel1998")). The finite-endpoint averaging method of Abbe, Massoulié, Montanari,
  Sly and Srivastava, and its adaptation by Garban and Spencer,
  turn intersection control into long-range information or order
  #cite(label("AbbeMassoulieMontanariSlySrivastava2018")) #cite(label("GarbanSpencer2023")).
  Averaging path likelihoods before taking their second moments also appears in trail detection and in the
  point-reassignment argument of Peres and Sly #cite(label("AriasCastroCandesHelgasonZeitouni2008"))
  #cite(label("BergerPeres2013")) #cite(label("PeresSly2014")).
  Our lattice construction follows the explicit skeleton in #cite(label("B"), form: "prose") Section 8.1 and the
  obstacle detours in #cite(label("HS"), form: "prose") Section 7,
  using Timár’s boundary-connectivity theorem #cite(label("Timar2013")) Theorem 4.
  The hard-core comparison retains the exact interaction normalizers; after averaging two route changes,
  their cost is controlled by mutual encounters rather than by the length of either route.

=== 1.3 The argument <the-argument>

The starting point is the short-path comparison developed for the hard-sphere ground state in
  #cite(label("HS"), form: "prose"). Its use at positive temperature requires two changes.
  First, the local hypotheses must hold jointly for arbitrarily many prescribed cells under a thermal path
  measure. Second, the path comparison must control the one-particle density matrix of a mixed state.
  We prove the needed thermal estimates and retain the deterministic comparison mechanism.
  The bridge, lattice, and measure comparison arguments used below are included with proofs.

To identify the overlap we must bound, let $Phi \( X \, W' \)$ be the nonnegative integral kernel of
  $Gamma_(N \, L \, T)^(1 \/ 2)$, with $X \, W' in Lambda_L^N$.
  Write $X = \( x \, X' \)$, where $X'$ is the ordered configuration of the other $N - 1$ particles,
  called the bath. Factoring the Gibbs kernel through its square root gives

$ frac(chevron.l u_(0 \, L) \, gamma_(N \, L \, T)^(\( 1 \)) u_(0 \, L) chevron.r, N) = 1 /
  L^3 integral Phi \( x \, X' \, W' \) Phi \( y \, X' \, W' \) thin thin upright(d) x thin thin upright(d) y thin
  thin upright(d) X' thin thin upright(d) W' . $

Thus the two factors have the same bath $X'$ and retained configuration $W'$,
  while the distinguished particle moves from $x$ to $y$. Section 5 realizes $Phi \( X \, W' \)^2$ as the joint
  law of the midpoint configuration and $W'$ on a short Brownian time interval.
  Once the interval endpoints and $W'$ are fixed, the conditional law is a product of Brownian bridge laws
  conditioned on hard avoidance. This representation lets us analyze local changes against deterministic obstacle
  paths while retaining the mixed-state overlap above.

The estimates are made in the scaled units of Section 2, in which a unit cell contains $D gt.double
  1$ particles and the core radius is $alpha \/ D$, with $alpha$ in a fixed interval.
  Sections 3 and 4 give joint bounds for low cell counts and excessively close neighbors.
  These estimates use entropy as well as energy: a relative-entropy inequality controls a diagonal change of
  density, and a family of normalized insertion maps with a uniform frame bound controls the free-energy cost of
  adding a particle, even in bounded attractive fields.

The remaining local conditions concern whole trajectories.
  Section 5 marks paths that violate a condition, assigns auxiliary particle species to the marks,
  and removes their hard-core constraints in an upper bound.
  A trace estimate for a heat semigroup between two Lipschitz multipliers converts the marked path moments into
  free-energy estimates; exterior powers permit control of every positive trace power.
  These arguments adapt the thermal methods of #cite(label("B"), form: "prose") to Dirichlet hard-core domains.
  They yield an exponential bound in the number of prescribed defective cells.
  This joint bound will control obstructing clusters when routes are drawn through the remaining cells.

The local bridge estimates of Section 6 show that most cells contain many labels whose paths can be moved through
  any adjacent cell with uniformly positive success probability.
  Section 7 splits these labels into groups and exposes all paths outside one group.
  The usable cells are then determined by this exposed environment.
  Section 8 constructs random routes between many pairs of cells,
  with a bounded exponential moment for the encounters of two independently drawn routes in the same environment.

Section 9 uses one such route to construct two path configurations with shifted midpoint assignments.
  Removing a different tagged particle from each leaves the same bath midpoints and the same $W'$,
  as required by the overlap identity. To compare the resulting measure with the two original midpoint laws,
  we average over routes before taking the second moment of its density.
  Conditional normalizers cancel away from encounters between two routes,
  so the cost is controlled by their encounters rather than by their lengths.
  The lattice estimate bounds that cost, and a common-measure inequality gives positive overlap for a positive
  fraction of all cell pairs.

The order of the choices is essential. The path duration and the group size are fixed before the density
  threshold, and all are fixed before the volume tends to infinity.
  Section 10 returns to physical units and verifies directly that the resulting temperature is independent of that
  volume.

== 2 A scaled formulation <sec:setup>

The proof separates the thermodynamic limit from the small gas parameter.
  We first work in units in which each unit cell contains many particles,
  while the exclusion distance is much smaller than their typical separation.
  The physical change of units will be made in Section 10.

Let $K gt.eq 100$ be an integer and let $Lambda_K = \( bb(R) \/ K bb(Z) \)^3$. Write

#[#set math.equation(numbering: n => "(2.1)")
 $ V = K^3 \, wide D = N \/ V \, wide r = alpha \/ D \, wide alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \] \, wide
   0 < T lt.eq D^(- 1) \, wide beta = T^(- 1) . $ <eq:scaled-parameters>]

The number $alpha_0 gt.eq 2$ will be fixed sufficiently large; subsequently $D$ will be taken sufficiently large.
  For $j gt.eq 1$, let

$ Omega_j = { X in Lambda_K^j : d \( x_i \, x_k \) > r upright(" for ") i eq.not k } \, wide q_j \[ f \] =
  sum_(i = 1)^j integral_(Omega_j) \| nabla_i f \|^2 . $

Here $d$ is Euclidean torus distance. The form domain is $H_0^1 \( Omega_j \)$,
  restricted to symmetric functions for the bosonic Hamiltonian $H_j$.
  Functions are extended by zero to $Lambda_K^j$. This convention is used for partial traces, multipliers,
  and integral kernels throughout the paper.

For a bounded measurable function $W gt.eq 0$, set

$ H_j^(\( - W \)) = H_j - sum_(i = 1)^j W \( x_i \) \, wide Z_j^(\( - W \)) = "Tr" e^(- beta H_j^(\( - W \))) \,
  wide F_j^(\( - W \)) = - T log Z_j^(\( - W \)) . $

The trace is on the symmetric space. Omit the superscript when $W = 0$, and put $Z_0 = 1$, $F_0 = 0$.
  For a symmetric trace-one state $sigma$ of finite kinetic energy, write

$ S \( sigma \) = - "Tr" sigma log sigma \, wide cal(F)_j^(\( - W \)) \( sigma \) = "Tr" H_j^(\( - W \)) sigma -
  T S \( sigma \) . $

Energy expectations mean form expectations. The entropy bound in Lemma 5 implies that these entropies are finite.
  Gibbs’ variational principle gives $cal(F)_j^(\( - W \)) \( sigma \) gt.eq F_j^(\( - W \))$.
  The insertion construction in Section 3 also verifies that the relevant hard-core form domains,
  through particle number $2 N$, are nonzero for the parameters used here.

The unit cells are $B_v = v + \[ - 1 \/ 2 \, 1 \/ 2 \)^3$, periodically interpreted,
  with $v in cal(L)_K = \( bb(Z) \/ K bb(Z) \)^3$. The function $n_v \( X \)$ counts positions in $B_v$.
  For a set of cells $A subset cal(L)_K$, distances to $A$ mean distances to its centers.
  Changing between the union of cells and their centers changes the estimates below only by absolute constants.
  The lattice distance $d_oo$ is the periodic maximum distance on $cal(L)_K$.
  Unless stated otherwise, $c \, C > 0$ denote constants independent of $K \, D \,
  T$ in the ranges under consideration; they may change from line to line and depend on parameters already fixed.
  Dependence on the fixed interval for $alpha$ is allowed after $alpha_0$ is chosen.

=== 2.1 Positive kernels and retained particles <positive-kernels-and-retained-particles>

Let $H_j^(upright("lab"))$ be the labelled Dirichlet operator on $Omega_j$,
  let $K_s^(\( j \))$ be its heat kernel, and let $P_j$ be the orthogonal projection onto symmetric functions.
  When $j = N$, denote the kernel of $e^(- s H_N^(upright("lab"))) P_N$ by $B_s^(upright("sym"))$.
  This operator is the bosonic semigroup extended by zero on the orthogonal complement of the symmetric subspace.
  Explicitly it is the average of $K_s^(\( N \))$ over permutations of one endpoint.
  It is nonnegative and obeys the semigroup law with integration over ordered configurations,
  without any additional factorial.

The labelled kernel is the free Brownian kernel, with generator $Delta$,
  restricted to paths whose pair distances stay strictly above $r$.
  One way to establish this exact boundary convention is to exhaust $Omega_j$ by relatively compact smooth open
  sets. Their Dirichlet forms increase in domain to $H_0^1 \( Omega_j \)$, giving strong semigroup convergence.
  A continuous path that stays in $Omega_j$ on a compact time interval has compact image there and is captured by
  the exhaustion. Monotone convergence of killed path measures proves the representation.
  The same reasoning, or bounded-potential Feynman–Kac, treats the fields above.
  This is the open-domain argument used in #cite(label("HS"), form: "prose") Section 4.

Heat traces are finite: the zero-extension form embedding and the min–max principle compare the Dirichlet
  eigenvalues to those of the free torus operator. Kernel identities are needed only almost everywhere.
  Splitting a semigroup at positive times justifies diagonal trace formulas without selecting values of a general
  kernel on a null set.

Partial traces preserve the remaining hard-core conditions and the kinetic expectations of the retained
  coordinates. The form-domain justification is given with the entropy estimates in Section 3,
  before these marginals are used to compare particle numbers.

=== 2.2 The estimate to be proved <the-estimate-to-be-proved>

Let $Gamma_N = Z_N^(- 1) e^(- beta H_N)$, let $gamma_N^(\( 1 \)) = N "Tr"_(2 \, dots.h \, N) Gamma_N$,
  and let $u_0 = V^(- 1 \/ 2)$. The occupation fraction is

$ B_(upright("occ")) = N^(- 1) chevron.l u_0 \, gamma_N^(\( 1 \)) u_0 chevron.r . $

#thm([Theorem 2.1.])[
  (Scaled occupation bound).  #emph[There are constants $alpha_0 gt.eq 2$, $D_(*) < oo$,
    and $c_(*) > 0$ such that $B_(upright("occ")) gt.eq c_(*)$ whenever the parameters satisfy (2.1), $D gt.eq
    D_(*)$, and $K$ is sufficiently large. The lower threshold for $K$ can be chosen locally uniformly for $D$ in
    $\[ D_(*) \, oo \)$, uniformly in $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$ and $0 < T lt.eq D^(- 1)$.]
] <thm:scaled>

Sections 3 and 4 establish free-energy estimates and joint bounds on the position counts.
  Section 5 extends those bounds to a short interval of particle paths.
  The remaining sections compare configurations by moving selected labels along paths of usable cells.
  This yields Theorem 2 in Section 9; the final change of units proves Theorem 1.

== 3 Local kinetic energy and particle-number costs <sec:energy>

The spatial estimates require two complementary comparisons.
  Hard exclusion forces a kinetic cost when many particles occupy one cell or have a close neighbor.
  Conversely, inserting one particle has a uniformly bounded free-energy cost,
  even in an attractive external field. We establish both comparisons,
  including the entropy estimates that distinguish the Gibbs problem from its ground-state counterpart.

For a set $I$ of particle labels, write

$ q_I \[ F \] = sum_(i in I) integral \| nabla_i F \|^2 \, wide n_v^I = \# { i in I : x_i in B_v } \, wide d_i^I =
  min_(j in I \\ { i }) d \( x_i \, x_j \) . $

The last minimum is $+ oo$ for a singleton set. Superscripts $I$ are omitted when every label is retained.
  All form functions below are extended by zero across the forbidden configurations.

=== 3.1 Two local consequences of the hard core <two-local-consequences-of-the-hard-core>

The following arguments reproduce the local estimates of #cite(label("HS"), form: "prose") Section 3,
  “Two local kinetic inequalities”. Their ingredients are the two-particle coercivity used in local exclusion
  estimates #cite(label("LundholmPortmannSolovej2015")) Proposition 10 and Neumann subdivision
  #cite(label("LiebYngvason1998")).

#thm([Lemma 3.1.])[
  (Cube energy).  #emph[Let $Q subset bb(R)^3$ be a cube of side $l$,
    and let $F in H^1 \( Q^n \)$ vanish almost everywhere whenever some pair has distance at most $r$.
    No boundary condition is imposed on the outer faces. Then
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(i = 1)^n integral_(Q^n) \| nabla_i F \|^2 gt.eq c_(upright("cube")) r /
   l^3 n \( n - 1 \) integral_(Q^n) \| F \|^2 \, wide c_(upright("cube")) = frac(1, 64 sqrt(3)) . $ <eq:cube-energy>]

 Consequently, for a torus hard-core form function and every fixed label set $I$,
#[#set math.equation(numbering: n => "(3.2)")
 $ q_I \[ F \] gt.eq c_(upright("cube")) r integral sum_v n_v^I \( n_v^I - 1 \) \| F \|^2 . $ <eq:cell-energy>]

]
] <lem:cube>

#proof[
  Fix a point $y in Q$. A slice $f$ vanishing on $\| x - y \| lt.eq r$ satisfies on almost every ray $x = y +
    s omega$ in $Q$
  $ \| f \( y + s omega \) \|^2 lt.eq (integral_r^s t^(- 2) thin thin upright(d) t) integral_r^s \| partial_t
    f \( y + t omega \) \|^2 t^2 thin thin upright(d) t lt.eq
    r^(- 1) integral_r^(R \( omega \)) \| partial_t f \|^2 t^2 thin thin upright(d) t \, $
  where convexity gives $R \( omega \) lt.eq sqrt(3) l$. Rays ending before $r$ contribute zero.
    Integration in $s$ and $omega$ yields
  #[#set math.equation(numbering: n => "(3.3)")
   $ integral_Q \| f \|^2 lt.eq frac(sqrt(3) l^3, r) integral_Q \| nabla f \|^2 . $ <eq:ray-energy>]
  Sobolev slicing, or approximation on the ray intervals, justifies this calculation for $H^1$ functions.
  For $n gt.eq 2$, subdivide $Q$ into $j^3$ cubes, with $j = floor.l \( n \/ 2 \)^(1 \/ 3) floor.r$.
    Then $n \/ 16 lt.eq j^3 lt.eq n \/ 2$. In a sector specifying the subcube of every coordinate,
    at most $j^3$ coordinates occupy singleton cubes. For each of the at least $n \/ 2$ remaining coordinates,
    choose a partner in its own subcube by a fixed label ordering.
    Apply (3.3) in that coordinate, with the partner and all other coordinates fixed.
    Summing uses each coordinate’s kinetic energy once and gives the lower bound
  $ frac(r j^3, sqrt(3) l^3) n / 2 gt.eq frac(r n^2, 32 sqrt(3) l^3) $
  times the sector norm. Restriction to sectors introduces no derivative of their indicators:
    this is Neumann bracketing. Sum over sectors; the cases $n = 0 \, 1$ are immediate.
    This proves (3.1) with the stated smaller constant. Finally assign the coordinates in $I$ to unit cells,
    fix the other coordinates, and apply the cube inequality inside each occupied cell.
    Euclidean distance at most $r$ in a cell lift implies torus distance at most $r$,
    so the required zeros persist. Integration over the fixed coordinates proves (3.2). ◻
]

#thm([Lemma 3.2.])[
  (Close-neighbor energy).  #emph[For $0 < r < s < 1$, every hard-core form function satisfies
#[#set math.equation(numbering: n => "(3.4)")
 $ q_I \[ F \] gt.eq c_(upright("near")) r s^(- 3) integral \# { i in I : d_i^I lt.eq 2 s } \| F \|^2 \, wide
   c_(upright("near")) = frac(27, 262144 sqrt(3)) . $ <eq:close-energy>]

]
] <lem:close>

#proof[
  Partition each coordinate circle into $floor.l K \/ \( 8 s \)
    floor.r$ equal intervals and translate the resulting grid uniformly.
    Its cube side $l$ lies in $\[ 8 s \, 16 s \]$. Two points of torus distance at most $2
    s$ belong to one cube with probability at least $\( 1 - 2 s \/ l \)^3 gt.eq 27 \/ 64$.
    For any fixed translated grid, apply (3.3) to every coordinate having a partner in its cube,
    choosing the partner by label order in each assignment sector.
    This bounds the kinetic energy below by $r \/ \( sqrt(3) l^3 \)$ times the number of such coordinates.
    For each $i$ with $d_i^I lt.eq 2 s$, fix a nearest partner before averaging over grid translations.
    It belongs to the same cube with probability at least $27 \/ 64$.
    Since $l^3 lt.eq 4096 s^3$, averaging proves the claim. ◻
]

=== 3.2 Entropy and admissible marginals <entropy-and-admissible-marginals>

We shall apply kinetic inequalities to mixed states, to their marginals,
  and to states confined to a spatial region. The following estimate is the ideal Bose entropy bound used in
  #cite(label("B"), form: "prose") Section 3, “An entropy bound”.

#thm([Lemma 3.3.])[
  (Kinetic control of entropy).  #emph[Let $O$ be an open subset of $Lambda_K$ with Dirichlet kinetic energy,
    or the whole torus with periodic kinetic energy. For every fixed $a >
    0$ and every symmetric trace-one $j$-particle state $sigma$ of finite kinetic energy,
#[#set math.equation(numbering: n => "(3.5)")
 $ a "Tr" #scale(x: 180%, y: 180%)[\(] sum_(i = 1)^j - Delta_(O \, i) #scale(x: 180%, y: 180%)[\)] sigma -
   T S \( sigma \) gt.eq - T j - C_a T \| O \| \( V^(- 1) + T^(3 \/ 2) \) . $ <eq:entropy-bound>]

 In particular $S \( sigma \) < oo$. The statement holds for all $T > 0$, including $j = 0$ with the vacuum convention.]
] <lem:entropy>

#proof[
  The Gaussian image sum for the periodic heat kernel gives $K_t \( 0 \) lt.eq C \( V^(- 1) + t^(- 3 \/ 2) \)$.
    Killing can only decrease its diagonal, and hence
  $ "Tr" e^(t a Delta_O) lt.eq C_a \| O \| \( V^(- 1) + t^(- 3 \/ 2) \) . $
  The ideal Bose grand partition function at fugacity $e^(- 1)$ has logarithm
  $ sum_(m gt.eq 1) e^(- m) / m "Tr" e^(m beta a Delta_O) lt.eq C_a \| O \| \( V^(- 1) + T^(3 \/ 2) \) . $
  Its $j$-particle contribution is $e^(- j)$ times the canonical partition function.
    The Gibbs variational inequality gives (3.5). For a general finite-energy state the same inequality follows by
    finite spectral approximation, or from nonnegativity of relative entropy to the ideal canonical Gibbs state.
    This also proves entropy finiteness without an initial entropy assumption.
    Hard-core states are admissible here by Dirichlet zero extension into the free-particle space. ◻
]

We record a domain fact used repeatedly below. A marginal obtained by retaining some particle coordinates of a
  finite-energy hard-core state still has finite kinetic energy and satisfies the hard-core Dirichlet condition
  among the retained coordinates. Indeed, first approximate a form vector by smooth functions compactly supported
  in the allowed configuration set. Slicing in the discarded variables places it in the retained form domain with
  values in the $L^2$ space of the other variables. Expansion in an orthonormal basis of that space shows that the
  squared form norms of its coefficient functions sum to the integrated form norm.
  Passing to the limit and then to a spectral decomposition of the state proves the assertion for partial traces.
  The kinetic expectation in the retained variables is unchanged.
  Symmetry of a bosonic state places each such marginal on the corresponding symmetric subspace.

=== 3.3 Insertion without changing the old marginal <insertion-without-changing-the-old-marginal>

The nearest-neighbor trial construction goes back to #cite(label("LiebSeiringerYngvason2000"), form: "prose")
  Section 3.2. We use the configurationwise normalization of #cite(label("HS"), form: "prose") Section 3,
  “Normalized insertion”, because it preserves the old marginal exactly.

#thm([Lemma 3.4.])[
  (Normalized insertion).  #emph[Let $w$ be a real normalized smooth one-particle orbital and $F$ an $n$-particle
    hard-core form function. Suppose that on the support of $F$ at most $k$ old positions lie within distance $2
    r$ of $"supp" w$. If $C lr(bar.v.double  bar.v.double) w_oo^2 k r^3 lt.eq 1 \/ 4$,
    there is an admissible $\( n + 1 \)$-particle function $tilde(F)$ of the same norm,
    with the same old-coordinate position marginal, such that
#[#set math.equation(numbering: n => "(3.6)")
 $ q_(n + 1) \[ tilde(F) \] lt.eq q_n \[ F \] + C #scale(x: 120%, y: 120%)[\(]
   lr(bar.v.double nabla w bar.v.double)_2^2 + lr(bar.v.double  bar.v.double) w_oo^2 k r
   #scale(x: 120%, y: 120%)[\)] lr(bar.v.double  bar.v.double) F_2^2 . $ <eq:insertion-cost>]

 No symmetry in the new coordinate is asserted. Symmetry among the old coordinates is preserved whenever $F$ has it.]
] <lem:insertion>

#proof[
  Fix a nondecreasing Lipschitz cutoff $h_r$ with values in $\[ 0 \, 1 \]$, zero up to $1.1 r$, one beyond $2 r$,
    and Lipschitz constant at most $C \/ r$. Set
  $ f_X \( y \) = w \( y \) min_(1 lt.eq i lt.eq n) h_r \( d \( y \, x_i \) \) \, wide z \( X \) =
    integral f_X \( y \)^2 thin thin upright(d) y . $
  An empty minimum equals one. The relevant radius-$2 r$ balls have total volume at most $C k r^3$, so $z gt.eq
    3 \/ 4$ on the support under consideration. Almost everywhere,
    differentiation of the minimum requires only a minimizing old coordinate and $y$. Thus
  #[#set math.equation(numbering: n => "(3.7)")
   $ integral (\| nabla_y f_X \|^2 + sum_i \| nabla_i f_X \|^2) thin upright(d) y lt.eq
     C #scale(x: 120%, y: 120%)[\(] lr(bar.v.double nabla w bar.v.double)_2^2 +
     lr(bar.v.double  bar.v.double) w_oo^2 k r #scale(x: 120%, y: 120%)[\)] . $ <eq:insertion-gradient>]
  Here a cutoff derivative has squared size at most $C \/ r^2$ and is supported in those balls;
    ties cause no change to the almost-everywhere Lipschitz derivative bound.
  Where $z > 1 \/ 4$, put $a_X = f_X \/ sqrt(z)$. For an old-coordinate derivative,
  $ partial a_X = z^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] partial f_X - a_X chevron.l a_X \,
    partial f_X chevron.r_(L^2 \( thin upright(d) y \)) #scale(x: 120%, y: 120%)[\)] . $
  Orthogonal projection therefore bounds its squared $L^2 \( thin upright(d) y \)$ norm by $z^(- 1)
    lr(bar.v.double partial f_X bar.v.double)_2^2$. The new-coordinate derivative has the same bound,
    since $z$ is independent of $y$. Furthermore
  $ integral a_X^2 thin thin upright(d) y = 1 \, wide integral a_X nabla_i a_X thin thin upright(d) y = 0 . $
  For $tilde(F) \( X \, y \) = F \( X \) a_X \( y \)$ the second identity cancels every old kinetic cross term
    after integrating in $y$. The first preserves the norm and old marginal, and (3.7) proves (3.6).
  To define the multiplier globally replace $sqrt(z)$ by $max \( sqrt(z) \, 1 \/ 2 \)$.
    This changes none of the integrals on the support of $F$;
    a Sobolev function and its weak gradient vanish almost everywhere on its zero set.
    The extra clearance $1.1 r$, together with compactly supported approximation of $F$,
    places the result in the enlarged Dirichlet form domain. This proves the assertion for arbitrary form
    functions, not only smooth ones. ◻
]

#thm([Proposition 3.5.])[
  (Particle-number free-energy bounds).  #emph[For sufficiently large $D$, uniformly in $K gt.eq 100$,
    $0 < T lt.eq D^(- 1)$, and the fixed $alpha$ window,
#[#set math.equation(numbering: n => "(3.8)")
 $ F_N & gt.eq c alpha N \,\
F_(N + k) & gt.eq F_N + c alpha k wide \( 0 lt.eq k lt.eq N \) \,\
F_j^(\( - W \)) - F_(j - 1)^(\( - W \)) & lt.eq C alpha wide \( 1 lt.eq j lt.eq 2 N \) . $ <eq:free-energy-lower>]

 The last estimate holds for every bounded measurable $W gt.eq 0$, with a constant independent of $W$.
   All form domains through particle number $2 N$ are nonempty.
   The constants $c \, C$ can be numerical; only the large-$D$ threshold depends on the fixed window for $alpha$.]
] <prop:increments>

#proof[
  First, all the form domains through particle number $2 N$ are nonempty.
    Use Lemma 6 with $w = V^(- 1 \/ 2)$, starting from the vacuum.
    At every step its smallness condition is bounded by $C \( 2 N \) r^3 \/ V lt.eq C alpha^3 \/ D^2$,
    which is small for large $D$. Taking the modulus of the resulting nonzero labelled vector and symmetrizing
    gives a nonzero bosonic form vector. Bounded fields do not alter the form domain.
  Reserve half the kinetic energy for Lemma 5 and apply Lemma 3 to the other half.
    Since $sum_v n_v \( n_v - 1 \) gt.eq N \( D - 1 \)$, every $N$-particle state satisfies
  $ cal(F)_N \( sigma \) gt.eq 1 / 2 c_(upright("cube")) r N \( D - 1 \) - T N - C T \( 1 + V T^(3 \/ 2) \) . $
  With $T lt.eq D^(- 1)$ and $alpha gt.eq 1$, the negative terms are absorbed by a fixed fraction of $alpha
    N$ for large $D$. This proves (3.8).
  As in #cite(label("B"), form: "prose") Section 3, “Particle-number free-energy bounds”,
    $F_j \/ j$ is nondecreasing wherever the form domains are nonempty.
    For a symmetric $j$-particle state let $S_i$ be the entropy of its trace-one $i$-particle marginal,
    with $S_0 = 0$. Strong subadditivity #cite(label("LiebRuskai1973Entropy")) gives $2 S_i gt.eq S_(i - 1) +
    S_(i + 1)$; at $i = 1$ ordinary subadditivity suffices. All these entropies are finite by Lemma 5 and the
    preceding marginal-domain argument. Thus $S_i \/ i$ is nonincreasing in $i$.
    The kinetic energy per particle is unchanged under passage to a marginal.
    Applying the variational principle to that admissible symmetric marginal proves monotonicity of $F_j \/ j$.
    In particular $F_(N + k) gt.eq \( N + k \) F_N \/ N$, which yields (3.8).
  For the upper bound, first distinguish the last label and impose symmetry only among the first $j -
    1$ coordinates. Take $w = V^(- 1 \/ 2)$ in Lemma 6. Uniformly for $j lt.eq 2 N$,
    the loss of norm before normalization is at most $C j r^3 \/ V lt.eq C alpha^3 \/ D^2$.
    For large $D$, the normalized orbital therefore satisfies
  #[#set math.equation(numbering: n => "(3.9)")
   $ \| a_X \( y \) \| lt.eq C V^(- 1 \/ 2) \, wide integral (\| nabla_y a_X \|^2 + sum_i \| nabla_i a_X \|^2)
     thin upright(d) y lt.eq C alpha . $ <eq:constant-insertion>]
  For $p in \( 2 pi \/ K \) bb(Z)^3$ define the isometry
  $ v_p F \( X \, y \) = F \( X \) a_X \( y \) e^(i p dot.op y) . $
  The old kinetic cross terms vanish by normalization, and the new phase adds exactly $\| p \|^2
    lr(bar.v.double  bar.v.double) F_2^2$, since $a_X$ is real.
    Old field expectations are unchanged, while the new field is nonpositive.
    Hence the form-energy increase, including the field, is at most $\( C alpha + \| p \|^2 \)
    lr(bar.v.double  bar.v.double) F_2^2$.
  These insertions form a bounded frame:
  #[#set math.equation(numbering: n => "(3.10)")
   $ sum_(\| p \| lt.eq 1) v_p v_p^(*) lt.eq C I . $ <eq:insertion-frame>]
  Indeed, after zero extension in $y$, Parseval’s identity at each $X$ gives $sum_p \| integral a_X \( y \)
    e^(- i p dot.op y) u \( X \, y \) thin thin upright(d) y \|^2 =
    V integral a_X \( y \)^2 \| u \( X \, y \) \|^2 thin thin upright(d) y lt.eq
    C integral \| u \( X \, y \) \|^2 thin thin upright(d) y$.
    Integrate in $X$ and restrict the frequency sum to obtain (3.10).
  Let $Z_(j \, upright("dist"))^(\( - W \))$ denote the heat trace in this distinguished-label space,
    and let $E_l \, psi_l$ be an orthonormal eigenbasis of the symmetric $\( j - 1 \)$-particle operator with
    field. The scalar Jensen inequality in the spectral measure of each inserted unit vector gives
  $ C Z_(j \, upright("dist"))^(\( - W \)) & gt.eq sum_(\| p \| lt.eq 1) sum_l chevron.l v_p psi_l \,
    e^(- beta H_(j \, upright("dist"))^(\( - W \))) v_p psi_l chevron.r\
 & gt.eq sum_(\| p \| lt.eq 1) sum_l e^(- beta \( E_l + C alpha + \| p \|^2 \)) gt.eq
   c V e^(- beta \( C alpha + 1 \)) Z_(j - 1)^(\( - W \)) . $
  The first inequality is the frame bound; the last uses at least $c V$ frequencies with $\| p \| lt.eq 1$.
    Positivity of the labelled heat kernel gives
  $ Z_j^(\( - W \)) gt.eq j^(- 1) Z_(j \, upright("dist"))^(\( - W \)) : $
  in the permutation expansion of the full symmetrizer retain the $\( j - 1 \) !$ permutations fixing the last
    label, whose contributions are nonnegative. Therefore
  $ F_j^(\( - W \)) - F_(j - 1)^(\( - W \)) lt.eq C alpha + 1 + T log_(+) \( C j \/ V \) lt.eq C' alpha \, $
  because $j \/ V lt.eq 2 D$, $T lt.eq D^(- 1)$, and $alpha gt.eq 1$. ◻
]

== 4 Localization and joint spatial estimates <sec:spatial>

We now show that any prescribed family of cells is unlikely to suffer simultaneous particle shortages or
  simultaneous failures of separation. These are estimates under the actual equilibrium position law $mu$.
  They do not condition on the positions outside the cells.
  The method, adapted from #cite(label("B"), form: "prose") Section 4,
  compares a lower free-energy penalty from spatial localization with an upper bound obtained by tilting the
  diagonal of the Gibbs state.

For a bounded measurable one-particle function $f$, put $n_f \( X \) = sum_i f \( x_i \)$,
  and write $bb(E)_sigma$ for expectation under the position law of a state $sigma$. In this section set

$ Gamma = Z_N^(- 1) e^(- beta H_N) \, wide mu \( thin upright(d) X \) = Gamma \( X \, X \) thin upright(d) X . $

=== 4.1 Localization and diagonal tilting <localization-and-diagonal-tilting>

#thm([Lemma 4.1.])[
  (Two-color localization).  #emph[Let $p \, q$ be real Lipschitz functions with $p^2 + q^2 = 1$,
    and suppose $p$ is compactly supported in an open set $O$, or take $O = Lambda_K$.
    For a finite-energy symmetric $J$-particle state $sigma$,
    map each coordinate by $f mapsto \( p f \, q f \)$ and dephase by the number $j$ of particles in the first
    color. Denote its distribution by $w_j$ and the conditional first- and second-color marginal states by
    $sigma_(i \, j)$ and $sigma_(o \, j)$. For every bounded field $W gt.eq 0$,
#[#set math.equation(numbering: n => "(4.1)")
 $ cal(F)_J^(\( - W \)) \( sigma \) + bb(E)_sigma n_(\| nabla p \|^2 + \| nabla q \|^2) gt.eq
   sum_(j = 0)^J w_j #scale(x: 120%, y: 120%)[\[] cal(F)_j^(\( - W \)) \( sigma_(i \, j) \) +
   cal(F)_(J - j)^(\( - W \)) \( sigma_(o \, j) \) #scale(x: 120%, y: 120%)[\]] - T H \( w \) . $ <eq:two-color>]

 The inside states also satisfy the Dirichlet condition in $O$.
   Terms with $w_j = 0$ are omitted, and vacuum states are allowed. Moreover
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_j j w_j = bb(E)_sigma n_(p^2) \, wide H \( w \) lt.eq - log \( 1 - e^(- 1) \) +
   sum_j j w_j . $ <eq:color-entropy>]

]
] <lem:localization>

#proof[
  The geometric localization and entropy decomposition are the many-body IMS construction;
    see #cite(label("Lewin2011"), form: "prose") Section 3 and
    #cite(label("DeuchertSeiringerYngvason2019"), form: "prose") Section 3, Lemma 3.1.
    Here is the hard-core version. The one-particle map is isometric,
    so its symmetric tensor power preserves the spectrum and entropy of $sigma$.
    In each sector of fixed color number, normalized symmetrization over the mutually orthogonal color assignments
    identifies the space with the tensor product of the two symmetric species spaces.
    There is one such tensor product, with no binomial multiplicity.
  The product rule and $p nabla p + q nabla q = 0$ give the exact kinetic increase $bb(E)_sigma
    n_(\| nabla p \|^2 + \| nabla q \|^2)$. The field distributes between the two colors without error.
    The masks preserve the hard-core form domain. After cross-color exclusions are dropped,
    slicing gives admissible same-color marginal states, by the domain argument in Section 3;
    the first color is also Dirichlet in $O$. Thus the sum of their energy expectations equals the localized
    energy. Entropy cannot decrease under dephasing and is subadditive in each color sector, whence
  $ S \( sigma \) lt.eq H \( w \) + sum_j w_j \[ S \( sigma_(i \, j) \) + S \( sigma_(o \, j) \) \] . $
  All entropies are finite by Lemma 5, applied also to the finitely many color spaces. This proves (4.1).
    Conditional on positions, colors are independent choices with probabilities $p \( x_i \)^2 \, q \( x_i \)^2$,
    proving the first identity in (4.2). Nonnegativity of relative entropy to the geometric law $\( 1 - e^(- 1) \)
    e^(- j)$ proves the second. ◻
]

#thm([Lemma 4.2.])[
  (Diagonal tilt).  #emph[For a bounded real symmetric Lipschitz function $G$ of $N$ positions, set
$ g = e^G \, wide M_G = bb(E)_mu e^(2 G) \, wide sigma_g = M_G^(- 1) g Gamma g . $

 Then
#[#set math.equation(numbering: n => "(4.3)")
 $ cal(F)_N \( sigma_g \) - F_N lt.eq bb(E)_(sigma_g) \| nabla G \|^2 +
   T #scale(x: 120%, y: 120%)[\(] 2 bb(E)_(sigma_g) G - log M_G #scale(x: 120%, y: 120%)[\)] . $ <eq:diagonal-tilt>]

 Here $\| nabla G \|^2 = sum_i \| nabla_i G \|^2$.]
] <lem:tilt>

#proof[
  This is the diagonal-tilting argument of #cite(label("B"), form: "prose") Section 4,
    “Two-color localization and diagonal tilting”. Put $tau = M_G^(- 1) Gamma^(1 \/ 2) g^2 Gamma^(1 \/ 2)$.
    The nonzero spectra of $tau$ and $sigma_g$ agree, as the spectra of $B^(*) B$ and $B B^(*)$ for $B =
    M_G^(- 1 \/ 2) g Gamma^(1 \/ 2)$. If $H_N psi = E psi$, testing the weak equation with $g^2 psi$ gives
  $ q_N \[ g psi \] = E lr(bar.v.double g psi bar.v.double)_2^2 + integral \| nabla g \|^2 \| psi \|^2 . $
  Lipschitz multiplication preserves the hard-core boundary condition. Summing in a Gibbs eigenbasis yields
  #[#set math.equation(numbering: n => "(4.4)")
   $ "Tr" H_N sigma_g = "Tr" H_N tau + bb(E)_(sigma_g) \| nabla G \|^2 . $ <eq:tilt-energy-identity>]
  Both energies are finite: $g$ and its gradients are bounded at fixed $N \, K$,
    and positive-time heat traces control the eigenvalue-weighted sum. Lemma 5 then gives finite entropies.
  To bound the relative entropy $D \( tau bar.v.double Gamma \)$,
    first let $g^2$ be constant on a finite partition into symmetric measurable sets $E$.
    Put $p_E = "Tr" Gamma upright(bold(1))_E$ and $tau_E = p_E^(- 1) Gamma^(1 \/ 2) upright(bold(1))_E
    Gamma^(1 \/ 2)$ when $p_E > 0$. The two states $Gamma$ and $tau$ are mixtures of the same states $tau_E$,
    with weights $p_E$ and $p_E g_E^2 \/ M_G$, respectively. Monotonicity of relative entropy under discarding the
    classical label #cite(label("Lindblad1975")) gives
  $ D \( tau bar.v.double Gamma \) lt.eq sum_E frac(p_E g_E^2, M_G) log g_E^2 / M_G . $
  Uniform positive simple approximation to $g^2$ gives trace-norm convergence of these states and convergence of
    the classical expression. Lower semicontinuity therefore implies $D \( tau bar.v.double Gamma \) lt.eq
    2 bb(E)_(sigma_g) G - log M_G$. Finally $cal(F)_N \( tau \) - F_N = T D \( tau bar.v.double Gamma \)$,
    the equality of entropies, and (4.4) prove (4.3). ◻
]

=== 4.2 A local penalty and density control in a field <a-local-penalty-and-density-control-in-a-field>

For a nonempty set of sites $A subset cal(L)_K$, define, for a configuration of any particle number $J lt.eq N$,

#[#set math.equation(numbering: n => "(4.5)")
 $ s_0 & = b D^(- 1 \/ 3) \, wide 0 < b < 1 \,\
f_A \( X \) & = sum_(i = 1)^J e^(- d \( x_i \, A \)) \,\
k_A \( X \) & = \# { i : d \( x_i \, A \) lt.eq 6 \, med d_i lt.eq 2 s_0 } . $ <eq:s0>]

The parameter $b$ will be chosen small after the low-count threshold has been fixed.
  We always increase $D$ so that $r < s_0 < 1 \/ 2$.

#thm([Proposition 4.3.])[
  (Weighted local free-energy penalty).  #emph[There are $c \, C > 0$, independent of $b$,
    such that for every $0 lt.eq J lt.eq N$, every bounded measurable $0 lt.eq W lt.eq 1$,
    and every finite-energy symmetric trace-one state $sigma$,
#[#set math.equation(numbering: n => "(4.6)")
 $ cal(F)_J^(\( - W \)) \( sigma \) - F_J^(\( - W \)) gt.eq
   alpha [bb(E)_sigma \( f_A + c b^(- 3) k_A \) - C D \| A \|] . $ <eq:local-penalty>]

 The threshold on $D$ may depend on $b$, but the displayed constants do not.]
] <prop:local-penalty>

#proof[
  We combine the exponential localization of #cite(label("HS"), form: "prose") Section 3,
    “Exponential spatial localization” with the thermal entropy decomposition of Lemma 8.
    For $h gt.eq 0$, choose sine–cosine masks $p_h \, q_h$ such that $p_h = 1$ at distance at most $h$ from $A$,
    $p_h = 0$ from distance $h + 1$ onward, and
  $ \| nabla p_h \|^2 + \| nabla q_h \|^2 lt.eq C upright(bold(1))_({ h < d \( x \, A \) < h + 1 }) . $
  Take the inside region $O_h$ to be the open $\( h + 2 \)$-neighborhood, or the torus when appropriate.
    Its volume is at most $C \( h + 4 \)^3 \| A \|$, and $p_h$ is compactly supported there.
  Apply Lemma 8. Outside, the upper increments of Proposition 7 give $F_(J - j)^(\( - W \)) gt.eq
    F_J^(\( - W \)) - C alpha j$. Inside, divide the kinetic energy into three fixed positive portions.
    One portion pays for the entire von Neumann entropy by Lemma 5.
    Apply Lemmas 3 and 4 to the other two, with $s = s_0$. The field costs at most $j$,
    while the color entropy costs at most $T \( C + j \)$ by (4.2).
    Thus all losses linear in the inside number are bounded by $C alpha j$, since $T lt.eq 1$ and $alpha gt.eq 1$.
    The remaining entropy error is at most
  $ C T #scale(x: 120%, y: 120%)[\[] 1 + \| O_h \| \( V^(- 1) + T^(3 \/ 2) \) #scale(x: 120%, y: 120%)[\]] lt.eq
    C \( h + 4 \)^3 \| A \| . $
  Average with the probability density $e^(- h) thin thin upright(d) h$. For every position $x$,
  $ integral_0^oo p_h \( x \)^2 e^(- h) thin thin upright(d) h lt.eq e thin e^(- d \( x \, A \)) \, quad
    integral_0^oo upright(bold(1))_({ h < d \( x \, A \) < h + 1 }) e^(- h) thin thin upright(d) h lt.eq
    e thin e^(- d \( x \, A \)) . $
  Consequently the averaged removal and localization costs are at most $C alpha bb(E)_sigma f_A$,
    and the residual entropy cost is at most $C alpha \| A \|$.
  To retain the positive terms, set $b_v = e^(- d \( v \, A \))$.
    If $h gt.eq d \( v \, A \) + 1$, every coordinate in $B_v$ belongs to the first color with probability one.
    The averaged cube contribution is therefore at least $c r bb(E)_sigma sum_v b_v n_v \( n_v - 1 \)$.
    A particle counted by $k_A$ has a partner within $2 s_0 < 1$; both lie at distance less than $7$ from $A$.
    For $h gt.eq 8$ both labels belong to the first color, so its close-neighbor inequality counts this particle.
    This yields at least $c r s_0^(- 3) bb(E)_sigma k_A = c alpha b^(- 3) bb(E)_sigma k_A$.
    The color interpretation used here follows from the conditional independent choices in Lemma 8.
  We have proved
  $ cal(F)_J^(\( - W \)) \( sigma \) - F_J^(\( - W \)) gt.eq
    bb(E)_sigma [c r sum_v b_v n_v \( n_v - 1 \) - C alpha f_A + c alpha b^(- 3) k_A] - C alpha \| A \| . $
  Within a unit cell, distances to $A$ differ from the center distance by less than one. Hence
  $ f_A lt.eq e sum_v b_v n_v \, wide sum_v b_v lt.eq sum_(w in A) sum_v e^(- d \( v \, w \)) lt.eq C \| A \| . $
  The final lattice sum is uniformly bounded on periodic unit grids.
    For $n gt.eq 0$ and $D gt.eq 1$, completing a scalar square gives
  $ c / D n \( n - 1 \) - \( C + 1 \) e n gt.eq - C' D . $
  Multiply by $alpha b_v$ and sum. Since $r = alpha \/ D$, this absorbs all linear losses while leaving $alpha
    f_A$ and proves (4.6). The vacuum case is immediate. ◻
]

#thm([Corollary 4.4.])[
  (Density bound in a small field).  #emph[In the $J$-particle equilibrium state with $0 lt.eq J lt.eq
    N$ and $0 lt.eq W lt.eq 1$, every set $A$ of sites satisfies
#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) n_(upright(bold(1))_(union.big_(v in A) B_v)) lt.eq C D \| A \| . $ <eq:field-density>]

]
] <cor:field-density>

#proof[
  The left side of (4.6) is zero in equilibrium. Drop the nonnegative close-count term and use
    $n_(upright(bold(1))_(union_(v in A) B_v)) lt.eq e f_A$. Empty $A$ and the vacuum cause no exception. ◻
]

The mean estimate will control the effect of small fields on partition functions.
  To produce many movable particles, we need the stronger joint statements proved next.

=== 4.3 Simultaneous shortages are exponentially unlikely <simultaneous-shortages-are-exponentially-unlikely>

#thm([Proposition 4.5.])[
  (Joint low-count bound).  #emph[One can choose $alpha_0$ sufficiently large and then $ell >
    0$ sufficiently small so that, for every set of sites $A$ and all sufficiently large $D$,
#[#set math.equation(numbering: n => "(4.8)")
 $ mu { n_v < ell D upright(" for every ") v in A } lt.eq e^(- c D \| A \|) . $ <eq:low-count>]

 The constants and thresholds are uniform in $K gt.eq 100$ and $0 < T lt.eq D^(- 1)$.]
] <prop:low-count>

#proof[
  Assume $A eq.not diameter$. In each of its cells take $p = 1$ on the central cube of half-side $1 \/ 4$,
    with $p = 0$ outside the central cube of half-side $1 \/ 3$.
    Sine–cosine interpolation gives $q$ with $p^2 + q^2 = 1$ and uniformly bounded squared gradient cost.
    Let $O$ be the union of these unit-cell interiors. Choose a smooth squared cutoff $0 lt.eq phi.alt lt.eq 1$,
    supported in $O$, equal to one on the central cubes of half-side $1 \/ 3$,
    and satisfying $\| nabla phi.alt \|^2 lt.eq C phi.alt$. In particular $p^2$ and the localization gradient cost
    are bounded by $C phi.alt$.
  We compare each outside state from Lemma 8 with a state obtained by filling the empty central cubes.
    Set $k = floor.l eta D \| A \| floor.r$, where $0 < eta < 1$ will be fixed.
    Take a normalized smooth bump in each central cube of half-side $1 \/ 8$,
    and sum with equal amplitude to obtain an orbital $w$ with
  $ lr(bar.v.double  bar.v.double) w_oo^2 lt.eq C \/ \| A \| \, wide
    lr(bar.v.double nabla w bar.v.double)_2^2 lt.eq C . $
  Starting at the vacuum, apply Lemma 6 successively $k$ times with this orbital.
    Its smallness condition is satisfied because $C k r^3 \/ \| A \| lt.eq C D r^3 arrow.r 0$.
    The resulting normalized labelled vector has energy at most
  #[#set math.equation(numbering: n => "(4.9)")
   $ C k \( 1 + r k \/ \| A \| \) . $ <eq:fill-cost>]
  It is supported in the union of the bump supports in every coordinate.
    Replace it by the square root of the average of its squared moduli over all permutations.
    The norm is unchanged, the hard-core zeros are preserved,
    and the inequality for the gradient of a Euclidean norm shows that energy cannot increase.
    This constructs a fixed symmetric normalized added vector $psi_k$ with the same bound.
    Dirichlet admissibility follows by contraction and approximation of the original form vector.
  The conditional outside state is supported in $\( "supp" q \)^(N - j)$.
    Its coordinates are separated from every bump support by distance at least $1 \/ 8$,
    larger than $r$ for large $D$. The map on its form vectors
  $ U_j f = binom(N - j + k, k)^(1 \/ 2) P_(upright("sym")) \( f ⊗ psi_k \) $
  is an isometry: the distinct choices of the $k$ added labels have disjoint position supports.
    It preserves entropy and has additive kinetic energy. The support separation also guarantees every old–new
    hard-core condition. Consequently
  $ cal(F)_(N - j) \( sigma_(o \, j) \) gt.eq F_(N - j + k) - C k \( 1 + r k \/ \| A \| \) . $
  Here $k lt.eq eta N < N$, so Proposition 7 applies up to $N + k lt.eq 2 N$.
    Its lower increment followed by $j$ upper increments gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ cal(F)_(N - j) \( sigma_(o \, j) \) gt.eq F_N + c alpha k - C alpha j -
     C k \( 1 + r k \/ \| A \| \) . $ <eq:outside-fill-comparison>]
  The bump profiles and their constants were fixed independently of $alpha_0$.
    Choose $alpha_0$ large, and then $eta$ small, so that throughout the $alpha$ window
  $ C \( 1 + alpha eta \) lt.eq c alpha \/ 2 . $
  Since $r k \/ \| A \| lt.eq alpha eta$, the final term in (4.10) is absorbed by half the positive insertion
    gain. For large $D$, $k gt.eq eta D \| A \| \/ 2$.
  Inside, Lemma 5 with the full kinetic energy bounds the free energy below by $- T j -
    C T \| A \| \( V^(- 1) + T^(3 \/ 2) \)$. Apply Lemma 8, use $sum_j j w_j lt.eq bb(E)_sigma n_phi.alt$,
    and absorb the remaining $O \( \| A \| \)$ errors into the filling gain.
    For every finite-energy $N$-particle state this gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ cal(F)_N \( sigma \) - F_N gt.eq c alpha D \| A \| - C alpha bb(E)_sigma n_phi.alt . $ <eq:shortage-penalty>]
  Apply Lemma 9 with $G = - lambda n_phi.alt$, $0 lt.eq lambda lt.eq 1$, and write $L \( lambda \) = -
    log bb(E)_mu e^(- 2 lambda n_phi.alt)$. Since $0 lt.eq n_phi.alt lt.eq N$,
    this moment is differentiable at fixed $N \, K$ by dominated convergence.
    The squared gradient is at most $C lambda^2 n_phi.alt$, while $2 bb(E)_(sigma_g) G lt.eq 0$.
    Comparing with (4.11), and increasing $C$, gives
  $ C alpha bb(E)_(sigma_g) n_phi.alt + T L \( lambda \) gt.eq c alpha D \| A \| \, wide L' \( lambda \) =
    2 bb(E)_(sigma_g) n_phi.alt . $
  Choose a fixed $a' > 0$ sufficiently small. Whenever $L \( lambda \) lt.eq a' D \| A \|$,
    the term $T L \( lambda \)$ is at most half the right side,
    and the resulting lower bound for $L'$ is at least $2 a' D \| A \|$.
    Since $L \( 0 \) = 0$ and $L$ is nondecreasing, this forces $L \( 1 \) gt.eq a' D \| A \|$.
    On the low-count event, $n_phi.alt lt.eq sum_(v in A) n_v < ell D \| A \|$.
    Exponential Markov therefore gives probability at most $exp \[ - \( a' - 2 ell \) D \| A \| \]$.
    Choose $2 ell < a'$ to prove (4.8). For empty $A$ both sides equal one. ◻
]

=== 4.4 Simultaneous failures of separation <simultaneous-failures-of-separation>

Fix from now on $theta > 0$ so that $3 theta < ell \/ 2$. For a site $v$, define

#[#set math.equation(numbering: n => "(4.12)")
 $ C_v \( X \) = \# { i : d \( x_i \, v \) lt.eq 5 \, med d_i lt.eq s_0 } . $ <eq:close-count-definition>]

The enlarged radius allows this count to control endpoint defects of particles starting in neighboring cells.

#thm([Proposition 4.6.])[
  (Joint close-count bound).  #emph[For every fixed $theta > 0$,
    one can choose $b > 0$ sufficiently small and then $D$ sufficiently large so that, for every set of sites $A$,
#[#set math.equation(numbering: n => "(4.13)")
 $ mu { C_v gt.eq theta D upright(" for every ") v in A } lt.eq p_D^(\| A \|) \, wide p_D =
   exp \( - c theta b D^(2 \/ 3) \) arrow.r 0 . $ <eq:close-count-tail>]

 Here $c > 0$ can be numerical, and the bounds remain uniform in the temperature and volume ranges above.]
] <prop:close-count>

#proof[
  For nonempty $A$, choose squared Lipschitz cutoffs $u \, xi$ in $\[ 0 \, 1 \]$, with $u = 1$ on $\[ 0 \, 5 \]$,
    $u = 0$ on $\[ 6 \, oo \)$, $xi = 1$ on $\[ 0 \, 1 \]$, and $xi = 0$ on $\[ 2 \, oo \)$.
    Their derivatives satisfy $\| u' \|^2 lt.eq C u$ and $\| xi' \|^2 lt.eq C xi$. Define the Lipschitz enlargement
  $ m_A \( X \) = sum_i u \( d \( x_i \, A \) \) xi \( d_i \/ s_0 \) . $
  For configurations with fewer than two particles take the summand with $d_i = + oo$ to be zero. Then
  #[#set math.equation(numbering: n => "(4.14)")
   $ m_A lt.eq k_A \, wide sum_(v in A) C_v lt.eq C_0 m_A \, wide \| nabla m_A \|^2 lt.eq
     C s_0^(- 2) m_A . $ <eq:close-enlargement>]
  The middle inequality follows because each point lies within distance $5$ of at most a fixed number $C_0$ of
    unit lattice sites, and each counted point contributes one to $m_A$.
  For completeness, the final inequality uses the geometry of the nearest-neighbor graph,
    as in #cite(label("HS"), form: "prose") Section 3, “Joint count and close-neighbor tails”.
    Away from a null set the nearest neighbor of each particle is unique.
    If two incoming edges at $x_k$ come from $x_i \, x_j$, with $\| x_i - x_k \| gt.eq \| x_j - x_k \|$,
    nearest-neighbor choice implies $\| x_i - x_j \| gt.eq \| x_i - x_k \|$.
    The cosine law then bounds the angle between the incoming directions below by $pi \/ 3$.
    Edges relevant to the derivatives have length at most $2 s_0 < 1$,
    so consistent Euclidean lifts are available on our torus.
    Sphere packing therefore gives a numerical bound on their incoming degree.
    Each coordinate derivative meets only a bounded number of summands of $m_A$.
    The squared-cutoff inequalities bound the squared full gradient of each summand by $C s_0^(- 2)
    u \( d \( x_i \, A \) \) xi \( d_i \/ s_0 \)$. Bounded overlap proves (4.14).
  Use Lemma 9 with $G = lambda m_A$ for $0 lt.eq lambda lt.eq s_0$. Since $M_G gt.eq 1$, (4.14) bounds its right side by
  $ \( C lambda^2 s_0^(- 2) + 2 T lambda \) bb(E)_(sigma_g) m_A lt.eq C bb(E)_(sigma_g) m_A . $
  Proposition 10, with $W = 0$ and $J = N$, bounds the same free-energy excess below by $c alpha b^(- 3)
    bb(E)_(sigma_g) m_A - C alpha D \| A \|$. Choose $b$ small enough to absorb the upper bound. It follows that
  $ bb(E)_(sigma_g) m_A lt.eq C b^3 D \| A \| wide \( 0 lt.eq lambda lt.eq s_0 \) . $
  Since $0 lt.eq m_A lt.eq N$, differentiating under the integral and then integrating the logarithmic moment
    derivative gives
  $ log bb(E)_mu e^(2 s_0 m_A) lt.eq C s_0 b^3 D \| A \| . $
  On the event in (4.13), $m_A gt.eq theta D \| A \| \/ C_0$.
    Reduce $b$ further so that $C b^3 lt.eq theta \/ C_0$. Exponential Markov bounds its probability by
    $exp \[ - \( theta \/ C_0 \) s_0 D \| A \| \]$, proving the claim because $s_0 D = b D^(2 \/ 3)$.
    The empty-set assertion is immediate. ◻
]

The spatial choices have a fixed order: first $alpha_0$ large and $ell$ small,
  then $theta$ with $3 theta < ell \/ 2$, then $b$ small, and finally $D$ large.
  These estimates provide simultaneous endpoint control for arbitrarily many prescribed cells.
  The next section extends that control to every path visiting a cell during a short imaginary-time interval.

== 5 A thermal slab and joint trajectory estimates <sec:slab>

The spatial estimates control the equilibrium positions. We now need the corresponding control of trajectories on
  a short time interval, simultaneously near any prescribed set of cells.
  The first step is an exact path representation of the Gibbs state that also retains the off-diagonal information
  needed for condensation. The second step transfers rare events for a free path to joint estimates for the
  interacting sample. For this transfer we adapt the auxiliary-color and trace-sandwich argument of
  #cite(label("B"), form: "prose") Section “A joint bound for atypical trajectories,” in particular the lemma
  “Trace bound for a Lipschitz sandwich”. The hard-core domains and the trajectory tests used here require the
  details given below.

=== 5.1 The path law and its purification <the-path-law-and-its-purification>

Fix $0 < t lt.eq 1$, set $delta = 2 t$, and require $beta > delta$.
  The time $t$ will be fixed before the lower threshold on $D$.
  Let $nu_N$ be the measure of $N$ independent torus Brownian motions with generator $Delta$ on
  $\[ 0 \, delta \]$, with Lebesgue initial measure. Write

$ X \( s \) = \( omega_1 \( s \) \, dots.h \, omega_N \( s \) \) \, wide Y = X \( 0 \) \, wide Z = X \( delta \) . $

In addition to these labelled paths, introduce a configuration $W' in Lambda_K^N$.
  With the symmetric heat-kernel convention of Section 2, define

#[#set math.equation(numbering: n => "(5.1)")
 $ thin upright(d) cal(R) \( omega \, W' \) =
   frac(B_(beta \/ 2 - t)^(upright("sym")) \( W' \, Y \) B_(beta \/ 2 - t)^(upright("sym")) \( Z \, W' \), Z_N)
   upright(bold(1))_({ d \( omega_i \( s \) \, omega_j \( s \) \) > r med forall s \, med i < j }) thin upright(d)
   nu_N \( omega \) thin thin upright(d) W' . $ <eq:thermal-slab-law>]

All path spaces carry their Borel sigma fields. Continuous torus paths have continuous Euclidean lifts,
  unique after specifying the initial lift; lifted increments and diameters are independent of that choice.

#thm([Proposition 5.1.])[
  (Thermal purification).  #emph[Equation (5.1) defines a probability measure.
    At every fixed time $s in \[ 0 \, delta \]$, its position marginal is
$ mu \( thin upright(d) X \) = Z_N^(- 1) B_beta^(upright("sym")) \( X \, X \) thin thin upright(d) X . $

 The joint law of $X \( t \)$ and $W'$ has density $Phi \( X \, W' \)^2$, where
#[#set math.equation(numbering: n => "(5.2)")
 $ Phi \( X \, W' \) = Z_N^(- 1 \/ 2) B_(beta \/ 2)^(upright("sym")) \( X \, W' \) . $ <eq:thermal-Phi>]

 This function is nonnegative, has squared integral one, and is symmetric separately in $X$ and $W'$.
   The constant-orbital occupation fraction of the scaled Gibbs state is
#[#set math.equation(numbering: n => "(5.3)")
 $ B_(upright("occ")) = 1 / V integral lr(|integral_(Lambda_K) Phi \( x \, X' \, W' \) thin thin upright(d) x|)^2
   thin upright(d) X' thin thin upright(d) W' \, $ <eq:occupation-purification>]

 where $X' in Lambda_K^(N - 1)$ is an ordered configuration.]
] <prop:purification>

#proof[
  The avoidance indicator gives the labelled Dirichlet heat kernel by the open-domain Feynman–Kac representation
    established in Section 2, with the same strict-avoidance and zero-extension conventions.
  Let $P_(upright("sym"))$ be the orthogonal symmetrizer in labelled configuration space.
    It commutes with the labelled semigroup and $P_(upright("sym"))^2 = P_(upright("sym"))$.
    Integrating $W'$ in Equation (5.1) therefore leaves the outer kernel
    $B_(beta - delta)^(upright("sym")) \( Z \, Y \)$. Composing with the slab kernel and taking the trace gives
    $Z_N$, so the total mass is one. Splitting the labelled slab kernel at time $s$ gives the diagonal kernel
    $B_beta^(upright("sym")) \( X \, X \)$ at that time. These identities hold against arbitrary bounded position
    tests; alternatively all diagonal traces can be evaluated after a further positive-time split.
  If instead we retain $W'$ and split at $t$, composing the first outer kernel with the first killed half-slab
    gives $B_(beta \/ 2)^(upright("sym")) \( W' \, X \)$. The other half gives its transpose.
    Their product, divided by $Z_N$, is $Phi \( X \, W' \)^2$.
  Finally $Phi$ is the zero-extended kernel of $Gamma_N^(1 \/ 2)$.
    Thus the kernel of the trace-one Gibbs state satisfies
  $ Gamma_N \( X \, macron(X) \) = integral Phi \( X \, W' \) Phi \( macron(X) \, W' \) thin thin upright(d) W' . $
  The reduced density matrix is $N$ times the partial trace over $X'$.
    Its expectation in the orbital $V^(- 1 \/ 2)$, divided by $N$, is precisely Equation (5.3).
    Tonelli’s theorem applies since the kernels are nonnegative;
    the resulting integral is finite since a one-particle occupation fraction is at most one. ◻
]

The extra variable $W'$ is what permits a mixed Gibbs state to be treated by a nonnegative squared density.
  It will be held fixed in the later path changes. No ground-state eigenfunction enters Equation (5.1).

=== 5.2 Regular trajectories and certificates <regular-trajectories-and-certificates>

Recall $s_0 = b D^(- 1 \/ 3)$ and the fixed parameters $ell \, theta \, b$ from the spatial estimates,
  with $3 theta < ell \/ 2$. Put

#[#set math.equation(numbering: n => "(5.4)")
 $ h_0 = D^(- 1) \, wide gamma = 1 / 12 \, wide m_t = ceil.l t \/ r^2 ceil.r \, wide tau =
   t \/ m_t . $ <eq:regularity-scales>]

Take $D$ large enough that $h_0 < t$ and $r^2 \/ 2 lt.eq tau lt.eq r^2$.
  Divide each half of the slab into $m_t$ equal intervals, denoted together by $I_1 \, dots.h \, I_(2 m_t)$.
  For a lifted path define

$ A_j \( omega \) = r^(- 1) "diam" #scale(x: 120%, y: 120%)[\(] tilde(omega) \( I_j \) #scale(x: 120%, y: 120%)[\)] . $

The following definition is the one used in #cite(label("HS"), form: "prose") Section “A stationary sample of
  hard-core paths,” definition of a regular path.

#prodef([Definition 5.2.])[
  (Regular path).  Fix a sufficiently large numerical constant $C_(upright("reg"))$.
    A path on $\[ 0 \, 2 t \]$ is #emph[regular] if
  #[#set math.equation(numbering: n => "(5.5)")
   $ max_j A_j lt.eq D^gamma \, wide frac(1, 2 m_t) sum_(j = 1)^(2 m_t) \( 1 + A_j \)^3 lt.eq
     C_(upright("reg")) \, $ <eq:regularity-tests>]
  and its lifted diameter in each endpoint window $\[ 0 \, h_0 \]$ and $\[ 2 t - h_0 \, 2 t \]$ is at most $s_0 \/ 8$.
] <def:regular>

We will use both the free-motion and the bridge forms of the next estimate.
  The latter supplies the individual regularity tests for the replacement paths in Section 6.

#thm([Lemma 5.3.])[
  (Free cutoff bounds).  #emph[Fix $t > 0$. For every $q > 0$,
    a free Brownian path on $\[ 0 \, 2 t \]$ fails regularity with probability at most $C_(q \, t) D^(- q)$,
    uniformly in its starting point, $K$, and the allowed $alpha$-window.
    The same assertion holds for a Euclidean bridge of duration $2 t$ with bounded endpoint displacement,
    and for two independent Euclidean bridge legs of duration $t$ joined at a prescribed midpoint,
    when their three prescribed points lie in a fixed bounded region.
    Constants and the lower threshold on $D$ may depend on that region and $t$,
    but $C_(upright("reg"))$ is a single numerical constant for all these laws.
    If the three points lie in the radius-$3$ ball about a site $v$,
    the probability that the two-leg path leaves the radius-$10$ ball about $v$ is at most $C
    e^(- c \/ t)$ for $0 < t lt.eq 1$.]
] <lem:free-cutoffs>

#proof[
  We reproduce the argument of #cite(label("HS"), form: "prose") Lemma “Free cutoff bounds”.
    The variables $A_j$ of Brownian motion depend on disjoint increments.
    Brownian scaling and $tau \/ r^2 in \[ 1 \/ 2 \, 1 \]$ give $bb(P) \( A_j > a \) lt.eq
    C e^(- c a^2)$ for $a gt.eq 1$. Hence the maximum test fails with probability at most $C m_t e^(- c D^(2 gamma))$.
  Set $U_j = \( 1 + A_j \)^3$. Every fixed moment of $U_j$ is bounded uniformly.
    In the expansion of the $2 k$th moment of $sum_j \( U_j - bb(E) U_j \)$,
    a nonzero term uses every index at least twice, by independence and centering.
    At most $k$ distinct indices can occur, so
  $ bb(E) lr(|frac(1, 2 m_t) sum_j \( U_j - bb(E) U_j \)|)^(2 k) lt.eq C_k m_t^(- k) . $
  Choose $C_(upright("reg"))$ larger than a fixed multiple of $1 + sup_j bb(E) U_j$.
    Since $m_t$ is comparable to $D^2$ for fixed $t$ and the fixed $alpha$-window,
    Markov’s inequality gives every prescribed inverse power of $D$ for the average test.
    The same argument applies to the average on either half separately, with the same threshold.
    For each endpoint window the maximal Gaussian estimate gives
  $ bb(P) { "diam" tilde(omega) \( \[ 0 \, h_0 \] \) > s_0 \/ 8 } lt.eq C exp \( - c s_0^2 \/ h_0 \) =
    C exp \( - c b^2 D^(1 \/ 3) \) \, $
  and reversal handles the other window.
  For a bridge leg, write its centered part as $B \( u \) - \( u \/ t \)
    B \( t \)$ and add the line joining its prescribed endpoints.
    On a mesh interval, the additional increment in units of $r$ is bounded by
    $C \( r \/ t \) \( \| B \( t \) \| + L \)$, where $L$ bounds endpoint displacement.
    On the event $\| B \( t \) \| lt.eq D^(1 \/ 12)$ this tends to zero,
    while the complementary probability is at most $C_t e^(- c_t D^(1 \/ 6))$.
    The maximum test follows by applying the Brownian bound with threshold $D^gamma \/ 2$.
    The inequality $\( x + y \)^3 lt.eq 4 x^3 + 4 y^3$, with a sufficiently large fixed choice of
    $C_(upright("reg"))$, transfers the average test as well.
    The additional displacement on an endpoint window is at most $C h_0 \( \| B \( t \) \| + L \) \/ t =
    o \( s_0 \)$ on the same event; use the Brownian window estimate with half the allowed threshold.
    Two independent legs require a union bound, and a duration-$2
    t$ bridge has the identical representation with $2 t$ in place of $t$.
  For the final assertion, each interpolating line remains in the radius-$3$ ball.
    Exiting the radius-$10$ ball requires a centered fluctuation of size at least seven on one leg.
    The Brownian representation and its maximal Gaussian bound give $C e^(- c \/ t)$. ◻
]

Write $C_v \( X \)$ for the close count from Proposition 13, namely

$ C_v \( X \) = \# { i : d \( X_i \, v \) lt.eq 5 \, med d_i \( X \) lt.eq s_0 } . $

A #emph[certificate at $v$] consists of the following conditions on the full path sample:

+ $n_v \( Y \) gt.eq ell D$ and $C_v \( Y \) \, C_v \( Z \) < theta D$;
+ at most $H_1 D$ paths visit the radius-$12$ ball about $v$, every visiting path is regular,
  and fewer than $theta D$ visiting paths have lifted diameter greater than one.

These are precisely the spatial and trajectory conditions needed for the deterministic bridge estimates.
  In particular, the certificate is an event of the full sample;
  it is not information on which we will condition the paths to be changed.

#thm([Proposition 5.4.])[
  (Joint certificate supply).  #emph[For each prescribed $p_1 > 0$, one can choose $H_1$ large,
    then $t > 0$ sufficiently small, and then $D_0$ sufficiently large, such that,
    for every set $A$ of distinct cell centers,
#[#set math.equation(numbering: n => "(5.6)")
 $ cal(R) { upright("no site of ") A upright(" has a certificate") } lt.eq p_1^(\| A \|) $ <eq:joint-certificates>]

 whenever $D gt.eq D_0$, $0 < T lt.eq D^(- 1)$, and $K$ is sufficiently large.
   The choices are uniform over the $alpha$-window. After $H_1$ is fixed,
   $t$ may be decreased further before increasing $D_0$.]
] <prop:certificates>

The endpoint parts already follow from Propositions 12 and 13.
  The issue is to control many path failures jointly under $cal(R)$.
  We establish that estimate next, and prove Proposition 17 at the end of the section.

=== 5.3 A localized kernel for one marked path <a-localized-kernel-for-one-marked-path>

For a nonempty set $A$ of sites let $J_A \( omega \)$ be the number of sites in $A$ whose radius-$12$ balls the
  path visits. Consider the following three single-path events:

$ E_(upright("all")) = { upright("all paths") } \, wide E_(upright("diam")) = { "diam" tilde(omega) > 1 } \, wide
  E_(upright("irr")) = { omega upright(" is not regular") } . $

For $E$ equal to one of these events and $lambda > 0$, we will bound

#[#set math.equation(numbering: n => "(5.7)")
 $ frak(M) & = bb(E)_(cal(R)) exp (lambda sum_(i = 1)^N J_A \( omega_i \) upright(bold(1))_E \( omega_i \))\
 & =
   bb(E)_(cal(R)) product_(i = 1)^N
   [1 + #scale(x: 120%, y: 120%)[\(] e^(lambda J_A \( omega_i \)) - 1 #scale(x: 120%, y: 120%)[\)]
   upright(bold(1))_E \( omega_i \)] . $ <eq:marked-moment-definition>]

Expanding this product selects subsets of marked labels, each carrying weight
  $\( e^(lambda J_A \( omega \)) - 1 \) upright(bold(1))_E \( omega \)$.
  We first bound the free-path kernel for one such marked label.

We partition paths by a nonnegative integer $n$. On the first half,
  mark the first exit from the unit ball about the starting point,
  then the first exit from the unit ball about that exit point, and continue up to time $t$.
  On the second half make the same construction backwards from the terminal point.
  Denote the total number of completed exits on the two halves by $n \( omega \)$,
  and write $n$ for its value on a fixed bin. Continuity and uniform continuity on the compact time interval make
  this number finite for each path. Between consecutive marks the lift lies in a unit ball. Thus on bin $n$,

#[#set math.equation(numbering: n => "(5.8)")
 $ J_A lt.eq C \( n + 1 \) \, wide \| tilde(omega) \( 2 t \) - tilde(omega) \( 0 \) \| lt.eq n +
   2 . $ <eq:bin-geometry>]

If $J_A > 0$, an endpoint is at lifted distance at most $n + 3$ from any visiting point:
  the first half’s endpoint-to-midpoint displacement is at most $n_1 + 1$,
  and the diameter of the other half is at most $n_2 + 2$. Thus both endpoints have torus distance at most $n +
  15$ from $A$. By Equation (5.8), the unit tube about the straight lifted endpoint segment projects into ${ x :
  d \( x \, A \) < 2 n + 18 }$, hence into ${ x : d \( x \, A \) < 32 \( n + 1 \) }$.

Set $O_n = { x : d \( x \, A \) < 32 \( n + 1 \) + 2 }$. Choose a Lipschitz cutoff $0 lt.eq p_n lt.eq
  1$ equal to one when $d \( x \, A \) lt.eq 32 \( n + 1 \)$ and zero when $d \( x \, A \) gt.eq 32 \( n + 1 \) +
  1$, with $\| nabla p_n \| lt.eq C$. Its support is compact in $O_n$.
  These definitions allow $O_n$ to be the whole torus. They satisfy

#[#set math.equation(numbering: n => "(5.9)")
 $ \| O_n \| lt.eq C \( n + 1 \)^3 \| A \| \, wide O_n upright(" is covered by at most ") C \( n + 1 \)^3 \| A \|
   upright(" unit cells") . $ <eq:bin-volume>]

Here $\| O_n \|$ is volume and $\| A \|$ is cardinality.

Let $cal(K)_n \( y \, z \)$ be the unnormalized free torus path kernel of duration $delta$ with the marking weight
  and the bin-$n$ restriction. Thus endpoint integration against $cal(K)_n$ is the free-path integral against that
  weight, without any hard-core restriction.

#thm([Lemma 5.5.])[
  (Marked-path kernel).  #emph[For a fixed numerical $c_1 > 1$, which can be taken to be $3$,
#[#set math.equation(numbering: n => "(5.10)")
 $ cal(K)_n \( y \, z \) lt.eq l_n p_n \( y \) p_n \( z \) \[ e^(c_1 delta Delta_(O_n)) \] \( y \, z \) \, wide
   l_n = C lambda \( n + 1 \) e^(C lambda \( n + 1 \)) e^(- c n^2 \/ t) epsilon^(1 \/ 3) \, $ <eq:marked-kernel>]

 where $Delta_(O_n)$ has Dirichlet boundary conditions, or periodic conditions if $O_n = Lambda_K$.
   The three choices of $E$ admit respectively
#[#set math.equation(numbering: n => "(5.11)")
 $ epsilon = 1 \, wide epsilon = C e^(- c \/ t) \, wide epsilon = C_t D^(- 12) . $ <eq:path-epsilon>]

 The constants for the first two choices are uniform for $0 < t lt.eq 1$;
   the irregularity constant may depend on the fixed $t$ and the previously chosen spatial parameters.]
] <lem:marked-kernel>

#proof[
  Fix a lift of $y$ and one lift of $z$. Omit the marking factor temporarily but retain $J_A > 0$, $E$,
    and bin $n$. The resulting Euclidean kernel is bounded by each of
  #[#set math.equation(numbering: n => "(5.12)")
   $ g_delta \( z - y \) \, wide C t^(- 3 \/ 2) e^(- c n^2 \/ t) \, wide C t^(- 3 \/ 2) epsilon \, quad
     g_s \( u \) = \( 4 pi s \)^(- 3 \/ 2) e^(- \| u \|^2 \/ \( 4 s \)) . $ <eq:three-kernel-bounds>]
  The first bound follows by discarding all tests. To prove the second,
    at least one half has at least $n \/ 2$ completed exits when $n gt.eq 1$.
    Bound the opposite half’s heat kernel by $C t^(- 3 \/ 2)$ and integrate the indicated half as ordinary
    Brownian motion; use reversal for the second half.
  For completeness, let $sigma$ be a Brownian exit time from the unit ball.
    The maximal Gaussian bound gives $bb(P) \( sigma lt.eq u \) lt.eq C e^(- c \/ u)$ for small $u$.
    Splitting the expectation at $u = s^(- 1 \/ 2)$ therefore gives $bb(E) e^(- s sigma) lt.eq
    e^(- c' sqrt(s))$ for sufficiently large $s$. Successive exit durations are independent copies of $sigma$,
    by the strong Markov property. If $Q_t$ is their number completed by $t$, then
  $ bb(P) \( Q_t gt.eq k \) lt.eq e^(s t) \( bb(E) e^(- s sigma) \)^k . $
  Taking $sqrt(s)$ a sufficiently small fixed multiple of $k \/ t$ proves $bb(P) \( Q_t gt.eq k \) lt.eq
    C e^(- c k^2 \/ t)$. When $k \/ t$ is bounded the same statement follows by increasing $C$; $n =
    0$ is covered directly by the heat kernel supremum. This proves the second bound in Equation (5.12).
  For the third bound, diameter greater than one forces one half to have diameter greater than $1 \/ 2$,
    since the two halves meet. Its Brownian probability is at most $C e^(- c \/ t)$.
    Irregularity forces a failure on at least one half: an endpoint window, the mesh maximum,
    or the half-average with threshold $C_(upright("reg"))$. The proof of Lemma 16 bounds each such half failure
    by $C_t D^(- 12)$. Once again the opposite half is bounded by its heat kernel supremum.
    This also proves the third bound for $E_(upright("all"))$ with $epsilon = 1$.
  Take the geometric mean of the three bounds. The surviving Gaussian is a constant multiple of
    $g_(3 delta) \( z - y \)$, and the other factors become $e^(- c n^2 \/ t)
    epsilon^(1 \/ 3)$ after changing $c \, C$. Equation (5.8) bounds the omitted mark by
  $ e^(lambda J_A) - 1 lt.eq C lambda \( n + 1 \) e^(C lambda \( n + 1 \)) . $
  For every lift with a nonzero contribution, its widened-time bridge has probability at least a fixed positive
    constant of staying in the unit tube about its interpolating segment.
    Indeed its centered bridge has duration $3 delta lt.eq 6$;
    Brownian scaling bounds this probability below by the positive small-ball probability at duration $6$.
    The projected tube is contained in $O_n$, so its paths contribute to the killed kernel on $O_n$.
    Summing these bounds over the endpoint lifts is legitimate:
    the lifts give disjoint winding classes in the torus bridge decomposition.
    The cutoffs equal one at every contributing endpoint. This yields Equation (5.10). ◻
]

The factor $epsilon^(1 \/ 3)$ records the rarity of the single-path failure.
  The confinement to $O_n$ will ensure that the interacting moment costs a multiple of $\| A \|$,
  even when the number of marked paths is unrestricted.

=== 5.4 Colors and the trace-sandwich estimate <colors-and-the-trace-sandwich-estimate>

Choose a constant $m_0$ sufficiently large, depending only on the upper increment constant in Proposition 7 and
  the fixed $alpha$-window. Define

#[#set math.equation(numbering: n => "(5.13)")
 $ M_n = \( m_0 + n \) \/ delta \, wide eta_n = l_n e^(m_0 + n) . $ <eq:color-gaps>]

We choose $m_0$ so that, for $delta lt.eq 2$,

#[#set math.equation(numbering: n => "(5.14)")
 $ M_n \/ 2 gt.eq C_(upright("inc")) alpha + 1 \, wide beta M_n \/ 2 gt.eq 1 \, $ <eq:gap-choice>]

where $C_(upright("inc")) alpha$ bounds an upper particle-number increment and $D gt.eq 1$.
  The choice of $m_0$ is independent of $t$.

First truncate the permitted marked bins at $n lt.eq n_(*)$, so that the moment in Equation (5.7) becomes

$ frak(M)_(n_(*)) =
  bb(E)_(cal(R)) product_(i = 1)^N
  [1 + #scale(x: 120%, y: 120%)[\(] e^(lambda J_A \( omega_i \)) - 1 #scale(x: 120%, y: 120%)[\)]
  upright(bold(1))_E \( omega_i \) upright(bold(1))_({ n \( omega_i \) lt.eq n_(*) })] . $

The enlarged one-particle space is

$ frak(h)_e = L^2 \( Lambda_K \) xor xor.big_(n = 0)^(n_(*)) L^2 \( O_n \) . $

Its first summand is called the original color, and the others are the marked colors.
  In each labelled color assignment of $N$ particles impose the hard exclusion only between original-color
  particles. The direct sum of these allowed labelled spaces is denoted by $cal(H)_e^(upright("lab"))$.
  On it let $bb(H)^(upright("lab"))$ be the operator with the original-color hard-core kinetic form,
  and with one-particle operator $- c_1 Delta_(O_n) + M_n$ on a particle of color $n$.
  There are no interactions involving a marked color. Simultaneous permutations of positions and colors commute
  with $bb(H)^(upright("lab"))$. Denote their invariant subspace by $cal(H)_e$,
  and denote the restriction of $bb(H)^(upright("lab"))$ to it by $bb(H)$.

On zero-extended original $N$-particle functions apply in each coordinate the map

$ v_e f = \( f \, \( sqrt(eta_n) p_n f \)_(0 lt.eq n lt.eq n_(*)) \) \, wide V_(upright("lab")) = v_e^(⊗ N) . $

Here $V_(upright("lab"))$ has domain $L^2 \( Omega_N \)$, the original labelled hard-core space,
  and takes values in $cal(H)_e^(upright("lab"))$. It maps form-domain functions to form-domain functions:
  the original hard-core zeros remain, the marked cutoffs are compactly supported in their $O_n$,
  and all multipliers are Lipschitz. Define first the labelled operator

$ cal(T)_(upright("lab")) = V_(upright("lab"))^(*) e^(- delta bb(H)^(upright("lab"))) V_(upright("lab")) . $

The map $V_(upright("lab"))$ intertwines coordinate permutations with simultaneous position-color permutations.
  Its restriction $V_e$ to the original symmetric space therefore takes values in $cal(H)_e$,
  and $cal(T)_(upright("lab"))$ commutes with the original symmetrizer $P_(upright("sym"))$.
  Its symmetric restriction is

$ cal(T) = cal(T)_(upright("lab")) \|_("ran" P_(upright("sym"))) = V_e^(*) e^(- delta bb(H)) V_e . $

Expanding the product defining the trajectory moment marks subsets of labels.
  For every marked subset, bin its paths and drop all collision prohibitions incident to them.
  The nonnegative path integral increases. Apply Lemma 18 to each marked path.
  Its coefficient is reproduced exactly by the color map, since $eta_n e^(- delta M_n) = l_n$.
  Each choice of marked labels and their bins appears once in the labelled color direct sum.
  Thus the tested labelled slab kernel is bounded pointwise by the kernel $K_(cal(T)_(upright("lab")))$ of
  $cal(T)_(upright("lab"))$, before any restriction to symmetric functions.

The outer kernel $B_(beta - delta)^(upright("sym"))$ is nonnegative.
  Let $H_N^(upright("lab"))$ denote the original labelled hard-core Hamiltonian.
  Integrating the pointwise bound against this outer kernel gives the symmetric trace by the following exact identity:

$ & integral B_(beta - delta)^(upright("sym")) \( Z \, Y \) K_(cal(T)_(upright("lab"))) \( Y \, Z \) thin thin
  upright(d) Y thin thin upright(d) Z\
 & wide =
   "Tr"_(upright("lab"))
   (e^(- \( beta - delta \) H_N^(upright("lab"))) P_(upright("sym")) cal(T)_(upright("lab"))) =
   "Tr"_(upright("sym")) (e^(- \( beta - delta \) H_N) cal(T)) . $

Indeed both labelled operators commute with $P_(upright("sym"))$;
  the product in the middle vanishes on its orthogonal complement and restricts to the final product on its range.
  The sole permutation normalization is the average $P_(upright("sym")) =
  N !^(- 1) sum_pi U_pi$ already present in the outer kernel.
  No factorial is inserted in the labelled color expansion or in this trace identity.
  Consequently the truncated moment satisfies

#[#set math.equation(numbering: n => "(5.15)")
 $ frak(M)_(n_(*)) lt.eq frac("Tr"_(upright("sym")) \( e^(- \( beta - delta \) H_N) cal(T) \), Z_N) lt.eq
   (frac("Tr"_(upright("sym")) cal(T)^(beta \/ delta), Z_N))^(delta \/ beta) . $ <eq:slab-holder>]

The second inequality is Schatten Hölder with exponents $beta \/ \( beta - delta \)$ and $beta \/ delta$.
  All operators have finite positive-time traces at the fixed finite volume and particle number.

To control the large power in Equation (5.15), we must account for the norm of the color map. Define

#[#set math.equation(numbering: n => "(5.16)")
 $ a \( x \) = 1 / 2 log (1 + sum_(n = 0)^(n_(*)) eta_n p_n \( x \)^2) \, wide A_0 =
   sum_(i = 1)^N a \( x_i \) . $ <eq:color-normalization>]

The same position multiplier acts in every color. The map $U_e = e^(- A_0) V_e$ is isometric,
  because the squared pointwise norm of its one-coordinate color vector is one. Therefore

$ cal(T) = U_e^(*) X_0 U_e \, wide X_0 = e^(A_0) e^(- delta bb(H)) e^(A_0) . $

Eigenvalue min–max for positive compact compressions gives $"Tr" cal(T)^q lt.eq "Tr" X_0^q$ for every $q > 0$.
  The next lemma converts this sandwich into a heat trace with a bounded attractive field.

#thm([Lemma 5.6.])[
  (Trace bound for a Lipschitz sandwich).  #emph[For the preceding finite-color space and operators, set
$ W_0 = 2 a \/ delta + c_1 \| nabla a \|^2 \, wide tilde(bb(H)) = bb(H) - sum_(i = 1)^N W_0 \( x_i \) . $

 For every real $q > 0$,
#[#set math.equation(numbering: n => "(5.17)")
 $ "Tr"_(cal(H)_e) X_0^q lt.eq "Tr"_(cal(H)_e) e^(- q delta tilde(bb(H))) . $ <eq:all-q-sandwich>]

]
] <lem:sandwich>

#proof[
  This is the sandwich estimate of #cite(label("B"), form: "prose") Lemma “Trace bound for a Lipschitz sandwich”,
    with the hard-core Dirichlet conditions retained. We give the form argument,
    including the step that permits every positive power.
  There are finitely many color assignments. In each, Dirichlet domain monotonicity bounds the heat trace by a
    free periodic or Dirichlet product heat trace. Hence $bb(H)$ has compact resolvent and finite heat traces at
    positive times. Subtracting the bounded potential $sum_i W_0 \( x_i \)$ preserves these properties.
    The operator $X_0$ is positive, compact, and injective.
  For $0 lt.eq s lt.eq delta$ define
  $ U \( s \) = e^(u \( s \) A_0) e^(- s bb(H)) e^(A_0) \, wide u \( s \) = - 1 + 2 s \/ delta . $
  Thus $U \( 0 \) = I$ and $U \( delta \) = X_0$. Bounded Lipschitz multiplication preserves each form domain,
    including its original-color collision boundary and marked-color spatial boundary.
    This follows by applying the product rule to compactly supported approximants and taking their form-norm
    limits. For an initial vector $f_0$ and $s > 0$, spectral calculus puts $e^(- s bb(H)) e^(A_0)
    f_0$ in the operator domain. The vector $f = U \( s \) f_0$ is norm differentiable and in the form domain.
    If $frak(q)$ is the form of $bb(H)$, then
  #[#set math.equation(numbering: n => "(5.18)")
   $ 1 / 2 frac(thin upright(d), thin upright(d) s) parallel f parallel^2 = 2 / delta chevron.l f \,
     A_0 f chevron.r - "Re" frak(q) \( e^(u \( s \) A_0) f \, e^(- u \( s \) A_0) f \) . $ <eq:sandwich-derivative>]
  This identity only pairs a form-domain vector with the operator-domain semigroup vector;
    it does not require Lipschitz multiplication to preserve the operator domain.
  In any color assignment, the kinetic coefficient $c_i$ of coordinate $i$ is $1$ or $c_1$.
    The product rule gives, almost everywhere,
  $ "Re" [overline(nabla_i \( e^(u A_0) f \)) dot.op nabla_i \( e^(- u A_0) f \)] = \| nabla_i f \|^2 -
    u^2 \| nabla a \( x_i \) \|^2 \| f \|^2 . $
  The cross terms have zero real part and the gap potentials commute with the multipliers.
    Since $\| u \| lt.eq 1$ and $c_i lt.eq c_1$, Equation (5.18) implies
  #[#set math.equation(numbering: n => "(5.19)")
   $ 1 / 2 frac(thin upright(d), thin upright(d) s) parallel U \( s \) f_0 parallel^2 lt.eq -
     tilde(frak(q)) \[ U \( s \) f_0 \] \, $ <eq:sandwich-form>]
  where $tilde(frak(q))$ is the form of $tilde(bb(H))$.
  Let $tilde(E)_1 lt.eq tilde(E)_2 lt.eq dots.h.c$ be the eigenvalues of $tilde(bb(H))$ with multiplicity.
    Apply the same form calculation to $U \( s \)^(⊗ k)$, using the sums of $A_0$ and $bb(H)$ over $k$ copies of
    $cal(H)_e$. Restrict these copies to their alternating subspace.
    In an eigenbasis of $tilde(bb(H))$, the copy-sum Hamiltonian on that subspace has lower bound $sum_(i = 1)^k
    tilde(E)_i$. The copies here are copies of the entire enlarged symmetric $N$-particle space;
    the particle symmetry within each copy is unchanged. Equation (5.19) consequently gives
  $ parallel and.big^k U \( delta \) parallel lt.eq exp (- delta sum_(i = 1)^k tilde(E)_i) . $
  To justify integration at zero, integrate first from $s = epsilon.alt > 0$ and then let $epsilon.alt arrow.b 0$,
    using strong continuity and $U \( 0 \) = I$. The tensor form calculation is first valid on finite tensor sums
    and extends by the closed forms and density.
  Write the decreasing eigenvalues of $X_0$ as $x_i > 0$. The norm of its $k$th exterior power is the product of
    its largest $k$ eigenvalues. Hence
  $ sum_(i = 1)^k log x_i lt.eq - delta sum_(i = 1)^k tilde(E)_i wide \( k gt.eq 1 \) . $
  For each real $h$, taking the supremum over $k gt.eq 0$ of the shifted partial sums proves
  $ sum_i \( log x_i - h \)_(+) lt.eq sum_i \( - delta tilde(E)_i - h \)_(+) . $
  Both sums have finitely many positive terms for fixed $h$, by compactness. For every $q > 0$,
  $ e^(q u) = integral_(bb(R)) q^2 e^(q h) \( u - h \)_(+) thin thin upright(d) h . $
  Integrate the preceding positive-part inequality and apply Tonelli’s theorem.
    It gives $sum_i x_i^q lt.eq sum_i e^(- q delta tilde(E)_i)$, which is Equation (5.17). ◻
]

=== 5.5 The interacting trajectory moment <the-interacting-trajectory-moment>

The remaining task is to compare the enlarged heat trace with $Z_N$.
  The original color will be estimated by the field-density bound;
  the positive gaps will pay for the other colors. Spatial confinement in Equation (5.9) keeps both costs
  proportional to the number of tested sites.

#thm([Proposition 5.7.])[
  (Joint trajectory moment).  #emph[Use any of the three events $E$ and the coefficients $l_n \, eta_n \,
    M_n$ from Equations (5.10) and (5.13). For a sufficiently large fixed constant $C_0$, assume
#[#set math.equation(numbering: n => "(5.20)")
 $ C_0 / delta sum_(n gt.eq 0) eta_n lt.eq 1 . $ <eq:color-smallness>]

 Then for every nonempty set $A$ of sites,
#[#set math.equation(numbering: n => "(5.21)")
 $ & log bb(E)_(cal(R)) exp (lambda sum_(i = 1)^N J_A \( omega_i \) upright(bold(1))_E \( omega_i \))\
 & quad lt.eq C D \| A \| sum_(n gt.eq 0) \( n + 1 \)^3 eta_n +
   C delta T \| A \| \( V^(- 1) + T^(3 \/ 2) \) sum_(n gt.eq 0) \( n + 1 \)^3 e^(- beta M_n \/ 2) .
   $ <eq:trajectory-moment>]

 All constants are independent of $n_(*) \, K \, D \, T$ and $0 < t lt.eq 1$,
   with the stated $t$-dependence retained in $epsilon$ for irregularity.]
] <prop:trajectory-moment>

#proof[
  For the truncated normalization in Equation (5.16), write $S \( x \) = sum_(n lt.eq n_(*)) eta_n p_n \( x \)^2$.
    Cauchy–Schwarz gives
  $ \| nabla a \|^2 lt.eq frac(S, \( 1 + S \)^2) sum_(n lt.eq n_(*)) eta_n \| nabla p_n \|^2 lt.eq
    C sum_(n lt.eq n_(*)) eta_n upright(bold(1))_(O_n) . $
  Also $2 a lt.eq S$. Since $delta lt.eq 2$,
  #[#set math.equation(numbering: n => "(5.22)")
   $ 0 lt.eq W_0 lt.eq C / delta sum_(n lt.eq n_(*)) eta_n upright(bold(1))_(O_n) lt.eq 1 \, $ <eq:color-field-bound>]
  where the last inequality follows from Equation (5.20).
  For every $0 lt.eq J lt.eq N$, differentiation with respect to a bounded field strength gives
  $ frac(thin upright(d), thin upright(d) u) log Z_J^(\( - u W_0 \)) =
    beta bb(E)_(J \, - u W_0) sum_(i = 1)^J W_0 \( x_i \) wide \( 0 lt.eq u lt.eq 1 \) . $
  At finite volume this identity follows from the Duhamel formula and trace cyclicity.
    The field is bounded and the positive-time traces are finite.
    Apply Corollary 11 to the cell covers in Equation (5.9), and then integrate in $u$. It follows that
  #[#set math.equation(numbering: n => "(5.23)")
   $ log Z_J^(\( - W_0 \)) / Z_J lt.eq frac(beta C, delta) D \| A \| sum_(n lt.eq n_(*)) \( n + 1 \)^3 eta_n .
     $ <eq:original-color-field>]
  The vacuum case has zero left side. In addition, Proposition 7 gives
  #[#set math.equation(numbering: n => "(5.24)")
   $ Z_J / Z_N lt.eq e^(beta C_(upright("inc")) alpha \( N - J \)) . $ <eq:color-removal-cost>]
  Evaluate Lemma 19 at $q = beta \/ delta$. The enlarged symmetric space decomposes by the number $J$ of
    original-color particles and the occupation numbers $k_n$ of each marked color, with $J + sum_n k_n = N$.
    Each sector is one normalized tensor product of the symmetric species spaces.
    There is no multinomial multiplicity: symmetrizing the mutually orthogonal assignments of colors gives an
    isometry from this tensor product onto the sector. Its original factor has trace $Z_J^(\( - W_0 \))$;
    the marked factors are ideal Bose canonical traces on $O_n$.
  Use Equations (5.23) and (5.24). Absorbing the latter factor into the marked energies subtracts
    $C_(upright("inc")) alpha$ per marked particle. With $W_0 lt.eq 1$ and Equation (5.14),
    each such one-particle operator is bounded below in form by $- c_1 Delta_(O_n) + M_n \/ 2$.
    The variational eigenvalue principle therefore bounds every fixed marked canonical trace by that operator’s
    trace. We may then drop the restriction $sum_n k_n lt.eq N$ and sum the independent marked occupations.
    The original count is determined by those occupations before this restriction is dropped,
    so no extra sum over $J$ is introduced.
  The logarithm of the ideal grand trace for color $n$ is
  $ sum_(a gt.eq 1) e^(- a beta M_n \/ 2) / a "Tr" e^(a beta c_1 Delta_(O_n)) lt.eq
    C \| O_n \| \( V^(- 1) + T^(3 \/ 2) \) e^(- beta M_n \/ 2) . $
  Here the periodic Gaussian sum and killing give $"Tr" e^(s c_1 Delta_(O_n)) lt.eq
    C \| O_n \| \( V^(- 1) + s^(- 3 \/ 2) \)$, and $beta M_n \/ 2 gt.eq 1$ controls the sum in $a$.
    Combining this with the two preceding comparisons proves
  $ log frac("Tr" e^(- beta tilde(bb(H))), Z_N) & lt.eq frac(beta C, delta) D \| A \|
    sum_(n lt.eq n_(*)) \( n + 1 \)^3 eta_n\
 & quad + C \| A \| \( V^(- 1) + T^(3 \/ 2) \) sum_(n lt.eq n_(*)) \( n + 1 \)^3 e^(- beta M_n \/ 2) . $
  Multiply by $delta \/ beta = delta T$ and use Equation (5.15), the compression inequality, and Lemma 19.
    This proves Equation (5.21) for the truncated product.
  For each path the truncated marking weight increases to the full marking weight as $n_(*) arrow.r oo$.
    The finite product over labels also increases. Monotone convergence removes the truncation,
    while the displayed bounds on the right are uniform in $n_(*)$ and summable. This proves the proposition. ◻
]

=== 5.6 Completion of the certificate estimate <completion-of-the-certificate-estimate>

We first record the sizes of the two costs in Equation (5.21). The Gaussian bin tail in Equation (5.10) implies

#[#set math.equation(numbering: n => "(5.25)")
 $ sum_(n gt.eq 0) \( n + 1 \)^3 eta_n lt.eq C_lambda lambda epsilon^(1 \/ 3) \, $ <eq:eta-sum>]

where $C_lambda$ is bounded on bounded $lambda$-intervals, uniformly for $0 < t lt.eq 1$.
  Indeed the summand is bounded by a constant times $lambda epsilon^(1 \/ 3) \( n + 1 \)^4
  e^(C lambda \( n + 1 \) + n - c n^2)$, including the fixed factor $e^(m_0)$.
  The same estimate without $\( n + 1 \)^3$ controls the smallness condition.
  Since $beta gt.eq D$ and $delta lt.eq 2$, the second term of Equation (5.21) is $o \( 1 \) \| A \|$ as $D
  arrow.r oo$, uniformly in $0 < t lt.eq 1$ and $K gt.eq 100$.

#proof[
  It suffices to prove arbitrarily small exponential bases for simultaneous failures of each of the six individual
    tests. At both endpoints the law is $mu$, by Proposition 14.
    Thus the low-count test at $Y$ and the close-count tests at $Y \, Z$ have this property by Propositions 12 and 13.
  For the number of visitors choose $E = E_(upright("all"))$ and $lambda = c' t$,
    where $c' > 0$ is sufficiently small and fixed. Equation (5.25) makes Equation (5.20) hold uniformly for $0 <
    t lt.eq 1$, and the moment’s first coefficient is at most $C lambda D$ with $C$ independent of $t$.
    If every site of $A$ has more than $H_1 D$ visitors, then $sum_i J_A \( omega_i \) > H_1 D \| A \|$.
    Exponential Markov inequality yields
  $ cal(R) \( upright("this event") \) lt.eq exp { \[ - lambda \( H_1 - C \) D + o \( 1 \) \] \| A \| } . $
  Choose $H_1 > C + 1$ now. For every subsequently fixed $t > 0$,
    the exponential base tends to zero as $D$ increases. This choice of $H_1$ is unaffected by reducing $t$.
  For large-diameter visitors take $lambda = 1$ and $E = E_(upright("diam"))$.
    Now $epsilon^(1 \/ 3) lt.eq C e^(- c \/ t)$. Choose $t$ sufficiently small that both Equation (5.20) and the
    bound $C D sum_n \( n + 1 \)^3 eta_n lt.eq theta D \/ 2$ hold.
    If every site of $A$ has at least $theta D$ such visitors,
    their total number of visits to the tested balls is at least $theta D \| A \|$.
    Equation (5.21) therefore bounds this probability by $exp \[ - \( theta D \/ 2 - o \( 1 \) \) \| A \| \]$.
  Finally fix a large $lambda > 0$ and take $E = E_(upright("irr"))$.
    With $t$ now fixed, Equation (5.25) gives $sum_n \( n + 1 \)^3 eta_n = O_(lambda \, t) \( D^(- 4) \)$.
    The smallness condition holds for large $D$, and the whole coefficient per site in the moment tends to zero.
    If each tested site has even one irregular visitor, the sum of its irregular visits is at least $\| A \|$,
    counting a path once for every tested ball it visits. Its probability is consequently at most
    $exp \[ - \( lambda - o \( 1 \) \) \| A \| \]$. Choosing $lambda$ large and then $D$ large makes this base as
    small as prescribed.
  For clarity, no independence between tests or between cells is needed to combine them.
    Given a failure at every site, assign one of the six failure types to each site.
    There are at most $6^(\| A \|)$ assignments. In each, some type occurs on a prescribed subset of size at least
    $\| A \| \/ 6$. If every simultaneous single-type failure has probability at most $\( p' \)^(\| A' \|)$,
    with $0 < p' < 1$, the union is bounded by $\( 6 \( p' \)^(1 \/ 6) \)^(\| A \|)$.
    Take $p'$ so small that $6 \( p' \)^(1 \/ 6) lt.eq p_1$. The preceding choices and a final increase of $D_0$
    ensure all six estimates. The empty set satisfies Equation (5.6) trivially.
    All arguments survive a further reduction of the fixed $t$, followed by the corresponding increase of $D_0$. ◻
]

We have obtained an unconditional joint bound for failure of the full-path certificates,
  with no loss proportional to the total volume. The next two sections use these certificates to find movable
  paths and then expose their environment while preserving an exact conditional bridge law.

== 6 Moving a path through a neighboring cell <sec:bridges>

The certificates from Section 5 control how many paths can obstruct a local move.
  We now show that most particles in a certified cell admit many replacements through each neighboring cell.
  The argument is deterministic in the obstacles and their endpoints;
  the thermal law enters only through the certificate supply.

We reproduce the bridge estimates of #cite(label("HS"), form: "prose") Section 5.
  They separate two different averaging operations. Averaging over many separated endpoint pairs controls
  collisions against order $D$ obstacles. For one endpoint pair,
  averaging over the proposed midpoint makes the collision probability against a single regular obstacle tend to
  zero. The distinction will matter when two replacement paths share a midpoint.

We use the regularity conditions of Definition 15. Thus $r = alpha \/ D$, $s_0 = b D^(- 1 \/ 3)$, $h_0 = D^(- 1)$,
  and $gamma = 1 \/ 12$. Each half of $\[ 0 \, 2 t \]$ has $m_t =
  ceil.l t \/ r^2 ceil.r$ mesh intervals of length $tau = t \/ m_t$.
  For a regular path $c$, its lifted diameter on interval $k$ is $r A_k \( c \)$, where

#[#set math.equation(numbering: n => "(6.1)")
 $ max_k A_k \( c \) lt.eq D^gamma \, wide sum_(k = 1)^(2 m_t) \( 1 + A_k \( c \) \)^3 lt.eq
   2 C_(upright("reg")) m_t . $ <bridge:oscillations>]

Its diameter in each outer time window of length $h_0$ is at most $s_0 \/ 8$.
  All estimates below hold for each fixed $0 < t lt.eq 1$ and sufficiently large $D$,
  uniformly in $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$. In particular, we may require

#[#set math.equation(numbering: n => "(6.2)")
 $ r^2 \/ 2 lt.eq tau lt.eq h_0 \/ 2 \, wide h_0 < t \/ 4 \, wide r D^gamma < 1 \, wide C tau \/ t lt.eq
   r $ <bridge:scale-restrictions>]

for any fixed geometric constant $C$ used below, and also $r < 3 s_0 \/ 4$.

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

=== 6.1 Separated endpoints and Gaussian densities <separated-endpoints-and-gaussian-densities>

#thm([Lemma 6.1.])[
  (Averaged Gaussian density).  #emph[Let $y_1 \, dots.h \,
    y_m in bb(R)^3$ have pairwise distances at least $s_0$, where $m gt.eq ell D \/ 2$ and $s_0 = b D^(- 1 \/ 3)$.
    Fix $u in bb(R)^3$ and $0 < s lt.eq t \/ 2$. The average of the time-$s$ densities of duration-$t$ Brownian
    bridges from $y_i$ to $u$ is bounded everywhere by
#[#set math.equation(numbering: n => "(6.3)")
 $ C (1 + frac(1, D s^(3 \/ 2))) . $ <bridge:packed-density>]

 Here $C$ depends on $b \, ell$, but not on $t \, s \, D$ or $u$.]
] <lem:gaussian-packing>

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

=== 6.2 Collision with a deterministic obstacle <collision-with-a-deterministic-obstacle>

#thm([Lemma 6.2.])[
  (Averaged collision bound).  #emph[Fix $m gt.eq ell D \/ 2$ pairs $\( y_i \, z_i \)$ with $y_i in B_v$ and $\|
    z_i - v \| lt.eq 3$. Assume that each of the two endpoint lists is $s_0$-separated.
    Let $c$ be a deterministic regular torus path whose outer endpoints are at distance greater than $s_0$ from
    the corresponding endpoints of every label under consideration. Then, for every target cell $B$,
#[#set math.equation(numbering: n => "(6.4)")
 $ 1 / m sum_(i = 1)^m Q_(y_i \, z_i)^B \( cal(C)_v ∩ cal(H) \( c \) \) lt.eq C t r +
   C frac(r D^(3 gamma), D sqrt(h_0)) . $ <bridge:averaged-estimate>]

 The same conclusion holds if $c$ is the original path of one of these labels:
   omit that label’s summand and retain the divisor $m$, assuming endpoint separation for all the remaining
   labels. The constant $C$ may depend on $b \, ell \, C_(upright("reg"))$, but is independent of small $t$.]
] <lem:averaged-hit>

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
  ===== 6.2.1 The first half of a leg. <the-first-half-of-a-leg.>
  Suppose $s lt.eq t \/ 2$ and condition on $u$. If $X_s$ is the position of the trial bridge at time $s$,
    its segment of length $tau$ has the representation
  #[#set math.equation(numbering: n => "(6.5)")
   $ X_(s + q) = X_s + frac(q, t - s) \( u - X_s \) + R_q \, wide 0 lt.eq q lt.eq tau . $ <bridge:markov-segment>]
  Here $R$ is the initial segment of a centered bridge of duration $t - s$, independent of $X_s$.
    Its law does not depend on $u$ or on the endpoint label. This is the Gaussian conditional law of a bridge
    after its time-$s$ position has been specified. Equivalently, $R_q = W_q -
    q W_(t - s) \/ \( t - s \)$ for a Brownian motion $W$ of generator $Delta$.
    Gaussian maximal estimates, or the Brownian reflection bound integrated against $3 a^2 thin upright(d) a$, give
  #[#set math.equation(numbering: n => "(6.6)")
   $ B_s = 1 / r sup_(0 lt.eq q lt.eq tau) \| R_q \| \, wide bb(E) B_s^3 lt.eq C \, $ <bridge:noise-moment>]
  because $tau lt.eq r^2$ and $tau lt.eq t - s$.
  On the cutoff event, $\| X_s - v \| lt.eq 10$, whereas every target point is within distance $2$ of $v$.
    The drift term in (6.5) is thus at most $C tau \/ t lt.eq r$.
    A collision on this interval, together with the cutoff, implies
  #[#set math.equation(numbering: n => "(6.7)")
   $ \| X_s - tilde(c) \( s \) \| lt.eq r #scale(x: 120%, y: 120%)[\(] 2 + A_k \( c \) +
     B_s #scale(x: 120%, y: 120%)[\)] . $ <bridge:necessary-ball>]
  We use the cutoff only to obtain this necessary event. We now discard it and integrate the unrestricted bridge
    law. By Lemma 21, the density of $X_s$, averaged over the labels, is bounded by (6.3).
    Since $B_s$ is independent of $X_s$ and has the common bound (6.6), the averaged probability of (6.7) is at most
  #[#set math.equation(numbering: n => "(6.8)")
   $ C r^3 \( 1 + A_k \( c \) \)^3 (1 + frac(1, D s^(3 \/ 2))) . $ <bridge:early-step>]
  This estimate holds for each $u$, hence also after averaging $u$ over the target cell.
    Omitting one label only decreases the unnormalized Gaussian sum and leaves the same bound with divisor $m$.
  ===== 6.2.2 The second half of a leg. <the-second-half-of-a-leg.>
  Suppose $s > t \/ 2$. For a fixed label, write the whole unrestricted leg as
  $ X_q = \( 1 - q \/ t \) y_i + \( q \/ t \) U + beta_q \, wide 0 lt.eq q lt.eq t \, $
  where $U$ is uniform in $B$ and the centered bridge $beta$ is independent of $U$.
    Condition on the entire path $beta$. The conditional density of $X_s$ is at most $\( t \/ s \)^3 lt.eq 8$.
    The mean displacement during the mesh interval is at most $C tau \/ t lt.eq r$, uniformly in $U in B$. Put
  $ tilde(B)_s = r^(- 1) sup_(0 lt.eq q lt.eq tau) \| beta_(s + q) - beta_s \| . $
  Writing $beta_q = W_q - q W_t \/ t$ gives $bb(E) tilde(B)_s^3 lt.eq C$:
    the Brownian increment contributes $C tau^(3 \/ 2) \/ r^3$,
    and the linear correction contributes $C tau^3 \/ \( r^3 t^(3 \/ 2) \)$, both bounded.
    Conditional on $beta$, a collision requires the ball in (6.7), with $B_s$ replaced by $tilde(B)_s$.
    Both its radius and center are then fixed while $U$ retains its uniform distribution.
    Integrating first over $U$ and then over $beta$ bounds the probability by
  #[#set math.equation(numbering: n => "(6.9)")
   $ C r^3 \( 1 + A_k \( c \) \)^3 . $ <bridge:late-step>]
  In particular, no independence between $X_s$ and the fluctuation increment is needed here.
  ===== 6.2.3 Summing the intervals. <summing-the-intervals.>
  Apply the two bounds to both legs. The terms without $s^(- 3 \/ 2) \/ D$ use the averaged regularity condition:
  $ C r^3 sum_(k = 1)^(2 m_t) \( 1 + A_k \( c \) \)^3 lt.eq C r^3 m_t lt.eq C t r . $
  Here $m_t = t \/ tau$ and $tau gt.eq r^2 \/ 2$. For the remaining terms use $\( 1 + A_k \( c \) \)^3 lt.eq
    C D^(3 gamma)$ and
  $ sum_(s = j tau gt.eq h_0 \/ 2\
s lt.eq t \/ 2) s^(- 3 \/ 2) lt.eq frac(C, tau sqrt(h_0)) lt.eq frac(C, r^2 sqrt(h_0)) . $
  Their contribution is therefore at most $C r^3 D^(3 gamma) \/ \( D r^2 sqrt(h_0) \) =
    C r D^(3 gamma) \/ \( D sqrt(h_0) \)$. These two sums give (6.4).
    Every constant in these sums is independent of $t$; making $t$ smaller only increases the required lower
    threshold on $D$ in (6.2). ◻
]

#thm([Lemma 6.3.])[
  (A single replacement).  #emph[Let $y in B_v$, $\| z - v \| lt.eq 3$,
    and let $c$ be a deterministic regular path satisfying $d \( y \, c \( 0 \) \) >
    s_0$ and $d \( z \, c \( 2 t \) \) > s_0$. For either $Q = Q_(y \, z)^B$, with any target cell $B$, or $Q =
    Q_(y \, z)^0$, one has
#[#set math.equation(numbering: n => "(6.10)")
 $ Q \( cal(C)_v ∩ cal(H) \( c \) \) lt.eq C t r + C frac(r D^(3 gamma), sqrt(h_0)) lt.eq
   C alpha #scale(x: 120%, y: 120%)[\(] t D^(- 1) + D^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\)] .
   $ <bridge:single-estimate>]

 Thus this probability tends to zero with $D$ for each fixed $t$.]
] <lem:single-hit>

#proof[
  For $Q_(y \, z)^B$, repeat the preceding proof with one endpoint.
    At $s lt.eq t \/ 2$ its Gaussian density is at most $C s^(- 3 \/ 2)$;
    the bound (6.8) becomes $C r^3 \( 1 + A_k \( c \) \)^3 s^(- 3 \/ 2)$.
    The second half of each leg retains (6.9). The same two sums give the first inequality.
  For $Q_(y \, z)^0$, use the forward orientation up to time $t$ and the reversed orientation for the rest.
    In either orientation the remaining bridge duration is at least $t$.
    Formula (6.5) holds with $2 t$ in place of $t$, its drift on the cutoff event is at most $C tau \/ t$,
    and its time-$s$ density is bounded by $C s^(- 3 \/ 2)$ for $0 < s lt.eq t$.
    Endpoint separation again excludes the window $\[ 0 \, h_0 \]$.
    Consequently the first-half argument and its mesh sum apply over both orientations,
    giving $C r D^(3 gamma) \/ sqrt(h_0)$. Adding the nonnegative term $C t r$ yields the stated common bound.
    Finally $r = alpha \/ D$, $h_0 = D^(- 1)$ and $3 gamma = 1 \/ 4$ give the last inequality. ◻
]

#prodef([Remark 6.4.])[
  The midpoint in $Q_(y \, z)^B$ is averaged over a unit cell.
    An estimate uniform in a prescribed midpoint is false: if $u = c \( t \)$, the trial collides at time $t$.
    Restricting a uniform midpoint to a measurable set of volume at least $a >
    0$ multiplies an upper bound for a nonnegative event by at most $a^(- 1)$.
    Conditioning a trial on an event of probability at least $a$ has the same cost.
    These elementary changes of measure will allow us to use Lemma 23 after choosing successful trials.
] <bridge:midpoint-quantifier>

=== 6.3 Many paths can be moved successfully <many-paths-can-be-moved-successfully>

The averaged estimate now pays for all nearby obstacles. The following statement separates that deterministic
  estimate from the random cell certificates that will supply its hypotheses.

#thm([Corollary 6.5.])[
  (Supply of successful labels).  #emph[Consider a collection of deterministic torus paths with endpoints
    $\( y_j \, z_j \)$, and fix a cell $v$. Suppose that at most $H_1
    D$ of these paths visit the ball of radius $12$ about $v$, and that every visiting path is regular.
    Suppose a list of $m gt.eq ell D \/ 2$ labels satisfies $y_i in B_v$, $\| z_i - v \| lt.eq 3$,
    and that both endpoints of every listed label are at distance greater than $s_0$ from every other endpoint in
    the corresponding full configuration.]
  #emph[Call a trial for label $i$ successful if it satisfies $cal(C)_v$ and avoids every obstacle path except the
    original path of $i$. For sufficiently small fixed $t > 0$ and then sufficiently large $D$,
    at least $9 m \/ 10$ listed labels have the following property: for each of the seven target cells $B$, the set
#[#set math.equation(numbering: n => "(6.11)")
 $ T_(i \, B) = { u in B : Q_(y_i \, z_i)^u \( upright("successful trial") \) gt.eq
   9 \/ 10 } $ <bridge:successful-target-set>]

 has volume at least $99 \/ 100$. All choices are uniform in the deterministic collection, $v$,
   and $alpha in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$.]
] <cor:success-supply>

#proof[
  The linear means of both bridge legs stay within distance $3$ of $v$.
    The Gaussian maximal bound therefore makes confinement failure at most $C e^(- c \/ t)$.
    Lemma 16 gives a regularity failure probability $epsilon_D \( t \) arrow.r 0$,
    uniformly over the listed endpoints and the target points.
    A confined trial can collide only with an obstacle visiting the ball of radius $12$, since $r < 1$.
    Union-bounding over those obstacles and using Lemma 22, with a self-label summand omitted when necessary,
    gives for each target cell
  #[#set math.equation(numbering: n => "(6.12)")
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

== 7 Exposing the environment and retaining movable groups <sec:groups>

We now retain a small group of particles at each cell and fix the rest of the path configuration.
  For the retained paths we need two facts: most cells contain many labels that can be moved,
  and their exact conditional law is a product of one-path laws conditioned on mutual avoidance.
  The first assertion is averaged over the environment; the second holds at almost every fixed environment.

The selection and exposure argument is that of #cite(label("HS"), form: "prose") Section 6.
  Here the exposed environment also contains $W'$, the additional configuration in the thermal purification.
  Its weight depends only on the outer endpoints, so the conditional bridge argument remains valid.

=== 7.1 Eligible labels and their local trial laws <eligible-labels-and-their-local-trial-laws>

The endpoints $Y \, Z$ and path regularity are those of Section 5. A label $i$ is #emph[eligible at $v$] if

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

#[#set math.equation(numbering: n => "(7.1)")
 $ C_i \( F \) = { & upright("the trial is regular and stays within distance ") 10 upright(" of ") v upright(";")\
 & upright("it avoids every path in ") F upright(" at distance ") r } . $ <group:success-event>]

Avoidance throughout means strict distance greater than $r$ at every time. The endpoints are fixed in this notation.

#thm([Lemma 7.1.])[
  (Useful labels in a certified cell).  #emph[At a cell with a certificate there are at least $ell D \/
    2$ eligible labels. After $t$ has been chosen sufficiently small and $D$ sufficiently large,
    at least nine tenths of these labels satisfy the following stronger property: for every target cell $B_w$,
#[#set math.equation(numbering: n => "(7.2)")
 $ lr(|{u in B_w : Q_i^u \( C_i \( F_i^(upright("all")) \) \) gt.eq 0.9}|) gt.eq 0.99 . $ <group:full-success>]

 Here $F_i^(upright("all"))$ consists of all other trajectories in the sampled configuration,
   and $\| dot.op \|$ denotes spatial volume.]
] <lem:useful-labels>

#proof[
  Start with the at least $ell D$ labels having $Y_i in B_v$.
    Every such path visits the radius-$12$ ball and is therefore regular.
    Discard the fewer than $theta D$ visiting paths of diameter greater than one.
    The remaining paths stay within distance $2$ of $v$ and end within distance $2$ of $v$.
    Discard also those whose initial or terminal endpoint has another endpoint within distance $s_0$.
    The certificate bounds these two losses by $theta D$ each,
    since the endpoints in question lie in the radius-$5$ ball about $v$.
    The remaining labels are eligible, and their number is at least $\( ell - 3 theta \) D gt.eq ell D \/ 2$.
  We now apply Corollary 25 to the #emph[entire] eligible list at this site,
    not merely the subset just used to prove its lower cardinality bound.
    Every eligible label has its initial endpoint in $B_v$, terminal endpoint within distance three of $v$,
    and both endpoints separated from all corresponding endpoints of other labels by more than $s_0$.
    The certificate supplies at most $H_1 D$ visiting obstacles, all regular.
    These are precisely the hypotheses of that corollary. It gives Equation (7.2) for at least nine tenths of the
    entire eligible list, with choices uniform in the certificate. ◻
]

=== 7.2 Disjoint groups and the information retained <disjoint-groups-and-the-information-retained>

Choose an integer $M gt.eq 1$, to be fixed after the one-path comparison constant below, and put

#[#set math.equation(numbering: n => "(7.3)")
 $ G_D = ⌊frac(ell D, 4 M)⌋ . $ <group:number>]

We take $D$ large enough that $G_D gt.eq 1$. At a site with at least $M G_D$ eligible labels,
  choose an ordered list of $M G_D$ distinct eligible labels uniformly without replacement,
  and divide it into $G_D$ successive groups of size $M$. If there are fewer, all groups at that site are empty.
  The allocation randomizations are independent between sites conditional on the full path sample,
  and use the eligible lists only.

Fix one group index $g in { 1 \, dots.h \, G_D }$. Let $cal(I)$ be the union of its labels over all sites.
  The #emph[exposed datum] $cal(B)$ comprises

- both endpoint configurations, $W'$, every eligibility indicator, and all allocation information;
- the complete trajectories of labels outside $cal(I)$.

These last trajectories form the frozen family $F$. The law of $cal(B)$ is the pushforward of the thermal slab law
  $cal(R)$ and the allocation randomizations. No certificate event is included in this datum.
  Subsequent expectations over $cal(B)$ always use this unconditional law.

For $i in cal(I)$ at site $v$, let $B_i$ be the unconditioned Euclidean bridge law of duration $2
  t$ between its near endpoint lifts. Define

#[#set math.equation(numbering: n => "(7.4)")
 $ P_i \( thin upright(d) omega_i \) =
   frac(upright(bold(1))_(C_i \( F \)) thin B_i \( thin upright(d) omega_i \), a_i) \, wide a_i =
   B_i \( C_i \( F \) \) . $ <group:reference>]

The event $C_i \( F \)$ includes the individual regularity and confinement cutoffs, as in Equation (7.1).

#thm([Lemma 7.2.])[
  (Exact conditional law).  #emph[For almost every exposed datum the normalizers in Equation (7.4) are positive,
    and the conditional law of the unexposed trajectories is
#[#set math.equation(numbering: n => "(7.5)")
 $ lambda_(cal(I)) \( thin upright(d) omega_(cal(I)) \) = 1 /
   Z_(cal(I)) upright(bold(1))_({ upright("all pairs in ") cal(I) upright(" avoid each other") })
   product_(i in cal(I)) P_i \( thin upright(d) omega_i \) \, wide Z_(cal(I)) > 0 . $ <group:product-law>]

 All reference trajectories obey their own regularity and confinement cutoffs.
   Each label has at most $C M$ other labels in this group with which a collision can be possible,
   where $C$ is a fixed geometric constant.]
] <lem:conditional-law>

#proof[
  Condition first on $Y \, Z \, W'$. In the slab law of Proposition 14,
    the two outer heat kernels are then constant. The remaining free reference is a product of torus bridges,
    weighted only by the indicator of mutual hard avoidance. At fixed endpoints,
    eligibility of an individual path consists of its own regularity and confinement conditions:
    its starting cell, endpoint displacement and endpoint separation are already fixed.
    The probabilities of all allocations depend only on the recorded eligibility indicators,
    and are consequently constant on the conditional fiber.
  Now expose all paths outside $cal(I)$. Every retained label was eligible,
    so the only remaining individual restrictions are exactly its two cutoffs and avoidance of the fixed frozen
    paths. Confinement to its radius-$10$ ball selects a single Euclidean lift when $K$ is large.
    The winding weights of the original torus bridge then depend only on the fixed endpoints and cancel in
    normalization. The remaining nonfactorizing restriction is mutual avoidance inside $cal(I)$.
    This proves Equation (7.5) by disintegration on the continuous-path spaces.
    Equivalently, integrate the asserted formula against bounded functions of the exposed and unexposed variables
    and use Fubini; all factors just identified reproduce the thermal slab density and the allocation probabilities.
  The integral of the conditional density is positive for almost every sampled datum.
    Its positivity implies positivity of each $a_i$ and of $Z_(cal(I))$;
    otherwise that fiber would have zero weight. Finally a retained trajectory stays within distance ten of its
    home site. Two such tubes can meet at distance $r < 1$ only when their home sites are within a fixed lattice
    distance. There are at most $M$ labels per site and a fixed number of such sites, proving the last assertion.
    In particular Equation (7.5) is a conditioned product, not a claim that its trajectories are independent. ◻
]

=== 7.3 Accessibility and the probability of bad cells <accessibility-and-the-probability-of-bad-cells>

For $i in cal(I)$ and one of its target cells $B_w$, set

#[#set math.equation(numbering: n => "(7.6)")
 $ T_i \( w \) = { u in B_w : Q_i^u \( C_i \( F \) \) gt.eq 0.9 } . $ <group:targets>]

A label is #emph[accessible] if $\| T_i \( w \) \| gt.eq 0.99$ for all seven target cells.
  This property and all the sets $T_i \( w \)$ depend only on $cal(B)$.
  Let $cal(A)_v$ be the accessible labels of the fixed group at $v$.
  A site is #emph[good] if $\| cal(A)_v \| gt.eq M \/ 2$, and #emph[bad] otherwise.
  The sets in Equation (7.6) are measurable: bridge kernels are measurable in their endpoints, and regularity,
  confinement and strict avoidance are Borel events of continuous paths.

#thm([Proposition 7.3.])[
  (Unconditional supply of good cells).  #emph[For any prescribed $p > 0$,
    the constants before $M$ can be chosen as above, and then $M$ can be chosen sufficiently large,
    so that for sufficiently large $D$ and $K$,
#[#set math.equation(numbering: n => "(7.7)")
 $ bb(P)_(cal(B)) { A subset { upright("bad sites") } } lt.eq p^(\| A \|) $ <group:bad-bound>]

 for every set $A$ of distinct sites. The bound is uniform in the group index, $0 < T lt.eq D^(- 1)$,
   and the allowed $alpha$-window. It remains valid if $M$ is increased before increasing the lower threshold on $D$.]
] <prop:group-supply>

#proof[
  Choose $p_1 < p \/ 2$ in Proposition 17 and meet also the requirements of Lemma 26.
    Fix the full path sample before the allocation randomizations.
    At a certified cell there are at least $ell D \/ 2 gt.eq M G_D$ eligible labels,
    and at least nine tenths satisfy Equation (7.2). For a fixed group,
    its $M$ labels form a uniform sample without replacement from this list.
    For any $k$ specified positions in that sample, the probability that all $k$ lack the stronger property is at
    most $10^(- k)$. A union bound therefore gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(P) { upright("fewer than ") M \/ 2 upright(" stronger labels in the group") divides
     upright("full sample") } lt.eq q_M := 2^M 10^(- M \/ 2) . $ <group:sampling-failure>]
  This tends to zero exponentially in $M$.
  A label with the stronger property is accessible after allocation:
    its frozen obstacle family is a subset of all other sampled paths,
    so removing obstacles can only increase its success probabilities.
    Moreover the auxiliary sampling tests at distinct certified cells are independent conditional on the full
    sample. For each subset $A_0 subset A$, designate the cells of $A_0$ as lacking certificates and the other
    cells as certified but failing the sampling test. The probability of this event is at most $p_1^(\| A_0 \|)
    q_M^(\| A \\ A_0 \|)$, by conditioning first on the full sample and then using Proposition 17.
    Summing over $A_0$ bounds the probability in Equation (7.7) by $\( p_1 + q_M \)^(\| A \|)$.
    Take $M$ large enough that $q_M < p \/ 2$. The argument applies to each group under the unconditional law of
    the exposed datum. ◻
]

=== 7.4 One-path comparisons at fixed exposed data <one-path-comparisons-at-fixed-exposed-data>

The remaining estimates apply at a fixed datum, even when its unexposed trajectories no longer satisfy any
  full-sample certificate. Let $i$ be accessible, let $B_w$ be a target cell,
  and let $U subset T_i \( w \)$ be a measurable set of volume at least $0.98$.
  Define the proposal $Pi_i^U$ by choosing $u$ uniformly in $U$ and then sampling $Q_i^u$ conditioned on
  $C_i \( F \)$. The target set is chosen using exposed data only;
  it must not depend on the trajectories of other unexposed labels.

#thm([Proposition 7.4.])[
  (Density and deterministic compatibility).  #emph[There is a constant $G gt.eq 2$,
    fixed after $t$ and independent of $D \, K \, M$, such that
#[#set math.equation(numbering: n => "(7.9)")
 $ Pi_i^U lt.double P_i \, wide 0 lt.eq frac(thin upright(d) Pi_i^U, thin upright(d) P_i) lt.eq G \, wide
   integral frac(thin upright(d) Pi_i^U, thin upright(d) P_i) thin upright(d) P_i = 1 . $ <group:density-bound>]

 There is also $e_D arrow.r 0$, uniform in the exposed datum, with the following property.
   Fix any regular, confined trajectory of a distinct label in $cal(I)$, keeping its recorded endpoints.
   Under either $P_i$ or $Pi_i^U$, the probability of colliding with that deterministic trajectory is at most
   $e_D$. Its label need not be accessible. One may take
#[#set math.equation(numbering: n => "(7.10)")
 $ e_D = C_t #scale(x: 120%, y: 120%)[\(] t r + r D^(3 gamma) h_0^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq
   C'_t D^(- 1 \/ 4) . $ <group:eta>]

]
] <prop:group-comparison>

#proof[
  The lifted midpoint density $g_i$ of $B_i$ is the Euclidean Gaussian with mean $\( Y_i + Z_i \) \/
    2$ and covariance $t I$. On every target cell it has a lower bound $c_t > 0$,
    uniform in the eligible endpoint data. Indeed those endpoints are within distance three of $v$,
    and every target cell lies in a fixed bounded neighborhood of $v$;
    the explicit Gaussian density gives such a bound. Disintegrating $B_i$ at its midpoint gives the conditional
    laws $Q_i^u$. Hence
  $ a_i = integral g_i \( u \) Q_i^u \( C_i \( F \) \) thin upright(d) u gt.eq 0.99 dot.op 0.9 thin c_t = : a_t > 0 . $
  At a successful trajectory with midpoint $u$, the proposal density relative to $P_i$ is
  $ frac(a_i upright(bold(1))_U \( u \), \| U \| g_i \( u \) Q_i^u \( C_i \( F \) \)) lt.eq
    frac(1, 0.98 dot.op 0.9 thin c_t) \, $
  since $a_i lt.eq 1$. Taking $G$ to be the maximum of two and this constant proves Equation (7.9);
    its final identity holds because both measures are probabilities.
  For collision with the fixed opponent, first use the unconditioned bridge $B_i$.
    The event contributing under $P_i$ satisfies the regularity and confinement cutoffs.
    Lemma 23 bounds its probability by $C \( t r + r D^(3 gamma) h_0^(- 1 \/ 2) \)$.
    Dividing by $a_i gt.eq a_t$ proves the required estimate for $P_i$.
    For the proposal, integrate that lemma’s two-leg estimate over the whole target cell;
    restricting the integral to $U$ can only decrease it. Division by $\| U \| gt.eq
    0.98$ and by the through-$u$ success probability, which is at least $0.9$, proves the proposal estimate.
    The endpoint separation required in that lemma holds because $i$ was eligible and the opponent has a distinct
    recorded label.
  Finally $gamma = 1 \/ 12$, $h_0 = D^(- 1)$ and $r = alpha \/ D$ give $r D^(3 gamma) h_0^(- 1 \/ 2) =
    alpha D^(- 1 \/ 4)$ and $t r = O_t \( D^(- 1) \)$. The $alpha$-window is fixed.
    This proves Equation (7.10), with constants depending on the already fixed $t$ but not on the later choice of
    $M$ or the dilution threshold. ◻
]

We record explicitly how Proposition 29 applies when two proposals share a midpoint.
  Suppose that $i$ and $j$ are accessible labels for which $B_w$ is a target cell, and put $U =
  T_i \( w \) ∩ T_j \( w \)$. Then $\| U \| gt.eq 0.98$. Choose one point uniformly in $U$ and,
  conditionally on that point, choose two independent successful paths, one with each label’s bridge law.
  Each path separately has law $Pi_i^U$ or $Pi_j^U$. Thus each marginal has density at most $G$ relative to its
  own $P$-law, and each has collision probability at most $e_D$ against any fixed regular,
  confined opponent of a distinct label. These bounds integrate the common midpoint.
  They do not assert a collision bound conditionally on its value:
  choosing the midpoint at an opponent’s midpoint would force a collision.
  Nor do we assert a product density bound for the pair of paths, whose midpoints agree.
  If the two paths are used in two separately constrained configurations,
  there is no avoidance check between them. Union bounds for their separate checks therefore use only the two
  marginal estimates just proved. A factor consisting of one successful path together with its midpoint has path
  law $Pi_i^U$ and midpoint density at most $1 \/ 0.98 lt.eq G$ relative to uniform measure on $B_w$.

Each changed path has only $C M$ potential opponents by confinement.
  Consequently a fixed number of separately constrained configurations has a one-variable failure bound of the
  form $C M e_D$. The comparison argument will choose $M$ after $G$,
  then increase $D$ so that this quantity is small. In the second-moment calculation,
  conditional normalizers will cancel away from encounters between the two lattice routes.
  This is what makes the final likelihood bound uniform in their lengths.

== 8 Paths through a sparse set of obstacles <sec:lattice>

The exposed groups supply a random set of usable cells, with a joint exponential bound on prescribed failures.
  We must connect distant usable cells by random routes whose pairwise encounters remain bounded in exponential
  mean, uniformly in the volume. This section proves the required statement for an arbitrary dependent random bad
  set. It combines the dyadic skeleton construction of #cite(label("B"), form: "prose") Section 8.1,
  Lemma 8.1 with the nearest-neighbor detours and component expansion of #cite(label("HS"), form: "prose")
  Section 7, Proposition 7.1. We reproduce both arguments; only the classical boundary-connectivity theorem stated
  below is used without proof.

Write $cal(L)_K = \( bb(Z) \/ K bb(Z) \)^3$, with periodic maximum distance $d_oo$.
  Nearest-neighbor edges join vertices differing by one in one coordinate;
  $*$-edges join distinct vertices at maximum distance one.
  A random datum $cal(D)$ determines a bad set $cal(B) subset cal(L)_K$. All other vertices are called good.
  Our assumption is

#[#set math.equation(numbering: n => "(8.1)")
 $ bb(P) \( A subset cal(B) \) lt.eq p^(\| A \|) wide \( A subset cal(L)_K \) . $ <lattice:bad-law>]

An ordered pair $\( v \, w \)$ is admissible if the forward displacement of its first coordinate has an integer
  representative $n$ with $ceil.l K \/ 10 ceil.r lt.eq n lt.eq floor.l K \/ 8 floor.r$,
  and its two transverse displacements have representatives $d_2 \, d_3$ satisfying $\| d_i \| lt.eq n$.
  These representatives determine the lift displacement $\( n \, d_2 \, d_3 \)$ uniquely.
  Set $upsilon = 1 \/ 2000$. For two simple paths $pi \, pi'$ define

#[#set math.equation(numbering: n => "(8.2)")
 $ J_R \( pi \, pi' \) = sum_(z in pi) sum_(z' in pi') upright(bold(1))_({ d_oo \( z \, z' \) lt.eq R }) .
   $ <lattice:contact-definition>]

Here a simple path visits each vertex at most once.

#thm([Proposition 8.1.])[
  (Good paths with bounded encounters).  #emph[Fix an integer $R gt.eq 1$.
    There are constants $p_0 \, kappa > 0$, $C_(upright("path")) < oo$, and an integer $K_0$,
    depending only on $R$, with the following property. Suppose $K gt.eq K_0$ and (8.1) holds with $p lt.eq p_0$.
    For every admissible ordered pair $\( v \, w \)$ there is a $cal(D)$-measurable event $cal(E)_(v \, w)$ of
    probability at least $1 \/ 2$. On this event there is a measurable probability kernel on simple good
    nearest-neighbor paths from $v$ to $w$. Two independent draws from this kernel, conditional on $cal(D)$, satisfy
#[#set math.equation(numbering: n => "(8.3)")
 $ bb(E) [upright(bold(1))_(cal(E)_(v \, w)) bb(E) [e^(kappa J_R \( pi \, pi' \)) divides cal(D)]] lt.eq
   C_(upright("path")) . $ <eq:lattice-encounter>]

 The constants are uniform in the datum, its law, and the endpoint pair.
   For every sufficiently large $K$, at least $upsilon K^6$ ordered pairs are admissible.]
] <prop:good-paths>

The event is determined before drawing the paths. The expectation in (8.3) averages over one common environment
  and two fresh path samples; it is not a bound for every fixed environment. We will use the proposition with $R = 30$.

=== 8.1 A folded random skeleton <lattice:skeleton-law>

The skeleton first advances in one coordinate while fluctuating in the other two.
  Its fluctuations are read forward and then backward, which fixes both endpoints without conditioning on a future
  value. Independent dyadic blocks make the future transverse displacement sufficiently unpredictable to give
  summable encounter probabilities. The use of unpredictability and intersection moments originates in
  #cite(label("BPP1998"), form: "prose") Theorem 1.3 and Lemma 3.1;
  the aligned block construction is related to #cite(label("HaggstromMossel1998"), form: "prose") Section 3,
  Proposition 3.1. Finite-endpoint path averaging appears in
  #cite(label("AbbeMassoulieMontanariSlySrivastava2018"), form: "prose") Section 6,
  Lemma 6.1 and #cite(label("GarbanSpencer2023"), form: "prose") Section 2, Lemma 2.5.
  The following explicit law and the two estimates are those of #cite(label("B"), form: "prose") Section 8.1.

Fix an admissible pair, choose a lift of $v$, and give $w$ the lift $v + \( n \, d_2 \, d_3 \)$.
  For each $j in { 2 \, 3 }$ use independent random variables $U_(ell \, k)^(\( j \))$,
  uniform on $\[ - 1 \, 1 \]$, for integers $ell \, k gt.eq 0$. Put

#[#set math.equation(numbering: n => "(8.4)")
 $ v_i^(\( j \)) = c_(upright("vel")) sum_(ell gt.eq 0) 2^(- ell \/ 4)
   U_(ell \, floor.l \( i - 1 \) \/ 2^ell floor.r)^(\( j \)) \, wide Z_t^(\( j \)) =
   sum_(i = 1)^t v_i^(\( j \)) \, wide Z_0^(\( j \)) = 0 . $ <lattice:velocity-law>]

Fix $c_(upright("vel")) = \( 1 - 2^(- 1 \/ 4) \) \/ 2$, so that $c_(upright("vel")) sum_(ell gt.eq 0)
  2^(- ell \/ 4) = 1 \/ 2$. The series converges absolutely for every sample. The base vertices are

#[#set math.equation(numbering: n => "(8.5)")
 $ u_t = v +
   (t \, ⌊t d_2 \/ n + Z_(min \( t \, n - t \))^(\( 2 \))⌋ \, ⌊t d_3 \/ n + Z_(min \( t \, n - t \))^(\(
   3 \))⌋) \, wide 0 lt.eq t lt.eq n . $ <lattice:nominal>]

The endpoints are $v \, w$. Each base increment advances the first coordinate by one and changes each transverse
  coordinate by at most two. Refine it by first making the first-coordinate step,
  then all required steps in coordinate two, then those in coordinate three.
  This takes at most five nearest-neighbor steps. The occurrence list consists of the initial vertex and the
  vertex reached after each step, without adding an extra copy at the join between consecutive refinements.
  Denote the projected walk by $Gamma$ and retain this lift for the detour construction.

For two independent copies $Gamma \, Gamma'$ of this law and a fixed integer $R_s gt.eq 1$, define the occurrence count

#[#set math.equation(numbering: n => "(8.6)")
 $ J_(upright("occ"))^(\( R_s \)) = sum_(z in Gamma) upright(bold(1))_({ d_oo \( z \, Gamma' \) lt.eq R_s }) +
   sum_(z' in Gamma') upright(bold(1))_({ d_oo \( z' \, Gamma \) lt.eq R_s }) . $ <lattice:occurrence-count>]

Both sums count occurrences, including any repetitions. For a fixed $B > 0$, put

$ S_B \( Gamma \, Gamma' \) = sum_(z in Gamma) e^(- d_oo \( z \, Gamma' \) \/ B) \, $

again counting occurrences.

#thm([Lemma 8.2.])[
  (Skeleton encounters).  #emph[For two independent skeletons just constructed,
    there are absolute constants $c_(upright("hit")) > 0$ and $C_(upright("hit")) < oo$ such that,
    for every integer $R_s gt.eq 1$,
#[#set math.equation(numbering: n => "(8.7)")
 $ bb(E) e^(alpha_s J_(upright("occ"))^(\( R_s \))) lt.eq C_(upright("hit")) \, wide alpha_s =
   frac(c_(upright("hit")), \( 1 + R_s \)^2) . $ <lattice:imported-hit>]

 For every fixed $B > 0$, there are $xi \( B \) > 0$ and $C \( B \) < oo$ such that
#[#set math.equation(numbering: n => "(8.8)")
 $ bb(E) e^(xi \( B \) S_B \( Gamma \, Gamma' \)) lt.eq C \( B \) . $ <lattice:imported-soft>]

 Both estimates are uniform in $K$ and the admissible endpoint pair.]
] <lem:skeleton>

#proof[
  Write $Z_t = \( Z_t^(\( 2 \)) \, Z_t^(\( 3 \)) \)$ and let $Z'_t$ be the corresponding sum for the second
    skeleton. Put $h = floor.l n \/ 2 floor.r$. Reveal the entire second skeleton at the outset.
    For the first skeleton, let $cal(F)_t$ contain the second array and precisely those variables
    $U_(ell \, k)^(\( j \))$ whose index blocks
  $ I_(ell \, k) = { k 2^ell + 1 \, dots.h \, \( k + 1 \) 2^ell } $
  meet ${ 1 \, dots.h \, t }$, for $j = 2 \, 3$. This filtration includes all variables used through time $t$,
    including large blocks continuing beyond $t$.
  For $k gt.eq 1$ and $t + k lt.eq h$, the interval ${ t + 1 \, dots.h \, t +
    k }$ contains a full aligned dyadic block of length $L gt.eq k \/ 4$.
    For $k gt.eq 2$, choose a power of two with $k \/ 4 < L lt.eq k \/ 2$;
    aligning its start skips fewer than $L$ indices. For $k = 1$, use a singleton.
    The variable attached to this block is independent of $cal(F)_t$ and occurs in $Z_(t + k)^(\( j \))$ with
    coefficient $c_(upright("vel")) L^(3 \/ 4)$. Conditional on every other variable,
    it therefore supplies a uniform density bounded by $C k^(- 3 \/ 4)$.
    Choose this unused variable separately in the two independent transverse coordinates.
    Integrating the remaining variables proves the conditional two-dimensional density bound
  #[#set math.equation(numbering: n => "(8.9)")
   $ parallel "dens" \( Z_(t + k) divides cal(F)_t \) #scale(x: 120%, y: 120%)[parallel]_oo lt.eq
     C k^(- 3 \/ 2) . $ <lattice:conditional-density>]
  The exponent $3 \/ 2 > 1$ is what makes the sum over future times finite.
  We next reduce encounters anywhere on the folded walks to tests at the same unfolded time.
    Let $D_t = \| Z_t - Z'_t \|_oo$, $0 lt.eq t lt.eq h$. An occurrence $z$ at first-coordinate level $t$ is at
    maximum distance at most two from the base vertex $u_t$. For an opposing occurrence $z'$ at level $t'$,
    write $d = d_oo \( z \, z' \)$. Since both first-coordinate spans have length $n lt.eq K \/ 8$,
    their differences do not wrap, and $\| t - t' \| lt.eq d$. Each base step has maximum norm at most two.
    Thus, with $u'_t$ the second base vertex,
  $ d_oo \( u_t \, u'_t \) lt.eq 2 + d + 2 + 2 \| t - t' \| lt.eq 3 d + 4 . $
  At equal times the linear drifts cancel. Each random deviation has absolute value at most $n \/ 4$,
    so the lifted transverse difference, including rounding, is less than $K \/ 2$ for our sufficiently large $K$.
    It is consequently the ordinary rather than a wrapped difference.
    Rounding costs at most one, and hence, for $u = min \( t \, n - t \)$,
  #[#set math.equation(numbering: n => "(8.10)")
   $ D_u lt.eq 3 d_oo \( z \, z' \) + 5 . $ <lattice:same-time>]
  There are at most five occurrences at each first-coordinate level and at most two levels with a given value of
    $min \( t \, n - t \)$. Applying (8.10) in both directions gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ J_(upright("occ"))^(\( R_s \)) & lt.eq C sum_(t = 0)^h upright(bold(1))_({ D_t lt.eq C \( R_s + 1 \) }) \,\
S_B \( Gamma \, Gamma' \) & lt.eq C \( B \) sum_(t = 0)^h e^(- D_t \/ \( 3 B \)) . $ <lattice:hard-tests>]
  For the second estimate, take $z'$ closest to $z$ in (8.10) and use $e^(- d \/ B) lt.eq
    e^(5 \/ \( 3 B \)) e^(- D_u \/ \( 3 B \))$.
  Let $X_t in \[ 0 \, 1 \]$ be either test on the right of these displays. It is $cal(F)_t$-measurable.
    Integrating (8.9) over a square, or against the decaying exponential on $bb(R)^2$, and summing $k^(- 3 \/ 2)$ gives
  #[#set math.equation(numbering: n => "(8.12)")
   $ bb(E) [sum_(u = t + 1)^h X_u thin mid(bar.v) thin cal(F)_t] lt.eq b_0 \, quad b_0 =
     cases(delim: "{", C \( R_s + 1 \)^2 \, & upright("for the indicator test") \,, C \( B \) \, &
     upright("for the exponential test") .) $ <lattice:future-sum>]
  Set $B_0 = b_0 + 1$. For every $j gt.eq 1$, successive conditioning of the last index in the ordered sum proves
  $ bb(E) sum_(0 lt.eq t_1 < dots.h.c < t_j lt.eq h) X_(t_1) dots.h.c X_(t_j) lt.eq B_0^j . $
  For $j = 1$, this follows from (8.12) at time zero and $X_0 lt.eq 1$;
    each subsequent conditioning costs at most $b_0$. Since $e^(theta x) -
    1 lt.eq \( e^theta - 1 \) x$ for $0 lt.eq x lt.eq 1$,
  $ bb(E) e^(theta sum_(t = 0)^h X_t) = bb(E) product_(t = 0)^h #scale(x: 120%, y: 120%)[\(] 1 + e^(theta X_t) -
    1 #scale(x: 120%, y: 120%)[\)] lt.eq sum_(j gt.eq 0) #scale(x: 120%, y: 120%)[\(] \( e^theta - 1 \) B_0
    #scale(x: 120%, y: 120%)[\)]^j . $
  Taking $theta$ a sufficiently small constant times $B_0^(- 1)$ bounds this geometric series by two.
    Equations (8.11)–(8.11) give the two asserted moments, after adjusting their constants. ◻
]

The skeleton law and its bounds use no many-particle parameter.
  In applying them, we draw the two arrays independently of each other and of the exposed datum $cal(D)$.

For later use we convert the occurrence count to our pair count.
  Every first-coordinate level of a lifted skeleton contains at most five occurrences:
  level zero has only the initial vertex, and all vertices created in the $t$th refinement have first coordinate
  $v_1 + t$. The first-coordinate span is $n lt.eq K \/ 8$,
  so the periodic distance between two such levels is their ordinary distance.
  A fixed occurrence of $Gamma$ can therefore have at most $5 \( 2 R + 1 \)$ opposing occurrences within distance
  $R$. With $R_s = R$, this proves

#[#set math.equation(numbering: n => "(8.13)")
 $ J_R \( Gamma \, Gamma' \) lt.eq 5 \( 2 R + 1 \) J_(upright("occ"))^(\( R \)) . $ <lattice:pair-occurrence>]

The left side uses the double occurrence sum from Equation (8.2).
  This conversion uses the actual refinement law, as well as its moment bounds.

=== 8.2 Finite components and their exterior boundaries <finite-components-and-their-exterior-boundaries>

We record the deterministic facts used to move a lattice path around bad vertices.
  For a finite $*$-connected nonempty set $C subset bb(Z)^3$,
  let $"fill" \( C \)$ consist of $C$ and all finite nearest-neighbor components of $bb(Z)^3 \\ C$.
  The remaining component is the exterior. There is only one infinite component:
  outside any box containing $C$, nearest-neighbor vertices communicate, and every infinite component meets that region.

#thm([Lemma 8.3.])[
  (Exterior shell).  #emph[The set $"fill" \( C \)$ lies in the coordinate bounding box of $C$.
    The exterior vertices at maximum distance one from $C$ form a nearest-neighbor connected set,
    denoted $partial_(*)^(upright("ext")) C$, with at most $26 \| C \|$ vertices.
    If $C$ is a $*$-component of a larger bad set, every vertex of this shell is good.]
] <lattice:boundary>

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

#thm([Lemma 8.4.])[
  (Small periodic components).  #emph[Suppose $K > 2 a$, and a range-$a$ component on $cal(L)_K$ has $m$ vertices
    with $a m < K$. Each of its lifts to $bb(Z)^3$ is a finite component projecting bijectively onto it.
    The coordinate span of a lift is at most $a \( m - 1 \)$.]
] <lattice:small-lifts>

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
  and its visited vertices recover the set. Increasing $A_a$ covers $m = 1$. Together with (8.1), this gives

#[#set math.equation(numbering: n => "(8.14)")
 $ bb(P) \( upright("a range-") a upright(" bad component has at least ") m upright(" vertices") \) lt.eq
   K^3 \( A_a p \)^m . $ <lattice:large-animal>]

A component of size at least $m$ contains a connected subset of exactly $m$ vertices,
  by growing a spanning tree one vertex at a time.

We have proved the two encounter bounds for paths that ignore the bad set.
  To use them, we will retain the skeleton vertices whenever possible and replace obstructed segments by short
  exterior routes. A size restriction guarantees the finite lifts needed for this construction;
  the endpoints must also lie outside the components’ filled interiors.
  The joint bad-set bound makes both requirements likely.

Fix $a_1 = R + 2$. Reject the environment if it contains a range-$a_1$ bad component of size at least

$ m_K = ⌊frac(K, 10 a_1)⌋ . $

For large $K$, every remaining bad $*$-component has finite periodic lifts, by Lemma 33.
  Reject also if either endpoint belongs to the projection of the fill of one of these components.
  The event on which neither rejection occurs is $cal(E)_(v \, w)$.

If the fill of a lifted $*$-component of size $m$ contains a lift of an endpoint,
  some root of the component lies within maximum distance $m$ of that endpoint.
  This follows from the bounding-box assertion and the coordinate span in Lemma 33.
  There are at most $C m^3$ possible roots modulo $K$. Counting connected sets and using (8.1) thus yields

#[#set math.equation(numbering: n => "(8.15)")
 $ bb(P) \( cal(E)_(v \, w)^c \) lt.eq K^3 \( A_(a_1) p \)^(m_K) +
   C sum_(m gt.eq 1) m^3 \( A_1 p \)^m . $ <lattice:rejection>]

The constant includes both endpoints. First make $p_0$ small enough that the series is at most $1 \/ 4$,
  then make $K_0$ large enough that the first term is at most $1 \/ 4$ for $p lt.eq p_0$ and $K gt.eq K_0$.
  This proves $bb(P) \( cal(E)_(v \, w) \) gt.eq 1 \/ 2$. We may decrease $p_0$ further below.

=== 8.3 Nearest-neighbor detours <nearest-neighbor-detours>

Draw the skeleton of Section 8.1 independently of the datum.
  Its folding in Equation (8.5) fixes the final endpoint without conditioning the random process on a future
  value. We now adapt this nearest-neighbor walk to the bad set while keeping the endpoint rejection event fixed.

Figure 1 illustrates the replacement. The construction takes place in $bb(Z)^3$,
  where a finite obstacle has a well-defined exterior; projection and loop erasure are performed afterward.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((0.62, 0), (0.62, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((1.24, 0), (1.24, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((1.86, 0), (1.86, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((2.48, 0), (2.48, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((3.1, 0), (3.1, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((3.72, 0), (3.72, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((4.34, 0), (4.34, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((4.96, 0), (4.96, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (4.96, 0), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.62), (4.96, 0.62), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.24), (4.96, 1.24), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.86), (4.96, 1.86), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.48), (4.96, 2.48), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 3.1), (4.96, 3.1), stroke: (paint: rgb("#e6e6e6"), thickness: 0.4pt, miter-limit: 10))
  circle((1.86, 1.24), radius: 0.1054, fill: rgb("#b9b9b9"), stroke: none)
  circle((1.86, 1.86), radius: 0.1054, fill: rgb("#b9b9b9"), stroke: none)
  circle((2.48, 1.24), radius: 0.1054, fill: rgb("#b9b9b9"), stroke: none)
  circle((2.48, 1.86), radius: 0.1054, fill: rgb("#b9b9b9"), stroke: none)
  line((0, 1.24), (1.86, 1.24), (1.86, 1.86), (2.48, 1.86), (2.48, 1.24), (4.96, 1.24), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 1.24), (1.24, 1.24), (1.24, 0.62), (3.1, 0.62), (3.1, 1.24), (4.96, 1.24), stroke: (paint: rgb("#003300"), thickness: 1.4pt, miter-limit: 10))
  circle((1.24, 0.62), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((1.86, 0.62), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((2.48, 0.62), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((3.1, 0.62), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((3.1, 1.24), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((3.1, 1.86), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((3.1, 2.48), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((2.48, 2.48), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((1.86, 2.48), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((1.24, 2.48), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((1.24, 1.86), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((1.24, 1.24), radius: 0.0465, fill: rgb("#ffffff"), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 1.24), radius: 0.0558, fill: black, stroke: none)
  content((0, 1.24), [#text(size: 9pt)[$v$]], anchor: "east", padding: 0.1176cm)
  circle((4.96, 1.24), radius: 0.0558, fill: black, stroke: none)
  content((4.96, 1.24), [#text(size: 9pt)[$w$]], anchor: "west", padding: 0.1176cm)
  content((1.24, 1.24), [#text(size: 9pt)[$a$]], anchor: "south-east", padding: 0.1176cm)
  content((3.1, 1.24), [#text(size: 9pt)[$b$]], anchor: "south-west", padding: 0.1176cm)
  content((2.17, 1.922), [#text(size: 9pt)[$C$]], anchor: "south", padding: 0.1176cm)
  content((2.48, -0.558), [#text(size: 9pt)[replace the first-to-last visit]])
  line((7, 0.248), (10.84, 0.248), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((10.84, 0.248), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  line((8.86, 0.124), (8.86, 2.604), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((7, 0.248), (7.372, 0.744), (7.744, 0.558), (8.116, 1.302), (8.488, 1.55), (8.86, 2.046), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((8.86, 2.046), (9.232, 1.55), (9.604, 1.302), (9.976, 0.558), (10.35, 0.744), (10.72, 0.248), stroke: (paint: rgb("#003300"), thickness: 1.2pt, miter-limit: 10))
  content((7, 0.217), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.1176cm)
  content((8.86, 0.217), [#text(size: 9pt)[$n"/"2$]], anchor: "north", padding: 0.1176cm)
  content((10.72, 0.217), [#text(size: 9pt)[$n$]], anchor: "north", padding: 0.1176cm)
  content((8.86, 2.852), [#text(size: 9pt)[$Z_( min (t,n-t))^((j))$]])
  content((8.86, -0.558), [#text(size: 9pt)[read the same displacement twice]])
})],
  caption: [Figure 1: Two parts of the path construction, shown schematically. Left: the original dashed route meets the finite bad component $C$; the solid route joins its exterior predecessor $a$ to its exterior successor $b$ through good nearest-neighbor vertices. The drawing is a planar schematic of a three-dimensional exterior shell, and does not represent holes or later loop erasure. Right: for even $n$, the random transverse displacement used in the skeleton is reflected at $n \/ 2$; the common linear drift and integer rounding are omitted. This return to zero fixes the final endpoint without a bridge conditioning. ],
) <fig:lattice-detour>

On $cal(E)_(v \, w)$, replace the visits of this lifted walk to bad components as follows.
  If it meets a lifted bad $*$-component $C$, take its first and last visits to $C$.
  The vertices immediately before and after these visits belong to $partial_(*)^(upright("ext")) C$:
  the path from the first endpoint to the first such vertex misses $C$,
  and the path from the last such vertex to the other endpoint misses $C$;
  both endpoints are outside $"fill" \( C \)$. By Lemma 32,
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
  Thus the construction gives the measurable kernel in Proposition 30.

We now bound the encounters introduced by this construction.
  Use two independent nominal samples $Gamma \, Gamma'$ in the same environment, and let $pi \,
  pi'$ be their final simple paths. Let $H$ range over the range-$a_1$ bad components on the torus.
  Fix $C_R = 52 \( 2 R + 1 \)^3$, which also exceeds $5 \( 2 R + 1 \)$ in Equation (8.13). On $cal(E)_(v \, w)$,

#[#set math.equation(numbering: n => "(8.16)")
 $ J_R \( pi \, pi' \) & lt.eq J_R \( Gamma \, Gamma' \)\
 & quad +
   C_R sum_H \| H \|
   upright(bold(1))_({ d_oo \( H \, Gamma \) lt.eq a_1 \, thin d_oo \( H \, Gamma' \) lt.eq a_1 }) .
   $ <lattice:detour-charge>]

For nominal walks, $J_R$ here counts vertex occurrences, which only increases the bound.

To prove (8.16), first count encounters where both vertices are nominal. These are bounded by the first term.
  If a nonnominal vertex belongs to the shell of $C$ and encounters a nominal vertex of the other walk,
  then $C$ is within distance $R + 1 lt.eq a_1$ of that other walk, and $C$ meets its own nominal walk.
  If two nonnominal vertices belong to shells of $C \, C'$, then $d_oo \( C \, C' \) lt.eq R + 2 lt.eq a_1$,
  so both components belong to one range-$a_1$ component $H$ meeting both nominal walks.
  Charge each such encounter to one of its nonnominal vertices and to this $H$.
  There are at most $26 \| H \|$ possible added vertices associated to the $*$-components inside $H$,
  even if several lifted copies were used: projection can only decrease this number.
  Each such vertex encounters at most $\( 2 R + 1 \)^3$ vertices of the other simple path.
  Charging from either path costs at most an additional factor two. This proves the claimed bound.

=== 8.4 Averaging the environment and applying both moments <averaging-the-environment-and-applying-both-moments>

Fix both complete nominal paths. Their independence from $cal(D)$ leaves (8.1) available for any prescribed
  collection of bad vertices. Expand the exponential of the second term in (8.16) as a product over the actual
  range-$a_1$ components. A term corresponding to distinct components has disjoint vertex sets.
  Drop maximality, sum over all disjoint connected candidate sets, and apply (8.1).
  Finally drop the disjointness restriction and use $1 + x lt.eq e^x$. The resulting bound is

#[#set math.equation(numbering: n => "(8.17)")
 $ & bb(E)_(cal(D))
   [upright(bold(1))_(cal(E)_(v \, w)) exp (kappa C_R sum_H \| H \| upright(bold(1))_({ d_oo \( H \, Gamma \) \,
   d_oo \( H \, Gamma' \) lt.eq a_1 }))]\
 & wide lt.eq
   exp
   (sum_F \( p e^(kappa C_R) \)^(\| F \|) upright(bold(1))_({ d_oo \( F \, Gamma \) \, d_oo \( F \, Gamma' \)
   lt.eq a_1 })) \, $ <lattice:environment-expansion>]

where $F$ ranges over all nonempty range-$a_1$ connected torus sets.
  The factor $e^(kappa C_R \| F \|) - 1$ from the expansion was bounded above by $e^(kappa C_R \| F \|)$.
  Thus only joint bad-set probabilities were used; there is no independence assumption on the environment.

We bound the exponent by the soft-distance statistic in Equation (8.8).
  If a contributing set $F$ has size $m$, choose an occurrence $z in
  Gamma$ within distance $a_1$ of a root of $F$. There are at most $\( 2 a_1 + 1 \)^3$ root choices for each $z$,
  and at most $A_(a_1)^m$ connected sets at each root. A spanning-tree path in $F$ has at most $m - 1$ edges,
  each of length at most $a_1$ in the periodic maximum metric.
  Since $F$ is also within $a_1$ of $Gamma'$, the triangle inequality gives

$ d_oo \( z \, Gamma' \) lt.eq 2 a_1 + a_1 \( m - 1 \) = a_1 \( m + 1 \) . $

This argument applies even to wrapping candidate sets; only the actual components used for detours required the
  earlier lift and rejection test. Absorb the root choices into a constant $A_R gt.eq 1$.
  The exponent in Equation (8.17) is at most

#[#set math.equation(numbering: n => "(8.18)")
 $ sum_(z in Gamma) sum_(m gt.eq 1) q^m upright(bold(1))_({ d_oo \( z \, Gamma' \) lt.eq a_1 \( m + 1 \) }) \,
   wide q = A_R p e^(kappa C_R) . $ <lattice:animal-series>]

All constants here depend only on the fixed $R$. Counting the same set more than once only increases this
  nonnegative upper bound.

Require $q lt.eq e^(- 2)$. If $d lt.eq a_1 \( m + 1 \)$, split $q^m$ into two equal powers and use

$ q^m = q^(m \/ 2) q^(m \/ 2) lt.eq q^(m \/ 2) e^(- m) lt.eq e thin q^(m \/ 2) e^(- d \/ a_1) . $

Summing the first factor over $m gt.eq 1$ proves

#[#set math.equation(numbering: n => "(8.19)")
 $ sum_(m gt.eq 1) q^m upright(bold(1))_({ d lt.eq a_1 \( m + 1 \) }) lt.eq eta \( p \, kappa \) e^(- d \/ a_1) \,
   wide eta \( p \, kappa \) = frac(e sqrt(q), 1 - sqrt(q)) . $ <lattice:soft-animal-sum>]

In particular $eta \( p \, kappa \) arrow.r 0$ as $p arrow.r 0$ at fixed $kappa$. Set $B = a_1$.
  Equations (8.16), (8.13), and (8.17)–(8.19) give

#[#set math.equation(numbering: n => "(8.20)")
 $ bb(E)_(cal(D)) [upright(bold(1))_(cal(E)_(v \, w)) e^(kappa J_R \( pi \, pi' \)) divides Gamma \, Gamma'] lt.eq
   exp (kappa C_R J_(upright("occ"))^(\( R \)) + eta \( p \, kappa \) S_B \( Gamma \, Gamma' \)) .
   $ <lattice:moment-reduction>]

On the left, the adapted paths are used only on $cal(E)_(v \, w)$.
  The environment was averaged once, with both entire skeletons fixed.

First choose $kappa > 0$ with $2 kappa C_R lt.eq alpha_R$, where $alpha_R = c_(upright("hit")) \/ \( 1 + R \)^2$.
  Next choose $p_0 > 0$ so small that $q lt.eq e^(- 2)$ and $2 eta \( p \, kappa \) lt.eq xi \( B \)$ for $p lt.eq
  p_0$, as well as the earlier endpoint rejection requirements.
  The constants $K_0$ can then be enlarged to cover those rejection estimates.
  Cauchy–Schwarz and both moments in Lemma 31 imply

$ bb(E) exp (kappa C_R J_(upright("occ"))^(\( R \)) + eta S_B) & lt.eq
  (bb(E) e^(2 kappa C_R J_(upright("occ"))^(\( R \))))^(1 \/ 2) (bb(E) e^(2 eta S_B))^(1 \/ 2)\
 & lt.eq sqrt(C_(upright("hit")) C \( B \)) = : C_(upright("path")) < oo . $

Together with Equation (8.20), this proves the annealed bound (8.3).
  Both path draws use one common datum and independent skeleton seeds.
  The event retains its original mass; there is no renormalization by conditioning on acceptance and no assertion
  of a bound for each fixed environment.

Finally, for $K gt.eq 80$ the interval $\[ ceil.l K \/ 10 ceil.r \, floor.l K \/ 8 floor.r \]$ contains at least
  $K \/ 40 - 1 gt.eq K \/ 80$ integers. For each such $n$, there are $\( 2 n + 1 \)^2 gt.eq
  K^2 \/ 25$ transverse choices. They are distinct modulo $K$, since $2 n < K$.
  Multiplying by the $K^3$ choices of starting vertex gives at least $K^6 \/ 2000 =
  upsilon K^6$ admissible ordered pairs. This completes Proposition 30.

== 9 A common measure and positive occupation <sec:comparison>

We now turn the supply of movable labels into a lower bound on the constant-orbital fraction $B_(upright("occ"))$.
  Recall from Proposition 14 that the midpoint configuration $X$ and the retained configuration $W'$ have density
  $Phi \( X \, W' \)^2$, where $Phi$ is the nonnegative kernel of the square root of the canonical state.
  The input is the conditional path law of Section 7 and the good lattice routes of Proposition 30.
  Along one route we construct two copies of the selected trajectories.
  Their midpoint assignments leave the same observed bath after different tags are removed.
  We then bound the second moment of the resulting change of measure by encounters between two routes.

This is the comparison mechanism of #cite(label("HS"), form: "prose") Section 8;
  its conditional normalizer argument is reproduced below. The thermal modification is to retain $W'$ in every
  observation and in the exposed data. It is never resampled.
  All constants obtained here are uniform in $D \, K$ and $0 < T lt.eq
  D^(- 1)$ once the earlier fixed parameters have been chosen.

=== 9.1 Affinity and a common finite measure <affinity-and-a-common-finite-measure>

For finite nonnegative measures $P \, Q$ on the same measurable space, define their affinity by

$ "Aff" \( P \, Q \) = integral sqrt(p q) thin upright(d) xi \, wide p =
  frac(thin upright(d) P, thin upright(d) xi) \, quad q = frac(thin upright(d) Q, thin upright(d) xi) \, quad xi =
  P + Q . $

Using another dominating measure gives the same value. We will use three elementary properties.
  If $P gt.eq P'$ and $Q gt.eq Q'$, then $"Aff" \( P \, Q \) gt.eq "Aff" \( P' \, Q' \)$.
  For finite lists of measure pairs,

#[#set math.equation(numbering: n => "(9.1)")
 $ "Aff" (sum_j P_j \, sum_j Q_j) gt.eq sum_j "Aff" \( P_j \, Q_j \) . $ <cmp:affinity-superadditive>]

Indeed, pointwise Cauchy–Schwarz gives $sum_j sqrt(p_j q_j) lt.eq sqrt(\( sum_j p_j \) \( sum_j q_j \))$.
  Finally, applying the same probability kernel to both measures cannot decrease affinity.
  To see this, form the joint measures with that kernel and then condition a common dominating measure on the
  output. Conditional Cauchy–Schwarz gives $bb(E) \( sqrt(p q) divides upright("output") \) lt.eq
  sqrt(bb(E) \( p divides upright("output") \) bb(E) \( q divides upright("output") \))$.
  Integration proves the assertion. Projection is a special case.

#thm([Lemma 9.1.])[
  (A common finite measure).  #emph[Let $P \, Q$ be finite nonnegative measures and let $nu$ be a finite measure
    of mass $m > 0$, absolutely continuous with respect to both. If
$ integral (frac(thin upright(d) nu, thin upright(d) P))^2 thin upright(d) P lt.eq C_P \, wide
  integral (frac(thin upright(d) nu, thin upright(d) Q))^2 thin upright(d) Q lt.eq C_Q \, $

 then $"Aff" \( P \, Q \) gt.eq m^2 \/ sqrt(C_P C_Q)$.]
] <lem:affinity>

#proof[
  With densities $p \, q \, s$ relative to a common dominating measure, Hölder’s inequality with exponents $4 \,
    4 \, 2$ gives
  $ m = integral (s^2 / p)^(1 \/ 4) (s^2 / q)^(1 \/ 4) \( p q \)^(1 \/ 4) lt.eq
    C_P^(1 \/ 4) C_Q^(1 \/ 4) "Aff" \( P \, Q \)^(1 \/ 2) . $
  The ratios can be set to zero where their denominators vanish, since $s$ is zero there.
    Squaring and rearranging proves the claim. ◻
]

=== 9.2 Cell measures and disjoint groups of tags <cell-measures-and-disjoint-groups-of-tags>

Recall $V = K^3$, $D = N \/ V$, and the unit cells $B_v$, each of volume one.
  Write $X' = \( x_2 \, dots.h \, x_N \)$ for the ordered bath.
  For ordered cells $v \, w$, define finite measures on $\( x \, y \, X' \, W' \) in B_v times B_w times
  Lambda_K^(N - 1) times Lambda_K^N$ by

#[#set math.equation(numbering: n => "(9.2)")
 $ thin upright(d) P_(v w) = V Phi \( x \, X' \, W' \)^2 thin upright(d) x thin upright(d) y thin upright(d) X'
   thin upright(d) W' \,\
thin upright(d) Q_(v w) = V Phi \( y \, X' \, W' \)^2 thin upright(d) x thin upright(d) y thin upright(d) X' thin
  upright(d) W' . $ <cmp:cell-measures>]

Nonnegativity of $Phi$ and the occupation formula in Proposition 14 give the exact identity

#[#set math.equation(numbering: n => "(9.3)")
 $ B_(upright("occ")) = 1 / V^2 sum_(v \, w) "Aff" \( P_(v w) \, Q_(v w) \) . $ <cmp:cell-affinity>]

Fix a group index $1 lt.eq g lt.eq G_D := floor.l ell D \/ \( 4 M \) floor.r$ from Section 7.
  Its exposed data are $cal(B)$, its unexposed label set is $cal(I)$,
  and its conditional path law is $lambda_(cal(I))$ from Lemma 27.
  Define measures $hat(P)_g \, hat(Q)_g$ on $\( cal(B) \, x \, y \, X' \)$;
  the data $cal(B)$ already include $W'$. For $hat(P)_g$, sample the data and the conditional unexposed paths,
  and #emph[sum] the following contributions over all $i in cal(I)$:
  take $x = omega_i \( t \)$, restrict to $x in B_v$, order the remaining $N -
  1$ midpoints by a fresh uniform permutation to form $X'$, and sample $y$ uniformly in $B_w$.
  For $hat(Q)_g$, take the tagged midpoint as $y in B_w$ and sample the extra point $x$ uniformly in $B_v$.
  The use of a sum, rather than a uniformly chosen tag, fixes their normalization.

#thm([Lemma 9.2.])[
  (Tag normalization).  #emph[For each ordered pair of cells,
#[#set math.equation(numbering: n => "(9.4)")
 $ "Aff" \( P_(v w) \, Q_(v w) \) gt.eq 1 / D sum_(g = 1)^(G_D) "Aff" \( hat(P)_g \, hat(Q)_g \) .
   $ <cmp:group-affinity>]

]
] <lem:tag-normalization>

#proof[
  Put all groups on the original slab sample, with all allocation randomizations and a fresh uniform permutation
    of the full label set. After deleting a tag, the restricted permutation uniformly orders its bath.
    Each group’s conditional construction is a disintegration of this common sample with respect to its own
    exposed data. Thus the differing data spaces are projected away before the following comparison;
    no conditional symmetry of the unexposed-path law is asserted.
    For every sampled path configuration, group label sets are disjoint.
    Their sum of tag contributions is bounded by the sum over all $N$ trajectory labels.
    The unrestricted midpoint vector together with $W'$ has density $Phi \( X \, W' \)^2$,
    symmetric in $X$ for each $W'$. For each fixed tag label,
    uniform ordering of the bath therefore gives the same density $Phi \( x \, X' \, W' \)^2$.
    Summing all tags gives $N$ times that density. Since the extra target cell has volume one and $V \/ N =
    1 \/ D$, projecting to $\( x \, y \, X' \, W' \)$ yields
  $ 1 / D sum_g "proj" hat(P)_g lt.eq P_(v w) \, wide 1 / D sum_g "proj" hat(Q)_g lt.eq Q_(v w) . $
  Use monotonicity, (9.1), and the increase of affinity under projection.
    Its homogeneity supplies the factor $1 \/ D$. ◻
]

The remaining task is to find, for each retained group and each of many ordered cell pairs,
  a common measure of mass at least $1 \/ 2$ whose squared likelihood integrals against $hat(P)_g$ and $hat(Q)_g$
  are bounded by one constant $C_2$. Lemma 34 would then give affinity at least $1 \/ \( 4 C_2 \)$ per group.
  The factor $1 \/ D$ in Equation (9.4) can be paid because the number of disjoint groups is proportional to $D$.

=== 9.3 Two midpoint assignments with the same observed bath <two-midpoint-assignments-with-the-same-observed-bath>

Take $R = 30$ in Proposition 30, and fix an admissible ordered cell pair $v \, w$:
  its lift displacement $\( n \, d_2 \, d_3 \)$ satisfies $ceil.l K \/ 10 ceil.r lt.eq n lt.eq
  floor.l K \/ 8 floor.r$ and $\| d_i \| lt.eq n$. Choose the good-site parameters of Proposition 28 to meet the
  bad-set hypothesis of Proposition 30. Let $cal(E)_(v w)$ be the data-measurable event supplied by
  Proposition 30, of probability at least $1 \/ 2$. On this event draw a simple nearest-neighbor path

$ z_0 = v \, z_1 \, dots.h \, z_d = w $

through good sites. For each $k < d$, independently choose a uniform accessible label $i_k$ anchored at $z_k$.
  The choices inspect only $cal(B)$ and the lattice path. In particular,
  they do not inspect any latent trajectory. The selected labels are distinct because their anchors are distinct.

We construct two path configurations that share their observed $\( x \, y \, X' \, W' \)$.
  Keep the exposed data fixed. First sample all unselected unexposed trajectories from their exact marginal under
  $lambda_(cal(I))$, and use them in both copies. For every vertex $z_k$, prepare a factor as follows.
  The first copy needs label $i_k$ through this cell if $k < d$,
  and the second copy needs label $i_(k - 1)$ through it if $k > 0$.
  Intersect the corresponding good-target sets $T_(i_k) \( z_k \)$ and $T_(i_(k - 1)) \( z_k \)$ from Section 7,
  using only the one required set at an endpoint. The intersection, denoted by $A_k$, has volume at least $0.98$.
  Sample $U_k$ uniformly in $A_k$, and then independently sample the one or two required bridge trials through
  $U_k$, each conditioned on its individual success against the frozen paths.
  All $d + 1$ vertex factors are independent before the additional conditioning below.
  Figure 2 shows the two midpoint assignments.

Use $U_d$ as the extra point in the first copy and $U_0$ as the extra point in the second copy.
  Impose all remaining hard-avoidance checks in both copies:
  selected paths must avoid the unselected unexposed paths and one another within their respective copies.
  Condition the product of vertex factors on these checks, separately for each fixed collection of unselected
  paths. The sampled unselected-path marginal therefore remains its original marginal under $lambda_(cal(I))$.
  More explicitly, let $lambda_(upright("out"))$ be that marginal,
  let $F_k$ be the probability law of the $k$th vertex factor,
  and let $J$ be the indicator of the remaining checks in both copies. The joint law just defined is

#[#set math.equation(numbering: n => "(9.5)")
 $ lambda_(upright("out")) \( thin upright(d) omega_(upright("out")) \) thin
   frac(J \( omega_(upright("out")) \, xi_0 \, dots.h \, xi_d \) product_(k = 0)^d F_k \( thin upright(d) xi_k \),
   integral J \( omega_(upright("out")) \, xi_0 \, dots.h \, xi_d \) product_(k = 0)^d F_k \( thin upright(d)
   xi_k \)) . $ <cmp:fixed-outside-law>]

The denominator is a function of the fixed outside paths.
  Integrating the second factor gives one for each such configuration.
  A single normalization after integrating the outside paths would change their marginal and would not yield the
  comparison used below. Each $F_k$ depends only on the data, route and selected labels,
  so it is fixed before those outside paths are sampled.

We verify that this conditional construction is defined. A vertex factor carries at most two paths,
  each with a marginal of the form $Pi_i^(A_k)$ in Proposition 29.
  Its paths are confined within distance ten of their anchors,
  and there are at most $M$ unexposed labels per anchor. Consequently each factor has at most $C_(upright("col"))
  M$ possible opponents in the two copies, for a fixed geometric constant $C_(upright("col"))$.
  All opponents have distinct labels within the copy in which a check is imposed.
  The deterministic-opponent estimate, summed over those checks, gives

#[#set math.equation(numbering: n => "(9.6)")
 $ chi_D = C_(upright("col")) M e_D arrow.r 0 wide \( D arrow.r oo \, med M upright(" fixed") \) .
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
  This defines a single finite measure $hat(nu)$ on $\( cal(B) \, x \, y \, X' \)$ after averaging the data,
  routes and labels, with zero mass off $cal(E)_(v w)$. Each conditional sampling law on this event is a
  probability measure, so

#[#set math.equation(numbering: n => "(9.7)")
 $ hat(nu) \( upright("all") \) = bb(P) \( cal(E)_(v w) \) gt.eq 1 / 2 . $ <cmp:common-mass>]

These are measurable probability kernels: the route and label choices are finite,
  the target sets are measurable functions of the data, and all path restrictions are Borel subsets of the
  continuous-path spaces. The positive normalizers just proved permit the displayed conditioning.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.9225, 0.65), (0.9225, -1.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 4pt)
  content((0, 0.65), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$U_0=x$]]])])
  rect((1.328, 0.65), (3.172, -1.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 4pt)
  content((2.25, 0.65), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$U_1$]]])])
  rect((3.578, 0.65), (5.423, -1.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 4pt)
  content((4.5, 0.65), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$U_2$]]])])
  rect((5.827, 0.65), (7.673, -1.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"), radius: 4pt)
  content((6.75, 0.65), [#box(inset: 0.1058cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$U_3=y$]]])])
  content((-1.193, 0), [#text(size: 9pt)[first copy]], anchor: "east", padding: 0.1176cm)
  content((-1.193, -1.2), [#text(size: 9pt)[second copy]], anchor: "east", padding: 0.1176cm)
  content((0, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_0$ \(tag\)]]])])
  content((2.25, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_1$]]])])
  content((4.5, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_2$]]])])
  content((6.75, 0), [#text(size: 9pt)[extra point]])
  content((0, -1.2), [#text(size: 9pt)[extra point]])
  content((2.25, -1.2), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_0$]]])])
  content((4.5, -1.2), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_1$]]])])
  content((6.75, -1.2), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#ebebff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$i_2$ \(tag\)]]])])
  line((0.6803, -0.2834), (1.99, -0.9455), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((2.51, -0.2545), (4.24, -0.9455), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((4.76, -0.2545), (6.07, -0.9166), stroke: (paint: rgb("#808080"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((1.327, -1.7), (1.327, -1.85), (5.423, -1.85), (5.423, -1.7), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.375, -2.25), [#text(size: 9pt)[same selected bath: $\{U_1,U_2\}$]])
})],
  caption: [Figure 2: The midpoint assignment for a route of three edges. A dashed column is one vertex factor with one common midpoint. Arrows identify the same particle label in the two copies; they are not trajectories in time. Removing the highlighted tags leaves the same two selected bath midpoints. All unselected bath paths and the configuration $W'$ are shared. For a route of arbitrary length the interior columns continue in the same way. ],
) <cmp:shift-figure>

=== 9.4 Cancellation of conditional normalizers <cancellation-of-conditional-normalizers>

The midpoint construction has two path copies in each internal vertex factor.
  To estimate its likelihood, designate one copy as primary and regard the other as auxiliary.
  At an internal vertex $z_k$, $1 lt.eq k < d$, the primary path has label $i_k$ in the first-copy view,
  whereas the auxiliary path has label $i_(k - 1)$. Thus deleting a factor is not the same operation as deleting
  all instances of one particle label. The following lemma keeps this distinction explicit and isolates the
  normalizers that cancel when two routes are far apart. Its coordinates and factors are abstract;
  we identify them with the midpoint construction immediately after the proof.
  The two changes arise because the square of a route-averaged likelihood expands into a product for two
  independent route choices at the same exposed datum.

The next lemma, from #cite(label("HS"), form: "prose") Lemma 8.3,
  concerns finitely many coordinates in standard Borel spaces, each with a probability reference $P_i$.
  All auxiliary spaces below are standard Borel as well. A #emph[check] will mean an indicator imposing a
  constraint on one or two coordinates. The joint reference law $lambda$ is the product $⨂_i
  P_i$ conditioned on a finite collection of checks. An additional independent coordinate is allowed;
  it simply has no checks.

A change indexed by a set $S$ leaves the marginal outside $S$ unchanged.
  Inside $S$, it starts from independent factors $Pi_(S \, i)$, $i in S$.
  Each factor includes a #emph[primary coordinate] in the space of $P_i$ and possibly auxiliary coordinates.
  Its primary marginal is $g_(S \, i) P_i$, with

#[#set math.equation(numbering: n => "(9.8)")
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

#thm([Lemma 9.3.])[
  (Cancellation away from an overlap).  #emph[Consider two changes $S \, T$ of the preceding kind, with $G gt.eq
    1$, and put $U = S union T$. Suppose that the following conditions hold.]
  + #emph[There is $chi in \[ 0 \, 1 \)$ with two insertion bounds.
    In the reference system, inserting any coordinate $i in U$ from $P_i$ satisfies all reference checks incident
    to $i$ with probability at least $1 - chi$. In the proposal system of either change,
    inserting a whole factor from $Pi_(S \, i)$ or $Pi_(T \, i)$ satisfies all checks of that proposal incident to
    its carried coordinates with probability at least $1 - chi$.
    Each bound is uniform in every fixed choice of the other individually permitted coordinates of the respective
    system, and remains valid after deleting checks or coordinates as specified above.]
  + #emph[There are decompositions $S = C_S union.sq F_S$ and $T = C_T union.sq F_T$, with $F_S ∩ T = F_T ∩ S =
    diameter$. No coordinate carried by an $F_S$ factor has a check with any coordinate carried by a $T$ factor,
    or with the original primary coordinates indexed by $T$; the corresponding assertion holds with $S \,
    T$ interchanged. The reference coordinates in $F_S \, F_T$ also have no mutual checks.]
  #emph[Then
#[#set math.equation(numbering: n => "(9.9)")
 $ integral L_S L_T thin upright(d) lambda lt.eq G^(\| S ∩ T \|) \( 1 - chi \)^(- 2 \( \| C_S \| + \| C_T \| \)) .
   $ <cmp:cancellation-bound>]

 It is enough that the assumptions hold for almost every fixed admissible configuration outside $U$.]
] <lem:cancellation>

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
  #[#set math.equation(numbering: n => "(9.10)")
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
  #[#set math.equation(numbering: n => "(9.11)")
   $ Z_U & gt.eq a_chi^c Z_(F_S) Z_(F_T) \,\
Z_S & lt.eq Z_(F_S) \, wide Y_S gt.eq a_chi^(\| C_S \|) Y_(F_S) \,\
Z_T & lt.eq Z_(F_T) \, wide Y_T gt.eq a_chi^(\| C_T \|) Y_(F_T) . $ <cmp:union-normalizer>]
  For the first inequality, the reference integral over the two far sets factorizes.
    The remaining distinct coordinates form $U \\ \( F_S union F_T \)$,
    a subset of $C_S union C_T$ with cardinality at most $c$.
    Insert them one at a time with the uniform compatibility bound.
    For the upper bound on $Z_S$, delete the checks involving $C_S$ and integrate those reference coordinates
    freely. Coordinates in $T \\ S$ have no checks with the far set.
    For its proposal lower bound, start with the reduced $F_S$ integral and add the $C_S$ factors.
    The fixed original coordinates in $T \\ S$ still do not meet the far factors.
    An auxiliary instance carried by a retained factor remains integrated there,
    even if a newly inserted factor carries its primary label; only the checks of the $S$ proposal are restored.
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
    by (9.8). Therefore
  #[#set math.equation(numbering: n => "(9.12)")
   $ integral H_S H_T upright(bold(1))_(upright("admissible")) product_(i in U) P_i \( thin upright(d) x_i \)
     lt.eq Y_(F_S) Y_(F_T) G^(\| S ∩ T \|) . $ <cmp:kernel-product>]
  The conditional reference law on $U$ has normalizer $Z_U$. Combine (9.10)–(9.12).
    The two pointwise ratio bounds contribute $a_chi^(- c) Z_(F_S) Z_(F_T) \/ \( Y_(F_S) Y_(F_T) \)$;
    division by $Z_U$ contributes at most $a_chi^(- c) \/ \( Z_(F_S) Z_(F_T) \)$.
    All four far normalizers cancel, leaving $G^(\| S ∩ T \|) a_chi^(- 2 c)$.
    Finally integrate the outside coordinates. This proves (9.9). ◻
]

=== 9.5 The likelihood cost is confined to encounters <the-likelihood-cost-is-confined-to-encounters>

Fix the data, the route and the selected labels. Regard either copy as the primary one.
  The reference for that copy is $lambda_(cal(I)) ⊗ P_(*)$,
  where $P_(*)$ is the uniform law of the extra point in its endpoint cell. Let

$ S = { i_0 \, dots.h \, i_(d - 1) } union { * } . $

In Lemma 36, a primary coordinate is the chosen copy’s path or endpoint extra point.
  Its auxiliary coordinates are the other copy’s path or extra point through the same midpoint.
  The checks are the collision exclusions within each copy;
  there is no collision check between paths in different copies.
  Index a vertex factor by its primary label, using $*$ for the extra point;
  its center is its midpoint cell $z_k$. The two paths in one factor may have different labels,
  and each copy contributes at most one path. The allowed set for each path consists of the regular, confined,
  frozen-avoiding paths with its own recorded endpoints. Each extra point lies in its target cell.
  These are individual restrictions; the remaining collision checks still couple different factors.

By Proposition 29, the primary marginal of each path factor has density at most $G$ relative to $P_i$,
  and integrates to one. For the extra point the density is $upright(bold(1))_(A_k) \/ \|
  A_k \|$ relative to $P_(*)$, which is at most $1 \/ 0.98$.
  Enlarge the fixed $G$ to be at least two, covering this factor as well.
  These marginal densities and their auxiliary kernels depend on the exposed data and the route and label choices;
  they do not depend on the unselected unexposed paths.

The union bound proving Equation (9.6) verifies hypothesis (i) for each proposal factor.
  The same argument with $P_i$ in place of $Pi_i^(A_k)$ verifies it for insertion of a selected reference path,
  by Proposition 29. The reference extra point has no checks.
  These estimates are uniform over all individually permitted opponent paths,
  whether or not their labels are accessible, and deleting checks can only improve them.
  Thus the bound remains available for every reduced normalizer in Lemma 36.

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
  Lemma 36.

For clarity, a reduced far proposal retains exactly the paths carried by its far vertex factors and the fixed
  paths outside $S union T$. It deletes the omitted near factors in both copies.
  It does not put their original trajectories back as unselected obstacles.
  With this convention all the normalizers in (9.11)–(9.12) are the ones arising from the present construction.

Write $L_S \, L_T$ for the two primary likelihoods. If

$ J_R = \# { \( j \, k \) : d_oo \( z_j \, z'_k \) lt.eq R } \, $

then $\| C_S \| + \| C_T \| lt.eq 2 J_R$. Lemma 36 gives, at the fixed data,

#[#set math.equation(numbering: n => "(9.13)")
 $ integral L_S L_T thin upright(d) \( lambda_(cal(I)) ⊗ P_(*) \) lt.eq
   G^(\| S ∩ T \|) \( 1 - chi_D \)^(- 4 J_R) . $ <cmp:two-choice-bound>]

In particular, no factor is paid for a long portion of one route that stays away from the other.

=== 9.6 Averaging labels and forgetting the paths <averaging-labels-and-forgetting-the-paths>

Condition on the data and the two lattice paths before choosing their labels.
  Each common departure cell has at least $M \/ 2$ accessible labels.
  The two uniform choices at that cell match with probability at most $2 \/ M$,
  and the match events are independent between distinct common cells.
  Real labels anchored at different cells cannot agree. The shared extra point contributes one factor $G$, so

#[#set math.equation(numbering: n => "(9.14)")
 $ bb(E)_(upright("labels")) G^(\| S ∩ T \|) lt.eq G exp (frac(2 \( G - 1 \), M) J_R) . $ <cmp:label-average>]

Choose the fixed integer $M$ sufficiently large for the good-site supply and for

#[#set math.equation(numbering: n => "(9.15)")
 $ frac(2 \( G - 1 \), M) lt.eq kappa / 2 . $ <cmp:M-choice>]

Then increase $D_(*)$ so that, for every $D gt.eq D_(*)$ in the allowed $alpha$ window, all earlier estimates hold and

#[#set math.equation(numbering: n => "(9.16)")
 $ - 4 log \( 1 - chi_D \) lt.eq kappa / 2 \, wide G_D / D gt.eq frac(ell, 8 M) . $ <cmp:D-choice>]

The first requirement is possible by (9.6); the second follows once $ell D \/ \( 4 M \) gt.eq 2$.
  These choices do not change $G$, $kappa$, or $C_(upright("path"))$.

The following use of an averaged likelihood and a two-route second moment also occurs in the point-reassignment
  argument of Peres and Sly #cite(label("PeresSly2014")) Proposition 2.1.
  Here Lemma 36 supplies the additional conditional-normalizer estimate required by the hard-core path law.

Let $overline(L)$ be the likelihood averaged over the conditional route and label choices,
  with value zero off $cal(E)_(v w)$. Tonelli’s theorem expresses its square integral using two independent such
  choices. Combining (9.13)–(9.16) and the annealed encounter bound in Proposition 30 gives

#[#set math.equation(numbering: n => "(9.17)")
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
  Now apply the observation kernel that orders the bath and retains $cal(B) \, x \, y \, X'$,
  and forget the tag and all the paths. If a finite measure has density $f$ relative to a reference $P$,
  the density after applying a common kernel is the conditional average of $f$ in the corresponding joint
  reference measure. Conditional Cauchy–Schwarz bounds its squared integral by $integral f^2 thin upright(d) P$.
  This remains valid for finite reference measures, by normalization when their mass is nonzero.

For either primary copy, the resulting measure is the common observed $hat(nu)$ already constructed.
  Its corresponding reference is precisely $hat(P)_g$ or $hat(Q)_g$. We have proved

#[#set math.equation(numbering: n => "(9.18)")
 $ integral (frac(thin upright(d) hat(nu), thin upright(d) hat(P)_g))^2 thin upright(d) hat(P)_g lt.eq C_2 \, wide
   integral (frac(thin upright(d) hat(nu), thin upright(d) hat(Q)_g))^2 thin upright(d) hat(Q)_g lt.eq
   C_2 . $ <cmp:observed-second-moments>]

Together with (9.7), Lemma 34 now gives

#[#set math.equation(numbering: n => "(9.19)")
 $ "Aff" \( hat(P)_g \, hat(Q)_g \) gt.eq frac(1, 4 C_2) . $ <cmp:one-group-gain>]

This lower bound is uniform in the group index and in every admissible ordered pair of cells.

#proof[
  With the fixed choices above, set
  #[#set math.equation(numbering: n => "(9.20)")
   $ c_(*) := frac(upsilon ell, 32 M G C_(upright("path"))) > 0 \, wide upsilon = 1 / 2000 . $ <cmp:c-star>]
  For large $K$, at least $upsilon V^2$ ordered cell pairs meet the displacement condition of Proposition 30.
    For each such pair, Lemma 35, (9.16) and (9.19) give
  $ "Aff" \( P_(v w) \, Q_(v w) \) gt.eq frac(G_D, 4 D C_2) gt.eq frac(ell, 32 M C_2) . $
  Sum these nonnegative contributions in (9.3) to obtain $B_(upright("occ")) gt.eq upsilon ell \/ \( 32 M C_2 \)$,
    which is (9.20). Every estimate used above is uniform over the stated temperature interval.
    The volume threshold is locally uniform for $D$ in compact subintervals of $\[ D_(*) \, oo \)$, by the slab,
    bridge and group estimates and Proposition 30. No parameter entering $c_(*)$ is chosen after $D_(*)$,
    so increasing $D_(*)$ does not change the occupation bound.
  For completeness, the choices leading to this bound have no circular dependence.
    Fix the lattice radius $R = 30$ and its bad-site tolerance from Proposition 30.
    Make the spatial choices of large $alpha_0$, then $ell \, theta$ and small $b$ as in Sections 3 and 4.
    Choose a sufficiently small target certificate-failure base $p_1$.
    Proposition 17 then allows $H_1$ to be fixed before choosing a sufficiently small positive $t$,
    also meeting the deterministic bridge requirements. This fixes the density bound $G$.
    Choose $M$ large enough for the group supply and (9.15); finally choose $D_(*)$ large enough for all
    small-scale requirements and (9.16). The required lower bound on $K$ is imposed afterwards.
    In particular $beta gt.eq D$ is the only temperature restriction; no condition relates $beta$ to the volume. ◻
]

The remaining step is the return to fixed physical density and temperature.

== 10 Return to fixed physical parameters <sec:physical>

We now prove Theorem 1 from the scaled estimate. This step also makes explicit why the temperature remains
  positive throughout the thermodynamic limit.

Let $alpha_0 \, D_(*) \, c_(*)$ be furnished by Theorem 2. For a fixed exclusion distance $a > 0$, set

$ rho_(*) \( a \) = frac(alpha_0^3, 4 D_(*)^2 a^3) . $

Fix $0 < rho < rho_(*) \( a \)$ and define

#[#set math.equation(numbering: n => "(10.1)")
 $ s_oo = sqrt(frac(alpha_0, a rho)) \, wide D_oo = alpha_0^(3 \/ 2) / sqrt(rho a^3) \, wide T_(upright("phys")) =
   frac(1, 4 s_oo^2 D_oo) > 0 . $ <eq:physical-temperature>]

These are fixed numbers depending on $a \, rho$, and the constants of the proof. In particular, $D_oo > 2 D_(*)$.

Consider any sequence $L arrow.r oo$, $N \/ L^3 arrow.r rho$. Choose

$ K = ⌊sqrt(frac(a N, alpha_0 L))⌋ \, wide s = L \/ K \, wide D = N \/ K^3 \, wide r = a \/ s . $

Then $K arrow.r oo$ and

$ s arrow.r s_oo \, wide D arrow.r D_oo \, wide D r = frac(a N, L K^2) arrow.r alpha_0 . $

Thus the scaled core has the required form $r = alpha \/ D$ with $alpha
  in \[ alpha_0 \/ 2 \, 2 alpha_0 \]$ eventually. Under the unitary dilation $x = s tilde(x)$,
  the Hamiltonian becomes $s^(- 2) H_N$ on $Lambda_K$, and the canonical Gibbs state has scaled temperature $T =
  s^2 T_(upright("phys"))$. Since

$ D T = D s^2 T_(upright("phys")) arrow.r 1 / 4 \, $

we have $0 < T lt.eq D^(- 1)$ eventually. The local uniformity of the volume threshold in Theorem 2 applies
  because $D$ remains in a compact neighborhood of $D_oo$.

The dilation sends $u_(0 \, L)$ to $u_0$ and preserves the occupation fraction.
  Hence Theorem 2 gives, eventually along every such sequence,

$ frac(chevron.l u_(0 \, L) \, gamma_(N \, L \, T_(upright("phys")))^(\( 1 \)) u_(0 \, L) chevron.r, N) gt.eq c_(*) . $

Taking the lower limit proves Theorem 1. $square.stroked.tiny$

#bibliography("refs.bib", style: "ieee", title: [References])
