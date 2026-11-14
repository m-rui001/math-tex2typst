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

#align(center)[#text(size: 16pt, weight: "bold")[Quantum Depletion for Fixed Bounded Repulsive Potentials]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Repulsive interactions move particles out of a Bose condensate even at zero temperature.
  For a dilute three-dimensional gas, Bogoliubov theory predicts a universal leading depletion,
  depending on the interaction only through its scattering length.
  We establish this prediction for fixed bounded radial repulsive potentials of finite range.
  The volume tends to infinity at each fixed density before the density tends to zero.

=== 1.1 The model and the result <the-model-and-the-result>

We use units in which $ℏ^2 \/ \( 2 m \) = 1$. Let $v : bb(R)^3 arrow.r \[ 0 \, oo \)$ be bounded, measurable,
  radial, and compactly supported, and suppose that $v$ is nonzero on a set of positive measure.
  Its scattering length $a_v > 0$ is determined by the radial solution of

$ \( - Delta + 1 / 2 v \) f = 0 \, wide f \( x \) = 1 - frac(a_v, \| x \|) quad
  upright("for sufficiently large ") \| x \| . $

On the torus $Lambda_L = \( bb(R) \/ L bb(Z) \)^3$, set

$ v_L \( x \) = sum_(z in bb(Z)^3) v \( x + L z \) \, wide H_(N \, L)^v = sum_(j = 1)^N \( - Delta_j \) +
  sum_(i < j) v_L \( x_i - x_j \) \, $

acting on $L_(upright("sym"))^2 \( Lambda_L^N \)$ with periodic boundary conditions.
  Write $cal(G)_(N \, L)^v$ for the positive trace-one operators supported on its lowest eigenspace.
  For $Gamma in cal(G)_(N \, L)^v$, define

$ gamma_Gamma^(\( 1 \)) = N "Tr"_(2 \, dots.h \, N) Gamma \, wide u_0 = L^(- 3 \/ 2) \, wide B_Gamma =
  frac(chevron.l u_0 \, gamma_Gamma^(\( 1 \)) u_0 chevron.r, N) . $

Thus $B_Gamma$ is the occupation fraction of the constant orbital and $1 - B_Gamma$ is its depletion.

#thm([Theorem 1.1.])[
  #emph[For every potential $v$ satisfying the assumptions above and every $epsilon.alt > 0$,
    there is $rho_0 \( v \, epsilon.alt \) > 0$ such that, for every fixed $0 < rho <
    rho_0 \( v \, epsilon.alt \)$ and every sequence $N_k \, L_k arrow.r oo$ with $N_k \/ L_k^3 arrow.r rho$,
$ limsup_(k arrow.r oo) med sup_(Gamma in cal(G)_(N_k \, L_k)^v)
  lr(|frac(1 - B_Gamma, sqrt(rho a_v^3)) - frac(8, 3 sqrt(pi))|) lt.eq epsilon.alt . $

]
] <thm:main>

The potential remains fixed throughout both limits. In particular,
  the statement applies to every thermodynamic accumulation value of the occupation;
  existence of an occupation limit at each positive density is not required.
  Neither monotonicity of the radial potential nor positivity of its Fourier transform is assumed.
  Boundedness makes the finite-volume heat semigroup positivity improving, so the ground state is in fact unique.
  The formulation with density matrices records the occupation observable without a choice of ground-state vector.

=== 1.2 Historical context and antecedents <historical-context-and-antecedents>

Bogoliubov’s quasiparticle theory describes the excitations and depletion of a weakly interacting
  condensate #cite(label("Bogoliubov")). Lee, Huang, and Yang calculated the leading depletion and the
  second-order energy of a dilute hard-sphere gas #cite(label("LHY")).
  The two predictions concern different features of the many-particle ground state:
  its energy and its one-body density matrix. In the ordinary thermodynamic limit,
  long-wavelength particles can have arbitrarily small kinetic energy.
  Consequently, an accurate energy expansion does not by itself determine the occupation of the constant orbital.

The rigorous energy theory began with Dyson’s upper and lower bounds for hard spheres #cite(label("Dyson")).
  Lieb and Yngvason proved the matching leading lower bound for repulsive
  interactions #cite(label("LiebYngvason")). Yau and Yin obtained the Lee–Huang–Yang upper bound for smooth
  repulsive potentials #cite(label("YauYin")); Basti, Cenatiempo,
  and Schlein extended the upper bound to nonnegative radial compactly supported $L^3$ interactions,
  with a power-saving remainder #cite(label("BCSUpper")). Fournais and Solovej proved the corresponding lower
  bound, first for integrable interactions and then in a class including hard cores #cite(label("FS2020"))
  #cite(label("FS2023")). The sharp hard-sphere upper bound was subsequently obtained by Basti, Brooks,
  Cenatiempo, Olgiati, and Schlein #cite(label("BBCOS")). For the present class of potentials,
  we use the upper bound of #cite(label("BCSUpper")) Theorem 1.1 and retain the additional positive operators in a
  local lower bound to recover occupation observables.

Condensation and depletion are also understood in regimes where the spatial and dilute limits are linked.
  Lieb and Seiringer proved complete condensation for trapped gases in the Gross–Pitaevskii
  limit #cite(label("LS2002")). Boccato, Brennecke, Cenatiempo,
  and Schlein determined the depletion in a periodic unit box with scattering length of order
  $N^(- 1)$ #cite(label("BBCS")) Appendix A. Their answer is a discrete Bogoliubov momentum sum.
  Results of Fournais and later developments extend condensation estimates to boxes larger than the healing
  length #cite(label("Fournais2021")) #cite(label("Junge2026")).
  Such estimates do not directly control the ordinary thermodynamic limit,
  in which the one-particle gap closes at every fixed density.
  For fixed bounded interactions, the companion #cite(label("C")) establishes condensation at sufficiently small
  fixed densities and sufficiently low positive temperatures, and supplies the local density tails used here.
  The companion #cite(label("D")) establishes the depletion asymptotic for hard spheres.
  The present proof adapts its separation of local energy estimates from long-distance comparisons to bounded
  interactions.

Several established methods enter that adaptation. The energy analysis uses scattering-renormalized positive
  squares, Neumann localization, and Bogoliubov diagonalization,
  as developed in #cite(label("FS2020")) #cite(label("FS2023")) and in the low-temperature free-energy work
  #cite(label("HHNST")) #cite(label("FJGMOTr")). The coherent-state substitution has the standard upper-symbol
  corrections of Lieb, Seiringer, and Yngvason #cite(label("LSY2005")).
  The probabilistic comparison averages a change of law over routes before taking its moments.
  This has a direct antecedent in the deletion-tolerance argument of Peres and Sly #cite(label("PeresSly"))
  Proposition 2.1. Its geometric ingredient is the unpredictable-path method of Benjamini, Pemantle,
  and Peres #cite(label("BPP")), which produces paths with exponentially decaying intersection tails.
  The precise finite-volume version, with rare encounters away from an endpoint,
  is supplied by #cite(label("D")) Proposition 7.1.

=== 1.3 From local occupations to the constant mode <from-local-occupations-to-the-constant-mode>

Here is the obstruction and the division of the proof. Let $Psi$ be the positive normalized ground function.
  For a partition of the torus into cubes of side $ell$, let $P_ell$ be the one-particle projection onto functions
  constant on each cube, and let $P_0$ project onto the single global constant.
  Since $P_0 lt.eq P_ell$, the depletion splits exactly as

#[#set math.equation(numbering: n => "(1.1)")
 $ 1 - B_(\| Psi chevron.r chevron.l Psi \|) = chevron.l Psi \, \( 1 - P_ell \)_1 Psi chevron.r +
   parallel \( P_ell - P_0 \)_1 Psi parallel^2 . $ <eq:intro-split>]

The subscript indicates action on the first particle. The first term measures variations inside the cubes;
  the second measures variations between their mean values.

For a suitable mesoscopic choice of $ell$, Section 3 determines the first term at the depletion scale,
  together with second and fourth moments of particle counts.
  The argument follows the occupation estimates in #cite(label("D")) Section 3,
  but deals directly with the bounded potential. In particular,
  the Neumann mirror interaction is compared with the original interaction in expectation using a two-particle
  bound. This avoids a pointwise radial-monotonicity comparison.
  The local lower bound retains both a kinetic gap and positive quasiparticle terms;
  these are needed to transfer the energy calculation to the one-body observable in (1.1).

The second term requires information that is uniform in the total volume.
  To obtain it, condition a distinguished particle to lie in a specified cube and integrate out its position.
  The resulting law of the other $N - 1$ particles has density proportional to the cube average of $Psi^2$.
  Comparing these deletion laws controls the spatial variation of the root mean squares of $Psi$.
  A local comparison of deletion laws, together with a fine-scale energy estimate,
  then connects those root mean squares to the arithmetic means appearing in $P_ell Psi$.

Sections 4–6 perform these comparisons using ground-state Brownian paths.
  The construction pairs the midpoints of paths in two copies so that deleting different endpoint particles leaves
  exactly the same observed particles. For a bounded interaction the conditional path law has Boltzmann weights.
  We represent each weight by an auxiliary uniform-variable test and keep these tests in every conditional
  normalization. This gives the exact interacting law while allowing the collision estimates used in the
  hard-sphere construction. The density tails of #cite(label("C")) Lemmas 4.2 and 4.3 replace the deterministic
  count bounds available for hard spheres.

Two different accuracies are needed. A fourth-moment comparison between neighboring small cubes controls the
  passage from fine to coarse averages. A second-moment comparison between distant cubes controls the remaining
  variation across the entire torus. For the latter, routes may have arbitrarily many steps.
  The estimate therefore charges only encounters between two independently sampled routes,
  rather than one fixed loss at each step. In the copy used to measure the change of law,
  paths near the common endpoint remain unchanged. The route theorem makes encounters between the changed portions
  rare. These conditional-law and normalization estimates extend the local and distant comparisons of
  #cite(label("D")) Sections 5, 6, and 8 to bounded repulsion; the hard-sphere depletion theorem itself is not an input.

Section 2 fixes the scales and states the density-tail inputs.
  Section 3 proves the local occupation and count estimates, Section 4 constructs the conditional path law,
  and Sections 5 and 6 prove the two deletion comparisons. Section 7 combines them through (1.1) and restores the
  original units and order of limits.

== 2 Scales, density tails, and ground-state paths <sec:setup>

We first choose units in which the interaction range is small, the particle density is large,
  and the healing length is of order one. Two local density-tail estimates will then supply the moment and pair
  bounds used throughout the paper. Their first use is to control the boundary correction in the energy
  calculation of Section 3.

=== 2.1 Ground states and scaled variables <ground-states-and-scaled-variables>

For finite $N \, L$, the potential in the Hamiltonian is a bounded multiplication operator.
  The heat kernel on the labelled configuration torus is strictly positive,
  and the Feynman–Kac formula preserves this positivity. Compact resolvent and positivity improvement therefore
  give a unique normalized positive ground function. Permutations of coordinates and simultaneous translations
  commute with the Hamiltonian. Uniqueness implies that this ground function is symmetric and translation
  invariant. In particular the bosonic ground space is one-dimensional.
  We shall use positivity when comparing spatial arithmetic means with root mean squares in Section 7.

Let $R_v > 0$ contain the support of the physical potential $v$, and use a length unit $sigma > 0$.
  In the resulting coordinates set

#[#set math.equation(numbering: n => "(2.1)")
 $ K = L \/ sigma \, wide V = K^3 \, wide D = N \/ V \, wide a = a_v \/ sigma \,\
alpha = D a \, wide r = R_v \/ sigma \, wide W \( y \) = sigma^2 v \( sigma y \) . $ <eq:scaled-variables>]

The scaled Hamiltonian has kinetic energy $- Delta$ and pair potential $W$, periodized on the torus of side $K$.
  Its normalized positive ground function is denoted by $Phi$, and

$ mu \( thin upright(d) X \) = Phi \( X \)^2 thin upright(d) X . $

Integrals in all particle coordinates use Lebesgue measure.
  We write $chevron.l O chevron.r_psi = chevron.l psi \, O psi chevron.r$;
  this notation does not normalize a vector that is not already normalized.

Fix a sufficiently large constant $B_0$, depending on $v$, and put

#[#set math.equation(numbering: n => "(2.2)")
 $ sigma_(*) = B_0 rho^(- 1 \/ 2) \, wide D_(*) = rho sigma_(*)^3 = B_0^3 rho^(- 1 \/ 2) \, wide alpha_0 =
   a_v B_0^2 . $ <eq:physical-base-scale>]

Along the thermodynamic sequence we choose $sigma arrow.r sigma_(*)$, as specified below.
  Then $D arrow.r D_(*)$ and $alpha arrow.r alpha_0$. All estimates are uniform for $alpha$ in a fixed compact
  positive neighborhood of $alpha_0$. Constants may depend on the fixed potential and this neighborhood. In these units,

#[#set math.equation(numbering: n => "(2.3)")
 $ a asymp r asymp D^(- 1) \, wide integral_(bb(R)^3) W lt.eq C D^(- 1) \, wide 0 lt.eq W lt.eq
   C D^2 . $ <eq:potential-scales>]

A bounded measurable radial potential can be replaced by a Borel version with its range and radial bounds holding
  everywhere. Such null changes affect neither the operator nor the Brownian path integrals.

Choose small exponents $u > 0$ and $0 < w < u \/ 10000$, and let

#[#set math.equation(numbering: n => "(2.4)")
 $ R = ceil.l D_(*)^w ceil.r \, wide B = R ceil.l D_(*)^u \/ R ceil.r \, wide d =
   1 \/ j quad \( j in bb(N) \) . $ <eq:partition-scales>]

The fixed microcell size $d$ resolves variation within cells.
  The slowly growing scale $R$ is used for the distant deletion comparison,
  while the still larger $B$-boxes give the energy calculation room to resolve variation on the $R$-scale.
  For each fixed $j$, the dilute hierarchy is $r lt.double d lt.eq 1 lt.double R lt.double B$.
  All partition sizes are fixed during the thermodynamic limit, when $K arrow.r oo$;
  $j$ is sent to infinity only after the estimates at each fixed $j$.

The restrictions on $u$ arise in the energy estimates; it may be taken smaller than $10^(- 9)$ and decreased
  further there. The path exponent $x > 0$ will be chosen after $u \, w$.
  At fixed $rho$, choose $K$ to be the nearest positive multiple of $B$ to $L \/ sigma_(*)$ and set $sigma =
  L \/ K$. This gives the asserted convergence of $sigma$ on a tail of every thermodynamic sequence.

We use nested cubic partitions $cal(C)_l$ of the scaled torus for $l = B \, R \, 1 \, d$.
  Unit cells $U_z$ are centered at $z in cal(L) = \( bb(Z) \/ K bb(Z) \)^3$,
  with compatible half-open conventions on boundaries. If $A$ is a spatial set, $n_A$ denotes its particle count.
  Let $P_l$ be the one-body orthogonal projection onto functions constant on every cell of $cal(C)_l$, and set

#[#set math.equation(numbering: n => "(2.5)")
 $ W_l = 1 - P_l \, wide upright(d) Gamma \( O \) = sum_(i = 1)^N O_i . $ <eq:cell-projections>]

Thus $W_l$ is a projection, whereas $W$ without a subscript is the pair potential.
  Averages over cells or cell pairs are uniform unless a different measure is specified.

===== 2.1.1 Limit convention. <limit-convention.>

We always take the thermodynamic limsup at fixed $rho$ first, followed by $rho arrow.b 0$,
  equivalently $D_(*) arrow.r oo$. A term $o_K \( 1 \)$ tends to zero in the first limit;
  a dilute $o \( 1 \)$ tends to zero after that limsup. Power bounds in $D$ hold for all sufficiently large
  $D_(*)$ and sufficiently far in the corresponding inner sequence.
  Terms tending to zero only in the inner limit can therefore be absorbed into a stated power bound on a tail.
  No uniform rate in that sequence is required. Constants and thresholds in estimates involving $d$ may depend on
  the fixed integer $j$.

=== 2.2 Local density tails <local-density-tails>

We use two results from the bounded-interaction companion #cite(label("C")).
  We record both the physical form of the input and the consequence needed here,
  so that the dependence on temperature and volume is explicit.
  For a canonical Gibbs state let its position law be the diagonal of its density matrix.

#thm([Proposition 2.1.])[
  (Density-tail input from #cite(label("C"))).  #emph[Let $v$ satisfy the hypotheses of Theorem 1.
    There is a sufficiently large fixed $B_0$ such that, for all sufficiently small $rho > 0$,
    the following statements hold at physical base length $b = B_0 rho^(- 1 \/ 2)$ and count scale $n = rho b^3$.]
  + #emph[If the particle density is at most $2 rho$, let $A = sum_i g \( x_i \)$, where $0 lt.eq g lt.eq 1$,
    the support of $g$ is covered by $J$ base cubes, and $\| nabla g \|^2 lt.eq
    C_g b^(- 2) g$ almost everywhere for a prescribed fixed bound on $C_g$. Then
$ bb(P) \( A > M \) lt.eq C e^(- c M) \, wide M gt.eq C n J . $

 Sharp counts have such majorants after a fixed enlargement and a fixed increase in $J$.]
  + #emph[If the density lies in $\[ rho \/ 2 \, 2 rho \]$ and $Q_1 \, dots.h \,
    Q_J$ are cubes of side $b$ with centers separated by a sufficiently large fixed multiple of $b$, then
$ bb(P) (sum_(i = 1)^J n_(Q_i) lt.eq epsilon.alt_0 n J) lt.eq e^(- c_1 n J) $

 for fixed $epsilon.alt_0 \, c_1 > 0$.]
  #emph[Both assertions hold in all sufficiently large volumes,
    uniformly down to arbitrarily small positive temperatures.
    Their volume thresholds do not grow as temperature decreases.
    Fixed positive multiplicative changes in cube sides are allowed after changing constants,
    and $B_0$ can be increased to meet any finite list of lower bounds.]
] <prop:density-input>

The density-tail inputs are supplied by the localized density and occupation estimates of #cite(label("C"))
  Lemmas 4.2 and 4.3; for the upper tail we take exponential parameter one.
  Their proofs use local energy and entropy estimates and a localized replacement argument.
  They do not require a condensation or depletion conclusion.
  Their temperature uniformity lets us apply them to the ground state at each fixed finite volume:
  canonical Gibbs states converge in trace norm to its rank-one projection as temperature tends to zero.

#thm([Lemma 2.2.])[
  (Scaled count tails).  #emph[After fixing $B_0$ and decreasing $rho$ if necessary,
    there are positive constants $c \, c' \, C$ such that, for every nonempty $A subset cal(L)$,
#[#set math.equation(numbering: n => "(2.6)")
 $ bb(P)_mu (sum_(z in A) n_(U_z) gt.eq b) & lt.eq C e^(- c b) \, &  & b gt.eq C D \| A \| \,\
bb(P)_mu (n_(U_z) < c' D upright(" for every ") z in A) & lt.eq e^(- c D \| A \|) . $ <eq:count-tails>]

]
] <lem:count-tails>

#proof[
  The physical side of a scaled unit cell is $sigma arrow.r b$, and $D asymp D_(*)$.
    A fixed enlargement covers any union of the given unit cells by $O \( \| A \| \)$ base cubes,
    proving the first bound from Proposition 2(i). For the second,
    a bounded coloring of the unit lattice extracts a subset of $A$ of size at least $c_0 \|
    A \|$ whose cells have the separation required in part (ii).
    If every original count is below $c' D$, their sum on this subset is below the threshold of part (ii) when
    $c'$ is small enough. The allowed fixed side adjustments handle either sign of $sigma - b$.
    The actual physical density eventually lies in $\[ rho \/ 2 \, 2 rho \]$.
    This proves both claims uniformly on a tail of the thermodynamic sequence. ◻
]

For $A subset cal(L)$ define

$ F_A \( X \) = sum_(i = 1)^N e^(- d_K \( x_i \, A \)) \, wide F_diameter = 0 \, $

where $d_K$ denotes torus distance and the sites of $A$ are regarded as points of the torus.
  The tails imply the exponential moment bound

#[#set math.equation(numbering: n => "(2.7)")
 $ log bb(E)_mu e^(h F_A) lt.eq C h D \| A \| wide \( 0 lt.eq h lt.eq h_(*) \) \, $ <eq:count-mgf>]

for a fixed $h_(*) > 0$. Indeed the upper tail first gives this statement for the sharp count in a site set and
  one small positive value of $h$; convexity extends it to the interval from zero.
  The sites at distance at most $m + 1$ from $A$ number at most $C \( 1 + m \)^3 \| A \|$.
  Write the exponentially weighted count as a sum of counts in these enlargements,
  with exponentially decaying coefficients. Jensen’s inequality with normalized summable weights and the
  sharp-count bound prove (2.7). The same proof works if distance is multiplied by any fixed positive constant.

In particular, each fixed $q$th moment of a count in a fixed number of unit cells is $O \( D^q \)$.
  Counts in polynomially many cells have polynomial fixed moments.
  If one of those cells exceeds a sufficiently large fixed multiple of $D$,
  its probability is exponentially small in $D$. Cauchy–Schwarz therefore makes every fixed product of these
  counts on that exceptional event smaller than every power of $D^(- 1)$.
  We will use this observation when removing count cutoffs.

=== 2.3 Ground-state paths and local pair bounds <ground-state-paths-and-local-pair-bounds>

Let $E_m$ be the ground energy of $m$ particles on the scaled torus, with the same potential $W$.
  Adjoining a constant last coordinate to a normalized $\( m - 1 \)$-particle trial function gives

#[#set math.equation(numbering: n => "(2.8)")
 $ E_m - E_(m - 1) lt.eq frac(m - 1, V) integral W lt.eq C quad \( m lt.eq N \) \, wide E_N - E_(N - m) lt.eq
   C m . $ <eq:removal-energy>]

This trial need not be symmetric: the positive ground energy on the labelled space equals the bosonic ground
  energy by the uniqueness already proved.

For $0 < T lt.eq 1$, consider independent torus Brownian motions on $\[ - T \, T \]$ with generator $Delta$ and
  initial Lebesgue measure. Weight their joint law by

#[#set math.equation(numbering: n => "(2.9)")
 $ e^(2 T E_N) Phi \( omega \( - T \) \) Phi \( omega \( T \) \) product_(i < k) exp
   [- integral_(- T)^T W \( omega_i \( q \) - omega_k \( q \) \) thin upright(d) q] . $ <eq:ground-path-law>]

Here and below the pair potential in torus expressions is periodized.
  The Feynman–Kac formula makes (2.9) a probability measure with marginal $mu$ at every time.
  Restrictions to shorter slabs are consistent, by the ground-state eigenfunction identity.

#thm([Lemma 2.3.])[
  (Free-path domination).  #emph[If $m$ specified labels carry nonnegative single-path weights $H_i$ that are
    invariant under time reversal, then under (2.9),
#[#set math.equation(numbering: n => "(2.10)")
 $ bb(E) product_(i = 1)^m H_i \( omega_i \) lt.eq e^(C m) integral mu \( thin upright(d) Y \) product_(i = 1)^m
   bb(E)_(upright("free"))^(Y_i) H_i . $ <eq:path-domination>]

 A weight without reversal symmetry can be replaced by the sum of itself and its reversal.]
] <lem:path-domination>

#proof[
  Delete every interaction incident to the specified labels; nonnegativity of $W$ increases the integral.
    Fix their initial and final coordinates $y \, z$. The remaining semigroup has norm $e^(- 2 T E_(N - m))$,
    so the integral in the other labels is bounded by that norm times $g \( y \) g \( z \)$,
    where $g \( y \)$ is the $L^2$ norm of the slice $Phi \( y \, dot.op \)$.
    The product of the free weighted endpoint kernels is symmetric in $y \, z$ by reversal invariance.
    Thus $g \( y \) g \( z \) lt.eq \( g \( y \)^2 + g \( z \)^2 \) \/
    2$ replaces the slice product by its initial square after integration.
    Since $g \( y \)^2$ is the specified-coordinate marginal of $mu$, the result follows from (2.8).
    Truncation proves the assertion for unbounded nonnegative weights. ◻
]

Apply this lemma on the longer slab $\[ - 1 \, 1 \]$. At any time $\| q \| lt.eq 1 \/ 2$,
  the probability for a free path started at $Y_i$ to lie in a cube of side $h lt.eq
  1$ within a fixed distance of a site $z$ is bounded by $C h^3 e^(- 2 d_K \( Y_i \, z \))$,
  by the torus heat kernel. The bound also holds for the reversed observation.
  Summing (2.10) over distinct labels and using (2.7) shows that two specified such cubes have expected ordered
  pair count at most $C D^2 h^6$. Covering a fixed site neighborhood by $h$-cubes and summing over the bounded
  number of neighboring cubes for each one gives

#[#set math.equation(numbering: n => "(2.11)")
 $ bb(E) \# { \( i \, k \) : i eq.not k \, med X_i \, X_k upright(" in the neighborhood") \, med
   d_K \( X_i \, X_k \) lt.eq h } lt.eq C D^2 h^3 . $ <eq:pair-bound>]

These bounds are uniform in the site and in the observation time on the central slab.
  They provide the required short-distance control using only the imported count tails and the elementary
  removal-energy estimate.

== 3 Energy and mesoscopic occupation <sec:energy>

The energy comparison has two outputs: concentration of local particle counts and the occupation outside functions
  constant on mesoscopic cells. The latter determines the depletion except for wavelengths larger than $R$.
  The path comparisons in the following sections will control that remaining contribution.
  Throughout this section $chevron.l dot.op chevron.r_psi$ denotes the quadratic form in $psi$,
  without division by $parallel psi parallel^2$. For a spatial cell $A$, put $q_A = n_A \/ \( D \| A \| \)$.

#thm([Proposition 3.1.])[
  (Local energy outputs).  #emph[Choose $u > 0$ sufficiently small and then $0 < w < u \/ 10000$,
    with the partitions of Section 2. In the stipulated order of thermodynamic and dilute limits,
    the ground vector satisfies
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E)_(A in cal(C)_R) chevron.l \( q_A - 1 \)^2 chevron.r_Phi & lt.eq
   C D^(- 1 - w \/ 6) \, & bb(E)_(A in cal(C)_d) chevron.l \( q_A - 1 \)^4 chevron.r_Phi & lt.eq
   C_j D^(- 1 - u \/ 6) \,\
V^(- 1) chevron.l upright(d) Gamma \( W_R \) chevron.r_Phi & = frac(8, 3 sqrt(pi)) alpha^(3 \/ 2) +
  o \( 1 \) \, & V^(- 1) chevron.l upright(d) Gamma \( W_d \) chevron.r_Phi & lt.eq epsilon.alt_j + o_j \( 1 \) \,
  wide epsilon.alt_j arrow.r 0 . $ <eq:local-energy>]

 The parameter $j$ is fixed before taking these limits. Constants are uniform for $alpha$ in the fixed compact
   positive window.]
] <prop:local-energy>

The organization of the comparison follows the mesoscopic energy argument of #cite(label("D")) Section 3.
  Its scattering-square decomposition and Neumann cosine analysis are related to #cite(label("FJGMOTr"))
  Sections 2 and 5. We give the needed estimates for the present interaction,
  including the wall correction and cubic cancellation. In particular the proof uses the bounded potential $W$ itself.

=== 3.1 The upper bound and Neumann boxes <the-upper-bound-and-neumann-boxes>

Put $c_(upright(L)) = 128 \/ \( 15 sqrt(pi) \)$ and define, holding $a$ fixed when taking derivatives,

$ e \( y \) = 4 pi a y^2 + 4 pi c_(upright(L)) a^(5 \/ 2) y^(5 \/ 2) . $

The Lee–Huang–Yang upper bound of #cite(label("BCSUpper")) Theorem 1.1 applies because the fixed physical
  potential is radial, nonnegative, compactly supported and belongs to $L^3$.
  Its error is $O \( rho^(5 \/ 2 + c) \)$ for some $c > 0$, with a constant depending on that potential.
  Under our rescaling energy density is multiplied by $sigma^5$, and $rho asymp D^(- 2)$.
  Consequently, for some $c_(*) > 0$,

#[#set math.equation(numbering: n => "(3.2)")
 $ E_N lt.eq V #scale(x: 120%, y: 120%)[\(] e \( D \) + O \( D^(- c_(*)) \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:energy-upper>]

As elsewhere, this denotes a bound on the thermodynamic limsup; no finite-volume convergence rate is required.
  To pass from the Dirichlet upper bound to any periodic density-convergent sequence,
  place a Dirichlet trial box inside the periodic box with a range margin and side ratio tending to one.
  Use a slightly larger fixed density there, so its particle number eventually exceeds the desired one.
  Slicing out excess coordinates and averaging cannot increase the energy,
  since the omitted kinetic and interaction forms are nonnegative.
  Extending the remaining slices by zero respects the periodic form domain and the range margin makes the
  interactions agree. Let the larger density decrease to the prescribed density,
  using continuity of the explicit upper bound. This proves (3.2) along the sequences used here.

We use the same box estimates at two scales: $E = R$ yields the coarse count variance, and $E =
  B$ yields the microcell fourth moment and both occupation estimates.
  For a generic box side $E$, abbreviate $Q = E$ and $v_b = E^3$. Thus $Q asymp D^theta$ for $theta = u$ or $w$.
  Restrict configuration space to sectors assigning each label to a box and discard interactions between boxes.
  These are Neumann form restrictions: we restrict gradient integrals,
  without differentiating the sector indicators. Each local vector is symmetric in the labels assigned to its box,
  and may take values in the Hilbert space of the spectator coordinates.

It is convenient to reflect the interaction at each wall.
  For a radial function $g$ supported in ${ \| x \| lt.eq r }$ define on $\[ 0 \, E \]^3$

$ g^s \( x \, y \) = sum_(z in bb(Z)^3) g \( p_z \( x \) - y \) \, $

where, coordinatewise, $p_z$ maps $\[ 0 \, E \]^3$ onto the cube translated by $E z$,
  reversing a coordinate precisely when the corresponding $z_i$ is odd.
  Write $H_b$ for the Neumann Hamiltonian with pair potential $W^s$.
  The added mirror terms are nonnegative, but their expectation on the original ground vector is small:

#[#set math.equation(numbering: n => "(3.3)")
 $ sum_b chevron.l H_b chevron.r lt.eq E_N + C V \/ E . $ <eq:energy-mirror-error>]

Indeed an added interaction requires two particles within $C r$ of each other and within $C r$ of a wall.
  Its multiplicity is bounded. At most $C \( V \/ E \) r^(- 2)$ cubes of side comparable with $r$ cover all walls.
  The small-cube pair estimate proved before (2.11) gives $C D^2 r^6$ ordered pairs per such cube,
  and $parallel W parallel_oo lt.eq C D^2$. Since $r asymp D^(- 1)$, the resulting bound is $C V \/ E$.
  All later excitation localizations use this same mirror Hamiltonian.

Let $u_p$, $p in \( pi \/ E \) bb(N)_0^3$, be the real normalized Neumann cosines:

$ u_p \( x \) = v_b^(- 1 \/ 2) product_(i = 1)^3 c_(p_i) cos \( p_i x_i \) \, wide c_0 = 1 \, quad c_s =
  sqrt(2) med \( s > 0 \) . $

Even extension shows that the integral operator with kernel $g^s$ has eigenvalue $hat(g) \( p \)$ on $u_p$,
  with Fourier convention $hat(g) \( p \) = integral g \( x \) e^(- i p dot.op x) thin thin upright(d) x$.
  In particular its row integral is the constant $hat(g) \( 0 \)$.
  Write $a_p \, a_p^(*)$ for the corresponding bosonic operators and set

#[#set math.equation(numbering: n => "(3.4)")
 $ J = Q^100 \, wide n_(+) = sum_(p eq.not 0) a_p^(*) a_p \, wide n_L =
   sum_(0 < \| p \| lt.eq J \/ E) a_p^(*) a_p \, wide n_H = n_(+) - n_L \, wide
   M asymp D v_b Q^(- 400) . $ <eq:energy-bands>]

Take $M$ integral. We refer to $0 < \| p \| lt.eq J \/ E$ as the low band and the remaining nonzero modes as the
  high band. All power inequalities below hold if $u$ is sufficiently small,
  for example $u < 10^(- 9)$ and sufficiently small relative to $c_(*)$. Further decreases are harmless.

=== 3.2 A rough bound retaining count and kinetic penalties <a-rough-bound-retaining-count-and-kinetic-penalties>

We first obtain a lower bound with an error much larger than the Lee–Huang–Yang term.
  Its purpose is to control vectors with many excitations, leaving only a small-excitation sector for the sharper
  calculation. The construction is the radial replacement and small-box method of Dyson and
  Lieb–Yngvason #cite(label("Dyson")) #cite(label("LiebYngvason")), with an explicit reserve of kinetic energy.

#thm([Lemma 3.2.])[
  (Rough box bound).  #emph[For $0 lt.eq n lt.eq 6 D v_b$, as a quadratic-form inequality on the bosonic
    $n$-particle Neumann space,
#[#set math.equation(numbering: n => "(3.5)")
 $ H_b gt.eq  & frac(4 pi a n^2, v_b) - C v_b D^(1 - 0.001) + c thin upright(d) Gamma \( min { p^2 \, 1 } \)\
 & + c D sum_(A in cal(C)_d \, med A subset b) \| A \| frak(h) (q_A - frac(n, D v_b)) \, wide frak(h) \( y \) =
   frac(y^2, 1 + \| y \|) . $ <eq:rough-energy>]

 The same inequality holds with Hilbert-space-valued spectator variables.]
] <lem:energy-rough>

#proof[
  We can discard the mirror terms for this estimate. Subdivide each $d$-cell into equal cubes of side $ell asymp
    D^(- 0.31)$, and put $b_1 = D^(- 0.36)$ and $xi = D^(- 0.002)$. For large $D$, $r < b_1 \/ 2$.
    Restrict to the corresponding assignment sectors and drop interactions between small cubes.
  Split the kinetic coefficient as $1 = \( 1 - 2 xi \) + xi + xi$.
    The radial replacement below uses the first term only within distance $b_1$ of another particle in the small
    cube. We use one $xi$ reserve for Temple’s inequality and retain the other for the kinetic term in (3.5);
    outside those neighborhoods the first term also remains available.
  Fix one particle coordinate and all the others in its small cube.
    Partition the cube into the Voronoi regions of those other particles, clipped at the walls.
    Each region is star-shaped about its center. The radial scattering variational principle on a ray gives,
    for $R' gt.eq r$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ integral_0^(R') #scale(x: 120%, y: 120%)[\(] \( 1 - 2 xi \) \| f' \( s \) \|^2 + 1 /
     2 W \( s \) \| f \( s \) \|^2 #scale(x: 120%, y: 120%)[\)] s^2 thin thin upright(d) s gt.eq \( 1 - 2 xi \)
     a \| f \( R' \) \|^2 . $ <eq:energy-ray>]
  With kinetic coefficient one the exact endpoint minimum is $a \( 1 - a \/ R' \)^(- 1) \| f \( R' \) \|^2$:
    integrate the scattering equation against its regular solution,
    then complete the quadratic form around the minimizer. To obtain (3.6),
    first bound the potential term below by $\( 1 - 2 xi \) W \/ 2$,
    and then discard $\( 1 - a \/ R' \)^(- 1) gt.eq 1$. No monotonicity of the radial function $W$ is involved.
  Let $U$ be constant on $b_1 \/ 2 < \| x \| < b_1$, zero elsewhere, and normalized by $integral U = 4 pi$.
    Average (3.6) over radii available on each ray with weight $U \( R' \) \( R' \)^2 thin thin upright(d) R'$.
    The weight has total at most one. Integrating the rays replaces the short-distance energy by $\( 1 - 2 xi \) a
    U \( d_(upright("nn")) \)$, where $d_(upright("nn"))$ is the nearest-neighbor distance in the small cube;
    the expression is zero when there is no neighbor. Assigning half of each pair potential to each endpoint uses
    no interaction twice. This argument first holds for smooth vectors and then by form approximation.
  In a small cube with $k lt.eq C_0 D ell^3$ particles, the mean of the replacement sum in its normalized constant
    vector is at least
  $ frac(4 pi \( 1 - 2 xi \) a k \( k - 1 \), ell^3) (1 - C b_1 / ell - C frac(k b_1^3, ell^3)) . $
  For this estimate put one coordinate at least $b_1$ from the walls,
    integrate a possible nearest neighbor over the shell, and exclude closer neighbors by the union bound.
    Distinct choices of the nearest neighbor are disjoint outside null sets.
    The replacement sum is nonnegative and bounded by $C k a b_1^(- 3) lt.eq C D^0.15$.
    Its variance in the constant vector is therefore at most this upper bound times its mean.
    The kinetic gap supplied to Temple’s inequality is $pi^2 xi \/ ell^2 asymp D^0.618$.
    Temple’s inequality yields the lower bound
  $ frac(4 pi a, ell^3) \( 1 - C D^(- 0.002) \) k \( k - 1 \) . $
  Here the other relative errors are $b_1 \/ ell = O \( D^(- 0.05) \)$ and $D b_1^3 = D^(- 0.08)$;
    the variance correction is smaller still. The formula also holds for $k = 0 \, 1$.
  For $k > C_0 D ell^3$, partition the labels into groups of sizes between $C_0 D ell^3 \/ 3$ and $C_0 D ell^3$,
    allowing integer rounding, and drop intergroup interactions.
    Choose a fixed cutoff $b_(*) > 12$, and then $C_0$ sufficiently large. With
  $ F \( y \) = cases(delim: "{", y^2 \, & 0 lt.eq y lt.eq b_(*) \,, 2 b_(*) y - b_(*)^2 \, & y > b_(*) \,) $
  the same estimate in every number sector is bounded below by
  $ frac(4 pi a, ell^3) \( 1 - C D^(- 0.002) \) [\( D ell^3 \)^2 F (frac(k, D ell^3)) - k] . $
  Indeed $F \( y \) lt.eq y^2$ below the group threshold, whereas above it the group estimate has a linear
    coefficient larger than $2 b_(*) D ell^3$. For $theta.alt = n \/ \( D v_b \) in \[ 0 \, 6 \]$,
  $ F \( y \) gt.eq theta.alt^2 + 2 theta.alt \( y - theta.alt \) + c frak(h) \( y - theta.alt \) \, wide y gt.eq 0 . $
  Below $b_(*)$ the remainder is a square. Above $b_(*)$, writing $s = y - theta.alt$ and $a_0 = b_(*) -
    theta.alt > 0$, it is $2 a_0 s - a_0^2 gt.eq a_0 s$. This proves the displayed comparison uniformly.
    Summing small cubes cancels the tangent deviations. The self-count terms cost at most $C a ell^(- 3) n lt.eq
    C v_b D^0.93$, and the relative loss in the leading scalar costs $C v_b D^(1 - 0.002)$.
    Convexity of $frak(h)$ and Jensen’s inequality inside each $d$-cell now give the scalar and count terms of (3.5).
  It remains to recover a fixed amount of the indicated kinetic form.
    The preceding construction leaves coefficient $xi$ everywhere and $1 -
    2 xi$ outside the $b_1$-neighborhoods of the other particles.
    For a coordinate slice enlarge those neighborhoods to their union $S$; then $\| S \| lt.eq C n b_1^3$.
    The vector fields $nabla u_p \/ \| p \|$ are orthonormal.
    Their projection $Pi$ for $0 < \| p \| lt.eq D^0.003$ has squared evaluation norm at most $C D^0.009$.
    Hence, by duality,
  $ parallel Pi upright(bold(1))_S F parallel_2^2 lt.eq C D^0.009 n b_1^3 parallel F parallel_2^2 lt.eq
    C D^(- 0.071) Q^3 parallel F parallel_2^2 = o \( xi \) parallel F parallel_2^2 . $
  Apply this to $F = nabla f$ and use $parallel Pi F parallel_2^2 lt.eq
    2 parallel upright(bold(1))_(S^c) F parallel_2^2 + 2 parallel Pi upright(bold(1))_S F parallel_2^2$.
    Neumann integration by parts identifies the projected gradient norm with $sum_(0 < \| p \| lt.eq D^0.003)
    p^2 \| chevron.l u_p \, f chevron.r \|^2$. Above this cutoff the everywhere reserve suffices because $xi p^2
    gt.eq D^0.004$. Sum over coordinates. This last argument is on the original Neumann form domain of the
    $E$-box, after summing back the small-cube restrictions; it does not impose artificial Neumann conditions on
    an arbitrary collection of small-cube functions. ◻
]

=== 3.3 Restricting the excitation number <restricting-the-excitation-number>

The cutoff below is a finite-band instance of the matrix localization method of #cite(label("LiebSolovej"))
  Appendix A. We give its form estimate directly so that the retained positive terms remain explicit.

Comparing Lemma 6 with the tangent to $4 pi a y^2$ at $D$, and using (3.2) and (3.3), gives the preliminary estimate

#[#set math.equation(numbering: n => "(3.7)")
 $ V^(- 1) sum_(b \, med n lt.eq 6 D v_b) chevron.l n_(+) chevron.r lt.eq
   C Q^2 D^(1 - 0.001) . $ <eq:energy-preliminary>]

For completeness the higher number sectors do not spoil this comparison:
  partition their labels into groups of sizes between $2.5 D v_b$ and $6 D v_b$,
  apply the rough bound to each group and drop intergroup interactions.
  The energy per particle is then at least $10 pi alpha - o \( 1 \)$,
  exceeding the tangent slope $8 pi alpha$ by a fixed positive amount.
  Thus those sectors have a surplus of order $n$. For $n lt.eq 6 D v_b$,
  the scalar tangent remainder is nonnegative and $min \( p^2 \, 1 \) gt.eq c E^(- 2)$ on the nonconstant modes,
  proving (3.7).

Localize only the middle number sectors

$ D v_b \/ 2 lt.eq n lt.eq 6 D v_b . $

Choose real Lipschitz functions $f \, h$ with $f^2 + h^2 = 1$, $f = 1$ below $M \/ 8$, $f = 0$ above $M \/ 4$,
  and Lipschitz constants at most $C \/ M$. The three localizing operators are

#[#set math.equation(numbering: n => "(3.8)")
 $ F_1 = f \( n_L \)^2 \, wide F_2 = h \( n_L \)^2 \, wide F_3 =
   sqrt(2) f \( n_L \) h \( n_L \) . $ <eq:energy-cutoffs>]

They have $sum F_i^2 = 1$. The first and third pieces are supported on $n_L lt.eq
  M \/ 4$ and will be called low pieces; the second is supported on $n_L gt.eq M \/ 8$.
  Also $psi = F_1 psi + F_2 psi$, which later transfers count estimates even though counts need not commute with
  these cutoffs. Finite-rank smooth one-body projections preserve the Neumann form domain.

Here is the localization error, with $V_n^s$ the sum of mirror pair potentials:

#[#set math.equation(numbering: n => "(3.9)")
 $ lr(|sum_(i = 1)^3 chevron.l H_b chevron.r_(F_i psi) - chevron.l H_b chevron.r_psi|) lt.eq C /
   M^2 (chevron.l V_n^s chevron.r_psi + parallel W parallel_1 J^3 / v_b n chevron.l n_(+) chevron.r_psi) .
   $ <eq:energy-cutoff-error>]

To prove it, let $Pi_k$ project onto $n_L = k$. Kinetic energy commutes with the cutoffs,
  and the potential has block width two. The difference of its forms is

$ - 1 / 2 sum_(k \, l \, i) \( F_i \( k \) - F_i \( l \) \)^2 chevron.l Pi_k psi \, V_n^s Pi_l psi chevron.r . $

Positivity, form Cauchy–Schwarz and the finite block width bound this by $C
  M^(- 2)$ times the block-diagonal expectation. The latter is the phase average of $e^(- i s n_L) V_n^s
  e^(i s n_L)$. For a pair only the two coordinate rotations matter.
  Expanding each as $1 + \( e^(i s) - 1 \) P_L$, every additional term has a low projection on at least one
  coordinate. The evaluation bound $P_L \( x \, x \) lt.eq C J^3 \/ v_b$ and the constant row integral of $W^s$ give

$ P_(L \, i) W^s \( x_i \, x_k \) P_(L \, i) lt.eq C parallel W parallel_1 J^3 v_b^(- 1) P_(L \, i) . $

Expanding squared norms and summing pairs proves (3.9). The analogous error for $upright(d) Gamma \( A \)$,
  $parallel A parallel lt.eq 1$, is at most $C n M^(- 2) parallel psi parallel^2$,
  by block width one and its norm bound $n$.

The summed potential expectation is $O \( V D \)$, including the mirror correction.
  Together with (3.7), (3.9) has total error $O \( V Q^(- 1) \)$.
  Even replacing $parallel W parallel_1 lt.eq C \/ D$ by the weaker $C Q$ gives the per-volume bound

$ O #scale(x: 120%, y: 120%)[\(] D^(- 1) Q^794 + D^(- 0.001) Q^1097 #scale(x: 120%, y: 120%)[\)] = O \( Q^(- 1) \) . $

All these inequalities include sector weights and spectator integration.

=== 3.4 The sharp box estimate <the-sharp-box-estimate>

We now analyze a low piece. The aim is to recover the Lee–Huang–Yang scalar while retaining two positive terms:
  a weak particle-excitation gap and a quasiparticle energy. The latter will identify the occupation observable.

Let $phi$ be the scattering function of $W$, and set

$ omega = 1 - phi \, wide g = W phi \, wide m = g omega . $

The maximum principle and the radial scattering equation give $0 lt.eq phi lt.eq 1$, $hat(g) \( 0 \) =
  8 pi a$ and $parallel m parallel_1 lt.eq C \/ D$. For $p eq.not 0$ put

#[#set math.equation(numbering: n => "(3.10)")
 $ S = E^(- 2) \( n_(+) + J n_H \) \, wide tau_p = p^2 - E^(- 2) #scale(x: 120%, y: 120%)[\(] 1 +
   J upright(bold(1))_({ p med upright("high") }) #scale(x: 120%, y: 120%)[\)] . $ <eq:energy-tau>]

Thus $tau_p asymp p^2$. For the constant mode use coherent vectors $\| z chevron.r =
  e^(- \| z \|^2 \/ 2) sum_(q gt.eq 0) z^q \| q chevron.r \/ sqrt(q !)$, measure $thin upright(d) lambda \( z \) =
  pi^(- 1) thin upright(d)^2 z$, and coherent projections $psi_z =
  chevron.l z \| psi chevron.r$ onto the excitation Fock space. For $\| z \|^2 lt.eq 2 n$ define

$ rho_z = \| z \|^2 \/ v_b \, wide t_p = rho_z hat(g) \( p \) \, wide D_p = \( tau_p^2 + 2 t_p tau_p \)^(1 \/ 2) . $

These roots are positive: $\| t_p \| lt.eq C$, while $hat(g) \( p \) gt.eq
  0$ on every fixed momentum ball for large $D$, by positivity and shrinking support.
  Large $p$ are controlled by $tau_p asymp p^2$. After rotating excitation modes by the phase of $z$,
  the change of variables used below diagonalizes the one-mode quadratic form

$ \( tau_p + t_p \) a_p^(*) a_p + 1 / 2 t_p \( a_p^2 + a_p^(* 2) \) . $

Specifically, define $b_p$ through

#[#set math.equation(numbering: n => "(3.11)")
 $ a_p = U_p b_p + V_p b_p^(*) \, wide U_p > 0 \, quad U_p^2 = 1 + V_p^2 \,\
V_p^2 = 1 / 2 (frac(tau_p + t_p, D_p) - 1) \, wide 2 U_p V_p = - t_p \/ D_p . $ <eq:energy-bogoliubov>]

With this choice,

$ \( tau_p + t_p \) a_p^(*) a_p + 1 / 2 t_p \( a_p^2 + a_p^(* 2) \) = D_p b_p^(*) b_p + 1 /
  2 \( D_p - tau_p - t_p \) . $

The formulas with $z = 0$ have $U_p = 1 \, V_p = 0$.

#thm([Lemma 3.3.])[
  (Sharp energy with positive remainders).  #emph[If $D v_b \/ 2 lt.eq n lt.eq
    6 D v_b$ and $psi$ is supported on $n_L lt.eq M \/ 4$, then
#[#set math.equation(numbering: n => "(3.12)")
 $ chevron.l H_b chevron.r_psi gt.eq  & #scale(x: 120%, y: 120%)[\(] v_b e \( n \/ v_b \) -
   C v_b Q^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\)] parallel psi parallel^2 + c chevron.l S chevron.r_psi\
 & + c integral_(\| z \|^2 lt.eq 2 n) sum_(p eq.not 0) tilde(D)_p parallel b_p psi_z parallel^2 thin thin
   upright(d) lambda \( z \) \,\
 & #h(12mm)  tilde(D)_p = D_p med upright("on the low band") \, wide tilde(D)_p = D_p \/ J med
   upright("on the high band") . $ <eq:sharp-energy>]

]
] <lem:energy-sharp>

The proof has three parts. Scattering-square splitting produces a quadratic Hamiltonian and a cubic term.
  Its quadratic vacuum energy is the Lee–Huang–Yang scalar.
  Completing the high-frequency cubic square creates a contraction that cancels against the retained $m$ term.
  We supply each part, since the cancellation must leave the positive remainders in (3.12).

#proof[
  #emph[Scattering-square splitting.] Let $P = \| u_0 chevron.r chevron.l u_0 \|$, $Z =
    P_i^perp P_j^perp$ and $A = 1 - Z$. For every summand in the mirror kernel, with its argument suppressed,
    there is the exact identity of forms
  #[#set math.equation(numbering: n => "(3.13)")
   $ W = \( Z + omega A \)^(*) W \( Z + omega A \) + Z g A + A g Z + A \( g + m \) A . $ <eq:energy-scattering-square>]
  It follows by expanding, using $g = W \( 1 - omega \)$ and $m = W omega \( 1 - omega \)$.
    In the cubic blocks $P_i P_j^perp g^s Z$ and their adjoints retain only the low projection in coordinate $j$.
    The high remainder costs a small fixed fraction of the positive squares and $C n_H$.
    Here is a direct verification. In each mirror term substitute $Z = \( Z + omega A \) - omega A$.
    Cauchy–Schwarz against the square bounds the first part by that square plus $C n_H$:
    the latter bound uses $g^2 \/ W lt.eq W$, the constant row integral of $W^s$,
    and $n parallel W parallel_1 \/ v_b lt.eq C$. The other part contains $m^s A$.
    Between $P_i P_j^(upright("high"))$ and $A = P_i P_j + P_i P_j^perp + P_i^perp P_j$ its first block vanishes.
    Its other blocks act only on high modes, by the constant row integral for the direct block and cosine
    diagonalization for the exchange block. Their norms are at most $parallel m parallel_1 \/ v_b$,
    again giving $C n_H$ after summing. This is absorbed by $E^(- 2) J n_H$ since $J \/ E^2 arrow.r oo$.
  The retained $g$ direct terms in the number-$n$ sector combine into
  #[#set math.equation(numbering: n => "(3.14)")
   $ frac(hat(g) \( 0 \), 2 v_b) { n \( n - 1 \) - n_(+) \( n_(+) - 1 \) } . $ <eq:energy-number-term>]
  After separating $S$, the remaining terms are
  #[#set math.equation(numbering: n => "(3.15)")
   $ & frac(hat(m) \( 0 \), 2 v_b) a_0^(* 2) a_0^2\
 & +
   sum_(p eq.not 0)
   [tau_p a_p^(*) a_p + frac(hat(g) \( p \) + hat(m) \( p \) + hat(m) \( 0 \), v_b) a_0^(*) a_p^(*) a_p a_0 +
   frac(hat(g) \( p \), 2 v_b) \( a_0^(* 2) a_p^2 + a_p^(* 2) a_0^2 \)]\
 & + 1 / v_b sum_(p med upright("low")\
k \, l eq.not 0) C_(p k l) hat(g) \( k \) \( a_0^(*) a_p^(*) a_l a_k + a_k^(*) a_l^(*) a_p a_0 \) \, wide
  C_(p k l) = sqrt(v_b) integral_b u_p u_k u_l . $ <eq:energy-retained-hamiltonian>]
  These are the matrix elements of (3.13): the constant mode paired through $g^s$ with mode $k$ leaves exactly the
    triple cosine coefficient in the last line. Blocks with just one nonconstant index vanish.
    The coefficients $C_(p k l)$ are bounded, and fixing any two indices leaves at most a fixed number of possible
    third indices. These facts follow coordinatewise from the product-to-sum identity for cosines.
    We keep these exact coefficients, including modes with zero components.
  On the present excitation cutoff,
  #[#set math.equation(numbering: n => "(3.16)")
   $ n_(+)^2 lt.eq C \( M n_(+) + n n_H \) . $ <eq:energy-number-square>]
  Thus replacing (3.14) by $4 pi a n^2 \/ v_b$ costs $O \( 1 \) parallel psi
    parallel^2$ and an $o \( 1 \)$ fraction of $S$. For example its two excitation coefficients are
    $O \( Q^(- 400) \)$ on $n_(+)$ and $O \( 1 \)$ on $n_H$, compared with $E^(- 2)$ and $J E^(- 2)$.
  #emph[Coherent resolution.] Use the resolution of the identity in the zero mode.
    The upper symbols of $a_0^(*) a_0$ and $a_0^(* 2) a_0^2$ are respectively $\| z \|^2 - 1$ and $\| z \|^4 -
    4 \| z \|^2 + 2$; these follow by scalar gamma integration, or see #cite(label("LSY2005")).
    Hence in (3.15) we may substitute $z \, macron(z)$ for $a_0 \, a_0^(*)$,
    with total integrated error $O \( 1 \) parallel psi parallel^2$.
    Indeed the Fourier coefficients are $O \( D^(- 1) \)$, $n lt.eq 6 D v_b$, and
  $ integral \| z \|^2 parallel psi_z parallel^2 thin thin upright(d) lambda \( z \) = chevron.l n - n_(+) +
    1 chevron.r_psi . $
  The region $\| z \|^2 > 2 n$ is negligible, also with fixed polynomial weights:
    after angular integration its radial variables are gamma variables with integer shapes at most $n + 1$,
    whose tails there are exponentially small. All negative terms, estimated without kinetic energy,
    have polynomial operator bounds on sectors with at most $n$ excitations.
    For the pairing terms this follows from Parseval for the bounded mirror kernel;
    there are only polynomially many low cubic indices. The coherent projections preserve both $n_L lt.eq
    M \/ 4$ and $n_(+) lt.eq n$. It therefore suffices to estimate a normalized excitation vector $eta$ in that
    subspace, at $\| z \|^2 lt.eq 2 n$. For this calculation rotate phases so that $z$ is real.
  #emph[The quadratic vacuum energy.] Diagonalizing the $g$ quadratic terms gives positive $sum D_p parallel b_p
    eta parallel^2$, the remaining $m$ terms, and the scalar
  #[#set math.equation(numbering: n => "(3.17)")
   $ 1 / 2 sum_(p eq.not 0) \( D_p - tau_p - t_p \) + 1 / 2 v_b rho_z^2 hat(m) \( 0 \) =
     4 pi c_(upright(L)) a^(5 \/ 2) v_b rho_z^(5 \/ 2) + O \( v_b Q^(- 1 \/ 4) \) . $ <eq:energy-lhy-scalar>]
  We justify the error without any regularity assumption on $W$.
    The equation $- Delta omega = g \/ 2$ and the Newton kernel give
  $ hat(m) \( 0 \) = 1 / 2 integral_(bb(R)^3) frac(hat(g) \( k \)^2, \| k \|^2) thin thin upright(d) macron(k) \,
    wide thin upright(d) macron(k) = \( 2 pi \)^(- 3) thin upright(d) k . $
  Writing $H \( k \) = hat(g) \( k \) \/ \( 8 pi a \)$, the radial sine formula, $parallel g parallel_oo lt.eq
    C D^2$ and $"supp" g subset { \| x \| lt.eq C \/ D }$ imply
  #[#set math.equation(numbering: n => "(3.18)")
   $ \| H \( k \) \| lt.eq min { 1 \, C D \/ \| k \| } \, wide \| nabla H \( k \) \| lt.eq
     C min { D^(- 1) \, \| k \|^(- 1) } . $ <eq:energy-fourier-decay>]
  The uniform derivative bound uses the first moment of $g$.
    For the large-frequency bounds differentiate $4 pi integral_0^r g \( s \) s sin \( \| k \| s \) \/ \| k \|
    thin thin upright(d) s$ and use the height and range bounds; no derivative of $g$ is taken.
  Neumann lattice summation in the positive octant gives
  #[#set math.equation(numbering: n => "(3.19)")
   $ 1 / v_b sum_(p eq.not 0) frac(H \( p \)^2, p^2) = integral_(bb(R)^3) frac(H \( p \)^2, p^2) thin thin
     upright(d) macron(p) + O (frac(1 + log D, E)) . $ <eq:energy-riemann-m>]
  To see this, compare cubes of mesh $pi \/ E$. The octant weight $pi^(- 3)$ equals the full-space weight
    $\( 2 pi \)^(- 3)$ for the even integrand. The cubes meeting zero cost $O \( E^(- 1) \)$.
    Away from zero, the derivative is bounded by $C \( \| p \|^(- 3) + D^(- 1) \| p \|^(- 2) \)$ up to radius $D$
    and by $C \( D^2 \| p \|^(- 5) + D \| p \|^(- 4) \)$ above it.
    Shell summation, including face cubes, proves (3.19); here $log E = O \( log D \)$.
    Thus the second term in (3.17) may be replaced by $sum t_p^2 \/ \( 4 p^2 \)$ at the stated accuracy.
  Replacing $tau_p$ by $p^2$ in the first term costs $O \( v_b \/ E \)$.
    At bounded frequencies the derivative of the summand is bounded by $C \( 1 + \| p \|^(- 1) \)$ and the shift
    is $E^(- 2)$. At large frequencies the derivative is $O \( \| p \|^(- 4) \)$;
    the additional high-band shift $J \/ E^2$ is compensated by summing only above $J \/ E$.
    In the combined summand replace $t_p$ by $t_0 = 8 pi a rho_z$.
    Above radius $Q$ its absolute tail is $O \( Q^(- 1) \)$ per volume by Taylor expansion.
    Below $Q$, positivity and support give $\| t_p - t_0 \| lt.eq C p^2 \/ D^2$,
    while differentiation in $t$ costs at most $C \( 1 + p^(- 2) \)$.
    The summed error is $O \( Q^5 \/ D^2 \)$ per volume. Finally,
    the constant-$t_0$ Riemann sum differs from its integral by $O \( \( 1 + log E \) \/ E \)$ per volume:
    near zero use the bounds $C \| p \|^(- 2) \, C \| p \|^(- 3)$ for the function and its derivative,
    and at infinity use the Taylor bounds $C \| p \|^(- 4) \, C \| p \|^(- 5)$.
    All these errors are $O \( Q^(- 1 \/ 4) \)$. The integral equals
  $ frac(t_0^(5 \/ 2), 4 pi^2) integral_0^oo x^2 (sqrt(x^4 + 2 x^2) - x^2 - 1 + frac(1, 2 x^2)) thin upright(d) x . $
  The radial integral is $8 sqrt(2) \/ 15$, by evaluating an elementary antiderivative and taking its endpoint
    limits. Substitution of $t_0 = 8 pi a rho_z$ proves (3.17), including $z = 0$.
  The scalar is now correct. We next control the cubic term while preserving a fraction of the quasiparticle
    energy. The $m$ terms still present in (3.15) are essential here.
  #emph[The cubic terms with low $k$.] Put $lambda = \( D v_b \)^(- 1 \/ 2)$ and $N_(+) =
    chevron.l n_(+) chevron.r_eta$. After coherent substitution the cubic coefficients are bounded by $C lambda \|
    H \( k \) \|$. Whenever we sum triples below, $p$ is low and $C_(p k l) eq.not 0$.
    For low $k$, Cauchy–Schwarz applied to $parallel a_l^(*) a_p eta parallel$ and $parallel a_k eta parallel$ gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ C lambda J^(3 \/ 2) \( M + C J^3 \)^(1 \/ 2) N_(+) = o \( E^(- 2) \) N_(+) . $ <eq:energy-low-cubic>]
  Indeed there are $O \( J^3 \)$ low indices, any two indices have bounded multiplicity for the third,
    and $parallel a_l^(*) a_p eta parallel^2 = parallel a_l a_p eta parallel^2 + parallel a_p eta parallel^2$.
    The double-annihilation sum is bounded by $chevron.l n_L n_(+) chevron.r_eta$.
  #emph[The high $k$ creation part.] For high $k$ use $a_k = U_k b_k + V_k b_k^(*)$, with $\| U_k \| lt.eq
    C$ and $\| V_k \| lt.eq C \| H \( k \) \| \/ k^2$. Commute $b_k^(*)$ to the left in the $V_k$ part.
    Besides the reordered term this produces the commutator with $a_l$ when $l = k$;
    the commutator with $a_p^(*)$ vanishes because $p$ is low. Set
  $ T_H = sum_(k med upright("high")) k^2 / J parallel b_k eta parallel^2 . $
  There are $O \( J^3 \)$ triples for fixed $k$. Weighted Cauchy–Schwarz therefore bounds the reordered term by
  $ C lambda J^2 T_H^(1 \/ 2)
    (sum_(p \, k \, l) frac(H \( k \)^4, k^6) parallel a_p^(*) a_l eta parallel^2)^(1 \/ 2) . $
  The unweighted squared-norm sum is at most $C \( M + J^3 \) N_(+)$,
    again by cosine multiplicities and commutation. Young’s inequality bounds this by an arbitrarily small fixed
    fraction of $T_H$ plus
  #[#set math.equation(numbering: n => "(3.21)")
   $ C lambda^2 J^4 \( E \/ J \)^6 \( M + J^3 \) N_(+) = o \( E^(- 2) \) N_(+) . $ <eq:energy-high-creation-error>]
  For the commutator, $C_(p k k) eq.not 0$ requires some nonzero component of $p$ to equal twice the corresponding
    component of $k$. For fixed $p$, the sum of $H \( k \)^2 \/ k^2$ over these high $k$ is at most $C
    E^2 \( 1 + log D \)$: on each such plane use dyadic shells and the decay in (3.18) above $D$.
    Its total contribution is at most
  $ C lambda E^2 \( 1 + log D \) J^(3 \/ 2) sqrt(N_(+)) . $
  It costs an arbitrarily small fixed fraction of $E^(- 2) N_(+)$ and the scalar error $C D^(- 1)
    Q^303 \( 1 + log D \)^2$.
  #emph[The high $k$ annihilation part and its contraction.] Complete a square between the $U_k
    b_k$ cubic and the fraction $1 - 3 \/ J$ of the high diagonal energy. The resulting negative form is bounded by
  #[#set math.equation(numbering: n => "(3.22)")
   $ rho_z / v_b sum_(k med upright("high")) frac(hat(g) \( k \)^2 U_k^2, \( 1 - 3 \/ J \) D_k) ∥sum_(p \, l)
     C_(p k l) a_l^(*) a_p eta∥^2 . $ <eq:energy-cubic-square>]
  Normal ordering separates its quartic and contraction parts. The absolute value of the quartic part is at most
  #[#set math.equation(numbering: n => "(3.23)")
   $ C lambda^2 \( E \/ J \)^2 J^3 chevron.l n_L n_(+) chevron.r_eta =
     o \( E^(- 2) \) N_(+) . $ <eq:energy-cubic-quartic>]
  For fixed $p \, p'$ the sums over $k \, l \, l'$ in the products $parallel a_(l') a_p eta parallel thin parallel
    a_l a_(p') eta parallel$ have bounded multiplicity. Put $A_p =
    sum_(l eq.not 0) parallel a_l a_p eta parallel^2$. Cauchy–Schwarz first bounds each fixed-$p \,
    p'$ sum by $C sqrt(A_p A_(p'))$, and then
  $ sum_(p \, p' med upright("low")) sqrt(A_p A_(p')) lt.eq \# { p : p med
    upright("low") } sum_(p med upright("low")) A_p lt.eq C J^3 chevron.l n_L n_(+) chevron.r_eta . $
  The weight is bounded using $\| k \| > J \/ E$. This proves (3.23).
  The contraction matrix for fixed $k$ has entries
  $ B_(p p')^(\( k \)) = sum_(l eq.not 0) C_(p k l) C_(p' k l) $
  on low modes. It is positive with bounded norm, since it is the compression of multiplication by $v_b u_k^2$,
    whose supremum is at most eight. The omitted $l = 0$ term is zero when $k$ is high and $p$ is low.
    If every component $k_i > 2 J \/ E$, the product-to-sum formula for $u_k^2$ makes this compression exactly the
    identity. For all high $k$,
  $ frac(U_k^2 k^2, \( 1 - 3 \/ J \) D_k) lt.eq 1 + C \/ J . $
  The exceptional component slabs satisfy
  #[#set math.equation(numbering: n => "(3.24)")
   $ 1 / v_b sum_(k med upright("high")\
min_i k_i lt.eq 2 J \/ E) frac(H \( k \)^2, k^2) lt.eq C frac(J \( 1 + log D \), E) . $ <eq:energy-slab-sum>]
  There are $O \( J \)$ lattice planes per slab; each plane has the same $C
    E^2 \( 1 + log D \)$ bound used for the commutator. Combining (3.19) and (3.24),
    the contraction in (3.22) is at most
  #[#set math.equation(numbering: n => "(3.25)")
   $ (2 rho_z hat(m) \( 0 \) + C [J^(- 1) + D^(- 1) J \( 1 + log D \) \/ E]) chevron.l n_L chevron.r_eta .
     $ <eq:energy-cubic-contraction>]
  The factor two comes from $integral hat(g) \( k \)^2 \/ k^2 thin thin upright(d) macron(k) = 2 hat(m) \( 0 \)$.
    On the other hand the low-band $m$ diagonal in (3.15), after coherent substitution, is at least
  $ 2 rho_z hat(m) \( 0 \) n_L - C D^(- 2) \( J \/ E \)^2 n_L . $
  This uses the second-moment estimate from $"supp" m subset { \| x \| lt.eq r }$.
    Its high-band part is nonnegative because $hat(m) \( p \) + hat(m) \( 0 \) gt.eq
    0$ for the nonnegative function $m$. Thus the leading term in (3.25) cancels,
    and every remaining coefficient is $o \( E^(- 2) \)$.
  For clarity, the preceding absorptions have ample strict margins.
    The low-$k$ coefficient in (3.20) is bounded by $C \( Q^(- 50) + D^(- 1 \/ 2) Q^298.5 \)$;
    the coefficient in (3.21) is $C \( Q^(- 594) + D^(- 1) Q^103 \)$; and (3.23) has coefficient $C Q^(- 298)$.
    The commutator scalar is $o \( v_b Q^(- 1 \/ 4) \)$ for sufficiently small $u$.
    Completing the main square used only $1 - 3 \/ J$ of the high diagonal;
    the creation estimate uses a small fraction of the remaining $J^(- 1)$ energy.
    Thus a fixed multiple of $tilde(D)_p$ remains, as does a fixed fraction of $S$.
  #emph[Integration and domains.] Integrate the estimates on coherent vectors.
    The function $4 pi c_(upright(L)) a^(5 \/ 2) rho^(5 \/ 2)$ is convex, and its derivative at $rho =
    n \/ v_b$ is $O \( D^(- 1) \)$. Its tangent there, together with the coherent second-moment identity,
    shows that replacing its integrated value by the value at $n \/ v_b$ loses at most $C
    D^(- 1) \( parallel psi parallel^2 + chevron.l n_(+) chevron.r_psi \)$.
    This is absorbed in the scalar error and the retained $S$.
    The gamma tail previously discarded is exponentially small.
  All calculations can first be made with finitely many excitation modes.
    At fixed parameters the bounded interaction is form-continuous under finite-mode approximation,
    which preserves the excitation cutoffs. The pairing coefficients have square-summable Fourier coefficients by
    Parseval, and the cubic has finitely many low indices. The displayed bounds justify passage in the completed
    squares; a positive remainder can first be retained on finitely many modes and then passed to the limit by
    lower semicontinuity. This proves (3.12) on the full form domain. ◻
]

=== 3.5 The energy surplus and count moments <the-energy-surplus-and-count-moments>

The sharp estimate now applies to the low pieces; the rough estimate handles their complement and the outlying
  particle-number sectors. The bookkeeping is most transparent relative to the affine function

$ t_b \( n \) = v_b e \( D \) + e' \( D \) \( n - D v_b \) . $

Its sum over boxes is exactly $V e \( D \)$ in every assignment sector.

#thm([Lemma 3.4.])[
  (Positive quantities paid for by the energy surplus).  #emph[After summing boxes, assignment sectors,
    and spectator variables, each of the following quantities is bounded by $C V Q^(- 1 \/ 5)$:]
  + #emph[the original box-count penalty $sum_b D v_b chevron.l frak(h) \( n \/ \( D v_b \) - 1 \) chevron.r$;]
  + #emph[on high pieces, the sum of $chevron.l upright(d) Gamma \( min { p^2 \, 1 } \) chevron.r$ and $D
    sum_(A subset b) \| A \| chevron.l frak(h) \( q_A - 1 \) chevron.r$;]
  + #emph[on low pieces, the $S$ form and the integrated positive quasiparticle form in (3.12);]
  + #emph[on number sectors outside $\[ D v_b \/ 2 \, 6 D v_b \]$,
    the sum of $\( n + D v_b \)$ times their squared norms.]
] <lem:energy-surplus>

#proof[
  On a high piece $n_L gt.eq M \/ 8$, so its rough kinetic term supplies at least $c M \/ E^2$.
    This pays for the error $C v_b D^(1 - 0.001)$ and the $O \( v_b \)$ Lee–Huang–Yang tangent correction:
    the relevant ratio is $D^0.001 Q^(- 402) arrow.r oo$. A fixed fraction of the kinetic term remains.
    The scalar quadratic remainder controls $D v_b frak(h) \( n \/ \( D v_b \) - 1 \)$ in the middle range.
    It also recenters the microcell penalty at one, since $frak(h) \( s + t \) lt.eq
    C \( frak(h) \( s \) + frak(h) \( t \) \)$ and $sum_(A subset b) \| A \| = v_b$.
  On low pieces convexity of $e$ retains the same box penalty in addition to the two positive forms of Lemma 7.
    Below the middle range the scalar rough bound exceeds $t_b \( n \)$ by $c D v_b$, after its error is absorbed.
    Above it the grouping argument used for (3.7) gives a surplus $c n$.
    These also control the stated box penalty on the outliers.
    Box counts commute with the localizations, so their penalties sum back to the original restrictions.
    Finally combine (3.2), (3.3), and (3.9). The total scalar errors are
    $O \( V Q^(- 1 \/ 4) + V Q^(- 1) + V D^(- c_(*)) \)$, which are $O \( V Q^(- 1 \/ 5) \)$ after making $u$
    small relative to $c_(*)$. ◻
]

At $E = R$, the first conclusion immediately gives a clipped second moment of $q_b -
  1$ bounded by $C D^(- 1) Q^(- 1 \/ 5)$. We next prove the microcell fourth moment at $E = B$.
  This is where retaining the excitation gap, rather than only the scalar energy, is useful.

For a microcell $A subset b$, put

$ X_A = n_A - n \| A \| \/ v_b = upright(d) Gamma #scale(x: 120%, y: 120%)[\(] upright(bold(1))_A - \| A \| \/ v_b
  #scale(x: 120%, y: 120%)[\)] . $

Its one-body summand has norm at most one and zero constant-mode diagonal. Hence for every $n$-particle vector $eta$,

#[#set math.equation(numbering: n => "(3.26)")
 $ parallel X_A^2 eta parallel^2 lt.eq C n^2 chevron.l \( n_(+) + 2 \)^2 chevron.r_eta . $ <eq:energy-fourth-block>]

Indeed its three blocks relative to $P xor P^perp$ change $n_(+)$ by $1 \, - 1 \, 0$.
  Between the $k$ and $k + 1$ sectors their norms are bounded by $sqrt(\( n - k \) \( k + 1 \))$,
  and the diagonal norm is at most $k$. Thus $X_A^2$ has bandwidth two and blocks of norm at most $C
  n \( k + 2 \)$. Squaring and using Cauchy–Schwarz over the bounded overlaps proves (3.26).

Lemma 8 gives

#[#set math.equation(numbering: n => "(3.27)")
 $ 1 / V sum_(upright("low")) chevron.l n_(+) chevron.r lt.eq C Q^(2 - 1 \/ 5) \, wide 1 /
   V sum_(upright("low")) chevron.l n_H chevron.r lt.eq C Q^(2 - 1 \/ 5) \/ J . $ <eq:energy-gap-counts>]

Combine these with (3.16) and (3.26). Dividing by $\( D \| A \| \)^4$ and uniformly averaging all microcells gives
  the bound

#[#set math.equation(numbering: n => "(3.28)")
 $ C_j (D^(- 1) Q^(- 386 - 1 \/ 5) + D^(- 1) Q^(- 86 - 1 \/ 5) + D^(- 2) Q^6 + D^(- 2) Q^11)
   $ <eq:energy-microcell-error>]

for the low-piece fourth moment centered at the relative box mean.
  To check the volume factors, $n^2 lt.eq C D^2 Q^6$, and averaging the $O_j \( Q^3 \)$ microcells of each box
  gives prefactor at most $C_j D^(- 2) Q^9 \/ V$ before the summed excitation moments.
  The terms $M n_(+)$ and $n n_H$ then give the first two powers in (3.28);
  constants and the linear term in $\( n_(+) + 2 \)^2$ give the last two.

Fix a finite clipping level, allowed to depend on $j$. On the middle number range,
  a clipped fourth power of the box mean minus one is bounded by a constant times its square,
  so the box penalty recenters the preceding estimate at one.
  On high pieces a clipped fourth power of $q_A - 1$ is bounded by $C_j frak(h) \( q_A - 1 \)$.
  On outlying number sectors it is bounded by a constant times the norm penalty of Lemma 8 after averaging cells.
  Since $psi = F_1 psi + F_2 psi$, the triangle inequality applied to the square root of the clipped nonnegative
  observable bounds its expectation in the original middle vector by twice the sum of those in $F_1 psi$ and $F_2
  psi$. The extra low piece $F_3 psi$ needed for energy localization has a nonnegative contribution and may be
  omitted here. This proves the clipped fourth-moment bound for the original ground state.
  The estimates beat $D^(- 1) Q^(- 1 \/ 6)$ for sufficiently small $u$.

We remove clipping only at this point, in the original state where (2.6) applies.
  Choose a large fixed unit-count threshold $C_0 D$. Except on the event that some constituent unit cell exceeds
  that threshold, an $R$-cell has bounded relative count and a $d$-cell has relative count at most $C_0 d^(- 3)$.
  A fixed count moment is polynomial in $D$, also for regions with polynomially many unit cells, by (2.7).
  Cauchy–Schwarz and the exponential upper tail therefore bound every discarded second or fourth moment by a
  quantity smaller than every inverse power of $D$. This proves both count assertions in (3.1),
  with their stated slightly weaker exponents.

=== 3.6 Recovering the occupation from the quasiparticle vacuum <recovering-the-occupation-from-the-quasiparticle-vacuum>

It remains to extract the two occupation statements. Use $E = B$ in this subsection.
  For $l = R$ or $d$, the one-body operator $W_l$ acts within each $B$-box, annihilates its constant, and satisfies

#[#set math.equation(numbering: n => "(3.29)")
 $ 0 lt.eq W_l lt.eq 1 \, wide W_l lt.eq C l^2 \( - Delta_(upright("Neu")) \) . $ <eq:energy-projector-bounds>]

The second inequality is the Poincaré inequality on its component $l$-cells.
  On high pieces these bounds control $upright(d) Gamma \( W_l \)$ by $C \( 1 + R^2 \) upright(d)
  Gamma \( min { p^2 \, 1 } \)$: split at $p^2 = 1$ and use form Cauchy–Schwarz for the cross term.
  Lemma 8 then makes the contribution $o \( V \)$ because $R^2 B^(- 1 \/ 5) = o \( 1 \)$.
  Outlying sectors contribute $o \( V \)$ by their norm penalty.

For a low piece at a coherent parameter, the Bogoliubov coefficients satisfy

#[#set math.equation(numbering: n => "(3.30)")
 $ \| V_p \|^2 lt.eq C min { \| p \|^(- 1) \, \| p \|^(- 4) } \, wide p^2 \| U_p \|^2 lt.eq
   C D_p quad \( p upright(" low") \) . $ <eq:energy-uv-control>]

For high $p$, $U_p$ is bounded and $tilde(D)_p gt.eq c J \/ E^2$. Define the vacuum trace and positive form

$ T_l \( z \) = sum_(p eq.not 0) \( W_l \)_(p p) \| V_p \|^2 \, wide cal(Q)_z \( eta \) =
  sum_(p eq.not 0) tilde(D)_p parallel b_p eta parallel^2 . $

Shell summation gives $T_l \( z \) lt.eq C v_b$, uniformly in the allowed $z$.
  Substituting (3.11) into the observable yields

#[#set math.equation(numbering: n => "(3.31)")
 $ lr(|chevron.l upright(d) Gamma \( W_l \) chevron.r_eta - T_l \( z \) parallel eta parallel^2|) lt.eq  &
   C \( 1 + R^2 \) cal(Q)_z \( eta \)\
 & + C #scale(x: 120%, y: 120%)[\[] \( 1 + R^2 \) cal(Q)_z \( eta \) T_l \( z \) parallel eta parallel^2
   #scale(x: 120%, y: 120%)[\]]^(1 \/ 2) . $ <eq:energy-observable-comparison>]

Here is a useful way to see all terms. Apply $W_l^(1 \/ 2)$ to the column $\( U_p b_p eta \)_p$.
  Its squared norm is bounded by the first term on the right, using (3.29) and (3.30) on the low band,
  and $W_l lt.eq 1$ on the high band. For the column $\( V_p b_p^(*) eta \)_p$, commute $b$ past $b^(*)$.
  The commutator is exactly $T_l \( z \) parallel eta parallel^2$,
  and the remaining excitation term has the same bound, also for the transposed matrix.
  Cauchy–Schwarz bounds the two cross terms and gives (3.31).

Integrate (3.31) over coherent parameters and sum low pieces.
  By Lemma 8 its right side is $o \( V \)$; for the square-root term use Cauchy–Schwarz and $sum v_b parallel psi
  parallel^2 lt.eq V$. Coherent resolution is exact for this observable,
  and its large-$z$ tail is negligible by the particle-number bound.
  The one-body localization error already controlled after (3.9) is also negligible.
  We have therefore reduced both occupations to the averaged traces $T_l \( z \)$.

To evaluate them, weight each low coherent piece on $\| z \|^2 lt.eq
  2 n$ by $v_b parallel psi_z parallel^2 \/ V$ and include its spectator and sector integrals.
  The resulting finite measure has mass tending to one, and

#[#set math.equation(numbering: n => "(3.32)")
 $ rho_z \/ D arrow.r 1 quad upright("in its measure") . $ <eq:energy-coherent-concentration>]

Indeed the retained gain $c M \/ E^2$ bounds the high-piece mass by $C D^(- 1) Q^(402 - 1 \/ 5) = o \( 1 \)$;
  the number penalty controls outlier mass, and the omitted coherent tail is exponentially small.
  The box penalty makes $n \/ \( D v_b \)$ concentrate at one; (3.27) makes $n_(+) \/ \( D v_b \)$ negligible.
  Finally, after angular integration the coherent radial variables have gamma shapes $n - n_(+) +
  1$ and variances of that same order. Their fluctuations divided by $D v_b$ vanish.
  This proves (3.32) with the prescribed order of limits.

On every compact momentum annulus, shrinking support of $g$, $tau_p arrow.r p^2$,
  and (3.32) show that $\| V_p \|^2$ converges in this average to

$ F_alpha \( p \) = 1 / 2 (frac(p^2 + 8 pi alpha, sqrt(p^4 + 16 pi alpha p^2)) - 1) . $

The summable majorant in (3.30) removes the small and large momentum tails, uniformly in the coherent parameters.
  Neumann Riemann sums then converge with full-space measure $thin upright(d) macron(p) = \( 2 pi \)^(- 3) thin
  upright(d) p$.

For $W_R$, its diagonal entries tend uniformly to one on compact annuli.
  In fact the average of a cosine over a cell of side $R$ tends to zero when one of its frequencies is bounded
  away from zero; on an annulus at least one component has this property,
  and the product cosine formula gives the uniform assertion.
  For $W_d$, (3.29) gives $\( W_d \)_(p p) lt.eq min { 1 \, C d^2 p^2 }$. Thus its limiting trace density is bounded by

$ integral_(bb(R)^3) min { 1 \, C d^2 p^2 } C min { \| p \|^(- 1) \, \| p \|^(- 4) } thin thin upright(d) macron(p) \, $

which tends to zero as $d = 1 \/ j arrow.r 0$ by dominated convergence. For $W_R$ the full limiting integral is

$ integral_(bb(R)^3) F_alpha \( p \) thin thin upright(d) macron(p) & =
  frac(\( 8 pi alpha \)^(3 \/ 2), 4 pi^2) integral_0^oo (frac(x \( x^2 + 1 \), sqrt(x^2 + 2)) - x^2) thin upright(d) x\
 & = frac(8, 3 sqrt(pi)) alpha^(3 \/ 2) . $

The radial integral is $sqrt(2) \/ 3$, again by elementary integration. This completes the proof of Proposition 5.

== 4 Short paths and uniform insertion estimates <sec:paths>

Proposition 5 determines the occupation outside the $R$-cell constants.
  We now prepare comparisons that will control the remaining variation between cells.
  For a cell $v$ of $cal(C)_d$ or $cal(C)_R$, define a measure on the remaining $N - 1$ coordinates $Y'$ by

#[#set math.equation(numbering: n => "(4.1)")
 $ P_v \( thin upright(d) Y' \) = s_v \( Y' \)^2 thin upright(d) Y' \, wide s_v \( Y' \) =
   (frac(V, \| v \|) integral_v Phi \( y \, Y' \)^2 thin thin upright(d) y)^(1 \/ 2) . $ <eq:palm-density>]

Translation invariance makes the first particle uniform on the torus.
  Thus $P_v$ is the law obtained by conditioning that particle to lie in $v$ and then forgetting its position.
  We call it the deletion measure for $v$.

We shall prove two comparisons of these square-root densities.
  For the uniform average over ordered adjacent $d$-cell pairs, the local target is

#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E)_(v tilde.op w') integral frac(\| s_v - s_(w') \|^4, s_v^2 + s_(w')^2) thin thin upright(d) Y' lt.eq
   C_j D^(- 1 - u \/ 8) \, $ <eq:local-fourth>]

where the quotient is zero when both densities vanish. For the distant target,
  let $cal(P)_R$ be the ordered pairs $\( v \, w' \) in cal(C)_R^2$ whose centers have forward first-coordinate
  displacement in $\[ .30 K \, .45 K \]$, with no restriction on the transverse displacements. We shall prove

#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E)_(\( v \, w' \) in cal(P)_R) integral \| s_v - s_(w') \|^2 thin thin upright(d) Y' = o \( D^(- 1) \) +
   o_K \( 1 \) . $ <eq:distant-comparison>]

The first estimate controls the passage from fine to coarse root mean squares;
  the second controls their variation across the full torus.
  Section 7 transfers both estimates to the arithmetic means defining the cell projections.

The constructions in Sections 5 and 6 use two copies of the ground-state paths.
  They change trajectories while retaining their endpoints and arrange that deleting the two distinguished
  midpoints leaves the same remaining coordinates. This section constructs the exact conditional path law and
  establishes insertion estimates uniform in the other allowed paths and in the removal of interaction checks.
  Those uniformities will permit the later likelihood comparisons.
  The construction adapts the short-trajectory method of #cite(label("D")) Section 5;
  for the present bounded interaction, its exact conditional weight must be retained.

Fix $x > 0$ sufficiently small after $u \, w$, and put

#[#set math.equation(numbering: n => "(4.4)")
 $ t = frac(1, x log D) \, wide f_0 = D^(- x) \, wide s_1 = D^(- 4 \/ 5) \, wide b_0 = C_1 / sqrt(x) \, wide L_0 =
   C_2 sqrt(log D) . $ <eq:path-scales>]

Choose the large absolute constants in the order $C_1$, then $C_2$.
  We may decrease $x$ so that $b_0$ exceeds every absolute step size used below.
  Constants denoted $C_x$ may depend on $x$ and on fixed neighborhood sizes.
  In exponents such as $C x$ and $C sqrt(x)$, however, $C$ is independent of small $x$.
  All assertions hold for sufficiently large $D$ and then sufficiently large $K$,
  in the order of limits fixed in Section 2.

=== 4.1 Exposed data and the exact conditional law <exposed-data-and-the-exact-conditional-law>

Restrict the stationary ground-path law of Section 2 to $\[ - t \, t \] subset \[ - 1 \/ 2 \, 1 \/ 2 \]$. Write

$ Y_i = omega_i \( - t \) \, wide X_i = omega_i \( 0 \) \, wide Z_i = omega_i \( t \) . $

A lift $tilde(omega)_i$ to $bb(R)^3$ satisfies the motion cutoff if

#[#set math.equation(numbering: n => "(4.5)")
 $ \| tilde(omega)_i \( q \) - tilde(omega)_i \( q' \) \| lt.eq L_0 sqrt(\| q - q' \| + r^2) \, wide - t lt.eq
   q \, q' lt.eq t . $ <eq:motion-cutoff>]

Call a label #emph[eligible] when the following conditions hold:

+ At each endpoint time its position is more than $s_1$ from every other label’s position.
  The two endpoints have representatives at Euclidean distance at most $b_0$.
+ The path has the winding determined by these nearby representatives, satisfies (4.5),
  and remains within $20 b_0$ of their mean $m_i = \( Y_i + Z_i \) \/ 2$ in this lift.

For sufficiently large $K$, these nearby displacements and all subsequent local comparisons have unique compatible
  lifts, up to a common torus translation.

Independently flag each label with probability $f_0$, and let $I$ be the set of flagged eligible labels.
  We expose the two endpoint configurations, all flags, membership in $I$,
  and the complete paths of labels outside $I$. We call those paths #emph[frozen].
  A further augmentation turns the soft interaction into an exact indicator constraint. Set

$ a_(i k) \( omega \) = exp {- integral_(- t)^t W \( omega_i \( q \) - omega_k \( q \) \) thin thin upright(d) q} . $

In the Feynman–Kac density, replace each factor $a_(i k) \( omega \)$ by integration over $u_(i k)
  in \[ 0 \, 1 \]$ of the indicator

#[#set math.equation(numbering: n => "(4.6)")
 $ upright(bold(1))_({ u_(i k) lt.eq a_(i k) \( omega \) }) . $ <eq:soft-check>]

Thus the joint density is the original endpoint-weighted free-path density times these indicators and Lebesgue
  measure in all $u_(i k)$. Its path marginal is unchanged.
  Equivalently, given the paths, one may sample $u_(i k)$ uniformly on $\[ 0 \, a_(i k) \( omega \) \]$.
  These variables are not independent uniforms on $\[ 0 \, 1 \]$ after conditioning on the paths.
  Expose all of them, and denote the entire exposed datum by $cal(D)$.

Let $B_i$ be the probability law of the Euclidean Brownian bridge of generator $Delta$ on $\[ - t \, t \]$ between
  the nearby representatives of $Y_i \, Z_i$. Its path space uses the chosen lift.
  For $i in I$, let $J_i$ be the indicator of the motion cutoff and the $20 b_0$ tube.

#thm([Lemma 4.1.])[
  (Conditional soft-interaction law).  #emph[For almost every exposed datum $cal(D)$,
    the conditional law of the paths with labels in $I$ is
#[#set math.equation(numbering: n => "(4.7)")
 $ frac(1, Z \( cal(D) \)) product_(i in I) J_i \( omega_i \) product_(i < k\
{ i \, k } ∩ I eq.not diameter) upright(bold(1))_({ u_(i k) lt.eq a_(i k) \( omega \) }) product_(i in I)
  B_i \( thin upright(d) omega_i \) \, wide Z \( cal(D) \) > 0 . $ <eq:conditional-path-law>]

 Frozen paths in this formula are held at their exposed values.
   Every pair indicator can fail only if the two paths approach within distance $r$ at some time.]
] <lem:conditional-path-law>

#proof[
  At fixed endpoints, the factors involving the ground function are constant.
    Conditional on winding, each free torus bridge is a Euclidean bridge;
    its winding weight also becomes constant. Endpoint separation is already determined by the exposed endpoints.
    Given these endpoints, the eligibility of any one label depends only on that label’s path.
    For a flagged label outside $I$ its path, and hence the failure of eligibility, is exposed.
    For a label in $I$ eligibility imposes exactly $J_i$ and the selected winding.
    Disintegration of the augmented density therefore gives (4.7).
    Its normalizer is positive on almost every realized fiber.
    Finally, $W$ vanishes outside range $r$, so absence of a close approach makes $a_(i k) = 1$. ◻
]

All subsequent conditional comparisons use this indicator law.
  The values $u_(i k)$ remain fixed throughout a comparison; collision bounds will hold uniformly in them.

=== 4.2 Good sites and their probability <good-sites-and-their-probability>

For an interior choice at a lattice site $z in cal(L)$, we use labels in $I$ whose initial endpoint belongs to
  $U_z$ and whose endpoint displacement is at most one. Later,
  a label at the end of a comparison may have displacement up to $b_0$; its site will be the unit cell containing $m_i$.

Choose a uniform mesh on each half of $\[ - t \, t \]$, with an even number of intervals and common interval
  length $Delta in \[ r^2 \/ 2 \, r^2 \]$. The midpoints of the two halves are therefore mesh points as well.
  For a mesh interval $e$, define

$ A_e \( omega \) = r^(- 1) "diam" tilde(omega) \( e \) . $

Fix neighborhoods large enough to contain every collision test for a label associated with $z$.
  Balls of radius $1000 b_0$ about $z$, with a fixed enlargement to include intersecting unit cells, suffice.
  The actual collision tests below use distances less than $200 b_0$.
  Fixed further enlargements do not affect any conclusion. The flagged paths are sparse,
  so endpoint counts will suffice to sum their collision costs.
  For the denser frozen collection we also record positions and short-interval oscillations, allowing a sharper sum.

A site $z$ is #emph[good] if the following conditions hold:

+ It has at least $c f_0 D$ interior labels.
+ In its neighborhood, every unit cell has at most $C D$ endpoints at each endpoint time and at most $C f_0
  D$ flagged endpoints. At each endpoint time, every ball of radius $h
  in \[ r \, 1 \]$ in the neighborhood has flag count at most
  #[#set math.equation(numbering: n => "(4.8)")
   $ C \( f_0 D h^3 + D^.01 \) . $ <eq:flag-count>]
+ Each frozen path visiting the neighborhood satisfies (4.5) and has lifted diameter at most $10 b_0$.
  For every mesh point $q$, either adjacent interval $e$, and every ball of radius $h in \[ r \, 1 \]$ there,
  the sum over frozen paths whose positions at $q$ are in the ball, with weights $\( 1 + A_e \)^3$, is at most
  #[#set math.equation(numbering: n => "(4.9)")
   $ C \( D h^3 + D^.01 \) . $ <eq:weighted-count>]

Here $c$ is sufficiently small and $C$ sufficiently large. These are conditions on $cal(D)$.
  To make their measurability explicit, one may use countably many ball centers and radii.
  Equivalently, strengthened finite tests on enlarged ball nets at dyadic scales imply the stated bounds with a
  fixed change in $C$.

We also define an event concerning the #emph[original sampled paths] in a fixed neighborhood:
  require (4.9) for all paths, require (4.5) for every visiting path,
  and require its supremum distance from each of its endpoints to be at most $b_0$ in the lift.
  We call these the #emph[full-path bounds]. They will estimate the mass of successful comparisons.
  We do not add this event to $cal(D)$ or condition the bridge law on it.

#thm([Proposition 4.2.])[
  (Probability of good data).  #emph[The constants in the preceding definitions can be chosen so that
#[#set math.equation(numbering: n => "(4.10)")
 $ bb(P) \( z upright(" is bad") \) & lt.eq C_x D^(- 1 - 1 \/ 8) \,\
bb(P) \( upright("every site in ") A upright(" is bad") \) & lt.eq p^(\| A \|) &  & \( A subset cal(L) \) \,\
bb(P) \( upright("full-path bounds fail in a fixed neighborhood") \) & lt.eq C_x D^(- 6) . $ <eq:good-prob>]

 In the second line $p > 0$ may be any sufficiently small fixed number, after increasing the threshold for $D$.
   The constants and thresholds are uniform in the position of the neighborhood and in the volume.]
] <prop:good-data>

#proof[
  We give separate estimates for motion, the supply of eligible labels, and the fine spatial counts.
    All use the deletion estimate (2.10) and the count exponential bound (2.7).
  ===== 4.2.1 Motion and exceptional visitors. <motion-and-exceptional-visitors.>
  Gaussian maximal bounds imply that a free path on the short slab fails (4.5),
    or has supremum distance greater than $b_0$ from either endpoint, with probability at most $C D^(- 40)$.
    For the increment condition, apply Gaussian bounds with fixed slack to all mesh point pairs,
    and bound the oscillation on every intervening interval. There are polynomially many such tests.
    The choice of $C_1$, followed by $C_2$, makes the exponent as large as required.
  The same bound applies to the individual cutoffs of a free trial bridge with endpoint displacement at most
    $b_0$, and also to a bridge pinned at time zero at a point within $8 b_0$ of its endpoint mean.
    For this last assertion the cutoffs are (4.5) and the $20 b_0$ tube,
    not the stronger distance-$b_0$ condition. The prescribed linear segments have increment coefficient at most
    $C b_0 \/ sqrt(t) = C C_1 sqrt(log D)$ and lie well inside that tube.
    A centered bridge is Brownian motion minus its linear interpolation,
    so Gaussian maximal bounds apply after enlarging constants.
    Splitting an interval that crosses the pin gives the same estimate there.
  Here is the transfer from free exceptions to ground-law visitors.
    For a site set $A$, let $N_A \( omega \)$ count how many of the fixed neighborhoods centered in $A$ a path
    visits. Suppose a reversal-invariant single-path event $cal(E)$ has free probability at most $l$,
    uniformly in the starting point. For each fixed $q > 0$,
  $ bb(E)_(upright("free"))^y [e^(q N_A upright(bold(1))_(cal(E))) - 1] lt.eq C_q l^(1 \/ 3) e^(- d_K \( y \, A \)) . $
  To justify the uniform exponential moment of $N_A$, mark successive exits from unit-radius balls centered at the
    previous exit point. Each segment meets only a bounded number of the prescribed neighborhoods.
    If $tau$ is one exit time, the strong Markov property and exponential Markov inequality bound the probability
    of at least $m$ exits in time at most two by $e^(2 h) \( bb(E) e^(- h tau) \)^m$.
    Taking $h$ large yields every fixed exponential moment. Reaching the neighborhoods of $A$ also has a Gaussian
    distance tail. Hölder’s inequality combines these two facts with $bb(P) \( cal(E) \) lt.eq
    l$ to prove the displayed estimate.
  Expand the product over labels of $1 + \( e^(q N_A upright(bold(1))_(cal(E))) - 1 \)$,
    apply (2.10) to each selected set, and then use (2.7). For sufficiently small $l$ this gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ log bb(E) exp (q sum_i N_A \( omega_i \) upright(bold(1))_(cal(E)_i)) lt.eq
     C_q D l^(1 \/ 3) \| A \| . $ <eq:visitor-exponential>]
  The same argument applies to an event after adjoining its time reversal.
    It also bounds the expected number of exceptional visitors: $C D l^(1 \/ 3)$ per site.
    With $l lt.eq C D^(- 40)$, these losses are smaller than the powers required in (4.10).
    Choosing $q$ first, then $D$, makes the joint exponential base as small as desired.
    The endpoint displacement exceeding one has free probability tending to zero.
    Applying (4.11) to that event shows that loss of a fixed positive fraction of $D$ labels at every site of a
    prescribed set costs $e^(- c D \| A \|)$.
  ===== 4.2.2 Eligible labels and their flags. <eligible-labels-and-their-flags.>
  The lower count tail in (2.6) supplies a fixed positive multiple of $D$ initial endpoints at each site,
    outside its stated exceptional event. The preceding motion estimates remove only a small fraction.
    By (2.11), the expected number of ordered close endpoint pairs in a fixed neighborhood is at most $C_x D^2
    s_1^3$. Therefore the probability that endpoint separation removes a fixed fraction of the supply is at most
  $ C_x D s_1^3 = C_x D^(- 7 \/ 5) . $
  Use this at each of the two endpoint times, with the fixed enlargement needed after displacement removals.
  For a joint bound, it is enough to bound the event of at least one close pair in each of $m$ sufficiently
    separated neighborhoods at one common endpoint time. Its probability is at most
  #[#set math.equation(numbering: n => "(4.12)")
   $ \( C_x D^2 s_1^3 \)^m . $ <eq:joint-close-pairs>]
  Indeed, at a common time the spatially separated neighborhoods ensure that the chosen pairs have distinct labels
    across neighborhoods. Repeat the cube-cover proof of (2.11), using (2.10) for the $2 m$ labels.
    The remaining start weights are bounded by $bb(E) product_(z in A) F_z^2 lt.eq \( C D \)^(2 m)$, where $F_z =
    sum_i e^(- d_K \( Y_i \, z \))$. For completeness,
  $ sum_(z in A) e^(- d_K \( y \, z \)) lt.eq C e^(- d_K \( y \, A \) \/ 2) . $
  The proof of (2.7) also holds with distance exponent $1 \/ 2$, so $log bb(E) e^(h sum_(z in A) F_z) lt.eq
    C h D m$ for fixed sufficiently small $h$. The elementary bound $product F_z^2
    lt.eq \( sum F_z \/ m \)^(2 m)$, followed by the exponential moment bound at $h$ of order $D^(- 1)$,
    gives the asserted product moment. This proves (4.12); its base tends to zero since $D^2 s_1^3 = D^(- 2 \/ 5)$.
  A positive fraction of $D$ eligible labels consequently remains with the required one-site and joint bounds.
    Conditional on all paths, independent flags select at least $c f_0
    D$ of them except with a binomial lower-tail cost. Lists based at different sites are disjoint,
    so the same binomial argument gives joint bounds. Upper unit counts follow from (2.6);
    their flagged versions follow from binomial upper tails after the unit counts have been bounded.
  ===== 4.2.3 Fine spatial counts. <fine-spatial-counts.>
  It remains to establish (4.8) and (4.9), including the latter for all original paths.
    At sufficiently separated sites choose one test per site:
    a radius $h_z in \[ r \, 1 \]$, a mesh time, and, for the weighted test, an adjacent interval.
    In each count retain only paths satisfying the motion and diameter cutoffs.
    Exceptional visitors have already been estimated. Separation ensures that a retained path contributes to at
    most one chosen site’s test. On the cutoff, $A_e lt.eq C sqrt(log D)$.
    With $b'_D = \( log D \)^(- 2)$, a one-path exponential increment is therefore bounded by a sum of
  $ C b'_D \( 1 + A_e \)^3 upright(bold(1))_({ omega \( q_z \) upright(" lies in the tested ball") }) . $
  Consider its free expectation on the longer slab $\[ - 1 \, 1 \]$.
    The observation time remains uniformly away from either endpoint.
    The heat kernel and Gaussian increment moments give, for each site,
  $ C b'_D h_z^3 e^(- 3 d_K \( y \, z \)) . $
  For a preceding interval, first use the heat kernel at its initial point, translate the ball by the increment,
    and integrate the increment with its oscillation weight. This proves the same bound;
    the time-reversed tests satisfy it as well. For a flagged endpoint count,
    averaging the independent flag supplies the additional factor $f_0$.
  Expand over labels and apply (2.10) as before. Equation (2.7) then gives logarithmic moment bound $C b'_D D
    sum_z h_z^3$, or $C b'_D f_0 D sum_z h_z^3$ for flag counts.
    For unequal radii, write $h_z^3$ as an integral of level-set indicators on $\[ 0 \, 1 \]$, use convexity,
    and use $sum_(z in A) e^(- 3 d_K \( y \, z \)) lt.eq C e^(- d_K \( y \, A \))$ for each level set.
    Exponential Markov inequality, with the constant in the tests chosen sufficiently large,
    bounds simultaneous violations by
  $ e^(- c b'_D D^.01 \| A \|) . $
  There are only polynomially many tests per site on enlarged dyadic ball nets;
    this cost still tends to zero faster than every negative power of $D$.
  Finally, partition arbitrary site sets into a bounded number of separated classes.
    Split failures among the finitely many types just considered.
    For any assignment of types and classes, one class and type contains a fixed fraction of the failing sites,
    and its probability has arbitrarily small exponential base.
    The finite number of assignments is absorbed by making that base smaller.
    The one-site error is dominated by $D^(- 7 \/ 5)$, and the full-path errors have the stronger bounds proved
    above. This yields all of (4.10). ◻
]

=== 4.3 The cost of one pair check <the-cost-of-one-pair-check>

We now work at fixed good data. Paths of other labels in $I$ may take arbitrary values satisfying their individual
  cutoffs; they need not be sampled from the conditional law.
  This uniformity will allow us to change subsets of pair checks in later comparisons.

For distinct labels $i \, k$, with trial label $i$ eligible, define

#[#set math.equation(numbering: n => "(4.13)")
 $ beta_(i k) & = b_D (1 + frac(1, s_1 or d_K \( Y_i \, Y_k \)) + frac(1, s_1 or d_K \( Z_i \, Z_k \))) \,\
b_D & = C_x D^(- 1) \( log D \)^C . $ <eq:beta>]

The fixed polylogarithmic factor may be enlarged throughout this section.
  In particular, $beta_(i k) lt.eq C_x D^(- .19)$ for large $D$.

#thm([Lemma 4.3.])[
  (Collision costs).  #emph[Fix a trial label $i$ with eligible endpoints and a distinct opponent $k$ satisfying
    the motion cutoff. The $B_i$-probability that the trial satisfies its individual cutoffs and comes within $r$
    of the opponent is at most $C beta_(i k)$. The same holds for a trial pinned at a point $y$ within $8
    b_0$ of $m_i$, provided $d_K \( y \, omega_k \( 0 \) \) > s_1$, with the additional cost
#[#set math.equation(numbering: n => "(4.14)")
 $ m \( y \, omega_k \) = frac(b_D, s_1 or d_K \( y \, omega_k \( 0 \) \)) . $ <eq:midpoint-cost>]

 If instead $y$ is uniform in a unit cell at an absolute bounded distance from $m_i$,
   entirely within this pin range, the integrated cost is at most $C_x beta_(i k)$,
   including failure of the midpoint separation condition. These bounds also bound failures of (4.6),
   uniformly in its exposed auxiliary variable.]
] <lem:collision-cost>

#proof[
  Orient each half of an unpinned bridge from its nearer endpoint.
    For a pinned bridge, do the same on the two halves of each pinned leg.
    At the starting point of an oriented piece, suppose the separation from the opponent is $h gt.eq s_1$.
    On the motion cutoffs the paths cannot collide before elapsed time $c_x h^2 \/ log D$.
    This is much greater than $Delta$. A collision on a mesh interval forces the positions at an adjacent mesh
    point to be within $C r sqrt(log D)$. At elapsed time $q$ in this oriented piece the trial has density at most
    $C q^(- 3 \/ 2)$, since we use at most half of the relevant bridge. Summing from the lower cutoff gives
  $ & C_x r^3 \( log D \)^(3 \/ 2) sum_(q gt.eq c_x h^2 \/ log D) q^(- 3 \/ 2)\
 & #h(25mm)  lt.eq C_x frac(r \( log D \)^C, h) \, $
  where the sum is over mesh points and $Delta asymp r^2$. All tests involve nearby lifts;
    alternatively the periodized Gaussian bound gives the same estimate.
    Adding the oriented pieces proves (4.13) and (4.14). Uniform averaging over a unit cell integrates the
    inverse-distance singularity, and midpoint separation fails on volume at most $C s_1^3 lt.eq C b_D$.
    This proves the averaged assertion. The last assertion follows from Lemma 9. ◻
]

=== 4.4 Uniform insertion probabilities <uniform-insertion-probabilities>

The one-check bound is already enough for the sparse set of flagged opponents.
  The frozen paths are much more numerous. Their weighted mesh counts give a sharper sum, of order $r D t$,
  that still tends to zero on the chosen short slab.

#thm([Proposition 4.4.])[
  (Insertion at good data).  #emph[Fix exposed data for which the sites involved are good,
    with all required neighborhoods included in their tests. The following bounds hold uniformly after deletion of
    any subset of pair checks.]
  + #emph[A $B_i$ trial with label $i in I$ satisfies its individual cutoffs and all imposed checks against frozen
    paths and specified other labels of $I$ with probability at least $3 \/ 4$.
    The other unexposed paths may have any values satisfying their individual cutoffs.]
  + #emph[The same bound holds when one first chooses a uniform midpoint in a unit cell at an absolute bounded
    distance from the trial mean, entirely within pin range, and then chooses the two independent bridge legs.
    Midpoint separation by $s_1$ from every opponent may be imposed as an additional test.
    For two such trials in different copies, using the same uniform midpoint and conditionally independent legs,
    joint success in their respective copies has probability at least $1 \/ 2$.]
  + #emph[Suppose the opponents are paths from the original sample satisfying the full-path bounds in the relevant
    neighborhood. A trial pinned at any point in its pin range, separated by $s_1$ from all opponent midpoints,
    has success probability at least $3 \/ 4$, provided its endpoints have the stated separations.
    This remains true after removing opponents or adding or replacing boundedly many relevant paths satisfying the
    individual cutoffs and these separations.]
  #emph[No assertion requires checks among the specified opponent paths to hold.
    Only their individual cutoffs and the stated data bounds are used.]
] <prop:insertion>

#proof[
  For opponents in $I$, tubes restrict attention to endpoints in a fixed neighborhood. Dyadic summation of (4.8) gives
  $ sum_k beta_(i k) lt.eq C_x b_D (f_0 D + D^.01 / s_1) = o \( 1 \) . $
  Lemma 11 proves this for both the free and uniform-midpoint trials, including the latter’s separation test.
  For frozen paths, work on one oriented piece of a trial as in the preceding lemma.
    Its starting point is $s_1$-separated from all opponents;
    for a pinned piece this includes midpoint separation. The motion cutoffs exclude collisions until elapsed time
  $ q_0 = c_x s_1^2 \/ log D . $
  At the initial mesh point of an interval with elapsed time $q gt.eq q_0$, the trial density is bounded in its lift by
  $ C q^(- 3 \/ 2) e^(- c \| z - a_q \|^2 \/ q) \, $
  where $a_q$ is the bridge mean. Conditional on that position,
    its motion on the interval has a deterministic drift toward the other bridge endpoint plus an independent
    centered Gaussian part. On the trial confinement event the drift is bounded by $C_x Delta \/ t lt.eq
    r$ for large $D$. The supremum of the centered part divided by $r$, denoted $U$,
    has a Gaussian tail independent of the conditioned position.
    A collision with frozen path $k$ thus requires the trial’s mesh-point position to be within
  $ C r \( 1 + A_e \( omega_k \) + U \) $
  of that opponent’s mesh-point position.
  We may now drop the trial cutoffs when integrating this necessary event.
    Truncate $U$ at a sufficiently large multiple of $sqrt(log D)$,
    incurring a negligible error even after summing all intervals.
    The displayed radius is $o \( sqrt(q) \)$, uniformly for $q gt.eq q_0$.
    Integrating the Gaussian density and $U$ and summing over opponents gives a cost per interval at most
  #[#set math.equation(numbering: n => "(4.15)")
   $ & C r^3 q^(- 3 \/ 2) sum_k \( 1 + A_e \( omega_k \) \)^3
     e^(- c' d_K \( omega_k \( q_(upright("mesh")) \) \, a_q \)^2 \/ q)\
 & #h(30mm)  lt.eq C_x r^3 #scale(x: 120%, y: 120%)[\(] D +
   D^.01 q^(- 3 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:frozen-one-interval>]
  Only paths visiting the tested neighborhood occur. To obtain the last inequality,
    use (4.9) in concentric shells of radius $sqrt(q)$, and cover larger shells by unit balls if needed.
    Since $q_0 gt.double r^2$, all the smallest relevant radii are among the tested scales.
    Gaussian decay makes the shell sum convergent.
  Summing (4.15) over the $O \( t \/ Delta \)$ mesh intervals on all oriented pieces yields
  #[#set math.equation(numbering: n => "(4.16)")
   $ C_x r (D t + D^.01 / sqrt(q_0)) + o \( 1 \) = o \( 1 \) . $ <eq:frozen-insertion-cost>]
  Indeed $r D t = O \( t \) arrow.r 0$ and $r D^.01 \/ sqrt(q_0) = O_x \( D^(- .19) sqrt(log D) \)$.
    For a uniform midpoint, its separation failure from frozen paths costs at most $C_x D s_1^3 = o \( 1 \)$,
    because their number in the relevant neighborhood is $O_x \( D \)$ by (4.9).
  The trial’s individual cutoffs fail with probability $O \( D^(- 40) \)$, as proved above.
    Thus the total failure probability in Assertions 1 and 2 is $o \( 1 \)$ and in particular at most $1 \/ 4$.
    The union bound for two copies gives joint success at least $1 \/ 2$, even though their midpoints are shared.
  For Assertion 3, the full-path bounds allow (4.15) to be applied to all original opponents.
    Removal only decreases the cost. Each additional relevant path costs at most $C_x b_D \/ s_1 =
    o \( 1 \)$ by Lemma 11; their number is bounded independently of $D \, K$. The same success bound follows.
    Every estimate bounds a sum of potentially failing individual or pair tests,
    so deleting checks and allowing previously untested checks among opponents does not change the proof. ◻
]

#thm([Corollary 4.5.])[
  (Domination by free bridges).  #emph[Take finitely many labels at good sites,
    with product reference law $product_i B_i$, individual cutoffs,
    and any selection of the pair checks just considered. Normalize their indicator-weighted law.
    Its marginal on any $q$ labels has density at most $C^q$ relative to their product free-bridge law.
    The same conclusion holds conditionally on any individually allowed values of the other paths for which the
    conditional law is defined.]
] <cor:bridge-domination>

#proof[
  For one label, the conditional density is an indicator divided by its insertion probability,
    which is at least $3 \/ 4$ by Proposition 12. Delete the $q$ selected labels and then insert them
    successively. Each insertion changes the normalization comparison by at most $4 \/ 3$.
    The resulting measure domination, tested against an arbitrary nonnegative function of those $q$ labels,
    proves the assertion. The same argument works at fixed individually allowed outside paths and with any checks
    deleted. ◻
]

We finish by recording the density cost of prescribing a midpoint. Under $B_i$ the midpoint density in its local lift is

#[#set math.equation(numbering: n => "(4.17)")
 $ g_i \( y \) = \( 2 pi t \)^(- 3 \/ 2) e^(- \| y - m_i \|^2 \/ \( 2 t \)) . $ <eq:bridge-midpoint-density>]

Replacing it by a uniform midpoint in a unit cell at an absolute bounded distance from $m_i$ costs at most $C
  D^(C x)$ in density. For two labels with $\| m_i - m_k \| lt.eq C$ for an absolute constant,
  the Gaussian formula gives, throughout either label’s pin range,

#[#set math.equation(numbering: n => "(4.18)")
 $ frac(g_i \( y \), g_k \( y \)) lt.eq C_x D^(C sqrt(x)) . $ <eq:midpoint-ratio>]

Indeed the difference of the two squared distances is at most $C b_0$, and $b_0 \/ t =
  O \( sqrt(x) log D \)$ with the fixed constants in (4.4).
  Conditioning a pair trial from Assertion 2 on success costs at most one additional factor two.
  These density statements concern a primary path, with the auxiliary bridge kept conditional on its midpoint if
  needed. A pair constrained to share its midpoint has no density relative to two independent full bridge laws;
  no such density will be used.

== 5 Deletion measures and local transport <sec:local-palm>

We now prove the adjacent-cell comparison (4.2) for the square roots of the deletion densities.
  We represent each deletion measure by an augmented path sample with a distinguished flagged label,
  then construct one measure that is close to the two adjacent deletion measures in fourth moment.
  The construction follows the local deletion argument of #cite(label("D")) Section 6;
  every conditional law below uses the exact soft-interaction checks of Lemma 9.

=== 5.1 Augmented deletion measures and count errors <augmented-deletion-measures-and-count-errors>

For a cell $v$ of $cal(C)_d$ or $cal(C)_R$, define

$ T_v = f_0 D \| v \| \, wide h_(v i) = upright(bold(1))_({ X_i in v }) \, wide A_v = 1 /
  T_v sum_(i upright(" flagged")) h_(v i) . $

Here $X_i = omega_i \( 0 \)$, and the expectation $bb(E)$ includes the ground path sample, its independent flags,
  and the auxiliary variables in (4.6). Define a finite measure on this augmented sample together with a
  distinguished flagged label by

$ integral H thin thin upright(d) P_(upright("aug") \, v) = bb(E) sum_(i upright(" flagged")) h_(v i) /
  T_v H \( omega \, cal(D) \, i \) . $

Delete the distinguished midpoint and order the other $N - 1$ midpoints uniformly at random,
  independently of all existing variables. The resulting projected measure is $P_v$ from (4.1).
  Indeed the midpoint law is $Phi^2 thin upright(d) X$, a specified flag has probability $f_0$ independently of
  that law, and symmetry makes all $N$ tag terms identical after projection.
  Their total coefficient is $N f_0 \/ T_v = V \/ \| v \|$.
  The mass of both the augmented measure and its projection is $bb(E) A_v = 1$.
  We keep these reference masses explicit when restricting tags and comparing the finite measures below.

We use normalized averages over cells and over adjacent ordered cell pairs.
  The periodic cubic adjacency graph is regular, so either cell marginal of its full edge average is a uniform
  cell average.

#thm([Lemma 5.1.])[
  (Flagged counts and omitted tags).  #emph[The local energy estimates imply
#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E)_(v in cal(C)_R) bb(E) \| A_v - 1 \|^2 & lt.eq C #scale(x: 120%, y: 120%)[\(] D^(- 1 - w \/ 6) +
   D^(- 1 + x) R^(- 3) #scale(x: 120%, y: 120%)[\)] \,\
bb(E)_(v in cal(C)_d) bb(E) \| A_v - 1 \|^4 & lt.eq C_j #scale(x: 120%, y: 120%)[\(] D^(- 1 - u \/ 6) +
  D^(- 2 + 2 x) #scale(x: 120%, y: 120%)[\)] . $ <eq:flag-moments>]

 Let
$ M'_v = 1 / T_v sum_(i upright(" flagged") \, med i in.not I) h_(v i) $

 be the relative count discarded when only tags in $I$ are retained. Uniformly over cells of either size,
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E) M'_v lt.eq C_(x \, j) D^(- 1 - 1 \/ 8) . $ <eq:tag-omission>]

 In expectations involving a fixed number of cells, each additional relative-count factor can be bounded by $C_j
   D^x$, at an error smaller than any prescribed power of $D^(- 1)$.
   The same assertion holds for fixed products of such factors.]
] <lem:local-counts>

#proof[
  Given the midpoint configuration, the flagged count $N_v^(upright(f))$ is binomial with parameters $n_v$ and
    $f_0$. Thus
  $ bb(E) \[ \( N_v^(upright(f)) - f_0 n_v \)^2 divides X \] lt.eq f_0 n_v \, wide
    bb(E) \[ \( N_v^(upright(f)) - f_0 n_v \)^4 divides X \] lt.eq
    C #scale(x: 120%, y: 120%)[\(] f_0 n_v + \( f_0 n_v \)^2 #scale(x: 120%, y: 120%)[\)] . $
  Apply these inequalities to
  $ A_v - 1 = frac(N_v^(upright(f)) - f_0 n_v, f_0 D \| v \|) + (frac(n_v, D \| v \|) - 1) . $
  The second summand is controlled by Proposition 5. The binomial contribution to the fourth moment is
    $C_j \( D^(- 2 + 2 x) + D^(- 3 + 3 x) \)$, whose second term is smaller for $x < 1$.
    The required ordinary count moments follow from (2.7). This proves (5.1).
  For the tail assertion, restrict first to the event that every unit cell meeting the indicated cells has count
    at most $C D$, for a sufficiently large fixed $C$. Then $A_v lt.eq C_j \/ f_0 = C_j D^x$.
    The complement has probability bounded by a polynomial in $D$ times $e^(- c D)$, even for an $R$-cell,
    by (2.6) and a union bound over $O \( R^3 \)$ unit cells.
    Equation (2.7) bounds every fixed moment of the counts there by a polynomial in $D$.
    Cauchy–Schwarz therefore makes any fixed count product on this complement smaller than every prescribed power
    of $D^(- 1)$.
  For (5.2), independence of flagging cancels $f_0$ from the normalization.
    The motion failures, including a violation of (4.5) or an ordinary displacement exceeding $b_0$,
    have a power saving stronger than (5.2), by (4.11). On their complement a possible tag in $v$ has both
    endpoints in a fixed enlargement of $v$, and its tube condition holds.
    At either endpoint time, the expected number of labels in a unit neighborhood having a second endpoint within
    $s_1$ is at most $C_x D^2 s_1^3$, by (2.11). Division by $D$ gives $C_x D s_1^3 = C_x D^(- 7 \/ 5)$.
    For an $R$-cell the number of unit neighborhoods is canceled by $\| v \|$ in the normalization.
    These bounds are stronger than (5.2). ◻
]

The comparisons will also discard failures of good data near their endpoint cells.
  For adjacent $d$-cells $v \, w'$, let $cal(G)_(v \, w')$ mean that every site in a fixed neighborhood of radius
  $C b_0$ of the two cells is good. Choose $C$ large enough to contain every possible tag mean and the coordinate
  routes used below. This event depends only on $cal(D)$. For two $R$-cells the corresponding neighborhoods have
  radius $C_x R$. By (4.10), their failure costs, in either augmented reference, at most

#[#set math.equation(numbering: n => "(5.3)")
 $ C_(x \, j) D^(- 1 - 1 \/ 8 + x) quad upright("at scale ") d \, wide C_x R^3 D^(- 1 - 1 \/ 8 + x) quad
   upright("at scale ") R . $ <eq:good-omission>]

To see this, use the union bound for the number of tested sites, and bound the reference weight by $A_v lt.eq
  C_j D^x$ off the negligible count tail. Multiplication of any omission by a fixed product of relative counts is
  handled by the last assertion of Lemma 14. Also $M'_v lt.eq A_v$,
  so on the same count event $\( M'_v \)^q lt.eq \( C_j D^x \)^(q - 1) M'_v$.

=== 5.2 Two copies with the same remaining midpoints <two-copies-with-the-same-remaining-midpoints>

Fix adjacent $d$-cells $v \, w'$ and retain $cal(G)_(v \, w')$. Choose distinct tags $i \, i_m in I$ with weight

#[#set math.equation(numbering: n => "(5.4)")
 $ frac(h_(v i) h_(w' i_m), T_v T_(w')) . $ <eq:tag-pair-weight>]

The site of a tag is the unit cell containing its near endpoint mean $m_i$.
  The tube condition places this site in a fixed enlargement of the indicated cell whenever its tag indicator is
  nonzero. Join the two tag sites by a simple coordinate route of nearest-neighbor sites.
  At each interior vertex choose an interior label uniformly from the available supply, excluding the two tags.
  Choices at different sites are independent given $cal(D)$ and the tags. This gives a list

#[#set math.equation(numbering: n => "(5.5)")
 $ i_0 = i \, i_1 \, dots.h \, i_m \, wide m lt.eq C_x = O \( x^(- 1 \/ 2) \) . $ <eq:local-list>]

If the two tag sites coincide, take just the two tags. The labels are distinct,
  consecutive means are at an absolute bounded distance, and each interior choice has point probabilities at most
  $C_x \/ \( D f_0 \)$. The route and these probability kernels depend only on the data and the tag identities;
  the weight (5.4) does not alter their definition.

Construct a left and a right path configuration. Keep all unlisted paths in both copies,
  the original path of $i_0$ on the left, and the original path of $i_m$ on the right.
  For $k = 1 \, dots.h \, m$, generate the left path of $i_k$ together with the right path of $i_(k - 1)$.
  Choose a common midpoint uniformly in a unit cell $C_k$ at an absolute bounded distance from both means.
  Fix $C_k$ as a measurable function of the endpoints before drawing any paths.
  Given the midpoint, propose the two paths independently as pinned free bridges.
  Condition this entire joint proposal, including its random midpoint, on the following tests:
  each path satisfies its individual cutoffs and every check (4.6) against retained paths and paths already
  inserted in its own copy. Proposition 12(2) gives success probability at least $1 \/ 2$,
  so every stage is a probability kernel. The accepted midpoint need not be uniformly distributed.

Every interaction in a finished copy is checked when the later of its two paths is inserted,
  or was already checked between retained paths. Both copies therefore belong to the same conditional data fiber.
  Their midpoint identities are

$ X_(i_k)^(upright("left")) = X_(i_(k - 1))^(upright("right")) \, wide 1 lt.eq k lt.eq m . $

Deleting $i_0$ on the left and $i_m$ on the right leaves the same midpoint multiset.
  Give the left remaining labels a uniform random order and give the right labels the order induced by these
  pairings and the unchanged labels. Each order is marginally uniform.
  Weighting the original sample by (5.4), and averaging tags, choices, and these kernels,
  defines a single finite measure $nu_(v \, w')$ on the remaining coordinates.
  It has a lift to either augmented reference: observe the left copy with tag $i_0$,
  or the right copy with tag $i_m$. Figure 1 displays the midpoint pairing.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.9075, 1.3), [left copy], anchor: "east", padding: 0.1176cm)
  content((-0.9075, 0), [right copy], anchor: "east", padding: 0.1176cm)
  content((-0.2828, 1.017), (0.2828, 1.583), [#set text(hyphenate: false); #align(center + horizon)[$i_0$]], frame: "circle", fill: rgb("#f0f0f0"), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  content((-0.2828, -0.2828), (0.2828, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[$i_0$]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((1.367, 1.017), (1.933, 1.583), [#set text(hyphenate: false); #align(center + horizon)[$i_1$]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((1.367, -0.2828), (1.933, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[$i_1$]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((3.017, 1.017), (3.583, 1.583), [#set text(hyphenate: false); #align(center + horizon)[$i_2$]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((3.017, -0.2828), (3.583, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[$i_2$]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((4.667, 1.017), (5.233, 1.583), [#set text(hyphenate: false); #align(center + horizon)[$i_3$]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((4.667, -0.2828), (5.233, 0.2828), [#set text(hyphenate: false); #align(center + horizon)[$i_3$]], frame: "circle", fill: rgb("#f0f0f0"), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  line((1.33, 1.048), (0.3197, 0.2519), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((0.825, 0.65), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$y_1$]]])])
  line((2.98, 1.048), (1.97, 0.2519), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((2.475, 0.65), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$y_2$]]])])
  line((4.63, 1.048), (3.62, 0.2519), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((4.125, 0.65), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$y_3$]]])])
  line((-0.2878, 1.012), (0.2878, 1.588), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10))
  line((4.662, -0.2878), (5.238, 0.2878), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10))
  content((0, 1.82), [#text(size: 9pt)[delete]], anchor: "south", padding: 0.1176cm)
  content((4.95, -0.52), [#text(size: 9pt)[delete]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Midpoint transport along a three-step label list. The left path of $i_k$ and the right path of $i_(k - 1)$ are generated with common midpoint $y_k$. Their full paths need not agree. After deleting $i_0$ on the left and $i_3$ on the right, the displayed midpoint multisets coincide. Unlisted paths are retained in both copies. ],
) <fig:local-transport>

We calculate a lift density before estimating it. Treat the left as the observed copy, fix $cal(D)$,
  the tags and list, and condition on the paths $eta$ outside $S = { i_1 \, dots.h \, i_m }$.
  Put $B_S = product_(l in S) B_l$. Let $c_S \( o \; eta \)$ be the product of all individual cutoff indicators on
  $S$ and all checks involving at least one label in $S$. By Lemma 9, the original conditional law is

#[#set math.equation(numbering: n => "(5.6)")
 $ lambda_S \( thin upright(d) o divides eta \) = frac(c_S \( o \; eta \), Z_S \( eta \))
   B_S \( thin upright(d) o \) \, wide Z_S \( eta \) = integral c_S \( o \; eta \) B_S \( thin upright(d) o \) >
   0 . $ <eq:local-reference>]

Checks wholly outside $S$ are fixed and do not enter this formula.

The generation kernel on the changed left paths has a density $k_S \( o \, eta \, z \)$ with respect to
  $B_S \( thin upright(d) z \)$. To verify this precisely, write $B_l^y$ for the free path law of label $l$
  conditional on midpoint $y$, and $g_l$ for its Gaussian midpoint density.
  A pair with observed label $l$ and auxiliary label $l'$ has proposal measure

#[#set math.equation(numbering: n => "(5.7)")
 $ frac(upright(bold(1))_C \( z_l \( 0 \) \), g_l \( z_l \( 0 \) \)) B_l \( thin upright(d) z_l \)
   B_(l')^(z_l \( 0 \)) \( thin upright(d) z'_(l') \) . $ <eq:local-proposal>]

Multiplication by its success indicators and division by its success probability describes the actual insertion
  kernel. Sequential integration of the auxiliary paths gives $k_S$.
  This is a density for the observed paths only: the paired paths have a common midpoint,
  and their joint law has no density against two independent bridges.

#thm([Lemma 5.2.])[
  (The centered conditional likelihood).  #emph[Include the second tag indicator but omit its divisor $T_(w')$.
    On admissible output paths the left likelihood is
#[#set math.equation(numbering: n => "(5.8)")
 $ L_S \( z \; eta \) = integral c_S \( o \; eta \) h_(w' i_m) \( o \) k_S \( o \, eta \, z \)
   B_S \( thin upright(d) o \) . $ <eq:local-likelihood>]

 It obeys
#[#set math.equation(numbering: n => "(5.9)")
 $ F_S = L_S - h_(w' i_m) \, wide integral F_S thin thin upright(d) lambda_S \( dot.op divides eta \) = 0 \,
   $ <eq:local-centering>]

 and
#[#set math.equation(numbering: n => "(5.10)")
 $ 0 lt.eq L_S lt.eq C_x D^(C sqrt(x)) . $ <eq:local-likelihood-bound>]

 These assertions remain valid after deleting specified outside checks consistently from the reference,
   the original-path integral, and all insertion tests and their normalizing probabilities.]
] <lem:local-likelihood>

#proof[
  Before taking the likelihood, the generated density against $B_S$ is the right side of (5.8) divided by $Z_S$.
    The output kernel is supported on $c_S \( z \; eta \) = 1$,
    where the reference density against $B_S$ is $1 \/ Z_S$. Thus the normalizer cancels.
    Since each generation kernel has mass one, its support also gives
  $ integral c_S \( z \; eta \) L_S \( z \; eta \) B_S \( thin upright(d) z \) =
    integral c_S \( o \; eta \) h_(w' i_m) \( o \) B_S \( thin upright(d) o \) . $
  Division by $Z_S$ proves (5.9). The subtracted indicator there is evaluated on the reference output,
    whereas the indicator inside (5.8) is evaluated on the integrated original path.
  On $C_k$, the factor $g_(i_k)^(- 1)$ in (5.7) is at most $C D^(C x)$,
    since its distance from the mean is absolutely bounded and $t^(- 1) = x log D$.
    Every success denominator costs at most two. Dropping unused checks,
    and integrating the auxiliary conditional bridges, bounds the observed kernel density by $\( C D^(C x) \)^m
    2^m$. The original-path integral has mass at most one. Since $m = O \( x^(- 1 \/ 2) \)$, this proves (5.10).
  Deleting checks preserves output support in the corresponding admissible set and only improves the insertion
    lower bounds. The same argument applies on that modified conditional fiber.
    For later integrals we also define these kernels at outside values satisfying all individual cutoffs,
    even if a check wholly outside $S$ fails: that outside-only check is ignored.
    The insertion bounds hold at these histories, and the formulas represent actual conditional likelihoods
    wherever the outside reference constraints hold. ◻
]

=== 5.3 Cancellation in a fourth moment <cancellation-in-a-fourth-moment>

The likelihood for one chosen list need not be close to one.
  Averaging many possible tags and interior labels produces the needed small error.
  Conditional centering cancels terms involving an isolated list;
  the terms that survive have either repeated labels or at least two rare interactions between lists.
  We make both statements precise.

For fixed tags and data, put a bar over a quantity to denote averaging over the route and interior label choices.
  We claim that, for sufficiently small fixed $x$,

#[#set math.equation(numbering: n => "(5.11)")
 $ bb(E)
   [upright(bold(1))_(cal(G)_(v \, w')) sum_(i in I) h_(v i) / T_v lr(|sum_(i_m eq.not i) overline(F_S) /
   T_(w')|)^4] lt.eq C_(x \, j) D^(- 1 - 1 \/ 20) . $ <eq:local-centered-fourth>]

Each tag sum is restricted to the fixed enlargement of its cell and to labels in $I$.
  We first prove the conditional interaction estimate needed to expand this fourth moment.

Fix four lists with the same first tag $i$, and let $S_a$ be their changed sets, $1 lt.eq a lt.eq 4$.
  Condition on $cal(D)$ and on all paths outside $U = union.big_a S_a$.
  Join two lists if their changed sets intersect; the connected components are called blocks.
  A singleton block contains one list, not necessarily one label. Distinct blocks have disjoint label sets.
  Introduce a switch $sigma_e in { 0 \, 1 }$ for each unordered pair $e$ of blocks.
  Turning it off deletes all checks between those blocks from the following three places:

+ the union reference on $U$;
+ the original-path indicators in each likelihood integral;
+ the insertion indicators and their success probabilities.

In the last two places, paths outside a given changed set are the reference paths.
  All individual cutoffs are retained. The unchanged left path of the common tag $i$ is outside every block,
  so checks against it are never switched. A newly generated right path with label $i$, however,
  belongs to its generating block; its checks against other blocks are switched.
  It is never checked against the left copy of the same label.
  These rules also specify the switches when two lists overlap.

Let $c_U^sigma$ denote the switched union indicator and $F_a^sigma$ the switched centered likelihood.
  Define the unnormalized integral

#[#set math.equation(numbering: n => "(5.12)")
 $ G \( sigma \) = integral c_U^sigma \( z \) product_(a = 1)^4 F_a^sigma \( z \) B_U \( thin upright(d) z \) .
   $ <eq:local-switch-integral>]

The conditional fourth-moment summand before switching is $G \( bold(1) \) \/ Z_U$, where $Z_U =
  integral c_U^(bold(1)) thin upright(d) B_U$. We hold this denominator fixed throughout the switch expansion.
  Successive single-path insertions give $Z_U^(- 1) lt.eq C_x$, because $U$ has at most $4 C_x$ labels.

For a block-pair edge $e$, let $cal(Q)_e$ be the finite list of distinct-label pairs whose checks are controlled
  by that switch. It includes checks using generated auxiliary paths and original paths,
  with bounded multiplicity. All its labels and endpoints are fixed by the data and the four lists.

#thm([Lemma 5.3.])[
  (One and two switched interactions).  #emph[Suppose the four changed sets are either pairwise disjoint,
    or have exactly one independent label identification. Write $Delta_e$ for the finite difference from
    $sigma_e = 0$ to $sigma_e = 1$. Uniformly in all other switch settings,
#[#set math.equation(numbering: n => "(5.13)")
 $ frac(\| Delta_e G \|, Z_U) lt.eq C_x D^(C sqrt(x)) sum_(\( l \, k \) in cal(Q)_e) beta_(l k) .
   $ <eq:local-one-switch>]

 If the changed sets are pairwise disjoint and $e eq.not f$, then
#[#set math.equation(numbering: n => "(5.14)")
 $ frac(\| Delta_e Delta_f G \|, Z_U) lt.eq C_x D^(C sqrt(x)) sum_(\( l \, k \) in cal(Q)_e\
\( l' \, k' \) in cal(Q)_f) beta_(l k) beta_(l' k') . $ <eq:local-two-switches>]

 The sums have at most $C_x$ terms. Moreover $beta_(l k) lt.eq C_x D^(- 19 \/ 100)$ for sufficiently large $D$.]
] <lem:local-switches>

#proof[
  Expand each centered factor as $L_S - h_(w' i_m)$, then use (5.8) for each likelihood.
    Each such term has reference output bridges on $U$, a separate collection of latent original bridges for each
    likelihood, and its generated auxiliary bridges. The original integrations remain separate even when their
    output coordinates coincide. All individual cutoff indicators remain in place when estimating collisions.
  First consider singleton blocks. Combine the observed bridge factor in (5.7) with its midpoint density and
    auxiliary conditional bridge. The result is exactly the common-uniform-midpoint pair proposal.
    After unused checks and bounded success denominators are discarded,
    the variables within a singleton block therefore have a product of ordinary original bridges and these pair
    proposals. If its centered factor contributes the subtracted indicator,
    it uses ordinary output bridges instead. These base measures are independent between blocks:
    their cells and endpoints depend only on $cal(D)$. The common midpoint inside one pair is preserved throughout.
  A difference of a check indicator forces failure of one of the checks controlled by that edge.
    Failure of (4.6) requires a collision within the interaction range $r$.
    A union bound reduces it to one of the label pairs in $cal(Q)_e$.
    Given an allowed opponent path, integrating a plain bridge or a marginal of the uniform-midpoint pair
    proposal, with its individual cutoffs retained, costs at most $C_x
    beta_(l k)$ by (4.13) and the uniform-midpoint form of (4.14).
  Success denominators require the same conclusion. At fixed history a success probability can be written using a
    fresh proposal $Q$ as
  $ p \( sigma \) = integral Q \( thin upright(d) z \) thin c \( z \) product_e A_e \( z \)^(sigma_e) \, wide
    p \( sigma \) gt.eq 1 / 2 . $
  Here $c$ contains the individual cutoffs and unswitched checks,
    while $A_e$ is the product of the checks controlled by $e$ at this stage. We use $A^0 = 1$ also when $A = 0$.
    A first difference introduces $A_e - 1$; a mixed difference introduces $\( A_e - 1 \) \( A_f - 1 \)$.
    They force the indicated one or two collisions. The identity
  $ p^(- 1) - q^(- 1) = frac(q - p, p q) $
  and its difference in a second variable bound the second reciprocal difference by a constant times
  $ \| Delta_e Delta_f p \| + max_sigma \| Delta_e p \( sigma \) \| max_sigma \| Delta_f p \( sigma \) \| . $
  The product of first differences is represented with independent fresh proposals.
    Every such proposal belongs to the block whose denominator produced it.
    The lower bound for $p$ holds at all histories under consideration,
    since only individual cutoffs are required of earlier paths when unused checks are ignored.
  The finite-product difference rule now bounds a first difference by a finite sum of integrals with one forced
    cross-block collision, and a second difference by ones with two specified cross-block collisions.
    Unused denominators cost only $C_x$. With no label identification,
    either end of one edge can be integrated as a singleton. For two distinct edges,
    their graph consists of a two-edge tree or two disjoint edges.
    In the tree case fix all variables at the central vertex and integrate its two leaves in succession.
    Each leaf participates in one forced collision, so these integrations give the two $beta$ factors.
    No independence between the two collision events at the central block is required.
    For disjoint edges the two integrations are separate. Fresh proposals from denominator differences obey the
    same argument after assigning them to their generating blocks.
  With one independent identification the block sizes are $2 \, 1 \, 1$.
    Every edge has a singleton end, which supplies the collision factor in (5.13).
    After integrating that singleton, the remaining repeated output coordinates in the block of size two are
    bounded by the observed density estimate (5.10): bound any surplus factors $g_l^(- 1)
    upright(bold(1))_C$ by $C D^(C x)$ and integrate auxiliary conditional bridges.
    Across the four lists this costs at most $C_x D^(C sqrt(x))$.
    The same harmless bound covers all remaining factors in the disjoint case.
    This proves both difference estimates. The argument allows arbitrary settings of unused switches;
    additional differences are bounded by finite sums of these estimates at those settings.
    Finally (4.13) gives $beta_(l k) lt.eq b_D \( 1 + 2 \/ s_1 \) lt.eq C_x D^(- 19 \/ 100)$. ◻
]

We can now prove (5.11). Expanding the fourth power gives four independently chosen lists,
  conditional on the common first tag and the data. There are at most $C_x D
  f_0$ candidates for each tag or interior slot, by the good endpoint counts and the tube restriction.
  A normalized tag counting weight and every interior-choice probability are at most $C_(x \, j) \/ \( D f_0 \)$.
  Split the sums by the tag mean-sites and the route site patterns; there are only $C_x$ patterns.
  We retain the original weights in each subsum, without conditioning on a pattern and renormalizing.

An equality pattern with $q$ independent identifications has $q$ fewer free label choices.
  Dominating all slot weights by their point bounds and counting the remaining choices gives total weight at most
  $C_(x \, j) \( D f_0 \)^(- q)$. A triple equality counts as two identifications.
  These are joint counting estimates; they assert no point-mass bound conditional on the occurrence of a
  coincidence. There are only $C_x$ equality patterns. Consequently all patterns with $q gt.eq 2$ contribute,
  by (5.10), at most

#[#set math.equation(numbering: n => "(5.15)")
 $ C_(x \, j) D^(- 2 + 2 x + C sqrt(x)) . $ <eq:local-many-identifications>]

For $q = 0$ or $1$, use the switches above. For an edge set $E$, let $Delta_E = product_(e in E) Delta_e$.
  The elementary Boolean identity is

#[#set math.equation(numbering: n => "(5.16)")
 $ G \( bold(1) \) = sum_E Delta_E G \( bold(0) \) . $ <eq:local-boolean>]

If the graph with edge set $E$ has an isolated singleton block, its term vanishes.
  Indeed all edges from that block are off in every evaluation comprising the difference.
  Its variables separate from the others, and their integral is

$ integral c_S F_S thin thin upright(d) B_S = 0 $

by (5.9). This is why the common denominator $Z_U$ was held fixed rather than switched.

When $q = 1$ there are three blocks, two of them singletons, so a nonzero term must contain an edge.
  Its identification cost and (5.13) give total contribution at most

#[#set math.equation(numbering: n => "(5.17)")
 $ C_(x \, j) D^(- 1 + x - 19 \/ 100 + C sqrt(x)) . $ <eq:local-one-identification>]

When $q = 0$, all four blocks are singletons and a nonzero term has at least two distinct edges.
  Apply (5.14) to any two of them, and bound any remaining differences by a finite sum of evaluations with the
  other switches fixed.

One of these two collision factors can be averaged over a label slot.
  Every cross-block check has at least one label in a changed set,
  whereas the common tag $i$ belongs to none of those sets.
  The endpoint bound (4.8), summed over dyadic annuli in a fixed neighborhood, gives uniformly in the other endpoint $y$

#[#set math.equation(numbering: n => "(5.18)")
 $ frac(C_(x \, j), D f_0) sum_(k upright(" in a slot range")) frac(1, s_1 or d_K \( y \, Y_k \)) lt.eq
   C_(x \, j) (1 + frac(D^(1 \/ 100), D f_0 s_1)) lt.eq C_(x \, j) . $ <eq:label-average>]

For example, a dyadic annulus of radius $h lt.eq 1$ contributes at most
  $C_(x \, j) \( h^2 + D^(1 \/ 100) \/ \( D f_0 h \) \)$; the innermost ball is bounded at radius $s_1$,
  and the unit-scale and larger annuli use the unit-count bound. The geometric sums give the displayed expression.
  The same estimate holds with $Z_k$ in place of $Y_k$. Thus averaging this factor costs at most $C_(x \, j) b_D$.
  Bound the other factor by $C_x D^(- 19 \/ 100)$. In these positive bounds we may remove all further
  noncoincidence restrictions and enlarge the label sums. The total contribution with no identification is
  therefore at most

#[#set math.equation(numbering: n => "(5.19)")
 $ C_(x \, j) D^(- 19 \/ 100 + C sqrt(x)) b_D . $ <eq:local-no-identification>]

The first-tag factor $h_(v i)$ is fixed in every conditional integral, so it does not disturb centering.
  Its total normalized tag sum on good data is bounded by $C_(x \, j)$.
  Equations (5.15)–(5.19) prove (5.11) once $x$ is chosen sufficiently small.
  Indeed $b_D = C_x D^(- 1) \( log D \)^C$, and all three powers then save more than $1 \/ 20$ beyond $D^(- 1)$.

=== 5.4 The local comparison after projection <the-local-comparison-after-projection>

Let $ell_v$ and $ell_(w')$ be the two lifted densities of $nu_(v \, w')$ relative to their augmented references.
  On retained data with first tag in $I$, the left density is

$ ell_v = sum_(i_m eq.not i) overline(L_S) / T_(w') \; $

set it to zero on the omitted part of the reference. The centered subtraction sums to $A_(w') - M'_(w')$.
  In fact the candidate mean range contains every tag with nonzero $h_(w' i_m)$, by confinement,
  and the excluded first tag has $h_(w' i) = 0$ because the cells are disjoint. Thus on the retained part

#[#set math.equation(numbering: n => "(5.20)")
 $ ell_v - 1 = sum_(i_m eq.not i) overline(F_S) / T_(w') + \( A_(w') - 1 \) - M'_(w') . $ <eq:local-lift-error>]

#thm([Proposition 5.4.])[
  (Adjacent deletion measures).  #emph[For sufficiently small fixed $x > 0$, depending on $u$,
    the common measure constructed above satisfies
#[#set math.equation(numbering: n => "(5.21)")
 $ bb(E)_(v tilde.op w')
   [integral \| ell_v - 1 \|^4 thin thin upright(d) P_(upright("aug") \, v) + integral \| ell_(w') - 1 \|^4 thin
   thin upright(d) P_(upright("aug") \, w')] lt.eq C_j D^(- 1 - u \/ 8) . $ <eq:local-lift-fourth>]

 Consequently the local comparison (4.2) holds. That bound, with a fixed change of constant,
   also holds when only adjacent pairs inside the same $R$-cell are retained in the average.]
] <prop:local-palm>

#proof[
  Apply $\| a + b + c \|^4 lt.eq 27 \( \| a \|^4 + \| b \|^4 + \| c \|^4 \)$ to (5.20).
    The centered term is controlled by (5.11). Off the negligible count tail, the count-fluctuation term is at most
  $ bb(E) \[ A_v \| A_(w') - 1 \|^4 \] lt.eq C_j D^x bb(E) \| A_(w') - 1 \|^4 + O \( D^(- A) \) $
  for any prescribed fixed $A$. Averaging adjacent cells and using (5.1) bounds it by
    $C_j \( D^(- 1 - u \/ 6 + x) + D^(- 2 + 3 x) \)$. Likewise,
  $ bb(E) \[ A_v \( M'_(w') \)^4 \] lt.eq C_j D^(4 x) bb(E) M'_(w') + O \( D^(- A) \) lt.eq
    C_(x \, j) D^(- 1 - 1 \/ 8 + 4 x) + O \( D^(- A) \) . $
  The part where $ell_v$ was set to zero contributes its reference mass, controlled by (5.2) and (5.3).
    Taking $x < u \/ 24$ in addition to the earlier smallness conditions makes all these terms bounded by $C_j
    D^(- 1 - u \/ 8)$.
  For the right lift, regard the right copy as observed, reverse the list indices,
    and keep the actual generation order. Its unchanged tag is now $i_m$ and its changed set excludes $i_m$.
    The density formula, switched centering, and collision integrations are unchanged:
    they allow any fixed insertion order. This proves (5.21) for the two lifts of the same measure.
  Under a measurable projection, the projected likelihood is the conditional expectation of the lifted likelihood.
    Conditional Jensen therefore transfers each fourth-moment bound to the density of $nu_(v \, w')$ relative to
    $P_v$ or $P_(w')$. Write $q \( Y' \)$ for its Lebesgue density and put $y = s_v \( Y' \)$, $z =
    s_(w') \( Y' \)$. Absolute continuity with respect to both references makes $q =
    0$ where either reference density vanishes. Inserting $sqrt(q)$ between $y$ and $z$, and using $\| 1 -
    sqrt(a) \| lt.eq \| 1 - a \|$ for $a gt.eq 0$, gives
  $ frac(\| y - z \|^4, y^2 + z^2) lt.eq 8 [y^2 lr(|1 - q / y^2|)^4 + z^2 lr(|1 - q / z^2|)^4] . $
  Terms with zero prefactor are omitted. Integrating this inequality and applying the two projected bounds proves
    (4.2). Restricting the nonnegative edge sum to edges within $R$-cells only decreases it;
    the normalizations differ by a bounded factor. ◻
]

== 6 Distant deletion comparisons <sec:long-palm>

We now compare the deletion measures for distant cells of side $R$.
  We prove (4.3) for the ordered $R$-cell pairs $cal(P)_R$ defined at the beginning of Section 4.
  The local construction of Section 5 cannot simply be iterated:
  its route would have length growing with $K$, whereas even a fixed loss at each step would destroy the estimate.
  We instead retain the original paths near both ends of a long random route.
  In a product of two likelihoods, the resulting errors occur only when the changed portions of the two routes
  meet. A geometric input makes these meetings rare and controls their number exponentially.

=== 6.1 The geometric input and its application <the-geometric-input-and-its-application>

We use the following complete statement of #cite(label("D")) Proposition 7.1.
  It concerns a random set of lattice sites only. The proof in #cite(label("D")) Section 7 uses folded paths and
  the unpredictable-path method of #cite(label("BPP")).

#thm([Proposition 6.1.])[
  (Routes with rare encounters away from the common end).  #emph[On $cal(L)_K = \( bb(Z) \/ K bb(Z) \)^3$,
    let $d_oo$ be the periodic maximum distance. A random datum $cal(D)$ determines a bad set $cal(B) subset
    cal(L)_K$ satisfying
$ bb(P) \( A subset cal(B) \) lt.eq p^(\| A \|) wide \( A subset cal(L)_K \) . $

 Fix an integer contact radius $r_c gt.eq 1$, an integer $q gt.eq 0$, and $c_Q > 0$.
   Let $Q$ be a projected lattice cube of side at most $c_Q R$,
   and let $z$ be a site such that every $y in Q$ has forward first-coordinate displacement from $z$ in
   $\[ .29 K \, .46 K \]$. There are constants $p_0 \, kappa \, c \, C \, C_0 > 0$ and $R_0$,
   depending only on the fixed parameters, with the following properties when $R gt.eq R_0$, $K gt.eq C_0 R$,
   and $p lt.eq p_0$.]
  #emph[Put $H = floor.l R^(1 \/ 2) floor.r$. There is an event $cal(E)$, determined by $cal(D) \, z \, Q$,
    on which one can sample simple good nearest-neighbor routes $pi_y$ from $z$ to every $y in Q$.
    Conditional on $cal(D)$, different samples use independent fresh randomness.
    The event $cal(E)$ includes the requirement that the $10 R$-neighborhoods of $z$ and $Q$ contain no bad sites.]
  #emph[For $pi = \( v_0 \, dots.h \, v_m \)$ starting at $z$, put
$ a \( pi \) = max { i : d_oo \( v_i \, z \) lt.eq H } \, wide pi^(upright("ch")) = { v_i : i > a \( pi \) } . $

 The initial portion $\( v_0 \, dots.h \, v_(a \( pi \)) \)$ has at most $C H$ vertices.
   The analogous portion read backwards from the terminal site also has at most $C H$ vertices,
   and these two portions are disjoint. Let $pi^(upright(c h \, q))$ contain the vertices whose path index is
   within $q$ of an index in $pi^(upright("ch"))$. For independent samples $pi_y \, pi_(y')$, set
$ J_c = sum_(v in pi_y) sum_(v' in pi_(y')) upright(bold(1))_({ d_oo \( v \, v' \) lt.eq r_c }) \, wide J_(*) =
  sum_(v in pi_y^(upright(c h \, q))) sum_(v' in pi_(y')^(upright(c h \, q)))
  upright(bold(1))_({ d_oo \( v \, v' \) lt.eq r_c }) . $

 Uniformly in the specified endpoints,
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E)_(cal(D)) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(E))
   bb(E)_(upright("routes")) \( e^(kappa J_c) divides cal(D) \) #scale(x: 120%, y: 120%)[\]] lt.eq
   C . $ <eq:route-exponential>]

 For every deterministic probability mass function $omega$ on $Q times Q$ with $omega \( y \, y' \) lt.eq
   C_omega R^(- 6)$,
#[#set math.equation(numbering: n => "(6.2)")
 $ sum_(y \, y' in Q) omega \( y \, y' \) bb(E)_(cal(D)) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(E))
   bb(P)_(upright("routes")) \( J_(*) > 0 divides cal(D) \) #scale(x: 120%, y: 120%)[\]] lt.eq
   C C_omega R^(- c_g) \, wide c_g = 1 / 2 (frac(log 2, log 3) - 1 / 2) > 0 . $ <eq:route-rare>]

 Both estimates hold with a common terminal endpoint, reading the same route construction in reverse order.
   Finally, if $cal(M)$ is the stated bad-free margin event, then
#[#set math.equation(numbering: n => "(6.3)")
 $ bb(P) \( cal(M) \\ cal(E) \) lt.eq K^3 \( A p \)^(floor.l K \/ \( 10 \( r_c + 2 \) \) floor.r) +
   C R^3 e^(- c R) \, $ <eq:route-rejection>]

 where $A$ is fixed and $A p_0 < 1$.]
] <prop:route-input>

We check the hypotheses and fix how this result is used. The bad sites are those of Section 4.
  Equation (4.10) gives the required joint bound with any sufficiently small fixed $p$,
  by increasing the threshold for $D$. All possible mean-sites of tags whose midpoint lies in $v$ belong to a
  fixed enlargement $Q_v$ of that cell, of side $O_x \( R \)$; this follows from the individual tubes.
  The same holds for $w'$. Since $K \/ R arrow.r oo$ in the thermodynamic limit,
  the displacements from any site of $Q_v$ to any site of $Q_(w')$ belong to the wider interval in Proposition 18.

Choose $r_c$ large enough, in terms of $b_0$, to contain every possible cross-route interaction between paths in
  their individual tubes, as well as the bounded offsets between sites and means.
  Take $q = 2$ to allow the adjacent labels used by a paired insertion. These choices are fixed once $x$ is fixed.
  We retain a bad-free margin of radius $C_x R$ around both cells and impose the route-availability events for
  every endpoint site in their enlarged cubes, for both orientations.
  There are only polynomially many such sites in $R$. Thus (6.3) bounds the additional rejection by $o_K \( 1 \) +
  C_x R^(C_x) e^(- c_x R)$. This extra retention can only decrease the nonnegative quantities in (6.1)–(6.2).

We always sample the routes by the construction of Proposition 18,
  conditional on the datum and the endpoint sites. In a likelihood product,
  the datum is shared and the route randomizations are independent.
  In particular, we do not condition their law on a subsequent successful path insertion.
  The exponent $c_g$ is independent of $x$, although the constants and $kappa$ may depend on $x$.

=== 6.2 A common measure with retained end portions <a-common-measure-with-retained-end-portions>

Use the tag weight (5.4) for $\( v \, w' \) in cal(P)_R$, retained data, and distinct tags $i_0 \, i_m in I$.
  On the sampled route from their mean-sites choose one interior label at each intermediate site,
  uniformly and independently given the tags and sites, excluding the two tags.
  The resulting list $i_0 \, dots.h \, i_m$ has distinct labels;
  each interior choice has atom at most $C_x \/ \( D f_0 \)$. Successive means are at bounded absolute distance.

Write the initial silent portion of the route as $k < a_0$, and its terminal silent portion as $k > a_1$.
  Thus $a_0$ is one plus the last visit within distance $H$ of the initial site,
  while $a_1$ is one less than the first index in the terminal portion.
  Both tags lie in these portions, and the portions are disjoint. Keep all unlisted paths in both copies.
  Keep the prefix originals $k < a_0$ on the left, and the suffix originals $k > a_1$ on the right.
  The remaining paths are generated as follows, pairing left label $i_k$ with right label $i_(k - 1)$ for $1 lt.eq
  k lt.eq m$.

+ For $a_0 lt.eq k lt.eq a_1 + 1$, propose a common uniform midpoint in a unit cell within bounded distance of
  both means and propose the two paths independently conditional on that midpoint.
  Condition jointly on their individual cutoffs, the checks (4.6) against retained and previously generated paths
  in their respective copies, and midpoint separation by $s_1$ from those opponents.
  These middle pairs are probability kernels: Proposition 12, Assertion 2,
  bounds each success probability below by $1 \/ 2$. Use any fixed order for them.
+ In every other pair, one path is a retained original. Pin the other path to its midpoint $y$.
  Give this step mass zero unless $y$ is within $8 b_0$ of the new label’s mean and is $s_1$-separated from all
  opponent midpoints already present in the copy receiving the new path.
  If these conditions hold, propose the bridge pinned at $y$, impose its individual cutoffs and checks (4.6),
  and divide by
  #[#set math.equation(numbering: n => "(6.4)")
   $ max { 1 \/ 2 \, p_(upright("pin")) } \, $ <eq:pin-denominator>]
  where $p_(upright("pin"))$ is their success probability under the pinned proposal.
    This is a subprobability kernel. Perform these steps after all middle pairs, in fixed orders.
    Prefix pins are inserted on the right and suffix pins on the left;
    neither family uses paths generated by the other family.

The final copies satisfy all conditional reference checks.
  Every left midpoint except that of $i_0$ agrees with its paired right midpoint,
  and every right midpoint except that of $i_m$ is paired. Deleting these respective tags and using the common
  ordering of the bath coordinates therefore gives one measure on the bath with lifts to both augmented
  references. Figure 2 shows the pairing and the retained end portions.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.552, 1.45), [left], anchor: "east", padding: 0.1176cm)
  content((-0.552, 0), [right], anchor: "east", padding: 0.1176cm)
  content((-0.2475, 1.203), (0.2475, 1.697), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_0$]]], frame: "circle", fill: rgb("#ececec"), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  content((0.6725, 1.203), (1.167, 1.697), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_1$]]], frame: "circle", fill: rgb("#ececec"), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  content((1.593, 1.203), (2.087, 1.697), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_2$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((2.513, 1.203), (3.007, 1.697), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_3$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((3.433, 1.203), (3.927, 1.697), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_4$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((4.353, 1.203), (4.847, 1.697), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_5$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((5.273, 1.203), (5.767, 1.697), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_6$]]], frame: "circle", fill: rgb("#ffe8d1"), stroke: (paint: rgb("#b25a00"), thickness: 0.4pt, miter-limit: 10))
  content((-0.2475, -0.2475), (0.2475, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_0$]]], frame: "circle", fill: rgb("#ffe8d1"), stroke: (paint: rgb("#b25a00"), thickness: 0.4pt, miter-limit: 10))
  content((0.6725, -0.2475), (1.167, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_1$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((1.593, -0.2475), (2.087, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_2$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((2.513, -0.2475), (3.007, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_3$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((3.433, -0.2475), (3.927, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_4$]]], frame: "circle", fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((4.353, -0.2475), (4.847, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_5$]]], frame: "circle", fill: rgb("#ececec"), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  content((5.273, -0.2475), (5.767, 0.2475), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$i_6$]]], frame: "circle", fill: rgb("#ececec"), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  line((1.649, 1.149), (1.111, 0.3015), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((2.569, 1.149), (2.031, 0.3015), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((3.489, 1.149), (2.951, 0.3015), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((4.409, 1.149), (3.871, 0.3015), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((0.7287, 1.149), (0.1913, 0.3015), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#b25a00"))))
  line((4.791, 0.3015), (5.329, 1.149), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#b25a00"))))
  line((-0.2525, 1.198), (0.2525, 1.702), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10))
  line((5.268, -0.2525), (5.772, 0.2525), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10))
  line((-0.322, 2.103), (1.242, 2.103), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  content((0.46, 2.279), [#text(size: 9pt)[silent prefix]], anchor: "south", padding: 0.1176cm)
  line((4.278, 2.103), (5.842, 2.103), stroke: (paint: rgb("#535353"), thickness: 0.4pt, miter-limit: 10))
  content((5.06, 2.279), [#text(size: 9pt)[silent suffix]], anchor: "south", padding: 0.1176cm)
  content((2.76, -0.7975), [#text(size: 9pt)[gray: retained originals blue: jointly generated pairs#linebreak()orange: paths pinned to a retained midpoint]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: A schematic long comparison with $a_0 = 2$ and $a_1 = 4$. The left prefix and right suffix retain their original paths. Central pairs receive common proposed midpoints; an end pin copies the midpoint of its retained partner in the other copy. The arrows indicate the source of a pin, not equality of full paths. The changed left set is ${ i_2 \, dots.h \, i_6 }$, which excludes the common first tag. Deleting the crossed tags again leaves identical midpoint multisets. ],
) <fig:silent-transport>

The silent portions have two purposes. They keep the common tag outside the changed set in a likelihood product,
  and they ensure that the changed sets start far enough from their common end for (6.2) to apply.
  The opposite-copy pins preserve the matching of bath midpoints across these retained portions.

#thm([Lemma 6.2.])[
  #emph[The common measure just constructed has mass satisfying
#[#set math.equation(numbering: n => "(6.5)")
 $ "mass" gt.eq bb(E) \[ A_v A_(w') \] - C D^(- 1 - c') - o_K \( 1 \) $ <eq:long-mass>]

 for some $c' > 0$ and sufficiently small fixed $w \, x$.]
] <lem:long-mass>

#proof[
  The tag omissions, the bad-free margins, and the route rejections have the stated cost by (4.10), (5.2),
    and (6.3); the margins contain $O_x \( R^3 \)$ sites, and extra relative count factors cost only fixed powers
    $D^x$, apart from negligible count tails. Impose also the full-path bounds of Section 4 on the original sample
    in the endpoint neighborhoods of radius $O_x \( R \)$. Their failure has smaller cost,
    by the last line of (4.10). This event is used only to estimate the mass;
    we do not condition the reference bridges on it.
  On this original-sample event, all pins lie in range: the retained original has displacement at most $b_0$ from
    its endpoints, and successive means are at bounded distance.
    Whenever the required midpoint separations hold, every $p_(upright("pin")) gt.eq 3 \/ 4$ by Proposition 12,
    Assertion 3. Indeed its opponents are the original collection,
    with some originals deleted and some generated paths added.
    Route simplicity and the individual tubes bound the number of added paths relevant to any fixed neighborhood
    independently of the route length. Consequently all such pin kernels have mass one.
  Separation from a middle path was already imposed when that middle pair was generated:
    in the other copy its common midpoint was tested against the retained original which supplies the pin.
    The two silent ends are far apart. Every remaining separation failure therefore entails two original midpoints
    at distance at most $s_1$ in an endpoint neighborhood. Equation (2.11) bounds their expected ordered count in
    each fixed site neighborhood by $C_x D^2 s_1^3$.
  The choice of an interior label has atom at most $C_x \/ \( D f_0 \)$ even after fixing the data and tags.
    A route visits a site at most once, so we can sum this bound over all endpoint neighborhoods,
    of total volume $O_x \( R^3 \)$, without conditioning any count on route availability.
    A tag appearing in such a test supplies at least the same weight through its divisor.
    The other tag factors are bounded by relative counts. More explicitly,
    restrict all unit counts in these neighborhoods to $C D$; by (2.6)–(2.7),
    the discarded parts contribute less than every inverse power of $D$,
    even after fixed count products and polynomially many site sums. The remaining loss is at most
  $ C_x R^3 D^(C x) frac(D^2 s_1^3, D f_0) . $
  Since $D^2 s_1^3 = D^(- 2 \/ 5)$ and $R asymp D^w$, this is $O \( D^(- 1 - c') \)$ for sufficiently small $w \,
    x$. Middle steps never lose mass. Summing the tag weights proves (6.5). ◻
]

=== 6.3 Conditional likelihoods and removal of cross checks <conditional-likelihoods-and-removal-of-cross-checks>

We next bound the second moment of a lift. Unlike a uniform bound on its density,
  this estimate will have no factor depending on route length.
  Treat the left copy as the observed, or primary, copy. Its changed labels form

$ S = { i_k : k gt.eq a_0 } . $

Fix the datum, tags, route and list, and condition on the paths $o$ outside $S$.
  With $B_S$ the product plain bridge law and $c_S$ the conditional reference indicator, write

#[#set math.equation(numbering: n => "(6.6)")
 $ M_S \( o \; thin upright(d) z \) = integral c_S \( y \; o \) h_(w' i_m) \( y \)
   K_S \( y \, o \; thin upright(d) z \) thin B_S \( thin upright(d) y \) \, wide Z_S \( o \) =
   integral c_S \( y \; o \) thin B_S \( thin upright(d) y \) . $ <eq:long-kernel>]

Here $y$ denotes latent original paths, $z$ the primary outputs,
  and $K_S$ the subprobability kernel of all generation steps.
  The likelihood, before the divisor $T_(w')$, is $L_S = thin upright(d) M_S \/ thin upright(d)
  B_S$ on admissible reference outputs: the input and output conditional normalizer $Z_S$ cancels exactly.
  Absolute continuity is verified below, including for the pins.

For an upper bound we may integrate out the pins generated on the right at the silent prefix and replace their
  total mass by one. No primary middle or pin step uses those paths.
  We use the same notation $M_S$ for this enlarged measure when taking upper bounds.

Take a second, independently sampled route and list with the same first tag $i_0 = i$.
  Denote its changed set by $T$ and the two terminal tags by $j_1 \, j_2$.
  Condition now on all paths outside $U = S union T$, as well as the datum.
  In the $S$ construction remove all checks against outside labels in $T \\ S$,
  both from the latent reference and from every proposal and success normalization.
  In the $T$ construction remove checks against $S \\ T$. Write $A_S^(-) \, Z_S^(-) \,
  M_S^(-)$ for the resulting reference indicator, normalizer, and unnormalized output measure,
  and similarly for $T$. These two constructions now use only their own latent and generated variables and the
  fixed paths outside $U$.

This independence also holds at the edge of a silent prefix. Its right pins have been integrated out.
  If an old prefix path is removed as an outside obstacle, no other part of the construction uses that trajectory.
  A right middle partner uses the fixed endpoints of its label, not its old trajectory.
  Routes and label choices use only data, sites, and tag identities, all fixed here.

Let $Z_U = integral c_U thin thin upright(d) B_U$ be the union reference normalizer.
  List all checks affected by the removals: reference checks and checks of latent or generated paths against
  removed old obstacles, including those in the success probabilities.
  Every such check requires two route vertices within $r_c$, allowing the fixed step offsets in $J_(*)$.
  There are at most $C_x J_(*)$ such checks, with bounded multiplicity.
  The simplicity of each route gives this bound regardless of its length.
  Only distinct-label checks are listed; in particular, a proposal never gains a check against its own old
  trajectory if that trajectory was not an obstacle originally.

Let $B_(S T)$ be the sum, with these bounded multiplicities, of the corresponding costs $beta_(l k)$ from (4.13).
  For pin checks also sum their costs $m \( y \, omega \)$ from (4.14), writing the result as $M'_(S T)$.
  The first quantity depends on the fixed endpoints and labels;
  the second can depend on latent or generated midpoints. Uniformly,

#[#set math.equation(numbering: n => "(6.7)")
 $ B_(S T) + M'_(S T) lt.eq C_x D^(- .19) J_c . $ <eq:cross-check-cost>]

The following estimate is the aim of the conditional comparison.
  For disjoint changed sets it preserves the original tag product,
  with an error charged only to cross-route checks. For overlapping sets it charges a density bound only to the
  shared output labels. Put $G_D = C_x D^(C sqrt(x))$, with the constants sufficiently large.

#thm([Lemma 6.3.])[
  (Conditional product bound).  #emph[Conditional on $cal(D)$ and the paths outside $U = S union T$,
    the two likelihoods satisfy
#[#set math.equation(numbering: n => "(6.8)")
 $ S ∩ T = diameter : quad bb(E) \[ L_S L_T divides U^c \] & lt.eq bb(E) \[ h_(w' j_1) h_(w' j_2) divides U^c \] +
   C e^(C_x D^(- .19) J_c) #scale(x: 120%, y: 120%)[\(] B_(S T) +
   C_x J_(*) b_D \( 1 + t^(- 3 \/ 2) \) #scale(x: 120%, y: 120%)[\)] \,\
\| S ∩ T \| = q gt.eq 1 : quad bb(E) \[ L_S L_T divides U^c \] & lt.eq
  e^(C_x D^(- .19) J_c) G_D^q . $ <eq:long-product>]

]
] <lem:long-product>

We prove the lemma through three comparisons: first of the reference normalizers,
  then of the generation kernels when cross checks are removed,
  and finally of the primary output densities on shared labels.

#thm([Lemma 6.4.])[
  #emph[For these conditional reference laws,
#[#set math.equation(numbering: n => "(6.9)")
 $ frac(Z_S^(-) Z_T^(-), Z_U) lt.eq C^(\| S ∩ T \|) e^(C B_(S T)) . $ <eq:long-normalizer>]

 If $S ∩ T = diameter$, then for any measurable $0 lt.eq F lt.eq 1$ of the latent originals,
#[#set math.equation(numbering: n => "(6.10)")
 $ 0 lt.eq 1 / Z_U integral F \( A_S^(-) A_T^(-) - c_U \) thin thin upright(d) B_U lt.eq
   C B_(S T) e^(C B_(S T)) . $ <eq:reference-difference>]

]
] <lem:normalizer-comparison>

#proof[
  For disjoint sets, $Z_S^(-) Z_T^(-)$ is the reference integral with the cross checks removed.
    Add these checks one at a time. Conditional single-label insertion gives density domination by a constant
    times the corresponding plain bridge, uniformly with any subset of checks retained.
    A newly added check therefore fails with probability at most $C beta_(l k)$.
    Since the maximum of these costs tends to zero, the loss of normalizer is at most $e^(C beta_(l k))$ at that
    step. Multiplication proves (6.9) in the disjoint case. Summing the integrals lost when the checks are
    restored gives (6.10). All normalizers are positive by successive insertion;
    no lower bound uniform in the number of labels is being used.
  If $q = \| S ∩ T \| > 0$, first delete the shared labels from both separate integrals,
    which increases them because the integrands are indicators. Compare the remaining disjoint integrals as above.
    Insert the $q$ shared labels into the union reference, one at a time;
    each insertion costs at most a fixed inverse success probability. Their total expense is $C^q$, proving (6.9). ◻
]

There is also a comparison before any generated variables are integrated.
  The original two constructions are dominated by the separate constructions times a factor bounded in both forms

#[#set math.equation(numbering: n => "(6.11)")
 $ e^(C_x D^(- .19) J_c) \, wide 1 + C e^(C_x D^(- .19) J_c) \( B_(S T) + M'_(S T) \) . $ <eq:protocol-comparison>]

To prove this, fix a history at an affected transition. Removing checks increases its success probability from $p$
  to $p^(-)$. For a middle step $p gt.eq 1 \/ 2$; for a pin the denominator is the function
  $max \( 1 \/ 2 \, p \)$, which is Lipschitz and bounded below by $1 \/ 2$.
  Thus the expense in the likelihood density is at most

$ frac(max \( 1 \/ 2 \, p^(-) \), max \( 1 \/ 2 \, p \)) lt.eq 1 + 2 \( p^(-) - p \) \, $

with the same estimate for the uncapped middle denominators.
  Removing the preliminary pin-separation indicator only enlarges the integrand.
  For a middle step, integrate the removed checks against its common uniform midpoint proposal;
  Proposition 12 bounds the difference by the sum of $C beta_(l k)$, including failures of midpoint separation.
  For a pin step the same bound includes its costs (4.14); the needed midpoint separation holds on the support of
  the old integrand. Products of these bounds, and (6.7), prove (6.11).
  Indicators of fewer reference checks only enlarge an integrand. Every unaffected transition has ratio exactly one.

=== 6.4 Primary output densities and the conditional product bound <primary-output-densities-and-the-conditional-product-bound>

We need one density estimate when two changed sets share labels.
  For any $q$ specified primary labels, the marginal of $M_S^(-) \/ Z_S^(-)$ has density at most

#[#set math.equation(numbering: n => "(6.12)")
 $ G_D^q quad upright("against their product plain bridges") . $ <eq:primary-density>]

To prove it, omit the terminal tag indicator, so the latent originals have their normalized separate reference
  law. Fix those originals, denoted by $y$, and let $K_S^(-)$ denote the separate generation kernel.
  Divide the specified primary indices into middle indices $A_(upright("mid"))$ and pin indices
  $A_(upright("pin"))$. A primary pin with index $k$ uses the midpoint of the retained original label $i_(k - 1)$
  in the right suffix. Write $cal(R)_k = { xi : \| xi - m_(i_k) \| lt.eq
  8 b_0 }$ for its pin range in the compatible lift.

Conditional on the generation history, a specified middle output is bounded by $C_x D^(C x) B_(i_k)$, by (5.7).
  A specified pin is bounded by $2 upright(bold(1))_(cal(R)_k) \( y_(i_(k - 1)) \( 0 \) \)
  B_(i_k)^(y_(i_(k - 1)) \( 0 \))$, where the superscript denotes a prescribed midpoint.
  These majorants no longer depend on earlier generated paths.
  Integrating the generation steps in reverse order against a nonnegative test of the specified outputs therefore
  gives the conditional marginal bound

#[#set math.equation(numbering: n => "(6.13)")
 $ K_S^(-) \( y \, o \; thin upright(d) z_A \) lt.eq  & \( C_x D^(C x) \)^(\| A_(upright("mid")) \|)
   2^(\| A_(upright("pin")) \|) product_(k in A_(upright("mid"))) B_(i_k) \( thin upright(d) z_k \)\
 & times product_(k in A_(upright("pin"))) upright(bold(1))_(cal(R)_k) \( y_(i_(k - 1)) \( 0 \) \)
   B_(i_k)^(y_(i_(k - 1)) \( 0 \)) \( thin upright(d) z_k \) . $ <eq:primary-conditional-majorant>]

Here $A = A_(upright("mid")) union A_(upright("pin"))$, and $z_k$ denotes the primary output path of label $i_k$.
  Every unspecified step contributes at most its mass, which is at most one.
  Thus the displayed product bound does not require independence of the accepted outputs.

The sources $i_(k - 1)$ of the specified pins are distinct latent labels in $S$.
  Corollary 13 bounds their joint latent marginal by $C^(\| A_(upright("pin")) \|)$ times their product plain
  bridges. Keep their confinement indicators when making this comparison,
  so all source midpoints use the chosen local lifts. Dropping the remaining source cutoffs in those lifts only
  enlarges the integral. For a source $l = i_(k - 1)$, evaluate the resulting midpoint mixture by the measure identity

#[#set math.equation(numbering: n => "(6.14)")
 $ integral_(cal(R)_k) g_l \( xi \) B_(i_k)^xi \( thin upright(d) z_k \) thin thin upright(d) xi =
   upright(bold(1))_(cal(R)_k) \( z_k \( 0 \) \) frac(g_l \( z_k \( 0 \) \), g_(i_k) \( z_k \( 0 \) \))
   B_(i_k) \( thin upright(d) z_k \) . $ <eq:pin-mixture-density>]

The two means are at bounded distance, and the indicator restricts the ratio to the primary pin range.
  Thus (4.18) bounds this ratio by $C_x D^(C sqrt(x))$. Applying this to each pin in (6.13) proves (6.12).
  The same argument with the original checks in place proves absolute continuity of all primary outputs in (6.6).
  Only the primary marginal acquires this density; a pair with a common midpoint is still singular relative to two
  independent full bridges.

#proof[
  Integrate the enlarged output measures against the common union reference, with divisor $Z_U$, and use (6.11).
    Dropping the union output admissibility indicator increases the resulting nonnegative integrals.
  First suppose $S \, T$ are disjoint. The leading $1$ in the second bound of (6.11) contributes at most
  $ 1 / Z_U integral h_(w' j_1) h_(w' j_2) A_S^(-) A_T^(-) thin thin upright(d) B_U : $
  the two separate kernels use different outputs and have mass at most one.
    Equation (6.10) compares this to the leading conditional expectation in (6.8).
    The $B_(S T)$ error is bounded with (6.9).
  For a term of $M'_(S T)$, the pin midpoint belongs to a latent source $l$ in one separate construction and is
    tested against an output path $z_k$ in the other. After the cross checks have been removed,
    the two constructions have product law at the fixed outside paths.
    Write $lambda_S^(-)$ for the normalized separate latent reference and $nu_T^(-) =
    M_T^(-) \/ Z_T^(-)$ for the opposing output measure, of mass at most one.
    The source-side kernels also have mass at most one. Dropping the source-side tag indicator and integrating
    those kernels bounds the normalized cost by
  $ integral nu_T^(-) \( thin upright(d) z \) integral lambda_S^(-) \( thin upright(d) y \)
    frac(b_D, s_1 or d_K \( y_l \( 0 \) \, z_k \( 0 \) \)) lt.eq
    C sup_xi integral frac(b_D g_l \( eta \), s_1 or d_K \( eta \, xi \)) thin thin upright(d) eta . $
  Here single-label insertion bounded the source midpoint marginal by $C g_l$ in its local lift.
    For every fixed opposing midpoint $xi$,
  #[#set math.equation(numbering: n => "(6.15)")
   $ integral frac(b_D, s_1 or d_K \( eta \, xi \)) g_l \( eta \) thin thin upright(d) eta lt.eq
     C b_D \( 1 + t^(- 3 \/ 2) \) . $ <eq:pin-cost-average>]
  Indeed $g_l$, or its periodization, is bounded by $C t^(- 3 \/ 2)$,
    the inverse-distance function is integrable on a unit ball in three dimensions,
    and outside that ball it is at most one. There is no need to bound the density of the opposing midpoint.
    There are at most $C_x J_(*)$ terms. The normalizer ratio in (6.9) completes the disjoint estimate.
  When $q = \| S ∩ T \| > 0$, use the exponential bound in (6.11).
    After division by $Z_S^(-) Z_T^(-)$, the remaining integral is the product of the two normalized separate
    output densities, identifying the common output coordinates only on $S ∩ T$.
    Integrating the unshared outputs leaves the product of the two marginals on these $q$ labels.
    Bound one by (6.12); the other has mass at most one. Equation (6.9) proves (6.8).
  For clarity, these comparisons take place first between measures on latent originals and generated proposals,
    with all success indicators and denominators present. Their domination passes to the primary output densities.
    In the disjoint estimate we retain the latent pin source until applying (6.15);
    disintegration over the absolutely continuous primary outputs justifies this operation.
    In the overlap estimate the two latent integrations remain separate,
    and density versions agree almost everywhere under the union product bridge measure by Fubini’s theorem.
    At no point do we assign a product-bridge density to a midpoint-matched pair. ◻
]

=== 6.5 Averaging the labels and route encounters <averaging-the-labels-and-route-encounters>

Let $ell_v$ be the left lift likelihood, with zero value on omitted data and tags.
  On the retained part it is the sum of $overline(L_S) \/ T_(w')$ over second tags,
  where the bar averages the route and interior label kernels.
  Squaring it gives two independent choices with common first tag $i$.
  The augmented reference supplies its factor $h_(v i) \/ T_v$ only once; this path is fixed outside $U$.
  The disjoint leading term in (6.8), summed over choices, is bounded by

#[#set math.equation(numbering: n => "(6.16)")
 $ bb(E) \[ A_v A_(w')^2 \] . $ <eq:long-leading-term>]

Here the indicators are the original reference indicators.
  Removing good-data and distinctness restrictions only increases their nonnegative sum,
  and the route and label kernels have mass one.

We detail the remaining sums because an estimate uniform in route length is essential.
  At every possible tag mean-site, the number of candidate tags is at most $C_x D f_0$,
  by the good-data flagged counts and the bounded endpoint offsets.
  Since $T_v = T_(w') = f_0 D R^3$, its normalized counting measure is dominated by a deterministic site weight
  $C_x R^(- 3)$ times a label subprobability measure whose atoms are at most $C_x \/ \( D f_0 \)$.
  The same atom bound holds for every interior slot, using its actual conditional probability law.
  Route sampling depends on the endpoint sites and datum, not on tag identities.

For a disjoint error, enumerate all slot pairs across the two routes that are within the contact radius,
  including the fixed step offsets. This overcounts the affected checks by a bounded factor.
  Every such check has an averageable label, and (5.18) gives an average cost at most $C_x b_D$ for its $beta$.
  In detail, interior choices are independent across routes given the tags;
  a label in the opposite slot can be held fixed. When a tag must instead be summed,
  its point weight gives the same bound. A prefix label used by the pair at the change edge is assigned to its
  adjacent prefix slot. The common first tag is outside both changed sets.
  Exclusions such as omitting a label’s own old trajectory remove terms;
  we may discard disjointness restrictions in these positive, capped-cost sums.
  Thus the entire disjoint error after label averaging is at most

#[#set math.equation(numbering: n => "(6.17)")
 $ C_x e^(C_x D^(- .19) J_c) J_(*) b_D \( 1 + t^(- 3 \/ 2) \) \, $ <eq:averaged-disjoint-error>]

with the deterministic site weights still to be summed.

For overlapping sets, identical labels across the two lists form a matching of their slots,
  since each individual list has distinct labels. The common first tag cannot participate.
  A match requires a contact, so the number $M_(*)$ of eligible slot pairs is at most $C_x J_(*)$ and at most $C_x
  J_c$. Put $p_D = C_x \/ \( D f_0 \)$. Prescribing $m'$ disjoint matches has total label weight at most
  $p_D^(m')$. To see the joint bound, first fix the two terminal tags.
  For every prescribed edge involving an interior slot, integrate one of its interior choices using the atom bound
  $p_D$. These choices are independent given the tags, and disjoint matching edges use distinct choices.
  If a terminal-tag pair is prescribed, sum that match last using the subprobability point bound.
  This proves the bound also when different edges match each tag to an interior slot of the other list.

Write $q = \| S ∩ T \|$, and let $bb(E)_(upright("labels"))$ denote the sum with the interior probability kernels
  and terminal-tag subprobability weights, at the fixed sites and data.
  Expand $G_D^q$ as the product of $1 + \( G_D - 1 \) upright(bold(1))_(upright("match"))$ over eligible pairs.
  To restrict to $q gt.eq 1$, designate one actual match first.
  The preceding joint bound, with incompatible prescriptions contributing zero, gives

$ bb(E)_(upright("labels")) \[ upright(bold(1))_({ q gt.eq 1 }) G_D^q \] lt.eq
  M_(*) p_D G_D exp #scale(x: 120%, y: 120%)[\(] M_(*) p_D \( G_D - 1 \) #scale(x: 120%, y: 120%)[\)] . $

Combining this with (6.8) bounds the overlap contribution by

#[#set math.equation(numbering: n => "(6.18)")
 $ C_x frac(G_D, D f_0) J_(*) exp (C_x D^(- .19) J_c + C_x frac(G_D, D f_0) J_c) . $ <eq:averaged-overlap-error>]

Only matched slots incur a cost; unused route vertices incur none.

The sum of (6.17) and (6.18) has the form

#[#set math.equation(numbering: n => "(6.19)")
 $ C_x D^(- 1 + zeta \( x \)) J_(*) e^(delta_D J_c) \, wide zeta \( x \) arrow.r 0 med \( x arrow.b 0 \) \, quad
   delta_D arrow.r 0 med \( D arrow.r oo \) \, $ <eq:route-error>]

where the second limit is for a sufficiently small fixed $x$.
  The factors $b_D \( 1 + t^(- 3 \/ 2) \)$ have only polylogarithmic losses, and $G_D \/ \( D f_0 \) =
  C_x D^(- 1 + x + C sqrt(x))$, so these choices are possible.

We can now use the geometry. For each fixed common site, the deterministic weights of the two noncommon sites are
  bounded by $C_x R^(- 6)$. Enlarge their sum to a fixed cube of side comparable with $R$ and compare with its
  uniform average. Equations (6.1)–(6.2) and Cauchy–Schwarz give

$ & bb(E)_(upright("sites")) bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(upright("retained")) J_(*)
  e^(delta_D J_c) #scale(x: 120%, y: 120%)[\]]\
 & quad lt.eq #scale(x: 180%, y: 180%)[\(] bb(E)_(upright("sites"))
   bb(E) \[ upright(bold(1))_(upright("retained")) upright(bold(1))_({ J_(*) > 0 }) \]
   #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) #scale(x: 180%, y: 180%)[\(] bb(E)_(upright("sites"))
   bb(E) \[ upright(bold(1))_(upright("retained")) J_c^2 e^(2 delta_D J_c) \]
   #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq C_x R^(- c_g \/ 2) . $

For the last factor take $D$ large enough that $2 delta_D < kappa \/
  2$ and absorb $J_c^2$ into $e^(kappa J_c \/ 2)$. The common-site weights,
  each bounded by $C_x R^(- 3)$ on $O_x \( R^3 \)$ sites, have bounded total mass.
  All these bounds precede the data average; the site weights are not probabilities conditioned on availability.

Choose $x$ so small that $zeta \( x \) < w c_g \/ 4$. Since $R asymp D^w$,
  (6.19) has total expectation $O \( D^(- 1 - c'') \)$ for some $c'' > 0$.
  The permissible bad-set base and $kappa$ can then be fixed for this $x$, and finally $D$ can be increased.
  The absolute positive exponent $c_g$ makes this order of choices possible. We have proved

#[#set math.equation(numbering: n => "(6.20)")
 $ integral ell_v^2 thin thin upright(d) P_(upright("aug") \, v) lt.eq bb(E) \[ A_v A_(w')^2 \] +
   O \( D^(- 1 - c'') \) + o_K \( 1 \) \, $ <eq:long-second>]

in particular after averaging over $cal(P)_R$.

The right lift of the same common measure satisfies (6.20) with $v \, w'$ exchanged.
  To verify this, make the right copy primary and read the indices in reverse,
  while preserving the actual generation order. Integrate out the unobserved pins near its common end;
  none of the remaining kernels uses them. All conditional comparisons above allow that order.
  For route averaging, use the common-terminal conclusions of Proposition 18 for the same route law,
  rather than a different coupling.

=== 6.6 Completion of the distant comparison <completion-of-the-distant-comparison>

The reference mass is $bb(E) A_v$ and the lift mass is the common mass.
  Subtract twice (6.5) from (6.20) and add the reference mass. This gives, after the indicated cell-pair average,

#[#set math.equation(numbering: n => "(6.21)")
 $ integral \( ell_v - 1 \)^2 thin thin upright(d) P_(upright("aug") \, v) lt.eq
   bb(E) \[ A_v \( A_(w') - 1 \)^2 \] + o \( D^(- 1) \) + o_K \( 1 \) . $ <eq:long-likelihood-error>]

Up to negligible count-tail terms, $A_v lt.eq C D^x$. Equation (5.1),
  together with the uniform marginal distribution of each cell in $cal(P)_R$,
  therefore bounds the average of the main term by

$ C #scale(x: 120%, y: 120%)[\(] D^(- 1 - w \/ 6 + x) + D^(- 1 + 2 x) R^(- 3) #scale(x: 120%, y: 120%)[\)] =
  o \( D^(- 1) \) $

for sufficiently small $x$ relative to $w$. The same holds for the right lift.

Let $q$ be the density of the common projected measure on the bath.
  Jensen’s inequality under projection preserves both squared likelihood bounds. Since $P_v$ has density $s_v^2$,

$ integral \| s_v - sqrt(q) \|^2 thin thin upright(d) Y' =
  integral s_v^2 lr(|1 - sqrt(q \/ s_v^2)|)^2 thin thin upright(d) Y' lt.eq integral s_v^2 \| 1 -
  q \/ s_v^2 \|^2 thin thin upright(d) Y' . $

Use absolute continuity for the zero-density convention. Applying the same inequality with $w'$ and then the
  squared triangle inequality proves (4.3).

== 7 From local occupations to the constant mode <sec:assembly>

The energy calculation determines the occupation outside cellwise constants at scale $R$.
  We now show that the remaining difference between cellwise constants and the global constant is negligible on
  the depletion scale. The distant comparison controls variation of cell root mean squares;
  the local fourth-moment comparison lets us replace those root mean squares by the arithmetic means that define
  orthogonal projections.

=== 7.1 A variance bound from distant pairs <a-variance-bound-from-distant-pairs>

Let $s_v$ be the nonnegative bath function defined by (4.1), for $v in cal(C)_R$.
  We regard these functions as a finite array with values in the Hilbert space $L^2$ of the $N -
  1$ bath coordinates. Its mean is $macron(s) = bb(E)_(v in cal(C)_R) s_v$.

#thm([Lemma 7.1.])[
  (Distant-pair spectral gap).  #emph[Let $M$ tend to infinity through integers,
    and let $\( f_z \)_(z in \( bb(Z) \/ M bb(Z) \)^3)$ be an array in a Hilbert space.
    Average pairs $\( z \, z + h \)$ uniformly over $z$, over all transverse displacements,
    and over first-coordinate displacements $h_1$ in $\[ .30 M \, .45 M \]$. For all sufficiently large $M$,
$ bb(E)_z parallel f_z - macron(f) parallel^2 lt.eq C bb(E)_(z \, h) parallel f_(z + h) - f_z parallel^2 $

 with an absolute constant $C$.]
] <lem:distant-gap>

#proof[
  Use the finite Fourier transform of the array and Parseval’s identity.
    The multiplier of the right side is the displacement average of $\| e^(2 pi i k dot.op h \/ M) - 1 \|^2$.
    If either transverse component of $k$ is nonzero, the average phase vanishes and this multiplier equals $2$.
    For $k = \( k_1 \, 0 \, 0 \)$, geometric summation gives
  $ lr(|bb(E)_(h_1) e^(2 pi i k_1 h_1 \/ M)|) lt.eq frac(C, min \( k_1 \, M - k_1 \)) \, wide 1 lt.eq k_1 < M . $
  This gives a positive lower bound when the denominator exceeds a fixed constant.
    For each of the finitely many remaining nonzero frequencies (measured from either end of the frequency
    interval), the multiplier converges to the average of $\| e^(2 pi i k t) -
    1 \|^2$ over $t in \[ .30 \, .45 \]$. That integral is strictly positive.
    The finite minimum is positive, completing the proof also for Hilbert-valued arrays. ◻
]

Apply the lemma with $M = K \/ R$ and use (4.3). The result is

#[#set math.equation(numbering: n => "(7.1)")
 $ bb(E)_(v in cal(C)_R) parallel s_v - macron(s) parallel^2 = o \( D^(- 1) \) + o_K \( 1 \) . $ <eq:rms-variance>]

The scale-independent spectral gap here is the reason to average macroscopically separated pairs.
  Nearest-neighbor squared differences alone would introduce a volume-dependent factor.

=== 7.2 Arithmetic means and root mean squares <arithmetic-means-and-root-mean-squares>

Put $F \( y \, Y' \) = sqrt(V) thin Phi \( y \, Y' \)$, where $Y'$ denotes the bath coordinates.
  The first-coordinate spatial measure is now normalized as $thin upright(d) y \/ V$. For every cell $v$ define

$ m_v \( Y' \) = frac(1, \| v \|) integral_v F \( y \, Y' \) thin upright(d) y \, wide s_v \( Y' \) =
  (frac(1, \| v \|) integral_v F \( y \, Y' \)^2 thin upright(d) y)^(1 \/ 2) . $

The second definition agrees with (4.1). The quantities $m_v$ are precisely the cellwise values used by $P_l$.
  Positivity of $Phi$ gives $0 lt.eq m_v lt.eq s_v$ and $\( s_v - m_v \)^2 lt.eq s_v^2 - m_v^2$.
  For microcells, integrating this inequality and using Proposition 5 gives

#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E)_(v in cal(C)_d) parallel s_v - m_v parallel^2 lt.eq 1 /
   N chevron.l upright(d) Gamma \( W_d \) chevron.r_Phi lt.eq D^(- 1) \( epsilon.alt_j + o \( 1 \) \) \, wide
   epsilon.alt_j arrow.r 0 . $ <eq:micro-rms>]

We must transfer this estimate to an $R$-cell. Averaging the $m_v$ over its microcells gives its arithmetic mean
  exactly; averaging the $s_v$ does not give its root mean square.
  The next inequality controls that discrepancy with the fourth-order information supplied by (4.2).

#thm([Lemma 7.2.])[
  (Root mean square comparison).  #emph[For a finite nonnegative array $\( y_i \)$,
    with uniform independent indices $i \, i'$, one has
#[#set math.equation(numbering: n => "(7.3)")
 $ (sqrt(bb(E)_i y_i^2) - bb(E)_i y_i)^2 lt.eq 1 / 2 bb(E)_(i \, i')
   frac(\| y_i - y_(i') \|^4, y_i^2 + y_(i')^2) \, $ <eq:rms-fourth-inequality>]

 where the quotient is zero when its denominator vanishes. Moreover,
#[#set math.equation(numbering: n => "(7.4)")
 $ \| sqrt(y) - sqrt(z) \|^4 lt.eq frac(\| y - z \|^4, y^2 + z^2) lt.eq 8 \| sqrt(y) -
   sqrt(z) \|^4 wide \( y \, z gt.eq 0 \) . $ <eq:square-root-quotient>]

]
] <lem:rms-comparison>

#proof[
  Write $A = bb(E) y_i^2$ and $b = bb(E) y_i$. If $A = 0$, all assertions are immediate. Otherwise Cauchy–Schwarz gives
  $ 1 / 2 bb(E)_(i \, i') frac(\| y_i - y_(i') \|^4, y_i^2 + y_(i')^2) gt.eq
    frac(\( A - b^2 \)^2, A) gt.eq \( sqrt(A) - b \)^2 . $
  For the second assertion, factor $y - z = \( sqrt(y) - sqrt(z) \) \( sqrt(y) + sqrt(z) \)$.
    The ratio $\( sqrt(y) + sqrt(z) \)^4 \/ \( y^2 + z^2 \)$ lies between $1$ and $8$; the zero cases follow directly. ◻
]

Within an $R$-cell $b$, apply this lemma pointwise in $Y'$ to the microcell values $s_v$.
  Their root mean square is exactly $s_b$. Join any two microcells of $b$ by at most $C_j
  R$ adjacent steps inside $b$, telescope their square roots, and use $\( sum_(k = 1)^m \| a_k \| \)^4 lt.eq
  m^3 sum_(k = 1)^m \| a_k \|^4$. Even bounding each path sum by the sum over every internal edge gives,
  after averaging $b$ and using (4.2),

#[#set math.equation(numbering: n => "(7.5)")
 $ bb(E)_(b in cal(C)_R) ∥s_b - bb(E)_(v subset b \, med v in cal(C)_d) s_v∥^2 lt.eq C_j R^6 D^(- 1 - u \/ 8) =
   o \( D^(- 1) \) . $ <eq:coarse-rms-comparison>]

Here $R^3$ comes from the fourth-power path inequality and another $R^3$ from the number of internal edges.
  The prescribed $w < u \/ 10000$ ensures $6 w < u \/ 8$. Jensen’s inequality and (7.2) now give

#[#set math.equation(numbering: n => "(7.6)")
 $ bb(E)_(b in cal(C)_R) parallel s_b - m_b parallel^2 lt.eq
   D^(- 1) \( 2 epsilon.alt_j + o \( 1 \) \) . $ <eq:coarse-mean-rms>]

=== 7.3 Completion of the depletion asymptotic <completion-of-the-depletion-asymptotic>

Let $P_0$ be the projection onto the global constant function on the scaled torus,
  and let a subscript $1$ indicate action in the first particle coordinate.
  Centering a Hilbert-valued array is an orthogonal projection and hence a contraction.
  Combining (7.1) and (7.6), we obtain

#[#set math.equation(numbering: n => "(7.7)")
 $ D parallel \( P_R - P_0 \)_1 Phi parallel^2 & = D bb(E)_(b in cal(C)_R) parallel m_b - macron(m) parallel^2\
 & lt.eq 4 epsilon.alt_j + o \( 1 \) + o_K \( 1 \) . $ <eq:low-mode>]

Multiplication of an inner-limit remainder by $D$ is harmless:
  at fixed $rho$, $D$ converges to the fixed number $D_(*)$.
  Since $j$ can be chosen arbitrarily large before the dilution threshold is taken,
  (7.7) makes the very-low-frequency contribution negligible.

The projections $W_R$ and $P_R - P_0$ are orthogonal and sum to $1 - P_0$.
  Permutation symmetry and Proposition 5 therefore yield, in the stipulated order of limits,

#[#set math.equation(numbering: n => "(7.8)")
 $ D #scale(x: 120%, y: 120%)[\(] 1 - parallel \( P_0 \)_1 Phi parallel^2 #scale(x: 120%, y: 120%)[\)] & = 1 /
   V chevron.l upright(d) Gamma \( W_R \) chevron.r_Phi + D parallel \( P_R - P_0 \)_1 Phi parallel^2\
 & = frac(8, 3 sqrt(pi)) alpha^(3 \/ 2) + o \( 1 \) . $ <eq:scaled-final-depletion>]

The equality of the leading term includes both bounds: the second summand is nonnegative, tends to zero,
  and the first already has the asymptotic displayed in Proposition 5.

#proof[
  The coordinate rescaling, with wave-function factor $sigma^(3 N \/ 2)$,
    is unitary and maps constant functions to constant functions.
    It preserves the occupation fraction, so $B_Gamma = parallel \( P_0 \)_1 Phi
    parallel^2$ for the unique ground-state density matrix. In the inner thermodynamic limit,
  $ D sqrt(rho a_v^3) arrow.r D_(*) sqrt(rho a_v^3) = alpha_0^(3 \/ 2) \, wide alpha arrow.r alpha_0 > 0 . $
  Divide (7.8) by the first quantity. For a given accuracy,
    first choose $j$ to make the contribution from $epsilon.alt_j$ sufficiently small,
    and then take $D_(*)$ sufficiently large for all dilute errors and fixed-parameter thresholds.
    By (2.2), this amounts to choosing $rho < rho_0 \( v \, epsilon.alt \)$.
    The estimates hold on a tail of every thermodynamic sequence, with no requirement on its rate of convergence.
    They prove precisely the limsup assertion in Theorem 1. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
