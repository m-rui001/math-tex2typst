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

#align(center)[#text(size: 16pt, weight: "bold")[An Isolated Particle Pole for the \
Two-Dimensional $O \( 3 \)$ Spin Field]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

A mass gap and an isolated particle mass are different spectral statements.
  A positive spectral measure may start at a strictly positive threshold and still have no atoms.
  For the spin field of the two-dimensional $O \( 3 \)$ model,
  we prove that the lowest mass is an atom separated from all remaining mass support.
  The proof uses the massive continuum construction in #cite(label("OpenAI-O3")),
  including its uniform finite-volume estimates.

=== 1.1 The field and the result <the-field-and-the-result>

Let $phi.alt = \( phi.alt^1 \, phi.alt^2 \, phi.alt^3 \)$ be the Hermitian vector field obtained from the
  nearest-neighbor $O \( 3 \)$ model by the fixed lattice-spacing and field-normalization prescription of
  #cite(label("OpenAI-O3")) Theorem 1.2. Here the Euclidean lattice is two-dimensional and the reconstructed
  spacetime has one time and one space dimension. Internal $O \( 3 \)$ symmetry and the Källén–Lehmann
  representation give

#[#set math.equation(numbering: n => "(1.1)")
 $ W_2^(i j) \( x \) = delta_(i j) integral_(\[ 0 \, oo \)) Delta_(+) \( x \; mu^2 \) thin rho \( d mu^2 \) \,
   $ <intro:spectral>]

where $Delta_(+) \( x \; mu^2 \)$ is the positive-frequency free scalar two-point distribution and $rho$ is a
  positive measure. The variable $mu$ denotes mass; the argument of $rho$ is mass squared.
  This representation records the masses to which the field couples #cite(label("Kallen1952"))
  #cite(label("Lehmann1954")).

#thm([Theorem 1.1.])[
  (An isolated lowest mass).  #emph[For the field $phi.alt$ just specified, there exist $m_1 \, Z \,
    delta > 0$ and a positive measure $rho_(upright("rest"))$ such that
#[#set math.equation(numbering: n => "(1.2)")
 $ rho = Z delta_(m_1^2) + rho_(upright("rest")) \, wide "supp" rho_(upright("rest"))
   subset \[ \( m_1 + delta \)^2 \, oo \) . $ <intro:atom>]

 In particular, $m_1$ is the smallest mass in the support of the spin-field two-point function.]
] <intro:main>

The atom in (1.2) is the isolated particle contribution to the two-point function.
  Both its positive weight and its separation from the remaining spectrum must be established:
  neither follows from exponential decay alone. Our use of the continuum construction is made precise in
  Section 2. The new argument begins with its uniform torus estimates and does not assume that an eigenvalue at
  finite circumference persists in the infinite-volume limit.

=== 1.2 Context and methods <context-and-methods>

The two-dimensional nonlinear sigma models are basic examples in which short-distance behavior and massive
  long-distance behavior must be reconciled. Polyakov’s work on the interaction of Goldstone particles identified
  the role of asymptotic freedom in these models #cite(label("Polyakov1975")).
  The factorized scattering description of the $O \( N \)$ sigma model developed by Zamolodchikov and
  Zamolodchikov gives a particle-based account of its expected massive continuum physics
  #cite(label("Zamolodchikov1979")). Relating such a description to the field obtained from a specified lattice
  limit requires control of that limit and of the field’s spectral measure.
  Within the massive-particle description, Balog and Niedermaier computed spin-field form factors and spectral
  densities #cite(label("BalogNiedermaier1997")). The present argument establishes the isolated mass directly for
  the field obtained from the lattice prescription.

In constructive field theory, Glimm, Jaffe, and Spencer proved an isolated particle mass for weakly coupled
  $P \( phi.alt \)_2$ models by a particle cluster expansion #cite(label("GlimmJaffeSpencer1974")).
  The setting and the estimates used here are different: our starting point is the finite-volume control
  accompanying the $O \( 3 \)$ lattice limit.

The companion construction #cite(label("OpenAI-O3")) provides the continuum field,
  its Osterwalder–Schrader reconstruction #cite(label("OsterwalderSchrader1973"))
  #cite(label("OsterwalderSchrader1975")), a gap above the vacuum, and a nonzero one-field state.
  It also supplies two inputs that are decisive here: exponentially small partition-function defects under
  doubling of large physical squares, uniformly in the lattice cutoff,
  and uniform factorial moment bounds for normalized local spin sums.
  We use these quantitative estimates to extract the isolated mass.

Several classical correlation tools enter the passage from transfer energies to field correlations.
  The positivity arguments belong to the Griffiths–Ginibre theory and its extensions to multicomponent rotators
  #cite(label("Ginibre1970")) #cite(label("Dunlop1976")). We give the particular three-component argument in full,
  because it must control arbitrary spin polynomials invariant under simultaneous spin inversion.
  Positive association #cite(label("FKG1971")) and the Edwards–Sokal coupling #cite(label("EdwardsSokal1988"))
  relate spin correlations to connection events for embedded Ising signs.
  The crossing theorem of Köhler-Schindler and Tassion #cite(label("KohlerSchindlerTassion2023")) supplies
  circuits using only symmetry and positive association. These circuits attach a definite amount of normalized
  spin-field weight to connections; the normalization is essential as the lattice spacing tends to zero.

The use of bounded-energy state counts to constrain particle content is related to the phase-space criteria of
  Haag and Swieca #cite(label("HaagSwieca1965")) and Buchholz and Wichmann #cite(label("BuchholzWichmann1986")).
  Here the needed estimate is obtained directly from finite-volume transfer traces.
  Testing an interval of momenta then constrains the mass support without presupposing that its points are atoms.

=== 1.3 Proof strategy <proof-strategy>

Write $m_(*)$ for the bottom of the mass support of $rho$;
  the source gap and nonzero one-field norm imply $0 < m_(*) < oo$.
  At lattice cutoff $N$ and spatial circumference $w$, let $e_N \( w \)$ be the least positive transfer energy,
  and let $cal(N)_(N \, w) \( u \)$ count all transfer energies at most $u$,
  with multiplicity and with the vacuum included. The proof first compares $e_N \( w \)$ with $m_(*)$,
  then bounds the number of low transfer energies and uses that bound to constrain the mass support.

+ Section 3 derives rectangular trace bounds and local torus-to-plane comparison from the square
  partition-function input. This also gives a positive lower bound for $e_N \( w \)$,
  uniform in the cutoff and in sufficiently large circumferences.
+ Section 4 bounds covariances of even spin polynomials by the square of a two-point correlation.
  Consequently, among row functions unchanged by simultaneous spin inversion,
  every nonvacuum transfer energy is at least $2 e_N \( w \)$.
  The lowest excitation is odd, with a quantitative overlap that allows its sign to be tested by spin clusters.
+ Section 5 combines those clusters with local circuits to prove
  $ liminf_(w arrow.r oo) liminf_(N arrow.r oo) e_N \( w \) gt.eq m_(*) . $
  Here and in the counting step, $w$ runs through a fixed dyadic sequence of physical circumferences.
    This comparison identifies the mass scale needed for counting, without selecting a limiting eigenvector.
+ Section 6 proves
  $ limsup_(N arrow.r oo) cal(N)_(N \, w) \( 3 m_(*) \/ 2 \) lt.eq C w . $
  Exchanging the directions of a torus compares the heat trace at circumference $2
    w$ with the square of the trace at circumference $w$. A positive polynomial approximation to an energy cutoff
    shows that, below the two-excitation threshold, doubling the circumference can at most double the count,
    up to summable errors.
+ Section 7 uses spatial momentum projections and convergence of smeared two-point functions to show that $J$
  distinct masses near $m_(*)$ require at least $c J w$ such states. The constant $c > 0$ is independent of $J$.
  Hence there are only finitely many masses near $m_(*)$, and their smallest point is the atom in Theorem 1.

Throughout, cutoff limits are taken at fixed physical circumference before that circumference tends to infinity.
  The trace and moment estimates permit the comparisons needed in this order.

== 2 The continuum field and the uniform lattice inputs <sec:inputs>

We first specify the construction used in this paper and the estimates we retain from it.
  The finite-volume estimates are essential: a gap in the continuum Hamiltonian alone would not control how many
  transfer states can approach its lower edge.

Let $sigma$ be normalized area measure on $S^2$. At cutoff $N$, the lattice spacing is $a = a_N = L^(- N)$,
  and the probability on a periodic nearest-neighbor lattice $Lambda$ is

#[#set math.equation(numbering: n => "(2.1)")
 $ d mu_(N \, Lambda) \( q \) = Z_(N \, Lambda)^(- 1) exp #h(-0.16667em)
   (beta_N sum_({ x \, y } in E \( Lambda \)) q_x dot.op q_y) product_(x in Lambda) d sigma \( q_x \) . $ <inp:lattice>]

Each bond occurs once; there is no external field. We use the fixed prescription of #cite(label("OpenAI-O3"))
  Theorem 1.2: $L$ is a fixed dyadic integer, the terminal coupling $H$ is sufficiently large, and

$ beta_N = H + frac(log L, 2 pi) N + O \( log \( N + 1 \) \) \, wide B_N > 0 . $

The positive field normalization $B_N$ is the one in that prescription.
  For a real test $f in C_c^oo \( bb(R)^2 \)$ and a component $i$, put

#[#set math.equation(numbering: n => "(2.2)")
 $ X_f^i = B_N a^2 sum_x f \( x \) q_x^i . $ <inp:field>]

Coordinates $x$ and all torus lengths are physical. Torus tests are periodized from their indicated local charts.
  The cutoff plane state is the limit of periodic square tori, as in #cite(label("OpenAI-O3")) Proposition 2.1;
  no boundary spins are fixed. For time reflection, write $\( theta f \) \( t \, b \) = f \( - t \, b \)$.

Here are the precise construction results needed below. They hold for this same trajectory, normalization,
  and periodic state.

#thm([Proposition 2.1.])[
  (Inputs from the continuum construction).  #emph[There are integers $K_0 \, M_0 > 0$ and constants $c \,
    C > 0$ with the following properties. Write $w_k = M_0 2^k$,
    and let $Z_N \( t \, w \)$ be the partition function on a torus of time length $t$ and spatial circumference $w$.]
  + #emph[In the cutoff plane, all joint moments of the variables (2.2) converge to those of the Euclidean field
    $phi.alt$. The limiting Schwinger distributions are tempered, Euclidean invariant, and $O \( 3 \)$ covariant.
    Their Osterwalder–Schrader reconstruction is the Wightman field of Theorem 1, with unique vacuum $Omega$ and
$ H_(upright("phys")) \|_(Omega^perp) gt.eq m > 0 . $

 For some real test $f$ supported strictly in positive time,
   the one-field reflection norm $bb(E) \[ phi.alt^1 \( theta f \) phi.alt^1 \( f \) \]$ is strictly positive.]
  + #emph[For all $N gt.eq K_0$ and $k gt.eq 0$,
#[#set math.equation(numbering: n => "(2.3)")
 $ 0 lt.eq Delta_N \( w_k \) := 4 log Z_N \( w_k \, w_k \) - log Z_N \( 2 w_k \, 2 w_k \) lt.eq
   C e^(- c w_k) . $ <inp:defect>]

]
  + #emph[On these square tori and on the cutoff plane, the component moment measures
$ S_(r \, N)^(bold(i)) = \( B_N a^2 \)^r sum_(x_1 \, dots.h \, x_r) bb(E) #h(-0.16667em)
  [product_(j = 1)^r q_(x_j)^(i_j)] delta_(\( x_1 \, dots.h \, x_r \)) $

 are nonnegative. For arbitrary translated unit boxes $Q_1 \, dots.h \, Q_r$,
#[#set math.equation(numbering: n => "(2.4)")
 $ S_(r \, N)^(bold(i)) \( Q_1 times dots.h.c times Q_r \) lt.eq C^r r ! \, $ <inp:majorant>]

 uniformly in $N gt.eq K_0$, the square torus, the box positions, and the component indices.]
] <inp:contracts>

For completeness, the source locators distinguish the different strengths of these inputs.
  Part (i) uses #cite(label("OpenAI-O3")) Propositions 10.2, 10.3, 11.3, and 11.4;
  the nonzero one-field norm is proved in the final paragraph of the proof of Proposition 11.5.
  The reconstruction and separated-time Euclidean continuation are those of Osterwalder and
  Schrader #cite(label("OsterwalderSchrader1973")) #cite(label("OsterwalderSchrader1975")).
  Part (ii) follows from the uniform reference-box test and rectangular doubling criterion in
  #cite(label("OpenAI-O3")) Propositions 8.1 and 8.3: the base defect is at most $2^(- 10)$ and the defect after
  $k$ doublings is at most $64^(- 1) 2^(- 2^k)$. Their application to the constructed trajectory is made in
  #cite(label("OpenAI-O3")) Theorem 8.4. Part (iii) is #cite(label("OpenAI-O3")) Proposition 10.1.
  These statements retain the fixed parameter choices of that construction, including sufficiently large $H$.

=== 2.1 The bottom of the two-point mass support <the-bottom-of-the-two-point-mass-support>

Let $rho$ be the positive spectral measure in (1.1), and define

$ cal(M) = { sqrt(s) : s in "supp" rho } \, wide m_(*) = inf cal(M) . $

The following consequences do not presume that $rho$ has an atom.

#thm([Lemma 2.2.])[
  (Positive massive Euclidean kernel).  #emph[One has $0 < m_(*) < oo$.
    At separated Euclidean points, the like-component two-point function is the continuous kernel
#[#set math.equation(numbering: n => "(2.5)")
 $ C \( t \, b \) = integral rho \( d mu^2 \) integral_(bb(R)) frac(d p, 2 pi)
   frac(e^(i p b - t E \( p \, mu \)), 2 E \( p \, mu \)) \, wide E \( p \, mu \) = sqrt(p^2 + mu^2) \, quad
   t > 0 . $ <inp:euclidean>]

 It is strictly positive at every nonzero Euclidean separation, and there is a constant $C_0$ such that
#[#set math.equation(numbering: n => "(2.6)")
 $ 0 < C \( t \, b \) lt.eq C_0 e^(- m_(*) sqrt(t^2 + b^2)) quad upright("when ") sqrt(t^2 + b^2) gt.eq
   1 . $ <inp:decay>]

]
] <inp:kernel>

#proof[
  Internal symmetry gives $bb(E) phi.alt^i \( f \) = 0$, so one-field vectors lie in $Omega^perp$.
    Their positive energy-momentum spectral measures therefore put no weight at energies in $\[ 0 \, m \)$.
    If $"supp" rho$ met $\( 0 \, m^2 \)$, some compact interval $J
    subset \( 0 \, m^2 \)$ would have positive $rho$-measure.
    At sufficiently small spatial momenta, all shells with mass squared in $J$ have energy below $m$,
    a contradiction. Massless spectral weight would likewise give weight at arbitrarily small positive energies.
    Thus $cal(M) subset \[ m \, oo \)$. The nonzero one-field norm in Proposition 2(i) implies $rho eq.not 0$,
    so $m_(*) < oo$.
  The Källén–Lehmann representation #cite(label("Kallen1952")) #cite(label("Lehmann1954")) and separated-time
    Euclidean continuation give (2.5). To check convergence without an assumption on the nature of the mass
    support, recall that a positive tempered Fourier measure has polynomial growth.
    Restricting its spatial momentum to $\| p \| lt.eq 1$ shows that $rho \( \[ m^2 \, R^2 \] \)$ also has at most
    polynomial growth: the mass-shell factor $1 \/ \( 2 E \( p \, mu \) \)$ on this region is bounded below by a
    constant times $\( 1 + R \)^(- 1)$. Exponential damping therefore makes (2.5) and its derivatives absolutely
    convergent locally for $t > 0$.
  Euclidean invariance rotates a separation of length $r > 0$ to $\( r \, 0 \)$.
    At that point every integrand is positive and $rho eq.not 0$.
    For $r gt.eq 1$, factor $e^(- m_(*) r)$ out of the integral and use
  $ e^(- r \( E - m_(*) \)) lt.eq e^(- \( E - m_(*) \)) . $
  The remaining integral is finite by the preceding growth bound.
    This proves (2.6), as well as continuity away from coincidence.
    All uses of the kernel in this paper are off the coincidence diagonal. ◻
]

=== 2.2 Uniform tails for smeared spins <uniform-tails-for-smeared-spins>

The moment input lets us compare field correlations by first comparing bounded observables.
  Its uniformity under separate translations is important when two tests move far apart.

#thm([Lemma 2.3.])[
  (Moment and tail bounds).  #emph[Fix finitely many real component test shapes of bounded support.
    Their arbitrary translates, in the cutoff plane or in the square tori of Proposition 2, satisfy
#[#set math.equation(numbering: n => "(2.7)")
 $ bb(E) \| X_f^i \|^r lt.eq A^r r ! \, wide bb(E) e^(kappa \| X_f^i \|) lt.eq C $ <inp:tails-bound>]

 for some $A \, C \, kappa > 0$ independent of the cutoff, volume, and translations.
   The constants can also be chosen uniformly for test families of bounded supremum and support diameter.
   For each fixed $r$, tests supported in a common bounded set obey
#[#set math.equation(numbering: n => "(2.8)")
 $ parallel X_f^i - X_g^i parallel_(L^r) lt.eq C_r parallel f - g parallel_oo \, $ <inp:test-difference>]

 with the same uniformity under translations of that set.]
] <inp:tails>

#proof[
  Cover the support of each test by a bounded number of unit boxes.
    For an even moment, nonnegativity of the component moment measure allows us to replace all test factors by
    their absolute values and apply (2.4). This gives $bb(E) \| X_f^i \|^(2 r) lt.eq A^(2 r) \( 2 r \) !$.
    Cauchy–Schwarz gives the odd absolute moments, after increasing $A$.
    Summing the exponential series at any $kappa < A^(- 1)$ proves (2.7).
    Applying the same argument to $f - g$, with its supremum factored out, proves (2.8).
    The box bound is independent of the box positions, so none of these constants depends on translations.
    Products of any fixed number of such variables are controlled by Hölder’s inequality,
    even when the tests are translated independently. ◻
]

== 3 Transfer spectra and volume comparison <sec:transfer>

We now turn the square partition-function input into bounds at arbitrary aspect ratios.
  These bounds will control both the transfer state count and comparisons of widely separated local tests with the
  plane.

=== 3.1 Positive transfer and its energies <positive-transfer-and-its-energies>

Fix a cutoff $N$ and a circumference $w in a bb(N)$, with $w \/ a gt.eq 4$.
  A row is $q = \( q_x \)_(x in a bb(Z) \/ w bb(Z)) in \( S^2 \)^(w \/ a)$, with periodic indices.
  On the complex Hilbert space with product measure $d sigma^(⊗ w \/ a)$, define $K_(N \, w)$ by the kernel

#[#set math.equation(numbering: n => "(3.1)")
 $ K_(N \, w) \( q \, q' \) = exp #h(-0.16667em) {beta_N / 2 sum_x q_x dot.op q_(x + a) +
   beta_N sum_x q_x dot.op q'_x + beta_N / 2 sum_x q'_x dot.op q'_(x + a)} . $ <tra:kernel>]

The transfer construction is the one used in #cite(label("OpenAI-O3")) Section 8.2;
  we record its spectral details because both positivity and the absence of a null space will be used.

The expansion

$ e^(beta_N q dot.op q') = sum_(j gt.eq 0) frac(beta_N^j, j !) chevron.l q^(⊗ j) \, \( q' \)^(⊗ j) chevron.r $

expresses each crossing-bond kernel as a sum of positive semidefinite kernels.
  Tensoring over row sites and multiplying by the positive half-row weights preserves this property.
  The sum of diagonal integrals is finite, so $K_(N \, w)$ is trace class.
  Since $beta_N > 0$, a vector annihilated by this operator is orthogonal,
  after multiplication by the half-row weight, to every polynomial in the row coordinates.
  Such polynomials are dense in the row Hilbert space, and the half-row weight is bounded above and away from zero
  at fixed $N \, w$. Thus $K_(N \, w)$ has no null space.

Its continuous strictly positive kernel gives a simple largest eigenvalue $lambda_(0 \, N) \( w \) >
  0$ and a positive normalized eigenfunction $Omega_(N \, w)$. Put

#[#set math.equation(numbering: n => "(3.2)")
 $ T_(N \, w) = lambda_(0 \, N) \( w \)^(- 1) K_(N \, w) \, wide "spec" \( T_(N \, w) \) \\ { 0 } =
   { e^(- a E_j) : j gt.eq 0 } \, $ <tra:energies>]

where multiplicities are retained and $E_0 = 0 < E_1 lt.eq E_2 lt.eq dots.h.c$.
  The point $0$ may be a spectral limit but is not an eigenvalue. Define

#[#set math.equation(numbering: n => "(3.3)")
 $ e_N \( w \) & = E_1 \,\
R_(N \, w) \( t \) & = "Tr" T_(N \, w)^(t \/ a) = 1 + s_(N \, w) \( t \) \, wide s_(N \, w) \( t \) =
  sum_(j gt.eq 1) e^(- t E_j) \,\
cal(N)_(N \, w) \( u \) & = \# { j : E_j lt.eq u } . $ <tra:notation>]

Time lengths here and below are multiples of $a$; all displayed partition functions use at least four steps in
  each direction. We sometimes suppress $N$.

=== 3.2 From square defects to arbitrary rectangles <from-square-defects-to-arbitrary-rectangles>

#thm([Lemma 3.1.])[
  (Pressure and trace bounds).  #emph[For each $N gt.eq K_0$,
    define $P_N \( t \, w \) = \( t w \)^(- 1) log Z_N \( t \, w \)$ and $P_(oo \, N) =
    inf_(t \, w) P_N \( t \, w \)$. There are constants $c \, C > 0$, independent of $N$, such that,
    whenever $min \( t \, w \)$ is sufficiently large,
#[#set math.equation(numbering: n => "(3.4)")
 $ 0 lt.eq P_N \( t \, w \) - P_(oo \, N) lt.eq C e^(- c min \( t \, w \)) . $ <tra:pressure-bound>]

 If $g_N \( w \) = a^(- 1) log lambda_(0 \, N) \( w \) - w P_(oo \, N)$, then
#[#set math.equation(numbering: n => "(3.5)")
 $ 0 lt.eq g_N \( w \) lt.eq C w e^(- c w) \, wide 0 lt.eq log R_(N \, w) \( t \) lt.eq
   C t w e^(- c min \( t \, w \)) . $ <tra:trace>]

 The bound for $g_N$ holds at every sufficiently large allowed circumference.]
] <tra:pressure>

#proof[
  Transfer in the two coordinate directions gives
  $ Z_N \( t \, w \) = "Tr" K_(N \, w)^(t \/ a) = Z_N \( w \, t \) . $
  For fixed $w$, the quantity $P_N \( t \, w \)$ is $\( a w \)^(- 1)$ times the logarithm of the $ell^(t \/ a)$
    norm of the eigenvalue sequence of $K_(N \, w)$. These norms decrease as their exponent increases.
    Symmetry gives the same monotonicity in $w$. The finite-volume interaction is bounded in absolute value by $2
    beta_N t w \/ a^2$, so the infimum is finite for each fixed $N$.
    Separate monotonicity shows that $P_N \( t \, w \)$ tends to this infimum when both lengths tend to infinity.
  On the dyadic squares, (2.3) gives the exact identity
  $ P_N \( w_k \, w_k \) - P_N \( w_(k + 1) \, w_(k + 1) \) = frac(Delta_N \( w_k \), 4 w_k^2) . $
  Telescoping proves $0 lt.eq P_N \( w_k \, w_k \) - P_(oo \, N) lt.eq C e^(- c w_k)$ uniformly in $N$.
    For general $t \, w$ choose $w_k lt.eq min \( t \, w \) < 2 w_k$.
    Monotonicity bounds the pressure difference by its value on that square, proving (3.4).
  At fixed $w$, letting $t arrow.r oo$ gives $P_N \( t \, w \) arrow.r \( a w \)^(- 1) log
    lambda_(0 \, N) \( w \)$, since the normalized excited trace tends to zero.
    Equation (3.4) then proves the bound for $g_N$. Finally
  #[#set math.equation(numbering: n => "(3.6)")
   $ log R_(N \, w) \( t \) = t w #scale(x: 120%, y: 120%)[\(] P_N \( t \, w \) -
     P_(oo \, N) #scale(x: 120%, y: 120%)[\)] - t g_N \( w \) . $ <tra:trace-identity>]
  The left side is nonnegative and $g_N \( w \) gt.eq 0$, so the remaining bound follows. ◻
]

#thm([Corollary 3.2.])[
  (A positive physical gap at every large width).  #emph[There are $c_0 > 0$ and $w_0 < oo$ such that
$ e_N \( w \) gt.eq c_0 wide \( N gt.eq K_0 \, med w gt.eq w_0 \, med w in a_N bb(N) \) . $

]
] <tra:gap>

#proof[
  For sufficiently large $w$, Equation (3.5) at $t = w$ gives
  $ e^(- w e_N \( w \)) lt.eq s_(N \, w) \( w \) lt.eq e^(C w^2 e^(- c w)) - 1 lt.eq C' w^2 e^(- c w) . $
  Taking logarithms yields $e_N \( w \) gt.eq c - w^(- 1) log \( C' w^2 \) gt.eq c \/ 2$ after increasing $w_0$. ◻
]

This bound concerns every large allowed width, whereas the input (2.3) was stated only on dyadic squares.
  That distinction will be useful when a short time direction becomes a circumference.

=== 3.3 Slab insertions and comparison with the plane <slab-insertions-and-comparison-with-the-plane>

A bounded observable $F$ in a slab between rows $0$ and $r$ defines an integral kernel by integrating the
  intermediate spins and inserting $F$ in the transfer product.
  Divide this kernel by $lambda_(0 \, N) \( w \)^(r \/ a)$ and denote the resulting operator by $A_F$.
  Its left kernel variable is the row at time $0$, and its right kernel variable is the row at time $r$.
  When $r = 0$, $A_F$ is multiplication by $F$. This convention also fixes the reflected insertions used later:
  reflection reverses the slab and replaces $A_F$ by $A_F^(*)$ for real $F$.

#thm([Lemma 3.3.])[
  (Bounded slab insertion).  #emph[One has $parallel A_F parallel lt.eq parallel F parallel_oo$.
    Write $bb(E)_(upright("cyl") \, N \, w) F = chevron.l Omega_(N \, w) \,
    A_F Omega_(N \, w) chevron.r$ for the infinite-time cylinder expectation. If $t > r$, then
#[#set math.equation(numbering: n => "(3.7)")
 $ lr(|bb(E)_(upright("tor") \, N \; t \, w) F - bb(E)_(upright("cyl") \, N \, w) F|) lt.eq
   parallel F parallel_oo #scale(x: 120%, y: 120%)[\(] s_(N \, w) \( t - r \) +
   s_(N \, w) \( t \) #scale(x: 120%, y: 120%)[\)] . $ <tra:torus-cylinder>]

]
] <tra:insertion>

#proof[
  The absolute value of the insertion kernel is bounded pointwise by $parallel F
    parallel_oo$ times the kernel of $T_(N \, w)^(r \/ a)$. Apply this inequality to $\| v \|$ and use $parallel
    T_(N \, w)^(r \/ a) parallel = 1$ to obtain the operator norm bound.
    Put $P_0 = \| Omega_(N \, w) chevron.r chevron.l Omega_(N \, w) \|$. The torus expectation is
  $ frac("Tr" \( A_F T_(N \, w)^(\( t - r \) \/ a) \), 1 + s_(N \, w) \( t \)) . $
  Subtracting the ground-state term leaves a numerator bounded by $parallel F parallel_oo s_(N \, w) \( t - r \)$,
    because $T_(N \, w)^(\( t - r \) \/ a) - P_0$ is positive and has that trace.
    The denominator contributes at most $parallel F parallel_oo s_(N \, w) \( t \)$. This proves the estimate. ◻
]

#thm([Proposition 3.4.])[
  (Comparison for three-quarter supports).  #emph[Let $w = w_k$ be sufficiently large.
    If the support of a bounded observable $F$ has a lift contained in a rectangle of extent at most $3 w \/
    4$ in each coordinate, then
#[#set math.equation(numbering: n => "(3.8)")
 $ lr(|bb(E)_(upright("tor") \, N \; w \, w) F - bb(E)_(upright("plane") \, N) F|) lt.eq
   C parallel F parallel_oo e^(- c w) \, $ <tra:plane-comparison>]

 uniformly in $N gt.eq K_0$. The assertion holds for bounded measurable observables.
   Comparison of this square with its infinite-time cylinder requires only the time extent bound.]
] <tra:comparison>

#proof[
  First compare the tori $\( w \, w \)$ and $\( 2 w \, w \)$ with their common infinite-time cylinder.
    A slab enclosing the support has thickness at most $3 w \/ 4$, up to one lattice step,
    so all remaining transfer lengths are at least $w \/ 4 - a$.
    Equation (3.5) and Lemma 7 give an error $C parallel F parallel_oo e^(- c w)$;
    polynomial factors in $w$ are absorbed by decreasing $c$.
    Next compare $\( 2 w \, w \)$ and $\( 2 w \, 2 w \)$ in the spatial direction.
    The transverse circumference is now $2 w$, and the remaining transfer lengths are again at least $w \/ 4 - a$.
    The same bounds apply without an aspect-ratio restriction.
  Repeat these two comparisons at widths $2 w \, 4 w \, dots.h$ and sum $C parallel F parallel_oo sum_(j gt.eq 0)
    e^(- c 2^j w)$. At fixed cutoff the periodic square limit is the plane state in Proposition 2.
    More precisely, on a fixed finite support the uniform estimate for all bounded measurable $F$ makes the
    sequence of marginal laws Cauchy in total variation; its limit agrees with that periodic state on continuous
    functions and hence on all bounded measurable functions. This proves (3.8).
    The cylinder assertion follows directly from the first application of Lemma 7. ◻
]

#thm([Corollary 3.5.])[
  (Comparison of field moments).  #emph[Fix a number of component tests,
    chosen from families with uniformly bounded suprema and support diameters.
    If their translated supports together satisfy the extent condition of Proposition 8,
    then the square-torus and cutoff-plane expectations of their product differ by at most $C e^(- c w)$.
    The constants may depend on the number and shapes of the tests but not on their separate translations,
    the cutoff, or $w$.]
] <tra:moments>

#proof[
  Let $chi_w \( x \) = max \( - w \, min \( x \, w \) \)$ and replace each variable $X_j$ by $chi_w \( X_j \)$.
    If there are $r$ variables, the bounded product has supremum at most $w^r$,
    so Proposition 8 bounds its comparison error by $C w^r e^(- c w)$.
    On either probability space, Lemma 4, Hölder’s inequality, and the exponential tail give
  $ bb(E) lr(|product_(j = 1)^r X_j - product_(j = 1)^r chi_w \( X_j \)|) lt.eq
    sum_(j = 1)^r bb(E) #h(-0.16667em) [product_(i = 1)^r \| X_i \| thin upright(bold(1))_({ \| X_j \| > w })]
    lt.eq C e^(- c' w) . $
  For example, Cauchy–Schwarz separates each indicator from the product,
    whose second moment is uniformly bounded by Hölder. Combining the estimates and reducing the exponential rate
    proves the claim. Only bounded insertions have been used on cylinders. ◻
]

== 4 The even transfer sector <sec:parity>

The trace counts every excitation, whereas the two-point function sees only states created by the spin field.
  We first show that a lowest transfer excitation is odd under a component reflection,
  with a quantitative overlap controlled by its eigenvalue.
  The main ingredient is a finite-graph correlation bound: the covariance of two even spin monomials is quadratic
  in the largest two-point correlation between their supports.

For this section, consider any finite graph with spins $q_x in S^2$ and law

#[#set math.equation(numbering: n => "(4.1)")
 $ 1 / Z exp #h(-0.16667em) (sum_(x y) J_(x y) q_x dot.op q_y) product_x d sigma \( q_x \) \, wide 0 lt.eq
   J_(x y) < oo \, $ <par:graph-law>]

where $sigma$ is sphere probability measure. A list of sites records one entry per factor of a monomial;
  repeated sites remain separate entries.

#thm([Proposition 4.1.])[
  (Quadratic covariance bound).  #emph[Let $P$ and $Q$ be monomials in spin components for the law (4.1),
    of even total degrees $r$ and $s$, with nonempty site lists $cal(A)$ and $cal(B)$. Put
$ G = max_(x in cal(A) \, med y in cal(B)) bb(E) \( q_x^3 q_y^3 \) . $

 There is a constant $C_(r \, s)$, depending only on the two degrees, such that
#[#set math.equation(numbering: n => "(4.2)")
 $ \| "Cov" \( P \, Q \) \| lt.eq C_(r \, s) G^2 . $ <par:quadratic-bound>]

 If either monomial is constant, its covariance is zero.]
] <par:covariance>

We prove the proposition in three stages. A component decomposition first gives correlation signs.
  A positive pairing expansion then proves the bound for single-component monomials.
  Finally, a Fourier comparison reduces mixed components to that case.
  These arguments use the correlation-inequality methods of Griffiths, Kelly–Sherman,
  and Ginibre #cite(label("Griffiths1967")) #cite(label("KellySherman1968")) #cite(label("Ginibre1970"));
  the component comparisons are also related to the multicomponent rotator inequalities of
  Dunlop #cite(label("Dunlop1976")).

=== 4.1 Component decomposition and correlation signs <component-decomposition-and-correlation-signs>

Write, independently at each site,

#[#set math.equation(numbering: n => "(4.3)")
 $ q_x = \( cos alpha_x cos theta.alt_x \, cos alpha_x sin theta.alt_x \, sin alpha_x u_x \) \, quad 0 lt.eq
   alpha_x lt.eq pi / 2 \, quad u_x in { - 1 \, 1 } \, quad theta.alt_x in bb(R) \/ 2 pi bb(Z) . $ <par:angles>]

The one-site reference law is the product of $cos alpha_x thin d
  alpha_x$ and the uniform laws of $u_x$ and $theta.alt_x$.
  Given $alpha$, the signs and angles are independent, with respective Ising and plane-rotator couplings

#[#set math.equation(numbering: n => "(4.4)")
 $ J_(x y)^(upright(I)) = J_(x y) sin alpha_x sin alpha_y \, wide J_(x y)^(upright(R)) =
   J_(x y) cos alpha_x cos alpha_y . $ <par:conditional-couplings>]

We order angle arrays coordinatewise. A law is #emph[positively associated] if the covariance of every pair of
  bounded increasing functions is nonnegative.

We recall explicitly the plane-rotator inequality needed below.
  For any integer vectors $k \, l$ indexed by the graph vertices,

#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) cos \( k dot.op theta.alt \) gt.eq 0 \, wide "Cov" #scale(x: 120%, y: 120%)[\(]
   cos \( k dot.op theta.alt \) \, cos \( l dot.op theta.alt \) #scale(x: 120%, y: 120%)[\)] gt.eq
   0 . $ <par:rotator-inequalities>]

The first inequality follows by expanding each bond exponential into its nonnegative Fourier coefficients.
  Here is the replica proof of the second, in the form of Ginibre’s method.
  With independent copies $theta.alt \, theta.alt'$, twice the covariance is the expectation of the product of the
  two observable differences. The substitution

$ theta.alt = U + V \, wide theta.alt' = U - V $

preserves product Haar integration: it is a surjective homomorphism of the product torus.
  Each difference is $- 2 sin \( k dot.op U \) sin \( k dot.op V \)$,
  while the replicated bond exponent is $2 J_(x y) cos \( U_x - U_y \) cos \( V_x - V_y \)$.
  Expanding its exponential gives nonnegative coefficients times squares of real integrals, proving (4.5).
  In particular every cosine mean is nondecreasing in each nonnegative coupling, by differentiation.
  The zero-field Ising GKS inequalities give the corresponding nonnegative means and covariances for sign
  monomials #cite(label("Griffiths1967")) #cite(label("KellySherman1968")).

#thm([Lemma 4.2.])[
  (Association and single-component signs).  #emph[The marginal law of $alpha$ in (4.3) is positively associated.
    For even-degree monomials each using a single component, covariances are nonnegative when the components agree
    and nonpositive when they differ. The same covariance signs hold for the two-component plane rotator.]
] <par:association>

#proof[
  Relative to the product angle reference law, the density of $alpha$ is proportional to
    $Z_(upright(I)) \( alpha \) Z_(upright(R)) \( alpha \)$. For either conditional model,
    write $O_e$ for its bond observable and $J_e \( alpha \)$ for its coupling. At distinct vertices $x \, y$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ partial_x partial_y log Z = sum_e bb(E) \( O_e \) thin partial_x partial_y J_e +
     sum_(e \, f) "Cov" \( O_e \, O_f \) thin partial_x J_e thin partial_y J_f gt.eq 0 . $ <par:mixed-partials>]
  Indeed all first derivatives of the sine couplings are nonnegative and all first derivatives of the cosine
    couplings are nonpositive. A coupling’s only nonzero mixed derivative at distinct sites is at its endpoints,
    where it is nonnegative in both cases. All bond means and covariances in (4.6) are nonnegative by the
    inequalities just proved or recalled. Thus the density satisfies the FKG lattice condition,
    which implies association #cite(label("FKG1971")). One may restrict the angles to compact subintervals of
    $\( 0 \, pi \/ 2 \)$, discretize, and pass to the limit; this also handles the endpoints of the angle interval.
  To obtain the same fact for the plane rotator, write its two coordinates as
    $\( cos gamma thin epsilon \, sin gamma thin epsilon' \)$, where $0 lt.eq gamma lt.eq
    pi \/ 2$ and the two signs are conditionally independent ferromagnetic Ising systems.
    The calculation (4.6) proves association of $gamma$. The conditional mean of a single-component monomial is
    nonnegative. Including its amplitude factors, it decreases with $gamma$ for the first coordinate and increases
    for the second. Conditional independence and association therefore give nonpositive covariance between unlike
    components. For like components, the conditional covariance is nonnegative by GKS,
    and the covariance of conditional means is nonnegative by association. This proves both plane-rotator assertions.
  In the three-component decomposition, the conditional mean of a color-$3$ monomial is likewise nonnegative and
    increasing in $alpha$. The conditional mean of a color-$1$ monomial is nonnegative and decreasing:
    a product of cosines is a nonnegative linear combination of $cos \( k dot.op theta.alt \)$,
    and both the amplitude factors and the rotator couplings decrease with $alpha$.
    Conditional independence now gives the nonpositive covariance between colors $3$ and $1$.
    For like colors, use GKS or (4.5) for the conditional covariance and association for the covariance of
    conditional means. Component symmetry gives every remaining choice of colors. ◻
]

=== 4.2 Pairings and the reduction of mixed components <pairings-and-the-reduction-of-mixed-components>

#proof[
  Expand each bond exponential in (4.1) into powers of the dot product.
    The uniform sphere moment tensor of order $2 h$ is
  $ integral_(S^2) q^(i_1) dots.h.c q^(i_(2 h)) thin d sigma \( q \) =
    frac(1, 3 dot.op 5 dots.h.c \( 2 h + 1 \)) sum_pi product_({ b \, c } in pi) upright(bold(1))_(i_b = i_c) \, $
  where the sum is over pairings of the $2 h$ labeled factors; odd tensors vanish.
    Following the contracted bond lines through these site pairings pairs the external factors,
    with closed lines contributing positive color sums. Consequently,
    for an arbitrary color assignment to the combined lists $cal(A) \, cal(B)$, the joint moment has the form
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(E) product_(b = 1)^(r + s) q_(x_b)^(i_b) = sum_pi d_pi product_({ b \, c } in pi)
     upright(bold(1))_(i_b = i_c) \, wide d_pi gt.eq 0 . $ <par:pairings>]
  The coefficients do not depend on the external colors. The finite graph and finite couplings ensure absolute
    convergence of the exponential expansion; all compatible contracted terms are nonnegative.
    This justifies collecting them by their external pairing, including when sites are repeated.
  #emph[Crossing pairs.] Call a pair crossing if it joins the two lists.
    Since both list sizes are even, a pairing with a crossing pair has at least two. For any such pairing we claim
  #[#set math.equation(numbering: n => "(4.8)")
   $ d_pi lt.eq G^2 . $ <par:pair-coefficient>]
  Assign color $3$ to the endpoints of one crossing pair, color $2$ to the endpoints of another,
    and color $1$ to all remaining endpoints. The resulting moment contains $d_pi$ as a nonnegative summand.
    Condition on $alpha$. In the rotator model, Lemma 11 bounds the moment of the color-$2$ pair times the
    remaining color-$1$ monomial by the product of their means, and hence by the color-$2$ pair mean,
    because the color-$1$ monomial’s mean lies in $\[ 0 \, 1 \]$.
    Include the factors $cos alpha_x$ in this statement. The resulting pair mean is nonnegative and decreasing in
    $alpha$. Indeed, rotator invariance gives
  $ bb(E) \( sin theta.alt_x sin theta.alt_y divides alpha \) = 1 /
    2 bb(E) #scale(x: 120%, y: 120%)[\(] cos \( theta.alt_x - theta.alt_y \) divides alpha
    #scale(x: 120%, y: 120%)[\)] \, $
  also when $x = y$, and both this cosine mean and the amplitude factors decrease with $alpha$.
    The color-$3$ pair mean, including its sine factors, is nonnegative and increasing.
    Association bounds the average of their product above by the product of their averages.
    Each average is a two-point function between the lists, at most $G$ by component symmetry. This proves (4.8).
  Consider next single-component monomials on the two lists.
    Compare the case where their colors agree with the case where they differ.
    Their products of means agree by symmetry, while their joint moments differ by exactly the sum of the crossing
    contributions in (4.7). The two covariances have opposite weak signs by Lemma 11.
    Thus each absolute covariance is at most the number of pairings times $G^2$.
    The same conclusion holds for any even sublists of $cal(A)$ and $cal(B)$, with the same $G$.
    If either $P$ or $Q$ has odd degree in at least one color, its own mean vanishes.
    Every compatible pairing for $P Q$ then crosses the two lists, so (4.8) also proves the required bound in this case.
  It remains to treat monomials even in every color. This is the only case where subtracting the product of
    mixed-component means cannot be read directly from the pairing expansion.
    Write $P = W_P V_P$, where $W_P$ uses color $3$ and $V_P$ uses colors $1 \, 2$.
    Let $V_P^(*)$ replace every color in $V_P$ by color $1$, and define
  $ a_P = bb(E) \( W_P divides alpha \) \, wide b_P = bb(E) \( V_P divides alpha \) \, wide B_P =
    bb(E) \( V_P^(*) divides alpha \) . $
  Use the corresponding notation for $Q$. We have $0 lt.eq a_P \, B_P lt.eq 1$ and $\| b_P \| lt.eq 1$;
    $a_P$ is increasing and $B_P$ decreasing. Conditional independence of signs and rotator angles gives
    $bb(E) \( P divides alpha \) = a_P b_P$. Thus the total covariance identity reads
  #[#set math.equation(numbering: n => "(4.9)")
   $ "Cov" \( P \, Q \) = bb(E) "Cov" \( P \, Q divides alpha \) +
     "Cov" \( a_P b_P \, a_Q b_Q \) . $ <par:total-covariance>]
  We bound the conditional fluctuations first, then the covariance of the conditional means.
    A Fourier comparison with the single-color monomials $V_P^(*) \, V_Q^(*)$ will control both terms.
  #emph[The common Fourier comparison.] Factor out the common amplitude $A_P \( alpha \)$, a product of cosines,
    and expand the coordinate factors:
  #[#set math.equation(numbering: n => "(4.10)")
   $ V_P = A_P \( alpha \) sum_k c_k cos \( k dot.op theta.alt \) \, wide V_P^(*) =
     A_P \( alpha \) sum_k d_k cos \( k dot.op theta.alt \) \, wide \| c_k \| lt.eq d_k . $ <par:fourier-domination>]
  Each factor has two exponential terms with coefficients of absolute value $1 \/ 2$.
    Replacing sines by cosines replaces their phases by positive coefficients.
    Since there are evenly many sine factors, the coefficients are real and invariant under $k mapsto - k$.
    Grouping terms at a common frequency preserves the displayed domination, even at repeated sites.
  #emph[Conditional fluctuations.] Conditional independence gives
  $ "Cov" \( P \, Q divides alpha \) =  & "Cov" \( W_P \, W_Q divides alpha \) thin bb(E) \( V_P V_Q divides alpha \)\
 & + a_P a_Q "Cov" \( V_P \, V_Q divides alpha \) . $
  The first conditional covariance is nonnegative. The Fourier comparison (4.10) and the entrywise nonnegative
    cosine covariances in (4.5) imply
  $ \| "Cov" \( V_P \, V_Q divides alpha \) \| lt.eq "Cov" \( V_P^(*) \, V_Q^(*) divides alpha \) . $
  All remaining factors have absolute value at most one. Averaging thus bounds $\| bb(E)
    "Cov" \( P \, Q divides alpha \) \|$ by
  $ bb(E) "Cov" \( W_P \, W_Q divides alpha \) + bb(E) "Cov" \( V_P^(*) \, V_Q^(*) divides alpha \) . $
  Each summand is at most its full single-component covariance:
    the omitted covariance of conditional means is nonnegative, since both $a$’s increase and both $B$’s decrease.
    The single-component bounds therefore control the first term of (4.9) by $C_(r \, s) G^2$.
  #emph[Covariance of conditional means.] It remains to control $"Cov" \( a_P b_P \, a_Q b_Q \)$.
    The functions $b_P \, b_Q$ need not be monotone, but their changes are bounded by those of $B_P \, B_Q$.
    Indeed, (4.10) shows that $B_P + b_P$ and $B_P - b_P$ are nonnegative combinations of cosine means,
    multiplied by $A_P$. Both functions are decreasing, by (4.5) and the decreasing rotator couplings.
    For ordered angle arrays $alpha lt.eq tilde(alpha)$, it follows that
  $ \| b_P \( tilde(alpha) \) - b_P \( alpha \) \| lt.eq B_P \( alpha \) - B_P \( tilde(alpha) \) . $
  Set $Y_P = a_P b_P$ and $D_P = a_P - B_P$. Combining this estimate with the increase of $a_P$ and the bounds
    $a_P \, \| b_P \| lt.eq 1$ gives
  $ \| Y_P \( tilde(alpha) \) - Y_P \( alpha \) \| & lt.eq a_P \( tilde(alpha) \) - a_P \( alpha \) +
    B_P \( alpha \) - B_P \( tilde(alpha) \)\
 & = D_P \( tilde(alpha) \) - D_P \( alpha \) . $
  In particular $D_P + Y_P$ and $D_P - Y_P$ are increasing.
    Apply association to these functions and $D_Q plus.minus Y_Q$.
    Adding the two inequalities with matching signs, and then the two with opposite signs, gives
  #[#set math.equation(numbering: n => "(4.11)")
   $ \| "Cov" \( Y_P \, Y_Q \) \| lt.eq "Cov" \( D_P \, D_Q \) . $ <par:conditional-mean-bound>]
  Every term in the expansion
  $ "Cov" \( D_P \, D_Q \) = "Cov" \( a_P \, a_Q \) + "Cov" \( B_P \, B_Q \) - "Cov" \( a_P \, B_Q \) -
    "Cov" \( B_P \, a_Q \) $
  is controlled by a single-component covariance already bounded above.
    For the two like-color terms, conditional covariances are nonnegative,
    so the covariances of conditional means are at most the full covariances.
    For the unlike-color terms, conditional independence identifies the covariances of conditional means with the
    full covariances exactly. All their lists are even sublists of the original two lists.
    Hence (4.11) bounds the second term of (4.9) by $C_(r \, s) G^2$ as well. Combining the two bounds proves (4.2). ◻
]

=== 4.3 Spectral consequence and overlap <spectral-consequence-and-overlap>

Return to the transfer operator at fixed cutoff $N$ and circumference $w$.
  Write $T = T_(N \, w)$, $Omega = Omega_(N \, w)$, and $tau = e^(- a e_N \( w \)) in \( 0 \, 1 \)$.
  A row function is #emph[even] or #emph[odd] according to its parity under simultaneous inversion of every row
  spin. The vacuum $Omega$ is even by its uniqueness and positivity.

#thm([Proposition 4.3.])[
  (Even-sector bound and odd overlap).  #emph[On the even subspace perpendicular to the vacuum,
#[#set math.equation(numbering: n => "(4.12)")
 $ parallel T \|_(upright("even") ∩ Omega^perp) #scale(x: 120%, y: 120%)[parallel] lt.eq tau^2 . $ <par:even-norm>]

 There is a real unit $tau$-eigenfunction $psi$ that is odd under simultaneous spin inversion and,
   after a component permutation, odd under the reflection of component $3$ alone. It satisfies
#[#set math.equation(numbering: n => "(4.13)")
 $ chevron.l Omega \, \| psi \| chevron.r^2 gt.eq frac(tau, 1 + tau) . $ <par:overlap>]

]
] <par:even-gap>

#proof[
  The finite-graph covariance bound passes to the infinite-time cylinder by transfer convergence.
    For sites on two rows separated by $j$ time steps, their single-component correlation is at most $tau^j$:
    the vectors $q_x^i Omega$ are centered, have norm at most one, and $T$ has norm $tau$ on $Omega^perp$.
    Proposition 10 therefore gives, for every real even row polynomial $P$ and its centered vector
    $v_P = \( P - chevron.l Omega \, P Omega chevron.r \) Omega$,
  #[#set math.equation(numbering: n => "(4.14)")
   $ 0 lt.eq chevron.l v_P \, T^j v_P chevron.r lt.eq C_P tau^(2 j) . $ <par:polynomial-decay>]
  Here we have summed the finitely many monomial covariance bounds; the constant need not be uniform in $P \, N$,
    or $w$.
  Polynomials in row components are uniformly dense in the continuous functions on the compact row space.
    Symmetrizing gives density of even polynomials in the even subspace.
    The continuous positive function $Omega$ has a positive minimum,
    so multiplication by $Omega$ is bounded and invertible. Hence the complex linear span of the vectors $v_P$ is
    dense in the even vacuum complement. Since the spectral measure of each $v_P$ is positive,
    (4.14) excludes any of its mass above $tau^2$: positive mass in $\[ tau' \, 1 \]$ with $tau' >
    tau^2$ would give a lower bound proportional to $\( tau' \)^j$. Density proves (4.12).
  Compactness of $T$ implies that $tau$ is an eigenvalue. As $tau > tau^2$, its eigenspace is odd.
    The three component reflections commute with each other and with the real operator $T$,
    so one may choose a real unit eigenfunction with a definite parity under each reflection.
    Their product is simultaneous inversion, so at least one component parity is odd; relabel that component as $3$.
  The modulus $\| psi \|$ is even. Put $b = chevron.l Omega \, \| psi \| chevron.r^2$.
    Positivity of the transfer kernel and (4.12) give
  $ tau = chevron.l psi \, T psi chevron.r lt.eq chevron.l \| psi \| \, T \| psi \| chevron.r lt.eq
    b + \( 1 - b \) tau^2 . $
  Rearranging yields $b gt.eq tau \/ \( 1 + tau \)$, as claimed. ◻
]

Thus the lowest excitation has a bounded, component-odd detector:
  $F = "sgn" psi$, with $F = 0$ on the zero set, satisfies $\| F \| lt.eq 1$ and $chevron.l Omega \,
  F psi chevron.r = chevron.l Omega \, \| psi \| chevron.r$.
  The next section uses this detector to turn the spectral overlap into a connection probability.

== 5 Visibility of the lowest transfer energy <sec:visibility>

The lowest transfer excitation need not be created by a single spin.
  We now show that its energy is nevertheless constrained by the lowest mass seen by the spin field.
  The odd eigenfunction from Section 4 first detects a sign-cluster connection between two rows.
  Local circuits then attach a uniformly positive amount of #emph[normalized] spin weight to that connection.

#thm([Proposition 5.1.])[
  #emph[Along the prescribed circumferences $w_k = M_0 2^k$,
#[#set math.equation(numbering: n => "(5.1)")
 $ liminf_(k arrow.r oo) thick liminf_(N arrow.r oo) e_N \( w_k \) gt.eq m_(*) . $ <vis:gap>]

]
] <vis:proposition>

Throughout this section we work on the square torus of side $w = w_k$, take $w$ sufficiently large, and put $d =
  floor.l sqrt(w) floor.r$ in physical units. All fixed integer displacements below are lattice displacements,
  since $a^(- 1) = L^N$ is an integer. Constants do not depend on $N$, $w$,
  or translations of the specified test functions.

=== 5.1 From an odd eigenfunction to an open path <from-an-odd-eigenfunction-to-an-open-path>

Use the decomposition $q_x = \( cos alpha_x thin z_x \, sin alpha_x thin u_x \)$ of Section 4,
  where $z_x = \( cos theta.alt_x \, sin theta.alt_x \)$. Conditional on $alpha$,
  couple the Ising signs $u_x$ to bonds $eta_(x y) in { 0 \,
  1 }$ by the Edwards–Sokal construction #cite(label("EdwardsSokal1988")), with couplings

$ J_(x y) \( alpha \) = beta_N sin alpha_x sin alpha_y . $

Given the full spin configuration, these bonds are independent:
  a bond is closed when $u_x eq.not u_y$, and otherwise is open with probability $1 -
  e^(- 2 J_(x y) \( alpha \))$. In the reverse conditioning, given $alpha \, eta$,
  each connected component of open bonds receives an independent fair sign.
  These signs are also independent of the rotator variables $z$. We call the connected components #emph[sign clusters].

The joint law of $\( alpha \, eta \)$ is positively associated for the coordinatewise order.
  Indeed, the angle law is associated by Lemma 11. Conditional on $alpha$, the bond law has weights proportional to

$ 2^(k \( eta \)) product_(x y : thin eta_(x y) = 1) #scale(x: 120%, y: 120%)[\(] e^(2 J_(x y) \( alpha \)) -
  1 #scale(x: 120%, y: 120%)[\)] \, $

where $k \( eta \)$ is the number of clusters. Supermodularity of $k \( eta \)$ gives the FKG lattice condition,
  and increasing any coupling increases this bond law stochastically #cite(label("FKG1971")).
  These facts hold on the finite torus graph; zero couplings follow by continuity.
  For increasing functions $f \, g$ of $\( alpha \, eta \)$, conditional association gives

$ bb(E) \( f g divides alpha \) gt.eq bb(E) \( f divides alpha \) bb(E) \( g divides alpha \) . $

Both conditional means increase with $alpha$, by the stochastic monotonicity just noted.
  A second application of association, now to $alpha$, proves the assertion.

#thm([Lemma 5.2.])[
  #emph[The probability that an open cluster meets both the row at time $0$ and the row at time $d$ satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(P)_(upright("tor")) \( 0 arrow.l.r d \) gt.eq c thin e^(- \( d + a \) e_N \( w \)) . $ <vis:row-connection>]

]
] <vis:row-lemma>

#proof[
  Suppress $N \, w$ from the transfer notation. Let $psi$ be the real unit $tau$-eigenfunction furnished in
    Section 4, where $tau = e^(- a e_N \( w \))$, and choose color $3$ so that $psi$ is odd under its sign flip.
    The row observable $F = "sgn" psi$, with $"sgn" 0 = 0$, is bounded by one and has the same oddness.
    Its torus correlation is
  $ bb(E)_(upright("tor")) \[ F \( 0 \) F \( d \) \] =
    frac("Tr" #scale(x: 120%, y: 120%)[\(] F T^(d \/ a) F T^(\( w - d \) \/ a) #scale(x: 120%, y: 120%)[\)],
    R_(N \, w) \( w \)) . $
  Every summand in its eigenbasis expansion is nonnegative.
    The summand with $psi$ on the segment of length $d$ and $Omega$ on the other segment is
  $ frac(e^(- d e_N \( w \)) \| chevron.l Omega \, F psi chevron.r \|^2, R_(N \, w) \( w \)) =
    frac(e^(- d e_N \( w \)) chevron.l Omega \, \| psi \| chevron.r^2, R_(N \, w) \( w \)) gt.eq
    c thin e^(- \( d + a \) e_N \( w \)) \, $
  by (4.13) and the uniform bound for $R_(N \, w) \( w \)$ in (3.5).
    Here $tau \/ \( 1 + tau \) gt.eq tau \/ 2$; in particular, no bound on $a e_N \( w \)$ is required.
  If no cluster meets both rows, flip the signs of every cluster meeting the first row.
    Conditional on $alpha \, z \, eta$, this preserves the law, changes the sign of $F \( 0 \)$,
    and leaves $F \( d \)$ unchanged. Thus the conditional expectation of their product is zero off ${ 0 arrow.l.r
    d }$, and its absolute value is at most one on that event. The claimed probability bound follows. ◻
]

=== 5.2 Giving a cluster positive normalized weight <giving-a-cluster-positive-normalized-weight>

A connection probability alone does not control the normalized field,
  because the normalization $B_N$ varies with the cutoff. We therefore put $B_N$ into the cluster weights from the
  outset. For nonnegative smooth tests $h \, h'$ supported in local torus charts, set

#[#set math.equation(numbering: n => "(5.3)")
 $ x_(cal(C)) \( h \) & = B_N a^2 sum_(y in cal(C)) h \( y \) sin alpha_y \,\
S \( h \, h' \) & = sum_(cal(C)) x_(cal(C)) \( h \) x_(cal(C)) \( h' \) . $ <vis:weights>]

In this section $X_h = B_N a^2 sum_y h \( y \) q_y^3$. Independent cluster signs give the exact identity

#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) \( X_h X_(h') divides alpha \, eta \) = S \( h \, h' \) . $ <vis:conditional-weight>]

Moreover, $S \( h \, h' \)$ increases in $\( alpha \, eta \)$:
  increasing an angle increases every relevant sine factor, and merging two clusters adds only nonnegative cross terms.

Fix a nonzero nonnegative $h in C_c^oo \( \( - 1 \, 1 \)^2 \)$,
  and let $h_s$ be its translate to a lattice center $s$. Let $h'_s$ be the translate to $s +
  10 upright(bold(e))_t$, where $upright(bold(e))_t$ is the unit vector in the time direction.
  Tests are periodized on the torus.

#thm([Lemma 5.3.])[
  #emph[There exist $epsilon.alt \, c_0 > 0$ and fixed thresholds $N_0 \, w_0$ such that for $N gt.eq N_0$, $w =
    w_k gt.eq w_0$, and every center $s$,
#[#set math.equation(numbering: n => "(5.5)")
 $ bb(P)_(upright("tor")) { S \( h_s \, h'_s \) gt.eq epsilon.alt } gt.eq c_0 . $ <vis:positive-weight>]

]
] <vis:weight-lemma>

#proof[
  By (5.4), the expectation of $S \( h_s \, h'_s \)$ is the corresponding normalized spin correlation.
    Translation invariance, plane moment convergence, and the strictly positive continuum kernel of Lemma 3 show
    that the cutoff plane expectation is bounded below by a positive constant for all large $N$.
    Corollary 9 transfers this lower bound to all sufficiently large $w$, uniformly in $N \, s$.
    Thus $bb(E)_(upright("tor")) S \( h_s \, h'_s \) gt.eq c_1 > 0$.
    Conditional Jensen and the uniform fourth moments give
  $ bb(E)_(upright("tor")) S \( h_s \, h'_s \)^2 lt.eq bb(E)_(upright("tor")) \( X_(h_s)^2 X_(h'_s)^2 \) lt.eq C_1 . $
  The elementary second-moment inequality now yields
  $ bb(P)_(upright("tor")) { S \( h_s \, h'_s \) gt.eq c_1 \/ 2 } gt.eq frac(c_1^2, 4 C_1) . $
  All constants already include the field normalization, so they are independent of the cutoff. ◻
]

=== 5.3 Circuits and the weighted connection estimate <circuits-and-the-weighted-connection-estimate>

Write $Q_r \( s \) = s + \[ - r \, r \]^2$. We next construct a connected open set in $Q_6 \( s \) \\ "int"
  Q_4 \( s \)$ meeting every path from $Q_1 \( s \)$ to the exterior of $Q_6 \( s \)$,
  with probability bounded below uniformly. Call such a set a #emph[barrier].
  The four strips are the translates and quarter-turns of $\[ - 6 \, 6 \] times \[ 4 \, 6 \]$.
  A #emph[short-way] crossing joins the sides at distance $2$; a #emph[long-way] crossing joins those at distance $12$.

On the event in (5.5), some cluster joins $Q_1 \( s \)$ to $Q_1 \( s + 10 upright(bold(e))_t \)$,
  hence exits $Q_6 \( s \)$. Follow such a path until its first hit of the boundary of $Q_6 \( s \)$.
  In a coordinate that reaches the boundary, take the segment after its last visit to level $4$ with the relevant
  sign. This segment lies in one of the four strips and crosses it short-way.
  A union bound and square symmetry therefore give a fixed positive lower bound for the short-way crossing
  probability of each strip.

To obtain long-way crossings, we use the planar RSW theorem of Köhler-Schindler and
  Tassion #cite(label("KohlerSchindlerTassion2023")) Theorem 1, preprint version.
  In the notation $cal(H) \( m \, n \)$ for a horizontal crossing of $\[ - m \, m \] times \[ - n \, n \]$,
  its relevant assertion is that, for each $r gt.eq 1$, there is an increasing homeomorphism $Psi_r : \[ 0 \, 1 \]
  arrow.r \[ 0 \, 1 \]$ such that

#[#set math.equation(numbering: n => "(5.6)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] cal(H) \( r n \, n \) #scale(x: 120%, y: 120%)[\)] gt.eq
   Psi_r #h(-0.16667em)
   (bb(P) #scale(x: 120%, y: 120%)[\(] cal(H) \( n \, r n \) #scale(x: 120%, y: 120%)[\)]) $ <vis:rsw>]

for a positively associated bond law on $bb(Z)^2$ invariant under the square-lattice symmetries.
  We use $r = 6$ and $n = a^(- 1)$.

The law to which we apply this theorem is the #emph[cutoff plane] bond law,
  obtained by sampling bonds conditional on the plane spins by the same local edge rule.
  It has the required square symmetries. For a local bond event,
  its conditional probability given spins is a bounded observable of the incident vertices,
  with supremum norm at most one. Consequently Proposition 8 compares torus and plane probabilities with error $C
  e^(- c w)$, uniformly in the cutoff. At fixed cutoff, taking the torus size to infinity also transfers
  association to increasing cylinder events in the plane. This suffices for association of arbitrary increasing
  Borel events: compact subsets of an increasing event and its complement can be separated by an increasing
  cylinder event, and inner regularity then gives approximation in probability.
  To see the separation, no configuration in the first compact set is coordinatewise below one in the second;
  compactness selects finitely many coordinates witnessing all these failures of order.

Thus the short-way bound passes to the plane, (5.6) gives a uniform long-way bound there,
  and comparison passes that bound back to all large tori. The theorem requires neither a Markov property nor
  association under changed spin boundary conditions.

Let $B_s$ be the increasing event that all four strips have long-way crossings.
  Positive association gives $bb(P)_(upright("tor")) \( B_s \) gt.eq c_2 > 0$. Adjacent crossings meet:
  in their common $2$-by-$2$ corner square one contains a horizontal crossing and the other a vertical crossing.
  Their union is therefore connected. Every path from $Q_1 \( s \)$ to the exterior of $Q_6 \( s \)$ has a
  short-way crossing of one strip, by the boundary-hit argument above,
  and hence intersects that strip’s long-way crossing. Thus the four crossings form a barrier.
  This is the separating property of the circuit construction that we need,
  and it holds in a single planar chart of the torus.

Set $H_s = h_s + h'_s$. On

$ A_s = B_s ∩ { S \( h_s \, h'_s \) gt.eq epsilon.alt } \, $

every cluster contributing to $S \( h_s \, h'_s \)$ meets the barrier and therefore is the cluster containing it,
  say $cal(C)_s$. Hence

$ x_(cal(C)_s) \( h_s \) x_(cal(C)_s) \( h'_s \) gt.eq epsilon.alt \, wide x_(cal(C)_s) \( H_s \) gt.eq
  sqrt(epsilon.alt) . $

The event $A_s$ is increasing and has probability at least $c_0 c_2$.

Cover each row in Lemma 14 by intervals of radius $1$ centered at integer spatial coordinates.
  There are $O \( w \)$ intervals per row. For centers $s \, t$ on the two rows,
  let $D_(s t)$ be the event that an open path joins their intervals.
  For large $w$, the rings around $s$ and $t$ are disjoint.
  On $D_(s t) ∩ A_s ∩ A_t$, a connecting path meets both barriers, so $cal(C)_s$ and $cal(C)_t$ are one cluster.
  Its two normalized weights give $S \( H_s \, H_t \) gt.eq epsilon.alt$. Association and (5.4) therefore imply

#[#set math.equation(numbering: n => "(5.7)")
 $ bb(E)_(upright("tor")) X_(H_s) X_(H_t) = bb(E)_(upright("tor")) S \( H_s \, H_t \) gt.eq
   epsilon.alt \( c_0 c_2 \)^2 bb(P)_(upright("tor")) \( D_(s t) \) . $ <vis:bridge>]

This is the promised conversion of an arbitrary connecting path into a uniformly visible normalized correlation.
  Figure 1 shows the barrier construction and the merging of the two weighted clusters.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-1.74, -1.74), (1.74, 1.74), fill: rgb("#ededff"), stroke: none)
  rect((-1.16, -1.16), (1.16, 1.16), fill: rgb("#ffffff"), stroke: none)
  rect((-1.74, -1.74), (1.74, 1.74), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round"))
  rect((-1.16, -1.16), (1.16, 1.16), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round", dash: "dashed"))
  line((-1.74, 1.16), (1.74, 1.16), (-1.74, -1.16), (1.74, -1.16), (-1.16, -1.74), (-1.16, 1.74), (1.16, -1.74), (1.16, 1.74), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, cap: "round", join: "round"))
  rect((-0.29, -0.29), (0.29, 0.29), fill: rgb("#ffe6cc"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, cap: "round", join: "round"))
  content((0, 0), [#text(size: 9pt)[$s$]])
  content((0, -0.348), [#text(size: 9pt)[$Q_1(s)$]], anchor: "north", padding: 0.1176cm)
  line((-1.74, 1.508), (-1.392, 1.508), (-1.392, 1.334), (-0.493, 1.334), (-0.493, 1.566), (0.754, 1.566), (0.754, 1.392), (1.74, 1.392), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((1.479, 1.74), (1.479, 0.725), (1.334, 0.725), (1.334, -0.493), (1.537, -0.493), (1.537, -1.74), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((1.74, -1.363), (0.667, -1.363), (0.667, -1.537), (-0.58, -1.537), (-0.58, -1.392), (-1.74, -1.392), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((-1.508, -1.74), (-1.508, -0.754), (-1.363, -0.754), (-1.363, 0.435), (-1.537, 0.435), (-1.537, 1.74), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((-1.74, 2.03), (1.74, 2.03), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"), mark: (start: "<", end: ">"))
  content((0, 2.03), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$12$]]])])
  line((2.03, 1.16), (2.03, 1.74), stroke: (paint: rgb("#999999"), thickness: 0.4pt, cap: "round", join: "round"), mark: (start: "<", end: ">"))
  content((2.059, 1.45), [#text(size: 9pt)[$2$]], anchor: "west", padding: 0.1176cm)
  content((0, -2.726), [#text(size: 9pt)[\(a\) Four long-way crossings#linebreak()form a connected barrier.]])
  line((6.1, -1.45), (6.1, 1.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, cap: "round", join: "round", dash: "dashed"))
  line((10.1, -1.45), (10.1, 1.55), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, cap: "round", join: "round", dash: "dashed"))
  content((6.1, 1.55), [#text(size: 9pt)[row $0$]], anchor: "south", padding: 0.1176cm)
  content((10.1, 1.55), [#text(size: 9pt)[row $d$]], anchor: "south", padding: 0.1176cm)
  rect((5.92, -0.18), (6.28, 0.18), fill: rgb("#ffe6cc"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, cap: "round", join: "round"))
  rect((7.45, -0.18), (7.81, 0.18), fill: rgb("#ffe6cc"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, cap: "round", join: "round"))
  line((5.3, -0.85), (6.65, -0.85), (6.95, -0.55), (6.95, 0.7), (6.65, 0.9), (5.2, 0.9), (5.2, -0.45), close: true, stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((6.1, 0.1), (6.45, 0.4), (6.8, 0.4), (7.15, 0.35), (7.63, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"))
  rect((9.92, -0.18), (10.28, 0.18), fill: rgb("#ffe6cc"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, cap: "round", join: "round"))
  rect((11.45, -0.18), (11.81, 0.18), fill: rgb("#ffe6cc"), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, cap: "round", join: "round"))
  line((9.3, -0.85), (10.65, -0.85), (10.95, -0.55), (10.95, 0.7), (10.65, 0.9), (9.2, 0.9), (9.2, -0.45), close: true, stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, cap: "round", join: "round"))
  line((10.1, 0.1), (10.45, 0.4), (10.8, 0.4), (11.15, 0.35), (11.63, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"))
  line((6.1, -0.06), (6.46, -0.3), (7.26, -0.3), (7.65, -0.52), (8.28, -0.52), (8.58, -0.19), (9.42, -0.19), (10.1, 0.06), stroke: (paint: rgb("#b20000"), thickness: 1.2pt, cap: "round", join: "round"))
  content((6.1, -0.2858), [#text(size: 9pt)[$s$]], anchor: "north", padding: 0.1176cm)
  content((10.1, -0.2858), [#text(size: 9pt)[$t$]], anchor: "north", padding: 0.1176cm)
  content((7.63, 0.2506), [#text(size: 9pt)[$h'_s$]], anchor: "south", padding: 0.1176cm)
  content((11.63, 0.2506), [#text(size: 9pt)[$h'_t$]], anchor: "south", padding: 0.1176cm)
  content((8.3, -0.6), [#text(fill: rgb("#b20000"))[#text(size: 9pt)[$D_(s t)$]]], anchor: "north", padding: 0.1176cm)
  content((6.1, -1.04), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$x_( cal(C) )(H_s)$#linebreak()$gt.eq sqrt( epsilon )$]]], anchor: "north", padding: 0.1176cm)
  content((10.1, -1.04), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$x_( cal(C) )(H_t)$#linebreak()$gt.eq sqrt( epsilon )$]]], anchor: "north", padding: 0.1176cm)
  content((8.4, -2.72), [#text(size: 9pt)[\(b\) The bridge meets both barriers,#linebreak()putting both weights in one cluster.]])
})],
  caption: [Figure 1: The geometric step in (5.7). In (a), neighboring strip crossings meet in the corner squares. In (b), on $A_s ∩ A_t$, each barrier carries normalized weight from the tests inside and outside it; any path in $D_(s t)$ joins the two barrier clusters. Orange squares show test supports. Panel (b) is schematic: time runs horizontally and the distance between the rings is compressed. ],
) <fig:circuits>

=== 5.4 Taking the limits in the required order <taking-the-limits-in-the-required-order>

#proof[
  The union of the events $D_(s t)$ contains ${ 0 arrow.l.r d }$.
    Summing (5.7) over the $O \( w^2 \)$ pairs and applying (5.2) gives
  $ c thin e^(- \( d + a \) e_N \( w \)) lt.eq sum_(s \, t) bb(E)_(upright("tor")) X_(H_s) X_(H_t) . $
  Choose lifts with spatial center separation at most $w \/ 2$.
    The joint test supports then have spatial extent at most $w \/ 2 + O \( 1 \)$ and time extent at most $d +
    O \( 1 \)$, both less than $3 w \/ 4$ for large $w$. The uniform moment comparison therefore replaces each
    torus correlation by its cutoff plane value with error $C e^(- c w)$.
    For this #emph[fixed] $w$, there are only finitely many pairs of centers,
    so plane moment convergence applies to all of them as $N arrow.r oo$.
    Their limiting correlations are bounded by $C e^(- m_(*) d)$:
    every pair of test supports has time separation at least $d - O \( 1 \)$,
    and the kernel estimate (2.6) applies to the fixed test shapes. Consequently
  #[#set math.equation(numbering: n => "(5.8)")
   $ limsup_(N arrow.r oo) e^(- \( d + a \) e_N \( w \)) lt.eq C w^2 #scale(x: 120%, y: 120%)[\(] e^(- m_(*) d) +
     e^(- c w) #scale(x: 120%, y: 120%)[\)] . $ <vis:final-bound>]
  Write $L_w = liminf_(N arrow.r oo) e_N \( w \)$. If $L_w < oo$, take a subsequence on which $e_N \( w \) arrow.r
    L_w$. Along it $a e_N \( w \) arrow.r 0$, so (5.8) yields
  $ L_w gt.eq - 1 /
    d log #h(-0.16667em) [C w^2 #scale(x: 120%, y: 120%)[\(] e^(- m_(*) d) + e^(- c w) #scale(x: 120%, y: 120%)[\)]] . $
  If $L_w = oo$, the desired lower bound already holds. Since $d = floor.l sqrt(w) floor.r$,
    the displayed lower bound tends to $m_(*)$ as $w = w_k arrow.r oo$, proving (5.1). ◻
]

In particular, given $v < m_(*)$, every sufficiently large fixed $w_k$ satisfies $e_N \( w_k \) >
  v$ for all sufficiently large $N$, with the cutoff threshold allowed to depend on $w_k$.
  This order of quantifiers is exactly what the finite doubling argument in Section 6 will use.

== 6 A linear bound on the low-energy state count <sec:counting>

Let $cal(N)_(N \, w) \( u \)$ count the transfer energies at circumference $w$ that are at most $u$,
  with multiplicity and including the vacuum. The visibility estimate from Section 5 now allows us to turn the
  trace bounds into a count below the two-excitation threshold.

#thm([Proposition 6.1.])[
  #emph[There is a constant $C$ such that, for every sufficiently large dyadic circumference $w = w_k$,
#[#set math.equation(numbering: n => "(6.1)")
 $ limsup_(N arrow.r oo) cal(N)_(N \, w) \( u_0 \) lt.eq C w \, wide u_0 = 3 / 2 m_(*) . $ <cou:linear-eq>]

]
] <cou:linear>

Set $u_1 = 13 m_(*) \/ 8$. The intermediate goal is the estimate

$ cal(N)_(N \, 2 w) \( y \) lt.eq 2 \( 1 + epsilon_w \) cal(N)_(N \, w) \( y + b_w \) \, wide u_0 lt.eq y lt.eq u_1 \, $

with positive errors $b_w \, epsilon_w$ summable over dyadic widths.
  For each sufficiently large fixed $w$, this estimate will hold for all sufficiently large $N$,
  with the cutoff threshold allowed to depend on $w$. Summability of the energy shifts keeps the iterated
  threshold inside the stated interval once the base width is large enough; the factors $1 +
  epsilon_w$ have a finite product. Thus the factor $2$ at each doubling yields the desired linear growth in
  circumference.

To prove the estimate, we compare the heat trace at circumference $2
  w$ with the trace of two independent copies at circumference $w$.
  The energies in the latter system are sums $E + E'$. If such a sum lies below twice the gap,
  at least one component is the vacuum energy. A nonnegative polynomial approximation to an energy cutoff makes
  this observation quantitative without assuming convergence of individual eigenvalues.

=== 6.1 Exchanging time and circumference <exchanging-time-and-circumference>

Rotation of the partition function gives the exact identity

#[#set math.equation(numbering: n => "(6.2)")
 $ e^(t g_N \( w \)) R_(N \, w) \( t \) = e^(w g_N \( t \)) R_(N \, t) \( w \) \, $ <cou:exchange>]

where $g_N$ is the pressure correction from Section 3. For a large circumference $w$, set

$ D = floor.l w^(1 \/ 2) floor.r \, wide t_0 = floor.l D^(1 \/ 2) floor.r . $

Every integer physical time is an allowed lattice length.
  Uniformly in the cutoff and in the integers $t_0 lt.eq t lt.eq D$, we claim that

#[#set math.equation(numbering: n => "(6.3)")
 $ \| R_(N \, 2 w) \( t \) - R_(N \, w) \( t \)^2 #scale(x: 120%, y: 120%)[\|] lt.eq C e^(- c w) . $ <cou:heat-product>]

Indeed, applying (6.2) at $w$ and $2 w$ yields

$ log R_(N \, 2 w) \( t \) - 2 log R_(N \, w) \( t \) =  & t #scale(x: 120%, y: 120%)[\(] 2 g_N \( w \) -
  g_N \( 2 w \) #scale(x: 120%, y: 120%)[\)]\
 & + log R_(N \, t) \( 2 w \) - 2 log R_(N \, t) \( w \) . $

The first term is exponentially small in $w$ by (3.5). The uniform positive gap at all sufficiently large
  circumferences, Corollary 6, gives a constant $c_(*) > 0$ such that

$ s_(N \, t) \( 2 w \) lt.eq s_(N \, t) \( w \) lt.eq e^(- c_(*) \( w - t \)) s_(N \, t) \( t \) lt.eq C e^(- c' w) . $

Here $s_(N \, t) \( t \)$ is uniformly bounded by (3.5). Thus the difference of logarithms is exponentially small.
  The same trace estimate bounds both $R_(N \, 2 w) \( t \)$ and $R_(N \, w) \( t \)^2$ uniformly on this time
  range: their logarithms are at most a polynomial in $w$ times $e^(- c t_0)$. Exponentiating proves (6.3).

=== 6.2 A positive approximation to an energy cutoff <a-positive-approximation-to-an-energy-cutoff>

For $u_0 lt.eq y lt.eq u_1$, define

$ b_w = D^(- 1 \/ 8) \, wide j_0 = ⌈D e^(- \( y + b_w \/ 2 \))⌉ \, wide Q_(w \, y) \( x \) =
  sum_(j = j_0)^D binom(D, j) x^j \( 1 - x \)^(D - j) . $

The polynomial is the upper tail of a binomial law, so $0 lt.eq Q_(w \, y) \( x \) lt.eq 1$ on $\[ 0 \, 1 \]$.
  Its transition occurs between energies $y$ and $y + b_w$ when $x = e^(- E)$.

#thm([Lemma 6.2.])[
  #emph[For all sufficiently large $w$, uniformly in $y in \[ u_0 \, u_1 \]$,
#[#set math.equation(numbering: n => "(6.4)")
 $ Q_(w \, y) \( e^(- E) \) & gt.eq 1 - C e^(- c D^(3 \/ 4)) &  & \( 0 lt.eq E lt.eq y \) \,\
Q_(w \, y) \( e^(- E) \) & lt.eq C e^(- c D^(3 \/ 4)) e^(- t_0 E) &  & \( E gt.eq y + b_w \) . $ <cou:poly-low>]

 Every nonzero monomial of $Q_(w \, y)$ has degree between $t_0$ and $D$,
   and the sum of the absolute values of its coefficients is at most $3^D$.]
] <cou:polynomial>

#proof[
  The threshold $j_0 \/ D$ differs from $e^(- y)$ and $e^(- \( y + b_w \))$ by at least $c
    b_w$ on their respective sides. This follows from the mean value theorem,
    uniformly on the fixed energy interval, since the rounding error is at most $1 \/ D = o \( b_w \)$.
    Hoeffding’s binomial tail bound #cite(label("Hoeffding1963")) Theorem 1 therefore gives (6.4) and (6.4)
    without the factor $e^(- t_0 E)$, because $D b_w^2 = D^(3 \/ 4)$.
  To retain a summable bound over all energies, that additional factor is essential.
    Choose $c_1 > 0$ such that $j_0 gt.eq c_1 D$ for every allowed $y$ and all large $w$.
    Fix $E_(*) > 4 log \( 2 \) \/ c_1 + 1$. For $E lt.eq E_(*)$,
    the loss $e^(t_0 E_(*))$ is absorbed by decreasing the constant in the exponent $- c D^(3 \/ 4)$, since $t_0 =
    O \( D^(1 \/ 2) \)$. For $E gt.eq E_(*)$, the binomial formula gives
  $ Q_(w \, y) \( e^(- E) \) lt.eq 2^D e^(- j_0 E) . $
  For large $w$, $t_0 lt.eq c_1 D \/ 2$, and consequently
  $ 2^D e^(- \( j_0 - t_0 \) E) lt.eq exp #h(-0.16667em) (- c_1 / 4 D E) lt.eq C e^(- c D^(3 \/ 4)) . $
  This proves (6.4) for every $E gt.eq y + b_w$.
  The smallest possible degree in the expanded polynomial is $j_0$, which is at least $t_0$ for large $w$.
    Finally its coefficient sum in absolute value is bounded by
  $ sum_(j = j_0)^D binom(D, j) 2^(D - j) lt.eq 3^D . $
  ◻
]

Applying (6.3) to each monomial gives

#[#set math.equation(numbering: n => "(6.5)")
 $
   lr(|sum_(E upright(" at ") 2 w) Q_(w \, y) \( e^(- E) \) - sum_(E \, E' upright(" at ") w) Q_(w \, y) \(
   e^(- \( E + E' \)) \)|) lt.eq C e^(- c' w) . $ <cou:poly-trace>]

All sums count multiplicities. They converge absolutely, since the smallest degree is positive and the relevant
  heat traces are finite. The coefficient bound costs at most $3^D$, which is absorbed by $e^(- c w)$ because $D =
  O \( w^(1 \/ 2) \)$.

===== 6.2.1 From polynomial traces to counts. <from-polynomial-traces-to-counts.>

By the visibility estimate (5.1), for each sufficiently large fixed dyadic $w$ and all sufficiently large $N$
  depending on $w$,

$ 2 e_N \( w \) gt.eq 7 / 4 m_(*) . $

Increase the lower bound on $w$ so that $u_1 + b_w < 7 m_(*) \/ 4$.
  Any pair in (6.5) with $E + E' < y + b_w$ then has a zero component.
  There are at most $2 cal(N)_(N \, w) \( y + b_w \)$ such pairs.
  For the remaining pairs, Lemma 17 bounds their total contribution by

$ C e^(- c D^(3 \/ 4)) sum_(E \, E') e^(- t_0 \( E + E' \)) = C e^(- c D^(3 \/ 4)) R_(N \, w) \( t_0 \)^2 lt.eq
  C e^(- c D^(3 \/ 4)) . $

Using (6.4) for energies at $2 w$ not exceeding $y$, and absorbing the additive errors into $cal(N)_(N \, w) gt.eq
  1$, proves

#[#set math.equation(numbering: n => "(6.6)")
 $ cal(N)_(N \, 2 w) \( y \) lt.eq 2 #scale(x: 120%, y: 120%)[\(] 1 +
   C e^(- c D^(3 \/ 4)) #scale(x: 120%, y: 120%)[\)] cal(N)_(N \, w) \( y + b_w \) \, wide u_0 lt.eq y lt.eq
   u_1 . $ <cou:recursion>]

The constants are independent of $N \, w \, y$; for each fixed $w$, the inequality holds for all sufficiently large $N$.

=== 6.3 Dyadic iteration <dyadic-iteration>

#proof[
  Choose a fixed dyadic base width $w_(k_0)$ large enough for the preceding estimates and so that
  $ sum_(k = k_0)^oo b_(w_k) < u_1 - u_0 . $
  This is possible because $b_(w_k) = O \( w_k^(- 1 \/ 16) \)$.
    The product of the factors $1 + C e^(- c floor.l sqrt(w_k) floor.r^(3 \/ 4))$ over the same range is finite.
    At the base width,
  $ cal(N)_(N \, w_(k_0)) \( u_1 \) lt.eq e^(w_(k_0) u_1) R_(N \, w_(k_0)) \( w_(k_0) \) lt.eq C_0 \, $
  uniformly in the cutoff.
  Fix a target $w_k$ with $k > k_0$. Apply (6.6) backwards along the finite chain $w_k \, w_(k - 1) \, dots.h \,
    w_(k_0)$, starting at threshold $u_0$. The accumulated threshold shifts remain below $u_1 - u_0$,
    so every application is valid. For all sufficiently large $N$ on this finite chain, we obtain
  $ cal(N)_(N \, w_k) \( u_0 \) lt.eq C_0 thin 2^(k - k_0) product_(h = k_0)^(k - 1)
    (1 + C e^(- c floor.l sqrt(w_h) floor.r^(3 \/ 4))) lt.eq C w_k . $
  Taking $limsup_(N arrow.r oo)$ proves the assertion. The cutoff threshold may depend on the target width;
    no simultaneous limit in $N$ and $w$ has been used. ◻
]

== 7 From the state count to an isolated mass <sec:mass-support>

Each mass in the support of $rho$ contributes to the continuum two-point function throughout an interval of
  spatial momenta. We will test these contributions by positive measures from the finite-circumference transfer
  operator. Distinct masses will then require distinct low-energy states at every allowed momentum in that
  interval. Proposition 16 bounds how many such masses there can be.

=== 7.1 Measures at fixed momentum <measures-at-fixed-momentum>

Fix nonzero nonnegative smooth functions $g \, h$ of compact support,
  with $"supp" g subset \( 0 \, l \)$ for a fixed positive integer $l$, and set $f \( t \, b \) =
  g \( t \) h \( b \)$. We use color $3$ throughout. On a cylinder of circumference $w = w_k$,
  let $X_f$ be the source-normalized lattice field sum and define its bounded truncation by

$ F = max { - w \, min { X_f \, w } } . $

Use the slab $\[ 0 \, l \]$ for the normalized insertion $A_F$, with the initial row as its left kernel variable,
  and put

$ v = A_F Omega_(N \, w) . $

With this convention, the matrix element $chevron.l v \, T_(N \, w)^(n \/ a) v
  chevron.r$ places the first copy of $F$ on $\[ - l \, 0 \]$ by time reflection and the second copy on
  $\[ n \, n + l \]$ by time translation. To see the corresponding time weights,
  let $Q_(h \, N)$ denote row multiplication by $B_N a sum_(b in a bb(Z) \/ w bb(Z)) h \( b \) q_b^3$,
  using the periodization of $h$. Before truncation the linear insertion satisfies the exact formula

$ A_(X_f) = a sum_(t in a bb(Z) ∩ \[ 0 \, l \]) g \( t \) T^(t \/ a) Q_(h \, N) T^(\( l - t \) \/ a) \, wide
  A_(X_f) Omega = a sum_t g \( t \) T^(t \/ a) Q_(h \, N) Omega . $

Work in the complex transfer Hilbert space. Spatial row translations $U_b$, for $b in a bb(Z) \/ w bb(Z)$,
  commute with $T_(N \, w)$. Choose their character convention so that the momentum projection is

$ Pi_p = a / w sum_(b in a bb(Z) \/ w bb(Z)) e^(- i p b) U_b \, wide
  p in frac(2 pi, w) bb(Z) ∩ \[ - pi \/ a \, pi \/ a \) . $

For each such $p$, define the finite positive measure

#[#set math.equation(numbering: n => "(7.1)")
 $ nu_(N \, w \, p) = w sum_E parallel P_E Pi_p v #scale(x: 120%, y: 120%)[parallel]^2 delta_(e^(- E)) quad
   upright("on ") \[ 0 \, 1 \] \, $ <mass:finite-measure>]

where $P_E$ is the transfer-energy projection. The factor $w$ converts the normalized character sum into a spatial
  Riemann sum.

Let $C_f \( n \, b \)$ be the continuum correlation of $phi.alt^3 \( f \)$ reflected in time with a second copy
  translated by $n$ in time and by $b$ in space. For a compact momentum interval $I$,
  we will write $max_(p in I)$ for the maximum over allowed lattice momenta lying in $I$.

#thm([Lemma 7.1.])[
  #emph[For every integer $n gt.eq 0$ and every compact interval $I$ with nonempty interior,
#[#set math.equation(numbering: n => "(7.2)")
 $ lim_(w arrow.r oo\
w =
  w_k) limsup_(N arrow.r oo) max_(p in I)
  lr(|integral x^n thin nu_(N \, w \, p) \( d x \) - integral_(bb(R)) e^(- i p b) C_f \( n \, b \) thin d b|) =
  0 . $ <mass:moments-eq>]

]
] <mass:moments>

#proof[
  The spectral theorem and the character formula give
  $ integral x^n thin nu_(N \, w \, p) \( d x \) & = w chevron.l v \, T_(N \, w)^(n \/ a) Pi_p v chevron.r\
 & = a sum_(b in a bb(Z)\
- w \/ 2 lt.eq b < w \/ 2) e^(- i p b) chevron.l v \, T_(N \, w)^(n \/ a) U_b v chevron.r . $
  The matrix element in the sum is the cylinder correlation of the two bounded slab observables just described.
    For fixed $f \, n$ and large $w$, their joint support has time extent at most $n +
    2 l$ and spatial extent at most $w \/ 2 + "diam" \( "supp" h \)$. Both are below $3 w \/ 4$.
    The cylinder-to-torus comparison, followed by Proposition 8,
    replaces this correlation by its cutoff plane counterpart with error at most $C w^2 e^(- c w)$,
    uniformly in $b$ and $N$. The uniform field tails then remove the two truncations on the plane with error $C
    e^(- c' w)$, by Cauchy–Schwarz and the moment majorants. The factor $a$ times the number of spatial translates
    is $w$, so the total error in the displayed Riemann sum still tends to zero exponentially in $w$.
  For a fixed $w$, the cutoff plane smeared correlations converge uniformly for $\| b \| lt.eq
    w \/ 2$ to $C_f \( n \, b \)$. To see the uniformity, moment convergence gives pointwise convergence,
    while the difference-test bound (2.8) gives uniform equicontinuity.
    More explicitly, on a fixed compact translation interval the smooth translates satisfy $\| f_b -
    f_(b') \| lt.eq C \| b - b' \|$ on a fixed finite union of unit boxes.
    The second-moment majorant bounds the $L^2$ norm of the corresponding field difference by $C' \| b - b' \|$.
    Cauchy–Schwarz then gives the same modulus of continuity for the correlations.
    Compactness upgrades pointwise convergence to uniform convergence.
    Consequently, as $N arrow.r oo$, the Riemann sum of the cutoff plane correlations converges to the continuum
    integral over $\[ - w \/ 2 \, w \/ 2 \]$, uniformly for $p$ in $I$;
    the exponential factors have a uniform modulus of continuity on this compact set.
  Finally, the separated-time kernel bound in Section 2 implies $\| C_f \( n \, b \) \| lt.eq
    C e^(- c \| b \|)$ outside a fixed compact interval. The omitted spatial tail therefore tends to zero
    uniformly in $p$ as $w arrow.r oo$. This proves (7.2). The case $n = 0$ is included:
    $"supp" g$ has positive distance from zero, so the two reflected field supports remain separated in time. ◻
]

The Euclidean spectral representation (2.5) identifies the limiting measures explicitly. Write

$ hat(h) \( p \) = integral_(bb(R)) e^(- i p b) h \( b \) thin d b \, wide G \( E \) =
  integral_0^l g \( t \) e^(- t E) thin d t \, wide E \( p \, mu \) = sqrt(p^2 + mu^2) . $

For each $p in bb(R)$, let $nu_p$ be the image, under $mu mapsto e^(- E \( p \, mu \))$, of the positive measure

#[#set math.equation(numbering: n => "(7.3)")
 $ frac(\| hat(h) \( p \) \|^2, 2 E \( p \, mu \)) \| G \( E \( p \, mu \) \) \|^2 thin rho \( d mu^2 \) .
   $ <mass:measure>]

Integrating the kernel against the two slab tests and then Fourier transforming in their relative spatial
  displacement gives

$ integral_(bb(R)) e^(- i p b) C_f \( n \, b \) thin d b = integral x^n thin nu_p \( d x \) . $

The time separation supplies exponential damping in $mu$,
  so the integrals converge and depend continuously on $p$ on compact intervals.
  This also justifies the Fourier calculation, either directly or first as an identity of distributions and then
  of continuous functions.

We will need continuous spectral tests rather than moments.
  For every $Psi in C \( I times \[ 0 \, 1 \] \)$, Lemma 18 implies

#[#set math.equation(numbering: n => "(7.4)")
 $ lim_(w arrow.r oo\
w =
  w_k) limsup_(N arrow.r oo) max_(p in I)
  lr(|integral Psi \( p \, x \) thin nu_(N \, w \, p) \( d x \) - integral Psi \( p \, x \) thin nu_p \( d
  x \)|) = 0 . $ <mass:continuous-tests>]

Indeed, the $n = 0$ case uniformly bounds the total masses in this iterated limit.
  Approximate $Psi$ uniformly by polynomials in $x$ with continuous coefficients in $p$,
  for instance its Bernstein polynomials in $x$. Each coefficient is bounded on $I$,
  so Lemma 18 applies to the finite sum; the uniform approximation controls the remainder against both measures.
  Thus no mass near $x = 0$ is lost in passing from moments to continuous tests.

=== 7.2 Finiteness of the low mass support <finiteness-of-the-low-mass-support>

#thm([Proposition 7.2.])[
  #emph[The set
$ { mu in \[ m_(*) \, 5 m_(*) \/ 4 \] : mu^2 in "supp" rho } $

 is finite.]
] <mass:finite-support>

#proof[
  Choose $p_0 > 0$ so small that
  $ sqrt(p_0^2 + \( 5 m_(*) \/ 4 \)^2) < u_0 \, wide hat(h) \( p \) eq.not 0 quad \( \| p \| lt.eq p_0 \) . $
  This is possible because $5 m_(*) \/ 4 < u_0 = 3 m_(*) \/ 2$ and $hat(h) \( 0 \) = integral h > 0$.
    This momentum interval is fixed before any finite collection of masses is selected.
  Choose $J$ distinct masses $mu_1 \, dots.h \, mu_J$ from the indicated support.
    On $I = \[ - p_0 \, p_0 \]$, the curves
  $ x_j \( p \) = e^(- E \( p \, mu_j \)) \, wide j = 1 \, dots.h \, J \, $
  are pairwise disjoint compact graphs in $I times \( e^(- u_0) \, 1 \)$.
    Their mutual distances and their distances from the two horizontal boundary lines are positive.
    There are therefore nonnegative continuous functions $Psi_j$ on $I times \[ 0 \, 1 \]$,
    supported in mutually disjoint neighborhoods of these graphs contained in $I times \( e^(- u_0) \, 1 \)$,
    and equal to one on the respective graphs.
  For every $p in I$,
  $ L_j \( p \) := integral Psi_j \( p \, x \) thin nu_p \( d x \) > 0 . $
  Indeed, membership of $mu_j^2$ in $"supp" rho$ gives positive measure to every neighborhood of that point.
    The integrand in (7.3) is positive there: $hat(h) \( p \) eq.not 0$ and $G \( E \) > 0$ for every $E > 0$,
    since $g gt.eq 0$ is nonzero. Continuity of $Psi_j$ makes its value positive through a neighborhood of $mu_j$
    at the fixed momentum. Moreover $L_j$ is continuous in $p$, by exponential domination in (7.3). Compactness yields
  $ eta := min_(1 lt.eq j lt.eq J) min_(p in I) L_j \( p \) > 0 . $
  Both $eta$ and the required approximation scale may depend on this finite collection of masses.
  By (7.4), for all sufficiently large fixed dyadic $w$, and then all sufficiently large $N$ depending on $w$,
  $ integral Psi_j \( p \, x \) thin nu_(N \, w \, p) \( d x \) > eta \/ 2 wide \( j = 1 \, dots.h \, J \) $
  at every allowed $p in I$. Each atom of the measure (7.1) comes from a transfer-energy eigenspace with momentum
    $p$. The disjoint supports of the $Psi_j$ therefore require at least $J$ distinct energies below $u_0$ in that
    space. Distinct momentum spaces are orthogonal. For large $w$,
    the number of momenta in $I$ is at least $c_0 w$, where $c_0 > 0$ depends only on $p_0$;
    at any fixed $w$ these are distinct Brillouin characters once $N$ is large. Thus
  $ J c_0 w lt.eq cal(N)_(N \, w) \( u_0 \) . $
  Taking the cutoff limit and using Proposition 16 gives $J c_0 lt.eq C$.
    The constants $c_0 \, C$ are independent of the selected masses and of $J$.
    The support can consequently contain only finitely many points in the stated interval. ◻
]

#proof[
  The nonempty closed mass support has minimum $m_(*) > 0$, by the continuum inputs in Section 2.
    Proposition 19 makes this minimum isolated in the support.
    A positive locally finite measure assigns strictly positive finite mass to an isolated support point, so
  $ Z = rho \( { m_(*)^2 } \) in \( 0 \, oo \) . $
  Choose $delta > 0$ small enough that no other mass in the support lies below $m_(*) + delta$, and define
  $ m_1 = m_(*) \, wide rho_(upright("rest")) = rho - Z delta_(m_(*)^2) . $
  This is a positive measure, and its support is contained in $\[ \( m_1 + delta \)^2 \, oo \)$, as required. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
