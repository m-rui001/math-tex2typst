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

#align(center)[#text(size: 16pt, weight: "bold")[Generalized ionization energies \
for full Coulomb atoms]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The ionization energy of an atom measures the cost of removing electrons while leaving its nucleus fixed. The first few electrons removed belong to the outer part of the atom, whereas the leading total energy is largely determined by the much denser inner region. Thomas–Fermi theory, introduced by Thomas and Fermi #cite(label("Thomas1927")) #cite(label("Fermi1927")), describes the leading large-charge energy. Lieb and Simon established this connection to the many-body Schrödinger theory #cite(label("LiebSimon1973")) #cite(label("LiebSimon1977")). Their energy theorem #cite(label("LiebSimon1977")) Theorem III.1 concerns terms of order $Z^(7 \/ 3)$. Subtracting two such total-energy asymptotics does not control a much smaller ionization energy: the remainder may exceed the difference being sought.

The generalized ionization conjecture asserts that Thomas–Fermi theory nevertheless determines the leading cost of removing many outer electrons, provided their number remains small compared with the nuclear charge. Solovej formulated this statement through upper and lower large-$Z$ limits, followed by a large removed-electron-number limit #cite(label("Solovej2016")) Section 3, Equation (1). We prove its energy part for the full two-spin Coulomb Hamiltonian, in the stronger joint regime in which both the number removed and the ratio of nuclear charge to that number tend to infinity.

Earlier full-model estimates cover different ionization regimes. Seco, Sigal and Solovej bounded the first ionization energy of a neutral atom by $C Z^(20 \/ 21)$, using the improvement recorded in their note added in proof #cite(label("SecoSigalSolovej1990")) Theorem 1 and p. 315. Ivrii’s estimates imply agreement with the magnitude of the Thomas–Fermi chemical potential for successive one-electron ionization energies of positive atoms when $Z^(5 \/ 7) = o \( Z - N \)$ and $Z - N = o \( Z \)$, where $N$ is the number of electrons #cite(label("Ivrii2017")) Theorem 6.2.1. These results leave open the joint neutral-to-positive-ion energy asymptotic addressed here.

Uniform excess-charge bounds were proved in Thomas–Fermi–von Weizsäcker theory by Benguria and Lieb #cite(label("BenguriaLieb1985")); Solovej proved uniform ionization bounds in reduced Hartree–Fock theory #cite(label("Solovej1991")) and then in unrestricted Hartree–Fock theory #cite(label("Solovej2003")). The Thomas–Fermi–von Weizsäcker and Hartree–Fock results concern different variational problems. The passage to arbitrary correlated fermionic states requires additional screening estimates, obtained here through conditional many-body states.

=== 1.1 The theorem and its normalization <the-theorem-and-its-normalization>

In atomic units, let $Z$ be a positive integer and let

#[#set math.equation(numbering: n => "(1.1)")
 $ H_(Z \, N) = sum_(i = 1)^N (- 1 / 2 Delta_i - frac(Z, \| x_i \|)) + sum_(1 lt.eq i < l lt.eq N) frac(1, \| x_i - x_l \|) $ <eq:hamiltonian>]

act on $and.big^N L^2 \( bb(R)^3 \; bb(C)^2 \)$. Write $E_Z \( N \) = inf sigma \( H_(Z \, N) \)$ and $E_Z \( 0 \) = 0$. For integers $Z > m gt.eq 1$, define

$ I_m \( Z \) = E_Z \( Z - m \) - E_Z \( Z \) . $

The kinetic coefficient of the corresponding Thomas–Fermi functional is $T = 3 / 10 \( 3 pi^2 \)^(2 \/ 3)$. More explicitly, put

$ cal(T)_Z \( rho \) = T integral_(bb(R)^3) rho^(5 \/ 3) - Z integral_(bb(R)^3) frac(rho \( x \), \| x \|) thin d x + 1 / 2 integral.double_(bb(R)^3 times bb(R)^3) frac(rho \( x \) rho \( y \), \| x - y \|) thin d x thin d y \, $

and let $E_Z^(upright("TF")) \( N \)$ be its infimum over nonnegative densities of mass $N$ and finite displayed terms. Set $I_m^(upright("TF")) \( Z \) = E_Z^(upright("TF")) \( Z - m \) - E_Z^(upright("TF")) \( Z \)$. The constant in the conjecture is characterized by the classical Thomas–Fermi weak-ionization law #cite(label("BenilanBrezis2004")) Section 6, Corollary 5:

#[#set math.equation(numbering: n => "(1.2)")
 $ lim_(Z arrow.r oo) I_m^(upright("TF")) \( Z \) = a_(upright("TF")) m^(7 \/ 3) \, #h(2em) m > 0 . $ <eq:tf-constant>]

Our identification of the coefficient in 6 recovers this characterization in the present normalization.

#thm([Theorem 1.1.])[
  (Generalized ionization energy).  #emph[For full nonrelativistic Coulomb atoms with two electron spin states, 
#[#set math.equation(numbering: n => "(1.3)")
 $ frac(I_m \( Z \), m^(7 \/ 3)) arrow.r a_(upright("TF")) > 0 quad upright("whenever") quad m arrow.r oo \, #h(2em) Z / m arrow.r oo \, $ <eq:joint-limit>]

 where $Z > m gt.eq 1$ are integers. In particular, 
#[#set math.equation(numbering: n => "(1.4)")
 $ lim_(m arrow.r oo) frac(limsup_(Z arrow.r oo) I_m \( Z \), m^(7 \/ 3)) & = a_(upright("TF")) \,\
lim_(m arrow.r oo) frac(liminf_(Z arrow.r oo) I_m \( Z \), m^(7 \/ 3)) & = a_(upright("TF")) . $ <eq:iterated-upper>]

 The inner limits are taken over integer $Z$ with $m$ fixed. No convergence of $I_m \( Z \)$ at a fixed $m$ is asserted or assumed.]
] <thm:main>

The limits in (1.4), (1.4) are precisely the energy part of the generalized ionization conjecture formulated by Solovej #cite(label("Solovej2016")) Section 3, Equation (1). The joint assertion (1.3) strengthens that order of limits. For historical comparison, Solovej established uniform first-ionization upper bounds and sharp generalized radius estimates in unrestricted Hartree–Fock theory #cite(label("Solovej2003")) Theorems 3.8 and 1.5; the generalized conjecture and its Hartree–Fock history are discussed in #cite(label("Solovej2016")) Section 3. Here the energy is the exact spectral infimum of (1.1), with no restriction to Slater determinants.

For this same full two-spin Coulomb model, the companion #cite(label("Foundation")) Corollary 1.3 also proves $0 < c lt.eq E_Z \( Z - 1 \) - E_Z \( Z \) lt.eq C < oo$ uniformly for every integer $Z gt.eq 1$. This first-ionization bound does not assert convergence at fixed $m$ and is distinct from the large-$m$ limits above.

=== 1.2 A price per electron <a-price-per-electron>

The proof first allows the particle number to vary. For fixed $Z$, abbreviate $E_n = E_Z \( n \)$, and introduce the unconstrained energy and the priced minimum

$ E = inf_(n gt.eq 0) E_n \, #h(2em) P \( lambda \) = min_(n gt.eq 0) #scale(x: 120%, y: 120%)[\(] E_n + lambda n #scale(x: 120%, y: 120%)[\)] \, #h(2em) lambda > 0 . $

The minimum exists, as verified in 2. Its advantage is local: replacing the exterior electrons by a trial state need not preserve their number. The price accounts for the change exactly. At the length scale $s = lambda^(- 1 \/ 4)$, the removed charge is of order $s^(- 3)$. The main intermediate result identifies its coefficient for every minimizing sector, including at prices where several sectors minimize.

#thm([Theorem 1.2.])[
  (Deficit at a prescribed price).  #emph[There is a universal number $q > 0$ such that, for every sequence satisfying 
$ lambda = s^(- 4) \, #h(2em) s arrow.r 0 \, #h(2em) Z s^3 arrow.r oo \, $

 and every choice of $n$ minimizing $E_n + lambda n$, one has 
$ s^3 \( Z - n \) arrow.r q . $

 The number $q$ is the exterior Coulomb charge of the unique classical solution, tending uniformly to zero at infinity, of 
$ Delta F = 4 pi k #scale(x: 120%, y: 120%)[\(] \( F - 1 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) quad upright("on ") bb(R)^3 \\ { 0 } \, #h(2em) k = \( 5 T \/ 3 \)^(- 3 \/ 2) \, $

 that is bounded above and below by positive multiples of $\| x \|^(- 4)$ near zero. The density $k \( \( F - 1 \)_(+) \)^(3 \/ 2)$ has bounded support, and $F \( x \) = q \/ \| x \|$ outside that support. Moreover, 
$ a_(upright("TF")) = 3 / 7 q^(- 4 \/ 3) . $

]
] <thm:priced-deficit>

=== 1.3 Analytic precedents and proof structure <analytic-precedents-and-proof-structure>

The local kinetic comparison combines two classical constructions. Coherent wave packets provide the upper semiclassical energy #cite(label("Lieb1981ThomasFermi")) Section V.A.1; see also #cite(label("Solovej2003")) Lemma 8.2. Neumann cube eigenvalues and their lattice count supply a lower comparison with the same leading coefficient #cite(label("LiebSimon1977")) Theorems III.10–III.13. Their remainders are controlled by local particle counts. This is different from the coarse Lieb–Thirring kinetic inequality #cite(label("LiebThirring1975")), whose positive universal constant is sufficient for preliminary density bounds; the spectral splitting proof used in the companion follows Rumin #cite(label("Rumin2011")) Theorem 1.4 and Section 3.1.

Screened exterior potentials and outward Thomas–Fermi comparisons are central to Solovej’s Hartree–Fock argument #cite(label("Solovej2003")) Sections 6, 10, and 12. Our use of conditional states requires a separate transfer from local quantum energies to conditional fields, while accounting for changes in particle number. The eventual singular profile belongs to the classical Sommerfeld comparison theory #cite(label("LiebSimon1977")) Section IV, including the nonspherical comparisons and chemical-potential estimates of #cite(label("Solovej2003")) Lemma 4.4, Remark 4.5, Theorem 4.6, and Corollary 4.7. The issue here is to obtain that profile from the correlated quantum state and preserve its positive singularity through conditioning.

We use the localization, screening, and Thomas–Fermi estimates proved in the companion #emph[Uniform excess charge for Coulomb molecules and the outer radius of neutral atoms] #cite(label("Foundation")). In particular, its uniform neutral-sector bound $E_Z \( Z \) - E lt.eq C$ fixes the zero-price integration constant, and its local-field estimates retain explicit control of an arbitrary energy offset #cite(label("Foundation")) Proposition 12.3 and Proposition 4.5. The required positive-price conditional comparisons and barrier propagation are proved in Section 3, Section 4. Their offset dependence is essential: a minimizing priced state has energy at most $E + C s^(- 7)$, so the allowed offset grows as $s arrow.r 0$. A fixed-offset conclusion from the neutral-atom theory cannot by itself yield 1.

2 obtains the rough deficit bound and proves that the rescaled exterior electron mass vanishes beyond a fixed radius. In 3, noisy observations of the electrons permit local conditional comparisons while controlling the cost of conditioning. A Thomas–Fermi trial state in a small ball is compared with the priced many-body state. A fresh spatial cut records the local particles and leaves a core outside the patch, whose conditional screened potential is harmonic on the patch. Matching this core comparison to the noisy-observation law yields simultaneous upper and lower implications between local density and local potential. Two posterior laws occur in this argument; keeping them distinct is necessary for the Coulomb comparison.

The remaining difficulty is to retain the singular inner charge through successive averaging. 4 constructs a positive subsolution at the innermost scale and propagates it through the observation scales. The construction pays for exceptional conditional data with an error density of vanishing expected mass. The weak differential inequality is proved on open neighborhoods of the retained branches before taking their maximum, so no derivative is restricted to an activity interface. 5 then selects conditional data, rescales by $s$, and obtains a decaying solution of the unit-price Thomas–Fermi equation. The barrier prevents loss of the singularity. A maximum-principle argument identifies its Sommerfeld coefficient and proves uniqueness, which forces the same deficit for every minimizing sector.

Finally, 6 integrates the slopes of the priced minimum and brackets the desired particle number between two minimizing sectors. Only monotonicity of $E_Z \( N \)$ is used in this step; convexity in $N$ is not needed. The analogous Thomas–Fermi calculation identifies the coefficient with (1.2). A sequential argument then gives the specified order of limits in (1.4), (1.4).

== 2 Priced sectors and an exterior cutoff <sec:pricing>

The price per electron permits insertion and deletion comparisons without a constraint on the exterior particle number. We first collect the screening estimates that remain applicable when the energy above the unpriced minimum grows. Throughout, write

$ K \( x \) = frac(1, \| x \|) \, #h(2em) V = Z K \, #h(2em) nu = Z delta_0 \, #h(2em) D \( f \) = 1 / 2 integral.double_(bb(R)^3 times bb(R)^3) frac(f \( x \) f \( y \), \| x - y \|) thin d x thin d y \, $

and use the constants

$ T = 3 / 10 \( 3 pi^2 \)^(2 \/ 3) \, #h(2em) k = (frac(5 T, 3))^(- 3 \/ 2) . $

These are the Thomas–Fermi constants for two spin states and kinetic energy $- Delta \/ 2$. For a fixed integer $Z$, abbreviate $E_n = E_Z \( n \)$, put $E_0 = 0$, and define

$ E = inf_(n gt.eq 0) E_n \, #h(2em) P \( lambda \) = min_(n gt.eq 0) \( E_n + lambda n \) quad \( lambda > 0 \) . $

The existence of this minimum follows below. The asymptotic regime used until 6 is

#[#set math.equation(numbering: n => "(2.1)")
 $ lambda = s^(- 4) \, #h(2em) s arrow.r 0 \, #h(2em) Z s^3 arrow.r oo . $ <eq:scaling-regime>]

Every assertion concerning a minimizing sector applies to every choice of minimizing index at every system in this regime.

If $psi$ is a normalized finite-sector form-domain vector, we call it an #emph[unshifted $delta$-state] when its form energy is at most $E + delta$, where $delta gt.eq 0$. Its position law is $\| psi \|^2$, with the spin variables summed unless they are recorded; its one-particle density is denoted by $rho_psi$. Expectations may also include the auxiliary random labels specified below. For a real number $v$, write $v_(+) = max \( v \, 0 \)$ and $v_(-) = max \( - v \, 0 \)$. Constants $C \, c > 0$ can change from line to line. Unless a dependence is displayed, they depend only on this fixed model and on the fixed cutoff and kernel conventions.

=== 2.1 Imported estimates and their hypotheses <imported-estimates-and-their-hypotheses>

#thm([Lemma 2.1.])[
  (Sector and energy estimates).  #emph[The sequence $E_n$ is nonincreasing. If $E_n < E_(n - 1)$, there is a normalized ground state in sector $n$, and $n lt.eq 2 Z + 1 lt.eq 3 Z$. There is a largest such index $N_(*)$, with $Z lt.eq N_(*) lt.eq 3 Z$, and 
$ E = E_(N_(*)) = E_n quad \( n gt.eq N_(*) \) . $

 There are universal $C \, Z_0$ such that 
#[#set math.equation(numbering: n => "(2.2)")
 $ E_Z \( Z \) lt.eq E + C #h(2em) \( Z gt.eq Z_0 \) . $ <eq:neutral-offset>]

 If $Psi$ is a normalized sector ground state and $F$ is a bounded real symmetric Lipschitz function of the spatial configuration, then 
#[#set math.equation(numbering: n => "(2.3)")
 $ chevron.l F Psi \, H_(Z \, n) F Psi chevron.r - E_n parallel F Psi parallel_2^2 = 1 / 2 bb(E)_Psi \| nabla F \|^2 \, $ <eq:ground-multiplier>]

 where the left side is interpreted as a quadratic form and the gradient includes all spatial coordinates. Finally, every unshifted $delta$-state in a sector $n lt.eq 3 Z$ satisfies 
#[#set math.equation(numbering: n => "(2.4)")
 $ integral_(bb(R)^3) rho_psi^(5 \/ 3) lt.eq C \( Z^(7 \/ 3) + delta \) . $ <eq:global-density-input>]

]
] <lem:sector-inputs>

#proof[
  The sector assertions and the multiplier identity are #cite(label("Foundation")) Lemmas 2.1 and 2.4–2.6; the density estimate is #cite(label("Foundation")) Lemma 3.3. The stronger estimate $E_Z \( Z - 1 \) lt.eq E + C$ is #cite(label("Foundation")) Proposition 12.3. Monotonicity gives (2.2). All these results use exactly the Hamiltonian and the two-spin convention fixed here. ◻
]

A one-particle square cut consists of nonnegative bounded-gradient Lipschitz functions $o \, c$ with $o^2 + c^2 = 1$. Conditional on the positions, assign the particles independently to the out and core groups with probabilities $o^2$ and $c^2$. The #emph[cut data] record the out labels, positions, and spins. For a finite sequence of cuts, stage labels are recorded as well. Conditional core states are obtained by the corresponding products of cut factors, so antisymmetry is preserved within each group. This is the localization convention of #cite(label("Foundation")) Lemma 3.4.

The local estimate needed for the later patch comparison has a quantitative condition on these cuts. Fix, once and for all,

$ L = 10^5 \, #h(2em) A = 40 \, #h(2em) a_y = \| y \| \/ L \, #h(2em) B_y = B \( y \, a_y \) quad \( y eq.not 0 \) . $

For an unshifted $delta$-state put

$ m_y = max \( a_y^(- 3) \, 1 \) + sqrt(delta a_y) \, #h(2em) J_y = V \( y \) - sum_(\| x_i - y \| gt.eq A a_y) frac(1, \| y - x_i \|) \,\
P_(*) = max (1 \, sup_(y eq.not 0) frac(bb(E) #scale(x: 120%, y: 120%)[\[] \# { i : x_i in B_y }^2 #scale(x: 120%, y: 120%)[\]], m_y^2)) . $

The number $P_(*)$ is finite for each finite system, since the count is at most the sector particle number and $m_y gt.eq 1$.

#thm([Lemma 2.2.])[
  (Local fields for arbitrary offsets).  #emph[For every normalized unshifted $delta$-state of finite particle number, $P_(*) lt.eq C$. Fix $y eq.not 0$ and $C_0 gt.eq 1$. The data $X$ may be trivial. Otherwise, suppose that the initial cut, or finite sequence of cuts $\( o_h \, c_h \)$, has total out support covered by at most $C_0$ cells $B_z$ with 
$ C_0^(- 1) lt.eq a_z \/ a_y lt.eq C_0 \, #h(2em) sum_h #scale(x: 120%, y: 120%)[\(] \| nabla o_h \|^2 + \| nabla c_h \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq sum_z D_z^2 a_z^(- 2) upright(bold(1))_(B_z) \, #h(2em) frac(D_z^2, a_z m_z) lt.eq C_0 sqrt(P_(*)) . $

 Then, for the complete cut data, 
#[#set math.equation(numbering: n => "(2.5)")
 $ ∥\( bb(E) \[ J_y divides X \] \)_(+)∥_2 lt.eq C \( C_0 \) m_y / a_y . $ <eq:local-field-input>]

 The constants are independent of $Z$, the sector, the state, $y$, and $delta$, apart from the displayed dependence through $m_y$.]
] <lem:local-field-input>

#proof[
  This is #cite(label("Foundation")) Proposition 4.5. Its offset is measured from the minimum $E$ over all sectors, just as here; it has no restriction that the offset stay bounded along a sequence. In all applications below we verify the stronger cut condition $D_z^2 \/ \( a_z m_z \) lt.eq C_0$. ◻
]

#thm([Lemma 2.3.])[
  (Annular screening estimates).  #emph[Let $psi$ be a normalized unshifted $delta$-state of finite particle number. For fixed $0 < alpha < beta < oo$ and every $u > 0$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ ∥\# { i : alpha u lt.eq \| x_i \| lt.eq beta u }∥_2 lt.eq C_(alpha \, beta) #scale(x: 120%, y: 120%)[\(] max \( u^(- 3) \, 1 \) + sqrt(delta u) #scale(x: 120%, y: 120%)[\)] . $ <eq:annular-count>]

 Suppose in addition that $n lt.eq 3 Z$, and set 
$ B_(u \/ 8) \( x \) = V \( x \) - sum_(\| x_i \| < u \/ 8) frac(1, \| x - x_i \|) . $

 Let $Y$ be trivial or be the data of a square cut whose out support lies in ${ u \/ 4 lt.eq \| x \| lt.eq 8 u }$ and whose squared gradient sum is at most $C \/ u^2$. There are conditional versions harmonic on $u \/ 4 < \| x \| < 6 u$ for which 
#[#set math.equation(numbering: n => "(2.7)")
 $ ∥sup_(u \/ 2 lt.eq \| x \| lt.eq 4 u) #scale(x: 120%, y: 120%)[\(] bb(E) \[ B_(u \/ 8) \( x \) divides Y \] #scale(x: 120%, y: 120%)[\)]_(+)∥_2 lt.eq C (frac(max \( u^(- 3) \, 1 \), u) + sqrt(delta / u)) . $ <eq:conditional-inner-field>]

 The constant in the second estimate may depend on the fixed gradient bound. Both estimates allow every finite $delta$.]
] <lem:screening-inputs>

#proof[
  The count estimate is #cite(label("Foundation")) Corollary 4.9. Boundary spheres have zero probability because the one-particle density is absolutely continuous, so open or closed annuli give the same estimate. For the field bound, use #cite(label("Foundation")) Lemma 12.1 with inner cutoff $h = u \/ 8$, broad annulus $u \/ 4 < \| x \| < 6 u$, and smaller annulus $u \/ 2 lt.eq \| x \| lt.eq 4 u$. The series in that lemma is
  $ frac(max \( u^(- 3) \, 1 \) + sqrt(delta u), u) + sum_(j gt.eq 0) frac(max \( \( 2^j h \)^(- 3) \, 1 \) + sqrt(delta thin 2^j h), max \( u \, 2^j h \)) . $
  With $h = u \/ 8$, geometric summation bounds it by the right side of (2.7), also when $u < 1$. The permitted cut support and gradient bound satisfy the fixed-annulus hypotheses of that lemma. The conditional harmonic versions follow by integration against the conditional law: for each fixed finite system the inner sources are uniformly separated from the annulus, so differentiation under the integral is valid. No minimizing property is required in either estimate. ◻
]

=== 2.2 The rough charge deficit <the-rough-charge-deficit>

#thm([Lemma 2.4.])[
  #emph[The minimum $P \( lambda \)$ is attained. Along (2.1), every minimizing index $n$ is eventually nonzero and strictly bound. For a normalized ground state $Psi$ in that sector, put $D_0 = E_n - E$. Uniformly over all these choices, 
#[#set math.equation(numbering: n => "(2.8)")
 $ \| Z - n \| lt.eq C s^(- 3) \, #h(2em) 0 lt.eq D_0 lt.eq C s^(- 7) . $ <eq:rough-deficit>]

]
] <lem:priced-rough>

#proof[
  By 3, $E_n$ is constant for $n gt.eq N_(*)$. Since $lambda > 0$, the priced objective is strictly increasing thereafter, so its minimum is attained. If a minimizing index is positive, comparison with $n - 1$ gives
  $ E_(n - 1) - E_n gt.eq lambda > 0 . $
  It is therefore strictly bound, has a ground state, and satisfies $n lt.eq 3 Z$. A normalized exponential one-electron trial of radius $Z^(- 1)$ has energy $- Z^2 \/ 2$. Moreover,
  $ lambda / Z^2 = frac(s^2, \( Z s^3 \)^2) arrow.r 0 . $
  Thus $P \( lambda \) < 0$ eventually, excluding the vacuum.
  The neutral sector is an admissible competitor. By (2.2),
  #[#set math.equation(numbering: n => "(2.9)")
   $ 0 lt.eq D_0 lt.eq C + s^(- 4) \( Z - n \) . $ <eq:priced-offset>]
  For a fixed inner configuration, the spherical average of $B_(s \/ 8)$ on $\| x \| = s$ equals $\( Z - \# { \| x_i \| < s \/ 8 } \) \/ s$. Its expectation is at least $\( Z - n \) \/ s$. Apply (2.7) with trivial data and offset $D_0$ to obtain, for small $s$,
  $ Z - n lt.eq C #scale(x: 120%, y: 120%)[\(] s^(- 3) + sqrt(D_0 s) #scale(x: 120%, y: 120%)[\)] . $
  If $d = Z - n gt.eq 0$ and $z = s^3 d$, then (2.9) gives $D_0 s^7 lt.eq C s^7 + z$, whence
  $ z lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + sqrt(z + C s^7) #scale(x: 120%, y: 120%)[\)] . $
  This bounds $z$. If $d < 0$, (2.9) instead gives $d gt.eq - C s^4$. These two cases prove the deficit estimate, and substitution in (2.9) proves the bound for $D_0$. ◻
]

=== 2.3 A cutoff at one fixed exterior scale <a-cutoff-at-one-fixed-exterior-scale>

#thm([Lemma 2.5.])[
  #emph[There is a sufficiently large fixed $R_0$ such that, for every sequence of minimizing sectors and corresponding ground states in (2.1), 
#[#set math.equation(numbering: n => "(2.10)")
 $ s^3 bb(E)_Psi \# { i : \| x_i \| > R_0 s } arrow.r 0 . $ <eq:exterior-cutoff>]

]
] <lem:exterior-cutoff>

#proof[
  Choose a smooth $0 lt.eq chi lt.eq 1$ supported in $\[ 1 \/ 2 \, 4 \]$ and equal to one on $\[ 1 \, 2 \]$. At shell scale $u > 0$, write
  $ w_i = chi \( \| x_i \| \/ u \)^2 \, quad S_u = sum_i w_i \, quad m_u = bb(E) S_u \, quad N_u = bb(E) \# { i : u \/ 2 lt.eq \| x_i \| lt.eq 4 u } . $
  Test the weak eigen-equation with $S_u Psi$. In its $i$th summand the other coordinates have energy at least $E_(n - 1)$. Integration by parts gives for the selected-coordinate kinetic term
  $ 1 / 2 "Re" integral nabla_i overline(Psi) dot.op nabla_i \( w_i Psi \) = 1 / 2 integral w_i \| nabla_i Psi \|^2 - 1 / 4 bb(E) Delta_i w_i gt.eq - 1 / 4 bb(E) Delta_i w_i . $
  Retain only the repulsions from particles in $\| x_l \| < u \/ 8$; the selected particle lies outside that ball whenever $w_i > 0$. Since $E_(n - 1) - E_n gt.eq s^(- 4)$, we obtain
  #[#set math.equation(numbering: n => "(2.11)")
   $ s^(- 4) m_u lt.eq C u^(- 2) N_u + bb(E) sum_i w_i B_(u \/ 8) \( x_i \) . $ <eq:shell-eigen-equation>]
  All these tests are bounded symmetric form-domain multipliers for each fixed system.
  Suppose $m_u > 0$. Bias the position law by $S_u \/ m_u$, equivalently use the normalized state
  $ Psi_u = sqrt(S_u \/ m_u) thin Psi . $
  The function $sqrt(S_u)$ is the Euclidean norm of the vector of cutoffs. It is Lipschitz, including at its zeros, and
  $ \| nabla sqrt(S_u) \|^2 lt.eq C u^(- 2) \# { i : u \/ 2 lt.eq \| x_i \| lt.eq 4 u } . $
  The multiplier identity (2.3) therefore makes $Psi_u$ an unshifted state of offset at most
  #[#set math.equation(numbering: n => "(2.12)")
   $ delta_u = D_0 + C u^(- 2) N_u \/ m_u . $ <eq:shell-bias-offset>]
  In both laws take the same auxiliary square cut, full out on $u \/ 2 lt.eq \| x \| lt.eq 4 u$, supported in $u \/ 4 lt.eq \| x \| lt.eq 8 u$, with gradient bounded by $C \/ u$. Its data $Y$ determine $S_u$ and every position with positive weight. Biasing by the $Y$-measurable variable $S_u \/ m_u$ does not change the conditional raw law on $S_u > 0$. Consequently the two conditional harmonic fields there are the same. Let
  $ M \( Y \) = sup_(u \/ 2 lt.eq \| x \| lt.eq 4 u) #scale(x: 120%, y: 120%)[\(] bb(E) \[ B_(u \/ 8) \( x \) divides Y \] #scale(x: 120%, y: 120%)[\)]_(+) $
  be this common conditional supremum. Conditioning first on $Y$ gives
  $ bb(E) sum_i w_i B_(u \/ 8) \( x_i \) lt.eq bb(E) \[ S_u M \( Y \) \] = m_u bb(E)_(Psi_u) M \( Y \) . $
  The equality of conditional fields is used only on positive-bias data; zero-weight summands are omitted. Their harmonic continuity justifies evaluation at the recorded positions. Applying (2.7) to $Psi_u$, with (2.12), now yields
  #[#set math.equation(numbering: n => "(2.13)")
   $ bb(E) sum_i w_i B_(u \/ 8) \( x_i \) & lt.eq C m_u (frac(max \( u^(- 3) \, 1 \), u) + sqrt(D_0 \/ u)) + C u^(- 3 \/ 2) sqrt(m_u N_u) . $ <eq:shell-field-bound>]
  If $m_u = 0$, the resulting shell estimate is immediate as well.
  By (2.8), for $u gt.eq R_0 s$,
  $ s^4 frac(max \( u^(- 3) \, 1 \), u) lt.eq R_0^(- 4) + s^4 \, #h(2em) s^4 sqrt(D_0 \/ u) lt.eq C sqrt(s \/ u) lt.eq C R_0^(- 1 \/ 2) . $
  Choose $R_0$ large and then $s$ small. The terms multiplying $m_u$ in (2.13) can be absorbed in (2.11). As $m_u lt.eq N_u$, the mixed term is at most $C u^(- 3 \/ 2) N_u$, and hence
  $ m_u lt.eq C s^4 \( u^(- 2) + u^(- 3 \/ 2) \) N_u . $
  The annular count bound and (2.8) also give
  $ N_u lt.eq C #scale(x: 120%, y: 120%)[\(] u^(- 3) + 1 + s^(- 7 \/ 2) sqrt(u) #scale(x: 120%, y: 120%)[\)] . $
  The shells on which the weights equal one, with $u = 2^j R_0 s$, $j gt.eq 0$, cover the required exterior. Tonelli’s theorem and the two preceding inequalities give
  $ s^3 bb(E) \# { \| x_i \| > R_0 s } & lt.eq C s^7 sum_(j gt.eq 0) \( u^(- 2) + u^(- 3 \/ 2) \) \( u^(- 3) + 1 + s^(- 7 \/ 2) u^(1 \/ 2) \) \|_(u = 2^j R_0 s)\
 & lt.eq C_(R_0) #scale(x: 120%, y: 120%)[\(] s^2 + s^(5 \/ 2) + s^5 + s^(11 \/ 2) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  Every power of $u$ in this sum is negative. Thus the estimate includes arbitrarily distant shells, with the same fixed $R_0$. ◻
]

== 3 Conditional density and field comparison at positive price <sec:comparison>

We now obtain a local Thomas–Fermi relation for a conditional density. The conditioning retains information about the electron configuration while permitting a controlled change of state on any event of appreciable probability. Two different conditional laws enter the argument: observations define the density to be estimated, whereas a fresh spatial cut defines the core used in the energy comparison. We keep these laws separate and match their potentials only after taking expectation.

Throughout this section, $Psi$ is a normalized ground state in any sector $n$ minimizing $P \( lambda \)$, with $lambda = s^(- 4)$ and (2.1) in force. In particular, $n lt.eq 3 Z$ and $D_0 = E_n - E lt.eq C s^(- 7)$ by 6. All statements about sufficiently small scales are uniform in the choice of this minimizing sector.

=== 3.1 Nested observations and their energy cost <nested-observations-and-their-energy-cost>

Fix $0 < epsilon < 1$, to be chosen in 4, and define

#[#set math.equation(numbering: n => "(3.1)")
 $ r_0 = epsilon Z^(- 1 \/ 3) \, #h(2em) r_j = 2^j r_0 \, #h(2em) J_(*) = max { j gt.eq 0 : r_j lt.eq s } \, #h(2em) ell_j = r_j^1.01 quad \( 0 lt.eq j < J_(*) \) . $ <eq:observation-scales>]

Eventually $2 r_0 lt.eq s$. At each scale $j < J_(*)$, observe the unordered array of points $x_i + ell_j U_(j i)$. All coordinates of all $U_(j i)$ are independent, also independently of the raw configuration, with density

$ zeta \( u \) = c_zeta exp #h(-0.16667em) (- frac(1, 1 - u^2)) upright(bold(1))_({ \| u \| < 1 }) . $

Labels are forgotten separately in each array. Let $cal(F)_j$ be the information in arrays $j \, dots.h \, J_(*) - 1$, and let $cal(F)_(J_(*))$ be trivial. These sigma-fields decrease with $j$.

Use the constants $L = 10^5$, $A = 40$ and $a_y = \| y \| \/ L$ from 4. Fix a real radial function $g in C_c^oo \( B \( 0 \, 1 \) \)$ with $integral g^2 = 1$, set $g_b \( x \) = b^(- 3 \/ 2) g \( x \/ b \)$, and choose

$ w = 10^(- 5) \, #h(2em) 0 < c_1 < \( 10 L \)^(- 1) . $

Writing $d_x = \| x \|$, define the master packets and conditional fields by

#[#set math.equation(numbering: n => "(3.2)")
 $ D_x^(upright(b)) & = max \( d_x \, r_0 \) \, & t_x & = c_1 D_x^(upright(b)) min \( D_x^(upright(b)) \, s \)^w \,\
cal(K)_x \( y \) & = g_(t_x) \( y - x \)^2 \, & mu_j \( y \) & = bb(E) #h(-0.16667em) [sum_i cal(K)_(x_i) \( y \) thin mid(bar.v) thin cal(F)_j] \,\
H'_j \( y \) & = V \( y \) - lambda - \( K * mu_j \) \( y \) . $ <eq:master-kernel>]

The superscript $upright(b)$ indicates the lower clamp, not a power. The width function is globally Lipschitz, with $"Lip" \( t \) lt.eq c_1 \( 1 + w \) s^w$, and $t_x gt.eq c_1 r_0^(1 + w)$. Thus, for each fixed system, $mu_j$ is smooth in its evaluation variable, has mass $n$, and has deterministic bounds on all spatial derivatives. Its Coulomb potential and first derivatives are also continuous and deterministically bounded. These bounds at a fixed system will justify conditional integration; they are not claimed to be uniform in $Z$.

We use versions obtained by integrating against the conditional law of the raw configuration. Such versions can, for example, be specified by the finite-array likelihoods in #cite(label("Foundation")) Lemma 5.1. They give, simultaneously in space,

#[#set math.equation(numbering: n => "(3.3)")
 $ bb(E) \[ mu_j divides cal(F)_(j + 1) \] = mu_(j + 1) \, #h(2em) bb(E) \[ H'_j divides cal(F)_(j + 1) \] = H'_(j + 1) \, #h(2em) Delta H'_j = - 4 pi nu + 4 pi mu_j . $ <eq:observation-tower>]

Continuity extends identities first obtained on a countable dense set. In particular, $H'_j$ is subharmonic off the nucleus.

#thm([Lemma 3.1.])[
  (Cost of an observation event).  #emph[Let $j < J_(*)$ and let $A' in cal(F)_j$ have probability $p > 0$. There is a normalized antisymmetric state $Psi_(A')$ in the same sector whose raw law is the raw marginal conditioned on $A'$ and whose form energy satisfies 
#[#set math.equation(numbering: n => "(3.4)")
 $ chevron.l Psi_(A') \, H_(Z \, n) Psi_(A') chevron.r lt.eq E_n + C r_j^(- 2.02) log^5 \( e \/ p \) . $ <eq:event-tilt-cost>]

 The constant is independent of the particle number, the number of observed arrays, and $D_0$.]
] <lem:event-tilt>

#proof[
  If $p_(A') \( x \)$ is the probability of the observed event conditional on the raw positions, take $Psi_(A') = sqrt(p_(A') \( x \) \/ p) thin Psi$. The multiplier is symmetric and preserves the form domain. The first inequality of #cite(label("Foundation")) Lemma 5.2, with $ell_j = r_j^1.01$, is exactly (3.4). Its proof uses the ground-state multiplier identity in the sector $n$; it measures the cost above $E_n$, independently of the offset of $E_n$ from $E$. ◻
]

Accordingly, the unshifted offset of the tilted state is at most $D_0 + C r_j^(- 2.02) log^5 \( e \/ p \)$, while its shifted energy is at most

#[#set math.equation(numbering: n => "(3.5)")
 $ P \( lambda \) + C r_j^(- 2.02) log^5 \( e \/ p \) . $ <eq:shifted-tilt-cost>]

This distinction is what permits the local comparison below for $D_0$ up to order $s^(- 7)$.

=== 3.2 Statement and preliminary bounds <statement-and-preliminary-bounds>

#thm([Proposition 3.2.])[
  (Simultaneous inverse comparison).  #emph[There is a universal constant $C_(upright("cap"))$ with the following property. Fix 
$ M gt.eq 2 \, #h(2em) 0 < h_l < h_h < oo \, #h(2em) 0 < xi < h_l \/ 16 . $

 For all sufficiently far systems along (2.1), at every $j < J_(*)$ there is an event $cal(G)_j in cal(F)_j$ such that, with $r = r_j$, 
$ bb(P) \( cal(G)_j^c \) lt.eq C r^25 . $

 On $cal(G)_j$, the following assertions hold simultaneously for $r lt.eq d_y lt.eq 4 M r$ and $h_l lt.eq h lt.eq h_h$: 
#[#set math.equation(numbering: n => "(3.6)")
 $ d_y^4 H'_j \( y \) & lt.eq C_(upright("cap")) \,\
d_y^6 mu_j \( y \) > k h^(3 \/ 2) & quad arrow.r.double quad d_y^4 H'_j \( y \) gt.eq h - xi \,\
d_y^6 mu_j \( y \) < k h^(3 \/ 2) & quad arrow.r.double quad d_y^4 H'_j \( y \) lt.eq h + xi . $ <eq:inverse-comparison>]

 The probability constant and the threshold for sufficiently far systems may depend on the displayed fixed parameters and on the fixed packet conventions; $C_(upright("cap"))$ is independent of the band and accuracy parameters.]
] <prop:inverse-comparison>

The two implications compare the field with each positive density height from opposite sides. They will yield an approximate Thomas–Fermi relation in 5, while permitting the field itself to be arbitrarily negative where the density is small.

We prove the proposition in the rest of this section. The proof uses the arbitrary-offset screening estimates from 2 and the energy cost in 8; it does not apply the fixed-offset inverse comparison of #cite(label("Foundation")) Proposition 10.1 with a growing $D_0$.

Fix $j < J_(*)$ and put $r = r_j$. On the enlarged band $r \/ 2 lt.eq d_y lt.eq 8 M r$, write

$ a = a_y \, #h(2em) t = t_y \, #h(2em) tau = t \/ a . $

Uniformly there, for fixed $M$,

#[#set math.equation(numbering: n => "(3.7)")
 $ a asymp_M r \, #h(2em) c_M a^w lt.eq tau lt.eq C s^w . $ <eq:packet-scale-ratios>]

If $cal(K)_x \( y \) eq.not 0$, the Lipschitz bound for the widths gives $\| x - y \| lt.eq 2 t$ and $t_x \/ t = 1 + O \( s^w \)$. Changing variables at scale $t$ therefore gives

#[#set math.equation(numbering: n => "(3.8)")
 $ integral cal(K)_z \( y \) thin d z = 1 + O \( s^w \) . $ <eq:packet-approximate-mass>]

On the local support, the kernel is bounded by $C t^(- 3)$ and is Lipschitz, in either its center or its evaluation variable, with constant $C t^(- 4)$.

===== 3.2.1 A count event. <a-count-event.>

Except on an event of probability at most $r^40$, the $j$th observed array has at most $C_M r^(- 3)$ entries in the radial band $\[ r \/ 4 \, 12 M r \]$. To prove this, condition on the event that a sufficiently large such threshold is exceeded, if its probability is greater than $r^40$. Compact noise support forces every compatible raw configuration to have at least that many points in $\[ r \/ 8 \, 13 M r \]$. By Lemma 3.1, (2.6), its conditional expected count is at most $C_M r^(- 3)$: indeed,

$ sqrt(D_0 r) lt.eq C r^(- 3) \( r \/ s \)^(7 \/ 2) lt.eq C r^(- 3) \, #h(2em) r^(- 0.51) log^(5 \/ 2) \( e \/ r^40 \) = o \( r^(- 3) \) . $

This is a contradiction for a sufficiently large fixed threshold. Denote the retained event by $cal(C)_j$. On it every compatible raw configuration has at most $C_M r^(- 3)$ centers relevant to the enlarged band. Integration against the observation posterior consequently gives

#[#set math.equation(numbering: n => "(3.9)")
 $ 0 lt.eq mu_j \( y \) lt.eq C_M r^(- 6 - 3 w) \, #h(2em) \| nabla mu_j \( y \) \| lt.eq C_M r^(- 7 - 4 w) . $ <eq:conditional-density-bounds>]

===== 3.2.2 A universal field cap. <a-universal-field-cap.>

At a fixed point $y$ of the enlarged band, condition on ${ d_y^4 H'_j \( y \) > b_0 }$ if it has probability $p > 0$. Packets centered outside the exclusion ball in $J_y$ do not contain $y$, by the width bound and the fixed choice of $c_1$. Their potentials at $y$ equal the corresponding point potentials by radial averaging. Dropping the other nonnegative packet potentials and using the observation tower therefore bounds the event-mean of $H'_j \( y \)$ above by the tilted mean of $J_y - lambda$. The trivial-data case of 4 gives

#[#set math.equation(numbering: n => "(3.10)")
 $ b_0 lt.eq C + C \( d_y \/ s \)^(7 \/ 2) - \( d_y \/ s \)^4 + C_M r^2.49 log^(5 \/ 2) \( e \/ p \) . $ <eq:field-cap-tail>]

Here $a < 1$ eventually. The polynomial-power difference on the right has a universal upper bound. Choose a universal $C'$ exceeding the entire deterministic bound by one. Solving (3.10) for $p$ and integrating its stretched-exponential tail yields, for every fixed $P > 0$,

#[#set math.equation(numbering: n => "(3.11)")
 $ bb(E) #scale(x: 120%, y: 120%)[\(] d_y^4 H'_j \( y \) - C' #scale(x: 120%, y: 120%)[\)]_(+) lt.eq C_(P \, M) r^P . $ <eq:cap-excess>]

Subharmonicity turns this into a simultaneous bound. For $3 r \/ 4 lt.eq d_y lt.eq 6 M r$, take a ball of radius $d_y \/ 10$; it lies in the enlarged band. Its mean bounds $H'_j \( y \)$ above. The contribution of $C' d_z^(- 4)$, after multiplication by $d_y^4$, is bounded by a universal constant, and the remaining contribution is at most

$ C r^(- 3) integral_({ r \/ 2 lt.eq d_z lt.eq 8 M r }) \( d_z^4 H'_j \( z \) - C' \)_(+) thin d z . $

By (3.11) and Markov’s inequality, the latter is at most one outside an event of probability $C_M r^40$. We have proved the simultaneous cap

#[#set math.equation(numbering: n => "(3.12)")
 $ H'_j \( y \) lt.eq C_(upright("cap")) d_y^(- 4) quad \( 3 r \/ 4 lt.eq d_y lt.eq 6 M r \) $ <eq:enlarged-field-cap>]

with a universal $C_(upright("cap"))$.

=== 3.3 A fine patch comparison with the price included <a-fine-patch-comparison-with-the-price-included>

Fix a point $y$ in the original band and a height $h_l \/ 2 lt.eq h lt.eq 2 h_h$. Suppose that one of the following events, intersected with $cal(C)_j$, has probability $p gt.eq r^42$:

#[#set math.equation(numbering: n => "(3.13)")
 $ d_y^6 mu_j \( y \) > k h^(3 \/ 2) \, & d_y^4 H'_j \( y \) < h - xi \/ 4 \,\
d_y^6 mu_j \( y \) < k h^(3 \/ 2) \, & d_y^4 H'_j \( y \) > h + xi \/ 4 . $ <eq:fixed-point-failures>]

Write $Q$ for the original joint law conditioned on the event. When spatial cuts are introduced, enlarge this law by fresh labels with their ordinary conditional probabilities given the raw positions. Its raw marginal is the state from 8. Set

$ delta' = C r^(- 2.02) log^5 \( e \/ r^42 \) \, #h(2em) delta = D_0 + delta' . $

Then the raw state has unshifted offset at most $delta$, shifted offset at most $delta'$, and

#[#set math.equation(numbering: n => "(3.14)")
 $ m_y lt.eq C_M a^(- 3) \, #h(2em) delta' = o \( a^(- 6.98) \) . $ <eq:patch-offsets>]

The constants below may depend on the fixed band parameters.

Put $beta = a^0.2$ and $b = beta a$, with $s$ small enough that $beta < 1 \/ 100$. For each fixed band parameter $M$, the scales satisfy

$ b lt.double ell_j lt.double t lt.double a . $

Here each ratio of consecutive scales tends to zero uniformly in $j$, also when $r \/ s arrow.r 0$, by (3.7). The fine width $b$ makes the semiclassical errors small; the broader master width $t$ absorbs both this smearing and the observation displacement $ell_j$, while $t \/ a arrow.r 0$ permits a local field comparison. The patch construction below has three outputs. Its energy comparison controls the Coulomb discrepancy and a negative-field penalty. The former, together with noisy-array matching, recovers the conditional density; the latter permits the high-density implication to pass to expectation. Finally, the two conditional-expectation identities recover the mean potential. We establish these transfers in that order.

Choose a square cut, using the sine and cosine of a smooth angle, that is full out on $B \( y \, t_0 \)$, supported out in $B \( y \, t_0 + b \)$, and has gradients bounded by $C \/ b$, where $5 a lt.eq t_0 lt.eq 6 a$ is selected below. Retain the out particles satisfying $\| x_i - y \| < t_0 - 7 b$, and call the other out particles deleted. Let $n_o$ denote the total number of out particles and $n_(upright("del"))$ the number of deleted particles; thus the retained count is $n_o - n_(upright("del"))$. Then $t_0$ may be chosen so that

#[#set math.equation(numbering: n => "(3.15)")
 $ bb(E)_Q n_o^2 lt.eq C_M a^(- 6) \, #h(2em) bb(E)_Q n_(upright("del"))^2 lt.eq C_M beta a^(- 6) . $ <eq:patch-counts>]

For every candidate $t_0$, the total out count is bounded by the raw count in $B \( y \, 7 a \)$, which lies in a fixed annulus about the nucleus with radius comparable to $a$. The annular count estimate (2.6), with (3.14), bounds the expected square of this encompassing count by $C_M a^(- 6)$, uniformly in $t_0$. The deleted particles lie in the raw strip $t_0 - 7 b lt.eq \| x_i - y \| lt.eq t_0 + b$. Integrating its squared count over $t_0 in \[ 5 a \, 6 a \]$, each ordered pair contributes for a set of lengths at most $8 b$. Averaging selects $t_0$ for the second bound in (3.15), while preserving the first bound.

===== 3.3.1 The fresh conditional core. <the-fresh-conditional-core.>

In the cut marginal of the tilted state, let $X$ record the out labels, positions, and spins. Slice only on these fresh cut data, not additionally on the noisy arrays. Denote the normalized core slice’s density by $rho_X^c$ and its energy, including the price per core electron, by $e_X^lambda$. Then

$ e_X^lambda gt.eq P \( lambda \) \, #h(2em) Phi = V - lambda - K * rho_X^c . $

The localization products preserve antisymmetry within each group, and the normalized core slices are in their sector form domains for almost every datum #cite(label("Foundation")) Lemma 3.4.

There is a nonnegative random variable $F = F \( X \)$ such that

#[#set math.equation(numbering: n => "(3.16)")
 $ Phi lt.eq F upright(" on ") B \( y \, 7 a \) \, #h(2em) ∥F∥_(L^2 \( Q \)) lt.eq C_M a^(- 4) . $ <eq:patch-field-envelope>]

For this, condition the unshifted field obtained by subtracting only electrons outside $B \( y \, 20 a \)$; all those electrons belong to the core. This field is harmonic on $B \( y \, 10 a \)$ and bounds $Phi$ above there. At $z in B \( y \, 10 a \)$, the inclusion $B \( y \, 20 a \) subset B \( z \, A a_z \)$ bounds it above by $bb(E)_Q \[ J_z divides X \]$. The cut satisfies 4 uniformly: a bounded number of comparable cells covers its out support, its gradient coefficients obey $D_z^2 lt.eq C beta^(- 2)$, and $a_z m_z gt.eq c a^(- 2)$, so that $D_z^2 \/ \( a_z m_z \) lt.eq C a^1.6 lt.eq C$. That lemma bounds the positive part in $L^2 \( Q \)$ at each target $z$. Submeans on balls of radius $a$, followed by Minkowski’s integral inequality, give the positive supremum bound in (3.16).

===== 3.3.2 The patch minimizer. <the-patch-minimizer.>

On $Omega = B \( y \, t_0 - 4 b \)$ minimize

$ cal(E)_Phi \( f \) = T integral f^(5 \/ 3) - integral Phi f + D \( f \) \, #h(2em) f gt.eq 0 \, quad "supp" f subset overline(Omega) . $

The field $Phi$ is bounded and harmonic on a neighborhood of $overline(Omega)$: the core is excluded from $B \( y \, t_0 \)$, and the nucleus is far outside this patch. Coercivity in $L^(5 \/ 3) \( Omega \)$, weak lower semicontinuity, and strict convexity give a unique minimizer $rho = rho_X$. Its Euler equation is

#[#set math.equation(numbering: n => "(3.17)")
 $ W = Phi - K * rho \, #h(2em) rho = k W_(+)^(3 \/ 2) upright(" on ") Omega . $ <eq:patch-euler>]

Nonnegative variations give the one-sided condition where $rho = 0$; variations of either sign on positive density give the equality. Comparison with zero and $D \( rho \) gt.eq \( integral rho \)^2 \/ \( 24 a \)$ show that

#[#set math.equation(numbering: n => "(3.18)")
 $ integral rho lt.eq C a F . $ <eq:patch-mass-bound>]

These minimizers can be chosen measurably in $X$. One way to see this is to note their continuous dependence in $L^(5 \/ 3)$ on a field in $L^(5 \/ 2) \( Omega \)$: coercivity bounds a converging sequence of minimizers; weak limits minimize the limiting functional by lower semicontinuity and comparison with its minimizer; uniqueness identifies the limit, and convergence of the minimum values forces convergence of the $L^(5 \/ 3)$ norms. Uniform convexity gives strong convergence. The Coulomb form is a continuous positive quadratic form on $L^(5 \/ 3) \( Omega \)$, as used in this argument.

Let $theta.alt_b$ be the radial probability kernel from #cite(label("Foundation")) Lemma 3.6, obtained by averaging a cube kernel over translations and rotations. It is bounded by $b^(- 3)$ and supported in $B \( 0 \, sqrt(3) b \)$. Define

$ sigma = sum_(i med upright("retained")) theta.alt_b \( thin dot.op - x_i \) . $

Every such smear lies in $Omega$ by the $7 b$ retention margin. We claim

#[#set math.equation(numbering: n => "(3.19)")
 $ bb(E)_Q [D \( sigma - rho \) + integral W_(-) sigma] lt.eq C_M a^(- 7 + .02) \, #h(2em) integral_(B \( y \, 4 a \)) rho_(upright("tilt"))^(5 \/ 3) lt.eq C_M a^(- 7) \, $ <eq:patch-comparison>]

where $rho_(upright("tilt"))$ is the ordinary one-particle density of the tilted state. In particular, it is not the conditional patch density $rho$.

===== 3.3.3 Lower and upper energy comparisons. <lower-and-upper-energy-comparisons.>

Write $\( o \, c \)$ for the fresh square cut and, for each out-label set $I subset { 1 \, dots.h \, n }$, set

$ Psi_I = product_(i in I) o \( x_i \) product_(i in.not I) c \( x_i \) Psi_(A') \, #h(2em) T_o = 1 / 2 sum_(I subset { 1 \, dots.h \, n }) sum_(i in I) ∥nabla_i Psi_I∥_2^2 . $

Thus $T_o$ is the total out kinetic energy in the localized state. Adding price to the exact localization identity of #cite(label("Foundation")) Lemma 3.4 gives

#[#set math.equation(numbering: n => "(3.20)")
 $ chevron.l Psi_(A') \, H_(Z \, n) Psi_(A') chevron.r + lambda n + "err"_(upright("loc")) = bb(E)_Q e_X^lambda + T_o - bb(E)_Q sum_(i med upright("out")) Phi \( x_i \) + bb(E)_Q sum_(i < l med upright("out")) K \( x_i - x_l \) \, $ <eq:priced-localization-identity>]

with $0 lt.eq "err"_(upright("loc")) lt.eq C_M b^(- 2) a^(- 3)$. The price has been included in the core energy and in $Phi$; there is no localization error associated with it. #cite(label("Foundation")) Lemma 3.6 allows any measurably selected retained subset and gives

#[#set math.equation(numbering: n => "(3.21)")
 $ T_o & gt.eq bb(E)_Q [T integral sigma^(5 \/ 3) - C b^(- 2) \( n_o^(4 \/ 3) + n_o \)] \,\
sum_(i < l med upright("out")) K \( x_i - x_l \) & gt.eq D \( sigma \) - C n_o \/ b . $ <eq:patch-lower-comparison>]

The leading kinetic coefficient here is exactly $T$, for two spin states and kinetic energy $- Delta \/ 2$.

For almost every fixed slice, the corresponding priced upper comparison is

#[#set math.equation(numbering: n => "(3.22)")
 $ P \( lambda \) lt.eq e_X^lambda + T integral rho^(5 \/ 3) + C b^(- 2) integral rho - integral Phi rho + D \( rho \) . $ <eq:patch-upper-comparison>]

The coherent-packet construction is standard; see #cite(label("Solovej2003")) Lemma 8.2. We spell out why the insertion proof of #cite(label("Foundation")) Lemma 3.5 also proves this priced version. Integrate the rank-one matrices of the orbitals $g_b \( x - z \) e^(i p dot.op x)$, for both spins, over $\| p \| lt.eq \( 3 pi^2 rho \( z \) \)^(1 \/ 3)$ with measure $d z thin d p \/ \( 2 pi \)^3$. The resulting one-body matrix $gamma$ satisfies

$ 0 lt.eq gamma lt.eq 1 \, #h(2em) "Tr" gamma = integral rho \, #h(2em) rho_gamma = g_b^2 * rho \, $

by Plancherel and momentum-ball integration. Its kinetic trace is

$ "Tr" \( - Delta \/ 2 \) gamma = T integral rho^(5 \/ 3) + C b^(- 2) integral rho . $

First truncate its spectral decomposition to finitely many eigenvectors. Occupy these independently with probabilities given by the eigenvalues. Every realization is a finite Slater determinant, with an integer number of electrons, and its mean repulsion is at most the direct energy of the truncated density by the direct-minus-exchange identity. Its support is in the packet region, which lies strictly inside $B \( y \, t_0 \)$ and is separated from the core and nucleus. It may therefore be wedged with the core. Every resulting state has shifted energy at least $P \( lambda \)$, and the mean price paid by the inserted electrons is $lambda "Tr" gamma$.

Positive spectral truncations have increasing densities and convergent traces. The potentials are bounded on the packet region for each fixed slice, so all one-body terms converge; direct energies converge by monotone convergence. Radial smearing does not increase $D$, and harmonic means replace $integral Phi \( g_b^2 * rho \)$ by $integral Phi rho$, including the constant price term. Averaging the integer-sector trials and passing to the limit proves (3.22). This reasoning requires neither an integer value of $integral rho$ nor a measurable choice of a trial determinant as the slice varies.

For retained particles, harmonic means likewise give $sum_(i med upright("retained")) Phi \( x_i \) = integral Phi sigma$. The deleted attractions cost at most $F n_(upright("del"))$. Subtract (3.22) in (3.20), use (3.5), (3.21), and expand the functional about its minimizer. Convexity of the kinetic term leaves $D \( sigma - rho \)$ and the linear term

$ integral (frac(5 T, 3) rho^(2 \/ 3) - W) \( sigma - rho \) = integral W_(-) sigma . $

The equality uses (3.17): where $rho > 0$ the coefficient vanishes, and where $rho = 0$ it equals $W_(-)$. By (3.15), (3.16), (3.18), the resulting bound is

#[#set math.equation(numbering: n => "(3.23)")
 $ bb(E)_Q [D \( sigma - rho \) + integral W_(-) sigma] lt.eq delta' + C_M (sqrt(beta) thin a^(- 7) + b^(- 1) a^(- 3) + b^(- 2) \( a^(- 4) + a^(- 3) \)) . $ <eq:patch-error-budget>]

All terms are integrable: for example, $integral rho lt.eq C a F$ and $cal(E)_Phi \( rho \) lt.eq 0$ bound both its kinetic and direct terms by $C a F^2$ in expectation. The exact cut identity also has integrable absolute Coulomb terms by form-domain admissibility.

Since $b = a^1.2$, the errors in (3.23), divided by $a^(- 7)$, are bounded by

$ C_M (a^4.98 log^5 \( e \/ a \) + a^.1 + a^2.8 + a^.6 + a^1.6) . $

This proves the first part of (3.19). For the second, use $e_X^lambda gt.eq P \( lambda \)$ directly in (3.20). Dropping the nonnegative out repulsion and using $bb(E)_Q F n_o lt.eq C_M a^(- 7)$ gives $T_o lt.eq C_M a^(- 7)$. The coarse kinetic-density inequality of #cite(label("Foundation")) Lemma 3.4, on the full-out ball containing $B \( y \, 4 a \)$, proves the remaining assertion.

=== 3.4 Recovering the conditional density from the patch <recovering-the-conditional-density-from-the-patch>

By (3.17), the patch field satisfies $Delta W = 4 pi k W_(+)^(3 \/ 2)$ on $B \( y \, 4 a \)$. We will use the bounds

#[#set math.equation(numbering: n => "(3.24)")
 $ W lt.eq C a^(- 4) upright(" on ") B \( y \, 3 a \) \, #h(2em) sup_(B \( y \, 2 t \)) \| W - W \( y \) \| lt.eq C tau #scale(x: 120%, y: 120%)[\(] a^(- 4) + W \( y \)_(-) #scale(x: 120%, y: 120%)[\)] . $ <eq:patch-field-oscillation>]

For the first, compare on the ball of radius $R = 4 a$ with

$ U \( x \) = frac(C R^4, \( R^2 - \| x - y \|^2 \)^4) . $

For large universal $C$, $Delta U lt.eq 4 pi k U^(3 \/ 2)$; it diverges at the boundary. Testing with the positive part of $W - U$ proves the bound. For the second, the Coulomb potential of $rho upright(bold(1))_(B \( y \, 2 a \))$ is $O \( a^(- 4) \)$ with gradient $O \( a^(- 5) \)$ on that ball, by the first bound and direct integration of the Coulomb kernel. Adding this potential to $W$ leaves a harmonic function bounded above by $C a^(- 4)$. Apply the interior gradient estimate to its nonnegative harmonic distance from this upper bound. Its center value is at most $C a^(- 4) + W \( y \)_(-)$, which proves the oscillation estimate. These comparisons are classical or weak positive-part tests: compact $L^(5 \/ 3)$ densities have continuous potentials, so $W$ is continuous.

Define the local averaging operator

$ cal(R) f \( y \) = integral cal(K)_z \( y \) f \( z \) thin d z . $

On every compatible path under $Q$, including its fresh cut labels,

#[#set math.equation(numbering: n => "(3.25)")
 $ \| cal(R) sigma \( y \) - mu_j \( y \) \| lt.eq C_M r^(- 3) \( ell_j + b \) t^(- 4) = o \( a^(- 6) \) . $ <eq:noisy-array-sandwich>]

Here is the reason this comparison uses the original observation posterior correctly. Match any compatible raw configuration to the $j$th observed multiset. Each matched displacement is at most $sqrt(3) ell_j$, so the raw kernel sum is within $C_M r^(- 3) ell_j t^(- 4)$ of the sum evaluated at that multiset. The same is true of its posterior average $mu_j$ at these data. Only $C_M r^(- 3)$ entries can contribute, by $cal(C)_j$. All relevant raw centers lie in the fully retained region of the fresh cut, since $t \/ a arrow.r 0$, $b \/ a arrow.r 0$, and $ell_j \/ a arrow.r 0$. Replacing each such center by its fine smear changes the sum by at most $C_M r^(- 3) b t^(- 4)$. This proves (3.25) without identifying the two posterior laws. The ratios of these errors to $a^(- 6)$ are bounded by

$ C_M #scale(x: 120%, y: 120%)[\(] a^(.01 - 4 w) + a^(.2 - 4 w) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $

Let

$ G = { D \( sigma - rho \) lt.eq a^(- 7 + .01) } . $

By (3.19), $Q \( G^c \) lt.eq C_M a^.01$. The function $z mapsto cal(K)_z \( y \)$ is a compactly supported Lipschitz test with gradient norm at most $C t^(- 5 \/ 2)$. Coulomb duality #cite(label("Foundation")) Lemma 3.1 therefore gives, on $G$,

#[#set math.equation(numbering: n => "(3.26)")
 $ \| cal(R) rho \( y \) - cal(R) sigma \( y \) \| lt.eq C a^(- 7 \/ 2 + .005) t^(- 5 \/ 2) = o \( a^(- 6) \) . $ <eq:local-coulomb-duality>]

Indeed the relative gain is at least $a^(.005 - \( 5 \/ 2 \) w)$. All the small errors here are uniform for fixed parameters along (2.1), including scales with arbitrarily small $r \/ s$.

On $G$, the high-density antecedent in (3.13) forces

#[#set math.equation(numbering: n => "(3.27)")
 $ W \( y \) gt.eq \( h - xi \/ 16 \) d_y^(- 4) . $ <eq:high-patch-field>]

Otherwise (3.24) would imply $W \( z \) lt.eq \( h - xi \/ 32 \) d_y^(- 4)$ on the support of the averaging kernel. This remains true for arbitrarily negative $W \( y \)$: its upper estimate contains the nonpositive term $- \( 1 - C tau \) W \( y \)_(-)$. The Euler relation, (3.8), and (3.25), (3.26) would then contradict the high-density antecedent. In the same way the low-density antecedent forces, on $G$,

#[#set math.equation(numbering: n => "(3.28)")
 $ W \( y \) lt.eq \( h + xi \/ 16 \) d_y^(- 4) . $ <eq:low-patch-field>]

The upper bound in (3.24) lets (3.28) pass to expectation with an $o \( a^(- 4) \)$ error.

The high case needs a bound on the negative field on $G^c$. The high antecedent and (3.25) hold on all paths under $Q$, and give

$ integral_(B \( y \, 2 t \)) sigma gt.eq c a^(- 6) t^3 . $

Using (3.24) on this ball and absorbing $C tau W \( y \)_(-)$ yields

#[#set math.equation(numbering: n => "(3.29)")
 $ W \( y \)_(-) lt.eq C \( a^(- 6) t^3 \)^(- 1) integral W_(-) sigma + C tau a^(- 4) . $ <eq:negative-patch-control>]

Consequently (3.19) implies

$ bb(E)_Q \[ upright(bold(1))_(G^c) W \( y \)_(-) \] = o \( a^(- 4) \) \, $

since the ratio of its bound to $a^(- 4)$ is at most $C_M a^.02 tau^(- 3) + C tau lt.eq C_M a^(.02 - 3 w) + C s^w = o \( 1 \)$. Thus (3.27) also passes to expectation with an $o \( a^(- 4) \)$ error. This step explicitly controls the negative part; no lower cap on the conditional field is assumed.

=== 3.5 Matching the potentials of the two conditional laws <matching-the-potentials-of-the-two-conditional-laws>

We adapt the averaged field transfer of #cite(label("Foundation")) Lemma 5.3 to the present priced fields. The preceding patch estimates supply its required small errors; we give the two-law decomposition and estimates explicitly. We prove

#[#set math.equation(numbering: n => "(3.30)")
 $ lr(|bb(E)_Q #scale(x: 120%, y: 120%)[\(] H'_j - W #scale(x: 120%, y: 120%)[\)] \( y \)|) = o \( a^(- 4) \) . $ <eq:potential-matching>]

Write $P^(upright("raw"))$ and $P^(upright("ms"))$ for the raw and master-smeared electron potentials at $y$, and $P^(upright("ret")) \, P^(upright("del"))$ for the raw potentials of retained and deleted out particles. Because the event defining $Q$ is in $cal(F)_j$, the original observation tower gives $bb(E)_Q \( K * mu_j \) \( y \) = bb(E)_Q P^(upright("ms"))$. The core in $W$ instead uses the fresh-cut tower in the tilted raw law. Combining these two identities, and cancelling both nucleus and price, expresses $bb(E)_Q \( H'_j - W \) \( y \)$ as the expectation of

#[#set math.equation(numbering: n => "(3.31)")
 $ \( P^(upright("raw")) - P^(upright("ms")) \) - P^(upright("del")) - \( P^(upright("ret")) - K * sigma \) \( y \) + K * \( rho - sigma \) \( y \) . $ <eq:two-posterior-potential-identity>]

By Hölder’s inequality and the ordinary density bound in (3.19), for $0 < u lt.eq 4 a$ the expected raw potential from $B \( y \, u \)$ is at most

#[#set math.equation(numbering: n => "(3.32)")
 $ integral_(B \( y \, u \)) frac(rho_(upright("tilt")) \( z \), \| z - y \|) thin d z lt.eq C_M a^(- 4) \( u \/ a \)^(1 \/ 5) . $ <eq:raw-short-range-potential>]

Radial smearing never increases the potential of a point charge and leaves it unchanged outside the smear radius. The master-smearing difference in (3.31) can therefore come only from centers within $2 t$ of $y$; the fine-smearing difference can come only from centers within $sqrt(3) b$. (3.32) bounds both by $o \( a^(- 4) \)$. Deleted centers have distance comparable to $a$, so (3.15) gives $bb(E)_Q P^(upright("del")) lt.eq C_M a^(- 4) sqrt(beta)$.

For the remaining signed potential, truncate the kernel at height $t^(- 1)$. The test $z mapsto min \( \| z - y \|^(- 1) \, t^(- 1) \)$ has homogeneous Sobolev gradient norm $O \( t^(- 1 \/ 2) \)$. Coulomb duality, or its compactly supported approximation, and (3.19) give expected absolute truncated error at most

$ C_M t^(- 1 \/ 2) a^(- 7 \/ 2 + .01) = o \( a^(- 4) \) \; $

the relative gain is $a^.01 tau^(- 1 \/ 2) lt.eq C_M a^(.01 - w \/ 2)$. The truncation loss for $rho$ is at most $C a^(- 6) t^2$ by (3.24). For $sigma$, radial smearing and (3.32) bound it by

$ C_M a^(- 4) #scale(x: 120%, y: 120%)[\(] \( t + sqrt(3) b \) \/ a #scale(x: 120%, y: 120%)[\)]^(1 \/ 5) . $

These also vanish relative to $a^(- 4)$ by (3.7). This proves (3.30).

In the high case, (3.27), (3.29) give $bb(E)_Q W \( y \) gt.eq \( h - xi \/ 16 \) d_y^(- 4) - o \( a^(- 4) \)$, whereas the failed comparison in (3.13) gives $bb(E)_Q H'_j \( y \) lt.eq \( h - xi \/ 4 \) d_y^(- 4)$. (3.30) contradicts these inequalities eventually. The low case follows in the same way from (3.28) and the upper bound on $W$. We conclude that each fixed-point failure in (3.13), intersected with $cal(C)_j$, has probability less than $r^42$.

=== 3.6 Spatial and height nets <spatial-and-height-nets>

Take a spatial net of mesh at most $r^2$ in the original band, with $O_M \( r^(- 3) \)$ points, and a fixed finite height net in $\[ h_l \/ 2 \, 2 h_h \]$ of mesh at most $xi \/ 64$. Exclude the fixed-point failures at all net pairs, the complement of $cal(C)_j$, and the enlarged-cap failure. Their total probability is $O_M \( r^39 \) + O_M \( r^40 \)$, in particular at most $C r^25$. All these events are $cal(F)_j$-measurable.

The normalized density $d_y^6 mu_j \( y \)$ changes by at most $C_M r^(1 - 4 w) = o \( 1 \)$ between a point and its nearest net point, by (3.9). For the field, work on balls of radius a small fixed multiple of $r$ within the enlarged cap band. Adding the Coulomb potential of the local source $mu_j$ makes $H'_j$ harmonic there and bounds that harmonic function above by $C_M r^(- 4 - 3 w)$, using (3.9), (3.12). The positive-harmonic gradient argument used in (3.24) shows that $v \( y \) = d_y^4 H'_j \( y \)$ varies over a displacement $O \( r^2 \)$ by at most

#[#set math.equation(numbering: n => "(3.33)")
 $ C_M r^(1 - 3 w) + C_M r thin v \( y \)_(-) . $ <eq:net-field-variation>]

Suppose a high-density failure with tolerance $xi$ occurs at $\( y \, h \)$. If $v \( y \) gt.eq 0$, (3.33) puts the nearby net value below $h - 3 xi \/ 4$ for small $s$. If $v \( y \) < 0$, the same upper estimate is bounded by $\( 1 - C_M r \) v \( y \) + C_M r^(1 - 3 w)$, and gives the identical conclusion since $h gt.eq h_l > 16 xi$. Choose a height-net value between $h - xi \/ 4$ and $h - xi \/ 8$. The small normalized-density variation preserves the strict high antecedent at this lower height, while the field value violates its comparison with tolerance $xi \/ 4$. This is an excluded net failure.

A low-density failure has $v \( y \) > h + xi > 0$. Its nearest net value is above $h + 3 xi \/ 4$ by (3.33). A height-net value between $h + xi \/ 8$ and $h + xi \/ 4$ preserves the low antecedent and again yields an excluded failure with tolerance $xi \/ 4$. Thus both comparisons hold everywhere on the band for every $h_l lt.eq h lt.eq h_h$. Together with (3.12), this proves 9.

== 4 Continuing a lower barrier <sec:barriers>

The local density–field comparison in 9 does not by itself exclude a limiting field which is too small near the nucleus. We now carry a positive barrier from the nuclear scale to an arbitrary intermediate scale. The construction keeps the actual conditional density inside the current radius and uses the Thomas–Fermi reaction outside it. Rare failures of the local comparison are retained as an explicit, small source error. This adapts the intermediate-subsolution construction of #cite(label("Foundation")) Proposition 11.2, using the positive-price comparison proved here to allow the growing offset $D_0 = O \( s^(- 7) \)$.

Write $d = \| y \|$ and put

#[#set math.equation(numbering: n => "(4.1)")
 $ f \( t \) = 4 pi k \( t_(+) \)^(3 \/ 2) \, #h(2em) b_r \( y \) = B d^(- 4) (1 - frac(r, 8 d)) quad \( d gt.eq r \) \, $ <eq:barrier-function>]

where $B > 0$ will be fixed below. Direct differentiation gives

$ Delta b_r = B d^(- 6) (12 - frac(20 r, 8 d)) gt.eq 19 / 2 B d^(- 6) . $

Thus $Delta b_r gt.eq f \( b_r \)$ whenever $4 pi k sqrt(B) lt.eq 19 \/ 2$. If $R = 2 r$, then

#[#set math.equation(numbering: n => "(4.2)")
 $ b_r - b_R gt.eq gamma R^(- 4) quad \( R lt.eq d lt.eq 1.1 R \) \, #h(2em) gamma = frac(B, 16 \( 1.1 \)^5) > 0 . $ <eq:barrier-gap>]

#thm([Proposition 4.1.])[
  (Conditional barrier invariant).  #emph[There are fixed positive constants $epsilon \, B \, C_(upright("inv"))$ and $M > 2$ with the following property. For every sufficiently far system in (2.1), use the observations and kernels of (3.1), (3.2) with this $epsilon$. For every $0 lt.eq j lt.eq J_(*)$ there exist $cal(F)_j$-measurable functions $u_j \, p_j$ such that, with $r = r_j$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ Delta u_j & gt.eq - 4 pi nu + 4 pi upright(bold(1))_({ d < r }) mu_j - 4 pi p_j + upright(bold(1))_({ d gt.eq r }) f \( u_j \) \,\
b_r lt.eq u_j & lt.eq C_(upright("inv")) d^(- 4) quad \( d gt.eq r \) \,\
u_j & = b_r quad \( d > M r \) . $ <eq:barrier-invariant>]

 The first inequality holds in distributions on $bb(R)^3$. For each fixed system, $u_j - V$ is continuous and locally Lipschitz, with deterministic bounds on compact sets; $p_j$ is a nonnegative bounded density supported in ${ d lt.eq r_j }$, also with a deterministic bound. Its expected total mass satisfies 
#[#set math.equation(numbering: n => "(4.4)")
 $ sup_(0 lt.eq j lt.eq J_(*)) bb(E) integral p_j lt.eq C #scale(x: 120%, y: 120%)[\(] r_0^32 + s^(19 \/ 2 - 3 w) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $ <eq:barrier-error-mass>]

 The deterministic fixed-system regularity bounds need not be uniform in $Z$; the constants in (4.4) are uniform.]
] <prop:barrier-invariant>

#proof[
  We use the weak maximum rule in #cite(label("Foundation")) Lemma 5.4. In its nonsingular form, if finitely many continuous locally $H^1$ functions satisfy
  $ Delta v_i gt.eq g \( y \) + F \( y \, v_i \) \, $
  where $g$ is locally bounded and $F$ is measurable in $y$, continuous in its second variable, and locally bounded on bounded ranges, then their maximum satisfies the same inequality with its own value in the reaction. The lemma also allows a common singular term $- 4 pi nu$ when all branches have continuous locally $H^1$ offsets from $V$ and the reaction vanishes near the origin. These are the precise forms used below.
  ===== 4.1 Initialization. <initialization.>
  For sufficiently small fixed $epsilon$, the initial conditional density satisfies, outside an event of probability at most $C r_0^35$,
  #[#set math.equation(numbering: n => "(4.5)")
   $ P_0 \( y \) := K * \( upright(bold(1))_({ d < r_0 }) mu_0 \) \( y \) lt.eq 0.1 thin Z \/ r_0 quad \( r_0 lt.eq \| y \| lt.eq 1.1 r_0 \) . $ <eq:initial-potential>]
  To prove this, fix $y$ in the indicated annulus and consider the $cal(F)_0$-event $A_y = { P_0 \( y \) > 0.05 Z \/ r_0 }$. If its probability is greater than $r_0^40$, 8 realizes its raw conditional marginal as a normalized state in sector $n$ with unshifted offset at most
  $ D_0 + C r_0^(- 2.02) log^5 \( e \/ r_0^40 \) . $
  By (2.8), $D_0 lt.eq C s^(- 7)$. Since $r_0 \/ s arrow.r 0$, the displayed offset is at most $Z^(7 \/ 3)$ eventually, with $epsilon$ fixed. The global density estimate of #cite(label("Foundation")) Lemma 3.3 applies: the state is normalized and antisymmetric and $n lt.eq 3 Z$, so its ordinary density $rho_(A_y)$ obeys $integral rho_(A_y)^(5 \/ 3) lt.eq C Z^(7 \/ 3)$.
  Only packet centers in $\| x \| < 2 r_0$ can contribute to the truncated density defining $P_0$. The potential of a truncated packet is at most that of the full packet, and radial smearing bounds the latter by $K \( y - x \)$. The observation tower and Hölder’s inequality give
  $ bb(E) \[ P_0 \( y \) divides A_y \] lt.eq integral_(\| x \| < 2 r_0) frac(rho_(A_y) \( x \), \| y - x \|) thin d x lt.eq C Z^(7 \/ 5) r_0^(1 \/ 5) = C epsilon^(6 \/ 5) Z \/ r_0 . $
  Choose $epsilon$ so small that the last coefficient is less than $0.05$. This contradicts the event definition. Hence $bb(P) \( A_y \) lt.eq r_0^40$.
  The minimum packet width is $c_1 r_0^(1 + w)$. Integrating $\| y - z \|^(- 2)$ against each bounded packet yields
  $ ∥nabla P_0∥_oo lt.eq C Z r_0^(- 2 - 2 w) . $
  A spatial net of spacing at most $r_0^2$ in the annulus has $O \( r_0^(- 3) \)$ points. Its union failure probability is $O \( r_0^37 \)$, and its interpolation error divided by $Z \/ r_0$ is $O \( r_0^(1 - 2 w) \)$. This proves (4.5), with the weaker exponent stated there. The good event is measurable because $P_0$ is continuous in space.
  Let $G_0$ be this good event and define
  $ mu^(upright("in")) = upright(bold(1))_(G_0) upright(bold(1))_({ d < r_0 }) mu_0 \, #h(2em) p_0 = upright(bold(1))_(G_0^c) upright(bold(1))_({ d < r_0 }) mu_0 . $
  On $d < 2 r_0$ consider the branch
  $ v = V - K * mu^(upright("in")) - 0.7 Z \/ r_0 + C_3 \( Z \/ r_0 \)^(3 \/ 2) d^2 . $
  Fix $C_3$ so that $6 C_3 gt.eq 4 pi k thin 2^(3 \/ 2)$ and decrease $epsilon$ if necessary so that $4 C_3 epsilon^(3 \/ 2) lt.eq 0.05$. Since $Z r_0^3 = epsilon^3$, the quadratic term is at most $0.05 Z \/ r_0$ on this ball. On $r_0 lt.eq d < 2 r_0$ we have $v lt.eq 2 Z \/ r_0$, and therefore
  $ Delta v = - 4 pi nu + 4 pi mu^(upright("in")) + 6 C_3 \( Z \/ r_0 \)^(3 \/ 2) \, #h(2em) 6 C_3 \( Z \/ r_0 \)^(3 \/ 2) gt.eq f \( v \) . $
  On the lower overlap $r_0 lt.eq d < 1.06 r_0$,
  $ v gt.eq \( 1 \/ 1.06 - 0.1 - 0.7 \) Z \/ r_0 > 0.14 Z \/ r_0 \; $
  on $G_0^c$ the same bound follows with the $0.1$ term omitted. On $1.9 r_0 < d < 2 r_0$,
  $ v lt.eq \( 1 \/ 1.9 - 0.7 + 0.05 \) Z \/ r_0 < 0 . $
  Fix $B$ satisfying the subsolution condition above and $0 < B lt.eq 0.1 epsilon^3$. Define $u_0$ on an open cover by
  $ u_0 = cases(delim: "{", v \, & d < 1.06 r_0 \,, max \( v \, b_(r_0) \) \, & r_0 < d < 2 r_0 \,, b_(r_0) \, & d > 1.9 r_0 .) $
  The definitions agree on overlaps. Near $d = r_0$ the branch $v$ alone is active and supplies both required source inequalities. Elsewhere the weak maximum rule proves (4.3). The exterior cap holds for $C_(upright("inv")) gt.eq max \( B \, 32 epsilon^3 \)$, and
  $ bb(E) integral p_0 lt.eq n bb(P) \( G_0^c \) lt.eq C r_0^32 . $
  ===== 4.2 Choice of the remaining constants. <choice-of-the-remaining-constants.>
  Increase $C_(upright("inv"))$ to exceed the universal cap $C_(upright("cap"))$ in 9. Choose
  $ 0 < lambda_2 < lambda_1 < gamma \/ 2 \, #h(2em) M > 2 \, #h(2em) C_(upright("inv")) M^(- 4) < lambda_2 . $
  The constants $lambda_1 \, lambda_2$ are barrier shifts, distinct from the electron price $lambda = s^(- 4)$. Fix $0 < h_l < B \/ 4$ and $h_h > C_(upright("inv"))$, and then choose $e_0 \, xi > 0$ so small that
  #[#set math.equation(numbering: n => "(4.6)")
   $ 2 e_0 \( 2 M \)^4 < B \/ 4 \, #h(2em) 16 xi + 2 e_0 < lambda_1 - lambda_2 \,\
xi < min \( lambda_2 \, h_l \/ 16 \) . $ <eq:barrier-parameters>]
  All these constants are now fixed. The simultaneous comparison 9 applies with exactly these parameters along the regime under consideration.
  ===== 4.3 One outward step. <one-outward-step.>
  Suppose the invariant holds at $r = r_j$, where $j < J_(*)$, and set $R = 2 r$ and $u = u_j$. On the good event of 9 for the band $r lt.eq d lt.eq 4 M r$, use
  $ v_1 = u - lambda_1 R^(- 4) \, #h(2em) v_2 = H'_j - lambda_2 R^(- 4) . $
  The two branches have complementary roles. On the gained annulus $r lt.eq d < R$, the old reaction must supply the actual density, so a retained $v_1$ must satisfy $f \( u \) gt.eq 4 pi mu_j$. Outside $R$, the field branch already has Laplacian $4 pi mu_j$, which must instead dominate $f \( v_2 \)$. The opposite inverse implications in (3.6), together with the unequal shifts, give these two inequalities on the neighborhoods used below. On bad data omit $v_2$. Define $tilde(u)$ by
  #[#set math.equation(numbering: n => "(4.7)")
   $ upright("region") & tilde(u)\
d < 1.08 R & max \( v_1 \, v_2 \)\
1.04 R < d < 2 M R & max \( v_1 \, v_2 \, b_R \)\
d > M R & b_R $ <eq:barrier-open-cover>]
  with the same omission on bad data, and set
  #[#set math.equation(numbering: n => "(4.8)")
   $ tilde(p) = p_j + upright(bold(1))_({ upright("bad") }) upright(bold(1))_({ r lt.eq d < R }) mu_j . $ <eq:barrier-added-error>]
  1 shows the overlapping regions in (4.7) and the source-gain annulus $r lt.eq d < R$. On the lower overlap, (4.2) gives $v_1 gt.eq b_r - lambda_1 R^(- 4) > b_R$. On the upper overlap, the caps and $C_(upright("inv")) M^(- 4) < lambda_2$ put both shifted branches below $b_R$. Thus the definitions agree. They give $b_R lt.eq tilde(u) lt.eq C_(upright("inv")) d^(- 4)$ on $d gt.eq R$ and $tilde(u) = b_R$ on $d > M R$; for $R lt.eq d < 1.08 R$ the lower bound already follows from $v_1$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((1.6, 0.65), (3.4, -4.65), fill: rgb("#fff0e0"), stroke: none)
  line((1.6, 0.78), (1.6, 0.96), (3.4, 0.96), (3.4, 0.78), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, cap: "round", join: "round"))
  content((2.5, 0.99), [#text(fill: rgb("#994d00"))[#text(size: 9pt)[$r lt.eq d<R$: source gain]]], anchor: "south", padding: 0.1176cm)
  line((1.6, -0.12), (1.6, -4.65), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((1.6, -0.07), (1.6, 0.07), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((3.4, -0.12), (3.4, -4.65), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((3.4, -0.07), (3.4, 0.07), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((4.9, -0.12), (4.9, -4.65), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((4.9, -0.07), (4.9, 0.07), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((6.4, -0.12), (6.4, -4.65), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((6.4, -0.07), (6.4, 0.07), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((9.3, -0.12), (9.3, -4.65), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((9.3, -0.07), (9.3, 0.07), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((11.8, -0.12), (11.8, -4.65), stroke: (paint: rgb("#c0c0c0"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((11.8, -0.07), (11.8, 0.07), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((0, 0), (12.9, 0), stroke: (thickness: 0.4pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -0.07), (0, 0.07), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((0, 0.1), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  content((1.6, 0.1), [#text(size: 9pt)[$r$]], anchor: "south", padding: 0.1176cm)
  content((3.4, 0.1), [#text(size: 9pt)[$R=2r$]], anchor: "south", padding: 0.1176cm)
  content((4.9, 0.1), [#text(size: 9pt)[$1.04R$]], anchor: "south", padding: 0.1176cm)
  content((6.4, 0.1), [#text(size: 9pt)[$1.08R$]], anchor: "south", padding: 0.1176cm)
  content((9.3, 0.1), [#text(size: 9pt)[$"MR"$]], anchor: "south", padding: 0.1176cm)
  content((11.8, 0.1), [#text(size: 9pt)[$2"MR"$]], anchor: "south", padding: 0.1176cm)
  content((12.9, -0.15), [#text(size: 9pt)[$d=|y|$]], anchor: "north-east", padding: 0.1176cm)
  rect((0, -0.9), (6.4, -1.8), fill: rgb("#ededff"), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"))
  content((3.2, -1.35), [#text(size: 9pt)[$max (v_1,v_2)$#linebreak()$d<1.08R$]])
  rect((4.9, -2.2), (11.8, -3.1), fill: rgb("#ededff"), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"))
  content((8.35, -2.65), [#text(size: 9pt)[$max (v_1,v_2,b_R)$#linebreak()$1.04R<d<2"MR"$]])
  rect((9.3, -3.5), (12.9, -4.4), fill: rgb("#edf6ed"), stroke: none)
  line((12.65, -3.5), (9.3, -3.5), (9.3, -4.4), (12.65, -4.4), stroke: (paint: rgb("#002d00"), thickness: 0.8pt, cap: "round", join: "round"))
  line((12.4, -3.95), (12.9, -3.95), stroke: (paint: rgb("#002d00"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#002d00"))))
  content((10.9, -3.95), [#text(size: 9pt)[$b_R$#linebreak()$d>"MR"$]])
  content((6.45, -4.85), [#text(fill: rgb("#4d4d4d"))[#text(size: 9pt)[Schematic radial regions, not to scale.#linebreak()The fields need not be radial.]]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: The overlapping definitions in one continuation step from $r$ to $R = 2 r$. The shifted branches are $v_1 = u_j - lambda_1 R^(- 4)$ and $v_2 = H'_j - lambda_2 R^(- 4)$; the second branch is omitted on bad data. The source term changes on the shaded annulus $r lt.eq d < R$. The barrier gap makes the first two definitions agree on $1.04 R < d < 1.08 R$, and the caps make the last two agree on $M R < d < 2 M R$. ],
  ) <fig:barrier-step>
  It remains to prove the weak inequality before averaging. We do so on open neighborhoods, to avoid differentiating across the sets where the maximizing branch changes. At a point in one of the open regions in (4.7), retain the candidates whose value is within $e_0 R^(- 4)$ of the maximum there. By continuity and finiteness, there is a neighborhood on which every discarded candidate remains strictly below a fixed retained maximizer and every retained candidate $v$ satisfies
  #[#set math.equation(numbering: n => "(4.9)")
   $ tilde(u) - v < 2 e_0 R^(- 4) . $ <eq:retained-branches>]
  The maximum of the retained family is still $tilde(u)$ throughout this neighborhood. At the origin use the continuous offsets from $V$ to make the same selection.
  Every retained branch satisfies the common inequality
  #[#set math.equation(numbering: n => "(4.10)")
   $ Delta v gt.eq - 4 pi nu + 4 pi upright(bold(1))_({ d < R }) mu_j - 4 pi tilde(p) + upright(bold(1))_({ d gt.eq R }) f \( v \) $ <eq:common-branch-inequality>]
  on this whole neighborhood. For $v_1$, its old inequality suffices on $d < r$, and on $d gt.eq R$ use $f \( u \) gt.eq f \( v_1 \)$. The only new source is on $r lt.eq d < R$. Bad data there are paid for by (4.8). On good data $v_2$ is a candidate, so (4.9) gives
  $ H'_j lt.eq u - \( lambda_1 - lambda_2 - 2 e_0 \) R^(- 4) . $
  Moreover $h_l < 7 B \/ 8 lt.eq d^4 u lt.eq C_(upright("inv")) < h_h$. If $4 pi mu_j > f \( u \)$, the high implication of (3.6), at height $h = d^4 u$, would give
  $ H'_j gt.eq u - xi d^(- 4) gt.eq u - 16 xi R^(- 4) \, $
  contrary to (4.6). Hence $4 pi mu_j lt.eq f \( u \)$, which supplies the required new density.
  For $v_2$ its exact identity $Delta v_2 = - 4 pi nu + 4 pi mu_j$ suffices on $d < R$. At a remaining point where it is retained, the lower splice or the included barrier gives $tilde(u) gt.eq b_R$ and $d lt.eq 2 M R$. Consequently
  $ d^4 v_2 gt.eq frac(7 B, 8) - 2 e_0 \( 2 M \)^4 > frac(5 B, 8) > h_l \, #h(2em) d^4 v_2 lt.eq C_(upright("cap")) < h_h . $
  If $4 pi mu_j < f \( v_2 \)$, the low implication of (3.6) would imply
  $ H'_j lt.eq v_2 + xi d^(- 4) lt.eq v_2 + xi R^(- 4) < v_2 + lambda_2 R^(- 4) = H'_j \, $
  a contradiction. Thus $4 pi mu_j gt.eq f \( v_2 \)$ there. The branch $b_R$ occurs only outside $R$ and satisfies (4.10) by its subsolution property.
  These comparisons concern zero-order densities almost everywhere on the same open neighborhood, including when it crosses $d = R$. The common reaction is $F \( y \, t \) = upright(bold(1))_({ d gt.eq R }) f \( t \)$. It meets the weak maximum rule’s hypotheses; near zero the common $V$ singularity cancels and the reaction vanishes. The rule therefore proves (4.10) for $tilde(u)$ locally. A partition of unity proves it globally.
  ===== 4.4 Forgetting one observation. <forgetting-one-observation.>
  Define
  $ u_(j + 1) = V + bb(E) \[ tilde(u) - V divides cal(F)_(j + 1) \] \, #h(2em) p_(j + 1) = bb(E) \[ tilde(p) divides cal(F)_(j + 1) \] . $
  We justify the conditional integration of the weak inequality. For a fixed system the positive minimum packet width gives deterministic bounds for $mu_j$, $K * mu_j$, and its first derivatives. The initial truncated potential has the same bounds. Thus the initial offsets have deterministic local Lipschitz bounds; subtracting constants, taking finite maxima, and gluing on the fixed open cover preserve such bounds. Where $b_R$ is used, its offset from $V$ is smooth and separated from the origin. The errors remain bounded densities supported in deterministic balls. Conditional integration preserves these bounds. All fields and flags are jointly measurable; the spatial supremum defining the initial flag can be tested on a countable dense set. Fubini’s theorem therefore permits conditional integration against each smooth compactly supported test. A countable dense family of nonnegative tests, followed by local approximation, supplies simultaneous almost-sure weak inequalities for all tests.
  The conditional tower gives $mu_(j + 1)$ as the new inner density, and convexity gives
  $ bb(E) \[ f \( tilde(u) \) divides cal(F)_(j + 1) \] gt.eq f #scale(x: 120%, y: 120%)[\(] V + bb(E) \[ tilde(u) - V divides cal(F)_(j + 1) \] #scale(x: 120%, y: 120%)[\)] . $
  This proves the first line of (4.3) at $R$. The deterministic lower and upper bounds, the equality beyond $M R$, and the error support also pass to the conditional average.
  ===== 4.5 Total error. <total-error.>
  For $r lt.eq \| y \| < 2 r$, every master packet contributing to $mu_j \( y \)$ has center in a fixed annulus comparable to $r$ and width comparable to $r^(1 + w)$. Conditional Jensen, the packet bound, and (2.6), (2.8) imply
  $ ∥mu_j \( y \)∥_(L^2 \( bb(P) \)) lt.eq C r^(- 3 - 3 w) #scale(x: 120%, y: 120%)[\(] r^(- 3) + sqrt(D_0 r) #scale(x: 120%, y: 120%)[\)] lt.eq C r^(- 6 - 3 w) \, $
  since $r lt.eq s$ and $D_0 lt.eq C s^(- 7)$. The bad band event has probability at most $C r^25$. Cauchy–Schwarz in the data and integration over the gain annulus therefore give
  $ bb(E) integral upright(bold(1))_({ upright("bad") }) upright(bold(1))_({ r lt.eq d < R }) mu_j lt.eq C r^(25 \/ 2 + 3 - 6 - 3 w) = C r^(19 \/ 2 - 3 w) . $
  The sum over the geometric sequence of scales is at most $C s^(19 \/ 2 - 3 w)$. Conditional averaging preserves expected total mass. Together with the initial error estimate this proves (4.4) and completes the induction. ◻
]

== 5 The limiting field and its charge <sec:limit>

We now prove the charge and profile assertions of 2; 13 will identify the energy coefficient. The barrier is available at every intermediate observation scale, before all observations are forgotten. This lets us select conditional fields which satisfy both the local Thomas–Fermi equation and the small-error barrier.

=== 5.1 Selecting conditional data <selecting-conditional-data>

Take an arbitrary sequence in (2.1), with an arbitrary minimizing index $n$ in each system. By (2.8), after passing to a subsequence we may suppose

$ q_s := s^3 \( Z - n \) arrow.r q_(*) . $

Choose integers $l arrow.r oo$ sufficiently slowly and a scale $j < J_(*)$ such that

#[#set math.equation(numbering: n => "(5.1)")
 $ frac(1, 2 l) lt.eq a_(*) := r_j / s lt.eq 1 / l . $ <eq:intermediate-scale>]

This is possible because $r_0 \/ s arrow.r 0$ and the radii are dyadic. In addition to the fixed parameters used in the barrier construction, apply 9 at this scale with $M = l^2$, a fixed upper height greater than $C_(upright("cap")) + 1$, and lower height and tolerance sufficiently small in terms of $l$. On its good event,

#[#set math.equation(numbering: n => "(5.2)")
 $ lr(|mu_j \( y \) - k #scale(x: 120%, y: 120%)[\(] H'_j \( y \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2)|) lt.eq l^(- 8) \| y \|^(- 6) #h(2em) \( r_j lt.eq \| y \| lt.eq l s \) . $ <eq:local-tf-approximation>]

Indeed, let $u = \| y \|^4 H'_j \( y \)$ and $v = \( \| y \|^6 mu_j \( y \) \/ k \)^(2 \/ 3)$. The cap on $u$ excludes $v$ at or above the upper height: applying the high implication at heights approaching that endpoint would contradict the cap. Above the lower endpoint, the two implications at heights approaching $v$ squeeze $u$ to within the chosen tolerance of $v$. At or below the lower endpoint they bound $u$ above by that endpoint plus the tolerance. Thus $\| u_(+) - v \| lt.eq h_l + xi$, with both $u_(+)$ and $v$ in $\[ 0 \, h_h + 1 \]$; this uses no lower bound on $u$. Uniform continuity of $t mapsto t^(3 \/ 2)$ on that interval proves the assertion after choosing $h_l$ and $xi$ sufficiently small. The spatial range is covered because $4 M r_j gt.eq 2 l s$.

For each fixed $l$ these are fixed parameters of 9; its thresholds hold eventually and its exceptional probability tends to zero. A slow diagonal choice therefore makes (5.2) hold outside a set of probability tending to zero while also ensuring (5.1).

We can select data on which, in addition,

#[#set math.equation(numbering: n => "(5.3)")
 $ integral p_j lt.eq 1 \, #h(2em) s^3 integral_(\| y \| > 2 R_0 s) mu_j \( y \) thin d y lt.eq eta_s \, #h(2em) eta_s arrow.r 0 . $ <eq:selected-data>]

The first excluded probability tends to zero by (4.4). For the second, a master packet centered in $\| x \| lt.eq R_0 s$ is contained in $\| y \| lt.eq 2 R_0 s$ for all sufficiently far systems. The conditional tower and (2.10) show that the expectation of its left side tends to zero, uniformly in $j$. Markov’s inequality supplies a deterministic threshold $eta_s arrow.r 0$ with excluded probability tending to zero. These two events and the good comparison event have positive joint probability. Choose a point in their intersection where all the conditional identities and barrier inequalities hold. Only this finite-system selection is needed; every selected density still has total mass exactly $n$.

=== 5.2 Compactness and the exterior boundary condition <compactness-and-the-exterior-boundary-condition>

On the selected data, suppress the sequence index and put

$ F_s \( x \) = s^4 #scale(x: 120%, y: 120%)[\(] V - K * mu_j #scale(x: 120%, y: 120%)[\)] \( s x \) \, #h(2em) rho_s \( x \) = s^6 mu_j \( s x \) . $

Then

$ Delta F_s = - 4 pi Z s^3 delta_0 + 4 pi rho_s \, #h(2em) s^4 H'_j \( s x \) = F_s \( x \) - 1 . $

The total rescaled electron mass need not be bounded. We instead control the screened field through its spherical mean. Newton’s averaging identity and $integral mu_j = n$ give

#[#set math.equation(numbering: n => "(5.4)")
 $ overline(F)_s \( d \) := frac(1, 4 pi) integral_(bb(S)^2) F_s \( d omega \) thin d omega = q_s / d + integral_(\| x \| > d) (1 / d - frac(1, \| x \|)) rho_s \( x \) thin d x . $ <eq:spherical-mean>]

In particular $overline(F)_s \( d \) gt.eq q_s \/ d$.

On every compact annulus, 9 gives the uniform pointwise upper bound $F_s \( x \) lt.eq 1 + C_(upright("cap")) \| x \|^(- 4)$ for sufficiently far systems. Together with (5.4) and boundedness of $q_s$, this bounds $F_s$ in local $L^1$ away from zero: integrate $\| F_s \| = 2 \( F_s \)_(+) - F_s$ first over spheres and then over radii. Equation (5.2) also bounds $rho_s$ uniformly on these annuli.

For completeness, choose a ball whose closure avoids the origin, and add to $F_s$ the Coulomb potential of $rho_s$ restricted to a slightly larger ball. The sum is harmonic on the larger ball. The added potential and its gradient are uniformly bounded by the integrals of $\| x - y \|^(- 1)$ and $\| x - y \|^(- 2)$ against a bounded density. Interior harmonic estimates, using the local $L^1$ bound, give uniform bounds and equicontinuity on the smaller ball. A diagonal Arzelà–Ascoli argument now gives a subsequence converging locally uniformly on $bb(R)^3 \\ { 0 }$ to a field $F_oo$. The scaled error in (5.2) tends to zero locally uniformly, so the densities converge there to $k \( \( F_oo - 1 \)_(+) \)^(3 \/ 2)$. Hence

#[#set math.equation(numbering: n => "(5.5)")
 $ Delta F_oo = 4 pi k #scale(x: 120%, y: 120%)[\(] \( F_oo - 1 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) \, #h(2em) F_oo \( x \) lt.eq 1 + C_(upright("cap")) \| x \|^(- 4) . $ <eq:limit-pde>]

The equation holds classically off zero. For example, bounded local sources first give local Hölder regularity of the field; the reaction is then locally Hölder, and interior Poisson regularity gives the asserted conclusion.

The selected tail bound says precisely

$ integral_(\| x \| > 2 R_0) rho_s \( x \) thin d x arrow.r 0 . $

Local uniform density convergence therefore makes $F_oo$ harmonic on $\| x \| > 2 R_0$. For $d > 2 R_0$, the last term of (5.4) is nonnegative and at most $d^(- 1)$ times this tail mass. Consequently

#[#set math.equation(numbering: n => "(5.6)")
 $ overline(F)_oo \( d \) = q_(*) \/ d #h(2em) \( d > 2 R_0 \) . $ <eq:limit-exterior-mean>]

These facts imply the uniform boundary condition

#[#set math.equation(numbering: n => "(5.7)")
 $ F_oo \( x \) arrow.r 0 #h(2em) \( \| x \| arrow.r oo \) . $ <eq:limit-decay>]

Here no positivity has yet been assumed. On large annuli rescaled to a fixed annulus, the upper cap bounds the positive part, and (5.6) bounds the integral of the negative part. Interior harmonic estimates thus give a uniform absolute bound for $F_oo$ throughout the exterior. Given any sequence $R_i arrow.r oo$, its dilates $F_oo \( R_i x \)$ have a subsequence converging locally on punctured space to a bounded harmonic function, with the same absolute bound on every punctured compact set. Its singularity at zero is removable, and Liouville’s theorem makes it constant. Its spherical mean is zero by (5.6), so the constant is zero. If (5.7) failed, dilating at a sequence of offending radii and taking a convergent subsequence of the corresponding unit directions would contradict this conclusion. This proves uniform decay.

=== 5.3 Transferring the positive barrier <transferring-the-positive-barrier>

We claim that

#[#set math.equation(numbering: n => "(5.8)")
 $ F_oo \( x \) gt.eq B \| x \|^(- 4) #h(2em) \( x eq.not 0 \) . $ <eq:limit-positive-barrier>]

The field in this assertion is the field without the subtracted price. This distinction permits the reaction comparison below.

Fix an outer radius $S > 0$ and write $U_s \( x \) = s^4 u_j \( s x \)$. Inside $a_(*)$, the distributional inequality for $U_s$ and the equation for $F_s$ contain the same point-nucleus and density $rho_s$ terms; the inequality also contains the rescaled error from $p_j$. Outside $a_(*)$, (5.2) gives, once $l > S$,

$ rho_s \( x \) lt.eq k #scale(x: 120%, y: 120%)[\(] \( F_s \( x \) - 1 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) + l^(- 8) \| x \|^(- 6) . $

Define the nonnegative correction potential

#[#set math.equation(numbering: n => "(5.9)")
 $ L_s = K * (s^6 p_j \( s thin dot.op \) + l^(- 8) \| dot.op \|^(- 6) upright(bold(1))_({ a_(*) lt.eq \| dot.op \| lt.eq S })) . $ <eq:barrier-correction>]

Scaling (4.3), subtracting the equation for $F_s$, and using $Delta K = - 4 pi delta_0$ gives on $B \( 0 \, S \)$

#[#set math.equation(numbering: n => "(5.10)")
 $ Delta \( U_s - F_s - L_s \) gt.eq upright(bold(1))_({ \| x \| gt.eq a_(*) }) #scale(x: 120%, y: 120%)[\[] f \( U_s \) - f \( F_s - 1 \) #scale(x: 120%, y: 120%)[\]] . $ <eq:barrier-transfer-inequality>]

In particular, subtracting $L_s$ cancels both the accumulated source error and the approximation error with the required sign.

Choose any

$ c > (C_(upright("inv")) S^(- 4) - min_(\| x \| = S) F_oo \( x \))_(+) . $

For sufficiently far systems, local uniform convergence on this sphere, the upper bound for $U_s$, and $L_s gt.eq 0$ give $U_s - F_s - L_s lt.eq c$ on the boundary. The same inequality holds throughout the ball. Indeed, test (5.10) with $\( U_s - F_s - L_s - c \)_(+)$. On its positive set, $U_s > F_s + L_s + c > F_s - 1$, so the reaction difference is nonnegative. The test yields

$ integral_(B \( 0 \, S \)) lr(|nabla \( U_s - F_s - L_s - c \)_(+)|)^2 lt.eq 0 . $

It is legitimate on the full ball: the nuclear singularities in $U_s - F_s$ cancel, the remaining offsets are continuous and locally $H^1$, and the correction is the potential of a bounded compactly supported density for each fixed system. After cancellation all right-hand sides are locally bounded, including near zero, because the reaction term vanishes on $\| x \| < a_(*)$. Approximation therefore allows the compactly supported nonnegative $H^1$ test.

For each fixed $x eq.not 0$, $L_s \( x \) arrow.r 0$. The first density in (5.9) has mass at most $s^3$ by (5.3) and is supported in $\| x \| lt.eq a_(*)$. The second has total mass at most

$ C l^(- 8) a_(*)^(- 3) lt.eq C l^(- 5) \, $

by (5.1); its density near a fixed nonzero evaluation point is $O_x \( l^(- 8) \)$. Splitting its potential integral into a small ball around that point and its complement proves the claim. Finally, for fixed $0 < \| x \| < S$ and sufficiently far systems,

$ U_s \( x \) gt.eq B \| x \|^(- 4) (1 - frac(a_(*), 8 \| x \|)) . $

Pass to the limit in $U_s lt.eq F_s + L_s + c$, then decrease $c$ to its permitted endpoint. Letting $S arrow.r oo$ and using (5.7) proves (5.8).

=== 5.4 The singular profile and uniqueness <the-singular-profile-and-uniqueness>

The dilation argument below is a direct form of the Sommerfeld comparison principle. The homogeneous zero-price profiles are covered by #cite(label("Solovej2003")) Lemma 4.4 and Remark 4.5, including nonspherical fields. Here dilation removes the unit price near the singularity; a separate comparison then proves uniqueness for the priced equation.

#thm([Lemma 5.1.])[
  (Unique decaying singular profile).  #emph[There is at most one classical solution $F$ of 
$ Delta F = 4 pi k #scale(x: 120%, y: 120%)[\(] \( F - 1 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) quad upright("on ") bb(R)^3 \\ { 0 } $

 which tends uniformly to zero at infinity and satisfies $c \| x \|^(- 4) lt.eq F \( x \) lt.eq C \| x \|^(- 4)$ near zero for some $c \, C > 0$. Every such solution has the uniform singular asymptotic 
#[#set math.equation(numbering: n => "(5.11)")
 $ \| x \|^4 F \( x \) arrow.r A_(upright(S)) := (frac(12, 4 pi k))^2 #h(2em) \( \| x \| arrow.b 0 \) . $ <eq:sommerfeld-coefficient>]

 If a solution exists, it is radial.]
] <lem:singular-profile>

#proof[
  Let $a$ and $b$ be the lower and upper limits of $\| x \|^4 F \( x \)$ at zero; the hypotheses give $0 < a lt.eq b < oo$. Choose points approaching the upper limit and put $t$ equal to their radii. The dilates $u_t \( x \) = t^4 F \( t x \)$ satisfy
  $ Delta u_t = 4 pi k #scale(x: 120%, y: 120%)[\(] \( u_t - t^4 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) . $
  They are bounded above and below by positive multiples of $\| x \|^(- 4)$ on compact annuli. The local potential and harmonic compactness argument used above supplies a subsequential classical limit $u$ with $Delta u = 4 pi k u^(3 \/ 2)$. The definition of $b$ gives $u \( x \) lt.eq b \| x \|^(- 4)$ for every $x eq.not 0$. After taking a subsequence of the unit directions, equality holds at a unit point. The difference $u - b \| x \|^(- 4)$ has a local maximum there, so
  $ 4 pi k b^(3 \/ 2) lt.eq 12 b . $
  The analogous dilation at points approaching the lower limit touches $a \| x \|^(- 4)$ from above at a unit point and gives $4 pi k a^(3 \/ 2) gt.eq 12 a$. Since both constants are positive,
  $ b lt.eq (frac(12, 4 pi k))^2 lt.eq a . $
  This proves (5.11). The contact argument does not assume radiality.
  Let $F_1 \, F_2$ be two such solutions. For $alpha > 1$ and $delta > 0$, the function $G = alpha F_1 + delta$ is an upper comparison function:
  $ Delta G = alpha thin 4 pi k #scale(x: 120%, y: 120%)[\(] \( F_1 - 1 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) lt.eq 4 pi k #scale(x: 120%, y: 120%)[\(] \( G - 1 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) . $
  If $F_1 lt.eq 1$ the inequality is immediate; otherwise use $G - 1 gt.eq alpha \( F_1 - 1 \)$ and $alpha^(3 \/ 2) gt.eq alpha$. The common asymptotic coefficient makes $G$ dominate $F_2$ on all sufficiently small spheres. Uniform decay and $delta > 0$ give domination on all sufficiently large spheres. On the intervening annulus, testing with $\( F_2 - G \)_(+)$ and using the nondecreasing reaction proves $F_2 lt.eq G$. Thus this inequality holds everywhere. Let $delta arrow.b 0$ and $alpha arrow.b 1$, and interchange the two solutions to obtain equality. Rotations preserve the equation and both boundary conditions, so uniqueness also gives radiality. ◻
]

#proof[
  #emph[The charge assertion of 2.] The field $F_oo$ constructed above satisfies the hypotheses of 11, by (5.5), (5.7), (5.8). In particular a solution exists, is unique, and is radial. Its exterior mean determines $q_(*)$ uniquely by (5.6). Moreover, at any fixed $d > 2 R_0$,
  $ q_(*) / d = overline(F)_oo \( d \) gt.eq B d^(- 4) > 0 . $
  Denote this uniquely determined positive number by $q$. The reaction density vanishes beyond $2 R_0$, and radiality together with (5.6) gives $F_oo \( x \) = q \/ \| x \|$ there.
  Every sequence of systems and every choice of minimizing indices has bounded scaled deficits by (2.8). From any subsequence on which these deficits converge, the preceding construction produces the same unique profile and hence the same limit $q$. Therefore all scaled deficits converge to $q$:
  $ s^3 \( Z - n \) arrow.r q > 0 #h(2em) upright("along ") upright("equation 2.1") . $
  The argument allowed an arbitrary minimizing index at every stage, as required. The remaining coefficient identity in 2 is proved in 13. ◻
]

== 6 Fixed particle numbers and the Thomas–Fermi coefficient <sec:fixed-sectors>

We first recover fixed-sector energy differences from the priced deficit proved in 5. This step uses monotonicity of the sector energies, without requiring convexity or requiring every sector to minimize at some price. The priced minimum is concave in the price, and its minimizing sectors bound its secant slopes even when the minimizing sector changes. Integrating the deficit law therefore determines the energy at those sectors; monotonicity then brackets the desired particle number. We identify the coefficient by the corresponding Thomas–Fermi calculation.

=== 6.1 Integrating the price and bracketing the sector <integrating-the-price-and-bracketing-the-sector>

#thm([Proposition 6.1.])[
  #emph[Let $q$ be the deficit coefficient in 2. For every sequence of integers $Z > m gt.eq 1$ such that $m arrow.r oo$ and $Z \/ m arrow.r oo$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ frac(E_Z \( Z - m \) - E_Z \( Z \), m^(7 \/ 3)) arrow.r 3 / 7 q^(- 4 \/ 3) . $ <eq:fixed-sector-limit>]

]
] <prop:fixed-sector-limit>

#proof[
  Fix such a sequence. At each fixed $t > 0$, choose any index $n_t$ minimizing $E_n + t m^(4 \/ 3) n$, and put
  $ d_(Z \, m) \( t \) = frac(Z - n_t, m) \, #h(2em) G_(Z \, m) \( t \) = m^(- 7 \/ 3) #scale(x: 120%, y: 120%)[\[] P \( t m^(4 \/ 3) \) - t m^(4 \/ 3) Z - E_Z \( Z \) #scale(x: 120%, y: 120%)[\]] . $
  The choice $s = t^(- 1 \/ 4) m^(- 1 \/ 3)$ satisfies (2.1), since $Z s^3 = t^(- 3 \/ 4) Z \/ m arrow.r oo$. The deficit assertion of 2 therefore gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ d_(Z \, m) \( t \) arrow.r q t^(3 \/ 4) #h(2em) upright("for every fixed ") t > 0 \, $ <eq:priced-scaled-deficit>]
  for every choice of the minimizing indices.
  For $0 < v < t$, the minimizers at the two endpoint prices give
  #[#set math.equation(numbering: n => "(6.3)")
   $ - d_(Z \, m) \( t \) lt.eq frac(G_(Z \, m) \( t \) - G_(Z \, m) \( v \), t - v) lt.eq - d_(Z \, m) \( v \) . $ <eq:quantum-secants>]
  Indeed, evaluating the objective at $n_v$ gives the upper inequality, and evaluating the objective at $n_t$ at price $v$ gives the lower one. These inequalities do not require differentiability at a price with more than one minimizing sector.
  Take a fixed partition $v = t_0 < t_1 < dots.h.c < t_r = t$. Summing (6.3) bounds $G_(Z \, m) \( t \) - G_(Z \, m) \( v \)$ by the two endpoint Riemann sums for the negative deficits. First use (6.2) at the finitely many partition points, and then refine the partition. Since $q t^(3 \/ 4)$ is continuous, this proves
  #[#set math.equation(numbering: n => "(6.4)")
   $ G_(Z \, m) \( t \) - G_(Z \, m) \( v \) arrow.r - 4 / 7 q #scale(x: 120%, y: 120%)[\(] t^(7 \/ 4) - v^(7 \/ 4) #scale(x: 120%, y: 120%)[\)] . $ <eq:quantum-price-increments>]
  The behavior at zero price fixes the integration constant. The neutral sector is a competitor, whereas $E_(n_v) gt.eq E gt.eq E_Z \( Z \) - C$ by (2.2); hence
  #[#set math.equation(numbering: n => "(6.5)")
   $ - C m^(- 7 \/ 3) - v thin d_(Z \, m) \( v \) lt.eq G_(Z \, m) \( v \) lt.eq 0 . $ <eq:quantum-zero-endpoint>]
  For every fixed $v > 0$ this gives $limsup \| G_(Z \, m) \( v \) \| lt.eq q v^(7 \/ 4)$. Combining it with (6.4) and then sending $v arrow.b 0$ yields
  #[#set math.equation(numbering: n => "(6.6)")
   $ G_(Z \, m) \( t \) arrow.r - 4 / 7 q t^(7 \/ 4) \, #h(2em) frac(E_(n_t) - E_Z \( Z \), m^(7 \/ 3)) = G_(Z \, m) \( t \) + t thin d_(Z \, m) \( t \) arrow.r 3 / 7 q t^(7 \/ 4) . $ <eq:quantum-price-energy>]
  Thus no assertion about the convergence of the priced minimizers as $t arrow.b 0$ was needed.
  Choose fixed prices
  $ 0 < t_(-) < q^(- 4 \/ 3) < t_(+) . $
  By (6.2), their deficits are eventually smaller and larger than $m$, respectively. Thus $n_(t_(-)) > Z - m > n_(t_(+))$. Monotonicity of the sector energies gives
  $ E_(n_(t_(-))) - E_Z \( Z \) lt.eq E_Z \( Z - m \) - E_Z \( Z \) lt.eq E_(n_(t_(+))) - E_Z \( Z \) . $
  Apply (6.6) and let both prices approach $q^(- 4 \/ 3)$. The two bounds converge to $3 / 7 q \( q^(- 4 \/ 3) \)^(7 \/ 4) = 3 / 7 q^(- 4 \/ 3)$, proving (6.1). ◻
]

=== 6.2 The same charge in Thomas–Fermi theory <the-same-charge-in-thomasfermi-theory>

The classical weak-ionization law was established by Bénilan and Brezis #cite(label("BenilanBrezis2004")) Section 6, Corollary 5, following the bounds and chemical-potential integration argument of Lieb and Simon #cite(label("LiebSimon1977")) Theorems IV.11–IV.12. We give the argument in the present normalization to identify its coefficient with the charge obtained from the conditional quantum limit.

We allow real nuclear charges and real electron masses in this subsection. For clarity, the admissible finite-mass class can be written as

$ cal(X) = { rho gt.eq 0 : rho in L^1 \( bb(R)^3 \) ∩ L^(5 \/ 3) \( bb(R)^3 \) } . $

All terms of $cal(T)_Z$ are finite on this class. For the direct term, interpolation gives $rho in L^(6 \/ 5)$, and the Sobolev inequality gives the embedding $L^(6 \/ 5) subset \( dot(H)^1 \)^(*)$ and the finite Coulomb energy. For the nuclear term, use $\| x \|^(- 1) in L_(upright("loc"))^(5 \/ 2)$ near zero and the finite mass away from zero. Thus this is precisely the finite-mass class in the definition of $E_Z^(upright("TF")) \( M \)$.

#thm([Proposition 6.2.])[
  #emph[With the two-spin coefficient $T$ fixed above, 
#[#set math.equation(numbering: n => "(6.7)")
 $ lim_(Z arrow.r oo) #scale(x: 120%, y: 120%)[\[] E_Z^(upright("TF")) \( Z - 1 \) - E_Z^(upright("TF")) \( Z \) #scale(x: 120%, y: 120%)[\]] = 3 / 7 q^(- 4 \/ 3) . $ <eq:tf-unit-deficit>]

 The limit holds through real charges $Z > 1$. Consequently (1.2) holds for every fixed real $m > 0$, with 
$ a_(upright("TF")) = 3 / 7 q^(- 4 \/ 3) > 0 . $

]
] <prop:tf-identification>

#proof[
  We identify the charge in the unit-price Thomas–Fermi problem, then integrate in the price and use the exact density scaling.
  ===== 6.2.1 Monotonicity in the electron mass. <monotonicity-in-the-electron-mass.>
  The energy $E_Z^(upright("TF")) \( M \)$ is nonincreasing in $M$. To see this without an attainment assumption, truncate any admissible density of mass $M_1$ to a large ball. The kinetic, nuclear, and direct terms converge to the original ones. If $M_2 gt.eq M_1$, place the missing mass in a nonnegative smooth packet of diameter proportional to $R$, centered at distance $R^2$ from that ball. For a packet of mass $a$ and this spatial scale, its kinetic and direct energies are $O \( a^(5 \/ 3) R^(- 2) \)$ and $O \( a^2 R^(- 1) \)$. Its nuclear term and its interaction with the fixed truncated density tend to zero as $R arrow.r oo$. The mass $a$ stays bounded during this construction. Taking first $R arrow.r oo$, then the truncation radius to infinity, and then the original energy down to its infimum proves monotonicity. The same argument shows that imposing mass exactly $M$ or at most $M$ gives the same infimum.
  ===== 6.2.2 The zero-price minimizer is neutral. <the-zero-price-minimizer-is-neutral.>
  Apply #cite(label("Foundation")) Lemmas 7.1 and 7.2 to the single positive point source $Z delta_0$. Their unconstrained problem on $L^(5 \/ 3) ∩ \( dot(H)^1 \)^(*)$ has a unique minimizer $rho_0$, with finite mass at most $2 Z$. Its field $phi.alt_0 = V - K * rho_0$ satisfies
  #[#set math.equation(numbering: n => "(6.8)")
   $ rho_0 = k \( phi.alt_0 \)_(+)^(3 \/ 2) \, #h(2em) Delta phi.alt_0 = - 4 pi Z delta_0 + 4 pi rho_0 \, #h(2em) c min (frac(Z, \| x \|) \, \| x \|^(- 4)) lt.eq phi.alt_0 \( x \) lt.eq C \| x \|^(- 4) . $ <eq:tf-neutral-field>]
  The cited lemmas supply the lower bound, finite mass, and decay at infinity. For completeness, the upper bound is independent of $Z$: on a ball $B \( x \, R \)$ with $R = \| x \| \/ 2$, compare $phi.alt_0$ with
  $ v \( y \) = frac(C R^4, \( R^2 - \| y - x \|^2 \)^4) . $
  For sufficiently large universal $C$, direct differentiation gives $Delta v lt.eq 4 pi k v^(3 \/ 2)$. The function diverges at the boundary, and the positive-part comparison for $Delta phi.alt_0 = 4 pi k phi.alt_0^(3 \/ 2)$ in this ball gives $phi.alt_0 \( x \) lt.eq C R^(- 4)$, as asserted.
  Uniqueness makes $rho_0$ and $phi.alt_0$ radial. Newton’s spherical-mean identity and finite mass give
  $ Z - integral rho_0 = lim_(d arrow.r oo) d phi.alt_0 \( d \) = 0 \, $
  where the last equality follows from (6.8). Therefore $integral rho_0 = Z$ and
  #[#set math.equation(numbering: n => "(6.9)")
   $ E_Z^(upright("TF")) \( Z \) = min_(rho in cal(X)) cal(T)_Z \( rho \) . $ <eq:tf-neutral-minimum>]
  There is no discrepancy between the variational classes here: every finite-mass admissible density belongs to the cited Coulomb-dual class, and the cited minimizer has finite mass and finite energy terms, hence belongs to $cal(X)$.
  ===== 6.2.3 The unit-price minimizer. <the-unit-price-minimizer.>
  Minimize $cal(T)_Z \( rho \) + integral rho$ over $cal(X)$. Removing density from the region $V lt.eq 1$ cannot increase this functional: the kinetic term, the contribution $integral \( 1 - V \) rho$ there, and all removed direct interactions are nonnegative. We may therefore restrict to the ball $B \( 0 \, Z \)$. Since $V in L^(5 \/ 2) \( B \( 0 \, Z \) \)$, coercivity and weak lower semicontinuity in $L^(5 \/ 3)$ give a minimizer, and strict convexity of the kinetic term gives uniqueness. Denote it by $rho_Z$ and put $phi.alt_Z = V - K * rho_Z$. Nonnegative variations, followed by two-sided multiplicative variations on the positive density, give
  #[#set math.equation(numbering: n => "(6.10)")
   $ rho_Z = k #scale(x: 120%, y: 120%)[\(] \( phi.alt_Z - 1 \)_(+) #scale(x: 120%, y: 120%)[\)]^(3 \/ 2) \, #h(2em) Delta phi.alt_Z = - 4 pi Z delta_0 + 4 pi rho_Z . $ <eq:tf-priced-euler>]
  This holds globally: outside $B \( 0 \, Z \)$ one has $phi.alt_Z lt.eq V lt.eq 1$. The minimizer and its field are radial by uniqueness.
  The following comparison is the unit-price case of the classical chemical-potential comparison #cite(label("Solovej2003")) Lemma 5.1; we include the short maximum-principle proof. The two fields satisfy
  #[#set math.equation(numbering: n => "(6.11)")
   $ phi.alt_0 lt.eq phi.alt_Z lt.eq phi.alt_0 + 1 . $ <eq:tf-price-comparison>]
  For the first inequality, on a positive set of $phi.alt_0 - phi.alt_Z - eta$, with $eta > 0$, the difference of the two reaction terms in (6.8), (6.10) is nonnegative. Testing with that positive part gives a nonpositive squared-gradient bound and hence a zero test. The test is compactly supported because both potentials tend to zero at infinity. For the second inequality, $phi.alt_0 + 1$ solves the same unit-price equation away from the common point source, and the same comparison applies. At the origin the point singularities cancel; the remaining potentials are continuous and locally $H^1$, with locally $L^(5 \/ 3)$ source densities. Thus the compact tests are justified by $H^1$ approximation. Let $eta arrow.b 0$ to obtain (6.11). The continuity and decay used here hold for Coulomb potentials of finite $L^1 ∩ L^(5 \/ 3)$ densities, as also proved in #cite(label("Foundation")) Lemma 7.1.
  Write
  $ Q_Z = Z - integral rho_Z . $
  By (6.11), $phi.alt_Z gt.eq 0$ and $rho_Z lt.eq k phi.alt_0^(3 \/ 2) lt.eq C \| x \|^(- 6)$. Newton’s identity reads
  #[#set math.equation(numbering: n => "(6.12)")
   $ phi.alt_Z \( d \) = Q_Z / d + integral_(\| y \| > d) (1 / d - frac(1, \| y \|)) rho_Z \( y \) thin d y . $ <eq:tf-priced-mean>]
  Finite mass gives $Q_Z = lim_(d arrow.r oo) d phi.alt_Z \( d \) gt.eq 0$. At $d = 1$, the nonnegative second term and (6.11) give $Q_Z lt.eq phi.alt_Z \( 1 \) lt.eq C + 1$. Using the exterior integral of $C \| y \|^(- 6)$ in (6.12), we conclude
  #[#set math.equation(numbering: n => "(6.13)")
   $ 0 lt.eq phi.alt_Z \( d \) lt.eq C / d + C d^(- 4) . $ <eq:tf-uniform-exterior>]
  Choose a fixed sufficiently large $R$. Then $phi.alt_Z < 1$ on $d > R$ for every $Z$, so (6.10) implies $rho_Z = 0$ there and $phi.alt_Z \( d \) = Q_Z \/ d$.
  ===== 6.2.4 Identification of the limiting charge. <identification-of-the-limiting-charge.>
  Let $Z arrow.r oo$ through real values. On every compact annulus, (6.8), (6.11) bound $phi.alt_Z$ above and below, and (6.10) bounds its source. Local Poisson estimates give a locally uniformly convergent subsequence. Its limit $phi.alt_oo$ satisfies (5.5) and
  $ c \| x \|^(- 4) lt.eq phi.alt_oo \( x \) lt.eq 1 + C \| x \|^(- 4) . $
  The uniform estimate (6.13) gives decay at infinity. By the uniqueness in 11, this is the same field constructed in 5. Its exterior charge is $q$. At any fixed radius beyond both exterior supports, $Q_Z = d phi.alt_Z \( d \) arrow.r d phi.alt_oo \( d \) = q$. Uniqueness of the subsequential limit therefore proves
  #[#set math.equation(numbering: n => "(6.14)")
   $ Q_Z arrow.r q #h(2em) \( Z arrow.r oo \) . $ <eq:tf-unit-charge>]
  The use of real charges is permitted by the arbitrary-positive-point-source hypotheses of #cite(label("Foundation")) Lemmas 7.1 and 7.2.
  ===== 6.2.5 Other prices and their energies. <other-prices-and-their-energies.>
  For $t > 0$, let $rho_(Z \, t)$ minimize $cal(T)_Z \( rho \) + t integral rho$, and write $Q_Z \( t \) = Z - integral rho_(Z \, t)$. Existence and uniqueness follow as above, now restricting to $B \( 0 \, Z \/ t \)$. With $b = t^(- 1 \/ 4)$, the transformation
  $ tilde(rho) \( x \) = b^6 rho_(Z \, t) \( b x \) \, #h(2em) tilde(phi.alt) \( x \) = b^4 #scale(x: 120%, y: 120%)[\(] V - K * rho_(Z \, t) #scale(x: 120%, y: 120%)[\)] \( b x \) $
  gives the unit-price minimizer and field at nuclear charge $b^3 Z$. Indeed, the transformed functional is exactly
  $ cal(T)_(b^3 Z) \( tilde(rho) \) + integral tilde(rho) = b^7 (cal(T)_Z \( rho_(Z \, t) \) + t integral rho_(Z \, t)) \, $
  and this transformation is a bijection of admissible densities. Its mass is multiplied by $b^3$, so
  #[#set math.equation(numbering: n => "(6.15)")
   $ Q_Z \( t \) = t^(3 \/ 4) Q_(t^(- 3 \/ 4) Z) arrow.r q t^(3 \/ 4) #h(2em) \( t > 0 upright(" fixed") \) . $ <eq:tf-price-scaling>]
  Define
  $ Pi_Z \( t \) = min_(rho in cal(X)) (cal(T)_Z \( rho \) + t integral rho) \, #h(2em) G_Z^(upright("TF")) \( t \) = Pi_Z \( t \) - t Z - E_Z^(upright("TF")) \( Z \) . $
  The endpoint-minimizer comparisons give, for $0 < v < t$,
  $ - Q_Z \( t \) lt.eq frac(G_Z^(upright("TF")) \( t \) - G_Z^(upright("TF")) \( v \), t - v) lt.eq - Q_Z \( v \) . $
  The exact zero-price identity (6.9) gives
  $ - v Q_Z \( v \) lt.eq G_Z^(upright("TF")) \( v \) lt.eq 0 . $
  Consequently the same fixed-partition integration and then $v arrow.b 0$ argument used in (6.4), (6.5) gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ G_Z^(upright("TF")) \( t \) arrow.r - 4 / 7 q t^(7 \/ 4) \, #h(2em) cal(T)_Z \( rho_(Z \, t) \) - E_Z^(upright("TF")) \( Z \) arrow.r 3 / 7 q t^(7 \/ 4) . $ <eq:tf-priced-energy>]
  Each priced minimizer is also a minimizer at its own mass: an improvement at that mass would improve the priced objective. For fixed $t_(-) < q^(- 4 \/ 3) < t_(+)$, (6.15) places these two masses on opposite sides of $Z - 1$ for all large $Z$. The mass monotonicity proved above and (6.16), followed by $t_(-) \, t_(+) arrow.r q^(- 4 \/ 3)$, give (6.7).
  ===== 6.2.6 Every fixed removed mass. <every-fixed-removed-mass.>
  For $m > 0$ the density scaling
  $ rho \( x \) = m^2 sigma \( m^(1 \/ 3) x \) $
  multiplies the mass by $m$ and satisfies $cal(T)_Z \( rho \) = m^(7 \/ 3) cal(T)_(Z \/ m) \( sigma \)$. It is a bijection between the corresponding admissible classes. Hence
  #[#set math.equation(numbering: n => "(6.17)")
   $ E_Z^(upright("TF")) \( N \) = m^(7 \/ 3) E_(Z \/ m)^(upright("TF")) \( N \/ m \) \, #h(2em) I_m^(upright("TF")) \( Z \) = m^(7 \/ 3) I_1^(upright("TF")) \( Z \/ m \) . $ <eq:tf-mass-scaling>]
  For fixed $m > 0$, the real charge $Z \/ m$ tends to infinity with $Z$. Applying (6.7) proves (1.2) and the claimed value of $a_(upright("TF"))$. This also completes the coefficient assertion of 2. ◻
]

=== 6.3 The specified order of limits <the-specified-order-of-limits>

#proof[
  #emph[Completion of the proof of 1.] The joint conclusion (1.3) follows from Proposition 6.1, Proposition 6.2. To deduce the iterated limits, suppose first that, along unbounded integers $m_j$, the normalized inner upper limit exceeds $a_(upright("TF"))$ by a fixed $eta > 0$. By the definition of a limsup, for each $j$ one may choose an arbitrarily large integer $Z_j > m_j$, in particular $Z_j \/ m_j gt.eq j$, with
  $ frac(I_(m_j) \( Z_j \), m_j^(7 \/ 3)) > a_(upright("TF")) + eta \/ 2 . $
  This contradicts (1.3). The same selection applies if these inner upper limits are infinite. Likewise, a normalized inner lower limit less than $a_(upright("TF")) - eta$ along unbounded $m_j$ allows choosing $Z_j \/ m_j gt.eq j$ with normalized energies below $a_(upright("TF")) - eta \/ 2$, again a contradiction. Therefore
  $ limsup_(m arrow.r oo) frac(limsup_(Z arrow.r oo) I_m \( Z \), m^(7 \/ 3)) lt.eq a_(upright("TF")) \, #h(2em) liminf_(m arrow.r oo) frac(liminf_(Z arrow.r oo) I_m \( Z \), m^(7 \/ 3)) gt.eq a_(upright("TF")) . $
  Since the inner lower limit never exceeds the inner upper limit, both outer limits exist and equal $a_(upright("TF"))$. The construction always chooses $Z$ only after $m$ is fixed; no convergence in $Z$ at a fixed $m$ has been assumed. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
