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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform excess charge for Coulomb molecules \
and the outer radius of neutral atoms]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

We prove a uniform bound on the number of excess electrons that fixed Coulomb nuclei can strictly bind.
  If there are $M$ nuclei of total charge $Z$, that number is at most $C M$,
  with a constant independent of their charges and positions.
  For a neutral atom with integer nuclear charge, we also prove that the cost of removing one electron and the
  radius containing all but one half of an electron each stay between positive universal constants.
  These conclusions address the number of bound electrons, the first ionization energy,
  and the location of the outer electronic mass. Their proofs share the local screening estimates developed in
  this paper.

=== 1.1 The model and the results <the-model-and-the-results>

Fix $M gt.eq 1$, distinct positions $R_1 \, dots.h \, R_M in bb(R)^3$, and real charges $z_1 \, dots.h \,
  z_M gt.eq 1$. Put

$ Z = sum_(j = 1)^M z_j \, wide nu = sum_(j = 1)^M z_j delta_(R_j) \, wide K \( x \) = \| x \|^(- 1) \, wide V =
  K * nu . $

For $n gt.eq 1$ let $cal(H)_n = and.big^n L^2 \( bb(R)^3 \; bb(C)^2 \)$,
  so that there are two electron spin states and antisymmetry exchanges spatial and spin variables together.
  The Hamiltonian is the self-adjoint operator associated with the closed,
  bounded-below Coulomb form on $cal(Q)_n = cal(H)_n ∩ H^1 \( \( bb(R)^3 \)^n \; \( bb(C)^2 \)^(⊗ n) \)$:

#[#set math.equation(numbering: n => "(1.1)")
 $ H_n = sum_(i = 1)^n (- 1 / 2 Delta_i - V \( x_i \)) + sum_(1 lt.eq i < j lt.eq n) \| x_i -
   x_j \|^(- 1) . $ <eq:hamiltonian>]

The nuclei are fixed; their mutual repulsion is a scalar independent of $n$ and is omitted.
  Write $E_n = inf sigma \( H_n \)$ and $E_0 = 0$. We say that sector $n$ #emph[binds strictly] if $E_n < E_(n - 1)$.

#thm([Theorem 1.1.])[
  (Uniform excess charge).  #emph[There is a universal finite constant $C$ such that every nuclear system
    specified above and every integer $n gt.eq 1$ satisfy
$ E_n < E_(n - 1) quad arrow.r.double quad n lt.eq Z + C M . $

 Moreover, $E_n = E_(n - 1)$ whenever $n > Z + C M$. For one nucleus this gives $n lt.eq Z +
   C$ under strict binding, for every real $Z gt.eq 1$. The same constant is independent of all charges and
   nuclear positions.]
] <thm:main>

The positions may be arbitrarily close or far apart. The theorem resolves positively the excess-charge form of the
  ionization conjecture in this strict-binding formulation #cite(label("Simon2000"))
  #cite(label("Lewin2025OpenProblems")). Equality of adjacent energies does not by itself exclude a ground state
  at threshold; such threshold states are not needed here.

For the radius conclusion specialize to one nucleus at the origin with integer charge $Z gt.eq 1$.
  Write $H_(n \, Z)$ and $E \( n \, Z \)$ when the nuclear charge needs to be displayed.
  If $Psi_Z$ is a normalized ground state of $H_(Z \, Z)$, its spin-summed density is

$ rho_(Psi_Z) \( x \) = Z sum_(sigma_1 \, dots.h \, sigma_Z) integral \|
  Psi_Z \( x \, sigma_1 \; x_2 \, sigma_2 \; dots.h \; x_Z \, sigma_Z \) \|^2 thin d x_2 dots.h.c d x_Z \, $

where the integral is absent for $Z = 1$. Its mass is $Z$. Define

#[#set math.equation(numbering: n => "(1.2)")
 $ R \( Psi_Z \) = inf {r gt.eq 0 : integral_(\| x \| > r) rho_(Psi_Z) \( x \) thin d x lt.eq 1 / 2} . $ <eq:radius>]

#thm([Theorem 1.2.])[
  (Uniform outer half-electron radius).  #emph[There are universal constants $0 < c lt.eq C < oo$ such that,
    for every integer $Z gt.eq 1$ and every normalized ground state of $H_(Z \, Z)$,
$ c lt.eq R \( Psi_Z \) lt.eq C . $

]
] <thm:radius>

The existence of these ground states is included in Lemma 8. No uniqueness or spherical symmetry is assumed.
  The exterior mass in (1.2) stays fixed as $Z$ grows; it describes outer electrons rather than a fixed fraction
  of the atom.

#thm([Corollary 1.3.])[
  (Two-sided first-ionization bound).  #emph[For the full nonrelativistic Coulomb atom specified above,
    with integer nuclear charge $Z gt.eq 1$, one-electron kinetic term $- Delta \/ 2$,
    and two electron spin states, write $E_Z \( n \) = E \( n \, Z \)$.
    There are universal constants $0 < c lt.eq C < oo$ such that the first ionization energy of the neutral atom
    satisfies
$ c lt.eq I_1 \( Z \) := E_Z \( Z - 1 \) - E_Z \( Z \) lt.eq C wide upright("for every integer ") Z gt.eq 1 . $

]
] <cor:first-ionization>

=== 1.2 History and the scales of the problem <history-and-the-scales-of-the-problem>

Simon’s atomic formulation asks whether $N_0 \( Z \) - Z$ stays bounded,
  where $N_0 \( Z \)$ is the first sector at which the energy equals every later sector energy
  #cite(label("Simon2000")) Problem 9. Since the sector energies are nonincreasing and ultimately constant,
  this is the largest strictly binding sector used here. The corresponding molecular conjecture has the form $N_c
  lt.eq Z + C M$ #cite(label("Lewin2025OpenProblems")) Section 2.1.2.

The early charge bounds already distinguished atoms from molecules.
  Lieb proved bounds linear in the total nuclear charge for fixed atoms and molecules,
  without requiring Fermi statistics #cite(label("Lieb1984")).
  For fermionic atoms, Lieb, Sigal, Simon and Thirring established asymptotic neutrality:
  the maximal strictly bound particle number $N_c \( Z \)$ satisfies $N_c \( Z \) \/ Z arrow.r 1$ as $Z arrow.r
  oo$ #cite(label("LSST1984")) #cite(label("LSST1988")). Fefferman and Seco, and Seco, Sigal and Solovej,
  subsequently obtained quantitative sublinear bounds #cite(label("FeffermanSeco1990"))
  #cite(label("SecoSigalSolovej1990")). Ivrii obtained further semiclassical charge bounds for atoms and heavy
  molecules under the hypothesis that each nuclear charge is comparable to the electron number,
  with improved exponents for atoms and for suitably separated nuclei #cite(label("Ivrii2012")) Theorem 5.2.1.
  For explicit finite-charge estimates, Nam proved $N_c \( Z \) < 1.22 Z + 3 Z^(1 \/ 3)$ #cite(label("Nam2012")).
  More recently, Hundertmark, Pattakos and Schulz obtained $N_c \( Z \) < 1.1185 Z + 4 Z^(1 \/ 3)$ for $Z gt.eq
  4$ #cite(label("HPS2025")). These estimates supply useful quantitative control while leaving the uniform
  excess-charge assertion distinct.

For the full many-electron Schrödinger atom, Seco, Sigal and Solovej also obtained, for large $Z$,
  an upper bound for the neutral first ionization energy and a lower bound for an exterior-mass radius,
  both given by powers of the nuclear charge #cite(label("SecoSigalSolovej1990")) Theorems 1 and 3.
  Their radius leaves one expected electron outside, whereas (1.2) leaves one half.
  Their energy upper bound grows with $Z$, and their radius lower bound decays with $Z$.
  The upper bound in Corollary 3 establishes the usual boundedness assertion for $I_1 \( Z \)$
  #cite(label("Solovej2016")) Section 2; the uniform positive lower bound is an additional conclusion.

The statistical theories introduced by Thomas and Fermi #cite(label("Thomas1927")) #cite(label("Fermi1927"))
  predict a particularly rigid exterior screening profile. Lieb and Simon established the variational theory and
  its leading large-charge energy and density limits #cite(label("LiebSimon1973")) #cite(label("LiebSimon1977")).
  Uniform ionization bounds were proved in Thomas–Fermi–von Weizsäcker theory by Benguria and Lieb
  #cite(label("BenguriaLieb1985")), and in reduced and unrestricted Hartree–Fock theory by Solovej
  #cite(label("Solovej1991")) #cite(label("Solovej2003")). Solovej’s unrestricted Hartree–Fock analysis compares
  screened potentials through successive spatial scales and also establishes uniform bounds and asymptotics for
  outer-electron radii #cite(label("Solovej2003")) Definition 1.2, Theorem 1.5, and Sections 10–13.
  Those conclusions concern their stated variational models;
  the states in (1.1) may have arbitrary many-body correlations.

The bulk density limit lives on the length scale $Z^(- 1 \/ 3)$,
  whereas the normalized mass outside the radius in (1.2) is $1 \/ \( 2 Z \)$.
  Its vanishing fraction makes bulk convergence insufficient to prove Theorem 2.
  The fixed exterior-mass viewpoint is also central to the generalized ionization conjecture
  #cite(label("Solovej2016")) Section 3.

Companion papers use the estimates developed here, with additional arguments,
  to obtain Thomas–Fermi asymptotics for full two-spin Coulomb atoms.
  The energy result sends the number of removed electrons to infinity while it remains negligible relative to the
  nuclear charge #cite(label("OpenAI2026GeneralizedEnergy")) Theorem 1.1;
  the neutral-radius result first takes upper and lower large-charge limits at fixed expected exterior electron
  mass, and then lets that mass tend to infinity #cite(label("OpenAI2026GeneralizedRadius")) Theorem 1.1.

The analytic ingredients have separate roles. The Lieb–Thirring kinetic inequality provides a positive coarse
  density bound, for which we use Rumin’s spectral-splitting argument #cite(label("LiebThirring1975"))
  #cite(label("Rumin2011")). The exact Thomas–Fermi coefficient comes instead from coherent-state filling and
  Neumann eigenvalue counting, with explicit remainders. These constructions have classical antecedents in the
  semiclassical analysis of Lieb and Simon and in the coherent-state comparison of Solovej
  #cite(label("LiebSimon1977")) Theorems III.10–III.13 #cite(label("Solovej2003")) Lemma 8.2.
  Spatial square partitions are the usual IMS localization;
  sector-valued localization for correlated states is systematically developed by Lewin
  #cite(label("Lewin2011Geometric")) Proposition 3.1 and Example 3.3.
  Our conditional core construction retains the removed positions and spins,
  so that the remaining correlated state can be compared with local trial electrons through its own screened field.

=== 1.3 Obstacles and the common argument <obstacles-and-the-common-argument>

Fixing the total electron number obstructs a local density comparison:
  a ball may contain too many or too few electrons, and its conditional core need not minimize any fixed
  local-particle-number problem. We therefore first work relative to the minimum $E =
  inf_(n gt.eq 0) E_n$ over all sectors. A coarse binding bound guarantees that it is attained at a largest
  strictly bound sector. A normalized state with form energy at most $E + delta$ will be called a $delta$-state.
  Keeping $delta$ visible makes local estimates available again after an event is imposed,
  after particles are deleted, and after a shell weight changes the probability law.

Three steps are common to the molecular and atomic conclusions.
  First, a spatial cut records every removed electron and leaves an antisymmetric conditional core.
  In the hole, arbitrary expected trial mass is allowed because each actual trial has an integer sector with
  energy at least $E$. The coherent upper and Neumann lower comparisons have the same kinetic coefficient.
  Their comparison produces a local Thomas–Fermi minimizer $rho$ and its screened field $W$, related by

$ rho = k \( W_(+) \)^(3 \/ 2) \, wide k = frac(2^(3 \/ 2), 3 pi^2) . $

It also controls the Coulomb discrepancy from the actual fine density and the energy of that density in the
  negative part of $W$. A bootstrap for the positive field closes a bound on the second moment of local electron counts.

Next, smoothing and noisy observations produce a conditional density $mu$ and a screened field.
  In the atomic case the field is $H = V - K * mu$. On nucleus-free patches we transfer the local Thomas–Fermi law
  to these quantities, as one-sided comparisons between $mu$ and $k \( H_(+) \)^(3 \/ 2)$ at positive,
  bounded rescaled heights. The molecular comparison retains the nearby nuclear potential explicitly:
  after splitting off its singular part, we compare the continuous conditional offset through an averaged
  Thomas–Fermi response.

To prove these comparisons, observe all positions with independent errors of width $ell$ and forget the particle
  labels. An observation event of probability $p$ has a symmetric square-root likelihood multiplier.
  Applied to a sector eigenstate, its energy cost is bounded by $C ell^(- 2) log^5 \( e \/ p \)$,
  without a particle-number factor. A hypothetical failure can therefore be tested by the local quantum estimates.
  The original observation posterior and the fresh patch posterior are different:
  two separate conditional-expectation identities compare their fields after averaging in the event law.
  The negative-field penalty controls the rare configurations needed to pass a lower field estimate to expectation.

Finally, a positive comparison field is continued outward.
  A local maximum chooses between a shifted nonlinear subsolution and a shifted observed field.
  The inverse comparisons let us replace the model reaction by the actual conditional density on one more layer.
  Conditional averaging then forgets one observation array, with convexity preserving the nonlinear inequality.
  The errors are summed through their expected integrals. At the terminal scale,
  comparison with a compact source potential and its spherical mean turns the positive field into a lower bound on
  the nuclear charge minus the enclosed electron mass, up to the accumulated error.

The geometry determines how this mechanism closes. For a molecule,
  the local length measures nearby nuclear charge. Empty nuclear annuli must be counted without a loss for their
  number of scales. A decomposition by nested nuclear representatives gives a total cost proportional to $M$;
  it bounds the electrons outside the terminal region and closes the excess-charge estimate.

For an atom, local balls away from the nucleus use their distance from it;
  this distinct scale reaches inside the bulk length. The continuation produces an interior electron deficit for
  sector ground states with $n lt.eq 3 Z$ and bounded energy offset from $E$. We first use it at offset zero.
  Deleting exterior particles then proves $E_(Z - 1) lt.eq E + C$,
  so both neutral and singly ionized ground states become eligible for the fixed-offset estimates.
  The neutral deficit gives the lower radius bound. A spatially averaged insertion into the singly ionized state
  gives a uniform positive gap $E_(Z - 1) - E_Z gt.eq c$. Together with the offset bound this proves Corollary 3,
  after adjusting the constants at finitely many smaller charges.
  The gap also yields the expected tail bound $C \/ R$ through a shell-weighted change of law.
  Here the shell weight is measurable in the revealed data,
  which is why this change of law preserves the surviving conditional field.

=== 1.4 Organization and normalization <organization-and-normalization>

Section 2 provides the sector facts, and Sections 3–5 prove the shared localization, screening,
  and conditioning estimates. The two local geometries are specified in Section 4.
  From these shared tools, Sections 6–9 prove the molecular excess-charge bound.
  A reader interested in the neutral atomic results may instead proceed directly to Sections 10–14;
  these proofs do not use the molecular excess-charge theorem.
  The atomic comparison and intermediate subsolutions come first, followed by deletion, insertion,
  and the tail argument in the order described above. Section 15 collects the precise inputs for the companion
  asymptotic problems, including the classical Thomas–Fermi comparisons proved in Section 7.

All density integrals include spin summation. For a real number or function $v$, write $v_(+) =
  max \( v \, 0 \)$ and $v_(-) = max \( - v \, 0 \)$. The constants $C \,
  c > 0$ may change from line to line and are universal unless a dependence is stated.
  With the kinetic normalization in (1.1),

#[#set math.equation(numbering: n => "(1.3)")
 $ c_(upright("TF")) = 3 / 10 \( 3 pi^2 \)^(2 \/ 3) \, wide k = \( 5 c_(upright("TF")) \/ 3 \)^(- 3 \/ 2) =
   frac(2^(3 \/ 2), 3 pi^2) \, wide c_F = 4 pi k . $ <eq:tf-constants>]

The coarse kinetic lower bound does not assert that its unspecified constant equals $c_(upright("TF"))$.

== 2 A ground state at the minimum over all sectors <sec:sector>

The local comparisons in the proof may replace electrons in a region by a different number of electrons.
  We therefore first reduce to a ground state whose energy is minimal among #emph[all] particle-number sectors.
  A coarse number bound makes this reduction possible; no convexity of the sector energies is needed.

=== 2.1 The Coulomb form and strict binding <the-coulomb-form-and-strict-binding>

Use the Hilbert spaces and form domains defined in the Introduction, writing $n$ for a variable particle number.
  The quadratic form associated with (1.1) is

#[#set math.equation(numbering: n => "(2.1)")
 $ q_n \[ psi \] = 1 / 2 sum_(i = 1)^n parallel nabla_i psi parallel_2^2 -
   sum_(i = 1)^n integral V \( x_i \) \| psi \|^2 + sum_(1 lt.eq i < j lt.eq n) integral K \( x_i - x_j \) \|
   psi \|^2 . $ <eq:sector-form>]

We also evaluate this expression on the ambient spin-valued $H^1$ space when a localization preserves antisymmetry
  only within groups of variables. Sector-energy bounds will be applied only to the groups that remain
  antisymmetric. Hardy’s inequality in three dimensions, followed by Cauchy–Schwarz,
  shows that each Coulomb term is infinitesimally form bounded relative to the kinetic energy.
  For a pair term, apply the same argument to the relative coordinate $x_i - x_j$.
  Thus, for each fixed system and sector, the sum of the absolute Coulomb forms is bounded by

$ eta sum_i parallel nabla_i psi parallel_2^2 + C_eta parallel psi parallel_2^2 wide \( eta > 0 \) . $

Consequently (2.1) is closed and bounded below on $cal(Q)_n$.
  Its associated self-adjoint operator is the Hamiltonian $H_n$ in the Introduction, and

$ E_n = inf_(psi in cal(Q)_n\
parallel psi parallel_2 = 1) q_n \[ psi \] = inf sigma \( H_n \) . $

Smooth compactly supported antisymmetric functions form a form core:
  approximate in $H^1$ and apply the finite antisymmetrization projection.
  Set $cal(H)_0 = cal(Q)_0 = bb(C)$, $q_0 = 0$, and $E_0 = 0$.
  The constants in these elementary domain facts may depend on the fixed system and on $n$.

#thm([Lemma 2.1.])[
  (Monotonicity and strict-binding compactness).  #emph[For every fixed nuclear system, $E_(n + 1) lt.eq
    E_n$ for $n gt.eq 0$, and $E_1 < 0$. If $E_n < E_(n - 1)$,
    there is a normalized $Psi in cal(Q)_n$ with $q_n \[ Psi \] = E_n$.]
] <lem:sector-compactness>

#proof[
  Approximate an $n$-electron trial state by one with compact support.
    Wedge it with a normalized spin orbital in a disjoint distant ball.
    Dilate the orbital to make its kinetic energy small and separate the supports far enough to make the added
    repulsion small. Disjoint spatial supports make the energy of the normalized wedge the sum of the group
    energies and their direct cross repulsion. Dropping the added nuclear attraction proves $E_(n + 1) lt.eq E_n$.
    A normalized orbital dilated about one nucleus has kinetic energy $O \( s^(- 2) \)$ and attraction at most $-
    c z_m s^(- 1)$, proving $E_1 < 0$.
  Suppose $Delta = E_(n - 1) - E_n > 0$, and take a normalized minimizing sequence $psi_j$.
    The form bound above gives a uniform $H^1$ bound. Choose nonnegative Lipschitz functions $g_S \, h_S$ with
  $ g_S^2 + h_S^2 = 1 \, quad g_S = 1 upright(" on ") B \( 0 \, S \) \, quad g_S =
    0 upright(" outside ") B \( 0 \, 2 S \) \, quad \| nabla g_S \| + \| nabla h_S \| lt.eq C \/ S . $
  They may be constructed as the cosine and sine of a cutoff angle.
    For each subset $I$ of the particle labels, multiply $psi_j$ by $product_(i in I) g_S \( x_i \)
    product_(i in.not I) h_S \( x_i \)$. The squared norms of these localized states sum to one.
    The product partition identity for the kinetic energy adds at most $C n \/ S^2$ to the sum of their forms.
  The all-$g_S$ component has energy at least $E_n$ times its squared norm.
    If $k < n$ coordinates carry $g_S$, slice in the remaining coordinates.
    Antisymmetry in the $k$ retained coordinates gives their energy lower bound $E_k gt.eq E_(n - 1)$.
    Drop the other kinetic terms and all pair terms involving an $h_S$ coordinate.
    For $S > 2 max_m \| R_m \|$, their total nuclear attraction is bounded below by $-
    2 Z n \/ S$ times the component’s squared norm. If $p_j \( S \)$ is the total squared mass of components other
    than all-$g_S$, it follows that
  $ \( Delta - 2 Z n \/ S \) p_j \( S \) lt.eq q_n \[ psi_j \] - E_n + C n \/ S^2 . $
  The probability that any $\| x_i \| gt.eq 2 S$ is at most $p_j \( S \)$,
    because the all-$g_S$ product vanishes there. Taking first $j arrow.r oo$, then $S arrow.r oo$, proves tightness.
  Local Rellich compactness and tightness give, along a subsequence,
    strong $L^2$ convergence to a normalized antisymmetric $Psi$, weak $H^1$ convergence,
    and almost-everywhere convergence. The attraction converges:
    the infinitesimal form bound applied to $psi_j - Psi$, with its relative-bound parameter subsequently tending
    to zero, gives
  $ sum_i integral V \( x_i \) \| psi_j - Psi \|^2 arrow.r 0 . $
  Cauchy–Schwarz with this weight handles the difference of the attractive expectations.
    The kinetic energy is weakly lower semicontinuous, and the nonnegative repulsion is lower semicontinuous by
    Fatou’s lemma. Hence $Psi$ minimizes. Variation in the form domain gives the weak eigen-equation at $E_n$. ◻
]

=== 2.2 A coarse number bound <a-coarse-number-bound>

The following reciprocal-potential test is a weighted-electron argument of the type used in charge-linear
  ionization bounds #cite(label("Lieb1984")). We include the calculation,
  including the regularization needed for the form domain.

#thm([Lemma 2.2.])[
  (Reciprocal-potential bound).  #emph[If $E_n < E_(n - 1)$ and every $z_m gt.eq 1$, then $n lt.eq 3 Z$.]
] <lem:sector-crude>

#proof[
  Let $Psi$ be the minimizer from Lemma 4. For $l \, epsilon > 0$ put
  $ V_l \( x \) = sum_m z_m \( \| x - R_m \|^2 + l^2 \)^(- 1 \/ 2) \, wide U = V_l + epsilon \, wide w = U^(- 1) . $
  For these fixed parameters, $w$ and its first derivatives are bounded.
    Test the weak eigen-equation with $\( sum_i w \( x_i \) \) Psi$ and take real parts.
    This summed multiplier is symmetric; after taking this admissible test we may expand its individual summands
    in the ambient form.
  In the $i$th summand, the Hamiltonian on the other $n - 1$ coordinates, minus $E_n$,
    has nonnegative pairing after weighting by $w \( x_i \)$.
    This follows by slicing in $x_i$ and its spin and using $E_(n - 1) gt.eq E_n$.
    The remaining kinetic pairing is also nonnegative. Indeed, with $phi.alt = w \( x_i \) Psi$,
  $ "Re" integral nabla_i Psi dot.op overline(nabla_i \( w \( x_i \) Psi \)) & =
    integral U \( x_i \) \| nabla_i phi.alt \|^2 - 1 / 2 integral \( Delta V_l \) \( x_i \) \| phi.alt \|^2 gt.eq 0 \,\
Delta V_l \( x \) & = - 3 l^2 sum_m z_m \( \| x - R_m \|^2 + l^2 \)^(- 5 \/ 2) lt.eq 0 . $
  The integration by parts is justified by large-radius cutoffs and $H^1$ approximation;
    all displayed coefficients and their needed derivatives are bounded for fixed $l \, epsilon$. We obtain
  #[#set math.equation(numbering: n => "(2.2)")
   $ bb(E)_Psi sum_(i < j) frac(w \( x_i \) + w \( x_j \), \| x_i - x_j \|) lt.eq
     bb(E)_Psi sum_i w \( x_i \) V \( x_i \) . $ <eq:sector-weighted-pairs>]
  Let $l arrow.b 0$ at fixed $epsilon$. Dominated convergence applies,
    using $V \/ epsilon$ for attraction and $2 K \/ epsilon$ for a pair.
    These functions have finite expectations on the form domain.
    Hence (2.2) holds with $w = \( V + epsilon \)^(- 1)$, and its right side is at most $n$.
  For a configuration outside the null set of nuclear collisions, set
  $ q_(i m) = frac(w \( x_i \) z_m, \| x_i - R_m \|) \, wide s_i = sum_m q_(i m) =
    frac(V \( x_i \), V \( x_i \) + epsilon) lt.eq 1 . $
  The triangle inequality gives
  $ frac(w \( x_i \) + w \( x_j \), \| x_i - x_j \|) gt.eq sum_m frac(q_(i m) q_(j m), z_m) . $
  In fact, multiplying the right side by $\| x_i - x_j \|$ bounds it above by $w \( x_i \)
    w \( x_j \) \( V \( x_i \) + V \( x_j \) \) lt.eq w \( x_i \) + w \( x_j \)$.
    Weighted Cauchy–Schwarz and $z_m gt.eq 1$ now imply
  $ sum_(i < j) sum_m frac(q_(i m) q_(j m), z_m) & = 1 / 2 sum_m frac(\( sum_i q_(i m) \)^2 - sum_i q_(i m)^2, z_m)\
 & gt.eq frac(\( sum_i s_i \)^2, 2 Z) - n / 2 . $
  Here $sum_m q_(i m)^2 \/ z_m lt.eq sum_m q_(i m)^2 lt.eq s_i^2 lt.eq 1$.
    As $epsilon arrow.b 0$, each $s_i$ tends to one almost surely, and the squared sum is bounded by $n^2$.
    Taking expectations in the last inequality and using (2.2) gives $n gt.eq n^2 \/ \( 2 Z \) - n \/ 2$, as asserted. ◻
]

#thm([Lemma 2.3.])[
  (Reduction to a global sector minimum).  #emph[For every fixed nuclear system there is a largest integer $N$
    such that $E_N < E_(N - 1)$. It satisfies $N lt.eq 3 Z$, has a normalized minimizer $Psi$, and
#[#set math.equation(numbering: n => "(2.3)")
 $ E := E_N = inf_(n gt.eq 0) E_n . $ <eq:sector-global-minimum>]

 Any bound on this $N$ bounds every strictly bound sector of the same system.]
] <lem:sector-global-minimum>

#proof[
  The set of strict sectors is nonempty since $E_1 < 0$, and finite by Lemma 5.
    After its largest member there are no strict drops. Monotonicity therefore gives $E_n = E_N$ for $n > N$,
    whereas $E_n gt.eq E_N$ for $n < N$. Existence of $Psi$ follows from Lemma 4.
    Every other strict sector has particle number at most $N$. ◻
]

For each fixed nuclear system put $E = inf_(n gt.eq 0) E_n$.
  A #emph[$delta$-state] is any normalized $psi in cal(Q)_n$ in a finite sector $n$ with $q_n \[ psi \] lt.eq E +
  delta$, where $delta gt.eq 0$. Expectation in the squared law of a state includes the spin sum;
  when only positions are observed, particle labels are retained unless an unordered observation is explicitly
  specified.

#thm([Lemma 2.4.])[
  (Energy cost of a multiplier).  #emph[Let $Psi in cal(Q)_n$ be a normalized eigenstate with eigenvalue $e_Psi$.
    If $F$ is a bounded real Lipschitz function of the spatial configuration,
    invariant under particle permutations, then
#[#set math.equation(numbering: n => "(2.4)")
 $ q_n \[ F Psi \] - e_Psi parallel F Psi parallel_2^2 = 1 / 2 bb(E)_Psi \| nabla F \|^2 . $ <eq:sector-multiplier>]

 Here $nabla$ denotes the full spatial gradient in $bb(R)^(3 n)$.]
] <lem:sector-multiplier>

#proof[
  Both $F Psi$ and $F^2 Psi$ belong to $cal(Q)_n$. Test the weak eigen-equation with $F^2
    Psi$ and expand the gradients. Subtraction from $q_n \[ F Psi \]$ cancels all multiplication potentials and
    mixed-gradient terms, leaving (2.4). ◻
]

=== 2.3 Atomic sectors and neutral ground states <atomic-sectors-and-neutral-ground-states>

In the atomic specialization $M = 1$, $R_1 = 0$, and $z_1 = Z$, we write $E_n = E \( n \, Z \)$.
  The compactness proof of Lemma 4 applies to every normalized minimizing sequence,
  so the set of normalized ground states of a strictly bound sector is compact in $L^2$.

This is Zhislin’s atomic binding condition $n < Z + 1$ #cite(label("Zhislin1960"))
  #cite(label("ZhislinSigalov1965")), specialized to integer $Z$. We give the proof needed here.

#thm([Lemma 2.5.])[
  (Atomic binding).  #emph[For integer $Z gt.eq 1$, $E_n < E_(n - 1)$ for $1 lt.eq n lt.eq Z$.
    Each of these sectors has a ground state, and every normalized minimizing sequence has an $L^2$ convergent
    subsequence with normalized ground-state limit. The multiplier identity of Lemma 7 holds for every such ground
    state with $e_Psi = E_n$.]
] <lem:atomic-binding>

#proof[
  Strict binding follows inductively beginning with the vacuum. Suppose $Phi$ is a ground state in sector $n - 1$.
    With the radial core cutoff $g_S$ used in the compactness proof, put $F_S = product_i g_S \( x_i \)$.
    Its norm tends to one, and the multiplier identity gives normalized energy $E_(n - 1) + O_Z \( S^(- 2) \)$.
    Wedge this state with a normalized radial spatial orbital of fixed spin, supported in $3 S < \| x \| < 4 S$,
    with kinetic energy $O \( S^(- 2) \)$. The supports are separated. Newton’s spherical mean identity is
  #[#set math.equation(numbering: n => "(2.5)")
   $ frac(1, 4 pi) integral_(bb(S)^2) \| s omega - x \|^(- 1) thin d omega =
     frac(1, max \( s \, \| x \| \)) . $ <eq:atomic-newton>]
  It follows directly by integrating $\( s^2 + \| x \|^2 - 2 s \| x \| t \)^(- 1 \/ 2) \/ 2$ over $- 1 < t < 1$.
    Every core radius is at most $2 S$, so the added electron’s attraction plus direct repulsion is at most
    $- \( Z - n + 1 \) \/ \( 4 S \)$. For $n lt.eq Z$ this strictly dominates the kinetic and cutoff errors when
    $S$ is large. Lemma 4 supplies the next ground state. Its tightness argument gives the asserted compactness
    for every minimizing sequence, completing the induction. ◻
]

#thm([Lemma 2.6.])[
  (A minimum over all sectors).  #emph[Every strict sector, namely every $n$ with $E_n < E_(n - 1)$,
    satisfies $n lt.eq 2 Z + 1$. There is consequently a largest strict index $N_(*)$, and
#[#set math.equation(numbering: n => "(2.6)")
 $ Z lt.eq N_(*) lt.eq 2 Z + 1 lt.eq 3 Z \, wide E := inf_(n gt.eq 0) E_n = E_(N_(*)) . $ <a:eq:found-sector>]

 The infimum $E$ is attained by a normalized ground state in sector $N_(*)$.]
] <lem:atomic-sector>

#proof[
  Let $Phi$ be a ground state in a strict sector, supplied by Lemma 4. For $l \, epsilon > 0$ set
  $ U \( x \) = \( \| x \|^2 + l^2 \)^(- 1 \/ 2) + epsilon \, wide w \( x \) = U \( x \)^(- 1) . $
  For fixed parameters $w$ and its first derivatives are bounded.
    Test the weak eigen-equation by $\( sum_i w \( x_i \) \) Phi$ and take real parts.
    This is a symmetric admissible multiplier. In its $i$th summand, the form on the other $n -
    1$ coordinates is at least $E_(n - 1) bb(E)_Phi w \( x_i \)$, by slicing in $x_i$ and its spin.
    The selected-coordinate kinetic pairing is nonnegative. Indeed, writing $phi.alt =
    w \( x_i \) Phi$ and hence $Phi = U \( x_i \) phi.alt$, integration by parts gives
  $ "Re" integral nabla_i Phi dot.op overline(nabla_i \( w \( x_i \) Phi \)) & =
    integral U \( x_i \) \| nabla_i phi.alt \|^2 - 1 / 2 integral Delta U \( x_i \) \| phi.alt \|^2 gt.eq 0 \,\
Delta U \( x \) & = - 3 l^2 \( \| x \|^2 + l^2 \)^(- 5 \/ 2) lt.eq 0 . $
  The identity follows first for smooth compactly supported functions; the bounded coefficients for fixed $l \,
    epsilon$, approximation in $H^1$, and large-radius cutoffs give it in the present domain.
    Since $E_(n - 1) - E_n > 0$, discarding that additional nonnegative term leaves
  #[#set math.equation(numbering: n => "(2.7)")
   $ bb(E)_Phi sum_(i < j) frac(w \( x_i \) + w \( x_j \), \| x_i - x_j \|) lt.eq
     bb(E)_Phi sum_i w \( x_i \) frac(Z, \| x_i \|) . $ <a:eq:found-weighted>]
  Let $l arrow.b 0$ at fixed $epsilon$. Domination by $2 K \( x_i - x_j \) \/
    epsilon$ for pairs and $V \( x_i \) \/ epsilon$ for attraction, which are integrable on the form domain,
    justifies the limit. Then $w \( x \) = \| x \| \/ \( 1 + epsilon \| x \| \)$.
    As $epsilon arrow.b 0$, both sides increase and the right side tends to $n Z$.
    The left side tends to the expectation of $sum_(i < j) \( \| x_i \| + \| x_j \| \) \/ \| x_i - x_j \|$,
    which is at least $n \( n - 1 \) \/ 2$ by the triangle inequality. Thus $n lt.eq 2 Z + 1$.
  The strict indices form a nonempty finite set by Lemma 8.
    After its largest element $N_(*)$ there can be no further strict drop; monotonicity implies $E_n =
    E_(N_(*))$ for every $n > N_(*)$. For $n < N_(*)$ monotonicity gives $E_n gt.eq E_(N_(*))$.
    This proves (2.6), without any assumption on possible plateaus before $N_(*)$.
    Attainment follows once more from Lemma 4. ◻
]

== 3 Common localization and quantum comparisons <sec:localization>

We next isolate the local variational tools. A spatial cut records the electrons removed from a region and leaves
  an antisymmetric conditional state for the others. Its conditional electrostatic field enters an exact energy
  identity. The state may belong to any finite particle-number sector.
  Because $E$ is the minimum over all sectors, we may insert a variable number of trial electrons into the
  resulting hole. Upper and lower semiclassical comparisons will have the same kinetic coefficient

$ c_(upright("TF")) = 3 / 10 \( 3 pi^2 \)^(2 \/ 3) . $

An additional kinetic bound, whose coefficient need not be sharp, controls localization errors.

=== 3.1 Coulomb energy and a kinetic bound <coulomb-energy-and-a-kinetic-bound>

Write $dot(H)^1 \( bb(R)^3 \)$ for the completion of $C_c^oo \( bb(R)^3 \)$ in the gradient norm,
  represented in $L^6 \( bb(R)^3 \)$ by Sobolev’s inequality.
  For a compactly supported real $f in L^(5 \/ 3) \( bb(R)^3 \)$, put

$ D \( f \) = 1 / 2 integral f \( K * f \) . $

This definition allows signed $f$.

#thm([Lemma 3.1.])[
  (Coulomb duality and radial smearing).  #emph[For compactly supported real $f in L^(5 \/ 3) \( bb(R)^3 \)$,
    its Coulomb potential is continuous and belongs to $dot(H)^1$, and
#[#set math.equation(numbering: n => "(3.1)")
 $ D \( f \) = frac(1, 8 pi) parallel nabla \( K * f \) parallel_2^2 \, wide lr(|integral f v|) lt.eq
   C sqrt(D \( f \)) parallel nabla v parallel_2 quad \( v in dot(H)^1 \) . $ <eq:loc-coulomb-duality>]

 The potential and energy assertions also hold for a nonnegative $f in
   L^(5 \/ 3)$ whose distribution belongs to $\( dot(H)^1 \)^(*)$,
   with $K * f$ defined by its nonnegative convolution. Its dual pairing with any $v in
   dot(H)^1$ is the absolutely convergent integral $integral f v$.]
  #emph[If $eta$ is a radial nonnegative probability density supported in $B \( 0 \, b \)$, then $K * eta lt.eq
    K$, with equality outside that ball. In particular, $D \( eta * rho \) lt.eq
    D \( rho \)$ for every nonnegative compactly supported $rho in L^(5 \/ 3)$.]
] <lem:loc-coulomb>

#proof[
  For compactly supported $f in L^(5 \/ 3)$ we also have $f in L^(6 \/ 5)$.
    Riesz representation on $dot(H)^1$ gives a unique solution $u$ of $- Delta u = 4 pi f$.
    The convolution $K * f$ is continuous: near the singularity use $K in
    L_(upright("loc"))^(5 \/ 2)$ and continuity of translations in that space;
    away from it use dominated convergence. It is bounded locally and decays like $O \( \| x \|^(- 1) \)$ at
    infinity, hence belongs to $L^6$. It has the same distributional Laplacian as $u$.
    A harmonic $L^6$ function is zero, by mollification and the mean-value property on arbitrarily large balls.
    Thus $u = K * f$. Testing its weak equation with $u$ gives the first identity in (3.1);
    testing with $v$ and using Cauchy–Schwarz gives the second.
  For the noncompact nonnegative case, positivity first gives
  $ integral f \| phi \| lt.eq parallel f parallel_(\( dot(H)^1 \)^(*)) parallel nabla phi parallel_2
    wide \( phi in C_c^oo \) . $
  To obtain this estimate, approximate the absolute value by smooth convex truncations with derivative bounded by
    one. Completion and an almost-everywhere convergent subsequence extend the estimate to $dot(H)^1$ and identify
    its dual pairing with actual integration. Let $u$ be the Riesz solution, and let $u_j =
    K * \( upright(bold(1))_(B \( 0 \, j \)) f \)$. Testing the difference equation with $\( u_j - u \)_(+)$ gives
    $u_j lt.eq u$. These positive-part tests belong to $dot(H)^1$:
    an $L^6$ function with gradient in $L^2$ is in the completion by large-radius cutoff and mollification.
    For the cutoff error, Hölder’s inequality bounds the gradient of the cutoff times the function by its $L^6$
    norm on the escaping annulus. Now $u_j arrow.t K * f$ and $u_j lt.eq u in L^6$,
    so dominated convergence in $L^6$, the distributional equation, and harmonic uniqueness give $K * f = u$.
    Its energy identity follows by testing with $u$. The convolution is continuous also in this case.
    Choose a point $x_0$ where its value is finite. On any fixed bounded set of evaluation points,
    the sufficiently distant kernel tails are dominated by a constant times $K \( x_0 - dot.op \) f$,
    which is integrable. Dominated convergence handles that tail,
    and the local $L^(5 \/ 3)$–$L^(5 \/ 2)$ argument handles the remaining compact part.
  The spherical average of $K$ at distance $d$ from a sphere of radius $s$ is $1 \/ max \( d \, s \)$,
    by direct angular integration. Decomposing a radial probability into spherical averages proves the smearing
    assertion. The difference of two independent radial displacements is again radial;
    applying the same assertion to its distribution and integrating against $rho \( x \)
    rho \( y \)$ proves the energy inequality. ◻
]

For a positive trace-class operator $gamma$ on $L^2 \( bb(R)^3 \; bb(C)^2 \)$,
  write $rho_gamma$ for its spatial density, with spins summed.
  Its kinetic energy is $"Tr" \( - Delta \/ 2 \) gamma$, defined by the nonnegative form.
  We use the Lieb–Thirring kinetic inequality #cite(label("LiebThirring1975")) in the following non-sharp form.
  The short proof by spectral projections also follows the distribution-energy approach of
  #cite(label("Rumin2011"), form: "prose").

#thm([Lemma 3.2.])[
  (Occupation and kinetic energy).  #emph[If $0 lt.eq gamma lt.eq 1$ has finite trace, then
#[#set math.equation(numbering: n => "(3.2)")
 $ "Tr" \( - Delta \/ 2 \) gamma gt.eq c integral rho_gamma^(5 \/ 3) $ <eq:loc-coarse-kinetic>]

 for a universal $c > 0$. The one-body density matrix of an antisymmetric $k$-particle vector $f$ is bounded above
   by $parallel f parallel_2^2$ times the identity. The same bound holds after integration in auxiliary variables,
   and such matrices may be summed whenever the corresponding squared norms sum to one.]
] <lem:loc-kinetic>

#proof[
  For a unit spin orbital $v$, the number operator $sum_(i = 1)^k \| v chevron.r chevron.l
    v \|_i$ is a projection on the antisymmetric space: in a Slater basis containing $v$,
    its eigenvalue is zero or one. Its expectation is at most $parallel f parallel_2^2$.
    This proves the occupation assertion and its versions with auxiliary integration and mixtures.
  For the kinetic bound, take an eigen-expansion $gamma = sum_alpha lambda_alpha \| u_alpha chevron.r chevron.l
    u_alpha \|$, and let $P_s$ be Fourier projection onto $\| p \|^2 \/ 2 lt.eq s$.
    The density of its low-frequency parts is at most $C s^(3 \/ 2)$:
    Bessel’s inequality bounds each spin evaluation against the corresponding Fourier vector,
    and there are two spins. The triangle inequality in the weighted orbital-index and spin norm gives,
    almost everywhere,
  $ sum_(alpha \, sigma) lambda_alpha \| \( \( 1 - P_s \) u_alpha \) \( x \, sigma \) \|^2 gt.eq
    #scale(x: 120%, y: 120%)[\(] sqrt(rho_gamma \( x \)) - C s^(3 \/ 4) #scale(x: 120%, y: 120%)[\)]_(+)^2 . $
  Integrating the left side in $x$ and then in $s > 0$ gives the kinetic trace by Plancherel and the layer-cake
    formula. The integral of the right side in $s$ is a positive constant times $rho_gamma \( x \)^(5 \/ 3)$.
    Truncation proves the assertion also when the kinetic trace is infinite. ◻
]

#thm([Lemma 3.3.])[
  (Global atomic density at an energy offset).  #emph[For one nucleus of charge $Z gt.eq 1$,
    every $delta$-state in a sector $n lt.eq 3 Z$ satisfies
#[#set math.equation(numbering: n => "(3.3)")
 $ integral rho_psi^(5 \/ 3) lt.eq C \( Z^(7 \/ 3) + delta \) . $ <eq:atomic-global-density>]

]
] <lem:atomic-global-density>

#proof[
  Drop the nonnegative pair repulsion, use $E lt.eq 0$, and split attraction at $R = Z^(- 1 \/ 3)$.
    Outside that ball it is at most $Z n \/ R lt.eq 3 Z^(7 \/ 3)$. Inside, Young’s inequality gives
  $ integral_(\| x \| < R) frac(Z, \| x \|) rho_psi lt.eq c / 2 integral rho_psi^(5 \/ 3) +
    C integral_(\| x \| < R) \( Z \/ \| x \| \)^(5 \/ 2) lt.eq c / 2 integral rho_psi^(5 \/ 3) + C Z^(7 \/ 3) \, $
  where $c$ is the constant in Lemma 11. Combine this with that kinetic lower bound and the energy bound
    $q_n \[ psi \] lt.eq E + delta lt.eq delta$. ◻
]

=== 3.2 Cuts, conditional states, and the exact energy identity <cuts-conditional-states-and-the-exact-energy-identity>

The underlying tools are the IMS formula #cite(label("Solovej2003")) Lemma 2.4 and localization into correlated
  particle-number sectors #cite(label("Lewin2011Geometric")) Proposition 3.1 and Example 3.3.
  Here we retain the removed coordinates as data, so that their conditional core field remains available in the
  exact energy identity.

Consider a finite sequence of deterministic nonnegative Lipschitz functions $\( s_h \, c_h \)$ on $bb(R)^3$,
  with $s_h^2 + c_h^2 = 1$. At stage $h$ the factor $s_h$ removes particles from what remains of the core.
  Define the first-out factors and the final core factor by

#[#set math.equation(numbering: n => "(3.4)")
 $ p_h = s_h product_(l < h) c_l \, wide c = product_h c_h \, wide o =
   #scale(x: 180%, y: 180%)[\(] sum_h p_h^2 #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) . $ <eq:loc-first-out>]

Thus $o^2 + c^2 = 1$. For a normalized $psi in cal(Q)_n$ and $I subset { 1 \, dots.h \, n }$, put

$ psi_I = product_(i in I) o \( x_i \) product_(i in.not I) c \( x_i \) psi . $

Under the squared laws of these functions, whose total mass is one,
  record $I$ and the positions and spins of its out particles.
  Decorate each such particle with stage $h$ with probabilities $p_h^2 \/ o^2$ at its position.
  Denote the resulting data by $X$.

Given $X$, normalize the slice in the remaining core variables.
  It is an antisymmetric form-domain state almost surely. Write $e_X$ for its energy,
  $rho_X^c$ for its one-body density, and

$ Phi_X = V - K * rho_X^c . $

For the vacuum slice set $e_X = 0$ and $rho_X^c = 0$.

#thm([Lemma 3.4.])[
  (Conditional localization identity).  #emph[With the preceding definitions, set
$ T_o = 1 / 2 sum_I sum_(i in I) parallel nabla_i psi_I parallel_2^2 . $

 There is a nonnegative localization error satisfying
#[#set math.equation(numbering: n => "(3.5)")
 $ upright("IMS") lt.eq 1 / 2 bb(E)_psi sum_i sum_h #scale(x: 120%, y: 120%)[\(] \| nabla s_h \|^2 + \| nabla
   c_h \|^2 #scale(x: 120%, y: 120%)[\)] \( x_i \) $ <eq:loc-error>]

 such that
#[#set math.equation(numbering: n => "(3.6)")
 $ q_n \[ psi \] + upright("IMS") = bb(E) e_X + T_o - bb(E) sum_(i med upright("out")) Phi_X \( x_i \) +
   bb(E) sum_(i < j med upright("out")) K \( x_i - x_j \) . $ <eq:loc-cut>]

 The out kinetic energy satisfies
$ T_o gt.eq c integral \( o^2 rho_psi \)^(5 \/ 3) \, $

 where $rho_psi$ is the raw one-body density. Conditional quantities have versions jointly measurable in the data
   and the field evaluation point. Appending deterministic cuts admits a coupling in which these decorated data
   are nested, and hence conditional expectations of raw quantities satisfy the tower property.]
] <lem:loc-identity>

#proof[
  Successive squared-gradient splitting gives
  $ sum_h \| nabla p_h \|^2 + \| nabla c \|^2 = sum_h #scale(x: 180%, y: 180%)[\(] product_(l < h) c_l^2
    #scale(x: 180%, y: 180%)[\)] \( \| nabla s_h \|^2 + \| nabla c_h \|^2 \) . $
  The norm-map inequality bounds $\| nabla o \|^2$ by $sum_h \| nabla p_h \|^2$.
    Expanding the product partition in the kinetic form, the mixed derivatives cancel because $o nabla o +
    c nabla c = 0$. This proves the stated IMS bound. Multiplication potentials split exactly by the squared partition.
  Fix the recorded subset $I$, and write $u$ for its out positions and spins and $xi$ for the remaining positions
    and spins. Put
  $ kappa_I \( u \) = integral \| psi_I \( u \, xi \) \|^2 thin upright(d) xi \, wide chi_X \( xi \) =
    frac(psi_I \( u \, xi \), sqrt(kappa_I \( u \))) quad upright("when ") kappa_I \( u \) > 0 \, $
  where the integral includes the core spin sum. Thus $chi_X$ is the normalized core vector,
    with its phase retained. The stage decoration depends only on $u$ and does not change this normalized slice.
    Fubini gives its $H^1$ regularity almost surely; permutations of core variables preserve the multiplying
    factors and therefore its antisymmetry. The conditional core–out repulsion is exactly
  $ sum_(i med upright("out")) integral K \( x_i - x \) rho_X^c \( x \) thin upright(d) x . $
  Grouping the core form, out kinetic form, and the remaining multiplication potentials proves (3.6).
    All absolute Coulomb terms and kinetic terms are integrable in this calculation by the form bounds and the
    finite partition. The slice ratios and their integrals give the stated measurable versions;
    assign arbitrary values on null slices.
  For each $I$, apply the occupation assertion of Lemma 11 to the out group, integrating the other variables.
    Its one-body matrix $gamma_I^o$ obeys $gamma_I^o lt.eq parallel psi_I parallel_2^2$.
    Thus $gamma_o = sum_I gamma_I^o lt.eq 1$, even though the out particle number varies with $I$.
    Its kinetic trace is $T_o$, and its density is $o^2 rho_psi$,
    by summing the squared partition with one label required to be out. Equation (3.2) proves the kinetic assertion.
  Finally, the entire construction has a single sampling description.
    Conditional on the raw configuration, independently label each coordinate by its first-out stage or by final
    core, with probabilities $p_h^2$ and $c^2$. An appended cut only splits the previous core probability.
    Forgetting its new-stage labels and their variables recovers the old observation.
    This is the required nesting and proves the tower assertion. ◻
]

=== 3.3 Insertion of trial electrons <insertion-of-trial-electrons>

We use the coherent-packet construction #cite(label("Solovej2003")) Lemma 8.2.
  The next lemma turns a nonnegative density into a genuine fermionic trial state.
  Its particle number is random, with integer values; the global sector minimum in (2.3) is what makes this permissible.

Fix once and for all a real smooth radial $g$ supported in the unit ball, with $integral g^2 = 1$,
  and set $g_b \( x \) = b^(- 3 \/ 2) g \( x \/ b \)$.

#thm([Lemma 3.5.])[
  (Trial particles in a hole).  #emph[Fix a conditional core slice with finite energy $e_X$ and field $Phi_X$ as
    above. Let $rho gt.eq 0$ belong to $L^(5 \/ 3)$ and have compact support.
    Suppose its packet region $"supp" rho + overline(B \( 0 \, b \))$ has positive distance from the spatial
    support allowed to the core particles. Then
#[#set math.equation(numbering: n => "(3.7)")
 $ E lt.eq e_X + c_(upright("TF")) integral rho^(5 \/ 3) + C b^(- 2) integral rho -
   integral Phi_X \( g_b^2 * rho \) + D \( rho \) . $ <eq:loc-trial>]

 The constant depends only on the fixed function $g$. The vacuum trial also gives $E lt.eq e_X$.]
] <lem:loc-hole-trial>

#proof[
  For each center $y$, momentum $p$, and spin $sigma$, use the orbital
  $ v_(y \, p \, sigma) \( x \, tau \) = g_b \( x - y \) e^(i p dot.op x) upright(bold(1))_({ tau = sigma }) . $
  Integrate its projector over both spins and $\| p \| lt.eq \( 3 pi^2 rho \( y \) \)^(1 \/ 3)$ with measure
    $upright(d) y thin upright(d) p \/ \( 2 pi \)^3$, obtaining an operator $gamma$.
    The unrestricted packet resolution is the identity: apply Plancherel in $p$ and then integrate $g_b^2$ in $y$.
    Restriction therefore gives $0 lt.eq gamma lt.eq 1$. Momentum-ball integration gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ "Tr" gamma & = integral rho \, & rho_gamma & = g_b^2 * rho \,\
"Tr" \( - Delta \/ 2 \) gamma & = c_(upright("TF")) integral rho^(5 \/ 3) + 1 /
  2 parallel nabla g parallel_2^2 b^(- 2) integral rho . $ <eq:loc-packet-energy>]
  The reality of $g$ eliminates the kinetic cross term. These traces are finite.
    Every positive-eigenvalue orbital of $gamma$ belongs to $H^1$ and is supported in the packet region.
  Take a finite eigen-truncation of $gamma$. Occupy each retained orbital independently with Bernoulli probability
    equal to its eigenvalue. Each realization is a normalized Slater determinant, including the possible vacuum.
    The average one-body energy is the trace energy. Its average repulsion is the direct energy of the truncated
    density minus
  $ 1 / 2 sum_(sigma \, tau) integral.double K \( x - y \) \| gamma \( x \, sigma \; y \, tau \) \|^2 thin
    upright(d) x thin upright(d) y \, $
  where here $gamma$ denotes the finite truncation. In particular the average repulsion is at most the direct
    energy. Equal-orbital direct and exchange contributions cancel, as required by the Bernoulli occupation rule.
  Wedge each realization with the normalized core slice. Because their spatial supports are separated,
    the terms assigning the two groups to different sets of particle labels have disjoint supports.
    Normalized antisymmetrization consequently preserves the sum of the group energies and adds exactly their
    direct cross repulsion. Each resulting vector belongs to its own antisymmetric particle-number sector and has
    energy at least $E$. Averaging gives the desired inequality with the finite-truncation density and kinetic energy.
  For completeness, passage to the full operator needs no selection of infinite Slater states.
    The truncated densities increase almost everywhere to $g_b^2 * rho$,
    and their kinetic energies increase to (3.8). The full density is bounded and compactly supported,
    so nuclear integrals converge. The core potential is bounded on the packet region by support separation,
    so its integrals converge as well. Direct energies converge monotonically.
    Lemma 10 gives $D \( g_b^2 * rho \) lt.eq D \( rho \)$, proving (3.7).
    The same argument with no inserted orbitals proves $E lt.eq e_X$. ◻
]

The inequality is pointwise for every admissible core slice outside a null set.
  Later we choose $rho$ as a measurable function of its conditional field.
  Only the displayed functional is then averaged; no measurable choice of Slater determinants is necessary.

=== 3.4 A lower comparison with the same kinetic coefficient <a-lower-comparison-with-the-same-kinetic-coefficient>

An arbitrary out configuration also determines a bounded density,
  obtained by spreading each retained particle over a small radial kernel.
  To retain the coefficient $c_(upright("TF"))$ in the lower bound,
  use Neumann eigenvalues in cubes and then average the grid.
  This is the Neumann-bracketing approach to the semiclassical kinetic coefficient #cite(label("LiebSimon1977"))
  Theorems III.10–III.13; the retained subset and its radial fine density are specified below.

For $b > 0$, define the radial probability kernel

#[#set math.equation(numbering: n => "(3.9)")
 $ theta.alt_b \( x \) = integral_(upright("SO") \( 3 \)) b^(- 6) product_(j = 1)^3 #scale(x: 120%, y: 120%)[\(]
   b - \| \( Q x \)_j \| #scale(x: 120%, y: 120%)[\)]_(+) thin upright(d) Q \, $ <eq:loc-fine-kernel>]

where Haar measure has mass one. It is bounded by $C b^(- 3)$ and supported in $overline(B \( 0 \, sqrt(3) b \))$.

#thm([Lemma 3.6.])[
  (Fine density and lower energy bounds).  #emph[In the setting of Lemma 13, let $n_o$ be the out particle count.
    Choose, measurably, any subset of the out particles and set
$ sigma \( x \) = sum_(i med upright("retained")) theta.alt_b \( x - x_i \) . $

 Then
#[#set math.equation(numbering: n => "(3.10)")
 $ T_o & gt.eq bb(E) [c_(upright("TF")) integral sigma^(5 \/ 3) - C b^(- 2) \( n_o^(4 \/ 3) + n_o \)] \,\
sum_(i < j med upright("out")) K \( x_i - x_j \) & gt.eq D \( sigma \) - C n_o \/ b quad
  upright("almost surely") . $ <eq:loc-fine-kinetic>]

]
] <lem:loc-cubes>

#proof[
  On a cube of side $b$, the spin-two Neumann eigenvalues are $pi^2 \| m \|^2 \/ \( 2 b^2 \)$,
    for $m in bb(N)_0^3$, each with two spin states. The number of lattice points of radius at most $s$,
    with this multiplicity, is bounded by
  $ pi / 3 \( s + sqrt(3) \)^3 : $
  attach a disjoint unit cube to each octant lattice point and enclose their union in the octant ball of radius
    $s + sqrt(3)$. Thus the $j$th ordered radius is at least $\( \( 3 j \/ pi \)^(1 \/ 3) - sqrt(3) \)_(+)$.
    Summing their squared radii and using $sum_(j lt.eq n) j^(2 \/ 3) gt.eq \( 3 \/ 5 \)
    n^(5 \/ 3)$ gives the lower bound
  #[#set math.equation(numbering: n => "(3.11)")
   $ b^(- 2) #scale(x: 120%, y: 120%)[\(] c_(upright("TF")) n^(5 \/ 3) -
     C \( n^(4 \/ 3) + n \) #scale(x: 120%, y: 120%)[\)] $ <eq:loc-neumann-levels>]
  for the sum of the first $n$ eigenvalues. The leading coefficient is exactly $c_(upright("TF"))$.
  Partition the out coordinates into assignments to the cubes of a grid.
    Restriction to a cube is admissible for its Neumann form; no zero extension across its boundary is involved.
    Within each cube the corresponding variables remain antisymmetric.
    The occupation bound, now in the Neumann basis, gives (3.11) after slicing all auxiliary variables.
    If $n_C$ denotes the out count in a cube, the leading term is
  $ c_(upright("TF")) integral (sum_C n_C / b^3 upright(bold(1))_C \( x \))^(5 \/ 3) upright(d) x . $
  The error is at most $C b^(- 2) \( n_o^(4 \/ 3) + n_o \)$, since $sum_C n_C^(4 \/ 3) lt.eq n_o^(4 \/ 3)$.
  Average the grid over a uniform translation in a fundamental cube and over rotations.
    At a fixed out configuration, its averaged cell density is $sum_(i med upright("out"))
    theta.alt_b \( x - x_i \)$. Before rotation, the probability that two points are in the same translated cube
    gives precisely the triangular product in (3.9). Jensen’s inequality bounds the power integral from below by
    the power of this averaged density. Dropping any chosen particles can only decrease that density and its
    nonnegative power. This proves (3.10).
  For the pair bound, first discard all pairs not both retained.
    Smearing each retained point by $theta.alt_b$ decreases every distinct pair interaction by Lemma 10,
    because the difference of two independent radial displacements is radial.
    Each self energy is bounded by $C \/ b$, using the kernel’s support and $L^oo$ bound.
    Subtracting these self energies from $D \( sigma \)$ proves (3.10). ◻
]

We now have both sides of the local comparison. The upper trial uses an arbitrary nonnegative density in a hole;
  the lower bound uses the fine density of the electrons actually removed.
  Their matching $c_(upright("TF")) integral rho^(5 \/ 3)$ terms will identify the same convex Thomas–Fermi
  functional, while Lemma 10 measures the difference of the two densities.

== 4 Local screening and electron counts <sec:screening>

We now compare the quantum state in a ball with an unconstrained Thomas–Fermi minimizer in the same ball.
  The comparison has two outputs: a uniform second-moment bound for the number of nearby electrons,
  and a quantitative Coulomb-distance estimate for a finer local density.
  Both estimates hold for every $delta$-state. This stability under a small increase of energy will be essential
  when we later condition on observations. Throughout this section,
  $psi$ is a normalized $delta$-state in any finite sector $n$:
  $q_n \[ psi \] lt.eq E + delta$, where $E = inf_k E_k$. No eigenstate assumption or bound on $n$ is used here.
  Expectations refer to its position and spin law, together with any localization labels that are specified.

=== 4.1 Two local geometries <two-local-geometries>

Fix $A = 40$. We use either of the following scale geometries;
  the choice is kept fixed throughout each application of this section. All balls in these definitions are open.

#[#set math.equation(numbering: n => "(4.1)")
 $ & upright("nuclear scale:") wide L = 10^6 \, quad cal(Y) = bb(R)^3 \,\
 & wide  a_y = sup { s > 0 : nu \( B \( y \, L s \) \) lt.eq s^(- 3) } \;\
 & upright("atomic distance scale:") wide L = 10^5 \, quad nu = Z delta_0 \,\
 & wide  cal(Y) = bb(R)^3 \\ { 0 } \, wide a_y = \| y \| \/ L . $ <m:eq:screen-scale>]

Put $B_y = B \( y \, a_y \)$ and $d_y = min_m \| y - R_m \|$; in the atomic geometry $d_y = \| y \|$.
  The nuclear scale is used for molecular estimates, including balls containing nuclei.
  The atomic distance scale gives nucleus-free patches at every positive distance from the origin,
  also below $Z^(- 1 \/ 3)$. These scales are distinct: for a single nucleus the first is
  $max \( Z^(- 1 \/ 3) \, \| y \| \/ 10^6 \)$.

#thm([Lemma 4.1.])[
  (Properties of the nuclear scale).  #emph[In the nuclear-scale geometry, $a :
    bb(R)^3 arrow.r \( 0 \, oo \)$ is $L^(- 1)$-Lipschitz and satisfies
#[#set math.equation(numbering: n => "(4.2)")
 $ Z^(- 1 \/ 3) lt.eq a_y < oo \, quad nu \( B \( y \, L a_y \) \) lt.eq a_y^(- 3) \, quad
   nu \( B \( y \, 2 L a_y \) \) > \( 2 a_y \)^(- 3) \, quad d_y lt.eq L a_y . $ <m:eq:screen-scale-properties>]

 If $d_y \/ L > 1$, then $a_y = d_y \/ L$. For every fixed $c < L \/ 2$,
   $B \( y \, c a_y \)$ is covered by a bounded number of balls $B_z$ with $a_z asymp a_y$.
   The covering bound depends only on $c$ and $L$.]
] <m:lem:screen-scale>

#proof[
  The set of admissible $s$ in (4.1) is downward closed. It contains $Z^(- 1 \/ 3)$ and is bounded above,
    since every sufficiently large ball contains all nuclei. Increasing open balls show that the condition also
    holds at the supremum. The radius $2 a_y$ is not admissible, proving the third inequality in (4.2).
  If $s = a_x - \| x - y \| \/ L > 0$, then $B \( y \, L s \) subset B \( x \, L a_x \)$,
    and hence $nu \( B \( y \, L s \) \) lt.eq a_x^(- 3) lt.eq s^(- 3)$. Thus $a_y gt.eq s$.
    Interchanging $x$ and $y$ proves the Lipschitz bound. If $d_y > L a_y$,
    a slightly larger ball in the defining family would still contain no nucleus, a contradiction.
    If $d_y \/ L > 1$, every radius below $d_y \/ L$ is admissible,
    whereas every strictly larger radius contains a charge at least one and has $s^(- 3) < 1$.
    This proves the asserted equality. Finally, the Lipschitz bound makes all scales in $B \( y \, c a_y \)$
    comparable to $a_y$; a mesh of spacing a sufficiently small multiple of $a_y$ gives the stated cover. ◻
]

In the atomic geometry the scale is also $L^(- 1)$-Lipschitz, and $B \( y \, L a_y \)$ contains no nucleus.
  Thus in both geometries

$ nu \( B \( y \, L a_y \) \) lt.eq a_y^(- 3) . $

For every fixed $c < L \/ 2$, the ball $B \( y \, c a_y \)$ stays in the target domain $cal(Y)$ and has a bounded
  cover by cells $B_z$ of scales comparable to $a_y$. In the atomic case this follows from $\| y \| =
  L a_y$ and the same mesh argument. The proofs below use these common local properties.
  The lower scale bound $a_y gt.eq Z^(- 1 \/ 3)$ is not assumed in the atomic case.

For the present $delta$-state define

#[#set math.equation(numbering: n => "(4.3)")
 $ n_y = \# { i : x_i in B_y } \, wide m_(0 \, y) = max \( a_y^(- 3) \, 1 \) \, wide m_y = m_(0 \, y) +
   sqrt(delta a_y) \, wide e_y = m_y^2 / a_y \,\
P = max (1 \, sup_(y in cal(Y)) frac(bb(E) n_y^2, m_y^2)) . $ <m:eq:screen-count-normalization>]

Initially $P$ is merely finite, since $n_y lt.eq n$ and $m_y gt.eq 1$.
  We shall prove that it is bounded by a universal constant. Notice that

#[#set math.equation(numbering: n => "(4.4)")
 $ m_y gt.eq 1 \, wide a_y m_y gt.eq 1 \, wide a_y m_y^(2 \/ 3) gt.eq 1 \, wide
   e_y asymp max \( a_y^(- 7) \, a_y^(- 1) \, delta \) . $ <m:eq:screen-normalization-inequalities>]

These facts hold also when $a_y > 1$. Define the raw far field

#[#set math.equation(numbering: n => "(4.5)")
 $ J_y = integral_(\| v - y \| gt.eq A a_y) frac(d nu \( v \), \| y - v \|) -
   sum_(\| x_i - y \| gt.eq A a_y) frac(1, \| y - x_i \|) . $ <m:eq:screen-raw-field>]

The exclusion removes its singularities and, for each fixed system, $\| J_y \| lt.eq \( Z + n \) \/ \( A a_y \)$.
  In the atomic geometry the nuclear term is exactly $V \( y \) = Z \/ \| y \|$, since $A < L$.

=== 4.2 A positive-field estimate <a-positive-field-estimate>

A deterministic cut and its recorded out data $X$ have the meaning of Lemma 13.
  The next estimate permits a finite initial sequence of cuts;
  the proof appends further deterministic cuts only to rule out a large positive field.

#thm([Lemma 4.2.])[
  (Conditional positive fields).  #emph[ Fix $C_0 gt.eq 1$.
    Suppose the initial sequence is absent, or its total out support is covered by at most $C_0$ balls $B_z$ and
    the sum of its cuts’ squared gradients is bounded by
$ sum_z D_z^2 a_z^(- 2) upright(bold(1))_(B_z) \, wide frac(D_z^2, a_z m_z) lt.eq C_0 sqrt(P) . $

 If $X$ denotes its data (trivial for an absent sequence),
   and $e_(*)$ is the maximum of $e_y$ and the energies $e_z$ of these covering cells, then
#[#set math.equation(numbering: n => "(4.6)")
 $ parallel \( bb(E) \[ J_y divides X \] \)_(+) parallel_2 lt.eq
   C \( C_0 \) sqrt(frac(P e_(*), a_y)) . $ <m:eq:screen-positive>]

]
] <m:lem:screen-positive-field>

#proof[
  We first give the upper trial at a target $y$. Append a cut that is full out on $B \( y \, A a_y \)$,
    supported in $B \( y \, 2 A a_y \)$, and has gradients bounded by $C \/ a_y$.
    Write $X'$ for the enlarged data, $a = a_y$, and $h = bb(E) \[ J_y divides X' \]$.
    The sliced core vanishes on $B \( y \, A a \)$. Take uniform packet centers of total mass $M_(upright("tr"))
    gt.eq 0$ in $B \( y \, a \)$, with packet width $a$. The packet support lies in $B \( y \, 2 a \)$ and is
    separated from the core. The radial mean of the core field and of each far nuclear field is its value at $y$.
    Near nuclei contribute positively, and $J_y$ subtracts far out electrons as well as the core.
    Therefore Lemma 14 gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ E lt.eq e_(X') - M_(upright("tr")) h +
     C (M_(upright("tr"))^(5 \/ 3) / a^2 + M_(upright("tr")) / a^2 + M_(upright("tr"))^2 / a) .
     $ <m:eq:screen-field-trial>]
  Here $M_(upright("tr"))$ is the expected occupation of the packet trial; it need not be an integer.
    This use of an arbitrary trial mass is justified by $E = inf_k E_k$.
  For $a h > C_1 m_(0 \, y)$ choose $M_(upright("tr")) = lambda a h$.
    The three positive terms in (4.7), divided by $M_(upright("tr")) h$, are at most
  $ frac(C lambda^(2 \/ 3), a \( a h \)^(1 \/ 3)) \, wide frac(C, a \( a h \)) \, wide C lambda . $
  The inequalities $a m_(0 \, y)^(1 \/ 3) gt.eq 1$ and $a m_(0 \, y) gt.eq
    1$ allow us to choose $lambda > 0$ small and then $C_1$ large so that their sum is less than a fixed number
    below one. In the other case use the vacuum trial. For all data this proves
  #[#set math.equation(numbering: n => "(4.8)")
   $ E lt.eq e_(X') - c a h_(+)^2 + C m_(0 \, y)^2 / a . $ <m:eq:screen-field-upper>]
  The insertion estimate makes a large positive field expensive.
    We bound the energy of the removed electrons in terms of positive fields at nearby centers.
    If the present field exceeded a universal multiple of its proposed bound,
    this comparison would force a larger normalized field after one further deterministic cut.
    Repetition gives doubly exponential growth, whereas the elementary nuclear bound and the Lipschitz scale
    permit only exponential growth. We now quantify this argument, retaining the original $e_(*)$ throughout.
  Start with target $v_0 = y$ and the given data $X_0 = X$.
    At stage $j$, append the cut just constructed at the current deterministic target $v_j$;
    denote the enlarged data by $X_(j + 1)$. The upper estimate (4.8) applies with $y = v_j$ and $X' = X_(j + 1)$.
    Cover the supports of all cuts, including this new cut, by at most $C \( j + 1 \)$ local cells,
    and let $cal(U)_j$ be the union of their doubled balls $2 B_z$. These are the possible next targets:
    we estimate the removed energy using their fields under the enlarged data, writing $X' =
    X_(j + 1)$ in this calculation. Each newly added scale is comparable to a preceding covering scale by the
    common local scale properties above; the original target and initial covering scales need not be comparable to
    one another. Let $a_min > 0$ be the minimum scale of the original target and initial covering cells.
    The Lipschitz property and the bounded local meshes give, for every later target or covering cell at iteration $j$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ a_v gt.eq C^(- \( j + 1 \)) a_min \, wide e_v lt.eq C^(j + 1) e_(*) . $ <a:eq:screen-chain-units>]
  Indeed each new scale is comparable to a preceding scale; the quantities $m \( a \) = max \( a^(- 3) \, 1 \) +
    sqrt(delta a)$ and $e \( a \) = m \( a \)^2 \/ a$ change by a bounded factor when $a$ does,
    uniformly in $delta$. The total out count obeys
  #[#set math.equation(numbering: n => "(4.10)")
   $ parallel n_o parallel_2 lt.eq sum_(upright("covering cells ") z) parallel n_z parallel_2 lt.eq
     sqrt(P) sum_z m_z . $ <a:eq:screen-chain-count>]
  The localization error is at most $C^(j + 1) P e_(*)$: for an initial cell this follows from
  $ D_z^2 a_z^(- 2) bb(E) n_z lt.eq sqrt(P) thin frac(D_z^2, a_z m_z) e_z lt.eq C_0 P e_z \, $
  and for a later cell it follows from $a_z m_z gt.eq 1$ and $bb(E) n_z lt.eq sqrt(P) m_z$.
  For a covering cell $B_z$, let $V_z$ be the potential of nuclei in $B \( z \, 4 a_z \)$.
    Let $h_z \( v \)$ be the conditional raw signed field, given the present $X'$,
    of all sources at distance at least $4 a_z$ from $z$. It has a jointly measurable harmonic version on $3 B_z$:
    all sources are separated from compact subballs, so their kernel derivatives are bounded for the fixed system
    and may be integrated against the conditional law. On $B_z$ the field of the conditional core satisfies
  #[#set math.equation(numbering: n => "(4.11)")
   $ Phi_(X') lt.eq V_z + h_z + upright("the far out-electron potential") . $ <m:eq:screen-field-decomposition>]
  For $v in 2 B_z$, the exclusion in $J_v$ contains $B \( z \, 4 a_z \)$, since $A =
    40$ and nearby scales are comparable. Extra electrons in $h_z$ can only lower the field.
    Extra nuclei have total charge at most $a_z^(- 3)$ and distance at least $2 a_z$ from $v$. Hence
  #[#set math.equation(numbering: n => "(4.12)")
   $ h_z \( v \) lt.eq bb(E) \[ J_v divides X' \] + C a_z^(- 4) . $ <m:eq:screen-harmonic-raw>]
  Set
  $ G \( v \, X' \) = sqrt(a_v / e_(*)) parallel \( bb(E) \[ J_v divides X' \] \)_(+) parallel_2 . $
  Positive parts of harmonic functions are subharmonic. Their ball submean inequality, a fixed covering of $B_z$,
    and Minkowski’s inequality give
  #[#set math.equation(numbering: n => "(4.13)")
   $ ∥sup_(B_z) \( h_z \)_(+)∥_2 & lt.eq C a_z^(- 3) integral_(2 B_z) parallel \( h_z \( v \) \)_(+) parallel_2
     thin d v\
 & lt.eq C^(j + 1) sqrt(e_(*) / a_z) (1 + sup_v G \( v \, X' \)) \, $ <m:eq:screen-harmonic-sup>]
  where the supremum is over $v in cal(U)_j$. The term $a_z^(- 4)$ was absorbed using $a_z^(- 7) lt.eq e_z lt.eq
    C^(j + 1) e_(*)$.
  The out addback in (4.11) is at most
  $ C sum_l frac(n_l, max \( a_l \, a_z \)) . $
  Indeed the far exclusion gives distance at least $3 a_z$; if $a_l gt.double a_z$,
    Lipschitzness of the scale forces every point of $B_l$ to be a distance at least a fixed multiple of $a_l$
    from $B_z$. Using $parallel n_l parallel_2 lt.eq sqrt(P e_l a_l)$ and $sqrt(a_l) \/ max \( a_l \, a_z \) lt.eq
    a_z^(- 1 \/ 2)$ bounds this addback in $L^2$ by $C^(j + 1) sqrt(P e_(*) \/ a_z)$.
  For completeness, the nuclear singularities have the required energy scale.
    If $Q_z = nu \( B \( z \, 4 a_z \) \) lt.eq a_z^(- 3)$, weighted convexity gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ integral_(B_z) V_z^(5 \/ 2) lt.eq Q_z^(3 \/ 2) sum_m z_m integral_(B_z) \| v -
     R_m \|^(- 5 \/ 2) thin d v lt.eq C Q_z^(5 \/ 2) a_z^(1 \/ 2) lt.eq C a_z^(- 7) . $ <m:eq:screen-nuclear-power>]
  In the sum over cells, the power of the number of cells arising from convexity is bounded by $C^(j + 1)$.
    Lemma 11 and Young’s inequality therefore absorb this attraction at cost $C^(j + 1) e_(*)$.
    Multiplying the other bounds by $parallel n_z parallel_2 lt.eq sqrt(P e_z a_z)$ and summing cells,
    the conditional localization identity, with out-pair repulsion dropped, yields
  #[#set math.equation(numbering: n => "(4.15)")
   $ q_n \[ psi \] + upright("IMS") gt.eq bb(E) e_(X') - C^(j + 1) e_(*) (P + sqrt(P) sup_v G \( v \, X' \)) .
     $ <m:eq:screen-field-lower>]
  This calculation used the actual list of cuts; it did not assume the conclusion of the lemma for that list.
  Combine (4.8) and (4.15), use $delta lt.eq e_(*)$, and apply conditional Jensen from the enlarged data back to
    the preceding data. With $G \( v_j \, X_j \)$ defined by the same normalization,
  #[#set math.equation(numbering: n => "(4.16)")
   $ G \( v_j \, X_j \)^2 lt.eq C^(j + 1) (P + sqrt(P) sup_(v in cal(U)_j) G \( v \, X_(j + 1) \)) .
     $ <a:eq:screen-recursion>]
  Write $g_j = G \( v_j \, X_j \) \/ sqrt(P)$. Whenever $g_j^2 gt.eq 2 C^(j + 1)$,
    the last inequality permits a deterministic next target $v_(j + 1) in cal(U)_j$ with
  $ g_(j + 1) gt.eq frac(g_j^2, 4 C^(j + 1)) \, wide log g_(j + 1) gt.eq 2 log g_j - \( j + 1 \) log C - log 4 . $
  The series
  $ S = sum_(j gt.eq 0) 2^(- j - 1) #scale(x: 120%, y: 120%)[\(] \( j + 1 \) log C +
    log 4 #scale(x: 120%, y: 120%)[\)] $
  converges. Choose $M_0 > 0$ so that $exp \( 2^(j + 1) M_0 \) gt.eq 2 C^(j + 1)$ for every $j$.
    If $log g_0 > S + M_0$, induction gives $log g_j gt.eq 2^j M_0$;
    thus the condition for selecting each next target always holds.
    All supremums here are of numerical norms for deterministic cuts;
    choosing a target close to one of them never chooses a target from sampled data.
    On the other hand, $J_v lt.eq Z \/ \( A a_v \)$ pointwise, and (4.9) gives
  $ G \( v \, X' \) lt.eq sqrt(a_v / e_(*)) frac(Z, A a_v) lt.eq C^(j + 1) frac(Z, A sqrt(e_(*) a_min)) . $
  For the fixed system and initial cuts the last factor is finite.
    Its logarithm grows at most linearly in $j$, contradicting the positive multiple of $2^j$ forced above.
    This argument works in both geometries and requires no global lower bound on the scale. It proves (4.6). ◻
]

=== 4.3 Comparison in a ball <comparison-in-a-ball>

We now use the positive-field estimate to control the full local quantum energy.
  Besides bounding counts, the comparison retains its Coulomb error and the cost of placing electrons where the
  comparison field is negative. We use the constants

$ p = 3 / 2 \, wide k = (5 / 3 c_(upright("TF")))^(- 3 \/ 2) \, wide c_(upright(F)) = 4 pi k . $

#thm([Lemma 4.3.])[
  (Conditional comparison in an interior ball).  #emph[ Fix $y in cal(Y)$, write $a = a_y$, $m = m_y$, $e = e_y$,
    and choose $0 < beta < 1 \/ 100$ such that
#[#set math.equation(numbering: n => "(4.17)")
 $ frac(beta^(- 2), a m) lt.eq sqrt(P) . $ <m:eq:screen-patch-condition>]

 Set $b = beta a$. There is a deterministic $t_0 in \[ 5 a \, 6 a \]$ and a cut full out on $B \( y \, t_0 \)$,
   supported in $B \( y \, t_0 + b \)$, with gradients at most $C \/ b$.
   Let $X$ be its out data, $rho_X^c$ the conditional core density, $Phi_X = V - K * rho_X^c$, and $Omega =
   B \( y \, t_0 - 4 b \)$. There is a unique minimizer $rho = rho_X gt.eq 0$, extended by zero outside $Omega$, of
#[#set math.equation(numbering: n => "(4.18)")
 $ cal(T)_X \( rho \) = c_(upright("TF")) integral rho^(5 \/ 3) - integral Phi_X rho +
   D \( rho \) . $ <m:eq:screen-tf-functional>]

 It is measurable in $X$ and, with $W = Phi_X - K * rho$, satisfies
#[#set math.equation(numbering: n => "(4.19)")
 $ rho = k W_(+)^(3 \/ 2) quad upright("in ") Omega . $ <m:eq:screen-tf-equation>]

 Retain the out particles with $\| x_i - y \| < t_0 - 7 b$ and put $sigma =
   sum_(i med upright("retained")) theta.alt_b \( dot.op - x_i \)$, using the radial fine kernel from Lemma 15. Write
#[#set math.equation(numbering: n => "(4.20)")
 $ cal(L) = c_(upright("TF")) integral (sigma^(5 \/ 3) - rho^(5 \/ 3) - 5 / 3 rho^(2 \/ 3) \( sigma - rho \)) .
   $ <m:eq:screen-remainder>]

 For every sufficiently small $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(4.21)")
 $ & bb(E) [D \( sigma - rho \) + cal(L) + integral W_(-) sigma]\
 & quad lt.eq
   C
   [delta + \( epsilon.alt + sqrt(beta) \) P e + epsilon.alt^(- 3 \/ 2) beta^(1 \/ 2) a^(- 7) + b^(- 1) sqrt(P)
   m + b^(- 2) (P^(2 \/ 3) m^(4 \/ 3) + sqrt(P) m)] . $ <m:eq:screen-comparison>]

 Moreover, $bb(E) integral sigma^(5 \/ 3)$ is bounded by $C P e$ plus a constant times this right-hand side,
   and the out kinetic energy obeys
#[#set math.equation(numbering: n => "(4.22)")
 $ T_o lt.eq C (P e + b^(- 2) sqrt(P) m) . $ <m:eq:screen-out-kinetic>]

 Finally, independently of the data,
#[#set math.equation(numbering: n => "(4.23)")
 $ W lt.eq V_(upright("loc")) + C a^(- 4) quad upright("on ") B \( y \, 3 a \) \, wide
   integral_(B \( y \, 2 a \)) rho lt.eq C a^(- 3) \, $ <m:eq:screen-interior-upper>]

 where $V_(upright("loc"))$ is the potential of nuclei in $B \( y \, 20 a \)$.
   If this local nuclear measure is zero, as it always is in the atomic distance geometry,
   the same construction has the sharper bound
#[#set math.equation(numbering: n => "(4.24)")
 $ bb(E) [D \( sigma - rho \) + cal(L) + integral W_(-) sigma] lt.eq
   C [delta + sqrt(beta) P e + b^(- 1) sqrt(P) m + b^(- 2) (P^(2 \/ 3) m^(4 \/ 3) + sqrt(P) m)] \,
   $ <a:eq:screen-patch>]

 and its interior bounds include
#[#set math.equation(numbering: n => "(4.25)")
 $ W lt.eq C a^(- 4) \, wide rho lt.eq C a^(- 6) quad upright("on ") B \( y \, 3 a \) \, wide
   integral_(B \( y \, 2 a \)) rho lt.eq C a^(- 3) . $ <a:eq:screen-interior>]

]
] <m:lem:screen-patch>

The Coulomb error $D \( sigma - rho \)$ controls smooth tests of $sigma - rho$ in mean,
  leaving exceptional cut data possible. The penalty $integral W_(-)
  sigma$ integrates the negative field against the fine density of retained electrons.
  Together with the later oscillation estimates and a lower bound on this density’s local mass,
  it provides the additional control needed to pass a lower field estimate to expectation.

#proof[
  We divide the proof into the choice of cut, the two energy comparisons, and the deterministic interior bound.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((7.92, -0.387), (9.68, 3.999), fill: rgb("#f5f5f5"), stroke: none)
  line((7.92, -0.387), (7.92, 3.999), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((8.8, 4.257), [#text(size: 8pt)[core may#linebreak()occur here]])
  content((-0.1936, 3.44), [#text(size: 9pt)[retained centers]], anchor: "east", padding: 0.1176cm)
  line((0, 3.44), (3.96, 3.44), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((0, 3.354), (0, 3.526), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  line((3.96, 3.354), (3.96, 3.526), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((3.96, 3.517), [#text(size: 8pt)[$t_0-7b$]], anchor: "south-west", padding: 0.07056cm)
  content((-0.1936, 2.58), [#text(size: 9pt)[fine density $sigma$]], anchor: "east", padding: 0.1176cm)
  line((0, 2.58), (4.972, 2.58), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((0, 2.494), (0, 2.666), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  line((4.972, 2.494), (4.972, 2.666), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((4.972, 2.657), [#text(size: 8pt)[$t_0-(7- sqrt(3) )b$]], anchor: "south-west", padding: 0.07056cm)
  content((-0.1936, 1.72), [#text(size: 9pt)[TF centers $rho$]], anchor: "east", padding: 0.1176cm)
  line((0, 1.72), (5.896, 1.72), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((0, 1.634), (0, 1.806), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  line((5.896, 1.634), (5.896, 1.806), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((5.896, 1.797), [#text(size: 8pt)[$t_0-4b$]], anchor: "south-west", padding: 0.07056cm)
  content((-0.1936, 0.86), [#text(size: 9pt)[upper packets]], anchor: "east", padding: 0.1176cm)
  line((0, 0.86), (6.556, 0.86), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((0, 0.774), (0, 0.946), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  line((6.556, 0.774), (6.556, 0.946), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((6.556, 0.9374), [#text(size: 8pt)[$t_0-3b$]], anchor: "south-west", padding: 0.07056cm)
  content((-0.1936, 0), [#text(size: 9pt)[full-out region]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (7.92, 0), stroke: (paint: rgb("#00008c"), thickness: 1.2pt, miter-limit: 10))
  line((0, -0.086), (0, 0.086), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  line((7.92, -0.086), (7.92, 0.086), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((7.92, 0.0774), [#text(size: 8pt)[$t_0$]], anchor: "south-west", padding: 0.07056cm)
  content((0, -0.387), [#text(size: 8pt)[$|x-y|=0$]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: Radial supports in the interior comparison (schematic, not to scale). Fine smears of retained particles lie inside the TF domain, and the upper packets remain at distance at least $3 b$ from the conditional core. This particle-support geometry is common to both applications. The atomic distance scale makes $B \( y \, 20 a \)$ free of nuclei; the molecular scale may leave nuclei there, and their packet loss is retained in (4.21). ],
  ) <m:fig:screen-patch>
  ===== 4.3.1 Choice of cut and the conditional field. <choice-of-cut-and-the-conditional-field.>
  For a candidate $t in \[ 5 a \, 6 a \]$, let the cut transition in a shell of width $b$,
    using sine and cosine of an angle. Let $n_(upright("del"))$ count the out particles not retained.
    Such a particle lies in $t - 7 b lt.eq \| x - y \| lt.eq t + b$.
    For each raw pair of particles the set of $t$ for which both lie in this shell has length at most $8 b$.
    Averaging over $t$ therefore bounds its expected squared count by $C beta P m^2$,
    since $B \( y \, 7 a \)$ has a bounded comparable-scale cover.
    The same averaging, applied to the nuclear integral, uses (4.14) to give a bound $C beta a^(- 7)$.
    Averaging the sum of the two normalized nonnegative quantities selects one $t_0$ for which both bounds hold:
  #[#set math.equation(numbering: n => "(4.26)")
   $ bb(E) n_(upright("del"))^2 lt.eq C beta P m^2 \, wide bb(E) n_o^2 lt.eq C P m^2 \, wide upright("IMS") lt.eq
     C b^(- 2) sqrt(P) m \,\
integral_({ t_0 - 7 b lt.eq \| x - y \| lt.eq t_0 + b }) V_(upright("loc"))^(5 \/ 2) lt.eq
  C beta a^(- 7) . $ <m:eq:screen-deleted-shell>]
  The full out-count and IMS bounds in the same display follow from the comparable-scale cover and $bb(E) n_z
    lt.eq sqrt(P) m_z$.
  On the cut support and on $Omega$ we have
  #[#set math.equation(numbering: n => "(4.27)")
   $ Phi_X lt.eq V_(upright("loc")) + F \, wide F gt.eq 0 \, wide parallel F parallel_2 lt.eq
     C frac(sqrt(P) m, a) . $ <m:eq:screen-field-cap>]
  To see this, the raw sources outside $B \( y \, 20 a \)$ give a harmonic conditional field on
    $B \( y \, 10 a \)$; these electrons are all core particles.
    Its value at $v in B \( y \, 10 a \)$ is at most $bb(E) \[ J_v divides X \] + C a^(- 4)$,
    by the same exclusion comparison as (4.12). Take $F$ to be the positive supremum on $B \( y \, 7 a \)$.
    Harmonic means and Lemma 17 prove (4.27). The cells of this initial cut have scale comparable to $a$ and $D_z
    lt.eq C beta^(- 1)$, so (4.17) verifies that lemma’s hypothesis.
  ===== 4.3.2 The unconstrained minimizer. <the-unconstrained-minimizer.>
  The core is at distance at least $4 b$ from $Omega$, so its potential is bounded and smooth there.
    Hence $Phi_X in L^(5 \/ 2) \( Omega \)$. Young’s inequality makes (4.18) coercive in $L^(5 \/ 3)$.
    The positive Coulomb form is weakly lower semicontinuous:
    by Lemma 10 it is a squared Hilbert norm, or one may express it as the supremum of its affine dual forms.
    The direct method on the closed positive cone gives a minimizer,
    and strict convexity of the kinetic term gives uniqueness.
    Nonnegative variations, followed by signed compact multiplicative variations, give
  $ 5 / 3 c_(upright("TF")) rho^(2 \/ 3) - Phi_X + K * rho gt.eq 0 \, wide
    (5 / 3 c_(upright("TF")) rho^(2 \/ 3) - Phi_X + K * rho) rho = 0 \, $
  which is (4.19).
  This minimizer depends continuously in $L^(5 \/ 3)$ on its field in $L^(5 \/ 2)$.
    Indeed convergent fields give uniformly bounded minimizers;
    weak lower semicontinuity and comparison with the limit minimizer identify each weak limit and give
    convergence of the minimum values. Lower semicontinuity of $D$ then forces convergence of the kinetic norms.
    Uniform convexity of $L^(5 \/ 3)$ gives strong convergence.
    The conditional field, being jointly measurable and taking values in the separable space
    $L^(5 \/ 2) \( Omega \)$, is measurable as a function with values in that space.
    The continuity just proved establishes the stated measurability of $rho$.
  The diameter of $Omega$ is at most $12 a$, so $D \( rho \) gt.eq \( integral rho \)^2 \/ \( 24 a \)$.
    The minimum is nonpositive because zero is admissible. Absorbing $V_(upright("loc"))$ with Young’s inequality
    in (4.27) gives
  $ frac(\( integral rho \)^2, C a) lt.eq C a^(- 7) + F integral rho . $
  It follows that
  #[#set math.equation(numbering: n => "(4.28)")
   $ integral rho lt.eq C \( a F + a^(- 3) \) \, wide integral rho^(5 \/ 3) lt.eq
     C \( a F^2 + a^(- 7) \) . $ <m:eq:screen-tf-mass>]
  When $V_(upright("loc")) = 0$, the same nonpositive-minimum argument uses only $Phi_X lt.eq
    F$ and gives the sharper estimates
  #[#set math.equation(numbering: n => "(4.29)")
   $ integral rho lt.eq C a F \, wide integral rho^(5 \/ 3) lt.eq C a F^2 . $ <a:eq:screen-minimizer-mass>]
  In particular all trial errors below are integrable in $X$.
  ===== 4.3.3 Upper quantum comparison. <upper-quantum-comparison.>
  The centers $rho$ lie in $Omega = B \( y \, t_0 - 4 b \)$;
    packets of width $b$ remain at distance at least $3 b$ from the core.
    Thus Lemma 14 applies, and radial smearing leaves the core potential unchanged.
    The nuclear loss is bounded at centers by
  $ V_b^(upright("loss")) \( x \) = sum_(R_m in B \( y \, 20 a \)) frac(z_m, \| x - R_m \|)
    upright(bold(1))_({ \| x - R_m \| lt.eq 2 b }) . $
  Weighted convexity, the total local charge bound, and integration of $\|
    x \|^(- 5 \/ 2)$ over a ball of radius $2 b$ give
  $ integral \( V_b^(upright("loss")) \)^(5 \/ 2) lt.eq C beta^(1 \/ 2) a^(- 7) . $
  Nuclei not in the indicated local ball are harmonic on all packets. Young’s inequality now gives, pathwise,
  #[#set math.equation(numbering: n => "(4.30)")
   $ E lt.eq e_X + cal(T)_X \( rho \) + C b^(- 2) integral rho + C epsilon.alt integral rho^(5 \/ 3) +
     C epsilon.alt^(- 3 \/ 2) beta^(1 \/ 2) a^(- 7) . $ <m:eq:screen-patch-upper>]
  ===== 4.3.4 Lower quantum comparison. <lower-quantum-comparison.>
  Reserve a fraction $epsilon.alt T_o$ of the out kinetic energy.
    The coarse kinetic inequality absorbs both $V_b^(upright("loss"))$ and the nuclear attraction of deleted
    particles, at cost $C epsilon.alt^(- 3 \/ 2) beta^(1 \/ 2) a^(- 7)$, using (4.26).
    The deleted $F$ contribution costs at most
  $ parallel F parallel_2 parallel n_(upright("del")) parallel_2 lt.eq C sqrt(beta) P e . $
  The retained fine density $sigma$ is supported in $Omega$, because its centers have radius less than $t_0 -
    7 b$ and its kernel radius is $sqrt(3) b$. The core potential is harmonic on these kernels,
    and the loss of nuclear attraction is again covered by $V_b^(upright("loss"))$ at the actual particle
    positions. Applying the remaining fraction of Lemma 15 and its pair-repulsion bound in the localization
    identity gives
  #[#set math.equation(numbering: n => "(4.31)")
   $ q_n \[ psi \] + upright("IMS") & gt.eq
     bb(E) [e_X + cal(T)_X \( sigma \) - epsilon.alt c_(upright("TF")) integral sigma^(5 \/ 3)] - C cal(R) \,\
cal(R) & = epsilon.alt^(- 3 \/ 2) beta^(1 \/ 2) a^(- 7) + sqrt(beta) P e + b^(- 1) sqrt(P) m +
  b^(- 2) (P^(2 \/ 3) m^(4 \/ 3) + sqrt(P) m) . $ <m:eq:screen-patch-lower>]
  Here $bb(E) n_o^(4 \/ 3) lt.eq \( bb(E) n_o^2 \)^(2 \/ 3)$; no higher out-count moment is required.
  The Euler equation gives the exact expansion
  #[#set math.equation(numbering: n => "(4.32)")
   $ cal(T)_X \( sigma \) - cal(T)_X \( rho \) = D \( sigma - rho \) + cal(L) +
     integral W_(-) sigma . $ <m:eq:screen-tf-expansion>]
  Besides being nonnegative, the convex remainder satisfies
  $ cal(L) gt.eq c integral sigma^(5 \/ 3) - C integral rho^(5 \/ 3) \, $
  by Young’s inequality applied to the tangent term. For small $epsilon.alt$ this absorbs $epsilon.alt
    c_(upright("TF")) integral sigma^(5 \/ 3)$ into half of $cal(L)$,
    with error $C epsilon.alt integral rho^(5 \/ 3)$. Average (4.30), compare it with (4.31), and use (4.28),
    (4.27), and the IMS bound. The terms $epsilon.alt bb(E) integral rho^(5 \/ 3)$ cost $C epsilon.alt P e$;
    the packet kinetic term costs $C b^(- 2) \( sqrt(P) m + a^(- 3) \) lt.eq C b^(- 2) sqrt(P) m$.
    This proves (4.21), after multiplying its constant to restore the full nonnegative remainder,
    and also the asserted bound for $bb(E) integral sigma^(5 \/ 3)$.
  ===== 4.3.5 The source-free improvement. <the-source-free-improvement.>
  If $nu \( B \( y \, 20 a \) \) = 0$, every nucleus and the conditional core are outside the packet supports.
    The field $Phi_X$ is harmonic on those supports, so radial averaging is exact and the upper comparison is
  #[#set math.equation(numbering: n => "(4.33)")
   $ E lt.eq e_X + cal(T)_X \( rho \) + C b^(- 2) integral rho . $ <a:eq:screen-upper>]
  For the lower comparison, use all the out kinetic energy. Harmonicity and the deleted-count bound give
  $ sum_(i med upright("retained")) Phi_X \( x_i \) = integral Phi_X sigma \, wide
    bb(E) \( F n_(upright("del")) \) lt.eq C sqrt(beta) P e . $
  The full sharp kinetic and pair bounds of Lemma 15 therefore give
  #[#set math.equation(numbering: n => "(4.34)")
   $ q_n \[ psi \] + upright("IMS") gt.eq bb(E) \[ e_X + cal(T)_X \( sigma \) \] -
     C [sqrt(beta) P e + b^(- 1) sqrt(P) m + b^(- 2) \( P^(2 \/ 3) m^(4 \/ 3) + sqrt(P) m \)] . $ <a:eq:screen-lower>]
  Subtract the average upper inequality and use the exact expansion (4.32), the mass estimate (4.29),
    and the IMS bound. This proves (4.24), including its full convex remainder,
    without the nuclear loss or an $epsilon.alt$ error.
  There is a useful separate kinetic bound. In the localization identity use only $e_X gt.eq E$,
    drop pair repulsion, and use (4.27). Half the coarse kinetic inequality absorbs $V_(upright("loc"))$ at cost
    $C a^(- 7)$; also $bb(E) \( F n_o \) lt.eq C P e$. The result is (4.22).
  ===== 4.3.6 Interior field bound. <interior-field-bound.>
  The core vanishes in $B \( y \, 4 a \)$ and this ball lies in $Omega$. There
  $ Delta W = - 4 pi nu + c_(upright(F)) W_(+)^(3 \/ 2) . $
  Put $s = 4 a$ and
  $ U \( x \) = V_(upright("loc")) \( x \) + frac(C s^4, \( s^2 - \| x - y \|^2 \)^4) . $
  The Laplacian of the bump is at most $80 C s^6 \/ \( s^2 - \| x - y \|^2 \)^6$.
    For a sufficiently large universal $C$ this is at most $c_(upright(F))$ times its $3 \/ 2$ power.
    Thus $U$ is a supersolution for the displayed equation. The difference $W -
    V_(upright("loc"))$ is bounded above: the far nuclear field is bounded on this ball,
    the core potential is nonnegative, and $K * rho gt.eq 0$.
    Consequently $\( W - U \)_(+)$ has compact support inside the ball.
    Nuclear singularities cancel in $W - U$, which is locally $H^1$;
    testing the difference inequality by its positive part yields
  $ - integral \| nabla \( W - U \)_(+) \|^2 gt.eq c_(upright(F))
    integral_({ W > U }) \( W_(+)^(3 \/ 2) - U^(3 \/ 2) \) \( W - U \) gt.eq 0 . $
  The test is valid by compact $H^1$ approximation: the densities are locally in $L^(5 \/ 3)$,
    and the nuclear point terms have already canceled. Hence $W lt.eq U$.
    On $B \( y \, 3 a \)$ the bump is $C a^(- 4)$, proving the first part of (4.23).
    If $V_(upright("loc")) = 0$, this yields $W lt.eq C a^(- 4)$; the Euler equation then gives $rho lt.eq
    C a^(- 6)$ and proves (4.25). In this source-free case,
  #[#set math.equation(numbering: n => "(4.35)")
   $ Delta W = c_(upright(F)) W_(+)^(3 \/ 2) = 4 pi rho quad upright("on ") B \( y \, 4 a \) . $ <a:eq:screen-poisson>]
  Finally, weighted powers and $nu \( B \( y \, 20 a \) \) lt.eq a^(- 3)$ give
  $ integral_(B \( y \, 2 a \)) rho lt.eq
    C integral_(B \( y \, 2 a \)) \( V_(upright("loc"))^(3 \/ 2) + a^(- 6) \) lt.eq
    C \( a^(- 9 \/ 2) a^(3 \/ 2) + a^(- 3) \) lt.eq C a^(- 3) . $
  ◻
]

=== 4.4 Closing the count estimate <closing-the-count-estimate>

The comparison in a hole bounds its electron count through a smooth Coulomb test.
  The resulting inequality improves any sufficiently large value of the provisional constant $P$,
  and therefore makes that constant universal.

#thm([Lemma 4.4.])[
  (Local second moments).  #emph[For every normalized $delta$-state in any finite sector and every $y in cal(Y)$,
#[#set math.equation(numbering: n => "(4.36)")
 $ bb(E) n_y^2 lt.eq C (max \( a_y^(- 6) \, 1 \) + delta a_y) . $ <m:eq:screen-count>]

 In particular the number $P$ in (4.3) is at most a universal constant.]
] <m:lem:screen-count>

#proof[
  Fix small $epsilon.alt > 0$ and $0 < beta < 1 \/ 100$, to be chosen in that order.
    We need only consider $P gt.eq beta^(- 4)$, since $beta$ will be fixed universally.
    Then $beta^(- 2) \/ \( a m \) lt.eq sqrt(P)$ at every target, and the patch of Lemma 18 is available.
    Every raw particle in $B_y$ is retained, and its fine smear is contained in $B \( y \, 1.1 a \)$ because
    $beta < 1 \/ 100$. Choose a nonnegative smooth $chi$, equal to one there, supported in $B \( y \, 2 a \)$,
    with $parallel nabla chi parallel_2 lt.eq C sqrt(a)$. Lemma 10 and (4.23) give
  $ n_y lt.eq integral chi sigma lt.eq C a^(- 3) + C sqrt(a D \( sigma - rho \)) \, wide bb(E) n_y^2 lt.eq
    C a^(- 6) + C a thin bb(E) D \( sigma - rho \) . $
  Divide by $P m^2$ and use (4.21). Since $delta a lt.eq m^2$, the result is at most
  #[#set math.equation(numbering: n => "(4.37)")
   $ C #scale(x: 240%, y: 240%)[\[] & P^(- 1) + epsilon.alt + sqrt(beta) +
     frac(epsilon.alt^(- 3 \/ 2) beta^(1 \/ 2), P) + frac(beta^(- 1), sqrt(P) m)\
 & + frac(beta^(- 2), P^(1 \/ 3) a m^(2 \/ 3)) + frac(beta^(- 2), sqrt(P) a m) #scale(x: 240%, y: 240%)[\]] .
   $ <m:eq:screen-bootstrap-ratio>]
  In the atomic distance geometry, using (4.24) instead gives the sharper intermediate inequality
  #[#set math.equation(numbering: n => "(4.38)")
   $ frac(bb(E) n_y^2, P m_y^2) lt.eq
     C
     [P^(- 1) + sqrt(beta) + frac(beta^(- 1), sqrt(P) m_y) + frac(beta^(- 2), P^(1 \/ 3) a_y m_y^(2 \/ 3)) +
     frac(beta^(- 2), sqrt(P) a_y m_y)] . $ <a:eq:screen-count-bootstrap>]
  For the common bound it suffices to use (4.37) in both geometries.
    First choose $epsilon.alt$ small, then $beta$ small, and finally a universal threshold $P_0$ large.
    The inequalities (4.4) show that the expression is at most $1 \/ 2$ whenever $P > P_0$.
    Enlarge $P_0$ so that $P_0 gt.eq beta^(- 4)$; this verifies (4.17) at every target.
    If $P > P_0$, we would obtain $bb(E) n_y^2 \/ m_y^2 lt.eq P \/ 2$ for every $y$,
    contradicting the definition of $P$. Thus $P lt.eq P_0$. Since $m_y^2 lt.eq 2 max \( a_y^(- 6) \, 1 \) +
    2 delta a_y$, this proves (4.36). ◻
]

#thm([Proposition 4.5.])[
  (Uniform local counts and conditional fields).  #emph[In either geometry,
    every normalized $delta$-state in a finite sector satisfies $P lt.eq C$. Fix $y in cal(Y)$.
    Suppose the initial finite sequence of cuts has total out support covered by at most $C_0$ cells $B_z$,
    with $C_0^(- 1) lt.eq a_z \/ a_y lt.eq C_0$, and satisfies the gradient hypothesis of Lemma 17.
    The absent-cut case is allowed. Then
#[#set math.equation(numbering: n => "(4.39)")
 $ P lt.eq C \, wide parallel \( bb(E) \[ J_y divides X \] \)_(+) parallel_2 lt.eq C \( C_0 \) m_y /
   a_y . $ <a:eq:screen-local>]

 Neither constant depends on the nuclear system, particle number, state, target, or $delta$.]
] <a:prop:screen-local>

#proof[
  The count assertion is Lemma 19. Comparable scales have comparable $m$ and $e = m^2 \/ a$, uniformly in $delta$,
    so $e_(*) lt.eq C \( C_0 \) e_y$ in Lemma 17. Substitute $P lt.eq
    C$ into that lemma to obtain the field assertion. ◻
]

#thm([Lemma 4.6.])[
  (Fine comparison and local density).  #emph[ There is a universal $a_0 > 0$ with the following property.
    If $a = a_y < a_0$ and $psi$ is a $delta$-state with $delta lt.eq a^(- 7 + 0.02)$,
    choose the patch of Lemma 18 with $b = a^(1 + 0.2)$. Its densities obey
#[#set math.equation(numbering: n => "(4.40)")
 $ bb(E) [D \( sigma - rho \) + cal(L) + integral W_(-) sigma] lt.eq C a^(- 7 + 0.02) \, wide
   bb(E) integral sigma^(5 \/ 3) lt.eq C a^(- 7) . $ <m:eq:screen-fine-error>]

 The raw one-body density satisfies
#[#set math.equation(numbering: n => "(4.41)")
 $ integral_(B \( y \, 4 a \)) rho_psi^(5 \/ 3) lt.eq C a^(- 7) . $ <m:eq:screen-density>]

 In particular, the two estimates needed in the atomic application are
#[#set math.equation(numbering: n => "(4.42)")
 $ bb(E) [D \( sigma - rho \) + integral W_(-) sigma] lt.eq C a^(- 7 + .02) \, wide
   integral_(B \( y \, 4 a \)) rho_psi^(5 \/ 3) lt.eq C a^(- 7) . $ <a:eq:screen-refined>]

]
] <m:lem:screen-density>

#proof[
  Take $beta = a^0.2$ and $epsilon.alt = a^0.02$. The energy assumption gives $m lt.eq C a^(- 3)$,
    while $beta^(- 2) \/ \( a m \) lt.eq a^1.6$, so the patch hypothesis holds for small $a$.
    By Lemma 19, $P lt.eq C$. The terms on the right of (4.21) are bounded respectively by constant multiples of
  $ a^(- 6.98) \, quad a^(- 6.98) + a^(- 6.9) \, quad a^(- 6.93) \, quad a^(- 4.2) \, quad a^(- 6.4) + a^(- 5.4) . $
  All are at most $C a^(- 7 + 0.02)$ for $a < 1$, proving (4.40). Equation (4.22) gives $T_o lt.eq C a^(- 7)$.
    Since the cut is full out on $B \( y \, 4 a \)$, the out density equals $rho_psi$ there.
    Applying Lemma 11 proves (4.41). ◻
]

#thm([Corollary 4.7.])[
  (Raw near-Coulomb bound).  #emph[Under the hypotheses of Lemma 21, for $0 < u lt.eq 4 a$,
#[#set math.equation(numbering: n => "(4.43)")
 $ bb(E) sum_(\| x_i - y \| < u) frac(1, \| x_i - y \|) lt.eq
   C a^(- 4) \( u \/ a \)^(1 \/ 5) . $ <a:eq:screen-near-coulomb>]

]
]

#proof[
  The expectation is $integral_(B \( y \, u \)) \| x - y \|^(- 1) rho_psi \( x \) thin d x$.
    Hölder’s inequality, the raw density bound, and direct radial integration give
  $ integral_(B \( y \, u \)) frac(rho_psi \( x \), \| x - y \|) thin d x lt.eq
    (integral_(B \( y \, 4 a \)) rho_psi^(5 \/ 3))^(3 \/ 5)
    (integral_(\| z \| < u) \| z \|^(- 5 \/ 2) thin d z)^(2 \/ 5) lt.eq C a^(- 21 \/ 5) u^(1 \/ 5) . $
  This is the stated bound in either geometry. ◻
]

=== 4.5 Source-free oscillation and atomic annuli <source-free-oscillation-and-atomic-annuli>

The next estimate controls also a very negative field. It applies when the patch contains no local nuclear source;
  molecular patches containing nuclei instead use the offset oscillation estimate proved with the nuclear
  splitting below.

#thm([Lemma 4.8.])[
  (Interior oscillation).  #emph[For every patch in Lemma 4.3 with $nu \( B \( y \, 20 a \) \) = 0$,
    and every $0 < s' lt.eq a \/ 2$, almost surely in its data,
#[#set math.equation(numbering: n => "(4.44)")
 $ sup_(x in B \( y \, s' \)) \| W \( x \) - W \( y \) \| lt.eq C s' / a #scale(x: 120%, y: 120%)[\(] a^(- 4) +
   W \( y \)_(-) #scale(x: 120%, y: 120%)[\)] . $ <a:eq:screen-oscillation>]

]
] <a:lem:screen-oscillation>

#proof[
  By (4.35) and (4.25), $0 lt.eq Delta W lt.eq C a^(- 6)$ on $B \( y \, 2 a \)$. Write
  $ Q \( x \) = frac(1, 4 pi) integral_(B \( y \, 2 a \)) frac(Delta W \( z \), \| x - z \|) thin thin upright(d) z . $
  For $x in B \( y \, 2 a \)$, direct integration of $\| x - z \|^(- 1)$ and $\| x - z \|^(- 2)$ gives
  $ 0 lt.eq Q \( x \) lt.eq C a^(- 4) \, wide \| nabla Q \( x \) \| lt.eq C a^(- 5) . $
  Since $Delta Q = - Delta W$ inside that ball, $H = W + Q$ is harmonic there. By (4.25), $H lt.eq C_1 a^(- 4)$.
    Choose $C_2 > C_1$ universally and put $h = C_2 a^(- 4) - H$,
    a positive harmonic function on $B \( y \, 2 a \)$. The Poisson formula on a sphere of radius $3 a \/ 2$ gives
  $ sup_(B \( y \, a \)) \| nabla h \| lt.eq C a^(- 1) h \( y \) . $
  Indeed the differentiated Poisson kernel on $B \( y \, a \)$ is bounded by $C \/
    a$ times its value at the center; integrating the nonnegative boundary values gives precisely this inequality.
    Also $h \( y \) lt.eq C a^(- 4) + W \( y \)_(-)$, since $Q \( y \) gt.eq 0$.
    Integrate the gradient along segments in $B \( y \, s' \)$, and add the bound for $nabla Q$. This proves (4.44). ◻
]

#thm([Corollary 4.9.])[
  (Annular counts).  #emph[In the atomic distance geometry, for every $0 < lambda < Lambda < oo$ and $u > 0$,
    every normalized $delta$-state of finite particle number satisfies
#[#set math.equation(numbering: n => "(4.45)")
 $ ∥\# { i : lambda u < \| x_i \| < Lambda u }∥_2 lt.eq C_(lambda \, Lambda) #scale(x: 120%, y: 120%)[\(]
   max \( u^(- 3) \, 1 \) + sqrt(delta u) #scale(x: 120%, y: 120%)[\)] . $ <a:eq:screen-annular>]

 All constants are independent of $Z$ and of the particle number.]
] <a:cor:screen-annular>

#proof[
  The compact annulus ${ lambda lt.eq \| x \| lt.eq Lambda }$ has a finite cover by cells $B_z$ whose radii are
    comparable to one, with constants allowed to depend on $lambda \, Lambda \, L$. Dilate this cover by $u$.
    Because $a_(u z) = u a_z$, the dilated balls are again cells, now with radii comparable to $u$.
    The annular count is bounded by their sum of counts. Minkowski’s inequality and (4.39) bound its $L^2$ norm by
    $C sum_z m_z$, which is the right side of (4.45). Boundary spheres carry zero raw probability,
    since the one-electron density is absolutely continuous. Thus the same estimate holds with any choice of open
    or closed endpoints. ◻
]

== 5 Common observation and change-of-law estimates <sec:observations>

The two geometries use different master widths and nuclear fields, but share the observation likelihood,
  the cost of imposing an event, and the transfer from the observed field to a fresh patch field.
  We prove these statements here. In particular, the last transfer compares expectations under a specified law;
  it does not identify the two conditional fields on individual configurations.

=== 5.1 Likelihoods and conditional versions <likelihoods-and-conditional-versions>

Let $Psi$ be a normalized antisymmetric state in a finite $n$-electron sector.
  Under a probability law $P$, raw positions and spins $\( x \, bold(sigma) \)$ have density $\| Psi \|^2$.
  Fix finitely many widths $ell_0 \, dots.h \, ell_(m - 1) > 0$.
  Independently of the raw data, take independent scalar noises $U_(j i \, b)$ with density

$ zeta \( u \) = c_zeta exp #h(-0.16667em) (- frac(1, 1 - u^2)) upright(bold(1))_(\( - 1 \, 1 \)) \( u \) . $

At scale $j$, form the labeled observations $hat(Y)_(j i \, b) = x_(i \, b) +
  ell_j U_(j i \, b)$ and then forget the particle labels separately in each array.
  Represent the result by its lexicographically sorted tuple $Y_j$ in the strict sorted chamber $cal(C)
  subset \( bb(R)^3 \)^n$. Ties have probability zero. Set

$ cal(F)_j = sigma \( Y_j \, dots.h \, Y_(m - 1) \) \, wide cal(F)_m = { diameter \, Omega } . $

Thus the sigma-fields decrease as $j$ increases.

Let $t_z$ be a deterministic measurable width with $t_z gt.eq t_min > 0$ for the fixed system,
  and use the smooth radial packet of Section 3 to define $cal(K)_z \( y \) = g_(t_z) \( y - z \)^2$.
  Write $V = V_s + V_c$, where $V_s$ is the deterministic nuclear potential retained in the observed field.
  In the molecular application it is the smoothed nuclear potential.
  In the atomic application $V_s = V$ and $V_c = 0$. Where relevant put $nu_s = - \( 4 pi \)^(- 1) Delta
  V_s$ distributionally; it is the smoothed nuclear measure in the first case and the original point measure in
  the second.

#thm([Lemma 5.1.])[
  (Conditional densities and fields).  #emph[There are jointly Borel versions of
$ mu_j \( y \) = bb(E)_P #h(-0.16667em) [sum_(i = 1)^n cal(K)_(x_i) \( y \) divides cal(F)_j] \, wide
  H_j \( y \) = V_s \( y \) - \( K * mu_j \) \( y \) \, $

 with the following properties. At every positive-density data tuple, $mu_j gt.eq 0$, $integral mu_j = n$,
   and $mu_j$ is smooth in its spatial variable. Every spatial derivative has a deterministic bound for the fixed
   system. The potential $K * mu_j$ is $C^1$, with bounded value and gradient, and
#[#set math.equation(numbering: n => "(5.1)")
 $ Delta H_j = - 4 pi nu_s + 4 pi mu_j $ <eq:obs-poisson>]

 in distributions. In particular, the always valid regularity statement is that $H_j -
   V_s$ is $C^1$ and bounded with bounded gradient. If $V_s$ and its gradient are bounded and continuous,
   these conclusions hold for $H_j$ itself. Conditional averaging satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E)_P \[ mu_j \( y \) divides cal(F)_(j + 1) \] = mu_(j + 1) \( y \) \, wide
   bb(E)_P \[ H_j \( y \) divides cal(F)_(j + 1) \] = H_(j + 1) \( y \) $ <eq:obs-tower>]

 where $V_s \( y \)$ is finite. The same towers hold for nonnegative spatial integrals,
   and for integrable signed observables. These statements include the trivial data at $j = m$.
   None of the fixed-system regularity bounds is asserted to be uniform in the nuclear system or in $t_min$.]
] <lem:obs-data>

#proof[
  On $cal(C)$ the exact likelihood of an array is
  #[#set math.equation(numbering: n => "(5.3)")
   $ L_j \( x \, Y_j \) = sum_(pi in S_n) product_(i = 1)^n product_(b = 1)^3 ell_j^(- 1) zeta #h(-0.16667em)
     (frac(Y_(j \, pi \( i \) \, b) - x_(i \, b), ell_j)) . $ <eq:obs-likelihood>]
  Set it equal to zero outside the chamber. Integration of the permutation sum over $cal(C)$ equals integration of
    the labeled product over all arrays, and is therefore one. Define
  $ Lambda_(gt.eq j) \( x \, Y \) = product_(h = j)^(m - 1) L_h \( x \, Y_h \) \, wide p_(gt.eq j) \( Y \) =
    sum_(bold(sigma)) integral \| Psi \( x \, bold(sigma) \) \|^2 Lambda_(gt.eq j) \( x \, Y \) thin upright(d) x \, $
  with the empty product and $p_(gt.eq m)$ both equal to one.
    At a tuple with $p_(gt.eq j) > 0$, use the probability density $\| Psi \|^2 Lambda_(gt.eq j) \/
    p_(gt.eq j)$ as the conditional raw law. Equivalently, the conditional mean of a nonnegative Borel raw
    observable $G$ is the ratio
  $
    frac(sum_(bold(sigma)) integral G \( x \, bold(sigma) \) \| Psi \( x \, bold(sigma) \) \|^2 Lambda_(gt.eq
    j) \( x \, Y \) thin upright(d) x, p_(gt.eq j) \( Y \)) . $
  On zero-density tuples use the unconditional raw law. All these versions are jointly Borel,
    including their dependence on an additional spatial variable.
    At every parent tuple with $p_(gt.eq j + 1) > 0$, the conditional density of the next array is $p_(gt.eq j) \/
    p_(gt.eq j + 1)$. Tonelli’s theorem and $integral L_j thin upright(d) Y_j = 1$ show that it integrates to one.
    Substitution of the ratios gives the tower property, also after nonnegative spatial integration;
    positive and negative parts give the integrable signed case.
  For each multi-index $alpha$, $\| partial_y^alpha cal(K)_z \( y \) \| lt.eq
    C_alpha t_min^(- 3 - \| alpha \|)$ uniformly in $z \, y$.
    Differentiation under the conditional integral therefore gives all claimed derivatives and bounds.
    Tonelli gives the mass $n$. For the potential and its gradient,
    split the kernels $\| u \|^(- 1)$ and $\| u \|^(- 2)$ at unit distance.
    The near parts are integrable and are controlled by $parallel mu_j parallel_oo$;
    the far parts are controlled by $n$. Splitting again at a small radius,
    then using dominated convergence on its complement, proves continuity of the potential and gradient.
    Finally $- Delta K = 4 pi delta_0$ gives (5.1). In the atomic case this argument does not remove the nuclear
    singularity of $V_s$. ◻
]

=== 5.2 Dimension-free energy cost <dimension-free-energy-cost>

#thm([Lemma 5.2.])[
  (Energy cost of a data event).  #emph[Suppose $Psi$ is an eigenstate of its sector Hamiltonian with energy
    $e_Psi$, where $0 lt.eq e_Psi - E lt.eq D_0$. In particular, $e_Psi = E_n$ for a sector ground state.
    Suppose further that
$ sum_(h = j)^(m - 1) ell_h^(- 2) lt.eq C_ell ell_j^(- 2) $

 with a fixed numerical $C_ell$. This holds for the dyadic scales $ell_h = r_h^1.01$, $r_(h + 1) = 2 r_h$,
   with $C_ell = \( 1 - 2^(- 2.02) \)^(- 1)$. If $A in cal(F)_j$ has probability $p = P \( A \) > 0$,
   put $p_A \( x \) = P \( A divides x \)$ and
$ Psi_A = sqrt(p_A \( x \) \/ p) thin Psi . $

 Then $Psi_A$ is a normalized antisymmetric form-domain vector,
   its raw position-and-spin law is the raw marginal of $P$ conditioned on $A$, and
#[#set math.equation(numbering: n => "(5.4)")
 $ q_n \[ Psi_A \] lt.eq e_Psi + C ell_j^(- 2) log^5 \( e \/ p \) lt.eq E + D_0 +
   C ell_j^(- 2) log^5 \( e \/ p \) . $ <eq:obs-tilt>]

 The constant depends only on $C_ell$ and the chosen noise law, not on $n$, the number of arrays,
   or the nuclear system. The same assertion holds for an event of one unordered observation at any width $ell$,
   using $ell$ in place of $ell_j$. No upper bound on the particle number in terms of the nuclear charge is needed.]
] <lem:obs-tilt>

#proof[
  In labeled observation coordinates place the sorting map inside the indicator of $A$.
    The translated product density is continuously differentiable in $L^1$,
    since $zeta$ is smooth and compactly supported. Hence $p_A$ is continuously differentiable even for a Borel
    event. The scalar translation score is
  $ S \( u \) = - frac(zeta' \( u \), zeta \( u \)) = frac(2 u, \( 1 - u^2 \)^2) \, wide \| u \| < 1 . $
  Its law is symmetric and centered. It satisfies $parallel S \( U \) parallel_q lt.eq C q^2$ for $q gt.eq 2$:
    indeed, $T = \( 1 - U^2 \)^(- 1)$ has a finite exponential moment of every order less than one,
    so integration of its exponential tail gives $parallel T parallel_q lt.eq C q$, while $\| S \( U \) \| lt.eq 2 T^2$.
  For a unit vector $v in bb(R)^(3 n)$ the directional derivative of the likelihood pairs the event indicator with
  $ Q_v = sum_(h = j)^(m - 1) sum_(i = 1)^n sum_(b = 1)^3 ell_h^(- 1) v_(i \, b) S \( U_(h i \, b) \) . $
  Multiplication by independent random signs preserves the joint law of the independent symmetric scores.
    For deterministic coefficients,
  $ product_alpha cosh \( s c_alpha \) lt.eq exp #h(-0.16667em) (s^2 / 2 sum_alpha c_alpha^2) $
  gives the Gaussian tail estimate and consequently $parallel sum_alpha epsilon.alt_alpha c_alpha parallel_q lt.eq
    C sqrt(q) \( sum_alpha c_alpha^2 \)^(1 \/ 2)$. Conditioning on the scores and then using the triangle
    inequality in $L^(q \/ 2)$ yields
  $ parallel Q_v parallel_q lt.eq C q^(5 \/ 2) (sum_(h \, i \, b) ell_h^(- 2) v_(i \, b)^2)^(1 \/ 2) lt.eq
    C q^(5 \/ 2) ell_j^(- 1) . $
  The identity $sum_(i \, b) v_(i \, b)^2 = 1$ and the geometric square-sum bound are precisely what avoid factors
    depending on dimension or on the number of observations.
  Hölder’s inequality at fixed $x$ gives $\| D_v p_A \( x \) \| lt.eq
    C q^(5 \/ 2) ell_j^(- 1) p_A \( x \)^(1 - 1 \/ q)$. For $p_A \( x \) > 0$ choose $q = max { 2 \,
    log \( e \/ p_A \( x \) \) }$ and then take the supremum over unit vectors.
    At a zero the gradient of the nonnegative differentiable function $p_A$ vanishes. Therefore
  #[#set math.equation(numbering: n => "(5.5)")
   $ \| nabla p_A \| lt.eq C ell_j^(- 1) p_A log^(5 \/ 2) \( e \/ p_A \) \, $ <eq:obs-score-gradient>]
  with right side zero at $p_A = 0$.
  Regularize the square root by $sqrt(p_A + eta)$. Since $sqrt(u)
    log^(5 \/ 2) \( e \/ u \)$ is bounded on $\[ 0 \, 1 \]$, these functions have a common Lipschitz bound.
    Their uniform limit $sqrt(p_A)$ is Lipschitz. Its gradient vanishes almost everywhere on its zero set,
    and the ordinary chain rule applies elsewhere. Thus
  $ lr(|nabla sqrt(p_A \/ p)|)^2 lt.eq C ell_j^(- 2) p_A / p log^5 \( e \/ p_A \) . $
  The permutation sum in (5.3) shows that $p_A$ is invariant under raw particle permutations and is spin
    independent. The bounded Lipschitz multiplier therefore preserves antisymmetry and the form domain.
    Its squared norm and its raw law are as claimed by the definition of $p_A$.
  Lemma 7, applied with eigenvalue $e_Psi$, now gives
  $ q_n \[ Psi_A \] - e_Psi lt.eq C ell_j^(- 2) bb(E)_P \[ log^5 \( e \/ p_A \( x \) \) divides A \] . $
  Under this conditional law,
  $ P { p_A \( x \) < e^(- u) divides A } = p^(- 1) bb(E)_P \[ p_A upright(bold(1))_({ p_A < e^(- u) }) \] lt.eq
    min { 1 \, e^(- u) \/ p } wide \( u gt.eq 0 \) . $
  Integration of this tail, split at $log \( e \/ p \)$, bounds the fifth moment by $C
    log^5 \( e \/ p \)$ and proves (5.4). The proof for a single array is identical with the square-sum constant
    equal to one. ◻
]

=== 5.3 Transfer to a fresh patch <transfer-to-a-fresh-patch>

The following quantitative formulation isolates exactly the local screening estimates needed by both applications.
  It allows either a patch containing singular nuclei or a patch containing none.
  The fine density below is the actual sum of packets around retained raw particles, not its conditional average.

#thm([Lemma 5.3.])[
  (Averaged field transfer).  #emph[Fix a point $y$ where $V_s \( y \)$ is finite and a length $a > 0$.
    Let $A in cal(F)_j$ have positive $P$-probability, and let $Q$ be $P$ conditioned on $A$,
    extended by fresh localization labels. Its raw marginal is the law of $Psi_A$ from Lemma 26.
    Let $X$ denote the fresh patch data, and let $rho_X^c$ be the conditional density of core particles under this
    tilted localization law. Partition the remaining raw particles into retained and deleted particles. Let
$ sigma = sum_(i med upright("retained")) theta.alt_b \( dot.op - x_i \) \, wide h_X = V_s - K * rho_X^c -
  K * rho_X \, wide W_X = V_c + h_X \, $

 where $theta.alt_b$ is the radial probability kernel of Lemma 15, supported in $B \( 0 \, sqrt(3) b \)$,
   and $rho_X gt.eq 0$ is a measurably chosen patch comparison density.
   Assume $rho_X$ and $sigma$ belong to $L^(5 \/ 3)$ and have compact support for almost every patch datum.
   Put $t = t_y$, $tau = t \/ a$, and $beta = b \/ a$, and suppose $0 < t \, b lt.eq a \/ 10$.
   Assume the following estimates, with fixed constants:]
  + #emph[The master width $z mapsto t_z$ is Lipschitz with constant at most $1 \/ 2$.
    The raw one-particle density $rho_(Psi_A)$ satisfies
$ integral_(B \( y \, 4 a \)) rho_(Psi_A)^(5 \/ 3) lt.eq C a^(- 7) . $

]
  + #emph[Deleted particles have $\| x_i - y \| gt.eq c a$,
    and their count obeys $bb(E)_Q n_(upright("del")) lt.eq C a^(- 3) sqrt(beta)$.]
  + #emph[For some $epsilon_a gt.eq 0$,
$ bb(E)_Q D \( rho_X - sigma \) lt.eq C a^(- 7) epsilon_a^2 . $

]
  + #emph[On $B \( y \, t \)$ either the source-free bound $rho_X lt.eq C a^(- 6)$ holds, or
$ rho_X = k \( W_X \)_(+)^(3 \/ 2) \, wide W_X lt.eq V_(upright("loc")) + C a^(- 4) \, wide
  V_(upright("loc")) \( z \) = sum_alpha frac(q_alpha, \| z - R_alpha \|) \, wide sum_alpha q_alpha lt.eq C a^(- 3) \, $

 with $q_alpha gt.eq 0$. The latter alternative permits arbitrary locations of the local nuclei.]
  #emph[Then the two expectation towers are
#[#set math.equation(numbering: n => "(5.6)")
 $ bb(E)_Q \( K * mu_j \) \( y \) = bb(E)_Q P^(upright("ms")) \( y \) \, wide bb(E)_Q \( K * rho_X^c \) \( y \) =
   bb(E)_Q P^c \( y \) \, $ <eq:obs-two-towers>]

 where $P^(upright("ms"))$ is the potential of the raw master packets and $P^c$ is the raw core potential. Moreover,
#[#set math.equation(numbering: n => "(5.7)")
 $ \| bb(E)_Q \( H_j - h_X \) \( y \) \| lt.eq C a^(- 4) #scale(x: 120%, y: 120%)[\[] & tau^(1 \/ 5) +
   beta^(1 \/ 5) + sqrt(beta) + epsilon_a tau^(- 1 \/ 2)\
 & + R \( tau \) + \( tau + sqrt(3) beta \)^(1 \/ 5) #scale(x: 120%, y: 120%)[\]] \, $ <eq:obs-transfer>]

 where $R \( tau \) = tau^2$ in the source-free alternative and $R \( tau \) = tau^2 +
   tau^(1 \/ 2)$ in the nuclear alternative. Thus the common upper bound $R \( tau \) lt.eq
   C tau^(1 \/ 2)$ is always available. All constants are independent of the number of particles;
   they depend only on the constants in the displayed hypotheses.]
] <lem:obs-transfer>

#proof[
  Write
  $ P^(upright("raw")) \( y \) = sum_i K \( y - x_i \) \, wide P^(upright("ms")) \( y \) =
    sum_i \( K * cal(K)_(x_i) \) \( y \) \, wide P^(upright("raw")) = P^c + P^(upright("ret")) + P^(upright("del")) . $
  The first identity in (5.6) follows by multiplying the original $P$-conditional expectation defining $mu_j$ by
    $upright(bold(1))_A$, using $A in cal(F)_j$, and dividing by $P \( A \)$.
    The fresh labels do not alter this expectation. For the second identity,
    condition the raw-plus-label marginal of $Q$ on $X$. That marginal is exactly the localization law of $Psi_A$;
    the original observations can be integrated out. Tonelli justifies both identities initially for nonnegative
    potentials. In particular the first tower is under the original observation law,
    while the second uses the fresh tilted patch law.
  Subtracting the definitions of $H_j$ and $h_X$, and then using these towers, gives the exact algebraic identity
  #[#set math.equation(numbering: n => "(5.8)")
   $ bb(E)_Q \( H_j - h_X \) \( y \) =
     bb(E)_Q #scale(x: 120%, y: 120%)[\[] & \( P^(upright("raw")) - P^(upright("ms")) \) - P^(upright("del"))\
 & - \( P^(upright("ret")) - K * sigma \) + K * \( rho_X - sigma \) #scale(x: 120%, y: 120%)[\]] \( y \) .
   $ <eq:obs-transfer-decomposition>]
  The estimates below also establish finiteness of all terms,
    so this subtraction involves no difference of infinite expectations.
  For $0 < u lt.eq 4 a$, the local density bound and Hölder’s inequality give
  #[#set math.equation(numbering: n => "(5.9)")
   $ bb(E)_Q sum_(\| x_i - y \| < u) K \( y - x_i \) & lt.eq
     (integral_(B \( y \, 4 a \)) rho_(Psi_A)^(5 \/ 3))^(3 \/ 5)
     (integral_(\| z \| < u) \| z \|^(- 5 \/ 2) thin upright(d) z)^(2 \/ 5)\
 & lt.eq C a^(- 4) \( u \/ a \)^(1 \/ 5) . $ <eq:obs-near-coulomb>]
  The complementary raw potential is bounded by $n \/ \( 4 a \)$.
    By radial smearing, $P^(upright("raw")) - P^(upright("ms")) gt.eq 0$ and only centers with $\| x_i -
    y \| lt.eq t_(x_i)$ can contribute. Lipschitz continuity of the width implies $\| x_i - y \| lt.eq
    t_y + \| x_i - y \| \/ 2$, hence these centers lie in $B \( y \, 2 t \)$.
    Equation (5.9) bounds its mean by $C a^(- 4) tau^(1 \/ 5)$. The same Newton comparison for each fine packet gives
  $ 0 lt.eq bb(E)_Q \( P^(upright("ret")) - K * sigma \) \( y \) lt.eq C a^(- 4) beta^(1 \/ 5) . $
  The distance and count assumptions for the deleted particles give $bb(E)_Q P^(upright("del")) \( y \) lt.eq
    C a^(- 4) sqrt(beta)$.
  For the signed density difference take $v_t \( z \) = min { \| y - z \|^(- 1) \, t^(- 1) }$. This is in $dot(H)^1$ and
  $ parallel nabla v_t parallel_2^2 = 4 pi integral_t^oo r^(- 2) thin upright(d) r = 4 pi \/ t . $
  Lemma 10 and Cauchy–Schwarz in probability give
  $ bb(E)_Q lr(|integral v_t \( rho_X - sigma \)|) lt.eq C t^(- 1 \/ 2) sqrt(bb(E)_Q D \( rho_X - sigma \)) lt.eq
    C a^(- 4) epsilon_a tau^(- 1 \/ 2) . $
  It remains to control the two nonnegative remainders of the truncation inside $B \( y \, t \)$.
    In the source-free case,
  $ integral_(B \( y \, t \)) K \( y - z \) rho_X \( z \) thin upright(d) z lt.eq C a^(- 6) t^2 = C a^(- 4) tau^2 . $
  For the nuclear alternative, weighted convexity gives, with $Q_(upright("loc")) = sum_alpha q_alpha$,
  $ V_(upright("loc"))^(3 \/ 2) lt.eq Q_(upright("loc"))^(1 \/ 2) sum_alpha q_alpha \| z - R_alpha \|^(- 3 \/ 2) . $
  The assertion is read as zero if $Q_(upright("loc")) = 0$. Uniformly in $R in bb(R)^3$,
  $ integral_(B \( y \, t \)) frac(thin upright(d) z, \| y - z \| thin \| z - R \|^(3 \/ 2)) lt.eq C t^(1 \/ 2) . $
  For completeness, apply Hölder to the second factor with any exponent $q
    in \( 3 \/ 2 \, 2 \)$ and to the first with conjugate exponent $q' in \( 2 \, 3 \)$.
    Integrals of these radial decreasing powers over a ball are no larger than their centered-ball integrals;
    the powers of $t$ combine to $t^(1 \/ 2)$. Since $rho_X lt.eq C \( a^(- 6) + V_(upright("loc"))^(3 \/ 2) \)$,
    its remainder is at most
  $ C #scale(x: 120%, y: 120%)[\(] a^(- 6) t^2 + Q_(upright("loc"))^(3 \/ 2) t^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\)] lt.eq C a^(- 4) \( tau^2 + tau^(1 \/ 2) \) . $
  This proves the asserted nuclear bound even when a nucleus lies at $y$; only $V_s \( y \)$,
    not the unsmoothed $V \( y \)$, was required finite.
  For $sigma$, only packets centered within $t + sqrt(3) b$ of $y$ meet the truncation ball.
    Extend each such packet’s kernel integral to all space and use radial smearing to bound it by its raw point
    potential. Equation (5.9) bounds the mean remainder by $C a^(- 4) \( tau + sqrt(3) beta \)^(1 \/ 5)$.
    The truncated $sigma$ potential is integrable, being at most $n \/ t$.
    Together with Coulomb duality and the just obtained remainder bound,
    this also proves integrability of the full $rho_X$ potential.
    The raw and core potentials were already integrable by (5.9). Hence all the preceding subtractions are valid.
    Adding the four estimates in (5.8) proves (5.7). ◻
]

In both later applications the screening estimates supply $epsilon_a = a^.01$ and $beta = a^.2$.
  The master geometry supplies $tau gt.eq c a^w$, with $w = 10^(- 5)$,
  and an upper bound on $tau$ tending to zero with the outer small parameter. Consequently

$ a^.01 tau^(- 1 \/ 2) lt.eq C a^(.01 - w \/ 2) \, wide .01 - w \/ 2 = .009995 > 0 \, $

and every term in the bracket in (5.7) tends to zero uniformly in the participating bands.
  Thus the transfer is $o \( a^(- 4) \)$. The specific lower probability thresholds for the events are used in
  those applications to verify the screening hypotheses through (5.4);
  no probability threshold is needed for the transfer identity itself.

=== 5.4 Maxima before conditional averaging <maxima-before-conditional-averaging>

The next local rule joins fields on actual open neighborhoods.
  It will be used in both propagation arguments after their common singularities have been canceled.

#thm([Lemma 5.4.])[
  (Maximum of weak subsolutions).  #emph[Let $cal(O) subset bb(R)^3$ be open, let $g$ be locally bounded,
    and let $F \( y \, t \)$ be measurable in $y$, continuous in $t$,
    and bounded on compact spatial sets and bounded ranges of $t$.
    If finitely many functions $v_i in C \( cal(O) \) ∩ H_(upright("loc"))^1 \( cal(O) \)$ satisfy
$ Delta v_i gt.eq g + F \( y \, v_i \) $

 in distributions, their maximum satisfies the same inequality with its own value in the reaction term.
   The assertion also holds for functions $v_i = V + a_i$ with continuous locally $H^1$ offsets $a_i$,
   when all inequalities have the common singular term $- 4 pi
   nu$ and the reaction vanishes in a neighborhood of $"supp" nu$.]
] <lem:maximum>

#proof[
  It suffices to consider two functions. For a nonnegative compactly supported smooth test $phi$,
    choose an increasing Lipschitz function $theta_eta$ that is zero on $\( - oo \, 0 \]$ and one on
    $\[ eta \, oo \)$. Test the first inequality with $theta_eta \( v_1 - v_2 \)
    phi$ and the second with $\( 1 - theta_eta \( v_1 - v_2 \) \) phi$.
    These nonnegative compactly supported $H^1$ tests are legitimate by mollification,
    since the right sides are bounded on their support. The sum of the left sides is
  $ & - integral #scale(x: 120%, y: 120%)[\[] theta_eta \( v_1 - v_2 \) nabla
    v_1 + \( 1 - theta_eta \( v_1 - v_2 \) \) nabla v_2 #scale(x: 120%, y: 120%)[\]] dot.op nabla phi\
 & #h(8mm)  - integral theta'_eta \( v_1 - v_2 \) \| nabla \( v_1 - v_2 \) \|^2 phi . $
  The second term is nonpositive. Deleting it and letting $eta arrow.b
    0$ gives the gradient of $max \( v_1 \, v_2 \)$ by the Sobolev positive-part formula.
    Dominated convergence gives the reaction at the maximum; the reactions agree at ties.
    Induction proves the finite version.
  For the last assertion subtract $V$ in each inequality. The singular measures cancel,
    and the reaction for the offsets becomes $F \( y \, V \( y \) + a_i \( y \) \)$. It is locally bounded:
    it vanishes near every nuclear point, and $V$ is smooth off $"supp" nu$.
    Apply the first assertion to the offsets and then add $V$ back. ◻
]

== 6 Electron counts in large nuclear voids <m:sec:void>

The local count bound of Lemma 19 controls the electrons in each annulus whose radius is comparable to its
  distance from the nuclei. Summing that bound over arbitrarily many annuli would lose a factor equal to the
  number of scales. We first remove this loss in a nuclear void.
  A geometric decomposition will then reduce the exterior region of an arbitrary molecule to only $O \( M \)$ such
  voids.

Throughout this section $Psi$ is the normalized eigenstate in the largest strictly bound sector, and $E = E_N =
  inf_(j gt.eq 0) E_j$, as in Lemma 6. Expectations without an additional subscript refer to its position law,
  with spins summed. Constants may depend on the fixed numbers $A = 40$ and $L = 10^6$,
  but on no feature of the molecule.

#thm([Lemma 6.1.])[
  (A large nuclear void).  #emph[There are universal constants $t_0 \, C > 0$ with the following property.
    Let $O in bb(R)^3$, $t gt.eq t_0$ and $T = 2^J t$, where $J gt.eq 1$ is an integer.
    Suppose that at least one nucleus lies in $B \( O \, t \/ 100 \)$ and that every nucleus satisfies
$ \| R_m - O \| < t \/ 100 wide upright("or") wide \| R_m - O \| > 100 T . $

 Then
#[#set math.equation(numbering: n => "(6.1)")
 $ ∥\# { i : t lt.eq \| x_i - O \| < T }∥_(L^2 \( Psi \)) lt.eq C . $ <m:eq:void-annulus-count>]

]
] <m:lem:void-shell>

#proof[
  Translate $O$ to the origin. Put $u_i = \| x_i \|$, $s_k = 2^k t$ and
  $ n_k = \# { i : s_k lt.eq u_i < 2 s_k } \, wide L_(upright("ann")) = sum_(k = 0)^(J - 1) n_k . $
  For $s_k \/ 4 lt.eq \| v \| lt.eq 8 s_k$, the nuclear assumptions give $c s_k lt.eq d \( v \) lt.eq C s_k$,
    where $d \( v \)$ is the distance to the nearest nucleus.
    Indeed, the inner nucleus supplies the upper bound; the inner and outer alternatives supply the lower bound.
    Choose $t_0$ so large that $d \( v \) \/ L > 1$ on all these annuli.
    Lemma 16 then gives $a_v = d \( v \) \/ L asymp s_k \/ L$.
  Each enlarged annulus is covered by a universally bounded number of local balls $B \( v \, a_v \)$ with
    comparable scales. For example, take a maximal set of centers in the annulus separated by $c s_k \/ L$,
    with $c$ small; the disjoint balls of half that radius give the bound on their number.
    Lemma 19, applied to any $delta$-state $omega$ in the fixed sector $N$, consequently yields
  #[#set math.equation(numbering: n => "(6.2)")
   $ parallel n_k parallel_(L^2 \( omega \)) + parallel n_(upright("neigh") \, k) parallel_(L^2 \( omega \)) lt.eq
     C \( 1 + sqrt(delta s_k) \) \, wide n_(upright("neigh") \, k) = \# { i : s_k \/ 2 lt.eq u_i lt.eq
     4 s_k } . $ <m:eq:void-local-shell>]
  This proves the result when $J$ is bounded. We may therefore assume that $J$ exceeds a fixed sufficiently large
    integer.
  #emph[A weighted eigenstate inequality.] Choose $0 lt.eq chi lt.eq 1$ supported in $\( 32 t \, T \/ 32 \)$,
    equal to one on $\[ 64 t \, T \/ 64 \]$, and satisfying $\| chi' \( u \) \| lt.eq C \/ u$,
    $\| chi'' \( u \) \| lt.eq C \/ u^2$. Such a function is obtained by multiplying a fixed cutoff at scale $t$
    by a fixed cutoff at scale $T$. Set $w \( u \) = u chi \( u \)^2$.
    It is a bounded smooth multiplier that vanishes near the origin. For each weighted index, integration by parts gives
  $ "Re" chevron.l w \( u_i \) Psi \, - 1 / 2 Delta_i Psi chevron.r & = 1 /
    2 integral w \( u_i \) \| nabla_i Psi \|^2 - 1 / 4 integral Delta_i w \( u_i \) \| Psi \|^2\
 & gt.eq - C bb(E) upright(bold(1))_({ t lt.eq u_i < T }) / u_i . $
  These identities hold first after form-domain approximation and then by continuity,
    since $w$ and its derivatives are bounded for fixed $t \, T$.
    Summing the last bound costs at most $C sum_k s_k^(- 1) bb(E) n_k lt.eq C \/ t lt.eq C$ by (6.2) with $delta =
    0$. After fixing $x_i$ and its spin, the remaining Hamiltonian has energy at least $E_(N - 1) gt.eq E$.
    Its contribution against the nonnegative weight $w \( u_i \)$ is therefore nonnegative.
    Testing the eigen-equation with $sum_i w \( u_i \) Psi$ shows that weighted repulsion minus attraction is at
    most $C$.
  For an electron in a shell meeting the support of $chi$, keep only its repulsion against electrons at radius $<
    t$, at radius $gt.eq T$, and in shells $l lt.eq k - 5$. Dropping the other repulsions preserves the upper
    bound. Write
  $ P_k = sum_(0 lt.eq l < J\
l lt.eq k - 5) n_l \, wide q = nu \( B \( 0 \, t \) \) - \# { i : u_i < t } \, $
  and define the exterior signed potential at the origin by
  $ B = integral_(\| R \| > 100 T) frac(d nu \( R \), \| R \|) - sum_(u_i gt.eq T) 1 / u_i . $
  For each such $k$, use a cut that is full out on $\[ s_k \/ 2 \, 4 s_k \]$,
    supported in $\[ s_k \/ 4 \, 8 s_k \]$, and has gradients bounded by $C \/ s_k$.
    Let $X_k$ be its out data as in Lemma 13; a bar will mean conditional expectation given $X_k$ in this
    paragraph and below. Set
  $ phi \( v \) = V \( v \) - sum_(u_i < t) frac(1, \| v - x_i \|) - sum_(u_i gt.eq T) frac(1, \| v - x_i \|) \,
    wide psi_k \( v \) = overline(phi \( v \) - sum_(l lt.eq k - 5) sum_(i in l) frac(1, \| v - x_i \|)) . $
  Every supported shell satisfies $32 t lt.eq s_k lt.eq T \/ 64$.
    All sources defining $psi_k$ are outside ${ s_k \/ 4 < \| v \| < 8 s_k }$:
    prefix electrons have radius $< s_k \/ 16$, inner electrons have radius $< t lt.eq s_k \/ 32$,
    and exterior electrons have radius $gt.eq T gt.eq 64 s_k$.
    Thus $psi_k$ has a continuous harmonic version on this annulus. Newton’s sphere-average formula gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ chevron.l psi_k chevron.r_u = frac(macron(q) - macron(P)_k, u) + macron(B) \, wide s_k \/ 4 < u < 8 s_k \,
     $ <m:eq:void-sphere-mean>]
  where $chevron.l F chevron.r_u = \( 4 pi u^2 \)^(- 1) integral_(\| v \| = u) F \( v \) thin d S \( v \)$.
    The shell-$k$ positions are all recorded in $X_k$. We may therefore condition the selected interaction terms
    while retaining their weights. The preceding eigenstate inequality becomes
  #[#set math.equation(numbering: n => "(6.4)")
   $ - bb(E) sum_k sum_(i in k) u_i chi \( u_i \)^2 psi_k \( x_i \) lt.eq C \, $ <m:eq:void-weighted-field>]
  where $k$ ranges over the supported shells. Conditional harmonic versions and sphere averages are justified
    directly by the positive distance to these sources and their fixed finite total masses.
  #emph[A size-biased law for one shell.] Fix a supported $k$.
    Choose a smooth function $b_k$, equal to one on $\[ s_k \, 2 s_k \]$, supported in $\( s_k \/ 2 \, 4 s_k \)$,
    with $0 lt.eq b_k lt.eq 1$ and $\| b'_k \| lt.eq C \/ s_k$. Put
  $ S_k = sum_i b_k \( u_i \)^2 \, wide m_k = bb(E) S_k . $
  Then $n_k lt.eq S_k lt.eq n_(upright("neigh") \, k)$. If $m_k = 0$,
    every shell-$k$ contribution vanishes and can be omitted. Otherwise define
  $ Psi_k = sqrt(S_k \/ m_k) thin Psi \, $
  and denote its expectation and $L^2$ norm by $bb(E)_k$ and $parallel dot.op parallel_(2 \, k)$.
    The square root of a sum of squares is Lipschitz, and, off its zero set,
  $ \| nabla sqrt(S_k) \|^2 = frac(sum_i b_k \( u_i \)^2 \| nabla b_k \( u_i \) \|^2, S_k) lt.eq
    C s_k^(- 2) upright(bold(1))_({ n_(upright("neigh") \, k) > 0 }) lt.eq C s_k^(- 2) n_(upright("neigh") \, k) . $
  Its gradient is zero almost everywhere on its zero set. The multiplier identity in Lemma 7 shows that $Psi_k$ is
    a $delta_k$-state, with
  #[#set math.equation(numbering: n => "(6.5)")
   $ delta_k lt.eq frac(C bb(E) n_(upright("neigh") \, k), s_k^2 m_k) . $ <m:eq:void-tilt-energy>]
  The random variable $S_k$ is $X_k$-measurable, because its support is inside the full-cut zone.
    The joint position and cut-label law changes by the factor $S_k \/ m_k$.
    Its conditional position law given $X_k$ is therefore unchanged on $S_k > 0$.
    In particular all the barred fields and counts above have the same conditional versions under this new law.
    This permits us to use the local estimates for $Psi_k$ without changing the fields in (6.4).
  #emph[A positive bound and a signed harmonic comparison.] On the broad annulus of harmonicity,
    the base and prefix sources lie outside the exclusion defining $J_v$.
    Its radius $A a_v$ is a fixed small fraction of $\| v \|$, since $A \/ L$ is small.
    The additional electrons subtracted by $J_v$ give the upper bound
  #[#set math.equation(numbering: n => "(6.6)")
   $ psi_k \( v \) lt.eq overline(J_v) + C sum_(l gt.eq k - 4) frac(macron(n)_l, max \( s_l \, s_k \)) .
     $ <m:eq:void-positive-comparison>]
  For comparable shells the exclusion supplies the denominator $c s_k$;
    for sufficiently larger shells radial separation supplies $c s_l$.
    These are precisely the electrons absent from the definition of $psi_k$.
  The cut defining $X_k$ is covered by a universally bounded number of cells at scales comparable to $s_k \/ L$.
    Its gradients are $C \/ s_k$ and $a_v gt.eq 1$ there, so it meets the initial-cut hypothesis of Lemma 17.
    For targets in the same broad annulus, that lemma and (6.2), now applied under $Psi_k$, give
  $ parallel \( psi_k \( v \) \)_(+) parallel_(2 \, k) lt.eq frac(C \( 1 + sqrt(delta_k s_k) \), s_k) . $
  Conditional Jensen’s inequality bounds $parallel macron(n)_l parallel_(2 \, k)$ by $parallel n_l
    parallel_(2 \, k)$. Thus the added count terms are bounded by the convergent series
  $ C sum_(l gt.eq k - 4) frac(1 + sqrt(delta_k s_l), s_l) lt.eq frac(C \( 1 + sqrt(delta_k s_k) \), s_k) . $
  Positive parts of harmonic functions are subharmonic. Covering the compact annulus ${ s_k \/ 2 lt.eq \| v \|
    lt.eq 3 s_k }$ by a fixed number of interior balls in the broad annulus,
    and using the ball submean inequality and Minkowski’s inequality, consequently gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ A_k = s_k sup_(s_k \/ 2 lt.eq \| v \| lt.eq 3 s_k) \( psi_k \( v \) \)_(+) \, wide
     parallel A_k parallel_(2 \, k) lt.eq C \( 1 + sqrt(delta_k s_k) \) . $ <m:eq:void-positive-supremum>]
  The function $A_k \/ s_k - psi_k$ is nonnegative and harmonic in the interior of this latter annulus.
    Its value at any point of a sphere $s_k lt.eq u lt.eq 2 s_k$ is at least $c$ times its sphere mean,
    for one universal $c > 0$. Indeed, after scaling, a bounded chain of interior balls joins any two points of
    these spheres; on a ball, this comparison follows by comparing its Poisson kernels on a smaller concentric
    ball. Applying this comparison and (6.3) gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ u psi_k \( v \) lt.eq C A_k + c \( macron(q) + u macron(B) - macron(P)_k \) \, wide \| v \| =
     u in \[ s_k \, 2 s_k \] . $ <m:eq:void-harnack>]
  The negative prefix term retains a fixed positive coefficient.
  #emph[The endpoint fields.] Put $s_(-) = 2 t$ and $s_(+) = T \/ 2$.
    For a supported shell and $u in \[ s_k \, 2 s_k \]$,
  $ macron(q) + u macron(B) = \( 1 - theta.alt \( u \) \) \( macron(q) + s_(-) macron(B) \) +
    theta.alt \( u \) \( macron(q) + s_(+) macron(B) \) \, quad theta.alt \( u \) =
    frac(u - s_(-), s_(+) - s_(-)) \, quad 0 lt.eq theta.alt \( u \) lt.eq C s_k \/ T . $
  At either endpoint all base sources are outside the $J_v$ exclusion.
    Sphere averaging $macron(phi)$ and adding back the annular electrons therefore yields
  #[#set math.equation(numbering: n => "(6.9)")
   $ macron(q) + s macron(B) lt.eq s chevron.l \( overline(J_v) \)_(+) chevron.r_s +
     C s sum_l frac(macron(n)_l, max \( s_l \, s \)) \, wide s in { s_(-) \, s_(+) } . $ <m:eq:void-endpoint-field>]
  Indeed, the omitted contribution of an annular electron is nonnegative and at most its full Coulomb kernel.
    The latter has sphere average $1 \/ max \( s \, u_i \) lt.eq
    1 \/ max \( s \, s_l \)$ for an electron in shell $l$. For these targets $a_v asymp s \/ L$.
    The initial cut is still at scale $s_k \/ L$, so the energy parameter in Lemma 17 satisfies $e_(*) lt.eq
    C \( min \( s \, s_k \)^(- 1) + delta_k \)$. The precise consequence is
  #[#set math.equation(numbering: n => "(6.10)")
   $ ∥s chevron.l \( overline(J_v) \)_(+) chevron.r_s∥_(2 \, k) lt.eq
     C sqrt(frac(s, min \( s \, s_k \)) + delta_k s) . $ <m:eq:void-endpoint-norm>]
  At $s = s_(-)$ this is at most $C \( 1 + sqrt(delta_k s_k) \)$. At $s = s_(+)$ the interpolation weight gives instead
  $ C s_k / T sqrt(T / s_k + delta_k T) lt.eq C (sqrt(s_k / T) + sqrt(delta_k s_k) sqrt(s_k / T)) lt.eq
    C \( 1 + sqrt(delta_k s_k) \) . $
  The inner endpoint count term in (6.9) has norm at most
  $ C sum_l 2^(- l) \( 1 + sqrt(delta_k 2^l t) \) lt.eq C \( 1 + sqrt(delta_k t) \) . $
  For the outer endpoint, $s_(+) \/ max \( s_l \, s_(+) \) lt.eq 1$;
    we retain its contribution as $C \( s_k \/ T \) macron(L)_(upright("ann"))$.
    Thus (6.8) supplies a nonnegative, $X_k$-measurable random variable $D_k$,
    the same for every electron in shell $k$, such that
  #[#set math.equation(numbering: n => "(6.11)")
   $ u_i psi_k \( x_i \) lt.eq D_k + C s_k / T macron(L)_(upright("ann")) - c macron(P)_k \, wide
     parallel D_k parallel_(2 \, k) lt.eq C \( 1 + sqrt(delta_k s_k) \) . $ <m:eq:void-final-field-bound>]
  #emph[Summation over shells.] Changing to the size-biased law and using (6.5), $s_k gt.eq 1$, and $m_k lt.eq
    bb(E) n_(upright("neigh") \, k)$, gives
  #[#set math.equation(numbering: n => "(6.12)")
   $ bb(E) \[ n_k D_k \] & lt.eq m_k bb(E)_k D_k lt.eq C m_k \( 1 + sqrt(delta_k s_k) \)\
 & lt.eq C (m_k + sqrt(m_k bb(E) n_(upright("neigh") \, k) \/ s_k)) lt.eq
   C bb(E) n_(upright("neigh") \, k) . $ <m:eq:void-local-error-sum>]
  The neighbor annuli for supported $k$ lie inside ${ t lt.eq \| x \| < T }$ and have bounded overlap,
    so these costs sum to $C bb(E) L_(upright("ann"))$. For the outer term,
    $n_k$ is $X_k$-measurable and the tower property gives
  $ sum_k s_k / T bb(E) \[ n_k macron(L)_(upright("ann")) \] & = sum_k s_k / T bb(E) \[ n_k L_(upright("ann")) \]\
 & lt.eq parallel L_(upright("ann")) parallel_2 sum_k s_k / T parallel n_k parallel_2 lt.eq
   C parallel L_(upright("ann")) parallel_2 . $
  Here the unconditioned norms use (6.2) with $delta = 0$, and $sum_k s_k \/ T lt.eq 1$. Insert (6.11) into (6.4).
    The weights $W_k = sum_(i in k) chi \( u_i \)^2$ are $X_k$-measurable and satisfy $0 lt.eq W_k lt.eq n_k$.
    Removing the bar on $P_k$ by the tower property, we obtain
  #[#set math.equation(numbering: n => "(6.13)")
   $ bb(E) sum_k W_k P_k lt.eq C \( 1 + parallel L_(upright("ann")) parallel_2 \) . $ <m:eq:void-prefix-products>]
  Let $I_(upright("mid"))$ consist of the shells entirely contained in $\[ 64 t \, T \/ 64 \]$,
    and set $L_(upright("mid")) = sum_(k in I_(upright("mid"))) n_k$. On these shells $W_k = n_k$.
    The sum on the left of (6.13) therefore includes all products $n_k n_l$ with $k \,
    l in I_(upright("mid"))$ and $l lt.eq k - 5$. For every omitted close pair $\| k - l \| < 5$, including $k =
    l$, use the tilt at $k$ and (6.2) to obtain
  $ bb(E) n_k n_l lt.eq m_k bb(E)_k n_l lt.eq C m_k \( 1 + sqrt(delta_k s_l) \) lt.eq
    C bb(E) n_(upright("neigh") \, k) . $
  The last step uses $s_l asymp s_k$ and the same calculation as (6.12).
    Each $k$ has only a bounded number of such neighbors. Thus the close-pair costs sum to $C bb(E)
    L_(upright("ann"))$, rather than a cost proportional to $J$. Expanding $L_(upright("mid"))^2$ now gives
  $ bb(E) L_(upright("mid"))^2 lt.eq C \( 1 + parallel L_(upright("ann")) parallel_2 \) . $
  Only a fixed number of endpoint shells were omitted, so $parallel L_(upright("ann")) -
    L_(upright("mid")) parallel_2 lt.eq C$ by (6.2). Consequently $X =
    parallel L_(upright("ann")) parallel_2$ satisfies $X^2 lt.eq C \( 1 + X \)$, proving the lemma. ◻
]

#thm([Lemma 6.2.])[
  (Exterior count).  #emph[There is a universal constant $C$ such that, for $0 < s lt.eq 1$,
#[#set math.equation(numbering: n => "(6.14)")
 $ bb(E) \# { i : a_(x_i) gt.eq s } lt.eq C M s^(- 3) . $ <m:eq:void-count>]

 The constant is independent of the charges and the distances between nuclei.]
] <m:lem:void-count>

#proof[
  Write $cal(R) = { R_1 \, dots.h \, R_M }$ and $d \( x \) = "dist" \( x \, cal(R) \)$.
    We use $d \( x \) lt.eq L a_x$ from Lemma 16. For a Borel set $B$, write $n \( B \) = \# { i : x_i in B }$.
    The local count bound (4.36), applied with $delta = 0$, gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ bb(E) n \( B \( y \, a_y \) \) lt.eq C max { a_y^(- 3) \, 1 } . $ <m:eq:void-net-local-count>]
  We first prove that
  #[#set math.equation(numbering: n => "(6.16)")
   $ bb(E) n \( { d gt.eq U } \) lt.eq C M $ <m:eq:void-net-far-count>]
  for a sufficiently large universal constant $U$. A direct summation of local bounds over all large distance
    scales would give an infinite series. We instead group scales into a bounded number of annuli to which
    Lemma 29 applies.
  ===== 6.1 Nested sets of nuclear representatives. <nested-sets-of-nuclear-representatives.>
  Fix
  $ h = 12 \, wide epsilon = 2^(1 - h) = 1 / 2048 \, wide D_0 = 1000 \, wide q = 10 . $
  Thus
  $ epsilon < 1 / 200 \, wide D_0 - epsilon > 400 \, wide D_0 > 3 epsilon \, wide 2^q > D_0 . $
  Choose an integer $j_0$ such that $2^(j_0) \/ L gt.eq 1$ and $2^(j_0 - 1)$ exceeds the lower threshold for the
    inner radius in Lemma 29. Set $U = 2^(j_0)$. Since the nuclei are distinct, there is an integer $l_0 < j_0 -
    h$ such that $cal(R)$ is $2^(l_0)$-separated. Put $P_(l_0) = cal(R)$.
    For each $l > l_0$, choose a maximal $2^l$-separated subset $P_l subset P_(l - 1)$,
    where separated means that distinct points have distance at least $2^l$.
  For each $p in P_(l - 1)$ choose a parent $pi_l \( p \) in P_l$, keeping $pi_l \( p \) = p$ for $p in P_l$.
    Maximality permits this choice with $\| p - pi_l \( p \) \| < 2^l$ whenever $p$ is removed.
    Composing these maps gives an ancestor $alpha_l \( R \) in P_l$ for every original nucleus $R$, and
  #[#set math.equation(numbering: n => "(6.17)")
   $ \| R - alpha_l \( R \) \| < 2^(l + 1) . $ <m:eq:void-net-ancestor-offset>]
  Indeed, the accumulated displacement is less than $sum_(k = l_0 + 1)^l 2^k < 2^(l + 1)$; at $l =
    l_0$ it is zero. Every representative is an original nucleus,
    and a removed nucleus never reappears in the nested sets.
  For $j gt.eq j_0$, put $u_j = 2^j$. Choose a nearest nucleus $R \( x \)$ measurably,
    breaking ties by the least index. Assign a point of the dyad $u_j lt.eq d \( x \) < 2 u_j$ to $c =
    alpha_(j - h) \( R \( x \) \) in P_(j - h)$, and denote its assigned set by $A_(j \, c)$.
    These are Borel sets, disjoint at each scale, and
  #[#set math.equation(numbering: n => "(6.18)")
   $ \| R \( x \) - c \| < epsilon u_j \, wide A_(j \, c) subset B \( c \, \( 2 + epsilon \) u_j \) .
     $ <m:eq:void-net-assigned-set>]
  ===== 6.2 Only finitely many crowded pairs. <only-finitely-many-crowded-pairs.>
  Call $\( j \, c \)$ crowded if there is a distinct $w in P_(j - h)$ with $\| w - c \| lt.eq D_0 u_j$;
    otherwise call it isolated. We claim that the number of crowded pairs is at most $C M$.
    For each crowded pair choose one witness $w$. The points $c$ and $w$ cannot both survive to $P_(j + q)$,
    since that set is $2^(j + q)$-separated and $2^(j + q) > D_0 u_j$.
    Let $r$ be the first level at which either endpoint is removed,
    and charge $\( j \, c \)$ to one such removal event $\( r \, p \)$, where $p in P_(r - 1) \\ P_r$. Then
  #[#set math.equation(numbering: n => "(6.19)")
   $ j - h < r lt.eq j + q \, wide upright("or equivalently") wide r - q lt.eq j lt.eq r + h -
     1 . $ <m:eq:void-net-charge-window>]
  A fixed removal event can therefore receive charges from at most $q + h$ levels $j$.
    At any one of these levels, a center $c$ charging $\( r \, p \)$ is either $p$ itself or has $p$ as its
    witness. In either case, $c in P_(j - h) ∩ overline(B) \( p \, D_0 u_j \)$.
    Such centers are $2^(j - h)$-separated. The disjoint balls of radius $2^(j - h - 1)$ around them lie in the
    ball of radius $D_0 u_j + 2^(j - h - 1)$ around $p$, so their number is at most $\( 1 + 2 D_0 2^h \)^3$.
    This is a fixed constant. There are at most $M - 1$ removal events,
    since the nested sets eventually contain one nucleus. Consequently
  #[#set math.equation(numbering: n => "(6.20)")
   $ \# { \( j \, c \) : j gt.eq j_0 \, med \( j \, c \) upright(" is crowded") } lt.eq
     C M . $ <m:eq:void-net-crowded-number>]
  Simultaneous removals cause no difficulty: the charge uses just one of the two removed endpoints.
  Each crowded assigned set has bounded expected particle count.
    To see this, choose a maximal $u_j \/ \( 2 L \)$-separated subset of $A_(j \, c)$.
    By (6.18), a volume comparison bounds its cardinality by $C L^3$.
    Its balls of radius $u_j \/ \( 2 L \)$ cover $A_(j \, c)$.
    At every center $y$ we have $a_y gt.eq d \( y \) \/ L gt.eq u_j \/ L gt.eq 1$,
    so these covering balls are contained in $B \( y \, a_y \)$. Equation (6.15) therefore gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ bb(E) n \( A_(j \, c) \) lt.eq C . $ <m:eq:void-net-assigned-count>]
  Together, (6.20) and (6.21) show that all crowded assigned sets cost at most $C M$ expected particles.
  ===== 6.3 Isolated runs give empty annuli. <isolated-runs-give-empty-annuli.>
  For a fixed nucleus $c$, the levels $j gt.eq j_0$ at which $c in P_(j - h)$ form an initial integer interval,
    possibly empty or infinite. Removing its crowded levels leaves consecutive runs of isolated levels.
    The number of these runs is at most one plus the number of crowded levels for $c$.
    Summing over $c$ and using (6.20), the total number of isolated runs is at most $C M$.
  At an isolated level $j$ for $c$, every original nucleus $R$ satisfies one of the two alternatives
  #[#set math.equation(numbering: n => "(6.22)")
   $ \| R - c \| < epsilon u_j wide upright("or") wide \| R -
     c \| > \( D_0 - epsilon \) u_j . $ <m:eq:void-net-cluster-dichotomy>]
  Indeed, if $alpha_(j - h) \( R \) = c$, the first alternative follows from (6.17).
    Otherwise isolation gives $\| alpha_(j - h) \( R \) - c \| > D_0 u_j$,
    and the ancestor offset gives the second alternative.
  The alternative for a fixed nucleus cannot change between consecutive isolated levels $j$ and $j +
    1$ for the same center $c$. A nucleus near $c$ at level $j$ remains too close to satisfy the far alternative
    at $j + 1$. Conversely, a nucleus far at $j$ could be near at $j +
    1$ only if its fixed distance from $c$ were both greater than $\( D_0 - epsilon \) u_j$ and less than $2
    epsilon u_j$, which is impossible because $D_0 > 3 epsilon$.
    Thus the set of near nuclei is constant throughout each isolated run.
    This argument permits ancestor maps to change and uses only the gap in (6.22).
  Consider first a finite run $j = a \, dots.h \, b$ and put
  $ O = c \, wide t = u_a \/ 2 \, wide T = 4 u_b . $
  The near nuclei have distance less than $epsilon u_a < t \/ 100$ from $c$.
    All other nuclei have distance greater than $\( D_0 - epsilon \) u_b > 100 T$.
    There is a nucleus at $c$, and $T \/ t = 2^(b - a + 3)$ is a power of two.
    By the choice of $j_0$, Lemma 29 applies. Every assigned point from this run belongs to its annulus,
    since $c$ is itself a nucleus and
  $ t lt.eq u_a lt.eq d \( x \) lt.eq \| x - c \| < \( 2 + epsilon \) u_b < T . $
  It follows that the union of the assigned sets over this run has expected particle count at most $C$,
    independently of its length. For an infinite run, apply the same argument to each finite initial segment and
    then use monotone convergence for their increasing assigned unions.
    There are at most $C M$ runs, so the total contribution of all isolated assigned sets is at most $C M$.
    Combined with the crowded sets, this proves (6.16).
  ===== 6.4 The remaining distances. <the-remaining-distances.>
  It remains to count particles with $a_x gt.eq s$ and $d \( x \) < U$.
    For the part with $d \( x \) < s$, choose a maximal $s \/ 2$-separated subset of ${ d < s \, med a gt.eq s }$.
    Its centers lie in $union.big_(m = 1)^M B \( R_m \, s \)$.
    Disjoint balls of radius $s \/ 4$ around them show, by volume comparison,
    that there are at most $C M$ centers. Their balls of radius $s \/
    2$ cover the set and are contained in the corresponding local balls $B \( y \, a_y \)$, since $a_y gt.eq s$.
    Equation (6.15) bounds this contribution by $C M s^(- 3)$.
  For a distance dyad $u lt.eq d \( x \) < 2 u$, choose a maximal $u \/ \( 2 L \)$-separated subset.
    Its centers lie in $union.big_m B \( R_m \, 2 u \)$, so there are at most $C L^3 M$ of them.
    Their local balls cover the dyad, because $a_y gt.eq d \( y \) \/ L gt.eq u \/ L$.
    Thus (6.15) bounds its expected count by
  $ C M max { \( u \/ L \)^(- 3) \, 1 } . $
  Take $u = 2^k s$ for $0 lt.eq k lt.eq K$, where $K$ is the least nonnegative integer such that $2^K s gt.eq U$.
    These dyads cover $s lt.eq d \( x \) < U$. The sum of the inverse-cube terms is bounded by $C s^(- 3)$.
    For the constant terms with $u < 1$, use $1 lt.eq u^(- 3)$; the number of remaining dyads, with $1 lt.eq
    u lt.eq 2 U$, is bounded by a universal constant. Their total contribution is therefore at most $C M s^(- 3)$.
    Adding (6.16) proves (6.14). ◻
]

== 7 Deterministic comparison fields <m:sec:barriers>

We now construct positive fields that can be compared across all the local scales.
  The construction uses only the nuclear measure. Its output is a family of continuous offsets satisfying a
  nonlinear subsolution inequality, together with a strictly positive gap when the scale doubles.
  The gap will allow the quantum field to replace a comparison field in the next stage of the proof.

Fix a nuclear system and a small parameter $r_(*) > 0$. Its value in terms of the excess charge,
  together with the dyadic scales used for the observations, will be chosen in Section 8.
  Every smallness threshold for $r_(*)$ in the present deterministic construction is universal and independent of
  the nuclear system.

Throughout this section, $p = 3 \/ 2$, $k = \( \( 5 \/ 3 \) c_(upright("TF")) \)^(- 3 \/ 2)$,
  and $c_(upright(F)) = 4 pi k$. Recall that $K \( x \) = \|
  x \|^(- 1)$ and that $a_x$ is the nuclear scale of Lemma 16.
  All constants in this section are independent of the nuclear configuration and charges.
  They may depend on the fixed localization constants and the smooth radial function $g$ used for wave packets.

=== 7.1 Global Thomas–Fermi fields <global-thomasfermi-fields>

The variational and comparison framework for point and smoothed sources is classical #cite(label("LiebSimon1977"))
  Theorems II.14, II.17–II.18, and IV.7–IV.10. We give a proof on the Coulomb-space cone used here,
  including the decay needed for comparison on an unbounded domain.
  If $zeta$ is a finite sum of positive point charges and nonnegative smooth compactly supported radial charges,
  write $V_zeta = K * zeta$. A radial charge is specified by its center, profile, and total mass. Set

$ cal(X)_(+) = { rho gt.eq 0 : rho in L^(5 \/ 3) \( bb(R)^3 \) ∩ \( dot(H)^1 \( bb(R)^3 \) \)^(*) } . $

By Lemma 10, the Coulomb energy of an element of this cone is the squared norm $D \( rho \) =
  parallel nabla K * rho parallel_2^2 \/ \( 8 pi \)$.

#thm([Lemma 7.1.])[
  (Global comparison problem).  #emph[Let $zeta$ be as above, with total mass $Q > 0$. The functional
$ cal(T)_zeta \( rho \) = c_(upright("TF")) integral rho^(5 \/ 3) - integral V_zeta rho + D \( rho \) \, wide
  rho in cal(X)_(+) \, $

 has a unique minimizer. Its field $W = V_zeta - K * rho$ satisfies
#[#set math.equation(numbering: n => "(7.1)")
 $ rho = k W_(+)^p \, wide Delta W = - 4 pi zeta + c_(upright(F)) W_(+)^p \, wide W gt.eq 0 \, wide
   integral rho lt.eq 2 Q . $ <m:eq:global-tf-equation>]

 The screening potential $K * rho$ is continuous and tends to zero at infinity.
   Consequently $W$ tends to zero at infinity and is continuous away from point charges.]
] <m:lem:barrier-global-tf>

#proof[
  Smear the point charges at any fixed positive widths and leave the smooth charges unchanged.
    This decomposes $V_zeta = V_s + V_c$ with $V_s in dot(H)^1$ and compactly supported $V_c in L^(5 \/ 2)$. Thus
  $ lr(|integral V_s rho|) lt.eq C parallel nabla V_s parallel_2 sqrt(D \( rho \)) \, wide
    lr(|integral V_c rho|) lt.eq parallel V_c parallel_(5 \/ 2) parallel rho parallel_(5 \/ 3) . $
  For the fixed source and smearing widths, both displayed potential norms are finite.
    Young’s inequality proves coercivity in both spaces defining $cal(X)_(+)$.
    A bounded minimizing sequence has weakly convergent subsequences in these two reflexive spaces.
    Their limits agree as distributions, since both converge against compact smooth tests;
    nonnegativity passes to this limit. The two linear terms are weakly continuous in their respective spaces,
    and both positive terms are weakly lower semicontinuous. This proves existence.
    The strictly convex kinetic term proves uniqueness.
  Nonnegative smooth compact variations give
  $ d := 5 / 3 c_(upright("TF")) rho^(2 \/ 3) - V_zeta + K * rho gt.eq 0 quad upright("almost everywhere") . $
  For bounded smooth compactly supported $phi$, the variations $\( 1 + t phi \)
    rho$ are admissible for sufficiently small positive and negative $t$.
    Indeed $\| phi rho \| lt.eq parallel phi parallel_oo rho$,
    and positivity of the Coulomb kernel bounds its Coulomb energy.
    The nonnegative pairing property in Lemma 10 therefore justifies differentiating these variations and gives
    $integral d phi rho = 0$. Hence $d rho = 0$, proving the Euler equation in (7.1) and its distributional Laplacian.
  To establish finite mass without assuming it, let the source components have centers $R_m$ and masses $Q_m$, and put
  $ U \( x \) = sum_m frac(Q_m, \| x - R_m \|) \, wide w \( x \) = U \( x \)^(- 1) . $
  Newton’s theorem gives $V_zeta lt.eq U$. Where $rho > 0$, the Euler equation gives $K * rho lt.eq V_zeta$.
    For any ball $B$, multiply this inequality by $1_B w rho$ and restrict the screening integral below to $B$.
    Write $q_m \( x \) = w \( x \) Q_m \/ \| x - R_m \|$, so that $sum_m q_m = 1$. The triangle inequality gives
  $ frac(w \( x \) + w \( y \), \| x - y \|) gt.eq sum_m frac(q_m \( x \) q_m \( y \), Q_m) . $
  The resulting symmetrization and Cauchy–Schwarz yield, with $m_B = integral_B rho$,
  $ m_B gt.eq 1 / 2 sum_m frac(\( integral_B q_m rho \)^2, Q_m) gt.eq frac(m_B^2, 2 Q) . $
  All integrals in this calculation are local and finite; in particular $w$ is bounded on $B$,
    and the local Coulomb energy is finite. Increasing $B$ proves $integral rho lt.eq 2 Q$.
  For completeness, $L^1 ∩ L^(5 \/ 3)$ implies continuity and decay of the screening potential.
    The kernel restricted to a fixed ball belongs to $L^(5 \/ 2)$,
    so its pairing with translates of $rho$ is continuous. The complementary kernel contributes at most $parallel
    rho parallel_1 \/ R$ when the cutoff radius is $R$. For fixed $R$,
    the local $L^(5 \/ 3)$ norm of $rho$ on a ball whose center tends to infinity tends to zero.
    First letting the center tend to infinity and then $R arrow.r oo$ proves decay.
  Finally, $\( W + epsilon \)_(-)$ is compactly supported away from point charges for every $epsilon > 0$:
    $W arrow.r 0$ at infinity, and its positive Coulomb singularities dominate the continuous screening potential.
    On the support of this test $rho = 0$, and hence $Delta W lt.eq 0$.
    Testing the equation gives $integral \| nabla \( W + epsilon \)_(-) \|^2 lt.eq 0$.
    The test is justified by compact $H^1$ approximation away from the singularities.
    Letting $epsilon arrow.b 0$ proves $W gt.eq 0$. ◻
]

#thm([Lemma 7.2.])[
  (Point fields and mixtures).  #emph[For one point charge $Q > 0$ at $R$, the field in Lemma 31 satisfies
#[#set math.equation(numbering: n => "(7.2)")
 $ W \( x \) gt.eq c min (frac(Q, \| x - R \|) \, \| x - R \|^(- 4)) . $ <m:eq:single-field-lower>]

 For a single point charge or radial smooth charge of mass $Q$, its screening potential is bounded by $C Q^(4 \/ 3)$.]
  #emph[More generally, select source components of masses $Q_i$, truncate them to masses $q_i lt.eq Q_i$,
    and put $q = sum_i q_i > 0$. Let $W_i$ be the single-source field of mass $q$ at the $i$th center with that
    source’s normalized profile. If $W$ is the full-source field, then
#[#set math.equation(numbering: n => "(7.3)")
 $ sum_i q_i / q W_i lt.eq W . $ <m:eq:tf-mixture>]

]
] <m:lem:barrier-mixture>

#proof[
  For a single source, Newton’s theorem and the Euler equation give $rho \( z \) lt.eq
    k \( Q \/ \| z - R \| \)^(3 \/ 2)$. For every $x \, R$ and $s > 0$,
  #[#set math.equation(numbering: n => "(7.4)")
   $ integral_(B \( x \, s \)) frac(d z, \| x - z \| thin \| z - R \|^(3 \/ 2)) lt.eq
     C s^(1 \/ 2) . $ <m:eq:local-power-potential>]
  To see the uniformity in $R$, apply Hölder with exponent $q_1
    in \( 3 \/ 2 \, 2 \)$ to the second factor and its conjugate $q'_1 in \( 2 \, 3 \)$ to the first.
    The integrals of both radial powers over $B \( x \, s \)$ are bounded by their integrals over centered balls
    of the same radius. Their powers of $s$ combine to $s^(1 \/ 2)$.
    Split $K * rho \( x \)$ at $s = Q^(- 1 \/ 3)$. The near part is at most $C Q^(3 \/ 2) s^(1 \/ 2)$ by (7.4),
    and the far part at most $2 Q \/ s$ by Lemma 31. Both are $C Q^(4 \/ 3)$.
  For a point charge this gives $W gt.eq Q \/ \( 2 d \)$ for $d = \| x - R \| lt.eq c Q^(- 1 \/ 3)$.
    Outside that sphere set $v = lambda d^(- 4)$. For sufficiently small universal $lambda > 0$,
  $ Delta v = 12 lambda d^(- 6) gt.eq c_(upright(F)) v^(3 \/ 2) \, $
  and its boundary value is below the preceding lower bound.
    On the exterior domain, testing the equation for $v - W$ with $\( v - W - epsilon \)_(+)$ gives a nonpositive
    gradient square bounded below by zero. This test has compact support since both fields decay.
    Thus $v lt.eq W$. Together with the inner estimate this proves (7.2).
  For the mixture $F = sum_i \( q_i \/ q \) W_i$, convexity gives
  $ Delta F gt.eq - 4 pi zeta_(upright("truncated")) + c_(upright(F)) F^p gt.eq - 4 pi zeta + c_(upright(F)) F^p . $
  Compare with the equation for $W$ and test with $\( F - W - epsilon \)_(+)$. The support is compact.
    Near a point charge whose mass was strictly decreased, $F - W$ tends to $- oo$, so the test vanishes there.
    If the masses agree, the singular terms cancel and the difference is locally $H^1$.
    The remaining density terms are locally in $L^(5 \/ 3)$, so compact $H^1$ approximation is valid.
    Monotonicity of the power gives $F lt.eq W$. ◻
]

=== 7.2 Fields adapted to the nuclear scale <fields-adapted-to-the-nuclear-scale>

Fix a sufficiently small constant $c_1 in \( 0 \, 1 \/ 100 \)$.
  Smear the $m$th nucleus with the radial probability $g_(c_1 a_(R_m))^2$ and denote the resulting density by
  $nu_s$. Put

#[#set math.equation(numbering: n => "(7.5)")
 $ V_s = K * nu_s \, wide V_c = V - V_s gt.eq 0 . $ <m:eq:nuclear-splitting>]

The subscript $c$ records the part confined near the nuclei.
  A nucleus contributing to $V_c \( x \)$ lies within $2 c_1 a_x$ of $x$.
  Its scale is comparable to $a_x$, and the total contributing charge is at most $a_x^(- 3)$. Therefore

#[#set math.equation(numbering: n => "(7.6)")
 $ nu_s \( x \) lt.eq C a_x^(- 6) \, wide V_c in L_c^(5 \/ 2) \( bb(R)^3 \) . $ <m:eq:smoothed-source-bounds>]

The smooth potentials of nuclei within any of the fixed local multiples of $a_x$ used below sum to at most $C
  a_x^(- 4)$. Indeed each such width is comparable to $a_x$,
  each unit-mass smooth potential is at most $C \/ a_x$, and the total local charge is at most $a_x^(- 3)$.

Let $W_0 \, rho_0$ be the field and density for the original nuclear measure $nu$. Its continuous offset is

$ h_0 = W_0 - V_c = V_s - K * rho_0 . $

For a fixed positive $theta$, to be chosen below, let $W_s$ be the field for the smooth source $theta nu_s$.

#thm([Lemma 7.3.])[
  (Two reference fields).  #emph[There are fixed constants $c_0 > 0$, $theta > 0$, $c_theta > 0$,
    and $C < oo$ such that, off the nuclei,
#[#set math.equation(numbering: n => "(7.7)")
 $ W_0 \( x \) gt.eq c_0 a_x^(- 4) \, wide \| h_0 \( x \) \| lt.eq C a_x^(- 4) \, $ <m:eq:reference-field-bounds>]

 and everywhere
#[#set math.equation(numbering: n => "(7.8)")
 $ c_theta a_x^(- 4) lt.eq W_s \( x \) lt.eq C a_x^(- 4) \, wide \| nabla W_s \( x \) \| lt.eq C a_x^(- 5) \, wide
   W_s \( x \) lt.eq 1.01 W_0 \( x \) . $ <m:eq:smooth-reference-bounds>]

 Here $h_0$ is continuous, and $W_s$ is locally $C^1$. Both fields decay at infinity.]
] <m:lem:barrier-fields>

#proof[
  By the scale definition, $nu \( B \( x \, 2 L a_x \) \) > \( 2 a_x \)^(- 3)$.
    Truncate charges in this ball to total $q = \( 2 a_x \)^(- 3)$ and apply Lemma 32.
    Their distances from $x$ are at most $2 L a_x$, so (7.2) gives the first bound in (7.7) with a fixed $c_0 > 0$.
  If some charges contribute to $V_c \( x \)$, denote their total by $q lt.eq a_x^(- 3)$.
    The screening estimate for each single field of charge $q$, followed by the mixture comparison, gives
  $ W_0 \( x \) gt.eq sum_(upright("contributors")) frac(z_m, \| x - R_m \|) - C q^(4 \/ 3) gt.eq V_c \( x \) -
    C a_x^(- 4) . $
  If there are no contributors, the same conclusion follows from $W_0 gt.eq 0$.
  For the upper bound, set $a = a_x$, $s = 4 a$, and let $V_(upright("loc"))$ be the potential of nuclei within
    $20 a$ of $x$. On $B \( x \, s \)$ the function
  $ V_(upright("loc")) \( z \) + frac(C s^4, \( s^2 - \| z - x \|^2 \)^4) $
  is a supersolution of the field equation when $C$ is large:
    the Laplacian of the second term is at most $80 C s^6 \/ \( s^2 - \| z - x \|^2 \)^6$,
    whereas its $p$th power has the same spatial dependence and coefficient $C^(3 \/ 2)$.
    The boundary blowup dominates $W_0 - V_(upright("loc"))$.
    The positive-difference test is legitimate because the point singularities cancel.
    Thus $W_0 \( x \) lt.eq V_(upright("loc")) \( x \) + C a^(- 4)$.
    Subtracting $V_c \( x \)$ and using the smooth local potential bound proves the upper offset estimate.
    The expression defining $h_0$ proves its continuity.
  For $W_s$, the same bump without $V_(upright("loc"))$ is a supersolution after its coefficient is enlarged to
    absorb the locally bounded source $4 pi theta nu_s$. This proves $W_s lt.eq C a^(- 4)$.
    Its Laplacian is bounded by $C a^(- 6)$ on a local ball. Subtract the Newton potential of this source
    restricted to that ball. Its gradient is bounded by $C a^(- 5)$,
    since the integral of $\| z \|^(- 2)$ on a ball of radius $a$ is $C a$.
    The remaining harmonic function is bounded by $C a^(- 4)$ on a smaller ball;
    its interior gradient bound proves the stated estimate and local $C^1$ regularity.
  For the lower bound, select and truncate the same charges as in the first paragraph,
    before multiplying them by $theta$. Their smearing widths are at most $3 c_1 a$,
    because their centers are within $2 L a$. A single such blob of charge $theta \( 2 a \)^(- 3)$ has bare
    potential at $x$ at least $c_L theta a^(- 4)$: every source point is within $\( 2 L + 3 c_1 \) a$ of $x$.
    Its screening potential is at most $C theta^(4 \/ 3) a^(- 4)$.
    Choose $theta$ sufficiently small and apply the mixture comparison to obtain $W_s gt.eq c_theta a^(- 4)$.
  Decrease $theta$ further if necessary. The source bound and the lower bound for $W_0$ imply
  $ 4 pi theta nu_s lt.eq c_(upright(F)) #scale(x: 120%, y: 120%)[\(] 1.01^(3 \/ 2) -
    1.01 #scale(x: 120%, y: 120%)[\)] W_0^(3 \/ 2) . $
  Consequently $1.01 W_0$ is a supersolution for the field of $theta nu_s$;
    its extra negative point sources have the required sign. The positive-difference test for $W_s - 1.01 W_0$,
    supported away from those point singularities, proves the final comparison. Decay follows from Lemma 31. ◻
]

The reference fields now have positive lower bounds at every scale.
  To compare them with the local quantum constructions, we also need to control variation over a much smaller
  ball. The offset is the right quantity for this purpose: subtracting $V_c$ removes every nuclear singularity
  from the function being compared.

#thm([Lemma 7.4.])[
  (Oscillation of offsets).  #emph[Fix $y$ and write $a = a_y$.
    Let $h = h_0$, or let $h = W - V_c$ for an interior Thomas–Fermi patch centered at $y$ satisfying the
    hypotheses of Lemma 18. Then $h$ has a continuous representative.
    For $0 < s lt.eq a \/ 10$ and $\| z - y \| lt.eq s$,
#[#set math.equation(numbering: n => "(7.9)")
 $ \| h \( z \) - h \( y \) \| lt.eq C a^(- 4) \( s \/ a \)^(1 \/ 2) +
   C \( s \/ a \) h \( y \)_(-) . $ <m:eq:offset-oscillation>]

 For $h = h_0$ the final term can be omitted.]
] <m:lem:barrier-oscillation>

#proof[
  In either case the local upper field estimate in (4.23) or Lemma 33 gives $h lt.eq
    C a^(- 4)$ on a fixed ball about $y$. The patch core is absent there.
    The Euler equation, the bound on $nu_s$, and the weighted power inequality give
  #[#set math.equation(numbering: n => "(7.10)")
   $ \| Delta h \( z \) \| lt.eq C a^(- 6) + C a^(- 3 \/ 2) sum_(upright("loc")) z_m \| z -
     R_m \|^(- 3 \/ 2) . $ <m:eq:offset-laplacian-bound>]
  Here all centers in the sum belong to one fixed local ball and their total charge is at most $a^(- 3)$.
    The same estimate holds for $h_0$ by Lemma 33.
  Take the Newton particular solution for this Laplacian restricted to a ball of radius $a$.
    Equation (7.4) bounds it by $C a^(- 4)$ on a smaller ball.
    Its variation over distance $s$ is at most $C a^(- 4) \( s \/ a \)^(1 \/ 2)$.
    In detail, the part within distance $C s$ of either evaluation point is at most
  $ C #scale(x: 120%, y: 120%)[\(] a^(- 6) s^2 + a^(- 9 \/ 2) s^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  On a dyadic ring of radius $l gt.eq C s$, the difference of the two Coulomb kernels is at most $C s \/ l^2$,
    and the source mass in that ring is at most $C \( a^(- 6) l^3 + a^(- 9 \/ 2) l^(3 \/ 2) \)$.
    Summing the rings up to radius $a$ gives the asserted variation.
  The harmonic remainder is bounded above by $C a^(- 4)$. Harnack’s inequality and the harmonic gradient estimate,
    applied to this upper constant minus the remainder, bound its variation by
    $C \( s \/ a \) \( a^(- 4) + h \( y \)_(-) \)$. Combining the estimates gives (7.9), as well as continuity.
    For $h_0$, Lemma 33 bounds its negative part by $C a^(- 4)$, which is absorbed by the first term. ◻
]

=== 7.3 Averaging at a smaller radius <averaging-at-a-smaller-radius>

Fix $w = 10^(- 5)$, and use the small parameter $r_(*)$ fixed above.
  Define the smearing widths, center kernels, and averaging operator by

#[#set math.equation(numbering: n => "(7.11)")
 $ t_z = c_1 a_z min \( a_z \, r_(*) \)^w \, wide cal(K)_z \( y \) = g_(t_z)^2 \( y - z \) \, wide R f \( y \) =
   integral cal(K)_z \( y \) f \( z \) thin d z \, wide tau_y = t_y \/ a_y . $ <m:eq:master-kernel>]

Thus $R$ smooths a mass at its own center-dependent width.
  It preserves total mass, although it need not preserve the constant function exactly.

#thm([Lemma 7.5.])[
  (Kernel and potential estimates).  #emph[Uniformly as $r_(*) arrow.b 0$,
    a center contributing to $R f \( y \)$ satisfies $\| z - y \| lt.eq 2 t_y$ and $t_z \/ t_y = 1 +
    O \( r_(*)^w \)$. Moreover,
#[#set math.equation(numbering: n => "(7.12)")
 $ R 1 \( y \) = 1 + O \( r_(*)^w \) \, wide parallel nabla_z cal(K)_z \( y \) parallel_oo lt.eq C t_y^(- 4) \,
   wide parallel nabla_z cal(K)_z \( y \) parallel_2 lt.eq C t_y^(- 5 \/ 2) . $ <m:eq:master-kernel-bounds>]

 The norms in these gradient estimates are taken in the center variable $z$.
   The operator $R$ is bounded on $L^(5 \/ 3)$ and preserves integrals. The correction
#[#set math.equation(numbering: n => "(7.13)")
 $ q_0 = K * \( rho_0 - R rho_0 \) $ <m:eq:potential-correction>]

 is nonnegative, continuous, belongs to $dot(H)^1$, and tends to zero at infinity. It satisfies
#[#set math.equation(numbering: n => "(7.14)")
 $ 0 lt.eq q_0 \( y \) lt.eq C a_y^(- 4) tau_y^(1 \/ 2) . $ <m:eq:potential-correction-bound>]

]
] <m:lem:barrier-kernel>

#proof[
  The scale function is $1 \/ L$-Lipschitz. The function $a mapsto c_1 a
    min \( a \, r_(*) \)^w$ has Lipschitz constant $O \( r_(*)^w \)$.
    Thus $\| t_z - t_y \| lt.eq O \( r_(*)^w \) \| z - y \|$.
    If $\| z - y \| lt.eq t_z$, this proves the support and comparability assertions.
    Replacing $t_z$ by $t_y$ changes the kernel by at most $C r_(*)^w t_y^(- 3)$ on a ball of radius $2 t_y$,
    giving the first assertion of (7.12). The chain rule for a Lipschitz width gives the gradient bounds,
    first pointwise almost everywhere and then in $L^2$ by the support bound.
    Since $integral cal(K)_z \( y \) thin d y = 1$, Fubini proves preservation of integrals.
    Weighted Jensen followed by Fubini, using the bound on $R 1$, proves the $L^(5 \/ 3)$ estimate.
  Newton’s theorem gives the nonnegative representation
  $ q_0 \( y \) = integral rho_0 \( z \) #scale(x: 120%, y: 120%)[\[]
    K \( y - z \) - \( K * g_(t_z)^2 \) \( y - z \) #scale(x: 120%, y: 120%)[\]] thin d z . $
  Only $\| z - y \| lt.eq 2 t_y$ contributes. The local field bound gives
  $ rho_0 \( z \) lt.eq C a_y^(- 6) + C a_y^(- 3 \/ 2) sum_(upright("loc")) z_m \| z - R_m \|^(- 3 \/ 2) . $
  Equation (7.4) therefore bounds the displayed integral by
    $C \( a_y^(- 6) t_y^2 + a_y^(- 9 \/ 2) t_y^(1 \/ 2) \)$, proving (7.14).
    Both $rho_0$ and $R rho_0$ belong to $L^1 ∩ L^(5 \/ 3)$, hence also to $L^(6 \/ 5)$.
    Their potentials are continuous and decay by the proof of Lemma 31;
    the Sobolev inequality and the Coulomb energy identity put their difference in $dot(H)^1$. ◻
]

Define the nonlinearity acting on an offset $h in bb(R)$ by

#[#set math.equation(numbering: n => "(7.15)")
 $ f_y \( h \) = c_(upright(F)) integral cal(K)_z \( y \) \( V_c \( z \) + h \)_(+)^p thin d z .
   $ <m:eq:offset-reaction>]

For each $y$, this is finite, convex, continuous, and nondecreasing in $h$.
  These properties follow from those of the positive power and the local integrability of $V_c^p$.
  We will use this averaged law in place of the unsmeared Thomas–Fermi equation.

=== 7.4 Barriers with a strict gap between scales <barriers-with-a-strict-gap-between-scales>

We have established the reference fields and the averaging estimates.
  The remaining task is to lower the reference field just enough that its averaged density pays for the Laplacian
  of the lowering term. The strict inequality between the coefficients below leaves room for all errors from averaging.

#thm([Lemma 7.6.])[
  (Comparison barriers).  #emph[There are fixed positive constants $alpha \, epsilon.alt_0 \, C'_0 \, c_b \,
    c'$ with the following properties for all sufficiently small $r_(*) > 0$. For $0 < r lt.eq r_(*)$ define
#[#set math.equation(numbering: n => "(7.16)")
 $ Gamma_r = epsilon.alt_0 W_s + C'_0 r^(4 alpha) W_s^(1 + alpha) \, wide B_r = W_0 + q_0 - Gamma_r \, wide b_r =
   B_r - V_c \, wide h_b = h_0 - c_b a^(- 4) . $ <m:eq:barrier-definition>]

 The offsets $b_r$ are continuous and locally $H^1$ and decay at infinity.
   On ${ a gt.eq r }$ their Laplacian densities satisfy
#[#set math.equation(numbering: n => "(7.17)")
 $ Delta b_r gt.eq - 4 pi nu_s + f_y \( b_r \) . $ <m:eq:barrier-subsolution>]

 More precisely, this inequality holds almost everywhere there between the locally integrable densities
   representing the two sides; on every open set contained in this region it is also a distributional inequality.
   On the same region,
#[#set math.equation(numbering: n => "(7.18)")
 $ B_r gt.eq 0.9 W_0 > 0 \, wide h_b + c' a^(- 4) lt.eq b_r lt.eq C a^(- 4) . $ <m:eq:barrier-bounds>]

 For every contributing center $z$ in (7.15),
#[#set math.equation(numbering: n => "(7.19)")
 $ V_c \( z \) + h_b \( y \) gt.eq c a_y^(- 4) quad upright("almost everywhere in ") z .
   $ <m:eq:reaction-positive-margin>]

 All these constants are independent of $r \, r_(*)$ and the nuclear system.]
] <m:lem:barrier-subsolution>

#proof[
  First fix $theta$ as in Lemma 33. That lemma implies
  $ D_(*) := sup_x frac(\| nabla W_s \( x \) \|^2, W_s \( x \)^(5 \/ 2)) < oo $
  with a fixed universal bound. Since $Delta W_s lt.eq c_(upright(F)) W_s^(3 \/ 2)$, the chain rule gives
  $ Delta \( W_s^(1 + alpha) \) lt.eq \( 1 + alpha \) \( c_(upright(F)) + alpha D_(*) \) W_s^(alpha + 3 \/ 2) . $
  Choose $alpha > 0$ so small that $\( 1 + alpha \) \( 1 + alpha D_(*) \/ c_(upright(F)) \) lt.eq 1.1$. Consequently
  #[#set math.equation(numbering: n => "(7.20)")
   $ Delta Gamma_r lt.eq 1.1 c_(upright(F)) sqrt(W_s) thin Gamma_r . $ <m:eq:damping-laplacian>]
  All chain rules are local: $W_s$ is positive and locally $C^1$ with locally bounded Laplacian,
    so multiplication in the weak equation justifies them.
  Choose $c_b > 0$ smaller than a sufficiently small fixed fraction of $c_0$.
    On $a gt.eq r$, $r^(4 alpha) W_s^alpha lt.eq C^alpha$. We may therefore choose positive $epsilon.alt_0 \,
    C'_0$ so small that, throughout this region, $Gamma_r$ is a tiny fixed fraction of $W_s$,
    is at most $0.1 c_0 a^(- 4)$, and is at most $\( c_b \/ 2 \) a^(- 4)$. At the same time,
  #[#set math.equation(numbering: n => "(7.21)")
   $ Gamma_r gt.eq epsilon.alt_0 c_theta a^(- 4) . $ <m:eq:damping-lower>]
  These choices precede every smallness requirement on $r_(*)$.
  The equations for $h_0$ and $q_0$ give the exact cancellation
  #[#set math.equation(numbering: n => "(7.22)")
   $ Delta \( h_0 + q_0 \) = - 4 pi nu_s + c_(upright(F)) R \( W_0^p \) . $ <m:eq:smoothed-reference-equation>]
  Fix $y$ with $a_y gt.eq r$. For a contributing center $z$, the offset oscillation estimate and (7.14) imply
  $ V_c \( z \) + b_r \( y \) & = W_0 \( z \) + h_0 \( y \) - h_0 \( z \) + q_0 \( y \) - Gamma_r \( y \)\
 & lt.eq W_0 \( z \) - Gamma_r \( y \) + C a_y^(- 4) tau_y^(1 \/ 2) . $
  By (7.21), the final error is $o \( Gamma_r \( y \) \)$ uniformly as $r_(*) arrow.r 0$. Furthermore,
  $ W_0 \( z \) gt.eq frac(W_s \( z \), 1.01) gt.eq frac(1 - o \( 1 \), 1.01) W_s \( y \) \, $
  using the gradient and lower bounds for $W_s$ and $\| z - y \| lt.eq 2 t_y$.
    The chosen small ratio $Gamma_r \/ W_s$ and the derivative of the power therefore give
  $ W_0 \( z \)^p - \( V_c \( z \) + b_r \( y \) \)_(+)^p gt.eq 1.35 sqrt(W_s \( y \)) thin Gamma_r \( y \) $
  for sufficiently small damping fractions and then sufficiently small $r_(*)$.
    Indeed the limiting coefficient is $p \/ sqrt(1.01) > 1.49$.
    After integration in $z$, the factor $R 1 \( y \) = 1 + o \( 1 \)$ leaves the lower bound $1.3
    sqrt(W_s \( y \)) Gamma_r \( y \)$. Combine this with (7.22) and (7.20) to prove (7.17).
    All terms represent locally integrable densities, so the assertion includes points of a level set of $a$ up to
    a Lebesgue-null set; no regularity of those level sets is required.
  Because $q_0 gt.eq 0$ and $Gamma_r lt.eq 0.1 W_0$, we have $B_r gt.eq 0.9 W_0$.
    The upper offset bound follows from $b_r lt.eq h_0 + q_0$. Also
  $ b_r - h_b = q_0 - Gamma_r + c_b a^(- 4) gt.eq \( c_b \/ 2 \) a^(- 4) \, $
  so one may take $c' = c_b \/ 2$. On the kernel support,
  $ V_c \( z \) + h_b \( y \) = W_0 \( z \) + h_0 \( y \) - h_0 \( z \) - c_b a_y^(- 4) gt.eq c a_y^(- 4) \, $
  by the lower bound for $W_0$, scale comparability, and the offset oscillation estimate,
    after decreasing $r_(*)$ further. This proves (7.19).
  Finally, $h_0 \, q_0$ are continuous and locally $H^1$, and the same is true of $Gamma_r$.
    Their decay proves the remaining assertions. ◻
]

#thm([Lemma 7.7.])[
  (Gap under doubling).  #emph[Fix $kappa in \( 0 \, 1 \/ 10 \)$.
    The barriers in Lemma 36 have a fixed constant $gamma > 0$ such that, whenever $R_(+) = 2 r lt.eq r_(*)$,
#[#set math.equation(numbering: n => "(7.23)")
 $ b_r - b_(R_(+)) gt.eq gamma R_(+)^(- 4) wide upright("on ") { R_(+) lt.eq
   a lt.eq \( 1 + kappa \) R_(+) } . $ <m:eq:barrier-gap>]

]
] <m:lem:barrier-gap>

#proof[
  The difference is exactly
  $ b_r - b_(R_(+)) = C'_0 \( 1 - 2^(- 4 alpha) \) R_(+)^(4 alpha) W_s^(1 + alpha) . $
  The lower bound for $W_s$ gives the assertion with
  $ gamma = C'_0 \( 1 - 2^(- 4 alpha) \) c_theta^(1 + alpha) \( 1 + kappa \)^(- 4 \( 1 + alpha \)) > 0 . $
  ◻
]

The lower margin in (7.19) also controls inversion of the averaged law.
  If $delta_0 > 0$ is a sufficiently small fixed constant, differentiation under the integral gives

#[#set math.equation(numbering: n => "(7.24)")
 $ frac(d, d h) frac(f_y \( h \), 4 pi) gt.eq c a_y^(- 2) wide upright("for ") h gt.eq h_b \( y \) -
   delta_0 a_y^(- 4) . $ <m:eq:barrier-reaction-derivative>]

Indeed $\( V_c \( z \) + h \)_(+)^(p - 1) gt.eq c a_y^(- 2)$ on the kernel support,
  and $R 1 \( y \)$ is bounded below. This derivative bound and the gap (7.23) are the two margins used in the
  conditional field comparisons and the subsequent passage from $r$ to $2 r$.

== 8 Noisy observations and conditional screening <m:sec:conditioning>

We compare the conditional electron density with the nonlinear reaction law of Section 7.
  The observation noise makes a rare data event inexpensive to impose on the eigenstate.
  A local quantum comparison in the resulting state will then rule out each failure of the desired inverse
  relation. We use the master kernels and deterministic barriers of Section 7,
  with the small parameter now chosen from the proposed excess charge.

Suppose, towards a contradiction, that the asserted uniform excess-charge bound fails.
  By Lemma 6, choose systems at their largest strictly bound sectors such that

$ K_(upright("exc")) := N - Z > 0 \, wide K_(upright("exc")) \/ M arrow.r oo . $

Fix a universal constant $B_0 > 2$, to be enlarged in the final argument, and define

#[#set math.equation(numbering: n => "(8.1)")
 $ r_(*) = \( B_0 M \/ K_(upright("exc")) \)^(1 \/ 3) arrow.r 0 \, wide r_0 = 2^(- n) r_(*) \, wide r_j =
   2^j r_0 quad \( 0 lt.eq j lt.eq n \) \, $ <m:eq:barrier-scales>]

where the finite integer $n gt.eq 1$ is chosen so that $r_0 < Z^(- 1 \/ 3)$.
  The crude bound $N lt.eq 3 Z$ and $M gt.eq 1$ imply $r_(*) > Z^(- 1 \/ 3)$.
  All subsequent smallness assertions concern this sequence of systems;
  their thresholds will be universal and independent of $n$.

=== 8.1 The common observation construction in molecular geometry <the-common-observation-construction-in-molecular-geometry>

Set $ell_j = r_j^1.01$ for $j < n$. Use the unordered arrays and likelihood versions of Section 5,
  with $N$ particles, indices $j \, dots.h \, n - 1$, and $cal(F)_n$ trivial.
  The master kernels are those of (7.11). Define

$ mu_j \( y \) = bb(E) [sum_(i = 1)^N cal(K)_(x_i) \( y \) divides cal(F)_j] \, wide H_j = V_s - K * mu_j . $

Lemma 25 gives the joint versions, fixed-system regularity, Poisson equation, and the tower property.
  Here the ground state attains $E$, so Lemma 26 gives offset $C ell_j^(- 2)
  log^5 \( e \/ P_A \)$ for every event of probability $P_A > 0$.

=== 8.2 Upper tails and a spatial cap <upper-tails-and-a-spatial-cap>

The observations have two uses. First, their conditional electron density is a continuous field to which elliptic
  comparisons apply. Second, an event of these observations can be imposed at the small energy cost in Lemma 26.
  We first use that cost to exclude large positive fields and excessive local observed counts.

For this subsection fix a numerical constant $L_1 gt.eq 1$.
  Its value will be chosen after the universal field caps have been obtained.
  At scale $r = r_j$, put $R_(+) = 2 r$. Constants in estimates of small probabilities may depend on $L_1$;
  the field thresholds below do not.

#thm([Lemma 8.1.])[
  (Positive conditional-field tail).  #emph[If $r \/ 2 lt.eq a_y lt.eq 5 L_1 r$, then,
    for a universal $C$ and every $s > C$,
#[#set math.equation(numbering: n => "(8.2)")
 $ bb(P) { H_j \( y \) > s a_y^(- 4) } lt.eq e exp { - c_(L_1) \( s - C \)^(2 \/ 5) a_y^(- 1 + .004) } .
   $ <m:eq:cond-tail>]

 All estimates hold for sufficiently small $r_(*)$, uniformly in $j < n$.]
] <m:lem:cond-tail>

#proof[
  Write $a = a_y$ and tilt the event in question, if it has positive probability $P_A$.
    By the tower property, its average of $K * mu_j$ is the tilted raw average of the potential of the master
    smears. Nuclei within a fixed multiple of $a$ contribute at most $C a^(- 4)$ to $V_s$.
    More distant electron smears have exactly their bare potential at $y$:
    a contributing smear near $y$ has center within $2 t_y lt.double a$.
    Dropping the remaining negative electron terms therefore gives
  $ bb(E) \[ H_j \( y \) divides A \] lt.eq C a^(- 4) + bb(E)_(psi_A) J_y . $
  Lemmas 17 and 19, with no initial cut, bound the last expression by $C a^(- 4) + C sqrt(delta \/ a)$.
    Indeed, for small $a$, their scale quantity is bounded by $C \( a^(- 7) + delta \)$.
    Lemma 26 and $ell_j gt.eq c_(L_1) a^(1 + .01)$ imply
  $ s - C lt.eq C a^(7 \/ 2) ell_j^(- 1) log^(5 \/ 2) \( e \/ P_A \) lt.eq
    C_(L_1) a^2.49 log^(5 \/ 2) \( e \/ P_A \) . $
  Solving for $P_A$ proves the assertion. The deterministic threshold comes solely from the universal local field
    estimates. ◻
]

Call ${ r lt.eq a lt.eq 2 L_1 R_(+) }$ the participating band.
  Use a grid of closed cubes $Q$ of side $r \/ 100$ meeting this band.
  Let $Q'$ be concentric enlargements, chosen with bounded overlap to contain every ball of radius $r$ centered in
  $Q$, with an additional margin. The Lipschitz bound for $a$ ensures that $a_Q := inf_(Q') a gt.eq
  r \/ 2$ and that all points in $Q'$ fall in the range of Lemma 38.
  Choose smooth $0 lt.eq chi_Q lt.eq 1$ equal to one on $Q$, supported in $Q'$, with $\| Delta chi_Q \| lt.eq
  C r^(- 2)$.

#thm([Lemma 8.2.])[
  (Spatial cap and its exceptional cost).  #emph[There are universal thresholds $C'_(upright("cap")) \,
    C_(upright("cap"))$ with the following properties. Define
$ Q upright(" is bad") & quad arrow.l.r.double quad sup_Q H_j > C'_(upright("cap")) a_Q^(- 4) \,\
B_Q & = upright(bold(1))_({ Q upright(" bad") }) sup_Q \( H_j \)_(+) \, wide Pi = sum_Q B_Q chi_Q \, wide cal(E) =
  union.big_(Q upright(" bad")) Q' . $

 Then $H_j - Pi lt.eq C_(upright("cap")) a^(- 4)$ on the participating band. For each fixed $m gt.eq 1$ and $A' > 0$,
#[#set math.equation(numbering: n => "(8.3)")
 $ bb(P) \( Q upright(" bad") \) + a_Q^(4 m) bb(E) B_Q^m lt.eq C_(L_1 \, m \, A') r^(A') . $ <m:eq:cond-cap-moments>]

 At each deterministic point, $bb(P) \( y in cal(E) \)$ has the same arbitrarily high polynomial bound.
   The cube families are finite, and
#[#set math.equation(numbering: n => "(8.4)")
 $ sum_Q \| Q' \| lt.eq C_(L_1) M r^3 . $ <m:eq:cond-band-volume>]

 All these random objects are jointly measurable in the data and the spatial variable.
   For the fixed system and scale, their sizes and supports have deterministic bounds.]
] <m:lem:cond-cap>

#proof[
  Since $Delta H_j gt.eq - C a_Q^(- 6)$ on $Q'$, adding a quadratic and applying the ball submean inequality
    gives, for any fixed large $C'$ and a universal $C''$,
  $ sup_Q H_j lt.eq C'' a_Q^(- 4) + C r^(- 3) integral_(Q') \( H_j - C' a_Q^(- 4) \)_(+) . $
  The same inequality follows for distributional Laplacians by mollification.
    Choose $C'$ above the threshold in Lemma 38. Because $a_z \/ a_Q$ is bounded and $a_z lt.eq 5 L_1 r$ on $Q'$,
    integration of that tail yields
  $ bb(E) \( H_j \( z \) - C' a_Q^(- 4) \)_(+)^m lt.eq C a_Q^(- 4 m) r^(A') $
  for arbitrary fixed $m \, A'$. Jensen’s inequality for the spatial average gives the same bound for the integral
    term. Taking $C'_(upright("cap")) > C'' + 1$, Markov’s inequality gives the bad-cube probability.
    On a bad cube its supremum is bounded by the integral term plus $C'' a_Q^(- 4)$;
    the probability just proved controls the latter contribution to every moment. This proves (8.3).
  If a point lies in a bad cube, the corresponding term of $Pi$ dominates $\( H_j \)_(+)$ there.
    Otherwise the good-cube bound gives the asserted cap, since $a_Q$ and the local scale are comparable by a
    universal factor. At a fixed point only a bounded number of enlarged cubes occur,
    proving the estimate for $cal(E)$. Every participating or enlarged cube lies within distance $C_(L_1)
    r$ of some nucleus, by $d_y lt.eq L a_y$. Counting grid cubes in this union proves finiteness and (8.4).
    Cube suprema are measurable through a countable dense subset, because $H_j$ is continuous.
    The bounds from Lemma 25 also give the last assertion. ◻
]

=== 8.3 The inverse comparison and the order of constants <the-inverse-comparison-and-the-order-of-constants>

We now fix the constants needed for propagation. Choose $C_(upright("inv"))$ larger than the barrier upper bound
  in $a^(- 4)$ units and than $C_(upright("cap"))$. Choose $C_(upright("top")) >
  C_(upright("inv"))$ sufficiently large and put $h_(upright("top")) \( y \) = C_(upright("top")) a_y^(- 4)$;
  this also exceeds $h_b$ with a fixed margin. If $gamma$ is the constant in Lemma 37,
  choose $0 < lambda_2 < lambda_1 < gamma \/ 4$. Choose $L_1$ sufficiently large that, when $a > L_1 R_(+)$,
  subtracting $lambda_2 R_(+)^(- 4)$ from either upper cap places it strictly below $b_(R_(+))$.
  This is possible since $\| b_(R_(+)) \| lt.eq C a^(- 4)$ there.
  The preceding probability estimates now apply with this fixed $L_1$.

Choose a safety constant $e_0 > 0$ so small that $eta = e_0
  R_(+)^(- 4)$ is smaller than the barrier margin above $h_b$ throughout $R_(+) lt.eq a lt.eq
  2 L_1 R_(+)$ and than the shift gap. Finally choose $delta_0 > 0$ small compared with that margin, $lambda_2$,
  and $lambda_1 - lambda_2$, so that

#[#set math.equation(numbering: n => "(8.5)")
 $ 16 delta_0 + 2 e_0 < lambda_1 - lambda_2 \, wide delta_0 < lambda_2 \, wide
   2 e_0 < c' \( 2 L_1 \)^(- 4) . $ <m:eq:cond-shift-order>]

These choices precede the final smallness requirement on $r_(*)$.

Define

$ T_y \( h \) = frac(f_y \( h \), 4 pi) \, wide I_y \( m \) =
  cases(delim: "{", h_b \( y \) \, & m lt.eq T_y \( h_b \( y \) \) \,, T_y^(- 1) \( m \) \, & T_y \( h_b \(
  y \) \) < m < T_y \( h_(upright("top")) \( y \) \) \,, h_(upright("top")) \( y \) \, & m gt.eq T_y \(
  h_(upright("top")) \( y \) \) .) $

The positivity on the master kernel established with the barriers implies

#[#set math.equation(numbering: n => "(8.6)")
 $ T'_y \( h \) gt.eq c a_y^(- 2) quad \( h gt.eq h_b \( y \) - delta_0 a_y^(- 4) \) . $ <m:eq:cond-inverse-derivative>]

Indeed, differentiating the power $3 \/ 2$ leaves a positive square root bounded below by $c
  a_y^(- 2)$ on a kernel of integral $1 + o \( 1 \)$. Thus the inverse on the indicated interval exists and is
  continuous. The clipped inverse satisfies

#[#set math.equation(numbering: n => "(8.7)")
 $ m gt.eq T_y \( h_b \) & med arrow.r.double med T_y \( I_y \( m \) \) lt.eq m \,\
m lt.eq T_y \( h_(upright("top")) \) & med arrow.r.double med T_y \( I_y \( m \) \) gt.eq m . $ <m:eq:cond-clipping>]

#thm([Lemma 8.3.])[
  (One-sided inverse comparisons).  #emph[Fix $j < n$, and put $r = r_j$ and $R_(+) = 2 r$.
    For each deterministic $y$ with $r lt.eq a_y lt.eq 2 L_1 R_(+)$,
    the failure probability of each implication below is less than $r^40$:
#[#set math.equation(numbering: n => "(8.8)")
 $ mu_j \( y \) gt.eq T_y \( h_b \( y \) \) & med arrow.r.double med H_j \( y \) gt.eq I_y \( mu_j \( y \) \) -
   delta_0 a_y^(- 4) \,\
mu_j \( y \) lt.eq T_y \( h_(upright("top")) \( y \) \) & med arrow.r.double med H_j \( y \) lt.eq
  I_y \( mu_j \( y \) \) + delta_0 a_y^(- 4) . $ <m:eq:cond-inverse>]

 The constants and the smallness threshold for $r_(*)$ are independent of the system and the number of scales.]
] <m:lem:cond-inverse>

#proof[
  The argument has three steps. Observation matching first relates the conditional density to the particles
    retained by a fresh patch. The patch comparison then determines the local offset except for a small event,
    whose negative-field cost must also be controlled. Finally,
    two separate tower identities transfer the offset comparison back to the master field.
  ===== 8.3.1 A count-good event and the fresh patch. <a-count-good-event-and-the-fresh-patch.>
  Write $a = a_y$, $t = t_y$, $tau = t \/ a$. Recall that $R f \( y \) =
    integral cal(K)_z \( y \) f \( z \) thin d z$: the averaging and the kernel gradient estimates below concern
    the center variable $z$. There is a universal $K_0$ such that
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(P) { \# { i : Y_(j i) in B \( y \, 3 a \) } > K_0 a^(- 3) } < r^42 . $ <m:eq:cond-observed-count>]
  Otherwise tilt this event. Lemma 26 gives $delta lt.eq C r^(- 2.02) log^5 \( e \/ r^42 \) lt.eq
    a^(- 7 + .02)$ for small $r_(*)$. The last inequality is uniform:
    after multiplication by $a^6.98$ its left side is at most $C_(L_1) r^4.96 log^5 \( e \/ r^42 \)$.
    Every compatible raw configuration has the same excessive count in $B \( y \, 4 a \)$,
    because $sqrt(3) ell_j = o \( a \)$. A fixed cell cover and Lemma 19 contradict this for large enough $K_0$.
  Call the complement of this excessive-count event count-good.
    On such an observation path, match its entries to any compatible raw configuration. The kernel Lipschitz bound gives
  #[#set math.equation(numbering: n => "(8.10)")
   $ lr(|sum_i cal(K)_(x_i) \( y \) - sum_i cal(K)_(Y_(j i)) \( y \)|) lt.eq
     C a^(- 3) ell_j t^(- 4) . $ <m:eq:cond-matching>]
  Only observations in $B \( y \, 3 a \)$ can contribute to this difference.
    The conditional ratios in Lemma 25 are supported on compatible configurations.
    Averaging (8.10) therefore gives the same bound with $mu_j \( y \)$ replacing the raw sum.
  If an implication in (8.8) fails with probability at least $r^40$,
    intersect its failure event with count-good data and call the result $A$.
    Then $P_A := bb(P) \( A \) gt.eq r^41$ for small $r$. Write $P$ for the original joint law of raw variables
    and all noisy arrays, and $Q = P \( dot.op divides A \)$.
    Its raw marginal is the law of $psi_A = sqrt(p_A \/ P_A) Psi$, with $delta lt.eq a^(- 7 + .02)$.
    Apply Lemma 18 to this state, choosing $b = a^(1 + .2)$ and $beta = b \/ a = a^.2$.
    Once selected by shell averaging, the patch radius is deterministic.
    Extend $Q$ by sampling the fresh cut labels conditionally on the raw variables with the cut’s squared
    partition probabilities. The raw-label marginal is exactly the patch construction for $psi_A$.
    Write $X$ for its cut data, $rho_X^c$ for its conditional core density,
    $rho$ for its local Thomas–Fermi minimizer, and $sigma$ for its retained fine density.
    These are conditional objects under this tilted patch law.
    In contrast, $mu_j$ remains the conditional density defined under $P$.
  #[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Law
], table.cell(rowspan: 1, colspan: 1)[Construction and conditional quantities
]),
  table.cell(rowspan: 1, colspan: 1)[$P = bb(P)$
], table.cell(rowspan: 1, colspan: 1)[The raw state $Psi$ with independent noisy arrays.
  The fields $mu_j \, H_j$ retain their definitions using $cal(F)_j$ under this law.
],
  table.cell(rowspan: 1, colspan: 1)[$Q$
], table.cell(rowspan: 1, colspan: 1)[$P \( dot.op divides A \)$, extended by the fresh cut labels.
  The quantities $rho_X^c \, rho \, sigma$ use its raw-label marginal and the cut data $X$.
],
)
]
  The fine smearing moves retained centers by at most $sqrt(3) b$.
    Every particle relevant to the master kernel is in the retained central region.
    Thus (8.10) implies, $Q$-almost surely,
  #[#set math.equation(numbering: n => "(8.11)")
   $ \| R sigma \( y \) - mu_j \( y \) \| lt.eq C a^(- 3) \( ell_j + b \) t^(- 4) =
     o \( a^(- 6) \) . $ <m:eq:cond-fine-matching>]
  Let $G = { D \( sigma - rho \) lt.eq a^(- 7 + .01) }$. Lemma 21 gives
  #[#set math.equation(numbering: n => "(8.12)")
   $ bb(E)_Q [D \( sigma - rho \) + integral W_(-) sigma] lt.eq C a^(- 7 + .02) \, wide
     bb(E)_Q integral sigma^(5 \/ 3) lt.eq C a^(- 7) . $ <m:eq:cond-patch-budget>]
  In particular $Q \( G^c \) lt.eq C a^.01$. On $G$, Lemma 10 gives
  $ \| R rho \( y \) - R sigma \( y \) \| lt.eq C t^(- 5 \/ 2) a^(- 3.5 + .005) = o \( a^(- 6) \) . $
  For clarity, after division by $a^(- 6)$ these two errors are bounded by
  #[#set math.equation(numbering: n => "(8.13)")
   $ C { a^.01 tau^(- 4) + a^.2 tau^(- 4) + a^.005 tau^(- 5 \/ 2) } = o \( 1 \) . $ <m:eq:cond-density-errors>]
  The lower bound $tau gt.eq c_(L_1) a^w$, $w = 10^(- 5)$, makes every power positive.
  ===== 8.3.2 The local inverse comparison and rare negative fields. <the-local-inverse-comparison-and-rare-negative-fields.>
  Put $h_X = W - V_c$. On $G$, in the high-density case one must have
  #[#set math.equation(numbering: n => "(8.14)")
   $ h_X \( y \) gt.eq I_y \( mu_j \( y \) \) - 1 / 4 delta_0 a^(- 4) . $ <m:eq:cond-good-high>]
  Indeed, the opposite inequality and Lemma 34 imply on the master kernel $h_X \( z \) lt.eq
    I_y \( mu_j \( y \) \) - delta_0 a^(- 4) \/ 8$. To cover arbitrarily negative $h_X \( y \)$,
    note that $h mapsto h + C tau h_(-)$ is increasing for small $tau$;
    evaluate it at the proposed upper threshold, which is bounded in $a^(- 4)$ units.
    The oscillation error there is $o \( a^(- 4) \)$. The Thomas–Fermi equation, (8.6),
    and the first part of (8.7) then yield $R rho \( y \) lt.eq mu_j \( y \) - c delta_0 a^(- 6)$,
    contradicting (8.13). In the low-density case the lower oscillation estimate and the increasing function $h
    mapsto h - C tau h_(-)$ similarly give, on $G$,
  #[#set math.equation(numbering: n => "(8.15)")
   $ h_X \( y \) lt.eq I_y \( mu_j \( y \) \) + 1 / 4 delta_0 a^(- 4) . $ <m:eq:cond-good-low>]
  Here the second clipping inequality is used.
  The deterministic upper bound $h_X \( y \) lt.eq C a^(- 4)$ controls the positive error on $G^c$ in the
    low-density case. The high-density case requires a bound on negative fields there.
    By kernel positivity, $mu_j gt.eq T_y \( h_b \) gt.eq c a^(- 6)$.
    Equation (8.11) and $cal(K)_z \( y \) lt.eq C t^(- 3)$ force, on every configuration,
  $ m_sigma := integral_(B \( y \, 2 t \)) sigma gt.eq c a^(- 6) t^3 = c a^(- 3) tau^3 . $
  The upper oscillation bound implies on this ball
  $ W_(-) gt.eq \( 1 - C tau \) h_X \( y \)_(-) - V_c - C a^(- 4) tau^(1 \/ 2) . $
  Integrate against $sigma$, divide by $m_sigma$, and average over $G^c$.
    The patch bound controls the $W_(-) sigma$ numerator by $C a^(- 7 + .02)$.
    For the nuclear term, weighted convexity and the uniform integral of $\| z -
    R_m \|^(- 5 \/ 2)$ on a radius-$2 t$ ball give
  $ integral_(B \( y \, 2 t \)) V_c^(5 \/ 2) lt.eq C a^(- 7) tau^(1 \/ 2) . $
  Hölder’s inequality on probability times space therefore gives
  $ bb(E)_Q upright(bold(1))_(G^c) integral_(B \( y \, 2 t \)) V_c sigma & lt.eq
    (bb(E)_Q integral sigma^(5 \/ 3))^(3 \/ 5) (Q \( G^c \) integral_(B \( y \, 2 t \)) V_c^(5 \/ 2))^(2 \/ 5)\
 & lt.eq C a^(- 7 + .004) tau^.2 . $
  We conclude that
  #[#set math.equation(numbering: n => "(8.16)")
   $ bb(E)_Q upright(bold(1))_(G^c) h_X \( y \)_(-) lt.eq C a^(- 4) { a^.02 tau^(- 3) + a^.004 tau^(- 2.8) +
     Q \( G^c \) tau^(1 \/ 2) } = o \( a^(- 4) \) . $ <m:eq:cond-negative-error>]
  Since $\| I_y \| lt.eq C a^(- 4)$, the bounds on $G$ now imply the corresponding one-sided comparisons in
    expectation, with error $delta_0 a^(- 4) \/ 4 + o \( a^(- 4) \)$.
  ===== 8.3.3 Transfer of averaged fields. <transfer-of-averaged-fields.>
  The remaining step compares the expectation of this fresh patch offset with that of the master offset under the
    event law $Q$. Apply Lemma 27 with the nuclear splitting $V = V_s + V_c$, master width $t = t_y$,
    and fine width $b = a^1.2$. Lemma 21 gives the raw local density and Coulomb error bounds;
    the deleted shell estimate is (4.26). The pointwise density bound required for the nuclear remainder follows
    from $rho = k W_(+)^(3 \/ 2)$ and (4.23); its potential on a radius-$t$ ball is $C
    a^(- 4) \( t \/ a \)^(1 \/ 2)$ by (7.4). Thus the explicit transfer estimate is
  #[#set math.equation(numbering: n => "(8.17)")
   $ \| bb(E)_Q \( H_j - h_X \) \( y \) \| lt.eq C a^(- 4) { tau^(1 \/ 5) + beta^(1 \/ 5) + beta^(1 \/ 2) +
     a^.01 tau^(- 1 \/ 2) + tau^(1 \/ 2) } = o \( a^(- 4) \) . $ <m:eq:cond-transfer>]
  Here $beta = a^.2$, $c_(L_1) a^w lt.eq tau lt.eq c_1 r_(*)^w$, and $.01 - w \/ 2 > 0$.
    The two expectations in the common lemma use different conditional laws;
    this verification identifies neither posterior pathwise.
  On the high failure event, every path has $H_j \( y \) < I_y \( mu_j \( y \) \) - delta_0 a^(- 4)$.
    Equations (8.14) and (8.16), together with (8.17), instead give
  $ bb(E)_Q H_j \( y \) gt.eq bb(E)_Q I_y \( mu_j \( y \) \) - 1 / 4 delta_0 a^(- 4) - o \( a^(- 4) \) \, $
  a contradiction. The low failure event is contradicted in the same way by (8.15),
    the deterministic upper bound on $h_X$, and (8.17). All remainders are uniform:
    $a asymp_(L_1) r$, $tau gt.eq c_(L_1) a^w$, and the smallest power in (8.16) is $.004 - 2.8 w > 0$.
    The constants were fixed before letting $r_(*) arrow.r 0$. ◻
]

=== 8.4 Moments for the integrated exceptional cost <moments-for-the-integrated-exceptional-cost>

The inverse estimates concern each deterministic spatial point.
  Their use in the next section requires integrable costs for failed comparisons,
  not a single event on which all points succeed.

#thm([Lemma 8.4.])[
  (Conditional-density and reaction moments).  #emph[Fix $j < n$, put $r = r_j$ and $R_(+) = 2 r$,
    and let $r lt.eq a_y lt.eq 2 L_1 R_(+)$. Under the original joint law $P = bb(P)$,
#[#set math.equation(numbering: n => "(8.18)")
 $ parallel mu_j \( y \) parallel_2 lt.eq C t_y^(- 3) a_y^(- 3) \, wide
   parallel f_y \( H_j \( y \) \) parallel_2 lt.eq C a_y^(- 6) \( 1 + tau_y^(- 3 \/ 2) \) . $ <m:eq:cond-field-moments>]

 Consequently, if $F_y$ is either failure event from Lemma 40, then
#[#set math.equation(numbering: n => "(8.19)")
 $ integral_({ r lt.eq a_y lt.eq 2 L_1 R_(+) }) bb(E) #scale(x: 120%, y: 120%)[\[]
   upright(bold(1))_(F_y) \( mu_j \( y \) + f_y \( H_j \( y \) \) \) #scale(x: 120%, y: 120%)[\]] thin upright(d)
   y lt.eq C M r^(20 - 3 - 3 w) . $ <m:eq:cond-integrated-cost>]

 The same bound holds with $F_y$ replaced by ${ y in cal(E) }$,
   and the expected integral over all of $bb(R)^3$ of $r^(- 2) sum_Q B_Q
   upright(bold(1))_(Q')$ is bounded by the right side as well.]
] <m:lem:cond-moments>

#proof[
  Conditional Jensen, the master-kernel support, and Lemma 19 give
  $ parallel mu_j \( y \) parallel_2 lt.eq C t_y^(- 3) parallel \# { i :
    x_i in B \( y \, a_y \) } parallel_2 lt.eq C t_y^(- 3) a_y^(- 3) . $
  The tail bound implies $parallel \( H_j \( y \)_(+) \)^(3 \/ 2) parallel_2 lt.eq C a_y^(- 6)$.
    For the nuclear part of the reaction, weighted convexity and the uniform integral of $\| z -
    R_m \|^(- 3 \/ 2)$ on a radius-$2 t_y$ ball give
  $ integral cal(K)_z \( y \) V_c \( z \)^(3 \/ 2) thin upright(d) z lt.eq
    C t_y^(- 3) a_y^(- 9 \/ 2) t_y^(3 \/ 2) = C a_y^(- 6) tau_y^(- 3 \/ 2) . $
  This proves (8.18). Cauchy–Schwarz against $bb(P) \( F_y \) < r^40$ contributes $r^20$.
    Use $a_y asymp_(L_1) r$, $tau_y gt.eq c_(L_1) r^w$, and (8.4) to obtain (8.19).
    The arbitrarily high polynomial bounds in Lemma 39 give the other assertions,
    choosing their exponent larger if necessary. All integrations are licensed by the joint measurable versions
    already constructed. ◻
]

== 9 Outward propagation and the excess-charge bound <m:sec:outward>

The inverse comparisons now allow us to replace a reaction term by the conditional electron density on one more
  layer of local scales. We perform this replacement before forgetting the observations at the current scale.
  The failed comparisons contribute a nonnegative error density.
  Its expected integral, rather than the probability of a simultaneous comparison throughout space,
  is the quantity that we shall sum.

We use the scales $r_j = 2^j r_0$, $r_n = r_(*)$ and the retained data $cal(F)_j$ of Section 8.
  The data $cal(F)_n$ are trivial. Write $mu_j$ for their conditional smoothed density.
  At each step we take a local maximum of the previous comparison field and the observed field $H_j$,
  after lowering them by different constants. The previous field supplies the nonlinear reaction;
  $H_j$ supplies the actual density through its Poisson equation.
  The unequal shifts let the inverse comparisons prove the missing source inequality for each branch that can
  attain the maximum.

After the last observations are forgotten, the resulting positive exterior field will bound the smoothed electron
  mass in ${ a < r_(*) }$ by $Z$ plus the accumulated error.
  The exterior-count estimate of Lemma 30 controls the remaining smoothed mass,
  while the error has integral $o \( M \)$. These are the two contributions to the final excess-charge estimate.

The invariant at scale $r = r_j$ is a continuous locally $H^1$ offset $u$ and a nonnegative bounded compactly
  supported error density $d_j$ such that

#[#set math.equation(numbering: n => "(9.1)")
 $ Delta u gt.eq - 4 pi nu_s + 4 pi upright(bold(1))_({ a < r }) mu_j - 4 pi d_j +
   upright(bold(1))_({ a gt.eq r }) f_y \( u \) quad upright("in distributions") \, $ <m:eq:outward-invariant>]

and

#[#set math.equation(numbering: n => "(9.2)")
 $ b_r lt.eq u lt.eq C_(upright("inv")) a^(- 4) quad upright("on ") { a gt.eq r } \, wide u = b_r quad
   upright("on ") { a > L_1 r } . $ <m:eq:outward-bounds>]

Here and below an inequality between spatial functions is asserted for every positive-density retained path,
  using the versions of Lemma 25. The functions $u \, d_j$ are jointly measurable in the retained data and space.
  We also maintain deterministic bounds, for the fixed physical system and step,
  on the modulus of continuity and the $H^1$ norm of $u$ on every compact set,
  and on the size and support of $d_j$. These additional bounds justify conditional integration.
  The integral estimate for $d_j$ will instead have universal constants.

=== 9.1 Replacing one layer of reaction by density <replacing-one-layer-of-reaction-by-density>

For this subsection put $r = r_j$, $R_(+) = 2 r$, and $H = H_j$.
  All parameters are fixed in the order specified in Section 8. We record the inequalities that enter the argument:

#[#set math.equation(numbering: n => "(9.3)")
 $ lambda_1 < gamma / 4 \, wide 16 delta_0 + 2 e_0 < lambda_1 - lambda_2 \, wide delta_0 < lambda_2 \, wide
   2 e_0 < c' \( 2 L_1 \)^(- 4) . $ <m:eq:outward-shifts>]

The constant $c' > 0$ is the margin in $b_r gt.eq h_b + c' a^(- 4)$.
  Set $eta = e_0 R_(+)^(- 4)$ and $T_y = f_y \/ \( 4 pi \)$.

For the current data, denote the high and low failure sets of Lemma 40 by

$ cal(B)^(upright(h)) & = { y : mu_j \( y \) gt.eq T_y \( h_b \( y \) \) \, quad
  H \( y \) < I_y \( mu_j \( y \) \) - delta_0 a_y^(- 4) } \,\
cal(B)^(upright(l)) & = { y : mu_j \( y \) lt.eq T_y \( h_(upright("top")) \( y \) \) \, quad
  H \( y \) > I_y \( mu_j \( y \) \) + delta_0 a_y^(- 4) } . $

These sets are used only within the participating band $r lt.eq a lt.eq 2 L_1 R_(+)$.
  Let $Pi$, $B_Q$, $Q'$ and $cal(E)$ be the penalty, its cube coefficients,
  the enlarged cubes and their bad union from Lemma 39. In particular $Pi = 0$ off $cal(E)$ and $H - Pi lt.eq
  C_(upright("cap")) a^(- 4)$ throughout this band.

#thm([Proposition 9.1.])[
  (One outward step).  #emph[Suppose that $u \, d_j$ satisfy the inductive conditions above,
    including (9.1)–(9.2), at scale $r = r_j$. There are an offset $u'$ and a nonnegative error density
    $tilde(d)$, measurable with respect to the same data $cal(F)_j$,
    that satisfy these inequalities at scale $R_(+)$ with $mu_j$ still in the core term. One may take
#[#set math.equation(numbering: n => "(9.4)")
 $ tilde(d) =  & d_j + C r^(- 2) sum_Q B_Q upright(bold(1))_(Q')\
 & + upright(bold(1))_({ r lt.eq a < R_(+) }) mu_j upright(bold(1))_(cal(E) union cal(B)^(upright(h)))\
 & + upright(bold(1))_({ R_(+) lt.eq a lt.eq 2 L_1 R_(+) }) T_y \( H \)
   upright(bold(1))_(cal(E) union cal(B)^(upright(l))) \, $ <m:eq:outward-error>]

 where $C$ is a universal constant large enough to dominate the penalty Laplacian.]
] <m:prop:outward-step>

#proof[
  Define two shifted offsets
  $ u_1 = u - lambda_1 R_(+)^(- 4) \, wide u_2 = H - lambda_2 R_(+)^(- 4) - Pi . $
  Use the following open cover to define $u'$:
  #[#set math.equation(numbering: n => "(9.5)")
   $ upright("open region") & u'\
a < \( 1 + kappa \) R_(+) & max \( u_1 \, u_2 \)\
\( 1 + kappa \/ 2 \) R_(+) < a < 2 L_1 R_(+) & max \( u_1 \, u_2 \, b_(R_(+)) \)\
a > L_1 R_(+) & b_(R_(+)) . $ <m:eq:outward-branches>]
  The definitions agree on overlaps. On the lower overlap, Lemma 37 and (9.3) give
  $ u_1 gt.eq b_r - lambda_1 R_(+)^(- 4) > b_(R_(+)) . $
  On the upper overlap the shifted cap inequalities, ensured by the choice of $L_1$,
    put both $u_1$ and $u_2$ below $b_(R_(+))$. Thus the local maxima glue to a continuous locally $H^1$ function.
    No assertion about the measure or regularity of a level set of $a$ is required.
    The new exterior bounds follow from the same comparisons:
    for $R_(+) lt.eq a < \( 1 + kappa \) R_(+)$ the lower bound is supplied by $u_1$,
    and elsewhere the barrier is an included branch.
  We verify the differential inequality locally. At a fixed point in one of the open regions,
    discard branches more than $eta$ below the maximum. There is a neighborhood on which these discarded branches
    cannot attain the maximum, while every retained branch is within $2 eta$ of it.
    We show that each retained branch satisfies the common inequality
  #[#set math.equation(numbering: n => "(9.6)")
   $ Delta v gt.eq - 4 pi nu_s + 4 pi upright(bold(1))_({ a < R_(+) }) mu_j - 4 pi tilde(d) +
     upright(bold(1))_({ a gt.eq R_(+) }) f_y \( v \) $ <m:eq:outward-common>]
  on that neighborhood.
  For $u_1$, the old core inequality suffices on $a < r$, and monotonicity of $f_y$ gives the required reaction on
    $a gt.eq R_(+)$. On the gain region $r lt.eq a < R_(+)$, the error in (9.4) pays $mu_j$ at points of $cal(E)
    union cal(B)^(upright(h))$. At every other gain point, $Pi = 0$ and near activity yields
  $ H lt.eq u - \( lambda_1 - lambda_2 \) R_(+)^(- 4) + 2 eta . $
  Here $h_b lt.eq u lt.eq h_(upright("top"))$. If $mu_j > T_y \( u \)$,
    then the high comparison applies and $I_y \( mu_j \) gt.eq u$,
    including the case where the inverse is clipped at its upper endpoint. It would follow that
  $ H gt.eq u - delta_0 a^(- 4) gt.eq u - 16 delta_0 R_(+)^(- 4) \, $
  contrary to (9.3). Thus $4 pi mu_j lt.eq f_y \( u \)$. The old reaction supplies precisely the new core term on
    the gain region.
  For $u_2$, the identity $Delta H = - 4 pi nu_s + 4 pi mu_j$ gives the required core term on all of $a < R_(+)$,
    while the first increment in (9.4) pays the Laplacian of $Pi$.
    Consider the remaining points where $u_2$ is retained. The lower splice or the included barrier gives
  $ u_2 gt.eq b_(R_(+)) - 2 eta gt.eq h_b + c' a^(- 4) - 2 e_0 R_(+)^(- 4) > h_b . $
  The last inequality uses $a lt.eq 2 L_1 R_(+)$ and (9.3).
    On $cal(E) union cal(B)^(upright(l))$ the last error term pays the reaction because $u_2 lt.eq
    H$ and $f_y$ is nondecreasing. Otherwise $Pi = 0$ and the cap gives $H < h_(upright("top"))$.
    If $mu_j < T_y \( u_2 \)$, the low comparison applies and $I_y \( mu_j \) lt.eq u_2$,
    also when the inverse is clipped at its lower endpoint. We would obtain
  $ H lt.eq u_2 + delta_0 a^(- 4) lt.eq u_2 + delta_0 R_(+)^(- 4) \, $
  contradicting $H = u_2 + lambda_2 R_(+)^(- 4)$. Therefore $4 pi mu_j gt.eq f_y \( u_2 \)$, as required.
  The barrier branch appears only where $a > R_(+)$, and Lemma 36 gives (9.6) there.
    The old error density and every additional error are nonnegative, so they can only weaken the required lower bound.
  These comparisons cover the exact level sets as well: $a =
    r$ belongs to the gain region and uses the old reaction, whereas $a =
    R_(+)$ belongs to the new exterior and uses its reaction.
    All right-side comparisons hold almost everywhere on the chosen neighborhood and therefore upgrade each
    retained branch’s distributional inequality to (9.6). The source $nu_s$ is a smooth bounded density for the
    fixed system, and all branches here are continuous and locally $H^1$.
    The reaction is also bounded on bounded ranges of its argument:
    for a fixed system, $t_min := inf_z t_z > 0$ and $V_c in L_c^(5 \/ 2)$ give, for every $A > 0$,
  $ sup_(y \, thin \| h \| lt.eq A) f_y \( h \) lt.eq C t_min^(- 3) integral V_c^(3 \/ 2) +
    C A^(3 \/ 2) sup_y R 1 \( y \) < oo . $
  Thus the first, nonsingular part of Lemma 28, followed by a partition of unity,
    proves the inequality for $u'$ on all of $bb(R)^3$. No vanishing of the reaction near the original nuclei is
    needed in this step. ◻
]

=== 9.2 Averaging the data and summing the error <averaging-the-data-and-summing-the-error>

The next step explains why the nonlinear reaction survives the removal of observations.
  It also records the integrability needed in that operation.

#thm([Lemma 9.2.])[
  (Forgetting the current observations).  #emph[Set
$ u_(j + 1) = bb(E) \[ u' divides cal(F)_(j + 1) \] \, wide d_(j + 1) = bb(E) \[ tilde(d) divides cal(F)_(j + 1) \] . $

 Then $u_(j + 1) \, d_(j + 1)$ satisfy (9.1)–(9.2) at scale $r_(j + 1)$, with conditional density $mu_(j + 1)$.
   They retain continuity and local $H^1$ regularity for the offset and bounded compact support for the
   nonnegative error density.]
] <m:lem:outward-average>

#proof[
  For the fixed system there are finitely many scales and cubes,
    and all master smoothing widths have a positive minimum. Lemma 25 therefore gives deterministic bounds for the
    conditional densities, their potentials and their gradients.
    The offsets and error densities in the assertion are jointly measurable:
    maxima, clipped inverses and failure flags preserve measurability,
    and each cube supremum may be taken over a fixed countable dense subset.
  Inductively the branches have deterministic continuity moduli and local $H^1$ bounds on each compact set.
    Their open definitions agree on overlaps; a finite subcover of a compact set supplies a Lebesgue number and
    hence a modulus for the glued function. The gradient of a finite maximum is almost everywhere one of the
    branch gradients. Conditional averaging consequently preserves continuity.
    It preserves the local $H^1$ bound by testing weak derivatives against compactly supported vector fields,
    using Fubini and Cauchy–Schwarz. The error terms have deterministic bounded size and support for the fixed
    system and step, so the same is true after averaging.
  Integrate the distributional inequality of Proposition 42 against a fixed nonnegative compact test and then
    against the explicit positive-parent conditional law of Lemma 25. The preceding bounds justify Fubini.
    The tower property gives $bb(E) \[ mu_j divides cal(F)_(j + 1) \] = mu_(j + 1)$, while convexity gives
  $ bb(E) \[ f_y \( u' \) divides cal(F)_(j + 1) \] gt.eq f_y #scale(x: 120%, y: 120%)[\(]
    bb(E) \[ u' divides cal(F)_(j + 1) \] #scale(x: 120%, y: 120%)[\)] . $
  This is the required lower bound for the reaction. The exterior bounds and the exterior equality are
    deterministic and pass to the average. ◻
]

#thm([Lemma 9.3.])[
  (Integrated error).  #emph[Starting with $u = b_(r_0)$ and $d_0 = 0$,
    the preceding construction reaches scale $r_n = r_(*)$ and produces a deterministic error density with
#[#set math.equation(numbering: n => "(9.7)")
 $ integral d_n lt.eq C M r_(*)^(17 - 3 w) = o \( M \) wide
   upright("along the contradiction sequence") . $ <m:eq:outward-total-error>]

 The constant is independent of the number of scales and of the nuclear configuration.]
] <m:lem:outward-error>

#proof[
  Since $r_0 < Z^(- 1 \/ 3) lt.eq a$, Lemma 36 gives the initial invariant everywhere; there is no initial core region.
  At scale $r = r_j$, apply Lemma 41 to the three increments in (9.4).
    The high-failure estimate pays $mu_j$ on the gain region; the low-failure estimate pays $T_y \( H \) =
    f_y \( H \) \/ \( 4 pi \)$ on the remaining participating region.
    The same Lemma pays membership in $cal(E)$ and the penalty Laplacian.
    For $cal(B) in { cal(B)^(upright(h)) \, cal(B)^(upright(l)) }$,
    use $upright(bold(1))_(cal(E) union cal(B)) lt.eq upright(bold(1))_(cal(E)) + upright(bold(1))_(cal(B))$.
    All these integrands are nonnegative, so restriction to the indicated subregions only improves their bounds.
    We obtain
  $ bb(E) integral \( tilde(d) - d_j \) lt.eq C M r^(17 - 3 w) . $
  Conditional averaging preserves the unconditional expected integral of a nonnegative density.
    Because $beta = 17 - 3 w > 0$,
  $ sum_(j = 0)^(n - 1) r_j^beta = r_(*)^beta sum_(h = 1)^n 2^(- h beta) lt.eq frac(r_(*)^beta, 2^beta - 1) . $
  At the last step the data are trivial, so $d_n$ is deterministic. This proves (9.7), uniformly in $n$.
    The argument has used the failure probability separately at each spatial point and then integrated it;
    it has imposed no simultaneous good-data event in space. ◻
]

=== 9.3 The total-charge comparison <the-total-charge-comparison>

We have reached the unconditional density $mu_n$ and replaced the reaction by this density throughout ${ a <
  r_(*) }$, at total error $o \( M \)$. A final potential comparison converts this statement to a bound on the
  number of electrons in that region.

#proof[
  Use the contradiction sequence and sector eigenstates of Section 8.
    Its terminal scale is $r_(*) = \( B_0 M \/ K_(upright("exc")) \)^(1 \/ 3)$.
    The universal $B_0$ will exceed the fixed count constant below.
    All deterministic parameters and tolerances are chosen before taking the sequence limit.
    The smallness requirements of the preceding lemmas then hold for all its sufficiently late members,
    uniformly over their scales.
  At the final step put
  $ U = V_c + u_n \, wide S = nu - upright(bold(1))_({ a < r_(*) }) mu_n + d_n . $
  The signed measure $S$ has compact support. In fact ${ a <
    r_(*) }$ lies in a finite union of balls around the nuclei, the error density has compact support,
    and the nuclei are finite. Since $Delta V_c = - 4 pi nu + 4 pi nu_s$, the final invariant implies
  $ Delta \( U - K * S \) gt.eq upright(bold(1))_({ a gt.eq r_(*) }) f_y \( u_n \) gt.eq 0 . $
  The nuclear singularities cancel in the explicit identity
  #[#set math.equation(numbering: n => "(9.8)")
   $ U - K * S = u_n - V_s + K * \( upright(bold(1))_({ a < r_(*) }) mu_n \) - K * d_n . $ <m:eq:outward-cancellation>]
  The right-hand side is continuous and locally $H^1$ on all of $bb(R)^3$:
    the last two potentials have bounded compactly supported densities,
    and the other terms have the stated regularity from the construction.
  Far from the nuclei, (9.2) gives $U = B_(r_(*)) = W_0 + q_0 - Gamma_(r_(*))$,
    which tends to zero by the deterministic field estimates.
    The compact source potential $K * S$ also tends to zero. For every $epsilon.alt > 0$,
    the function $\( U - K * S - epsilon.alt \)_(+)$ consequently has compact support and is an admissible $H^1$
    test in the subharmonic inequality. Testing gives a nonpositive squared gradient norm,
    so this positive part vanishes. Letting $epsilon.alt arrow.b 0$ proves
  $ U lt.eq K * S wide upright("away from the nuclear points") . $
  On every sufficiently large sphere $U = B_(r_(*)) gt.eq .9 W_0 > 0$.
    The spherical mean of the potential of a compactly supported signed measure,
    on a sphere centered at the origin and enclosing its support,
    equals its total mass divided by the sphere radius. Hence
  #[#set math.equation(numbering: n => "(9.9)")
   $ 0 < integral thin upright(d) S = Z - N + integral_({ a gt.eq r_(*) }) mu_n + integral d_n . $ <m:eq:outward-mass>]
  Only positivity on a far sphere is used here; no asymptotic charge formula for $W_0$ is needed.
  At the last scale the data have been completely averaged away, so
  $ mu_n \( y \) = bb(E)_Psi sum_i cal(K)_(x_i) \( y \) . $
  If a kernel centered at $x$ contributes to a point with $a_y gt.eq r_(*)$,
    then its support and the Lipschitz scale estimate imply
  $ a_y lt.eq a_x + frac(\| x - y \|, L) lt.eq a_x (1 + frac(c_1 r_(*)^w, L)) . $
  For small $r_(*)$ this forces $a_x gt.eq r_(*) \/ 2$. Each kernel has integral one, and Lemma 30 therefore gives
  $ integral_({ a gt.eq r_(*) }) mu_n lt.eq bb(E)_Psi \# { i : a \( x_i \) gt.eq r_(*) \/ 2 } lt.eq C M r_(*)^(- 3) . $
  Combining this with (9.7) and (9.9) yields
  $ K_(upright("exc")) < C M r_(*)^(- 3) + o \( M \) = C / B_0 K_(upright("exc")) + o \( M \) . $
  Choose $B_0 > 2 C$, increasing it also to ensure the initial scale choice in Section 8.
    Since $K_(upright("exc")) \/ M arrow.r oo$, the last inequality is impossible.
    This proves the existence of one universal finite constant bounding the excess per nucleus in every strictly
    bound sector.
  For an arbitrary strictly bound sector, the largest strictly bound sector of the same system has at least as
    many electrons, so the same bound applies. For every integer $N > Z + C M$,
    strict adjacent binding is therefore impossible. Sector monotonicity gives $E_N lt.eq E_(N - 1)$,
    and exclusion of the strict inequality gives $E_N = E_(N - 1)$.
    Taking $M = 1$ proves both atomic assertions for every real nuclear charge $Z gt.eq 1$. ◻
]

== 10 Conditional density and field comparisons <a:sec:conditioning>

We now specialize to one nucleus at the origin and use $V \( y \) = Z \/ \| y \|$, $d_y = \| y \|$,
  and the atomic distance scale $a_y = d_y \/ L$ with $L = 10^5$.
  The comparisons in this section allow every real $Z gt.eq 1$;
  the neutral-sector conclusions below use integer charges.

Fix $0 lt.eq D_0 < oo$ and a normalized ground state $Psi$ in a sector with $n lt.eq 3 Z$ and $E_n lt.eq E + D_0$.
  The ground-state assumption in this section is used in the multiplier identity (2.4);
  the patch comparisons themselves apply to the resulting states with an energy offset.
  All probabilities below initially refer to the raw position-and-spin law of $Psi$,
  enlarged by the explicitly specified independent random variables.
  The common likelihood and event-cost estimates of Section 5 now give a simultaneous comparison throughout an
  atomic annulus. This strengthens the pointwise molecular comparison by using the absence of nuclear
  singularities from these annuli.

=== 10.1 Nested observations and master smoothing <nested-observations-and-master-smoothing>

Choose $0 < epsilon < 1$ and $0 < s < 1$, and suppose $Z$ is large enough that $2 r_0 lt.eq s$. Set

#[#set math.equation(numbering: n => "(10.1)")
 $ r_0 = epsilon Z^(- 1 \/ 3) \, wide r_j = 2^j r_0 \, wide m = max { j : r_j lt.eq s } \, wide ell_j =
   r_j^1.01 quad \( j < m \) . $ <a:eq:cond-observations>]

Thus $s \/ 2 < r_m lt.eq s$. At scale $j < m$ observe the positions $x_i +
  ell_j U_(j i)$ and then forget the particle labels separately in each array.
  All Cartesian coordinates of all $U_(j i)$, at all scales, are independent with density

$ zeta \( u \) = c_zeta exp #h(-0.16667em) (- frac(1, 1 - u^2)) upright(bold(1))_({ \| u \| < 1 }) . $

Represent the unordered array by its lexicographically sorted tuple $Y_j$. Ties have probability zero.
  Write $cal(F)_j = sigma \( Y_j \, dots.h \, Y_(m - 1) \)$ and let $cal(F)_m$ be trivial.
  These sigma-fields decrease with $j$.

Fix $w = 10^(- 5)$ and $0 < c_1 < \( 10 L \)^(- 1)$. With the same smooth radial packet $g$ as in Section 3, define

#[#set math.equation(numbering: n => "(10.2)")
 $ D_x^0 = max \( d_x \, r_0 \) \, wide t_x = c_1 D_x^0 min \( D_x^0 \, s \)^w \, wide cal(K)_x \( y \) =
   g_(t_x) \( y - x \)^2 \,\
mu_j \( y \) = bb(E) #h(-0.16667em) [sum_(i = 1)^n cal(K)_(x_i) \( y \) thin mid(bar.v) thin cal(F)_j] \, wide
  H_j = V - K * mu_j \, wide cal(R) f \( y \) = integral cal(K)_z \( y \) f \( z \) thin thin upright(d) z .
  $ <a:eq:cond-master>]

The lower clamp in $D_x^0$ is retained also for particles close to the nucleus;
  the upper clamp is only on the factor raised to $w$. In particular, $t_x gt.eq t_min :=
  c_1 r_0^(1 + w) > 0$ and $t$ is Lipschitz with constant at most $c_1 \( 1 + w \) s^w$.

Use the likelihood-ratio versions of Lemma 25 for these arrays and kernels.
  They give joint measurability, fixed-system derivative bounds, $mu_j gt.eq 0$, $integral mu_j = n$, and

#[#set math.equation(numbering: n => "(10.3)")
 $ bb(E) \[ mu_j divides cal(F)_(j + 1) \] = mu_(j + 1) \, wide bb(E) \[ H_j divides cal(F)_(j + 1) \] =
   H_(j + 1) . $ <a:eq:cond-tower>]

The offset $H_j - V$ is locally Lipschitz and

#[#set math.equation(numbering: n => "(10.4)")
 $ Delta H_j = - 4 pi nu + 4 pi mu_j . $ <a:eq:cond-poisson>]

Lemma 26 applies with baseline $E_n$ and offset $D_0$. In particular,
  an event of probability $p > 0$ at index $j$ has tilted energy at most $E + D_0 +
  C ell_j^(- 2) log^5 \( e \/ p \)$. We retain this full baseline dependence throughout the argument.

=== 10.2 The simultaneous inverse comparison <the-simultaneous-inverse-comparison>

#thm([Proposition 10.1.])[
  (Conditional density determines the field).  #emph[There is a universal constant $C_(upright("cap"))$ with the
    following property. Fix $L_1 gt.eq 2$, $0 < h_l < h_h < oo$, and a sufficiently small $xi > 0$;
    it suffices to require $xi < h_l \/ 16$. There exists $s_(*) =
    s_(*) \( D_0 \, L_1 \, h_l \, h_h \, xi \) > 0$ such that, whenever $0 < s lt.eq s_(*)$, at each $j < m$,
    with $r = r_j$, there is an event $cal(G)_j in cal(F)_j$ satisfying $bb(P) \( cal(G)_j^c \) lt.eq
    C r^25$ on which, simultaneously for $r lt.eq d_y lt.eq 4 L_1 r$ and $h_l lt.eq h lt.eq h_h$,
#[#set math.equation(numbering: n => "(10.5)")
 $ d_y^6 mu_j \( y \) > k h^(3 \/ 2) & quad arrow.r.double quad d_y^4 H_j \( y \) gt.eq h - xi \,\
d_y^6 mu_j \( y \) < k h^(3 \/ 2) & quad arrow.r.double quad d_y^4 H_j \( y \) lt.eq h + xi . $ <a:eq:cond-inverse>]

 On the same event, $H_j \( y \) lt.eq C_(upright("cap")) d_y^(- 4)$ throughout that band.
   The constant $C$ may depend on the fixed parameters, whereas $C_(upright("cap"))$ does not depend on $D_0 \,
   L_1 \, h_l \, h_h \, xi$. All estimates are uniform in $Z$, the ground state, $j$, and $m$.]
] <a:prop:cond-comparison>

#proof[
  We first control the observed count and the positive field throughout the band.
    At a fixed point and height, a hypothetical failure then defines a tilted state.
    Its fresh patch compares the observed density with the patch field,
    including the contribution of rare negative fields; the two expectation towers turn this into a contradiction.
    Finally, spatial and height nets give the simultaneous statement.
    Every occurrence of $o \( 1 \)$ below tends to zero as $s arrow.b 0$, uniformly for $r_0 lt.eq r = r_j lt.eq
    s$ and the stated bands, after the fixed parameters in the proposition have been chosen.
  #emph[Kernel geometry.] Put $a = a_y = d_y \/ L$, $t = t_y$ and $tau = t \/ a$.
    If $cal(K)_z \( y \) eq.not 0$, the Lipschitz bound on $t$ gives $\| z - y \| lt.eq t_z lt.eq t_y +
    C s^w \| z - y \|$, hence $\| z - y \| lt.eq 2 t_y$. On this support, $t_z \/ t_y = 1 + O \( s^w \)$.
    Comparison with the fixed-width kernel $g_t \( y - z \)^2$ therefore gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ integral cal(K)_z \( y \) thin thin upright(d) z = 1 + O \( s^w \) \, wide \| cal(K)_z \( y \) \| lt.eq
     C t^(- 3) \, wide \| nabla_y cal(K)_z \( y \) \| + \| nabla_z cal(K)_z \( y \) \| lt.eq
     C t^(- 4) . $ <a:eq:cond-kernel>]
  The center derivative is a weak derivative where $t_z$ has a corner;
    its stated bound also gives the needed Lipschitz estimate.
    For $r \/ 2 lt.eq d_y lt.eq 8 L_1 r$ one has $a asymp_(L_1) r$ and
  #[#set math.equation(numbering: n => "(10.7)")
   $ c_(L_1) a^w lt.eq tau lt.eq C s^w . $ <a:eq:cond-tau>]
  For example, when $d_y gt.eq r_0$, the formula is $tau = c_1 L min \( d_y \, s \)^w$;
    on the indicated band $min \( d_y \, s \) gt.eq c_(L_1) d_y$.
    The case $d_y < r_0$ is comparable, since $d_y gt.eq r_0 \/ 2$.
  #emph[An observed-count event.] Let $M_j$ be the number of entries of $Y_j$ with radii in
    $\[ r \/ 4 \, 12 L_1 r \]$. For a sufficiently large fixed $C_(L_1)$,
  #[#set math.equation(numbering: n => "(10.8)")
   $ bb(P) { M_j > C_(L_1) r^(- 3) } lt.eq r^40 . $ <a:eq:cond-count-event>]
  Indeed, if the event had probability $p > r^40$, its tilted raw state from Lemma 26 would have offset
  $ delta lt.eq D_0 + C r^(- 2.02) log^5 \( e \/ r^40 \) . $
  Each configuration compatible with the event has more than $C_(L_1)
    r^(- 3)$ raw points in $\[ r \/ 8 \, 13 L_1 r \]$, because observation displacements are at most $sqrt(3)
    ell_j = o \( r \)$. But (4.45) bounds its expected count by $C'_(L_1) \( r^(- 3) + sqrt(delta r) \) lt.eq
    2 C'_(L_1) r^(- 3)$ for small $s$, a contradiction if $C_(L_1) > 2 C'_(L_1)$.
    Call the complementary event in (10.8) $cal(C)_j$. For data in $cal(C)_j$,
    every compatible configuration has at most $C_(L_1) r^(- 3)$ centers relevant to the master kernels on $r \/ 2
    lt.eq d_y lt.eq 8 L_1 r$. Conditional averaging and (10.6) imply there
  #[#set math.equation(numbering: n => "(10.9)")
   $ mu_j \( y \) lt.eq C r^(- 6 - 3 w) \, wide \| nabla mu_j \( y \) \| lt.eq
     C r^(- 7 - 4 w) . $ <a:eq:cond-count-regularity>]
  #emph[A universal spatial field cap.] Fix $y$ in the same enlarged band and tilt an event $A' =
    { H_j \( y \) > b thin d_y^(- 4) }$ of positive probability $p$. The original-law tower gives
  $ bb(E) \[ H_j \( y \) divides A' \] = V \( y \) - bb(E)_(Psi_(A')) sum_i \( K * cal(K)_(x_i) \) \( y \) lt.eq
    bb(E)_(Psi_(A')) J_y . $
  To justify the last inequality, a master smear whose potential at $y$ differs from the point potential has $\|
    x_i - y \| < t_(x_i)$ and hence $\| x_i - y \| lt.eq 2 t_y < A a_y$ for small $s$.
    All terms outside that exclusion therefore have their exact point potential,
    and dropping the remaining electron terms gives $J_y$. By (4.39) without an initial cut and Lemma 26,
  #[#set math.equation(numbering: n => "(10.10)")
   $ b lt.eq C_2 + C_(L_1) r^2.49 log^(5 \/ 2) \( e \/ p \) . $ <a:eq:cond-positive-tail>]
  Here $C_2$ is universal: the local field term in these units is $C d_y^4 a_y^(- 4) = C L^4$,
    and the contribution $C d_y^(7 \/ 2) sqrt(D_0)$ is at most one after decreasing $s$.
    Solving (10.10) for $p$ shows that for $b gt.eq 2 C_2$,
  $ bb(P) { d_y^4 H_j \( y \) > b } lt.eq e exp { - c_(L_1) \( b - C_2 \)^(2 \/ 5) r^(- 0.996) } . $
  Tail integration consequently gives, for each fixed $M > 0$,
  $ bb(E) \( d_y^4 H_j \( y \) - 2 C_2 \)_(+) lt.eq C_(M \, L_1) r^M . $
  Subharmonicity permits a simultaneous conclusion without a $Z$-dependent derivative estimate.
    Apply the ball submean inequality with radius $d_y \/ 10$ for $3 r \/ 4 lt.eq d_y lt.eq 6 L_1 r$.
    The averaging ball is contained in ${ r \/ 2 lt.eq d_z lt.eq 8 L_1 r }$ and $d_z asymp d_y$ there, so
  $ d_y^4 H_j \( y \) lt.eq C_3 +
    C r^(- 3) integral_({ r \/ 2 lt.eq d_z lt.eq 8 L_1 r }) \( d_z^4 H_j \( z \) - 2 C_2 \)_(+) thin thin
    upright(d) z . $
  The constant $C_3$ is universal. The integral term has expectation $O_(M \, L_1) \( r^M \)$,
    since its integration volume is $O_(L_1) \( r^3 \)$. Markov’s inequality proves that,
    outside an event of probability $C_(M \, L_1) r^M$,
  #[#set math.equation(numbering: n => "(10.11)")
   $ H_j \( y \) lt.eq C_(upright("cap")) d_y^(- 4) quad \( 3 r \/ 4 lt.eq d_y lt.eq 6 L_1 r \) \, wide
     C_(upright("cap")) = C_3 + 1 . $ <a:eq:cond-cap>]
  This establishes the claimed order of dependence of the cap.
  #emph[A fixed spatial point and height.] Fix now $r lt.eq d_y lt.eq 4 L_1 r$ and $h in \[ h_l \/ 2 \, 2 h_h \]$.
    Consider either failure of (10.5) with tolerance $xi \/ 4$, intersected with $cal(C)_j$.
    If its probability were at least $r^42$, call that event $A'$ and write $Q =
    bb(P) \( thin dot.op divides A' \)$. The raw marginal is the state $Psi_(A')$ of Lemma 26, with
  #[#set math.equation(numbering: n => "(10.12)")
   $ delta lt.eq D_0 + C r^(- 2.02) log^5 \( e \/ r^42 \) lt.eq a^(- 7 + .02) $ <eq:obs-tilted-offset>]
  for small $s$. Apply the refined patch (4.42) to this raw state at $y$, with $beta = a^.2$ and $b = beta a$.
    Extend $Q$ by fresh cut labels sampled conditional on the raw positions, exactly as in that patch.
    Let $X$ be these patch data, let $rho_X^c$ be its conditional core density, and let $rho \, W \,
    sigma$ be its minimizing density, screened field, and fine-smear density. Thus
  $ W = V - K * rho_X^c - K * rho \, wide rho = k W_(+)^(3 \/ 2) med upright("on the patch") \, wide
    bb(E)_Q [D \( sigma - rho \) + integral W_(-) sigma] lt.eq C a^(- 7 + .02) . $
  The roles of these densities and their laws are distinct.
    The pair $mu_j \, H_j$ keeps its original-observation definition in (10.2).
    Under the event law $Q$, the fresh patch gives the conditional core density $rho_X^c$ and its field $Phi_X =
    V - K * rho_X^c$; $sigma$ is the fine smear of retained out particles,
    whereas $rho$ is the auxiliary minimizing density and $W = Phi_X - K * rho$.
    The field comparison is made after taking $Q$-expectations in (10.19) below.
  Each compatible raw configuration matches the observed array $Y_j$ after a permutation,
    with displacement at most $sqrt(3) ell_j$ per position. Both configurations and their conditional averages at
    those same data therefore differ, when tested against $x mapsto cal(K)_x \( y \)$,
    by at most $C r^(- 3) ell_j t^(- 4)$. This follows from the count bound and the center Lipschitz estimate in
    (10.6); only entries within $2 t + O \( ell_j \)$ of $y$ can contribute.
    All such raw particles are retained by the fresh patch. Its radial fine smear moves a retained point by at
    most $sqrt(3) b$, adding at most $C r^(- 3) b t^(- 4)$ to the error.
    Consequently, on every compatible path, including paths where the Coulomb error is large,
  #[#set math.equation(numbering: n => "(10.13)")
   $ \| cal(R) sigma \( y \) - mu_j \( y \) \| lt.eq C r^(- 3) \( ell_j + b \) t^(- 4) lt.eq
     C a^(- 6) #scale(x: 120%, y: 120%)[\(] a^.01 tau^(- 4) + a^.2 tau^(- 4) #scale(x: 120%, y: 120%)[\)] =
     o \( a^(- 6) \) . $ <a:eq:cond-matching>]
  In the comparison with the conditional average, one may first compare each raw sum with $sum_i
    cal(K)_(Y_(j \, i)) \( y \)$, then average this same bound using the original posterior law.
    The array is fixed in both comparisons, so no equality of posterior laws is being used.
  Let $G = { D \( sigma - rho \) lt.eq a^(- 7 + .01) }$. Then $Q \( G^c \) lt.eq C a^.01$.
    The test function $z mapsto cal(K)_z \( y \)$ has support in $B \( y \, 2 t \)$ and gradient norm at most $C
    t^(- 5 \/ 2)$. Coulomb duality gives on $G$
  #[#set math.equation(numbering: n => "(10.14)")
   $ \| cal(R) \( sigma - rho \) \( y \) \| lt.eq C a^(- 7 \/ 2 + .005) t^(- 5 \/ 2) =
     C a^(- 6) a^.005 tau^(- 5 \/ 2) = o \( a^(- 6) \) . $ <a:eq:cond-smoothed-duality>]
  The positivity of the two powers used so far is explicit: $.01 - 4 w = .00996$ and $.005 - \( 5 \/ 2 \) w = .004975$.
  On $G$, a high-density antecedent forces
  #[#set math.equation(numbering: n => "(10.15)")
   $ W \( y \) gt.eq \( h - xi \/ 16 \) d_y^(- 4) . $ <a:eq:cond-patch-high>]
  For if the reverse strict inequality held, the oscillation bound (4.44) on $B \( y \, 2 t \)$ would give
    $W \( z \) lt.eq \( h - xi \/ 32 \) d_y^(- 4)$ there for sufficiently small $s$.
    This remains uniform when $W \( y \)$ is arbitrarily negative:
    the upper estimate is $W \( y \) + C tau \( a^(- 4) + W \( y \)_(-) \)$, and $v mapsto v +
    C tau v_(-)$ is increasing for $C tau < 1$. Using the patch equation and $integral cal(K)_z \( y \) thin thin
    upright(d) z = 1 + O \( s^w \)$ would then give
  $ cal(R) rho \( y \) lt.eq k \( h - xi \/ 32 \)^(3 \/ 2) d_y^(- 6) \( 1 + O \( s^w \) \) < k h^(3 \/ 2)
    d_y^(- 6) - c_(h_l \, h_h \, xi) a^(- 6) \, $
  contradicting (10.13)–(10.14). Similarly, on $G$ a low-density antecedent forces
  #[#set math.equation(numbering: n => "(10.16)")
   $ W \( y \) lt.eq \( h + xi \/ 16 \) d_y^(- 4) . $ <a:eq:cond-patch-low>]
  Indeed the contrary is positive, so the lower oscillation estimate gives $W \( z \) gt.eq \( h + xi \/ 32 \)
    d_y^(- 4)$ on the contributing ball; its reaction density contradicts the low antecedent with the same strict
    margin. Constants from $d_y = L a$ are fixed before $s$ is decreased.
  #emph[The negative field on the exceptional patch event.] The upper bound (10.16) passes to expectation with an
    $o \( a^(- 4) \)$ error, by the patch bound $W \( y \) lt.eq C a^(- 4)$ and $Q \( G^c \) lt.eq C a^.01$.
    To pass the lower bound to expectation we need more than this small probability.
    Under the high-density antecedent, (10.13) holds on all paths and gives $cal(R) sigma \( y \) gt.eq
    c a^(- 6)$, since $h gt.eq h_l \/ 2 > 0$. The support and upper bound of the master kernel imply the
    deterministic mass bound
  $ M_sigma := integral_(B \( y \, 2 t \)) sigma gt.eq c a^(- 6) t^3 . $
  For $Y = W \( y \)_(-)$, (4.44) gives throughout this ball $W \( z \)_(-) gt.eq \( 1 - C tau \) Y -
    C tau a^(- 4)$. Taking $C tau lt.eq 1 \/ 2$, integrating against $sigma$, and using the mass bound yields
  $ Y lt.eq C \( a^(- 6) t^3 \)^(- 1) integral W_(-) sigma + C tau a^(- 4) . $
  Multiply by $upright(bold(1))_(G^c)$ and use the refined patch budget under the same law $Q$. We obtain
  #[#set math.equation(numbering: n => "(10.17)")
   $ bb(E)_Q \[ upright(bold(1))_(G^c) W \( y \)_(-) \] lt.eq
     C a^(- 4) #scale(x: 120%, y: 120%)[\(] a^.02 tau^(- 3) + tau #scale(x: 120%, y: 120%)[\)] =
     o \( a^(- 4) \) \, $ <a:eq:cond-negative-exception>]
  because $.02 - 3 w = .01997 > 0$. Thus the high and low antecedents give, respectively,
  #[#set math.equation(numbering: n => "(10.18)")
   $ bb(E)_Q W \( y \) gt.eq \( h - xi \/ 16 \) d_y^(- 4) - o \( a^(- 4) \) \, wide
     bb(E)_Q W \( y \) lt.eq \( h + xi \/ 16 \) d_y^(- 4) + o \( a^(- 4) \) . $ <a:eq:cond-patch-means>]
  #emph[Transfer between the two conditioning procedures.] Apply Lemma 27 with $V_s = V$, $V_c = 0$ and $h_X = W$.
    Its two towers are taken under the original observation law and the fresh tilted patch law, respectively.
    The refined patch provides all its inputs: the raw density bound and Coulomb budget are (4.42),
    the deleted count bound is (4.26), and $rho lt.eq C a^(- 6)$ on the contributing ball by (4.25). Therefore
  #[#set math.equation(numbering: n => "(10.19)")
   $ \| bb(E)_Q \( H_j - W \) \( y \) \| lt.eq C a^(- 4) { tau^(1 \/ 5) + beta^(1 \/ 5) + sqrt(beta) +
     a^.01 tau^(- 1 \/ 2) + tau^(1 \/ 2) } = o \( a^(- 4) \) . $ <a:eq:cond-transfer>]
  Here $beta = a^.2$ and (10.7) makes every positive-power error vanish.
    The source-free potential remainder actually has the sharper power $tau^2$,
    so the common upper bound is sufficient. No equality of posterior laws is used in this transfer.
  On a high-failure event, its defining inequality is $d_y^4 H_j \( y \) < h - xi \/ 4$,
    whereas (10.18) and (10.19) give $d_y^4 bb(E)_Q H_j \( y \) gt.eq h - xi \/ 16 - o \( 1 \)$,
    a contradiction for small $s$. On a low-failure event the inequalities are reversed and give the same
    contradiction. Thus each such failure intersected with $cal(C)_j$ has probability less than $r^42$.
    Including (10.8), the two implications at a fixed point and height, with tolerance $xi \/ 4$,
    fail with probability at most $C r^40$.
  #emph[Spatial and height nets.] Choose a net of the closed band ${ r lt.eq d_y lt.eq
    4 L_1 r }$ with spacing at most $r^2$ and at most $C_(L_1) r^(- 3)$ points.
    For example, select one band point in each intersecting cube of side $r^2 \/ 2$;
    the cube count follows from the volume of its $O \( r^2 \)$ enlargement.
    Choose a finite height net in $\[ h_l \/ 2 \, 2 h_h \]$ with mesh at most $xi \/ 64$, including its endpoints.
    Exclude every point-and-height failure, the count failure, and the cap failure with $M = 40$ in (10.11).
    A union bound gives exceptional probability $C r^37$, and hence at most $C r^25$ for $r < 1$.
  On the retained event, (10.9) shows that $d_y^6 mu_j \( y \)$ varies by at most $C r^(1 - 4 w) =
    o \( 1 \)$ between a band point and a net point within $C r^2$.
    To control the field, work in a ball of radius $c r$ around a band point, contained in the enlarged cap band.
    On this ball $B$, let $Q = K * \( upright(bold(1))_B mu_j \)$. Then $H_j + Q$ is harmonic on $B$.
    The value and gradient of $Q$ are bounded by $C r^(- 4 - 3 w)$ and $C r^(- 5 - 3 w)$, respectively, so $H_j +
    Q$ is bounded above by $C r^(- 4 - 3 w)$. Its nonnegative distance from that upper bound has,
    by the Poisson formula on a smaller concentric ball, oscillation bounded by its central value times the
    relative distance. It follows that
  #[#set math.equation(numbering: n => "(10.20)")
   $ \| H_j \( z \) - H_j \( y \) \| lt.eq C r #scale(x: 120%, y: 120%)[\(] r^(- 4 - 3 w) +
     H_j \( y \)_(-) #scale(x: 120%, y: 120%)[\)] quad \( \| z - y \| lt.eq C r^2 \) . $ <a:eq:cond-field-oscillation>]
  This estimate also controls the change of the normalized field $d_y^4 H_j \( y \)$, since $d_z \/ d_y = 1 +
    O \( r \)$. In particular, if its value at $y$ is below $h - xi$, its value at $z$ is below $h -
    3 xi \/ 4$ for small $s$. Arbitrarily negative values cause no problem:
    the relevant upper estimate has the form $v + C r v_(-) + O \( r^(1 - 3 w) \)$,
    increasing in $v$ when $C r < 1$. If the value at $y$ exceeds $h + xi$,
    it is positive and the cap and (10.20) make its value at $z$ greater than $h + 3 xi \/ 4$.
  Suppose now a high-density implication failed at some $\( y \, h \)$.
    At a nearby spatial net point choose a height-net value $h' in \[ h - xi \/ 4 \, h - xi \/ 8 \]$.
    The positive lower height bound and the $o \( 1 \)$ density variation preserve the high antecedent at $h'$,
    while the field is below $h - 3 xi \/ 4 < h' - xi \/ 4$. This is an excluded net failure.
    For a low-density failure choose $h' in \[ h + xi \/ 8 \, h + xi \/ 4 \]$;
    its antecedent is preserved and the field exceeds $h + 3 xi \/ 4 > h' + xi \/ 4$.
    The height intervals lie inside $\[ h_l \/ 2 \, 2 h_h \]$ by the stipulated smallness of $xi$.
    This proves simultaneity and finishes the proposition. ◻
]

We record also an unconditional estimate used to pay for a failed band.
  For fixed $L_1$ and $r lt.eq d_y lt.eq 4 L_1 r$, the support and size of the master kernel, conditional Jensen,
  and (4.45) in the original state give

#[#set math.equation(numbering: n => "(10.21)")
 $ parallel mu_j \( y \) parallel_2 lt.eq C t_y^(- 3) ∥\# { i : r \/ 2 < d_(x_i) < 8 L_1 r }∥_2 lt.eq
   C t_y^(- 3) r^(- 3) lt.eq C r^(- 6 - 3 w) . $ <a:eq:cond-density-l2>]

The middle inequality uses the offset $D_0$ and sufficiently small $s$; its constant is uniform in the state and scale.

The order of choices is relevant. The fixed screening constants, $g \, c_1 \, w$,
  and the universal cap $C_(upright("cap"))$ come first. One may then choose $L_1 \, h_l \, h_h \,
  xi$ and a bounded offset $D_0$, and finally make $s$ small enough for every estimate above.
  Thereafter any sufficiently large $Z$ with $2 r_0 lt.eq s$ is permitted.
  In particular no step requires $D_0 = 0$, and the number of dyadic scales introduces no loss in the constants.

== 11 Outward propagation and an electron deficit <a:sec:propagation>

The conditional comparisons let us extend a prescribed electron source from the scale $Z^(- 1 \/ 3)$ to a small
  radius independent of $Z$. The result applies to ground states whose energy has a bounded offset from the
  minimum over all particle numbers.

#thm([Proposition 11.1.])[
  (Deficit inside a fixed small ball).  #emph[There is a universal constant $c_(upright("def")) >
    0$ with the following property. For every $D_0 in \[ 0 \, oo \)$ there is $s_(*) \( D_0 \) > 0$ such that,
    for each $0 < s lt.eq s_(*) \( D_0 \)$, there is an integer $Z_(*) \( D_0 \, s \)$ for which every integer $Z
    gt.eq Z_(*) \( D_0 \, s \)$ and every normalized sector ground state $Psi$ satisfying
$ n lt.eq 3 Z \, wide q_n \[ Psi \] = E_n lt.eq E + D_0 $

 obey
#[#set math.equation(numbering: n => "(11.1)")
 $ Z - bb(E)_Psi \# { i : \| x_i \| < s \/ 4 } gt.eq c_(upright("def")) s^(- 3) > 1 . $ <a:eq:prop-deficit>]

 All thresholds are independent of the sector and of the choice of its ground state.
   In particular, admissible fixed radii $s$ can be taken arbitrarily small.]
] <a:prop:prop-deficit>

To prove the deficit, we construct fields $u_j$ satisfying a lower bound for their Laplacian.
  Alongside the nuclear term $- 4 pi nu$, this bound uses the conditional density term $4 pi
  mu_j$ inside radius $r_j$ and the model reaction $4 pi k \( u_j \)_(+)^(3 \/ 2)$ outside.
  Each outward step replaces that reaction by the actual density on one more annulus,
  then forgets the current observation array. An error density records the source omitted on exceptional data.
  A positive lower barrier and a small expected error will force a positive residual charge at the terminal scale.
  The construction also gives the following result at every intermediate stopping index.

#thm([Proposition 11.2.])[
  (Intermediate atomic subsolutions).  #emph[There are universal constants $epsilon \, B \,
    C_(upright("inv")) > 0$ and $L_1 > 2$ with the following property.
    Fix $D_0 < oo$, then take $s > 0$ sufficiently small and integer $Z$ sufficiently large as in Proposition 46.
    For every sector ground state in that proposition use the common observations and master packets
    (10.1)–(10.2), with $r_0 = epsilon Z^(- 1 \/ 3)$ and $s \/ 2 < r_m lt.eq s$.
    For each $0 lt.eq j lt.eq m$ there exist jointly measurable $cal(F)_j$-measurable fields $u_j$ and densities
    $p_j^(upright("err"))$ with the following properties. Put $d = \| y \|$, $r = r_j$, and $f \( t \) =
    4 pi k \( t_(+) \)^(3 \/ 2)$, and define
$ b_r \( y \) = B d^(- 4) (1 - frac(r, 8 d)) quad \( d gt.eq r \) . $

#[#set math.equation(numbering: n => "(11.2)")
 $ Delta u_j & gt.eq - 4 pi nu + 4 pi upright(bold(1))_({ d < r }) mu_j - 4 pi p_j^(upright("err")) +
   upright(bold(1))_({ d gt.eq r }) f \( u_j \) \,\
b_r lt.eq u_j & lt.eq C_(upright("inv")) d^(- 4) quad \( d gt.eq r \) \, wide u_j =
  b_r quad \( d > L_1 r \) . $ <a:eq:prop-invariant>]

 The differential inequality is global in distributions. The offsets $u_j -
   V$ are continuous and locally Lipschitz on all of $bb(R)^3$; $p_j^(upright("err")) gt.eq
   0$ is bounded and supported in $\| y \| lt.eq r_j$. For each fixed system and step,
   the offsets have deterministic size and Lipschitz bounds on every compact set;
   the errors have deterministic size bounds. Universally,
#[#set math.equation(numbering: n => "(11.3)")
 $ bb(E) integral p_j^(upright("err")) lt.eq C r_0^32 + C sum_(i < j) r_i^(19 \/ 2 - 3 w) lt.eq
   C (r_0^32 + r_j^(19 \/ 2 - 3 w)) \, wide w = 10^(- 5) . $ <eq:atomic-prefix-error>]

 In particular this is at most $C \( s^32 + s^(19 \/ 2 - 3 w) \)$.
   The expectations cannot in general be omitted for $j < m$; the terminal fields are deterministic.
   The same master kernels are used at every intermediate stopping index.
   The constants $epsilon \, B \, C_(upright("inv")) \, L_1$ are independent of any additional inverse-comparison
   parameters. Such a comparison uses these same observations whenever its own smallness condition on $s$ is met.]
] <prop:atomic-intermediate>

#proof[
  Use the observations and master packets (10.1)–(10.2), with $epsilon$ fixed during initialization below and $Z$
    large enough that $m gt.eq 1$. The resulting densities and fields satisfy
  #[#set math.equation(numbering: n => "(11.4)")
   $ bb(E) \[ mu_j divides cal(F)_(j + 1) \] = mu_(j + 1) \, wide bb(E) \[ H_j divides cal(F)_(j + 1) \] =
     H_(j + 1) . $ <a:eq:prop-master-recall>]
  Write $kappa = 1 \/ 8$. The barrier $b_r$ in the proposition is positive on $d gt.eq r$ and,
    for sufficiently small fixed $B > 0$, satisfies
  #[#set math.equation(numbering: n => "(11.5)")
   $ Delta b_r = B d^(- 6) \( 12 - 20 kappa r \/ d \) gt.eq 19 / 2 B d^(- 6) gt.eq f \( b_r \) . $ <a:eq:prop-barrier>]
  For example, $4 pi k sqrt(B) lt.eq 19 \/ 2$ suffices. If $R = 2 r$, then
  #[#set math.equation(numbering: n => "(11.6)")
   $ b_r - b_R = B kappa r d^(- 5) gt.eq gamma R^(- 4) quad \( R lt.eq d lt.eq 1.1 R \) \, wide gamma =
     frac(B kappa, 2 \( 1.1 \)^5) > 0 . $ <a:eq:prop-gap>]
  #emph[Initialization.] With probability at least $1 - C r_0^35$, the initial conditional density satisfies
  #[#set math.equation(numbering: n => "(11.7)")
   $ P_0 \( y \) := K * \( upright(bold(1))_({ d < r_0 }) mu_0 \) \( y \) lt.eq
     0.1 thin Z \/ r_0 wide \( r_0 lt.eq \| y \| lt.eq 1.1 r_0 \) . $ <a:eq:prop-init-good>]
  To prove this, fix a point $y$ in this annulus and let $A_y = { P_0 \( y \) > 0.05 Z \/ r_0 }$,
    an event of $cal(F)_0$. Suppose that $p = bb(P) \( A_y \) > r_0^40$.
    By Lemma 26, the raw marginal conditioned on this event is the squared law of an antisymmetric state of offset
    at most
  $ D_0 + C r_0^(- 2.02) log^5 \( e \/ r_0^40 \) . $
  For the fixed $epsilon$ this is at most $Z^(7 \/ 3)$ when $Z$ is large enough.
    The global estimate (3.3) therefore bounds the tilted density $rho_(A_y)$ by $integral rho_(A_y)^(5 \/ 3)
    lt.eq C Z^(7 \/ 3)$, with a universal $C$.
  Only packet centers with $\| x \| < 2 r_0$ can contribute to the truncated density in $P_0$:
    a center outside this ball has $t_x lt.eq c_1 s^w \| x \| < \| x \| \/ 2$,
    so its packet misses $B \( 0 \, r_0 \)$. A truncated packet has potential at most that of the full packet,
    which by radial smearing is at most $K \( y - x \)$. The conditional tower identity and Hölder’s inequality
    consequently give
  $ bb(E) \[ P_0 \( y \) divides A_y \] & lt.eq integral_(\| x \| < 2 r_0) frac(rho_(A_y) \( x \), \| y - x \|)
    thin thin upright(d) x\
 & lt.eq C Z^(7 \/ 5) r_0^(1 \/ 5) = C epsilon^(6 \/ 5) thin Z \/ r_0 . $
  Choose $epsilon$ small enough that the last coefficient is less than $0.05$.
    This contradicts the definition of $A_y$, so $bb(P) \( A_y \) lt.eq r_0^40$.
  The minimum packet width is $t_min = c_1 r_0^(1 + w)$. Integrating $\| y -
    z \|^(- 2)$ against a bounded packet gives the deterministic bound
  $ parallel nabla P_0 parallel_oo lt.eq C n t_min^(- 2) lt.eq C Z r_0^(- 2 - 2 w) . $
  A net in the annulus of spacing $O \( r_0^2 \)$ has $O \( r_0^(- 3) \)$ points.
    The union bound gives failure probability $O \( r_0^37 \)$,
    and the variation between a point and its net point, divided by $Z \/ r_0$, is $O \( r_0^(1 - 2 w) \) =
    o \( 1 \)$. For large $Z$ this proves (11.7), with the stated weaker exponent $35$.
  Let $G_0$ denote the event in (11.7), and set
  $ mu^(upright("in")) = upright(bold(1))_(G_0) upright(bold(1))_({ d < r_0 }) mu_0 \, wide p_0^(upright("err")) =
    upright(bold(1))_(G_0^c) upright(bold(1))_({ d < r_0 }) mu_0 . $
  On $d < 2 r_0$ use the branch
  $ v = V - K * mu^(upright("in")) - 0.7 Z \/ r_0 + C_3 \( Z \/ r_0 \)^(3 \/ 2) d^2 . $
  Choose $C_3$ universally so that $6 C_3 gt.eq 4 pi k 2^(3 \/ 2)$,
    and then choose $epsilon$ sufficiently small to meet the preceding tilt condition and $4 C_3 epsilon^(3 \/ 2)
    lt.eq 0.05$. The quadratic term on this ball is at most $0.05 Z \/ r_0$, since $Z r_0^3 = epsilon^3$.
    For $r_0 lt.eq d < 2 r_0$ we thus have $v lt.eq 2 Z \/ r_0$ and
  $ Delta v = - 4 pi nu + 4 pi mu^(upright("in")) + 6 C_3 \( Z \/ r_0 \)^(3 \/ 2) \, wide
    6 C_3 \( Z \/ r_0 \)^(3 \/ 2) gt.eq f \( v \) . $
  On $r_0 lt.eq d < 1.06 r_0$, the good-event bound (and the easier bound $mu^(upright("in")) =
    0$ on its complement) give
  $ v gt.eq \( 1 \/ 1.06 - 0.1 - 0.7 \) Z \/ r_0 > 0.14 Z \/ r_0 . $
  On $1.9 r_0 < d < 2 r_0$ we instead have $v lt.eq \( 1 \/ 1.9 - 0.7 + 0.05 \) Z \/ r_0 < 0$.
    Fix $B$ satisfying the barrier condition and $0 < B lt.eq 0.1 epsilon^3$.
    Then $v > b_(r_0)$ on the lower overlap, whereas $v < 0 < b_(r_0)$ on the upper overlap. Define
  $ u_0 =
    cases(delim: "{", v \, & d < 1.06 r_0 \,, max \( v \, b_(r_0) \) \, & r_0 < d < 2 r_0 \,, b_(r_0) \, & d > 1.9
    r_0 .) $
  The definitions agree on their open overlaps. Lemma 28 proves (11.2) initially; near $d =
    r_0$ the branch $v$ alone attains the maximum, and its displayed Laplacian supplies both required densities.
    The exterior upper bound holds, for example, when $C_(upright("inv")) gt.eq max \( B \, 32 epsilon^3 \)$.
    Also, using $n lt.eq 3 Z = 3 epsilon^3 r_0^(- 3)$,
  #[#set math.equation(numbering: n => "(11.8)")
   $ bb(E) integral p_0^(upright("err")) lt.eq n bb(P) \( G_0^c \) lt.eq C r_0^32 . $ <a:eq:prop-initial-error>]
  #emph[Order of the remaining constants.] The constants $C_3 \, epsilon \, B$ have now been fixed universally.
    Increase $C_(upright("inv"))$ to exceed also the universal cap $C_(upright("cap"))$ in Proposition 45.
    After fixing $gamma$ in (11.6), choose $0 < lambda_2 < lambda_1 < gamma \/ 2$.
    Choose $L_1 > 2$ so large that $C_(upright("inv")) L_1^(- 4) < lambda_2$. This ensures
  $ C_(upright("inv")) d^(- 4) - lambda_2 R^(- 4) < b_R wide \( d > L_1 R \) . $
  Next fix $0 < h_l < B \/ 4$ and $h_h > C_(upright("inv"))$, and then choose $e_0 \, xi > 0$ sufficiently small that
  #[#set math.equation(numbering: n => "(11.9)")
   $ 2 e_0 \( 2 L_1 \)^4 < B \/ 4 \, wide 16 xi + 2 e_0 < lambda_1 - lambda_2 \, wide xi < lambda_2 \,
     $ <a:eq:prop-choices>]
  with $xi$ also in the range of Proposition 45. Only now restrict $s$ according to that proposition, $D_0$,
    and the other smallness conditions in this proof. Finally take $Z$ large according to $D_0 \,
    s$ and the initialization requirements. Thus no constant is chosen in terms of a later scale or a particular state.
  #emph[One outward step.] Suppose that (11.2) holds at $r = r_j$, write $R = 2 r$, and abbreviate $u = u_j$.
    On the good band event of Proposition 45, for the band $r lt.eq d lt.eq 4 L_1 r = 2 L_1 R$, introduce
  $ v_1 = u - lambda_1 R^(- 4) \, wide v_2 = H_j - lambda_2 R^(- 4) . $
  Define a new function on a fixed open cover by
  #[#set math.equation(numbering: n => "(11.10)")
   $ upright("region") & u'\
d < 1.08 R & max \( v_1 \, v_2 \)\
1.04 R < d < 2 L_1 R & max \( v_1 \, v_2 \, b_R \)\
d > L_1 R & b_R . $ <a:eq:prop-branches>]
  On bad band data omit $v_2$ in every row. In both cases set
  #[#set math.equation(numbering: n => "(11.11)")
   $ tilde(p) = p_j^(upright("err")) + upright(bold(1))_({ upright("bad") }) upright(bold(1))_({ r lt.eq d < R })
     mu_j . $ <a:eq:prop-step-error>]
  On the lower overlap, (11.6) gives $v_1 gt.eq b_r - lambda_1 R^(- 4) > b_R$.
    On the upper overlap, the caps on $u$ and, on good data, $H_j$ put both shifted branches below $b_R$.
    The definitions therefore agree. For $R lt.eq d < 1.08 R$ the lower bound $u' gt.eq
    b_R$ follows already from $v_1$; farther out the barrier is included explicitly.
    The upper bound $u' lt.eq C_(upright("inv")) d^(- 4)$ and the equality $u' =
    b_R$ for $d > L_1 R$ follow from the same caps.
  We prove the distributional inequality at radius $R$ before averaging.
    The open-neighborhood formulation is as follows. At a point $y_0$ in one of the open sets of (11.10),
    let $M$ be the maximum of its candidate family and put $eta = e_0 R^(- 4)$.
    Keep precisely those candidates $v$ with $M \( y_0 \) - v \( y_0 \) lt.eq eta$,
    and choose a maximizer $v_(*)$ at $y_0$. Continuity and finiteness give an open neighborhood $U$ of $y_0$,
    inside the chosen open set, on which every discarded candidate is strictly below $v_(*)$ and every retained
    candidate satisfies
  #[#set math.equation(numbering: n => "(11.12)")
   $ M - v < 2 e_0 R^(- 4) . $ <a:eq:prop-near-active>]
  The retained family has maximum $M$ throughout $U$. At the origin make this construction with the continuous
    offsets by $V$; the family there contains only branches having that common singularity.
  Each retained branch satisfies on the whole of this neighborhood the common inequality
  #[#set math.equation(numbering: n => "(11.13)")
   $ Delta v gt.eq - 4 pi nu + 4 pi upright(bold(1))_({ d < R }) mu_j - 4 pi tilde(p) +
     upright(bold(1))_({ d gt.eq R }) f \( v \) . $ <a:eq:prop-common>]
  For $v_1$, retain its old distributional inequality and compare its right side with the new one almost
    everywhere. On $d < r$ the old source suffices. On $d gt.eq R$, use $f \( u \) gt.eq f \( v_1 \)$.
    On the gain region $r lt.eq d < R$, bad data are paid by the added error in (11.11).
    On good data, $v_2$ is a candidate there, so (11.12) gives
  $ H_j lt.eq u - \( lambda_1 - lambda_2 - 2 e_0 \) R^(- 4) . $
  Moreover $h_l < 7 B \/ 8 lt.eq d^4 u lt.eq C_(upright("inv")) < h_h$.
    If $4 pi mu_j > f \( u \)$, the high implication in (10.5), at height $h = d^4 u$, would give
  $ H_j gt.eq u - xi d^(- 4) gt.eq u - 16 xi R^(- 4) \, $
  contrary to (11.9). Hence $4 pi mu_j lt.eq f \( u \)$, and the old reaction supplies the added source.
  For $v_2$, which occurs only on good data, start from its identity on all of $U$,
  $ Delta v_2 = - 4 pi nu + 4 pi mu_j . $
  This supplies (11.13) on $d < R$, since $tilde(p) gt.eq 0$.
    At any remaining point where $v_2$ is retained, the lower splice or the included barrier gives $M gt.eq b_R$,
    and $d lt.eq 2 L_1 R$. Thus
  $ d^4 v_2 gt.eq B \( 1 - kappa R \/ d \) - 2 e_0 \( d \/ R \)^4 gt.eq 7 B \/ 8 -
    2 e_0 \( 2 L_1 \)^4 > 5 B \/ 8 > h_l . $
  The cap also gives $d^4 v_2 lt.eq C_(upright("cap")) < h_h$.
    If $4 pi mu_j < f \( v_2 \)$, the low implication in (10.5), with $h = d^4 v_2$, would imply
  $ H_j lt.eq v_2 + xi d^(- 4) lt.eq v_2 + xi R^(- 4) < v_2 + lambda_2 R^(- 4) = H_j \, $
  which is impossible. Consequently $4 pi mu_j gt.eq f \( v_2 \)$ there.
    The barrier branch occurs only where $d > R$ and satisfies the common inequality by (11.5).
  These verifications compare zero-order densities almost everywhere on the same open set $U$;
    they do not restrict or differentiate a weak inequality across an activity set or a sphere.
    In particular they apply on a neighborhood crossing $d = R$.
    The common reaction is $F \( y \, t \) = upright(bold(1))_({ d gt.eq R }) f \( t \)$,
    which meets Lemma 28’s hypotheses after canceling $V$ near the origin.
    That lemma proves (11.13) for the local maximum. These local conclusions give the inequality globally by a
    partition of unity. We have proved the desired invariant at radius $R$ with density $mu_j$, function $u'$,
    and error $tilde(p)$.
  #emph[Forgetting the current observations.] Define the next offset and error by conditional integration,
  $ u_(j + 1) = V + bb(E) \[ u' - V divides cal(F)_(j + 1) \] \, wide p_(j + 1)^(upright("err")) =
    bb(E) \[ tilde(p) divides cal(F)_(j + 1) \] . $
  We give the regularity justification as well as the formal calculation.
    For the fixed system $t_min > 0$, and integration of each packet gives deterministic bounds
  $ parallel mu_j parallel_oo lt.eq C n t_min^(- 3) \, wide parallel K * mu_j parallel_oo lt.eq C n t_min^(- 1) \,
    wide parallel nabla K * mu_j parallel_oo lt.eq C n t_min^(- 2) . $
  The same potential bounds hold for the initially truncated density.
    The explicit initial branches therefore have deterministic local Lipschitz bounds for their offsets.
    Subtracting a constant and taking a finite maximum preserve such bounds.
    Where $b_R$ occurs, its offset $b_R - V$ is smooth and separated from the origin.
    The fixed open cover and agreement on overlaps preserve local bounds after gluing.
    The errors are bounded, nonnegative, and supported in a deterministic ball.
    Induction supplies all the claimed bounds at every step, without requiring them to be uniform in $Z$.
  All functions are jointly measurable in data and position.
    Indeed the conditional densities have the likelihood versions described in Section 10;
    the initialization flag is a supremum of a continuous function on a fixed compact annulus,
    testable on a countable dense set; and the band flags and finite maxima are measurable.
    Conditional integration of functions with deterministic local Lipschitz bounds preserves those bounds.
    It also commutes with weak derivatives by Fubini. Nonnegative smooth tests in a countable dense family first
    give simultaneous almost-sure weak inequalities; local bounds extend them to every test.
    Thus the following conditional integration is legitimate as an inequality of distributions.
  Integrate (11.13) conditionally on $cal(F)_(j + 1)$. The tower property supplies $mu_(j + 1)$, while convexity gives
  $ bb(E) \[ f \( u' \) divides cal(F)_(j + 1) \] gt.eq f #scale(x: 120%, y: 120%)[\(] V +
    bb(E) \[ u' - V divides cal(F)_(j + 1) \] #scale(x: 120%, y: 120%)[\)] . $
  The deterministic bounds $b_R lt.eq u' lt.eq C_(upright("inv")) d^(- 4)$ and the equality outside $L_1
    R$ pass to this average. Positivity, boundedness, and support of the error do as well.
    This proves (11.2) at step $j + 1$.
  #emph[Summing the lost source.] For $r lt.eq d_y < 2 r$, every master packet contributing to $mu_j \( y \)$ has
    its center in a fixed annulus comparable to $r$, and its width is comparable to $t_y$.
    Conditional Jensen and the annular count estimate (4.45), applied with offset at most $D_0$, yield
  $ parallel mu_j \( y \) parallel_2 lt.eq C t_y^(- 3) r^(- 3) lt.eq C r^(- 6 - 3 w) . $
  Here $r lt.eq s lt.eq 1$ and $s$ is small according to $D_0$, so $max \( r^(- 3) \, 1 \) + sqrt(D_0 r) lt.eq
    C r^(- 3)$. The bad band probability is at most $C r^25$ by Proposition 45.
    Cauchy–Schwarz in data and integration over the gain annulus give
  $ bb(E) integral \( tilde(p) - p_j^(upright("err")) \) lt.eq C r^(25 \/ 2) r^3 r^(- 6 - 3 w) = C r^alpha \, wide
    alpha = 19 / 2 - 3 w > 0 . $
  Conditional averaging preserves the expected integral. Stopping the sum before any index $j$ and using (11.8)
    proves (11.3), with the same master kernels and without replacing an expectation by a pathwise bound.
    At the terminal index the geometric progression of radii gives
  #[#set math.equation(numbering: n => "(11.14)")
   $ integral p_m^(upright("err")) = bb(E) integral p_m^(upright("err")) lt.eq C r_0^32 +
     C sum_(j = 0)^(m - 1) r_j^alpha lt.eq C \( s^32 + s^alpha \) . $ <a:eq:prop-total-error>]
  The last error is deterministic because $cal(F)_m$ is trivial.
    The constants are independent of the number of scales and of $Z$.
  #emph[From the potential to the raw electron count.] Put $r = r_m$, $u = u_m$,
    and introduce the compactly supported signed measure
  $ S = nu - upright(bold(1))_({ d < r }) mu_m thin thin upright(d) y + p_m^(upright("err")) thin thin upright(d) y . $
  The invariant implies $Delta \( u - K * S \) gt.eq 0$. Its singularities cancel in the identity
  $ u - K * S = \( u - V \) + K * \( upright(bold(1))_({ d < r }) mu_m \) - K * p_m^(upright("err")) \, $
  whose right side is continuous and locally $H^1$ on all of $bb(R)^3$. The difference tends to zero at infinity:
    $u = b_r$ outside $L_1 r$, and the potential of the finite compact source $S$ tends to zero.
    For each $a > 0$, the positive part $\( u - K * S - a \)_(+)$ has compact support and is an admissible $H^1$
    test in its subharmonic inequality. Testing gives a nonpositive squared gradient integral,
    hence this positive part vanishes. Letting $a arrow.b 0$ proves $u lt.eq K * S$.
  On the sphere $d = 2 r$, the invariant gives $u gt.eq b_r \( 2 r \) = 15 B r^(- 4) \/ 256$.
    The spherical mean of $K * S$ there equals the total mass of $S$ divided by $2 r$,
    since $S$ is supported in ${ d lt.eq r }$. Consequently
  #[#set math.equation(numbering: n => "(11.15)")
   $ Z - integral_(d < r_m) mu_m + integral p_m^(upright("err")) gt.eq frac(15 B, 128) r_m^(- 3) . $ <a:eq:prop-charge>]
  No sign condition on the measure $S$ is needed for this mean identity.
  Finally $mu_m$ is the unconditional master-smoothed density.
    If $\| x \| < s \/ 4$, then $r_0 lt.eq s \/ 2$ and $D_x^0 lt.eq s \/ 2$, so $t_x lt.eq
    c_1 \( s \/ 2 \) s^w < s \/ 4$. The packet at $x$ is therefore wholly contained in $B \( 0 \, s \/ 2 \) subset
    B \( 0 \, r_m \)$. Since every packet has mass one,
  $ bb(E)_Psi \# { i : \| x_i \| < s \/ 4 } lt.eq integral_(d < r_m) mu_m . $
  Combining this with (11.15), (11.14), and $r_m lt.eq s$ gives
  $ Z - bb(E)_Psi \# { i : \| x_i \| < s \/ 4 } gt.eq frac(15 B, 128) s^(- 3) - C \( s^32 + s^alpha \) . $
  Take $c_(upright("def")) = 15 B \/ 256$ and decrease $s_(*) \( D_0 \)$ so that the error is at most
    $c_(upright("def")) s^(- 3)$ and $c_(upright("def")) s^(- 3) > 1$ for every $0 < s lt.eq s_(*) \( D_0 \)$.
    All remaining requirements are met by increasing $Z_(*) \( D_0 \, s \)$. This proves the proposition. ◻
]

== 12 Returning to the neutral sector <a:sec:neutral>

The deficit estimate was proved for ground states whose energy is within a fixed distance of the minimum over all
  particle numbers. We first apply it at that minimum. A screened deletion comparison will then put the neutral
  and singly ionized ground states in the same class.

We record explicitly the harmonic-field estimate used in the deletion and again in the final tail argument.
  For a configuration $omega = \( x_i \, sigma_i \)_(i = 1)^n$ and $h > 0$, write

#[#set math.equation(numbering: n => "(12.1)")
 $ B_h \( x \; omega \) = V \( x \) - sum_(\| x_i \| < h) K \( x - x_i \) . $ <a:eq:tail-inner-field>]

This field is harmonic on ${ \| x \| > h }$, configuration by configuration.

#thm([Lemma 12.1.])[
  (Conditional fields on annuli).  #emph[Fix positive constants $alpha < alpha' < beta' < beta$ and $alpha_0 <
    beta_0$. Let $u > 0$, $0 < h lt.eq alpha u \/ 2$, and let $psi$ be a normalized $delta$-state with $n lt.eq
    3 Z$, where $delta < oo$ is arbitrary. Let $Y$ be the data from a cut whose out support lies in ${ alpha_0
    u < \| x \| < beta_0 u }$ and whose squared gradient cost is at most $C u^(- 2)$.
    The cut may also be absent, in which case $Y$ is trivial. There is a jointly measurable version
$ H_Y \( x \) = bb(E)_psi \[ B_h \( x \) divides Y \] $

 which is harmonic on ${ alpha u < \| x \| < beta u }$ for almost every datum. Put
$ M \( Y \) = sup_(alpha' u lt.eq \| x \| lt.eq beta' u) \( H_Y \( x \) \)_(+) . $

 Then
#[#set math.equation(numbering: n => "(12.2)")
 $ parallel M parallel_2 lt.eq C {frac(max \( u^(- 3) \, 1 \) + sqrt(delta u), u) +
   sum_(j = 0)^oo frac(max \( \( 2^j h \)^(- 3) \, 1 \) + sqrt(delta thin 2^j h), max \( u \, 2^j h \))} .
   $ <a:eq:tail-harmonic-bound>]

 The constant depends only on the fixed annular ratios and cut-gradient constant,
   in addition to the fixed screening constants $L \, A$. In particular it does not depend on $n \, Z \, delta \,
   h \, u$.]
] <a:lem:tail-harmonic>

#proof[
  For $x$ in the broad annulus, every source with $\| x_i \| < h$ lies outside $B \( x \, A a_x \)$:
    indeed $h lt.eq \| x \| \/ 2$ and $A \/ L < 1 \/ 2$. Consequently
  #[#set math.equation(numbering: n => "(12.3)")
   $ B_h \( x \) = J_x + sum_(\| x_i \| gt.eq h\
\| x_i - x \| gt.eq A a_x) K \( x - x_i \) . $ <a:eq:tail-addback>]
  If $2^j h lt.eq \| x_i \| < 2^(j + 1) h$ and the summand occurs, then
  $ K \( x - x_i \) lt.eq frac(C, max \( u \, 2^j h \)) . $
  For radii comparable to or below $u$ this follows from the exclusion $\| x_i - x \| gt.eq A a_x gt.eq
    A alpha u \/ L$; for radii greater than $2 beta u$ it follows from $\| x_i - x \| gt.eq \| x_i \| \/ 2$.
  The initial-cut hypotheses of Proposition 20 hold uniformly here.
    Cover its support by a fixed finite number of cells $B_z$ with $a_z asymp u$,
    the constants being allowed to depend on $L$ and the annular ratios.
    For each target $x$ in the broad annulus these cell scales are comparable to $a_x$.
    The gradient bound can be written as $sum_z D_z^2 a_z^(- 2) upright(bold(1))_(B_z)$, with $D_z^2 lt.eq
    C \( a_z \/ u \)^2$. Since $a_z m_z gt.eq 1$ and the screening parameter $P gt.eq 1$,
  $ frac(D_z^2, a_z m_z) lt.eq C lt.eq C_0 sqrt(P) . $
  Enlarging the fixed cover constant $C_0$ suffices for every finite $delta$.
    Thus (4.39), conditional Jensen, the triangle inequality in $L^2$, and (4.45) applied to (12.3) give,
    pointwise in the spatial variable,
  $ parallel \( H_Y \( x \) \)_(+) parallel_2 lt.eq C {frac(max \( u^(- 3) \, 1 \) + sqrt(delta u), u) +
    sum_(j gt.eq 0) frac(max \( \( 2^j h \)^(- 3) \, 1 \) + sqrt(delta thin 2^j h), max \( u \, 2^j h \))} . $
  The series converges: its large-$j$ terms are bounded by a constant times $2^(- j) h^(- 1) +
    sqrt(delta) thin 2^(- j \/ 2) h^(- 1 \/ 2)$.
  For completeness, conditional fields here have simultaneous spatial versions.
    On every compact subset of ${ \| x \| > h }$, the kernels in (12.1) and each fixed number of their derivatives
    have deterministic bounds for the fixed finite system. Conditional integration therefore gives continuous
    harmonic functions, with measurable dependence on the data.
    One may first use the conditional law of configurations supplied by the cut and then differentiate under that
    integral. For a harmonic function $H$, its positive part is subharmonic.
    Balls of radius $c u$ about points of the smaller annulus remain in the broad annulus,
    so their mean-value inequalities imply
  $ sup_(alpha' u lt.eq \| x \| lt.eq beta' u) H \( x \)_(+) lt.eq
    C u^(- 3) integral_(alpha u < \| z \| < beta u) H \( z \)_(+) thin thin upright(d) z . $
  Minkowski’s integral inequality and the pointwise bound prove (12.2).
    Suprema can be taken on countable dense sets, which also proves their measurability. ◻
]

Two forms of this estimate will be used. With fixed $t > 0$, $h = t \/ 4$, $u = 2^ell t$, and $delta = 0$,
  it gives for the positive conditional supremum on $u lt.eq \| x \| lt.eq 2 u$ the bound

#[#set math.equation(numbering: n => "(12.4)")
 $ parallel M parallel_2 lt.eq C_t frac(1 + ell, u) . $ <a:eq:tail-deletion-field>]

Indeed the terms with $2^j h lt.eq u$ have total numerator at most $C_t \( 1 + ell \)$,
  and the remaining series is $O_t \( u^(- 1) \)$. With $h = u \/ 8$, $u gt.eq 1$,
  and the smaller annulus $u \/ 2 lt.eq \| x \| lt.eq 4 u$,
  the broad annulus $u \/ 4 < \| x \| < 6 u$ is admissible and gives

#[#set math.equation(numbering: n => "(12.5)")
 $ parallel M parallel_2 lt.eq C #scale(x: 120%, y: 120%)[\(] u^(- 1) +
   sqrt(delta) thin u^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <a:eq:tail-distant-field>]

In the first application the broad annulus can be $u \/ 2 < \| x \| < 3 u$.
  The non-strict equality $h = alpha u \/ 2$ causes no boundary issue,
  since the broad annulus is open and still separated from the sources.

#thm([Lemma 12.2.])[
  (An upper bound on an inner deficit).  #emph[For each fixed $t > 0$ and every normalized $delta$-state with $n
    lt.eq 3 Z$,
#[#set math.equation(numbering: n => "(12.6)")
 $ Z - bb(E) \# { i : \| x_i \| < t \/ 4 } lt.eq C_t \( 1 + sqrt(delta) \) . $ <a:eq:tail-deficit-upper>]

]
] <a:lem:tail-deficit-upper>

#proof[
  Use Lemma 48 with no cut, $h = t \/ 4$, and $u = t$. Its convergent series is bounded by
    $C_t \( 1 + sqrt(delta) \)$. The spherical average of the expected field $B_(t \/ 4)$ on $\| x \| = t$ equals
  $ frac(Z - bb(E) \# { i : \| x_i \| < t \/ 4 }, t) \, $
  by the spherical mean of the Coulomb kernel. Bounding this average from above by the positive supremum proves
    the assertion, with the fixed factor $t$ absorbed into $C_t$. ◻
]

#thm([Proposition 12.3.])[
  (A bounded offset for neutral sectors).  #emph[There are universal constants $C \, Z_0 < oo$ such that,
    for $Z gt.eq Z_0$,
#[#set math.equation(numbering: n => "(12.7)")
 $ E_(Z - 1) lt.eq E + C . $ <a:eq:tail-offset>]

]
] <a:prop:tail-offset>

#proof[
  Take a normalized ground state $Psi_(*)$ in sector $N_(*)$, where $Z lt.eq N_(*) lt.eq 3 Z$ and $E_(N_(*)) = E$,
    as provided by Lemma 9. Proposition 46, with $D_0 = 0$, supplies a fixed sufficiently small $t > 0$ such that
  $ bb(E)_(Psi_(*)) #scale(x: 120%, y: 120%)[\[] Z - \# { i : \| x_i \| < 2 t } #scale(x: 120%, y: 120%)[\]] > 1 $
  for all sufficiently large $Z$. Choose a smooth square partition $c^2 + o^2 = 1$, with $c = 1$ on $\| x \| lt.eq
    t$, $c = 0$ on $\| x \| gt.eq 2 t$, and $\| nabla c \|^2 + \| nabla o \|^2 lt.eq
    C t^(- 2)$ supported in the intervening annulus. Let $X$ be its full out data and set $q^c = Z - n_c$,
    where $n_c$ is the number of core particles. Since $n_c lt.eq \# { i : \| x_i \| < 2 t }$, we have $bb(E) q^c > 1$.
  We first show that the favorable event $G = { n_c lt.eq Z -
    1 }$ has probability bounded below independently of $Z$. Independently of the cut labels,
    observe one unordered array with the smooth compact noise law of Lemma 26,
    choosing its fixed width so that each spatial displacement is less than $t \/ 8$. Put
  $ q^(upright("obs")) = Z - \# { upright("array entries in ") B \( 0 \, t \/ 2 \) } . $
  Every entry counted here comes from a particle of radius less than $5 t \/ 8$, which must be core.
    Thus $q^c lt.eq q^(upright("obs"))$ on the enlarged probability space.
    Conversely every particle of radius less than $t \/ 4$ produces an entry in $B \( 0 \, t \/ 2 \)$.
  For an event $A_lambda = { q^(upright("obs")) > lambda }$ of probability $p > 0$,
    the single-array version of (5.4) produces a normalized state $Psi_(A_lambda)$ whose raw configuration law is
    the law conditioned on that event and whose offset satisfies
  $ delta lt.eq C_t log^5 \( e \/ p \) . $
  Every compatible configuration obeys $Z - \# { \| x_i \| < t \/ 4 } > lambda$. Hence Lemma 49 gives
  $ lambda lt.eq C_t #scale(x: 120%, y: 120%)[\(] 1 + log^(5 \/ 2) \( e \/ p \) #scale(x: 120%, y: 120%)[\)] . $
  For sufficiently large $lambda$ this implies $p lt.eq e exp \( - c_t lambda^(2 \/ 5) \)$;
    the inequality is also harmless when $p = 0$. Integrating the tail yields
  #[#set math.equation(numbering: n => "(12.8)")
   $ bb(E) \( q^c \)_(+)^2 lt.eq bb(E) \( q^(upright("obs")) \)_(+)^2 lt.eq C_t \, wide bb(P) \( G \) =
     bb(P) \( q^c > 0 \) gt.eq frac(\( bb(E) \( q^c \)_(+) \)^2, bb(E) \( q^c \)_(+)^2) gt.eq
     c_t > 0 . $ <a:eq:tail-favorable-probability>]
  Here the equality of events uses the integer-valued core count, and $bb(E) \( q^c \)_(+) gt.eq bb(E) q^c > 1$.
  We next estimate the average energy of the core slices. The localization error is $O_t \( 1 \)$ by (4.45) at
    offset zero. In the attractive term of (3.6), retain only the core repulsion from particles with radius less
    than $t \/ 4$, which are core with probability one. Conditional integration followed by averaging the original
    cut labels gives
  #[#set math.equation(numbering: n => "(12.9)")
   $ bb(E) sum_(i med upright("out")) Phi_X \( x_i \) lt.eq bb(E)_(Psi_(*)) sum_i o \( x_i \)^2
     B_(t \/ 4) \( x_i \) . $ <a:eq:tail-deletion-attraction>]
  This comparison of expectations uses the raw inner particles; it does not identify fields from different core slices.
  Divide the nonzero terms on the right into shells $u lt.eq \| x_i \| < 2 u$, $u = 2^ell t$, $ell gt.eq 0$.
    For each shell use an auxiliary cut of the original state, full out on that shell,
    supported in $u \/ 2 < \| x \| < 4 u$, with gradient cost $C u^(- 2)$, and call its data $Y$.
    All weighted shell positions and their weights $o \( x_i \)^2$ are then recorded.
    Conditional integration of the raw field, with the harmonic version of Lemma 48,
    bounds the shell expectation by $bb(E) \[ n_u M \( Y \) \]$, where $n_u = \# { u lt.eq \| x_i \| < 2 u }$.
    Equations (4.45) and (12.4) give
  $ bb(E) \[ n_u M \] lt.eq parallel n_u parallel_2 parallel M parallel_2 lt.eq C_t frac(1 + ell, 2^ell t) . $
  The constants are independent of the shell index and this series is summable.
    For each fixed system the original attraction and repulsion expectations are finite by the form bounds,
    so the shell decomposition is legitimate; alternatively one can first use finitely many shells and pass to the
    limit. Dropping the nonnegative out kinetic energy and out–out repulsion from (3.6), and using (12.9), now proves
  #[#set math.equation(numbering: n => "(12.10)")
   $ 0 lt.eq bb(E) \( e_X - E \) lt.eq C_t . $ <a:eq:tail-deletion-energy>]
  Every slice satisfies $e_X gt.eq E$, and on $G$ sector monotonicity gives $e_X gt.eq E_(n_c) gt.eq E_(Z - 1)$.
    Therefore
  $ c_t \( E_(Z - 1) - E \) lt.eq bb(P) \( G \) \( E_(Z - 1) - E \) lt.eq bb(E) \( e_X - E \) lt.eq C_t \, $
  which proves (12.7). This argument has used only the zero-offset ground state and the general-offset screening
    estimates; no neutral offset or ionization gap was assumed. ◻
]

By monotonicity, $E_Z lt.eq E_(Z - 1) lt.eq E + C$. We may consequently apply Proposition 46 again,
  now with this fixed value of $D_0$, to every normalized neutral ground state.
  There are universal $s_(*) > 0$ and $Z_1$ such that

#[#set math.equation(numbering: n => "(12.11)")
 $ integral_(\| x \| gt.eq s_(*)) rho_(Psi_Z) \( x \) thin thin upright(d) x > 1 /
   2 wide \( Z gt.eq Z_1 \) . $ <a:eq:tail-lower>]

In fact the deficit proposition gives a tail greater than one at an appropriate such radius.
  Absolute continuity of the density makes the choice between strict and non-strict radial endpoints immaterial.

== 13 A uniform positive ionization gap <a:sec:gap>

The energy bound of Section 12 makes a distant insertion trial effective in every singly ionized atom.
  Averaging the insertion center recovers its unit unscreened charge;
  a complementary localized state controls the attraction lost when a hole is made for the orbital.

#thm([Proposition 13.1.])[
  (Positive ionization energy).  #emph[There are universal constants $c > 0$ and $Z_2 < oo$ such that
#[#set math.equation(numbering: n => "(13.1)")
 $ E_(Z - 1) - E_Z gt.eq c wide \( Z gt.eq Z_2 \) . $ <a:eq:tail-gap>]

]
] <a:prop:tail-gap>

#proof[
  For $Z gt.eq max \( Z_0 \, 2 \)$, take a normalized ground state $Phi$ of $H_(Z - 1 \, Z)$.
    It exists by Lemma 8, and its offset from $E$ is bounded by Proposition 50.
    In this proof $S gt.eq 1$ will be a large universal constant, fixed at the end, and $b = S^(3 \/ 5)$.
    Angle brackets denote normalized Lebesgue averaging over the centers $cal(A)_S = { y : S lt.eq \| y \| lt.eq 2 S }$.
  Use the real normalized radial packet $g_b$ from Section 3.
    Choose smooth real functions $c_y \, o_y$ with $c_y^2 + o_y^2 = 1$, $c_y = 0$ on $B \( y \, 2 b \)$, $c_y =
    1$ outside $B \( y \, 3 b \)$, and
  $ \| nabla c_y \|^2 + \| nabla o_y \|^2 lt.eq C b^(- 2) upright(bold(1))_(B \( y \, 3 b \)) . $
  Set
  $ F_y = product_(i = 1)^(Z - 1) c_y \( x_i \) \, quad n_y^(upright("near")) = \# { i : \| x_i - y \| < 3 b } \,
    quad N_y = bb(E)_Phi n_y^(upright("near")) \, quad A_y = bb(E)_Phi F_y^2 . $
  The unnormalized core $F_y Phi$ has no particles in $B \( y \, 2 b \)$.
    Wedge this core with the normalized one-spin orbital $g_b \( dot.op - y \)$;
    the resulting unnormalized $Z$-electron vector has squared norm $A_y$.
    Spatial separation makes the terms assigning different particle labels to the two groups orthogonal.
    It also makes its energy equal to the core energy, plus the orbital energy times $A_y$,
    plus the direct cross repulsion. In particular, with the raw-configuration field
  $ H_y^(upright("add")) = integral g_b \( x - y \)^2 (V \( x \) - sum_(i = 1)^(Z - 1) K \( x - x_i \)) thin thin
    upright(d) x \, $
  the multiplier identity (2.4) and the variational principle give
  #[#set math.equation(numbering: n => "(13.2)")
   $ \( E_Z - E_(Z - 1) \) A_y & lt.eq 1 / 2 bb(E)_Phi \| nabla F_y \|^2 +
     frac(parallel nabla g parallel_2^2, 2 b^2) A_y - bb(E)_Phi \[ F_y^2 H_y^(upright("add")) \]\
 & lt.eq C b^(- 2) \( 1 + N_y \) - bb(E)_Phi \[ F_y^2 H_y^(upright("add")) \] . $ <a:eq:tail-insertion>]
  This inequality also holds if $A_y = 0$, since its derivation uses the unnormalized trial and its zero norm.
  For every raw configuration, averaging the full insertion field gives
  #[#set math.equation(numbering: n => "(13.3)")
   $ chevron.l H_y^(upright("add")) chevron.r gt.eq frac(1, 2 S) . $ <a:eq:tail-unit-charge>]
  To verify this without a symmetry assumption on $Phi$, fix the center radius $r in \[ S \, 2 S \]$.
    The nuclear packet average is $Z \/ r$ since $b < r$. For any fixed electron position $z$,
    the spherical average in $y$ of its packet potential is
  $ integral g_b \( v \)^2 frac(1, max \( r \, \| z - v \| \)) thin thin upright(d) v lt.eq 1 / r . $
  This follows by first averaging $K \( y + v - z \)$ over $\| y \| = r$ and then integrating $v$.
    There are $Z - 1$ electrons, so the averaged field is at least $1 \/ r gt.eq 1 \/ \( 2 S \)$.
    Radial averaging proves (13.3).
  The mean number of particles near a proposed center is small.
    For large $S$, $3 b < S \/ 2$, and a particle can lie in $B \( y \, 3 b \)$ for some $y in
    cal(A)_S$ only if $S \/ 2 lt.eq \| x_i \| lt.eq 3 S$. The fraction of such centers for any particle is at most
    $C b^3 \/ S^3$. Fubini and (4.45), with the bounded offset of $Phi$, yield
  #[#set math.equation(numbering: n => "(13.4)")
   $ chevron.l N_y chevron.r lt.eq C \( b \/ S \)^3 bb(E)_Phi \# { i : S \/ 2 lt.eq \| x_i \| lt.eq 3 S } lt.eq
     C \( b \/ S \)^3 \( 1 + sqrt(S) \) lt.eq C S^(- 7 \/ 10) . $ <a:eq:tail-insertion-overlap>]
  Writing $p_y = 1 - A_y = bb(E)_Phi \( 1 - F_y^2 \)$, the product inequality $1 - product_i c_y \( x_i \)^2 lt.eq
    sum_i \( 1 - c_y \( x_i \)^2 \)$ gives $p_y lt.eq N_y$.
  It remains to bound the potentially positive field lost on the discarded configurations.
    The symmetric multiplier $G_y = sqrt(1 - F_y^2)$ is Lipschitz, even where it vanishes, and
  #[#set math.equation(numbering: n => "(13.5)")
   $ \| nabla G_y \|^2 lt.eq C b^(- 2) n_y^(upright("near")) . $ <a:eq:tail-complement-gradient>]
  For a direct justification, take all products of $c_y$ and $o_y$ in the particle variables except the all-core
    product. Their Euclidean norm is $G_y$. The squared gradient of a norm is bounded by the sum of the squared
    gradients of its components; the full product partition has squared gradient sum
    $sum_i \( \| nabla c_y \|^2 + \| nabla o_y \|^2 \) \( x_i \)$. This proves (13.5) and the stated Lipschitz property.
  If $p_y > 0$, put $Phi_y^(upright("loss")) = G_y Phi \/ sqrt(p_y)$.
    This is a normalized antisymmetric form-domain vector. By (2.4), (12.7), and (13.5), its offset satisfies
  #[#set math.equation(numbering: n => "(13.6)")
   $ delta_y lt.eq C + C b^(- 2) N_y \/ p_y . $ <a:eq:tail-complement-offset>]
  Choose $S$ large enough also that $b < A S \/ L$. At each center $y$ in the annulus,
    the nucleus and every electron included in $J_y$ lie outside the radial packet.
    Their packet averages equal their point potentials at $y$.
    All omitted electron terms enter with a negative sign, whence $H_y^(upright("add")) lt.eq
    J_y$ pointwise in the configuration. Using (4.39) with no initial cut,
    now in the state $Phi_y^(upright("loss"))$, gives
  #[#set math.equation(numbering: n => "(13.7)")
   $ bb(E)_Phi \[ \( 1 - F_y^2 \) H_y^(upright("add")) \] & = p_y bb(E)_(Phi_y^(upright("loss"))) H_y^(upright("add"))\
 & lt.eq C p_y #scale(x: 120%, y: 120%)[\(] S^(- 1) + sqrt(delta_y) thin S^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq C [p_y \( S^(- 1) + S^(- 1 \/ 2) \) + b^(- 1) S^(- 1 \/ 2) sqrt(p_y N_y)] . $ <a:eq:tail-loss-bound>]
  Here we may assume $S \/ L gt.eq 1$; $L$ is fixed. If $p_y = 0$, the left side is zero and the same bound holds.
    All expectations in this calculation are finite for a fixed system by the form bounds (the packet potential is
    bounded as well).
  Since $p_y lt.eq N_y$, (13.4) implies
  $ ⟨bb(E)_Phi \[ \( 1 - F_y^2 \) H_y^(upright("add")) \]⟩ lt.eq
    C (S^(- 17 \/ 10) + S^(- 6 \/ 5) + S^(- 9 \/ 5)) = o \( S^(- 1) \) . $
  Also
  $ C b^(- 2) \( 1 + chevron.l N_y chevron.r \) lt.eq C \( S^(- 6 \/ 5) + S^(- 19 \/ 10) \) = o \( S^(- 1) \) . $
  These estimates explain the width choice: any $b = S^a$ with $1 \/ 2 < a < 2 \/
    3$ would make the kinetic term and the largest averaged field loss smaller than $S^(- 1)$.
    All these limits are uniform in $Z$ and in the ground state $Phi$.
    Average (13.2) and write $F_y^2 H_y^(upright("add")) = H_y^(upright("add")) - \( 1 - F_y^2 \)
    H_y^(upright("add"))$. Equations (13.3) and (13.7) then show, for one sufficiently large universal choice of $S$,
  $ \( E_Z - E_(Z - 1) \) chevron.l A_y chevron.r lt.eq - frac(1, 4 S) . $
  In particular $chevron.l A_y chevron.r > 0$. As it is at most one, dividing gives $E_(Z - 1) - E_Z gt.eq
    1 \/ \( 4 S \)$. This proves (13.1). ◻
]

#proof[
  In the notation $E_Z \( n \) = E \( n \, Z \)$ of the corollary, Proposition 50 gives universal $C_0 \,
    Z_0 < oo$ such that, for $Z gt.eq Z_0$,
  $ I_1 \( Z \) = E_Z \( Z - 1 \) - E_Z \( Z \) lt.eq E_Z \( Z - 1 \) - inf_(n gt.eq 0) E_Z \( n \) lt.eq C_0 . $
  The first inequality uses $inf_(n gt.eq 0) E_Z \( n \) lt.eq E_Z \( Z \)$.
    Proposition 51 gives universal $c_0 > 0$ and $Z_2 < oo$ such that $I_1 \( Z \) gt.eq c_0$ for $Z gt.eq Z_2$.
  Choose an integer $Z_(*) gt.eq max { 2 \, Z_0 \, Z_2 }$. For each integer $1 lt.eq Z < Z_(*)$,
    the finite-sector Coulomb forms are bounded below and admit finite-energy trial states,
    so $E_Z \( Z - 1 \)$ and $E_Z \( Z \)$ are finite; the vacuum energy is $E_Z \( 0 \) = 0$.
    Lemma 8, applied with $n = Z$, gives $I_1 \( Z \) > 0$. Thus all the finitely many remaining gaps lie in
    $\( 0 \, oo \)$. Set
  $ c = min { c_0 \, I_1 \( 1 \) \, dots.h \, I_1 \( Z_(*) - 1 \) } \, wide C = max { C_0 \, I_1 \( 1 \) \,
    dots.h \, I_1 \( Z_(*) - 1 \) } . $
  These constants satisfy $0 < c lt.eq C < oo$. They are universal because $Z_(*)$ is universal and the
    exceptional gaps belong to finitely many atoms in the fixed normalization.
    The large-$Z$ bounds and these choices prove the assertion for every integer $Z gt.eq 1$. ◻
]

== 14 The outer tail and the half-electron radius <a:sec:tail>

We now combine the positive ionization gap with a weighted shell estimate.
  The conditional field is estimated after changing the law by the shell mass itself;
  the measurability of this mass in the cut data is what avoids an additional particle-count factor.

#thm([Proposition 14.1.])[
  (Uniform exterior mass).  #emph[There exist universal $C \, R_0 \,
    Z_3 < oo$ such that every normalized neutral ground state with $Z gt.eq Z_3$ satisfies
#[#set math.equation(numbering: n => "(14.1)")
 $ integral_(\| x \| > R) rho_(Psi_Z) \( x \) thin thin upright(d) x lt.eq C /
   R wide \( R gt.eq R_0 \) . $ <a:eq:tail-mass>]

]
] <a:prop:tail-mass>

#proof[
  Fix any such ground state $Psi = Psi_Z$ and write $bb(E)$ for its raw configuration expectation.
    By Proposition 50 its offset is bounded by a universal constant,
    and by Proposition 51 its ionization gap is at least $c > 0$.
    For $u gt.eq 1$, choose a smooth radial cutoff $chi_u \( r \) = chi \( r \/ u \)$, where $0 lt.eq chi lt.eq
    1$, $chi = 1$ on $\[ 1 \, 2 \]$, and $chi$ is supported in $\[ 1 \/ 2 \, 4 \]$. Put
  $ w_i = chi_u \( \| x_i \| \)^2 \, wide S_u = sum_(i = 1)^Z w_i \, wide m_u = bb(E) S_u \,\
n_(upright("adj")) = \# { i : u \/ 2 lt.eq \| x_i \| lt.eq 4 u } \, wide N_u = bb(E) n_(upright("adj")) . $
  In particular $m_u lt.eq N_u$. Define
  $ cal(B)_u \( x \) = V \( x \) - sum_(\| x_j \| < u \/ 8) K \( x - x_j \) = B_(u \/ 8) \( x \) . $
  Only its values on the support of $chi_u$ will be used, so the selected electron never occurs among these inner
    sources.
  Testing the weak eigen-equation by $S_u Psi$, and decomposing the result into its $i$-th weighted terms,
    gives a useful lower bound. For fixed $x_i$ and spin, the other $Z - 1$ variables are antisymmetric;
    their energy is at least $E_(Z - 1)$ times their squared norm. The selected electron’s kinetic pairing is
  $ "Re" 1 / 2 integral nabla_i overline(Psi) dot.op nabla_i \( w_i Psi \) = 1 /
    2 integral w_i \| nabla_i Psi \|^2 - 1 / 4 integral \( Delta_i w_i \) \| Psi \|^2 gt.eq -
    C u^(- 2) bb(E) upright(bold(1))_({ u \/ 2 lt.eq \| x_i \| lt.eq 4 u }) . $
  The integration by parts follows first for smooth form approximants;
    $w_i$ and its first two derivatives are bounded, so it passes to the form domain.
    Keeping only the selected electron’s repulsion from inner sources,
    and discarding its other nonnegative pair terms, therefore gives
  #[#set math.equation(numbering: n => "(14.2)")
   $ c m_u lt.eq C u^(- 2) N_u + bb(E) sum_i w_i cal(B)_u \( x_i \) . $ <a:eq:tail-weighted>]
  Suppose first that $m_u > 0$. The normalized antisymmetric state
  $ Psi_u^(*) = sqrt(S_u \/ m_u) thin Psi $
  is form admissible. Indeed $sqrt(S_u)$ is the Euclidean norm of the vector $\( chi_u \( \| x_i \| \) \)_i$,
    hence is Lipschitz. Where $S_u > 0$,
  $ \| nabla sqrt(S_u) \|^2 = frac(sum_i chi_u \( \| x_i \| \)^2 \| nabla_i chi_u \( \| x_i \| \) \|^2, S_u) lt.eq
    C u^(- 2) \; $
  its gradient vanishes almost everywhere on its zero set. In particular this is bounded by $C u^(- 2)
    n_(upright("adj"))$. Identity (2.4) shows that its offset satisfies
  #[#set math.equation(numbering: n => "(14.3)")
   $ delta_u lt.eq C + C u^(- 2) N_u \/ m_u < oo . $ <a:eq:tail-biased-offset>]
  There is no assumed positive lower bound on $m_u$.
  We reveal every position carrying a positive shell weight so that $S_u$ is determined by the data.
    Use an auxiliary cut which is full out on $u \/ 2 lt.eq \| x \| lt.eq 4 u$,
    supported in $u \/ 4 < \| x \| < 8 u$, and has squared gradient cost at most $C u^(- 2)$.
    Let $omega$ denote the raw configuration, let $ell$ denote these cut labels, and let $Y =
    Y \( omega \, ell \)$ be all recorded out data. If $Q \( thin upright(d) ell divides omega \)$ is the
    conditional label kernel, use exactly this kernel for both states. Their joint laws are then
  #[#set math.equation(numbering: n => "(14.4)")
   $ P \( thin upright(d) omega \, thin upright(d) ell \) & = \| Psi \( omega \) \|^2 thin thin upright(d) omega
     thin Q \( thin upright(d) ell divides omega \) \,\
P^(*) \( thin upright(d) omega \, thin upright(d) ell \) & =
  frac(S_u \( omega \), m_u) thin P \( thin upright(d) omega \, thin upright(d) ell \) . $ <a:eq:tail-joint-bias>]
  Integration in $omega$ includes the spin sum. Every particle with positive $w_i$ is recorded by this cut, so
  $ S_u \( omega \) = s \( Y \) := sum_(i med upright("recorded")) chi_u \( \| x_i \| \)^2 . $
  This equality includes the random labels in the transition regions: particles there have weight zero.
    It follows from (14.4) that
  #[#set math.equation(numbering: n => "(14.5)")
   $ frac(thin upright(d) P_Y^(*), thin upright(d) P_Y) = frac(s \( Y \), m_u) \, wide
     bb(E)_(P^(*)) \[ F divides Y \] = bb(E)_P \[ F divides Y \] quad
     upright("on ") { s > 0 } $ <a:eq:tail-conditional-bias>]
  for every bounded measurable $F$, and then for integrable $F$ by truncation wherever the conditional
    expectations are defined. For example, multiply the asserted equality by $s \( Y \)$ and integrate over an
    arbitrary data event to check it directly. At the slice level the same fact says that $sqrt(S_u \/ m_u)$ is
    constant in the surviving core variables and cancels when their wavefunction is normalized.
    The set $s = 0$ has zero $P^(*)$-mass and contributes nothing to the original weighted sum.
  Let
  $ h_Y \( x \) = bb(E)_P \[ cal(B)_u \( x \) divides Y \] \, wide M \( Y \) =
    sup_(u \/ 2 lt.eq \| x \| lt.eq 4 u) \( h_Y \( x \) \)_(+) . $
  On the broad annulus $u \/ 4 < \| x \| < 6 u$ all the inner sources are separated from the evaluation point.
    Lemma 48 supplies continuous harmonic versions of these fields.
    Applying (14.5) first at a countable dense set of points and then using continuity makes the conditional
    fields for $P$ and $P^(*)$ equal on the entire broad annulus, outside one data-null set on ${ s > 0 }$.
    The two data laws are equivalent on that set. Thus the equality applies at recorded random positions as well
    as to the positive supremum.
  Use (12.5) in the state $Psi_u^(*)$. It gives
  #[#set math.equation(numbering: n => "(14.6)")
   $ parallel M parallel_(L^2 \( P^(*) \)) lt.eq C #scale(x: 120%, y: 120%)[\(] u^(- 1) +
     sqrt(delta_u) thin u^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <a:eq:tail-biased-field>]
  This is an application of the screening estimate for arbitrary finite offsets,
    not of its small-offset refinement. In particular the cut condition is uniform even if $m_u$ is very small:
    as checked in Lemma 48, its cell coefficients obey $D_z^2 \/ \( a_z m_z \) lt.eq C$ for every $delta_u$,
    because $a_z m_z gt.eq 1$.
  To see explicitly how the weighted count is used, introduce the data-measurable measure
  $ eta_Y = sum_(i med upright("recorded")) w_i delta_(x_i) \, wide eta_Y \( bb(R)^3 \) = s \( Y \) . $
  Conditional integration and (14.4) now yield
  #[#set math.equation(numbering: n => "(14.7)")
   $ bb(E) sum_i w_i cal(B)_u \( x_i \) & = bb(E)_P integral h_Y thin thin upright(d) eta_Y\
 & = m_u bb(E)_(P^(*)) [frac(1, s \( Y \)) integral h_Y thin thin upright(d) eta_Y]\
 & lt.eq m_u bb(E)_(P^(*)) M lt.eq C m_u #scale(x: 120%, y: 120%)[\(] u^(- 1) +
   sqrt(delta_u) thin u^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <a:eq:tail-weighted-field>]
  The quotient may be defined as zero on $s = 0$. This exact change of measure accounts for all shell weights,
    so there is no further particle-count factor in the last bound.
  Substituting (14.3) into (14.7), and then into (14.2), gives
  $ c m_u & lt.eq C u^(- 2) N_u + C m_u \( u^(- 1) + u^(- 1 \/ 2) \) + C u^(- 3 \/ 2) sqrt(m_u N_u)\
 & lt.eq C \( u^(- 2) + u^(- 3 \/ 2) \) N_u + C m_u \( u^(- 1) + u^(- 1 \/ 2) \) . $
  The second line uses $m_u lt.eq N_u$. When $m_u = 0$ it holds trivially without introducing a biased law.
    For all sufficiently large $u$, absorb the last term into the left side.
    Applying (4.45) in the original state, whose offset is uniformly bounded, gives $N_u lt.eq
    C \( 1 + sqrt(u) \)$ and hence
  #[#set math.equation(numbering: n => "(14.8)")
   $ bb(E) \# { i : u lt.eq \| x_i \| lt.eq 2 u } lt.eq m_u lt.eq C \/ u . $ <a:eq:tail-shell-mass>]
  Finally, sum over $u = 2^j R$, $j gt.eq 0$. The density gives zero mass to the intervening spheres,
    and $sum_(j gt.eq 0) \( 2^j R \)^(- 1) = 2 \/ R$. This proves (14.1). ◻
]

#proof[
  #emph[Completion of the proof of Theorem 2.] For all sufficiently large $Z$,
    (12.11) supplies a fixed $s_(*) > 0$ for which the exterior mass exceeds $1 \/ 2$.
    Monotonicity of that mass as a function of the radius implies $R \( Psi_Z \) gt.eq s_(*)$.
    Proposition 52 supplies a fixed large $R_(*)$ for which the exterior mass is at most $1 \/ 2$,
    and hence $R \( Psi_Z \) lt.eq R_(*)$.
  For clarity we give uniform arguments over the entire ground-state space for each of the finitely many remaining
    charges. Fix such a $Z$. The strict gap $E_Z < E_(Z - 1)$ and the compactness conclusion in Lemma 8 show that
    every sequence of normalized neutral ground states has a strongly $L^2$ convergent subsequence.
    In particular their configuration laws are uniformly tight.
    To see directly why compactness gives the required uniform tail,
    suppose otherwise and choose radii $R_k arrow.r oo$ and normalized ground states $Psi_k$ with
  $ integral_(\| x \| > R_k) rho_(Psi_k) \( x \) thin thin upright(d) x > 1 / 2 . $
  After a subsequence $Psi_k arrow.r Psi$ strongly in $L^2$.
    The bounded multiplication operator $sum_i upright(bold(1))_({ \| x_i \| > R_k })$ has norm at most $Z$,
    so its expectations in $Psi_k$ and $Psi$ differ by at most $2 Z parallel Psi_k - Psi parallel_2$.
    Its expectation in the fixed $Psi$ tends to zero by dominated convergence, a contradiction.
    Thus a finite upper radius works uniformly for this $Z$.
  For the lower bound, the kinetic estimate (3.3), with the fixed finite offset $E_Z - E$, gives
  $ integral rho_(Psi_Z)^(5 \/ 3) lt.eq C_Z $
  uniformly over its normalized ground states. Hölder’s inequality therefore yields
  $ integral_(\| x \| < r) rho_(Psi_Z) \( x \) thin thin upright(d) x lt.eq \| B \( 0 \, r \) \|^(2 \/ 5)
    (integral rho_(Psi_Z)^(5 \/ 3))^(3 \/ 5) lt.eq C_Z r^(6 \/ 5) . $
  Choose a positive $r_Z$ making this less than $Z - 1 \/ 2$.
    The exterior mass then exceeds $1 \/ 2$, uniformly over the ground states, so $R \( Psi_Z \) gt.eq r_Z$.
  Taking the minimum of $s_(*)$ and these finitely many positive lower radii,
    and the maximum of $R_(*)$ and the finitely many upper radii, gives universal $0 < c lt.eq C < oo$.
    All density measures used above are absolutely continuous.
    Their exterior masses are consequently continuous in the radius, start at $Z$, and tend to zero.
    Thus the infimum defining the half-electron radius has the stated bounds for every normalized neutral ground
    state, as required. ◻
]

== 15 Interfaces for atomic asymptotics <sec:interfaces>

The estimates used in questions about ionization energies and outer radii have different offset requirements.
  We collect their precise scope here; the complete proofs are in the preceding sections.

===== 15.1 Arbitrary energy offsets. <arbitrary-energy-offsets.>

For a finite-sector state of energy at most $E + delta$, the exact cut identity, coherent insertion,
  and fine-density lower bounds are Lemmas 13, 14, and 15. In atomic distance geometry,
  Proposition 20 and Corollary 24 allow every finite $delta gt.eq 0$;
  their count unit is $max \( a^(- 3) \, 1 \) + sqrt(delta a)$.
  For sectors $n lt.eq 3 Z$, Lemma 48 keeps this dependence in its complete convergent series for conditional
  inner fields. The fine comparison Lemma 4.6 has the additional restriction $delta lt.eq a^(- 7 + .02)$.
  These are distinct assertions.

===== 15.2 Events of a sector ground state. <events-of-a-sector-ground-state.>

For a ground state of energy $E_n$, Lemma 26 bounds the cost above $E_n$ by $C ell_j^(- 2) log^5 \( e \/ p \)$,
  independent of the number of particles or arrays. The offset above $E$ is therefore $E_n - E +
  C ell_j^(- 2) log^5 \( e \/ p \)$. This exact baseline dependence is available when the offset grows.
  The fixed-offset comparison Proposition 45, by contrast, first fixes a finite $D_0 gt.eq E_n - E$,
  then takes $s$ sufficiently small according to $D_0$ and the stated band and accuracy parameters.
  It is not a uniform comparison at arbitrary growing $D_0$.

===== 15.3 Common observations and intermediate fields. <common-observations-and-intermediate-fields.>

The master-kernel formula and its universal constants in (10.2) do not depend on the inverse-comparison heights or
  accuracy. To use several comparisons with the same conditional density and field,
  choose $s$ to satisfy all their corresponding smallness conditions in Proposition 45,
  then fix the resulting packet widths and observation arrays.
  This applies to any collection admitting such a common $s$; for finitely many fixed requests,
  the minimum of their thresholds suffices. Proposition 47 uses exactly these packets at every intermediate index;
  its error bound (11.3) is in expectation before the last array is forgotten.
  Its differential inequality holds globally after cancellation of the nuclear singularity,
  its lower barrier persists at every index, and its exterior equality holds beyond $L_1 r_j$.
  The construction may be stopped at any prefix without changing the master smoothing.

===== 15.4 Classical comparison and the neutral offset. <classical-comparison-and-the-neutral-offset.>

The Thomas–Fermi minimizer and point-source comparison required for coefficient identification are Lemmas 31 and
  32, valid for every positive real point charge. The quantum offset needed for neutral states is Proposition 50.
  It follows from zero-offset deletion and is uniform over all neutral ground states by sector monotonicity.
  These are independent inputs: the excess-charge conclusion itself does not replace either the Thomas–Fermi
  estimates or the neutral-sector argument.

#bibliography("refs.bib", style: "ieee", title: [References])
