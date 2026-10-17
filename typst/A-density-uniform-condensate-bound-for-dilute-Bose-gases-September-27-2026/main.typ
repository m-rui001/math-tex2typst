#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A density-uniform condensate bound for dilute Bose gases]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 The model and the uniform bound <sec:introduction>

For a homogeneous gas, Bose–Einstein condensation means that one orbital contains a positive fraction of all particles in the equilibrium state. We consider the spatially constant orbital and keep both the physical interaction and a positive density fixed as the volume grows. The bound below uses the same positive fraction throughout a sufficiently dilute interval of densities.

Let $v : bb(R)^3 arrow.r \[ 0 \, oo \)$ be bounded, measurable, radial, and supported in a ball of finite radius, with $v$ not zero almost everywhere. On the torus $Lambda_L = \( bb(R) \/ L bb(Z) \)^3$, of volume $V = L^3$, let $v_L \( x \) = sum_(k in bb(Z)^3) v \( x + L k \)$ and define

$ H_(N \, L) = - sum_(i = 1)^N Delta_i + sum_(1 lt.eq i < j lt.eq N) v_L \( x_i - x_j \) quad upright("on ") L_(upright("sym"))^2 \( Lambda_L^N \) . $

The units are $ℏ^2 \/ \( 2 m_(upright("particle")) \) = k_B = 1$. At $T > 0$, the state is the canonical Gibbs state $Gamma_(N \, L \, T) = e^(- H_(N \, L) \/ T) \/ "Tr" e^(- H_(N \, L) \/ T)$; at $T = 0$, it is the ground state. Write $gamma_(N \, L \, T)^(\( 1 \))$ for its one-particle density matrix, normalized to trace $N$, and put $u_0 = V^(- 1 \/ 2)$.

#thm([Theorem 1.1.])[
  #emph[For every potential $v$ as above there are constants $rho_(*) \( v \) > 0$ and $c_(*) \( v \) > 0$ with the following property. For every $0 < rho < rho_(*) \( v \)$ there is $L_0 \( rho \, v \) < oo$ such that, for every $L gt.eq L_0 \( rho \, v \)$, every integer $N gt.eq 1$ satisfying $rho \/ 2 lt.eq N \/ L^3 lt.eq 2 rho$, and every $0 lt.eq T lt.eq rho^2$, 
$ frac(chevron.l u_0 \, gamma_(N \, L \, T)^(\( 1 \)) u_0 chevron.r, N) gt.eq c_(*) \( v \) . $

 Consequently, for each such fixed density $rho$ and fixed $0 lt.eq T lt.eq rho^2$, every sequence with $L arrow.r oo$ and $N \/ L^3 arrow.r rho$ has lower limiting condensate fraction at least $c_(*) \( v \)$.]
] <thm:main>

The volume threshold may depend on the density; the condensate lower bound does not. The Hamiltonian is the exact interacting Hamiltonian, and its potential is not rescaled with the number of particles. The conclusion is macroscopic occupation of the constant orbital with a positive lower bound throughout the admitted dilute interval. The zero-temperature state is unambiguous: positivity of the finite-volume heat kernel gives a unique bosonic ground state, as shown at the end of the proof.

=== 1.1 Context and antecedents <context-and-antecedents>

The ideal-gas theory begins with Bose’s counting of light quanta #cite(label("Bose1924")) and Einstein’s extension to a monatomic ideal gas, including the condensation prediction in his second paper #cite(label("Einstein1924IdealGas")) #cite(label("Einstein1925IdealGas")). Bogoliubov’s treatment of weakly interacting bosons introduced an approximate quasiparticle description based on macroscopic occupation of one mode #cite(label("Bogolubov1947")).

For interacting particles, Penrose and Onsager formulated condensation through a macroscopic eigenvalue of the one-particle density matrix and applied this viewpoint to liquid helium #cite(label("PenroseOnsager1956")). Yang developed the broader framework of off-diagonal long-range order, covering Bose condensation and fermion pairing #cite(label("Yang1962ODLRO")). These criteria identify the order to be proved; establishing it for a specified interacting Hamiltonian remains a separate mathematical problem.

Rigorous lattice antecedents include Dyson, Lieb, and Simon’s low-temperature long-range order for the spin-$1 / 2$ nearest-neighbor quantum XY model on the simple cubic lattice in dimensions $d gt.eq 3$ #cite(label("DysonLiebSimon1978")), and Kennedy, Lieb, and Shastry’s ground-state long-range order for all spins on hypercubic lattices in dimensions $d gt.eq 2$ #cite(label("KennedyLiebShastry1988XY")). For spin-$1 / 2$, the spin–hard-core-boson correspondence relates these results to condensation of half-filled lattice bosons. Passing to a continuum Hamiltonian with a fixed interaction and a prescribed density requires additional arguments.

The distinction between the thermodynamic and Gross–Pitaevskii limits is essential. Lieb and Seiringer proved complete condensation in the Gross–Pitaevskii limit, with the interaction scaled so that $N a$ remains fixed, where $a$ is the scattering length #cite(label("LiebSeiringer2002BEC")). Deuchert and Seiringer subsequently treated positive-temperature homogeneous gases with scattering length $a_N = a_v L \/ N$, where $a_v$ is the scattering length of the unscaled potential, and controlled the one-particle density matrix of approximate Gibbs minimizers #cite(label("DeuchertSeiringer2020GP")). These results allow the interaction scale to vary with particle number. The problem considered here instead fixes the potential and a positive density before taking the volume to infinity.

The limits between Gross–Pitaevskii scaling and a fixed-density thermodynamic limit have several forms. Brennecke, Brooks, Caraci, and Oldenburg proved complete ground-state condensation in the Gross–Pitaevskii regime and beyond #cite(label("BrenneckeBrooksCaraciOldenburg2025")). Fournais treated low-energy states on growing boxes in a joint dilute and increasing-volume limit #cite(label("Fournais2021")) Theorem 1.2. Chong, Liang, and Nam gave simpler proofs of low-energy condensation using kinetic localization and Poincaré-type inequalities #cite(label("ChongLiangNam2026")). For the unit-box interaction $N^(2 - 2 kappa) v \( N^(1 - kappa) x \)$, rescaling to a fixed potential gives density $N^(3 kappa - 2)$; the regimes $kappa < 2 \/ 3$ therefore couple dilution to increasing particle number. Junge’s low-temperature canonical Gibbs-state result uses Neumann boxes whose size remains coupled to the dilute limit #cite(label("Junge2026Propagation")) Corollary 6.

The thermodynamic energy problem has a separate history. Dyson’s hard-sphere bounds and the leading dilute asymptotics of Lieb and Yngvason established the first-order energy scale #cite(label("Dyson1957")) #cite(label("LiebYngvason1998")). The next correction was predicted by Lee, Huang, and Yang’s pseudopotential calculation #cite(label("LeeHuangYang1957")). Fournais and Solovej proved the corresponding lower bound for nonnegative radial finite-range potentials, including hard cores #cite(label("FournaisSolovej2023")) Theorems 1.1 and 1.3; recent upper bounds attain the same coefficient for hard spheres and for general nonnegative even finite-range potentials #cite(label("BastiEtAl2026HardSpheres")) #cite(label("BastiEtAl2026GeneralPotentials")). These energy results, and low-temperature free-energy estimates for strong potentials #cite(label("FournaisEtAl2026StrongFreeEnergy")), do not by themselves determine occupation of a single orbital: the one-particle kinetic gap tends to zero as the volume grows.

A distinct thermodynamic-limit result appears in Sütő’s two-step preprint #cite(label("Suto2023TwoStep")). Its Theorem 1.2 assumes nonnegativity both of the potential and of its Fourier transform, together with integrability, a Fourier-moment condition, and spatial decay, and states condensation above a temperature-dependent density threshold. Fourier positivity is an additional restriction: for example, a nonnegative spherical square barrier has a Fourier transform that changes sign. That result therefore does not cover all bounded nonnegative radial finite-range potentials, and its fixed-temperature threshold does not alone provide the joint low-density and low-temperature uniformity sought here.

Galanda and Pinamonti construct algebraic equilibrium states with a condensate background under quantitative convergence conditions for a spatially localized interaction #cite(label("GalandaPinamonti2025Equilibrium")) Theorem 6.8. Their subsequent analysis treats renormalized correlation functions in Gross–Pitaevskii scaling, with a zero-temperature limit in its final convergence theorem #cite(label("GalandaPinamonti2026GP")) Theorem 7.3. These constructions use a different state formulation and coupled interaction, regulator, and temperature limits from the fixed-potential canonical thermodynamic limit considered here.

The trajectory formulation descends from Feynman’s treatment of the Bose gas #cite(label("Feynman1953AtomicLambda")); for the canonical Feynman–Kac representation and its symmetrization and one-particle normalizations, see #cite(label("Ueltschi2006FeynmanCycles")) Appendix A. The random-path comparison has a different ancestry. Benjamini, Pemantle, and Peres constructed paths with exponentially decaying intersection tails #cite(label("BenjaminiPemantlePeres1998")). Häggström and Mossel developed a hierarchical random-drift construction with low predictability; its independent block variables are a close antecedent of the dyadic velocities used below #cite(label("HaggstromMossel1998")) Section 3, Proposition 3.1. Abbe, Massoulié, Montanari, Sly, and Srivastava used finite-endpoint path averages and overlap estimates for group synchronization #cite(label("AbbeMassoulieMontanariSlySrivastava2018")); Garban and Spencer used this approach for classical disordered-spin symmetry breaking along the Nishimori line #cite(label("GarbanSpencer2023")). Here the finite cell paths, their thickened intersection estimates, and the continuum bridge comparison require separate proofs.

=== 1.2 How the comparison works <how-the-comparison-works>

Let $q_0 = chevron.l u_0 \, gamma^(\( 1 \)) u_0 chevron.r \/ N$. The Feynman–Kac formula expresses the partition function by positive weights on closed collections of paths. Replacing one matching endpoint by an independently integrated spatial point gives a positive measure $mu$ of total mass $q_0$. We construct a measure $nu$ by changing a short portion of closed paths, with mass at least a fixed $a > 0$, and show that its density $f = thin upright(d) nu \/ thin upright(d) mu$ has bounded second moment. Cauchy–Schwarz then gives

$ a^2 lt.eq q_0 integral f^2 thin upright(d) mu . $

Thus the main problem is a comparison of positive path measures.

Partition space into cells of side $s$ comparable to $rho^(- 1 \/ 2)$, and change paths only during a time interval of length $delta = s^2$. The mean count $m = N s^3 \/ V$ is comparable to $rho^(- 1 \/ 2)$, making many particle choices available in a typical cell as the density decreases, while the slab remains short compared with $1 \/ T$ throughout the positive-temperature range.

The local analysis must control simultaneous failures in specified families of cells. Energy and entropy estimates first give occupation tails and separation of most endpoints at the shorter scale $r = zeta rho^(- 1 \/ 3)$, with $zeta > 0$ fixed and small. A particle is eligible when its endpoints are separated, its path stays near them during short initial and final time intervals, and it satisfies overall confinement and integrated interaction-score bounds for the path ensemble. The interacting bridges are not independent. A separate localized partition-function comparison bounds their joint trajectory failures, with a cost proportional to the volume of the tested cells. Together with the one-time estimates and score bounds, this makes specified sets of unusable cells unlikely.

Between two distant cells, choose a random lattice path, called a skeleton, whose encounters with an independent copy have bounded exponential moments. Here an encounter records a vertex within a fixed cell distance of the other path; a second estimate weights all vertices by exponentially decaying distance. These two geometric bounds are established independently of the gas in Section 8.1. Detour around unusable components. Select one eligible particle from each cell on the resulting simple path, and cyclically reassign their starting points. One end is opened and the selected bridges are sampled from their exactly normalized interacting law. This defines $nu$.

The second moment involves two independently chosen paths in related configurations. Estimating both changes against the original closed configuration would incur a cost proportional to their lengths. Instead, a reverse insertion supplies a baseline in which contributions far from encounters cancel. Two effects remain small as $rho$ decreases: an encounter of distinct separated bridges has interaction cost tending to zero at rate $r^(- 1 \/ 2)$, and coincident particle choices have probability of order $1 \/ m$.

Changing trajectories also changes which cells are usable and which particles are eligible, so the two routes cannot be treated as independent of the gas. A stricter cell test in the reverse configuration controls these changes: away from encounters the selection weights agree, while rare components give a controlled list of possible detours. Keeping those selection weights throughout the comparison yields the required second-moment bound after averaging over the environment and the two paths.

Sections 3–7 prove the local analytic bounds. Section 8 constructs the paths and detours. Section 9 defines the change of measure, and Section 10 proves its second-moment estimate with all normalizations and selection constraints retained. Section 11 fixes the parameters in order and passes the uniform positive-temperature bound to zero temperature.

== 2 Scales and conventions <sec:setup>

We use the Hamiltonian of Section 1 also on labelled coordinates, and suppress $L$ when it is fixed. We choose an everywhere nonnegative bounded Borel radial representative of $v$ vanishing outside its range ball. Changing this representative on a null set changes neither the operator nor the path integrals: at interior times the free relative positions have densities. Write $R_v$ for a range bound, and use $parallel v parallel_1 \, parallel v parallel_oo$ on $bb(R)^3$. In formulas on the torus, $v$ abbreviates its periodization $v_L$; infinite-space norms always refer to the original potential.

The orthogonal symmetrizer is included exactly once in a trace kernel. If $k_t$ is the labelled $N$-particle kernel, then

$ k_t^(upright("sym")) \( X \, Y \) = frac(1, N !) sum_(pi in frak(S)_N) k_t \( X \, pi Y \) \, #h(2em) Z_N = integral k_beta^(upright("sym")) \( X \, X \) thin upright(d) X . $

Thus integration over labelled coordinates carries no further factorial. We work with $rho \/ 2 lt.eq N \/ V lt.eq 2 rho$, $0 < T lt.eq rho^2$, and $beta = T^(- 1)$. Every volume restriction below is imposed at fixed $rho$, uniformly over this temperature interval. Constants $C \, c > 0$ may change between occurrences and depend on $v$ and previously fixed cutoffs, but not on $rho \, L \, N \, T$. The final order of those cutoff choices is recorded in Section 11.

We use a periodic grid $cal(G) = \( bb(Z) \/ n bb(Z) \)^3$ of equal cubes (fix the assignment at faces), with

$ n = ⌊frac(L, K rho^(- 1 \/ 2))⌋ \, #h(2em) s = L \/ n in \[ K rho^(- 1 \/ 2) \, 2 K rho^(- 1 \/ 2) \] \, #h(2em) M = n^3 \, quad m = N \/ M . $

Here $K gt.eq 1$ is a fixed large constant chosen below. Thus $rho s^3 \/ 2 lt.eq m lt.eq 2 rho s^3$.

A union $U$ of $u gt.eq 1$ cells has volume $\| U \| = u s^3$. A neighborhood out to distance $h s$, $h gt.eq 0$, can be covered by at most $C \( h + 2 \)^3 u$ cells, including on the torus. Physical distances $d \( dot.op \, dot.op \)$ are Euclidean torus distances unless indicated otherwise. Cell index distances will use the periodic sup norm. For a function $p$ of position put $n_p \( X \) = sum_i p \( x_i \)$ on configurations (also the multiplication operator); similarly $n_U$ for counting particles in $U$.

== 3 Energy and free-energy estimates <sec:local-energy>

This section gives the particle-number costs needed to localize the gas. Throughout, $0 < T lt.eq rho^2$, $beta = T^(- 1)$, and $rho \/ 2 lt.eq N \/ V lt.eq 2 rho$. All statements hold after decreasing a potential-dependent upper bound on $rho$ and increasing the volume threshold at each fixed density. The Hamiltonian with a bounded external potential $- W$ is denoted by $H_(j \, L)^(\( - W \))$; its symmetric partition function and free energy are $Z_j^(\( - W \))$ and $F_j^(\( - W \)) = - T log Z_j^(\( - W \))$. We set $Z_0 = 1$ and $F_0 = 0$. For a trace-one state $sigma$, write $cal(F)^(\( - W \)) \( sigma \) = "Tr" H^(\( - W \)) sigma - T S \( sigma \)$. Here $S \( sigma \) = - "Tr" \( sigma log sigma \)$ is the von Neumann entropy, with $0 log 0 = 0$. Constants may depend on $v$, and later on already fixed dimensionless parameters, but never on $rho \, L \, N \, T$.

#thm([Lemma 3.1.])[
  (A Neumann cell bound).  #emph[There are $b_0 \, c_v > 0$, depending only on the fixed potential, such that for a cube $Q$ of side $b gt.eq b_0$, every $y in Q$, and every $f in H^1 \( Q \)$, 
#[#set math.equation(numbering: n => "(1)")
 $ integral_Q #scale(x: 120%, y: 120%)[\(] \| nabla f \|^2 + v \( x - y \) \| f \|^2 #scale(x: 120%, y: 120%)[\)] thin d x gt.eq c_v b^(- 3) integral_Q \| f \|^2 thin d x . $ <eq:1>]

 The same conclusion holds for fixed positive coefficients in front of the two terms, with changed constants. Consequently, for disjoint cubes $Q$ of common side $b$, kinetic energy plus nonnegative pair energy bounds below the multiplication operator 
#[#set math.equation(numbering: n => "(2)")
 $ c_v b^(- 3) sum_Q n_Q upright(bold(1))_({ n_Q gt.eq 2 }) . $ <eq:2>]

 Both statements apply to torus cubes smaller than the torus, and to Dirichlet states extended by zero.]
] <lem:neumann-cell>

#proof[
  Choose $nu > 0$ for which the radial set $A = { x : v \( x \) gt.eq nu }$ has positive measure. Increase $b_0$ so that $b_0 \/ 2 > R_v$ and $b_0 gt.eq 1$. For each $y in Q$ choose, independently in the three coordinate directions, an orientation with available length at least $b \/ 2$. The resulting octant of $y + A$ lies in $Q$ and has measure $\| A \| \/ 8 = : a_v > 0$ by radial symmetry. Call it $A_y$. For $f_0 = \| Q \|^(- 1) integral_Q f$, the scale-invariant Sobolev–Poincaré inequality gives $parallel f - f_0 parallel_6 lt.eq C parallel nabla f parallel_2$. Thus
  $ a_v \| f_0 \|^2 lt.eq 2 integral_(A_y) \| f \|^2 + 2 integral_(A_y) \| f - f_0 \|^2 lt.eq 2 nu^(- 1) integral_Q v \( x - y \) \| f \|^2 + C a_v^(2 \/ 3) integral_Q \| nabla f \|^2 . $
  Moreover $parallel f - f_0 parallel_2^2 lt.eq C b^2 parallel nabla f parallel_2^2$. Since $b^2 lt.eq b^3$ for $b gt.eq 1$, these estimates give (1). Positive fixed energy coefficients only change the constants.
  For (2), cut configuration space according to the cube containing each coordinate and discard cross-cube interactions. This is Neumann bracketing: the restrictions of an $H^1$ function to the pieces are admissible with no boundary condition at the cuts. Within a cube containing $j gt.eq 2$ coordinates, pair them disjointly. For each pair apply (1) in the first coordinate with the other coordinate held fixed, and then integrate the other coordinates. No coordinate kinetic term or pair interaction is used twice. The number of pairs is $floor.l j \/ 2 floor.r gt.eq j \/ 3$. Summing the resulting inequalities proves (2). The argument is unaffected by additional nonnegative periodic images of $v$. Zero extension gives the Dirichlet assertion. ◻
]

#thm([Lemma 3.2.])[
  (An entropy bound).  #emph[If $Omega$ is an open subset of the torus with Dirichlet kinetic energy, or the full torus with periodic kinetic energy, then for every $alpha > 0$ and every finite-energy symmetric trace-one $j$-particle state, 
#[#set math.equation(numbering: n => "(3)")
 $ alpha "Tr" #scale(x: 180%, y: 180%)[\(] sum_(i = 1)^j - Delta_i #scale(x: 180%, y: 180%)[\)] sigma - T S \( sigma \) gt.eq - T j - C_alpha T \| Omega \| \( V^(- 1) + T^(3 \/ 2) \) . $ <eq:3>]

 In particular a state of finite kinetic energy has finite entropy.]
] <lem:kinetic-entropy>

#proof[
  The periodic heat kernel satisfies $K_t \( 0 \) lt.eq C \( V^(- 1) + t^(- 3 \/ 2) \)$ by its Gaussian image sum, or equivalently by its Fourier series. Killing at $partial Omega$ decreases its diagonal, so $"Tr" e^(t alpha Delta_Omega) lt.eq C_alpha \| Omega \| \( V^(- 1) + t^(- 3 \/ 2) \)$. The ideal Bose grand partition function with fugacity $e^(- 1)$ has logarithm
  $ sum_(l gt.eq 1) e^(- l) / l "Tr" e^(l beta alpha Delta_Omega) lt.eq C_alpha \| Omega \| \( V^(- 1) + T^(3 \/ 2) \) . $
  Its $j$-particle term is $e^(- j)$ times the canonical partition function. Applying the Gibbs variational inequality to that term gives (3). For an arbitrary finite-energy state, the same inequality follows first on finite spectral truncations and then by monotone entropy approximation, or directly from nonnegativity of relative entropy to the ideal Gibbs state. The right side is finite, proving the entropy assertion as well. ◻
]

#thm([Proposition 3.3.])[
  (Particle-number free-energy bounds).  #emph[Uniformly in the temperature range under consideration, 
#[#set math.equation(numbering: n => "(4)")
 $ F_N & gt.eq c_v rho N \,\
F_(N + k) & gt.eq F_N + c_v rho k #h(2em) \( k gt.eq 0 \) . $ <eq:4>]

 For every bounded $W gt.eq 0$, with no upper bound on its size required, 
#[#set math.equation(numbering: n => "(6)")
 $ F_j^(\( - W \)) - F_(j - 1)^(\( - W \)) lt.eq C_v rho #h(2em) \( 1 lt.eq j lt.eq 4 rho V \) . $ <eq:6>]

 The constant in (6) is independent of $W$.]
] <prop:increments>

#proof[
  Partition the torus into equal cubes of side in $\[ b \, 2 b \]$, where $b = \( 4 \/ rho \)^(1 \/ 3)$. The number of cubes is at most $V \/ b^3 = rho V \/ 4 lt.eq N \/ 2$ when $L$ is sufficiently large. Reserve a fixed fraction of kinetic energy for (3), and apply (2) to the rest of the kinetic energy and the interaction. Since $sum_Q n_Q upright(bold(1))_({ n_Q gt.eq 2 }) gt.eq N - \# { Q } gt.eq N \/ 2$, the energy contribution is at least $c_v rho N$. The entropy loss is bounded by $T N + C T \( 1 + V T^(3 \/ 2) \)$. Divided by $rho N$, these terms tend uniformly to zero as $rho arrow.b 0$ and the volume threshold increases: $T \/ rho lt.eq rho$, $T \/ \( rho N \) lt.eq rho \/ N$, and $V T^(5 \/ 2) \/ \( rho N \) lt.eq 2 rho^3$. This proves (4), after changing $c_v$.
  We next show that $F_j \/ j$ is nondecreasing in $j gt.eq 1$. Regard a symmetric $j$-particle state as a state on the labeled tensor product and denote by $S_i$ the entropy of its trace-one $i$-particle marginal; put $S_0 = 0$. Strong subadditivity #cite(label("LiebRuskai1973Entropy")) Theorem 2 and Section IV applied to two overlapping $i$-coordinate subsystems with overlap of size $i - 1$ gives $2 S_i gt.eq S_(i - 1) + S_(i + 1)$. The case $i = 1$ uses ordinary subadditivity. Permutation symmetry identifies the marginals occurring here. Therefore $S_i$ is concave and $S_j \/ j lt.eq S_(j - 1) \/ \( j - 1 \)$ for $j gt.eq 2$. The one-body energy per particle is unchanged by passage to the $\( j - 1 \)$-particle marginal. The pair energy per particle decreases, because its coefficient is $\( j - 1 \) \/ 2$ before passage and $\( j - 2 \) \/ 2$ afterwards, and the common two-body expectation is nonnegative; for $j = 2$ the latter energy is zero. The marginal remains supported on the symmetric subspace. Applying these observations to the Gibbs state and then using its marginal as a variational state proves $F_j \/ j gt.eq F_(j - 1) \/ \( j - 1 \)$. All entropies are finite by (3). Consequently $F_(N + k) gt.eq \( N + k \) F_N \/ N$, which with (4) proves (5).
  The lower increments now quantify the free-energy gain from adding particles. To obtain the complementary upper cost, uniformly even in an attractive external field, we insert one particle directly in the path representation.
  Retain in the symmetrized Feynman–Kac formula only those permutations in which the extra label is fixed. There are $\( j - 1 \) !$ such permutations against the factor $1 \/ j !$. The added particle is a free torus loop whose start is integrated over the torus. After normalization by $V K_beta \( 0 \)$ its position at every time is uniform, independently of all old trajectories. Thus its expected total interaction with the old paths is $beta \( j - 1 \) parallel v parallel_1 \/ V$. Its external weight is at least one because $W gt.eq 0$. Jensen’s inequality, conditional on all old paths, gives
  $ Z_j^(\( - W \)) gt.eq frac(V K_beta \( 0 \), j) e^(- beta \( j - 1 \) parallel v parallel_1 \/ V) Z_(j - 1)^(\( - W \)) . $
  Since $K_beta \( 0 \) gt.eq \( 4 pi beta \)^(- 3 \/ 2)$, the positive part of the prefactor’s contribution to the increment is bounded by $T log_(+) \( C rho T^(- 3 \/ 2) \)$. For small $rho$, the derivative of $t mapsto t log \( C rho t^(- 3 \/ 2) \)$ on $0 < t lt.eq rho^2$ is $log \( C rho t^(- 3 \/ 2) \) - 3 \/ 2 gt.eq log \( C rho^(- 2) \) - 3 \/ 2 > 0$. Its maximum on this interval is therefore at most $C rho^2 \( 1 + \| log rho \| \) lt.eq C rho$. The interaction contribution is at most $4 parallel v parallel_1 rho$. This proves (6), uniformly even as $T arrow.b 0$. ◻
]

== 4 Localization, occupation, and isolation <sec:localization>

We now obtain simultaneous probability bounds for specified collections of cells. The important scale is $s asymp K rho^(- 1 \/ 2)$: a cell contains $m = N s^3 \/ V asymp rho s^3$ particles on average, and $m$ tends to infinity as the density decreases. All cutoffs below are real and Lipschitz; their gradients and the resulting form identities are understood almost everywhere.

The estimates use the same variational comparison. Spatial localization gives a lower bound for the free-energy cost of a tilted state, while diagonal tilting gives an upper bound for that cost in terms of a gradient error and the tilt’s normalization. Comparing the two bounds controls the derivative of a logarithmic exponential moment. Positive density tilts control excess occupation, negative tilts control shortages, and a tilt of the close-particle count will give isolation.

#thm([Lemma 4.1.])[
  (Two-color localization and diagonal tilting).  #emph[Let $p^2 + q^2 = 1$, and suppose multiplication by $p$ maps the one-particle form domain into $H_0^1 \( Omega \)$ for an open region $Omega$. For a finite-energy symmetric trace-one $J$-particle state $sigma$, let $w_j$ be the distribution of the number of particles in the $p$ color, and let $sigma_(upright("in") \, j) \, sigma_(upright("out") \, j)$ be the two conditional marginal states. Then 
#[#set math.equation(numbering: n => "(7)")
 $ cal(F)^(\( - W \)) \( sigma \) + "Tr" n_(\| nabla p \|^2 + \| nabla q \|^2) sigma gt.eq sum_(j = 0)^J w_j #scale(x: 120%, y: 120%)[\[] cal(F)^(\( - W \)) \( sigma_(upright("in") \, j) \) + cal(F)^(\( - W \)) \( sigma_(upright("out") \, j) \) #scale(x: 120%, y: 120%)[\]] - T H \( w \) . $ <eq:7>]

 Here $H \( w \) = - sum_j w_j log w_j$, with $0 log 0 = 0$, is the Shannon entropy, and $H \( w \) lt.eq C + sum_j j w_j$ and $sum_j j w_j = "Tr" n_(p^2) sigma$.]
  #emph[Let $Gamma = Z_N^(- 1) e^(- beta H_(N \, L))$, let $P$ be its position law, and let $G$ be a bounded symmetric Lipschitz real function of positions. Put $g = e^G$, $M_G = bb(E)_P e^(2 G)$ and $sigma = g Gamma g \/ M_G$. For expectation under its position law write $bb(E)_g$. Then 
#[#set math.equation(numbering: n => "(8)")
 $ cal(F) \( sigma \) - F_N lt.eq bb(E)_g sum_i \| nabla_i G \|^2 + T #scale(x: 120%, y: 120%)[\(] 2 bb(E)_g G - log M_G #scale(x: 120%, y: 120%)[\)] . $ <eq:8>]

]
] <lem:localization-tilt>

#proof[
  The geometric localization and entropy split behind (7) also appear in #cite(label("DeuchertSeiringerYngvason2019")) Section 3, Lemma 3.1. We give the decomposition into fixed color-number sectors explicitly. The one-particle map $f mapsto \( p f \, q f \)$ is an isometry into the direct sum of the two one-particle spaces. Its symmetric tensor power is therefore an isometry. Dephase the resulting state with respect to the first-color number. The $j$-sector is unitarily identified with $"Sym"^j L^2 \( Omega \) ⊗ "Sym"^(J - j) L^2 \( Lambda_L \)$: normalized symmetrization over color assignments gives this unitary, because the assignments are orthogonal. In particular there is no additional multiplicity or binomial entropy term. The product rule and $p nabla p + q nabla q = 0$ give exactly the kinetic error in (7). Retain the same-color pair interactions and drop the other ones; nonnegativity makes this an energy decrease. One-body potentials are preserved in sum. Isometry preserves entropy, dephasing cannot decrease it, and subadditivity in each sector bounds it by $H \( w \) + sum_j w_j \[ S \( sigma_(upright("in") \, j) \) + S \( sigma_(upright("out") \, j) \) \]$. This proves (7). Comparison of $w$ with the geometric law $\( 1 - e^(- 1) \) e^(- j)$ gives $H \( w \) lt.eq - log \( 1 - e^(- 1) \) + bb(E) j$. Conditional on a labeled position configuration, the color choices are independent, with probabilities $p \( x_i \)^2$ and $q \( x_i \)^2$. This proves the number formula and also the diagonal interpretation of every color count used below. Finite-energy approximation and Lemma 3 justify all the entropy operations.
  For (8), define $tau = Gamma^(1 \/ 2) g^2 Gamma^(1 \/ 2) \/ M_G$. The nonzero spectra of $tau$ and $sigma$ agree: they are the spectra of $B^(*) B$ and $B B^(*)$ for $B = g Gamma^(1 \/ 2) \/ sqrt(M_G)$. If $H psi = E psi$, testing the eigenvalue equation with $g^2 psi$ gives the form identity
  $ chevron.l g psi \, H g psi chevron.r = E chevron.l psi \, g^2 psi chevron.r + chevron.l psi \, sum_i \| nabla_i g \|^2 psi chevron.r . $
  After summing in an eigenbasis, $"Tr" H sigma = "Tr" H tau + bb(E)_g sum_i \| nabla_i G \|^2$. Both energies and entropies are finite, since $g$ and its gradients are bounded at fixed $N \, L$.
  To compare relative entropies, approximate $g^2$ uniformly by positive simple functions on finite partitions into symmetric measurable sets $E$. Set $p_E = "Tr" Gamma upright(bold(1))_E$ and, for $p_E > 0$, $tau_E = Gamma^(1 \/ 2) upright(bold(1))_E Gamma^(1 \/ 2) \/ p_E$. The unmodified and tilted states are mixtures of the same $tau_E$, with weights $p_E$ and $p_E g_E^2 \/ M_G$. Monotonicity of relative entropy under discarding the classical label (a partial trace; see #cite(label("LiebRuskai1973Entropy")) Corollary (3.2) and Section IV) therefore bounds $D \( tau bar.v.double Gamma \)$ for this approximation by the classical relative entropy of these weights. Uniform approximation gives trace-norm convergence of the states and convergence of the classical entropies, since $g$ is bounded above and away from zero. Lower semicontinuity then gives $D \( tau bar.v.double Gamma \) lt.eq 2 bb(E)_g G - log M_G$. Finally $cal(F) \( tau \) - F_N = T D \( tau bar.v.double Gamma \)$ proves (8). ◻
]

For a nonempty union $U$ of coarse cells, set $phi.alt_U \( x \) = e^(- d \( x \, U \) \/ s)$, where distance is the Euclidean torus distance. A neighborhood of radius $h s$ around $U$ is covered by at most $C \( h + 2 \)^3$ times as many cells as $U$.

#thm([Lemma 4.2.])[
  (Localized density bounds).  #emph[Let $D_0 = H_0 rho$, where $H_0$ is a sufficiently large fixed number. For $J lt.eq N$, $0 lt.eq W lt.eq rho$, and every finite-energy symmetric trace-one $J$-particle state, 
#[#set math.equation(numbering: n => "(9)")
 $ cal(F)^(\( - W \)) \( sigma \) - F_J^(\( - W \)) gt.eq \( c_v D_0 - C_v rho - C s^(- 2) \) bb(E)_sigma n_(phi.alt_U) - C_v D_0^2 \| U \| . $ <eq:9>]

 In the corresponding equilibrium state, 
#[#set math.equation(numbering: n => "(10)")
 $ bb(E) n_U lt.eq C_v rho \| U \| . $ <eq:10>]

 For the unmodified $N$-particle position law, 
#[#set math.equation(numbering: n => "(11)")
 $ log bb(E)_P e^(2 lambda n_(phi.alt_U)) lt.eq C_v lambda rho \| U \| #h(2em) \( 0 lt.eq lambda lt.eq 1 \) . $ <eq:11>]

 In particular $bb(E)_P n_Q^2 lt.eq C m^2$ for every cell $Q$. The proof of (9) can reserve a fixed positive fraction of the inside kinetic and pair energy for a further nonnegative lower bound.]
] <lem:density-tilts>

#proof[
  For $h gt.eq 0$ take $p_h = 1$ at distance at most $h s$ from $U$, and interpolate by a cosine to zero between distances $h s$ and $\( h + 1 \) s$. Set $q_h = \( 1 - p_h^2 \)^(1 \/ 2)$ using the corresponding sine. Both gradients vanish off this transition and $\| nabla p_h \|^2 + \| nabla q_h \|^2 lt.eq C s^(- 2)$ there. Choose an open support region $Omega_h$ inside the $\( h + 2 \) s$ neighborhood; if that neighborhood covers the torus, use the torus. Its volume is at most $C \( h + 4 \)^3 \| U \|$.
  Apply (7). Inside, partition the torus into cubes of side in $\[ D_0^(- 1 \/ 3) \, 2 D_0^(- 1 \/ 3) \]$. For small density this side is between $b_0$ and $s$. The cubes meeting $Omega_h$ number at most $C D_0 \( h + 4 \)^3 \| U \|$. Applying (2) to part of the inside energy of zero-extended Dirichlet states gives $c_v D_0 j - C D_0^2 \( h + 4 \)^3 \| U \|$. Another fixed fraction of kinetic energy gives (3). An additional fixed fraction may remain unused. The external potential costs at most $rho j$. Outside, (6) gives $F_(J - j)^(\( - W \)) gt.eq F_J^(\( - W \)) - C_v rho j$. The classical entropy of the color number costs at most $T \( C + j \)$. Since $T lt.eq rho^2$, all coefficients of $j$ other than $c_v D_0$ are bounded by $C_v rho$. All volume errors, including $C T \[ 1 + \| Omega_h \| \( V^(- 1) + T^(3 \/ 2) \) \]$, are at most $C_v D_0^2 \( h + 4 \)^3 \| U \|$ after reducing the density: here $\| U \| gt.eq s^3$ and $V gt.eq s^3$.
  Average in $h$ with probability density $e^(- h) thin d h$. At each $x$, $integral_0^oo p_h \( x \)^2 e^(- h) thin d h gt.eq phi.alt_U \( x \)$. The averaged gradient cost is at most $C s^(- 2) phi.alt_U \( x \)$: the transition can occur only for $h in \[ max \( 0 \, d \( x \, U \) \/ s - 1 \) \, d \( x \, U \) \/ s \]$. The moment of $\( h + 4 \)^3$ is finite. Taking $H_0$ large makes $c_v D_0 - C_v rho$ positive and yields (9). In equilibrium the left side is zero; because $n_U lt.eq n_(phi.alt_U)$ this proves (10).
  For (11), take $G = lambda n_(phi.alt_U)$ in (8). The distance function is one-Lipschitz, so $sum_i \| nabla_i G \|^2 lt.eq lambda^2 s^(- 2) n_(phi.alt_U)$. Also $G gt.eq 0$, hence $log M_G gt.eq 0$ and the entropy term is at most $2 T lambda bb(E)_g n_(phi.alt_U)$. Comparison with (9), increasing the fixed $H_0$ if necessary, absorbs both terms and gives $bb(E)_g n_(phi.alt_U) lt.eq C_v rho \| U \|$ uniformly in $0 lt.eq lambda lt.eq 1$. Integrate $partial_lambda log M_G = 2 bb(E)_g n_(phi.alt_U)$ from zero to obtain (11). For a single cell, exponential Markov gives $P \( n_Q gt.eq t \) lt.eq min \( 1 \, e^(C m - 2 t) \)$. Integration of $2 t P \( n_Q > t \)$ gives $bb(E) n_Q^2 lt.eq C \( m + 1 \)^2$, which is at most $C m^2$ since $m arrow.r oo$ uniformly with dilution. ◻
]

The mean bound alone does not guarantee that a cell supplies a particle to a spatial route. We next control simultaneous shortages and excesses in any specified family of cells. The lower tail uses the free-energy gain from placing extra particles in an underoccupied region; the upper tail follows from the exponential density estimate.

#thm([Lemma 4.3.])[
  (Simultaneous lower and upper occupation tails).  #emph[There are fixed $0 < b_(-) < 1 \/ 4$ and $b_(+) > 4$ such that for every union $U$ of $u gt.eq 1$ specified cells, each of the events ${ n_Q < 2 b_(-) m upright(" for every ") Q subset U }$ and ${ n_Q > b_(+) m \/ 2 upright(" for every ") Q subset U }$ has probability at most 
#[#set math.equation(numbering: n => "(12)")
 $ C e^(- c m u) . $ <eq:12>]

 The constants and the required large fixed $K$ depend only on $v$.]
] <lem:occupation-tails>

#proof[
  In each cell of $U$ choose $p = 1$ on the central cube of half-side $s \/ 4$, vanishing outside the central cube of half-side $s \/ 3$. Cosine–sine interpolation gives squared localization cost at most $C s^(- 2)$ on these supports. Choose a squared smooth cutoff $0 lt.eq phi.alt lt.eq 1$, supported in the cell interiors, equal to one on these supports, with $\| nabla phi.alt \|^2 lt.eq C phi.alt \/ s^2$. The union of cell interiors is the Dirichlet region for $p$. Take one normalized smooth bump in each central cube of half-side $s \/ 8$ and sum the bumps with equal amplitude to get a normalized orbital $phi$. Then $integral \| nabla phi \|^2 lt.eq C s^(- 2)$ and $parallel phi parallel_oo^2 lt.eq C \/ \| U \|$. For small density, its support has distance greater than $R_v$ from $"supp" q$.
  The conditional outside state is supported in $\( "supp" q \)^(N - j)$, directly from the coloring map. In a color sector with $j$ inside particles, add $k$ particles in $phi$ to the outside state. The map on outside wave functions is
  $ psi mapsto binom(N - j + k, k)^(1 \/ 2) P_(upright("sym")) \( psi ⊗ phi^(⊗ k) \) . $
  Distinct assignments of the new labels have disjoint supports, so this is an isometry. It preserves entropy and has additive kinetic energy; the separated supports also eliminate all old–new interactions. A new–new pair has expectation at most $parallel v parallel_1 parallel phi parallel_oo^2$. Therefore
  $ cal(F) \( sigma_(upright("out") \, j) \) gt.eq F_(N - j + k) - C k \/ s^2 - C_v k^2 \/ \| U \| . $
  Choose a sufficiently small fixed $eta > 0$ and put $k = floor.l eta rho \| U \| floor.r$. Since $rho \| U \| gt.eq rho s^3 arrow.r oo$, small density ensures $k gt.eq eta rho \| U \| \/ 2$, and $N + k lt.eq 4 rho V$. By (5), followed by (6) for $j$ backward steps, $F_(N - j + k) gt.eq F_N + c_v rho k - C_v rho j$. Use (3) and positivity inside. Choose $eta$ small enough to absorb $C_v k^2 \/ \| U \|$ and then $K$ large enough to absorb $C k \/ s^2$ into a fixed fraction of $c_v rho k$. The remaining entropy errors are small compared with $rho^2 \| U \|$ for small density. Applying (7) and using $p^2 lt.eq phi.alt$ gives, for every state to which the argument is applied,
  $ cal(F) \( sigma \) - F_N gt.eq c'_v rho^2 \| U \| - C_v rho bb(E)_sigma n_phi.alt . $
  Here the localization term has been absorbed in the latter error, since $s^(- 2) lt.eq rho \/ K^2$.
  Now set $G = - lambda n_phi.alt$, $0 lt.eq lambda lt.eq 1$, in (8). Its gradient contribution is at most $C lambda^2 s^(- 2) bb(E)_g n_phi.alt$; its entropy contribution is at most $- T log M_G$, because $G lt.eq 0$. Thus, after changing constants, $C_v rho bb(E)_g n_phi.alt - T log M_G gt.eq c'_v rho^2 \| U \|$. Put $f \( lambda \) = - log M_G$. It is nondecreasing and $f' \( lambda \) = 2 bb(E)_g n_phi.alt$. While $f \( lambda \) lt.eq a rho \| U \|$, one has $T f \( lambda \) lt.eq a rho^3 \| U \|$, so for sufficiently small density $f' \( lambda \) gt.eq c''_v rho \| U \|$. Choose fixed $0 < a < c''_v$. Starting at $f \( 0 \) = 0$, this differential inequality forces $f \( 1 \) gt.eq a rho \| U \|$. We have proved $bb(E) e^(- 2 n_phi.alt) lt.eq e^(- a rho \| U \|)$.
  On the lower-count event, $n_phi.alt lt.eq 2 b_(-) m u$, so its probability is at most $e^(4 b_(-) m u - a rho \| U \|)$. Since $m u \/ 2 lt.eq rho \| U \| lt.eq 2 m u$, sufficiently small $b_(-)$ gives $e^(- c m u)$. On the upper-count event, $n_(phi.alt_U) gt.eq b_(+) m u \/ 2$; (11) at $lambda = 1$ bounds its probability by $e^(C_v rho \| U \| - b_(+) m u)$. A sufficiently large $b_(+)$ proves the other bound in (12). ◻
]

Occupation control supplies many particles per cell. The bridge comparison will additionally require well-separated endpoints. The next estimate shows that a prescribed region rarely contains many particles with a neighbor at the shorter scale $r$.

#thm([Lemma 4.4.])[
  (Isolation at a shorter scale).  #emph[Fix $0 < zeta lt.eq 1$ and set $r = zeta rho^(- 1 \/ 3)$ and $lambda_0 = r sqrt(rho)$. A particle is nonisolated if another particle is within torus distance $r$. For any nonempty union $S$ of coarse cells and any $k' gt.eq 0$, 
#[#set math.equation(numbering: n => "(13)")
 $ P \( \# { upright("nonisolated particles in ") S } gt.eq k' \) lt.eq exp { C_v lambda_0 zeta^3 rho \| S \| - lambda_0 k' } . $ <eq:13>]

 The constant $C_v$ can be chosen independently of decreasing $zeta$; the density threshold is allowed to depend on $zeta$.]
] <lem:isolation>

#proof[
  Partition the torus into cubes of side in $\[ r \, 2 r \]$. For each cube meeting $S$ choose a cutoff $0 lt.eq chi lt.eq 1$ that is one on the concentric triple cube, vanishes outside the concentric quintuple cube, and satisfies $\| nabla chi \| lt.eq C \/ r$. Let $Q = sum_chi \( n_chi - 1 \)_(+)$. A nonisolated particle in a fine cube has a partner in that cube’s triple cube. If there are $a$ nonisolated particles in the original cube, its cutoff has $n_chi gt.eq max \( a \, 2 \)$, and hence $a lt.eq 2 \( n_chi - 1 \)_(+)$. Summing gives the deterministic bound $\# { upright("nonisolated in ") S } lt.eq 2 Q$. Bounded overlap of the quintuple cubes gives $sum_i \| nabla_i Q \|^2 lt.eq C r^(- 2) n_(U_0)$, where $U_0$ is a coarse-cell cover of their union with $\| U_0 \| lt.eq C \| S \|$. The cubes admit a coloring with a fixed number of colors, disjoint within each color. This can be obtained from the bounded-degree intersection graph and works also on the torus.
  Repeat the proof of (9) for $U_0$, reserving a fixed fraction of inside energy for (2) on these quintuple cubes, divided among the colors. In every localization mask $p_h = 1$ on $U_0$, so those particles are certainly assigned to the inside color. Also $\( n_chi - 1 \)_(+) lt.eq n_("supp" chi) upright(bold(1))_({ n_("supp" chi) gt.eq 2 })$. The reserved energy therefore contributes $c_v r^(- 3) bb(E)_sigma Q$. The small-density conditions ensure that the fine cubes exceed $b_0$; all overlap constants are independent of $zeta$.
  Apply this augmented lower bound to $G = lambda Q$ for $0 lt.eq lambda lt.eq lambda_0$. Its gradient cost in (8) is at most $C rho bb(E)_g n_(U_0)$, absorbed by the density term of (9) after fixing $H_0$ sufficiently large. The entropy cost is at most $2 T lambda bb(E)_g Q$, absorbed by $c_v r^(- 3) bb(E)_g Q$ for small density. It follows that $bb(E)_g Q lt.eq C_v r^3 rho^2 \| S \| = C_v zeta^3 rho \| S \|$. Integration of $partial_lambda log bb(E) e^(2 lambda Q) = 2 bb(E)_g Q$ yields $log bb(E) e^(2 lambda_0 Q) lt.eq C_v lambda_0 zeta^3 rho \| S \|$. Since $2 Q gt.eq \# { upright("nonisolated in ") S }$, exponential Markov proves (13). ◻
]

== 5 A short imaginary-time slab <sec:slab>

The next estimates describe the part of the Gibbs path measure that will be changed later. Set $delta = s^2$. For sufficiently small density, $beta > 2 delta$, because $delta lt.eq 4 K^2 rho^(- 1)$ and $beta gt.eq rho^(- 2)$. Let $P_(upright("sym"))$ be the orthogonal symmetrization projector on labeled coordinates. Write $F \( Y \, S \)$ for the kernel, from $Y$ to $S$, of $e^(- \( beta - delta \) H) P_(upright("sym"))$. It is nonnegative and invariant under separate permutations of each tuple. The inner slab has labeled paths $omega_i$ from $S_i$ to $E_i$, with unnormalized free torus bridge measures $sans(K)_(S_i \, E_i)$. Put

$ cal(V)_(i j) \( omega \) = integral_0^delta v \( omega_i \( t \) - omega_j \( t \) \) thin d t \, #h(2em) W \( S \, E \; d omega \) = e^(- sum_(i < j) cal(V)_(i j) \( omega \)) product_(i = 1)^N sans(K)_(S_i \, E_i) \( d omega_i \) . $

In the closed measure $E = Y$, and the joint probability measure is

#[#set math.equation(numbering: n => "(14)")
 $ Z_N^(- 1) F \( Y \, S \) thin d Y thin d S thin W \( S \, Y \; d omega \) . $ <eq:14>]

Denote this closed probability law by $P_(upright("cl"))$ and its expectation by $bb(E)_(upright("cl"))$. The normalization is the semigroup trace identity; the canonical permutation and one-particle conventions agree with #cite(label("Ueltschi2006FeynmanCycles")) Appendix A, (A.1), (A.8)–(A.10), and (A.12)–(A.18). At each fixed time, permutation-invariant position tests have the equilibrium law $P$: insert the test as a multiplication operator, split the semigroup at that time, and use trace cyclicity.

For clarity, a torus bridge includes its lift choice. Fix a representative of its end, lift its start in every possible way, and assign a displacement $d_ell$ to that lift. Its weight is $k \( d_ell \) = \( 4 pi delta \)^(- 3 \/ 2) e^(- \| d_ell \|^2 \/ \( 4 delta \))$ times the law of a Euclidean bridge with generator $Delta$, projected to the torus. This gives the unnormalized torus bridge after summation over $ell in bb(Z)^3$. All lifted tests below refer to this lift, not to a pointwise choice of nearest torus representatives along the trajectory.

Fix a large number $D$, put $R = D + 30$ and $R_A = 2 R + 20$, and later choose $0 < epsilon < 1 \/ 2$. The short-distance scale is $r = zeta rho^(- 1 \/ 3)$ from Lemma 8. The order of choices allows $zeta$ to depend on $D \, epsilon$, followed by a small-density restriction. In particular $r arrow.r oo$, $r \/ s arrow.r 0$, and $2 r < delta$. For an anchor $a$, define

#[#set math.equation(numbering: n => "(15)")
 $ cal(A)^(-) \( a \; omega \) & = integral_0^(delta \/ 2) w \( t \) sum_i e^(- d \( omega_i \( t \) \, a \)^2 \/ \[ 1000 \( 1 + t \) \]) upright(bold(1))_({ d \( omega_i \( t \) \, a \) lt.eq R_A s }) thin d t \,\
 & #h(15mm)  w \( t \) = min \( 1 \, t^(- 3 \/ 2) \) \, #h(2em) w \( 0 \) = 1 . $ <eq:15>]

Define $cal(A)^(+)$ by replacing $omega_i \( t \)$ by $omega_i \( delta - t \)$. A subcollection in place of $omega$ means that only its paths occur in the sum.

A closed slot $i$ is #emph[eligible] if all of the following hold: its start $S_i$ and end $Y_i$ are each at distance greater than $r$ from the other points of the respective tuple; its lifted path stays within $D s$ of its end; in the first and last time intervals of length $r$ it stays within $r \/ 10$ of its respective start and end; and both $cal(A)^(-) \( S_i \; omega \)$ and $cal(A)^(+) \( Y_i \; omega \)$ are at most a fixed threshold $C_0$. A cell is #emph[usable] if its end count belongs to $\[ b_(-) m \, b_(+) m \]$ and at least a proportion $1 - epsilon$ of those slots are eligible. For an individual bridge, $upright("cut")_R$ denotes just the lifted macro condition with radius $R s$ and the same two interval conditions with radius $r \/ 10$. In this definition every condition uses that bridge’s own endpoints.

#thm([Lemma 5.1.])[
  (Single-bridge estimates).  #emph[Suppose a bridge’s endpoints have torus distance at most $\( D + 10 \) s$. When $L$ is sufficiently large compared with $R s$, $upright("cut")_R$ permits only the nearest lift. Under the probability bridge $pi_(S \, E)$ for that lift, its probability is at least a constant $p_(*) > 0$. Under the same unconditioned probability bridge $pi_(S \, E)$, the expected interaction with any fixed trajectory $omega_j$ is at most $C_v$, and the contribution of times $\[ r \, delta - r \]$ is at most $C_v \/ sqrt(r)$. For any fixed collection $omega_(upright("fix"))$, 
#[#set math.equation(numbering: n => "(16)")
 $ bb(E)_(pi_(S \, E)) [upright(bold(1))_(upright("cut")_R) sum_(j in upright("fix")) integral_0^delta v \( omega \( t \) - omega_j \( t \) \) thin d t] lt.eq C \( v \, D \) #scale(x: 120%, y: 120%)[\[] cal(A)^(-) \( S \; omega_(upright("fix")) \) + cal(A)^(+) \( E \; omega_(upright("fix")) \) #scale(x: 120%, y: 120%)[\]] . $ <eq:16>]

 Finally, for any fixed collection of at most $N$ paths and a uniform torus point $x$, $bb(E)_x cal(A)^plus.minus \( x \; omega \) lt.eq C K^2$. These bounds are independent of temperature, density, and volume after the stated choices; $p_(*)$ may be fixed after $D$.]
] <lem:single-bridge>

#proof[
  Take $L > 4 R s$. Any nonnearest lift has displacement greater than $R s$, so it fails the cut already at time zero. In the nearest lift write the bridge as its straight interpolation plus $B_t - \( t \/ delta \) B_delta$, where $B$ has generator $Delta$. By Brownian scaling the event that this fluctuation has supremum at most $s$ has a fixed positive probability; on it the macro distance is at most $\( D + 11 \) s < R s$. The deterministic drift during the first interval is at most $\( D + 10 \) r \/ s$, which is at most $r \/ 20$ once $s gt.eq 20 \( D + 10 \)$. The Brownian maximal bound and the Gaussian tail of $B_delta$ show that the remaining fluctuation exceeds $r \/ 20$ on this interval with probability at most $C e^(- c r)$: separately bound $sup_(t lt.eq r) \| B_t \|$ by $r \/ 40$ and $\| B_delta \|$ by $delta \/ 40$. The same argument applies at the other end by reversal. Subtracting these two small failure probabilities from the macro event proves the lower bound $p_(*)$.
  At time $t$ the nearest-lift bridge is Gaussian with coordinate variance $2 t \( delta - t \) \/ delta$. For $t' = min \( t \, delta - t \)$ this variance lies in $\[ t' \, 2 t' \]$. Its periodic density is bounded by $C \( t' \)^(- 3 \/ 2)$ when $t' lt.eq delta lt.double L^2$. Thus the expectation of $v$ against any fixed point is at most $C_v w \( t' \)$: use $parallel v parallel_oo$ for $t' lt.eq 1$ and the density bound with $parallel v parallel_1$ for $t' gt.eq 1$. Integration gives a bound $C_v$ on the full interaction and $C_v integral_r^oo t^(- 3 \/ 2) thin d t lt.eq C_v \/ sqrt(r)$ on the middle interval.
  To retain spatial decay, first take $t lt.eq delta \/ 2$ and use the start $S$ as anchor. The interpolation center is within $\( D + 10 \) t \/ s lt.eq \( D + 10 \) sqrt(t)$ of $S$. For $t gt.eq 1$, the Gaussian density integrated over the periodically lifted range balls around a fixed point $y$ is at most
  $ C \( v \, D \) t^(- 3 \/ 2) sum_(ell in bb(Z)^3) e^(- \| y + ell L - S \|^2 \/ \( 16 t \)) . $
  Indeed $\| u + b \|^2 gt.eq \| u \|^2 \/ 2 - \| b \|^2$ absorbs the center displacement and the range radius, and $\| b \| lt.eq R_v + \( D + 10 \) sqrt(t)$. Extracting $e^(- d \( y \, S \)^2 \/ \( 32 t \))$ leaves a uniformly bounded periodic Gaussian sum, because $t lt.eq delta lt.double L^2$. For $0 < t lt.eq 1$, use probability at most one within a fixed distance $2 \( R_v + D + 10 \)$ of $S$. Beyond this distance, a hit requires a Gaussian fluctuation at least $d \( y \, S \) \/ 2$; its tail has the same, or stronger, spatial decay after increasing $C \( v \, D \)$. We have thus bounded the expected interaction density by $C \( v \, D \) w \( t \) e^(- d \( y \, S \)^2 \/ \[ 1000 \( 1 + t \) \])$.
  On the cut, a possible hit also requires $d \( y \, S \) lt.eq \( R + D + 10 \) s + R_v < R_A s$ for sufficiently small density. This follows by bounding the bridge’s distance from the end by $R s$ and the endpoint displacement by $\( D + 10 \) s$. Consequently the indicator in (15) may be inserted in this upper bound. Reverse time for the other half, sum over the fixed trajectories, and integrate to obtain (16). Finally the integral over a uniform anchor of the Gaussian factor is at most $C \( 1 + t \)^(3 \/ 2) \/ V$. Since $w \( t \) \( 1 + t \)^(3 \/ 2) lt.eq C$, the mean score is at most $C N delta \/ V lt.eq C rho s^2 lt.eq C K^2$. ◻
]

== 6 A joint bound for atypical trajectories <sec:atypical>

The bridge criteria require a bound for many failures at once. A single-bridge estimate is insufficient here: the interacting closed measure does not make its bridges independent. We obtain a localized exponential moment by assigning an auxiliary color to each tested bridge, retaining its spatial confinement, and estimating the resulting partition function.

We use the free-energy increment bound (6) and the density bound (10). More explicitly, the two inputs needed in this section are

$ F_j - F_(j - 1) lt.eq C_v rho quad \( 1 lt.eq j lt.eq N \) \, #h(2em) chevron.l n_B chevron.r_(J \, - W) lt.eq C_v rho \| B \| quad \( 0 lt.eq J lt.eq N \, 0 lt.eq W lt.eq rho \) \, $

where $B$ is any union of coarse cells and the second expectation is in the $J$-particle equilibrium state with external potential $- W$. In particular, the constants in these inputs are fixed before the trajectory cutoff $D$ and the isolation parameter $zeta$ are chosen.

Recall that $delta = s^2$, $r = zeta rho^(- 1 \/ 3)$, and the paths in the slab carry the lift convention specified in Section 5. For a nonempty union $U$ of coarse cells, let $J_U^(upright("fail"))$ count the slots ending in $U$ for which at least one of the following holds: the lifted path leaves the ball of radius $D s$ about its end; on the first time interval of length $r$ it leaves the ball of radius $r \/ 10$ about its start; or on the last such interval it leaves that ball about its end.

#thm([Proposition 6.1.])[
  (Localized exponential moment for trajectory failures).  #emph[Fix $K$ as in the cell construction. There exist $D_min$, $C_v$, and $kappa > 0$, depending on the fixed potential and on $K$, such that the following holds. Fix $D gt.eq D_min$ and $0 < zeta lt.eq 1$. For sufficiently small $rho > 0$ and sufficiently large volume at that density, uniformly for $rho \/ 2 lt.eq N \/ V lt.eq 2 rho$ and $0 < T lt.eq rho^2$, every nonempty coarse cell union $U$ satisfies 
#[#set math.equation(numbering: n => "(17)")
 $ log bb(E)_(upright("cl")) exp \( J_U^(upright("fail")) \) lt.eq [C_v sum_(j gt.eq 0) D_j^3 e^(- kappa D_j^2) + o_rho \( 1 \)] rho \| U \| \, #h(2em) D_j = 2^j D . $ <eq:17>]

 The constants $C_v \, kappa$ do not depend on $D$ or $zeta$. The term $o_rho \( 1 \)$ is at fixed $v \, K \, D \, zeta$ and is uniform in the stated particle numbers, volumes, and temperatures.]
] <prop:atypical-moment>

=== 6.1 A localized kernel for one marked bridge <a-localized-kernel-for-one-marked-bridge>

Partition the failure event into disjoint bins. In bin $j gt.eq 0$, the lifted maximum distance from the end belongs to $\( D_j s \, 2 D_j s \]$. Bin $*$ consists of a failure of one of the two short-interval tests with no macro failure. Write

$ h_j = D_j \, quad b_j = D_j^2 quad \( j gt.eq 0 \) \, #h(2em) h_(*) = D \, quad b_(*) = r . $

Here and below a sum over bins includes $*$. Let

$ Omega_j = { x in Lambda_L : d \( x \, U \) < \( 2 h_j + 4 \) s } . $

If this set is the whole torus, its Laplacian has periodic boundary conditions; otherwise we use the Dirichlet Laplacian. Choose a Lipschitz function $0 lt.eq p_j lt.eq 1$, equal to one when $d \( x \, U \) lt.eq 2 h_j s$, vanishing when $d \( x \, U \) gt.eq \( 2 h_j + 2 \) s$, and satisfying $\| nabla p_j \| lt.eq C \/ s$. It has support compactly contained in $Omega_j$ unless $Omega_j$ is the whole torus. The elementary coarse-cell cover bound gives

$ \| Omega_j \| lt.eq C h_j^3 \| U \| \, #h(2em) Omega_j subset B_j \, #h(2em) \| B_j \| lt.eq C h_j^3 \| U \| \, $

for suitable coarse-cell unions $B_j$. The constants also work when the enlarged set covers or winds around the torus.

Let $K_j \( E \, S \)$ be the unnormalized free single-bridge kernel with end $E in U$ and failure in bin $j$. There are absolute constants $c \, C > 0$ and a fixed $c_1 > 1$ such that

#[#set math.equation(numbering: n => "(18)")
 $ K_j \( E \, S \) lt.eq C e^(- c b_j) p_j \( E \) p_j \( S \) \[ e^(c_1 delta Delta_(Omega_j)) \] \( E \, S \) . $ <eq:18>]

These constants are independent of $D$ and $zeta$ after the small-density restrictions below are imposed.

To prove this, fix a lift of $E$ and consider separately each lift of $S$, with displacement $d$ from that lift of $E$. Put $k_t \( d \) = \( 4 pi t \)^(- 3 \/ 2) e^(- \| d \|^2 \/ \( 4 t \))$. In a macro bin the event forces $\| d \| lt.eq 2 h_j s$. If $\| d \| > h_j s \/ 2$, widening the Gaussian gives

$ k_delta \( d \) lt.eq C e^(- c h_j^2) k_(c_1 delta) \( d \) . $

If $\| d \| lt.eq h_j s \/ 2$, the zero-end bridge fluctuation must have maximum at least $h_j s \/ 2$. The Brownian bridge maximum tail is at most $C e^(- c h_j^2)$, while $k_delta lt.eq c_1^(3 \/ 2) k_(c_1 delta)$. This proves the same bound for this case.

For bin $*$ one has $\| d \| lt.eq D s$. Once $s gt.eq 40 D$, the linear drift on a time interval of length $r$ is at most $r \/ 40$. If $B$ is Brownian motion with generator $Delta$, the fluctuation is $B_t - \( t \/ delta \) B_delta$. The maximal inequality on $\[ 0 \, r \]$ bounds the chance that the first term exceeds a fixed positive multiple of $r$ by $C e^(- c r)$. The corresponding estimate for the second term is $C e^(- c delta)$, since exceeding that multiple of $r$ requires $\| B_delta \| gt.eq c delta$. We take $r lt.eq delta \/ 2$. Time reversal gives the same bound at the other endpoint. Thus the bin-$*$ kernel for each retained lift is at most $C e^(- c r) k_(c_1 delta) \( d \)$.

It remains to justify the Dirichlet kernel on the right of (18), rather than a free kernel without localization. For every retained lift, the straight segment from $E$ to $S$ is within distance $2 h_j s$ of the chosen lift of $E$. Every lifted path at distance less than $s$ from that segment projects into $Omega_j$. A bridge of diffusion coefficient $c_1$ over time $delta = s^2$ has probability at least a fixed $q_(*) > 0$ of remaining in this tube, by scaling its zero-end fluctuation. Consequently the killed torus kernel is at least

$ q_(*) sum_(upright("retained lifts of ") S) k_(c_1 delta) \( d \) . $

The terms are disjoint winding classes of torus paths. This remains valid for extents greater than $L$ and for $Omega_j = Lambda_L$. On the support of $K_j$, both $p_j \( E \)$ and $p_j \( S \)$ equal one. Summing the preceding bounds over lifts proves (18).

=== 6.2 The colored operator and its large powers <the-colored-operator-and-its-large-powers>

Choose $kappa > 0$ sufficiently small, and set

$ eta_j = e^(- kappa b_j) \, #h(2em) M_j = kappa b_j \/ delta . $

By increasing the lower restrictions on $D$ and $r$, the prefactor in (18), including the marking factor $e - 1$, is bounded by $eta_j e^(- delta M_j) = e^(- 2 kappa b_j)$. The choice of $kappa$ is independent of $D$ and $zeta$.

We will represent marked bridges by auxiliary particle colors. The small coefficient $eta_j$ limits the enlargement of the map into the colored space, while the positive gap $M_j$ will pay the free-energy cost of removing a particle from the original interacting color. Normalizing this map will introduce a local attractive potential. The density estimate controls its cost on the original color, and the gap also absorbs it on the marked colors.

The enlarged one-particle Hilbert space is

$ frak(h)_e = L^2 \( Lambda_L \) xor xor.big_j L^2 \( Omega_j \) \, $

with the first summand called the original color and the others indexed by the failure bins. Define

$ v_e f = #scale(x: 120%, y: 120%)[\(] f \, \( sqrt(eta_j) p_j f \)_j #scale(x: 120%, y: 120%)[\)] \, #h(2em) V_e = v_e^(⊗ N) . $

The restrictions to the relevant domains in each marked component are understood. On the labeled $N$-fold tensor product, define $bb(H)$ by its closed quadratic form, separately in each color assignment. Original-color particles have their original kinetic energy and the full pair potential between themselves. A particle of color $j$ has one-body operator $- c_1 Delta_(Omega_j) + M_j$. All interactions incident to marked particles are omitted. The operator and the embedding commute with, or intertwine, coordinate permutations. They therefore restrict to the symmetric $N$-particle spaces. On those spaces put

$ cal(T) = V_e^(*) e^(- delta bb(H)) V_e . $

Indeed, expanding

$ e^(J_U^(upright("fail"))) = product_(i = 1)^N (1 + \( e - 1 \) upright(bold(1))_({ E_i in U \, med i upright(" fails") })) $

marks subsets of labels. For each marked subset, decompose its failure events into bins and drop precisely the interactions incident to marked labels. This increases the nonnegative path weight. Applying (18) to each marked path leaves the original interacting kernel on the other labels. The sum over all color assignments is exactly the kernel of $cal(T)$. Thus $cal(T)$ majorizes the tested slab kernel pointwise on labeled coordinates. The nonnegative outer kernel, including its symmetrization projector, gives

$ bb(E)_(upright("cl")) e^(J_U^(upright("fail"))) lt.eq Z_N^(- 1) "Tr"_(upright("sym")) e^(- \( beta - delta \) H) cal(T) . $

For $beta > delta$, Schatten Hölder with conjugate exponents $beta \/ \( beta - delta \)$ and $beta \/ delta$ yields

#[#set math.equation(numbering: n => "(19)")
 $ bb(E)_(upright("cl")) e^(J_U^(upright("fail"))) lt.eq (frac("Tr"_(upright("sym")) cal(T)^(beta \/ delta), Z_N))^(delta \/ beta) . $ <eq:19>]

The embedding has norm larger than one. We next account for its effect on the high power in (19) without losing the spatial localization. Define the bounded Lipschitz function

$ a \( x \) = 1 / 2 log (1 + sum_j eta_j p_j \( x \)^2) \, #h(2em) A = sum_(i = 1)^N a \( x_i \) . $

The same position multiplier acts in every color. One has $V_e = e^A U_e$, where $U_e$ is an isometry: at the one-particle level the squared norm of the color vector is $e^(2 a \( x \))$. Consequently

$ cal(T) = U_e^(*) X U_e \, #h(2em) X = e^A e^(- delta bb(H)) e^A . $

Eigenvalue min–max for a positive compact compression gives $lambda_k \( cal(T) \) lt.eq lambda_k \( X \)$ for every $k$, including multiplicities. Hence the trace of any positive power of $cal(T)$ is bounded by that of $X$.

#thm([Lemma 6.2.])[
  (Trace bound for a Lipschitz sandwich).  #emph[For the operators just defined, put 
$ W_0 = 2 a \/ delta + c_1 \| nabla a \|^2 \, #h(2em) tilde(bb(H)) = bb(H) - sum_(i = 1)^N W_0 \( x_i \) . $

 Then 
#[#set math.equation(numbering: n => "(20)")
 $ "Tr" X^(beta \/ delta) lt.eq "Tr" e^(- beta tilde(bb(H))) . $ <eq:20>]

 In fact the analogous inequality holds with every positive power $q$ on the left and time $q delta$ on the right.]
] <lem:operator-sandwich>

#proof[
  We interpolate from the identity to $X$ and bound the rate of change of the squared norm by the quadratic form of $tilde(bb(H))$. Applying the same estimate to exterior powers controls products of eigenvalues; an integral identity then gives the trace bound for every positive power.
  First, the heat traces below are finite and $X$ is positive compact. At fixed $N \, L \, rho$, the gaps $M_j$ tend to infinity along the macro bins. Domain monotonicity and the torus heat-kernel bound give, for each $t > 0$,
  $ sum_j e^(- t M_j) "Tr" e^(c_1 t Delta_(Omega_j)) lt.eq C V \( V^(- 1) + t^(- 3 \/ 2) \) sum_j e^(- t M_j) < oo . $
  Including the original color, the free labeled $N$-particle trace is the $N$th power of a finite one-particle trace. The nonnegative original-color pair potentials only increase the Hamiltonian in the form sense. Min–max therefore gives compact resolvent and finite positive-time heat traces for $bb(H)$. Subtracting the bounded potential $sum_i W_0 \( x_i \)$ preserves these properties. The bounded multiplier $e^A$ also makes $X$ trace class.
  For $0 lt.eq t lt.eq delta$ define
  $ U_t = e^(f \( t \) A) e^(- t bb(H)) e^A \, #h(2em) f \( t \) = - 1 + 2 t \/ delta . $
  Thus $U_0 = 1$ and $U_delta = X$. Bounded Lipschitz multiplication preserves the closed form domain of $bb(H)$. This includes the Dirichlet conditions on marked colors and the weighted sum of color-gap terms. For any initial vector $x$ and $t > 0$, spectral calculus gives
  $ e^(- f \( t \) A) U_t x = e^(- t bb(H)) e^A x in D \( bb(H) \) . $
  The vector $y \( t \) = U_t x$ is norm differentiable for $t > 0$, belongs to the form domain, and satisfies
  $ y' \( t \) = frac(2 A, delta) y \( t \) - e^(f \( t \) A) bb(H) e^(- f \( t \) A) y \( t \) . $
  The last expression is well-defined on this evolving vector. Its real inner product with $y$ can be evaluated using the closed form between $e^(f A) y$ and $e^(- f A) y$; no assertion that a Lipschitz multiplier preserves $D \( bb(H) \)$ is needed.
  In a fixed color component, the diffusion coefficient $c_i$ of coordinate $i$ is either $1$ or $c_1$. The product rule gives almost everywhere
  $ "Re" [overline(nabla_i \( e^(f A) y \)) dot.op nabla_i \( e^(- f A) y \)] = \| nabla_i y \|^2 - f^2 \| nabla a \( x_i \) \|^2 \| y \|^2 . $
  The cross terms are purely imaginary and all potentials commute with these multipliers. Since $\| f \| lt.eq 1$ and $c_i lt.eq c_1$, the preceding identities imply
  $ 1 / 2 frac(thin upright(d), thin upright(d) t) parallel U_t x parallel^2 lt.eq - tilde(frak(q)) \[ U_t x \] \, $
  where $tilde(frak(q))$ is the form of $tilde(bb(H))$.
  Let $E_1 lt.eq E_2 lt.eq dots.h.c$ be the eigenvalues of $tilde(bb(H))$, counting multiplicity. Apply the same calculation to the tensor power $U_t^(⊗ k)$, with the sums of $A$ and $bb(H)$ over $k$ copies of the enlarged symmetric many-particle Hilbert space. Restrict these copies to their antisymmetric subspace. In the eigenbasis of $tilde(bb(H))$, the smallest eigenvalue of the copy sum there is $E_1 + dots.h.c + E_k$. It follows that
  $ 1 / 2 frac(thin upright(d), thin upright(d) t) parallel U_t^(⊗ k) x parallel^2 lt.eq - \( E_1 + dots.h.c + E_k \) parallel U_t^(⊗ k) x parallel^2 $
  for every antisymmetric $x$ and $t > 0$. Integrate from a positive time and then let that time tend to zero, using $U_0 = 1$ and strong continuity. The norm of the $k$th exterior power of $U_delta$ is consequently at most $e^(- delta \( E_1 + dots.h.c + E_k \))$.
  The exterior-power norm is the product of the largest $k$ singular values. Since $U_delta = X$ is positive and injective, write its eigenvalues in decreasing order as $x_i > 0$. We obtain
  $ sum_(i = 1)^k log x_i lt.eq - delta sum_(i = 1)^k E_i #h(2em) \( k gt.eq 1 \) . $
  These partial-sum inequalities imply, for every real $t$,
  $ sum_i \( log x_i - t \)_(+) lt.eq sum_i \( - delta E_i - t \)_(+) . $
  Indeed each side is the supremum over $k gt.eq 0$ of the corresponding shifted partial sum; for fixed $t$ only finitely many positive terms occur. For every $q > 0$ the identity
  $ e^(q u) = integral_(bb(R)) \( u - t \)_(+) q^2 e^(q t) thin thin upright(d) t $
  and Tonelli’s theorem now give $sum_i x_i^q lt.eq sum_i e^(- q delta E_i)$. Taking $q = beta \/ delta$ proves (20). ◻
]

=== 6.3 The partition-function estimate with confined colors <the-partition-function-estimate-with-confined-colors>

The preceding lemma has converted the large power of the marked-slab operator into an ordinary heat trace. It remains to compare that trace with the original partition function. Spatial confinement is essential here: it makes the final cost proportional to $\| U \|$, the volume where failures are tested, rather than to the whole torus.

Set

$ Sigma = sum_j eta_j h_j^3 = sum_(j gt.eq 0) D_j^3 e^(- kappa D_j^2) + D^3 e^(- kappa r) . $

From the definition of $a$ and Cauchy–Schwarz,

$ 0 lt.eq W_0 lt.eq C / delta sum_j eta_j upright(bold(1))_(Omega_j) . $

For example,

$ \| nabla a \|^2 = frac(\| sum_j eta_j p_j nabla p_j \|^2, \( 1 + sum_j eta_j p_j^2 \)^2) lt.eq C / delta sum_j eta_j upright(bold(1))_(Omega_j) . $

All constants are independent of the number or sizes of the domains. Taking $D$ large and then $rho$ small makes $parallel W_0 parallel_oo lt.eq rho$, because $delta gt.eq K^2 rho^(- 1)$ and $r arrow.r oo$.

For $0 lt.eq J lt.eq N$, differentiate the original-color partition function in the strength of $- W_0$. The density input, applied to the covers $B_j$ and to every external potential $- t W_0$ with $0 lt.eq t lt.eq 1$, gives

$ log Z_J^(\( - W_0 \)) - log Z_J = beta integral_0^1 chevron.l n_(W_0) chevron.r_(J \, - t W_0) thin thin upright(d) t lt.eq frac(beta C_v rho \| U \|, delta) Sigma . $

The free-energy increment input also gives $Z_J \/ Z_N lt.eq e^(beta C_v rho \( N - J \))$.

To use these inequalities, decompose the enlarged symmetric space according to the occupation of each color:

$ "Sym"^N frak(h)_e tilde.equiv xor.big_(J + sum_j k_j = N) "Sym"^J L^2 \( Lambda_L \) ⊗ ⨂_j "Sym"^(k_j) L^2 \( Omega_j \) . $

Each number sector is one tensor product. There is no multinomial multiplicity in its trace: the normalized symmetrization over color assignments is the unitary realizing this decomposition. In that sector, the cost $e^(beta C_v rho \( N - J \))$ is one factor per marked particle. On color $j$, subtracting $W_0$ and this cost leaves an operator bounded below by

$ - c_1 Delta_(Omega_j) + M_j - parallel W_0 parallel_oo - C_v rho gt.eq - c_1 Delta_(Omega_j) + M_j \/ 2 . $

For this last inequality use $M_j gt.eq kappa b_j rho \/ \( 4 K^2 \)$, choose $D$ sufficiently large depending on $v \, K$, and then make $r$ sufficiently large. The same choices ensure $beta M_j \/ 2 gt.eq 1$ in every color.

Sum the marked occupation numbers and drop their total-number constraint. This bounds the sum by a product of ideal Bose grand partition functions with gaps $M_j \/ 2$. In each color its logarithm is at most

$ sum_(ell gt.eq 1) e^(- ell beta M_j \/ 2) / ell "Tr" e^(c_1 ell beta Delta_(Omega_j)) lt.eq C \| Omega_j \| \( V^(- 1) + T^(3 \/ 2) \) e^(- beta M_j \/ 2) . $

The estimate uses the killed heat-kernel bound by the periodic one and the geometric series with $beta M_j \/ 2 gt.eq 1$. The resulting sum over colors is finite, so the passage from finitely many colors to countably many is justified by monotone convergence of the nonnegative occupation sums. Combining this bound with (19), the compression inequality, and (20), we obtain the quantitative estimate

$ log bb(E)_(upright("cl")) e^(J_U^(upright("fail"))) lt.eq C_v rho \| U \| Sigma + C delta T \| U \| \( V^(- 1) + T^(3 \/ 2) \) sum_j h_j^3 e^(- beta M_j \/ 2) . $

This also proves the required uniformity. Since $beta gt.eq delta$, the color sum is bounded at fixed $D$ for all sufficiently small $rho$, using the summable macro terms $D_j^3 e^(- kappa D_j^2 \/ 2)$ and the micro term $D^3 e^(- kappa r \/ 2)$. Moreover $V gt.eq s^3$, $delta lt.eq 4 K^2 \/ rho$, and $T lt.eq rho^2$, so

$ frac(delta T, rho) \( V^(- 1) + T^(3 \/ 2) \) lt.eq C_K \( rho^(3 \/ 2) + rho^3 \) . $

The micro contribution $D^3 e^(- kappa r)$ to $Sigma$ tends to zero at fixed $D \, zeta$. Substituting these estimates in the partition-function bound proves (17), with all errors uniform in the temperature and the thermodynamic volume, as asserted.

== 7 Defective cells and an insertion comparison <sec:defects>

We combine occupation, isolation, and trajectory estimates to control an arbitrary specified set of unusable cells. The final comparison of this section transfers that control from a probability measure on closed paths to the finite measure obtained by opening one end.

Fix $Delta_A = 1000 \( 2 R_A + 2 R + 20 \)^3$. In this section all symmetric path tests use the actual inner endpoints. A cell is #emph[defective] if its end count is below $2 b_(-) m$ or above $b_(+) m \/ 2$, or if at least $epsilon \/ 4$ of its slots fail eligibility with score threshold $C_0 - Delta_A$ in place of $C_0$. Thus every unusable cell is defective.

#thm([Lemma 7.1.])[
  (Scores at separated anchors).  #emph[Let $U$ be a cell union and let $cal(D)$ be any collection of anchors mutually separated by more than $r$, all within distance $D s$ of $U$. There is a coarse-cell cover $S$ of the $\( D + R_A \) s$ neighborhood of $U$, with $\| S \| lt.eq C \( D + R_A + 2 \)^3 \| U \|$, such that, pathwise, 
#[#set math.equation(numbering: n => "(21)")
 $ sum_(a in cal(D)) cal(A)^(-) \( a \; omega \) lt.eq C integral_0^(delta \/ 2) \( w \( t \) + r^(- 3) \) n_S \( omega \( t \) \) thin d t . $ <eq:21>]

 The analogous inequality holds for the end scores after time reversal. The assertion holds also when the anchors are chosen from the paths by an arbitrary measurable rule, provided their separation and location hold for each realization. There is $B_0 = C \( 1 + K^2 \/ zeta^3 \)$ such that the exponential moment of the right side of (21), divided by $B_0$, is at most $exp \( C_v rho \| S \| \)$ under the closed measure.]
] <lem:anchor-scores>

#proof[
  Lift the anchors periodically to $bb(R)^3$. Their distinct lifts remain separated by more than $r$ once $L > 2 r$. For a point $y$ and $a_t = sqrt(1 + t)$, packing disjoint balls of radius $r \/ 2$ bounds the number of anchors in a ball of radius $u$ by $C \( 1 + u \/ r \)^3$. Summing in shells of width $max \( r \, a_t \)$, with the Gaussian weight, gives
  $ sum_(a in cal(D)) e^(- d \( y \, a \)^2 \/ \[ 1000 \( 1 + t \) \]) lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + \( 1 + t \)^(3 \/ 2) r^(- 3) #scale(x: 120%, y: 120%)[\)] . $
  For the torus expression, select a nearest lift of each anchor; it is bounded by the full lifted Gaussian sum just estimated. Only $y$ in $S$ can contribute after the distance indicator in (15), because the anchors are within $D s$ of $U$. Multiplication by $w \( t \)$ now proves (21), since $w \( t \) \( 1 + t \)^(3 \/ 2) lt.eq C$. This proof is deterministic for every set of separated anchors and therefore permits adaptive choices.
  The integral of the scalar weight on the right of (21) is at most $C \( 1 + delta r^(- 3) \) lt.eq B_0$. Divide by $B_0$ and regard the result as an average of the variables $n_S \( omega \( t \) \)$, padding with a zero variable if the total averaging mass is less than one. Jensen’s inequality for the exponential, stationarity of the one-time closed law, and (11) at $lambda = 1 \/ 2$ give
  $ bb(E)_(upright("cl")) exp [B_0^(- 1) C integral_0^(delta \/ 2) \( w \( t \) + r^(- 3) \) n_S \( omega \( t \) \) thin d t] lt.eq bb(E)_P e^(n_S) lt.eq bb(E)_P e^(n_(phi.alt_S)) lt.eq e^(C_v rho \| S \|) . $
  Time reversal gives the other half of the assertion. ◻
]

#thm([Proposition 7.2.])[
  (Specified defective cells).  #emph[Choose $D$ and $epsilon$ so that $C_v sum_(j gt.eq 0) D_j^3 e^(- kappa D_j^2) lt.eq 10^(- 4) b_(-) epsilon$ in (17). Then choose $zeta > 0$ sufficiently small in terms of these fixed constants, followed by $C_0 > Delta_A$ sufficiently large. For small enough density, there is $q_(upright("cl")) = q_(upright("cl")) \( rho \) arrow.r 0$ as $rho arrow.b 0$ such that every collection $cal(U)$ of specified cells satisfies 
#[#set math.equation(numbering: n => "(22)")
 $ P_(upright("cl")) \( upright("every cell of ") cal(U) upright(" is defective") \) lt.eq q_(upright("cl"))^(\| cal(U) \|) . $ <eq:22>]

 The bound and the convergence of $q_(upright("cl"))$ are uniform in the allowed temperatures and sufficiently large volumes. Increasing $C_0$ preserves the statement.]
] <prop:defective-cells>

#proof[
  Let $u = \| cal(U) \| gt.eq 1$. On the event in question, some subcollection of at least $u \/ 3$ cells shares one of three reasons: low count, high count, or at least $epsilon \/ 4$ ineligible slots with counts in $\[ 2 b_(-) m \, b_(+) m \/ 2 \]$. For the first two reasons (12) applies to the union of that subcollection.
  Fix a subcollection of $u'$ cells of the third kind, and let $U'$ be its union. It contains at least $epsilon b_(-) m u' \/ 2$ ineligible slots. Assign to each such slot the first failed test in the following ordered list: trajectory failure; end nonisolation; start nonisolation; beginning score failure; end score failure. For each test after the first, the slot is macro-conforming; for each score test, its respective anchor is isolated. At least one reason therefore has at least $k' = epsilon b_(-) m u' \/ 20$ slots. Using this slightly smaller threshold avoids any integer-rounding convention.
  For trajectories, exponential Markov and (17) give probability at most
  $ exp { \[ 10^(- 4) b_(-) epsilon + o_rho \( 1 \) \] rho \| U' \| - k' } \, $
  which is at most $e^(- c k')$ for sufficiently small density, since $rho \| U' \| lt.eq 2 m u'$. For end nonisolation use (13) with $S = U'$. For start nonisolation, macro conformity places all those starts within distance $D s$ of $U'$. A coarse cover of that neighborhood has volume at most $C \( D + 2 \)^3 \| U' \|$, so (13) applies to it at time zero. Fix $zeta$ so small that in both applications $C_v zeta^3 rho \| S \| lt.eq k' \/ 2$. Their probabilities are then at most $e^(- lambda_0 k' \/ 2)$.
  For either score reason the failed anchors are mutually separated by more than $r$. The end anchors lie in $U'$, and the start anchors lie within distance $D s$ of $U'$. If at least $k'$ of them have score greater than $C_0 - Delta_A$, their score sum exceeds $\( C_0 - Delta_A \) k'$. Apply Lemma 12 and exponential Markov. The probability is at most
  $ exp { C_v rho \| S \| - \( C_0 - Delta_A \) k' \/ B_0 } . $
  The ratio $rho \| S \| \/ k'$ is bounded in terms of the already fixed constants. Choose $C_0$ large enough that this last bound is at most $e^(- k')$.
  For small density, $lambda_0 = zeta rho^(1 \/ 6) lt.eq 1$. All the estimates for a fixed subcollection are thus bounded by a fixed constant times $e^(- c lambda_0 m u')$, including the two count reasons. There are at most $2^u$ choices of a subcollection for each reason and five failed-test choices. Since $u' gt.eq u \/ 3$, the resulting bound has the form $C_1^u e^(- c lambda_0 m u \/ 3)$ after increasing $C_1$. Now
  $ lambda_0 m gt.eq 1 / 2 zeta K^3 rho^(- 1 \/ 3) arrow.r oo . $
  Absorbing $C_1^u$ proves (22), for example with $q_(upright("cl")) = C_1 e^(- c lambda_0 m \/ 3)$ after replacing $m$ by its stated density-dependent lower bound. Each preceding bound was uniform in temperature and volume, as required. The empty collection has probability one and satisfies (22). ◻
]

We have obtained a joint defect bound under the closed probability law. The second-moment comparison will instead produce a finite measure with one endpoint opened. The following transfer retains both the small defect parameter and the cell-pair mass factor $M^(- 2)$.

For cells $a \, b$, define the positive measure $mu_(a b)$ as follows. In (14), sum over a slot $i$, restrict its outer endpoint $Y_i$ to cell $b$, and replace its inner endpoint by a point $z in a$ integrated with Lebesgue measure. All other inner ends remain $Y_j$. Multiply by $1 \/ \( N V \)$, retain normalization by $Z_N$, and integrate all the other variables as before. The slot index may be retained as part of the measure space. An event on the actual slab paths is #emph[symmetric] when it is invariant under simultaneous relabeling of all slots; it must not single out the opened slot.

#thm([Proposition 7.3.])[
  (Transfer to an open insertion).  #emph[For any measurable symmetric slab event $cal(E)$, 
#[#set math.equation(numbering: n => "(23)")
 $ mu_(a b) \( cal(E) \) lt.eq C / M^2 P_(upright("cl")) \( cal(E) \)^(1 \/ 4) . $ <eq:23>]

 In particular, the insertion mass is at most $C \/ M^2$ and the joint bound (22) transfers to this measure with exponent $q_(upright("cl"))^(\| cal(U) \| \/ 4)$ and prefactor $C \/ M^2$. All tests in this application use the actual inner endpoints.]
] <prop:insertion-comparison>

#proof[
  Two applications of Cauchy–Schwarz give the fourth root: the first separates the two insertion factors, and the second bounds a local particle count on the event $cal(E)$ by its second moment. Let $K_(cal(E)) \( E \, S \)$ be the tested slab kernel obtained by integrating $W \( S \, E \; d omega \) upright(bold(1))_(cal(E))$. It need not be self-adjoint, but it is pointwise nonnegative, is bounded above by the untested slab kernel, and commutes with simultaneous coordinate permutations. Put $U_(cal(E)) = K_(cal(E)) e^(- \( beta \/ 2 - delta \) H)$. For a one-particle function $f$, let $a \( f \)$ denote annihilation, mapping the $N$-particle symmetric space to the $\( N - 1 \)$-particle one. The usual normalization gives $a^(*) \( upright(bold(1))_b \) a \( upright(bold(1))_a \) = sum_i \( \| upright(bold(1))_b chevron.r chevron.l upright(bold(1))_a \| \)_i$. The definition of $mu_(a b)$ and semigroup cyclicity therefore give
  $ mu_(a b) \( cal(E) \) = frac(1, N V Z_N) "Tr"_(upright("sym")) e^(- beta H \/ 2) a^(*) \( upright(bold(1))_b \) a \( upright(bold(1))_a \) U_(cal(E)) . $
  Apply Hilbert–Schmidt Cauchy–Schwarz to $a \( upright(bold(1))_b \) e^(- beta H \/ 2)$ and $a \( upright(bold(1))_a \) U_(cal(E))$. Since a cell has volume $s^3$, the one-body Cauchy–Schwarz inequality gives $a^(*) \( upright(bold(1))_a \) a \( upright(bold(1))_a \) lt.eq s^3 n_a$, and similarly for $b$. Translation invariance yields $"Tr" e^(- beta H) n_b = Z_N m$. Thus the first squared Hilbert–Schmidt norm is at most $s^3 Z_N m$.
  For the second norm use $"Tr" U_(cal(E))^(*) n_a U_(cal(E))$. This is an integral of products of nonnegative kernels. Precisely, on labeled coordinates one may insert the projector and use the kernel of $U_(cal(E)) P_(upright("sym"))$; it has the same trace on its symmetric range and obeys
  $ 0 lt.eq U_(cal(E)) P_(upright("sym")) lt.eq e^(- beta H \/ 2) P_(upright("sym")) quad upright("pointwise in kernels") . $
  Replace only the adjoint kernel in that trace by the untested one. This increases the integral and, by cyclicity, gives
  $ "Tr"_(upright("sym")) U_(cal(E))^(*) n_a U_(cal(E)) lt.eq "Tr"_(upright("sym")) e^(- \( beta - delta \) H) n_a K_(cal(E)) = Z_N bb(E)_(upright("cl")) \[ n_a upright(bold(1))_(cal(E)) \] . $
  Here $n_a$ counts the actual inner endpoints. Its second moment in the closed measure is at most $C m^2$ by (11), so the last expression is at most $C Z_N m P_(upright("cl")) \( cal(E) \)^(1 \/ 2)$. The second squared Hilbert–Schmidt norm is consequently at most $C s^3 Z_N m P_(upright("cl")) \( cal(E) \)^(1 \/ 2)$. Taking square roots and dividing by $N V Z_N$ gives $C s^3 m \/ \( N V \)$ times the fourth root of the probability. Since $m = N \/ M$ and $s^3 = V \/ M$, this factor is $C \/ M^2$, which proves (23). ◻
]

== 8 Cell paths <sec:geometry>

We now construct paths between distant cells. Their purpose is to keep the second moment of an averaged endpoint change bounded as the volume grows. The first step controls encounters of two random skeletons; the second step adapts each skeleton to the actual unusable cells.

=== 8.1 Random skeletons and their encounter moments <sec:skeletons>

The use of unpredictable paths and intersection moments follows Benjamini–Pemantle–Peres #cite(label("BenjaminiPemantlePeres1998")) Theorem 1.3 and Lemma 3.1. The independent block velocities below are a continuous dyadic version of the aligned block-drift construction of Häggström and Mossel #cite(label("HaggstromMossel1998")) Section 3, Proposition 3.1. Finite-endpoint path averaging appears in the synchronization argument of Abbe, Massoulié, Montanari, Sly, and Srivastava #cite(label("AbbeMassoulieMontanariSlySrivastava2018")) Section 6, Lemma 6.1 and in the symmetry-breaking argument of Garban and Spencer #cite(label("GarbanSpencer2023")) Section 2, Lemma 2.5. We give an explicit dyadic construction and prove the thickened and soft-distance estimates needed here.

The construction in this subsection is purely geometric. Let $cal(G)_n = \( bb(Z) \/ n bb(Z) \)^3$, and fix an ordered pair $a \, b$ with lifted displacement $\( w \, d_2 \, d_3 \)$ satisfying

$ ceil.l n \/ 10 ceil.r lt.eq w lt.eq floor.l n \/ 8 floor.r \, #h(2em) \| d_2 \| \, \| d_3 \| lt.eq w . $

Call such a pair admissible. Admissible pairs form a fraction at least an absolute $upsilon > 0$ of all ordered pairs for sufficiently large $n$. All coordinates in the construction are first taken relative to a fixed lift of $a$, and then projected to $cal(G)_n$.

The first coordinate will advance from $0$ to $w$. In the other two coordinates we add a random displacement to the straight interpolation between the endpoints. We read that displacement forward up to the midpoint and backward afterward, so it vanishes at both endpoints. This fixes the endpoint without conditioning the random increments; the two halves deliberately use the same displacement variables.

For $q = 2 \, 3$, let $\( U_(ell \, j)^(\( q \)) \)_(ell \, j gt.eq 0)$ be mutually independent random variables, uniform on $\[ - 1 \, 1 \]$. Fix $c_(upright("vel")) = \( 1 - 2^(- 1 \/ 4) \) \/ 2$, and set

$ v_i^(\( q \)) = c_(upright("vel")) sum_(ell gt.eq 0) 2^(- ell \/ 4) U_(ell \, floor.l \( i - 1 \) \/ 2^ell floor.r)^(\( q \)) \, #h(2em) Z_t^(\( q \)) = sum_(i = 1)^t v_i^(\( q \)) \, #h(2em) Z_0^(\( q \)) = 0 . $

The series converges absolutely, and $\| v_i^(\( q \)) \| lt.eq 1 \/ 2$. At integer times $t = 0 \, dots.h \, w$ use the base vertices

$ (t \, ⌊t d_2 \/ w + Z_(min \( t \, w - t \))^(\( 2 \))⌋ \, ⌊t d_3 \/ w + Z_(min \( t \, w - t \))^(\( 3 \))⌋) . $

Starting from the base vertex at time $t$, first advance one step in the first coordinate, then take the signed second-coordinate steps, and finally the signed third-coordinate steps needed to reach the base vertex at time $t + 1$. Omit zero-length moves. Begin the vertex list with $a$ and append each newly reached vertex once, without repeating a shared endpoint of successive pieces. Each transverse coordinate changes by at most two; thus the resulting nearest-neighbor skeleton $gamma = \( z_0 \, dots.h \, z_l \)$ has at most five steps per time interval and at most five listed occurrences at each first-coordinate level $t gt.eq 1$, with one occurrence at level zero. The law depends only on the torus and the ordered endpoints. Independent skeletons use independent arrays of the $U$’s. The dyadic weights are chosen so that a previously unused block of $k$ increments supplies a transverse displacement of order $k^(3 \/ 4)$. In two transverse coordinates this gives the summable conditional density bound $C k^(- 3 \/ 2)$ proved below.

For vertices on the torus write

$ d_oo \( x \, y \) = min_(k in bb(Z)^3) parallel tilde(x) - tilde(y) + n k parallel_oo \, #h(2em) d_oo \( x \, gamma' \) = min_(z' in gamma') d_oo \( x \, z' \) \, $

where the tildes denote arbitrary lifts. For two independent skeletons $gamma \, gamma'$ with the same ordered endpoints and a fixed radius $R_(*) gt.eq 1$, define

$ J_0 = sum_(z in gamma) upright(bold(1))_({ d_oo \( z \, gamma' \) lt.eq R_(*) }) + sum_(z' in gamma') upright(bold(1))_({ d_oo \( z' \, gamma \) lt.eq R_(*) }) \, #h(2em) S_B = sum_(z in gamma) e^(- d_oo \( z \, gamma' \) \/ B) quad \( B > 0 \) . $

Every sum uses the listed vertex occurrences, including the endpoints. An occurrence contributes once to $J_0$ when at least one occurrence of the other skeleton lies within the stated distance.

#thm([Lemma 8.1.])[
  (Skeleton encounters).  #emph[For the independent skeletons just constructed, there are absolute constants $c_(upright("hit")) > 0$ and $C < oo$ such that, for every $R_(*) gt.eq 1$, 
#[#set math.equation(numbering: n => "(24)")
 $ bb(E) e^(alpha J_0) lt.eq C \, #h(2em) alpha = frac(c_(upright("hit")), \( 1 + R_(*) \)^2) . $ <eq:24>]

 For every fixed $B > 0$ there are $xi \( B \) > 0$ and $C \( B \) < oo$ such that 
#[#set math.equation(numbering: n => "(25)")
 $ bb(E) e^(xi \( B \) S_B) lt.eq C \( B \) . $ <eq:25>]

 Both estimates are uniform in $n$ and in every admissible ordered pair.]
] <lem:skeleton>

#proof[
  #emph[Conditional density bound.] In this proof write $Z_t = \( Z_t^(\( 2 \)) \, Z_t^(\( 3 \)) \)$ for the pair of transverse sums, and write $Z'_t$ for the corresponding pair of the other skeleton. Put $h = floor.l w \/ 2 floor.r$. Condition on all the variables generating $gamma'$. For the first skeleton define the dyadic blocks
  $ I_(ell \, j) = { j 2^ell + 1 \, dots.h \, \( j + 1 \) 2^ell } \, $
  and let $cal(F)_t$ be generated by the entire primed array and the variables $U_(ell \, j)^(\( q \))$ for which $I_(ell \, j) ∩ { 1 \, dots.h \, t } eq.not diameter$, with $q = 2 \, 3$. Thus it reveals exactly the variables of the first array used through time $t$, including the large blocks that continue past that time. For $t + k lt.eq h$, $k gt.eq 1$, the future index interval contains a full aligned dyadic block of length at least $k \/ 4$: take a power of two between $k \/ 4$ and $k \/ 2$ and skip less than one such block to align, or use length one for $k = 1$. Its variable has not been used and contributes a uniform term of width at least $c k^(3 \/ 4)$ to the sum, even after conditioning on the other variables. Indeed, a block at level $ell$ contributes $c_(upright("vel")) 2^(3 ell \/ 4)$ times its variable. Using one such variable in each independent coordinate gives a conditional two-coordinate density of $Z_(t + k)$, given $cal(F)_t$, bounded by $C k^(- 3 \/ 2)$.
  #emph[Same-time encounter tests.] Write $D_t = \| Z_t - Z'_t \|_oo$, for $0 lt.eq t lt.eq h$. Denote the two base vertices at time $t$ by $b_t \, b'_t$. An occurrence $z$ at first-coordinate level $t$ is within sup-norm distance two of $b_t$. If $z'$ is an occurrence of the other skeleton at level $t'$, then $\| t - t' \| lt.eq d_oo \( z \, z' \)$: first-coordinate differences are at most $w lt.eq n \/ 8$, so they do not wrap. Each base step has sup-norm size at most two. The triangle inequality therefore gives
  $ d_oo \( b_t \, b'_t \) lt.eq 3 d_oo \( z \, z' \) + 4 . $
  The same-time lifted transverse differences also do not wrap. The linear drifts are common, each random deviation has absolute value at most $w \/ 4$, and rounding changes their difference by at most one. Thus these differences have magnitude at most $w \/ 2 + 1 < n \/ 2$. With $u = min \( t \, w - t \)$, it follows that
  $ D_u lt.eq 3 d_oo \( z \, z' \) + 5 . $
  Consequently
  $ J_0 lt.eq C sum_(t = 0)^h upright(bold(1))_({ D_t lt.eq C \( R_(*) + 1 \) }) . $
  The reflected times $t$ and $w - t$ have the same deviation $Z_t$; their different linear drifts are common to both skeletons and cancel in the difference. Thus the second half contributes only another fixed multiplicity to this bound.
  For the distance-weighted sum, take $z'$ to be a closest occurrence of $gamma'$. The same inequality gives
  $ e^(- d_oo \( z \, gamma' \) \/ B) lt.eq e^(5 \/ \( 3 B \)) e^(- D_u \/ \( 3 B \)) \, #h(2em) S_B lt.eq C \( B \) sum_(t = 0)^h e^(- D_t \/ \( C B \)) . $
  These are the two deterministic reductions used in the moment estimate.
  #emph[Exponential moment.] Let $X_t in \[ 0 \, 1 \]$ denote either of these first-half tests. They are adapted to $cal(F)_t$, since all variables of $gamma'$ were conditioned on at the outset. Integrating the conditional density bound against the indicator, respectively the decaying exponential, and summing over the positive time increments gives the uniform estimate
  $ bb(E) [sum_(u = t + 1)^h X_u thin mid(bar.v) thin cal(F)_t] lt.eq b_0 \, #h(2em) b_0 = cases(delim: "{", C \( R_(*) + 1 \)^2 \, & X_u = upright(bold(1))_({ \| Z_u - Z'_u \|_oo lt.eq C \( R_(*) + 1 \) }) \,, C \( B \) \, & X_u = e^(- \| Z_u - Z'_u \|_oo \/ \( C B \)) .) $
  For every $j gt.eq 1$, the expected sum of products on strictly ordered $j$-tuples is therefore at most $\( b_0 + 1 \)^j$. To see this, condition the last-index sum on the revealment at each preceding index in the nested sum, and include $X_0 lt.eq 1$ when bounding the one-term sum. Now expand
  $ e^(theta sum_(t = 0)^h X_t) = product_(t = 0)^h #scale(x: 120%, y: 120%)[\(] 1 + \( e^(theta X_t) - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  The inequality $e^(theta x) - 1 lt.eq \( e^theta - 1 \) x$ for $0 lt.eq x lt.eq 1$ bounds its expectation by the geometric series $sum_(j gt.eq 0) \[ \( e^theta - 1 \) \( b_0 + 1 \) \]^j$. Taking $theta$ to be a sufficiently small constant times $1 \/ \( b_0 + 1 \)$, and accounting for the preceding sum-comparison constants, proves (24) and (25). ◻
]

=== 8.2 Detours around unusable components <detours-around-unusable-components>

We now apply the geometric construction to the coarse grid of Section 2. This is the point at which the physical cutoffs enter: set

$ R_(*) = ceil.l 20 \( R + R_A + D + 20 \) ceil.r \, #h(2em) epsilon = alpha \/ 20 \, $

decreasing the absolute constant in $alpha$ if necessary. Choose $D$ large enough for the earlier conditions with this choice. This is possible because (17) has Gaussian decay in $D$, whereas $R_(*)$ grows only linearly. Choose $zeta \, C_0$ and then the small-density threshold as in Proposition 13. Increase $C_0$ also so that, for two uniform anchors, the probability of any end-score failure at threshold $C_0$ is less than $upsilon \/ 8$; the spatial average after (16) gives this last requirement.

The skeleton law does not see the unusable cells. We next adapt each sampled skeleton to those cells by a deterministic detour procedure. This step uses nearest-neighbor components of bad cells but allows sup-norm-one steps on the resulting path. Here and below, bad means unusable in the sense of Section 5. Reject the configuration if any nearest-neighbor component of bad cells has size $gt.eq n \/ 4$.

A smaller component $T$ lifts consistently to a finite connected lattice set, up to translation. Indeed, simple cycles in it are too short to wrap, and closed walks decompose into simple cycles and backtracks. Its bounding box has coordinate diameters less than $n \/ 4$, since two of its vertices can be joined within $T$ by fewer than $n \/ 4$ steps. Define its #emph[fill] by adjoining the finite nearest-neighbor components of its lattice complement, and project the result back to the torus. The fill lies in the same bounding box: a vertex outside that box connects straight outwards to infinity without meeting $T$. Reject if either endpoint lies in any projected fill.

The detour procedure scans an accepted skeleton. On entering an outermost fill, meaning one not contained in another fill, it replaces the portion through its last visit there by an exterior-boundary path. The next proof establishes the boundary connectivity that permits this replacement with sup-norm-one steps. Fix all tie-breaking rules for boundary paths in advance, and use chronological loop erasure for the resulting walk.

#thm([Lemma 8.2.])[
  (Deterministic detours).  #emph[Apply the rejection rules just specified to a nearest-neighbor skeleton from $a$ to $b$ and a set of bad cells in $\( bb(Z) \/ n bb(Z) \)^3$. If the skeleton is accepted, the procedure below produces a simple path with sup-norm steps of length one from $a$ to $b$, using only good cells. Every vertex is a skeleton vertex or lies on the exterior vertex boundary of a bad component hit by the skeleton. A component $T$ is detoured at most once and contributes at most $6 \| T \|$ detour vertices. Removing any whole bad components not hit by an accepted skeleton preserves acceptance and its output path.]
] <lem:detour>

#proof[
  #emph[Fills and projection.] We first establish the boundary facts needed by the procedure. In the lattice the fill is connected, since each hole neighbors the obstacle. Its exterior is connected, since a finite set has just one infinite complementary component. An edge from the fill to its exterior starts in the obstacle itself.
  For disjoint non-neighboring connected obstacles, their fills are nested or disjoint and non-neighboring. Indeed, each obstacle is in a single complementary component of the other. If it is in a hole, its fill stays there: outside that hole one connects to infinity avoiding the obstacle in it, either in the exterior of the enclosing obstacle or by using that connected enclosing obstacle, also to escape from any of its other holes. If the two obstacles are mutually in the exteriors, each connected fill avoids the other obstacle and thus stays in the other’s exterior. Adjacency would imply adjacency of the obstacles themselves by the crossing-edge property.
  These facts survive projection to the torus. An intersection or adjacency can be lifted with corresponding translates of the two obstacles and their fills. The small box size avoids self-overlap and preserves cardinality, so proper nesting stays proper. We therefore use the outermost fills in the construction below.
  #emph[Connected exterior boundary.] The exterior vertex boundary consists of the exterior neighbors of the obstacle. It has at most $6 \| T \|$ vertices. We claim that it is connected in the star graph, whose steps have sup-norm one.
  We give a self-contained cycle-space proof of this boundary connectivity fact; see Timár #cite(label("Timar2013")) arXiv version 2, Lemmas 1–2. Consider the edge cut from the lattice fill to its exterior. Link two cut edges when they belong to a common elementary square. All cut edges belong to one link component. Otherwise choose one link component. Every square contains an even number of its edges: it contains an even number of edges of the full cut, and all those edges are linked. The same parity holds for every lattice cycle, since squares generate cycles modulo two. Explicitly, in a closed walk commute steps in different axes, each swap changing the walk by an elementary square modulo two, and then cancel backtracks. Counting the selected edges modulo two along paths from a fixed vertex now defines a vertex potential whose differing-neighbor edges are exactly the selected edges. This potential is constant on the connected fill and on its connected exterior. Its cut must therefore be either empty or the full cut, contradicting the choice of a proper nonempty link component. This proves the claim about cut edges. Their linked exterior endpoints are star neighbors or identical, proving boundary connectivity.
  Project this connected boundary back to the torus. Any edge leaving the projected fill lifts from within the fill to outside and hence goes from the projected obstacle to this projected boundary. The boundary vertices are good: the small box size places them outside the projected fill, and if one were bad it would belong to the adjacent bad component. Thus each outermost fill has a connected star boundary of at most $6 \| T \|$ usable vertices, and every nearest-neighbor crossing uses that boundary. This is the boundary information needed by the algorithm.
  #emph[Detour construction.] Scan the nearest-neighbor skeleton starting outside the outermost fills. If the next vertex enters one, replace the portion through the #emph[last] skeleton vertex in that same fill by a star-boundary path from the exterior predecessor to the exterior successor. These are boundary vertices by nearest-neighbor crossing, and the successor is outside all outermost fills by non-adjacency. Choose a deterministic simple path on the projected boundary, with fixed tie-breaking depending only on that component and the two vertices. Projection permits this connection regardless of the endpoint lifts used. Continue scanning from the successor.
  Finally apply chronological loop erasure to obtain a simple star path $P$ from $a$ to $b$ in good cells. Each detoured component contributes at most $6 \| T \|$ detour vertices, all adjacent to it. The last-visit rule ensures that each component is detoured at most once; loop erasure can only remove vertices.
  #emph[Deletion invariance.] Suppose the original configuration is accepted. Any fill that intersects the skeleton must have its obstacle hit by the skeleton: the start is exterior and the skeleton has nearest-neighbor steps. Enclosing fills of such obstacles are hit as well. The construction is therefore determined by the actual bad components intersecting the skeleton. Deleting other #emph[whole] bad components in this accepted configuration preserves acceptance and leaves both the detours and the final loop-erased path unchanged. ◻
]

Rejection by large components has closed probability tending to zero at large $n$ by (22): count connected sets of size $ceil.l n \/ 4 ceil.r$ by at most $M C^(ceil.l n \/ 4 ceil.r)$ (walk a rooted spanning tree), and a larger component contains one. For either given endpoint, containment in a small fill has probability at most $sum_(j gt.eq 1) C \( j + 1 \)^3 C^j q_(upright("cl"))^j$, since its bad component of size $j$ must be within distance $j$. This can be made arbitrarily small by the density restriction.

== 9 Opening the slab <sec:opening>

The local estimates and cell paths now define a change from the closed Gibbs law to an open path measure. We specify the target measure, the accepted choices, and the interacting proposal in that order. Keeping its normalization exact will let the two copies of the change cancel in the next section.

Let $q_0 = chevron.l u_0 \, gamma^(\( 1 \)) u_0 chevron.r \/ N$. Starting from (14), average a slot $i_0$ with factor $1 \/ N$ and replace its inner end by $E_(i_0) = z$, integrated with $d z \/ V$. All other inner ends remain $Y_i$, and every outer endpoint $Y_i$ is still integrated. The resulting finite measure has total mass $q_0$: it inserts $N^(- 1) sum_i \( \| u_0 chevron.r chevron.l u_0 \| \)_i$ between the two kernels in the trace. Add a dummy point $x$, uniform in the cell of $Y_(i_0)$, and retain $i_0$ as a coordinate. Denote this augmented measure by $mu$; the dummy coordinate does not change its mass.

=== 9.1 The base law and acceptance <the-base-law-and-acceptance>

Our base law is the closed probability (14), denoted by the configuration $C$, together with independent uniform points $x \, z$ of law $d x thin d z \/ V^2$. In the slab notation, configurations are tuples of paths rather than density operators; their starting tuples carry superscripts, such as $S^C$, and a subscript restricts their paths to a set of slots.

Set $a = "cell" \( x \)$ and $b = "cell" \( z \)$. The first index of $mu_(a b)$ in Section 7 specifies the new inner endpoint’s cell, and the second specifies the outer endpoint’s cell. Thus the two orientations used below are

$ & upright("opened slot") & upright("outer endpoint") & upright("new inner endpoint")\
upright("forward insertion ") mu_(b a) & i_0 & Y_(i_0) in a & z in b\
upright("reverse insertion ") mu_(a b) & e & Y_e in b & x in a . $

The reverse slot $e$ will be the last label on the selected path. Only valid ordered pairs, meaning the admissible pairs of Section 8.1, are used. For such a pair draw a skeleton and apply the deterministic adaptation to the unusable cells of $C$. Require geometric acceptance and the two tests $cal(A)^(+) \( x \; C \) \, cal(A)^(+) \( z \; C \) lt.eq C_0$. Denote these combined conditions by $"acc" \( C \, gamma \)$. For an invalid pair the acceptance indicator and all weights below are zero. The base average acceptance mass is at least $upsilon \/ 2$: the valid-pair fraction is at least $upsilon$, and the geometric rejection and dummy-score probabilities can each be made smaller than a fixed fraction of it by the choices already specified.

=== 9.2 Selecting one eligible slot in each path cell <selecting-one-eligible-slot-in-each-path-cell>

On acceptance let $P \( C \, gamma \)$ be the ordered simple star path. For a cell $Q$, write

$ g_Q \( C \) = sum_(i : Y_i in Q) upright(bold(1))_({ i upright(" eligible in ") C }) . $

Independently in each path cell choose a uniform eligible slot. This gives an ordered tuple $I = \( i_0 \, dots.h \, i_k \)$, one label per cell. For any candidate tuple define, on acceptance,

$ h_gamma \( C \, I \) =  & upright(bold(1))_({ \( "cell" \( Y_(i_0) \) \, dots.h \, "cell" \( Y_(i_k) \) \) = P \( C \, gamma \) })\
 & quad dot.op product_(j = 0)^k frac(upright(bold(1))_({ i_j upright(" eligible in ") C }), g_("cell" \( Y_(i_j) \)) \( C \)) . $

Set the weight to zero off acceptance, and interpret a factor with zero eligible count as zero. The cells of $P$ are distinct and usable, so on acceptance the displayed factors are defined and $sum_I h_gamma \( C \, I \) = 1$. Equivalently, the sum ranges over candidate simple star paths from $a$ to $b$ and label choices in their outer $Y$-cells. This range depends on $a \, b \, Y$, whereas the weight retains all dependence on the actual paths of $C$.

=== 9.3 The conditional interacting proposal <the-conditional-interacting-proposal>

For a tuple $I$, use cyclic predecessor and successor, acting as the identity off the tuple, and let $\( p_I S \)_i = S_("pred"_I \( i \))$. Transform the starts to $S^O = p_I S^C$. The inner ends $E^O$ agree with $Y$ except at slot $i_0$, whose end is replaced by $z$; paths off $I$ are kept. Resample paths in $I$ from their conditional interacting distribution restricted by $upright("cut")_R$.

More precisely, for a state $X$ with fixed endpoints and complement paths, let $W_G^X$ use the free bridge measures on $G$ and the exponential of minus the interactions incident to $G$, each pair once. Write $cal(Z)_G \( X \) = integral upright(bold(1))_(upright("cut")_R \( G \)) W_G^X$. The proposal on $I$ uses this cut measure in $O$, divided by $cal(Z)_I \( O \)$. The new displacements are at most $\( D + 10 \) s$ by eligibility and star adjacency: the start from the last cell goes to the end $z$. Thus the normalization is positive.

=== 9.4 The density and its second moment <the-density-and-its-second-moment>

Averaging a path-dependent likelihood before estimating its second moment also appears in random-trail detection and perturbed-lattice reassignment #cite(label("AriasCastroCandesHelgasonZeitouni2008")) #cite(label("BergerPeres2013")) #cite(label("PeresSly2014")). In the present setting the conditional interacting measures and both proposal normalizers must be retained explicitly.

Write $nu$ for the resulting subprobability measure on the open variables. Its mass is the base acceptance probability, hence at least $upsilon \/ 2$. Its density relative to $mu$ is

#[#set math.equation(numbering: n => "(26)")
 $ f = m thin bb(E)_gamma sum_(I : thin upright("first") \( I \) = i_0) frac(upright(bold(1))_(upright("cut")_R \( O_I \)), cal(Z)_I \( O \)) integral W_I^(hat(C)) thin h_gamma \( hat(C) \, I \) \, $ <eq:26>]

where the hypothetical closed state $hat(C)$ has $S^(hat(C)) = p_I^(- 1) S^O$, $E^(hat(C)) = Y$, and paths off $I$ as in $O$. A term with zero old weight is set to zero even if its normalizer vanishes; positive old weight gives the displacement condition and a positive normalizer.

To verify the density, change start variables for each candidate tuple. The Jacobian is one and the outer kernel is invariant under this permutation. Write $W_(macron(I))^(upright("int"))$ for the complement bridge measures with only their internal interactions. This factor agrees before and after the change. Integrating the old paths on $I$ leaves

$ W_(macron(I))^(upright("int")) [integral W_I^(hat(C)) h_gamma \( hat(C) \, I \)] upright(bold(1))_(upright("cut")_R \( O_I \)) W_I^O \/ cal(Z)_I \( O \) $

(all incident weights and normalizers use the displayed fixed complement). The corresponding factor in the open measure is $W_(macron(I))^(upright("int")) W_I^O$. The remaining normalization comes from the label and dummy coordinate:

$ frac(upright("base density of ") x, upright("target index factor") times upright("target density of ") x) = frac(V^(- 1), N^(- 1) s^(- 3)) = N / M = m . $

Here both measures restrict $x$ to the cell containing $Y_(i_0)$, and both use $d z \/ V$. This proves (26), equivalently by integration against nonnegative test functions. Skeleton expectations are for the given cell pair, with zero weight for invalid pairs.

Cauchy–Schwarz gives $\( upsilon \/ 2 \)^2 lt.eq q_0 integral f^2 thin upright(d) mu$. To compute the second moment, use $integral f^2 thin upright(d) mu = integral f thin upright(d) nu$: evaluate (26) at a transformation from the base with independent skeleton $gamma'$ and tuple $I'$. The resulting integral is

#[#set math.equation(numbering: n => "(27)")
 $ & m thin bb(E)_(x \, z \, gamma' \, gamma) thin Z_N^(- 1) integral F \( Y \, S^C \) thin d Y thin d S^C sum_(I' \, I : thin upright("first") \( I' \) = upright("first") \( I \)) integral W \( C \) h_(gamma') \( C \, I' \)\
 & #h(30mm)  dot.op frac(upright(bold(1))_(upright("cut")_R \( O_(I') \)) W_(I')^O, cal(Z)_(I') \( O \)) frac(upright(bold(1))_(upright("cut")_R \( O_I \)), cal(Z)_I \( O \)) W_I^(hat(C)) h_gamma \( hat(C) \, I \) . $ <eq:27>]

The path integrations are over all closed paths, then proposed paths on $I'$, and finally hypothetical old paths on $I$. Here $W \( C \)$ is the full slab weight, $S^O = p_(I') S^C$, and $x \, z$ have their base uniform law. Both tuples must have the same first slot, which is summed over. All integrands are nonnegative, so Tonelli permits the changes in integration order used next. Section 10 bounds (27) uniformly.

== 10 Cross comparison in the slab <sec:comparison>

The construction of Section 9 reduces the condensate bound to the following estimate.

#thm([Proposition 10.1.])[
  (Uniform second moment).  #emph[After fixing the cutoffs as above, there is a constant $C_v < oo$ such that, for all sufficiently small densities and sufficiently large volumes at each density, 
$ integral f^2 thin upright(d) mu lt.eq C_v . $

 The constant is uniform for $rho \/ 2 lt.eq N \/ V lt.eq 2 rho$ and $0 < T lt.eq rho^2$.]
] <prop:second-moment>

We prove this by comparing the two changes in (27) with a single reverse insertion. Interactions away from encounters must cancel: a fixed cost at every path cell would grow with the volume. The analytic comparison below leaves only a fixed cost for shared labels and a vanishing cost for nearby distinct bridges. To retain this gain after averaging, we must also preserve the configuration-dependent path and label choices. We establish that preservation before removing their constraints from any conditional integral.

=== 10.1 The reverse insertion and the slot partition <the-reverse-insertion-and-the-slot-partition>

Fix a term of (27). The tuple $I'$ is selected along $P' = P \( C \, gamma' \)$ and produces the open state $O$; the density at $O$ uses a tuple $I$ along $P = P \( hat(C) \, gamma \)$. Their first label $i_0$ is common. Write $e$ for the last label of $I$, and introduce the reverse state $B$ by the following endpoint assignments:

$ upright("state") & upright("starting tuple") & upright("inner ending tuple")\
C & S^C & Y\
O & p_(I') S^C & Y upright(" with ") Y_(i_0) upright(" replaced by ") z\
hat(C) & p_I^(- 1) p_(I') S^C & Y\
B & p_I^(- 1) S^C & Y upright(" with ") Y_e upright(" replaced by ") x . $

The outer tuple $Y$ is unchanged in all four states. The table specifies endpoints; the path variables retained or integrated in each state are described next. Figure 1 shows the two single-tuple assignments. In the cross term, the forward state uses $I'$ and the reverse state uses $I$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.35, 1.782), [#text(size: 9pt)[Forward insertion $O$]])
  content((0, 1.15), [#text(size: 9pt)[$S^C_(i_0)$]])
  content((1.35, 1.15), [#text(size: 9pt)[$S^C_(i_1)$]])
  content((2.7, 1.15), [#text(size: 9pt)[$S^C_(i_2)$]])
  content((1.35, 0), [#text(size: 9pt)[$Y_(i_1)$]])
  content((2.7, 0), [#text(size: 9pt)[$Y_(i_2)$]])
  content((3.645, 0), [#text(size: 9pt)[$z$]])
  content((0, 0), [#text(fill: rgb("#808080"))[#text(size: 9pt)[$Y_(i_0)$]]])
  line((0.3687, 0.836), (1.029, 0.2735), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.675, 0.575), [#text(size: 9pt)[$i_1$]], anchor: "south-west", padding: 0.1176cm)
  line((1.719, 0.836), (2.379, 0.2735), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.025, 0.575), [#text(size: 9pt)[$i_2$]], anchor: "south-west", padding: 0.1176cm)
  line((2.958, 0.836), (3.486, 0.1931), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.173, 0.575), [#text(size: 9pt)[$i_0$]], anchor: "west", padding: 0.1176cm)
  content((0, -0.575), [#text(size: 9pt)[$a$]])
  content((1.35, -0.575), [#text(size: 9pt)[middle cell]])
  content((3.173, -0.575), [#text(size: 9pt)[$b$]])
  content((7.35, 1.782), [#text(size: 9pt)[Reverse insertion $B$]])
  content((6, 1.15), [#text(size: 9pt)[$S^C_(i_0)$]])
  content((7.35, 1.15), [#text(size: 9pt)[$S^C_(i_1)$]])
  content((8.7, 1.15), [#text(size: 9pt)[$S^C_(i_2)$]])
  content((5.055, 0), [#text(size: 9pt)[$x$]])
  content((6, 0), [#text(size: 9pt)[$Y_(i_0)$]])
  content((7.35, 0), [#text(size: 9pt)[$Y_(i_1)$]])
  content((8.7, 0), [#text(fill: rgb("#808080"))[#text(size: 9pt)[$Y_(i_2)$]]])
  line((5.742, 0.836), (5.214, 0.1931), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.527, 0.575), [#text(size: 9pt)[$i_2$]], anchor: "east", padding: 0.1176cm)
  line((6.981, 0.836), (6.321, 0.2735), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.675, 0.575), [#text(size: 9pt)[$i_0$]], anchor: "south-east", padding: 0.1176cm)
  line((8.331, 0.836), (7.671, 0.2735), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.025, 0.575), [#text(size: 9pt)[$i_1$]], anchor: "south-east", padding: 0.1176cm)
  content((5.527, -0.575), [#text(size: 9pt)[$a$]])
  content((7.35, -0.575), [#text(size: 9pt)[middle cell]])
  content((8.7, -0.575), [#text(size: 9pt)[$b$]])
})],
  caption: [Figure 1: Endpoint assignments relative to the same original closed-state starts $S^C$, for a tuple of three labels in successive cells. The forward change opens slot $i_0$ at $z in b$; the reverse change opens slot $i_2$ at $x in a$. Gray points remain outer endpoints but cease to be inner endpoints. Each arrow is labeled by its current slot and reassigns the original start at its tail to that slot. The two panels illustrate the single-tuple changes separately; the second-moment comparison may use different tuples for the forward and reverse changes. Arrows show only assignments, not sampled Brownian trajectories or a spatial straightness condition. ],
) <fig:endpoints>

Identify a tuple with its slot set when taking intersections and differences, and partition the selected slots as

$ sans(h) = I ∩ I' \, quad sans(d) = sans(h) union "pred"_I \( sans(h) \) \, quad sans(j) = I \\ sans(d) \, quad sans(l) = I' \\ sans(h) \, quad sans(L) = \( I union I' \)^c . $

Thus $sans(h)$ contains the shared labels, while $sans(d)$ also contains their predecessors on $I$. In particular $\| sans(d) \| lt.eq 2 \| sans(h) \|$ and $e in sans(d)$, because the first label is shared. The two unshared portions that can cancel are $sans(j)$ and $sans(l)$; $sans(L)$ contains the untouched slots. Let $J$ count cells of $P$ within distance $R_(*)$ of $P'$ and conversely, adding both counts. Call these occurrences near and all others far.

All $sans(L)$ paths agree throughout. On $sans(j)$, $C = O$ for endpoints and paths since the slots are off $I'$, while $B$ has the endpoints of $hat(C)$: the $I$-successor is not shared, hence also off $I'$, and $S_i^B = S_("succ"_I \( i \))^C = S_("succ"_I \( i \))^O = S_i^(hat(C))$ there. On $sans(l)$, $B$ has the endpoints of $C$, and $hat(C) = O$. The separate path integrations off $sans(L)$ and our identification for the comparison are thus:

$ upright("set") & upright("path variables in (27)") & upright("use in ") B\
sans(j) & C_(sans(j)) = O_(sans(j)) \, med hat(C)_(sans(j)) & B_(sans(j)) = hat(C)_(sans(j)) med upright("initially")\
sans(l) & C_(sans(l)) \, med O_(sans(l)) = hat(C)_(sans(l)) & B_(sans(l)) = C_(sans(l))\
sans(d) & C_(sans(d)) \, med hat(C)_(sans(d)) \, med O_(sans(h)) & B_(sans(d)) med upright("fresh") . $

We will also reintegrate some of $sans(j)$ below; $O$ on $sans(d) \\ sans(h)$ equals $C$ there.

We work first on the domain of the original nonzero weights and cuts in (27). All paths there on $I union I'$ in $C \, O \, hat(C)$ satisfy $upright("cut")_R$, by the two cuts in (27) and the two eligibilities. Displacements even for all endpoints needed in conditional integrations are at most $\( D + 10 \) s$: in $O$ use the forward displacement rule from $C$ on $I'$ and from $hat(C)$ on $I$ (indeed $S^O = p_I S^(hat(C))$). This also covers the non-selected slots on the union in $C \, hat(C)$, which individually have the same endpoints as in $O$. For $B$ on $sans(d)$, if the successor is shared use its start from an eligible slot of $C$, close to the successor cell (for $e$ use that $x$ is in the first cell); otherwise the start agrees with $hat(C)$.

For the beginning and end anchors of the integrated rows where (16) is needed the scores against $sans(L)$ are $lt.eq C_0$. In $O$ the starts on $I'$ come from eligible starts of $C$, on $I$ from eligible starts of $hat(C)$; the respective end anchors are covered by eligibility or the dummy $z$ test. Similarly $B_(sans(j)) \, B_(sans(l))$ use eligible endpoints from $hat(C) \, C$; on $sans(d)$ use the successor rule just given and end eligibility of $hat(C)$ or the dummy $x$ test. Paths in $sans(L)$ are the same in the scores. Also any pair between $sans(j) \, sans(l)$ in $O$, and in $B$, has starts separated by more than $r$ and likewise ends: by the indicated eligible sources the starts used on both sets are isolated in the common start multiset, of which each of $O \, B$ assigns distinct elements (indices) to distinct slots. These ordinary end slots are isolated among $Y$ by eligibility in $hat(C) \, C$ respectively (no separation from the exceptional inner end is needed).

All confined bridge measures use nearest lifts. Write $pi_i^X$ for the probability bridge on that lift before imposing the cut, and factor out the kernels $k$ of those individual lifts (not the periodic sums), with product denoted $K_X \( G \)$ on a set $G$. Factor the kernels from the cut normalizations as well (write $overline(cal(Z))$ for the remaining normalization). The proposed-path kernels cancel, and relative to using baseline kernels the ratio left in (27) off $sans(L)$ is

#[#set math.equation(numbering: n => "(28)")
 $ frac(K_C \( I union I' \) K_(hat(C)) \( I \), K_B \( I union I' \) K_O \( I \)) = frac(K_C \( sans(d) \) K_(hat(C)) \( sans(d) \), K_B \( sans(d) \) K_O \( sans(d) \)) lt.eq e^(C \| sans(h) \|) . $ <eq:28>]

=== 10.2 Conditional laws and the two denominator bounds <conditional-laws-and-the-two-denominator-bounds>

For $G = sans(j)$ or $sans(l)$ write $Phi_G^X$ for the exponential of minus the interactions internal to $G$ and with $sans(L)$ only, and $Z \[ G \, X \]$ for its integral with the probability bridges and cuts $R$, fixing $sans(L)$. Use empty-product conventions.

===== 10.2.1 A one-path marginal bound. <a-one-path-marginal-bound.>

In these normalized group distributions an individual path marginal is bounded by $C_4 pi_i^X$. The bound also holds if some other paths of the group are frozen on the cut, normalizing conditionally with their interactions. Indeed, conditional on all other paths, the individual normalization for its incident weight is at least $p_(*)$ times the exponential of minus the expected interactions under its free bridge conditioned on the cut, by Jensen. Against $sans(L)$ use (16) divided by $p_(*)$; other confined paths of the group can interact only from nearby end cells (distance at most $2 R + 5$), a bounded number of slots depending on $R$ by simplicity, and the one-fixed-trajectory expectation bound applies (again divide by $p_(*)$). Thus this incident normalization is at least $p_(*) e^(- C \/ p_(*))$. Positivity $v gt.eq 0$ now gives a uniform conditional density upper bound $C_4$ relative to $pi_i^X$, possibly large but independent of density after fixing the cut and score constants; average the bound for marginals. We use this observation for $sans(j)$ with the endpoints of $C$ (equal to those of $O$) or $B$, and $sans(l)$ with those of $O$.

The needed lower normalizations are

#[#set math.equation(numbering: n => "(29)")
 $ overline(cal(Z))_(I') \( O \) & gt.eq Z \[ sans(l) \, O \] exp \[ - C \| sans(h) \| - o_rho \( 1 \) J \] \,\
overline(cal(Z))_I \( O \) & gt.eq Z \[ sans(j) \, C \] exp \[ - C \| sans(h) \| - o_rho \( 1 \) J \] . $ <eq:29>]

Here the small coefficients tend to zero after all cut and eligibility constants have been fixed. For the first, sample $sans(l)$ with its normalized group law, and $sans(h)$ independently with product free bridges conditioned on the cuts. Writing $cal(V)_(G \, G')$ for the summed interactions between disjoint groups (internal pairs once for $cal(V)_(G \, G)$), the ratio to $Z \[ sans(l) \, O \]$ is the product of free cut probabilities on $sans(h)$ times

$ bb(E) exp \[ - cal(V)_(sans(l) \, sans(j)) - cal(V)_(sans(l) \, sans(d) \\ sans(h)) - cal(V)_(sans(h) \, sans(L) union sans(j) union \( sans(d) \\ sans(h) \) union sans(l)) - cal(V)_(sans(h) \, sans(h)) \] $

with the complement frozen in $O$. The interaction of $sans(l)$ with the frozen $sans(j)$ costs at most $C \/ sqrt(r)$ in expectation per nearby pair: it is zero in the boundary intervals by endpoint separation and both restraints (distance at least $r - 2 r \/ 10 > R_v$), and use marginal domination after those intervals. There are at most $C \( R \) J$ possible pairs, since end cells must be within $2 R + 5$ and are distinct within each set. Interaction with frozen $sans(d) \\ sans(h)$ costs at most $C \| sans(d) \|$, without needing the small bound. The independently sampled paths cost at most $C \| sans(h) \|$ with $sans(L)$ by (16) and with the other integrated or frozen paths by the fixed-trajectory bound and confinement (only a bounded number of slots in a fixed-radius end-cell neighborhood in these latter groups, allowing the special end). Jensen gives the first bound.

For the second denominator, sample $sans(j)$ with its group law (the endpoints of $C$, which agree with those of $O$ on this set), and sample $sans(d)$ with independent free cut bridges. The frozen selected complement is now $sans(l)$. The missing interactions are

$ cal(V)_(sans(j) \, sans(l)) \, #h(2em) cal(V)_(sans(d) \, sans(L) union sans(j) union sans(l)) \, #h(2em) cal(V)_(sans(d) \, sans(d)) . $

The first sum costs $C r^(- 1 \/ 2) J$, using the same endpoint separation in $O$ and the marginal bound for $sans(j)$. The other sums and the free cut probabilities cost $C \| sans(d) \| lt.eq 2 C \| sans(h) \|$. Jensen’s inequality gives the second line of (29).

===== 10.2.2 The remaining normalized factors. <the-remaining-normalized-factors.>

Using (28) and (29), drop interaction costs from the numerator weights by positivity except for: internal $sans(L)$; $Phi_(sans(j))^C \, Phi_(sans(l))^C$ from the closed weight; $Phi_(sans(l))^O$ from the proposal; $Phi_(sans(j))^(hat(C))$ from the hypothetical old weight.

To spell out the remaining integrations, let $pi_G^X$ denote probability-bridge products, $c_G^X = upright(bold(1))_(upright("cut")_R \( X_G \))$, and $d nu_G^X = c_G^X Phi_G^X d pi_G^X \/ Z \[ G \, X \]$ for the normalized groups. Besides the exponential comparison factors, the choice weights/constraints, $K_B \( I union I' \)$ and the original internal measure on $sans(L)$, the upper integrand on the nonzero domain now uses

$ \( c_(sans(l))^C Phi_(sans(l))^C thin d pi_(sans(l))^C \) \( c_(sans(j))^(hat(C)) Phi_(sans(j))^(hat(C)) thin d pi_(sans(j))^(hat(C)) \) med d nu_(sans(j))^C thin d nu_(sans(l))^O thin d pi_(sans(d))^C thin d pi_(sans(d))^(hat(C)) thin d pi_(sans(h))^O . $

In particular the extras $C_(sans(j)) \, O_(sans(l))$ occur as normalized factors (fixing just endpoints and $sans(L)$ in their laws); all cuts inserted in these measures hold on the original domain. We still account for constraints and far choice weights below. For a near occurrence in cell $Q$ bound the value of the choice factor on the nonzero domain by $\[ \( 1 - epsilon \) n_Q \]^(- 1)$ for count $n_Q$ of that outer cell. We can and do carry the indicator of the original constraints (including both nonzero choices) even when bounding such values; in particular the counts along both paths are in the stated occupancy interval there.

=== 10.3 Restoring the baseline interaction weight <restoring-the-baseline-interaction-weight>

We describe the weight restoration in $B$. Put in $sans(j)_n subset.eq sans(j)$ those with end cell within $2 R + 5$ of some $sans(l)$ cell; other $sans(j)$ cannot interact with $sans(l)$ on the cuts.

===== 10.3.1 Fixed data and feasible fibers. <fixed-data-and-feasible-fibers.>

Throughout this step, all endpoints, tuples, cell paths and skeletons are fixed. The path integrations divide as follows:

$ upright("role") & upright("path variables")\
upright("fixed in both integrals") & sans(L) \, quad B_(sans(l)) = C_(sans(l)) \, quad B_(sans(j) \\ sans(j)_n) = hat(C)_(sans(j) \\ sans(j)_n)\
upright("integrated in the original term") & hat(C)_(sans(j)_n) \, quad C_(sans(j)) \, quad O_(sans(l)) \, quad C_(sans(d)) \, quad hat(C)_(sans(d)) \, quad O_(sans(h))\
upright("integrated in the baseline term") & B_(sans(j)_n) \, quad B_(sans(d)) . $

Call the fixed data #emph[feasible] if some choice of the remaining original paths satisfies both nonzero selection weights, their specified adaptations, and the cuts. Call such a choice a #emph[witness]. We only need an upper comparison on feasible data: otherwise the original inner integral vanishes. The probability laws of the extra original paths depend only on the fixed endpoints and $sans(L)$, not on $hat(C)_(sans(j)_n)$.

===== 10.3.2 Restoring the missing interactions. <restoring-the-missing-interactions.>

First consider interaction weights alone. The bound needed for replacing the $hat(C)_(sans(j)_n)$ integral by a baseline integral is

#[#set math.equation(numbering: n => "(29a)")
 $ Phi_(sans(l))^B integral c_(sans(j)_n)^B Phi_(sans(j))^B thin d pi_(sans(j)_n)^B med lt.eq med e^(C \| sans(h) \| + o_rho \( 1 \) J) integral c_(sans(j)_n)^B c_(sans(d))^B exp #h(-0.16667em) #scale(x: 180%, y: 180%)[\[] - sum_({ i \, i' } subset.eq.not sans(L)) cal(V)_(i i') \( B \) #scale(x: 180%, y: 180%)[\]] thin d pi_(sans(j)_n)^B d pi_(sans(d))^B \, $ <eq:restoring-weights>]

where the sum is over unordered pairs of distinct slots indicated.

Indeed, normalize $c_(sans(j)_n)^B Phi_(sans(j))^B thin d pi_(sans(j)_n)^B$ with $B_(sans(j) \\ sans(j)_n)$ frozen, and independently sample $sans(d)$ by free bridges conditioned on their cuts. The earlier one-path marginal bound applies also to this partially frozen group: the score against $sans(L)$ is still bounded, and only boundedly many frozen or integrated $sans(j)$ paths can be nearby. The ratio of the full cut integral on the right to the product on the left is the free cut probability product on $sans(d)$, multiplied by the expectation of the exponential of minus the missing interactions.

The $sans(j)_n$–$sans(l)$ interactions cost $o_rho \( 1 \) J$ by marginal domination, endpoint separation and the boundary restraints. The frozen remainder of $sans(j)$ cannot interact with $sans(l)$ on the cuts. Interactions incident to $sans(d)$ cost $C \| sans(d) \|$ by the free cut bounds, including (16). Jensen and the cut probabilities prove (29a). Its endpoint and frozen-path hypotheses follow from original feasibility, independently of the reintegrated paths.

This inequality concerns interaction weights alone. To apply it to the original integral, we must still account for the far selection factors and the path-adaptation constraints. The next step proves that their needed properties hold for every baseline cut replacement.

=== 10.4 Tracking the constraints in this comparison <tracking-the-constraints-in-this-comparison>

The original choices depend on which cells are usable and which slots are eligible. We now compare those tests between any original witness and every replacement of $B_(sans(j)_n) \, B_(sans(d))$ on the cuts, with the other data fixed as above. This universal comparison will justify using (29a) inside the constrained integral.

In $B$, use the outer tuple $Y$, including $Y_e$, for cell counts and end isolation, and declare the exceptional slot $e$ ineligible. Other eligibility tests use the starts and paths as before; the exceptional path is included in all score sums. Let $S_0 \( B \)$ be the resulting unusable cells. Define $S_1 \( B \)$ by the stricter score threshold $C_0 - Delta_A$ and the stronger required eligible fraction $1 - epsilon \/ 2$, with the same occupancy interval. Thus $S_0 \( B \) subset.eq S_1 \( B \)$. Write $S \( C \) \, S \( hat(C) \)$ for the unusable cells in the two witness states. The table compares the tests; its last column gives the ineligible fraction causing failure when the count lies in the allowed interval.

$ upright("bad-cell set") & upright("allowed count") & upright("score cutoff") & upright("failure fraction")\
S \( C \) \, S \( hat(C) \) \, S_0 \( B \) & \[ b_(-) m \, b_(+) m \] & C_0 & > epsilon\
S_1 \( B \) & \[ b_(-) m \, b_(+) m \] & C_0 - Delta_A & > epsilon \/ 2\
upright("defective cells") & \[ 2 b_(-) m \, b_(+) m \/ 2 \] & C_0 - Delta_A & gt.eq epsilon \/ 4 . $

Counts outside the displayed interval also cause failure. The symmetric defective test uses actual inner endpoints, whereas $S_0 \( B \) \, S_1 \( B \)$ use the outer-end convention just specified. The witness states $C$ and $hat(C)$ are closed, so their inner ends are $Y$.

#thm([Lemma 10.2.])[
  (Stability under every cut replacement).  #emph[Fix feasible endpoint and path data as in the preceding subsection. For every replacement of $B_(sans(j)_n) \, B_(sans(d))$ on the cuts and every original witness $C \, hat(C)$, one has 
#[#set math.equation(numbering: n => "(30)")
 $ S \( C \) \, S \( hat(C) \) med subset.eq S_1 \( B \) \,\
S \( C \) = S_0 \( B \) med upright("pointwise outside distance ") R_(*) upright(" of ") P \,\
S \( hat(C) \) = S_0 \( B \) med upright("pointwise outside distance ") R_(*) upright(" of ") P' . $ <eq:30>]

 In the far cells specified by the last two lines, all individual eligibility indicators and eligible counts agree as well.]
] <lem:replacement-stability>

#proof[
  The state $C$ differs from $B$ only on $I$, and $hat(C)$ differs from $B$ only on $sans(l) \, sans(d) \, sans(j)_n$. All changed paths in either comparison are confined. Their slots lie on at most two simple cell paths, with the special inner end of $B$ in $a$.
  At an unchanged slot’s anchor, the change in either score is at most $Delta_A$. Indeed only changed paths with actual inner ends within $\( R + R_A \) s$ of the anchor can contribute. In either state their number is at most $2 \( 2 R + 2 R_A + 4 \)^3 + 1$, by outer-cell counting and the one moved exceptional end; also $integral_0^(delta \/ 2) w lt.eq 3$. Start isolation is unchanged because the unordered start tuple is unchanged, and ordinary outer-end isolation is unchanged as well. Consequently the eligible count in either witness is at least the stricter eligible count of $B$ minus two per outer cell, allowing for the changed slots. If a cell passes the $S_1 \( B \)$ test, then its witness eligible count is at least $\( 1 - epsilon \/ 2 \) n_Q - 2 gt.eq \( 1 - epsilon \) n_Q$ for sufficiently large $m$. The occupancy counts are identical. This proves the inclusion in (30) by contraposition.
  For exact equality, changed paths comparing with $C$ lie near $P$. Comparing with $hat(C)$, their end cells lie within $2 R + 5$ of $P'$: note $sans(d)$ uses shared slots or their predecessors, including the last cell $b$, and the special end is in $a$. In a cell beyond the respective distance $R_(*)$ there are no changed slots; an unchanged macro-conforming path has both anchors close enough to its cell that scores are exactly unchanged by the indicator cutoff in (15), and a macro failure stays ineligible anyway. The choice of $R_(*)$ more than covers these distances. This proves equality of all actual eligibility flags and counts in the respective far cells. ◻
]

===== 10.4.1 Lists containing every feasible pair. <lists-containing-every-feasible-pair.>

Define an explicit path predicate given $B \, gamma \, gamma'$. Partition $S_1 \( B \)$ into components with adjacency distance up to $K_b = 2 R_(*) + 10$. Call components bridges if within $R_(*) + 2$ of both skeletons (set distances), and put $b_(upright("tot"))$ equal to the sum of their sizes. For the list of possible $P$, take arbitrary subsets of cells in the bridge components as bad; from every nonbridge component intersecting $gamma$ take its intersection with $S_0 \( B \)$ as bad, ignoring the others. Run the deterministic cell-set adaptation for these sets, listing paths when it accepts geometrically. Similarly list $P'$ using $gamma'$. Let $G$ be the predicate that both given paths are on the respective lists.

The lists depend only on $B \, gamma \, gamma'$; $G$ tests membership of the given cell-path pair and has no further dependence on its labels.

#thm([Lemma 10.3.])[
  (Path lists and their encounter bound).  #emph[For every original witness and every baseline cut replacement in Lemma 18, the witness paths $P \, P'$ satisfy $G$. For arbitrary $B$, the lists contain at most $4^(b_(upright("tot")))$ path pairs. Every listed pair satisfies 
#[#set math.equation(numbering: n => "(31)")
 $ J lt.eq J_0 + C \( R_(*) \) b_(upright("tot")) . $ <eq:32>]

 Here $J_0$ counts encounters of the original skeletons, as in Lemma 15.]
] <lem:path-lists>

#proof[
  First fix a witness and any cut replacement. A nonbridge component of $S_1 \( B \)$ intersecting $gamma$ stays outside distance $R_(*)$ of $P'$. If it approached a skeleton vertex of $P'$, it would be a bridge. If it approached a detour vertex, it would join, in the $K_b$ adjacency, the potential component containing that detoured obstacle, which is hit by $gamma'$. It would again be a bridge. Therefore (30) identifies the actual bad subset of $hat(C)$ on this whole nonbridge component as its intersection with $S_0 \( B \)$.
  On bridge components, choose the guessed subsets to be the actual bad cells of $hat(C)$. Every actual nearest-neighbor bad component lies in a single $K_b$-component of $S_1 \( B \)$, and every such component hit by $gamma$ is retained. The reconstructed set therefore removes only whole actual bad components not hit by $gamma$. Lemma 16 preserves acceptance and the adapted path under precisely these deletions. Hence $P$ is listed. The same argument with $C \, gamma'$ gives $P'$. This reasoning holds for every replacement.
  There are at most $2^(b_(upright("tot")))$ guesses for each path, giving $4^(b_(upright("tot")))$ pairs. To bound their encounters, first count near occurrences that lie on their own skeleton and have an opposite-skeleton vertex within distance $R_(*)$. Since the adapted paths are simple, these occurrences inject into the corresponding counts of $J_0$.
  Every remaining near occurrence is a detour vertex or is close to an opposite detour vertex. Any detour participating in such an encounter belongs to a bridge component: it is adjacent to its obstacle, which is hit by its skeleton, and either lies close to the other skeleton or joins the component of an opposite detoured obstacle in the $K_b$ adjacency. Across both paths, these detours use at most $12 b_(upright("tot"))$ vertices by Lemma 16. Their fixed-radius neighborhoods contain at most $C \( R_(*) \) b_(upright("tot"))$ cells. Simplicity bounds the number of path occurrences in those cells by twice this number. This proves (31) with coefficient one on $J_0$. The argument also applies to guessed subsets: their nearest-neighbor obstacles remain within components of $S_1 \( B \)$. ◻
]

===== 10.4.2 The common far-choice product. <the-common-far-choice-product.>

For a slot, its choice factor in $B$ is its eligible indicator divided by the eligible count in its outer cell, using the $S_0 \( B \)$ criteria and assigning zero when the count is zero. Let $H_F \( B \)$ be the product of these factors for the selected far occurrences of both paths. Unlike the path lists, this product depends on the selected labels. Its indicators and denominators are nevertheless all evaluated on the same fixed baseline configuration.

Lemma 18 identifies these factors exactly with the original far factors: $P$ uses $hat(C)$ and $P'$ uses $C$. At feasible fixed data their product therefore has a common value $H_(*)$ for all original witnesses and all cut replacements. Indeed, the equality holds between #emph[any] witness and #emph[every] replacement, and the replacement cuts are nonempty. This is the selection property needed to apply (29a).

Explicitly, at those fixed variables let $cal(D)$ impose the original remaining constraints, $H_(upright("old"))$ be the far product there, and use the product probability measure

$ d cal(P) = d nu_(sans(j))^C thin d nu_(sans(l))^O thin d pi_(sans(d))^C thin d pi_(sans(d))^(hat(C)) thin d pi_(sans(h))^O $

on the extras (its laws do not depend on the integrated $hat(C)_(sans(j)_n)$). Having bounded the near factors, the needed inequalities on feasibility, omitting the cut indicators equal to one on the fixed paths in $sans(j) \, sans(l)$, are

$ & Phi_(sans(l))^B integral c_(sans(j)_n)^(hat(C)) Phi_(sans(j))^(hat(C)) upright(bold(1))_(cal(D)) H_(upright("old")) thin d pi_(sans(j)_n)^(hat(C)) thin d cal(P)\
 & quad lt.eq H_(*) thin Phi_(sans(l))^B integral c_(sans(j)_n)^B Phi_(sans(j))^B thin d pi_(sans(j)_n)^B\
 & quad lt.eq e^(C \| sans(h) \| + o_rho \( 1 \) J) integral c_(sans(j)_n)^B c_(sans(d))^B exp #h(-0.16667em) #scale(x: 180%, y: 180%)[\[] - sum_({ i \, i' } subset.eq.not sans(L)) cal(V)_(i i') \( B \) #scale(x: 180%, y: 180%)[\]] upright(bold(1))_G H_F \( B \) thin d pi_(sans(j)_n)^B d pi_(sans(d))^B . $

The first inequality removes the original constraints only after factoring out their common far product. The second uses (29a) and Lemma 19: $upright(bold(1))_G H_F \( B \) = H_(*)$ everywhere on the cut replacements. At infeasible data the original inner integral is zero, so its comparison with the nonnegative baseline integral is automatic. Thus the argument compares inner integrals at fixed data, without choosing replacements according to the number of witnesses they admit.

For precision, denote the original conditional path integral by

$ cal(I)_(I \, I') =  & integral W \( C \) h_(gamma') \( C \, I' \) frac(upright(bold(1))_(upright("cut")_R \( O_(I') \)) W_(I')^O, cal(Z)_(I') \( O \))\
 & #h(5mm)  dot.op frac(upright(bold(1))_(upright("cut")_R \( O_I \)), cal(Z)_I \( O \)) W_I^(hat(C)) h_gamma \( hat(C) \, I \) . $

The integrations are over the original closed paths, proposed paths on $I'$, and hypothetical old paths on $I$, with the endpoints, tuples, and skeletons fixed. Let $upright(bold(1))_(upright("occ"))$ require that the outer counts lie in $\[ b_(-) m \, b_(+) m \]$ in every cell of both paths.

#thm([Lemma 10.4.])[
  (Integrated cross comparison).  #emph[Fix two simple star cell paths from $a$ to $b$, their label tuples matching the outer $Y$-cells and having a common first label, two skeletons, and endpoint data $Y \, S^C \, x \, z$ as in (27). With $B$, the near occurrences, $G$, and $H_F \( B \)$ defined above, one has 
#[#set math.equation(numbering: n => "(32)")
 $ cal(I)_(I \, I') lt.eq  & e^(C \| sans(h) \| + sigma_rho J) upright(bold(1))_(upright("occ")) product_(upright("near occurrences")\
upright("in cell ") Q) \[ \( 1 - epsilon \) n_Q \( Y \) \]^(- 1)\
 & #h(8mm)  dot.op integral W \( S^B \, E^B \; d omega \) thin upright(bold(1))_G H_F \( B \) . $ <eq:31>]

 Here $C < oo$ is fixed and $sigma_rho gt.eq 0$ tends to zero as $rho arrow.b 0$ after the cutoffs are fixed, uniformly in all permitted volumes and temperatures. A cell on both paths is counted twice in the product. The right side is zero when the occupancy condition fails.]
] <lem:cross>

#proof[
  The preceding inner-integral comparison proves the displayed bound on every feasible fiber. On an infeasible fiber the original contribution is zero. We explain the remaining bookkeeping to specify precisely how the full integral is recovered. Keep $sans(L) \, B_(sans(l)) \, B_(sans(j) \\ sans(j)_n)$ fixed and integrate the extensions in $sans(j)_n \, sans(d)$ as in the displayed ledger. Whenever the original domain is nonempty, all the nearest-kernel factorizations apply. Restore the baseline kernels from (28), then integrate the fixed paths. Finally drop the remaining cut and nearest-lift restrictions from the baseline integral by positivity, obtaining (32). Its predicates are measurable functions of the baseline paths, specified by finite cell algorithms. This use of the conditional comparison is valid pointwise at the fixed data: a positive original inner integral has a witness, and otherwise the required upper bound is automatic. ◻
]

The conditional comparison is now established. To average its path-list cost, we need the defect bound under the reverse insertion. Under $mu_(a b)$, with $e$ the opened slot in each term, every specified cell set $cal(U)$ satisfies

#[#set math.equation(numbering: n => "(33)")
 $ mu_(a b) \( cal(U) subset.eq S_1 \( B \) \) lt.eq C M^(- 2) q^(\| cal(U) \|) \, #h(2em) q = q_(upright("cl"))^(1 \/ 4) \, $ <eq:33>]

including the empty set bound. To compare to the symmetric defective test replace the exceptional outer endpoint by its actual inner end for counting and isolation. Counts change by at most one; only a bounded number of other end-isolation flags can change: those isolated before but not after are mutually separated by more than $r$ and within $r$ of the new point, and analogously in reverse (use packing). Their other tests are unchanged. Allow also the exceptional slot itself. For a potential bad cell with count $n_Q \( Y \)$ in the occupancy interval, the ineligible count in the actual stricter-score test is thus at least $\( epsilon \/ 2 \) n_Q \( Y \) - C$, giving at least fraction $epsilon \/ 4$ for large $m$; counts outside the interval imply the widened count defect after any change by one. This works pointwise in all the specified cells. Now apply (22) and (23).

=== 10.5 Summing the comparison <summing-the-comparison>

The conditional comparison is now complete, including its selection predicates. We sum first over labels at fixed baseline paths, then over the finite lists of possible cell paths. The remaining environment average will be controlled by the insertion defect bound and the two skeleton moments.

===== 10.5.1 Summing label choices. <summing-label-choices.>

Sum (32) over candidate cell-path pairs and their tuples; this candidate range depends on $a \, b \, Y$, but not on the starts. For each tuple pair change variables from $S^C$ to $S^B$. The outer kernel is invariant. Group terms by the last label $e$ of $I$, whose outer end lies in $b$. At fixed $e$ and baseline configuration, the baseline measure, $S_0 \, S_1$, and the path lists are independent of every other label choice.

Fix a listed pair satisfying the occupancy bound. A far cell occurs on only one path, and summing its choice factor from $H_F \( B \)$ costs at most one. Each near occurrence contributes a factor $\( 1 - epsilon \)^(- 1)$. After removing these factors, the remaining cellwise sums are

$ upright("cell") & upright("label choices") & upright("upper bound")\
upright("ordinary common cell ") Q & upright("two independent labels") & 1 + \( e^C - 1 \) \/ n_Q\
upright("first cell ") a & upright("one shared label") & e^C \/ n_a\
upright("last cell ") b & upright("first tuple’s label fixed to ") e & \[ 1 + \( e^C - 1 \) \/ n_b \] \/ n_b . $

For example, at an ordinary common cell, the $n_Q$ coincident choices carry $e^C$ and the $n_Q \( n_Q - 1 \)$ distinct choices carry one, all divided by $n_Q^2$. At $a$ the two tuples must share their first label; at $b$ one of the two labels is fixed by the grouping. The endpoint cells are distinct. Simplicity makes these sums independent across cells, since labels in different outer cells cannot coincide. Using $n_Q gt.eq b_(-) m$ and including $e^(sigma_rho J)$ gives the bound

$ C / m^2 e^(kappa_0 J) \, #h(2em) kappa_0 = 2 epsilon + o_rho \( 1 \) . $

Lemma 19 now sums the cell-path pairs, giving $C m^(- 2) exp \( kappa_0 J_0 + C' b_(upright("tot")) \)$ with fixed $C'$.

===== 10.5.2 Recovering the reverse insertion. <recovering-the-reverse-insertion.>

There is no remaining dependence on the dummy-for-$B$ point $z$ within $b$; its base integral there gives $1 \/ M$. Together with the prefactor of (27) we have $m \/ \( m^2 M \) = 1 \/ N$; summing $e$ with $Y_e$ in $b$ and integrating the baseline with $x$ in $a$ using $d x \/ V$ now gives exactly $mu_(a b)$, with outer endpoint in $b$ and new inner endpoint in $a$, as defined in Section 7. Thus

#[#set math.equation(numbering: n => "(34)")
 $ integral f^2 thin upright(d) mu lt.eq C sum_(a \, b med upright("valid")) bb(E)_(gamma \, gamma') #h(-0.16667em) [e^(kappa_0 J_0) integral e^(C' b_(upright("tot"))) thin d mu_(a b)] . $ <eq:34>]

===== 10.5.3 The exponential moment of rare components. <the-exponential-moment-of-rare-components.>

For fixed skeletons, we claim

$ integral e^(C' b_(upright("tot"))) thin d mu_(a b) lt.eq C / M^2 exp #h(-0.16667em) [theta.alt \( q \) S_(K_b)] \, #h(2em) theta.alt \( q \) arrow.r 0 quad \( q arrow.b 0 \) \, $

where $S_(K_b)$ is the soft-distance sum of Lemma 15. This is the estimate that allows the environment average in (34) to use the second skeleton moment.

Expand the product over realized bridge components of $S_1 \( B \)$ with factors $1 + \( e^(C' \| T \|) - 1 \)$. Bound it by the sum over unordered collections of disjoint connected sets $T$ in the $K_b$ adjacency, each within $R_(*) + 2$ of both skeletons, requiring their cells to lie in $S_1 \( B \)$. Apply (33) to each union. Summing the products and then dropping disjointness gives

$ C M^(- 2) exp #scale(x: 180%, y: 180%)[\(] sum_T \( e^(C') q \)^(\| T \|) #scale(x: 180%, y: 180%)[\)] $

(the sum in the exponent is over individual qualifying sets).

Root their counting near vertex occurrences $z in gamma$; there are a bounded number of root cells per occurrence and at most $C \( K_b \)^j$ connected sets of size $j$ per root by the bounded degree. To reach the other skeleton requires $d_oo \( z \, gamma' \) lt.eq 2 \( R_(*) + 2 \) + K_b j$. Consequently the exponent sum is at most

$ o_q \( 1 \) sum_(z in gamma) e^(- d_oo \( z \, gamma' \) \/ K_b) $

by a geometric series: per root sum $\( C \( K_b \) e^(C') q \)^j$ only at sizes with $d_oo \( z \, gamma' \) \/ K_b lt.eq j + 2 \( R_(*) + 2 \) \/ K_b$, extracting the displayed distance decay.

The geometric-series bound proves the claim with a coefficient $theta.alt \( q \) arrow.r 0$. Take density small enough that $2 kappa_0 lt.eq alpha$ and $2 theta.alt \( q \) lt.eq xi \( K_b \)$. Cauchy–Schwarz and (24)–(25) then give, for each valid pair,

$ bb(E)_(gamma \, gamma') [e^(kappa_0 J_0) integral e^(C' b_(upright("tot"))) thin d mu_(a b)] lt.eq C / M^2 #scale(x: 120%, y: 120%)[\(] bb(E) e^(2 kappa_0 J_0) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E) e^(2 theta.alt \( q \) S_(K_b)) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq C / M^2 . $

There are at most $M^2$ ordered pairs. Substitution into (34) proves Proposition 17.

== 11 Choice of constants and the limits <sec:conclusion>

We assemble the finite-volume estimate and make its uniformity explicit. The cutoffs are fixed from the potential before the density is reduced; the volume threshold is chosen afterward at each fixed density. This order also permits the zero-temperature limit at fixed volume.

#proof[
  The change of measure in Section 9 has mass at least $upsilon \/ 2$. Proposition 17 gives $integral f^2 thin upright(d) mu lt.eq C_v$, where $C_v$ is independent of $rho \, L \, N \, T$ after the fixed cutoff choices. Since $mu$ has total mass $q_0$, Cauchy–Schwarz yields
  $ q_0 gt.eq frac(upsilon^2, 4 C_v) = : c_(*) \( v \) > 0 . $
  We specify why all choices can be made without introducing density or temperature dependence into this constant.
  Choose the parameters in this order.
  + Fix the localization multipliers in the upper density estimates, reserving the positive energy fraction used for isolation in (13). Fix the small particle-addition fraction $eta$, then $K$ large enough for the lower density estimate, and then the occupancy constants $b_(-) \, b_(+)$.
  + Choose the macro cutoff $D$ large, with $epsilon = alpha \( D \) \/ 20$ as in Lemma 15. The quantity $alpha \( D \)$ decreases only polynomially in $D$, whereas the macro failure bound in (17) decreases as a Gaussian tail. Thus both the marked-color gap condition and the required macro smallness for (22) hold.
  + Choose $zeta > 0$ small enough for the isolation tail, and then $C_0$ large enough for the joint score tails and the two uniform dummy anchor tests. All these constants are now fixed, depending only on $v$.
  + Decrease $rho_(*) \( v \)$ to satisfy every small-density restriction. In particular $r = zeta rho^(- 1 \/ 3)$, $m asymp rho^(- 1 \/ 2)$, and $lambda_0 m = r sqrt(rho) thin m asymp rho^(- 1 \/ 3)$ tend to infinity. The joint defect parameter tends to zero. Fixed conditional bridge bounds may be large, but the encounter terms they multiply contain $r^(- 1 \/ 2)$ or $m^(- 1)$ and hence tend to zero. Therefore $2 kappa_0 lt.eq alpha$, and twice the coefficient in the soft-distance component bound is within the threshold of (25).
  + At each $rho < rho_(*) \( v \)$ choose $L_0 \( rho \, v \)$ large enough for all torus lifts, grids, and geometric rejection bounds. None of these conditions requires a further temperature restriction within $0 < T lt.eq rho^2$.
  This gives the claimed finite-volume lower bound at positive temperature.
  At fixed such $N \, L$, the labelled Schrödinger semigroup is positivity improving: the free heat kernel is strictly positive and the bounded interaction gives a strictly positive Feynman–Kac weight. Compact resolvent and positivity improvement give a unique positive normalized ground eigenfunction. Permutation invariance then makes it symmetric, so it is also the unique bosonic ground state. The normalized Gibbs state converges in trace norm to its projector as $beta arrow.r oo$. The occupation observable $N^(- 1) sum_i \( \| u_0 chevron.r chevron.l u_0 \| \)_i$ is bounded by one; its expectation therefore converges as well. The lower bound, already uniform over $beta gt.eq rho^(- 2)$, survives at $T = 0$.
  Finally fix $rho$ and $T$ in the stated ranges. Every sequence with $L arrow.r oo$ and $N \/ L^3 arrow.r rho$ eventually satisfies both the density band and the volume threshold. The same $c_(*) \( v \)$ applies to each late member, proving the asserted lower limit. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
