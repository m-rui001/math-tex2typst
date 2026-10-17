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

#align(center)[#text(size: 16pt, weight: "bold")[The canonical massive continuum limit \
of the two-dimensional $O \( 3 \)$ model]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

==== 1 Introduction <sec:introduction>

The two-dimensional nonlinear sigma model asks how a field constrained to a curved compact target can produce a relativistic quantum field theory at distances much larger than a lattice spacing. For the sphere $S^2$, the basic lattice model has a particularly simple definition. On a finite periodic square lattice $Lambda$, let $q_x in S^2 subset bb(R)^3$ and let $sigma$ be normalized area measure on $S^2$. Its Gibbs probability is

#[#set math.equation(numbering: n => "(1)")
 $ thin upright(d) mu_(beta \, Lambda) \( q \) = 1 / Z_(beta \, Lambda) exp #h(-0.16667em) (beta sum_({ x \, y } in E \( Lambda \)) q_x dot.op q_y) product_(x in Lambda) thin upright(d) sigma \( q_x \) \, #h(2em) beta > 0 \, $ <eq:lattice-model>]

where each nearest-neighbor bond occurs once. We consider no topological term and no external field. The continuum problem is to let the coupling $beta$ diverge and the lattice spacing vanish while preserving a nontrivial physical scale. A mass estimate at fixed lattice spacing does not settle this problem: one must construct the same limiting fields on which the limiting gap acts.

===== 1.1 Historical context <subsec:history>

The nonordering theorem of Mermin and Wagner, and Mermin’s classical version, exclude spontaneous magnetization in the corresponding finite-range two-dimensional systems #cite(label("MW")) #cite(label("Mermin1967")). McBryan and Spencer obtained algebraic upper bounds on spin correlations by complex rotations #cite(label("McBryanSpencer")). Such an upper bound does not distinguish algebraic decay from exponential decay. Local Ward identities gave further correlation inequalities and high-temperature mass-gap criteria in the work of Aizenman and Simon #cite(label("AizenmanSimonWard")). A continuum mass theorem additionally requires control as the bare inverse coupling diverges and the lattice spacing vanishes.

For more than two spin components, perturbative renormalization predicts that weak microscopic coupling produces an exponentially large correlation length. Polyakov identified the renormalization-group mechanism for two-dimensional Goldstone fields #cite(label("Polyakov")). Brézin and Zinn-Justin developed the expansion near two dimensions, and Brézin, Zinn-Justin and Le Guillou analyzed the renormalization of the model and its composite operators #cite(label("BrezinZinnJustin")) #cite(label("BrezinZinnJustinLeGuillou")). These works explain why weak microscopic coupling can coexist with a finite long-distance mass scale. They also identify the perturbative coefficients against which a constructive renormalization should be checked. Establishing those coefficients is logically different from bounding the nonperturbative remainder throughout a trajectory whose length diverges with the cutoff.

Integrability gives a complementary and much more detailed picture of the expected continuum theory. Zamolodchikov and Zamolodchikov solved the factorization, crossing and unitarity equations for $O \( N \)$-invariant scattering and identified the sigma-model solution #cite(label("ZamolodchikovZamolodchikov")). Hasenfratz, Maggiore and Niedermayer obtained the exact mass-to-renormalization-scale relation for $O \( 3 \)$ and $O \( 4 \)$ by matching the Bethe ansatz with perturbation theory #cite(label("HasenfratzMaggioreNiedermayer")); Hasenfratz and Niedermayer extended the calculation to arbitrary $N gt.eq 3$ #cite(label("HasenfratzNiedermayer")). Those calculations determine a mass ratio within the integrable continuum description. The additional problem addressed here is to construct the field distributions from the specified nearest-neighbor measure and to establish their spectral properties after removal of the cutoff. No factorized scattering matrix is used as a premise of the construction.

Susceptibility and second-moment correlation length provide intrinsic field and length units. This is the familiar zero-momentum normalization, used explicitly by Campostrini, Pelissetto, Rossi and Vicari #cite(label("CampostriniPelissettoRossiVicari1997")). Their strong-coupling calculations and the lattice–bootstrap comparisons of Balog and collaborators #cite(label("BalogEtAl1999")) studied normalized amplitudes and supplied evidence for continuum universality. Here the question is convergence of the entire canonically normalized Schwinger hierarchy for the specified nearest-neighbor model and periodic thermodynamic state, as the bare coupling tends to infinity without restriction to a selected sequence. Comparing this limit with a terminal-coupling construction requires control of both the field distributions and the normalizing correlation moments.

Rigorous work has supplied several distinct parts of this program. Kupiainen proved asymptotic validity of the $1 \/ N$ expansion for lattice models above the spherical-model critical temperature and obtained a mass gap for sufficiently large $N$ at each such temperature #cite(label("Kupiainen")). Kopper later proved mass generation at sufficiently large finite $N$ with a suitable ultraviolet cutoff #cite(label("Kopper")). These large-$N$ results do not specialize to a cutoff-removed construction at $N = 3$. Gawędzki and Kupiainen constructed a continuum limit with asymptotic freedom for a sigma model with a #emph[hierarchical] kinetic term #cite(label("GawedzkiKupiainen")). In that setting the hierarchical covariance reduces the flow to a single-spin recursion. For the nearest-neighbor model, integration generates interactions between blocks whose spatial decay must be controlled. Mitter and Ramadas constructed the Wilson renormalized trajectory in perturbation theory in the effective charge and developed the corresponding effective-action analysis #cite(label("MitterRamadas")).

The organization by successive block integrations belongs to the renormalization-group tradition of Kadanoff and Wilson #cite(label("Kadanoff")) #cite(label("Wilson")). Bałaban developed localized effective actions and constrained variational methods in lattice gauge theory #cite(label("BalabanGaugeFlow")) #cite(label("BalabanGaugeVariational")) and in the low-temperature analysis of classical $N$-vector models #cite(label("BalabanFlow")) #cite(label("BalabanVariational")). Goswami studied the constrained background-field problem for two-dimensional $S U \( n \)$ chiral models, including the $O \( 4 \)$ case #cite(label("Goswami2024")). For the two-dimensional $O \( 4 \)$ model, Dybalski, Stottmeister and Tanimoto proved existence and uniqueness for the constrained small-field variational problem associated with one block-averaging operation #cite(label("DybalskiStottmeisterTanimotoVariational")). Aru, Garban and Sepúlveda proved that, after fixing one spin direction, rescaled transverse fluctuations converge locally as the inverse coupling tends to infinity to a rooted vector-valued lattice Gaussian free field #cite(label("AGS")) Theorem 1.3. For $O \( 3 \)$ this field has two components. Their result identifies the local Gaussian approximation; the construction below also requires control at spatial scales that grow with the inverse coupling.

===== 1.2 Canonical normalization and the main result <canonical-normalization-and-the-main-result>

For each $beta$ used below, write $mu_beta$ for the local limit of periodic square tori as their side lengths tend to infinity. Existence and uniqueness of this periodic limit are part of the preliminary estimates. Given a lattice spacing $a > 0$, a positive field normalization $B$, and $f in C_c^oo \( bb(R)^2 \)$, define the three-component random variable

$ phi.alt_(a \, B) \( f \) = B a^2 sum_(x in bb(Z)^2) f \( a x \) q_x . $

For component indices $i_1 \, dots.h \, i_n in { 1 \, 2 \, 3 }$, the corresponding Schwinger distribution is the expectation of the product of these smeared fields. Its extension to general tests on $\( bb(R)^2 \)^n$ is equivalently the discrete moment measure with weight $\( B a^2 \)^n$.

The lattice itself supplies two normalization constants. Put

#[#set math.equation(numbering: n => "(2)")
 $ C_beta \( x \) = bb(E)_(mu_beta) \[ q_0^1 q_x^1 \] \, #h(2em) chi_beta = sum_(x in bb(Z)^2) C_beta \( x \) \, #h(2em) xi_beta^2 = frac(1, 4 chi_beta) sum_(x in bb(Z)^2) \| x \|^2 C_beta \( x \) . $ <eq:canonical-lattice-scales>]

Here $chi_beta$ is the susceptibility of one spin component, and $xi_beta$ is the positive second-moment correlation length. For a vector test $f in C_c^oo \( bb(R)^2 \; bb(R)^3 \)$ define

#[#set math.equation(numbering: n => "(3)")
 $ Psi_beta \( f \) = frac(1, xi_beta sqrt(chi_beta)) sum_(x in bb(Z)^2) f \( x \/ xi_beta \) dot.op q_x . $ <eq:canonical-field>]

The factor $4$ in (2) is twice the Euclidean dimension. For a translation-invariant continuum two-point measure written in relative coordinates as $thin upright(d) y thin nu \( thin upright(d) z \)$, with $z = y_2 - y_1$, its susceptibility and squared second-moment length are $nu \( bb(R)^2 \)$ and $integral \| z \|^2 nu \( thin upright(d) z \) \/ \( 4 nu \( bb(R)^2 \) \)$, respectively, whenever these quantities are finite and positive.

#thm([Theorem 1.])[
  (Canonical continuum limit).  #emph[For the nearest-neighbor probability (1), the periodic thermodynamic limit $mu_beta$ exists for all sufficiently large $beta$. Both sums in (2) are finite, $chi_beta \, xi_beta > 0$, and $xi_beta arrow.r oo$ as $beta arrow.r oo$. The following limits hold through all real values of $beta$ tending to infinity.]
  + #emph[For every finite list of vector tests in $C_c^oo \( bb(R)^2 \; bb(R)^3 \)$, the fields (3) converge jointly in law and in all joint moments to one common limiting hierarchy.]
  + #emph[For every order and every choice of spin components, the associated Schwinger distributions converge in the strong topology of $cal(S)' \( \( bb(R)^2 \)^n \)$, that is, uniformly on bounded sets of Schwartz tests.]
  + #emph[The limiting hierarchy has susceptibility and second-moment length equal to one. It is the hierarchy constructed in Theorem 2, after the unique positive constant length and field rescalings imposing these two normalizations.]
] <thm:canonical>

The assertion concerns the one lattice action and periodic thermodynamic state specified above. The normalization removes the freedom to choose constant physical length and field units. It does not introduce a comparison with other lattice actions, external fields, or topological terms.

===== 1.3 Construction and physical properties <construction-and-physical-properties>

The proof first constructs the fields at a prescribed physical block scale. This gives the following more detailed existence statement, including the physical properties that will pass to the canonical limit.

#thm([Theorem 2.])[
  #emph[There are a dyadic integer $L > 1$, a constant $H > 0$, bare couplings $beta_N arrow.r oo$, and field normalizations $B_N > 0$, such that 
#[#set math.equation(numbering: n => "(4)")
 $ a_N = L^(- N) \, #h(2em) beta_N = H + frac(log L, 2 pi) N + O \( log \( N + 1 \) \) \, $ <eq:main-prescription>]

 and the following assertions hold for the model (1).]
  + #emph[Every finite list of the variables $phi.alt_N \( f \) = phi.alt_(a_N \, B_N) \( f \)$, under $mu_(beta_N)$, converges jointly in law and in all moments. The component Schwinger distributions converge in $cal(S)' \( \( bb(R)^2 \)^n \)$ at every order. The same limits are obtained with suitable periodic physical tori tending to the plane as $N arrow.r oo$.]
  + #emph[The limiting Schwinger distributions are Euclidean invariant, internally $O \( 3 \)$ invariant, reflection positive, symmetric and clustering. For every component distribution and $F in cal(S) \( \( bb(R)^2 \)^n \)$, 
$ \| S_n \( F \) \| lt.eq C^n n ! sup_(x in \( bb(R)^2 \)^n) \( 1 + \| x \|^2 \)^(2 n) \| F \( x \) \| \, $

 with a constant $C$ independent of $n$. They reconstruct a local, unitary, relativistic theory in $1 + 1$ dimensions.]
  + #emph[The reconstructed theory has a unique vacuum $Omega$, a nonzero vacuum complement, and a Hamiltonian $H_(upright("phys"))$ satisfying 
$ H_(upright("phys")) \|_(Omega^perp) gt.eq m upright(bold(1)) quad upright("for some ") m > 0 . $

]
  + #emph[A connected four-point distribution is nonzero on smooth tests with strictly separated time supports. In particular, the limiting field correlations do not satisfy Wick factorization.]
  #emph[The trajectory is selected by fixing its terminal kinetic coupling to $H$ at a fixed physical block length.]
] <thm:main>

Theorem 2 constructs a continuum limit along a prescribed trajectory. Theorem 1 identifies its canonical normalization with the limit along every diverging bare coupling. Interaction is expressed by the fourth assertion of Theorem 2: a connected four-point correlation of the constructed field is nonzero. The mass-gap estimate and this criterion use the same fields and the same choice of physical units.

#thm([Corollary 3.])[
  #emph[The canonical limiting hierarchy is Euclidean invariant, internally $O \( 3 \)$ invariant, reflection positive, symmetric, and clustering. It satisfies factorial tempered-distribution bounds and reconstructs a local, unitary relativistic theory in $1 + 1$ dimensions. The reconstructed Hamiltonian has a unique vacuum, a nonzero vacuum complement, and a strictly positive lower bound on that entire complement. A connected four-point distribution is nonzero on smooth tests with strictly separated time supports.]
] <cor:canonical-physics>

===== 1.4 Proof strategy and new estimates <proof-strategy-and-new-estimates>

The starting analytic tools are the local angular-integration and exact blocking constructions in #cite(label("OpenAI-O4")), denoted by R when discussing their adaptation. We use their stated intermediate estimates with the hypotheses specified below. We do not transfer the $O \( 4 \)$ mass theorem to $O \( 3 \)$. The difference in target dimension changes the current identities, the Gaussian normalization and the coefficient of the coupling drift. Sections 1 and 4 establish these changes directly. Section 2 fixes the imported definitions and identifies the dimension-independent inputs.

An exact blocking partitions the lattice into squares, introduces one retained spin in $S^2$ per square through a normalized averaging kernel, and integrates the fine spins. This preserves the partition function and, when sources are retained, the generating function of the original spins. One carries those sources and all the corrections they generate through successive integrations. At a step with side factor $l$, rescale the source at each fine site in a block to $l^(- 2)$ times its retained source $z$. On a constant retained-spin configuration $V$, the resulting linear term is $c_(j \, N) z dot.op V$. Normalize its coefficient to one. Section 8 constructs these positive coefficients and proves that the accumulated field normalization is $B_N = product_(j = 1)^N c_(j \, N)^(- 1)$.

The proof must connect a rough large-distance estimate with a precise comparison at a fixed physical scale. Four additional estimates make that connection possible.

First, write $X \( beta \) = C exp \( \( 4 pi - eta \) beta \)$ for a preliminary upper bound on the mixing length, where $eta > 0$ is fixed. The strict saving below $4 pi$ comes from the transverse fluctuations in the first coarse tile. The pinned-cell inputs are uniform over boundary pins. The resulting mixing estimate is uniform under cuts and weaker bonds.

Second, spatial inversion and tangent reflection give contraction of the terms remaining after extraction of the kinetic coupling and its specified low-order corrections. The contraction can be made arbitrarily close to $L^(- 2)$ per step. The affine quadratic contribution has already been removed by the kinetic normalization; inversion cancels the next spatial cross term. This additional cancellation allows the coarse comparison box to grow while the total error in its density still tends to zero.

Third, an integrated comparison controls changes in the gas of large-gradient regions. We fill selected regions with small-gradient spins, retain the complete positive density at the filled configuration, and pay the filling entropy with the original gradient energy. The comparison loses only a volume factor. The strict saving in the preliminary length permits a reference box larger than that mixing length, while the nearly $L^(- 2)$ contraction keeps the error over its coarse volume small. Together these estimates transfer a finite-box criterion for exponential decay from one reference cutoff to every finer cutoff at one fixed physical box. The transfer-operator criterion then gives a common physical decay rate. More concretely, at a reference depth $K$, the preliminary mixing length in physical units is

$ a_K X \( beta_K \) = L^(\( 1 - eta \/ \( 2 pi \) \) K + o \( K \)) . $

Matching the effective densities to finer cutoffs is controlled by the error parameter $C_H M^2 L^(- \( 2 - upsilon \) K)$ in a physical square of side $M$, where $upsilon > 0$ can be chosen arbitrarily small. Thus $M$ can be much larger than the mixing length while this error tends to zero. Fixing one sufficiently large $K$ fixes a successful physical square once and for all; its decay criterion passes to every finer cutoff.

Fourth, independent local sources are carried through the exact transformation. Their linear response defines $B_N$; the remaining source terms contract. This gives convergence of the actual smeared lattice spins, local exponential moments, and a fourth cumulant that survives the limit. Two reflected inclined first blockings compare regulator orientations through a common coarse frame. The resulting rotation has angle equal to an irrational multiple of $pi$. Together with continuity, it gives full Euclidean rotation invariance.

The resulting architecture separates the long-distance estimate from the source construction. Sections 3–5 construct and match the exact trajectories. Sections 6–7 obtain the estimate uniform in the cutoff. Sections 8–9 construct the Schwinger distributions and prove their symmetries. Section 10 reconstructs the quantum theory and proves both the full spectral gap and non-Wick factorization.

The final step is to make the physical normalization intrinsic to the lattice. An arbitrary large bare coupling can be written as a reference coupling at an integer depth plus a bounded real offset. The effective hierarchy initially may depend on that offset. A summable sensitivity estimate for the noncanonical kinetic increment, proved in Lemma 44, shows that trajectories with the same corrected offset agree at each fixed coarse scale. This is stronger than a bound on the size of the increment: it controls its change under perturbations of the trajectory. The resulting argument in Section 1 is useful whenever a marginal coupling must be matched over arbitrarily many renormalization steps.

Section 2 extends the fixed-scale volume comparison to these bounded offsets. Section 3 then constructs their continuum hierarchies and proves uniform two-point tails. The tails permit passage of the full susceptibility and second moment to the limit, so the normalization in (3) can be applied after taking the continuum limit. Finally, Section 4 compares two descriptions of the same microscopic field: adjacent ordinary depths, and an ordinary versus an inclined first blocking. Besides rotating the lattice, the inclined step contributes a length factor $5$, multiplicatively independent of the dyadic factor $L$. The two reflected inclinations remove the rotation; continuity and the two resulting incommensurable offset periods remove the remaining offset dependence. Thus the same exact blocking geometry serves both Euclidean symmetry and canonical uniqueness.

The conditional comparisons in the preliminary mixing argument use Ginibre’s formulation of ferromagnetic correlation inequalities and the positive-association theorem of Fortuin, Kasteleyn and Ginibre #cite(label("Ginibre1970")) #cite(label("FortuinKasteleynGinibre1971")). The passage from local disagreement estimates to loss of boundary influence is related to disagreement percolation #cite(label("VanDenBergMaes1994")). In exact blocking, the connected polymer sums use the classical tree-graph approach to cluster expansions; a useful formulation of the Penrose identity is given by Fernández and Procacci #cite(label("FernandezProcacci")).

The finite-volume comparison uses reflection positivity and the chessboard method systematized by Fröhlich, Israel, Lieb and Simon #cite(label("FILS78")) #cite(label("FILS80")). For the final passage from Euclidean distributions to a local relativistic field, we use the reconstruction framework of Osterwalder and Schrader #cite(label("OS73")) in the corrected form with the linear growth condition of #cite(label("OS75")) Section IV.1. Reflection positivity, Euclidean covariance, clustering and the hierarchy of distributional bounds are consequently separate parts of the continuum argument.

== 1 Construction at a fixed physical scale <construction-at-a-fixed-physical-scale>

==== 1.1 A preliminary correlation length <sec:preliminary>

The first input is a mixing estimate that is uniform when bonds are weakened or deleted. Its exponential scale need not be sharp. The strict inequality in the exponent below is, however, essential to the later comparison of effective densities. We adapt the pinned-cell argument of #cite(label("OpenAI-O4")), retaining its current estimates and modifying the rotation algebra for spins on $S^2$.

For a bounded local Lipschitz observable $F$ with finite support $A$, set

$ cal(L) \( F \) = ∥F∥_oo + max_(x in A) "Lip"_x \( F \) \, $

where the individual Lipschitz constant uses round distance on $S^2$. Distances between supports are measured in the maximum norm, with the periodic distance on a torus. A finite free subgraph carries no boundary pins; bonds outside the subgraph are absent. Write $Z_b \( n \, w \)$ for the homogeneous partition function on the rectangular $n$-by-$w$ torus, with normalized area measure at every site.

#thm([Proposition 1.1.])[
  (Preliminary mixing and rectangular doubling).  #emph[There are constants $b_0 \, C \, c \, p > 0$ and $eta > 0$ such that, with 
#[#set math.equation(numbering: n => "(1.1)")
 $ X \( b \) = C exp #scale(x: 120%, y: 120%)[\(] \( 4 pi - eta \) b #scale(x: 120%, y: 120%)[\)] \, #h(2em) b gt.eq b_0 \, $ <eq:orig-1>]

 the following statements hold uniformly for all bond strengths $0 lt.eq beta_e lt.eq b$, including zero.]
  + #emph[On every unpinned rectangular torus whose sides are at least $C X \( b \)$, and on every finite free subgraph of the square lattice, local Lipschitz observables $F \, G$ supported on $A \, A'$ at distance $d$ satisfy 
#[#set math.equation(numbering: n => "(1.2)")
 $ \| "Cov" \( F \, G \) \| lt.eq C \( 1 + b + \| A \| + \| A' \| + d \)^p cal(L) \( F \) cal(L) \( G \) e^(- c d \/ X \( b \)) . $ <eq:prelim-mixing>]

 In the homogeneous model the periodic infinite-plane limit exists and is unique.]
  + #emph[For each fixed aspect bound $kappa gt.eq 1$, the constants may be chosen so that, for even $n \, w$ with $kappa^(- 1) lt.eq n \/ w lt.eq kappa$ and $min \( n \, w \) gt.eq C X \( b \)$, 
#[#set math.equation(numbering: n => "(1.3)")
 $ 0 lt.eq 4 log Z_b \( n \, w \) - log Z_b \( 2 n \, 2 w \) lt.eq C \( 1 + b + n + w \)^p e^(- c min \( n \, w \) \/ X \( b \)) . $ <eq:prelim-doubling>]

]
] <prop:preliminary>

The proof has three stages. We first obtain a uniform upper bound on the response of a pinned square to slowly varying rotations. A one-site estimate supplies a strict saving in the initial bound. Finally, local rotation estimates give decay for centered one-site functions, and two conditional ferromagnetic decompositions extend that decay to arbitrary local observables.

===== 1.1.1 Pinned squares, currents, and rotation identities <pinned-squares-currents-and-rotation-identities>

Let $Q \( S \) = { 0 \, dots.h \, S }^2$, with arbitrary spins fixed on its boundary. Orient every bond in a positive coordinate direction. Its coefficient is $w_e = beta_e$, except that a bond tangent to the boundary has coefficient $beta_e \/ 2$. This allocation makes the actions of adjacent cells add to the action of their union. For $e = x arrow.r y$, define

#[#set math.equation(numbering: n => "(1.4)")
 $ s_e = q_x times q_y \, #h(2em) E_e = \( q_x dot.op q_y \) upright(bold(1)) - 1 / 2 \( q_x q_y^T + q_y q_x^T \) . $ <eq:prelim-contact>]

If $F = \( F_1 \, F_2 \)$ is a smooth $bb(C)^3$-valued test field on the unit square, $z_e$ denotes the rescaled bond midpoint, and $mu \( e \)$ is the bond direction, put

#[#set math.equation(numbering: n => "(1.5)")
 $ X_Q \( F \) & = S^(- 1) sum_e w_e s_e dot.op F_(mu \( e \)) \( z_e \) \,\
cal(H)_Q \( F \, G \) & = S^(- 2) bb(E) sum_e w_e overline(F_(mu \( e \)) \( z_e \)) dot.op E_e G_(mu \( e \)) \( z_e \) - "Cov" \( X_Q \( F \) \, X_Q \( G \) \) . $ <eq:prelim-current>]

The covariance is sesquilinear, with conjugation in the first entry. The restriction of $cal(H)_Q$ to constant $3$-by-$2$ matrices is represented by a real symmetric $6$-by-$6$ matrix $H_Q$. We call this matrix the stiffness of the pinned square. No lower bound on $H_Q$ is assumed. For a unit vector $a$,

$ a^T E_e a = q_x dot.op q_y - \( a dot.op q_x \) \( a dot.op q_y \) = q_x^(perp a) dot.op q_y^(perp a) \, $

so $\| a^T E_e a \| lt.eq 1$. The half weights give $sum_(e parallel mu) w_e lt.eq b S^2$, and consequently

#[#set math.equation(numbering: n => "(1.6)")
 $ H_Q lt.eq b upright(bold(1)) . $ <eq:prelim-initial-stiffness>]

Let $R_a \( t \)$ be ordinary rotation through angle $t$ about the unit axis $a$. Under $q_x mapsto R_a \( t f_x \) q_x$, the action $cal(A) = - sum_e w_e q_x dot.op q_y$ satisfies

#[#set math.equation(numbering: n => "(1.7)")
 $ D_f cal(A) = sum_e w_e \( a dot.op s_e \) \( f_y - f_x \) \, #h(2em) D_f^2 cal(A) = sum_e w_e \( a^T E_e a \) \( f_y - f_x \)^2 . $ <eq:prelim-score>]

For a general infinitesimal profile $u_x in bb(R)^3$, direct differentiation gives

#[#set math.equation(numbering: n => "(1.8)")
 $ D_u s_e = E_e \( u_y - u_x \) + 1 / 2 \( u_y + u_x \) times s_e . $ <eq:prelim-bond-derivative>]

Thus, if $u$ vanishes on the pinned boundary and $\( d_S u \)_e = S \( u_y - u_x \)$, integration by parts yields

#[#set math.equation(numbering: n => "(1.9)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] overline(X_Q \( d_S u \)) X_Q \( F \) #scale(x: 120%, y: 120%)[\]] = S^(- 2) bb(E) sum_e w_e overline(\( d_S u \)_e) dot.op E_e F_e + 1 / 2 bb(E) X_Q #scale(x: 120%, y: 120%)[\(] F_e times \( overline(u_y) + overline(u_x) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:prelim-ward>]

Here and below the cross product is extended complex bilinearly. These are the replacements for , , and . The current method belongs to the Ward-identity approach to spin correlations #cite(label("AizenmanSimonWard")). The factor $1 \/ 2$ in Equation (1.9) determines the variance gain below.

We use an auxiliary parameter $B gt.eq b$ and impose

#[#set math.equation(numbering: n => "(1.10)")
 $ log \( 2 + S \) lt.eq 16 B . $ <eq:prelim-size-restriction>]

For every fixed moment order $r < oo$, the current estimate is

#[#set math.equation(numbering: n => "(1.11)")
 $ ∥X_Q \( F \)∥_(L^r) lt.eq C_r \( 1 + b \) log \( 2 + S \) ∥F∥_(C^1) . $ <eq:prelim-current-moment>]

We verify the change in the proof of , because its uniformity in the pins will be used repeatedly. For a one-axis profile $f$ that vanishes on the boundary, Equation (1.7) and invariance of the product area measure give

#[#set math.equation(numbering: n => "(1.12)")
 $ bb(E) e^(t D_f cal(A)) lt.eq exp (1 / 2 b t^2 sum_e \( f_y - f_x \)^2) . $ <eq:prelim-score-mgf>]

The same Taylor estimate bounds fixed moments of the likelihood ratio of a profile rotation by $exp \( C_r b sum_e \( f_y - f_x \)^2 \)$.

To extract a transverse current, take a patch of side $d$ with a proportional buffer, a scalar test $h$ of patch-coordinate $C^1$ norm $H_(upright("test"))$, and a compact score whose potential is affine with slope $d^(- 1)$ in the required spatial direction on the support of $h$. Choose its color and the rotation axis perpendicular to the desired current color. In the two opposite rotations use

$ f = arcsin \( h \/ N \) \, #h(2em) N = C sqrt(1 + b) thin H_(upright("test")) \, $

in place of the half angle in . Rotation of a bond current differs from rigid rotation through its midpoint angle by $O \( sup \| d f \| \)$. After multiplication by $N$, the resulting test error is $O \( H_(upright("test")) \/ d \)$ per bond. There are $O \( d^2 \)$ bonds and the score normalization is $d^(- 1)$, so its deterministic cost is $C b H_(upright("test"))$. Equation (1.12) bounds the moments of the two rotated scores, including their likelihood ratios, by $C_r \( 1 + b \) H_(upright("test"))$. Hence

$ ∥d^(- 1) sum_(e parallel mu) w_e \( s_e \)_k h_e∥_(L^r) lt.eq C_r \( 1 + b \) H_(upright("test")) . $

A Whitney decomposition of the square has $O \( S \/ d \)$ patches at each boundary-distance scale $d$. Multiplying the patch bound by $d \/ S$ and summing the $O \( log \( 2 + S \) \)$ scales proves Equation (1.11); the bounded-width boundary layer is estimated directly. This is the argument of , with constants independent of the pins and of the individual strengths.

===== 1.1.2 A uniform decrease of stiffness <a-uniform-decrease-of-stiffness>

The next lemma turns the local identities into a bound at a larger scale. The enlargement factor is denoted by $ell$; it is unrelated to the fixed renormalization factor $L$ used later.

#thm([Lemma 1.2.])[
  (Stiffness iteration).  #emph[Fix a sufficiently large $D$. Suppose that, on squares of side $R$, $H_R lt.eq h upright(bold(1))$ uniformly over all boundary pins and all strengths in $\[ 0 \, b \]$, where $B^(- D) lt.eq h lt.eq B$ and $B gt.eq b$ is sufficiently large. The pinned-cell iteration produces a common side $R_(*)$ with 
#[#set math.equation(numbering: n => "(1.13)")
 $ H_(R_(*)) lt.eq B^(- D) upright(bold(1)) \, #h(2em) log \( R_(*) \/ R \) lt.eq 4 pi h + C_D sqrt(B log B) \, $ <eq:prelim-iteration-conclusion>]

 provided Equation (1.10) holds throughout the iteration, including each proposed next square. All stiffness bounds remain uniform in the original pin and strength class.]
] <lem:prelim-iteration>

#proof[
  We give the changes to through , including the estimates that determine the coefficient $4 pi$.
  #emph[The conditional potential and its derivatives.] Tile a square of side $S = ell R$ into $ell^2$ cells and condition on their complete boundary rings $omega$. Their interiors are independent. If $Z_c \( omega \)$ is the pinned partition function in cell $c$, the ring action and conditional current are
  $ S_g \( omega \) = - sum_c log Z_c \( omega \) \, #h(2em) j \( F \) = bb(E) \[ X_Q \( F \) divides omega \] = ell^(- 1) sum_c bb(E)_c X_c \( F \) . $
  For the lower-left rescaled anchor $z_c$, put
  $ N_c \( F \) = sup_(c^(+)) \( \| F \| + ell^(- 1) \| nabla F \| \) \, #h(2em) D_c \( F \) = ell^(- 1) N_c \( nabla F \) \, $
  where $c^(+)$ is a fixed enlargement of $c$. Let $P \( B \)$ denote a polynomial whose coefficients and degree may depend on fixed moment orders or requested accuracy, but not on $R \, S \, ell$. Equation (1.11) gives
  #[#set math.equation(numbering: n => "(1.14)")
   $ \| bb(E)_c X_c \( F \) \| & lt.eq P \( B \) N_c \( F \) \, #h(2em) \| cal(H)_c \( F \, G \) \| lt.eq P \( B \) N_c \( F \) N_c \( G \) \,\
\| cal(H)_c \( F \, G \) - overline(F_c) H_c G_c \| & lt.eq P \( B \) { D_c \( F \) N_c \( G \) + N_c \( F \) D_c \( G \) } . $ <eq:prelim-cell-bounds>]
  These are and , obtained by subtracting anchor values in the bilinear form.
  For a scalar ring profile $u$, let $H_c^u$ be the cell stiffness with its pins rotated by $R_a \( u \)$, and put $O_c \( u \) = R_a \( u \( z_c \) \)$, acting on the color index. Rigid covariance and Equation (1.11) give
  #[#set math.equation(numbering: n => "(1.15)")
   $ parallel O_c \( u \)^T H_c^u O_c \( u \) - H_c parallel lt.eq P \( B \) D_c \( u \) \, $ <eq:prelim-anchor>]
  with the same estimate for the derivative at zero. Indeed, remove the constant rotation at the anchor, rotate the interior variables by the remaining profile, and differentiate the contact and covariance in Equation (1.5). The residual score is controlled by the current estimate; $E_e$ and its first derivative are bounded. Repeating this calculation at the current pins gives the estimate along an arbitrary-amplitude path. Each cell law in this calculation still has the original untwisted interaction. Furthermore,
  #[#set math.equation(numbering: n => "(1.16)")
   $ D_u^2 S_g = ell^(- 2) sum_c cal(H)_c \( a thin d_S u \, a thin d_S u \) . $ <eq:prelim-ring-hessian>]
  These are the required versions of and .
  To exploit the variance in the stiffness, choose $D' > D$ and
  $ h < v lt.eq 2 B \, #h(2em) c_0 gt.eq B^(- D') \, #h(2em) C_c = v upright(bold(1)) - H_c - c_0 P_a gt.eq B^(- D') upright(bold(1)) \, $
  where $P_a$ projects onto the two spatial components with color $a$. Adjoin independent standard Gaussian vectors $n_c in bb(R)^6$ and Gaussian vectors $n_(0 \, c) in bb(R)^2$ of covariance $c_0 upright(bold(1))$, all independent of the ring data, and define
  #[#set math.equation(numbering: n => "(1.17)")
   $ J \( F \) = j \( F \) + ell^(- 1) sum_c \( sqrt(C_c) thin n_c + a thin n_(0 \, c) \) dot.op F_c . $ <eq:prelim-augmented-current>]
  Total variance gives, for every constant real matrix $A$,
  #[#set math.equation(numbering: n => "(1.18)")
   $ H_Q \( A \, A \) = v \| A \|^2 - "Var" J \( A \) . $ <eq:prelim-variance-identity>]
  This is ; it uses no positivity of $H_c$.
  Here are the commuting derivatives used to bound the variance. Let $psi$ be a nonzero real trigonometric cutoff vanishing on the boundary, and let $f_i = psi phi_i$, where $phi_i$ are real orthonormal Fourier modes of frequencies at most $4 K$, including the constant mode. For each nonzero pair ${ k \, - k }$, choose one representative $k$ and use both modes $sqrt(2) cos \( k dot.op z \)$ and $sqrt(2) sin \( k dot.op z \)$. Their respective quadrature modes are $sqrt(2) sin \( k dot.op z \)$ and $- sqrt(2) cos \( k dot.op z \)$. Frequency sums over both signs therefore agree with sums over these two normalized real modes. The cutoff has band $O \( m \)$ and $K + m lt.double ell$. With $f = \( f_i \)_i$, define
  $ G_0 = ell^(- 2) sum_c nabla f \( z_c \) nabla f \( z_c \)^T \, #h(2em) p = \( c_0 G_0 \)^(- 1) ell^(- 1) sum_c nabla f \( z_c \) n_(0 \, c) \, #h(2em) theta = f dot.op p . $
  Exact quadrature identifies $G_0$ with the continuum gradient Gram matrix. It is positive definite: a combination of the $f_i$ with zero gradient is constant and vanishes on the boundary; division by $psi$ on an open set where it is nonzero then annihilates the Fourier polynomial, hence every coefficient. The base variables are
  $ omega^0 = R_a \( - theta \) omega \, quad n_(0 \, c)^0 = n_(0 \, c) - c_0 nabla theta \( z_c \) \/ ell \, quad n_c^0 = O_c \( theta \)^T n_c - sqrt(C_c^0) thin a nabla theta \( z_c \) \/ ell \, $
  where $C_c^0$ is evaluated at $omega^0$. Conditional on these base variables, the density of $p$ is proportional to $e^(- V \( p \))$, with
  #[#set math.equation(numbering: n => "(1.19)")
   $ V \( p \) = 1 / 2 c_0 p^T G_0 p + S_g \( R_a \( theta \) omega^0 \) + 1 / 2 sum_c \| n_c^0 + sqrt(C_c^0) thin a nabla theta \( z_c \) \/ ell \|^2 . $ <eq:prelim-conditional-potential>]
  The successive changes of variables preserve product area measure on the rings and have constant Gaussian Jacobians. Thus the derivation in is unchanged. Differentiation in deterministic potential directions $u_i in "span" { psi phi_j : \| k_j \| lt.eq 4 K }$ at fixed base variables gives commuting operators $partial_i$. Their adjoints satisfy
  #[#set math.equation(numbering: n => "(1.20)")
   $ bb(E) (sum_i partial_i^(*) Y_i)^2 = bb(E) sum_(i j) \( partial_j Y_i \) \( partial_i Y_j \) + bb(E) sum_(i j) Y_i \( partial_i partial_j V \) Y_j . $ <eq:prelim-ibp-array>]
  The strictly positive Gaussian quadratic form in Equation (1.19) justifies integration by parts, as in .
  We now state the band estimates with their accuracy parameters. Fix any required inverse power $B^(- N)$, and then choose a fixed exponent $J$ sufficiently large. The coefficients and degrees of all polynomial bounds are fixed before this final enlargement of $J$. Assume $K \/ ell lt.eq B^(- J)$, $B m lt.eq K$, and Equation (1.10). For fields of band $O \( K \)$, and give
  $ parallel N \( F \) parallel_square.stroked.tiny lt.eq C parallel F parallel_2 \, quad parallel D \( F \) parallel_square.stroked.tiny lt.eq C \( K \/ ell \) parallel F parallel_2 \, quad parallel d_S u - nabla u parallel_2 lt.eq C \( K \/ S \)^2 parallel nabla u parallel_2 \, $
  where $parallel a parallel_square.stroked.tiny^2 = ell^(- 2) sum_c \| a_c \|^2$. The Gaussian field $nabla theta$ has covariance $c_0^(- 1)$ times the orthogonal projection onto its gradient subspace. Consequently, for any fixed $n$, outside an event of probability at most $e^(- B^3)$,
  $ rho := ell^(- 1) parallel nabla theta parallel_oo + ell^(- 2) parallel nabla^2 theta parallel_oo lt.eq B^(- n) . $
  The evaluation bounds for band-limited fields and the grid argument in are scalar spatial estimates and apply without change. Equations (1.14)–(1.16) then give, simultaneously for all potential directions,
  #[#set math.equation(numbering: n => "(1.21)")
   $ partial_u^2 V lt.eq \( v + B^(- N) \) parallel nabla u parallel_2^2 $ <eq:prelim-band-hessian>]
  on this event. The error before choosing $J \, n$ is bounded by $P \( B \) \[ K \/ ell + \( K \/ S \)^2 + rho \] parallel nabla u parallel_2^2$. Everywhere the same upper estimate holds with $P \( B \)$ replacing $v + B^(- N)$, and
  #[#set math.equation(numbering: n => "(1.22)")
   $ parallel J \( F \) parallel_(L^r) lt.eq C_r P \( B \) ell parallel F parallel_2 . $ <eq:prelim-crude-current>]
  Thus exceptional events remain negligible even after the fixed powers of $ell$ and mode counts used below, since $log ell lt.eq 16 B$.
  For real deterministic $F$ of band $O \( K \)$ perpendicular in color to $a$, put $F' = - a times F$. If at most $C K^2$ real directions in this potential span satisfy
  $ ∥nabla sum_i d_i u_i∥_2 lt.eq C \| d \| \, #h(2em) N_c \( nabla u_i \) lt.eq C \, $
  the modified nonabelian derivative estimate is
  #[#set math.equation(numbering: n => "(1.23)")
   $ bb(E) sum_i \| partial_i J \( F \) - J \( u_i F' \) \|^2 lt.eq B^(- N) parallel F parallel_2^2 . $ <eq:prelim-nonabelian>]
  For completeness, if $r_u \( z \) = u \( z + e_mu \/ \( 2 S \) \) + u \( z - e_mu \/ \( 2 S \) \) - 2 u \( z \)$ on direction $mu$, the derivative of the physical conditional mean is
  $ partial_u j \( F \) = j \( u F' \) + 1 / 2 j \( r_u F' \) + ell^(- 2) sum_c cal(H)_c \( a thin d_S u \, F \) . $
  This replaces the coefficients $2 \, 1$ in by $1 \, 1 \/ 2$. The Taylor remainder is bounded by $P \( B \) ell K S^(- 2) parallel nabla u parallel_2 parallel F parallel_2$. The anchor rotation of the noise differentiates with coefficient one. Its deterministic drift combines with the last displayed contact to leave $\( H_c + C_c \) a = \( v upright(bold(1)) - c_0 P_a \) a$, whose pairing with $F$ is zero. The remaining scalar linear-functional error is bounded by $P \( B \) \[ K \/ ell + \( K \/ S \)^2 + rho \] parallel nabla u parallel_2 parallel F parallel_2$. Taking its operator norm in $\( d_i \)$ gives the sum of squared errors without a mode-count factor. The non-anchor derivative of $sqrt(C_c)$ contributes at most $P \( B \) K^2 ell^(- 2) parallel F parallel_2^2$ after summing over directions, because the original noises are independent of the ring data. These are exactly the estimates –, proving Equation (1.23).
  The other required identity is the uncentered Ward estimate. Define
  $ cal(D) \( F \, G \) = v ell^(- 2) sum_c overline(F_c) dot.op G_c - bb(E) overline(J \( F \)) J \( G \) . $
  For $zeta = r xi \( z \) e^(i k dot.op z) \/ \( i \| k \| \)$ vanishing on the boundary, with $\| r \| lt.eq 1$, $m lt.eq \| k \| lt.eq C K$, cutoff amplitude $xi$ of band $O \( m \)$ and bounded fixed-order polynomial derivative norms, and for a same-frequency exact gradient or bounded constant-matrix test $G$, assume also that each amplitude’s first derivative divided by $\| k \|$ is bounded, as in . Then
  #[#set math.equation(numbering: n => "(1.24)")
   $ \| cal(D) \( d_S zeta \, G \) \| lt.eq P \( B \) \/ \| k \| + B^(- N) . $ <eq:prelim-frequency-ward>]
  Apply Equation (1.9) before replacing the gradient by its leading Fourier symbol: its contact cancels the raw defect. The remaining phases cancel in the bracket, whose test has $C^1$ norm $P \( B \) \/ \| k \|$. Equations (1.11) and (1.14) finish the estimate. The changed bracket coefficient affects only an absolute constant.
  #emph[Auxiliary weighted-current control.] To lower-bound $"Var" J \( A \)$ for a constant matrix $A$, we will pair $J \( A \) - bb(E) J \( A \)$ with the mean-zero divergence $sum_i partial_i^(*) Y_i$ of a suitable test array $Y = \( Y_i \)$. Equation (1.20) splits the squared norm of this divergence into a Hessian contribution and a crossed derivative contribution. Equation (1.21) already controls the Hessian. Before choosing the main test array, we prove a weighted current bound that will control its crossed derivative contribution, with constants independent of the number of frequencies. Set
  $ M = B^J \, quad K = ell \/ B^J \, quad ell gt.eq B^(10 J) \, quad m = ceil.l B^4 ceil.r \, quad psi \( z \) = product_(mu = 1)^2 \[ 1 - cos^(2 m) \( pi z_mu \) \] \, quad chi = psi^2 . $
  For a long step put $K_1 = ell \/ B^(4 J)$ and $K_2 = ell \/ B^(3 J)$; for a short step put $K_1 = 8 M$ and $K_2 = 256 M$. Frequencies belong to $2 pi bb(Z)^2$, and
  $ I_chi = integral chi^2 gt.eq 1 - C B^(- 2) \, #h(2em) T = sum_(M lt.eq \| k \| lt.eq K_1) \| k \|^(- 2) = frac(1, 2 pi) log \( K_1 \/ M \) + O \( M^(- 1) \) . $
  Define
  $ w \( k \) = sum_(H upright(" dyadic")\
M lt.eq H lt.eq K_2) H^(- 2) e^(- sqrt(\| k \| \/ H)) \, #h(2em) T_w = sum_k w \( k \) . $
  The scalar convolution bounds in are
  $ T_w asymp 1 + log \( K_2 \/ M \) \, quad w * w lt.eq C T_w w \, quad \( m + \| k \| \)^2 w \( k \) lt.eq C \, $
  and $w \( k \) gt.eq c \( M + \| k \| \)^(- 2)$ for $\| k \| lt.eq K_2 \/ 2$. Shifts of size $O \( m \)$ change these weights by a bounded factor; their tails beyond $K - O \( m \)$ are smaller than any required inverse power of $B$, including the polynomial factors in $ell$.
  Fix a unit color $r$ perpendicular to $a$, and put $r' = - a times r$; then $r'$ is also unit. Use the annular exact gradients $G_p^r = r thin d_S \( psi tilde(phi)_p \/ \| k_p \| \)$, $2 M lt.eq \| k_p \| lt.eq 4 M$, where $tilde(phi)_p$ is the quadrature Fourier mode defined above, and directions $u_i = sqrt(w \( k_i \)) psi phi_i$ with $\| k_i \| lt.eq K$. Writing $b_p = \| k_p \|^(- 2)$ and $U^r = sum_(p i) b_p bb(E) J \( G_p^r u_i \)^2$, the same-frequency Ward bound gives $sum_p b_p bb(E) J \( G_p^r \)^2 lt.eq C v$. In the integration-by-parts proof of , Equation (1.23) supplies signal $U^r$ rather than $2 U^r$. The Hessian contribution is at most $C v U^r$, and convolution bounds the squared differentiated arrays by $C T_w U^(r')$, up to arbitrary inverse powers of $B$. Thus, for $U = max \( U^r \, U^(r') \)$,
  $ U^2 lt.eq C v \( v + T_w \) U + C v B^(- N_(*)) \, #h(2em) U^r + U^(r') lt.eq C v \( v + T_w \) \, $
  where $N_(*) > 100 \( 1 + D + D' \)$ is fixed first. The derivative errors cost $B^(- N) T_w$, not $B^(- N) K^2$. Taking common positive lower weights, then pairing opposite frequencies and coordinate reflections, proves
  #[#set math.equation(numbering: n => "(1.25)")
   $ sum_(\| n \| lt.eq 4 K_1) \( M + \| n \| \)^(- 2) sum_(mu = 1)^2 bb(E) \| J \( r e_mu psi^2 e^(i n dot.op z) \) \|^2 lt.eq C v \( v + T_w \) \, $ <eq:prelim-weighted-current>]
  as in and .
  #emph[The main divergence test and its variance gain.] For a constant real $3$-by-$2$ matrix $A$ with $\| A \| = 1$, choose a unit $a$ normal to both columns, and put $A' = - a times A$. On the main annulus take
  $ u_i = chi phi_i \/ \| k_i \| \, quad G_i^(A') = d_S #scale(x: 120%, y: 120%)[\(] chi \( A' hat(k)_i \) tilde(phi)_i \/ \| k_i \| #scale(x: 120%, y: 120%)[\)] \, quad Y_i = J \( G_i^(A') \) \/ \| k_i \| . $
  The band separation ensures that these $u_i$ belong to the potential span. Their gradient Gram operator satisfies
  $ ∥nabla sum_i d_i u_i∥_2^2 lt.eq \( 1 + C m \/ M \)^2 sum_i \| d_i \|^2 \, $
  because $parallel chi parallel_oo lt.eq 1$, $parallel nabla chi parallel_oo lt.eq C m$, and all main-annulus frequencies are at least $M$. In each current pairing, first combine the normalized cosine and sine modes into the equivalent Hermitian pairing of the two complex frequencies. Apply Equation (1.24) to the exact discrete gradient before making the leading-symbol replacement in the remaining contact pairing. Exact quadrature and $sum \| k \|^(- 2) hat(k) hat(k)^T = \( T \/ 2 \) upright(bold(1))$ then give the first two lines below. The Gram bound and Equation (1.21), with the negligible exceptional event estimated by Equation (1.22), give the third:
  $ sum_i bb(E) Y_i^2 & = v I_chi T \/ 2 + O \( B^(- N_(*)) \) \,\
sum_i bb(E) \( partial_i J \( A \) \) Y_i & = v I_chi T \/ 2 + O \( B^(- N_(*)) \) \,\
bb(E) Y^T V'' Y & lt.eq v^2 I_chi T \/ 2 + O \( B^(- N_(*)) \) . $
  Only the second line changes from . The crossed-array bound remains
  $ lr(|sum_(i j) bb(E) \( partial_j Y_i \) \( partial_i Y_j \)|) lt.eq C { v T^2 + v \( v + T_w \) } . $
  Indeed, the two differentiated arrays each acquire the new constant one. Their complex pairing is still the sesquilinear pairing at total frequency $n = k + l$. The convolution $sum_(k + l = n) \| k \|^(- 2) \| l \|^(- 2)$ is bounded by $C T \( M + \| n \| \)^(- 2)$. The longitudinal part is bounded by Equation (1.24); for the transverse part,
  $ \| sin angle \( k \, n \) \| thin \| sin angle \( l \, n \) \| lt.eq min { 1 \, min \( \| k \| \, \| l \| \) \/ \| n \| } $
  removes the convolution logarithm. Equation (1.25) then gives the second term. The cutoff replacements are those of : terms divisible by $psi^2$ use the weighted bound; terms not so divisible have an $S^(- 2)$ Taylor factor and use Equation (1.22), with $ell \/ S^2 lt.eq 1 \/ ell$. No regularity of the random ring data is required.
  Pair the mean-zero divergence in Equation (1.20) with $J \( A \) - bb(E) J \( A \)$. Cauchy–Schwarz gives the modified form of :
  #[#set math.equation(numbering: n => "(1.26)")
   $ "Var" J \( A \) gt.eq frac(\( v I_chi T \/ 2 + O \( B^(- N_(*)) \) \)^2, v^2 I_chi T \/ 2 + C { v T^2 + v \( v + T_w \) } + O \( B^(- N_(*)) \)) . $ <eq:prelim-variance-gain>]
  For a long step, $v gt.eq h gt.eq 1$ and $log ell lt.eq h$, this yields
  #[#set math.equation(numbering: n => "(1.27)")
   $ "Var" J \( A \) gt.eq frac(log ell, 4 pi) - C_J (log B + frac(\( log ell \)^2, v)) . $ <eq:prelim-long-gain>]
  For a short step $T \, T_w$ stay between positive absolute constants, so
  #[#set math.equation(numbering: n => "(1.28)")
   $ "Var" J \( A \) gt.eq c_(upright("sh")) min \( v \, 1 \) . $ <eq:prelim-short-gain>]
  The constant $c_(upright("sh")) > 0$ is chosen before the final increase of $J$ and $B$; those increases suppress errors, while all leading constants in the weighted and crossed estimates are absolute.
  #emph[Summing the gains.] For $h gt.eq A_0 log B$, take $v = h + 1$, $c_0 = 1 \/ 2$, and $ell = ceil.l exp sqrt(h log B) ceil.r$, where $A_0$ is fixed large enough for the band conditions and the error in Equation (1.27). Equations (1.18) and (1.27) decrease $h$ by $delta h$ with
  $ delta h gt.eq frac(log ell, 4 pi) - C log B gt.eq c sqrt(h log B) . $
  There are at most $C sqrt(B \/ log B)$ such steps. Summing $log ell lt.eq 4 pi delta h + C log B$ bounds their total logarithmic length by $4 pi h + C_D sqrt(B log B)$. Below $C log B$, choose a fixed $0 < delta < c_(upright("sh")) \/ 4$ and take
  $ v = h + delta min \( h \, 1 \) \, quad c_0 = 1 / 2 delta min \( h \, 1 \) \, quad ell = ceil.l B^(11 J) ceil.r . $
  Equation (1.28) decreases $h$ by at least $c min \( h \, 1 \)$. The $O_D \( log B \)$ remaining steps cost $O_D \( \( log B \)^2 \)$ in logarithmic length and reach $B^(- D)$. This proves Equation (1.13). At every stage the only conditioned cell laws are the original nearest-neighbor laws with new boundary pins, so the uniformity class is preserved. ◻
]

===== 1.1.3 A strict saving on the first square <a-strict-saving-on-the-first-square>

Starting Lemma 5 with Equation (1.6) would give logarithmic length $4 pi b + o \( b \)$. The next argument saves a fixed multiple of $b$ before the iteration begins.

#thm([Lemma 1.3.])[
  (Initial reduction).  #emph[There is a fixed sufficiently small $u > 0$ such that, for all sufficiently large $b$, the square of side $S = floor.l e^(2 pi b u) floor.r$ satisfies 
$ H_S lt.eq b \( 1 - 3 u \/ 4 \) upright(bold(1)) $

 uniformly in all its boundary pins and all strengths $0 lt.eq beta_e lt.eq b$.]
] <lem:prelim-initial-reduction>

#proof[
  At a site at distance at least $S \/ b$ from the boundary, write its one-site density relative to normalized area as $e^(- F)$. For each fixed $u > 0$,
  #[#set math.equation(numbering: n => "(1.29)")
   $ nabla^2 F lt.eq \( 1 + o_b \( 1 \) \) u^(- 1) g_(S^2) \, $ <eq:orig-2>]
  uniformly in the pins, the strengths, and the point of $S^2$. To prove this, follow any unit-speed great circle through the specified spin and rotate the other spins about its axis with a radial cutoff. The cutoff equals one within radius $2$, vanishes at radius $S \/ \( 2 b \)$, and is linear in the logarithm of the radius between them. The second derivative of the negative logarithm of the marginal integral is the expected action second derivative minus a variance. By Equation (1.7), its upper bound is $b$ times the cutoff Dirichlet energy. Taylor expansion on each bond gives $log \| x + e_mu \| - log \| x \| = e_mu dot.op nabla log \| x \| + O \( \| x \|^(- 2) \)$. The summed square error and the integral-comparison error are $O \( 1 \)$ before division by the square of the logarithmic radius. Hence the cutoff energy is
  $ frac(2 pi + o_b \( 1 \), log S) = frac(1 + o_b \( 1 \), b u) \, $
  which proves Equation (1.29). No positive lower bound on any coupling entered this calculation.
  Fix a unit vector $v$ and put $z = v dot.op q$, $Y = nabla z$, and $M = bb(E) z^2$. On $S^2$, $\| Y \|^2 = 1 - z^2$, $"div" Y = - 2 z$, and $nabla_Y Y = - z Y$. Integration by parts against $e^(- F)$ gives
  #[#set math.equation(numbering: n => "(1.30)")
   $ bb(E) \( Y F \)^2 = bb(E) { nabla^2 F \( Y \, Y \) - 3 z Y F } \, #h(2em) bb(E) z Y F = 1 - 3 M . $ <eq:prelim-fisher-identities>]
  Writing $a = \( 1 + o_b \( 1 \) \) \/ u$, the first identity gives $bb(E) \( Y F \)^2 lt.eq a + 6$. Cauchy–Schwarz therefore yields $\( 1 - 3 M \)^2 lt.eq M \( a + 6 \)$. If $M lt.eq 2 u$, then
  $ M gt.eq frac(\( 1 - 6 u \)^2, a + 6) = u \( 1 - O \( u \) - o_b \( 1 \) \) \; $
  if $M > 2 u$, the same lower bound is immediate. First choosing $u$ small and then $b$ large makes $M gt.eq \( 7 \/ 8 \) u$ at every interior site.
  For an edge with both endpoints in this interior and any unit $v$, Cauchy–Schwarz gives
  $ bb(E) \[ v^T E_e v \] = bb(E) \( q_x^(perp v) dot.op q_y^(perp v) \) lt.eq sqrt(\( 1 - bb(E) \( v dot.op q_x \)^2 \) \( 1 - bb(E) \( v dot.op q_y \)^2 \)) lt.eq 1 - 7 u \/ 8 . $
  The excluded boundary strips contain an $O \( 1 \/ b \)$ fraction of the bonds. Since $0 lt.eq w_e lt.eq b$, their contact contribution is bounded directly. Summing the contacts separately in the two spatial directions and discarding the nonpositive covariance in Equation (1.5) gives $H_S lt.eq b \( 1 - 3 u \/ 4 \) upright(bold(1))$ for sufficiently large $b$. ◻
]

Take $B = b$ and apply Lemma 5 after this first square. The total logarithmic side is at most

#[#set math.equation(numbering: n => "(1.31)")
 $ 2 pi b u + 4 pi b \( 1 - 3 u \/ 4 \) + C_D sqrt(b log b) = \( 4 pi - pi u \) b + o \( b \) . $ <eq:prelim-total-length>]

The size premise is valid before each application: accumulated logarithmic length is at most $\( 4 pi - pi u \) b + o \( b \)$, and a proposed next step adds at most $b$. Since $4 pi + 1 < 16$, the premise holds for all large $b$. Any fixed polynomial enlargement can be absorbed by taking, for example, $eta = pi u \/ 2$ and increasing the threshold for $b$. Thus there is a common side $R_(*)$ with $H_(R_(*)) lt.eq b^(- D) upright(bold(1))$ and every later polynomial enlargement bounded by the length in Equation (1.1).

===== 1.1.4 From small stiffness to local decorrelation <from-small-stiffness-to-local-decorrelation>

We next prove that the small-stiffness square controls rotations under arbitrary conditioning outside a collar. This supplies the centered one-site bound needed for the final ferromagnetic decomposition. Choose coarse cells with sides comparable to $s = R_(*) ceil.l b^(D + C_0) ceil.r$. Rectangles with sides in $\[ s \, 2 s \]$ permit tilings of all sufficiently large rectangular tori. Profiles are supported on a fixed number of cells, vanish at the outer boundary of a fixed collar, and have uniformly bounded cellwise $C^2$ extensions. All pins lie outside this collar.

For the effective ring action $F_(upright("ring"))$, subdivision into $R_(*)$-squares and leftover strips gives

#[#set math.equation(numbering: n => "(1.32)")
 $ D_f^2 F_(upright("ring")) lt.eq C b^(- D) $ <eq:prelim-profile-hessian>]

for each bounded fixed-axis profile. Indeed, putting $M_(*) = ceil.l b^(D + C_0) ceil.r$, each complete small square costs $C M_(*)^(- 2) \[ b^(- D) + P \( b \) \/ M_(*) \]$ by its stiffness bound and Equation (1.14). The strips have total area $O \( s R_(*) \)$ and cost at most $C b \/ M_(*)$ by the contact bound. Choose $C_0$ above the degree of the fixed polynomial in the cell replacement estimate. This is .

Integration by parts gives $bb(E) \( D_f F_(upright("ring")) \)^2 lt.eq C b^(- D)$. The square-root density relative to product area therefore has rotation derivative of squared $L^2$ norm at most $C b^(- D)$. Rotation pullbacks are unitary, so integration along a fixed-axis path and telescoping finitely many factors give

#[#set math.equation(numbering: n => "(1.33)")
 $ bb(E) (e^(- \[ F_(upright("ring")) \( phi.alt omega \) - F_(upright("ring")) \( omega \) \] \/ 2) - 1)^2 lt.eq C b^(- D) . $ <eq:prelim-profile-displacement>]

For a fixed-dimensional compact family of smooth profiles with bounded parameter derivatives and a bounded smooth homotopy to identity, upgrades this to

#[#set math.equation(numbering: n => "(1.34)")
 $ Pr #h(-0.16667em) (sup_lambda \| F_(upright("ring")) \( phi.alt_lambda omega \) - F_(upright("ring")) \( omega \) \| > epsilon.alt) lt.eq zeta \( b \) \, #h(2em) zeta \( b \) arrow.r 0 . $ <eq:prelim-profile-uniform>]

The input is Equation (1.12): compact Lie-algebra scores have Gaussian tails with variance bound $C b$, and rotated scores have fixed moments bounded polynomially in $b$. For parameter dimension $d_0$, Morrey’s estimate and a mesh of spacing $b^(- 6)$ therefore reduce the supremum to $O \( b^(6 d_0) \)$ uses of Equation (1.33). Taking $D > 10 d_0 + 10$ makes the error tend to zero. These estimates are uniform under conditioning outside the collar.

To obtain a finite-range orientation law, adjoin independent Haar variables $g_X in S^3$ at free coarse vertices, with identity values at pinned vertices. The group acts on $S^2$ by the covering homomorphism $rho : S^3 arrow.r S O \( 3 \)$. On a coarse edge $X arrow.r Y$, interpolate by

$ Phi \( g \; t \) = g_X exp { theta.alt \( t \) ell_0 \( g_X^(- 1) g_Y \) } \, $

where $theta.alt$ is fixed smooth and constant near the endpoints, and $ell_0$ is a measurable logarithm of norm at most $pi$. Write the retained ring variables as $omega = rho \( Phi \( g \) \) tilde(omega)$. For fixed $g$ this preserves product area measure, and the conditional law of $g$ has finite-range cell potentials. Common left multiplication satisfies $Phi \( k g \) = k Phi \( g \)$; each unpinned cell potential is therefore invariant under this multiplication.

The profile construction of takes place in $S^3$ itself. Fix a coarse vertex and compare two trial assignments differing only at that vertex, relative to the actual group data. Their relative profiles agree on the perimeter of the incident cells, which we call the star. Enlarge the parameter set by treating each vertex quaternion and each edge logarithm of norm at most $pi$ as independent variables. The endpoint equations and agreement on unaffected edges define a compact subset of valid assignments, containing every chosen measurable logarithm branch. At each valid assignment, the finitely many relative edge arcs together with the identity omit some point of $S^3$. Their distance from this point stays positive on a parameter neighborhood. In the resulting stereographic chart, correct endpoints smoothly off the valid subset, with zero correction on that subset. The interpolation of then gives cell extensions and homotopies to identity, chosen to agree outside the star for the two trial assignments. A finite cover by such parameter neighborhoods supplies uniformly bounded smooth families. The supremum over these families controls every measurable branch, without differentiating the branch selection.

Compose these $S^3$-valued families with the fixed smooth action $\( g \, q \) mapsto rho \( g \) q$ on $S^2$. Compactness bounds its required derivatives, and composition preserves the homotopies and agreement outside the star. Thus Equation (1.34) applies to the whole star test: call a coarse vertex bad when varying its group value, for some neighboring values, changes its incident-cell action by more than $epsilon.alt$. A finite coloring of overlapping collars gives, for each finite vertex set $E$,

$ Pr \( E upright(" consists of bad vertices") \) lt.eq zeta \( b \)^(\| E \| \/ C) . $

At a good vertex each conditional orientation density minorizes Haar measure by $e^(- epsilon.alt)$. The disagreement exploration in , with failure probability $q_0 = 1 - e^(- epsilon.alt)$, consequently assigns a fixed path of $r$ vertices probability at most $\( q_0 + zeta \( b \)^(1 \/ C) \)^r$. Choose $epsilon.alt$ small and then $b$ large enough to beat the bounded-degree path count. This proves exponential decay from the pinned boundary on scale $s$. The exploration samples original conditional marginals at every reveal, so its adaptive order preserves both marginal laws.

Averaging the comparison over common left rotations, and using the transitivity of Haar measure on $S^2$, now gives

#[#set math.equation(numbering: n => "(1.35)")
 $ \| bb(E) O \( q_x \) O' \( q_y \) \| lt.eq C ∥O∥_oo ∥O'∥_oo e^(- c d \( x \, y \) \/ s) $ <eq:prelim-one-site>]

for every bounded Haar-centered one-site function $O$ and every bounded one-site $O'$. To see the passage explicitly, condition on the boundary of a coarse region around $x$ of radius one third of $d \( x \, y \)$, use the rotation comparison inside it, and then multiply by $O' \( q_y \)$. Small distances use the trivial bound. This is the $S^2$ version of ; it applies also to merely measurable coordinates. Finite free subgraphs are covered by padding with zero couplings.

===== 1.1.5 Neutral observables and completion of the proposition <neutral-observables-and-completion-of-the-proposition>

The preceding estimate does not require a local observable to be smooth, but it concerns a centered one-site function. To control all local observables, write

$ q_i = \( cos alpha_i thin z_i \, sin alpha_i thin w_i \) \, #h(2em) 0 lt.eq alpha_i lt.eq pi \/ 2 \, quad z_i in S^1 \, quad w_i in { - 1 \, 1 } . $

Normalized area measure is the product of uniform circle measure, a fair sign, and $cos alpha thin thin upright(d) alpha$. In particular the Haar mean of $alpha$ is $pi \/ 2 - 1$. Conditional on $alpha$, the $z$ and $w$ variables form independent zero-field ferromagnetic XY and Ising systems with couplings

$ J_e^1 = beta_e cos alpha_x cos alpha_y \, #h(2em) J_e^2 = beta_e sin alpha_x sin alpha_y . $

Their partition functions multiply to give the density of $alpha$ relative to its product one-site measure.

The correlation inequalities used here are the plane-rotator form of Ginibre’s inequality #cite(label("Ginibre1970")) and the ferromagnetic Ising inequalities. The XY and Ising energy means and energy covariances are nonnegative, and their two-point functions are nondecreasing in every coupling; these inequalities, including zero couplings, are proved in . In each sector all first derivatives of couplings with respect to the angles have the same sign, and mixed endpoint derivatives of a single coupling are nonnegative. The mixed logarithmic derivatives of the angle density are therefore nonnegative. Its log lattice condition gives association by the Fortuin–Kasteleyn–Ginibre argument #cite(label("FortuinKasteleynGinibre1971")). We use the associated-variable inequality

#[#set math.equation(numbering: n => "(1.36)")
 $ \| "Cov" \( f \, g \) \| lt.eq sum_(i j) "Lip"_i \( f \) "Lip"_j \( g \) "Cov" \( alpha_i \, alpha_j \) \, $ <eq:prelim-association>]

proved in by comparing $f \, g$ with the increasing linear functions having their individual Lipschitz constants.

Here is why the quantitative localization in remains valid with one sign sector. Splitting the XY angle into an angle in $\[ 0 \, pi \/ 2 \]$ and two signs produces two independent conditional ferromagnetic Ising systems. The additional sector $w$ is a third such system and has no further angle variable. Its sign covariance is controlled directly by the associated-variable inequality, with sign dependence bounded by a constant times the supremum norm. For the two XY signs, the truncation and angle localization in give the fractional two-point bound with exponent $1 \/ 3$. For the third sign correlation $0 lt.eq c_(i j)^2 lt.eq 1$, one has $c_(i j)^2 lt.eq \( c_(i j)^2 \)^(1 \/ 3)$. Thus the same sum of conditional two-point functions to the power $1 \/ 3$, with polynomial support and boundary factors, controls arbitrary conditional covariances. Deleting conditional Ising bonds gives the same boundary sums, by coupling monotonicity.

The normalized circle components, $w = "sign" \( q_3 \)$, and $alpha - \( pi \/ 2 - 1 \)$ are bounded Haar-centered functions of one spin. Equation (1.35) consequently implies, for the full conditional-sector two-point functions $c_(i j)^1 \, c_(i j)^2$,

#[#set math.equation(numbering: n => "(1.37)")
 $ 0 lt.eq bb(E)_alpha c_(i j)^t lt.eq C e^(- c d \( i \, j \) \/ s) quad \( t = 1 \, 2 \) \, #h(2em) \| "Cov" \( alpha_i \, alpha_j \) \| lt.eq C e^(- c d \( i \, j \) \/ s) . $ <eq:prelim-sector-correlation>]

This is the replacement for .

Let $F \, G$ have supports $A \, A'$ at distance $d$, and take neighborhoods of radius $floor.l d \/ 10 floor.r$. For the conditional covariance given $alpha$, apply the preceding arbitrary-observable bound and average. Jensen’s inequality and Equation (1.37) give $bb(E)_alpha \( c_(i j)^t \)^(1 \/ 3) lt.eq \( bb(E)_alpha c_(i j)^t \)^(1 \/ 3)$, so this contribution is a polynomial times $e^(- c' d \/ s)$.

For the covariance of the conditional means, delete the conditional XY and Ising bonds crossing the chosen neighborhoods, keeping the original full angle marginal fixed. Each cut mean depends only on its local angle set. Differentiation with respect to one angle differentiates at most its incident couplings, each with derivative bounded by $b$; edge observables have absolute value at most one. Hence the individual angle Lipschitz constants are at most $C \( 1 + b \) cal(L) \( F \)$ and $C \( 1 + b \) cal(L) \( G \)$. Equations (1.36) and (1.37) bound their covariance. To restore a deleted bond, interpolate its strength. The derivative of the corresponding mean is a conditional covariance with the bond observable. Apply the conditional arbitrary-observable bound at radius $floor.l d \/ 100 floor.r$ and dominate all weakened-system two-points by the full conditional two-points. Averaging and Jensen again give the same exponential scale. These are $L^1$ replacement bounds, which suffice because the conditional means are bounded. The neighborhood volumes and crossing-edge lists have polynomial size, and small $d$ is covered by the trivial estimate. This proves Equation (1.2), with possibly enlarged $C \, p$, because $s lt.eq X \( b \)$ by Equation (1.31).

For completeness, the volume and partition-function conclusions use the same uniformity under bond deletion. Cutting a collar around a fixed support and integrating the coupling derivatives compares any two large periodic volumes by a polynomial times the exponentially small boundary error. The local periodic expectations are therefore Cauchy, independently of the exhaustion, giving the periodic limit and its uniqueness as in . For homogeneous rectangles, apply the common-cutout comparison of once to horizontal bond expectations and once to vertical bond expectations. The difference between the normalized bond sums on the $n$-by-$w$ and $2 n$-by-$2 w$ tori is bounded by a polynomial in $b \, n \, w$ times $e^(- c min \( n \, w \) \/ X \( b \))$. Integration of the coupling from zero to $b$ gives the upper bound in Equation (1.3); the comparison is uniform at every intermediate coupling because all strengths remain in $\[ 0 \, b \]$. Finally, the row and column transfer operators are nonnegative: $e^(b q dot.op q')$ is a positive kernel by its tensor-power expansion. Twice applying $"Tr" T^(2 k) lt.eq \( "Tr" T^k \)^2$, in the two coordinate directions, gives $Z_b \( 2 n \, 2 w \) lt.eq Z_b \( n \, w \)^4$. This proves the lower bound and completes Proposition 4.

From Section 3 onward, $L$ denotes one fixed sufficiently large dyadic renormalization factor. Constants chosen before $L$ are uniform for all sufficiently large $L$; constants denoted $C_L$ may change after $L$ is fixed. The same convention applies after choosing the terminal inverse coupling $H$. Fixed constants in positive-power error estimates are understood in this order of choices.

==== 1.2 The retained densities and their locality norms <sec:setup>

The block transformation will retain a coupling, finitely many polynomial coefficient lists, a regular local remainder, and a separate contribution from configurations with large nearest-neighbour differences. This section defines these objects. In particular, all later comparisons concern complete densities, even though some terms in their representation may have either sign.

We use the scalar block construction and the local representation conventions of #cite(label("OpenAI-O4")). The definitions are given here for spins on $S^2$. Their preservation under integration is the $O \( 3 \)$ assertion proved in Section 4. Neither that assertion nor the continuum construction is an imported $O \( 4 \)$ theorem.

===== 1.2.1 Lattices, reference scales, and the observation <setup:scales>

A lattice at one layer is a square grid with its current orthonormal coordinate frame and unit nearest-neighbour spacing. A finite lattice is its quotient by a rank-two lattice of translations; the corresponding infinite-grid formula will be called the #emph[bulk formula]. At each step the period lattice is a sublattice of the lattice of block translations, so the observation descends to the quotient. The shortest nonzero period, measured in the current lattice units, is denoted by $cal(L)_j$. We use rectangular periods and the bounded-aspect oblique periods specified in Section 3. Local distances may be measured in the maximum or $ell^1$ norm; we specify $ell^1$ for the coefficient norm below and otherwise use the maximum norm.

Choose a dyadic integer $L$, eventually sufficiently large, and a terminal reference coupling $H$. For integers $j gt.eq 0$, set

#[#set math.equation(numbering: n => "(1.38)")
 $ gamma & = frac(log L, 2 pi) \, & H_j & = H + gamma j \, & frak(m)_j & = ⌈\( log H_j \)^2⌉ \,\
p_j & = \( log H_j \)^(P_0) \, & t_j & = H_j^(- 1 \/ 2) p_j \, & T_j & = H_j^(- 49 \/ 100) . $ <setup:scale-definitions>]

These are the scales of , with the drift normalization appropriate to $S^2$. A run of depth $N$ visits the layers $N \, N - 1 \, dots.h \, 0$. In a step from $j$ to $j - 1$, the precise coupling $b$ lies in $\[ H_j \/ 2 \, 2 H_j \]$, and $g = b^(- 1 \/ 2)$. We abbreviate $M = frak(m)_j$, $p = p_j$, and $t = t_j$ within a step. Thus $t asymp g p$. The thresholds $H_j \, p_j \, t_j \, T_j$ remain fixed when two precise couplings are compared.

A #emph[free history] records the scalar observations already performed, including their coordinate frames. Its length is $N - j$ on layer $j$. For regular observations the history can be identified with its length; after an inclined first observation the record, and not only its length, matters. We write $h$ for this history. The allowed inclinations and their common analytic estimates are established in Section 3.

Constants written $C$ when choosing $L$ are uniform for all sufficiently large $L$. Constants $C_L \, c_L > 0$ may depend on the subsequently fixed $L$; after the stated choices they are independent of the layer, free history, period, and varying precise coupling. All requested derivative orders, support exponents, and polynomial powers in the geometric estimates are fixed before $P_0$ and $H$; we choose $P_0$ sufficiently large and then $H$ sufficiently large. Fixed powers of $M$ and $p$ therefore remain powers of $log H_j$. Admitted periods satisfy $cal(L)_j gt.eq C_(upright("adm")) frak(m)_j$, with a fixed constant large enough for the prescribed local neighbourhoods. The minimum terminal period $m_min \( L \, H \)$ is enlarged accordingly. Since $frak(m)_j \/ frak(m)_(j - 1) lt.eq 2$ for large $H$, the same choice works at all layers of a run.

For a regular step, partition the fine grid into $L$-by-$L$ blocks $Y$. Let $w_Y \( x \) gt.eq 0$, $x in Y$, be the sampled and normalized product of a fixed even smooth bump, centred at the block centre and supported in the coordinate square of radius $0.14 L$. It can be chosen positive in the square of radius $0.1 L$. Thus

$ sum_(x in Y) w_Y \( x \) = 1 \, #h(2em) sum_(x in Y) w_Y \( x \) \( x - x_Y \) = 0 . $

Define the scalar averaging map and the spin mean by

$ \( Q phi.alt \)_Y = sum_(x in Y) w_Y \( x \) phi.alt_x \, #h(2em) m_Y \( q \) = sum_(x in Y) w_Y \( x \) q_x . $

Independently for each block, let a tag $tau_Y$ select a site $x in Y$ with probability $w_Y \( x \)$, and put

#[#set math.equation(numbering: n => "(1.39)")
 $ hat(m)_Y \( q \, tau_Y \) = cases(delim: "{", m_Y \( q \) \/ \| m_Y \( q \) \| \, & \| m_Y \( q \) \| gt.eq 1 / 2 \,, q_(tau_Y) \, & \| m_Y \( q \) \| < 1 / 2 .) $ <setup:unit-mean>]

Tags may also be sampled where their values are unused. With $thin upright(d) omega$ denoting normalized area measure on $S^2$, the exact observation is the probability kernel

#[#set math.equation(numbering: n => "(1.40)")
 $ cal(K)_b \( thin upright(d) V divides q \) = bb(E)_tau product_Y frac(exp { - b \| V_Y - hat(m)_Y \( q \, tau_Y \) \|^2 \/ 2 }, z_2 \( b \)) thin thin upright(d) omega \( V_Y \) \, #h(2em) z_2 \( b \) = integral_(S^2) e^(- b \| V - e \|^2 \/ 2) thin thin upright(d) omega \( V \) . $ <setup:observation>]

Here $e$ is any unit vector. Rotation invariance makes the denominator independent of $e$; explicitly $z_2 \( b \) = \( 1 - e^(- 2 b) \) \/ \( 2 b \)$ for $b > 0$. Thus integrating the density against $cal(K)_b$ preserves its partition function exactly. This is with observation precision one. Its piecewise mean is measurable everywhere; the proof will differentiate only specified smooth extensions on graphs with small chords.

===== 1.2.2 The scalar quadratic carried by a history <setup:scalar-data>

The quadratic data in a history concern real scalar fields and are independent of the spin dimension. Choose one orientation for each nearest-neighbour bond, using the positive coordinate directions. Site and edge scalar products use counting measure, and adjoints refer to those scalar products. Start with the nearest-neighbour precision $K_0 = d^(*) d$, where $\( d phi.alt \)_(x y) = phi.alt_y - phi.alt_x$. If $Q$ is the next averaging map, integrating the fine scalar field in

$ exp {- 1 / 2 chevron.l phi.alt \, K_h phi.alt chevron.r - 1 / 2 ∥V - Q phi.alt∥_2^2} $

gives the next precision

#[#set math.equation(numbering: n => "(1.41)")
 $ K_(h + 1) = upright(bold(1)) - Q \( K_h + Q^(*) Q \)^(- 1) Q^(*) . $ <setup:scalar-schur>]

The inverse exists on each finite connected torus. Inductively, $K_h gt.eq 0$ has only constant null vectors, while $Q$ preserves constants; hence $K_h + Q^(*) Q$ is positive definite. The Schur complement in (1.41) has only constant null vectors again, as is seen by minimizing the displayed nonnegative quadratic form at fixed $V$. The formula defines the quadratic after extraction of its scalar Gaussian normalization. Bulk kernels are the common translation-covariant kernels whose periodizations give these finite operators.

For regular histories the scalar construction of and supplies a fixed $0 < c_0 < 1$ and a real edge operator $ell_h$ satisfying

#[#set math.equation(numbering: n => "(1.42)")
 $ K_h = c_0 d^(*) d + d^(*) ell_h^(*) ell_h d \, #h(2em) ell_0 = sqrt(1 - c_0) thin upright(bold(1)) . $ <setup:edge-lift>]

Its kernels have exponential row and column moments, uniformly in the regular history, with the constants and derivative bounds specified in Section 3. These are scalar statements: the operators act componentwise on ambient vectors. Section 3 gives the corresponding choices for the additional histories used here and proves the stronger history comparison required later. A retained density always carries the particular history and edge operator chosen by these common rules; it does not choose a new lift on each finite torus.

===== 1.2.3 The class of effective densities <subsec:setup-density>

At each layer, the exact integration retains a kinetic energy, finitely many polynomial slots with summable coefficient lists, a differentiable error, and a sum of weights covering the edges with large spin differences. We specify these four parts and their norms here. This is the density class of , with the tangent coordinates and spatial symmetry adapted to $S^2$.

Fix a finite layer torus $Lambda_j$ and free history $h$. Write $M = frak(m)_j$ and $t = t_j$. Bulk formulas below are the corresponding lifted formulas on the infinite lattice; the density itself is defined on the finite torus. All distances below are in the current lattice units. For an edge $e = chevron.l x \, y chevron.r$, put

$ d_e q = q_y - q_x \, #h(2em) r_e \( q \) = \| d_e q \| \, #h(2em) D \( q \) = { e : r_e \( q \) > t_j } . $

The orientation chosen for $d_e q$ does not affect $r_e$. Fix $0 < d_0 < c_0 \/ 16$ and choose $R_(*)$ sufficiently large compared with the exponential localization length of the free edge operator $ell_h$, uniformly in the history. Define

#[#set math.equation(numbering: n => "(1.43)")
 $ S_t \( r \) & = cases(delim: "{", c_0 r^2 \/ 2 \, & 0 lt.eq r lt.eq t \,, d_0 t r \, & r > t \,)\
m_e \( q \) & = upright(bold(1)) #h(-0.16667em) {r_f \( q \) lt.eq t exp #scale(x: 120%, y: 120%)[\(] "dist" \( e \, f \) \/ R_(*) #scale(x: 120%, y: 120%)[\)] upright(" for every edge ") f} \,\
cal(E)_(h \, t) \( q \) & = sum_e S_t \( r_e \( q \) \) + 1 / 2 sum_e m_e \( q \) \| \( ell_h d q \)_e \|^2 . $ <eq:setup-clipped-energy>]

These are the exact prescriptions of ; in particular, $S_t$ is not replaced by a continuous interpolation at $r = t$. Since $r_f lt.eq 2$, a mask $m_e$ queries only edges within distance $O \( log \( 1 \/ t \) \)$ of $e$. Its defining bound and the exponential row moments give $\| \( ell_h d q \)_e \| lt.eq C t$ whenever $m_e = 1$. The functions $S_t$ and $m_e$ can be discontinuous. The differentiable norms below apply to the retained local functions on their stated open domains, rather than to these indicators as functions of a moving output configuration.

====== 1.2.3.1 Supports, records, and graph masks <supports-records-and-graph-masks>

A label includes its formula, its anchor when one is assigned, its complete support, and a connected record covering that support. Permissible anchors are chosen in the complete support and its record; every anchored graph contains its anchor. The complete support contains every spin argument and every edge or site queried by a mask, an eligibility test, a test for the absence of another object, or a window used to determine the formula. A record consists of cubes of radius $frak(m)_j$ together with the paths joining them. It has an integer load $s gt.eq 1$, chosen according to the conventions following , so that

#[#set math.equation(numbering: n => "(1.44)")
 $ \| upright("complete support") \| lt.eq C frak(m)_j^2 s \, #h(2em) "length" \( upright("record") \) lt.eq C frak(m)_j s . $ <eq:setup-record-size>]

The support cardinality here counts sites, including the endpoints of queried edges. Intersecting records can be joined with load at most a fixed multiple of the sum of their loads. The record retains all paths used in a connected calculation, including multiple occurrences of a path.

Upon projection to the next lattice and enlargement by the fixed neighborhoods used in the integration, the load is chosen to satisfy

#[#set math.equation(numbering: n => "(1.45)")
 $ frac(4 s, L) lt.eq s' lt.eq D_(*) \( 1 + s \/ L \) . $ <eq:setup-record-projection>]

The upper bound expresses the shortening of the joining paths under blocking. The lower bound is a convention: unused load is retained when necessary. The constant $D_(*)$ accommodates either the regular blocking or the inclined first blocking. This is the convention of .

On a torus, the record retains its lifted displacements before positions are reduced modulo the period lattice. Recall that $cal(L)_j$ is the shortest period length in the current lattice units. A complete record is called #emph[short] if

#[#set math.equation(numbering: n => "(1.46)")
 $ s < c_(*) cal(L)_j \/ frak(m)_j . $ <eq:setup-short-record>]

The fixed constant $c_(*) > 0$ is sufficiently small that a short record has an injective lift and remains within the required bulk comparison after the fixed geometric enlargements. A short formula must agree with the corresponding formula on the infinite lattice. All other records are called #emph[winding]. This classification concerns the complete calculation: a constant, or a function with small displayed support, is still assigned a winding record if its construction used a long record or a period-dependent discrepancy. The lower bound in (1.45) retains the required load when an already winding term is transferred.

For a connected graph $X$, define its mask and its open graph domain by

#[#set math.equation(numbering: n => "(1.47)")
 $ 1_X \( q \) & = upright(bold(1)) { r_e \( q \) lt.eq t_j upright(" for every ") e in X } \,\
cal(U)_(X \, j) & = { q : r_e \( q \) < 4 t_j upright(" for every ") e in X } . $ <eq:setup-graph-domain>]

A graph may consist of a single site with no edges; in that case both edge conditions in (1.47) are vacuous. A graph used for a local function contains that function’s spin arguments and is included in its complete record. A masked local function is defined to be zero off its mask; no value of an undefined extension is used there.

====== 1.2.3.2 Tangent polynomials and their coefficient norms <tangent-polynomials-and-their-coefficient-norms>

For an anchor $o$, define the relative tangent coordinates and a nearest-neighbor quadratic function by

#[#set math.equation(numbering: n => "(1.48)")
 $ y_o \( x \) = q_x - \( q_o dot.op q_x \) q_o in q_o^perp \, #h(2em) S_o \( q \) = 1 / 4 sum_(\| e \|_1 = 1) \| y_o \( o + e \) \|^2 . $ <eq:setup-tangent-coordinates>]

Here $\| dot.op \|_1$ is the lattice $ell^1$ distance in the current square frame. For $q_compose in S^2$, the spherical exponential is $"Exp"_(q_compose) \( u \) = cos \| u \| thin q_compose + \( sin \| u \| \/ \| u \| \) u$ for $u in q_compose^perp$, with its continuous value at $u = 0$. Its restriction to $\| u \| < pi$ is one-to-one onto $S^2 \\ { - q_compose }$; the inverse is denoted by $"Log"_(q_compose)$. The coordinate $y_o \( x \)$ is a globally defined tangent projection, whereas $"Log"_(q_o) q_x$ is the principal geodesic coordinate on this domain. For each required degree $n$, choose a fixed basis of $\( \( bb(R)^2 \)^(⊗ n) \)^(O \( 2 \))$. A basis tensor is evaluated in $q_o^perp$ through any orthonormal identification of this plane with $bb(R)^2$. Its $O \( 2 \)$ invariance makes the result independent of that identification. A degree-$n$ label is a coefficient $a$ multiplying

$ T #scale(x: 120%, y: 120%)[\(] y_o \( o + r_1 \) \, dots.h \, y_o \( o + r_n \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) r_i in bb(Z)^2 \, $

together with its paths, mask, and complete record. A label containing a zero displacement is discarded, since $y_o \( o \) = 0$. The full $O \( 2 \)$ invariance forces every odd-degree tensor to vanish.

The five potentially nonzero slots retain the seven-slot indexing of :

#[#set math.equation(numbering: n => "(1.49)")
 $ \( b P_4 \, med I_2 \, med b P_5 \, med I_3 \, med b P_6 \, med I_4 \, med b^(- 1) J_2 \) \, #h(2em) P_5 = I_3 = 0 \, $ <eq:setup-slots>]

and $upright(bold(P)) = \( P_4 \, I_2 \, 0 \, 0 \, P_6 \, I_4 \, J_2 \)$ denotes the coefficient lists without the displayed powers of $b$. A subscript denotes homogeneous degree in the relative tangent coordinates, rather than order in $g$.

For a position list, set

#[#set math.equation(numbering: n => "(1.50)")
 $ u \( r_1 \, dots.h \, r_n \) = 1 + sum_(i = 1)^n \| r_i \|_1 \, #h(2em) W_sigma \( u \) = e^(sigma u) \( 1 + u \)^2 . $ <eq:setup-path-weight>]

The paths from an anchor to its arguments are counted with multiplicity. Path rules are chosen equivariantly; when a symmetry exchanges tied coordinate-order paths, the finite collection of choices is retained together. The complete record contains those choices. The coefficient path parameter in (1.50) is the fixed convention of . For degree four or six, the norm of a coefficient list $A_n$ is

#[#set math.equation(numbering: n => "(1.51)")
 $ parallel A_n parallel_sigma = sup_o sum_(upright("labels at ") o) \| a \| W_sigma \( u \) . $ <eq:setup-canonical-norm>]

The same fixed $sigma > 0$ is used at every layer; it is chosen sufficiently small for the required free-kernel exponential moments, before choosing $L$.

The quadratic norm also records the subtraction that removes the affine Hessian. Let $cal(C)_4$ be the four quarter-turn rotations of the current square frame and put

#[#set math.equation(numbering: n => "(1.52)")
 $ M_(r \, s) \( q \) = 1 / 4 sum_(rho in cal(C)_4) y_o \( o + rho r \) dot.op y_o \( o + rho s \) \, #h(2em) Q_(r \, s) \( q \) = M_(r \, s) \( q \) - \( r dot.op s \) S_o \( q \) . $ <eq:setup-quadratic-packet>]

The two factors of a quadratic monomial are symmetrized before taking coefficient cancellations. The spatial identity used for this symmetrization is

$ 1 / 8 sum_(rho in cal(C)_4) #scale(x: 120%, y: 120%)[\[] \( rho r \)_i \( rho s \)_j + \( rho s \)_i \( rho r \)_j #scale(x: 120%, y: 120%)[\]] = frac(r dot.op s, 2) delta_(i j) . $

If $y_o \( o + r \) = A r$ for a linear map $A : bb(R)^2 arrow.r q_o^perp$, then

$ M_(r \, s) = frac(r dot.op s, 2) sum_(i = 1)^2 \| A e_i \|^2 \, #h(2em) S_o = 1 / 2 sum_(i = 1)^2 \| A e_i \|^2 \, $

so $Q_(r \, s)$ vanishes on every affine tangent field. This uses the symmetric part of the quarter-turn average; full dihedral symmetry is not required.

A quadratic label is the entire compensated packet $a Q_(r \, s)$, with its compensating nearest-neighbor coefficients tagged to that packet. Its norm contribution is

#[#set math.equation(numbering: n => "(1.53)")
 $ \| a \| {W_sigma \( 1 + \| r \|_1 + \| s \|_1 \) + \| r dot.op s \| W_sigma \( 3 \)} . $ <eq:setup-quadratic-norm>]

The norm of a quadratic list is the supremum over anchors of the sum of these contributions. These norms are norms on the retained tagged coefficient lists, not on the resulting polynomial after all cancellations: different retained lists can represent the same polynomial. Thus a compensating coefficient uses its own nearest-neighbor path weight, while its tag retains the original packet’s cancellation and support information. This convention never shortens a mask or a complete record. Equations (1.51) and (1.53) are the fixed norms of and , with $cal(C)_4$ replacing the dihedral group.

The retained coefficient bounds are

#[#set math.equation(numbering: n => "(1.54)")
 $ parallel P_4 parallel_sigma lt.eq B_1 \, quad parallel I_2 parallel_sigma lt.eq B_2 \, quad parallel P_6 parallel_sigma lt.eq B_5 \, quad parallel I_4 parallel_sigma lt.eq B_6 \, quad parallel J_2 parallel_sigma lt.eq B_7 . $ <eq:setup-canonical-caps>]

The caps are fixed successively in the indicated slot order. Polynomial formulas and their affine compensation are formed in the bulk before folding onto a torus. A label with $u lt.eq frak(m)_j$ may use a common mask ball of radius $C_chi frak(m)_j$ about its anchor. Longer paths are padded by fixed multiples of $frak(m)_j$. The resulting load is at most $C \( 1 + u \/ frak(m)_j \)$, with the full compensated packet retaining the required graph.

====== 1.2.3.3 Differentiable errors <differentiable-errors>

The coefficient norms control the polynomial part of the density. The remaining regular functions are controlled on the graph domains (1.47), including enough derivatives to compare two successive exact integrations.

A regular-error label at $o$ consists of a function $f_X in C^8 \( cal(U)_(X \, j) \)$, a graph $X$, and its complete record of load $s_X$. Write $v times$ for the skew-symmetric linear map $w mapsto v times w$ on $bb(R)^3$. For $1 lt.eq r lt.eq 8$, define the rotation jet

#[#set math.equation(numbering: n => "(1.55)")
 $ D_(v_1 \, dots.h \, v_r) f_X \( q \) = partial_(theta_1) dots.h.c partial_(theta_r) f_X ((exp #h(-0.16667em) [(sum_(a = 1)^r theta_a v_(a \, x)) times] q_x)_x)\|_(theta = 0) . $ <eq:setup-error-jets>]

In each derivative slot independently, take all vector fields satisfying

#[#set math.equation(numbering: n => "(1.56)")
 $ \| v_(a \, x) \| lt.eq t_j \( 1 + "dist" \( x \, o \) \)^8 . $ <eq:setup-error-directions>]

Distances in this bound are physical torus distances on a finite torus. For $0 lt.eq k lt.eq 8$, let

#[#set math.equation(numbering: n => "(1.57)")
 $ \[ f_X \]_(k \, j) = sum_(r = 0)^k sup_(q in cal(U)_(X \, j)) sup_(v_1 \, dots.h \, v_r) \| D_(v_1 \, dots.h \, v_r) f_X \( q \) \| \, $ <eq:setup-error-seminorm>]

where the $r = 0$ term is $sup_(cal(U)_(X \, j)) \| f_X \|$. These are classical derivatives on the open graph domain. Values away from that domain require no differentiability. This makes explicit the rotation version of .

Set $A = 64$. The error-list norm and its cap are

#[#set math.equation(numbering: n => "(1.58)")
 $ parallel f parallel_(k \, j \, A) = sup_o sum_(X upright(" anchored at ") o) e^(A s_X) \[ f_X \]_(k \, j) \, #h(2em) parallel f parallel_(8 \, j \, A) lt.eq delta_j := H_j^(- 2.05) . $ <eq:setup-error-list-norm>]

Each regular function is invariant under simultaneous $O \( 3 \)$ transformations of its spin arguments. Each bulk packet is also averaged under the quarter turns about its anchor, including position inversion $x - o mapsto - \( x - o \)$, after its masks have been strengthened to a common invariant graph. Short folded copies inherit this inversion parity from their lifted bulk packets.

For a smooth local scalar $F$ with these spin and spatial symmetries, its #emph[affine coefficient] at $o$ is

#[#set math.equation(numbering: n => "(1.59)")
 $ frak(h)_o \( F \) = frac(d^2, d theta^2) F (("Exp"_n #scale(x: 120%, y: 120%)[\(] theta v thin hat(e) dot.op \( x - o \) #scale(x: 120%, y: 120%)[\)])_x)\|_(theta = 0) \, $ <eq:setup-affine-coefficient>]

where $n in S^2$, $v in n^perp$ is a unit vector, and $hat(e)$ is a coordinate unit vector in the current lattice frame. Symmetry makes this number independent of these choices. It is an ordinary second derivative, so $frak(h)_o \( S_o \) = 1$. Polarization gives the mixed affine Hessian $frak(h)_o \( F \) "Tr" \( A_1^(*) A_2 \)$ for tangent maps $A_1 \, A_2 : bb(R)^2 arrow.r n^perp$. The affine coefficient of a bulk list means the sum of these numbers per anchor.

A bulk or short error has zero value at every aligned configuration and zero affine Hessian there. More precisely, fix $n in S^2$ and linear maps $A_1 \, A_2 : bb(R)^2 arrow.r n^perp$. With the anchor kept at $n$, its normalizations are

#[#set math.equation(numbering: n => "(1.60)")
 $ f_X \( \( n \)_x \) = 0 \, #h(2em) partial_s partial_t f_X (("Exp"_n #scale(x: 120%, y: 120%)[\(] s A_1 \( x - o \) + t A_2 \( x - o \) #scale(x: 120%, y: 120%)[\)])_x)\|_(s = t = 0) = 0 . $ <eq:setup-error-normalization>]

These affine tests are made on the lifted bulk formula and do not have to be periodic. The first derivative at alignment vanishes by spin invariance. Winding errors are allowed to have nonzero values and affine Hessians at alignment. These are the normalization conventions of and .

====== 1.2.3.4 The mandatory covering sum <the-mandatory-covering-sum>

A covering label $ell$ consists of a bounded measurable function $k_ell \( q \)$, a complete support $P_ell$, a record of load $s_ell$, and a nonempty inventory $J_ell$ of edges whose endpoints lie in that support. It is required that

$ k_ell \( q \) = 0 quad upright("unless") quad J_ell subset D \( q \) . $

Thus $J_ell$ is the inventory denoted by $D_ell$ in . No sign or differentiability condition is imposed on $k_ell$. Define

#[#set math.equation(numbering: n => "(1.61)")
 $ Xi \( q \) = sum_(Gamma upright(" a finite family of labels")\
P_ell ∩ P_(ell') = diameter med \( ell eq.not ell' \)\
union.sq.big_(ell in Gamma) J_ell = D \( q \)) product_(ell in Gamma) k_ell \( q \) . $ <eq:setup-covering-sum>]

The empty family has weight one. In particular $Xi \( q \) = 1$ when $D \( q \) = diameter$. If $D \( q \)$ is nonempty, every one of its edges must be supplied exactly once by the inventories in the family; inventories are not optional decorations. The covering norm is

#[#set math.equation(numbering: n => "(1.62)")
 $ parallel k parallel_(j \, A) = sup_x sum_(ell : x in P_ell) e^(A s_ell) parallel k_ell parallel_oo \, #h(2em) parallel k parallel_(j \, A) lt.eq w_j := exp \( - p_j^(1 \/ 4) \) . $ <eq:setup-covering-norm>]

The supremum norm is over the spin arguments of the weight, with all of its recorded tests included. This is . The covering sum is absolutely convergent even for a countable label list. Indeed, dropping compatibility and inventory constraints and summing over all finite subsets of the label list gives the bound

#[#set math.equation(numbering: n => "(1.63)")
 $ sum_Gamma product_(ell in Gamma) parallel k_ell parallel_oo lt.eq exp #h(-0.16667em) (sum_ell parallel k_ell parallel_oo) lt.eq exp \( \| Lambda_j \| w_j \) . $ <eq:setup-covering-convergence>]

For the second inequality, each support is nonempty, so

$ sum_ell parallel k_ell parallel_oo lt.eq sum_(x in Lambda_j) sum_(ell : x in P_ell) parallel k_ell parallel_oo lt.eq \| Lambda_j \| w_j . $

In particular $\| Xi \( q \) \| lt.eq exp \( \| Lambda_j \| w_j \)$.

All lists are covariant under simultaneous $O \( 3 \)$ transformations of the spin arguments, with constituent choices and tags retained together. The individual regular functions have the invariance already required above. Anchored lists are translation covariant in the bulk. Their spatial rules commute with quarter turns, and with simultaneous reflection of the blocking geometry and its data. In particular a reflection can exchange the two inclined blocking types. On an asymmetric torus, the symmetry operations concern lifted bulk labels and their folded copies; they do not require the torus itself to have a quarter-turn symmetry. Any operation encountering a long record or a period disagreement carries the winding load. Tags and full invariant tensors are retained together under these operations.

Anchors are assigned equivariantly by distributing a term equally among its permitted anchors while retaining identical complete supports. Eligibility and internal compatibility tests remain part of their labels. When masks in a spatial orbit differ, they are first replaced by a common stronger graph mask. The difference is retained exactly as a covering correction, since it can be nonzero only when that graph contains an edge in $D \( q \)$. The same convention applies to all later mask strengthening; its algebraic reassembly is the one in .

With these definitions, an effective density relative to product normalized area measure on $\( S^2 \)^(Lambda_j)$ has the form

#[#set math.equation(numbering: n => "(1.64)")
 $ rho_j \( q \) =  & exp { frak(v) \| Lambda_j \| - b cal(E)_(h \, t_j) \( q \) } Xi \( q \)\
 & quad times exp {- sum_(upright("canonical labels ") alpha) 1_(X_alpha) \( q \) thin cal(P)_alpha \( q \) - sum_X 1_X \( q \) f_X \( q \)} . $ <eq:setup-effective-density>]

Here $cal(P)_alpha$ includes the power of $b$ specified by its slot in (1.49). The bulk scalar $frak(v)$ is the same throughout the compatible family of representations over admitted periods. Constants caused by a period-dependent discrepancy remain in winding errors. This is the $S^2$ version of . Estimates for the representation also permit signed densities; densities obtained by the actual observation kernel are positive. We call a representation #emph[admitted] when these support, symmetry, period, and norm conditions hold and $b in \[ H_j \/ 2 \, 2 H_j \]$.

====== 1.2.3.5 Comparing two densities <comparing-two-densities>

Two inputs are compared on a common reference layer, with the same $H_j \, t_j$ and geometric thresholds. First use the prescribed common refinements of their labels, masks, and complete records; any mask strengthening retains its exact covering correction as above. Then retain the union of these refined label lists and assign coefficient or weight zero when a label is absent. Corresponding functions now have common graph domains and complete records. Write $b_1 \, b_2$ for the precise couplings and set $lambda = b_2 - b_1$. For fixed positive weights $omega_1 \, dots.h \, omega_7 \, omega_f \, omega_k$, define

#[#set math.equation(numbering: n => "(1.65)")
 $ u = sum_(a = 1)^7 omega_a parallel upright(bold(P))_(2 \, a) - upright(bold(P))_(1 \, a) parallel_sigma + omega_f delta_j^(- 1) parallel f_2 - f_1 parallel_(7 \, j \, A) + omega_k w_j^(- 1) parallel k_2 - k_1 parallel_(j \, A) . $ <eq:setup-density-discrepancy>]

The third and fourth coefficient discrepancies are zero. Polynomial coefficients are compared without their powers of $b$; the change in the precise coupling is recorded by $lambda$. The volume scalar is tracked separately and is not a component of $u$.

The weights are chosen after the successive canonical caps so that the triangular coefficient estimate and the error and covering estimates hold together. They remain fixed across layers and admitted periods. Each individual error is controlled through eight derivatives, whereas an error discrepancy is measured through seven. Thus a difference of integration maps acting on an unchanged error can use its eighth derivative without reducing the regularity of the next individual density. This is the comparison convention of , with the stronger contraction proved in Section 4.

===== 1.2.4 Endpoint laws and the scope of the imported estimates <setup:endpoints>

An #emph[endpoint density] is a layer-zero representation satisfying the preceding caps, with $b in \[ H \/ 2 \, 2 H \]$, and with the bulk scalar removed. We denote its remaining exponent by $X$. For an actual observed representation, $e^X Xi > 0$; its partition function and probability law are therefore well defined by

#[#set math.equation(numbering: n => "(1.66)")
 $ X \( q \) & = - b cal(E)_(h \, t_0) \( q \) - sum_alpha 1_(X_alpha) \( q \) cal(P)_alpha \( q \) - sum_Y 1_Y \( q \) f_Y \( q \) \,\
Z & = integral e^(X \( q \)) Xi \( q \) thin thin upright(d) omega^(⊗ Lambda_0) \( q \) \, #h(2em) thin upright(d) mu \( q \) = Z^(- 1) e^(X \( q \)) Xi \( q \) thin thin upright(d) omega^(⊗ Lambda_0) \( q \) . $ <setup:endpoint-law>]

The scalar removed from the partition function is exactly $e^(frak(v) \| Lambda_0 \|)$. For a fixed endpoint reference scale, $delta_0 = H^(- 2.05)$ and $w_0 = exp \[ - \( log H \)^(P_0 \/ 4) \]$; with $P_0 > 4$, the latter tends to zero faster than every fixed inverse power of $H$.

The definitions distinguish three kinds of input to the exact blocking construction. The scalar identities and localization estimates of and have no spin-dimension hypothesis. Their extension to the extra histories is proved in Section 3. The Gaussian product and connected-expansion estimates of and apply to finite-dimensional Gaussian integrations and complete support records satisfying their stated envelope and support-hit bounds. Section 4 verifies those bounds for the actual $S^2$ factors, including derivatives and the auxiliary normal coordinate. Finally, the improved coefficient, error, endpoint, and source comparisons are conclusions of this paper. They are not included in the definition of an endpoint law. The separate adaptations of the preliminary mixing estimates and the finite-volume Laplace coefficients are stated at their points of use in Sections 1 and 5.

This separation is useful in two places. Signed covering weights can be estimated algebraically without assuming positivity of a truncated covering sum. Reflection positivity and the continuum spectral conclusion, by contrast, concern the complete positive laws and are established only after the corresponding observation and limit arguments.

==== 1.3 Block observations and the free kernels <sec:free>

The exact integration in Section 4 uses a positive decomposition of the quadratic energy and exponentially localized Gaussian kernels. We construct these objects for ordinary square blocks and for one inclined initial block. The inclined construction is needed for the rotational comparison in Section 9. Its geometry differs only at the first step; after sufficiently many common ordinary steps, the two free precisions approach one another at a rate of order $L^(- 2)$ per step. The linear construction and positive decomposition are those of . We prove the changes required by the inclined geometry and retain the stronger history estimate implicit in the proof of .

Fix a sufficiently large dyadic integer $L$ and put $L_(*) = 5 L$. We use the scales in Equation (1.38), in particular $gamma = \( log L \) \/ \( 2 pi \)$, and the history convention of Section 2.1. Constants without an $L$ subscript in this section are uniform for all sufficiently large $L$ and all histories. Constants denoted by $C_L$ may depend on the fixed $L$. Only finitely many derivative and exponential-moment orders are required in any application; these orders are fixed before $L$ is chosen.

===== 1.3.1 Cells, weighted means, and the spherical observation <cells-weighted-means-and-the-spherical-observation>

Use the ordinary weights and spherical observation defined in Section 2.1. Write $chi$ for their fixed even smooth one-dimensional bump and $rho = 0.14$ for its support radius after rescaling a block to side one. The same bump is used in all the blockings below. Coordinates in each lattice plane may be translated.

For the two inclined blockings, let

$ O_(+) = 1 / 5 mat(delim: "(", 3, - 4; 4, 3) \, #h(2em) O_(-) = O_(+)^T \, #h(2em) c = (1 / 2 \, 1 / 2) . $

For $O in { O_(+) \, O_(-) }$ and $Y in bb(Z)^2$, define

$ cal(B)_Y^O = (c + L_(*) O Y + O \[ - L_(*) \/ 2 \, L_(*) \/ 2 \)^2) ∩ bb(Z)^2 . $

The coarse site $Y$ is embedded at the center $c + L_(*) O Y$. Sample the same product bump in the $O$ coordinates of this cell and normalize it. If $w_Y \( x \)$ denotes either an ordinary or an inclined weight, the averaging operator is

$ \( Q u \) \( Y \) = sum_(x in cal(B)_Y) w_Y \( x \) u_x \, #h(2em) w_Y \( x \) gt.eq 0 \, #h(2em) sum_x w_Y \( x \) = 1 . $

For a cell of side $l in { L \, L_(*) }$, smooth sampling gives $max_x w_Y \( x \) lt.eq C l^(- 2)$. The centered first moment vanishes exactly. For an ordinary cell this follows from coordinate reflections; for an inclined cell it follows from the quarter-turn symmetry proved below.

For inclined cells, define $m_Y$, $hat(m)_Y$, and the independent constituent tags by Equation (1.39), using these weights. The normalized spherical observation is Equation (1.40) with this $Q$. It is again a probability kernel, since its normalizing integral depends only on the length of the unit vector $hat(m)_Y$. The scalar free observation uses the same $Q$ and independent Gaussian noise of variance one.

#thm([Lemma 1.4.])[
  (Geometry and mean error for the inclined cells).  #emph[For either choice of $O$, the cells $cal(B)_Y^O$ partition $bb(Z)^2$, have exactly $L_(*)^2$ sites, and are connected by nearest-neighbor edges. There are no fine sites on their boundaries. Quarter turns about cell centers preserve the blocking. Reflection in a fine coordinate axis interchanges the two inclined types, with the reflected choice of centers. Every site of a cell can be joined to its central region by a path in the cell of length $O \( L_(*) \)$. Moreover, for every spin field, every cell, and every value of its tag, 
#[#set math.equation(numbering: n => "(1.67)")
 $ \| m_Y - hat(m)_Y \| lt.eq C / L_(*) sum_(e subset cal(B)_Y^O) r_e \, #h(2em) r_({ x \, y }) = \| q_x - q_y \| . $ <eq:orig-3>]

 The ordinary cells satisfy the corresponding estimate with $L$ in place of $L_(*)$.]
] <lem:free-inclined-geometry>

#proof[
  The two block-translation vectors are integral and their determinant is $L_(*)^2$. For example, for $O_(+)$ they are $\( 3 L \, 4 L \)$ and $\( - 4 L \, 3 L \)$. Multiplying a boundary equation by $5$ gives an integral right-hand side and a half-integral left-hand side, because the center is $\( 1 \/ 2 \, 1 \/ 2 \)$ and each relevant signed sum of $3$ and $4$ is odd. Thus no boundary contains a fine site. A half-open cell is a fundamental region for its block-translation lattice, and its fine sites give one representative of each coset. The number of sites is therefore its index $L_(*)^2$. A quarter turn about $c$ preserves $bb(Z)^2$, the rotated square, and its product weights. The same holds about every translated center. Coordinate reflection changes $O_(+)$ into $O_(-)$ and transports the center and weights accordingly.
  For connectivity, use the rotated coordinates relative to the cell center. If both coordinates have large absolute value, one of the four fine coordinate steps decreases both absolute values, each by at least $3 \/ 5$. If only one coordinate is near a cell boundary, choose a fine step decreasing that coordinate; the other coordinate has room for its change, whose absolute value is at most $4 \/ 5$. Repeating these moves reaches a fixed smaller interior rectangle in $O \( L_(*) \)$ steps. The same moves reach a bounded neighborhood of the center; paths of bounded length within the interior then join the central fine sites. All moves remain in the cell. This also supplies the cell paths used in the block alignment and coercivity estimates.
  It remains to prove the quantitative mean estimate. In fine coordinates, the support of the weights lies in the square
  $ A = { x in bb(Z)^2 : \| x_i - c_i \| lt.eq \( 7 \/ 5 \) rho L_(*) \, med i = 1 \, 2 } $
  translated to the cell in question. This square lies strictly within the inclined cell: its rotated coordinate radius is at most $\( 49 \/ 25 \) rho L_(*) = 0.2744 L_(*) < L_(*) \/ 2$. For each ordered pair $x \, y in A$, join $x$ to $y$ by first moving horizontally and then vertically inside $A$. In the weighted average of these paths, a horizontal edge in row $r$ has total load at most $sum_(x : x_2 = r) w_Y \( x \) lt.eq C \/ L_(*)$. A vertical edge in column $s$ has load at most $sum_(y : y_1 = s) w_Y \( y \) lt.eq C \/ L_(*)$. Hence
  $ D_Y := sum_(x \, y) w_Y \( x \) w_Y \( y \) \| q_x - q_y \| lt.eq C / L_(*) sum_(e subset A) r_e . $
  Since the spins have unit length,
  $ 1 - \| m_Y \|^2 = 1 / 2 sum_(x \, y) w_Y \( x \) w_Y \( y \) \| q_x - q_y \|^2 lt.eq D_Y . $
  On the normalized-mean branch, $\| m_Y - hat(m)_Y \| = 1 - \| m_Y \| lt.eq 1 - \| m_Y \|^2$. On the fallback branch, $\| m_Y \| < 1 \/ 2$ and every possible constituent spin satisfies
  $ \| m_Y - q_(tau_Y) \| lt.eq 1 + \| m_Y \| lt.eq 2 \( 1 - \| m_Y \|^2 \) lt.eq 2 D_Y . $
  This proves Equation (1.67) uniformly in the tag. The coordinate-path argument on an ordinary square is identical. ◻
]

#thm([Corollary 1.5.])[
  (Quadratic mean error under small chords).  #emph[For either block geometry, suppose that $r_e lt.eq T_j$ on the within-cell coordinate paths joining weighted sites in the proof of Lemma 7; in particular, this holds if all nearest-neighbor chords in the cell are at most $T_j$. For $H gt.eq H_0 \( L \)$ the normalized-mean branch is forced and 
$ \| m_Y - hat(m)_Y \| lt.eq C_L T_j^2 . $

 The bound is uniform in the layer $j$ and the cell.]
] <cor:free-small-chord-mean>

#proof[
  For either geometry these paths have length at most $C l$, where $l in { L \, L_(*) }$. Thus any two sites of positive weight satisfy $\| q_x - q_y \| lt.eq C l T_j$, and the squared pair identity gives
  $ 1 - \| m_Y \|^2 = 1 / 2 sum_(x \, y) w_Y \( x \) w_Y \( y \) \| q_x - q_y \|^2 lt.eq C l^2 T_j^2 lt.eq C_L T_j^2 . $
  Since $T_j lt.eq H^(- 49 \/ 100)$, taking $H gt.eq H_0 \( L \)$ makes the right-hand side less than $3 \/ 4$, uniformly in $j$. Therefore $\| m_Y \| > 1 \/ 2$ and $\| m_Y - hat(m)_Y \| = 1 - \| m_Y \| lt.eq 1 - \| m_Y \|^2$, proving the assertion. ◻
]

===== 1.3.2 Scalar precisions and their dependence on the history <scalar-precisions-and-their-dependence-on-the-history>

We first specify the operator spaces and Fourier convention. On a lattice $Lambda$ identified with $bb(Z)^2$ in its own frame, scalar fields belong to $ell^2 \( Lambda \; bb(R) \)$ and oriented edge fields to $ell^2 \( Lambda \; bb(R)^2 \)$. The forward gradient and its symbol are

$ \( d_mu u \) \( x \) = u \( x + e_mu \) - u \( x \) \, #h(2em) d_mu \( k \) = e^(i k_mu) - 1 \, #h(2em) D \( k \) = d \( k \)^(*) d \( k \) = 4 sum_(mu = 1)^2 sin^2 \( k_mu \/ 2 \) . $

Adjoints use counting measure. At a fixed coarse momentum, write $alpha$ for the fine alias index. The one-cell fine norm is $l^2 sum_alpha \| u_alpha \|^2$, while the coarse norm is $\| V \|^2$. Consequently, if $Q u = sum_alpha Q_alpha u_alpha$, then

$ \( Q^(*) V \)_alpha = l^(- 2) Q_alpha^(*) V . $

Conversely, for a coarse-to-fine map with $\( T V \)_alpha = T_alpha V$, its adjoint is $T^(*) u = l^2 sum_alpha T_alpha^(*) u_alpha$. The adjoints of the finite matrices $Q_alpha$ and $T_alpha$ in these formulas use the ordinary Euclidean inner product. Stars at complex momentum mean analytic continuation of the adjoint on real momentum.

A history $h$ is a finite sequence of ordinary observations, or an inclined initial observation followed by ordinary observations. The empty history has $K_diameter = K_0 = D$. If $Q$ is the next observation from the fine lattice $Lambda$ to the coarse lattice $Lambda'$, its output precision, conditional mean, and conditional covariance are defined by

#[#set math.equation(numbering: n => "(1.68)")
 $ \( K'_h \)^(- 1) = upright(bold(1)) + Q K_h^(- 1) Q^(*) \, #h(2em) P_h = K_h^(- 1) Q^(*) K'_h \, #h(2em) C_h = \( K_h + Q^(*) Q \)^(- 1) . $ <eq:free-operators>]

These formulas at the massless zero mode are understood by continuation of the Fourier expressions below. Equivalently, the first formula computes the covariance of $Q u$ plus the observation noise. We write $K_h \, P_h \, C_h$ when the particular history is understood. A prime always refers to the next lattice, not to differentiation.

To make the localization assertions precise, an operator on one lattice has an exponential kernel bound if, for some $c > 0$, $sup_x sum_y e^(c \| x - y \|) \| F \( x \, y \) \| < oo$. For a map between the fine and coarse lattices, use their physical positions measured in coarse lattice units. The analogous supremum over input sites is its column bound. Polynomial factors of any fixed order may be included by reducing $c$. Fine differences mean nearest-neighbor differences in the original fine coordinate directions.

#thm([Proposition 1.6.])[
  (Uniform free bounds and history contraction).  #emph[There are $L_0 \, A_0 \, c \, C > 0$ such that, for every dyadic $L gt.eq L_0$ and every admissible history, $K_h$ is analytic and bounded on a common complex neighborhood of the momentum torus and 
$ c D \( p \) lt.eq K_h \( p \) lt.eq C D \( p \) quad \( p in bb(R)^2 \) \, #h(2em) K_h \( p \) - D \( p \) = O \( \| p \|^4 \) . $

 There is a real, self-adjoint analytic edge lift $B_h$ with 
$ K_h = d^(*) B_h d \, #h(2em) c upright(bold(1)) lt.eq B_h lt.eq C upright(bold(1)) \, #h(2em) B_h \( 0 \) = upright(bold(1)) . $

 The lifts and their inverses have uniform exponential kernel bounds. For a step of side $l = L$ or $l = L_(*)$, the operators in Equation (1.68) satisfy 
$ K P = Q^(*) K' \, #h(2em) upright(bold(1)) - Q P = K' \, #h(2em) sup_x sum_Y e^(c "dist" \( x \, Y \) \/ l) \| nabla_f^s P \( x \, Y \) \| lt.eq C_s l^(- s) $

 for every fixed nonnegative integer $s$. Here the distance is between the physical fine site and coarse center, in fine units. The mean $P$ preserves constants and centered affine fields, with the rotation and scale of the output frame included. The covariance $C$ has exponential kernel bounds in coarse units with constants $C_L$.]
  #emph[Suppose two histories share their last $r gt.eq 0$ ordinary observation steps, using the same ordinary $Q$ in these steps and identifying their output coordinates. Then on a common fixed smaller complex strip, 
#[#set math.equation(numbering: n => "(1.69)")
 $ ∥K_(h_1) - K_(h_2)∥_(upright("an")) lt.eq C (A_0 / L^2)^r . $ <eq:free-history>]

 Here $∥dot.op∥_(upright("an"))$ is the supremum norm on that strip. The difference vanishes through degree three at the origin, and the same estimate holds for any prescribed finite set of analytic derivative and exponential kernel norms, after decreasing the strip or exponential weight. The corresponding differences of lifts and their inverses obey this bound. When the two histories are followed by a common next ordinary observation, their $P$ and $C$ differences obey the same bound with a permitted prefactor $C_L$.]
] <prop:free-bounds>

#proof[
  We give the analytic estimates with the geometry visible. This also identifies the hypotheses of that are retained. In an inclined step of side $l = L_(*)$, the fine aliases above coarse momentum $p$ are
  $ k_alpha = O \( p + 2 pi alpha \) \/ l \, #h(2em) alpha in bb(Z)^2 \/ \( l O^T bb(Z)^2 \) . $
  Choose representatives in a centered rotated square. For an ordinary step use $O = upright(bold(1))$ and $l = L$. Write $b_Q \( k \) = sum_x w_0 \( x \) e^(i k dot.op x)$, with integer origins when aliases are glued. Centered origins only change this symbol by a translation phase. On
  $ Omega_delta = { p in bb(C)^2 : \| "Re" p_mu \| < pi + delta \, \| "Im" p_mu \| < delta \, med mu = 1 \, 2 } \, $
  discrete summation by parts in the fine coordinate directions gives, for any fixed $J$ and multi-index $beta$,
  #[#set math.equation(numbering: n => "(1.70)")
   $ \| partial_p^beta b_Q \( k_alpha \) \| lt.eq C_(J \, beta) \( 1 + \| alpha \| \)^(- J) . $ <eq:free-bump-decay>]
  Indeed, the sum of absolute $J$th differences of the sampled normalized weights is $O \( l^(- J) \)$, while at least one fine difference multiplier on a nonprincipal alias has size $c \( 1 + \| alpha \| \) \/ l$. The weights vanish near the cell boundary, so the summation produces no boundary term. Complex tilting and $p$ derivatives insert bounded rescaled coordinates. This is the proof of , without any restriction to an axis-aligned support.
  The centered principal bump is uniformly nonzero on the real principal cube. For ordinary blocks use its product structure and the small support. For inclined sampling, its Riemann sum converges uniformly on that cube to the product Fourier integral in the rotated coordinates; that integral is nonzero by the same support bound. Increasing $L_0$ and decreasing the complex strip preserve the lower bound. The exact first moment is zero, so the principal product has the quadratic Taylor bound used in . Representatives relabel on overlaps of momentum cubes; the centered representatives there have comparable alias weights. We use these overlaps also at the faces of the rotated alias box.
  For a compound history let $m$ be the product of its side factors and let $O_h$ map the output coordinate frame to the original fine frame. For the coarse site at the origin, let $v_h \( x \)$ be the product of observation weights along the unique ancestry of its fine descendant $x$. These weights sum to one. Write $c_h = sum_x v_h \( x \) x$ for their center in the original fine coordinates. The transform in centered output coordinates is
  $ W_h \( xi \) = sum_x v_h \( x \) exp {i xi dot.op O_h^T \( x - c_h \) \/ m} \, #h(2em) D_(m \, O_h) \( xi \) = m^2 D \( O_h xi \/ m \) . $
  Using integer origins instead multiplies $W_h$ by a translation phase, which cancels in $W_h W_h^(*)$. This is the origin convention used when gluing aliases. Separating the principal alias in the covariance gives precisely the formula of :
  #[#set math.equation(numbering: n => "(1.71)")
   $ K_h \( p \) = frac(D_(m \, O_h) \( p \), W_h \( p \) W_h \( p \)^(*) + D_(m \, O_h) \( p \) R_h \( p \)) . $ <eq:free-explicit>]
  Here $R_h$ is the sum over nonprincipal aliases of $W_h W_h^(*) \/ D_(m \, O_h)$, together with the independent noise variances. The latter form a sum of products of squared-weight sums, starting with the last observation. This order matters when the first observation is inclined. For the empty history, take $W = 1$ and $R = 0$.
  For every nonprincipal centered representative, on a fixed sufficiently small complex domain,
  #[#set math.equation(numbering: n => "(1.72)")
   $ \| D_(m \, O_h) \( p + 2 pi alpha \) \| gt.eq c \( 1 + \| alpha \| \)^2 . $ <eq:free-alias-denominator>]
  To verify this, use $D \( z \) = 4 sum_mu sin^2 \( z_mu \/ 2 \)$ in the fine coordinates. On the centered fine box its real part is bounded below by a fixed multiple of the squared real argument minus a fixed multiple of the squared imaginary argument. A nonprincipal alias has real distance at least $c \( 1 + \| alpha \| \)$ from the principal origin. The same conclusion holds for representatives slightly across a face, by periodicity. Thus the proof of applies with the indicated rotation of the argument.
  The remaining issue is a bound independent of history length. In a sequence of $i$ ordinary observations, each descendant has a unique ancestral position and the squared weights sum to at most $\( A \/ L^2 \)^i$, for a fixed $A$. Descendant positions divided by their total side remain in a bounded set. Parseval at opposite imaginary tilts, followed by Cauchy–Schwarz, therefore gives the estimate of :
  $ sum_(alpha med mod med L^i) \| W_i \( p + 2 pi alpha \) W_i \( p + 2 pi alpha \)^(*) \| lt.eq C A^i . $
  For a ball of radius $C_1 L^i$, the same bound holds with a changed fixed constant, since that ball meets only a bounded number of alias boxes. Earlier factors have absolute product bounded by a fixed constant: their real arguments cost at most one, and their complex tilts have a summable geometric bound. Split the aliases into shells between successive radii $c_1 L^i$. By Equation (1.72), their contributions have successive ratio at most $A \/ L^2$, after changing $A$ once. If the history begins with an inclined observation, use Parseval also on the final shell ending at its full rotated box. Its side factor $5 L$ changes only fixed constants. This proves the shell bound of , uniformly for both kinds of history. The noise sum is bounded by the same geometric series.
  Consequently $R_h$ and its required derivatives are uniformly bounded on a fixed strip. On the real principal cube, $W_h W_h^(*)$ is uniformly bounded below: its first factor has the lower bound already proved, and the departures of subsequent factors from one have a summable quadratic bound. The denominator in Equation (1.71) is therefore positive and uniformly bounded below on the real cube. Its uniformly bounded derivatives keep it nonzero on a smaller fixed complex strip. This proves analyticity and ellipticity. At the origin its denominator is $1 + O \( \| p \|^2 \)$, while its numerator has quadratic term $\| p \|^2$. Reality and inversion symmetry remove odd terms. Every precision therefore has the same jet through degree three.
  We now compare two histories with $r$ common final ordinary steps. For a sufficiently small fixed $c_2$, aliases with $\| alpha \| < c_2 L^r$ can be identified in both histories. Put $xi = p + 2 pi alpha$ and denote the common product of the last $r$ factors by $W_r$. Taylor expansion of all factors preceding these steps, with the linear terms canceled in each $b b^(*)$, gives
  $ \| W_(h_1) W_(h_1)^(*) - W_(h_2) W_(h_2)^(*) \| lt.eq C \| xi \|^2 L^(- 2 r) \| W_r W_r^(*) \| . $
  No division by a bump factor is used. On the common nonprincipal aliases, the inverse denominators differ by at most $C L^(- 2 r)$. For the rotated denominator this follows from the same Taylor estimate, since its leading quadratic form is still $\| xi \|^2$. Parseval now bounds the change of the common nonprincipal sum by $C A^r L^(- 2 r)$. The shells outside this common region cost at most $C A^(r + 1) L^(- 2 r)$, and the part of the noise sum preceding the common steps has the same bound. On the principal term apply Taylor’s estimate directly to the numerator and product in Equation (1.71). Its denominator remains nonzero on the common strip, giving Equation (1.69) after increasing $A_0$. This argument also covers $r = 0$, when only a uniform bound is asserted. Cauchy estimates on nested fixed strips give all prescribed derivatives, and Fourier inversion gives the exponential kernel estimates and their polynomial moments.
  For completeness, the edge lift is obtained by applying the bounded coordinate divisions of to $K - D$, which vanishes to order four. They give a Hermitian lift $B^(upright("raw")) = upright(bold(1)) + O \( \| p \|^2 \)$ with bounded analytic coefficients. If $sans(c) = \( - d_2 \, d_1 \)$, then $sans(c) d = 0$, so addition of a fixed sufficiently large multiple of $sans(c)^(*) sans(c)$ leaves $d^(*) B d$ unchanged. The longitudinal form is bounded below by $K \/ D$; a two-by-two Schur complement makes the resulting $B$ uniformly positive away from zero, and $B^(upright("raw"))$ is already positive near zero. All divisions are bounded linear operations on fixed nested strips. The common added term cancels in differences, and the inverse identity preserves Equation (1.69). At empty history one may keep $B = upright(bold(1))$.
  In aliases the conditional mean is
  $ P_alpha = l^(- 2) K \( k_alpha \)^(- 1) b_Q \( k_alpha \)^(*) K' \( p \) . $
  On nonprincipal aliases, Equations (1.70) and (1.72) give arbitrary fixed inverse-power alias decay. The principal pole is removable by the covariance identity; its zero and first jets prove preservation of constants and centered affine fields. In inclined coordinates an affine function is evaluated at $x = c + l O Y$, which is the rotation and rescaling in . Each fine difference contributes at most $C \( 1 + \| alpha \| \) \/ l$. Taking sufficiently many bump differences and Fourier inverting on a smaller strip proves the claimed bounds for every fixed order $s$, including differences across cell boundaries. Finally, the nonprincipal block of $K + Q^(*) Q$ is inverted first; its rank-one update and principal Schur complement have the positive denominators used in . This proves the covariance bound, allowing constants depending on $L$. All these operations preserve the history discrepancy for a common next observation. For occurrences of $K^(- 1)$ on nonprincipal aliases, use the inverse difference identity and the same denominator bounds. ◻
]

===== 1.3.3 The positive kinetic identity and symmetry of its construction <the-positive-kinetic-identity-and-symmetry-of-its-construction>

The scalar estimates do not by themselves provide the positive local energy used in the nonlinear integration. We next lift them to edge operators. Write $cal(X)_Lambda = ell^2 \( Lambda \; bb(R)^2 \) xor ell^2 \( Lambda \; bb(R)^2 \)$ for a pair of edge fields. The following identity applies componentwise also to ambient $bb(R)^3$-valued fields; no constraint on their values is needed.

#thm([Proposition 1.7.])[
  (Positive completion for both block geometries).  #emph[A common $c_0 > 0$ and real analytic edge operators $ell_h$ can be chosen so that 
$ sans(A)_h = binom(sqrt(c_0) upright(bold(1)), ell_h) \, #h(2em) X_h = sans(A)_h d \, #h(2em) X_h^(*) X_h = K_h . $

 There are real maps 
$ cal(M) : cal(X)_(upright("coarse")) arrow.r cal(X)_(upright("fine")) xor ell^2 \( Lambda' \; bb(R) \) \, #h(2em) cal(N) : cal(X)_(upright("coarse")) arrow.r cal(X)_(upright("coarse")) xor ell^2 \( Lambda' \; bb(R) \) $

 with 
#[#set math.equation(numbering: n => "(1.73)")
 $ cal(M)^(*) cal(M) + cal(N)^(*) cal(N) & = upright(bold(1)) \, & cal(N) X' & = 0 \,\
cal(M)^(*) \( X u \, V - Q u \) & = X' V \, & cal(M) X' & = \( X P \, upright(bold(1)) - Q P \) . $ <eq:free-positive-isometry>]

 Their kernels have exponential moments. For a block side $l in { L \, L_(*) }$, the fine-output part of $cal(M)$ has row bound $C \/ l$, column bound $C l$, and first and second fine-difference row bounds $C \/ l^2$ and $C \/ l^3$. The coarse slots have bounded row and column norms. For a common next ordinary step, every history difference has the factor $\( A_0 \/ L^2 \)^r$ of Equation (1.69), with prefactor $C_L$ allowed. At empty history one may take $ell_diameter = sqrt(1 - c_0) upright(bold(1))$.]
  #emph[The construction commutes with simultaneous square symmetries of its geometry and its input data. An individual inclined history has C4 covariance; reflection transports it to the reflected history. Ordinary histories, including empty history, have the full square symmetries.]
] <prop:free-positive>

#proof[
  The construction in begins with an operator $T$ from coarse edges to fine edges satisfying
  #[#set math.equation(numbering: n => "(1.74)")
   $ T^(*) d = d' Q \, #h(2em) T B' d' = B d P . $ <eq:free-edge-identities>]
  We verify both analytic divisions in that construction for the inclined step. For each block-translation vector $l O e_mu in bb(Z)^2$, choose a fine coordinate path from $0$ to that vector. Its edge Fourier row $omega_mu \( k \)$ has length $O \( l \)$ and satisfies
  $ omega_mu \( k \) d \( k \) = e^(i k dot.op l O e_mu) - 1 = d'_mu \( p \) . $
  Collect these rows in $omega$ and set $T_(0 \, alpha) = l^(- 2) omega \( k_alpha \)^(*) b_Q \( k_alpha \)^(*)$. The fine adjoint normalization gives $T_0^(*) d = d' Q$. For an ordinary step this is the coordinate-path formula in .
  The remainder $R_alpha = B_alpha d_alpha P_alpha - T_(0 \, alpha) B' d'$ is divergence free, by $K P = Q^(*) K'$. The principal values of the path rows are the translation vectors, while $d_0 P_0$ has linear term $i O p \/ l$. These linear terms cancel in $R_0$, so it vanishes through first order. On every nonprincipal alias $R_alpha \( 0 \) = 0$. Its norm is $O \( l^(- 1) \)$ with arbitrary prescribed inverse-power decay in the alias index. The first division of therefore gives
  $ R_alpha = sans(c) \( k_alpha \)^(*) gamma_alpha \, #h(2em) gamma_alpha \( 0 \) = 0 . $
  At the principal origin use local coordinates along the fine axes; the rotation changes constants by a fixed factor. On a nonprincipal overlap divide by a component of $d \( k_alpha \)$ of size at least $c \( 1 + \| alpha \| \) \/ l$. The resulting scalar quotients agree on overlaps by the divergence-free identity. Thus $gamma$ has the same arbitrary fixed alias decay, without the factor $l^(- 1)$.
  The second division must produce a row $H$ with $H d' = gamma$ while preserving this decay. In the inclined case the true momentum-period lattice, in the $p$ axes and with the factor $2 pi$ omitted, is
  $ l O^T bb(Z)^2 = L mat(delim: "(", 3, 4; - 4, 3) bb(Z)^2 $
  for $O_(+)$, and its reflected version for $O_(-)$. The rectangular lattice $\( 25 L \) bb(Z)^2$ is a sublattice of index $25$. Work first on this rectangular covering torus. Its alias decay weight is the sum of the $25$ translated weights centered at the copies of the principal alias. Apply the sinc-power interpolation operator $Pi$ of , with $25 L$ in place of the rectangular side. For each translated weight its cyclic convolution bound is unchanged. The two rows
  $ H = (frac(gamma - Pi gamma, d'_1) \, frac(Pi gamma, d'_2)) $
  are analytic: the first numerator vanishes on each $d'_1 = 0$ plane; the second vanishes on each $d'_2 = 0$ plane because $gamma$ vanishes at every sampling intersection. Cauchy estimates in the $p$ variables give bounded removable quotients, with no extra power of $l$. Average over the finite deck group to recover the true period lattice. Integer fine-site phases make this descent agree with alias gluing. We have therefore obtained the second division with constants uniform in $L$. Setting
  $ T_alpha = T_(0 \, alpha) + sans(c) \( k_alpha \)^(*) H_alpha \( B' \)^(- 1) $
  proves Equation (1.74), with alias bound $C_J l^(- 1) \( 1 + \| alpha \| \)^(- J)$. Fourier inversion gives its row, column, and fine-difference bounds. The divisions and the inverse identity preserve history differences.
  We describe the remaining positive completion to specify the role of the normalization. On real momentum put
  $ U = \( B' \)^(- 1) - T^(*) B^(- 1) T - d' d' ""^(*) . $
  The edge identities and $upright(bold(1)) - Q P = K'$ give
  $ U B' d' = d' - T^(*) d P - d' K' = d' \( upright(bold(1)) - Q P - K' \) = 0 . $
  Coarse coordinate-plane division on both sides factors $B' U B'$ through $sans(c)' ""^(*) sans(c)'$ with a bounded analytic scalar coefficient. Also $sans(c) B^(- 1) T B' d' = 0$. Before the last division its aliases have bound $C l^(- 2) \( 1 + \| alpha \| \)^(- J)$. Squaring and summing with the fine norm $l^2 sum_alpha$ gives exactly the estimates used in :
  $ \| z^(*) U z \| lt.eq C \| sans(c)' \( B' \)^(- 1) z \|^2 \, #h(2em) ∥sans(c) B^(- 1) T z∥^2 lt.eq C l^(- 2) \| sans(c)' \( B' \)^(- 1) z \|^2 . $
  In particular the inclined step has the correct normalization $l^2 = L_(*)^2$, rather than the area of an enclosing axis square.
  For one fixed sufficiently large $lambda$, replace the inverse lift by
  $ tilde(B)^(- 1) = B^(- 1) + lambda B^(- 1) sans(c)^(*) sans(c) B^(- 1) $
  and make the same replacement at the next scale. It leaves $tilde(B) d = B d$ and hence the precision unchanged. Define the modified defect by
  $ U_(*) = \( tilde(B)' \)^(- 1) - T^(*) tilde(B)^(- 1) T - d' d' ""^(*) . $
  Expanding the two modified inverse lifts gives
  $ U_(*) = U + lambda #scale(x: 120%, y: 120%)[\[] \( B' \)^(- 1) sans(c)' ""^(*) sans(c)' \( B' \)^(- 1) - T^(*) B^(- 1) sans(c)^(*) sans(c) B^(- 1) T #scale(x: 120%, y: 120%)[\]] . $
  The preceding two bounds therefore show that $U_(*)$ is bounded below by
  $ \[ lambda \( 1 - C \/ l^2 \) - C \] \( B' \)^(- 1) sans(c)' ""^(*) sans(c)' \( B' \)^(- 1) . $
  Choose $lambda$ first and then $L$ sufficiently large, so this coefficient is at least one. The defect has a factorization $tilde(B)' U_(*) tilde(B)' = sans(c)' ""^(*) B_2 sans(c)'$ with $B_2$ a uniformly positive analytic scalar. Positivity through zero follows from
  $ sans(c)' \( B' \)^(- 1) tilde(B)' = #scale(x: 120%, y: 120%)[\[] 1 + lambda sans(c)' \( B' \)^(- 1) sans(c)' ""^(*) #scale(x: 120%, y: 120%)[\]]^(- 1) sans(c)' . $
  Choose $c_0$ below the common lower bound for $tilde(B)$ and put $ell = \( tilde(B) - c_0 upright(bold(1)) \)^(1 \/ 2)$. For $S' = sans(A)' \( tilde(B)' \)^(- 1) \( sans(A)' \)^(*)$ define
  $ cal(M) z & = (sans(A) tilde(B)^(- 1) T \( sans(A)' \)^(*) z \, d' ""^(*) \( sans(A)' \)^(*) z) \,\
cal(N) z & = (\( upright(bold(1)) - S' \) z \, B_2^(1 \/ 2) sans(c)' \( tilde(B)' \)^(- 1) \( sans(A)' \)^(*) z) . $
  The identities $sans(A)^(*) sans(A) = tilde(B)$ and $\( sans(A)' \)^(*) sans(A)' = tilde(B)'$ make $S'$ an orthogonal projection. The definition and factorization of $U_(*)$ then give
  $ cal(M)^(*) cal(M) = S' - sans(A)' U_(*) \( sans(A)' \)^(*) \, #h(2em) cal(N)^(*) cal(N) = upright(bold(1)) - S' + sans(A)' U_(*) \( sans(A)' \)^(*) . $
  Their sum proves the isometry in Equation (1.73). Substitution of the two edge identities proves Equation (1.73), and $sans(c)' d' = 0$ proves the null identity. All square roots and inverses are uniformly analytic on a smaller strip. Their exponential kernel bounds preserve those of $T$. At empty history retain $B = tilde(B) = upright(bold(1))$ on the fine side; this removes a nonnegative subtraction from the defect and improves its positivity. It gives the asserted value of $ell_diameter$.
  Finally the choices of lift and intertwiner must be the same rules for all data, including data with different individual reflection symmetries. Given a particular construction $F$ and input data $cal(D)$, replace it by the finite average
  $ frac(1, \| G \|) sum_(R in G) R^(- 1) F \( R cal(D) \) \, $
  where $G$ is the square symmetry group and the actions include the induced edge and plaquette permutations, signs, and integer translations restoring the chosen origins. First make this average for the lift; then make it for $T$ with that lift fixed. Each defining identity is linear in the output being averaged, and positivity and lower bounds of lifts survive the average. For inclined data include both reflected types in the input family. The subsequent factorization and positive square roots commute with these actions. Thus the rules are covariant even when an individual precision has only C4 symmetry. The averaging never replaces that precision by a mirror average. Being fixed finite averages, these operations also preserve all discrepancy estimates. This common choice is used in the nonlinear comparisons (1.76) and (1.120). ◻
]

===== 1.3.4 Finite periods and unfolded symmetry <finite-periods-and-unfolded-symmetry>

All kernels above are chosen once on the infinite lattice and then periodized. The permitted finite tori are quotients by square, rectangular, or oblique sublattices of translations, with the bounded shape ratios used below. Their period lattices must be divisible by every applied blocking: after each block map they become translation periods of the next lattice. We require only that the shortest period, measured in layer-$0$ sites, exceed a fixed $m_min \( L \, H \)$.

Periodization folds the absolutely summable bulk kernels and their identities. For expressions carrying connecting paths, retain the lifted path before folding, as in ; its length records a contribution that crosses a period. Locality tests at any layer use the shortest period in that layer. Enlarging $m_min \( L \, H \)$ enforces simultaneously all scale-neighborhood conditions following , including those for the inclined initial step. Calculations on short symmetry orbits use C4, or the full square group when available, on the unfolded bulk labels. They therefore remain valid on asymmetric finite tori. Terms whose records cross a period keep their separate long-path bounds; no symmetry of such terms, or of the finite period lattice itself, is assumed.

==== 1.4 An exact renormalization step with almost dimension-two contraction <sec:rg>

The linear operators of Section 3 identify the quadratic part of one block integration. We now control the nonlinear remainder, including configurations with large spin differences. Two features of $S^2$ matter. Its tangent planes do not have a globally preferred frame; we therefore perform Gaussian completion in the fixed ambient space $bb(R)^3$. In addition, the full stabilizer $O \( 2 \)$ contains tangent inversion. Together with spatial inversion, this removes the cubic terms that would otherwise limit the contraction of the normalized remainder to order $L^(- 1)$.

Throughout this section a step goes from layer $j$ to layer $j - 1$. Write $l = L$ for a regular step and $l = L_(*) = 5 L$ for an inclined first step. Put $t = t_j$, $t' = t_(j - 1)$, $p = p_j$, $M = frak(m)_j$, $M' = frak(m)_(j - 1)$, and $g = b^(- 1 \/ 2)$, where $b in \[ H_j \/ 2 \, 2 H_j \]$. Thus $t$ is comparable to $g p$. All geometric cutoffs use the fixed reference scales $H_j \, t_j$, including when two precise couplings are compared. A history records the linear observations already performed. Histories may start with one inclined observation and then use regular observations.

===== 1.4.1 The retained class and the step theorem <the-retained-class-and-the-step-theorem>

We use the retained densities and norms of Section 2. The tangent coordinates at an anchor $o$ are

$ y_o \( x \) = "proj"_(q_o^perp) q_x . $

Coefficient tensors are invariant under the full orthogonal group of $q_o^perp$. Their value is consequently independent of an orthonormal basis of that plane. The odd canonical slots $P_5 \, I_3$ vanish; it is convenient to retain their zero entries in the canonical vector $upright(bold(P))$. Quadratic packets are averaged over spatial quarter turns and compensated to have zero affine Hessian. The two factors of a quadratic polynomial are symmetrized before compensation. Indeed an $O \( 2 \)$-invariant color contraction is the dot product, and quarter-turn averaging of its symmetric spatial quadratic form gives a scalar multiple of the identity.

The same quarter-turn convention is imposed on all histories. Every choice also commutes with simultaneous reflection of the geometry and the input data, as in Section 3; a precision lacking a reflection symmetry is not itself averaged over that reflection. Paths can be chosen by retaining the finitely many coordinate-order paths together, or by taking their union. A connected expression keeps its individual joining paths before its output mask is enlarged. Each bulk regular-error packet is invariant under simultaneous spin transformations and under spatial inversion about its anchor. Its mask is strengthened to a common invariant graph. As in , the exact off-mask correction is retained in the covering gas.

The error norm uses actual classical derivatives on the open graph domain, with $k = 8$. At a spin $q_x$, the rotation directions are $v_x times q_x$, with the spatial weights specified in the common setup. At a single site they give uniformly equivalent tangent norms, and fixed small spherical charts have uniformly bounded coordinate derivatives. For graph norms, chart chain rules also multiply spatial weights; the resulting mesoscopic and load factors are tracked in Lemma 17. No smoothness is required of an error away from its graph domain. Integration factors with Gaussian color indices retain their full contracted tensor. Thus internal invariance holds for each integrated packet, although it need not hold for a component before its indices are contracted. The same convention applies to factors carrying external vector indices in Section 8.

On a torus, a calculation is declared winding when its complete lifted record crosses the prescribed shortest-period threshold. Short orbit calculations use the bulk symmetry of the lifted labels, even when the torus itself is not invariant under those symmetries. Winding terms retain their winding price and need not have the bulk normalization. The initial nearest-neighbor representation has these conventions: all witnesses of a deleted masked row are joined in its component. Fixed enlargements of graphs, including projection to an inclined coarse grid, change only the constant in the load-projection estimate. The short-record threshold can be decreased and the minimum admitted period increased to accommodate them.

#thm([Theorem 1.8.])[
  (Exact step and comparison).  #emph[Fix $upsilon > 0$ sufficiently small. There are choices of $L$, the canonical caps and comparison weights, $P_0$, and finally $H$ such that integration against one normalized block observation sends every admitted retained density at $b in \[ H_j \/ 2 \, 2 H_j \]$ to an exact representation of the same form in layer $j - 1$, with all renewed shape caps. The representation may be iterated when its new coupling belongs to $\[ H_(j - 1) \/ 2 \, 2 H_(j - 1) \]$; that admission is established separately by shooting in Section 5. Its precise coupling is 
#[#set math.equation(numbering: n => "(1.75)")
 $ b' = b + alpha_h \( upright(bold(P)) \) + frac(kappa_h \( upright(bold(P)) \), b) + Delta \, #h(2em) \| Delta \| lt.eq C_L H_j^(- 1.05) . $ <eq:orig-4>]

 Here $h$ is the free history, and the bulk scalar, canonical slots, and kicks use the prescriptions of adapted below to $S^2$. All retained norm caps are renewed.]
  #emph[For two regular steps with common geometric scales, let $lambda = b_2 - b_1$, and let $u$ be the fixed weighted shape discrepancy: canonical coefficient differences, regular-error difference divided by its cap, and covering-gas difference divided by its cap. The regular error difference is measured through order $k - 1$. Then 
#[#set math.equation(numbering: n => "(1.76)")
 $ u' & lt.eq q u + C_L "poly" \( H_j \) epsilon.alt_h + C_L \( log H_j \)^C \| lambda \| \/ H_j \,\
\| lambda' - lambda \| & lt.eq C_L u + C_L "poly" \( H_j \) epsilon.alt_h + C_L \( log H_j \)^C \| lambda \| \/ H_j \, #h(2em) q < L^(- 2 + upsilon) . $ <eq:orig-5>]

 For identical histories $epsilon.alt_h = 0$. If the histories share their last $r$ regular observations, one may take $epsilon.alt_h = \( A_0 \/ L^2 \)^r$, with the constant $A_0$ of Section 3. The same-step Lipschitz bounds with no history change hold also for an inclined first step. The representation classes and constants are common to all the admitted histories and periods. Signed covering activities are allowed: the logarithm used in constructing the regular exponent is the convergent connected logarithm of the small background factor, based at one. The mandatory-cover factor is retained as a sum, and no logarithm of the full signed density is taken.]
] <thm:rg-step>

We prove the theorem in five stages: a sector decomposition isolates large differences; ambient Gaussian completion treats the remaining spins; joint estimates control products of the resulting factors; canonical extraction identifies the finite Taylor terms; and normalization returns the remainder to the retained class. The last stage uses the strengthened contraction proved below, rather than the $L^(- 1)$ contraction of .

===== 1.4.2 Sector geometry and the energy identity <subsec:rg-sectors>

We first specify the geometric data that remain fixed during each Gaussian integral. All distances are measured in fine-lattice units, with a coarse position embedded at its block anchor. Primitive free kernels are truncated at a radius $c_L M$, and inverse windows are chosen on the same scale. The constant is reduced so that the sum of radii in each of the finitely many local compositions, including block diameters, reference displacements and kinetic-mask reads, is less than $M \/ 100$. This is possible because $L$ is fixed and the mask radius is $O_L \( log H_j \) = o \( M \)$. Omitted paths have weighted sums $C_L e^(- c_L M)$ and are kept as separate factors. Arbitrarily long inverse and determinant chains keep all their successive windows and endpoints in their records.

A smooth edge profile is one for $\| d_e q \| lt.eq t \/ 4$ and zero for $\| d_e q \| gt.eq t \/ 2$. A smooth observation profile is one for $\| V_Y - hat(m)_Y \| lt.eq W t$ and zero for $\| V_Y - hat(m)_Y \| gt.eq 2 W t$, with $W$ fixed sufficiently large. Expanding each profile plus its complement gives an exact partition. A chosen complement is called an input or observation #emph[seed]. Every true output bad edge is also a mandatory seed. Join seeds whose radius-$50 M$ neighborhoods intersect. A resulting component, together with its assigned factors, is called a #emph[core].

The assignments are those of : spins within $3 M$ of the seeds are frozen and retain Haar integration; numerical energy rows within $5 M$ are assigned to the core; stationary squares within $8 M$ and default profiles within $14 M$ have the same owner. Leading determinant changes have an owner within $3 M$ plus the inverse window radius. The larger collections do not duplicate the numerical rows. Distinct $50 M$ footprints are disjoint, so every assignment is unique. Maximality of a component is imposed by compatibility of its footprints in the pattern sum, not by an extra distant predicate in a single core factor. A #emph[complete support] records every numerical argument, mask, eligibility test, present or absent status query, window and joining path used by the factor. This convention is essential for factorization later.

Here are the energy rows whose ownership has just been fixed. Let $d \, d'$ denote fine and coarse differences, let $ell_s \, ell'_s$ be the truncated free edge operators, and put

$ X = \( sqrt(c_0) thin d q \, ell_s d q \) \, #h(2em) Y = sqrt(a) \( V - hat(m) \) \, #h(2em) X' = \( sqrt(c_0) thin d' V \, ell'_s d' V \) \, #h(2em) a = 1 . $

Write $X_2 \, X'_2$ for the second components. For a vector $z$, $"clip"_t z$ has length $min \( \| z \| \, t \)$ and the same direction, with value zero at $z = 0$. With the output kinetic mask $m'$, define

$ zeta = \( sqrt(c_0) "clip"_(t') d' V \, m' ell'_s d' V \) \, #h(2em) \( nu \, w \) = cal(M)_s zeta . $

The free bounds imply $\| zeta \| + \| w \| lt.eq C t$ and $\| nu \| lt.eq C t \/ L$ entrywise. The input kinetic energy plus observation energy minus output kinetic energy equals the sum of

$ cal(F)_e & = S_t \( r_e \) + 1 / 2 m_e \| X_(2 \, e) \|^2 - nu_e dot.op X_e + 1 / 2 \| nu_e \|^2 \, & cal(B)_Y & = 1 / 2 \| Y_Y - w_Y \|^2 \,\
cal(C)_E & = zeta_E dot.op X'_E - 1 / 2 \| zeta_E \|^2 - S_(t') \( \| d'_E V \| \) - 1 / 2 m'_E \| X'_(2 \, E) \|^2 \,\
cal(U)_E & = zeta_E dot.op \[ cal(M)_s^(*) \( X \, Y \) - X' \]_E \, & cal(N)_i & = 1 / 2 \| \( cal(N)_s zeta \)_i \|^2 \,\
cal(Z)_E & = 1 / 2 zeta_E dot.op \[ \( upright(bold(1)) - cal(M)_s^(*) cal(M)_s - cal(N)_s^(*) cal(N)_s \) zeta \]_E . $

This is the identity , applied to real ambient fields. The cross terms cancel because $\( nu \, w \) = cal(M)_s zeta$; the last row accounts exactly for truncation of the free isometry. In particular gives

$ \| cal(Z)_E \| lt.eq C_L e^(- c_L M) t^2 \, #h(2em) \| cal(U)_E \| lt.eq C_L t e^(- c_L M) + C t sum_Y e^(- c "dist"_f \( E \, Y \) \/ l) \| m_Y - hat(m)_Y \| . $

Here $"dist"_f$ denotes the fine-coordinate distance between the embedded coarse sites; dividing by $l$ measures the kernel decay in coarse units. Thus its sum over $Y$ is bounded independently of $L$. These formulas define the rows before any small-angle expansion.

Select the $cal(F) \, cal(B)$ rows farther than $2.5 M$ from every seed. Each row incident on a nonfrozen column is selected. The retained defaults, including their closed derivative supports, imply that all spins read by a selected assigned row are within $C_L t$ of their block reference. For regular cells this is the coordinate-path proof of ; for inclined cells it uses the paths and mean estimate of Section 3.

The support prescriptions of are retained in full. In particular an optional factor $e^V$ with merely measurable spin dependence is prepared as $1 + chi_(upright("att")) \( e^V - 1 \)$, not by opening $chi_(upright("att")) e^V$. Here $chi_(upright("att"))$ is the product of its attached chart protectors and alignment profiles. It is one on the original sector, remains attached to the selected letter, and does not create an order-one failure outside its plateau. A separate global chart profile removes nonprincipal exponential preimages.

For a calculation with empty output inventory, all queried output statuses are fixed to no flag, clipping is replaced by the identity, and good output masks by one. The resulting analytic formula is extended through graph gradients $< 4 t'$ and cut off only on a larger graph domain. It agrees with the physical formula on the outgoing regular mask. If output inventory is nonempty, its statuses stay fixed and no field derivative is taken. In neither case is a discontinuous output predicate differentiated across its jump.

===== 1.4.3 Ambient Gaussian completion <subsec:rg-ambient>

For a nonfrozen site put $T_x = V_(\[ x \])$ and use the principal intrinsic coordinate

$ u_x = "Log"_(T_x) q_x in T_x^perp \, #h(2em) q_x = "Exp"_(T_x) u_x . $

The sector bounds give $\| u_x \| lt.eq C_L t$. Frozen coordinates read by selected rows use the same logarithm multiplied by a smooth radial cutoff inside its injectivity radius $pi$, and extended by zero. This is a globally smooth function of the pair of spins. Protectors are supported strictly inside that chart and equal one on the required plateaus. Unlike a tangent frame, this construction is intrinsic.

#thm([Lemma 1.9.])[
  (A normalized ambient completion).  #emph[Fix a primary pattern, the frozen spins, the tags in the observation, and the output data with their statuses. Let $D$ be the scalar column matrix, on the nonfrozen sites, of the selected rows of 
$ D_0 = \( sans(A)_s d \, - sqrt(a) Q \) \, #h(2em) A = D^(*) D . $

 Adjoining the normalized scalar Gaussian with negative log density $b \| D v \|^2 \/ 2$ and setting 
$ xi_x = u_x + T_x v_x $

 gives an exact integration in $bb(R)^3$ at every nonfrozen site, with Lebesgue Jacobian one for this change of variables. The matrix $A$ satisfies $c_L upright(bold(1)) lt.eq A lt.eq C_L upright(bold(1))$, uniformly in the pattern and period. No cutoff on $v$ is required.]
  #emph[For a selected row with reference $T_i = V_(o \( i \))$, let its affine constant be the projection onto $T_i^perp$ of the physical row $R_i \( 0 \, V \)$, where $R = \( X - nu \, Y - w \)$. Insert the smoothly extended frozen coordinates in $D_0$ and denote the resulting affine row by $D_i xi + F_i$. On the selected-row and smooth angular-cutoff supports, the additional error caused by the scalar coordinate in subtracting the affine square is bounded in absolute value by 
#[#set math.equation(numbering: n => "(1.77)")
 $ C_L M^D (t^2 sum_x \| v_x \| + t sum_x \| v_x \|^2) . $ <eq:orig-6>]

 The sums run over that row’s complete coordinate reads. The same estimate holds on the enlarged no-output-flag graph domains.]
] <lem:rg-ambient>

#proof[
  Because every row incident on a nonfrozen column is selected, $A$ is the corresponding principal restriction of $d^(*) sans(A)_s^(*) sans(A)_s d + a Q^(*) Q$. Block Poincaré, with vectors extended by zero into frozen sites, gives
  $ ∥v∥_2^2 lt.eq C_L L^2 #scale(x: 120%, y: 120%)[\(] ∥d v∥_2^2 + ∥Q v∥_2^2 #scale(x: 120%, y: 120%)[\)] . $
  The same argument uses the cell paths for an inclined step. Together with the fixed positive direct-edge coefficient it proves the stated ellipticity, as in the paragraph preceding . The empty exterior causes no exception: the Gaussian integral is then one.
  At fixed $T_x$, the orthogonal sum $T_x^perp xor bb(R) T_x = bb(R)^3$ is an isometry. Hence $\( u_x \, v_x \) mapsto xi_x$ has Jacobian one. The original spin measure contributes only the dimension-two spherical Jacobian
  $ J \( u \) = frac(1, 4 pi) frac(sin \| u \|, \| u \|) \, #h(2em) J \( 0 \) = frac(1, 4 pi) \, $
  where the value at zero is taken by continuity. The scalar integral has been normalized, so no degree of freedom has been added to the physical measure.
  All reference spins in a selected row’s reads differ by at most $C_L M^D t$, while physical angles are at most $C_L t$. At zero angle, the normal component of $R_i \( 0 \, V \)$ is $O \( C_L M^D \( t^2 + e^(- c_L M) t \) \)$. Taylor expansion of the stack gradients and chord mean proves this bound; scalar kernels commute with a constant reference rotation. The linear variation of the physical row is $D_0 u$, with remainder $O \( C_L M^D t^2 \)$. Meanwhile
  $ D_0 \( T v \) - T_i D v = O \( C_L M^D t \) max_x \| v_x \| . $
  The product of $T_i D v$ and the leading physical tangent row is zero. The remaining cross products give the first term of Equation (1.77), and the scalar-square mismatch gives its second term. Arbitrarily accurate truncation errors are included. For a symmetry tie between finitely many references we use the average of the projected affine row and retain every reference read. The same estimate can be made with any one of those references.
  The enlarged no-flag domains merely replace the fixed small-angle constant by a larger one. No small-angle bound has been asserted for a nonselected core row, whose physical energy remains unexpanded. ◻
]

We next make Gaussian localization explicit. For a nonfrozen site $x$ let $Omega_x$ be its inverse window, restricted to nonfrozen sites. For $a_0 gt.eq 0$ define the column-window inverse and its residual by

$ \( Pi_(a_0) \)_(y x) = upright(bold(1))_(y in Omega_x) \( A_(Omega_x) + a_0 \)_(y x)^(- 1) \, #h(2em) E_(a_0) = \( A + a_0 \) Pi_(a_0) - upright(bold(1)) . $

We use $a_0$ here to distinguish the resolvent parameter from the observation precision $a = 1$. The estimates give weighted row and column bounds $C_L \/ \( 1 + a_0 \)$ for the inverses and $C_L e^(- c_L M) \/ \( 1 + a_0 \)$ for the residuals, including their history differences. Define

$ C_s = 1 / 2 \( Pi_0 + Pi_0^(*) \) \, #h(2em) mu = - Pi_0^(*) D^(*) F \, #h(2em) r_s = D mu + F . $

For large $H$, $C_s$ and every principal marginal have fixed-$L$ upper and lower spectral bounds. Use one common ambient Gaussian $Z tilde.op N \( 0 \, C_s ⊗ upright(bold(1))_(bb(R)^3) \)$ and substitute $xi = mu + g Z$. Expanding the affine squares gives the exact density-ratio identity ; its remaining exponent is

$ 1 / 2 Z^(*) \( C_s^(- 1) - A \) Z - g^(- 1) \( A mu + D^(*) F \)^(*) Z . $

With $E_s = A C_s - upright(bold(1))$, the corrections are the convergent series

$ C_s^(- 1) - A = sum_(r gt.eq 1) \( - E_s \)^r A \, #h(2em) log det C_s = - "Tr" log A + sum_(r gt.eq 1) frac(\( - 1 \)^(r + 1), r) "Tr" E_s^r \, $

together with the resolvent expansion for $log A$ in . Each residual path contains at least one exponentially small residual hop. For every fixed required support exponent its summed bound is the chain bound , with the same bound for one history difference.

The scalar normalization in Lemma 12 cancels one color in the leading determinant. Its coefficient is therefore two, although the Gaussian used for all estimates has three ambient colors. In the explicit local determinant compensation of , replace the coefficient $3 \/ 2$ by $1$ and use $kappa_g = \( 2 pi g^2 \) J \( 0 \)$. For example the leading window scalar at $x$ is

$ h_x = - integral_0^oo #scale(x: 120%, y: 120%)[\(] \( 1 + a_0 \)^(- 1) - \( A_(Omega_x) + a_0 \)_(x x)^(- 1) #scale(x: 120%, y: 120%)[\)] thin thin upright(d) a_0 . $

Its empty-pattern value retains the site’s phase modulo the block lattice. The frozen-site compensations and changes near a hole are assigned as above. Residual scalar-determinant terms are the same exceptional paths with fixed coefficients. Thus their complete supports and locality are unchanged.

#thm([Lemma 1.10.])[
  (Prediction of a spin).  #emph[On a stencil with the margins of , in the empty pattern or away from nearby cores, put 
$ q_x^0 = "Exp"_(T_x) \( "proj"_(T_x^perp) mu_x \) . $

 Then the three estimates hold with this spin: 
$ r_s = O #scale(x: 120%, y: 120%)[\(] C_L M^D \( t^2 + t e^(- c_L M) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| d q^0 \| lt.eq C t \/ L + C_L M^D t^2 \, #h(2em) \| mu \| lt.eq C t + C_L M^D t^2 . $

 They hold with the fixed normalized derivatives and with a single history or precise-coupling difference. The leading constants are uniform before $L$ is chosen. Everywhere, including on extensions near cores, $\| mu \| lt.eq C_L M^D t$.]
] <lem:rg-prediction>

#proof[
  Use a tangent chart at a coarse reference spin $e_0$ and denote the first tangent data of $V$ by $w_0$. At angle zero the fine spin prescription has tangent $w_0 \( \[ x \] \)$. Its variation in $u$ adds $D_0 u$ to the rows. With full kernels, the choice
  $ u \( x \) = \( P_h w_0 \) \( x \) - w_0 \( \[ x \] \) $
  solves the linearized affine equations with zero residual, by the ambient and harmonic free identities. The normalized mean has tangent differential the identity. Projecting the constant row does not alter its first tangent. Invertibility of $D^(*) D$ therefore makes this the exact first tangent of the affine Gaussian mean, with zero normal component. Only linear data are used in this identity.
  Window and kernel truncation change the comparison by $C_L e^(- c_L M)$ in all required weighted kernel moments. On the supplied output graph the stencil lies in an $O_L \( M t \)$ chart. Missing positions outside it may be filled by zero in that chart; the retained margins make their contribution exponentially small. Based at a block spin, output chord bounds give coordinate size $C t \( 1 + \| z - \[ x \] \| \)$. The summable weighted rows of $P_h$ therefore give $C t \/ L$ for a one-fine-edge difference, and $C t$ for the mean with its constant part subtracted. Products and remainders of the smooth spin and projection maps cost $C_L M^D$ times the indicated products of sizes, yielding the quadratic errors above.
  Each normalized derivative contributes $t$ times the order-eight spatial direction weight. The leading row moments sum that weight; other contributions cost a fixed polynomial in the stencil size. Changing the direction anchor inserts the corresponding distance weight in each slot, paid by the complete record and its load. Every map derivative beyond first order has at least two factors of $t$. Stationary rows have zero first tangent except for the exponentially small window discrepancy. This also proves the needed mean and stationary-row differences by the free-kernel comparison bounds. Frozen-angle extensions outside these local prediction regions only need the fixed polynomial bounds. A cutoff of their defining data on a larger graph domain gives the global bound for $mu$, without requiring a global spherical logarithm. This verifies, in particular, the empty-pattern predictions at every center used in a mask transfer. ◻
]

===== 1.4.4 Products of factors and large-gradient reserves <subsec:rg-products>

The completion has reduced each sector to one Gaussian expectation, frozen Haar integrals and finite tag averages. Factors in this common expectation are generally correlated. We establish product estimates before expanding their connected contributions.

For a core $c$, let $s_c$ be its number of seeds and $I_c$ its Gaussian read set. In its energy sum subtract each selected assigned affine square exactly once, and include the assigned stationary squares, profiles, local inventories, attached protectors and normalization compensations. Denote the resulting factor by $B_c$. Thus it is the factor , with the scalar modification in Lemma 12. An input primary that belongs to a true bad-bond inventory is supplied once by its old covering label; every other selected input primary retains $upright(bold(1))_(r_e lt.eq t)$. Nonprimary edges already satisfy $r_e lt.eq t \/ 2$. These local inventory rules are exactly the original covering constraint.

#thm([Lemma 1.11.])[
  (Ambient core and tail estimates).  #emph[The core factor retains the reserve $e^(- c_L p^2 s_c)$ of , apart from the additional envelope 
#[#set math.equation(numbering: n => "(1.78)")
 $ exp {e_0 (M^D s_c + sum_(x in I_c) \| Z_x \|^2)} \, #h(2em) e_0 = C_L g "poly" \( M \, p \) . $ <eq:orig-7>]

 The bounds hold on every attached profile’s closed derivative support. On a selected unassigned row the exponent to be opened has, on its angular-cutoff support, the envelope 
#[#set math.equation(numbering: n => "(1.79)")
 $ C_L g "poly" \( M \, p \) (1 + sum_(x in I_i) \| Z_x \|^2) \, $ <eq:orig-8>]

 where $I_i$ is its Gaussian read set. Such a row is the sum of an ordinary letter supported where $max_(I_i) \| Z_x \| lt.eq 2 p$ and a tail letter requiring $max_(I_i) \| Z_x \| gt.eq p$. The former has ordinary majorant $C_L g "poly" \( M \, p \)$; the latter has an exceptional Gaussian reserve. Both assertions hold with every fixed required normalized derivative and a single marked discrepancy.]
] <lem:rg-reserves>

#proof[
  The charging proof following uses direct positive squares, failed-mask witnesses, output reserves, and the mean-error bound. These estimates are independent of the dimension of the sphere. Lemma 7 supplies its mean bound, and Corollary 8 supplies the stronger $C_L T_j^2$ bound when all relevant chords are at most $T_j$. The numerical-square comparisons are the ones in Lemma 12. Consequently the lower bound for the core energy, including its profile derivative supports, is unchanged except for Equation (1.77) summed over selected assigned rows. No direct square is charged twice.
  Now $v_x = T_x dot.op \( mu_x + g Z_x \)$, and $\| mu_x \| lt.eq C_L M^D t$. Multiplication of Equation (1.77) by $b = g^(- 2)$, with $t asymp g p$, bounds the added exponent by a fixed polynomial times $g \( 1 + sum \| Z_x \|^2 \)$. Row counts and local overlaps are polynomial in $M$ and independent of $s_c$ at a fixed site. Incorporating them into $e_0$ gives Equation (1.78), and the single-row version is Equation (1.79). The remaining core factors have the bounds in , including $e^(- c_L p^2 s_c)$.
  For an unassigned row insert smooth products of radial profiles in $Z$, equal to one through $p$ and zero beyond $2 p$. On the ordinary part the exponent and its fixed derivatives are $C_L g "poly" \( M \, p \)$. A derivative in a reference spin either preserves its small difference from the other references or replaces that difference by $t$ times a direction weight. Differentiating $v$ likewise inserts only a fixed polynomial on these supports. The tail part has the same exponential envelope as a core and forces a Gaussian coordinate of size at least $p$. Derivatives of its profiles have polynomial cost. This splitting changes no geometric statuses or row ownership.
  All extended chart factors agree with their physical values on the original sector; the global profile suppresses other preimages, and the protectors remain attached. Thus the estimate has not enlarged the integration by including an uncontrolled branch. The marked discrepancy assertion is proved below with the product comparison. ◻
]

For clarity, we specify the remaining factors to which the joint estimate will be applied. This is the eight-class preparation of , with the row split just described.

+ Selected unassigned row corrections and the smooth mean-defect row $cal(U)$ are opened with angular plateaus containing their full-sector values. Their ordinary order is $g$.
+ Unassigned stationary squares have order $g^2 "poly" \( M \, p \)$. Unassigned $cal(C)$ rows vanish; $cal(N) \, cal(Z)$ rows have exponentially accurate exceptional bounds, using the free null identity.
+ An old canonical polynomial or regular error is called remote when its entire projected graph is farther than $14 M$ from all seeds. There its graph mask is replaced by a smooth product equal to one through $t \/ 2$ and zero from $2 t$. The error is defined through $4 t$, so the resulting function is smooth. A nonremote term retains its actual mask and attached protectors and meets a core. Path estimates give ; old errors retain their actual norm caps. A common chart on an arbitrarily large graph is not used.
+ Kinetic truncation tails retain both paths and all mask reads. They have arbitrary-power accuracy with exponential path weights. Their input evaluations use the same smooth or protected prescription; output evaluations use the fixed-status convention.
+ Inverse and determinant chains are kept literally. A ratio exponent $Q_alpha$ has at most two Gaussian endpoints and satisfies $\| Q_alpha \| lt.eq e_alpha \( 1 + sum_(I_alpha) \| Z_x \|^2 \)$. Even the eighth roots of $e_alpha$ are summable with every fixed support exponent required here, by .
+ The spherical Jacobian is opened as a smoothly cut-off ratio $J \( u \) \/ J \( 0 \) - 1$. It starts quadratically and has order $g^2 "poly" \( M \, p \)$.
+ Remaining edge, observation and global-chart defaults are opened as one plus signed failures. In a remote observation default the mean is normalized only on the smooth branch bounded away from zero. Its failure and all its nonzero derivative supports force a large Gaussian coordinate, by Lemma 13. Projecting $xi$ to the tangent plane cannot invalidate that implication.
+ An old covering weight keeps its supremum envelope and its protectors. Its nonempty inventory meets a core. Its merely measurable physical-spin function is never differentiated.

The three-color Gaussian scalar powers, the corrected two-color leading determinant, the Haar constant and the observation denominator have already been extracted. There is no ordinary factor of order zero left unaccounted for.

#thm([Proposition 1.12.])[
  (Joint integration and comparison).  #emph[For every finite admissible selection $cal(A)$ of prepared factors in a fixed pattern, including the compulsory cores, there are nonnegative majorants $a_alpha$ such that 
$ lr(|D^r bb(E) product_(alpha in cal(A)) F_alpha|) lt.eq C_k (1 + sum_(alpha in cal(A)) s_alpha)^(d_k) product_(alpha in cal(A)) a_alpha \, #h(2em) r lt.eq k . $

 The expectation includes the Gaussian, frozen spins and tags. For nonempty output inventory this asserts only the undifferentiated and parameter-comparison estimates. A single marked discrepancy retains its size in this product bound. An ordinary primitive of order $r_0 > 0$ has summed majorant $C_L g^(r_0) "poly" \( M \, p \)$ with the prescribed support weights. Exceptional factors have arbitrary fixed power accuracy, and seeded connected sums retain an $e^(- p^(3 \/ 10))$ reserve after all decorations. Disjoint complete supports factor exactly.]
] <prop:rg-joint>

#proof[
  The unmodified factors have the concrete envelopes of . Their proofs use the prediction lemma, path bounds, and the graph $C^k$ domains just verified. Rotation fields realize tangent derivatives with uniformly smooth bounded coefficients. Projection derivatives outside a smaller plateau insert fixed Gaussian polynomials, already allowed by those estimates.
  Include the new tail-row failures in the simultaneous-failure bound . Distinct rows have polynomially many overlaps and each forces a coordinate at least $c_L p$. Their Gaussian rarity therefore has the same form as the previous failures. For a product of the extra envelopes in Equations (1.78) and (1.79), core components are disjoint and the number of row-tail reads at one coordinate is $O_L \( M^D \)$. The diagonal charge in the combined quadratic exponential has operator norm $C_L g "poly" \( M \, p \) = o_H \( 1 \)$. Its trace and constant terms cost at most $C_L e_0 M^(D')$ times the sum of core loads and tail-row counts. The determinant estimate , at any fixed larger moment exponent, thus applies. Increasing the fixed Hölder exponent if necessary, these costs are paid by the exceptional reserves. The summable endpoint charges of ratio letters and the deterministic ordinary envelopes give precisely .
  Complete supports include the windows determining $C_s$ and all status reads. Its finite range then gives zero covariance between Gaussian read sets whose complete supports are disjoint. The frozen Haar and tag measures are product measures. Hence applies to #emph[marginals]; it does not assert independence of conditional Gaussians on overlapping supports.
  It remains to justify derivatives of hard spin evaluations and the marked comparison. These are addressed in the next two paragraphs as part of the proof, because separate pointwise Taylor accuracy would not imply the asserted joint estimate.
  #emph[Transport at a hard read.] At fixed $T_x$ the map
  $ xi_x mapsto ("Exp"_(T_x) \( "proj"_(T_x^perp) xi_x \) \, T_x dot.op xi_x) $
  has inverse $"Log"_(T_x) q_x + T_x v_x$ on the protector chart times the entire real normal line. Its fixed chart derivatives have only polynomial growth in $\| v_x \|$. Holding $\( q_x \, v_x \)$ fixed while a parameter varies is achieved by the Gaussian transport
  $ W_x = g^(- 1) {partial \( "Log"_(T_x) q_x + T_x v_x \) - partial mu_x - \( partial g \) Z_x} . $
  Here $partial mu$ is evaluated at fixed frozen variables and tags; output spins may move only in the no-flag calculations. Extend this vector field by a smooth cutoff beyond the protector support but strictly inside the chart. It gives the transport and divergence bounds of , with the allowed powers of $g^(- 1)$ and fixed polynomials in $Z \, M \, p$ and directional distances. Different sites can use different charts simultaneously.
  For merely measurable input functions the same assertion follows by changing variables to $\( q_x \, v_x \)$ on the protected reads, with protectors attached, and differentiating while those arguments are fixed. This is the change-of-variables version of integration by parts. At every finite cutoff and for every finite product, the positive quadratic charges above remain strictly below the Gaussian quadratic decay. The chart changes have fixed margins; the unbounded normal coordinate changes orthogonally, with a scaling and shift. Differentiation under these integrals is therefore justified by Gaussian domination. Pullback to the common Gaussian marginal gives the same score estimates. The inverse covariance on any union of reads has norm $O_L \( 1 \)$ by ellipticity, so its density scores have fixed polynomial moment costs as in . No discontinuous predicate in a moving angle is tested.
  #emph[One parameter or history difference.] Fix the geometry, output data, tags and frozen arguments, enlarge supports to contain both endpoints, and use the same cutoffs. Interpolate $C_s$, $g$ and $mu$ linearly. Evaluate $xi \, u \, v \, q$ at these common interpolated arguments. Pure window data, determinant chains, Gaussian-ratio exponents and their recorded paths can use the linear interpolation of their endpoint formulas at common $Z$. For residual row and core exponents interpolate #emph[after] each endpoint construction: regard them as functions of common $\( xi \, V \)$ and fixed statuses, and interpolate those functions. No energy identity is assumed for a mixture of endpoint kernels.
  Both endpoint core budgets hold on these common physical/chart tests. Throughout the interpolation, $\| v \| \/ g$ is bounded by $max \| Z \|$ plus a fixed polynomial in $M \, p$. The first tangent prediction of the interpolated mean is the convex combination of the endpoint first tangents. Passing to its spin adds only $O_L \( M^D t^2 \)$ and arbitrarily accurate window errors. Thus the small-$Z$ contradiction that proves every failure implication still works, and the global chart failure uses the same bound on $mu$. All Hölder estimates therefore hold along the interpolation.
  Let $epsilon = epsilon.alt_h + \| lambda \| \/ H_j$. On aligned supports,
  $ \| mu_2 - mu_1 \| lt.eq C_L M^D t epsilon \, $
  with its normalized smooth derivatives. The corresponding stationary rows have the same discrepancy factor because their first tangent vanishes up to window accuracy. The projected affine maps have bounded cutoff extensions and exponentially summed windows, so these bounds remain valid with the polynomial hard-transport losses. In a row-square difference, the leading physical term $D_0 u$ cancels separately at each endpoint; its remainder difference has the same second-order small factors times $epsilon$. In $D_0 \( T v \) - T_i D v$, a reference difference, or its derivative, multiplies the kernel discrepancy; frozen normal columns are zero. The mean defect in $cal(U)$ is already quadratic, and its full-kernel cancellation holds separately at the two endpoints. Kernel-tail differences retain their exponential factor.
  Consequently an ordinary letter’s parameter derivative is bounded by its majorant times $epsilon$, with fixed polynomial losses in $p \, M \, 1 + s_(upright("tot"))$ and fixed Gaussian polynomials. A normalized direction supplies $t$ times its spatial weight; the $t^(- 1)$ cost of an angular cutoff is paired with that factor or with the mean/window discrepancy. Unbounded tail letters retain the same discrepancy in the exceptional envelope and polynomial scores. Hard uses retain it by the displayed inverse transport, attached profiles and endpoint exponents evaluated at common physical arguments. An input-list difference, handled separately by zero padding if needed, keeps its supremum difference at a measurable read.
  Only a fixed number of scores or derivative slots occur. At fixed Hölder order their Gaussian moments grow polynomially in the number of reads, hence in $M$ and the total load, even when reads overlap. This proves the marked discrepancy estimate with $k - 1$ additional derivatives on a regular output. A derivative placed on a changed regular input uses at most $k - 1$ of that difference; a map change acting on an unchanged input uses at most its $k$ derivatives. Ordinary derivative costs have remained of ordinary order. The larger hard-transport costs are paid only by exceptional reserves.
  Finally row shifts, chart reads, field rank and the new profile types have bounded stencil complexity and polynomial overlap. Count and site-hit bounds therefore use the same loads, with enlarged fixed polynomial exponents. Their spare support exponents absorb the load polynomial in the displayed product estimate. The order and seeded bounds now follow from the same summations as ; this completes the proof, including the discrepancy part of Lemma 14. ◻
]

The hypotheses of the exact connected reassembly are now available: joint products, site-hit bounds, the tree smallness condition, and complete support and inventory rules. Its Mayer expansion is used only for the background without mandatory output flags. Components with flags retain their complete covering weights. We obtain , with the exact mask-strengthening corrections described there. For countable factor lists, first perform the algebra on finite selections; the volume-exponential absolute majorant from the joint and tree bounds permits passage to the full expression, including its derivatives. Positivity of a truncated signed gas is not needed. Thus the output representation accounts for all mandatory covers, not only the sector with no seeds.

===== 1.4.5 Canonical extraction and its diagonal contraction <subsec:rg-canonical>

The connected representation just obtained is exact. We next separate its finite-order Taylor polynomial from a smaller regular remainder. The coefficient calculation uses full bulk kernels and aligned charts, so it is independent of periods, masks and chart cutoffs.

In the empty pattern let $R = \( X - nu \, Y - w \)$ with $\( nu \, w \) = cal(M) X'$ and full kernels. The mean-normalization defect is

$ U_E = X'_E dot.op #scale(x: 120%, y: 120%)[\[] cal(M)^(*) \( 0 \, sqrt(a) \( m - m \/ \| m \| \) \) #scale(x: 120%, y: 120%)[\]]_E . $

Let $R^(upright("aff"))$ be the affine row constructed above with full kernels, $mu_f$ its completed mean, and $R_(upright("stat")) = D_f mu_f + F_f$. The negative-log vertices are

$ b / 2 #scale(x: 120%, y: 120%)[\(] \| R_i \|^2 + \| D_i v \|^2 - \| R_i^(upright("aff")) \|^2 #scale(x: 120%, y: 120%)[\)] \, quad b U_E \, quad b / 2 \| R_(upright("stat") \, i) \|^2 \, quad upright("the old canonical slots") \, quad - log frac(J \( u_x \), J \( 0 \)) \, $

with the normalized scalar determinant understood. This is with the physical and added scalar squares paired before their affine subtraction. Substitute $xi = mu_f + g Z$. Assign order $g$ to a relative output tangent and to $g Z$, and retain total order at most four in the negative logarithm of the Gaussian expectation, understood here as its formal connected series at the constant term one. Equivalently, for each ordered multiset of at most four vertices, use its connected Wick expectation with coefficient $\( - 1 \)^(v + 1) \/ v !$; internal as well as intervertex pairs are included.

An anchor is removed by a simultaneous orthogonal transformation. A smooth local choice of that transformation exists on each fixed small chart, for example the rotation from its fixed center. The resulting tensors are equivariant and do not depend on that local choice. At first tangent, the sum of the physical and added scalar squares agrees with the affine square. Harmonic completion gives zero first tangent for the stationary residual. Hence the row correction begins with a cubic containing a fluctuation. The possible cubic of $U$ pairs a normal quadratic defect with a tangent first-order row and is zero. Connected contractions require the same number of pairs as in ; the ambient Gaussian has three colors and at most four vertices contribute through order four. Odd output invariants vanish by $O \( 2 \)$ symmetry. The kinetic Taylor slots have even parity and unit affine Hessian.

For precision, write the retained polynomial as $sum_(r \, d) g^(- 2 d) F_(r \, d) \( y \)$, where $F_(r \, d)$ is homogeneous of field degree $r + 2 d$ and $r lt.eq 4$. Scalar terms are extracted per unit volume. Let $S_(K' \, o)^(\[ n \])$ denote the homogeneous degree-$n$ part of the unmasked output kinetic density, assigned to its anchor by splitting edge and row terms between their endpoints. The triangular prescription is

$ P'_4 & = F_(2 \, 1) \, & alpha & = upright("affine Hessian of ") F_(2 \, 0) \, & I'_2 & = "Comp" #scale(x: 120%, y: 120%)[\(] F_(2 \, 0) - alpha S_(K')^(\[ 2 \]) #scale(x: 120%, y: 120%)[\)] \,\
P'_5 & = 0 \, & I'_3 & = 0 \,\
P'_6 & = F_(4 \, 1) \, & I'_4 & = F_(4 \, 0) - alpha P'_4 - alpha S_(K')^(\[ 4 \]) \, & kappa & = upright("affine Hessian of ") F_(4 \, - 1) \,\
J'_2 & = "Comp" #scale(x: 120%, y: 120%)[\(] F_(4 \, - 1) - kappa S_(K')^(\[ 2 \]) #scale(x: 120%, y: 120%)[\)] . $

Here the affine Hessian is the bulk sum per anchor, and $"Comp"$ is the quadratic packet compensation of Section 2. Once the total affine coefficient is removed, the individual compensation coefficients sum to zero, so this operation preserves the polynomial. These are the formulas with the odd slots set to zero. They define a map $upright(bold(P))' = cal(C)_h \( upright(bold(P)) \)$ that depends only on the free history and the incoming canonical coefficients. After the displayed powers of $g$ have been sorted, neither this map nor its kicks depend on the precise coupling, cutoffs, regular error, covering gas, or period. In the exact output representation we assign the canonical slots to this finite coefficient operation; its difference from the actual integral is retained in the error and gas, with the further affine correction included in $Delta$. Thus a run initialized with $upright(bold(P)) = 0$ has exactly the deterministic canonical orbit of these maps, while its precise coupling obeys Equation (1.75). This is the distinction used in the shooting argument.

Coefficient sums are absolutely convergent in the single fixed coefficient norm. The inputs to the summability proof in and are exponential free localization with its fixed moments, finite-degree tensor contractions and old exponential path norms. Our chart and projection vertices have exactly these properties. In an off-diagonal contraction, an old path may be rescaled by the step size and joined by free-kernel paths. Only a fixed number of paths occurs per vertex at this order; their polynomial weights are paid by the old spare exponential or by kernel moments. Choose the coefficient exponent $sigma$ small for this finite set of moments before choosing $L$. These estimates give the asserted $C_L$ bounds and their history and coupling Lipschitz versions. Folding and affine compensation use this same norm, not a succession of norms with smaller exponential exponents.

#thm([Lemma 1.13.])[
  (Dimension-two coefficient contraction).  #emph[For the diagonal response of each nonzero canonical slot, the coefficient norm of the output is at most $C L^(- 2)$ times the input norm, where $C$ is independent of $L$ and the history before the block size is chosen. The corresponding quadratic transfer has zero affine Hessian. The same conclusion holds for an inclined step in its rotated physical coordinates.]
] <lem:rg-canonical-contraction>

#proof[
  For degree $n gt.eq 4$, gives $C L^(2 - n)$ and hence the stated bound. Only the compensated quadratic slots require an improvement.
  At an old anchor $o$, expand the conditional-mean row in a displacement $r$ through spatial degree two:
  $ P \( o + r \, dot.op \) - P \( o \, dot.op \) = A_o \( r \) + B_o \( r \, r \) + E_o \( r \) . $
  Here $A_o$ is homogeneous linear and $B_o$ homogeneous quadratic in $r$. In the exponentially weighted row norm of , their coefficients have bounds $C \/ L \, C \/ L^2$, and
  $ ∥E_o \( r \)∥ lt.eq C \( 1 + \| r \| \)^3 L^(- 3) e^(C sigma \( 1 + \| r \| \/ L \)) . $
  One obtains this formula by a forward Newton polynomial of degree two, then telescoping its remainder along shortest paths. The linear coefficient includes the second-difference adjustment from rewriting that Newton polynomial in homogeneous powers. Telescoping the second and then first differences uses only the third fine differences supplied by the free estimate. Thus no continuous extension of the lattice kernel has been assumed.
  Insert the expansion into a compensated inversion-invariant quadratic packet. The two-linear-row terms cancel as coefficient arrays by its zero affine Hessian. For quarter turns, this uses the symmetric quadratic polarization fixed above. The linear–quadratic terms are odd under $r \, s mapsto - r \, - s$ and cancel by the packet’s spatial inversion. Every remaining term has bound $C L^(- 4)$ times a fixed polynomial in the path length, with its rescaled exponential weight. The spare old exponential pays that polynomial exactly as in . Output compensation costs a fixed multiplier. Summing the $L^2$ old anchors over one new anchor leaves $C L^(- 2)$.
  The constant and affine identities for $P$ show that an affine output tangent transfers to an affine input tangent of slope divided by the step size. Each old compensated packet is zero on that field. The aggregate transferred affine Hessian is therefore exactly zero. Inclined coordinates merely rotate and rescale this argument; the same row estimates hold in their physical units. ◻
]

The canonical calculation has now identified the coefficients and controlled their own variation. The remaining obstruction to Theorem 11 is an old regular error appearing once, without another small factor. Its contraction is the subject of the next subsection.

===== 1.4.6 Contraction of the regular error <subsec:rg-error>

In the empty primary pattern, the isolated response of an old error is the operator

$ cal(T) f_X \( V \) = bb(E)_(C_s) thin \[ chi_X \( q \) f_X \( q \) \] \, #h(2em) q_x = "Exp"_(T_x) #scale(x: 120%, y: 120%)[\(] "proj"_(T_x^perp) \( mu_x + g Z_x \) #scale(x: 120%, y: 120%)[\)] . $

Here $chi_X$ is the prepared smooth graph cutoff, and the output anchor is the projection of the old anchor. This is for the intrinsic spin prescription. For load $s_X lt.eq L^(1 \/ 4)$ its output graph is enlarged to a complete available good-output ball and all required stencils; the exact covering correction is retained. After projection the radius is a fixed multiple of $M'$. The entire orbit packet is kept together.

#thm([Lemma 1.14.])[
  (Contraction after removal of the affine Hessian).  #emph[For every fixed required output support exponent chosen before $L$, 
#[#set math.equation(numbering: n => "(1.80)")
 $ ∥cal(T) f∥_(k \, j - 1 \, B) lt.eq #scale(x: 120%, y: 120%)[\(] C \/ L^2 + o_H \( 1 \) #scale(x: 120%, y: 120%)[\)] ∥f∥_(k \, j \, A) . $ <eq:orig-9>]

 The little-oh may depend on $L$ and is uniform for $H_j gt.eq H$. The same bound holds for an input difference through order $k - 1$. A map change acting on an unchanged input satisfies the original map-difference estimate of , with its polynomial losses and one extra derivative on that input.]
] <lem:rg-error-contraction>

#proof[
  Use an even smooth Gaussian guard on all coordinate reads, $max_x \| Z_x \| lt.eq c_L p$, with a transition strictly inside the required plateaus. The normal component is included. The prediction lemma, with output graph chords allowed through $4 t'$, puts the unperturbed fine chords strictly inside the graph cutoff plateau for $L$ large. Choose $c_L$ small enough that the same holds with the guarded fluctuation, and on the Taylor segments below. The guard complement has an exponentially small cost times fixed polynomials in $M$ and the load, by the Gaussian union tail and the joint derivative estimate. These statements apply on arbitrary graphs, not only within a single chart.
  First suppose $s_X lt.eq L^(1 \/ 4)$. For output derivatives of order at most three, omit the guarded fluctuation by Taylor expansion twice in it. Its first term integrates to zero because the guard and the Gaussian law are even. The argument of then gives
  $ C_L M^D \( 1 + s_X \)^D p^(- 2) \[ f_X \]_(k \, j) . $
  It requires at most five old derivatives. The same argument applies to the tangent projection in the present spin formula. Choosing $P_0$ after the fixed $M$ powers makes this a delayed small factor.
  Remove the old anchor by a simultaneous orthogonal transformation and use geodesic relative coordinates for the unperturbed spins. The leading first tangent is the conditional-mean prediction. Expand it, as above, in $x - o$ into a homogeneous linear spatial polynomial, a homogeneous quadratic spatial polynomial, and a remainder. In the old normalized direction norm, with its low output jets, their bounds are respectively
  #[#set math.equation(numbering: n => "(1.81)")
   $ C \/ L \, #h(2em) C \/ L^2 \, #h(2em) C \/ L^3 + o_H \( 1 \) . $ <eq:orig-10>]
  Nonlinear chart terms and window truncation belong to the final remainder.
  Here is the weighted-norm verification of this assertion. If $\| x - o \| lt.eq L$, coarse exponential row moments sum both the output chord variation and the output test-direction weights. Fine differences through order three give the stated powers of $L$ with uniform leading constants. If $\| x - o \| > L$, an output direction weight based at $\[ x \]$ is bounded in the row sum by $C \( 1 + \| x - o \| \/ L \)^8$. Dividing by the old weight $\( 1 + \| x - o \| \)^8$ gives $O \( L^(- 8) \)$; the polynomial predictions based at $o$ obey the remainder estimate with this same division. Chord coordinates have at most linear growth from the anchor in the ball, so their values satisfy the same argument. Nonlinear terms in each fixed jet have an extra $t$ with at worst $C_L M^D$ cost. Paths outside the supplied stencils have exponentially small weighted sums. The ball lies in a common chart because its output radius is $O \( M \)$ and $M^D t arrow.r 0$.
  For completeness, the chain rules can be interpreted entirely in the norms already defined. First tangent directions at a spin are tested in great-circle coordinates, with rotation axes perpendicular to that spin. Their symmetric jets are covered by the rotation-derivative norm. To differentiate a different chart or a composition, use normal coordinates at the point of evaluation and the usual chain rule. Chart changes on these fixed small charts have bounded fixed derivatives. Products of direction weights can occur in one input slot, including for an unrestricted output rotation axis. After one slot’s weight is divided out, each additional direction factor is bounded by a power of
  $ t #scale(x: 120%, y: 120%)[\(] 1 + C frak(m)_j \( 1 + s_X \) #scale(x: 120%, y: 120%)[\)]^8 . $
  On bounded loads this tends to zero with $H$. At arbitrary load it has only a fixed polynomial load cost, and each additional mesoscopic power accompanies an extra $t$. Also $t' \/ t$ is uniformly bounded. Thus the higher map jets asserted to be $o_H \( 1 \)$ have that meaning in the actual graph norm; no uniform bound on all test directions on arbitrarily large graphs has been assumed.
  Expand the invariant error at alignment. Its constant and first terms vanish, and its affine Hessian is zero. Tangent inversion in the anchor stabilizer makes its cubic term zero. In the quadratic term, the two linear spatial predictions vanish by affine normalization, and the linear–quadratic predictions cancel under position inversion of the packet. Equation (1.81) then gives $C L^(- 4) + o_H \( 1 \)$ for every surviving quadratic term. The quartic Taylor remainder has the same gain. For the derivatives through order three, Taylor-expand the required derivative with the corresponding reduction of order; fourth and, where needed, higher available old derivatives suffice. The Taylor segments stay in the old graph domain: anchor alignment is an isometry and small-log interpolation distorts chords by a bounded factor tending to one. The guard leaves a strict margin to the domain boundary.
  For output orders four through $k$, retain the fluctuation and apply the chain rule directly. Each first derivative of the relative map costs $C \/ L + o_H \( 1 \)$; differentiating a moving tangent projection of the fluctuation has an extra $t$. Every higher map derivative is $o_H \( 1 \)$ in the same norm. A chain-rule term either has at least four first-map derivatives or has a higher derivative. It therefore again gains $C L^(- 4) + o_H \( 1 \)$, without requiring an old derivative above the requested order. Summing $L^2$ old anchors and the fixed output support price proves Equation (1.80) on these short labels.
  If $s_X > L^(1 \/ 4)$, use the direct composition estimate at the end of . On the guard, its absolute first jet is the bounded row of $P_h$, with no bare leading $M$ loss. Higher jets, including moving tangent projections, have extra $t$ and fixed polynomials in $M \, 1 + s_X$. This statement is local at each halo and does not require a chart for the whole graph. Direction-anchor translations have polynomial load cost; for lifted torus paths the physical distance obeys the same scaled upper bound. The spare old support exponential gives $e^(- c L^(1 \/ 4))$, paying the anchor sum and, if desired, $L^(- 4)$ before it. The guard-complement estimate has a bare $M$ power only together with exponential accuracy. This proves the estimate also for long and winding labels.
  An input difference uses the identical proof in order $k - 1$. For a changed map, the verified composition and window estimates act on one additional derivative of the unchanged input, at most $k$. Thus no derivative is lost from one iteration to the next. All arguments retain the graph masks; the strengthened orbit masks and short-load balls are accompanied by their exact covering corrections. ◻
]

===== 1.4.7 Taylor comparison, normalization and closure <subsec:rg-closure>

We now compare the exact connected expression with the canonical polynomial and close the retained class. The comparison is an estimate on the actual integrals; it is not an assumption that a formal coefficient computation describes them.

An ordinary primitive of order $r > 0$ has the majorant established in Proposition 15. Inflate it by $g^(- .96 r)$ in the tree condition . The remaining $g^(.04 r)$ beats every fixed logarithmic loss, including the $M^2$ site-hit cost. Thus connected terms of total order at least five retain $g^4.8$; a smaller exponent pays the finite derivative and logarithmic costs. Old errors count as order four with their stronger actual cap, so only their isolated response needs Lemma 17. All other such terms have order at least five. The resulting remainder and discrepancy bounds are , namely $C_L g^4.6$ and $C_L g^4.5$ times the normalized discrepancy. Exceptional terms, including the new normal-coordinate tail letters, and canonical paths beyond the mesoscopic cutoff have arbitrary-power accuracy.

For the terms through order four, group their at most four origins at one anchor and strengthen their masks to a common good-output ball containing all reads. Choose its fixed radius multiplier and then $L$ large: the old canonical balls shrink by $L$, whereas the fixed number of new stencils requires only fixed multiples of $M$. Off-mask terms are retained in the gas. On this ball and the even Gaussian guard, prepared factors have their smooth vacuum formulas. For factors negligible at this accuracy, such as tail letters, that coincidence is not needed. Choose angular cutoffs with a large enough fixed $C_L$ for these plateaus. The old graph-edge cutoff through $t \/ 2$ uses the fine-edge prediction, first choosing $L$ large and then the Gaussian guard constant small.

In these local charts $u \, v$ and output coordinates $w_0$ have size $g "poly" \( M \, p \)$. Every row formula is a composition of bounded multilinear kernel maps, finitely many uniformly smooth pointwise functions and their truncated windows; its positional summations have fixed polynomial weights. Taylor expansion in $w_0 \, g Z$ through field degree six for a vertex with prefactor $g^(- 2)$ leaves at least seven small fields. It therefore costs $C_L g^5 "poly" \( M \, p \)$. Vertices with other prefactors are expanded to the corresponding degree. A normalized output derivative supplies its factor $t$ and spatial weight. Taylor expansion with its degree reduced by the number of derivatives, or a direct smooth bound once those factors are already supplied, retains the same $g^5$ estimate through every required order.

The quadratic and harmonic cancellations were established above. Every expanded exponent starts at its indicated positive order on the guard, so exponentials minus one and Jacobian logarithms have the same Taylor control. Truncated first-jet errors retain their exponential factor. The same proof with one marked discrepancy uses the kernel differences and Proposition 15. Removing the guard, restoring full Gaussian polynomial moments, and replacing short kernels and covariance by full ones have arbitrary-power accuracy with every fixed positional moment. Any connection created only by that replacement contains a long kernel path and has the same price.

On a fixed origin multiset, the finite product and Mayer-log identities are identities of these finite polynomials. They give exactly the connected Wick prescription above, including repeated origins and the Jacobian logarithm, as in the proof following . This proves the exact Taylor comparison and yields with $q_1 = C \/ L^2 + o_H \( 1 \)$.

It remains to return the raw error’s constant and affine-Hessian components to the bulk scalar and kinetic coefficient. Put $b^(-) = b + alpha + kappa \/ b$, and let $R_(upright("raw"))$ denote the raw regular norm after the canonical prefactors have been expressed using $b^(-)$. The preceding estimates give

$ R_(upright("raw")) lt.eq q_1 delta_j + C_L g^4.6 \, #h(2em) q_1 = C \/ L^2 + o_H \( 1 \) . $

For a nonwinding raw label $f_i$ at $o$, fix $n in S^2$ and set $v_i = f_i \( \( n \)_x \)$, its value on the constant spin configuration. This value is independent of $n$ by $O \( 3 \)$ invariance. Let $b_i$ be its unit-affine Hessian at that configuration. The graph norm gives

$ \| v_i \| lt.eq \[ f_i \]_(k \, j - 1) \, #h(2em) \| b_i \| lt.eq C \( t' \)^(- 2) \[ f_i \]_(k \, j - 1) . $

There is no support-size loss: a unit affine direction at displacement $r$ is bounded by the permitted polynomial direction weight. With the exact off-mask correction retained, subtract $v_i + b_i S_o$ as in . The normalized function has zero value and affine Hessian and costs only a fixed multiplier in norm. Summing the bulk coefficients gives

$ Delta = sum_i b_i \, #h(2em) \| Delta \| lt.eq C \( t' \)^(- 2) R_(upright("raw")) \, #h(2em) b' = b^(-) + Delta . $

The corresponding kinetic correction is $- Delta \( cal(E)' - sum_o S_o \)$. Allocate $S_o$ to the kinetic paths in proportion to their affine Hessians, whose sum is one. Each resulting path expression has zero affine Hessian on its mask, and gives total regular norm $C \( t' \)^2 \| Delta \| lt.eq C R_(upright("raw"))$. The constant is fixed before $L$, using uniform free-row moments and the fixed derivative order. Active $ell$ rows obey their masked bounds; inactive rows retain their specified convention. Mask complements are covering corrections with the same site-hit estimates.

The last coupling change does not alter the assigned canonical coefficient lists. Indeed, retaining their masks, the negative-log correction for their changed displayed prefactors is exactly

$ - Delta P'_4 - Delta P'_6 + #scale(x: 120%, y: 120%)[\(] \( b^(-) \)^(- 1) - \( b' \)^(- 1) #scale(x: 120%, y: 120%)[\)] J'_2 . $

Here each polynomial denotes its summed masked list; $I'_2 \, I'_4$ have no coupling prefactor. Conversion of the fixed coefficient norm to $parallel dot.op parallel_(upright("graph")) := parallel dot.op parallel_(k \, j - 1 \, A)$ on these regular lists, using its spare path exponential, gives

$ parallel P'_4 parallel_(upright("graph")) lt.eq C_L \( t' \)^4 "poly" \( M' \) \, quad parallel P'_6 parallel_(upright("graph")) lt.eq C_L \( t' \)^6 "poly" \( M' \) \, quad parallel J'_2 parallel_(upright("graph")) lt.eq C_L \( t' \)^2 "poly" \( M' \) . $

These bounds hold through order $k$ on the respective graph domains; path-length and direction-weight powers are summed with the coefficient exponential. Since $b^(-) \, b'$ are comparable to $H_j$, the combined correction has norm at most

$ C_L R_(upright("raw")) "poly" \( M' \) #scale(x: 120%, y: 120%)[\(] \( t' \)^2 + \( t' \)^4 + H_j^(- 2) #scale(x: 120%, y: 120%)[\)] = o_H \( 1 \) R_(upright("raw")) . $

It already has zero value and affine Hessian: $P'_4 \, P'_6$ have degree at least four at alignment, and $J'_2$ is compensated. Thus it can be retained directly as a regular error on the same masks, without a further coupling extraction or a change of canonical coordinates. The marked versions of these products give the same discrepancy estimates, using $\| b_1^(- 1) - b_2^(- 1) \| lt.eq C \| b_1 - b_2 \| H_j^(- 2)$ for comparable couplings. This proves quantitatively that the exact coefficient lists follow $cal(C)_h$ while the remaining feedback enters $Delta$ and the renewed errors.

Consequently holds with the improved $q_1$, and affine extraction gives Equation (1.75).

We give the period argument explicitly because asymmetrical tori are needed later. All orbit regroupings use fixed graph enlargements. A short complete calculation is the corresponding bulk calculation with its finitely many lifted spin positions refolded. Its symmetry is the symmetry of those labels, not a symmetry assertion about the folded spin configuration. If a fixed enlargement crosses the shortest-period threshold, declare the result winding before the orbit manipulation. The spare support exponent pays its winding record, and the lower load retained in graph projection preserves any winding price already present. Fold the bulk coefficients and subtractions with their off-mask corrections. Missing bulk constants or affine corrections on a given period are subtracted with exactly the winding charges of their long derivations. Actual winding terms need no bulk constant or Hessian normalization. Thus the scalar and coupling increments are independent of period shape, while all period disagreements retain their stated price. This is the mechanism of , with shortest-period length replacing a square side.

Finally choose the constants. All support enlargements, derivative orders and polynomial exponents above are fixed before the scale choices. Take $L$ sufficiently large that the fixed multipliers of $L^(- 2)$, including error reset and support dilation, leave a strict margin below $L^(- 2 + upsilon)$. Choose successive canonical caps and triangular comparison weights using Lemma 16. Apply the raw-error discrepancy and the stronger-than-cap gas discrepancy with their relative normalizations; error and gas comparison weights may be reduced if needed. The input coupling parameter in the cited comparison estimates is $O_L \( \| lambda \| \/ H_j \)$. In the normalized regular error it incurs only powers of $log H_j$; affine extraction multiplies the raw cap by $\( t' \)^(- 2)$, a bounded factor after the cap is inserted. The high-order and gas discrepancy reserves pay the remaining powers. These statements give Equation (1.76).

As in , choose $P_0$ next, larger than all the fixed logarithmic requirements, and then $H$. Any strictly positive power of $g$ in Equations (1.78) and (1.79), and in the other estimates above, beats the now fixed logarithmic powers at this last choice. The little-oh terms are uniform for $H_j gt.eq H$. This completes the proof of Theorem 11.

==== 1.5 Prescribing the terminal coupling <sec:shooting>

The exact transformation of Section 4 allows the number of blocking steps to vary. We now choose the microscopic coupling so that every trajectory ends at the same coupling $H$. This gives a common physical normalization and permits comparison of different ultraviolet cutoffs. The first task is to identify the limiting kinetic increment; the second is a two-endpoint estimate, using the fixed terminal coupling at one end and contraction of the remaining data at the other.

===== 1.5.1 Initialization and the kinetic increment <initialization-and-the-kinetic-increment>

At history zero the unmasked quadratic energy is exactly the nearest-neighbor energy. We initialize all canonical coefficients and regular errors at zero. The covering representation is obtained as in : join true bad bonds together with the witnesses for all deleted mask rows, and assign each resulting component the exponential of minus its energy difference. The difference between the original energy and the clipped energy is nonnegative. Each true bad bond contributes at least $c p_j^2$, while every remaining deleted row is a positive square. The direct-energy reserve therefore pays for the connected support count and gives the covering cap. The initial bulk scalar includes the constant converting the chord-square action into the nearest-neighbor Gibbs weight. This construction uses only chord bounds and positive squares, and hence applies to $S^2$.

Let $cal(C)_h$ be the canonical coefficient map constructed in Section 4.5, where $h$ counts completed blocking steps. Define its orbit by

$ upright(bold(P))^(\( 0 \)) = 0 \, #h(2em) upright(bold(P))^(\( h + 1 \)) = cal(C)_h \( upright(bold(P))^(\( h \)) \) \, $

and denote the two kinetic increments evaluated on this orbit by $alpha_h$ and $kappa_h$. The map $cal(C)_h$ is the finite formal coefficient operation, independent of the precise coupling, regular errors and covering gas. The exact output representation assigns its canonical slots to this operation; the discrepancy from the actual integral remains in the error and gas, with its additional affine correction assigned to $Delta$. Thus the canonical slots of an exact trajectory initialized above follow precisely this orbit. Its actual coupling recursion is

#[#set math.equation(numbering: n => "(1.82)")
 $ b_(j - 1) = b_j + alpha_(N - j) + kappa_(N - j) \/ b_j + Delta_j \, #h(2em) \| Delta_j \| lt.eq C_L H_j^(- 1.05) \, $ <eq:shooting-actual-flow>]

which is Equation (1.75) along that trajectory. The triangular coefficient contraction and the free-history estimates imply exponential convergence of both increment sequences. The same limits are obtained if the first step is inclined: after that step the regular transformations are the same, and their histories converge by the second comparison in Section 3. Denote the limits by $alpha_oo$ and $kappa_oo$.

#thm([Lemma 1.15.])[
  (Limiting kinetic increment).  #emph[For the nearest-neighbor action and the normalized observations used here, 
#[#set math.equation(numbering: n => "(1.83)")
 $ alpha_oo = - gamma \, #h(2em) gamma = frac(log L, 2 pi) . $ <eq:orig-11>]

]
] <lem:kinetic-increment>

#proof[
  We compare a fixed finite-volume Laplace coefficient before and after blocking. Only the first coefficient is needed, so the second limiting increment need not be evaluated.
  For spins on $S^D$, let $A_D \( n \)$ be the coefficient of $b^(- 1)$ in $log Z_b \( n \, n \)$, with $n$ fixed during the expansion. The calculation , which is stated for general tangent dimension $D$, gives
  #[#set math.equation(numbering: n => "(1.84)")
   $ 4 A_D \( n \) - A_D \( 2 n \) = - frac(3 D \( D - 1 \), 4 pi) log n + O \( 1 \) . $ <eq:shooting-bare-coefficient>]
  Its action normalization is exactly the nearest-neighbor normalization of the present model.
  Fix a sufficiently large terminal side $m$, put $n = m L^s$, and set
  $ B_h = sum_(r < h) alpha_r \, #h(2em) C_h = sum_(r < h) kappa_r \, #h(2em) hat(b)_h = b + B_h + C_h \/ b . $
  Insert $s$ regular normalized observations with these formal parameters on the tori of sides $n$ and $2 n$. For fixed $s$ they are positive when $b$ is sufficiently large. Pin one spin on the final layer. Transitivity of the target sphere identifies this with integration over the global orientation, up to a coupling-independent constant. For each fixed $s$ the remaining integration is finite-dimensional. The aligned saddle has a positive transverse quadratic form. Outside an aligned neighborhood the action has a strictly positive excess: small microscopic nearest-neighbor energy forces alignment, and small observation energy propagates that alignment through the successive layers. In this neighborhood all means lie in the normalized-mean branch, so the discontinuous fallback branch introduces no saddle contribution.
  Successive Gaussian completion therefore computes genuine Laplace coefficients. The computations are precisely the canonical vertex calculations of Section 4, with cutoffs removed on their plateaus. The auxiliary normal scalar is integrated with its normalizing determinant, so each Gaussian pinning factor counts $D$ physical tangent components. Thus the remaining pinning power in the doubling difference has coefficient $D_0 = 3 D \/ 2$.
  For completeness, the uniformity in $s$ needed here is uniformity of coefficients, not of a bare Laplace remainder. At an output period $macron(m)$, a finite-period coefficient differs from its folded bulk coefficient only when a complete contraction crosses a period. The analytic kernel and Wick-coefficient bounds give an exponentially small error in $macron(m)$, with fixed polynomial position factors. Propagation through one subsequent coefficient calculation costs at most $C_L$: only finitely many orders occur, and their position sums are absolutely convergent. The earlier periods are $m L^r$, and
  $ sum_(r gt.eq 0) C_L^(r + 1) \( 1 + r + m L^r \)^C e^(- c m L^r) < oo . $
  This is the uniform coefficient estimate in the proof of . It applies here because the projected chart vertices have the same exponential kernel and finite-contraction bounds, the canonical slots and increments are bounded, and the last pinned free operator is uniformly elliptic on the fixed periods.
  All extracted bulk scalars cancel in the doubling difference. The remaining Gaussian power is $D_0 log hat(b)_s$, whose coefficient of $b^(- 1)$ is $D_0 B_s$. The bounded final coefficients and the preceding winding errors consequently give
  $ 4 A_D \( m L^s \) - A_D \( 2 m L^s \) = D_0 sum_(h < s) alpha_h + O_(L \, m) \( 1 \) . $
  Set $D = 2$ and compare with Equation (1.84). Division by $s$ and exponential convergence of $alpha_h$ give $alpha_oo = - log L \/ \( 2 pi \)$. ◻
]

===== 1.5.2 Shooting to a fixed terminal value <shooting-to-a-fixed-terminal-value>

The remaining layers are indexed by $j = N \, N - 1 \, dots.h \, 0$, so that $b_N$ is microscopic and $b_0$ is terminal. Put

$ c_log = - kappa_oo / gamma \, #h(2em) theta.alt_j = H_j + c_log log \( H_j \/ H \) . $

The reference sequence satisfies

#[#set math.equation(numbering: n => "(1.85)")
 $ theta.alt_j - theta.alt_(j - 1) = gamma - kappa_oo / H_j + O_L \( H_j^(- 2) \) . $ <eq:shooting-reference>]

#thm([Proposition 1.16.])[
  (Admitted trajectories with prescribed endpoint).  #emph[After the choices of $L$ and $P_0$, take $H$ sufficiently large. For every integer $N gt.eq 1$ there is a microscopic coupling $beta_N > 0$ whose $N$ regular transformations remain strictly inside the bands $\[ H_j \/ 2 \, 2 H_j \]$ and end at $b_0 = H$. Every such choice satisfies 
#[#set math.equation(numbering: n => "(1.86)")
 $ beta_N = H + gamma N + O_(L \, H) \( log \( 2 + N \) \) . $ <eq:orig-12>]

 Along these trajectories, 
#[#set math.equation(numbering: n => "(1.87)")
 $ b_j = theta.alt_j + O_L \( 1 \) \, #h(2em) 0 lt.eq j lt.eq N \, $ <eq:orig-13>]

 uniformly in $N$, with constants bounded as $H$ is increased. The trajectories starting at the same $beta_N$ with either inclined first step are also strictly admitted and satisfy Equation (1.87). Their terminal couplings agree with one another, although they need not equal $H$.]
] <prop:shooting>

#proof[
  We give the shooting argument to specify the continuity and uniformity being used from . The exact map is continuous in the precise input coupling on every finite strictly admitted segment. For the initial covering representation this follows because its geometric predicates use the fixed reference thresholds; for each subsequent step it follows from the uniform product and integration bounds in Section 4.
  On an admitted segment from layer $k$ to layer $j < k$, summing Equation (1.75), the bounded second increments, and the exponentially summable errors in $alpha_h + gamma$ gives
  #[#set math.equation(numbering: n => "(1.88)")
   $ \| \( b_j - H_j \) - \( b_k - H_k \) \| lt.eq C_L + C_L \( k - j \) \/ H . $ <eq:shooting-barrier>]
  Vary the initial coupling in $\[ .6 H_N \, 1.4 H_N \]$. Call it high if a strictly admitted initial segment reaches $b_k > 1.25 H_k$, or if a full strictly admitted trajectory ends above $H$. Define low with $b_k < .75 H_k$ or a terminal value below $H$. These are nonempty open subsets of the initial interval: continuity gives openness, and the two endpoints give nonemptiness.
  They are disjoint. An upper and lower mark at layers $j \, k$ force a change at least $\( H_j + H_k \) \/ 4$ in the quantity $b - H_dot.op$. An upper mark at layer $k$ and a terminal value at most $H$ force a change at least $H_k \/ 4$; the corresponding lower-mark statement is identical. These changes contradict Equation (1.88) for large $H$, because $H_k - H_j = gamma \( k - j \)$. Connectedness of the initial interval therefore supplies an initial value in neither class. Every step changes the coupling by at most $C_L$. With $H$ sufficiently large, an exit from an admitted band would have been preceded by one of the strict internal marks. Thus this value reaches layer zero and ends exactly at $H$.
  To estimate the resulting trajectory, set $D_j = b_j - theta.alt_j$. The denominator comparison
  $ \| b_j^(- 1) - H_j^(- 1) \| lt.eq C frac(log \( 2 + H_j \/ H \) + \| D_j \|, H_j^2) $
  and Equation (1.85) show that the difference equation for $D_j$ has summable inhomogeneous terms: exponential increment errors, $O_L \( H_j^(- 1.05) \)$, and $O_L \( H_j^(- 2) log \( 2 + H_j \/ H \) \)$. Starting from $D_0 = 0$ and summing backwards gives, on every finite run,
  $ max_j \| D_j \| lt.eq C_L + C_L (sum_(r gt.eq 1) H_r^(- 2)) max_j \| D_j \| . $
  The coefficient sum is $O_L \( H^(- 1) \)$. Increasing $H$ absorbs it and proves Equation (1.87), hence Equation (1.86).
  For an inclined first step, the limiting increments are unchanged and their transient errors still have bounded sums. Starting from the same $beta_N$, the first-exit estimate therefore gives
  $ \| D_j \| lt.eq C_L + C_L sum_(r = j + 1)^N frac(log \( 2 + H_r \/ H \) + \| D_r \|, H_r^2) $
  through a hypothetical first exit. Its maximum is bounded by the same absorption, and the resulting interval lies strictly inside the admitted band. An exit is impossible. Finally, reflection interchanges the two inclined prescriptions and preserves every bulk scalar in the canonical and error normalization. Their running couplings therefore agree. This scalar equality does not identify their coefficient tensors in common coordinates; those tensors require the comparison below. ◻
]

Fix one such $beta_N$ for each $N$. The construction at a prescribed scale uses any such choice and does not require uniqueness of the shooting value. Sections 1–4 will remove the choice of trajectory after canonical normalization.

===== 1.5.3 Matching the complete endpoint densities <matching-the-complete-endpoint-densities>

For two regular trajectories of depths $N gt.eq K$, align their final $K$ layers and use the discrepancy variables $u_j \, lambda_j$ of Section 4. Here $u_j$ measures the normalized coefficient, error and gas differences, while $lambda_j$ is the precise coupling difference. The upper endpoint has bounded shape data; the lower endpoint satisfies $lambda_0 = 0$.

#thm([Proposition 1.17.])[
  (Endpoint matching).  #emph[For every sufficiently small fixed $upsilon > 0$, the parameters may be chosen so that some $rho < L^(- 2 + upsilon)$ satisfies 
#[#set math.equation(numbering: n => "(1.89)")
 $ u_j + \| lambda_j \| lt.eq C_H \( 1 + K \)^C rho^(K - j) \, #h(2em) 0 lt.eq j lt.eq K \, $ <eq:orig-14>]

 uniformly in $N gt.eq K$. After the respective bulk scalars have been removed, write the endpoint densities as $e^(X_i \( q \)) Xi_i \( q \)$. On every common admitted terminal torus of volume $v$, 
#[#set math.equation(numbering: n => "(1.90)")
 $ ∥X_1 - X_2∥_oo & lt.eq D_H v delta_K \,\
sup_x sum_(lambda : x in P_lambda) e^(A s_lambda) ∥k_(1 \, lambda) - k_(2 \, lambda)∥_oo & lt.eq D_H delta_K \, #h(2em) delta_K = L^(- \( 2 - upsilon \) K) . $ <eq:orig-15>]

 The constants are independent of depths and periods. The two mirrored inclined trajectories at depth $N$ have the same endpoint estimates with $K = N$, when their output lists are expressed in common coordinates.]
] <prop:endpoint-matching>

#proof[
  This is the two-boundary argument behind , with the improved contraction and history rate. Let $q$ be the contraction constant in Equation (1.76), and put $r = A_0 \/ L^2$. Choose
  $ max \( q \, r \) < rho < L^(- 2 + upsilon) $
  with strict spare width. The coupling coefficient in Equation (1.76) is bounded by
  $ epsilon_H = sup_(j gt.eq 0) C_L \( log H_j \)^C \/ H_j \, #h(2em) epsilon_H arrow.r 0 . $
  Writing $a = \( 1 - epsilon_H \)^(- 1)$, the step inequalities imply
  $ u_(j - 1) lt.eq q u_j + epsilon_H \| lambda_j \| + f_j \, #h(2em) \| lambda_j \| lt.eq a \| lambda_(j - 1) \| + a C_L u_j + a f_j \, $
  where $f_j lt.eq C_L "poly" \( H_j \) r^(K - j)$. Set $w_j = rho^(K - j)$ and
  $ U = max_(0 lt.eq j lt.eq K) u_j \/ w_j \, #h(2em) W = max_(0 lt.eq j lt.eq K) \| lambda_j \| \/ w_j . $
  There is $F_K = C_H \( 1 + K \)^C$ such that $f_j lt.eq F_K w_j$. Iteration from $K$ for the first inequality and from $0$ for the second gives
  $ U lt.eq u_K + frac(epsilon_H W + F_K, rho - q) \, #h(2em) W lt.eq frac(a \( C_L U + F_K \), 1 - a rho) . $
  Take $H$ so that $a rho < 1$ and the product of the two coefficients coupling $U$ and $W$ is less than $1 \/ 2$. Since $u_K$ is bounded by the common caps, these inequalities prove Equation (1.89).
  At layer zero the masked slot bounds, the load bounds, and the free-history discrepancies convert this estimate to the two norms in Equation (1.90), exactly as in . All sup bounds are taken on their masks; no off-mask extrapolation is used. The factor $\( 1 + K \)^C$ is absorbed into the strict spare width between $rho$ and $L^(- 2 + upsilon)$. For the inclined comparison, start at layer $N - 1$, where the first-step outputs obey the common caps, and compare the shared subsequent regular steps. Their terminal couplings agree by Proposition 19. The same proof applies, and the one-step shift is absorbed in the fixed constant.
  At every step only a scalar per site has been extracted. The layer-$j$ volume is $v L^(2 j)$, so the total scalar is exactly a constant times $v$, independent of the terminal period. All period-dependent corrections remain in the winding lists. This proves the claimed uniformity of the scalar-stripped comparison. ◻
]

The endpoint densities are strictly positive: each is obtained by integrating the positive microscopic density against positive normalized observations. In standard axis tori their laws also retain link reflection positivity at every retained block seam. Indeed the microscopic positive kernel factors across such a seam, and the observations on its two sides are independent and transform into one another under reflection. This is the verification following . Translation, quarter-turn, and mirror symmetries are retained whenever they preserve the period. When tile reflections are used below, the relevant tile counts are even. No endpoint reflection positivity is required for oblique periods or after an inclined first step.

==== 1.6 Integrated comparison of endpoint densities <sec:comparison>

Proposition 20 compares coefficients and gas activities. To compare partition functions in volumes growing almost as fast as $L^(2 K)$, we need an estimate with the same small parameter $delta_K$. A pointwise relative estimate is unsuitable on configurations where the signed covering sum is very small. We instead integrate the comparison before estimating it. The energy released by smoothing a rough region then pays for its replacement and for the combinatorics of the covering sum.

Throughout this section $H$ is fixed and large, and

$ t = t_0 = H^(- 1 \/ 2) p \, #h(2em) p = p_0 = \( log H \)^(P_0) \, #h(2em) H t^2 = p^2 . $

We work on standard axis tori of bounded aspect ratio, whose shortest period exceeds a constant depending on $H$. The periods will also be required to be multiples of a fixed dyadic integer depending on $H$. All constants below are independent of the cutoff depth and the periods.

===== 1.6.1 The comparison to be proved <the-comparison-to-be-proved>

Let $e^X Xi$ be one of the positive endpoint densities from Section 5, with its bulk scalar removed, and write

$ Z = integral e^(X \( q \)) Xi \( q \) thin thin upright(d) q \, #h(2em) thin upright(d) mu \( q \) = Z^(- 1) e^(X \( q \)) Xi \( q \) thin thin upright(d) q . $

Here $thin upright(d) q$ is product normalized area measure on $S^2$. Recall that $Xi$ is a mandatory covering sum. For

$ D \( q \) = { e : \| q_x - q_y \| > t } \, #h(2em) e = chevron.l x \, y chevron.r \, $

each label $lambda$ has a fixed nonempty inventory $J_lambda$ of bonds, a complete site support $P_lambda$, and a load $s_lambda gt.eq 1$. Its weight vanishes unless $J_lambda subset D \( q \)$, and its support contains every argument and every positive or negative eligibility test. A compatible family has pairwise disjoint supports. Thus

#[#set math.equation(numbering: n => "(1.91)")
 $ Xi \( q \) = sum_(Gamma med upright("compatible")\
union.sq.big_(lambda in Gamma) J_lambda = D \( q \)) product_(lambda in Gamma) k_lambda \( q \) . $ <eq:comparison-mandatory-cover>]

In particular $Xi = 1$ if $D \( q \)$ is empty. This inventory constraint will be retained in every identity below.

Consider another covering sum $tilde(Xi)$ on the same inventory rules, with signed or complex weights allowed. Put unused weights equal to zero in a common label list, and define

$ d_lambda = ∥tilde(k)_lambda - k_lambda∥_oo \, #h(2em) p_lambda = ∥k_lambda∥_oo + ∥tilde(k)_lambda∥_oo . $

The symbol $p_lambda$ is an activity envelope; the unsubscripted $p$ continues to denote $\( log H \)^(P_0)$.

#thm([Proposition 1.18.])[
  (Integrated covering comparison).  #emph[Fix any constant multiplier of the covering cap in Section 2. For sufficiently large $H$, let $e^X Xi$ be a standard endpoint density on an axis torus as above, and suppose 
$ sup_x sum_(lambda : x in P_lambda) e^(A s_lambda) p_lambda $

 is at most that multiplier times the covering cap. The exponent $A$ is the fixed support exponent of the endpoint class. Then 
#[#set math.equation(numbering: n => "(1.92)")
 $ 1 / Z integral e^X \| tilde(Xi) - Xi \| thin thin upright(d) q lt.eq exp (sum_lambda d_lambda e^(2 s_lambda)) - 1 . $ <eq:orig-16>]

 The statement is uniform in cutoff depth and in the admitted periods. Only the base density $e^X Xi$ is required to be positive and reflection positive.]
] <prop:integrated-comparison>

The proof has three parts. First, reflection positivity controls the exponential moment of kinetic energy in any specified set of rows. Second, rough configurations admit local replacements with a definite integrated energy gain. Third, exact covering identities organize the difference into forests to which that gain can be applied.

===== 1.6.2 Kinetic energy and a chessboard estimate <kinetic-energy-and-a-chessboard-estimate>

Choose $D_1$ to be an integer comparable with $\( log H \)^2$, with a sufficiently large fixed multiplier. In the kinetic part of $X$, truncate the exponentially localized kernel $ell$ at radius $D_1$ using a symmetric truncation. Group the resulting positive square and the direct term $H S_t$ at each unoriented bond; denote their sum, including the precise coupling, by $Y_e$. Enlarge the fixed multiple of $D_1$ when necessary so that it includes every mask read of these rows. Each $Y_e$ is nonnegative and reads only this finite stencil.

#thm([Lemma 1.19.])[
  (Energy remainder and normalization).  #emph[On a terminal torus of volume $v$, 
#[#set math.equation(numbering: n => "(1.93)")
 $ X = - sum_e Y_e + X_(upright("rem")) \, #h(2em) \| X_(upright("rem")) \| lt.eq C_L v \, #h(2em) \| X_(upright("rem")) \( q \) - X_(upright("rem")) \( q' \) \| lt.eq C_L n $ <eq:orig-17>]

 whenever $q \, q'$ differ at at most $n$ sites. Moreover, 
#[#set math.equation(numbering: n => "(1.94)")
 $ Z gt.eq e^(- C_L v log H) \, #h(2em) \| Xi \( q \) \| lt.eq e^v . $ <eq:orig-18>]

]
] <lem:comparison-remainder>

#proof[
  Exponential row and column moments bound the omitted kinetic tails. A change at $n$ sites affects at most $C_L D_1^2 n$ mask centers, and the factor $e^(- c D_1)$ pays for these fixed powers and the coupling. For the remaining terms, the endpoint bounds in the verification of give canonical size $C_L \( H t^4 + t^2 \)$ per anchor. Converting the anchor sum to a support-hit sum costs only a fixed power of $frak(m)_0$: complete records include all graph distances, compensation tags and masks, with the required load and path moments. The regular errors obey the corresponding support-hit estimate. Since $H t^4 + t^2 = H^(- 1) \( p^4 + p^2 \)$, these quantities, even with their fixed polylogarithmic factors, tend to zero as $H$ increases. This proves both remainder bounds.
  If all spins lie in one cap of radius $c H^(- 1 \/ 2)$, there are no bad bonds and $Xi = 1$. The exponent on this cap is bounded below by a constant times $- v$, while normalized $S^2$ area gives cap measure at least $c' H^(- 1)$ per site. This proves the lower bound for $Z$. For the other bound, discard compatibility and inventory constraints only after taking absolute values:
  $ \| Xi \| lt.eq product_lambda \( 1 + ∥k_lambda∥_oo \) lt.eq exp (sum_lambda ∥k_lambda∥_oo) lt.eq e^v . $
  The sums converge by the support-hit cap. ◻
]

The chessboard estimate uses the retained seam reflection positivity from Section 5; see also the general reflection positivity framework of #cite(label("FILS78")) #cite(label("FILS80")). We include the finite-tile argument because later rectangular periods require arbitrary even tile counts, not only powers of two.

#thm([Lemma 1.20.])[
  (Exponential moments of selected rows).  #emph[Let $B_T$ be a sufficiently large dyadic integer comparable with a fixed power of $log H$. On tori whose periods are multiples of $2 B_T$, every set $I$ of unoriented rows satisfies 
#[#set math.equation(numbering: n => "(1.95)")
 $ bb(E)_mu exp (theta sum_(e in I) Y_e) lt.eq exp \( C_L \| I \| B_T^2 log H \) \, #h(2em) theta = 1 - C_L D_1 \/ B_T . $ <eq:orig-19>]

 In particular $B_T$ may be chosen so that $theta > 0$ and $1 - theta$ is smaller than any prescribed fixed inverse power of $log H$.]
] <lem:row-exponential-moment>

#proof[
  For a tiling into $B_T$-squares, let $f_z$ be bounded nonnegative functions of the sites in tile $z$, with reflected-coordinate placement denoted by $theta_z f_z$. The chessboard inequality is
  #[#set math.equation(numbering: n => "(1.96)")
   $ bb(E)_mu product_z theta_z f_z lt.eq product_z (bb(E)_mu product_y theta_y f_z)^(1 \/ N_T) \, $ <eq:comparison-chessboard>]
  where $N_T$ is the number of tiles. To prove it for arbitrary even tile counts, first make the finite collection of tests strictly positive and normalize each test by its fully disseminated expectation to the power $1 \/ N_T$. Among all arrays formed from these normalized tests, choose one maximizing the expectation. Reflection positivity and Cauchy–Schwarz across any tile seam bound this maximum by the geometric mean of the expectations of the two reflected half-arrays. Both half-arrays must therefore also be maximizers.
  In one coordinate regard each transverse slab pattern as a letter. If a longest consecutive run of a letter has length at most half the cycle, reflect a half containing that run with a seam at one end; the run grows. If its length exceeds half the cycle, reflect a half lying within the run and obtain a constant cycle. Repetition makes the array constant in that coordinate. Repeat in the other coordinate, preserving the constancy already obtained. Even tile counts ensure that reflection interchanges the placement conventions at every seam. A homogeneous normalized array has expectation one, so the maximum was one. Limits removing the added constants prove Equation (1.96) for bounded nonnegative tests.
  For a fixed tile grid, retain those rows of $I$ whose complete stencils lie in a single tile at distance at least $C_L D_1$ from its boundary. In each occupied tile use the exponential of the sum of its retained rows as the test. Dissemination gives a subset of the positive rows, without repetitions, because the stencils remain inside disjoint tiles and the rows transform covariantly under reflection. If $J$ is such a disseminated set, Lemma 22 gives
  $ bb(E)_mu e^(sum_(e in J) Y_e) = Z^(- 1) integral e^(- sum_(e in.not J) Y_e + X_(upright("rem"))) Xi thin thin upright(d) q lt.eq e^(C_L v log H) . $
  The chessboard norm of an occupied tile consequently costs at most $e^(C_L B_T^2 log H)$. There are at most $\| I \|$ occupied tiles.
  Finally average over all $B_T^2$ translations of the tile grid. Every row is retained for at least a fraction $1 - C_L D_1 \/ B_T$ of these translations. Since $Y_e gt.eq 0$, generalized Hölder applied to the corresponding grid estimates yields Equation (1.95). ◻
]

===== 1.6.3 Regions that can be replaced at an energy gain <regions-that-can-be-replaced-at-an-energy-gain>

Use max distance on the torus, put

$ f \( x \) = max_(e in.rev x) \| q_x - q_y \| \, #h(2em) a = epsilon t \, $

and choose $epsilon > 0$ sufficiently small, independently of $H$. Mark every site of every integer square box of radius at most one fourth of the shortest period, including radius zero, on which the average of $f$ exceeds $a$. Let $U$ be the union of all marked boxes. Dilate $U$ by $d = C D_1$, take its max-neighbor connected components, and retain the complete components containing a true bad bond $\| q_x - q_y \| > t$. Denote them by $E_C$. Distinct retained components have nonadjacent sites, and every true bad bond lies deep inside exactly one retained component. The construction is illustrated in Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0.65, 0), (0.65, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((1.3, 0), (1.3, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((1.95, 0), (1.95, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((2.6, 0), (2.6, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((3.25, 0), (3.25, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((3.9, 0), (3.9, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((4.55, 0), (4.55, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((5.2, 0), (5.2, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((5.85, 0), (5.85, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((6.5, 0), (6.5, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((7.15, 0), (7.15, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((7.8, 0), (7.8, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((8.45, 0), (8.45, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((9.1, 0), (9.1, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((9.75, 0), (9.75, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (9.75, 0), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.65), (9.75, 0.65), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.3), (9.75, 1.3), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.95), (9.75, 1.95), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.6), (9.75, 2.6), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 3.25), (9.75, 3.25), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 3.9), (9.75, 3.9), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0, 4.55), (9.75, 4.55), stroke: (paint: rgb("#e0e0e0"), thickness: 0.4pt, miter-limit: 10))
  line((0.65, 0.65), (3.9, 0.65), (3.9, 1.3), (4.55, 1.3), (4.55, 1.95), (5.2, 1.95), (5.2, 3.9), (2.6, 3.9), (2.6, 3.25), (0.65, 3.25), close: true, fill: rgb("#e0e0ff"), stroke: none)
  line((0.65, 0.65), (3.9, 0.65), (3.9, 1.3), (4.55, 1.3), (4.55, 1.95), (5.2, 1.95), (5.2, 3.9), (2.6, 3.9), (2.6, 3.25), (0.65, 3.25), close: true, stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  rect((1.3, 1.3), (3.25, 2.6), fill: rgb("#a6a6ff"), stroke: none)
  rect((3.25, 1.95), (3.9, 3.25), fill: rgb("#a6a6ff"), stroke: none)
  rect((3.9, 2.6), (4.55, 3.25), fill: rgb("#a6a6ff"), stroke: none)
  rect((1.3, 1.3), (3.25, 2.6), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((3.25, 1.95), (3.9, 3.25), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((3.9, 2.6), (4.55, 3.25), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((6.5, 0.65), (9.1, 3.25), fill: rgb("#e0e0ff"), stroke: none)
  rect((6.5, 0.65), (9.1, 3.25), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  rect((7.15, 1.3), (8.45, 2.6), fill: rgb("#a6a6ff"), stroke: none)
  rect((7.15, 1.3), (8.45, 2.6), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.95, 1.95), (2.6, 1.95), stroke: (paint: rgb("#bf0000"), thickness: 2.0pt, miter-limit: 10))
  line((7.475, 1.95), (8.125, 1.95), stroke: (paint: rgb("#bf0000"), thickness: 2.0pt, miter-limit: 10))
  content((1.495, 0.9425), [#text(size: 9pt)[$E_C$]])
  content((7.8, 0.9425), [#text(size: 9pt)[$E_(C')$]])
  content((2.275, 2.34), [#text(size: 9pt)[$U inter E_C$]])
  line((2.99, 0.702), (2.99, 1.248), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((2.99, 0.975), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$d$]]])])
  content((0, 5.07), [#text(size: 9pt)[Marked boxes form $U$; a $d$-collar separates $U$ from the unchanged exterior.]], anchor: "west", padding: 0.1176cm)
  content((0, -0.455), [#text(size: 9pt)[#text(fill: rgb("#bf0000"))[Thick bonds]: true bad bonds #text(fill: rgb("#0000a6"))[Outer boundaries]: retained components of the dilation.]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Schematic editable regions. Each dark region is a union of marked boxes, and each light region is the complete connected component of its $d$-dilation. The replacement uses all sites of a selected light region. Its outer collar lies outside $U$, so it joins the unchanged configuration without creating a bad bond. Distinct retained components have nonadjacent sites. The drawing suppresses lattice boundary conventions and is not to scale. ],
) <fig:editable>

#thm([Lemma 1.21.])[
  (Replacement and its energy bounds).  #emph[The constants $epsilon$ and $C$ can be chosen so that the following statements hold for all sufficiently large $H$ and sufficiently large admitted periods.]
  + #emph[The unchanged values on $U^c$ have a measurable extension to all sites in $S^2$ with nearest-neighbor chords at most $C' a$. For each region $E_C$, independently sampling every spin in a cap of radius $c' t$ about this extension removes all its true bad bonds and creates none. Any subset of the regions may be replaced in this way. The conditional sampling density for $n$ replaced sites is at most $exp \( C n log H \)$ with respect to product normalized area measure.]
  + #emph[For a union $E$ of selected regions, let $n = \| E \|$. There is a set $I_E$ of rows, consisting of all rows within distance $C' D_1$ of $E$, which includes every changed kinetic stencil and satisfies $\| I_E \| lt.eq C d^2 n$. Its total stencil enlargement is less than $d \/ 2$. For the original configuration and every sampled replacement $q'$, 
#[#set math.equation(numbering: n => "(1.97)")
 $ sum_(e in I_E) Y_e \( q \) & gt.eq c p^2 n \/ d^2 \,\
sum_(e in I_E) Y_e \( q' \) & lt.eq C_L d^2 p^2 n . $ <eq:orig-20>]

]
] <lem:editable-regions>

#proof[
  We first establish the exterior Lipschitz estimate. At a point of $U^c$, every allowed box containing that point has average gradient at most $a$. Compare the spin at the point with averages over successive concentric doubled boxes. The discrete $L^1$ Poincaré inequality, obtained by summing coordinate paths, bounds the change at scale $R$ by $C R$ times the average gradient on a fixed enlargement. For two points, stop at the scale of their separation and compare the two averages through an enclosing box of comparable size. Summing the geometric scales gives
  $ \| q_x - q_y \| lt.eq C a thin "dist" \( x \, y \) \, #h(2em) x \, y in U^c . $
  The radius-one case uses the same coordinate-path estimate. If the required scale exceeds the allowed box size, the sphere’s bounded diameter proves the estimate once the shortest period is much larger than $a^(- 1)$.
  Extend these exterior data componentwise to an $O \( a \)$-Lipschitz Euclidean-vector-valued function on the continuous torus, using distance cones. Within distance $c \/ a$ of the prescribed data the extension has norm bounded away from zero; normalization therefore gives an $S^2$-valued extension there with Lipschitz constant $O \( a \)$. Choose a torus mesh of width comparable with $c' \/ a$, where $c'$ is sufficiently smaller than $c$. Preserve this extension in every mesh box meeting the prescribed data. Choose a common arbitrary spin at all remaining undetermined vertices, and use measurably selected shortest arcs on the undetermined mesh edges.
  Each remaining box now has a boundary map into $S^2$ with uniformly bounded Lipschitz constant after rescaling. To fill it, cover the antipodal image curve by $O \( 1 \/ tau \)$ spherical balls of radius $tau$. Their total area is $O \( tau \)$, so for a sufficiently small fixed $tau$ there is a point $p_(*)$ uniformly separated from the antipodal curve. If the boundary map in disk coordinates is $g \( theta \)$, the normalized cone
  $ F \( r \, theta \) = frac(\( 1 - r \) p_(*) + r g \( theta \), \| \( 1 - r \) p_(*) + r g \( theta \) \|) $
  has a uniform Lipschitz bound. A fixed bi-Lipschitz change between a disk and a square preserves that bound. This is the filling argument of , with the area of $S^2$ replacing the volume of $S^3$. Adjacent fillings agree on their already chosen edges. Fixed ordered nets for $p_(*)$ and measurable arc choices make the construction measurable. The same construction works if there are no exterior data. Rescaling gives the claimed $C' a$ bound.
  Choose $epsilon$ so that this bound is a sufficiently small fraction of $t$. Choose the sampling cap radius $c' t$ smaller still. All sampled adjacent spins then have chords below $t$. A boundary edge of a retained region lies in the collar outside $U$, where the extension equals the unchanged data; thus crossing edges also remain below $t$. Every originally true bad bond belongs to a retained region. Consequently replacing any selected regions removes exactly their bad-bond inventories. A cap of radius $c' t$ on $S^2$ has area at least $c t^2$, so its normalized sampling density is at most $C \/ t^2 lt.eq H^C$. Taking products proves the density bound.
  For the lower energy estimate, select disjoint generating marked boxes in each component, in decreasing order of size. Fixed enlargements of the selected boxes cover all generating boxes. Dilation by $d$ enlarges the area of a unit or larger box by at most $C d^2$. The total selected area in $E_C$ is therefore at least $c \| E_C \| \/ d^2$. On each selected box the average of $f$ exceeds $a$. If this average is supplied mainly by chords greater than $t$, the positive linear branch of $S_t$ gives an energy lower bound $c H a^2$ times the box area. Otherwise Cauchy–Schwarz in the quadratic branch gives the same lower bound. Bonds incident to disjoint selected boxes are counted at most a bounded number of times. Since $H a^2 = epsilon^2 p^2$, summation proves Equation (1.97).
  Choose the fixed multiple in $d = C D_1$ after the stencil constants, so that all stencils read by rows of $I_E$ stay within a $d \/ 2$ enlargement of $E$. On the replaced sites all chords are below $t$. Any unselected component of the full dilated construction has its original marked part at distance at least $d$ from $E$; elsewhere the unchanged chords are bounded by the exterior estimate. Thus every chord read by these rows is at most $t$. Uniform summability of the row weights gives $Y_e \( q' \) lt.eq C_L H t^2 = C_L p^2$. The support count $\| I_E \| lt.eq C d^2 n$ proves Equation (1.97). ◻
]

The lower bound is proportional to the number of replaced sites, with only the polylogarithmic loss $d^2$. This is what allows an integrated estimate uniform in the total volume. Fix $B_T$ in Lemma 23 so large that

#[#set math.equation(numbering: n => "(1.98)")
 $ \( 1 - theta \) C_L d^2 < frac(c, 4 d^2) \, $ <eq:comparison-theta-choice>]

with the constants of Lemma 24. Next take $P_0$ sufficiently large that

#[#set math.equation(numbering: n => "(1.99)")
 $ p^2 \/ d^2 gt.double d^2 B_T^2 log H + log H + 1 . $ <eq:comparison-p-choice>]

All powers on the right were fixed independently of $P_0$. These requirements can therefore be included among the finite choices before taking $H$ large.

===== 1.6.4 Exact covering identities and integration <exact-covering-identities-and-integration>

We now keep the geometry of the original configuration fixed while removing selected inventories. This distinction is important: no modified configuration is reclustered.

Let $cal(I)$ be the family of retained regions of a configuration $q$, and let $D_C$ be the original true bad bonds assigned to $E_C$. Choose filled values at every region as in Lemma 24. For $I subset cal(I)$, let $q \( I \)$ be the configuration in which precisely the regions outside $I$ have been replaced. Then

#[#set math.equation(numbering: n => "(1.100)")
 $ D \( q \( I \) \) = union.sq.big_(C in I) D_C . $ <eq:comparison-inventory-edit>]

Write $Xi \( I \) = Xi \( q \( I \) \)$; these are complete positive sums.

At a fixed active set $I$, join two labels of a full covering family if their supports meet the same active region. Call a connected group a macrolabel $U$. Its enlarged support and weight are

$ S_U = union.big_(lambda in U) P_lambda med union #h(-0.16667em) union.big_(C in I : med E_C ∩ P_lambda eq.not diameter\
upright("for some ") lambda in U) E_C \, #h(2em) w \( U \; q \( I \) \) = product_(lambda in U) k_lambda \( q \( I \) \) . $

All labels supplying the inventory of a touched region belong to the same group, so each macrolabel covers every active region it meets in full. Distinct macrolabels have disjoint enlarged supports. Conversely, compatible macrolabels covering the active inventories recover a full original covering family.

If a site set $S$ is disjoint from the active regions, denote by $Xi \( I \; S \)$ the complete-inventory sum restricted to macrolabels whose enlarged supports avoid $S$. This restricted sum may be signed. For a selected compatible macrolabel family $cal(A)$, let $S_(cal(A))$ be its combined support and $B_(cal(A))$ the active regions it covers. The exact identities from , , and become

#[#set math.equation(numbering: n => "(1.101)")
 $ Xi \( I \; S \) & = sum_(cal(A) med upright("compatible")\
S_U ∩ S eq.not diameter med \( U in cal(A) \)) \( - 1 \)^(\| cal(A) \|) product_(U in cal(A)) w \( U \; q \( I \) \) thin Xi \( I \\ B_(cal(A)) \; S_(cal(A)) \) \,\
tilde(Xi) \( I \) - Xi \( I \) & = sum_(cal(A) med upright("compatible")\
cal(A) eq.not diameter) product_(U in cal(A)) \[ tilde(w) \( U \; q \( I \) \) - w \( U \; q \( I \) \) \] thin Xi \( I \\ B_(cal(A)) \; S_(cal(A)) \) . $ <eq:comparison-inclusion-exclusion>]

Here and below macrolabels in a displayed sum satisfy the inventory conditions just described.

To verify the identities, first select a compatible family. Every remaining support avoids $S_(cal(A))$ and hence every changed site. Its values and all eligibility indicators are unchanged by removing $B_(cal(A))$. Its inventory loses exactly the removed inventories in Equation (1.100). This gives the background sum $Xi \( I \\ B_(cal(A)) \; S_(cal(A)) \)$. Expand the indicator of avoiding $S$ as a product of $1 - upright(bold(1))_({ S_U ∩ S eq.not diameter })$ to obtain the first identity. Expand $tilde(w) = w + \( tilde(w) - w \)$ in a full family and subtract the all-$w$ term to obtain the second. With finite label lists these are finite algebraic identities. A full family contains at most $\| D \( q \( I \) \) \|$ labels, and the absolute activity bounds give convergence for countable lists, so the identities pass to that limit before any division is performed.

Starting with Equation (1.101), iterate Equation (1.101) until each term ends in a complete base sum $Xi \( q' \)$. Every nonempty generation consumes an active region, so this recursion terminates. Fix an ordering of the common label list. Take absolute values and telescope each initial macrolabel difference in this order:

#[#set math.equation(numbering: n => "(1.102)")
 $ \| tilde(w) \( U \) - w \( U \) \| lt.eq sum_(lambda in U) d_lambda product_(kappa in U \\ { lambda }) p_kappa . $ <eq:comparison-marked-product>]

Thus each initial macrolabel has one marked original label, carrying $d_lambda$; the other labels carry $p_lambda$. The final complete $Xi \( q' \)$ is positive.

We record explicitly the gain after integrating such a term. A term will be encoded below by its original labels and the exact site sets of its consumed regions. Fix these sets, let their union be $E$, and put $n = \| E \|$. Let $cal(Q)$ be the measurable set of original configurations whose region construction and original inventories admit this encoded term. Label lists include zero-valued labels: every spin-dependent eligibility test remains in the evaluated weight. Thus $cal(Q)$ is defined before sampling, even when a later evaluated weight vanishes for some filled values. Average over the sampled filled values; only consumed regions need to be sampled. Then

#[#set math.equation(numbering: n => "(1.103)")
 $ 1 / Z integral_(cal(Q)) e^(X \( q \)) bb(E)_(upright("fill") divides q) \[ Xi \( q' \) \] thin thin upright(d) q lt.eq e^(- c' p^2 n \/ d^2) . $ <eq:orig-22>]

Indeed Equations (1.93) and (1.97) imply

$ X \( q \) - X \( q' \) lt.eq C_L n - c p^2 n \/ d^2 + sum_(e in I_E) Y_e \( q' \) . $

By Equation (1.97) and the choice (1.98), replacing the last coefficient one by $theta$ costs at most $c p^2 n \/ \( 4 d^2 \)$.

There is no change-of-variables invertibility assumption here. Write $q = \( q_E \, q_(E^c) \)$ and let $h \( q'_E divides q_E \, q_(E^c) \)$ be the conditional fill density. Its uniform bound is $e^(C n log H)$. After using that bound, positivity of $Xi \( q' \)$ allows the restrictions defining $cal(Q)$ to be dropped. Integration over the original $q_E$ contributes at most one, since it uses product probability measure. The remaining integral over $\( q'_E \, q_(E^c) \)$ is bounded by

$ exp (C_L n + C n log H - frac(3 c p^2 n, 4 d^2)) bb(E)_mu exp (theta sum_(e in I_E) Y_e) . $

Equation (1.95), $\| I_E \| lt.eq C d^2 n$, and Equation (1.99) prove Equation (1.103). This is the only integration estimate needed in the covering recursion; no restricted signed sum appears in a denominator.

===== 1.6.5 Summing the forests <summing-the-forests>

We complete the proof of Proposition 21 by explaining the counting in for these regions. Inside each macrolabel choose a spanning tree on its original label nodes and the active-region nodes it meets. Make the choice deterministically using a fixed ordering. Join each later macrolabel, again deterministically, to one preceding-generation macrolabel whose support it meets. Choose a deterministic intersecting pair of their underlying gas or region supports as the endpoints of this edge. Use two edge colors to distinguish edges internal to a macrolabel from edges joining generations, and root each tree at the marked label of its initial macrolabel.

No region node is repeated: a region is consumed on first appearance. No original label is repeated either. Its inventory is fixed and nonempty, and the regions containing it have already been removed after its first appearance. It cannot be eligible in a subsequent generation. Within a generation the supports are disjoint.

This forest retains the entire term. Contracting internal edges recovers the macrolabels; depths in the contracted rooted forest recover generations; marked roots recover the telescoping choices. The exact region site sets recover the consumed active sets and therefore every evaluation configuration. Thus distinct terms do not acquire the same forest. For a fixed original configuration the unconsumed geometry and inventories are already determined; there is no further multiplicity to count.

After integration, Equation (1.103) assigns an edit node $E_C$ the weight

$ w \( E_C \) = e^(- c' p^2 \| E_C \| \/ d^2) . $

Since the consumed sets are disjoint, their product is exactly the weight for their union. We may now enlarge the possible geometries to all connected site animals. On a bounded-degree lattice the number of animals of size $n$ containing a fixed site is at most $C^n$; the same bound follows by a spanning-tree traversal on a torus. Consequently, with $R = C_L frak(m)_0^2$ large enough that $\| P_lambda \| lt.eq R s_lambda$,

$ sup_x sum_(E_C : x in E_C) w \( E_C \) e^(2 \| E_C \|) lt.eq sum_(n gt.eq 1) C^n e^(- \( c' p^2 \/ d^2 - 2 \) n) < frac(1, 16 R) $

for sufficiently large $H$. The activity cap likewise gives

$ sup_x sum_(lambda : x in P_lambda) p_lambda e^(2 s_lambda) < frac(1, 16 R) . $

Indeed $A = 64 gt.eq 2$ and $R w_0 arrow.r 0$, even after multiplying the cap by any fixed constant, by Equation (1.62). Give a gas node size $s_lambda$ and an edit node size $\| E_C \|$. Every node of size $b$ has support at most $R b$. Summing over an intersection site and the two edge colors bounds the one-child sum, with an exponential allowance for descendants, by $b \/ 4$.

More explicitly, induction on maximum tree depth bounds the total descendant weight below a root of size $b$ by $e^b$. For the induction step, a child of size $a$ contributes at most its weight times $e^a$. The sum over unordered distinct children is bounded by the exponential of the one-child sum, because ordered $r$-tuples with factor $1 \/ r !$ only enlarge it after distinctness is dropped. Hence the descendant sum is at most $e^(b \/ 4) lt.eq e^b$. Monotonicity of the positive majorants allows arbitrary depth.

A marked gas root therefore costs at most $d_lambda e^(s_lambda) lt.eq d_lambda e^(2 s_lambda)$. Actual forest components have distinct marked roots. Dropping all disjointness conditions between their descendant trees and summing unordered nonempty root sets gives

$ sum_(r gt.eq 1) frac(1, r !) (sum_lambda d_lambda e^(2 s_lambda))^r . $

This is the right-hand side of Equation (1.92), proving Proposition 21.

===== 1.6.6 Partition functions and ordinary alignment <partition-functions-and-ordinary-alignment>

Apply Proposition 21 to the two endpoint gases in Equation (1.90). Summing their support-hit bound over sites gives

$ sum_lambda d_lambda e^(2 s_lambda) lt.eq D_H v delta_K . $

The exponent comparison in that equation then shows that the ratio of the scalar-stripped partition functions tends to one whenever $v delta_K arrow.r 0$. For example, with $epsilon_K = D_H v delta_K$,

$ lr(|frac(integral e^(X_1) Xi_2, integral e^(X_1) Xi_1) - 1|) lt.eq e^(epsilon_K) - 1 \, #h(2em) e^(- epsilon_K) lt.eq e^(X_2 - X_1) lt.eq e^(epsilon_K) . $

For small $epsilon_K$ these inequalities bound the logarithm of the partition-function ratio by $C epsilon_K$. The constants depend on the fixed $H$, but not on depth or period. The same integrated estimate will also be used when activity differences are localized at specified source sites, in which case their sum does not carry a factor $v$.

We also need a local consequence of reflection positivity.

#thm([Corollary 1.22.])[
  (Terminal alignment).  #emph[On every standard terminal axis torus considered in this section, for each fixed $C > 0$ there is $c > 0$ such that every bond satisfies 
#[#set math.equation(numbering: n => "(1.104)")
 $ mu { \| q_x - q_y \| > t \/ C } lt.eq e^(- c H t^2) . $ <eq:orig-23>]

 The constants are uniform in the cutoff depth and the admitted periods.]
] <cor:terminal-alignment>

#proof[
  Choose a translated $2$-by-$2$ tile containing the specified bond and disseminate its event by tile reflections. The periods are divisible by $2 B_T$, hence by $4$, so these tiles have even counts in both directions. A fixed positive fraction of all bonds then have chord greater than $t \/ C$. The direct kinetic energy on that event is at least $c H t^2 v$. Equations (1.93) and (1.94) bound its probability by
  $ exp \[ - v \( c H t^2 - C_L - C_L log H \) \] lt.eq e^(- c' v H t^2) . $
  The chessboard inequality gives the single-event bound after taking the corresponding tile root. This is the argument of , whose hypotheses have now all been checked for the $S^2$ endpoint law. No such estimate is used in oblique periods. ◻
]

==== 1.7 Trace estimates uniform in the cutoff <sec:trace>

The endpoint comparison now produces a box of fixed physical size in which the excited transfer trace is small at every sufficiently fine cutoff. Positivity then propagates this information to arbitrarily large boxes. This section proves both consequences needed below: a uniform comparison between finite tori and the plane, and exponential decorrelation at a fixed positive rate in physical units. The transfer argument follows #cite(label("OpenAI-O4")), ; we give its proof, including the rectangular and sheared periods used here.

Write $Z_beta \( n \, w \)$ for the nearest-neighbour partition function on the torus with time period $n$ and spatial period $w$, using normalized area measure at every spin. All geometric periods below, including the auxiliary half-periods, are at least four. Define

#[#set math.equation(numbering: n => "(1.105)")
 $ Delta_beta \( n \, w \) = 4 log Z_beta \( n \, w \) - log Z_beta \( 2 n \, 2 w \) . $ <eq:trace-doubling-definition>]

The coefficients cancel every contribution to $log Z$ proportional to the area. In particular, the bulk scalars extracted by the exact renormalization do not contribute to $Delta_beta$.

===== 1.7.1 A fixed physical box <a-fixed-physical-box>

The gain in the preliminary length estimate and the contraction of endpoint discrepancies have complementary roles. The former makes a reference box large enough to mix; the latter allows that box to be compared with every finer cutoff.

#thm([Proposition 1.23.])[
  (A uniform reference-box test).  #emph[Let $cal(U) subset \( bb(Q)_(> 0) \)^2$ be finite. Assume the preliminary estimate of Section 1, the shooting asymptotics (1.86), the endpoint discrepancy estimate (1.90), and the integrated comparison (1.92). With the contraction slack $upsilon > 0$ chosen sufficiently small, there exist an integer $K_0$ and a positive integer $M_0$, independent of $N$, such that, for every $N gt.eq K_0$ and every $\( u_1 \, u_2 \) in cal(U)$, 
#[#set math.equation(numbering: n => "(1.106)")
 $ Delta_(beta_N) \( n \, w \) lt.eq 2^(- 10) \, #h(2em) \( n \, w \) = \( u_1 \, u_2 \) M_0 L^N . $ <eq:orig-24>]

 The number $M_0$ may be required to exceed any prescribed fixed constant and to be divisible by any prescribed fixed integer. In particular, all periods and tile counts needed in Section 6 may be taken to be even integers.]
] <prop:trace-small-box>

#proof[
  Let $eta > 0$ be the gain in (1.1). Choose
  $ 0 < upsilon / 2 < chi < min {1 \, frac(eta, 2 pi)} . $
  Take $m_K$ to be a fixed common integer multiple of a dyadic integer, rounded so that
  #[#set math.equation(numbering: n => "(1.107)")
   $ log_L m_K = \( 1 - chi \) K + O \( 1 \) \, #h(2em) 2 \( 1 - chi \) < 2 - upsilon \, #h(2em) 2 - chi > frac(4 pi - eta, 2 pi) . $ <eq:trace-scale-choice>]
  The fixed multiple clears the denominators in $cal(U)$ and imposes the divisibility conditions of the proposition.
  At depth $K$, Equation (1.86) and $gamma = \( log L \) \/ \( 2 pi \)$ give
  $ X \( beta_K \) lt.eq C_H K^(C_H) L^(\( 2 - eta \/ \( 2 pi \) \) K) . $
  The shorter side of a reference rectangle $\( u_1 \, u_2 \) m_K L^K$ is a fixed positive multiple of $L^(\( 2 - chi \) K)$. Its ratio to $X \( beta_K \)$ therefore grows exponentially in $K$. The preliminary doubling estimate consequently implies
  $ max_(\( u_1 \, u_2 \) in cal(U)) lr(|Delta_(beta_K) \( u_1 m_K L^K \, u_2 m_K L^K \)|) arrow.r 0 . $
  Indeed its exponentially decaying factor dominates every polynomial prefactor in the microscopic periods and in $beta_K$.
  For $N gt.eq K$, run both cutoffs to the same terminal rectangle with periods $\( u_1 \, u_2 \) m_K$. Its volume is $v = u_1 u_2 m_K^2$. Equations (1.90) and (1.92), with the exponent discrepancy included, imply that the logarithms of the two scalar-stripped partition functions differ by at most $C_H v delta_K$ whenever $v delta_K$ is sufficiently small. The estimate is uniform in $N gt.eq K$. Apply it also to the doubled rectangle, whose terminal volume is $4 v$. Cancellation of the bulk scalars gives
  $ & lr(|Delta_(beta_N) \( u_1 m_K L^N \, u_2 m_K L^N \) - Delta_(beta_K) \( u_1 m_K L^K \, u_2 m_K L^K \)|)\
 & #h(35mm)  lt.eq C_H m_K^2 delta_K arrow.r 0 \, $
  because $delta_K = L^(- \( 2 - upsilon \) K)$ and $2 \( 1 - chi \) < 2 - upsilon$. Constants may depend on the finite list $cal(U)$, but not on $N$ or $K$. Choose one sufficiently large $K_0$ and put $M_0 = m_(K_0)$. ◻
]

===== 1.7.2 Positive transfer and repeated doubling <positive-transfer-and-repeated-doubling>

We next isolate the spectral content of the partition-function test. For a fixed spatial circumference $w$, a time slice is $s = \( s_1 \, dots.h \, s_w \) in \( S^2 \)^w$. Put $V_w \( s \) = sum_(i = 1)^w s_i dot.op s_(i + 1)$, with periodic indices. On $L^2 \( \( S^2 \)^w \)$ define the transfer operator $K_w$ by the kernel

#[#set math.equation(numbering: n => "(1.108)")
 $ K_w \( s \, s' \) = exp {beta / 2 V_w \( s \) + beta sum_(i = 1)^w s_i dot.op s'_i + beta / 2 V_w \( s' \)} . $ <eq:trace-kernel>]

The coupling $beta gt.eq 0$ is fixed in this subsection and suppressed from the notation. All Hilbert spaces use product probability measure.

The kernel is continuous, symmetric, and strictly positive. Its positive semidefiniteness is a separate property: the expansion

$ e^(beta s dot.op s') = sum_(j = 0)^oo frac(beta^j, j !) chevron.l s^(⊗ j) \, \( s' \)^(⊗ j) chevron.r $

is a sum of positive semidefinite kernels. Tensor products over sites and multiplication on both sides by $e^(beta V_w \/ 2)$ preserve that property. The sum of their diagonal integrals is finite, so the same expansion proves that $K_w$ is trace class. Strict positivity of the kernel gives a simple largest eigenvalue with a strictly positive normalized eigenfunction $Omega_w$. Write

$ lambda_1 \( w \) > lambda_2 \( w \) gt.eq lambda_3 \( w \) gt.eq dots.h.c gt.eq 0 \, #h(2em) Z_beta \( n \, w \) = "Tr" K_w^n = sum_i lambda_i \( w \)^n . $

If only one eigenvalue is nonzero, all subsequent statements are read with $lambda_2 = 0$. These observations also verify directly the transfer hypotheses of for $S^2$ spins.

Define the two one-direction defects

#[#set math.equation(numbering: n => "(1.109)")
 $ p \( n \, w \) & = 2 log Z_beta \( n \, w \) - log Z_beta \( 2 n \, w \) \,\
q \( n \, w \) & = 2 log Z_beta \( n \, w \) - log Z_beta \( n \, 2 w \) . $ <eq:trace-one-direction>]

Both are nonnegative, using transfer positivity in the respective coordinate directions. The excited trace relative to the largest eigenvalue is

$ s_n \( w \) = sum_(i gt.eq 2) (frac(lambda_i \( w \), lambda_1 \( w \)))^n . $

#thm([Lemma 1.24.])[
  (Concentration of the transfer trace).  #emph[For every integer $n gt.eq 4$, $s_n \( w \) lt.eq e^(p \( n \, w \)) - 1$. If $p \( n \, w \) lt.eq 1 \/ 4$, then 
#[#set math.equation(numbering: n => "(1.110)")
 $ (frac(lambda_2 \( w \), lambda_1 \( w \)))^n lt.eq 2 p \( n \, w \) \, #h(2em) p \( 2 n \, w \) lt.eq 4 p \( n \, w \)^2 . $ <eq:trace-squaring>]

 The corresponding conclusions hold for $q$ with the coordinate directions interchanged.]
] <lem:trace-concentration>

#proof[
  Set $t_i = lambda_i \( w \)^n \/ sum_j lambda_j \( w \)^n$. Then
  $ e^(- p \( n \, w \)) = sum_i t_i^2 lt.eq t_1 = \( 1 + s_n \( w \) \)^(- 1) . $
  This gives the first assertion and, when $p lt.eq 1 \/ 4$, the bound $s_n lt.eq p e^p lt.eq 2 p$. Moreover $s_(2 n) lt.eq s_n^2$, and cancellation of the largest eigenvalue yields
  $ p \( 2 n \, w \) = 2 log \( 1 + s_(2 n) \) - log \( 1 + s_(4 n) \) lt.eq 2 s_n^2 lt.eq 2 p \( n \, w \)^2 e^(2 p \( n \, w \)) lt.eq 4 p \( n \, w \)^2 . $
  This is the proof of , with no dependence on the dimension of the spin sphere. ◻
]

Small excited weight at one circumference alone would leave open the appearance of low-energy states at larger circumferences. The second direction in $Delta$ supplies the missing control. Direct substitution in (1.109) gives

#[#set math.equation(numbering: n => "(1.111)")
 $ Delta_beta \( n \, w \) & = 2 p \( n \, w \) + q \( 2 n \, w \) = 2 q \( n \, w \) + p \( n \, 2 w \) \,\
p \( n \, 2 w \) & = 2 p \( n \, w \) - 2 q \( n \, w \) + q \( 2 n \, w \) . $ <eq:trace-rectangle-identities>]

In particular, $Delta_beta \( n \, w \) gt.eq 0$.

#thm([Proposition 1.25.])[
  (Rectangular doubling criterion).  #emph[Let $beta gt.eq 0$ and let $n \, w gt.eq 4$ be integers. If $Delta_beta \( n \, w \) lt.eq 2^(- 10)$, then, for every $k gt.eq 0$, 
#[#set math.equation(numbering: n => "(1.112)")
 $ Delta_beta \( 2^k n \, 2^k w \) lt.eq 64^(- 1) 2^(- 2^k) . $ <eq:orig-25>]

 For a square with $n = w$, the transfer operators at circumferences $2^k n$ also satisfy 
#[#set math.equation(numbering: n => "(1.113)")
 $ frac(lambda_2 \( 2^k n \), lambda_1 \( 2^k n \)) lt.eq e^(- \( log 2 \) \/ n) . $ <eq:trace-width-gap>]

]
] <prop:trace-doubling>

#proof[
  Write $Delta = Delta_beta \( n \, w \)$. The two expressions in (1.111) imply $q \( 2 n \, w \) lt.eq Delta$ and $p \( n \, 2 w \) lt.eq Delta$. Consequently
  $ p \( 2 n \, 2 w \) lt.eq 4 Delta^2 . $
  The interchanged rectangle identity then gives
  $ q \( 4 n \, w \) = 2 q \( 2 n \, w \) - 2 p \( 2 n \, w \) + p \( 2 n \, 2 w \) lt.eq 2 Delta + 4 Delta^2 lt.eq 3 Delta . $
  Squaring in the spatial direction gives $q \( 4 n \, 2 w \) lt.eq 36 Delta^2$, and hence
  $ Delta_beta \( 2 n \, 2 w \) = 2 p \( 2 n \, 2 w \) + q \( 4 n \, 2 w \) lt.eq 44 Delta^2 lt.eq 64 Delta^2 . $
  Every application of Lemma 27 is permitted by $3 dot.op 2^(- 10) < 1 \/ 4$, and the smallness condition is preserved. Iteration yields
  $ Delta_beta \( 2^k n \, 2^k w \) lt.eq 64^(- 1) \( 64 dot.op 2^(- 10) \)^(2^k) lt.eq 64^(- 1) 2^(- 2^k) . $
  For a square, put $n_k = 2^k n$. The same lemma gives
  $ (frac(lambda_2 \( n_k \), lambda_1 \( n_k \)))^(n_k) lt.eq 2 p \( n_k \, n_k \) lt.eq Delta_beta \( n_k \, n_k \) . $
  Taking the $n_k$-th root proves (1.113). Thus the square proof of also proves the asserted rectangular recursion; no equality of the original periods entered that recursion. ◻
]

===== 1.7.3 Local insertions and the volume limit <local-insertions-and-the-volume-limit>

To use the trace bound for correlations, one needs control of an insertion that may occupy an entire time slab. The following estimate has no cost depending on the number of spins read by the insertion. Let $F$ be a bounded local observable supported in a slab of $r$ transfer steps. The kernel $K_(w \, F)$ obtained by inserting $F$ in that slab satisfies

$ \| K_(w \, F) \( s \, s' \) \| lt.eq ∥F∥_oo K_w^r \( s \, s' \) . $

With $T_w = K_w \/ lambda_1 \( w \)$ and $A_F = K_(w \, F) \/ lambda_1 \( w \)^r$, positivity of $K_w^r$ implies $∥A_F∥ lt.eq ∥F∥_oo$: apply the pointwise inequality to $\| f \|$ and use $∥T_w^r∥ = 1$. When $r = 0$, $A_F$ is multiplication by $F$. The infinite-time cylinder expectation is therefore

$ omega_w \( F \) = chevron.l Omega_w \, A_F Omega_w chevron.r . $

Let $P_w$ be the orthogonal projection onto $Omega_w$. Since $T_w - P_w$ is positive semidefinite, $"Tr" \( T_w^j - P_w \) = s_j \( w \)$. For $r lt.eq n \/ 2$, splitting off $P_w$ in

$ mu_(beta \; n \, w) \( F \) = frac("Tr" \( A_F T_w^(n - r) \), "Tr" T_w^n) $

gives

#[#set math.equation(numbering: n => "(1.114)")
 $ \| mu_(beta \; n \, w) \( F \) - omega_w \( F \) \| lt.eq 2 ∥F∥_oo s_(n \/ 2) \( w \) \, $ <eq:trace-torus-cylinder>]

whenever $n$ is even. Here $mu_(beta \; n \, w)$ denotes the probability law on the rectangular torus. The same calculation applies after interchanging space and time.

We state the resulting volume comparison with the auxiliary aspect ratios specified explicitly. This makes the finite amount of information required from Proposition 26 independent of all later limits. For complex observables the covariance is sesquilinear: $"Cov"_omega \( F \, G \) = omega \( overline(F) G \) - omega \( overline(F) \) omega \( G \)$.

#thm([Theorem 1.26.])[
  (Uniform volume comparison and slab decorrelation).  #emph[Let $cal(A) subset \( bb(Q)_(> 0) \)^2$ be a finite list containing $\( 1 \, 1 \)$ and $\( 1 \, 25 \)$, and put 
$ cal(U) = cal(A) union { \( u_1 \/ 2 \, u_2 \) : \( u_1 \, u_2 \) in cal(A) } union { \( 2 u_1 \, u_2 \/ 2 \) : \( u_1 \, u_2 \) in cal(A) } . $

 Choose $K_0 \, M_0$ by Proposition 26 for $cal(U)$, with all displayed periods even and at least four. Let $omega_(beta_N)$ be the periodic infinite-plane state supplied by Section 1. There are constants $C \, c > 0$, independent of $N gt.eq K_0$ and $k gt.eq 0$, with the following properties.]
  #emph[For $\( u_1 \, u_2 \) in cal(A)$, set $\( n \, w \) = \( u_1 \, u_2 \) 2^k M_0 L^N$. If a bounded local observable $F$ can be placed in a rectangle of time extent at most $n \/ 2$ and spatial extent at most $w \/ 2$, then 
#[#set math.equation(numbering: n => "(1.115)")
 $ \| mu_(beta_N \; n \, w) \( F \) - omega_(beta_N) \( F \) \| lt.eq C ∥F∥_oo e^(- c 2^k) . $ <eq:trace-uniform-volume>]

 The same estimate holds for a torus obtained by closing time with any integer spatial translation, provided the support has a lift of time extent at most $n \/ 2$ and spatial extent at most $w \/ 2$.]
  #emph[For bounded local observables $F \, G$ on the plane whose supporting time slabs are separated by $d gt.eq 0$ transfer edges, 
#[#set math.equation(numbering: n => "(1.116)")
 $ \| "Cov"_(omega_(beta_N)) \( F \, G \) \| lt.eq ∥F∥_oo ∥G∥_oo e^(- c d \/ \( M_0 L^N \)) . $ <eq:orig-26>]

 The constant in this last estimate may be taken to be $c = log 2$.]
] <thm:trace-uniform>

#proof[
  First compare $\( n \, w \)$ with $\( 2 n \, w \)$. Both torus expectations are within $2 ∥F∥_oo s_(n \/ 2) \( w \)$ of the cylinder expectation at circumference $w$, by (1.114). The auxiliary aspect $\( u_1 \/ 2 \, u_2 \)$ and Proposition 28 give
  $ s_(n \/ 2) \( w \) lt.eq e^(p \( n \/ 2 \, w \)) - 1 lt.eq e^(Delta_(beta_N) \( n \/ 2 \, w \)) - 1 lt.eq C e^(- c 2^k) . $
  Next compare $\( 2 n \, w \)$ with $\( 2 n \, 2 w \)$, applying the same argument in the spatial direction. The needed excited trace has running length $w \/ 2$ and transverse circumference $2 n$; it is bounded using $q \( 2 n \, w \/ 2 \) lt.eq Delta_(beta_N) \( 2 n \, w \/ 2 \)$ and the auxiliary aspect $\( 2 u_1 \, u_2 \/ 2 \)$. Thus consecutive simultaneous doublings differ by at most $C ∥F∥_oo e^(- c 2^k)$. Sum this estimate over all subsequent doublings. At fixed $N$, the limit is the periodic infinite-plane state from Section 1, giving (1.115).
  For completeness, this identification also holds for bounded measurable local observables. At fixed cutoff and fixed finite support, nearest-neighbour conditional densities give a uniform upper bound, independent of the enclosing torus, for the marginal density relative to product area measure. Approximation in that reference measure extends the identity from continuous to bounded measurable observables. The direct transfer estimates above already have the same supremum-norm bound for such observables.
  Now close time with a spatial shift $s in bb(Z) \/ w bb(Z)$. Let $U_s$ be its unitary action on $L^2 \( \( S^2 \)^w \)$. Translation invariance gives $U_s T_w = T_w U_s$. Simplicity and positivity of the ground state give $U_s Omega_w = Omega_w$. Choosing the closing seam outside the supporting slab, the normalized partition function and the inserted numerator are
  $ "Tr" \( T_w^n U_s \) \, #h(2em) "Tr" \( A_F T_w^(n - r) U_s \) . $
  Their ground-state contributions are $1$ and $omega_w \( F \)$, respectively, and their remaining contributions have absolute values at most $s_n \( w \)$ and $∥F∥_oo s_(n - r) \( w \)$. The half-period bound just proved ensures $s_n \( w \) < 1 \/ 2$. Consequently
  $ \| mu_(beta_N \; n \, w)^(\( s \)) \( F \) - omega_w \( F \) \| lt.eq 4 ∥F∥_oo s_(n \/ 2) \( w \) . $
  Comparison with the unshifted torus, followed by (1.115), proves the assertion for shifted closing conditions, uniformly in $s$.
  Finally put $n_0 = M_0 L^N$. The square reference-box test and (1.113) imply, at every circumference $w = 2^k n_0$,
  $ ∥T_w^d - P_w∥ lt.eq e^(- \( log 2 \) d \/ n_0) . $
  For two ordered slab insertions on the cylinder,
  $ "Cov"_(omega_w) \( F \, G \) = chevron.l Omega_w \, A_(overline(F)) \( T_w^d - P_w \) A_G Omega_w chevron.r . $
  The insertion norm estimate therefore proves (1.116) on these cylinders with $c = log 2$. Equation (1.114), using the half-period trace bound, identifies their local limits with the square-torus limit. Passage to that limit proves the assertion on the plane. ◻
]

===== 1.7.4 A uniform physical gap <a-uniform-physical-gap>

The slab estimate controls the whole transfer spectrum, because it applies to all bounded local observables. Its spectral consequence is therefore stronger than a bound on the spin two-point function alone.

#thm([Corollary 1.27.])[
  (A uniform physical gap).  #emph[For $N gt.eq K_0$, let $cal(T)_N$ be the one-step transfer contraction in the reflection-positive Hilbert space of $omega_(beta_N)$, and let $Omega_N$ be its vacuum vector. Then 
$ "spec" #scale(x: 120%, y: 120%)[\(] cal(T)_N \|_(Omega_N^perp) #scale(x: 120%, y: 120%)[\)] subset [0 \, e^(- \( log 2 \) \/ \( M_0 L^N \))] . $

 At lattice spacing $a_N = L^(- N)$, the lower energy scale in physical units is consequently 
#[#set math.equation(numbering: n => "(1.117)")
 $ 1 / a_N frac(log 2, M_0 L^N) = frac(log 2, M_0) > 0 . $ <eq:trace-physical-scale>]

]
] <cor:trace-physical-gap>

#proof[
  Link reflection positivity follows from positive semidefiniteness of the crossing-bond kernel $e^(beta s dot.op s')$; site reflection positivity follows by conditional factorization across the fixed row. Both pass to the periodic plane limit and make $cal(T)_N$ a positive semidefinite self-adjoint contraction. A centered bounded local observable creates a vector whose transfer autocorrelation is the covariance of two reflected slabs. Equation (1.116) bounds this autocorrelation by $C_psi e^(- \( log 2 \) j \/ \( M_0 L^N \))$, with $C_psi$ depending on the vector and its slab thickness. The spectral measure is positive. Positive mass on any interval $\[ r \, 1 \]$ with $r > e^(- \( log 2 \) \/ \( M_0 L^N \))$ would give a lower bound proportional to $r^j$, contradicting that decay. Centered bounded local vectors are dense in the vacuum orthogonal subspace. Boundedness of spectral projections therefore gives the asserted exclusion for the whole subspace, as in . Dividing the negative logarithm of a nonzero transfer spectral value by $a_N$ gives the physical energy bound (1.117). ◻
]

The constants and the physical volume threshold have been fixed before removing the cutoff. Continuum convergence is established in Section 9; Section 10 then transfers this cutoff-independent positive scale to the continuum Hamiltonian.

===== 1.7.5 Tilted periods <tilted-periods>

The only nonrectangular periods needed in the construction are covered by the shifted closing condition in Theorem 29. Let $M = 2^k M_0$. A square of physical side $5 M$ tilted by $O_(+)$ has period vectors

$ a = M \( 3 \, 4 \) \, #h(2em) b = M \( - 4 \, 3 \) $

in the regulator axes, with coordinate pairs in this paragraph written as $\( upright("space") \, upright("time") \)$. The integer change of basis

$ 3 a - 4 b = \( 25 M \, 0 \) \, #h(2em) a - b = \( 7 M \, M \) $

has determinant one. The same torus therefore has spatial circumference $25 M$, time height $M$, and a spatial shift $7 M$ upon closing time. Dividing by $a_N = L^(- N)$ makes all periods and shifts integers. Reflected versions, including $O_(-)$ in the other regulator frame, have the same circumference and height, with a possibly different shift. A fixed compact physical support has a lift satisfying both extent bounds for all sufficiently large $k$, uniformly in $N$. Thus the finite list containing $\( 1 \, 25 \)$ and its auxiliary aspects supplies all the tilted-torus comparisons needed later.

==== 1.8 Exact renormalization of the spin sources <sec:sources>

The estimates obtained so far concern densities and partition functions. To construct fields, we must also compare local observables at different cutoffs. We do this by carrying independent sources through the exact block integration. The coefficient of the linear spin source determines the field normalization. The coupling prescription of Section 5 remains the prescription at zero source.

Throughout this section a step has side factor $l = L$ or $l = L_(*) = 5 L$ and maps layer $j$ to layer $j - 1$. We use the scales and graph norms of Section 4; in particular $k = 8$, and

$ R_j := H_j^(- 1 \/ 10) . $

The estimates in this section require no information about the infinite-volume state. They apply in bulk and on every compatible period admitted in Section 3.

===== 1.8.1 The source class and the exact step <the-source-class-and-the-exact-step>

At each site $x$ let $z_x = \( z_x^1 \, z_x^2 \, z_x^3 \) in bb(C)^3$ be an independent variable. For a power series $F \( q \; z \) = sum_alpha F_alpha \( q \) z^alpha$, where $alpha$ ranges over finitely supported multi-indices in the site and component variables, its coefficient norm at radius $r$ is

$ \[ F \]_(k \, j \; r) := sum_alpha r^(\| alpha \|) \[ F_alpha \]_(k \, j) . $

The same convention applies to supremum and activity norms. A coefficient of a regular function is measured on its graph domain; a covering activity is measured by its supremum. We omit $r$ when $r = 1$. Absolute coefficient sums form a product majorant: products are bounded by coefficient convolution before any integration or graph summation. In particular, identifying source variables does not increase this norm.

We adjoin to a density in the class of Section 4 the exponent

$ sum_x z_x dot.op q_x + sum_X 1_X G_X \( q \; z \) $

and source-dependent covering activities $k_lambda^(upright("src")) \( q \; z \)$. Every $G_X$ and $k_lambda^(upright("src"))$ has positive source degree. The graph domain of $G_X$, its load $s_X$, and its mask $1_X$ are those of a regular error. Its complete support includes every source site appearing in it. Covering labels retain their nonempty inventories of bad bonds and their complete spin and source dependencies. All masks test spin chords only; they impose no condition on a source variable.

The source lists satisfy

#[#set math.equation(numbering: n => "(1.118)")
 $ sup_o sum_(X upright(" anchored at ") o) e^(A s_X) \[ G_X \]_(k \, j) lt.eq R_j \, #h(2em) ∥k^(upright("src"))∥_(j \, A) lt.eq w_j . $ <eq:orig-27>]

We may separate a regular list by degree or by its multiset of source indices. Each such record is anchored at one of those indices; in degree one this is the unique source site. Bulk and nonwinding degree-one regular functions vanish when all their spin arguments are equal. No such normalization is imposed on winding records, and no alignment normalization is imposed in higher source degree. In particular, a spin-independent term of degree at least two stays in its source-supported regular record; it is not extracted as a volume scalar. The classifications as short or winding apply to the source indices and anchors as well as to the spin dependencies.

The lists inherit the spatial covariance conventions of the source-free class. In particular they are translation covariant as lists in independent source variables: translating a complete record, its anchor, and all of its spin and source indices leaves its coefficient function unchanged after the corresponding relabeling of the arguments. Thus a specialization to finitely many nonzero sources need not be translation invariant, but the bulk rule that produces its coefficients is translation covariant. The preparations, record assignments, and normalization rule are also reflection covariant as a family of prescriptions. A reflection preserves the standard prescription and exchanges the two mirror inclined prescriptions, with their reflected input lists. The same conventions apply to regular and covering source records.

The lists have real coefficients and are covariant under simultaneous internal $O \( 3 \)$ transformations of spins and sources. They are organized by retaining the full vector or tensor polynomial associated with a multiset of source sites, including all its component coefficients. Thus covariance is imposed on a tensor contribution, not on each scalar component separately. No tensor norm with an uncontrolled dependence on the source degree is used. At the initial layer the source factor is simply $exp \( sum_x z_x dot.op q_x \)$, so the two additional lists are zero and all these conditions hold.

#thm([Proposition 1.28.])[
  (Exact source step).  #emph[Consider an admitted source-free step of Section 4 from layer $j$ to layer $j - 1$, with precise coupling $b in \[ H_j \/ 2 \, 2 H_j \]$, together with source lists satisfying Equation (1.118) and the normalization and support conditions above. There is a real number $c_j > 0$, determined by the bulk linear response, such that 
#[#set math.equation(numbering: n => "(1.119)")
 $ z_x = frac(z'_(\[ x \]), l^2 c_j) \, #h(2em) \| c_j - 1 \| lt.eq C_L R_j \, $ <eq:orig-28>]

 gives an exact output representation with leading exponent $sum_Y z'_Y dot.op V_Y$ and renewed source bounds Equation (1.118) at layer $j - 1$. The source-free output is exactly the output at zero source. No further source-dependent volume scalar is extracted.]
  #emph[For two compatible inputs to a regular step, let $u \, lambda \, epsilon.alt_h$ be the source-free discrepancies of Equation (1.76). Let $u_s$ be a fixed positively weighted sum of the regular and covering source discrepancies divided by $R_j$ and $w_j$, respectively; the regular discrepancy is measured through order $k - 1$, with absent records padded by zero. The weights can be chosen so that, for some $q_s < 1$, 
#[#set math.equation(numbering: n => "(1.120)")
 $ u'_s & lt.eq q_s u_s + C_L \( log H_j \)^D #scale(x: 120%, y: 120%)[\(] u + epsilon.alt_h + \| lambda \| \/ H_j #scale(x: 120%, y: 120%)[\)] \,\
\| c_(2 \, j) - c_(1 \, j) \| & lt.eq C_L R_j [u_s + \( log H_j \)^D #scale(x: 120%, y: 120%)[\(] u + epsilon.alt_h + \| lambda \| \/ H_j #scale(x: 120%, y: 120%)[\)]] . $ <eq:orig-29>]

 These estimates hold in bulk and simultaneously on the compatible admitted periods. The fixed exponent $D$ may depend on $P_0$. The order of choices is a sufficiently large $L$, then $P_0$ large enough for the fixed polynomial losses, and finally sufficiently large $H$.]
] <prop:source-step>

#proof[
  We first integrate after the substitution $z_x = z'_(\[ x \]) \/ l^2$, leaving the final scalar division for the end of the proof. We estimate the output at source radius $2$; any fixed finite collection of such radii can be used by increasing $L$. A coefficient of degree $a$ then gains $\( 2 \/ l^2 \)^a$. Since each block has $l^2$ sites and $T_x = V_(\[ x \])$, subtracting the coarse leading exponent gives the identity
  $ 1 / l^2 sum_x z'_(\[ x \]) dot.op q_x = sum_Y z'_Y dot.op V_Y + 1 / l^2 sum_x z'_(\[ x \]) dot.op \( q_x - T_x \) . $
  It remains to integrate the second term together with the old source lists.
  ======= 1.8.1.1 Preparation of the source factors. <preparation-of-the-source-factors.>
  Write $M = frak(m)_j$, $p = p_j$, and $g = b^(- 1 \/ 2)$. We use the sector integration of Section 4. A core is one of its connected exceptional regions, with load $s_c$ and the Gaussian read set appearing in Equation (1.78). A prepared letter is the exponential-minus-one factor used in that integration. There are three additional sorts of factor.
  First consider the term containing $q_x - T_x$. All such factors whose sites lie within distance $12 M$ of a core’s seeds are included in that core factor. If these neighborhoods overlap, each site is assigned once, using the ownership convention of Section 4. The attached profiles are extended to any new exterior variables read by these factors. The absolute source series contributes at most $exp \( C_L M^D s_c \)$ to the core envelope; without spin derivatives the bound is $exp \( C_L M^2 s_c \)$. This is paid by the exceptional reserve $exp \( - c_L p^2 s_c \)$ in Equation (1.78), after the prescribed choice of $P_0$ and $H$. These core factors may depend on the actual spin variables.
  Away from those neighborhoods, choose a smooth angular plateau containing every full-sector value of $q_x - T_x$ and write its exponential as one plus a letter. The letter vanishes at angle zero, and the plateau gives $\| q_x - T_x \| lt.eq C_L t_j$. Consequently its majorant, through the required normalized spin derivatives, is
  #[#set math.equation(numbering: n => "(1.121)")
   $ C_L g "poly" \( M \, p \) . $ <eq:orig-30>]
  The mean estimates in Section 4 give the same order for those derivatives. Gaussian polynomials produced by a fixed number of differentiations are covered by its joint estimates. The new reads are the site, its block reference, and the attached profiles; in the remote preparation they also include the stencil deciding the selection status. These are already contained in the halos, core footprints, and status conventions of the sector construction. We use its local extension for a term with no output bad-bond flag.
  Second, prepare a masked $G_X$ as an old regular error, with the graph cutoff in the remote case and with exponential-minus-one expansion. The preparations in use its small norm, its graph domain, and its complete supports; they do not use the affine-Hessian normalization of a source-free error. In a linear use, the coefficient majorant retains the substitution factor $\( 2 \/ l^2 \)^a$. Nonlinear powers are bounded by products. The summed majorants at a support hit, including each of the fixed larger output load exponents required below, are at most $C_L "poly" \( M \, p \) R_j$. A nonremote measurable evaluation still meets its core. Changing the anchor of a spin direction to the chosen source anchor costs only fixed powers of $M$ and the total load, also in a discrepancy estimate. No source integration domain is being translated.
  Third, the positive-degree parts of old covering labels are prepared by the same activity estimates. The substitution and Equation (1.118) satisfy those activity hypotheses with at most a fixed combined factor. Every such use still meets a primary exceptional object. Terms with a nonempty output inventory require positive-degree supremum bounds only, without spin derivatives.
  ======= 1.8.1.2 Absolute coefficient sums and exact reassembly. <absolute-coefficient-sums-and-exact-reassembly.>
  For clarity, all product estimates are applied after taking absolute coefficient majorants and performing coefficient convolution. The majorant of an exponential is the exponential series of the majorant of its exponent. For nonlinear powers of a masked $G_X$, its undifferentiated envelope is small before cutoff derivatives are charged. At most $k$ factors can receive derivatives. Their Leibniz placements cost a polynomial in the number of factors, so the one-factor bounds above remain valid with an additional $C_L "poly" \( M \, p \, 1 + s_X \)$ multiplier where required. The passage from anchor sums to support-hit sums uses the fixed projection powers and spare support exponent exactly as for old errors.
  Repeated source variables cause no change in this argument. Factorization of separate contributions is determined by their complete supports, not by disjointness of their source monomials. Inside a core, coefficient supremum sums of exponent powers have the core envelope already obtained; differentiation through the transport produces only its fixed polynomial score costs. Thus the hypotheses of and hold in the coefficient norm. Each argument mark is retained in the output graph. A singleton transfer inherits its source anchor. Any other connected term is anchored at one of its source marks. If covariance requires several anchor choices, split the term with nonnegative coefficients summing to one and identical complete records, or retain its ordered marks. This operation incurs no loss growing with source degree.
  Apply the exact connected reassembly to these lists. Keep every zero-degree prescription fixed. In particular, the scalar extraction, canonical normalization, and error reset are first performed at degree zero, including their exact gas recombinations. Their output is the source-free output. The remaining exact algebra produces regular and covering lists of positive source degree. Connected source terms with an output bad-bond flag retain the stronger activity bound $o \( w_(j - 1) \)$.
  We next separate the part that needs a contraction estimate from the terms that are small by order. A regular output term using Equation (1.121) is bounded by $C_L g "poly" \( M \, p \)$. A term containing a new core decoration or an old positive-degree covering activity has arbitrary-power accuracy in $g$. A term using two or more $G_X$ factors is bounded by $C_L "poly" \( M \, p \) R_j^2$. The same bound applies when one $G_X$ is accompanied by an ordinary source-free correction or failure factor, since its order in $g$ is smaller than $R_j$ at large $H_j$.
  Here these order statements concern summed lists, not just an individual term. Outside cores and exceptional terms, the integrated and Mayer-log expansions have summed source-free envelopes $O_L \( g "poly" \( M \, p \) \)$, together with errors of still smaller cap. Inflate each marked majorant by the inverse of its claimed order in $g$ or $R_j$, divided by $C_L M^(D') p^(D')$ with a sufficiently large fixed $D'$. The summed hit bound, including reserved output exponents, remains $o_L \( M^(- 2) \)$. The tree estimate therefore preserves the marked powers. This also treats quadratic and higher terms from the exponential of a single regular source function. In a compulsory core the source series is charged inside the core factor, where its exceptional reserve remains available; it is not treated as a small optional envelope. The same estimate applies to the subsequent list operations and mask regroupings, using their spare support exponents. Those regroupings can carry source degree only in covering terms, apart from the linear-source normalization performed below.
  The terms not covered by these small-order estimates are the isolated linear transfers of old $G_X$. They are the empty-pattern Gaussian expectations of , with the projected spin formula of Section 4, with $G_X$ in place of the old error, and with each source index specialized to its coarse index. Their old cutoffs, required output graph, and output mask are retained.
  ======= 1.8.1.3 The isolated transfer in higher source degree. <the-isolated-transfer-in-higher-source-degree.>
  For degree at least two, the anchored norm of the isolated transfer, with any fixed required larger output exponent, is
  #[#set math.equation(numbering: n => "(1.122)")
   $ #scale(x: 120%, y: 120%)[\(] C \/ L^2 + o_H \( 1 \) #scale(x: 120%, y: 120%)[\)] R_j . $ <eq:orig-31>]
  There is no Taylor normalization in this assertion. Each coarse source anchor has $l^2$ possible old anchors, whereas a degree-$a$ coefficient gains $\( 2 \/ l^2 \)^a$. For $a gt.eq 2$ their product is at most $4 \/ l^2$. It remains to check that composition with the spin map has a leading bound fixed before $L$ is chosen.
  Use the Gaussian guard from the proof of Equation (1.80), including the normal component. For $s_X lt.eq L^(1 \/ 4)$, the old cutoff is on its plateau. The absolute first jet of $q_x$, measured in the old normalized direction norm, is bounded by the row of $P_h$ with its weighted moments. Its leading constant is independent of $L$. Differentiating the tangent projection of the fluctuation gives an extra $t_j$; higher derivatives of the spin map also have an extra $t_j$, with fixed powers of $M$ at fixed $L$. The value itself requires only a supremum estimate. The projected short load, including the necessary output halo, is bounded by a constant independent of $L$, as in . Thus composition and the fixed output load weight contribute a fixed multiplier.
  For $s_X > L^(1 \/ 4)$, the direct composition estimate from Equation (1.80) has a fixed polynomial in $1 + s_X$. The unused old support exponential pays this polynomial and the anchor count. At every load the guard complement costs an exponentially small Gaussian tail times fixed polynomial losses. After listing these losses, choose $P_0$ and then $H$ so that they are negligible. Summing the old coefficients proves Equation (1.122).
  ======= 1.8.1.4 The isolated transfer in degree one. <the-isolated-transfer-in-degree-one.>
  For degree one the corresponding bound is
  #[#set math.equation(numbering: n => "(1.123)")
   $ #scale(x: 120%, y: 120%)[\(] C \/ L + o_H \( 1 \) #scale(x: 120%, y: 120%)[\)] R_j . $ <eq:orig-32>]
  High loads are again paid by their spare support exponential. For a short label, write its degree-one coefficient as a vector function relative to its old anchor spin. This vector vanishes at alignment. On the same guard, the predicted relative spin values without Gaussian perturbation have old normalized size $C \/ L + o_H \( 1 \)$, by the relative-map estimate used in Equation (1.80) and . The retained Gaussian perturbation adds at most $C_L max \| Z \| \/ p$, with fixed powers of $M$ independent of $P_0$. Its expectation is $o_H \( 1 \)$: there are $O_L \( M^D \)$ read coordinates, so either a union estimate or the sum of their fixed marginal moments suffices after the choice of $P_0$.
  Apply a mean-value estimate between the aligned configuration and the guarded spin configuration. Both the guarded chords and this interpolation remain strictly in the graph domain through $4 t_j$. The value of the integrated vector function therefore has the factor $C \/ L + o_H \( 1 \)$. This estimate precedes the anchor summation; the degree-one substitution contributes $2 \/ l^2$, canceling that summation’s $l^2$ factor up to a constant.
  For positive-order derivatives, each first derivative of the relative map has the same $C \/ L + o_H \( 1 \)$ bound on the guard, and every higher derivative is $o_H \( 1 \)$. Moving the old anchor may also rotate the vector as a whole. Internal covariance expresses this by a local smooth rotation of the resulting vector; every normalized derivative falling on that rotation contains a factor $t_j$ times fixed polynomial losses, for which the input supremum is sufficient. Thus no derivative above order $k$ is needed. This proves Equation (1.123).
  The same two singleton arguments apply to input differences through order $k - 1$. A change of Gaussian map or kinetic history acting on an unchanged input uses one additional input derivative, at most order $k$, and costs $C_L "poly" \( M \, p \) R_j$ times $u + epsilon.alt_h + \| lambda \| \/ H_j$. The estimates therefore retain their input contraction and the required map forcing.
  ======= 1.8.1.5 Difference estimates for the other terms. <difference-estimates-for-the-other-terms.>
  The one-difference joint estimates of Section 4 apply to the prepared source letters as well. They preserve the order in Equation (1.121), with an additional $C_L "poly" \( M \, p \)$ factor multiplying $u + epsilon.alt_h + \| lambda \| \/ H_j$. In particular, changing $g$ costs $O_L \( g \| lambda \| \/ H_j \)$ in that angular factor. For a masked source function, the same assertion uses its old graph norm and the composition estimate just described. Powers of $g^(- 1)$ from hard transports are charged only against exceptional reserves. Consequently exceptional terms retain arbitrary-power accuracy or their stronger output-inventory price.
  A difference in one of two or more regular source factors gives the nonlinear bound $C_L "poly" \( M \, p \) R_j^2 u_s$. Marking the relevant factor in the inflated-majorant argument above proves the same bound for the entire connected list. At most $k - 1$ derivatives fall on a changed input, and at most $k$ on an unchanged input when its map changes. These are precisely the differentiated joint and tree hypotheses; no higher derivative is invoked.
  ======= 1.8.1.6 Extraction of the linear coefficient. <extraction-of-the-linear-coefficient.>
  Each bulk or corresponding short degree-one output term is $z'_Y dot.op F_X \( V \)$, anchored at its source site $Y$. If all spin arguments equal $v in S^2$, covariance gives $F_X \( v \, dots.h \, v \) = a_X v$ for a real scalar $a_X$. Indeed the stabilizer of $v$ fixes only its span, and transitivity makes the scalar independent of $v$. Use the exact identity
  $ 1_X z'_Y dot.op F_X = a_X z'_Y dot.op V_Y + 1_X z'_Y dot.op \( F_X - a_X V_Y \) - \( 1 - 1_X \) a_X z'_Y dot.op V_Y . $
  The middle term vanishes at alignment. Its norm is at most a fixed multiple of the original norm, since the anchored derivatives of $V_Y$ are bounded. The final term is an off-mask correction and is put in the covering gas by the exact normalization operation of .
  Sum the extracted coefficients per bulk anchor. Spatial translation covariance of the source lists makes this sum independent of the anchor. Together with the previous coefficient $1$ of the leading exponent, this gives $c_j$. Use that same bulk sum on every period. Actual winding terms are left unnormalized. When a bulk coefficient has been extracted without a corresponding short term on the period, retain its compensating one-site term as a winding entry. A one-site graph is allowed; alternatively it may be enlarged by nearby bonds with the corresponding off-mask correction. A missing bulk coefficient has complete length at least the winding threshold, so its spare reserved exponent pays this declared record. The classification includes the changes to the records themselves, exactly as in the source-free normalization. Winding spin functions are not required to vanish at alignment.
  Off-mask source corrections have the stated summed bounds with their complete support prices; passing from an anchor to a support hit costs only fixed powers of $M$. Contributions carrying an output bad-bond seed retain their $o \( w_(j - 1) \)$ activity under opening and regrouping. At zero source every operation in this paragraph is the identity, so it changes no source-free label. Equations (1.121)–(1.123) and their difference versions give $\| c_j - 1 \| lt.eq C_L R_j$ and the second estimate of Equation (1.120). In particular $c_j > 0$ for sufficiently large $H$.
  Finally divide all output source variables by $c_j$. The radius-$2$ bound controls this substitution at radius $1$, its differences, and the sum over all positive degrees. For a common scalar dilation, the extra degree factor in a difference is paid by the spare analytic radius. The leading exponent is now $sum_Y z'_Y dot.op V_Y$.
  To close the caps and discrepancies, divide the output bounds by $R_(j - 1)$ and $w_(j - 1)$. The isolated regular multipliers, including alignment subtraction and the fixed normalization costs, can be made strictly smaller than one by choosing $L$. Moreover,
  $ R_j / R_(j - 1) lt.eq 1 \, #h(2em) g / R_(j - 1) "poly" \( M \, p \) arrow.r 0 \, #h(2em) R_j^2 / R_(j - 1) "poly" \( M \, p \) arrow.r 0 quad \( H_j arrow.r oo \) . $
  The normalized gas discrepancy has its $o \( w_(j - 1) \)$ allowance. Changing the dilation on an already small positive-degree remainder gains the additional factor $R_j$ from the estimate on $c_j$. These observations give the first estimate of Equation (1.120) and renew Equation (1.118). All fixed caps and constants can be enlarged in the stipulated order; their finite sizes do not alter the leading constants in Equations (1.122) and (1.123). ◻
]

===== 1.8.2 Endpoint source convergence and the normalization product <endpoint-source-convergence-and-the-normalization-product>

The source step determines the field at every cutoff. Two consequences will be used separately: convergence at a fixed bottom layer, and a uniform comparison of the normalizations for the ordinary and inclined first steps.

#thm([Corollary 1.29.])[
  (Sources at a fixed bottom layer).  #emph[For the trajectory comparisons in Equation (1.89), the source discrepancy $u_s$ tends to zero at each fixed bottom layer, and the difference of the step coefficients $c_j$ tends to zero at each fixed bottom step. In every fixed compatible finite period, the resulting source exponents and covering activities converge in their coefficient norms, with the step dilations above that layer included.]
] <cor:source-endpoints>

#proof[
  At the top of a comparison, Equation (1.118) bounds the normalized source discrepancy by a fixed constant. Iterating Equation (1.120) gives a geometric factor $q_s$ on this initial discrepancy and a geometric convolution of the forcing from Equation (1.89). Fixed powers of the scale indices do not prevent that forcing from tending exponentially to zero at any fixed bottom layer. The second line of Equation (1.120) gives the assertion for each fixed step coefficient. On a fixed finite period, covering expansions converge absolutely, while masked regular functions are controlled by their supremum bounds. Thus their integrated source functions have the asserted comparison. No claim of uniformity in a growing volume is needed here. ◻
]

Write $c_(j \, N)$ for the coefficient of the step from layer $j$ in a standard run of depth $N$, and define

#[#set math.equation(numbering: n => "(1.124)")
 $ B_N := product_(j = 1)^N c_(j \, N)^(- 1) . $ <eq:field-normalization>]

This is the field normalization; the area factor $a_N^2$ will be included separately when fields are smeared. The product is positive and finite. Since $H_j$ grows linearly in $j$, Equation (1.119) gives $\| log B_N \| = O_(L \, H) \( 1 + N^(9 \/ 10) \)$, hence subexponential growth or decay in depth. Let $B_N^(*)$ denote the analogous product for an inclined run. The two mirror inclinations have identical step coefficients and identical $B_N^(*)$ by the reflection covariance of the bulk prescription.

#thm([Proposition 1.30.])[
  (Comparison of normalization products).  #emph[For the same bare coupling $beta_N$ in the standard run and either inclined run, there is a constant $C_(L \, H) < oo$, independent of depth, such that 
#[#set math.equation(numbering: n => "(1.125)")
 $ C_(L \, H)^(- 1) lt.eq B_N^(*) / B_N lt.eq C_(L \, H) . $ <eq:orig-33>]

]
] <prop:source-products>

#proof[
  Compare the bulk histories after their first steps. Their precise couplings satisfy $\| lambda_j \| lt.eq C_L$ by Equation (1.87). Put $x = N - 1 - j$. The history forcing in Equation (1.76) is bounded by $C_L H_N^D \( A_0 \/ L^2 \)^x$, after enlarging a fixed exponent $D$. The coupling forcing is at most $C_L \( log H_j \)^D \/ H_j$. Iteration of the shape inequality, together with its fixed cap, gives
  #[#set math.equation(numbering: n => "(1.126)")
   $ u_j lt.eq min { C \, C_L H_N^D rho_1^x } + C_L frac(\( log H_j \)^D, H_j) $ <eq:source-product-shape>]
  for some $rho_1 < 1$. A slightly larger geometric base absorbs geometric convolution factors. The second forcing has this same form after convolution: along the iteration the scale $H_j$ decreases, and its logarithmic ratio is eventually monotone, with finitely many initial values absorbed into the constant.
  Apply Equation (1.120) and clip $u_s$ by its cap in the same way. Enlarging $C_L \, D$ and $rho_1 < 1$ if needed, Equation (1.126) also bounds $u_s$ and $\| c_(j \, N)^(*) - c_(j \, N) \| \/ R_j$. The contribution from the second term is summable uniformly:
  $ sum_(j gt.eq 0) R_j frac(\( log H_j \)^D, H_j) = sum_(j gt.eq 0) frac(\( log H_j \)^D, H_j^(11 \/ 10)) < oo . $
  For the clipped first term, split the iteration after $J_N = ceil.l K log H_N ceil.r$ steps, with $K$ fixed and large. On the first $J_N$ steps, $H_j$ is comparable with $H_N$ for all sufficiently large $N$, so their total contribution is at most $C_(L \, H) H_N^(- 1 \/ 10) log H_N$. Thereafter use the unclipped geometric bound. Since $R_j lt.eq H^(- 1 \/ 10)$, this remaining sum is bounded by
  $ C_(L \, H) H_N^D sum_(x gt.eq J_N) rho_1^x lt.eq C_(L \, H) H_N^(D + K log rho_1) . $
  Choose $K$ so that the last exponent is negative. Finitely many small depths cause no problem. The single initial step is controlled directly by Equation (1.119). We have proved
  $ sum_(j = 1)^N \| c_(j \, N)^(*) - c_(j \, N) \| lt.eq C_(L \, H) . $
  All coefficients lie in a fixed positive neighborhood of one, so the same estimate holds for the sum of their logarithmic differences. Exponentiating proves Equation (1.125). The proof does not require the inclined terminal coupling to equal the terminal coupling of the standard run. ◻
]

==== 1.9 Continuum and infinite-volume limits <sec:continuum>

The source estimates provide convergence on descendants of fixed coarse cells. We first obtain bounds that allow these cells to approximate arbitrary test functions. The trace estimates then identify the infinite-volume limit, and comparison of the two inclined blockings supplies the rotations absent from the microscopic lattice.

Write $a_N = L^(- N)$ and let $B_N > 0$ be the field normalization in Equation (1.124). For a compactly supported function $f : bb(R)^2 arrow.r bb(R)^3$, define

#[#set math.equation(numbering: n => "(1.127)")
 $ phi.alt_N \( f \) = B_N a_N^2 sum_(x in Lambda_N) f \( x \) dot.op q_x \, $ <eq:smeared-lattice-field>]

where $Lambda_N$ is the physical lattice, with its specified origin and orientation. On a torus the sum uses its periodic lattice and a periodic test function. Scalar tests of a specified component have the same meaning. For component indices $bold(alpha) = \( alpha_1 \, dots.h \, alpha_n \) in { 1 \, 2 \, 3 }^n$, introduce the lattice moment measure

#[#set math.equation(numbering: n => "(1.128)")
 $ S_(n \, N)^(bold(alpha)) = \( B_N a_N^2 \)^n sum_(x_1 \, dots.h \, x_n in Lambda_N) bb(E) #h(-0.16667em) [product_(i = 1)^n q_(x_i)^(alpha_i)] delta_(\( x_1 \, dots.h \, x_n \)) . $ <eq:lattice-moment-measure>]

The expectation will be taken either on one of the physical tori of Section 7 or in the periodic infinite-plane state at the same cutoff. These choices will always be indicated when they matter.

===== 1.9.1 Local moment bounds <local-moment-bounds>

A terminal cell is the set of microscopic descendants of one layer-zero site in a standard blocking. In physical coordinates it is a unit square, up to the choice of lattice boundary convention. We use the term unit box for any translate of a unit square in the regulator axes. On a torus, boxes are interpreted in a periodic coordinate chart; bounded-multiplicity coverings give the same estimates when a chart crosses a period.

#thm([Proposition 1.31.])[
  (Moment majorants).  #emph[For every $n gt.eq 1$ and every component array $bold(alpha)$, the measure $S_(n \, N)^(bold(alpha))$ is nonnegative. There is a constant $C$, independent of $N gt.eq K_0$, the axis torus in the exhaustion of Section 7, and the positions of the unit boxes, such that 
#[#set math.equation(numbering: n => "(1.129)")
 $ S_(n \, N)^(bold(alpha)) \( Q_1 times dots.h.c times Q_n \) lt.eq C^n n ! $ <eq:unit-box-majorant>]

 for all unit boxes $Q_1 \, dots.h \, Q_n$. The same bound holds in the periodic infinite-plane state.]
  #emph[For each fixed number $D$ of terminal cells, their component field sums have joint exponential moments in a neighborhood of the origin, uniformly in these cutoffs and axis tori. If $mu$ is the source-free terminal probability law and $z_Y in bb(C)^3$ is supported on at most $D$ terminal sites with $\| z_Y^alpha \| lt.eq 1$, their generating function differs from 
#[#set math.equation(numbering: n => "(1.130)")
 $ bb(E)_mu exp #h(-0.16667em) (sum_Y z_Y dot.op V_Y) $ <eq:orig-34>]

 by $o_H \( 1 \)$, uniformly for fixed $D$.]
  #emph[On each fixed tilted physical torus of Section 7, the exponential-moment bounds and Equation (1.129) hold with constants that may depend on that torus and on $H$, but remain independent of $N$.]
] <prop:moment-majorants>

#proof[
  For finite volume, expand each interaction factor as
  $ e^(beta_N q_x dot.op q_y) = product_(alpha = 1)^3 sum_(m gt.eq 0) frac(beta_N^m, m !) \( q_x^alpha q_y^alpha \)^m . $
  The expansion is absolutely convergent. After multiplication by any specified spin components, each single-site integral is zero if one coordinate has odd degree, and is nonnegative otherwise. Since $beta_N gt.eq 0$, every surviving term is nonnegative. This proves the first assertion, including repeated insertion sites and oblique periods. Positivity passes to the fixed-cutoff periodic plane limit.
  Let $J$ be a set of at most $D$ terminal sites, and let $C_Y$ be the microscopic descendants of $Y in J$. Iterating the exact source substitution of Proposition 31 identifies $z_Y$ with the coupling to the vector
  $ B_N a_N^2 sum_(x in C_Y) q_x . $
  At the terminal layer, write the source-dependent density, after its common bulk scalar has been removed, as
  $ e^(X \( V \)) e^(sum_(Y in J) z_Y dot.op V_Y + G \( V \; z \)) Xi_z \( V \) \, $
  where $e^X Xi_0$ has normalizer $Z$ and law $mu$. The source-anchor convention and the norm bound of Proposition 31 give
  $ sup_V \| G \( V \; z \) \| lt.eq D R_0 . $
  Indeed, a monomial that survives setting all sources outside $J$ to zero has its designated source anchor in $J$. The same specialization has a useful consequence for the gas: every surviving changed label has complete support meeting $J$. Its weighted activity difference therefore satisfies
  $ sum_lambda e^(2 s_lambda) ∥k_lambda \( z \) - k_lambda \( 0 \)∥_oo lt.eq D w_0 . $
  The original and source-dependent activities satisfy the combined site-hit hypothesis of Equation (1.92). Consequently
  $ 1 / Z integral e^X \| Xi_z - Xi_0 \| lt.eq e^(D w_0) - 1 . $
  Since $\| sum_J z_Y dot.op V_Y \| lt.eq 3 D$, subtracting Equation (1.130) from the normalized source integral gives
  #[#set math.equation(numbering: n => "(1.131)")
   $ lr(|bb(E) e^(sum_(Y in J) z_Y dot.op phi.alt_N \( C_Y \)) - bb(E)_mu e^(sum_(Y in J) z_Y dot.op V_Y)|) lt.eq e^(3 D) \( e^(D R_0) - 1 \) + e^(3 D + D R_0) \( e^(D w_0) - 1 \) \, $ <eq:localized-source-comparison>]
  where $phi.alt_N \( C_Y \) = B_N a_N^2 sum_(x in C_Y) q_x$ is vector-valued. The right side is $o_H \( 1 \)$ for fixed $D$. In particular the generating functions are bounded on a fixed complex polydisc, independently of volume and cutoff. This is a localized use of the integrated gas comparison: its bound depends on $D$, rather than on the torus volume.
  For one real component cell sum $X$, the bounds for $bb(E) e^X$ and $bb(E) e^(- X)$ imply $bb(E) e^(\| X \|) lt.eq C_0$. Thus $bb(E) \| X \|^n lt.eq C_0 n !$. If $X_i$ are component sums in possibly different terminal cells, Hölder’s inequality yields
  $ lr(|bb(E) product_(i = 1)^n X_i|) lt.eq product_(i = 1)^n \( bb(E) \| X_i \|^n \)^(1 \/ n) lt.eq C^n n ! . $
  The left side without absolute values is the mass of the corresponding product of cells. An arbitrary unit box is covered by a fixed number of terminal cells. Nonnegativity of the moment measure therefore extends the estimate to arbitrary translated products of unit boxes, with a fixed enlargement of $C$. This also shows that the estimates are unchanged by translating the microscopic origin. At a fixed cutoff, the cell sums are bounded local observables, so the estimates pass to the periodic plane state.
  For a fixed tilted torus, use standard blocking in the regulator axes. Its period lattice is divisible at every step, and its terminal volume is fixed. Absolute bounds on the regular exponent and on the covering activities from Sections 4 and 8 bound the source numerator in that volume. The small-cap lower bound for the source-free normalizer bounds the denominator away from zero after removal of the bulk scalar. This argument uses no reflection positivity of the tilted torus. It gives a finite bound depending on its fixed terminal volume and on $H$, uniformly in depth. The preceding exponential-moment and covering arguments now apply there as well. ◻
]

We record a direct consequence that will be used repeatedly. If real component tests $f_1 \, dots.h \, f_r$ have support in a fixed bounded region, then every real linear combination of their smeared fields has moments bounded by $C \( f \)^n n !$, uniformly over the cutoffs and axis tori under consideration. To see this, first bound an even moment by integrating the absolute test coefficients against the nonnegative component measures and applying Equation (1.129). Odd absolute moments follow by Cauchy–Schwarz from even ones, with an exponential change of the constant. These bounds imply exponential tails at a positive radius. On a fixed tilted torus the same conclusion holds with a torus-dependent constant.

===== 1.9.2 Convergence and comparison of orientations <convergence-and-comparison-of-orientations>

#thm([Proposition 1.32.])[
  (Continuum limit).  #emph[On every fixed axis or tilted physical torus used in Section 7, all joint moments of the fields $phi.alt_N \( f \)$ converge for continuous tests. Their finite-dimensional laws converge, and the limiting laws are determined by their moments. The moment measures converge on arbitrary continuous compactly supported tests in the insertion coordinates.]
  #emph[In the periodic plane state these assertions hold for compactly supported tests. The same plane limit is obtained by taking the continuum limit on the axis tori and then their exhaustion, or by taking any simultaneous sequence of cutoffs and axis tori for which both the cutoff depth and the doubling index tend to infinity.]
  #emph[Finally, let $O_(+)$ be the rotation with cosine $3 \/ 5$ and sine $4 \/ 5$. The plane limits obtained with regulator orientations $upright(bold(1))$ and $O_(+)^2$ have identical finite-dimensional laws when tested in the same physical coordinates.]
] <prop:continuum-limit>

#proof[
  #emph[Fixed tori and fixed coarse cells.] Fix a physical torus and a layer $j$. A test that is constant on the microscopic descendants of its layer-$j$ cells has an exact source representation at that layer. The coefficient multiplying each test value in the layer-$j$ source is
  #[#set math.equation(numbering: n => "(1.132)")
   $ L^(- 2 j) product_(i = 1)^j c_(i \, N)^(- 1) . $ <eq:regular-cell-source-multiplier>]
  Indeed, its microscopic coefficient is $B_N L^(- 2 N)$, while applying the source substitution through the first $N - j$ steps multiplies this by $L^(2 \( N - j \)) product_(i = j + 1)^N c_(i \, N)$. The definition $B_N = product_(i = 1)^N c_(i \, N)^(- 1)$ gives Equation (1.132).
  Corollary 32 and the density comparison Equation (1.89) imply convergence of the normalized source integrals near the source origin. The multiplier in Equation (1.132) also converges, because it contains a fixed number of factors. To justify taking ratios here, observe that at layer $j$ the torus has fixed volume. Absolute gas bounds and regular-exponent bounds control the numerator, and the small-cap lower bound controls the source-free denominator, uniformly in the original depth $N$. The common bulk scalar cancels from numerator and denominator. Thus source generating functions converge uniformly on a sufficiently small complex polydisc. Cauchy’s formula gives convergence of every joint moment of these cell tests.
  The layer-$j$ grids can be aligned across depths. One may choose the physical origins of the approximating lattices, or translate successive block partitions: their available shifts fill one ancestral block modulo the microscopic spacing. The period identifications are compatible with these choices. An origin error of size $O_L \( a_N \)$ has vanishing effect on any smooth test by the moment majorants and uniform continuity. More generally, the grids used in a Cauchy comparison may be chosen separately, since the dilation coefficients $c_(i \, N)$ and $B_N$ are independent of translations of the blocking.
  #emph[Approximation of continuous tests.] Every microscopic descendant of a layer-$j$ cell is within $C L^(- j)$ of its center. Replace each continuous test by its value at these cell centers. Its error on a fixed compact set is bounded by its modulus of continuity at $C L^(- j)$. To estimate a mixed moment, expand the difference of the two products by replacing one factor at a time. Nonnegativity of the component moment measures and Equation (1.129) bound each resulting term by that modulus of continuity times a constant independent of $N$. First let $N arrow.r oo$ with $j$ fixed, and then let $j arrow.r oo$. This proves convergence for continuous tests. Finite sums of product tests are uniformly dense in the continuous functions on a product of compact sets, and the total moment mass there is uniformly bounded. Hence the moment measures converge against every continuous compact test in the insertion coordinates.
  The factorial moment bounds give tightness of each finite list of smeared real fields. They also give uniform integrability of every fixed polynomial in that list. Any subsequential law consequently has the moments just obtained and an exponential moment in a neighborhood of zero. Such a law is determined by its moments: its moment generating function is analytic in that neighborhood, and its Taylor coefficients are those moments. Thus all subsequential laws coincide and the finite-dimensional laws converge.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-5.4, -1.125), (-5.4, 1.125), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.04, -1.125), (-5.04, 1.125), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-4.68, -1.125), (-4.68, 1.125), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-4.32, -1.125), (-4.32, 1.125), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-3.96, -1.125), (-3.96, 1.125), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-3.6, -1.125), (-3.6, 1.125), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-3.24, -1.125), (-3.24, 1.125), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.445, -1.08), (-3.195, -1.08), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.445, -0.72), (-3.195, -0.72), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.445, -0.36), (-3.195, -0.36), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.445, 0), (-3.195, 0), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.445, 0.36), (-3.195, 0.36), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.445, 0.72), (-3.195, 0.72), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-5.445, 1.08), (-3.195, 1.08), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((-4.32, 0), (-2.88, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-2.88, 0), [#text(size: 9pt)[$e_1$]], anchor: "west", padding: 0.1176cm)
  line((-4.32, 0), (-4.32, 1.44), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-4.32, 1.44), [#text(size: 9pt)[$e_2$]], anchor: "south", padding: 0.1176cm)
  content((-4.32, -1.71), [#text(size: 9pt)[First regulator#linebreak()orientation $0$]])
  line((0.234, -1.638), (-1.638, -0.234), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.585, -1.17), (-1.287, 0.234), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.936, -0.702), (-0.936, 0.702), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.287, -0.234), (-0.585, 1.17), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.638, 0.234), (-0.234, 1.638), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.234, -1.638), (1.638, 0.234), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.234, -1.287), (1.17, 0.585), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.702, -0.936), (0.702, 0.936), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.17, -0.585), (0.234, 1.287), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.638, -0.234), (-0.234, 1.638), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (0.864, 1.152), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0, 0), (-1.152, 0.864), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, -1.98), [#text(size: 9pt)[Common coarse frame#linebreak()orientation $theta$]])
  line((5.702, -0.7218), (3.542, -1.352), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.602, -0.3762), (3.442, -1.006), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.501, -0.0306), (3.341, -0.6606), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.4, 0.315), (3.24, -0.315), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.299, 0.6606), (3.139, 0.0306), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.198, 1.006), (3.038, 0.3762), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.098, 1.352), (2.938, 0.7218), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.672, -0.7776), (5.042, 1.382), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((5.326, -0.8784), (4.696, 1.282), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.981, -0.9792), (4.351, 1.181), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.635, -1.08), (4.005, 1.08), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.289, -1.181), (3.659, 0.9792), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.944, -1.282), (3.314, 0.8784), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((3.598, -1.382), (2.968, 0.7776), stroke: (paint: rgb("#d3d3d3"), thickness: 0.4pt, miter-limit: 10))
  line((4.32, 0), (3.917, 1.382), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((4.32, 0), (2.938, -0.4032), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((4.32, -1.71), [#text(size: 9pt)[Second regulator#linebreak()orientation $2 theta$]])
  line((-2.61, 0.225), (-1.665, 0.225), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-2.138, 0.4014), [#text(size: 9pt)[$+ theta$]], anchor: "south", padding: 0.1176cm)
  line((2.61, 0.225), (1.665, 0.225), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.138, 0.4014), [#text(size: 9pt)[$- theta$]], anchor: "south", padding: 0.1176cm)
  content((0, 1.935), [#text(size: 9pt)[$cos theta =3"/"5, sin theta =4"/"5$]])
})],
    caption: [Figure 2: The two inclined first blockings produce the same physical frame. Their relative inclinations are reflections of one another, so their scalar field normalizations agree. After the first step, common regular blockings erase the difference of their remaining data. The drawing shows orientations only; the first coarse spacing is $5 L$ times the microscopic spacing. ],
  ) <fig:orientations>
  #emph[The two inclined blockings.] Consider the fixed tilted square torus of side $5 M$ and axes $O_(+)$ from Section 7. Put one microscopic regulator in the standard axes and the other in axes $O_(+)^2$. In their respective axes use the inclined first steps $O_(+)$ and $O_(-) = O_(+)^(- 1)$. Their frames then agree, because $O_(+)^2 O_(-) = O_(+)$; Figure 2 shows these orientations. Both regulators have the same $beta_N \, a_N \, B_N$ and compatible periods.
  Stop at a fixed layer $j < N$. If $B_N^(*)$ and $c_(i \, N)^(*)$ denote the inclined source normalizations, the exact source multiplier is now
  #[#set math.equation(numbering: n => "(1.133)")
   $ 25 L^(- 2 j) B_N / B_N^(*) product_(i = 1)^j \( c_(i \, N)^(*) \)^(- 1) . $ <eq:inclined-cell-source-multiplier>]
  The factor $25$ comes from the area of the first block: the product of the area factors through layer $j$ is $25 L^(2 \( N - j \))$. Reflection covariance of the two inclined prescriptions makes the multipliers in Equation (1.133) identical. They are bounded at each fixed $j$ by Proposition 33 and the bounds on the individual $c_(i \, N)^(*)$. Convergence of the ratio $B_N \/ B_N^(*)$ is not required.
  Apply Equation (1.89) and Corollary 32 after the first step. At the fixed bottom layer, their generating functions differ by a quantity tending to zero uniformly near the source origin, also when evaluated at the common bounded multiplier (1.133). Explicitly, if $r_j > 0$ is a common coarse-source comparison radius and $M_j$ bounds that multiplier, restrict the physical cell sources to radius $r_j \/ \( 2 max { 1 \, M_j } \)$. Their substituted arguments then lie in radius $r_j \/ 2$ for every $N$, so uniform convergence and Cauchy’s formula apply on one fixed polydisc without convergence of the multiplier itself. The common cell centers can be chosen identical by translating the microscopic lattices. Their physical mesh can be fixed independently of $N$ at the chosen layer. Every assigned microscopic point lies in its inclined first cell, so the final descendants are within $C thin 5 L^(- j)$ of the common centers. The same continuous-test approximation therefore proves equality of the limiting moments, and hence of the finite-dimensional laws, on this fixed tilted torus. This step uses only the moment bounds for a fixed tilted size.
  #emph[Exchange of the cutoff and volume limits.] For real $t_1 \, dots.h \, t_r$ and compactly supported real tests $f_1 \, dots.h \, f_r$, set
  $ F_N = exp #h(-0.16667em) (i sum_(nu = 1)^r t_nu phi.alt_N \( f_nu \)) . $
  It is a bounded local microscopic observable with $\| F_N \| = 1$, regardless of the size of $B_N$. Once its support is contained in the prescribed interior portion of an axis torus at doubling index $k$, Section 7 gives
  #[#set math.equation(numbering: n => "(1.134)")
   $ lr(|bb(E)_(N \, upright("plane")) F_N - bb(E)_(N \, upright("torus") \( k \)) F_N|) lt.eq C e^(- c 2^k) \, $ <eq:characteristic-volume-comparison>]
  uniformly in $N gt.eq K_0$. The fixed-torus continuum limit has already been proved. The uniform moment bounds make the plane laws of this finite list tight. For any subsequential plane limit, taking $N arrow.r oo$ in Equation (1.134) bounds its characteristic function within $C e^(- c 2^k)$ of the same fixed-torus characteristic function. Sending $k arrow.r oo$ identifies every subsequential plane law. This proves plane convergence and identifies it with the successive torus and cutoff limit. The same inequality applied with $k = k \( N \) arrow.r oo$ gives every simultaneous axis exhaustion claimed in the statement. Uniform factorial moments give uniform integrability, so moments converge along these limits as well.
  For either regulator orientation, the trace-with-shift estimate of Section 7 gives Equation (1.134) also for the tilted tori. First take their fixed-size continuum limit, where the two orientations have just been compared, and then send the doubling index to infinity. The resulting plane characteristic functions agree. Because the comparison uses bounded characteristic functions, it requires no moment bound uniform in the increasing tilted physical size. ◻
]

===== 1.9.3 Euclidean symmetry and regularity <euclidean-symmetry-and-regularity>

Write $S_n^(bold(alpha))$ for the plane moment measures just constructed, and $S_n$ for the finite collection of their components. There is no pointwise prescription for these correlation functions; the following bounds specify their distributional meaning.

#thm([Proposition 1.33.])[
  (Euclidean regularity).  #emph[The plane correlation functions are nonnegative Radon measures componentwise, and for every scalar Schwartz test $F in cal(S) \( \( bb(R)^2 \)^n \)$ they satisfy 
#[#set math.equation(numbering: n => "(1.135)")
 $ \| S_n^(bold(alpha)) \( F \) \| lt.eq C^n n ! thin sup_(x in \( bb(R)^2 \)^n) #scale(x: 120%, y: 120%)[\[] \( 1 + \| x \|^2 \)^(2 n) \| F \( x \) \| #scale(x: 120%, y: 120%)[\]] . $ <eq:orig-35>]

 The lattice moment measures converge on Schwartz tests, with the same bound. Finite component norms can be incorporated by changing $C$. The limiting correlations have permutation symmetry, internal $O \( 3 \)$ covariance, and invariance under all Euclidean isometries of $bb(R)^2$. Bounds for products of separately translated tests are uniform in their separate translation parameters when the decay weights are centered at those parameters.]
] <prop:euclidean-regularity>

#proof[
  The compact-test convergence and positivity from Proposition 35 give nonnegative locally finite measures. Partition $bb(R)^2$ into unit boxes indexed by $u in bb(Z)^2$. On each such box the weights $\( 1 + \| x \|^2 \)^(- 2)$ and $\( 1 + \| u \|^2 \)^(- 2)$ are comparable by a fixed constant. Therefore Equation (1.129), followed by summation of these weights, gives
  $ \| S_n^(bold(alpha)) \( F \) \| lt.eq C^n n ! thin sup_(x_1 \, dots.h \, x_n) [product_(i = 1)^n \( 1 + \| x_i \|^2 \)^2 \| F \( x_1 \, dots.h \, x_n \) \|] . $
  Here the sum over product boxes factors into $n$ convergent sums, so its cost is exponential in $n$. Since $product_i \( 1 + \| x_i \|^2 \)^2 lt.eq \( 1 + sum_i \| x_i \|^2 \)^(2 n)$, this proves Equation (1.135). The proof applies uniformly to the lattice measures. Cutting off a Schwartz test outside a large compact set then gives convergence on Schwartz space: the weighted supremum of the discarded tail tends to zero. Replacing each weight by $\( 1 + \| x_i - y_i \|^2 \)^(- 2)$ proves the assertion concerning separate translations, with constants independent of $y_1 \, dots.h \, y_n$.
  Permutation symmetry and internal $O \( 3 \)$ covariance pass directly from the lattice. For a fixed physical translation, approximate its displacement by lattice displacements. The error on a smooth test tends to zero by the majorants and test-space continuity. Thus translation invariance also passes to the limit. The microscopic reflections and quarter turns similarly give reflection and square symmetry.
  Let $theta$ be the angle of $O_(+)$, so $cos theta = 3 \/ 5$. Rotating the entire regulator rotates the arguments of its moment functions. The last assertion of Proposition 35 therefore gives invariance under rotation by $2 theta$. This angle generates a dense subgroup of the circle. Indeed, if $theta \/ pi$ were rational, then $e^(i theta)$ would be a root of unity and $2 cos theta = 6 \/ 5$ would be a rational algebraic integer, hence an integer, a contradiction. The same irrationality holds for $2 theta \/ \( 2 pi \)$. Rotations act continuously on Schwartz test space; Equation (1.135) consequently extends this dense-subgroup invariance to all rotations. Together with reflections and translations this is Euclidean invariance. ◻
]

The fourth-cumulant test in Section 10 uses cell indicators before approximating them by smooth functions. The next estimate justifies that approximation and also allows the microscopic cell boundaries to move slightly with $N$.

#thm([Lemma 1.34.])[
  (Boundary strips).  #emph[Fix an order $n$, a bounded region $K subset bb(R)^2$, and a bounded axis rectangle $A$. Let $E_epsilon = K ∩ { x : "dist" \( x \, partial A \) < epsilon }$. In the plane, uniformly in $N gt.eq K_0$ and in the microscopic origin, 
#[#set math.equation(numbering: n => "(1.136)")
 $ S_(n \, N)^(bold(alpha)) \( E_epsilon times K^(n - 1) \) lt.eq C_(n \, K \, A) \( epsilon + a_N \) . $ <eq:boundary-strip-bound>]

 The same estimate holds on the axis tori, with the sets interpreted in fixed bounded periodic charts. It also holds with any one insertion in the strip. Consequently continuum convergence extends to products of bounded axis-box indicators, to smooth approximations of these indicators, and to cell boxes whose boundaries converge to the given box boundaries. More generally the same conclusion holds for bounded Jordan measurable sets.]
] <lem:boundary-strips>

#proof[
  Choose a fixed bounded relative-coordinate box $D$ containing $K - K$. Use coordinates in the regulator axes, so the full displacement lattice is $a_N bb(Z)^2$, regardless of the microscopic origin. On a torus evaluate translated spins periodically. For a lattice site $x$, define
  $ A_N \( x \) = \( B_N a_N^2 \)^n sum_(y_2 \, dots.h \, y_n in a_N bb(Z)^2 ∩ D) bb(E) #h(-0.16667em) [q_x^(alpha_1) product_(i = 2)^n q_(x + y_i)^(alpha_i)] . $
  For $n = 1$ the sum and product over the other insertions are empty. Every term is nonnegative. Microscopic translation invariance makes $A_N \( x \)$ independent of $x$; denote its value by $A_N$. Notice that all $n$ field-normalization factors and all $n$ lattice area factors are included in $A_N$.
  Let $Q$ be a fixed unit box. Summing the first insertion over its lattice sites and using positivity gives
  $ \# \( Q ∩ Lambda_N \) A_N lt.eq S_(n \, N)^(bold(alpha)) \( Q times \( Q + D \)^(n - 1) \) lt.eq C_(n \, K) . $
  The last inequality follows by a fixed unit-box covering and Equation (1.129). Since $\# \( Q ∩ Lambda_N \) gt.eq c a_N^(- 2)$, with a constant uniform over the lattice origin, we obtain $A_N lt.eq C_(n \, K) a_N^2$. If the first insertion is in $E subset K$, every choice of the other insertions in $K$ is included in this relative-coordinate sum. Hence
  #[#set math.equation(numbering: n => "(1.137)")
   $ S_(n \, N)^(bold(alpha)) \( E times K^(n - 1) \) lt.eq C_(n \, K) a_N^2 \# \( E ∩ Lambda_N \) . $ <eq:first-insertion-count>]
  For a fixed rectangle boundary, elementary lattice counting gives $a_N^2 \# \( E_epsilon ∩ Lambda_N \) lt.eq C_(K \, A) \( epsilon + a_N \)$, proving Equation (1.136).
  On a torus use the same displacement box $D$, with periodic evaluation of $x + y_i$. A fixed bounded displacement box can represent a periodic site more than once, but its multiplicity is bounded at the fixed physical scale under consideration. The unit-box argument and the moment bound therefore give the same estimate, with this fixed multiplicity included in the constant. Permutation symmetry treats any insertion coordinate.
  For completeness, if $A$ is merely bounded and Jordan measurable, the lattice squares centered at points of ${ "dist" \( x \, partial A \) < epsilon }$ are contained in the $\( epsilon + C a_N \)$-neighborhood of $partial A$. Thus the counting term in Equation (1.137) is bounded by a constant times the area of that neighborhood, which tends to zero as $epsilon arrow.b 0$ and $N arrow.r oo$. Continuous inner and outer approximations to the indicator now have arbitrarily small error in every fixed-order correlation. The error for a product of indicators is bounded by the sum of the errors with one argument in a boundary neighborhood. Compact-test convergence applies to the continuous approximants, and then the neighborhood widths tend to zero. The same argument covers moving boxes, since their symmetric differences lie in shrinking neighborhoods of the limiting boundaries. ◻
]

==== 1.10 Reconstruction, mass gap, and non-Gaussian correlations <sec:os>

Section 9 constructed the plane Schwinger functions $S_n$ and proved their Euclidean covariance and growth bounds. We now verify the remaining reconstruction hypotheses and transfer the uniform lattice decay estimate to the entire reconstructed Hilbert space. A separated four-point test will then show that the limiting field does not satisfy Wick’s rule.

Write $x = \( x^0 \, x^1 \)$, with $x^0$ the Euclidean time coordinate, and put $theta \( x^0 \, x^1 \) = \( - x^0 \, x^1 \)$. We use $phi.alt^a \( f \)$, $a in { 1 \, 2 \, 3 }$, for the limiting smeared fields supplied by Proposition 35. Expectations of polynomials in these variables are the corresponding pairings with the $S_n$. For $s in bb(R)$, set

$ \( tau_s f \) \( x^0 \, x^1 \) = f \( x^0 - s \, x^1 \) \, #h(2em) \( theta f \) \( x \) = f \( theta x \) . $

The same notation $tau_s$ denotes the induced translation of a field polynomial. Define $Theta phi.alt^a \( f \) = phi.alt^a \( overline(theta f) \)$ and extend $Theta$ multiplicatively and antilinearly to field polynomials.

===== 1.10.1 Reflection positivity and exponential clustering <reflection-positivity-and-exponential-clustering>

#thm([Lemma 1.35.])[
  (Reflection positivity).  #emph[Let $F$ be a polynomial in finitely many component fields $phi.alt^a \( f \)$, where the smooth compactly supported tests $f$ have support in ${ x^0 > 0 }$. Then 
#[#set math.equation(numbering: n => "(1.138)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] \( Theta F \) F #scale(x: 120%, y: 120%)[\]] gt.eq 0 . $ <eq:continuum-reflection-positivity>]

 This holds jointly for all three components. The Schwinger functions also satisfy the reality relations for a Hermitian multiplet and $S_0 = 1$.]
] <lem:reflection-positivity>

#proof[
  At every cutoff the nearest-neighbour measure is reflection positive across microscopic site and link seams. Since the union of the supports appearing in $F$ is a compact subset of the open positive half-plane, a microscopic seam within $O \( a_N \)$ of ${ x^0 = 0 }$ separates these supports from their reflections for all sufficiently large $N$. Evaluate $F$ on the renormalized lattice fields and reflect about this seam. Its reflection-positive quadratic form is nonnegative. The moment convergence of Proposition 35 applies to each of the finitely many terms in that form. Replacing the microscopic reflection by $theta$ changes the tests by a translation of size $O \( a_N \)$; Proposition 34 bounds the resulting moment errors, which tend to zero. Taking the limit proves (1.138). This argument permits arbitrary component indices and polynomial coefficients, so it proves joint positivity rather than separate componentwise positivity. Reality and normalization pass through the same moment limits. ◻
]

The next estimate retains an exponent independent of the polynomial. That uniformity will exclude low-energy states throughout the Hilbert space, even though the constants multiplying the exponential depend on the observables.

#thm([Proposition 1.36.])[
  (Polynomial slab clustering).  #emph[There is $m > 0$ with the following property. Let $F$ and $G$ be fixed polynomials in finitely many smooth compactly supported smeared component fields. If time translation separates the slabs containing their supports by a distance $R gt.eq 0$, then 
#[#set math.equation(numbering: n => "(1.139)")
 $ \| "Cov" \( F \, tau_s G \) #scale(x: 120%, y: 120%)[\|] lt.eq C_(F \, G) e^(- m R) . $ <eq:polynomial-slab-clustering>]

 The exponent $m$ is common to all such polynomials. The Schwinger functions satisfy the Euclidean clustering axiom also for Schwartz tests.]
] <prop:slab-clustering>

#proof[
  Let $X_(i \, N)$ denote the real smeared lattice fields entering the two polynomials, with the translations needed to place their slabs. Complex tests may first be split into real and imaginary parts. The factorial moment bounds of Proposition 34, uniformly in $N$ and in translations of each fixed test, imply that for some $epsilon > 0$
  #[#set math.equation(numbering: n => "(1.140)")
   $ sup_N bb(E) exp #scale(x: 180%, y: 180%)[\(] epsilon sum_i \| X_(i \, N) \| #scale(x: 180%, y: 180%)[\)] < oo . $ <eq:polynomial-exponential-tails>]
  Indeed, the even moment bounds give factorial bounds on all absolute moments by Cauchy–Schwarz. Summing the exponential series at a sufficiently small radius gives an exponential moment for each variable; Hölder’s inequality combines the finitely many variables. Neither radius depends on the translation of a test.
  For $M gt.eq 1$, let $T_M \( u \) = max \( - M \, min \( u \, M \) \)$ and form $F_(N \, M)$ and $G_(N \, M)$ by replacing every real smeared field by its truncation $T_M \( X_(i \, N) \)$. If the polynomial degrees are $d_F \, d_G$, then
  $ ∥F_(N \, M)∥_oo lt.eq C_F \( 1 + M \)^(d_F) \, #h(2em) ∥G_(N \, M)∥_oo lt.eq C_G \( 1 + M \)^(d_G) . $
  Equation (1.140) also gives
  #[#set math.equation(numbering: n => "(1.141)")
   $ ∥F_N - F_(N \, M)∥_(L^2) + ∥G_N - G_(N \, M)∥_(L^2) lt.eq C_(F \, G) e^(- c_(F \, G) M) \, $ <eq:polynomial-truncation>]
  with uniformly bounded $L^2$ norms for $F_N \, G_N$. To obtain this bound, expand the polynomial difference into terms supported on ${ max_i \| X_(i \, N) \| > M }$. Each term is bounded by a fixed polynomial in $sum_i \| X_(i \, N) \|$; the exponential moment absorbs its square and the tail indicator. Cauchy–Schwarz then shows that replacing the covariance by that of the truncated variables costs at most $C_(F \, G) e^(- c_(F \, G) M)$.
  The truncated variables remain bounded local lattice observables in the same slabs. Equation (1.116) supplies a fixed physical decay rate $mu > 0$. The number of microscopic edges between the slabs, multiplied by $a_N$, differs from $R$ by at most $O \( a_N \)$; this rounding cost is bounded uniformly. Consequently
  $ \| "Cov" \( F_N \, tau_s G_N \) \| lt.eq C_(F \, G) \( 1 + M \)^(d_F + d_G) e^(- mu R) + C_(F \, G) e^(- c_(F \, G) M) . $
  Set $M = 1 + R^2$. The polynomial prefactor in the first term is absorbed by $e^(mu R \/ 2)$, with a constant depending on the degrees. The second term is also at most a test-dependent constant times $e^(- mu R \/ 2)$. Thus the estimate holds with the common choice $m = mu \/ 2$. Moment convergence passes it to the limiting fields.
  Euclidean rotation invariance, proved in Proposition 36, gives clustering when one compact collection of insertions is translated to infinity in any direction. The constants can be kept uniform as that direction varies: the rotated tests have uniformly bounded suprema and supports in a common bounded set, so the unit-box moment bounds give a common radius in (1.140). Their polynomial degrees and coefficients are unchanged. To extend this assertion to Schwartz tests, first approximate them by compactly supported product tests. At every fixed order, the product-of-unit-box majorants used to prove Equation (1.135) bound the approximation errors uniformly in the translation: place the polynomial weights separately around the origins of the two translated collections. Finite sums of product tests are dense in the corresponding Schwartz test spaces. The same uniform bounds therefore allow approximation first and translation to infinity second, proving the full clustering axiom. ◻
]

===== 1.10.2 Osterwalder–Schrader reconstruction and the full gap <osterwalderschrader-reconstruction-and-the-full-gap>

#thm([Proposition 1.37.])[
  (Relativistic reconstruction).  #emph[The Schwinger functions $S_n$ reconstruct a tempered Wightman theory in $1 + 1$ dimensions with a three-component Hermitian scalar field. Its Hilbert space $cal(H)$ is positive, its fields are local, and its unitary representation of the Poincaré group satisfies the spectrum condition. The vacuum $Omega$ is unique and normalized. In the positive-time reflection realization of $cal(H)$, Euclidean time translations induce a strongly continuous semigroup $e^(- s H_(upright("phys")))$, $s gt.eq 0$, with $H_(upright("phys")) gt.eq 0$ and $H_(upright("phys")) Omega = 0$.]
] <prop:os-reconstruction>

#proof[
  We apply the Osterwalder–Schrader reconstruction theorem under the linear growth condition #cite(label("OS75")) Section IV.1. We specify its regularity hypothesis to make clear that the distributional construction in Section 9 suffices. For $F$ on $\( bb(R)^2 \)^n$, use the Schwartz seminorm
  $ \| F \|_p = max_(\| alpha \| lt.eq p) sup_x \( 1 + \| x \|^2 \)^(p \/ 2) \| partial^alpha F \( x \) \| . $
  The linear growth condition requires a bound $\| S_n \( F \) \| lt.eq sigma_n \| F \|_(s n)$ with fixed $s$ and $sigma_n lt.eq A \( n ! \)^D$ for fixed $A \, D$. Equation (1.135) gives this with $s = 4$: its weighted supremum is the zero-derivative part of $\| F \|_(4 n)$, and $C^n n ! lt.eq A \( n ! \)^D$ after increasing $A \, D$.
  Restricting to Schwartz tests flat on the coincidence diagonals (all derivatives vanish whenever $x_i = x_j$) gives precisely the test class defined in #cite(label("OS75")) Section II, following Equation (2.1), p. 284. Normalization and reality follow from Lemma 38; permutation symmetry and Euclidean invariance follow from Proposition 36; joint positive-time reflection positivity follows from the same lemma, extended by test-space continuity; and clustering is Proposition 39. These are the normalized Euclidean axioms with the required linear growth bound.
  The theorem applies to a finite Hermitian multiplet with scalar spacetime transformation law; see #cite(label("OS75")) Section I, Remark 5. More explicitly, the test functions carry indices $a_1 \, dots.h \, a_n in { 1 \, 2 \, 3 }$; reflection positivity holds for arbitrary combinations of these indices, while summing the component bounds costs at most an exponential factor in $n$, already allowed by the preceding factorial estimate. Thus the multilinear reconstruction has a single positive Hilbert space and the asserted three-component field. Clustering gives uniqueness of the vacuum. The positive-time reflection realization and its translation semigroup are part of this reconstruction. This application uses smeared distributions throughout and requires neither Euclidean point fields nor a prescription for equal-time products. ◻
]

The uniform exponent in Proposition 39 now controls every state generated by time-ordered fields. Positivity of spectral measures extends the resulting exclusion of low energies to the Hilbert-space closure. This is the same spectral implication as in ; we give the argument for the present reconstructed states.

#thm([Proposition 1.38.])[
  (Gap above the vacuum).  #emph[For the Hamiltonian in Proposition 40, the vacuum complement obeys 
#[#set math.equation(numbering: n => "(1.142)")
 $ H_(upright("phys")) \|_(Omega^perp) gt.eq m > 0 \, $ <eq:orig-36>]

 where $m$ is the common exponent of Proposition 39.]
] <prop:continuum-gap>

#proof[
  We first justify the density of states to which the slab estimate applies. Coincidence-flatness does not imply flatness on a surface where two times agree but the spatial coordinates differ. The positive position measures and Euclidean rotations nevertheless allow us to remove these surfaces in the reflection norm.
  Spacetime rotations act only on the insertion coordinates, since the three internal components are spacetime scalars. Thus each fixed-index component measure of $S_k$ is separately rotation invariant. For any such measure $mu_k$ and $i eq.not j$, set
  $ A_(i j) = { x : x_i^0 = x_j^0 \, med x_i eq.not x_j } . $
  Let $B$ be a ball centred at the origin in $\( bb(R)^2 \)^k$. It has finite $mu_k$-mass by Proposition 34 and is invariant under simultaneous spacetime rotations. For each configuration with $x_i eq.not x_j$, only finitely many rotation angles make the time component of $x_i - x_j$ vanish. Rotation invariance and Tonelli’s theorem therefore give
  $ mu_k \( A_(i j) ∩ B \) = frac(1, 2 pi) integral_B integral_0^(2 pi) upright(bold(1))_(A_(i j)) \( O_alpha x \) thin thin upright(d) alpha thin thin upright(d) mu_k \( x \) = 0 . $
  Here $O_alpha$ acts on every insertion coordinate. Increasing the ball shows that each equal-time surface has measure only on its full coincidence diagonal.
  The OS construction uses ordered positive-time tests; see #cite(label("OS75")) Section V, following Equation (5.2). One may also begin with all coincidence-flat tests supported in positive time. We show that their reflection completion is the same. Truncation at infinity and away from the time-zero boundary reduces this comparison to compactly supported tests in the latter class; the smooth positive-time support condition and rapid decrease justify these cutoffs in Schwartz topology, and the growth bounds imply continuity of the reflection form. Let $f_n$ be one of these compact tests, with the coincidence-flatness used in reconstruction, and write $\[ f_n \]$ for its class for the reflection form. Choose a smooth even function $chi_epsilon$ that is zero on $\[ - epsilon \, epsilon \]$ and one outside $\[ - 2 epsilon \, 2 epsilon \]$, with values in $\[ 0 \, 1 \]$, and put
  $ f_(n \, epsilon) \( x \) = f_n \( x \) product_(i < j) chi_epsilon \( x_i^0 - x_j^0 \) . $
  The difference $f_n - f_(n \, epsilon)$ tends to zero off the internal equal-time surfaces. Those surfaces have zero componentwise $S_(2 n)$-mass away from full coincidences, as just proved, and $f_n$ vanishes on the latter. In the reflection form the positive and reflected negative time arguments are separated from one another. The integrands defining the squared reflection norm of this difference thus tend to zero almost everywhere for every component measure of $S_(2 n)$. They are bounded by a fixed constant on a common compact set. Dominated convergence proves
  $ ∥\[ f_n \] - \[ f_(n \, epsilon) \]∥ arrow.r 0 . $
  This approximation is in the reflection norm; it does not assert Schwartz density after cutting equal-time surfaces.
  The support of $f_(n \, epsilon)$ lies in finitely many strict time chambers. Split it according to the ordering and use permutation symmetry, permuting component indices with insertion coordinates, to put each term in $0 < x_1^0 < dots.h.c < x_n^0$. A compact subset of this chamber is covered by finitely many product boxes whose time intervals are disjoint and ordered. A partition of unity and product-test approximation in these boxes give finite sums of products of smooth compactly supported one-field tests, converging in Schwartz topology and hence in reflection norm. Finite component sums obey the same argument. These compact time-ordered product states are dense in the OS space $cal(H)$, and the approximation also identifies the completion of the larger coincidence-flat positive-time test class isometrically with $cal(H)$.
  Let $F$ be a finite sum of products of smeared fields, with each product supported in strictly ordered, mutually disjoint positive-time intervals, as constructed above. Its test kernel is coincidence-flat. Write $\[ F \]$ for its reflection-space class in $cal(H)$ and set
  $ v = \[ F \] - bb(E) \[ F \] Omega . $
  These centered vectors are dense in $Omega^perp$, and their semigroup matrix elements are
  $ chevron.l v \, e^(- s H_(upright("phys"))) v chevron.r = bb(E) #scale(x: 120%, y: 120%)[\[] \( Theta F \) \( tau_s F \) #scale(x: 120%, y: 120%)[\]] - overline(bb(E) \[ F \]) bb(E) \[ F \] . $
  For all sufficiently large $s$, the reflected and translated supports lie in slabs separated by $s$ plus a fixed constant depending on $F$. Apply Proposition 39 with first observable $overline(Theta F)$ and second observable $F$, using the sesquilinear covariance convention of Section 7. It implies
  #[#set math.equation(numbering: n => "(1.143)")
   $ 0 lt.eq chevron.l v \, e^(- s H_(upright("phys"))) v chevron.r lt.eq C_v e^(- m s) . $ <eq:os-vector-decay>]
  For a finite sum of product states one applies the same estimate to each of the finitely many cross terms; the exponent remains $m$.
  Let $E_H$ be the spectral resolution of $H_(upright("phys"))$ and $nu_v \( B \) = chevron.l v \, E_H \( B \) v chevron.r$ its finite positive spectral measure. For $0 < m' < m$, positive measure in $\[ 0 \, m' \)$ would give
  $ chevron.l v \, e^(- s H_(upright("phys"))) v chevron.r = integral_(\[ 0 \, oo \)) e^(- s lambda) thin thin upright(d) nu_v \( lambda \) gt.eq e^(- s m') nu_v \( \[ 0 \, m' \) \) \, $
  contradicting (1.143) as $s arrow.r oo$. Hence $E_H \( \[ 0 \, m' \) \) v = 0$ for every centered vector in the dense set. Since a spectral projection is bounded, it vanishes on all of $Omega^perp$. Taking $m' arrow.t m$ proves (1.142). ◻
]

===== 1.10.3 Surviving fields and a separated fourth cumulant <surviving-fields-and-a-separated-fourth-cumulant>

It remains to verify that the vacuum complement is nonzero and that the limiting field is non-Gaussian. Both follow from observables at the fixed terminal block scale. This uses the same field renormalization as the construction and the spectral estimate.

#thm([Proposition 1.39.])[
  (Nontriviality and failure of Wick factorization).  #emph[For a sufficiently large fixed terminal coupling $H$, there exist four smooth compactly supported real tests $f_1 \, dots.h \, f_4$ with strictly disjoint ordered time ranges for which 
#[#set math.equation(numbering: n => "(1.144)")
 $ & bb(E) product_(i = 1)^4 phi.alt^1 \( f_i \) - bb(E) \[ phi.alt^1 \( f_1 \) phi.alt^1 \( f_2 \) \] bb(E) \[ phi.alt^1 \( f_3 \) phi.alt^1 \( f_4 \) \]\
 & quad - bb(E) \[ phi.alt^1 \( f_1 \) phi.alt^1 \( f_3 \) \] bb(E) \[ phi.alt^1 \( f_2 \) phi.alt^1 \( f_4 \) \] - bb(E) \[ phi.alt^1 \( f_1 \) phi.alt^1 \( f_4 \) \] bb(E) \[ phi.alt^1 \( f_2 \) phi.alt^1 \( f_3 \) \] eq.not 0 . $ <eq:nonzero-fourth-cumulant>]

 The reconstructed Hilbert space satisfies $Omega^perp eq.not { 0 }$. Consequently the spectral bottom on $Omega^perp$ is both positive and finite.]
] <prop:non-gaussian>

#proof[
  Choose four distinct unit terminal cells at fixed bounded distances, with gaps between their closed time intervals. Their number, placement, and separations are fixed independently of $H$ and of the cutoff. Translations of the block partitions, as allowed in Section 9, realize this common physical placement. Let $X_(i \, N)$ be the first component of the renormalized field sum over the descendants of cell $i$.
  The local source estimate of Proposition 31 and the comparison in Equation (1.130) give, on a fixed complex neighbourhood of the origin,
  #[#set math.equation(numbering: n => "(1.145)")
   $ bb(E) exp #scale(x: 180%, y: 180%)[\(] sum_(i = 1)^4 z_i X_(i \, N) #scale(x: 180%, y: 180%)[\)] = bb(E)_mu exp #scale(x: 180%, y: 180%)[\(] sum_(i = 1)^4 z_i V_(Y_i)^1 #scale(x: 180%, y: 180%)[\)] + o_H \( 1 \) \, $ <eq:cell-generating-comparison>]
  uniformly in the cutoff and in the admitted axis tori. Here $mu$ is the corresponding terminal spin law and $Y_i$ labels cell $i$. Cauchy’s formula transfers the uniform analytic error to each of the fixed moments of order at most four.
  For completeness, the alignment estimate (1.104) controls the spins at these finitely many sites in mean square. If a nearest-neighbour path of length $ell$ joins $Y_i$ to $Y_1$, then
  $ bb(E)_mu \| V_(Y_i) - V_(Y_1) \|^2 lt.eq ell sum_(e upright(" on the path")) bb(E)_mu r_e^2 lt.eq ell^2 #scale(x: 120%, y: 120%)[\(] C t^2 + 4 e^(- c H t^2) #scale(x: 120%, y: 120%)[\)] = o_H \( 1 \) . $
  The path lengths are fixed; $t = t_0$ tends to zero and $H t^2 = p_0^2$ tends to infinity as $H arrow.r oo$. Internal $O \( 3 \)$ invariance makes each $V_Y$ uniformly distributed on $S^2$. If $U$ has this law, then
  $ bb(E) U^1 = 0 \, #h(2em) bb(E) \( U^1 \)^2 = 1 / 3 \, #h(2em) bb(E) \( U^1 \)^4 = 1 / 5 . $
  The coordinates have absolute value at most one. Telescoping a product and using the preceding mean-square estimate therefore gives, for every pair of distinct chosen cells and for the four-cell product,
  #[#set math.equation(numbering: n => "(1.146)")
   $ bb(E) \[ X_(i \, N) X_(j \, N) \] = 1 / 3 + o_H \( 1 \) \, #h(2em) bb(E) product_(i = 1)^4 X_(i \, N) = 1 / 5 + o_H \( 1 \) . $ <eq:terminal-cell-moments>]
  The first moments vanish exactly by internal symmetry.
  The estimates are uniform on axis tori. We may thus first take the periodic infinite-plane limit at fixed cutoff and then the continuum limit. The descendants in a standard blocking are axis boxes; Lemma 37 identifies their limits with the fixed physical cells and justifies any converging displacement of their boundaries. Denote the resulting cell variables by $X_i$. Their fourth cumulant is
  #[#set math.equation(numbering: n => "(1.147)")
   $ bb(E) product_(i = 1)^4 X_i - sum_({ { i \, j } \, { k \, l } }) bb(E) \[ X_i X_j \] bb(E) \[ X_k X_l \] = 1 / 5 - 3 (1 / 3)^2 + o_H \( 1 \) = - 2 / 15 + o_H \( 1 \) \, $ <eq:cell-fourth-cumulant>]
  where the sum runs over the three pairings of ${ 1 \, 2 \, 3 \, 4 }$. Choose $H$ sufficiently large that this quantity is nonzero. This choice depends only on the fixed cells and the earlier RG constants, and can be made before the later choices of $M_0$ and $K_0$ in Section 7.
  Approximate each cell indicator by bounded smooth tests whose differences from the indicator are supported in shrinking boundary strips. The approximations can preserve the strict gaps between the time ranges. Lemma 37 makes every moment in (1.147) converge under this approximation. Thus suitable smooth tests satisfy (1.144). Since they have separated ordered times, these are Schwinger correlations in the domains used by reconstruction. Wick factorization of the reconstructed Wightman functions would, by their Euclidean continuation, give Wick factorization for these Schwinger correlations as well. Equation (1.144) excludes it.
  The same two-cell calculation can be made for unit cells reflected across $x^0 = 0$, with both cells a positive distance from the seam. Their first-component correlation is $1 \/ 3 + o_H \( 1 \) > 0$. Apply reflected smooth approximations to this pair. For a suitable real test $f$ supported strictly in positive time,
  $ ∥\[ phi.alt^1 \( f \) \]∥^2 = bb(E) #scale(x: 120%, y: 120%)[\[] phi.alt^1 \( theta f \) phi.alt^1 \( f \) #scale(x: 120%, y: 120%)[\]] > 0 \, #h(2em) chevron.l Omega \, \[ phi.alt^1 \( f \) \] chevron.r = bb(E) phi.alt^1 \( f \) = 0 . $
  Hence $Omega^perp$ contains a nonzero vector $v$. Its spectral measure has total mass $∥∥ v^2 > 0$. Since $\[ 0 \, oo \)$ is the increasing union of bounded intervals, some finite $E$ satisfies $nu_v \( \[ 0 \, E \] \) > 0$. The spectral bottom on $Omega^perp$ is therefore finite, and Proposition 41 makes it positive. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 2.] The shooting construction gives bare couplings $beta_N arrow.r oo$. The prescribed lattice spacings satisfy $a_N = L^(- N) arrow.r 0$, and the source construction in Section 8 supplies the positive field renormalizations $B_N$ for the standard nearest-neighbour $O \( 3 \)$ model. The terminal kinetic coupling is the fixed number $H$ at unit physical block length. Proposition 35 establishes convergence of the renormalized correlations and finite lists of smeared fields, with infinite volume taken first or simultaneously along the specified torus exhaustion. Proposition 36 gives their temperedness and Euclidean symmetries.
  Proposition 40 reconstructs the local, unitary relativistic theory. Its full Hamiltonian gap is Proposition 41, and Proposition 42 proves that a nonzero vacuum complement and a nonvanishing connected fourth correlation survive in this same continuum limit. In particular the physical gap is positive and finite at the fixed scale of the construction. Every limiting observable uses the field renormalizations already prescribed from the nearest-neighbour model; the blocking observations are integrated exactly and introduce no additional microscopic physical fields. The construction adds no symmetry-breaking mass term. ◻
]

== 2 Canonical scaling along all diverging couplings <canonical-scaling-along-all-diverging-couplings>

==== 2.1 Trajectories with a bounded bare offset <sec:trajectories>

The construction above chooses the microscopic coupling by prescribing its value after the final blocking step. To treat every sufficiently large microscopic coupling, we instead allow a bounded displacement from an explicit reference sequence. We shall prove that all these trajectories remain admitted. We shall also identify which displacements give the same effective density at every fixed layer as the microscopic depth tends to infinity. This second conclusion requires a summable sensitivity estimate for the error in the kinetic increment.

===== 2.1.1 Common reference scales and canonical increments <common-reference-scales-and-canonical-increments>

We keep the observations and representations of Sections 2–4. In particular, $L$ is a fixed sufficiently large power of two, and

$ gamma = frac(log L, 2 pi) \, #h(2em) H_j = H + gamma j \, #h(2em) frak(m)_j = ceil.l \( log H_j \)^2 ceil.r \, #h(2em) p_j = \( log H_j \)^(P_0) \, #h(2em) t_j = H_j^(- 1 \/ 2) p_j . $

A depth-$N$ trajectory starts at $b_N = beta$ and runs through layers $N \, N - 1 \, dots.h \, 0$. Its precise coupling is admitted at layer $j$ when $b_j in \[ H_j \/ 2 \, 2 H_j \]$, and strict admission means that both inequalities are strict. The reference scales, rather than $b_j$, determine the geometric thresholds and masks throughout a comparison.

There are three trajectory types, denoted by $P in { r \, + \, - }$. Type $r$ uses only ordinary observations of side $L$. Type $+$ or $-$ uses first the inclined observation of side $5 L$ in Section 3, with respective rotation

$ O_(+) = 1 / 5 mat(delim: "(", 3, - 4; 4, 3) \, #h(2em) O_(-) = O_(+)^(- 1) \, $

and then uses ordinary observations. A history records the observations already made, including their coordinate frames. In a comparison we identify the frames of the layer under consideration and use the same ordinary observation in the remaining common steps.

We use the bulk formulas and their compatible finite-period representations. Compatibility means that every observation descends to the corresponding quotient lattice, while admission of a period requires its shortest nonzero translation to satisfy the lower bound in Section 2.1. The comparisons below use common reference scales and the common refinements and zero padding of Section 2. They apply to bulk lists and simultaneously to the finite-period lists whenever the periods being compared are compatible. In particular, one may fix a common terminal period and compare the resulting common periods at all fixed bottom layers.

Recall briefly what the discrepancy measures. A retained density has the form (1.64): it contains the precise kinetic coupling, a finite vector of canonical polynomial coefficient lists, regular local errors, and a covering sum for configurations with large bond differences. The regular errors are bounded with eight derivatives on their graph domains; the covering activities are bounded by a sum over supports meeting a site. Their caps are

$ delta_j = H_j^(- 2.05) \, #h(2em) w_j = exp \( - p_j^(1 \/ 4) \) \; $

the complete definitions are (1.58) and (1.62). For two bulk representations, $u_j$ denotes the positively weighted list discrepancy (1.65). The regular-error difference uses seven derivatives and is divided by $delta_j$; the covering difference is divided by $w_j$. The canonical coefficients are compared without their displayed powers of the precise coupling. We put $lambda_j = b_(2 \, j) - b_(1 \, j)$, where each precise coupling is defined by its bulk extraction and is shared by the corresponding compatible finite-period representations.

For a comparison that also involves finite periods, choose the common terminal periods to be compared and follow each of them through the layers. Write $u_j^(upright("bulk"))$ and $u_j^T$ for (1.65) in the bulk and on the layer-$j$ period corresponding to terminal period $T$, respectively. In this case we use

#[#set math.equation(numbering: n => "(2.1)")
 $ u_j = max { u_j^(upright("bulk")) \, med sup_T u_j^T #scale(x: 120%, y: 120%)[}] . $ <eq:offset-family-discrepancy>]

The supremum may be restricted to the finitely many periods in the comparison, or taken over a compatible family obeying the common admission bounds. The estimates are uniform in periods, and $lambda_j$ and the history error are common to this whole family. The cap bounds are preserved under this maximum; the step estimates for this convention are justified below. In particular a finite-period comparison always retains control of the bulk data that determine the kinetic increment; no norm on an isolated finite torus is used to bound a bulk extraction. Fixed positive comparison weights give

#[#set math.equation(numbering: n => "(2.2)")
 $ parallel f_(2 \, j) - f_(1 \, j) parallel_(7 \, j \, A) lt.eq C_L delta_j u_j \, #h(2em) u_j lt.eq C_L quad upright("for two representations obeying the common caps.") $ <eq:offset-discrepancy-caps>]

The volume scalar is omitted from $u_j$, as it cancels from normalized expectations.

The order of parameters will matter. Choose the contraction slack $upsilon > 0$ small enough for Theorem 11 and so that

#[#set math.equation(numbering: n => "(2.3)")
 $ upsilon / 2 < min { 1 \, eta \/ \( 2 pi \) } \, $ <eq:offset-slack>]

where $eta$ is the gain in Proposition 4. Choose the support and derivative requirements, $L$, the canonical caps and comparison weights, and $P_0$ in the order specified in Section 4.7. All logarithmic powers in the estimates below are then fixed. Two bounds on the bare displacement, $R$ and $R'$, will be chosen below, before increasing $H$. Constants denoted by $C_L$ may depend on these already fixed representation parameters, but not on $H$, the depth, the layer, the period, or the precise couplings in their bands. Once $H$ has been fixed, we allow constants denoted by $C_H$ to depend on it.

#thm([Proposition 2.1.])[
  (Canonical increments and comparison estimates).  #emph[For every type $P in { r \, + \, - }$, initialize the nearest-neighbor model as in Section 5. As long as the input couplings lie in their admitted bands, the exact observations produce representations with all renewed shape caps and the recursion 
#[#set math.equation(numbering: n => "(2.4)")
 $ b_(j - 1) = b_j + alpha_(N - j)^P + kappa_(N - j)^P / b_j + Delta_j \, #h(2em) \| Delta_j \| lt.eq C_L H_j^(- 1.05) . $ <eq:offset-flow>]

 There are $C_L < oo$, $0 < sigma_1 < 1$, and a number $kappa_oo$ such that 
#[#set math.equation(numbering: n => "(2.5)")
 $ \| alpha_h^P + gamma \| + \| kappa_h^P - kappa_oo \| lt.eq C_L sigma_1^h #h(2em) \( h gt.eq 0 \) . $ <eq:offset-increment-convergence>]

 These sequences are independent of the precise running couplings, and remain fixed when $H$ is increased. The two inclined types have the same scalar sequences.]
  #emph[On common ordinary steps, with discrepancy variables defined above, 
#[#set math.equation(numbering: n => "(2.6)")
 $ u_(j - 1) & lt.eq q u_j + C_L "poly" \( H_j \) epsilon.alt_h + e_j \| lambda_j \| \,\
\| lambda_(j - 1) - lambda_j \| & lt.eq C_L u_j + C_L "poly" \( H_j \) epsilon.alt_h + e_j \| lambda_j \| \, & e_j & = C_L \( log H_j \)^C \/ H_j . $ <eq:offset-weak-comparison>]

 If the histories share their last $m$ ordinary observations, $epsilon.alt_h$ may be taken to be $r_0^m$, where $r_0 = A_0 \/ L^2$. The choices can be made with 
#[#set math.equation(numbering: n => "(2.7)")
 $ max { q \, r_0 } < rho < L^(- 2 + upsilon) < 1 $ <eq:offset-contraction-width>]

 and strict spare width. Here $q$ and $rho$ are fixed bounds valid for every subsequent sufficiently large $H$. The corresponding free kernels and their lifts compare in the exponential kernel norms of Proposition 9 with the same history bound.]
] <prop:rg-input>

#proof[
  The initialization in Section 5 has zero canonical coefficients and zero regular errors; its covering construction obeys the covering cap. Theorem 11 renews these caps and gives the coupling recursion whenever its input is admitted. It produces the output representation before the next coupling-band condition is imposed, a fact that will permit a first-exit argument.
  The prescription in Section 4.5 assigns the canonical coefficients to the finite triangular operation $upright(bold(P)) mapsto cal(C)_h \( upright(bold(P)) \)$. After the powers of $b^(- 1 \/ 2)$ have been sorted, that operation depends only on the incoming canonical coefficients and the free history. The remaining difference from the exact integral is retained in the regular errors and covering activities, with its affine correction in $Delta$. The orbit starting from zero therefore fixes the sequences $alpha_h^P \, kappa_h^P$ independently of the precise coupling and of $H$. Lemma 16 and the history contraction in Proposition 9 give their exponential convergence, as in Section 5; Lemma 18 identifies their common first limit as $- gamma$. Reflection interchanges the two inclined prescriptions and preserves these scalar extractions, so their scalar sequences agree. This does not identify their coefficient tensors in a fixed coordinate frame.
  Equation (2.6) follows from (1.76) with the simultaneous bulk and period convention. To verify this convention through the normalization, first compare the raw lists in the bulk and on each selected period using the dominating discrepancy (2.1). Extract the difference of the kinetic corrections from the bulk raw lists, with the factor $C t_(j - 1)^(- 2)$ in Section 4.7. The same bulk corrections are then used to normalize every finite-period output. Their regular reset costs $C t_(j - 1)^2$ times this difference, cancelling the extraction factor; the other reset discrepancies are the history and coupling terms already present in (1.76). Missing bulk corrections on a given period keep their complete winding records and the spare support exponent, as in the period argument of Section 4.7; their off-mask parts retain the covering estimates. These operations introduce only the fixed normalization multipliers already allowed before choosing $L$. Thus each output discrepancy is bounded by $q u_j + C_L "poly" \( H_j \) epsilon.alt_h + e_j \| lambda_j \|$, with a common contraction coefficient $q$ below $rho$ after the triangular weights and large parameters are chosen with spare width. Taking their maximum proves the first family inequality; the coupling inequality uses the bulk term directly. The history and kernel conclusions are Proposition 9. The spare width in (2.7) is the choice made in Proposition 20. The uniform $o_H \( 1 \)$ terms in the step estimates can be absorbed into a fixed upper contraction bound $q$ strictly below $rho$; increasing $H$ later does not change either chosen rate. ◻
]

===== 2.1.2 Summable sensitivity of the kinetic error <summable-sensitivity-of-the-kinetic-error>

The coefficient $e_j$ in (2.6) tends to zero but is not summable over layers. For matching trajectories from their behavior at large $j$, we need finer information about the noncanonical increment $Delta_j$. The raw-error estimate used in the proof of the exact step supplies it.

#thm([Lemma 2.2.])[
  (Sensitivity of the extracted kinetic error).  #emph[For two admitted compatible representation families, including their prescribed bulk lists, on a common ordinary step with common reference scales, the discrepancies in Proposition 43 satisfy 
#[#set math.equation(numbering: n => "(2.8)")
 $ \| Delta_(2 \, j) - Delta_(1 \, j) \| lt.eq C_L H_j^(- 1.01) \( u_j + \| lambda_j \| \) + C_L "poly" \( H_j \) epsilon.alt_h . $ <eq:offset-sensitivity>]

 The constant is uniform over the bulk prescriptions and their compatible admitted finite-period representations, once $H$ is sufficiently large.]
] <lem:sensitivity>

#proof[
  Before the constant and affine terms of the regular remainder are extracted, let $R_j^Delta$ denote the layer-$\( j - 1 \)$, seven-derivative norm of the difference of its two bulk raw lists. The Taylor comparison proved in Section 4.7 gives the estimate #cite(label("OpenAI-O4")) Equation (5.39), with the improved coefficient $q_1 = C \/ L^2 + o_H \( 1 \)$ established there for $S^2$:
  #[#set math.equation(numbering: n => "(2.9)")
   $ R_j^Delta lt.eq q_1 delta_j^Delta + C_L "poly" \( frak(m)_j \, p_j \) delta_j \( epsilon.alt_h + lambda_g \) + C_L g^4.5 \( u_j + epsilon.alt_h + lambda_g \) . $ <eq:offset-raw-discrepancy>]
  Here $delta_j^Delta$ is the unnormalized bulk input regular-error discrepancy; $g$ may be taken comparable to either $b_(i \, j)^(- 1 \/ 2)$; and $lambda_g lt.eq C_L \| lambda_j \| \/ H_j$. By (2.2), $delta_j^Delta lt.eq C_L H_j^(- 2.05) u_j$, while $g lt.eq C_L H_j^(- 1 \/ 2)$ in the common bands.
  The affine coefficient is the linear second-derivative functional (1.59), evaluated in the bulk. Once the coordinate frames and reference domains have been identified, this is the same functional on both raw lists; it does not change with the free kinetic kernel. The extraction estimate in Section 4.7 therefore gives
  #[#set math.equation(numbering: n => "(2.10)")
   $ \| Delta_(2 \, j) - Delta_(1 \, j) \| lt.eq C t_(j - 1)^(- 2) R_j^Delta lt.eq C_L H_j R_j^Delta . $ <eq:offset-affine-extraction>]
  There is no support-cardinality loss in this estimate: a unit affine direction is bounded by the polynomially weighted directions in (1.56), so its two derivative slots cost only $t_(j - 1)^(- 2)$. The seven derivatives in the discrepancy norm are more than sufficient. The final reset of the canonical prefactors has zero affine Hessian, as verified in Section 4.7, and hence contributes no additional kinetic extraction. Bulk extraction also explains the uniformity in the period: missing or folded corrections remain in the winding lists instead of changing $Delta_j$. Equation (2.10) uses the bulk raw-list discrepancy, which is bounded using $u_j^(upright("bulk")) lt.eq u_j$ from (2.1). The inclusion of this bulk term is essential when some labels wind or disappear on a finite period.
  Multiplying (2.9) by $C_L H_j$ bounds its nonhistory terms by
  $ C_L \( H_j^(- 1.05) + H_j^(- 1.25) \) u_j + C_L #scale(x: 120%, y: 120%)[\(] \( log H_j \)^C H_j^(- 2.05) + H_j^(- 2.25) #scale(x: 120%, y: 120%)[\)] \| lambda_j \| . $
  Any remaining fixed logarithmic powers are absorbed by the strict power margins when $H$ is increased. In particular this is bounded by $C_L H_j^(- 1.01) \( u_j + \| lambda_j \| \)$. The history terms can be bounded by $C_L "poly" \( H_j \) epsilon.alt_h$, proving (2.8). The argument uses the raw-error comparison for $S^2$ from Section 4.7, rather than an application of an $O \( 4 \)$ step theorem to the present model. ◻
]

===== 2.1.3 Admission and retuning <admission-and-retuning>

The exponentially decaying canonical transients define the finite constants

#[#set math.equation(numbering: n => "(2.11)")
 $ A_P = sum_(h = 0)^oo \( alpha_h^P + gamma \) \, #h(2em) A_(upright("abs")) = max_(P in { r \, + \, - }) sum_(h = 0)^oo \| alpha_h^P + gamma \| \, #h(2em) d = A_(+) - A_r = A_(-) - A_r . $ <eq:offset-transients>]

These constants are fixed before $H$ is increased. Recall the reference sequence from Section 5:

#[#set math.equation(numbering: n => "(2.12)")
 $ theta.alt_j = H_j - kappa_oo / gamma log \( H_j \/ H \) \, #h(2em) theta.alt_j - theta.alt_(j - 1) = gamma - kappa_oo / H_j + O_L \( H_j^(- 2) \) . $ <eq:offset-profile>]

The bare offset of a depth-$N$ trajectory is $s = beta - theta.alt_N$. Choose once and for all

#[#set math.equation(numbering: n => "(2.13)")
 $ R > 4 \( \| d \| + gamma + 1 \) \, #h(2em) R' > R + 2 A_(upright("abs")) + 2 \, #h(2em) I = \( - R \, R \) . $ <eq:offset-range>]

We shall use $\| s \| lt.eq R$ for the limiting comparisons and the larger range $\| s \| lt.eq R'$ for retuning. Both bounds have now been chosen independently of $H$.

#thm([Proposition 2.3.])[
  (Uniform admission for bounded offsets).  #emph[For $H$ sufficiently large, every depth $N gt.eq 1$, every type $P in { r \, + \, - }$, and every bare coupling $beta = theta.alt_N + s$ with $\| s \| lt.eq R'$ give a strictly admitted trajectory. Uniformly over these choices, 
#[#set math.equation(numbering: n => "(2.14)")
 $ b_j = theta.alt_j + D_j \, #h(2em) max_(0 lt.eq j lt.eq N) \| D_j \| lt.eq C_(L \, R') . $ <eq:offset-admission>]

 Moreover, 
#[#set math.equation(numbering: n => "(2.15)")
 $ D_(j - 1) - D_j & = alpha_(N - j)^P + gamma + E_(j \, N) \,\
\| E_(j \, N) \| & lt.eq C_L [H_j^(- 1.05) + H_j^(- 2) #scale(x: 120%, y: 120%)[\(] log \( 2 + H_j \/ H \) + \| D_j \| #scale(x: 120%, y: 120%)[\)] + H_j^(- 1) sigma_1^(N - j)] \, $ <eq:offset-error-recursion>]

 and 
#[#set math.equation(numbering: n => "(2.16)")
 $ sup_(N \, P \, thin \| s \| lt.eq R') sum_(j = 1)^N \| E_(j \, N) \| = o_H \( 1 \) . $ <eq:offset-error-sum>]

 The constants in (2.14) stay bounded as $H$ is increased, with all earlier parameters fixed.]
] <prop:admission>

#proof[
  The starting coupling is strictly in band for $H$ large, uniformly in $N$ and $\| s \| lt.eq R'$. Indeed, for $x gt.eq 1$ the ratio $log x \/ x$ is bounded, and hence $\| theta.alt_N - H_N \| \/ H_N lt.eq C_L \/ H$. Consider a trajectory down to a possible first output outside its band. Every step forming that output has an admitted input, so (2.4) applies. On such an input,
  $ lr(|1 / b_j - 1 / H_j|) lt.eq C_L H_j^(- 2) #scale(x: 120%, y: 120%)[\(] log \( 2 + H_j \/ H \) + \| D_j \| #scale(x: 120%, y: 120%)[\)] . $
  Subtract (2.12) from the coupling recursion and use (2.5). This gives (2.15), including the step forming a possible first exit.
  The sums required for this estimate are uniform in depth:
  $ sum_(j gt.eq 1) H_j^(- 1.05) & lt.eq C_L H^(- 0.05) \, & sum_(j gt.eq 1) H_j^(- 2) & lt.eq C_L H^(- 1) \,\
sum_(j gt.eq 1) H_j^(- 2) log \( 2 + H_j \/ H \) & lt.eq C_L H^(- 1) \, & sum_(j = 1)^N H_j^(- 1) sigma_1^(N - j) & lt.eq C_L H^(- 1) . $
  The first three follow by integral comparison for $H_j = H + gamma j$; the last follows from the geometric series and $H_j gt.eq H$. Let $M_D$ be the maximum of $\| D_j \|$ on the segment, including its last output. Summing from $D_N = s$ and using (2.11) gives
  $ M_D lt.eq R' + A_(upright("abs")) + o_H \( 1 \) + C_L H^(- 1) M_D . $
  Take $H$ large enough to absorb the final term. This bounds $M_D$ by a constant depending only on $L \, R'$ and the previously fixed parameters. Since also
  $ sup_(j gt.eq 0) frac(\| theta.alt_j - H_j \| + C_(L \, R'), H_j) arrow.r 0 #h(2em) \( H arrow.r oo \) \, $
  every output covered by this bound lies strictly in its band. There can be no first exit, which proves admission and (2.14). Substitution of this uniform bound for $\| D_j \|$ in (2.15), followed by the same four summations, proves (2.16). ◻
]

#thm([Lemma 2.4.])[
  (Retuning at an arbitrary depth).  #emph[After increasing $H$ once more, let an ordinary trajectory have any depth $N gt.eq 1$ and bare offset $\| s \| lt.eq R$. For every integer $K gt.eq 1$ there is $s_K in \[ - R' \, R' \]$ such that the ordinary trajectory of depth $K$ with bare coupling $theta.alt_K + s_K$ has exactly the same terminal coupling $b_0$.]
] <lem:retuning>

#proof[
  For every trajectory in Proposition 45, summing (2.15) to zero gives
  #[#set math.equation(numbering: n => "(2.17)")
   $ lr(|b_0 - H - s|) lt.eq A_(upright("abs")) + o_H \( 1 \) . $ <eq:offset-terminal-range>]
  Let $T_K \( t \)$ be the terminal coupling of the ordinary depth-$K$ trajectory started at $theta.alt_K + t$. Proposition 45 gives strict admission for the whole interval $\[ - R' \, R' \]$. The continuity argument in the proof of Proposition 19 therefore makes $T_K$ continuous on this interval: the reference thresholds are fixed, and the exact integrations and representation maps are continuous in the precise coupling on each finite admitted run. Take $H$ so that the uniform $o_H \( 1 \)$ in (2.17) has absolute value less than one. By (2.13),
  $ T_K \( - R' \) & lt.eq H - R' + A_(upright("abs")) + 1 < H - R - A_(upright("abs")) - 1 lt.eq b_0 \,\
T_K \( R' \) & gt.eq H + R' - A_(upright("abs")) - 1 > H + R + A_(upright("abs")) + 1 gt.eq b_0 . $
  The intermediate value theorem supplies $s_K$. No monotonicity or uniqueness of the shooting map is needed. ◻
]

===== 2.1.4 Matching at each fixed layer <matching-at-each-fixed-layer>

Retuning gives an exact equality of terminal couplings at finite depths. A different comparison identifies limits without such a retuning. Its hypothesis compensates the transient displacement $A_P$ associated with the choice of initial observation.

#thm([Proposition 2.5.])[
  (Fixed-layer matching).  #emph[Fix $H$ sufficiently large as above. For $i in { 1 \, 2 }$, let $P_i in { r \, + \, - }$ be fixed and let a sequence of depth-$N_(i \, n)$ trajectories have bare couplings $theta.alt_(N_(i \, n)) + s_(i \, n)$, where $N_(i \, n) arrow.r oo$ and $\| s_(i \, n) \| lt.eq R'$. Suppose 
#[#set math.equation(numbering: n => "(2.18)")
 $ \( s_(2 \, n) + A_(P_2) \) - \( s_(1 \, n) + A_(P_1) \) arrow.r 0 . $ <eq:offset-matching-hypothesis>]

 Compare their bulk representations in common layer coordinates, using the same ordinary observations on their common bottom steps. Then, for every fixed integer $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.19)")
 $ u_(j \, n) arrow.r 0 \, #h(2em) lambda_(j \, n) arrow.r 0 . $ <eq:offset-fixed-layer-matching>]

 The same statement holds on each fixed common compatible terminal period and its corresponding bottom-layer periods.]
] <prop:matching>

#proof[
  All the trajectories are admitted by Proposition 45. At layer $j$, the histories share at least $min \( N_(1 \, n) \, N_(2 \, n) \) - 1 - j$ most recent ordinary observations, once the depths are sufficiently large. Thus their history error tends to zero at each fixed layer. The normalized caps and (2.14) also give constants, independent of $j \, n$, bounding $u_(j \, n)$ and $\| lambda_(j \, n) \|$ whenever the layer is present. Define
  $ U_j = limsup_(n arrow.r oo) u_(j \, n) \, #h(2em) W_j = limsup_(n arrow.r oo) \| lambda_(j \, n) \| . $
  Both sequences are uniformly bounded.
  We first establish the boundary condition for $W_j$ at large layers. The recursion in Proposition 45 gives
  $ D_(i \, j) = s_(i \, n) + sum_(h = 0)^(N_(i \, n) - j - 1) \( alpha_h^(P_i) + gamma \) + sum_(m = j + 1)^(N_(i \, n)) E_(i \, m \, N_(i \, n)) . $
  For fixed $j$ the transient sum tends to $A_(P_i)$ as $n arrow.r oo$. The error bound, with (2.14) substituted, gives
  #[#set math.equation(numbering: n => "(2.20)")
   $ W_j lt.eq C_(L \, R') sum_(m > j) [H_m^(- 1.05) + H_m^(- 2) #scale(x: 120%, y: 120%)[\(] log \( 2 + H_m \/ H \) + 1 #scale(x: 120%, y: 120%)[\)]] + C_L / H_j . $ <eq:offset-boundary-at-infinity>]
  Here (2.18) cancels the two limiting offsets, and the final term bounds each transient sum by
  $ sum_(m = j + 1)^N H_m^(- 1) sigma_1^(N - m) lt.eq frac(1, H_j \( 1 - sigma_1 \)) . $
  The right side of (2.20) tends to zero as $j arrow.r oo$, with $H$ fixed. Consequently
  #[#set math.equation(numbering: n => "(2.21)")
   $ W_j arrow.r 0 #h(2em) \( j arrow.r oo \) . $ <eq:offset-W-boundary>]
  This argument does not require the complete error sum at fixed $H$ to vanish as the depth increases.
  At each fixed $j gt.eq 1$, take upper limits in the first inequality of (2.6). The history forcing disappears. For the coupling, subtract (2.4) for the two trajectories and use Lemma 44. At this fixed layer the two $alpha$ values tend to $- gamma$ and the two $kappa$ values to $kappa_oo$. The remaining denominator variation is bounded by $C_L H_j^(- 2) \| lambda_(j \, n) \|$. It follows that
  #[#set math.equation(numbering: n => "(2.22)")
   $ U_(j - 1) lt.eq q U_j + e_j W_j \, #h(2em) W_(j - 1) lt.eq W_j + a_j \( U_j + W_j \) \, #h(2em) a_j = C_L H_j^(- 1.01) . $ <eq:offset-limsup-recursions>]
  Put $U = sup_(j gt.eq 0) U_j$, $W = sup_(j gt.eq 0) W_j$, and $e_(*) = sup_(j gt.eq 1) e_j$. Iterating the first inequality through $m$ layers above $k$ yields
  $ U_k lt.eq q^m U_(k + m) + W sum_(r = 1)^m q^(r - 1) e_(k + r) . $
  Boundedness and $q < 1$ allow $m arrow.r oo$, giving $U lt.eq e_(*) W \/ \( 1 - q \)$. Next sum the second inequality of (2.22) from $k + 1$ to $k + m$. Letting $m arrow.r oo$ and using (2.21) gives
  $ W_k lt.eq sum_(j > k) a_j \( U_j + W_j \) \, #h(2em) W lt.eq (sum_(j gt.eq 1) a_j) \( U + W \) . $
  No limit has been interchanged with an infinite sum: the limiting recurrences were first obtained at fixed layers and then iterated. Finally,
  $ e_(*) arrow.r 0 \, #h(2em) sum_(j gt.eq 1) a_j lt.eq C_L H^(- 0.01) arrow.r 0 #h(2em) \( H arrow.r oo \) . $
  We choose $H$, once for all the trajectories, so that
  $ (sum_(j gt.eq 1) a_j) (1 + frac(e_(*), 1 - q)) < 1 . $
  The two supremum inequalities force $W = 0$ and then $U = 0$, which proves (2.19). The proof uses the bulk norms and the simultaneous finite-period norms from Proposition 43; it therefore applies to each fixed compatible terminal period as stated. ◻
]

For later use, all further requirements that $H$ be large, including the local source and terminal-alignment estimates, are imposed before any depth or volume thresholds are selected. The bounds $R \, R'$, the transient constants, and the reference prescriptions remain fixed throughout these choices.

==== 2.2 Volume estimates uniform in the bare offset <sec:volume>

The trajectories admitted in Proposition 45 have terminal couplings in a fixed band, but generally do not end at $H$. We now extend the finite-volume estimates of Section 7 to this entire family. The argument first matches two trajectories at their common terminal coupling, then transfers a rectangular partition-function test from a retuned reference depth to every finer cutoff. The resulting bounds will allow local field comparisons on fixed tori to pass to the plane.

===== 2.2.1 Positivity at finite coupling <sec:finite-beta>

We first record the elementary positivity needed to use component moments as measures. All torus partition functions retain the normalization in (1): normalized area measure at each site, and each unoriented nearest-neighbor bond counted once.

#thm([Lemma 2.6.])[
  (Finite-coupling moments and normalization).  #emph[For every sufficiently large fixed $beta$, the periodic plane law $mu_beta$ exists and is translation and $O \( 3 \)$ invariant. Every component moment 
$ bb(E)_(mu_beta) product_(r = 1)^n q_(x_r)^(i_r) \, #h(2em) x_r in bb(Z)^2 \, quad i_r in { 1 \, 2 \, 3 } \, $

 is nonnegative. If 
$ C_beta \( x \) = bb(E)_(mu_beta) \[ q_0^1 q_x^1 \] \, #h(2em) chi_beta = sum_(x in bb(Z)^2) C_beta \( x \) \, #h(2em) xi_beta^2 = frac(sum_x \| x \|^2 C_beta \( x \), 4 chi_beta) \, $

 then both sums converge absolutely and $0 < chi_beta \, xi_beta < oo$, where $xi_beta$ is the positive square root. More precisely, $C_beta \( 0 \) = 1 \/ 3$ and, for each nearest-neighbor vector $e$, 
#[#set math.equation(numbering: n => "(2.23)")
 $ C_beta \( e \) gt.eq beta / 9 e^(- 7 beta) > 0 . $ <eq:offset-edge-positive>]

]
] <lem:finite-beta>

#proof[
  Proposition 4 gives the periodic plane limit. The symmetries of its torus approximants pass to that limit; in particular each component has mean zero. Apply (1.2) to $q_0^1 \, q_x^1$ on arbitrarily large tori at this fixed $beta$, and then pass to the plane. It gives
  $ \| C_beta \( x \) \| lt.eq C \( 1 + beta + \| x \| \)^p exp \[ - c \| x \| \/ X \( beta \) \] . $
  The two sums in the statement therefore converge absolutely.
  For positivity, expand each factor $exp \( beta sum_(i = 1)^3 q_x^i q_y^i \)$ in its componentwise power series on a finite torus. The series of absolute values is integrable, since the spins are bounded and the torus has finitely many edges. Every integrated term, including any prescribed component insertion, factors into one-site monomial integrals. Such an integral vanishes if one coordinate exponent is odd and is nonnegative if all are even. All expansion coefficients are nonnegative. Division by the positive partition function, followed by the periodic limit, proves the asserted moment positivity.
  Consider one edge ${ 0 \, e }$ on a torus with sides at least four. Exactly seven distinct bonds meet its two endpoints. Delete these bonds and denote the resulting partition function by $Z^(upright("del"))$. In the expansion of the numerator for $q_0^1 q_e^1$, retain the term $beta q_0^1 q_e^1$ from the chosen edge and the constant terms from the other six incident bonds, leaving all nonincident expansions unrestricted. The isolated endpoint integrals each equal $1 \/ 3$, so this contribution is $beta Z^(upright("del")) \/ 9$. Termwise nonnegativity bounds the full numerator from below by this value. Since the deleted interaction is at most $7 beta$ pointwise, $Z lt.eq e^(7 beta) Z^(upright("del"))$. This proves (2.23), also after passing to the plane. Internal symmetry gives $C_beta \( 0 \) = 1 \/ 3$. Nonnegativity now gives $chi_beta gt.eq 1 \/ 3$ and a strictly positive second-moment numerator. ◻
]

===== 2.2.2 Endpoint comparisons with a varying terminal coupling <endpoint-comparisons-with-a-varying-terminal-coupling>

The reference scale at the endpoint remains $H$ throughout. Thus the thresholds are always $t_0 = H^(- 1 \/ 2) p_0$, the regular-error cap is $delta_0 = H^(- 2.05)$, and the covering cap is $w_0 = exp \( - p_0^(1 \/ 4) \)$. These quantities are not replaced by functions of the precise terminal coupling.

#thm([Lemma 2.7.])[
  (Ordinary endpoint laws throughout the terminal band).  #emph[Fix a finite covering-cap multiplier and $C_0 > 0$ before choosing $H$ sufficiently large. Let a trajectory obtained from the microscopic Gibbs law by the exact ordinary observations satisfy the admission and cap conditions of Section 2, with terminal coupling $b_0 in \[ H \/ 2 \, 2 H \]$. On a standard terminal axis torus of bounded aspect, with the lower bounds and divisibilities of Section 6, its scalar-stripped endpoint density is an admissible base for Proposition 21 and Corollary 25, with constants uniform in the trajectory, its depth, its period, and $b_0$ in this band. In particular, every endpoint bond obeys 
#[#set math.equation(numbering: n => "(2.24)")
 $ mu { \| q_x - q_y \| > t_0 \/ C_0 } lt.eq e^(- c H t_0^2) $ <eq:offset-terminal-alignment>]

 for a corresponding $c > 0$. The integrated comparison also permits complex comparison weights whose support-hit envelope obeys the chosen multiplier of the covering cap, as in its original statement.]
] <lem:band-endpoints>

#proof[
  The definition in Section 2.4, specifically (1.66), already allows a precise coupling in $\[ H \/ 2 \, 2 H \]$. An actual observed law is positive because its density is the integral of the positive microscopic density against positive normalized observations. The ordinary observations on the two sides of a retained seam are independent and are exchanged by reflection. The verification at the end of Section 5 therefore supplies link reflection positivity without any condition $b_0 = H$.
  The quantitative estimates used in the integrated comparison have the same uniformity. In Lemma 22, group the kinetic rows with their precise coupling $b_0$. The omitted tails cost at most $2 H$ times the exponentially small kernel tail, and the canonical contributions remain bounded by $C_L \( H t_0^4 + t_0^2 \)$ per anchor. In Lemma 24, the lower and upper energy bounds use respectively $b_0 gt.eq H \/ 2$ and $b_0 lt.eq 2 H$; their energy scale is still $H t_0^2 = p_0^2$. The sampling, masks, complete supports, and inventory constraints have the same reference thresholds and caps. The chessboard argument uses only the seam reflection positivity and the even tile counts, both just checked. These are precisely the hypotheses of Proposition 21. The disseminated-event proof of Corollary 25 uses the same remainder and partition-function bounds and the lower kinetic bound $b_0 gt.eq H \/ 2$. It therefore gives (2.24) uniformly. ◻
]

#thm([Proposition 2.8.])[
  (Endpoint comparison at a common terminal value).  #emph[Fix $L \, R \, R'$ and choose $H$ sufficiently large as in Proposition 45. Consider two admitted ordinary trajectories of depths $N gt.eq K gt.eq 1$, with offsets bounded by $R'$, common reference scales and caps, and the same precise terminal coupling $b_0$. Align their last $K$ layers on common compatible periods. Write their scalar-stripped endpoint densities as $e^(X_i) Xi_i$. On each common admitted terminal torus of volume $v$, their common refined activity lists satisfy 
#[#set math.equation(numbering: n => "(2.25)")
 $ parallel X_1 - X_2 parallel_oo & lt.eq C_H v epsilon.alt_K \,\
sup_x sum_(lambda : x in P_lambda) e^(A s_lambda) parallel k_(1 \, lambda) - k_(2 \, lambda) parallel_oo & lt.eq C_H epsilon.alt_K \, #h(2em) epsilon.alt_K = L^(- \( 2 - upsilon \) K) . $ <eq:offset-endpoint-comparison>]

 Here $P_lambda$ and $s_lambda$ are the complete support and load of a covering label, and $A$ is the support exponent of the endpoint class. If the common torus is an axis torus satisfying Lemma 49 and $C_H v epsilon.alt_K$ is sufficiently small, its scalar-stripped partition functions satisfy 
#[#set math.equation(numbering: n => "(2.26)")
 $ \| log hat(Z)_1 - log hat(Z)_2 \| lt.eq C_H v epsilon.alt_K . $ <eq:offset-endpoint-logZ>]

 The constants are independent of $N \, K$, the periods, and the common terminal value.]
] <prop:endpoint-comparison>

#proof[
  We verify the uniformity in the common terminal value in the two-boundary proof of Proposition 20. The normalized discrepancies $u_j$ and precise-coupling differences $lambda_j$ are those of (1.65). The equality of the terminal couplings is exactly $lambda_0 = 0$. The shared ordinary tail gives history error at most $r_0^(K - j)$, by Proposition 9, with $r_0 = A_0 \/ L^2$. Thus Theorem 11 gives, for $1 lt.eq j lt.eq K$,
  $ u_(j - 1) lt.eq q u_j + e_(*) \| lambda_j \| + f_j \, #h(2em) \| lambda_j \| lt.eq a_(*) \| lambda_(j - 1) \| + a_(*) C_L u_j + a_(*) f_j \, $
  where
  $ e_(*) = sup_(j gt.eq 1) C_L \( log H_j \)^C \/ H_j = o_H \( 1 \) \, quad a_(*) = \( 1 - e_(*) \)^(- 1) \, quad f_j lt.eq C_L "poly" \( H_j \) r_0^(K - j) . $
  Choose $max \( q \, r_0 \) < rho < L^(- 2 + upsilon)$ with strict spare width, and put $F_K = C_H \( 1 + K \)^C$, large enough that $f_j lt.eq F_K rho^(K - j)$. For
  $ U = max_(0 lt.eq j lt.eq K) u_j / rho^(K - j) \, #h(2em) W = max_(0 lt.eq j lt.eq K) frac(\| lambda_j \|, rho^(K - j)) \, $
  downward iteration for $u$ and upward iteration from $lambda_0 = 0$ give
  $ U lt.eq u_K + frac(e_(*) W + F_K, rho - q) \, #h(2em) W lt.eq frac(a_(*) \( C_L U + F_K \), 1 - a_(*) rho) . $
  Choose $H$ so that $a_(*) rho < 1$ and the product of the two coefficients coupling $U \, W$ is less than $1 \/ 2$. The common caps bound $u_K$, so $u_j + \| lambda_j \| lt.eq C_H \( 1 + K \)^C rho^(K - j)$. This calculation uses no specified value of $b_0$ beyond its band.
  At layer zero the conversion in the proof of Proposition 20 uses the coefficient norms, masked regular norms, complete-support load bounds, and free-history kernel bounds. These are the common reference norms just used. It gives (2.25), absorbing the factor $\( 1 + K \)^C$ in the spare exponential width. All regular supremum bounds remain on their prescribed masks; common-list refinements keep their exact covering corrections.
  For the partition functions, set $epsilon = C_H v epsilon.alt_K$. Summing the support-hit bound gives
  $ sum_lambda e^(2 s_lambda) parallel k_(2 \, lambda) - k_(1 \, lambda) parallel_oo lt.eq epsilon . $
  By Lemma 49 and Proposition 21,
  $ lr(|frac(integral e^(X_1) Xi_2 thin upright(d) q, hat(Z)_1) - 1|) lt.eq e^epsilon - 1 . $
  Both actual densities are positive, hence $Xi_2 > 0$. The exponent bound therefore compares $hat(Z)_2$ with $integral e^(X_1) Xi_2 thin upright(d) q$ by factors between $e^(- epsilon)$ and $e^epsilon$. For small $epsilon$ taking logarithms proves (2.26). Each extracted bulk scalar is exactly per volume and independent of the period, by (1.64); winding corrections remain in the density. This fact will allow the scalars to cancel in the doubling test. ◻
]

===== 2.2.3 One reference box for every offset <one-reference-box-for-every-offset>

Recall the rectangular test from (1.105),

$ Delta_beta \( n \, w \) = 4 log Z_beta \( n \, w \) - log Z_beta \( 2 n \, 2 w \) . $

For later plane comparisons we use

#[#set math.equation(numbering: n => "(2.27)")
 $ cal(A) & = { \( 1 \, 1 \) \, \( 1 \, 25 \) } \,\
cal(U) & = cal(A) union { \( u_1 \/ 2 \, u_2 \) : \( u_1 \, u_2 \) in cal(A) } union { \( 2 u_1 \, u_2 \/ 2 \) : \( u_1 \, u_2 \) in cal(A) } . $ <eq:offset-aspect-inventory>]

The auxiliary aspects are needed when one doubles the time period and then the spatial period. The aspect $\( 1 \, 25 \)$ will also cover the inclined microscopic tori.

#thm([Lemma 2.9.])[
  (A reference-box test uniform in the offset).  #emph[The contraction slack $upsilon > 0$ and then the parameters may be chosen so that there exist integers $K_0 \, M_0 gt.eq 1$ with 
#[#set math.equation(numbering: n => "(2.28)")
 $ 0 lt.eq Delta_beta \( u_1 M_0 L^N \, u_2 M_0 L^N \) lt.eq 2^(- 10) $ <eq:offset-box-test>]

 whenever $N gt.eq K_0$, $beta = theta.alt_N + s$, $\| s \| lt.eq R$, and $\( u_1 \, u_2 \) in cal(U)$. The integer $M_0$ may be required to exceed any fixed lower bound and to be divisible by any fixed integer. In particular all displayed half-periods and all tile counts required in Section 6 can be even.]
] <lem:offset-box-test>

#proof[
  Let $eta > 0$ be the gain in Proposition 4. Choose the slack small enough to admit a number $z$ with
  #[#set math.equation(numbering: n => "(2.29)")
   $ 0 < upsilon \/ 2 < z < min { 1 \, eta \/ \( 2 pi \) } . $ <eq:offset-box-exponents>]
  Fix all large-$H$ requirements, including Lemma 49, before choosing the box sizes. Take $m_K$ to be a fixed common integer multiple of a rounded dyadic integer with
  $ log_L m_K = \( 1 - z \) K + O \( 1 \) . $
  The fixed multiple clears the denominators of $cal(U)$ and imposes the divisibilities and lower bounds in the statement.
  For each depth-$N$ ordinary run with $\| s \| lt.eq R$, and each $K lt.eq N$, Lemma 46 supplies a depth-$K$ ordinary run with bare coupling $tilde(beta)_K = theta.alt_K + tilde(s)_K$, $\| tilde(s)_K \| lt.eq R'$, and exactly the same terminal coupling. Uniformly over these retunings,
  $ tilde(beta)_K = H + gamma K + O_(H \, L \, R') \( log \( 2 + K \) \) \, #h(2em) X \( tilde(beta)_K \) lt.eq C_H \( 1 + K \)^C L^(\( 2 - eta \/ \( 2 pi \) \) K) . $
  The shorter side of $\( u_1 \, u_2 \) m_K L^K$ is comparable to $L^(\( 2 - z \) K)$. Its ratio to this preliminary upper length grows exponentially, by $z < eta \/ \( 2 pi \)$. The even periods thus satisfy all hypotheses of (1.3), whose exponentially small factor dominates its polynomial prefactor. Consequently
  $ sup_(N gt.eq K \, med \| s \| lt.eq R\
\( u_1 \, u_2 \) in cal(U)) Delta_(tilde(beta)_K) \( u_1 m_K L^K \, u_2 m_K L^K \) arrow.r 0 . $
  Run both cutoffs to their common terminal rectangle $\( u_1 \, u_2 \) m_K$, of volume $v = u_1 u_2 m_K^2$, and do the same on the doubled rectangle. These periods are admitted: the imposed terminal lower bound and the growth of the periods through earlier layers give the conditions in Section 2.1. Proposition 50 applies, because the two terminal couplings agree. Since
  $ m_K^2 epsilon.alt_K = L^(\( upsilon - 2 z \) K + O \( 1 \)) arrow.r 0 \, $
  its partition-function estimates are applicable for large $K$. The per-volume scalars cancel separately in each rectangular test, giving
  $ & lr(|Delta_beta \( u_1 m_K L^N \, u_2 m_K L^N \) - Delta_(tilde(beta)_K) \( u_1 m_K L^K \, u_2 m_K L^K \)|)\
 & #h(35mm)  lt.eq C_H m_K^2 epsilon.alt_K arrow.r 0 $
  uniformly over the displayed family. Choose one sufficiently large $K_0$ and set $M_0 = m_(K_0)$. Nonnegativity of the tests follows from the two-direction transfer identities (1.111). This proves (2.28). ◻
]

===== 2.2.4 Transfer bounds and the plane limit <transfer-bounds-and-the-plane-limit>

Only the finite list of tests in Lemma 51 is needed from renormalization for the next result. The rest is the positive-transfer argument of Section 7, now applied uniformly to the offset family.

#thm([Proposition 2.10.])[
  (Uniform volume comparison and slab decay).  #emph[Fix $K_0 \, M_0$ as in Lemma 51. There exist $C \, c > 0$, independent of $N gt.eq K_0$, $\| s \| lt.eq R$, and $k gt.eq 0$, such that the following hold for $beta = theta.alt_N + s$.]
  #emph[Let $\( u_1 \, u_2 \) in cal(A)$ and $\( n \, w \) = \( u_1 \, u_2 \) 2^k M_0 L^N$. If a bounded local observable $F$ has support contained in a rectangle of time extent at most $n \/ 2$ and spatial extent at most $w \/ 2$, then 
#[#set math.equation(numbering: n => "(2.30)")
 $ \| mu_(beta \; n \, w) \( F \) - mu_beta \( F \) \| lt.eq C parallel F parallel_oo e^(- c 2^k) . $ <eq:offset-uniform-volume>]

 The same bound holds when time is closed by any integer spatial translation, provided the support has a lift satisfying these two extent bounds. The constant is uniform in the closing translation.]
  #emph[If two bounded local plane observables $F \, G$ have supporting slabs separated by $d gt.eq 0$ transfer edges, in either microscopic axial direction, then 
#[#set math.equation(numbering: n => "(2.31)")
 $ \| "Cov"_(mu_beta) \( F \, G \) \| lt.eq parallel F parallel_oo parallel G parallel_oo e^(- \( log 2 \) d \/ \( M_0 L^N \)) . $ <eq:offset-slab-decay>]

 For complex observables the covariance uses $overline(F) G$.]
] <prop:uniform-volume>

#proof[
  For clarity we specify which parts of the transfer proof are independent of the chosen trajectory. The nearest-neighbor operator $K_w$ of (1.108) is positive semidefinite and has strictly positive kernel for every $beta gt.eq 0$. Its largest eigenvalue is simple; let $T_w = K_w \/ lambda_1 \( w \)$, let $P_w$ be the projection onto its normalized positive ground state $Omega_w$, and write
  $ s_j \( w \) = "Tr" \( T_w^j - P_w \) \, #h(2em) j gt.eq 1 . $
  Lemma 27 and Proposition 28 use only this positivity and the rectangular test. They give
  $ Delta_beta \( 2^k n \, 2^k w \) lt.eq 64^(- 1) 2^(- 2^k) $
  from each test in (2.28). Applied at the auxiliary aspects of (2.27), this implies
  $ s_(n \/ 2) \( w \) lt.eq C e^(- c 2^k) \, #h(2em) s_(w \/ 2) \( 2 n \) lt.eq C e^(- c 2^k) \, $
  where the second expression refers to transfer in the spatial direction.
  An insertion on a slab of $r gt.eq 1$ steps has normalized operator $A_F$ whose kernel is bounded in absolute value by $parallel F parallel_oo K_w^r$ before normalization. Thus $\| A_F f \| lt.eq parallel F parallel_oo T_w^r \| f \|$ and $parallel A_F parallel lt.eq parallel F parallel_oo$, also for complex $F$. For $r = 0$, $A_F$ is multiplication by $F$ and obeys the same norm bound. For $r lt.eq n \/ 2$, separating the ground-state projection in the transfer trace gives (1.114):
  $ \| mu_(beta \; n \, w) \( F \) - chevron.l Omega_w \, A_F Omega_w chevron.r \| lt.eq 2 parallel F parallel_oo s_(n \/ 2) \( w \) . $
  Use this first to compare $\( n \, w \)$ with $\( 2 n \, w \)$, and then, after interchanging the coordinates, to compare $\( 2 n \, w \)$ with $\( 2 n \, 2 w \)$. The two preceding excited-trace estimates give an error $C parallel F parallel_oo e^(- c 2^k)$. Summing over all further simultaneous doublings proves (2.30); the limit is $mu_beta$ by Proposition 4. Bounded measurable insertions are covered as in the proof of Theorem 29: finite-support marginals have a uniform density bound at this fixed $beta$, and approximation in product area measure extends the identification of the local limit.
  For a closing shift $h$, its unitary $U_h$ commutes with $T_w$ and fixes $Omega_w$. Place the seam outside the supporting slab. The denominator and numerator are respectively
  $ "Tr" \( T_w^n U_h \) \, #h(2em) "Tr" \( A_F T_w^(n - r) U_h \) . $
  Their remainders after the ground-state contribution have absolute values at most $s_n \( w \)$ and $parallel F parallel_oo s_(n - r) \( w \)$, uniformly in $h$. The reference tests ensure $s_n \( w \) < 1 \/ 2$. Division thus changes the cylinder expectation by at most $4 parallel F parallel_oo s_(n \/ 2) \( w \)$, proving the shifted assertion.
  Finally set $n_0 = M_0 L^N$. The square test gives, at all circumferences $w = 2^k n_0$,
  $ parallel T_w^d - P_w parallel lt.eq e^(- \( log 2 \) d \/ n_0) $
  by (1.113). For ordered slab insertions the cylinder covariance is
  $ chevron.l Omega_w \, A_(overline(F)) \( T_w^d - P_w \) A_G Omega_w chevron.r . $
  The insertion norm bounds prove (2.31) on these cylinders. Their local limit is the periodic plane law by the half-period trace estimates and the torus comparison already proved. Passing to that limit proves the plane estimate. Interchanging coordinates gives the other axial direction. ◻
]

===== 2.2.5 Common physical tori for the inclined schemes <common-physical-tori-for-the-inclined-schemes>

The shifted closing condition has a concrete role: it puts the ordinary and inclined embeddings on the same physical square tori. We spell out the integer geometry to fix both the length factor and the finite list of aspects used above.

#thm([Lemma 2.11.])[
  (Inclined periods).  #emph[Let $M_k = 2^k M_0$. Embed an ordinary depth-$N$ run with spacing $L^(- N)$ and axes the identity, and a type $plus.minus$ run with spacing $a = L^(- N) \/ 5$ and axes $O_plus.minus^(- 1)$. The square physical torus of side $M_k$ has ordinary microscopic periods $M_k L^N e_1$ and $M_k L^N e_2$. For type $+$ its microscopic periods, in $\( upright("space") \, upright("time") \)$ coordinates, are 
#[#set math.equation(numbering: n => "(2.32)")
 $ v_1 = M_k L^N \( 3 \, 4 \) \, #h(2em) v_2 = M_k L^N \( - 4 \, 3 \) . $ <eq:offset-inclined-periods>]

 They are equivalent to spatial circumference $25 M_k L^N$ and time height $M_k L^N$, closed by the spatial shift $7 M_k L^N$. The reflected type has the same circumference and height, with shift $- 7 M_k L^N$. These periods are compatible with the initial inclined blocking and the subsequent ordinary blockings, and have terminal square periods $M_k$.]
  #emph[Let $F_N$ be any bounded observable whose physical support in the chosen embedding is contained in one fixed compact set, and put $beta = theta.alt_N + s$, $\| s \| lt.eq R$. Its support has lifts obeying the half-extent hypotheses of Proposition 52 for all sufficiently large $k$, uniformly in $N gt.eq K_0$ and $s$. Its torus expectation therefore differs from its plane expectation by $C parallel F_N parallel_oo e^(- c 2^k)$ in all three embeddings.]
] <lem:inclined-periods>

#proof[
  The columns of $O_(+)$ are $\( 3 \, 4 \) \/ 5$ and $\( - 4 \, 3 \) \/ 5$. Multiplication of (2.32) by $\( L^(- N) \/ 5 \) O_(+)^(- 1)$ gives $M_k e_1 \, M_k e_2$. The integer basis change
  $ 3 v_1 - 4 v_2 = \( 25 M_k L^N \, 0 \) \, #h(2em) v_1 - v_2 = \( 7 M_k L^N \, M_k L^N \) $
  has determinant one. It therefore preserves the period lattice and proves the asserted shifted representation. Reflection changes the sign of the spatial shift and gives the type $-$ statement.
  The initial coarse translation lattice of the inclined observation is $5 L O_plus.minus bb(Z)^2$, as in Lemma 7. The periods above belong to it and become $M_k L^(N - 1) e_1 \, M_k L^(N - 1) e_2$ in the output frame. The remaining ordinary steps yield square periods $M_k$. The fixed divisibilities of $M_0$ and the terminal lower bound ensure admissibility at every layer, by Section 2.1.
  A compact physical support of diameter $D$ has microscopic coordinate extents at most $C D \/ a lt.eq C' D L^N$ in either inclined frame; translations of its chosen lift do not change those extents. For all sufficiently large $k$, these are at most half the time height $M_k L^N$ and half the spatial circumference $25 M_k L^N$. The same assertion for the ordinary frame uses aspect $\( 1 \, 1 \)$. Thus the two aspects in $cal(A)$ and the shifted estimate of Proposition 52 prove the final claim. ◻
]

==== 2.3 Continuum fields at a fixed bare-coupling offset <sec:fields>

The density comparison of Proposition 47 leaves one real parameter, the limiting offset of the bare coupling. We now construct the field hierarchy at each offset and compare the three blocking prescriptions in common physical coordinates. The last part of the section controls the full two-point measure, including its tails. This is what permits normalization by susceptibility and second-moment length; convergence on compact tests alone would not suffice.

Throughout, the parameters have the choices of Propositions 45 and 52. Write $I = \( - R \, R \)$, and let a run of type $P in { r \, + \, - }$, depth $N$, and offset $s$ have bare coupling $beta = theta.alt_N + s$. Recall the matching condition

#[#set math.equation(numbering: n => "(2.33)")
 $ \( s_2 + A_(P_2) \) - \( s_1 + A_(P_1) \) arrow.r 0 \, $ <eq:field-offset-matching>]

for two sequences of runs whose depths tend to infinity. The discrepancies $u_j$ and $lambda_j$ are the source-free density and precise-coupling discrepancies at layer $j$. By Proposition 47, both tend to zero at each fixed layer under (2.33). All finite-period comparisons below use the same reference thresholds and the common record lists, with zero padding, prescribed in Section 2.

===== 2.3.1 Local sources and their normalization <local-sources-and-their-normalization>

We use the exact source representation of Section 8. Its additional regular records have positive source degree and are anchored at a source site; their complete supports include every source and spin argument. The covering records retain their mandatory inventories and complete supports. All norms sum absolute power-series coefficients at source radius one. In particular, identifying source variables or setting some of them to zero respects the bounds. The leading linear spin source is kept separately from these records. Spin-independent terms of source degree at least two stay in their supported regular records. There is no source-dependent volume scalar whose removal could change a moment generating function.

To distinguish a source cap from the offset radius $R$, write

$ R_j^(upright("src")) = H_j^(- 1 \/ 10) \, #h(2em) w_j = exp \( - p_j^(1 \/ 4) \) . $

These are the caps denoted by $R_j \, w_j$ in Equation (1.118). In each bulk or finite-period representation, take the positively weighted source discrepancy of Proposition 31, divided by these two caps, with regular differences measured through seven derivatives and absent records padded by zero. Write these quantities as $v_j^(upright(s r c \, b u l k))$ and $v_j^(upright("src") \, T)$, where $T$ denotes a common terminal period followed through the layers. In parallel with the density discrepancy (2.1), use

#[#set math.equation(numbering: n => "(2.34)")
 $ v_j^(upright("src")) = max { v_j^(upright(s r c \, b u l k)) \, med sup_T v_j^(upright("src") \, T) #scale(x: 120%, y: 120%)[}] . $ <eq:offset-family-source-discrepancy>]

For a bulk-only comparison the supremum is omitted. Otherwise it ranges over the periods being compared, or a compatible admitted family, with the same source weights and caps. This simultaneous discrepancy is uniformly bounded by the caps. It always includes the bulk data that determine $c_j$; a discrepancy on an isolated torus is not used to control that scalar.

#thm([Proposition 2.12.])[
  (Source transport along offset trajectories).  #emph[Every admitted run above carries the microscopic source $exp \( sum_x z_x dot.op q_x \)$ exactly through its block integrations. The additional source lists begin at zero and satisfy their caps at each layer. A step of side $l_j$, from layer $j$ to layer $j - 1$, has a bulk coefficient $c_j > 0$ with 
#[#set math.equation(numbering: n => "(2.35)")
 $ z_x = frac(z'_(\[ x \]), l_j^2 c_j) \, #h(2em) \| c_j - 1 \| lt.eq C_L R_j^(upright("src")) . $ <eq:offset-source-substitution>]

 For a comparison on a common ordinary step, 
#[#set math.equation(numbering: n => "(2.36)")
 $ v_(j - 1)^(upright("src")) & lt.eq q_s v_j^(upright("src")) + C_L \( log H_j \)^D \( u_j + epsilon.alt_h + \| lambda_j \| \/ H_j \) \,\
\| c_(2 \, j) - c_(1 \, j) \| & lt.eq C_L R_j^(upright("src")) #scale(x: 120%, y: 120%)[\[] v_j^(upright("src")) + \( log H_j \)^D \( u_j + epsilon.alt_h + \| lambda_j \| \/ H_j \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) q_s < 1 . $ <eq:offset-source-comparison>]

 The statements hold in bulk and on every compatible admitted period. The coefficient $c_j$ is the same bulk coefficient in all these periods.]
] <prop:source-input>

#proof[
  The initial source has zero additional regular and covering lists and has all support, normalization, reality, and internal covariance properties required in Section 8. Proposition 45 supplies the coupling bands for every step, including the inclined first step. Hence Proposition 31 applies inductively and renews the caps. Equation (2.35) is Equation (1.119). We spell out the simultaneous use of the comparison proof, since the scalar is extracted in bulk and then used on every period.
  Before the final scalar division, the one-difference estimates in the proof of Proposition 31 give an isolated degree-one transfer factor $C \/ L + o_H \( 1 \)$ and a higher-degree factor $C \/ L^2 + o_H \( 1 \)$; these are the discrepancy versions of Equations (1.123) and (1.122). The remaining regular terms and covering transfers have the smaller allowances specified there. Apply these bounds to the bulk and to each period, using the dominating discrepancies $u_j$ and $v_j^(upright("src"))$. Extract $c_(2 \, j) - c_(1 \, j)$ from the bulk degree-one output coefficients. Its source-discrepancy contribution retains that degree-one transfer gain; its remaining contribution is bounded by $C_L R_j^(upright("src")) \( log H_j \)^D \( u_j + epsilon.alt_h + \| lambda_j \| \/ H_j \)$.
  Now perform the alignment subtraction and the scalar division on each period with these bulk coefficients. The extraction paragraph of the source proof controls the subtraction, off-mask corrections, and winding compensations by fixed multiples of their coefficient bounds, with spare support exponents paying for the declared winding records. Changing the scalar argument in an already small positive-degree remainder has the additional source cap and is controlled by the spare analytic radius. Thus these operations preserve the preceding contraction gains up to multipliers fixed before the choice of $L$, using the already reserved support exponents. As in the closure of that proof, choose $L$ sufficiently large for these multipliers and then $H$ sufficiently large for the remaining allowances. The resulting common contraction is still $q_s < 1$. The precise-coupling discrepancy and history forcing are shared across the family. Taking its supremum after these normalization estimates proves the first line of (2.36); the bulk extraction estimate proves the second line. This is the simultaneous interpretation of Equation (1.120), rather than an inference from a finite-period discrepancy alone. The source-free output and the source-independent bulk scalar are unchanged. No terminal-coupling equality is a hypothesis of that proposition. ◻
]

For each run define the positive field factor

#[#set math.equation(numbering: n => "(2.37)")
 $ B_(P \, N \, s) = product_(j = 1)^N c_(P \, N \, s \, j)^(- 1) . $ <eq:offset-field-factor>]

We suppress some subscripts when a run has already been specified.

#thm([Lemma 2.13.])[
  (Fixed-layer sources and comparison of products).  #emph[Under (2.33), the source discrepancy tends to zero at each fixed layer, and $c_(2 \, j) - c_(1 \, j) arrow.r 0$ at every fixed step $j gt.eq 1$. In addition, for the ordinary and either inclined run at the same $N$ and $beta = theta.alt_N + s$, with $\| s \| lt.eq R$, one has 
#[#set math.equation(numbering: n => "(2.38)")
 $ C_H^(- 1) lt.eq B_(plus.minus \, N \, s) / B_(r \, N \, s) lt.eq C_H \, $ <eq:offset-product-ratio>]

 uniformly in $N$. The products for the two mirror inclinations agree.]
] <lem:source-comparison>

#proof[
  The normalized discrepancies are uniformly bounded by the caps. For a fixed $j$, Proposition 47 makes the source-free forcing in (2.36) tend to zero; the shared ordinary history also gives $epsilon.alt_h arrow.r 0$. Therefore the upper limits $V_j = limsup v_j^(upright("src"))$ satisfy $V_(j - 1) lt.eq q_s V_j$. For every $m$, $V_j lt.eq q_s^m V_(j + m)$; boundedness and $q_s < 1$ imply $V_j = 0$. The second line of (2.36) proves the scalar assertion.
  For the product estimate, compare the ordinary and inclined runs after their first steps, identifying their output coordinates. Admission gives $\| lambda_j \| lt.eq C_(L \, R')$. If $x = N - 1 - j$, the common-tail history forcing is bounded by $C_L H_N^D r_0^x$, with $r_0 < 1$. Iteration of the shape recurrence used in Proposition 47 gives, after enlarging a fixed exponent $D$ and choosing $r_1 in \( 0 \, 1 \)$,
  #[#set math.equation(numbering: n => "(2.39)")
   $ u_j lt.eq min { C \, C_L H_N^D r_1^x } + C_L frac(\( log H_j \)^D, H_j) . $ <eq:offset-clipped-comparison>]
  Here one first sums the geometric convolution and then uses the uniform cap. The logarithmic ratio is eventually decreasing as its argument increases, so its convolution has the displayed bound. Finitely many smaller arguments are absorbed in $C_L$. Applying (2.36) gives the same bound for $v_j^(upright("src"))$ and $\| c_(plus.minus \, j) - c_(r \, j) \| \/ R_j^(upright("src"))$, with possibly larger $D$ and $r_1 < 1$. The latter quantity can be clipped because each coefficient satisfies (2.35).
  The second term is summable after multiplication by the source cap:
  $ sum_(j gt.eq 1) R_j^(upright("src")) frac(\( log H_j \)^D, H_j) = sum_(j gt.eq 1) frac(\( log H_j \)^D, H_j^(11 \/ 10)) < oo . $
  For the first term, split the steps at $J_N = ceil.l K log H_N ceil.r$. On the first $J_N$ steps from the top, the clipped estimate costs at most $C_H H_N^(- 1 \/ 10) log H_N$ for large $N$. The remaining steps cost at most
  $ C_H H_N^D sum_(x gt.eq J_N) r_1^x lt.eq C_H H_N^(D + K log r_1) . $
  Choose $K$ so that the exponent is negative. The first step itself is controlled by the individual scalar bounds, and finitely many small depths have a uniform bound. Thus $sum_(j = 1)^N \| c_(plus.minus \, j) - c_(r \, j) \| lt.eq C_H$. All coefficients lie in a fixed positive neighborhood of one, so the sum of the logarithmic differences is bounded as well. Exponentiation proves (2.38). This is the argument of Proposition 33, with bounded-offset admission supplying its bound on $lambda_j$. Reflection covariance of the bulk source rule gives equality for the mirror inclinations. ◻
]

===== 2.3.2 Physical embeddings and moment bounds <physical-embeddings-and-moment-bounds>

We give the terminal lattice spacing the physical value one. Set

#[#set math.equation(numbering: n => "(2.40)")
 $ a_(r \, N) = L^(- N) \, quad U_r = upright("Id") \, #h(2em) a_(plus.minus \, N) = 1 / 5 L^(- N) \, quad U_plus.minus = O_plus.minus^(- 1) . $ <eq:offset-embeddings>]

Thus an inclined first step brings the coarse frame to the standard frame. With $a = a_(P \, N)$, $U = U_P$, and $B = B_(P \, N \, s)$, define

#[#set math.equation(numbering: n => "(2.41)")
 $ phi.alt_(P \, N \, s) \( f \) = B a^2 sum_(x in bb(Z)^2) f \( a U x \) dot.op q_x . $ <eq:offset-fields>]

On a torus the sum is over its periodic microscopic lattice. For components $bold(alpha) = \( alpha_1 \, dots.h \, alpha_n \)$, let

#[#set math.equation(numbering: n => "(2.42)")
 $ S_(n \, P \, N \, s)^(bold(alpha) \, upright("cut")) = \( B a^2 \)^n sum_(x_1 \, dots.h \, x_n) bb(E) #h(-0.16667em) [product_(i = 1)^n q_(x_i)^(alpha_i)] delta_(\( a U x_1 \, dots.h \, a U x_n \)) . $ <eq:offset-moment-measures>]

The expectation is taken in the periodic plane state unless a torus is specified. We use the common physical square tori of side $M_k = 2^k M_0$ supplied by Lemma 53.

#thm([Lemma 2.14.])[
  (Uniform moment bounds).  #emph[For $N gt.eq K_0$, $\| s \| lt.eq R$, and every type $P$, the component moment measures in the plane are nonnegative and satisfy 
#[#set math.equation(numbering: n => "(2.43)")
 $ S_(n \, P \, N \, s)^(bold(alpha) \, upright("cut")) \( Q_1 times dots.h.c times Q_n \) lt.eq C^n n ! $ <eq:offset-unit-box-bound>]

 for arbitrary physical unit boxes. The ordinary torus estimates are uniform in $k$; on each fixed inclined physical torus the same assertion holds with a constant depending on that torus.]
  #emph[Every fixed finite list of real bounded compactly supported vector tests consequently has a joint exponential moment in a neighborhood of zero, uniformly in these cutoffs. The same is true of continuous periodic tests on each fixed torus.]
] <lem:moment-bound>

#proof[
  Component positivity is Lemma 48; its finite-volume expansion also applies to the compatible oblique periods. For an ordinary run, choose at most $J$ terminal sites and denote their descendant-cell vector field sums by $X_Y$. Iterating (2.35) identifies $z_Y$ with the source coupled to $X_Y$. After removal of its source-independent scalar, the terminal source density is
  $ e^(X \( V \)) e^(sum_Y z_Y dot.op V_Y + G \( V \; z \)) Xi_z \( V \) . $
  Let $Z$ be its normalizer at $z = 0$, and let $mu_0$ be that source-free terminal probability law. At $\| z_Y^alpha \| lt.eq 1$, source anchoring gives $sup \| G \| lt.eq J R_0^(upright("src"))$. Every changed covering label has support meeting one of the selected sites, whence
  $ sum_lambda e^(2 s_lambda) ∥k_lambda \( z \) - k_lambda \( 0 \)∥_oo lt.eq J w_0 . $
  The two activity lists obey the combined cap with a fixed multiplier. The base law is an ordinary positive endpoint law, reflection positive at the block seams, with $b_0 in \[ H \/ 2 \, 2 H \]$. Its periods have all the required divisibilities. Proposition 21, with the band verification in Lemma 49, therefore gives $Z^(- 1) integral e^X \| Xi_z - Xi_0 \| lt.eq e^(J w_0) - 1$. As in the proof of Proposition 34, subtraction of the endpoint-spin generating function yields the explicit bound
  #[#set math.equation(numbering: n => "(2.44)")
   $ lr(|bb(E) e^(sum_Y z_Y dot.op X_Y) - bb(E)_(mu_0) e^(sum_Y z_Y dot.op V_Y)|) & lt.eq e^(3 J) \( e^(J R_0^(upright("src"))) - 1 \) + e^(3 J + J R_0^(upright("src"))) \( e^(J w_0) - 1 \)\
 & = o_H \( 1 \) $ <eq:offset-local-source-bound>]
  for fixed $J$, uniformly in depth, offset, and ordinary torus size.
  For one real component cell sum $X$, the bounds at sources $1$ and $- 1$ give $bb(E) e^(\| X \|) lt.eq C_0$ and $bb(E) \| X \|^n lt.eq C_0 n !$. Hölder’s inequality bounds a product of $n$ such sums by $C^n n !$. Every unit box is covered by a bounded number of terminal cells. Positivity of the component measures extends this estimate to the product of any $n$ unit boxes, at an exponential cost in $n$. Periodic coverings handle boxes crossing a period. At fixed cutoff the cell sums are bounded local observables, so the estimates pass to the plane.
  For an inclined field in the plane, use the ordinary field at the same bare coupling and depth. For either sign, the exact relation is
  $ phi.alt_(plus.minus \, N \, s) \( f \) = frac(B_(plus.minus \, N \, s), 25 B_(r \, N \, s)) phi.alt_(r \, N \, s) #scale(x: 120%, y: 120%)[\(] f \( O_plus.minus^(- 1) thin dot.op \/ 5 \) #scale(x: 120%, y: 120%)[\)] . $
  Lemma 55 and a bounded covering of the dilated, rotated boxes prove (2.43) in the plane.
  On a fixed inclined physical torus, the terminal volume is fixed. Absolute coefficient norms and support-hit bounds bound the entire source numerator in that volume. The source-free normalizer is uniformly bounded below after its bulk scalar has been removed: integrate all spins in one sufficiently small spherical cap. There are then no bad bonds, the mandatory gas has empty inventory and $Xi = 1$, and the regular and kinetic exponents are bounded. Positivity of the complete source-free density permits this restriction of the integral. The resulting bound can depend on the fixed terminal volume and on $H$, but not on $N$ or $s$. The inclined descendants of a terminal site remain within a fixed distance of its center, and every physical unit box meets descendants of only boundedly many sites. The preceding one-cell and covering argument now proves the asserted fixed-torus estimate. Reflection positivity of inclined steps is not used.
  Finally consider a real linear combination $Y$ of a finite list of field smearings. For even $n$, expand components and integrate the absolute test coefficients against the nonnegative measures in (2.43). A fixed bounded support can be covered by finitely many unit boxes, so $bb(E) \| Y \|^n lt.eq C_Y^n n !$. Odd absolute moments follow by Cauchy–Schwarz from the adjacent even moments, since $sqrt(\( n - 1 \) ! \( n + 1 \) !) lt.eq sqrt(2) thin n !$ for odd $n gt.eq 1$. Increasing $C_Y$ gives the estimate at every order. The exponential series converges for a sufficiently small positive argument. Hölder’s inequality gives the same conclusion for the sum of the absolute values of the finite list. This proves the assertions for signed as well as nonnegative tests. ◻
]

===== 2.3.3 Convergence at a limiting offset <convergence-at-a-limiting-offset>

The bounds just established allow us to pass from descendants of fixed coarse cells to arbitrary compact tests. We first work on a fixed physical torus, where the density and source comparisons control normalized integrals directly. The uniform volume estimate then identifies the plane limit.

#thm([Proposition 2.15.])[
  (Limits and comparison at fixed offsets).  #emph[Let $N arrow.r oo$ and $s arrow.r s_(*)$ with $\| s \| lt.eq R$, for a fixed type $P$. The fields (2.41) converge jointly in law and in all joint moments for every finite list of continuous compactly supported vector tests in the plane. The analogous assertions hold for continuous periodic tests on each fixed common physical torus. The limiting laws are determined by their moments.]
  #emph[Two such sequences satisfying (2.33) have the same limits in their specified embeddings. At every order and component choice, the plane measures (2.42) converge on continuous compact tests and in the strong topology of $cal(S)' \( \( bb(R)^2 \)^n \)$.]
  #emph[Denote the ordinary limiting hierarchy at offset $s in I$ by $F_s$, including its moment-determined joint laws. For either inclined type, the limit at offset $s$ is 
#[#set math.equation(numbering: n => "(2.45)")
 $ F_(s + d) \, #h(2em) s \, s + d in I \, #h(2em) d = A_(+) - A_r = A_(-) - A_r . $ <eq:inclined-offset-limit>]

]
] <prop:offset-limits>

#proof[
  Fix a common physical torus and a layer $j$ below the initial inclined step, if present. Its grid has mesh $L^(- j)$. Align the grids across the runs and use the same ordinary coordinate prescriptions on their common tail. These alignments are allowed by the translation covariance of the blocking. Translating a microscopic origin has, by microscopic translation invariance, the same effect on the moment measures as a translation of size $O \( a \)$. Lemma 56 and uniform continuity make this residual error vanish on continuous tests.
  Assign a test’s value at a layer-$j$ center to every microscopic descendant of that center. The exact source multiplier for these cell tests is
  #[#set math.equation(numbering: n => "(2.46)")
   $ L^(- 2 j) product_(i = 1)^j c_i^(- 1) . $ <eq:offset-cell-multiplier>]
  Indeed its microscopic coefficient is $B a^2$, and each traversed step multiplies it by $l_i^2 c_i$. For the traversed steps in either geometry,
  $ a^2 product_(i = j + 1)^N l_i^2 = L^(- 2 j) \, #h(2em) B product_(i = j + 1)^N c_i = product_(i = 1)^j c_i^(- 1) . $
  Their product is (2.46); the area factor of the inclined first step is already included in $a^2$. Only a fixed number of scalar factors occur, so this multiplier is bounded, bounded away from zero, and compares between matched runs by Lemma 55.
  At this fixed layer the period and its number of sites are fixed. The coefficient norms for canonical records sum their path coefficients; the masked regular norms bound the sums of their suprema; and the covering norms bound the activity sums at a support hit. Proposition 47 therefore makes the differences of the regular exponents and the absolutely convergent covering series tend to zero. The free-history bounds give the same assertion for the kinetic kernels. Their masks and reference thresholds are common, and $b_j$ remains in a fixed band. Thus the source-free exponents are bounded and compare uniformly after their volume scalars have been discarded. The source-list assertion in Lemma 55 gives the corresponding comparison of the positive-degree terms in absolute coefficient norms.
  For a finite list of cell tests choose one sufficiently small complex polydisc in their source variables so that all substituted arguments lie in a smaller source polydisc at layer $j$. The absolute series bounds control perturbations of these arguments as the multiplier (2.46) varies. The source-free denominators have a uniform positive lower bound by the same small-cap argument as in Lemma 56, now at layer $j$. Since the removed volume scalars are source independent, they cancel in the ratios. The normalized generating functions of the cell tests consequently differ by a quantity tending uniformly to zero on this polydisc. Cauchy’s formula proves comparison of all fixed joint moments.
  Every microscopic descendant lies within $C L^(- j)$ of its layer-$j$ center, for both cell geometries in the embeddings (2.40). On the fixed torus, replacing a continuous test by these cell values therefore has an error bounded by its modulus of continuity at $C L^(- j)$. Telescoping a product of tests one factor at a time and using (2.43) bounds the moment error by a constant times these moduli, uniformly in depth. First let the depths tend to infinity at fixed $j$, and then let $j arrow.r oo$. This proves moment comparison for continuous tests. Comparing two arbitrary subsequences of one sequence proves the Cauchy criterion, hence moment convergence.
  The factorial bounds of Lemma 56 imply tightness for each finite list of real field variables and uniform integrability of every polynomial in them. Each subsequential law has the moments just constructed and an exponential moment in a neighborhood of the origin. Its moment generating function is analytic there and is determined by those moments; this determines the law. All subsequential laws thus coincide, proving joint convergence in law on the fixed torus.
  For the plane, let $exp \( i sum_(nu = 1)^r t_nu phi.alt_(P \, N \, s) \( f_nu \) \)$ be a characteristic function observable. Its modulus is one regardless of $B$, and its microscopic support is the support of the smearings. For sufficiently large $k$ this support satisfies the lift and half-size conditions in Proposition 52, including the shifted-period description in Lemma 53. That proposition gives
  #[#set math.equation(numbering: n => "(2.47)")
   $ lr(|bb(E)_(upright("plane")) e^(i sum_nu t_nu phi.alt \( f_nu \)) - bb(E)_(upright("torus") \( k \)) e^(i sum_nu t_nu phi.alt \( f_nu \))|) lt.eq C e^(- c 2^k) \, $ <eq:offset-characteristic-comparison>]
  uniformly in the cutoff and offset. Plane tightness follows from the plane moment bound. Every subsequential plane characteristic function is, for each fixed $k$, within $C e^(- c 2^k)$ of the already constructed fixed-torus limit. Letting $k arrow.r oo$ identifies all subsequential plane laws and gives their equality for matched runs. Plane uniform integrability then gives convergence of all joint moments. Only bounded observables enter (2.47); no bound uniform in increasing inclined torus size is needed.
  Finite sums of product tests are uniformly dense on a product of compact insertion-coordinate sets. The component measures have uniformly bounded mass there by (2.43). The joint moment convergence therefore gives convergence against every continuous compact test to a nonnegative Radon measure. Summing unit boxes with the integrable weights $\( 1 + \| y_i \|^2 \)^(- 2)$ gives, at fixed order $n$, the common bound
  #[#set math.equation(numbering: n => "(2.48)")
   $ \| S_n^(bold(alpha) \, upright("cut")) \( f \) \| \, med \| F_s^(bold(alpha)) \( f \) \| lt.eq C^n n ! thin p_n \( f \) \, #h(2em) p_n \( f \) = sup_(y_1 \, dots.h \, y_n) \| f \( y \) \| product_(i = 1)^n \( 1 + \| y_i \|^2 \)^2 . $ <eq:offset-schwartz-bound>]
  This proves temperedness and convergence on Schwartz tests by cutting off the tails.
  For completeness, this convergence is strong: it is uniform on each bounded subset $cal(B)$ of Schwartz space. The higher weighted seminorms bounded on $cal(B)$ make the discarded tails tend to zero uniformly in $p_n$. On a fixed compact set, restrictions of $cal(B)$ are uniformly bounded and equicontinuous, hence have finite uniform-norm nets. Convergence for the finitely many net elements and the common compact mass bound make the error uniform on $cal(B)$. Combining these two statements proves the strong topology assertion.
  Finally, a type $plus.minus$ sequence with offset tending to $s$ and an ordinary sequence with offset tending to $s + d$ satisfy (2.33). This proves (2.45). ◻
]

===== 2.3.4 The relative two-point measure <the-relative-two-point-measure>

We next pass from local convergence to susceptibility and second-moment length. Write $S_2^(upright("cut"))$ for the first-component two-point measure of a run. In coordinates $\( y_1 \, z \) = \( y_1 \, y_2 - y_1 \)$, microscopic translation invariance gives the exact factorization

#[#set math.equation(numbering: n => "(2.49)")
 $ S_2^(upright("cut")) = alpha_a ⊗ nu^(upright("cut")) \, #h(2em) alpha_a = a^2 sum_(x in bb(Z)^2) delta_(a U x) \, #h(2em) nu^(upright("cut")) = B^2 a^2 sum_(x in bb(Z)^2) C_beta \( x \) delta_(a U x) . $ <eq:relative-factorization>]

The first factor tends vaguely to Lebesgue measure. The second carries the susceptibility and length, so we must control its mass at large relative separation.

#thm([Lemma 2.16.])[
  (Uniform two-point tails).  #emph[There are constants $C \, c > 0$, uniform over $N gt.eq K_0$, $\| s \| lt.eq R$, and the three types, such that for physical unit boxes with center separation $T$, 
#[#set math.equation(numbering: n => "(2.50)")
 $ S_2^(upright("cut")) \( Q times Q' \) lt.eq C e^(- c T) . $ <eq:offset-two-point-decay>]

 Consequently, for a unit box $Q_u$ centered at $u$, 
#[#set math.equation(numbering: n => "(2.51)")
 $ nu^(upright("cut")) \( Q_u \) lt.eq C e^(- c \| u \|) . $ <eq:relative-unit-tail>]

 Along each convergent-offset sequence of Proposition 57, the measures $nu^(upright("cut"))$ converge vaguely, in total mass, and in second moment to a finite nonnegative measure $nu$. Its tensor product with Lebesgue measure is the limiting first-component two-point measure in the relative coordinates.]
] <lem:two-point-tails>

#proof[
  Let $X_Q$ and $X_(Q')$ be the first-component field sums over the two boxes. Internal symmetry gives zero means; their fourth moments are uniformly bounded by Lemma 56. Write $T_D \( x \) = max { - D \, min { x \, D } }$ for odd truncation. Then
  $ ∥X_Q - T_D \( X_Q \)∥_(L^2)^2 lt.eq D^(- 2) bb(E) \| X_Q \|^4 lt.eq C D^(- 2) . $
  The second moments of the other factors are bounded, so Cauchy–Schwarz shows that replacing both variables by their truncations changes their covariance by at most $C \/ D$.
  For sufficiently large $T$, at least one microscopic axial direction separates the supports by $\( c_1 T - C_1 \) \/ a$ lattice steps. Apply the slab covariance bound in Proposition 52 to the truncated variables. Since $a L^N$ equals either $1$ or $1 \/ 5$, it gives
  $ \| "Cov" \( T_D \( X_Q \) \, T_D \( X_(Q') \) \) \| lt.eq C D^2 e^(- c_2 T) . $
  Choosing $D = e^(c_2 T \/ 4)$ proves (2.50); a larger constant covers bounded separations.
  Fix a unit box $Q$ near the origin. For small $a$, $alpha_a \( Q \)$ is bounded below by a positive constant. Positivity and (2.49) imply
  $ alpha_a \( Q \) nu^(upright("cut")) \( Q_u \) lt.eq S_2^(upright("cut")) #scale(x: 120%, y: 120%)[\(] Q times \( Q + Q_u \) #scale(x: 120%, y: 120%)[\)] . $
  The Minkowski sum on the right has a bounded unit-box covering, whose centers lie at bounded distance from $u$. Thus (2.50) proves (2.51). Enlarge $K_0$ if necessary to have this uniform lower bound for $alpha_a \( Q \)$ throughout.
  To identify the vague limit, choose a continuous compactly supported function $h$ with $integral h = 1$. For every continuous compactly supported $g$ of the relative coordinate,
  $ S_2^(upright("cut")) #scale(x: 120%, y: 120%)[\(] h \( y_1 \) g \( y_2 - y_1 \) #scale(x: 120%, y: 120%)[\)] = alpha_a \( h \) nu^(upright("cut")) \( g \) \, #h(2em) alpha_a \( h \) arrow.r 1 . $
  Proposition 57 supplies the limit of the left side. The local bounds in (2.51) then identify a unique nonnegative Radon measure $nu$. Product tests in relative coordinates identify the limiting two-point measure with $thin upright(d) y_1 ⊗ nu$. Finally (2.51), summed over boxes, makes both $1$ and $\| z \|^2$ uniformly integrable outside large balls. Vague convergence with this tail control proves convergence of mass and second moment. ◻
]

For the ordinary hierarchy $F_s$, denote this relative measure by $nu_s$. Its candidate susceptibility and length are

#[#set math.equation(numbering: n => "(2.52)")
 $ m \( s \) = nu_s \( bb(R)^2 \) \, #h(2em) ell \( s \)^2 = frac(1, 4 m \( s \)) integral \| z \|^2 thin thin upright(d) nu_s \( z \) \, $ <eq:offset-mass-length>]

where the second definition is made after the positivity established below. Finiteness already follows from Lemma 58.

===== 2.3.5 Positive susceptibility and length <positive-susceptibility-and-length>

#thm([Proposition 2.17.])[
  (Canonical normalization at a fixed offset).  #emph[For every $s in I$, the quantities $m \( s \)$ and $ell \( s \)$ in (2.52) are finite and strictly positive. For an ordinary sequence with $N arrow.r oo$ and offset tending to $s$, 
#[#set math.equation(numbering: n => "(2.53)")
 $ B^2 a^2 chi_beta arrow.r m \( s \) \, #h(2em) a xi_beta arrow.r ell \( s \) . $ <eq:offset-cutoff-normalization>]

 For an inclined sequence with limiting offset $s$ and $s \, s + d in I$, the limits are $m \( s + d \)$ and $ell \( s + d \)$.]
  #emph[Define $G_s$ by applying to $F_s$ the change of smeared fields 
#[#set math.equation(numbering: n => "(2.54)")
 $ phi.alt \( f \) mapsto frac(1, ell \( s \) sqrt(m \( s \))) phi.alt #scale(x: 120%, y: 120%)[\(] f \( thin dot.op \/ ell \( s \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:canonical-hierarchy-normalization>]

 This is the unique positive constant length and field rescaling that sets both susceptibility and second-moment length to one. Along the ordinary sequences in (2.53), the canonical cutoff fields $Psi_beta$ converge to $G_s$ in joint law and all joint moments, and their component Schwinger measures converge strongly in $cal(S)'$ at every order. The analogous normalized inclined fields converge to $G_(s + d)$.]
  #emph[The functions $m \, ell$ are continuous on $I$. At every order and component choice, evaluation of $F_s$ and of $G_s$ on any fixed Schwartz test is continuous in $s$.]
] <prop:normalization>

#proof[
  Choose two ordinary terminal cells in a fixed bounded region, with positive distance between their closures. Their two terminal sites can be joined by a path of fixed length $r$. On an admitted axis torus, Corollary 25 applies to the source-free endpoint law in the full band $\[ H \/ 2 \, 2 H \]$ by Lemma 49. Its hypotheses are precisely the ordinary positive, seam-reflection-positive endpoint hypotheses used above for (2.44). Since $t_0 arrow.r 0$ and $H t_0^2 = p_0^2 arrow.r oo$ as $H arrow.r oo$,
  $ bb(E)_(mu_0) \| V_(Y_1) - V_(Y_2) \|^2 lt.eq r^2 #scale(x: 120%, y: 120%)[\(] t_0^2 + 4 e^(- c H t_0^2) #scale(x: 120%, y: 120%)[\)] = o_H \( 1 \) . $
  Internal $O \( 3 \)$ invariance gives
  $ bb(E)_(mu_0) \[ V_(Y_1)^1 V_(Y_2)^1 \] = 1 / 3 bb(E)_(mu_0) \[ V_(Y_1) dot.op V_(Y_2) \] = 1 / 3 + o_H \( 1 \) . $
  Cauchy’s formula applied to (2.44) transfers this estimate to the cutoff cell sums $X_1 \, X_2$:
  #[#set math.equation(numbering: n => "(2.55)")
   $ bb(E) \[ X_1 X_2 \] = 1 / 3 + o_H \( 1 \) \, $ <eq:offset-separated-cell-lower>]
  uniformly in depth, offset, and admitted axis torus. The large fixed choice of $H$ makes the right side at least a constant $c_0 > 0$. Passing to the plane at each fixed cutoff preserves this bound.
  Choose nonnegative continuous compact tests that dominate the indicators of the two cells and whose supports still have positive separation. The cell descendants lie in fixed such boxes for all sufficiently large depths. Positivity transfers (2.55) to these continuous tests, and compact-test convergence passes it to the limiting two-point measure. In relative coordinates this gives nonzero $nu_s$-mass a positive distance from the origin. Hence both $m \( s \) > 0$ and $integral \| z \|^2 thin thin upright(d) nu_s \( z \) > 0$. This also explains why a lower bound only at coincident points would not suffice for the length.
  At the cutoff, (2.49) has total relative mass and length
  #[#set math.equation(numbering: n => "(2.56)")
   $ m^(upright("cut")) = B^2 a^2 chi_beta \, #h(2em) ell^(upright("cut")) = a xi_beta . $ <eq:cutoff-mass-length-identity>]
  Lemma 58 gives convergence of their numerators and denominators, with the latter limit positive. This proves (2.53). The inclined conclusion follows from (2.45) and the same tail lemma.
  To check normalization and uniqueness, let a translation-invariant hierarchy have relative two-point measure $nu$, susceptibility $m > 0$, and length $ell > 0$. For positive constants $b \, l$, the change $phi.alt' \( f \) = b phi.alt \( f \( dot.op \/ l \) \)$ sends its relative measure to
  $ nu' = b^2 l^2 \( D_(1 \/ l) \)_(*) nu \, #h(2em) D_(1 \/ l) \( z \) = z \/ l . $
  The factor $l^2$ is the Jacobian of the first insertion coordinate. Thus $m' = b^2 l^2 m$ and $ell' = ell \/ l$. Requiring $m' = ell' = 1$ forces $l = ell$ and $b = \( ell sqrt(m) \)^(- 1)$, which proves (2.54) and uniqueness among positive constants. An overall field sign, if permitted, gives the same hierarchy by internal symmetry.
  Apply this calculation before taking the limit, using (2.56). The normalized field is exactly
  #[#set math.equation(numbering: n => "(2.57)")
   $ frac(1, ell^(upright("cut")) sqrt(m^(upright("cut")))) phi.alt_(P \, N \, s) #scale(x: 120%, y: 120%)[\(] f \( thin dot.op \/ ell^(upright("cut")) \) #scale(x: 120%, y: 120%)[\)] = frac(1, xi_beta sqrt(chi_beta)) sum_x f \( U_P x \/ xi_beta \) dot.op q_x . $ <eq:canonical-cutoff-identity>]
  For $P = r$ this is $Psi_beta$; for $P = plus.minus$ it is the corresponding spatial rotation of the same canonical field.
  The limits of $m^(upright("cut"))$ and $ell^(upright("cut"))$ are positive and finite. The scalar multipliers in (2.57) are therefore bounded, and the varying dilations of a continuous compact test converge uniformly with supports in a common compact set. The moment bound proves that this varying-test error tends to zero. It also gives uniform box bounds for the normalized measures: the inverse dilation of a unit box is covered by boundedly many old unit boxes. Factorial moments then give joint-law convergence and uniform integrability just as in Proposition 57. The common weighted bound and finite-net argument in that proposition give strong Schwartz convergence for the normalized measures as well.
  Finally let $s_i arrow.r s$ in $I$. For any one of the scalar quantities $m \, ell$ or a fixed component Schwinger evaluation of $F$ or $G$, choose a depth $N_i gt.eq i$ at offset $s_i$ for which the corresponding cutoff quantity approximates its limit at $s_i$ within $1 \/ i$. The convergence statements above apply to this sequence because its offsets tend to $s$; they identify its limit with the quantity at $s$. This proves all the asserted continuities without assuming uniform convergence in the offset in advance. ◻
]

#thm([Lemma 2.18.])[
  (Normalization of the shooting hierarchy).  #emph[The shooting hierarchy constructed in Proposition 35 has finite positive susceptibility and finite positive second-moment length. Applying the unique positive rescaling (2.54) to it is the limit of applying canonical susceptibility and length normalization to its cutoff fields. These assertions also hold when its sufficiently large auxiliary parameters are fixed independently of those used for the offset trajectories.]
] <lem:shooting-normalization>

#proof[
  Use the shooting prescription’s own constants and physical mesh $a_N = L^(- N)$. Theorem 29 supplies its slab covariance estimate at scale $L^N$, and Proposition 34 supplies uniform fourth moments and all-order factorial bounds. The factorization (2.49) is an exact lattice identity, so the proof of Lemma 58 applies with these constants. Proposition 35 then identifies the relative measure and gives convergence of its mass and second moment. Equation (1.146) in the proof of Proposition 42 gives a uniform positive two-point expectation on two separated terminal cells. The continuous majorants used in the proof of Proposition 59 show that the limiting relative measure has positive mass away from the origin. Its susceptibility and length are therefore strictly positive. The varying-test argument and the exact cutoff identity (2.57) now prove the normalization claim. All these inputs concern this shooting prescription itself, so no identification of its auxiliary parameters with the offset construction is required. ◻
]

==== 2.4 Uniqueness after canonical normalization <sec:uniqueness>

We now remove the offset parameter. The preceding section gives a continuous family $G_s$ of canonically normalized hierarchies for $s in I = \( - R \, R \)$, together with its positive second-moment length $ell \( s \)$ before normalization. Two descriptions of the same microscopic model relate different members of this family. An additional ordinary step changes the physical mesh by $L^(- 1)$; an inclined first step changes it by $5^(- 1)$ and rotates it. The two reflected inclinations have the same offset shift. These facts supply both rotational invariance and two incommensurable periods in $s$. Figure 3 records the two descriptions and their physical length factors.

For a rotation $U$ of the Euclidean plane, write $U_(*) G$ for the hierarchy obtained by pushing each insertion coordinate forward by $U$. At the field level this means $\( U_(*) phi.alt \) \( f \) = phi.alt \( f compose U \)$. Component indices are unchanged: these are rotations of Euclidean coordinates, distinct from the internal $O \( 3 \)$ symmetry.

===== 2.4.1 Two descriptions of one cutoff <two-descriptions-of-one-cutoff>

#thm([Proposition 2.19.])[
  (Depth and inclination relations).  #emph[For $s \, s - gamma in I$, 
#[#set math.equation(numbering: n => "(2.58)")
 $ G_(s - gamma) = G_s \, #h(2em) ell \( s - gamma \) = L^(- 1) ell \( s \) . $ <eq:uni-depth>]

 Let $d = A_(+) - A_(upright(r)) = A_(-) - A_(upright(r))$ be the offset shift defined in Section 1. For $s \, s + d in I$, 
#[#set math.equation(numbering: n => "(2.59)")
 $ ell \( s + d \) = 5^(- 1) ell \( s \) \, #h(2em) G_(s + d) = \( O_(+)^(- 1) \)_(*) G_s = \( O_(-)^(- 1) \)_(*) G_s . $ <eq:uni-incline>]

]
] <prop:two-scales>

#proof[
  Fix $s \, s - gamma in I$ and take bare couplings $beta_N = theta.alt_N + s$. Regard the same microscopic law first as an ordinary trajectory of depth $N$, and then as one of depth $N + 1$. The latter offset is
  $ beta_N - theta.alt_(N + 1) = s - \( theta.alt_(N + 1) - theta.alt_N \) arrow.r s - gamma . $
  Both descriptions are admitted for all sufficiently large $N$ by Proposition 45. At every cutoff, canonical normalization in Proposition 59 yields the same field $Psi_(beta_N)$. Their limiting hierarchies are therefore equal. Their cutoff second-moment lengths before normalization are respectively $L^(- N) xi_(beta_N)$ and $L^(- \( N + 1 \)) xi_(beta_N)$. Taking their positive limits proves (2.58).
  Next use an ordinary and an inclined trajectory of the same depth $N$ and the same bare coupling $theta.alt_N + s$. By Proposition 57, the inclined limiting hierarchy is the ordinary one at offset $s + d$. Its microscopic spacing is $L^(- N) \/ 5$ and its spatial embedding is $O_plus.minus^(- 1)$. Thus its second-moment length is exactly one fifth of the ordinary one, while its canonically normalized field is the pushforward of $Psi_(beta_N)$ by $O_plus.minus^(- 1)$. Passing to the limit gives (2.59). Reflection of the microscopic construction identifies the scalar canonical increments of the two inclinations, which is why the same $d$ occurs in both equalities. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.223cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Ordinary, depth $N$#linebreak()$s, a=L^(-N)$#linebreak()$G_s, ell (s)$]]])])
  content((6.623, 0), [#box(width: 4.223cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Ordinary, depth $N+1$#linebreak()$s- gamma +o(1)$#linebreak()$G_(s- gamma ), ell (s)"/"L$]]])])
  content((0, -2.899), [#box(width: 4.223cm, inset: 0.2117cm, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Inclined, depth $N$#linebreak()$s, a=L^(-N)"/"5$#linebreak()$G_(s+d), ell (s)"/"5$]]])])
  content((6.529, -2.899), [#box(width: 4.035cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[All three use the same#linebreak()bare coupling $beta_N$.]]])])
  line((2.112, 0), (4.512, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.312, 0), [#text(size: 9pt)[one extra step]], anchor: "south", padding: 0.1176cm)
  line((0, -0.7496), (0, -2.15), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, -1.45), [#box(width: 2.435cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[inclined#linebreak()first step]]])], anchor: "east")
  line((6.529, -2.44), (6.623, -0.7553), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((4.512, -2.899), (2.112, -2.899), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
})],
  caption: [Figure 3: The two scale comparisons. The displayed offsets in the boxes are the bare offsets of the trajectories; the inclined hierarchy matches the ordinary hierarchy at $s + d$. Canonical normalization cancels their different field multipliers. The inclined comparison retains only the Euclidean rotation, as in (2.59). ],
) <fig:two-scales>

===== 2.4.2 An elementary uniqueness mechanism <an-elementary-uniqueness-mechanism>

We isolate the topological part of the argument. Its input consists only of continuous distributions, positive lengths, and the relations just proved. In particular, it requires no monotonicity of the shooting map.

#thm([Lemma 2.20.])[
  (Two scale relations force constancy).  #emph[Let $L > 1$ be a power of two, let $gamma > 0$, and let $I = \( - R \, R \)$. Suppose $ell : I arrow.r \( 0 \, oo \)$ is continuous and $s mapsto G_s$ is a family of distribution hierarchies whose evaluation on every Schwartz test is continuous. Let $O_plus.minus$ be rotations by $plus.minus theta.alt$, where $cos theta.alt = 3 \/ 5$ and $sin theta.alt = 4 \/ 5$. Suppose (2.58) and (2.59) hold wherever both offsets belong to $I$, and suppose $2 R - \| d \| > gamma$. Then every $G_s$ is Euclidean rotation invariant, and $G_s$ is independent of $s$.]
] <lem:dense-periods>

#proof[
  First take $s$ in the interval $J = I ∩ \( I - d \)$. Equality of the two pushforwards in (2.59) implies invariance of $G_s$ under rotation by $2 theta.alt$. The number $theta.alt \/ pi$ is irrational. Indeed, if it were rational, $e^(i theta.alt)$ would be a root of unity, making $e^(i theta.alt) + e^(- i theta.alt) = 6 \/ 5$ an algebraic integer. A rational algebraic integer is an integer, which $6 \/ 5$ is not. Powers of this rotation are consequently dense in $S O \( 2 \)$. The action of rotations on Schwartz tests is continuous, so every distribution in $G_s$ is invariant under all Euclidean rotations. Equation (2.59) therefore gives $G_(s + d) = G_s$ on $J$.
  To use these local relations globally, extend the two families to $bb(R)$. For $x in bb(R)$, choose an integer $n$ with $x + n gamma in I$ and set
  #[#set math.equation(numbering: n => "(2.60)")
   $ tilde(G)_x = G_(x + n gamma) \, #h(2em) tilde(ell) \( x \) = L^(- n) ell \( x + n gamma \) . $ <eq:uni-extension>]
  Such an $n$ exists because $\| I \| > gamma$. These definitions do not depend on the choice: two representatives can be joined by consecutive $gamma$-steps staying in the interval $I$, and (2.58) applies at every step. On overlapping translates of $I$, the definitions agree; hence the extended families are continuous. They satisfy
  $ tilde(G)_(x + gamma) = tilde(G)_x \, #h(2em) tilde(ell) \( x + gamma \) = L tilde(ell) \( x \) . $
  The interval $J$ has length $2 R - \| d \| > gamma$, so every class modulo $gamma$ has a representative in $J$. Choosing that representative in (2.60) transports both the rotation invariance and the $d$-relations to every $x in bb(R)$:
  #[#set math.equation(numbering: n => "(2.61)")
   $ tilde(G)_(x + d) = tilde(G)_x \, #h(2em) tilde(ell) \( x + d \) = 5^(- 1) tilde(ell) \( x \) . $ <eq:uni-global-periods>]
  If $d \/ gamma = p \/ q$ with integers $p$ and $q > 0$, then iterating the length relations gives
  $ 5^(- q) tilde(ell) \( x \) = tilde(ell) \( x + q d \) = tilde(ell) \( x + p gamma \) = L^p tilde(ell) \( x \) . $
  Since $tilde(ell) \( x \) > 0$, this would imply $5^(- q) = L^p$, contradicting unique prime factorization. Thus $d \/ gamma$ is irrational. The subgroup $bb(Z) gamma + bb(Z) d$ is dense in $bb(R)$. Each test evaluation of $tilde(G)$ is continuous and has this subgroup as periods, and is therefore constant. Equality on every test proves equality of the hierarchies. Restriction to $I$ proves the claim. ◻
]

===== 2.4.3 Every bare coupling and the physical conclusions <every-bare-coupling-and-the-physical-conclusions>

#proof[
  Finiteness and strict positivity of $chi_beta$ and $xi_beta$ for sufficiently large $beta$ follow from Lemma 48. Proposition 61 supplies the hypotheses of Lemma 62; our choice of $R$ in Section 1 gives the required overlap. Write $G$ for the common normalized hierarchy.
  The reference values $theta.alt_N$ tend to infinity, and $theta.alt_(N + 1) - theta.alt_N arrow.r gamma > 0$. For every sufficiently large $beta$, choose $N = N \( beta \)$ so that
  $ theta.alt_N lt.eq beta < theta.alt_(N + 1) . $
  Then $N \( beta \) arrow.r oo$, and the offsets $s \( beta \) = beta - theta.alt_(N \( beta \))$ belong to the fixed compact interval $\[ 0 \, 2 gamma \] subset I$. Any sequence $beta_k arrow.r oo$ has a subsequence on which these offsets converge to some $s in I$. Propositions 57 and 59 give, along that subsequence, convergence of the canonically normalized fields to $G$, jointly in law and in every joint moment, and strong convergence of each component Schwinger distribution in $cal(S)'$. Moreover,
  $ L^(- N \( beta_k \)) xi_(beta_k) arrow.r ell \( s \) > 0 \, $
  so $xi_(beta_k) arrow.r oo$ along the same subsequence.
  These conclusions hold for a subsequence of every sequence tending to infinity, with the same limiting hierarchy. If any asserted convergence failed, a sequence staying outside a fixed neighborhood of the claimed limit would have such a subsequence, a contradiction. This proves the full $beta arrow.r oo$ assertions. The same argument applies to a neighborhood in the strong topology of $cal(S)'$; it does not require that topology to be metrizable. The finite-list laws are consistent, and their local exponential moments determine them from $G$.
  Finally let $phi.alt^(upright("sh"))$ be the hierarchy in Theorem 2, obtained by fixing a terminal kinetic coupling. Its auxiliary parameters need not equal those used for the offset argument. Lemma 60 gives finite positive susceptibility $m_(upright("sh"))$ and second-moment length $ell_(upright("sh"))$, and convergence of the corresponding cutoff quantities. Thus its normalization
  #[#set math.equation(numbering: n => "(2.62)")
   $ phi.alt^(upright("can")) \( f \) = frac(1, ell_(upright("sh")) sqrt(m_(upright("sh")))) phi.alt^(upright("sh")) #scale(x: 120%, y: 120%)[\(] f \( thin dot.op thin \/ ell_(upright("sh")) \) #scale(x: 120%, y: 120%)[\)] $ <eq:uni-shooting-identification>]
  is the limit of the same microscopic fields $Psi_(beta_N)$ along its shooting sequence. Since $beta_N arrow.r oo$, this hierarchy is $G$. Proposition 59 also proves uniqueness of the positive length and field constants fixing susceptibility and second-moment length to one. ◻
]

#proof[
  Equation (2.62) is a positive dilation of space-time and multiplication of the field by a nonzero constant. It preserves the Euclidean and internal symmetries, reflection positivity, symmetry of the Schwinger functions, clustering, and their factorial distributional bounds. The reconstruction argument of Section 10 therefore applies.
  More explicitly, substitution of the rescaled tests and field factors defines an invertible map of the positive-time polynomial algebras and preserves their Osterwalder–Schrader inner products. It induces a unitary map between the completed reconstructed spaces, taking vacuum to vacuum. A time translation by $t$ in canonical coordinates corresponds to one by $ell_(upright("sh")) t$ in shooting coordinates. Consequently the two Hamiltonians satisfy, under this unitary map,
  $ H_(upright("can")) = ell_(upright("sh")) H_(upright("phys")) . $
  The unique vacuum, the nonzero vacuum complement, and the positive lower bound on the full vacuum-orthogonal Hamiltonian therefore persist. A connected fourth distribution transforms by the nonzero fourth power of the field factor and the invertible dilation of its tests. Strict separation of time supports is preserved by a positive dilation. The nonzero separated connected fourth correlation of Theorem 2 thus remains nonzero in canonical units. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
