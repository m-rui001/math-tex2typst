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

#align(center)[#text(size: 16pt, weight: "bold")[A Coulomb ground-state density without \
Kohn--Sham ensemble representation]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The density-functional variational viewpoint originates in the work of Hohenberg and Kohn [9].
  Uniqueness of a density–potential mapping and existence of a representing potential are separate questions;
  see the review [15] for their precise distinctions. Kohn–Sham density functional theory seeks to reproduce the
  density of an interacting electronic ground state by noninteracting electrons in a common local potential [11].
  The constrained-search formulations of Levy and Lieb distinguish the existence of states with a prescribed
  density from the existence of a potential for which those states minimize the energy [13,14].
  Allowing ensembles enlarges the latter class: several degenerate noninteracting ground states may be mixed to
  obtain a density that is unavailable from one determinant.
  Ullrich and Kohn make this distinction explicit in their treatment of singlet ground-state ensembles [20].
  Thus a failure of a particular orbital ansatz does not settle the ensemble representability question.

We consider the usual three-dimensional potential space

$ cal(V) = L^(3 \/ 2) \( upright(bold(R))^3 \; upright(bold(R)) \) +
  L^oo \( upright(bold(R))^3 \; upright(bold(R)) \) . $

For $v in cal(V)$, the noninteracting Hamiltonian

$ H_s \( v \) = sum_(i = 1)^3 (- 1 / 2 Delta_i + v \( r_i \)) $

acts on the antisymmetric space $and.big^3 L^2 \( upright(bold(R))^3 \; upright(bold(C))^2 \)$,
  with the same scalar potential for both spin components. Its realization is determined by its semibounded closed
  quadratic form. A ground-state ensemble is a positive trace-class operator $Gamma$ of trace one whose range is
  contained in the eigenspace at $inf sigma \( H_s \( v \) \)$.
  We denote its spin-summed one-body density by $n_Gamma$; it has integral three.

#thm([Theorem 1.1.])[
  #emph[Set $D = 10^200$ and $e_z = \( 0 \, 0 \, 1 \)$. There is a finite positive integer $Z$,
    specified by (7.10), for which the Coulomb Hamiltonian
$ H_C =
  sum_(i = 1)^3
  (- 1 / 2 Delta_i - frac(Z, \| r_i - \( D \/ Z \) e_z \|) - frac(Z, \| r_i + \( D \/ Z \) e_z \|)) +
  sum_(1 lt.eq i < j lt.eq 3) frac(1, \| r_i - r_j \|) $

 has a normalizable absolute ground state $Psi$ in the sector $S_z = 1 \/ 2$,
   normalized by $parallel Psi parallel_2 = 1$, but there is no $v in
   cal(V)$ and no ground-state ensemble $Gamma$ of $H_s \( v \)$ such that
$ n_Gamma = n_Psi wide upright("almost everywhere on ") upright(bold(R))^3 . $

]
] <thm:main>

The two nuclei have positive integer charges and distinct finite positions.
  The theorem concerns a fixed finite system. The exact specification of $Z$ uses only spectral data, densities,
  and an angle minimization for a two-centre auxiliary problem;
  it does not test representability by other potentials. It is a nonnumerical specification,
  and no effective numerical bound for the charge is asserted.

1 shows that a density of a finite interacting Coulomb ground state can fail to have a noninteracting ground-state
  ensemble representation in $cal(V)$. No restriction is placed on the degeneracy of a putative representing
  ground space or on the complex spinful states in its ensemble.
  The result makes no assertion about larger classes of distributional potentials, spin-dependent potentials,
  or nonlocal one-particle operators.

The same density also obstructs a local-potential first variation of the ensemble Hartree–exchange–correlation
  functional. More precisely, Corollary 29 excludes a potential in $cal(V)$ representing its one-sided variation
  along every segment in the common finite-energy density domain.

=== 1.1 Relation to earlier work <relation-to-earlier-work>

Explicit prescribed densities can already fail noninteracting $v$-representability in $cal(V)$.
  Wagner and collaborators discuss a positive two-electron density with finite kinetic energy whose interior cusp
  forces its inverse potential outside this class [21] Section IV.G, Eq. (36).
  Their example is specified directly, without a construction as a finite Coulomb ground-state density.

Trushin, Erhard, and Görling report numerical indications of failures of ground-state noninteracting
  representability from atomic density inversions [19]. Open-shell inversion and symmetry restrictions are further
  investigated in [4]. The result here is an analytic exclusion for every ground-state ensemble of a specified
  finite Coulomb system, in the potential class $cal(V)$.

Existence results for other settings must be distinguished from this question.
  The theorem of Chayes, Chayes, and Ruskai concerns quantum lattice systems with a fixed bounded
  kinetic-plus-interaction operator [2]. Corso proves a rigorous Kohn–Sham formulation for spinless fermions on a
  bounded one-dimensional interval with generalized Neumann boundary conditions,
  allowing distributional potentials [3]. On a one-dimensional torus,
  Sutter and collaborators prove ensemble representability of strictly positive $H^1$ densities of prescribed
  particle number for spinful electrons, again allowing distributional potentials [18].
  These results do not supply a representability theorem for three-dimensional Coulomb densities in $cal(V)$.

The asymptotic mechanism behind our construction was investigated by Gori-Giorgi, Gál, and Baerends [8].
  When the leading removal amplitude has a nodal plane, coupling to other ionic channels can give the density the
  same exponential decay rate on and off that plane, with an additional polynomial suppression on the plane.
  Their analysis identifies the role of the angular part of the Laplacian and the resulting difficulties for a
  regular Kohn–Sham potential. Gori-Giorgi and Baerends subsequently studied the effective equation for the square
  root of the density and exact harmonically confined examples [7].
  That effective equation is distinct from the common local potential determined below by two orbitals and an
  ensemble kinetic certificate. Here we prove the necessary estimates for a finite Coulomb system,
  and supply two further ingredients: a certificate valid against all ground-state ensembles and an obstruction to
  the entire sum space $cal(V)$.

=== 1.2 The mechanism and the proof <the-mechanism-and-the-proof>

Scale length by $1 \/ Z$. The nuclear charges become one, the half-separation becomes $D$,
  and the electron repulsion has coefficient $lambda = 1 \/ Z$.
  The two lowest one-particle orbitals are a positive even orbital $b$ and an odd orbital $e$,
  positive above the median plane. Their splitting can be made arbitrarily small by increasing $D$.
  At zero coupling, the three-electron ground determinant occupies $b arrow.t \, b arrow.b \, e arrow.t$;
  its simple continuation in $S_z = 1 \/ 2$ is the interacting state used below.
  Let $n$ denote the spin-summed density of this scaled interacting state.

Write $E_3 \, E_2$ for the three-electron and ionic ground energies, and put

$ k = sqrt(2 \( E_2 - E_3 \)) \, wide A \( r \) = e^(- k r) r^beta \, wide beta = frac(2 - 2 lambda, k) - 1 . $

The direct removal amplitude has a simple odd angular zero.
  In the complementary ionic space, the first nonzero planar term has amplitude of order $lambda A \( r \)
  r^(- 4)$. The full channel calculation proves that this coefficient is nonzero and controls the remainder
  uniformly through the region where it competes with the fast core term.
  Figure 1 locates the plane and the translated windows used to compare these asymptotics with an orbital equation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1, -0.08), (10, 0.08), fill: rgb("#f5f5f5"), stroke: none)
  line((-1, 0), (10, 0), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  line((0, -1.9), (0, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((0, 2.1), [#text(size: 9pt)[$z$]], anchor: "south", padding: 0.1176cm)
  circle((0, 1.25), radius: 0.07056, fill: black, stroke: none)
  content((-0.2469, 1.25), [#text(size: 9pt)[$+"De"_z$]], anchor: "east", padding: 0.1176cm)
  circle((0, -1.25), radius: 0.07056, fill: black, stroke: none)
  content((-0.2469, -1.25), [#text(size: 9pt)[$-"De"_z$]], anchor: "east", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-west", padding: 0.1176cm)
  content((3.3, -0.12), [#text(size: 9pt)[median plane]], anchor: "north", padding: 0.1176cm)
  line((1.1, 0.5), (5.2, 0.5), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.15, 0.5), [#text(size: 9pt)[$p arrow.r.long infinity$]], anchor: "south", padding: 0.1176cm)
  rect((6.3, -1.35), (9.3, 1.35), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((7.1, 0), radius: 0.05997, fill: black, stroke: none)
  content((7.1, -0.1764), [#text(size: 9pt)[$p omega$]], anchor: "north", padding: 0.1176cm)
  line((7.1, 0), (8.55, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((8.55, 0), [#text(size: 9pt)[$omega$]], anchor: "west", padding: 0.1176cm)
  line((7.1, 0), (7.1, 0.9), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((7.1, 0.9), [#text(size: 9pt)[$z$]], anchor: "south", padding: 0.1176cm)
  content((7.8, 1.43), [#text(size: 9pt)[translated window]], anchor: "south", padding: 0.1176cm)
  content((7.8, -1.45), [#text(size: 9pt)[$sqrt(n(p,0)) "gtrsim" lambda A(p)p^(-4)$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: A meridional section of the scaled molecule, drawn schematically and not to scale. The nuclei lie at $plus.minus D e_z$; the horizontal line is the median plane $z = 0$. A bounded window is translated to a distant point $p omega$ in that plane. After normalization by $\( A \( p \) \/ p \)^2$, the limiting density in the window vanishes quadratically on the plane, although the actual density there has a smaller nonzero tail. This distinction drives the limiting-orbital and trace arguments. ],
) <fig:median-plane>

Trigonometric parametrizations also underlie constrained kinetic-energy formulations for paired real orbitals [12]
  Section 3.3. For the Coulomb density $n$, we minimize

$ integral_(upright(bold(R))^3) n \| nabla theta \|^2 \, wide integral_(upright(bold(R))^3) n sin^2 theta = 1 \, $

over odd angles, folded into $\[ 0 \, pi \/ 2 \]$ on the upper half-space. The orbitals

$ g = sqrt(n) cos theta \, wide h = sqrt(n) sin theta $

have squared norms two and one, respectively. They obey common formal-potential equations with energies zero and
  $d > 0$. A weighted spectral estimate proves that the paired/single determinant is a kinetic-energy minimum
  among #emph[all] ensembles with density $n$. Consequently, any representing local potential must agree,
  up to a constant, with $V = Delta g \/ \( 2 g \)$.

If $V in cal(V)$, translations of the orbital equations force every bounded limiting potential to equal $d +
  k^2 \/ 2$. This yields an exterior form bound and hence

$ e^(a r) g in H^1 \( upright(bold(R))^3 \) quad upright("for some ") a > k . $

The plane trace would then have the same exponential integrability.
  But $theta = 0$ on the plane, so $g = sqrt(n)$ there, and the nonzero $lambda A \( r \)
  r^(- 4)$ tail makes that trace integral diverge. This is the contradiction.

Several arguments have uses beyond this example. Keeping the unperturbed fast channel controls the crossover
  without tracking every perturbed excited threshold. Spin orthogonality prevents cancellation and makes the
  relevant relative constants independent of the small level splitting.
  The angle construction gives an ensemble kinetic certificate from a weighted Poincaré inequality,
  even before the formal potential is known to belong to a standard potential class.
  Finally, translated weak potential limits, local form compactness,
  and an $H^1$ trace convert a plane asymptotic into an obstruction to $L^(3 \/ 2) + L^oo$,
  without assuming pointwise convergence of the potential at infinity.
  We give the estimates and their hypotheses explicitly.

=== 1.3 Organization and conventions <organization-and-conventions>

2 establishes the Coulomb spectral and perturbative facts.
  3 proves the uniform density asymptotics and their fixed-parameter counterpart.
  4 constructs the angle and proves the weighted gap. 5 establishes the full ensemble certificate and identifies a
  hypothetical representing potential. 6 proves the fixed-density obstruction (23) and the qualitative Coulomb
  family (24). 7 uses finite sufficient tests to select $Z$ and complete 1.
  8 derives the functional consequence for the physical density.

All inner products are linear in the second variable. Norms of ionic channel vectors are Hilbert-space norms.
  Spatial reflection means reflection in the median plane; a simultaneous reflection is applied to all electron
  coordinates when discussing a many-electron state. Limits uniform for small coupling always keep $D$ fixed
  first. Later fixed-parameter limits keep the selected positive coupling fixed.

== 2 The Coulomb system and its small-coupling limit <sec:setup>

Let

$ frak(h) = L^2 \( upright(bold(R))^3 \; upright(bold(C))^2 \) \, wide frak(H)_m = and.big^m frak(h) $

be the one-electron and antisymmetric $m$-electron spaces.
  Spin is expressed in the basis $arrow.t \, arrow.b$, and spatial reflections and rotations act trivially on
  spin. For $D > 0$, put

#[#set math.equation(numbering: n => "(2.1)")
 $ u_D \( x \) = - frac(1, \| x - D e_z \|) - frac(1, \| x + D e_z \|) \, wide h_D = - 1 / 2 Delta + u_D \, wide
   e_z = \( 0 \, 0 \, 1 \) . $ <eq:unit-charge-potential>]

The corresponding $m$-electron operators are

#[#set math.equation(numbering: n => "(2.2)")
 $ H_(m \, lambda) = sum_(i = 1)^m h_D \( x_i \) + lambda sum_(1 lt.eq i < j lt.eq m) frac(1, \| x_i - x_j \|) \,
   wide m = 2 \, 3 \, quad lambda gt.eq 0 . $ <eq:scaled-coulomb-hamiltonian>]

They act in $frak(H)_m$. Hardy’s inequality in a particle coordinate, or in a relative coordinate, gives

$ parallel \| x_i - R \|^(- 1) psi #scale(x: 120%, y: 120%)[parallel]_2 + parallel \| x_i -
  x_j \|^(- 1) psi #scale(x: 120%, y: 120%)[parallel]_2 lt.eq C parallel nabla psi parallel_2 lt.eq
  epsilon parallel Delta psi parallel_2 + C_epsilon parallel psi parallel_2 . $

Thus these operators are self-adjoint on the antisymmetric part of
  $H^2 \( upright(bold(R))^(3 m) \; upright(bold(C))^(2^m) \)$,
  and their form domain is the corresponding $H^1$ space. The same estimates show that $lambda mapsto
  H_(m \, lambda)$ is an analytic family with this common operator domain.
  We write $E_m \( lambda \)$ for its ground energy whenever the ground level under consideration exists.

For a normalized three-electron state, its spin-summed density is

#[#set math.equation(numbering: n => "(2.3)")
 $ n_Psi \( x \) = 3 sum_(sigma_1 \, sigma_2 \, sigma_3) integral_(upright(bold(R))^6) \|
   Psi \( x \, sigma_1 \, y_1 \, sigma_2 \, y_2 \, sigma_3 \) \|^2 thin d y_1 thin d y_2 . $ <eq:density-definition>]

In particular, $integral n_Psi = 3$. Ensemble densities are defined by linearity, as detailed in 5.

#thm([Proposition 2.1.])[
  (Dilation to integer nuclear charges).  #emph[Suppose that the density of a ground state of $H_(3 \, 1 \/ Z)$,
    for a positive integer $Z$, has no noninteracting ground-state ensemble representation with a real
    spin-independent potential in $L^(3 \/ 2) \( upright(bold(R))^3 \) + L^oo \( upright(bold(R))^3 \)$.
    The physical Coulomb system with three electrons and charges $Z \, Z$ at
$ \( 0 \, 0 \, D \/ Z \) \, wide \( 0 \, 0 \, - D \/ Z \) $

 then has a ground-state density with the same obstruction.]
] <prop:scaling>

#proof[
  Use physical coordinates $upright(bold(r))_i$ and set $x_i = Z upright(bold(r))_i$. The unitary dilation
  $ \( cal(U)_Z psi \) \( x_1 \, dots.h \, x_m \) = Z^(- 3 m \/ 2) psi \( x_1 \/ Z \, dots.h \, x_m \/ Z \) $
  leaves spin unchanged. It transforms the physical Coulomb Hamiltonian into $Z^2 H_(m \, 1 \/ Z)$.
    In particular, normalizability, the ground-space property, and antisymmetry are preserved, and
  $ n_(upright("phys")) \( upright(bold(r)) \) = Z^3 n_(upright("scaled")) \( Z upright(bold(r)) \) . $
  A physical noninteracting representing potential would transform into
  $ tilde(v) \( x \) = Z^(- 2) v \( x \/ Z \) . $
  For a decomposition $v = v_1 + v_oo$, with $v_1 in L^(3 \/ 2)$ and $v_oo in L^oo$, the corresponding pieces satisfy
  $ parallel Z^(- 2) v_1 \( thin dot.op thin \/ Z \) parallel_(3 \/ 2) = parallel v_1 parallel_(3 \/ 2) \, wide
    parallel Z^(- 2) v_oo \( thin dot.op thin \/ Z \) parallel_oo = Z^(- 2) parallel v_oo parallel_oo . $
  The dilation of the representing density matrix preserves its trace and support in the ground eigenspace.
    It would therefore give the excluded representation of the scaled density. ◻
]

=== 2.1 The two lowest spatial orbitals <the-two-lowest-spatial-orbitals>

All subsequent one-particle orbitals are spatial orbitals. For fixed $D$ we abbreviate $u_D$ to $u$.
  Reflection symmetry will mean reflection in $z = 0$, with $x = \( x_1 \, x_2 \, z \)$.

#thm([Proposition 2.2.])[
  (Two-centre spectrum).  #emph[For $D gt.eq 100$, the two lowest eigenvalues of $h_D$ are simple.
    They have normalized real, axisymmetric eigenfunctions $b \, e$,
    where $b > 0$ is even and $e$ is odd and strictly positive on $z > 0$. Write
$ epsilon.alt_b = - gamma^2 / 2 \, wide epsilon.alt_e = - k_0^2 / 2 \, wide d_(*) = epsilon.alt_e - epsilon.alt_b . $

 Then
#[#set math.equation(numbering: n => "(2.4)")
 $ 0 < d_(*) < 100 / D \, wide \| gamma - 1 \| + \| k_0 - 1 \| < 200 / D . $ <eq:two-centre-numerics>]

 The spectrum on ${ b \, e }^perp$ lies more than $0.2$ above $epsilon.alt_e$.
   In particular, the spectral gap above $b$ in the even subspace is greater than $0.2$.]
] <prop:two-centre-spectrum>

#proof[
  Let $phi \( x \) = pi^(- 1 \/ 2) e^(- \| x \|)$ be the hydrogenic ground state.
    We recall the two hydrogenic bounds needed for localization.
    After spherical-harmonic decomposition, the radial operators and first-order factors are
  $ H_ell = - 1 / 2 frac(d^2, d rho^2) + frac(ell \( ell + 1 \), 2 rho^2) - 1 / rho \, wide A_ell =
    frac(d, d rho) - frac(ell + 1, rho) + frac(1, ell + 1) . $
  Here $H_ell$ has its Friedrichs realization in $L^2 \( \( 0 \, oo \) \, d rho \)$,
    and $A_ell$ is closed from $C_c^oo \( 0 \, oo \)$. On the corresponding Friedrichs form domains,
    integration by parts gives
  $ 1 / 2 A_ell^(*) A_ell = H_ell + frac(1, 2 \( ell + 1 \)^2) \, wide 1 / 2 A_ell A_ell^(*) = H_(ell + 1) +
    frac(1, 2 \( ell + 1 \)^2) . $
  The first identity and centrifugal comparison give $H_ell gt.eq - 1 \/ 8$ for $ell gt.eq 1$.
    Also $ker A_0 = "span" { rho e^(- rho) }$, and the second identity gives $A_0 A_0^(*) gt.eq 3 \/ 4$.
    The polar decomposition transfers this last bound to $A_0^(*) A_0$ on $\( ker A_0 \)^perp$.
    Thus the hydrogenic operator has ground energy $- 1 \/ 2$ and is bounded below by $- 1 \/ 8$ on $phi^perp$;
    the radial $ell = 1$ function $rho^2 e^(- rho \/ 2)$ attains $- 1 \/ 8$.
  Choose a Lipschitz angle $tau \( rho \)$ that is zero for $rho lt.eq D \/ 4$, is $pi \/ 2$ for $rho gt.eq
    D \/ 2$, and is linear between these radii. Its slope is $2 pi \/ D$.
    Around the two nuclei use cutoffs $chi_plus.minus \( x \) = cos tau \( \| x minus.plus D e_z \| \)$,
    set equal to zero outside their respective balls of radius $D \/ 2$,
    and complete them by the nonnegative cutoff $chi_(upright("out"))$ to a quadratic partition:
  $ chi_(+)^2 + chi_(-)^2 + chi_(upright("out"))^2 = 1 . $
  The two balls are disjoint. On either transition annulus the nonconstant pair is a cosine and a sine, so
  #[#set math.equation(numbering: n => "(2.5)")
   $ 1 / 2 sum_(nu in { + \, - \, upright("out") }) \| nabla chi_nu \|^2 lt.eq frac(2 pi^2, D^2) < 20 /
     D^2 . $ <eq:two-centre-ims-cost>]
  Lipschitz cutoffs suffice for the form identity; alternatively one may smooth the ramp with arbitrarily small
    increases in these constants.
  On either inner ball, the attraction of the other nucleus has magnitude at most $2 \/ \( 3 D \) < 1 \/ D$.
    On the support of $chi_(upright("out"))$, both nuclear distances are at least $D \/ 4$;
    there the total attraction is at most $8 \/ D$. Applying the IMS identity and the hydrogenic ground-energy
    bound gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ h_D gt.eq - 1 / 2 - 1 / D - 20 / D^2 quad upright("as a quadratic form") . $ <eq:two-centre-bottom-lower>]
  Here and below the exterior lower bound $- 8 \/ D$ is larger than the displayed inner lower bound for $D gt.eq 100$.
  If a test function $psi$ is orthogonal to both $chi_plus.minus phi \( thin dot.op thin minus.plus D e_z \)$,
    then $chi_plus.minus psi$ is orthogonal to the ground state of the corresponding hydrogenic operator.
    The next hydrogenic energy is $- 1 \/ 8$. Consequently,
  #[#set math.equation(numbering: n => "(2.7)")
   $ chevron.l psi \, h_D psi chevron.r gt.eq (- 1 / 8 - 1 / D - 20 / D^2) parallel psi parallel_2^2
     $ <eq:two-centre-third-lower>]
  on a subspace of codimension two.
  For the upper bound, use the two disjointly supported trial functions $chi_plus.minus
    phi \( thin dot.op thin minus.plus D e_z \)$. Their squared norms exceed $1 \/ 2$,
    since the hydrogenic mass outside radius $D \/ 4$ is
  $ e^(- D \/ 2) (1 + D / 2 + D^2 / 8) < 1 / 2 . $
  The ground-state identity for the hydrogenic operator and the bound $\| nabla chi_plus.minus \| lt.eq
    2 pi \/ D$ show that their Rayleigh quotients for $h_D$ are at most
  #[#set math.equation(numbering: n => "(2.8)")
   $ - 1 / 2 + frac(4 pi^2, D^2) < - 1 / 2 + 40 / D^2 . $ <eq:two-centre-two-upper>]
  Their even and odd combinations give the same bound in the two parity subspaces.
    The Coulomb potential is relatively compact with respect to the free resolvent:
    one first truncates at infinity and near the nuclei, and uses local compactness for the bounded remainder.
    The omitted nuclear piece has operator norm from $H^2$ to $L^2$ of order $sqrt(epsilon)$ when cut off to a
    ball of radius $epsilon$, by $H^2 arrow.r.hook L^oo$ and $parallel \| x \|^(- 1)
    upright(bold(1))_(\| x \| < epsilon) parallel_2 = O \( sqrt(epsilon) \)$.
    The far-field remainder tends to zero in $L^oo$. Hence the essential spectrum is $\[ 0 \, oo \)$.
    The min–max principle now gives two negative levels, one in each parity,
    and no third level below the lower bound in (2.7).
  A full-space ground state can be chosen nonnegative by the absolute-value inequality for its kinetic energy.
    It is strictly positive, including at the nuclei. One direct way to include those points is to use
  $ b = (- 1 / 2 Delta + c)^(- 1) \( c + epsilon.alt_b - u \) b \, wide c > \| epsilon.alt_b \| \, $
  whose resolvent kernel is strictly positive; the right-hand side is nonnegative and nonzero,
    and $b in H^2 \( upright(bold(R))^3 \)$ is continuous. The same argument with the Dirichlet resolvent on $z >
    0$ gives strict positivity of its ground state in that half-space.
    Positivity and the usual ground-state simplicity argument identify the low even level with $b$ and the low odd
    level with the odd extension of that Dirichlet ground state.
    Simplicity also follows from the two-level count above. The full-space ground state cannot be odd,
    so $epsilon.alt_b < epsilon.alt_e$. Rotation about the $z$-axis preserves the unique normalized positive
    full-space and half-space ground states, proving axial symmetry.
  Combining (2.6), (2.8) gives
  $ d_(*) lt.eq 1 / D + 60 / D^2 < 100 / D . $
  The same two bounds place $gamma$ and $k_0$ within $200 \/ D$ of $1$, with the stated bound on their sum.
    Finally, (2.7), (2.8) give the gap estimate
  $ 3 / 8 - 1 / D - 60 / D^2 > 0.2 . $
  Since $e$ is odd, the same lower bound holds above $b$ in the even subspace. ◻
]

=== 2.2 Ground states and perturbation <ground-states-and-perturbation>

#thm([Proposition 2.3.])[
  (Small repulsive coupling).  #emph[Fix $D gt.eq 100$. For all sufficiently small $lambda gt.eq 0$,
    the ionic operator $H_(2 \, lambda)$ has a simple isolated ground state,
    and $H_(3 \, lambda)$ has a simple isolated ground state $Psi_lambda$ in the sector $S_z = 1 \/ 2$.
    Its energy is an absolute ground energy of $H_(3 \, lambda)$.]
  #emph[The ionic ground state is a spin singlet, is even under simultaneous reflection of its two spatial
    coordinates, and is axisymmetric. The state $Psi_lambda$ is real, axisymmetric,
    and odd under simultaneous reflection of its three spatial coordinates.
    The states and energies can be chosen analytic near zero; in particular,
    their state vectors converge with error $O \( lambda \)$ in $H^2$. At zero coupling,
#[#set math.equation(numbering: n => "(2.9)")
 $ Psi_0 = b arrow.t and b arrow.b and e arrow.t \, wide E_2 \( 0 \) = 2 epsilon.alt_b \, wide E_3 \( 0 \) =
   2 epsilon.alt_b + epsilon.alt_e . $ <eq:zero-coupling-states>]

 The ionic state has spatial factor $b \( x_1 \) b \( x_2 \)$ and the normalized singlet spin factor.]
] <prop:small-coupling>

#proof[
  At $lambda = 0$, the Pauli principle fills the spin orbitals in (2.9).
    In the sector $S_z = 1 \/ 2$, moving the doubly occupied spatial orbital from $b$ to $e$ costs $d_(*) > 0$;
    using any further spatial orbital costs a positive gap by 3.
    The displayed determinant is therefore a simple isolated ground state in that sector.
    The ionic ground state is likewise simple and isolated. The noninteracting ionization thresholds are $2
    epsilon.alt_b$ and $epsilon.alt_b$, respectively, and are strictly above these ground energies.
  The common-domain analytic perturbation argument applies to each isolated rank-one spectral projection;
    see [10] Chapter VII, §1.3, Theorem 1.7, and §2.2, Theorem 2.6.
    To include the graph-norm conclusion explicitly, write $V_(upright("ee")) = sum_(i < j) \| x_i -
    x_j \|^(- 1)$ and $R_0 \( zeta \) = \( H_(m \, 0) - zeta \)^(- 1)$.
    On a contour enclosing only the relevant zero-coupling level,
  $ \( H_(m \, lambda) - zeta \)^(- 1) = R_0 \( zeta \) #scale(x: 120%, y: 120%)[\(] I +
    lambda V_(upright("ee")) R_0 \( zeta \) #scale(x: 120%, y: 120%)[\)]^(- 1) . $
  Here $R_0 \( zeta \) : L^2 arrow.r H^2$ and $V_(upright("ee")) R_0 \( zeta \) : L^2 arrow.r
    L^2$ are bounded uniformly on the contour. A Neumann series therefore makes the resolvent analytic as a map
    into $H^2$. Integrating around the contour, applying the resulting projection to the unperturbed state,
    and normalizing gives a real-analytic state in that space.
    Choose its real phase by positive overlap with the zero-coupling state.
    Spectral separation, or the min–max principle with the nonnegative repulsion,
    keeps this branch the lowest level of its sector.
  It remains to check the absolute three-electron ground property.
    In the sectors $S_z = plus.minus 3 \/ 2$, all three spatial orbitals must be distinct.
    Their zero-coupling energy is at least $epsilon.alt_b + epsilon.alt_e + epsilon.alt_3$, where $epsilon.alt_3 =
    inf sigma \( h_D \|_({ b \, e }^perp) \)$; it exceeds $2 epsilon.alt_b + epsilon.alt_e$ by more than $0.2$.
    Nonnegative repulsion preserves this lower bound, whereas the continued $S_z =
    1 \/ 2$ energy converges to $2 epsilon.alt_b + epsilon.alt_e$.
    Spin flip identifies the two $S_z = plus.minus 1 \/ 2$ ground energies.
    These four sectors exhaust the three-electron spin space, proving the claim.
  All the stated symmetries commute with the Hamiltonian and its spectral projection.
    Their eigenvalues at zero coupling persist on the simple branch.
    For axial rotations, one may equivalently note that the projection of the invariant zero-coupling state is
    still invariant. The ionic singlet subspace is also invariant, so its spin character persists. ◻
]

For the rest of the small-coupling argument define

#[#set math.equation(numbering: n => "(2.10)")
 $ k = k_lambda =
   sqrt(2 #scale(x: 120%, y: 120%)[\(] E_2 \( lambda \) - E_3 \( lambda \) #scale(x: 120%, y: 120%)[\)]) \, wide
   A \( r \) = e^(- k r) r^beta \, wide beta = frac(2 - 2 lambda, k) - 1 . $ <eq:ionization-parameters>]

Thus $k_lambda arrow.r k_0$. Once $D$ is fixed, the perturbation interval may be shortened so that

#[#set math.equation(numbering: n => "(2.11)")
 $ gamma - k_lambda gt.eq 1 / 2 \( gamma - k_0 \) > 0 . $ <eq:uniform-fast-slow-separation>]

No lower bound uniform in $D$ on the length of this interval is asserted or needed.

#thm([Lemma 2.4.])[
  (Density regularity and compact convergence).  #emph[Regard $F_(upright("true")) \( x \) =
    sqrt(3) thin Psi_lambda \( x \, dot.op \)$ as a Hilbert-space-valued function,
    retaining the removed-electron spin and all ionic coordinates and spins. Then
$ F_(upright("true")) in H^2 \( upright(bold(R))^3 \; cal(K) \) \, wide n_lambda =
  parallel F_(upright("true")) parallel_(cal(K))^2 in H^2 \( upright(bold(R))^3 \) ∩
  L^1 \( upright(bold(R))^3 \) \, wide sqrt(n_lambda) in H^1 \( upright(bold(R))^3 \) \, $

 where $cal(K)$ is the corresponding fiber Hilbert space. Moreover $Delta n_lambda in
   L^1 \( upright(bold(R))^3 \)$. These assertions hold for every $H^2$ three-electron eigenstate,
   with no small-coupling assumption.]
  #emph[For the branch in 4, $n_lambda arrow.r n_0 = 2 b^2 + e^2$ in $H^2$ and $L^1$,
    hence uniformly on compact sets; the densities are commonly tight as $lambda arrow.b 0$.
    Each fixed compact set has a positive lower bound for $n_lambda$ for sufficiently small $lambda$.
    The density is even and axisymmetric.]
] <lem:density-regularity>

#proof[
  Fubini’s theorem applied to the derivatives in the distinguished coordinate gives the Hilbert-valued $H^2$
    assertion. In three dimensions the corresponding Sobolev estimates yield
  $ parallel F_(upright("true")) parallel_(L_x^oo \( cal(K) \)) +
    parallel nabla_x F_(upright("true")) parallel_(L_x^4 \( cal(K) \)) lt.eq
    C parallel F_(upright("true")) parallel_(H_x^2 \( cal(K) \)) . $
  The distributional product identities
  #[#set math.equation(numbering: n => "(2.12)")
   $ partial_j n_lambda & = 2 "Re" chevron.l F_(upright("true")) \, partial_j F_(upright("true")) chevron.r_(cal(K)) \,\
partial_i partial_j n_lambda & = 2 "Re" chevron.l partial_i F_(upright("true")) \,
  partial_j F_(upright("true")) chevron.r_(cal(K)) + 2 "Re" chevron.l F_(upright("true")) \,
  partial_i partial_j F_(upright("true")) chevron.r_(cal(K)) $ <eq:density-product-identities>]
  then prove $n_lambda in H^2$. The same identities and Cauchy–Schwarz, now using $L_x^2$ on both factors,
    give $Delta n_lambda in L^1$. The norm chain rule gives
  #[#set math.equation(numbering: n => "(2.13)")
   $ integral_(upright(bold(R))^3) \| nabla sqrt(n_lambda) \|^2 lt.eq
     integral_(upright(bold(R))^3) parallel nabla_x F_(upright("true")) parallel_(cal(K))^2 .
     $ <eq:density-kinetic-bound>]
  The product estimates also show continuity of $F mapsto parallel F
    parallel_(cal(K))^2$ from $H_x^2 \( cal(K) \)$ to $H_x^2$.
    Thus the graph-norm convergence in 4 gives the claimed density convergence. For the $L^1$ convergence, use
  $ parallel n_lambda - n_0 parallel_1 lt.eq #scale(x: 120%, y: 120%)[\(] parallel F_(upright("true") \, lambda)
    parallel_2 + parallel F_(upright("true") \, 0) parallel_2 #scale(x: 120%, y: 120%)[\)] parallel
    F_(upright("true") \, lambda) - F_(upright("true") \, 0) parallel_2 . $
  It implies common tightness. Since $b$ is continuous and strictly positive everywhere, $n_0 gt.eq
    2 b^2$ has a positive minimum on each compact set. Uniform convergence gives the corresponding compact lower
    bound for $n_lambda$. The spatial symmetries follow by taking the squared fiber norm. ◻
]

The last lemma makes no claim of global positivity from compact convergence alone.
  The exterior argument below supplies positivity outside a fixed ball uniformly for sufficiently small coupling,
  and thereby supplies the global positivity needed for the angle construction.

== 3 Exterior channels and the density near the median plane <sec:channels>

The leading removal amplitude has a simple zero on the median plane,
  but a complementary ionic channel supplies a nonzero density tail there with the same exponential rate.
  This is the nodal-plane mechanism discussed in [8] Section V.A.
  We prove the estimates, including their uniformity as the interaction tends to zero,
  without assuming an asymptotic expansion of finitely many Dyson orbitals.

In the perturbative part of this section $D$ is fixed and sufficiently large, and $0 lt.eq lambda lt.eq lambda_D$,
  where $lambda_D > 0$ may be decreased finitely many times.
  Exterior radii and constants denoted by $C_D$ may depend on $D$, but not on $lambda$ in this interval.
  For $x = \( x_1 \, x_2 \, z \)$, write $r = \| x \|$, $p = \( x_1^2 + x_2^2 \)^(1 \/ 2)$, and $omega =
  x \/ r$ when $r > 0$. Differentiation in $p$ keeps $z$ fixed. Put

#[#set math.equation(numbering: n => "(3.1)")
 $ k = sqrt(2 \( E_2 \( lambda \) - E_3 \( lambda \) \)) \, wide beta = frac(2 - 2 lambda, k) - 1 \, wide
   A \( r \) = e^(- k r) r^beta . $ <eq:channel-radial-factor>]

We can arrange that

#[#set math.equation(numbering: n => "(3.2)")
 $ k > 0.99 \, wide gamma - k gt.eq 1 / 2 \( gamma - k_0 \) > 0 . $ <eq:channel-rate-separation>]

#thm([Proposition 3.1.])[
  (Density estimates).  #emph[For all sufficiently large $D$ and sufficiently small $lambda gt.eq 0$,
    the density $n = n_lambda$ is positive, even in $z$, and axisymmetric.
    It is smooth away from the nuclei and converges locally uniformly to $2 b^2 + e^2$ as $lambda arrow.b 0$.]
  #emph[Given $eta > 0$, first $D$ can be chosen sufficiently large and then $lambda_D >
    0$ sufficiently small so that, beyond a radius independent of $0 lt.eq lambda lt.eq lambda_D$,
#[#set math.equation(numbering: n => "(3.3)")
 $ \| partial_r log n + 2 k \| lt.eq eta \, wide lr(|partial_p log n + 2 k p / r|) lt.eq
   eta quad \( 0 lt.eq z lt.eq p \/ 2 \) . $ <eq:density-drift>]

 With $L = 10$ and $m \( p \, z \) = e^(2 k p) n \( p \, z \)$, the same choices give
#[#set math.equation(numbering: n => "(3.4)")
 $ frac(\| m_p \| + \| m_(p p) \|, m) lt.eq eta \, wide frac(n \( p \, z_1 \), n \( p \, z_2 \)) lt.eq
   20 quad \( 0 lt.eq z_1 lt.eq z_2 lt.eq L \) $ <eq:strip-data>]

 for all sufficiently large $p$, uniformly in that coupling interval.]
  #emph[For each fixed such $lambda > 0$, there are $c_lambda > 0$ and $P_lambda < oo$ such that
#[#set math.equation(numbering: n => "(3.5)")
 $ sqrt(n \( p \, 0 \)) gt.eq c_lambda A \( p \) p^(- 4) wide \( p gt.eq P_lambda \) . $ <eq:plane-tail>]

 There is a number $a > 0$, depending on $D \, lambda$, with the following translation properties.
   If $x_j = p_j omega_j$ lies in the median plane, $p_j arrow.r oo$,
   and the horizontal unit vectors $omega_j arrow.r omega_(*)$, then
#[#set math.equation(numbering: n => "(3.6)")
 $ frac(n \( x_j + x \), \( A \( p_j \) \/ p_j \)^2) arrow.r a^2 z^2 e^(- 2 k omega_(*) dot.op x) quad
   upright("locally uniformly for ") x = \( x_1 \, x_2 \, z \) in upright(bold(R))^3 . $ <eq:plane-translate>]

 If $\| x_j \| arrow.r oo$, $\| \( x_j \)_3 \| arrow.r oo$, and $x_j \/ \| x_j \| arrow.r omega_(*)$, then
#[#set math.equation(numbering: n => "(3.7)")
 $ frac(n \( x_j + x \), n \( x_j \)) arrow.r e^(- 2 k omega_(*) dot.op x) quad
   upright("locally uniformly in ") upright(bold(R))^3 . $ <eq:bulk-translate>]

]
] <prop:density-properties>

The quantitative uniformity needed for the final parameter prescription is given in (3.45) below.
  In particular, the constants remaining after the exterior limit do not involve the inverse of the small
  splitting $d_(*)$.

=== 3.1 The fiber equation and an exterior cutoff <the-fiber-equation-and-an-exterior-cutoff>

Let $cal(K)$ be the Hilbert space of the antisymmetric ionic pair,
  including its spin coordinates and the distinguished electron’s spin,
  restricted to total spin projection $1 \/ 2$. Regard

$ F_(upright("true")) \( x \) = sqrt(3) thin Psi_lambda \( x \, dot.op \) $

as a $cal(K)$-valued function, with $parallel F_(upright("true")) \( x \) parallel^2 = n \( x \)$.
  The ionic operator acts trivially on the distinguished spin. Set

$ B = H_(upright("ion")) - E_2 \( lambda \) \, wide P = \| phi.alt chevron.r chevron.l phi.alt \| \, wide Q = 1 -
  P \, wide B_Q = B \|_(Q cal(K)) \, $

where $phi.alt$ is the normalized ionic singlet tensored with distinguished spin up.
  Only that distinguished spin is compatible with the singlet and total projection $1 \/ 2$; hence $P$ has rank one and

#[#set math.equation(numbering: n => "(3.8)")
 $ B gt.eq 0 \, wide B_Q gt.eq c_D > 0 $ <eq:ionic-gap>]

uniformly on the small coupling interval.

For normalized spin orbitals $v \, w$, let $Phi_(v \, w)$ denote their normalized two-electron determinant.
  Expansion of the unperturbed determinant in the distinguished coordinate gives

#[#set math.equation(numbering: n => "(3.9)")
 $ F_0 \( x \) & = e \( x \) phi.alt_0 + b \( x \) G \,\
phi.alt_0 & = arrow.t ⊗ Phi_(b arrow.t \, b arrow.b) \,\
G & = arrow.t ⊗ Phi_(b arrow.b \, e arrow.t) - arrow.b ⊗ Phi_(b arrow.t \, e arrow.t) . $ <eq:unperturbed-fibers>]

Consequently

#[#set math.equation(numbering: n => "(3.10)")
 $ parallel G parallel = sqrt(2) \, wide parallel G_arrow.t parallel = parallel G_arrow.b parallel = 1 \, wide
   B_0 G = d_(*) G . $ <eq:core-spin-components>]

The ionic spatial parity of $G$ is odd, whereas that of $phi.alt$ is even.
  Thus $Q G = G$ at every coupling under consideration.

#thm([Lemma 3.2.])[
  (Cutoff channel equation).  #emph[There are an exterior $cal(K)$-valued function $F$,
    a nonnegative bounded multiplication operator $W \( x \)$ on the ionic variables, and $sigma > gamma$ such that
#[#set math.equation(numbering: n => "(3.11)")
 $ (- Delta_x / 2 + k^2 / 2 + B + u \( x \) + lambda W \( x \)) F = R . $ <eq:cutoff-channel-equation>]

 The operator $W$ equals $sum_(i = 1)^2 \| x - y_i \|^(- 1)$ for $\| y \| lt.eq r \/ 2$,
   vanishes for $\| y \| gt.eq 3 r \/ 4$, and satisfies
#[#set math.equation(numbering: n => "(3.12)")
 $ parallel partial_x^nu W \( x \) parallel_(cal(K) arrow.r cal(K)) lt.eq
   C_nu r^(- 1 - \| nu \|) . $ <eq:cutoff-interaction-symbol>]

 Here $nu$ is a Cartesian multiindex. For every fixed integer $s$,
#[#set math.equation(numbering: n => "(3.13)")
 $ parallel partial_x^nu R \( x \) parallel lt.eq C_(D \, s) lambda e^(- sigma r) quad \( \| nu \| lt.eq s \) .
   $ <eq:channel-residual>]

 Moreover,
#[#set math.equation(numbering: n => "(3.14)")
 $ lr(|partial_x^nu { n \( x \) - parallel F \( x \) parallel^2 }|) lt.eq
   C_D e^(- 2 sigma r) quad \( \| nu \| lt.eq 2 \) \, $ <eq:density-cutoff-error>]

 and $F - F_0 = O \( lambda \)$ on each fixed exterior annulus, also in any fixed finite number of $x$-derivatives.]
] <lem:channel-cutoff>

#proof[
  Put $rho = \( \| x \|^2 + \| y \|^2 \)^(1 \/ 2)$. A configuration-space partition according to a particle with
    distance at least a fixed multiple of $rho$ from the origin gives the exterior form bound
  #[#set math.equation(numbering: n => "(3.15)")
   $ H_(3 \, lambda) gt.eq 2 epsilon.alt_b - o \( 1 \) quad upright("on functions supported where ") rho arrow.r
     oo . $ <eq:configuration-exterior-bound>]
  The nuclear attraction of the selected particle is $O \( 1 \/ rho \)$;
    the other two one-particle operators are each bounded below by $epsilon.alt_b$, and repulsion can be dropped.
    The partition has derivatives $O \( 1 \/ rho \)$, so its kinetic localization error tends to zero.
    This argument is uniform for $0 lt.eq lambda lt.eq 1$.
  The exponent margin needed below already follows for $D gt.eq 100$ from (2.6), (2.8):
  $ k_0^2 gt.eq 1 - 80 / D^2 \, wide gamma^2 lt.eq 1 + 2 / D + 40 / D^2 \,\
10 / 9 k_0^2 - gamma^2 gt.eq 1 / 9 - 2 / D - frac(1160, 9 D^2) > 0 . $
  We can therefore choose
  $ 0 < tau_0 < tau_1 < tau_2 < k_0 \, wide tau_0 sqrt(10 \/ 9) > gamma . $
  After decreasing $lambda_D$, the exterior bound and $E_3 \( 0 \) = 2 epsilon.alt_b -
    k_0^2 \/ 2$ leave a positive margin above the weight cost $tau_2^2 \/ 2$.
    The exponential-weight identity, first with an exterior cutoff and a smooth truncated exponent whose gradient
    has norm at most one, gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ parallel e^(tau_1 rho) F_(upright("true")) parallel_(H^1 \( upright(bold(R))^9 \)) +
     parallel e^(tau_1 rho) F_0 parallel_(H^1 \( upright(bold(R))^9 \)) lt.eq C_D . $ <eq:configuration-weight>]
  At zero coupling the same argument also gives $parallel e^(tau_2 rho) F_0 parallel_(H^1) lt.eq C_D$,
    since $tau_2 < k_0$. The finite spin sum is understood. The estimate also applies to an inhomogeneous
    equation: if $\( H_(3 \, lambda) - E_3 \( lambda \) \) v = f$, then, for a fixed ball $K$,
  #[#set math.equation(numbering: n => "(3.17)")
   $ parallel e^(tau_1 rho) v parallel_(H^1) lt.eq
     C_D (parallel e^(tau_1 rho) f parallel_2 + parallel v parallel_(H^1 \( K \))) . $ <eq:inhomogeneous-weight>]
  Indeed the exterior spectral lower bound controls the weighted $L^2$ norm by the weight identity and
    Cauchy–Schwarz. Combining a small multiple of the kinetic form estimate with that lower bound also controls
    the gradient; the strict margin between $tau_1$ and $tau_2$ absorbs its additional weight cost.
    Hardy’s inequality absorbs the infinitesimally form-bounded Coulomb terms.
    These bounds are independent of the exponent truncation, which can therefore be removed.
  The equation for $v = F_(upright("true")) - F_0$ has source
  $ #scale(x: 120%, y: 120%)[\(] E_3 \( lambda \) - E_3 \( 0 \) -
    lambda V_(upright("ee")) #scale(x: 120%, y: 120%)[\)] F_0 . $
  Hardy’s inequality, with the spare exponent $tau_2$ on $F_0$, bounds it by $C_D lambda$ in weighted $L^2$.
    The compact term is $O \( lambda \)$ by 4. Thus
  #[#set math.equation(numbering: n => "(3.18)")
   $ parallel e^(tau_1 rho) \( F_(upright("true")) - F_0 \) parallel_(H^1) lt.eq
     C_D lambda . $ <eq:weighted-state-difference>]
  Choose smooth functions of $\| y \| \/ r$, with values in $\[ 0 \, 1 \]$, such that $chi = 1$ on $\| y \| lt.eq
    r \/ 3$, $chi = 0$ on $\| y \| gt.eq r \/ 2$, and $zeta = 1$ on $\| y \| lt.eq r \/ 2$, $zeta =
    0$ on $\| y \| gt.eq 3 r \/ 4$. Define
  $ F = F_0 + chi \( F_(upright("true")) - F_0 \) \, wide W = zeta sum_(i = 1)^2 \| x - y_i \|^(- 1) . $
  On the support of $zeta$, $\| x - y_i \| gt.eq r \/ 4$, proving (3.12).
    Denote the operator on the left of (3.11) by $cal(L)_lambda$. Since $W$ is exact on the support of $chi$,
  #[#set math.equation(numbering: n => "(3.19)")
   $ R = \( 1 - chi \) cal(L)_lambda F_0 + \[ cal(L)_lambda \, chi \] \( F_(upright("true")) - F_0 \) \,
     $ <eq:cutoff-residual-identity>]
  where
  $ cal(L)_lambda F_0 = {lambda (\| y_1 - y_2 \|^(- 1) + W) - E_3 \( lambda \) + E_3 \( 0 \)} F_0 . $
  Thus every residual term is $O \( lambda \)$ and is supported where $\| y \| gt.eq r \/ 3$. There,
  #[#set math.equation(numbering: n => "(3.20)")
   $ rho gt.eq sqrt(10 \/ 9) thin r . $ <eq:cutoff-geometric-margin>]
  We give the derivative details, since higher ordinary derivatives of the uncut wavefunction across a collision
    cannot simply be iterated. Local $H^2$ estimates on nested fixed-size configuration boxes have uniform
    constants: the Laplacian estimate with cutoffs and the infinitesimal Coulomb bound absorb the potential terms;
    the local energy estimate controls cutoff commutators. Where derivatives of $chi$ occur,
    $x$ is separated from both other electrons. Further $x$-derivatives of the equation differentiate only smooth
    bounded coefficients, while singular ionic coefficients are independent of $x$.
    Difference quotients followed by these local estimates give any fixed number of $x$-derivatives of the
    difference, at size $O \( lambda \)$ in weighted local norms.
    In the other residual term, $F_0$ has the product form (3.9);
    its $x$-derivatives have no electron-electron singularity,
    and the ionic Coulomb multiplier is controlled by Hardy’s inequality.
    Summing the box estimates and using Sobolev embedding in the three $x$-coordinates gives (3.13).
    A small loss from $tau_1$ toward $tau_0$ absorbs polynomial integration factors.
    By (3.20), one still has $sigma > gamma$.
  Density derivatives in the discarded region require a different coordinate choice.
    Choose smooth pair cutoffs $chi_(i j) in \[ 0 \, 1 \]$ equal to one at distances at most $1$ and zero at
    distances at least $2$, and expand the product of the three identities $1 = chi_(i j) + \( 1 - chi_(i j) \)$.
    For each term use the connected components of its near-edge graph as clusters.
    They have diameter at most $4$, and distinct clusters are separated by at least $1$.
    Nested boxes in which each particle moves by less than $1 \/ 8$ preserve a positive separation.
    The cluster containing $x$ is far from the nuclei when $r$ is large.
    Translate with $x$ all other variables in that cluster. A derivative in the translated $x$-coordinate is the
    sum of the corresponding particle derivatives. It annihilates within-cluster Coulomb singularities and
    singularities involving only outside particles; every coefficient differentiated is smooth with uniformly
    bounded derivatives. Nested-box energy and elliptic estimates can therefore be iterated in these three
    translation directions. This is the parallel-derivative method of [5] preprint version,
    Proposition 1.10 and Section 6; here the fixed separations make the constants uniform, while (3.16),
    (3.18) preserve the requisite exponential weights.
  The difference $n - parallel F parallel^2$ is a sum of integrals of products of $F_(upright("true"))$ and $F_0$,
    with coefficients supported where $\| y \| gt.eq r \/ 3$.
    After the coordinate changes just described, differentiate these integrals and apply Cauchy–Schwarz to the
    weighted local estimates. Each product has two exponentially decaying factors.
    Sobolev embedding in the three translation directions and (3.20) give (3.14),
    after another arbitrarily small loss of exponent. To obtain smoothness on a compact set disjoint from the
    nuclei, replace the pair-cutoff radii $1 \, 2$ by $epsilon \, 2 epsilon$,
    with $epsilon$ smaller than one sixteenth of the set’s distance from the nuclei.
    The cluster containing $x$ has diameter at most $4 epsilon$;
    sufficiently small nested boxes therefore keep it away from the nuclei and preserve the intercluster
    separation. The same argument without discarding a tail then proves smoothness of the density there.
    On fixed exterior annuli the differentiated local estimates also give the claimed $O \( lambda \)$ convergence
    of $F - F_0$. ◻
]

=== 3.2 Localized multipoles and the slow channel <localized-multipoles-and-the-slow-channel>

Reduced ionic inverses preserve the moment bounds needed below. Let $rho_y = \( 1 + \| y \|^2 \)^(1 \/ 2)$.
  For some $s_D > 0$, $phi.alt$ is bounded uniformly in $e^(s_D rho_y) H_y^2$. Moreover, if $e^(s rho_y) v in L^2$, then

#[#set math.equation(numbering: n => "(3.21)")
 $ e^(s' rho_y) B_Q^(- 1) Q v in H_y^2 quad upright("for some ") 0 < s' < s \, $ <eq:weighted-ionic-inverse>]

with uniform bounds on the small coupling interval. To justify this,
  conjugate the ionic operator by a small exponential with smooth truncated exponent.
  The added first-order term has small relative operator bound and the added zeroth-order term is bounded and
  small. An isolated contour around the ground eigenvalue has uniformly bounded conjugated resolvents.
  Applying the resulting projection to a compactly supported vector with nonzero ground-state overlap proves
  localization of $phi.alt$. The operator $B + P$ has a bounded inverse into $H_y^2$.
  Its conjugated finite-rank term is now bounded by the localization of $phi.alt$,
  so the same inverse perturbation argument applies. Restriction to $Q$ proves (3.21).
  Bounds are independent of the exponent truncation. Polynomial multiplication is harmless after decreasing the
  exponent again; only finitely many such decreases will be used.

On these localized vectors, finite Taylor expansion gives

#[#set math.equation(numbering: n => "(3.22)")
 $ W = 2 / r + frac(W_2 \( omega \), r^2) + frac(W_3 \( omega \), r^3) + dots.h.c \, wide W_2 \( omega \) =
   omega dot.op \( y_1 + y_2 \) . $ <eq:ionic-multipoles>]

An expansion through $r^(- m)$, applied to a vector bounded in one of the preceding weighted spaces,
  has remainder $O \( r^(- m - 1) \)$, with Cartesian derivative of order $\|
  nu \|$ bounded by $O \( r^(- m - 1 - \| nu \|) \)$. On $\| y \| lt.eq 3 r \/ 4$,
  the Taylor remainder is bounded by a constant times $\| y \|^m r^(- m - 1)$.
  Outside this region the polynomial moments of the localized vector bound the omitted cutoff tail exponentially.
  Differentiation gives the same symbol bounds. These are expansions on localized vectors,
  not operator-norm expansions on all of $cal(K)$. Similarly write

$ u = - 2 \/ r + sum_(j gt.eq 2) U_j \( omega \) r^(- j) \, wide U_2 = 0 \, wide U_3 = - D^2 \( 3 omega_z^2 - 1 \) \, $

with finite-order Taylor remainders understood.

#thm([Lemma 3.3.])[
  (Slow-channel expansion).  #emph[Write $P F = phi.alt f$. With every fixed finite number of angular derivatives,
#[#set math.equation(numbering: n => "(3.23)")
 $ parallel F parallel = O \( A \) \, wide parallel Q F parallel = O \( A \/ r^2 \) . $ <eq:channel-leading-bounds>]

 There are smooth real odd scalar functions $a_0 \, a_1 \, a_2$ on $bb(S)^2$ such that
#[#set math.equation(numbering: n => "(3.24)")
 $ f = A (a_0 + a_1 / r + a_2 / r^2 + cal(E)) . $ <eq:projected-channel-expansion>]

 For each fixed angular differential operator $Omega^ell$,
#[#set math.equation(numbering: n => "(3.25)")
 $ Omega^ell cal(E) = O \( r^(- 3) \) \, wide partial_r Omega^ell cal(E) = O \( r^(- 4) \) \, wide
   partial_r^2 Omega^ell cal(E) = O \( r^(- 4) \) . $ <eq:scalar-remainder-derivatives>]

 The radial remainders are odd in $omega_z$; in particular their bounds without angular differentiation gain a
   factor $\| omega_z \|$, also after one or two radial derivatives. All bounds are uniform for small $lambda$.
   Furthermore $a_0^lambda arrow.r a_0^0$ in $C^1 \( bb(S)^2 \)$, and phases can be chosen so that
#[#set math.equation(numbering: n => "(3.26)")
 $ inf_(omega_z > 0) frac(a_0^lambda \( omega \), omega_z) > c_D > 0 . $ <eq:simple-angular-zero>]

 Finally,
#[#set math.equation(numbering: n => "(3.27)")
 $ b = e^(- gamma r) r^(2 \/ gamma - 1) #scale(x: 120%, y: 120%)[\(] b_oo \( omega \) +
   O \( r^(- 1) \) #scale(x: 120%, y: 120%)[\)] \, wide min_(bb(S)^2) b_oo > 0 \, $ <eq:fast-orbital-expansion>]

 with angular derivatives and two radial derivatives of the expansion.]
] <lem:channel-expansion>

#proof[
  The ionic gap and multipole estimate imply
  $ P W phi.alt = \( 2 \/ r + O \( r^(- 2) \) \) phi.alt \, wide Q W phi.alt = O \( r^(- 2) \) . $
  Splitting a vector into $P + Q$ and applying Young’s inequality to the off-diagonal term,
    while retaining half the positive $Q$-gap, gives
  #[#set math.equation(numbering: n => "(3.28)")
   $ B + lambda W gt.eq 2 lambda \/ r - C_D \/ r^2 . $ <eq:ionic-schur-bound>]
  The norm $N \( x \) = parallel F \( x \) parallel$ consequently satisfies
  $ (- Delta_x \/ 2 + k^2 \/ 2 - \( 2 - 2 lambda \) \/ r - C_D \/ r^2) N lt.eq parallel R parallel . $
  Take the real inner product of the vector equation with $F \/ parallel F parallel$ and use $\| nabla parallel F
    parallel \| lt.eq parallel nabla F parallel$. Replacing the norm by
    $\( parallel F parallel^2 + epsilon^2 \)^(1 \/ 2)$ proves the weak inequality also at zeros.
    The unbounded ionic operator is handled through its quadratic form, or by bounded spectral truncations.
  Applying this scalar operator to $A \( 1 - M \/ r \)$, and dividing by $A$, gives $r^(- 2)$ coefficient
  $ k M - beta \( beta + 1 \) \/ 2 - C_D . $
  Choose $M$ to make this positive, and start outside $r > 2 M$.
    A sufficiently large multiple dominates the inner boundary value and the exponentially smaller source,
    yielding $N = O \( A \)$ by exterior comparison. The latter can be proved by testing the positive part of the
    difference with cutoffs: the zeroth-order coefficient is positive sufficiently far out, both functions decay,
    and the cutoff error tends to zero. The $Q$-equation has source $- lambda Q W phi.alt f + Q R =
    O \( A \/ r^2 \)$. Its norm inequality retains the positive constant $c_D$ in addition to $k^2 \/ 2 + u$,
    so $A \/ r^2$ is a supersolution at sufficiently large radius. This proves (3.23).
  Rotation fields $Omega$ acting on $x$ commute with $Delta_x \, B \, P \, Q$.
    Although $parallel Omega^j W parallel = O \( r^(- 1) \)$, one has $parallel Omega^j W phi.alt parallel =
    O \( r^(- 2) \)$ for $j gt.eq 1$, and $Omega^j u = O_D \( r^(- 3) \)$.
    Suppose the two leading bounds hold for fewer than $s$ rotations.
    Every commutator source for $Omega^s F$ is $O \( A \/ r^2 \)$:
    its $P$-part uses the improved estimate on $W phi.alt$, and its $Q$-part uses $O \( r^(- 1) \)
    O \( A \/ r^2 \)$. First the full norm comparison gives $Omega^s F = O \( A \)$;
    then the $Q$-equation and its gap give $Q Omega^s F = O \( A \/ r^2 \)$. This closes the induction.
    The absolute decay needed for comparison follows from the cutoff construction,
    allowing a small exponential loss for the polynomial coefficients of rotation fields.
  Set $h_0 = f \/ A$, and define
  #[#set math.equation(numbering: n => "(3.29)")
   $ K_j = - 1 / 2 Delta_(bb(S)^2) - 1 / 2 \( beta - j \) \( beta - j + 1 \) \, wide c_m = U_m +
     lambda chevron.l phi.alt \, W_m phi.alt chevron.r . $ <eq:angular-recursion-operators>]
  Axial symmetry and reflection give $c_2 = 0$. The projected equation conjugated by $A$ is
  #[#set math.equation(numbering: n => "(3.30)")
   $ - 1 / 2 h''_0 + (k - frac(beta + 1, r)) h'_0 + frac(K_0 + c_2, r^2) h_0 + c_3 / r^3 h_0 + dots.h.c =
     O \( r^(- 4) \) \, $ <eq:projected-radial-equation>]
  with any fixed number of angular derivatives. The off-diagonal source has this order because $parallel P W Q
    parallel = parallel Q W phi.alt parallel = O \( r^(- 2) \)$ and $Q F = O \( A \/ r^2 \)$.
  For the radial step, if a bounded angular-valued function $H$ satisfies
  $ - 1 / 2 H'' + (k - frac(beta + 1, r)) H' = G \( r \) \, wide G \( r \) = O \( r^(- q) \) \, quad q > 1 \, $
  then
  #[#set math.equation(numbering: n => "(3.31)")
   $ H' \( r \) = 2 e^(2 k r) r^(- 2 \( beta + 1 \)) integral_r^oo e^(- 2 k s) s^(2 \( beta + 1 \)) G \( s \) thin
     d s . $ <eq:radial-integrating-factor>]
  The other homogeneous branch grows exponentially and is excluded by boundedness.
    The integral is $O \( r^(- q) \)$, uniformly for the present bounded $beta$ and positive lower bound on $k$;
    thus $H$ has a limit with error $O \( r^(1 - q) \)$. Initially the right side of the radial equation is
    $O \( r^(- 2) \)$, since all needed angular derivatives of $h_0$ are bounded.
    Hence $h_0 arrow.r a_0$, with error $O \( r^(- 1) \)$. Set
  #[#set math.equation(numbering: n => "(3.32)")
   $ a_1 = frac(\( K_0 + c_2 \) a_0, k) \, wide a_2 = frac(\( K_1 + c_2 \) a_1 + c_3 a_0, 2 k) .
     $ <eq:scalar-channel-recursion>]
  Subtracting $a_0 + a_1 \/ r$ cancels order two; the integrating factor improves the remainder to
    $O \( r^(- 2) \)$, with derivative $O \( r^(- 3) \)$. Subtracting $a_2 \/ r^2$ cancels order three,
    giving $cal(E) = O \( r^(- 3) \)$ and $cal(E)' = O \( r^(- 4) \)$.
    The equation gives $cal(E)'' = O \( r^(- 4) \)$. The same argument with finitely more angular derivatives at
    each step proves (3.25). Reflection makes $f \, a_j$, and all radial remainders odd.
    The mean-value theorem in the transverse angular coordinate gives the additional factor at the equator.
  On a fixed radius, the projected function and its angular derivatives converge by the local estimates in 7.
    Since $parallel f \/ A - a_0 parallel_(C^1) lt.eq C_D \/ r$ uniformly,
    first choosing the radius large and then sending $lambda$ to zero proves $C^1$ convergence of $a_0^lambda$.
    At zero coupling the scalar equation for $e$ on the upper half-space has a subsolution which is a positive
    multiple of
  $ e^(- k_0 r) r^(2 \/ k_0 - 1) omega_z \( 1 + M \/ r \) . $
  After division by the radial factor and $omega_z$, the controlling $r^(- 2)$ coefficient contains $- k_0 M$;
    it dominates the bounded angular and scalar corrections for large $M$.
    Positivity of $e$ on an inner hemisphere and the boundary point lemma on its equator supply a strictly
    positive starting multiple, including the equatorial limit.
    Exterior comparison proves $inf a_0^0 \/ omega_z > 0$. Oddness and $C^1$ convergence give (3.26).
    The identical scalar argument for $b$, without an angular zero and with rate $gamma$, proves (3.27);
    positivity on the compact inner sphere gives $min b_oo > 0$. ◻
]

=== 3.3 The first nonzero complementary term on the plane <the-first-nonzero-complementary-term-on-the-plane>

The scalar channel’s oddness forces it to vanish on the median plane.
  We now identify the complementary term that supplies its missing density there,
  and control its error before comparing it with the retained fast term $b G$.

#thm([Lemma 3.4.])[
  (Complementary expansion and plane coefficient).  #emph[There are smooth exponentially localized $Q
    cal(K)$-valued angular coefficients $T_2 \, T_3 \, T_4$, bounded uniformly for small $lambda$, such that
#[#set math.equation(numbering: n => "(3.33)")
 $ Q F = b G + lambda A (T_2 / r^2 + T_3 / r^3 + T_4 / r^4) + cal(E)_Q \, wide
   parallel partial_x^nu cal(E)_Q parallel lt.eq C_D lambda A r^(- 5) quad \( \| nu \| lt.eq 2 \) .
   $ <eq:complementary-expansion>]

 Writing $Y_z = y_(1 z) + y_(2 z)$, one has
#[#set math.equation(numbering: n => "(3.34)")
 $ T_2 & = - a_0 B_Q^(- 1) Q W_2 phi.alt \,\
T_2 \|_(omega_z = 0) & = T_3 \|_(omega_z = 0) = 0 \,\
T_4 \|_(omega_z = 0) & = 1 / 2 B_Q^(- 1) Delta_(bb(S)^2) T_2 \|_(omega_z = 0) = -
  a'_0 \( 0 \) B_Q^(- 2) Q Y_z phi.alt . $ <eq:equatorial-coefficient>]

 The last vector has norm bounded below by a positive constant at fixed $D$,
   uniformly for sufficiently small $lambda$. All $T_j$ have distinguished spin up.]
] <lem:plane-coefficient>

#proof[
  On localized angular coefficients define
  $ C_m = U_m thin upright("id")_(Q cal(K)) + lambda Q W_m Q . $
  The qualification is essential: $W_m$, and hence $C_m$, can be unbounded on arbitrary ionic vectors.
    Their action on the localized vectors in this proof is controlled by (3.21), (3.22).
    On a term $r^(- j) T \( omega \)$, the conjugated $Q$-operator has expansion
  #[#set math.equation(numbering: n => "(3.35)")
   $ r^(- j) B_Q T - j k r^(- j - 1) T + r^(- j - 2) K_j T +
     sum_(m gt.eq 2) r^(- j - m) C_m T . $ <eq:complementary-recursion-action>]
  The source from $P$, after division by $lambda A$, is $- Q W phi.alt thin f \/ A$.
    Its coefficients of orders two through four are
  $ S_2 & = - a_0 Q W_2 phi.alt \,\
S_3 & = - a_1 Q W_2 phi.alt - a_0 Q W_3 phi.alt \,\
S_4 & = - a_2 Q W_2 phi.alt - a_1 Q W_3 phi.alt - a_0 Q W_4 phi.alt . $
  We therefore define the coefficients by
  #[#set math.equation(numbering: n => "(3.36)")
   $ B_Q T_2 & = S_2 \,\
B_Q T_3 & = S_3 + 2 k T_2 \,\
B_Q T_4 & = S_4 + 3 k T_3 - \( K_2 + C_2 \) T_2 . $ <eq:complementary-recursion>]
  Repeated use of (3.21), decreasing a positive weight after polynomial multiplication when necessary,
    gives smooth localized coefficients with every finite angular derivative bound used here.
    The nuclear quadrupole has already entered $a_2$ in (3.32);
    the operator $C_3$ acts directly on this complementary expansion first at order five.
  Every $S_j$ vanishes on the equator because its scalar factors $a_i$ are odd.
    The first two recursion equations give $T_2 = T_3 = 0$ there.
    In the third equation all terms except the angular Laplacian of $T_2$ also vanish.
    At the equator $a_0 = Delta_(bb(S)^2) a_0 = 0$, while
  $ nabla_(bb(S)^2) a_0 = a'_0 \( 0 \) e_z \, wide partial_(omega_z) W_2 = Y_z . $
  The product rule in $T_2 = - a_0 B_Q^(- 1) Q W_2 phi.alt$ proves (3.34), with its stated sign and factor.
    The slope is nonzero by (3.26). Moreover $Y_z phi.alt$ is ionic-odd, so $Q Y_z phi.alt = Y_z phi.alt$.
    This vector cannot vanish: the zero set of the multiplier $Y_z$ is a measure-zero hyperplane,
    which cannot support a nonzero $L^2$ vector. Injectivity of $B_Q^(- 2)$ proves nonvanishing.
    Continuity of the localized resolvents and vectors gives the uniform lower bound for small $lambda$.
    All operators in the recursion preserve the distinguished spin, so each $T_j$ has spin up.
  We next prove the remainder with its asserted uniformity.
    The retained vector $b G$ solves the homogeneous $Q$-equation at $lambda = 0$.
    Since $Q G = G$, its perturbed residual is
  #[#set math.equation(numbering: n => "(3.37)")
   $ cal(L)_(lambda \, Q) \( b G \) & = b Q {lambda (\| y_1 - y_2 \|^(- 1) + W) - E_3 \( lambda \) + E_3 \( 0 \)} G\
 & = O \( lambda b \) \, $ <eq:fast-channel-residual>]
  also through two ordinary $x$-derivatives. Hardy’s inequality controls the ionic Coulomb factor on $G$;
    the other $x$-dependent factors are smooth in the exterior. By (3.2), (3.27),
  #[#set math.equation(numbering: n => "(3.38)")
   $ b \/ A lt.eq C_D e^(- \( gamma - k_0 \) r \/ 2) r^(C_D) . $ <eq:fast-term-absorption>]
  Thus the residual is bounded by $C_D lambda A r^(- 5)$, uniformly in $lambda$.
    No equality of perturbed and unperturbed excited thresholds is being assumed.
  The matched slow terms have residual $O \( lambda A r^(- 5) \)$.
    The same bound holds through two Cartesian derivatives: finite multipole remainders have symbol bounds on the
    localized coefficients, and the scalar remainder is multiplied by $lambda Q W phi.alt =
    O \( lambda r^(- 2) \)$. The three bounds in (3.25) suffice;
    one does not need the stronger assertion $partial_r^2 cal(E) = O \( r^(- 5) \)$.
    The source $Q R$ is exponentially smaller. Hence $cal(E)_Q$ satisfies a $Q$-equation with a source of this
    size, including two derivatives. On a fixed large starting sphere its value is $O \( lambda \)$, since $Q F =
    b G$ at zero coupling and all fixed-radius data converge at that rate.
    The positive $Q$-gap makes a sufficiently large multiple of $lambda A
    r^(- 5)$ a scalar norm supersolution which dominates both the source and boundary value.
    Exterior comparison gives the undifferentiated remainder bound.
  For the derivative upgrade it is important to include the unbounded ionic operator.
    For compactly supported $v$ with values in $"Dom" B_Q$, Fourier transform in $x$ and the spectral resolution
    of $B_Q gt.eq 0$ give
  #[#set math.equation(numbering: n => "(3.39)")
   $ parallel D_x^2 v parallel_2 + parallel B_Q v parallel_2 lt.eq
     C parallel \( - Delta_x \/ 2 + B_Q \) v parallel_2 . $ <eq:positive-ionic-elliptic-estimate>]
  Indeed $\| xi \|^2$ and a spectral value $b gt.eq 0$ are each bounded by a fixed multiple of $\| xi \|^2 \/ 2 +
    b$. For the local estimate, first control $nabla_x v$ by the cutoff energy identity and then apply (3.39) with
    a second cutoff. The remaining coefficient $k^2 \/ 2 + u +
    lambda Q W Q$ and its $x$-derivatives are bounded operators on exterior unit balls,
    uniformly in their centers. Since $B_Q$ is independent of $x$,
    difference quotients and two further local estimates give
  $ parallel cal(E)_Q parallel_(H_x^4 \( B \( x \, 1 \/ 2 \) \; cal(K) \)) lt.eq C_D lambda A \( r \) r^(- 5) . $
  The source derivatives and the already proved pointwise bound control the right side on a larger ball;
    $A$ varies by a bounded factor there. Hilbert-valued Sobolev embedding in dimension three,
    $H^4 arrow.r.hook C^(2 \, alpha)$ for $alpha < 1 \/ 2$, gives the two pointwise derivative bounds in (3.33). ◻
]

=== 3.4 Uniform comparison of the three density scales <uniform-comparison-of-the-three-density-scales>

The coefficient calculation concerns the eventual tail at a fixed positive coupling.
  To obtain a common exterior radius as the coupling tends to zero,
  we must also control the region where the fast term and the induced plane term are comparable.
  Keeping all three scales in the following lower bound makes that comparison uniform.

#proof[
  Put $t = omega_z$ and
  $ T_(upright("eq")) = T_4 \|_(t = 0) \, wide M \( x \) = phi.alt f \( x \) + b \( x \) G +
    lambda A \( r \) r^(- 4) T_(upright("eq")) . $
  Axial symmetry and (3.34) make $T_(upright("eq"))$ independent of equatorial azimuth.
    Smoothness and the zeros of $T_2 \, T_3$ give
  $ parallel T_2 \( omega \) parallel + parallel T_3 \( omega \) parallel + parallel T_4 \( omega \) -
    T_(upright("eq")) parallel lt.eq C_D \| t \| . $
  The estimate holds on the whole sphere by compactness away from the equator.
    For any distinguished-spin-up $Q$-vector $S$, (3.10) implies
  $ \| chevron.l b G \, S chevron.r \| lt.eq \| b \| thin parallel S parallel =
    2^(- 1 \/ 2) parallel b G parallel thin parallel S parallel . $
  Therefore
  #[#set math.equation(numbering: n => "(3.40)")
   $ \( 1 - 2^(- 1 \/ 2) \) \( 2 b^2 + parallel S parallel^2 \) & lt.eq parallel b G + S parallel^2\
 & lt.eq \( 1 + 2^(- 1 \/ 2) \) \( 2 b^2 + parallel S parallel^2 \) . $ <eq:spin-noncancellation>]
  The $P$-component is orthogonal to both these terms. The simple angular zero and positive lower bound on
    $parallel T_(upright("eq")) parallel$ give
  $ parallel M parallel gt.eq c_D \( A \| t \| + b + lambda A r^(- 4) \) . $
  The complementary expansion gives
  $ parallel F - M parallel lt.eq C_D lambda A \( r^(- 2) \| t \| + r^(- 5) \) = o_D \( parallel M parallel \) \, $
  uniformly in small $lambda$ as the radius increases. Consequently
  #[#set math.equation(numbering: n => "(3.41)")
   $ parallel F parallel gt.eq c_D \( A \| omega_z \| + b + lambda A r^(- 4) \) . $ <eq:three-scale-lower-bound>]
  In addition, there is the absolute bound
  #[#set math.equation(numbering: n => "(3.42)")
   $ b \/ parallel F parallel lt.eq 2 . $ <eq:absolute-core-ratio>]
  The distinguished-down-spin component of $M$ has norm $b$.
    Increase the radius so that $parallel F - M parallel lt.eq parallel M parallel \/ 2$; then
  $ parallel F parallel gt.eq parallel M parallel - parallel F - M parallel gt.eq parallel M parallel \/ 2 gt.eq
    b \/ 2 . $
  Only the radius, not the constant $2$, depends on $D$. The cutoff errors are relatively negligible because
  $ e^(- 2 sigma r) \/ b^2 arrow.r 0 wide \( sigma > gamma \) . $
  This proves exterior positivity of $n$; positivity on the remaining compact set follows from 5 after decreasing
    $lambda_D$. Symmetry, compact convergence, and exterior smoothness have already been proved.
  We verify differentiated comparisons through the moving crossover.
    The projected remainders and their first two radial derivatives are odd,
    so their angular derivative bounds supply the factor $\| t \|$.
    Their errors can thus be divided by the first lower scale in (3.41). For the complementary error,
  $ frac(parallel partial_x^nu cal(E)_Q parallel, parallel F parallel) lt.eq
    C_D \/ r quad \( \| nu \| lt.eq 2 \, med lambda > 0 \) \, $
  using the third lower scale. At $lambda = 0$ this error is zero.
    Differentiating the explicit slow terms with $partial_r + k$ leaves only inverse powers of $r$.
    For the fast orbital,
  $ \( partial_r + k \) b = \( k - gamma \) b + O_D \( b \/ r \) \,
    wide \( partial_r + k \)^2 b = \( k - gamma \)^2 b + O_D \( b \/ r \) . $
  It follows, with $delta_lambda = k - gamma$, that
  #[#set math.equation(numbering: n => "(3.43)")
   $ \( partial_r + k \) F & = delta_lambda b G + o_D \( parallel F parallel \) \,\
\( partial_r + k \)^2 F & = delta_lambda^2 b G + o_D \( parallel F parallel \) \, $ <eq:radial-relative-derivatives>]
  where the ratios denoted by $o_D \( 1 \)$ tend to zero uniformly in the chosen coupling interval.
  At fixed $z$, $partial_p$ has radial part $\( p \/ r \) partial_r$ and angular part of size
    $O \( \| t \| \/ r \)$ on $0 lt.eq z lt.eq p \/ 2$. Applying it once or twice to smooth odd angular
    coefficients retains a factor $\| t \|$, together with the corresponding inverse powers of $r$. Thus
  $ (partial_p + k p / r) F = delta_lambda p / r thin b G + o_D \( parallel F parallel \) . $
  On $0 lt.eq z lt.eq L$, $1 - p \/ r = O_L \( p^(- 2) \)$ is negligible. With $D_p = partial_p + k$,
  #[#set math.equation(numbering: n => "(3.44)")
   $ D_p F = delta_lambda b G + o_D \( parallel F parallel \) \, wide D_p^2 F = delta_lambda^2 b G +
     o_D \( parallel F parallel \) . $ <eq:horizontal-relative-derivatives>]
  These estimates include angular derivatives of the displayed $T_j$:
    their zeros are retained for $T_2 \, T_3$, whereas the extra angular factor for $T_4$ is bounded using the
    first lower scale. The ordinary derivative bounds handle $cal(E)_Q$ directly.
  By (3.42), $parallel b G parallel \/ parallel F parallel lt.eq 2 sqrt(2)$. The identity
  $ \( partial_r + 2 k \) parallel F parallel^2 = 2 "Re" chevron.l F \, \( partial_r + k \) F chevron.r $
  and its horizontal version bound the normalized first derivatives by $4 sqrt(2) \| delta_lambda \| +
    o_D \( 1 \)$. Also
  $ \( partial_p + 2 k \)^2 parallel F parallel^2 = 2 parallel D_p F parallel^2 + 2 "Re" chevron.l F \,
    D_p^2 F chevron.r $
  gives the normalized second-derivative bound $\( 16 + 4 sqrt(2) \) delta_lambda^2 + o_D \( 1 \)$ in the strip.
    The differentiated cutoff errors remain relatively negligible.
    In particular, there is $rho_D \( R \) arrow.b 0$, independent of small $lambda$, such that
  #[#set math.equation(numbering: n => "(3.45)")
   $ max { & sup_(r gt.eq R) \| partial_r log n + 2 k \| \, med sup_(r gt.eq R\
0 lt.eq z lt.eq p \/ 2) lr(|partial_p log n + 2 k p / r|) \,\
 & sup_(p gt.eq R\
0 lt.eq z lt.eq L) frac(\| m_p \| + \| m_(p p) \|, m) } lt.eq 100 \( \| gamma - k \| + \| gamma - k \|^2 \) +
  rho_D \( R \) . $ <eq:quantitative-density-drift>]
  All $D$-dependent coefficients other than the fast exponential rate have entered the vanishing function $rho_D$.
    Since $gamma - k_0 arrow.r 0$ as $D arrow.r oo$ and $k arrow.r k_0$ as $lambda arrow.b 0$,
    this proves the derivative assertions in (3.3), (3.4).
  For the vertical ratio the expansions give, uniformly on $0 lt.eq z lt.eq L$,
  #[#set math.equation(numbering: n => "(3.46)")
   $ F \( p \, z \) =  & phi.alt a'_0 \( 0 \) A \( p \) z \/ p + b \( p \, 0 \) G +
     lambda A \( p \) p^(- 4) T_(upright("eq"))\
 & + o_D #scale(x: 120%, y: 120%)[\(] A \( p \) z \/ p + b \( p \, 0 \) +
   lambda A \( p \) p^(- 4) #scale(x: 120%, y: 120%)[\)] . $ <eq:strip-comparison-vector>]
  The last coefficient tends to zero uniformly in $lambda \, z$,
    and the error is relatively small compared with the norm of the three-term comparison vector by (3.40).
    Indeed $r - p = O_L \( p^(- 1) \)$; after including the lower radial terms,
    the projected factor is $a'_0 \( 0 \) z \/ p + O_D \( z \/ p^2 \)$; and $b \( p \, z \) \/ b \( p \, 0 \) =
    1 + O_D \( p^(- 1) \)$. The $T_2 \, T_3$ terms are $O_D \( lambda A z \/ p^3 \)$;
    all other errors have the displayed bound by (3.41). The squared comparison norm lies between $1 -
    1 \/ sqrt(2)$ and $1 + 1 \/ sqrt(2)$ times
  $ \| a'_0 \( 0 \) \|^2 A \( p \)^2 z^2 \/ p^2 + 2 b \( p \, 0 \)^2 +
    lambda^2 A \( p \)^2 p^(- 8) parallel T_(upright("eq")) parallel^2 . $
  This expression is nondecreasing in $z$. The ratio of the constants is $3 + 2 sqrt(2) < 6$;
    after absorbing uniformly small errors, the ratio in (3.4) is at most $20$.
  Now fix $lambda > 0$. On the plane $f = 0$ and $T_2 = T_3 = 0$.
    Since $b = o \( A p^(- 4) \)$, the complementary expansion yields
  $ F \( p \, 0 \) = lambda A \( p \) p^(- 4) T_(upright("eq")) + o \( A \( p \) p^(- 4) \) . $
  The coefficient is nonzero and the density cutoff error is exponentially smaller, proving (3.5).
  For plane-centered $x_j = p_j omega_j$, put $r_j \( x \) = \| x_j + x \|$. Uniformly on compact displacement sets,
  $ r_j \( x \) - p_j arrow.r omega_(*) dot.op x \, wide p_j z \/ r_j \( x \) arrow.r z \, wide
    A \( r_j \( x \) \) \/ A \( p_j \) arrow.r e^(- k omega_(*) dot.op x) . $
  The projected expansion and its simple angular zero imply
  $ frac(P F \( x_j + x \), A \( p_j \) \/ p_j) arrow.r phi.alt a'_0 \( 0 \) z e^(- k omega_(*) dot.op x) . $
  The complementary part divided by this normalization tends uniformly to zero.
    Its fast term is exponentially smaller; the $T_2 \, T_3$ terms retain the angular zero and the plane term is
    $O \( A p_j^(- 4) \)$. The cutoff error is negligible. Squaring gives (3.6) with $a = \| a'_0 \( 0 \) \| > 0$.
  Finally suppose $r_j = \| x_j \| arrow.r oo$ and $\| z_j \| arrow.r oo$.
    Reflection reduces the proof to $z_j > 0$. If $omega_(j \, z)$ stays bounded below,
    the conclusion follows directly from the smooth nonzero projected angular coefficient.
    Otherwise $t_j = z_j \/ r_j arrow.r 0$, and
  $ frac(b \( r_j \), A \( r_j \) t_j) arrow.r 0 \, wide frac(lambda A \( r_j \) r_j^(- 4), A \( r_j \) t_j) =
    frac(lambda, r_j^3 z_j) arrow.r 0 . $
  The $T_2 \, T_3$ terms are relatively negligible as well.
    For bounded $x$, $t_j \( x \) \/ t_j = 1 + O \( 1 \/ z_j + 1 \/ r_j \)$.
    Since $a_0 \( t \) \/ t$ is continuous and bounded away from zero through the equator,
    the angular amplitude has relative variation tending to one.
    The radial ratio tends to $e^(- k omega_(*) dot.op x)$; all lower terms are uniformly negligible.
    Squaring proves (3.7). ◻
]

We record one more zero-coupling consequence for the next section:

#[#set math.equation(numbering: n => "(3.47)")
 $ sup_(0 < z lt.eq 10) {lr(|partial_p log b / e + \( gamma - k_0 \) p / r|) +
   lr(|partial_p^2 log b / e|)} arrow.r 0 wide \( p arrow.r oo \) . $ <eq:unperturbed-strip-ratio>]

Indeed the scalar expansions have the strip form

$ e \( p \, z \) = z e^(- k_0 r) r^(2 \/ k_0 - 2) c \( r \, z \/ r \) \, wide b \( p \, z \) =
  e^(- gamma r) r^(2 \/ gamma - 1) d \( r \, z \/ r \) \, $

where $c \, d$ are smooth, bounded above and below by positive constants,
  and have the already proved radial and angular derivative estimates.
  The term $- log z$ in $log \( b \/ e \)$ disappears under $partial_p$.
  The other terms give $partial_p log \( b \/ e \) = - \( gamma - k_0 \) p \/ r +
  O_D \( r^(- 1) \)$ and $partial_p^2 log \( b \/ e \) = O_D \( r^(- 2) \) + O_D \( z^2 \/ r^3 \)$.
  This proves the assertion uniformly down to the simple zero of $e$.

=== 3.5 A fixed-parameter version <a-fixed-parameter-version>

The exact charge will be defined by forward spectral and variational tests.
  Passing them need not put its reciprocal in a particular perturbative interval chosen earlier.
  The next proposition isolates the hypotheses needed for the final tail argument.

#thm([Proposition 3.5.])[
  (Channels at a fixed coupling).  #emph[Suppose $D$ satisfies 3 and
$ k_0 > sqrt(0.98) \, wide gamma < sqrt(49 \/ 45) . $

 Fix $t in \( 0 \, 1 \]$. Assume the two-electron ground level is isolated and simple with an even ionic singlet,
   and the three-electron ground level in $S_z = 1 \/ 2$ is isolated and simple, is an absolute ground level,
   and has a real axisymmetric odd ground state. Assume $n_t > 0$, and set
$ k = sqrt(2 \( E_2 \( t \) - E_3 \( t \) \)) \, wide A_t \( r \) = e^(- k r) r^(\( 2 - 2 t \) \/ k - 1) . $

 Suppose
#[#set math.equation(numbering: n => "(3.48)")
 $ 2 epsilon.alt_b - E_3 \( t \) > 0.49 \, wide 0.99 < k < gamma \,\
inf_(omega_z > 0) liminf_(r arrow.r oo)
  frac(parallel P_t F_(upright("true") \, t) \( r omega \) parallel, omega_z A_t \( r \)) > 0 .
  $ <eq:fixed-channel-hypotheses>]

 Then $n_t$ has the local regularity in 5, is smooth away from the nuclei, and satisfies (3.5), (3.6),
   (3.7) at this fixed coupling, with $A = A_t$ and suitable positive constants.
   Membership of $t$ in the preceding perturbative interval is not required.]
] <prop:fixed-parameter-channels>

#proof[
  Local regularity uses only the Coulomb eigenvalue equation,
    and exterior smoothness follows from the cluster argument in 7.
    The isolated ionic ground supplies a positive $Q$-gap and (3.21), with constants now allowed to depend on $t$.
  The configuration-space lower bound (3.15) remains valid because $t gt.eq 0$.
    The energy hypothesis permits weights with exponent arbitrarily close to $sqrt(0.98)$. Since
  $ sqrt(0.98) sqrt(10 \/ 9) = sqrt(49 \/ 45) > gamma $
  and $k_0 > sqrt(0.98)$, the true and unperturbed states admit the same cutoff construction with residual
    exponent $sigma > gamma$. There is no need to estimate the difference uniformly as $t arrow.b 0$:
    at this fixed positive $t$, its finite weighted norms and the fixed energy difference divided by $t$ are part
    of the constants. Thus (3.11), (3.13), (3.14) hold at the chosen parameter.
  The norm comparisons, angular induction, and integrating-factor argument use only the positive ionic gap,
    bounded exterior coefficients, and exponential residual. They give (3.24),
    (3.25) without a perturbative assertion about $a_0$. Also $parallel F_(upright("true")) - F parallel =
    O \( e^(- sigma r) \)$, by the same weighted local estimates on the tail support.
    For each fixed $omega_z > 0$, the liminf in (3.48) is therefore $\| a_0 \( omega \) \| \/ omega_z$.
    Its positive infimum and the smooth odd extension imply
  $ inf_(omega_z > 0) frac(\| a_0 \( omega \) \|, omega_z) > 0 \, wide \| a'_0 \( 0 \) \| > 0 . $
  The sign of $a_0$ is constant on the upper hemisphere and does not affect the density.
  Repeat the complementary recursion (3.36). The strict inequality $k < gamma$ absorbs the residual of $b
    G$ into $t A r^(- 5)$; the stronger uniform separation in (3.2) is unnecessary.
    On a fixed starting sphere the remainder is finite; dividing its bound by the positive profile $t A_t \( r \)
    r^(- 5)$ is absorbed in the allowed $t$-dependent comparison constant.
    The norm and differentiated comparisons give (3.33) with $t$-dependent constants.
    Finally $Q Y_z phi.alt = Y_z phi.alt eq.not 0$, so the coefficient in (3.34) is nonzero without continuity
    from zero coupling. The fixed-coupling parts of the preceding density proof give the plane lower bound and
    both translation limits. ◻
]

== 4 An angle minimum and its spectral gap <sec:angle>

We now construct two spatial orbitals with the prescribed density.
  The main point is to prove a spectral gap for their common formal potential.
  This will allow the next section to compare the resulting determinant with arbitrary fermionic ensembles.

Write $Omega_(+) = { x in upright(bold(R))^3 : z > 0 }$. For a positive continuous weight $w$, set

$ H^1 \( w \) = {xi in H_(upright("loc"))^1 \( upright(bold(R))^3 \) :
  integral_(upright(bold(R))^3) w #scale(x: 120%, y: 120%)[\(] \| xi \|^2 + \| nabla xi \|^2
  #scale(x: 120%, y: 120%)[\)] < oo} \, wide cal(E)_w \( xi \) = 1 /
  2 integral_(upright(bold(R))^3) w \| nabla xi \|^2 . $

When $w$ is integrable, use the unnormalized weighted variance

$ "Var"_w \( xi \) = integral_(upright(bold(R))^3) w \| xi \|^2 -
  frac(lr(|integral_(upright(bold(R))^3) w xi|)^2, integral_(upright(bold(R))^3) w) . $

The corresponding spaces on $Omega_(+)$ are defined in the same way,
  with local Sobolev regularity up to its boundary when a trace is specified.
  On compact sets all these weighted norms are equivalent to the ordinary Sobolev norms.
  Radial cutoffs, followed by local smooth approximation, are dense in the full-space form norm.
  Indeed, for cutoffs $chi_R$ with $\| nabla chi_R \| lt.eq C \/ R$,
  the additional gradient term is bounded by $C R^(- 2) integral_(\| x \| > R) w \| xi \|^2$.
  For odd functions the analogous approximation on $Omega_(+)$ uses their zero trace on the median plane.

=== 4.1 The constrained angle <the-constrained-angle>

#thm([Proposition 4.1.])[
  (Existence and regularity of the angle).  #emph[Let $n$ be a positive, continuous,
    even density with $integral n = 3$, $n in H_(upright("loc"))^2 \( upright(bold(R))^3 \)$,
    and $sqrt(n) in H^1 \( upright(bold(R))^3 \)$. The problem
#[#set math.equation(numbering: n => "(4.1)")
 $ & min_(theta.alt in H^1 \( n \; upright(bold(R)) \)) integral_(upright(bold(R))^3) n \| nabla theta.alt \|^2 \,\
 & upright("subject to ") quad theta.alt upright(" odd") \, wide integral_(upright(bold(R))^3) n sin^2 theta.alt =
   1 $ <eq:angle-minimum>]

 has a minimizer $theta$ satisfying $0 lt.eq theta lt.eq pi \/ 2$ on $Omega_(+)$.
   Every such folded minimizer has a multiplier $d > 0$ and satisfies
#[#set math.equation(numbering: n => "(4.2)")
 $ L_n theta := n^(- 1) "div" \( n nabla theta \) = - d sin \( 2 theta \) quad
   upright("on ") upright(bold(R))^3 . $ <eq:angle-euler>]

 It belongs locally to $W^(2 \, p)$ for every $p < 6$, and
$ 0 < theta < pi \/ 2 quad upright("on ") Omega_(+) . $

 In particular, it is locally $C^(1 \, alpha)$ for every $0 < alpha < 1 \/ 2$.
   Axial symmetry of $n$ is not required for this proposition, and axial symmetry of $theta$ is not asserted.]
] <prop:angle-minimizer>

#proof[
  On the upper half-space the Lipschitz map $t mapsto arcsin \| sin t \|$ preserves $sin^2 t$,
    preserves zero trace, and does not increase gradient energy. Extend the folded function oddly.
    Thus every competitor can be replaced by one taking values in $\[ 0 \, pi \/ 2 \]$ above the plane.
  The admissible class is nonempty. Smooth odd angles that equal $pi \/
    2$ on increasingly large compact subsets of $Omega_(+)$ have constraint values approaching $3$.
    For one such angle the constraint is greater than $1$; multiplying it by a parameter in $\[ 0 \, 1 \]$ and
    using continuity produces the required value $1$. A folded minimizing sequence is bounded in $H^1$ on every
    compact set, since $n$ has a positive local lower bound. Local compactness gives an odd limit with zero trace
    on the plane. The bound $sin^2 theta lt.eq 1$ and integrability of $n$ preserve the constraint under
    exhaustion of space. Lower semicontinuity proves minimality.
    The bound on the angle also gives its membership in $L^2 \( n \)$.
  Folding any perturbed competitor shows that a folded minimum is a minimum for unrestricted odd variations.
    The constraint derivative is nonzero on some compact smooth odd variation.
    Otherwise $sin \( 2 theta \) = 0$ almost everywhere on $Omega_(+)$.
    A locally Sobolev function with values in the discrete set ${ 0 \,
    pi \/ 2 }$ has zero gradient and is constant on that connected set;
    the trace and constraint exclude both possibilities. The Lagrange-multiplier rule,
    normalized by a factor of two, therefore gives
  $ integral n nabla theta dot.op nabla phi = d integral n sin \( 2 theta \) phi $
  for compact odd tests. The same identity for even tests is zero on both sides by parity,
    proving the full-space equation.
  Testing with cutoffs times the bounded function $theta$ gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ integral n \| nabla theta \|^2 = d integral n theta sin \( 2 theta \) . $ <eq:angle-positive-multiplier>]
  The cutoff error tends to zero by finite gradient energy and $integral n < oo$. The left side is positive.
    The integral on the right without $d$ is positive by folding, oddness,
    and the preceding nonconstancy argument. Hence $d > 0$.
  Here are the local estimates needed below. Positivity of $n$ and $n in H_(upright("loc"))^2$ imply $nabla log n
    in L_(upright("loc"))^6$. Rewrite (4.2) by testing with $phi \/ n$,
    where $phi$ is compactly supported and smooth. The positive local lower bound and $H_(upright("loc"))^2$
    regularity of $n$ make this a legitimate local $H^1$ test. Thus, in distributions,
  $ Delta theta = - \( nabla log n \) dot.op nabla theta - d sin \( 2 theta \) . $
  Its right side initially lies in $L_(upright("loc"))^(3 \/ 2)$.
    Interior estimates for the ordinary Laplacian on nested compact sets [22] pp. 6–7 give
  $ W_(upright("loc"))^(2 \, 3 \/ 2) med arrow.r.double med nabla theta in L_(upright("loc"))^3 med
    arrow.r.double med H_(upright("loc"))^2 med arrow.r.double med W_(upright("loc"))^(2 \, 3) . $
  The last space gives $nabla theta in L_(upright("loc"))^q$ for every finite $q$,
    and a final application of the equation gives $W_(upright("loc"))^(2 \, p)$ for every $p < 6$.
    These estimates are uniform when the local $H^2$ bounds and positive lower bounds for $n$,
    the local angle energy, and $d$ are uniform. They apply across the median plane because the equation has
    already been extended to full space.
  Finally, $theta gt.eq 0$ solves an equation with bounded coefficient $d sin \( 2 theta \) \/ theta$,
    and $delta = pi \/ 2 - theta gt.eq 0$ on $Omega_(+)$ satisfies
  #[#set math.equation(numbering: n => "(4.4)")
   $ L_n delta = q delta \, wide q = d thin frac(sin \( 2 delta \), delta) in \[ 0 \, 2 d \] \, $ <eq:delta-equation>]
  with the continuous value $2 d$ at $delta = 0$. On each compact ball the divergence-form coefficient $n
    I$ is bounded and uniformly elliptic, and the zeroth-order coefficients are bounded.
    The local Harnack inequality therefore excludes an interior zero of either nonnegative function [17]
    Lecture 17, p. 199, and Lecture 18, Theorem 1: the resulting constant would violate the trace or the constraint. ◻
]

The hypotheses of 11 hold for the densities under consideration by Lemma 2.4, Proposition 3.1.
  In the remainder of the qualitative argument, $D$ is fixed and sufficiently large and $lambda$ tends to zero.

#thm([Proposition 4.2.])[
  (Convergence of every folded minimum).  #emph[For every choice of folded minimizing angles for $n_lambda$,
#[#set math.equation(numbering: n => "(4.5)")
 $ theta_lambda arrow.r theta_(*) = arctan #h(-0.16667em) (frac(e, sqrt(2) thin b)) \, wide d_lambda arrow.r
   d_(*) = epsilon.alt_e - epsilon.alt_b . $ <eq:angle-convergence>]

 The angle convergence is weak in local $H^1$, strong in local $L^2$, and in $C^1$ on every fixed compact set.
   In particular, all these conclusions hold uniformly over the set of folded minimizers in the sequential sense.]
] <prop:angle-convergence>

#proof[
  At $lambda = 0$, let $g = sqrt(n_0) cos theta.alt$ and $h =
    sqrt(n_0) sin theta.alt$ for an admissible folded angle. Their squared norms are $2$ and $1$;
    they are orthogonal by parity. The determinant with occupied spin orbitals $\( g \/ sqrt(2) \)
    arrow.t \, \( g \/ sqrt(2) \) arrow.b \, h arrow.t$ has density $n_0$ and kinetic energy
  $ 1 / 2 integral #scale(x: 120%, y: 120%)[\(] \| nabla g \|^2 + \| nabla h \|^2 #scale(x: 120%, y: 120%)[\)] =
    1 / 2 integral \| nabla sqrt(n_0) \|^2 + 1 / 2 integral n_0 \| nabla theta.alt \|^2 . $
  Adding the fixed integral $integral u n_0$ and using the simple three-electron ground state in the indicated
    spin sector shows that the minimum is attained uniquely by $g = sqrt(2) b \, med h = e$,
    with the signs fixed by folding. Indeed, equality fixes the occupied spin-orbital subspace;
    its one-dimensional down-spin part fixes $g$, and the remaining up-spin orbital then fixes $h$.
    This gives precisely $theta_(*)$.
  To obtain a recovery sequence for small $lambda$, first multiply the bounded $theta_(*)$ by radial cutoffs.
    Its finite angle energy and the tail of $n_0$ make the resulting energy and constraint errors tend to zero.
    Approximate on the remaining compact set by smooth odd functions.
    A fixed compact odd variation with nonzero constraint derivative corrects the constraint exactly,
    both at zero and at nearby $lambda$. Local convergence of $n_lambda$ then gives the energy upper bound for
    minima. Folding the corrected competitor, if necessary, only decreases its energy.
  The minimizing angles consequently have uniformly bounded local $H^1$ norms.
    Common tightness of $n_lambda$, supplied by 5, preserves the constraint for any local limit.
    Lower semicontinuity and the recovery bound make that limit a minimum at zero coupling, hence $theta_(*)$.
    For a fixed compact odd $phi$ with nonzero limiting constraint derivative, the weak equation gives
  $ d_lambda =
    frac(integral n_lambda nabla theta_lambda dot.op nabla phi, integral n_lambda sin \( 2 theta_lambda \) phi) . $
  Its numerator and denominator converge. The limiting orbital equations for $b \,
    e$ identify the quotient as $d_(*)$. The uniform local estimates in 11,
    together with compact Sobolev embedding, now give $C^1$ convergence on compact sets.
    Applying this argument to every sequence of minimizers proves the asserted uniformity over all folded choices. ◻
]

#thm([Proposition 4.3.])[
  (The two orbital equations).  #emph[For a folded minimizer define
#[#set math.equation(numbering: n => "(4.6)")
 $ g = sqrt(n) cos theta \, wide h = sqrt(n) sin theta . $ <eq:angle-orbitals>]

 Then $g \, h in H^1 \( upright(bold(R))^3 \) ∩ H_(upright("loc"))^2 \( upright(bold(R))^3 \)$,
   $g$ is even and strictly positive, and $h$ is odd and strictly positive on $Omega_(+)$. Moreover,
$ parallel g parallel_2^2 = 2 \, wide parallel h parallel_2^2 = 1 \, wide chevron.l g \, h chevron.r = 0 \, wide
  g^2 + h^2 = n . $

 The real function
#[#set math.equation(numbering: n => "(4.7)")
 $ V = frac(Delta g, 2 g) = frac(Delta sqrt(n), 2 sqrt(n)) - frac(\| nabla theta \|^2, 2) +
   d sin^2 theta $ <eq:formal-potential>]

 belongs to $L_(upright("loc"))^2 \( upright(bold(R))^3 \)$, and
#[#set math.equation(numbering: n => "(4.8)")
 $ \( - Delta \/ 2 + V \) g = 0 \, wide \( - Delta \/ 2 + V \) h = d h $ <eq:orbital-equations>]

 in distributions. On the median plane, $g = sqrt(n)$ and $h = 0$.]
] <prop:orbital-equations>

#proof[
  The norm, parity, and positivity statements follow from the constraint and 11. The Sobolev chain rule gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ \| nabla g \|^2 + \| nabla h \|^2 = \| nabla sqrt(n) \|^2 + n \| nabla theta \|^2 \, $ <eq:angle-kinetic-identity>]
  so both orbitals belong to $H^1$. Positivity and local $H^2$ regularity of $n$,
    together with the angle estimates, give local $H^2$ regularity of the orbitals.
    Differentiating (4.6) and using (4.2) proves (4.7), (4.8).
    Since the continuous function $g$ has a positive lower bound on each compact set,
    $Delta g \/ \( 2 g \)$ is locally square integrable. ◻
]

=== 4.2 A strip comparison and exterior coercivity <a-strip-comparison-and-exterior-coercivity>

The orbital equations alone do not establish their spectral ordering.
  We first control tests supported far from the nuclei, including tests with nonzero trace on the median plane.
  This will prevent weighted norm from escaping when we compare the even spectrum with its zero-coupling limit.

Fix throughout this subsection

$ L = 10 \, wide mu = 1 / 10 . $

The density is axisymmetric, so it may be written as $n \( p \, z \)$. This notation will not be imposed on the angle.

#thm([Lemma 4.4.])[
  (The one-dimensional comparison function).  #emph[Suppose, for $p gt.eq P_0$ and $0 lt.eq z lt.eq L$,
    that $m \( p \, z \) = e^(2 k p) n \( p \, z \) > 0$ satisfies
#[#set math.equation(numbering: n => "(4.10)")
 $ \| m_p \| + \| m_(p p) \| & lt.eq eta m \, wide 0 < eta lt.eq 1 \,\
frac(m \( p \, t \), m \( p \, s \)) & lt.eq C wide \( 0 lt.eq t lt.eq s lt.eq L \) . $ <eq:strip-comparison-data>]

 Let $U \( p \, dot.op \)$ solve
#[#set math.equation(numbering: n => "(4.11)")
 $ n^(- 1) \( n U_z \)_z = mu^2 U \, wide U \( p \, 0 \) = 1 \, quad U \( p \, L \) = 0 . $ <eq:strip-ode>]

 It is positive and decreasing on $0 lt.eq z < L$, and
#[#set math.equation(numbering: n => "(4.12)")
 $ \| U_p \| + \| U_(p p) \| lt.eq C_2 eta U \, $ <eq:strip-horizontal-derivatives>]

 where $C_2$ depends only on $C \, L \, mu$. When $C lt.eq 100$, one may take $C_2 < 10^30$.]
] <lem:strip-solution>

#proof[
  Solve backward with final flux equal to one. If $J$ is the positive flux magnitude,
    the unnormalized solution and its flux obey
  #[#set math.equation(numbering: n => "(4.13)")
   $ tilde(U) \( p \, z \) & = integral_z^L frac(J \( p \, s \), m \( p \, s \)) thin d s \,\
J \( p \, z \) & = 1 + mu^2 integral_z^L integral_t^L frac(m \( p \, t \), m \( p \, s \)) J \( p \, s \) thin d s
  thin d t . $ <eq:strip-volterra>]
  The successive-integral series is positive. Its term of order $l$ is bounded by
  $ frac(\( mu^2 C \)^l \( L - z \)^(2 l), \( 2 l \) !) . $
  It therefore converges uniformly, defines $J gt.eq 1$, and gives the unique solution after normalization
    $U \( p \, z \) = tilde(U) \( p \, z \) \/ tilde(U) \( p \, 0 \)$. The formulas give $U > 0$ and $U_z < 0$.
  For a kernel $K = m \( p \, t \) \/ m \( p \, s \)$,
  $ \| K_p \| lt.eq 2 eta K \, wide \| K_(p p) \| lt.eq 6 eta K . $
  The product of $l$ such kernels has derivatives of either positive order at most two bounded by
    $20 \( 1 + l \)^2 eta$ times that product. Termwise differentiation of the series is consequently justified.
    For $C lt.eq 100$, the undifferentiated terms are bounded by $10^(2 l) \/ \( 2 l \) !$, and
  $ sum_(l gt.eq 0) 20 \( 1 + l \)^2 frac(10^(2 l), \( 2 l \) !) < 10^8 . $
  Since $J gt.eq 1$, these estimates bound its first two $p$-derivatives relative to $J$.
    Also $\| \( m^(- 1) \)_p \| lt.eq eta m^(- 1)$ and $\| \( m^(- 1) \)_(p p) \| lt.eq 3 eta m^(- 1)$.
    Integrating the positive expression for $tilde(U)$, and then differentiating its quotient by
    $tilde(U) \( p \, 0 \)$, proves (4.12); the displayed numerical bounds give $C_2 < 10^30$ with ample slack.
    For general fixed $C$ the same convergent series gives a finite constant.
    Only the one-sided ratios in (4.10) were used. ◻
]

#thm([Proposition 4.5.])[
  (Uniform exterior gap).  #emph[For sufficiently large $D$,
    there are $lambda_0 > 0$ and $R_0 < oo$ such that every folded minimizing angle for $0 lt.eq
    lambda < lambda_0$ satisfies
#[#set math.equation(numbering: n => "(4.14)")
 $ 1 / 2 integral_(Omega_(+)) g^2 \| nabla xi \|^2 gt.eq 0.03 integral_(Omega_(+)) g^2 \| xi \|^2
   $ <eq:exterior-weighted-gap>]

 for tests supported in ${ \| x \| > R_0 }$. No zero trace on $z = 0$ is required.
   The inequality holds throughout the corresponding weighted form domain.]
] <prop:exterior-gap>

#proof[
  Set $delta = pi \/ 2 - theta$ on $Omega_(+)$. By (4.4),
  $ L_n delta = q delta \, quad 0 lt.eq q lt.eq 2 d \, wide 4 / pi^2 n delta^2 lt.eq g^2 = n sin^2 delta lt.eq
    n delta^2 . $
  Choose $D$ large enough that $d_(*)$ and $gamma - k_0$ are small.
    The multiplier convergence and the density estimates (3.3),
    (3.4) allow us to choose the small constants below uniformly for sufficiently small $lambda$.
  First, $U$ from 14 is a subsolution in the strip. In cylindrical coordinates,
  $ L_n U = mu^2 U + U_(p p) + \( p^(- 1) + partial_p log n \) U_p . $
  The horizontal coefficient is bounded sufficiently far out by (3.3).
    Thus (4.12), with $eta$ small, and $q lt.eq 2 d$, with $d$ small, imply
  #[#set math.equation(numbering: n => "(4.15)")
   $ \( L_n - q \) U gt.eq 0 . $ <eq:strip-subsolution>]
  We next supply an inner boundary for comparison. At zero coupling put $delta_(*) = pi \/ 2 - theta_(*)$. On $z > 0$,
  $ delta_(*) = arctan \( sqrt(2) b \/ e \) . $
  The scalar exterior estimates in (3.47) show that, uniformly for $0 < z lt.eq L$,
    the first two horizontal logarithmic derivatives of $b \/
    e$ are small when $D$ and then the starting radius are large. This remains true down to $z = 0$:
    the simple odd factor of $e$ is canceled before taking a horizontal derivative.
    If $t > 0$, the ratios of $t \( arctan t \)'$ and $t^2 \( arctan t \)''$ to $arctan t$ are bounded. Consequently
  $ frac(\| \( delta_(*) \)_p \| + \| \( delta_(*) \)_(p p) \|, delta_(*)) $
  is uniformly small in the strip. Combining this with its angle equation gives, for a fixed sufficiently large $P_1$,
  #[#set math.equation(numbering: n => "(4.16)")
   $ n_0^(- 1) partial_z \( n_0 partial_z delta_(*) \) < mu^2 delta_(*)
     quad \( p = P_1 \, med 0 lt.eq z lt.eq L \) . $ <eq:inner-strip-inequality>]
  The strict inequality follows by making the horizontal error and $2 d_(*)$ smaller than $mu^2$.
    One-dimensional comparison with $U_0 \( P_1 \, dot.op \)$ now gives $delta_(*) \/ \( pi \/ 2 \) >
    U_0$ for $0 < z lt.eq L$, and the derivative of their difference at $z = 0$ is strictly positive.
    Its quotient by $z$ therefore has a positive minimum on $0 < z lt.eq L$.
    By 12 and continuity of the one-dimensional problem in its positive coefficient,
    this boundary ordering persists for small $lambda$, uniformly over all folded minimizers and all azimuths.
    For this use of continuity, (4.13) gives uniform convergence of $U_lambda$ and $\( U_lambda \)_z$ on the fixed
    segment from uniform convergence and a positive lower bound for its density.
  It follows that
  #[#set math.equation(numbering: n => "(4.17)")
   $ frac(delta \( x \), pi \/ 2) gt.eq U \( p \, z \) quad \( p gt.eq P_1 \, med 0 lt.eq z lt.eq L \) .
     $ <eq:strip-angle-comparison>]
  Here is a comparison proof that also addresses infinity. The difference $v = delta \/ \( pi \/ 2 \) -
    U$ satisfies $\( L_n - q \) v lt.eq 0$ and has nonnegative finite-boundary values.
    Test this inequality with a horizontal cutoff squared times its negative part,
    with the appropriate negative sign. The resulting Caccioppoli inequality is
  $ integral n chi_R^2 \| nabla v_(-) \|^2 + integral n q chi_R^2 v_(-)^2 lt.eq
    4 integral n v_(-)^2 \| nabla chi_R \|^2 . $
  The right side tends to zero because $v_(-)$ is bounded and $n$ is integrable.
    Thus $v_(-)$ is constant and its zero boundary trace makes it zero. No value at infinity has been imposed.
    This proof also makes clear that $theta$ need not be axisymmetric: the coefficient $q$ may depend on azimuth.
    Differentiating the boundary inequality at $z = 0$ gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ - delta_z / delta lt.eq - U_z \( p \, 0 \) . $ <eq:strip-flux-bound>]
  For a real smooth test $xi$ compactly supported sufficiently far out, put $F_1 = delta xi$.
    Integration by parts, with outward normal $- e_z$ on the plane, yields
  #[#set math.equation(numbering: n => "(4.19)")
   $ integral_(Omega_(+)) n delta^2 \| nabla xi \|^2 = integral_(Omega_(+)) n #scale(x: 120%, y: 120%)[\(] \|
     nabla F_1 \|^2 + q \| F_1 \|^2 #scale(x: 120%, y: 120%)[\)] -
     integral_(z = 0) n (- delta_z / delta) \| F_1 \|^2 . $ <eq:delta-transform-boundary>]
  The energy of the solution of (4.11) is
  $ integral_0^L n \( U_z^2 + mu^2 U^2 \) thin d z = - n \( p \, 0 \) U_z \( p \, 0 \) . $
  It minimizes this energy among functions with the same endpoint values.
    Use the trial function $cos \( a z \) F_1$, $a = pi \/ \( 2 L \)$, for each fixed horizontal point.
    The exact identity
  $ \| F'_1 \|^2 + a^2 \| F_1 \|^2 - \| \( cos \( a z \) F_1 \)' \|^2 = \| sin \( a z \) F'_1 +
    a cos \( a z \) F_1 \|^2 $
  gives
  #[#set math.equation(numbering: n => "(4.20)")
   $ n \( p \, 0 \) \( - U_z \( p \, 0 \) \) \| F_1 \( 0 \) \|^2 lt.eq
     integral_0^L n #scale(x: 120%, y: 120%)[\(] \| partial_z F_1 \|^2 + \( mu^2 + a^2 \) \| F_1 \|^2
     #scale(x: 120%, y: 120%)[\)] thin d z . $ <eq:strip-boundary-cost>]
  Thus the boundary term spends at most the vertical gradient energy in the strip,
    together with the indicated $L^2$ cost.
  The remaining gradient energy controls $integral_(Omega_(+)) n \| Y dot.op nabla F_1 \|^2$,
    where $Y$ is the horizontal radial unit vector for $z lt.eq p \/ 4$,
    the spatial radial unit vector for $z gt.eq p \/ 2$, and a smooth convex interpolation between them.
    More explicitly, choose $zeta \( t \) in \[ 0 \, 1 \]$, equal to zero for $t lt.eq
    1 \/ 4$ and one for $t gt.eq 1 \/ 2$, with $\| zeta' \| lt.eq 8$, and set
  $ Y = \( 1 - zeta \( z \/ p \) \) frac(\( x_1 \, x_2 \, 0 \), p) + zeta \( z \/ p \) x / r . $
  On the axis use $Y = x \/ r$. The field has norm at most one and is tangential to the median plane.
    On the interpolation region, $\| nabla \( z \/ p \) \| lt.eq 5 \/ \( 4 r \)$ and $1 \/ p lt.eq
    sqrt(5) \/ \( 2 r \)$. The product rule therefore gives $\| "div" Y \| lt.eq 100 \/ r$.
    For sufficiently distant support it is horizontal throughout $0 lt.eq z lt.eq L$.
    In the interpolation region $p \/ r gt.eq 2 \/ sqrt(5)$; the two drift bounds in (3.3), with $k$ close to one,
    therefore imply
  #[#set math.equation(numbering: n => "(4.21)")
   $ n^(- 1) "div" \( n Y \) lt.eq - 1 $ <eq:outward-weighted-divergence>]
  after increasing the fixed starting radius. There is no boundary contribution when integrating
    $"div" \( n Y \| F_1 \|^2 \)$. Cauchy–Schwarz gives
  $ integral_(Omega_(+)) n \| Y dot.op nabla F_1 \|^2 gt.eq 1 / 4 integral_(Omega_(+)) n \| F_1 \|^2 . $
  Dropping the nonnegative $q$ term in (4.19) and using (4.18), (4.20) proves
  $ integral_(Omega_(+)) n delta^2 \| nabla xi \|^2 gt.eq (1 / 4 - mu^2 - frac(pi^2, 4 L^2)) integral_(Omega_(+))
    n delta^2 \| xi \|^2 . $
  The comparison of $g^2$ with $n delta^2$ yields the coefficient
  #[#set math.equation(numbering: n => "(4.22)")
   $ 2 / pi^2 (1 / 4 - 1 / 100 - pi^2 / 400) > 0.0436 > 0.03 . $ <eq:exterior-gap-constant>]
  This proves (4.14). Real and imaginary parts give complex tests;
    the form-domain approximation described at the beginning of the section gives the general statement. ◻
]

=== 4.3 The full weighted spectral gap <the-full-weighted-spectral-gap>

#thm([Proposition 4.6.])[
  (The gap at the second orbital).  #emph[For sufficiently large $D$ and all sufficiently small $lambda gt.eq 0$,
    every folded minimizing angle satisfies
#[#set math.equation(numbering: n => "(4.23)")
 $ 1 / 2 integral_(upright(bold(R))^3) g^2 \| nabla xi \|^2 gt.eq
   d
   (integral_(upright(bold(R))^3) g^2 \| xi \|^2 - frac(lr(|integral_(upright(bold(R))^3) g^2 xi|)^2,
   integral_(upright(bold(R))^3) g^2)) \, wide xi in H^1 \( g^2 \) . $ <eq:weighted-gap>]

]
] <prop:weighted-gap>

#proof[
  Put $w = g^2$. On the upper half-space, $f = h \/ g > 0$ satisfies
  $ - frac(1, 2 w) "div" \( w nabla f \) = d f . $
  For compact tests inside $Omega_(+)$, the ground-state transform [6] Section 2.3, equation (2.12) gives
  #[#set math.equation(numbering: n => "(4.24)")
   $ 1 / 2 integral_(Omega_(+)) w \| nabla xi \|^2 - d integral_(Omega_(+)) w \| xi \|^2 = 1 /
     2 integral_(Omega_(+)) w f^2 \| nabla \( xi \/ f \) \|^2 gt.eq 0 . $ <eq:odd-ground-transform>]
  Odd tests have zero trace at the plane. The left side of (4.24) is continuous in the weighted form norm.
    Cutoff and local zero-trace approximation therefore extend its nonnegativity to all odd functions in
    $H^1 \( w \)$, proving the odd part of the desired gap.
  We prove the even part by controlling possible loss of weighted norm at infinity. Let $w_0 = 2 b^2$.
    The positive-orbital transform for $b$ identifies $cal(E)_(w_0)$ with the quadratic form of $h_D -
    epsilon.alt_b$, under $xi mapsto sqrt(2) b thin xi$. The identity first holds for compact smooth tests.
    Their density in $H^1 \( w_0 \)$, together with closedness of the Schrödinger form,
    extends it to the full weighted domain: the transformed approximants are Cauchy in the form norm,
    and their $L^2$ limit is $sqrt(2) b thin xi$. No global bound on $nabla log b$ is needed.
    By 3, there is an even spectral gap $Delta_(upright("ev")) > 0.2$:
  #[#set math.equation(numbering: n => "(4.25)")
   $ cal(E)_(w_0) \( xi \) gt.eq Delta_(upright("ev")) integral w_0 \| xi \|^2 quad
     upright("if ") xi upright(" is even and ") integral w_0 xi = 0 . $ <eq:unperturbed-even-gap>]
  In particular it is strictly greater than $d_(*)$, and we choose $D$ so that $d_(*) < 0.03$.
  If the even assertion failed arbitrarily close to zero coupling, there would be $lambda_j arrow.b 0$,
    folded minimizers, and real even tests with
  $ integral w_j xi_j = 0 \, wide integral w_j \| xi_j \|^2 = 1 \, wide limsup_j cal(E)_(w_j) \( xi_j \) lt.eq
    d_(*) \, quad w_j = g_(lambda_j)^2 . $
  Local uniform convergence to $w_0$, and its positive local lower bounds,
    give a subsequence converging weakly in local $H^1$ and strongly in local $L^2$ to an even $xi$.
    Write $s = integral w_0 \| xi \|^2 lt.eq 1$. The limit has mean zero, since
  $ lr(|integral_(\| x \| > R) w_j xi_j|) lt.eq (integral_(\| x \| > R) w_j)^(1 \/ 2) \, $
  and the tails on the right are uniformly small: $w_j lt.eq n_(lambda_j)$, and the latter densities are tight.
    No tightness of $w_j \| xi_j \|^2$ is assumed.
  Choose a smooth radial quadratic partition $chi_R^2 + rho_R^2 = 1$, with $chi_R = 1$ on $r lt.eq R$, $chi_R =
    0$ on $r gt.eq 2 R$, and derivatives of size $O \( R^(- 1) \)$.
    Expanding gradients gives the weighted localization identity, as in the usual IMS formula [16] Section 3, Lemma 3.1:
  $ cal(E)_(w_j) \( xi_j \) = cal(E)_(w_j) \( chi_R xi_j \) + cal(E)_(w_j) \( rho_R xi_j \) - 1 /
    2 integral w_j \( \| nabla chi_R \|^2 + \| nabla rho_R \|^2 \) \| xi_j \|^2 . $
  The last term is $O \( R^(- 2) \)$. For $R gt.eq R_0$, 15, applied to both half-spaces,
    bounds the second term below by $0.03 parallel rho_R xi_j parallel_(L^2 \( w_j \))^2$.
    Local lower semicontinuity and local strong convergence therefore give
  $ liminf_j cal(E)_(w_j) \( xi_j \) gt.eq cal(E)_(w_0) \( chi_R xi \) +
    0.03 (1 - integral w_0 \| chi_R xi \|^2) - O \( R^(- 2) \) . $
  Local lower semicontinuity also gives finite global energy to the limit.
    Letting $R arrow.r oo$ and using (4.25), we obtain
  $ d_(*) gt.eq cal(E)_(w_0) \( xi \) + 0.03 \( 1 - s \) gt.eq Delta_(upright("ev")) s + 0.03 \( 1 - s \) > d_(*) \, $
  a contradiction for every $s in \[ 0 \, 1 \]$. This proves the even assertion uniformly for all folded
    minimizers. Finally, reflection separates the even and odd parts orthogonally in the weighted norm and energy.
    The odd part has zero weighted mean. Combining the two inequalities, and then the real and imaginary parts,
    proves (4.23). ◻
]

=== 4.4 A finite collection of sufficient tests <a-finite-collection-of-sufficient-tests>

The following version will be used for the exact charge prescription.
  It avoids requiring that the selected coupling belong to an unspecified perturbation interval.

#thm([Lemma 4.7.])[
  (A quantitative local test for the gap).  #emph[Let $b \, e \, n_0 \,
    theta_(*)$ be the zero-coupling data for a fixed $D$ whose even gap satisfies $Delta_(upright("ev")) > 0.2$.
    Let $n$ satisfy the hypotheses of 11, be axisymmetric, and let $theta$ be a folded minimizer. Set
$ eta_0 = 10^(- 60) \, wide M gt.eq 10^4 \, wide S = 100 M . $

 Suppose $n$ is $C^2$ on a neighborhood of ${ r gt.eq M }$, $0.99 < k < 1.01$, $0 < d < 0.001$,
   and the following tests hold.]
  + #emph[The two drift bounds of (3.3) hold with $eta = eta_0$ for $r gt.eq M$ on their stated domains.
    For $p gt.eq M \, med 0 lt.eq z lt.eq L$, the bounds (4.10) hold with $eta = eta_0$ and $C = 100$.]
  + #emph[Let $U \, U_0$ be the strip solutions for $n \, n_0$, and suppose
$ alpha = inf_(0 < z lt.eq L) frac(\( 2 \/ pi \) delta_(*) \( M \, z \) - U_0 \( M \, z \), z) > 0 \, wide
  delta_(*) = pi \/ 2 - theta_(*) . $

 Uniformly on the cylinder $p = M \, med 0 lt.eq z lt.eq L$, including all azimuths for $theta$, one has
$ \| partial_z \( theta - theta_(*) \) \| + \| partial_z \( U - U_0 \) \| < alpha \/ 2 . $

]
  + #emph[On $r lt.eq 2 S$, the local weight comparison is
$ 1 / 2 lt.eq frac(g^2, 2 b^2) lt.eq 2 . $

]
  #emph[Then (4.14) holds for tests supported in $r > S$, and the full gap (4.23) holds.]
] <lem:quantitative-gap>

#proof[
  The strip derivative constant in 14 is less than $10^30$.
    The drift coefficient in the strip has absolute value less than $3$,
    so the horizontal error in $L_n U$ is at most $4 dot.op 10^30 eta_0 U$.
    Since $q lt.eq 2 d < 0.002$ and $mu^2 = 0.01$, this proves (4.15) for every $p gt.eq M$.
    At the inner cylinder the function
  $ 2 / pi delta - U - (2 / pi delta_(*) - U_0) $
  vanishes at $z = 0$ and has $z$-derivative of absolute value less than $alpha \/ 2$.
    Its reference term is at least $alpha z$. Thus the required inner boundary ordering is strict.
    The same cutoff comparison proves (4.17) for $p gt.eq M$.
  For $r gt.eq S$, the vector field used above is horizontal throughout the strip. Its weighted divergence is bounded by
  $ - 2 k thin 2 / sqrt(5) + eta_0 + 100 / r < - 1 . $
  All boundary support lies at $p > M$. The flux calculation and (4.22) consequently give the exterior constant
    $0.03$ from radius $S$.
  It remains to prove the even part of the full gap without a perturbative compactness argument.
    Choose a nonnegative smooth radial quadratic partition $chi^2 + rho^2 = 1$ between $S$ and $2 S$, with
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] \| nabla chi \|^2 + \| nabla rho \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq
    10 / S^2 . $
  For an even test $xi in H^1 \( g^2 \)$, put $w = g^2$, $w_0 = 2 b^2$, and choose
  $ c = frac(integral w_0 chi xi, integral w_0 chi) \, wide f = xi - c . $
  The denominator is positive and $integral w_0 chi f = 0$. By the local weight comparison and (4.25),
  $ cal(E)_w \( chi f \) & gt.eq 1 / 2 cal(E)_(w_0) \( chi f \) gt.eq Delta_(upright("ev")) /
    2 parallel chi f parallel_(L^2 \( w_0 \))^2\
 & gt.eq Delta_(upright("ev")) / 4 parallel chi f parallel_(L^2 \( w \))^2 gt.eq
   0.05 parallel chi f parallel_(L^2 \( w \))^2 . $
  The exterior estimate gives $cal(E)_w \( rho f \) gt.eq 0.03 parallel rho f parallel_(L^2 \( w \))^2$.
    Although $f$ need not have compact support, it belongs to $H^1 \( w \)$, because $integral w = 2$;
    thus the established cutoff extension applies. Localization yields
  $ cal(E)_w \( xi \) = cal(E)_w \( f \) gt.eq (0.03 - 10 / S^2) parallel f parallel_(L^2 \( w \))^2 gt.eq
    d thin "Var"_w \( xi \) . $
  The last step uses $d < 0.001$, the stated lower bound on $S$,
    and the fact that subtracting any constant gives squared norm at least the weighted variance.
    The odd ground-state transform (4.24) does not require small coupling and completes the proof,
    including complex tests. ◻
]

== 5 Certification of the ensemble kinetic minimum <sec:ensemble>

We now pass from the weighted spectral estimate to the full fermionic constrained search.
  The argument uses the density regularity from 5, the positive orbitals and their equations from 13, and (4.23).
  These hypotheses will also suffice when they are established by the finite tests in 7.

=== 5.1 Ensembles and the Pauli bound <ensembles-and-the-pauli-bound>

An ensemble is a positive trace-class operator $Gamma$ on $frak(H)_3 = and.big^3 frak(h)$, where $frak(h) =
  L^2 \( upright(bold(R))^3 \; upright(bold(C))^2 \)$, with $"Tr" Gamma = 1$.
  Its one-particle reduced density matrix $gamma_Gamma$ is characterized by

#[#set math.equation(numbering: n => "(5.1)")
 $ "Tr" \( gamma_Gamma A \) = "Tr" (Gamma sum_(i = 1)^3 A_i) wide
   upright("for every bounded operator ") A upright(" on ") frak(h) . $ <eq:ensemble-rdm>]

In particular, $gamma_Gamma gt.eq 0$ and $"Tr" gamma_Gamma = 3$.
  For any unit spin orbital $f in frak(h)$, the number operator $sum_i \( \| f chevron.r chevron.l f \| \)_i$ is
  an orthogonal projection on $frak(H)_3$. Indeed, extend $f$ to an orthonormal basis of $frak(h)$.
  In the induced wedge basis, this operator has eigenvalue one precisely on the determinants that contain $f$,
  and zero otherwise. Its expectation is therefore at most one. Applying (5.1) gives

#[#set math.equation(numbering: n => "(5.2)")
 $ 0 lt.eq gamma_Gamma lt.eq "id" \, wide "Tr" gamma_Gamma = 3 . $ <eq:ensemble-pauli>]

This argument permits arbitrary complex spinors and arbitrary spin coherences.

Write the spectral decomposition over positive eigenvalues as $gamma_Gamma =
  sum_j nu_j \| psi_j chevron.r chevron.l psi_j \|$. The spin-summed density and kinetic expectation are

#[#set math.equation(numbering: n => "(5.3)")
 $ n_Gamma \( x \) & = sum_j nu_j \| psi_j \( x \) \|_(upright(bold(C))^2)^2 \,\
T \[ Gamma \] & = 1 / 2 sum_j nu_j parallel nabla psi_j parallel_2^2 . $ <eq:ensemble-density>]

The second expression takes the value $+ oo$ if necessary;
  for finite kinetic expectation every $psi_j$ with $nu_j >
  0$ belongs to $H^1 \( upright(bold(R))^3 \; upright(bold(C))^2 \)$.
  It equals the expectation of the three-electron kinetic-energy form,
  by applying (5.1) to increasing bounded spectral truncations of $- Delta \/ 2$ and using monotone convergence.
  The ensemble constrained-search value is

#[#set math.equation(numbering: n => "(5.4)")
 $ T_(upright("ens")) \[ n \] = inf { T \[ Gamma \] : Gamma gt.eq 0 \, med "Tr" Gamma = 1 \, med n_Gamma =
   n } . $ <eq:ensemble-search>]

Set $hat(g) = g \/ sqrt(2)$, and let $P_g$ denote the orthogonal projection onto the normalized spatial orbital
  $hat(g)$. The orbitals $hat(g)$ and $h$ are orthonormal by their norms and parity. Thus

#[#set math.equation(numbering: n => "(5.5)")
 $ Phi_theta = \( hat(g) arrow.t \) and \( hat(g) arrow.b \) and \( h arrow.t \) $ <eq:ensemble-determinant>]

is a normalized determinant, with finite kinetic energy and density $2 hat(g)^2 + h^2 = g^2 + h^2 = n$.

#thm([Proposition 5.1.])[
  (An ensemble kinetic certificate).  #emph[Assume the density regularity of 5, the orbital hypotheses of 13,
    and the weighted gap (4.23). Then the formal potential $V$ satisfies $integral_(upright(bold(R))^3) n \|
    V \| < oo$. Every ensemble with density $n$ and finite kinetic energy obeys
#[#set math.equation(numbering: n => "(5.6)")
 $ T \[ Gamma \] + integral_(upright(bold(R))^3) V n gt.eq d . $ <eq:ensemble-certificate>]

 The determinant $Phi_theta$ attains equality. Consequently,
#[#set math.equation(numbering: n => "(5.7)")
 $ T_(upright("ens")) \[ n \] = T \[ \| Phi_theta chevron.r chevron.l Phi_theta \| \] = d -
   integral_(upright(bold(R))^3) V n . $ <eq:ensemble-minimum>]

]
] <prop:ensemble-certificate>

#proof[
  We first verify the absolute integrability required to use $V$.
    By 5, $Delta n in L^1 \( upright(bold(R))^3 \)$ and $sqrt(n) in H^1 \( upright(bold(R))^3 \)$.
    Local positivity and regularity give the almost-everywhere identity
  $ sqrt(n) thin Delta sqrt(n) = 1 / 2 Delta n - \| nabla sqrt(n) \|^2 . $
  Using the formula for $V$ in 13, the finite angle energy and $integral n sin^2 theta = 1$, we obtain
  #[#set math.equation(numbering: n => "(5.8)")
   $ integral n \| V \| lt.eq 1 / 4 parallel Delta n parallel_1 + 1 / 2 parallel nabla sqrt(n) parallel_2^2 + 1 /
     2 integral n \| nabla theta \|^2 + d < oo . $ <eq:ensemble-V-integrability>]
  The local assertion $V in L_(upright("loc"))^2$ was proved in 13.
  For a scalar orbital $f$, consider the quadratic expression
  $ q_V \[ f \] = 1 / 2 integral \| nabla f \|^2 + integral V \| f \|^2 \, wide f in cal(E)_V :=
    {f in H^1 \( upright(bold(R))^3 \) : integral \| V \| \| f \|^2 < oo} . $
  Only this expression on its indicated test class is needed;
    we do not assume an ordinary Hamiltonian or a closed form with potential $V$.
    For $f in C_c^oo \( upright(bold(R))^3 \; upright(bold(C)) \)$, the function $f \/ g$ is admissible in (4.23),
    since $g$ is positive and bounded below on each compact set.
    Testing $\( - Delta \/ 2 + V \) g = 0$ locally with $\| f \|^2 \/ g$ gives the positive-orbital identity
  #[#set math.equation(numbering: n => "(5.9)")
   $ q_V \[ f \] = 1 / 2 integral g^2 lr(|nabla (f / g)|)^2 gt.eq
     d (parallel f parallel_2^2 - \| chevron.l hat(g) \, f chevron.r \|^2) . $ <eq:ensemble-orbital-bound>]
  The identity uses real parts in the gradient expansion and therefore holds for complex $f$ as well.
    This is the positive ground-state representation; see [6] Section 2.3, equation (2.12).
  We record the extension of (5.9) carefully. On a fixed compact set,
    $H^1$ approximation by smooth functions passes through the potential integral:
    $V in L^2$ there and strong $H^1$ convergence implies strong $L^4$ convergence,
    hence convergence of the squared moduli in $L^2$. Thus the inequality holds for compactly supported $H^1$
    orbitals. Choose real cutoffs $0 lt.eq chi_R lt.eq 1$ that equal one on $\| x \| lt.eq R$,
    vanish on $\| x \| gt.eq 2 R$, and satisfy $\| nabla chi_R \| lt.eq C \/ R$.
    For $f in cal(E)_V$, $chi_R f arrow.r f$ in $H^1$, while dominated convergence gives $integral V \| chi_R
    f \|^2 arrow.r integral V \| f \|^2$. The projection term also converges in $L^2$.
    This proves (5.9) on all of $cal(E)_V$.
  Apply this scalar inequality to both components of a spinor $psi$.
    With $tilde(P)_g = P_g ⊗ "id"_(upright(bold(C))^2)$, the resulting estimate is
  #[#set math.equation(numbering: n => "(5.10)")
   $ 1 / 2 parallel nabla psi parallel_2^2 + integral V \| psi \|_(upright(bold(C))^2)^2 gt.eq
     d #scale(x: 120%, y: 120%)[\(] parallel psi parallel_2^2 - chevron.l psi \,
     tilde(P)_g psi chevron.r #scale(x: 120%, y: 120%)[\)] . $ <eq:ensemble-spinor-bound>]
  Now let $Gamma$ have density $n$ and finite kinetic expectation. By (5.3), (5.8) and Tonelli’s theorem,
  $ sum_j nu_j integral \| V \| \| psi_j \|_(upright(bold(C))^2)^2 = integral \| V \| n < oo . $
  Hence every occupied natural spin orbital belongs componentwise to $cal(E)_V$,
    and the potential terms can be summed absolutely. Summing (5.10) and using (5.2) gives
  $ T \[ Gamma \] + integral V n & gt.eq d ("Tr" gamma_Gamma - "Tr" \( gamma_Gamma tilde(P)_g \))\
 & gt.eq d \( 3 - 2 \) = d . $
  Here $tilde(P)_g$ has rank two and $0 lt.eq gamma_Gamma lt.eq "id"$. No rank bound on $Gamma$ is used.
  Finally, the orbitals $hat(g) \, h$ belong to $cal(E)_V$ by (5.8).
    If $f$ denotes either of them, with respective energy $epsilon = 0 \, d$,
    testing its distributional equation by $chi_R^2 f$ gives
  $ q_V \[ chi_R f \] = epsilon parallel chi_R f parallel_2^2 + 1 / 2 integral \| nabla chi_R \|^2 \| f \|^2 . $
  All terms converge as above, so $q_V \[ hat(g) \] = 0$ and $q_V \[ h \] = d$.
    The determinant in (5.5) therefore satisfies
  $ T \[ \| Phi_theta chevron.r chevron.l Phi_theta \| \] + integral V n = 2 q_V \[ hat(g) \] + q_V \[ h \] = d . $
  This proves the minimum over all ensembles with finite kinetic energy;
    ensembles with infinite kinetic expectation cannot lower it. ◻
]

=== 5.2 Identification of a representing potential <identification-of-a-representing-potential>

#thm([Proposition 5.2.])[
  (Transfer to a representing Hamiltonian).  #emph[Assume the hypotheses of 18.
    Let $v in L^(3 \/ 2) \( upright(bold(R))^3 \) + L^oo \( upright(bold(R))^3 \)$ be real and spin independent,
    and let $h_v = - Delta \/ 2 + v$ be its spatial one-particle operator,
    defined by the closed form on $H^1 \( upright(bold(R))^3 \)$.
    Suppose $H_v = sum_(i = 1)^3 \( h_v ⊗ "id"_(upright(bold(C))^2) \)_i$ on $frak(H)_3$ has a ground eigenspace
    supporting an ensemble $Gamma_s$ with $n_(Gamma_s) = n$. Then $Phi_theta$ belongs to that ground eigenspace,
    and there is a real constant $e_g$ such that
#[#set math.equation(numbering: n => "(5.11)")
 $ h_v g = e_g g \, wide v = V + e_g quad upright("almost everywhere") . $ <eq:ensemble-potential-identification>]

 In particular, $V in L^(3 \/ 2) \( upright(bold(R))^3 \) + L^oo \( upright(bold(R))^3 \)$.]
] <prop:potential-identification>

#proof[
  The potential class supplies, for every $epsilon > 0$, a constant $C_epsilon$ such that
  #[#set math.equation(numbering: n => "(5.12)")
   $ integral \| v \| \| f \|^2 lt.eq epsilon thin 1 / 2 parallel nabla f parallel_2^2 +
     C_epsilon parallel f parallel_2^2 \, wide f in H^1 \( upright(bold(R))^3 \) . $ <eq:ensemble-standard-form-bound>]
  Indeed, write $v = v_1 + v_oo$ and truncate $v_1$ at a sufficiently large amplitude.
    Its remaining $L^(3 \/ 2)$ tail has arbitrarily small norm and is controlled by the Sobolev inequality;
    the truncated part and $v_oo$ are bounded. Summing (5.12) over spins and particles gives
  $ q_(H_v) \[ Xi \] gt.eq frac(1 - epsilon, 2) sum_(i = 1)^3 parallel nabla_i Xi parallel_2^2 -
    3 C_epsilon parallel Xi parallel_2^2 $
  on the many-electron $H^1$ form domain. If $E = inf sigma \( H_v \)$,
    every normalized vector in its ground eigenspace consequently has kinetic expectation at most
    $\( E + 3 C_epsilon \) \/ \( 1 - epsilon \)$ for any $0 < epsilon < 1$.
    Expanding $Gamma_s$ in its trace-class spectral decomposition proves that $T \[ Gamma_s \] < oo$,
    even for an infinite-dimensional ground eigenspace. The absolute potential expectation is finite by the same
    form bound, and
  $ E = T \[ Gamma_s \] + integral v n . $
  By 18, the determinant has no larger kinetic expectation and has the same density. Thus
  $ E lt.eq q_(H_v) \[ Phi_theta \] = T \[ \| Phi_theta chevron.r chevron.l Phi_theta \| \] + integral v n lt.eq
    T \[ Gamma_s \] + integral v n = E . $
  The square-root representation of the closed form [10] Chapter VI,
    Theorem 2.23 shows that equality at its bottom implies $\( H_v - E \)^(1 \/ 2) Phi_theta = 0$.
    Hence $Phi_theta$ is itself a ground-state eigenvector.
  It remains to extract a spatial eigenfunction without any assumption on the other ground states or on the
    multiplicities of one-particle levels. Denote the sesquilinear form of $h_v$ by
  $ q_v \( f_1 \, f_2 \) = 1 / 2 integral nabla overline(f_1) dot.op nabla f_2 + integral v overline(f_1) f_2 \, $
  linear in its second argument. For $f in H^1 \( upright(bold(R))^3 \)$,
    replace the single down-spin orbital in (5.5) and set
  $ Xi_f = \( hat(g) arrow.t \) and \( f arrow.b \) and \( h arrow.t \) . $
  This vector lies in the many-electron form domain. Expanding the one-body form between these determinants,
    spin orthogonality and $chevron.l hat(g) \, h chevron.r = 0$ give
  $ q_(H_v) \( Phi_theta \, Xi_f \) & = q_v \( hat(g) \, f \)\
 & quad + chevron.l hat(g) \, f chevron.r #scale(x: 120%, y: 120%)[\(] q_v \( hat(g) \, hat(g) \) +
   q_v \( h \, h \) #scale(x: 120%, y: 120%)[\)] . $
  If $chevron.l hat(g) \, f chevron.r = 0$, then $Xi_f$ is orthogonal to $Phi_theta$,
    and the ground-state form equation makes the left side zero. Therefore
  $ q_v \( hat(g) \, f \) = 0 wide upright("whenever ") chevron.l hat(g) \, f chevron.r = 0 . $
  Put $e_g = q_v \( hat(g) \, hat(g) \) in upright(bold(R))$.
    Decomposing an arbitrary $f in H^1$ into its component parallel to $hat(g)$ and its orthogonal component yields
  $ q_v \( hat(g) \, f \) = e_g chevron.l hat(g) \, f chevron.r wide \( f in H^1 \) . $
  By Hermitian symmetry this is equivalent to $q_v \( f \, hat(g) \) = e_g chevron.l f \, hat(g) chevron.r$.
    The closed-form representation theorem [10] Chapter VI, Theorem 2.1(iii) therefore gives $hat(g) in
    "Dom" \( h_v \)$ and $h_v hat(g) = e_g hat(g)$.
  Subtracting $\( - Delta \/ 2 + V \) g = 0$ now gives $\( v - V - e_g \) g = 0$ in distributions.
    The product is locally integrable: $v in L_(upright("loc"))^(3 \/ 2)$, $V in L_(upright("loc"))^2$,
    and $g in H_(upright("loc"))^2$ is locally bounded. Since $g$ is continuous and strictly positive,
    division on each compact set proves $v = V + e_g$ almost everywhere.
    Adding a constant preserves the stated potential class, completing the proof. ◻
]

== 6 The obstruction from the median plane <sec:obstruction>

We now fix the density and angle; no parameter tends to zero in this section.
  We use the following analytic properties established above:
  $n > 0$ is continuous, even under reflection in $z = 0$, and axisymmetric,
  with $integral_(upright(bold(R))^3) n = 3$. We retain the regularity $n in H^2 \( upright(bold(R))^3 \)$,
  $sqrt(n) in H^1 \( upright(bold(R))^3 \)$, and $Delta n in L^1 \( upright(bold(R))^3 \)$ from 5.
  The angle $theta$ is odd, locally $C^1$, and $0 < theta < pi \/ 2$ on $z > 0$.
  It has finite weighted gradient energy and satisfies

#[#set math.equation(numbering: n => "(6.1)")
 $ "div" \( n nabla theta \) = - d n sin \( 2 theta \) \, wide d > 0 . $ <eq:obstruction-angle>]

The orbitals and the formal potential have the properties

#[#set math.equation(numbering: n => "(6.2)")
 $ g = sqrt(n) cos theta > 0 \, wide h = sqrt(n) sin theta \, wide parallel g parallel_2^2 = 2 \, quad
   parallel h parallel_2^2 = 1 \,\
g \, h in H^1 \( upright(bold(R))^3 \) ∩ H_(upright("loc"))^2 \( upright(bold(R))^3 \) \, wide V =
  frac(Delta g, 2 g) in L_(upright("loc"))^2 \( upright(bold(R))^3 \) \, wide
  integral_(upright(bold(R))^3) n \| V \| < oo \,\
(- 1 / 2 Delta + V) g = 0 \, wide (- 1 / 2 Delta + V) h = d h quad
  upright("in distributions") . $ <eq:obstruction-normalization>]

In particular, $g$ and $V$ are even and $h$ is odd under the reflection.
  These are the conclusions of Proposition 4.3, Proposition 5.1;
  the arguments below use only the displayed analytic properties, rather than a small-coupling hypothesis.
  The density translation limits and the planar lower bound will be invoked with fixed $k > 0$,
  $beta in upright(bold(R))$, and $A \( r \) = e^(- k r) r^beta$.

Suppose provisionally that

#[#set math.equation(numbering: n => "(6.3)")
 $ V in L^(3 \/ 2) \( upright(bold(R))^3 \) + L^oo \( upright(bold(R))^3 \) . $ <eq:admissible-formal-potential>]

Then the quadratic form

$ q_V \[ u \] = 1 / 2 integral_(upright(bold(R))^3) \| nabla u \|^2 + integral_(upright(bold(R))^3) V \| u \|^2 \,
  wide u in H^1 \( upright(bold(R))^3 \) \, $

is closed and bounded below. Indeed, truncating the $L^(3 \/ 2)$ part leaves an arbitrarily small $L^(3 \/ 2)$
  norm, whose form is controlled by Sobolev’s inequality; the truncated part and the original bounded part are
  bounded multipliers. The same estimate shows that the distributional identities in (6.2) extend, by density,
  to all $H^1$ form tests. Thus $g$ and $h$ are eigenfunctions of this ordinary form operator at energies $0$ and
  $d$, respectively.

=== 6.1 Limits of translated potentials and orbitals <limits-of-translated-potentials-and-orbitals>

#thm([Lemma 6.1.])[
  (Compactness under escaping translations).  #emph[Write $V = V_(upright(c)) + V_(upright(b))$,
    where $V_(upright(c)) in L^(3 \/ 2) \( upright(bold(R))^3 \)$ and $V_(upright(b)) in
    L^oo \( upright(bold(R))^3 \)$. If $\| y_j \| arrow.r oo$, then
$ V_(upright(c)) \( y_j + dot.op \) arrow.r 0 quad upright("in ")
  L_(upright("loc"))^(3 \/ 2) \( upright(bold(R))^3 \) . $

 After passing to a subsequence there is a real bounded function $W$ such that
$ V_(upright(b)) \( y_j + dot.op \) harpoon.rt^(*) W quad upright("locally in ") L^oo \, wide
  parallel W parallel_oo lt.eq parallel V_(upright(b)) parallel_oo . $

 Suppose, in addition, that $u_j in H_(upright("loc"))^1$ solves
$ (- 1 / 2 Delta + V \( y_j + dot.op \)) u_j = epsilon u_j $

 for one fixed real $epsilon$, and that $u_j$ is bounded in $L^2$ on every compact set.
   A further subsequence converges strongly in $L_(upright("loc"))^2$ and weakly in $H_(upright("loc"))^1$ to a
   solution of
$ (- 1 / 2 Delta + W) u = epsilon u . $

]
] <lem:translated-orbital-compactness>

#proof[
  Every fixed translated ball eventually lies in an arbitrarily distant tail of $V_(upright(c))$,
    proving its norm convergence. Weak-star compactness and a diagonal subsequence on expanding balls give $W$.
  To prove the assertion about solutions, let $chi$ be a smooth compact cutoff.
    Testing the equation with $chi^2 u_j$ and taking the real part gives the usual cutoff identity.
    Its possibly negative critical-potential term is bounded by
  $ integral \| V_(upright(c)) \( y_j + x \) \| thin \| chi u_j \|^2 thin d x lt.eq
    C_(upright(S)) parallel V_(upright(c)) \( y_j + dot.op \) parallel_(L^(3 \/ 2) \( "supp" chi \)) parallel
    nabla \( chi u_j \) parallel_2^2 . $
  For large $j$ this is absorbed into the kinetic term. The bounded potential, the eigenvalue,
    and the cutoff derivative are controlled by the assumed local $L^2$ bounds.
    Hence the sequence is bounded in local $H^1$. Rellich compactness gives the stated convergences.
  For a compact smooth test $phi$, the critical-potential term tends to zero by Hölder’s and Sobolev’s
    inequalities. The bounded-potential term passes to the limit because $u_j phi arrow.r
    u phi$ in $L^1$ and the multipliers are uniformly bounded,
    while their pairing with the fixed function $u phi$ converges weak star.
    The gradient term passes by weak convergence. This proves the limiting equation. ◻
]

#thm([Proposition 6.2.])[
  (The unique potential limit at infinity).  #emph[Assume (6.3) and the density translation limits (3.6), (3.7).
    For every sequence $\| y_j \| arrow.r oo$, every local weak-star subsequential limit of
    $V_(upright(b)) \( y_j + dot.op \)$ is the constant
#[#set math.equation(numbering: n => "(6.4)")
 $ c_oo = d + k^2 / 2 . $ <eq:potential-limit-constant>]

]
] <prop:potential-limits>

#proof[
  #strong[Centers on the median plane.] First let $y_j = p_j omega_j$, where $p_j arrow.r oo$,
    $omega_j dot.op e_z = 0$, $\| omega_j \| = 1$, and, after subselection, $omega_j arrow.r omega_(*)$. Put
  $ c_j = frac(A \( p_j \), p_j) \, wide g_j \( x \) = frac(g \( y_j + x \), c_j) \, wide h_j \( x \) =
    frac(h \( y_j + x \), c_j) . $
  By (3.6), for a constant $a_(*) > 0$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ g_j^2 + h_j^2 = frac(n \( y_j + dot.op \), c_j^2) arrow.r a_(*)^2 z^2 e^(- 2 k omega_(*) dot.op x) quad
     upright("locally uniformly") . $ <eq:plane-normalized-orbitals>]
  In particular these orbitals are locally bounded. Take any subsequential bounded-potential limit $W$.
    By 20, a further subsequence has limits $g_oo \, h_oo$ satisfying the two orbital equations with potential $W$
    and energies $0 \, d$. Their strong local $L^2$ convergence and (6.5) give
  $ 0 lt.eq g_oo \( x \) lt.eq a_(*) \| z \| e^(- k omega_(*) dot.op x) \, wide g_oo^2 + h_oo^2 =
    a_(*)^2 z^2 e^(- 2 k omega_(*) dot.op x) quad upright("a.e.") $
  Since $W$ is bounded, local elliptic regularity makes $g_oo$ continuous.
    It vanishes on the interior plane $z = 0$. The local Harnack inequality for a nonnegative solution with
    bounded zeroth-order coefficient [17] Lecture 18, Theorem 1 forces $g_oo equiv 0$;
    no sign condition on $W$ is needed. The sign of $h$ on each half-space therefore determines
  $ h_oo \( x \) = a_(*) z e^(- k omega_(*) dot.op x) . $
  Because $omega_(*) dot.op e_z = 0$, its Laplacian is $k^2 h_oo$.
    The limiting equation gives $\( W - d - k^2 \/ 2 \) h_oo = 0$.
    This determines $W = c_oo$ almost everywhere; the plane where $h_oo = 0$ has zero volume.
  #strong[A positive angle bound above the plane.] We next show
  #[#set math.equation(numbering: n => "(6.6)")
   $ inf_(x_1 \, x_2 in upright(bold(R))) theta \( x_1 \, x_2 \, 1 \) > 0 . $ <eq:angle-plane-parallel-lower-bound>]
  On each compact subset of the open upper half-space, the normalized density in (6.5) is uniformly bounded above
    and below by positive constants. The translated angle solves
  $ "div" #h(-0.16667em) (frac(n \( y_j + x \), c_j^2) nabla theta \( y_j + x \)) = -
    d frac(n \( y_j + x \), c_j^2) sin #scale(x: 120%, y: 120%)[\(] 2 theta \( y_j + x \)
    #scale(x: 120%, y: 120%)[\)] . $
  On each such compact set the scalar coefficients have uniform positive lower and finite upper bounds,
    and the right-hand sides are uniformly bounded. Local energy estimates and the interior Hölder estimate for
    uniformly elliptic divergence-form equations [17] Lecture 18,
    Theorem 3 therefore give local uniform compactness of the bounded angles.
    These estimates require no bounds on derivatives of the normalized densities. The identity
  $ g_j = sqrt(n \( y_j + dot.op \) \/ c_j^2) cos theta \( y_j + dot.op \) \, $
  together with $g_oo = 0$, implies that every such angle limit equals $pi \/ 2$.
    Consequently $theta \( x_1 \, x_2 \, 1 \) arrow.r pi \/ 2$ as $x_1^2 + x_2^2 arrow.r oo$.
    On the remaining compact part it has a strictly positive minimum, proving (6.6).
  Choose $m in \( 0 \, pi \/ 2 \)$ below this infimum. In $z > 1$, the angle is a supersolution of $-
    "div" \( n nabla theta \) gt.eq 0$. For $w = \( m - theta \)_(+)$, whose trace on $z = 1$ is zero,
    test with $chi_R^2 w$, where $chi_R$ is a spatial cutoff with $\| nabla chi_R \| lt.eq C \/ R$.
    The resulting estimate is
  $ integral_(z > 1) n chi_R^2 \| nabla w \|^2 lt.eq 4 integral_(z > 1) n w^2 \| nabla chi_R \|^2 arrow.r 0 . $
  Here $w$ is bounded and $n$ is integrable. Thus $w$ is constant on this connected half-space,
    and its zero trace makes it zero. We have proved $theta gt.eq m$ throughout $z gt.eq 1$.
  #strong[Centers whose heights diverge.] Set $delta = pi \/ 2 - theta$ on the upper half-space. On $z gt.eq 1$,
  $ 0 lt.eq delta lt.eq pi / 2 - m \, wide "div" \( n nabla delta \) = d n sin \( 2 delta \) \, wide
    d sin \( 2 delta \) gt.eq c_0 delta $
  for some $c_0 > 0$. The last assertion follows by minimizing the continuous positive function $d
    sin \( 2 s \) \/ s$ on $\[ 0 \, pi \/ 2 - m \]$, with its value at zero defined as $2 d$.
  Now let $\( y_j \)_3 arrow.r + oo$, and pass to a subsequence with $y_j \/ \| y_j \| arrow.r omega_(*)$. By (3.7),
  $ N_j \( x \) = frac(n \( y_j + x \), n \( y_j \)) arrow.r N_oo \( x \) = e^(- 2 k omega_(*) dot.op x) quad
    upright("locally uniformly") . $
  The same local energy and Hölder estimates give, along a subsequence,
    local uniform and weak local $H^1$ convergence of $delta \( y_j + dot.op \)$ to a bounded nonnegative function
    $w$. Passing the divergence equation to the limit requires only the displayed uniform convergence of the
    coefficients, not convergence of their derivatives. We obtain
  $ "div" \( N_oo nabla w \) = d N_oo sin \( 2 w \) \, wide \( Delta - 2 k omega_(*) dot.op nabla \) w =
    d sin \( 2 w \) gt.eq c_0 w . $
  Local elliptic regularity makes $w$ smooth. A short maximum-principle argument shows that $w = 0$.
    Indeed, for $epsilon > 0$ subtract $epsilon rho \( x \)$, where $rho \( x \) = sqrt(1 + \| x \|^2)$.
    The boundedness of $w$ implies that $w - epsilon rho$ attains a global maximum at some $x_epsilon$. At that point,
  $ c_0 w \( x_epsilon \) lt.eq \( Delta - 2 k omega_(*) dot.op nabla \) w \( x_epsilon \) lt.eq
    epsilon \( 3 + 2 k \) \, $
  since $\| nabla rho \| lt.eq 1$ and $Delta rho lt.eq 3$. Comparing the maximum with any fixed point $x_0$ gives
    $w \( x_0 \) lt.eq epsilon rho \( x_0 \) + epsilon \( 3 + 2 k \) \/ c_0$.
    Letting $epsilon arrow.b 0$ proves the assertion.
  It follows that $delta \( y_j + dot.op \) arrow.r 0$ locally uniformly along every such sequence. Hence
  $ frac(h \( y_j + x \), sqrt(n \( y_j \))) = sqrt(N_j \( x \)) cos delta \( y_j + x \) arrow.r
    e^(- k omega_(*) dot.op x) quad upright("locally uniformly") . $
  Apply 20 to this normalized orbital along any subsequence on which the bounded potentials converge.
    Its limiting eigenfunction equation again identifies $W = d + k^2 \/ 2$,
    since the limiting exponential is everywhere positive. Reflection treats centers with heights tending to $-
    oo$. Let $cal(R)$ denote reflection in the median plane. Since $V$ is even, its arbitrary decomposition satisfies
  $ V_(upright(b)) \( cal(R) x \) - V_(upright(b)) \( x \) = V_(upright(c)) \( x \) - V_(upright(c)) \( cal(R) x \) . $
  Escaping translates of the right side tend to zero in local $L^(3 \/ 2)$.
    The left side is uniformly bounded, so its local weak-star limits are also zero.
    Reflecting the center and local coordinates therefore gives the same constant limit for negative heights.
  #strong[All remaining sequences.] Given any escaping sequence, its heights have a subsequence that tends to $+
    oo$, tends to $- oo$, or converges to a finite number. The first two cases were just proved.
    In the third, project the centers onto the median plane. Their horizontal radii tend to infinity,
    and the original centers differ from these plane centers by convergent bounded displacements.
    The plane-centered conclusion therefore applies. To justify the moving displacement for weak-star convergence,
    translate each fixed compactly supported $L^1$ test by the negative displacement;
    these tests converge in $L^1$, while the multipliers stay uniformly bounded.
    Thus their limit remains the same constant. These cases exhaust every subsequential bounded-potential limit. ◻
]

=== 6.2 From translated limits to an exterior form bound <from-translated-limits-to-an-exterior-form-bound>

#thm([Lemma 6.3.])[
  (Uniform exterior form convergence).  #emph[Let $V = V_(upright(c)) + V_(upright(b))$ be as in 20.
    Suppose every bounded-potential limit along escaping translates is a fixed constant $c_oo$.
    For every $epsilon > 0$ there is $R_epsilon < oo$ such that
#[#set math.equation(numbering: n => "(6.7)")
 $ q_V \[ u \] gt.eq (1 / 2 - epsilon) parallel nabla u parallel_2^2 + \( c_oo - epsilon \) parallel u
   parallel_2^2 $ <eq:exterior-form-coercivity>]

 for every $u in H^1 \( upright(bold(R))^3 \)$ vanishing almost everywhere on ${ \| x \| < R_epsilon }$.]
] <lem:exterior-form-limit>

#proof[
  Fix a ball $B_L$. We first claim
  #[#set math.equation(numbering: n => "(6.8)")
   $ sup_(u in H_0^1 \( B_L \)\
parallel u parallel_(H^1 \( B_L \)) lt.eq
  1)
  lr(|integral_(B_L) #scale(x: 120%, y: 120%)[\(] V \( y + x \) - c_oo #scale(x: 120%, y: 120%)[\)] \| u \(
  x \) \|^2 thin d x|) arrow.r 0 wide \( \| y \| arrow.r oo \) . $ <eq:local-form-uniformity>]
  Sobolev’s inequality and the vanishing local $L^(3 \/ 2)$ norm prove the claim for the critical part.
    If the bounded part failed, choose escaping centers and tests violating it.
    Extract a weak-star subsequence of the bounded multipliers and a subsequence of the tests converging strongly
    in $L^2 \( B_L \)$. Their squares converge in $L^1$, because
  $ parallel \| u_j \|^2 - \| u \|^2 #scale(x: 120%, y: 120%)[parallel]_1
    lt.eq \( parallel u_j parallel_2 + parallel u parallel_2 \) parallel u_j - u parallel_2 . $
  Uniform boundedness of the multipliers handles this changing test, and their weak-star limit is $c_oo$.
    This contradicts the selected violation and proves (6.8).
  Choose once and for all a smooth, locally finite quadratic partition $sum_ell chi_ell^2 =
    1$ with uniformly bounded overlap, each $chi_ell$ supported in a ball of one fixed radius,
    and $sum_ell \| nabla chi_ell \|^2 lt.eq K$. For any prescribed $eta > 0$,
    (6.8) applies with error $eta$ to all these balls whose centers are sufficiently distant.
    If $u$ is supported sufficiently far out, every nonzero $chi_ell u$ has such a center.
    Summing the local potential estimates gives
  $ lr(|integral \( V - c_oo \) \| u \|^2|) & lt.eq eta sum_ell parallel chi_ell u parallel_(H^1)^2\
 & lt.eq eta parallel nabla u parallel_2^2 + eta \( 1 + K \) parallel u parallel_2^2 . $
  Here the cross terms cancel because $sum_ell chi_ell nabla chi_ell = 0$.
    Choosing $eta lt.eq epsilon \/ \( 1 + K \)$ proves (6.7).
    This argument uses a uniform local form estimate, not a pointwise limit of $V$. ◻
]

=== 6.3 The weighted trace contradiction <the-weighted-trace-contradiction>

#thm([Theorem 6.4.])[
  (A fixed-density obstruction).  #emph[Let $n \, theta \, g \, h \, V \,
    d$ have the analytic properties stated at the beginning of this section, with $d > 0$.
    Suppose that (3.5), (3.6), (3.7) hold with fixed $k > 0$ and $beta$, and that the weighted gap (4.23) holds. Then
$ V in.not L^(3 \/ 2) \( upright(bold(R))^3 \) + L^oo \( upright(bold(R))^3 \) . $

 Moreover, $n$ is not the density of a ground-state ensemble of any three-electron noninteracting Hamiltonian with
   a single real, spin-independent potential in this class. These hypotheses are all fixed-parameter hypotheses;
   no perturbative neighborhood is required.]
] <thm:obstruction>

#proof[
  Assume first that (6.3) holds. Proposition 6.2, Lemma 6.3 give (6.7) with $c_oo = d + k^2 \/ 2$. Since $d > 0$, choose
  #[#set math.equation(numbering: n => "(6.9)")
   $ k < a < sqrt(k^2 + 2 d) \, wide 0 < epsilon < min {1 / 2 \, c_oo - a^2 / 2} . $ <eq:agmon-exponent-choice>]
  We use the exponential-weight method [1], spelling out the estimate and its $H^1$ conclusion for the form bound
    obtained here.
  Let $eta$ be a smooth cutoff which vanishes on the ball required by (6.7) and equals one outside a slightly
    larger ball. With $rho \( x \) = sqrt(1 + \| x \|^2)$, put
  $ f_T \( x \) = a min { rho \( x \) \, T } \, wide u_T = eta e^(f_T) g . $
  The function $f_T$ is bounded and Lipschitz with $\| nabla f_T \| lt.eq a$.
    Thus $u_T in H^1$, and the weak eigenfunction equation for $g$ may be tested with $eta^2 e^(2 f_T) g$.
    Expanding the gradient gives the exact identity
  #[#set math.equation(numbering: n => "(6.10)")
   $ q_V \[ u_T \] = 1 / 2 integral g^2 \| nabla \( eta e^(f_T) \) #scale(x: 120%, y: 120%)[\|]^2 .
     $ <eq:agmon-cutoff-identity>]
  The part with $eta^2 \| nabla f_T \|^2$ is at most $a^2 parallel u_T parallel_2^2$.
    All terms involving $nabla eta$, including the cross term, are supported in a fixed compact annulus,
    where $f_T lt.eq a rho$ independently of $T$. Consequently
  $ q_V \[ u_T \] lt.eq a^2 / 2 parallel u_T parallel_2^2 + C $
  with $C$ independent of $T$. Combining this with the exterior form bound yields
  $ (1 / 2 - epsilon) parallel nabla u_T parallel_2^2 + (c_oo - epsilon - a^2 / 2) parallel u_T parallel_2^2 lt.eq C . $
  Both coefficients are positive by (6.9). Monotone convergence of the squared weighted functions gives the $L^2$
    bound as $T arrow.r oo$, and weak $H^1$ compactness identifies the limit as $eta e^(a rho) g$.
    Adding back the compact interior part proves
  #[#set math.equation(numbering: n => "(6.11)")
   $ e^(a rho) g in H^1 \( upright(bold(R))^3 \) \, wide e^(a \| x \|) g in H^1 \( upright(bold(R))^3 \) .
     $ <eq:weighted-ground-orbital>]
  The second assertion also follows by multiplying the first function by the bounded Lipschitz factor
    $e^(a \( \| x \| - rho \( x \) \))$.
  The trace map from $H^1 \( upright(bold(R))^3 \)$ to $L^2 \( upright(bold(R))^2 \)$ is bounded.
    The local continuity of $g$, $n$, and $theta$, together with the zero angle trace,
    identifies the trace on $z = 0$ as
  $ g \( x_1 \, x_2 \, 0 \) = sqrt(n \( x_1 \, x_2 \, 0 \)) . $
  Thus (6.11) implies $integral_(z = 0) e^(2 a p) n \( p \, 0 \) < oo$.
    On the other hand, (3.5) gives a fixed $c_(*) > 0$ and $p_(*) < oo$ such that
  $ integral_(z = 0) e^(2 a p) n \( p \, 0 \) thin d x_1 d x_2 & gt.eq
    2 pi c_(*)^2 integral_(p_(*))^oo e^(2 \( a - k \) p) p^(2 beta - 7) thin d p\
 & = oo \, $
  because $a > k$. This contradicts the trace bound and proves that (6.3) is impossible.
  Finally, the weighted gap and the analytic properties above give the ensemble kinetic certificate of 18.
    If an admissible potential represented $n$ by a ground-state ensemble,
    19 would identify it with $V$ up to a constant. The sum space is invariant under adding constants,
    so this would imply (6.3), already contradicted. ◻
]

#thm([Theorem 6.5.])[
  (A family of finite Coulombic counterexamples).  #emph[For every sufficiently large fixed $D$,
    there is an integer $Z_0 \( D \)$ such that, for every integer $Z gt.eq Z_0 \( D \)$,
    the three-electron Coulomb Hamiltonian with nuclear charges $Z \,
    Z$ at $\( 0 \, 0 \, plus.minus D \/ Z \)$ has an absolute ground state whose density is not representable by a
    ground-state ensemble of a single real, spin-independent noninteracting potential in
    $L^(3 \/ 2) \( upright(bold(R))^3 \) + L^oo \( upright(bold(R))^3 \)$.]
] <thm:qualitative-counterexample>

#proof[
  First choose $D$ large enough for Proposition 2.2, Proposition 3.1, Proposition 4.5.
    For this fixed $D$, take $lambda > 0$ sufficiently small that Proposition 2.3, Proposition 4.2,
    Proposition 4.6 apply as well. The resulting three-electron state is an absolute bound ground state,
    and its density and angle satisfy every hypothesis of 23.
    The planar coefficient is nonzero because the coupling is positive.
    All these properties hold throughout some interval $0 < lambda < lambda_0 \( D \)$.
    Choose the integer $Z_0 \( D \)$ so that $1 \/ Z_0 \( D \) < lambda_0 \( D \)$, set $lambda = 1 \/ Z$,
    and apply the scaling equivalence of 2. ◻
]

The parameters in 24 are finite but are still selected by sufficient-size conditions.
  The next section specifies one charge by an exact spectral and variational formula and checks its hypotheses
  directly using the fixed-density form of 23.

== 7 An exact choice of the charges and nuclear positions <sec:parameters>

We now specify one member of the family without leaving either large parameter free.
  The resulting charge is an exact integer defined through spectral and variational quantities.
  The definition is nonnumerical: no evaluated decimal value or effective numerical upper bound for this integer
  is asserted.

Throughout this section fix

#[#set math.equation(numbering: n => "(7.1)")
 $ D = 10^200 \, wide eta_0 = 10^(- 60) \, wide L = 10 \, wide mu = 1 / 10 . $ <eq:fixed-parameter-numbers>]

The orbitals $b \, e$, the numbers $epsilon.alt_b \, epsilon.alt_e \, gamma \, k_0$, and the reference angle

$ theta_(*) = arctan frac(e, sqrt(2) thin b) \, wide delta_(*) = pi / 2 - theta_(*) quad \( z gt.eq 0 \) $

always refer to this fixed two-centre problem at zero coupling.
  For auxiliary couplings $t in \[ 0 \, 1 \]$, use the operators $H_(m \, t)$ of (2.2).
  Subscripts $t$ on all other quantities refer to these auxiliary operators.

#prodef([Definition 7.1.])[
  (Regular auxiliary data).  An auxiliary coupling $t in \[ 0 \, 1 \]$ is called regular if all the following
    conditions hold.
  + The two-electron ground level is isolated and simple, and its ground state is an axisymmetric,
    reflection-even spin singlet. The three-electron ground level in $S_z = 1 \/ 2$ is isolated and simple,
    is an absolute ground level, and has an axisymmetric, reflection-odd ground state.
  + The spin-summed density $n_t$ is everywhere positive, and
    #[#set math.equation(numbering: n => "(7.2)")
     $ 2 epsilon.alt_b - E_3 \( t \) > 0.49 \, wide 0.99 < k_t < gamma \, wide k_t =
       sqrt(2 \( E_2 \( t \) - E_3 \( t \) \)) . $ <eq:regular-energy-tests>]
  + With the ionic ground projection $P_t$ in the distinguished-electron fiber space, and with
    $ F_(upright("true") \, t) \( x \) = sqrt(3) thin Psi_t \( x \, dot.op \) \, wide A_t \( r \) =
      e^(- k_t r) r^(\( 2 - 2 t \) \/ k_t - 1) \, $
    the direct-removal amplitude satisfies
    #[#set math.equation(numbering: n => "(7.3)")
     $ inf_(omega_z > 0) med
       liminf_(r arrow.r oo)
       frac(parallel P_t F_(upright("true") \, t) \( r omega \) parallel, omega_z A_t \( r \)) > 0 .
       $ <eq:regular-amplitude-test>]
  If any quantity required for these tests is undefined, the coupling is declared nonregular.
] <def:regular-data>

The simple levels make the densities and projected norms independent of the phases chosen for their state vectors.
  The Hamiltonians commute with complex conjugation, so their simple eigenvectors may be chosen real and
  normalized. For every regular $t$, 5 gives the Sobolev regularity needed below.
  For $t > 0$, smoothness away from the nuclei follows from 10; at $t = 0$, it follows from $n_0 = 2 b^2 +
  e^2$ and the scalar orbital equations for $b \, e$. In particular,
  the exterior density has the derivatives occurring in the next definition.

=== 7.1 The radius and its strict comparison margin <the-radius-and-its-strict-comparison-margin>

For an integer $j > 10 D$ and regular $t$, define $m_t \( p \, z \) = e^(2 k_t p) n_t \( p \, z \)$,
  and let $H_t \( j \)$ be the maximum of the following four numbers:

#[#set math.equation(numbering: n => "(7.4)")
 $ & 1 / eta_0 sup_(\| x \| gt.eq j) lr(|partial_r log n_t \( x \) + 2 k_t|) \,\
 & 1 / eta_0 sup_(\| x \| gt.eq j\
0 lt.eq z lt.eq p \/ 2) lr(|partial_p log n_t \( x \) + 2 k_t p \/ r|) \,\
 & 1 / eta_0 sup_(p gt.eq j\
0 lt.eq z lt.eq L) frac(\| partial_p m_t \( p \, z \) \| + \| partial_p^2 m_t \( p \, z \) \|, m_t \( p \, z \)) \,\
 & 1 / 100 sup_(p gt.eq j\
0 lt.eq z_1 lt.eq z_2 lt.eq L) frac(n_t \( p \, z_1 \), n_t \( p \, z_2 \)) . $ <eq:parameter-H>]

Here $partial_p$ holds $z$ fixed. For nonregular $t$, set $H_t \( j \) = + oo$.

Let $M$ be the smallest integer in the following set:

#[#set math.equation(numbering: n => "(7.5)")
 $
   mat(delim: "{", j in upright(bold(N)) : thick, j > 10 D \, quad max {H_0 \( j \) \, thin limsup_(t arrow.b 0)
   H_t \( j \)} < 1 \,; #none, sup_(0 lt.eq z lt.eq L) frac(partial_z #scale(x: 120%, y: 120%)[\(] n_0 \( j \,
   z \) partial_z delta_(*) \( j \, z \) #scale(x: 120%, y: 120%)[\)], n_0 \( j \, z \) delta_(*) \( j \, z \)) <
   mu^2) . $ <eq:parameter-radius>]

The coordinates $\( j \, z \)$ are cylindrical coordinates.
  For regular $t$, let $U_t \( p \, z \)$ be the strip solution

#[#set math.equation(numbering: n => "(7.6)")
 $ frac(1, n_t \( p \, z \)) partial_z #scale(x: 120%, y: 120%)[\(] n_t \( p \, z \) partial_z U_t \( p \, z \)
   #scale(x: 120%, y: 120%)[\)] = mu^2 U_t \( p \, z \) \, wide U_t \( p \, 0 \) = 1 \, quad U_t \( p \, L \) =
   0 . $ <eq:parameter-strip-solution>]

It is the normalized positive solution constructed in 14. Once $M$ is defined, put

#[#set math.equation(numbering: n => "(7.7)")
 $ S = 100 M \, wide alpha =
   inf_(0 < z lt.eq L) frac(\( 2 \/ pi \) delta_(*) \( M \, z \) - U_0 \( M \, z \), z) . $ <eq:parameter-alpha>]

#thm([Lemma 7.2.])[
  (Finiteness of the radius and positivity of the margin).  #emph[The set in (7.5) is nonempty.
    Consequently $M$ is a finite integer, and the number $alpha$ in (7.7) is strictly positive.]
] <lem:parameter-radius>

#proof[
  First, all sufficiently small $t gt.eq 0$ are regular. The ground-level and symmetry conditions follow from 4.
    At zero coupling,
  $ 2 epsilon.alt_b - E_3 \( 0 \) = - epsilon.alt_e = k_0^2 / 2 > 0.49 \, wide 0.99 < k_0 < gamma \, $
  where 3 and the fixed value of $D$ give the strict numerical inequalities. They persist for small $t$.
    Positivity of the density and the direct-amplitude bound are supplied by the uniform channel construction in
    Proposition 3.1, Lemma 3.3.
  We record why the fixed numbers in (7.1) are sufficient for the uniform exterior tests.
    Let $delta_0 = gamma - k_0 > 0$. The estimate (3.45) supplies one remainder $rho_D \( R \) arrow.b 0$,
    independent of all sufficiently small $t$, for the first three unnormalized expressions in (7.4). By (2.4),
  #[#set math.equation(numbering: n => "(7.8)")
   $ delta_0 < 200 / D \, wide 100 \( delta_0 + delta_0^2 \) < 10^(- 195) lt.double eta_0 .
     $ <eq:parameter-drift-slack>]
  For the last line of (7.4), the uniform eventual vertical ratio is at most $20$, by (3.4).
    Consequently, for all sufficiently large fixed integers $j$,
  $ & max {H_0 \( j \) \, thin limsup_(t arrow.b 0) H_t \( j \)}\
 & wide lt.eq max {frac(100 \( delta_0 + delta_0^2 \) + rho_D \( j \), eta_0) \, 1 / 5} < 1 . $
  The common remainder is obtained with $D$ fixed, and the finite radius $j$ is then chosen before taking the
    small-coupling limsup. This uses uniform exterior estimates throughout.
  We next verify the last condition in (7.5). The scalar exterior expansions for $b \, e$,
    including the simple odd factor of $e$, imply that, uniformly for $0 < z lt.eq L$,
  $ partial_p log \( b \/ e \) = - delta_0 + o \( 1 \) \, wide partial_p^2 log \( b \/ e \) =
    o \( 1 \) wide \( p arrow.r oo \) . $
  The apparent singularity $- log z$ has no $p$-derivative. For $q > 0$, both
  $ frac(q, \( 1 + q^2 \) arctan q) \, wide frac(q \( 1 - q^2 \), \( 1 + q^2 \)^2 arctan q) $
  have absolute value at most $1$; this follows from $q \/ \( 1 + q^2 \) lt.eq arctan q$.
    Applying these bounds to $delta_(*) = arctan \( sqrt(2) b \/ e \)$ therefore gives
  $ frac(\| \( delta_(*) \)_p \|, delta_(*)) lt.eq delta_0 + o \( 1 \) \, wide
    frac(\| \( delta_(*) \)_(p p) \|, delta_(*)) lt.eq delta_0^2 + o \( 1 \) . $
  The bounds extend to $z = 0$ by continuity. The cylindrical drift coefficient satisfies $\| p^(- 1) +
    partial_p log n_0 \| lt.eq 3$ for sufficiently large $p$.
    Since $L_(n_0) delta_(*) = q_(*) delta_(*)$ with $0 lt.eq q_(*) lt.eq 2 d_(*)$, it follows that
  $ frac(partial_z \( n_0 partial_z delta_(*) \), n_0 delta_(*)) lt.eq 2 d_(*) + 3 delta_0 + delta_0^2 +
    o \( 1 \) < mu^2 $
  uniformly in the strip, once $p$ is sufficiently large. The last strict inequality uses $d_(*) < 100 \/
    D$ and (7.8). Thus the defining set for $M$ is nonempty.
  On the segment $p = M$, let
  $ f \( z \) = 2 / pi delta_(*) \( M \, z \) \, wide v \( z \) = f \( z \) - U_0 \( M \, z \) . $
  The defining strict inequality for $M$ gives
  $ frac(1, n_0 \( M \, z \)) partial_z #scale(x: 120%, y: 120%)[\(] n_0 \( M \, z \) partial_z v
    #scale(x: 120%, y: 120%)[\)] - mu^2 v < 0 \, wide v \( 0 \) = 0 \, quad v \( L \) > 0 . $
  One-dimensional comparison and its boundary point conclusion give $v \( z \) > 0$ for $0 < z lt.eq
    L$ and $v' \( 0 \) > 0$. The quotient $v \( z \) \/ z$ consequently extends to a continuous strictly positive
    function on the compact segment $\[ 0 \, L \]$. Its minimum is positive, proving $alpha > 0$. ◻
]

=== 7.2 The bad set and the charge <the-bad-set-and-the-charge>

For a regular $t$, every folded minimizing angle for $n_t$ has a well-defined multiplier by 11.
  In the following tests, the minimizing angle is not assumed to be axisymmetric.
  A supremum on the cylinder $p = M$ includes all azimuthal angles.

Define a subset $cal(B) subset \( 0 \, 1 \]$ as follows. It contains every nonregular $t$,
  every regular $t$ with $H_t \( M \) gt.eq 1$, and every remaining $t$ for which #emph[there exists a folded
  minimizing angle] $theta$, with multiplier $d$, that fails at least one of the tests

#[#set math.equation(numbering: n => "(7.9)")
 $ 0 < d < 0.001 \, wide 1 / 2 lt.eq frac(n_t cos^2 theta, 2 b^2) lt.eq 2 quad upright("on ") \| x \| lt.eq 2 S \,\
sup_(p = M\
0 lt.eq z lt.eq L) (\| partial_z \( theta - theta_(*) \) \| + \| partial_z \( U_t - U_0 \) \|) < alpha /
  2 . $ <eq:parameter-angle-tests>]

Thus $t in.not cal(B)$ means that the tests hold for #emph[every] folded minimizing angle.

#prodef([Definition 7.3.])[
  (The exact integer charge).  Using only the preceding data for the fixed unit-charge problem, define
  #[#set math.equation(numbering: n => "(7.10)")
   $ Z = 2 + ⌈sup_(0 < t lt.eq 1) 1 / t thin upright(bold(1))_(cal(B)) \( t \)⌉ . $ <eq:explicit-charge>]
] <def:explicit-charge>

#thm([Lemma 7.4.])[
  (The charge is finite and passes all tests).  #emph[The supremum in (7.10) is finite.
    The resulting $Z$ is a positive integer, and $t_(*) = 1 \/ Z$ is regular and lies outside $cal(B)$.]
] <lem:explicit-charge-finite>

#proof[
  By 26, small couplings are regular and the fixed-radius condition $H_t \( M \) <
    1$ holds throughout some interval $0 < t < tau_1$. We must check the tests for all minimizers,
    not merely for a selected branch.
  The convergence in 12 holds for every sequence of folded minimizers as $t arrow.b 0$:
    their angles converge locally uniformly to $theta_(*)$, their multipliers to $d_(*)$,
    and their derivatives converge uniformly on fixed exterior compact sets.
    The same statements are therefore uniform over the collection of folded minimizers for sufficiently small $t$;
    otherwise a sequence violating uniform convergence would contradict that proposition.
    Since $0 < d_(*) < 100 \/ D < 0.001$, the multiplier test passes for all minimizers.
  The compact set ${ \| x \| lt.eq 2 S }$ is now fixed. Its reference weight $2
    b^2$ is bounded below by a positive constant. Density convergence and angle convergence give
  $ frac(n_t cos^2 theta, 2 b^2) arrow.r 1 $
  uniformly there, for all folded minimizers. This proves the second test.
    On the fixed cylinder $p = M$, density convergence also gives $U_t \( M \, dot.op \) arrow.r
    U_0 \( M \, dot.op \)$ in $C^1 \( \[ 0 \, L \] \)$. For example,
    this follows directly from the positive integral series in 14:
    $n_t$ converges uniformly to a positive function on this compact segment,
    and the series and its final-flux formula converge uniformly.
    Together with the $C^1$ angle convergence and $alpha > 0$, this proves the last test.
  Consequently $cal(B) ∩ \( 0 \, tau \) = diameter$ for some $tau > 0$. If
  $ C_(cal(B)) = sup_(0 < t lt.eq 1) 1 / t thin upright(bold(1))_(cal(B)) \( t \) \, $
  then $0 lt.eq C_(cal(B)) lt.eq 1 \/ tau$; in the empty-bad-set case the supremum is zero.
    Thus $Z = 2 + ceil.l C_(cal(B)) ceil.r$ is finite and $Z > C_(cal(B))$.
    If $t_(*) = 1 \/ Z$ belonged to $cal(B)$, its contribution to the supremum would be $Z$, a contradiction.
    Hence $t_(*) in.not cal(B)$, as claimed. ◻
]

#proof[
  Work first with the scaled system at $t_(*) = 1 \/ Z > 0$.
    By 28, its regularity gives the specified normalizable ground state in $S_z = 1 \/ 2$,
    and its energy is an absolute ground energy.
  It is useful to check explicitly that the fixed-parameter channel theorem applies here.
    We know that the selected coupling passes the tests; we do not need to know that it belongs to the particular
    perturbation interval used earlier. Its ionic isolation supplies a positive $Q$-gap.
    The inequality $2 epsilon.alt_b - E_3 \( t_(*) \) > 0.49$ permits a full-configuration exponential weight with
    exponent $a = 0.98$, since $a^2 \/ 2 = 0.4802 < 0.49$. On the cutoff region $\| y \| gt.eq r \/ 3$,
    the full radius is at least $sqrt(10 \/ 9) thin r$; hence, with room for the derivative estimates,
    an exterior error exponent $sigma = 1.02 > gamma$ is available. Here $gamma < 1.01$ follows from (2.4).
    Moreover $k_(t_(*)) < gamma$ makes the retained unperturbed fast term exponentially smaller than $A_(t_(*))$
    times any fixed inverse power. Finally, (7.3) supplies the nonzero equatorial slope in the scalar channel
    coefficient. The complementary plane coefficient is nonzero because
  $ Q \( y_(1 z) + y_(2 z) \) phi.alt = \( y_(1 z) + y_(2 z) \) phi.alt eq.not 0 \, $
  by even ionic parity and the fact that a nonzero $L^2$ vector cannot be supported on the hyperplane $y_(1 z) +
    y_(2 z) = 0$. The injective reduced inverse preserves nonzeroness.
    These are exactly the fixed-parameter hypotheses of 10. That proposition gives the plane lower tail and both
    density translation limits at $t_(*)$.
  Choose any folded minimizing angle $theta$ for $n_(t_(*))$.
    All tests in (7.9) hold for it, and $H_(t_(*)) \( M \) < 1$ supplies the drift and strip bounds with $eta_0 =
    10^(- 60)$ and vertical ratio at most $100$. Also $0.99 < k_(t_(*)) < gamma < 1.01$ and $M > 10 D$.
    The hypotheses of 17 are therefore satisfied. To indicate the numerical margins,
    its strip derivative constant is below $10^30$, so its horizontal error is at most $4 dot.op 10^(- 30) U$,
    whereas $mu^2 - 2 d > 0.008$. At the inner cylinder, the reference gap is at least $alpha z$;
    the derivative test reduces it by less than $alpha z \/ 2$.
    The exterior gap is $0.03$, while the localization error $10 \/ S^2$ leaves a gap far larger than $d < 0.001$.
    Thus the full weighted gap holds for the constructed orbitals $g \, h$.
  The fixed-density obstruction in 23, using the ensemble certificate and potential identification from 5,
    rules out every representing potential in the stated class for this scaled density.
    Finally, 2 transfers the obstruction to the physical system with charges $Z \, Z$.
    The number $Z$ is finite, so the nuclear positions $\( 0 \, 0 \, plus.minus D \/ Z \)$ are finite and
    distinct. This establishes 1. ◻
]

All quantities in the prescription are determined by the fixed unit-charge auxiliary operators and their
  density-angle minimizations. Eigenvector phases do not enter,
  and the tests quantify over every minimizing angle. The supremum in (7.10) is therefore an unambiguous
  definition of an integer; it contains no test for representability by an unknown potential.
  Its nonnumerical character concerns the evaluation of that integer,
  not the finiteness of the system or the order of limits in the proof.

== 8 A functional consequence for the physical density <sec:hxc-first-variation>

In this section all coordinates and densities are physical, as in 1.
  Work on the real Banach space $X = L^1 \( upright(bold(R))^3 \; upright(bold(R)) \) ∩
  L^3 \( upright(bold(R))^3 \; upright(bold(R)) \)$ with the sum norm and its potential dual $cal(V)$,
  paired by integration. In addition to the kinetic search (5.4), define

$ F_(upright("ens")) \[ m \] = inf_(Gamma mapsto m) "Tr" \( \( T + W \) Gamma \) \, wide T = sum_(i = 1)^3 - 1 /
  2 Delta_i \, quad W = sum_(i < j) frac(1, \| r_i - r_j \|) . $

Both searches run over all positive trace-one ensembles on $frak(H)_3$, with form expectations, and take value $+
  oo$ when there is no finite-energy competitor. Their common finite-energy domain and ensemble
  Hartree–exchange–correlation functional are

$ cal(D) = "Dom" T_(upright("ens")) = "Dom" F_(upright("ens")) \, wide E_(upright("Hxc")) = F_(upright("ens")) -
  T_(upright("ens")) quad upright("on ") cal(D) . $

Indeed, the Coulomb Hardy estimate from 2 gives $0 lt.eq W lt.eq epsilon T + C_epsilon$ as quadratic forms,
  also after taking ensemble expectations. Thus finite kinetic and interacting internal energies are equivalent.
  Such densities belong to $X$: (5.3) and Cauchy–Schwarz give $integral \| nabla sqrt(n_Gamma) \|^2 lt.eq
  2 T \[ Gamma \]$, and Sobolev together with $integral n_Gamma = 3$ gives the assertion.
  Mixtures and approximate minimizers show that both searches are convex, so $cal(D)$ is convex.
  For either search $G$, write

$ partial_(cal(V)) G \[ n \] = {u in cal(V) : G \[ m \] gt.eq G \[ n \] + integral u \( m - n \) med
  upright("for every ") m in X} . $

#thm([Corollary 8.1.])[
  (Absence of a full-domain local first variation).  #emph[For the physical ground-state density $n = n_Psi$ of 1,
    $partial_(cal(V)) T_(upright("ens")) \[ n \] = diameter$.
    Moreover, there is no $w in cal(V)$ such that, for every $m in cal(D)$,
#[#set math.equation(numbering: n => "(8.1)")
 $ lim_(t arrow.b 0) frac(E_(upright("Hxc")) \[ n + t \( m - n \) \] - E_(upright("Hxc")) \[ n \], t) =
   integral_(upright(bold(R))^3) w \( m - n \) . $ <eq:hxc-full-segment-variation>]

]
] <cor:hxc-first-variation>

#proof[
  Proposition 18 supplies an attaining determinant for the scaled kinetic search.
    The inverse dilation in Proposition 2 gives a determinant $Phi_(upright("phys"))$ attaining
    $T_(upright("ens")) \[ n \]$: it is a bijection of ensembles with the corresponding densities and multiplies
    kinetic energies by $Z^2$. If $u in partial_(cal(V)) T_(upright("ens")) \[ n \]$,
    the subgradient inequality makes $Phi_(upright("phys"))$ a minimizer of the form of $H_s \( - u \)$ over all
    normalized antisymmetric states in its form domain. The form bound (5.12) applies to $u$,
    so equality at the bottom of this closed form makes $Phi_(upright("phys"))$ a ground eigenstate,
    as in the proof of Proposition 19. Its density is $n$, contradicting 1.
  Let $v_(upright("ext")) in cal(V)$ be the physical nuclear potential in $H_C$.
    The ground-state variational principle gives $- v_(upright("ext")) in partial_(cal(V))
    F_(upright("ens")) \[ n \]$; in particular, $Psi$ attains the interacting search at $n$.
    Suppose now that $w$ satisfies (8.1). Fix $m in cal(D)$, set $h = m - n$ and $n_t = n + t h$.
    Convexity of the kinetic search and the interacting support inequality give, for $0 < t lt.eq 1$,
  $ T_(upright("ens")) \[ m \] - T_(upright("ens")) \[ n \] & gt.eq
    frac(T_(upright("ens")) \[ n_t \] - T_(upright("ens")) \[ n \], t)\
 & gt.eq - integral v_(upright("ext")) h - frac(E_(upright("Hxc")) \[ n_t \] - E_(upright("Hxc")) \[ n \], t) . $
  Letting $t arrow.b 0$ proves the subgradient inequality for $- v_(upright("ext")) - w$ and every $m in cal(D)$.
    Outside $cal(D)$ it is automatic because $T_(upright("ens")) = + oo$.
    Hence $- v_(upright("ext")) - w in partial_(cal(V)) T_(upright("ens")) \[ n \]$, contrary to the first assertion. ◻
]

#heading(level: 1)[References]
#bibitem([1])[S.~Agmon, #emph[Lectures on Exponential Decay of Solutions of Second-Order Elliptic Equations:
  Bounds on Eigenfunctions of $N$-Body Schrödinger Operators], Mathematical Notes, vol.~29,
  Princeton University Press, Princeton, NJ; University of Tokyo Press, Tokyo, 1982.]
#bibitem([2])[J.~T.~Chayes, L.~Chayes, and M.~B.~Ruskai, Density functional approach to quantum lattice systems,
  #emph[Journal of Statistical Physics] #strong[38] (1985), 497--518.
  #link("https://doi.org/10.1007/BF01010474")[doi:10.1007/BF01010474].]
#bibitem([3])[T.~C.~Corso, A rigorous formulation of density functional theory for spinless fermions in one
  dimension, #emph[Letters in Mathematical Physics] #strong[116] (2026), article~27.
  #link("https://doi.org/10.1007/s11005-026-02051-1")[doi:10.1007/s11005-026-02051-1].]
#bibitem([4])[J.~Erhard, E.~Trushin, and A.~Görling, Kohn--Sham inversion for open-shell systems,
  #emph[The Journal of Chemical Physics] #strong[162] (2025), 034116.
  #link("https://doi.org/10.1063/5.0239422")[doi:10.1063/5.0239422].]
#bibitem([5])[S.~Fournais and T.~Ø.~Sørensen, Estimates on derivatives of Coulombic wave functions and their
  electron densities, #emph[Journal für die reine und angewandte Mathematik] #strong[775] (2021), 1--38.
  #link("https://doi.org/10.1515/crelle-2020-0047")[doi:10.1515/crelle-2020-0047]. Preprint:
  #link("https://arxiv.org/abs/1803.03495v1")[arXiv:1803.03495v1] (2018).]
#bibitem([6])[R.~L.~Frank and R.~Seiringer, Non-linear ground state representations and sharp Hardy inequalities,
  #emph[Journal of Functional Analysis] #strong[255] (2008), 3407--3430.
  #link("https://doi.org/10.1016/j.jfa.2008.05.015")[doi:10.1016/j.jfa.2008.05.015].]
#bibitem([7])[P.~Gori-Giorgi and E.~J.~Baerends, Asymptotic nodal planes in the electron density and the potential
  in the effective equation for the square root of the density,
  #emph[The European Physical Journal B] #strong[91] (2018), article~160.
  #link("https://doi.org/10.1140/epjb/e2018-90225-3")[doi:10.1140/epjb/e2018-90225-3].]
#bibitem([8])[P.~Gori-Giorgi, T.~Gál, and E.~J.~Baerends,
  Asymptotic behaviour of the electron density and the Kohn--Sham potential in case of a Kohn--Sham HOMO nodal
  plane, #emph[Molecular Physics] #strong[114] (2016), 1086--1097.
  #link("https://doi.org/10.1080/00268976.2015.1137643")[doi:10.1080/00268976.2015.1137643]. Preprint:
  #link("https://arxiv.org/abs/1109.2204v2")[arXiv:1109.2204v2] (2015).]
#bibitem([9])[P.~Hohenberg and W.~Kohn, Inhomogeneous electron gas, #emph[Physical Review] #strong[136] (1964),
  B864--B871. #link("https://doi.org/10.1103/PhysRev.136.B864")[doi:10.1103/PhysRev.136.B864].]
#bibitem([10])[T.~Kato, #emph[Perturbation Theory for Linear Operators], Classics in Mathematics, Springer-Verlag,
  Berlin--Heidelberg, 1995. Reprint of the corrected 1980 printing of the second edition.
  #link("https://doi.org/10.1007/978-3-642-66282-9")[doi:10.1007/978-3-642-66282-9].]
#bibitem([11])[W.~Kohn and L.~J.~Sham, Self-consistent equations including exchange and correlation effects,
  #emph[Physical Review] #strong[140] (1965), A1133--A1138.
  #link("https://doi.org/10.1103/PhysRev.140.A1133")[doi:10.1103/PhysRev.140.A1133].]
#bibitem([12])[D.~Kumar and A.~A.~Ramabathiran, A direct approach to computing the non-interacting kinetic energy
  functional, preprint, 2025. #link("https://arxiv.org/abs/2507.00321v2")[arXiv:2507.00321v2].]
#bibitem([13])[M.~Levy, Universal variational functionals of electron densities, first-order density matrices,
  and natural spin-orbitals and solution of the $v$-representability problem,
  #emph[Proceedings of the National Academy of Sciences of the USA] #strong[76] (1979), 6062--6065.
  #link("https://doi.org/10.1073/pnas.76.12.6062")[doi:10.1073/pnas.76.12.6062].]
#bibitem([14])[E.~H.~Lieb, Density functionals for Coulomb systems,
  #emph[International Journal of Quantum Chemistry] #strong[24] (1983), 243--277.
  #link("https://doi.org/10.1002/qua.560240302")[doi:10.1002/qua.560240302].]
#bibitem([15])[M.~Penz, E.~I.~Tellgren, M.~A.~Csirik, M.~Ruggenthaler, and A.~Laestadius,
  The structure of density-potential mapping. Part~I: Standard density-functional theory,
  #emph[ACS Physical Chemistry Au] #strong[3] (2023), 334--347.
  #link("https://doi.org/10.1021/acsphyschemau.2c00069")[doi:10.1021/acsphyschemau.2c00069].]
#bibitem([16])[B.~Simon, Semiclassical analysis of low lying eigenvalues. I. Non-degenerate minima:
  asymptotic expansions, #emph[Annales de l'Institut Henri Poincaré, Section A] #strong[38] (1983), 295--308.
  #link("https://www.numdam.org/item/AIHPA_1983__38_3_295_0/")[Journal archive].]
#bibitem([17])[L.~Simon, #emph[Lectures on PDE], lecture notes, updated March~5, 2015.
  #link("https://math.stanford.edu/~lms/lecs-on-pde.pdf")[Author-hosted lecture notes].]
#bibitem([18])[S.~M.~Sutter, M.~Penz, M.~Ruggenthaler, R.~van Leeuwen, and K.~J.~H.~Giesbertz,
  Solution of the $v$-representability problem on a one-dimensional torus, #emph[Journal of Physics A:
  Mathematical and Theoretical] #strong[57] (2024), 475202.
  #link("https://doi.org/10.1088/1751-8121/ad8a2a")[doi:10.1088/1751-8121/ad8a2a].]
#bibitem([19])[E.~Trushin, J.~Erhard, and A.~Görling, Violations of the $v$-representability condition underlying
  Kohn--Sham density-functional theory, #emph[Physical Review A] #strong[110] (2024), L020802.
  #link("https://doi.org/10.1103/PhysRevA.110.L020802")[doi:10.1103/PhysRevA.110.L020802].]
#bibitem([20])[C.~A.~Ullrich and W.~Kohn, Kohn--Sham theory for ground-state ensembles,
  #emph[Physical Review Letters] #strong[87] (2001), 093001.
  #link("https://doi.org/10.1103/PhysRevLett.87.093001")[doi:10.1103/PhysRevLett.87.093001].]
#bibitem([21])[L.~O.~Wagner, T.~E.~Baker, E.~M.~Stoudenmire, K.~Burke, and S.~R.~White,
  Kohn--Sham calculations with the exact functional, #emph[Physical Review B] #strong[90] (2014), 045109.
  #link("https://doi.org/10.1103/PhysRevB.90.045109")[doi:10.1103/PhysRevB.90.045109].]
#bibitem([22])[Y.~Yuan, #emph[Lecture 7: Calderón--Zygmund estimate], M583E,
  Linear and Nonlinear Elliptic Equations, Part~I, University of Washington, May~22, 2019.
  #link("https://sites.math.washington.edu/~yuan/class/M583ES19/lec7Calderon-Zygmund.pdf")[Author-hosted lecture
  notes].]
