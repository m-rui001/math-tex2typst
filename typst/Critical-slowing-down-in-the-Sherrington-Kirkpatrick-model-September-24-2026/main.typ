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

#align(center)[#text(size: 16pt, weight: "bold")[Critical slowing down in the \
Sherrington--Kirkpatrick model]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

At the critical temperature of the Sherrington–Kirkpatrick model,
  equilibrium fluctuations contain a direction that local spin updates can change only slowly.
  We use this fluctuation to prove a total-variation obstruction for most equilibrium configurations viewed as
  fixed initial states. The same static estimates determine the covariance scale and the relaxation detected by
  linear observables.

=== 1.1 The model and main results <the-model-and-main-results>

The model introduced by Sherrington and Kirkpatrick #cite(label("sk1975")) places spins on $Omega_n = { - 1 \,
  1 }^n$ and couples every pair through an independent Gaussian variable.
  At inverse temperature $beta = 1$ and zero field, $W_(i j) tilde.op N \( 0 \, 1 \/ n \)$ for $i < j$, and

#[#set math.equation(numbering: n => "(1.1)")
 $ mu_W \( x \) prop exp #h(-0.16667em) (sum_(i < j) W_(i j) x_i x_j) \, wide x in { - 1 \, 1 }^n . $ <eq:intro-law>]

Here $beta = 1$ marks the large-$n$ equilibrium spin-glass transition #cite(label("duHuang2026FreeEnergy"))
  Section 1, after Equation (1.4). The overlap $n^(- 1) x^T
  y$ of two independent equilibrium replicas has scale $n^(- 1 \/ 3)$ at criticality,
  compared with its Gaussian $n^(- 1 \/ 2)$ scale at each fixed $beta <
  1$ #cite(label("duHuang2026Overlap")) Equation (1.1) and Theorem 1.1.
  A heat-bath update resamples one spin from its conditional law under $mu_W$. We use two clocks:
  in continuous time each site has an independent rate-one clock;
  in discrete time each step attempts one update at a uniformly chosen site. An attempt may leave the spin unchanged.

For fixed disorder and initial configuration $x$, let $d_t^(upright("ct")) \( W \, x \)$ and
  $d_k^(upright("dt")) \( W \, x \)$ denote the total-variation distances of the corresponding transition laws
  from $mu_W$. Section 2 gives the operators and conventions in detail.
  Our first result concerns an equilibrium configuration after its realized value has been fixed as the initial
  state. All probability limits in the main results are over the original off-diagonal Gaussian disorder.

#thm([Theorem 1.1.])[
  (Realized equilibrium initial states).  #emph[For every deterministic sequence $t_n gt.eq 0$ with $t_n =
    o \( n^(2 \/ 3) \)$,
$ mu_W { x : d_(t_n)^(upright("ct")) \( W \, x \) > 1 \/ 4 } arrow.r^(bb(P)) 1 . $

 For every deterministic integer sequence $k_n gt.eq 0$ with $k_n = o \( n^(5 \/ 3) \)$,
$ mu_W { x : d_(k_n)^(upright("dt")) \( W \, x \) > 1 \/ 4 } arrow.r^(bb(P)) 1 . $

 The convergence is in probability over the disorder.]
] <thm:gibbs-start>

The theorem tests each realized start separately: averaging its transition law over the equilibrium initial
  configuration would give the stationary law $mu_W$. It also treats each prescribed deterministic time sequence
  separately; the set of slowly mixing starts may depend on that sequence.

To state the static conclusion, set $Sigma = "Cov"_(mu_W) \( x \)$ and define the unscaled conditional-variance form

$ cal(D)_(mu_W) \( f \) = sum_(i = 1)^n mu_W \[ "Var" \( f divides x_(- i) \) \] . $

Here $x_(- i)$ comprises every spin except $i$. This is the Dirichlet form for the rate-one-per-site clock.
  The largest inverse Rayleigh quotient among linear functions is

$ cal(R)_(upright("lin")) \( mu_W \) = sup_(a in bb(R)^n \\ { 0 })
  frac("Var"_(mu_W) \( a^T x \), cal(D)_(mu_W) \( a^T x \)) . $

#thm([Theorem 1.2.])[
  (Covariance and linear tests).  #emph[For every positive deterministic sequence $M_n arrow.r oo$,
    with probability tending to one both $parallel Sigma parallel$ and $cal(R)_(upright("lin")) \( mu_W \)$ belong to
$ [n^(2 \/ 3) / M_n \, med M_n n^(2 \/ 3)] . $

]
] <thm:linear-scale>

The factor $M_n$ may diverge more slowly than any prescribed power or logarithm.
  Because the quotient here ranges only over linear functions,
  its upper bound does not control the full inverse spectral gap.

For comparison with customary worst-start mixing, let $t_(upright("mix"))$ and $k_(upright("mix"))$ be the first
  continuous time and the first integer step, respectively,
  at which every initial configuration has distance at most $1 \/ 4$. Theorem 1 gives the lower bounds below.
  An independent comparison with one fixed high-temperature model gives the subexponential upper bounds.

#thm([Theorem 1.3.])[
  (Critical mixing bounds).  #emph[For every fixed $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(1.2)")
 $ bb(P) #h(-0.16667em) {n^(2 \/ 3 - epsilon.alt) lt.eq t_(upright("mix")) lt.eq e^(epsilon.alt n)} & arrow.r 1 \,\
bb(P) #h(-0.16667em) {n^(5 \/ 3 - epsilon.alt) lt.eq k_(upright("mix")) lt.eq e^(epsilon.alt n)} & arrow.r
  1 . $ <eq:continuous-main>]

]
] <thm:mixing>

=== 1.2 Historical and mathematical context <historical-and-mathematical-context>

Critical spin-glass relaxation has been studied through several models and convergence criteria.
  Kirkpatrick and Sherrington #cite(label("kirkpatrickSherrington1978")) investigated Glauber autocorrelations
  above the critical temperature using a linearized mean-field treatment.
  Sompolinsky and Zippelius developed equations for disorder-averaged correlation and response
  #cite(label("sompolinskyZippelius1981")), and treated soft-spin Langevin dynamics in
  #cite(label("sompolinskyZippelius1982")). For Ising dynamics,
  Billoire and Campbell #cite(label("billoireCampbell2011")) numerically examined equilibrium autocorrelations on
  an $n^(2 \/ 3)$ scale, with time in updates per spin. These studies concern correlation and response;
  the present paper instead tests total variation after each realized equilibrium start.

Our static comparison uses a spherical model, a classical counterpart of the Ising spin glass.
  In their thermodynamic analysis, Kosterlitz, Thouless, and Jones #cite(label("kosterlitzThoulessJones1976"))
  located its transition at the spectral edge and identified the top eigenmode as the ordering direction.
  Comets #cite(label("comets1996")) Equations (2.1)–(2.2) gave the fixed-spectrum Haar-averaging identity relating
  the two partition functions. Baik and Lee #cite(label("baikLee2016")) proved Gaussian and Tracy–Widom spherical
  free-energy limits at fixed temperatures on the two sides of criticality,
  and Landon #cite(label("landon2022")) treated the critical Gaussian limit and the saddle’s $n^(- 2 \/ 3)$ edge
  scale. Bhattacharya and Sen #cite(label("bhattacharyaSen2016")) reduced fixed-spectrum Haar second moments
  through the two eigenvalues $1 plus.minus q$, where $q = x^T y \/
  n$ is the overlap of two vectors of norm $sqrt(n)$, comparing free-energy exponential rates under
  high-temperature spectral assumptions.

The critical results of Du and Huang are close predecessors of the static estimates used here.
  For the normalized Ising and spherical partition functions $Z_(upright("Is"))$ and $Z_(upright("sph"))$ built
  from the same GOE matrix, their free-energy work #cite(label("duHuang2026FreeEnergy")) Theorems 1.4 and 1.6 proves

$ bb(E) #h(-0.16667em) [(Z_(upright("Is")) / Z_(upright("sph")) - 1)^2] = O \( n^(- 1 \/ 3) \) $

and an annealed squared-overlap estimate of order $n^(- 2 \/ 3)$.
  Their subsequent work #cite(label("duHuang2026Overlap")) Theorem 1.1 determines the limiting quenched critical
  overlap distribution.

Those results also give an alternative route to the static inputs of this paper.
  Proposition 4.1 in #cite(label("duHuang2026Overlap")) gives convergence of the rescaled spectral coefficients,
  while the proof of Lemma 4.5 identifies the corresponding spherical coordinates.
  Together with the fixed-coordinate convergence in the proof of Lemma 4.7, Equations (4.24)–(4.26),
  and the absolutely continuous limiting marginal in Equation (2.14),
  these facts imply vanishing mass in every deterministic shrinking top-coordinate window.
  The restricted Haar first moment and the partition comparison in #cite(label("duHuang2026FreeEnergy"))
  Theorem 1.6 then transfer this estimate to the cube. The annealed squared-overlap bound also implies,
  by Markov’s inequality, that $n^(2 \/ 3) bb(E)_(mu_W^(⊗ 2)) q \( x \, y \)^2$ is bounded in probability;
  this is the overlap input for the covariance upper bound and the cavity argument.
  The sign and cavity arguments in Section 6 give the additional dynamical and linear-observable deductions.
  Our technical sections provide a separate static proof, uniform on chosen deterministic spectral events,
  using exact Gaussian conditioning, a quantitative cubic deficit, and monotone outward overlap bins.

Two further groups of methods enter the proof. The GOE tridiagonal representation is classical
  #cite(label("dumitriuEdelman2002")); our spectral estimates develop the quadratic-form approach of Ramírez,
  Rider, and Virág #cite(label("ramirezRiderVirag2011")) and Ledoux and Rider #cite(label("ledouxRider2010")).
  For the independent upper comparison we use the fixed-$beta < 1$,
  zero-field heat-bath Poincaré theorem #cite(label("skgapcompanion")) Theorem 1.1.
  Bauerschmidt and Bodineau #cite(label("bauerschmidtBodineau2019")) proved a logarithmic Sobolev inequality with
  the full spin-flip-gradient form, while Eldan, Koehler, and Zeitouni #cite(label("eldanKoehlerZeitouni2022"))
  proved a heat-bath Poincaré inequality for interaction matrices satisfying $0 prec.curly.eq J prec I$.
  After a diagonal shift, their SK applications reach $beta < 1 \/ 4$.
  More recently, Wang #cite(label("wang2026SKMixing")) proved worst-start heat-bath mixing to total-variation
  error $epsilon$ in $O_beta \( n log \( n \/ epsilon \) \)$ attempted updates for fixed $beta < 1 \/ 2$,
  uniformly over external fields on one high-probability disorder event.
  Boban, Li, and Oveis Gharan #cite(label("bobanLiOveisGharan2026SK")) proved a constant unscaled gap and
  zero-field worst-start mixing in $O \( n^2 \)$ attempted updates for $beta < 1 \/ 2 +
  epsilon_0$ with an absolute $epsilon_0 > 0$, with high probability over the disorder.
  The fixed-$beta < 1$ companion input used here covers the temperatures required by the comparison in Section 6,
  which fixes $beta$ before taking $n$ to infinity.

The companion #emph[Critical mixing in the Sherrington–Kirkpatrick model] #cite(label("criticalmixingcompanion"))
  Theorem 1.1 proves matching mixing exponents in probability over the disorder:
  $n^(2 \/ 3 + o \( 1 \))$ in continuous time and $n^(5 \/ 3 + o \( 1 \))$ attempted updates,
  together with exponent $2 \/ 3$ for the full relaxation and inverse classical logarithmic Sobolev constants.
  Each exponent statement allows every fixed positive power slack.
  Its lower and static inputs are the realized-start and covariance/linear results in Theorems 1 and 2 here;
  its upper estimates use separate arguments. The independent comparison in Theorem 3 remains part of the present paper.

=== 1.3 How the proof works <how-the-proof-works>

Following the augmentation used by Comets #cite(label("comets1996")) Equation (1.1),
  add an independent Gaussian diagonal to the coupling matrix.
  Its energy is constant on the cube, so the Gibbs law and both chains stay the same,
  while the augmented matrix is GOE. Let $v$ be a unit top eigenvector of that matrix. The main static input is

$ mu_W { \| v^T x \| lt.eq b_n n^(1 \/ 3) } arrow.r 0 quad
  upright("in probability for every positive deterministic ") b_n arrow.r 0 . $

Thus the equilibrium projection is rarely small on the $n^(1 \/ 3)$ scale.
  In contrast, $cal(D)_(mu_W) \( v^T x \) lt.eq 1$. Reversibility bounds the mean-square change along a stationary
  trajectory by $2 t$ in continuous time and $2 k \/ n$ after $k$ attempted updates.
  At each prescribed deterministic time that is little-oh of the corresponding $n^(2 \/ 3)$ or $n^(5 \/ 3)$ scale,
  the two endpoint projections have the same nonzero sign with high probability.
  For each fixed initial state, that sign defines a half-space whose equilibrium mass is at most one half,
  giving the total-variation test in Theorem 1.

The scale of the projection comes from the spectral edge. Three static stages make this connection precise.
  Section 3 controls the leading eigenvalues and two resolvent traces at distance $s_0 =
  L_n n^(- 2 \/ 3)$ above the GOE edge, on an event depending only on eigenvalues.
  Here $L_n$ may diverge arbitrarily slowly. Section 4 writes the tilted spherical law as follows:
  for the ordered eigenvalues $lambda_i$, set $Lambda = "diag" \( lambda_1 \, dots.h \, lambda_n \)$ and tilt
  uniform measure on ${ u in bb(R)^n : parallel u parallel^2 = n }$ by $exp \( u^T Lambda u \/ 2 \)$.
  This law is represented by independent Gaussian coordinates conditioned on their squared norm.
  The edge estimate gives the leading coordinate a Gaussian variance at least a constant times $s_0^(- 1)$,
  so its standard deviation is at least a constant times $n^(1 \/ 3) \/ sqrt(L_n)$.
  Lower and upper radial-density bounds control the effect of conditioning,
  giving small-projection and squared-overlap estimates on the sphere.

Section 5 transfers these estimates to the cube. Haar averaging identifies the first moment of an Ising partition
  sum with the spherical integral. To control normalized Gibbs probabilities,
  the section also proves concentration of that partition sum.
  Its second moment integrates the same pair integral against two overlap laws:
  a binomial law on the cube and a continuous law on the sphere.
  The spectral resolvent and spherical saddle estimates give a cubic deficit that suppresses large overlaps.
  For small overlaps, disjoint outward bins and monotonicity compare the discrete sum with the spherical integral
  without differentiating the pair integral. The first-moment identity and partition concentration then transfer
  small projections, while the weighted second moment transfers the squared-overlap bound.

These two outputs give opposite sides of the covariance estimate:
  the top projection gives a lower bound, and the squared overlap controls $"Tr"
  Sigma^2$ and hence gives an upper bound. For linear inverse Rayleigh quotients, covariance alone is not enough,
  since the Dirichlet denominator weights each coefficient by a mean one-site conditional variance.
  Section 6 uses spin deletion to show that sites with large reciprocal weights contribute only a smaller
  covariance block. The same section proves the sign test, the independent high-temperature upper comparison,
  and the three main results. Choosing $L_n$ after each prescribed deterministic threshold preserves the
  quantifiers in the realized-start and static results. Figure 1 summarizes the lower and static argument;
  Appendix 7 gives elementary examples clarifying the role of the update rule, clock, and disorder quantifiers.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 7.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000059"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[GOE edge and resolvent control#linebreak()Proposition~3.1]]])])
  content((0, -1.986), [#box(width: 7.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000059"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Spherical estimates from Gaussian conditioning#linebreak()Partition, projection, and overlap bounds#linebreak()Section~4]]])])
  content((0, -4.135), [#box(width: 7.553cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000059"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Haar first and second moments#linebreak()Partition concentration and observable transfer#linebreak()Section~5]]])])
  content((-2.8, -6.01), [#box(width: 5.353cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000059"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Small-projection mass on the cube#linebreak()Theorem~5.3]]])], anchor: "north")
  content((2.8, -6.01), [#box(width: 5.353cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000059"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Squared-overlap control on the cube#linebreak()Proposition~5.4]]])], anchor: "north")
  content((-2.8, -8.291), [#box(width: 5.353cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000059"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Sign test for realized initial states#linebreak()Theorem~1.1]]])])
  content((2.8, -8.52), [#box(width: 5.353cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#000059"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Covariance scale and linear#linebreak()inverse Rayleigh bounds#linebreak()Theorem~1.2]]])])
  line((0, -0.5114), (0, -1.311), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
  line((0, -2.661), (0, -3.461), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
  line((-3.776, 0), (-4.376, 0), (-4.376, -4.135), (-3.776, -4.135), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
  line((0, -4.81), (0, -5.41), (-2.8, -5.41), (-2.8, -6.01), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
  line((0, -4.81), (0, -5.41), (2.8, -5.41), (2.8, -6.01), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
  line((-2.8, -6.997), (-2.8, -7.797), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
  line((2.8, -7.033), (2.8, -7.833), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
  line((-0.1236, -6.504), (0.1236, -8.52), stroke: (paint: rgb("#000080"), thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: rgb("#000080"))))
})],
  caption: [Figure 1: The lower and static argument. The direct arrow from the spectral estimates to Haar comparison records their additional use in the cubic overlap deficit. The restricted first moment transfers the small-projection numerator, while partition concentration controls its normalization; a weighted second moment transfers squared overlap. Small projections give the covariance lower bound and squared overlap gives its upper bound. A separate cavity estimate then controls the linear inverse Rayleigh quotients. The independent subexponential upper comparison is outside the diagram. ],
) <fig:proof-structure>

== 2 Model, clocks, and conventions <sec:model>

This section fixes the normalization shared by the static and dynamical arguments.
  In particular, adding a GOE diagonal will provide spectral test vectors without changing any quantity intrinsic
  to the spin law.

Throughout, $n arrow.r oo$; arguments using three distinguished coordinates are applied for $n gt.eq 3$.
  Constants $c \, C > 0$ are independent of $n$, may change from line to line,
  and have only the additional dependencies explicitly indicated.
  Vector norms are Euclidean and matrix norms are operator norms.
  We write $O_(bb(P)) \( 1 \)$ for a sequence whose laws are tight.
  Equivalently, its absolute value exceeds any positive deterministic divergent threshold with probability tending
  to zero. The ability to test every such threshold will be used in the covariance argument.

Following the Gaussian diagonal augmentation in #cite(label("comets1996")) Equation (1.1),
  let $W$ be a real symmetric GOE matrix with independent entries on and above its diagonal, with

$ W_(i j) tilde.op N \( 0 \, 1 \/ n \) quad \( i < j \) \, wide W_(i i) tilde.op N \( 0 \, 2 \/ n \) . $

Set $Omega_n = { - 1 \, 1 }^n$ and

$ H_W \( x \) = 1 / 2 x^T W x \, wide mu_W \( x \) = frac(e^(H_W \( x \)), sum_(y in Omega_n) e^(H_W \( y \))) . $

We abbreviate $mu_W$ to $mu$ when the disorder is fixed. Because every $x_i^2 = 1$,
  the diagonal contributes the same quantity $1 / 2 sum_i W_(i i)$ to every configuration.
  It cancels from the Gibbs normalization, leaving precisely (1.1).
  Covariance, heat-bath kernels and mixing times therefore depend only on the original off-diagonal disorder.
  A spectral direction may still depend on the added diagonal.
  In the realized-start proof we use that direction to test an intrinsic total-variation distance,
  and only then integrate out the diagonal. This distinction avoids imposing an unnecessary simultaneous choice of
  a test direction for all initial states.

For functions $f \, g : Omega_n arrow.r bb(R)$, write

$ chevron.l f \, g chevron.r_mu = mu \[ f g \] \, wide P_i f = bb(E)_mu \[ f divides x_(- i) \] \, wide cal(L) =
  sum_(i = 1)^n \( P_i - upright("Id") \) \, quad P = 1 / n sum_(i = 1)^n P_i . $

The two transition operators are $e^(t cal(L))$ and $P^k$.
  Their exact relation is $cal(L) = n \( P - upright("Id") \)$;
  time in one clock must therefore not be read as a number of attempts in the other.
  Every conditional spin probability is positive. Single-site updates connect the cube,
  and the discrete chain can hold, so both chains are irreducible and the discrete chain is aperiodic.

#thm([Lemma 2.1.])[
  (Heat-bath forms).  #emph[Each $P_i$ is an orthogonal projection in $L^2 \( mu \)$. The unscaled Dirichlet form is
#[#set math.equation(numbering: n => "(2.1)")
 $ cal(D)_mu \( f \) & = - chevron.l f \, cal(L) f chevron.r_mu = sum_i mu \[ \( f - P_i f \)^2 \]\
 & = sum_i inf_(h_i : { - 1 \, 1 }^(n - 1) arrow.r bb(R)) mu \[ \( f - h_i \( x_(- i) \) \)^2 \] . $ <eq:heatbath-form>]

 The discrete form is $chevron.l f \, \( upright("Id") - P \) f chevron.r_mu = cal(D)_mu \( f \) \/ n$,
   and $P$ has spectrum in $\[ 0 \, 1 \]$. For a linear function,
#[#set math.equation(numbering: n => "(2.2)")
 $ cal(D)_mu \( a^T x \) = sum_i a_i^2 alpha_i \, wide alpha_i = mu \[ "sech"^2 g_i \] \, quad g_i \( x \) =
   sum_(j eq.not i) W_(i j) x_j . $ <eq:linear-form>]

]
] <lem:heatbath-form>

#proof[
  Conditional expectation is the orthogonal projection onto functions of $x_(- i)$.
    Hence $chevron.l f \, \( upright("Id") - P_i \) f chevron.r_mu = parallel f -
    P_i f parallel_(L^2 \( mu \))^2$, and this squared distance is the infimum over all such functions.
    Summing proves (2.1); averaging instead proves the discrete form identity.
    Moreover $0 lt.eq chevron.l f \, P f chevron.r_mu lt.eq chevron.l f \, f chevron.r_mu$ for every $f$,
    so the spectrum of $P$ lies in $\[ 0 \, 1 \]$.
  For a linear observable, all terms except $a_i x_i$ are fixed after conditioning on $x_(- i)$.
    The conditional mean and variance of $x_i$ are $tanh g_i$ and $"sech"^2 g_i$, respectively.
    Its contribution to the form is therefore $a_i^2 mu \[ "sech"^2 g_i \]$, which gives (2.2). ◻
]

For probability laws $nu \, mu$ on $Omega_n$, use

$ parallel nu - mu parallel_(upright("TV")) = 1 / 2 sum_x \| nu \( x \) - mu \( x \) \| =
  sup_(A subset.eq Omega_n) \| nu \( A \) - mu \( A \) \| . $

Define

$ d_t^(upright("ct")) \( W \, x \) & = parallel e^(t cal(L)) \( x \, dot.op \) -
  mu_W parallel_(upright("TV")) \, & t_(upright("mix")) & = inf { t gt.eq 0 :
  max_x d_t^(upright("ct")) \( W \, x \) lt.eq 1 \/ 4 } \,\
d_k^(upright("dt")) \( W \, x \) & = parallel P^k \( x \, dot.op \) -
  mu_W parallel_(upright("TV")) \, & k_(upright("mix")) & = min { k in bb(N) union { 0 } :
  max_x d_k^(upright("dt")) \( W \, x \) lt.eq 1 \/ 4 } . $

All limits in probability and statements holding with high probability refer to the disorder,
  together with explicitly introduced auxiliary randomness.
  No uniform assertion over disorder-adaptive time sequences is implicit.

We finish with the static identity that will turn overlap bounds into covariance bounds.
  Zero field gives $mu \( x \) = mu \( - x \)$, so every spin has mean zero. Consequently

$ Sigma = "Cov"_mu \( x \) = mu \[ x x^T \] \, wide Sigma_(i i) = 1 \, wide q \( x \, y \) = frac(x^T y, n) . $

For independent samples from $mu$, expansion of the square gives

#[#set math.equation(numbering: n => "(2.3)")
 $ "Tr" Sigma^2 = n^2 bb(E)_(mu ⊗ mu) q^2 . $ <eq:overlap-covariance>]

== 3 Spectral estimates at a slowly enlarged edge scale <sec:spectral>

Our objective is to control the leading GOE eigenvalues and the first two resolvent traces just above the edge on
  an event independent of eigenvector orientation. These estimates enter both the Gaussian conditioning argument
  in Section 4 and the variational deficit in Section 5. A fixed logarithmic enlargement would lose the strongest
  quantifiers of the main theorems, so the enlargement below may diverge as slowly as needed.

The proof has three parts. Tridiagonalization isolates independent noise;
  a simultaneous quadratic-form estimate compares that noise with a deterministic confinement energy;
  and a Hermite identity evaluates the deterministic resolvent.
  Here $C \, c > 0$ are universal, while $C_M$ may also depend on a fixed $M < oo$.

Let $L_n arrow.r oo$ be any positive deterministic sequence with $L_n lt.eq log n$ for all sufficiently large $n$,
  and set

#[#set math.equation(numbering: n => "(3.1)")
 $ s_(*) = n^(- 2 \/ 3) \, wide s_0 = L_n s_(*) \, wide h_n = L_n^(1 \/ 8) \, wide A_n = h_n +
   sqrt(log \( 2 + L_n \)) \, wide eta_n = A_n L_n^(- 3 \/ 4) . $ <eq:spectral-scales>]

In particular, $eta_n arrow.r 0$. Define

$ R \( s \) = frac(2 + s - sqrt(s \( 4 + s \)), 2) \, wide s > 0 . $

#thm([Proposition 3.1.])[
  (An eigenvalue-only good event).  #emph[Let $W$ have the GOE normalization of Section 2,
    and write its eigenvalues as $lambda_1 gt.eq dots.h.c gt.eq lambda_n$.
    There are events $cal(G)_n \( L_n \)$, measurable with respect to these eigenvalues alone, such that
$ bb(P) #scale(x: 120%, y: 120%)[\(] cal(G)_n \( L_n \)^c #scale(x: 120%, y: 120%)[\)] lt.eq
  C exp \( - c L_n^(1 \/ 4) \) $

 for all sufficiently large $n$. On the same events, for every fixed $M < oo$,
#[#set math.equation(numbering: n => "(3.2)")
 $ & lambda_j = 2 + o \( s_0 \) quad \( 1 lt.eq j lt.eq 3 \) \, &  & max_i \| lambda_i \| lt.eq 3 \,\
 & 1 / n sum_(i = 1)^n frac(1, 2 + s - lambda_i) = R \( s \) + o \( sqrt(s) \) \, &  & 1 /
   n sum_(i = 1)^n frac(1, \( 2 + s - lambda_i \)^2) lt.eq C_M /
   sqrt(s) quad \( s_0 lt.eq s lt.eq M \) . $ <eq:spectral-estimates>]

 All denominators in these formulas are positive. The little-oh terms have deterministic bounds,
   uniformly over the event: the first three eigenvalue errors divided by $s_0$ are at most
   $C \( L_n^(- 1) + eta_n \)$, and the first resolvent error divided by $sqrt(s)$ is at most
   $C_M \( L_n^(- 3 \/ 2) + eta_n \)$. The event does not depend on $M$.]
] <prop:spectral>

=== 3.1 Tridiagonal reduction and concentration of its entries <tridiagonal-reduction-and-concentration-of-its-entries>

The following reduction is the GOE tridiagonalization of #cite(label("dumitriuEdelman2002")) Theorem 2.1.
  We include the argument to fix both its normalization and its independence properties.

#thm([Lemma 3.2.])[
  (Tridiagonal representation).  #emph[The eigenvalues of $W$ have the same law as those of a symmetric
    tridiagonal matrix $T$ whose entries
$ T_(i i) tilde.op N \( 0 \, 2 \/ n \) \, wide T_(i \, i + 1) = T_(i + 1 \, i) tilde.op chi_(n - i) /
  sqrt(n) quad \( 1 lt.eq i < n \) $

 are independent. Here $chi_m$ is the Euclidean norm of $m$ independent standard normal variables.]
] <lem:tridiagonal>

#proof[
  We expose one column at a time. The first diagonal entry, the rest of the first column,
    and the trailing square block are independent; this independence will persist after each rotation.
    The column vector has $n - 1$ independent $N \( 0 \, 1 \/ n \)$ entries.
    Choose an orthogonal transformation of the trailing coordinates that sends this vector to its nonnegative
    length times the first coordinate vector. Conjugation by this transformation produces the desired first
    off-diagonal entry.
  To justify the next exposure, observe that the trailing block has density proportional to
    $exp \( - n "Tr" B^2 \/ 4 \)$. Both this density and Euclidean volume are invariant under orthogonal
    conjugation. Conditional on the column vector, the chosen transformation is fixed,
    so the conjugated trailing block still has the same GOE density and its conditional law does not depend on the
    column. It is therefore independent of all entries already exposed.
    Repeat the construction inside that block, then inside each successive trailing block.
    At step $i$ the fresh column has $n - i$ independent $N \( 0 \, 1 \/ n \)$ entries.
    This proves both the stated distributions and their joint independence. The conjugations preserve eigenvalues. ◻
]

The reduction leaves Gaussian diagonal noise and centered chi noise off the diagonal.
  Both satisfy a dimension-independent exponential estimate. For the latter, the two estimates we need are

#[#set math.equation(numbering: n => "(3.3)")
 $ bb(E) exp (t frac(chi_m - bb(E) chi_m, sqrt(n))) lt.eq exp \( C t^2 \/ n \) \, wide 0 lt.eq sqrt(m) -
   bb(E) chi_m lt.eq C / sqrt(m) . $ <eq:chi-entry-bounds>]

Here and below a moment-generating bound is asserted for every real $t$.
  For completeness, the Gaussian-square moment-generating function and Chernoff’s inequality give

$ bb(P) { chi_m^2 gt.eq m a } lt.eq \( a e^(1 - a) \)^(m \/ 2) quad \( a > 1 \) \, $

with the same right-hand side for the lower-tail event when $0 < a < 1$. Since

$ a - 1 - log a gt.eq \( sqrt(a) - 1 \)^2 \, $

it follows that $bb(P) { \| chi_m - sqrt(m) \| gt.eq r } lt.eq 2 e^(- r^2 \/ 2)$ for $r gt.eq 0$.
  This tail bound gives $"Var" \( chi_m \) lt.eq C$ and, by Jensen’s inequality,

$ sqrt(m) - bb(E) chi_m = frac("Var" \( chi_m \), sqrt(m) + bb(E) chi_m) lt.eq C / sqrt(m) . $

To prove the centered exponential bound without an extra prefactor, let $X \,
  X'$ be independent copies of $chi_m$ and put $Z = X - X'$. Then $Z$ is symmetric and

$ bb(P) { \| Z \| gt.eq r } lt.eq 4 e^(- r^2 \/ 8) \, wide bb(E) Z^(2 k) lt.eq 4 dot.op 8^k k ! quad \( k gt.eq 1 \) . $

The moment bound follows by integrating the tail. Jensen’s inequality conditional on $X$,
  followed by the power series of $cosh$, gives

$ bb(E) e^(t \( X - bb(E) X \)) & lt.eq bb(E) e^(t Z) = bb(E) cosh \( t Z \)\
 & lt.eq 1 + 4 sum_(k gt.eq 1) frac(8^k k ! t^(2 k), \( 2 k \) !) lt.eq 1 + 4 \( e^(8 t^2) - 1 \) lt.eq e^(32 t^2) . $

We used $\( 2 k \) ! gt.eq \( k ! \)^2$ and $\( 1 + u \)^4 gt.eq 1 + 4 u$ for $u gt.eq 0$.
  The Gaussian tail ensures exponential integrability, and Tonelli’s theorem also justifies the nonnegative $cosh$
  series. Replacing $t$ by $t \/ sqrt(n)$ proves (3.3). The centered diagonal entries satisfy the same exponential
  estimate directly.

=== 3.2 A simultaneous quadratic-form estimate <a-simultaneous-quadratic-form-estimate>

The quadratic-form estimate follows the approach used in soft-edge analysis for tridiagonal ensembles.
  Ramírez, Rider, and Virág #cite(label("ramirezRiderVirag2011")) developed a variational approach involving
  discrete gradient and confinement energies. The block summation-by-parts estimate of Ledoux and Rider
  #cite(label("ledouxRider2010")) Proposition 7 and Lemma 8 is particularly close to the noise control used here.
  Their proof of Theorem 1 (Right-Tail), on page 1329 immediately before Lemma 9,
  gives the corresponding substitution for off-diagonal weights.
  We arrange that control simultaneously over energy scales and spatial shells,
  then use a deterministic Hermite resolvent identity. This provides the first and second resolvent bounds needed
  here for every slowly diverging edge enlargement.

Let $D$ be the deterministic tridiagonal matrix with zero diagonal and off-diagonal entries

$ c_i = sqrt(1 - i \/ n) quad \( 1 lt.eq i < n \) \, wide E = 2 I - D . $

For later boundary formulas set $c_0 = c_n = 0$.

#thm([Lemma 3.3.])[
  (Noise controlled by deterministic energy).  #emph[There is a universal constant $C_0$ such that, with
$ Phi_n \( x \) = C_0 n^(- 1 \/ 2) A_n \( x + s_0 \)^(1 \/ 4) sqrt(1 + log \( 1 + x \/ s_0 \)) \, wide x gt.eq 0 \, $

 the matrix $H = T - D$ satisfies, simultaneously for every unit vector $u in bb(R)^n$,
#[#set math.equation(numbering: n => "(3.4)")
 $ \| u^T H u \| lt.eq Phi_n \( u^T E u \) $ <eq:form-bound>]

 on an event $cal(F)_n$ with $bb(P) \( cal(F)_n^c \) lt.eq
   C exp \( - c L_n^(1 \/ 4) \)$ for all sufficiently large $n$. Moreover,
#[#set math.equation(numbering: n => "(3.5)")
 $ sup_(x gt.eq 0) \| Phi'_n \( x \) \| lt.eq C eta_n \, wide Phi_n \( 0 \) lt.eq C eta_n s_0 . $ <eq:phi-smallness>]

]
] <lem:form-bound>

#proof[
  We prove the lemma in three steps: the deterministic energy controls where a vector can concentrate,
    one noise event controls block prefixes at every relevant scale, and summation by parts combines these controls.
  #emph[Energy controls spatial mass and gradients.] For a unit vector $u$, write $e = u^T E u$. Expanding gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ e = sum_(i < n) c_i \( u_i - u_(i + 1) \)^2 + sum_(i = 1)^n \( 2 - c_i - c_(i - 1) \) u_i^2 .
     $ <eq:deterministic-energy>]
  The row sums of $D$ are at most two, so $0 lt.eq E lt.eq 4 I$.
    The coefficients $2 - c_i - c_(i - 1)$ are at least $i \/ \( 2 n \)$:
    for interior indices this follows from $1 - sqrt(1 - t) gt.eq t \/ 2$,
    and the boundary indices satisfy the same inequality directly.
    Also $c_i gt.eq 1 \/ sqrt(2)$ when $i lt.eq n \/ 2$. Thus (3.6) implies
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_i i / n u_i^2 lt.eq 2 e \, wide sum_(i > n \/ 2) u_i^2 + sum_(i < n) \( u_i - u_(i + 1) \)^2 lt.eq
     C e . $ <eq:energy-tail-gradient>]
  For the second inequality, control gradients in the first half by the weighted gradient term,
    and use $\( u_i - u_(i + 1) \)^2 lt.eq 2 u_i^2 + 2 u_(i + 1)^2$ for the remaining edges.
  #emph[One event for every energy.] The vector will be selected after the matrix has been realized,
    so the probability estimate must be simultaneous. We first prepare blocks at every dyadic energy scale. Set
  $ sigma_j = 2^j s_(*) \, wide 0 lt.eq j lt.eq J_n := ⌈log_2 \( 4 \/ s_(*) \)⌉ \, wide d_j = max { 1 \,
    floor.l sigma_j^(- 1 \/ 2) floor.r } . $
  For each of the two independent-entry sequences (diagonal entries and centered off-diagonal entries),
    partition its index set into consecutive blocks of lengths between $d_j$ and $2 d_j$.
    Such a partition is obtained by merging a last short block with its predecessor.
    Assign label $r = 0$ when the first index of a block is at most $2 n sigma_j$; otherwise assign $r gt.eq
    1$ when that index is in $\( 2^r n sigma_j \, 2^(r + 1) n sigma_j \]$.
  If $xi_i$ is either centered entry sequence and a block has length $m lt.eq 2 d_j$, its partial sums $S_k$ obey
  $ bb(P) {max_(k lt.eq m) \| S_k \| gt.eq a} lt.eq 2 exp (- frac(n a^2, C d_j)) . $
  Indeed, $exp \( t S_k - C k t^2 \/ n \)$ is a nonnegative supermartingale by (3.3).
    Stopping it at its first crossing of $a$ bounds the one-sided probability by $exp \( - t a + C m t^2 \/ n \)$;
    optimizing $t > 0$ and repeating for $- S_k$ proves the displayed estimate.
  At a fixed pair $\( j \, r \)$, the number of blocks is at most
  $ C (1 + frac(2^r n sigma_j, d_j)) lt.eq C 2^r n sigma_j^(3 \/ 2) = C 2^(r + 3 j \/ 2) . $
  For $sigma_j lt.eq 1$, use $d_j gt.eq sigma_j^(- 1 \/ 2) \/ 2$; for $sigma_j > 1$, use $d_j = 1$.
    The additive constant is absorbed because $n sigma_j^(3 \/ 2) gt.eq 1$.
    Consequently, for a sufficiently large fixed constant $K$,
    there is an event $cal(F)_n$ on which every block of both sequences has all its centered partial sums bounded by
  #[#set math.equation(numbering: n => "(3.8)")
   $ K sqrt(d_j \/ n) thin \( h_n + sqrt(j + r) \) \, $ <eq:block-prefix>]
  and
  $ bb(P) \( cal(F)_n^c \) & lt.eq C sum_(j \, r gt.eq 0) 2^(r + 3 j \/ 2) e^(- c K^2 \( h_n + sqrt(j + r) \)^2)\
 & lt.eq C e^(- c' h_n^2) = C e^(- c' L_n^(1 \/ 4)) . $
  Here $K$ is chosen so that the factors in $j$ and $r$ form summable geometric series.
    This bound does not acquire a factor from the number of scales.
  #emph[From block prefixes to quadratic forms.] We may now fix the noise event and choose an arbitrary unit
    vector. Select the first $j$ for which $e lt.eq sigma_j$. Since $e lt.eq 4$, this index exists, and
  $ sigma_j lt.eq 2 \( e + s_(*) \) . $
  For the weights $w_i = u_i^2$ or $w_i = u_i u_(i + 1)$, the sum of their absolute values over all blocks with
    label $r$ is at most $C 2^(- r)$. For $r gt.eq 1$, every coordinate used is beyond $2^r n sigma_j$,
    and (3.7) bounds its total squared mass by $2 e \/ \( 2^r sigma_j \) lt.eq 2^(1 - r)$.
    The off-diagonal weights obey the same bound by $\| u_i u_(i + 1) \| lt.eq \( u_i^2 + u_(i + 1)^2 \) \/ 2$.
    For $r = 0$, use the unit norm.
  The summed variation of these weights within those blocks is at most $C 2^(- r \/ 2) sqrt(e)$.
    To verify this assertion, use
  $ u_(i + 1)^2 - u_i^2 = \( u_(i + 1) - u_i \) \( u_(i + 1) + u_i \) $
  for diagonal weights and
  $ u_(i + 1) u_(i + 2) - u_i u_(i + 1) =
    u_(i + 1) #scale(x: 120%, y: 120%)[\[] \( u_(i + 2) - u_(i + 1) \) + \( u_(i + 1) - u_i \)
    #scale(x: 120%, y: 120%)[\]] $
  for off-diagonal weights. Cauchy–Schwarz combines the preceding tail mass bound with the total gradient bound in
    (3.7); each coordinate or edge is counted at most a fixed number of times.
  For clarity, the summation-by-parts step can be made blockwise.
    Suppose all centered entry prefixes in a block are bounded by $B$,
    and let $macron(xi)$ be the entry average on that block. Then $\| macron(xi) \| lt.eq B \/ d_j$.
    The prefixes of $xi_i - macron(xi)$ are at most $2 B$ and vanish at the block end. Therefore
  $ lr(|sum_(i upright(" in block")) xi_i w_i|) lt.eq B / d_j sum_(i upright(" in block")) \| w_i \| +
    2 B sum_(i \, i + 1 upright(" in block")) \| w_(i + 1) - w_i \| . $
  Using (3.8) and summing by labels proves that either centered weighted sum is bounded by
  $ & C n^(- 1 \/ 2) sum_(r gt.eq 0) \( h_n + sqrt(j + r) \)
    (d_j^(- 1 \/ 2) 2^(- r) + d_j^(1 \/ 2) 2^(- r \/ 2) sqrt(e))\
 & #h(35mm)  lt.eq C \( h_n + sqrt(j) \) n^(- 1 \/ 2) sigma_j^(1 \/ 4) . $
  For $sigma_j lt.eq 1$, the last step uses $d_j asymp sigma_j^(- 1 \/ 2)$ and $e lt.eq sigma_j$.
    For $1 < sigma_j < 8$, it follows from $d_j = 1$ with a changed universal constant.
    The series in $r$ converges geometrically, including its $sqrt(r)$ factor.
  The centered entries have now been controlled uniformly in $u$.
    The only remaining part of $T - D$ is the deterministic error in the off-diagonal means.
    By (3.3), their difference from $c_i$ is at most $C \/ \( sqrt(n) sqrt(n - i) \)$.
    It is at most $C \/ n$ for $i lt.eq n \/ 2$ and at most $C \/ sqrt(n)$ thereafter.
    Thus their quadratic-form contribution is at most
  $ C \/ n + C e \/ sqrt(n) \, $
  using again the tail mass bound. Finally,
  $ j lt.eq C log \( 2 + e \/ s_(*) \) lt.eq C #scale(x: 120%, y: 120%)[\[] log \( 2 + L_n \) +
    log \( 1 + e \/ s_0 \) #scale(x: 120%, y: 120%)[\]] . $
  Together with $sigma_j lt.eq 2 \( e + s_(*) \)$ and $s_(*) lt.eq s_0$,
    this converts the centered estimate into (3.4). The mean errors are absorbed into the same bound because $0
    lt.eq e lt.eq 4$ and $L_n gt.eq 1$ for large $n$. Both sequences,
    and the factor two from off-diagonal entries, are absorbed by choosing $C_0$ once and for all.
  Finally, the scalar comparison must be stable under changing the energy.
    Put $q \( x \) = 1 + log \( 1 + x \/ s_0 \)$. Direct differentiation gives
  $ Phi'_n \( x \) = C_0 n^(- 1 \/ 2) A_n \( x + s_0 \)^(- 3 \/ 4)
    (sqrt(q \( x \)) / 4 + frac(1, 2 sqrt(q \( x \)))) . $
  Since $y^(- 3 \/ 4) sqrt(1 + log y)$ is bounded for $y gt.eq 1$,
    its supremum is at most $C n^(- 1 \/ 2) A_n s_0^(- 3 \/ 4) = C eta_n$.
    The equality $Phi_n \( 0 \) \/ s_0 = C_0 eta_n$ proves the other assertion in (3.5). ◻
]

=== 3.3 The deterministic resolvent <the-deterministic-resolvent>

The noise bound reduces the random trace problem to $D$. Its entries were chosen so that the characteristic
  polynomials satisfy a Hermite recurrence. The resulting scalar differential equation will control both the
  resolvent and the number of eigenvalues near the edge.

#thm([Lemma 3.4.])[
  (Hermite resolvent estimates).  #emph[Let $e_1 lt.eq dots.h.c lt.eq e_n$ be the eigenvalues of $E = 2 I - D$, and set
$ R_D \( s \) = 1 / n "Tr" \( s + E \)^(- 1) \, wide T_D \( s \) = 1 / n "Tr" \( s + E \)^(- 2) = - R'_D \( s \) . $

 For every fixed $M < oo$ and all sufficiently large $n$, uniformly for $s_0 lt.eq s lt.eq M$,
#[#set math.equation(numbering: n => "(3.9)")
 $ T_D \( s \) lt.eq C_M s^(- 1 \/ 2) \, wide 0 lt.eq R \( s \) - R_D \( s \) lt.eq
   frac(C_M, n s) . $ <eq:deterministic-traces>]

 Moreover,
#[#set math.equation(numbering: n => "(3.10)")
 $ N \( t \) := \# { i : e_i lt.eq t } lt.eq C n t^(3 \/ 2) wide \( t gt.eq s_0 \) . $ <eq:deterministic-counting>]

]
] <lem:deterministic-resolvent>

#proof[
  We first derive the differential equation and locate its relevant quadratic root,
    then absorb its finite-dimensional error at $s gt.eq s_0$. Reverse the coordinates of $D$.
    Its off-diagonal entries become $sqrt(k \/ n)$, $1 lt.eq k < n$,
    so the characteristic polynomials of its successive principal minors satisfy
  $ P_0 \( z \) = 1 \, quad P_1 \( z \) = z \, quad P_(k + 1) \( z \) =
    z P_k \( z \) - \( k \/ n \) P_(k - 1) \( z \) . $
  Induction gives $P'_k = k P_(k - 1)$: differentiation of the recurrence and the recurrence one step earlier show
    that $P'_(k + 1) = P_k + k P_k$. Consequently
  $ P''_n - n z P'_n + n^2 P_n = 0 . $
  Since $P_n$ is the characteristic polynomial of $D$, $R_D \( s \) =
    P'_n \( 2 + s \) \/ \( n P_n \( 2 + s \) \)$. The differential equation yields
  #[#set math.equation(numbering: n => "(3.11)")
   $ R_D \( s \)^2 - \( 2 + s \) R_D \( s \) + 1 = frac(T_D \( s \), n) > 0 . $ <eq:hermite-riccati>]
  For every $s > 0$, $R_D \( s \)$ is finite because $E gt.eq 0$.
    The two roots of the quadratic on the left are $R \( s \)$ and
  $ R_(+) \( s \) = frac(2 + s + sqrt(s \( 4 + s \)), 2) . $
  At large $s$, $R_D \( s \) arrow.r 0$ whereas $R_(+) \( s \) arrow.r oo$.
    Positivity in (3.11) thus places $R_D$ below the smaller root there,
    and continuity prevents it from crossing either root anywhere on $\( 0 \, oo \)$.
    If $delta \( s \) = R \( s \) - R_D \( s \)$, factoring the quadratic gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ 0 lt.eq delta \( s \) lt.eq frac(T_D \( s \), n sqrt(s \( 4 + s \))) . $ <eq:root-difference>]
  Termwise comparison of resolvents shows that
  $ T_D \( s \) lt.eq 2 / s #scale(x: 120%, y: 120%)[\[] R_D \( s \/ 2 \) -
    R_D \( s \) #scale(x: 120%, y: 120%)[\]] lt.eq 2 / s #scale(x: 120%, y: 120%)[\[] R \( s \/ 2 \) - R \( s \) +
    delta \( s \) #scale(x: 120%, y: 120%)[\]] . $
  Differentiating the explicit expression for $R$ gives
  $ 0 < - R' \( s \) = frac(2, sqrt(s \( 4 + s \)) thin \( 2 + s + sqrt(s \( 4 + s \)) \)) lt.eq frac(1, 2 sqrt(s)) . $
  Integrating from $s \/ 2$ to $s$ therefore gives $R \( s \/ 2 \) - R \( s \) lt.eq sqrt(s) - sqrt(s \/ 2) lt.eq
    sqrt(s)$. Hence
  $ T_D \( s \) lt.eq C / sqrt(s) + frac(2 T_D \( s \), n s sqrt(s \( 4 + s \))) . $
  For $s gt.eq s_0$, the coefficient of the last term is at most $\( n s_0^(3 \/ 2) \)^(- 1) =
    L_n^(- 3 \/ 2) arrow.r 0$. Absorbing it proves the bound on $T_D$,
    and (3.12) then proves the bound on $delta$. Notice that $R_D \( s \/ 2 \) lt.eq
    R \( s \/ 2 \)$ was established for every positive $s \/ 2$; it does not require $s \/ 2 gt.eq s_0$.
  The second-trace estimate also gives the counting estimate needed for the later dyadic transfer.
    For $s_0 lt.eq t lt.eq 1$, each $e_i lt.eq t$ contributes at least $\( 2 t \)^(- 2)$ to $n T_D \( t \)$.
    Thus $N \( t \) lt.eq 4 n t^2 T_D \( t \) lt.eq C n t^(3 \/ 2)$.
    For $t gt.eq 1$, the same bound follows from $N \( t \) lt.eq n$. ◻
]

=== 3.4 Eigenvalue comparison and transfer of the traces <eigenvalue-comparison-and-transfer-of-the-traces>

#proof[
  The previous lemmas supply the noise control and the reference traces.
    We now transfer them to an event defined entirely by the eigenvalues. There are three tasks:
    compare ordered eigenvalues, locate the top three, and compare the two traces.
  #emph[Ordered eigenvalues.] Work first in the tridiagonal realization.
    On $cal(F)_n$, (3.4) bounds the Rayleigh quotient of $E - H = 2 I - T$ between
  $ f_(-) \( e \) := e - Phi_n \( e \) quad upright("and") quad f_(+) \( e \) := e + Phi_n \( e \) . $
  By (3.5), both functions are increasing for large $n$. The span of the first $i$ eigenvectors of $E$ has every
    unit-vector energy at most $e_i$, so the min–max principle gives $2 - lambda_i lt.eq f_(+) \( e_i \)$.
    On the span of eigenvectors $i$ through $n$, every energy is at least $e_i$;
    the complementary max–min principle gives $2 - lambda_i gt.eq f_(-) \( e_i \)$. Therefore
  #[#set math.equation(numbering: n => "(3.13)")
   $ \| 2 - lambda_i - e_i \| lt.eq Phi_n \( e_i \) \, wide 1 lt.eq i lt.eq n . $ <eq:eigenvalue-comparison>]
  This argument uses monotonicity of scalar functions of Rayleigh quotients,
    and does not require an operator-monotonicity assertion.
  Define $cal(G)_n \( L_n \)$ to be precisely the event (3.13),
    with the deterministic $e_i$ and $Phi_n$ constructed above. It depends only on the ordered eigenvalues.
    The tridiagonal event $cal(F)_n$ implies it; hence Lemma 6 transfers its probability bound to $W$.
    All remaining conclusions are deterministic on $cal(G)_n \( L_n \)$.
  #emph[The first three directions.] The conditioning argument will need three large coordinate variances.
    To locate the corresponding eigenvalues, take $m = floor.l n^(1 \/ 3)
    floor.r$ and the span of the first three discrete Dirichlet sine modes on ${ 1 \, dots.h \, m }$,
    extended by zero. The Dirichlet Laplacian on this segment has eigenvalues $4
    sin^2 \( k pi \/ \[ 2 \( m + 1 \) \] \)$, so its quadratic form on this span is at most $C \/ m^2$.
    On vectors supported on the segment, the form difference between $E$ and that Laplacian has absolute value at most
  $ 2 max_(1 lt.eq i < m) \| 1 - c_i \| sum_(i < m) \| u_i u_(i + 1) \| lt.eq C m \/ n . $
  The min–max principle therefore gives $0 lt.eq e_1 \, e_2 \, e_3 lt.eq C \( m^(- 2) + m \/ n \) lt.eq
    C n^(- 2 \/ 3)$. Equations (3.5) and (3.13) imply
  $ max_(j lt.eq 3) frac(\| lambda_j - 2 \|, s_0) lt.eq C \( L_n^(- 1) + eta_n \) . $
  Also every $e_i in \[ 0 \, 4 \]$, so $max_i \| lambda_i \| lt.eq 2 + Phi_n \( 4 \)$.
    The assumption $L_n lt.eq log n$ gives $Phi_n \( 4 \) = o \( 1 \)$, proving the stated bound by three.
  #emph[Resolvent traces.] The eigenvalue comparison also controls every denominator:
    for every $s gt.eq s_0$ and every $e in \[ 0 \, 4 \]$,
  #[#set math.equation(numbering: n => "(3.14)")
   $ frac(Phi_n \( e \), s + e) lt.eq frac(Phi_n \( 0 \) + C eta_n e, s + e) lt.eq
     C eta_n . $ <eq:denominator-comparison>]
  Thus (3.13) makes $2 + s - lambda_i$ positive and equal to $\( s + e_i \) \( 1 + O \( eta_n \) \)$,
    uniformly in both $i$ and $s gt.eq s_0$. The normalized second trace is consequently at most a constant times
    $T_D \( s \)$, proving its bound in (3.2).
  For the first trace, subtract term by term and use $\( e_i + s_0 \)^(1 \/ 4) lt.eq \( s + e_i \)^(1 \/ 4)$ to obtain
  #[#set math.equation(numbering: n => "(3.15)")
   $ & lr(|1 / n sum_i frac(1, 2 + s - lambda_i) - R_D \( s \)|)\
 & wide lt.eq C n^(- 1 \/ 2) A_n 1 / n sum_i \( s + e_i \)^(- 7 \/ 4) sqrt(1 + log \( 1 + e_i \/ s_0 \)) .
   $ <eq:trace-perturbation>]
  We spell out the dyadic sum because its uniformity near $s_0$ is useful. The range $e_i lt.eq s$ contributes at most
  $ C s^(- 7 \/ 4) frac(N \( s \), n) sqrt(1 + log \( 1 + s \/ s_0 \)) lt.eq
    C s^(- 1 \/ 4) sqrt(1 + log \( 1 + s \/ s_0 \)) . $
  For $k gt.eq 0$, the shell $2^k s < e_i lt.eq 2^(k + 1) s$ contributes at most
  $ C s^(- 1 \/ 4) 2^(- k \/ 4) sqrt(1 + log \( 1 + s \/ s_0 \) + \( k + 1 \) log 2) \, $
  by (3.10). This counting estimate remains valid above one, so all shells are covered.
    The convergent geometric series, with its additional square-root factor, bounds the sum in (3.15) by
  $ C_M s^(- 1 \/ 4) sqrt(1 + log \( 1 + s \/ s_0 \)) . $
  Dividing the resulting trace error by $sqrt(s)$ and writing $r = s \/ s_0$ gives
  $ C_M eta_n r^(- 3 \/ 4) sqrt(1 + log \( 1 + r \)) lt.eq C_M eta_n wide \( r gt.eq 1 \) . $
  Finally, Lemma 8 gives
  $ frac(\| R_D \( s \) - R \( s \) \|, sqrt(s)) lt.eq frac(C_M, n s^(3 \/ 2)) lt.eq C_M L_n^(- 3 \/ 2) . $
  This proves the quantitative first-trace error and completes all of (3.2).
    The event was defined before $M$ was chosen, and each displayed error is deterministic on that event.
    Consequently every deterministic sequence of spectra in $cal(G)_n \( L_n \)$ satisfies the estimates for every
    fixed finite $M$, without any condition on eigenvector orientation. ◻
]

== 4 Gaussian conditioning on the sphere <sec:spherical>

Conditioning independent centered Gaussian coordinates on their squared radius gives an exact representation of a
  quadratic tilt of uniform sphere measure. We quantify that representation in two stages.
  For bounded deterministic spectra, radial-density estimates compare partition integrals on the full sphere and
  its intersections with hyperplanes through the origin with the same variational value.
  We then impose the edge estimates of Section 3 to bound small coordinate projections and squared overlaps at
  criticality.

=== 4.1 Radial representation and partition estimates <radial-representation-and-partition-estimates>

We begin with a deterministic ordered spectrum $lambda_1 gt.eq dots.h.c gt.eq lambda_n$, where $n gt.eq
  3$ and $max_i \| lambda_i \| lt.eq 3$, and set $Lambda = "diag" \( lambda_1 \, dots.h \, lambda_n \)$.
  Let $sigma_n$ be uniform probability on ${ u in bb(R)^n : parallel u parallel^2 = n }$.
  For $0 lt.eq a lt.eq 2$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ S \( a \) = integral e^(a u^T Lambda u \/ 2) thin sigma_n \( d u \) \, wide B \( a \) =
   inf_(z > a lambda_1) {frac(z - 1, 2) - frac(1, 2 n) sum_(i = 1)^n log \( z - a lambda_i \)} .
   $ <eq:spherical-definitions>]

The associated tilted probability is

$ sigma_(Lambda \, a) \( d u \) = S \( a \)^(- 1) e^(a u^T Lambda u \/ 2) thin sigma_n \( d u \) \, wide
  sigma_Lambda = sigma_(Lambda \, 1) . $

Quadratic exponential laws on a sphere belong to the Bingham family #cite(label("bingham1974")).
  Their representation through a Gaussian conditioned on its radius, and the associated radial-density formula,
  are classical in the analysis of Bingham and Fisher–Bingham normalizing constants #cite(label("kumeWood2005"))
  #cite(label("kumePrestonWood2013")). Gaussian integration and spherical saddles also enter the SK analyses of
  Baik and Lee #cite(label("baikLee2016")), Landon #cite(label("landon2022")),
  and Du and Huang #cite(label("duHuang2026FreeEnergy")) #cite(label("duHuang2026Overlap"));
  the proof of Lemma 4.5 in #cite(label("duHuang2026Overlap")) uses the same representation by Gaussian
  coordinates conditioned on the radius. We prove the exact identity with the probability normalization and
  squared radius used here; no saddlepoint approximation is used in this conditioning step.

#thm([Lemma 4.1.])[
  (Gaussian representation).  #emph[For every $a in \[ 0 \, 2 \]$,
    the infimum defining $B \( a \)$ has a unique minimizer $z_a$. With
#[#set math.equation(numbering: n => "(4.2)")
 $ k_i \( a \) = \( z_a - a lambda_i \)^(- 1) \, wide sum_(i = 1)^n k_i \( a \) = n \, $ <eq:spherical-saddle>]

 one has
$ 1 + a lambda_n lt.eq z_a lt.eq 1 + a lambda_1 \, wide 1 / 13 lt.eq k_i \( a \) lt.eq n . $

 Let $Y_i$ be independent $N \( 0 \, k_i \( a \) \)$ variables, and let $p_a$ be the density of $sum_i Y_i^2$. Then
#[#set math.equation(numbering: n => "(4.3)")
 $ S \( a \) = e^(n B \( a \)) frac(p_a \( n \), p_(chi_n^2) \( n \)) . $ <eq:spherical-identity>]

 The conditional law of $Y$ given $parallel Y parallel^2 = n$, defined by radial disintegration,
   is $sigma_(Lambda \, a)$.]
] <lem:spherical-identity>

#proof[
  First choose the Gaussian variances so that the squared radius has mean $n$.
    Then compare its radial density with the standard Gaussian density at that same radius.
    To implement the first step, denote the objective in (4.1) by $F_a \( z \)$. On $z > a lambda_1$,
  $ F'_a \( z \) = 1 / 2 - frac(1, 2 n) sum_i \( z - a lambda_i \)^(- 1) \, wide F''_a \( z \) =
    frac(1, 2 n) sum_i \( z - a lambda_i \)^(- 2) > 0 . $
  The derivative tends to $- oo$ at the left endpoint and to $1 \/ 2$ at infinity.
    The function itself tends to $+ oo$ at both ends. This proves existence, uniqueness, and (4.2).
  The average of the reciprocals of $z_a - a lambda_i$ is one.
    Their minimum is therefore at most one, and their maximum is at least one, giving the stated bounds on $z_a$.
    Consequently
  $ 0 < z_a - a lambda_i lt.eq 1 + a \( lambda_1 - lambda_n \) lt.eq 13 . $
  The lower bound for $k_i \( a \)$ follows; the upper bound follows from their positivity and sum $n$.
    At $a = 0$ these formulas give $z_0 = 1$, $k_i \( 0 \) = 1$, and $B \( 0 \) = 0$.
  The minimizer is now fixed. The radial comparison itself is exact at any admissible $z$:
    put $Q = z I - a Lambda$ and let $Y^(z \, a) tilde.op N \( 0 \, Q^(- 1) \)$.
    Its density relative to a standard Gaussian vector at $y in bb(R)^n$ is
  $ \( det Q \)^(1 \/ 2) exp (- frac(z - 1, 2) parallel y parallel^2 + a / 2 y^T Lambda y) . $
  The standard Gaussian has uniform conditional angular law.
    Integrating this ratio over the sphere of squared radius $n$ gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ frac(p_(z \, a) \( n \), p_(chi_n^2) \( n \)) = \( det Q \)^(1 \/ 2) e^(- n \( z - 1 \) \/ 2) S \( a \) \,
     $ <eq:spherical-radial-ratio>]
  where $p_(z \, a)$ is the density of $parallel Y^(z \, a) parallel^2$.
    This identity is a polar-coordinate identity between continuous radial densities at a positive radius.
    At $z = z_a$, its rearrangement is (4.3). The same density ratio, with the radius fixed,
    proves the assertion about the conditional law. ◻
]

We will repeatedly use the two-square smoothing calculation also appearing in
  #cite(label("BobkovNaumovUlyanov2021")) Eq. (7). If $G \, H$ are independent standard Gaussians and $d \,
  e > 0$, then the density $r_(d \, e)$ of $d G^2 + e H^2$ satisfies

#[#set math.equation(numbering: n => "(4.5)")
 $ r_(d \, e) \( t \) & = frac(1, 2 pi sqrt(d e)) integral_0^t e^(- x \/ \( 2 d \) - \( t - x \) \/ \( 2 e \)) /
   sqrt(x \( t - x \)) thin d x\
 & lt.eq frac(1, 2 sqrt(d e)) \, wide t > 0 . $ <eq:two-square-density>]

The integral of $\[ x \( t - x \) \]^(- 1 \/ 2)$ over $\( 0 \, t \)$ is $pi$.
  Convolving with further independent random variables preserves this upper bound.

The next estimate is required at the mean of the weighted sum, including arrays with a dominant weight.
  The Fourier majorant in its proof is the weighted-square estimate of Bobkov, Naumov,
  and Ulyanov #cite(label("BobkovNaumovUlyanov2021")) Lemma 3, which we reproduce.
  The compactness argument has the classical Gaussian-plus-quadratic limiting structure described by Nourdin and
  Poly #cite(label("NourdinPoly2012SecondChaos")) Theorem 3.1;
  we give the needed positive-weight argument directly. Their erratum #cite(label("NourdinPoly2012Erratum"))
  concerns separate finite-cumulant statements.

#thm([Lemma 4.2.])[
  (Density at the mean).  #emph[There is a universal constant $c > 0$ such that, for every $n gt.eq
    3$ and every $k_1 \, dots.h \, k_n > 0$ with $sum_i k_i = n$, the density $p$ of $sum_i k_i G_i^2$,
    for independent standard Gaussians $G_i$, satisfies
#[#set math.equation(numbering: n => "(4.6)")
 $ p \( n \) gt.eq c (sum_i k_i^2)^(- 1 \/ 2) . $ <eq:mean-density>]

]
] <lem:mean-density>

#proof[
  After normalization, it is enough to exclude a sequence of densities vanishing at zero.
    There are two ways such a sequence of weights can behave:
    all weights vanish individually, giving a Gaussian limit,
    or a positive largest weight remains and supplies a density bounded below near zero.
    The proof treats these cases separately.
  Set $tau = \( sum_i k_i^2 \)^(1 \/ 2)$ and $d_i = k_i \/ tau$. The centered random variable
  $ T_d = sum_i d_i \( G_i^2 - 1 \) = frac(sum_i k_i G_i^2 - n, tau) $
  has density $f_d$ with $f_d \( 0 \) = tau p \( n \)$, and $sum_i d_i^2 = 1$.
    Thus it suffices to bound $f_d \( 0 \)$ below uniformly over all such finite arrays.
    Each array has at least three positive weights. Its characteristic function is integrable,
    since its absolute value decays as $O \( \| t \|^(- n \/ 2) \)$ at infinity;
    we always take the resulting continuous version of its density.
  Suppose, to the contrary, that arrays $d^(\( r \))$ satisfy $f_(d^(\( r \))) \( 0 \) arrow.r 0$.
    Sort each array in nonincreasing order and extend it by zeros.
    A diagonal subsequence has $d_i^(\( r \)) arrow.r c_i$ for every $i$, with $sum_i c_i^2 lt.eq 1$.
    We consider the two possible values of $c_1$.
  #emph[Case $c_1 = 0$.] For $d gt.eq 0$, define
  $ psi_d \( t \) = bb(E) e^(i t d \( G^2 - 1 \)) = e^(- i t d) \( 1 - 2 i t d \)^(- 1 \/ 2) . $
  For logarithms of characteristic functions, use the continuous branch equal to zero at $t = 0$.
    For fixed $t$ and $\| t d \|$ small, expansion gives
  $ log psi_d \( t \) = - t^2 d^2 + O \( \| t \|^3 d^3 \) . $
  It follows that the characteristic function $phi.alt_r \( t \) =
    product_i psi_(d_i^(\( r \))) \( t \)$ converges pointwise to $e^(- t^2)$,
    because $sum_i \( d_i^(\( r \)) \)^3 lt.eq d_1^(\( r \)) sum_i \( d_i^(\( r \)) \)^2 = d_1^(\( r \))$.
  Weak convergence alone does not control a density at one point.
    To pass through Fourier inversion we need an integrable bound uniform in $r$.
    Concavity of $log \( 1 + x \)$ and $sum_i \( d_i^(\( r \)) \)^2 = 1$ give
  $ \| phi.alt_r \( t \) \| = product_i #scale(x: 120%, y: 120%)[\(] 1 +
    4 \( d_i^(\( r \)) \)^2 t^2 #scale(x: 120%, y: 120%)[\)]^(- 1 \/ 4) lt.eq #scale(x: 120%, y: 120%)[\(] 1 +
    4 \( d_1^(\( r \)) \)^2 t^2 #scale(x: 120%, y: 120%)[\)]^(- 1 \/ \( 4 \( d_1^(\( r \)) \)^2 \)) . $
  The function $x mapsto log \( 1 + A x \) \/ x$ is decreasing for $A gt.eq 0$.
    Once $\( d_1^(\( r \)) \)^2 lt.eq 1 \/ 8$, the last expression is at most $\( 1 + t^2 \/ 2 \)^(- 2)$.
    Fourier inversion and dominated convergence imply
  $ f_(d^(\( r \))) \( 0 \) = frac(1, 2 pi) integral_(bb(R)) phi.alt_r \( t \) thin d t arrow.r
    frac(1, 2 pi) integral_(bb(R)) e^(- t^2) thin d t = frac(1, 2 sqrt(pi)) \, $
  a contradiction.
  #emph[Case $c_1 > 0$.] Remove the largest coordinate and write
  $ R_r = sum_(i gt.eq 2) d_i^(\( r \)) \( G_i^2 - 1 \) . $
  We claim that $R_r$ converges in distribution to
  #[#set math.equation(numbering: n => "(4.7)")
   $ R = sum_(i gt.eq 2) c_i \( G_i^2 - 1 \) + Z \, wide Z tilde.op N (0 \, thin 2 (1 - sum_(i gt.eq 1) c_i^2)) \,
     $ <eq:density-residual-limit>]
  where $Z$ and the displayed Gaussians are independent. The series converges in $L^2$,
    since the tail beyond $m$ has variance $2 sum_(i > m) c_i^2 arrow.r 0$.
    To identify the limit, note that the sorted weights satisfy $d_(m + 1)^(\( r \))
    lt.eq \( m + 1 \)^(- 1 \/ 2)$. For fixed $t$ and sufficiently large $m$,
    the same logarithmic expansion as above gives, uniformly in $r$,
  $ log bb(E) e^(i t R_r) = sum_(i = 2)^m log psi_(d_i^(\( r \))) \( t \) -
    t^2 (1 - sum_(i = 1)^m \( d_i^(\( r \)) \)^2) + O (frac(\| t \|^3, sqrt(m + 1))) . $
  First let $r arrow.r oo$ and then $m arrow.r oo$. The resulting characteristic function is exactly that of
    (4.7), which proves the claim.
  The residual limit has positive mass arbitrarily close to zero.
    This is the fact that allows the surviving largest coordinate to control the convolution density.
    For any $delta > 0$, choose a finite truncation of its series whose remaining tail variance is less than
    $delta^2 \/ 16$. Each nonzero summand in the finite part has a density positive near zero,
    so the finite part together with $Z$ has positive probability in $\( - delta \/ 2 \, delta \/ 2 \)$.
    Zero summands or a degenerate $Z$ cause no difficulty. The independent tail has positive probability in the
    same interval by Chebyshev’s inequality. Intersecting these events proves the assertion.
    This argument uses square summability of $\( c_i \)$, not summability.
  In particular, by convergence in distribution and the open-set inequality,
  $ liminf_(r arrow.r oo) bb(P) { \| R_r \| < c_1 \/ 3 } gt.eq bb(P) { \| R \| < c_1 \/ 3 } > 0 . $
  The density of $d \( G^2 - 1 \)$, for $d > 0$, is
  $ g_d \( x \) = e^(- \( x + d \) \/ \( 2 d \)) / sqrt(2 pi d \( x + d \)) thin upright(bold(1))_({ x > - d }) . $
  For $d$ in a sufficiently small neighborhood of $c_1$, this density is bounded below by a positive constant
    depending on $c_1$ whenever $\| x \| lt.eq c_1 \/ 3$. This interval stays strictly inside its support.
  Independence now yields the pointwise convolution identity
  $ f_(d^(\( r \))) \( 0 \) = bb(E) #scale(x: 120%, y: 120%)[\[] g_(d_1^(\( r \))) \( - R_r \)
    #scale(x: 120%, y: 120%)[\]] . $
  To justify it at this particular point, rather than only almost everywhere,
    the residual $R_r$ has a bounded density by (4.5), using two of its positive coordinates.
    Convolution of that bounded density with the $L^1$ function $g_(d_1^(\( r \)))$ is continuous:
    its change under translation by $h$ is bounded by the residual density supremum times $parallel
    g_(d_1^(\( r \))) \( thin dot.op + h \) - g_(d_1^(\( r \))) parallel_(L^1)$, which tends to zero.
    It therefore equals the continuous density $f_(d^(\( r \)))$ everywhere. Consequently
  $ liminf_(r arrow.r oo) f_(d^(\( r \))) \( 0 \) gt.eq c \( c_1 \) liminf_(r arrow.r oo) bb(P) { \| R_r \| <
    c_1 \/ 3 } > 0 \, $
  again a contradiction. The constant may depend on the subsequential limit:
    any positive liminf contradicts the chosen sequence tending to zero.
    The two cases prove a universal lower bound and hence (4.6). ◻
]

We now use the radial estimates to compare $S \( a \)$ with $e^(n B \( a \))$.
  The orientation argument also fixes one sphere vector and integrates a second over its orthogonal hyperplane.
  For that step, we need the same upper comparison on every such hyperplane.

#thm([Lemma 4.3.])[
  (Partition bounds on the sphere and hyperplanes).  #emph[There are universal constants $c \, C > 0$ such that,
    for every $n gt.eq 3$, every ordered spectrum $lambda_1 gt.eq dots.h.c gt.eq
    lambda_n$ satisfying $max_i \| lambda_i \| lt.eq 3$, and every $a in \[ 0 \, 2 \]$,
$ c n^(- 1 \/ 2) e^(n B \( a \)) lt.eq S \( a \) lt.eq C n^(1 \/ 2) e^(n B \( a \)) . $

 If $H subset bb(R)^n$ is any subspace of dimension $n - 1$,
   and $sigma_(n \, H)$ is uniform probability on ${ u in H : parallel u parallel^2 = n }$, then
$ S_H \( a \) := integral e^(a u^T Lambda u \/ 2) thin sigma_(n \, H) \( d u \) lt.eq C n^(1 \/ 2) e^(n B \( a \)) . $

 The same constant $C$ works for all $H$ and all $a in \[ 0 \, 2 \]$.]
] <lem:partition-bounds>

#proof[
  For the full sphere, the radial identity and the density-at-the-mean lemma give both bounds.
    For a hyperplane, only an upper density bound is needed; interlacing allows us to use the full-space saddle
    without asserting it is a saddle for the compression.
  The chi-square density is
  $ p_(chi_m^2) \( r \) = frac(r^(m \/ 2 - 1) e^(- r \/ 2), 2^(m \/ 2) Gamma \( m \/ 2 \)) \, wide r > 0 . $
  Stirling’s formula gives
  $ c n^(- 1 \/ 2) lt.eq p_(chi_m^2) \( n \) lt.eq C n^(- 1 \/ 2) quad upright("for ") m = n upright(" or ") m =
    n - 1 \, quad n gt.eq 3 \; $
  the constants absorb the finitely many small dimensions. By Lemma 10 and $#scale(x: 120%, y: 120%)[\(] sum_i
    k_i \( a \)^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq sum_i k_i \( a \) = n$, we have $p_a \( n \) gt.eq
    c \/ n$. By (4.5) and $k_i \( a \) gt.eq 1 \/ 13$, we also have $sup_r p_a \( r \) lt.eq C$.
    Lemma 9 proves the two full-space bounds.
  We now pass to a hyperplane. Let $Lambda_H$ denote the compression of $Lambda$ to $H$,
    and write its eigenvalues as $theta_1 gt.eq dots.h.c gt.eq theta_(n - 1)$.
    The min–max principle gives $lambda_i gt.eq theta_i gt.eq lambda_(i + 1)$.
    At the full-space minimizer $z = z_a$, the matrix $Q_H = z_a I_H - a Lambda_H$ is positive definite.
    Since $a gt.eq 0$, interlacing gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( det Q_H \)^(- 1 \/ 2) & lt.eq product_(i = 1)^(n - 1) \( z_a - a lambda_i \)^(- 1 \/ 2)\
 & = (product_(i = 1)^n \( z_a - a lambda_i \)^(- 1 \/ 2)) sqrt(z_a - a lambda_n) .
   $ <eq:spherical-compression-determinant>]
  The last square root is at most $sqrt(13)$.
  Let $p_(H \, a)$ be the squared-norm density of a Gaussian on $H$ with covariance $Q_H^(- 1)$.
    The same polar-coordinate calculation as in (4.4), now in dimension $n - 1$ but still at squared radius $n$, yields
  $ S_H \( a \) = e^(n \( z_a - 1 \) \/ 2) \( det Q_H \)^(- 1 \/ 2)
    frac(p_(H \, a) \( n \), p_(chi_(n - 1)^2) \( n \)) . $
  Every eigenvalue of $Q_H$ is at most $z_a - a lambda_n lt.eq 13$,
    so all its Gaussian variances are at least $1 \/ 13$. There are at least two of them,
    and (4.5) gives $p_(H \, a) \( n \) lt.eq C$. Combining this bound with (4.8) proves the assertion.
    Only an upper density bound is used: the compressed Gaussian need not have mean squared radius $n$,
    and $z_a$ need not minimize its own variational problem. ◻
]

=== 4.2 Critical projections and overlap <critical-projections-and-overlap>

The preceding bounds require only a bounded deterministic spectrum.
  We now impose Proposition 5 to obtain the critical projection and squared-overlap estimates used in Section 5.
  Fix any deterministic $L_n arrow.r oo$ with $L_n lt.eq log n$, put $s_0 = L_n n^(- 2 \/ 3)$,
  and take spectra in that proposition’s good event. All statements below hold for all sufficiently large $n$,
  uniformly over these spectra. At $a = 1$, abbreviate

$ k_i = k_i \( 1 \) \, wide Y_i tilde.op N \( 0 \, k_i \) med upright("independently") \, wide p = p_1 . $

For each $i$, let $p_(- i)$ be the density of $sum_(j eq.not i) Y_j^2$.

#thm([Lemma 4.4.])[
  (Gaussian parameters at criticality).  #emph[With the preceding notation,
#[#set math.equation(numbering: n => "(4.9)")
 $ lambda_1 < z_1 < 2 + s_0 \, wide (sum_i k_i^2)^(1 \/ 2) lt.eq C n sqrt(s_0) \, wide k_j gt.eq
   c \/ s_0 quad \( 1 lt.eq j lt.eq 3 \) . $ <eq:critical-spherical-parameters>]

 Moreover,
$ p \( n \) gt.eq frac(c, n sqrt(s_0)) \, wide sup_(r in bb(R)) p_(- i) \( r \) lt.eq
  C s_0 quad \( 1 lt.eq i lt.eq n \) . $

]
] <lem:critical-sphere>

#proof[
  We compare the exact saddle with the explicit point $2 + s_0$.
    The first trace locates the saddle and controls the total increase in variances when moving to it;
    the second trace bounds the variances at the explicit point.
    Set $h_i = \( 2 + s_0 - lambda_i \)^(- 1)$, whose denominators are positive by the edge estimates.
    Since $R \( s \) = 1 - sqrt(s) + O \( s \)$ as $s arrow.b 0$, Proposition 5 gives, uniformly over the good spectra,
  $ sum_i h_i = n #scale(x: 120%, y: 120%)[\(] 1 - sqrt(s_0) + o \( sqrt(s_0) \) #scale(x: 120%, y: 120%)[\)] < n . $
  The function $z mapsto sum_i \( z - lambda_i \)^(- 1)$ is strictly decreasing from infinity on
    $\( lambda_1 \, oo \)$. Its value at $z_1$ is $n$; hence $lambda_1 < z_1 < 2 + s_0$ and $k_i gt.eq h_i$.
    Because $sum_i k_i = n$, the total increase is exactly
  $ sum_i \( k_i - h_i \) = n - sum_i h_i = n sqrt(s_0) #scale(x: 120%, y: 120%)[\(] 1 +
    o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  A nonnegative vector has Euclidean norm at most the sum of its coordinates.
    The triangle inequality and the second resolvent bound therefore give
  $ (sum_i k_i^2)^(1 \/ 2) & lt.eq (sum_i h_i^2)^(1 \/ 2) + sum_i \( k_i - h_i \)\
 & lt.eq C sqrt(n) thin s_0^(- 1 \/ 4) + C n sqrt(s_0) lt.eq C n sqrt(s_0) . $
  For the last step, $n^(- 1 \/ 2) s_0^(- 3 \/ 4) = L_n^(- 3 \/ 4) arrow.r 0$.
    For $j lt.eq 3$, the edge estimates also give
  $ 0 < z_1 - lambda_j lt.eq 2 + s_0 - lambda_j lt.eq C s_0 \, $
  which proves the lower bounds on the first three variances.
    Lemma 10 now gives the asserted lower bound on $p \( n \)$.
  The three leading variances are needed for a uniform deletion estimate:
    after deleting any one index $i$, at least two of the indices $1 \, 2 \, 3$ remain.
    Applying (4.5) to their squares, and then convolving with the other squares,
    yields $sup_r p_(- i) \( r \) lt.eq C s_0$. ◻
]

#thm([Proposition 4.5.])[
  (Small coordinate projections on the tilted sphere).  #emph[For every $b > 0$, the preceding good spectra satisfy
#[#set math.equation(numbering: n => "(4.10)")
 $ sigma_Lambda { \| u_1 \| lt.eq b n^(1 \/ 3) } lt.eq C L_n^2 b . $ <eq:spherical-small-ball>]

 In particular, given any positive deterministic $b_n arrow.r 0$, one can choose $L_n arrow.r oo$ with $L_n lt.eq
   log n$ and $L_n^2 b_n arrow.r 0$, so that the probability in (4.10) tends to zero uniformly over the resulting
   good spectra.]
] <prop:spherical-small-ball>

#proof[
  Conditioning a single coordinate makes the role of the radial estimates transparent.
    Its unconditioned Gaussian mass is small, and the ratio of the residual radial density to the full radial
    density quantifies the cost of conditioning. Let $phi_k$ be the density of $N \( 0 \, k \)$.
    Lemma 9 gives, for $T > 0$,
  $ sigma_Lambda { \| u_1 \| lt.eq T } & = frac(1, p \( n \)) integral_(\| y \| lt.eq T) phi_(k_1) \( y \)
    p_(- 1) \( n - y^2 \) thin d y\
 & lt.eq frac(C s_0, p \( n \)) thin bb(P) { \| Y_1 \| lt.eq T } . $
  The densities of the nonnegative residual sums are taken to be zero at negative arguments.
    By Lemma 12 and the Gaussian density bound,
  $ frac(C s_0, p \( n \)) lt.eq C n s_0^(3 \/ 2) \, wide bb(P) { \| Y_1 \| lt.eq b n^(1 \/ 3) } lt.eq
    frac(C b n^(1 \/ 3), sqrt(k_1)) lt.eq C b n^(1 \/ 3) sqrt(s_0) = C b sqrt(L_n) . $
  Their product is $C b L_n^2$, proving (4.10). For the final assertion, for example, $L_n = min { log n \,
    b_n^(- 1 \/ 4) }$ for all sufficiently large $n$ has the required properties. ◻
]

#thm([Lemma 4.6.])[
  (Coordinate moments and squared overlap).  #emph[The probability $sigma_Lambda$ has mean zero and diagonal
    covariance in the eigenbasis of $Lambda$. For every coordinate,
#[#set math.equation(numbering: n => "(4.11)")
 $ integral u_i^2 thin sigma_Lambda \( d u \) lt.eq frac(C s_0 k_i, p \( n \)) . $ <eq:spherical-coordinate-moment>]

 Consequently, for independent $U \, V$ with law $sigma_Lambda$,
#[#set math.equation(numbering: n => "(4.12)")
 $ bb(E) (frac(U^T V, n))^2 lt.eq frac(C s_0^2, n^2 p \( n \)^2) sum_i k_i^2 lt.eq
   C n^(- 2 \/ 3) L_n^4 . $ <eq:spherical-overlap>]

]
] <lem:spherical-covariance>

#proof[
  We reuse the same one-coordinate conditioning, now with the weight $y^2$.
    First, the defining density of $sigma_Lambda$ is unchanged by changing the sign of any individual coordinate.
    This proves the assertions about its mean and off-diagonal covariances.
    Conditioning as in the preceding proof, now with the nonnegative integrand $y^2$, gives
  $ integral u_i^2 thin sigma_Lambda \( d u \) = frac(1, p \( n \)) integral_(bb(R)) y^2 phi_(k_i) \( y \)
    p_(- i) \( n - y^2 \) thin d y lt.eq frac(C s_0, p \( n \)) thin bb(E) Y_i^2 = frac(C s_0 k_i, p \( n \)) . $
  Write $m_i = integral u_i^2 thin sigma_Lambda \( d u \)$. Independence of $U \, V$ and diagonality give
  $ bb(E) (frac(U^T V, n))^2 = 1 / n^2 sum_i m_i^2 lt.eq frac(C s_0^2, n^2 p \( n \)^2) sum_i k_i^2 . $
  Lemma 10 bounds $p \( n \)^(- 2)$ by $C sum_i k_i^2$, and Lemma 12 bounds the latter sum by $C n^2 s_0$.
    The resulting upper bound is $C n^2 s_0^4 = C n^(- 2 \/ 3) L_n^4$, as claimed. ◻
]

== 5 Transfer from the sphere to the cube <sec:orientation>

We now transfer the spherical conclusions to the Ising cube.
  Conditional on the spectrum, GOE eigenvectors are Haar oriented.
  Averaging over that orientation turns a single cube point into a uniform sphere point.
  To use this first-moment identity for normalized Gibbs probabilities,
  we must also control the random Ising partition sum. A relative second-moment estimate supplies that control and
  then transfers both small projections and the squared overlap.

The first-moment Haar-averaging identity is the fixed-spectrum spherical comparison of Comets
  #cite(label("comets1996")) Equations (2.1)–(2.2). The fixed-spectrum Haar second-moment setup and its
  two-replica reduction have antecedents in Bhattacharya and Sen #cite(label("bhattacharyaSen2016"))
  Section 3.2.1. Du and Huang #cite(label("duHuang2026FreeEnergy")) Theorem 1.6 prove an unconditional shared-GOE
  mean-square partition-ratio error of order $O \( n^(- 1 \/ 3) \)$ at criticality.
  Here we prove the conditional comparison uniformly on the particular spectral events of Section 3.
  The central lattice comparison uses outward bins and monotonicity;
  it needs no derivative bound for the reweighted pair integral.

Throughout this section, let $L_n arrow.r oo$ with $L_n lt.eq log n$ and $s_0 = L_n n^(- 2 \/ 3)$.
  Write $cal(G)_n$ for the eigenvalue-only good event in Proposition 5.
  We initially fix a deterministic sequence of spectra in these events and use the notation $Lambda =
  "diag" \( lambda_1 \, dots.h \, lambda_n \)$, $S \( a \)$, $B \( a \)$, $z_a$,
  and $sigma_Lambda$ from Section 4. The error bounds supplied by Proposition 5 are deterministic on $cal(G)_n$
  and hold there for every fixed finite upper resolvent parameter.

=== 5.1 Haar averaging and the two overlap laws <haar-averaging-and-the-two-overlap-laws>

Let $O$ be Haar distributed on the orthogonal group, independent of the ordered spectrum, and put $W =
  O Lambda O^T$. Orthogonal invariance of GOE justifies this representation:
  Haar averaging a test function of a symmetric matrix depends only on its eigenvalues,
  and gives the invariant probability measure on their conjugacy orbit.
  We write $bb(E)_O$ and $bb(P)_O$ for expectation and probability over $O$ with $Lambda$ fixed. Define

#[#set math.equation(numbering: n => "(5.1)")
 $ I = 2^(- n) sum_(x in { - 1 \, 1 }^n) exp #h(-0.16667em) (frac(x^T O Lambda O^T x, 2)) .
   $ <eq:orientation-ising-partition>]

For every fixed cube point $x$, the vector $O^T x$ is uniform on the sphere of radius $sqrt(n)$.
  Averaging each summand therefore gives the exact first-moment identity

$ bb(E)_O I = S \( 1 \) . $

To control the normalization of the Gibbs law, we will compare the second moment of $I$ with $S \( 1 \)^2$.
  Both quantities can be expressed using the same pair integral; only their overlap laws differ.

Let

$ cal(Q)_n = { - 1 + 2 j \/ n : 0 lt.eq j lt.eq n } \, wide p_I \( q \) =
  2^(- n) binom(n, n \( 1 + q \) \/ 2) quad \( q in cal(Q)_n \) . $

This is the overlap law of two independent uniform cube points.

Let $\( U \, V \)$ be a uniformly oriented orthogonal pair, each vector having norm $sqrt(n)$, and define, for $-
  1 lt.eq q lt.eq 1$,

#[#set math.equation(numbering: n => "(5.2)")
 $ M \( q \) = bb(E) exp #h(-0.16667em) (frac(\( 1 + q \) U^T Lambda U + \( 1 - q \) V^T Lambda V, 2)) .
   $ <eq:orientation-pair-moment>]

If cube points $x \, y$ have overlap $q in \( - 1 \, 1 \)$, their normalized sum and difference

$ frac(x + y, sqrt(2 \( 1 + q \))) \, wide frac(x - y, sqrt(2 \( 1 - q \))) $

are orthogonal and both have norm $sqrt(n)$. Rotating them by $O^T$ gives the pair in (5.2).
  At $q = 1$ or $q = - 1$, the points satisfy $y = x$ or $y = - x$, respectively,
  and the combined energy is $x^T W x$; accordingly $M \( 1 \) = M \( - 1 \) = S \( 2 \)$.
  Thus the second-moment identity holds at every lattice point:

#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E)_O I^2 = sum_(q in cal(Q)_n) p_I \( q \) M \( q \) . $ <eq:orientation-second-moment>]

The exchangeability of $U \, V$ shows that $M$ is even and nondecreasing in $\| q \|$.
  More explicitly, if $A = U^T Lambda U$ and $D = V^T Lambda V$, then

$ M \( q \) = bb(E) #h(-0.16667em) [e^(\( A + D \) \/ 2) cosh #h(-0.16667em) (frac(q \( A - D \), 2))] \, $

whose integrand is nondecreasing in $\| q \|$.

For two independent uniform sphere points the overlap has density

$ f_S \( q \) = c_n \( 1 - q^2 \)^(\( n - 3 \) \/ 2) \, wide c_n =
  frac(Gamma \( n \/ 2 \), sqrt(pi) thin Gamma \( \( n - 1 \) \/ 2 \)) quad \( - 1 < q < 1 \) . $

To see this, fix the first point by rotation and integrate the remaining $n - 1$ coordinates of the second point;
  the resulting one-coordinate density is proportional to $\( 1 - q^2 \)^(\( n - 3 \) \/ 2)$,
  with the displayed normalization given by the beta integral.
  Conditional on this overlap, the normalized sum and difference are again the orthogonal pair above.
  Independence of the two spherical points consequently gives the exact identity

#[#set math.equation(numbering: n => "(5.4)")
 $ integral_(- 1)^1 M \( q \) f_S \( q \) thin d q = S \( 1 \)^2 . $ <eq:orientation-spherical-second-moment>]

The moment identities reduce concentration to a comparison of the two overlap laws.
  Because $bb(E)_O I = S \( 1 \)$, it is enough to prove

$ sum_(q in cal(Q)_n) p_I \( q \) M \( q \) lt.eq \( 1 + o \( 1 \) \) integral_(- 1)^1 M \( q \) f_S \( q \) thin d q $

with a deterministic $o \( 1 \)$ uniform over $cal(G)_n$.
  We will use a variational estimate for large overlaps and a direct comparison of the unweighted overlap laws
  near zero.

First consider the size of the pair integral. By evenness it suffices to take $q gt.eq 0$.
  Conditional on $U$ in (5.2), the vector $V$ is uniform on the radius-$sqrt(n)$ sphere in $U^perp$.
  The codimension-one bound of Lemma 11 controls its integral at parameter $1 - q$, uniformly in $U$.
  The full-space bound then controls the remaining integral at parameter $1 + q$.
  Dividing by the lower bound for $S \( 1 \)^2$ from the same lemma gives

#[#set math.equation(numbering: n => "(5.5)")
 $ frac(M \( q \), S \( 1 \)^2) lt.eq C n^2 exp #h(-0.16667em)
   (n #scale(x: 120%, y: 120%)[\[] B \( 1 + \| q \| \) + B \( 1 - \| q \| \) - 2 B \( 1 \)
   #scale(x: 120%, y: 120%)[\]]) . $ <eq:orientation-pair-bound>]

This remains valid at $\| q \| = 1$, since the integral with parameter zero equals one.

The cube overlap mass satisfies $p_I \( q \) lt.eq e^(- n q^2 \/ 2)$.
  Indeed, for a mean of $n$ independent uniform signs, the exponential moment bound $cosh t lt.eq
  e^(t^2 \/ 2)$ follows by integrating $\( log cosh t \)'' lt.eq 1$ twice from zero.
  Optimizing the resulting Chernoff bound and using symmetry gives the stated bound on each lattice mass.
  Thus a margin below $q^2 \/ 2$ in the exponent of (5.5) will suppress large overlaps.

We split the overlap range at

$ q_0 = n^(- 7 \/ 24) . $

The proof uses three scale relations:

$ n q_0^3 = n^(1 \/ 8) arrow.r oo \, wide n q_0^4 = n^(- 1 \/ 6) arrow.r 0 \, wide s_0 / q_0^2 =
  L_n n^(- 1 \/ 12) arrow.r 0 . $

The first turns a cubic variational margin into a negligible tail.
  The second permits a relative local comparison of the unweighted cube and sphere overlap laws.
  The third absorbs the spectral error in the cubic estimate; it uses $L_n lt.eq log n$.

=== 5.2 The variational deficit <the-variational-deficit>

The next lemma supplies the margin needed in (5.5) for $\| q \| gt.eq q_0$.

#thm([Lemma 5.1.])[
  (Cubic deficit).  #emph[There is a universal constant $c > 0$ such that, for all sufficiently large $n$,
    uniformly for spectra in $cal(G)_n$ and $q_0 lt.eq q lt.eq 1$,
#[#set math.equation(numbering: n => "(5.6)")
 $ B \( 1 + q \) + B \( 1 - q \) - 2 B \( 1 \) lt.eq q^2 / 2 - c q^3 . $ <eq:cubic-deficit>]

 One may take $c = 1 \/ 24$.]
] <lem:cubic-deficit>

#proof[
  We estimate the derivative of the spherical variational value on both sides of the critical parameter $a = 1$.
    Close to that parameter the resolvent estimates give a quantitative margin;
    away from it a bounded-convergence argument suffices. The saddle equation in Lemma 9 and implicit
    differentiation show that $z_a$ is continuously differentiable in $a$.
    Differentiating the objective at its minimizer gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ B' \( a \) = frac(1, 2 n) sum_(i = 1)^n frac(lambda_i, z_a - a lambda_i) \, wide B' \( a \) =
     frac(z_a - 1, 2 a) quad \( a > 0 \) . $ <eq:orientation-saddle-derivative>]
  The first identity also holds at $a = 0$, with a one-sided derivative at the endpoint.
    Since the positive weights $\( z_a - a lambda_i \)^(- 1)$ sum to $n$,
  $ \| B' \( a \) \| lt.eq 1 / 2 max_i \| lambda_i \| lt.eq 3 / 2 wide \( 0 lt.eq a lt.eq 2 \) . $
  For $a > 0$, put $r_a = z_a \/ a$ and
  $ m_n \( s \) = 1 / n sum_i \( 2 + s - lambda_i \)^(- 1) . $
  The saddle equation is equivalently
  $ 1 / n sum_i \( r_a - lambda_i \)^(- 1) = a . $
  At $s = s_0$, the spectral estimates give $m_n \( s_0 \) = 1 - sqrt(s_0) + o \( sqrt(s_0) \) < 1$.
    Thus, for $a = 1 + u$ with $0 lt.eq u lt.eq 1$, monotonicity of this resolvent gives $r_a < 2 + s_0$ and hence
  #[#set math.equation(numbering: n => "(5.8)")
   $ B' \( 1 + u \) lt.eq frac(1 + u, 2) - frac(u^2, 2 \( 1 + u \)) + s_0 /
     2 . $ <eq:orientation-supercritical-derivative>]
  The upper derivative estimate must be paired with a lower estimate below $a = 1$.
    The small-overlap range requires the following quantitative comparison.
    If $4 sqrt(s_0) lt.eq u lt.eq 1 \/ 4$, set $t = u^2 \/ \( 1 - u \)$.
    Then $t lt.eq 1 \/ 12$ and $0.9 t gt.eq 14.4 s_0$. The function $R$ from Proposition 5 satisfies
  $ R \( t \) = 1 - u \, wide - R' \( s \) = frac(2 + s, 2 sqrt(s \( 4 + s \))) - 1 / 2 gt.eq c_1 /
    sqrt(s) quad \( 0 < s lt.eq 1 \/ 12 \) $
  for a universal $c_1 > 0$. Integrating the last bound from $0.9 t$ to $t$ therefore gives
  $ R \( 0.9 t \) - \( 1 - u \) gt.eq c_2 sqrt(t) gt.eq c_2 u . $
  The error in $m_n \( 0.9 t \) = R \( 0.9 t \) + o \( sqrt(t) \)$ is uniform over the indicated range.
    It is smaller than this fixed positive margin for all sufficiently large $n$.
    Consequently $m_n \( 0.9 t \) > 1 - u$, so monotonicity implies $r_(1 - u) gt.eq 2 + 0.9 t$.
    Substitution in (5.7) yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ B' \( 1 - u \) gt.eq frac(1 - u, 2) - frac(u^2, 20 \( 1 - u \)) wide \( 4 sqrt(s_0) lt.eq u lt.eq 1 \/ 4 \) .
     $ <eq:orientation-subcritical-derivative>]
  For $0 lt.eq u lt.eq 4 sqrt(s_0)$, use instead $r_(1 - u) > lambda_1 = 2 + o \( s_0 \)$ to obtain
  $ B' \( 1 - u \) gt.eq frac(1 - u, 2) - frac(u^2, 2 \( 1 - u \)) - o \( s_0 \) gt.eq frac(1 - u, 2) - C s_0 . $
  Write $F \( q \) = B \( 1 + q \) + B \( 1 - q \) - 2 B \( 1 \)$. On $0 lt.eq u lt.eq 1 \/ 4$,
  $ frac(1, 2 \( 1 + u \)) - frac(1, 20 \( 1 - u \)) gt.eq 1 / 3 . $
  Combining the preceding bounds, and absorbing $u^2 lt.eq 16 s_0$ on the short interval $u lt.eq
    4 sqrt(s_0)$ into the error, gives
  $ F' \( u \) lt.eq u - u^2 / 3 + C s_0 wide \( 0 lt.eq u lt.eq 1 \/ 4 \) . $
  Since $F \( 0 \) = 0$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ F \( q \) lt.eq q^2 / 2 - q^3 / 9 + C s_0 q wide \( 0 lt.eq q lt.eq 1 \/ 4 \) .
     $ <eq:orientation-small-overlap-deficit>]
  For $q gt.eq q_0$, the last error divided by $q^3$ is at most
  $ C s_0 / q_0^2 = C L_n n^(- 1 \/ 12) arrow.r 0 . $
  Thus (5.6) holds on $\[ q_0 \, 1 \/ 4 \]$, even with $c = 1 \/ 18$.
  It remains to cover overlaps bounded away from zero. Here a uniform additive error tending to zero is enough.
    Fix $a in \( 0 \, 1 \)$. The identity $R \( a + a^(- 1) - 2 \) = a$, the strict monotonicity of $R$,
    and the spectral resolvent estimate imply
  $ r_a arrow.r a + a^(- 1) \, wide B' \( a \) arrow.r a \/ 2 . $
  Indeed, evaluating the empirical resolvent at $a + a^(- 1) plus.minus delta$,
    with $delta > 0$ small enough that the lower point is above $2$,
    traps $r_a$ between these two points for all large $n$. The upper resolvent parameter needed here is finite
    for each fixed $a$. No estimate uniform as $a arrow.b 0$ is used.
  The bound $\| B' \| lt.eq 3 \/ 2$ now gives, by dominated convergence,
  $ rho_n := integral_0^1 \| B' \( a \) - a \/ 2 \| thin d a arrow.r 0 . $
  Integrating (5.8) and bounding the subcritical error by $rho_n$ gives, uniformly for $0 lt.eq q lt.eq 1$,
  #[#set math.equation(numbering: n => "(5.11)")
   $ F \( q \) & lt.eq q^2 / 2 - integral_0^q frac(u^2, 2 \( 1 + u \)) thin d u + rho_n + s_0 / 2\
 & lt.eq q^2 / 2 - q^3 / 12 + rho_n + s_0 / 2 . $ <eq:orientation-macroscopic-deficit>]
  When $q gt.eq 1 \/ 4$, the cubic term is bounded away from zero, so the last two errors are absorbed with $c =
    1 \/ 24$. This also covers $q = 1$.
  The conclusion must hold uniformly over the entire deterministic spectral event.
    The estimates in the shrinking range already have that uniformity. The same is true of $rho_n arrow.r 0$:
    otherwise one could select spectra from $cal(G)_n$ along a violating subsequence.
    Their deterministic spectral bounds would still imply the pointwise convergence and bounded domination just
    proved, a contradiction. Thus the two ranges give the claimed uniform statement. ◻
]

=== 5.3 Concentration over the orientation <concentration-over-the-orientation>

#thm([Proposition 5.2.])[
  (Conditional partition concentration).  #emph[For spectra in $cal(G)_n$,
$ bb(E)_O I = S \( 1 \) \, wide sup_(Lambda in cal(G)_n) bb(E)_O #h(-0.16667em) [(frac(I, S \( 1 \)) - 1)^2]
  arrow.r 0 . $

 In particular, under the GOE law, $I \/ S \( 1 \) arrow.r 1$ in probability.]
] <prop:orientation-concentration>

#proof[
  The first-moment identity was established above. We now bound the exact second moment by treating the two
    overlap regions separately.
  #emph[Large overlaps.] Combining (5.5), the Chernoff bound $p_I \( q \) lt.eq e^(- n q^2 \/ 2)$, and Lemma 15 gives
  $ p_I \( q \) frac(M \( q \), S \( 1 \)^2) lt.eq C n^2 e^(- c n \| q \|^3)
    wide \( q in cal(Q)_n \, med \| q \| gt.eq q_0 \) . $
  There are at most $n + 1$ lattice points. Since $n q_0^3 = n^(1 \/ 8)$,
  #[#set math.equation(numbering: n => "(5.12)")
   $ sum_(q in cal(Q)_n\
\| q \| gt.eq q_0) p_I \( q \) frac(M \( q \), S \( 1 \)^2) lt.eq C n^3 e^(- c n^(1 \/ 8)) = :
  tau_n . $ <eq:orientation-tail>]
  In particular, $tau_n$ is smaller than every fixed negative power of $n$.
  #emph[Central overlaps.] The remaining obstacle is that $M \( q \)$ may vary too rapidly for a derivative-based
    Riemann-sum estimate. We compare the unweighted overlap laws locally, then move each lattice mass outward,
    where $M$ is larger. Let $Delta = 2 \/ n$. Stirling’s formula, uniformly for $\| q \| < q_0$, gives
  $ p_I \( q \) = sqrt(frac(2, pi n \( 1 - q^2 \))) thin e^(- n J \( q \)) #scale(x: 120%, y: 120%)[\(] 1 +
    O \( n^(- 1) \) #scale(x: 120%, y: 120%)[\)] \,\
J \( q \) = frac(\( 1 + q \) log \( 1 + q \) + \( 1 - q \) log \( 1 - q \), 2) . $
  Here $J \( q \) = q^2 \/ 2 + O \( q^4 \)$. Likewise $c_n =
    sqrt(n \/ \( 2 pi \)) \( 1 + O \( n^(- 1) \) \)$ and $log \( 1 - q^2 \) = - q^2 + O \( q^4 \)$.
    Dividing the two expressions shows that
  #[#set math.equation(numbering: n => "(5.13)")
   $ frac(p_I \( q \), Delta f_S \( q \)) = exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(]
     O \( n^(- 1) + q^2 + n q^4 \) #scale(x: 120%, y: 120%)[\)] = 1 + o \( 1 \) \, wide \| q \| < q_0 \,
     $ <eq:orientation-local-density>]
  with a uniform relative error, since $n q_0^4 arrow.r 0$.
  Assign to each retained lattice point the outward bin
  #[#set math.equation(numbering: n => "(5.14)")
   $ cal(B)_q = cases(delim: "{", \[ q \, q + Delta \] \, & q > 0 \,, \, & q < 0 \,, \, & q = 0 .)
     $ <eq:orientation-bins>]
  For even $n$, the lattice near zero is $dots.h \, - 2 Delta \, - Delta \, 0 \, Delta \, 2 Delta \, dots.h$.
    The centered zero bin leaves gaps between $Delta \/ 2$ and $Delta$, and between $- Delta$ and $- Delta \/ 2$.
    For odd $n$, the nearest points are $- Delta \/ 2 \, Delta \/ 2$,
    whose outward bins leave the gap $\( - Delta \/ 2 \, Delta \/ 2 \)$.
    In both cases all bin interiors are disjoint. Every $r in cal(B)_q$ satisfies $\| r \| gt.eq \| q \|$,
    and all these bins lie in $\[ - q_0 - Delta \, q_0 + Delta \] subset \( - 1 \, 1 \)$ for large $n$.
  On each such bin,
  $ lr(|log frac(f_S \( r \), f_S \( q \))|) lt.eq C n \( q_0 + Delta \) Delta lt.eq C \( q_0 + Delta \) \, $
  because $\( log f_S \)' \( r \) = - \( n - 3 \) r \/ \( 1 - r^2 \)$.
    It follows from (5.13) that there is a deterministic $delta_n arrow.r 0$ such that,
    for every nonnegative even function $h$ nondecreasing in $\| q \|$,
  #[#set math.equation(numbering: n => "(5.15)")
   $ p_I \( q \) h \( q \) lt.eq \( 1 + delta_n \) integral_(cal(B)_q) h \( r \) f_S \( r \) thin d r
     wide \( q in cal(Q)_n \, med \| q \| < q_0 \) . $ <eq:orientation-bin-comparison>]
  Indeed, the integral is at least $Delta h \( q \) f_S \( q \) e^(- C \( q_0 + Delta \))$,
    whereas the lattice mass is at most $\( 1 + e_n \) Delta f_S \( q \)$ for a deterministic $e_n arrow.r 0$.
    One can take $1 + delta_n = \( 1 + e_n \) e^(C \( q_0 + Delta \))$.
    This estimate does not depend on how rapidly $h$ varies. The outermost bin may extend beyond $q_0$,
    which causes no difficulty because the comparison integral is over the full interval $\[ - 1 \, 1 \]$.
  #emph[Combining the two regions.] Apply (5.15) with $h = M$.
    Because the bin interiors are disjoint, their sum is bounded by the full spherical integral.
    Together with (5.12) and (5.4), it yields
  $ frac(bb(E)_O I^2, S \( 1 \)^2) lt.eq 1 + delta_n + tau_n . $
  The first-moment identity therefore gives
  #[#set math.equation(numbering: n => "(5.16)")
   $ bb(E)_O #h(-0.16667em) [(frac(I, S \( 1 \)) - 1)^2] lt.eq delta_n + tau_n arrow.r
     0 . $ <eq:orientation-relative-variance>]
  The bin error is independent of the spectrum, and the tail estimate is uniform on $cal(G)_n$ by Lemma 15.
    Thus the relative variance bound is uniform there. The unconditional assertion follows by Chebyshev’s
    inequality and $bb(P) \( cal(G)_n^c \) arrow.r 0$. ◻
]

=== 5.4 Small projections and the squared overlap <small-projections-and-the-squared-overlap>

#thm([Theorem 5.3.])[
  (Small projections in the Ising law).  #emph[Let $W$ be the augmented GOE matrix and let $v$ be a unit top
    eigenvector. For every positive deterministic sequence $b_n arrow.r 0$,
#[#set math.equation(numbering: n => "(5.17)")
 $ mu { x : \| v^T x \| lt.eq b_n n^(1 \/ 3) } arrow.r 0 quad upright("in probability") . $ <eq:static-small-ball>]

 The probability here includes the auxiliary diagonal used to define $v$;
   the Gibbs measure itself does not depend on that diagonal.]
] <thm:static-small-ball>

#proof[
  The restricted partition sum has a small first moment, while the unrestricted sum is close to its spherical
    mean. We choose the auxiliary spectral event after the prescribed threshold $b_n$:
    take $L_n arrow.r oo$ with $L_n lt.eq log n$ and $L_n^2 b_n arrow.r 0$.
    For example, for all sufficiently large $n$ one may take $L_n = min { log n \, b_n^(- 1 \/ 4) }$.
    In the representation $W = O Lambda O^T$, take $v = O e_1$, and define the restricted normalized sum
  $ I_b = 2^(- n) sum_x upright(bold(1))_({ \| v^T x \| lt.eq b_n n^(1 \/ 3) }) e^(x^T W x \/ 2) . $
  For every fixed $x$, $O^T x$ is uniform on the sphere and its first coordinate is $v^T x$.
    Consequently Proposition 13 gives, conditional on any spectrum in $cal(G)_n$,
  #[#set math.equation(numbering: n => "(5.18)")
   $ bb(E)_O frac(I_b, S \( 1 \)) = sigma_Lambda { \| U_1 \| lt.eq b_n n^(1 \/ 3) } lt.eq
     C L_n^2 b_n . $ <eq:orientation-restricted-first-moment>]
  For every fixed $epsilon > 0$, Markov’s inequality and Proposition 16 imply
  $ bb(P)_O #h(-0.16667em) (I_b / I > epsilon) lt.eq bb(P)_O #h(-0.16667em) (frac(I, S \( 1 \)) < 1 / 2) + 2 /
    epsilon bb(E)_O frac(I_b, S \( 1 \)) arrow.r 0 $
  uniformly over the good spectra. The ratio $I_b \/ I$ is the desired Gibbs mass,
    so adding $bb(P) \( cal(G)_n^c \)$ proves the claim. GOE has a simple spectrum almost surely:
    the set of matrices with repeated eigenvalues is the zero set of the nonzero discriminant polynomial and has
    Lebesgue measure zero, whereas GOE has a density. Thus any choice of the unit top eigenvector differs from $O
    e_1$ only by sign, which leaves the asserted event unchanged. ◻
]

#thm([Proposition 5.4.])[
  (Squared overlap).  #emph[Let $Q_n = bb(E)_(mu^(⊗ 2)) q \( x \, y \)^2$.
    Then $n^(2 \/ 3) Q_n$ is bounded in probability. Equivalently,
    for every positive deterministic sequence $T_n arrow.r oo$,
#[#set math.equation(numbering: n => "(5.19)")
 $ bb(P) { n^(2 \/ 3) Q_n > T_n } arrow.r 0 . $ <eq:orientation-overlap-tail>]

 This assertion concerns the original off-diagonal SK disorder.]
] <prop:overlap>

#proof[
  To prove tightness rather than a bound with a fixed logarithmic loss,
    keep $L_n$ free until the tail threshold has been specified.
    The same second-moment comparison works with the nonnegative overlap weight $q^2$.
    Expanding two Gibbs weights gives the exact identity
  #[#set math.equation(numbering: n => "(5.20)")
   $ bb(E)_O #h(-0.16667em) [(frac(I, S \( 1 \)))^2 Q_n] = frac(1, S \( 1 \)^2) sum_(q in cal(Q)_n) p_I \( q \)
     q^2 M \( q \) . $ <eq:orientation-weighted-second-moment>]
  The function $q^2 M \( q \)$ is nonnegative, even, and nondecreasing in $\| q \|$.
    The central terms therefore satisfy the same bin comparison (5.15);
    the tails are at most $tau_n$ because $q^2 lt.eq 1$. Moreover,
  $ frac(1, S \( 1 \)^2) integral_(- 1)^1 q^2 M \( q \) f_S \( q \) thin d q =
    bb(E)_(sigma_Lambda^(⊗ 2)) (frac(U^T V, n))^2 . $
  Here $U \, V$ are independent under the tilted spherical law.
    Lemma 14 bounds this expectation by $C n^(- 2 \/ 3) L_n^4$. Thus (5.20) gives
  #[#set math.equation(numbering: n => "(5.21)")
   $ bb(E)_O #h(-0.16667em) [(frac(I, S \( 1 \)))^2 n^(2 \/ 3) Q_n] lt.eq C L_n^4 + n^(2 \/ 3) tau_n lt.eq
     C' L_n^4 $ <eq:orientation-weighted-bound>]
  for all large $n$, uniformly on $cal(G)_n$.
  The weighted estimate is now available for every admissible $L_n$.
    Given an arbitrary deterministic $T_n arrow.r oo$, choose $L_n = min { log n \,
    T_n^(1 \/ 8) }$ for all sufficiently large $n$. Then $L_n arrow.r oo$ and $L_n^4 \/ T_n lt.eq
    T_n^(- 1 \/ 2) arrow.r 0$. Writing $hat(I) = I \/ S \( 1 \)$, conditional Markov’s inequality gives
  $ bb(P)_O \( n^(2 \/ 3) Q_n > T_n \) lt.eq bb(P)_O \( hat(I) < 1 \/ 2 \) + 4 /
    T_n bb(E)_O \[ hat(I)^(thin 2) n^(2 \/ 3) Q_n \] lt.eq o \( 1 \) + frac(C L_n^4, T_n) . $
  The first error is uniform on $cal(G)_n$ by Proposition 16. Adding $bb(P) \( cal(G)_n^c \) arrow.r 0$ proves (5.19).
  The random variable $n^(2 \/ 3) Q_n$ has one fixed law for each $n$ throughout this argument:
    it is a function of the off-diagonal disorder alone. Changing $L_n$ changes only the auxiliary good event and
    estimates used to prove the assertion, not this law. To verify explicitly that (5.19) implies boundedness in
    probability, suppose tightness failed. Then there would be an $epsilon > 0$ and increasing indices $n_j$ with
  $ bb(P) \( n_j^(2 \/ 3) Q_(n_j) > j \) > epsilon . $
  Define a deterministic staircase by $T_n = j$ for $n_j lt.eq n < n_(j + 1)$,
    with an arbitrary positive initial segment. This sequence tends to infinity and contradicts (5.19) at $n =
    n_j$. Conversely, tightness directly implies (5.19) by comparing a divergent threshold with any fixed
    threshold. Finally, because the Gibbs law is invariant under adding a diagonal to $W$,
    integrating out the auxiliary diagonal preserves the asserted probabilities. ◻
]

#thm([Corollary 5.5.])[
  (Covariance scale).  #emph[For every positive deterministic sequence $M_n arrow.r oo$,
$ bb(P) #h(-0.16667em) {n^(2 \/ 3) / M_n lt.eq parallel Sigma parallel lt.eq M_n n^(2 \/ 3)} arrow.r 1 . $

]
] <cor:covariance-scale>

#proof[
  The upper and lower bounds use different outputs of the transfer:
    squared overlap bounds the covariance norm from above, while the top projection bounds it from below.
    Spin-flip symmetry gives $mu \[ x \] = 0$, so $Sigma = mu \[ x x^T \]$ and
  #[#set math.equation(numbering: n => "(5.22)")
   $ "Tr" Sigma^2 = sum_(i \, j) mu \[ x_i x_j \]^2 = n^2 bb(E)_(mu^(⊗ 2)) q \( x \, y \)^2 =
     n^2 Q_n . $ <eq:orientation-covariance-trace>]
  Since $Sigma$ is positive semidefinite, $parallel Sigma parallel^2 lt.eq "Tr" Sigma^2$.
    The upper bound follows from Proposition 18 with threshold $T_n = M_n^2$.
  For the lower bound use Theorem 17 with $b_n = M_n^(- 1 \/ 4)$ and put $B_n = mu { \| v^T x \| lt.eq
    b_n n^(1 \/ 3) }$. Then $B_n arrow.r 0$ in probability and
  $ parallel Sigma parallel gt.eq v^T Sigma v = mu \[ \( v^T x \)^2 \] gt.eq b_n^2 n^(2 \/ 3) \( 1 - B_n \) . $
  On $B_n lt.eq 1 \/ 2$, for all sufficiently large $n$ this is at least $n^(2 \/ 3) \/ \( 2 sqrt(M_n) \) gt.eq
    n^(2 \/ 3) \/ M_n$. Both bounds hold simultaneously with probability tending to one by a union bound.
    The covariance is unchanged by the auxiliary diagonal, so these probabilities are also those of the original
    SK disorder. ◻
]

== 6 Consequences for heat-bath dynamics <sec:dynamics>

The preceding section provides the static inputs used here.
  A top-eigenvector projection rarely lies near zero, while $Q_n =
  O_(bb(P)) \( n^(- 2 \/ 3) \)$ and the covariance norm has the critical scale.
  A stationary increment estimate converts the projection bound into a sign test for each realized start.
  For linear functions, a cavity comparison uses the squared-overlap bound to control the contribution of sites
  with small average conditional variance, and then compares inverse Rayleigh quotients with the covariance norm.
  Finally, a density comparison with one fixed subcritical temperature proves the subexponential upper bound and
  completes Theorem 3.

=== 6.1 Stationary increments and typical starting configurations <stationary-increments-and-typical-starting-configurations>

#thm([Lemma 6.1.])[
  (Stationary increments).  #emph[Fix the disorder and a function $f : { - 1 \, 1 }^n arrow.r bb(R)$.
    Let $\( X_t \)_(t gt.eq 0)$ be the continuous-time heat-bath chain with generator $cal(L)$,
    and let $\( Y_k \)_(k gt.eq 0)$ be the discrete-time chain with transition operator $P$,
    each started from $mu$. Then
#[#set math.equation(numbering: n => "(6.1)")
 $ bb(E)_mu #scale(x: 120%, y: 120%)[\[] \( f \( X_t \) - f \( X_0 \) \)^2 #scale(x: 120%, y: 120%)[\]] & lt.eq
   2 t thin cal(D)_mu \( f \) \, wide t gt.eq 0 \,\
bb(E)_mu #scale(x: 120%, y: 120%)[\[] \( f \( Y_k \) - f \( Y_0 \) \)^2 #scale(x: 120%, y: 120%)[\]] & lt.eq
  frac(2 k, n) thin cal(D)_mu \( f \) \, wide k in { 0 \, 1 \, 2 \, dots.h } . $ <eq:stationary-increments-ct>]

 Here the expectations average only over the initial configuration and the trajectory.
   In particular, if $g \( x \) = v^T x$ and $parallel v parallel = 1$,
   the two right-hand sides are at most $2 t$ and $2 k \/ n$, respectively.]
] <lem:stationary-increments>

#proof[
  For either clock, reversibility diagonalizes the mean-square increment in the same basis as the Dirichlet form.
    In the inner product $chevron.l f \, h chevron.r_mu = mu \[ f h \]$, stationarity gives
  $ bb(E)_mu #scale(x: 120%, y: 120%)[\[] \( f \( X_t \) - f \( X_0 \) \)^2 #scale(x: 120%, y: 120%)[\]] =
    2 chevron.l f \, \( upright("Id") - e^(t cal(L)) \) f chevron.r_mu . $
  The operator $- cal(L)$ is self-adjoint and nonnegative. Expanding in an orthonormal eigenbasis and using $1 -
    e^(- t lambda) lt.eq t lambda$ gives (6.1), because $chevron.l f \, - cal(L) f chevron.r_mu =
    cal(D)_mu \( f \)$ by Lemma 4.
  Each conditional expectation $P_i$ is an orthogonal projection in $L^2 \( mu \)$.
    Thus $P = n^(- 1) sum_i P_i$ is self-adjoint with spectrum in $\[ 0 \, 1 \]$.
    The discrete stationary increment is $2 chevron.l f \, \( upright("Id") - P^k \) f chevron.r_mu$.
    For $0 lt.eq theta lt.eq 1$, $1 - theta^k lt.eq k \( 1 - theta \)$,
    while $chevron.l f \, \( upright("Id") - P \) f chevron.r_mu = cal(D)_mu \( f \) \/ n$. This proves (6.1).
    Finally, Lemma 4 gives
  $ cal(D)_mu \( v^T x \) = sum_(i = 1)^n v_i^2 mu \[ "Var" \( x_i divides x_(- i) \) \] lt.eq
    sum_(i = 1)^n v_i^2 = 1 . $
  ◻
]

#proof[
  We prove the continuous-time statement in three steps. Choose a projection threshold above its root-mean-square
    increment scale, use its sign as a test for each fixed starting state,
    and average only the resulting intrinsic bad-state indicator.
    This last step will remove the auxiliary diagonal without averaging away the distance being tested.
  Let $t_n = o \( n^(2 \/ 3) \)$ be deterministic and nonnegative.
    Choose a positive deterministic $b_n arrow.r 0$ such that
  $ frac(t_n, b_n^2 n^(2 \/ 3)) arrow.r 0 \; $
  for example, $b_n = \( t_n \/ n^(2 \/ 3) \)^(1 \/ 4) + n^(- 1)$ works. Put $a_n = b_n n^(1 \/ 3)$.
  #emph[A sign that persists.] Separate the auxiliary randomness by writing $W = A + D$,
    where $A$ has zero diagonal and $D$ is the independent Gaussian diagonal.
    The Gibbs law $mu_A = mu_W$ and the heat-bath transition laws depend only on $A$.
    The unit top eigenvector $v = v \( A + D \)$ is allowed to depend on both matrices. Set $g \( x \) = v^T x$.
    Conditional on $A \, D$, start the trajectory from $mu_A$.
    If $\| g \( X_0 \) \| > a_n$, failure of the two endpoint projections to have the same nonzero sign requires
    $\| g \( X_(t_n) \) - g \( X_0 \) \| gt.eq a_n$. Hence Lemma 20 and Markov’s inequality give
  #[#set math.equation(numbering: n => "(6.2)")
   $ bb(P)_(mu_A) #scale(x: 120%, y: 120%)[\(] g \( X_0 \) \,
     g \( X_(t_n) \) upright(" do not have the same nonzero sign") divides A \,
     D #scale(x: 120%, y: 120%)[\)] lt.eq mu_A { \| g \| lt.eq a_n } + frac(2 t_n, a_n^2) . $ <eq:sign-failure>]
  By Theorem 17, the first term tends to zero in probability over $A \, D$.
    It also tends to zero in expectation, since it lies in $\[ 0 \, 1 \]$. Therefore the deterministic quantity
  #[#set math.equation(numbering: n => "(6.3)")
   $ epsilon_n := bb(E)_(A \, D) mu_A { \| g \| lt.eq a_n } + frac(2 t_n, a_n^2) arrow.r 0 $ <eq:sign-error-average>]
  bounds the average sign-failure probability.
  #emph[Testing each realized state.] We now fix the initial configuration before defining its test event.
    For $x$ with $g \( x \) eq.not 0$, let
  $ H_(v \, x) = { y : g \( y \) g \( x \) > 0 } \, wide r_n \( A \, D \, x \) =
    1 - \( e^(t_n cal(L)) upright(bold(1))_(H_(v \, x)) \) \( x \) . $
  For $g \( x \) = 0$, set $r_n \( A \, D \, x \) = 1$. This definition includes every zero projection in the
    failure event, and (6.2) implies
  $ bb(E)_(A \, D) mu_A \[ r_n \( A \, D \, dot.op \) \] lt.eq epsilon_n . $
  Spin-flip symmetry gives $mu_A \( H_(v \, x) \) lt.eq 1 \/ 2$.
    If $g \( x \) eq.not 0$, testing total variation against this half-space yields
  $ d_(t_n)^(upright("ct")) \( A \, x \) gt.eq 1 / 2 - r_n \( A \, D \, x \) . $
  When $g \( x \) = 0$ the following consequence remains valid because $r_n = 1$:
  #[#set math.equation(numbering: n => "(6.4)")
   $ upright(bold(1))_({ d_(t_n)^(upright("ct")) \( A \, x \) lt.eq 1 \/ 4 }) lt.eq
     4 r_n \( A \, D \, x \) . $ <eq:intrinsic-bad-state>]
  #emph[Removing the auxiliary diagonal.] The test half-space depends on $D$,
    but the bad-state indicator on the left does not. We can therefore integrate (6.4) to obtain
  $ bb(E)_A mu_A { x : d_(t_n)^(upright("ct")) \( A \, x \) lt.eq 1 \/ 4 } = bb(E)_(A \, D) mu_A { x :
    d_(t_n)^(upright("ct")) \( A \, x \) lt.eq 1 \/ 4 } lt.eq 4 epsilon_n . $
  In particular, for every fixed $delta > 0$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ bb(P)_A #h(-0.16667em) (mu_A { x : d_(t_n)^(upright("ct")) \( A \, x \) > 1 \/ 4 } < 1 - delta) lt.eq
     frac(4 epsilon_n, delta) arrow.r 0 . $ <eq:nested-gibbs-start>]
  This is the asserted convergence in probability over the original off-diagonal disorder.
    The argument integrates an intrinsic distance; it does not require choosing one auxiliary diagonal that works
    for a prescribed collection of initial states.
  For deterministic integers $k_n = o \( n^(5 \/ 3) \)$, use $b_n = \( k_n \/ n^(5 \/ 3) \)^(1 \/ 4) +
    n^(- 1)$ and the discrete increment bound. The same proof replaces $2 t_n \/ a_n^2$ by $2
    k_n \/ \( n a_n^2 \)$ and proves (6.5) with $d_(k_n)^(upright("dt"))$.
    These are distances conditional on the realized initial configuration.
    Averaging the transition law itself over a Gibbs initial configuration would instead leave it equal to $mu_A$
    by stationarity. ◻
]

=== 6.2 Inverse Rayleigh quotients of linear functions <inverse-rayleigh-quotients-of-linear-functions>

The covariance estimate controls variances of linear functions.
  To control their inverse Rayleigh quotients, we must also account for sites with small average conditional variance.

We use the standard spin-deletion cavity reweighting; see Talagrand #cite(label("Talagrand2011MeanFieldI")) and
  Chen #cite(label("Chen2013CavityLocal")). Refined cavity and local-field limit theorems have been proved under
  high-temperature hypotheses by Chatterjee #cite(label("Chatterjee2010Stein")) and Chen
  #cite(label("Chen2013CavityLocal")). The calculation below uses only exact deletion identities and conditional
  Gaussian second moments, which hold at the critical temperature.

#thm([Proposition 6.2.])[
  (Linear tests).  #emph[With probability tending to one,
#[#set math.equation(numbering: n => "(6.6)")
 $ parallel Sigma parallel lt.eq cal(R)_(upright("lin")) \( mu \) lt.eq 16 parallel Sigma parallel +
   n^(13 \/ 25) . $ <eq:linear-covariance-comparison>]

 In particular, $n^(- 2 \/ 3) cal(R)_(upright("lin")) \( mu \)$ is bounded in probability.]
] <prop:linear-scale>

#proof[
  The denominator in the inverse Rayleigh quotient of a linear function is diagonal in its coefficients.
    We first rewrite the quotient as a weighted covariance norm,
    then show that the sites with large weights form a sufficiently small exceptional set.
  #emph[Weighted covariance.] For each site define its local field and average conditional variance by
  $ g_i \( x \) = sum_(j eq.not i) W_(i j) x_j \, wide alpha_i = mu \[ "sech"^2 g_i \] . $
  Thus $0 < alpha_i lt.eq 1$, and Lemma 4 gives
  $ cal(D)_mu \( a^T x \) = sum_i alpha_i a_i^2 \, wide "Var"_mu \( a^T x \) = a^T Sigma a . $
  It follows by the change of variables $b_i = sqrt(alpha_i) a_i$ that
  #[#set math.equation(numbering: n => "(6.7)")
   $ cal(R)_(upright("lin")) \( mu \) = parallel Gamma parallel \, wide Gamma =
     "diag" \( alpha_i^(- 1 \/ 2) \) Sigma "diag" \( alpha_i^(- 1 \/ 2) \) . $ <eq:weighted-covariance>]
  For every nonzero $a$, the inequalities $alpha_i lt.eq 1$ and the nonnegativity of the variance give
  $ frac(a^T Sigma a, sum_i alpha_i a_i^2) gt.eq frac(a^T Sigma a, parallel a parallel^2) . $
  Taking the supremum proves the lower bound in (6.6) deterministically.
  #emph[Deleting one spin.] To control a site’s weight, let $nu_i$ be the Gibbs law on the other $n -
    1$ spins after deleting site $i$ and all its incident couplings, without rescaling the remaining couplings.
    Write $macron(mu)_i$ for the corresponding marginal of $mu$ and set
  $ Z_i = nu_i \[ cosh g_i \] \, wide R_i = bb(E)_(nu_i ⊗ nu_i) [(frac(x_(- i)^T y_(- i), n))^2] . $
  Summing over $x_i$ gives the exact identities
  $ frac(d macron(mu)_i, d nu_i) = frac(cosh g_i, Z_i) \, wide alpha_i =
    frac(nu_i \[ \( cosh g_i \)^(- 1) \], Z_i) gt.eq Z_i^(- 2) \, $
  where the last step is Jensen’s inequality for the reciprocal function.
    Since $cosh g_i gt.eq 1$, the product marginal comparison and $\( q - x_i y_i \/ n \)^2 lt.eq 2 q^2 +
    2 n^(- 2)$ imply
  #[#set math.equation(numbering: n => "(6.8)")
   $ R_i lt.eq Z_i^2 bb(E)_(macron(mu)_i ⊗ macron(mu)_i) [(frac(x_(- i)^T y_(- i), n))^2] lt.eq
     2 Z_i^2 \( Q_n + n^(- 2) \) . $ <eq:cavity-overlap>]
  Let $cal(F)_i$ be the sigma-field generated by the matrix with row and column $i$ deleted.
    Conditional on $cal(F)_i$, the law $nu_i$ is fixed and the incident couplings are independent
    $N \( 0 \, 1 \/ n \)$ variables. For a fixed spin configuration,
    $g_i$ is consequently a centered Gaussian with variance $sigma_(upright("loc"))^2 = \( n - 1 \) \/ n$.
    For every fixed integer $m gt.eq 1$, Jensen’s inequality yields
  $ bb(E) \[ Z_i^m divides cal(F)_i \] lt.eq
    bb(E)_(G tilde.op N \( 0 \, sigma_(upright("loc"))^2 \)) \[ cosh^m G \] lt.eq 2 e^(m^2 \/ 2) . $
  Taking, for example, $m = 200$ and using a union bound gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ bb(P) (max_i Z_i > n^(1 \/ 100)) arrow.r 0 . $ <eq:cavity-max-normalization>]
  Proposition 18 says that $n^(2 \/ 3) Q_n$ is bounded in probability. Combining it with (6.8) and (6.9), we obtain
  #[#set math.equation(numbering: n => "(6.10)")
   $ bb(P) \( E_n \) arrow.r 1 \, wide E_n = {max_i R_i lt.eq r_n} \, wide r_n =
     n^(- 7 \/ 12) . $ <eq:cavity-small-overlaps>]
  For clarity, the exponent slack here is $1 \/ 12 - 1 \/ 50 = 19 \/ 300 > 0$:
    on $max_i Z_i lt.eq n^(1 \/ 100)$ and $Q_n lt.eq 1 / 4 n^(- 2 \/ 3 + 19 \/ 300)$,
    the first term on the right of (6.8) is at most $r_n \/ 2$,
    and its second term is at most $r_n \/ 2$ for all sufficiently large $n$.
  #emph[Counting exceptional sites.] The uniform polynomial bound on $Z_i$ is not by itself enough.
    We also need most $Z_i$ to stay below a fixed constant. Conditional on $cal(F)_i$,
    for two configurations of the remaining spins put $c = x_(- i)^T y_(- i) \/ n$.
    Their two local fields have variances $sigma_(upright("loc"))^2$ and covariance $c$, so
  $ bb(E) \[ cosh g_i \( x \) cosh g_i \( y \) divides cal(F)_i \] = e^(sigma_(upright("loc"))^2) cosh c . $
  It follows that
  #[#set math.equation(numbering: n => "(6.11)")
   $ bb(E) \[ Z_i divides cal(F)_i \] & = e^(sigma_(upright("loc"))^2 \/ 2) \,\
"Var" \( Z_i divides cal(F)_i \) & = e^(sigma_(upright("loc"))^2) bb(E)_(nu_i ⊗ nu_i) \[ cosh c - 1 \] lt.eq
  C R_i \, $ <eq:cavity-mean>]
  because $\| c \| lt.eq 1$ and $cosh c - 1 lt.eq C c^2$ on this interval.
  The event $E_n$ depends on many incident rows. To use (6.11) with its stated conditioning, introduce the clipped count
  $ N_n = sum_(i = 1)^n upright(bold(1))_({ R_i lt.eq r_n }) upright(bold(1))_({ Z_i > 4 }) . $
  The variable $R_i$ is $cal(F)_i$-measurable, and $4 - e^(sigma_(upright("loc"))^2 \/ 2) gt.eq 4 -
    e^(1 \/ 2) > 0$. Thus conditional Chebyshev gives
  $ bb(E) N_n =
    sum_i bb(E) #h(-0.16667em) [upright(bold(1))_({ R_i lt.eq r_n }) bb(P) \( Z_i > 4 divides cal(F)_i \)] lt.eq
    C n r_n = C n^(5 \/ 12) . $
  On $E_n$, the clipped count equals $\| B \|$, where $B = { i : Z_i > 4 }$. Consequently,
  #[#set math.equation(numbering: n => "(6.12)")
   $ bb(P) \( \| B \| > n^(1 \/ 2) \) lt.eq bb(P) \( E_n^c \) + bb(P) \( N_n > n^(1 \/ 2) \) lt.eq
     bb(P) \( E_n^c \) + C n^(- 1 \/ 12) arrow.r 0 . $ <eq:cavity-exceptional-count>]
  No independence between sites, or conditioning on $E_n$ in the Gaussian calculation, is used.
  #emph[Combining the covariance blocks.] The probabilistic work is complete.
    Work on the event ${ max_i Z_i lt.eq n^(1 \/ 100) \, med \| B \| lt.eq n^(1 \/ 2) }$,
    whose probability tends to one by (6.9) and (6.12). Let $G = B^c$.
    On $G$, $alpha_i^(- 1 \/ 2) lt.eq Z_i lt.eq 4$, so the principal blocks of the positive semidefinite matrix
    $Gamma$ satisfy
  $ parallel Gamma_(G G) parallel lt.eq 16 parallel Sigma parallel \, wide parallel Gamma_(B B) parallel lt.eq
    "Tr" Gamma_(B B) = sum_(i in B) alpha_i^(- 1) lt.eq \| B \| max_i Z_i^2 lt.eq n^(13 \/ 25) . $
  Here $Sigma_(i i) = 1$ by spin-flip symmetry. Positivity also controls the cross block:
    for $u in bb(R)^G$ and $w in bb(R)^B$,
  $ \| u^T Gamma_(G B) w \|^2 lt.eq \( u^T Gamma_(G G) u \) \( w^T Gamma_(B B) w \) . $
  This follows by applying nonnegativity to the quadratic form at $\( u \, s w \)$ for all real $s$.
    If $a = parallel Gamma_(G G) parallel$ and $b = parallel Gamma_(B B) parallel$, it follows that
  $ \( u \, w \)^T Gamma \( u \, w \)
    lt.eq \( sqrt(a) thin parallel u parallel + sqrt(b) thin parallel w parallel \)^2
    lt.eq \( a + b \) \( parallel u parallel^2 + parallel w parallel^2 \) . $
  The same bound holds when either block is empty. Therefore $parallel Gamma parallel lt.eq
    16 parallel Sigma parallel + n^(13 \/ 25)$, proving (6.6).
    Corollary 19 and $13 \/ 25 < 2 \/ 3$ give the final assertion. ◻
]

#proof[
  The factor in the linear comparison is fixed, so it can be absorbed while preserving every divergent threshold.
    Let $M_n arrow.r oo$ be positive and deterministic. Apply Corollary 19 with the divergent threshold $M_n \/
    32$, and intersect its event with that of Proposition 21. With probability tending to one,
  $ frac(32 n^(2 \/ 3), M_n) lt.eq parallel Sigma parallel lt.eq frac(M_n n^(2 \/ 3), 32) \, wide
    parallel Sigma parallel lt.eq cal(R)_(upright("lin")) \( mu \) lt.eq frac(M_n n^(2 \/ 3), 2) + n^(13 \/ 25) . $
  Since $13 \/ 25 < 2 \/ 3$, the final term is at most $M_n n^(2 \/ 3) \/ 2$ for all sufficiently large $n$.
    These inequalities give the claimed common interval for both quantities. ◻
]

=== 6.3 Comparison with the high-temperature model <comparison-with-the-high-temperature-model>

For the upper bound we combine the high-probability norm estimate of Proposition 5 with the following
  fixed-temperature, zero-field functional inequality. Its constant may depend on the chosen temperature.

#thm([Theorem 6.3.])[
  (High-temperature spectral gap #cite(label("skgapcompanion")) Theorem 1.1).  #emph[Fix $0 < beta < 1$.
    Let $J$ be a symmetric matrix with zero diagonal and independent entries $J_(i j) tilde.op
    N \( 0 \, beta^2 \/ n \)$ for $i < j$, and let
$ nu_J \( x \) = Z_J^(- 1) exp #scale(x: 120%, y: 120%)[\(] 1 / 2 x^T J x #scale(x: 120%, y: 120%)[\)] \, wide
  x in { - 1 \, 1 }^n . $

 There is a finite constant $C_beta$, depending only on $beta$, such that
$ bb(P)_J #h(-0.16667em) {"Var"_(nu_J) \( f \) lt.eq C_beta cal(D)_(nu_J) \( f \) upright(" for every ") f : { -
  1 \, 1 }^n arrow.r bb(R)} arrow.r 1 . $

 Here $cal(D)_(nu_J)$ is the unscaled sum of conditional variances.
   Consequently, the discrete-time heat-bath chain choosing one uniform site has spectral gap at least
   $1 \/ \( n C_beta \)$ with probability tending to one.]
] <thm:high-temperature-gap>

The complete proof is supplied by the separate companion #cite(label("skgapcompanion")) Theorem 1.1.
  The constant $C_beta$ is required only for each fixed $beta < 1$:
  we select $beta$ after the desired exponential tolerance and before taking the limit in $n$.

#thm([Lemma 6.4.])[
  (Comparison of conditional-variance forms).  #emph[Let $rho \,
    nu$ be probability measures with full support on ${ - 1 \, 1 }^n$. Suppose
$ 0 < m lt.eq frac(rho \( x \), nu \( x \)) lt.eq M < oo wide upright("for every ") x . $

 If $"Var"_nu \( f \) lt.eq C_nu cal(D)_nu \( f \)$ for every $f$, then
#[#set math.equation(numbering: n => "(6.13)")
 $ "Var"_rho \( f \) lt.eq M / m C_nu cal(D)_rho \( f \) wide upright("for every ") f . $ <eq:density-comparison>]

 In particular, for $rho \( x \) prop e^(H \( x \))$ and $nu \( x \) prop e^(beta H \( x \))$, with $beta < 1$,
   one may take $M \/ m = e^(\( 1 - beta \) "osc" H)$.]
] <lem:density-comparison>

#proof[
  The comparison works directly with least-squares characterizations;
    one need not compare the conditional kernels pointwise. For any full-support probability measure $eta$,
  #[#set math.equation(numbering: n => "(6.14)")
   $ "Var"_eta \( f \) = inf_(c in bb(R)) eta \[ \( f - c \)^2 \] \, wide cal(D)_eta \( f \) =
     sum_i inf_(h_i) eta \[ \( f - h_i \( x_(- i) \) \)^2 \] \, $ <eq:form-infima>]
  where every $h_i$ ranges independently over all functions of the other coordinates.
    For the second identity, conditional expectation gives the orthogonal decomposition
  $ eta \[ \( f - h_i \)^2 \] = eta \[ \( f - eta \[ f divides x_(- i) \] \)^2 \] +
    eta \[ \( eta \[ f divides x_(- i) \] - h_i \)^2 \] . $
  The first identity follows by the same decomposition with constants. The density bounds and (6.14) imply
  $ "Var"_rho \( f \) lt.eq M "Var"_nu \( f \) \, wide cal(D)_rho \( f \) gt.eq m cal(D)_nu \( f \) \, $
  which prove (6.13). For the exponential densities, $rho \( x \) \/
    nu \( x \)$ is a constant times $e^(\( 1 - beta \) H \( x \))$;
    the common normalization cancels in the ratio of its maximum and minimum. ◻
]

#thm([Proposition 6.5.])[
  (Subexponential upper bound).  #emph[For every fixed $epsilon.alt > 0$,
$ bb(P) {t_(upright("mix")) lt.eq e^(epsilon.alt n) \, quad k_(upright("mix")) lt.eq e^(epsilon.alt n)} arrow.r 1 . $

]
] <prop:subexponential-upper>

#proof[
  We keep the order of parameters explicit: first the requested exponential tolerance,
    then a fixed subcritical temperature, then the dimension.
    Fix $epsilon.alt > 0$ and choose $beta in \( 0 \, 1 \)$ such that $3 \( 1 - beta \) < epsilon.alt$.
    Let $mu_beta \( x \) prop e^(beta H_W \( x \))$. The zero-diagonal part of $beta
    W$ satisfies exactly the hypotheses of Theorem 22; omitting its diagonal changes the Hamiltonian by a
    constant. With probability tending to one,
  $ "Var"_(mu_beta) \( f \) lt.eq C_beta cal(D)_(mu_beta) \( f \) wide upright("for every ") f . $
  Intersect this event with $parallel W parallel lt.eq 3$, whose probability tends to one by Proposition 5.
    On their intersection,
  $ "osc" H_W lt.eq 3 n \, wide mu_min := min_x mu \( x \) gt.eq 2^(- n) e^(- "osc" H_W) gt.eq
    e^(- \( 3 + log 2 \) n) . $
  Lemma 23 now gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ "Var"_mu \( f \) lt.eq C_n cal(D)_mu \( f \) \, wide C_n =
     C_beta e^(3 \( 1 - beta \) n) . $ <eq:critical-poincare-upper>]
  We may increase $C_beta$ to be at least one.
  The comparison has produced a full Poincaré inequality. To obtain worst-start total variation for both clocks,
    combine its spectral decay with the lower bound on the smallest Gibbs mass.
    We give the conversion explicitly so that the factor $n$ in attempted updates remains visible.
    By Lemma 4, (6.15) gives a continuous-time gap at least $1 \/
    C_n$ and a discrete-time gap at least $1 \/ \( n C_n \)$.
    Since $P$ is an average of orthogonal projections, its spectrum is nonnegative.
    Spectral decomposition on the mean-zero subspace therefore yields
  $ parallel e^(t cal(L)) h parallel_(L^2 \( mu \)) lt.eq e^(- t \/ C_n) parallel h parallel_(L^2 \( mu \)) \,
    wide parallel P^k h parallel_(L^2 \( mu \)) lt.eq e^(- k \/ \( n C_n \)) parallel h parallel_(L^2 \( mu \)) . $
  For a starting configuration $x$, take $h_x \( y \) = upright(bold(1))_({ y = x }) \/ mu \( x \) - 1$,
    whose squared norm is $mu \( x \)^(- 1) - 1$. Reversibility identifies the transition density relative to
    $mu$, minus one, with $e^(t cal(L)) h_x$ or $P^k h_x$. The $L^1$ expression for total variation and
    Cauchy–Schwarz give
  #[#set math.equation(numbering: n => "(6.16)")
   $ max_x d_t^(upright("ct")) \( W \, x \) & lt.eq 1 / 2 mu_min^(- 1 \/ 2) e^(- t \/ C_n) \,\
max_x d_k^(upright("dt")) \( W \, x \) & lt.eq 1 / 2 mu_min^(- 1 \/ 2) e^(- k \/ \( n C_n \)) . $ <eq:gap-tv-ct>]
  With $B_n = log 2 + 1 / 2 \( 3 + log 2 \) n$, these bounds imply
  $ t_(upright("mix")) lt.eq C_n B_n \, wide k_(upright("mix")) lt.eq ceil.l n C_n B_n ceil.r . $
  The two right-hand sides grow at most as a fixed constant depending on $beta$ times $n^2
    e^(3 \( 1 - beta \) n)$, plus the rounding term. Since $beta$ is fixed and $3 \( 1 - beta \) < epsilon.alt$,
    both are at most $e^(epsilon.alt n)$ for all sufficiently large $n$.
    The two events used above have an intersection of probability tending to one without any independence
    assumption. Finally, the mixing times depend only on the off-diagonal disorder,
    so averaging out the auxiliary diagonal preserves the conclusion. ◻
]

#proof[
  The independent upper comparison is now proved. It remains to extract worst-start lower bounds from the stronger
    realized-start statement. Fix $epsilon.alt > 0$ and apply Theorem 1 to
  $ t_n = n^(2 \/ 3 - epsilon.alt) \, wide k_n = floor.l n^(5 \/ 3 - epsilon.alt) floor.r . $
  For each clock, with probability tending to one there is a starting configuration whose distance at the
    displayed time exceeds $1 \/ 4$. Worst-start distance is nonincreasing in time by contraction of total
    variation under a Markov kernel. Hence $t_(upright("mix")) gt.eq
    t_n$ and $k_(upright("mix")) > k_n$ on those events. Since $k_(upright("mix"))$ is an integer,
    the latter implies $k_(upright("mix")) gt.eq n^(5 \/ 3 - epsilon.alt)$, including when $k_n = 0$.
    Intersect these two lower-bound events with the event in Proposition 24 to obtain all four asserted bounds
    simultaneously. ◻
]

#prodef([Remark 6.6.])[
  Theorem 2 retains arbitrary divergent factors because it concerns linear functions.
    The full Poincaré constant is a supremum over all nonconstant functions,
    and its upper bound does not follow by enlarging the class in that theorem.
    Proposition 24 is the independent all-function comparison proved here.
    The stronger critical exponent results in #cite(label("criticalmixingcompanion")) Theorem 1.1 use separate
    arguments and have fixed positive exponent slack in their all-function upper bounds.
]

== 7 Why an equilibrium model alone has no mixing time <sec:specification>

The results in the main text specify both the update rule and the clock.
  Two elementary constructions show why these are mathematical assumptions,
  even if the equilibrium law and reversibility are already fixed.
  A third calculation distinguishes high-probability asymptotic bounds from essential bounds over every disorder
  realization.

#thm([Proposition 7.1.])[
  (Arbitrary refresh times).  #emph[Fix any realization of the SK measure on $Omega_n$, $n gt.eq 2$.
    For every positive integer $r$, there is an irreducible, aperiodic,
    reversible Markov kernel with stationary law $mu$ whose worst-state threshold-$1 \/ 4$ mixing time equals $r$.]
] <prop:arbitrary-refresh>

#proof[
  At each step, refresh the whole configuration from $mu$ with probability $p$ and otherwise leave it fixed.
    In operator notation, $Pi \( x \, y \) = mu \( y \)$ and $K_p = \( 1 - p \) upright("Id") + p Pi$,
    where $0 < p lt.eq 1$. All entries of $K_p$ are positive, and $mu \( x \) K_p \( x \, y \) =
    mu \( y \) K_p \( y \, x \)$. The identity $Pi^2 = Pi$ gives, for $0 < p < 1$,
  $ K_p^k = Pi + \( 1 - p \)^k \( upright("Id") - Pi \) \, wide max_x parallel K_p^k \( x \, dot.op \) -
    mu parallel_(upright("TV")) = \( 1 - p \)^k \( 1 - mu_min \) . $
  Here $mu_min lt.eq 2^(- n) lt.eq 1 \/ 4$. Choosing
  $ 1 - p = [frac(1, 4 \( 1 - mu_min \))]^(1 \/ r) $
  gives distance exactly $1 \/ 4$ at $r$ and strictly larger at every earlier integer.
    The case $p = 1$ also has mixing time one. ◻
]

The same freedom remains if transitions are required to change at most one spin.
  Given the uniform-site heat-bath kernel $P$, the kernel $\( 1 - p \) upright("Id") +
  p P$ has the same stationary law, detailed balance, irreducibility, and transition restriction.
  Starting from a minimum-mass state, its distance after $k$ steps is at least $\( 1 - p \)^k - mu_min$,
  by the event that no update was attempted. Its mixing time consequently diverges as $p arrow.b 0$.
  Allowing $p$ to depend on $n$ changes possible growth classes as well.

We next fix the dynamics completely. The remaining distinction is between typical disorder as $n$ grows and all
  disorder at a fixed dimension. Unbounded Gaussian couplings already separate those notions for two spins.

#thm([Proposition 7.2.])[
  (A two-spin example).  #emph[For $n = 2$ and the discrete uniform-site heat-bath kernel,
    the mixing time has no finite deterministic essential upper bound over the Gaussian coupling,
    although it is finite for every realization.]
] <prop:two-spin>

#proof[
  A large positive coupling keeps the two aligned states persistent.
    This can be quantified using the linear observable $g \( x \) = x_1 + x_2$. Put $w = W_12$.
    Spin-flip symmetry gives $mu \[ g \] = 0$, and conditional expectation computes the eigenvalue exactly:
  $ P g = theta g \, wide theta = frac(1 + tanh w, 2) . $
  Starting at $\( 1 \, 1 \)$, the expectation of $g$ after $k$ steps is $2 theta^k$.
    Since $parallel g parallel_oo = 2$, the dual total-variation bound yields
  $ parallel P^k \( \( 1 \, 1 \) \, dot.op \) - mu parallel_(upright("TV")) gt.eq 1 / 2 theta^k . $
  For each fixed $k$, this exceeds $1 \/ 4$ when $w$ is sufficiently large and positive.
    Every such Gaussian tail has positive probability. The chain for any finite $w$ remains finite,
    irreducible and aperiodic, so its own mixing time is finite. ◻
]

Proposition 27 concerns essential bounds over all disorder realizations at fixed $n$.
  It does not contradict the typical-disorder asymptotic statements in Theorem 3.

#bibliography("refs.bib", style: "ieee", title: [References])
