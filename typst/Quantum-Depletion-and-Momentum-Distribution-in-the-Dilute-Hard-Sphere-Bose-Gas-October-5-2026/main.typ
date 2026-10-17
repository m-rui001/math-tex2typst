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

#align(center)[#text(size: 16pt, weight: "bold")[Quantum Depletion and Momentum Distribution \
in the Dilute Hard-Sphere Bose Gas]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Interactions move particles out of the condensate even in a Bose gas at zero temperature. For a dilute three-dimensional gas, Bogoliubov theory predicts both the number of these depleted particles and their distribution in momentum. Establishing these predictions for an exact ground state requires information at arbitrarily long wavelengths: their energy cost tends to zero as the volume grows. This paper determines the leading momentum distribution for hard spheres, with the ordinary thermodynamic limit taken before the dilute limit.

=== 1.1 The model and the result <the-model-and-the-result>

Fix $a > 0$ and write $Lambda_L = \( bb(R) \/ L bb(Z) \)^3$ for the flat torus of side $L > 2 a$, with torus distance $d_L$. The allowed configuration space is

$ Omega_(N \, L \, a) = { \( x_1 \, dots.h \, x_N \) in Lambda_L^N : d_L \( x_i \, x_j \) > a upright(" for ") i < j } . $

The hard-sphere Hamiltonian $H_(N \, L \, a)^(upright("hc"))$ is the operator associated with the quadratic form

$ q \[ Psi \] = sum_(i = 1)^N integral_(Omega_(N \, L \, a)) \| nabla_i Psi \|^2 \, #h(2em) cal(D) \( q \) = H_0^1 \( Omega_(N \, L \, a) \) ∩ L_(upright("sym"))^2 \( Omega_(N \, L \, a) \) . $

Here $H_0^1$ is the $H^1$ closure of smooth functions compactly supported in the allowed configuration set; the ambient torus is already periodic. We use units $ℏ^2 \/ \( 2 m \) = 1$. The parameter $a$ is both the exclusion distance between centers and the scattering length: the exterior zero-energy scattering solution is $1 - a \/ \| x \|$. The form domain is nontrivial along every sequence with $N \/ L^3 arrow.r rho < 1 \/ \( 8 a^3 \)$ and $N \, L arrow.r oo$: a cubic grid of spacing at least $2 a$ eventually provides $N$ sites, and small neighborhoods of these sites give an allowed open configuration set. Zero extension and compactness on the full torus then give compact resolvent.

Let $P_(N \, L \, a)$ be the projection onto the lowest bosonic eigenspace, and let $cal(G)_(N \, L \, a)$ consist of the positive trace-one operators $Gamma$ satisfying $Gamma = P_(N \, L \, a) Gamma P_(N \, L \, a)$. After extension by zero to the full periodic configuration space, put

$ gamma_Gamma^(\( 1 \)) = N "Tr"_(2 \, dots.h \, N) Gamma \, #h(2em) u_(k \, L) \( x \) = L^(- 3 \/ 2) e^(i k dot.op x) quad \( k in \( 2 pi \/ L \) bb(Z)^3 \) \, $

and define

$ n_(Gamma \, L) \( k \) = chevron.l u_(k \, L) \, gamma_Gamma^(\( 1 \)) u_(k \, L) chevron.r \, #h(2em) B_(N \, L \, a) \( Gamma \) = frac(chevron.l u_(0 \, L) \, gamma_Gamma^(\( 1 \)) u_(0 \, L) chevron.r, N) . $

Thus $B_(N \, L \, a)$ is the occupation fraction of the specified constant orbital, and $1 - B_(N \, L \, a)$ is its depletion. The total occupation is $sum_k n_(Gamma \, L) \( k \) = N$. For $t in bb(R)^3 \\ { 0 }$, set

#[#set math.equation(numbering: n => "(1.1)")
 $ g \( t \) = frac(\| t \|^2 + 1, 2 sqrt(\| t \|^4 + 2 \| t \|^2)) - 1 / 2 \, #h(2em) nu_(upright("Bog")) \( upright(d) t \) = frac(\( 8 pi \)^(3 \/ 2), \( 2 pi \)^3) g \( t \) thin upright(d) t . $ <intro:profile>]

This is a finite positive measure: $g \( t \) = O \( \| t \|^(- 1) \)$ near zero and $g \( t \) = O \( \| t \|^(- 4) \)$ at infinity. Its total mass is $8 \/ \( 3 sqrt(pi) \)$.

#thm([Theorem 1.1.])[
  #emph[For every $a > 0$, every bounded continuous real function $f$ on $bb(R)^3$, and every $epsilon > 0$, there is $rho_0 \( a \, f \, epsilon \) > 0$ with the following property. Fix $0 < rho < rho_0$ and put $eta = rho a^3$. For every sequence $N_j \, L_j arrow.r oo$ with $N_j \/ L_j^3 arrow.r rho$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ limsup_(j arrow.r oo) med sup_(Gamma in cal(G)_(N_j \, L_j \, a)) lr(|frac(1, N_j sqrt(eta)) sum_(k in \( 2 pi \/ L_j \) bb(Z)^3\
k eq.not 0) f #h(-0.16667em) (k / sqrt(8 pi rho a)) n_(Gamma \, L_j) \( k \) - integral_(bb(R)^3) f thin upright(d) nu_(upright("Bog"))|) lt.eq epsilon . $ <intro:main-limit>]

]
] <thm:main>

The density is fixed throughout each thermodynamic limit. In particular, the theorem controls every thermodynamic accumulation value of the occupation, without requiring a unique occupation limit at fixed positive $eta$. Its uniformity includes all normalized, possibly complex ground vectors and the normalized projection onto the entire ground eigenspace.

#thm([Corollary 1.2.])[
  #emph[In the same iterated limit, uniformly over all ground states, 
$ 1 - B_(N \, L \, a) \( Gamma \) = frac(8, 3 sqrt(pi)) sqrt(rho a^3) + o \( sqrt(rho a^3) \) . $

]
] <cor:depletion>

This follows by taking $f = 1$. The theorem also determines how the depleted particles are distributed on the momentum scale $sqrt(8 pi rho a)$, without assuming translation invariance of an individual ground state.

=== 1.2 Historical context and the sources of the method <historical-context-and-the-sources-of-the-method>

Bogoliubov’s description of a weakly interacting Bose gas replaces its low-energy excitations by quasiparticles obtained from a linear canonical transformation [7]. The quasiparticle vacuum already has particles in nonzero momentum modes. Lee, Huang, and Yang developed the hard-sphere pseudopotential calculation far enough to determine both the second term of the energy and the leading depletion [19]. Thus the predicted momentum profile and the coefficient $8 \/ \( 3 sqrt(pi) \)$ describe the many-body state, as well as the fluctuations responsible for the energy correction. The distinction matters mathematically: matching the energy does not by itself control the occupation of modes whose energy tends to zero with the inverse size of the system.

The rigorous energy theory began with Dyson’s bounds for hard spheres [11]; Lieb and Yngvason later obtained the matching leading lower bound [23]. At the Lee–Huang–Yang order, Yau and Yin proved the upper bound for smooth repulsive short-range potentials [26]. Basti, Cenatiempo, and Schlein subsequently gave a proof for nonnegative radial compactly supported $L^3$ potentials with an improved error [4]. Fournais and Solovej established the lower bound, first for integrable interactions and then for a class including hard cores [14,15]. For hard spheres, Basti, Cenatiempo, Giuliani, Olgiati, Pasqualetti, and Schlein bounded the correction by a constant times the Lee–Huang–Yang scale [3]; Basti, Brooks, Cenatiempo, Olgiati, and Schlein obtained the sharp coefficient [1]. Their subsequent work extends this upper-bound method to measurable even nonnegative compactly supported potentials, including hard cores [2]. The hard-sphere upper bound supplies the energy comparison used here.

Rigorous information about the state has developed in several different scaling limits. Lieb and Seiringer proved complete condensation for trapped gases in the Gross–Pitaevskii limit, allowing hard cores; their result includes trace-norm convergence of the normalized one-particle density matrix and the corresponding leading momentum-density limit [20]. For a periodic unit box with scattering length of order $N^(- 1)$, Boccato, Brennecke, Cenatiempo, and Schlein determined the next-order depletion for nonnegative radial compactly supported $L^3 \( bb(R)^3 \)$ potentials [6] Equation (1.14) and Appendix A. The associated discrete momentum occupations are expressed as a trace-norm expansion of the one-particle density matrix by Brennecke, Lee, and Nam, who also establish its positive-temperature analogue [8] Equations (6)–(8) and Theorem 1.1. The second-order density-matrix expansion resolves the individual discrete occupations as well as their sum. Its relation between volume and scattering length differs from the thermodynamic limit at fixed density considered here.

Condensation on boxes growing with the dilute parameter was proved by Fournais [12], and the propagation of such estimates to larger scales has been developed further by Junge [18]. These results keep the box size tied to the dilution. In the ordinary thermodynamic limit, the one-particle gap vanishes at each fixed positive density, so an additional estimate is needed for variation across the whole torus. A different comparison is provided by the “simple equation” approximation to the Bose gas: Carlen, Jauslin, and Lieb derived its leading depletion coefficient [9] Theorem 1.6, and Jauslin derived its Bogoliubov momentum profile on the inverse healing-length scale [17] Theorem 3. Those are results for an approximate correlation equation. The present occupation measures are those of the exact many-body hard-sphere ground states, and their convergence is weak convergence of finite measures on the rescaled momentum space.

Our local energy analysis builds on the lower-bound methods of Fournais and Solovej [14,15] and the Neumann-box localization of Haberberger, Hainzl, Nam, Seiringer, and Triay [16]. Fournais, Junge, Girardot, Morin, Olivieri, and Triay combined these approaches in their treatment of strong interactions at low temperature [13]. We use intermediate operator estimates from that work, retaining a positive term that measures Bogoliubov excitations, before taking an observable expectation. This is a use of their operator analysis beyond its scalar free-energy conclusion. The excitation-number localization is related to the large-matrix localization of Lieb and Solovej [22] Appendix A, and the coherent-state treatment of the condensate mode uses the $c$-number substitution of Lieb, Seiringer, and Yngvason [21].

The long-distance comparison uses a stationary ground-state path representation, a form of Doob’s $h$-transform [10]. The spatial count estimates and exact conditional killed-Brownian-path laws used here are supplied by the companion paper [24]. The companion establishes a positive constant-orbital occupation uniformly over the hard-sphere ground space. Here the comparison of particle-deletion measures must be accurate below the depletion scale. Its additional quantitative ingredients are a local fourth-moment comparison and a distant second-moment comparison. These compare the deletion measures obtained by averaging the deleted position over different cells.

The route construction adapts the unpredictable-path method of Benjamini, Pemantle, and Peres, who constructed paths in three dimensions with exponential intersection tails [5]. Our comparison also requires encounters to become rare after the segments near the common endpoint are removed, and it must accommodate finite defective regions. Detours use Kesten’s exterior-boundary connectivity theorem in the formulation of Timár [25] Theorem 4. These geometric inputs are combined with two-copy likelihood estimates that retain the exact conditional normalization; the intersection theorem alone does not give the deletion-measure comparison.

=== 1.3 From local excitations to the momentum profile <from-local-excitations-to-the-momentum-profile>

The proof separates excitations inside moderately large boxes from variation between those boxes. For a partition into cubes of side $ell$, let $P_ell$ be the one-particle orthogonal projection onto functions constant on each cube, and let $P_0$ be projection onto the single global constant. Since $P_0 lt.eq P_ell$, every normalized ground vector satisfies the exact identity

#[#set math.equation(numbering: n => "(1.3)")
 $ 1 - B_(N \, L \, a) \( \| Psi chevron.r chevron.l Psi \| \) = chevron.l Psi \, \( 1 - P_ell \)_1 Psi chevron.r + parallel \( P_ell - P_0 \)_1 Psi parallel^2 . $ <intro:split>]

The subscript $1$ means that the projection acts on the first particle. Bosonic symmetry gives the same identity with the average over all particles.

The first term can be analyzed through the energy, provided the lower bound retains a positive operator measuring Bogoliubov excitations. The energy boxes contain several of the projection cells of side $ell$; those cells will in turn be subdivided into small cells for the spatial comparison. An energy expansion alone does not identify this observable. We use the hard-sphere upper bound of Basti, Brooks, Cenatiempo, Olgiati, and Schlein [1], together with intermediate operator estimates of Fournais, Junge, Girardot, Morin, Olivieri, and Triay [13]. Their positive excitation terms give quantitative closeness to the local quadratic vacuum. We extract from them a uniform estimate for one-body operators supported on the local excitations, including operators whose matrices are complex and not diagonal in momentum. This stronger observable estimate will allow us to test translations after the long-wavelength contribution has been controlled.

The second term concerns wavelengths larger than $ell$. To control it, we first take a normalized nonnegative ground vector $Phi$. For a cube $v$ in a torus of volume $V$, define a measure on the remaining $N - 1$ coordinates $Y'$ by the density

#[#set math.equation(numbering: n => "(1.4)")
 $ s_v \( Y' \)^2 = frac(V, \| v \|) integral_v Phi \( y \, Y' \)^2 thin upright(d) y . $ <intro:palm>]

This is a finite smoothed particle-deletion measure: the deleted particle is selected with weight proportional to its presence in $v$, and its position is integrated out. Its mass is the expected particle count in $v$ divided by $\( N \/ V \) \| v \|$; this mass averages to one over equal-volume cells. Comparing the square roots $s_v$ for distant cubes gives control of spatial variation that the energy cannot supply.

The comparison transports the deletion along a chain of particles. Two copies of the configuration are coupled so that deleting the first particle in one copy and the last in the other leaves identical remaining configurations. Short Brownian bridges implement the rearrangement while preserving the exact hard-sphere constraints. The normalization of the conditional bridge law cancels in the likelihood ratio. Near either end of a long chain, the paths in one copy are kept unchanged. These unchanged segments remove endpoint interactions from the errors measured by a second moment. Random routes with sparse intersections then make that error smaller than the depletion scale.

Three estimates connect these deletion measures to the projection. A fourth-moment comparison between neighboring small-cell root mean squares shows that their arithmetic mean is close to their root mean square over a cell of side $ell$. The occupation estimate on those same small cells compares their root mean squares with arithmetic averages of $Phi$. A second-moment comparison between distant cells of side $ell$ makes their root mean squares nearly constant. Together these estimates bound the last term of (1.3) by $o \( sqrt(rho a^3) \)$. A decomposition into real and imaginary positive parts extends that bound to every ground vector.

It remains to identify the momentum distribution of these local excitations. Translation by a vector $h$ multiplies a plane wave of momentum $k$ by $e^(i k dot.op h)$, so expectations of translations are Fourier transforms of the occupation measure. We restrict a translation to large boxes and average over shifts of the box partition. Only a small fraction of the shifted partitions separate a point from its translate. Sandwiching the translation between projections onto local excitations makes this error proportional to the depleted occupation. The local one-body estimate then gives the Bogoliubov Fourier transform and convergence on compactly supported tests. Together with total depletion, this supplies tightness and convergence against every bounded continuous function. All estimates are uniform in pure ground vectors, and convexity gives the mixed-state assertion.

===== 1.3.1 Organization. <organization.>

Section 2 sets the scaling and states the probabilistic inputs. Section 3 retains the positive excitation operators in the local energy bound, and Section 4 extracts the count and one-body estimates. Sections 5 and Section 6 construct the short-path comparison and prove its fourth-moment bound. Sections 7 and Section 8 construct the long routes and compare distant deletion measures. Section 9 combines the estimates to control the long wavelengths. Section 10 uses averaged translations to prove Theorem 1.

== 2 Scaled variables and ground-state estimates <set:section>

We work in units in which the particle density is large and the product of density and scattering length stays in a fixed positive interval. The momentum scale in the theorem is then of order one. The proof must identify the distribution of excitations on that scale and control the particles at longer wavelengths. We introduce the spatial projections that separate these tasks, specify the order of limits, and state the ground-state estimates from [24] used in the spatial comparison.

=== 2.1 The form domain and the constant orbital <the-form-domain-and-the-constant-orbital>

For an integer $K gt.eq 100$, put $Lambda_K = \( bb(R) \/ K bb(Z) \)^3$ and $V = K^3$. The exclusion distance in these units is denoted by $r$. We use the allowed configuration set and Dirichlet form from the introduction, with $\( L \, a \)$ replaced by $\( K \, r \)$, and write $E_n$ for the lowest $n$-particle energy on this same torus with this same exclusion distance. Set $E_0 = 0$. When evaluating a nonsymmetric function, $q$ denotes the same Dirichlet form without the bosonic restriction. All functions are extended by zero to the full configuration torus. In particular, a normalized bosonic ground vector $Phi$ has $parallel Phi parallel_2 = 1$ on $Lambda_K^N$.

The scaled parameters are

#[#set math.equation(numbering: n => "(2.1)")
 $ D = N / V \, #h(2em) alpha = D r \, #h(2em) alpha in I_alpha := \[ alpha_0 \/ 2 \, 2 alpha_0 \] \, #h(2em) D r^3 = alpha^3 / D^2 . $ <set:scales>]

Here $alpha_0$ is a sufficiently large absolute constant, fixed as in the spatial estimates of [24]. We subsequently increase the lower threshold on $D$ as needed. Constants may depend on the fixed interval $I_alpha$ and on auxiliary parameters already chosen; they are independent of $K \, N$ and the ground vector.

Write $Y = \( x_2 \, dots.h \, x_N \)$, let $u_0 = V^(- 1 \/ 2)$ on $Lambda_K$, and let $P_0 = \| u_0 chevron.r chevron.l u_0 \|$. For a pure state we abbreviate the occupation as

#[#set math.equation(numbering: n => "(2.2)")
 $ B \( Phi \) = parallel \( P_0 \)_1 Phi parallel_2^2 = 1 / V integral_(Lambda_K^(N - 1)) lr(|integral_(Lambda_K) Phi \( y \, Y \) thin upright(d) y|)^2 upright(d) Y . $ <set:occupation>]

The subscript denotes the coordinate on which a one-particle operator acts. When $Phi$ is nonnegative, we also use its configuration law

#[#set math.equation(numbering: n => "(2.3)")
 $ mu \( upright(d) X \) = Phi \( X \)^2 thin upright(d) X . $ <set:mu>]

For general complex vectors, configuration expectations use $\| Phi \|^2 thin upright(d) X$; any restriction to nonnegative vectors will be stated.

#thm([Lemma 2.1.])[
  (Ground spaces and allowed slices).  #emph[For every nonempty allowed configuration set with nontrivial form domain, the full labelled and bosonic Dirichlet operators have compact resolvent and the same lowest energy. A bosonic ground vector is therefore also a ground vector of the full labelled operator. Its modulus is a nonnegative bosonic ground vector. A form-domain function restricts, for almost every choice of some fixed coordinates, to the Dirichlet form domain of the open allowed set in the remaining coordinates. Zero extension of such a slice remains admissible if obstacles contributed by the fixed coordinates are removed.]
] <set:ground-space>

#proof[
  Zero extension sends $H_0^1$ of the allowed set into $H^1$ of the compact configuration torus. The compact Sobolev embedding proves compactness of the form embedding, and hence compact resolvent. For a labelled form-domain function $f$, its root-mean-square symmetrization
  $ F \( X \) = (frac(1, n !) sum_(pi in S_n) \| f \( pi X \) \|^2)^(1 \/ 2) $
  has the same norm and no larger Dirichlet energy, by the gradient inequality for a vector norm. To justify the Dirichlet condition, first apply this construction to smooth compactly supported approximants. Their symmetrizations have compact support in the allowed set, admit interior smooth approximation, and are bounded in $H^1$. Weak closedness of $H_0^1$ gives the assertion for $f$. The full and bosonic variational infima consequently agree. The modulus contraction gives the statement about $\| Phi \|$ by the same variational principle.
  For slicing, take smooth compactly supported approximants converging in the form norm. Fubini’s theorem gives a subsequence converging in the Sobolev norm of the unfixed variables for almost every fixed tuple. Each approximant has compact support in its open allowed slice, proving the stated Dirichlet membership. Removing fixed obstacles enlarges that open set, so zero extension preserves membership. This argument does not require regularity or connectedness of its boundary. These are the ground-space and slicing arguments of [24] Lemmas 2.1 and 2.2. ◻
]

For later use, a real bounded Lipschitz multiplier $u$ satisfies

#[#set math.equation(numbering: n => "(2.4)")
 $ q \[ u Phi \] - E_N parallel u Phi parallel_2^2 = integral \| Phi \|^2 \| nabla u \|^2 $ <set:multiplier>]

for every ground vector $Phi$. Indeed test its full weak eigenfunction equation with $u^2 Phi$, take real parts, and expand the two gradients. Multiplication by $u$ preserves the form domain.

=== 2.2 Partitions and the two limiting operations <partitions-and-the-two-limiting-operations>

Choose small positive exponents $u \, w$ with

#[#set math.equation(numbering: n => "(2.5)")
 $ 0 < w < u \/ 10000 . $ <set:exponents>]

The energy estimates will impose a further absolute upper bound on $u$. We use integers $R \, B$ such that $B$ is a multiple of $R$ and

#[#set math.equation(numbering: n => "(2.6)")
 $ R asymp D^w \, #h(2em) B asymp D^u \, #h(2em) d = 1 \/ j quad \( j in bb(N) \) . $ <set:lengths>]

The fixed factors in these lengths will be specified below to match the length convention in the local energy estimates. We take $K$ to be a multiple of $B$. This entails no restriction on the physical thermodynamic sequences, as the final change of units will show. The partitions into $B$-cells, $R$-cells, unit cells, and $d$-cells are nested. Denote the partition into cells of side $l$ by $cal(C)_l$. One choice is to place all grid faces at $- 1 \/ 2 + l bb(Z)$ in each coordinate. Unit cells are then $B_v = v + \[ - 1 \/ 2 \, 1 \/ 2 \)^3$, indexed by $cal(L) = \( bb(Z) \/ K bb(Z) \)^3$.

For $l in { B \, R \, 1 \, d }$ define the orthogonal projection

#[#set math.equation(numbering: n => "(2.7)")
 $ \( P_l f \) \( y \) = sum_(A in cal(C)_l) upright(bold(1))_A \( y \) frac(1, \| A \|) integral_A f \( z \) thin upright(d) z \, #h(2em) W_l = 1 - P_l . $ <set:cell-projection>]

Thus $sum_i \( W_l \)_i$ counts particles outside the space of functions constant on each $l$-cell. The notation $upright(d) Gamma \( A \) = sum_i A_i$ will also be used for a one-particle operator $A$. For a cell $A$ write $n_A \( X \) = sum_i upright(bold(1))_A \( x_i \)$. An average over cells always means the uniform average $\| cal(C)_l \|^(- 1) sum_(A in cal(C)_l)$.

We use the following convention for all asymptotic estimates. In the inner, thermodynamic limit, $K arrow.r oo$ and the actual scaled parameters converge to fixed values $D_(*) gt.eq D_0$ and $alpha_(*) in I_alpha$. The integers $B \, R \, j$ are fixed during this limit. For $theta in { u \, w }$ define the fixed factor

#[#set math.equation(numbering: n => "(2.8)")
 $ b_theta = alpha_0^(- \( 1 + 3 theta \) \/ 2) \, $ <set:scale-factors>]

and choose

#[#set math.equation(numbering: n => "(2.9)")
 $ R = ceil.l b_w D_(*)^w ceil.r \, #h(2em) B = R ⌈frac(b_u D_(*)^u, R)⌉ . $ <set:nested-lengths>]

As $D_(*) arrow.r oo$, these choices satisfy $R \/ \( b_w D_(*)^w \) arrow.r 1$ and $B \/ \( b_u D_(*)^u \) arrow.r 1$; the latter uses $w < u$. Their comparability with the powers of the actual $D$ holds eventually along each inner sequence. The factors in (2.8) ensure that the auxiliary density of the local energy theorem stays within a fixed factor of $D$, uniformly in $alpha in I_alpha$. The exact calculation is given in Section 3.

A displayed dilute error $o \( 1 \)$ denotes a bound whose thermodynamic limsup tends to zero as $D_(*) arrow.r oo$, uniformly in the ground vector and in $alpha_(*) in I_alpha$. If auxiliary parameters such as $j$ are fixed, the error may depend on them. We write $o \( D^(- 1) \)$ for $D^(- 1) o \( 1 \)$ in this convention. An explicitly written $o_K \( 1 \)$ vanishes along the inner limit, uniformly in the ground vector; its volume threshold may depend on $D_(*) \, alpha_(*)$ and the fixed auxiliary parameters. Estimates with powers of $D$ have this convention whenever they use a thermodynamic energy upper bound. At fixed $D_(*)$, any $o_K \( 1 \)$ can be made smaller than a prescribed positive multiple of $D_(*)^(- beta)$ by increasing the volume threshold. After enlarging the constant, a bound $C D^(- beta)$ can therefore be written without an additional volume remainder when it is understood to hold beyond that threshold. Estimates stated for every large finite volume do not need this convention. In particular,

#[#set math.equation(numbering: n => "(2.10)")
 $ o \( D^(- 1) \) + o_K \( 1 \) quad upright("implies") quad lim_(D_(*) arrow.r oo) D_(*) limsup_(K arrow.r oo) #scale(x: 120%, y: 120%)[\(] o \( D^(- 1) \) + o_K \( 1 \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <set:limit-order>]

No bound on the speed of the inner convergence is required. The microcell parameter $j$ will ultimately be chosen to make an error $epsilon.alt_j$ small. It is chosen before the dilute threshold and the volume threshold; the exponents $u \, w$ and the length $R$ need not change when $j$ is increased.

=== 2.3 Spatial inputs from the condensation theorem <spatial-inputs-from-the-condensation-theorem>

The companion condensation theorem [24] supplies the removal-energy and spatial-count estimates below. They provide particles with which to construct the path comparisons and bound the cost of discarding crowded or poorly populated regions. The count estimates concern the law of a nonnegative ground function; the energy argument and the final momentum statement also apply to complex ground vectors.

#thm([Proposition 2.2.])[
  (Removal energies).  #emph[For all sufficiently large $D$, uniformly in (2.1), 
#[#set math.equation(numbering: n => "(2.11)")
 $ E_N - E_(N - m) lt.eq C alpha m #h(2em) \( 0 lt.eq m lt.eq N \) . $ <set:removal-bound>]

 At fixed $K \, r$, the ratio $E_n \/ n$ is nondecreasing among positive particle numbers having nonempty form domain.]
] <set:removal>

This is [24] Corollary 3.4 and Equation (3.9). Its insertion argument normalizes the new orbital separately for each old configuration; the old kinetic energy therefore incurs no multiplicative loss. Together with the full ground equation, this estimate is the input to deletion of selected path interactions.

#thm([Proposition 2.3.])[
  (Joint low-count bound).  #emph[One can fix $alpha_0$ sufficiently large and then $ell_(*) > 0$ sufficiently small so that every normalized nonnegative bosonic ground function satisfies, for every $A subset cal(L)$, 
#[#set math.equation(numbering: n => "(2.12)")
 $ mu { n_(B_v) < ell_(*) D upright(" for every ") v in A } lt.eq \( C \/ D^2 \)^(\| A \|) . $ <set:low-count-bound>]

 The estimate holds for all sufficiently large $D$, uniformly in $K$ and the ground function.]
] <set:low-counts>

This is [24] Proposition 3.5 and Equation (3.10). The constants in this proposition are fixed before the subsequent path cutoffs are chosen.

#thm([Proposition 2.4.])[
  (Count exponential moments).  #emph[For $A subset cal(L)$ set 
$ f_A \( X \) = sum_(i = 1)^N e^(- d_K \( x_i \, A \)) \, #h(2em) f_diameter = 0 \, $

 where the distance is to the set of site centers. Every normalized nonnegative bosonic ground function obeys 
#[#set math.equation(numbering: n => "(2.13)")
 $ log integral e^(z f_A) thin upright(d) mu lt.eq C z D \| A \| #h(2em) \( 0 lt.eq z lt.eq 1 \) . $ <set:count-mgf-bound>]

 The constants are uniform for $K gt.eq 100$, $D$ sufficiently large, and $alpha in I_alpha$.]
] <set:count-mgf>

This is [24] Proposition 3.7 and Equation (3.18). For example, since $n_(B_v) lt.eq e^(sqrt(3) \/ 2) f_({ v })$, it gives

#[#set math.equation(numbering: n => "(2.14)")
 $ mu { n_(B_v) > C_1 D } lt.eq e^(- c D) $ <set:count-tail>]

once $C_1$ is a sufficiently large constant. It also bounds every fixed moment of a count in a bounded region by $C_k D^k$. Hard packing gives $n_(B_v) lt.eq C r^(- 3) lt.eq C D^3$. Consequently polynomial factors in local counts do not affect the negligibility of (2.14). For an $R$-cell, a union bound involves only $O \( R^3 \)$ unit cells. These observations justify removing bounded-count truncations in the moment estimates proved in Section 4.

#thm([Proposition 2.5.])[
  (Joint close-neighbor tail).  #emph[For each particle label $i$ let $d_i \( X \) = min_(k eq.not i) d_K \( x_i \, x_k \)$, with the value $+ oo$ if $N = 1$. Given $theta > 0$, one can choose $b_(*) > 0$ sufficiently small, and then $D$ sufficiently large, so that the set 
$ cal(Q) \( X \) = {v in cal(L) : \# { i : d_K \( x_i \, v \) lt.eq 5 \, med d_i \( X \) lt.eq b_(*) D^(- 1 \/ 3) } gt.eq theta D} $

 satisfies, for every $A subset cal(L)$, 
#[#set math.equation(numbering: n => "(2.15)")
 $ mu { A subset cal(Q) } lt.eq p_D^(\| A \|) \, #h(2em) p_D = #scale(x: 120%, y: 120%)[\(] C_theta b_(*)^(- 2) D^(- 4 \/ 3) #scale(x: 120%, y: 120%)[\)]^(1 \/ q_(*)) arrow.r 0 \, $ <set:close-tail-bound>]

 where $q_(*)$ is an absolute positive integer. The uniformity is the same as in Proposition 6.]
] <set:close-tail>

This is [24] Proposition 3.7 and Equation (3.20). It remains true if the distance cutoff is decreased. Neighborhoods of any other fixed radius can be covered by finitely many radius-$5$ neighborhoods; reducing $theta$ and taking a bounded coloring gives the corresponding joint bound. The constants may then depend on that fixed radius. All these estimates are under the original ground-state law. They are not assertions about a law conditioned on later path certificates.

== 3 Local energy bounds with retained excitations <en:section>

A scalar energy asymptotic does not by itself determine the one-body momentum distribution. We need a lower bound that retains the positive quadratic excitation operator as well as the leading energy. This section proves that bound on boxes of side $E$, with $E = B$ or $R$; Lemma 10 is the precise low-excitation statement. Section 4 will compare the summed lower bound with the ground-state energy upper bound and extract count fluctuations and local one-body covariances. The remaining occupation of wavelengths comparable with the whole torus requires the spatial argument later in the paper.

Throughout this section, global expectations are in a normalized bosonic ground vector, with no sign or reality restriction. Local inequalities also apply to unnormalized box restrictions with spectator variables. For a cell $A$, write $n_A = sum_(i = 1)^N upright(bold(1))_A \( x_i \)$ and $q_A = n_A \/ \( D \| A \| \)$. Constants are uniform for $alpha$ in the fixed compact window of Section 2; they may depend on the fixed exponents and, when indicated, on $j$.

=== 3.1 The local energy and the relevant scales <the-local-energy-and-the-relevant-scales>

Put $c_(upright(L)) = 128 \/ \( 15 sqrt(pi) \)$ and, with $r$ held fixed, define

#[#set math.equation(numbering: n => "(3.1)")
 $ e_r \( x \) = 4 pi r x^2 + 4 pi c_(upright(L)) r^(5 \/ 2) x^(5 \/ 2) . $ <en:energy-density>]

The hard-sphere upper bound of [1] Theorem 1.1, after rescaling, gives

#[#set math.equation(numbering: n => "(3.2)")
 $ E_(N \, K \, r) lt.eq V { e_r \( D \) + O \( D^(- c_(*)) \) } $ <en:upper>]

for an absolute $c_(*) > 0$, in the order of limits just specified. That theorem uses periodic boxes and a fixed hard-core scattering length. To obtain this upper bound along a density-convergent sequence, one may fix a slightly higher physical density $rho' > rho$ and choose, in the same physical box, an integer $M gt.eq N$ with $M \/ L^3 arrow.r rho'$. Slicing an $M$-particle trial state and then averaging over its omitted coordinates gives $E_(N \, L \, a) lt.eq E_(M \, L \, a)$. The thermodynamic upper bound at $rho'$ therefore bounds the limsup at $rho$. Its explicit right side is continuous in $rho'$, so one may let $rho' arrow.b rho$. Equivalently, one may use the sequence-independent thermodynamic energy limit. No uniform finite-volume rate is used here.

We use a generic box side $E asymp Q = D^theta$, where $theta = u$ or $w$, and write $v_b = E^3$. Neumann restriction to the boxes lowers the energy. More explicitly, decompose configuration space into the sectors assigning each label to a box, restrict each coordinate integral to its assigned box, and discard exclusions between different boxes. This operation takes no derivative of a sector indicator. Variables assigned elsewhere remain spectators, so every local form inequality below may be integrated in those variables. The affine comparison energy for a box containing $n$ particles is

#[#set math.equation(numbering: n => "(3.3)")
 $ t_b \( n \) = v_b e_r \( D \) + e'_r \( D \) \( n - D v_b \) . $ <en:tangent>]

Its sum over all boxes is $V e_r \( D \)$ in every assignment sector.

Use [13] Proposition 2.1 to choose a nonnegative radial bounded potential $v$ supported in the hard core. Its scattering length $a'$ and its scattering functions $phi$, $omega = 1 - phi$, $g = v phi$ satisfy

#[#set math.equation(numbering: n => "(3.4)")
 $ 0 lt.eq r - a' lt.eq C r D^(- 1) Q^(- 1) \, quad parallel v parallel_1 lt.eq C Q \, quad parallel v parallel_oo lt.eq D^C \, quad hat(g) \( 0 \) = 8 pi a' \, quad parallel g parallel_1 + parallel g omega parallel_1 lt.eq C \/ D . $ <en:replacement>]

The replacement also satisfies the radial comparison condition (2.6) in that proposition. The Neumann operator with this potential is denoted by $H_b$. Its expectation on the original hard-core restriction equals the restricted kinetic energy, since $v$ vanishes outside the excluded region. It can subsequently be applied to excitation-localized vectors, which need not satisfy the hard-core condition.

The fixed factors in the box lengths matter for the particle-number hypothesis of [13]. Use the choices (2.8)–(2.9), so that $E = b_theta D^theta \( 1 + o \( 1 \) \)$ with $b_theta = alpha_0^(- \( 1 + 3 theta \) \/ 2)$, in the specified order of limits. Define

$ rho_(upright("aux")) = E^(- 2 \/ \( 1 + theta \)) \( a' \)^(- \( 1 + 3 theta \) \/ \( 1 + theta \)) \, #h(2em) K_ell = \( rho_(upright("aux")) \( a' \)^3 \)^(- theta \/ 2) . $

Then the source length relation $E = K_ell \/ \( rho_(upright("aux")) a' \)^(1 \/ 2)$ holds exactly. Moreover,

$ rho_(upright("aux")) / D = (alpha_0 / alpha)^(\( 1 + 3 theta \) \/ \( 1 + theta \)) \( 1 + o \( 1 \) \) in \[ 1 \/ 3 \, 3 \] $

for sufficiently small $theta$ and sufficiently large $D$, uniformly in the fixed $alpha$ window. The change from $r$ to $a'$ only affects the $o \( 1 \)$ factor; the replacement bounds are chosen with fixed slack. Consequently every

#[#set math.equation(numbering: n => "(3.5)")
 $ D v_b \/ 2 lt.eq n lt.eq 6 D v_b $ <en:middle-sector>]

lies in the particle-number range $n lt.eq 20 rho_(upright("aux")) v_b$ of that paper. Set

#[#set math.equation(numbering: n => "(3.6)")
 $ K_H = K_ell^100 \, #h(2em) M asymp D v_b Q^(- 400) . $ <en:parameters>]

Rounding $M$ to an integer changes no estimate. For sufficiently small $theta$, the required inequalities are

#[#set math.equation(numbering: n => "(3.7)")
 $ K_H gt.double K_ell^4 \, #h(2em) K_ell K_H^3 lt.double \( rho_(upright("aux")) \( a' \)^3 \)^(- 1 \/ 2) \, #h(2em) K_ell^(5 \/ 4) K_H^2 lt.double \( rho_(upright("aux")) \( a' \)^3 \)^(- 1 \/ 2) \,\
1 lt.double M lt.double E \/ a' \, #h(2em) M lt.double rho_(upright("aux")) v_b K_H^(- 3) K_ell^(- 17 \/ 4) \, #h(2em) K_H lt.double sqrt(E \/ a') . $ <en:parameter-conditions>]

For example, the ratio in the second upper bound for $M$ is $O \( Q^(- 95.75) \)$. All powers containing $D$ rather than $Q$ can be made favorable by decreasing $theta$. We shall also require $u lt.double c_(*)$ and several inequalities of this form below; they form a finite list.

Let $u_p$ be the normalized cosine basis of the Neumann cube, indexed by $p in \( pi \/ E \) bb(N)_0^3$. Thus

$ u_p \( x \) = v_b^(- 1 \/ 2) product_(i = 1)^3 c_(p_i) cos \( p_i x_i \) \, #h(2em) c_0 = 1 \, quad c_s = sqrt(2) med \( s eq.not 0 \) . $

Write $a_p \, a_p^(*)$ for the associated annihilation and creation operators, $n_(+) = sum_(p eq.not 0) a_p^(*) a_p$, and

#[#set math.equation(numbering: n => "(3.8)")
 $ cal(P)_L = { p : 0 < \| p \| lt.eq K_H \/ E } \, quad n_L = sum_(p in cal(P)_L) a_p^(*) a_p \, quad n_H = n_(+) - n_L . $ <en:bands>]

All estimates on unnormalized vectors include their squared norm in every scalar error.

=== 3.2 A rough bound retaining kinetic energy and count fluctuations <en:rough-section>

The sharp box estimate will be used only after restricting the number of low-frequency excitations. We first establish a less accurate bound that pays for this restriction and controls its complementary part. The point of the construction is to use most of the kinetic energy only near another particle, leaving enough energy to control the low Neumann modes. We use Dyson’s radial replacement and the small-box energy method of Lieb and Yngvason [11,23], keeping track of the unused kinetic energy explicitly.

Throughout this subsection let $cal(C) = \[ 0 \, E \]^3$, $v_b = E^3$, and $E asymp Q = D^theta$. The exponent $theta > 0$ will be either of the two box exponents. We assume that it is sufficiently small, with bounds specified below. Let $r = alpha \/ D$, where $alpha$ ranges over the fixed compact window of positive values. The nonnegative radial replacement potential, denoted here by $v$, is supported in the ball of radius $r$. Its scattering length $a'$ obeys

$ 0 lt.eq r - a' lt.eq C r D^(- 1) Q^(- 1) \, #h(2em) parallel v parallel_1 lt.eq C Q . $

Write

$ H_n = sum_(i = 1)^n \( - Delta_(cal(C) \, i)^(upright(N)) \) + sum_(1 lt.eq i < j lt.eq n) v \( x_i - x_j \) . $

All inequalities below are quadratic-form inequalities. They hold with additional Hilbert-space-valued spectator variables. Let $A$ run over the cubes of side $d$ in a fixed subdivision of $cal(C)$, and put $n_A = sum_i upright(bold(1))_A \( x_i \)$. The side $d$ is fixed while $D arrow.r oo$.

#thm([Lemma 3.1.])[
  (Rough box bound).  #emph[ There are constants $c \, C > 0$ and an exponent $c_(upright(r)) > 0$, independent of the sufficiently small box exponent $theta$, such that, for $0 lt.eq n lt.eq 6 D v_b$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ H_n gt.eq  & frac(4 pi r n^2, v_b) - C v_b D^(1 - c_(upright(r))) + c thin upright(d) Gamma #scale(x: 120%, y: 120%)[\(] min { p^2 \, 1 } #scale(x: 120%, y: 120%)[\)]\
 & quad + c D sum_A \| A \| thin frak(h) (frac(n_A, D \| A \|) - frac(n, D v_b)) \, #h(2em) frak(h) \( t \) = frac(t^2, 1 + \| t \|) . $ <en:rough-ineq>]

 Here $p$ denotes the Neumann frequency and $upright(d) Gamma$ sums the indicated one-particle operator over all particles. One may take $c_(upright(r)) = 10^(- 3)$.]
] <en:rough-bound>

#proof[
  We give separately the short-distance energy estimate and the recovery of the kinetic term. Choose equal subdivisions of every $d$-cube with side $ell asymp D^(- 0.31)$, and set
  $ s asymp D^(- 0.36) \, #h(2em) epsilon_D = D^(- 0.002) . $
  Rounding the number of subdivisions changes only fixed constants. For large $D$, the support radius $r$ is smaller than $s \/ 2$. Restrict configuration space to sectors specifying which small cube contains each labeled particle. Restriction of an $H^1$ function to these sectors incurs no gradient cost; their faces carry Neumann form conditions. Discard interactions between different small cubes.
  #emph[The radial replacement.] Fix one particle coordinate and all the others in its small cube. Partition that cube into Voronoi regions of the other particles, clipping at the cube boundary. Each region is star-shaped about its center. On a ray from a center, the scattering variational principle gives, for $R gt.eq r$,
  #[#set math.equation(numbering: n => "(3.10)")
   $ integral_0^R (\( 1 - 2 epsilon_D \) \| f' \( t \) \|^2 + 1 / 2 v \( t \) \| f \( t \) \|^2) t^2 thin upright(d) t gt.eq \( 1 - 2 epsilon_D \) a' \| f \( R \) \|^2 . $ <en:radial-scattering>]
  For completeness, with kinetic coefficient one the minimizer at fixed endpoint is the regular scattering solution divided by its endpoint value. Its minimum is $a_v \( 1 - a_v \/ R \)^(- 1) \| f \( R \) \|^2$, where $a_v$ is the scattering length of the potential in the integrand. This follows by integrating the radial scattering equation against the minimizer; the boundary term is $R^2 overline(f \( R \)) f' \( R \)$. Completing the quadratic form around the minimizer proves the same lower bound for every ray function. Factoring out $1 - 2 epsilon_D$ replaces $v$ by $v \/ \( 1 - 2 epsilon_D \)$, whose scattering length is at least $a'$, by the variational definition and monotonicity. Dropping the factor $\( 1 - a_v \/ R \)^(- 1) gt.eq 1$ proves (3.10). This argument applies first to smooth functions and then by form approximation.
  Let $U$ be constant on $s \/ 2 lt.eq \| x \| lt.eq s$, zero elsewhere, and normalized by $integral_(bb(R)^3) U = 4 pi$; thus $integral_0^oo U \( t \) t^2 thin upright(d) t = 1$. On a ray ending at distance $T$, average (3.10) over radii $R lt.eq T$ with weight $U \( R \) R^2 thin upright(d) R$. The total weight is at most one, so only the energy at distances at most $s$ is used. Integrating the rays proves the lower bound $\( 1 - 2 epsilon_D \) a' U \( d_(upright("nn")) \)$, where $d_(upright("nn"))$ is the nearest-neighbor distance within the small cube. If there is no other particle this expression is zero. Half of every pair interaction is assigned to each endpoint, so summing over the coordinates uses no interaction twice.
  More explicitly, let $S_i$ be the set of positions of coordinate $x_i$ within distance $s$ of another particle in its small cube. The preceding argument leaves the form
  #[#set math.equation(numbering: n => "(3.11)")
   $ cal(T)_(upright("rem")) \[ psi \] = sum_i integral [epsilon_D + \( 1 - 2 epsilon_D \) upright(bold(1))_(S_i^c)] \| nabla_i psi \|^2 . $ <en:kinetic-reserve>]
  There is also a separate reserve $epsilon_D sum_i parallel nabla_i psi parallel^2$ available for the next step. Indeed, these two reserves and the coefficient $1 - 2 epsilon_D$ used inside $S_i$ sum to the original kinetic coefficient at every point.
  #emph[The energy in a small cube.] The cases $k = 0 \, 1$ have zero scalar lower bound and are immediate. For $k gt.eq 2$ particles in a cube of side $ell$, put
  $ W_k = \( 1 - 2 epsilon_D \) a' sum_(i = 1)^k U \( d_(upright("nn") \, i) \) . $
  The first nonzero eigenvalue of the reserved kinetic operator is $Delta_ell = epsilon_D pi^2 ell^(- 2)$. Its normalized constant vector will be denoted by $Omega_k$. For any fixed $C_0$, uniformly for $k lt.eq C_0 D ell^3$,
  #[#set math.equation(numbering: n => "(3.12)")
   $ chevron.l W_k chevron.r_(Omega_k) gt.eq frac(4 pi \( 1 - 2 epsilon_D \) a' k \( k - 1 \), ell^3) (1 - C s / ell - C frac(k s^3, ell^3)) . $ <en:smallcube-mean>]
  To see this, keep the first coordinate a distance at least $s$ from the cube boundary. For each possible nearest neighbor integrate that neighbor over the shell of radii $s \/ 2 \, s$. The other $k - 2$ points lie outside the corresponding ball with probability at least $1 - C k s^3 \/ ell^3$, by the union bound. These events for different nearest neighbors are disjoint up to null sets. The removed boundary layer occupies at most $C s \/ ell$ of the cube volume. Summing over the first coordinate proves (3.12).
  The multiplication operator satisfies
  $ 0 lt.eq W_k lt.eq C k a' s^(- 3) \, #h(2em) chevron.l W_k^2 chevron.r_(Omega_k) lt.eq C k a' s^(- 3) chevron.l W_k chevron.r_(Omega_k) . $
  The scalar mean in (3.12) is less than $Delta_ell \/ 2$ for large $D$. Temple’s inequality therefore gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ inf "spec" (epsilon_D sum_(i = 1)^k \( - Delta_i^(upright(N)) \) + W_k) gt.eq chevron.l W_k chevron.r_(Omega_k) - frac(chevron.l W_k^2 chevron.r_(Omega_k), Delta_ell - chevron.l W_k chevron.r_(Omega_k)) . $ <en:smallcube-temple>]
  This version of Temple’s bound follows by decomposing the constant trial vector into the ground eigenspace and its orthogonal complement; the latter spectrum is at least $Delta_ell$, by the min–max principle and $W_k gt.eq 0$, and the variance bounds its spectral weight. The powers used here are
  $ D ell^3 asymp D^0.07 \, quad s \/ ell asymp D^(- 0.05) \, quad D s^3 asymp D^(- 0.08) \, quad k a' s^(- 3) lt.eq C D^0.15 \, quad Delta_ell asymp D^0.618 . $
  Consequently there is $delta_D lt.eq C D^(- 0.002)$ such that the energy available in each small cube is bounded below by
  #[#set math.equation(numbering: n => "(3.14)")
   $ frac(4 pi r, ell^3) \( 1 - delta_D \) k \( k - 1 \) \, #h(2em) 0 lt.eq k lt.eq C_0 D ell^3 . $ <en:smallcube-quadratic>]
  The replacement of $a'$ by $r$ is included in $delta_D$.
  For larger $k$, divide its labels into groups of sizes between $m \/ 2$ and $m$, where $m = floor.l C_0 D ell^3 floor.r$. Such a partition exists for $k > m$, by taking $ceil.l k \/ m ceil.r$ groups of nearly equal sizes; decreasing the lower endpoint by one accommodates integer rounding. Drop interactions between groups before applying the radial argument. A position close to a member of its group is also close to a particle of the original cube, so the reserve (3.11) remains available. After reducing the harmless lower endpoint to $m \/ 3$, the group bound is at least
  $ frac(4 pi r, ell^3) \( 1 - delta_D \) \( m \/ 3 - 1 \) k . $
  Choose once and for all $b > 12$ and then $C_0 > 12 b$. Define the convex function on $\[ 0 \, oo \)$
  $ F_b \( y \) = cases(delim: "{", y^2 \, & 0 lt.eq y lt.eq b \,, 2 b y - b^2 \, & y > b .) $
  Both the small-$k$ estimate and the group estimate imply the common bound
  #[#set math.equation(numbering: n => "(3.15)")
   $ frac(4 pi r, ell^3) \( 1 - delta_D \) [\( D ell^3 \)^2 F_b (frac(k, D ell^3)) - k] . $ <en:smallcube-convex>]
  For $k lt.eq m$ this follows from $F_b \( y \) lt.eq y^2$. For $k > m$, use $F_b \( y \) lt.eq 2 b y$ and $m \/ 3 - 1 gt.eq 2 b D ell^3 - 1$ for sufficiently large $D$.
  #emph[From small-cube counts to the desired count penalty.] Set $theta.alt = n \/ \( D v_b \) in \[ 0 \, 6 \]$. For all $y gt.eq 0$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ F_b \( y \) gt.eq theta.alt^2 + 2 theta.alt \( y - theta.alt \) + c frak(h) \( y - theta.alt \) . $ <en:convex-remainder>]
  If $y lt.eq b$, the remainder after the tangent is $\( y - theta.alt \)^2$. If $y > b$, write $t = y - theta.alt$ and $a = b - theta.alt$; the remainder is $2 a t - a^2 gt.eq a t$, and $a gt.eq b - 6 > 0$. These two observations prove (3.16) with a uniform positive constant. Sum (3.15) over the small cubes. The linear tangent terms cancel because their counts sum to $n$. The subtracted self-count terms cost at most
  $ C r ell^(- 3) n lt.eq C v_b D^0.93 . $
  The factor $1 - delta_D$ changes the leading scalar by at most $C v_b D^(1 - 0.002)$. Since $frak(h)$ is convex, Jensen’s inequality within each $d$-cube gives
  $ sum_(upright("small cubes ") C subset A) \| C \| thin frak(h) (frac(n_C, D \| C \|) - theta.alt) gt.eq \| A \| thin frak(h) (frac(n_A, D \| A \|) - theta.alt) . $
  This proves the scalar and count terms in (3.9), while leaving (3.11) unused.
  #emph[Recovery of the one-particle kinetic term.] We now sum the sector restrictions back on the original $H^1$ form domain of the $E$-cube; the following estimates concern its global one-coordinate slices, not an arbitrary function in the larger direct sum of the cut Neumann form domains. Let $u_p$ be the normalized cosine basis of the Neumann cube, with $p in \( pi \/ E \) bb(Z)_(gt.eq 0)^3$. The vector fields $nabla u_p \/ \| p \|$, for $p eq.not 0$, are orthonormal. Let $cal(P)$ be their projection for $0 < \| p \| lt.eq D^0.003$. The explicit cosine formulas give
  #[#set math.equation(numbering: n => "(3.17)")
   $ parallel cal(P) parallel_(L^2 arrow.r L^oo)^2 lt.eq C / E^3 \# { p : 0 < \| p \| lt.eq D^0.003 } lt.eq C D^0.009 . $ <en:gradient-evaluation>]
  For a fixed slice in the other particle coordinates, enlarge $S_i$ to the union $S$ of the balls of radius $s$ about all the other particles. Its volume is at most $C n s^3$. The integral kernel bound in (3.17), or duality, implies
  $ parallel cal(P) upright(bold(1))_S F parallel_2^2 lt.eq C D^0.009 n s^3 parallel F parallel_2^2 lt.eq C D^(- 0.071 + 3 theta) parallel F parallel_2^2 . $
  Thus, for $F = nabla f$,
  $ parallel cal(P) nabla f parallel_2^2 lt.eq 2 parallel upright(bold(1))_(S^c) nabla f parallel_2^2 + C D^(- 0.071 + 3 theta) parallel nabla f parallel_2^2 . $
  For example, if $theta < 10^(- 3)$, the last coefficient is $o \( epsilon_D \)$. Integration by parts, using the Neumann condition on $u_p$, gives $chevron.l nabla u_p \/ \| p \| \, nabla f chevron.r = \| p \| chevron.l u_p \, f chevron.r$. A fixed fraction of (3.11) therefore controls $sum_(0 < \| p \| lt.eq D^0.003) p^2 \| chevron.l u_p \, f chevron.r \|^2$. Another fraction of the everywhere reserve controls the remaining weights one, since $epsilon_D p^2 gt.eq D^0.004$ for $\| p \| > D^0.003$. Sum the slice estimates over the coordinates. Together with the count bound already obtained this proves (3.9) with $c_(upright(r)) = 10^(- 3)$. ◻
]

=== 3.3 Localization in the number of low-frequency excitations <en:localization-section>

The rough estimate now permits a cutoff in an excitation number, in the spirit of the large-matrix localization of [22] Appendix A, without losing an appreciable energy density. We record explicitly the form error because the cutoff need not preserve the hard-core constraint. It is applied only after passing to the bounded replacement potential.

Let $P_0 = \| u_0 chevron.r chevron.l u_0 \|$, $n_0 = upright(d) Gamma \( P_0 \)$, and $n_(+) = n - n_0$. Define

$ P_L = sum_(0 < \| p \| lt.eq K_H \/ E) \| u_p chevron.r chevron.l u_p \| \, #h(2em) n_L = upright(d) Gamma \( P_L \) \, #h(2em) n_H = n_(+) - n_L \, $

where $K_H asymp Q^100$. Let $M asymp D v_b Q^(- 400)$ be a positive integer. Choose real functions $f \, h$ on $bb(R)$ with

$ f^2 + h^2 = 1 \, quad f = 1 upright(" on ") \( - oo \, M \/ 8 \] \, quad f = 0 upright(" on ") \[ M \/ 4 \, oo \) \, quad "Lip" \( f \) + "Lip" \( h \) lt.eq C \/ M . $

For example, write $f = cos theta.alt$, $h = sin theta.alt$, where $theta.alt$ increases smoothly from zero to $pi \/ 2$ on this interval. Define

#[#set math.equation(numbering: n => "(3.18)")
 $ F_1 = f \( n_L \)^2 \, #h(2em) F_2 = h \( n_L \)^2 \, #h(2em) F_3 = sqrt(2) f \( n_L \) h \( n_L \) . $ <en:three-cutoffs>]

Then $sum_(j = 1)^3 F_j^2 = 1$. The first and third localized vectors are supported on $n_L lt.eq M \/ 4$; the second is supported on $n_L gt.eq M \/ 8$. We also have

#[#set math.equation(numbering: n => "(3.19)")
 $ psi = F_1 psi + F_2 psi \, #h(2em) parallel A psi parallel^2 lt.eq 2 parallel A F_1 psi parallel^2 + 2 parallel A F_2 psi parallel^2 $ <en:count-reconstruction>]

for every operator $A$ for which these expressions are defined. The second inequality is the reason for using three cutoffs: later it transfers configuration-count estimates without a commutation assumption.

#thm([Lemma 3.2.])[
  (Form error of the excitation cutoff).  #emph[ Let $psi$ belong to the form domain of $H_n$, and let $V_n = sum_(i < j) v \( x_i - x_j \)$. Then 
#[#set math.equation(numbering: n => "(3.20)")
 $ lr(|sum_(j = 1)^3 chevron.l F_j psi \, H_n F_j psi chevron.r - chevron.l psi \, H_n psi chevron.r|) lt.eq C / M^2 [chevron.l psi \, V_n psi chevron.r + parallel v parallel_1 K_H^3 / v_b thin n chevron.l psi \, n_(+) psi chevron.r] . $ <en:cutoff-form-error>]

 For any one-particle operator $a$ with $parallel a parallel lt.eq 1$, the corresponding error for $upright(d) Gamma \( a \)$ is at most $C n M^(- 2) parallel psi parallel^2$.]
] <en:cutoff-error>

#proof[
  Let $Pi_k$ project onto $n_L = k$, and write $psi_k = Pi_k psi$. The kinetic operator commutes with every cutoff. A two-particle multiplication operator changes $n_L$ by at most two, so $Pi_k V_n Pi_l = 0$ for $\| k - l \| > 2$. The difference of the potential forms is exactly
  $ - 1 / 2 sum_(k \, l) sum_(j = 1)^3 \( F_j \( k \) - F_j \( l \) \)^2 chevron.l psi_k \, V_n psi_l chevron.r . $
  The cutoffs have Lipschitz constants at most $C \/ M$. Positivity gives
  $ \| chevron.l psi_k \, V_n psi_l chevron.r \| lt.eq chevron.l psi_k \, V_n psi_k chevron.r^(1 \/ 2) chevron.l psi_l \, V_n psi_l chevron.r^(1 \/ 2) . $
  Since each row has at most five nonzero blocks, the absolute form difference is at most
  #[#set math.equation(numbering: n => "(3.21)")
   $ C / M^2 chevron.l psi \, cal(D) \( V_n \) psi chevron.r \, #h(2em) cal(D) \( V_n \) = sum_k Pi_k V_n Pi_k = frac(1, 2 pi) integral_0^(2 pi) e^(- i t n_L) V_n e^(i t n_L) thin upright(d) t . $ <en:dephased-error>]
  The cosine evaluation bound on the low band is $sup_x P_L \( x \, x \) lt.eq C K_H^3 \/ v_b$. For each pair it implies
  #[#set math.equation(numbering: n => "(3.22)")
   $ P_(L \, i) v \( x_i - x_j \) P_(L \, i) lt.eq C parallel v parallel_1 K_H^3 / v_b P_(L \, i) . $ <en:pair-low-projection>]
  Indeed, condition on $x_j$ and all other coordinates, apply $\| P_L g \( x_i \) \|^2 lt.eq \( sup_x P_L \( x \, x \) \) parallel P_L g parallel_2^2$, and integrate the potential in $x_i$. For the pair $\( i \, j \)$, the rotations on the other coordinates cancel. Writing $z = e^(i t) - 1$, the remaining rotation is
  $ \( 1 + z P_(L \, i) \) \( 1 + z P_(L \, j) \) = 1 + z P_(L \, i) + z P_(L \, j) + z^2 P_(L \, i) P_(L \, j) . $
  The squared norm after multiplication by $v_(i j)^(1 \/ 2)$ is bounded by a fixed constant times the sum of the four squared norms. Use (3.22) on the last three terms, and $P_(L \, i) P_(L \, j) lt.eq P_(L \, i)$, to obtain
  $ chevron.l psi \, cal(D) \( V_n \) psi chevron.r lt.eq C chevron.l psi \, V_n psi chevron.r + C parallel v parallel_1 K_H^3 / v_b thin n chevron.l psi \, n_L psi chevron.r . $
  This and $n_L lt.eq n_(+)$ prove (3.20). A one-particle operator has block width one instead of two. Using its second-quantized norm at most $n$, and $2 parallel psi_k parallel parallel psi_l parallel lt.eq parallel psi_k parallel^2 + parallel psi_l parallel^2$, proves the final assertion. ◻
]

We apply the lemma to the restrictions of a normalized hard-core ground vector to box-assignment sectors. Its zero extension belongs to the soft-potential form domain, and the potential expectation is bounded by the hard-core energy. The localized vectors need not satisfy the hard-core constraint; all their lower bounds use $H_n$. The finite-rank cosine projections preserve $H^1$, so the localized vectors are in this form domain.

Here is the quantitative energy accounting. Write $e_0 \( x \) = 4 pi r x^2$. Summing the rough bound and comparing with the thermodynamic upper bound $V \( e_0 \( D \) + O \( 1 \) \)$ gives, over boxes with $n lt.eq 6 D v_b$,

#[#set math.equation(numbering: n => "(3.23)")
 $ 1 / V sum chevron.l n_(+) chevron.r lt.eq C Q^2 D^(1 - c_(upright(r))) . $ <en:preliminary-excitations>]

To justify using the tangent to $e_0$ in this summation for every particle sector, note first that $n lt.eq 6 D v_b$ gives the exact scalar remainder $4 pi r \( n - D v_b \)^2 \/ v_b$. If $n > 6 D v_b$, partition the labels into groups of sizes between $3 D v_b - o \( D v_b \)$ and $6 D v_b$, apply Lemma 8 to each group and drop intergroup interactions. The energy per particle is then at least $12 pi alpha - o \( 1 \)$, whereas the slope of the tangent is $8 pi alpha$. These sectors have a positive excess of order $n$ above that tangent. Finally, $min { p^2 \, 1 } gt.eq c E^(- 2)$ for $p eq.not 0$, which proves (3.23). All sums include the squared norms of sector vectors and any spectator variables.

We use the cutoffs only for $D v_b \/ 2 lt.eq n lt.eq 6 D v_b$. The total potential expectation is at most $C D V$, and $M asymp D Q^(- 397)$. Substitution of (3.23) into (3.20) gives the explicit bound

#[#set math.equation(numbering: n => "(3.24)")
 $ 1 / V sum lr(|upright("localization form error")|) lt.eq C (D^(- 1) Q^794 + D^(- c_(upright(r))) Q^1097) lt.eq C Q^(- 1) \, $ <en:localization-density-error>]

provided $795 theta < 1$ and $1098 theta < c_(upright(r))$. The one-particle observable error is bounded by the first term on the right. Thus these errors are negligible on the energy scale used below.

=== 3.4 The sharp bound on a low-excitation piece <the-sharp-bound-on-a-low-excitation-piece>

The next bound is the information beyond the scalar LHY formula that will determine the mesoscopic occupation. We give the passage from the published operator estimates to the exact vectors, including the zero-mode resolution and the cosine-basis convention.

For $z eq.not 0$ put $zeta_z = z \/ \| z \|$, and set $zeta_0 = 1$. Define

#[#set math.equation(numbering: n => "(3.25)")
 $ tau \( p \) & = p^2 - frac(pi, 2 E^2) - K_H / E^2 upright(bold(1))_({ p in.not cal(P)_L }) \,\
rho_z & = \| z \|^2 \/ v_b \, #h(2em) D_p \( z \) = sqrt(tau \( p \)^2 + 2 rho_z hat(g) \( p \) tau \( p \)) \,\
beta_p \( z \) & = frac(tau \( p \) + rho_z hat(g) \( p \) - D_p \( z \), rho_z hat(g) \( p \)) \, #h(2em) b_p \( z \) = frac(a_p + zeta_z^2 beta_p \( z \) a_p^(*), sqrt(1 - beta_p \( z \)^2)) . $ <en:tau>]

At zero numerator and denominator use the continuous value. The factor $zeta_z^2$ restores the phase in the pairing term; for real $z$ it equals one. Put $tilde(D)_p = D_p$ on $cal(P)_L$ and $tilde(D)_p = K_H^(- 1) D_p$ on its complement. The square root is real: the support of $g$ gives $\| hat(g) \( p \) - hat(g) \( 0 \) \| lt.eq C r^3 p^2$, and $tau \( p \) asymp p^2$. In particular the possible negative part of $hat(g)$ cannot destroy positivity when $D$ is large and $\| z \|^2 lt.eq 2 n$ in (3.5). More explicitly, $rho_z lt.eq C D$ implies $tau \( p \) + 2 rho_z hat(g) \( p \) gt.eq \( c - C D^(- 2) \) p^2$. At $rho_z = 0$ we have $D_p = tau \( p \)$, $beta_p = 0$, and $b_p = a_p$.

For $n$ in (3.5) and an $n$-particle vector $psi$, let $psi_z = \( chevron.l z \| ⊗ 1 \) psi$ denote its zero-mode coherent projection, with measure $upright(d)^2 z \/ pi$. Here $\| z chevron.r = e^(- \| z \|^2 \/ 2) sum_(k gt.eq 0) z^k \| k chevron.r \/ sqrt(k !)$. Define the nonnegative quadratic expression

#[#set math.equation(numbering: n => "(3.26)")
 $ cal(B) \( psi \) = integral_(\| z \|^2 lt.eq 2 n) sum_(p eq.not 0) tilde(D)_p \( z \) parallel b_p \( z \) psi_z parallel^2 frac(upright(d)^2 z, pi) . $ <en:bog-energy>]

For later truncations we record the coherent tail at this point. There is no large-$z$ assumption on the original vector. Write $psi = sum_(k = 0)^n \| k chevron.r ⊗ psi^(\( n - k \))$. Angular integration shows that its radial coherent density is a sum of gamma densities $e^(- s) s^k \/ k !$, $0 lt.eq k lt.eq n$, weighted by $parallel psi^(\( n - k \)) parallel^2$. The gamma Chernoff bound consequently gives

#[#set math.equation(numbering: n => "(3.27)")
 $ integral_(\| z \|^2 > 2 n) \( 1 + \| z \| \)^A parallel psi_z parallel^2 frac(upright(d)^2 z, pi) lt.eq C_A n^(A \/ 2) e^(- c n) parallel psi parallel^2 $ <en:coherent-tail>]

for every fixed $A gt.eq 0$. The local lower bound we shall prove is the following.

#thm([Lemma 3.3.])[
  (Energy with a retained quasiparticle term).  #emph[For $n$ in (3.5) and a bosonic $n$-particle vector $psi$ in the form domain of $H_b$ satisfying $psi = upright(bold(1))_({ n_L lt.eq M \/ 4 }) psi$, 
#[#set math.equation(numbering: n => "(3.28)")
 $ chevron.l psi \, H_b psi chevron.r gt.eq { v_b e_r \( n \/ v_b \) - C v_b Q^(- 1 \/ 4) } parallel psi parallel^2 + c E^(- 2) chevron.l n_(+) + K_H n_H chevron.r_psi + c cal(B) \( psi \) . $ <en:sharp-bound>]

 The constants are uniform in the particle sector and in spectator variables.]
] <en:sharp>

Its proof must preserve two positive terms: the gap controlling physical excitation numbers, and the coherent quadratic energy $cal(B)$. Write $S = E^(- 2) \( pi n_(+) \/ 2 + K_H n_H \)$. The symmetrization and second-quantization formulas of [13] Theorem 2.6 and Lemma 2.8 separate the number-operator block $hat(g) \( 0 \) { n \( n - 1 \) - n_(+) \( n_(+) - 1 \) } \/ \( 2 v_b \)$ from terms containing the constant mode. Coherent resolution of the latter terms gives the quadratic–cubic operator $cal(H)_0 \( z \)$ defined below, with the upper-symbol corrections accounted for in the proof of Lemma 10. We first bound this operator while retaining its excitation energy, then estimate the correction to the cosine coefficients, and finally return to the box Hamiltonian.

The next operator estimate specifies the gap fractions in the energy analysis of [13]. Write $cal(P)_L^(bb(Z))$ for the signed version of the low band, extend operator subscripts by componentwise absolute value, put $c_p = product_i c_(p_i)$, and let $c \( p \, k \) = product_i c_(k_i - p_i) \/ \( c_(p_i) c_(k_i) \)$ be the printed coefficient in that paper. Define

#[#set math.equation(numbering: n => "(3.29)")
 $ Q_3 \( z \) & = 1 / v_b sum_(p in cal(P)_L^(bb(Z)) \, med k eq.not 0\
\| p - k \| eq.not 0) c \( p \, k \) hat(g) \( k \) \( overline(z) a_p^(*) a_(\| p - k \|) a_k + upright(h . c .) \) \,\
cal(H)_0 \( z \) & = sum_(p eq.not 0) [\( tau \( p \) + rho_z hat(g) \( p \) \) a_p^(*) a_p + frac(hat(g) \( p \), 2 v_b) \( overline(z)^2 a_p^2 + z^2 a_p^(* 2) \)] + frac(accent(g omega, ̂) \( 0 \) \| z \|^4, 2 v_b)\
 & quad + rho_z sum_(p eq.not 0) { accent(g omega, ̂) \( 0 \) + accent(g omega, ̂) \( p \) } a_p^(*) a_p + Q_3 \( z \) . $ <en:printed-cubic>]

Here $k$ ranges over the nonnegative Neumann lattice, and $\| p - k \|$ in an operator subscript means componentwise absolute value. Thus $cal(H)_0$ is (2.36) of [13] at zero chemical parameter with its artificial scalar convexity term subtracted. The exact cosine coefficients are treated separately in Lemma 12.

#thm([Lemma 3.4.])[
  (A small-gap version of the quadratic–cubic bound).  #emph[Let $n$ satisfy (3.5), $\| z \|^2 lt.eq 2 n$, and $xi = upright(bold(1))_({ n_(+) lt.eq n \, med n_L lt.eq M \/ 4 }) xi$. For every fixed $delta > 0$ and sufficiently large $D$, 
#[#set math.equation(numbering: n => "(3.30)")
 $ chevron.l xi \, cal(H)_0 \( z \) xi chevron.r & gt.eq 4 pi c_(upright(L)) \( a' \)^(5 \/ 2) v_b rho_z^(5 \/ 2) parallel xi parallel^2 + sum_(p eq.not 0) tilde(D)_p \( z \) parallel b_p \( z \) xi parallel^2 - delta chevron.l S chevron.r_xi - C_delta v_b Q^(- 1 \/ 4) parallel xi parallel^2 . $ <en:small-gap-bound>]

]
] <en:small-gap>

#proof[
  We use the Bogoliubov identity (2.39), the completion of a square (7.18)–(7.20), and the scalar integral estimate in [13] Lemma A.1. We give the intervening bounds, in particular an estimate of the creation term with every commutator retained. This obtains the required gap fraction directly; no quantifier about the coefficient in that paper’s free-energy Theorem 2.9 is needed. By homogeneity suppose $parallel xi parallel = 1$, and abbreviate $K = K_H$, $N_(+) = chevron.l n_(+) chevron.r_xi$, $lambda = \( D v_b \)^(- 1 \/ 2)$, and $h \( k \) = \| hat(g) \( k \) \| \/ \( 8 pi a' \) lt.eq 1$.
  The Bogoliubov identity (2.39) of [13] gives the exact separation
  #[#set math.equation(numbering: n => "(3.31)")
   $ cal(H)_0 \( z \) = cal(E)_(upright(B)) \( z \) + sum_(p eq.not 0) D_p \( z \) b_p \( z \)^(*) b_p \( z \) + cal(R)_(upright("int")) \( z \) + Q_3 \( z \) \, $ <en:H0-decomposition>]
  where
  $ cal(E)_(upright(B)) \( z \) & = 1 / 2 sum_(p eq.not 0) #scale(x: 120%, y: 120%)[\(] D_p \( z \) - tau \( p \) - rho_z hat(g) \( p \) #scale(x: 120%, y: 120%)[\)] + frac(accent(g omega, ̂) \( 0 \) \| z \|^4, 2 v_b) \,\
cal(R)_(upright("int")) \( z \) & = rho_z sum_(p eq.not 0) { accent(g omega, ̂) \( 0 \) + accent(g omega, ̂) \( p \) } a_p^(*) a_p . $
  We shall bound $Q_3$ using part of the positive quadratic energy, cancel its normal-ordering remainder against $cal(R)_(upright("int"))$, and evaluate the scalar $cal(E)_(upright(B))$ at the end.
  First remove the part of (3.29) with $k$ low. Put $l = \| p - k \|$. Bounded multiplicity of $k mapsto l$ for fixed $p$, commutation of $a_l$ past $a_l^(*)$, and $n_L lt.eq M \/ 4$ give
  $ sum_(p \, k) parallel a_l^(*) a_p xi parallel^2 lt.eq C \( M + K^3 \) N_(+) \, #h(2em) sum_(p \, k) parallel a_k xi parallel^2 lt.eq C K^3 N_(+) . $
  Here both $p$ and $k$ range over their low bands, with the signed multiplicity in $p$ bounded by eight; the terms with $l = 0$ are omitted. Cauchy–Schwarz in the expectation $chevron.l a_l^(*) a_p xi \, a_k xi chevron.r$ therefore bounds this part by
  $ C lambda K^(3 \/ 2) \( M + C K^3 \)^(1 \/ 2) N_(+) . $
  Its coefficient relative to $E^(- 2) N_(+)$ is $O \( Q^(- 48) + D^(- 1 \/ 2) Q^300.5 \) = o \( 1 \)$.
  In the remaining cubic term $k$ is high. Substitute $a_k = U_k b_k + V_k b_k^(*)$ and write it as $cal(T)_1 + cal(T)_V$. For high $k$, $\| U_k \| lt.eq C$ and $\| V_k \| lt.eq C h \( k \) \/ k^2$. Thus the coefficients of $cal(T)_V$ are at most $C lambda h \( k \)^2 \/ k^2$ in absolute value. Let $l = \| p - k \|$. Since $p$ is low and $k$ high, the exact commutation is
  #[#set math.equation(numbering: n => "(3.32)")
   $ a_p^(*) a_l b_k^(*) = b_k^(*) a_p^(*) a_l + U_k upright(bold(1))_({ l = k }) a_p^(*) . $ <en:Talpha-commute>]
  The harmless common phase of $z$ can be included in the coefficients. Set
  $ B_H = sum_(k med upright("high")) k^2 / K parallel b_k xi parallel^2 . $
  For the first term on the right of (3.32), Cauchy–Schwarz in $p$, followed by weighted Cauchy–Schwarz in $k$, gives
  #[#set math.equation(numbering: n => "(3.33)")
   $ & C lambda sum_(k med upright("high")\
p med upright(l o w \, med s i g n e d)) frac(h \( k \)^2, k^2) parallel b_k xi parallel thin parallel a_p^(*) a_l xi parallel\
 & #h(2em) lt.eq C lambda K^2 B_H^(1 \/ 2) (sum_(p \, k) frac(h \( k \)^4, k^6) parallel a_p^(*) a_l xi parallel^2)^(1 \/ 2) . $ <en:Talpha-CS>]
  The summation ranges on the last line are those on the first. The identity $parallel a_p^(*) a_l xi parallel^2 = parallel a_p a_l xi parallel^2 + parallel a_l xi parallel^2$ and bounded folding multiplicity imply
  $ sum_(p \, k) parallel a_p a_l xi parallel^2 lt.eq C M N_(+) \, #h(2em) sum_(p \, k) parallel a_l xi parallel^2 lt.eq C K^3 N_(+) . $
  For the first bound use $sum_p a_p^(*) n_(+) a_p lt.eq C n_L n_(+)$; it holds also when $l = p$. Since $k^2 gt.eq K^2 \/ E^2$, Young’s inequality in (3.33) yields, for every $epsilon > 0$,
  #[#set math.equation(numbering: n => "(3.34)")
   $ \| chevron.l cal(T)_V^(thin upright("reordered")) chevron.r \| & lt.eq epsilon B_H + C_epsilon lambda^2 K^4 \( E \/ K \)^6 \( M + K^3 \) N_(+)\
 & lt.eq epsilon B_H + C_epsilon \( Q^(- 594) + D^(- 1) Q^103 \) N_(+) . $ <en:Talpha-main-bound>]
  The second term in (3.32) is also summable. The condition $\| p - k \| = k$ requires, in each coordinate, $p_i = 0$ or $p_i = 2 k_i$. Some $p_i$ is nonzero, so for fixed $p$ the admissible $k$ lie in at most three planes $k_i = p_i \/ 2$. Two-dimensional lattice summation, retaining $h \( k \)^2$, gives
  $ sum_(k med upright("high")\
\| p - k \| = k) frac(h \( k \)^2, k^2) lt.eq C E^2 \( 1 + log D \) . $
  Indeed the dyadic sums below a sufficiently large polynomial frequency are $O \( E^2 \)$ per annulus, and the radial transform bound $h \( k \) lt.eq D^C \/ \| k \|$ makes the remaining tail summable. Cauchy–Schwarz in the $O \( K^3 \)$ possible values of $p$ now gives
  #[#set math.equation(numbering: n => "(3.35)")
   $ \| chevron.l cal(T)_V^(thin upright("commutator")) chevron.r \| & lt.eq C lambda E^2 K^(3 \/ 2) \( 1 + log D \) sqrt(N_(+))\
 & lt.eq delta chevron.l S chevron.r + C_delta D^(- 1) Q^303 \( 1 + log D \)^2 . $ <en:Talpha-resonance>]
  This ordering of the operators avoids an unweighted sum of vacuum commutators over all high modes. Choose $epsilon$ small enough that $epsilon B_H lt.eq K^(- 1) sum_(k med upright("high")) D_k parallel b_k xi parallel^2$. The other terms in (3.34) are $o \( chevron.l S chevron.r \)$; the scalar in (3.35) is $o \( v_b Q^(- 1) \)$. The coefficient $delta$ here can be any prescribed fixed fraction of the one in the statement.
  It remains to treat $cal(T)_1$. Complete a square with $\( 1 - 2 K^(- 1) \) sum_(k med upright("high")) D_k b_k^(*) b_k$. The square is nonnegative. Its negative remainder, after normal ordering, is the sum of a commutator term $cal(T)_c$ and a quartic term $cal(T)_0$, as in (7.18)–(7.20) of [13]. The coefficient in that square is
  $ A_k = frac(z hat(g) \( k \), v_b \( 1 - 2 K^(- 1) \) D_k sqrt(1 - beta_k^2)) sum_(p in cal(P)_L^(bb(Z))\
\| p - k \| eq.not 0) c \( p \, k \) a_(\| p - k \|)^(*) a_p . $
  In $A_k^(*) A_k$, the commutator is nonzero only when $\| p - k \| = \| s - k \|$. Either $p = s$, or at least one coordinate of $k$ lies in the low-frequency slab $\| k_i \| lt.eq K \/ E$. The exact signed-cosine weight identity $sum_p c_p^(- 2) a_p^(*) a_p = n_L$, followed by [13] Lemmas 7.2–7.3, Equation (7.27), gives
  #[#set math.equation(numbering: n => "(3.36)")
   $ chevron.l cal(T)_c chevron.r lt.eq 2 rho_z accent(g omega, ̂) \( 0 \) N_(+) + C \( Q^(- 97.75) + D^(- 1) Q^200.25 \) E^(- 2) N_(+) . $ <en:Tc-bound>]
  The first term cancels the remaining quadratic interaction term in (3.29), up to an error. Splitting that interaction into its low and high frequencies, Lemma 7.2(1) of the same paper bounds this error by
  $ C n_H + C D^(- 2) Q^198 n_(+) lt.eq C \( Q^(- 98) + D^(- 2) Q^200 \) S . $
  The quartic term has the explicit bound
  $ cal(T)_0 lt.eq C thin frac(a' K_ell^3 K, v_b) n_L n_(+) \, $
  obtained by Cauchy–Schwarz in its two low indices and summing the remaining high occupation, as in (7.28)–(7.29) of [13]. On the present subspace its ratio to $E^(- 2) n_(+)$ is at most $C M a' K_ell^3 K \/ E = O \( Q^(- 295) \)$. All errors in this paragraph are therefore $o \( S \)$. These estimates are uniform for $0 lt.eq rho_z lt.eq 2 n \/ v_b$. Lemma 7.2 of [13] concerns the potential alone, and Lemma 7.3 is applied at $rho_(upright("aux"))$ and multiplied by $rho_z \/ rho_(upright("aux"))$, which is uniformly bounded. At $rho_z = 0$ the cubic and interaction terms vanish and $b_p = a_p$.
  In the notation of (3.31), the cancellation just proved reads
  $ chevron.l cal(R)_(upright("int")) - cal(T)_c chevron.r gt.eq - o \( 1 \) chevron.l S chevron.r . $
  The completed square spends $\( 1 - 2 K^(- 1) \)$ of the high quadratic energy; the reordered creation term spends at most another $K^(- 1)$. Together with the low-cubic and quartic bounds this leaves
  $ chevron.l cal(H)_0 \( z \) chevron.r gt.eq cal(E)_(upright(B)) \( z \) + sum_(p eq.not 0) tilde(D)_p \( z \) parallel b_p \( z \) xi parallel^2 - delta chevron.l S chevron.r - C_delta v_b Q^(- 1) . $
  We have retained every low Bogoliubov mode and at least a fraction $K^(- 1)$ of every high mode. Lemma A.1 of [13] evaluates $cal(E)_(upright(B)) \( z \)$ as $4 pi c_(upright(L)) \( a' \)^(5 \/ 2) v_b rho_z^(5 \/ 2)$ with error $C v_b Q^(- 1 \/ 4)$, uniformly on $\| z \|^2 lt.eq 2 n$. Combining the two bounds, choosing the fixed gap fractions first and then increasing $D$, proves (3.30). ◻
]

#thm([Lemma 3.5.])[
  (Exceptional cosine coefficients).  #emph[Let $n$ satisfy (3.5), let $\| z \|^2 lt.eq 2 n$, and restrict the excitation space to $n_(+) lt.eq n$ and $n_L lt.eq M \/ 4$. On this space the exact cosine expansion may replace the coefficients in (2.35)–(2.37) of [13]. Its correction is bounded in absolute quadratic form by 
$ delta (S + sum_(p eq.not 0) tilde(D)_p \( z \) b_p \( z \)^(*) b_p \( z \)) + C_delta v_b Q^(- 1 \/ 4) $

 for every fixed $delta > 0$, if $D$ is sufficiently large.]
] <en:cosine-correction>

#proof[
  Extend a cosine subscript by componentwise absolute value. In a term $a_p^(*) a_l a_k$, $p$ is a signed low frequency and $l = \| p - k \|$; terms with $l = 0$ are omitted. The product-to-sum identity in each coordinate shows that the printed coefficient agrees with the exact expansion unless $k_i = 0$ or $k_i = \| p_i \|$ for some $i$. All multiplicities and discrepancies are bounded by an absolute constant. For example, when $k_i = 0$ and $p_i eq.not 0$, the two choices of the sign of $p_i$ must share one coefficient; when $k_i = p_i eq.not 0$ and $l_i = 0$, the zero cosine has normalization one. These are precisely the two exceptional cases.
  Put $lambda = \( D v_b \)^(- 1 \/ 2)$ and $h \( k \) = \| hat(g) \( k \) \| \/ \( 8 pi a' \) lt.eq 1$. Every correction has coefficient bounded by $C lambda h \( k \)$. We estimate its expectation in a normalized excitation vector $xi$ with $n_(+) lt.eq n$, $n_L lt.eq M \/ 4$. For $\| k \| lt.eq 3 K_H \/ E$, Cauchy–Schwarz applied to $chevron.l a_l^(*) a_p xi \, a_k xi chevron.r$ gives
  #[#set math.equation(numbering: n => "(3.37)")
   $ C lambda K_H^(3 \/ 2) { M chevron.l n_(+) chevron.r + C K_H^3 chevron.l n_(+) chevron.r }^(1 \/ 2) chevron.l n_(+) chevron.r^(1 \/ 2) . $ <en:cosine-low>]
  To see the first factor, sum the occupation products after commuting $a_l$ past $a_l^(*)$; for each $p$, the multiplicities of $l$ are bounded. The second Cauchy–Schwarz factor sums $a_k^(*) a_k$ at most $C K_H^3$ times. The two coefficients multiplying $chevron.l n_(+) chevron.r$ in (3.37) are $O \( Q^(- 50) \)$ and $O \( D^(- 1 \/ 2) Q^298.5 \)$, respectively, and are $o \( E^(- 2) \)$.
  For $\| k \| > 3 K_H \/ E$, both $k$ and $l$ are high frequencies. Use $a_k = U_k b_k + V_k b_k^(*)$, where $\| U_k \| lt.eq C$ and $\| V_k \| lt.eq C \/ k^2$. The terms involving $parallel b_k xi parallel$, including the excitation part of $parallel b_k^(*) xi parallel$, are bounded by the product of
  $ (sum_k k^2 K_H^(- 1) parallel b_k xi parallel^2)^(1 \/ 2) $
  and a factor whose square is at most
  #[#set math.equation(numbering: n => "(3.38)")
   $ C lambda^2 K_H^4 {\( E \/ K_H \)^2 M chevron.l n_H chevron.r + E^2 \( 1 + log D \) chevron.l n_(+) chevron.r} . $ <en:cosine-high>]
  Here is the complete weighted sum underlying this estimate. Restrict $\( p \, k \)$ to the exceptional planes of the correction and put $F_(p k) = parallel a_l^(*) a_p xi parallel$, with $l = \| p - k \|$. Cauchy–Schwarz in the at most $C K_H^3$ values of $p$, then in $k$ with weight $k^2 \/ K_H$, gives
  $ C lambda sum_k h \( k \) parallel b_k xi parallel sum_p F_(p k) lt.eq C lambda K_H^2 (sum_k k^2 / K_H parallel b_k xi parallel^2)^(1 \/ 2) (sum_(p \, k) frac(h \( k \)^2, k^2) F_(p k)^2)^(1 \/ 2) . $
  Since $l$ is high and $p$ low, $F_(p k)^2 = parallel a_l a_p xi parallel^2 + parallel a_p xi parallel^2$ and bounded folding multiplicity gives
  $ sum_(p \, k) frac(h \( k \)^2, k^2) parallel a_l a_p xi parallel^2 & lt.eq C \( E \/ K_H \)^2 chevron.l n_L n_H chevron.r lt.eq C \( E \/ K_H \)^2 M chevron.l n_H chevron.r \,\
sum_(p \, k) frac(h \( k \)^2, k^2) parallel a_p xi parallel^2 & lt.eq C E^2 \( 1 + log D \) chevron.l n_(+) chevron.r . $
  The second line uses the two-dimensional plane sums
  #[#set math.equation(numbering: n => "(3.39)")
   $ sum_(k upright(" on an exceptional plane")\
\| k \| > 3 K_H \/ E) frac(h \( k \)^i, k^2) lt.eq C E^2 \( 1 + log D \) \, #h(2em) i = 1 \, 2 . $ <en:plane-sums>]
  For (3.39), use dyadic annuli up to a sufficiently large power of $D$. Beyond that scale the radial transform formula $hat(g) \( k \) = 4 pi \| k \|^(- 1) integral_0^r t g \( t \) sin \( \| k \| t \) upright(d) t$ gives $h \( k \) lt.eq D^C \/ \| k \|$ and a summable tail. The same argument with $k^(- 4)$ gives a bound $C E^2$.
  The extra unit in $parallel b_k^(*) xi parallel^2 = parallel b_k xi parallel^2 + 1$ comes with $V_k$. Its total contribution is at most
  #[#set math.equation(numbering: n => "(3.40)")
   $ C lambda K_H^(3 \/ 2) E^2 {sqrt(M chevron.l n_H chevron.r) + \( 1 + log D \) sqrt(chevron.l n_(+) chevron.r)} . $ <en:cosine-creation>]
  To verify (3.40), bound the unit contribution by $C lambda sum_(p \, k) h \( k \) k^(- 2) F_(p k)$. Its occupation-product part is at most
  $ C lambda (sum_(p \, k) frac(h \( k \)^2, k^4))^(1 \/ 2) (sum_(p \, k) parallel a_l a_p xi parallel^2)^(1 \/ 2) lt.eq C lambda E^2 K_H^(3 \/ 2) sqrt(M chevron.l n_H chevron.r) . $
  Here we used the loose bound $C E^4$ for each $k^(- 4)$ plane sum and at most $C K_H^3$ values of $p$. Its commutator part is bounded by first summing $h \( k \) \/ k^2$ on the plane and then using $sum_p parallel a_p xi parallel lt.eq C K_H^(3 \/ 2) sqrt(chevron.l n_(+) chevron.r)$. These are the two terms in (3.40).
  Young’s inequality absorbs the first factor above into a $delta$ fraction of the high-frequency quasiparticle energy. In (3.38), the coefficients of $chevron.l n_H chevron.r$ and $chevron.l n_(+) chevron.r$ are $O \( Q^(- 198) \)$ and $O \( D^(- 1) Q^399 \( 1 + log D \) \)$. They are negligible relative to the gaps $Q^98 n_H$ and $Q^(- 2) n_(+)$. Applying Young’s inequality to (3.40) leaves scalar errors bounded by $C_delta \[ Q^(- 194) + D^(- 1) Q^303 \( 1 + log D \)^2 \]$. They fit within $C_delta v_b Q^(- 1 \/ 4)$ for sufficiently small $u$. This proves the stated bound. On the omitted large-$z$ region the correction has a polynomial bound on the truncated particle sectors: the $k$ coefficients have a polynomially bounded lattice square sum, and $p$ lies in a finite band. Thus (3.27) also covers that region. ◻
]

#proof[
  We detail both the gap allocation and the resolution of the zero mode. The calculations may first be made with finitely many Neumann modes. These truncations commute with the excitation cutoffs and approximate the local form domain. The bounded-potential terms then converge in form, and the retained positive quasiparticle expression passes by lower semicontinuity. This justifies the infinite sums below. Set
  $ S = E^(- 2) \( pi n_(+) \/ 2 + K_H n_H \) \, #h(2em) H_b = H_b^(upright("mod")) + S . $
  Apply the symmetrization estimate of [13] Theorem 2.6 with the fixed choice $epsilon = 1 \/ 10$. It gives
  #[#set math.equation(numbering: n => "(3.41)")
   $ H_b^(upright("mod")) gt.eq H_b^(upright("sym")) - C n D r \( r \/ E \) - epsilon G \, #h(2em) G = 1 / 2 \( 1 + n_L \/ M \) S . $ <en:symmetrization>]
  On the present vector $G lt.eq 5 S \/ 8$, so $epsilon G lt.eq S \/ 16$. The hypotheses with the constant associated to this fixed choice hold for large $D$, since $K_H \/ K_ell^4 asymp Q^96$ and $K_ell K_H^3 sqrt(rho_(upright("aux")) \( a' \)^3) = O \( D^(- 1) Q^301 \)$. The scalar error is $O \( E^2 \)$ and hence fits within $C v_b Q^(- 1 \/ 4)$.
  In the second-quantized identity of [13] Lemma 2.8, the terms involving only the number operators are
  $ frac(hat(g) \( 0 \), 2 v_b) { n \( n - 1 \) - n_(+) \( n_(+) - 1 \) } . $
  The negative term can be paid from an arbitrarily small fraction of $S$. Indeed
  #[#set math.equation(numbering: n => "(3.42)")
   $ n_(+)^2 lt.eq 2 M n_(+) + 2 n n_H \, #h(2em) r / v_b n_(+)^2 lt.eq C { Q^(- 400) n_(+) + n_H } = o \( 1 \) S . $ <en:self-interaction>]
  The replacement of $n \( n - 1 \)$ by $n^2$ costs $O \( 1 \)$.
  The coherent resolution is an exact identity for quadratic forms; this use of upper symbols is the one in [21]. The upper symbols of the two zero-mode monomials are
  #[#set math.equation(numbering: n => "(3.43)")
   $ a_0^(*) a_0 : med \| z \|^2 - 1 \, #h(2em) a_0^(* 2) a_0^2 : med \| z \|^4 - 4 \| z \|^2 + 2 . $ <en:upper-symbols>]
  Monomials containing only creations or only annihilations have their ordinary polynomial symbols. Let $cal(C) \( z \)$ denote the exact cosine cubic operator minus the printed cubic operator (3.29); Lemma 12 bounds this difference. If $x = \| z \|^2$, the upper-symbol correction is
  #[#set math.equation(numbering: n => "(3.44)")
   $ cal(R) \( z \) = frac(accent(g omega, ̂) \( 0 \), 2 v_b) \( - 4 x + 2 \) - 1 / v_b sum_(p eq.not 0) { hat(g) \( p \) + accent(g omega, ̂) \( 0 \) + accent(g omega, ̂) \( p \) } a_p^(*) a_p . $ <en:symbol-error>]
  The complete form of the second-quantized identity [13] Lemma 2.8, Equation (2.33), with the exact cosine coefficients, is therefore
  #[#set math.equation(numbering: n => "(3.45)")
   $ chevron.l psi \, H_b^(upright("sym")) psi chevron.r & = frac(hat(g) \( 0 \), 2 v_b) [n \( n - 1 \) parallel psi parallel^2 - chevron.l psi \, n_(+) \( n_(+) - 1 \) psi chevron.r]\
 & quad + integral_(bb(C)) chevron.l psi_z \, \( cal(H)_0 \( z \) + cal(R) \( z \) + cal(C) \( z \) \) psi_z chevron.r frac(upright(d)^2 z, pi) . $ <en:coherent-Hsym-identity>]
  Here $cal(H)_0$ contains the modified kinetic symbol $tau$ and the low-band cubic cutoff from (3.29); the artificial scalar convexity term in (2.36) of that paper is absent. The identity has no additional remainder: the interaction pieces removed before symmetrization are already included in the error of (3.41). The integrated absolute quadratic form of $cal(R)$ is bounded by
  $ C r / v_b integral [\( 1 + \| z \|^2 \) parallel psi_z parallel^2 + chevron.l psi_z \, n_(+) psi_z chevron.r] frac(upright(d)^2 z, pi) lt.eq C parallel psi parallel^2 . $
  The last inequality follows from $integral \| z \|^2 parallel psi_z parallel^2 upright(d)^2 z \/ pi = chevron.l n - n_(+) + 1 chevron.r_psi$ and $r n \/ v_b = O \( 1 \)$.
  Apply Lemma 11 to the operator $cal(H)_0 \( z \)$ on $\| z \|^2 lt.eq 2 n$, with a fixed sufficiently small $delta$. The coherent projection preserves both excitation cutoffs. The lemma retains $sum tilde(D)_p b_p^(*) b_p$ and the LHY scalar at $rho_z$, while using at most $delta S$. Together with $G lt.eq 5 S \/ 8$ in (3.41) and the $o \( S \)$ loss in (3.42), this leaves a fixed positive fraction of $S$. In terms of the published formula (2.36), the artificial scalar convexity term has been subtracted identically, not estimated by its sign. Our argument uses no trace inequality from that paper’s Theorem 2.9.
  By (3.27), the discarded coherent region has exponentially small weighted mass. All negative terms of the upper symbol have polynomial norm bounds in $D \, n \, z$ on excitation sectors at most $n$; this follows either from the bounded potential or from its projected second-quantized blocks. Dropping positive kinetic energy, the omitted region thus has exponentially small lower-bound error.
  It remains to compare the LHY scalar at $rho_z$ with that at $n \/ v_b$. Convexity and its derivative, bounded by $C \/ D$ in the relevant density range, give an integrated loss at most $C D^(- 1) \( 1 + chevron.l n_(+) chevron.r_psi \)$, apart from the negligible tail. This too is absorbed by the retained gap. Replacing $a'$ by $r$ costs $O \( v_b Q^(- 1) \)$ by (3.4).
  The cosine convention in the printed cubic formula requires one final check. Lemma 12 shows that using exact cosine products costs only a prescribed small fraction of $S$ and of the quasiparticle term, together with $C v_b Q^(- 1 \/ 4)$. Combining these estimates leaves fixed positive fractions of both terms and proves (3.28). ◻
]

== 4 Count fluctuations and local one-body covariance <en:consequences>

The retained excitation energy now determines every bounded local one-body operator compressed by $W_R$ on both sides. The resulting uniform covariance law is stated in Proposition 16. The same energy comparison controls the cell counts used in the spatial argument. We record its four required count and occupation estimates first; the occupation estimates will follow by applying the covariance law to two projections. All expectations and dilute errors use the conventions of Section 2.

#thm([Proposition 4.1.])[
  (The four energy outputs).  #emph[There are arbitrarily small fixed $u > 0$ and then $0 < w < u \/ 10000$ for which the following statements hold. Use the nested partitions fixed in (2.9), with $B asymp D^u$, $R asymp D^w$, and $d = 1 \/ j$. For every normalized nonnegative bosonic ground vector, 
#[#set math.equation(numbering: n => "(4.1)")
 $ frac(1, \| cal(C)_R \|) sum_(A in cal(C)_R) bb(E) \( q_A - 1 \)^2 & lt.eq C D^(- 1 - w \/ 6) \,\
frac(1, \| cal(C)_d \|) sum_(A in cal(C)_d) bb(E) \( q_A - 1 \)^4 & lt.eq C_j D^(- 1 - u \/ 6) . $ <en:R-count>]

 For every normalized, possibly complex, bosonic ground vector, 
#[#set math.equation(numbering: n => "(4.2)")
 $ 1 / V ⟨sum_(i = 1)^N W_(R \, i)⟩ & = frac(8, 3 sqrt(pi)) alpha^(3 \/ 2) + o \( 1 \) \,\
1 / V ⟨sum_(i = 1)^N W_(d \, i)⟩ & lt.eq epsilon.alt_j + o_j \( 1 \) \, #h(2em) epsilon.alt_j arrow.r 0 quad \( j arrow.r oo \) . $ <en:R-occupation>]

 Here the thermodynamic limit is taken first, at fixed dilution; the remainders then tend to zero as $D arrow.r oo$, and $o_j \( 1 \)$ has this meaning with $j$ fixed. The bounds are uniform over the indicated ground vectors and along every density-convergent thermodynamic sequence. A sufficiently large volume threshold may depend on the dilution and on $j$.]
] <en:energy-outputs>

We prove first the corresponding truncated count estimates for arbitrary ground vectors. Proposition 6 will remove the truncation for nonnegative ground vectors at the end of the proof. The occupation estimates themselves do not use positivity.

=== 4.1 Comparing the upper and lower energies <comparing-the-upper-and-lower-energies>

We now sum the local estimates. This step records which positive terms survive the comparison with (3.2); the following subsections use them for the count and occupation observables.

On each middle particle-number sector, use the three localization factors in (3.18). We call the first and third pieces low pieces, and the second a high piece. Sums over pieces in what follows include sector probabilities, spectator integration, and boxes. We use the notation $sum_(upright("low"))$ and $sum_(upright("high"))$ for these sums.

#thm([Lemma 4.2.])[
  (The energy surplus).  #emph[For $E asymp Q = D^theta$, $theta = u$ or $w$, the following quantities have sum at most $C V Q^(- 1 \/ 5)$:]
  + #emph[the box-count penalty 
$ sum_b D v_b thin frak(h) (frac(n_b, D v_b) - 1) quad upright("in expectation") \; $

]
  + #emph[on middle-sector high pieces, the expectations of 
$ sum_(p eq.not 0) min \( p^2 \, 1 \) a_p^(*) a_p + D sum_(A in cal(C)_d \, med A subset b) \| A \| frak(h) \( q_A - 1 \) \; $

]
  + #emph[on low pieces, the expectations of $E^(- 2) \( n_(+) + K_H n_H \)$ and the quantities $cal(B) \( psi \)$;]
  + #emph[on sectors outside (3.5), their total $\( n_b + D v_b \)$-weighted squared norms.]
  #emph[The first quantity is evaluated on the original vector. The other quantities are evaluated on the indicated localized restrictions.]
] <en:surplus>

#proof[
  The preliminary rough bound and (3.2) give
  #[#set math.equation(numbering: n => "(4.3)")
   $ 1 / V sum_b chevron.l n_(+) chevron.r lt.eq C Q^2 D^(1 - c_(upright(r))) $ <en:preliminary-number>]
  on the middle sectors, where $c_(upright(r)) > 0$ is the exponent in Lemma 3.1. Lemma 3.2 therefore bounds the sum of localization errors by $C V Q^(- 1)$. In particular this localization does not consume a fixed fraction of the leading energy.
  On a high piece, the support condition $n_L gt.eq M \/ 8$ gives
  $ ⟨sum_p min \( p^2 \, 1 \) a_p^(*) a_p⟩ gt.eq c M E^(- 2) parallel psi parallel^2 . $
  Since $M E^(- 2) asymp D Q^(- 399)$, this pays both the rough error $C v_b D^(1 - c_(upright(r)))$ and an $O \( v_b \)$ LHY scalar, with a fraction tending to zero, provided $D^(c_(upright(r))) Q^(- 402) arrow.r oo$. The remaining rough bound then retains a fixed fraction of the kinetic and microcell penalties. Its leading quadratic scalar, compared with (3.3), also retains $c D v_b \( n_b \/ \( D v_b \) - 1 \)^2$. The inequality $frak(h) \( s + t \) lt.eq C \( frak(h) \( s \) + frak(h) \( t \) \)$ allows a fraction of this scalar remainder to recenter the microcell penalty from $n_b \/ v_b$ to $D$.
  On a low piece use Lemma 10. The convexity of $e_r$ and the bound $e''_r \( x \) gt.eq 8 pi r$ imply
  #[#set math.equation(numbering: n => "(4.4)")
   $ v_b e_r \( n_b \/ v_b \) - t_b \( n_b \) gt.eq 4 pi alpha D v_b (frac(n_b, D v_b) - 1)^2 . $ <en:scalar-convexity>]
  For $n_b < D v_b \/ 2$, the rough bound itself has a positive difference of order $D v_b$ from the tangent; its $D^(1 - c_(upright(r))) v_b$ error is negligible. For $n_b > 6 D v_b$, divide the labels into $k = floor.l n_b \/ \( 3 D v_b \) floor.r gt.eq 2$ batches of nearly equal size. Their densities lie between $3 D - o \( D \)$ and $4.5 D + o \( D \)$; hence they lie in $\[ 2.5 D \, 5 D \]$ for large $D$. Dropping interactions between batches and applying the rough bound to each batch gives a linear lower bound whose slope exceeds $e'_r \( D \)$ by a fixed positive constant. Thus it retains $c n_b$ beyond the tangent. Finitely many rounding adjustments are harmless for large $D v_b$. On these two classes, $n_b + D v_b$ also controls every bounded count deviation and the number of particles to which a bounded one-body observable can apply.
  The squared localization factors sum to one, so the scalar tangent sums to $V e_r \( D \)$. The same identity preserves the box-count penalty, because box number commutes with all localizations. Summing the bounds just obtained and subtracting (3.2) proves the assertion, with $Q^(- 1 \/ 5)$ in place of the smaller sum of error powers. The conditions $u lt.double c_(*)$ and $u lt.double c_(upright(r))$ ensure that each power error is absorbed. ◻
]

=== 4.2 Second and fourth moments of cell counts <second-and-fourth-moments-of-cell-counts>

Apply Lemma 14 at scale $E = R$. On every fixed bounded interval of relative counts, $frak(h) \( t \)$ is comparable with $t^2$. Consequently

#[#set math.equation(numbering: n => "(4.5)")
 $ frac(1, \| cal(C)_R \|) sum_(A in cal(C)_R) bb(E) min { \( q_A - 1 \)^2 \, T^2 } lt.eq C_T D^(- 1) R^(- 1 \/ 5) . $ <en:R-truncated>]

Here and below a clipping threshold may be replaced by any fixed bounded truncation with the same local power behavior.

The fourth moment on a $d$-cell needs more than this scalar convexity. We return to $E = B$ and use the small number of excitations in a low piece. Let $P$ be the projection onto the box constant and let

$ X = n_A - n \| A \| \/ v_b = sum_(i = 1)^n #scale(x: 120%, y: 120%)[\(] upright(bold(1))_A \( x_i \) - \| A \| \/ v_b #scale(x: 120%, y: 120%)[\)] . $

The one-body operator inside this sum has norm at most one and vanishing $P$–$P$ entry.

#thm([Lemma 4.3.])[
  (A fourth moment from excitations).  #emph[On the $n$-particle space, for every vector $xi$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ parallel X^2 xi parallel^2 lt.eq C n^2 chevron.l xi \, \( n_(+) + 2 \)^2 xi chevron.r . $ <en:fourth-block-bound>]

]
] <en:fourth-block>

#proof[
  Decompose the one-body operator into its $P$–$\( 1 - P \)$, $\( 1 - P \)$–$P$, and $\( 1 - P \)$–$\( 1 - P \)$ blocks. Their second quantizations change the excitation number by $1 \, - 1 \, 0$, respectively. Between the $k$ and $k + 1$ sectors the first block has norm at most $sqrt(\( n - k \) \( k + 1 \))$; the diagonal block has norm at most $k$. Thus $X$ is tridiagonal with block norms bounded by $C \[ sqrt(n \( k + 1 \)) + k \]$. The blocks of $X^2$ have bandwidth two and norm at most $C n \( k + 2 \)$, since $k lt.eq n$. Squaring, summing the five possible output blocks, and using Cauchy–Schwarz for their bounded overlaps proves (4.6). ◻
]

On a low piece, $n_(+)^2 lt.eq C \( M n_(+) + n n_H \)$ and $n lt.eq C D Q^3$. Lemma 14 gives

#[#set math.equation(numbering: n => "(4.7)")
 $ 1 / V sum_(upright("low")) chevron.l n_(+) chevron.r lt.eq C Q^(2 - 1 \/ 5) \, #h(2em) 1 / V sum_(upright("low")) chevron.l n_H chevron.r lt.eq C Q^(2 - 100 - 1 \/ 5) . $ <en:gap-number-bounds>]

Divide (4.6) by $\( D \| A \| \)^4$, average the $O_j \( Q^3 \)$ microcells in each box, and then average the boxes. Since $M asymp D Q^(- 397)$, the result is at most

#[#set math.equation(numbering: n => "(4.8)")
 $ C_j (D^(- 1) Q^(- 386 - 1 \/ 5) + D^(- 1) Q^(- 86 - 1 \/ 5) + D^(- 2) Q^6) . $ <en:microcell-powers>]

For example, the common prefactor before the summed excitation moments is $C_j D^(- 2) Q^9 \/ V$; this verifies explicitly that averaging the microcells introduces no missing factor of box volume. Centering at $D$ rather than $n \/ v_b$ uses the scalar box-count penalty: on the middle interval, a bounded fourth power of the relative box deviation is bounded by a constant times its square. On high pieces, the truncated fourth power is bounded by $C frak(h) \( q_A - 1 \)$, which is retained in Lemma 14. The same is true on the outlying particle-number sectors by their norm penalty.

Finally, for each middle-sector restriction, $psi = f^2 psi + h^2 psi$. Applied to the square root of a nonnegative truncated count observable, the triangle inequality therefore bounds its expectation in $psi$ by twice the sum for these two pieces. The expectation on the additional $sqrt(2) f h$ piece used in the energy localization is nonnegative and need not be included in this bound. This establishes the truncated version of (4.1); (4.8) is smaller than $D^(- 1) Q^(- 1 \/ 6)$ for sufficiently small $u$.

For nonnegative ground vectors, Proposition 6 gives

#[#set math.equation(numbering: n => "(4.9)")
 $ bb(P) \( n_C > C_0 D \) lt.eq C e^(- c D) $ <en:count-tail-use>]

for every unit cell $C$ and a sufficiently large fixed $C_0$. Hard-core packing bounds all counts in a bounded cell by a fixed power of $D$. An $R$-cell contains only polynomially many unit cells; if none exceeds $C_0 D$, its relative count is bounded by $C_0$. A $d$-cell lies in one unit cell and has relative count at most $C_0 d^(- 3)$ on that event. Choose these fixed clipping thresholds, depending on $j$ in the second case. The omitted second and fourth moments are exponentially small times a polynomial in $D$. This removes the truncations and proves (4.1)–(4.1), with the slightly weakened exponents displayed there.

=== 4.3 Uniform local one-body covariance <uniform-local-one-body-covariance>

We now extract the one-body information retained by the energy comparison. On a box $b$ of side $B$, let $W$ be the restriction of $W_R$, and use local coordinates $\[ 0 \, B \)^3$. Write $v_b = B^3$ and let $u_p$ be the real Neumann cosine basis, $p in \( pi \/ B \) bb(N)_0^3$, defined in Section 3. Define, for $p eq.not 0$,

#[#set math.equation(numbering: n => "(4.10)")
 $ F_alpha \( p \) = 1 / 2 {frac(\| p \|^2 + 8 pi alpha, sqrt(\| p \|^4 + 16 pi alpha \| p \|^2)) - 1} . $ <en:limiting-V>]

The function is integrable on $bb(R)^3$: it is $O \( \| p \|^(- 1) \)$ near zero and $O \( \| p \|^(- 4) \)$ at infinity, uniformly for $alpha in I_alpha$.

#thm([Proposition 4.4.])[
  (Uniform local covariance).  #emph[Use the nested partitions and limiting convention of Section 2, with the exponents chosen above. Let $A = xor.big_(b in cal(C)_B) A_b$, where the one-particle operators $A_b$ on $L^2 \( b \)$ are identical in local coordinates and satisfy $0 lt.eq A_b lt.eq W$. Their cosine matrices may be complex Hermitian. For every normalized bosonic ground vector, 
#[#set math.equation(numbering: n => "(4.11)")
 $ 1 / V chevron.l upright(d) Gamma \( A \) chevron.r = 1 / v_b sum_(p eq.not 0) \( A_b \)_(p p) F_alpha \( p \) + o \( 1 \) \, #h(2em) \( A_b \)_(p p) = chevron.l u_p \, A_b u_p chevron.r . $ <mom:local-covariance-formula>]

 The error is uniform in the ground vector and in all the indicated operators, which may depend on the scales. The same formula and uniformity hold when $A_b = W C_b W$ and $C_b$ is any complex contraction, identical in local coordinates. Both assertions hold uniformly for simultaneous translates of the nested partitions.]
] <mom:local-covariance>

The proof has three steps. A matrix estimate converts the quasiparticle energy of each coherent projection into an error for $A_b$. The energy surplus then concentrates a box-volume weighted coherent measure at density $D$. Finally this concentration identifies the trace in (4.11) uniformly in $A_b$.

For $l = R \, d$, cellwise Neumann Poincare gives, on a $B$-box,

#[#set math.equation(numbering: n => "(4.12)")
 $ 0 lt.eq W_l lt.eq 1 \, #h(2em) W_l lt.eq C l^2 \( - Delta_(upright("Neu")) \) . $ <en:weight-bounds>]

These operators annihilate the box constant. In particular every $0 lt.eq A_b lt.eq W$ does so. No commutation with the Neumann Laplacian is assumed.

#thm([Lemma 4.5.])[
  (A matrix observable comparison).  #emph[Let $E = B$, $n$ satisfy (3.5), and $\| z \|^2 lt.eq 2 n$. For $0 lt.eq A_b lt.eq W$ and an excitation vector $xi$ in the form domain of $n_(+)$, put 
$ cal(Q)_z \( xi \) = sum_(p eq.not 0) tilde(D)_p \( z \) parallel b_p \( z \) xi parallel^2 \, #h(2em) T_A \( z \) = sum_(p eq.not 0) \( A_b \)_(p p) \| V_p \( z \) \|^2 \, $

 where $a_p = U_p b_p + V_p b_p^(*)$ is the inverse of (3.25), with the phase of $z$ restored. Then $0 lt.eq T_A \( z \) lt.eq C v_b$ and 
#[#set math.equation(numbering: n => "(4.13)")
 $ lr(|chevron.l xi \, upright(d) Gamma \( A_b \) xi chevron.r - T_A \( z \) parallel xi parallel^2|) & lt.eq C \( 1 + R^2 \) cal(Q)_z \( xi \)\
 & quad + C { \( 1 + R^2 \) cal(Q)_z \( xi \) T_A \( z \) parallel xi parallel^2 }^(1 \/ 2) . $ <en:observable-bound>]

 The constant is independent of $A_b$.]
] <en:observable>

#proof[
  The inverse coefficients satisfy
  #[#set math.equation(numbering: n => "(4.14)")
   $ \| U_p \|^2 = 1 + \| V_p \|^2 \, #h(2em) \| V_p \|^2 = 1 / 2 {frac(tau \( p \) + rho_z hat(g) \( p \), D_p \( z \)) - 1} lt.eq C min \( \| p \|^(- 1) \, \| p \|^(- 4) \) . $ <en:UV-bounds>]
  Rationalizing the expression proves the bound, using $rho_z \| hat(g) \( p \) \| lt.eq C$, $tau \( p \) asymp p^2$, and positivity of $hat(g)$ near zero. On $cal(P)_L$, $p^2 \| U_p \|^2 lt.eq C D_p \( z \)$; on its complement $U_p$ is bounded and $tilde(D)_p \( z \) gt.eq c K_H \/ B^2$. The same inequalities hold with $\| V_p \|$ in place of $\| U_p \|$.
  Write $sans(U) = "diag" \( U_p \)$, $sans(V) = "diag" \( V_p \)$, and $sans(D) = "diag" \( tilde(D)_p \)$ on the nonconstant cosine modes. Split an input into its low and high frequency parts before estimating its image under $A_b^(1 \/ 2)$. On the low part use $A_b lt.eq W lt.eq C R^2 "diag" \( p^2 \)$; on the high part use $A_b lt.eq 1$ and $K_H \/ B^2 gt.double 1$. The squared norm of a sum is at most twice the sum of squared norms, so the coefficient bounds give
  #[#set math.equation(numbering: n => "(4.15)")
   $ 0 lt.eq sans(U)^(*) A_b sans(U) lt.eq C \( 1 + R^2 \) sans(D) \, #h(2em) 0 lt.eq sans(V)^(*) A_b sans(V) lt.eq C \( 1 + R^2 \) sans(D) . $ <en:weighted-matrix-bound>]
  The split is made before applying $A_b^(1 \/ 2)$ because $A_b$ need not preserve either frequency band.
  Take inner products linear in the second variable. For a finite set of modes the observable is the squared norm of $A_b^(1 \/ 2) \( a_p xi \)_p$. Decompose this column using $a_p = U_p b_p + V_p b_p^(*)$. The annihilation column has squared norm at most $q = C \( 1 + R^2 \) cal(Q)_z \( xi \)$ by (4.15). For the creation column put $sans(M) = sans(V)^(*) A_b sans(V)$. The canonical commutation relations give the exact identity
  #[#set math.equation(numbering: n => "(4.16)")
   $ sum_(p \, q) sans(M)_(p q) chevron.l b_p^(*) xi \, b_q^(*) xi chevron.r & = "Tr" \( sans(M) \) parallel xi parallel^2 + sum_(p \, q) \( sans(M)^(sans(T)) \)_(p q) chevron.l b_p xi \, b_q xi chevron.r . $ <en:transpose-identity>]
  The second matrix is the transpose, including when $A_b$ is complex. Since $sans(M)$ is Hermitian, $sans(M)^(sans(T)) = overline(sans(M))$, and complex conjugation preserves its order bounds in (4.15): the dominating matrix $sans(D)$ is real diagonal. The creation column therefore has squared norm $t + r$, where $t = T_A \( z \) parallel xi parallel^2$ and $0 lt.eq r lt.eq q$. Cauchy–Schwarz for the mixed columns gives
  $ lr(|chevron.l xi \, upright(d) Gamma \( A_b \) xi chevron.r - t|) lt.eq 2 q + 2 sqrt(q \( t + q \)) lt.eq 4 q + 2 sqrt(q t) . $
  To bound the trace uniformly, set $G \( p \) = min \( \| p \|^(- 1) \, \| p \|^(- 4) \)$. A nonempty lattice shell of upper radius $t$ contains at most $C B^3 t^3$ nonzero cosine frequencies; nonemptiness implies $B t gt.eq pi$. Dyadic summation consequently gives
  #[#set math.equation(numbering: n => "(4.17)")
   $ 1 / v_b sum_(0 < \| p \| lt.eq delta) G \( p \) lt.eq C delta^2 \, #h(2em) 1 / v_b sum_(\| p \| gt.eq J) G \( p \) lt.eq C \/ J quad \( 0 < delta < 1 < J \) \, $ <en:lattice-tails>]
  and $v_b^(- 1) sum_(p eq.not 0) G \( p \) lt.eq C$. These estimates include coordinate-plane and axial frequencies. Since $0 lt.eq \( A_b \)_(p p) lt.eq 1$, we obtain $T_A \( z \) lt.eq C v_b$. The preceding mixed-column estimate proves (4.13).
  The finite-mode computation passes to the full excitation space as follows. At fixed parameters $sans(U) \, sans(V)$ are bounded and $sum_p \| V_p \|^2 < oo$. The inverse relations and finite $chevron.l xi \, n_(+) xi chevron.r$ imply $sum_p parallel b_p xi parallel^2 < oo$. The creation column is square summable as well, since
  $ sum_p \| V_p \|^2 parallel b_p^(*) xi parallel^2 = sum_p \| V_p \|^2 parallel b_p xi parallel^2 + (sum_p \| V_p \|^2) parallel xi parallel^2 < oo . $
  Finite coordinate projections commute with $sans(U) \, sans(V)$ and $sans(D)$, so the compressed matrices inherit (4.15). Norm convergence of the columns and convergence of the scalar traces justify the limit. If $cal(Q)_z \( xi \) = oo$, the asserted bound is automatic. ◻
]

#proof[
  Apply the sector restrictions and excitation cutoffs used in Lemma 14, now with $E = B$ and $Q = D^u$. A box-wise operator evaluates by summing over these restrictions. For each fixed box the original restriction norms, summed over all assignments and integrated over spectators, have total square one. Thus the squared cutoffs preserve both that normalization and the identity $sum_b chevron.l n_b chevron.r = N$.
  #emph[Reduction to coherent traces.] On sectors outside (3.5), use $upright(d) Gamma \( A_b \) lt.eq n$ and the norm penalty in Lemma 14; their contribution is $o \( V \)$. The total one-body localization error on the middle sectors, divided by $V$, is at most
  $ C D M^(- 2) lt.eq C D^(- 1) Q^794 = o \( 1 \) . $
  By splitting the input at $\| p \| = 1$ before applying $W$, (4.12) also gives
  $ A_b lt.eq W lt.eq C \( 1 + R^2 \) min \( - Delta_(upright("Neu")) \, 1 \) . $
  The high pieces therefore contribute at most $C V \( 1 + R^2 \) Q^(- 1 \/ 5) = o \( V \)$.
  Let $phi.alt$ be any low piece and $phi.alt_z$ its zero-mode coherent projection. Since $A_b$ annihilates the box constant, coherent resolution leaves its expectation unchanged. The part with $\| z \|^2 > 2 n$ is negligible by (3.27) and $upright(d) Gamma \( A_b \) lt.eq n$ on its excitation sectors. Apply Lemma 17 on the remaining region. The normalization above gives $sum_(upright("low")) v_b parallel phi.alt parallel^2 lt.eq V$. Cauchy–Schwarz in the piece, spectator, and $z$ variables then bounds the total error per volume by
  #[#set math.equation(numbering: n => "(4.18)")
   $ C \( 1 + R^2 \) Q^(- 1 \/ 5) + C { \( 1 + R^2 \) Q^(- 1 \/ 5) }^(1 \/ 2) = o \( 1 \) . $ <en:occupation-error>]
  Here $2 w < u \/ 5$, as follows from our choice of exponents.
  Define a measure $nu$ on the low-piece and coherent variables by
  #[#set math.equation(numbering: n => "(4.19)")
   $ integral f thin upright(d) nu = 1 / V sum_(upright("low")) v_b integral_(\| z \|^2 lt.eq 2 n) f \( phi.alt \, z \) parallel phi.alt_z parallel^2 frac(upright(d)^2 z, pi) . $ <en:coherent-measure>]
  As throughout the piece sums, spectator integration is included in this notation. The measure is positive and has mass at most one. Our reduction reads
  #[#set math.equation(numbering: n => "(4.20)")
   $ 1 / V chevron.l upright(d) Gamma \( A \) chevron.r = integral frac(T_A \( z \), v_b) thin upright(d) nu + o \( 1 \) . $ <en:coherent-trace-reduction>]
  #emph[Mass and density of the coherent measure.] The omitted outlying sectors have volume weight at most $C D^(- 1) Q^(- 1 \/ 5)$. On a middle-sector high piece, $n_L gt.eq M \/ 8$ implies $upright(d) Gamma \( min \( p^2 \, 1 \) \) gt.eq c M \/ B^2$; hence its total omitted volume weight is bounded by
  #[#set math.equation(numbering: n => "(4.21)")
   $ 1 / V sum_(upright("high")) v_b parallel phi.alt parallel^2 lt.eq C frac(v_b B^2, M) Q^(- 1 \/ 5) lt.eq C D^(- 1) Q^401.8 = o \( 1 \) . $ <en:high-volume-loss>]
  The coherent tail removes exponentially small weight. Therefore $nu$ has mass $1 - o \( 1 \)$.
  Here is an explicit form of its density concentration. Decompose a fixed $n$-particle piece into excitation-number components $phi.alt^(\( m \))$, $0 lt.eq m lt.eq n$. Its zero-mode number on that component is $n - m$. Before restricting to $\| z \|^2 lt.eq 2 n$, orthogonality of the excitation sectors shows that the radial coherent law of $s = \| z \|^2$ is the mixture of gamma densities
  $ e^(- s) frac(s^(n - m), \( n - m \) !) thin upright(d) s $
  weighted by $parallel phi.alt^(\( m \)) parallel^2$. Conditionally on $m$, the mean is $n - m + 1$, the variance is $n - m + 1$, and $bb(E) \| s - \( n - m \) \| lt.eq 1 + sqrt(n + 1)$. On the middle range the box penalty controls the squared relative number deviation, so
  $ integral lr(|frac(n, D v_b) - 1|)^2 upright(d) nu lt.eq C D^(- 1) Q^(- 1 \/ 5) . $
  Before the $z$ cut, the box-volume weighted integral of $m \/ \( D v_b \)$ is
  $ frac(1, D V) sum_(upright("low")) chevron.l phi.alt \, n_(+) phi.alt chevron.r lt.eq C D^(- 1) B^2 Q^(- 1 \/ 5) . $
  These nonnegative bounds remain valid after the cut. Combining them with the conditional gamma estimate yields
  #[#set math.equation(numbering: n => "(4.22)")
   $ integral lr(|rho_z / D - 1|) upright(d) nu lt.eq C (D^(- 1 \/ 2) Q^(- 1 \/ 10) + D^(- 1) B^2 Q^(- 1 \/ 5) + \( D v_b \)^(- 1 \/ 2)) = o \( 1 \) . $ <en:coherent-density-concentration>]
  In particular every fixed deviation of $rho_z \/ D$ from one has vanishing $nu$-weight.
  #emph[Identification of the covariance.] On a fixed annulus $0 < delta lt.eq \| p \| lt.eq J$, all modes eventually belong to $cal(P)_L$, so $tau \( p \) - p^2 = - pi \/ \( 2 B^2 \)$ there. The support radius $r$ and (3.4) also imply $D hat(g) \( p \) = 8 pi alpha + o \( 1 \)$ uniformly on bounded momentum sets. The expression in (4.14) is continuous in these parameters on the annulus when $rho_z \/ D$ is close to one, with a denominator bounded away from zero. By (4.22),
  $ integral sup_(delta lt.eq \| p \| lt.eq J) \| \| V_p \( z \) \|^2 - F_alpha \( p \) #scale(x: 120%, y: 120%)[\|] thin upright(d) nu = o \( 1 \) . $
  On the exceptional density set use the uniform majorant in (4.14). The same majorant bounds $F_alpha$, so (4.17) removes the small and large momentum regions, uniformly in $A_b$. Since $\| \( A_b \)_(p p) \| lt.eq 1$, the annular lattice count divided by $v_b$ is bounded, and the matrices are identical in local coordinates, (4.20) becomes (4.11). All bounds used only $0 lt.eq A_b lt.eq W$ and are therefore uniform in this class.
  For a complex contraction $C_b$, write $C_b = S_b + i T_b$, with $S_b = \( C_b + C_b^(*) \) \/ 2$ and $T_b = \( C_b - C_b^(*) \) \/ \( 2 i \)$ Hermitian contractions. For either $J_b = S_b \, T_b$,
  $ W J_b W = 2 W frac(1 + J_b, 2) W - W \, #h(2em) 0 lt.eq W frac(1 + J_b, 2) W lt.eq W . $
  A fixed linear combination of the positive-operator identities proves the assertion for $W C_b W$, preserving uniformity. Finally, simultaneous translation of the particles is unitary and preserves the ground space. Applying the uniform estimate to the translated vector proves the assertion for every translated nested grid. ◻
]

=== 4.4 The two projection occupations <the-two-projection-occupations>

It remains to obtain (4.2) and (4.2). The $d$-cells refine the $R$-cells, so $P_R lt.eq P_d$ and $0 lt.eq W_d lt.eq W_R$. Both $W_R$ and $W_d$ thus satisfy Proposition 16 on the $B$-boxes. For $W_R$, averaging a cosine over an $R$-cell gives $parallel P_R u_p parallel lt.eq C \/ \( delta R \)$ uniformly on every annulus $delta lt.eq \| p \| lt.eq J$. Indeed some component has $\| p_i \| gt.eq delta \/ sqrt(3)$, and the cosine mean in that coordinate is bounded by $C \/ \( R \| p_i \| \)$. Hence $\( W_R \)_(p p) arrow.r 1$ on annuli. The lattice tails in (4.17) and Neumann Riemann summation give

$ 1 / V chevron.l upright(d) Gamma \( W_R \) chevron.r = 1 / pi^3 integral_(\[ 0 \, oo \)^3) F_alpha \( p \) thin upright(d) p + o \( 1 \) = integral_(bb(R)^3) F_alpha \( p \) frac(upright(d) p, \( 2 pi \)^3) + o \( 1 \) . $

The first density is the cosine lattice density; the second equality uses evenness in each coordinate. The full integral is

#[#set math.equation(numbering: n => "(4.23)")
 $ integral_(bb(R)^3) F_alpha \( p \) frac(upright(d) p, \( 2 pi \)^3) & = frac(\( 8 pi alpha \)^(3 \/ 2), 4 pi^2) integral_0^oo t^2 {frac(t^2 + 1, t sqrt(t^2 + 2)) - 1} upright(d) t\
 & = frac(8 alpha^(3 \/ 2), 3 sqrt(pi)) . $ <en:integral>]

The one-dimensional integral equals $sqrt(2) \/ 3$, by integrating $t \( t^2 + 1 \) \/ sqrt(t^2 + 2) - t^2$ and taking endpoint limits.

For $W_d$, (4.12) gives $\( W_d \)_(p p) lt.eq min \( 1 \, C d^2 p^2 \)$. The covariance proposition and the same Riemann sums therefore bound its occupation density by

$ sup_(alpha in I_alpha) integral_(bb(R)^3) min \( 1 \, C d^2 p^2 \) F_alpha \( p \) frac(upright(d) p, \( 2 pi \)^3) + o_j \( 1 \) . $

The integral tends to zero as $d = 1 \/ j arrow.r 0$ by the common integrable majorant. Denoting it by $epsilon.alt_j$ proves (4.2)–(4.2) and completes Proposition 13.

== 5 Short trajectories and local certificates <lp:section>

The energy estimates control occupations within cells. We now prepare the comparison of deletion measures needed to control variation between cells. This section constructs paths that can be resampled while their endpoints remain fixed. The required conclusions are quantitative: the excluded mass must be smaller than $D^(- 1)$, and every local insertion must have a probability bounded away from zero, uniformly in the volume. We prove these statements before using the paths to compare particle-deleted configuration measures. The stationary path representation and removal argument come from [24] Section 4. The short time scale and the finer spatial certificates below require additional estimates.

Throughout this section $Phi gt.eq 0$ is a normalized bosonic ground function, $mu \( upright(d) X \) = Phi \( X \)^2 upright(d) X$, and $E_N$ is its eigenvalue. We use the scaled torus of side $K$, density $D = N \/ K^3$, and exclusion distance $r = alpha \/ D$, with $alpha$ in the fixed compact window already chosen. Fix a sufficiently small number $x > 0$, to be chosen after the exponents in the energy localization, and set

#[#set math.equation(numbering: n => "(5.1)")
 $ t = frac(1, x log D) \, #h(2em) f_0 = D^(- x) \, #h(2em) s = D^(- 4 \/ 5) \, #h(2em) b = C_1 / sqrt(x) \, #h(2em) L_0 = C_2 sqrt(log D) . $ <lp:scales>]

The numerical constants are chosen in the order $C_1$, then $C_2$. Constants may depend on the fixed $x$ and on fixed neighborhood sizes, but never on $K$, $D$, or $Phi$. A factor $D^(o_x \( 1 \))$ means a bound $C \( x \) D^(zeta \( x \))$ with $zeta \( x \) arrow.r 0$ as $x arrow.b 0$. Such factors will occur only a bounded number of times in a local comparison; this notation supplies no allowance per step of a long route.

=== 5.1 The stationary law and deletion of paths <the-stationary-law-and-deletion-of-paths>

Let $nu_(N \, T)$ be the measure on $N$ independent torus Brownian motions of generator $Delta$ on $\[ - T \, T \]$, with Lebesgue initial measure. Define

#[#set math.equation(numbering: n => "(5.2)")
 $ upright(d) cal(R)_T \( omega \) = e^(2 T E_N) Phi \( omega \( - T \) \) Phi \( omega \( T \) \) upright(bold(1))_({ d_K \( omega_i \( q \) \, omega_j \( q \) \) > r med forall q \, med i < j }) upright(d) nu_(N \, T) \( omega \) . $ <lp:path-law>]

Here $d_K$ denotes torus distance. Every time marginal of $cal(R)_T$ is $mu$; restriction to a shorter interval gives the same formula with its own endpoints. Conditional on the endpoint configurations, the law is the product torus-bridge law conditioned on strict mutual avoidance. Specifying each winding gives the corresponding Euclidean bridges. These facts follow by splitting the killed heat semigroup and using $e^(- q H_N) Phi = e^(- q E_N) Phi$; they are the stationary-path lemma of [24] Lemma 4.1. In particular the law on $\[ - t \, t \]$ is the restriction of the law on $\[ - 1 \, 1 \]$ once $D$ is sufficiently large.

We will repeatedly delete the interactions involving a few specified labels. The useful version allows different weights on these labels. If $J$ is a set of $m$ distinct labels and $H_i$ are nonnegative single-path functionals invariant under time reversal, then

#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E)_(cal(R)_T) product_(i in J) H_i \( omega_i \) lt.eq e^(C T alpha m) integral product_(i in J) bb(E)_(upright("free"))^(Y_i) H_i thin mu \( upright(d) Y \) \, #h(2em) 0 < T lt.eq 1 . $ <lp:deletion>]

Here $Y$ is the initial configuration of those free paths, whose duration is $2 T$. For completeness, after dropping the selected interactions, the remaining killed semigroup is bounded by $e^(- 2 T E_(N - m))$ between the corresponding slices of $Phi$. If $a \( y \)$ is the $L^2$ norm of such a slice, its endpoint factor is $a \( y \) a \( z \)$. The selected weighted endpoint kernel is symmetric, so $a \( y \) a \( z \) lt.eq \( a \( y \)^2 + a \( z \)^2 \) \/ 2$ replaces this factor by $a \( y \)^2$ after integration. The removal bound in Proposition 4, $E_N - E_(N - m) lt.eq C alpha m$, then proves (5.3). Truncation proves the assertion for unbounded weights. This is the proof of the deletion lemma in [24] Lemma 4.2; using distinct reversal-invariant weights does not change its symmetric-kernel argument. A weight that is not reversal invariant can always be bounded by its sum with its time reversal.

We first use the longer slab to estimate close endpoint pairs. For any fixed bounded region $U$ and any $q in \[ - t \, t \]$,

#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) sum_(i eq.not k) upright(bold(1))_({ omega_i \( q \) in U \, med d_K \( omega_i \( q \) \, omega_k \( q \) \) lt.eq s }) lt.eq C_U D^2 s^3 . $ <lp:close-pairs>]

To prove this, cover $U$ by $O_U \( s^(- 3) \)$ cubes of side $s$ and enlarge each cube by a fixed factor. A pair counted on the left lies in one of the enlarged cubes. In the free law on $\[ - 1 \, 1 \]$, observation at $q in \[ - t \, t \]$ is uniformly separated from either slab endpoint. The heat-kernel estimate for a cube $Q$ therefore gives

$ bb(P)_(upright("free"))^y { omega \( q \) in Q } lt.eq C s^3 e^(- 2 d_K \( y \, v_Q \)) \, $

where $v_Q$ is a nearby unit-cell center; changing its position by a bounded amount changes only $C$. Apply (5.3) to each pair, and sum the resulting products. The count moment-generating bound in Proposition 6 implies $bb(E) \( sum_i e^(- d_K \( Y_i \, v_Q \)) \)^2 lt.eq C D^2$. Thus one cube costs $C D^2 s^6$, and the covering proves (5.4). The estimate holds uniformly under translations of $U$ and does not assume a translation-invariant ground function.

=== 5.2 Exposure and the meaning of a certificate <exposure-and-the-meaning-of-a-certificate>

Write $Y_i = omega_i \( - t \)$, $X_i = omega_i \( 0 \)$, and $Z_i = omega_i \( t \)$. Divide each half slab into equal intervals of length $Delta in \[ r^2 \/ 2 \, r^2 \]$. A path satisfies the increment cutoff if its Euclidean lift obeys

#[#set math.equation(numbering: n => "(5.5)")
 $ \| tilde(omega) \( q \) - tilde(omega) \( q' \) \| lt.eq L_0 sqrt(\| q - q' \| + r^2) #h(2em) \( q \, q' in \[ - t \, t \] \) . $ <lp:cutoffs>]

The lift increment is independent of the initial representative. When $Y_i \, Z_i$ have near representatives at distance at most $b$, let $m_i$ be their Euclidean mean. For sufficiently large $K$ the near displacement is unique. Call label $i$ eligible if both of its endpoints are more than $s$ from every other corresponding endpoint, its near endpoint displacement is at most $b$, and its path follows that winding, satisfies (5.5), and stays within $20 b$ of $m_i$.

Independently assign each label a Bernoulli flag of mean $f_0$. Let $cal(I)$ be the set of flagged eligible labels. Expose the endpoints, flags, membership in $cal(I)$, and the full paths of all labels outside $cal(I)$. The latter are called frozen paths; the exposed variables collectively form the datum $cal(D)$. An interior label at a site is a member of $cal(I)$ whose initial endpoint is in that unit cell and whose endpoint displacement is at most one. Tags used at the ends of comparisons may have displacement up to $b$; their site is the unit cell containing $m_i$.

Let $B_i$ denote the plain Euclidean bridge probability from $Y_i$ to $Z_i$ in time $2 t$ along the selected winding. For a fixed datum put $cal(A)_i$ for the event consisting of label $i$’s individual cutoffs and avoidance of all frozen paths. The exact conditional law of the unexposed paths is

#[#set math.equation(numbering: n => "(5.6)")
 $ lambda \( upright(d) omega_(cal(I)) \) = 1 / Z_(cal(I)) product_(i in cal(I)) upright(bold(1))_(cal(A)_i) \( omega_i \) product_(i < k\
i \, k in cal(I)) upright(bold(1))_({ d_K \( omega_i \( q \) \, omega_k \( q \) \) > r med forall q }) product_(i in cal(I)) B_i \( upright(d) omega_i \) . $ <lp:conditional-law>]

This identity holds for almost every sampled datum, and then $Z_(cal(I)) > 0$. Indeed, conditional on endpoints and flags, eligibility of each unexposed label is an individual test on its own trajectory. The tests for the other labels become fixed when their paths are exposed. Confinement chooses a single winding; its torus heat-kernel factor is constant on the conditional fiber and cancels. Disintegration of (5.2) gives (5.6), exactly as in [24] Proposition 6.2. No condition involving the collection of latent trajectories is added to this law.

Choose a neighborhood radius $R_(*) = 1000 b$, enlarged by fixed factors when necessary to contain all trials under discussion. For a mesh interval $J$ write $A_J \( omega \) = r^(- 1) "diam" tilde(omega) \( J \)$. We shall control collisions with unexposed paths by their endpoint counts, and collisions with frozen paths by their counts and oscillations at mesh times. The following certificate records precisely this information. Every test uses exposed data only, so it leaves (5.6) unchanged on each conditional fiber.

#prodef([Definition 5.1.])[
  (Good site).  A unit-cell site is good if all of the following conditions hold.
  + It has at least $c f_0 D$ interior labels. In its $R_(*)$ neighborhood, each unit cell has at most $C D$ endpoints at either time and at most $C f_0 D$ flagged endpoints at either time.
  + At either endpoint time, every ball $B \( z \, h \)$ in the neighborhood, with $r lt.eq h lt.eq 1$, satisfies
    #[#set math.equation(numbering: n => "(5.7)")
     $ \# { i : med i upright(" flagged") \, med Y_i in B \( z \, h \) } lt.eq C \( f_0 D h^3 + D^(1 \/ 100) \) \, $ <lp:flagged-count>]
    and the same assertion holds for $Z_i$.
  + Every frozen path visiting the relevant neighborhood satisfies (5.5) and has lifted diameter at most $C b$. At each mesh time $q$, and for either adjacent mesh interval $J$, the frozen paths satisfy
    #[#set math.equation(numbering: n => "(5.8)")
     $ sum_(k in.not cal(I) : med omega_k \( q \) in B \( z \, h \)) \( 1 + A_J \( omega_k \) \)^3 lt.eq C \( D h^3 + D^(1 \/ 100) \) #h(2em) \( r lt.eq h lt.eq 1 \) . $ <lp:frozen-count>]
    The unweighted version is also required at endpoints and at time zero.
  All ball tests may be made on finite spatial nets with dyadic radii, using enlarged balls and fixed margins. The stated inequalities for arbitrary balls then follow by covering. The constants $c \, C$ are fixed before taking $D$ large. Write $cal(B)$ for the set of bad sites.
] <lp:certificate>

For later probability estimates we also use the event obtained by requiring the third item for the entire path collection, with the same neighborhoods and fixed margins. In addition, each original path visiting the neighborhood is required to obey both ordinary-motion bounds

#[#set math.equation(numbering: n => "(5.9)")
 $ sup_(q in \[ - t \, t \]) \| tilde(omega) \( q \) - tilde(omega) \( - t \) \| lt.eq b \, #h(2em) sup_(q in \[ - t \, t \]) \| tilde(omega) \( q \) - tilde(omega) \( t \) \| lt.eq b . $ <lp:ordinary-motion>]

We call their intersection the full-path event. It is an event in the original sample, used to bound discarded mass; it is not a restriction in (5.6). In particular, for an original midpoint $y = omega_k \( 0 \)$ on this event, $\| y - m_k \| lt.eq b$. If label $i$ has a neighboring mean, $\| m_i - m_k \| lt.eq C$, then for sufficiently small fixed $x$ one has $\| y - m_i \| lt.eq 2 b < 8 b$. This is the midpoint range needed in the pinned insertion estimate below.

#thm([Proposition 5.2.])[
  (Probability of certificates).  #emph[The constants in Definition 18 can be chosen so that 
#[#set math.equation(numbering: n => "(5.10)")
 $ bb(P) { v upright(" is bad") } lt.eq C \( x \) D^(- 1 - 1 \/ 8) \, #h(2em) bb(P) { A upright(" consists of bad sites") } lt.eq p^(\| A \|) $ <lp:good-probability-bounds>]

 for every site $v$ and every set $A$ of distinct sites. Here $p > 0$ can be any prescribed fixed constant, followed by a sufficiently large lower threshold on $D$. Failure of the full-path event in a fixed neighborhood has probability at most $C \( x \) D^(- 6)$. The estimates are uniform in $Phi$ and in all sufficiently large torus sizes $K$.]
] <lp:good-probability>

#proof[
  We give the separate estimates for supply, exceptional motion, and the fine ball counts. Their combination will also explain why the one-site power and the joint parameter in (5.10) have different forms.
  First consider the cutoffs under free motion. Gaussian maximal estimates give probability at most $C D^(- 40)$ for maximal displacement from the initial point larger than $b$ or failure of (5.5), after the choices of $C_1 \, C_2$. For the increment estimate, first use a union bound over the $O \( r^(- 4) \)$ pairs of mesh points and then control oscillations on individual intervals. For a trial bridge with endpoint displacement at most $b$, or two legs pinned at a point within $8 b$ of $m_i$, the increment cutoff and confinement to the radius-$20 b$ ball fail with probability at most $C D^(- 40)$. The maximal-displacement test at radius $b$ is used only for exceptional visitors in the original sample. To check the trial estimates uniformly as $t$ decreases, represent the centered part of a leg of length $h$ by $W \( q \) - \( q \/ h \) W \( h \)$. Its prescribed line has increment divided by $sqrt(\| q - q' \| + r^2)$ at most $C b \/ sqrt(t) = C C_1 sqrt(log D)$, so it uses only a fixed fraction of $L_0$. The Gaussian remainder and the distance from that line to the confinement boundary give the asserted tails. Reversal of any of these exceptional events preserves the bound.
  Here is the transfer of these free tails to the interacting sample. For a set $A$ of sites let $J_A \( omega \)$ count the neighborhoods in that set visited by a path. If a reversal-invariant path event $cal(E)$ has free probability at most $epsilon$, the free visit estimate in [24] Lemma 4.5, with a unit-cell covering for our fixed neighborhood radius, gives
  $ bb(E)_(upright("free"))^y \[ e^(theta.alt J_A upright(bold(1))_(cal(E))) - 1 \] lt.eq C_theta.alt epsilon^(1 \/ 3) e^(- d_K \( y \, A \)) . $
  Its constants are uniform for $t lt.eq 1$. Expanding the exponential as a product over labels, applying (5.3), and then using the count moment-generating estimate yields
  #[#set math.equation(numbering: n => "(5.11)")
   $ log bb(E) exp #h(-0.16667em) (theta.alt sum_i J_A \( omega_i \) upright(bold(1))_(cal(E)) \( omega_i \)) lt.eq C_theta.alt D epsilon^(1 \/ 3) \| A \| \, $ <lp:visitor-mgf>]
  provided the coefficient in the last count estimate is at most one. For a single neighborhood the probability of even one exceptional visitor is bounded by the exponential moment minus one; it is $O \( D epsilon^(1 \/ 3) \)$. With $epsilon = C D^(- 40)$ this is smaller than $D^(- 6)$. For a joint bound, choose a fixed large $theta.alt$ in (5.11) first, and then take $D$ large. The probability of an exceptional visitor at every site in $A$ is at most $e^(- \( theta.alt - o \( 1 \) \) \| A \|)$.
  To obtain the interior supply, start with the lower endpoint count $ell_(*) D$ supplied by Proposition 5. Its failure probability is $O \( D^(- 2) \)$, jointly $\( C \/ D^2 \)^(\| A \|)$. Remove labels with a close endpoint at either time, and labels whose displacement exceeds one. Proposition 7 gives a joint small-parameter bound for a fixed positive fraction of close labels, since $s lt.double D^(- 1 \/ 3)$. Its one-site probability here is sharper: by (5.4) and Markov’s inequality, removing a fixed fraction of $D$ labels has probability
  #[#set math.equation(numbering: n => "(5.12)")
   $ C D s^3 = C D^(- 7 \/ 5) . $ <lp:close-loss>]
  Labels initially at a site but with a nonseparated terminal endpoint are covered by the same estimate in a fixed neighborhood, except for paths of displacement greater than one. The latter have free probability $C e^(- c \/ t)$; apply (5.11) to the event that a fixed positive fraction of the local labels has this property. Its probability is $e^(- c' D)$ for large $D$. The stronger cutoff failures have already been treated. A fixed positive fraction of $D$ eligible labels consequently remains. Conditional on all paths, independent flags leave at least $c f_0 D$ labels with probability $1 - e^(- c' f_0 D)$. The lists based at distinct sites are disjoint, so the same binomial estimate is joint over any prescribed sites.
  We have controlled the supply of eligible labels and the exceptional visitors. The remaining certificate tests prevent too many obstacles from concentrating in small balls. The upper counts in unit cells follow from the count exponential moment; the weighted bounds require a uniform argument down to the shrinking hard-core scale. Test separated sites, so far apart that a path obeying the motion cutoff can contribute to only one of their neighborhoods. Select one mesh time and one ball of radius $h_v in \[ r \, 1 \]$ at each tested site $v$. Truncate the oscillation weight at the cutoff. Multiply each contribution by the indicator that its whole central-slab path satisfies the increment and diameter cutoffs; outside the exceptional-visitor event already estimated, these restricted counts equal the actual local counts. This is a restriction of an integrand, not a conditioning of the path law. Put $a_D = c' \( log D \)^(- 2)$. Since $A_J lt.eq C sqrt(log D)$ on that cutoff, $a_D \( 1 + A_J \)^3 = o \( 1 \)$. For the single-path exponential increment $F_v$ we therefore have
  $ 0 lt.eq F_v lt.eq C a_D \( 1 + A_J \)^3 upright(bold(1))_({ omega \( q_v \) in B_v }) \, #h(2em) bb(E)_(upright("free") \, \[ - 1 \, 1 \])^y F_v lt.eq C a_D h_v^3 e^(- 3 d_K \( y \, v \)) . $
  For a following interval the second inequality uses the bounded Gaussian density at $q_v$ and the bounded moments of the normalized increment. For a preceding interval, integrate first over the increment and translate the ball by that increment; its Gaussian tail gives the identical bound. Central-slab times are uniformly away from the longer slab’s endpoints, so the constants are uniform. For flagged counts, first average the flag of this label; the bound acquires a factor $f_0$.
  Because a path passing the diameter cutoff visits at most one tested neighborhood, its exponential increment is the sum of the corresponding $F_v$. This property survives time reversal: the increment and diameter gates are reversal invariant, and $F_v compose upright("rev")$ still requires a visit to the same spatial neighborhood $v$, merely at the reflected time and interval. Thus replacing the single-path increment by $sum_v \( F_v + F_v compose upright("rev") \)$ makes it reversal invariant while preserving the same separated support and free expectation bound, up to a factor two. Expand the product over distinct labels, apply (5.3) to these weights, and bound the resulting product by an exponential. This gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ log bb(E) e^(a_D sum_v W_v) lt.eq C D a_D sum_v h_v^3 \, $ <lp:fine-mgf>]
  where $W_v$ is the truncated weighted count restricted to paths satisfying the motion cutoffs. In the flagged version the right side has an extra $f_0$. To justify the use of the spatial count estimate with different $h_v$, write $h_v^3 = integral_0^1 upright(bold(1))_({ h_v^3 gt.eq u }) upright(d) u$. For $A_u = { v : h_v^3 gt.eq u }$, the lattice exponential sum satisfies $sum_(v in A_u) e^(- 3 d_K \( y \, v \)) lt.eq C e^(- d_K \( y \, A_u \))$. Convexity of the logarithm of the exponential moment, followed by the set-count bound and $integral_0^1 \| A_u \| upright(d) u = sum_v h_v^3$, proves (5.13).
  Exponential Markov inequality at thresholds $C \( D h_v^3 + D^(1 \/ 100) \)$ now bounds any specified collection of ball violations by
  $ exp { - c a_D D^(1 \/ 100) \| A \| } . $
  The same proof applies to flagged counts at their stated thresholds. There are only polynomially many net balls and mesh times per site; their union therefore still has an arbitrarily large power saving, jointly as well as marginally. A fixed finite coloring separates arbitrary sites. Finally assign to every bad site one of the finitely many failed tests and select a largest class. The coloring and this assignment cost only fixed roots and fixed exponential factors in the joint parameter. Each underlying parameter can be made as small as needed before choosing $D$, proving the joint assertion for any fixed $p$. Marginally the largest remaining term is $C D^(- 7 \/ 5)$ from (5.12), which is bounded by $C D^(- 1 - 1 \/ 8)$. Applying the weighted-ball and motion arguments to all labels instead of only frozen labels proves the weighted part of the full-path bound. Either failure in (5.9) has free probability at most $C D^(- 40)$ by the first Gaussian estimate and its reversal. The visitor estimate consequently bounds their local union by $O \( D thin D^(- 40 \/ 3) \)$, which is smaller than $D^(- 6)$. This proves the asserted full-path failure bound including its ordinary-motion requirements. ◻
]

We have now obtained many labels and quantitative control of the obstacles in their neighborhoods. The remaining task is deterministic in the exposed data: show that a free trial bridge has a large chance to avoid those obstacles. The weighted oscillations in (5.8) were included precisely for this estimate.

=== 5.3 Collision probabilities and successful insertions <collision-probabilities-and-successful-insertions>

For distinct labels define

#[#set math.equation(numbering: n => "(5.14)")
 $ beta_(i k) = b_D (1 + frac(1, s or d_K \( Y_i \, Y_k \)) + frac(1, s or d_K \( Z_i \, Z_k \))) \, #h(2em) b_D = frac(C \( log D \)^C, D) . $ <lp:beta>]

The constants in this polylogarithmic expression are fixed, and may be enlarged without further mention.

#thm([Lemma 5.3.])[
  (Collision with one allowed path).  #emph[Fix the exposed data in a good neighborhood. Let $k$ be a deterministic path satisfying its individual cutoffs, and let $i eq.not k$ have the eligible endpoints. Under $B_i$, the probability that the trial satisfies its own cutoffs and comes within distance $r$ of path $k$ is at most $beta_(i k)$. For two legs pinned at a prescribed midpoint $y$, with $\| y - m_i \| lt.eq 8 b$ and $d_K \( y \, omega_k \( 0 \) \) > s$, the bound has the additional term 
$ frac(b_D, s or d_K \( y \, omega_k \( 0 \) \)) . $

 If $y$ is instead uniform in a unit cell at a fixed bounded distance from $m_i$, the integrated collision probability, including failure of this midpoint separation, is at most $C beta_(i k)$.]
] <lp:collision>

#proof[
  Orient each half of an ordinary bridge from its nearer endpoint; for a pinned trial do this separately on each of its two legs. Let $h gt.eq s$ be the separation between the trial and opponent at that endpoint, and let $q$ be elapsed time from it. On the two increment cutoffs, a collision in a mesh interval is impossible unless
  $ q + C Delta gt.eq c h^2 \/ \( log D \) . $
  The lower bound exceeds $Delta$ by a power of $D$, since $s^2 \/ \( r^2 log D \) arrow.r oo$. A possible collision requires positions within $C r sqrt(log D)$ at a neighboring mesh point. On the oriented half-leg, the bridge density there is bounded by $C q^(- 3 \/ 2)$. Thus the sum over these mesh points is at most
  $ C r^3 \( log D \)^(3 \/ 2) sum_(q gt.tilde h^2 \/ log D) q^(- 3 \/ 2) lt.eq frac(C r \( log D \)^2, h) . $
  Summing the finitely many oriented pieces proves the stated endpoint and midpoint terms, after enlarging $b_D$. A fixed additive term covers the harmless bounded-distance conventions. Confinement eliminates opponents outside the relevant neighborhood, and local lifts apply for all sufficiently large $K$. Finally $integral_Q \( s or \| y - z \| \)^(- 1) upright(d) y lt.eq C$ for every unit cube $Q$ and every $z$, whereas the volume where $\| y - z \| lt.eq s$ is at most $C s^3$. Since $s^3 = o \( b_D \)$, integration proves the last assertion. ◻
]

The individually small collision bounds sum to $o \( 1 \)$ over the flagged opponents, because their density is $f_0 D$. The frozen opponents have density of order $D$; for them we shall use the weighted space-time counts in the certificate. This distinction gives the following success bounds, uniformly in all paths left unexposed.

#thm([Proposition 5.4.])[
  (Uniform insertion probabilities).  #emph[Fix good data in all neighborhoods met by the following trials. In the first three assertions existing unexposed paths may take any values satisfying their individual cutoffs, while the frozen paths remain those of the fixed data. The fourth assertion instead concerns an obstacle collection satisfying the full-path bounds. For all sufficiently large $D$, these assertions hold also when an arbitrary subset of avoidance checks is omitted.]
  + #emph[An ordinary trial $B_i$, required to satisfy its own cutoffs and avoid the frozen paths and all indicated other unexposed paths, succeeds with probability at least $3 \/ 4$.]
  + #emph[A trial formed by choosing a uniform midpoint in a unit cell contained in $B \( m_i \, 8 b \)$ and at an absolute constant distance from its mean, then choosing independent bridge legs, has success probability at least $3 \/ 4$. It may also be required to have midpoint distance greater than $s$ from every opponent.]
  + #emph[Two such trials in two copies, using a common unit cell meeting the preceding conditions for both labels, with a common uniform midpoint and independent legs conditional on that midpoint, simultaneously succeed with probability at least $1 \/ 2$. Each is checked against the previously present paths in its own copy; the pair is not checked against itself across the copies.]
  + #emph[Suppose the entire obstacle collection satisfies the motion and count bounds defining the full-path event. A trial pinned at any point within $8 b$ of its mean and more than $s$ from every obstacle midpoint succeeds with probability at least $3 \/ 4$. This remains valid after adding or substituting a fixed number of individually allowed obstacles, provided the indicated endpoint and midpoint separations hold.]
] <lp:insertion>

#proof[
  For unexposed opponents, sum Lemma 20 over endpoint shells using (5.7). Both endpoint lists satisfy
  $ sum_k beta_(i k) lt.eq C b_D \( f_0 D + D^(1 \/ 100) \/ s \) lt.eq C \( log D \)^C \( D^(- x) + D^(- 19 \/ 100) \) = o \( 1 \) . $
  This also bounds the integrated cost for a uniform midpoint. The extra midpoint separation costs at most $C s^3$ per opponent, and there are $O \( f_0 D \)$ such opponents in a relevant neighborhood.
  For frozen opponents the endpoint-shell bound alone would lose a logarithm. We instead use their weighted space-time count. Consider an oriented half-leg and put
  $ q_0 = c s^2 \/ \( log D \) . $
  Endpoint separation and (5.5) imply that only intervals with elapsed time $q gt.eq q_0$ can contribute. At their initial mesh point the trial position has Gaussian density at most $C q^(- 3 \/ 2) e^(- c \| z - a_q \|^2 \/ q)$, where $a_q$ is its bridge mean. Given that position, the following increment has the representation
  $ X_(q + v) = X_q + frac(v, ell - q) \( a' - X_q \) + R_v \, #h(2em) 0 lt.eq v lt.eq Delta \, $
  where $ell in { t \, 2 t }$ is the bridge or leg duration, $a'$ is its opposite prescribed endpoint, and $ell - q gt.eq ell \/ 2$ on the oriented half. The centered bridge $R$ is independent of $X_q$. Its supremum divided by $r$, denoted by $U$, has a uniform Gaussian tail. On confinement the drift over the mesh interval is at most $C_b Delta \/ t lt.eq r$ for large $D$. A collision with frozen path $k$ therefore requires
  #[#set math.equation(numbering: n => "(5.15)")
   $ \| omega_i \( q \) - omega_k \( q \) \| lt.eq C r \( 1 + A_J \( omega_k \) + U \) . $ <lp:mesh-collision>]
  After deriving this necessary event we discard the cutoff before integrating the unrestricted bridge, under which the stated independence holds. This conditional-increment argument is the one used in [24] Proposition 5.2.
  Truncate $U$ at $C sqrt(log D)$ with an arbitrarily small polynomial error, summed over the polynomial number of local paths and mesh intervals. The radii in (5.15) are then $o \( sqrt(q) \)$ uniformly for $q gt.eq q_0$. Integrate the Gaussian density over these balls, then integrate $U$. Its fixed moments are bounded, so the result is bounded by
  $ C r^3 q^(- 3 \/ 2) sum_k \( 1 + A_J \( omega_k \) \)^3 e^(- c \| omega_k \( q \) - a_q \|^2 \/ q) . $
  Gaussian shells of radius $sqrt(q)$, and (5.8), bound this expression by $C r^3 \( D + D^(1 \/ 100) q^(- 3 \/ 2) \)$. Shells of radius greater than one use a unit-ball covering; their Gaussian decay makes the sum finite. Summing the mesh intervals on all oriented pieces gives
  #[#set math.equation(numbering: n => "(5.16)")
   $ C r (D t + D^(1 \/ 100) / sqrt(q_0)) + o \( 1 \) lt.eq frac(C alpha, x log D) + C alpha D^(- 19 \/ 100) sqrt(log D) + o \( 1 \) = o \( 1 \) . $ <lp:frozen-collision-sum>]
  For an ordinary bridge no midpoint is pinned, hence no midpoint separation is needed. For a uniform midpoint the excluded volume around frozen midpoint positions is at most $C D s^3 = o \( 1 \)$, by the unweighted count bound. For each chosen midpoint satisfying the separation condition, the preceding frozen estimate is uniform. The individual trial cutoffs fail with probability $O \( D^(- 40) \)$. These estimates prove the first two assertions, and a union bound in the common-midpoint proposal proves the third.
  On the full-path event the entire obstacle collection obeys (5.8); the same calculation proves the fourth assertion for any separated prescribed midpoint. Each added or substituted allowed obstacle contributes at most $C b_D \/ s = o \( 1 \)$ by Lemma 20. Deleting checks only increases each success probability. ◻
]

=== 5.4 Densities paid by a local change <densities-paid-by-a-local-change>

The midpoint density of $B_i$ in the selected lift is

$ g_i \( y \) = \( 2 pi t \)^(- 3 \/ 2) exp { - \| y - m_i \|^2 \/ \( 2 t \) } . $

Indeed Brownian motion has generator $Delta$, so its duration-$2 t$ bridge has midpoint covariance $t$ times the identity. If a trial instead has a uniform midpoint in a unit cube $Q$ at an absolute constant distance from $m_i$, its density relative to $B_i$ is $upright(bold(1))_Q \( y \) \/ g_i \( y \)$. Hence that density is at most $C D^(C x)$. Conditioning on an insertion event from Proposition 21 costs only a fixed additional factor. For a pair sharing its midpoint, this statement applies to each path marginal, or to an integral that retains the shared midpoint as an auxiliary variable. The pair itself is supported on equality of midpoints and has no density with respect to the independent product $B_i ⊗ B_k$. When $\| m_i - m_k \| lt.eq C$ and $\| y - m_i \| lt.eq C b$, direct subtraction of the two Gaussian exponents gives

#[#set math.equation(numbering: n => "(5.17)")
 $ frac(g_k \( y \), g_i \( y \)) lt.eq exp #h(-0.16667em) {frac(C \( 1 + b \), t)} lt.eq C D^(C sqrt(x)) . $ <lp:midpoint-ratio>]

The constants in these exponents are independent of sufficiently small $x$; only the allowed large-$D$ threshold depends on $x$.

#thm([Corollary 5.5.])[
  (Conditional density domination).  #emph[Fix good data and a set of route labels $S subset cal(I)$ with a bounded number of labels per site. In a product of their free bridge probabilities, condition on individual cutoffs and any selection of avoidance checks, including checks against fixed outside paths. The paths with labels in $cal(I) \\ S$ need only satisfy their individual cutoffs; the frozen paths remain those of the fixed good data. Every specified $q$ labels have joint marginal density at most $C^q$ relative to the product of their $B_i$. The conclusion also holds conditional on the values of all other labels. A uniform-midpoint insertion has the additional density expense $C D^(C x)$ for each inserted marginal, or in an augmented integral retaining the common midpoint, and replacing one free midpoint density by that of a neighboring label has expense (5.17).]
] <lp:trial-density>

#proof[
  For a single label, its conditional density is an admissibility indicator divided by its free insertion probability. Proposition 21 bounds that denominator below by $3 \/ 4$, uniformly in the other allowed paths. Successively integrate labels, or equivalently compare the partition integrals before and after each deletion. Each deletion costs at most $4 \/ 3$, proving $C^q$ for any specified collection. The midpoint statements were computed above. All arguments continue to apply with checks removed because the same lower insertion bound remains valid. ◻
]

The estimates in this section are local in space and uniform in volume. They supply both the small excluded mass and the bounded conditional densities needed by the next comparison. The later use of spatial routes belongs to the path-intersection approach of Benjamini, Pemantle, and Peres [5]; the estimates here provide the exact hard-core path laws on which that route comparison acts.

== 6 Smoothed deletion measures and their local comparison <palm:section>

In this section $Phi$ is a normalized nonnegative ground function. For a cell $v$ in either $cal(C)_d$ or $cal(C)_R$, define

#[#set math.equation(numbering: n => "(6.1)")
 $ s_v \( Y' \) = (frac(V, \| v \|) integral_v Phi \( y \, Y' \)^2 thin upright(d) y)^(1 \/ 2) \, #h(2em) P_v \( upright(d) Y' \) = s_v \( Y' \)^2 thin upright(d) Y' . $ <palm:rms-density>]

The measure $P_v$ describes the remaining particles after deletion of a particle in $v$, with its position averaged over the cell. Its mass need not be one. We shall prove the following estimate for neighboring small cells; Section 9 uses its fourth power to compare cell averages of $Phi$ with their root mean squares.

#thm([Proposition 6.1.])[
  (Local comparison of smoothed deletion measures).  #emph[With the exponents and partitions of Proposition 13, every normalized nonnegative bosonic ground function satisfies 
#[#set math.equation(numbering: n => "(6.2)")
 $ frac(1, \| cal(C)_d \|) sum_(v tilde.op w) integral frac(\| s_v - s_w \|^4, s_v^2 + s_w^2) thin upright(d) Y' lt.eq C_j D^(- 1 - u \/ 8) . $ <palm:local-rms-comparison>]

 Here $v tilde.op w$ ranges over ordered adjacent $d$-cells, and the quotient is zero when both functions vanish. The sum may be restricted to pairs in the same $R$-cell. The bound is uniform in the ground function and volume, with the limiting convention of Section 2.]
] <palm:local-comparison>

The proof constructs a common finite measure on the remaining particles that has a density close to one relative to each of $P_v$ and $P_w$, in a fourth-moment sense. To construct it, we first represent deletion by a distinguished label in the path law of Section 5. The independent flags, exposed datum, and unexposed labels $cal(I)$ are those defined there. Two copies of a local path rearrangement then give the same remaining configuration. We estimate their likelihoods before projecting back to $Y'$.

=== 6.1 The reference measures and count errors <the-reference-measures-and-count-errors>

For a cell $v$ of either partition $cal(C)_d$ or $cal(C)_R$, put

#[#set math.equation(numbering: n => "(6.3)")
 $ T_v = f_0 D \| v \| \, #h(2em) h_(v \, i) = upright(bold(1))_({ X_i in v }) \, #h(2em) T_v^(upright("rel")) = T_v^(- 1) sum_(i : thin i upright(" is flagged")) h_(v \, i) . $ <palm:tag-count>]

Here $X_i = omega_i \( 0 \)$ is the midpoint of the path of label $i$. Define a finite measure $P_(upright("aug") \, v)$ on a path sample together with a distinguished flagged label by

#[#set math.equation(numbering: n => "(6.4)")
 $ integral F thin upright(d) P_(upright("aug") \, v) = bb(E) sum_(i : thin i upright(" is flagged")) h_(v \, i) / T_v F \( omega \, i \) . $ <palm:augmented-reference>]

The expectation includes the flags. Additional independent randomizations introduced below are understood as probability kernels on this space. Delete the distinguished midpoint and put the other $N - 1$ midpoints in an independently chosen uniform order. The following identity shows that this projection realizes the analytic measure $P_v$ above.

#thm([Lemma 6.2.])[
  (Density of the smoothed deletion measure).  #emph[The projection of $P_(upright("aug") \, v)$ just described is $P_v$. The mass of $P_v$ equals $bb(E) T_v^(upright("rel"))$. Its average over either partition is one.]
] <palm:reference>

#proof[
  The midpoint law is $Phi^2 thin upright(d) X$. Flagging a particular label has probability $f_0$, independently of this law. Symmetry of $Phi^2$ and the uniform ordering make all $N$ summands in (6.4) identical after projection. Their coefficient is $N f_0 \/ T_v = V \/ \| v \|$. This identifies the projection with $P_v$ in (6.1). The last assertion follows by summing the cell indicators, since $N = D V$. ◻
]

We always average a cell-indexed estimate by the number of cells in its partition. For adjacent ordered pairs of $d$-cells the normalization is also the number of cells; changing this to the number of ordered edges changes only a fixed constant.

#thm([Lemma 6.3.])[
  (Fluctuations of the number of flagged particles).  #emph[The count estimates of Proposition 13 imply 
#[#set math.equation(numbering: n => "(6.5)")
 $ frac(1, \| cal(C)_R \|) sum_(v in cal(C)_R) bb(E) \| T_v^(upright("rel")) - 1 \|^2 & lt.eq C #scale(x: 120%, y: 120%)[\(] D^(- 1 - w \/ 6) + D^(- 1 + x) R^(- 3) #scale(x: 120%, y: 120%)[\)] \,\
frac(1, \| cal(C)_d \|) sum_(v in cal(C)_d) bb(E) \| T_v^(upright("rel")) - 1 \|^4 & lt.eq C_j #scale(x: 120%, y: 120%)[\(] D^(- 1 - u \/ 6) + D^(- 2 + 2 x) #scale(x: 120%, y: 120%)[\)] . $ <palm:R-count-moment>]

 For each fixed integer $q$, products of at most $q$ relative counts can be bounded by $C_j D^(q x)$ at an error smaller than every prescribed negative power of $D$. This assertion holds in any of the averaged estimates involving a fixed number of cells used below.]
] <palm:counts>

#proof[
  Conditional on the configuration, the flagged count $M_v$ in a cell is binomial with parameters $n_v$ and $f_0$. In particular,
  $ bb(E) \[ \( M_v - f_0 n_v \)^2 divides X \] lt.eq f_0 n_v \, #h(2em) bb(E) \[ \( M_v - f_0 n_v \)^4 divides X \] lt.eq C #scale(x: 120%, y: 120%)[\(] f_0 n_v + \( f_0 n_v \)^2 #scale(x: 120%, y: 120%)[\)] . $
  Write
  $ T_v^(upright("rel")) - 1 = frac(M_v - f_0 n_v, f_0 D \| v \|) + (frac(n_v, D \| v \|) - 1) . $
  The quadratic and quartic inequalities for this sum give the displayed bounds from the count moments of Proposition 13. The binomial contribution to the fourth moment is at most $C_j \( D^(- 2 + 2 x) + D^(- 3 + 3 x) \)$; the second term is smaller for $x < 1$. The required first and second moments of $n_v \/ \( D \| v \| \)$ follow either from these count estimates or from Proposition 6.
  For the last assertion, use the event that every unit cell meeting the indicated cells has count at most $C D$, where $C$ is a sufficiently large fixed constant. On that event $T_v^(upright("rel")) lt.eq C_j \/ f_0$. Proposition 6 bounds the complement by a polynomial in $D$ times $e^(- c D)$, also for an $R$-cell since it meets $O \( R^3 \)$ unit cells. Hard packing bounds all counts in these bounded regions by a fixed power of $D$. Consequently every fixed product on the exceptional event has expectation smaller than any prescribed power of $D^(- 1)$. ◻
]

We use two omissions. A distinguished label is retained only if it belongs to $cal(I)$. A pair of neighboring $d$-cells is compared only when all sites in a fixed neighborhood of the two cells are good in the sense of Definition 18. The neighborhood includes every possible tag mean and every path used in the construction below. It has radius $C b$, with $C$ fixed. For two $R$-cells we use their enlargements by $C R$ instead. Write $cal(G)_(v \, w)$ for the resulting good-neighborhood event. These are events of the exposed datum $cal(D)$; we do not add tests on unexposed paths to that datum.

#thm([Lemma 6.4.])[
  (Cost of omissions).  #emph[For every indicated cell $v$, the mass in $P_(upright("aug") \, v)$ of tags outside $cal(I)$ is at most $C_(x \, j) D^(- 1 - 1 \/ 8)$, uniformly in $v$. The mass lost by a failure of the required good neighborhood is at most $C_(x \, j) D^(- 1 - 1 \/ 8 + x)$ for a $d$-cell and at most $C_x R^3 D^(- 1 - 1 \/ 8 + x)$ for an $R$-cell. Multiplying an omission by a fixed product of relative counts costs at most a further factor $C_j D^(q x)$, with $q$ the number of factors. The same convention applies to a fixed power of the omitted relative count itself.]
] <palm:omissions>

#proof[
  Apart from flagging, failure of membership in $cal(I)$ means failure of an endpoint separation or an individual motion test. Flag independence cancels the factor $f_0$ in $T_v$. A tag in $v$ satisfying the motion cutoffs has both endpoints in a bounded enlargement of $v$. Equation (5.4) bounds the expected number of labels there having a second endpoint within distance $s$ by $C D^2 s^3$ per unit volume. Division by $D$ gives $C D s^3 = C D^(- 7 \/ 5)$. The visitor and free-cutoff estimates in the proof of Proposition 19 give errors of arbitrarily high fixed power for the remaining motion failures. Summing over the unit cells meeting an $R$-cell and dividing by its volume leaves the same bound. Both estimates are stronger than the stated $D^(- 1 - 1 \/ 8)$ bound.
  For a good-neighborhood failure use Proposition 19 and a union bound. There are $O_(x \, j) \( 1 \)$ tests for a local comparison and $O_x \( R^3 \)$ tests at scale $R$. On the count event in Lemma 25, the total reference weight is bounded by $C_j \/ f_0$. Its complement is negligible. This proves the second claim and the assertion about products. If $M_v$ denotes the omitted relative count, then $0 lt.eq M_v lt.eq C_j \/ f_0$ on the same count event and $M_v^q lt.eq \( C_j \/ f_0 \)^(q - 1) M_v$. This proves the final convention. ◻
]

=== 6.2 A coupling with the same remaining midpoint configuration <a-coupling-with-the-same-remaining-midpoint-configuration>

Fix disjoint cells $v \, w$. Select distinct flagged tags $i \, j$ with weight

#[#set math.equation(numbering: n => "(6.6)")
 $ frac(h_(v \, i) h_(w \, j), T_v T_w) . $ <palm:two-tag-weight>]

Retain only tags in $cal(I)$ and the specified good-data event. For a tag use the unit cell containing its bridge mean as its site. Confinement places that site within distance $C b$ of its indicated cell. A route and its subsequent label choices depend on the data and the tags, but not on unexposed path values. Write the resulting list as

#[#set math.equation(numbering: n => "(6.7)")
 $ i_0 = i \, i_1 \, dots.h \, i_m = j . $ <palm:label-list>]

All labels are distinct; consecutive bridge means have bounded distance. Interior labels are drawn from the supplies at the route sites, with the tags excluded. Conditional on the data, choices at different sites are independent. Their maximal point probability is $C \/ \( D f_0 \)$. No interior choice is needed at an endpoint site.

#thm([Lemma 6.5.])[
  (Two-copy midpoint transport).  #emph[For adjacent $d$-cells on the retained data event one can choose (6.7) of length $m lt.eq C_x$, with $C_x = O \( x^(- 1 \/ 2) \)$, and construct two path copies with these properties:]
  + #emph[All unselected paths are the same as in the original sample. The left path of $i$ and the right path of $j$ are also unchanged.]
  + #emph[Both copies satisfy every path constraint defining the conditional law at the given datum.]
  + #emph[For $1 lt.eq k lt.eq m$, the left midpoint of $i_k$ equals the right midpoint of $i_(k - 1)$. Thus, after deleting $i$ on the left and $j$ on the right, the midpoint configurations agree as unordered lists.]
  + #emph[The construction is a probability kernel conditional on the original sample and the route choices.]
  #emph[Consequently, weighting by (6.6), averaging all choices, and ordering the common remaining midpoint list uniformly defines a single finite measure $nu_(v \, w)$ on the remaining particles.]
] <palm:transport>

#proof[
  Join the tag mean-sites by a coordinate route of nearest-neighbor sites, erase loops, and choose one interior label at each interior site. The tag means lie within distance $C b$ of adjacent cells, so there are $O \( b \) = O \( x^(- 1 \/ 2) \)$ entries. If the sites coincide the list consists just of the two tags. The good-neighborhood event supplies all labels. The interior supplies have size at least $c f_0 D$, so excluding the bounded number of tags preserves the claimed point bound.
  For $k = 1 \, dots.h \, m$, sample a common midpoint uniformly in a unit cell whose distance from both corresponding means is bounded. Fix that cell as a measurable function of the exposed endpoints alone, before sampling any latent original or proposed paths. Conditional on that point, propose independently the left path of $i_k$ and the right path of $i_(k - 1)$ as two-leg free bridges. Condition this pair on its individual cutoffs and on avoidance, in each copy separately, of paths retained in that copy and paths already inserted in that copy. Paths to be inserted at later stages are not checked at this stage. Proposition 21 gives success probability at least $1 \/ 2$ for every such proposal, including every allowed preceding history. Thus each stage is a probability kernel. Every pair of paths in a finished copy is checked when the later of them is inserted. The midpoint identities and equality of the two remaining lists follow directly from the cyclic shift of labels in (6.7). ◻
]

We next calculate the density of the left output. This calculation also applies when selected outside obstacles and their checks have been deleted; this flexibility will allow independent centering of several route constructions.

Fix the data, $i$, the route labels, and the paths outside $S = { i_1 \, dots.h \, i_m }$. Denote these outside paths by $xi$. For $o = \( o_l \)_(l in S)$ define $a_S \( o \; xi \)$ to be the product of the individual cutoff indicators and all avoidance indicators involving at least one label in $S$. The conditional reference law is

#[#set math.equation(numbering: n => "(6.8)")
 $ lambda_S \( upright(d) o divides xi \) = Z_S \( xi \)^(- 1) a_S \( o \; xi \) product_(l in S) B_l \( upright(d) o_l \) \, quad Z_S \( xi \) = integral a_S \( o \; xi \) product_(l in S) B_l \( upright(d) o_l \) > 0 . $ <palm:conditional-reference>]

Checks wholly outside $S$ are irrelevant to this conditional formula. Let $K_S \( o \; xi \, upright(d) z \)$ be the marginal probability kernel of the left changed paths in Lemma 27. Its density relative to $product_(l in S) B_l$ is denoted by $k_S \( o \; xi \, z \)$. The unchanged factor $h_(v \, i) \/ T_v$ will remain outside this calculation.

#thm([Lemma 6.6.])[
  (Cancellation of the conditional normalizer).  #emph[The left-output likelihood, with the weight $h_(w \, j)$ included but the divisor $T_w$ omitted, is, on admissible reference values, 
#[#set math.equation(numbering: n => "(6.9)")
 $ L_S \( z \; xi \) = integral a_S \( o \; xi \) h_(w \, j) \( o \) k_S \( o \; xi \, z \) product_(l in S) B_l \( upright(d) o_l \) . $ <palm:likelihood-formula>]

 It satisfies 
#[#set math.equation(numbering: n => "(6.10)")
 $ F_S = L_S - h_(w \, j) \, #h(2em) bb(E)_lambda \[ F_S divides omega_(S^c) \] = 0 . $ <palm:centered-identity>]

 These assertions hold after removing any specified collection of outside checks, provided the same removals are used in the reference, the original-path integral, and the insertion kernels. Moreover, 
#[#set math.equation(numbering: n => "(6.11)")
 $ 0 lt.eq L_S lt.eq C_x D^(C sqrt(x)) . $ <palm:local-likelihood-sup>]

]
] <palm:likelihood>

#proof[
  Before dividing by the reference density, the output density is the right side of (6.9) divided by $Z_S$. The kernel produces only admissible left paths; on that support the reference density is $1 \/ Z_S$. These factors cancel. Integrating the resulting likelihood against (6.8) and using that $K_S$ has total mass one gives
  $ integral L_S thin upright(d) lambda_S = Z_S^(- 1) integral a_S \( o \; xi \) h_(w \, j) \( o \) product_(l in S) B_l \( upright(d) o_l \) = integral h_(w \, j) thin upright(d) lambda_S . $
  This proves the conditional centering, also with deleted checks.
  For clarity, the density used here can be written directly from the pair proposals. If $C_k$ is the chosen unit cell and $g_l$ the free midpoint density for label $l$, then the proposal for the $k$th pair, viewed from its left coordinate $z_(i_k)$, is
  #[#set math.equation(numbering: n => "(6.12)")
   $ frac(upright(bold(1))_(C_k) \( z_(i_k) \( 0 \) \), g_(i_k) \( z_(i_k) \( 0 \) \)) B_(i_k) \( upright(d) z_(i_k) \) thin B_(i_(k - 1))^(thin z_(i_k) \( 0 \)) \( upright(d) z'_(i_(k - 1)) \) . $ <palm:pair-proposal-disintegration>]
  Here $B_l^y$ is the two-leg bridge pinned at midpoint $y$. Its restriction to the individual cutoffs, together with the compatibility checks, is divided by a success probability at least $1 \/ 2$. The first density factor in (6.12) is bounded by $C D^(C x)$ on $C_k$, by Corollary 22. Integrating the auxiliary right paths successively, bounding each normalizer by $2$, and using $m = O \( x^(- 1 \/ 2) \)$ gives (6.11). The original integral has mass at most one. The same argument works with checks deleted because their success probabilities only improve. ◻
]

=== 6.3 The centered fourth moment <the-centered-fourth-moment>

The likelihood $L_S$ is centered around the second-tag indicator $h_(w \, j)$, rather than around one. For a fixed first tag $i$ with $h_(v \, i) = 1$, average over the route and interior labels, denoting this average by an overbar, and then sum over candidate second tags: these are the labels in $cal(I)$ whose mean-sites lie in the required enlargement of $w$. Confinement includes every retained tag with $h_(w \, j) eq.not 0$ in this data-dependent candidate set. The exact decomposition is

$ sum_(j eq.not i) overline(L_S) / T_w = sum_(j eq.not i) h_(w \, j) / T_w + sum_(j eq.not i) overline(F_S) / T_w . $

The first sum is the relative count in $w$ restricted to retained tags; Lemmas 25 and 26 control its difference from one. We now estimate the fourth moment of the second sum. Expanding it produces four centered route likelihoods with a common first tag. If one of their changed label sets is disjoint from the others and all its interactions with them are removed, its conditional integral vanishes. When all four changed sets are disjoint, a nonzero term therefore needs at least two interactions between lists. The next lemma quantifies their joint cost, and also the one-interaction cost needed when two lists share a label.

We specify the removed interactions for four possibly overlapping route lists, all with this same first tag $i$. Each list has a changed set $S_a$, $1 lt.eq a lt.eq 4$; these sets exclude $i$. Put $U = union.big_a S_a$ and condition on paths outside $U$. Join two lists when their changed sets intersect, and call the connected components of this relation blocks. A singleton block contains just one list, whether or not that list has several labels.

For each unordered pair $e$ of different blocks introduce a switch $sigma_e in { 0 \, 1 }$. Turning this switch off removes the following checks everywhere in the conditional integral:

+ reference avoidance checks between the two blocks;
+ checks between original paths integrated in one likelihood and outside reference paths in the other block;
+ checks, and the corresponding checks in insertion success probabilities, between proposed paths in one likelihood and outside reference paths in the other block.

Individual cutoffs and all other checks are retained. A newly proposed right path with label $i$ belongs to the block generating that proposal. Thus its checks against another block are switched, whereas checks of left insertions against the unchanged left path of $i$ are always fixed-outside checks. A right proposal is never checked against that left copy of $i$. The right retained path of the second tag is an original path of its own block. This specifies every check even though the two path copies retain different endpoint tags.

Let $F_a^sigma$ be the centered likelihood constructed using these switches. Lemma 28 applies for every switch setting. All formulas below hold on a fixed conditional fiber; constants are uniform over its allowed outside paths and good datum.

#thm([Lemma 6.7.])[
  (Two switched interactions).  #emph[Write $beta_(l k)$ for the collision bound in Lemma 20, and set 
$ beta_(*) = C_x D^(- 19 \/ 100) . $

 Suppose either that the four changed sets are disjoint, or that they have exactly one independent label identification. After increasing $D$ the following bounds hold for their centered likelihoods, integrated against the conditional reference on their union. Finite differences act on the entire admissibility numerator and its likelihood factors; the original conditional-reference normalizer is held fixed.]
  + #emph[A finite difference that switches one block-pair interaction has absolute integral at most $C_x D^(C sqrt(x))$ times the sum of the $beta_(l k)$ for the finitely many label pairs checked across that interaction. In particular it is at most $C_x D^(C sqrt(x)) beta_(*)$.]
  + #emph[If all four lists have disjoint changed sets, a mixed difference in two distinct block-pair interactions has absolute integral at most $C_x D^(C sqrt(x))$ times a finite sum of products $beta_(l k) beta_(l' k')$, with one checked pair from each interaction.]
  #emph[The bounds are valid if additional switches have already been fixed on or off. The number of summands is bounded by a constant depending only on $x$.]
] <palm:two-switches>

#proof[
  Expand each centered factor as $L_S - h_(w \, j)$ and use (6.9) and (6.12) for the likelihood factors. This represents the conditional integral using the following variables: reference output bridges on $U$; a separate collection of original bridges for each likelihood; and the auxiliary right bridges in its pair proposals. Without avoidance checks these variables factor between blocks. Within one block the two members of a pair proposal have a common midpoint, as they must. Every indicator imposing an individual cutoff is retained in the estimates below.
  There are three kinds of factors: indicators, success-probability reciprocals, and the densities in (6.12). The last factors do not depend on switches. When the changed sets are disjoint, combine each such density with its free left-output bridge and its pinned auxiliary bridge: this is exactly the probability measure of the common-uniform- midpoint pair proposal. We retain that measure when integrating a collision. In particular we do not replace it by the product of two independent bridges; that product would not even dominate the pair law. Thus the base measure within each singleton block is a product of plain original bridges and independent pair proposals, or of plain output bridges if its centered factor contributes the subtracted indicator. The different blocks have independent base measures, conditional on the fixed outside paths. Every proposal cell was fixed using the exposed endpoints, so its law has no remaining dependence on other blocks.
  There are $O \( x^(- 1 \/ 2) \)$ pairs, including all four lists. All success reciprocals are at most two. The inverse reference normalizer costs a fixed factor $C_x$, by successive single-path insertions on the bounded set $U$; keep that normalizer fixed when taking differences. With one identification, the nonsingleton block has repeated output coordinates. We leave those coordinates and their pinned auxiliary variables together until the singleton collision integrations have been carried out. Afterwards the remaining integral is bounded by the marginal-density argument proving (6.11), paying at most $C_x D^(C sqrt(x))$. This estimate never requires a joint density for two paths with a common midpoint. These observations also bound all unused factors in a difference by the same displayed expense.
  An indicator difference caused by a block-pair switch is supported on the event that at least one of the removed avoidance checks fails. Splitting this event by the union bound gives a collision between one path from each of the two blocks. The paths have distinct labels and meet their individual cutoffs. Integrating a free bridge or a marginal of a common-uniform-midpoint proposal against a deterministic allowed opponent costs at most $C_x beta_(l k)$, by Lemma 20. The same assertion holds with the roles of the two paths exchanged.
  We give the analogous verification for denominators. At a fixed insertion stage and preceding history its success probability is
  $ p \( sigma \) = integral Q \( upright(d) z \) thin c \( z \) product_e A_e \( z \)^(sigma_e) \, #h(2em) p \( sigma \) gt.eq 1 / 2 . $
  Here $Q$ is a fresh pair proposal, $c$ contains the individual cutoffs and unswitched checks, and $A_e$ is the product of checks controlled by switch $e$ at that stage. The convention $A^0 = 1$ applies also when $A = 0$. A first difference of $p$ is an integral with the factor $A_e - 1$; a mixed difference in $e \, f$ has the factor $\( A_e - 1 \) \( A_f - 1 \)$. They therefore force one or both corresponding collisions. The reciprocal identity
  $ p^(- 1) - q^(- 1) = frac(q - p, p q) $
  and its difference in a second variable bound a first reciprocal difference by a constant times $\| Delta_e p \|$, and a second difference by a constant times
  $ \| Delta_e Delta_f p \| + max_sigma \| Delta_e p \( sigma \) \| thin max_sigma \| Delta_f p \( sigma \) \| . $
  The product is represented using independent fresh proposals. These proposals belong to the block whose denominator is being tested. After dropping unused compatibility indicators, they are ordinary pair proposals with their own cutoff indicators. They introduce only a fixed number of additional density factors.
  Apply the finite-product difference rule. A first difference is thus a finite sum of integrals with one forced cross-block collision. To estimate it, integrate a singleton block against its fixed opponents whenever there is an overlapping block. In the application with one identification every block pair has a singleton side unless both blocks are singletons, which is easier. The remaining factors are bounded as above. This proves the first assertion in precisely the overlapping case needed below; with four disjoint lists either side can be integrated.
  For the second assertion the two different block-pair edges form either a two-edge tree or two disjoint edges. In the tree case fix all variables in the central block and integrate the two leaf blocks in succession. Each leaf participates in just one of the two forced collisions, so its integration costs the appropriate $beta$ bound uniformly in the central block. No independence of collisions inside the central block is used. If a forced collision comes from a denominator test, its fresh proposal belongs to its generating block; the same leaf integration applies. The two disjoint edges are estimated separately. This proves the product bound.
  Extra differences in other switches, when they occur, are bounded by a finite sum of evaluations of the same two-difference expression. This does not increase the number of forced collisions that must be estimated. Finally $beta_(l k) lt.eq b_D \( 1 + 2 \/ s \)$, which is bounded by $C_x D^(- 19 \/ 100)$ for sufficiently large $D$. This proves the stated worst bound. ◻
]

#thm([Lemma 6.8.])[
  (The fourth moment of the averaged centered likelihood).  #emph[For adjacent $d$-cells $v \, w$, let an overbar denote the average over the route and interior label choices at fixed tags and datum. Restrict the expectation to $cal(G)_(v \, w)$ and retained first tags. Equivalently, set the complete centered summand to zero outside this event. Then 
#[#set math.equation(numbering: n => "(6.13)")
 $ bb(E) [upright(bold(1))_(cal(G)_(v \, w)) sum_(i in cal(I)) h_(v \, i) / T_v lr(|sum_(j eq.not i) overline(F_S) / T_w|)^4] lt.eq C_(x \, j) D^(- 1 - 1 \/ 20) \, $ <palm:fourth-centered>]

 provided $x$ is sufficiently small. The candidate second tags are the labels in $cal(I)$ whose mean-sites lie in the required enlargement of $w$.]
] <palm:fourth>

#proof[
  Expand the fourth power into four independently randomized routes and label lists, conditionally on the datum and the common tag $i$. The total tag counting weights are bounded by $C_(x \, j)$ on good data: there are at most $C_x D f_0$ candidates in the bounded enlargement, and $T_v \, T_w$ are fixed multiples of $D f_0$. Each normalized tag weight, and each interior label probability, is at most $C_(x \, j) \/ \( D f_0 \)$.
  First split the tag summations by the mean-sites of the second tags and the resulting route site patterns, which have only $O_x \( 1 \)$ possibilities. Retain the original summation weights in each subsum; there is no renormalization by the mass of a site pattern. For every fixed tag choice in such a subsum, each tag counting weight and each interior-choice probability is bounded by $C_(x \, j) \/ \( D f_0 \)$. The set of candidate labels for any slot has at most $C_x D f_0$ elements. In bounding a positive sum we may discard within-list exclusions and dominate its joint weight by the product of these point bounds on the respective candidate sets. This domination requires no claim that conditioning on an arbitrary previously revealed tag preserves the stated point-mass bound.
  Two or more independent identifications between the four changed lists therefore cost at most $C_(x \, j) \( D f_0 \)^(- 2)$. An identification means one equality needed to merge previously separate label slots; a triple equality counts as two. Indeed an equality pattern with $q$ independent identifications leaves $q$ fewer freely chosen labels. Summing the product point bounds over that pattern gives at most $C_(x \, j) \( D f_0 \)^(- q)$, since every free label has at most $C_x D f_0$ possible values. There are only $O_x \( 1 \)$ slot patterns. A label cannot occur twice in one list, and none of the changed lists contains $i$. The supremum bound (6.11) therefore bounds all contributions with at least two identifications by
  #[#set math.equation(numbering: n => "(6.14)")
   $ C_(x \, j) D^(- 2 + 2 x + C sqrt(x)) . $ <palm:many-matches>]
  There remain the cases of no identification and exactly one. Condition on paths outside $U$ and write the conditional expectation as $Z_U^(- 1)$ times an integral against the free product bridges on $U$ with its admissibility numerator. Keep $Z_U$ fixed. Regard this numerator, including the four $F_a^sigma$, as a function $G$ of the block-pair switches. The elementary expansion at the all-off vertex of the Boolean cube is
  #[#set math.equation(numbering: n => "(6.15)")
   $ G \( bold(1) \) = sum_E Delta_E G \( bold(0) \) . $ <palm:switch-expansion>]
  In a term with an isolated singleton block, the integrand factors with respect to that block and the remaining blocks. Integrating the isolated block gives zero by (6.10), multiplied by its unnormalized reference density. This is a statement about each term of the mixed difference: its absent edges are off in every evaluation.
  With exactly one identification there are three blocks, two of them singletons. A surviving term in (6.15) must therefore contain at least one edge. Lemma 29 and the identification cost bound its total by
  #[#set math.equation(numbering: n => "(6.16)")
   $ C_(x \, j) D^(- 1 + x - 19 \/ 100 + C sqrt(x)) . $ <palm:one-match>]
  With no identification all four blocks are singletons. A surviving term must contain at least two different edges. Choose two of them, apply the two-difference bound, and estimate the remaining differences by the finite sum described in that lemma.
  One of the two collision factors can be averaged over a free label choice. There is always such a label: every cross-block check has a label of a changed list on at least one side, whereas $i$ belongs to none of those lists. The flagged-endpoint bound in Definition 18, summed over dyadic distance annuli, gives, uniformly in the other endpoint,
  #[#set math.equation(numbering: n => "(6.17)")
   $ frac(C_(x \, j), D f_0) sum_(k upright(" in a candidate list")) frac(1, s or d \( Y_k \, y \)) lt.eq C_(x \, j) (1 + frac(D^(1 \/ 100), D f_0 s)) lt.eq C_(x \, j) . $ <palm:averaged-beta>]
  The same holds at the other endpoint time. The candidate list is contained in a fixed bounded neighborhood; the annulus estimate uses $\# B_h lt.eq C \( D f_0 h^3 + D^(1 \/ 100) \)$. The last inequality follows from $x < 19 \/ 100$. Thus the averaged collision factor is at most $C_(x \, j) b_D$. We bound the other factor by $beta_(*)$. Excluding additional label coincidences can only decrease these positive upper bounds, so their restriction need not be retained during this summation. The no-match contribution is consequently
  #[#set math.equation(numbering: n => "(6.18)")
   $ C_(x \, j) D^(- 1 - 19 \/ 100 + C sqrt(x)) \( log D \)^C . $ <palm:no-match>]
  The factor $h_(v \, i)$ depends only on the fixed outside path $i$ and can be retained throughout the cancellations. It is bounded by one when estimating the errors. Summing the first tags has total weight at most $C_(x \, j)$ on good data. Combining (6.14), (6.16), and (6.18) proves (6.13) when $x$ is small enough that all power losses leave a saving of $1 \/ 20$. ◻
]

=== 6.4 Projection to the remaining particles <projection-to-the-remaining-particles>

The measure $nu_(v \, w)$ has two lifts: one to $P_(upright("aug") \, v)$, observing the left copy and tag $i$, and one to $P_(upright("aug") \, w)$, observing the right copy and tag $j$. Write their respective densities as $ell_v$ and $ell_w$. On the retained part of the left reference,

#[#set math.equation(numbering: n => "(6.19)")
 $ ell_v = sum_(j eq.not i) T_w^(- 1) overline(L_S) . $ <palm:lift-density>]

It is zero elsewhere. The sum of the corresponding centered subtractions is the relative count in $w$ restricted to tags in $cal(I)$. Indeed, confinement includes every such tag with nonzero $h_(w \, j)$ in the candidate mean range, and $h_(v \, i) h_(w \, i) = 0$ because the cells are disjoint.

#thm([Proposition 6.9.])[
  (Fourth-moment comparison before projection).  #emph[For sufficiently small $x > 0$, depending on the previously chosen exponent $u$, the measures above satisfy 
#[#set math.equation(numbering: n => "(6.20)")
 $ frac(1, \| cal(C)_d \|) sum_(v tilde.op w) {integral \| ell_v - 1 \|^4 thin upright(d) P_(upright("aug") \, v) + integral \| ell_w - 1 \|^4 thin upright(d) P_(upright("aug") \, w)} lt.eq C_j D^(- 1 - u \/ 8) . $ <palm:augmented-fourth>]

 The summation can be restricted to adjacent cells in the same $R$-cell. The bound is uniform in volume and in the nonnegative ground function, with the limiting convention of Section 2.]
] <palm:augmented-comparison>

#proof[
  Let $M_w$ be the omitted relative count in $w$. On the retained left reference, (6.19) gives
  $ ell_v - 1 = sum_(j eq.not i) T_w^(- 1) overline(F_S) + \( T_w^(upright("rel")) - 1 \) - M_w . $
  The inequality $\| a + b + c \|^4 lt.eq 27 \( \| a \|^4 + \| b \|^4 + \| c \|^4 \)$ separates the three terms. Lemma 30 treats the first. For the second, the count-tail bound gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] T_v^(upright("rel")) \| T_w^(upright("rel")) - 1 \|^4 #scale(x: 120%, y: 120%)[\]] lt.eq C_j D^x bb(E) \| T_w^(upright("rel")) - 1 \|^4 + O \( D^(- A) \) $
  for any fixed $A$, after averaging cells. Neighboring pairs have uniformly bounded degrees, so Lemma 25 applies. For the third term use $bb(E) \[ T_v^(upright("rel")) M_w^4 \] lt.eq C_j D^(4 x) bb(E) M_w + O \( D^(- A) \)$ and Lemma 26. On omitted first tags or data the density is zero, so the fourth error is exactly the omitted reference mass. The same lemma bounds it. Choose $x$ so that, in addition to the requirements of Lemma 30,
  $ x < u \/ 24 \, #h(2em) 4 x + u \/ 8 < 1 \/ 8 . $
  The resulting powers are bounded by $D^(- 1 - u \/ 8)$; the binomial $D^(- 2 + 2 x)$ contribution is smaller. This proves the left half of (6.20). For the right half, analyze the same generated kernel with the observed and auxiliary copies exchanged, retaining its original insertion order. Every preceding density and switch estimate holds for any fixed insertion order: only the specified previous-path checks enter its success probabilities. Thus this argument uses no symmetry of the success normalizers. Interchanging the two tag roles gives the other half. ◻
]

#proof[
  Let $q$ be the Lebesgue density of the common projection $nu_(v \, w)$. Conditional Jensen under the projection gives
  $ integral lr(|q / s_v^2 - 1|)^4 s_v^2 thin upright(d) Y' lt.eq integral \| ell_v - 1 \|^4 thin upright(d) P_(upright("aug") \, v) \, $
  with the analogous estimate for $w$. The measure $nu_(v \, w)$ is absolutely continuous with respect to both references, so $q = 0$ where either corresponding density vanishes.
  For completeness, for $a \, b gt.eq 0$ and $q gt.eq 0$ with this zero-set convention there is an absolute constant $C$ such that
  #[#set math.equation(numbering: n => "(6.21)")
   $ frac(\( a - b \)^4, a^2 + b^2) lt.eq C {a^2 lr(|q / a^2 - 1|)^4 + b^2 lr(|q / b^2 - 1|)^4} . $ <palm:scalar-fourth-transfer>]
  For $a \, b > 0$, put $c = sqrt(q)$. The inequalities $\| a - b \|^4 lt.eq 8 \( \| a - c \|^4 + \| b - c \|^4 \)$ and $\| 1 - sqrt(z) \| lt.eq \| 1 - z \|$ for $z gt.eq 0$ give
  $ frac(\| a - c \|^4, a^2 + b^2) lt.eq a^2 lr(|1 - c / a|)^4 lt.eq a^2 lr(|1 - q / a^2|)^4 \, $
  with the same estimate for $b$. This proves (6.21) with $C = 8$. If one of $a \, b$ vanishes, absolute continuity forces $q = 0$, and the inequality follows directly; if both vanish, both sides are defined to be zero.
  Apply (6.21) to $a = s_v$, $b = s_w$ and sum the Jensen bounds. This proves (6.2). ◻
]

== 7 Random routes and encounters away from a common endpoint <rt:section>

A transport between two deletion measures follows one route. Its second moment compares two independent route choices conditional on the same exposed datum and first tag, with the two other tags ranging over the distant cell. The two routes therefore have one endpoint in common, but their other endpoints need not coincide. We construct their geometric law here, before estimating the transport likelihoods in Section 8.

Two properties will be needed. The total number of encounters has a bounded exponential moment. If an initial portion of each route is discarded, the probability of any remaining encounter tends to zero when the other endpoints are averaged in a growing cube. We call the discarded portion #emph[silent]: the corresponding trajectories will be kept unchanged in the observed copy of the transport. These estimates include the average over the random set of unusable sites; they are not estimates for each fixed configuration of that set.

We adapt the folded-path construction of [24] Section 7. Its probability estimate is an instance of the unpredictable-path method of Benjamini, Pemantle, and Peres [5]. We give the finite process and the estimates needed for unequal terminal endpoints explicitly.

Write $cal(L)_K = \( bb(Z) \/ K bb(Z) \)^3$, and let $d_oo$ be its periodic maximum distance. Sites differing by one in one coordinate are nearest neighbors. For an integer $a gt.eq 1$, range-$a$ adjacency means maximum distance at most $a$. A random datum $cal(D)$ determines a bad set $cal(B) subset cal(L)_K$; its complement consists of the good sites. The sole probabilistic assumption on this set is

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(P) \( A subset cal(B) \) lt.eq p^(\| A \|) #h(2em) \( A subset cal(L)_K \) . $ <rt:bad-law>]

No independence or translation invariance is assumed.

Here and below a cube of side at most $c_Q R$ on the torus is the projection of an ordinary lattice cube of that size; $c_Q$ is fixed. We take $K gt.eq C_0 R$, with $C_0$ sufficiently large in terms of the fixed constants. Fix a common endpoint $z$ and such a cube $Q$ so that every $y in Q$ has forward first-coordinate displacement $n_y in \[ .29 K \, .46 K \]$ from $z$. Rounding the endpoints of this interval has no effect on the estimates. Fix an integer contact radius $r_c gt.eq 1$, and a nonnegative integer $q$, which allows a fixed number of neighbors of each changed portion to be included in the contact count. All constants in this section may depend on $r_c \, q \, c_Q$, but not on $K \, R$.

#thm([Proposition 7.1.])[
  (Routes with rare encounters away from the common end).  #emph[There are $p_0 \, kappa \, c \, C > 0$ and $R_0$ with the following property. Suppose $R gt.eq R_0$, $K gt.eq C_0 R$, and (7.1) holds with $p lt.eq p_0$. Put $h = floor.l R^(1 \/ 2) floor.r$. There is an event $cal(E)$, determined by $cal(D) \, z \, Q$, on which the construction below gives simple good nearest-neighbor routes $pi_y$ from $z$ to every $y in Q$. Conditional on the datum, routes are sampled using fresh independent random variables. The event includes the requirement that the $10 R$-neighborhoods of $z$ and $Q$ contain no bad sites.]
  #emph[For a route $pi = \( v_0 \, dots.h \, v_m \)$ starting at $z$, set 
$ a \( pi \) = max { i : d_oo \( v_i \, z \) lt.eq h } \, #h(2em) pi^(upright("ch")) = { v_i : i > a \( pi \) } . $

 Its silent portion $\( v_0 \, dots.h \, v_(a \( pi \)) \)$ has at most $C h$ vertices. The analogous silent portion read backwards from $y$ also has at most $C h$ vertices, and the two portions are disjoint. Let $pi^(upright(c h \, q))$ consist of vertices whose path index is within $q$ of an index in $pi^(upright("ch"))$. For independently sampled routes $pi_y \, pi_(y')$, define 
$ J & = sum_(v in pi_y) sum_(v' in pi_(y')) upright(bold(1))_({ d_oo \( v \, v' \) lt.eq r_c }) \,\
J_(*) & = sum_(v in pi_y^(upright(c h \, q))) sum_(v' in pi_(y')^(upright(c h \, q))) upright(bold(1))_({ d_oo \( v \, v' \) lt.eq r_c }) . $

 For every fixed pair $y \, y' in Q$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E)_(cal(D)) #h(-0.16667em) [upright(bold(1))_(cal(E)) thin bb(E)_(upright("routes")) \( e^(kappa J) divides cal(D) \)] lt.eq C . $ <rt:exponential>]

 For every deterministic probability mass function $omega$ on $Q times Q$ satisfying $omega \( y \, y' \) lt.eq C_omega R^(- 6)$, 
#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(y \, y' in Q) omega \( y \, y' \) thin bb(E)_(cal(D)) #h(-0.16667em) [upright(bold(1))_(cal(E)) thin bb(P)_(upright("routes")) \( J_(*) > 0 divides cal(D) \)] lt.eq C C_omega R^(- c_g) \, #h(2em) c_g = 1 / 2 (frac(log 2, log 3) - 1 / 2) > 0 . $ <rt:rare>]

 The same conclusions hold with a common terminal endpoint, reading the routes in reverse order.]
  #emph[If $cal(M)$ denotes just the stated bad-free margin event, then 
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(P) \( cal(M) \\ cal(E) \) lt.eq K^3 \( A p \)^(floor.l K \/ \( 10 \( r_c + 2 \) \) floor.r) + C R^3 e^(- c R) . $ <rt:rejection>]

 Here $A$ is fixed and $p_0$ is chosen so that $A p_0 < 1$.]
] <rt:routes>

=== 7.1 A finite process with small conditional atoms <a-finite-process-with-small-conditional-atoms>

We first produce the transverse randomness. Its conditional atom bound will also control encounters with an arbitrary fixed opposing route.

#thm([Lemma 7.2.])[
  #emph[Put $sigma = log 2 \/ log 3$. For every integer $T gt.eq 1$ there is an integer-valued process $\( S_j \)_(j = 0)^T$, with $S_0 = 0$ and $\| S_(j + 1) - S_j \| = 1$, such that 
#[#set math.equation(numbering: n => "(7.5)")
 $ sup_(x in bb(Z)) bb(P) \( S_(u + k) = x divides S_0 \, dots.h \, S_u \) lt.eq 6^sigma k^(- sigma) quad \( k gt.eq 1 \, med u + k lt.eq T \) . $ <rt:prediction-bound>]

]
] <rt:prediction>

#proof[
  Choose an ordered ternary tree of depth $m$ with $3^m gt.eq T$. Give the root spin $+ 1$. At every nonleaf vertex the first two children inherit its spin and the third receives an independent fair spin. If the leaf spins in order are $X_1 \, dots.h \, X_(3^m)$, let $S_j = sum_(i = 1)^j X_i$.
  The leaf sum of a depth-$d$ subtree with root spin $s$ equals
  $ 2^d s + sum_(a = 1)^d 2^(d - a) sum_(i = 1)^(3^(a - 1)) epsilon_(a \, i) \, $
  where the displayed fresh spins are independent. Select one fresh spin at each depth. Their weighted sum is uniform on $2^d$ distinct integers: writing $epsilon = 2 eta - 1$ reduces this assertion to binary expansion. Independently adding the remaining terms shows that every atom of the subtree sum is at most $2^(- d)$.
  For $k gt.eq 2$, choose $d gt.eq 0$ with $2 dot.op 3^d lt.eq k < 2 dot.op 3^(d + 1)$. The interval of leaves ${ u + 1 \, dots.h \, u + k }$ contains a complete aligned depth-$d$ subtree. Condition on every fresh spin except those strictly below its root. This fixes the history through time $u$, its root spin, and all leaves outside the subtree. The conditional atom bound just proved is $2^(- d) lt.eq 6^sigma k^(- sigma)$. Conditioning down to the history gives (7.5). The bound for $k = 1$ is immediate. ◻
]

Take independent copies for the two transverse coordinates and write $X_s = \( S_s^(\( 2 \)) \, S_s^(\( 3 \)) \)$. Let $cal(F)_s$ be their joint history. For every deterministic transverse target $a$, integer radius $l gt.eq 0$, and $k gt.eq 1$, independence gives

#[#set math.equation(numbering: n => "(7.6)")
 $ bb(P) \( parallel X_(u + k) - a parallel_oo lt.eq l divides cal(F)_u \) lt.eq C \( 1 + l \)^2 k^(- 2 sigma) . $ <rt:target-atoms>]

The same estimate holds for periodic distance modulo $K$, provided the horizon is at most $K \/ 2$: the possible values of each coordinate lie in an interval of length at most $K$, so only a bounded number of representatives of a periodic target need be counted. The bound is also valid for a union of any fixed number of target squares, after changing its constant.

#thm([Lemma 7.3.])[
  (Ordered tests against moving targets).  #emph[At each time $s in { 0 \, dots.h \, T }$, let $A_s \( l \)$ be a union of at most two deterministic squares of maximum radius $l$, with arbitrary centers, in the transverse torus. There is a constant $C_1$, independent of their centers and of $T lt.eq K \/ 2$, such that 
#[#set math.equation(numbering: n => "(7.7)")
 $ sum_(0 lt.eq s_1 < dots.h.c < s_j lt.eq T) bb(P) { X_(s_i) in A_(s_i) \( l_i \) \, med 1 lt.eq i lt.eq j } lt.eq product_(i = 1)^j C_1 \( 1 + l_i \)^2 . $ <rt:ordered-bound>]

 In particular, for $a_l gt.eq 0$, if $C_1 sum_(l gt.eq 0) a_l \( 1 + l \)^2 < 1$, then 
#[#set math.equation(numbering: n => "(7.8)")
 $ bb(E) product_(s = 0)^T (1 + sum_(l gt.eq 0) a_l upright(bold(1))_({ X_s in A_s \( l \) })) lt.eq (1 - C_1 sum_(l gt.eq 0) a_l \( 1 + l \)^2)^(- 1) . $ <rt:ordered-product>]

]
] <rt:ordered>

#proof[
  Set $k \( 0 \) = 1$ and $k \( t \) = t^(- 2 sigma)$ for $t gt.eq 1$. Successive conditioning in (7.6) bounds a summand on the left of (7.7) by
  $ C^j product_(i = 1)^j \( 1 + l_i \)^2 thin k \( s_1 \) product_(i = 2)^j k \( s_i - s_(i - 1) \) . $
  Since $2 sigma > 1$, the sum of $k$ is finite. Summing over the initial time and positive gaps proves the first assertion. Expanding the product into ordered subsets of times and using nonnegative summation proves the second. ◻
]

=== 7.2 Folding the walk and avoiding bad components <folding-the-walk-and-avoiding-bad-components>

For each $y in Q$, choose lifts of $z \, y$ with first-coordinate difference $n = n_y$ and transverse differences $Delta_2 \, Delta_3 in \[ - K \/ 2 \, K \/ 2 \]$. Independently of the datum, sample two copies of Lemma 33, through time $floor.l n \/ 2 floor.r$, and set

#[#set math.equation(numbering: n => "(7.9)")
 $ u_i = z + (i \, ⌊frac(i Delta_2, n)⌋ + S_(s_n \( i \))^(\( 2 \)) \, ⌊frac(i Delta_3, n)⌋ + S_(s_n \( i \))^(\( 3 \))) \, #h(2em) s_n \( i \) = min \( i \, n - i \) \, quad 0 lt.eq i lt.eq n . $ <rt:nominal>]

We use the same notation for a lifted vertex and its projection when the distance in question makes the interpretation explicit. The endpoints are $u_0 = z \, u_n = y$. Each coordinate changes by at most three per step, since $\| Delta_a \| \/ n lt.eq 50 \/ 29 < 2$. Refine a step by changing its coordinates in a fixed order. It has at most seven edges, and all its vertices lie within maximum distance three of its initial nominal vertex. Call the resulting walk $Gamma_y$; repeated vertex occurrences are retained at this stage.

We recall precisely the finite-component facts used to modify this walk. If $C subset bb(Z)^3$ is finite and range-one connected, its fill is $C$ together with all finite nearest-neighbor components of $bb(Z)^3 \\ C$. Its fill lies in the coordinate bounding box of $C$: a vertex outside the box has a coordinate ray to infinity avoiding $C$. The exterior shell

$ partial_(*)^(upright("ext")) C = { v in.not "fill" \( C \) : d_oo \( v \, C \) = 1 } $

is nearest-neighbor connected and has at most $26 \| C \|$ vertices. The connectivity assertion is the finite exterior-boundary theorem in [25] Theorem 4; this is the boundary convention used in [24] Section 7. Indeed a vertex outside the fill belongs to the infinite nearest-neighbor component of the complement. The displayed shell is therefore precisely the outer star-boundary visible by a nearest-neighbor path from infinity, as in that theorem. If $C$ is a maximal range-one bad component, every vertex in its exterior shell is good.

For completeness, small components on the torus have unambiguous finite lifts. A range-$a$ component of size $m$, with $a m < K$ and $K > 2 a$, can be lifted by a spanning tree, using the unique short displacement in $\[ - a \, a \]^3$ on every edge. All lifted vertex differences have maximum norm at most $a \( m - 1 \)$. On a remaining edge, the discrepancy between this difference and its short displacement is a multiple of $K$, with norm at most $a m < K$, and hence is zero. Thus the full inverse image is a disjoint union of finite translates, each projecting bijectively onto the component.

There are at most $A_a^m$ range-$a$ connected sets of size $m$ containing a specified root. Indeed choose a deterministic spanning tree and record its depth-first traversal, which has $2 \( m - 1 \)$ steps from a fixed finite set. The visited vertices recover the set. Consequently,

#[#set math.equation(numbering: n => "(7.10)")
 $ bb(P) { upright("a range-") a upright(" bad component has size at least ") m } lt.eq K^3 \( A_a p \)^m . $ <rt:animal>]

A larger component contains a connected subset of exactly $m$ sites, so the same estimate covers all larger sizes.

Set $a = r_c + 2$ and $m_K = floor.l K \/ \( 10 a \) floor.r$. Define $cal(E)$ to be the bad-free margin event $cal(M)$ intersected with the following two events: no range-$a$ bad component has $m_K$ or more sites; and none of the sites in ${ z } union Q$ belongs to the projection of a filled range-one bad component. The finite lifts just proved make this definition precise.

On $cal(E)$, replace visits of the lifted refinement to each bad range-one component $C$ as follows. The vertices immediately before its first visit and after its last visit lie in its exterior shell. The initial segment to the first such vertex avoids $C$ and connects to an endpoint outside its fill; the final segment has the same property. Join these two shell vertices by a simple nearest-neighbor shell path and replace the intervening walk segment. Each replacement removes a bad visit and introduces none. Every bad component subsequently treated was therefore met by the original refinement. When no bad visits remain, project the walk onto the torus and erase loops in chronological order. This gives $pi_y$. All choices can be made by fixed orderings on finite sets, so the route is a measurable function of the datum and its independent nominal randomness.

To prove (7.4), the first rejected event is bounded by (7.10). If a filled range-one component of size $m$ contains a given endpoint, its bounding box contains that endpoint. It therefore has a root within distance $m$, giving at most $C m^3$ possible roots. On $cal(M)$, all its sites are at distance more than $10 R$ from that endpoint, so $m gt.eq c R$. Summing the connected-set bound over $m gt.eq c R$ and over at most $C R^3$ candidate endpoints gives $C R^3 e^(- c R)$, after decreasing $p_0$. This proves the claimed rejection estimate.

The silent portions require a separate deterministic observation. No inserted shell vertex can lie within distance $5 h$ of either endpoint when $R$ is sufficiently large: every shell vertex has a bad neighbor, whereas the $10 R$-margin is bad-free. A refinement vertex within distance $h$ of $z$ belongs to a nominal step with index at most $h + 3$. This uses $0 lt.eq i lt.eq .46 K < K \/ 2$, so its first-coordinate distance to $z$ does not wrap around the torus. The entire original refinement before that step has at most $7 \( h + 4 \)$ edges and stays in the bad-free margin. Detour replacement and chronological loop erasure can delete vertices of this initial segment but cannot insert vertices into it: a detour begins next to a bad visit, and all such visits occur after this segment. Thus every surviving visit to the $h$-ball has at most $C h$ predecessors in the final route. At the other end, every occurrence of a nominal refinement vertex within distance $h$ of $y$ lies in the last $h + 4$ nominal steps. That whole terminal segment is bad-free. Detours introduce no vertex into it, and loop erasure preserves the order of surviving occurrences, so a surviving such vertex has at most $C h$ successors. This proves the terminal assertion without any reversibility assumption on chronological loop erasure. The two original end segments lie in disjoint $C h$-neighborhoods, and cannot overlap in path order because their first-coordinate indices are respectively at most $h + 3$ and at least $n - h - 3$. Their surviving silent portions are disjoint as well. Finally, every vertex of $pi^(upright(c h \, q))$ has distance greater than $h - q$ from $z$, since nearest-neighbor edges change this distance by at most one.

=== 7.3 Exponential moments for unequal terminal endpoints <exponential-moments-for-unequal-terminal-endpoints>

We now estimate encounters without assuming that the two terminal endpoints agree. Write $u_i$, $0 lt.eq i lt.eq n$, and $u'_j$, $0 lt.eq j lt.eq n'$, for two independent nominal walks starting at $z$, and let $Gamma \, Gamma'$ be their refinements. Set

#[#set math.equation(numbering: n => "(7.11)")
 $ t \( i \) = min \( i \, n' \) \, #h(2em) d_i = d_oo \( u_i \, u'_(t \( i \)) \) . $ <rt:clamp>]

Clamping to the last available opposing index is needed when $n eq.not n'$. The lifted first coordinates give $\| i - j \| = d_K \( i \, j \)$, since both indices lie in $\[ 0 \, .46 K \]$. If two refined vertices from steps $i \, j$ approach within radius $l$, then $\| i - j \| lt.eq l + 6$. The map $t$ is one-Lipschitz and $\| j - t \( i \) \| lt.eq \| j - i \|$. Bounded speed therefore gives

#[#set math.equation(numbering: n => "(7.12)")
 $ d_oo \( u_i \, u'_j \) lt.eq l quad arrow.r.double quad d_i lt.eq C \( l + 1 \) . $ <rt:alignment>]

The same implication, with adjusted constants, holds when refined vertices replace the nominal vertices. Since a step has a bounded number of vertex occurrences and only boundedly many opposing indices can contribute at a fixed radius, nominal encounters satisfy

#[#set math.equation(numbering: n => "(7.13)")
 $ J_(r_c) \( Gamma \, Gamma' \) lt.eq C sum_(i = 0)^n upright(bold(1))_({ d_i lt.eq L }) $ <rt:nominal-charge>]

for a fixed $L$. The contact count on refinements counts vertex occurrences, which only enlarges this bound for their surviving vertices.

Let $F$ range over the actual range-$a$ bad components, with $a = r_c + 2$. Every encounter involving a shell vertex can be charged to a component $F$ satisfying $d_oo \( F \, Gamma \) lt.eq a$ and $d_oo \( F \, Gamma' \) lt.eq a$. Indeed a shell vertex is adjacent to its generating range-one component, which was met by its own original refinement. An opposing nominal vertex within distance $r_c$ puts that component within distance $a$ of the other refinement. If both vertices lie in shells of components $C \, C'$, then $d_oo \( C \, C' \) lt.eq r_c + 2 = a$; thus $C \, C'$ belong to one range-$a$ component. There are at most $26 \| F \|$ possible shell sites associated with $F$, and each meets at most $\( 2 r_c + 1 \)^3$ vertices of the other simple route. Consequently, on $cal(E)$,

#[#set math.equation(numbering: n => "(7.14)")
 $ J lt.eq J_(r_c) \( Gamma \, Gamma' \) + C sum_F \| F \| thin upright(bold(1))_({ d_oo \( F \, Gamma \) lt.eq a \, d_oo \( F \, Gamma' \) lt.eq a }) . $ <rt:detour-charge>]

Simplicity of the final routes is used here; no length bound on the original refinements is used in charging a shell site.

Hold both complete nominal walks fixed and average over the environment first. Expand the exponential of the component sum in (7.14) as a product over actual components. Every term selects disjoint connected sets. By (7.1), its probability is at most $p$ to the sum of their sizes. Dropping the maximality requirement, then the disjointness restriction, and using $1 + x lt.eq e^x$, gives

#[#set math.equation(numbering: n => "(7.15)")
 $ & bb(E)_(cal(D)) [upright(bold(1))_(cal(E)) exp (kappa C sum_F \| F \| upright(bold(1))_({ d_oo \( F \, Gamma \) \, d_oo \( F \, Gamma' \) lt.eq a }))]\
 & #h(2em)  lt.eq exp (sum_G \( p e^(kappa C) \)^(\| G \|) upright(bold(1))_({ d_oo \( G \, Gamma \) \, d_oo \( G \, Gamma' \) lt.eq a })) \, $ <rt:environment-expansion>]

where $G$ ranges over nonempty range-$a$ connected candidate sets. This argument needs only the joint bound (7.1).

A candidate $G$ of size $m$ has a root within fixed distance of some $u_i$, with at most $C A_a^m$ choices for the rooted set. If it also approaches $Gamma'$, a spanning tree in $G$ gives an opposing nominal vertex $u'_j$ within distance $C m$ of $u_i$. Equation (7.12) implies $d_i lt.eq C_(upright("rt")) m$ for a fixed integer $C_(upright("rt"))$. Thus, increasing fixed constants,

#[#set math.equation(numbering: n => "(7.16)")
 $ bb(E)_(cal(D)) \[ upright(bold(1))_(cal(E)) e^(kappa J) divides u \, u' \] lt.eq exp (sum_(i = 0)^n U \( d_i \)) \, #h(2em) U \( d \) = C kappa upright(bold(1))_({ d lt.eq L }) + sum_(m gt.eq 1) theta^m upright(bold(1))_({ d lt.eq C_(upright("rt")) m }) \, quad theta = A p e^(C kappa) . $ <rt:potential>]

Here conditioning means that the nominal walks are fixed before the environment is sampled; their independence makes its law unchanged.

Next condition on the entire opposing walk $u'$. In (7.9), the random part of $u_i$ is $X_(s_n \( i \))$. The test $d_i lt.eq l$ implies that this variable belongs to a square of radius $l$ with deterministic transverse center

$ \( u'_(t \( i \)) - z \)^perp - (⌊i Delta_2 \/ n⌋ \, ⌊i Delta_3 \/ n⌋) med \( mod med K \) . $

The first-coordinate condition may be dropped for an upper bound. Each folded index $s$ occurs at most twice. Let $A_s \( l \)$ be the union of these at most two target squares. Then

$ sum_(i = 0)^n U \( d_i \) lt.eq sum_(s = 0)^(floor.l n \/ 2 floor.r) V_s \, #h(2em) V_s = 2 C kappa upright(bold(1))_({ X_s in A_s \( L \) }) + 2 sum_(m gt.eq 1) theta^m upright(bold(1))_({ X_s in A_s \( C_(upright("rt")) m \) }) . $

The deterministic bound $0 lt.eq V_s lt.eq V_max = 2 C kappa + 2 theta \/ \( 1 - theta \)$ implies $e^(V_s) - 1 lt.eq e^(V_max) V_s$. Choose first $kappa > 0$, then $p_0 > 0$, sufficiently small that

$ 2 C_1 e^(V_max) [C kappa \( 1 + L \)^2 + sum_(m gt.eq 1) theta^m \( 1 + C_(upright("rt")) m \)^2] lt.eq 1 / 2 . $

Lemma 34 now bounds the expectation of $product_s e^(V_s)$ by two, uniformly in the fixed opposing walk and the two endpoints. Averaging that walk proves (7.2). This conditioning argument is why equality of the terminal endpoints is unnecessary.

=== 7.4 A tail bound after the silent portion <a-tail-bound-after-the-silent-portion>

The preceding exponential estimate controls all encounters, including the unavoidable meeting at $z$. To obtain a small probability after the silent portions, we keep track of the root index in the component count instead of summing it by the length of the route.

We prove the following more flexible bound. Suppose contacts are counted only when both final-route vertices have distance at least $H$ from $z$, where $2 lt.eq H lt.eq c R$, and denote their count by $J_H$. With the site average of Proposition 32,

#[#set math.equation(numbering: n => "(7.17)")
 $ bb(E)_(upright("sites")) bb(E)_(cal(D) \, upright("routes")) \[ upright(bold(1))_(cal(E)) upright(bold(1))_({ J_H > 0 }) \] lt.eq C C_omega (H^(1 - 2 sigma) + H^3 / R^2 + e^(- c H)) . $ <rt:general-tail>]

Increasing constants covers bounded $H$. The expectation on the left is taken successively over deterministic site weights, the datum, and the fresh route samples; the notation below combines independent nominal randomness and environment averages when convenient.

Increase the fixed constant $C_(upright("rt"))$ if necessary, and for $m gt.eq 0$ define

#[#set math.equation(numbering: n => "(7.18)")
 $ N_m \( H \) = sum_(i = 0)^n upright(bold(1))_({ d_oo \( u_i \, z \) gt.eq H - C_(upright("rt")) \( m + 1 \) }) upright(bold(1))_({ d_oo^perp \( u_i \, u'_(t \( i \)) \) lt.eq C_(upright("rt")) \( m + 1 \) }) . $ <rt:root-count>]

Here $d_oo^perp$ uses only the last two periodic coordinates. A contact between two nominal refinement vertices contributes to $N_0 \( H \)$, after adjusting $C_(upright("rt"))$.

For a contact involving a shell, the component $F$ used in (7.14) has size $m gt.eq 1$. It has a root within fixed distance of a first-route nominal vertex $u_i$, and the contact vertex on that route is within $C \( m + 1 \)$ of $u_i$. To see the latter assertion, if that contact vertex is nominal choose its own step; otherwise its shell-generating component was met by the original first refinement, and a path in $F$ joins that visit to a bad neighbor of the contact vertex. In either case the same $F$ also approaches the opposing refinement. The diameter bound and (7.12) give both tests in (7.18). There are at most $A^m$ candidate rooted sets for each $i$. With nominal walks fixed, (7.1) therefore gives the union bound

#[#set math.equation(numbering: n => "(7.19)")
 $ bb(E)_(upright("sites")) bb(E) \[ upright(bold(1))_(cal(E)) upright(bold(1))_({ J_H > 0 }) \] lt.eq bb(E)_(upright("sites")) bb(E) N_0 \( H \) + sum_(m gt.eq 1) \( A p \)^m bb(E)_(upright("sites")) bb(E) N_m \( H \) . $ <rt:tail-expansion>]

The sum over route indices remains inside $N_m$; in particular this estimate has no preliminary factor depending on $K$.

First drop the distance-from-$z$ test in (7.18). Condition on the opposing nominal walk and use (7.6) from time zero. With the trivial bound at folded index zero, each summand has probability at most $C \( m + 1 \)^2 \( 1 + s_n \( i \) \)^(- 2 sigma)$. Every folded index occurs at most twice, so

#[#set math.equation(numbering: n => "(7.20)")
 $ bb(E) N_m \( H \) lt.eq C \( m + 1 \)^2 $ <rt:root-global>]

uniformly in both endpoints. For a small fixed $delta_1 > 0$, the terms of (7.19) with $m > delta_1 H$ are therefore bounded by $C e^(- c H)$.

Consider $m lt.eq delta_1 H$ and put $h_0 = floor.l delta_2 H floor.r$, for a second small fixed constant $delta_2 > 0$. The indices with $s_n \( i \) gt.eq h_0$ contribute at most

#[#set math.equation(numbering: n => "(7.21)")
 $ C \( m + 1 \)^2 sum_(s gt.eq h_0) \( 1 + s \)^(- 2 sigma) lt.eq C \( m + 1 \)^2 H^(1 - 2 sigma) . $ <rt:bulk-tail>]

Those with $i < h_0$ contribute zero. Indeed bounded speed gives $d_oo \( u_i \, z \) lt.eq 3 i$, whereas the distance test requires $d_oo \( u_i \, z \) gt.eq H - C_(upright("rt")) \( m + 1 \)$. Choose $delta_1 \, delta_2$ so that $C_(upright("rt")) delta_1 + 3 delta_2 < 1 \/ 2$, and increase the lower threshold for $H$ if necessary.

It remains to average the indices $i = n - s$, $0 lt.eq s < h_0$, near the noncommon endpoint $y$. Freeze $y'$ and the entire opposing nominal walk. For a fixed first coordinate of $y$, both $n$ and $k_0 = min \( n \, n' \)$ are fixed. Since clamping is one-Lipschitz, $\| t \( n - s \) - k_0 \| lt.eq s$. Also $d_oo \( u_(n - s) \, y \) lt.eq 3 s$. The transverse approach test in (7.18) therefore implies

#[#set math.equation(numbering: n => "(7.22)")
 $ d_oo^perp \( y \, u'_(k_0) \) lt.eq 6 s + C_(upright("rt")) \( m + 1 \) . $ <rt:endpoint-test>]

Its center is independent of the transverse coordinates of $y$. For each first-coordinate choice there are at most $C \( s + m + 1 \)^2$ possible transverse endpoint sites. There are $O \( R \)$ first-coordinate choices in $Q$.

To apply the joint site-weight bound without assuming a conditional probability bound, use $omega \( y \, y' \) lt.eq C_omega R^(- 6)$ directly, and sum first in $y$, then in the at most $C R^3$ choices of $y'$. Inequality (7.22) is a necessary condition for every first-route randomization, so its law need not be compared across different endpoint choices. It follows that the site average of the remaining part of $N_m \( H \)$ is at most

#[#set math.equation(numbering: n => "(7.23)")
 $ frac(C C_omega, R^2) sum_(0 lt.eq s < h_0) \( s + m + 1 \)^2 lt.eq C C_omega H^3 / R^2 \, #h(2em) m lt.eq delta_1 H . $ <rt:endpoint-tail>]

Combining (7.20), (7.21), and (7.23) in (7.19), and using $sum_m \( A p \)^m \( m + 1 \)^2 < oo$, proves (7.17).

Every vertex used in $J_(*)$ has distance greater than $h - q$ from $z$. Apply (7.17) with $H = h - q$, adjusting the fixed lower threshold on $R$. Since $h asymp R^(1 \/ 2)$,

$ H^(1 - 2 sigma) + H^3 \/ R^2 + e^(- c H) lt.eq C #scale(x: 120%, y: 120%)[\(] R^(- \( sigma - 1 \/ 2 \)) + R^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.eq C R^(- c_g) . $

This proves (7.3).

Finally, viewed from the terminal endpoint, a nominal walk has the form

$ u_(n - i) = y + (- i \, ⌊frac(- i Delta_2, n)⌋ + S_(s_n \( i \))^(\( 2 \)) \, ⌊frac(- i Delta_3, n)⌋ + S_(s_n \( i \))^(\( 3 \))) . $

The integer identity $floor.l \( n - i \) Delta_a \/ n floor.r - Delta_a = floor.l - i Delta_a \/ n floor.r$ verifies this formula. The same two independent processes, bounded speed, clamped alignment, and component charges apply. This proves the common-terminal-end version and completes Proposition 32.

#prodef([Remark 7.4.])[
  Both (7.2) and (7.3) average over the environment. They do not assert the corresponding estimates for each fixed datum. They remain valid with any further retention event inserted on their left sides. In applications where endpoint weights depend on the datum, a deterministic pointwise bound by $C R^(- 6)$ permits replacing those weights before the environment average; the counting proof of (7.23) then applies unchanged.
] <rt:averaging>

== 8 Transport between distant smoothed deletion measures <long:section>

The local comparison controls variations inside a mesoscopic cell. We now compare the smoothed deletion measures of two distant $R$-cells. The desired estimate is a squared $L^2$ distance $o \( D^(- 1) \)$ between their square-root densities $s_v$ and $s_w$. It follows from a common measure whose likelihood is close to one in both augmented references.

The transport uses a route whose length may grow with $K$, so a fixed density expense per step would be useless. Instead we estimate the second moment by comparing two transports with the same first tag. When they change disjoint sets of labels, deleting the checks between them separates their conditional integrals; the expense of restoring these checks is determined by route encounters. Random label choices also make shared output coordinates rare. Encounters at the common first tag are unavoidable. We keep an initial portion unchanged in the observed copy and integrate out its partners in the other copy. Encounters confined to these silent portions then incur no expense; encounters involving their seams are included in the count $J_(*)$ of Proposition 32. The use of unnormalized conditional integrals extends the common-measure comparison of [24] Section 8; the sequential pinning and the estimates that approach one are proved here.

Write $cal(A)_(K \, R)$ for the ordered pairs $\( v \, w \)$ of $R$-cells whose centres have forward first-coordinate displacement in $\[ .30 K \, .45 K \]$. All averages over this set are normalized counting averages. An error $o_K \( 1 \)$ below tends to zero at fixed dilution along the thermodynamic sequence, uniformly over the normalized nonnegative ground vectors under consideration. Constants may depend on the parameters fixed before $D$, including $x$ and $j$, but never on $K$ or on a route length.

#thm([Proposition 8.1.])[
  (Distant comparison of deletion measures).  #emph[For sufficiently small $x > 0$ relative to the previously fixed exponents, the functions $s_v$ of Lemma 24 satisfy 
#[#set math.equation(numbering: n => "(8.1)")
 $ frac(1, \| cal(A)_(K \, R) \|) sum_(\( v \, w \) in cal(A)_(K \, R)) integral \| s_v \( Y' \) - s_w \( Y' \) \|^2 thin upright(d) Y' = o \( D^(- 1) \) + o_K \( 1 \) . $ <long:hellinger>]

 The $o \( D^(- 1) \)$ is uniform over the nonnegative ground vectors and over the fixed window of $alpha$. The thermodynamic error is taken to zero first.]
] <long:comparison>

=== 8.1 The two-copy construction <the-two-copy-construction>

We retain the notation of Section 6: $cal(D)$ is the exposed data, $cal(I)$ the unexposed labels, $B_i$ their plain bridge laws, and $lambda$ the conditional admissible bridge law. For an $R$-cell $v$, put $T_v = f_0 D \| v \|$, $h_(v \, i) = upright(bold(1))_({ X_i in v })$, and $T_v^(upright("rel")) = T_v^(- 1) sum_(i med upright("flagged")) h_(v \, i)$. The initial mass assigned to distinct tags $i \, j$ is

#[#set math.equation(numbering: n => "(8.2)")
 $ frac(h_(v \, i) h_(w \, j), T_v T_w) . $ <long:tag-weight>]

Only tags in $cal(I)$ and the retained data events of Lemma 26 will be used. In particular the two cells have bad-free neighborhoods of radius a sufficiently large constant times $R$.

To apply Proposition 32, choose fixed lattice-cube enlargements $Q_v \, Q_w$ containing every candidate tag mean-site for the respective cells. Their sides are at most $C R$, and their $10 R$ margins lie in the retained bad-free neighborhoods. Let $z$ be the first tag’s mean-site and put $Q = Q_w$. The forward displacements of the cell centres lie in $\[ .30 K \, .45 K \]$, so those from $z$ to all sites in $Q$ lie in $\[ .29 K \, .46 K \]$ when $K \/ R$ is sufficiently large. Retain the route event $cal(E)$ of that proposition as well as the endpoint events already specified. Conditional on the data and the two mean-sites, sample its route using fresh randomness. Its vertices are distinct good sites. At each interior site choose one available interior label uniformly, excluding the tags. Choices at different sites are independent. If a bounded number of additional exclusions is necessary, make it before the uniform choice. The supply estimate gives the bound

#[#set math.equation(numbering: n => "(8.3)")
 $ sup_l Pr \( upright("chosen label") = l divides cal(D) \, upright("route and tags") \) lt.eq frac(C, D f_0) . $ <long:label-atom>]

This gives a list of distinct labels $i_0 = i \, i_1 \, dots.h \, i_m = j$. Consecutive bridge means have bounded distance. The route is simple, so at most a fixed number of list entries have means in any fixed-radius ball. This bound does not depend on $m$.

Let $H_0 = floor.l R^(1 \/ 2) floor.r$. The silent prefix consists of the vertices up to and including the last vertex within $H_0$ of the first endpoint. Define the silent suffix by reversing the route. Proposition 32 shows that these pieces are disjoint and have length $O \( H_0 \)$. Write their list indices as $0 lt.eq k < a_0$ and $a_1 < k lt.eq m$. Keep the prefix trajectories unchanged in the left copy and the suffix trajectories unchanged in the right copy. All trajectories outside the list are unchanged in both copies.

The remaining paths are generated in the following order.

+ For $a_0 lt.eq k lt.eq a_1 + 1$, generate a pair consisting of the left path of $i_k$ and the right path of $i_(k - 1)$. Fix a unit cell at bounded distance from both means as a measurable function of the exposed endpoints alone, before sampling any latent or proposed paths. Choose the common midpoint uniformly in that cell, and use the two independent pinned bridge laws given that midpoint. Condition on individual cutoffs, compatibility with every path retained in that copy, and compatibility with earlier middle pairs. Require also midpoint $s$-separation from these opponents. The probability of this event is at least $1 \/ 2$, by Proposition 21; thus each step is a probability kernel. Fix any deterministic order for these middle steps.
+ For the remaining pairs, one member is already present as a retained original. If its midpoint $y$ is within $8 b$ of the mean of the label to be inserted and is $s$-separated from all paths already present in the insertion copy, generate the other member with its pinned bridge law. Impose all individual and compatibility checks, and divide this trial measure by
  #[#set math.equation(numbering: n => "(8.4)")
   $ max { 1 \/ 2 \, p } \, $ <long:pin-divisor>]
  where $p$ is its total success probability. If either preliminary midpoint test fails, use the zero measure. Use a fixed deterministic order within each end. Prefix pins occur in the right copy; suffix pins occur in the left copy. These kernels have mass at most one.

Every generated path satisfies the constraints of its own copy. The left midpoint of $i_k$ is the right midpoint of $i_(k - 1)$ for every $1 lt.eq k lt.eq m$. After deleting $i$ on the left and $j$ on the right the midpoint multisets therefore coincide. Order these baths with one common uniform permutation. The weighted construction defines a finite common measure $nu_(v w)$ on the bath observation, with one lift to each augmented reference.

#figure(
  [#image("fig/transport.pdf.png", width: 100%)],
  caption: [Figure 1: The midpoint pairing, shown schematically for $m = 8$, $a_0 = 3$ and $a_1 = 5$. Each link identifies the left midpoint of $i_k$ with the right midpoint of $i_(k - 1)$. The middle pairs receive fresh common midpoints. At each end one original trajectory is retained and its partner is pinned through the retained midpoint. After deleting the crossed first left and last right tags, all remaining midpoints are paired. The rows show label order, not geometric positions or paths. ],
) <fig:transport>

#thm([Lemma 8.2.])[
  (Mass of the transport).  #emph[For some $c_3 > 0$, the mass of this common measure satisfies, after averaging over $\( v \, w \) in cal(A)_(K \, R)$, 
#[#set math.equation(numbering: n => "(8.5)")
 $ nu_(v w) \( 1 \) gt.eq bb(E) \[ T_v^(upright("rel")) T_w^(upright("rel")) \] - C D^(- 1 - c_3) - o_K \( 1 \) . $ <long:mass-bound>]

]
] <long:mass>

#proof[
  The omitted tags, failed endpoint neighborhoods and route-existence rejections have total weighted mass $O \( D^(- 1 - c) \) + o_K \( 1 \)$ by Lemma 26 and Proposition 32. For the latter use the marginal bad-site bound in an $O \( R^3 \)$ neighborhood, the exponentially small probability of a filled component reaching across the margin, and the thermodynamically vanishing probability of a large component. Multiplying by the bounded number of relative-count factors costs at most $D^(C x)$, outside events smaller than any power of $D$.
  It remains to check the subprobability steps near the two ends. Use the full-path count and motion event of Proposition 19 in the enlarged endpoint neighborhoods solely to estimate the discarded mass; it is not added to the conditional bridge law. Its ordinary-original motion tests give $sup_q \| omega \( q \) - Y \| lt.eq b$ and $sup_q \| omega \( q \) - Z \| lt.eq b$ in the chosen lift. In particular its midpoint $y$ has distance at most $b$ from the source mean. Consecutive means have distance bounded by a fixed constant, which is at most $b$ after increasing the fixed cutoff constant. Thus every required pin has $\| y - m_(upright("insert")) \| lt.eq 2 b < 8 b$. The full-path event fails with weighted mass smaller than $D^(- 1 - c)$ after the $O \( R^3 \)$ union bound. On this event, a pinned trial with a separated midpoint has probability at least $3 \/ 4$. Indeed, start with the full original obstacle collection in Proposition 21, delete any replaced originals, and add the already generated paths. Only boundedly many added paths can meet the trial neighborhood, by simplicity of the route. The last assertion of that lemma applies to these additions.
  For a middle path the necessary separation from a later pinned midpoint was already checked in the copy containing the retained original that provides that midpoint. The paired middle paths have the same midpoint. The two silent ends are separated by a distance of order $K$, so no check joins them for sufficiently large $K$. Thus the only remaining separation failure is that a selected silent original has midpoint within $s$ of another original midpoint. In each bounded region the expected number of such ordered pairs is at most $C D^2 s^3$. Summing the selected interior labels uses (8.3); summing an end tag uses its factor $T_v^(- 1)$ or $T_w^(- 1)$. Enlarging all site sums to the endpoint neighborhoods and using the other relative-count bounds gives at most
  $ C R^3 D^(C x) frac(D^2 s^3, D f_0) lt.eq C D^(- 7 \/ 5 + 3 w + C' x) . $
  The midpoint range failure is already covered by the displacement cutoffs chosen above. Outside these discarded events every pin has $p gt.eq 3 \/ 4$, so (8.4) equals $p$ and the pin kernel has mass one. Since $w$ and then $x$ were chosen small, all displayed losses have a strict power saving beyond $D^(- 1)$. This proves the lemma. ◻
]

=== 8.2 Conditional likelihoods and the checks between two transports <conditional-likelihoods-and-the-checks-between-two-transports>

We next prove absolute continuity of the common measure’s augmented lifts and bound their second moments. Denote the left lift density by $ell_(v \, w)$. Its reference has mass $bb(E) T_v^(upright("rel"))$, while its own mass is $nu_(v w) \( 1 \)$. The mass estimate therefore shows why the leading term sought for its second moment is $bb(E) \[ T_v^(upright("rel")) \( T_w^(upright("rel")) \)^2 \]$: in the centered second moment the three leading terms combine to

$ bb(E) \[ T_v^(upright("rel")) \( T_w^(upright("rel")) \)^2 \] - 2 bb(E) \[ T_v^(upright("rel")) T_w^(upright("rel")) \] + bb(E) T_v^(upright("rel")) = bb(E) \[ T_v^(upright("rel")) \( T_w^(upright("rel")) - 1 \)^2 \] . $

Lemma 25 controls this last expression. The task below is to bound the remaining second-moment error independently of route length.

For a fixed route and label list let $S = { i_k : k gt.eq a_0 }$ be the changed labels in the left copy. The retained first tag $i$ is not in $S$. Strip its factor $h_(v \, i) \/ T_v$, but keep the factor $h_(w \, j)$ from the original second tag. Denote the resulting likelihood by $L_S$. The division by $T_w$ and all choices will be averaged at the end.

Here is an explicit integral defining $L_S$. For fixed outside paths $o$ let $A_S \( x \; o \)$ be the indicator of all reference checks incident to $S$, including individual cutoffs, and let

$ Z_S \( o \) = integral A_S \( x \; o \) thin upright(d) B_S \( x \) \, #h(2em) B_S = ⨂_(l in S) B_l . $

Let $K_S \( x \, o \; upright(d) z \)$ be the subprobability kernel of the complete two-copy construction, observed only in its changed left coordinates. Its input $x$ consists of the latent original $S$ paths. Define the finite output measure

#[#set math.equation(numbering: n => "(8.6)")
 $ M_S \( o \; upright(d) z \) = integral A_S \( x \; o \) h_(w \, j) \( x \) K_S \( x \, o \; upright(d) z \) thin upright(d) B_S \( x \) . $ <long:unnormalized-output>]

On reference-admissible configurations,

#[#set math.equation(numbering: n => "(8.7)")
 $ L_S \( z \, o \) = frac(upright(d) M_S \( o \), upright(d) B_S) \( z \) . $ <long:exact-likelihood>]

To verify this, both the conditional input law and the conditional reference output law have the same divisor $Z_S \( o \)$. It cancels in their likelihood ratio, as in Lemma 28. Absolute continuity follows from the ordinary densities of middle outputs and the distinct latent midpoint sources for pinned left outputs. A detailed density bound is proved below.

For upper bounds, integrate out all right pins against the silent prefix. They occur after the middle steps and are subprobability kernels. The left suffix pins do not use these right paths. Removing these right kernels therefore increases (8.6). In the rest of the upper-bound argument $K_S$ denotes this enlarged kernel. This operation is the reason that meetings confined to two silent prefixes cost nothing.

Fix two route and label choices with the same first tag, with changed sets $S \, T$ and second tags $j \, j'$. Fix the paths outside $U = S union T$, at a value where the regular conditional reference law is defined. Every statement until the averaging subsection is uniform in these fixed allowed values. Let $Z_U$ be the reference normalizer on $U$ relative to $B_U$.

Define the separate $S$ protocol by deleting the old paths indexed by $T \\ S$ from its outside obstacles and removing each check against such a path. Keep its list of generated transitions unchanged. In particular a right middle path keeps the endpoints of its label even when that label’s old trajectory has been deleted as a left obstacle. Define the separate $T$ protocol symmetrically. Use a superscript minus for these protocols and write $A_S^(-) \, Z_S^(-) \, M_S^(-)$ for their reference indicator, reference normalizer and unnormalized output measure.

These separate quantities depend on their own latent and output variables and on the common fixed outside of $U$. They do not depend on the other set’s unshared path variables. The only apparent exception is the first right middle insertion at the edge of a silent prefix. Its old trajectory is retained on the left, but its right insertion uses only the fixed endpoints; all checks using the old trajectory are among the deleted outside checks. The right pins have already been integrated out. This verifies the asserted independence also at that edge.

We now specify exactly which comparisons can contribute a cost. Each reference check between a label of $S \\ T$ and a label of $T \\ S$ is an edge of a finite graph on these two sets. Each deleted proposal check gives a second kind of edge: one end records its generated transition and the other the removed old opponent label. A transition has at most two generated paths, one in each copy. A label appears as a primary path once and as an auxiliary path at most once. The fixed confinement radii imply that a check is identically satisfied unless the associated route sites have distance at most a fixed $r_c$. For a predecessor or a midpoint source use the neighboring route site. Increase $r_c$ once to include these bounded displacements.

Let $J$ be the full site-contact count of Proposition 32, and $J_(*)$ its contact count between the changed portions from the common end, with these step neighbors included. There are at most $C J_(*)$ edges in the graphs just defined, hence at most $C J$ edges. Every degree is bounded by a constant: a simple lattice route contains only boundedly many vertices in an $r_c$-ball. The constants in this assertion do not count the route length.

For a check between distinct labels $l \, k$ put

#[#set math.equation(numbering: n => "(8.8)")
 $ beta_(l k) = b_D (1 + frac(1, s or d \( Y_l \, Y_k \)) + frac(1, s or d \( Z_l \, Z_k \))) \, #h(2em) b_D = frac(C \( log D \)^C, D) . $ <long:beta>]

For a pinned trial with midpoint $y$ checked against an old path $X_k$, also put

#[#set math.equation(numbering: n => "(8.9)")
 $ m \( y \, X_k \) = frac(b_D, s or d \( y \, X_k \( 0 \) \)) . $ <long:midpoint-cost>]

All compared labels are distinct, even when the sets $S \, T$ intersect: an outside obstacle is never the label currently inserted. Lemma 20 bounds each corresponding collision or uniform-midpoint separation cost by $C beta_(l k)$, and a pinned collision by $C \( beta_(l k) + m \( y \, X_k \) \)$ when the pin satisfies separation. Since $s = D^(- 4 \/ 5)$, all these costs are at most $C D^(- 19 \/ 100)$ for large $D$. Let $B_(S T)$ be the sum of the $beta$ costs over all affected checks, with their bounded multiplicities, and let $M_(S T)$ be the corresponding sum of (8.9). Thus

#[#set math.equation(numbering: n => "(8.10)")
 $ B_(S T) + M_(S T) lt.eq C D^(- 19 \/ 100) J . $ <long:worst-cost>]

=== 8.3 Reference normalizers and proposal probabilities <reference-normalizers-and-proposal-probabilities>

There are two different sources of cost in the product of likelihoods. Checks between distinct labels prevent the two conditional integrals from factoring; the next two lemmas compare the reference normalizers and the proposal probabilities when these checks are removed. If a label belongs to both changed sets, its output coordinate is also shared by the two likelihoods. We will treat those coordinates separately, by bounding selected output marginals.

The normalization calculation uses one-path insertion bounds even when the number of changed paths is large. No joint normalizer is bounded below by a constant independent of that number.

#thm([Lemma 8.3.])[
  (Reference normalizers).  #emph[If $S ∩ T = diameter$, then 
#[#set math.equation(numbering: n => "(8.11)")
 $ 1 lt.eq frac(Z_S^(-) Z_T^(-), Z_U) lt.eq exp \( C B_(S T) \) . $ <long:disjoint-normalizers>]

 If $q = \| S ∩ T \|$ is arbitrary, then 
#[#set math.equation(numbering: n => "(8.12)")
 $ frac(Z_S^(-) Z_T^(-), Z_U) lt.eq C^q exp \( C B_(S T) \) . $ <long:shared-normalizers>]

 All normalizers are strictly positive. In the disjoint case, if $H$ is any measurable function of the latent originals with $0 lt.eq H lt.eq 1$, and $A^(-) = A_S^(-) A_T^(-)$, then 
#[#set math.equation(numbering: n => "(8.13)")
 $ 0 lt.eq 1 / Z_U integral H \( A^(-) - A_U \) thin upright(d) B_U lt.eq C e^(C B_(S T)) B_(S T) . $ <long:tag-integral-difference>]

]
] <long:normalizers>

#proof[
  The conditional distribution of any one original path, given all the others, is bounded by $c_0^(- 1) B_l$ with $c_0 = 3 \/ 4$, by Proposition 21. This remains true after arbitrary checks have been removed. Every reduced normalizer is positive by inserting its coordinates successively; the resulting lower bound may depend on their number and is used only for positivity.
  Suppose first that $S \, T$ are disjoint. With their cross checks removed the integral factorizes as $Z_S^(-) Z_T^(-)$. Add the cross checks in any fixed order. For a check between $l$ and $k$, condition on all paths except $l$. Its failure probability is at most $c_0^(- 1) beta_(l k)$. Consequently this insertion multiplies the inverse normalizer by at most
  $ \( 1 - c_0^(- 1) beta_(l k) \)^(- 1) lt.eq exp \( 2 c_0^(- 1) beta_(l k) \) $
  for large $D$. Multiplication gives (8.11). Under the normalized product with all cross checks deleted, their union fails with probability at most $c_0^(- 1) sum beta_(l k)$. Dropping $H lt.eq 1$ and using the normalizer ratio proves (8.13).
  For general $S \, T$, put $A = S ∩ T$. Delete the labels of $A$ and their incident checks from both separate reference integrals. This increases $Z_S^(-)$ and $Z_T^(-)$. The remaining sets $S \\ A \, T \\ A$ are disjoint, so the preceding comparison applies to them. Their joint normalizer is at most $c_0^(- q) Z_U$, since one can add the $q$ labels in $A$ using their uniform insertion lower bounds. The cross-check costs used for the disjoint remainder are among those in $B_(S T)$. These two inequalities prove (8.12). ◻
]

#thm([Lemma 8.4.])[
  (Comparison of transition factors).  #emph[Use the same latent originals and the same generated variables in the original and separate protocols. The original integrand is bounded by the separate integrand times a nonnegative factor $cal(R)$ satisfying 
#[#set math.equation(numbering: n => "(8.14)")
 $ cal(R) & lt.eq e^(C D^(- 19 \/ 100) J) \,\
cal(R) & lt.eq 1 + C e^(C D^(- 19 \/ 100) J) \( B_(S T) + M_(S T) \) . $ <long:factor-exponential>]

 The assertion is for the product of the two protocols as well. A transition with no removed check has ratio exactly one.]
] <long:transitions>

#proof[
  Fix the history before one generated pair or pin. Its proposal law before checks is unchanged by deletion of outside obstacles. Let $p$ and $p^(-)$ be the acceptance probabilities with and without the removed checks; then $p lt.eq p^(-)$. For a middle pair $p gt.eq 1 \/ 2$, and hence
  $ p^(-) / p lt.eq 1 + 2 \( p^(-) - p \) . $
  For a pin, use $w = max \( 1 \/ 2 \, p \)$ and $w^(-) = max \( 1 \/ 2 \, p^(-) \)$. The map $p mapsto max \( 1 \/ 2 \, p \)$ is increasing and $1$-Lipschitz, so
  $ w^(-) / w lt.eq 1 + 2 \( p^(-) - p \) . $
  The ratio of admissibility indicators is bounded by one in this upper comparison. A midpoint separation indicator outside the pin proposal can also be increased. On the support of the old nonzero integrand, its midpoint is separated from every old opponent, so the pinned collision estimate applies. Off that support the inequality is automatic. The capped expression (8.9) thus gives a valid bound everywhere.
  For a middle proposal the union bound gives $p^(-) - p lt.eq C sum beta_(l k)$ over its removed checks. For a pin the bound is $C sum \( beta_(l k) + m \( y \, X_k \) \)$. The proposal may be a coupled pair, but the removed checks involve one of its two marginals, and the uniform-midpoint insertion bounds apply to those marginals. Conditioning the original proposal does not enter this estimate of $p^(-) - p$.
  Multiplying the displayed ratio bounds over the affected transitions of both protocols gives $cal(R) lt.eq exp \( C \( B_(S T) + M_(S T) \) \)$. The inequalities $e^a - 1 lt.eq a e^a$ and (8.10) give both conclusions. Unaffected transitions have identical numerators and divisors at the same history. Thus the number of factors actually paid is bounded by the number of graph edges, not by the number of generated transitions. ◻
]

=== 8.4 Marginals of selected output paths <marginals-of-selected-output-paths>

Before multiplying likelihoods with shared labels, we record the precise form of reverse integration used for their common output coordinates. Only primary marginals of a coupled pair are bounded. Its full two-copy law has equal midpoints and is not dominated by a product of free bridges.

#thm([Lemma 8.5.])[
  (Selected outputs of sequential kernels).  #emph[Let $mu \( upright(d) x \)$ be a probability measure of latent variables, followed by a finite ordered list of subprobability kernels. At stage $r$ the kernel generates a primary variable $z_r$ and arbitrary auxiliary variables. Let $Q$ be a set of stages. Suppose that, for every latent input and every allowed preceding history, the primary marginal at $r in Q$ is at most $A_r nu_r \( x \, upright(d) z_r \)$, where $nu_r$ is a subprobability kernel depending on $x$ but not on the preceding history. Then the joint measure of the selected primary outputs is at most 
#[#set math.equation(numbering: n => "(8.15)")
 $ (product_(r in Q) A_r) integral mu \( upright(d) x \) product_(r in Q) nu_r \( x \, upright(d) z_r \) . $ <long:reverse-kernel>]

]
] <long:kernel>

#proof[
  Integrate an arbitrary nonnegative measurable test function of the selected outputs. Starting with the last stage, integrate every unselected stage using its mass bound one. At a selected stage integrate its auxiliary variables and use the primary marginal bound. The new test function depends on the latent input and the earlier selected outputs, but no longer on the history variables generated at this stage. Induction backwards through the finite list proves (8.15). The argument first applies to bounded tests and then to all nonnegative tests by monotone convergence. ◻
]

#thm([Lemma 8.6.])[
  (Uniform marginal bound).  #emph[Divide the separate output measure $M_S^(-)$ by its reference normalizer $Z_S^(-)$, and omit its original tag indicator if desired. For any $q$ specified primary output labels, its marginal is dominated by 
#[#set math.equation(numbering: n => "(8.16)")
 $ G_D^q ⨂_(l upright(" specified")) B_l \, #h(2em) G_D = C D^(C sqrt(x)) . $ <long:marginal-bound>]

 The same assertion holds for $T$, and the constants are independent of the number of unselected outputs.]
] <long:shared-density>

#proof[
  The normalized separate latent-original law is its admissible product bridge law. A middle stage, conditional on all these originals and on the preceding history, has primary marginal at most $C D^(C x) B_l$, by Corollary 22 and its acceptance probability at least $1 \/ 2$. A pin has primary conditional bridge law at most $2 upright(bold(1))_(upright("range")) \( y \) B_l \( upright(d) z divides z \( 0 \) = y \)$, where $y$ is the midpoint of its retained original partner and $upright(bold(1))_(upright("range")) \( y \) = upright(bold(1))_({ \| y - m_l \| lt.eq 8 b })$; all separation and avoidance indicators are discarded in this upper bound, so the retained cutoff is independent of the preceding history. This cutoff conditional bridge is the kernel $nu_r$ in Lemma 40. Both estimates hold uniformly in the history, including histories obtained after deleting some outside checks.
  Apply Lemma 40 to the specified stages. For each specified pin its source is a latent original in $S$: these sources lie in the right-silent suffix. The sources for distinct pins are distinct labels. If there are $p$ specified pins, their joint latent-source marginal is bounded by $C^p$ times the corresponding product bridge law, by Corollary 22. Indeed the uniform conditional one-path density bound survives integration over any other latent coordinates and can then be iterated over these $p$ coordinates.
  Let $a \( l \)$ be the source label of the pin with output label $l$. Integrating out all parts of its source other than the midpoint gives $g_(a \( l \)) \( y \) thin upright(d) y$. On the retained range, neighboring means and the Gaussian ratio bound (5.17) give $g_(a \( l \)) \( y \) lt.eq C D^(C sqrt(x)) g_l \( y \)$. Therefore
  $ integral upright(bold(1))_(upright("range")) \( y \) g_(a \( l \)) \( y \) B_l \( upright(d) z divides z \( 0 \) = y \) thin upright(d) y lt.eq C D^(C sqrt(x)) B_l \( upright(d) z \) . $
  Use this for each distinct source. Together with the middle-output bounds it proves (8.16). No assertion of independence between a pin and its source midpoint has been used: the midpoint is integrated against the conditional bridge before the resulting free bridge bound is obtained. ◻
]

=== 8.5 The product of two likelihoods <the-product-of-two-likelihoods>

#thm([Lemma 8.7.])[
  (Disjoint and shared changed sets).  #emph[At almost every fixed admissible outside of $U = S union T$, the likelihoods of the two original transports satisfy the following bounds. If $S \, T$ are disjoint, then 
#[#set math.equation(numbering: n => "(8.17)")
 $ bb(E) \[ L_S L_T divides U^c \] lt.eq bb(E) \[ h_(w \, j) h_(w \, j') divides U^c \] + C e^(C D^(- 19 \/ 100) J) #scale(x: 120%, y: 120%)[\(] B_(S T) + J_(*) b_D \( 1 + t^(- 3 \/ 2) \) #scale(x: 120%, y: 120%)[\)] . $ <long:disjoint-product>]

 If $q = \| S ∩ T \| gt.eq 1$, then 
#[#set math.equation(numbering: n => "(8.18)")
 $ bb(E) \[ L_S L_T divides U^c \] lt.eq e^(C D^(- 19 \/ 100) J) G_D^q \, $ <long:shared-product>]

 after increasing the fixed constant in $G_D$.]
] <long:product>

#proof[
  By (8.7) and the enlargement of the kernels, the conditional product integral is bounded by the integral using the free output measure $B_U$, the union admissibility indicator, and the single divisor $Z_U$. In each likelihood keep a separate set of latent original variables. These copies are not identified even if $S \, T$ have common labels. Only shared output coordinates are identified by the integration against $B_U$.
  Suppose first that the sets are disjoint. Apply Lemma 39, delete the union output-admissibility indicator in an upper bound, and integrate with the separate protocols. The term one in (8.14) has integral at most
  $ 1 / Z_U integral A_S^(-) \( x \) A_T^(-) \( x' \) h_(w \, j) \( x \) h_(w \, j') \( x' \) thin upright(d) B_S \( x \) upright(d) B_T \( x' \) . $
  Here the generated kernels were integrated using their mass bounds one. By (8.13) this is at most the reference expectation of $h_(w \, j) h_(w \, j')$, plus $C e^(C B_(S T)) B_(S T)$. The terms from $B_(S T)$ in (8.14) are bounded by the same normalizer ratio and the masses of the separate normalized protocols, each at most one.
  Consider one term $m \( y \, X_k \)$ of $M_(S T)$. Its midpoint $y$ belongs to a latent original of one separate protocol, whereas $X_k$ is an output path of the other. Conditional on the fixed outside the two extended protocol measures are independent. On the side providing $y$, drop its tag indicator and integrate all generated transitions. The marginal of the source original is bounded by a fixed constant times its free bridge. For every fixed point $z$, the Gaussian midpoint density then gives
  $ integral_(d \( y \, z \) lt.eq C_b) frac(g_l \( y \), s or d \( y \, z \)) thin upright(d) y & lt.eq parallel g_l parallel_oo integral_(\| u \| lt.eq 1) \| u \|^(- 1) thin upright(d) u + integral_(d \( y \, z \) > 1) g_l \( y \) thin upright(d) y\
 & lt.eq C \( 1 + t^(- 3 \/ 2) \) . $
  The local range $C_b$ suffices because all other checks vanish; nearby lifts or the periodized Gaussian give the same estimate. This calculation does not require a density bound for the opposing output midpoint. There are at most $C J_(*)$ such terms. Use (8.11) for the normalizer ratio and absorb its exponent using (8.10). This proves (8.17).
  For intersecting sets use (8.14). After dropping union admissibility, write the separate output measures as $Z_S^(-) f_S B_S$ and $Z_T^(-) f_T B_T$, with the original tag indicators included. Integrating unshared output coordinates leaves the product of their marginals on $A = S ∩ T$. By Lemma 41, one of these marginal densities is at most $G_D^q$; the other has integral at most one. Thus the free output integral is at most $Z_S^(-) Z_T^(-) G_D^q$. Division by $Z_U$, (8.12), and absorption of $C^q$ in $G_D^q$ prove (8.18). ◻
]

=== 8.6 Averaging labels, routes and endpoints <averaging-labels-routes-and-endpoints>

We now return to the original augmented reference and its left lift density $ell_(v \, w)$. It is zero on omitted first tags or rejected data. On retained data and first tag $i$ it is the sum of $L_S \/ T_w$ over the candidate second tags, averaged over the route and interior-label choices. Squaring this sum produces exactly two independent choices with common first tag $i$ and the same underlying data. In particular the data are never independently resampled when the likelihood is squared.

#thm([Lemma 8.8.])[
  (Endpoint sums and label matches).  #emph[At fixed retained data and route sites, the label average of the error in (8.17), together with the contribution of all choices having $S ∩ T eq.not diameter$, is at most 
#[#set math.equation(numbering: n => "(8.19)")
 $ C D^(- 1 + zeta \( x \)) J_(*) e^(delta_D J) \, #h(2em) delta_D arrow.r 0 \, #h(2em) zeta \( x \) arrow.r 0 quad \( x arrow.b 0 \) . $ <long:label-error>]

 This estimate includes the normalized sums over the three tag labels at their specified mean-sites. The remaining weight of each tag site is at most $C R^(- 3)$.]
] <long:label-average>

#proof[
  Every possible mean-site of an end tag lies in the corresponding $R$-cell enlarged by a fixed radius. At each site the number of eligible tags is at most $C f_0 D$, by the endpoint count estimate. Since $T_v = T_w = f_0 D R^3$, their counting sums with $h lt.eq 1$ are dominated by a site weight $C R^(- 3)$ and a label subprobability measure with maximum atom $C \/ \( D f_0 \)$. These are deterministic upper bounds at the fixed data; the site weights will be removed before any environmental expectation. Zero or very small tag families cause no problem: their extracted label measure simply has mass less than one. Interior selections are probability measures and have the same maximum-atom bound (8.3).
  For any fixed endpoint $z$, a dyadic decomposition of the endpoint count bound in Definition 18 gives, for a candidate label family in a bounded neighborhood,
  #[#set math.equation(numbering: n => "(8.20)")
   $ frac(C, D f_0) sum_l frac(1, s or d \( z \, Y_l \)) lt.eq C (1 + frac(D^(1 \/ 100), D f_0 s)) lt.eq C \, $ <long:endpoint-average>]
  and the same holds for the $Z$ endpoints. To see the first inequality, sum separately the innermost ball of radius $s$ and the shells $2^a s < d lt.eq 2^(a + 1) s lt.eq C_b$. The volume term sums as a geometric series of order $D f_0$, whereas the additive $D^(1 \/ 100)$ term sums to $C D^(1 \/ 100) \/ s$. Here $D^(1 \/ 100) \/ \( D f_0 s \) = D^(- 19 \/ 100 + x)$ is bounded for small $x$.
  Every edge contributing a $beta$ cost has a label choice on at least one side which is free to average: the common first tag is outside both changed sets. For an interior label use (8.20) conditional on the tags; for an end-tag label use the same bound in its candidate family at its fixed mean-site. Coincidence exclusions may be removed in this positive upper bound, because the reciprocal distance is capped at $s$. Thus each averaged $beta$ costs at most $C b_D$, and there are at most $C J_(*)$ edges. The midpoint cost in (8.17) has already been integrated. This bounds the disjoint error by
  $ C e^(C D^(- 19 \/ 100) J) J_(*) b_D \( 1 + t^(- 3 \/ 2) \) . $
  For the intersecting choices let $cal(E)$ be all pairs of slots in the two changed lists whose label choices could agree. Its cardinality is at most $C J_(*)$, with all such pairs among the $C J$ full contacts. Because each list has distinct labels, the actual matches form a matching: no slot belongs to two of them. The product label measure assigns each prescribed set of $h$ disjoint matches mass at most $\( C \/ \( D f_0 \) \)^h$. For interior matches, this follows by conditioning on the tags and then on one list, and using independence between sites in the other list. A tag can match an interior slot only at its one possible base site. For a match of the two second tags, sum one tag with the same maximum-atom bound. There are only two noncommon tag slots, so their exclusions change these bounds by a fixed factor per prescribed match, independent of the route length.
  The tag measures have mass at most one, so summing the remaining tag variables cannot increase this bound.
  Expand
  $ G_D^q = product_(e in cal(E)) #scale(x: 120%, y: 120%)[\(] 1 + \( G_D - 1 \) upright(bold(1))_({ e med upright("matched") }) #scale(x: 120%, y: 120%)[\)] . $
  To restrict to at least one match, designate one matched edge and bound the remaining product in the same way. The preceding probability bound and the elementary inequality $\( 1 + a \)^M lt.eq e^(a M)$ give
  #[#set math.equation(numbering: n => "(8.21)")
   $ bb(E)_(upright("labels")) \[ upright(bold(1))_({ q > 0 }) G_D^q \] lt.eq frac(C G_D, D f_0) J_(*) exp (frac(C G_D, D f_0) J) . $ <long:match-sum>]
  Use this in (8.18). Since $G_D \/ \( D f_0 \) = C D^(- 1 + x + C sqrt(x))$, the coefficient in this last exponent tends to zero. Absorb the fixed powers of $log D$ in an arbitrarily small power depending on $x$, and combine the two estimates. They have the form (8.19), with for example $delta_D = C D^(- 19 \/ 100) + C G_D \/ \( D f_0 \)$. This proves the lemma. ◻
]

The next step is the only place where the environment is averaged in the likelihood estimate. The two routes share that environment. For each deterministic common endpoint, Proposition 32 supplies

$ bb(E) \[ upright(bold(1))_(upright("retained")) e^(kappa J) \] lt.eq C \, #h(2em) bb(E)_(upright("sites")) bb(E) \[ upright(bold(1))_(upright("retained")) upright(bold(1))_({ J_(*) > 0 }) \] lt.eq C R^(- c_g) . $

The second average is over the two independent noncommon sites with weights at most $C R^(- 3)$ each. The deterministic bounds in Lemma 43 allow precisely this site average even though the actual candidate tag counts depend on the environment. For large $D$, $J^2 e^(2 delta_D J) lt.eq C_kappa e^(kappa J)$. As $J_(*) lt.eq J$, Cauchy–Schwarz consequently gives

#[#set math.equation(numbering: n => "(8.22)")
 $ bb(E)_(upright("sites")) bb(E) \[ upright(bold(1))_(upright("retained")) J_(*) e^(delta_D J) \] lt.eq C R^(- c_g \/ 2) . $ <long:route-average>]

Uniformity in the common endpoint permits its remaining average as well. Combining (8.19) and (8.22) bounds the averaged likelihood error by $C D^(- 1 + zeta \( x \) - w c_g \/ 2)$. Choose $x$ small enough that $zeta \( x \) < w c_g \/ 4$. This has a strict power saving beyond $D^(- 1)$.

#thm([Proposition 8.9.])[
  (Augmented moments).  #emph[For some $c_4 > 0$, the left augmented likelihood satisfies 
#[#set math.equation(numbering: n => "(8.23)")
 $ integral ell_(v \, w)^2 thin upright(d) P_(upright("aug") \, v) lt.eq bb(E) \[ T_v^(upright("rel")) \( T_w^(upright("rel")) \)^2 \] + C D^(- 1 - c_4) + o_K \( 1 \) $ <long:second-moment>]

 after averaging over $cal(A)_(K \, R)$. Its mass satisfies (8.5), and the same estimates hold with $v \, w$ exchanged.]
] <long:augmented-moments>

#proof[
  In the expansion of the squared likelihood keep the common first-tag factor $h_(v \, i) \/ T_v$. Conditional on the outside of $S union T$ it is fixed, because neither changed set contains $i$. Apply Lemma 42 to the two choices. The conditional expectation in its disjoint leading term is exactly the original expectation of the two end-tag indicators. All tag choices, route choices, and interior label choices are fixed independently of the latent paths, conditional on the data. We may therefore sum this leading term on the original path space. Removing all good-event and noncoincidence restrictions in this nonnegative upper bound yields
  $ bb(E) [(sum_i h_(v \, i) / T_v) (sum_j h_(w \, j) / T_w)^2] = bb(E) \[ T_v^(upright("rel")) \( T_w^(upright("rel")) \)^2 \] . $
  The errors and intersecting choices are controlled by Lemma 43 and (8.22). This proves (8.23). The mass bound is Lemma 37. For the right augmented estimate keep the same two-copy construction, and hence the same common measure. Reverse only the list indexing and designate the right copy primary; retain the actual chronological order of the generated middle kernels. Its common endpoint is then the last tag and its silent prefix is the previous silent suffix. The kernels pinned into the left copy can now be integrated out. The remaining right pins do not use them: the two end families lie in opposite copies, and no check joins the separated endpoint neighborhoods. Every kernel estimate and the reverse-integration lemma hold for an arbitrary fixed middle order, so this change of designation requires no resampling or reversal of the sampling order.
  The original retention also gives the event required for the reversed route comparison. The fixed endpoint cube $Q_v$ and its $10 R$ margin are bad-free. For every filled bad component, the actual first endpoint lies outside its fill by the original route event. Since $Q_v$ is nearest-neighbor connected and contains that endpoint, a path in $Q_v$ cannot enter the fill without meeting the bad component. Thus every site of $Q_v$ lies outside every such fill. The component-size cutoff is unchanged, so Proposition 32 applies with the common terminal endpoint and the noncommon endpoints in $Q_v$. The preceding calculation therefore gives the right augmented estimates for the original common measure. ◻
]

#proof[
  The augmented reference has mass $bb(E) T_v^(upright("rel"))$, while its common measure has mass $integral ell_(v \, w) thin upright(d) P_(upright("aug") \, v)$. Subtract twice the mass lower bound from the second-moment upper bound and add the reference mass. Proposition 44 gives
  #[#set math.equation(numbering: n => "(8.24)")
   $ integral \| ell_(v \, w) - 1 \|^2 thin upright(d) P_(upright("aug") \, v) lt.eq bb(E) \[ T_v^(upright("rel")) \( T_w^(upright("rel")) - 1 \)^2 \] + o \( D^(- 1) \) + o_K \( 1 \) $ <long:centered-second>]
  in the normalized pair average. The likelihood remains zero on the omitted reference events; their loss was included in the mass estimate.
  Outside the negligible count tails, $T_v^(upright("rel")) lt.eq C \/ f_0$. Lemma 25 and the uniform marginal weights of the ordered cell pairs therefore bound the main term of (8.24) by
  $ C D^x #scale(x: 120%, y: 120%)[\(] D^(- 1 - w \/ 6) + D^(- 1 + x) R^(- 3) #scale(x: 120%, y: 120%)[\)] lt.eq C #scale(x: 120%, y: 120%)[\(] D^(- 1 - w \/ 6 + x) + D^(- 1 + 2 x - 3 w) #scale(x: 120%, y: 120%)[\)] = o \( D^(- 1) \) . $
  The removed count tails remain negligible after multiplication by the relative counts, by the bookkeeping in Lemma 25. Choose $x < w \/ 12$, in addition to its preceding restrictions. The same centered bound holds in the right augmented reference.
  For finite measures $P$ and $nu lt.double P$ with likelihood $ell$, their squared Hellinger distance is $integral \( 1 - sqrt(ell) \)^2 thin upright(d) P lt.eq integral \( 1 - ell \)^2 thin upright(d) P$. Projection cannot increase this distance: conditional Cauchy–Schwarz increases the affinity and preserves both masses. Project both augmented comparisons to the common ordered bath. Their reference densities are $s_v^2$ and $s_w^2$, by Lemma 24, and their common projected density is that of $nu_(v w)$. The triangle inequality in $L^2$ and the two bounds (8.24) now imply (8.1). Every volume-dependent rejection was recorded as $o_K \( 1 \)$ at fixed dilution; taking that limit before $D arrow.r oo$ completes the assertion. ◻
]

== 9 Control of long-wavelength excitations <asm:section>

The local energy estimate controls excitations outside the space of functions constant on $R$-cells. We now use the two deletion comparisons to show that the remaining excitations, between that space and the single constant orbital, have density $o \( 1 \)$. The distant comparison makes cell root-mean-squares nearly constant; the local fourth-moment comparison relates those root-mean-squares to cell averages. This gives the estimate needed to pass from local observables to global momentum tests.

=== 9.1 A variance bound from distant pairs <a-variance-bound-from-distant-pairs>

We first remove the restriction on the pairs of $R$-cells in Proposition 36. This is a statement about arrays in a Hilbert space and has no ground-state assumption.

#thm([Lemma 9.1.])[
  (Distant pairs control the variance).  #emph[Let $cal(H)$ be a complex Hilbert space and let $f_z in cal(H)$, $z in \( bb(Z) \/ M bb(Z) \)^3$. Set 
$ I_M = { h in { 0 \, dots.h \, M - 1 } : .30 M lt.eq h lt.eq .45 M } \, #h(2em) overline(f) = M^(- 3) sum_z f_z . $

 For all sufficiently large $M$, there is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(9.1)")
 $ 1 / M^3 sum_z parallel f_z - overline(f) parallel_(cal(H))^2 lt.eq frac(C, M^3 \| I_M \| M^2) sum_z sum_(h_1 in I_M) sum_(h_2 \, h_3 in bb(Z) \/ M bb(Z)) parallel f_(z + h) - f_z parallel_(cal(H))^2 . $ <asm:far-variance>]

]
] <asm:far-pairs>

#proof[
  Use the unitary discrete Fourier transform on $\( bb(Z) \/ M bb(Z) \)^3$. The right-hand quadratic form before multiplication by $C$ has Fourier multiplier
  $ a_M \( k \) = frac(1, \| I_M \| M^2) sum_(h_1 in I_M) sum_(h_2 \, h_3) \| e^(2 pi i k dot.op h \/ M) - 1 \|^2 . $
  The variance on the left has multiplier one for $k eq.not 0$ and zero at $k = 0$, so it suffices to bound $a_M \( k \)$ below away from zero for $k eq.not 0$. If $k_2$ or $k_3$ is nonzero modulo $M$, orthogonality gives $a_M \( k \) = 2$. Otherwise, write $q = min \( k_1 \, M - k_1 \)$. For $q gt.eq 1$, the geometric-sum formula and $sin \( pi q \/ M \) gt.eq 2 q \/ M$ give
  $ lr(|frac(1, \| I_M \|) sum_(h in I_M) e^(2 pi i k_1 h \/ M)|) lt.eq C_0 / q . $
  Thus $a_M \( k \) gt.eq 1$ when $q gt.eq 2 C_0$. For each of the finitely many remaining positive $q$, the common value $a_M \( q \, 0 \, 0 \) = a_M \( M - q \, 0 \, 0 \)$ converges to
  $ 1 / .15 integral_.30^.45 \| e^(2 pi i q t) - 1 \|^2 thin upright(d) t > 0 . $
  Their minimum is positive, uniformly for large $M$. Parseval’s identity now proves (9.1), including Hilbert-valued arrays. ◻
]

For a fixed nonnegative ground vector $Phi$ and a cell $A in cal(C)_d union cal(C)_R$, the function $s_A$ of Lemma 24 belongs to $cal(H) = L^2 \( Lambda_K^(N - 1) \, upright(d) Y \)$. Explicitly,

#[#set math.equation(numbering: n => "(9.2)")
 $ s_A \( Y \) = (frac(V, \| A \|) integral_A Phi \( y \, Y \)^2 thin upright(d) y)^(1 \/ 2) . $ <asm:rms>]

Applying Lemma 45 with $M = K \/ R$ to Proposition 36 gives

#[#set math.equation(numbering: n => "(9.3)")
 $ frac(1, \| cal(C)_R \|) sum_(A in cal(C)_R) ∥s_A - frac(1, \| cal(C)_R \|) sum_(A') s_(A')∥_2^2 = o \( D^(- 1) \) + o_K \( 1 \) . $ <asm:rms-variance>]

The uniformity and order of limits are those of Section 2.

=== 9.2 From root-mean-squares to arithmetic means <from-root-mean-squares-to-arithmetic-means>

The occupation involves an integral of $Phi$, whereas $s_A$ is a root-mean-square of $Phi$. The next elementary inequality explains why the fourth-moment local comparison is enough to bridge this difference.

#thm([Lemma 9.2.])[
  (RMS interpolation).  #emph[For any finite nonempty array of nonnegative numbers $y_i$, with uniform averaging denoted by $bb(E)_i$, put $a = bb(E)_i y_i^2$ and $m = bb(E)_i y_i$. Then 
#[#set math.equation(numbering: n => "(9.4)")
 $ \( sqrt(a) - m \)^2 lt.eq 1 / 2 bb(E)_(i \, i') frac(\( y_i - y_(i') \)^4, y_i^2 + y_(i')^2) . $ <asm:rms-inequality>]

 The quotient is defined to be zero when its denominator is zero. Furthermore, for every $y \, z gt.eq 0$, 
#[#set math.equation(numbering: n => "(9.5)")
 $ \| sqrt(y) - sqrt(z) \|^4 lt.eq frac(\( y - z \)^4, y^2 + z^2) lt.eq 8 \| sqrt(y) - sqrt(z) \|^4 . $ <asm:sqrt-comparison>]

]
] <asm:rms-interpolation>

#proof[
  Let $Q$ denote the double average on the right of (9.4), before its factor $1 \/ 2$. Weighted Cauchy–Schwarz and independence of the two uniform indices give
  $ \[ 2 \( a - m^2 \) \]^2 = #scale(x: 120%, y: 120%)[\[] bb(E)_(i \, i') \( y_i - y_(i') \)^2 #scale(x: 120%, y: 120%)[\]]^2 lt.eq Q bb(E)_(i \, i') \( y_i^2 + y_(i')^2 \) = 2 a Q . $
  If $a > 0$, divide by $4 \( sqrt(a) + m \)^2 gt.eq 4 a$; the case $a = 0$ is immediate. For the second statement factor $y - z = \( sqrt(y) - sqrt(z) \) \( sqrt(y) + sqrt(z) \)$. The remaining ratio is $\( sqrt(y) + sqrt(z) \)^4 \/ \( y^2 + z^2 \)$, which lies between $1$ and $8$. ◻
]

For any two $d$-cells $z \, z'$ write

$ Q_(z \, z') \( Y \) = frac(\| s_z \( Y \) - s_(z') \( Y \) \|^4, s_z \( Y \)^2 + s_(z') \( Y \)^2) . $

For a nearest-neighbor edge $e = \( z \, z' \)$, abbreviate this as $Q_e$. Inside one $R$-cell, any two $d$-cells can be joined by a path of at most $3 R \/ d$ nearest-neighbor steps that stays in the cell. Put $t_z \( Y \) = sqrt(s_z \( Y \))$. If the path has $m$ edges, then (9.5) and Hölder’s inequality give

$ Q_(z \, z') lt.eq 8 \| t_z - t_(z') \|^4 lt.eq 8 m^3 sum_(e = \( v \, w \) upright(" on the path")) \| t_v - t_w \|^4 lt.eq 8 m^3 sum_(e upright(" on the path")) Q_e . $

Enlarging the last sum to all internal edges yields

#[#set math.equation(numbering: n => "(9.6)")
 $ Q_(z \, z') \( Y \) lt.eq C_j R^3 sum_(e upright(" internal edge of the ") R upright("-cell")) Q_e \( Y \) . $ <asm:path-fourth>]

The full internal edge sum bounds every pair, so no estimate of path multiplicities is needed. Averaging over pairs and over $R$-cells, and using $\| cal(C)_d \| \/ \| cal(C)_R \| = \( R \/ d \)^3$, consequently gives

#[#set math.equation(numbering: n => "(9.7)")
 $ & frac(1, \| cal(C)_R \|) sum_(A in cal(C)_R) frac(1, \| { z in cal(C)_d : z subset A } \|^2) sum_(z \, z' subset A) integral Q_(z \, z') thin upright(d) Y\
 & #h(20mm)  lt.eq C_j R^6 thin frac(1, \| cal(C)_d \|) sum_(e upright(" a nearest-neighbor edge")) integral Q_e thin upright(d) Y\
 & #h(20mm)  lt.eq C_j R^6 D^(- 1 - u \/ 8) + o_K \( 1 \) = o \( D^(- 1) \) + o_K \( 1 \) . $ <asm:all-local-pairs>]

The second inequality is Proposition 23. The last uses $6 w < u \/ 8$, which follows from (2.5). For fixed dilution the factor $R^6$ is fixed, so it causes no difficulty for the thermodynamic remainder.

Define

#[#set math.equation(numbering: n => "(9.8)")
 $ F \( y \, Y \) = sqrt(V) Phi \( y \, Y \) \, #h(2em) m_A \( Y \) = frac(1, \| A \|) integral_A F \( y \, Y \) thin upright(d) y . $ <asm:field-means>]

Spatial integrals of $F$ over the whole torus will use the normalized measure $upright(d) y \/ V$. For each cell, nonnegativity of $F$ implies $0 lt.eq m_A lt.eq s_A$, and

$ \( s_A - m_A \)^2 lt.eq s_A^2 - m_A^2 = frac(1, \| A \|) integral_A \| F - m_A \|^2 thin upright(d) y . $

It follows from (4.2) and bosonic symmetry that

#[#set math.equation(numbering: n => "(9.9)")
 $ frac(1, \| cal(C)_d \|) sum_(z in cal(C)_d) parallel m_z - s_z parallel_2^2 lt.eq parallel \( W_d \)_1 Phi parallel_2^2 = 1 / D 1 / V chevron.l upright(d) Gamma \( W_d \) chevron.r_Phi lt.eq D^(- 1) \( epsilon.alt_j + o \( 1 \) \) + o_K \( 1 \) \, $ <asm:micro-mean-rms>]

where $epsilon.alt_j arrow.r 0$ as $j arrow.r oo$, and the dilute remainder is taken at fixed $j$.

For an $R$-cell $A$, the number $s_A \( Y \)$ is the root-mean-square of the numbers $s_z \( Y \)$ over its $d$-cells. Let $overline(s)_A \( Y \)$ denote their arithmetic mean. Lemma 46 and (9.7) imply

#[#set math.equation(numbering: n => "(9.10)")
 $ frac(1, \| cal(C)_R \|) sum_A parallel s_A - overline(s)_A parallel_2^2 = o \( D^(- 1) \) + o_K \( 1 \) . $ <asm:R-rms-arithmetic>]

Also $m_A$ is the arithmetic mean of the $m_z$ in $A$. Jensen’s inequality, (9.9), and (9.10) therefore give

#[#set math.equation(numbering: n => "(9.11)")
 $ frac(1, \| cal(C)_R \|) sum_A parallel m_A - s_A parallel_2^2 lt.eq D^(- 1) \( 2 epsilon.alt_j + o \( 1 \) \) + o_K \( 1 \) . $ <asm:R-mean-rms>]

=== 9.3 The infrared estimate and arbitrary ground vectors <the-infrared-estimate-and-arbitrary-ground-vectors>

#thm([Proposition 9.3.])[
  (Remaining excitations).  #emph[Put $Q_R = P_R - P_0$. Uniformly over normalized, possibly complex, bosonic ground vectors, 
#[#set math.equation(numbering: n => "(9.12)")
 $ D parallel \( Q_R \)_1 Phi parallel_2^2 lt.eq 16 epsilon.alt_j + o \( 1 \) + o_K \( 1 \) \, $ <asm:infrared-bound>]

 where $epsilon.alt_j arrow.r 0$. The coefficient $16$ is independent of $j$; the dilute remainder may depend on $j$. The exponents $u \, w$ and the scale $R$ may be kept fixed when $j$ is increased; all dilute and volume thresholds may depend on $j$.]
] <asm:infrared>

#proof[
  First let $Phi gt.eq 0$. For Hilbert-valued arrays, the variance is the minimum of the mean squared distance to a constant array. Comparing the array $m_A$ with the mean of the array $s_A$ thus yields
  $ frac(1, \| cal(C)_R \|) sum_A parallel m_A - overline(m) parallel_2^2 lt.eq frac(2, \| cal(C)_R \|) sum_A parallel m_A - s_A parallel_2^2 + frac(2, \| cal(C)_R \|) sum_A parallel s_A - overline(s) parallel_2^2 . $
  Here bars without cell subscripts denote averages over all $R$-cells. The left side is exactly $parallel \( P_R - P_0 \)_1 Phi parallel_2^2$, by (9.8) and the normalized spatial measure. Equations (9.3) and (9.11) prove (9.12) for nonnegative vectors, with coefficient $4$ in place of $16$. The multiplication of a volume remainder by $D$ is harmless in the inner limit because $D arrow.r D_(*)$.
  For a real bosonic ground vector $f$, its positive and negative parts $f_(+) \, f_(-)$ belong to the Dirichlet form domain and remain symmetric. The Sobolev truncation identities give
  $ parallel f parallel_2^2 = parallel f_(+) parallel_2^2 + parallel f_(-) parallel_2^2 \, #h(2em) q \[ f \] = q \[ f_(+) \] + q \[ f_(-) \] . $
  Each nonzero part has Rayleigh quotient at least $E_N$, and their sum attains $E_N$. Both nonzero parts therefore attain $E_N$ and are ground vectors. Complex conjugation commutes with the operator, so the real and imaginary parts of a complex ground vector are ground vectors or zero. A normalized $Phi$ can consequently be written as
  $ Phi = sum_(a = 1)^m c_a Phi_a \, #h(2em) m lt.eq 4 \, quad Phi_a gt.eq 0 \, quad parallel Phi_a parallel_2 = 1 \, #h(2em) sum_(a = 1)^m \| c_a \|^2 = 1 \, $
  where each $Phi_a$ is a ground vector. Cauchy–Schwarz gives
  $ parallel \( Q_R \)_1 Phi parallel_2^2 lt.eq sum_(a = 1)^m parallel \( Q_R \)_1 Phi_a parallel_2^2 . $
  Thus at most a factor four is lost in the vanishing error in (9.12). No comparison of component phases or connectedness assumption is used. ◻
]

Because $P_0 lt.eq P_R$, $Q_R$ and $W_R$ are orthogonal projections with

#[#set math.equation(numbering: n => "(9.13)")
 $ 1 - P_0 = W_R + Q_R . $ <asm:orthogonal-decomposition>]

Consequently every normalized bosonic ground vector satisfies the exact identity

#[#set math.equation(numbering: n => "(9.14)")
 $ D \( 1 - B \( Phi \) \) = 1 / V chevron.l upright(d) Gamma \( W_R \) chevron.r_Phi + D parallel \( Q_R \)_1 Phi parallel_2^2 . $ <asm:depletion-decomposition>]

We record the conclusions in the per-volume normalization used for momentum observables:

#[#set math.equation(numbering: n => "(9.15)")
 $ 1 / V chevron.l upright(d) Gamma \( P_R - P_0 \) chevron.r_Phi & = D parallel \( P_R - P_0 \)_1 Phi parallel_2^2 = o \( 1 \) \,\
1 / V chevron.l upright(d) Gamma \( 1 - P_0 \) chevron.r_Phi & = D \( 1 - B \( Phi \) \) = frac(8, 3 sqrt(pi)) alpha^(3 \/ 2) + o \( 1 \) . $ <asm:coarse-density>]

Both remainders are uniform over normalized, possibly complex ground vectors in the iterated limit of Section 2. For the first, bosonic symmetry gives the equality, and Proposition 47 gives the error estimate: choose $j$ large and then increase the lower bound on $D$ and the volume threshold. The left side is independent of $j$, since $u \, w \, R$ remain fixed. The second follows from (9.14) and (4.2), whose energy estimate applies directly to complex ground vectors.

== 10 From local covariances to the momentum distribution <mom:section>

The local covariance estimate describes one-body operators inside a $B$-box, whereas momentum occupation is defined by Fourier modes on the whole torus. Translations connect these two descriptions: their expectations are the Fourier transform of the momentum measure. We first remove the remaining cell-constant excitations, then average the position of the $B$-box boundaries. This makes the cost of cutting a translation small compared with the excitation count.

=== 10.1 Translations and shifted box boundaries <translations-and-shifted-box-boundaries>

For a normalized ground vector $Phi$ on $Lambda_K$, put $u_(p \, K) \( y \) = V^(- 1 \/ 2) e^(i p dot.op y)$ and define the positive momentum measure

#[#set math.equation(numbering: n => "(10.1)")
 $ frak(m)_Phi = 1 / V sum_(p in \( 2 pi \/ K \) bb(Z)^3\
p eq.not 0) chevron.l u_(p \, K) \, gamma_Phi^(\( 1 \)) u_(p \, K) chevron.r thin delta_p . $ <mom:scaled-measure>]

Here $gamma_Phi^(\( 1 \))$ is the one-particle density matrix of $Phi$ and $delta_p$ is unit mass at $p$. Let $T_h g \( y \) = g \( y + h \)$ for $h in bb(R)^3$. Since $T_h u_(p \, K) = e^(i h dot.op p) u_(p \, K)$,

#[#set math.equation(numbering: n => "(10.2)")
 $ integral e^(i h dot.op p) thin upright(d) frak(m)_Phi \( p \) = 1 / V chevron.l upright(d) Gamma \( \( 1 - P_0 \) T_h \( 1 - P_0 \) \) chevron.r_Phi . $ <mom:translation-identity>]

Recall $Q_R = P_R - P_0$ and $1 - P_0 = W_R + Q_R$. The inputs from (4.2) and Proposition 47 give

#[#set math.equation(numbering: n => "(10.3)")
 $ a_Phi := 1 / V chevron.l upright(d) Gamma \( W_R \) chevron.r_Phi = O \( 1 \) \, #h(2em) b_Phi := 1 / V chevron.l upright(d) Gamma \( Q_R \) chevron.r_Phi = o \( 1 \) . $ <mom:excitation-masses>]

For the second assertion, the operators and exponents can be held fixed as $j$ increases; one chooses $j$ first and the dilution threshold afterward. Both assertions are uniform over all complex ground vectors. Expanding (10.2) and applying Cauchy–Schwarz to the sum over particles yields

#[#set math.equation(numbering: n => "(10.4)")
 $ lr(|integral e^(i h dot.op p) thin upright(d) frak(m)_Phi \( p \) - 1 / V chevron.l upright(d) Gamma \( W_R T_h W_R \) chevron.r_Phi|) lt.eq b_Phi + 2 sqrt(a_Phi b_Phi) = o \( 1 \) . $ <mom:remove-coarse>]

This bound is uniform in $h$. In particular, the subsequent boundary estimate will be multiplied by $a_Phi$, the excitation density.

Fix $H < oo$. Keep the $R$-grid fixed and let $cal(S)$ be the family of $B$-box partitions obtained by shifting the original grid by

$ theta in { 0 \, R \, dots.h \, B - R }^3 . $

Every partition in this family is still a union of the same $R$-cells. For $cal(C) in cal(S)$ define the translation cut at its box faces by

#[#set math.equation(numbering: n => "(10.5)")
 $ T_h^(cal(C)) = sum_(b in cal(C)) upright(bold(1))_b T_h upright(bold(1))_b . $ <mom:cut-translation>]

The average below is the uniform average over $cal(S)$.

#thm([Lemma 10.1.])[
  (Averaging box boundaries).  #emph[If $K > 2 \( B + H \)$ and $\| h \| lt.eq H$, then 
#[#set math.equation(numbering: n => "(10.6)")
 $ ∥T_h - "Avg"_(cal(C) in cal(S)) T_h^(cal(C))∥ lt.eq C frac(H + R, B) . $ <mom:shift-norm>]

]
] <mom:shift-average>

#proof[
  For fixed $y$, the difference is $T_h$ followed by multiplication by the fraction of partitions that put $y$ and $y + h$ in different boxes. In one coordinate, separation requires a box face between the two lifted coordinates. As the shift varies, possible faces are spaced by $R$, so at most $H \/ R + 2$ of the $B \/ R$ shifts separate the pair. A union bound over the three coordinates proves the uniform multiplier bound (10.6). The count also applies across the periodic boundary; the stated restriction on $K$ allows the interval to be lifted without ambiguity. Cell faces themselves are null sets. ◻
]

Figure 2 illustrates why the averaging is uniform in the position of the translated pair. Because $R \/ B arrow.r 0$ and $B arrow.r oo$, Lemma 48 and (10.3) imply

#[#set math.equation(numbering: n => "(10.7)")
 $ lr(|1 / V chevron.l upright(d) Gamma \( W_R T_h W_R \) chevron.r_Phi - "Avg"_(cal(C) in cal(S)) 1 / V chevron.l upright(d) Gamma \( W_R T_h^(cal(C)) W_R \) chevron.r_Phi|) lt.eq C frac(H + R, B) thin a_Phi = o \( 1 \) . $ <mom:boundary-cost>]

The number of shifted grids creates no additional factor in this estimate. The replacement of the full particle density $D$ by $a_Phi$ is essential, since $D \( H + R \) \/ B$ does not tend to zero at the chosen scales.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.308, 0), [#text(size: 9pt)[$theta =0$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (7.04, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.096), (0, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0.88, -0.096), (0.88, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((1.76, -0.096), (1.76, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((2.64, -0.096), (2.64, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((3.52, -0.096), (3.52, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, -0.096), (4.4, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((5.28, -0.096), (5.28, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((6.16, -0.096), (6.16, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((7.04, -0.096), (7.04, 0.096), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.232), (0, 0.232), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.52, -0.232), (3.52, 0.232), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((7.04, -0.232), (7.04, 0.232), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.212, 0.12), (3.916, 0.12), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  circle((3.212, 0.12), radius: 0.05292, fill: black, stroke: none)
  circle((3.916, 0.12), radius: 0.05292, fill: black, stroke: none)
  content((7.304, 0), [#text(size: 9pt)[cut]], anchor: "west", padding: 0.1176cm)
  content((-0.308, -0.8), [#text(size: 9pt)[$theta =R$]], anchor: "east", padding: 0.1176cm)
  line((0, -0.8), (7.04, -0.8), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.896), (0, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0.88, -0.896), (0.88, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((1.76, -0.896), (1.76, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((2.64, -0.896), (2.64, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((3.52, -0.896), (3.52, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, -0.896), (4.4, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((5.28, -0.896), (5.28, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((6.16, -0.896), (6.16, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((7.04, -0.896), (7.04, -0.704), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0.88, -1.032), (0.88, -0.568), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((4.4, -1.032), (4.4, -0.568), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.212, -0.68), (3.916, -0.68), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  circle((3.212, -0.68), radius: 0.05292, fill: black, stroke: none)
  circle((3.916, -0.68), radius: 0.05292, fill: black, stroke: none)
  content((7.304, -0.8), [#text(size: 9pt)[retained]], anchor: "west", padding: 0.1176cm)
  content((-0.308, -1.6), [#text(size: 9pt)[$theta =2R$]], anchor: "east", padding: 0.1176cm)
  line((0, -1.6), (7.04, -1.6), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, -1.696), (0, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0.88, -1.696), (0.88, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((1.76, -1.696), (1.76, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((2.64, -1.696), (2.64, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((3.52, -1.696), (3.52, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, -1.696), (4.4, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((5.28, -1.696), (5.28, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((6.16, -1.696), (6.16, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((7.04, -1.696), (7.04, -1.504), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((1.76, -1.832), (1.76, -1.368), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((5.28, -1.832), (5.28, -1.368), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.212, -1.48), (3.916, -1.48), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  circle((3.212, -1.48), radius: 0.05292, fill: black, stroke: none)
  circle((3.916, -1.48), radius: 0.05292, fill: black, stroke: none)
  content((7.304, -1.6), [#text(size: 9pt)[retained]], anchor: "west", padding: 0.1176cm)
  content((-0.308, -2.4), [#text(size: 9pt)[$theta =3R$]], anchor: "east", padding: 0.1176cm)
  line((0, -2.4), (7.04, -2.4), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, -2.496), (0, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0.88, -2.496), (0.88, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((1.76, -2.496), (1.76, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((2.64, -2.496), (2.64, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((3.52, -2.496), (3.52, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((4.4, -2.496), (4.4, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((5.28, -2.496), (5.28, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((6.16, -2.496), (6.16, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((7.04, -2.496), (7.04, -2.304), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((2.64, -2.632), (2.64, -2.168), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((6.16, -2.632), (6.16, -2.168), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.212, -2.28), (3.916, -2.28), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  circle((3.212, -2.28), radius: 0.05292, fill: black, stroke: none)
  circle((3.916, -2.28), radius: 0.05292, fill: black, stroke: none)
  content((7.304, -2.4), [#text(size: 9pt)[retained]], anchor: "west", padding: 0.1176cm)
  content((3.212, 0.344), [#text(size: 9pt)[$y$]], anchor: "south", padding: 0.1176cm)
  content((4.092, 0.344), [#text(size: 9pt)[$y+h$]], anchor: "south", padding: 0.1176cm)
  line((0, 1.04), (3.52, 1.04), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((1.76, 1.04), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$B=4R$]]])])
  line((5.28, 1.04), (6.16, 1.04), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((5.72, 1.04), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$R$]]])])
})],
  caption: [Figure 2: A one-dimensional section of the shifted partitions, with $B = 4 R$ and a fixed pair $y \, y + h$. Thin ticks mark the same $R$-grid in every row; thick ticks are the $B$-box faces. In the first row the translation crosses a box face and is cut. In the other three rows it stays inside one box. In general, only $O \( H \/ R + 1 \)$ of the $B \/ R$ shifts can separate a pair with $\| h \| lt.eq H$. Sandwiching the averaged error by $W_R$ makes its expectation cost proportional to the excitation density, as in (10.7). ],
) <fig:shifted-grid>

=== 10.2 The Fourier transform of the limiting density <the-fourier-transform-of-the-limiting-density>

Each cut translation acts separately on the $B$-boxes. We may therefore apply Proposition 16 to it. The remaining calculation identifies the Neumann-mode trace with the Fourier transform of $F_alpha$, defined in (4.10).

#thm([Proposition 10.2.])[
  (Momentum characteristic integrals).  #emph[For every fixed $H < oo$, 
#[#set math.equation(numbering: n => "(10.8)")
 $ integral e^(i h dot.op p) thin upright(d) frak(m)_Phi \( p \) = integral_(bb(R)^3) e^(i h dot.op p) F_alpha \( p \) frac(upright(d) p, \( 2 pi \)^3) + o \( 1 \) \, #h(2em) \| h \| lt.eq H . $ <mom:characteristic-limit>]

 The error is uniform in $h$ and in normalized, possibly complex, ground vectors, with the iterated-limit convention of Section 2.]
] <mom:characteristic>

#proof[
  Fix a shifted partition $cal(C)$. In local coordinates $\[ 0 \, B \)^3$, the restriction of $T_h^(cal(C))$ is the contraction
  $ \( C_(b \, h) g \) \( y \) = upright(bold(1))_(\[ 0 \, B \)^3) \( y + h \) g \( y + h \) . $
  It is identical in every box. Write $W$ for the restriction of $W_R$ to a box, and $e_p$ for its normalized Neumann cosine mode with $p in \( pi \/ B \) bb(N)_0^3$. Proposition 16, including its complex-contraction assertion, gives
  #[#set math.equation(numbering: n => "(10.9)")
   $ 1 / V chevron.l upright(d) Gamma \( W_R T_h^(cal(C)) W_R \) chevron.r_Phi = 1 / B^3 sum_(p eq.not 0) chevron.l e_p \, W C_(b \, h) W e_p chevron.r F_alpha \( p \) + o \( 1 \) . $ <mom:local-translation-trace>]
  The estimate applies uniformly to these shifted grids: simultaneous translation maps the ground space unitarily to itself, and the local bound is uniform over its normalized vectors.
  We compute the diagonal on a fixed annulus $0 < delta lt.eq \| p \| lt.eq J$. At least one coordinate has $\| p_i \| gt.eq delta \/ sqrt(3)$. The mean of its cosine over an $R$-interval is bounded by $2 \/ \( R \| p_i \| \)$, whereas each other cosine mean has absolute value at most one. Including the Neumann normalization factors and summing the squared cell means gives
  $ parallel \( 1 - W \) e_p parallel lt.eq frac(C, delta R) . $
  Since $C_(b \, h)$ is a contraction,
  #[#set math.equation(numbering: n => "(10.10)")
   $ chevron.l e_p \, W C_(b \, h) W e_p chevron.r = product_(i = 1)^3 cos \( p_i h_i \) + O (frac(1, delta R) + H / B) . $ <mom:Neumann-diagonal>]
  To verify the translation term, extend the cosine formula for $e_p$ to $bb(R)^3$. Removing the clipping changes its integral by $O \( H \/ B \)$: the boundary layer has relative volume $O \( H \/ B \)$ and $\| e_p \( y \) e_p \( y + h \) \| lt.eq C \/ B^3$. On the full box the integral factors. For $p_i > 0$, the sine–cosine integral over $\[ 0 \, B \]$ is zero because $p_i B in pi bb(N)$; the cosine-square integral gives $cos \( p_i h_i \)$. For $p_i = 0$ the factor is one.
  Uniformly for $alpha in I_alpha$, the explicit formula gives
  #[#set math.equation(numbering: n => "(10.11)")
   $ F_alpha \( p \) lt.eq C min \( \| p \|^(- 1) \, \| p \|^(- 4) \) . $ <mom:profile-majorant>]
  The normalized Neumann-lattice tails in (4.17) therefore bound the contributions of $0 < \| p \| lt.eq delta$ and $\| p \| gt.eq J$ by $C delta^2$ and $C \/ J$, respectively, uniformly in $B$, for $0 < delta < 1 < J$. The same bounds hold for the corresponding integrals.
  We can now truncate (10.9) to a fixed annulus, use (10.10), and take Riemann sums. The Neumann mesh has density $pi^(- 3)$ in the nonnegative octant. On the annulus the integrands are bounded and equicontinuous for $\| h \| lt.eq H$ and $alpha in I_alpha$; continuous cutoffs at its edges may be used. Letting $delta arrow.b 0$ and $J arrow.t oo$ after these estimates yields, uniformly in $h$ and $cal(C)$,
  #[#set math.equation(numbering: n => "(10.12)")
   $ 1 / V chevron.l upright(d) Gamma \( W_R T_h^(cal(C)) W_R \) chevron.r_Phi & = 1 / pi^3 integral_(\[ 0 \, oo \)^3) F_alpha \( p \) product_i cos \( p_i h_i \) thin upright(d) p + o \( 1 \)\
 & = integral_(bb(R)^3) F_alpha \( p \) e^(i h dot.op p) frac(upright(d) p, \( 2 pi \)^3) + o \( 1 \) . $ <mom:octant-Fourier>]
  The last equality uses reflection symmetry in each coordinate. Averaging over $cal(C)$ and applying (10.4) and (10.7) proves (10.8). ◻
]

=== 10.3 Physical units and bounded continuous tests <physical-units-and-bounded-continuous-tests>

The characteristic integrals include the total mass by taking $h = 0$. Fourier inversion will first give compact-test convergence. Together with total mass convergence and positivity, this controls the momentum tails and allows arbitrary bounded continuous test functions.

#proof[
  Fix $a > 0$. For a sufficiently small density $rho > 0$, put $eta = rho a^3$ and
  #[#set math.equation(numbering: n => "(10.13)")
   $ s_(*) = sqrt(frac(alpha_0, rho a)) \, #h(2em) D_(*) = rho s_(*)^3 = alpha_0^(3 \/ 2) / sqrt(eta) . $ <asm:physical-scale>]
  Choose $R \, B$ from this $D_(*)$ by (2.9). For any thermodynamic sequence $N_k \, L_k arrow.r oo$ with $N_k \/ L_k^3 arrow.r rho$, let $K_k$ be a positive multiple of $B$ nearest to $L_k \/ s_(*)$. Set
  $ s_k = L_k \/ K_k \, #h(2em) r_k = a \/ s_k \, #h(2em) D_k = N_k \/ K_k^3 \, #h(2em) alpha_k = D_k r_k . $
  Then $K_k arrow.r oo$, $s_k arrow.r s_(*)$, $D_k arrow.r D_(*)$, and $alpha_k arrow.r alpha_0$. Thus all the nested partitions and parameter conditions hold on the tail of every such sequence.
  The unitary change of variables is
  #[#set math.equation(numbering: n => "(10.14)")
   $ \( U_k Psi \) \( y_1 \, dots.h \, y_(N_k) \) = s_k^(3 N_k \/ 2) Psi \( s_k y_1 \, dots.h \, s_k y_(N_k) \) . $ <asm:unitary-scaling>]
  It maps the allowed sets and form domains to their scaled versions, with $q_(K_k \, r_k) \[ U_k Psi \] = s_k^2 q_(L_k \, a) \[ Psi \]$, and hence maps ground eigenspaces unitarily. The corresponding one-particle unitary sends a physical plane wave of momentum $kappa$ to the scaled one of momentum $p = s_k kappa$, preserving its occupation. Also
  #[#set math.equation(numbering: n => "(10.15)")
   $ D_k r_k^3 = \( N_k \/ L_k^3 \) a^3 arrow.r eta \, #h(2em) D_k sqrt(eta) arrow.r alpha_0^(3 \/ 2) . $ <asm:gas-identity>]
  Suppress $k$ temporarily. For a normalized physical ground vector $Psi$, put $Phi = U Psi$ and
  #[#set math.equation(numbering: n => "(10.16)")
   $ lambda = s sqrt(8 pi rho a) \, #h(2em) sigma_Psi = frac(1, D sqrt(eta)) \( p mapsto p \/ lambda \)_(*) frak(m)_Phi . $ <mom:physical-measure>]
  The normalized momentum sum in (1.2), evaluated in the pure state $\| Psi chevron.r chevron.l Psi \|$, is $integral f thin upright(d) sigma_Psi$. In the inner limit, $lambda arrow.r lambda_0 := sqrt(8 pi alpha_0)$. The target measure $sigma_0 := nu_(upright("Bog"))$ from (1.1) satisfies
  #[#set math.equation(numbering: n => "(10.17)")
   $ sigma_0 = \( p mapsto p \/ lambda_0 \)_(*) (alpha_0^(- 3 \/ 2) F_(alpha_0) \( p \) frac(upright(d) p, \( 2 pi \)^3)) . $ <mom:target-measure>]
  This follows by substituting $p = sqrt(8 pi alpha_0) thin t$ in the explicit formula (4.10).
  Apply Proposition 49 at $h \/ lambda$ and use (10.15). Since $lambda$ stays bounded away from zero, we obtain
  #[#set math.equation(numbering: n => "(10.18)")
   $ integral e^(i h dot.op t) thin upright(d) sigma_Psi \( t \) = integral e^(i h dot.op t) thin upright(d) sigma_0 \( t \) + o \( 1 \) \, $ <mom:physical-characteristic>]
  uniformly on each compact set of $h$ and uniformly over the ground vectors. Replacing $alpha \, lambda$ in the continuous integral by their inner limits costs only an inner-limit error: the majorant in (10.11) is integrable, and truncation in $p$ makes this replacement uniform on compact $h$-sets. The case $h = 0$ gives total mass convergence and, in particular, a uniform mass bound in the iterated limit.
  For $g in C_c^oo \( bb(R)^3 \)$, Fourier inversion and its integrable Fourier transform imply
  $ integral g thin upright(d) \( sigma_Psi - sigma_0 \) = o \( 1 \) . $
  Indeed, on a fixed compact Fourier set use (10.18); on its complement use the mass bound times the $L^1$ tail of the Fourier transform. Uniform approximation and the same mass bound give this conclusion for all $g in C_c \( bb(R)^3 \)$.
  Now let $f$ be any bounded continuous real function. Choose $chi in C_c^oo \( bb(R)^3 \)$ with $0 lt.eq chi lt.eq 1$ and $integral \( 1 - chi \) thin upright(d) sigma_0$ as small as desired. Positivity gives
  #[#set math.equation(numbering: n => "(10.19)")
   $ lr(|integral f thin upright(d) \( sigma_Psi - sigma_0 \)|) & lt.eq lr(|integral f chi thin upright(d) \( sigma_Psi - sigma_0 \)|)\
 & quad + parallel f parallel_oo {2 integral \( 1 - chi \) thin upright(d) sigma_0 + \| sigma_Psi \( bb(R)^3 \) - sigma_0 \( bb(R)^3 \) \| + lr(|integral chi thin upright(d) \( sigma_Psi - sigma_0 \)|)} . $ <mom:tightness>]
  The compact tests and the mass difference tend to zero in the stated iterated sense. For a prescribed $epsilon > 0$, first choose $chi$ and the compact-test approximations, then choose the auxiliary parameters and a lower threshold on $D_(*)$. Equation (10.13) turns that threshold into $rho_0 \( a \, f \, epsilon \) > 0$. It works for every fixed $0 < rho < rho_0$ and every density-convergent thermodynamic sequence. The volume threshold may depend on that fixed density and sequence; no convergence rate for $N_k \/ L_k^3$ is required.
  Finally, Lemma 3 makes every finite-volume ground eigenspace finite dimensional. Each state in $cal(G)_(N \, L \, a)$ has a spectral decomposition $Gamma = sum_b omega_b \| Psi_b chevron.r chevron.l Psi_b \|$ with normalized ground vectors, $omega_b gt.eq 0$, and $sum_b omega_b = 1$. Its momentum measure is $sum_b omega_b sigma_(Psi_b)$. The absolute error for $f$ is therefore at most the largest pure-state error at that volume. All preceding bounds were uniform in the pure ground vector, so the conclusion holds with the supremum over $Gamma in cal(G)_(N \, L \, a)$ required by the theorem. ◻
]

#heading(level: 1)[References]
#bibitem([1])[G.~Basti, M.~Brooks, S.~Cenatiempo, A.~Olgiati, and B.~Schlein, #emph[The Lee--Huang--Yang energy for a dilute gas of hard spheres: an upper bound], preprint (2026), #link("https://arxiv.org/abs/2603.13084v2")[arXiv:2603.13084v2].]
#bibitem([2])[G.~Basti, M.~Brooks, S.~Cenatiempo, A.~Olgiati, and B.~Schlein, #emph[Lee--Huang--Yang Energy for Dilute Bose Gases: an Upper Bound for General Potentials], preprint (2026), #link("https://arxiv.org/abs/2609.25314v1")[arXiv:2609.25314v1].]
#bibitem([3])[G.~Basti, S.~Cenatiempo, A.~Giuliani, A.~Olgiati, G.~Pasqualetti, and B.~Schlein, #emph[Upper Bound for the Ground State Energy of a Dilute Bose Gas of Hard Spheres], Arch. Ration. Mech. Anal. #strong[248] (2024), article~100. #link("https://doi.org/10.1007/s00205-024-02049-w")[doi:10.1007/s00205-024-02049-w].]
#bibitem([4])[G.~Basti, S.~Cenatiempo, and B.~Schlein, #emph[A new second-order upper bound for the ground state energy of dilute Bose gases], Forum Math. Sigma #strong[9] (2021), e74. #link("https://doi.org/10.1017/fms.2021.66")[doi:10.1017/fms.2021.66].]
#bibitem([5])[I.~Benjamini, R.~Pemantle, and Y.~Peres, #emph[Unpredictable paths and percolation], Ann. Probab. #strong[26] (1998), no.~3, 1198--1211. #link("https://doi.org/10.1214/aop/1022855749")[doi:10.1214/aop/1022855749].]
#bibitem([6])[C.~Boccato, C.~Brennecke, S.~Cenatiempo, and B.~Schlein, #emph[Bogoliubov theory in the Gross--Pitaevskii limit], Acta Math. #strong[222] (2019), no.~2, 219--335. #link("https://doi.org/10.4310/ACTA.2019.v222.n2.a1")[doi:10.4310/ACTA.2019.v222.n2.a1].]
#bibitem([7])[N.~N.~Bogoliubov, #emph[On the theory of superfluidity], J. Phys. (USSR) #strong[11] (1947), no.~1, 23--32.]
#bibitem([8])[C.~Brennecke, J.~Lee, and P.~T.~Nam, #emph[Second Order Expansion of Gibbs State Reduced Density Matrices in the Gross--Pitaevskii Regime], SIAM J. Math. Anal. #strong[56] (2024), no.~4, 5262--5284. #link("https://doi.org/10.1137/23M1608215")[doi:10.1137/23M1608215]. Numbered locators refer to #link("https://arxiv.org/abs/2310.05448v2")[arXiv:2310.05448v2].]
#bibitem([9])[E.~A.~Carlen, I.~Jauslin, and E.~H.~Lieb, #emph[Analysis of a Simple Equation for the Ground State of the Bose Gas II: Monotonicity, Convexity, and Condensate Fraction], SIAM J. Math. Anal. #strong[53] (2021), no.~5, 5322--5360. #link("https://doi.org/10.1137/20M1376820")[doi:10.1137/20M1376820]. Numbered locators refer to #link("https://arxiv.org/abs/2010.13882v3")[arXiv:2010.13882v3].]
#bibitem([10])[J.~L.~Doob, #emph[Conditional Brownian motion and the boundary limits of harmonic functions], Bull. Soc. Math. France #strong[85] (1957), 431--458. #link("https://doi.org/10.24033/bsmf.1494")[doi:10.24033/bsmf.1494].]
#bibitem([11])[F.~J.~Dyson, #emph[Ground-State Energy of a Hard-Sphere Gas], Phys. Rev. #strong[106] (1957), no.~1, 20--26. #link("https://doi.org/10.1103/PhysRev.106.20")[doi:10.1103/PhysRev.106.20].]
#bibitem([12])[S.~Fournais, #emph[Length scales for BEC in the dilute Bose gas], in #emph[Partial Differential Equations, Spectral Theory, and Mathematical Physics: The Ari Laptev Anniversary Volume], EMS Series of Congress Reports~18, EMS Press, 2021, 115--133. #link("https://doi.org/10.4171/ECR/18-1/7")[doi:10.4171/ECR/18-1/7].]
#bibitem([13])[S.~Fournais, L.~Junge, T.~Girardot, L.~Morin, M.~Olivieri, and A.~Triay, #emph[The free energy of dilute Bose gases at low temperatures interacting via strong potentials], #link("https://arxiv.org/abs/2408.14222v1")[arXiv:2408.14222v1] (2024). Published in Ann. Henri Poincaré (2026), #link("https://doi.org/10.1007/s00023-026-01676-1")[doi:10.1007/s00023-026-01676-1]. Numbered locators in this paper refer to the cited arXiv version.]
#bibitem([14])[S.~Fournais and J.~P.~Solovej, #emph[The energy of dilute Bose gases], Ann. of Math. (2) #strong[192] (2020), no.~3, 893--976. #link("https://doi.org/10.4007/annals.2020.192.3.5")[doi:10.4007/annals.2020.192.3.5].]
#bibitem([15])[S.~Fournais and J.~P.~Solovej, #emph[The energy of dilute Bose gases II: the general case], Invent. Math. #strong[232] (2023), no.~2, 863--994. #link("https://doi.org/10.1007/s00222-022-01175-0")[doi:10.1007/s00222-022-01175-0].]
#bibitem([16])[F.~Haberberger, C.~Hainzl, P.~T.~Nam, R.~Seiringer, and A.~Triay, #emph[The free energy of dilute Bose gases at low temperatures], preprint (2023), #link("https://arxiv.org/abs/2304.02405v2")[arXiv:2304.02405v2] (2024).]
#bibitem([17])[I.~Jauslin, #emph[The Simplified Approach to the Bose Gas Without Translation Invariance], J. Stat. Phys. #strong[191] (2024), article~88. #link("https://doi.org/10.1007/s10955-024-03299-4")[doi:10.1007/s10955-024-03299-4].]
#bibitem([18])[L.~Junge, #emph[Propagation of Condensation via Neumann Localization in the Dilute Bose Gas], preprint (2026), #link("https://arxiv.org/abs/2603.20776v1")[arXiv:2603.20776v1].]
#bibitem([19])[T.~D.~Lee, K.~Huang, and C.~N.~Yang, #emph[Eigenvalues and Eigenfunctions of a Bose System of Hard Spheres and Its Low-Temperature Properties], Phys. Rev. #strong[106] (1957), no.~6, 1135--1145. #link("https://doi.org/10.1103/PhysRev.106.1135")[doi:10.1103/PhysRev.106.1135].]
#bibitem([20])[E.~H.~Lieb and R.~Seiringer, #emph[Proof of Bose--Einstein Condensation for Dilute Trapped Gases], Phys. Rev. Lett. #strong[88] (2002), 170409. #link("https://doi.org/10.1103/PhysRevLett.88.170409")[doi:10.1103/PhysRevLett.88.170409].]
#bibitem([21])[E.~H.~Lieb, R.~Seiringer, and J.~Yngvason, #emph[Justification of $c$-Number Substitutions in Bosonic Hamiltonians], Phys. Rev. Lett. #strong[94] (2005), 080401. #link("https://doi.org/10.1103/PhysRevLett.94.080401")[doi:10.1103/PhysRevLett.94.080401].]
#bibitem([22])[E.~H.~Lieb and J.~P.~Solovej, #emph[Ground State Energy of the One-Component Charged Bose Gas], Comm. Math. Phys. #strong[217] (2001), 127--163. #link("https://doi.org/10.1007/s002200000353")[doi:10.1007/s002200000353].]
#bibitem([23])[E.~H.~Lieb and J.~Yngvason, #emph[Ground State Energy of the Low Density Bose Gas], Phys. Rev. Lett. #strong[80] (1998), no.~12, 2504--2507. #link("https://doi.org/10.1103/PhysRevLett.80.2504")[doi:10.1103/PhysRevLett.80.2504].]
#bibitem([24])[OpenAI, #emph[Ground-state condensation in the dilute hard-sphere gas], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Ground-state-condensation-in-the-dilute-hard-sphere-gas-September-24-2026/paper.pdf")[OAI:Ground-state-condensation-in-the-dilute-hard-sphere-gas-September-24-2026], 2026.]
#bibitem([25])[Á.~Timár, #emph[Boundary-connectivity via graph theory], Proc. Amer. Math. Soc. #strong[141] (2013), no.~2, 475--480. #link("https://doi.org/10.1090/S0002-9939-2012-11333-4")[doi:10.1090/S0002-9939-2012-11333-4]. Theorem locators refer to #link("https://arxiv.org/abs/0711.1713v2")[arXiv:0711.1713v2].]
#bibitem([26])[H.-T.~Yau and J.~Yin, #emph[The Second Order Upper Bound for the Ground Energy of a Bose Gas], J. Stat. Phys. #strong[136] (2009), 453--503. #link("https://doi.org/10.1007/s10955-009-9792-3")[doi:10.1007/s10955-009-9792-3].]


