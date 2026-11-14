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

#align(center)[#text(size: 16pt, weight: "bold")[Bloch's Law for Finite-Range Heisenberg \
Ferromagnets in Three Dimensions]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Bloch’s law predicts that the spontaneous magnetization of a three-dimensional ferromagnet falls below its fully
  polarized value by an amount proportional to $T^(3 \/ 2)$ at low temperature.
  We prove this law for the quantum Heisenberg ferromagnet at every fixed spin,
  allowing any nonnegative symmetric finite-range interaction whose support generates the lattice.
  The interaction may be spatially anisotropic and need not contain the ordinary nearest-neighbor bonds.
  Its quadratic dispersion determines the leading coefficient.

=== 1.1 The model and the result <the-model-and-the-result>

Fix $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$. The spin space at each site is $frak(h)_S = bb(C)^(2 S + 1)$,
  with orthonormal basis $\( e_m \)_(m = - S)^S$ and operators

$ S^z e_m = m e_m \, wide S^(+) e_m = sqrt(S \( S + 1 \) - m \( m + 1 \)) thin e_(m + 1) quad \( m < S \) \, wide
  S^(+) e_S = 0 . $

Set $S^(-) = \( S^(+) \)^(*)$, $S^x = \( S^(+) + S^(-) \) \/ 2$, and $S^y = \( S^(+) - S^(-) \) \/ \( 2 i \)$.
  A subscript specifies the site where an operator acts. Let $J :
  bb(Z)^3 arrow.r \[ 0 \, oo \)$ have finite support and satisfy

#[#set math.equation(numbering: n => "(1.1)")
 $ J \( 0 \) = 0 \, wide J \( z \) = J \( - z \) \, wide chevron.l z : J \( z \) > 0 chevron.r_(bb(Z)) =
   bb(Z)^3 . $ <eq:interaction>]

On $Lambda_N = \[ - N \, N \]^3 ∩ bb(Z)^3$, with free boundary, define

#[#set math.equation(numbering: n => "(1.2)")
 $ H_(S \, N)^J = - 1 / 2 sum_(x \, y in Lambda_N) J \( y - x \) bold(S)_x dot.op bold(S)_y \, wide M_(S \, N) =
   sum_(x in Lambda_N) S_x^z . $ <eq:hamiltonian>]

The sum counts each unordered bond twice; the factor $1 \/ 2$ removes that duplication.
  We set the lattice spacing, Boltzmann constant, and $ℏ$ equal to one, so $T = beta^(- 1)$.

For $beta > 0$ and $h in bb(R)$, put

#[#set math.equation(numbering: n => "(1.3)")
 $ p_beta \( h \) = lim_(N arrow.r oo) frac(1, beta \| Lambda_N \|) log "Tr"
   e^(- beta \( H_(S \, N)^J - h M_(S \, N) \)) \, wide m_(S \, J) \( beta \) =
   partial_h^(+) p_beta \( 0 \) . $ <eq:pressure-magnetization>]

The finite-range pressure limit exists and is convex and $S$-Lipschitz; Section 7 recalls the proof.
  Rotation by $pi$ about the $x$-axis makes the pressure even, so $m_(S \, J) \( beta \) in \[ 0 \, S \]$.
  The derivative selects the magnetization in a field tending to zero through positive values after the
  thermodynamic limit.

Define the positive definite matrix

#[#set math.equation(numbering: n => "(1.4)")
 $ D_(S \, J) = S / 2 sum_(z in bb(Z)^3) J \( z \) z z^(sans(T)) . $ <eq:diffusion-matrix>]

It is the quadratic coefficient of the one-magnon dispersion:

#[#set math.equation(numbering: n => "(1.5)")
 $ epsilon_(S \, J) \( k \) = S sum_z J \( z \) \( 1 - cos \( k dot.op z \) \) = k^(sans(T)) D_(S \, J) k +
   O \( \| k \|^4 \) . $ <eq:dispersion>]

Positive definiteness follows because the interaction support spans $bb(R)^3$.

#thm([Theorem 1.1.])[
  (Bloch’s law).  #emph[For every fixed $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$ and every interaction satisfying (1.1),
#[#set math.equation(numbering: n => "(1.6)")
 $ lim_(beta arrow.r oo) beta^(3 \/ 2) #scale(x: 120%, y: 120%)[\(] S -
   m_(S \, J) \( beta \) #scale(x: 120%, y: 120%)[\)] =
   frac(zeta \( 3 \/ 2 \), 8 pi^(3 \/ 2) sqrt(det D_(S \, J))) . $ <eq:bloch-law>]

]
] <thm:main>

For $J \( plus.minus e_j \) = 1$ and all other couplings zero, $D_(S \, J) = S I$;
  the theorem gives the usual nearest-neighbor coefficient $zeta \( 3 \/ 2 \) \/ \( 8 pi^(3 \/ 2) S^(3 \/ 2) \)$.
  The order of limits is part of the assertion: first volume tends to infinity at fixed $beta \, h$,
  then $h arrow.b 0$, and finally $beta arrow.r oo$, with $S \, J$ fixed.

=== 1.2 Historical context and dependencies <historical-context-and-dependencies>

Bloch derived the $T^(3 \/ 2)$ reduction from long-wavelength spin waves [2].
  The bosonic representation of Holstein and Primakoff [10] and Dyson’s analysis of spin-wave interactions [6,7]
  developed the low-temperature expansion. In particular, Dyson identified the interaction contribution to the
  magnetization at order $T^4$; his estimates of the remaining higher-order terms were not a rigorous fixed-spin
  proof of the asymptotic law [7] Section 9. The leading coefficient in (1.6) is obtained from the low-temperature
  density of ideal magnons with quadratic energy $k^(sans(T)) D_(S \, J) k$.
  The issue is to justify this coefficient for the interacting spin system and the field derivative in (1.3).

Rigorous ordering theory distinguishes sharply between dimensions and between classical and quantum models.
  Mermin and Wagner excluded positive-temperature spontaneous magnetic order for the one- and two-dimensional
  isotropic Heisenberg models under their finite-range hypotheses [12].
  Infrared bounds proved symmetry breaking for classical models [9], and Dyson, Lieb,
  and Simon established ordering for classes of quantum antiferromagnets [8].
  These developments left the standard three-dimensional quantum ferromagnet as a separate problem,
  recorded by Lieb [11] and still discussed as open in recent accounts [16,1].
  The distinct companion manuscript [15] Theorem 1.1 proves low-temperature magnetized equilibrium states for the
  nearest-neighbor quantum ferromagnet. We use its finite-set algebra and deterministic lattice geometry,
  with their precise hypotheses stated at the points of use.

The free energy has a different rigorous history. Conlon and Solovej [4] and Tóth [17] obtained bounds for spin
  $1 \/ 2$. Correggi, Giuliani, and Seiringer proved the leading low-temperature free-energy asymptotic for the
  nearest-neighbor model on $bb(Z)^3$ at every fixed spin [5] Theorem 2.1.
  A zero-field free-energy estimate does not by itself control the one-sided field derivative that defines
  spontaneous magnetization. Our proof therefore estimates the observable through a representation that remains
  uniform under arbitrary extra up-spin constraints, and only then passes to pressure increments.

The probabilistic representation belongs to the random-interchange approach of Tóth [17];
  the symmetric-slot realization of higher spin is described by Nachtergaele [13].
  The pin argument uses the stable-polynomial approach to negative dependence developed by Borcea, Brändén,
  and Liggett [3]. Diffusive smoothing uses the energy method of Nash [14].
  The companion [15] provides the particular stable exchange symbols, presence inequality,
  local lattice inequality, and routed unit flows used below.
  We prove here the finite-range pin bootstrap, the quantitative long-return bound,
  and the comparison that recovers the full dispersion.

=== 1.3 How returns determine the coefficient <how-returns-determine-the-coefficient>

Represent each spin by $ell = 2 S$ spin-$1 \/ 2$ #emph[slots].
  Independent Poisson exchanges between slots, followed by a uniform permutation of the slots at each site,
  form directed cycles over a time period of length $beta$. A cycle has a single up or down color.
  Constraining all cycles through the boundary and through specified slot-time points to be up defines a #emph[pin
  law]. If $E$ is its pin set and $i$ is an unpinned slot-time point, a change of weights gives

$ d_E \( i \) = frac(r \( E \, { i } \), 1 + r \( E \, { i } \)) \, $

where $d_E \( i \)$ is its down probability. Under the law with $i$ also pinned,
  $r \( E \, { i } \)$ is the probability that the directed line from $i$ returns to $i$ at positive elapsed time
  before meeting $E$. Section 2 makes this identity precise and represents $r$ by a walk on the slots left after
  exposing the cycles missing the augmented pin set. The exposed environment repeats over periods,
  while the walk uses fresh transition randomness on every traversal.

There are two geometric tasks. For rough estimates, choose three linearly independent interaction vectors.
  They generate a sublattice of finite index; on each of its cosets,
  the chosen bonds form a copy of the ordinary cubic lattice.
  Section 3 transfers local Nash and flow estimates to these copies and compares their energies with the full
  interaction energy. Section 4 then proves a sparse-pin estimate by downward induction on the pin set.
  This induction supplies enough regular time for diffusion without assuming a finite-range ordering theorem.

Sharp asymptotics require all interaction bonds. The ideal walk has site jump rates $S J \( z \)$,
  and its heat kernel $p_t^(S \, J)$ satisfies

$ p_t^(S \, J) \( x \, x \) tilde.op kappa t^(- 3 \/ 2) \, wide
  kappa = \( 4 pi \)^(- 3 \/ 2) \( det D_(S \, J) \)^(- 1 \/ 2) . $

After a full traversal the slot index is uniform, so the ideal $n$-period return probability to a specified slot
  is $ell^(- 1) p_(n beta)^(S \, J) \( x \, x \)$. Summing over the $ell$ slots at a site cancels this factor,
  leaving the finite sums $kappa sum_(n lt.eq K) n^(- 3 \/ 2)$ that approach the Bloch coefficient.
  The selected sublattice is used only for estimates; the full jump kernel determines this coefficient.

The main analytic difficulty is controlling arbitrarily late returns in the same repeated environment.
  Section 5 truncates a quadratic hitting-probability identity after $K$ periods.
  A mass already spread for time comparable to $K beta$ has a flow to infinity with energy at most
  $C \( K beta \)^(- 1 \/ 2)$. Averaging over one further period gives a remainder bounded by $C K^(- 1 \/ 2)
  beta^(- 3 \/ 2) + o_K \( beta^(- 3 \/ 2) \)$, with $C$ independent of $K$.
  Its $K = 1$ case first improves the exposed-slot density to $O \( beta^(- 3 \/ 2) \)$.

This improved density permits the comparison in Section 6.
  The ideal path rarely encounters an exposed strand over a fixed number of periods.
  Splitting a return at its midpoint combines that small encounter probability with diffusive smoothing,
  giving an error $o_K \( beta^(- 3 \/ 2) \)$ in each return entry.
  The comparison retains the same exposed environment in both halves;
  independence of their environments is unnecessary. The finite-return comparison and the long-return remainder
  give matching upper and lower down-probability bounds, with the lower bound requiring a pin-free neighborhood of
  the starting point.

Finally, Section 7 expresses a positive field as a mixture of extra pins.
  The probability of selecting any given slot is at most $1 - e^(- beta h)$,
  so the required neighborhood is free of extra pins with probability tending to one as $h arrow.b
  0$ at fixed $beta \, K$. Integrating the finite-volume derivative bounds before taking the thermodynamic limit
  proves (1.6) in the stated order. The uniform pin estimates, the finite-index geometric reduction,
  and the energy bound for a spread source are the reusable parts of the argument.

== 2 Exchange pictures and pinned returns <sec:pins>

We express the magnetization through colored exchange cycles,
  then turn pinning probabilities into one-particle return probabilities. Two changes of law are involved.
  Pinning removes the color factor from cycles that meet the pins.
  Exposing the cycles that avoid the pins leaves a conditional exchange process on the remaining slots.
  The last part of this section identifies its first return moment with an unconditioned Markov walk in the
  exposed environment. These constructions are finite-dimensional; the spatial estimates begin in Section 3.

=== 2.1 Spin slots and the exchange law <spin-slots-and-the-exchange-law>

Fix $beta > 0$ and a cube $Lambda = Lambda_N$. Set $ell = 2 S$ and

$ b_0 = max { \| z \|_oo : J \( z \) > 0 } \, wide partial Lambda = { x in Lambda :
  "dist"_oo \( x \, bb(Z)^3 \\ Lambda \) lt.eq b_0 } \, wide Lambda^compose = Lambda \\ partial Lambda . $

No interaction bond joins $Lambda^compose$ to the exterior of $Lambda$.
  The #emph[slots] are the elements of $V_Lambda = Lambda times { 1 \, dots.h \, ell }$.
  Above each unordered bond ${ x \, y } subset Lambda$ with $J \( y - x \) > 0$,
  include all $ell^2$ unordered slot pairs. Write $cal(E)_Lambda$ for the resulting slot edges and set

$ J_e = J \( y - x \) \, wide c_e = J_e / 2 quad \( e upright(" above ") { x \, y } \) \, wide w_Lambda =
  sum_(e in cal(E)_Lambda) J_e . $

Under the #emph[base law] $bb(P)_(upright(b))$, every slot edge $e$ carries an independent Poisson process of rate
  $c_e$ on $\[ 0 \, beta \)$. At a mark the two slot lines exchange.
  At the end of the interval, independent uniform permutations of the slots at each site join time $beta$ to time
  $0$. We call these within-site permutations the #emph[seam completions].
  A picture $omega$ consists of its marks and completions. Following its lines through repeated copies of the same
  picture gives directed cycles. Their intersections with the time-zero layer are the cycles of a permutation of
  $V_Lambda$.

Time belongs to $bb(R) \/ beta bb(Z)$. At an exchange we use the slot just after that exchange,
  and at time zero we use the slot just after the seam completion.
  Deterministic times almost surely avoid Poisson marks. If $a_C$ is the number of time-zero slots on a cycle $C$,
  then $sum_C a_C = ell \| Lambda \|$. A cycle coloring is a choice $sigma_C in { - 1 \, 1 }$ for each cycle;
  its magnetization is

$ M \( sigma \) = 1 / 2 sum_C a_C sigma_C . $

#thm([Proposition 2.1.])[
  (Loop representation).  #emph[For every finite cube, every $beta > 0$, and every real $h$,
#[#set math.equation(numbering: n => "(2.1)")
 $ Z_Lambda \( h \) := "Tr" e^(- beta \( H_(S \, N)^J - h M_(S \, N) \)) =
   e^(beta w_Lambda \/ 4) thin bb(E)_(upright(b)) sum_sigma e^(beta h M \( sigma \)) . $ <eq:loop-partition>]

 At zero field the Gibbs spectral law of total magnetization is obtained by weighting each picture by
   $2^(\# { upright("cycles") })$, coloring its cycles independently and fairly, and evaluating $M \( sigma \)$.
   More precisely, for every function $Phi$ on the finite spectrum of $M_(S \, N)$,
#[#set math.equation(numbering: n => "(2.2)")
 $
   frac("Tr" #scale(x: 120%, y: 120%)[\(] e^(- beta H_(S \, N)^J) Phi \( M_(S \, N) \)
   #scale(x: 120%, y: 120%)[\)], Z_Lambda \( 0 \)) =
   frac(bb(E)_(upright(b)) sum_sigma Phi \( M \( sigma \) \), bb(E)_(upright(b)) 2^(\# { upright("cycles") })) .
   $ <eq:loop-spectral-law>]

]
] <prop:loop-representation>

#proof[
  This is the exchange representation of Tóth [17], with the higher-spin symmetric-slot construction of
    Nachtergaele [13] Section 2.2; see also [15] Lemma 2.1. At one site let $psi_k$ be the normalized sum of the
    elementary spin-$1 / 2$ tensors having $k$ up spins, $0 lt.eq k lt.eq ell$.
    The sum of the slot $z$-spins acts on $psi_k$ by $k - ell \/ 2$,
    and the sum of the raising operators acts by $sqrt(\( ell - k \) \( k + 1 \)) thin psi_(k + 1)$.
    These are the spin-$S$ matrices under $k = S + m$. Thus the physical space is the range of
  $ cal(S)_Lambda = product_(x in Lambda) cal(S)_x \, wide cal(S)_x =
    frac(1, ell !) sum_(kappa in frak(S)_ell) cal(U)_(kappa \, x) \, $
  where $cal(U)$ denotes tensor permutation on the slot space.
  The spin-$1 / 2$ identity $bold(s)_i dot.op bold(s)_j = 1 / 2 cal(U)_(\( i j \)) - 1 /
    4 I$ gives the lifted Hamiltonian
  $ hat(H) = - 1 / 2 sum_e J_e cal(U)_e + 1 / 4 w_Lambda I \, wide hat(M) = sum_(i in V_Lambda) s_i^z . $
  The full sum over all slot pairs above each bond commutes with every within-site permutation,
    and hence with $cal(S)_Lambda$. The Poisson product $phi$ of the exchanges satisfies
  $ bb(E)_(upright(b)) cal(U)_phi = exp {beta sum_e c_e \( cal(U)_e - I \)} =
    e^(- beta w_Lambda \/ 4) e^(- beta hat(H)) . $
  For example, the first equality follows from the matrix evolution with generator $sum_e c_e \( cal(U)_e - I \)$;
    no commutation of individual transpositions is needed. Averaging the seam completions inserts $cal(S)_Lambda$.
    Taking the trace after multiplication by $e^(beta h hat(M))$ proves (2.1):
    in the elementary up/down basis, a tensor permutation has a nonzero diagonal entry exactly when the coloring
    is constant on each cycle. The same calculation with any function of $hat(M)$ proves the spectral-law assertion. ◻
]

=== 2.2 Pins, boundary approximation, and mark counts <pins-boundary-approximation-and-mark-counts>

A #emph[pin] is a specified slot-time point. Define the continuous boundary pin set

$ D_0 = partial Lambda times { 1 \, dots.h \, ell } times \( bb(R) \/ beta bb(Z) \) . $

An #emph[allowed] pin set is $D = D_0 union F$ with $F$ finite and deterministic.
  We also use finite pin sets before taking the boundary limit. For either type of set, put

$ n_D \( omega \) = \# { C : C ∩ D = diameter } \, wide cal(B)_D \( omega \) =
  union.big_(C : thin C ∩ D = diameter) C \, wide cal(Z)_D = bb(E)_(upright(b)) 2^(n_D) \, $

and define

#[#set math.equation(numbering: n => "(2.3)")
 $ bb(P)_D \( d omega \) = cal(Z)_D^(- 1) 2^(n_D \( omega \)) bb(P)_(upright(b)) \( d omega \) . $ <eq:pinned-law>]

The normalizer obeys $1 lt.eq cal(Z)_D lt.eq 2^(\| V_Lambda \|)$.
  In the associated zero-field color law, cycles meeting $D$ are up and the remaining cycles receive independent
  fair colors. Denote by $d_D \( i \)$ the probability that a slot-time point $i$ is down. Then

#[#set math.equation(numbering: n => "(2.4)")
 $ 2 d_D \( i \) = bb(P)_D \( i in cal(B)_D \) . $ <eq:down-free-cycle>]

#thm([Lemma 2.2.])[
  (Dense boundary cuts).  #emph[Let $F$ be a finite deterministic pin set and let $cal(T)_n$ be increasing finite
    sets of times containing zero, with dense union. Set
$ D_n = F union #scale(x: 120%, y: 120%)[\(] partial Lambda times { 1 \, dots.h \, ell } times
  cal(T)_n #scale(x: 120%, y: 120%)[\)] \, wide D = F union D_0 . $

 Almost surely, $n_(D_n) = n_D$ and $cal(B)_(D_n) = cal(B)_D$ for all sufficiently large $n$.
   Moreover $bb(P)_(D_n)$ converges to $bb(P)_D$ in total variation.
   If bounded observables $X_n$ converge almost surely to $X$, with a common deterministic bound,
   then $bb(E)_(D_n) X_n arrow.r bb(E)_D X$.]
] <lem:dense-boundary>

#proof[
  There are finitely many marks per period, their times are distinct, and seam completions preserve sites.
    Every visit to the boundary therefore contains a time interval of positive length and is detected by a cut
    from the dense union. There are finitely many cycles, so one finite cut set eventually detects every
    boundary-touching cycle. The asserted eventual equalities follow.
    Since $1 lt.eq 2^(n_(D_n)) lt.eq 2^(\| V_Lambda \|)$, bounded convergence applies both to the weights and
    their positive normalizers. This gives convergence of the densities in $L^1 \( bb(P)_(upright(b)) \)$,
    and also the assertion about observables. This argument is at fixed volume. ◻
]

Under a pin law the marks need not be independent. The following uniform estimate on lists of distinct marks will
  suffice for all path counts. Let $omega_(upright(m))$ be the mark counting measure on $X_Lambda =
  cal(E)_Lambda times \[ 0 \, beta \)$, and write

$ lambda_(upright(b)) \( { e } times d t \) = c_e thin d t . $

#thm([Lemma 2.3.])[
  (Factorial domination).  #emph[For an allowed or finite pin set $D$, an integer $j gt.eq 1$,
    and a nonnegative measurable function $F$ on $X_Lambda^j$,
#[#set math.equation(numbering: n => "(2.5)")
 $ bb(E)_D sum_(\( u_1 \, dots.h \, u_j \) in \( omega_(upright(m)) \)_eq.not^j) F \( u_1 \, dots.h \, u_j \)
   lt.eq 2^j integral F thin d lambda_(upright(b))^(⊗ j) . $ <eq:factorial-bound>]

 Here the sum is over ordered tuples of distinct marks. The estimate also holds with any prescribed time order or
   time restrictions.]
] <lem:factorial>

#proof[
  Inserting a transposition cuts and rejoins two strands. It joins two cycles or splits one cycle into two,
    leaving the other cycles unchanged, and preserves the union of the affected strands and their pin incidences.
    Joining cycles cannot increase $n_D$. On splitting, a cycle avoiding $D$ produces two such cycles,
    while a cycle meeting $D$ has at least one descendant that still meets $D$.
    Thus $n_D$ increases by at most one, and the weight increases by at most two.
    This statement applies outside the null set of coincident marks or deterministic pin times,
    and also to continuous boundary pins.
  The Poisson insertion identity, with the seam fixed, is
  $ & bb(E)_(upright(b))
    [2^(n_D \( omega \)) sum_(\( u_1 \, dots.h \, u_j \) in \( omega_(upright(m)) \)_eq.not^j) F \( u_1 \,
    dots.h \, u_j \)]\
 & wide = integral F \( u_1 \, dots.h \, u_j \) thin bb(E)_(upright(b))
   2^(n_D \( omega + sum_(a = 1)^j delta_(u_a) \)) product_(a = 1)^j lambda_(upright(b)) \( d u_a \) . $
  Indeed, in the Poisson series the $k$-mark term has $k ! \/ \( k - j \) !$ ordered choices for the distinguished
    marks. Cancelling that factor against $1 \/ k !$ and summing the remaining marks proves the identity.
    Nonnegativity justifies it even for infinite integrals. The insertion bound and division by $cal(Z)_D$ prove
    (2.5). ◻
]

We shall freely use the weaker constant $4^j$ in (2.5). If an independent fresh Poisson family is sampled as well,
  a mixed list obeys the product of these bounds: each actual mark contributes $4
  lambda_(upright(b))$ and each fresh mark contributes $lambda_(upright(b))$.
  This follows by independence and the two factorial measures.
  It is an unconditional statement under $bb(P)_D$, which is the law used when counting paths below.

=== 2.3 Single and simultaneous pin tests <single-and-simultaneous-pin-tests>

Let $E$ be allowed or finite, and let $T$ be a nonempty set of $m_T = \|
  T \|$ distinct slot points at one deterministic time $theta$, disjoint from $E$. Set $P = E union T$.
  Repeating a sampled picture, let $cal(R)_i \( E \, T \)$ be the event that the line from $i in
  T$ visits $T$ at strictly positive elapsed time before visiting $E$. Define

#[#set math.equation(numbering: n => "(2.6)")
 $ r \( E \, T \) = 1 / m_T sum_(i in T) bb(P)_P #scale(x: 120%, y: 120%)[\(] cal(R)_i \( E \, T \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:pin-return-fraction>]

Pinning $T$ changes the picture law in this definition. The next proposition compares the changed law with the
  probability that $T$ lies on cycles avoiding the original pins.

#thm([Proposition 2.4.])[
  (Pin identities).  #emph[For $E \, T$ as above,
#[#set math.equation(numbering: n => "(2.7)")
 $ d_E \( i \) = frac(r \( E \, { i } \), 1 + r \( E \, { i } \)) quad \( i in.not E \) \, wide
   bb(P)_E \( T subset.eq cal(B)_E \) lt.eq \( 2 r \( E \, T \) \)^(m_T) . $ <eq:pin-identities>]

]
] <prop:pin-identities>

#proof[
  For $T = { i }$, write $r = r \( E \, { i } \)$ and $A = { i in cal(B)_E }$.
    A line returns to $i$ before $E$ exactly on $A$, so $r \( E \, { i } \) = bb(P)_P \( A \)$.
    Moreover $2^(n_E) = 2^(n_P) \( 1 + upright(bold(1))_A \)$, giving $cal(Z)_E =
    cal(Z)_P \( 1 + r \)$ and $bb(P)_E \( A \) = 2 r \/ \( 1 + r \)$.
    Equation (2.4) proves the singleton identity. This calculation applies directly to finite and allowed pin sets.
  For the simultaneous bound, we use three precise finite-set facts from [15] Lemmas 3.2, 3.4, and 3.6.
    A nonzero polynomial is #emph[stable] if it has no zero when every variable has positive imaginary part.
    The facts are as follows.
  + Variable identification preserves stability. Partial derivatives, real specialization,
    and coefficientwise limits of uniformly bounded degree preserve stability up to the zero polynomial.
    In particular, after identifying two variables as $t$, taking the coefficient of $t$ preserves stability up to zero.
  + If a permutation $pi$ of a finite set $V$ is a product of independent Bernoulli transpositions and
    deterministic permutations, then
    $ bb(E) product_(j in V) \( x_j + y_(pi \( j \)) \) $
    is stable. This also holds for independent products of finite-time Poisson exchanges with arbitrary
      nonnegative rates and uniform permutations on specified subsets.
  + If a random subset $A$ of a finite set has a stable generating polynomial $bb(E) product_(j in A) y_j$,
    then for every subset $B$,
    $ Pr \( B subset.eq A \) lt.eq product_(j in B) Pr \( j in A \) . $
  These facts belong to the stable-polynomial method for negative dependence developed in [3].
    They concern arbitrary finite sets, with no spatial hypothesis.
    To check the continuous-time scope in (ii), subdivide a finite interval into small slices and replace each
    edge clock in each slice by its independent indicator of at least one mark.
    Apply these Bernoulli transpositions in a fixed order. The products agree with the Poisson products whenever
    no slice has two marks in total; the probability of disagreement tends to zero.
    A uniform permutation is likewise a distributional limit of complete-graph Poisson exchanges:
    the unit-time transition matrix on its finite permutation group has all entries positive and preserves the
    uniform law, so it contracts total variation distance to that law.
    Thus the rates $c_e = J_e \/ 2$ meet exactly the hypotheses of (ii).
  For this bound, first suppose that $E$ is finite. Cut the time circle at zero and at every pin time in $P$.
    Let $V$ be the disjoint union of the slot layers at these cuts,
    and let $pi$ follow a line from one cut to the next cyclic cut.
    Include the seam completion in the interval ending at zero.
    The interval maps are independent and use disjoint sets of input $x$ variables and output $y$ variables.
    Their stable symbols therefore multiply to give the stable polynomial
  $ F_V = bb(E)_(upright(b)) product_(j in V) \( x_j + y_(pi \( j \)) \) . $
  Delete an unpinned point $q in V \\ P$ by setting $x_q = y_q = t$ and taking the linear coefficient in $t$.
    For a fixed permutation with predecessor $i$ and successor $j$ at a nonfixed $q$,
    the two affected factors are $\( x_i + t \) \( t + y_j \)$, whose linear coefficient is $x_i + y_j$.
    This splices $i arrow.r q arrow.r j$ to $i arrow.r j$. A fixed point instead contributes the factor $2
    t$ and hence the factor two. Deleting all nonpins gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ F_P = bb(E)_(upright(b)) [2^(n_P) product_(j in P) \( x_j + y_(sigma \( j \)) \)] \, $ <eq:spliced-symbol>]
  where $sigma$ is the permutation taking each pin to its next pin on the same cycle.
    Each cycle avoiding $P$ contributes exactly one factor two, when its final vertex is deleted.
    The closure facts give stability; the positive coefficients exclude the zero polynomial.
  Differentiate (2.8) in every $x_j$ with $j in P \\ T$, set every remaining $x$ variable to zero,
    and divide by $cal(Z)_P$. The result is the stable generating polynomial
  #[#set math.equation(numbering: n => "(2.9)")
   $ G_T \( bold(y) \) = bb(E)_P product_(i in T) y_(sigma \( i \)) . $ <eq:pin-output-polynomial>]
  It is nonzero because $G_T \( bold(1) \) = 1$, and it represents the subset $sigma \( T \)$ because its indices
    are distinct. Counting the outputs lying in $T$ gives
  $ m_T r \( E \, T \) = bb(E)_P \| T ∩ sigma \( T \) \| = sum_(j in T) bb(P)_P \( j in sigma \( T \) \) . $
  Fact (iii) and the arithmetic–geometric mean inequality now imply
  $ bb(P)_P \( T subset.eq sigma \( T \) \) lt.eq r \( E \, T \)^(m_T) . $
  The event $T subset.eq sigma \( T \)$ is equivalent to $T subset.eq cal(B)_E$.
    Indeed $\| sigma \( T \) \| = \| T \|$, so the first event says $sigma \( T \) = T$;
    iterating $sigma$ then meets only pins of $T$ on every cycle through $T$,
    and meets all the pins on each such cycle. The converse follows by the same cycle description.
  Deleting $m_T$ pins frees at most $m_T$ cycles. Thus, pointwise,
  $ 2^(n_P) lt.eq 2^(n_E) lt.eq 2^(m_T) 2^(n_P) \, wide cal(Z)_E gt.eq cal(Z)_P > 0 . $
  For $A = { T subset.eq cal(B)_E }$, this yields
  $ bb(P)_E \( A \) lt.eq 2^(m_T) cal(Z)_P / cal(Z)_E bb(P)_P \( A \) lt.eq \( 2 r \( E \, T \) \)^(m_T) . $
  For $E = F union D_0$, replace $D_0$ by the finite cuts of Lemma 3, obtaining $E_n$ and $P_n = E_n union T$.
    The simultaneous-free event and the weights converge almost surely. The return events converge as well:
    follow each line from $i in T$ until its first positive visit to $T$.
    This horizon is finite because the line eventually returns to $i$ on its finite permutation cycle.
    Every boundary visit before that horizon contains a positive-duration interval and is eventually detected.
    Thus $upright(bold(1))_(cal(R)_i \( E_n \, T \)) arrow.r upright(bold(1))_(cal(R)_i \( E \, T \))$.
    Lemma 3 now passes the finite-pin inequality to the limit. ◻
]

=== 2.4 Exposing the cycles that miss the pins <exposing-the-cycles-that-miss-the-pins>

The simultaneous pin inequality reduces the avoidance event to an average return under $bb(P)_P$.
  We next separate the obstacles to that return from the remaining exchanges.
  From now on $E$ is allowed, $T$ and $P$ are as above, and the outer picture law is $bb(P)_P$.
  Label a line by its slot at time zero. Expose all labels belonging to cycles missing $P$,
  their trajectories during one period, and their endpoint mappings, including their seam images.
  Write $upright(bold(a))$ for this exposure and $cal(H)$ for its generated sigma-field.
  At time $t$, the #emph[holes] $H_t = H_t \( upright(bold(a)) \)$ are the slots not occupied by exposed labels.
  Their total number is constant. Every pin is a hole at its pin time; every boundary slot is a hole at every time.

For fixed $upright(bold(a))$, define a law $bb(Q)_(upright(bold(a)))$ on the remaining picture by the following
  operations. While the hole set is fixed, put independent rate-$c_e$ Poisson exchanges on the edges whose
  endpoints are holes. When an exposed label moves from a slot to a hole,
  move that hole in the opposite direction into the vacated slot.
  Such a #emph[forced transport] is a fixed bijection between the hole layers before and after the exposed jump.
  Exchanges of two exposed labels do not affect holes. At the seam, independently at each site,
  complete the revealed mapping by a uniform bijection between its remaining source and target slots.
  Let $G_P$ be the event that every cycle of this remaining picture meets $P$, and put

$ g_P \( upright(bold(a)) \) = bb(Q)_(upright(bold(a))) \( G_P \) . $

#thm([Proposition 2.5.])[
  (Exposure disintegration).  #emph[Almost surely under $bb(P)_P$,
    $g_P \( upright(bold(a)) \) > 0$ and the conditional remaining-picture law given $cal(H)$ is
    $bb(Q)_(upright(bold(a))) \( thin dot.op divides G_P \)$.]
  #emph[More precisely, for a deterministic initial label set $A subset.eq V_Lambda$,
    let $mu_A$ be the base distribution of its trajectories and endpoint mappings.
    Let $F_A$ be the event that these paths avoid $P$ and their endpoint set is $A$.
    On $F_A$, let $c_A \( upright(bold(a)) \)$ be the number of cycles of their endpoint permutation.
    For any bounded measurable $Phi$ of the exposure and remaining picture $omega_(upright(h))$,
#[#set math.equation(numbering: n => "(2.10)")
 $ bb(E)_P Phi \( upright(bold(a)) \, omega_(upright(h)) \) = 1 /
   cal(Z)_P sum_(A subset.eq V_Lambda) integral_(F_A) 2^(c_A \( upright(bold(a)) \))
   bb(E)_(bb(Q)_(upright(bold(a)))) \[ upright(bold(1))_(G_P) Phi \( upright(bold(a)) \, omega_(upright(h)) \) \]
   thin mu_A \( d upright(bold(a)) \) . $ <eq:exposure-disintegration>]

 In particular, the exposure marginal on this branch is
#[#set math.equation(numbering: n => "(2.11)")
 $ cal(Z)_P^(- 1) upright(bold(1))_(F_A) 2^(c_A \( upright(bold(a)) \)) g_P \( upright(bold(a)) \) thin
   mu_A \( d upright(bold(a)) \) . $ <eq:exposure-marginal>]

 The same assertions hold for finite deterministic $P$.]
] <prop:exposure>

#proof[
  We give the rate-dependent construction underlying [15] Proposition 4.1.
    Fix $A$ before sampling the base picture. On every edge $e$ take two independent rate-$c_e$ clocks.
    Accept a mark from the first family when at least one endpoint contains an $A$-label just before the mark;
    accept one from the second family when neither endpoint does.
  This produces the base exchange process. Indeed, if $c_(upright("tot")) = sum_e c_e > 0$,
    the superposed clock has rate $2 c_(upright("tot"))$. At each of its times, conditionally on the past,
    the accepted-edge or rejection outcome has probability $c_e \/ \( 2 c_(upright("tot")) \)$ for edge $e$ and
    probability $1 \/ 2$ for rejection. These probabilities do not depend on the past or the superposed waiting
    times. Iterated conditioning and Poisson splitting give independent accepted edge clocks of rates $c_e$.
    If $c_(upright("tot")) = 0$, the statement is immediate.
  The $A$-label histories use only first-family clocks. Given their positions just before the seam,
    revealing their images under each uniform site permutation leaves a uniform bijection of the remaining slots,
    independently from site to site. The histories, including these revealed images,
    therefore do not use the second clock family or the residual completions.
    Conditional on those histories, the second clocks restricted to the now fixed hole intervals remain
    independent Poisson clocks, while the cross jumps give exactly the forced transports.
    This proves the base conditional kernel $bb(Q)_(upright(bold(a)))$ on $F_A$.
  On $F_A$, the labels in $A$ form whole cycles missing $P$. Requiring $G_P$ makes them precisely all such cycles.
    Consequently each complete picture contributes to exactly one term in
  $ 2^(n_P) = sum_(A subset.eq V_Lambda) upright(bold(1))_(F_A) 2^(c_A) upright(bold(1))_(G_P) \, $
  where a summand is zero off $F_A$. Apply the base conditional kernel to this finite sum and divide by $cal(Z)_P$
    to obtain (2.10). Integrating out the remainder gives (2.11), which gives zero outer mass to $g_P = 0$.
    Dividing by $g_P$ on its positive set proves the asserted conditional law.
    All history spaces here are finite-jump path spaces on finite state spaces, with finite endpoint data;
    they are standard Borel spaces and admit the conditional kernels used above. ◻
]

The factor $g_P$ in (2.11) is part of the exposure law throughout the proof.
  In particular, averaging a function of the holes will always mean averaging under the actual $bb(P)_P$ marginal.
  At a fixed exposure, however, the next algebraic calculation uses the unconditioned law $bb(Q)_(upright(bold(a)))$.

=== 2.5 Removing the cycle condition from a first moment <removing-the-cycle-condition-from-a-first-moment>

We record the finite-dimensional argument from [15] Lemma 4.2 and Proposition 4.3,
  including its proof to specify precisely why fresh transitions appear.
  Matrices use the column-forward convention: a permutation matrix obeys $Pi e_i = e_(pi \( i \))$.
  For a matrix $M$, $and.big^k M$ denotes its action on alternating $k$-tensors;
  its matrix entries are the $k times k$ minors of $M$, and $and.big^0 M = 1$.

#thm([Lemma 2.6.])[
  (Exterior moments).  #emph[Suppose a random permutation matrix $Pi$ on a finite set is a distributional limit of
    products of independent Bernoulli transpositions and deterministic permutations. If $K = bb(E) Pi$, then
#[#set math.equation(numbering: n => "(2.12)")
 $ bb(E) and.big^k Pi = and.big^k K wide \( 0 lt.eq k lt.eq \| V \| \) . $ <eq:exterior-moments>]

 For every fixed exposure and finite set of cuts, the layered permutation obtained under
   $bb(Q)_(upright(bold(a)))$ by following holes to the next cyclic cut has this property.]
] <lem:exterior-moments>

#proof[
  For a transposition matrix $T_(i j)$,
  $ T_(i j) - I = - \( e_i - e_j \) \( e_i - e_j \)^(*) . $
  Every minor of $I + u \( T_(i j) - I \)$ is affine in $u$,
    since a term using two columns of the rank-one perturbation has determinant zero. Thus
  $ and.big^k #scale(x: 120%, y: 120%)[\(] \( 1 - u \) I + u T_(i j) #scale(x: 120%, y: 120%)[\)] = \( 1 - u \)
    and.big^k I + u and.big^k T_(i j) \, $
  which proves the identity for one Bernoulli transposition.
    Multiplicativity of exterior powers and independence preserve it under products.
    Deterministic permutations satisfy it directly, and continuity of the minors on the finite matrix space passes
    it to distributional limits.
  For the hole picture, subdivide each interval between prescribed changes and use the Bernoulli approximation
    already described. Forced transports are deterministic bijections.
    The residual seam completions are uniform bijections, each expressible as a fixed bijection composed with a
    uniform permutation; the latter has the complete-graph exchange approximation described above.
    Identify every cut layer with a fixed set of $\| H_t \|$ elements.
    The interval maps act independently on separate copies of this set;
    their direct sum followed by the deterministic cyclic shift of the layers is the layered permutation.
    A transposition in one block is a transposition on the full layered set.
    This verifies the required product representation, before imposing $G_P$. ◻
]

#thm([Proposition 2.7.])[
  (Conditional next-pin kernel).  #emph[Let $V = I union.sq B$ be a finite set with $I eq.not diameter$.
    Suppose a random permutation matrix $Pi$ satisfies (2.12), and let $K = bb(E) Pi$.
    Let $G_I$ be the event that every cycle meets $I$. On $G_I$,
    let $Sigma$ be the column-forward permutation matrix on $I$ giving the next positive visit to $I$. Then
#[#set math.equation(numbering: n => "(2.13)")
 $ Pr \( G_I \) = det \( I - K_(B B) \) . $ <eq:all-hit-determinant>]

 If this probability is positive, then $K_(B B)$ is transient and
#[#set math.equation(numbering: n => "(2.14)")
 $ bb(E) \[ Sigma divides G_I \] = K_(I I) + K_(I B) \( I - K_(B B) \)^(- 1) K_(B I) . $ <eq:conditional-next-pin>]

 The right-hand side is the first positive $I$-hitting kernel of the Markov chain with independent transitions
   according to $K$. If $B$ is empty, the determinant is one and the correction is zero.]
] <prop:next-pin-kernel>

#proof[
  The principal-minor expansion and (2.12) give, for every fixed matrix $D$,
  #[#set math.equation(numbering: n => "(2.15)")
   $ bb(E) det \( I - D Pi \) = sum_k \( - 1 \)^k "Tr" [\( and.big^k D \) bb(E) and.big^k Pi] =
     det \( I - D K \) . $ <eq:determinant-expectation>]
  Choose $D = "diag" \( W \, I_B \)$ with an arbitrary complex $I times I$ matrix $W$.
    If a cycle lies in $B$, its indicator vector is fixed by $D Pi$, so the determinant vanishes.
    On $G_I$, $Pi_(B B)$ is nilpotent and its resolvent follows the successive nonpins on a permutation cycle.
    Block elimination therefore gives
  $ det \( I - D Pi \) = det (I - W \[ Pi_(I I) + Pi_(I B) \( I - Pi_(B B) \)^(- 1) Pi_(B I) \]) =
    det \( I - W Sigma \) . $
  Consequently
  #[#set math.equation(numbering: n => "(2.16)")
   $ bb(E) \[ upright(bold(1))_(G_I) det \( I - W Sigma \) \] =
     det mat(delim: "(", I - W K_(I I), - W K_(I B); - K_(B I), I - K_(B B)) . $ <eq:next-pin-determinant>]
  Setting $W = 0$ proves (2.13) without any invertibility assumption.
    When its value is positive, $I - K_(B B)$ is invertible; taking the Schur complement in (2.16) and dividing by
    that determinant yields
  $ bb(E) \[ det \( I - W Sigma \) divides G_I \] = det \( I - W H \) \, wide H = K_(I I) +
    K_(I B) \( I - K_(B B) \)^(- 1) K_(B I) . $
  Replace $W$ by $t W$ and compare linear coefficients. The identity $det \( I - t W A \) = 1 - t "Tr" \( W A \) +
    O \( t^2 \)$ shows that $"Tr" \( W bb(E) \[ Sigma divides G_I \] \) = "Tr" \( W H \)$ for every $W$.
    Matrix units recover every entry, proving (2.14).
  Finally, $K$ is nonnegative and doubly stochastic. Its restriction $K_(B B)$ is substochastic.
    If some state of $B$ could never reach $I$, its reachable set would contain a closed class and force the
    eigenvalue one for $K_(B B)$, contradicting invertibility.
    Finiteness then supplies an integer $a$ and $epsilon > 0$ such that every state exits $B$ within $a$ steps
    with probability at least $epsilon$. Hence $parallel K_(B B)^(a n) parallel_(1 arrow.r 1)
    lt.eq \( 1 - epsilon \)^n$ and
  $ \( I - K_(B B) \)^(- 1) = sum_(n gt.eq 0) K_(B B)^n . $
  The first term in $H$ is a direct hit of $I$, and $K_(I B) K_(B B)^n K_(B I)$ records a first hit after $n +
    1$ intervening states of $B$. This proves the asserted Markov interpretation. ◻
]

=== 2.6 The fresh walk <the-fresh-walk>

Fix an exposure with $g_P \( upright(bold(a)) \) > 0$. Repeat its hole sets, forced transports,
  and revealed seam restrictions periodically. The #emph[fresh walk] follows the one-particle transitions of
  $bb(Q)_(upright(bold(a)))$: it jumps across each available slot edge at rate $c_e$,
  follows the forced transports, and at a seam uses a fresh uniform residual completion.
  Its random choices on disjoint traversal intervals, including later repetitions of the same physical interval,
  are independent. Finite jump rates and finitely many prescribed changes per period make this a nonexplosive
  Markov walk. For $i in T$, let $tau_T^(+)$ be its first visit to $T$ at strictly positive elapsed time and
  $tau_E$ its first visit to $E$; an absent visit has time infinity. Put

#[#set math.equation(numbering: n => "(2.17)")
 $ q_i \( upright(bold(a)) \) = Pr_(upright(bold(a)) \, i)^(upright("walk")) \( tau_T^(+) < tau_E \) . $ <eq:fresh-q>]

#thm([Proposition 2.8.])[
  (Fresh-walk identity).  #emph[For almost every exposure under $bb(P)_P$ and every $i in T$,
$ bb(P)_P \( cal(R)_i \( E \, T \) divides cal(H) \) = q_i \( upright(bold(a)) \) . $

 In particular,
#[#set math.equation(numbering: n => "(2.18)")
 $ m_T r \( E \, T \) = bb(E)_P sum_(i in T) q_i \( upright(bold(a)) \) . $ <eq:fresh-return>]

]
] <prop:fresh-walk>

#proof[
  First use finitely many pins and take cuts at all pin times and zero.
    The unconditioned layered hole permutation under $bb(Q)_(upright(bold(a)))$ satisfies Lemma 7.
    Conditional on every cycle hitting the pins, Proposition 8 identifies its next-pin first moment with
    independent transitions of its mean matrix. Those transitions are exactly the fresh walk observed at the cuts.
    Together with Proposition 6, this proves the finite-pin assertion.
  For an allowed $E = F union D_0$, fix an exposure for which the disintegration holds and $g_P > 0$.
    Approximate the boundary by increasing dense finite cuts and write $E_n = F union D_(0 \, n)$, $P_n =
    E_n union T$. The cuts include zero and all times in $P_n$.
    Under the fixed unconditioned law $bb(Q)_(upright(bold(a)))$,
    let $G_n$ mean that every remaining cycle meets $P_n$, and put $g_n = bb(Q)_(upright(bold(a))) \( G_n \)$.
  Every boundary visit of the remaining picture has positive residence time.
    Its Poisson marks almost surely avoid the finitely many prescribed changes; seam completions preserve sites;
    and exposed histories avoid the boundary, so forced transports cannot cause an instantaneous boundary
    excursion. Consequently
  $ upright(bold(1))_(G_n) arrow.t upright(bold(1))_(G_P) \, wide g_n arrow.t g_P > 0 . $
  For all sufficiently large $n$, Proposition 8 is therefore applicable with the pin layer $I = P_n$.
    If $A_n$ is the event that the next $P_n$-pin after $i$ is in $T$, it gives
  #[#set math.equation(numbering: n => "(2.19)")
   $ frac(bb(Q)_(upright(bold(a))) \( G_n ∩ A_n \), g_n) =
     Pr_(upright(bold(a)) \, i)^(upright("walk")) \( tau_T^(+) < tau_(E_n) \) . $ <eq:finite-cut-fresh-return>]
  No assertion about the possibly singular earlier $n$ is needed.
  In a fixed remaining picture the first positive return from $i$ to $T$ is finite.
    Detecting all boundary visits before that return shows that $upright(bold(1))_(A_n)$ decreases to
    $upright(bold(1))_(cal(R)_i \( E \, T \))$. Bounded convergence on the left of (2.19),
    including its positive limiting denominator, gives the return probability under
    $bb(Q)_(upright(bold(a))) \( thin dot.op divides G_P \)$.
  On the right use one uncensored fresh trajectory for all $n$.
    The events decrease; every one requires $tau_T^(+) < oo$.
    Any boundary visit before this finite time is detected by a dense cut, again because it has positive duration.
    Their intersection is therefore exactly ${ tau_T^(+) < tau_E }$ up to a null set.
    Continuity from above proves convergence to (2.17). The disintegration identifies the two limits,
    and averaging under the exposure marginal (2.11) proves (2.18). ◻
]

We have obtained a Markov return problem in a periodic environment whose missing slots are the exposed cycles.
  The environment retains its full pinned-law distribution,
  while the walk resamples its transitions on every traversal.
  The next section develops the deterministic heat-flow estimates needed to bound these returns.

== 3 Kernels and the geometry of available slots <sec:geometry>

The fresh walk moves through a graph whose available slots change with physical time.
  We need two deterministic ways to control it: a Nash inequality converts dissipation into diffusion,
  and flows to infinity bound the pairing of a source mass with a test function by its Dirichlet energy.
  The first source bound permits many sparse starting points;
  the second becomes sharper when a single source has already diffused.
  We obtain both bounds on a fixed collection of nearest-neighbor sublattices contained in the interaction graph.
  The walk itself always uses all interaction bonds.

=== 3.1 Coset coordinates and the killed kernels <coset-coordinates-and-the-killed-kernels>

Choose linearly independent vectors $a_1 \, a_2 \, a_3$ with $J \( a_j \) > 0$,
  and let $A$ be the integer matrix with these columns. Such a choice exists because the support of $J$ generates
  $bb(Z)^3$. The sublattice $A bb(Z)^3$ has finite index $\| det A \|$.
  Fix representatives $\( u_gamma \)_(gamma in frak(C))$ of its cosets and write, uniquely,

#[#set math.equation(numbering: n => "(3.1)")
 $ x = u_gamma + A macron(x) \, wide gamma in frak(C) \, quad macron(x) in bb(Z)^3 . $ <eq:coset-coordinates>]

For $z in bb(Z)^3$ and $R gt.eq 0$, put

$ B_R \( z \) = { w in bb(Z)^3 : \| w - z \|_oo lt.eq R } \, wide frak(B)_R \( z \) = { x in bb(Z)^3 :
  macron(x) in B_R \( z \) } . $

Thus $frak(B)_R \( z \)$ contains a copy of the same coordinate ball in every coset.
  Each coset contains all nearest-neighbor edges of its $macron(x)$-coordinate lattice,
  since these edges are the displacements $plus.minus a_j$. There is also a fixed integer $B_(*) gt.eq 1$ such that

#[#set math.equation(numbering: n => "(3.2)")
 $ J \( y - x \) > 0 quad arrow.r.double quad \| macron(y) - macron(x) \|_oo lt.eq B_(*) . $ <eq:bond-coordinate-range>]

Indeed, $macron(y) - macron(x) = A^(- 1) \( y - x + u_gamma - u_(gamma') \)$,
  and the right side has only finitely many possibilities. Constants below may depend on this choice of
  coordinates, $S \, J$, and fixed geometric radii, but never on the volume, pins, or subsequent scales.

Fix an exposure $upright(bold(a))$ from Section 2 and a cut $theta$.
  Let $U$ be the one-period fresh-walk kernel from the holes at this cut back to the same holes,
  killed whenever it visits $partial Lambda$, including at its starting point.
  The kernel has no killing at other pins. We use column-forward matrices:
  $U v$ is the output mass when the input mass is $v$. Define

#[#set math.equation(numbering: n => "(3.3)")
 $ U_(+) = U \, wide U_(-) = U^(*) \, wide Q = frac(U + U^(*), 2) \, wide A_Q = I - Q . $ <eq:one-period>]

The ordered kernel $U$ need not be self-adjoint. Its quadratic form on real vectors agrees with that of $Q$,
  so the symmetric part is the operator needed for the return-energy estimate.
  The adjoint traversal reverses the order of all factors. Between prescribed changes the heat factors are
  symmetric; transports reverse by their inverse bijections,
  and the adjoint of a uniform seam completion is a uniform inverse completion.
  Killing projections accompany these factors in both directions.

Every interval kernel is an average of partial permutation matrices:
  sample the simultaneous trajectories of all holes and retain precisely those trajectories that survive the
  killing. Consequently it is nonnegative, with every row and column sum at most one, and contracts counting $1$-,
  $2$-, and supremum norms. For example, if $K$ is such a kernel, Cauchy–Schwarz gives

$ sum_i \| \( K v \)_i \|^2 lt.eq sum_i #scale(x: 180%, y: 180%)[\(] sum_j K_(i j) #scale(x: 180%, y: 180%)[\)]
  #scale(x: 180%, y: 180%)[\(] sum_j K_(i j) \| v_j \|^2 #scale(x: 180%, y: 180%)[\)] lt.eq sum_j \| v_j \|^2 . $

These properties hold for adjoints, products, and further spatial killing.
  In particular $Q$ is self-adjoint and a contraction, so $A_Q$ is positive semidefinite.

A split of a traversal always uses matching hole layers. At a prescribed transport or seam we distinguish its two
  sides and assign the operation to exactly one of the adjoining factors.
  Thus a full forward traversal from the post-seam cut at zero includes its seam at the end.
  Reversing a traversal reverses this same ordered list. Time integrals ignore the finitely many instantaneous
  operations.

At time $t$, extend the holes by making all $ell$ slots outside $Lambda$ available.
  Let $cal(H)_t$ be the resulting infinite available-slot graph,
  with all pairs of available slots above each interaction bond joined.
  For a finitely supported real function $v$ on this graph, define

#[#set math.equation(numbering: n => "(3.4)")
 $ cal(D)_t \( v \) = sum_(e = { i \, j } in E \( cal(H)_t \)) c_e #scale(x: 120%, y: 120%)[\(] v \( i \) -
   v \( j \) #scale(x: 120%, y: 120%)[\)]^2 \, wide c_e = 1 / 2 J \( x_j - x_i \) . $ <eq:full-energy>]

Each unoriented edge is counted once. A killed vector is extended by zero on killed slots,
  including the boundary and the exterior. On a smooth interval, in elapsed time $u$ in either traversal direction,

#[#set math.equation(numbering: n => "(3.5)")
 $ frac(d, d u) parallel v \( u \) parallel_2^2 = - 2 cal(D)_(t \( u \)) \( v \( u \) \) . $ <eq:norm-dissipation>]

To verify this, pair the symmetric jump generator with $v$; each edge contributes $-
  2 c_e \( v \( i \) - v \( j \) \)^2$. Edges to killed slots retain their exit rates and give the same expression
  with the killed value zero. There is no bond from $Lambda^compose$ directly to the exterior,
  so the infinite extension creates no extra term. The same identity holds after additional killing outside a
  fixed spatial set. Squared norm cannot increase at any instantaneous factor.

=== 3.2 Regular anchors and local diffusion <regular-anchors-and-local-diffusion>

For a coset $gamma$, let $cal(H)_t^gamma$ contain its available slots and only the nearest-neighbor edges in bar
  coordinates. Write

$ cal(D)_t^gamma \( v \) = 1 / 2 sum_({ i \, j } in E \( cal(H)_t^gamma \)) \( v \( i \) - v \( j \) \)^2 \, wide
  c_0 = min_(1 lt.eq j lt.eq 3) J \( a_j \) > 0 . $

The graphs for different cosets have disjoint vertex sets,
  and their edges are a subset of the full interaction edges. Therefore

#[#set math.equation(numbering: n => "(3.6)")
 $ cal(D)_t \( v \) gt.eq c_0 sum_(gamma in frak(C)) cal(D)_t^gamma \( v \) . $ <eq:energy-comparison>]

This inequality is the only place where the geometric subgraphs replace the full graph;
  in particular it changes constants, not the diffusion matrix that will determine Bloch’s coefficient.

Fix

$ alpha = 1 / 100 \, wide nu = 1 / 300 \, wide L gt.eq max { 6 \, ell \| frak(C) \| } . $

#prodef([Definition 3.1.])[
  (Sparse collections).  A finite collection of slot points with site coordinates $\( x_i \)$ is #emph[sparse] if
  #[#set math.equation(numbering: n => "(3.7)")
   $ \# { i : macron(x)_i in B_h \( z \) } lt.eq L \( 1 + h \)^alpha wide \( z in bb(Z)^3 \, med h gt.eq 0 \) .
     $ <eq:sparse-growth>]
  Repeated bar coordinates count with their multiplicities, including points from different cosets.
    The same definition applies to a list of centers in $bb(Z)^3$. Every subcollection remains sparse.
] <def:sparse>

In coset $gamma$, call a coordinate site #emph[blocked] if it has no available slot;
  denote this finite set by $cal(O)_t^gamma$. Join blocked sites whose supremum distance is at most eight.
  For $w in cal(O)_t^gamma$, let $cal(C)_t^gamma \( w \)$ be its component and put

$ "rad"_w cal(C)_t^gamma \( w \) = max_(v in cal(C)_t^gamma \( w \)) \| v - w \|_oo . $

Boundary sites and all sites outside $Lambda$ have every slot available. Partial exposure at a site is permitted:
  an unblocked site can have any number of available slots between one and $ell$.

We recall the precise local-connectivity input from [15] Lemma 5.5.
  For every fixed integer $b gt.eq 1$, there is an integer $rho \( 3 \, b \) gt.eq b + 1$ such that if $u \,
  v in.not F subset bb(Z)^3$, $\| u - v \|_oo lt.eq b$, and $\# \( F ∩ B_(rho \( 3 \, b \)) \( u \) \) < 6$,
  then a nearest-neighbor path from $u$ to $v$ avoids $F$, stays in that ball,
  and has length at most $\( 2 rho \( 3 \, b \) + 1 \)^3$. Fix an integer,
  as in the radius choice of [15] Equation (5.13),

#[#set math.equation(numbering: n => "(3.8)")
 $ M_(*) gt.eq max { 48 \, rho \( 3 \, 44 \) + 2 } . $ <eq:geometric-radius>]

The numbers 44 and 48 cover the bounded connections around components of at most five blocked sites.
  Fix a lower threshold $R_0$ large enough for all subsequent deterministic estimates; it includes $R_0 gt.eq
  M_(*) + 47$. This threshold depends only on the fixed geometry.

#prodef([Definition 3.2.])[
  (Regular slice).  A slice $t$ is #emph[regular for the anchor $z$ at radius $R$] if the following hold in every
    coset $gamma$:
  + for every $w in B_(11 R) \( z \)$, $\# \( cal(O)_t^gamma ∩ B_(M_(*)) \( w \) \) < 6$;
  + for every $w in cal(O)_t^gamma \\ B_(10 R) \( z \)$, $"rad"_w cal(C)_t^gamma \( w \)
    lt.eq \( 1 + \| w - z \|_oo \)^nu$.
  The anchor itself need not be an available site.
] <def:regular>

These are precisely the regular-anchor conditions in [15] Definition 5.3, on each coordinate lattice.
  They are conditions on a single deterministic graph; no pin probability estimate is assumed in the next three
  propositions.

#thm([Proposition 3.3.])[
  (Local Nash inequality).  #emph[Suppose $R gt.eq R_0$ and $t$ is regular for $z$ at radius $R$.
    Every nonnegative function $v$ on $cal(H)_t$, supported on slots above $frak(B)_R \( z \)$, satisfies
#[#set math.equation(numbering: n => "(3.9)")
 $ parallel v parallel_2^(10 \/ 3) lt.eq C cal(D)_t \( v \) parallel v parallel_1^(4 \/ 3) . $ <eq:local-nash>]

 The constant is independent of $R \, z \, t$ and the unavailable slots.]
] <prop:nash>

#proof[
  We give the transfer argument of [15] Proposition 5.6, followed by the lattice averaging proof of Nash’s
    inequality; the energy-to-diffusion method originates in [14].
    First work in one coset and write its bar coordinates simply as sites.
    At each unblocked site $w$, choose a slot where $v$ is maximal and call this value $V \( w \)$.
    Each blocked site of $B_(R + 3) \( z \)$ has a surviving nearest neighbor:
    otherwise its six neighbors would contradict local regularity. Choose one, denoted $phi.alt \( w \)$, and define
  $ f \( w \) =
    cases(delim: "{", V \( w \) \, & w in.not cal(O)_t^gamma \,, V \( phi.alt \( w \) \) \, & w in
    cal(O)_t^gamma ∩ B_(R + 3) \( z \) \,, 0 \, & w in cal(O)_t^gamma \\ B_(R + 3) \( z \) .) $
  Then $f$ is supported on $B_(R + 1) \( z \)$, and
  #[#set math.equation(numbering: n => "(3.10)")
   $ parallel v parallel_2^2 lt.eq ell parallel f parallel_2^2 \, wide parallel f parallel_1 lt.eq
     7 parallel v parallel_1 . $ <eq:nash-norm-transfer>]
  For a lattice edge with a nonzero endpoint value of $f$, both values come from maximizing slots at surviving
    sites at distance at most three from each other, within $B_(R + 3) \( z \)$.
    The local-connectivity input with $b = 44$ joins these sites by a path of fixed length and displacement
    avoiding blocked sites. Lift it to their maximizing slots.
    Telescoping along the lifted path and using Cauchy–Schwarz bounds the squared difference across the original
    edge by a fixed multiple of the sum of squared slot differences on that path.
    Any slot edge can occur in only a bounded number of these paths,
    since their original edges lie in a fixed neighborhood of it. Hence
  #[#set math.equation(numbering: n => "(3.11)")
   $ cal(E)_(bb(Z)^3) \( f \) := sum_({ w \, w' } : \| w - w' \|_1 = 1) \( f \( w \) - f \( w' \) \)^2 lt.eq
     C cal(D)_t^gamma \( v \) . $ <eq:nash-energy-transfer>]
  For completeness, average $f$ over its translates by ${ 0 \, dots.h \, b - 1 }^3$,
    and denote the result by $A_b f$. Telescoping coordinate translations and using the triangle inequality in
    $ell^2$ gives $parallel f - A_b f parallel_2^2 lt.eq C b^2 cal(E)_(bb(Z)^3) \( f \)$.
    The averaging kernel has $2$-norm $b^(- 3 \/ 2)$, so $parallel A_b f parallel_2^2 lt.eq
    b^(- 3) parallel f parallel_1^2$. Therefore
  $ parallel f parallel_2^2 lt.eq C b^2 cal(E)_(bb(Z)^3) \( f \) + 2 b^(- 3) parallel f parallel_1^2 . $
  For $f eq.not 0$, take $b = ceil.l \( 4 parallel f parallel_1^2 \/ parallel f parallel_2^2 \)^(1 \/ 3) ceil.r$.
    The second term is at most half the left side; since $parallel f parallel_1 gt.eq parallel f parallel_2$,
    rounding changes only the constant. Absorbing this term proves $parallel f parallel_2^(10 \/ 3) lt.eq
    C cal(E)_(bb(Z)^3) \( f \) parallel f parallel_1^(4 \/ 3)$. The zero case is immediate.
    Equations (3.10)–(3.11) give (3.9) for one coset with $cal(D)_t^gamma$.
    Finally, writing $v_gamma$ for the restriction to coset $gamma$, use
  $ #scale(x: 180%, y: 180%)[\(] sum_gamma parallel v_gamma parallel_2^2 #scale(x: 180%, y: 180%)[\)]^(5 \/ 3)
    lt.eq \| frak(C) \|^(2 \/ 3) sum_gamma parallel v_gamma parallel_2^(10 \/ 3) \, wide
    parallel v_gamma parallel_1 lt.eq parallel v parallel_1 \, $
  and (3.6) to obtain the assertion on all cosets. ◻
]

=== 3.3 Flows and sparse sources <flows-and-sparse-sources>

The Nash inequality controls a mass while it evolves. We next control its pairing with an arbitrary function at a
  single slice. A flow with divergence equal to that mass gives precisely this bound by summation by parts.
  Fix an orientation $\( e^(-) \, e^(+) \)$ for every unoriented slot edge,
  and define divergence as outgoing minus incoming flow. If $F$ is a flow and $Y$ has finite support, then

#[#set math.equation(numbering: n => "(3.12)")
 $ chevron.l "div" F \, Y chevron.r = sum_e F \( e \) #scale(x: 120%, y: 120%)[\(] Y \( e^(-) \) -
   Y \( e^(+) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:flow-pairing>]

For an edge in one coset and a coordinate site $y$, write $"dist" \( e \, y \)$ for the minimum supremum distance
  from $y$ to an endpoint coordinate of $e$.

We state the deterministic input, including the features of its construction needed for a sharper estimate below.
  Its hypotheses do not refer to an exposure law or to a relation between $R$ and a time scale.

#thm([Lemma 3.4.])[
  (Routed unit flows: geometric input).  #emph[Consider an available-slot nearest-neighbor graph on $bb(Z)^3$,
    with at most $ell$ slots per site, all pairs of available slots above each nearest-neighbor site edge joined,
    and all slots available outside a finite set. Suppose $z$ satisfies the two conditions in Definition 11 for
    this graph, and $R gt.eq R_0$. For each available slot $a$ at $y in B_R \( z \)$, there is a flow $F_a$ such that
#[#set math.equation(numbering: n => "(3.13)")
 $ "div" F_a = upright(bold(1))_({ a }) \, wide \| F_a \( e \) \| lt.eq C \( 1 + "dist" \( e \, y \) \)^(- k) \,
   wide k = 2 - 3 nu = 199 / 100 . $ <eq:global-flow-envelope>]

 The flows can be chosen with the following common routing construction.
   For each blocked component $C$, thicken it by supremum radius four,
   fill the finite nearest-neighbor components of the complement, and call the resulting finite hull $H_C$.
   Let $"Box"_C^(+)$ be the unit enlargement of the coordinate bounding box of that thickening.
   The hull lies in this box. Keep the inclusion-maximal hulls, which are disjoint,
   and send each original site in such a hull to a chosen surviving exterior-boundary representative,
   fixing other sites. Apply this map only once to each original endpoint.]
  #emph[There are simple surviving routes for the original lattice edges.
    Each route is contained in its original edge together with the boxes $"Box"_C^(+)$ of the maximal hulls
    containing its original endpoints. Lift the routes using a fixed available slot at every surviving site.
    The flow $F_a$ is the sum of a unit path flow along a connector of uniformly bounded length and displacement
    from $a$, and the routed values of a lattice unit flow $G_y$ satisfying
#[#set math.equation(numbering: n => "(3.14)")
 $ \| G_y \( e' \) \| lt.eq C \( 1 + "dist" \( e' \, y \) \)^(- 2) . $ <eq:lattice-flow-envelope>]

 All constants are uniform over the graph, anchor, radius, and source.]
] <lem:routed-flow>

This is [15] Proposition 6.2 together with its stated construction:
  hull containment and surviving boundary routes are in [15] Lemma 6.1 and Section 6.1;
  the once-applied endpoint map and the routes, including adjacent maximal hulls,
  follow Equations (6.2)–(6.3) there; the bounded connector, lattice flow,
  and lifting are in the proof of Proposition 6.2, Equations (6.6)–(6.8).
  These statements allow arbitrary available-slot counts between one and $ell$ at unblocked sites.
  Thus they apply on every coset here, whose unavailable slots form a finite set.
  No assertion about the nearest-neighbor spin model is being used.

Two such flows, whose source sites are $y \, y'$, satisfy

#[#set math.equation(numbering: n => "(3.15)")
 $ sum_e \| F_a \( e \) F_b \( e \) \| lt.eq C \( 1 + \| y - y' \|_oo \)^(- q) \, wide q = 2 k - 3 = 49 /
   50 . $ <eq:flow-overlap>]

Here the flows may use different regular anchors. To check this estimate, put $H = 1 + \| y - y' \|_oo$.
  In a ball of radius $\| y - y' \|_oo \/ 3$ about either source, one envelope is at most $C H^(- k)$,
  and the sum of the other is at most $C H^(3 - k)$. Away from those two balls,
  dyadic shells of radii at least a fixed multiple of $H$ give $C sum_(j gt.eq 0) \( 2^j H \)^(3 - 2 k)$.
  Both bounds are $C H^(3 - 2 k)$, since $3 \/ 2 < k < 3$. Bounded $H$ follows by square summability.
  There are only a bounded number of slot edges per coordinate site, so the same calculation applies to edge sums.
  This also proves the overlap estimate recorded in [15] Lemma 6.3.

#thm([Proposition 3.5.])[
  (Energy of sparse sources).  #emph[Let $R gt.eq R_0$, and let $\( z_i \)_(i = 1)^m$ be a sparse list of centers,
    counting repetitions. At a fixed slice let $I subset.eq { 1 \, dots.h \,
    m }$ be any subset for which the slice is regular for $z_i$ at radius $R$.
    For $i in I$, let $mu_i gt.eq 0$ be a mass on the available slots,
    supported above $frak(B)_R \( z_i \)$ and with total mass at most one. For every finitely supported real $Y$,
#[#set math.equation(numbering: n => "(3.16)")
 $ lr(|⟨sum_(i in I) mu_i \, Y⟩|)^2 lt.eq C m R^alpha cal(D)_t \( Y \) . $ <eq:sparse-source-pairing>]

]
] <prop:sparse-energy>

#proof[
  In each coset sum the unit flows of Lemma 13 with the coefficients supplied by the restrictions of the $mu_i$,
    and call the result $F^gamma$. Its divergence is the sum of these restrictions.
    The supports of the masses are finite. If $\| z_i - z_j \|_oo > 4 R$,
    the two source sites in their respective supports have distance at least $\| z_i - z_j \|_oo \/ 2$;
    otherwise use the uniform constant overlap bound. Equation (3.15) and the mass bound at each center give
  $ sum_e \| F^gamma \( e \) \|^2 lt.eq C sum_(i in I) [\# { j in I : \| z_j - z_i \|_oo lt.eq 4 R } + sum_(j in I\
\| z_j - z_i \|_oo > 4 R) \( 1 + \| z_j - z_i \|_oo \)^(- q)] . $
  The first count is at most $C L R^alpha$. Divide the second sum into annuli $2^n 4 R < \| z_i - z_j \|_oo lt.eq
    2^(n + 1) 4 R$; its bound is $C L sum_(n gt.eq 0) \( 2^n R \)^(alpha - q) lt.eq C$,
    because $q > alpha$ and $R gt.eq 1$. Consequently $sum_gamma sum_e \| F^gamma \( e \) \|^2 lt.eq C m R^alpha$.
    Using (3.12), Cauchy–Schwarz on the disjoint coset edge sets, and (3.6), we get
  $ lr(|⟨sum_(i in I) mu_i \, Y⟩|)^2 lt.eq C m R^alpha sum_gamma 2 cal(D)_t^gamma \( Y \) lt.eq
    C m R^alpha cal(D)_t \( Y \) . $
  This includes the empty set $I$, for which the flow is zero. ◻
]

=== 3.4 The sharper bound for a spread source <the-sharper-bound-for-a-spread-source>

The next estimate converts a $2$-norm bound $C_1 tau^(- 3 \/ 4)$ on a subunit mass into a flow-energy bound $C
  tau^(- 1 \/ 2)$. The global exponent $k < 2$ in (3.13) alone loses a power of $tau$.
  Local regularity repairs this loss: near the source, every obstacle that the routing encounters has bounded size.

#thm([Lemma 3.6.])[
  (Decay up to the localization radius).  #emph[The same flows as in Lemma 13 satisfy
#[#set math.equation(numbering: n => "(3.17)")
 $ \| F_a \( e \) \| lt.eq C \( 1 + h \)^(- 2) wide upright("if ") h = "dist" \( e \, y \) lt.eq
   R . $ <eq:near-flow-envelope>]

 The constant and the lower threshold $R_0$ are independent of $R$.]
] <lem:near-flow>

#proof[
  A blocked component meeting $B_(10 R) \( z \)$ has at most five sites.
    Indeed, an exploration of six sites starting at a point in that ball would place them all in a radius-40 ball,
    contradicting regularity and $M_(*) gt.eq 48$. Thus such a component has diameter at most 32.
    Its radius-four thickening has bounding-box diameter at most 40, so $"Box"_C^(+)$ has diameter at most 42.
  If a component avoids $B_(10 R) \( z \)$, put $b_C = min_(w in C) \| w - z \|_oo > 10 R$.
    Remote regularity, applied at a minimizer, gives
  $ "diam"_oo \( "Box"_C^(+) \) lt.eq 2 \( 1 + b_C \)^nu + 10 lt.eq b_C \/ 10 $
  after increasing the fixed threshold $R_0$. The minimizing site belongs to the box,
    so the entire box lies outside $B_(9 R) \( z \)$.
  Now let $e$ be a target slot edge with $h lt.eq R$. Both its endpoint sites lie in $B_(2 R + 1) \( z \)$.
    If a routed original edge $e'$ uses $e$, route containment in Lemma 13 says that this occurrence is either on
    $e'$ itself or in an incident enlarged box. That box cannot be remote, and therefore has diameter at most 42.
    Since it contains an original endpoint of $e'$, the edge $e'$ is within a fixed distance of $e$.
    Thus only a bounded number of original edges contribute to $e$,
    and their source distances differ from $h$ by at most a fixed constant.
    Each route is simple and uses $e$ at most once. Summing (3.14) over these edges gives (3.17);
    the bounded connector changes only the constant. This argument also covers routes between adjacent maximal
    hulls, since their middle portion is the original edge with reversed orientation. ◻
]

#thm([Proposition 3.7.])[
  (Spread-source energy).  #emph[Suppose $R gt.eq R_0$, $1 lt.eq tau lt.eq R$,
    and the slice $t$ is regular for $z$ at radius $R$. Let $mu gt.eq
    0$ be supported on available slots above $frak(B)_R \( z \)$, with
$ parallel mu parallel_1 lt.eq 1 \, wide parallel mu parallel_2 lt.eq C_1 tau^(- 3 \/ 4) . $

 For every finitely supported real function $Y$ on $cal(H)_t$,
#[#set math.equation(numbering: n => "(3.18)")
 $ \| chevron.l mu \, Y chevron.r \|^2 lt.eq C tau^(- 1 \/ 2) cal(D)_t \( Y \) . $ <eq:spread-source-pairing>]

 The constant may depend on $C_1$ and the fixed geometry, but is independent of $tau \, R$, the slice, and the volume.]
] <prop:spread-energy>

#proof[
  Work first on one coset, with the restriction of $mu$, and set $F = sum_a mu \( a \) F_a$. Then $"div" F = mu$.
    For each source at $y_a$, split its flow at distance $s = sqrt(tau)$ into near and far parts.
    The parts need not have prescribed divergences; their sum is the original flow.
  Index each edge by one endpoint site, with bounded multiplicity, and put $macron(mu) \( w \) =
    sum_(a : y_a = w) mu \( a \)$. Since at most $ell$ slots lie over a site,
    $parallel macron(mu) parallel_2 lt.eq sqrt(ell) parallel mu parallel_2$.
    As $s lt.eq R$, Lemma 15 bounds the near part pointwise by a convolution with a nonnegative lattice kernel
  $ kappa_s \( w \) = C \( 1 + \| w \|_oo \)^(- 2) upright(bold(1))_({ \| w \|_oo lt.eq s + 1 }) \, wide
    parallel kappa_s parallel_1 lt.eq C s . $
  Here changing the minimum distance to an edge into the distance from its indexed endpoint costs at most one.
    Young’s inequality yields
  #[#set math.equation(numbering: n => "(3.19)")
   $ parallel F_(upright("near")) parallel_2 lt.eq C parallel kappa_s * macron(mu) parallel_2 lt.eq
     C s parallel mu parallel_2 lt.eq C tau^(- 1 \/ 4) . $ <eq:spread-near-energy>]
  For the far part of each individual flow, count at most $C \( 1 + h \)^2$ slot edges at distance $h$,
    use the exponent 2 until $R$, and then use the exponent $k$. This gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ sum_(e : thin "dist" \( e \, y_a \) > s) \| F_a \( e \) \|^2 & lt.eq
     C sum_(s < h lt.eq R) \( 1 + h \)^(- 2) + C sum_(h > R) \( 1 + h \)^(2 - 2 k)\
 & lt.eq C #scale(x: 120%, y: 120%)[\(] tau^(- 1 \/ 2) + R^(- 49 \/ 50) #scale(x: 120%, y: 120%)[\)] lt.eq
   C tau^(- 1 \/ 2) . $ <eq:spread-far-energy>]
  The last comparison uses exactly $R gt.eq tau gt.eq 1$ and $49 \/ 50 > 1 \/ 2$.
    The triangle inequality in edge $ell^2$, with $sum_a mu \( a \) lt.eq 1$,
    bounds $parallel F_(upright("far")) parallel_2 lt.eq C tau^(- 1 \/ 4)$.
    Together with (3.19), this proves $sum_e \| F \( e \) \|^2 lt.eq C tau^(- 1 \/ 2)$.
  Apply this construction on every coset. Each restriction satisfies the same mass and $2$-norm bounds,
    so the sum of all coset flow energies is at most $C \| frak(C) \| tau^(- 1 \/ 2)$.
    Summation by parts (3.12), Cauchy–Schwarz, and (3.6) now prove (3.18). ◻
]

In particular, when $tau = K beta$ and $R = ceil.l a \( K + 1 \) beta ceil.r$ with fixed $a gt.eq 1$,
  the constant in Proposition 16 does not depend on $K$. All statements of this section are deterministic at a
  single exposure or slice. Sources and retained subsets may therefore depend on the entire exposure.
  The estimates require no measurable selection of flows: the conclusions are inequalities between the given
  masses and energies.

== 4 A uniform sparse-pin estimate <sec:bootstrap>

We now prove that a prescribed sparse set of slot points is unlikely to belong to cycles avoiding the pins.
  This supplies the regular slices needed for diffusion. The argument is a finite downward induction on the pin
  set: the estimate for a larger pin set controls the geometry used to remove some of those pins.
  It adapts the induction and obstacle estimates of [15] Sections 5 and 7,
  with the interaction rates and the coset coordinates retained throughout.

All constants in this section may depend on the fixed parameters of Section 3, but not on the cube, pin sets,
  time grid, cut, spatial anchor, or inverse temperature. Dependence on an integer $K$ will always be indicated.
  A bound $o_K \( a \( beta \) \)$ means that, for each fixed $K$,
  the supremum of the absolute error divided by $a \( beta \)$ over all these other data tends to zero as $beta
  arrow.r oo$. For an expectation or probability the supremum is taken after averaging.
  We require no uniform rate of convergence as $K$ varies.

=== 4.1 Blocking probabilities from an induction hypothesis <blocking-probabilities-from-an-induction-hypothesis>

Set $p = beta^(- 9 \/ 10)$, initially with $beta gt.eq 1$,
  and choose a finite circular grid $cal(G) subset bb(R) \/ beta
  bb(Z)$ containing zero whose successive gaps are at most $p^12$.
  Write $cal(V)_(cal(G)) = V_Lambda times cal(G)$. For $P = D_0 union F$, where $F subset.eq cal(V)_(cal(G))$,
  let $sans(I) \( P \)$ denote the assertion

#[#set math.equation(numbering: n => "(4.1)")
 $ bb(P)_P \( T' subset.eq cal(B)_P \) lt.eq p^(\| T' \|) quad
   upright("for every nonempty sparse ") T' upright(" at one grid time, disjoint from ") P . $ <eq:induction-assertion>]

Here and below sparseness counts slot multiplicities as in Definition 10.
  Until the final subsection we assume $sans(I) \( P \)$; no estimate for a smaller pin set is being assumed.

Expose $cal(B)_P$ under $bb(P)_P$. In a fixed coset $gamma$,
  let $cal(O)_t^gamma$ be the blocked set in bar coordinates, as in Definition 11.
  At a grid time $q$, any prescribed sparse set $A$ of distinct sites in that coordinate lattice satisfies

#[#set math.equation(numbering: n => "(4.2)")
 $ bb(P)_P \( A subset.eq cal(O)_q^gamma \) lt.eq p^(\| A \|) . $ <eq:grid-blocking>]

To see this, select a fixed slot at each corresponding physical site.
  If any selected slot is pinned, or any site lies outside the cube, the blocking event is impossible.
  Otherwise the selected slot points form a permissible test in (4.1).

#thm([Lemma 4.1.])[
  (Blocking at deterministic times).  #emph[Assume $sans(I) \( P \)$.
    At every deterministic time $t$, in every coset, a prescribed set $A$ of distinct coordinate sites satisfies
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(P)_P \( A subset.eq cal(O)_t^gamma \) & lt.eq C p^6 &  & upright("if ") \| A \| = 6 \,\
bb(P)_P \( A subset.eq cal(O)_t^gamma \) & lt.eq \( C sqrt(p) \)^(\| A \|) &  & upright("if ") A eq.not diameter
  upright(" is sparse") . $ <eq:six-blocking>]

 The constants are uniform in the choice and size of the grid.]
] <lem:blocking>

#proof[
  Let $q$ be the grid time preceding $t$, taking $q = t$ when $t in cal(G)$.
    The circular interval $\( q \, t \]$ has length at most $p^12$.
    A site blocked at $t$ was either blocked at $q$ or has an incident inter-site mark in this interval.
    The seam does not change the number of holes at any site.
    The total base intensity of all slot edges incident to a site is bounded by a constant depending only on $S \,
    J$. Thus Lemma 4 bounds the probability of any mark incident to six prescribed sites by $C p^12$.
    Since a six-site set is sparse, $L gt.eq 6$ and (4.2) give $p^6 + C p^12 lt.eq C p^6$.
  For a sparse set of $n gt.eq 1$ sites, either at least $ceil.l n \/ 2 ceil.r$ were blocked at $q$,
    or at least that many have incident marks. The first event costs at most $2^n p^(ceil.l n \/ 2 ceil.r)$,
    by (4.2) for the subsets. In the second event there are at least $j =
    ceil.l n \/ 4 ceil.r$ distinct marks in the union of the edge stars:
    one mark is incident to at most two of the selected sites.
    If $N$ counts the marks in that union, factorial domination gives
  $ bb(P)_P \( N gt.eq j \) lt.eq bb(E)_P binom(N, j) lt.eq frac(\( C n p^12 \)^j, j !) lt.eq \( C' p^12 \)^j . $
  Here $n \/ j lt.eq 4$ and $j ! gt.eq \( j \/ e \)^j$. Both event bounds are at most $\( C sqrt(p) \)^n$ after
    enlarging $C$. This argument does not require independence between blocking and intervening marks,
    nor any bipartite property of the interaction graph. ◻
]

=== 4.2 Sparse witnesses for large blocked components <sparse-witnesses-for-large-blocked-components>

We next turn the joint blocking bound into a tail for a connected obstacle.
  Components $cal(C)_t^gamma \( w \)$ use steps of supremum length at most eight in the coset coordinates.
  Write $"rad"_w cal(C)_t^gamma \( w \) = max_(v in cal(C)_t^gamma \( w \)) \| v - w \|_oo$.
  The witness construction below is the one underlying [15] Lemma 5.2;
  we include the sparseness and counting arguments because only sparse joint tests are available.

#thm([Lemma 4.2.])[
  (Component tail).  #emph[There are $beta_0 \, c \, C \, lambda > 0$ such that, if $beta gt.eq
    beta_0$ and $sans(I) \( P \)$ holds, then
#[#set math.equation(numbering: n => "(4.4)")
 $ bb(P)_P #scale(x: 120%, y: 120%)[\(] w in cal(O)_t^gamma \, "rad"_w cal(C)_t^gamma \( w \) gt.eq
   h #scale(x: 120%, y: 120%)[\)] lt.eq C exp \( - c h^lambda \) \, wide h gt.eq 1 . $ <eq:component-tail>]

 This holds for every deterministic time $t$, coset $gamma$, and coordinate site $w$,
   with the same constants for all $beta gt.eq beta_0$.]
] <lem:component-tail>

#proof[
  Fix an integer $b > 100$ so large that $b^alpha > 4$, and set $h_j = 16 b^j$ for $j gt.eq 0$.
    An admissible depth-$j$ witness rooted at $w$ assigns a coordinate site $x_v$ to each vertex of the complete
    rooted ordered binary tree with every leaf at depth $j$, with $x_diameter = w$.
    At a vertex having $k gt.eq 1$ levels below it, require that the first child has the same site as its parent,
    that the second child’s site is within distance $h_k + 8$ of the parent,
    and that the leaf sets under the two children have mutual distance at least $h_k \/ 4$.
    Only the leaves are required to be blocked. In depth zero the sole leaf is the root.
  A blocked path from $w$ to distance at least $h_j$ supplies such a witness.
    For $j gt.eq 1$, truncate the path at its first site at distance at least $h_j$.
    The first child crossing starts at $w$; the second starts at the first path site at distance at least $h_j \/
    2$ from $w$. That second start is at distance at most $h_j \/ 2 + 8$,
    and the remaining path reaches distance at least $h_j \/ 2 - 8$ from it.
    Each crossing can therefore be truncated on first reaching distance $h_(j - 1)$ from its own start.
    These truncated crossings lie in the two start-centered balls of radius $h_(j - 1) + 8$,
    whose mutual distance is at least
  $ h_j \/ 2 - 2 \( h_(j - 1) + 8 \) gt.eq h_j \/ 4 . $
  Recursing inside these crossings constructs the children and keeps all their descendant leaves in the indicated balls.
  Every admissible witness has $2^j$ distinct leaves and its leaf set is sparse.
    Indeed, a ball of radius $h < h_k \/ 8$ cannot meet both branches of any split of scale at least $h_k$;
    hence it contains at most $2^(k - 1)$ leaves. For $h_(k - 1) \/ 8 lt.eq h < h_k \/ 8$, with $1 lt.eq k lt.eq
    j$, this is compatible with the sparse bound because
  $ L \( 1 + h \)^alpha gt.eq L \( 2 b^(k - 1) \)^alpha gt.eq 2^(k - 1) . $
  Below $h_0 \/ 8$ there is at most one leaf. At and above $h_j \/ 8$,
    the same calculation allows all $2^j$ leaves. The depth-zero case is immediate.
    These observations cover every center and every real radius, including the scale endpoints.
  Let $A_j$ bound the number of admissible assignments rooted at a specified site.
    Ignoring restrictions between the two subtrees gives
  $ A_0 = 1 \, wide A_j lt.eq C h_j^3 A_(j - 1)^2 \, wide 2^(- j) log A_j lt.eq
    sum_(k = 1)^j 2^(- k) log \( C h_k^3 \) lt.eq log C_b . $
  Thus $A_j lt.eq C_b^(2^j)$. This numerical overcount does not declare the unrestricted assignments admissible:
    only the separated, and therefore sparse, witnesses enter the probability union bound.
    For each such witness, (4.3) bounds the probability of its blocked leaves by $\( C sqrt(p) \)^(2^j)$.
    Choose $beta_0$ so large that $C_b C sqrt(p) lt.eq e^(- 2)$ for all $beta gt.eq beta_0$. Then
  $ bb(P)_P #scale(x: 120%, y: 120%)[\(] w in cal(O)_t^gamma \, "rad"_w cal(C)_t^gamma \( w \) gt.eq
    h_j #scale(x: 120%, y: 120%)[\)] lt.eq e^(- 2 dot.op 2^j) . $
  For $h_j lt.eq h < h_(j + 1)$, we have $2^j gt.eq \( h \/ \( 16 b \) \)^lambda$, where $lambda = log_b 2 > 0$.
    Increasing $C$ for $1 lt.eq h < 16$ proves (4.4). ◻
]

#thm([Proposition 4.3.])[
  (Probability of an irregular slice).  #emph[Under $sans(I) \( P \)$, for $beta gt.eq beta_0$,
    every deterministic time $t$, anchor $z in bb(Z)^3$, and radius $R gt.eq 1$ satisfy
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(P)_P \( t upright(" is not regular for ") z upright(" at radius ") R \) lt.eq delta_R := C R^3 p^6 +
   C exp \( - c R^xi \) \, wide xi = nu lambda > 0 . $ <eq:irregularity>]

]
] <prop:irregularity>

#proof[
  For each coset there are $O \( R^3 \)$ centers in $B_(11 R) \( z \)$.
    A ball of the fixed radius $M_(*)$ has a fixed number of six-site subsets.
    Equation (4.3) and a union bound give $C R^3 p^6$ for failure of the first regularity condition.
    Failure of the second is bounded by Lemma 18 and
  $ C sum_(w : \| w - z \|_oo > 10 R) e^(- c \( 1 + \| w - z \|_oo \)^(nu lambda)) lt.eq C e^(- c' R^(nu lambda)) . $
  For the last inequality, count at most $C \( 1 + n \)^2$ sites at distance $n$ and absorb both this polynomial
    and the tail sum into a smaller exponential rate. Finally sum over the finitely many cosets. ◻
]

We have obtained regularity at prescribed times using only the induction hypothesis for $P$.
  To use this information over a walk’s whole history, fix an integer $K gt.eq 1$ and set

#[#set math.equation(numbering: n => "(4.6)")
 $ tau = K beta \, wide R = R_K = ceil.l a \( K + 1 \) beta ceil.r . $ <eq:scales>]

The constant $a gt.eq 1$ will be fixed sufficiently large in Lemma 20, independently of $K$.
  We also take $a gt.eq R_0$, the fixed radius threshold from Section 3. Then

#[#set math.equation(numbering: n => "(4.7)")
 $ delta_(R_K) = O_K \( beta^(- 12 \/ 5) \) = o_K \( beta^(- 3 \/ 2) \) . $ <eq:irregularity-scale>]

Call the exposure #emph[good for $z \, R$] if its nonregular times in one period have total Lebesgue measure at
  most $beta \/ 100$. Denote this event by $G_(z \, R)$. Fubini’s theorem and Markov’s inequality give

#[#set math.equation(numbering: n => "(4.8)")
 $ bb(P)_P \( G_(z \, R)^c \) lt.eq 100 delta_R . $ <eq:good-exposure>]

Neither this assertion nor Proposition 19 requires independence between time slices.

=== 4.3 Localization and diffusion <localization-and-diffusion>

To localize at $z$, kill the walk whenever its site leaves $frak(B)_R \( z \)$,
  in addition to the boundary killing already present in $U$.
  Apply the killing projections also at starting and ending layers and on the appropriate sides of instantaneous
  operations. Localized kernels, extended by zero to the original hole layers,
  are entrywise smaller and retain the norm contractions of Section 3.
  Write $U_(d \, R)$ for a localized full traversal in direction $d in { + \, - }$;
  reversing all factors gives $U_(- \, R) = U_(+ \, R)^(*)$.

#thm([Lemma 4.4.])[
  (Localization).  #emph[One may choose $a$ in (4.6) independently of $K$ so that the following holds,
    without assuming $sans(I) \( P \)$. Let $i$ be a deterministic slot point that is almost surely a hole under
    the exposure law for an allowed pin set $P$, and put $z = macron(x)_i$.
    Let $cal(K)$ be a deterministic schedule of at most $2 K +
    2$ full or partial boundary-killed traversals starting at $i$,
    each in either direction and each covering at most one period. Use matching layers at every concatenation.
    If $cal(K)_R$ is localized throughout at $z$, then
#[#set math.equation(numbering: n => "(4.9)")
 $ bb(E)_P parallel \( cal(K) - cal(K)_R \) upright(bold(1))_({ i }) #scale(x: 120%, y: 120%)[parallel]_1 lt.eq
   C_K e^(- c beta) . $ <eq:localization-loss>]

 The same estimate holds for localization of the walk on the full slot lattice,
   with all slots available and no exposed trajectories.]
] <lem:localization>

#proof[
  Sample the actual picture under $bb(P)_P$, thereby giving the exposure its correct marginal.
    Independently supply fresh Poisson clocks for each traversal piece.
    Accept these clocks where both endpoints are holes. Forced transports use actual picture marks;
    fresh uniform completions give the seam transitions. This generates the fresh walk conditional on the
    exposure, in either direction. Its expected mass loss from localization is at most its probability of exiting
    $frak(B)_R \( z \)$.
  An exit requires at least $R \/ B_(*)$ inter-site steps. Before the first exit,
    one of the pieces must therefore make at least
  $ j = ⌊frac(R, B_(*) \( 2 K + 2 \))⌋ gt.eq frac(a beta, 2 B_(*)) - 1 $
  steps, starting at a site in $frak(B)_R \( z \)$. Within a single piece the actual marks in this list are
    distinct: physical time runs injectively through at most one period,
    also for a reverse piece or a piece crossing the seam. The fresh marks are likewise distinct,
    and seam completions cause no inter-site step.
  For a fixed starting site, ignore slot compatibility to overcount all lists of $j$ steps.
    There are a bounded number of possible next sites, slot edges, and actual-or-fresh designations at each step.
    Lemma 4, combined with independence of the fresh Poisson family,
    bounds the mixed factorial measure by the product of the actual intensity multiplied by two and the fresh
    intensity. On unwrapping the chosen piece, the chronological times range over a simplex of volume at most
    $beta^j \/ j !$. After summing edge choices and designations, the expected number of lists is consequently at most
  $ frac(\( C beta \)^j, j !) . $
  Choose $a$ so large that $j gt.eq a beta \/ \( 3 B_(*) \)$ for large $beta$ makes this quantity at most
    $e^(- c beta)$, by $j ! gt.eq \( j \/ e \)^j$. Sum over the at most $2 K +
    2$ pieces and the $O \( R^3 \)$ possible starting sites; the polynomial factor is absorbed by reducing $c$ and
    using a constant $C_K$.
  All factorial estimates were applied unconditionally under $bb(P)_P$, within a single piece at a time.
    Actual marks may be reused on later traversals; no independence of those uses was asserted.
    For the full-lattice walk the same argument uses only fresh marks, and gives the final assertion. ◻
]

#thm([Proposition 4.5.])[
  (Diffusion on a good exposure).  #emph[Fix an exposure good for $z \, R_K$.
    Let a kernel be a subinterval of a concatenation of full traversals in arbitrary directions,
    localized throughout at $z$. For every nonnegative input of mass at most one,
    its output after elapsed time $b' gt.eq beta \/ 16$ satisfies
#[#set math.equation(numbering: n => "(4.10)")
 $ parallel v_(upright("out")) parallel_2 lt.eq C \( b' \)^(- 3 \/ 4) . $ <eq:diffusion-l2>]

 The same statement holds for the adjoint of any such subinterval.
   For such a kernel $cal(K)_R$ of length $b' gt.eq beta \/ 8$,
#[#set math.equation(numbering: n => "(4.11)")
 $ max_(j \, k) \( cal(K)_R \)_(j k) lt.eq C \( b' \)^(- 3 \/ 2) . $ <eq:diffusion-entry>]

 The constants are independent of $K$ and $R_K$.]
] <prop:diffusion>

#proof[
  This is Nash’s dissipation argument, applied only during regular times; see [14] pp. 935–936.
    Let $q = parallel v parallel_2^2$ for an evolving localized mass.
    At a regular smooth time, Proposition 12 and (3.5) imply
  $ q' lt.eq - c q^(5 \/ 3) \, wide \( q^(- 2 \/ 3) \)' gt.eq c' > 0 quad upright("when ") q > 0 . $
  At other smooth times and at instantaneous operations the norm does not increase.
    If it becomes zero, the conclusion is immediate. The input and output masses are at most one, by contraction.
  The subinterval has only two possible partial end pieces; all intermediate pieces have length $beta$.
    Its total nonregular time is therefore at most $\( b' \/ beta + 2 \) beta \/ 100$.
    For $b' gt.eq beta \/ 16$, its regular time is at least $67 b' \/ 100$.
    Integrating the displayed differential inequality proves (4.10).
    The same count holds after reversing the subinterval, and the reversed instantaneous factors are contractions.
    For (4.11), split at the temporal midpoint: an entry is the inner product of a forward mass from its starting
    slot and an adjoint mass from its ending slot. Each propagates for $b' \/ 2 gt.eq beta \/ 16$,
    so Cauchy–Schwarz and (4.10) give the result. ◻
]

=== 4.4 The hitting energy and the induction step <the-hitting-energy-and-the-induction-step>

We have proved diffusion under the geometry supplied by $sans(I) \( P \)$.
  It remains to turn this into the assertion for $E$ when $P = E union T$.
  The following two energy identities separate the return event from the spatial estimates.
  They hold at each fixed exposure and do not require the induction hypothesis.

#thm([Lemma 4.6.])[
  (Hitting energy).  #emph[Let $E$ be allowed and let $T eq.not
    diameter$ be a finite set of slot points at a deterministic cut $theta$, disjoint from $E$.
    Put $P = E union T$, $m_T = \| T \|$, and $eta = upright(bold(1))_T$.
    At almost every exposure under $bb(P)_P$, define $f = 1$ on $T$;
    at every other cut hole let $f$ be the probability that the boundary-killed fresh walk ever hits $T$ at a
    subsequent integer turn. Then $0 lt.eq f lt.eq 1$, $f$ has zero boundary values, and, for $g = f - eta$,
#[#set math.equation(numbering: n => "(4.12)")
 $ sum_(i in T) q_i \( upright(bold(a)) \) lt.eq m_T - chevron.l f \, A_Q f chevron.r = chevron.l eta \,
   Q eta chevron.r + 2 chevron.l Q eta \, g chevron.r - chevron.l g \, A_Q g chevron.r . $ <eq:hitting-energy>]

]
] <lem:hitting-energy>

#proof[
  As in [15] Lemma 4.5, construct $f$ from finite hitting horizons.
    Set $f_0 = eta$, and define $f_(n + 1) = 1$ on $T$ and $f_(n + 1) = U^(*) f_n$ off $T$.
    Positivity and substochasticity give $0 lt.eq f_n lt.eq f_(n + 1) lt.eq 1$.
    Their coordinatewise limit has the stated hitting interpretation and satisfies $U^(*) f = f$ off $T$,
    with zero boundary coordinates. No eventual absorption assumption is needed.
  Since $T$ is present only at the cut, a strictly positive return to $T$ occurs at a positive integer turn.
    Removing the extra pins of $E \\ D_0$ from the stopping rule yields $q_i \( upright(bold(a)) \)
    lt.eq \( U^(*) f \)_i$ for $i in T$. Harmonicity off $T$ and $f = 1$ on $T$ give
  $ chevron.l f \, A_Q f chevron.r = chevron.l \( I - U^(*) \) f \, f chevron.r = m_T - sum_(i in T) \( U^(*) f \)_i . $
  The quadratic forms of $U$, $U^(*)$, and $Q$ agree on real vectors.
    Finally, $chevron.l eta \, g chevron.r = 0$; expanding $f = eta + g$ gives (4.12). ◻
]

For an arbitrary real vector $y$ on the cut holes with zero boundary values, set $E_y = chevron.l y \,
  A_Q y chevron.r$. For either direction $d in { + \, - }$,
  split the traversal at elapsed time $u in I = \[ beta \/ 3 \, 2 beta \/ 3 \]$ as

$ U_d = B_d \( u \) C_d \( u \) \, wide Y_d \( u \) = B_d \( u \)^(*) y . $

Here $C_d \( u \)$ is the starting portion and $B_d \( u \)$ the ending portion;
  both factors use matching hole layers at physical time $t_d \( u \) = theta + u$ or $theta - u$ modulo $beta$.
  Each instantaneous operation is assigned to precisely one factor.
  The exceptional split times do not affect the integrals below.

#thm([Lemma 4.7.])[
  (Suffix energy).  #emph[With these definitions and zero extension to the available-slot graph at the split,
#[#set math.equation(numbering: n => "(4.13)")
 $ integral_I cal(D)_(t_d \( u \)) \( Y_d \( u \) \) thin d u lt.eq 1 /
   2 #scale(x: 120%, y: 120%)[\(] parallel y parallel_2^2 - parallel U_d^(*) y parallel_2^2
   #scale(x: 120%, y: 120%)[\)] lt.eq E_y . $ <eq:suffix-energy>]

 Moreover $parallel Y_d \( u \) parallel_oo lt.eq parallel y parallel_oo$.]
] <lem:suffix-energy>

#proof[
  As $u$ decreases, $B_d \( u \)^(*) y$ applies successively more adjoint factors from the endpoint.
    Equation (3.5) identifies its continuous squared norm loss with twice the displayed Dirichlet energy;
    instantaneous factors cannot increase the norm. Integrating over the subinterval $I$ gives the first
    inequality. The second follows from the exact identity
  $ E_y - 1 / 2 \( parallel y parallel_2^2 - parallel U_d^(*) y parallel_2^2 \) = 1 / 2 parallel y -
    U_d^(*) y parallel_2^2 gt.eq 0 \, $
  since $chevron.l y \, U_d^(*) y chevron.r = chevron.l y \, Q y chevron.r$.
    Supremum norm contraction proves the final assertion. ◻
]

#thm([Theorem 4.8.])[
  (Uniform sparse-pin estimate).  #emph[There is $beta_1 < oo$, independent of the cube and pins,
    such that for every $beta gt.eq beta_1$, every allowed pin set $E$,
    and every nonempty sparse set $T$ at one deterministic time, disjoint from $E$,
#[#set math.equation(numbering: n => "(4.14)")
 $ bb(P)_E \( T subset.eq cal(B)_E \) lt.eq beta^(- 9 \| T \| \/ 10) . $ <eq:sparse-pins>]

 Consequently (4.5) and (4.8) hold under every allowed pin law, with no induction hypothesis.]
] <thm:sparse-pins>

#proof[
  First fix a grid $cal(G)$ as above and prove $sans(I) \( E \)$ by downward induction on the finite number of
    grid pins outside $D_0$. The assertion is vacuous when all grid points are pinned.
    Suppose it is proved for every strict superset of $E$ among these pin sets,
    and fix an admissible sparse test $T$ for $E$. Then $P = E union T$ satisfies $sans(I) \( P \)$,
    so all the preceding probability estimates apply under $bb(P)_P$.
    Use $K = 1$, $R = R_1$, and the vectors of Lemma 22.
  The first term in (4.12) obeys
  #[#set math.equation(numbering: n => "(4.15)")
   $ bb(E)_P chevron.l eta \, Q eta chevron.r lt.eq C m_T #scale(x: 120%, y: 120%)[\(] e^(- c beta) + delta_R +
     R^alpha beta^(- 3 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:bootstrap-short-return>]
  Indeed, propagate a unit mass from each $i in T$ in either direction, localizing at $z_i = macron(x)_i$.
    Lemma 20 bounds the expected discarded mass by $C e^(- c beta)$.
    On an exposure good for $z_i \, R$, Proposition 21 bounds each one-period entry by $C beta^(- 3 \/ 2)$,
    and sparseness allows at most $L \( 1 + R \)^alpha$ target points of $T$ in that region.
    On a bad exposure the total output mass is at most one, and its probability is at most $100 delta_R$.
    Sum over $i$ and average the directions.
  It remains to absorb the linear term by its accompanying energy.
    Write $E_g = chevron.l g \, A_Q g chevron.r$, use the splits above with $y = g$,
    and let $C_(d \, R \, z_i) \( u \)$ denote the starting portion localized at $z_i$.
    Define a mass on the split layer by
  $ M_d \( u \) =
    sum_(i in T) upright(bold(1))_({ t_d \( u \) upright(" regular for ") z_i upright(" at radius ") R })
    C_(d \, R \, z_i) \( u \) upright(bold(1))_({ i }) \, wide F_d =
    frac(1, \| I \|) integral_I chevron.l M_d \( u \) \, Y_d \( u \) chevron.r thin d u . $
  The unchanged pairing $chevron.l U_d eta \, g chevron.r = chevron.l C_d \( u \) eta \,
    Y_d \( u \) chevron.r$ is constant in $u$. Since $0 lt.eq g lt.eq 1$,
    the suffix has supremum norm at most one. Localization, deterministic-time regularity, and Fubini therefore give
  #[#set math.equation(numbering: n => "(4.16)")
   $ bb(E)_P \| chevron.l U_d eta \, g chevron.r - F_d #scale(x: 120%, y: 120%)[\|] lt.eq
     C m_T \( e^(- c beta) + delta_R \) . $ <eq:bootstrap-pairing-error>]
  No good-exposure indicator is needed here: the next estimate uses only regularity at the split slice.
  Each retained summand of $M_d \( u \)$ has mass at most one and is supported above $frak(B)_R \( z_i \)$;
    the list of centers, including repetitions, has the growth bound of $T$.
    Proposition 14, followed by Cauchy–Schwarz in $u$ and Lemma 23, gives pointwise
  $ \| F_d \| lt.eq (frac(C m_T R^alpha, \| I \|) E_g)^(1 \/ 2) . $
  Because $\| I \| = beta \/ 3$ and $E_g gt.eq 0$, completing the square in $sqrt(E_g)$ yields
  $ F_(+) + F_(-) - E_g lt.eq frac(C m_T R^alpha, beta) . $
  Now $2 chevron.l Q eta \, g chevron.r = chevron.l U_(+) eta \, g chevron.r + chevron.l U_(-) eta \,
    g chevron.r$. Use the fresh-return identity (2.18), (4.12), and (4.15)–(4.16) to conclude
  #[#set math.equation(numbering: n => "(4.17)")
   $ r \( E \, T \) lt.eq C #scale(x: 120%, y: 120%)[\(] e^(- c beta) + delta_R + R^alpha beta^(- 3 \/ 2) +
     R^alpha beta^(- 1) #scale(x: 120%, y: 120%)[\)] = o \( beta^(- 9 \/ 10) \) . $ <eq:bootstrap-return>]
  Here $R = ceil.l 2 a beta ceil.r$, so the largest polynomial term is $O \( beta^(- 99 \/ 100) \)$;
    the error is uniform in every induction datum. Increase $beta_1$, independently of the grid and its size,
    so that $2 r \( E \, T \) lt.eq p$. Proposition 5 now gives $bb(P)_E \( T subset.eq cal(B)_E \)
    lt.eq \( 2 r \( E \, T \) \)^(m_T) lt.eq p^(m_T)$, completing the induction.
  For arbitrary allowed $E$ and a test at any deterministic time, choose a finite grid containing zero,
    that test time, and all the finitely many extra-pin times, then refine it to mesh at most $p^12$.
    The uniform grid result proves (4.14). The same choice of grid for an arbitrary allowed $P$ removes the
    hypothesis $sans(I) \( P \)$ from the regularity and good-exposure bounds. ◻
]

All time integrals above are of measurable functions of the exposure.
  The histories have finitely many jumps, their transition kernels are measurable,
  and the hitting function is an increasing limit of finite-horizon probabilities.
  The sharp one-slot estimate of order $beta^(- 3 \/ 2)$ has not been used in this induction;
  it will follow from the refined energy argument in Section 5.

== 5 The long-return remainder <sec:returns>

The sparse-pin estimate has made diffusion available under every allowed pin law.
  We now improve its one-slot consequence to the order $beta^(- 3 \/ 2)$ needed for Bloch’s law.
  The main step is a finite expansion of the return probability:
  the first $2 K - 1$ terms remain explicit, and the expected remainder is at most $C K^(- 1 \/ 2)
  beta^(- 3 \/ 2) + o_K \( beta^(- 3 \/ 2) \)$. The constant $C$ must be independent of $K$,
  since $K$ will tend to infinity after $beta$.

Fix an allowed pin set $E$, a deterministic slot-time point $i in.not E$, and its time cut $theta$.
  Write $x$ for its site, $z = macron(x)$, and $P = E union { i }$.
  At each exposure under $bb(P)_P$, use the boundary-killed one-period kernel $U$ and $Q = \( U + U^(*) \) \/ 2$,
  $A_Q = I - Q$. Boundary coordinates are retained with value zero.
  Let $eta = upright(bold(1))_({ i })$, and let $f$ be the hitting function of Lemma 22, with target ${ i }$.
  Thus $f \( i \) = 1$, $0 lt.eq f lt.eq 1$, and $f = U^(*) f$ away from $i$. Put $g = f - eta$.
  For the remainder of the section, $K gt.eq 1$ is fixed, $R = R_K$ and $tau = K beta$ are the scales in (4.6),
  and every $o_K$ is uniform in the cube, the cut, the slot, and the number, positions,
  and times of the deterministic extra pins.

#thm([Lemma 5.1.])[
  (Finite return expansion).  #emph[For almost every exposure, define
$ v = sum_(n = 1)^(K - 1) Q^n eta \, wide y = g - v \, wide E_y = chevron.l y \, A_Q y chevron.r \, $

 with the empty sum interpreted as zero. Then $E_y gt.eq 0$, $parallel y parallel_oo lt.eq K + 1$,
   and the fresh return probability satisfies
#[#set math.equation(numbering: n => "(5.1)")
 $ q_i lt.eq sum_(n = 1)^(2 K - 1) chevron.l eta \, Q^n eta chevron.r + 2 chevron.l Q^K eta \, y chevron.r -
   E_y . $ <eq:return-expansion>]

]
] <lem:return-expansion>

#proof[
  Lemma 22 gives
  $ q_i lt.eq Q_(i i) + 2 chevron.l Q eta \, g chevron.r - chevron.l g \, A_Q g chevron.r . $
  Every $Q^n eta$ is a nonnegative mass of total at most one.
    Consequently $parallel v parallel_oo lt.eq K - 1$ and $parallel y parallel_oo lt.eq K$;
    the slightly weaker displayed bound also covers all later uses.
    The contraction and symmetry of $Q$ give $E_y gt.eq 0$. The finite telescoping identity $A_Q v = Q eta -
    Q^K eta$ shows that substitution of $g = v + y$ leaves the linear term $2 chevron.l Q^K eta \, y chevron.r$.
    To compute the constant term, put $a_n = chevron.l eta \, Q^n eta chevron.r$. By symmetry,
  $ Q_(i i) + 2 chevron.l Q eta \, v chevron.r - chevron.l v \, A_Q v chevron.r & = a_1 + chevron.l v \,
    Q eta chevron.r + chevron.l v \, Q^K eta chevron.r\
 & = a_1 + sum_(n = 1)^(K - 1) a_(n + 1) + sum_(n = 1)^(K - 1) a_(n + K) = sum_(n = 1)^(2 K - 1) a_n . $
  This proves (5.1). No infinite Green series or assumption of eventual boundary absorption is used. ◻
]

#thm([Proposition 5.2.])[
  (Long-return bound).  #emph[For every fixed integer $K gt.eq 1$, as $beta arrow.r oo$,
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(E)_P #scale(x: 120%, y: 120%)[\[] 2 chevron.l Q^K eta \, y chevron.r -
   E_y #scale(x: 120%, y: 120%)[\]] lt.eq C K^(- 1 \/ 2) beta^(- 3 \/ 2) + o_K \( beta^(- 3 \/ 2) \) . $ <eq:long-tail>]

 Here $C$ depends only on the fixed interaction, spin, and geometric choices, and is independent of $K$.
   The error has the uniformity specified above.]
] <prop:long-tail>

#proof[
  Set $w = Q^(K - 1) eta$ and $I = \[ beta \/ 3 \, 2 beta \/ 3 \]$. Then
  $ 2 chevron.l Q^K eta \, y chevron.r = chevron.l U_(+) w \, y chevron.r + chevron.l U_(-) w \, y chevron.r . $
  For $d in { + \, - }$ and almost every $u in I$, split the last traversal as in Lemma 23:
  $ U_d = B_d \( u \) C_d \( u \) \, wide Y_d \( u \) = B_d \( u \)^(*) y . $
  Both vectors in the resulting pairing
  $ chevron.l U_d w \, y chevron.r = chevron.l C_d \( u \) w \, Y_d \( u \) chevron.r $
  are on the same hole layer at physical time $t_d \( u \) = theta + u$ or $theta - u med \( mod med beta \)$.
    The suffix remains killed only at the boundary. With zero extension to the slice graph, Lemma 23 gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel Y_d \( u \) parallel_oo lt.eq K + 1 \, wide integral_I cal(D)_(t_d \( u \)) \( Y_d \( u \) \) thin d
     u lt.eq E_y . $ <eq:tail-suffix>]
  In particular the energy on the right is the original one-period quadratic form, with no localization error.
  Localize the mass in the first argument throughout its propagation from $i$. Namely, put
  $ Q_R = 1 / 2 \( U_(+ \, R) + U_(- \, R) \) \, wide mu_d \( u \) = C_(d \, R) \( u \) Q_R^(K - 1) eta \, $
  where the subscript $R$ means killing on leaving $frak(B)_R \( z \)$, in addition to boundary killing.
    Expanding the powers of $Q$ and $Q_R$ gives convex combinations of matching direction words.
    Lemma 20, applied to the whole history of each word, therefore yields
  #[#set math.equation(numbering: n => "(5.4)")
   $ bb(E)_P parallel C_d \( u \) w - mu_d \( u \) parallel_1 lt.eq C_K e^(- c beta) \, wide
     u in I . $ <eq:tail-localization>]
  Let $G$ denote the event that the exposure is good for $z \, R$,
    and retain only regular split slices in the time average
  $ F_d =
    frac(1, \| I \|) integral_I upright(bold(1))_G
    upright(bold(1))_({ t_d \( u \) upright(" is regular for ") z \, R }) chevron.l mu_d \( u \) \,
    Y_d \( u \) chevron.r thin d u . $
  The original pairing is independent of $u$. Since $mu_d \( u \)$ has mass at most one, (5.3), (5.4), (4.5),
    and (4.8) imply
  #[#set math.equation(numbering: n => "(5.5)")
   $ bb(E)_P \| chevron.l U_d w \, y chevron.r - F_d #scale(x: 120%, y: 120%)[\|] & lt.eq \( K + 1 \)
     (C_K e^(- c beta) + bb(P)_P \( G^c \) + frac(1, \| I \|) integral_I bb(P)_P \( t_d \( u \)
     upright(" is not regular for ") z \, R \) thin d u)\
 & = o_K \( beta^(- 3 \/ 2) \) . $ <eq:tail-discarded>]
  These are unconditional expectations under the exposure law.
    In particular no independence between the propagated mass, the suffix,
    and the regularity events is asserted or needed.
  On a retained slice, every component of $mu_d \( u \)$ has elapsed propagation length
  $ b = \( K - 1 \) beta + u gt.eq \( K - 2 / 3 \) beta gt.eq 1 / 3 K beta . $
  Proposition 21 and convexity of the norm give $parallel mu_d \( u \) parallel_2 lt.eq C tau^(- 3 \/ 4)$,
    with a constant independent of $K$. The mass is at most one and is supported over $frak(B)_R \( z \)$.
    Since $1 lt.eq tau lt.eq R$, all hypotheses of Proposition 16 hold.
    Denote its constant for this fixed norm bound by $C_(upright("sp"))$; it too is independent of $K$. Hence
  $ \| chevron.l mu_d \( u \) \, Y_d \( u \) chevron.r \| lt.eq
    #scale(x: 120%, y: 120%)[\(] C_(upright("sp")) tau^(- 1 \/ 2) cal(D)_(t_d \( u \)) \( Y_d \( u \) \)
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  Cauchy–Schwarz in $u$, followed by (5.3), gives
  $ \| F_d \| lt.eq (frac(3 C_(upright("sp")) tau^(- 1 \/ 2), beta))^(1 \/ 2) E_y^(1 \/ 2) . $
  This also holds on $G^c$, where $F_d = 0$. Completing the square therefore gives, pointwise in the exposure,
  $ F_(+) + F_(-) - E_y lt.eq frac(3 C_(upright("sp")) tau^(- 1 \/ 2), beta) =
    3 C_(upright("sp")) K^(- 1 \/ 2) beta^(- 3 \/ 2) . $
  Take expectations and add the two errors in (5.5). This proves (5.2) and identifies a leading constant that is
    independent of $K$. ◻
]

#thm([Corollary 5.3.])[
  (Uniform singleton sparsity).  #emph[For every sufficiently large $beta$, uniformly in all allowed pin sets $E$,
    cubes, cuts, and slot-time points $i in.not E$,
#[#set math.equation(numbering: n => "(5.6)")
 $ r \( E \, { i } \) lt.eq C beta^(- 3 \/ 2) . $ <eq:singleton-return>]

 Consequently, for every allowed pin set $D$ and every slot-time point $j$ at a deterministic time,
#[#set math.equation(numbering: n => "(5.7)")
 $ bb(P)_D \( j in cal(B)_D \) lt.eq C beta^(- 3 \/ 2) . $ <eq:free-slot>]

]
] <cor:singleton-bound>

#proof[
  Take $K = 1$ in Lemma 25 and Proposition 26. By the fresh-walk identity,
  $ r \( E \, { i } \) = bb(E)_P q_i lt.eq bb(E)_P Q_(i i) + C beta^(- 3 \/ 2) + o \( beta^(- 3 \/ 2) \) . $
  The two one-turn localization losses are at most $C e^(- c beta)$ in expectation.
    On a good exposure, the localized diagonal is at most $C beta^(- 3 \/ 2)$ by Proposition 21;
    on its complement it is at most one. The complement has probability $o \( beta^(- 3 \/ 2) \)$ by (4.8).
    This bounds $bb(E)_P Q_(i i)$ and proves (5.6). For $j in.not D$, apply this estimate with $E = D$,
    using the time of $j$ as the cut, and use Proposition 5:
  $ bb(P)_D \( j in cal(B)_D \) = 2 d_D \( j \) = frac(2 r \( D \, { j } \), 1 + r \( D \, { j } \)) lt.eq
    2 r \( D \, { j } \) . $
  For $j in D$, the left side is zero. ◻
]

The estimate (5.7) is obtained only after closing the sparse-pin induction.
  It will now control encounters between exposed strands and an independent ideal path,
  allowing the explicit finite sum in (5.1) to be evaluated sharply.

== 6 Finite returns and the Bloch coefficient <sec:ideal>

We identify the finite return terms using the walk with every slot available.
  Its site motion uses all interaction bonds, so its diffusion matrix is $D_(S \, J)$,
  rather than a matrix determined by the three bonds chosen for the geometric estimates.
  The comparison has two steps: a coupling makes the expected mass error $o_K \( 1 \)$,
  and splitting a return at its midpoint multiplies this error by the diffusion bound $O \( beta^(- 3 \/ 2) \)$.

Fix $K$, $E$, $i in.not E$, $P = E union { i }$, and $R = R_K$ as in Section 5.
  Write $x$ for the site of $i$ and $z = macron(x)$. For a direction word
  $upright(bold(d)) = \( d_1 \, dots.h \, d_n \) in { + \, - }^n$, traversed with $d_1$ first, define

$ W \( upright(bold(d)) \) = U_(d_n) dots.h.c U_(d_1) \, wide W_R \( upright(bold(d)) \) =
  U_(d_n \, R) dots.h.c U_(d_1 \, R) . $

The factors are formed in one fixed exposure; each traversal then uses fresh transition randomness.
  The ideal kernels have all slots available, exchange rate $J \( y - x \) \/ 2$ on each slot edge,
  and fresh uniform site permutations at every seam. The reverse factors use the inverse permutations and the
  reversed order of operations. Denote the full ideal word over $bb(Z)^3$, with no killing,
  by $hat(W)_oo \( upright(bold(d)) \)$. Denote its version killed outside $Lambda^compose$ and outside
  $frak(B)_R \( z \)$ by $hat(W)_R \( upright(bold(d)) \)$.
  Ideal and exposed kernels assign each instantaneous operation to the same endpoint and use the same matching
  layers. The ideal kernels are deterministic transition matrices, with their fresh randomness already averaged.

=== 6.1 The full interaction kernel <the-full-interaction-kernel>

The site of a full ideal path jumps by $v$ at rate $ell J \( v \) \/ 2 = S J \( v \)$.
  Its total jump rate is the finite constant $lambda_J = S sum_v J \( v \)$.
  Neither a seam nor a reversal changes this site generator. With

$ phi.alt \( k \) = S sum_v J \( v \) \( 1 - cos \( k dot.op v \) \) \, wide kappa =
  frac(1, \( 4 pi \)^(3 \/ 2) sqrt(det D_(S \, J))) \, $

the site transition kernel is

#[#set math.equation(numbering: n => "(6.1)")
 $ p_t \( y \, w \) = integral_(\[ - pi \, pi \]^3) e^(upright(i) k dot.op \( w - y \)) e^(- t phi.alt \( k \))
   thin frac(d k, \( 2 pi \)^3) . $ <eq:ideal-fourier>]

#thm([Lemma 6.1.])[
  (Ideal return coefficient).  #emph[The full site kernel satisfies
#[#set math.equation(numbering: n => "(6.2)")
 $ sup_(y \, w) p_t \( y \, w \) lt.eq C \( 1 + t \)^(- 3 \/ 2) \, wide p_t \( x \, x \) =
   t^(- 3 \/ 2) \( kappa + o \( 1 \) \) . $ <eq:ideal-site-bounds>]

 The first estimate holds for all $t gt.eq 0$; the second is as $t arrow.r oo$.
   For every fixed $K$, every $1 lt.eq n lt.eq 2 K$, and every direction word of length $n$,
#[#set math.equation(numbering: n => "(6.3)")
 $ \( hat(W)_oo \( upright(bold(d)) \) \)_(i i) = ell^(- 1) p_(n beta) \( x \, x \) =
   beta^(- 3 \/ 2) #scale(x: 120%, y: 120%)[\(] \( kappa \/ ell \) n^(- 3 \/ 2) +
   o_K \( 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:ideal-diagonal>]

 The error is uniform in the word, cut, and initial slot. Always,
#[#set math.equation(numbering: n => "(6.4)")
 $ 0 lt.eq \( hat(W)_R \( upright(bold(d)) \) \)_(i i) lt.eq \( hat(W)_oo \( upright(bold(d)) \) \)_(i i) .
   $ <eq:ideal-killed-upper>]

 If $frak(B)_R \( z \) subset.eq Lambda^compose$, then
#[#set math.equation(numbering: n => "(6.5)")
 $ 0 lt.eq \( hat(W)_oo \( upright(bold(d)) \) \)_(i i) - \( hat(W)_R \( upright(bold(d)) \) \)_(i i) lt.eq
   C_K e^(- c beta) . $ <eq:ideal-killed-interior>]

]
] <lem:ideal-kernel>

#proof[
  At a zero of $phi.alt$, each $k dot.op v$ with $J \( v \) > 0$ belongs to $2 pi bb(Z)$.
    Since these $v$ generate $bb(Z)^3$, this forces $k in 2 pi bb(Z)^3$.
    Thus zero is the only zero in the integration cube. Moreover,
  $ phi.alt \( k \) = k^(sans(T)) D_(S \, J) k + O \( \| k \|^4 \) . $
  The matrix is positive definite because the support spans $bb(R)^3$.
    Compactness away from zero now gives $phi.alt \( k \) gt.eq c \| k \|^2$ throughout $\[ - pi \, pi \]^3$.
    Taking absolute values in (6.1) proves the heat kernel upper bound, including $t lt.eq
    1$ by enlarging the constant. For the diagonal, substitute $k =
    u \/ sqrt(t)$ and use dominated convergence with the bound $e^(- c \| u \|^2)$. The limiting integral is
  $ integral_(bb(R)^3) e^(- u^(sans(T)) D_(S \, J) u) frac(d u, \( 2 pi \)^3) =
    frac(1, \( 4 pi \)^(3 \/ 2) sqrt(det D_(S \, J))) . $
  This proves (6.2).
  Averaging a uniform site permutation makes the slot index uniform conditional on the site.
    The inverse of a uniform permutation has the same property. Every complete traversal contains one seam:
    if the cut is zero, it is at the end of a forward traversal and at the start of a reverse traversal.
    Free exchange transitions preserve this conditional uniformity,
    since the rate to each target slot is the same and the exit rate does not depend on the starting slot.
    Thus after the first seam, the slot index is uniform conditional on the site.
    The site process runs for total elapsed time $n beta$, proving the exact equality in (6.3).
    In particular, seam factors at a forward and reverse junction are two fresh averages;
    they do not cancel as fixed permutations would. The local limit is uniform over the finite set $1 lt.eq
    n lt.eq 2 K$.
  Killing restricts a path event, proving (6.4). Under the interior hypothesis it cannot act before the full ideal
    path leaves $frak(B)_R \( z \)$. The ideal localization estimate in Lemma 20,
    with the same radius and at most $2 K$ traversals, bounds this exit probability by $C_K e^(- c beta)$.
    This proves (6.5). ◻
]

=== 6.2 Comparison in one exposure <comparison-in-one-exposure>

#thm([Proposition 6.2.])[
  (Finite direction words).  #emph[For every fixed $K$,
#[#set math.equation(numbering: n => "(6.6)")
 $ lr(|bb(E)_P \[ \( W_R \( upright(bold(d)) \) \)_(i i) \] - \( hat(W)_R \( upright(bold(d)) \) \)_(i i)|) =
   o_K \( beta^(- 3 \/ 2) \) . $ <eq:finite-word>]

 The error is uniform over $1 lt.eq n lt.eq 2 K$, all direction words of length $n$, all cubes,
   deterministic cuts and slots, and all allowed pin sets $E$ with arbitrary finitely many extra pins.
   The product inside the expectation is formed before averaging over the exposure.]
] <prop:finite-word>

#proof[
  #emph[Midpoint reduction.] Split the elapsed word at time $n beta \/ 2$, writing
  $ W_R = sans(B) sans(C) \, wide hat(W)_R = hat(sans(B)) hat(sans(C)) . $
  Here $sans(C)$ is the starting portion. If the split is at an instantaneous operation,
    assign that operation to one portion exactly once. At a junction retain the order of the individual seam
    factors. For $eta = upright(bold(1))_({ i })$, put
  $ mu_1 = sans(C) eta \, quad mu_2 = sans(B)^(*) eta \, wide hat(mu)_1 = hat(sans(C)) eta \, quad hat(mu)_2 =
    hat(sans(B))^(*) eta . $
  After extending hole vectors by zero, all four are nonnegative masses of total at most one on the same full slot
    layer. Consequently
  #[#set math.equation(numbering: n => "(6.7)")
   $ \( W_R \)_(i i) = chevron.l mu_1 \, mu_2 chevron.r \, wide \( hat(W)_R \)_(i i) = chevron.l hat(mu)_1 \,
     hat(mu)_2 chevron.r . $ <eq:midpoint-pairings>]
  The second mass is propagated backward from the terminal copy of $i$; it is not a separately sampled exposure.
    This is the role of the matching layer in Figure 1.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$eta$])
  content((4.75, 0), [#box(width: 2cm, height: 0.9cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5f5"), [#set text(hyphenate: false); #align(center + horizon)[$mu_1, mu_2$]])])
  content((9.5, 0), [$eta$])
  line((0.2128, 0), (3.75, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.375, 0), [$sans(C)$], anchor: "south", padding: 0.1176cm)
  line((9.287, 0), (5.75, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.125, 0), [$sans(B)^*$], anchor: "south", padding: 0.1176cm)
  content((0, -0.9803), [$0$])
  content((4.75, 1.031), [common hole layer])
  content((4.75, -1.251), [$n beta"/"2$])
  content((9.5, -1.023), [$n beta$])
})],
    caption: [Figure 1: A diagonal return is an inner product on the midpoint layer. Both masses use the same exposure, with fresh transitions in each traversal. Coupling either mass to an independent full ideal path gives an expected $ell^1$ error; diffusion bounds the other mass in $ell^oo$. The positions are elapsed times, not lattice sites. ],
  ) <fig:midpoint>
  Let $G$ be the good-exposure event for $z \, R$. Each half has elapsed length $n beta \/ 2 gt.eq beta \/ 2$,
    so Proposition 21, including its adjoint statement, gives $parallel mu_1 parallel_oo +
    parallel mu_2 parallel_oo lt.eq C beta^(- 3 \/ 2)$ on $G$.
    The ideal halves obey this bound without a good-exposure condition:
    each slot probability is bounded by its full site probability in (6.2).
    A half need not contain a seam for this upper bound. The elementary pairing inequality gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ & lr(|bb(E)_P \[ \( W_R \)_(i i) \] - \( hat(W)_R \)_(i i)|)\
 & quad lt.eq
   C beta^(- 3 \/ 2) bb(E)_P [parallel mu_1 - hat(mu)_1 parallel_1 + parallel mu_2 - hat(mu)_2 parallel_1] +
   bb(P)_P \( G^c \) . $ <eq:midpoint-reduction>]
  Indeed on $G$ subtract the two inner products by changing their first and second arguments successively;
    on $G^c$ both diagonal entries lie in $\[ 0 \, 1 \]$. No independence of the two halves is used.
    Since $bb(P)_P \( G^c \) = o_K \( beta^(- 3 \/ 2) \)$, it remains to prove
  #[#set math.equation(numbering: n => "(6.9)")
   $ bb(E)_P parallel mu_j - hat(mu)_j parallel_1 = o_K \( 1 \) \, wide j = 1 \, 2 . $ <eq:coupling-l1>]
  #emph[Coupling conditional on the exposure.] Both masses are generated from $i$ along a deterministic schedule
    of full or partial traversals. For $j = 2$, reverse and transpose the suffix factors.
    We give the coupling for either schedule. Sample the entire actual picture with law $bb(P)_P$ and expose
    $cal(B)_P$. Independently of that entire picture, sample a full unkilled ideal path on the infinite slot
    lattice, with fresh clocks and seam permutations on each traversal.
    Its bounded jump rate $lambda_J$ ensures that it is well defined.
    Conditional on the exposure, use the same fresh clock on each slot edge whenever its endpoints are holes in
    the cube. At a prescribed exposed jump, perform the corresponding hole transport.
    At a seam, share the uniform site permutation if the site has no exposed slots;
    otherwise use an appropriate fresh uniform completion on its remaining slots.
    These rules give exactly the hole kernel conditional on the exposure. They also apply to reverse pieces:
    heat generators are symmetric, transports are inverted, and inverse uniform bijections are uniform.
    Repeated traversals share the exposure but use independent fresh transitions.
  Kill both paths outside $Lambda^compose$ or $frak(B)_R \( z \)$. Until they separate these killings agree.
    There are no interaction bonds from $Lambda^compose$ to the exterior of $Lambda$,
    by the choice of boundary thickness. A discrepancy before killing therefore requires an exposed slot at a site
    whose bar-coordinate is within distance $2 B_(*)$ of the full ideal path, at some traversed time.
    Include both sides of jumps and instantaneous operations in this event.
    This covers a missing clock edge, a forced transport affecting the common path,
    and a seam completion different from a full site permutation.
  #emph[Averaged encounter bound.] We bound the probability of this encounter unconditionally.
    Partition the schedule into $O_K \( beta \)$ deterministic intervals of elapsed length at most one,
    each within a single directed traversal piece; assign endpoint operations once.
    Take $h_beta = ceil.l log beta ceil.r$. In one such interval let $w$ be the bar-coordinate of the full ideal
    path at its initial time. Since each jump changes bar-coordinate by at most $B_(*)$,
    the probability of displacement greater than $B_(*) h_beta$ during the interval is at most
  #[#set math.equation(numbering: n => "(6.10)")
   $ frac(C^(h_beta), h_beta !) . $ <eq:ideal-short-tail>]
  For a deterministic $w$, Corollary 27, applied with pin set $P$ and summed over slots, gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ bb(P)_P #h(-0.16667em)
     (upright("an exposed slot lies over ") frak(B)_(4 B_(*) \( h_beta + 1 \)) \( w \)
     upright(" at the initial slice")) lt.eq C \( h_beta + 1 \)^3 beta^(- 3 \/ 2) . $ <eq:encounter-initial>]
  At a seam the set of sites occupied by exposed slots is the same on both sides,
    so this estimate covers either endpoint convention.
  If this initial event is absent but an exposed strand subsequently visits
    $frak(B)_(B_(*) \( h_beta + 2 \)) \( w \)$ in the interval, trace that strand back toward the initial slice.
    The distance between the two regions forces at least $h_beta$ inter-site steps.
    Count the first $h_beta$ steps from a visit. Their actual marks are distinct:
    this interval lies in one traversal, and for large $beta$ its length is less than $beta$,
    so unwrapped physical time is monotone and injective modulo $beta$.
    There are at most $C \( h_beta + 1 \)^3$ starting sites in the smaller region and a bounded number of
    next-site and slot-edge choices per step. By the factorial measure domination of Lemma 4,
    the probability of such a list is at most
  #[#set math.equation(numbering: n => "(6.12)")
   $ C \( h_beta + 1 \)^3 C^(h_beta) integral_(0 < s_1 < dots.h.c < s_(h_beta) < 1) d s_1 dots.h.c d s_(h_beta) =
     C \( h_beta + 1 \)^3 frac(C^(h_beta), h_beta !) . $ <eq:encounter-entrance>]
  Discarding slot compatibility only enlarges the count. A seam can change a slot index but no site,
    so it merely contributes a bounded slot choice; unwrapping preserves the simplex volume.
    Reversing a traversal reverses the order of the times and gives the same bound.
    Thus (6.12) uses factorial domination under the full picture law,
    without conditioning that domination on the exposure.
  The random coordinate $w$ depends only on the independent full ideal path.
    The bounds (6.11) and (6.12), uniform for deterministic $w$ and deterministic initial times,
    therefore apply to this random $w$. A union bound over the intervals bounds the encounter probability by
  #[#set math.equation(numbering: n => "(6.13)")
   $ C_K beta \( h_beta + 1 \)^3 (beta^(- 3 \/ 2) + frac(C^(h_beta), h_beta !)) =
     o_K \( 1 \) . $ <eq:encounter-probability>]
  The first term is $O_K \( beta^(- 1 \/ 2) \( log beta \)^3 \)$;
    the factorial term decays faster than every fixed inverse power of $beta$.
    Actual marks may reappear in later traversals, but the count used distinctness only within one interval.
    The union bound needs no independence across these intervals.
  Add a death state for killing. Conditional on each exposure,
    the $ell^1$ distance between the two live output masses is at most twice the failure probability of this
    coupling. Average over the picture and use (6.13). This proves (6.9) for both schedules and, by (6.8),
    proves (6.6). ◻
]

=== 6.3 Uniform return and down-spin bounds <uniform-return-and-down-spin-bounds>

#thm([Theorem 6.3.])[
  (One-slot bounds with the sharp coefficient).  #emph[There is a constant $C < oo$, independent of $K$,
    with the following property. For every integer $K gt.eq 1$ there are $beta_K <
    oo$ and a nonnegative function $epsilon.alt_K \( beta \) arrow.r 0$ as $beta arrow.r oo$,
    such that for $beta gt.eq beta_K$, every finite cube, every allowed pin set $E$,
    and every deterministic slot-time point $i$,
#[#set math.equation(numbering: n => "(6.14)")
 $ d_E \( i \) lt.eq
   beta^(- 3 \/ 2) (kappa / ell sum_(n = 1)^(2 K - 1) n^(- 3 \/ 2) + C K^(- 1 \/ 2) + epsilon.alt_K \( beta \)) .
   $ <eq:down-upper>]

 If the site $x$ of $i$ additionally satisfies
#[#set math.equation(numbering: n => "(6.15)")
 $ frak(B)_(R_K) \( macron(x) \) subset.eq Lambda^compose \, wide
   E upright(" has no pin over ") frak(B)_(R_K) \( macron(x) \) \, $ <eq:pin-free-ball>]

 then
#[#set math.equation(numbering: n => "(6.16)")
 $ d_E \( i \) gt.eq beta^(- 3 \/ 2) (kappa / ell sum_(n = 1)^K n^(- 3 \/ 2) - epsilon.alt_K \( beta \)) .
   $ <eq:down-lower>]

 For $i in.not E$, the same two bounds hold for $r \( E \, { i } \)$, with the same choice of error function.
   The threshold and error function are independent of the cube, cut, slot, and number, locations,
   and times of all finite extra pins. Only the fixed model and geometric choices, and $K$, may affect them.]
] <thm:return-bounds>

#proof[
  Suppose first that $i in.not E$, and take the exposure law $bb(P)_P$, $P = E union { i }$.
    Lemma 25 and Proposition 26 give
  $ r \( E \, { i } \) lt.eq sum_(n = 1)^(2 K - 1) bb(E)_P chevron.l eta \, Q^n eta chevron.r +
    beta^(- 3 \/ 2) #scale(x: 120%, y: 120%)[\(] C K^(- 1 \/ 2) + o_K \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Expand $Q^n$ as the equally weighted average of the $2^n$ direction words.
    Replacing each word by its localized version costs at most $C_K e^(- c beta)$ in expected diagonal mass,
    by Lemma 20. Proposition 29 and Lemma 28 then imply
  $ r \( E \, { i } \) lt.eq
    beta^(- 3 \/ 2) (kappa / ell sum_(n = 1)^(2 K - 1) n^(- 3 \/ 2) + C K^(- 1 \/ 2) + o_K \( 1 \)) . $
  There are only finitely many words at fixed $K$, so all comparison errors enter $o_K \( 1 \)$.
    They do not alter the constant multiplying $K^(- 1 \/ 2)$.
  For the lower bound assume (6.15). At fixed exposure, run the forward fresh walk with boundary and ball killing,
    and continue it after visits to $i$. Let $A_n$ be the event that it is alive and at $i$ at elapsed time $n
    beta$. Before any such visit it has stayed in the ball and hence avoided $E$.
    Thus $q_i gt.eq Pr \( union.big_(n = 1)^K A_n divides upright("exposure") \)$.
    The fresh transitions on successive turns give
  $ Pr \( A_n divides upright("exposure") \) = \( U_(+ \, R)^n \)_(i i) \, wide
    Pr \( A_j ∩ A_n divides upright("exposure") \) = \( U_(+ \, R)^j \)_(i i) \( U_(+ \, R)^(n - j) \)_(i i)
    quad \( j < n \) . $
  The Bonferroni lower bound therefore reads
  #[#set math.equation(numbering: n => "(6.17)")
   $ q_i gt.eq sum_(n = 1)^K \( U_(+ \, R)^n \)_(i i) -
     sum_(1 lt.eq j < n lt.eq K) \( U_(+ \, R)^j \)_(i i) \( U_(+ \, R)^(n - j) \)_(i i) . $ <eq:bonferroni>]
  On good exposures each product is $O \( beta^(- 3) \)$ by Proposition 21; on the complement each is at most one,
    and that complement has probability $o_K \( beta^(- 3 \/ 2) \)$.
    The expected pair sum is consequently $o_K \( beta^(- 3 \/ 2) \)$.
    For the first sum apply Proposition 29 to the all-forward word and use the interior comparison (6.5).
    Averaging (6.17) gives
  $ r \( E \, { i } \) gt.eq beta^(- 3 \/ 2) (kappa / ell sum_(n = 1)^K n^(- 3 \/ 2) - o_K \( 1 \)) . $
  Finally, Proposition 5 and Corollary 27 give, uniformly,
  $ d_E \( i \) = frac(r \( E \, { i } \), 1 + r \( E \, { i } \)) \, wide 0 lt.eq r \( E \, { i } \) -
    d_E \( i \) lt.eq C beta^(- 3) . $
  This changes only the normalized $o_K \( 1 \)$ errors. Choose a common threshold $beta_K$ and a nonnegative
    error function tending to zero that dominates all these uniform error magnitudes.
    This proves both estimates for $r$ and $d$. If $i in E$, then $d_E \( i \) = 0$,
    so the upper bound still holds; the lower-bound hypotheses already exclude this case. ◻
]

== 7 From pinned returns to spontaneous magnetization <sec:pressure>

The return estimates hold for every deterministic choice of extra pins.
  A positive magnetic field is an exact mixture of such choices.
  We use this fact to bound finite-volume pressure increments,
  then take the thermodynamic limit before differentiating at zero field.

=== 7.1 Pressure and the cost of boundary pins <pressure-and-the-cost-of-boundary-pins>

Write $V = \| Lambda_N \|$ and

$ p_N \( h \) = frac(1, beta V) log Z_(Lambda_N) \( h \) . $

The limit $p_beta \( h \) = lim_(N arrow.r oo) p_N \( h \)$ exists for every $beta > 0$ and $h in bb(R)$.
  Here is the finite-range argument. Tile a large cube, apart from a remainder,
  by cubes of a fixed side $l$ and delete all interactions between tiles.
  There are $O \( V \/ l \)$ deleted bonds, each with uniformly bounded operator norm;
  the remainder has $o \( V \)$ sites as $N arrow.r oo$ with $l$ fixed and may be left as singletons.
  If two Hamiltonians differ by an operator of norm at most $a$,
  their logarithmic partition functions differ by at most $beta a$, by ordered-eigenvalue comparison.
  Consequently the limiting upper and lower pressures both lie within $C \/
  l$ of the pressure per site of a single tile. Letting $l arrow.r oo$ proves existence.
  Since $\[ H_(S \, N)^J \, M_(S \, N) \] = 0$ and $∥M_(S \, N)∥ lt.eq S V$,
  each $p_N$ is convex and $S$-Lipschitz in $h$. These properties pass to $p_beta$,
  so its right derivative at zero exists.

Let $Z_Lambda^(+) \( h \)$ be the loop expression in Proposition 2 with all cycles meeting $D_0$ constrained to
  have color $+ 1$, and put $p_N^(+) \( h \) = \( beta V \)^(- 1) log Z_(Lambda_N)^(+) \( h \)$.

#thm([Proposition 7.1.])[
  (Boundary pressure equivalence).  #emph[For every fixed $beta > 0$ and $h gt.eq 0$,
#[#set math.equation(numbering: n => "(7.1)")
 $ lim_(N arrow.r oo) p_N^(+) \( h \) = p_beta \( h \) . $ <eq:boundary-pressure>]

]
] <prop:pressure-equivalence>

#proof[
  Factor $e^(beta h S V)$ from the unrestricted color sum. Its picture weight, relative to the base law, becomes
  $ W_h = product_C \( 1 + e^(- beta h a_C) \) . $
  Given the picture, the colors of different cycles are independent and the probability that a cycle is up is at
    least $1 \/ 2$. If $b_partial$ counts the cycles meeting $D_0$,
    the corresponding normalized picture expectation therefore satisfies
  #[#set math.equation(numbering: n => "(7.2)")
   $ 1 gt.eq frac(Z_Lambda^(+) \( h \), Z_Lambda \( h \)) gt.eq bb(E)_h \[ 2^(- b_partial) \] gt.eq exp { -
     log \( 2 \) thin bb(E)_h b_partial } . $ <eq:surface-cost>]
  A cycle visiting the boundary either contains a time-zero boundary slot or arrives there at a mark incident to
    the boundary. Thus
  $ b_partial lt.eq ell \| partial Lambda \| + 2 N_partial \, $
  where $N_partial$ is the number of such marks. Insertion of a mark changes at most two cycle factors in $W_h$,
    each between one and two, so it increases $W_h$ by at most a factor of four.
    The Poisson insertion argument of Lemma 4 gives $bb(E)_h N_partial lt.eq C beta \| partial Lambda \|$.
    Taking logarithms in (7.2) yields
  $ 0 lt.eq p_N \( h \) - p_N^(+) \( h \) lt.eq C \( 1 + beta \) frac(\| partial Lambda \|, beta \| Lambda \|) . $
  For fixed $beta$, the right side tends to zero. ◻
]

=== 7.2 A magnetic field as random extra pins <a-magnetic-field-as-random-extra-pins>

The mixture in the next lemma is useful because its conditional laws are precisely the deterministic pin laws
  already studied. Its mixing measure need not be a product measure.

#thm([Lemma 7.2.])[
  (Extra-pin mixture).  #emph[For $h gt.eq 0$, the colored-picture law defining $Z_Lambda^(+) \( h \)$ is a
    mixture of the zero-field pinned laws with pin sets $E = D_0 union F$, where $F$ consists of time-zero slots.
    Under the mixing law,
#[#set math.equation(numbering: n => "(7.3)")
 $ Pr \( i in F \) lt.eq b \( h \) := 1 - e^(- beta h) wide
   upright("for every time-zero slot ") i . $ <eq:pin-marginal>]

 Moreover,
#[#set math.equation(numbering: n => "(7.4)")
 $ S - \( p_N^(+) \)' \( h \) = 1 / V sum_(i in V_Lambda) bb(E)_F \[ d_(D_0 union F) \( i \) \] . $ <eq:field-deficit>]

]
] <lem:pin-mixture>

#proof[
  For a colored picture let $D_(upright("down"))$ count its down slots at time zero.
    Then $M = S V - D_(upright("down"))$. Start with independent selection of all time-zero slots with probability
    $b \( h \)$. The probability that only up slots are selected is $\( 1 - b \( h \) \)^(D_(upright("down"))) =
    e^(- beta h D_(upright("down")))$. Consequently the joint weight obtained by multiplying the zero-field
    colored-picture weight by the independent selection weight and by
    $upright(bold(1))_(F upright(" contains only up slots"))$ has exactly the desired field-tilted colored-picture
    marginal, after normalization. Conditioning instead on $F$ leaves unit weight for each coloring satisfying the
    pins $D_0 union F$. Summing these colorings gives the picture factor $2^(n_(D_0 union F))$, as required.
  Conditional on the picture and its colors in this joint law, down slots are never selected,
    while up slots are selected independently with probability $b \( h \)$. This proves (7.3).
    Finally, differentiation of the finite-volume field tilt gives $\( p_N^(+) \)' \( h \) = V^(- 1) bb(E) M$;
    conditioning on $F$ gives (7.4). ◻
]

=== 7.3 The order of limits <the-order-of-limits>

Recall the ideal heat-kernel constant and define its finite sums by

#[#set math.equation(numbering: n => "(7.5)")
 $ kappa = frac(1, \( 4 pi \)^(3 \/ 2) sqrt(det D_(S \, J))) \, wide c_j =
   kappa sum_(n = 1)^j n^(- 3 \/ 2) . $ <eq:partial-bloch>]

Fix an integer $K gt.eq 1$ and use the radius $R = R_K = ceil.l a \( K + 1 \) beta ceil.r$ from (4.6).
  The upper down-probability bound of Theorem 30 and (7.4) imply

#[#set math.equation(numbering: n => "(7.6)")
 $ S - \( p_N^(+) \)' \( h \) lt.eq beta^(- 3 \/ 2) #scale(x: 120%, y: 120%)[\(] c_(2 K - 1) + C K^(- 1 \/ 2) +
   epsilon.alt_K \( beta \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:pressure-upper>]

where $epsilon.alt_K \( beta \) gt.eq 0$ tends to zero as $beta arrow.r oo$ for fixed $K$,
  uniformly in $N$ and $h gt.eq 0$. The leading constant $C$ is independent of $K$.
  There are $ell V$ slots in the sum, so the factor $1 \/ ell$ in each ideal slot-return probability has canceled.

For a lower bound, let $rho_N$ be the fraction of sites $x in Lambda_N$ for which $frak(B)_R \( macron(x) \)
  subset.eq Lambda_N^compose$. Since the coset representatives and $A$ are fixed,
  all sites in this ball lie within a bounded physical distance of $x$ when $R$ is fixed.
  Hence $rho_N arrow.r 1$ as $N arrow.r oo$, with $beta \, K$ fixed. There are at most

$ v_R = ell \| frak(C) \| \( 2 R + 1 \)^3 $

time-zero slots above the ball. The union bound and (7.3) show that it contains no extra pin with probability at
  least $\[ 1 - v_R b \( h \) \]_(+)$, where $\[ u \]_(+) = max { u \, 0 }$.
  On this event Theorem 30 supplies its lower bound. Enlarging $epsilon.alt_K$ to cover both errors gives

#[#set math.equation(numbering: n => "(7.7)")
 $ S - \( p_N^(+) \)' \( h \) gt.eq rho_N \[ 1 - v_R b \( h \) \]_(+) thin beta^(- 3 \/ 2)
   #scale(x: 120%, y: 120%)[\(] c_K - epsilon.alt_K \( beta \) #scale(x: 120%, y: 120%)[\)] . $ <eq:pressure-lower>]

Here and below $beta$ is sufficiently large, depending on $K$, that $c_K - epsilon.alt_K \( beta \) gt.eq 0$.

#proof[
  Integrate (7.6) and (7.7) from $0$ to $h > 0$, and divide by $h$. This bounds
  $ S - frac(p_N^(+) \( h \) - p_N^(+) \( 0 \), h) . $
  First send $N arrow.r oo$, using Proposition 31 at both endpoints and $rho_N arrow.r 1$.
    Then send $h arrow.b 0$. For these fixed $beta \, K$, continuity of $b$ at zero gives
  $ lim_(h arrow.b 0) 1 / h integral_0^h \[ 1 - v_R b \( u \) \]_(+) thin d u = 1 . $
  By the definition of the right derivative,
  #[#set math.equation(numbering: n => "(7.8)")
   $ c_K - epsilon.alt_K \( beta \) lt.eq beta^(3 \/ 2) #scale(x: 120%, y: 120%)[\(] S -
     m_(S \, J) \( beta \) #scale(x: 120%, y: 120%)[\)] lt.eq c_(2 K - 1) + C K^(- 1 \/ 2) +
     epsilon.alt_K \( beta \) . $ <eq:final-squeeze>]
  Thus the thermodynamic limit and the zero-field derivative have been handled through pressure increments.
    Now let $beta arrow.r oo$ with $K$ fixed and then $K arrow.r oo$.
    Both sides of (7.8) converge to $kappa zeta \( 3 \/ 2 \)$, proving the stated law. ◻
]

#heading(level: 1)[References]
#bibitem([1])[J.~E.~Björnberg and K.~Ryan. Exponential decay in $cal(O) \( n \)$-invariant quantum spin systems.
  #emph[Annales Henri Poincaré] (2026), published online March~25, 2026.
  #link("https://doi.org/10.1007/s00023-026-01690-3")[doi:10.1007/s00023-026-01690-3].]
#bibitem([2])[F.~Bloch. Zur Theorie des Ferromagnetismus.
  #emph[Zeitschrift für Physik] #strong[61] (1930), 206--219.
  #link("https://doi.org/10.1007/BF01339661")[doi:10.1007/BF01339661].]
#bibitem([3])[J.~Borcea, P.~Brändén, and T.~M.~Liggett. Negative dependence and the geometry of polynomials.
  #emph[Journal of the American Mathematical Society] #strong[22] (2009), 521--567.
  #link("https://doi.org/10.1090/S0894-0347-08-00618-8")[doi:10.1090/S0894-0347-08-00618-8].]
#bibitem([4])[J.~G.~Conlon and J.~P.~Solovej. Upper bound on the free energy of the spin~$1 \/
  2$ Heisenberg ferromagnet. #emph[Letters in Mathematical Physics] #strong[23] (1991), 223--231.
  #link("https://doi.org/10.1007/BF01885500")[doi:10.1007/BF01885500].]
#bibitem([5])[M.~Correggi, A.~Giuliani, and R.~Seiringer.
  Validity of the spin-wave approximation for the free energy of the Heisenberg ferromagnet.
  #emph[Communications in Mathematical Physics] #strong[339] (2015), 279--307.
  #link("https://doi.org/10.1007/s00220-015-2402-0")[doi:10.1007/s00220-015-2402-0].]
#bibitem([6])[F.~J.~Dyson. General theory of spin-wave interactions.
  #emph[Physical Review] #strong[102] (1956), 1217--1230.
  #link("https://doi.org/10.1103/PhysRev.102.1217")[doi:10.1103/PhysRev.102.1217].]
#bibitem([7])[F.~J.~Dyson. Thermodynamic behavior of an ideal ferromagnet.
  #emph[Physical Review] #strong[102] (1956), 1230--1244.
  #link("https://doi.org/10.1103/PhysRev.102.1230")[doi:10.1103/PhysRev.102.1230].]
#bibitem([8])[F.~J.~Dyson, E.~H.~Lieb, and B.~Simon. Phase transitions in quantum spin systems with isotropic and
  nonisotropic interactions. #emph[Journal of Statistical Physics] #strong[18] (1978), 335--383.
  #link("https://doi.org/10.1007/BF01106729")[doi:10.1007/BF01106729].]
#bibitem([9])[J.~Fröhlich, B.~Simon, and T.~Spencer. Infrared bounds,
  phase transitions and continuous symmetry breaking. #emph[Communications in Mathematical Physics] #strong[50]
  (1976), 79--95. #link("https://doi.org/10.1007/BF01608557")[doi:10.1007/BF01608557].]
#bibitem([10])[T.~Holstein and H.~Primakoff. Field dependence of the intrinsic domain magnetization of a
  ferromagnet. #emph[Physical Review] #strong[58] (1940), 1098--1113.
  #link("https://doi.org/10.1103/PhysRev.58.1098")[doi:10.1103/PhysRev.58.1098].]
#bibitem([11])[E.~H.~Lieb. Long range order for the quantum Heisenberg model.
  #emph[Open Problems in Mathematical Physics], contribution dated January~27, 1999, Problem~A.
  #link("https://web.math.princeton.edu/~aizenman/OpenProblems_MathPhys/9901.HeisenbergFerr.html")[Author's
  problem statement].]
#bibitem([12])[N.~D.~Mermin and H.~Wagner. Absence of ferromagnetism or antiferromagnetism in one- or
  two-dimensional isotropic Heisenberg models. #emph[Physical Review Letters] #strong[17] (1966), 1133--1136;
  erratum, #strong[17] (1966), 1307.
  #link("https://doi.org/10.1103/PhysRevLett.17.1133")[doi:10.1103/PhysRevLett.17.1133].]
#bibitem([13])[B.~Nachtergaele. Quasi-state decompositions for quantum spin systems. In B.~Grigelionis et al.
  (eds.), #emph[Probability Theory and Mathematical Statistics], Proceedings of the Sixth Vilnius Conference,
  VSP/TEV, Utrecht--Tokyo--Vilnius, 1994, pp.~565--590.
  #link("https://arxiv.org/abs/cond-mat/9312012")[arXiv:cond-mat/9312012].]
#bibitem([14])[J.~Nash. Continuity of solutions of parabolic and elliptic equations.
  #emph[American Journal of Mathematics] #strong[80] (1958), 931--954.
  #link("https://doi.org/10.2307/2372841")[doi:10.2307/2372841].]
#bibitem([15])[OpenAI. #emph[Spontaneous magnetization in the quantum Heisenberg ferromagnet].
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Spontaneous-magnetization-in-the-quantum-Heisenberg-ferromagnet-September-24-2026/paper.pdf")[OAI:Spontaneous-magnetization-in-the-quantum-Heisenberg-ferromagnet-September-24-2026],
  2026.]
#bibitem([16])[R.~Seiringer. The Heisenberg ferromagnet: a dilute Bose gas in disguise. In #emph[Mini-Workshop:
  New Directions in Correlated Quantum Systems], #emph[Oberwolfach Reports] #strong[22] (2025), 357--358.
  #link("https://doi.org/10.4171/OWR/2025/7")[doi:10.4171/OWR/2025/7].]
#bibitem([17])[B.~Tóth. Improved lower bound on the thermodynamic pressure of the spin~$1 \/
  2$ Heisenberg ferromagnet. #emph[Letters in Mathematical Physics] #strong[28] (1993), 75--84.
  #link("https://doi.org/10.1007/BF00739568")[doi:10.1007/BF00739568].]
