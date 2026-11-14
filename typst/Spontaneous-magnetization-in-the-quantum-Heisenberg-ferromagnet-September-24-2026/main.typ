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

#align(center)[#text(size: 16pt, weight: "bold")[Spontaneous magnetization in the quantum Heisenberg ferromagnet]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The nearest-neighbor quantum Heisenberg ferromagnet assigns a quantum spin to each lattice site and favors
  parallel neighboring spins. Its Hamiltonian is invariant under simultaneous rotations of all spins.
  Spontaneous magnetization asks whether, at zero applied field,
  an infinite-volume equilibrium state can nevertheless select a direction and have a nonzero one-site spin
  expectation. The distinction between an individual ordered state and its rotation-invariant average is essential.

=== 1.1 The model and the result <sec:model>

Fix an integer $d gt.eq 3$ and a spin $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$.
  At each site use $bb(C)^(2 S + 1)$ with orthonormal basis $\( e_m \)_(m = - S)^S$ and operators

$ S^z e_m = m e_m \, wide S^(+) e_m = sqrt(S \( S + 1 \) - m \( m + 1 \)) thin e_(m + 1) \, wide S^(+) e_S = 0 . $

Set $S^(-) = \( S^(+) \)^(*)$, $S^x = \( S^(+) + S^(-) \) \/
  2$ and $S^y = \( S^(+) - S^(-) \) \/ \( 2 upright(i) \)$,
  and write $S_x^a$ for the corresponding operator at a site $x$.
  For finite $Lambda subset bb(Z)^d$, the free-boundary Hamiltonian at coupling one is

#[#set math.equation(numbering: n => "(1.1)")
 $ H_Lambda = - sum_({ x \, y } subset Lambda\
\| x - y \|_1 = 1) sum_(a in { x \, y \, z }) S_x^a S_y^a . $ <eq:hamiltonian>]

The outer sum counts each unordered edge once; in its inner sum the letters $a = x \, y \, z$ designate spin components.

For a finite set $F subset bb(Z)^d$, let $cal(A)_F = ⨂_(x in F) M_(2 S + 1) \( bb(C) \)$,
  with the usual embeddings obtained by adjoining identity factors.
  The quasi-local algebra $cal(A)$ is the norm completion of their union.
  The bounded finite-range interaction in (1.1) defines a dynamics $tau_t$ by the norm limit, on local observables, of

$ tau_t^Lambda \( A \) = e^(upright(i) t H_Lambda) A e^(- upright(i) t H_Lambda) $

along increasing boxes. This limit is independent of the boxes.
  We use the resulting norm-continuous orbit $t mapsto tau_t \( A \)$ for every $A in cal(A)$.
  The locality estimates underlying this construction originate in Lieb and
  Robinson #cite(label("LiebRobinson1972")). Existence and independence of the exhausting boxes follow from
  #cite(label("NachtergaeleOgataSims2006")) Theorem 2.2; its hypotheses are checked when we use this dynamics in
  Section 8.2.

A state is a positive linear functional $omega$ on $cal(A)$ with $omega \( 1 \) = 1$.
  For $0 < beta < oo$, it is a $beta$-KMS state for $tau$ if, for every $A \, B in cal(A)$,
  there is a bounded function $F_(A \, B)$, continuous on the closed strip $0 lt.eq "Im" z lt.eq
  beta$ and analytic in its interior, such that

#[#set math.equation(numbering: n => "(1.2)")
 $ F_(A \, B) \( t \) = omega \( A tau_t \( B \) \) \, wide F_(A \, B) \( t + upright(i) beta \) =
   omega \( tau_t \( B \) A \) quad \( t in bb(R) \) . $ <eq:kms-definition>]

This is the algebraic equilibrium condition developed by Haag,
  Hugenholtz and Winnink #cite(label("HaagHugenholtzWinnink1967")).
  We call such a state an equilibrium state at inverse temperature $beta$.
  If $T_x$ denotes translation by $x in bb(Z)^d$, translation invariance means $omega compose T_x =
  omega$ for every $x$.

#thm([Theorem 1.1.])[
  #emph[For every integer $d gt.eq 3$ and every $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$,
    there is a finite $beta_0 \( d \, S \) > 0$ such that, for every finite $beta gt.eq beta_0 \( d \, S \)$,
    the dynamics associated with (1.1) has a translation-invariant $beta$-KMS state $omega$ satisfying
$ omega \( S_0^z \) gt.eq S \/ 4 . $

]
] <thm:main>

Thus the zero-field model has spontaneously magnetized equilibrium states at every sufficiently low positive
  temperature, for each allowed spin. This magnetization is a property of the chosen state and need not be
  retained by a rotation-invariant average.

=== 1.2 Historical context and significance <historical-context-and-significance>

Heisenberg’s exchange model provided a quantum mechanism for ferromagnetism #cite(label("Heisenberg1928")).
  Bloch’s spin-wave picture predicted the low-temperature reduction of magnetization,
  and Dyson developed the theory of interacting spin waves and their thermodynamic
  corrections #cite(label("Bloch1930")) #cite(label("Dyson1956Interactions"))
  #cite(label("Dyson1956Thermodynamics")). These predictions explain why an ordered phase is expected;
  proving that a zero-field equilibrium state retains a nonzero spin expectation requires control at all length
  scales at one fixed positive temperature.

The dimension restriction has a rigorous basis. The Mermin–Wagner theorem excludes positive-temperature
  ferromagnetism in one and two dimensions for finite-range isotropic Heisenberg
  models #cite(label("MerminWagner1966")). In dimensions at least three, Fröhlich,
  Simon and Spencer established low-temperature ordering for classical continuous-spin models through infrared
  bounds #cite(label("FrohlichSimonSpencer1976")) Theorem 3.1.
  Dyson, Lieb and Simon proved quantum antiferromagnetic ordering for spin at least one in those dimensions,
  and for spin one half in sufficiently large dimension #cite(label("DysonLiebSimon1978")) Theorem 6.2.
  Kennedy, Lieb and Shastry subsequently proved ground-state Néel order for the spin-one-half antiferromagnet on
  the three-dimensional cubic lattice #cite(label("KennedyLiebShastry1988")).
  The corresponding ferromagnetic problem resisted this approach:
  the reflection-positivity argument does not provide the needed ferromagnetic Duhamel infrared bound,
  as explained by Dyson, Lieb and Simon #cite(label("DysonLiebSimon1978")) pp. 339–340.

Probabilistic representations offer another route. Powers related the isotropic Heisenberg model to random walks
  on the permutation group #cite(label("Powers1976")). Conlon and Solovej developed random-walk representations
  for the Heisenberg model and proved a low-temperature free-energy upper bound for spin one
  half #cite(label("ConlonSolovej1991Representation")) #cite(label("ConlonSolovej1991UpperBound")).
  Tóth’s exchange-cycle representation sharpened the pressure bound #cite(label("Toth1993")).
  General-spin geometric representations were developed by Nachtergaele #cite(label("Nachtergaele1994Stochastic"))
  #cite(label("Nachtergaele1994Quasistates")); the symmetric-slot and endpoint-permutation formulation is also
  given by Björnberg, Fröhlich and Ueltschi #cite(label("BjornbergFrohlichUeltschi2020")) Section 3.2.
  Their ordering results concern the complete graph, whereas the representation rests on finite-spin algebra.
  Section 2 rederives that algebra for the nearest-neighbor interaction and its normalization here.
  Positive loop weights alone do not establish ordering: the needed additional estimate controls how often an
  interior cycle avoids pins on the boundary.

Two algebraic methods enter this pin comparison. The stable-polynomial and negative-dependence results of Borcea,
  Brändén and Liggett #cite(label("BorceaBrandenLiggett2009")) underlie the simultaneous pin test in Section 3.
  The exterior-moment identity used in Section 4 belongs to the determinant-preserving framework of Dereziński,
  Liang and Mahoney #cite(label("DerezinskiLiangMahoney2020")):
  expected minors agree with the minors of the mean, and this property is preserved under independent matrix
  products. The conditional next-pin formula needed here is derived in Section 4.

Correggi, Giuliani and Seiringer proved the fixed-spin low-temperature free-energy asymptotics predicted by
  spin-wave theory in three dimensions #cite(label("CorreggiGiulianiSeiringer2015")) Theorem 2.1.
  Their bounds also control correlations on a temperature-dependent finite length scale of order $beta^(5 \/ 4)$
  #cite(label("CorreggiGiulianiSeiringer2015")) equations (2.6)–(2.8).
  More recently, Klippel proved the corresponding free-energy asymptotics in two
  dimensions #cite(label("Klippel2026FreeEnergy")). These are thermodynamic and finite-scale advances;
  the present result constructs an ordered state at a fixed positive temperature in $d gt.eq 3$.

Lieb explicitly posed the quantum ferromagnetic ordering problem in 1999 #cite(label("Lieb1999")) Problem A.
  Seiringer’s 2025 account records it using a volume-averaged finite-volume two-point order
  parameter #cite(label("Seiringer2025")). Theorem 1 resolves the low-temperature ordering problem in the
  spontaneous-magnetization formulation stated here: it constructs a translation-invariant zero-field KMS state
  selecting a spin direction, for every allowed spin and every $d gt.eq 3$.
  The precise conclusion is the one-point state assertion above;
  the finite-volume correlation criterion in the cited account is a different formulation and is not used in this proof.

=== 1.3 Proof strategy and the main mechanisms <proof-strategy-and-the-main-mechanisms>

The proof starts in finite cubes. Replace a spin $S$ by $ell = 2 S$ spin-$1 /
  2$ slots at its site and project onto their symmetric subspace.
  Rate-$1 / 2$ Poisson transpositions across neighboring sites,
  together with uniform within-site permutations at the time seam, give an exchange-path representation.
  Each cycle has weight two, corresponding to its two spin colors.
  A #emph[pin] is a slot-time point whose cycle is required to have the up color;
  a cycle meeting a pin has weight one. Section 2 derives the full spectral law of magnetization and a bound on
  inserted exchange marks under these pin laws.

Pin every boundary slot throughout the time period, and choose a finite time grid.
  We prove, by downward induction on the number of grid pins,
  that under every such pin law the probability that $m$ prescribed points all belong to cycles missing the pins
  is at most $p^m$, for a small fixed $p$. The test points lie at one time and form a sparse set:
  the number in a spatial ball grows at most a small power of its radius.
  This restriction is enough both to control obstacle components and, at the end,
  to bound the probability for a single interior slot.

The induction step adds the test set $T$ to the existing pins $E$, forming $P = E union T$.
  The bound for this larger pin set is already available. Section 3 uses stable multiaffine permutation
  polynomials to show that the desired avoidance probability under the $E$-law is at most $\( 2 r \)^m$.
  Here $r$ is the mean fraction of points of $T$ whose lines, under the $P$-law,
  return to $T$ at positive elapsed time before reaching $E$.
  It therefore suffices to use the larger-pin induction hypothesis to prove $r lt.eq p \/ 2$.

For this return estimate, expose exactly the cycles that miss $P$.
  The unexposed slots support independent heat exchanges and prescribed transports,
  conditioned on every remaining cycle meeting a pin. Section 4 first identifies this conditional law and its
  exposure marginal. An exterior-power and determinant calculation then identifies the conditional next-pin first
  moment with that of a single Markov walk using fresh randomness on successive periods.
  The exposure itself is still averaged under its original $P$-law;
  no independence of the conditioned cycles is required.

Ignore the other interior pins in the walk’s stopping rule, retaining boundary killing.
  Let $U$ be its one-period kernel, and let $f$ be one on $T$ and elsewhere the probability of a future visit to
  $T$ before killing. Section 4 proves

$ m \( 1 - r \) gt.eq bb(E)_P chevron.l f \, \( I - U \) f chevron.r . $

The needed lower bound on this quadratic loss is nearly $m$:
  a bound of $m \( 1 - epsilon \)$ gives $r lt.eq epsilon$. Write $f = upright(bold(1))_T + g$.
  The two summands are initially disjoint, but their propagated masses can overlap;
  controlling that overlap is the main analytic task.

The larger-pin induction hypothesis bounds the probability that every site in a prescribed sparse collection has
  no unexposed slots. Section 5 turns this information into short surviving connections near most anchors and
  bounds on the sizes of distant obstacle components. The first property supplies a local Nash inequality,
  which spreads the mass initially on $T$. The second allows Section 6 to route decaying finite-energy flows
  through the available sites. These flows control the pairing of the spread mass with the propagated $g$ by its
  Dirichlet energy at that same time.

Section 7 applies these estimates in short portions at both ends of a period.
  A weighted time average absorbs the pairing into the energy dissipated by the heat flow,
  yielding a quadratic loss at least $m \( 1 - epsilon \( p \) \)$, with $epsilon \( p \) = o \( p \)$.
  Choose $p$ small enough that $2 epsilon \( p \) lt.eq p$;
  the pin test then closes the finite downward induction. Its singleton conclusion says that under continuous
  boundary pinning an interior slot is unlikely to lie on a cycle avoiding the boundary.

Finally, requiring every boundary-touching cycle to be up costs only an exponential in the boundary size.
  The pin estimate therefore gives a macroscopic magnetization tail in the free zero-field Gibbs state.
  Section 8 selects this tail with a homogeneous field tending to zero as the boxes grow,
  and averages translations. It verifies both KMS strip boundaries for the same limiting state and the original
  zero-field dynamics, completing Theorem 1.

=== 1.4 A hard-core boson consequence <sec:hard-core>

The spin-one-half correspondence of Matsubara and Matsuda #cite(label("MatsubaraMatsuda1956")) Sections 2–3 turns
  the ordered state into a state with averaged off-diagonal long-range order.
  For $S = 1 / 2$, put $b_x = S_x^(-)$ and $n_x = b_x^dagger b_x = S_x^z + 1 / 2$.
  If $E_Lambda$ is the set of unordered nearest-neighbor edges in $Lambda$, then (1.1) becomes

$ H_Lambda = - 1 / 2 sum_({ x \, y } in E_Lambda) \( b_x^dagger b_y + b_y^dagger b_x \) -
  sum_({ x \, y } in E_Lambda) \( n_x - 1 / 2 \) \( n_y - 1 / 2 \) . $

This is the particle–hole-symmetric attractive hard-core hopping model.
  For each inverse temperature in Theorem 1, rotate the full mean-spin vector
  $\( omega \( S_0^x \) \, omega \( S_0^y \) \, omega \( S_0^z \) \)$ to the positive $x$ direction.
  Simultaneous spin rotation commutes with the zero-field dynamics and translations,
  so the rotated state $nu$ is again a translation-invariant $beta$-KMS state.
  It satisfies $nu \( b_x \) = r gt.eq 1 \/ 8$ and $nu \( n_x \) = 1 \/ 2$,
  where $r$ is the length of the original mean-spin vector.
  In particular, it breaks the $U \( 1 \)$ symmetry $b_x mapsto e^(- i theta) b_x$.

For every nonempty finite $Lambda$, set $B_Lambda = sum_(x in Lambda) b_x$ and $a_Lambda = \| Lambda \|^(- 1 \/ 2)
  B_Lambda$. Positivity gives $nu \( B_Lambda^dagger B_Lambda \) gt.eq \| nu \( B_Lambda \) \|^2 gt.eq \|
  Lambda \|^2 \/ 64$, hence

$ frac(1, \| Lambda \|^2) sum_(x \, y in Lambda) nu \( b_x^dagger b_y \) gt.eq 1 / 64 \, wide
  nu \( a_Lambda^dagger a_Lambda \) gt.eq frac(\| Lambda \|, 64) . $

The first bound gives averaged off-diagonal long-range order;
  the diagonal contribution is only $1 \/ \( 2 \| Lambda \| \)$.
  Since $nu \( sum_(x in Lambda) n_x \) = \| Lambda \| \/ 2$,
  the uniform-mode occupation is at least $1 \/ 32$ of the expected particle number.
  These bounds concern restrictions of the chosen infinite-volume state, not finite-volume Gibbs states.

=== 1.5 Conventions <conventions>

Unless a different norm is displayed, spatial distances and balls use the sup norm on $bb(Z)^d$;
  lattice edges always join nearest neighbors. All matrix kernels for one-particle motion act on column vectors of
  masses, so their columns describe a fixed starting point.
  Inner products and $ell^p$ norms on slots use counting measure.
  Unless explicitly indicated otherwise, constants may depend on $d$ and $S$ and on explicitly fixed geometric
  parameters, but not on the volume, the pin set, or the time period.
  The order of choosing the small pinning parameter and the geometric scales is specified in Sections 5 and 7.

== 2 Spin slots, loops, and pins <sec:loops>

We first express the finite-volume Gibbs state by exchange paths.
  The representation will identify the entire spectral distribution of total magnetization,
  which is needed when a small field is introduced at the end of the proof.
  We then define the pin laws used in the intervening probabilistic argument and establish their two elementary
  measure bounds. Powers related the isotropic Heisenberg model to random walks on
  permutations #cite(label("Powers1976")). Tóth gave the random-stirring representation for spin $1 \/
  2$ #cite(label("Toth1993")). Nachtergaele developed general-spin symmetric-slot
  representations #cite(label("Nachtergaele1994Quasistates")) Section 2.2, equations (2.23)–(2.25),
  and Theorem 2.4; see also his account of geometric representations #cite(label("Nachtergaele1994Stochastic")).
  For the endpoint-permutation realization and the magnetization transform, see also Björnberg,
  Fröhlich and Ueltschi #cite(label("BjornbergFrohlichUeltschi2020")) Section 3.2,
  Proposition 3.2 and equation (3.19). Their representation is presented for the complete graph with a different
  coupling normalization. We derive the finite-graph algebra here for our nearest-neighbor Hamiltonian,
  including its rates and full spectral law, before introducing the pin weights needed in the proof.

Fix a finite cube $Lambda subset bb(Z)^d$, $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$, and $0 < beta < oo$.
  Set $ell = 2 S$ and introduce the #emph[slot set]

$ V_Lambda = Lambda times { 1 \, dots.h \, ell } . $

A slot $i = \( x \, a \)$ is located at the site $x$. Two slots form a #emph[slot edge] if their sites are nearest
  neighbors; all $ell^2$ pairs above each lattice edge are included.
  Let $cal(E)_Lambda$ be this set of unordered slot edges and put $q_Lambda = \| cal(E)_Lambda \|$. On

$ hat(cal(H))_Lambda = ⨂_(i in V_Lambda) bb(C)^2 $

write $s_i^a$ for the spin-$1 / 2$ matrix in direction $a$ acting on slot $i$.
  For a permutation $pi$ of the slots, $cal(U)_pi$ denotes the tensor permutation sending the factor originally at
  $i$ to $pi \( i \)$; in particular $cal(U)_pi cal(U)_rho = cal(U)_(pi compose rho)$.

#thm([Lemma 2.1.])[
  (Symmetric-slot realization).  #emph[At each site $x$, the operators $hat(S)_x^a =
    sum_(j = 1)^ell s_(\( x \, j \))^a$ restrict on $"Sym"^ell \( bb(C)^2 \)$ to the spin-$S$ matrices defined in
    Section 1.1. The orthogonal projection onto this subspace is
$ cal(S)_x = frac(1, ell !) sum_(kappa in frak(S)_ell) cal(U)_(kappa \, x) . $

 With $cal(S)_Lambda = product_(x in Lambda) cal(S)_x$, define
$ hat(H)_Lambda = - sum_({ x \, y } subset Lambda : thin \| x - y \|_1 = 1) sum_(a = x \, y \, z) hat(S)_x^a
  hat(S)_y^a \, wide hat(M)_Lambda = sum_(i in V_Lambda) s_i^z . $

 Both operators commute with every within-site permutation and with $cal(S)_Lambda$.
   Their restrictions to $"ran" cal(S)_Lambda$ are unitarily equivalent to $H_Lambda$ and $M_Lambda =
   sum_(x in Lambda) S_x^z$, respectively. Moreover,
#[#set math.equation(numbering: n => "(2.1)")
 $ hat(H)_Lambda = - 1 / 2 sum_({ i \, j } in cal(E)_Lambda) cal(U)_(\( i j \)) + q_Lambda /
   4 I . $ <eq:slot-hamiltonian>]

]
] <lem:slot-realization>

#proof[
  Let $psi_k$ be the normalized sum of the $binom(ell, k)$ elementary tensor vectors having exactly $k$ up spins,
    for $0 lt.eq k lt.eq ell$. These form an orthonormal basis of the symmetric subspace, and
  $ hat(S)^z psi_k = \( k - ell \/ 2 \) psi_k . $
  For $0 lt.eq k < ell$, each elementary vector with $k + 1$ up spins occurs $k +
    1$ times in $sum_j s_j^(+) psi_k$. Consequently
  $ hat(S)^(+) psi_k = \( k + 1 \) sqrt(binom(ell, k + 1) / binom(ell, k)) thin psi_(k + 1) =
    sqrt(\( ell - k \) \( k + 1 \)) thin psi_(k + 1) . $
  Also $hat(S)^(+) psi_ell = 0$. Under $m = k - S$, the squared coefficient is $S \( S + 1 \) - m \( m + 1 \)$.
    The lowering, $x$, and $y$ matrices follow by adjunction and the definitions.
    Thus $e_m mapsto psi_(S + m)$ gives the claimed unitary identification.
  The average over the finite permutation group is self-adjoint and idempotent,
    and its range is exactly the invariant subspace, proving the projection formula.
    Conjugation by a within-site permutation merely reorders the summands of each $hat(S)_x^a$.
    It therefore commutes with $hat(H)_Lambda$ and $hat(M)_Lambda$.
    Equivalently, in the slot-edge expression, conjugation permutes the complete collection of $ell^2$ slot pairs
    above every incident lattice edge. This last observation is essential:
    an individual inter-site transposition need not commute with $cal(S)_x$.
  Finally, on two spin-$1 / 2$ factors, direct calculation in the up/down basis gives
  $ sum_(a = x \, y \, z) s_i^a s_j^a = 1 / 2 cal(U)_(\( i j \)) - 1 / 4 I . $
  Summing this identity over the slot edges proves (2.1) and the asserted restrictions. ◻
]

The #emph[base exchange law] $bb(P)_(upright(b))$ is defined as follows.
  Independently on each edge of $cal(E)_Lambda$, put a Poisson process of rate $1 \/
  2$ on the time interval $\[ 0 \, beta \)$. At a mark, exchange the two slot lines.
  At the end of the interval, apply an independent uniform permutation of the $ell$ slots at each site,
  and then identify time $beta$ with time $0$. An #emph[exchange picture] $omega$ comprises these marks and
  endpoint permutations. Following its lines forward through repeated copies of the same picture gives directed
  loops, which we call its #emph[cycles]. They correspond to the cycles of its one-period slot permutation
  $pi_omega$ and can wind through several periods. Let $c \( omega \)$ be their number.
  In particular, $c \( omega \) lt.eq \| V_Lambda \|$.

Slot-time points belong to $V_Lambda times \( bb(R) \/ beta bb(Z) \)$.
  At an exchange we use the slot just after the exchange; time $0$ is understood just after the within-site
  endpoint permutations and the wrapping of time. Thus every cycle has a well-defined set of slots at the
  time-zero cut. Write $a_C$ for the number of these slots on a cycle $C$; then $sum_C a_C = \| V_Lambda \|$.

#thm([Proposition 2.2.])[
  (Exact spin-to-loop representation).  #emph[For every finite cube $Lambda$, spin $S$,
    and $0 < beta < oo$ as above, the partition function is
#[#set math.equation(numbering: n => "(2.2)")
 $ Z_Lambda \( beta \) := "Tr"_(cal(H)_Lambda) e^(- beta H_Lambda) =
   e^(beta q_Lambda \/ 4) thin bb(E)_(upright(b)) 2^(c \( omega \)) . $ <eq:loop-partition-function>]

 More generally, for every function $Phi$ on the finite spectrum of $M_Lambda$,
#[#set math.equation(numbering: n => "(2.3)")
 $
   frac("Tr"_(cal(H)_Lambda) #scale(x: 120%, y: 120%)[\(] e^(- beta H_Lambda) Phi \( M_Lambda \)
   #scale(x: 120%, y: 120%)[\)], Z_Lambda \( beta \)) =
   frac(bb(E)_(upright(b)) sum_(epsilon in { - 1 \, 1 }^({ upright("cycles of ") omega })) Phi #h(-0.16667em)
   (1 / 2 sum_C epsilon_C a_C), bb(E)_(upright(b)) 2^(c \( omega \))) . $ <eq:spectral-loop-law>]

 Thus the spectral law of $M_Lambda$ is obtained by weighting the base picture by $2^(c \( omega \))$,
   then coloring each cycle independently up or down with equal probabilities, and summing the corresponding $+
   1 \/ 2$ or $- 1 \/ 2$ over its slots at time $0$.]
] <prop:spin-loops>

#proof[
  Let $phi_t$ be the permutation generated by the inter-site marks up to time $t$,
    without the endpoint permutations. Independent increments, or the Poisson expansion in time-ordered marks, give
  $ bb(E)_(upright(b)) cal(U)_(phi_beta) = exp #h(-0.16667em) {beta /
    2 sum_({ i \, j } in cal(E)_Lambda) \( cal(U)_(\( i j \)) - I \)} =
    e^(- beta q_Lambda \/ 4) e^(- beta hat(H)_Lambda) . $
  Indeed, over an interval of length $thin upright(d) t$, the expectation is $I + 1 /
    2 sum_({ i \, j }) \( cal(U)_(\( i j \)) - I \) thin upright(d) t + o \( thin upright(d) t \)$;
    the resulting constant-coefficient matrix differential equation gives the displayed exponential.
    Averaging the independent endpoint permutations now gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ bb(E)_(upright(b)) cal(U)_(pi_omega) = e^(- beta q_Lambda \/ 4) cal(S)_Lambda e^(- beta hat(H)_Lambda) .
     $ <eq:loop-operator-average>]
  Lemma 2 identifies the trace on the range of $cal(S)_Lambda$ with the physical trace.
    Moreover, $hat(M)_Lambda$ commutes with every slot permutation,
    since it is the sum of the same one-slot observable over all slots. Therefore (2.4) yields
  #[#set math.equation(numbering: n => "(2.5)")
   $ "Tr"_(cal(H)_Lambda) #scale(x: 120%, y: 120%)[\(] e^(- beta H_Lambda) Phi \( M_Lambda \)
     #scale(x: 120%, y: 120%)[\)] = e^(beta q_Lambda \/ 4) thin bb(E)_(upright(b)) "Tr"_(hat(cal(H))_Lambda)
     #scale(x: 120%, y: 120%)[\(] cal(U)_(pi_omega) Phi \( hat(M)_Lambda \) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:loop-spectral-trace>]
  To calculate the last trace, index the elementary up/down tensor basis by $eta in { - 1 \, 1 }^(V_Lambda)$.
    The diagonal entry of $cal(U)_(pi_omega)$ at $eta$ is one exactly when $eta$ is constant on every cycle of
    $pi_omega$, and is zero otherwise. For such a basis vector the eigenvalue of $hat(M)_Lambda$ is $1 /
    2 sum_C epsilon_C a_C$. Hence
  $ "Tr"_(hat(cal(H))_Lambda) #scale(x: 120%, y: 120%)[\(] cal(U)_(pi_omega) Phi \( hat(M)_Lambda \)
    #scale(x: 120%, y: 120%)[\)] = sum_(epsilon in { - 1 \, 1 }^({ upright("cycles of ") omega })) Phi
    #h(-0.16667em) (1 / 2 sum_C epsilon_C a_C) . $
  Taking $Phi = 1$ proves (2.2); dividing (2.5) by it proves (2.3).
    In particular, taking $Phi$ to be the indicator of any spectral subset proves the claim about the spectral
    distribution, not only its moments. ◻
]

=== 2.1 Pin laws and the boundary limit <pin-laws-and-the-boundary-limit>

The factor two in the representation records the two colors of each cycle.
  A pin fixes the color of every cycle it meets. This motivates a family of measures in which only the cycles
  avoiding the pins retain their factor two.

For a deterministic pin set $D subset V_Lambda times \( bb(R) \/ beta bb(Z) \)$, let

$ n_D \( omega \) = \# { C : C upright(" is a cycle of ") omega \, med C ∩ D = diameter } \, wide
  w_D \( omega \) = 2^(n_D \( omega \)) \, wide Z_D = bb(E)_(upright(b)) w_D . $

We use finite pin sets and their unions with the continuous boundary set defined below.
  Their cycle-incidence events are measurable. The #emph[pin law] and its expectation are

#[#set math.equation(numbering: n => "(2.6)")
 $ bb(P)_D \( thin upright(d) omega \) = frac(w_D \( omega \), Z_D)
   bb(P)_(upright(b)) \( thin upright(d) omega \) \, wide bb(E)_D \[ dot.op \] . $ <eq:pin-law>]

The set of slot-time points on cycles missing $D$ is denoted by

$ cal(B)_D \( omega \) = union.big_(C : thin C ∩ D = diameter) C . $

In fixed volume, $1 lt.eq w_D lt.eq 2^(\| V_Lambda \|)$, so $Z_D$ is finite and strictly positive.
  The empty-pin law $bb(P)_diameter$ is exactly the picture marginal in Proposition 3.

The #emph[inner boundary] and the continuous boundary pin set are

#[#set math.equation(numbering: n => "(2.7)")
 $ partial Lambda = { x in Lambda : exists y in.not Lambda \, med \| x - y \|_1 = 1 } \, wide D_0 =
   partial Lambda times { 1 \, dots.h \, ell } times \( bb(R) \/ beta bb(Z) \) . $ <eq:continuous-boundary-pins>]

Every slot above a boundary site is therefore pinned at every time.
  The following fixed-volume approximation allows finite-layer arguments to be applied with this boundary condition.

#thm([Lemma 2.3.])[
  (Dense boundary pins).  #emph[Fix a finite cube $Lambda$, $0 < beta < oo$,
    and a finite deterministic pin set $F$. Let $\( cal(C)_n \)_(n gt.eq 1)$ be increasing finite sets of times,
    each containing $0$, whose union is dense in $bb(R) \/ beta bb(Z)$, and put
$ D_(0 \, n) = partial Lambda times { 1 \, dots.h \, ell } times cal(C)_n \, wide D_n = F union D_(0 \, n) \, wide
  D = F union D_0 . $

 For $bb(P)_(upright(b))$-almost every picture there is a finite $n_(*) \( omega \)$ such that, for all $n gt.eq
   n_(*) \( omega \)$,
$ w_(D_n) \( omega \) = w_D \( omega \) \, wide cal(B)_(D_n) \( omega \) = cal(B)_D \( omega \) . $

 The laws $bb(P)_(D_n)$ converge to $bb(P)_D$ in total variation.
   More generally, if $Phi_n arrow.r Phi$ almost surely under $bb(P)_(upright(b))$ and $sup_n \| Phi_n \| lt.eq
   A < oo$, then
#[#set math.equation(numbering: n => "(2.8)")
 $ bb(E)_(D_n) Phi_n arrow.r bb(E)_D Phi . $ <eq:dense-pin-expectations>]

]
] <lem:dense-pins>

#proof[
  In one period the number of Poisson marks is finite almost surely.
    Their times are distinct and avoid the countable collection of deterministic cut times and pin times,
    almost surely. A line that visits a boundary site occupies that site on a time interval of positive length:
    inter-site marks do not coincide, and endpoint permutations preserve the site.
    This remains true for a visit crossing the time seam. A dense collection of cuts detects every such visit,
    with every slot included at each boundary cut.
  There are only finitely many cycles. For a fixed picture,
    choose one detecting cut for each cycle that meets $D_0$ and take the largest of their finite indices.
    After this index every cycle has the same incidence with $D_n$ as with $D$.
    This proves both eventual equalities. Also $w_(D_n) arrow.b w_D$ and $w_(D_n) lt.eq 2^(\| V_Lambda \|)$.
    Dominated convergence gives $Z_(D_n) arrow.r Z_D$ and
  $ bb(E)_(upright(b)) lr(|w_(D_n) / Z_(D_n) - w_D / Z_D|) arrow.r 0 \, $
  which proves total-variation convergence. Applying dominated convergence to $w_(D_n) Phi_n$ proves (2.8).
    The dominating constant here depends on the fixed volume;
    no uniform-in-volume bound on the total loop weight is asserted. ◻
]

=== 2.2 Factorial domination for exchange marks <factorial-domination-for-exchange-marks>

The pin weights alter the distribution of the Poisson marks.
  The bound needed later is on ordered lists of distinct marks; it does not require independence under a pin law.

Let $X_Lambda = cal(E)_Lambda times \[ 0 \, beta \)$ and let $mu$ be the measure satisfying
  $mu \( { e } times thin upright(d) t \) = 1 / 2 thin upright(d) t$.
  Write $omega_(upright(m))$ for the counting measure of inter-site marks in the picture.
  For $n gt.eq 1$, the notation $\( omega_(upright(m)) \)_eq.not^n$ means ordered $n$-tuples of distinct marks,
  even when some of their edge labels agree.

#thm([Lemma 2.4.])[
  (Factorial-measure domination).  #emph[For every finite pin set $D$, or such a set united with $D_0$,
    every integer $n gt.eq 1$, and every nonnegative measurable function $F : X_Lambda^n arrow.r \[ 0 \, oo \]$,
#[#set math.equation(numbering: n => "(2.9)")
 $ bb(E)_D sum_(\( u_1 \, dots.h \, u_n \) in \( omega_(upright(m)) \)_eq.not^n) F \( u_1 \, dots.h \, u_n \)
   lt.eq 2^n integral_(X_Lambda^n) F \( u_1 \, dots.h \, u_n \) product_(j = 1)^n mu \( thin upright(d) u_j \) .
   $ <eq:factorial-domination>]

 In particular, the estimate holds with the marks restricted to any specified time interval and with any specified
   chronological order.]
] <lem:factorial>

#proof[
  Inserting one inter-site transposition into a picture cuts two directed strands and reconnects them with their
    outgoing portions exchanged. If they lie on different cycles, those cycles join; if they lie on one cycle,
    that cycle splits into two. The union of their slot-time strands, and hence all pin incidences on that union,
    is retained. On joining, the number of cycles missing $D$ cannot increase.
    On splitting, it increases by at most one: a cycle missing $D$ gives two such cycles,
    while a cycle meeting $D$ has at least one descendant still meeting $D$. Thus, away from coincident mark times,
  #[#set math.equation(numbering: n => "(2.10)")
   $ w_D #h(-0.16667em) (omega + sum_(j = 1)^n delta_(u_j)) lt.eq 2^n w_D \( omega \) . $ <eq:pin-insertion-ratio>]
  For finite pins coincidences with pin times have product-intensity measure zero;
    including $D_0$ does not change the surgery argument. The endpoint permutations are held fixed throughout this
    insertion.
  The identity used to integrate (2.10) is the iterated Mecke formula #cite(label("Mecke1967"));
    its factorial form is stated in #cite(label("LastPenrose2017")) Theorem 4.4.
    We derive it here under the base Poisson law, with the pin weight retained inside the integrand.
    Write $lambda = mu \( X_Lambda \)$. For a fixed endpoint permutation, expand the Poisson measure as
  $ e^(- lambda) sum_(k = 0)^oo frac(1, k !) product_(j = 1)^k mu \( thin upright(d) u_j \) . $
  In the weighted sum over ordered distinct $n$-tuples, the $k$-mark term has $k ! \/ \( k - n \) !$ choices of
    the distinguished marks. Relabel them $u_1 \, dots.h \, u_n$ and sum the remaining $k - n$ marks.
    Averaging also over the independent endpoint permutations gives the exact identity
  $ & bb(E)_(upright(b))
    [w_D \( omega \) sum_(\( u_1 \, dots.h \, u_n \) in \( omega_(upright(m)) \)_eq.not^n) F \( u_1 \, dots.h \,
    u_n \)]\
 & #h(8mm)  = integral_(X_Lambda^n) F \( u_1 \, dots.h \, u_n \) bb(E)_(upright(b)) #h(-0.16667em)
   [w_D #h(-0.16667em) (omega + sum_(j = 1)^n delta_(u_j))] product_(j = 1)^n mu \( thin upright(d) u_j \) . $
  All terms are nonnegative, so this manipulation is justified also when an integral is infinite.
    By (2.10), the expectation inside the integral is at most $2^n Z_D$. Division by $Z_D$ proves (2.9). ◻
]

The estimate is unconditional under $bb(P)_D$. If an independent fresh Poisson family is also sampled,
  mixed lists of distinct actual and fresh marks satisfy the corresponding product bound:
  an actual mark contributes $2 mu$, and a fresh mark contributes $mu$.
  Indeed, fix which entries in the list come from each family,
  use independence to factor the two factorial measures, and apply Lemma 5 to the actual-mark factor.
  This observation will permit chronological path estimates after averaging over an exchange picture and fresh
  randomness; it makes no conditional factorial-domination assertion at a fixed path exposure.

We now have the exact spectral representation and a family of pin laws with controlled mark counts.
  The next section estimates the probability that many prescribed slot-time points simultaneously belong to cycles
  avoiding the existing pins.

== 3 A simultaneous pin test <sec:pin-test>

We relate the probability that many specified points lie on cycles missing the pins to a mean return probability
  after those points are pinned. The estimate uses the complete pin law, before any trajectories are exposed.

Fix a finite volume and a finite period $beta > 0$. Let $E$ be a finite pin set,
  or the union of a finite pin set with $D_0$, and let $T$ be a nonempty finite set of slot points at one time,
  disjoint from $E$. Put $m = \| T \|$ and $P = E union T$.
  For $i in T$, let $cal(R)_i \( E \, T \)$ be the event that the line started at $i$ reaches $T$ again,
  at strictly positive elapsed time, before it reaches $E$.
  The same sampled exchange picture is repeated when following this line through successive periods. Define

#[#set math.equation(numbering: n => "(3.1)")
 $ r = r \( E \, T \) := 1 / m sum_(i in T) bb(P)_P #scale(x: 120%, y: 120%)[\(] cal(R)_i \( E \, T \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:pin-return-fraction>]

Thus $0 lt.eq r lt.eq 1$. The positive elapsed-time convention excludes the starting point from the return test.

#thm([Proposition 3.1.])[
  (Simultaneous pin test).  #emph[For every finite volume, every $beta > 0$,
    every pin set $E$ that is finite or a finite set together with $D_0$,
    and every nonempty finite single-time set $T$ disjoint from $E$, the return fraction in (3.1) satisfies
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(P)_E \( T subset.eq cal(B)_E \) lt.eq \( 2 r \)^(\| T \|) . $ <eq:simultaneous-pin-test>]

]
] <prop:pin-test>

We first assume that $E$, and hence $P = E union T$, is finite.
  For each exchange picture, let $sigma$ be the permutation of $P$ that maps each pin to the next pin on its
  directed cycle, at strictly positive elapsed time. The random subset $sigma \( T \)$ has exactly $m$ elements.
  Its relation to the event we want to bound is

#[#set math.equation(numbering: n => "(3.3)")
 $ { T subset.eq cal(B)_E } = { sigma \( T \) = T } = { T subset.eq sigma \( T \) } . $ <eq:pin-event-equivalence>]

Indeed, if every cycle meeting $T$ avoids $E$, its successive pins all belong to $T$.
  Conversely, if $sigma \( T \) = T$, iterating $sigma$ from a point of $T$ visits every pin on that cycle without
  reaching $E$. The last equality uses $\| sigma \( T \) \| = \| T \|$.

The return fraction also has a subset interpretation:

#[#set math.equation(numbering: n => "(3.4)")
 $ m r = bb(E)_P \| T ∩ sigma \( T \) \| = sum_(j in T) bb(P)_P \( j in sigma \( T \) \) . $ <eq:pin-return-output>]

Bijectivity of $sigma$ makes the returning starting points and their outputs in $T$ have the same cardinality.
  We will prove stability of the subset generating polynomial $bb(E)_P product_(j in sigma \( T \))
  y_j$ and deduce that the probability of containing all of $T$ is at most the product of its presence
  probabilities. By (3.4) that product is at most $r^m$. A final comparison between the laws $bb(P)_E$ and
  $bb(P)_P$ supplies the factor $2^m$ in (3.2).

=== 3.1 The stability operations <the-stability-operations>

Write $bb(H) = { z in bb(C) : "Im" z > 0 }$. A nonzero polynomial in finitely many complex variables is
  #emph[stable] if it has no zero when every variable belongs to $bb(H)$.
  A polynomial is #emph[multiaffine] if its degree in each variable separately is at most one.

#thm([Lemma 3.2.])[
  (Closure operations).  #emph[For polynomials in a fixed finite set of variables the following operations
    preserve stability, with the possibility of producing the zero polynomial:
    coefficientwise limits with a common degree bound, specialization of a variable to a real number,
    and partial differentiation. Identifying two variables preserves stability.
    In particular, identifying two variables as $t$ and extracting the coefficient of $t$ preserves stability up
    to zero.]
] <lem:pin-stability-closure>

#proof[
  Let $F_n$ be stable polynomials of bounded degree converging coefficientwise to a nonzero polynomial $F$.
    If $F$ vanished at a point of a product of upper half-planes,
    choose a complex line through that point on which the restriction of $F$ is not identically zero.
    A sufficiently small disk in this line lies in the product of upper half-planes.
    The restrictions of $F_n$ converge uniformly on the disk.
    On a smaller circle avoiding the isolated zeros of the restriction of $F$,
    the argument principle (or Rouché’s theorem) forces $F_n$ to have a zero inside for large $n$.
    This is impossible. The existence of the line follows, for example,
    by choosing a direction where the first nonzero homogeneous term of the Taylor expansion of $F$ at the
    purported zero does not vanish.
  Specialization at $a in bb(R)$ is the limit of specialization at $a + upright(i) \/ n$,
    so the first assertion applies. Identification of variables is immediate from the definition.
  For differentiation in $t$, let $k$ be the degree of $F$ in $t$. The case $k = 0$ gives the zero polynomial.
    If $k gt.eq 1$, the leading coefficient is the nonzero coefficientwise limit
  $ lim_(R arrow.r oo) \( upright(i) R \)^(- k) F \( z_1 \, dots.h \, z_(n - 1) \, upright(i) R \) . $
  It is therefore stable. Consequently, after fixing all other variables in $bb(H)$,
    the resulting polynomial in $t$ still has degree $k$. Write its roots, with multiplicity, as $zeta_1 \,
    dots.h \, zeta_k$; each has imaginary part at most zero. For $t in bb(H)$,
  $ frac(partial_t F, F) = sum_(j = 1)^k frac(1, t - zeta_j) $
  has strictly negative imaginary part. It cannot vanish, proving stability of the derivative.
    Finally, taking the linear coefficient after identification is differentiation in $t$ followed by $t = 0$. ◻
]

The next operation is the partial-symmetrization principle in the stable-polynomial approach to negative
  dependence #cite(label("BorceaBrandenLiggett2009")) Theorem 4.20.
  For an elementary proof using complex bivariate sections,
  see also Liggett #cite(label("Liggett2009Distributional")) Section 5. We give the calculation in the form needed here.

#thm([Lemma 3.3.])[
  (Partial symmetrization).  #emph[Let $F$ be a stable multiaffine polynomial,
    let $tau$ exchange two of its variables, and let $0 lt.eq u lt.eq 1$.
    Then $\( 1 - u \) F + u tau F$ is stable and multiaffine.]
] <lem:pin-partial-symmetrization>

#proof[
  Fix every other variable in $bb(H)$ and write the two-variable section as
  $ q \( z \, w \) = a + b z + c w + e z w \, $
  where $a \, b \, c \, e$ can be complex. For every $z in bb(H)$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ N \( z \) := "Im" #scale(x: 120%, y: 120%)[\(] \( a + b z \) overline(\( c + e z \))
     #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <eq:pin-imaginary-criterion>]
  Indeed, if $c + e z eq.not 0$, the root $- \( a + b z \) \/ \( c + e z \)$ in the $w$ variable cannot belong to
    $bb(H)$; if $c + e z = 0$, the displayed quantity is zero. The swapped section $q \( w \, z \)$ is also stable, so
  $ N^tau \( z \) := "Im" #scale(x: 120%, y: 120%)[\(] \( a + c z \) overline(\( b + e z \))
    #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $
  Put $b_u = \( 1 - u \) b + u c$ and $c_u = \( 1 - u \) c + u b$. Direct expansion gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ "Im" #scale(x: 120%, y: 120%)[\(] \( a + b_u z \) overline(\( c_u + e z \))
     #scale(x: 120%, y: 120%)[\)] & = \( 1 - u \) N \( z \) + u N^tau \( z \) + u \( 1 - u \) \| b -
     c \|^2 "Im" z . $ <eq:pin-symmetrization-identity>]
  If $0 < u < 1$ and $b eq.not c$, the right-hand side is strictly positive.
    In particular $c_u + e z eq.not 0$, and the root in $w$ of the mixed section lies strictly below the real
    axis. If $u in { 0 \, 1 }$ or $b = c$, the section is the original section or its swap.
    These cases also exclude zeros in $bb(H)^2$. Since the other variables were arbitrary,
    the mixed polynomial is stable; multiaffinity is preserved directly. ◻
]

The complex coefficients in this proof matter: other variables have already been fixed in the upper half-plane.
  No reality assumption on those sections was used.

=== 3.2 Layering the exchange picture and removing unpinned points <layering-the-exchange-picture-and-removing-unpinned-points>

For a permutation $pi$ of a finite set $V$, define its polynomial

$ F_pi \( bold(x) \, bold(y) \) := product_(i in V) \( x_i + y_(pi \( i \)) \) . $

Each $x_i$ and each $y_i$ occurs with degree at most one.

#thm([Lemma 3.4.])[
  (Stable exchange symbols).  #emph[For a permutation obtained by a finite product of independent Bernoulli
    transpositions and deterministic permutations on a finite set $V$, the polynomial $bb(E) F_pi$ is stable.
    Here each Bernoulli transposition uses an arbitrary probability in $\[ 0 \, 1 \]$.
    The same conclusion holds for any limit of these permutation laws.]
  #emph[Every finite independent product of finite-time Poisson exchange permutations,
    uniform permutations on specified subsets of $V$, and deterministic permutations has such a limit representation.]
] <lem:pin-exchange-symbol>

#proof[
  For the identity permutation the polynomial is $product_(i in V) \( x_i + y_i \)$,
    a product of nonvanishing upper-half-plane sums. Composing the output with a transposition either leaves the
    polynomial unchanged or interchanges the corresponding two $y$ variables.
    Averaging an independent Bernoulli choice is precisely the operation in Lemma 8.
    Deterministic permutations only relabel variables. Repetition proves the first assertion.
    Convergence of permutation laws gives coefficientwise convergence of their symbols,
    whose degrees are bounded and whose value at all variables equal to $1$ is $2^(\| V \|)$.
    Lemma 7 therefore proves stability of every such limit, with zero excluded.
  For a finite-time Poisson exchange process, partition its time interval into slices of length at most $delta$.
    On each edge and slice record whether the Poisson clock has at least one mark;
    these indicators are independent Bernoulli variables. Apply the indicated transpositions in a fixed order
    within a slice. This coupled approximation agrees with the actual process whenever every slice has at most one
    mark in total. If the total rate is $lambda$ and the interval length is $t$,
    the probability of disagreement is at most $C lambda^2 \( t + delta \) delta$, which tends to zero.
    This constructs the required limit of Bernoulli-product laws.
  To approximate a uniform permutation on a subset $A subset.eq V$,
    run Poisson transpositions at positive rates on every pair in $A$.
    For $\| A \| lt.eq 1$ there is nothing to prove. Otherwise the unit-time transition matrix on the finite group
    of permutations of $A$ has all entries positive: every target permutation is a finite word in these
    transpositions, and that word can occur in the prescribed order within unit time with no other marks.
    The uniform distribution is invariant, since each step is multiplication by a random group element.
    If the group has $M$ elements and the minimum transition entry is $eta > 0$,
    the transition matrix has a common uniform part of mass $M eta$.
    Splitting off that part shows that distance from the uniform law contracts by at most $1 -
    M eta$ at each unit step (and is already zero if $M eta = 1$).
    Hence the law converges to uniform as time tends to infinity.
    At each finite time the small-slice construction gives a Bernoulli-product approximation.
    Taking a sequence with both errors tending to zero proves the asserted representation of the uniform law.
    For a finite independent product, approximate its factors independently;
    their product laws then converge to the desired product law. ◻
]

Now assume $P = E union T$ is finite. Cut the time circle at every time represented in $P$,
  and include the time $0$ cut if necessary. Let $V$ be the disjoint union of a copy of $V_Lambda$ at every cut.
  Assign an endpoint permutation to the interval ending at time $0$,
  so that this cut has the post-completion convention. Following a line from one cut to the next defines a
  permutation $pi$ of $V$. Its cycles are exactly the cycles of the exchange picture,
  with the cut points inserted as vertices.

The random interval bijections are independent. Moreover,
  the $x$ variables on an interval’s starting layer and the $y$ variables on its ending layer are disjoint from
  the variable sets used by all other intervals. Consequently

#[#set math.equation(numbering: n => "(3.7)")
 $ F_V \( bold(x) \, bold(y) \) := bb(E)_(upright(b)) product_(i in V) \( x_i + y_(pi \( i \)) \)
   $ <eq:pin-layered-symbol>]

is the product of the stable interval symbols of Lemma 9, with cyclic relabeling of their output variables.
  It is therefore stable. This also covers a single cut, where there is just one interval wrapping around the circle.

The next-pin permutation $sigma$ is obtained from this layered permutation by following its cycles between
  successive points of $P$. Let $n_P \( pi \)$ denote the number of cycles of $pi$ missing $P$.

#thm([Lemma 3.5.])[
  (Splicing and output extraction).  #emph[Starting from (3.7), eliminate each $q in V \\ P$ by setting $x_q =
    y_q = t$ and extracting the coefficient of $t$. The resulting nonzero stable polynomial is
#[#set math.equation(numbering: n => "(3.8)")
 $ F_P \( bold(x) \, bold(y) \) =
   bb(E)_(upright(b)) [2^(n_P \( pi \)) product_(i in P) \( x_i + y_(sigma \( i \)) \)] . $ <eq:pin-spliced-symbol>]

 If $T subset.eq P$, then the probability generating polynomial of the random subset $sigma \( T \)$ under
   $bb(P)_P$ is stable. More precisely, with $Z_P = bb(E)_(upright(b)) 2^(n_P \( pi \)) > 0$, it is
#[#set math.equation(numbering: n => "(3.9)")
 $ G_T \( bold(y) \) := bb(E)_P product_(i in T) y_(sigma \( i \)) = 1 /
   Z_P (product_(i in P \\ T) partial_(x_i)) F_P \( bold(x) \, bold(y) \)\|_(x_i = 0 med \( i in P \)) .
   $ <eq:pin-all-x-zero>]

]
] <lem:pin-splicing>

#proof[
  Consider first one deterministic permutation. If $q$ is not a fixed point, write $i = pi^(- 1) \( q \)$ and $j =
    pi \( q \)$; the two factors involving $y_q$ and $x_q$ become
  $ \( x_i + t \) \( t + y_j \) . $
  Their linear coefficient is $x_i + y_j$. Thus deleting $q$ splices the directed edges $i arrow.r q arrow.r
    j$ into $i arrow.r j$. This includes a two-cycle, for which $i = j$.
    If $q$ is a fixed point, its factor is $x_q + y_q = 2 t$, giving a factor $2$.
    Successive deletion leaves the next-pin permutation on every cycle meeting $P$.
    A cycle missing $P$ eventually becomes a fixed point and contributes exactly one factor $2$.
    Linearity gives (3.8); Lemma 7 gives stability up to zero.
    Its nonnegative coefficients and positive value at all surviving variables equal to $1$ exclude zero.
  In each product on the right of (3.8), differentiation in $x_i$, $i in P \\ T$,
    selects the $x_i$ term from exactly those factors. Setting #emph[every] remaining $x$ variable to zero,
    including those indexed by $T$, selects $y_(sigma \( i \))$ from each remaining factor.
    Division by $Z_P$ gives (3.9). Derivatives and real specialization preserve stability up to zero;
    $G_T \( bold(1) \) = 1$ excludes zero. Since $sigma$ is a permutation,
    the product contains $m = \| T \|$ distinct $y$ variables,
    so this is indeed a multiaffine subset generating polynomial with nonnegative coefficients. ◻
]

We have now encoded the outputs of $T$ under the correct pin weight.
  The next lemma turns stability of this particular generating polynomial into the simultaneous return bound.
  This is the subset-presence consequence of the strongly Rayleigh framework
  #cite(label("BorceaBrandenLiggett2009")) Theorem 4.9; the short conditional covariance argument below proves
  exactly what is required.

=== 3.3 Covariance, normalization, and the dense-boundary limit <covariance-normalization-and-the-dense-boundary-limit>

#thm([Lemma 3.6.])[
  (Presence probabilities).  #emph[Let $A$ be a random subset of a finite set $I$.
    Suppose its generating polynomial $G \( bold(y) \) = bb(E) product_(j in A) y_j$ is stable.
    For every $J subset.eq I$,
#[#set math.equation(numbering: n => "(3.10)")
 $ Pr \( J subset.eq A \) lt.eq product_(j in J) Pr \( j in A \) . $ <eq:pin-presence-product>]

 The same assertion holds after conditioning on $B subset.eq A$, whenever that event has positive probability,
   for subsets of $I \\ B$.]
] <lem:pin-presence>

#proof[
  Write $X_j = upright(bold(1))_({ j in A })$. Conditioning on $B subset.eq A$ gives,
    for the indicators outside $B$, the generating polynomial
  $ frac((product_(j in B) partial_(y_j)) G \( bold(y) \)\|_(y_j = 1 med \( j in B \)), Pr \( B subset.eq A \)) . $
  It is nonzero and stable by Lemma 7. Under this conditional law, keep only two variables $z \,
    w$ and specialize all others to $1$. The resulting stable polynomial has the form $a + b z + c w + e z w$,
    where $a \, b \, c \, e gt.eq 0$ and $a + b + c + e = 1$. Applying (3.5) with real coefficients gives
  $ 0 lt.eq "Im" #scale(x: 120%, y: 120%)[\(] \( a + b z \) overline(\( c + e z \))
    #scale(x: 120%, y: 120%)[\)] = \( b c - a e \) "Im" z . $
  Thus $b c gt.eq a e$. The covariance of the corresponding presence indicators equals
  $ e - \( b + e \) \( c + e \) = a e - b c lt.eq 0 . $
  Whenever the second indicator has positive probability of being one,
    conditioning it to be one therefore cannot increase the probability that the first is one.
  Order $J = { j_1 \, dots.h \, j_k }$. If any prefix-presence event has probability zero, (3.10) is immediate.
    Otherwise, for each $h$, remove the conditions $X_(j_(h - 1)) = 1 \, dots.h \, X_(j_1) = 1$ one at a time.
    The preceding conditional covariance inequality gives
  $ Pr #scale(x: 120%, y: 120%)[\(] X_(j_h) = 1 divides X_(j_1) = dots.h.c = X_(j_(h - 1)) =
    1 #scale(x: 120%, y: 120%)[\)] lt.eq Pr \( X_(j_h) = 1 \) . $
  Multiplying the conditional probabilities proves (3.10). Applying the same argument to the conditional
    generating polynomial proves the final assertion. ◻
]

#proof[
  Suppose first that $E$ is finite, and use the layered construction above with $P = E union T$.
    By Lemmas 10 and 11, followed by the arithmetic–geometric mean inequality and (3.4),
  #[#set math.equation(numbering: n => "(3.11)")
   $ bb(P)_P #scale(x: 120%, y: 120%)[\(] T subset.eq sigma \( T \) #scale(x: 120%, y: 120%)[\)] lt.eq
     product_(j in T) bb(P)_P \( j in sigma \( T \) \) lt.eq r^m . $ <eq:pin-return-product>]
  If one of the factors is zero this conclusion is interpreted directly;
    no conditioning on a zero-probability event is needed.
  By (3.3), the event on the left is $H = { T subset.eq cal(B)_E }$.
    It remains to compare its probability under the two pin laws.
  For clarity, write $w_D = 2^(n_D)$, where $n_D$ is the number of cycles missing $D$, and $Z_D =
    bb(E)_(upright(b)) w_D$. Deleting the $m$ pins in $T$ changes the number of unpinned cycles by the number of
    cycles that meet $T$ but miss $E$. That number lies between $0$ and $m$. Hence, picture by picture,
  $ w_P lt.eq w_E lt.eq 2^m w_P \, wide Z_E gt.eq Z_P > 0 . $
  We obtain
  $ bb(P)_E \( H \) = frac(bb(E)_(upright(b)) \( upright(bold(1))_H w_E \), Z_E) lt.eq 2^m Z_P /
    Z_E bb(P)_P \( H \) lt.eq 2^m r^m . $
  This proves the finite-pin case with the required normalization.
  Finally let $E = F union D_0$ with $F$ finite. Choose increasing finite sets of boundary cuts with dense union,
    and let $D_(0 \, n)$ contain all boundary slots at those cuts.
    Put $E_n = F union D_(0 \, n)$ and $P_n = E_n union T$. Then $E_n$ and $T$ are disjoint and the finite-pin
    inequality applies. As in Lemma 4, almost every picture has finitely many marks,
    and every boundary visit contains an interval of positive duration.
    Thus every boundary-touching cycle is eventually detected, and
  $ w_(E_n) arrow.r w_E \, wide w_(P_n) arrow.r w_P \, wide
    upright(bold(1))_({ T subset.eq cal(B)_(E_n) }) arrow.r upright(bold(1))_({ T subset.eq cal(B)_E }) . $
  The weights are bounded by $2^(\| V_Lambda \|)$ in this fixed volume, and all their normalizers are positive,
    so the corresponding normalized probabilities converge by dominated convergence.
  The same reasoning applies to the return test, with a useful finite horizon.
    Starting from $i in T$, follow the uncensored line until its first positive return to $T$.
    This time is finite, since the line eventually returns to $i$ on its finite permutation cycle.
    If the line meets $F$ before that return, every finite-cut test fails.
    If it first meets the boundary before that return, one of its positive-duration boundary visits before the
    return contains a cut from the dense union, so all sufficiently fine tests fail.
    If it meets neither, every test succeeds. Since $T$ is disjoint from $D_0$,
    a boundary visit cannot first occur only at the return point. Consequently, for every $i in T$,
  $ upright(bold(1))_(cal(R)_i \( E_n \, T \)) arrow.r upright(bold(1))_(cal(R)_i \( E \, T \)) quad
    upright("almost surely") . $
  Bounded convergence with the weights $w_(P_n)$ now gives $r \( E_n \, T \) arrow.r r \( E \, T \)$.
    Taking limits in $bb(P)_(E_n) \( T subset.eq cal(B)_(E_n) \)
    lt.eq \( 2 r \( E_n \, T \) \)^m$ proves (3.2) for continuous boundary pins.
    Only scalar probabilities and bounded weights are passed to this limit;
    no polynomial with infinitely many variables is required. ◻
]

== 4 Exposed paths and a one-particle return identity <sec:exposure>

The simultaneous test in Proposition 6 reduces the probability of many pin-free points to an expected fraction of
  returns. Our objective here is to express that first moment through a Markov walk.
  We first describe the conditional exchange picture after all pin-free cycles have been exposed.
  A determinant identity then removes the remaining cycle condition from the first moment.
  Finally, we relate the return probability to the loss of a quadratic form under one period of the walk.

Throughout this Section, the volume and period are finite.
  Let $E = D_0 union E_(upright(f))$, where $E_(upright(f))$ is a finite set of slot-time points.
  Let $T$ be a nonempty set of $m$ distinct slot points at one time $theta$, disjoint from $E$, and put $P =
  E union T$. Under $bb(P)_P$, let

#[#set math.equation(numbering: n => "(4.1)")
 $ r = 1 / m sum_(i in T) bb(P)_P #scale(x: 120%, y: 120%)[\(] upright("the next point of ") P upright(" after ")
   i upright(" belongs to ") T #scale(x: 120%, y: 120%)[\)] . $ <eq:exposure-r>]

“After” always means at strictly positive elapsed time. In particular,
  a return to the same slot point after one or more periods counts.

=== 4.1 Conditional exchanges on the unexposed slots <conditional-exchanges-on-the-unexposed-slots>

Label every line by its slot at time $0$, immediately after the within-site completion.
  The one-period endpoint permutation sends these labels to their slots at the next time $0$.
  Expose the initial labels on cycles missing $P$, their trajectories over one period,
  and their endpoint mappings. Write $cal(H)$ for the sigma-field generated by these data and $upright(bold(a))$
  for an exposure. At time $t$, let $H_t \( upright(bold(a)) \)$ be the set of slots not occupied by an exposed
  label. We call these slots #emph[holes]. All pins are holes at their respective times;
  in particular every boundary slot is a hole throughout the period.

The histories are finite-jump paths on a finite state space, together with finite endpoint data.
  Their spaces, and the finite disjoint union over possible exposed initial sets, are standard Borel spaces.
  Thus the conditional laws below can be taken as regular conditional probabilities.
  Equalities of such laws are always asserted almost surely for the specified outer measure.

For a fixed exposure $upright(bold(a))$, define a probability law $bb(Q)_(upright(bold(a)))$ on the remaining
  exchange picture as follows. Independently put rate-$1 \/
  2$ Poisson exchanges on each slot edge during the time intervals when both endpoints are holes.
  At a jump of an exposed label from a slot to a hole, transport the hole in the opposite direction,
  into the vacated slot. This is a prescribed bijection between the hole sets just before and just after that
  jump. A swap of two exposed labels leaves the holes unchanged.
  At the end of the period, complete the revealed within-site mappings by independent uniform bijections of the
  remaining slots at each site. The hole sets and the forced transports are fixed by $upright(bold(a))$;
  the Poisson exchanges and the completions are the randomness in $bb(Q)_(upright(bold(a)))$.

Let $G_P$ be the event that every cycle of this remaining picture meets $P$, and define

#[#set math.equation(numbering: n => "(4.2)")
 $ g_P \( upright(bold(a)) \) = bb(Q)_(upright(bold(a))) \( G_P \) . $ <eq:exposure-g>]

The set of exposed labels is selected by the condition that their cycles miss $P$.
  To compute its law, we first follow a deterministic label set $A$ under the base law.
  Requiring those labels to close among themselves and avoid $P$, and every complementary cycle to meet $P$,
  then selects exactly one $A$ in each complete picture. The next proposition sums these disjoint possibilities
  and records both the conditional law and the exposure marginal used in later averages.

#thm([Proposition 4.1.])[
  (Exposed-path disintegration).  #emph[For $P$ as above, the conditional law of the unexposed picture given
    $cal(H)$ under $bb(P)_P$ is $bb(Q)_(upright(bold(a))) \( thin dot.op divides G_P \)$,
    and $g_P \( upright(bold(a)) \) > 0$ for almost every exposure under this pin law.]
  #emph[More precisely, fix a deterministic initial label set $A subset.eq V_Lambda$,
    and let $mu_A$ be the distribution under $bb(P)_(upright(b))$ of the histories and endpoint mappings of these
    labels. Let $F_A$ mean that their endpoint set is $A$ and their paths avoid $P$.
    On $F_A$, let $c_A \( upright(bold(a)) \)$ be the number of cycles in their endpoint permutation.
    If $Z_P$ is the normalizer defining $bb(P)_P$, then for every bounded measurable function $Phi$ of the
    exposure and remaining picture,
#[#set math.equation(numbering: n => "(4.3)")
 $ & bb(E)_P Phi \( upright(bold(a)) \, omega_(upright(h)) \)\
 & quad = 1 / Z_P sum_(A subset.eq V_Lambda) integral_(F_A) 2^(c_A \( upright(bold(a)) \)) thin
   bb(E)_(bb(Q)_(upright(bold(a)))) \[ upright(bold(1))_(G_P) Phi \( upright(bold(a)) \, omega_(upright(h)) \) \]
   thin mu_A \( thin upright(d) upright(bold(a)) \) . $ <eq:exposure-disintegration>]

 Consequently, the exposure marginal on the $A$-branch is
#[#set math.equation(numbering: n => "(4.4)")
 $ 1 / Z_P upright(bold(1))_(F_A) \( upright(bold(a)) \) 2^(c_A \( upright(bold(a)) \)) g_P \( upright(bold(a)) \)
   thin mu_A \( thin upright(d) upright(bold(a)) \) . $ <eq:exposure-outer-law>]

 The same conclusions hold with $P$ any finite deterministic pin set.]
] <prop:exposure>

#proof[
  We first fix $A$ under the base law and verify the conditional construction before imposing any cycle condition.
    For each slot edge $e$, take two independent rate-$1 \/ 2$ Poisson clocks $N_e^(\( 1 \)) \, N_e^(\( 2 \))$,
    all independent across edges. Accept a mark of $N_e^(\( 1 \))$ exactly when at least one endpoint contains an
    $A$-label immediately before it. Accept a mark of $N_e^(\( 2 \))$ exactly when neither endpoint contains an
    $A$-label.
  This construction has the base exchange law. To see this directly, if there are $b$ slot edges,
    the superposed clock has rate $b$, and its next mark has an independent uniform type among the $2 b$ clocks.
    For each edge exactly one of its two types is accepted, whatever the past configuration.
    Thus, conditionally on the past, the next superposed mark is accepted on any specified edge with probability
    $1 \/ \( 2 b \)$, and is rejected with probability $1 \/ 2$.
    Iterated conditioning shows that these accepted-edge or rejection outcomes have the fixed product distribution
    and are independent of the superposed waiting times. Poisson splitting therefore yields independent rate-$1 \/
    2$ accepted processes on the edges. If there are no edges the assertion is immediate.
  The motions of the $A$-labels before the endpoint permutations use only the first clock family:
    second-family marks always exchange two other labels. At each site,
    condition a uniform endpoint permutation on its images of the $A$-labels that are there just before the
    endpoint. Each bijection between the remaining source and target slots has the same number, namely one,
    of extensions with those prescribed images. The conditional completion is therefore uniform.
    Completions at different sites remain independent, since the endpoint permutations were independent and each
    revealed restriction concerns its own site.
  It follows that the full specified histories, including endpoint images,
    are determined by the first clock family and these revealed restrictions,
    without using the second family or the remaining completions.
    More explicitly, the pre-completion locations of the $A$-labels depend only on the first clock family.
    The endpoint permutations are independent of both clock families,
    so conditioning on these locations and the selected endpoint images leaves the second clock family
    independent. Conditional on each revealed source and target restriction,
    the remaining bijection is uniform over its allowed completions.
    Conditional on the histories, the second-family clocks are still independent Poisson clocks.
    Restricting them to the now fixed intervals with two hole endpoints gives the independent exchanges in
    $bb(Q)_(upright(bold(a)))$. The cross jumps and the remaining endpoint completions give exactly its other
    prescribed operations. Although conditioning on histories may leave unobserved first-family marks,
    those marks are rejected whenever they have two hole endpoints and cannot affect the remaining picture.
    This proves the claimed base conditional kernel on $F_A$.
  On $F_A$, the labels of $A$ form a union of whole time cycles missing $P$.
    Their number is $c_A \( upright(bold(a)) \)$, which is determined by the endpoint mapping of $A$.
    Requiring in addition that every remaining cycle hit $P$ makes $A$ exactly the initial labels of all the
    missing cycles. Therefore for each base picture exactly one initial set satisfies both requirements.
    If $n_P$ is the number of cycles missing $P$, the pointwise identity is
  #[#set math.equation(numbering: n => "(4.5)")
   $ 2^(n_P) = sum_(A subset.eq V_Lambda) upright(bold(1))_(F_A) thin 2^(c_A) thin upright(bold(1))_(G_P) \,
     $ <eq:exposure-branch-identity>]
  where each summand is defined as zero off $F_A$. Apply the base conditional kernel on each branch of this finite
    sum. Dividing by $Z_P = bb(E)_(upright(b)) 2^(n_P)$ gives (4.3).
    Integrating the remaining picture gives (4.4). Exposures with $g_P \( upright(bold(a)) \) =
    0$ consequently have zero outer measure; on its positive set,
    division by $g_P \( upright(bold(a)) \)$ gives the asserted conditional law.
  For finite pins the same argument applies without change.
    For pins including $D_0$, avoidance of the boundary is a measurable property of the finite-jump histories.
    Thus the argument applies directly to that case as well. ◻
]

Only the independent law $bb(Q)_(upright(bold(a)))$ will enter the linear-algebra calculation below.
  Conditioning it on $G_P$ may destroy the exterior-moment identity for the original layered permutation.
  The factor $g_P \( upright(bold(a)) \)$ in (4.4) also remains present when those conditional first moments are
  subsequently averaged under $bb(P)_P$.

=== 4.2 An exterior-power identity and all-hit conditioning <an-exterior-power-identity-and-all-hit-conditioning>

If $M$ is a matrix on a finite set $V$, write $and.big^k M$ for its action on the $k$-th exterior power;
  its entries are the $k$-row, $k$-column minors of $M$, with respect to the chosen ordering of $V$.
  The convention is $and.big^0 M = 1$. Permutation matrices are column-forward: $Pi e_i = e_(pi \( i \))$.

The all-minors identity below is the determinant-preserving property studied by Dereziński,
  Liang and Mahoney #cite(label("DerezinskiLiangMahoney2020")) Definition 4, Example 2, and Lemma 4.
  Their rank-one example and closure under independent sums and products give the finite-product case below.
  We include the rank-one argument and the passage to the exchange law needed here.

#thm([Lemma 4.2.])[
  (Exterior moments before conditioning).  #emph[Let $Pi$ be a random permutation matrix on a finite set $V$.
    Suppose its law is a limit of laws of finite products of independent Bernoulli transpositions and
    deterministic permutations. Here a Bernoulli transposition equals a fixed transposition with an arbitrary
    probability $u in \[ 0 \, 1 \]$, and equals the identity otherwise. Then, writing $K = bb(E) Pi$,
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] and.big^k Pi #scale(x: 120%, y: 120%)[\]] =
   and.big^k K wide \( 0 lt.eq k lt.eq \| V \| \) . $ <eq:exterior-moments>]

]
  #emph[In particular, fix an exposure from Proposition 12 and finitely many time cuts.
    Under $bb(Q)_(upright(bold(a)))$, the permutation on the disjoint union of the hole layers,
    obtained by following each hole from a cut to the next cyclic cut, satisfies (4.6).]
] <lem:exterior>

#proof[
  If $T_(i j)$ transposes two coordinates, then
  $ T_(i j) - I = - \( e_i - e_j \) \( e_i - e_j \)^(*) . $
  Every minor of $I + u \( T_(i j) - I \)$ is affine in $u$:
    a term using two columns of the rank-one perturbation has determinant zero. Therefore
  $ and.big^k \( \( 1 - u \) I + u T_(i j) \) = \( 1 - u \) and.big^k I + u and.big^k T_(i j) . $
  This is (4.6) for one Bernoulli transposition. For independent factors $A \, B$ satisfying the identity,
  $ bb(E) and.big^k \( A B \) = bb(E) and.big^k A thin bb(E) and.big^k B = and.big^k \( bb(E) A thin bb(E) B \) =
    and.big^k bb(E) \( A B \) . $
  Deterministic permutations satisfy the identity as well, so induction proves it for finite products.
    All the matrix entries and minors are bounded continuous functions on the finite permutation space,
    which proves passage to limits.
  We verify the limit representation for the hole picture. Between successive exposed jumps and endpoint times,
    the hole set is fixed and the available exchanges have constant rates.
    Their permutation law has the Bernoulli-product approximation proved in Lemma 9.
    The forced transports are deterministic bijections between equally sized hole sets.
  The same lemma supplies this approximation for every uniform completion.
    When its source and target slot sets differ, precede or follow a uniform permutation of one fixed set by a
    deterministic bijection.
  For completeness, the layered permutation has the same product structure.
    The total number of holes is constant, so identify every cut layer with one fixed set of that size.
    The independent interval maps act on separate layer blocks; their direct sum,
    followed by the fixed cyclic shift of the layers, is the layered permutation.
    Each random operation within a block is a transposition on the full layered set,
    and each fixed transport is a permutation there. Independence of exchanges on disjoint intervals and of the
    completions proves the required representation. ◻
]

The return test allows a line started in $T$ to reach a different point of $T$.
  If $Sigma$ is the column-forward matrix of a next-pin permutation on a finite pin set containing $T$,
  its number of returns from $T$ to $T$ is $sum_(i \, j in T) Sigma_(j i)$, rather than its trace.
  A diagonal-only first-moment identity would therefore not suffice.
  The following finite-dimensional statement recovers every entry of the mean by allowing an arbitrary matrix $W$.

#thm([Proposition 4.3.])[
  (Conditional next-pin first moment).  #emph[Let $V = J union.sq Q$ be a finite set with $J eq.not diameter$.
    Let $Pi$ be a random permutation matrix satisfying (4.6), and put $K = bb(E) Pi$.
    Let $G_J$ be the event that every cycle of $Pi$ meets $J$.
    On $G_J$, let $Sigma$ be the column-forward permutation matrix of the next visit to $J$ at positive time along
    the cycles. Then
#[#set math.equation(numbering: n => "(4.7)")
 $ bb(P) \( G_J \) = det \( I - K_(Q Q) \) . $ <eq:all-hit-determinant>]

 If this probability is positive, $K_(Q Q)$ is transient and
#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E) \[ Sigma divides G_J \] = H := K_(J J) + K_(J Q) \( I - K_(Q Q) \)^(- 1) K_(Q J) .
   $ <eq:conditional-first-moment>]

 The matrix $H$ is the first positive $J$-hitting kernel for the Markov chain with transition matrix $K$,
   using independent transitions on successive steps. More strongly, for every complex $J times J$ matrix $W$,
#[#set math.equation(numbering: n => "(4.9)")
 $ bb(E) \[ det \( I - W Sigma \) divides G_J \] = det \( I - W H \) . $ <eq:arbitrary-W>]

 An empty $Q$ is allowed, with determinant of the empty matrix equal to one and the Schur correction in (4.8)
   equal to zero.]
] <prop:first-moment>

For time-homogeneous interchange with a single pin, $G_J$ is the event that the sampled permutation consists of
  one cycle. In that setting, (4.7) is equivalent to the single-cycle formula of Alon and Kozma
  #cite(label("AlonKozma2013LongCycles")) Theorem 1.

#proof[
  For a fixed matrix $D$, the principal-minor expansion and multiplicativity of exterior powers give
  $ bb(E) det \( I - D Pi \) & = sum_(k = 0)^(\| V \|) \( - 1 \)^k "Tr" (and.big^k D thin bb(E) and.big^k Pi)\
 & = det \( I - D K \) . $
  Take $D = "diag" \( W \, I_Q \)$. If a permutation cycle lies entirely in $Q$, its indicator vector $v$,
    extended by zero on $J$, satisfies $D Pi v = v$, even for arbitrary $W$.
    Thus the determinant on that picture is zero. On $G_J$, $Pi_(Q Q)$ is nilpotent:
    a sufficiently long path confined to $Q$ would contain a cycle there.
    Its inverse resolvent is a finite sum, and block elimination gives
  $ det \( I - D Pi \) & =
    det \( I - Pi_(Q Q) \) thin det (I - W [Pi_(J J) + Pi_(J Q) \( I - Pi_(Q Q) \)^(- 1) Pi_(Q J)])\
 & = det \( I - W Sigma \) . $
  Here $det \( I - Pi_(Q Q) \) = 1$, and each term of the resolvent follows the permutation through a specified
    number of intermediate nonpins. Consequently the preceding determinant identity reads
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E) \[ upright(bold(1))_(G_J) det \( I - W Sigma \) \] =
     det mat(delim: "(", I - W K_(J J), - W K_(J Q); - K_(Q J), I - K_(Q Q)) . $ <eq:determinant-before-division>]
  At $W = 0$, this proves (4.7) without any invertibility assumption.
    If its value is positive, $I - K_(Q Q)$ is invertible. The Schur complement on the right of (4.10),
    followed by division by that positive determinant, gives (4.9).
  To extract the first moment, use $det \( I - t W A \) = 1 - t "Tr" \( W A \) + O \( t^2 \)$.
    The linear terms in (4.9) yield
  $ "Tr" #scale(x: 120%, y: 120%)[\(] W bb(E) \[ Sigma divides G_J \] #scale(x: 120%, y: 120%)[\)] =
    "Tr" \( W H \) wide upright("for every ") W . $
  Taking the matrix units for $W$ gives each entry of (4.8).
  Finally, $K$ is nonnegative and doubly stochastic, as the mean of permutation matrices.
    Its restriction $K_(Q Q)$ is substochastic. If a state in $Q$ could not reach $J$ by any positive-probability
    path, its reachable set would be a nonempty closed subset of $Q$.
    The restriction to that set would have column sums one and eigenvalue one, forcing $I -
    K_(Q Q)$ to be singular. Therefore every state in $Q$ has a positive path to $J$.
    Since there are finitely many states, some integer $n$ and number $epsilon >
    0$ make the probability of leaving $Q$ within $n$ steps at least $epsilon$,
    uniformly over starting states in $Q$. It follows that
  $ parallel K_(Q Q)^(k n) parallel_(1 arrow.r 1) lt.eq \( 1 - epsilon \)^k \, wide \( I - K_(Q Q) \)^(- 1) =
    sum_(j = 0)^oo K_(Q Q)^j . $
  The first term of $H$ records a direct next-step hit of $J$,
    and the term $K_(J Q) K_(Q Q)^j K_(Q J)$ records a first hit after $j + 1$ intervening steps in $Q$.
    This proves its Markov interpretation and completes the proof. ◻
]

We have now identified the conditional first moment at a finite set of cuts.
  In the hole construction, each application of $K$ in this Markov interpretation resamples the relevant interval
  transition. It does not follow a single sampled permutation repeatedly.
  This distinction permits the return calculation to use one-particle heat flow in the fixed exposed environment.
  Figure 1 summarizes the finite-cut reduction and the two probability laws it distinguishes.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.623cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Unconditioned hole picture $bb(Q)_( bold(a) )$#linebreak()$K= bb(E)_( bb(Q)_( bold(a) )) Pi$]]])])
  content((7, 0), [#box(width: 5.623cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Conditioned hole picture#linebreak()$bb(Q)_( bold(a) )(thin dot.op divides G_J)$]]])])
  content((0, -2.6), [#box(width: 5.623cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Markov walk with transition $K$#linebreak()First positive $J$-hitting kernel]]])])
  content((7, -2.6), [#box(width: 5.623cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Conditional next-pin mean#linebreak()$bb(E) [ Sigma divides G_J]$]]])])
  line((2.812, 0), (4.188, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((3.5, 0), [#text(size: 9pt)[condition#linebreak()on $G_J$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.65), (0, -1.95), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((0, -1.3), [#text(size: 9pt)[retain the#linebreak()one-step mean]], anchor: "east", padding: 0.1176cm)
  line((7, -0.65), (7, -1.95), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: ">"))
  content((7, -1.3), [#text(size: 9pt)[retain the#linebreak()next-pin mean]], anchor: "west", padding: 0.1176cm)
  line((2.812, -2.6), (4.188, -2.6), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (start: "<", end: ">"))
  content((3.5, -2.6), [#text(size: 9pt)[equal#linebreak()kernels]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The first-moment reduction at a fixed exposure and a finite set $J$ of pins on selected time cuts, with $bb(Q)_(upright(bold(a))) \( G_J \) > 0$. The exterior-moment identity is used for the unconditioned law in the upper-left box; Proposition 14 proves that the two routes to the lower-right box agree. The lower-left walk resamples its transitions, whereas the upper-right law follows a single sampled permutation. The equality concerns the next-pin mean and does not identify these two path laws. When the exposure is averaged, its actual marginal still contains the factor $g_P \( upright(bold(a)) \)$ in (4.4). ],
) <fig:exposure-first-moment>

=== 4.3 Fresh turns and continuous boundary pins <fresh-turns-and-continuous-boundary-pins>

Given an exposure $upright(bold(a))$ with $g_P \( upright(bold(a)) \) > 0$,
  define the #emph[fresh-turn walk] on holes as follows. Repeat periodically the hole sets, forced transports,
  and revealed endpoint restrictions. Between those prescribed changes,
  the walk jumps across every available slot edge at rate $1 \/ 2$.
  At a forced transport it follows that transport; at an endpoint completion it uses an independent uniform
  completion at the current site. Use fresh Poisson exchanges and completion choices in each turn.
  These prescriptions define a time-inhomogeneous Markov walk.
  On every bounded time interval it has finitely many jumps almost surely.
  For a starting point $i in T$, write $tau_T^(+)$ for its first strictly positive visit to $T$,
  and $tau_E$ for its first visit to $E$, allowing infinite hitting times.

#thm([Lemma 4.4.])[
  (Return identity with boundary pins).  #emph[For $bb(P)_P$-almost every exposure and every $i in T$,
#[#set math.equation(numbering: n => "(4.11)")
 $ bb(P)_P #scale(x: 120%, y: 120%)[\(] upright("next pin after ") i upright(" lies in ") T divides cal(H)
   #scale(x: 120%, y: 120%)[\)] = bb(P)_(upright(bold(a)))^(upright("walk")) \( tau_T^(+) < tau_E \) .
   $ <eq:fresh-return-identity>]

 In particular the first moment in (4.1) is the $bb(P)_P$-average of the corresponding fresh-turn return
   probabilities in the exposed environment.]
] <lem:exposure-dense-return>

#proof[
  Fix an exposure for which Proposition 12 holds and $g_P \( upright(bold(a)) \) > 0$.
    Choose increasing finite deterministic time sets $cal(T)_n$ with dense union,
    and let $D_(0 \, n)$ contain all boundary slots at the times in $cal(T)_n$. Put
  $ E_n = E_(upright(f)) union D_(0 \, n) \, wide P_n = E_n union T . $
  The cuts used below include all times occurring in $P_n$, as well as time $0$ if necessary.
    An extra unpinned cut merely subdivides an interval and does not change which cycles hit $P_n$.
  Under $bb(Q)_(upright(bold(a)))$, let $G_n$ be the event that all hole cycles meet $P_n$, and set $g_n =
    bb(Q)_(upright(bold(a))) \( G_n \)$. The events $G_n$ increase.
    Almost surely the one-period hole picture has only finitely many random exchanges,
    in addition to the finitely many prescribed changes. Its spatial visits have positive residence time:
    independent Poisson jumps do not coincide with any prescribed change,
    and within-site completions do not change the site. The exposed histories avoid $D_0$,
    so their cross jumps cannot create an instantaneous boundary excursion either.
    Every boundary visit by a hole cycle is therefore detected by some cut in the dense union.
    There are finitely many cycles, whence
  #[#set math.equation(numbering: n => "(4.12)")
   $ upright(bold(1))_(G_n) arrow.t upright(bold(1))_(G_P) quad
     bb(Q)_(upright(bold(a))) upright("-almost surely") \, wide
     g_n arrow.t g_P \( upright(bold(a)) \) > 0 . $ <eq:dense-all-hit-limit>]
  In particular, $g_n > 0$ for all sufficiently large $n$. No invertibility is required for the earlier indices.
  For such an $n$, Lemma 13 applies to the unconditioned layered hole permutation.
    With $J = P_n$, Proposition 14 identifies each next-pin probability under
    $bb(Q)_(upright(bold(a))) \( thin dot.op divides G_n \)$ with the corresponding first-hit probability for its
    matrix $K$. The latter is precisely the walk just defined, observed at the finitely many cuts:
    interval choices are independent, including on later passes through the same interval.
    Thus, if $A_n$ is the event in a fixed hole picture that the next $P_n$-pin after $i$ belongs to $T$,
  #[#set math.equation(numbering: n => "(4.13)")
   $ frac(bb(Q)_(upright(bold(a))) \( G_n ∩ A_n \), g_n) =
     bb(P)_(upright(bold(a)))^(upright("walk")) \( tau_T^(+) < tau_(E_n) \) . $ <eq:finite-cut-return-ratio>]
  On the picture side, a cycle through $i in T$ returns to $T$ after finitely many periods,
    regardless of which other pins it meets. Detection of boundary visits before that return shows that
    $upright(bold(1))_(A_n)$ decreases to the event $A$ that the next full $P$-pin is in $T$.
    Together with (4.12) and bounded convergence, this gives
  $ bb(Q)_(upright(bold(a))) \( G_n ∩ A_n \) arrow.r bb(Q)_(upright(bold(a))) \( G_P ∩ A \) . $
  Dividing by the positive limiting denominator yields the return probability under
    $bb(Q)_(upright(bold(a))) \( thin dot.op divides G_P \)$.
  For the walk side, use a single uncensored fresh-turn trajectory for all the tests.
    Its first positive $T$-hitting time $tau_T^(+)$ is then fixed, independently of $n$.
    The events on the right of (4.13) decrease. A path in their intersection has $tau_T^(+) < oo$,
    since this is already part of each event. If that path had visited the boundary before $tau_T^(+)$,
    the positive residence time of the visit would make one of the dense cuts detect it before $tau_T^(+)$.
    Thus their intersection is exactly ${ tau_T^(+) < tau_E }$, up to a null set.
    Continuity from above gives convergence of the probabilities.
    Finally Proposition 12 identifies the limiting conditional picture law with the conditional law under
    $bb(P)_P$. This proves (4.11). ◻
]

=== 4.4 Minimal hitting probabilities and return energy <minimal-hitting-probabilities-and-return-energy>

We now ignore all pins of $E$ except $D_0$ in the stopping rule for this walk.
  The exposed environment is kept fixed. This can only increase its probability of returning to $T$.
  Let $U = U \( upright(bold(a)) \)$ be its one-period column-forward transition matrix from the cut at $theta$ to
  that same cut one period later, killed upon every visit to the boundary, including at its initial point.
  Boundary coordinates can be retained with value zero. With the post-jump convention at deterministic cuts,
  a period includes all changes after its starting cut and through its ending cut;
  in particular the within-site completion is included exactly once. All subsequent periods use fresh randomness.

We record the basic contraction property for later heat-flow estimates.
  For any subinterval, a realization of all exchanges, forced transports,
  and completions gives a bijection between its initial and final hole sets.
  Keeping only trajectories that avoid the boundary gives a partial permutation:
  its matrix has at most one entry equal to one in each row and in each column.
  The killed transition matrix $C$ is the mean of these matrices. Hence

#[#set math.equation(numbering: n => "(4.14)")
 $ C_(i j) gt.eq 0 \, wide sum_i C_(i j) lt.eq 1 \, wide sum_j C_(i j) lt.eq 1 \, wide
   parallel C v parallel_2 lt.eq parallel v parallel_2 . $ <eq:hole-contractions>]

Indeed Cauchy–Schwarz in each row gives $sum_i \| \( C v \)_i \|^2 lt.eq sum_(i \, j) C_(i j) \| v_j \|^2 lt.eq
  sum_j \| v_j \|^2$. The same inequalities apply to adjoints and to additional killing.
  Row sums bound propagated values by one; column sums bound the total mass from a unit starting point.
  These are statements at a fixed exposure, without any assertion of symmetry of $U$ or invariance of the exposure
  law under time reversal.

#thm([Lemma 4.5.])[
  (Minimal hitting function and return energy).  #emph[For almost every exposure under $bb(P)_P$,
    let $U$ be the boundary-killed one-period matrix just defined.
    There is a smallest nonnegative function $f$ on its cut holes satisfying
#[#set math.equation(numbering: n => "(4.15)")
 $ f = 1 upright(" on ") T \, wide U^(*) f = f upright(" off ") T . $ <eq:minimal-hitting-harmonicity>]

 It is given off $T$ by the probability of ever reaching $T$ on a future turn before boundary killing.
   In particular $0 lt.eq f lt.eq 1$, and $f$ is zero on the boundary. With counting inner products,
#[#set math.equation(numbering: n => "(4.16)")
 $ chevron.l f \, \( I - U \) f chevron.r = sum_(i in T) #scale(x: 120%, y: 120%)[\(] 1 - \( U^(*) f \)_i
   #scale(x: 120%, y: 120%)[\)] \, wide m \( 1 - r \) gt.eq bb(E)_P chevron.l f \, \( I - U \) f chevron.r .
   $ <eq:return-energy>]

 Both $U$ and $f$ in this expectation are functions of the same exposure, with the outer law in (4.4).]
] <lem:return-energy>

#proof[
  Set $f_0 = upright(bold(1))_T$ and recursively define
  #[#set math.equation(numbering: n => "(4.17)")
   $ f_(n + 1) = upright(bold(1))_T + upright(bold(1))_(H_theta \\ T) thin U^(*) f_n \, $ <eq:finite-horizon-hitting>]
  where the multiplication by the indicator is pointwise. Nonnegativity and the substochasticity of $U^(*)$ show
    inductively that $0 lt.eq f_n lt.eq f_(n + 1) lt.eq 1$. The Markov property identifies $f_n$, off $T$,
    with the probability of reaching $T$ within the next $n$ periods before killing.
    Thus its pointwise limit $f$ has the asserted probability interpretation.
    There are finitely many coordinates, so passage to the limit in (4.17) gives (4.15).
    A boundary starting point is killed immediately, and consequently every $f_n$ and $f$ is zero there.
  If $h$ is any nonnegative solution of (4.15), then $h gt.eq f_0$ and induction in (4.17) gives $h gt.eq
    f_n$ for every $n$; hence $h gt.eq f$. This proves minimality.
    In particular $f$ is zero on any closed class that cannot reach $T$.
    No assumption of certain absorption by the boundary is needed.
  Since $T$ occurs at a single time modulo the period, a strictly positive return from that cut to $T$ occurs
    after an integer number of periods. Conditioning on the first period therefore shows that the relaxed return
    probability from $i in T$ is $\( U^(*) f \)_i$. By Lemma 15,
    the conditional probability $q_i \( upright(bold(a)) \)$ contributing to (4.1) is the return probability with
    all of $E$ retained. Hence
  $ q_i \( upright(bold(a)) \) lt.eq \( U^(*) f \)_i wide \( i in T \) . $
  The vectors are real, so transposition in the scalar quadratic form and harmonicity off $T$ give
  $ chevron.l f \, \( I - U \) f chevron.r & = chevron.l \( I - U^(*) \) f \, f chevron.r\
 & = sum_(i in T) #scale(x: 120%, y: 120%)[\(] 1 - \( U^(*) f \)_i #scale(x: 120%, y: 120%)[\)] lt.eq
   sum_(i in T) \( 1 - q_i \( upright(bold(a)) \) \) . $
  Averaging under the actual exposure marginal gives (4.16). Measurability causes no additional limiting issue:
    finite-time transition probabilities are measurable functions of the finite-jump exposure,
    and $f$ is the increasing limit of the finite-horizon functions in (4.17). ◻
]

For the estimates that follow, write $eta = upright(bold(1))_T$ and $g = f - eta$.
  Then $0 lt.eq g lt.eq 1$, $chevron.l eta \, g chevron.r = 0$, and both functions have zero boundary values.
  Lemma 16 shows that the desired scale of quadratic loss is $m$: for any $epsilon gt.eq 0$,

$ bb(E)_P chevron.l f \, \( I - U \) f chevron.r gt.eq m \( 1 - epsilon \) quad arrow.r.double quad r lt.eq epsilon . $

The simultaneous pin test then bounds the old-pin avoidance probability by $\( 2 epsilon \)^m$.
  The next sections obtain this lower bound with a small error from the spatial distribution of holes and the
  corresponding heat flow.

== 5 Sparse obstacles and local diffusion <sec:sparse>

The return-energy problem requires two spatial estimates in each exposed environment.
  Mass initially on $T$ must spread through nearby holes, and its pairing, after propagation,
  with the remainder $g = f - upright(bold(1))_T$ of the hitting function must be bounded by the energy of that
  propagated remainder. Short connections near each starting point supply the first estimate;
  flows through the rest of the lattice will supply the second.
  We now derive the geometric conditions for both from the sparse pin-test induction.
  This section bounds the probability that these conditions fail and proves the local Nash inequality.
  Section 6 constructs the flows, and Section 7 uses both estimates to close the induction.

=== 5.1 The induction input and blocking between cuts <the-induction-input-and-blocking-between-cuts>

Fix throughout

#[#set math.equation(numbering: n => "(5.1)")
 $ alpha = 1 / 100 \, wide nu = frac(1, 100 d) \, wide a = 11 / 10 . $ <eq:sparse-exponents>]

All spatial distances in this and the following two sections are in the supremum norm, and $B_h \( x \) =
  { z in bb(Z)^d : \| z - x \|_oo lt.eq h }$. A finite collection of slot points with spatial coordinates
  $\( x_i \)_(i in A)$ is called #emph[sparse] if

#[#set math.equation(numbering: n => "(5.2)")
 $ \# { i in A : x_i in B_h \( z \) } lt.eq L \( 1 + h \)^alpha wide \( z in bb(Z)^d \, med h gt.eq 0 \) .
   $ <eq:sparse-growth>]

Repeated spatial coordinates are counted with their slot multiplicities.
  The constant $L gt.eq max { 2 d \, ell \, 4 }$ is fixed independently of all scales.
  For a set of distinct sites, sparseness means the same inequality with one point per site.
  Every subset of a sparse collection is sparse.

Let $0 < p < 1$, put

#[#set math.equation(numbering: n => "(5.3)")
 $ s = p^(- a) \, wide R = ceil.l C_(*) s ceil.r \, wide beta gt.eq 5 s \, $ <eq:sparse-scales>]

and choose a finite circular time grid $cal(G) subset bb(R) \/ beta bb(Z)$ containing $0$,
  whose successive gaps are at most $p^(4 d)$. Here $C_(*) gt.eq 1$ is a fixed constant,
  to be chosen for the localization estimate. Write $cal(V)_(cal(G)) = V_Lambda times cal(G)$.
  For $D = D_0 union F$, where $F subset.eq cal(V)_(cal(G))$, let $sans(I)_p \( D \)$ denote the assertion

#[#set math.equation(numbering: n => "(5.4)")
 $ bb(P)_D \( A subset.eq cal(B)_D \) lt.eq p^(\| A \|) quad
   upright("for every nonempty sparse set ") A subset.eq cal(V)_(cal(G)) \\ D upright(" at a single grid time") .
   $ <eq:induction-assertion>]

There are only finitely many grid points outside $D_0$. Thus one may prove these assertions by downward induction
  on the number of pins, starting from the vacuous assertion when every grid point is pinned.
  In a step with pin set $E$ and test $T$, the set $P = E union T$ has strictly more pins.
  In the present section we assume $sans(I)_p \( P \)$; we do not assume $sans(I)_p \( E \)$.
  Under this hypothesis we will seek a bound $r \( E \, T \) lt.eq epsilon \( p \)$ with $epsilon \( p \) =
  o \( p \)$. Proposition 6 then yields the required $p^(\| T \|)$ bound for the test under $bb(P)_E$,
  once $2 epsilon \( p \) lt.eq p$.

Expose $cal(B)_P$ under $bb(P)_P$ as in Proposition 12. A site is #emph[blocked] at time $t$ if none of its $ell$
  slots is a hole. Denote the blocked set by $cal(O)_t$. Extend the environment to $bb(Z)^d$ by making all slots
  outside $Lambda$ available. Boundary sites also have all slots available because $D_0 subset.eq P$.
  In particular $cal(O)_t$ is finite and is disjoint from the inner boundary.

Sparse growth serves two purposes. A blocked path crossing a large spatial scale will supply a separated
  collection satisfying (5.2), so the restricted induction hypothesis can still detect large obstacles.
  Later, the same growth bound on the test points will make overlaps between their decaying flows summable.
  The component estimate below and the energy estimate in Proposition 26 implement these two uses.

At a grid time $q$, the induction input gives

#[#set math.equation(numbering: n => "(5.5)")
 $ bb(P)_P \( A subset.eq cal(O)_q \) lt.eq p^(\| A \|) wide
   upright("for every prescribed sparse set of distinct sites ") A . $ <eq:grid-blocking>]

Indeed, choose one fixed slot at each site. If any chosen slot is pinned, or any site is outside the volume,
  blocking is impossible. Otherwise the chosen slot points form an admissible test in $sans(I)_p \( P \)$.

#thm([Lemma 5.1.])[
  (Blocking at a deterministic time).  #emph[Assume $sans(I)_p \( P \)$, and let $t$ be any deterministic time.
    There is a constant $C_0 = C_0 \( d \, ell \)$, uniform in $p lt.eq 1$, the volume, the period, the grid,
    and $P$, such that, for every prescribed finite set $A subset bb(Z)^d$ of distinct sites,
#[#set math.equation(numbering: n => "(5.6)")
 $ bb(P)_P \( A subset.eq cal(O)_t \) & lt.eq C_0 p^(2 d) &  & upright("if ") \| A \| = 2 d \,\
bb(P)_P \( A subset.eq cal(O)_t \) & lt.eq \( C_0 sqrt(p) \)^(\| A \|) &  & upright("if ") A
  upright(" is a nonempty sparse set of distinct sites") . $ <eq:small-blocking>]

]
] <lem:nongrid>

#proof[
  Let $q$ be the preceding grid time and $I = \( q \, t \]$, interpreted cyclically, so that $\| I \| lt.eq
    p^(4 d)$. On-site permutations do not change the number of holes at a site.
    Consequently a site blocked at $t$ was either blocked at $q$ or has an incident inter-site mark in $I$.
    This remains true when $I$ crosses the time seam. By Lemma 5,
    the expected number of marks in the edge star of a prescribed site during $I$ is at most $2 d ell^2 \| I \|$.
    If all $2 d$ prescribed sites are blocked at $t$, either they were all blocked at $q$,
    or one of these finitely many edge stars contains a mark. Their set is sparse since $L gt.eq 2 d$.
    The union bound and (5.5) give $p^(2 d) + C p^(4 d) lt.eq C p^(2 d)$.
  Now let $n = \| A \|$ and assume $A$ is sparse. If every site of $A$ is blocked at $t$,
    either at least $ceil.l n \/ 2 ceil.r$ of its sites were blocked at $q$,
    or at least $ceil.l n \/ 2 ceil.r$ have an incident mark in $I$.
    For the first alternative, summing (5.5) over subsets costs at most $2^n p^(ceil.l n \/ 2 ceil.r)$.
    For the second, one of the two lattice parities supplies at least $k =
    ceil.l n \/ 4 ceil.r$ sites with incident marks. Edge stars of distinct sites of the same parity are disjoint.
    If $N_z$ counts marks in the star of $z$ during $I$, then for any such prescribed $k$-set $A'$,
    the product $product_(z in A') N_z$ counts choices of $k$ distinct marks. The factorial bound therefore yields
  $ bb(P)_P \( N_z gt.eq 1 upright(" for all ") z in A' \) lt.eq
    bb(E)_P product_(z in A') N_z lt.eq \( 2 d ell^2 \| I \| \)^k . $
  Summing over at most $2^(n + 1)$ possible choices bounds the second alternative by
    $2^(n + 1) \( C p^(4 d) \)^(ceil.l n \/ 4 ceil.r)$. As $4 d ceil.l n \/ 4 ceil.r gt.eq d n gt.eq n \/ 2$,
    both alternatives are bounded together by $\( C_0 sqrt(p) \)^n$, after enlarging $C_0$.
    These are separate event bounds combined by a union bound;
    no independence between old blocking and intervening marks is required. ◻
]

=== 5.2 Admissible binary witnesses and component tails <admissible-binary-witnesses-and-component-tails>

Join two blocked sites when their supremum distance is at most $8$.
  All components and paths of blocked sites below use this adjacency.
  For $z in cal(O)_t$, let $cal(C)_t \( z \)$ be its component and set

$ "rad"_z cal(C)_t \( z \) = max_(w in cal(C)_t \( z \)) \| w - z \|_oo . $

The next lemma gives a tail uniform even as the bootstrap parameter is subsequently decreased.

#thm([Lemma 5.2.])[
  (Uniform component tail).  #emph[There are $p_0 > 0$ and $c \, C \, gamma > 0$, depending only on $d \,
    ell$ and the fixed sparse-growth choices, such that whenever $0 < p lt.eq p_0$ and $sans(I)_p \( P \)$ holds,
#[#set math.equation(numbering: n => "(5.7)")
 $ bb(P)_P #scale(x: 120%, y: 120%)[\(] z in cal(O)_t \, med "rad"_z cal(C)_t \( z \) gt.eq
   h #scale(x: 120%, y: 120%)[\)] lt.eq C exp \( - c h^gamma \) wide \( z in bb(Z)^d \, med h gt.eq 1 \)
   $ <eq:component-tail>]

 at every deterministic time $t$. The constants $c \, C \,
   gamma$ are fixed once $p_0$ is fixed and work simultaneously for all $p lt.eq p_0$.]
] <lem:component-tail>

#proof[
  Fix an integer $b > 100$ so large that $b^alpha > 4$, and put $h_j = 16 b^j$.
    We first describe exactly which site lists will be used as witnesses.
    Their separated binary-tree structure is also used in multiscale cascading-event arguments; see, for example,
    #cite(label("Sznitman2012")) Section 3. Here the leaf probabilities will come directly from (5.6).
    A depth-$j$ witness rooted at $z$ is an assignment of sites $x_w$ to the vertices $w$ of a rooted ordered
    binary tree of depth $j$, with $x_diameter = z$. If a vertex $w$ has $k gt.eq 1$ levels below it, require
  #[#set math.equation(numbering: n => "(5.8)")
   $ x_(w 0) = x_w \, wide x_(w 1) in B_(h_k + 8) \( x_w \) \, wide
     "dist"_oo \( cal(L)_(w 0) \, cal(L)_(w 1) \) gt.eq h_k \/ 4 \, $ <eq:witness-admissibility>]
  where $cal(L)_(w a)$ is the set of leaf sites descended from child $w a$.
    Call such an assignment #emph[admissible]. Its leaves are distinct by the separation condition.
    Depth zero has just the prescribed root as its leaf.
  A blocked crossing from $z$ to distance at least $h_j$ produces an admissible witness all of whose leaves are
    blocked. For $j = 0$ use the root alone. For $j gt.eq 1$,
    truncate the crossing at its first exit to distance $h_j$; it is contained in $B_(h_j + 8) \( z \)$.
    One child crossing starts at $z$. The other starts at the first site whose distance from $z$ is at least
    $h_j \/ 2$, hence at distance at most $h_j \/ 2 + 8$. The remaining part of the parent crossing reaches
    distance at least $h_j \/ 2 - 8$ from this second start. Each child can thus be truncated at its first exit to
    distance $h_(j - 1)$, and is contained in its start-centered ball of radius $h_(j - 1) + 8$.
    The distance between these two balls is at least
  $ h_j \/ 2 - 2 \( h_(j - 1) + 8 \) gt.eq h_j \/ 4 . $
  Recurse on the two truncated child crossings. Every descendant leaf remains in its child’s truncated crossing,
    so all the separation conditions in (5.8) hold.
  Every admissible witness has a sparse leaf set. Indeed, for $1 lt.eq k lt.eq j$,
    a ball of diameter strictly less than $h_k \/ 4$ meets at most one child at every split of scale at least
    $h_k$. It therefore contains at most $2^(k - 1)$ leaves. If $h_(k - 1) \/ 8 lt.eq h < h_k \/ 8$,
    this bound is at most $L \( 1 + h \)^alpha$, since
  $ L \( 1 + h \)^alpha gt.eq L \( 2 b^(k - 1) \)^alpha gt.eq 2^(k - 1) . $
  For $h < h_0 \/ 8$ there is at most one leaf, and for $h gt.eq
    h_j \/ 8$ the same calculation allows all $2^j$ leaves. The depth-zero case is immediate.
    This verifies (5.2) for all centers and real radii, including the scale endpoints.
  Let $A_j$ be an upper bound on the number of admissible assignments rooted at any prescribed site.
    At the top split the first child root is fixed and the second has at most $\( C_d h_j \)^d$ choices.
    Ignoring restrictions between the two child assignments gives the numerical overcount
  $ A_0 = 1 \, wide A_j lt.eq \( C_d h_j \)^d A_(j - 1)^2 . $
  In particular
  $ 2^(- j) log A_j lt.eq d sum_(k = 1)^j 2^(- k) log \( C_d h_k \) lt.eq log C_b < oo \, wide A_j lt.eq C_b^(2^j) . $
  Only admissible assignments enter the probability union bound.
    The unrestricted product used to bound their number need not itself consist of sparse witnesses.
  For each admissible assignment, Lemma 17 bounds the probability that all its leaves are blocked by
    $\( C_0 sqrt(p) \)^(2^j)$. Choose $p_0 lt.eq 1$ once and for all so that $C_b C_0 sqrt(p_0) lt.eq e^(- 2)$.
    For every $p lt.eq p_0$,
  #[#set math.equation(numbering: n => "(5.9)")
   $ bb(P)_P #scale(x: 120%, y: 120%)[\(] z in cal(O)_t \, med "rad"_z cal(C)_t \( z \) gt.eq
     h_j #scale(x: 120%, y: 120%)[\)] lt.eq exp \( - 2 dot.op 2^j \) . $ <eq:discrete-component-tail>]
  For $h gt.eq 16$, choose $j gt.eq 0$ with $h_j lt.eq h < h_(j + 1)$.
    Then $2^j gt.eq \( h \/ \( 16 b \) \)^gamma$, where $gamma = log_b 2 > 0$.
    This proves (5.7); increasing $C$ covers $1 lt.eq h < 16$.
    No constant in this last step changes when $p$ is decreased further. ◻
]

=== 5.3 Regular anchors <regular-anchors>

We now separate the geometry near the starting point of a localized mass from the geometry farther away.
  Nearby, fewer than $2 d$ blocked sites in each fixed-radius ball will preserve short lattice connections;
  these connections transfer the lattice Nash inequality to the holes.
  Farther away, a sublinear bound on component radii will control the displacement of the routes used for flows to
  infinity in Section 6. The first condition gives local diffusion,
  and the second permits the global energy comparison. Let $M_(*)$ be a fixed positive integer.
  Its required size will be specified below, independently of $p$.

#prodef([Definition 5.3.])[
  (Regular anchor).  For a spatial anchor $x in bb(Z)^d$, call time $t$ #emph[regular for $x$] at scale $R$ if
    both conditions hold:
  + For every $z in B_(11 R) \( x \)$, $\# \( cal(O)_t ∩ B_(M_(*)) \( z \) \) < 2 d$.
  + For every $z in cal(O)_t \\ B_(10 R) \( x \)$, $"rad"_z cal(C)_t \( z \) lt.eq \( 1 + \| z - x \|_oo \)^nu$.
  For $i in T$, “regular for $i$” means regular for its spatial coordinate $x_i$.
] <def:regular-anchor>

#thm([Proposition 5.4.])[
  (Probability of irregularity).  #emph[Fix $M_(*)$. Under $sans(I)_p \( P \)$, for all $0 < p lt.eq p_0$,
    all deterministic times $t$, and all spatial anchors $x$,
#[#set math.equation(numbering: n => "(5.10)")
 $ bb(P)_P \( t upright(" is not regular for ") x \) lt.eq delta := C R^d p^(2 d) + C exp \( - c R^xi \) \, wide
   xi = nu gamma > 0 . $ <eq:regularity-failure>]

 Here $R gt.eq 1$, and the constants may depend on $M_(*)$ but are uniform in $p lt.eq p_0$, volume, period, grid,
   pin set and anchor.]
] <prop:regularity>

#proof[
  There are at most $C R^d$ centers in $B_(11 R) \( x \)$, and a ball of radius $M_(*)$ has a fixed number of $2
    d$-element subsets. The union bound and (5.6) therefore bound failure of the first condition by $C R^d
    p^(2 d)$. By Lemma 18, failure of the second has probability at most
  $ C sum_(z : \| z - x \|_oo > 10 R) exp #scale(x: 120%, y: 120%)[\(] -
    c \( 1 + \| z - x \|_oo \)^(nu gamma) #scale(x: 120%, y: 120%)[\)] lt.eq C exp \( - c' R^(nu gamma) \) . $
  For the last inequality, count at most $C \( 1 + n \)^(d - 1)$ sites at distance $n$ and absorb this polynomial
    and the tail summation into half of the exponential. Since $nu gamma > 0$ is fixed,
    the resulting constants are uniform. Add the two bounds. ◻
]

We will use (5.10) only at prescribed times and after integration in time.
  It asserts neither independence between slices nor regularity simultaneously at every time.

=== 5.4 Local connections and the Nash inequality <local-connections-and-the-nash-inequality>

The remaining statements in this section are deterministic.
  At a fixed time let $cal(H)_t$ be the graph whose vertices are the available slots on the extended lattice and
  whose edges join every pair of available slots above nearest-neighbor sites.
  For a real function $v$ on its vertices define

#[#set math.equation(numbering: n => "(5.11)")
 $ cal(D)_t \( v \) = 1 / 2 sum_({ i \, j } in E \( cal(H)_t \)) \( v_i - v_j \)^2 . $ <eq:slot-energy>]

Edges in this sum are unoriented and counted once. Norms use counting measure on the available slots.
  When a function describes killed mass, its values at the physical boundary and outside the volume are zero.
  Thus (5.11) includes the edges into the zero-valued boundary, as required by Dirichlet killing.

#thm([Lemma 5.5.])[
  (Uniform local connectivity).  #emph[Let $d gt.eq 2$ and $K gt.eq 1$ be fixed.
    There is an integer $rho = rho \( d \, K \) gt.eq K + 1$ such that the following holds.
    If $u \, v in bb(Z)^d$, $\| u - v \|_oo lt.eq K$, and $F subset bb(Z)^d$ satisfies
$ u \, v in.not F \, wide \# \( F ∩ B_rho \( u \) \) < 2 d \, $

 then a nearest-neighbor path from $u$ to $v$ avoids $F$, lies in $B_rho \( u \)$,
   and has length at most $\( 2 rho + 1 \)^d$.]
] <lem:local-connectivity>

#proof[
  First suppose $F$ is a set of fewer than $2 d$ sites in the whole lattice.
    The complement of a box containing $F$ is connected when $d gt.eq 2$,
    so $bb(Z)^d \\ F$ has only one possible infinite component. It has no finite component:
    from a vertex of such a component the first exit along each of the $2
    d$ positive and negative coordinate rays must lie in $F$, giving $2 d$ distinct deleted sites.
    Hence $bb(Z)^d \\ F$ is connected.
  The confinement radius can be uniform when the two endpoints have bounded separation.
    Otherwise, after translating the first endpoint to $0$, there would be sets $F_n$ with $\| F_n \| < 2
    d$ and surviving endpoints $v_n in B_K \( 0 \)$, admitting no path inside $B_n \( 0 \)$.
    Pass to a subsequence with $v_n = v$ and with the indicators of $F_n$ converging pointwise on $bb(Z)^d$.
    The limiting set $F_oo$ has fewer than $2 d$ sites and avoids both endpoints.
    By the preceding paragraph there is a finite path from $0$ to $v$ avoiding $F_oo$.
    For all sufficiently large $n$, this path lies in $B_n \( 0 \)$ and avoids $F_n$, a contradiction.
    Choose a uniform radius $rho gt.eq K + 1$.
  For the asserted local version apply this conclusion to $F' = F ∩ B_rho \( u \)$,
    a set of fewer than $2 d$ sites in the whole lattice. The resulting path lies in $B_rho \( u \)$,
    where $F'$ and $F$ agree. Erasing loops gives the claimed length bound. ◻
]

We may now make the local radius choice without reference to $p$. Fix

#[#set math.equation(numbering: n => "(5.12)")
 $ K_(upright("conn")) = 8 \( 2 d - 2 \) + 12 \, wide M_(*) gt.eq max { 8 \( 2 d \) \,
   rho \( d \, K_(upright("conn")) \) + 2 } . $ <eq:local-radius-choice>]

We henceforth require $R$ to exceed these fixed local radii, which is achieved by decreasing the final $p$.
  At a regular anchor, Lemma 21 is now available for surviving sites within separation $K_(upright("conn"))$,
  whenever its first endpoint lies in $B_(11 R) \( x \)$. In particular,
  it applies to every short connection used below. This choice also serves the local source connections in Section 6.

The next estimate uses Nash’s norm–energy inequality and its diffusion mechanism #cite(label("Nash1958")) Part I.
  The transfer to the available slots uses path comparison of Dirichlet forms,
  a method developed systematically by Diaconis and Saloff-Coste #cite(label("DiaconisSaloffCoste1993"))
  Theorem 2.1. We supply the comparison for the present obstacles and zero extension explicitly.

#thm([Proposition 5.6.])[
  (Local Nash inequality).  #emph[Fix $d gt.eq 3$, $ell$, and $M_(*)$ as in (5.12).
    Let $cal(H)_t$ be an available-slot graph with at least one and at most $ell$ slots at every unblocked site,
    and suppose $t$ is regular for $x$ at scale $R gt.eq M_(*) + K_(upright("conn")) + 3$.
    Every nonnegative function $v$ supported on slots above $B_R \( x \)$ satisfies
#[#set math.equation(numbering: n => "(5.13)")
 $ parallel v parallel_2^(2 + 4 \/ d) lt.eq C cal(D)_t \( v \) parallel v parallel_1^(4 \/ d) \, $ <eq:local-nash>]

 where $C$ depends only on $d \, ell$ and the fixed local radii.]
] <prop:local-nash>

#proof[
  We transfer $v$ to a lattice function while controlling energy, then prove the lattice inequality by averaging.
    At every surviving site $z$, choose an available slot maximizing $v$, and let $V \( z \)$ be this maximum.
    Every blocked site in $B_(R + 3) \( x \)$ has a surviving nearest neighbor:
    otherwise its $2 d$ neighbors alone would violate the first regularity condition in the ball centered there.
    Choose one such neighbor $phi.alt \( z \)$ and define
  $ w \( z \) =
    cases(delim: "{", V \( z \) \, & z in.not cal(O)_t \,, V \( phi.alt \( z \) \) \, & z in cal(O)_t ∩ B_(R +
    3) \( x \) \,, 0 \, & z in cal(O)_t \\ B_(R + 3) \( x \) .) $
  The function $w$ is supported in $B_(R + 1) \( x \)$. Since a site’s value is copied only by its nearest neighbors,
  #[#set math.equation(numbering: n => "(5.14)")
   $ parallel v parallel_2^2 lt.eq ell parallel w parallel_2^2 \, wide
     parallel w parallel_1 lt.eq \( 2 d + 1 \) parallel v parallel_1 . $ <eq:nash-norm-transfer>]
  For a lattice edge ${ z \, z' }$ with a nonzero endpoint value, both endpoints belong to $B_(R + 2) \( x \)$.
    Each of $w \( z \) \, w \( z' \)$ is the value at a chosen maximizing slot over a surviving site, say $u \,
    u'$, at distance at most one from the corresponding endpoint.
    Thus $\| u - u' \|_oo lt.eq 3$ and $u \, u' in B_(R + 3) \( x \)$.
    Lemma 21 joins them through surviving sites within a fixed radius of $u$, with a fixed length bound.
    Lift this path using the chosen maximizing slot at every site.
    Every lifted edge is available because all pairs of available slots across a lattice edge are joined.
    If $u = u'$, the difference is zero. Otherwise telescoping and Cauchy–Schwarz show that
    $\( w \( z \) - w \( z' \) \)^2$ is at most a fixed constant times the sum of $\( v_i - v_j \)^2$ along the
    lifted path. For any fixed slot edge, only a bounded number of the original lattice edges can have a path
    using it: all of their endpoints lie within a fixed radius of that edge. Hence, summing,
  #[#set math.equation(numbering: n => "(5.15)")
   $ sum_({ z \, z' } : \| z - z' \|_1 = 1) \( w \( z \) - w \( z' \) \)^2 lt.eq
     C cal(D)_t \( v \) . $ <eq:nash-energy-transfer>]
  For completeness, write $cal(E)_(bb(Z)^d) \( w \)$ for the sum on the left of (5.15).
    For an integer $k gt.eq 1$, let $A_k w$ be the average of translates of $w$ by the points of ${ 0 \, dots.h \,
    k - 1 }^d$. Telescoping a translate along coordinate directions, followed by Cauchy–Schwarz, gives
  $ parallel w - A_k w parallel_2^2 lt.eq C_d k^2 cal(E)_(bb(Z)^d) \( w \) . $
  The averaging kernel has counting $2$-norm $k^(- d \/ 2)$;
    the convolution inequality therefore gives $parallel A_k w parallel_2^2 lt.eq
    k^(- d) parallel w parallel_1^2$. Consequently
  $ parallel w parallel_2^2 lt.eq C_d k^2 cal(E)_(bb(Z)^d) \( w \) + 2 k^(- d) parallel w parallel_1^2 . $
  If $w eq.not 0$, choose $k = ceil.l \( 4 parallel w parallel_1^2 \/ parallel w parallel_2^2 \)^(1 \/ d) ceil.r$.
    The second term is at most $parallel w parallel_2^2 \/ 2$,
    and $parallel w parallel_1^2 \/ parallel w parallel_2^2 gt.eq 1$ bounds the effect of rounding. Absorption yields
  $ parallel w parallel_2^(2 + 4 \/ d) lt.eq C_d cal(E)_(bb(Z)^d) \( w \) parallel w parallel_1^(4 \/ d) . $
  For $w = 0$ the inequality is immediate. Finally use (5.14) and (5.15) to obtain (5.13). ◻
]

The order of choices is now explicit. First fix $d \, ell$, the exponents in (5.1), the witness scale ratio $b$,
  and $L$. Next fix the preliminary $p_0$ and the uniform tail constants in Lemma 18.
  Fix the connectivity radii and $M_(*)$ by (5.12); this fixes the constants in Proposition 20 and Proposition 22.
  Choose $C_(*)$ for localization, and only then decrease $p lt.eq
  p_0$ so that $R$ exceeds the fixed radii and the leakage error is small enough to close the induction.
  Thus no tail constant deteriorates as the final $p$ is decreased.
  The next section uses the same regularity conditions to construct flows to infinity,
  complementing the local diffusion bound proved here.

== 6 Flows around the blocked components <sec:flows>

Fix one time slice $t$. The graph $cal(H)_t$ consists of the available slots,
  including all $ell$ slots at every site outside $Lambda$,
  with all available slot pairs across each nearest-neighbor site edge.
  Write $cal(Z) = cal(O)_t$ for its finite blocked set. We will represent masses near regular anchors as
  divergences of flows with controlled energy. This will bound their pairing with a function by that function’s
  Dirichlet energy, the estimate needed for the cross term in Section 7.
  The divergence and energy viewpoint is the classical electrical-network flow method;
  see #cite(label("DoyleSnell1984")) Sections 1.3.5 and 2.4.6.
  The geometric work here is to retain a quantitative decay bound after routing through this dependent obstacle
  configuration.

Give every unoriented slot edge $e$ a reference orientation $\( e^(-) \, e^(+) \)$.
  A flow is a real function $J$ on these reference edges; its divergence is outgoing minus incoming flow.
  Thus a signed unit path from $a$ to $b$ has divergence $upright(bold(1))_({ a }) - upright(bold(1))_({ b })$.
  Write $"dist" \( e \, y \) = min { \| x - y \|_oo : x upright(" is an endpoint site of ") e }$.
  Constants in this Section depend only on $d \, ell$ and the fixed geometric constants in Section 5,
  never on the slice or volume.

The construction begins with a full-lattice unit flow whose strength at distance $h$ from its source is
  $O \( \( 1 + h \)^(1 - d) \)$. We replace each oriented lattice edge by a path through available slots,
  with endpoints given by one application of a map on the original vertices.
  A short additional path then restores the source at the specified slot.
  The geometry below bounds the displacement of the replacement paths,
  and hence the number of original edges that can contribute to a given available edge.
  The resulting decay will let us add flows from a sparse collection of sources with controlled total energy.

=== 6.1 Filled hulls and their surviving boundaries <filled-hulls-and-their-surviving-boundaries>

We first thicken each blocked component to obtain clearance for routes around it.
  After filling the finite pockets of its complement, we will show that the exterior vertex boundary is connected
  by sup-norm steps of length at most one. These steps can be replaced by unblocked nearest-neighbor paths.
  The filled sets may be nested; their inclusion-maximal members will give disjoint regions on which to define the
  vertex map.

Let $C$ range over the components of $cal(Z)$ for steps of sup norm at most eight. Set

$ A_C = { z in bb(Z)^d : "dist" \( z \, C \) lt.eq 4 } \, wide H_C = bb(Z)^d \\ U_C \, $

where $U_C$ is the infinite nearest-neighbor component of $bb(Z)^d \\ A_C$. Such an infinite component is unique:
  the exterior of a box containing $A_C$ is connected when $d gt.eq 2$.
  Thus $H_C$ is $A_C$ with its finite complementary components filled in. The exterior vertex boundary of $H_C$ is

$ S_C = { v in.not H_C : upright("some ") u in H_C upright(" satisfies ") \| u - v \|_1 = 1 } . $

The exterior-boundary connectivity in the next lemma is the lattice case of Timár’s boundary-connectivity
  result #cite(label("Timar2013")) Lemmas 1–2. We include the plaquette proof together with the separate hull and
  clearance estimates needed for the routes.

#thm([Lemma 6.1.])[
  (Hull topology and clearance).  #emph[Let $d gt.eq 2$ and let $cal(Z) subset bb(Z)^d$ be finite.
    The sets $A_C$ are pairwise disjoint and nearest-neighbor connected.
    Each $H_C$ is finite, is nearest-neighbor connected, has connected complement,
    and is contained in the coordinate bounding box of $A_C$. Any two hulls are disjoint or one contains the other.]
  #emph[For every edge ${ u \, v }$ with $u in H_C$, $v in.not H_C$,
#[#set math.equation(numbering: n => "(6.1)")
 $ "dist" \( u \, C \) = 4 \, wide "dist" \( v \, C \) = 5 . $ <eq:hull-clearance>]

 Both endpoints are unblocked. The set $S_C$ is connected by steps of sup norm at most one.
   Each such step can be replaced by a nearest-neighbor path of unblocked sites,
   contained in the unit enlargement of the bounding box of $A_C$.
   Consequently any two points of $S_C$ can be joined by a finite path of unblocked sites in that enlargement.]
] <lem:hulls>

#proof[
  Distinct components have mutual distance at least nine, so their radius-four thickenings are disjoint.
    The radius-four lattice cubes about successive points of a component intersect; their union is connected.
    Every finite complementary component has a neighbor in $A_C$,
    which proves that filling preserves connectivity. A vertex outside the coordinate bounding box has a
    coordinate ray avoiding that box, so it belongs to $U_C$. This proves finiteness and the claimed containment.
  For laminarity, take two disjoint connected thickenings $A_C \, A_(C')$.
    The second lies in a single component of the complement of the first.
    If it lies in a finite component, then $U_C$ is an infinite connected subset of the complement of $A_(C')$,
    whence $U_C subset U_(C')$ and $H_(C') subset H_C$. The reversed containment is treated identically.
    In the remaining case each thickening lies in the infinite complementary component of the other.
    Then $H_C$ avoids $A_(C')$ and is connected; since it contains $A_C subset U_(C')$,
    it lies wholly in $U_(C')$. Hence $H_C$ and $H_(C')$ are disjoint.
  We next prove connectivity of the exterior boundary without a planar separation argument.
    Let $cal(E)_C$ be the edges between $H_C$ and $U_C$, and join two of these edges when they lie on an
    elementary lattice plaquette. Every plaquette meets $cal(E)_C$ an even number of times,
    and all cut edges of one plaquette belong to the same component of this edge relation.
    Thus each component separately meets every plaquette evenly.
    It then meets every finite closed lattice walk evenly: modulo two,
    such a walk is a sum of elementary plaquettes, as follows by commuting successive steps in different
    coordinate directions and canceling inverse steps. If the cut had two components, take one edge from each,
    join their inner endpoints within $H_C$ and their outer endpoints within $U_C$.
    The resulting closed walk uses exactly one cut edge from each chosen component, a contradiction.
    The cut is therefore connected by plaquettes. The outer endpoints of cut edges on a common plaquette have sup
    distance at most one. This proves the asserted connectivity of $S_C$.
  An inner cut endpoint $u$ must belong to $A_C$: otherwise a complementary pocket containing $u$ would be
    adjacent to the infinite component through $v$, which is impossible.
    Since $v in.not A_C$ and $\| u - v \|_oo = 1$, the distances to $C$ are exactly four and five.
    For another component $C'$, separation gives $"dist" \( v \, C' \) gt.eq 4$ and $"dist" \( u \, C' \) gt.eq
    5$. To interpolate a sup step between two points of $S_C$, change the differing coordinates one at a time.
    Every intermediate vertex is within sup distance one of its starting point,
    hence has distance at least four from $C$ and at least three from every other component.
    All these vertices survive. They also remain in the coordinate bounding box of $S_C$,
    which is contained in the unit enlargement stated above. ◻
]

Keep only the inclusion-maximal hulls and denote their family by $frak(H)$.
  They are pairwise disjoint and contain all blocked sites.
  Choose one representative $r_H in S_C$ for each $H = H_C in frak(H)$, and define a map on sites by

#[#set math.equation(numbering: n => "(6.2)")
 $ rho \( z \) = cases(delim: "{", r_H \, & z in H in frak(H) \,, z \, & z in.not union.big_(H in frak(H)) H .)
   $ <eq:once-only-map>]

All images are unblocked. The map is applied once. A representative can lie in another hull,
  so no identity $rho \( r_H \) = r_H$ is assumed.

For each oriented lattice edge $\( u \, v \)$, join $rho \( u \)$ to $rho \( v \)$ as follows.
  If both endpoints are in the same hull, use the empty path. If neither is in a hull, use the edge itself.
  If only $u$ belongs to a hull $H$, then $v in S_C$ and a path along its surviving boundary joins $r_H$ to $v$;
  reverse this prescription when only $v$ is in a hull. Finally,
  if $u in H$ and $v in H'$ for distinct maximal hulls, both $u$ and $v$ survive and the signed route is

#[#set math.equation(numbering: n => "(6.3)")
 $ r_H med arrow.r med v med arrow.r med u med arrow.r med r_(H') . $ <eq:adjacent-hull-route>]

The first portion uses the exterior boundary of $H$, the last the exterior boundary of $H'$,
  and the middle portion traverses the original edge in reverse. Indeed $v in S_C$ and $u in S_(C')$.
  Erase loops from the resulting walk, leaving a simple path with the same endpoints.
  This path stays in the enlarged bounding boxes of the hulls incident to the original edge,
  together with that edge. Figure 2 shows an exterior-boundary detour and the adjacent-hull case in which the
  one-use convention and the sign of the middle portion matter.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3.91, 3.22), [#text(size: 9pt)[\(a\) A filled pocket and an exterior detour]], anchor: "west", padding: 0.1176cm)
  rect((-2.415, -2.415), (2.415, 2.415), fill: rgb("#ededff"), stroke: none)
  rect((-2.415, -2.415), (2.415, 2.415), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  rect((-0.345, -0.345), (0.345, 0.345), fill: rgb("#ffdfbf"), stroke: none)
  rect((-0.345, -0.345), (0.345, 0.345), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10))
  circle((-1.38, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.15, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.15, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.92, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.92, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.69, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.69, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.46, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.46, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.23, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-0.23, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.23, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.23, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.46, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.46, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.69, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.69, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.92, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((0.92, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.15, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.15, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, 1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, -1.38), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, -1.15), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, -1.15), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, -0.92), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, -0.92), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, -0.69), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, -0.69), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, -0.46), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, -0.46), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, -0.23), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, -0.23), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, 0), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, 0), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, 0.23), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, 0.23), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, 0.46), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, 0.46), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, 0.69), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, 0.69), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, 0.92), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, 0.92), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((1.38, 1.15), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-1.38, 1.15), radius: 0.03528, fill: rgb("#4d4d4d"), stroke: none)
  circle((-2.3, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -2.3), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-2.07, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -2.07), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-1.84, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -1.84), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-1.61, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -1.61), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-1.38, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -1.38), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-1.15, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -1.15), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-0.92, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -0.92), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-0.69, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -0.69), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-0.46, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -0.46), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((-0.23, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, -0.23), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((0, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 0), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((0.23, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 0.23), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((0.46, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 0.46), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((0.69, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 0.69), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((0.92, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 0.92), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((1.15, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 1.15), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((1.38, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 1.38), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((1.61, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 1.61), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((1.84, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 1.84), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.07, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 2.07), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.3, 2.53), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.53, 2.3), radius: 0.02469, fill: rgb("#b3b3b3"), stroke: none)
  line((0, 2.53), (2.53, 2.53), (2.53, 0), stroke: (paint: rgb("#003a00"), thickness: 1.2pt, miter-limit: 10), mark: (end: ">"))
  line((2.3, 0), (2.53, 0), stroke: (paint: rgb("#999999"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: ">"))
  circle((0, 2.53), radius: 0.07056, fill: rgb("#003a00"), stroke: none)
  circle((2.53, 0), radius: 0.07056, fill: rgb("#003a00"), stroke: none)
  circle((2.3, 0), radius: 0.05292, fill: rgb("#999999"), stroke: none)
  circle((2.53, 2.53), radius: 0.08819, fill: rgb("#ffffff"), stroke: (paint: rgb("#003a00"), thickness: 0.8pt, miter-limit: 10))
  content((-0.092, 2.622), [#text(size: 9pt)[$r_H$]], anchor: "south-east", padding: 0.1176cm)
  content((2.07, 0.253), [#text(size: 9pt)[$u$]], anchor: "east", padding: 0.1176cm)
  content((2.668, 0.184), [#text(size: 9pt)[$v$]], anchor: "west", padding: 0.1176cm)
  content((-1.15, -1.955), [#text(size: 9pt)[$A_C$]])
  content((2.76, -1.725), [#text(size: 9pt)[$H_C=B_10(0)$]], anchor: "west", padding: 0.1176cm)
  line((2.76, -1.955), (2.415, -1.955), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((-2.76, 0.69), [#text(size: 9pt)[blocked#linebreak()ring $C$]], anchor: "east", padding: 0.1176cm)
  line((-2.691, 0.69), (-1.38, 0.69), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((2.99, -0.69), [#text(size: 9pt)[filled pocket#linebreak()$B_1(0)$]], anchor: "west", padding: 0.1176cm)
  line((2.875, -0.69), (0.345, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  content((2.99, 1.84), [#text(size: 9pt)[surviving route#linebreak()from $r_H$ to $v$]], anchor: "west", padding: 0.1176cm)
  line((2.875, 1.84), (2.53, 1.84), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
})
  #cetz.canvas({
  import cetz.draw: *
  content((-2.2, 2.2), [#text(size: 9pt)[\(b\) Adjacent hulls exchange representatives]], anchor: "west", padding: 0.1176cm)
  rect((-2.2, -1.6), (2.2, 1.6), fill: rgb("#ededff"), stroke: none)
  rect((-2.2, -1.6), (2.2, 1.6), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  rect((2.75, -1.6), (7.15, 1.6), fill: rgb("#fff2e6"), stroke: none)
  rect((2.75, -1.6), (7.15, 1.6), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10))
  line((-2.475, 0), (7.425, 0), stroke: (paint: rgb("#b9b9b9"), thickness: 0.4pt, miter-limit: 10))
  circle((-2.2, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((-1.65, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((-1.1, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((-0.55, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((0, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((0.55, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((1.1, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((1.65, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.2, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((2.75, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((3.3, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((3.85, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((4.4, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((4.95, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((5.5, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((6.05, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((6.6, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((7.15, 0), radius: 0.03528, fill: rgb("#b3b3b3"), stroke: none)
  circle((0, 0), radius: 0.08819, fill: black, stroke: none)
  circle((4.95, 0), radius: 0.08819, fill: black, stroke: none)
  content((0, 0.1764), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  content((4.95, 0.1764), [#text(size: 9pt)[$9e_1$]], anchor: "south", padding: 0.1176cm)
  content((0, 1.24), [#text(size: 9pt)[$H_0=[-4,4]^d$]])
  content((4.95, 1.24), [#text(size: 9pt)[$H_1=9e_1+[-4,4]^d$]])
  circle((2.75, 0), radius: 0.1058, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  circle((2.2, 0), radius: 0.1058, fill: rgb("#ffffff"), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  content((2.09, -0.2), [#text(size: 9pt)[$u=4e_1=r_(H_1)$]], anchor: "north-east", padding: 0.1176cm)
  content((2.86, -0.2), [#text(size: 9pt)[$v=5e_1=r_(H_0)$]], anchor: "north-west", padding: 0.1176cm)
  line((2.2, 0.4), (2.75, 0.4), stroke: (paint: rgb("#999999"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: ">"))
  content((2.475, 0.5058), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[original edge]]])], anchor: "south")
  line((2.75, -0.92), (2.2, -0.92), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: ">"))
  content((2.475, -1.061), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[routed edge]]])], anchor: "north")
  content((2.475, -2.12), [#text(size: 9pt)[$rho (u)=v, rho (v)=u$ #linebreak()$"div" bold(1)_(v arrow.r u)= bold(1)_(\{v\})- bold(1)_(\{u\})$]])
})],
  caption: [Figure 2: Replacing lattice edges by surviving paths. In (a), a two-dimensional example, $C = { z : \| z \|_oo = 6 }$ is a blocked ring. Its radius-four thickening is $A_C = { z : 2 lt.eq \| z \|_oo lt.eq 10 }$; filling the surviving pocket $B_1 \( 0 \)$ gives $H_C = B_10 \( 0 \)$. The original edge $u arrow.r v$, with $u = \( 10 \, 0 \)$ and $v = \( 11 \, 0 \)$, is replaced by the indicated path from $r_H = \( 0 \, 11 \)$ to $v$. The open corner is a surviving interpolation vertex outside $S_C$: a nearest-neighbor route need not remain in $S_C$ itself. In (b), the only blocked sites are $0$ and $9 e_1$. Their filled radius-four hulls are the two displayed lattice cubes, shown schematically in a coordinate slice; the transverse scale is compressed. Both $u = 4 e_1$ and $v = 5 e_1$ survive. Choosing $r_(H_0) = v$ and $r_(H_1) = u$ sends the oriented original edge $u arrow.r v$ to the reverse edge $v arrow.r u$. This is the case of (6.3) in which the two boundary portions are empty. Applying $rho$ again would undo this required image exchange. Panel (a) illustrates the definitions in $d = 2$; the hull and boundary properties in every $d gt.eq 2$ are proved in Lemma 23. ],
) <fig:hull-routing>

=== 6.2 A decaying unit flow from every nearby slot <a-decaying-unit-flow-from-every-nearby-slot>

The topology gives routes for all lattice edges. Regularity now bounds their displacement,
  which will bound the number of routes using any one target edge.

#thm([Proposition 6.2.])[
  (Decay of a routed unit flow).  #emph[Let $d gt.eq 3$, $nu = 1 \/ \( 100 d \)$,
    and suppose the anchor $x$ is regular in the sense of Definition 19.
    Fix the local constant $M_(*)$ as in (5.12) and take $R$ sufficiently large in terms of those fixed constants.
    For every available slot $a$ at any site $y in B_R \( x \)$ there is a flow $J_a$ on the available-slot graph
    such that
#[#set math.equation(numbering: n => "(6.4)")
 $ "div" J_a = upright(bold(1))_({ a }) \, wide \| J_a \( e \) \| lt.eq C \( 1 + "dist" \( e \, y \) \)^(- k) \,
   wide k = d - 1 - d nu . $ <eq:flow-envelope>]

 In particular, $sum_e J_a \( e \)^2 < oo$.]
] <prop:flow-decay>

#proof[
  First we quantify the hull sizes. A blocked component meeting $B_(10 R) \( x \)$ has fewer than $2 d$ vertices.
    Otherwise, starting at a vertex there, a connected exploration would find $2 d$ vertices within $2 d -
    1$ component steps, all in a ball of radius $8 \( 2 d - 1 \) lt.eq M_(*)$, contradicting regularity.
    Such a component has diameter at most $8 \( 2 d - 2 \)$, and its hull has diameter at most
  $ D_(upright("loc")) = 8 \( 2 d - 2 \) + 8 . $
  For a component avoiding $B_(10 R) \( x \)$, let $b_C = min_(z in C) \| z - x \|_oo > 10 R$.
    Applying remote regularity at a minimizer gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ "diam" H_C lt.eq 2 \( 1 + b_C \)^nu + 8 . $ <eq:remote-hull-size>]
  This also bounds the diameter of its coordinate bounding box.
    Since $nu < 1$, increasing a fixed lower threshold for $R$ makes the right side,
    plus any of the fixed enlargements used above, at most $b_C \/ 10$.
    All sites of these enlarged boxes then have distance comparable to $b_C$ from every $y in B_R \( x \)$.
    In particular, no such remote box contains $y$.
  Apply the routes following (6.2), using fixed choices of representatives and paths.
    The preceding size bounds show that the route of a lattice edge $e$ lies within distance
  #[#set math.equation(numbering: n => "(6.6)")
   $ C \( 1 + "dist" \( e \, y \) \)^nu $ <eq:routing-displacement>]
  of that edge. For a local hull this is the fixed bound $D_(upright("loc")) + 2$.
    For each remote hull incident to $e$, an endpoint of $e$ belongs to its bounding box,
    so its $b_C$ is comparable to $1 + "dist" \( e \, y \)$; now use (6.5).
    The same reasoning applies when the edge joins two hulls.
    These comparisons are uniform over all injection sites $y in B_R \( x \)$.
  Choose one canonical available slot $c \( z \)$ at each unblocked site $z$.
    Lift every routed site path to these canonical slots. All its edges exist because every pair of available
    slots across a lattice edge is present. The map of the original lattice vertices into slots is $psi \( z \) =
    c \( rho \( z \) \)$. Its preimages are finite: outside the finitely many finite hulls it is injective,
    and only those hulls can supply additional preimages.
  We also need a bounded path from the specified slot $a$ to $psi \( y \)$.
    If $y$ is in a hull, that hull is local and the separation between $y$ and $rho \( y \)$ is at most
    $D_(upright("loc")) + 1$. Both sites are unblocked, so Lemma 21 joins them through survivors in a fixed
    neighborhood of $y$. Its assumptions hold because $y in B_R \( x \)$, the neighborhood has fixed radius,
    and $R$ dominates that radius. Lift this path, starting at $a$.
    If $rho \( y \) = y$ but $a eq.not c \( y \)$, use a two-edge path through a surviving neighbor of $y$.
    Such a neighbor exists, since blocking all $2 d$ neighbors would violate local regularity.
    Thus in all cases there is a simple slot path $Q_a$ from $a$ to $psi \( y \)$ of bounded length and
    displacement. The choice $K_(upright("conn")) gt.eq 8 \( 2 d - 2 \) +
    12$ in the local-connectivity construction covers these requirements before $M_(*)$, $R$, and finally $p$ are fixed.
  Start with an explicit unit flow $F_y$ on the full lattice.
    In the positive orthant based at $y$, give each site $y + n$, $n in bb(Z)_(gt.eq 0)^d$, $\| n \|_1 = N$, mass
  $ a_N = binom(N + d - 1, d - 1)^(- 1) \, $
  and send the fraction $\( n_j + 1 \) \/ \( N + d \)$ along its edge in direction $e_j$.
    Put zero on all other edges. At a site $y + n$ of level $N gt.eq 1$, the incoming mass is
  $ a_(N - 1) frac(sum_j n_j, N + d - 1) = a_(N - 1) frac(N, N + d - 1) = a_N \, $
  which equals its outgoing mass. The outgoing mass at $y$ is one. Consequently
  #[#set math.equation(numbering: n => "(6.7)")
   $ "div" F_y = upright(bold(1))_({ y }) \, wide \| F_y \( e \) \| lt.eq
     C \( 1 + "dist" \( e \, y \) \)^(1 - d) . $ <eq:orthant-flow>]
  For each lattice edge, send its signed $F_y$-value along its lifted simple path.
    To justify this infinite sum and estimate it, fix a target slot edge $f$ and write $h = "dist" \( f \, y \)$.
    If the route of an original edge $e$ uses $f$, put $t = "dist" \( e \, y \)$. The displacement bound gives
  $ \| h - t \| lt.eq C \( 1 + t \)^nu + C . $
  Because $nu < 1$, this implies $1 + t asymp 1 + h$, with uniform constants:
    above a fixed threshold the error is at most $\( 1 + t \) \/ 2$,
    and below that threshold all quantities are bounded. It follows also that $e$ lies within distance
    $C \( 1 + h \)^nu$ of $f$. There are at most
  #[#set math.equation(numbering: n => "(6.8)")
   $ C \( 1 + h \)^(d nu) $ <eq:target-congestion>]
  such lattice edges. Each routed path is simple, so any one of them uses $f$ at most once.
    Summing (6.7) over this finite set gives a well-defined flow $J_a^0$ with
  $ \| J_a^0 \( f \) \| lt.eq C \( 1 + h \)^(1 - d + d nu) . $
  The count (6.8) already counts all contributions to $f$; no path-length factor is present.
  Local finiteness of the path sum and finiteness of the vertex preimages justify the divergence calculation at
    any slot $b$:
  $ "div" J_a^0 \( b \) & = sum_(e = \( u \, v \)) F_y \( e \) #scale(x: 120%, y: 120%)[\(]
    upright(bold(1))_({ psi \( u \) = b }) - upright(bold(1))_({ psi \( v \) = b }) #scale(x: 120%, y: 120%)[\)]\
 & = sum_(z : psi \( z \) = b) "div" F_y \( z \) = upright(bold(1))_({ psi \( y \) = b }) . $
  Here one fixed orientation is used for each original lattice edge;
    the signed route is always from $psi \( u \)$ to $psi \( v \)$.
    Adding the unit path flow from $a$ to $psi \( y \)$ therefore gives
  $ J_a = J_a^0 + upright(bold(1))_(Q_a) \, wide "div" J_a = upright(bold(1))_({ a }) . $
  The connector has fixed bounded support near $y$, so enlarging $C$ preserves the envelope (6.4).
    Finally, $2 k > d$ for $d gt.eq 3$, and the number of slot edges at radius $h$ is at most
    $C \( 1 + h \)^(d - 1)$. Squaring the envelope and summing proves finite energy.
    Equivalently, this is a unit flow to infinity: its net outward flux across any finite vertex set containing
    $a$ is one. ◻
]

=== 6.3 Overlap and arbitrary subunit injections <overlap-and-arbitrary-subunit-injections>

We now combine the individual flows. Their decay, rather than a disjointness property of their routes,
  controls their total energy.

#thm([Lemma 6.3.])[
  (Overlap of two flows).  #emph[Suppose two flows on an available-slot graph obey
$ \| J \( e \) \| lt.eq C_0 \( 1 + "dist" \( e \, y \) \)^(- k) \, wide \| J' \( e \) \| lt.eq
  C_0 \( 1 + "dist" \( e \, y' \) \)^(- k) \, $

 where $d \/ 2 < k < d$. Then
#[#set math.equation(numbering: n => "(6.9)")
 $ sum_e \| J \( e \) J' \( e \) \| lt.eq C \( 1 + \| y - y' \|_oo \)^(- \( 2 k - d \)) \, $ <eq:flow-overlap>]

 where $C$ depends only on $d \, ell \, k \, C_0$.]
] <lem:flow-overlap>

#proof[
  Write $H = 1 + \| y - y' \|_oo$. For bounded $H$ the assertion follows by summing the squared envelopes and
    Cauchy–Schwarz. Otherwise, in the ball of radius $\( H - 1 \) \/ 3$ about either center,
    the other envelope is at most $C H^(- k)$, whereas the sum of the nearer envelope is at most $C H^(d - k)$.
    These two regions cost $C H^(d - 2 k)$. In the remaining region the two distances are comparable.
    Dyadic annuli of radii comparable to $2^j H$, $j gt.eq 0$, cost at most
  $ C sum_(j gt.eq 0) \( 2^j H \)^(d - 2 k) lt.eq C H^(d - 2 k) \, $
  since $2 k > d$. Changing a site distance to the distance from an incident edge changes it by at most one,
    and the number of slot edges per site is bounded by $2 d ell^2$.
    Thus the same estimates apply to the stated edge sum. ◻
]

#thm([Proposition 6.4.])[
  (Energy for arbitrary injections).  #emph[Let $d gt.eq 3$, $alpha = 1 \/ 100$, and $nu = 1 \/ \( 100 d \)$.
    Fix $M_(*)$ as in (5.12) and take $R$ sufficiently large as in Proposition 24.
    Let $T$ be a finite set of $m$ anchor slots with sites $x_i$, satisfying
$ \# { i in T : x_i in B_h \( z \) } lt.eq L \( 1 + h \)^alpha quad upright("for all ") z in bb(Z)^d \, med
  h gt.eq 0 . $

 Fix an available-slot graph and a subset $I subset T$ of anchors regular for this graph.
   For each $i in I$, let $mu_i$ be any nonnegative mass on its slots,
   supported over $B_R \( x_i \)$ and satisfying $sum_a mu_i \( a \) lt.eq 1$. There is a flow $J$ such that
#[#set math.equation(numbering: n => "(6.10)")
 $ "div" J = sum_(i in I) mu_i \, wide sum_e J \( e \)^2 lt.eq C \| I \| R^alpha lt.eq
   C m R^alpha . $ <eq:injection-flow-energy>]

 Consequently every finitely supported real function $g$ on the graph satisfies
#[#set math.equation(numbering: n => "(6.11)")
 $ lr(|⟨sum_(i in I) mu_i \, g⟩|) lt.eq #scale(x: 120%, y: 120%)[\(] C m R^alpha cal(D) \( g \)
   #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, wide cal(D) \( g \) = 1 /
   2 sum_e \( g \( e^(-) \) - g \( e^(+) \) \)^2 . $ <eq:injection-pairing>]

 All constants are uniform over the choices of $I$ and of the masses.]
] <prop:flow-energy>

#proof[
  The empty case uses $J = 0$. Otherwise, for each slot $a$ in the support of $mu_i$,
    take a unit flow $J_(i \, a)$ from Proposition 24, using anchor $x_i$, and set
  $ J = sum_(i in I) sum_a mu_i \( a \) J_(i \, a) . $
  This is a finite linear combination, and its divergence is as asserted.
    Put $q = 2 k - d = d - 2 - 2 d nu > alpha$. By Lemma 25, the absolute overlap of $J_(i \, a)$ and $J_(j \, b)$
    is at most $C \( 1 + \| y_a - y_b \|_oo \)^(- q)$, where $y_a \, y_b$ are the sites of their injection slots.
    If $\| x_i - x_j \|_oo > 4 R$, then $\| y_a - y_b \|_oo gt.eq \| x_i - x_j \|_oo \/ 2$,
    uniformly over both supports. For the remaining anchor pairs use the uniform constant overlap bound.
    The mass bound of one per anchor therefore gives
  $ sum_e J \( e \)^2 lt.eq C sum_(i in I) [\# { j in I : \| x_j - x_i \|_oo lt.eq 4 R } + sum_(j in I\
\| x_j - x_i \|_oo > 4 R) \( 1 + \| x_j - x_i \|_oo \)^(- q)] . $
  The first term is at most $C L R^alpha$. Splitting the second into annuli $2^j 4 R < \| x_j - x_i \|_oo lt.eq
    2^(j + 1) 4 R$ bounds it by
  $ C L sum_(j gt.eq 0) \( 2^j R \)^(alpha - q) lt.eq C \, $
  because $R gt.eq 1$ and $q > alpha$. This proves (6.10), including repeated anchor sites since the growth
    assumption counts slots.
  Finally, finite support of $g$ permits summation by divergence without a term at infinity:
  $ ⟨sum_i mu_i \, g⟩ = sum_e J \( e \) \( g \( e^(-) \) - g \( e^(+) \) \) . $
  Cauchy–Schwarz and $sum_e \| nabla_e g \|^2 = 2 cal(D) \( g \)$ give (6.11).
    In particular it applies to functions that vanish on the killed boundary and outside the physical box,
    with exactly the energy normalization in (5.11). ◻
]

The construction is deterministic at a single slice. Thus the masses and the set of regular anchors may depend on
  the whole exposed environment; the pairing bound requires neither independence nor a choice of flows continuous
  in time.

== 7 Heat-flow leakage and the pin bootstrap <sec:leakage>

We now use the geometric estimates to bound the return fraction in the simultaneous pin test.
  The main task is to prove that the hitting function loses nearly $m$ units of squared norm during each of two
  short portions of a period, where $m$ is the number of new pins.
  Local diffusion spreads the mass on those pins, and the flow estimate controls its pairing with the rest of the
  hitting function. Averaging the accumulated heat dissipation will absorb this pairing.
  The Nash method for Markov semigroups is developed in #cite(label("DiaconisSaloffCoste1996")) Section 3.
  The proof below accounts explicitly for the changing hole sets, killing, instantaneous contractions,
  and the restriction of the Nash inequality to regular times.

Throughout the section, $d gt.eq 3$, $ell = 2 S$, and $Lambda$ is a finite cube.
  We use the parameters of Section 5, namely

$ alpha = 1 / 100 \, wide nu = frac(1, 100 d) \, wide a = 11 / 10 \, wide s = p^(- a) \, wide R =
  ceil.l C_(*) s ceil.r \, wide beta gt.eq 5 s . $

The spatial growth constant $L$, the regularity radius $M_(*)$,
  and the constant $C_(*)$ will be fixed independently of the final choice of $p$.
  The test $T$ consists of $m gt.eq 1$ distinct slot points at one time, is disjoint from $E supset.eq D_0$,
  and satisfies

#[#set math.equation(numbering: n => "(7.1)")
 $ \# { i in T : x_i in B_h \( z \) } lt.eq L \( 1 + h \)^alpha quad \( z in bb(Z)^d \, med h gt.eq 0 \) .
   $ <eq:leakage-growth>]

Here $x_i$ denotes the site of the slot point $i$. Write $P = E union T$,
  and sample the exposed paths under $bb(P)_P$, as in Proposition 12.
  Expectations of quantities determined by these paths use their actual marginal,
  including the factor $g_P$ in (4.4). At a fixed exposure, the propagators use the unconditioned fresh-turn walk.
  As in Proposition 6, $r$ is the expected fraction of points of $T$ whose next pin along the actual cycle again
  belongs to $T$.

Recall the one-period, column-forward kernel $U$ of the fresh-turn walk, killed on visiting $D_0$.
  At the cut containing $T$, the function $f$ of Lemma 16 is $1$ on $T$ and, off $T$,
  is the probability of a future visit to $T$ before killing, namely the minimal nonnegative hitting solution.
  In particular,

#[#set math.equation(numbering: n => "(7.2)")
 $ 0 lt.eq f lt.eq 1 \, wide f \|_(partial Lambda) = 0 \, wide U^(*) f = f med upright("off ") T \, wide
   m \( 1 - r \) gt.eq bb(E)_P chevron.l f \, \( I - U \) f chevron.r . $ <eq:leakage-hitting-input>]

The last inequality incorporates the conditional first-moment identity of Proposition 14 and the relaxation of the
  other pins of $E$. A class of the relaxed walk that never reaches $T$ has $f = 0$;
  certain absorption is unnecessary. In particular $f$ is a function of the exposed paths,
  and we will not require it to be independent of any geometric event.
  All the propagators below are measurable functions of finite-jump data.
  The hitting function is measurable as the increasing limit of finite-horizon hitting probabilities,
  so the expectations used below are well defined.

For grid pin sets satisfying the larger-pin induction hypothesis $sans(I)_p \( P \)$ of (5.4), our aim is

#[#set math.equation(numbering: n => "(7.3)")
 $ bb(E)_P chevron.l f \, \( I - U \) f chevron.r gt.eq m \[ 1 - epsilon \( p \) \] \, wide epsilon \( p \) =
   o \( p \) . $ <eq:leakage-target>]

Together with (7.2), this gives $r lt.eq epsilon \( p \)$.
  The simultaneous pin test then recovers $bb(P)_E \( T subset.eq cal(B)_E \) lt.eq
  p^m$ once $2 epsilon \( p \) lt.eq p$, closing the induction step.
  To obtain (7.3), split $f = eta + g$, where $eta = upright(bold(1))_T$ and $g = f - eta$.
  Then $0 lt.eq g lt.eq 1$ and $chevron.l eta \, g chevron.r = 0$.
  We first relate the quadratic form to norm losses at both ends of the period.
  The Nash estimate will make the propagated $eta$ small in squared norm,
  while the flow estimate will control its pairing with the propagated $g$ through the square root of that
  function’s energy at the same time.

=== 7.1 Ordered propagation and the two ends of a period <ordered-propagation-and-the-two-ends-of-a-period>

We first fix one exposed environment. Between its finitely many instantaneous changes,
  the surviving interior holes carry the symmetric rate-$1 \/ 2$ heat equation.
  A boundary hole is assigned value zero. Thus the generator on an interior hole $k$ is

#[#set math.equation(numbering: n => "(7.4)")
 $ \( L_t v \)_k = 1 / 2 sum_(j : { j \, k } upright(" is an available slot edge")) \( tilde(v)_j - v_k \) \,
   $ <eq:leakage-generator>]

where $tilde(v)$ equals $v$ on interior holes and zero on boundary holes.
  The diagonal includes the escape rates to the boundary. This is continuous killing throughout the heat interval.

At an instantaneous change, let $F$ be the forced bijection or the average of the allowed within-site completion
  bijections, from the hole set just before the change to that just after it.
  If $R_(-)$ and $R_(+)$ are the projections deleting killed coordinates on those two sets, respectively,
  the killed factor is

#[#set math.equation(numbering: n => "(7.5)")
 $ R_(+) F R_(-) \, wide \( R_(+) F R_(-) \)^(*) = R_(-) F^(*) R_(+) . $ <eq:ordered-killing>]

The projections remain in this order. For heat intervals,
  the corresponding assertion follows either from the symmetric Dirichlet generator or by transposing the sampled
  surviving paths.

By the subpermutation argument in (4.14), these matrices, their products, and their adjoints are nonnegative,
  have row and column sums at most one, and contract the counting $ell^2$ norm.
  We will also use the two sum bounds separately: the row bound gives $0 lt.eq A v lt.eq 1$ when $0 lt.eq v lt.eq
  1$, while the column bound gives $parallel A v parallel_1 lt.eq parallel v parallel_1$ for $v gt.eq 0$.

Put the time of $T$ at the beginning and end of a period.
  Let $C_u$ be the initial propagation of duration $u$, and let $C_u^(upright("rev"))$ be the adjoint of the
  ending propagation of duration $u$. Forward propagation includes the changes after its initial cut through its
  final cut, under the post-completion convention at time zero.
  Reverse propagation traverses precisely those factors in the opposite order.
  If the ending cut is a completion cut, its adjoint completion is the first factor traversed in reverse time.
  It is included exactly once, including when it occurs immediately at elapsed time zero.
  We set $C_0 = C_0^(upright("rev")) = I$ on the initial, already unkilled coordinates and count any such initial
  reverse jump in every positive duration that traverses it. This convention allows a contraction jump at $u = 0 +$.

#thm([Lemma 7.1.])[
  (Leakage at both ends).  #emph[For every fixed exposed environment, $s > 0$, and period $beta gt.eq 4 s$,
    the preceding killed propagators satisfy, for every real vector $v$ on the holes at the distinguished cut with
    zero boundary values,
#[#set math.equation(numbering: n => "(7.6)")
 $ chevron.l v \, \( I - U \) v chevron.r gt.eq 1 /
   2
   (parallel v parallel_2^2 - parallel C_(2 s) v parallel_2^2 + parallel v parallel_2^2 - parallel C_(2
   s)^(upright("rev")) v parallel_2^2) . $ <eq:two-ends>]

 Both $u mapsto parallel C_u v parallel_2$ and $u mapsto parallel C_u^(upright("rev")) v parallel_2$ are nonincreasing.]
] <lem:two-ends>

#proof[
  The nonoverlapping initial and ending portions factor $U = B M A$, with $A = C_(2 s)$, $B^(*) =
    C_(2 s)^(upright("rev"))$, and $M$ the intervening propagation.
    At $beta = 4 s$, assign every shared-cut jump once according to the preceding convention and take the
    intervening identity on that cut. All factors are contractions, so
  $ chevron.l v \, U v chevron.r = chevron.l B^(*) v \, M A v chevron.r lt.eq
    parallel B^(*) v parallel_2 parallel A v parallel_2 lt.eq 1 /
    2 #scale(x: 120%, y: 120%)[\(] parallel B^(*) v parallel_2^2 +
    parallel A v parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  This proves (7.6). Longer initial portions are obtained by left multiplication by further contraction factors.
    For the ending adjoints the same fact follows after reversing the factor order, using (7.5).
    It proves both monotonicity assertions. ◻
]

The reverse construction has symmetric heat between changes, inverse forced transports,
  averages of inverse completion bijections, and the ordered killing projections.
  Thus it has the same deterministic analytic properties as forward propagation.
  Its environment is the original exposed environment read in reverse order;
  no invariance of the environment law under time reversal is asserted or needed.

Thus (7.3) will follow if each of these two propagations loses at least $m \[ 1 - epsilon \( p \) \]$ in expected
  squared norm by time $2 s$. We prove both estimates through the same argument.

For the rest of the estimates, $C_u$ denotes either of the two propagations,
  and $t \( u \)$ denotes its physical time slice modulo $beta$.
  On the available slot graph, extended by all slots outside $Lambda$, use the energy

$ cal(D)_t \( v \) = 1 / 2 sum_({ j \, k } upright(" available at ") t) \( v_j - v_k \)^2 . $

Vectors propagated in the box are extended by zero on its boundary and outside.
  Since the boundary is the inner boundary, any edge crossing out of the box has two zero values.

Write $eta_u = C_u eta$, $g_u = C_u g$, and $cal(L) \( u \) = parallel f parallel_2^2 -
  parallel C_u f parallel_2^2$. For a jump traversed at elapsed time $v$, let

$ Delta_g \( v \) = parallel g_(v \, upright("before")) parallel_2^2 -
  parallel g_(v \, upright("after")) parallel_2^2 gt.eq 0 . $

Here “before” and “after” refer to the chosen direction of propagation.
  Denote the finite list of jumps traversed by duration $u$ by $cal(J) \( u \)$,
  including an initial reverse jump when present. Between jumps, (7.4) gives

$ frac(upright(d), upright(d) u) parallel g_u parallel_2^2 = - 2 cal(D)_(t \( u \)) \( g_u \) . $

To check the normalization, an interior–interior edge contributes $- \( g_j - g_k \)^2$ to this derivative,
  and an interior–boundary edge contributes $- g_j^2$. These are exactly the contributions to $- 2 cal(D)$.
  Summing continuous and instantaneous losses and then expanding $parallel eta_u +
  g_u parallel_2^2$ yields the exact identity

#[#set math.equation(numbering: n => "(7.7)")
 $ cal(L) \( u \) & = m - parallel eta_u parallel_2^2 - 2 chevron.l eta_u \, g_u chevron.r\
 & quad + 2 integral_0^u cal(D)_(t \( v \)) \( g_v \) thin upright(d) v +
   sum_(v in cal(J) \( u \)) Delta_g \( v \) . $ <eq:exact-loss>]

The sum includes a completion at an endpoint whenever that completion is a factor of the propagation. Dropping it gives

#[#set math.equation(numbering: n => "(7.8)")
 $ cal(L) \( u \) gt.eq m - parallel eta_u parallel_2^2 - 2 chevron.l eta_u \, g_u chevron.r +
   2 integral_0^u cal(D)_(t \( v \)) \( g_v \) thin upright(d) v . $ <eq:loss-lower>]

Keeping this as an inequality is necessary even when a completion is the only nontrivial instantaneous operation.

=== 7.2 Localization with actual and fresh marks <localization-with-actual-and-fresh-marks>

For $i in T$, let $eta_(i \, u)$ be the propagation from unit mass at $i$,
  with the additional rule that a path is killed when its site leaves $B_R \( x_i \)$.
  Use this additional killing for continuous moves and on both sides of instantaneous changes.
  Positivity and the path description give

#[#set math.equation(numbering: n => "(7.9)")
 $ 0 lt.eq zeta_u := sum_(i in T) eta_(i \, u) lt.eq eta_u lt.eq 1 \, wide parallel eta_(i \, u) parallel_1 lt.eq
   1 . $ <eq:local-pieces>]

#thm([Lemma 7.2.])[
  (Localization averaged over the pin law).  #emph[Fix $d$ and $ell$.
    There is a constant $C_(*) = C_(*) \( d \, ell \)$ such that for $s gt.eq 1$, $R = ceil.l C_(*) s ceil.r$,
    $beta gt.eq 5 s$, every finite cube, every $E supset.eq D_0$ consisting of $D_0$ and finitely many pins,
    and every disjoint single-time test $T$, one has
#[#set math.equation(numbering: n => "(7.10)")
 $ bb(E)_P parallel eta_u - zeta_u parallel_1 lt.eq C m e^(- c s) wide \( 0 lt.eq u lt.eq 2 s \) $ <eq:localization>]

 for either direction of propagation. The constants are independent of the volume, the pin sets, $beta$, and $s$.]
] <lem:localization>

#proof[
  First sample a complete actual exchange picture with law $bb(P)_P$ and expose its missing cycles.
    Conditional on that exposure, realize the unconditioned one-particle propagation of Proposition 12 using
    independent fresh rate-$1 \/ 2$ Poisson clocks on all slot edges,
    accepting a fresh mark only when its two endpoints are holes.
    The forced moves use marks of the actual picture. Completion randomness changes slots only within a site.
    This construction is for the unconditioned fresh walk; its exposure still has the marginal induced by the full
    pin law.
  The difference in (7.9), summed over output slots, is bounded by the sum of the probabilities that these
    individual walks exit their respective balls before elapsed time $u$.
    Exiting requires at least $R$ nearest-neighbor spatial steps.
    The first $R$ such steps give a chronological list of marks,
    each from either the actual picture or the fresh family. For a fixed list of sites, slot edges,
    and choices of source, the actual marks used are distinct:
    the time interval has length at most $2 s < beta$, so its image on the time circle does not use a mark twice.
    This remains true if the interval crosses time zero, and if it is traversed backwards.
    Fresh marks in the list are distinct as well.
  Suppose a source choice uses $k$ actual marks and $R - k$ fresh marks.
    By Lemma 5, the joint factorial measure of the actual marks is bounded by $2^k$ times their base product
    intensity. Independence of the fresh family then bounds the mixed measure by
  $ 1^k \( 1 \/ 2 \)^(R - k) thin upright(d) t_1 dots.h.c upright(d) t_R $
  on the prescribed edge coordinates. All source choices are integrated over the same ordered simplex $0 < t_1 <
    dots.h.c < t_R < u$, of volume $u^R \/ R !$. At each spatial step there are at most $2 d
    ell^2$ choices for the next site and the slot edge, even if one ignores constraints from the current slot.
    Summing source choices and edge choices therefore bounds the expected number of such lists,
    for one initial point, by
  #[#set math.equation(numbering: n => "(7.11)")
   $ \( 2 d ell^2 \)^R \( 1 + 1 \/ 2 \)^R frac(u^R, R !) lt.eq frac(\( 2 K s \)^R, R !) \, wide K =
     3 d ell^2 . $ <eq:mixed-factorial-count>]
  The existence of an exit path is bounded by this count; the counted lists need not themselves be realizable walk
    histories. In particular, the restrictions imposed by the exposure can be ignored when taking this upper
    bound. No factorial bound conditional on a fixed exposure has been used.
  Since $R ! gt.eq \( R \/ e \)^R$, choosing $C_(*) > 4 e K$ bounds the last expression by $2^(- R) lt.eq
    e^(- c s)$. Sum over $i in T$ to obtain (7.10). Transposition merely reverses the chronological lists and the
    forced transports. The same mixed factorial estimate applies under the original law $bb(P)_P$,
    which proves the reverse assertion too. ◻
]

=== 7.3 Diffusion during regular times <diffusion-during-regular-times>

We now use the downward-induction hypothesis only through the three proved inputs from Sections 5 and 6.
  Assume $sans(I)_p \( P \)$, as defined in (5.4). With the fixed choices of constants there, Proposition 20 gives

#[#set math.equation(numbering: n => "(7.12)")
 $ bb(P)_P \( t upright(" is not regular for ") i \) lt.eq delta := C R^d p^(2 d) +
   C e^(- c R^xi) quad \( i in T \, t in \[ 0 \, beta \) \) \, $ <eq:leakage-delta>]

where $xi > 0$ and the constants are fixed for all $p$ below a preliminary threshold.
  At a regular slice, Proposition 22 states

#[#set math.equation(numbering: n => "(7.13)")
 $ parallel v parallel_2^(2 + 4 \/ d) lt.eq C cal(D)_t \( v \) parallel v parallel_1^(4 \/ d) $ <eq:leakage-nash-input>]

for nonnegative $v$ supported on surviving slots above $B_R \( x_i \)$, with zero extension.
  Finally, Proposition 26 applies to any subset of the anchors regular at that same time and to any nonnegative
  injections of mass at most one per anchor supported above its $R$-ball. Their sum is the divergence of a flow $J$ with

#[#set math.equation(numbering: n => "(7.14)")
 $ sum_e J \( e \)^2 lt.eq C m R^alpha . $ <eq:leakage-flow-input>]

The flow estimate follows from Proposition 24 and the growth condition;
  its applicability to arbitrary injection points and subunit masses is part of its statement.

#thm([Lemma 7.3.])[
  (Decay after enough regular time).  #emph[Let $T$ satisfy (7.1), and assume $sans(I)_p \( P \)$ for $P =
    E union T$, with $p$ below the preliminary threshold in Proposition 20.
    For the localized propagators defined above, in either direction and for $s lt.eq u lt.eq 2 s$,
#[#set math.equation(numbering: n => "(7.15)")
 $ bb(E)_P parallel eta_(i \, u) parallel_2^2 & lt.eq C \( s^(- d \/ 2) + delta \) quad \( i in T \) \,\
bb(E)_P parallel eta_u parallel_2^2 & lt.eq C m #scale(x: 120%, y: 120%)[\[] e^(- c s) +
  R^alpha \( s^(- d \/ 2) + delta \) #scale(x: 120%, y: 120%)[\]] . $ <eq:piece-decay>]

]
] <lem:regular-time-decay>

#proof[
  Put $q_i \( u \) = parallel eta_(i \, u) parallel_2^2$. All localized factors are contractions, so $0 lt.eq
    q_i lt.eq 1$ and $q_i$ is nonincreasing, including at jumps.
    Between jumps the additional killing gives the Dirichlet generator with zero values outside $B_R \( x_i \)$ as
    well as on the physical boundary. Consequently, at every regular smooth time,
    (7.13) and $parallel eta_(i \, u) parallel_1 lt.eq 1$ imply
  #[#set math.equation(numbering: n => "(7.16)")
   $ q'_i \( u \) = - 2 cal(D)_(t \( u \)) \( eta_(i \, u) \) lt.eq -
     c q_i \( u \)^(1 + 2 \/ d) . $ <eq:nash-differential>]
  At other smooth times $q'_i lt.eq 0$. As long as $q_i > 0$,
    the function $q_i^(- 2 \/ d)$ thus increases at a fixed positive rate during regular time and cannot decrease
    at other times or jumps. If $q_i$ reaches zero, it stays zero. It follows in either case that
  $ integral_0^s upright(bold(1))_({ t \( v \) upright(" regular for ") i }) thin upright(d) v gt.eq s \/ 2 quad
    arrow.r.double quad q_i \( u \) lt.eq C s^(- d \/ 2) quad \( s lt.eq u lt.eq 2 s \) . $
  The expected amount of nonregular time in $\[ 0 \, s \]$ is at most $s delta$ by (7.12) and Fubini.
    Markov’s inequality bounds the probability of its exceeding $s \/ 2$ by $2 delta$. This proves (7.15).
    For reverse propagation, $t \( v \)$ simply runs in the opposite direction;
    the same fixed-time estimate (7.12) gives the same integral bound, without changing the probability law.
  At any slot above $z$, only anchors with $x_i in B_R \( z \)$ can contribute to $zeta_u$.
    Their number is at most $L \( 1 + R \)^alpha lt.eq C R^alpha$ by (7.1).
    Hence pointwise Cauchy–Schwarz and summation give
  $ parallel zeta_u parallel_2^2 lt.eq C R^alpha sum_(i in T) q_i \( u \) . $
  Since $0 lt.eq zeta_u lt.eq eta_u lt.eq 1$,
  $ parallel eta_u parallel_2^2 - parallel zeta_u parallel_2^2 =
    sum_k \( eta_u \( k \) - zeta_u \( k \) \) \( eta_u \( k \) + zeta_u \( k \) \) lt.eq 2 parallel eta_u -
    zeta_u parallel_1 . $
  Use Lemma 28 and (7.15) to obtain (7.15). ◻
]

The initial pin mass has now spread sufficiently in mean square.
  The remaining term in (7.8) is its pairing with $g_u$. We next use flows at the very slice where this pairing
  occurs, so that the positive heat energy can absorb it.

=== 7.4 Absorbing the interaction at the same time <absorbing-the-interaction-at-the-same-time>

#thm([Proposition 7.4.])[
  (Expected leakage).  #emph[Fix the constants in the preceding geometric estimates and choose $C_(*)$ as in
    Lemma 28. For all sufficiently small $p > 0$, every finite cube,
    every circular grid of mesh at most $p^(4 d)$, every $E$ consisting of $D_0$ and grid pins,
    and every disjoint single-time grid test $T$ satisfying (7.1), assume $sans(I)_p \( P \)$ for $P = E union T$.
    If $beta gt.eq 5 s$, then, for each of the forward and reverse propagations,
#[#set math.equation(numbering: n => "(7.17)")
 $ bb(E)_P #scale(x: 120%, y: 120%)[\[] parallel f parallel_2^2 -
   parallel C_(2 s) f parallel_2^2 #scale(x: 120%, y: 120%)[\]] gt.eq m \[ 1 - epsilon \( p \) \] \,
   $ <eq:expected-leakage>]

 where one may take
#[#set math.equation(numbering: n => "(7.18)")
 $ epsilon \( p \) = C [e^(- c s) + R^alpha (s^(- d \/ 2) + delta + s^(- 1))] \, wide delta = C R^d p^(2 d) +
   C e^(- c R^xi) . $ <eq:epsilon-definition>]

 All constants are independent of the volume, period, grid, pin sets, and final $p$.]
] <prop:leakage>

#proof[
  For $s lt.eq u lt.eq 2 s$, let
  $ mu_u = sum_(i : thin t \( u \) upright(" regular for ") i) eta_(i \, u) . $
  By (7.9), $0 lt.eq mu_u lt.eq eta_u$. The nonnegative discarded mass is bounded by the localization error plus
    the masses attached to nonregular anchors. Since $0 lt.eq g_u lt.eq 1$ and each local mass is at most one,
    Lemma 28 and (7.12) give
  #[#set math.equation(numbering: n => "(7.19)")
   $ bb(E)_P chevron.l eta_u - mu_u \, g_u chevron.r lt.eq C m \( e^(- c s) + delta \) . $ <eq:discarded-pairing>]
  This uses only pointwise bounds, so dependence of $g_u$ on the same environment causes no change.
  At a fixed regular slice, each summand of $mu_u$ meets exactly the support and mass hypotheses of (7.14).
    Choose a reference orientation for the available edges, with $"div" J$ equal to outgoing minus incoming flow.
    Since $g_u$ is finitely supported, summation by parts has finitely many nonzero terms and gives
  $ chevron.l mu_u \, g_u chevron.r = sum_(e = \( j \, k \)) J \( e \) \( g_u \( j \) - g_u \( k \) \) . $
  Cauchy–Schwarz, (7.14), and $sum_e \| nabla_e g_u \|^2 = 2
    cal(D)_(t \( u \)) \( g_u \)$ imply the deterministic inequality
  #[#set math.equation(numbering: n => "(7.20)")
   $ \| chevron.l mu_u \, g_u chevron.r \| lt.eq #scale(x: 120%, y: 120%)[\(] A cal(D)_(t \( u \)) \( g_u \)
     #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) \, wide A = C m R^alpha . $ <eq:same-time-pairing>]
  It suffices that a flow exists at each time: the resulting inequality contains only measurable propagated
    vectors and energies, so no measurable or continuous choice of flows is required.
  To make the remainder in weighted Young’s inequality integrable at the final time,
    use an averaging density that vanishes linearly there; its tail weight then vanishes quadratically.
    Average (7.8) over $u in \[ s \, 2 s \]$ with probability density
  $ w \( u \) = frac(2 \( 2 s - u \), s^2) \, wide W \( u \) = integral_u^(2 s) w \( v \) thin upright(d) v =
    frac(\( 2 s - u \)^2, s^2) . $
  Since $cal(L)$ is nondecreasing, $cal(L) \( 2 s \) gt.eq integral_s^(2 s) w \( u \) cal(L) \( u \) thin
    upright(d) u$. Tonelli’s theorem shows that the positive energy in this average contains
  $ 2 integral_s^(2 s) W \( u \) cal(D)_(t \( u \)) \( g_u \) thin upright(d) u \; $
  the additional contribution from $\[ 0 \, s \]$ is nonnegative.
    At each $s lt.eq u < 2 s$, weighted Young’s inequality gives
  #[#set math.equation(numbering: n => "(7.21)")
   $ 2 w \( u \) sqrt(A cal(D)_(t \( u \)) \( g_u \)) lt.eq 2 W \( u \) cal(D)_(t \( u \)) \( g_u \) +
     frac(A w \( u \)^2, 2 W \( u \)) . $ <eq:weighted-young>]
  The same-time energy has therefore absorbed the retained pairing. The remaining integral is finite, because
  #[#set math.equation(numbering: n => "(7.22)")
   $ integral_s^(2 s) frac(w \( u \)^2, W \( u \)) thin upright(d) u = 4 / s . $ <eq:weight-integral>]
  The endpoint $u = 2 s$ has measure zero; the quotient has the constant value $4 \/ s^2$ on $\[ s \, 2 s \)$.
  Taking expectation, using (7.19), and then Lemma 29, we conclude that
  $ bb(E)_P cal(L) \( 2 s \) & gt.eq m - C m #scale(x: 120%, y: 120%)[\[] e^(- c s) +
    R^alpha \( s^(- d \/ 2) + delta \) #scale(x: 120%, y: 120%)[\]] - C m \( e^(- c s) + delta \) - C m R^alpha \/ s\
 & gt.eq m [1 - C (e^(- c s) + R^alpha \( s^(- d \/ 2) + delta + s^(- 1) \))] . $
  Here $R gt.eq 1$ allows the unweighted $delta$ error to be included in $R^alpha delta$.
    Every step applied to either ordered propagation, which proves both assertions. ◻
]

=== 7.5 Choosing the constants and closing the finite induction <choosing-the-constants-and-closing-the-finite-induction>

The error has enough room to recover the assumed sparsity with the same parameter $p$.
  Indeed, after $C_(*)$ is fixed, $R$ is comparable to $s = p^(- a)$ for $p lt.eq 1$.
  The nonexponential errors $R^alpha \/ s$, $R^alpha s^(- d \/ 2)$,
  and $R^(alpha + d) p^(2 d)$ in (7.18) are bounded by constant multiples of

#[#set math.equation(numbering: n => "(7.23)")
 $ p^(a \( 1 - alpha \)) \, wide p^(a \( d \/ 2 - alpha \)) \, wide p^(2 d - a \( d + alpha \)) \,
   $ <eq:leakage-exponents>]

respectively. Their exponents satisfy

$ a \( 1 - alpha \) = 1089 / 1000 > 1 \, wide a \( d \/ 2 - alpha \) gt.eq 1639 / 1000 > 1 \, wide 2 d -
  a \( d + alpha \) gt.eq 2689 / 1000 > 1 . $

The last two lower bounds use $d gt.eq 3$; each exponent increases with $d$.
  Both $e^(- c s)$ and $R^alpha e^(- c R^xi)$ are smaller than every fixed power of $p$. Thus

#[#set math.equation(numbering: n => "(7.24)")
 $ epsilon \( p \) = o \( p \) quad \( p arrow.b 0 \) . $ <eq:epsilon-small>]

For clarity, the constant choices can be made in the following order. Fix $d \, ell \, alpha \, nu \, a$.
  Fix the witness scale $b$ and then its growth constant $L gt.eq max { 2 d \, ell \, 4 }$ as in Lemma 18.
  Fix the local connectivity radii and a sufficiently large $M_(*)$ for Proposition 22 and the hull and flow
  constructions of Lemma 23 and Proposition 24. Fix a preliminary $p_0 >
  0$ that absorbs the admissible witness count in Lemma 18;
  retain the resulting fixed constants in Proposition 20, including $c$ and $xi$.
  Next choose $C_(*)$ for Lemma 28. Finally reduce $p lt.eq
  p_0$ so that $R$ exceeds the fixed local radii and the fixed lower bounds needed for the flow comparisons,
  $p < 1 \/ 4$, and $2 epsilon \( p \) lt.eq p$. The limit (7.24) permits all of these final requirements
  simultaneously. No constant in the component tail is recomputed using this final $p$.

#thm([Theorem 7.5.])[
  (Uniform pin estimate).  #emph[For every integer $d gt.eq 3$ and integer slot multiplicity $ell gt.eq 1$,
    there exist $L gt.eq max { 2 d \, ell \, 4 }$ and $p_(*) in \( 0 \, 1 \/ 4 \)$ with the following property.
    Let $0 < p lt.eq p_(*)$ and $beta gt.eq 5 p^(- 11 \/ 10)$.
    In any finite cube $Lambda$, choose a finite circular time grid containing zero and of mesh at most $p^(4 d)$.
    Let $E$ consist of $D_0$ and any subset of the slot points on this grid.
    Then every nonempty test $T$ at a single grid time, disjoint from $E$ and satisfying (7.1), obeys
#[#set math.equation(numbering: n => "(7.25)")
 $ bb(P)_E \( T subset.eq cal(B)_E \) lt.eq p^(\| T \|) . $ <eq:bootstrap-closed>]

 In particular, with $p = p_(*)$ and $beta_0 = 5 p_(*)^(- 11 \/ 10) < oo$, for every finite $beta gt.eq beta_0$,
   every cube, and every slot $j$ at time zero,
#[#set math.equation(numbering: n => "(7.26)")
 $ bb(P)_(D_0) \( j in cal(B)_(D_0) \) lt.eq p_(*) . $ <eq:singleton-missing>]

 The constants depend only on $d$ and $ell$.]
] <thm:pin-bootstrap>

#proof[
  Fix all auxiliary constants in the stated order and choose $p_(*)$ so that every $0 < p lt.eq
    p_(*)$ meets the final requirements. The set of interior slot points on a fixed finite grid is finite.
    Induct on the number of these points missing from $E$. When none is missing there is no disjoint nonempty
    test, so $sans(I)_p \( E \)$ holds vacuously.
  Assume the assertion for pin sets with fewer missing grid points than $E$, and let $T$ be a test for $E$.
    Since $T$ is nonempty and disjoint from $E$, the set $P = E union T$ has strictly fewer missing points.
    The induction hypothesis therefore supplies $sans(I)_p \( P \)$,
    exactly the hypothesis used in Proposition 20 and Proposition 30. The two leakage estimates and Lemma 27 give
  $ bb(E)_P chevron.l f \, \( I - U \) f chevron.r gt.eq m \( 1 - epsilon \( p \) \) . $
  By Lemma 16, or (7.2), it follows that $r lt.eq epsilon \( p \)$. Proposition 6 now yields
  $ bb(P)_E \( T subset.eq cal(B)_E \) lt.eq \( 2 r \)^m lt.eq \( 2 epsilon \( p \) \)^m lt.eq p^m . $
  This proves the induction step for every allowed $T$, and finiteness of the grid completes the induction.
    A singleton interior slot test at time zero satisfies the growth bound, so taking $E = D_0$ gives (7.26).
    A boundary slot belongs to $D_0$, and its missing-cycle probability is zero. This covers all slots. ◻
]

Theorem 31 supplies the uniform missing-cycle bound required for the magnetization argument.
  The grid and the larger pin sets were devices for a finite induction;
  the conclusion (7.26) concerns the original continuous boundary pins alone.

== 8 From pinned loops to a magnetized equilibrium state <sec:kms>

Theorem 31 says that, under boundary pinning, each slot has small probability of belonging to a cycle that misses
  the boundary. We now turn that statement into a state for the original zero-field dynamics.
  First we obtain a tail bound for the exact spectral distribution of total magnetization in a free box.
  A field tending to zero selects that tail, and translation averages produce a state with positive magnetization.
  The last step verifies both boundary values of the KMS strip for that same state.

Fix $d gt.eq 3$ and $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$.
  Let $p_(*)$ be the threshold supplied by Theorem 31 for $ell = 2 S$, and put $p =
  p_(*)$ and $beta_0 \( d \, S \) = 5 p_(*)^(- 11 \/ 10)$. Throughout this Section, $beta gt.eq
  beta_0 \( d \, S \)$ is fixed and finite. Write

$ Lambda_N = \[ - N \, N \]^d ∩ bb(Z)^d \, wide V_N = \| Lambda_N \| \, wide M_N = sum_(x in Lambda_N) S_x^z \,
  wide H_N = H_(Lambda_N) . $

The quantity $V_N$ here is the number of sites; the slot set remains $V_(Lambda_N) = Lambda_N times { 1 \,
  dots.h \, ell }$, with $ell = 2 S$. Let $mu_N$ be the spectral distribution of $M_N$ in the free zero-field
  Gibbs state:

$ mu_N \( I \) =
  frac("Tr" #scale(x: 120%, y: 120%)[\(] e^(- beta H_N) upright(bold(1))_I \( M_N \) #scale(x: 120%, y: 120%)[\)],
  "Tr" \( e^(- beta H_N) \)) quad upright("for Borel sets ") I subset bb(R) . $

By Proposition 3, this is exactly the time-zero magnetization distribution in the cycle-coloring representation.

=== 8.1 A spectral tail with surface-order cost <a-spectral-tail-with-surface-order-cost>

#thm([Lemma 8.1.])[
  (Boundary coloring and a spectral tail).  #emph[For every $N gt.eq 1$,
    let $G_N$ be the event in the zero-field mark-and-color law that every cycle meeting $D_0$ is colored up.
    There is a constant $C_(beta \, d \, S) < oo$, independent of $N$, such that
#[#set math.equation(numbering: n => "(8.1)")
 $ Pr \( G_N \) & gt.eq exp { - C_(beta \, d \, S) \| partial Lambda_N \| } \,\
mu_N \( \[ S V_N \/ 2 \, oo \) \) & gt.eq 1 / 2 exp { - C_(beta \, d \, S) \| partial Lambda_N \| } .
  $ <eq:boundary-color-cost>]

 Conditionally on $G_N$, the uncolored picture has law $bb(P)_(D_0)$,
   and the cycles missing $D_0$ still have independent fair colors.]
] <lem:surface-cost>

#proof[
  Let $n_0$ be the number of cycles meeting $D_0$, and let $J_N$ count inter-site marks incident to a boundary
    site during one period. Every cycle meeting the boundary either contains a time-zero boundary slot or uses an
    inter-site mark incident to the boundary. Indeed, in the absence of a time-zero boundary slot on that cycle,
    a boundary visit must begin by a spatial jump; within-site endpoint permutations do not change the site.
    Each mark has two strands and can witness at most two cycles. Consequently, picture by picture,
  $ n_0 lt.eq ell \| partial Lambda_N \| + 2 J_N . $
  There are at most $2 d ell^2 \| partial Lambda_N \|$ slot edges incident to the boundary.
    Their base rate is $1 \/ 2$. The first factorial bound of Lemma 5, applied with no pins, therefore gives
  $ bb(E)_diameter J_N lt.eq 2 d beta ell^2 \| partial Lambda_N \| \, wide
    bb(E)_diameter n_0 lt.eq \( ell + 4 d beta ell^2 \) \| partial Lambda_N \| . $
  Given a picture, $G_N$ has probability $2^(- n_0)$. Jensen’s inequality now proves (8.1),
    for example with $C_(beta \, d \, S) = \( log 2 \) \( ell + 4 d beta ell^2 \)$.
  Multiplying the zero-field picture weight $2^(\# upright("cycles"))$ by $2^(- n_0)$ leaves precisely the weight
    for cycles missing $D_0$. This proves the assertion about the conditional picture;
    conditioning fixes only the colors of the other cycles. For a time-zero slot $i$, its conditional mean spin is thus
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] 1 - bb(P)_(D_0) \( i in cal(B)_(D_0) \) #scale(x: 120%, y: 120%)[\)] . $
  For an unpinned slot the probability on the right is at most $p$ by the singleton case of Theorem 31;
    for a boundary slot it is zero. Summing over the $ell V_N$ slots gives
  $ bb(E) [M_N / V_N thin mid(bar.v) thin G_N] gt.eq S \( 1 - p \) . $
  Here $M_N$ denotes the random variable in the coloring representation.
    If $q = Pr \( M_N \/ V_N gt.eq S \/ 2 divides G_N \)$, its upper bound $M_N \/ V_N lt.eq S$ implies
  $ S \( 1 - p \) lt.eq S q + S / 2 \( 1 - q \) \, wide q gt.eq 1 - 2 p > 1 / 2 . $
  Multiply by $Pr \( G_N \)$ and use the exact spectral interpretation of the unconditioned coloring law to obtain
    (8.1). ◻
]

The boundary event has not changed the Hamiltonian whose spectral law appears in (8.1).
  It supplies a tail event in the free Gibbs state whose logarithmic cost is of order the boundary size.
  We next select this tail by a homogeneous field whose volume contribution is larger than that cost,
  although the field itself tends to zero. The relation between the zero-field magnetization distribution and
  field-selected spontaneous magnetization goes back to Griffiths #cite(label("Griffiths1966"));
  see also #cite(label("DysonLiebSimon1978")) Section 1. Here the surface-order tail permits the explicit
  volume-dependent field used below.

#thm([Proposition 8.2.])[
  (An explicit vanishing-field limit).  #emph[For $N gt.eq 1$, set
$ h_N = N^(- 1 \/ 2) \, wide K_N = H_N - h_N M_N \, wide rho_N^(upright("in")) \( C \) =
  frac("Tr" \( e^(- beta K_N) C \), "Tr" \( e^(- beta K_N) \)) quad \( C in cal(A)_(Lambda_N) \) . $

 Extend $rho_N^(upright("in"))$ to a state $rho_N$ on $cal(A)$ by the product normalized trace outside $Lambda_N$,
   and define
#[#set math.equation(numbering: n => "(8.2)")
 $ omega_N \( A \) = 1 / V_N sum_(x in Lambda_N) rho_N \( T_x \( A \) \) . $ <eq:translation-average>]

 There is a subsequence $N_j arrow.r oo$ on which $omega_(N_j)$ converges pointwise on $cal(A)$ to a
   translation-invariant state $omega$, and every such subsequential limit satisfies
#[#set math.equation(numbering: n => "(8.3)")
 $ omega \( S_0^z \) gt.eq S \/ 4 . $ <eq:positive-limit-magnetization>]

]
] <prop:magnetized-limit>

#proof[
  Each interaction term commutes with the sum of the two endpoint $z$-spins. This follows directly from
  $ upright(bold(S))_x dot.op upright(bold(S))_y = S_x^z S_y^z + 1 / 2 \( S_x^(+) S_y^(-) + S_x^(-) S_y^(+) \) . $
  Thus $\[ H_N \, M_N \] = 0$. For any $h > 0$, the spectral law in the Gibbs state of $H_N - h M_N$ is exactly
  $ mu_(N \, h) \( thin upright(d) m \) =
    frac(e^(beta h m) mu_N \( thin upright(d) m \), integral e^(beta h u) mu_N \( thin upright(d) u \)) . $
  Bound the numerator on $m < S V_N \/ 4$, and retain only $m gt.eq S V_N \/ 2$ in the denominator. Lemma 32 then gives
  #[#set math.equation(numbering: n => "(8.4)")
   $ mu_(N \, h) \( \( - oo \, S V_N \/ 4 \) \) lt.eq 2 exp {C_(beta \, d \, S) \| partial Lambda_N \| -
     frac(beta h S, 4) V_N} . $ <eq:field-tail>]
  For these cubes,
  $ frac(\| partial Lambda_N \|, V_N) = 1 - (frac(2 N - 1, 2 N + 1))^d lt.eq frac(2 d, 2 N + 1) . $
  At $h = h_N$, the exponent in (8.4) tends to $- oo$: its negative term has order $N^(d - 1 \/ 2)$,
    whereas its positive term has order $N^(d - 1)$. Hence, writing $q_N =
    mu_(N \, h_N) \( \( - oo \, S V_N \/ 4 \) \)$, we have $q_N arrow.r 0$.
    The spectral bounds $- S lt.eq M_N \/ V_N lt.eq S$ imply
  #[#set math.equation(numbering: n => "(8.5)")
   $ rho_N^(upright("in")) \( M_N \/ V_N \) gt.eq S / 4 \( 1 - q_N \) - S q_N = S / 4 -
     frac(5 S, 4) q_N . $ <eq:field-mean>]
  In particular this estimate uses a single explicit volume-field sequence for the fixed $beta$.
  Choose a countable norm-dense set in the union of local matrix algebras,
    closed under rational complex linear combinations and adjoints.
    The bound $\| omega_N \( A \) \| lt.eq parallel A parallel$ permits diagonal subsequence selection on that
    set. Norm approximation then gives pointwise convergence on $cal(A)$.
    The resulting functional $omega$ is linear, normalized and positive,
    since these properties hold for each $omega_N$ and pass to pointwise limits. It is therefore a state.
  For every fixed $y in bb(Z)^d$ and $A in cal(A)$,
  $ \| omega_N \( T_y \( A \) \) - omega_N \( A \) \| lt.eq
    frac(\| \( Lambda_N + y \) triangle.stroked.t Lambda_N \|, V_N) parallel A parallel arrow.r 0 . $
  This proves translation invariance of $omega$. Finally,
  $ omega_N \( S_0^z \) = 1 / V_N sum_(x in Lambda_N) rho_N \( S_x^z \) = rho_N^(upright("in")) \( M_N \/ V_N \) . $
  Taking the limit in (8.5) proves (8.3). ◻
]

=== 8.2 Dynamics far from the translated boundary <subsec:deep-dynamics>

Fix from now on one state subsequence $N_j$ provided by Proposition 33.
  We will prove the KMS condition along this same subsequence for every local pair;
  no further subsequence depending on that pair will be taken.
  The needed dynamical approximation must hold uniformly over translations whose distance from the box boundary
  diverges.

We first check the hypotheses of the dynamics existence theorem cited in Section 1.1,
  #cite(label("NachtergaeleOgataSims2006")) Theorem 2.2. Use the lattice graph metric and the summable function
  $F \( r \) = \( 1 + r \)^(- d - 1)$, which has the convolution bound required there.
  The interaction is supported on nearest-neighbor pairs, each term has norm at most $3 S^2$,
  and every site belongs to $2 d$ such pairs. Thus its interaction norm in that theorem is finite,
  with parameter $a = 0$.

For a finite cube $Gamma$, write $tau_t^Gamma \( B \) = e^(i t H_Gamma) B e^(- i t H_Gamma)$,
  acting trivially outside $Gamma$. Likewise let

$ alpha_z^N \( B \) = e^(i z K_N) B e^(- i z K_N) wide \( z in bb(C) \) . $

For real $t$, these maps are isometric automorphisms. For complex $z$,
  $alpha_z^N$ is defined on the entire quasi-local algebra because $K_N$ is a bounded local operator.

#thm([Lemma 8.3.])[
  (Uniform approximation in deep translated boxes).  #emph[Let $B$ be a local observable,
    let $L$ be a finite set containing $"supp" B$ and the origin, and let $0 < T < oo$. Then
#[#set math.equation(numbering: n => "(8.6)")
 $ lim_(r arrow.r oo) med sup_(Gamma upright(" a finite cube")\
"dist"_oo \( L \, Gamma^c \) gt.eq r) med sup_(\| t \| lt.eq T) parallel tau_t^Gamma \( B \) -
  tau_t \( B \) parallel = 0 . $ <eq:deep-box-zero-field>]

 Here $Gamma^c = bb(Z)^d \\ Gamma$. If
$ I_N = { x in Lambda_N : "dist"_oo \( x \, Lambda_N^c \) gt.eq floor.l sqrt(N) floor.r } \, $

 then $\| Lambda_N \\ I_N \| \/ V_N arrow.r 0$ and
#[#set math.equation(numbering: n => "(8.7)")
 $ lim_(N arrow.r oo) sup_(x in I_N) sup_(\| t \| lt.eq T) parallel alpha_t^N \( T_x \( B \) \) -
   T_x \( tau_t \( B \) \) parallel = 0 . $ <eq:deep-box-with-field>]

]
] <lem:deep-dynamics>

#proof[
  First fix $t$. If (8.6) failed at that time, there would be $epsilon >
    0$ and cubes $Gamma_k$ whose distances from $L$ to their complements tend to infinity,
    with $parallel tau_t^(Gamma_k) \( B \) - tau_t \( B \) parallel gt.eq epsilon$.
    Such cubes contain centered boxes with radii tending to infinity.
    We can therefore select a subsequence that is increasing by inclusion and exhausts $bb(Z)^d$:
    after any finite selected cube, a sufficiently late cube contains it and the next prescribed centered box.
    This contradicts the norm convergence along increasing boxes in the definition of $tau_t$.
  To make this convergence uniform in time, write $Phi \( { u \, v } \) = -
    upright(bold(S))_u dot.op upright(bold(S))_v$. Only edges meeting $L$ contribute to $\[ H_Gamma \, B \]$,
    so for every $Gamma$
  $ parallel \[ H_Gamma \, B \] parallel lt.eq 2 parallel B parallel sum_(e upright(" nearest-neighbor edge")\
e ∩ L eq.not diameter) parallel Phi \( e \) parallel = : c_B < oo . $
  Consequently $parallel tau_t^Gamma \( B \) - tau_u^Gamma \( B \) parallel lt.eq c_B \| t - u \|$.
    Passing to the infinite-volume limit gives the same bound for $tau_t \( B \)$.
    A finite mesh of $\[ - T \, T \]$, together with the fixed-time conclusion, proves (8.6).
  For $x in I_N$, set $Gamma = Lambda_N - x$. Then $"dist"_oo \( L \, Gamma^c \) arrow.r
    oo$ uniformly over these $x$, since $L$ is fixed. For all sufficiently large $N$, $L subset Gamma$.
    Define the local rotation
  $ gamma_theta^L \( B \) = e^(i theta sum_(u in L) S_u^z) B e^(- i theta sum_(u in L) S_u^z) . $
  The commutation $\[ H_N \, M_N \] = 0$ and translation of the finite Hamiltonian give the exact formula
  #[#set math.equation(numbering: n => "(8.8)")
   $ T_(- x) #scale(x: 120%, y: 120%)[\(] alpha_t^N \( T_x \( B \) \) #scale(x: 120%, y: 120%)[\)] =
     tau_t^Gamma #scale(x: 120%, y: 120%)[\(] gamma_(- h_N t)^L \( B \) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:field-rotation-sign>]
  The norm effect of this rotation is bounded by
  $ parallel gamma_(- h_N t)^L \( B \) - B parallel lt.eq h_N \| t \| ∥[sum_(u in L) S_u^z \, B]∥ . $
  Use the isometry of $tau_t^Gamma$, followed by (8.6), to prove (8.7).
    Finally, the excluded sites lie in a layer of thickness at most $floor.l sqrt(N) floor.r$,
    whose fraction of the cube is $O \( N^(- 1 \/ 2) \)$. ◻
]

=== 8.3 The analytic strip and its two boundary values <the-analytic-strip-and-its-two-boundary-values>

We will use the following elementary strip lemma. Its first part establishes a common strip bound from finite,
  possibly nonuniform interior bounds. Only after obtaining that common bound does its second part use Gaussian
  decay to control convergence on the whole boundary.

#thm([Lemma 8.4.])[
  (Bounded strip limits).  #emph[Fix $beta > 0$, and put $cal(S)_beta = { z in bb(C) : 0 lt.eq "Im" z lt.eq
    beta }$. Let $\( F_n \)_(n gt.eq 1)$ be functions continuous on $cal(S)_beta$, analytic in its interior,
    and individually bounded there. Suppose a constant $C gt.eq 0$ satisfies
$ \| F_n \( t \) \| lt.eq C \, wide \| F_n \( t + i beta \) \| lt.eq C quad \( n gt.eq 1 \, med t in bb(R) \) . $

 Then $\| F_n \( z \) \| lt.eq C$ throughout $cal(S)_beta$.
   If the two boundary sequences converge locally uniformly on $bb(R)$ to $f_0$ and $f_beta$, respectively,
   then the full sequence $F_n$ converges locally uniformly on the closed strip to a bounded function $F$,
   continuous on the closed strip and analytic in its interior, with
$ \| F \( z \) \| lt.eq C \, wide F \( t \) = f_0 \( t \) \, wide F \( t + i beta \) = f_beta \( t \) . $

]
] <lem:strip-limit>

#proof[
  Fix $n$, and let $M_n < oo$ bound $\| F_n \|$ on the strip.
    For $epsilon > 0$, apply the maximum principle to $e^(- epsilon z^2) F_n \( z \)$ on $\[ - R \, R \] +
    i \[ 0 \, beta \]$. Its modulus is at most $C e^(epsilon beta^2)$ on the horizontal sides and at most $M_n
    e^(- epsilon R^2 + epsilon beta^2)$ on the vertical sides.
    Send $R arrow.r oo$ while holding a point $z$ fixed, then send $epsilon arrow.b 0$.
    This proves $\| F_n \( z \) \| lt.eq C$. Only the already assumed finite bound $M_n$ was needed to remove the
    vertical sides.
  Now set $G_n \( z \) = e^(- z^2) F_n \( z \)$. The common bound just proved implies
  $ \| G_n \( t + i y \) \| lt.eq C e^(- t^2 + y^2) quad \( 0 lt.eq y lt.eq beta \) . $
  Local uniform convergence of the two boundary sequences and the Gaussian tail therefore make $\( G_n \)$
    uniformly Cauchy on both horizontal edges. Write
  $ delta_(n \, m) = max_(y in { 0 \, beta }) sup_(t in bb(R)) \| G_n \( t + i y \) - G_m \( t + i y \) \| \; wide
    delta_(n \, m) arrow.r 0 . $
  The maximum principle on the same rectangles, now applied to $G_n - G_m$,
    has horizontal bound $delta_(n \, m)$ and vertical bound $2 C e^(- R^2 + beta^2)$. Letting $R arrow.r oo$ shows
  $ sup_(z in cal(S)_beta) \| G_n \( z \) - G_m \( z \) \| lt.eq delta_(n \, m) . $
  Hence $G_n$ converges uniformly on the closed strip to a continuous function $G$, analytic in the interior.
    Multiplication by $e^(z^2)$ gives local uniform convergence of $F_n$ on the closed strip to $F = e^(z^2) G$.
    Its claimed boundary values and the bound $\| F \| lt.eq C$ follow by taking pointwise limits. ◻
]

#proof[
  #emph[Completion of the proof of Theorem 1.] Let $omega$ and $N_j$ be as in Proposition 33.
    For local observables $A \, B$, define the entire functions
  #[#set math.equation(numbering: n => "(8.9)")
   $ F_N^(A \, B) \( z \) = 1 / V_N sum_(x in Lambda_N) rho_N #scale(x: 120%, y: 120%)[\(] T_x \( A \)
     alpha_z^N \( T_x \( B \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:finite-strip-functions>]
  Trace cyclicity gives both identities
  #[#set math.equation(numbering: n => "(8.10)")
   $ F_N^(A \, B) \( t \) & = 1 / V_N sum_(x in Lambda_N) rho_N #scale(x: 120%, y: 120%)[\(] T_x \( A \)
     alpha_t^N \( T_x \( B \) \) #scale(x: 120%, y: 120%)[\)] \,\
F_N^(A \, B) \( t + i beta \) & = 1 / V_N sum_(x in Lambda_N) rho_N #scale(x: 120%, y: 120%)[\(]
  alpha_t^N \( T_x \( B \) \) T_x \( A \) #scale(x: 120%, y: 120%)[\)] . $ <eq:finite-bottom-edge>]
  These formulas also hold when the translated supports cross the boundary of $Lambda_N$.
    To see this without a support restriction, take a finite set containing $Lambda_N$ and both translated
    supports. On its matrix algebra the density of $rho_N$ is $e^(- beta K_N) \/
    "Tr" \( e^(- beta K_N) \)$ tensored with a normalized identity.
    Equivalently, it is the Gibbs density for the operator $K_N ⊗ I$ on that larger algebra.
    The dynamics is generated by that same operator, so finite-dimensional trace cyclicity proves (8.10) there as well.
  For real $t$, the isometry of $alpha_t^N$ bounds both right-hand sides by $parallel A parallel parallel B
    parallel$. Before using any common strip bound, we also have the finite bound
  $ \| F_N^(A \, B) \( t + i y \) \| lt.eq parallel A parallel parallel B parallel
    e^(2 beta parallel K_N parallel) quad \( t in bb(R) \, med 0 lt.eq y lt.eq beta \) . $
  Indeed, the real-time unitary factors have norm one, and $parallel e^(plus.minus y K_N) parallel lt.eq
    e^(beta parallel K_N parallel)$. The first part of Lemma 35 therefore applies and gives the uniform bound
  #[#set math.equation(numbering: n => "(8.11)")
   $ \| F_N^(A \, B) \( z \) \| lt.eq parallel A parallel parallel B parallel
     quad \( z in cal(S)_beta \, med N gt.eq 1 \) . $ <eq:strip-product-bound>]
  We next identify the two boundary limits. Given $0 < T < oo$,
    Lemma 34 supplies numbers $epsilon_N \( T \) arrow.r 0$ bounding the norm error in (8.7) on $I_N$.
    On its complement the error is at most $2 parallel B parallel$, since both real-time dynamics are isometric.
    It follows that, uniformly for $\| t \| lt.eq T$,
  #[#set math.equation(numbering: n => "(8.12)")
   $ lr(|F_N^(A \, B) \( t \) - omega_N \( A tau_t \( B \) \)|) & lt.eq parallel A parallel epsilon_N \( T \) +
     2 parallel A parallel parallel B parallel frac(\| Lambda_N \\ I_N \|, V_N) \,\
lr(|F_N^(A \, B) \( t + i beta \) - omega_N \( tau_t \( B \) A \)|) & lt.eq
  parallel A parallel epsilon_N \( T \) + 2 parallel A parallel parallel B parallel
  frac(\| Lambda_N \\ I_N \|, V_N) . $ <eq:bottom-edge-error>]
  For example, the comparison term in the first line is exactly $V_N^(- 1) sum_x
    rho_N \( T_x \( A \) T_x \( tau_t \( B \) \) \)$, which equals $omega_N \( A tau_t \( B \) \)$;
    the second line retains the opposite operator order. Thus both error bounds tend to zero.
  The maps $t mapsto A tau_t \( B \)$ and $t mapsto tau_t \( B \) A$ are norm-continuous.
    Their images of a compact time interval are norm-compact.
    Pointwise convergence $omega_(N_j) \( C \) arrow.r omega \( C \)$ is uniform over each such image:
    use a finite norm net and the common functional norm one. Therefore, along the already chosen subsequence,
  $ F_(N_j)^(A \, B) \( t \) & arrow.r omega \( A tau_t \( B \) \) \,\
F_(N_j)^(A \, B) \( t + i beta \) & arrow.r omega \( tau_t \( B \) A \) $
  locally uniformly for real $t$. Lemma 35 now gives a bounded continuous function $F_(A \, B)$ on the closed
    strip, analytic in its interior, with precisely these two boundary values and
  #[#set math.equation(numbering: n => "(8.13)")
   $ sup_(z in cal(S)_beta) \| F_(A \, B) \( z \) \| lt.eq parallel A parallel parallel B parallel .
     $ <eq:local-kms-bound>]
  Since the strip limit uses the full state subsequence, the bilinearity of (8.9) passes to $F_(A \, B)$.
  It remains to obtain the asserted condition on the entire algebra.
    Let $A_n \, B_n$ be local observables converging in norm to arbitrary $A \, B in cal(A)$.
    Bilinearity and (8.13) imply
  $ sup_(z in cal(S)_beta) \| F_(A_n \, B_n) \( z \) - F_(A_m \, B_m) \( z \) \| lt.eq parallel A_n -
    A_m parallel parallel B_n parallel + parallel A_m parallel parallel B_n - B_m parallel . $
  Hence these functions converge uniformly on the closed strip to a bounded continuous $F_(A \, B)$,
    analytic in the interior. The same inequality proves independence of the approximating sequences and the bound
    $sup \| F_(A \, B) \| lt.eq parallel A parallel parallel B parallel$.
    Since states have norm one and $tau_t$ is isometric, norm approximation passes both boundary identities to the
    limit, uniformly in real $t$:
  $ F_(A \, B) \( t \) = omega \( A tau_t \( B \) \) \, wide F_(A \, B) \( t + i beta \) =
    omega \( tau_t \( B \) A \) . $
  This is the full $beta$-KMS condition (1.2) for the zero-field dynamics $tau$ defined in Section 1.1.
    The state is translation invariant and satisfies $omega \( S_0^z \) gt.eq S \/ 4 > 0$ by Proposition 33.
    Since $beta$ was any fixed finite number at least $beta_0 \( d \, S \)$, Theorem 1 follows. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
