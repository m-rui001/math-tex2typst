#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[A Fock-space inequality and the Laughlin spectral gap]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The gap and the model <sec:intro>

Laughlin’s wave function gave an explicit description of the fractional quantum Hall state at filling $1 \/ 3$ #cite(label("Laughlin")). Haldane’s spherical geometry and pseudopotentials identify a particularly simple parent Hamiltonian: every pair pays energy one in relative angular momentum one and zero in the other pair sectors #cite(label("Haldane")). Its exact Laughlin zero mode is known, but a uniform lower bound on the positive spectrum requires control of all competing many-particle states. We prove this bound for the full interaction on the round sphere, resolving positively the spherical fermionic Laughlin spectral-gap conjecture.

The gap question has accompanied this model since its early development. Haldane and Rezayi’s finite-size study supplied numerical evidence and explicitly distinguished the expected hard-core gap from a formal proof #cite(label("HaldaneRezayi1985FiniteSize")). The density-wave variational picture of Girvin, MacDonald, and Platzman explains important features of the excitation spectrum #cite(label("GMP")). A variational excitation energy is an upper bound; the lower bound sought here must hold for every state orthogonal to the zero modes.

=== 1.1 Normalization and main results <normalization-and-main-results>

For an integer $Q gt.eq 1$, let $U_Q$ be the spin-$Q \/ 2$ representation of $S U \( 2 \)$, equipped with its invariant inner product. It is the one-particle lowest Landau level on the sphere with $Q$ flux quanta. Equivalently, it is the space of homogeneous polynomials of degree $Q$ in spinor coordinates $\( u \, v \)$. For $2 lt.eq N lt.eq Q + 1$, define

$ "(1)" quad H_(N \, Q) = sum_(1 lt.eq i < j lt.eq N) P_(i j)^(\( 1 \))\|_(and.big^N U_Q) \, $ <eq:physicalH>

where $P_(i j)^(\( 1 \))$ is the orthogonal projector onto pair spin $Q - 1$ in tensor positions $i \, j$. This is relative angular momentum one. The sum preserves the antisymmetric subspace. Each unordered pair has coefficient one, with no rescaling depending on $N$ or $Q$.

Set $H_(0 \, Q) = H_(1 \, Q) = 0$, and write

$ cal(F)_Q = xor.big_(N = 0)^(Q + 1) and.big^N U_Q \, #h(2em) H_Q = xor.big_(N = 0)^(Q + 1) H_(N \, Q) \, #h(2em) gamma_(*) = 4616733319001 / 10^14 > 1 / 25 . $

Our principal estimate concerns this entire Fock space.

#thm([Theorem 1.1.])[
  #emph[For every $0 < gamma < gamma_(*)$, there is an integer $Q_gamma$ such that for every integer $Q gt.eq Q_gamma$, 
$ "(2)" quad H_Q^2 gt.eq gamma H_Q #h(2em) upright("on ") cal(F)_Q . $ <eq:architecture>

 The threshold $Q_gamma$ is independent of particle number.]
] <thm:fock>

Thus the spectrum is contained in ${ 0 } union \[ gamma \, oo \)$. In a particle sector without a zero mode, this statement bounds the energy away from zero; it does not assert a gap between that sector’s two lowest eigenvalues. At Laughlin filling the zero mode is unique, and we obtain the usual ground-state spectral gap.

#thm([Corollary 1.2.])[
  #emph[There is an integer $N_0 gt.eq 2$ such that, for every $N gt.eq N_0$ and $Q = 3 \( N - 1 \)$, 
$ "(3)" quad H_(N \, Q) gt.eq 1 / 25 #scale(x: 120%, y: 120%)[\(] I - P_(upright(L) \, N) #scale(x: 120%, y: 120%)[\)] #h(2em) upright("on ") and.big^N U_Q \, $ <eq:main>

 where $P_(upright(L) \, N)$ projects onto the line spanned by 
$ Psi_(upright(L) \, N) = product_(i < j) \( u_i v_j - u_j v_i \)^3 . $

]
] <thm:main>

At fixed magnetic length, the sphere radius is proportional to $sqrt(Q)$, so this is the two-dimensional thermodynamic limit. The thresholds in Theorem 1 and Corollary 2 are existential. The proof does not give an explicit flux threshold or the endpoint coefficient $gamma_(*)$ on finite spheres.

=== 1.2 Prior work <prior-work>

The exact ground-state structure is an established part of the theory. Besides Haldane’s spherical construction, Trugman and Kivelson obtained exact Laughlin ground states for repulsive interactions in a vanishing-range limit #cite(label("TrugmanKivelson1985")). The second-quantized algebra of pseudopotentials was developed systematically by Ortiz, Nussinov, Dukelsky, and Seidel #cite(label("OrtizNussinovDukelskySeidel")). Chen and Seidel, and Mazaheri, Ortiz, Nussinov, and Seidel, gave algebraic constructions and characterizations of their zero modes #cite(label("ChenSeidel2015")) #cite(label("MazaheriOrtizNussinovSeidel2015")). These results identify the zero modes that a spectral estimate must preserve. We include a short self-contained proof of the known spherical zero-mode uniqueness at the Laughlin flux in Lemma 11.

For Laughlin states on a cylinder of any fixed radius, Jansen established thermodynamic correlation limits and axial periodicity #cite(label("Jansen2012")). Exact ground states of related finite-range orbital chains, including squeezed and matrix-product states, were constructed by Nakamura, Wang, and Bergholtz #cite(label("NakamuraWangBergholtz2012")) and by Wang and Nakamura #cite(label("WangNakamura2013")). Nachtergaele, Warzel, and Young proved uniform gaps for a truncated fermionic pseudopotential #cite(label("NWY")); Warzel and Young obtained thin-torus bounds that separate bulk behavior from open-chain edge modes #cite(label("WY")). Their invariant-subspace method also treats a truncated bosonic pseudopotential #cite(label("WarzelYoung2023BulkEdge")). The fermionic estimates already hold uniformly across particle sectors. The distinction in Theorem 1 is the full spherical pair interaction, with its fixed projector normalization and sphere radius growing in the thermodynamic limit. The finite support used in our auxiliary comparison operators does not truncate that interaction.

Recent work gives further structural and spectral information. Lemm, Nachtergaele, Warzel, and Young derive recursions between particle sectors and compare charge and neutral gaps #cite(label("LemmNachtergaeleWarzelYoung2026Recursive")); a uniform bound for the full pseudopotential still requires control of the model-specific ground-space overlap matrices in those criteria. Schraven and Warzel prove entanglement-gap and clustering results for Laughlin states on sufficiently thin cylinders #cite(label("SchravenWarzel2026IMPS")). The entanglement spectrum is distinct from the Hamiltonian spectrum considered here. Density rigidity within the family of fully correlated Laughlin states is another complementary form of incompressibility, established by Lieb, Rougerie, and Yngvason #cite(label("LRYRigidity")). No density-screening assumption enters our argument.

Rougerie’s survey records the spectral-gap conjecture and its geometric formulations #cite(label("Rougerie")) Appendix A. For $N$ fermions in the planar lowest Landau level, consider the sum over unordered pairs of the orthogonal projectors onto relative polynomial degree one, each with coefficient one and with center-of-mass degree unrestricted. Section 7 proves that its positive spectrum is bounded below by the endpoint $gamma_(*)$, uniformly in particle number $N gt.eq 2$ and total polynomial degree $L$. In particular, this proves the fermionic cubic case of the folklore spectral-gap conjecture in #cite(label("Rougerie")) Conjecture A.1, whose degree range is $L lt.eq 3 N \( N - 1 \) \/ 2$.

=== 1.3 Proof strategy <proof-strategy>

Proving positivity of $H^2 - gamma H$ is a standard route to a gap, underlying finite-size criteria #cite(label("Knabe")) and methods based on positive local decompositions #cite(label("Cruz")) #cite(label("Rai")). Our argument uses rotations and angular-momentum decomposition to construct such a comparison. It starts from the normal-ordered expansion of $H_Q^2$. It has two-, three-, and four-body terms. We compare them with the corresponding terms of a positive operator

$ cal(K)_Q = \( 2 Q - 1 \) integral_(S U \( 2 \)) sum_(rho = 1)^7 F_rho \( g \)^dagger F_rho \( g \) thin d g \, $

where each $F_rho$ is a specified linear combination of a pair annihilator and operators that annihilate three particles and create one. Here $F_rho \( g \)$ denotes rotation by $g$, and Haar measure has mass one. These auxiliary operators involve finitely many orbital modes; the Hamiltonian itself is never truncated.

Rotational symmetry reduces the comparison to fixed spin blocks. The three-body blocks have an explicit spectrum and a summable tail. For four particles, coupling the interacting pair to the different spin sectors of a second pair can produce several copies of the same total spin. Their four-particle images under exterior multiplication can be linearly dependent. For the retained blocks, seven rows of rational data establish finite inequalities in their large-flux limits. The remaining issue is to transfer those inequalities to finite spheres without an error that grows with the number of particles.

The key device is an exact diagonal change of variables for the pair coefficients. On a fixed set of orbital modes, it converts finite-flux annihilators into their limiting forms. Every perturbation is then bounded by the local pair energy. Rotation averaging turns this into $o \( 1 \) H_Q$ on the full Fock space. This relative estimate remains valid when the Gram matrices of these limiting four-particle images have kernels. A second useful observation is to apply Bessel’s inequality to all equivalent spin copies at once; this substantially reduces the four-body comparison error.

The comparisons leave a positive margin:

$ "(4)" quad H_Q^2 gt.eq cal(K)_Q + #scale(x: 120%, y: 120%)[\(] gamma_(*) - o \( 1 \) #scale(x: 120%, y: 120%)[\)] H_Q . $ <eq:budget>

All errors and convergence thresholds are independent of particle number. Figure 1 isolates the passage responsible for this uniformity. A small norm error on a growing many-particle space would not suffice: it must vanish on the zero modes and be controlled by the pair energy. The fixed-mode comparison gives precisely that control before rotations distribute it over the sphere.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [Finite limiting matrices2pt\] Exact positivity on the#linebreak()four-particle space])
})],
  caption: [Figure 1: The finite-sphere comparison preserves an error relative to the pair energy at every step. The limiting positivity is imposed only after wedging; no invertibility of its Gram matrices is required. ],
) <fig:transfer>

Section 2 derives the normal-ordered square, and Section 3 establishes the spin formulas. Section 4 gives the finite comparisons. Section 5 proves their uniform transfer, and Section 6 controls the tail and proves the spherical results. Section 7 derives the planar consequence. The exact row data, rational formulas, and complete arithmetic procedure for the positivity checks are in Appendix 8.

== 2 Exterior algebra and the square of the interaction <sec:algebra>

Our first task is to isolate the two-, three-, and four-body terms of $H_Q^2$. The lifting notation below keeps this calculation independent of particle number.

Throughout the operator argument take $Q gt.eq 2$; statements involving limits hold for all sufficiently large integer $Q$. We use the convention that wedges of distinct increasing orthonormal basis vectors have norm one. On

$ cal(F)_Q = xor.big_(n = 0)^(Q + 1) and.big^n U_Q \, $

let $B \( v \)$ be the adjoint of left wedge multiplication by $v$. Thus $B \( v \)$ is conjugate-linear in $v$, and

$ B \( v and w \) = B \( w \) B \( v \) . $

For an orthonormal basis $e_0 \, dots.h \, e_Q$ of $U_Q$, write $c_j = B \( e_j \)$. These operators satisfy the canonical anticommutation relations, and $lr(bar.v.double c_j bar.v.double) lt.eq 1$.

For a matrix on $and.big^k U_Q$, define its lift by linear extension of

$ "(5)" quad cal(L)_k \( \| chevron.r v chevron.l \| w \) = B \( v \)^dagger B \( w \) . $ <eq:lift>

This map preserves positivity, intertwines rotations, acts as the original matrix on $k$ particles, and vanishes on fewer than $k$ particles. Positivity follows by decomposing a positive matrix into a sum of rank-one positive matrices.

Put $a = Q - 1$ and let $V_Q subset and.big^2 U_Q$ be the spin-$a$ summand. If $v_0 \, dots.h \, v_(2 Q - 2)$ is an orthonormal basis of $V_Q$, set

$ "(6)" quad B_p = B \( v_p \) \, #h(2em) H_Q = cal(L)_2 \( Pi_(V_Q) \) = sum_(p = 0)^(2 Q - 2) B_p^dagger B_p . $ <eq:fockH>

This pair-annihilator form is standard in the algebraic treatment of pseudopotentials #cite(label("OrtizNussinovDukelskySeidel")) Sections II.B–D; see also #cite(label("ChenSeidel2015")) Equation (2). We verify its coefficient-one normalization here. Its restriction to $and.big^N U_Q$ is (1). Indeed contraction in two specified tensor positions corresponds to $B \( v \) \/ sqrt(binom(N, 2))$ under the isometric identification of wedge and antisymmetric tensor spaces; summing over the $binom(N, 2)$ unordered pairs gives (6).

Define intertwining wedge maps

$ W_3 : V_Q ⊗ U_Q arrow.r and.big^3 U_Q \, #h(2em) W_4 : V_Q ⊗ V_Q arrow.r and.big^4 U_Q \, $

by $W_3 \( v ⊗ u \) = v and u$ and $W_4 \( v ⊗ w \) = v and w$. We suppress the subscript $Q$ when no confusion can result.

A finite normal-ordering calculation in the sense of Wick #cite(label("Wick")) now determines the square. Only contractions between the two middle pair operators are needed.

#thm([Lemma 2.1.])[
  (Normal-ordered square).  #emph[On $cal(F)_Q$, 
$ "(7)" quad H^2 = H + cal(L)_3 #h(-1em) (W_3 \( W_3^dagger W_3 - I \) W_3^dagger) + cal(L)_4 \( W_4 W_4^dagger \) . $ <eq:square>

]
] <lem:square>

#proof[
  In normal ordering $B_p^dagger \( B_p B_r^dagger \) B_r$, only the two inner annihilators cross the two inner creators. Two, one, or zero contractions leave two-, three-, or four-body terms, respectively. On two particles, $H = Pi_(V_Q)$ is a projection, so the two-body coefficient is $Pi_(V_Q)$. The term with no contractions is
  $ sum_(p \, r) B \( v_p and v_r \)^dagger B \( v_p and v_r \) = cal(L)_4 \( W_4 W_4^dagger \) . $
  There is no extra factor of two: this sum, and the defining basis of $V_Q ⊗ V_Q$, both use ordered pairs. On three particles, $H = W_3 W_3^dagger$, since $W_3$ restricted to $v_p ⊗ U_Q$ is the map $B_p^dagger$ from one to three particles. Subtracting its two-body contribution from $H^2$ therefore determines the remaining coefficient as
  $ \( W_3 W_3^dagger \)^2 - W_3 W_3^dagger = W_3 \( W_3^dagger W_3 - I \) W_3^dagger . $
  Normal-ordered coefficients are determined successively by these restrictions, proving the identity on Fock space. ◻
]

== 3 Spin coefficients and their limits <sec:spin>

The three-body comparison will use the exact spin spectrum of the wedge map. The four-body comparison will use only finitely many coupling coefficients and their limits.

The spherical pair coefficients can be expressed through angular-momentum coupling #cite(label("OrtizNussinovDukelskySeidel")) Section II.C and Appendix A. We derive the particular coefficients and fixed-deficit limits needed here to keep their phases and normalization explicit.

We now fix $e_p$ and $v_p$ to be the normalized lowering bases of $U_Q$ and $V_Q$, respectively, with $v_0 = - e_0 and e_1$. For spin $j$, lowering from label $p$ to $p + 1$ has coefficient $sqrt(\( p + 1 \) \( 2 j - p \))$. Write $\( s \)_p = s \( s - 1 \) dots.h.c \( s - p + 1 \)$, with $\( s \)_0 = 1$.

#thm([Lemma 3.1.])[
  (Pair coefficients).  #emph[The coefficient of $e_i and e_j$ in $v_p$, for $i < j$, vanishes unless $i + j = p + 1$, and otherwise equals 
$ "(8)" quad v_p \( i \, j \) = \( i - j \) sqrt(frac(\( Q \)_i \( Q \)_j thin p !, Q \( 2 Q - 2 \)_p thin i ! j !)) . $ <eq:pair>

 For fixed $p \, i \, j$, its limit is 
$ "(9)" quad v_p^(*) \( i \, j \) = \( i - j \) sqrt(frac(p !, 2^p i ! j !)) thin upright(bold(1))_(i + j = p + 1) . $ <eq:pairstar>

]
] <lem:pair>

#proof[
  Apply simultaneous lowering $p$ times to $- e_0 and e_1$ and divide by $sqrt(\( 2 Q - 2 \)_p p !)$. Expand the lowering operator binomially. Combining the two contributions to each increasing pair gives (8). Taking the limit gives (9). The normalization can also be checked directly: the square of the coefficient in (8) is
  $ \( i - j \)^2 frac(binom(Q, i) binom(Q, j), Q binom(2 Q - 2, p)) \, $
  and differentiating $\( 1 + x \)^Q$ gives
  $ sum_(i \, j = 0)^Q \( i - j \)^2 binom(Q, i) binom(Q, j) x^(i + j) = 2 Q x \( 1 + x \)^(2 Q - 2) . $
  Take the coefficient of $x^(p + 1)$ and halve the sum to restrict to $i < j$. ◻
]

The elementary tensor product rule decomposes spins $j_1 \, j_2$ into one copy of each spin $j_1 + j_2 - z$, for $0 lt.eq z lt.eq min \( 2 j_1 \, 2 j_2 \)$. This rule can be seen directly in the polynomial model: at deficit $z$ the raising equation determines a highest vector, and normalized lowering generates its $2 \( j_1 + j_2 - z \) + 1$ orthogonal weight vectors. Different highest spins give orthogonal invariant subspaces, and the sum of these dimensions is $\( 2 j_1 + 1 \) \( 2 j_2 + 1 \)$, exhausting the tensor product. Let $R_(3 \, z)$ be the corresponding projection in $V_Q ⊗ U_Q$, and put

$ d_a = 2 Q - 1 \, #h(2em) d_(3 \, z) = 3 Q - 1 - 2 z . $

For $Q gt.eq 2$, the allowed indices are $0 lt.eq z lt.eq Q$.

#thm([Lemma 3.2.])[
  (Three-body Gram eigenvalues).  #emph[
$ "(10)" quad W_3^dagger W_3 - I = sum_(z = 0)^Q q_z \( Q \) R_(3 \, z) \, #h(2em) q_z \( Q \) = \( - 1 \)^z frac(\( Q \)_z, \( 2 Q - 2 \)_z) (3 z - 1 - frac(z \( z + 1 \), Q)) . $ <eq:q>

 In particular $W_3 R_(3 \, z) = 0$ for $z = 0 \, 1 \, 3$ whenever these indices are allowed. For fixed $z$, 
$ "(11)" quad q_z \( Q \) arrow.r \( 3 z - 1 \) \( - 1 \/ 2 \)^z . $ <eq:qlimit>

]
] <lem:q>

#proof[
  Identify $V_Q ⊗ U_Q$ with tensors antisymmetric in their first two positions. Then $W_3$ is $sqrt(3)$ times full antisymmetrization. Its Gram operator is the compression of $I - P_13 - P_23$, where $P_(i j)$ swaps tensor positions. The two swap compressions coincide, since conjugation by $P_12$ interchanges them and $P_12 = - I$ on the domain. By equivariance and multiplicity-freeness they act by the same scalar $b_z$ on each spin block.
  A highest vector of that block has coefficients $s_p$ on $v_p ⊗ e_(z - p)$, $0 lt.eq p lt.eq z$, satisfying
  $ "(12)" quad s_(p + 1) / s_p = - sqrt(frac(\( z - p \) \( Q - z + p + 1 \), \( p + 1 \) \( 2 Q - 2 - p \))) . $ <eq:highest-ratio>
  This follows by applying the raising operator. Write $xi_z = sum_(p = 0)^z s_p v_p ⊗ e_(z - p)$. Since $v_0 = \( - e_0 ⊗ e_1 + e_1 ⊗ e_0 \) \/ sqrt(2)$, testing $P_23 xi_z$ against $v_0 ⊗ e_z$ tests $xi_z$ only on the ordered triples $\( 0 \, z \, 1 \)$ and $\( 1 \, z \, 0 \)$. Their pair labels are $z - 1$ and $z$, respectively, with the first contribution absent at $z = 0$. Substituting their pair coefficients from (8) gives
  $ s_0 b_z = 1 / 2 [s_(z - 1) sqrt(frac(z \( Q \)_z, Q \( 2 Q - 2 \)_(z - 1))) - s_z \( z - 1 \) sqrt(frac(\( Q \)_z, \( 2 Q - 2 \)_z))] . $
  Here the ordered tensor coefficients of a normalized wedge include a factor $1 \/ sqrt(2)$. Iteration of (12) gives
  $ s_z / s_0 = \( - 1 \)^z sqrt(frac(\( Q \)_z, \( 2 Q - 2 \)_z)) \, #h(2em) s_(z - 1) / s_0 = \( - 1 \)^(z - 1) sqrt(frac(z \( Q - 1 \)_(z - 1), \( 2 Q - 2 \)_(z - 1))) quad \( z gt.eq 1 \) . $
  Substitution gives $q_z = - 2 b_z$ in the form (10). The three stated null sectors have $q_z = - 1$, and (11) follows directly. ◻
]

We will repeatedly use a fixed-deficit limit of this same calculation. In a product of spins $j_1 \, j_2$, total lowering deficit means $T = j_1 + j_2 - m$, where $m$ is the total magnetic quantum number. Coefficients below are with respect to normalized monomials $X^p Y^(T - p) \/ sqrt(p ! \( T - p \) !)$, and are zero outside the stated index ranges.

#thm([Lemma 3.3.])[
  (Fixed-deficit coupling limit).  #emph[Suppose $j_1 \, j_2 arrow.r oo$ and $j_2 \/ \( j_1 + j_2 \) arrow.r u^2$, where $0 < u < 1$. Put $v = sqrt(1 - u^2)$. For fixed integers $0 lt.eq z lt.eq T$, the normalized coupled vector of spin $j_1 + j_2 - z$ at total lowering deficit $T$ can be chosen with real coefficients converging to the coefficients $s_(z \, T \, p)^(\( u \))$ of 
$ "(13)" quad frac(\( u X - v Y \)^z \( v X + u Y \)^(T - z), sqrt(z ! \( T - z \) !)) . $ <eq:coupling>

 Descendants in every copy are obtained by normalized lowering, so the matching of bases between equal-spin copies is intertwining.]
] <lem:coupling>

#proof[
  At $T = z$, the raising equation gives the adjacent ratio
  $ - sqrt(frac(\( z - p \) \( 2 j_2 - z + p + 1 \), \( p + 1 \) \( 2 j_1 - p \))) . $
  With sign $\( - 1 \)^z$ at $p = 0$, normalization yields the coefficients of $\( u X - v Y \)^z \/ sqrt(z !)$ in the limit. The change of variables $\( X \, Y \) mapsto \( u X - v Y \, v X + u Y \)$ is orthogonal, so these polynomials have norm one in the normalized-monomial inner product. Normalized lowering from $T$ to $T + 1$ divides the sum of the two lowering operators by
  $ sqrt(\( T - z + 1 \) { 2 \( j_1 + j_2 - z \) - \( T - z \) }) . $
  In the limit this acts by multiplication by $\( v X + u Y \) \/ sqrt(T - z + 1)$. Induction proves the statement for fixed descendants. ◻
]

== 4 Rotational averages of explicit squares <sec:squares>

We construct a positive rotational average and compare its three- and four-body terms with those of $H_Q^2$. This section specifies the finite inequalities needed; Appendix 8 proves them by exact rational arithmetic.

Haar measure $d g$ on $S U \( 2 \)$ is normalized to have total mass one. For an operator $A$, write $A \( g \) = U \( g \) A U \( g \)^dagger$, with the appropriate Fock representation. Schur averaging sends a rank-one operator on an irreducible spin-$j$ space to its trace times $I \/ \( 2 j + 1 \)$. For several equivalent copies, it acts in the same way on the spin factor and retains the matrix between copies. Explicitly, if the representation is $xor.big_j \( V_j ⊗ bb(C)^(m_j) \)$ and $P_j$ is its spin-$j$ projection, then

$ integral U \( g \) X U \( g \)^dagger thin d g = xor.big_j frac(I_(V_j), 2 j + 1) ⊗ "Tr"_(V_j) \( P_j X P_j \) . $

Here $"Tr"_(V_j)$ is the partial trace over the spin factor. This follows from Schur’s lemma applied to each pair of irreducible copies, with the scalar fixed by its trace; see #cite(label("BartlettRudolphSpekkens")) Section II.C. In particular, averaging preserves off-diagonal entries between equivalent spin copies.

The positive-square construction belongs to the quadratic-gap approach described in Section 1. Fermionic positivity constraints, normal ordering, and symmetry also appear in the quantum Hall bootstrap of Gao et al. #cite(label("GaoLanzettaLedwithWangKhalaf")), which bounds ground-state energies. Here the explicit squares are compared with $H_Q^2 - gamma H_Q$ to control the positive excitation spectrum.

For each of the seven rows in Appendix 8, the integer $t_rho$ lies in ${ 0 \, dots.h \, 7 }$. Set

$ cal(S)_rho = { \( p \, j \) in bb(Z)^2 : 0 lt.eq p lt.eq 7 \, med 0 lt.eq j lt.eq 8 \, med 0 lt.eq p + j - t_rho lt.eq 8 } . $

The row specifies real coefficients $lambda_rho$ and $alpha_(p j)^rho$ for $\( p \, j \) in cal(S)_rho$; unlisted entries are zero. Every coefficient sum for row $rho$ below is over $cal(S)_rho$. Our comparison operator is

$ "(14)" quad K = sum_(rho = 1)^7 F_rho^dagger F_rho \, #h(2em) F_rho = lambda_rho B_(t_rho) + sum_(\( p \, j \) in cal(S)_rho) alpha_(p j)^rho thin c_(p + j - t_rho)^dagger c_j B_p . $ <eq:F>

Each summand of $F_rho$ removes two particles and decreases the sum of occupied orbital labels by $t_rho + 1$: for the second term the decrease is $\( p + 1 \) + j - \( p + j - t_rho \) = t_rho + 1$. This common weight allows the two parts to interfere in their square, adjusting the three-body comparison at the two-body cost $lambda_rho^2 B_(t_rho)^dagger B_(t_rho)$. Only modes $0 \, dots.h \, 8$ occur in these auxiliary squares.

For a single row, omit $rho$ and put $i = p + j - t$, $k = q + l - t$. Define

$ O_(p \, j \, k) = B \( v_p and e_j and e_k \) = c_k c_j B_p . $

Reordering $c_i c_k^dagger = delta_(i k) - c_k^dagger c_i$ gives the two-, three-, and four-body terms of $F^dagger F$:

$ "(15)" quad & lambda^2 B_t^dagger B_t \,\
 & sum_(p \, j) lambda alpha_(p j) [\( c_i B_t \)^dagger c_j B_p + \( c_j B_p \)^dagger c_i B_t] + sum_(p \, j \; q \, l) alpha_(p j) alpha_(q l) delta_(i k) \( c_j B_p \)^dagger c_l B_q \,\
 & - sum_(p \, j \; q \, l) alpha_(p j) alpha_(q l) O_(p \, j \, k)^dagger O_(q \, l \, i) . $ <eq:normal2>

Let $A_2 \, A_3 \, A_4$ denote these terms, summed over rows and averaged with factor $d_a$. Thus

$ "(16)" quad cal(K)_Q := d_a integral K \( g \) thin d g = A_2 + A_3 + A_4 \, #h(2em) A_2 = eta H \, quad eta = sum_rho lambda_rho^2 . $ <eq:Adecomp>

=== 4.1 The three-body comparison <the-three-body-comparison>

Before wedging, (15) is a matrix on $V_Q ⊗ U_Q$. Its nonzero entries preserve $T = p + j$, and $T lt.eq 15$. Averaging therefore gives

$ "(17)" quad A_3 = cal(L)_3 (W_3 sum_(z = 0)^15 d_a / d_(3 \, z) e_z^Q R_(3 \, z) W_3^dagger) \, $ <eq:A3>

for all sufficiently large $Q$, where $e_z^Q$ is the trace of the unaveraged matrix in that spin block. By Lemma 6, with $u = 1 \/ sqrt(3)$, these traces converge to

$ "(18)" quad e_z = sum_rho sum_(T = max \( z \, t_rho \))^15 [2 lambda_rho s_(z \, T \, t_rho) sum_(p + j = T) alpha_(p j)^rho s_(z \, T \, p) + (sum_(p + j = T) alpha_(p j)^rho s_(z \, T \, p))^2] \, $ <eq:ez>

where $s = s^(\( 1 \/ sqrt(3) \))$ and empty inner sums are zero. The condition $i = k$ in (15) is exactly the equality of the two values of $T$.

The exact calculation in Appendix 8 proves

$ "(19)" quad e_z < 3 / 2 \( 3 z - 1 \) \( - 1 \/ 2 \)^z \, #h(2em) z in { 2 \, 4 \, 5 \, dots.h \, 15 } . $ <eq:3certificate>

There are finitely many strict inequalities, $d_(3 \, z) \/ d_a arrow.r 3 \/ 2$, and the omitted blocks $z = 0 \, 1 \, 3$ are annihilated by $W_3$. Consequently, for all sufficiently large $Q$,

$ "(20)" quad A_3 lt.eq cal(L)_3 (W_3 sum_(z = 0)^15 q_z \( Q \) R_(3 \, z) W_3^dagger) . $ <eq:A3bound>

=== 4.2 The four-body comparison before taking limits <the-four-body-comparison-before-taking-limits>

Let

$ hat(W) : V_Q ⊗ and.big^2 U_Q arrow.r and.big^4 U_Q $

be the wedge map. The second tensor factor decomposes into spins $Q - r$, with $r$ odd, $1 lt.eq r lt.eq Q$. In its lowering bases use the sign of Lemma 6; at $r = 1$ this is precisely the basis $v_p$.

A copy of spin $2 Q - 1 - D$ is obtained by coupling $a = Q - 1$ with $Q - r$ at deficit $D - r$. Denote its vector at total deficit $T$ by $\| D \, T \; r chevron.r_Q$. Its physical orbital-index sum is $1 + T$, and it is a highest vector when $T = D$. For fixed $D \, T$ and sufficiently large $Q$, the allowed copy labels are

$ cal(R)_D = { 1 \, 3 \, 5 \, dots.h } ∩ \[ 1 \, D \] \, #h(2em) D lt.eq T . $

Define the real finite-flux coefficients by

$ \| D \, T \; r chevron.r_Q = sum_(p + j + k = T\
j < k) S_r^Q \( D \, T \; p \, j \, k \) thin v_p ⊗ \( e_j and e_k \) \, $

and extend them antisymmetrically in $j \, k$. By two applications of Lemma 6, they converge to

$ "(21)" quad S_r \( D \, T \; p \, j \, k \) = sqrt(2) thin s_(r \, j + k \, j)^(\( 1 \/ sqrt(2) \)) thin s_(D - r \, T - r \, p)^(\( 1 \/ sqrt(2) \)) \, $ <eq:S>

interpreted as zero if $r > j + k$. The formula holds for either ordering of $j \, k$, by antisymmetry. It follows by applying Lemma 6 first to the two single-particle spins and then to the two pair spins.

Only $1 lt.eq D lt.eq 23$ contribute: every unaveraged term has

$ T = p + j + k = q + l + i lt.eq 23 . $

Put $d_D = 4 Q - 1 - 2 D$. In the coupled bases $\| D \, T \; r chevron.r_Q$, the spin-$2 Q - 1 - D$ block is identified with $bb(C)^(d_D) ⊗ bb(C)^(cal(R)_D)$: the first factor uses the $\( T - D \)$-th normalized spin descendant, and the second has basis vector indexed by $r$. Let $E_D^Q$ be the partial trace over the spin factor of the compression to this block of the matrix representing (15) before wedging, summed over rows. Schur averaging then gives, for all sufficiently large $Q$,

$ "(22)" quad A_4 = cal(L)_4 #h(-1em) (hat(W) [xor.big_(D = 1)^23 d_a / d_D \( I_(d_D) ⊗ E_D^Q \)] hat(W)^dagger) \, $ <eq:A4>

where the direct sum acts as zero on all other spin blocks. For these finitely many $D$, entrywise convergence gives $E_D^Q arrow.r E_D$, with

$ "(23)" quad \( E_D \)_(r s) = - sum_rho sum_(p \, j \; q \, l\
T gt.eq D) alpha_(p j)^rho alpha_(q l)^rho S_r \( D \, T \; p \, j \, k \) S_s \( D \, T \; q \, l \, i \) \, $ <eq:E>

where $i = p + j - t_rho$, $k = q + l - t_rho$, and $T = p + j + k$. The exact finite-flux matrix $E_D^Q$ is given by the same formula with each $S_r$ replaced by $S_r^Q$. Exchanging the two ordered entry pairs exchanges $r$ and $s$, so both matrices are real symmetric.

The target term $cal(L)_4 \( W_4 W_4^dagger \)$ is obtained from the $r = 1$ summand, since that summand is $V_Q ⊗ V_Q$. Thus its copy matrix, in the units just used, is $\( d_D \/ d_a \) chi$, where

$ chi_(r s) = upright(bold(1))_(r = s = 1) \, #h(2em) d_D \/ d_a arrow.r 2 . $

For even $D$, the $r = 1$ coupled vector is antisymmetric under exchange of its two spin-$a$ factors, since its coupling deficit is $D - 1$. Wedging two degree-two vectors is symmetric, so this target column then vanishes after applying $hat(W)$. The formula with $chi$ still represents it exactly; we never assume that the wedged copy vectors are independent.

Target spin blocks outside $1 lt.eq D lt.eq 23$ contribute positively and may be discarded in a lower bound.

Set

$ "(24)" quad w_(D r)^Q & = hat(W) \| D \, D \; r chevron.r_Q \,\
w_(D r)^(*) & = sum_(p + j + k = D\
j < k) S_r \( D \, D \; p \, j \, k \) thin v_p^(*) and e_j and e_k \, #h(2em) \( G_D \)_(r s) = chevron.l w_(D r)^(*) \, w_(D s)^(*) chevron.r . $ <eq:wQ>

The star is a limit label, not an adjoint. Let $W_D^(*)$ be the map with columns $w_(D r)^(*)$. With allowance $epsilon = 3 dot.op 10^(- 6)$, the limiting comparison on these four-particle images asks that $W_D^(*) \( 2 chi - E_D + epsilon I \) \( W_D^(*) \)^dagger$ be nonnegative. Lemma 7 identifies this with the exact certificate

$ "(25)" quad G_D \( 2 chi - E_D + epsilon I \) G_D gt.eq 0 \, #h(2em) 1 lt.eq D lt.eq 23 . $ <eq:4certificate>

Appendix 8 specifies and verifies it entirely by rational arithmetic.

== 5 A relative error bound for finite spheres <sec:transfer>

The limiting Gram matrices have kernels, so their positivity cannot be transferred by assuming that their ranges vary continuously. Instead, we compare the annihilators themselves. An exact diagonal change of variables reduces every error to a fixed finite family of pair-generated annihilators. This gives an error relative to $H_Q$, uniformly on the full Fock space.

Geometry-dependent diagonal changes of occupation-number coordinates already relate pseudopotential annihilators and their zero modes #cite(label("OrtizNussinovDukelskySeidel")) Section II.E. For a gap estimate, the needed additional statement is quantitative: on a fixed set of modes the change of variables approaches the identity, and its error is controlled by pair energy. The proof below establishes that statement before adding spectator modes and averaging over rotations.

For the local argument, let $cal(F)_(upright(l o c))$ be the exterior algebra of $bb(C)^25$ with orthonormal basis $e_0 \, dots.h \, e_24$. For $Q gt.eq 24$ we identify it with the Fock space of the first 25 orbital modes in $U_Q$. By (9), each limiting pair vector $v_p^(*)$ with $p lt.eq 23$ lies in $and.big^2 bb(C)^25$. Contraction by these vectors is defined on $cal(F)_(upright(l o c))$ by the same exterior-algebra convention as before.

#thm([Lemma 5.1.])[
  (Compression and annihilator bounds).  #emph[Let $W$ be a linear map between finite-dimensional Hilbert spaces, $G = W^dagger W$, and let $C$ be self-adjoint on the domain of $W$. Then 
$ G C G gt.eq 0 quad arrow.l.r.double quad W C W^dagger gt.eq 0 . $

 On $cal(F)_(upright(l o c))$, for any fixed finite collection $A_b = c_k c_j B \( v_p^(*) \)$ with $0 lt.eq p lt.eq 23$ and $0 lt.eq j \, k lt.eq 24$, 
$ "(26)" quad sum_b lr(bar.v.double A_b psi bar.v.double)^2 lt.eq C_0 chevron.l psi \, h_(*) psi chevron.r \, #h(2em) h_(*) := sum_(p = 0)^23 B \( v_p^(*) \)^dagger B \( v_p^(*) \) \, $ <eq:annihilatorbound>

 where $C_0$ depends only on the collection.]
] <lem:compression>

#proof[
  The two positivity statements both assert that the quadratic form of $C$ is nonnegative on $"ran" G = "ran" W^dagger$. For the second assertion, use $lr(bar.v.double c_k c_j B \( v_p^(*) \) psi bar.v.double) lt.eq lr(bar.v.double B \( v_p^(*) \) psi bar.v.double)$ and sum; one may take $C_0$ to be the largest multiplicity of a pair label $p$. ◻
]

#thm([Lemma 5.2.])[
  (Uniform transfer).  #emph[For $Q gt.eq 24$ and $1 lt.eq D lt.eq 23$, put 
$ C_D^Q = \( d_D \/ d_a \) chi - E_D^Q + epsilon I \, #h(2em) h_Q = sum_(p = 0)^23 B_p^dagger B_p . $

 Assuming (25), there is a scalar $rho_Q gt.eq 0$, independent of $D$ and tending to zero as $Q arrow.r oo$, such that 
$ "(27)" quad sum_(r \, s in cal(R)_D) \( C_D^Q \)_(r s) B \( w_(D r)^Q \)^dagger B \( w_(D s)^Q \) gt.eq - rho_Q h_Q $ <eq:relative>

 on the entire Fock space $cal(F)_Q$.]
] <lem:transfer>

#proof[
  #emph[An exact change of variables.] Take $Q gt.eq 24$. All annihilators in (27), including those in $h_Q$, involve only the modes $0 \, dots.h \, 24$. First work on $cal(F)_(upright(l o c))$. Define the positive diagonal operator
  $ Delta_Q \| chevron.r A = (product_(x in A) d_Q \( x \)) \| chevron.r A \, #h(2em) d_Q \( x \) = sqrt(\( Q \)_x \/ Q^x) \, $
  on each basis wedge $\| chevron.r A$. This local Fock space is fixed as $Q$ varies. Thus $Delta_Q$ and $Delta_Q^(- 1)$ converge in norm to $I$; also $0 < Delta_Q lt.eq I$.
  The pair coefficient formula (8) gives
  $ v_p \( x \, y \) = r_p \( Q \) d_Q \( x \) d_Q \( y \) v_p^(*) \( x \, y \) \, #h(2em) r_p \( Q \) = sqrt(\( 2 Q \)^p \/ \( 2 Q - 2 \)_p) gt.eq 1 . $
  Checking the factors attached to the removed orbital labels on a basis wedge gives the exact identities
  $ "(28)" quad B_p & = r_p \( Q \) Delta_Q^(- 1) B \( v_p^(*) \) Delta_Q \,\
B \( v_p and e_j and e_k \) & = frac(r_p \( Q \), d_Q \( j \) d_Q \( k \)) thin Delta_Q^(- 1) B \( v_p^(*) and e_j and e_k \) Delta_Q . $ <eq:pairconjugation>
  These are identities on the local Fock space, with the inverse diagonal acting on the output particle sector. Repeated removed labels make both sides zero. In particular, solving (28) for $B \( v_p^(*) \) Delta_Q$ and using $r_p \( Q \) gt.eq 1$ and $lr(bar.v.double Delta_Q bar.v.double) lt.eq 1$ gives
  $ "(29)" quad Delta_Q h_(*) Delta_Q lt.eq h_Q . $ <eq:pairenergytransfer>
  #emph[The error is controlled by pair energy.] Fix $D$. Index a finite family by $b = \( p \, j \, k \)$ with $p + j + k = D$ and $j < k$, and put
  $ A_b = B \( v_p^(*) and e_j and e_k \) \, #h(2em) beta_(r b)^Q = S_r^Q \( D \, D \; p \, j \, k \) frac(r_p \( Q \), d_Q \( j \) d_Q \( k \)) . $
  Equations (24) and (28) yield
  $ B \( w_(D r)^Q \) = Delta_Q^(- 1) (sum_b beta_(r b)^Q A_b) Delta_Q . $
  The coefficients are real, and Lemma 6 gives $beta_(r b)^Q arrow.r beta_(r b)^(*) := S_r \( D \, D \; p \, j \, k \)$. Hence the finite real symmetric matrices
  $ M_Q = \( beta^Q \)^T C_D^Q beta^Q quad upright("converge to") quad M_(*) = \( beta^(*) \)^T \( 2 chi - E_D + epsilon I \) beta^(*) . $
  The quadratic expression in (27) is consequently
  $ Delta_Q (sum_(b \, c) \( M_Q \)_(b c) A_b^dagger Delta_Q^(- 2) A_c) Delta_Q . $
  Its limiting expression before the outer diagonals is
  $ "(30)" quad sum_(b \, c) \( M_(*) \)_(b c) A_b^dagger A_c = sum_(r \, s) \( 2 chi - E_D + epsilon I \)_(r s) B \( w_(D r)^(*) \)^dagger B \( w_(D s)^(*) \) gt.eq 0 . $ <eq:limitpositive>
  Indeed, the certificate (25) and Lemma 7, applied to the map with columns $w_(D r)^(*)$, give positivity before lifting; the lift $cal(L)_4$ preserves positivity.
  For clarity, the perturbation estimate does not require $M_(*) gt.eq 0$. Let $R_Q$ be the block matrix with entries
  $ \( R_Q \)_(b c) = \( M_Q \)_(b c) Delta_Q^(- 2) - \( M_(*) \)_(b c) I . $
  Regard $R_Q$ as an operator on the Hilbert direct sum of one copy of $cal(F)_(upright(l o c))$ for each index $b$. The diagonal $Delta_Q^(- 2)$ acts on the output of $A_c$, hence on the sector with four fewer particles; using its direct sum over local sectors makes this a single operator identity. Its norm tends to zero, since both its index set and the local Fock space are fixed. For every vector $phi.alt$,
  $ lr(|sum_(b \, c) chevron.l A_b phi.alt \, \( R_Q \)_(b c) A_c phi.alt chevron.r|) lt.eq lr(bar.v.double R_Q bar.v.double) sum_b lr(bar.v.double A_b phi.alt bar.v.double)^2 lt.eq C_0 lr(bar.v.double R_Q bar.v.double) chevron.l phi.alt \, h_(*) phi.alt chevron.r . $
  Combine this estimate with (30), take $phi.alt = Delta_Q psi$, and apply (29). This proves (27) on the local Fock space with a coefficient tending to zero. Taking a maximum over the fixed set $1 lt.eq D lt.eq 23$ gives a common $rho_Q$.
  #emph[Additional particles are spectators.] Order the 25 local modes before all other modes in the Fock factorization. Under the isometry that sends a local wedge tensored with a spectator wedge to their ordered product, each $c_j$ with $j lt.eq 24$ is its local annihilator tensored with the identity. The fermionic parity factor belongs to annihilators in the later spectator modes, which do not occur here. Thus every operator in (27) acts on the local factor alone. Tensoring the local inequality with the identity proves it on $cal(F)_Q$, with the same $rho_Q$, regardless of the number of occupied modes outside this factor. ◻
]

The allowance $epsilon I$ in the certificate must also be paid for in pair energy. Here it is useful to sum over the orthonormal highest vectors #emph[before] estimating their wedges. Bessel’s inequality then avoids an extra factor equal to the number of spin copies.

#thm([Proposition 5.3.])[
  (Four-body estimate).  #emph[For the coefficients in Appendix 8, 
$ "(31)" quad A_4 lt.eq cal(L)_4 \( W_4 W_4^dagger \) + \( 1222 epsilon + o \( 1 \) \) H \, #h(2em) Q arrow.r oo \, $ <eq:A4bound>

 uniformly on $cal(F)_Q$.]
] <prop:A4>

#proof[
  Haar averaging the matrix unit $\| D \, D \; r chevron.r_Q chevron.l D \, D \; s \|_Q$ gives the corresponding copy matrix unit tensored with the spin identity, divided by $d_D$. Therefore, on the retained spin blocks, the target minus $A_4$, with the $epsilon I$ allowance added, is
  $ d_a sum_(D = 1)^23 integral sum_(r \, s) \( C_D^Q \)_(r s) B \( w_(D r)^Q \( g \) \)^dagger B \( w_(D s)^Q \( g \) \) thin d g . $
  Lemma 8, conjugated by each rotation, bounds this below by $- o \( 1 \) H$, because Schur averaging gives
  $ d_a integral h_Q \( g \) thin d g = 24 H . $
  The number of retained blocks is fixed, so this error remains uniform in particle number.
  To bound the allowance, fix $D$ and write
  $ \| D \, D \; r chevron.r_Q = sum_(p + j + k = D\
j < k) S_(r b)^Q thin v_p ⊗ \( e_j and e_k \) \, #h(2em) b = \( p \, j \, k \) . $
  The uncoupled vectors on the right are orthonormal. So are the highest vectors on the left: distinct $r$ belong to orthogonal spin summands of the second pair factor. Thus $S^Q \( S^Q \)^T = I$. Apply the contraction $S^Q ⊗ I$ to the Hilbert-space-valued vector $\( c_k c_j B_p psi \)_b$. It follows that
  $ sum_(r in cal(R)_D) lr(bar.v.double B \( w_(D r)^Q \) psi bar.v.double)^2 lt.eq sum_(p + j + k = D\
j < k) lr(bar.v.double c_k c_j B_p psi bar.v.double)^2 lt.eq sum_(p + j + k = D\
j < k) lr(bar.v.double B_p psi bar.v.double)^2 . $
  This uses orthogonality before wedging; the vectors $w_(D r)^Q$ themselves need not be orthogonal. The number of triples on the right is
  $ n_D = sum_(n = 1)^D ⌈n / 2⌉ = ⌊frac(\( D + 1 \)^2, 4)⌋ . $
  Conjugate by rotations and integrate. Each pair norm contributes $chevron.l psi \, H psi chevron.r \/ d_a$, so the total allowance is bounded by
  $ epsilon sum_(D = 1)^23 n_D H = epsilon (sum_(m = 1)^12 m^2 + sum_(m = 1)^11 m \( m + 1 \)) H = 1222 epsilon H . $
  The discarded target spin blocks are positive. Removing the allowance therefore proves (31). ◻
]

== 6 The tail estimate and the gap <sec:finish>

The finite comparisons are now in place. We first bound all remaining three-body blocks by a summable multiple of $H_Q$, then identify the zero mode at Laughlin flux.

#thm([Lemma 6.1.])[
  (Three-body tail).  #emph[For sufficiently large $Q$, 
$ "(32)" quad cal(L)_3 (W_3 sum_(z = 16)^Q q_z \( Q \) R_(3 \, z) W_3^dagger) gt.eq - delta_Q H \, $ <eq:tailbound>

 where 
$ "(33)" quad delta_Q = sum_(17 lt.eq z lt.eq Q\
z upright(" odd")) d_(3 \, z) / d_a \| q_z \( Q \) \| \( z + 1 \) \, #h(2em) delta_Q arrow.r 61 / 4096 . $ <eq:delta>

]
] <lem:tail>

#proof[
  For $16 lt.eq z lt.eq Q$, the bracket in (10) is positive, since it is at least $2 z - 2$. Thus only odd $z$ contribute negatively. A normalized highest vector of $R_(3 \, z)$ is $sum_(p = 0)^z s_p v_p ⊗ e_(z - p)$. Its orbit resolves that spin projector with factor $d_(3 \, z)$. After wedging and lifting, its quadratic form is
  $ lr(bar.v.double sum_(p = 0)^z s_p c_(z - p) \( g \) B_p \( g \) psi bar.v.double)^2 lt.eq sum_(p = 0)^z lr(bar.v.double B_p \( g \) psi bar.v.double)^2 . $
  Averaging each summand proves (32) with (33).
  For $Q gt.eq 4$, the ratios in $\( Q \)_z \/ \( 2 Q - 2 \)_z$ are nonincreasing, so
  $ frac(\( Q \)_z, \( 2 Q - 2 \)_z) lt.eq (frac(Q, 2 Q - 2))^z lt.eq \( 2 \/ 3 \)^z \, #h(2em) d_(3 \, z) / d_a lt.eq 2 . $
  The summands, extended by zero for $z > Q$, are therefore dominated by $6 z \( z + 1 \) \( 2 \/ 3 \)^z$. Dominated convergence and (11) give
  $ lim_(Q arrow.r oo) delta_Q = 3 / 2 sum_(z = 17 \, 19 \, dots.h) \( 3 z - 1 \) \( z + 1 \) 2^(- z) = 61 / 4096 . $
  For the last identity, write $z = 17 + 2 m$. Then $\( 3 z - 1 \) \( z + 1 \) = 900 + 208 m + 12 m^2$, while the sums of $4^(- m)$, $m 4^(- m)$, and $m^(24^(- m))$ are $4 \/ 3$, $4 \/ 9$, and $20 \/ 27$, respectively. Multiplication by $\( 3 \/ 2 \) 2^(- 17)$ gives $61 \/ 4096$. ◻
]

#proof[
  Combine Lemma 3, (16), (20), Proposition 9, and Lemma 10. They give
  $ H^2 gt.eq d_a integral K \( g \) thin d g + \( 1 - eta - delta_Q - 1222 epsilon - o \( 1 \) \) H . $
  The integral is positive. The certificate gives
  $ eta = 93527408868499 / 10^14 \, #h(2em) epsilon = 3 / 10^6 \, $
  so the coefficient tends to
  $ "(34)" quad 1 - 93527408868499 / 10^14 - 61 / 4096 - 1222 3 / 10^6 = gamma_(*) = 4616733319001 / 10^14 > 1 / 25 . $ <eq:finalmargin>
  The limit in (34) is $gamma_(*)$. For each fixed $0 < gamma < gamma_(*)$, the coefficient therefore exceeds $gamma$ for all sufficiently large $Q$. Every convergence threshold is independent of particle number, proving the assertion on $cal(F)_Q$. ◻
]

We now recover the known unique zero mode of Haldane’s spherical parent Hamiltonian #cite(label("Haldane")) p. 606, Equations (6)–(7). The elementary divisibility proof also fixes the exact flux at which the kernel is a line.

#thm([Lemma 6.2.])[
  (Kernel at Laughlin flux).  #emph[For $N gt.eq 2$ and $Q = 3 \( N - 1 \)$, the kernel of $H_(N \, Q)$ is the line spanned by $Psi_(upright(L) \, N)$.]
] <lem:kernel>

#proof[
  Realize $U_Q$ as the homogeneous polynomials of degree $Q$ in spinor coordinates $\( u \, v \)$. Write $b_(i j) = u_i v_j - u_j v_i$. The pair-spin $Q - r$ summand has highest polynomial
  $ b_(i j)^(thin r) u_i^(Q - r) u_j^(Q - r) . $
  Since $b_(i j)$ is invariant under simultaneous rotations of the pair, every vector in this summand is divisible by $b_(i j)^r$. Exchange of the pair has parity $\( - 1 \)^r$, so antisymmetric pair states have odd $r$.
  If $H_(N \, Q) Psi = 0$, then, in the ambient tensor space,
  $ 0 = chevron.l Psi \, H_(N \, Q) Psi chevron.r = sum_(i < j) lr(bar.v.double P_(i j)^(\( 1 \)) Psi bar.v.double)^2 . $
  Thus $P_(i j)^(\( 1 \)) Psi = 0$ for every pair. Expanding in the other particles’ monomials, the remaining pair sectors all have odd $r gt.eq 3$. Thus $b_(i j)^3$ divides $Psi$ for every $i < j$. Each bracket $b_(i j) = v_j u_i - u_j v_i$ is primitive as a polynomial in $u_i$, since $v_j$ and $u_j v_i$ are coprime, and is linear over the fraction field of the other variables. Gauss’s lemma therefore makes it irreducible in the polynomial ring. Brackets for distinct unordered pairs are nonassociate. They are consequently relatively prime. Unique factorization implies
  $ product_(i < j) b_(i j)^3 divides Psi . $
  This product has degree $3 \( N - 1 \) = Q$ in each particle’s spinor variables, exhausting the multidegree of $Psi$; the quotient is constant.
  Conversely, $Psi_(upright(L) \, N)$ is antisymmetric. Its factor $b_(i j)^3$ leaves pair degrees $Q - 3$ in each spinor, whose maximum total pair spin is $Q - 3$. Multiplication by the invariant bracket cannot introduce spin $Q - 1$. Hence every pair projector annihilates $Psi_(upright(L) \, N)$. ◻
]

#proof[
  Apply Theorem 1 with $gamma = 1 \/ 25$. On each particle sector, the spectral theorem gives
  $ H_(N \, Q) gt.eq 1 / 25 #scale(x: 120%, y: 120%)[\(] I - P_(ker H_(N \, Q)) #scale(x: 120%, y: 120%)[\)] $
  once $Q$ exceeds the common threshold. Take $Q = 3 \( N - 1 \)$ and apply Lemma 11. Choosing $N_0$ so that $3 \( N_0 - 1 \)$ exceeds the threshold proves the claim. ◻
]

The following comparison specializes the recursive spectral relations of Lemm, Nachtergaele, Warzel, and Young #cite(label("LemmNachtergaeleWarzelYoung2026Recursive")) arXiv v1, Theorem 2.1(I), Lemma 2.3, and (2.10).

#thm([Corollary 6.3.])[
  (Charge versus neutral gap at fixed flux).  #emph[For $N gt.eq 2$, fix $Q_N = 3 \( N - 1 \)$ and write $E_0 \( n \; Q_N \) = min "spec" H_(n \, Q_N)$ for the coefficient-one interaction (1). Let $"Gap"_N$ be the first positive eigenvalue of $H_(N \, Q_N)$, its neutral gap. The particle-number charge gap at this same flux, 
$ Delta_N = E_0 \( N + 1 \; Q_N \) + E_0 \( N - 1 \; Q_N \) - 2 E_0 \( N \; Q_N \) \, $

 satisfies 
$ Delta_N = E_0 \( N + 1 \; Q_N \) gt.eq frac(N, N - 1) "Gap"_N > 0 . $

 In particular, $Delta_N gt.eq N \/ \[ 25 \( N - 1 \) \]$ for $N gt.eq N_0$, with $N_0$ as in Corollary 2.]
] <cor:charge-neutral>

#proof[
  All three sectors are nonempty since $N + 1 lt.eq dim U_(Q_N) = 3 N - 2$. Lemma 11 gives $E_0 \( N \; Q_N \) = 0$ and a one-dimensional ground space. The $N$-particle sector has dimension greater than one, so $"Gap"_N > 0$. For a nonzero Laughlin vector $Psi$, each pair annihilator $B_p$ commutes with every $c_j$, while $sum_j parallel c_j Psi parallel^2 = N parallel Psi parallel^2$. Thus some $c_j Psi$ is a nonzero $\( N - 1 \)$-particle zero mode, giving $E_0 \( N - 1 \; Q_N \) = 0$. The divisibility argument in Lemma 11 excludes a zero mode in the $\( N + 1 \)$-particle sector: the required product of cubed brackets would have degree $3 N > Q_N$ in each particle variable.
  Let $P_n$ project onto the lowest-energy eigenspace of $H_(n \, Q_N)$, and define the overlap operator on the $\( N + 1 \)$-particle sector by
  $ cal(G)_N = P_(N + 1) (sum_(j = 0)^(Q_N) c_j^dagger P_N c_j) P_(N + 1) . $
  Here $P_(N + 1)$ projects onto a positive-energy ground eigenspace. For the pure two-body fermionic form (6), the cited Theorem 2.1(I), with $m_0 = m_1 = 2$, gives
  $ E_0 \( N + 1 \; Q_N \) gt.eq frac(N + 1, N - 1) E_0 \( N \; Q_N \) + frac(N + 1 - parallel cal(G)_N parallel, N - 1) "Gap"_N . $
  The cited Lemma 2.3 gives $parallel cal(G)_N parallel lt.eq "rank" P_N = 1$. Since $E_0 \( N \; Q_N \) = 0$, this yields $E_0 \( N + 1 \; Q_N \) gt.eq N "Gap"_N \/ \( N - 1 \)$. The two zero energies give the asserted second difference, and Corollary 2 supplies the final uniform bound. ◻
]

== 7 A planar corollary <sec:plane>

The full-Fock-space estimate also gives a gap on the plane. We use the analytic lowest-Landau-level representation described by Girvin and Jach #cite(label("GirvinJach")) Section II, with Gaussian scale fixed below. Let $cal(B)$ be the Bargmann space of entire functions with norm

$ parallel f parallel_(cal(B))^2 = 1 / pi integral_(bb(C)) \| f \( z \) \|^2 e^(- \| z \|^2) thin d^2 z \, #h(2em) e_j \( z \) = z^j / sqrt(j !) . $

Multiplication by $pi^(- 1 \/ 2) e^(- \| z \|^2 \/ 2)$ identifies this space unitarily with the planar lowest Landau level at magnetic field $2$; changing magnetic length is a unitary dilation. For a pair of coordinates set $w = \( z_1 - z_2 \) \/ sqrt(2)$ and $Z = \( z_1 + z_2 \) \/ sqrt(2)$. Let $P^(\( 1 \))$ be the orthogonal projector onto relative degree one, with no restriction on the degree in $Z$, and put

$ H_N^(upright(p l)) = sum_(1 lt.eq i < j lt.eq N) P_(i j)^(\( 1 \))\|_(and.big^N cal(B)) . $

Thus each pair projector has coefficient one, as on the sphere.

#thm([Corollary 7.1.])[
  (Planar spectral gap).  #emph[For every $N gt.eq 2$, the untruncated planar Hamiltonian satisfies 
$ \( H_N^(upright(p l)) \)^2 gt.eq gamma_(*) H_N^(upright(p l)) \, $

 where $gamma_(*)$ is the constant in Theorem 1. Equivalently, if $P_(0 \, N)^(upright(p l))$ projects onto its kernel, then $H_N^(upright(p l)) gt.eq gamma_(*) \( I - P_(0 \, N)^(upright(p l)) \)$. The constant is independent of both particle number and total angular momentum. In particular, the case $ell = 3$ of the spectral gap conjecture in #cite(label("Rougerie")) Conjecture A.1 holds, in its pair-projector normalization.]
] <cor:plane>

#proof[
  The coordinate change $\( z_1 \, z_2 \) mapsto \( w \, Z \)$ is unitary for the Bargmann inner product. Consequently the vectors $w Z^p \/ sqrt(p !)$, $p gt.eq 0$, form an orthonormal basis of the relative-degree-one subspace. Their coefficients in the normalized wedge basis are
  $ v_p^(upright(p l)) \( i \, j \) = \( i - j \) sqrt(frac(p !, 2^p i ! j !)) thin upright(bold(1))_(i + j = p + 1) \, #h(2em) i < j . $
  Indeed, expanding $\( z_1 - z_2 \) \( z_1 + z_2 \)^p$ first gives the coefficient in the tensor basis; passage to the normalized antisymmetric wedge multiplies it by $sqrt(2)$. These are exactly the limits in (9). The second-quantized pair-projector identity therefore gives $H_N^(upright(p l)) = sum_(p gt.eq 0) B \( v_p^(upright(p l)) \)^dagger B \( v_p^(upright(p l)) \)$ on antisymmetric polynomials.
  Fix $N$ and a total degree $L$. The corresponding homogeneous subspace has the finite orthonormal basis
  $ e_(i_1) and dots.h.c and e_(i_N) \, #h(2em) 0 lt.eq i_1 < dots.h.c < i_N \, #h(2em) sum_(k = 1)^N i_k = L . $
  For $Q gt.eq max { L \, N - 1 \, 2 }$ this is also the entire spherical subspace of total lowering deficit $L$, under the identification of normalized one-particle bases. Both Hamiltonians preserve this subspace: a pair is annihilated and created with the same sum of orbital labels. Only $p + 1 lt.eq L$ can contribute. The finitely many matrix entries of the spherical restriction therefore converge to those of the planar restriction by (8)–(9); the convergence is in operator norm.
  Fix $0 < gamma < gamma_(*)$. Theorem 1 gives $H_Q^2 gt.eq gamma H_Q$ for all sufficiently large $Q$. Restrict to the invariant block just described and let $Q arrow.r oo$. Norm convergence passes through the square and gives $\( H_N^(upright(p l)) \)^2 gt.eq gamma H_N^(upright(p l))$ on that block. Now let $gamma arrow.t gamma_(*)$; the cone of positive matrices is closed, so the same inequality holds at $gamma_(*)$. The limit $Q arrow.r oo$ is taken separately for each fixed $gamma$, allowing the flux threshold to depend on $gamma$. Here $N$ and $L$ were arbitrary, and the resulting constant is the same for all of them.
  Finally, $and.big^N cal(B)$ is the Hilbert direct sum of its homogeneous subspaces, and $0 lt.eq H_N^(upright(p l)) lt.eq binom(N, 2) I$. The block inequalities thus extend by continuity to the whole space. The spectral theorem gives the asserted gap. Restriction to total degrees $L lt.eq 3 N \( N - 1 \) \/ 2$ gives exactly the sector in the cited conjecture for $ell = 3$. ◻
]

== 8 The finite rational certificate <app:certificate>

This appendix specifies the seven rows and all arithmetic needed to verify (19) and (25). Starting from the integer rows in Section 8.1, evaluate the rational three-body traces in Section 8.2 and the rational four-body matrices in Section 8.3. The margin and coefficient-sign tables in those sections record the resulting checks. The formulas below determine every value using only integers and rational numbers.

=== 8.1 Row data <app:rows>

Let $P = 10^7$. The first two numbers of each row are $t$ and $ell = P lambda$. An entry $p j : a$ specifies the integer $a_(p j)$, with $p$ and $j$ parsed as separate single-digit labels; omitted entries are zero. Continuation lines belong to the preceding row. Define

$ "(35)" quad alpha_(p j) = a_(p j) / P sqrt(frac(2^p binom(p + j, p), 2^t binom(p + j, t))) = a_(p j) / P sqrt(frac(2^(p - t) t ! \( p + j - t \) !, p ! j !)) . $ <eq:alphadata>

Every nonzero entry has $0 lt.eq p + j - t lt.eq 8$.

#raw(block: true, lang: "", "")

In particular $P^2 eta = sum_rho ell_rho^2 = 93527408868499$.

=== 8.2 Three-body arithmetic <app:three-arithmetic>

For $c in { 1 \, 2 }$, an integer $T gt.eq 0$, and integers $z \, p$, define

$ "(36)" quad sans(U) \( c \, z \, T \, p \) = sum_(h = max \( 0 \, p + z - T \))^(min \( p \, z \)) \( - 1 \)^(z - h) binom(z, h) binom(T - z, p - h) c^(p - h) \, $ <eq:U>

and set it to zero if $z$ or $p$ lies outside $\[ 0 \, T \]$. Expanding (13) gives

$ s_(z \, T \, p)^(\( 1 \/ sqrt(3) \)) = sans(U) \( 2 \, z \, T \, p \) sqrt(frac(2^z binom(T, z), 3^T 2^p binom(T, p))) . $

Substitution in (18) and (35) cancels all radicals:

$ "(37)" quad P^2 e_z = sum_rho sum_(T = max \( z \, t_rho \))^15 frac(2^z binom(T, z), 3^T 2^(t_rho) binom(T, t_rho)) X_(rho \, T) (X_(rho \, T) + 2 ell_rho sans(U) \( 2 \, z \, T \, t_rho \)) \, $ <eq:erational>

where $X_(rho \, T) = sum_(p + j = T) a_(p j)^rho sans(U) \( 2 \, z \, T \, p \)$, with value zero on empty levels. For each $z in { 2 \, 4 \, 5 \, dots.h \, 15 }$, evaluate (37) and form the exact rational margin $m_z = 3 / 2 \( 3 z - 1 \) \( - 1 \/ 2 \)^z - e_z$. Write $10^6 m_z = n_z \/ d_z$ with integers $n_z \, d_z$ and $d_z > 0$. Integer division gives the floors $floor.l n_z \/ d_z floor.r$ listed below:

table(
  columns: 14,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$z$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[15
]),
  table.cell(rowspan: 1, colspan: 1)[floor
], table.cell(rowspan: 1, colspan: 1)[1298313
], table.cell(rowspan: 1, colspan: 1)[211317
], table.cell(rowspan: 1, colspan: 1)[249
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[249
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[249
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[250
], table.cell(rowspan: 1, colspan: 1)[6470
], table.cell(rowspan: 1, colspan: 1)[250
],
)

All are positive, proving (19).

=== 8.3 Four-body arithmetic <app:four-arithmetic>

Fix $1 lt.eq D lt.eq 23$; all copy indices below lie in $cal(R)_D$. Put

$ u_r = frac(1, r ! \( D - r \) !) \, #h(2em) \( E_D \)_(r s) = sqrt(u_r u_s) thin Y_(r s) \, #h(2em) \( G_D \)_(r s) = sqrt(u_r u_s) thin Z_(r s) . $

The matrices $Y \, Z$ are rational. Define

$ sans(V)_r \( D \, T \; p \, j \, k \) = sans(U) \( 1 \, r \, j + k \, j \) sans(U) \( 1 \, D - r \, T - r \, p \) \, $

with value zero for $r > j + k$. Two applications of (13) give

$ "(38)" quad S_r \( D \, T \; p \, j \, k \) = sans(V)_r \( D \, T \; p \, j \, k \) sqrt(2^(1 - \( j + k \) - T + r) frac(j ! k ! p ! thin u_r, \( T - D \) !)) . $ <eq:Srational>

Therefore

$ "(39)" quad P^2 Y_(r s) = - sum_rho sum_(p \, j \; q \, l\
T gt.eq D) & a_(p j)^rho a_(q l)^rho thin sans(V)_r \( D \, T \; p \, j \, k \) sans(V)_s \( D \, T \; q \, l \, i \)\
 & times 2^(1 - 2 T + p + q - t_rho + \( r + s \) \/ 2) frac(i ! k ! t_rho !, \( T - D \) !) \, $ <eq:Yrational>

where $i = p + j - t_rho$, $k = q + l - t_rho$, and $T = p + j + k$. Both entry sums are ordered. To verify the cancellation, multiply the two factors in (38) by the two factors (35); the factorial product under the combined square root is $\( t_rho ! i ! k ! \)^2 u_r u_s \/ \( \( T - D \) ! \)^2$. Using $j + k = T - p$ and $l + i = T - q$, its power of two has exponent $2 + 2 p + 2 q - 2 t_rho - 4 T + r + s$. Taking the positive square root and removing $sqrt(u_r u_s)$ gives exactly the displayed factor.

For an increasing quadruple $A$ of nonnegative indices with sum $D + 1$, put $f \( A \) = product_(b in A) b !$. If $\( x \, y \, j \, k \)$ lists its elements, let $sigma \( x \, y \, j \, k \)$ be the sign of sorting this list into increasing order. In each summand below put $p = x + y - 1$, and define

$ "(40)" quad L_r \( A \) = 2^(\( 1 - 2 D + r \) \/ 2) sum_(x < y upright(" in ") A\
{ j \, k } = A \\ { x \, y } \, med j < k) sigma \( x \, y \, j \, k \) \( x - y \) thin p ! j ! k ! thin sans(V)_r \( D \, D \; p \, j \, k \) . $ <eq:Lrational>

Combining (9) and (38), the coefficient of $w_(D r)^(*)$ on the Slater wedge $A$ is $sqrt(u_r \/ f \( A \)) L_r \( A \)$. Thus

$ "(41)" quad Z_(r s) = sum_(A upright(" increasing quadruple")\
sum_(b in A) b = D + 1) frac(L_r \( A \) L_s \( A \), f \( A \)) . $ <eq:Zrational>

All exponents of two in these formulas are integers, since $r \, s$ are odd.

Let $D_u = "diag" \( u_r \)$ and $D_(sqrt(u)) = "diag" \( sqrt(u_r) \)$. The matrix in (25) equals $D_(sqrt(u)) M D_(sqrt(u))$, where

$ "(42)" quad M = Z B Z \, #h(2em) B = "diag" #scale(x: 120%, y: 120%)[\(] \( 2 upright(bold(1))_(r = 1) + epsilon \) u_r #scale(x: 120%, y: 120%)[\)] - D_u Y D_u . $ <eq:M>

Thus it suffices to check $M gt.eq 0$ using rational arithmetic. This congruence uses only the positive diagonal $D_(sqrt(u))$; it does not invert $G_D$ or presume that its columns are independent.

To check positivity for each $D = 1 \, dots.h \, 23$, form $Y$ and $Z$ from (39) and (41), then form $B$ and $M$ from (42), using $epsilon = 3 \/ 10^6$. All sums range over the printed rows and the finite index sets specified above. Compute with exact fractions throughout. If $d = \| cal(R)_D \|$, initialize $J = I_d$. For $b = 1 \, dots.h \, d$, compute in order

$ "(43)" quad X = M J \, #h(2em) c_b = frac("tr" X, b) \, #h(2em) J = c_b I_d - X . $ <eq:recurrence>

This is the Leverrier–Faddeev recurrence applied to $- M$; see #cite(label("HouConference")). It gives $det \( x I + M \) = x^d + c_1 x^(d - 1) + dots.h.c + c_d$. For example, this recurrence follows by multiplying the polynomial adjugate of $x I + M$ by $x I + M$ and comparing coefficients, together with the derivative-of-determinant trace identity. Exact evaluation of (36), (39), (40), (41), and (43) gives:

table(
  columns: 6,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$D$
], table.cell(rowspan: 1, colspan: 1)[signs
], table.cell(rowspan: 1, colspan: 1)[$D$
], table.cell(rowspan: 1, colspan: 1)[signs
], table.cell(rowspan: 1, colspan: 1)[$D$
], table.cell(rowspan: 1, colspan: 1)[signs
]),
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[#raw("0")
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[#raw("++000")
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[#raw("++++++000")
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[#raw("0")
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[#raw("+0000")
], table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[#raw("+++++0000")
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[#raw("00")
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[#raw("+++000")
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[#raw("+++++++000")
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[#raw("00")
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[#raw("++0000")
], table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[#raw("++++++0000")
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[#raw("+00")
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[#raw("++++000")
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[#raw("++++++++000")
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[#raw("000")
], table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[#raw("+++0000")
], table.cell(rowspan: 1, colspan: 1)[22
], table.cell(rowspan: 1, colspan: 1)[#raw("+++++++0000")
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[#raw("+000")
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[#raw("+++++000")
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[#raw("+++++++++000")
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[#raw("+000")
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[#raw("++++0000")
], table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[],
)

The signs list the coefficients after the leading $1$, in descending degree. For each computed coefficient, choose a positive denominator and inspect its integer numerator: #raw("+") denotes a positive numerator and #raw("0") denotes zero. We use the characteristic-coefficient positivity test for symmetric matrices #cite(label("PeyrlParrilo")) Theorem 5. Every coefficient is nonnegative, so $det \( x I + M \) > 0$ for $x > 0$. Since $M$ is real symmetric, a negative eigenvalue would give a positive root of this polynomial. Therefore $M gt.eq 0$, proving (25).

#prodef([Remark 8.1.])[
  (Nature of the certificate).  The data above certify fixed spin-matrix inequalities. The positive comparison operator is a sum of squares by construction. No many-particle finite-size spectrum, numerical extrapolation, or assumed plasma property enters the argument. The exact equalities and inequalities in this appendix can be verified by a finite calculation using only integers and rational numbers.
]


#bibliography("refs.bib", style: "ieee", title: [References])
