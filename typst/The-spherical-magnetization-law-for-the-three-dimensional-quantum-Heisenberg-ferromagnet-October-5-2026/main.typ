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

#align(center)[#text(size: 16pt, weight: "bold")[The spherical magnetization law for thethree-dimensional quantum Heisenberg ferromagnet]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

An isotropic ferromagnet has no preferred direction in zero field.
  In a finite periodic volume, its Gibbs state is therefore rotation invariant even at temperatures where
  magnetized equilibrium states exist. The natural description of the ordered phase is a magnetization of fixed
  length and uniformly distributed direction. Rotation invariance alone does not establish this description:
  it allows a mixture of different lengths. The question addressed here is whether the symmetric finite-volume
  state selects a single length, and whether that length is the magnetization selected by an infinitesimal field.

=== 1.1 Model and result <model-and-result>

Fix $S in { 1 / 2 \, 1 \, 3 / 2 \, dots.h }$. Let $S^1 \, S^2 \, S^3$ be the irreducible spin-$S$ matrices,
  normalized by

$ \[ S^a \, S^b \] = i sum_c epsilon.alt_(a b c) S^c \, wide sum_(a = 1)^3 \( S^a \)^2 = S \( S + 1 \) I . $

For even $L gt.eq 4$, write $Lambda_L = \( bb(Z) \/ L bb(Z) \)^3$ and $V = L^3$.
  On $⨂_(x in Lambda_L) bb(C)^(2 S + 1)$, consider

#[#set math.equation(numbering: n => "(1.1)")
 $ H_(S \, L) = - sum_({ x \, y } upright(" nearest neighbors")) sum_(a = 1)^3 S_x^a S_y^a \, wide M_L^a =
   sum_(x in Lambda_L) S_x^a \, $ <eq:model>]

where each unordered bond is counted once. We use the Gibbs expectation

$ chevron.l A chevron.r_(beta \, L) = frac("Tr" \( A e^(- beta H_(S \, L)) \), "Tr" e^(- beta H_(S \, L))) . $

The pressure and its right derivative at zero field are

#[#set math.equation(numbering: n => "(1.2)")
 $ p_(S \, beta) \( h \) & = lim_(L arrow.r oo\
L upright(" even")) frac(1, beta V) log "Tr" e^(- beta \( H_(S \, L) - h M_L^3 \)) \,\
m_(S \, beta) & = p'_(S \, beta) \( 0 + \) . $ <eq:pressure>]

The pressure limit exists for this bounded finite-range interaction, and convexity gives the right derivative.
  The volume limit in (1.2) precedes removal of the field.

#thm([Theorem 1.1.])[
  (Spherical magnetization law).  #emph[For each fixed $S$ there is a finite $beta_0 \( S \)$ such that,
    for every fixed finite $beta gt.eq beta_0 \( S \)$, one has $m = m_(S \, beta) > 0$ and
#[#set math.equation(numbering: n => "(1.3)")
 $ lim_(L arrow.r oo\
L upright(" even")) ⟨exp #h(-0.16667em) (1 / V sum_(a = 1)^3 t_a M_L^a)⟩_(beta \, L) =
  frac(1, 4 pi) integral_(bb(S)^2) e^(m t dot.op n) thin upright(d) sigma \( n \) =
  frac(sinh \( m \| t \| \), m \| t \|) wide \( t in bb(R)^3 \) . $ <eq:spherical-law>]

 Here $sigma$ is surface-area measure on $bb(S)^2$, and the quotient at $t = 0$ is interpreted as $1$. In addition,
#[#set math.equation(numbering: n => "(1.4)")
 $ lim_(L arrow.r oo\
L upright(" even")) 1 / V^2 sum_(x \, y in Lambda_L) chevron.l S_x dot.op S_y chevron.r_(beta \, L) =
  m^2 . $ <eq:second-moment-law>]

]
] <thm:main>

The statement uses self-adjoint linear combinations of the spin components.
  It requires no joint finite-volume measurement of these noncommuting operators.
  Both the spin and the positive temperature remain fixed throughout the volume limit.

=== 1.2 Context and antecedents <subsec:history>

The dimensional distinction in this problem is fundamental.
  Mermin and Wagner #cite(label("MerminWagner1966")) excluded spontaneous ferro- or antiferromagnetic order at
  positive temperature for finite-range isotropic Heisenberg models in dimensions one and two.
  In higher dimensions, infrared bounds proved continuous-symmetry breaking for classical
  models #cite(label("FSS1976")) and ordering for quantum antiferromagnets #cite(label("DLS1978")).
  These quantum antiferromagnetic results do not supply the isotropic ferromagnetic ordering input used here.
  Another line of work establishes the low-temperature free-energy asymptotic predicted by spin-wave
  theory #cite(label("CGS2015")). That asymptotic concerns a different limit from the field derivative or the
  zero-field magnetization distribution at a fixed positive temperature.

The spherical distribution itself has clear antecedents. Ueltschi’s description of three-dimensional loop
  models #cite(label("Ueltschi2017")) Section 8.1 derives the transform $sinh \( h m \) \/ \( h m \)$ for the
  spin-$1 / 2$ ferromagnet conditional on a conjectured Poisson–Dirichlet law for macroscopic loops.
  Björnberg, Fröhlich, and Ueltschi #cite(label("BFU2020")) Theorem 2.1 prove the spherical transform for the
  complete-graph quantum Heisenberg model at arbitrary fixed spin.
  Our setting has nearest-neighbor interactions on the three-dimensional lattice.
  We prove its magnetization law without assuming a distribution for macroscopic loop lengths.

The existence of spontaneous magnetization and the identification of its zero-field distribution are distinct
  questions. The companion manuscript #cite(label("Ord")) constructs magnetized equilibrium states for the
  isotropic nearest-neighbor quantum Heisenberg ferromagnet in dimensions at least three,
  for every fixed spin at sufficiently low positive temperatures.
  The companion #cite(label("BL")) establishes the low-temperature asymptotic of the pressure-defined
  magnetization for nonnegative symmetric finite-range interactions whose support generates $bb(Z)^3$.
  We use finite exchange and geometric estimates from these works.
  The present argument adds spatial control on periodic tori and a pressure argument excluding translation-ergodic
  equilibrium states with different magnetization magnitudes.

The exchange representation builds on permutation and random-walk representations of quantum
  spins #cite(label("Powers1976")) #cite(label("ConlonSolovej1991Representation")),
  Tóth’s random-stirring representation #cite(label("Toth1993")),
  and its higher-spin formulation through symmetric slots #cite(label("Nachtergaele1994")).
  The finite pin estimates used below draw on the stability and negative dependence theory of Borcea, Brändén,
  and Liggett #cite(label("BBL2009")). Our zero-free matrix products use the contraction principle associated with
  Asano’s and Ruelle’s developments of Lee–Yang theory #cite(label("Asano1970")) #cite(label("Ruelle1971"))
  #cite(label("Ruelle1973")); the contraction needed here is proved explicitly.
  Mean entropy, equilibrium states, and pressure tangents are treated within the variational framework of Lanford
  and Robinson #cite(label("LanfordRobinson1968Entropy")) #cite(label("LanfordRobinson1968Spin")).
  We recall the required facts and prove the additional replica and harmonic-selection statements.

=== 1.3 The two parts of the proof <subsec:strategy>

Here is the obstruction that the proof must overcome. Let $J_L$ denote the total-spin label in the
  rotation-invariant Gibbs state. Conditional on $J_L$, any component of $M_L$ is uniform on $- J_L \, - J_L +
  1 \, dots.h \, J_L$. A fixed positive field and the definition of $m$ already imply

#[#set math.equation(numbering: n => "(1.5)")
 $ bb(P) \( J_L \/ V > m + epsilon.alt \) arrow.r 0 wide \( epsilon.alt > 0 \) . $ <eq:overview-upper>]

Thus it remains to prove

#[#set math.equation(numbering: n => "(1.6)")
 $ liminf_(L arrow.r oo) frac(bb(E) \[ J_L \( J_L + 1 \) \], V^2) gt.eq m^2 . $ <eq:overview-lower>]

Together these bounds force $J_L \/ V arrow.r m$ in probability and give (1.3).
  Section 8 supplies this last representation-theoretic argument in detail.

Two facts produce the lower bound. First, the squared magnetization averaged on large local boxes is controlled by
  the squared magnetization averaged on the whole torus, with an error vanishing as the local scale grows.
  This prevents local magnetization from canceling through spatial variation on larger scales.
  Second, every translation-ergodic equilibrium state has magnetization vector of length $m$.
  Here an equilibrium state maximizes mean entropy minus $beta$ times the physical energy density among
  translation-invariant states; an ergodic state is an extreme point of that invariant state space.
  Their variational and averaging properties are recalled in Section 6.
  The second fact identifies the local magnetization length to which the first fact applies.

Both facts use the same weak exponential estimate. To describe it,
  let $cal(P)$ be a rectangular partition whose cell sides are comparable to a large scale $R lt.eq L$.
  For a deterministic site function $f$ with $\| f_x \| lt.eq 1$ and $sum_(x in C) f_x = 0$ in each cell,
  put $D_f = sum_x f_x S_x^3$. We prove, for $b_R asymp R^(- 5 \/ 2)$ and a fixed $kappa > 0$, that

#[#set math.equation(numbering: n => "(1.7)")
 $ log chevron.l e^(theta_R D_f) chevron.r_(beta \, L) lt.eq C_beta b_R V \, wide theta_R =
   kappa b_R log R . $ <eq:overview-exp>]

In particular the left side divided by $theta_R V$ tends to zero uniformly in these tests.
  In nested rectangular partitions, apply this bound to signs of differences between a cell average and its parent
  average. A union bound and a telescoping identity then control all spatial scales.
  Applied to a product of two local zero-sum spin tests in different replicas,
  it forces the expectation of that product to vanish in every equilibrium state of the replicated system:
  finite-volume restrictions of such a state have relative entropy per site tending to zero with respect to the
  product Gibbs state.

Obtaining (1.7) is the spatial part of the proof. Sections 2–Section 4 use exchange cycles and a field of strength
  $b_R$ in a perpendicular direction to bound $R^(- 5 \/ 2) V^(- 1) chevron.l D_f^2
  chevron.r_(b_R)$ by a negative power of $R$. The field gives a killed one-particle kernel an invertible
  resolvent. A sparse-pin estimate controls the holes left after exposing unpinned cycles;
  a comparison on this random set then uses the zero sum of $f$ in each cell.
  Section 5 turns the resulting variance bound into (1.7) through a zero-free complex strip.

The remaining argument identifies the magnitude. Negative squares of large-box magnetization averages would
  distinguish states of different lengths, but the corresponding perturbed Gibbs operators do not directly fit the
  exchange zero-freeness argument. Section 7 realizes these perturbations as first-order averages of random
  products of real matrices acting on the $2 S$ spin-$1 / 2$ slots representing each site.
  Let $Z \( z \)$ be the normalized trace of such a product with complex field $z$.
  For every realization, $Z \( z \)$ is nonzero on $"Re" z > 0$.
  Shared Gaussian variables couple its moments to replicated pressures;
  the zero-sum cross terms just described disappear from their pressure derivatives.
  Moment bounds then select harmonic limits of normalized $log \| Z \( z \) \|$.
  Analyticity of their restrictions to the real axis excludes coexistence of different ergodic magnetization
  lengths. More concretely, an ergodic state of length $a$, oriented along the auxiliary field,
  contributes the affine function $x a - a^2$ to a limiting pressure tangent.
  Large positive $x$ selects the branch $x m - m^2$; analytic continuation of that branch cannot dominate a
  competing branch of smaller length at every positive $x$.
  The spatial estimate, the replica argument, and the passage from random zero-free functions to harmonic pressure
  tangents are the main additional constructions of this paper.

=== 1.4 Conventions <subsec:conventions>

We suppress $S$ in expectations and usually suppress $beta \, L$ when no confusion is possible.
  Write $X \, Y \, Z$ for the site spin components $1 \, 2 \, 3$, in the standard representation where $X \,
  Z$ are real and $Y$ is imaginary. Set $H_0 = - beta H_(S \, L)$.
  Constants $c \, C$ may depend on the fixed spin and on fixed geometric choices;
  $C_beta$ may also depend on the fixed inverse temperature.
  We first choose a sufficiently large finite $beta$, and only then choose lower thresholds for $L$ and spatial
  scales. All torus volume limits are through even $L$.

The finite exchange inputs are developed in Section 2, and the deterministic lattice estimates imported from the
  companions are stated with their hypotheses where they are used.
  Positivity of $m$ follows directly from our torus sparse-pin estimate in Corollary 11;
  no sharp low-temperature asymptotic is needed. We increase $beta_0 \( S \)$ as needed below.

== 2 Exchange cycles, pins, and zero-free traces <sec:exchange>

The exchange representation gives two finite-dimensional tools for the proof.
  Pinning and exposing cycles turns a return probability into the first moment of a Markov hitting kernel.
  Stability of the same exchange operators also gives zero-free traces after insertion of suitable single-slot
  matrices. We develop both tools here, keeping track of the conditioning in the first and the trace contraction
  in the second.

=== 2.1 Symmetric slots and permutation layers <symmetric-slots-and-permutation-layers>

Put $ell = 2 S$ and let $cal(I) = Lambda_L times { 1 \, dots.h \, ell }$ be the set of $N = ell V$ slots.
  On $\( bb(C)^2 \)^(⊗ cal(I))$ write $s_i^a$ for the Pauli matrices divided by two, and let

$ P_(*) = product_(x in Lambda_L) frac(1, ell !) sum_(pi in frak(S)_ell) cal(U)_(pi \, x) $

be the projection onto the tensor product of the symmetric site subspaces.
  Here $cal(U)_(pi \, x)$ permutes the slots at $x$. On this subspace $S_x^a =
  sum_(i : thin x_i = x) s_i^a$ is the spin-$S$ representation.
  In particular, if compression is needed for an individual slot operator, then

#[#set math.equation(numbering: n => "(2.1)")
 $ P_(*) s_i^a P_(*) = ell^(- 1) S_(x_i)^a P_(*) . $ <eq:compressed-slot>]

For each site bond use all $ell^2$ slot edges above it. On these edges put independent Poisson exchanges of rate
  $1 \/ 2$ during $\[ 0 \, beta \)$, and at the seam from $beta$ to $0$ insert an independent uniform slot
  permutation at every site. Let $pi$ be the resulting permutation of $cal(I)$ and $bb(P)_(upright(b))$ its
  underlying picture law. If $cal(E)$ is the set of slot edges, then

#[#set math.equation(numbering: n => "(2.2)")
 $ e^(H_0) P_(*) = e^(beta \| cal(E) \| \/ 4) bb(E)_(upright(b)) cal(U)_pi \, wide H_0 = -
   beta H_(S \, L) . $ <eq:exchange-operator>]

On the left $H_0$ is lifted to the slot space before compression.
  Indeed, $bold(s)_i dot.op bold(s)_j = 1 / 2 cal(U)_(\( i j \)) - 1 / 4 I$,
  and the mean chronological Poisson product has generator $1 / 2 sum_(e in cal(E)) \( cal(U)_e - I \)$.
  The all-slot sum above each bond commutes with $P_(*)$, while the seam average inserts $P_(*)$.
  This proves (2.2). This is Tóth’s exchange representation #cite(label("Toth1993")),
  with the higher-spin construction of Nachtergaele #cite(label("Nachtergaele1994")) Section 2.2;
  see also #cite(label("BL")) Proposition 2.1.

If $A$ is a polynomial in the physical site spins, let $hat(A)$ be its slot lift obtained by replacing $S_x^a$ by
  $sum_(i : thin x_i = x) s_i^a$. The physical trace is then

#[#set math.equation(numbering: n => "(2.3)")
 $ "Tr"_(upright("phys")) \( A e^(H_0) \) = "Tr"_(upright("slot")) \( hat(A) e^(H_0) P_(*) \) .
   $ <eq:physical-slot-trace>]

Following lines through repetitions of one sampled picture gives its cycles.
  In this slot trace with diagonal spin insertions a cycle has a constant up or down color.
  Without insertions its contribution is two. We take slot-time points immediately after an instantaneous
  operation, including the seam. In finite volume there are almost surely finitely many marks,
  with distinct times avoiding any prescribed finite set of cuts.

We call a permutation law on a finite set #emph[admissible] if it is a distributional limit of finite products of
  independent Bernoulli transpositions and deterministic permutations.
  Products here are ordered; no commutation is assumed. This class includes finite-time Poisson exchanges at
  arbitrary nonnegative rates, uniform permutations on specified subsets,
  and independent compositions of these operations. For the Poisson assertion,
  divide time into small intervals and apply each edge’s Bernoulli indicator of at least one mark in a fixed
  order. The approximation agrees with the picture unless an interval contains at least two marks,
  whose probability tends to zero. For a uniform permutation,
  run positive-rate exchanges on every pair of the given subset and let time tend to infinity.
  This irreducible random walk on the finite permutation group converges to its uniform invariant law.

We use the following finite stability facts. A nonzero polynomial is #emph[stable] if it does not vanish when all
  variables have positive imaginary parts. For every admissible law of a permutation $pi$ of a finite set $I$,

#[#set math.equation(numbering: n => "(2.4)")
 $ bb(E) product_(i in I) \( u_i + v_(pi \( i \)) \) quad upright("is stable") . $ <eq:stable-permutation-symbol>]

Identification of variables preserves stability; differentiation, real specialization,
  and bounded-degree coefficientwise limits preserve it up to the zero polynomial.
  Finally, if a random subset $A subset.eq I$ has a stable generating polynomial $G_A \( bold(z) \) =
  bb(E) product_(j in A) z_j$, then for every $J subset.eq I$,

#[#set math.equation(numbering: n => "(2.5)")
 $ Pr \( J subset.eq A \) lt.eq product_(j in J) Pr \( j in A \) . $ <eq:stable-presence>]

These are the partial-symmetrization and negative-dependence facts in #cite(label("BBL2009")) Theorems 4.20
  and 4.9; the exact finite formulations and their elementary proofs appear in #cite(label("Ord")) Lemmas 3.2–3.6.
  In particular, the facts apply on a disjoint union of time layers, without any spatial assumptions.

=== 2.2 Pins and exposure <pins-and-exposure>

The finite constructions in this subsection allow independent Poisson exchanges on an arbitrary finite slot graph,
  together with finitely many prescribed deterministic permutations, Bernoulli transpositions,
  and uniform permutations on prescribed subsets at fixed times.
  All random operations are independent under the base law.
  Their order at coincident prescribed times is fixed, and a slot-time point at such a time lies after the entire
  ordered bundle of operations. Thus extra stationary lines and extra instantaneous exchanges are included.

A #emph[pin] is a specified slot-time point required to have up color.
  For a finite deterministic pin set $E$, let $n_E$ be the number of cycles avoiding $E$,
  let $cal(B)_E$ be their union, and define

#[#set math.equation(numbering: n => "(2.6)")
 $ cal(Z)_E = bb(E)_(upright(b)) 2^(n_E) \, wide bb(P)_E \( d omega \) =
   cal(Z)_E^(- 1) 2^(n_E \( omega \)) bb(P)_(upright(b)) \( d omega \) . $ <eq:pin-law>]

Cycles meeting pins are up; the others are colored independently and fairly.
  For a nonempty single-time set $T$ disjoint from $E$, put $P =
  E union T$ and let $sigma$ take each pin in $P$ to the next pin on its directed cycle,
  at strictly positive elapsed time. Set

#[#set math.equation(numbering: n => "(2.7)")
 $ r \( E \, T \) = frac(1, \| T \|) sum_(i in T) bb(P)_P { sigma \( i \) in T } . $ <eq:pin-return>]

The same sampled picture is repeated in defining $sigma$.

To describe exposure, label lines at time zero and reveal all labels on cycles missing $P$,
  their trajectories through a period, and all their endpoint images.
  The trajectories record their positions before and after each elementary operation,
  including intermediate stages of an ordered bundle at one time. Denote these data by $upright(bold(a))$.
  The slots not occupied by exposed labels are called #emph[holes].
  For fixed exposure, define a fresh law $bb(Q)_(upright(bold(a)))$ on the holes as follows.
  Exchanges whose two endpoints are holes have their original independent Poisson clocks.
  At a transposition exchanging an exposed label with a hole, that hole moves into the vacated slot.
  These forced transports are deterministic bijections between successive hole layers.
  A partly revealed uniform permutation is completed by a uniform bijection between the remaining source and
  target slots; a prescribed deterministic permutation restricts to a deterministic bijection between those hole
  layers. An elementary Bernoulli transposition touching an exposed label has its outcome revealed;
  one touching only holes retains its independent Bernoulli law.
  Let $G_P$ denote the event that every cycle of this fresh picture meets $P$.

#thm([Lemma 2.1.])[
  (Finite pin inputs).  #emph[For the finite picture above the following assertions hold.]
  + #emph[For every finite $E$ and nonempty single-time $T$ disjoint from $E$,
#[#set math.equation(numbering: n => "(2.8)")
 $ bb(P)_E \( T subset.eq cal(B)_E \) lt.eq \( 2 r \( E \, T \) \)^(\| T \|) . $ <eq:simultaneous-pin>]

]
  + #emph[Almost surely under $bb(P)_P$, $g_P \( upright(bold(a)) \) := bb(Q)_(upright(bold(a))) \( G_P \) > 0$,
    and the conditional law of the remaining picture is $bb(Q)_(upright(bold(a))) \( thin dot.op divides G_P \)$.]
  + #emph[Let $omega_(upright(m))$ be the Poisson mark counting measure and let $lambda_(upright(b))$ be edge rate
    times Lebesgue time measure. For every integer $j gt.eq 1$ and nonnegative measurable function $F$ of $j$ mark
    locations,
#[#set math.equation(numbering: n => "(2.9)")
 $ bb(E)_E sum_(\( u_1 \, dots.h \, u_j \) in omega_(upright(m \, eq.not))^j) F \( u_1 \, dots.h \, u_j \) lt.eq
   2^j integral F thin d lambda_(upright(b))^(⊗ j) . $ <eq:factorial-domination>]

 The sum is over ordered distinct marks, and may be restricted to any prescribed time order.
   Independent additional fresh Poisson clocks may be included with their own, undoubled, factorial intensity.]
] <lem:pin-inputs>

#proof[
  The statements are the finite-pin forms of #cite(label("BL")) Proposition 2.4, Proposition 2.5, and Lemma 2.3.
    We give the arguments to specify the scope of the extra operations and the measure used after exposure.
  Cut at all pin times and at zero, and let $cal(V)$ be the disjoint union of the slot layers at these cuts.
    The maps between successive cuts are independent admissible bijections.
    Their symbols in disjoint input and output variables multiply to give a stable polynomial $bb(E)_(upright(b))
    product_(i in cal(V)) \( x_i + y_(pi \( i \)) \)$. Delete a nonpin $q$ by setting $x_q = y_q =
    t$ and extracting the coefficient of $t$. If its predecessor and successor are $i \, j$,
    then $\( x_i + t \) \( t + y_j \)$ is replaced by $x_i + y_j$.
    A fixed point instead contributes $2 t$, hence a factor two.
    Successive deletion therefore gives the nonzero stable polynomial
  $ bb(E)_(upright(b)) [2^(n_P) product_(i in P) \( x_i + y_(sigma \( i \)) \)] . $
  Differentiate in the input variables indexed by $P \\ T$, set all input variables to zero,
    and divide by $cal(Z)_P$. The result is $bb(E)_P product_(i in T) y_(sigma \( i \))$,
    the stable generating polynomial of the subset $sigma \( T \)$.
    By (2.5) and the arithmetic–geometric mean inequality,
  $ bb(P)_P { sigma \( T \) = T } lt.eq product_(j in T) bb(P)_P { j in sigma \( T \) } lt.eq
    r \( E \, T \)^(\| T \|) . $
  Here $sum_(j in T) bb(P)_P { j in sigma \( T \) } = \| T \| r \( E \, T \)$ by bijectivity.
    The event $sigma \( T \) = T$ is precisely $T subset.eq cal(B)_E$:
    iterating the next-pin permutation from $T$ then meets no pin in $E$.
    Finally, $2^(n_P) lt.eq 2^(n_E) lt.eq 2^(\| T \|) 2^(n_P)$ and $cal(Z)_E gt.eq cal(Z)_P$, proving (i).
  For (ii), first fix a proposed set $A$ of initial exposed labels.
    Use two independent Poisson clock families on every edge, each with the original rate:
    accept the first family’s clock when an endpoint contains an $A$-label and the second when neither does.
    This realizes the base process. Given the past, the superposed clock has twice the total original rate,
    each edge is accepted with its original relative rate, and the rejection probability is $1 \/ 2$.
    The $A$-label paths use only the first family. Given these paths,
    the second family restricted to the hole intervals remains fresh.
    Revealing the $A$-label images at a uniform permutation leaves a uniform residual bijection.
    At a Bernoulli transposition its outcome is revealed exactly when an exposed label is involved;
    other outcomes remain independent. This constructs $bb(Q)_(upright(bold(a)))$.
  More explicitly, let $mu_A$ be the base law of the paths and endpoint images of the proposed labels.
    Let $F_A$ mean that those paths avoid $P$ and close on $A$, and let $c_A$ count their cycles on this event.
    For every bounded measurable function $Phi$ of the exposure and remaining picture,
  #[#set math.equation(numbering: n => "(2.10)")
   $ bb(E)_P Phi = cal(Z)_P^(- 1) sum_A integral_(F_A) 2^(c_A \( upright(bold(a)) \))
     bb(E)_(bb(Q)_(upright(bold(a)))) \[ upright(bold(1))_(G_P) Phi \] thin mu_A \( d upright(bold(a)) \) .
     $ <eq:exposure-branches>]
  Each full picture occurs in exactly one branch, namely its set of labels on cycles missing $P$.
    The exposure marginal on that branch is therefore $cal(Z)_P^(- 1) 2^(c_A) g_P thin mu_A$ restricted to $F_A$.
    It assigns zero mass to $g_P = 0$, and division by $g_P$ proves (ii).
    In particular the exposure marginal includes the all-hit probability $g_P$;
    it is not the unweighted law of the proposed histories.
  For (iii), inserting one transposition joins two cycles or splits one.
    It increases the number of cycles missing the fixed pins by at most one,
    and so multiplies the weight by at most two, regardless of the other instantaneous operations.
    The Poisson insertion formula for $j$ ordered distinct marks, followed by division by $cal(Z)_E$, gives (2.9).
    Independent fresh clocks have their ordinary factorial measure, proving the last assertion. ◻
]

=== 2.3 The conditional next-pin first moment <the-conditional-next-pin-first-moment>

The conditioning in Lemma 2(ii) couples entire cycles. The next result explains exactly why its next-pin first
  moment can nevertheless be computed by a walk with fresh transitions.
  Matrices in this subsection use the column-forward convention: $Pi e_i = e_(pi \( i \))$.

#thm([Lemma 2.2.])[
  (Conditional next-pin kernel).  #emph[Let $Pi$ have an admissible permutation law on a finite set $cal(V) =
    I union.sq D$, and put $K = bb(E) Pi$. Let $G_I$ be the event that every permutation cycle meets $I$.
    On $G_I$, let $Sigma$ be the permutation matrix on $I$ taking each pin to its next positive visit to $I$. Then
#[#set math.equation(numbering: n => "(2.11)")
 $ Pr \( G_I \) = det \( I_D - K_(D D) \) . $ <eq:all-hit>]

 For every complex matrix $W$ on $I$, there is the polynomial identity
#[#set math.equation(numbering: n => "(2.12)")
 $ bb(E) \[ upright(bold(1))_(G_I) det \( I_I - W Sigma \) \] =
   det mat(delim: "(", I_I - W K_(I I), - W K_(I D); - K_(D I), I_D - K_(D D)) . $ <eq:next-pin-determinant>]

 If $Pr \( G_I \) > 0$ and $I eq.not diameter$, then $K_(D D)$ is transient and
#[#set math.equation(numbering: n => "(2.13)")
 $ bb(E) \[ Sigma divides G_I \] = K_(I I) + K_(I D) \( I_D - K_(D D) \)^(- 1) K_(D I) . $ <eq:next-pin-mean>]

 This is the first positive hitting kernel of $I$ for the Markov chain with independent transitions $K$.
   Empty determinants are one and empty correction terms are zero.
   In particular (2.12), and its linear coefficients in $W$, remain valid when the all-hit probability is zero.]
] <lem:next-pin>

#proof[
  We reproduce the finite argument in #cite(label("BL")) Lemma 2.6 and Proposition 2.7,
    equivalently #cite(label("Ord")) Lemma 4.2 and Proposition 4.3.
    Write $and.big^k M$ for the action of $M$ on alternating $k$-tensors;
    its entries are the $k$-rowed minors of $M$. For $0 lt.eq k lt.eq \| cal(V) \|$, exterior powers satisfy
  #[#set math.equation(numbering: n => "(2.14)")
   $ bb(E) and.big^k Pi = and.big^k K . $ <eq:exterior-moments>]
  Indeed, for a transposition $T_(i j)$, $T_(i j) - I = - \( e_i - e_j \) \( e_i - e_j \)^(*)$ has rank one.
    Every minor of $I + u \( T_(i j) - I \)$ is affine in $u$,
    so its exterior power is the mean exterior power of a Bernoulli transposition of probability $u$.
    Independence and multiplicativity of exterior powers extend this identity to products;
    continuity of minors extends it to their limits.
  For any fixed matrix $B$, the principal-minor expansion now gives
  #[#set math.equation(numbering: n => "(2.15)")
   $ bb(E) det \( I - B Pi \) = sum_k \( - 1 \)^k "Tr" [\( and.big^k B \) bb(E) and.big^k Pi] =
     det \( I - B K \) . $ <eq:det-mean>]
  Take $B = "diag" \( W \, I_D \)$. If a permutation cycle is contained in $D$,
    its indicator is a fixed vector of $B Pi$, making the determinant zero.
    Otherwise $Pi_(D D)$ is nilpotent, and elimination of this block follows the successive nonpins on each cycle.
    It yields $det \( I - B Pi \) = det \( I_I - W Sigma \)$.
    This proves (2.12); setting $W = 0$ proves (2.11) without any invertibility assumption.
  When the determinant is positive, take its Schur complement in (2.12).
    Replace $W$ by $t W$ and compare linear coefficients, using $det \( I - t W A \) = 1 - t "Tr" \( W A \) +
    O \( t^2 \)$. Since $W$ is arbitrary, the resulting trace identities recover every entry in (2.13).
    The nonnegative matrix $K_(D D)$ is substochastic. Its spectral radius is at most one; if it were one,
    the Perron eigenvalue would make $I_D - K_(D D)$ singular. Consequently
  $ \( I_D - K_(D D) \)^(- 1) = sum_(n gt.eq 0) K_(D D)^n . $
  The term $K_(I I)$ is a direct hit, and $K_(I D) K_(D D)^n K_(D I)$ is a hit after $n +
    1$ intervening states in $D$. This proves the Markov interpretation. ◻
]

Apply the lemma at a fixed exposure by cutting at all pin times and at the finitely many prescribed changes in
  hole sets. Identify the hole layers, which have equal cardinality.
  The unconditioned interval maps are independent admissible bijections;
  their direct sum followed by the cyclic shift of the layers is an admissible permutation of the layered set.
  Its mean matrix gives the hole walk: jumps at the original edge rates ($1 \/ 2$ for physical edges),
  prescribed deterministic restrictions and forced transports,
  fresh residual uniform choices at each prescribed uniform operation (including the seam),
  and fresh hole-only Bernoulli outcomes. Repeat this environment periodically,
  making independent transition choices on every passage, including later passages through the same physical time
  interval. If $tau_T^(+)$ is the first positive visit to $T$ and $tau_E$ the first visit to $E$, then

#[#set math.equation(numbering: n => "(2.16)")
 $ \| T \| r \( E \, T \) =
   bb(E)_P sum_(i in T) Pr_(upright(bold(a)) \, i)^(upright("walk")) \( tau_T^(+) < tau_E \) .
   $ <eq:fresh-return-identity>]

This follows by Lemma 3 under $bb(Q)_(upright(bold(a))) \( thin dot.op divides G_P \)$ and then Lemma 2(ii).
  The identity concerns a conditional first moment. The original repeated permutation paths retain their cycle
  dependence; it is the determinant identity that replaces their next-pin mean by fresh Markov transitions.

=== 2.4 Disk contractions and trace zero-freeness <disk-contractions-and-trace-zero-freeness>

We next use (2.4) for complex matrix insertions. In any common qubit basis the polynomial of a permutation layer,
  evaluated between input kets $\( 1 \, x_i \)^T$ and algebraic output covectors $\( 1 \, y_i \)$,
  without complex conjugation, is

#[#set math.equation(numbering: n => "(2.17)")
 $ bb(E) product_i \( 1 + x_i y_(pi \( i \)) \) . $ <eq:disk-symbol>]

It has no zeros when all $\| x_i \| \, \| y_i \| < 1$. To see this, substitute

$ u_i = i frac(1 + x_i, 1 - x_i) \, wide v_j = i frac(1 - y_j, 1 + y_j) $

in (2.4). Both families are in the upper half-plane, and $u_i + v_(pi \( i \)) =
  2 i \( 1 + x_i y_(pi \( i \)) \) \/ \[ \( 1 - x_i \) \( 1 + y_(pi \( i \)) \) \]$;
  the product of denominators is independent of $pi$.

#thm([Lemma 2.3.])[
  (Zero-free layered traces).  #emph[On finitely many qubit slots,
    take a finite cyclic product of permutation layers and tensor products of single-slot matrices,
    with at least one permutation layer. Each permutation layer is a nonzero scalar times the mean permutation
    operator of an admissible law. Between every two successive permutation layers,
    suppose that the single-slot matrix on every slot induces a projective map
$ \( 1 \, x \)^T mapsto a \( x \) \( 1 \, phi.alt \( x \) \)^T $

 with $a \( x \) eq.not 0$ and $\| phi.alt \( x \) \| < 1$ for all $\| x \| lt.eq 1$.
   Then the trace of the cyclic product is nonzero.]
] <lem:trace-zero-free>

#proof[
  Ignore the nonzero scalar factors. Group each single-slot layer with the following permutation layer.
    By compactness, its slot maps send $\| x \| < 1 + epsilon$ into $\| phi.alt \( x \) \| < 1$,
    with nonvanishing $a \( x \)$, for some common $epsilon > 0$.
    Thus its multiaffine matrix polynomial is nonzero for $\| x_i \| < 1 + epsilon$ and $\| y_i \| < 1$,
    by (2.17). Multiply the layer polynomials in disjoint variables.
  The trace is obtained by contracting each output variable with the input variable on the matching slot of the
    next layer. Such a contraction acts on a bivariate section by
  #[#set math.equation(numbering: n => "(2.18)")
   $ A + B x + C y + D x y mapsto A + D . $ <eq:trace-contraction>]
  To verify preservation of nonvanishing, fix all other variables in their prescribed disks.
    Choose $r_x < 1 + epsilon$ and $r_y < 1$ with $r_x r_y > 1$, and set $x = r_x z$, $y = r_y z$.
    The resulting polynomial has no zero in $\| z \| < 1$ and has nonzero constant term $A$.
    If its quadratic coefficient is nonzero, the product of its two roots has modulus at least one,
    giving $\| D \| r_x r_y lt.eq \| A \|$. If it has degree at most one, $D = 0$.
    In either case $\| D \| < \| A \|$ whenever $D eq.not 0$, so $A + D eq.not 0$.
    After each contraction the polynomial stays multiaffine and nonzero on the product of the remaining disks.
    Contracting all pairs proves the claim. This is a disk form of the contraction method of Asano and Ruelle
    #cite(label("Asano1970")) #cite(label("Ruelle1971")), applied here to the complete cyclic trace. ◻
]

Choose now the $s^2$ eigenbasis with vectors $\( 1 \, plus.minus i \)^T \/ sqrt(2)$ in the $s^3$ coordinates.
  The following three slot maps will cover both the field comparison and the later pressure argument.

#thm([Lemma 2.4.])[
  (Single-slot maps).  #emph[In this basis, matrices in $S L_2 \( bb(R) \)$, real in the $s^3$ coordinates,
    act by automorphisms of the unit disk. If $"Re" z > 0$, the matrix $e^(z s^2)$ sends the closed disk strictly
    into the open disk. There are absolute constants $b_(*) \, a_0 > 0$ such that, whenever $0 < b lt.eq b_(*)$,
    $f in \[ - 1 \, 1 \]$, and $\| "Im" z \| < a_0$, the matrix
#[#set math.equation(numbering: n => "(2.19)")
 $ e^(b s^2 \/ 2) thin e^(b z f s^3) thin e^(b s^2 \/ 2) $ <eq:strip-slot-map>]

 also sends the closed disk strictly into the open disk, with its projective coordinate defined throughout the
   closed disk.]
] <lem:strip-maps>

#proof[
  The projective coordinate in the $s^3$ basis is $zeta = i \( 1 - x \) \/ \( 1 + x \)$.
    It identifies the unit disk with the upper half-plane. A real determinant-one matrix acts there by an
    upper-half-plane automorphism, proving the first assertion.
    In the $s^2$ basis $e^(z s^2)$ acts by $x mapsto e^(- z) x$, proving the second.
  For the last assertion, the rightmost factor first gives $\| x \| lt.eq r = e^(- b \/ 2)$.
    Its upper-half-plane image satisfies
  $ sin \( arg zeta \) = frac("Im" zeta, \| zeta \|) = frac(1 - \| x \|^2, \| 1 - x \| thin \| 1 + x \|) gt.eq
    frac(1 - r^2, 1 + r^2) = tanh \( b \/ 2 \) . $
  For $0 < b lt.eq b_(*)$, this is at least $c b$ with an absolute $c > 0$.
    Thus $arg zeta$ stays at angular distance at least $c b$ from both $0$ and $pi$.
    The middle factor sends $zeta$ to $e^(- b z f) zeta$, changing its argument by at most $b \| "Im" z \|$.
    Choose $a_0 < c$; the image is still in the upper half-plane.
    The final factor shrinks the resulting disk coordinate by $e^(- b \/ 2)$.
    None of these maps has a pole on the compact set being mapped, proving the stated strictness and definedness. ◻
]

The next section uses a small positive field to supply pins.
  The finite identities proved here reduce uniform bounds on their avoidance to estimates for the corresponding
  hole walk.

== 3 Sparse pins on the torus <sec:sparse-pins>

We now show that a sparse collection of prescribed slot points is unlikely to lie on cycles avoiding the field
  pins. This will supply the geometric control of available slots used in Section 4.
  The induction follows the pinned-boundary argument of #cite(label("BL")) Section 4,
  itself developed from #cite(label("Ord")) Sections 5 and 7. On the torus there is no pinned boundary:
  a small uniform field supplies the killing, and cutting off flows to infinity leaves an error that this killing
  must absorb.

=== 3.1 Soft pins and the ghost representation <soft-pins-and-the-ghost-representation>

Rotate coordinates so that the field selects the up color.
  If $q in \( 0 \, 1 \)$, $w = 1 - q = e^(- b)$, its single-slot factor, after removing a scalar, is

#[#set math.equation(numbering: n => "(3.1)")
 $ "diag" \( 1 \, w \) = w I + q P_(upright("up")) . $ <eq:soft-pin-factor>]

Thus we may independently select a pin on each real slot at the cut with probability $q$,
  and then weight the exchange picture by $2^c$, where $c$ counts the cycles missing all pins.
  Pinned cycles have the up color; the other cycles receive independent fair colors.
  Expanding (3.1) proves that the resulting spin law is the Gibbs law with exponent $H_0 + b sum_x Y_x$,
  after rotating the up axis back to $Y$.

For the induction we need a fixed pin set. Add one stationary #emph[ghost slot] for each real slot,
  pin each ghost at time $beta \/ 2$, and, just after the seam at time zero,
  independently transpose each real slot with its ghost with probability $q$.
  The time-zero layer is taken after these switches. A selected switch inserts the corresponding ghost line into
  the real cycle; that cycle then contains a ghost pin. An unselected ghost remains a separate pinned cycle and
  contributes weight one. Consequently every switch configuration has exactly the weight of the corresponding
  soft-pin configuration. This remains true with any finite set of deterministic pins on real slot points.
  Figure 1 illustrates the two cases.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((1.3, 3.25), [#text(size: 9pt)[no switch]])
  line((0.4, 0.4), (0.4, 2.5), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.2, 0.4), (2.2, 2.5), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((0.4, 2.5), [#text(size: 9pt)[real]], anchor: "south", padding: 0.1176cm)
  content((2.2, 2.5), [#text(size: 9pt)[ghost]], anchor: "south", padding: 0.1176cm)
  circle((2.2, 1.45), radius: 0.08819, fill: black, stroke: none)
  content((2.2, 1.45), [#text(size: 9pt)[pin]], anchor: "west", padding: 0.1176cm)
  content((0.35, 0.4), [#text(size: 9pt)[$0^+$]], anchor: "east", padding: 0.1176cm)
  content((0.35, 2.3), [#text(size: 9pt)[$beta^-$]], anchor: "east", padding: 0.1176cm)
  content((6.6, 3.25), [#text(size: 9pt)[switch]])
  line((5.7, 0.4), (5.7, 2.5), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((7.5, 0.4), (7.5, 2.5), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((5.7, 2.5), [#text(size: 9pt)[real]], anchor: "south", padding: 0.1176cm)
  content((7.5, 2.5), [#text(size: 9pt)[ghost]], anchor: "south", padding: 0.1176cm)
  circle((7.5, 1.45), radius: 0.08819, fill: black, stroke: none)
  content((7.5, 1.45), [#text(size: 9pt)[pin]], anchor: "west", padding: 0.1176cm)
  content((5.65, 0.4), [#text(size: 9pt)[$0^+$]], anchor: "east", padding: 0.1176cm)
  content((5.65, 2.3), [#text(size: 9pt)[$beta^-$]], anchor: "east", padding: 0.1176cm)
  line((0.4, 0.4), (0.4, 0.05), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((2.2, 0.4), (2.2, 0.05), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((1.3, -0.3), [#text(size: 9pt)[base weight $w$]])
  line((5.7, 0.05), (7.5, 0.4), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((7.5, 0.05), (5.7, 0.4), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((6.6, -0.3), [#text(size: 9pt)[base weight $q$]])
})],
  caption: [Figure 1: One real slot and its stationary ghost, shown on a cut-open time circle. An absent switch leaves the ghost as a separate pinned cycle. A present switch inserts its pinned line into the real cycle. In the unconditioned fresh real-hole traversal killed on entry into a ghost, passage through this layer survives with probability $w = 1 - q$. The rest of the real exchange picture is suppressed. ],
) <fig:sparse-ghost>

Let $E$ denote all the ghost pins together with any finite set of deterministic real-slot pins.
  We write $bb(P)_E$ for the normalized picture law with density proportional to $2^(c_E)$,
  and $cal(B)_E$ for the slot-time points on cycles missing $E$. These cycles contain only real slots.
  At coincident prescribed operations, a slot point means the point just after the entire ordered bundle,
  as in Section 2. Distances between sites are wrapped supremum distances, denoted $d_L$;
  balls are denoted by $B_h \( z \)$.

Fix $alpha = 1 \/ 100$ and a sufficiently large constant $C_s gt.eq 6$.
  A finite collection of real slot points is #emph[sparse] if its site coordinates, counted with multiplicity, satisfy

#[#set math.equation(numbering: n => "(3.2)")
 $ \# { i : x_i in B_h \( z \) } lt.eq C_s \( 1 + h \)^alpha wide \( z in Lambda_L \, med h gt.eq 0 \) .
   $ <eq:torus-sparse>]

The same definition applies to lists of centers. In particular, different slots at the same site count separately.
  The freedom to choose $C_s$ large will permit the finite collections of nearby test points used in Section 4.

#thm([Proposition 3.1.])[
  (Sparse-pin bound).  #emph[Fix $S$ and $C_s$. There is $beta_0 < oo$ such that, for every fixed $beta gt.eq
    beta_0$, there is $L_(*) \( beta \) < oo$ with the following property.
    For every even $L gt.eq L_(*) \( beta \)$, every $q$ satisfying $L^(- 5 \/ 2) lt.eq q < 1$,
    every pin set $E$ as above, and every sparse set $T$ of real slot points at one deterministic time,
#[#set math.equation(numbering: n => "(3.3)")
 $ bb(P)_E \( T subset.eq cal(B)_E \) lt.eq p^(\| T \|) \, wide p = beta^(- 9 \/ 10) . $ <eq:sparse-pins>]

 The constants and thresholds are independent of the number, locations, and times of the extra pins.]
] <prop:sparse-pins>

The proof is a finite downward induction on deterministic pins.
  Its larger-pin hypothesis gives regular hole graphs; diffusion and a flow-energy estimate then make next-pin
  returns rare enough to remove the test pins by Lemma 2.

If $T$ is empty the assertion is immediate; if it meets $E$, the event is impossible.
  We henceforth consider nonempty $T ∩ E = diameter$, put $P = E union T$,
  and expose the cycles missing $P$ under $bb(P)_P$. All other slot points are called #emph[holes].
  Lemmas 2 and 3 apply to this enlarged picture. Here are the details concerning ghosts.

For any proposed set of exposed time-zero real labels, reveal its trajectories, its seam images,
  and the switch outcomes encountered by those trajectories.
  Closure into cycles avoiding $P$ requires every such switch to be absent.
  Separate Poisson clocks according to whether they touch the currently exposed labels,
  as in the exposure disintegration of Lemma 2. Conditional on the revealed histories,
  the unused clocks are fresh on pairs of holes; the remaining seam images are uniform completions within each
  site; and switches on the other real–ghost pairs are still independent Bernoulli switches.
  When an exposed label jumps through a hole, that hole is transported in the opposite direction.
  A mark between two exposed labels does not move a hole. Requiring these to be all the missing cycles conditions
  the fresh picture on every remaining cycle meeting $P$. The exposed cycles contribute only their fixed factor
  $2^(c_P)$; therefore this description gives the conditional law, including its all-hit conditioning.
  That conditioning has positive probability at almost every exposure.

Every ghost is a hole and is pinned. Missing real cycles never use a switch,
  so the number of real holes is constant in time. The seam does not change their number at any site.
  In particular the factorial-mark estimate in Lemma 2 remains valid:
  inserting a real-edge transposition changes the number of missing cycles by at most one,
  even in the presence of switches.

By Lemma 3, conditional next-pin probabilities are first-hit probabilities for the unconditioned fresh walk,
  with fresh transitions on each repeated traversal. Delete the other real-pin stops and kill that walk on
  entering a ghost. This only increases the probability that its next pin belongs to $T$:
  after entering a ghost, the walk encounters its pin before its next opportunity to return to a real slot.
  The one-turn real-hole kernel at the time of $T$ is

#[#set math.equation(numbering: n => "(3.4)")
 $ U = w K \, wide U_(+) = U \, quad U_(-) = U^(*) \, quad Q = 1 / 2 \( U + U^(*) \) \, wide E_y =
   chevron.l y \, \( I - Q \) y chevron.r gt.eq q lr(bar.v.double y bar.v.double)_2^2 . $ <eq:ghost-mass>]

Here and throughout this section matrices are column-forward. The matrix $K$ is doubly stochastic:
  its factors are symmetric hole-walk heat kernels, forced transport bijections,
  and uniform remaining seam completions. Exactly one switch layer is crossed per turn,
  and its real-to-real mean is $w I$, which proves $U = w K$.
  All factors, their adjoints, and spatially killed versions contract counting $1$-, $2$-, and supremum norms.
  For example, a nonnegative matrix whose row and column sums are at most one satisfies $sum_i \| \( A v \)_i \|^2
  lt.eq sum_(i \, j) A_(i j) \| v_j \|^2 lt.eq lr(bar.v.double  bar.v.double) v_2^2$.
  This also proves the last inequality in (3.4).

=== 3.2 The deterministic geometric input <the-deterministic-geometric-input>

We state precisely the infinite-lattice results that will be transferred to the torus.
  An available-slot graph on $bb(Z)^3$ has between zero and $ell$ slots at each site,
  all $ell$ slots outside a finite set, and all pairs of available slots joined across every nearest-neighbor site
  bond. A site with no available slot is #emph[blocked]. Join blocked sites at supremum distance at most eight and
  write $cal(C) \( w \)$ for the component of a blocked site $w$. Fix $nu = 1 \/ 300$.
  The constants $M_(*)$ and $A_0$ below depend only on this lattice geometry and $ell$.

A graph is #emph[regular at $z$ with radius $A gt.eq A_0$] if

+ every ball $B_(M_(*)) \( v \)$, with $v in B_(11 A) \( z \)$, contains fewer than six blocked sites;
+ each blocked $w in.not B_(10 A) \( z \)$ satisfies $max_(v in cal(C) \( w \)) \| v -
  w \|_oo lt.eq \( 1 + \| w - z \|_oo \)^nu$.

The anchor itself need not have an available slot. One may take $M_(*) gt.eq max { 48 \, rho \( 3 \, 44 \) + 2 }$,
  where the local-connectivity radius $rho \( 3 \, 44 \)$ has the following property:
  two unblocked sites at distance at most 44 can be joined inside $B_(rho \( 3 \, 44 \))$ about the first site if
  that ball contains fewer than six blocked sites. The path has length at most $\( 2 rho \( 3 \, 44 \) + 1 \)^3$.
  This is #cite(label("Ord")) Lemma 5.5 and Equation (5.13); regularity is #cite(label("BL")) Definition 3.2,
  equivalently #cite(label("Ord")) Definition 5.3. Take $A_0 gt.eq M_(*) +
  47$ large enough for the following two conclusions.

#thm([Lemma 3.2.])[
  (Lattice Nash inequality and unit flows).  #emph[In an available-slot graph regular at $z$ with radius $A gt.eq
    A_0$, put
$ cal(D) \( v \) = 1 / 2 sum_({ i \, j } upright(" available edge")) \( v_i - v_j \)^2 . $

 Every nonnegative $v$ supported over $B_A \( z \)$ satisfies
#[#set math.equation(numbering: n => "(3.5)")
 $ lr(bar.v.double  bar.v.double) v_2^(10 \/ 3) lt.eq C cal(D) \( v \) lr(bar.v.double  bar.v.double)
   v_1^(4 \/ 3) . $ <eq:local-nash>]

 For every available slot $a$ at $y in B_A \( z \)$, there exists an oriented edge flow $F_a$,
   with divergence defined as outgoing minus incoming flow, such that
#[#set math.equation(numbering: n => "(3.6)")
 $ "div" F_a = upright(bold(1))_({ a }) \, wide \| F_a \( e \) \| lt.eq C \( 1 + "dist" \( e \, y \) \)^(- k) \,
   wide k = 2 - 3 nu = 199 \/ 100 . $ <eq:unit-flow>]

 Here $"dist" \( e \, y \)$ is the minimum supremum distance to the two endpoint sites.
   The constants are uniform over the graph, $A$, $z$, and the source.
   Sites with any number of available slots between one and $ell$ are permitted.]
] <lem:lattice-inputs>

These are #cite(label("BL")) Proposition 3.3 and Lemma 3.4;
  the underlying geometric constructions are #cite(label("Ord")) Propositions 5.6 and 6.2.
  Their hypotheses are deterministic and impose no relation between $A$ and a time scale.
  Only these stated conclusions of the infinite-lattice results will be used here.

At a given exposure and physical time, make such a graph for each torus anchor $z$:
  lift the real holes in $B_(floor.l L \/ 4 floor.r) \( z \)$ to $bb(Z)^3$,
  and declare every slot outside this box available. We say the slice is regular at $z$ when this graph is
  regular. We shall use

#[#set math.equation(numbering: n => "(3.7)")
 $ A = ceil.l C_(upright("loc")) beta ceil.r \, wide 11 A + M_(*) < floor.l L \/ 4 floor.r \,
   $ <eq:sparse-localization-radius>]

where $C_(upright("loc"))$ is fixed sufficiently large below.
  Thus the Nash inequality for functions supported in $B_A \( z \)$ uses exactly the torus edges,
  with zero values beyond the support.

=== 3.3 From grid pins to regular slices <from-grid-pins-to-regular-slices>

Choose a finite circular grid $cal(G)$ containing zero, with successive gaps at most $p^12$.
  For a set $P$ of ghost pins and real pins on this grid, let $sans(I) \( P \)$ assert (3.3) under $bb(P)_P$ for
  every sparse test at one grid time. In this subsection we assume $sans(I) \( P \)$.
  This is the hypothesis for a larger pin set in the eventual downward induction;
  no estimate for a smaller pin set is assumed.

At time $t$, write $cal(O)_t$ for the sites without a real hole.
  At a grid time, simultaneous blocking of prescribed sparse sites costs at most $p^n$:
  choose one fixed slot at each site and apply $sans(I) \( P \)$.
  If any chosen slot is pinned, the event is impossible. The same conclusion can therefore be used without
  checking disjointness separately.

#thm([Lemma 3.3.])[
  (Blocking and component tails).  #emph[Under $sans(I) \( P \)$, at any deterministic time $t$,
#[#set math.equation(numbering: n => "(3.8)")
 $ bb(P)_P \( A' subset.eq cal(O)_t \) & lt.eq C p^6 &  & upright("for six prescribed distinct sites") \,\
bb(P)_P \( A' subset.eq cal(O)_t \) & lt.eq \( C sqrt(p) \)^(\| A' \|) &  &
  upright("for a nonempty sparse set of sites") . $ <eq:six-blocking>]

 There are $c \, C \, lambda > 0$, uniform for sufficiently large $beta$,
   such that the blocked component formed with steps of supremum length at most eight satisfies
#[#set math.equation(numbering: n => "(3.9)")
 $ bb(P)_P { z in cal(O)_t \, med max_(v in cal(C)_t \( z \)) d_L \( z \, v \) gt.eq h } lt.eq
   C e^(- c h^lambda) wide \( h gt.eq 1 \) . $ <eq:torus-component-tail>]

 All constants are independent of the grid and its size.]
] <lem:torus-blocking>

#proof[
  Let $s$ be the grid point preceding $t$, with $s = t$ if $t in cal(G)$.
    A site blocked at $t$ either was blocked at $s$, or has an incident real-edge mark in $\( s \, t \]$.
    The seam preserves hole counts at each site; the switch layer also preserves the real-hole set of an exposure,
    as observed above. The union of the stars of six sites has bounded total intensity.
    Factorial domination in Lemma 2 bounds the probability of a mark there by $C p^12$, giving $p^6 + C p^12 lt.eq
    C p^6$.
  For $n$ sparse sites, either at least $ceil.l n \/ 2 ceil.r$ were blocked at $s$,
    costing at most $2^n p^(ceil.l n \/ 2 ceil.r)$, or at least that many have incident marks.
    A mark touches at most two of the selected sites, so the second alternative requires $j =
    ceil.l n \/ 4 ceil.r$ distinct marks. The union of the stars has intensity at most $C n$;
    hence its probability is at most
  $ frac(\( C n p^12 \)^j, j !) lt.eq \( C' p^12 \)^j \, $
  using $j ! gt.eq \( j \/ e \)^j$ and $n \/ j lt.eq 4$. Enlarging the constant gives (3.8),
    without an independence assumption between the two alternatives.
  For the component tail, fix an integer $a > 100$ so large that $a^alpha > 4$, and set $h_j = 16 a^j$.
    A blocked path from $z$ to wrapped distance $h_j$ yields two smaller crossings:
    the first starts at $z$, and the second at the first path site at distance at least $h_j \/ 2$ from $z$.
    Truncate each at its first reach of distance $h_(j - 1)$ from its own start.
    The starts are between $h_j \/ 2$ and $h_j \/ 2 + 8$ apart,
    and each truncated crossing stays within radius $h_(j - 1) + 8$.
    Thus their mutual distance is at least $h_j \/ 2 - 2 \( h_(j - 1) + 8 \) gt.eq h_j \/ 4$.
    The remaining portion of the original crossing has sufficient length for the second truncation,
    since its endpoint is at least $h_j \/ 2 - 8$ from the second start.
    These statements use only the triangle inequality for wrapped distance.
  Recursion gives an ordered binary witness with $2^j$ distinct blocked leaves.
    At every split of scale $h_k$ the two descendant leaf sets are at distance at least $h_k \/ 4$.
    Therefore a ball of radius less than $h_k \/ 8$ meets at most one branch at each split of scale $h_k$ or
    larger, and contains at most $2^(k - 1)$ leaves. For $h_(k - 1) \/ 8 lt.eq h < h_k \/ 8$,
    this is bounded by $C_s \( 1 + h \)^alpha$, because $a^alpha > 4$.
    Below $h_0 \/ 8$ there is at most one leaf, and at or above $h_j \/
    8$ the same comparison allows all $2^j$ leaves. Hence every such witness is sparse,
    at every center and every radius.
  At a split of scale $h_k$, the second start has at most $C h_k^3$ choices on the torus.
    If $W_j$ bounds the number of witnesses rooted at a prescribed site, then
  $ W_0 = 1 \, quad W_j lt.eq C h_j^3 W_(j - 1)^2 \, quad 2^(- j) log W_j lt.eq
    sum_(k gt.eq 1) 2^(- k) log \( C h_k^3 \) < oo . $
  Thus $W_j lt.eq C_a^(2^j)$. This count may ignore separation,
    but the probability bound is applied only to the separated witnesses just constructed.
    Equation (3.8) bounds their union by $\( C_a C sqrt(p) \)^(2^j)$,
    which is at most $e^(- 2 dot.op 2^j)$ for sufficiently large $beta$.
    For $h_j lt.eq h < h_(j + 1)$, use $lambda = log_a 2$ and $2^j gt.eq \( h \/ \( 16 a \) \)^lambda$.
    Bounded $h$ is absorbed by $C$; if $h$ exceeds the torus diameter the event is empty. This proves (3.9). ◻
]

#thm([Lemma 3.4.])[
  (Regularity and localized diffusion).  #emph[Assume $sans(I) \( P \)$ and (3.7).
    For every deterministic time and anchor, failure of regularity has probability at most
#[#set math.equation(numbering: n => "(3.10)")
 $ Delta_A = C A^3 p^6 + C exp \( - c A^(lambda nu) \) . $ <eq:torus-irregularity>]

 Call an exposure good at the anchor if its nonregular times have total length at most $beta \/ 100$.
   Its probability of not being good is at most $100 Delta_A$.
   On a good exposure, the one-turn kernel localized by killing outside $B_A \( z \)$ has every entry at most $C
   beta^(- 3 \/ 2)$, in either direction.]
  #emph[If a deterministic starting slot is a hole almost surely,
    localization at its site loses at most $C e^(- c beta)$ expected mass in any forward or reversed traversal
    piece of length at most one turn. This last assertion does not require $sans(I) \( P \)$.]
] <lem:torus-diffusion>

#proof[
  There are $O \( A^3 \)$ centers in $B_(11 A) \( z \)$, and a fixed $M_(*)$-ball has only a bounded number of
    six-site subsets. Equation (3.8) therefore gives $C A^3 p^6$ for failure of local regularity.
    For a remote blocked site at lifted distance $r > 10 A$, failure of the other condition costs at most $C
    exp \[ - c \( 1 + r \)^(lambda nu) \]$, by (3.9). Indeed all blocked sites of the lift lie in its
    radius-$floor.l L \/ 4 floor.r$ box, so coordinate differences between them are at most $L \/
    2$ and equal their wrapped distances. A crossing in a lifted component is a crossing in the torus component.
    Summing the remote bound over shells, each containing at most $C \( 1 + r \)^2$ sites,
    gives the second term of (3.10), with a smaller exponential rate.
    Fubini and Markov give the asserted probability for a good exposure.
  Let $v \( u \)$ be a localized evolving nonnegative mass, initially of mass at most one, and put $H \( u \) =
    lr(bar.v.double v \( u \) bar.v.double)_2^2$. On smooth intervals, with zero extension across the killing boundary,
  $ H' = - 2 cal(D)_t \( v \) . $
  The energy is the sum of $1 / 2 \( v_i - v_j \)^2$ over unordered real-hole edges,
    including edges from surviving to killed positions. At a regular time, Lemma 7 gives $H' lt.eq -
    c H^(5 \/ 3)$. At other times and at instantaneous factors, the squared norm cannot increase.
    Unless it has become zero, $\( H^(- 2 \/ 3) \)' gt.eq c'$ throughout the regular times.
    Each half turn has at least $beta \/ 2 - beta \/ 100$ regular time,
    so its output has $2$-norm at most $C beta^(- 3 \/ 4)$. The same proof applies to its adjoint,
    since heat factors are symmetric, transports reverse by bijections,
    and seam completions reverse by uniform inverse completions.
    Split a full turn at its temporal midpoint and apply Cauchy–Schwarz to the two resulting masses.
    This proves the entry bound.
  For localization, sample the complete picture under $bb(P)_P$,
    and independently supply fresh Poisson clocks for the hole walk, accepted where both endpoints are holes.
    Forced transports use actual picture marks; seam and switch operations do not change sites.
    An exit from $B_A \( z \)$ needs at least $A$ inter-site steps.
    In a traversal piece of length at most $beta$, the physical times run injectively through at most one period,
    whether forward, backward, or across the seam. Thus the actual marks used by these steps are distinct,
    as are the fresh marks. Ignore slot compatibility and count site paths.
    There are boundedly many choices of the next site, slot edge, and actual-or-fresh clock at each step.
    The factorial bound of Lemma 2, combined with the independent fresh factorial measure,
    bounds the expected number of ordered lists of $j$ steps from the starting site by
  $ frac(\( C beta \)^j, j !) . $
  The denominator is the volume factor for the ordered time simplex.
    Taking $j = A$ and $C_(upright("loc"))$ sufficiently large makes this at most $C e^(- c beta)$,
    using $j ! gt.eq \( j \/ e \)^j$. This is an unconditional estimate under the correct exposure marginal;
    no fresh-clock estimate under the all-hit conditioning is needed. ◻
]

=== 3.4 Cutting off the flows <cutting-off-the-flows>

Localized diffusion controls a direct one-turn return. A return after many turns will instead be controlled by an
  energy inequality. The following finite-torus form of the sparse-source estimate isolates the only error
  introduced by replacing a pinned boundary with ghost killing.

#thm([Lemma 3.5.])[
  (Sparse-source pairing on the torus).  #emph[At a fixed slice let $\( z_i \)_(i = 1)^(m_T)$ be a sparse list,
    including repetitions. Retain any subset of its members at which the lifted graph is regular with radius $A$.
    For each retained member let $mu_i gt.eq 0$ be a mass at most one,
    supported on the real holes over $B_A \( z_i \)$. If $L$ satisfies (3.7) and is sufficiently large compared
    with $A$, then every real vector $Y'$ on the holes of that slice satisfies
#[#set math.equation(numbering: n => "(3.11)")
 $ lr(|⟨sum_i mu_i \, Y'⟩|) lt.eq \( C m_T A^alpha \)^(1 \/ 2) sqrt(cal(D)_t \( Y' \)) +
   C m_T L^(1 \/ 2 - k) lr(bar.v.double Y' bar.v.double)_2 . $ <eq:torus-flow-pairing>]

]
] <lem:torus-flow-pairing>

#proof[
  For an individual source slot $a$ in the support of $mu_i$, take the flow of Lemma 7 in the lift about $z_i$.
    Multiply its value on each edge by a taper equal to one within anchor radius $L \/ 10$,
    zero beyond radius $L \/ 5$, and with Lipschitz constant $C \/ L$.
    For instance use a piecewise linear function of the supremum distance of the edge midpoint.
    The support is strictly inside the lifted box, so this cut flow projects to a flow $tilde(F)_a$ on the torus
    real-hole graph.
  Its divergence has the form $upright(bold(1))_({ a }) + epsilon_a$.
    To see the error bound, compare the taper at an incident edge with its value at the vertex.
    Their difference is at most $C \/ L$; the untapered divergence is zero except at $a$, where the taper is one.
    In the transition annulus every edge is at distance comparable with $L$ from the source,
    because $A lt.double L$. The bounded degree and (3.6) give
  $ \| epsilon_a \( j \) \| lt.eq C L^(- k - 1) \, wide lr(bar.v.double epsilon_a bar.v.double)_2 lt.eq
    C L^(1 \/ 2 - k) . $
  No discrepancy arises outside that annulus enlarged by one lattice step, and there are at most $C L^3$ slots in it.
  The projected flow retains the bound $C \( 1 + d_L \( e \, x_a \) \)^(- k)$.
    For two source sites at wrapped distance $h$, the sum of the product of these envelopes is at most
  #[#set math.equation(numbering: n => "(3.12)")
   $ C \( 1 + h \)^(- \( 2 k - 3 \)) . $ <eq:torus-flow-overlap>]
  For $h gt.eq 3$, inside the radius-$h \/ 3$ ball about either source,
    one envelope is at most $C h^(- k)$ and the sum of the other is at most $C h^(3 - k)$.
    Outside both balls, dyadic shells of radii at least $h \/ 3$ contribute at most $C
    sum_(r gt.eq 0) \( 2^r h \)^(3 - 2 k)$. Shell counts on the torus are bounded by the corresponding lattice
    counts. Since $2 k > 3$, this proves (3.12); bounded $h$ follows from square summability of the envelopes.
  Sum the cut flows with the source masses as coefficients and denote the result by $F$.
    For centers at distance at most $4 A$, use the constant overlap bound; for more distant centers,
    every pair of their source sites is at least half as far apart.
    With $sigma = 2 k - 3 = 49 \/ 50 > alpha$, sparseness and dyadic annuli give
  $ lr(bar.v.double  bar.v.double) F_2^2 & lt.eq
    C sum_i
    (\# { j : d_L \( z_i \, z_j \) lt.eq 4 A } + sum_(j : d_L \( z_i \, z_j \) > 4 A) \( 1 + d_L \( z_i \,
    z_j \) \)^(- sigma))\
 & lt.eq C m_T (A^alpha + sum_(r gt.eq 0) \( 2^r A \)^(alpha - sigma)) lt.eq C m_T A^alpha . $
  This calculation uses only that each mass is at most one;
    it permits both overlapping supports and repeated centers.
    The summed divergence error $epsilon$ has $lr(bar.v.double epsilon bar.v.double)_2 lt.eq
    C m_T L^(1 \/ 2 - k)$. Finally,
  $ ⟨sum_i mu_i \, Y'⟩ = sum_e F \( e \) \( Y'_(e^(-)) - Y'_(e^(+)) \) - chevron.l epsilon \, Y' chevron.r . $
  Cauchy–Schwarz, with $sum_e \( Y'_(e^(-)) - Y'_(e^(+)) \)^2 = 2 cal(D)_t \( Y' \)$, proves the claim.
    The empty retained subset gives zero and is included. ◻
]

=== 3.5 Return energy and completion of the induction <return-energy-and-completion-of-the-induction>

We now prove Proposition 6. Fix a grid and argue by downward induction over its finite set of real slot points.
  When every such point is pinned, $sans(I) \( E \)$ is immediate.
  Assume the assertion for every strict superset of $E$, and choose a nonempty sparse grid test $T$ disjoint from
  $E$. Then $P = E union T$ satisfies $sans(I) \( P \)$, so all the preceding blocking and diffusion estimates
  hold under $bb(P)_P$.

At an exposure under that law put $m_T = \| T \|$ and $zeta = upright(bold(1))_T$.
  Let $F = 1$ on $T$, and elsewhere let $F$ be the probability that the ghost-killed walk with kernel $U$ ever
  hits $T$ at a later cut. Explicitly, start with $F_0 = zeta$ and iterate $F_(n + 1) = 1$ on $T$, $F_(n + 1) =
  U^(*) F_n$ off $T$. These vectors increase to $F$, with $0 lt.eq F lt.eq 1$ and $U^(*) F = F$ off $T$.
  Set $g = F - zeta$, so $0 lt.eq g lt.eq 1$ and $g = 0$ on $T$.

Let $r \( E \, T \)$ be the mean, over $bb(P)_P$ and the uniform starting point in $T$,
  of the indicator that its next pin is in $T$. The pin inequality of Lemma 2 is

#[#set math.equation(numbering: n => "(3.13)")
 $ bb(P)_E \( T subset.eq cal(B)_E \) lt.eq \( 2 r \( E \, T \) \)^(m_T) . $ <eq:sparse-pin-reduction>]

Conditionally on the exposure, deletion of the other real-pin stops bounds the sum of these next-pin probabilities
  by $sum_(i in T) \( U^(*) F \)_i$. Harmonicity off $T$ gives

#[#set math.equation(numbering: n => "(3.14)")
 $ sum_(i in T) \( U^(*) F \)_i & = m_T - chevron.l \, chevron.r F \( I - Q \) F\
 & = chevron.l zeta \, Q zeta chevron.r + 2 chevron.l Q zeta \, g chevron.r - E_g . $ <eq:torus-hitting-energy>]

Indeed the quadratic forms of $U \, U^(*) \, Q$ agree on real vectors, and $chevron.l zeta \, chevron.r g = 0$.
  In particular no reversibility of $U$ has been assumed.

The first term is controlled by one-turn diffusion. Start a unit mass at each $i in T$ and localize at its site,
  in either direction. Lemma 9 bounds discarded mass in expectation by $C e^(- c beta)$.
  On a good exposure there are at most $C_s \( 1 + A \)^alpha$ target points of $T$ in its localized region,
  each receiving at most $C beta^(- 3 \/ 2)$. A nongood exposure has probability at most $100
  Delta_A$ and still carries total mass at most one. Thus

#[#set math.equation(numbering: n => "(3.15)")
 $ bb(E)_P chevron.l zeta \, Q zeta chevron.r lt.eq C m_T #scale(x: 120%, y: 120%)[\(] e^(- c beta) + Delta_A +
   A^alpha beta^(- 3 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:torus-short-return>]

To absorb the linear term in (3.14), split the traversal in direction $d in { + \, - }$ at elapsed time $u in
  I = \[ beta \/ 3 \, 2 beta \/ 3 \]$:

$ U_d = B_d \( u \) C_d \( u \) \, wide Y_d \( u \) = B_d \( u \)^(*) g . $

The factors use matching hole layers at physical time $t_d \( u \) = theta + u$ or $theta - u$ modulo $beta$,
  where $theta$ is the cut of $T$. Each instantaneous factor is assigned to exactly one side;
  the finitely many exceptional split times do not affect the integrals.
  As $u$ decreases, $Y_d \( u \)$ accumulates adjoint factors from the endpoint.
  Its continuous norm loss is twice its Dirichlet energy, and instantaneous factors contract. Consequently

#[#set math.equation(numbering: n => "(3.16)")
 $ integral_I cal(D)_(t_d \( u \)) \( Y_d \( u \) \) thin upright(d) u lt.eq 1 /
   2 #scale(x: 120%, y: 120%)[\(] lr(bar.v.double  bar.v.double) g_2^2 -
   lr(bar.v.double U_d^(*) g bar.v.double)_2^2 #scale(x: 120%, y: 120%)[\)] lt.eq E_g . $ <eq:torus-suffix-energy>]

The second inequality follows from the exact identity

$ E_g - 1 / 2 \( lr(bar.v.double  bar.v.double) g_2^2 - lr(bar.v.double U_d^(*) g bar.v.double)_2^2 \) = 1 /
  2 lr(bar.v.double g - U_d^(*) g bar.v.double)_2^2 \, $

because $chevron.l \, chevron.r g U_d^(*) g = chevron.l \, chevron.r g Q g$.
  Also $lr(bar.v.double Y_d \( u \) bar.v.double)_oo lt.eq 1$ and $lr(bar.v.double Y_d \( u \) bar.v.double)_2
  lt.eq lr(bar.v.double  bar.v.double) g_2$.

For each $i in T$, propagate its unit mass by the starting portion $C_d \( u \)$, with localization at $z_i =
  x_i$, and retain it only when the slice is regular at $z_i$. Call the resulting sum $M_d \( u \)$, and put

$ J_d = \| I \|^(- 1) integral_I chevron.l M_d \( u \) \, Y_d \( u \) chevron.r thin upright(d) u . $

The original pairing $chevron.l C_d \( u \) zeta \, Y_d \( u \) chevron.r = chevron.l U_d zeta \,
  g chevron.r$ is constant in $u$. Supremum contraction, localization, and the deterministic-time bound (3.10) show that

#[#set math.equation(numbering: n => "(3.17)")
 $ bb(E)_P lr(|chevron.l U_d zeta \, g chevron.r - J_d|) lt.eq
   C m_T \( e^(- c beta) + Delta_A \) . $ <eq:torus-pairing-error>]

This uses Fubini and only regularity at the split, without requiring a good exposure over the entire turn.

Apply Lemma 10 to the retained masses. Cauchy–Schwarz in $u$, (3.16), and $E_g gt.eq
  q lr(bar.v.double  bar.v.double) g_2^2$ give the pointwise bound

#[#set math.equation(numbering: n => "(3.18)")
 $ \| J_d \| lt.eq C (\( m_T A^alpha \/ beta \)^(1 \/ 2) + m_T L^(1 \/ 2 - k) \/ sqrt(q)) sqrt(E_g) .
   $ <eq:torus-linear-energy>]

Since $2 chevron.l Q zeta \, g chevron.r = chevron.l U_(+) zeta \, g chevron.r + chevron.l U_(-) zeta \,
  g chevron.r$, we complete the square in $sqrt(E_g)$ to obtain

$ J_(+) + J_(-) - E_g lt.eq C (m_T A^alpha \/ beta + m_T^2 L^(1 - 2 k) \/ q) . $

Combining this with (3.15) and (3.17), and dividing by $m_T$, yields

#[#set math.equation(numbering: n => "(3.19)")
 $ r \( E \, T \) lt.eq
   C (e^(- c beta) + Delta_A + A^alpha beta^(- 3 \/ 2) + A^alpha \/ beta + m_T L^(1 - 2 k) \/ q) .
   $ <eq:torus-return-bound>]

Every constant so far is independent of the grid, its number of points, and the induction pin set.
  Sparseness gives $m_T lt.eq C L^alpha$; because $q gt.eq L^(- 5 \/ 2)$, the last term of (3.19) is at most

$ C L^(alpha + 7 \/ 2 - 2 k) = C L^(- 47 \/ 100) . $

The remaining terms, with $A = ceil.l C_(upright("loc")) beta ceil.r$, are $o \( p \)$ as $beta arrow.r oo$:
  their polynomial orders are $beta^(- 12 \/ 5)$, $beta^(- 149 \/ 100)$, and $beta^(- 99 \/ 100)$,
  besides stretched-exponential terms. Choose $beta_0$ sufficiently large first.
  For each fixed $beta gt.eq beta_0$, choose $L_(*) \( beta \)$ sufficiently large for (3.7) and for the last term
  to make $2 r \( E \, T \) lt.eq p$. Equation (3.13) then proves $sans(I) \( E \)$, completing the finite induction.

For arbitrary finite extra pins and a test at any deterministic time,
  choose a grid containing their times and zero, and refine it to mesh at most $p^12$.
  Uniformity in the grid gives the proposition without a limiting procedure.
  In particular the blocking, component-tail, and regularity conclusions above now hold under every allowed pin
  law. All time integrals are measurable: the finite-volume histories have finitely many jumps,
  their kernels are products of measurable heat and instantaneous matrices,
  and the hitting function is an increasing limit of finite-horizon probabilities.
  No choice of the auxiliary flows has to be measurable, since only their deterministic pairing inequality is used.

#thm([Corollary 3.6.])[
  (Positive spontaneous magnetization).  #emph[For every fixed $S$ and all sufficiently large finite $beta$,
$ m_(S \, beta) gt.eq S \( 1 - beta^(- 9 \/ 10) \) > 0 . $

]
] <cor:positive-magnetization>

#proof[
  The passage from pinned-cycle probabilities to the pressure slope uses pressure increments,
    as in #cite(label("BL")) Section 7. Fix $beta$ above the threshold of Proposition 6,
    enlarged so that $beta > 1$, and put $p = beta^(- 9 \/ 10)$.
    For an exponent field $s > 0$, set $q \( s \) = 1 - e^(- s)$,
    and use the ghost picture with no extra real pins. A real slot is down with probability one half of its
    probability of belonging to a cycle missing the ghost pins:
    pinned cycles are up, and missing cycles are colored fairly.
    The singleton case of Proposition 6 therefore gives a down probability at most $p \/ 2$, whenever $L gt.eq
    L_(*) \( beta \)$ and $q \( s \) gt.eq L^(- 5 \/ 2)$.
  Define the finite-volume exponent pressure
  $ cal(P)_L \( s \) = V^(- 1) log "Tr" exp #h(-0.16667em) (H_0 + s sum_x Y_x) . $
  Write $chevron.l dot.op chevron.r_s$ for the corresponding tilted Gibbs expectation.
    There are $ell V$ slots and $ell = 2 S$, so differentiation and the color representation give
  $ cal(P)'_L \( s \) = V^(- 1) ⟨sum_x Y_x⟩_s gt.eq S \( 1 - p \) . $
  For fixed $0 < a < b$, this holds simultaneously for all $s in \[ a \, b \]$ once $L gt.eq
    max { L_(*) \( beta \) \, q \( a \)^(- 2 \/ 5) }$. Integration yields
  $ cal(P)_L \( b \) - cal(P)_L \( a \) gt.eq S \( 1 - p \) \( b - a \) . $
  By rotation invariance and the pressure limit (1.2), $cal(P)_L \( s \) arrow.r cal(P) \( s \) =
    beta p_(S \, beta) \( s \/ beta \)$ along even $L$. Pass to this limit first.
    The limiting pressure is $S$-Lipschitz, because $lr(bar.v.double sum_x Y_x bar.v.double) lt.eq S V$;
    letting $a arrow.b 0$ therefore gives $cal(P) \( b \) - cal(P) \( 0 \) gt.eq S \( 1 - p \) b$.
    Finally divide by $b$ and let $b arrow.b 0$. Since $cal(P)' \( 0 + \) = p'_(S \, beta) \( 0 + \) =
    m_(S \, beta)$, this proves the claim with the volume limit taken before removal of the field. ◻
]

== 4 Spatial comparison at a vanishing field <sec:weak-field>

The sparse-pin estimate controls the missing cycles at prescribed points.
  We now turn it into a bound for a spatially oscillating magnetization. The two steps are quite different.
  First, an exact susceptibility identity expresses the transverse square through a one-particle resolvent on the
  holes. Second, we show that the resolvent is nearly constant on large rectangular cells.
  Small closed classes of holes are allowed; a trace identity controls their total contribution.

#thm([Proposition 4.1.])[
  (Weak-field spatial estimate).  #emph[Fix $S$. For all sufficiently large $beta$ there are $C_beta \,
    R_0 \( beta \) < oo$ with the following property. Let $L$ be even, let $R_0 \( beta \) lt.eq R lt.eq L$,
    and partition $Lambda_L$ into rectangular cells whose side lengths belong to $\[ R \/ 2 \, 4 R \]$.
    For every deterministic real $f : Lambda_L arrow.r \[ - 1 \, 1 \]$ with $sum_(x in B) f_x = 0$ on each cell $B$, put
$ D_f = sum_x f_x Z_x \, wide q = R^(- 5 \/ 2) \, wide w = 1 - q = e^(- b) . $

 If $chevron.l dot.op chevron.r_b$ is the Gibbs expectation with exponent $H_0 + b sum_x Y_x$, then
#[#set math.equation(numbering: n => "(4.1)")
 $ q / V chevron.l D_f^2 chevron.r_b lt.eq C_beta R^(- 1 \/ 40) . $ <eq:weak-field>]

 The constants are uniform in the partition, $f$, and $L$.]
] <prop:weak-field>

Throughout the proof $beta$ is fixed above a sufficiently large threshold;
  subsequent lower bounds on $R$ may depend on $beta$. We use the soft-pin representation of Section 3,
  with no extra deterministic real pins. Expose all cycles missing the soft pins.
  Write $upright(bold(a))$ for their trajectories, $A_0$ for their real slots at the cut,
  and $cal(H)$ for the complementary cut slots, called the holes.
  The cut is after the seam and its soft-pin insertions, which do not move any line.
  The soft pins themselves may be placed on real cut slots, instead of using the equivalent ghosts.
  A hole cycle is then pinned and has up color; every exposed cycle receives an independent fair color.

=== 4.1 The susceptibility as a hole resolvent <the-susceptibility-as-a-hole-resolvent>

Condition on $upright(bold(a))$. The fresh real-hole motion consists of rate-$1 \/
  2$ jumps across the currently available slot edges, the forced hole transports at exposed jumps,
  and a uniform completion of the seam permutation within each site.
  Its one-turn kernel, without killing or conditioning on its cycles, is denoted by $K$.
  In this section we use the #emph[row-forward convention]: $K_(i j)$ is the probability of going from $i$ to $j$.
  Thus $K$ is doubly stochastic. Set

#[#set math.equation(numbering: n => "(4.2)")
 $ D = I - w K \, wide D^(- 1) = sum_(r gt.eq 0) w^r K^r . $ <eq:hole-resolvent>]

This inverse exists and is entrywise nonnegative. Empty hole sets use empty matrices, determinant one, and sums zero.

#thm([Lemma 4.2.])[
  (Soft-pin identities).  #emph[Given the exposure $upright(bold(a))$, for $i \, j in cal(H)$, $i eq.not j$,
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(P) \( i upright(" is pinned") divides upright(bold(a)) \) & = q \( D^(- 1) \)_(i i) \,\
bb(P) \( i \, j upright(" are pinned, next pin from ") i upright(" is ") j divides upright(bold(a)) \) & = q^2 /
  w \( D^(- 1) \)_(i j) . $ <eq:pin-marginal>]

 Moreover,
#[#set math.equation(numbering: n => "(4.4)")
 $ bb(E) "Tr" D^(- 1) lt.eq N . $ <eq:resolvent-trace>]

 For $f_i = f_(x_i)$ on the slots,
#[#set math.equation(numbering: n => "(4.5)")
 $ chevron.l D_f^2 chevron.r_b = 1 / 4 sum_i f_i^2 + 1 / 2 bb(E) sum_(i \, j in cal(H)\
i eq.not j) f_i f_j \( D^(- 1) \)_(i j) . $ <eq:transverse-resolvent>]

 All expectations here include the normalized picture and soft-pin law.]
] <lem:soft-resolvent>

#proof[
  In the exposure disintegration, the proposed exposed paths have a fixed cycle weight and a factor
    $w^(\| A_0 \|)$, since none of their cut slots is pinned.
    For a proposed pin set $P' subset.eq cal(H)$, put $Q = cal(H) \\ P'$.
    Lemma 3, with the row convention obtained by transposition,
    says that the remaining cycles all meet $P'$ with probability $det \( I - K_(Q Q) \)$.
    Consequently the unnormalized conditional weight of $P'$ is
  #[#set math.equation(numbering: n => "(4.6)")
   $ q^(\| P' \|) w^(\| cal(H) \| - \| P' \|) det \( I - K_(Q Q) \) . $ <eq:conditional-soft-weight>]
  Multilinearity of the determinant in the rows gives
  $ sum_(P' subset.eq cal(H)) q^(\| P' \|) w^(\| cal(H) \| - \| P' \|) det \( I - K_(Q Q) \) = det \( I - w K \) . $
  Restricting this sum to sets containing $i$ gives $q$ times the diagonal cofactor of $D$, proving (4.3).
  For (4.3), keep $i \, j$ pinned. At fixed $Q$ the all-hit probability times the conditional next-pin entry is
  $ det mat(delim: "(", K_(i j), K_(i Q); - K_(Q j), I - K_(Q Q)) . $
  This is a polynomial identity, including when $I - K_(Q Q)$ is singular,
    by the unnormalized identity in Lemma 3. Put $G = cal(H) \\ { i \, j }$.
    Summing over the Bernoulli choices on $G$ replaces this expression by
  $ det D_(G G) #scale(x: 120%, y: 120%)[\(] K_(i j) + w K_(i G) D_(G G)^(- 1) K_(G j) #scale(x: 120%, y: 120%)[\)] . $
  Indeed an unselected row in the bordered determinant is an identity row with zero border entry,
    and a selected row has probability $w$. The principal submatrix $D_(G G)$ is invertible because $w < 1$.
    The two-by-two Schur complement of $D_(G G)$ in $D$ now gives the last display as $det D
    thin \( D^(- 1) \)_(i j) \/ w$. Multiply by $q^2$ and divide by the normalizing determinant to obtain the assertion.
  Condition instead on the picture and its colors. Each up cut slot is independently pinned with probability $q$,
    and no down slot can be pinned: summing its two allowed Bernoulli weights gives $w + q = 1$ for up,
    and only $w$ for down. The expected total number of pins is therefore at most $q N$.
    Pins never lie in $A_0$, so summing (4.3) and taking expectations proves (4.4).
  For the transverse identity rotate coordinates so that the field component is $s^3$ and the tested component is
    $s^1$. The normalized field matrix is $"diag" \( 1 \, w \)$.
    Split it symmetrically around each insertion; this is permitted because the total field commutes with $H_0$.
    At a transverse insertion its slot matrix is
  $ "diag" \( 1 \, sqrt(w) \) thin s^1 thin "diag" \( 1 \, sqrt(w) \) = sqrt(w) / 2 mat(delim: "(", 0, 1; 1, 0) . $
  For distinct $i \, j$, expand pins on all other slots. Two flips give zero unless they lie on the same cycle.
    On that cycle one of the two arcs between the flips must be down and must contain no other pin.
    Adding pins at $i \, j$ therefore identifies each allowed coloring with one of the events “next pin from $i$
    is $j$” or “next pin from $j$ is $i$.” If there are no other pins on this cycle both events contribute,
    exactly accounting for its two allowed colorings. The ratio of insertion weights to the weights with the added
    pins is $w \/ \( 4 q^2 \)$. Formula (4.3) thus gives $1 /
    4 bb(E) \[ \( D^(- 1) \)_(i j) + \( D^(- 1) \)_(j i) \]$ for the two-slot expectation.
    Sum against $f_i f_j$ over ordered distinct pairs. Here inverse entries are interpreted as zero if either cut
    slot is outside the random set $cal(H)$. The same-slot identity $\( s^1 \)^2 =
    I \/ 4$ gives the first term in (4.5). The seam projection ensures that these slot sums are precisely the
    physical site-spin observable. ◻
]

Define the bounded real vector

#[#set math.equation(numbering: n => "(4.7)")
 $ u = q D^(- 1) f_(cal(H)) \, wide e_i = sum_(j in cal(H)) K_(i j) \( u_i - u_j \)^2 . $ <eq:resolvent-u>]

Since $q D^(- 1)$ is stochastic, $\| u_i \| lt.eq 1$. Double stochasticity and $D u = q f_(cal(H))$ imply

#[#set math.equation(numbering: n => "(4.8)")
 $ 1 / 2 sum_i e_i = chevron.l u \, \( I - K \) u chevron.r = q / w #scale(x: 120%, y: 120%)[\(] chevron.l u \,
   f_(cal(H)) chevron.r - lr(bar.v.double u bar.v.double)_2^2 #scale(x: 120%, y: 120%)[\)] lt.eq
   C q N . $ <eq:traversal-energy>]

No reversibility of $K$ is used here.

We will approximate $u$ by a constant on the holes in each cell.
  The missing slots mean that $f_(cal(H))$ no longer has exact cellwise cancellation.
  The following estimate supplies its replacement.

#thm([Lemma 4.3.])[
  (Cancellation after exposure).  #emph[For every cell $B$,
#[#set math.equation(numbering: n => "(4.9)")
 $ bb(E) lr(|sum_(i in cal(H)\
x_i in B) f_i|) lt.eq C sqrt(\| B \| \/ q) . $ <eq:hole-cancellation>]

]
] <lem:hole-cancellation>

#proof[
  Return to the original axes, with field direction $Y$, and put $T_B = sum_(x in B) f_x Y_x$.
    The ordinary Laplace transform $F_B \( z \) = chevron.l e^(z T_B) chevron.r_b$ is zero-free on $\| z \| < c
    b$: all slot fields in direction $Y$ have positive real part there, so Lemma 4 applies.
    Take its analytic logarithm equal to zero at $0$. Spectral calculus for $T_B$ gives
  $ "Re" log F_B \( z \) lt.eq \| z \| S \| B \| lt.eq C b \| B \| wide \( \| z \| < c b \) . $
  The Borel–Carathéodory inequality on this disk, followed by Cauchy’s second-derivative estimate on a smaller
    concentric disk, therefore yields
  $ "Var"_b \( T_B \) = \( log F_B \)'' \( 0 \) lt.eq C \| B \| \/ b lt.eq C \| B \| \/ q . $
  Translation invariance and $sum_(x in B) f_x = 0$ give $chevron.l T_B chevron.r_b = 0$.
    In the color representation its conditional expectation given $upright(bold(a))$ is
  $ bb(E) \( T_B divides upright(bold(a)) \) = - 1 / 2 sum_(i in A_0\
x_i in B) f_i = 1 / 2 sum_(i in cal(H)\
x_i in B) f_i . $
  Here exposed cycles are fair and every hole cycle is up; the total sum of the slot coefficients on $B$ is zero.
    Conditional Jensen and Cauchy–Schwarz prove (4.9). ◻
]

=== 4.2 A graph recording communication between holes <a-graph-recording-communication-between-holes>

The small traversal energy in (4.8) must now control spatial variation.
  A hole can be carried by the exposed trajectories even when the fresh walk makes no jumps.
  We retain that motion explicitly in a graph on the cut holes.

Ignore fresh walk jumps and follow only forced transports from the cut to the seam.
  Choose one allowed residual seam matching within each site.
  The resulting lines, called #emph[skeleton lines], give a permutation $phi.alt$ of $cal(H)$.
  Define an undirected graph $Gamma$ on $cal(H)$ with the following edges:

+ an endpoint edge from $i$ to every possible final cut hole under a residual seam matching,
  including $phi.alt \( i \)$;
+ a contact edge between $i \, j$ whenever their skeleton lines occupy adjacent sites,
  with an available slot edge between them, throughout some interval of positive length.

Self-edges may be omitted. All choices of representatives and matching can be made by fixed orderings of the
  finite sets.

#thm([Lemma 4.4.])[
  (Communication costs and closed classes).  #emph[An endpoint edge from $i$ to $j$ satisfies $\( u_i - u_j \)^2
    lt.eq C_beta e_i$. For a contact edge witnessed by a fixed-position interval of length $tau lt.eq 1$,
#[#set math.equation(numbering: n => "(4.10)")
 $ \( u_i - u_j \)^2 lt.eq C_beta tau^(- 1) \( e_i + e_j \) . $ <eq:contact-cost>]

 The kernel $K$ is closed on every connected component of $Gamma$, and
#[#set math.equation(numbering: n => "(4.11)")
 $ bb(E) thin \# { upright("components of ") Gamma } lt.eq q N . $ <eq:component-count>]

]
] <lem:skeleton-graph>

#proof[
  The walk jump rate is uniformly bounded by a constant depending on $ell$.
    The probability of making no fresh jump during a period is at least $e^(- C beta)$;
    the probability of any prescribed allowed seam image is at least $1 \/ ell$.
    Thus an endpoint entry of $K$ is at least $c_beta$. For a contact interval,
    require exactly one jump from line $i$ to line $j$ during that interval and no other jumps,
    and choose endpoint $phi.alt \( j \)$. This gives $K_(i \, phi.alt \( j \)) gt.eq c_beta tau$.
    Compare $u_i$ to $u_j$ through $u_(phi.alt \( j \))$, using also the endpoint bound for $j$; this proves (4.10).
  A fresh walk changes skeleton line only through contact, and every possible seam endpoint has been included in
    $Gamma$. Hence each component is closed under $K$. Its stochastic block has eigenvalue $1$.
    Every eigenvalue $lambda$ of that block satisfies $\| lambda \| lt.eq 1$, and
  $ "Re" frac(1, 1 - w lambda) = frac(1 - w "Re" lambda, \| 1 - w lambda \|^2) > 0 . $
  Its contribution to $"Tr" D^(- 1)$ is therefore at least $1 \/ q$, from the eigenvalue $1$.
    This trace argument applies equally to non-diagonalizable blocks. Sum over the components and use (4.4). ◻
]

Every edge of $Gamma$ also has a spatial realization. An endpoint edge follows one skeleton line and then the
  seam, which does not change its site. A contact edge follows its first skeleton line to a contact time,
  crosses one site edge, and follows the second line back to its cut.
  Such a realization consists of at most two pieces of actual marks in chronological or reverse chronological
  order, and one extra site edge. This observation will prevent an edge leaving a small obstacle from making a
  long excursion or winding around the torus.

=== 4.3 Coarse obstacles and local communication <coarse-obstacles-and-local-communication>

Choose $d = ceil.l C_0 beta ceil.r$, with the fixed constant $C_0$ large enough below.
  Partition each coordinate circle into integer intervals of lengths in $\[ d \, 2 d \]$.
  Their product boxes are indexed by a three-dimensional coordinate torus.
  Fine distances refer to site coordinates and coarse distances to these box indices;
  both use the supremum norm and the periodic convention. A site is #emph[blocked] if it has no cut hole.

We use the following deterministic input from #cite(label("Ord")) Lemma 5.5,
  also recalled in #cite(label("BL")) Section 3. For each fixed $a$ there is $rho \( 3 \, a \) gt.eq a +
  1$ such that two unblocked sites at distance at most $a$ can be joined by a nearest-neighbor unblocked path in
  the ball of radius $rho \( 3 \, a \)$ about the first, of length at most $\( 2 rho \( 3 \, a \) + 1 \)^3$,
  provided that ball contains fewer than six blocked sites.
  We use $a = 44$ and fix $M gt.eq max { 48 \, rho \( 3 \, 44 \) + 2 }$.
  The result concerns arbitrary blocked sets; we apply it in local lifts to the lattice.
  Increase $C_0$, if necessary, so that $d$ dominates these fixed geometric constants.

Let $0 < delta < min { 1 \, beta \/ 2 }$; its value in terms of $R$ will be chosen only after the comparison is
  proved. Put $j_(*) = floor.l d \/ 20 floor.r$. Declare a coarse box #emph[bad] when at least one of the
  following occurs:

+ some $M$-ball centered within fine distance $10 d$ of the box contains at least six blocked sites;
+ starting within that $10 d$-neighborhood, a site path of $j_(*)$ inter-site steps is supplied by distinct actual
  marks in chronological or reverse chronological order during one period;
+ among marks on edges incident to the $15 d$-neighborhood, there is a mark within $delta$ of $0$ or $beta$,
  or two distinct marks at times less than $delta$ apart.

The last event will be called a #emph[short-time flag]. Slot compatibility is deliberately not required in (ii);
  this makes the condition constrain every skeleton trajectory. Join bad boxes at coarse distance at most eight.
  All probabilities below use the original joint picture law.
  The bad events may depend on the full picture, even though $K$ and $u$ depend only on its exposure.

#thm([Lemma 4.5.])[
  (Bad-box tails).  #emph[There are $beta_0 \, c \, C \, lambda_1 > 0$ and, for each $beta gt.eq beta_0$,
    a number $delta_0 \( beta \) > 0$ such that for every $0 < delta lt.eq delta_0 \( beta \)$,
    uniformly in the admissible volumes and pin parameters of this section,
#[#set math.equation(numbering: n => "(4.12)")
 $ bb(P) { z upright(" is bad and its bad component reaches distance ") h upright(" from ") z } lt.eq
   C e^(- c h^(lambda_1)) . $ <eq:bad-box-tail>]

 A specified box has a short-time flag with probability at most $C_beta delta$.]
] <lem:bad-box-tail>

#proof[
  Factorial domination from Lemma 2 bounds the one-mark count near the ends of the period and the ordered two-mark
    count with time gap less than $delta$ by $C_beta delta$. For a prescribed starting site,
    the expected number of ordered paths using $j_(*)$ marks is at most $\( C beta \)^(j_(*)) \/ j_(*) !$:
    the bounded choices of a next slot edge and the factorial factor are absorbed in $C$,
    and the ordered time simplex has volume $beta^(j_(*)) \/ j_(*) !$. Summing starting sites gives the bound
  #[#set math.equation(numbering: n => "(4.13)")
   $ epsilon_(upright("mark")) = C d^3 \( C beta \)^(j_(*)) \/ j_(*) ! + C_beta delta $ <eq:coarse-mark-cost>]
  for the union of (ii) and (iii). Such paths stay within fine distance $11 d$ of the box,
    so all their data are in its fixed $15 d$-neighborhood, with a harmless one-edge enlargement.
    Take $C_0$ large; the first term is then at most $C e^(- c beta)$.
  Here is the dependence estimate needed to pass from single boxes to components.
    Choose a large integer $a$ with $a^(1 \/ 100) > 4$, and a fixed coarse radius $h_0$ large enough that data
    neighborhoods at separated leaves below are disjoint. Set $h_k = h_0 a^k$.
    A bad path from a prescribed root to distance $h_k$ contains two crossings at scale $h_(k - 1)$:
    one starts at the root, and one at its first visit to distance $h_k \/ 2$.
    Truncate each on its first reach of the smaller radius. Their ranges are separated by at least $h_k \/ 4$, since
  $ h_k \/ 2 - 2 \( h_(k - 1) + 8 \) gt.eq h_k \/ 4 . $
  Recursion gives $2^k$ distinct bad leaves with the sparse growth bound of Proposition 6, in coarse coordinates.
    Indeed a ball of radius less than $h_r \/ 8$ meets at most one branch at every split of scale at least $h_r$,
    and hence at most $2^(r - 1)$ leaves; the choice of $a$ gives the growth exponent $1 \/
    100$ also between consecutive scales. The number of possible witnesses is at most $C_1^(2^k)$,
    because at a split of scale $h_r$ there are at most $C h_r^3$ choices and $sum_(r gt.eq 1) 2^(- r)
    log \( C h_r^3 \) < oo$.
  For any specified subset of leaves of type (i), choose a witnessing center and six blocked sites.
    There are at most $C d^3$ choices per leaf, since $M$ is fixed. Select one fixed slot at each chosen site.
    These fine-slot tests are sparse with a constant independent of $d$:
    sites in a fine ball of radius $r$ come from leaves in a coarse ball of radius $C \( 1 + r \/ d \)$,
    so their number is at most $6 C \[ 1 + C \( 1 + r \/ d \) \]^(1 \/ 100) lt.eq C_s \( 1 + r \)^(1 \/ 100)$.
    Leaf separation makes the selected sites distinct. A blocked site has all its slots exposed,
    so Proposition 6 bounds the joint probability for $m$ such leaves by $\( C d^3 p^6 \)^m$, where $p =
    beta^(- 9 \/ 10)$.
  For any subset of mark-type leaves, the data neighborhoods are disjoint.
    Expand their indicators by the path and flag counts used above and apply factorial domination to all the
    selected marks together. Distinct neighborhoods use distinct marks; their integrals factor.
    This gives the product bound $epsilon_(upright("mark"))^m$,
    without assuming independence of the weighted picture. In every witness at least half the leaves have one of
    these two types. Sum over that subset and over the witnesses.
    Since $d^3 p^6 = O \( beta^(- 12 \/ 5) \)$, choosing $beta$ large and then $delta_0 \( beta \)$ small puts
    both leaf costs below a fixed sufficiently small witness budget.
    The probability is then at most $C e^(- c 2^k)$, with $c \, C$ uniform for $delta lt.eq delta_0 \( beta \)$.
    This proves (4.12) with $lambda_1 = log_a 2$, after changing constants for intermediate and bounded radii.
    The argument uses only wrapped distances and the bound $\| B_h \| lt.eq C \( 1 + h \)^3$,
    so it is valid on the coarse torus. ◻
]

#thm([Lemma 4.6.])[
  (Local paths near good boxes).  #emph[Choose a representative cut hole $i \( z \)$ in every good box $z$.
    Any two cut holes in one good box, and representative holes in two nearest-neighbor good boxes,
    can be joined in $Gamma$ using at most $C_beta$ contact edges, all with contact duration at least $delta$,
    whose cut starts stay within fine distance $C_beta$ of the boxes.]
  #emph[Moreover, if a spatial realization of any edge of $Gamma$ meets a good box $z$,
    its whole realization lies within fine distance $d \/ 2$ of a point in that box,
    after increasing the fixed lower threshold on $d$. In particular both cut endpoint boxes have coarse distance
    at most one from $z$.]
] <lem:good-box-paths>

#proof[
  A good box contains an unblocked site, since otherwise an $M$-ball in it would contain six blocked sites.
    To connect two desired sites, first use a coordinate path of length $C
    d$ through the one- or two-box neighborhood. Replace every blocked vertex of this path by a surviving nearest
    neighbor. Such a neighbor exists: six blocked neighbors would contradict (i).
    Consecutive replaced vertices have distance at most three.
    The imported local-connectivity result joins them through unblocked sites with bounded length and
    displacement. All its balls lie in the $10 d$-neighborhood where (i) is absent.
    Lift the resulting path to cut slots, using the complete adjacency of available slots across a site edge.
    If different slots at one site need joining, pass through a surviving neighbor of that site.
    The absence of (iii) means that these cut adjacencies persist for at least $delta$ after the cut.
    This proves the first assertion.
  For the second assertion, a realization has at most two monotone mark pieces and a contact edge.
    Suppose one piece meets $z$. The portions on either side of that visit each have fewer than $j_(*)$ steps:
    a longer portion, read in the appropriate time direction, would violate (ii).
    If there is a second piece, its contact endpoint is therefore within $2 j_(*) + 1$ of the visit.
    This point lies in the tested $10 d$-neighborhood, and (ii) bounds the whole second piece by $j_(*) -
    1$ steps. If the contact edge itself meets $z$, apply the same argument from its endpoints.
    Thus every point of the realization lies within $3 j_(*) + 2 < d \/ 2$ of the visit.
    This reasoning also applies in a lift: every monotone piece uses distinct torus marks during one period. ◻
]

The first assertion converts ordinary paths through good boxes into energy bounds.
  The second is the essential control on a hole trapped among bad boxes:
  any escape through a good boundary must take place locally.
  We next build those boundaries on a finite portion of the covering lattice,
  including when the cell under consideration is the whole torus.

=== 4.4 Filled hulls and the comparison function <filled-hulls-and-the-comparison-function>

We recall precisely the deterministic hull construction that we import from #cite(label("Ord")) Lemma 6.1 and
  Section 6.1, Equations (6.2)–(6.3). For any finite blocked set $cal(Z) subset bb(Z)^3$,
  join its points at supremum distance at most eight. For each component $C$, thicken it to $A_C = { z :
  "dist" \( z \, C \) lt.eq 4 }$ and fill the finite nearest-neighbor components of $bb(Z)^3 \\ A_C$.
  The resulting hull $H_C$ is contained in the coordinate bounding box of $A_C$.
  The hulls are disjoint or nested, so the maximal ones are disjoint.
  Their exterior vertex boundaries consist of unblocked vertices and are connected by unblocked nearest-neighbor
  paths in the unit enlargement of that bounding box. At an edge from $H_C$ to its complement the exterior vertex
  has distance five from $C$ and at least four from every other blocked component.

Choose an exterior-boundary representative $r_H$ for each maximal hull and define $rho \( z \) = r_H$ on $H$,
  fixing other vertices. Apply this map #emph[once]. Each lattice edge has a route between its two images,
  using only unblocked vertices and lying in the original edge together with the enlarged boxes of its incident
  hulls. For completeness, if its endpoints belong to distinct maximal hulls $H \, H'$, the route is

$ r_H arrow.r v arrow.r u arrow.r r_(H') wide \( u in H \, med v in H' \) . $

The first and last portions run along the respective exterior boundaries,
  and the middle portion reverses the original edge. A representative can lie in another hull,
  so $rho$ is not assumed idempotent. This is why the once-applied convention matters.
  These inputs concern arbitrary finite blocked sets and require no regular-anchor hypothesis.

Let $n gt.eq 1$ be an integer parameter and assume $10^6 d n lt.eq R lt.eq L$.
  For a cell $B$, lift its coordinate intervals to $bb(Z)^3$,
  and take a coarse rectangular window containing all boxes meeting that lift, padded by $1000 n$ coarse units.
  Copy the torus box data periodically into the window and declare precisely its bad boxes blocked;
  outside the window there are no blocked boxes. Call $B$ #emph[usable] if every component of this finite blocked
  set has diameter at most $2 n$. Lemma 16 gives

#[#set math.equation(numbering: n => "(4.14)")
 $ bb(P) \( B upright(" is unusable") \) lt.eq C_beta R^3 e^(- c n^(lambda_1)) . $ <eq:unusable-cell>]

To verify the periodic issue in this bound, a component of diameter greater than $2 n$ has,
  from one of its vertices, a path to distance $n$. Truncate at its first reach.
  The path stays within $n + 8$ coarse units of its root; the assumed bound $10^6 d n lt.eq
  L$ ensures that its projection preserves these distances and gives a torus bad component reaching $n$.
  The window has at most $C_beta R^3$ vertices, including its periodic copies, which proves the union bound.
  The hull construction therefore takes place on a finite blocked subset of the covering lattice.

For usable $B$, apply the preceding lattice hull construction.
  Each enlarged bounding box has diameter at most $2 n + 10$;
  simple routes in the union of at most two such boxes have length at most $C n^3$.
  All hulls and routes used near $B$ are strictly inside the padded window.
  There the finite-set designation “unblocked” means that the corresponding torus coarse box is good.
  Choose representative cut holes periodically for all good boxes and define on fine sites of the lifted cell

#[#set math.equation(numbering: n => "(4.15)")
 $ U_B \( x \) = u_(i \( rho \( z_x \) \)) \, $ <eq:comparison-function>]

where $z_x$ is the coarse box containing $x$. Thus $\| U_B \| lt.eq 1$.
  This is a function on all sites, even when some sites have no hole.

#thm([Lemma 4.7.])[
  (Comparison across a cell and out of a hull).  #emph[There is a constant $C_beta$ such that the following hold
    for every usable $B$. For fine nearest neighbors $x \, x'$ within its lift,
#[#set math.equation(numbering: n => "(4.16)")
 $ \| U_B \( x \) - U_B \( x' \) \|^2 lt.eq C_beta n^6 delta^(- 1) sum_(i in cal(H)\
"dist" \( x_i \, x \) lt.eq C_beta n) e_i . $ <eq:comparison-edge>]

 For a cut hole $j$ above $x in B$, the same right side bounds $\| u_j - U_B \( x \) \|^2$, unless either]
  + #emph[there is a short-time flag in some box at coarse distance at most $100 n$ from $z_x$; or]
  + #emph[the $Gamma$-component of $j$ has at most $C_beta n^3$ vertices.]
  #emph[The distances in the energy sum may be taken on the torus.]
] <lem:hull-comparison>

#proof[
  If $x \, x'$ lie in the same coarse box the left side of (4.16) vanishes.
    Otherwise their box indices are nearest neighbors. The imported hull route joins their images under $rho$
    through good boxes, in a region of diameter $C n$, with length at most $C n^3$.
    Replace each of its coarse edges by the cut-hole paths of Lemma 17.
    This gives at most $C_beta n^3$ edges of $Gamma$ in the stated neighborhood, each obeying (4.10) with $tau =
    delta$. Telescoping and Cauchy–Schwarz bound the total squared difference by path length times the sum of
    these costs. Bounding the multiplicity of any $e_i$ by the path length itself gives the factor $C_beta n^6
    delta^(- 1)$.
  Now let $j$ lie over $x$. If $z_x$ is outside all maximal hulls,
    it is good and the local paths already prove the assertion. Otherwise let $H$ be its maximal hull.
    This hull and its enlarged box have diameter $O \( n \)$;
    they project injectively onto the coarse torus by the same bound $10^6 d n lt.eq L$.
    The set $J_H$ of cut holes whose boxes belong to its projection has size at most $C_beta n^3$.
    If the $Gamma$-component of $j$ stays in $J_H$, exception (ii) applies.
    Otherwise take a simple $Gamma$-path from $j$ to its first vertex outside $J_H$. It has at most $\| J_H \|$ edges.
  To locate these edges, lift a spatial realization starting at its endpoint in $H$.
    If the realization stays in $H$, it is local. If it leaves,
    its first boundary crossing has an exterior coarse box $z$ with distance at least four from every bad box.
    This crossing lies in the interior of the data window, so $z$ is genuinely good on the torus.
    Lemma 17 confines the #emph[entire] realization to the $d \/ 2$-neighborhood of that crossing,
    and its cut endpoint boxes to coarse distance one from $z$.
    In particular it cannot wind around the torus and return to another copy of $H$.
    For every edge on the first-exit path, its realization and both cut starts thus remain within coarse distance
    $C n$ of $z_x$.
  It remains to justify its contact costs; the bad boxes inside $H$ did not by themselves guarantee any minimum
    contact duration. Choose a contact time on its localized realization,
    and extend to the maximal interval on which the two skeleton positions are fixed.
    An endpoint of this interval is $0$, $beta$, or an actual mark incident to one of the two occupied slots.
    If the interval had length less than $delta$, its endpoints would give either a mark within $delta$ of an end
    of the period or two distinct incident marks within $delta$ of each other.
    The contact sites are within $12 n$ coarse units of $z_x$:
    the hull diameter is at most $2 n + 8$, its boundary boxes are within $2 n + 9$ of $z_x$,
    and a realization meeting such a box stays within one further coarse unit. Thus $2 n + 10 lt.eq 12 n$.
    Both endpoint marks are incident to these same fixed positions,
    including when an endpoint time precedes the chosen contact time. Such a flag is excluded by (i).
    Every contact therefore has duration at least $delta$. Endpoint edges need no duration estimate.
  For the exiting edge, take its boundary-crossing exterior box $z$ as above.
    The final cut hole lies in a box at coarse distance at most one from $z$.
    Clearance makes all boxes within that distance good. A coordinate coarse path between them stays in this good
    neighborhood, and the local hole paths lead to $i \( z \)$.
    Finally, $z$ and the representative $r_H$ both lie on the exterior vertex boundary of $H$.
    The imported boundary route joins them through good boxes in its enlarged bounding box,
    using at most $C n^3$ steps after loop erasure. Lift this route by the local hole paths.
    We have joined $j$ to $i \( r_H \)$, the hole defining $U_B \( x \)$,
    by at most $C_beta n^3$ controlled edges, all using cut starts within fine distance $C_beta n$ of $x$.
    The same telescoping estimate proves the assertion. ◻
]

Figure 2 illustrates the two local comparisons used in this argument:
  energy is charged at cut starts, and an exit from a hull reaches a nearby surviving boundary route.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.208, 3.91), [#text(size: 9pt)[A contact edge]])
  line((0, 3.358), (4.83, 3.358), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((2.415, 3.358), [#text(size: 9pt)[one period]], anchor: "south", padding: 0.1176cm)
  line((0, 3.22), (0, 0.276), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((4.6, 3.22), (4.6, 0.276), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((0, 3.358), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  content((4.6, 3.358), [#text(size: 9pt)[$beta$]], anchor: "south", padding: 0.1176cm)
  rect((1.932, 0.368), (2.622, 2.944), fill: rgb("#ececec"), stroke: none)
  line((0, 2.576), (1.012, 2.576), (1.012, 2.162), (3.036, 2.162), (3.036, 2.668), (4.6, 2.668), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 0.828), (0.736, 0.828), (0.736, 1.242), (3.588, 1.242), (3.588, 0.828), (4.6, 0.828), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 2.576), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 2.576), [$i$], anchor: "east")
  circle((0, 0.828), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((-0.03528, 0.828), [$j$], anchor: "east")
  circle((4.6, 2.668), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((4.635, 2.668), [$phi (i)$], anchor: "west")
  circle((4.6, 0.828), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((4.635, 0.828), [$phi (j)$], anchor: "west")
  line((2.3, 2.162), (2.3, 1.242), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.374, 1.693), [#text(size: 9pt)[jump]], anchor: "west", padding: 0.1176cm)
  line((1.932, 0.2484), (2.622, 0.2484), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2.277, 0.2484), [#text(size: 9pt)[$tau gt.eq delta$]], anchor: "north", padding: 0.1176cm)
  content((2.392, -0.598), [#text(size: 9pt)[$i arrow.r.long phi (j) arrow.l.long j$#linebreak()cost uses $e_i+e_j$]])
  content((9.43, 3.91), [#text(size: 9pt)[Leaving a filled hull]])
  line((7.36, 0.184), (7.36, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.82, 0.184), (7.82, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((8.28, 0.184), (8.28, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((8.74, 0.184), (8.74, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((9.2, 0.184), (9.2, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((9.66, 0.184), (9.66, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((10.12, 0.184), (10.12, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((10.58, 0.184), (10.58, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((11.04, 0.184), (11.04, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((11.5, 0.184), (11.5, 3.404), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.13, 0.46), (11.73, 0.46), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.13, 0.92), (11.73, 0.92), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.13, 1.38), (11.73, 1.38), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.13, 1.84), (11.73, 1.84), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.13, 2.3), (11.73, 2.3), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.13, 2.76), (11.73, 2.76), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.13, 3.22), (11.73, 3.22), stroke: (paint: rgb("#e8e8e8"), thickness: 0.4pt, miter-limit: 10))
  line((7.636, 0.598), (10.3, 0.598), (10.3, 2.484), (9.614, 2.484), (9.614, 2.898), (7.636, 2.898), close: true, fill: rgb("#f0f0f0"), stroke: (paint: rgb("#b3b3b3"), thickness: 0.8pt, miter-limit: 10))
  content((8.28, 2.484), [#text(size: 9pt)[$H$]])
  rect((8.464, 1.656), (8.924, 2.116), fill: rgb("#b3b3b3"), stroke: none)
  rect((8.924, 1.196), (9.384, 1.656), fill: rgb("#b3b3b3"), stroke: none)
  content((8.786, 0.9476), [#text(size: 7pt)[bad boxes]])
  circle((8.004, 1.656), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((7.969, 1.656), [$j$], anchor: "east")
  circle((8.464, 1.334), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  circle((9.66, 1.38), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  circle((10.53, 1.702), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  line((8.004, 1.656), (8.464, 1.334), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((8.464, 1.334), (9.66, 1.38), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((9.66, 1.38), (10.53, 1.702), stroke: (thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  merge-path({line((10.53, 1.702), (10.58, 1.702)); arc((10.58, 1.702), start: -180deg, stop: -270deg, radius: 0.1411cm); line((10.72, 1.843), (10.72, 3.033)); arc((10.72, 3.033), start: -90deg, stop: -180deg, radius: 0.1411cm); line((10.58, 3.174), (10.03, 3.174))}, stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  circle((10.03, 3.174), radius: 0.08481, fill: rgb("#000000"), stroke: none)
  content((10.03, 3.209), [$i(r_H)$], anchor: "south")
  rect((10.19, 1.288), (10.97, 2.116), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((11, 1.702), [#text(size: 7pt)[good#linebreak()boundary]], anchor: "west", padding: 0.1176cm)
  content((9.43, -0.598), [#text(size: 9pt)[first exit, then an exterior route#linebreak()to the comparison value]])
})],
  caption: [Figure 2: Two parts of the hole comparison, drawn schematically. Left: a fresh walk jumps between skeleton lines during a contact interval. Comparing both cut values through $u_(phi.alt \( j \))$ charges energy only to the cut starts $i \, j$. Right: a path in $Gamma$ first exits a filled coarse hull. Clearance makes its crossing box good; the absence of long mark paths then confines the whole exiting link near that box. A surviving exterior-boundary route leads to $i \( r_H \)$, which defines $U_B$ on the hull. Gray squares indicate bad boxes; the larger gray region represents the filled hull, with distances and thicknesses not to scale. ],
) <fig:holes-comparison>

=== 4.5 Energy, exceptional sets, and the final estimate <energy-exceptional-sets-and-the-final-estimate>

The construction has supplied a bounded comparison function on each usable cell.
  Its lattice gradients are controlled by the total traversal energy,
  and a hole fails to match that function only near a short-time flag or in a small closed class.
  We now sum these three contributions and choose the auxiliary scales.

#thm([Lemma 4.8.])[
  (Cellwise approximation of the resolvent).  #emph[There are random numbers $c_B in \[ - 1 \, 1 \]$,
    one per cell, such that
#[#set math.equation(numbering: n => "(4.17)")
 $ bb(E) sum_B sum_(i in cal(H)\
x_i in B) \( u_i - c_B \)^2 lt.eq C_beta N R^(- 1 \/ 20) . $ <eq:cell-resolvent>]

]
] <lem:cell-resolvent>

#proof[
  On a usable cell let $c_B = \| B \|^(- 1) sum_(x in B) U_B \( x \)$; on an unusable cell put $c_B = 0$.
    The rectangular lattice Poincaré inequality, whose constant is at most $C R^2$ for the stated side lengths, gives
  $ sum_(x in B) \| U_B \( x \) - c_B \|^2 lt.eq C R^2 sum_({ x \, x' } subset B\
\| x - x' \|_1 = 1) \| U_B \( x \) - U_B \( x' \) \|^2 . $
  It holds in the chosen lift, also for a cell covering an entire coordinate circle:
    only the internal rectangle edges are needed. Use Lemma 18 both here and for the nonexceptional differences
    $u_i - U_B \( x_i \)$. There are at most $ell$ holes above a site.
    In summing all the local energy sums, any fixed torus $e_i$ occurs at most $C_beta n^3$ times,
    since the original fine sites, over all cells, partition the torus.
    Periodic copies used to construct the windows do not add summation sites.
    Equation (4.8) therefore bounds these contributions by
  $ C_beta R^2 n^9 delta^(- 1) q N . $
  All remaining squared differences are at most four. A fixed fine site has at most $C
    n^3$ boxes in its short-flag neighborhood; its exceptional probability is at most $C_beta n^3
    delta$ by Lemma 16. The total number of holes in $Gamma$-components of size at most $C_beta
    n^3$ is at most $C_beta n^3$ times the number of components, whose expectation is bounded by (4.11).
    Finally sum (4.14) with weights at most $ell \| B \|$. Together these estimates give
  #[#set math.equation(numbering: n => "(4.18)")
   $ 1 / N bb(E) sum_B sum_(i in cal(H)\
x_i in B) \( u_i - c_B \)^2 lt.eq C_beta (R^2 n^9 delta^(- 1) q + n^3 delta + n^3 q + R^3 e^(- c n^(lambda_1))) .
  $ <eq:comparison-errors>]
  Take now
  $ delta = R^(- 1 \/ 8) \, wide n = ceil.l R^(1 \/ 200) ceil.r . $
  At fixed $beta$, sufficiently large $R$ meets all preceding smallness conditions, including $10^6 d n lt.eq
    R lt.eq L$, and the short-flag threshold in Lemma 16. The first three terms on the right of (4.18) are,
    respectively,
  $ O \( R^(- 33 \/ 100) \) \, wide O \( R^(- 11 \/ 100) \) \, wide O \( R^(- 497 \/ 200) \) . $
  The fourth is smaller than any negative power of $R$. This proves (4.17) with the stated, nonoptimal exponent. ◻
]

#proof[
  The partition has at most $C V \/ R^3$ cells and each has volume comparable to $R^3$.
    Lemmas 19 and 14, together with $\| c_B \| lt.eq 1$, give
  $ bb(E) \| chevron.l f_(cal(H)) \, u chevron.r #scale(x: 120%, y: 120%)[\|] & lt.eq
    bb(E) sum_B sum_(i in cal(H) \, thin x_i in B) \| u_i - c_B \| +
    sum_B bb(E) lr(|sum_(i in cal(H) \, thin x_i in B) f_i|)\
 & lt.eq C_beta N R^(- 1 \/ 40) + C V \( q R^3 \)^(- 1 \/ 2) . $
  In (4.5), add the diagonal terms inside the resolvent sum and discard their nonnegative subtraction.
    Since $u = q D^(- 1) f_(cal(H))$, this yields
  $ q / V chevron.l D_f^2 chevron.r_b lt.eq frac(q N, 4 V) + frac(1, 2 V) bb(E) \| chevron.l f_(cal(H)) \,
    u chevron.r #scale(x: 120%, y: 120%)[\|] lt.eq C_beta #scale(x: 120%, y: 120%)[\(] q + R^(- 1 \/ 40) +
    R^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\)] . $
  This is (4.1). The assumptions needed for the sparse-pin estimate hold because $q = R^(- 5 \/ 2) gt.eq
    L^(- 5 \/ 2)$ and the lower bound on $R$ can include $L_(*) \( beta \)$. ◻
]

== 5 Removing the field and comparing spatial scales <sec:zero-field>

Proposition 12 controls an ordinary transverse square in a small positive field.
  We first turn this estimate into an exponential bound at zero field.
  The bound is weak for one prescribed test, but it holds uniformly over enough tests to compare magnetization
  averages in a cell with those in its children. Throughout this section, $beta$ is sufficiently large and fixed.

=== 5.1 Curvature of a logarithmic Laplace transform <curvature-of-a-logarithmic-laplace-transform>

The analytic step uses the following strip lemma. Its positivity is essential:
  small curvature at the origin will then control curvature on a real interval whose length grows logarithmically
  with the spatial scale.

#thm([Lemma 5.1.])[
  (Strip curvature).  #emph[Let $F$ be holomorphic on ${ z in bb(C) : \| "Im" z \| < a_0 }$,
    real and even on the real axis, with $F \( 0 \) = 0$. Suppose that, for some $K < oo$,
$ 0 lt.eq F \( x \) lt.eq K \| x \| \, wide "Re" F \( x + i y \) lt.eq
  F \( x \) quad \( x in bb(R) \, med \| y \| < a_0 \) . $

 For each $a in \( 0 \, a_0 \)$ there is a strictly positive Schwartz function $J_a$ such that,
   with $g_a \( x \) = F \( x \) - "Re" F \( x + i a \)$,
#[#set math.equation(numbering: n => "(5.1)")
 $ F'' = J_a * g_a \, wide J_a = 2 / a^2 \( h_a * h_a \) \, wide h_a \( x \) =
   frac(pi, 2 a) "sech"^2 #h(-0.16667em) (frac(pi x, a)) . $ <eq:strip-convolution>]

 In particular, with $c_a = 2 pi \/ a$,
#[#set math.equation(numbering: n => "(5.2)")
 $ 0 lt.eq F'' \( x \) lt.eq e^(c_a \| x \|) F'' \( 0 \) \, wide F \( x \) lt.eq
   frac(F'' \( 0 \), c_a^2) #scale(x: 120%, y: 120%)[\(] e^(c_a \| x \|) - 1 -
   c_a \| x \| #scale(x: 120%, y: 120%)[\)] . $ <eq:strip-curvature-growth>]

]
] <lem:strip-curvature>

#proof[
  Put $u \( x \, y \) = "Re" F \( x + i y \)$. Schwarz reflection makes $u$ even in $y$.
    We first justify Fourier transformation in the unbounded horizontal direction. Fix $a' < a_0$.
    Around each vertical segment ${ x + i y : \| y \| lt.eq a' }$ choose a rectangle of fixed width and height
    strictly inside the strip. On that rectangle the harmonic function $M_x - u$, with $M_x =
    C \( 1 + \| x \| \)$ and $C$ sufficiently large, is positive.
    Its value at $\( x \, 0 \)$ is at most $C \( 1 + \| x \| \)$ because $F \( x \) gt.eq 0$.
    Harnack’s inequality, followed by interior derivative estimates, gives
  $ \| u \( x \, y \) \| + \| partial_x^j partial_y^k u \( x \, y \) \| lt.eq
    C_(a' \, j \, k) \( 1 + \| x \| \) \, wide \| y \| lt.eq a' \, $
  where for derivatives one first uses a slightly larger closed substrip.
    Thus $u \( dot.op \, y \)$ and all derivatives needed below are tempered distributions, smoothly depending on $y$.
  Use the Fourier convention $hat(h) \( xi \) = integral e^(- i x xi) h \( x \) thin upright(d) x$.
    The harmonic equation becomes $partial_y^2 hat(u) = xi^2 hat(u)$.
    This equation is solved #emph[locally in frequency]: multiply by a smooth function of compact support in $xi$
    and solve the resulting distribution-valued ordinary differential equation.
    Multiplication by its fundamental matrix is then legitimate, since $xi$ remains in a compact set.
    The initial data are $hat(u) \( xi \, 0 \) = hat(F) \( xi \)$ and $partial_y hat(u) \( xi \, 0 \) = 0$. Consequently
  $ hat(u) \( xi \, a \) = cosh \( a xi \) hat(F) \( xi \) $
  on every compact frequency interval. We do not multiply an arbitrary tempered distribution globally by the
    exponentially growing function $cosh \( a xi \)$.
  The smooth function
  $ m_a \( xi \) = frac(xi^2, cosh \( a xi \) - 1) \, wide m_a \( 0 \) = 2 / a^2 \, $
  is Schwartz. The preceding local identity gives $m_a hat(g)_a = -
    xi^2 hat(F)$ on every compact frequency interval, and hence as tempered distributions.
    To identify its inverse Fourier transform, the substitution $r = e^(2 pi x \/ a)$ and the beta integral give
  $ hat(h)_a \( xi \) = integral_0^oo frac(r^(- i a xi \/ \( 2 pi \)), \( 1 + r \)^2) thin upright(d) r =
    frac(a xi \/ 2, sinh \( a xi \/ 2 \)) . $
  The value at zero is understood by continuity. It follows that $m_a = \( 2 \/ a^2 \) hat(h)_a^(thin 2)$,
    proving (5.1). The convolution is an ordinary convergent integral because $g_a$ has polynomial growth.
    Its distributional identity therefore holds pointwise.
  Both $h_a$ and $J_a$ are strictly positive Schwartz functions.
    Moreover, $\| h'_a \| lt.eq c_a h_a$, so differentiation under the convolution gives $\| J'_a \| lt.eq
    c_a J_a$. Hence $J_a \( x - t \) lt.eq e^(c_a \| x \|) J_a \( - t \)$.
    Since $g_a gt.eq 0$, integration proves the first inequality in (5.2).
    Integrating twice, using $F \( 0 \) = F' \( 0 \) = 0$ and evenness, proves the second. ◻
]

=== 5.2 A zero-field exponential bound <a-zero-field-exponential-bound>

#thm([Proposition 5.2.])[
  #emph[Fix $S$ and a sufficiently large finite $beta$. There are $R_0 = R_0 \( S \, beta \)$, $C_beta < oo$,
    and $kappa > 0$ with the following property. Let $L gt.eq R gt.eq R_0$, with $L$ even,
    and partition $Lambda_L$ into rectangular cells whose side lengths lie in $\[ R \/ 2 \, 4 R \]$.
    If $f : Lambda_L arrow.r \[ - 1 \, 1 \]$ has sum zero on every cell, then, for $q = R^(- 5 \/ 2)$, $b = -
    log \( 1 - q \)$, and any spin component $a$,
#[#set math.equation(numbering: n => "(5.3)")
 $ log ⟨exp (b x sum_(z in Lambda_L) f_z S_z^a)⟩ lt.eq C_beta b V \, wide x in bb(R) \, quad \| x \| lt.eq
   kappa log R . $ <eq:zero-exp>]

 Consequently there are $A_beta \, c > 0$ such that the spectral measurement of $D_f =
   sum_z f_z S_z^a$ in the zero-field state satisfies
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(P) {\| D_f \| > frac(A_beta V, log R)} lt.eq 2 e^(- c b V) . $ <eq:zero-tail>]

 All bounds are uniform over the indicated partitions and tests.]
] <prop:zero-field>

#proof[
  It suffices first to take $a = 3$ and put the field in direction $Y$. Write $D_f = sum_z f_z Z_z$ and define
  $ F \( z \) = frac(1, b V) log chevron.l e^(b z D_f) chevron.r_b . $
  Since $\[ H_0 \, M_L^2 \] = 0$, cyclicity of the trace gives
  $ chevron.l e^(b z D_f) chevron.r_b =
    frac("Tr"_(upright("phys")) #scale(x: 120%, y: 120%)[\(] e^(H_0) e^(b M_L^2 \/ 2) e^(b z D_f) e^(b M_L^2 \/ 2)
    #scale(x: 120%, y: 120%)[\)], "Tr"_(upright("phys")) e^(H_0 + b M_L^2)) . $
  The middle three factors form the restriction of a tensor product of single-slot sandwich matrices.
    Lemma 5, applied to $e^(b s^2 \/ 2) e^(b z f_z s^3) e^(b s^2 \/ 2)$,
    and Lemma 4 show that the expression inside the logarithm has no zeros in a fixed strip $\| "Im" z \| < a_0$.
    Here $R_0$ is large enough that $b lt.eq b_(*)$ from Lemma 5.
    Choose the analytic logarithm that is real on the real axis and vanishes at zero.
  This is the logarithm of an #emph[ordinary] Laplace transform:
    the spectral measure of $D_f$ in the tilted Gibbs state is a probability measure,
    even though $D_f$ need not commute with its density matrix.
    Rotation by $pi$ around the field axis makes this measure even.
    Therefore $F$ is even, $F \( x \) gt.eq 0$, and, since $parallel D_f parallel lt.eq S V$,
  $ "Re" F \( x + i y \) lt.eq F \( x \) lt.eq S \| x \| . $
  In particular,
  $ F'' \( 0 \) = b / V "Var"_b \( D_f \) = b / V chevron.l D_f^2 chevron.r_b lt.eq C_beta R^(- eta) $
  by Proposition 12, with $eta = 1 \/ 40$, and $b \/ q lt.eq 2$ for large $R$.
    This derivative is an ordinary variance, not the Duhamel covariance obtained by perturbing the Hamiltonian
    inside its exponential.
  Fix $a in \( 0 \, a_0 \)$ in Lemma 20. Choose $kappa > 0$ so that $c_a kappa < eta \/ 2$.
    Equation (5.2) then gives, uniformly over our tests,
  $ 0 lt.eq F \( x \) lt.eq C_beta R^(- eta \/ 2) \, wide \| x \| lt.eq kappa log R . $
  To remove the field, let $gamma_0$ and $gamma_b$ be the normalized zero-field and tilted density matrices.
    Since $H_0$ commutes with $M_L^2$ and $parallel M_L^2 parallel lt.eq S V$,
  $ gamma_0 lt.eq e^(2 b S V) gamma_b . $
  Taking the trace against the positive operator $e^(b x D_f)$ costs at most $2 b S
    V$ in its logarithm and proves (5.3) for $a = 3$. Rotation invariance of $gamma_0$ gives every common axis.
    Finally, exponential Markov at $x = plus.minus kappa log R$, with $kappa A_beta > C_beta + c$, proves (5.4). ◻
]

=== 5.3 Comparison through nested partitions <comparison-through-nested-partitions>

For a rectangular cell $C$ and an axis $a$, write

$ overline(S)_C^a = frac(1, \| C \|) sum_(x in C) S_x^a . $

All averages in a single fixed axis commute. The next proposition compares their ordinary squares;
  it makes no joint-measurement assertion about the three spin components.

#thm([Proposition 5.3.])[
  #emph[Fix $S$ and a sufficiently large finite $beta$. For every sufficiently large fixed $R_(*)$ and all
    sufficiently large even $L$, there is a deterministic rectangular partition $cal(P)_(*) \( L \)$ of $Lambda_L$
    whose side lengths lie in $\[ R_(*) \/ 2 \, 4 R_(*)^(10 \/ 9) \]$ and such that, for $a = 1 \, 2 \, 3$,
#[#set math.equation(numbering: n => "(5.5)")
 $ 1 / V sum_(C in cal(P)_(*) \( L \)) \| C \| ⟨\( overline(S)_C^a \)^2⟩ lt.eq ⟨\( M_L^a \/ V \)^2⟩ +
   frac(C_beta, log R_(*)) + o_L \( 1 \) . $ <eq:spatial-comparison>]

 Here $o_L \( 1 \) arrow.r 0$ at fixed $R_(*)$ and $beta$.]
] <prop:scale-comparison>

#proof[
  Set $R_0 = L$ and $R_(j + 1) = R_j^(9 \/ 10)$, and stop at the largest $n$ for which $R_n gt.eq R_(*)$.
    Starting with the one-cell partition, construct nested rectangular partitions $cal(P)_j$ with cell sides in
    $\[ R_j \/ 2 \, 4 R_j \]$. For example, subdivide each coordinate interval of a parent into nearly equal
    integer intervals of length comparable to $R_(j + 1)$. The ratios $R_j \/
    R_(j + 1)$ are large once $R_(*)$ is large, so every such subdivision meets the stated bounds.
    The final scale satisfies $R_(*) lt.eq R_n < R_(*)^(10 \/ 9)$.
  Fix an axis and perform its simultaneous site-spin measurement.
    Let $D \( C \)$ denote the measured value of $overline(S)_C^a$.
    For one refinement, put $R = R_j$, $r = R_(j + 1)$, and define
  $ T_j = 1 / V sum_(B in cal(P)_j) sum_(C in cal(P)_(j + 1)\
C subset B) \| C \| thin \| D \( C \) - D \( B \) \| . $
  To express $T_j$ through the tests of Proposition 21, assign a sign $sigma_C in { - 1 \, 1 }$ to every child and put
  $ macron(sigma)_B = frac(1, \| B \|) sum_(C subset B) \| C \| sigma_C \, wide f_x =
    frac(sigma_C - macron(sigma)_B, 2) quad \( x in C subset B \) . $
  Then $\| f_x \| lt.eq 1$ and $sum_(x in B) f_x = 0$. Direct expansion gives
  $ sum_x f_x S_x^a = 1 / 2 sum_(B \, C subset B) \| C \| sigma_C #scale(x: 120%, y: 120%)[\(] D \( C \) -
    D \( B \) #scale(x: 120%, y: 120%)[\)] $
  in this measurement. Maximizing over the signs therefore gives $V T_j \/ 2$.
    There are at most $exp \( C V \/ r^3 \)$ sign choices, because every child has volume at least
    $\( r \/ 2 \)^3$. Applying (5.4) to each test and taking a union bound yields
  $ bb(P) { T_j > 2 A_beta \/ log R } lt.eq 2 exp { C V R^(- 27 \/ 10) - c b V } lt.eq
    2 exp \( - c' V R^(- 5 \/ 2) \) . $
  The last inequality holds uniformly after increasing $R_(*)$, since $b gt.eq R^(- 5 \/ 2)$ and $R^(- 27 \/ 10) =
    o \( R^(- 5 \/ 2) \)$.
  As $\| D \( C \) - D \( B \) \| lt.eq 2 S$, this also bounds the expected weighted square increment:
  $ bb(E) [1 / V sum_(B \, C subset B) \| C \| \( D \( C \) - D \( B \) \)^2] lt.eq frac(C_beta, log R_j) +
    C exp \( - c' V R_j^(- 5 \/ 2) \) . $
  The squares telescope exactly, because $D \( B \)$ is the weighted mean of its children’s averages:
  $ sum_(C in cal(P)_(j + 1)) \| C \| D \( C \)^2 - sum_(B in cal(P)_j) \| B \| D \( B \)^2 =
    sum_(B \, C subset B) \| C \| \( D \( C \) - D \( B \) \)^2 . $
  Now $sum_(j < n) \( log R_j \)^(- 1) lt.eq C \/ log R_(*)$, whereas $V R_j^(- 5 \/ 2) gt.eq L^(1 \/ 2)$ and $n =
    O \( log log L \)$. Summing the expected increments proves (5.5) with $cal(P)_(*) \( L \) = cal(P)_n$.
    The deterministic construction works for all three axes. ◻
]

== 6 Equilibrium states and vanishing replica cross terms <sec:equilibrium>

The spatial estimate has a second use besides comparing block averages:
  it removes certain couplings between independent replicas at a pressure tangent.
  We give the variational framework first, including the precise order of limits needed for this deduction.
  The underlying lattice is now $bb(Z)^3$, with the spin-$S$ matrix algebra at each site.
  A state is a consistent family of density matrices on finite sets,
  or equivalently a positive normalized functional on the norm closure of the local matrix algebras.
  Local convergence means convergence on every local observable.
  Write $cal(S)_(upright("TI"))$ for the compact convex set of translation-invariant states,
  and $tau_x$ for translation by $x$.

=== 6.1 The variational principle and its tangents <the-variational-principle-and-its-tangents>

For a density matrix $rho$, let $sans(S) \( rho \) = - "Tr" \( rho log rho \)$.
  If $Q_n = { 0 \, dots.h \, n - 1 }^3$ and $omega in cal(S)_(upright("TI"))$,
  its mean entropy and unperturbed interaction expectation per site are

$ frak(s) \( omega \) = lim_(n arrow.r oo) frac(sans(S) \( omega_(Q_n) \), \| Q_n \|) \, wide e_0 \( omega \) =
  beta sum_(r = 1)^3 omega \( upright(bold(S))_0 dot.op upright(bold(S))_(e_r) \) . $

For a self-adjoint local observable $a$, let $A_L = sum_(x in Lambda_L) tau_x \( a \)$,
  interpreted periodically for $L$ larger than its support, and set

$ P_a \( t \) = lim_(L arrow.r oo) 1 / V log "Tr" e^(H_0 + t A_L) \, wide t in bb(R) . $

The limit uses even $L$, as elsewhere. Finite range and boundedness make free and periodic boundary conditions
  equivalent for this limit: the difference of their exponents has norm $O \( L^2 \)$.

The following standard variational facts are recalled with proofs to specify the state space on which the later
  tangent is taken; see #cite(label("LanfordRobinson1968Entropy")) Theorems 2–3 and
  #cite(label("LanfordRobinson1968Spin")) Theorem 3.

#thm([Proposition 6.1.])[
  #emph[The mean entropy exists on $cal(S)_(upright("TI"))$, is upper semicontinuous and affine, and
#[#set math.equation(numbering: n => "(6.1)")
 $ P_a \( t \) = max_(omega in cal(S)_(upright("TI"))) { frak(s) \( omega \) + e_0 \( omega \) +
   t omega \( a \) } . $ <eq:variational-pressure>]

 In particular, writing $P_0 = beta p_(S \, beta) \( 0 \)$, the set
$ cal(E)_beta = { omega in cal(S)_(upright("TI")) : frak(s) \( omega \) + e_0 \( omega \) = P_0 } $

 is a nonempty compact face of $cal(S)_(upright("TI"))$. Every local limit of periodic zero-field Gibbs states
   belongs to $cal(E)_beta$, and
#[#set math.equation(numbering: n => "(6.2)")
 $ P'_a \( 0 + \) = max_(omega in cal(E)_beta) omega \( a \) . $ <eq:pressure-tangent>]

 The extreme points of $cal(E)_beta$ are precisely its states that are extreme in $cal(S)_(upright("TI"))$;
   we call these states ergodic.]
] <prop:variational-framework>

#proof[
  Tile a large cube by translates of $Q_n$ and a remainder of vanishing relative volume.
    Entropy subadditivity and the bound $sans(S) \( rho_B \) lt.eq \| B \| log \( 2 S + 1 \)$ show that
  $ frak(s) \( omega \) = inf_(n gt.eq 1) frac(sans(S) \( omega_(Q_n) \), \| Q_n \|) . $
  This proves existence and upper semicontinuity, since each finite-volume entropy is continuous.
    For a mixture $rho = lambda rho_1 + \( 1 - lambda \) rho_2$,
    the entropy lies between $lambda sans(S) \( rho_1 \) + \( 1 - lambda \)
    sans(S) \( rho_2 \)$ and this quantity plus the binary entropy of $lambda$.
    Division by volume proves affinity of $frak(s)$.
  Apply the finite-dimensional Gibbs variational principle to the restriction of any $omega in
    cal(S)_(upright("TI"))$ to a large cube. Boundary terms are $o \( V \)$ in norm, so $P_a \( t \) gt.eq
    frak(s) \( omega \) + e_0 \( omega \) + t omega \( a \)$.
    Conversely, choose a locally convergent subsequence of periodic Gibbs states for $H_0 + t A_L$,
    with limit $omega$. The limit is translation invariant, and local interaction expectations converge.
    Tiling the large cubes by fixed cubes $Q_n$ gives
  $ limsup_(L arrow.r oo) frac(sans(S) \( gamma_(L \, t) \), V) lt.eq
    frac(sans(S) \( omega_(Q_n) \), \| Q_n \|) quad upright("for every ") n . $
  Letting $n arrow.r oo$ and using the exact finite-volume Gibbs identity gives the reverse variational
    inequality. At $t = 0$ this argument also proves the assertion about every periodic Gibbs local limit.
    Compactness, upper semicontinuity, and affinity show that $cal(E)_beta$ is a nonempty compact face;
    the assertion about its extreme points follows from the definition of a face.
  For completeness, a maximizer $omega_t$ in (6.1), with $t > 0$, satisfies
  $ max_(omega in cal(E)_beta) omega \( a \) lt.eq frac(P_a \( t \) - P_0, t) lt.eq omega_t \( a \) . $
  As $t arrow.b 0$, upper semicontinuity shows that every local limit of $omega_t$ belongs to $cal(E)_beta$:
    its unperturbed variational value tends to $P_0$, since $\| omega_t \( a \) \| lt.eq parallel a parallel$.
    Taking a convergent subsequence proves (6.2). ◻
]

In the field direction $Y$, the exponent-normalized pressure is $beta p_(S \, beta) \( b \/ beta \)$. Thus

#[#set math.equation(numbering: n => "(6.3)")
 $ m = max_(omega in cal(E)_beta) omega \( Y_0 \) . $ <eq:magnetization-max>]

Rotation invariance gives the same maximum in every unit direction.
  Consequently the vector
  $upright(bold(m)) \( omega \) = \( omega \( X_0 \) \, omega \( Y_0 \) \, omega \( Z_0 \) \)$ has length at most
  $m$ for every $omega in cal(E)_beta$. The face maximizing $omega \( Y_0 \)$ has an extreme point,
  so an ergodic equilibrium state attains $m$. Section 7 will prove that every ergodic equilibrium state has this
  same magnetization magnitude.

The following mean-ergodic consequence of extremality is standard for asymptotically commuting lattice
  translations; see #cite(label("KastlerRobinson1966")) Theorem 3.

#thm([Lemma 6.2.])[
  (Ergodic averages).  #emph[If $omega$ is an extreme translation-invariant state and $A$ is a self-adjoint local
    observable, then
$ lim_(n arrow.r oo) omega
  [(frac(1, \| Q_n \|) sum_(x in Q_n) tau_x \( A \) - omega \( A \) upright(bold(1)))^2] = 0 . $

]
] <lem:ergodic-variance>

#proof[
  After shifting and scaling, assume $0 lt.eq A lt.eq upright(bold(1))$, and denote its average by $macron(A)_n$.
    In the Hilbert space of the state, translations are commuting unitaries.
    The mean ergodic theorem makes $macron(A)_n Omega$ converge to a vector $eta$,
    where $Omega$ represents the state. Hence $lambda \( C \) =
    lim_n omega \( C macron(A)_n \)$ exists for every local $C$.
  For local $C gt.eq 0$, locality gives $parallel \[ C^(1 \/ 2) \, macron(A)_n \] parallel arrow.r 0$.
    Therefore $lambda \( C \) = lim_n omega \( C^(1 \/ 2) macron(A)_n C^(1 \/ 2) \)$, and $0 lt.eq
    lambda \( C \) lt.eq omega \( C \)$. The functional extends continuously,
    is translation invariant by the boundary-to-volume estimate for the averages,
    and satisfies $lambda \( upright(bold(1)) \) = omega \( A \)$.
    Extremality of $omega$ now gives $lambda = omega \( A \) omega$:
    otherwise its normalized parts in $omega = lambda + \( omega - lambda \)$ would give a nontrivial convex
    decomposition into translation-invariant states. Testing on the dense set of local vectors identifies $eta =
    omega \( A \) Omega$, which is the asserted variance convergence. ◻
]

=== 6.2 Products of zero-sum observables in distinct replicas <products-of-zero-sum-observables-in-distinct-replicas>

Take $j$ copies of the spin system, with superscripts $\[ r \]$ denoting the replica.
  The unperturbed exponent is $sum_(r = 1)^j H_0^(\[ r \])$, and its pressure is $j P_0$.
  Every translation-invariant equilibrium state for this interaction has each marginal in $cal(E)_beta$.
  Indeed, entropy subadditivity between replicas bounds its variational value by the sum of the marginal
  variational values, each at most $P_0$; equality of the total forces equality for each marginal.
  Conversely, products of states in $cal(E)_beta$ are replicated equilibrium states,
  because their entropies and interaction expectations add.

For real coefficients $v_i$ on finitely many qubit slots, define

$ D_v^a = sum_i v_i s_i^a \, wide B_v^a = P_(*) D_v^a P_(*) $

as a physical local operator. On a site’s symmetric subspace, $P_(*) s_(\( x \, k \))^a P_(*) = S_x^a \/ ell$. Thus

#[#set math.equation(numbering: n => "(6.4)")
 $ B_v^a = sum_x c_x S_x^a \, wide c_x = 1 / ell sum_(k = 1)^ell v_(\( x \, k \)) \, wide sum_x c_x = 0 quad
   upright("if ") sum_i v_i = 0 . $ <eq:compressed-zero-sum>]

The next lemma concerns products of these #emph[compressed] operators in different replicas.
  It does not identify $P_(*) \( D_v^a \)^2 P_(*)$ with $\( B_v^a \)^2$.

#thm([Lemma 6.3.])[
  (Replica cross terms).  #emph[Fix $S$ and a sufficiently large finite $beta$.
    Let $omega$ be any translation-invariant equilibrium state of $j$ unperturbed replicas.
    For distinct replicas $r \, s$, axes $a \, b$, and finitely supported real slot coefficients $v \,
    w$ with $sum_i v_i = sum_i w_i = 0$,
$ omega #scale(x: 120%, y: 120%)[\(] \( B_v^a \)^(\[ r \]) \( B_w^b \)^(\[ s \]) #scale(x: 120%, y: 120%)[\)] = 0 . $

 The same holds for every finite linear combination of translates of such products.]
] <lem:replica-cross>

#proof[
  Write $O = \( B_v^a \)^(\[ r \]) \( B_w^b \)^(\[ s \])$ and choose a fixed cube of side $d$ containing both
    spatial supports. Let $rho_L$ be the restriction of $omega$ to a cube of side $L$,
    and let $gamma_L$ be the product of the $j$ periodic zero-field Gibbs density matrices on that cube.
    With $D \( rho bar.v.double gamma \) = "Tr" rho \( log rho - log gamma \)$,
  #[#set math.equation(numbering: n => "(6.5)")
   $ 1 / V D \( rho_L bar.v.double gamma_L \) arrow.r 0 . $ <eq:replica-relative-entropy>]
  Indeed, expanding $log gamma_L$ gives $j$ times the finite-volume pressure minus the entropy density and
    interaction density of $rho_L$. Their limits cancel by the equilibrium variational identity;
    periodic bonds at the boundary change the interaction by $o \( V \)$.
  Fix an integer $R gt.eq d$ and take $L$ through even multiples of $R$.
    Partition the cube into cells of side $R$, and let $cal(T)$ be the translations of the chosen support cube
    lying wholly within individual cells. In particular,
  $ frac(\| cal(T) \|, V) = (frac(R - d + 1, R))^3 . $
  Write $B_v^a = sum_x c_x S_x^a$ and $B_w^b = sum_x d_x S_x^b$, as in (6.4).
    Choose $C_O gt.eq max { 1 \, S parallel c parallel_1 parallel d parallel_1 }$ and put
  $ O' = 1 / C_O sum_(y in cal(T)) tau_y \( O \) . $
  All operators in this sum can be measured simultaneously,
    using axis $a$ in replica $r$ and axis $b$ in replica $s$.
    Conditional on any outcome in replica $s$, denote the value of $tau_y \( B_w^b \)^(\[ s \])$ by $b_y$,
    so $\| b_y \| lt.eq S parallel d parallel_1$. As a function of the first replica’s outcomes,
    $O'$ is then $sum_z f_z S_z^a$, where
  $ f_z = 1 / C_O sum_(y in cal(T)) c_(z - y) b_y . $
  These coefficients have absolute value at most one. Their sum in each cell vanishes,
    since each translated support stays in that cell and $sum_x c_x = 0$.
    Independence of the replicas under $gamma_L$ and Proposition 21, applied conditionally, therefore give
  #[#set math.equation(numbering: n => "(6.6)")
   $ log "Tr" \( gamma_L e^(plus.minus theta O') \) lt.eq C_beta b V \, wide b = - log \( 1 - R^(- 5 \/ 2) \) \,
     quad theta = kappa b log R . $ <eq:replica-exponential>]
  For any self-adjoint $K$, the Gibbs variational principle followed by the Golden–Thompson inequality
    #cite(label("Golden1965")) #cite(label("Thompson1965")) gives
  $ "Tr" \( rho_L K \) lt.eq D \( rho_L bar.v.double gamma_L \) + log "Tr" e^(log gamma_L + K) lt.eq
    D \( rho_L bar.v.double gamma_L \) + log "Tr" \( gamma_L e^K \) . $
  Use $K = theta O'$ or $K = - theta O'$ according to the sign of $omega \( O \)$.
    Translation invariance and (6.6) yield
  $ theta frac(\| cal(T) \|, C_O) \| omega \( O \) \| lt.eq D \( rho_L bar.v.double gamma_L \) + C_beta b V . $
  First let $L arrow.r oo$ at this fixed $R$; this order is required because the entropy density in (6.5) has no
    rate. For large $R$, $\| cal(T) \| \/ V$ is bounded below, and we obtain $\| omega \( O \) \| lt.eq
    C_(beta \, O) \/ log R$. Letting $R arrow.r oo$ proves the claim. Linearity gives the final assertion. ◻
]

Thus, for a finite-range replica perturbation that is a sum of single-replica terms and the cross terms in
  Lemma 25, its pressure tangent depends only on the single-replica terms.
  The construction in the next section uses this fact to study negative squares of block magnetizations.

== 7 Pressure tangents and the equilibrium magnetization radius <sec:pressure>

The variational principle bounds the magnetization of every state in $cal(E)_beta$ by $m$.
  We now prove that every ergodic member has magnetization of length exactly $m$.
  The obstruction to a smaller radius will be analyticity of certain pressure tangents.
  To obtain that analyticity, we construct random transfer matrices whose traces are nonzero before taking
  expectations; Lemma 25 then identifies the pressure tangents of their moments.

For an integer $r gt.eq 2$, write $C_r = { 0 \, dots.h \, r - 1 }^3$,
  and let $cal(C)_r$ denote all its translates, on the lattice or on a sufficiently large torus.
  For any such cube $C$, put $X_C = sum_(x in C) X_x$, and define $Y_C \, Z_C$ in the same way.
  Fix $B gt.eq 2$ and $W gt.eq 2 B$. We will choose a constant $D_B > 0$, independent of $W$,
  and consider the nonpositive local observable

#[#set math.equation(numbering: n => "(7.1)")
 $ a_(B \, W) = - Y_(C_B)^2 / B^6 - D_B frac(X_(C_W)^2 + Z_(C_W)^2, W^6) . $ <eq:negative-square-local>]

In an ergodic state with magnetization vector $\( 0 \, r \, 0 \)$, the transverse term tends to zero as $W arrow.r
  oo$ at fixed $B$, while the $Y$ term tends to $- r^2$ as $B arrow.r oo$, by Lemma 24.
  The periodic sum of $a_(B \, W)$ is denoted by $A_(B \, W \, L) = sum_(x in Lambda_L) tau_x \( a_(B \, W) \)$. Define

#[#set math.equation(numbering: n => "(7.2)")
 $ s_(B \, W) \( x \) = max_(omega in cal(E)_beta) { omega \( a_(B \, W) \) + x omega \( Y_0 \) } \, wide
   x in bb(R) . $ <eq:square-tangent>]

This function is convex and $S$-Lipschitz. It is even: a rotation by $pi$ around the $X$-axis preserves
  $a_(B \, W)$ and sends $Y_0$ to $- Y_0$.

#thm([Proposition 7.1.])[
  (Harmonic pressure tangent).  #emph[For every integer $B gt.eq 2$ there is $D_B > 0$ such that,
    for every integer $W gt.eq 2 B$, the function in (7.2) has a harmonic extension $v_(B \, W)$ from the positive
    real axis to $bb(H) = { z in bb(C) : Re z > 0 }$ satisfying
#[#set math.equation(numbering: n => "(7.3)")
 $ v_(B \, W) \( x \) = s_(B \, W) \( x \) quad \( x > 0 \) \, wide v_(B \, W) \( z \) lt.eq
   s_(B \, W) \( Re z \) quad \( z in bb(H) \) . $ <eq:harmonic-tangent>]

]
] <prop:harmonic-tangent>

We prove the proposition in the next three subsections. We first express the negative squares in (7.1) as
  infinitesimal contributions of real single-slot matrices,
  together with a small reduction of the ferromagnetic coupling.
  Shared Gaussian coefficients then turn moments of the random traces into replicated pressures.
  Finally a second-moment argument selects nonvanishing traces whose logarithms converge to the required harmonic
  function.

=== 7.1 A Laplacian construction for the negative squares <a-laplacian-construction-for-the-negative-squares>

Recall that there are $ell = 2 S$ slots per site and that $P_(*)$ projects onto the physical spin space.
  For a real vector $v = \( v_i \)$ on finitely many slots, write

$ D_v^a = sum_i v_i s_i^a . $

Our generators will be $i D_v^2$ and $D_v^1 \, D_v^3$, with $sum_i v_i = 0$.
  All three are real matrices in the $s^3$ basis, and their exponentials with real coefficients are products of
  single-slot matrices in $S L_2 \( bb(R) \)$. Squaring $i D_v^2$ contributes a negative square in the
  $Y$-direction. The other two generators contribute positive squares;
  the reduction of the static coupling will cancel their unwanted nearest-neighbor coefficients.

All quadratic coefficients below use #emph[ordered] slot pairs:

$ \( D_v^a \)^2 = sum_(i \, j) v_i v_j s_i^a s_j^a . $

For a cube $C$, let $L_C^(upright("full"))$ be the graph Laplacian of the complete graph on its $ell \|
  C \|$ slots. Let $L_C^(upright("bond"))$ be the Laplacian with an edge between every pair of slots whose sites
  are nearest neighbors inside $C$. Thus an off-diagonal Laplacian entry is $- 1$ on an edge.
  These matrices are extended by zero when used on a larger slot set.

The bond graph of $C_B$ is connected. Consequently one can choose $c_B > 0$ so that, for every $C in cal(C)_B$,

#[#set math.equation(numbering: n => "(7.4)")
 $ Q_C = c_B L_C^(upright("bond")) - B^(- 6) L_C^(upright("full")) gt.eq 0 . $ <eq:small-cube-covariance>]

Indeed, both matrices annihilate the constant vector, and on its orthogonal complement the bond Laplacian is
  positive definite while $L_C^(upright("full")) = ell B^3 I$.
  Decompose $Q_C$ spectrally as $sum_v v v^(sans(T))$. Every vector in this sum is real and has zero sum;
  use the generators $i D_v^2$ for this list.

To cancel the remaining static reduction in the $X \, Z$ directions, put $n_(B \, W) = \( W - B + 1 \)^3$ and,
  for $C in cal(C)_W$, consider

#[#set math.equation(numbering: n => "(7.5)")
 $ R_C = D_B W^(- 6) L_C^(upright("full")) - c_B / n_(B \, W) sum_(C' in cal(C)_B\
C' subset.eq C) L_(C')^(upright("bond")) . $ <eq:large-cube-covariance>]

The constant $D_B$ can be chosen so that $R_C gt.eq 0$ for every $W gt.eq 2 B$. Here is a uniform bound.
  Each slot belongs to at most $B^3$ small cubes, and its degree in each bond graph is at most $6 ell$.
  The sum of the bond Laplacians therefore has norm at most $12 ell B^3$.
  Since $n_(B \, W) gt.eq W^3 \/ 8$, the second term in (7.5) has norm at most $96 c_B ell B^3 \/ W^3$.
  On the zero-sum subspace, the first term is $D_B ell \/ W^3$ times the identity. Thus, for example,

#[#set math.equation(numbering: n => "(7.6)")
 $ D_B = 96 c_B B^3 + 1 $ <eq:DB-choice>]

suffices. Decompose each $R_C$ as $sum_v v v^(sans(T))$ with real zero-sum vectors,
  and use both generators $D_v^1$ and $D_v^3$. Choose the lists on one cube of each size and translate them.
  The resulting families are translation invariant.

Let $T_(B \, L)$ be the physical compression of the static reduction

#[#set math.equation(numbering: n => "(7.7)")
 $ - c_B sum_(C in cal(C)_B) sum_(i \, j upright(" slots in ") C\
x_i \, x_j upright(" nearest neighbors")) sum_(a = 1)^3 s_i^a s_j^a \, $ <eq:static-reduction>]

where the inner sum is ordered. Each unordered site bond belongs to $\( B - 1 \) B^2$ translates of $C_B$, so

$ H_(0 \, t) := H_0 + t T_(B \, L) = #scale(x: 120%, y: 120%)[\(] beta -
  2 t c_B \( B - 1 \) B^2 #scale(x: 120%, y: 120%)[\)] sum_({ x \, y } upright(" bond")) upright(bold(S))_x dot.op
  upright(bold(S))_y . $

For fixed $B$ this remains ferromagnetic for all sufficiently small $t > 0$, uniformly in $L > 2 W$.

Denote all the generators just constructed by $G_alpha$. Their quadratic contribution is compressed #emph[after
  squaring]:

#[#set math.equation(numbering: n => "(7.8)")
 $ T_(B \, L) + sum_alpha P_(*) G_alpha^2 P_(*) = A_(B \, W \, L) + C_(B \, W) V I $ <eq:pulse-identity>]

on physical space, for a real scalar $C_(B \, W)$ independent of $L > 2 W$.
  To check the identity, first consider distinct slots $i \, j$ in the cube $C$ under consideration.
  If $E_C \( i \, j \)$ is the indicator of an edge of the bond graph,
  the coefficients from a small cube in the $Y$-direction are

$ underbrace(- c_B E_C \( i \, j \), upright("static reduction")) +
  underbrace(#scale(x: 120%, y: 120%)[\(] c_B E_C \( i \, j \) - B^(- 6) #scale(x: 120%, y: 120%)[\)], - \(
  Q_C \)_(i j)) = - B^(- 6) . $

For either the $X$- or the $Z$-direction, the contribution from a large cube is

$ \( R_C \)_(i j) = - D_B W^(- 6) + c_B / n_(B \, W) sum_(C' in cal(C)_B\
C' subset.eq C) E_(C') \( i \, j \) . $

Every small cube lies in exactly $n_(B \, W)$ large cubes.
  After summing over translates, the second term cancels the static reduction, leaving the coefficient $-
  D_B W^(- 6)$ on each ordered pair in each large cube. These are precisely the off-diagonal coefficients of
  $A_(B \, W \, L)$. The remaining terms have $i = j$ and are scalar because $\( s_i^a \)^2 = I \/ 4$;
  translation invariance gives the scalar in (7.8). In particular,
  the identity does not replace $P_(*) G_alpha^2 P_(*)$ by $\( P_(*) G_alpha P_(*) \)^2$,
  which would in general give different single-replica terms.

=== 7.2 Nonvanishing random traces and replicated moments <nonvanishing-random-traces-and-replicated-moments>

Fix $B \, W$ and a sufficiently small $t > 0$. For an even $L > 2 W$ and an integer $k gt.eq 1$,
  take independent real centered Gaussian variables $lambda_(r \, alpha)$, $1 lt.eq r lt.eq k$,
  of variance $2 t \/ k$. Fix an order of the generators and define a slot-space layer

$ U_r \( z \) = (product_alpha e^(lambda_(r \, alpha) G_alpha)) e^(\( t z \/ k \) sum_i s_i^2) . $

Only the complete layer is compressed. With all products taken in their fixed order,
  define the normalized random entire function

#[#set math.equation(numbering: n => "(7.9)")
 $ cal(Z)_(L \, k \, t) \( z \) = frac(e^(- t C_(B \, W) V), "Tr" e^(H_0)) "Tr"_(upright("phys"))
   product_(r = 1)^k
   [e^(H_(0 \, t) \/ k) #scale(x: 120%, y: 120%)[\(] P_(*) U_r \( z \) P_(*) #scale(x: 120%, y: 120%)[\)]] .
   $ <eq:random-partition>]

Gaussian exponential moments ensure that all finite products of these functions are integrable,
  locally uniformly in their arguments.

Every realization of (7.9) is nonzero on $bb(H)$. Although the pulse supports overlap,
  their fixed ordered product is still a tensor product of single-slot matrices:
  factors on different slots commute and can be regrouped without changing the order on any one slot.
  All pulse matrices on a slot lie in $S L_2 \( bb(R) \)$ and hence act as disk automorphisms in the $s^2$ basis,
  by Lemma 5. On every slot the remaining factor $e^(t z s^2 \/ k)$ sends the closed disk strictly inside the disk
  when $Re z > 0$. Their composition therefore has the strict mapping property of Lemma 4.
  To identify the permutation layers, write $E$ for the full-slot exponential of the static interaction with time
  step $1 \/ k$. It commutes with $P_(*)$, and cyclicity gives

$ "Tr"_(upright("phys")) product_(r = 1)^k \[ e^(H_(0 \, t) \/ k) \( P_(*) U_r \( z \) P_(*) \) \] =
  "Tr"_(upright("slots")) product_(r = 1)^k \[ \( E P_(*) \) U_r \( z \) \] . $

Each $E P_(*)$ has nonnegative exchange rates and a symmetric seam,
  so it is a permutation layer of the class allowed in that lemma.
  The identity uses $P_(*)^2 = P_(*)$ and does not require $U_r$ to preserve physical space.
  This proves samplewise nonvanishing, and in particular

#[#set math.equation(numbering: n => "(7.10)")
 $ z mapsto frac(1, t V) log \| cal(Z)_(L \, k \, t) \( z \) \| quad
   upright("is harmonic on ") bb(H) . $ <eq:sample-harmonic>]

Complex conjugation has a specific sign here. The static matrices,
  the projections and all pulses are real in the $s^3$ basis, whereas $s^2$ is purely imaginary.
  Therefore, for the #emph[same] Gaussian sample,

#[#set math.equation(numbering: n => "(7.11)")
 $ overline(cal(Z)_(L \, k \, t) \( z \)) = cal(Z)_(L \, k \, t) \( - overline(z) \) . $ <eq:sample-conjugation>]

The argument on the right may lie outside $bb(H)$; the function is entire, so this causes no difficulty.
  In particular its second moment uses the pair $\( z \, - overline(z) \)$, not $\( z \, overline(z) \)$.

We next compute products of traces using replicas, always sharing the Gaussian variables between replicas.
  For fixed $j$ and arguments $z_1 \, dots.h \, z_j in bb(C)$, the finite-dimensional product formula gives

#[#set math.equation(numbering: n => "(7.12)")
 $ lim_(k arrow.r oo) bb(E) product_(r = 1)^j cal(Z)_(L \, k \, t) \( z_r \) & =
   cal(R)_(L \, t)^(\( j \)) \( z_1 \, dots.h \, z_j \)\
 & := frac("Tr" exp #h(-0.16667em) {sum_(r = 1)^j #scale(x: 120%, y: 120%)[\(] H_0^(\[ r \]) +
   t A_(B \, W \, L)^(\[ r \]) + t z_r M_L^(2 \, \[ r \]) #scale(x: 120%, y: 120%)[\)] +
   t A_(upright("cross") \, L)^(\( j \))}, \( "Tr" e^(H_0) \)^j) . $ <eq:replicated-moment>]

The limit is locally uniform in the arguments. To verify both the limit and its cross terms,
  let $P^(\( j \))$ be the product of the physical projections in all replicas. For one shared Gaussian variable,

$ bb(E) exp #h(-0.16667em) (lambda sum_(r = 1)^j G_alpha^(\[ r \])) =
  exp #h(-0.16667em) (t / k (sum_(r = 1)^j G_alpha^(\[ r \]))^2) . $

Independence allows these expectations to be taken in the prescribed pulse order.
  After the outer compression, the first-order term is the following operator on physical replica space:

#[#set math.equation(numbering: n => "(7.13)")
 $ P^(\( j \)) (sum_(r = 1)^j G_alpha^(\[ r \]))^2 P^(\( j \)) =
   sum_(r = 1)^j \( P_(*) G_alpha^2 P_(*) \)^(\[ r \]) +
   2 sum_(r < s) \( P_(*) G_alpha P_(*) \)^(\[ r \]) \( P_(*) G_alpha P_(*) \)^(\[ s \]) . $ <eq:compression-replicas>]

For an imaginary-direction generator $G_alpha = i D_v^2$, the cross product on the right is

$ - \( P_(*) D_v^2 P_(*) \)^(\[ r \]) \( P_(*) D_v^2 P_(*) \)^(\[ s \]) . $

For the other two directions it has the positive sign. Thus

$ A_(upright("cross") \, L)^(\( j \)) =
  2 sum_alpha sum_(r < s) \( P_(*) G_alpha P_(*) \)^(\[ r \]) \( P_(*) G_alpha P_(*) \)^(\[ s \]) $

is self-adjoint, finite range and translation invariant. Every one of its local summands is a real multiple of a
  cross term in Lemma 25, since all the vectors $v$ have zero sum.

Using (7.8) and distributing the scalar correction in (7.9) among the $k$ steps,
  the expected replicated step is $I + k^(- 1) cal(H) + O \( k^(- 2) \)$,
  where $cal(H)$ is the exponent in (7.12). Here $B \, W \, j \, t \,
  L$ are fixed and the error is locally uniform in $\( z_1 \, dots.h \, z_j \)$.
  Independence between time steps makes the expected product the $k$th power of this deterministic step.
  The matrix product limit #cite(label("Trotter1959")) proves (7.12).

For real $x_1 \, dots.h \, x_j$, the numerator defining $cal(R)_(L \, t)^(\( j \))$ is positive.
  The thermodynamic limit followed by the right pressure tangent gives

#[#set math.equation(numbering: n => "(7.14)")
 $ lim_(t arrow.b 0) lim_(L arrow.r oo) frac(1, t V) log cal(R)_(L \, t)^(\( j \)) \( x_1 \, dots.h \, x_j \) =
   sum_(r = 1)^j s_(B \, W) \( x_r \) . $ <eq:real-replica-tangent>]

Indeed, by (6.2), the left side is the maximum of the perturbation density over equilibrium states of the
  unperturbed replicated interaction. Lemma 25 makes the cross density vanish in every such state.
  Each marginal belongs to $cal(E)_beta$, giving the upper bound by the sum on the right.
  The product of maximizing single-replica states is an equilibrium state and attains that sum. This proves equality.

We also need an upper bound at complex arguments. For self-adjoint matrices $A \, B$,

#[#set math.equation(numbering: n => "(7.15)")
 $ \| "Tr" e^(A + i B) \| lt.eq "Tr" e^A . $ <eq:complex-trace-bound>]

For completeness, apply the product formula to $\( e^(A \/ n) e^(i B \/ n) \)^n$ and then Schatten Hölder:
  its trace norm is at most $parallel e^(A \/ n) parallel_n^n = "Tr" e^A$,
  since the intervening factors are unitary. Taking the limit proves the inequality.
  Applied to (7.12), it bounds its absolute value by $cal(R)_(L \, t)^(\( j \)) \( Re z_1 \, dots.h \, Re z_j \)$.

The limits in (7.14) are uniform on compact sets of real arguments in their stated order.
  Indeed the normalized log traces are $S$-Lipschitz in each real argument, uniformly in $L \, t$,
  by the norm bound $parallel M_L^2 parallel lt.eq S V$; finite nets promote pointwise convergence to uniform
  convergence. The same bound holds for their limits. Combining this observation with (7.11), (7.12) and (7.15),
  we obtain the following useful finite parameter statement.
  Given a compact $K subset bb(H)$, finitely many positive real points $x_1 \, dots.h \, x_q$,
  and $epsilon.alt > 0$, one can choose $t > 0$ sufficiently small, then an even $L$ sufficiently large,
  and finally $k$ sufficiently large, so that, with $T = t V$ and $cal(Z) = cal(Z)_(L \, k \, t)$,

#[#set math.equation(numbering: n => "(7.16)")
 $ bb(E) \| cal(Z) \( z \) \|^2 & lt.eq exp { T \( 2 s_(B \, W) \( Re z \) + epsilon.alt \) } \, wide z in K \,\
lr(|T^(- 1) log bb(E) U - 2 sum_(i = 1)^q s_(B \, W) \( x_i \)|) & lt.eq epsilon.alt \,\
lr(|T^(- 1) log bb(E) U^2 - 4 sum_(i = 1)^q s_(B \, W) \( x_i \)|) & lt.eq epsilon.alt \, wide U =
  product_(i = 1)^q \| cal(Z) \( x_i \) \|^2 . $ <eq:complex-second-moment>]

The parameter $T$ can be required to exceed any prescribed number, by enlarging $L$ after $t$ has been fixed.
  For the last two estimates, use the real argument lists $\( x_1 \, - x_1 \, dots.h \, x_q \, - x_q \)$ and twice
  that list, together with the evenness of $s_(B \, W)$. These products are nonnegative random variables at finite
  $k$. Their limits at fixed $t \, L$ are strictly positive,
  so the locally uniform product limit also gives the logarithmic estimates.
  For the first estimate it gives the required upper bound after the finite-volume parameters have been fixed,
  even when its exponential right side is small.

This order of choices is essential: the matrix product limit is taken at fixed volume;
  the pressure limit then precedes differentiation at $t = 0$.
  The finite estimates are implemented in the reverse order, choosing $t$, then $L$, then $k$.
  No zero-free assertion about an averaged partition function has been used.

=== 7.3 Selecting harmonic logarithms <selecting-harmonic-logarithms>

We isolate the analytic step to explain how moment information retains the samplewise nonvanishing just proved.

#thm([Lemma 7.2.])[
  (Selection from moment bounds).  #emph[Let $s : \( 0 \, oo \) arrow.r bb(R)$ be locally Lipschitz,
    and enumerate a countable dense subset $D = { x_1 \, x_2 \, dots.h }$ of $\( 0 \, oo \)$ with $x_1 = 1$.
    Suppose $F_n$ are random holomorphic functions that are almost surely nonzero on $bb(H)$, and $T_n arrow.r
    oo$. Assume, locally uniformly for $z in bb(H)$, that
#[#set math.equation(numbering: n => "(7.17)")
 $ limsup_(n arrow.r oo) {T_n^(- 1) log bb(E) \| F_n \( z \) \|^2 - 2 s \( Re z \)} lt.eq 0 . $ <eq:selection-upper>]

 For every $q gt.eq 1$, suppose also that, with $U_n = product_(i = 1)^q \| F_n \( x_i \) \|^2$,
#[#set math.equation(numbering: n => "(7.18)")
 $ T_n^(- 1) log bb(E) U_n arrow.r 2 sum_i s \( x_i \) \, wide T_n^(- 1) log bb(E) U_n^2 arrow.r
   4 sum_i s \( x_i \) . $ <eq:selection-products>]

 Then there is a harmonic function $v$ on $bb(H)$ with $v \( x \) =
   s \( x \)$ for every $x > 0$ and $v \( z \) lt.eq s \( Re z \)$ everywhere.]
] <lem:harmonic-selection>

#proof[
  Fix $q gt.eq 1$, a compact $K subset bb(H)$ containing $x_1 \, dots.h \, x_q$, and $delta > 0$.
    Put $h_n = T_n^(- 1) log \| F_n \|$. The Paley–Zygmund inequality #cite(label("PaleyZygmund1932")) and (7.18)
    give, for each $epsilon.alt > 0$ and all sufficiently large $n$,
  #[#set math.equation(numbering: n => "(7.19)")
   $ bb(P) { U_n gt.eq 1 / 2 bb(E) U_n } gt.eq frac(\( bb(E) U_n \)^2, 4 bb(E) U_n^2) gt.eq 1 /
     4 e^(- 3 epsilon.alt T_n) . $ <eq:selection-paley>]
  We compare this with the probability that $h_n$ exceeds $s \( Re z \) + delta$ somewhere on $K$.
  Cover $K$ by finitely many disks $D_j$ with concentric doubled disks $tilde(D)_j$ compactly contained in
    $bb(H)$, chosen so that the oscillation of $s \( Re z \)$ on each $tilde(D)_j$ is at most $delta \/ 4$.
    Write $s_j$ for its minimum there. The submean inequality for the nonnegative subharmonic function $\|
    F_n \|^2$ gives
  $ sup_(D_j) \| F_n \|^2 lt.eq C_j integral_(tilde(D)_j) \| F_n \( z \) \|^2 thin upright(d) A \( z \) . $
  Using (7.17), the expectation of the right side is at most $C'_j exp {
    T_n \( 2 s_j + delta \/ 2 + epsilon.alt \) }$ for large $n$.
    If $h_n \( z \) > s \( Re z \) + delta$ at any point of $D_j$,
    then its left side exceeds $exp { T_n \( 2 s_j + 2 delta \) }$.
    Markov’s inequality and a sum over the disks therefore yield
  #[#set math.equation(numbering: n => "(7.20)")
   $ bb(P) { h_n \( z \) > s \( Re z \) + delta upright(" for some ") z in K } lt.eq
     C_K e^(- \( 3 delta \/ 2 - epsilon.alt \) T_n) . $ <eq:selection-bad-upper>]
  Choose $epsilon.alt > 0$ with $4 epsilon.alt < 3 delta \/ 2$.
    Since $T_n arrow.r oo$, the bound in (7.20) is eventually smaller than the lower bound in (7.19).
    There is therefore a realization for which both
  $ h_n \( z \) lt.eq s \( Re z \) + delta quad \( z in K \) \, wide sum_(i = 1)^q h_n \( x_i \) gt.eq
    sum_(i = 1)^q s \( x_i \) - epsilon.alt / 2 - frac(log 2, 2 T_n) $
  hold. Subtracting the upper bounds at the other $q - 1$ points gives
  #[#set math.equation(numbering: n => "(7.21)")
   $ s \( x_i \) - \( q - 1 \) delta - epsilon.alt / 2 - frac(log 2, 2 T_n) lt.eq h_n \( x_i \) lt.eq
     s \( x_i \) + delta . $ <eq:selection-pointwise>]
  Exhaust $bb(H)$ by compact rectangles, and at stage $q$ enlarge the rectangle to include the first $q$ points.
    Apply the preceding construction with $delta = q^(- 2)$ and with $epsilon.alt$ small enough as above,
    choosing an increasing sequence of indices. The selected harmonic functions are locally bounded above,
    and their values converge to $s$ at each point of $D$. Their values at $1$ in particular remain bounded below.
    On any connected relatively compact subdomain containing $1$,
    subtracting these functions from a common upper bound and using Harnack’s inequality gives local lower bounds
    as well. Interior estimates and a diagonal subsequence yield a locally uniform harmonic limit $v$.
    The compact upper bounds give $v \( z \) lt.eq s \( Re z \)$; the values on $D$, followed by continuity,
    give $v \( x \) = s \( x \)$ for every $x > 0$. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 26.] Fix $B \,
    W$ and enumerate a countable dense set of positive real points, starting with $1$.
    Apply (7.16)–(7.16) successively on an exhaustion of $bb(H)$, with errors tending to zero and with $T_n =
    t_n L_n^3 gt.eq n$. At stage $n$ require the product estimates for the first $q$ points for each $q lt.eq n$.
    This is a finite collection of requirements, so the same parameter choices can enforce all of them.
    The resulting random functions $F_n = cal(Z)_(L_n \, k_n \, t_n)$ satisfy Lemma 27,
    by samplewise nonvanishing and the moment estimates. Its conclusion is precisely (7.3). ◻
]

=== 7.4 All ergodic equilibrium states have the same radius <all-ergodic-equilibrium-states-have-the-same-radius>

The negative square in (7.1) now separates two hypothetical magnetization radii:
  a state with smaller radius would dominate at small positive $x$,
  while the largest radius must dominate at large $x$. Harmonicity prevents this change.

#thm([Proposition 7.3.])[
  (Equilibrium magnetization radius).  #emph[Every ergodic translation-invariant state $omega in cal(E)_beta$ satisfies
#[#set math.equation(numbering: n => "(7.22)")
 $ omega \( X_0 \)^2 + omega \( Y_0 \)^2 + omega \( Z_0 \)^2 = m^2 . $ <eq:equilibrium-radius>]

]
] <prop:equilibrium-radius>

#proof[
  The maximum of $omega \( Y_0 \)$ over the compact face $cal(E)_beta$ is $m$.
    The maximizing states form a nonempty compact face, so it contains an extreme point $omega_m$ of the
    translation-invariant state space. Thus $omega_m$ is ergodic.
    The bound on the length of every equilibrium magnetization vector implies that its vector is $\( 0 \, m \, 0 \)$.
  Suppose an ergodic equilibrium state has magnetization length $m' < m$.
    Rotate it to a state $omega_(m')$ with vector $\( 0 \, m' \, 0 \)$;
    rotations preserve equilibrium and translation ergodicity. By Lemma 24, for $r = m \, m'$,
  $ omega_r \( Y_(C_B)^2 \/ B^6 \) arrow.r r^2 \, wide omega_r
    #scale(x: 120%, y: 120%)[\(] \( X_(C_W)^2 + Z_(C_W)^2 \) \/ W^6 #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  For each $B$, choose $W \( B \) gt.eq 2 B$ so large that the second expectation, multiplied by $D_B$,
    is at most $1 \/ B$ in both states. Then, writing $s_B = s_(B \, W \( B \))$,
  #[#set math.equation(numbering: n => "(7.23)")
   $ liminf_(B arrow.r oo) s_B \( x \) gt.eq max { x m - m^2 \, thick x m' - \( m' \)^2 } \, wide
     x > 0 . $ <eq:two-radius-lower>]
  There is also an upper bound that is uniform in $B \, W$.
    If $y = omega \( Y_0 \)$, positivity of variance and translation invariance give
  $ omega \( Y_(C_B)^2 \/ B^6 \) gt.eq y^2 \, wide - m lt.eq y lt.eq m . $
  Dropping the other nonpositive square terms shows that
  #[#set math.equation(numbering: n => "(7.24)")
   $ s_(B \, W) \( x \) lt.eq max_(- m lt.eq y lt.eq m) \( x y - y^2 \) = x m - m^2 \, wide x > 2 S \,
     $ <eq:large-field-tangent>]
  because $m lt.eq S$ and $y mapsto x y - y^2$ is increasing on $\[ - m \, m \]$ for such $x$.
    For every $x > 0$ we also have $s_(B \, W) \( x \) lt.eq S x$.
  Let $v_B$ be the harmonic function supplied by Proposition 26.
    It satisfies $v_B \( z \) lt.eq S Re z$ on $bb(H)$. At any fixed $x_0 > 2 S$,
    (7.23) and (7.24) give $v_B \( x_0 \) arrow.r x_0 m - m^2$.
    Harnack’s inequality applied to the nonnegative harmonic functions $S Re z - v_B \( z \)$,
    followed by interior compactness, supplies a subsequential harmonic limit $v$ on $bb(H)$.
    The same two inequalities imply $v \( x \) = x m - m^2$ for every $x > 2 S$.
    The restriction of a harmonic function to the real axis is real analytic, so this identity holds for every $x > 0$.
  On the other hand, (7.23) passes to this subsequence and gives $v \( x \) gt.eq x m' - \( m' \)^2$.
    For $0 < x < m + m'$, these two assertions contradict
  $ #scale(x: 120%, y: 120%)[\(] x m' - \( m' \)^2 #scale(x: 120%, y: 120%)[\)] -
    #scale(x: 120%, y: 120%)[\(] x m - m^2 #scale(x: 120%, y: 120%)[\)] = \( m - m' \) \( m + m' - x \) > 0 . $
  Since $m > 0$, this interval is nonempty even when $m' = 0$. No smaller radius is possible, proving (7.22). ◻
]

== 8 The total-spin limit <sec:global-spin>

We now combine spatial comparison with the identification of equilibrium magnetization lengths.
  Fix a finite $beta$ above all the thresholds in the preceding sections and write $m = m_(S \, beta) > 0$.

#thm([Lemma 8.1.])[
  #emph[For every finite nonempty rectangle $C subset bb(Z)^3$ and every translation-invariant equilibrium state
    $omega$,
#[#set math.equation(numbering: n => "(8.1)")
 $ sum_(a = 1)^3 omega #h(-0.16667em) [(frac(1, \| C \|) sum_(x in C) S_x^a)^2] gt.eq m^2 . $ <eq:local-second-moment>]

]
] <lem:local-second-moment>

#proof[
  In a translation-ergodic equilibrium state, translation invariance and positivity of variance give
  $ omega #h(-0.16667em) [(frac(1, \| C \|) sum_(x in C) S_x^a)^2] gt.eq omega \( S_0^a \)^2 . $
  Summing and applying Proposition 28 proves the assertion for extreme equilibrium states.
    The equilibrium set is a compact face of the translation-invariant state space, as recalled in Section 6.
    By the Krein–Milman theorem it is the closed convex hull of its extreme points.
    The left side of (8.1) is continuous and affine in the state, so the inequality holds throughout that face. ◻
]

#thm([Proposition 8.2.])[
  #emph[The periodic zero-field Gibbs states satisfy
#[#set math.equation(numbering: n => "(8.2)")
 $ liminf_(L arrow.r oo) 1 / V^2 sum_(a = 1)^3 chevron.l \( M_L^a \)^2 chevron.r gt.eq m^2 . $ <eq:global-second-lower>]

]
] <prop:global-second-moment>

#proof[
  Choose a sequence of even side lengths realizing the lower limit in (8.2),
    and pass to a subsequence on which the Gibbs states converge locally.
    Their limit $omega$ is a translation-invariant equilibrium state by Section 6.
    Fix the terminal scale $R_(*)$ in Proposition 22. Its finest partition consists of rectangles with side
    lengths bounded above and below by constants depending on $R_(*)$ only.
    For this fixed $R_(*)$ there are finitely many possible rectangle shapes.
    Translation invariance and local convergence therefore imply, uniformly over all cells in that partition,
  $ liminf_(L arrow.r oo) 1 / V sum_(C in cal(P)_(*)) \| C \|
    sum_(a = 1)^3 ⟨(frac(1, \| C \|) sum_(x in C) S_x^a)^2⟩ gt.eq m^2 \, $
  where Lemma 29 supplies the lower bound for each limiting shape.
    The spatial comparison (5.5), applied in each of the three directions, gives
  $ liminf_(L arrow.r oo) 1 / V^2 sum_(a = 1)^3 chevron.l \( M_L^a \)^2 chevron.r gt.eq m^2 -
    frac(C_beta, log R_(*)) . $
  Let $R_(*) arrow.r oo$. The sequence was chosen to realize the lower limit,
    so (8.2) follows along all even side lengths. ◻
]

#proof[
  The Hamiltonian commutes with the global spin representation of $S U \( 2 \)$.
    Decompose the finite-volume Hilbert space into spin-$J$ irreducible representations and their multiplicity
    spaces. On each irreducible factor the Gibbs density is a scalar multiple of the identity.
    Thus the Gibbs trace defines a random label $J_L$ with $0 lt.eq J_L lt.eq S V$, and
  #[#set math.equation(numbering: n => "(8.3)")
   $ sum_(a = 1)^3 chevron.l \( M_L^a \)^2 chevron.r = bb(E) \[ J_L \( J_L + 1 \) \] . $ <eq:casimir>]
  Conditional on $J_L = J$, a component in any fixed unit direction has the uniform distribution on $- J \, - J +
    1 \, dots.h \, J$.
  We first verify the upper-tail claim (1.5). Fix $epsilon.alt > 0$.
    By the definition of the right derivative, some fixed $h > 0$ satisfies
  $ p_(S \, beta) \( h \) - p_(S \, beta) \( 0 \) lt.eq h \( m + epsilon.alt \/ 4 \) . $
  Since $H_(S \, L)$ commutes with $M_L^3$, exponential Markov and the pressure limit give
  $ limsup_(L arrow.r oo) 1 / V log bb(P) #scale(x: 120%, y: 120%)[\(] M_L^3 \/ V > m +
    epsilon.alt \/ 2 #scale(x: 120%, y: 120%)[\)] & lt.eq - beta h \( m + epsilon.alt \/ 2 \) +
    beta #scale(x: 120%, y: 120%)[\[] p_(S \, beta) \( h \) - p_(S \, beta) \( 0 \) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq - beta h epsilon.alt \/ 4 < 0 . $
  Here the probability is the spectral distribution of $M_L^3$ in the Gibbs state.
    If $J \/ V > m + epsilon.alt$, at least $epsilon.alt V \/ 2 - 1$ of its $2 J +
    1$ magnetic levels exceed $\( m + epsilon.alt \/ 2 \) V$.
    For all sufficiently large $L$, their conditional probability is bounded below by a positive constant
    depending only on $epsilon.alt \, S$. Consequently
  $ bb(P) \( J_L \/ V > m + epsilon.alt \) arrow.r 0 . $
  The laws of $J_L \/ V$ are supported in the compact interval $\[ 0 \, S \]$.
    Every subsequential limit is supported in $\[ 0 \, m \]$ by this upper-tail bound.
    By (8.3), Proposition 30, and $J_L \/ V^2 lt.eq S \/ V$, its second moment is at least $m^2$.
    A probability measure on $\[ 0 \, m \]$ with that property is the point mass at $m$. Hence
  #[#set math.equation(numbering: n => "(8.4)")
   $ J_L \/ V arrow.r m quad upright("in probability") \, wide frac(bb(E) \[ J_L \( J_L + 1 \) \], V^2) arrow.r
     m^2 . $ <eq:spin-concentration>]
  The second conclusion proves (1.4).
  For $t eq.not 0$, rotate the direction $t \/ \| t \|$ to the third axis.
    Conditional on $J_L = J$, the Laplace transform in (1.3) is
  $ frac(1, 2 J + 1) sum_(r = - J)^J e^(\| t \| r \/ V) . $
  Whenever $J \/ V arrow.r m > 0$, these Riemann sums converge to
  $ 1 / 2 integral_(- 1)^1 e^(m \| t \| u) thin upright(d) u = frac(sinh \( m \| t \| \), m \| t \|) . $
  They are uniformly bounded by $e^(S \| t \|)$, so (8.4) implies convergence of their expectations.
    The case $t = 0$ is immediate. The normalized area measure on $bb(S)^2$ has a uniform third coordinate in
    $\[ - 1 \, 1 \]$, which identifies the integral in (1.3) and completes the proof. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
