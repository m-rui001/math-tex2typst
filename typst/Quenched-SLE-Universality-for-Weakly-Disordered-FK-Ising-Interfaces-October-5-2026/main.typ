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

#align(center)[#text(size: 16pt, weight: "bold")[Quenched SLE Universality for Weakly Disordered FK--Ising Interfaces]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The critical FK–Ising model describes the connectivity of the clusters in the Edwards–Sokal representation of the
  Ising model. Its planar exploration interface has the conformally invariant scaling limit
  $upright("SLE")_(16 \/ 3)$. We prove that this interface limit persists when each lattice coupling is perturbed
  by a small independent symmetric two-valued random variable,
  with the disorder held fixed while the interface is sampled.

=== 1.1 The model and the result <the-model-and-the-result>

Let $cal(E)$ be the nearest-neighbor edge set of $bb(Z)^2$,
  and let $xi = \( xi_e \)_(e in cal(E))$ be independent random signs, each equally likely to be $- 1$ or $1$.
  For $0 < epsilon < 1$, put

#[#set math.equation(numbering: n => "(1.1)")
 $ J_e = 1 + epsilon xi_e . $ <eq:random-couplings>]

We write $bb(P)_(upright("env"))$ for the law of $xi$. The critical inverse temperature is the plus-state
  magnetization threshold

$ beta_c \( epsilon \) = inf { beta > 0 : bb(E)_(upright("env")) chevron.l sigma_0 chevron.r_(beta \, J)^(+) > 0
  #scale(x: 120%, y: 120%)[}] . $

Here the infinite-volume Gibbs expectation is normalized for each environment before taking the environmental
  expectation. This threshold also agrees with the almost-sure magnetization threshold:
  positivity propagates between neighboring vertices for strictly positive ferromagnetic couplings,
  so its occurrence is a translation-invariant environmental event.
  Ergodicity, monotonicity in $beta$, and a countable intersection over rational $beta$ give the equivalence.

Fix a bounded Jordan domain $D subset bb(C)$ and distinct $a \, b in partial D$.
  A square-lattice domain is a finite filled lattice domain: all its interior nearest-neighbor edges are present.
  Boundary collars may separate incidences at a boundary vertex when recording the order of boundary arcs.
  Consider deterministic such domains $G_n = \( V_n \, E_n \)$ at physical mesh $delta_n arrow.b 0$,
  with polygonal domains $D_n$ and marked boundary points $a_n \, b_n$.
  Assume there are orientation-preserving boundary homeomorphisms $h_n : partial D arrow.r partial D_n$ such that

#[#set math.equation(numbering: n => "(1.2)")
 $ sup_(z in partial D) \| h_n \( z \) - z \| arrow.r 0 \, wide a_n arrow.r a \, quad b_n arrow.r b \,
   $ <eq:jordan-approximation>]

where the marked points correspond in boundary order. All coordinates in (1.2) are physical coordinates,
  including the factor $delta_n$.

Given $xi$, sample a bond configuration $omega in { 0 \, 1 }^(E_n)$ with law

#[#set math.equation(numbering: n => "(1.3)")
 $ phi.alt_(n \, xi) \( omega \) = 1 / Z_(n \, xi) thin 2^(k_(upright(w)) \( omega \)) product_(e in E_n)
   p_e^(omega_e) \( 1 - p_e \)^(1 - omega_e) \, wide p_e = 1 - e^(- 2 beta_c \( epsilon \) J_e) . $ <eq:main-fk-law>]

The boundary arc from $a_n$ to $b_n$ is wired and its complementary arc is free.
  Thus $k_(upright(w)) \( omega \)$ counts connected components after the vertices of the wired arc have been
  identified. The medial exploration separates the primal open cluster attached to the wired arc from the dual
  open cluster adjacent to the free arc. Write $gamma_n$ for this exploration in physical coordinates;
  it is $delta_n$ times the unit-grid exploration.

Curves are oriented from their first endpoint to their second.
  We use the uniform curve metric modulo increasing reparametrization, with constant pauses immaterial.
  For representatives $gamma \, tilde(gamma) : \[ 0 \, 1 \] arrow.r bb(C)$, the bounded version of this metric is

$ d_(upright("curv")) \( gamma \, tilde(gamma) \) = 1 and
  inf_(alpha \, tilde(alpha)) sup_(t in \[ 0 \, 1 \]) \| gamma \( alpha \( t \) \) -
  tilde(gamma) \( tilde(alpha) \( t \) \) \| \, $

where the infimum is over increasing homeomorphisms of $\[ 0 \, 1 \]$,
  followed by identification of curves at distance zero. Let $d_(upright("BL"))$ denote the bounded-Lipschitz
  metric on probability laws on this separable curve space.
  The conditional law $mu_(n \, xi)$ of $gamma_n$ is a random probability measure,
  even though the environment is fixed when an interface is sampled.

#thm([Theorem 1.1.])[
  #emph[There exists $epsilon_0 > 0$ such that for every fixed $0 < epsilon < epsilon_0$,
    every bounded marked Jordan domain $\( D \; a \, b \)$, and every deterministic filled square-lattice
    approximation satisfying (1.2),
$ d_(upright("BL")) #scale(x: 120%, y: 120%)[\(] mu_(n \, xi) \,
  "Law" \( upright("SLE")_(16 \/ 3) \( D \; a \, b \) \) #scale(x: 120%, y: 120%)[\)]
  arrow.r_(n arrow.r oo)^(bb(P)_(upright("env"))) 0 . $

 The constant $epsilon_0$ is independent of the domain and its approximation.]
] <thm:main>

The disorder strength in Theorem 1 does not decrease with the mesh.
  The conclusion concerns the whole oriented curve, including its terminal portion near $b$.

=== 1.2 Background and the source of the difficulty <background-and-the-source-of-the-difficulty>

The random-cluster representation of Fortuin and Kasteleyn [10] and the coupling of Edwards and Sokal [9] connect
  Ising spin correlations to random connectivity. At the planar critical point,
  the fermionic observables of Smirnov [22] and Chelkak–Smirnov [6] give access to conformally invariant
  boundary-value problems. Chelkak, Duminil-Copin, Hongler, Kemppainen,
  and Smirnov [4] proved convergence of critical Ising and FK–Ising interfaces to their respective SLE limits.
  Crossing estimates stable under boundary conditions, as developed by Duminil-Copin, Hongler,
  and Nolin [8] and by Chelkak, Duminil-Copin, and Hongler [3],
  and the curve-compactness framework of Kemppainen–Smirnov [14] are central tools in passing from observables to
  interfaces.

Random perturbations of the interaction test the stability of this critical geometry.
  Harris’s criterion [12] identifies the two-dimensional Ising case as marginal,
  so the stability question is subtler than in a strictly irrelevant regime.
  Perturbative work of Dotsenko–Dotsenko, Shalaev, and Ludwig investigated weak random bonds and the resulting
  logarithmic corrections [7,21,15,16]. In a recent rigorous treatment,
  Avérous–Mahfouf [2] obtain near-critical random-bond FK crossing estimates with disorder decreasing with the
  observation scale for $q > 1$. Theorem 1 concerns a fixed positive disorder strength and identifies the full
  interface law. The present result concerns the specific symmetric two-valued ferromagnetic disorder in (1.1).
  Its renormalization input is the companion manuscript [18],
  which identifies the critical point and constructs a local scale transformation whose bulk perturbations tend to
  zero. We state precisely the portions of that result used here in Section 2.

Vanishing bulk perturbations alone do not identify FK interface laws.
  An explored interface creates a random slit boundary, and conditional crossing probabilities must be compared in
  the remaining domain. Moreover, the available quenched bounds concern fixed physical scales;
  their environmental convergence has no rate that would justify a union bound over all microscopic domains or all
  possible slit histories. The proof must preserve these quantifiers when adapting the pure-model arguments.

=== 1.3 The proof and its reusable ingredients <the-proof-and-its-reusable-ingredients>

Our first step is a partition-function comparison on a fixed polygon.
  Near its boundary, bulk symmetry no longer supplies the cancellations used by the scale transformation.
  We replace those cancellations with pure Ising transfer estimates.
  Along a straight side the relevant projective distance decays quadratically in the ratio of scales.
  The quadratic decay makes the contribution of the boundary cells summable;
  at the finitely many corners and changes of boundary condition, a positive decay exponent suffices.
  Section 3 proves the transfer estimates, and Section 4 uses them to extend the scale transformation to fixed
  polygon boundaries.

We also need this comparison on polygons lying in a flat covering surface of a punctured planar domain.
  Such a polygon has ordinary square-grid charts, although its projection into the plane need not be one-to-one.
  Every lifted edge carries the disorder of its projected edge.
  The proof uses independence only within one injective chart and therefore allows different sheets to carry
  identical disorder. The pure four-point observable remains valid on these topological disks,
  as explained in Section 5.

Before making these tests depend on an exploration, Section 6 fixes the environment and controls its curves.
  From every mesh subsequence we extract a deterministic further subsequence on which all polygons in one
  countable stock have their pure limits and all annular barriers in a countable dense family hold almost surely.
  After fixing such an environment, those barriers give arm bounds and tightness of the exploration histories.

The second main step converts fixed tests into conditional tests after exploration.
  We puncture near finitely many boundary accesses and lift the remaining domain to a universal cover.
  Carefully chosen crosscuts control its conformal coordinate even near the slit boundary.
  Small deletions then confine the central portion of every possible crossing to a compact part of the cover,
  where a fixed polygon can test it. Section 7 gives the construction and the shared-edge comparison.
  This provides a way to transfer local partition-function information to adaptive domains while retaining the
  original lattice and its disorder.

If a conditional test failed, tightness would yield a convergent sequence of failing histories.
  The covering construction would produce one fixed polygon from the already convergent stock,
  contradicting its known limit. Thus the geometry may be chosen after the histories while the final test remains
  fixed before the mesh limit. No uniform rate over polygons or histories is required.

To recover the ordered curve from its driver, Section 6 also proves a uniform approximation of the tip from
  positive conformal height. This uses a stopping-time version of the small-gate argument in [14].
  Finally, Section 8 extracts bounded martingale tests from four-boundary-change probabilities.
  Two tests identify the Loewner driver as $sqrt(16 \/ 3)$ times Brownian motion.
  The tip estimate and a no-return bound at the target give convergence in the curve metric of Theorem 1.

We adapt the finite-graph drawings, closure comparisons, and martingale identification strategy of the companion
  manuscript [17], with their hypotheses stated at the point of use.
  The boundary extension and the covering construction are proved here;
  the homogeneous probabilistic inputs are replaced by the quenched estimates established in this paper.

== 2 Random-cluster conventions and imported estimates <sec:inputs>

We first identify the random couplings at the physical critical point.
  We then state the two inputs from the companion paper [18] that will be used throughout the proof:
  a local bound on FK arms and a scale transformation whose bulk perturbations vanish.
  The transformation acts on spin partition functions. Its extension to the boundary of a polygon is proved below;
  that extension is not part of the imported bulk estimate.

=== 2.1 The two probability spaces and planar duality <the-two-probability-spaces-and-planar-duality>

For a fixed bond environment $J$, a finite graph $G = \( V \, E \)$,
  and a partition $pi$ of its boundary vertices, write

#[#set math.equation(numbering: n => "(2.1)")
 $ phi.alt_(G \, J)^pi \( omega \) = 1 / Z_(G \, J)^pi thin 2^(k_pi \( omega \)) product_(e in E) v_e^(omega_e) \,
   wide v_e = e^(2 K_e) - 1 \, quad K_e = beta J_e . $ <eq:fk-odds>]

Here $omega in { 0 \, 1 }^E$, and $k_pi$ counts open components after the vertices in each part of $pi$ have been
  identified. A connection event in this paper always uses actual open edges,
  unless a specified boundary arc is explicitly allowed as part of the path.
  In particular, identifying two sets of vertices does not make an ordinary radial annulus crossing occur automatically.

At fixed $J$, the law (2.1) has the spatial Markov property, satisfies FKG,
  and is increasing in the odds and in the boundary partition [10,11].
  These statements remain valid for inhomogeneous positive odds. Planar FK duality gives

#[#set math.equation(numbering: n => "(2.2)")
 $ v_(e^(*))^(thin *) = 2 / v_e . $ <eq:dual-odds>]

When completing a subgraph to a larger graph for an upper bound,
  we retain the actual odds on every shared edge and compare the induced boundary partitions.

The Edwards–Sokal coupling [9] relates this law to the Ising weight $exp \( sum_e K_e sigma_x sigma_y \)$.
  Given the spins, edges joining equal spins are independently open with probabilities $1 - e^(- 2 K_e)$,
  and edges joining opposite spins are closed. Given the edges,
  each unwired component has an independent fair spin; a component with a prescribed pin has that pin’s spin.
  Two separately wired arcs can instead each carry one unconstrained terminal spin.
  If $Z^(+ +)$ and $Z^(+ -)$ are the spin partition functions obtained by fixing their two spins as indicated,
  while all other boundary vertices are free, then their actual FK connection probability is

#[#set math.equation(numbering: n => "(2.3)")
 $ phi.alt \( upright("first arc") arrow.l.r upright("second arc") \) =
   frac(Z^(+ +) - Z^(+ -), Z^(+ +) + Z^(+ -)) . $ <eq:es-partition-ratio>]

Indeed the connection probability equals the correlation of the two terminal spins,
  and global spin flip identifies the other two choices of terminal signs.

We denote probability and expectation over the original iid signs by $bb(P)_(upright("env"))$ and
  $bb(E)_(upright("env"))$. The auxiliary priorities and thresholds used to construct a scale transformation
  enlarge this environment; $bb(E)$ without a subscript in a moment bound includes that construction randomness.
  In contrast, independent #emph[reference variables], including the fair comparison coins used by the
  transformation, belong to the Gibbs field: they are arguments of the logarithmic weights and are sampled with
  that field. Let $K_0 = 1 / 2 log \( 1 + sqrt(2) \)$. Pure expectation $bb(E)_0$ is expectation under the
  full-plane critical Ising law at coupling $K_0$, together with the independent reference variables;
  it does not average the environment. Supremum norms below range over spins and reference variables alike.
  The original FK law and all its probabilities are independent of the additional construction choices.

=== 2.2 The physical critical point and local barriers <the-physical-critical-point-and-local-barriers>

The coordinate used in [18] is

#[#set math.equation(numbering: n => "(2.4)")
 $ K \( t \) = 1 / 2 log \( 1 + sqrt(2) e^t \) \, wide K_e = K \( h + theta xi_e \) . $ <eq:critical-coordinate>]

Thus $h$ changes both log odds by the same amount, while $theta$ is the size of their symmetric disorder.

#thm([Proposition 2.1.])[
  (Critical-temperature input).  #emph[For sufficiently small $epsilon > 0$,
    the plus-magnetization threshold for $J_e = 1 + epsilon xi_e$ is the unique positive solution of
#[#set math.equation(numbering: n => "(2.5)")
 $ #scale(x: 120%, y: 120%)[\(] e^(2 beta_c \( epsilon \) \( 1 + epsilon \)) -
   1 #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] e^(2 beta_c \( epsilon \) \( 1 - epsilon \)) -
   1 #scale(x: 120%, y: 120%)[\)] = 2 . $ <eq:critical-self-duality>]

 The plus magnetization vanishes at this temperature. If $v_plus.minus =
   e^(2 beta_c \( epsilon \) \( 1 plus.minus epsilon \)) - 1$ and $theta = 1 / 2 log \( v_(+) \/ v_(-) \)$, then
$ v_e = sqrt(2) thin e^(theta xi_e) \, wide theta arrow.r 0 quad upright("as ") epsilon arrow.b 0 . $

 The scale trajectory with vanishing perturbations constructed in [18] occurs at $h = 0$ in (2.4).]
] <prop:critical-input>

#proof[
  #emph[Source and normalization.] These are Proposition 8.2, #emph[Identification of the tuned parameter],
    and Theorem 8.5, #emph[Physical critical point], in Section 8 of [18].
    The definition of magnetization there first normalizes each quenched Gibbs law and then averages its
    infinite-volume plus magnetization. It is therefore the threshold used here.
    The bounds $K_0 \/ \( 1 + epsilon \) lt.eq beta_c \( epsilon \) lt.eq
    K_0 \/ \( 1 - epsilon \)$ imply $theta arrow.r 0$. The companion’s identification of $h =
    0$ uses torus partition functions and a separate sharpness argument to identify the physical threshold.
    No inference from self-duality alone is needed. ◻
]

Consequently the dual odds at this temperature have the same law as the primal odds:
  the crossing-edge bijection in (2.2) replaces $xi_e$ by $- xi_e$.
  Statements in environmental probability can therefore be applied to either color.

#thm([Lemma 2.2.])[
  (Local FK barrier input).  #emph[There are fixed $a_0 > 1$ and $c_0 >
    0$ such that the following holds at $beta_c \( epsilon \)$.
    Let $B_r \( x \) = { y in bb(Z)^2 : ∥y - x∥_oo lt.eq r }$, and let $cal(A) \( x \, r \) =
    B_(a_0 r) \( x \) \\ B_r \( x \)$ be its lattice annulus.
    With $bb(P)_(upright("env"))$-probability tending to one as $r arrow.r oo$,
#[#set math.equation(numbering: n => "(2.6)")
 $ phi.alt_(cal(A) \( x \, r \) \, J)^(upright(w)) \( upright("ordinary open radial crossing") \) lt.eq 1 -
   c_0 . $ <eq:barrier-input>]

 Here both rims are wired together. The convergence is uniform in $x$,
   and the event that (2.6) holds depends only on the bonds of the annulus and its incident lattice layer.
   The same bound holds for every less wired boundary condition.
   The assertion also holds for dual crossings with dual odds.]
] <lem:barrier-input>

#proof[
  #emph[Source.] This is Lemma 8.3, #emph[Local FK barriers], in Section 8 of [18], followed by (2.2).
    That lemma gives no rate for the exceptional environmental probability.
    Our uses fix all physical annular radii before taking the mesh limit. ◻
]

=== 2.3 Vanishing bulk perturbations <vanishing-bulk-perturbations>

The comparison of polygon partition functions will use the same local transformation at many scales.
  We record both its probabilistic output and the precise exactness that survives a change of boundary geometry.
  Fix an integer initial spacing $s_0$. Allocate each lattice bond to its nearest centers of the grid $s_0
  bb(Z)^2$, splitting ties equally, and denote the allocation weights by $alpha_(i \, e)$.
  They are nonnegative and sum to one over $i$ for each $e = { x \, y }$. Set

#[#set math.equation(numbering: n => "(2.7)")
 $ f_i^(\( 0 \)) = sum_e alpha_(i \, e) \( K_e - K_0 \) b_e \, wide b_e = sigma_x sigma_y -
   bb(E)_0 \( sigma_x sigma_y \) . $ <eq:initial-logs>]

Their sum is the change in spin log weight, up to a scalar independent of the spins.
  The allocation is invariant under grid translations and square symmetries.

#thm([Proposition 2.3.])[
  (Bulk scale-transformation input).  #emph[There is a fixed support constant $C_(upright(s))$ with the following
    properties. Choose a sufficiently large odd step factor $L$,
    a sufficiently small flag threshold parameter $b_0 > 0$ thereafter, and a sufficiently large fixed $s_0$.
    For all sufficiently small $theta > 0$, the plane fields (2.7) at $h =
    0$ admit successive transformations to potentials $f_i^(\( k \))$ at spacings $s_k = s_0 L^k$ such that:]
  + #emph[Each $f_i^(\( k \))$ is a bounded real spin-flip-even function, is centered by $bb(E)_0 f_i^(\( k \)) =
    0$, and has field support and environmental dependence in the square of radius $C_(upright(s)) s_k$ about $s_k
    i$. The primitive environmental variables are independent.
    Collections with disjoint dependence neighborhoods are independent as random functions.
    The plane field is stationary on its grid and square symmetric in distribution.]
  + #emph[With the fixed moment order $P = 40$,
#[#set math.equation(numbering: n => "(2.8)")
 $ X_k = #scale(x: 120%, y: 120%)[\(] bb(E) ∥f_i^(\( k \))∥_oo^P #scale(x: 120%, y: 120%)[\)]^(1 \/ P) arrow.r
   0 . $ <eq:bulk-decay>]

 The numbers $X_k$ are uniformly arbitrarily small when $theta$ is sufficiently small.
   The disorder bound and construction parameters are chosen independently of any domain or mesh approximation.]
  + #emph[Every local replacement preserves exterior-integrated weights exactly,
    up to field-independent centering factors. This holds for arbitrary assignments of the old exterior field
    whenever the complete local construction is performed. For numerical $K_(upright(s))$ and a constant $C_L$,
    one scale step satisfies
#[#set math.equation(numbering: n => "(2.9)")
 $ ∥f'_j∥_oo lt.eq C_L sum_(i : thin ∥s i - L s j∥_oo lt.eq K_(upright(s)) L s) ∥f_i∥_oo . $ <eq:map-raw-input>]

 The formulas are local and agree in embedded plane and torus charts.]
  #emph[Any additional fixed lower bound on $L$, upper bound on $b_0$,
    or lower bound on $s_0$ can be imposed in this order, followed by decreasing the allowed disorder interval.]
] <prop:bulk-input>

#proof[
  #emph[Source and parameter choices.] The local construction and (2.9) are Proposition 3.3,
    #emph[The local scale map], of [18]. Proposition 4.1, #emph[One-step estimates],
    first makes the contraction coefficients small by increasing $L$,
    then controls the Taylor remainder by decreasing the flag threshold, and finally restricts the input moments.
    Theorem 6.2, #emph[A small critical trajectory], gives $X_k lt.eq
    A sqrt(v_k)$ and $v_k lt.eq \( v_0^(- 1) + c k \)^(- 1)$ for fixed positive constants $A \, c$ and $v_0 =
    O \( theta^2 \)$. Here $v_k$ is a scalar variance coordinate of that construction,
    distinct from the edge odds $v_e$. Proposition 2 identifies the resulting trajectory with $h = 0$.
    These proofs give the stated freedom in the parameter choices; they do not require summability of $X_k$ over $k$. ◻
]

The exactness assertion concerns arbitrary assignments of the #emph[old] exterior field,
  while the new Gibbs reference variables are sampled by the complete local construction.
  It does not permit those new variables to be pinned separately.
  Corollary 3.4, #emph[Local implementation], of [18] omits operations whose determining neighborhoods leave a
  free chart and agrees with the plane construction only in an eroded chart.
  Section 4 gives the construction, retains its complete operations in a pad around the polygon,
  and proves the additional boundary estimates.

There is also a distinction between local and global environmental independence when using several sheets over the
  plane. Different copies of one physical edge carry the same bond environment.
  We use a plane moment estimate only when the whole determining neighborhood projects injectively to an ordinary
  lattice chart. Finite sums of final norms are bounded by their individual moments;
  no independence between separate sheets is required.

== 3 Pure transfer estimates at the boundary <sec:boundary>

The local comparison argument will integrate perturbations supported near a polygonal boundary.
  We need to quantify how much a pure conditional expectation of such a perturbation can depend on distant spins.
  Along a straight side the required decay is quadratic in the ratio of scales.
  At the finitely many corners and changes of boundary condition, any positive power will suffice.
  A free side requires a separate argument: quadratic decay holds for functions invariant under simultaneous
  reversal of all their spins.

Throughout this section the Ising coupling is the pure critical coupling $K_0$, so that $e^(- 2 K_0) = tanh K_0$.
  Sides are horizontal or vertical, and a pinned side has one constant spin sign.
  Two pinned sides meeting at a corner have the same sign. A change between pinned and free boundary conditions
  lies in the interior of a straight side. A simultaneous spin reversal lets us take each local pinned sign to be plus.

=== 3.1 Shell kernels and their projective diameter <shell-kernels-and-their-projective-diameter>

Let $W_theta.alt$ be a sector with coordinate-axis boundary rays and angle $theta.alt in { pi \/ 2 \, pi \,
  3 pi \/ 2 }$. For $0 < r < R$, the region

$ W_theta.alt ∩ { r < \| z \|_oo < R } $

is a topological rectangle. We call its two pieces on $\| z \|_oo = r \, R$ the #emph[terminal caps];
  the other two pieces lie on the boundary rays. The case $theta.alt = pi$ describes a straight side,
  and the other two angles describe polygonal corners. We also allow fixed proportional changes of the two caps.
  These permit small buffers and keep the switches of a boundary condition away from corners of a cap.
  All the shapes used below belong to a fixed finite collection of such modifications.

On a square-lattice approximation of mesh $delta$, let $T \( u \, v \) >
  0$ be the Ising partition function in this shell when the spin vectors on the inner and outer caps are
  respectively $u$ and $v$. Spins already fixed by a pinned ray need not be included in the cap vector.
  Edges entirely inside one cap may be retained or discarded:
  they contribute only a positive factor depending on that cap state.

#prodef([Definition 3.1.])[
  For a strictly positive kernel $T$ on two finite state spaces, its #emph[projective diameter] is
  #[#set math.equation(numbering: n => "(3.1)")
   $ Delta \( T \) =
     sup_(u \, u' \, v \, v') lr(|log frac(T \( u \, v \) T \( u' \, v' \), T \( u \, v' \) T \( u' \, v \))|) .
     $ <eq:projective-diameter>]
  If both boundary rays are free, write $\[ u \] = { u \, - u }$ and define the kernel on cap states modulo sign by
  #[#set math.equation(numbering: n => "(3.2)")
   $ overline(T) \( \[ u \] \, \[ v \] \) = sum_(epsilon \, epsilon' in { - 1 \, 1 })
     T \( epsilon u \, epsilon' v \) . $ <eq:quotient-shell-kernel>]
  Thus the two absolute cap signs are summed independently.
]

Multiplication by positive functions of the separate terminal states does not change $Delta$.
  Summing over additional states at either terminal cannot increase a bound on $Delta$:
  multiply the cross-ratio inequality by the corresponding positive weights and sum over the four states.
  We will use both observations when moving cuts or attaching regions on either side of a shell.

#thm([Lemma 3.2.])[
  (Boundary transfer).  #emph[There are constants $d_0 > 1$ and $C <
    oo$ with the following properties for the pure shell kernels just defined.]
  + #emph[At a straight side, if both rays are pinned plus, then for every fixed $d = R \/ r gt.eq d_0$,
#[#set math.equation(numbering: n => "(3.3)")
 $ Delta \( T \) lt.eq C d^(- 2) . $ <eq:straight-boundary-transfer>]

 If both rays are free, the same bound holds for $overline(T)$.]
  + #emph[At a corner with both rays pinned plus or both rays free,
    there is a fixed ratio $d_0$ for which the appropriate kernel has projective diameter at most $C$.
    The same finite bound holds at a straight boundary-condition change, with one ray pinned plus and the other free.]
  #emph[In each statement the mesh is sufficiently fine relative to $r$.
    The threshold may depend on the fixed ratio and the finite collection of cap shapes.
    The constants are uniform under translation, lattice rounding,
    and bounded lattice-layer displacements of the cuts and dual boundaries.]
] <lem:boundary-transfer>

#proof[
  We first prove the estimate for pinned rays by a four-point boundary correlation.
    Duality then turns the free-ray kernel into arbitrary products of dual spins;
    an FK screening argument makes the four-point estimate usable uniformly in the number of these insertions.
    Finally we treat a change of boundary condition by a fixed-scale arm comparison.
  ===== 3.1.1 Pinned rays. <pinned-rays.>
  The logarithm of a ferromagnetic Ising partition function is supermodular in its pinned spins.
    Denote the constant terminal vectors by $bold(-)$ and $bold(+)$, and write
  $ D \( u \, u' \; v \, v' \) = log T \( u' \, v' \) + log T \( u \, v \) - log T \( u' \, v \) -
    log T \( u \, v' \) . $
  For $u lt.eq u'$ and $v lt.eq v'$, supermodularity gives $D gt.eq 0$.
    Embed these pairs in the chains $bold(-) lt.eq u lt.eq u' lt.eq bold(+)$ and $bold(-) lt.eq v lt.eq v' lt.eq
    bold(+)$. The extreme mixed difference is the sum of all the nonnegative rectangle increments along these
    chains, so it dominates $D \( u \, u' \; v \, v' \)$. For incomparable terminal vectors,
    split each change at its coordinatewise meet. The resulting at most four comparable rectangle increments give
  #[#set math.equation(numbering: n => "(3.4)")
   $ \| D \( u \, u' \; v \, v' \) \| lt.eq 4 D \( bold(-) \, bold(+) \; bold(-) \, bold(+) \) .
     $ <eq:boundary-extreme-reduction>]
  Enlarge each terminal by short adjacent pieces of both rays, of lengths proportional to that terminal’s radius.
    Temporarily allowing the added spins to vary can only enlarge the supremum;
    their original plus values are among the permitted choices.
    The endpoints of the enlarged terminals now lie in straight boundary interiors.
    Write $Z_0$ for the partition function with the entire boundary plus, $Z_A \,
    Z_B$ for the partition functions with respectively one of these terminal arcs reversed,
    and $Z_(A B)$ for the one with both reversed. It is therefore enough to bound
  #[#set math.equation(numbering: n => "(3.5)")
   $ log frac(Z_(A B) Z_0, Z_A Z_B) =
     log
     frac(chevron.l s_1 s_2 s_3 s_4 chevron.r_(upright(d u a l \, f r e e)), chevron.l s_1 s_2
     chevron.r_(upright(d u a l \, f r e e)) chevron.l s_3 s_4 chevron.r_(upright(d u a l \, f r e e))) .
     $ <eq:fixed-boundary-duality>]
  Here $1 \, 2 \, 3 \, 4$ are the four switches, in cyclic order, with $1 \, 2$ at the same terminal.
    The identity is the low-temperature expansion followed by the high-temperature expansion on the dual graph.
    Bonds between pinned vertices contribute separate assignment factors,
    and the local factors at each switch cancel in this balanced ratio.
    One may equivalently use normal exterior half-edges at the switches.
    Dropping the pinned boundary layer gives the ordinary free dual graph;
    its faces can be taken to be centered at the nonboundary primal sites.
  We use the boundary Pfaffian identity and the convergence of boundary fermion partition functions on locally
    straight approximations [13] Theorem 2.1 and the partition identities in Section 2.1.
    We spell out the normalization issue because only balanced ratios are needed.
    Let $G_(i j) = chevron.l s_i s_j chevron.r_(upright(d u a l \, f r e e))$,
    and map the limiting shell to the upper half-plane with switch images $x_1 < x_2 < x_3 < x_4$.
    The boundary observable theorem gives ratios of two entries with one common source,
    using the same source normalization; this ratio statement is explicit in [5] Remark 3.19(ii), Equation (3.13).
    The target factors have conformal weight $1 \/ 2$, and the half-plane kernel is $\( x_j - x_i \)^(- 1)$.
    Boundary phases can be removed by taking absolute values, since the contour entries here are positive.
    The two correction ratios in the Pfaffian can be written as
  $ frac(G_13 G_24, G_12 G_34) = G_13 / G_12 G_42 / G_43 \, wide frac(G_14 G_23, G_12 G_34) = G_14 / G_12 G_32 /
    G_34 . $
  Each factor on the right has a common source. Between the two factors,
    all target weights and all local half-edge factors cancel.
    Thus no absolute normalization of a two-point function is being assumed.
    The switches are separated on straight sides before taking the mesh limit,
    exactly as required by the boundary convergence theorem.
  Set
  $ ell = frac(\( x_2 - x_1 \) \( x_4 - x_3 \), \( x_3 - x_1 \) \( x_4 - x_2 \)) in \( 0 \, 1 \) . $
  The Pfaffian divided by its first pairing has limit
  #[#set math.equation(numbering: n => "(3.6)")
   $ 1 - ell + frac(ell, 1 - ell) = 1 + frac(ell^2, 1 - ell) . $ <eq:boundary-pfaffian-cancellation>]
  For a straight half-shell, comparison with concentric semicircles gives extremal distance between its caps at
    least $pi^(- 1) log d - O \( 1 \)$. The quadrilateral modulus–cross-ratio relation consequently gives $ell
    lt.eq C \/ d$. The cancellation in (3.6) is what yields $O \( d^(- 2) \)$, rather than $O \( d^(- 1) \)$.
    For each fixed $d$, choose the mesh so that the error in the balanced-ratio limit is at most $d^(- 2)$.
    This proves (3.3). At either corner angle the extremal distance also tends to infinity with $d$,
    so the same reasoning gives a projective diameter tending to zero as $d arrow.r oo$,
    and in particular a finite bound at a fixed sufficiently large ratio.
  ===== 3.1.2 Free rays and arbitrary insertion sets. <free-rays-and-arbitrary-insertion-sets.>
  A cap spin vector modulo sign is specified by its sign changes.
    Let $A$ and $B$ be the corresponding sets of incoming dual domain-wall ends at the two caps,
    with coinciding ends reduced modulo two. The low- and high-temperature expansions give
  #[#set math.equation(numbering: n => "(3.7)")
   $ overline(T) \( A \, B \) = c_0 c_1 \( A \) c_2 \( B \) chevron.l s_A s_B chevron.r_(*) \, wide s_A =
     product_(a in A) s_a \, $ <eq:free-boundary-duality>]
  where the dual model has its two rays pinned plus and its caps free.
    The factors $c_0 \, c_1 \, c_2$ are positive and cancel from cross ratios.
    Indeed a cap disagreement prescribes an odd degree at the incident dual vertex.
    On a free primal ray, domain walls may end without a parity constraint.
    In the dual high-temperature expansion this is precisely the rule for a plus-pinned vertex.
    There is no condition fixing the relative sign of the two primal caps,
    since their signs were summed independently in (3.2). Conversely,
    planar parity reconstructs a spin configuration from such walls up to a global reversal.
    This proves (3.7), including odd-cardinality sets $A$ or $B$.
    Terminal tabs, or a displacement of the dual boundary by one layer, give the same expansion.
    All insertions remain at the caps; the intervening shells have ordinary pure edges and pinned rays.
  Put a cut at a fixed multiple of the inner radius and another at a fixed fraction of the outer radius.
    Let $U \, V$ denote the two dual cut-spin vectors, and define
  $ F_A \( U \) = chevron.l s_A divides U chevron.r_(*) \, wide F_B \( V \) = chevron.l s_B divides V chevron.r_(*) . $
  Figure 1 shows the cuts and the separating crossing used in the next estimate.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((-3.2, 0), (-3.2, 3.2), (3.2, 3.2), (3.2, 0), (0.8, 0), (0.8, 0.8), (-0.8, 0.8), (-0.8, 0), close: true, fill: rgb("#f7f7f7"), stroke: none)
  line((-3.2, 0), (-3.2, 3.2), (3.2, 3.2), (3.2, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-0.8, 0), (-0.8, 0.8), (0.8, 0.8), (0.8, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-3.2, 0), (-0.8, 0), (0.8, 0), (3.2, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((-1.52, 0), (-1.52, 1.52), (1.52, 1.52), (1.52, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-2.4, 0), (-2.4, 2.4), (2.4, 2.4), (2.4, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-1.12, 0), (-1.184, 0.28), (-1.056, 0.56), (-1.168, 1), (-0.88, 1.144), (-0.44, 1.072), (-0.08, 1.184), (0.32, 1.096), (0.68, 1.184), (1.08, 1.048), (1.152, 0.624), (1.056, 0.288), (1.12, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  merge-path({line((-0.8, 0.36), (-0.24, 0.8)); line((-0.24, 0.8), (0.4, 0.8))}, close: false, fill: black, stroke: none)
  circle((-0.8, 0.36), radius: 0.07056, fill: black, stroke: none)
  circle((-0.24, 0.8), radius: 0.07056, fill: black, stroke: none)
  circle((0.4, 0.8), radius: 0.07056, fill: black, stroke: none)
  circle((-3.2, 1.28), radius: 0.07056, fill: black, stroke: none)
  circle((1.52, 3.2), radius: 0.07056, fill: black, stroke: none)
  line((-3.2, 1.28), (1.52, 3.2), fill: black, stroke: none)
  content((0, 0.44), [#text(size: 9pt)[$A$]])
  content((1.52, 3.2), [#text(size: 9pt)[$B$]], anchor: "south", padding: 0.1176cm)
  content((1.584, 1.32), [#text(size: 9pt)[$U$]], anchor: "west", padding: 0.1176cm)
  content((2.464, 2.08), [#text(size: 9pt)[$V$]], anchor: "west", padding: 0.1176cm)
  content((-1.2, 0.624), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$gamma$]]], anchor: "east", padding: 0.1176cm)
  content((-2.12, 0), [#text(size: 9pt)[plus]], anchor: "north", padding: 0.1176cm)
  content((2.12, 0), [#text(size: 9pt)[plus]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 1: The dual shell in the free-side argument. The insertion sets $A \, B$ lie at the terminal caps, and $U \, V$ are buffered cuts. An open screen $gamma$ joins the two plus sides between $A$ and $U$. Revealing it from the $U$ side leaves the ordinary FK law on its insertion side, with the screen wired plus. The drawing is schematic. ],
  ) <fig:boundary-screen>
  We claim the uniform bounds
  #[#set math.equation(numbering: n => "(3.8)")
   $ parallel F_A parallel_oo lt.eq C chevron.l s_A chevron.r_(*) \, wide parallel F_B parallel_oo lt.eq
     C chevron.l s_B chevron.r_(*) . $ <eq:buffered-insertion-bound>]
  The constant must be independent of the number of insertions.
    This is why an absolute correlation estimate alone would not prove the desired projective bound.
  Here is an FK proof of (3.8). For an insertion set $A$, let $cal(E)_A$ be the event that every open cluster not
    meeting a pinned vertex meets $A$ an even number of times.
    With all pins plus, Edwards–Sokal gives $chevron.l s_A chevron.r = phi.alt \( cal(E)_A \)$.
    The event $cal(E)_A$ is increasing: merging two admissible unpinned clusters preserves even parity,
    and joining a cluster to the pins removes its parity constraint.
    For arbitrary signs on the cut, the FK edge law is the law with all pins wired,
    conditioned on there being no actual open path between differently signed pins.
    This follows by counting the free spin choices of clusters.
    The conditioning event is decreasing; paths in this statement use edges of the graph, not the external wiring.
    If $m_A^(upright("cut") \, +)$ denotes the insertion expectation with the cut pinned plus,
    Edwards–Sokal and FKG give
  #[#set math.equation(numbering: n => "(3.9)")
   $ \| chevron.l s_A divides U = u chevron.r_(*) \| lt.eq phi.alt_(upright(p l u s med c u t)) \( cal(E)_A \) =
     m_A^(upright("cut") \, +) . $ <eq:insertion-plus-cut>]
  To compare this quantity with the uncut expectation, require an open transverse crossing in a proportional
    buffer between $A$ and the cut, joining the two plus-pinned rays.
    Pure FK-Ising RSW gives this event probability at least $c > 0$,
    uniformly in exterior boundary conditions [3]. Reveal an outermost such crossing $gamma$ from the cut side.
    This screen separates the insertions from the cut and is connected to the plus pins.
    Conditional on the reveal, its insertion side has the ordinary FK law with $gamma$ wired plus.
  The nearer wired screen increases the parity-event probability, even for an arbitrarily large insertion set.
    Indeed restrict the farther plus-cut law to the region between the terminal and $gamma$.
    Its induced partition is dominated by full wiring on $gamma$.
    The farther-cut parity event implies the near-region parity event where all clusters touching $gamma$ are
    exempt. Since this latter event is increasing, its probability with $gamma$ wired is at least
    $m_A^(upright("cut") \, +)$. In the uncut law the revealed screen is actually connected to the plus rays,
    so the near-region parity event implies the full parity event. Hence
  $ chevron.l s_A chevron.r_(*) gt.eq c thin m_A^(upright("cut") \, +) . $
  Together with (3.9), this proves (3.8); the other cap is identical.
    Fixed-shape buffers give the same argument in corner sectors.
  The joint law of $U \, V$ is a positive left factor, the intervening pinned-ray kernel,
    and a positive right factor. If that kernel has projective diameter $a$,
    its normalized conditional rows differ by relative factors in $\[ e^(- a) \, e^a \]$.
    Averaging a row over the first marginal gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ e^(- a) lt.eq frac(bb(P) \( U = u \, V = v \), bb(P) \( U = u \) bb(P) \( V = v \)) lt.eq
     e^a . $ <eq:cut-relative-density>]
  For the straight shell we have $a lt.eq C d^(- 2)$. The spin Markov property makes the two insertion regions
    conditionally independent given $U \, V$. Thus (3.8) and (3.10) imply
  $ \| chevron.l s_A s_B chevron.r_(*) - chevron.l s_A chevron.r_(*) chevron.l s_B chevron.r_(*) \| &
    lt.eq \( e^a - 1 \) thin bb(E) \| F_A \( U \) \| thin bb(E) \| F_B \( V \) \|\
 & lt.eq C d^(- 2) chevron.l s_A chevron.r_(*) chevron.l s_B chevron.r_(*) . $
  For sufficiently large fixed $d$ this is relative factorization with error less than $1 \/ 2$,
    uniformly over both insertion sets. Substitution in (3.7) proves the asserted bound for $overline(T)$.
    In a corner, choose the fixed ratio large enough that the pinned-ray diameter is small;
    the identical argument gives the finite bound for the free-ray quotient kernel.
  ===== 3.1.3 A change of boundary condition. <a-change-of-boundary-condition.>
  It remains to bound a shell with one plus ray and one free ray.
    Enlarge the terminal groups along both rays as in the pinned case.
    The added spins on the free ray may first be conditioned upon and then summed out;
    summation preserves the resulting projective bound. Supermodularity again reduces the problem to the extreme
    terminal assignments. The domain-wall expansion used in (3.7) now has one dual plus ray.
    Indeed, after the terminal enlargement the remaining free primal segment is the same in all four extreme
    assignments, so its dual plus ray and its endpoints are unchanged.
    Reversing a terminal creates one prescribed wall end where that terminal meets the pinned primal ray;
    at its other endpoint walls may end on the free primal segment without a parity constraint.
    Thus the terminal assignments $+ + \, + - \, - + \, - -$ give source sets $diameter \, { y } \, { x } \,
    { x \, y }$, respectively, in one fixed dual model. Cancelling the separate terminal factors expresses their
    cross ratio as
  #[#set math.equation(numbering: n => "(3.11)")
   $ frac(chevron.l s_x s_y chevron.r_(*), chevron.l s_x chevron.r_(*) chevron.l s_y chevron.r_(*)) .
     $ <eq:mixed-boundary-ratio>]
  There are just two insertions, at the switches on the pinned primal ray.
    Their dual neighborhoods are locally straight and free, and are a positive distance from each other and from
    the dual plus ray. All these distances are fixed proportions of the shell geometry.
  Choose disjoint half-box neighborhoods $D_x \, D_y$ of these sites,
    each with several separated concentric half-boxes inside it.
    Let $q_x$ be the probability, in $D_x$ with its artificial outer cut wired,
    that $x$ has an actual open arm to a fixed inner radius $rho_x$. The true straight boundary remains free.
    Define $q_y$ likewise. In the Edwards–Sokal expression for $chevron.l s_x s_y chevron.r_(*)$,
    either the two sites are in the same cluster or both are joined to the plus pins.
    Either possibility requires the two local arms. Conditional on all edges outside one neighborhood,
    full wiring of its artificial cut dominates the induced partition.
    Applying this bound successively in the two disjoint neighborhoods gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ chevron.l s_x s_y chevron.r_(*) lt.eq q_x q_y . $ <eq:mixed-two-arm-upper>]
  We next justify the reverse one-point comparison
  #[#set math.equation(numbering: n => "(3.13)")
   $ chevron.l s_x chevron.r_(*) gt.eq c q_x \, wide chevron.l s_y chevron.r_(*) gt.eq
     c q_y . $ <eq:mixed-one-arm-lower>]
  Choose the nested radii, for example, as $rho \/ 2 \, 3 rho \/ 4 \, rho \, 2 rho \, 3 rho \, 6 rho$,
    with the artificial cut at the last radius. In the uncut model require a transverse open screen in the
    half-annular band between $2 rho$ and $3 rho$, and connect it to the actual plus boundary on its outer side.
    A fixed chain of overlapping corridors, together with a radial crossing that must meet the transverse
    crossing, realizes these requirements. RSW and FKG give a positive lower bound independent of the mesh.
    Reveal the outermost screen from outside, including its connection to the plus pins;
    the reveal does not inspect edges on the inner side.
  Inside the screen, full wiring of this nearer cut dominates every partition induced from the farther wired cut
    at radius $6 rho$. Hence the conditional probability of an arm to radius $rho$ is at least $q_x$.
    Extending this arm to the screen costs only another constant.
    Indeed require a transverse primal crossing in the smaller half-annular band between $rho \/ 2$ and $3 rho \/
    4$ and extend it through overlapping deterministic corridors to beyond radius $3 rho$.
    Every arm from the site to radius $rho$ meets the transverse crossing.
    All these requirements are increasing, so FKG and RSW give their joint occurrence with the arm at a fixed
    positive fraction of its probability. An irregular revealed screen causes no loss:
    it stays between the prescribed radii, and a corridor crossing continuing beyond those radii must first reach
    it. Equivalently, use free boundary conditions in a deterministic larger half-box for the crossing lower
    bound; the law with the nearer screen wired dominates on the shared edges,
    since all exterior attachments meet that wired cut. This proves (3.13).
  Equations (3.12) and (3.13) bound (3.11) above by $c^(- 2)$. Griffiths’ inequality bounds it below by $1$.
    The extreme-comparison reduction therefore gives a finite projective diameter in the mixed case.
  Every use of a continuum limit above involves a fixed finite list of ratios and straight marked boundary pieces.
    The corresponding locally regular approximations include rounded caps and bounded layer shifts.
    If uniformity over these approximations failed, a violating sequence with the same limiting polygon and
    straight marked pieces would contradict that convergence theorem.
    Taking the finest threshold for the finite list of shapes proves the stated uniformity. ◻
]

=== 3.2 Conditional expectations and positive weights <conditional-expectations-and-positive-weights>

The kernel estimate concerns whole spin vectors, rather than individual spins.
  It therefore transfers directly to a function of an entire inner patch.
  We record also the logarithmic version needed when that function is a possibly large perturbation of the energy.

#thm([Corollary 3.3.])[
  #emph[Let a spin patch of diameter at most $r$ be separated from prescribed remote spins $zeta$ by pure shells
    of one of the types in Lemma 6, out to distance $R = d r$.
    Allow fixed proportional buffers around the patch and the outer cut.
    Let $H$ be a bounded real function of the patch spins and of any independent auxiliary variables in the patch.
    In the free/free case assume that the region inside the shell has no pinned spins and that $H$ is invariant
    under reversal of all its spin arguments. There are constants $C < oo$ and $eta > 0$ such that
#[#set math.equation(numbering: n => "(3.14)")
 $ upright("osc")_zeta bb(E)_(upright("pure")) \[ H divides zeta \] & lt.eq C a \( d \) parallel H parallel_oo \,\
upright("osc")_zeta log bb(E)_(upright("pure")) \[ e^H divides zeta \] & lt.eq
  C a \( d \) parallel H parallel_oo \, $ <eq:boundary-expectation-transfer>]

 where $a \( d \) = d^(- 2)$ at a straight homogeneous side and $a \( d \) =
   d^(- eta)$ at a corner or boundary-condition change. Here $upright("osc") f = sup f - inf f$.
   The bounds hold for each fixed sufficiently large $d$ and sufficiently fine mesh,
   with thresholds chosen simultaneously for any finite collection of ratios.]
] <cor:boundary-observables>

#proof[
  The spin Markov property factors the conditional law across the two caps into the shell kernel and positive
    factors on its two sides. If the shell diameter is $a$, the conditional distributions on the inner cap,
    for any two remote conditions, have relative densities in $\[ e^(- a) \, e^a \]$.
    Their mixtures with the conditional law of the inner patch have the same comparison.
    With free rays, spin reversal shows that the distribution of the patch modulo global sign depends only on the
    outer spin vector modulo sign. Thus the quotient kernel gives precisely this comparison for even functions,
    even when the remote spins were specified with absolute signs.
    Integrating independent auxiliary variables preserves all the bounds.
  At a straight side, (3.3) now yields (3.14). It also bounds the oscillation of the logarithm of the expectation
    of any positive function by $C d^(- 2)$. To retain the factor $parallel H parallel_oo$ when $parallel H
    parallel_oo lt.eq 1$, apply relative-density comparison to $e^H - 1$;
    its supremum norm is at most $e parallel H parallel_oo$, while all expectations of $e^H$ are at least
    $e^(- 1)$. When $parallel H parallel_oo > 1$, the direct projective bound is already at most $C d^(- 2)
    parallel H parallel_oo$.
  At a corner or change point, divide the region into $m$ successive shells of the fixed ratio in Lemma 6,
    with $m gt.eq c log d - C$. A diameter bound $D < oo$ gives a common positive fraction $e^(- D)$ in every pair
    of normalized rows. Consequently conditional expectation contracts oscillation by at most $q = 1 -
    e^(- D) < 1$ through each shell. Composition gives a bound $C q^m parallel H parallel_oo$,
    which is (3.14) for some $eta > 0$. The quotient by sign is preserved at every free shell.
  For (3.14) with $parallel H parallel_oo lt.eq 1$, apply the same contraction to $e^H$ and then use the lower
    bound $e^(- 1)$. For $parallel H parallel_oo > 1$, first pass through one shell.
    The resulting positive function $h$ satisfies $upright("osc") log h lt.eq D$,
    independently of the size of $H$. Multiplying $h$ by a constant, arrange $1 lt.eq h lt.eq e^D$.
    The remaining shells contract its ordinary oscillation to at most $q^(m - 1) \( e^D - 1 \)$ and preserve its
    lower bound $1$. Its logarithmic oscillation has the same upper bound.
    Absorbing the first shell into the constant gives $C d^(- eta) lt.eq C d^(- eta) parallel H parallel_oo$.
    This argument uses no exponential moment assumption on $parallel H parallel_oo$. ◻
]

== 4 Partition functions up to a polygon boundary <sec:polygon>

The bulk scale map controls perturbations whose determining neighborhoods lie in the plane.
  We now extend it to a fixed polygon, integrating all the way to its boundary.
  The additional estimates concern logarithms of partition functions.
  The transfer bounds of Section 3 make the boundary contributions contract without any cancellation in the
  environmental mean.

We formulate the comparison on a flat surface because the later slit argument will use several copies of portions
  of the same lattice. This does not change the local pure model or introduce independent disorder on the copies.

#prodef([Definition 4.1.])[
  (Polygons on sheets).  Let $cal(S)$ be an oriented flat surface with a map $pi : cal(S) arrow.r
    bb(R)^2$ whose restriction to each sufficiently small neighborhood is an orientation-preserving isometry.
    A #emph[collared orthogonal polygon] is a compact polygonal disk $cal(P) subset
    cal(S)$ such that $pi$ is defined on a neighborhood of $cal(P)$,
    and each side of $cal(P)$ is horizontal or vertical in these local coordinates.
    The polygon has finitely many sides; the map $pi$ need not be injective on $cal(P)$.
  Its lattice approximation is obtained by rounding its sides to the lifted square grid of mesh $delta$ and
    filling the resulting polygon. Boundary-condition changes are placed in straight side interiors and rounded
    with the sides. Distinct lifted copies of a physical lattice edge are distinct random-cluster edges with the
    same environmental sign. Thus the coupling of a lifted edge $tilde(e)$ is the coupling of $pi \( tilde(e) \)$.
] <def:sheet-polygon>

The ordinary plane case is included. A collar permits small changes of sides and marked positions without changing
  the local charts. All lattice conventions below allow a bounded number of boundary layers;
  the rounding prescription is fixed for each test.

#thm([Proposition 4.2.])[
  (Fixed polygon comparison).  #emph[There exists $theta_0 > 0$ with the following property.
    Fix $0 < theta < theta_0$, a collared orthogonal polygon $cal(P)$,
    and four distinct boundary marks in straight side interiors.
    Wire each of two opposite marked boundary arcs separately and leave the intervening arcs free.
    On the rounded lifted grid assign odds
$ v_e = sqrt(2) exp \( theta xi_e \) \, $

 where the physical-edge signs are independent and symmetric, and repeated lifted edges have the same sign.
   Let $phi.alt_(delta \, J)^(upright("sep"))$ and $phi.alt_(delta \, 0)^(upright("sep"))$ denote respectively
   this random-cluster law and the pure law on the same graph and with the same boundary partition.
   If $cal(A)_delta$ is the event of an actual open path between the two wired arcs, then
#[#set math.equation(numbering: n => "(4.1)")
 $ phi.alt_(delta \, J)^(upright("sep")) \( cal(A)_delta \) -
   phi.alt_(delta \, 0)^(upright("sep")) \( cal(A)_delta \) arrow.r 0 wide
   upright("in environmental probability as ") delta arrow.b 0 . $ <eq:polygon-comparison>]

 The disorder threshold is independent of the fixed polygon and marks.
   The conclusion also holds on the dual square grid.]
] <prop:polygon-comparison>

For the proof, constrain the spin to be constant on each wired arc.
  Write $cal(Z)_J^(+ +)$ and $cal(Z)_J^(+ -)$ for the two partition functions obtained by fixing these constants,
  with free spins on the remaining boundary arcs. The Edwards–Sokal correspondence gives

#[#set math.equation(numbering: n => "(4.2)")
 $ phi.alt_(delta \, J)^(upright("sep")) \( cal(A)_delta \) =
   frac(cal(Z)_J^(+ +) - cal(Z)_J^(+ -), cal(Z)_J^(+ +) + cal(Z)_J^(+ -)) =
   tanh #h(-0.16667em) (1 / 2 log cal(Z)_J^(+ +) / cal(Z)_J^(+ -)) . $ <eq:polygon-spin-ratio>]

Indeed, after summing the two possible signs of each arc,
  their spin correlation is the probability that their FK clusters are actually connected.
  Global spin flip identifies the other two partition functions with these two.
  We shall compare $cal(Z)_J^eta$ with its pure counterpart $cal(Z)_0^eta$, for $eta in { + + \, + - }$,
  while removing exactly the same scalar factor from both.

=== 4.1 The scale map with the boundary present <the-scale-map-with-the-boundary-present>

We first describe the finite-volume implementation sufficiently explicitly to keep track of that common factor.
  Throughout, the norm of a potential is its supremum over all its spin and reference-variable arguments.
  Independent priorities and thresholds used to construct the map belong to the environment over which $bb(E)$
  averages. The fair comparison coins described below are instead Gibbs-field variables,
  with an independent product reference law. We write $bb(E)_0^eta$ for pure Ising expectation with pin assignment
  $eta$, together with all these reference variables.

Write $C = C_(upright(s))$ for the fixed support and dependence constant of Proposition 4,
  as supplied by the local scale map in [18] Section “An exact local change of scale”.
  The coarse spacings are $s_k = s_0 L^k$ in lattice units, with $L$ a sufficiently large odd integer.
  All support, allocation, and status-check radii are fixed multiples of the current spacing.
  Their constants can be fixed before $L$ is chosen. Choose a positive physical scale $alpha$,
  depending on the polygon, so small that every full determining neighborhood through scales $delta s lt.eq
  alpha$ lies in an ordinary injectively projected chart. If it meets the polygon boundary,
  it sees at most a straight side, one corner, or one boundary-condition change.
  This is possible because there are finitely many sides and distinct changes,
  and because the closed polygon has a collar. At a corner whose two incident rays are pinned,
  both rays carry the same sign.

For sufficiently small $delta$, we stop at the largest $N = N \( delta \)$ for which $delta s_N lt.eq alpha$.
  In particular,

#[#set math.equation(numbering: n => "(4.3)")
 $ alpha \/ L < delta s_N lt.eq alpha \, wide N \( delta \) arrow.r oo . $ <eq:polygon-terminal-scale>]

The choice of $alpha$ includes all enlarged neighborhoods used below, not just the supports of the potentials.
  A fixed exterior pad contains the necessary grid cells and reference variables.
  There are no spins to integrate outside the polygon. The total overhang accumulated up to scale $s_N$ is at most
  a fixed multiple of $s_N$, since the spacings form a geometric progression.
  Consequently an outer truncation beyond this pad has no effect on any nonzero potential.

Cell indices distinguish different lifts even when their projected centers coincide.
  Within any ordinary chart we use the integer coordinates of the projected grid.
  At spacing $s$, let $f_i$ be the current child potentials and let $cal(C)_j$ be the $L^2$ children of the parent
  at spacing $s' = L s$. Set

$ cal(C)_j = L j + { - \( L - 1 \) \/ 2 \, dots.h \, \( L - 1 \) \/ 2 }^2 \, wide F_j = sum_(i in cal(C)_j) f_i \, $

$ I_j = { x : ∥x - s' j∥_oo < 4 s' } . $

Coordinates in this display are the ordinary chart coordinates.
  Integrating $I_j$ means integrating the free polygon spins and old reference variables lying there.
  The support of $F_j$ lies well inside $I_j$.

Here is the regular operation of [18]. Fix a numerical range $D_0 =
  100$ and attach a fair reference coin to every pair of distinct parents at sup-norm distance at most $D_0$ in
  parent units. A parent is selected when every incident coin favors it.
  The incident comparisons form its #emph[comparison star]. Let $A_j$ be its selection indicator and

$ p_(upright("sel")) = bb(E)_(upright("ref")) A_j = 2^(- \( \( 2 D_0 + 1 \)^2 - 1 \)) . $

Thus $p_(upright("sel")) > 0$ is fixed independently of $L$, and distinct selected squares are separated.
  Order comparisons by length and then by independent continuous priorities.
  For a comparison edge $e$, let $d_e A_j$ be the Doob difference obtained by revealing its coin under the
  reference law. This is a local function of the star at $j$:
  it vanishes if an earlier comparison has already disfavored $j$.

For fixed old field variables, decorate the new coins successively by normalized likelihoods

#[#set math.equation(numbering: n => "(4.4)")
 $ frac(e^(U_e), bb(E)_e e^(U_e)) \, wide U_e = p_(upright("sel"))^(- 1) sum_j F_j d_e A_j \, $ <eq:polygon-decoration>]

where $bb(E)_e$ averages the current fair coin, holding previously revealed coins fixed.
  Since each likelihood is normalized, the decoration preserves the old field marginal.
  Only finitely many likelihoods are nontrivial in this padded finite construction;
  the plane array is used to specify their local formulas. The identity $sum_e d_e A_j = A_j - p_(upright("sel"))$ gives

#[#set math.equation(numbering: n => "(4.5)")
 $ sum_j F_j + sum_e #scale(x: 120%, y: 120%)[\(] U_e - log bb(E)_e e^(U_e) #scale(x: 120%, y: 120%)[\)] =
   p_(upright("sel"))^(- 1) sum_j A_j F_j - sum_e log bb(E)_e e^(U_e) . $ <eq:polygon-decoration-identity>]

Every comparison star affecting a nonzero term is retained in full, including in the exterior pad.
  In particular, a normalizer whose old-field support meets an updated square remains in the expression being
  integrated.

Given the coins, each normalizer on the right of (4.5) meets at most one selected square.
  This is the local separation property of [18] Lemma 3.1, #emph[Separation of the terms to be integrated].
  Its argument is exactly local: if the endpoint neighborhoods of a comparison could meet two selected squares,
  then for a short comparison the selected centers would be too close;
  for a long comparison an endpoint has already lost its shorter comparison with the nearby selected center.
  Its Doob difference is then zero. The same assertion holds for each selected $F_j$.
  If $H_j$ is the sum of all terms meeting a selected $I_j$, replace it by

#[#set math.equation(numbering: n => "(4.6)")
 $ log bb(E)_0^eta \[ e^(H_j) divides I_j^c \] . $ <eq:polygon-conditional-addition>]

The notation $I_j^c$ includes all unintegrated spins and old reference variables; the new coins are held fixed.
  Pure conditional laws in the selected squares are independent given their exterior,
  also when a square intersects the polygon boundary. Thus these replacements preserve the integrated weight
  exactly. They leave all old variables in the field, with pure conditional law in each updated square.

Large potentials are handled by the real-valued modification of the same map.
  Attach to each child an independent environmental threshold uniform on $\[ b_0 \, 2 b_0 \]$,
  and call the child a flag if its norm exceeds that threshold.
  A parent within $10 D_0$ parent units of a flag is inactive.
  Set its $F_j$ to zero in (4.4), retain its child terms separately,
  and keep its comparison coins in the full stars. Every retained term that touches an active selected square is
  included in that square’s integration. Its small support prevents it from touching two such squares.

Put $d_0 = 4 C + 10$. An isolated group is a nonempty group $A$ of flags of child-grid diameter at most $6 d_0$,
  with no other flag within $100 D_0$ parent units of $A$. Choose a representative by independent priorities,
  let $j \( A \)$ be its parent, and set

$ G_A = sum_("dist" \( i \, A \) lt.eq 3 d_0) f_i \, wide I_A = I_(j \( A \)) . $

For large $L$, $G_A$ is supported deep inside $I_A$. The inactive region keeps all active integrations and nonzero
  active coin normalizers away from $I_A$. Let $B_A$ be the sum of the remaining terms touching $I_A$.
  Replace $G_A$, retaining $B_A$, by

#[#set math.equation(numbering: n => "(4.7)")
 $ R_A = log bb(E)_0^eta \[ e^(B_A + G_A) divides I_A^c \] -
   log bb(E)_0^eta \[ e^(B_A) divides I_A^c \] . $ <eq:polygon-isolated-ratio>]

The isolated groups are separated. The identity

#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E)_0^eta \[ e^(B_A + R_A) divides I_A^c \] = bb(E)_0^eta \[ e^(B_A + G_A) divides I_A^c \]
   $ <eq:polygon-isolated-exactness>]

shows why the background $B_A$ must be kept in this exact operation.
  Its removal will be used only in estimating the norm. Allocate each integrated term to its integration parent,
  allocate retained terms to their parents, and split the remaining pair terms between their endpoints,
  as in the fixed local rules of [18].

We next specify the scalar subtractions. Fix $B$ larger than all the support and determining-range constants,
  in parent units, and call a cell at spacing $s$ a boundary cell if its center is within $B
  s$ of the polygon boundary. The constant $B$ is fixed before $L$.
  At every scale, including the initial one, use the full-plane pure centering from [18] outside the boundary
  cells. For a boundary-cell potential in the $+ +$ construction, subtract its $bb(E)_0^(+ +)$ expectation.
  Subtract that same scalar from the corresponding potential in the $+ -$ construction.

#thm([Lemma 4.3.])[
  (Exact boundary implementation).  #emph[For the terminal scale chosen above,
    the local construction is exact for each fixed environment and realization of its priorities and thresholds.
    Its potentials have support and environmental dependence radius at most $C s_k$.
    Outside the boundary cells they are the plane potentials, or zero outside the pad.
    The two pin assignments admit the same scalar subtractions.
    More precisely, there is a scalar $a_delta$, independent of the pin assignment, such that
#[#set math.equation(numbering: n => "(4.9)")
 $ cal(Z)_J^eta / cal(Z)_0^eta = e^(a_delta) bb(E)_0^eta exp #h(-0.16667em) (sum_i f_i^(\( N \) \, eta)) \, wide
   eta in { + + \, + - } . $ <eq:polygon-exact-partition>]

 The initial boundary norms are uniformly $O_(s_0) \( theta \)$.]
] <lem:boundary-exactness>

#proof[
  Allocate the initial bond perturbations as in [18] Section “Tuning a trajectory with vanishing perturbations”,
    using only bonds present in the polygon. A cell receives the allocated terms $\( K_e - K_0 \) sigma_x
    sigma_y$, followed by the specified centering. For fixed $s_0$ there are boundedly many such terms per cell,
    and $\| K_e - K_0 \| = O \( theta \)$; this proves the initial bound.
    Subtracting constants changes only the scalar partition factor.
  The identities (4.5), (4.6), and (4.8) prove exactness at each step.
    They hold for every conditional pure probability kernel; the presence of the boundary merely reduces the set
    of spins integrated in a square. The allocation and status checks use the same finite stencils as in the
    plane. The choice of $C$ in the local map already covers these stencils and the $C \/
    L$ overhang from the child scale. Restricting the pure integrations to polygon spins does not enlarge either
    radius. This proves locality. Choosing $B$ with slack so that $B > C_1 + B \/ L$,
    where $C_1$ bounds the complete parent determining radius,
    shows inductively that every input of a nonboundary output is also nonboundary.
    There the construction is precisely the plane construction. The pad similarly contains all possibly nonzero outputs.
  Every determining neighborhood sees at most one local pin sign.
    Spin flip commutes with the conditional integrals, and with every algebraic operation in the decoration and
    the isolated ratio. Hence changing that sign conjugates the local potential by simultaneous flip of its spin
    and pin arguments. The corresponding norms agree; using the same thresholds and priorities therefore gives the
    same flags, isolation decisions, and local scalar subtraction.
    If no pin lies in a determining neighborhood, its potential is spin-flip even.
    The constants used for boundary centering are deterministic functionals of the local potential:
    dependence on the fixed pure polygon does not introduce dependence on remote random bonds.
  In particular the $+ -$ potentials need not be centered for the pure $+ -$ expectation.
    Exactness only requires that the subtracted constants agree between the two constructions.
    Iterating the exact identities with those constants gives (4.9). ◻
]

=== 4.2 Contraction of the boundary potentials <contraction-of-the-boundary-potentials>

Let $X_k$ be the root moment of the plane potentials supplied by Proposition 4, with its fixed order $P > 2$, and let

#[#set math.equation(numbering: n => "(4.10)")
 $ Z_k = max_(i upright(" a boundary cell")) #scale(x: 120%, y: 120%)[\(] bb(E) ∥f_i^(\( k \) \, + +)∥_oo^P
   #scale(x: 120%, y: 120%)[\)]^(1 \/ P) . $ <eq:polygon-boundary-moment>]

The maximum is zero if there are no boundary cells. By local spin-flip conjugacy the same quantity bounds the
  $+ -$ construction. We take the maximum of the individual moments, rather than the moment of a maximum.
  No stationarity along the polygon boundary is required.

#thm([Lemma 4.4.])[
  (Boundary recurrence).  #emph[The scale-step parameters can be chosen in the order:
    $L$ sufficiently large, $b_0$ sufficiently small, and $s_0$ sufficiently large, so that for all $k < N$,
#[#set math.equation(numbering: n => "(4.11)")
 $ Z_(k + 1) lt.eq q_(*) Z_k + C_L X_k + C_(L \, b_0) \( Z_k + X_k \)^2 \, wide q_(*) < 1 . $ <eq:boundary-recurrence>]

 The constants are independent of the polygon and the mesh,
   provided the determining neighborhoods have the boundary geometries and chart properties specified above.
   For sufficiently small $theta$, the boundary moments remain uniformly small and tend to zero as the scale index
   tends to infinity, uniformly over all the finite runs.]
] <lem:boundary-recursion>

#proof[
  There are four contributions to the recurrence. The linear transfer of boundary logs contracts by the summable
    side estimate; unflagged Taylor remainders are small because their input norms are at most $2 b_0$.
    On flagged stencils, a distant independent flag gives an extra moment factor.
    The remaining dependent logs form an isolated group, to which the positive-weight transfer estimate applies.
    Bulk inputs in each case are bounded by a constant times $X_k$.
  We first estimate the linearized regular map. Its plane formula from [18] Lemma 3.2,
    #emph[Regular linearization] remains valid before the specified output centering:
  $ p_(upright("sel"))^(- 1) A_j sum_(i in cal(C)_j) bb(E)_0^(+ +) \[ f_i divides I_j^c \] . $
  The derivative of each coin normalizer is zero, and the derivative of a conditional log integral is conditional
    expectation. For a boundary child the pure mean is zero, so its transferred supremum is bounded by its
    oscillation. The reference variables in its patch are integrated with their pure product law.
    The same bound for the other pin assignment follows by the local flip described in Lemma 10.
  We claim that the sum of the transfer coefficients over boundary children in one determining stencil is
    $o_L \( 1 \)$. Distances in the next paragraph are measured in child units.
    All these cells lie in a strip of fixed width $B$ along a side.
    If a cell is within a fixed distance of a corner or a change,
    choose an inner sector shell containing its whole support and determining patch.
    The corner or change estimate of Lemma 6, composed to a radius proportional to $L$,
    makes its transfer coefficient tend to zero as $L$ grows.
    All those shells fit inside the parent integration square with room to condition onward.
  For the remaining cells let $t$ be their distance along the side to the nearest corner or change, capped at $L$;
    in a neighborhood without a feature set $t = L$. Once $t$ exceeds a fixed support-dependent constant,
    a straight half-shell reaches a radius proportional to $t$ without seeing a different boundary condition.
    Its coefficient is at most $C' t^(- 2)$ by Lemma 6. On a free side the full determining stencil avoids pins,
    so the potential is even, as required by that lemma. There are $O \( t \)$ boundary cells in each dyadic range
    $\[ t \, 2 t \]$, including $O \( L \)$ in the last capped range.
    Consequently, for any sufficiently large fixed $t_0$,
  #[#set math.equation(numbering: n => "(4.12)")
   $ sum_i a_(i \, L) lt.eq sum_(t_i lt.eq t_0) a_(i \, L) + C'' / t_0 \, wide lim_(L arrow.r oo) a_(i \, L) =
     0 quad upright("for each member of the first, bounded list") . $ <eq:boundary-summable-transfer>]
  First choosing $t_0$ and then $L$ proves the claim. The same calculation holds for a fixed enlargement of the
    child patches or the boundary strip. Patches with no free spins cause no difficulty,
    since only their reference variables remain to be integrated.
  Multiplication by $A_j \/ p_(upright("sel"))$ costs at most $p_(upright("sel"))^(- 1)$,
    which is independent of $L$, and output centering costs at most a factor two.
    Minkowski’s inequality and (4.12) therefore bound the boundary-child part of the linearized output by
    $o_L \( 1 \) Z_k$. All bulk inputs can be bounded crudely, giving $C_L X_k$.
    Only finitely many fixed shell ratios are needed once $L$ is fixed;
    we subsequently choose $s_0$ large enough for all their pure estimates.
  It remains to control the actual map in the $P$th moment. Set $X = Z_k + X_k$.
    Every child norm in an enlarged determining stencil has root moment at most $X$.
    On a stencil without flags, every child norm is at most $2 b_0$.
    Conditional integrations are probability kernels, so the regular map has uniform Taylor bounds after $L$ is
    fixed. Writing $S$ for the sum of its child norms, its remainder is bounded by $C_L S^2 lt.eq C_L b_0 S$.
    Its root-moment cost is thus $C_L b_0 X$. The real map, without any smallness restriction,
    has the crude bound $C_L S$ by $\| log bb(E)_0 e^H \| lt.eq ∥H∥_oo$ and the analogous Lipschitz bound for
    differences of such logarithms.
  Small flag probability alone would not improve this last estimate in the $P$th moment.
    We use the location of the flags, as in [18] Section “The contribution of isolated large terms”.
    Enlarge the determining stencil to include all isolation checks and all child neighborhoods of radius $100 D_0
    L + 2 C$ about a contributing child. If a flag $h$ in this enlarged stencil is farther than $2
    C$ child units from a charged child $i$, their environmental dependence neighborhoods are disjoint.
    Its fresh threshold is independent too, and Markov’s inequality gives $bb(P) \( h upright(" is a flag") \)
    lt.eq b_0^(- P) X^P$. Hence
  #[#set math.equation(numbering: n => "(4.13)")
   $ bb(E) #h(-0.16667em) [∥f_i∥_oo^P upright(bold(1))_({ h upright(" is a flag") })] =
     bb(E) ∥f_i∥_oo^P thin bb(P) \( h upright(" is a flag") \) lt.eq C_(b_0) X^(2 P) . $ <eq:boundary-independent-flag>]
  There are only finitely many charges for fixed $L$, so these contributions cost $C_(L \, b_0) X^2$ in root moment.
  If no such independent flag is available for a contributing term,
    every relevant flag lies within $2 C$ of that term. These flags form one bounded child-radius group.
    The enlarged stencil contains the whole isolation neighborhood,
    so either they are an isolated group of the construction, or a farther flag is present and (4.13) applies.
    In the isolated case, all logs possibly dependent on the triggering flags are included in $G_A$.
    For every probability kernel $P_0$,
  #[#set math.equation(numbering: n => "(4.14)")
   $ lr(|log frac(P_0 e^(B_A + G_A), P_0 e^(B_A)) - log P_0 e^(G_A)|) lt.eq
     2 ∥B_A∥_oo . $ <eq:boundary-remove-background>]
  Each child in $B_A$ is outside the concentration neighborhood and is independent of an actual triggering flag.
    Its occurrence can again be charged using (4.13). The same applies to every term omitted from the concentrated
    contribution.
  After this estimate, the only remaining large term to bound is the centered form of
  $ log bb(E)_0^(+ +) \[ e^(G_A) divides I_A^c \] . $
  Corollary 7 applies to this positive weight for any size of $∥G_A∥_oo$.
    A group containing a boundary child has bounded child diameter.
    There are boundedly many possible flag patterns at each anchor and boundedly many logs in each concentration
    neighborhood, with bounds independent of $L$. Thus its logs all lie in a fixed enlargement of the boundary
    strip, and the shell coefficient at its anchor multiplies the sum of their norms.
    Summing over all possible boundary anchors gives the same arbitrarily small sum as in (4.12).
    We may sum before taking the root moment by Minkowski’s inequality;
    neither a supremum over anchors nor independence among their events is needed.
    Groups containing only bulk inputs contribute at most $C_L X_k$ by the crude bound.
    The linearized terms restricted to flagged stencils, if subtracted in comparing the two maps,
    obey the identical dichotomy: either charge them to an independent flag or use the linear shell transfer for
    the bounded local group.
  Combining these estimates gives
  $ Z_(k + 1) lt.eq #scale(x: 120%, y: 120%)[\(] o_L \( 1 \) + C_L b_0 #scale(x: 120%, y: 120%)[\)] Z_k +
    C'_L X_k + C_(L \, b_0) \( Z_k + X_k \)^2 . $
  Choose $L$ so the first term leaves a strict contraction margin, then choose $b_0$ within that margin,
    and finally choose $s_0$ for the finite list of pure shell estimates.
    These choices are compatible with the parameter freedoms in Proposition 4. This proves (4.11).
  For completeness, take a deterministic scalar majorant for all the finite polygon runs,
    starting from their uniform $O_(s_0) \( theta \)$ bound and iterating the right side of (4.11).
    Choose a small invariant interval so that the quadratic term has Lipschitz constant less than half the
    remaining contraction margin. Proposition 4 makes $sup_k X_k$ as small as required by decreasing $theta$;
    the initial majorant is small by the same choice. The majorant therefore stays in that interval.
    Since $X_k arrow.r 0$, its limsup $z$ satisfies $z lt.eq q_(*) z + C_(L \, b_0) z^2$, which forces $z =
    0$ in the chosen interval. This proves uniform smallness and decay. ◻
]

=== 4.3 Completion of the partition comparison <completion-of-the-partition-comparison>

#proof[
  All determining stencils used in Lemma 11 lie in ordinary injectively projected charts.
    The physical-edge signs within each such stencil have their usual iid law.
    In particular, disjoint dependence neighborhoods used in (4.13) are genuinely independent.
    There is no requirement of independence between different sheets:
    the entire enlarged stencil, including its overhang, was placed in one ordinary chart before the terminal
    scale was selected.
  By (4.3), the number of possibly nonzero terminal potentials, including those in the pad,
    is bounded for this fixed polygon. This bound may depend on its geometry and on $alpha$, but not on the mesh.
    Proposition 4 and Lemma 11 therefore give
  $ S_delta = sum_i max_(eta in { + + \, + - }) ∥f_i^(\( N \) \, eta)∥_oo arrow.r 0 quad
    upright("in ") L^1 upright(" of the environment and construction choices") . $
  Applying (4.9) yields
  $ lr(|log cal(Z)_J^eta / cal(Z)_0^eta - a_delta|) lt.eq S_delta \, wide eta in { + + \, + - } . $
  The common scalar cancels from the difference. Since $tanh$ is Lipschitz,
    (4.2) proves the comparison with an error bounded by $S_delta$.
    The partition ratios themselves do not depend on the construction choices.
    Averaging the bound over those choices thus gives convergence in environmental probability alone.
  The local boundary shapes are the straight side, the two orthogonal corner angles,
    and a single fixed/free change. Their constants, and all scale-map parameters,
    were chosen independently of the polygon; only the positive terminal physical scale depended on it.
    This proves the asserted uniform disorder threshold. On the dual grid, duality replaces $v_e$ by $2 \/ v_e$,
    hence $theta xi_e$ by $- theta xi_e$. This has the same environmental law, and the same argument applies. ◻
]

== 5 Four marked boundary points and the exploration drawing <sec:pure>

Proposition 9 compares the random model with the pure model on the same finite graph.
  We now identify the pure limit and specify the finite exploration laws that will be used after stopping.
  The distinction between an actual FK crossing and an interface pairing is important:
  deterministic boundary closures give the two events different relative weights.

=== 5.1 Pairings and boundary closures <pairings-and-boundary-closures>

At each lattice edge, the medial representation has a tile with four ports and two noncrossing pairings of those
  ports. The open state joins the two primal corners; the other state joins the dual corners.
  Joining the ports of adjacent tiles gives loops and, at marked boundary changes, open strands.
  Give an open switch local weight $v_e \/ sqrt(2)$ and a closed switch weight $1$.
  The #emph[open-cap law] assigns a configuration weight equal to the product of its local switch weights times
  $\( sqrt(2) \)^ell$, where $ell$ is the number of internal closed loops. Open strands receive no extra factor.
  At the pure critical odds $v_e = sqrt(2)$, the two local weights are equal.

Label the four ports in cyclic order by $a \, b \, c \, d$, with designated primal arcs $a b$ and $c d$.
  There are two noncrossing pairings: $E_(upright(P)) = { a arrow.l.r d \, med
  b arrow.l.r c }$ and $E_(upright(D)) = { a arrow.l.r b \, med c arrow.l.r d }$.
  Under separate primal closure, $E_(upright(P))$ is exactly the event of an actual primal crossing;
  under separate dual closure, $E_(upright(D))$ is the analogous dual event.

A four-change exploration also specifies a distinguished starting port and follows the unique strand issuing from
  that port until it reaches another marked port. This choice is part of the experiment,
  independent of the cyclic labels used for the electrodes.
  In the short-interval experiment of Section 8, the chosen port is the original chordal starting point.

This is a finite measure defined by the loop representation.
  It need not be identified with a boundary partition of the original primal graph.
  The following exact change of measure supplies the connection.

#thm([Lemma 5.1.])[
  (Cap change).  #emph[Let $p$ be the probability of $E_(upright(P))$ in a four-change open-cap law with arbitrary
    positive FK edge odds. Under separate primal closure, the probability of an actual primal crossing is
#[#set math.equation(numbering: n => "(5.1)")
 $ cal(G) \( p \) = frac(p, p + sqrt(2) \( 1 - p \)) . $ <eq:cap-change>]

 The same formula holds for conditional probabilities after any exploration history that reveals only encountered
   switches. The density between the two full-configuration laws and its reciprocal are bounded by absolute
   constants. The analogous statement holds with primal and dual interchanged.]
] <lem:cap-change>

#proof[
  Fix the internal switches. The two possible boundary pairings acquire numbers of additional loops differing by
    one under separate primal closure. The noncrossing outcome acquires the extra factor $sqrt(2)$.
    The local edge factors are unchanged. Thus the separate-closure law has density proportional to
    $upright(bold(1))_(E_(upright(P))) + sqrt(2) upright(bold(1))_(E_(upright(D)))$ relative to the open-cap law.
    Normalization proves (5.1) and the density bounds. Conditioning this same two-valued density on the full
    revealed history proves the conditional identity. In particular,
    no Markov property of a putative limiting curve is being used.
    This is the finite cap calculation of [17] Section “Alternating tests after exploration”;
    it does not require constant edge odds. ◻
]

=== 5.2 The pure four-point limit on a flat disk <the-pure-four-point-limit-on-a-flat-disk>

For a marked conformal disk $\( P \; a \, b \, c \, d \)$, let $psi : P arrow.r
  bb(H)$ send $\( a \, c \, d \)$ to $\( 0 \, 1 \, oo \)$ and put $chi = psi \( b \) in \( 0 \, 1 \)$.
  The primal electrodes are $a b$ and $c d$. With the convention above,
  $E_(upright(P))$ is rare when $chi arrow.b 0$. Define

#[#set math.equation(numbering: n => "(5.2)")
 $ f \( chi \) & = frac(sqrt(1 - sqrt(1 - chi)), sqrt(1 - sqrt(chi)) + sqrt(1 - sqrt(1 - chi))) \,\
g \( chi \) & = frac(f \( chi \), f \( chi \) + sqrt(2) \( 1 - f \( chi \) \)) . $ <eq:four-point-functions>]

The function $f$ is the pure open-cap pairing probability;
  $g$ is the actual crossing probability under separate primal wiring.
  The normalization agrees with the $q = 2$ specialization in [17] Proposition “Jordan-quad transfer”.
  In the convention of [6] Equation (1.1), setting $u = 1 - chi$ gives the complementary pairing probability $1 -
  f \( chi \)$. This accounts for the apparent reversal of the small-interval limit between the two conventions.
  In particular,

#[#set math.equation(numbering: n => "(5.3)")
 $ f \( 1 - chi \) = 1 - f \( chi \) \, wide f \( chi \) tilde.op sqrt(chi \/ 2) quad \( chi arrow.b 0 \) .
   $ <eq:four-point-properties>]

Both functions are continuous on $\[ 0 \, 1 \]$ and smooth in its interior.

#thm([Proposition 5.2.])[
  (Pure four-point limit).  #emph[Let $P$ be a fixed collared orthogonal polygon that is a topological disk in an
    oriented flat surface with a locally injective translation projection to the plane.
    Put four distinct marks in straight boundary portions. Approximate $P$ by its lifted square grid at mesh
    $delta arrow.b 0$, with critical odds $sqrt(2)$ on every edge.
    Then the open-cap probability of $E_(upright(P))$ tends to $f \( chi_P \)$,
    and the probability of an actual crossing between separately wired arcs $a b$ and $c
    d$ tends to $g \( chi_P \)$. The conclusion also holds for compatible medial approximations differing by an
    incident boundary layer.]
] <prop:pure-four-mark>

#proof[
  For a planar polygon this is the four-mark observable theorem of Chelkak–Smirnov [6] Theorem 6.1,
    with boundary pairings and deterministic closures converted as in Lemma 12.
    We explain why its proof applies to $P$. This is necessary because the projection of $P$ need not be injective.
  #emph[The finite observable.] The construction combines the two Dobrushin observables obtained by joining $c$ to
    $d$, or $a$ to $d$, with a deterministic exterior arc. Its local s-holomorphic identities and its relation to
    the two pairing weights are identities on tiles. The primitive of its square is single-valued on the disk and
    is constant on each of the four boundary arcs. In cyclic order its normalized boundary values are $0 \, 1 \,
    kappa_delta \, kappa_delta$. If $p_delta = bb(P)_(upright("open")) \( E_(upright(P)) \)$, the exact relation is
  #[#set math.equation(numbering: n => "(5.4)")
   $ kappa_delta = (frac(t_delta^2 + sqrt(2) t_delta, t_delta^2 + sqrt(2) t_delta + 1))^2 \, wide t_delta =
     frac(1 - p_delta, p_delta) . $ <eq:primitive-parameter>]
  This extends continuously to $p_delta = 0 \, 1$ and is one-to-one.
    It is the normalization in [6] Equations (6.1)–(6.6), with their pairing probability equal to $1 - p_delta$.
  The phases can be computed in the frame supplied by the projection.
    A simple closed curve bounding a disk in this flat surface has total turning $2 pi$ by Gauss–Bonnet.
    Closing an observable path by a boundary arc therefore gives the same phase relations as in the plane.
    The collar accommodates the deterministic closing arcs. There is no additional period for the primitive or
    ambiguity in the half-differential on a simply connected polygon.
  #emph[Compactness and boundary values.] The bounds on the primitive use its boundary values,
    the local boundary modification by half-rhombi, and the discrete maximum principle.
    They do not require a global injective coordinate. Interior estimates for the observable and its primitive
    apply in ordinary projection charts. A finite chart cover of each compact subset consequently gives
    subsequential convergence to a bounded harmonic primitive $H$ whose complex differential has the corresponding
    holomorphic square root.
  The constant data and one-sided normal conditions pass to the limit near open straight sides by the same
    boundary estimates. In each such chart, comparison with distant boundary data first stops at the boundary of a
    small chart neighborhood; the comparison function there is bounded.
    Its contribution near the side is then suppressed by ordinary planar discrete harmonic measure.
    Corners have ordinary wedge charts. Their isolated values do not affect the bounded harmonic Dirichlet
    problem. The marked points lie in straight portions, so their two one-sided conditions are handled in disjoint
    neighborhoods in the same way.
  #emph[Identification of the remaining constant.] The sign condition needed here is concrete.
    Denote the two auxiliary primitives by $H_delta^bullet$ and $H_delta^compose$,
    on the black and white graphs of the observable construction, respectively.
    The black primitive is subharmonic and the white one superharmonic; these color names follow [6].
    On the arc $c d$, $H_delta^bullet$ at an inward neighbor is at least its boundary value $kappa_delta$.
    On $d a$, $H_delta^compose$ has the reversed inequality. These follow from the observable’s boundary tangent
    condition and the half-face modification in [6] Section 6.
  To see that these conditions survive in the required sense,
    suppose that a limiting harmonic primitive satisfies $H <
    kappa$ on a small interior contour $cal(C)$ whose endpoints lie in a straight subinterval of $c d$.
    Enclose the region between this contour and the subinterval, entirely within one chart.
    Let $V_delta$ be the discrete harmonic measure of a smaller subinterval strictly between the endpoints.
    It vanishes on the contour. Discrete Green’s formula and the inward inequality give
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(u in cal(C)_delta) V_delta \( u_(upright("in")) \) #scale(x: 120%, y: 120%)[\(] H_delta^bullet \( u \) -
     kappa_delta #scale(x: 120%, y: 120%)[\)] w_u gt.eq 0 \, $ <eq:local-boundary-sign>]
  where $u_(upright("in"))$ is the inward neighbor and $w_u > 0$ is the local conductance;
    multiple boundary incidences are summed separately. On a fixed middle portion,
    $V_delta \( u_(upright("in")) \) gt.eq c_1 delta$ and there are order $delta^(- 1)$ incidences.
    Compact convergence thus bounds that portion of the sum above by a fixed negative number $- c$.
    At distance $r$ from an endpoint, the local harmonic-measure bound is $V_delta \( u_(upright("in")) \) lt.eq
    C delta r^(eta - 1)$ for some $eta > 0$. Summing over the endpoint portions of length $mu$,
    and using the bounded primitive, gives a contribution at most $C mu^eta$.
    The remaining compact portion has nonpositive contribution for small mesh.
    Thus (5.5) would imply $0 lt.eq - c + C mu^eta$, a contradiction for small $mu$.
    The dual argument excludes $H > kappa$ near a subinterval of $d a$.
    This is exactly the local comparison in [6] Equations (6.8)–(6.10); all its objects lie in one chart.
  Pull the limiting boundary-value problem to a conformal disk.
    For $0 < kappa < 1$ its solution is the imaginary part of a conformal map to a horizontal strip of height one
    with a slit at height $kappa$, sending $a$ to the lower left end, $b$ to the right end,
    and $c$ to the upper left end. If $d$ mapped to the lower slit bank rather than the tip,
    one would have $H < kappa$ near a part of $c d$; the upper bank would give $H > kappa$ near a part of $d a$.
    The preceding contradiction excludes both. It also excludes $kappa = 0 \, 1$ when the four marks are distinct.
    Since the polygon boundary is Jordan in the surface, every nonempty boundary interval contains a straight
    subinterval on which the argument can be applied.
  Consequently $d$ maps to the slit tip. In the normalized half-plane quad $\( bb(H) \; 0 \, chi_P \, 1 \, oo \)$
    the strip parameter is $kappa = 1 - chi_P$. Solving (5.4) for the pairing probability gives (5.2).
    This identifies every subsequential limit.
  #emph[Boundary-layer conventions.] If the chosen medial graph differs from a primal polygon approximation by an
    incident layer, place an easier and a harder orthogonal quad in the collar, with strict margins.
    The easier quad extends beyond the two free sides and ends inside the two wired sides.
    Restrict the target and test to their shared grid edges. The target’s unmatched pieces attach only at the two
    electrodes and cannot join the opposite exterior zones. Their induced partition is therefore dominated by
    separate wiring of the easier electrodes. Every target crossing contains a shared-edge test crossing.
    This gives the upper comparison by FK monotonicity. Interchanging the roles with the harder quad gives the
    lower comparison. These are intrinsic disk statements on the same lifted grid,
    as in [17] Proposition “Jordan-quad transfer”. Let the mesh tend to zero with margins fixed,
    then shrink the margins. Marked Jordan convergence in the collared disk gives convergence of the two moduli to
    $chi_P$, completing the proof. ◻
]

#thm([Corollary 5.3.])[
  (Fixed quenched tests).  #emph[For each fixed polygon $P$ in Proposition 13,
    assign to every lifted edge the random odds of its projected edge.
    At the critical inverse temperature of Theorem 1, the separately wired actual crossing probability tends in
    environmental probability to $g \( chi_P \)$. The open-cap probability tends to $f \( chi_P \)$.]
] <cor:fixed-tests>

#proof[
  Combine Proposition 9 with Proposition 13, then invert the strictly increasing continuous map $cal(G)$ in (5.1). ◻
]

We fix a countable stock $cal(T)$ of these tests. A member is specified by finitely many rational rectangular
  projection charts, rational rectilinear cells in those charts,
  and finite incidence data recording which copies of overlapping cells belong to the same sheet.
  The selected cells form a collared disk, with four marks in straight portions.
  Include the dual versions and all finite parity and boundary-layer placements needed for the medial drawing.
  There are countably many finite descriptions of this kind.
  Every compact collared polygon away from finitely many punctures can be approximated,
  with prescribed strict margins, by such a test. Crucially,
  a description records the same projected grid edges on every occurrence of a sheet.
  It never replaces the projected disorder by independent copies.

=== 5.3 A drawing compatible with conditional FK laws <a-drawing-compatible-with-conditional-fk-laws>

The usual medial curve can visit a lattice point more than once.
  For the slit-domain geometry we separate its local passages by a fixed deterministic convention.
  The convention must retain the original conditional FK law;
  an arbitrary simple perturbation of a curve would not suffice.

#thm([Lemma 5.4.])[
  (Compatible drawing).  #emph[The exploration in a filled lattice domain has a tile-and-collar drawing in a
    Jordan polygon $V_n$ with the following properties.]
  #{ set enum(numbering: "i."); [
  + #emph[The marked boundary of $V_n$ has the same uniform Jordan limit as that of $D_n$.]
  + #emph[The drawn strand $hat(gamma)_n$ is simple, follows the same ordered local pieces as $gamma_n$,
    and satisfies $d_(upright("curv")) \( hat(gamma)_n \, gamma_n \) = O \( delta_n \)$.]
  + #emph[After a switch-revealing stop, the remaining domain is a simple slit disk.
    Under deterministic cap closure the unknown edges have their original FK odds,
    with the revealed open edges contracted and revealed closed edges deleted.]
  + #emph[Each bank of the prefix has physical access, within $O \( delta_n \)$,
    to its corresponding known edges and boundary wire. Every completion embeds its actual primal and dual paths
    without crossing the past. No uncertain physical edge is duplicated.]
] }
  #emph[The same drawing and caps can be used away from an interval at which two extra boundary changes are inserted.]
] <lem:compatible-drawing>

#proof[
  We recall the finite construction of [17] Lemma “A compatible simple drawing”.
    Make one tile for every edge, including boundary edges. Glue the four triangles directed toward an interior
    square center. For each boundary edge, keep its exterior triangle as a separate tab with its own exterior dual
    vertex. Different exterior tabs are not glued along their radial sides;
    primal boundary vertices retain their interior incidences. Flatten the tabs and add a thinner Jordan collar.
    The displacement is $O \( delta_n \)$, and tracing the tabs in the original boundary order proves (i).
  Draw the two possible switches as disjoint local arcs. Draw boundary caps and the wires behind them in the
    collar; unmatched ports lead to the marked outer points. There are finitely many local choices,
    all made deterministically. The switches follow the prescribed medial pairings.
    Where a wired boundary edge is bypassed by a cap, either switch state gives the same continuation of the
    inside ports, up to a microscopic detour and possibly a microscopic loop.
    The edge still retains its random state in the FK law. On the free side,
    the cap around a primal vertex gives the turn beside the dual boundary wire.
    Match the ordered pieces of the original and drawn strands.
    Each matched pair lies in a bounded number of neighboring tiles;
    the resulting increasing parametrizations prove (ii).
  The tile Euler identity gives the FK component weight under each deterministic closure.
    Revealing an encountered switch therefore does exactly the usual contraction or deletion and leaves the other
    edge odds unchanged. This proves (iii), including a stop inside a tile if that entire encountered tile is revealed.
  On an open primal turn the bank uses the actual revealed edge; on the other turn it stays at a primal corner.
    Along a cap it stays at a vertex or follows vertices of the same wire interval.
    These pieces give the asserted short physical accesses. The dual statement is identical.
    The embedding of every completion follows from the local noncrossing pairings.
    Projection back to the original grid moves points by $O \( delta_n \)$ and duplicates no edge,
    although separate boundary copies of a vertex can project to one physical vertex. This proves (iv).
    None of the construction uses equality of edge odds. ◻
]

All later stopping rules reveal only encountered switches.
  If a stop occurs during a drawn local piece, its tile is already known;
  completing that tile changes the geometric prefix only within $O \( delta_n \)$.
  The filtration can therefore include capacity times as well as switch times without querying a future switch.

== 6 Quenched arm bounds and compactness of the explorations <sec:tightness>

The polygon comparison concerns deterministic domains. To use it after an exploration,
  we first need geometric control of the random prefixes. We obtain that control from the local annulus barriers
  of [18]. All radii in this section are physical radii, fixed before the mesh tends to zero.
  In particular, the argument does not require an annulus estimate uniform down to the lattice spacing.

=== 6.1 Fixing the environment <fixing-the-environment>

Write $bb(P)_(upright("env"))$ for probability over the bonds.
  Use the countable stock $cal(T)$ of collared polygon tests from Section 5,
  with its fixed rounding prescriptions, dual-grid versions, and finite sheet-incidence data.
  Its strict-margin approximation property will allow tests selected from a limiting geometry to be chosen from
  this one countable stock.

The second countable collection consists of square annuli of the fixed ratio in Lemma 3.
  Their centers and inner radii range over dense countable sets;
  the collection again includes both colors and the required incident-layer conventions.
  Call an annulus good when its quenched probability of an actual radial crossing is at most $1 -
  c_0$ under the law wiring both rims together. Here $c_0 > 0$ is the constant from that lemma.
  An actual crossing uses ordinary open edges; identification of the rims does not itself count as a crossing.

#thm([Lemma 6.1.])[
  (A deterministic subsequence of environments).  #emph[From every subsequence of the prescribed meshes one can
    extract a further deterministic subsequence such that, for $bb(P)_(upright("env"))$-almost every environment,
    the following hold:]
  + #emph[every test in $cal(T)$ has the pure limiting crossing probability of Proposition 13;]
  + #emph[every fixed annulus in the second collection is eventually good.]
] <lem:quenched-diagonal>

#proof[
  For each fixed polygon, Corollary 14 gives convergence in environmental probability.
    For each fixed physical annulus, its inner radius in lattice units tends to infinity,
    so Lemma 3 gives goodness with probability tending to one. Enumerate the tests and annuli.
    Choose the $j$th mesh of the further subsequence so that the probability of an error larger than $1 \/
    j$ in any of the first $j$ polygon tests, or failure of goodness for any of the first $j$ annuli,
    is at most $2^(- j)$. The Borel–Cantelli lemma proves the simultaneous assertions.
    Independence between different meshes is not used. The dual assertions follow in the same way,
    since the critical odds duality preserves the law of the environment. ◻
]

Until the last paragraph of Section 8, fix an environment in the full-probability event of this lemma and use $n$
  for its further subsequence. All probabilities henceforth concern FK configurations in this fixed environment.
  Their bounds may depend on that environment through how small the mesh must be.

For $z in bb(C)$ and $0 < r < R$, let $A \( z \; r \, R \)$ denote a Euclidean annulus.
  Its lattice version includes an incident layer at each rim.
  Write $phi.alt_(n \, z \; r \, R)^(upright(w))$ for the full-grid FK law in this annulus,
  with both rims wired together, and $cal(R)_n \( z \; r \, R \)$ for its ordinary radial crossing event.
  Either the primal grid with its odds, or the dual grid with the dual odds, may be used in this notation.

#thm([Lemma 6.2.])[
  (Full-grid arm bound).  #emph[For every fixed $R > 0$ and bounded set $K subset bb(C)$,
#[#set math.equation(numbering: n => "(6.1)")
 $ lim_(r arrow.b 0) limsup_(n arrow.r oo) sup_(z in K) phi.alt_(n \, z \; r \, R)^(upright(w))
   #scale(x: 120%, y: 120%)[\(] cal(R)_n \( z \; r \, R \) #scale(x: 120%, y: 120%)[\)] = 0 . $ <eq:full-grid-arm>]

 The same conclusion holds for actual arms in subgraphs of the annulus whose induced boundary partition has no
   wire attachments away from the rims, apart from ordinary identifications at the same physical vertex.
   It also bounds the event that an arm occurs in any of a collection of such subgraphs,
   when all are dominated on their shared edges by one full-grid annulus.]
] <lem:full-grid-arm>

#proof[
  Fix an integer $m$. Once $r \/ R$ is sufficiently small, an arm from radius $r$ to radius $R$ must cross $m$
    separated intermediate square annuli of the fixed barrier ratio.
    The square annuli may have fixed positive gaps between them and the two original rims.
    Choose their centers from a sufficiently fine finite net of the bounded set $K$,
    and their radii from the dense countable collection. The gaps allow these choices with enough slack that the
    assertion holds for every center $z in K$. Only finitely many fixed annuli are involved for this choice of
    $r \, R \, m$.
  By Lemma 16, they are all good for sufficiently large $n$.
    Condition on all edges outside one intermediate annulus. The induced partition of its boundary is dominated by
    the partition wiring its two rims together. Its conditional crossing probability is therefore at most $1 -
    c_0$. Successive conditioning over the separated annuli gives the bound $\( 1 - c_0 \)^m$.
    Letting $m$ tend to infinity proves (6.1). The finite net depends on $r$;
    this causes no problem because $r$ precedes the mesh limit.
  For the last assertions, fill the missing ordinary edges,
    identify copies of the same physical vertex when necessary, and wire the rims.
    FK monotonicity for $q = 2$ dominates the original law on all shared edges.
    Every original actual arm gives a radial path in this completion.
    The absence of other wire attachments is exactly what ensures domination by this boundary partition.
    Boundedly many lattice-step changes of the rims are absorbed in the fixed gaps. ◻
]

=== 6.2 Drawn paths and avoidable annular crossings <drawn-paths-and-avoidable-annular-crossings>

Use the simple tile-and-collar drawing of Lemma 15. Denote its Jordan domain by $V_n$ and its strand by
  $hat(gamma)_n$. The original physical exploration $gamma_n$ and $hat(gamma)_n$ have oriented curve distance
  $O \( delta_n \)$. A prefix reveals only the switches it has encountered;
  the current tile may already be revealed in full. Between switch revelations,
  the motion along its known local arc is deterministic. Under a deterministic closure,
  the remaining random edges have their exact FK conditional law.
  Known bank edges and wire incidences have accesses to the corresponding side of the slit within
  $O \( delta_n \)$, and ordinary paths of the remaining graph have representatives in the slit disk.
  These are finite drawing and domain-Markov facts, so they hold for the inhomogeneous odds here.

The two arcs of the prime boundary of a Dobrushin slit disk are the primal and dual designated arcs.
  At a revealing stop, call a component of $U_n ∩ A \( z \; r \, R \)$ #emph[avoidable] if it does not separate
  the tip access from the target access in the remaining domain $U_n$.
  A future radial traversal contained in such a component is an unforced crossing in the terminology of [14].

#thm([Lemma 6.3.])[
  (Macroscopic avoidability).  #emph[For every fixed outer radius $R > 0$,
    the conditional probability of a future unforced crossing of $A \( z \; r \, R \)$ tends to zero as $r arrow.b
    0$ after the mesh limit, uniformly over revealing histories and centers in a bounded set.
    The assertion remains true if the stop occurs during a revealed local arc.]
] <lem:macroscopic-avoidability>

#proof[
  The missing-color argument is the one used in the #emph[Macroscopic avoidability] Lemma of [17] Section
    “Identification of the Dobrushin strand”; we verify its probabilistic input in the present setting.
    An avoidable component cannot access the relative interiors of both designated prime boundary arcs strictly
    between the rims. To see this in the finite slit disk, join interior points on the two short access arcs by a
    path in the open annular component. Removing loops and shortening the accesses gives a crosscut between the
    two designated arcs, still between buffered rims. In the prime-end disk its endpoints lie on opposite boundary
    arcs between tip and target, so the crosscut separates those two ends.
    Coincident physical points on opposite banks are distinct prime accesses in this argument.
    An incidence at the current tip tile can be moved a bounded number of lattice steps along its bank and is
    absorbed by the rim buffers. Choose the color whose designated arc is absent.
    A future strand traversal has a bank of that color, and the bank shadows an actual radial path in a slightly
    cropped annulus. A known open edge or a wire incidence of that color in the middle would give an
    $O \( delta_n \)$ access to its designated arc. This is excluded by the choice of component.
  To handle all components with this missing color simultaneously,
    keep the union of their uncertain edges between buffered grid rims and condition on its complement.
    Apply FK comparison to this joint conditional law on the union, rather than to separate component marginals.
    Away from those rims, all induced attachments are ordinary physical-vertex incidences:
    any other attachment would have the forbidden access to the designated arc.
    Fill to the full grid and wire the rims. Lemma 17 bounds the probability of any of their actual arms by a
    single full-grid arm probability. Sum over the two possible missing colors.
    The fixed buffers absorb the error of a tile, including the last local arc at the stop. ◻
]

Choose initial conformal maps $phi_n : V_n arrow.r bb(D)$ taking the two chordal ends to $- 1$ and $1$,
  with a convergent interior normalization. Marked uniform Jordan convergence implies that the maps and inverses
  are asymptotically uniformly continuous on the closures. Put $eta_n = phi_n compose hat(gamma)_n$.
  Lemma 18 has the same fixed-scale conclusion in this common disk.
  To see this, fix a disk-coordinate outer radius. Uniform continuity gives a fixed positive physical outer radius
  and, as the disk-coordinate inner radius tends to zero, a physical inner radius tending to zero.
  A disk-coordinate crossing contains a crossing of the fitted physical annulus.
  This physical annulus lies between the two disk-coordinate rims;
  each of its components is contained in a component of the original annulus, so avoidability is preserved.
  The same conclusion also follows directly from the missing-color argument on that subcrossing.

=== 6.3 Counting whole components <counting-whole-components>

For a curve $alpha$ and $rho > 0$, let $N_rho \( alpha \)$ be the largest number of successive displacements of
  size at least $rho$: it is the supremum of integers $m$ for which there are ordered times $t_0 < dots.h.c <
  t_m$ with $\| alpha \( t_j \) - alpha \( t_(j - 1) \) \| gt.eq rho$ for $1 lt.eq j lt.eq m$.
  This quantity is unchanged by increasing reparametrization.

#thm([Proposition 6.4.])[
  (Tightness of curves and prefixes).  #emph[For every $rho > 0$,
    the variables $N_rho \( hat(gamma)_n \)$ are stochastically bounded.
    This holds for Dobrushin strands and for four-change strands with four fixed separated limiting marks,
    in either deterministic separate closure or open-cap normalization.
    It also holds for all their stopped prefixes. Their laws are tight in the uniform oriented-curve topology
    modulo increasing reparametrization, both in physical coordinates and in the common disk coordinates.]
] <prop:curve-tightness>

#proof[
  Fix a point away from the limiting marked points. Choose a small outer ball, with a fixed buffer,
    which meets at most one boundary condition type. Such a ball exists by uniform marked Jordan convergence:
    away from the changes, the two types lie on disjoint compact boundary arcs.
    If the ball is interior, choose either color; otherwise choose the color with no designated wire in that ball.
    For a four-change law, use the deterministic separate closure of this color.
    Its density relative to the open-cap law, and the reciprocal density,
    are bounded by constants depending only on $q$.
  Consider $m$ disjoint radial traversals of an annulus inside this ball,
    and crop its inner and outer rims by fixed factors. The territorial argument of [17] Section “Identification
    of the Dobrushin strand”, Lemma “Territorial arm counting” gives at least $m \/ 2 -
    O \( 1 \)$ distinct actual crossing components of the chosen color in the cropped graph.
    Here is the needed form of that argument. The simply drawn traversal arcs are disjoint radial separators in a
    wider annulus. On the indicated side of each separator, a path in the color territory shadows an ordinary edge
    path: in a tile it moves to the appropriate corner, and passage to another corner uses the actual edge
    prescribed by the switch. The error is bounded by a fixed number of lattice steps.
    Keep short territorial tails out to the wider rims before cropping.
    Paths assigned to different intervening strips cannot meet in the cropped graph without crossing a separator.
    At most two assignments belong to a single strip. No cap joins different vertices of this color in the
    buffered ball, because it contains no wire of that color.
    Tabs and any separate boundary copies are retained while making this planar argument.
  Condition on the graph outside the crop, allowing arbitrary rim partitions.
    Explore the actual components meeting its inner rim one at a time;
    component here means connected by ordinary open edges, ignoring artificial rim identifications.
    After a crossing component has been completely explored and removed,
    all edges from it to the remaining interior have been revealed closed.
    Thus its removal creates no remote interior wiring. The only arbitrary identifications left in the conditional
    law are still at the rim bands. Deleted closed edges weaken the full-grid comparison,
    and identification of copies of the same physical vertex in that comparison can only strengthen it.
  Choose the fixed inner radius sufficiently small that the full-grid arm probability in a slightly narrower crop
    is at most $1 \/ 2$ for all sufficiently large $n$, by Lemma 17.
    At every completed component exploration the conditional chance that any crossing component remains is
    therefore at most $1 \/ 2$. Equivalently, after exploring noncrossing components until the next crossing is
    found, the same bound applies again. If $K_n$ is the number of actual crossing components, induction gives
  $ bb(P) \( K_n gt.eq k \) lt.eq 2^(- k) \, wide k gt.eq 1 \, $
  with an immaterial adjustment of the first factor. This proves a geometric tail for the number of strand
    traversals at these fixed scales. The argument uses whole-component exploration,
    not independence of distinct components.
  Now fix a displacement accuracy $rho$. Surround the marked points by disjoint neighborhoods of diameter much
    smaller than $rho$. For every other possible curve point choose an inner ball and an outer ball as above,
    with outer diameter much smaller than $rho$. The inner balls cover the remaining compact set,
    and a finite subcover suffices. Every displacement of size $rho$ has a subpassage outside the mark
    neighborhoods which enters one of these inner balls and leaves its outer ball.
    Consequently an excessive number of displacements forces excessive traversals of at least one annulus in this
    finite family. The geometric tails just proved bound $N_rho$ in probability.
  Apply this bound at a sequence of accuracies decreasing to zero, with summable failure probabilities.
    Subdivision at the successive displacement times gives the usual Arzelà–Ascoli compactness criterion for
    curves modulo increasing reparametrization. Finitely many meshes discarded by the limsup can be accommodated
    separately. Prefixes have no more displacements than their full curves.
    Uniform continuity of the initial charts transfers the conclusion to the common disk. ◻
]

=== 6.4 Small crosscuts and the tip <small-crosscuts-and-the-tip>

Curve tightness alone does not identify the order in which a limiting curve traverses a Loewner hull.
  We next control the tip by an interior point of the inverse Loewner map.
  The argument adapts the small-crosscut method of [14] Section 3.4, Proposition 3.12 and Theorem 3.11;
  the preceding fixed-scale bounds suffice for the version used here.

Let

$ Psi \( z \) = i frac(1 + z, 1 - z) \, wide Gamma_n = Psi compose eta_n . $

The finite drawings may be chosen polygonal with their terminal pieces approaching the marked endpoints
  nontangentially in their polygon sectors. The simple chord $Gamma_n$ then has a continuous Loewner driver $W_n$
  and is parametrized by half-plane capacity with

#[#set math.equation(numbering: n => "(6.2)")
 $ partial_t g_(n \, t) \( z \) = frac(2, g_(n \, t) \( z \) - W_n \( t \)) \, wide g_(n \, 0) \( z \) =
   z . $ <eq:loewner-clock>]

Its full capacity interval is $\[ 0 \, oo \)$: the terminal sector maps to a nontangential approach to infinity,
  whereas a hull of bounded capacity has bounded height. Write $eta_n \( t \)$ also for the disk curve with this
  clock. For fixed $T \, R < oo$, set

$ tau_n \( T \, R \) = T and inf { t gt.eq 0 : \| W_n \( t \) \| gt.eq R } \, wide H_n \( t \, y \) =
  Psi^(- 1) #h(-0.16667em) (g_(n \, t)^(- 1) \( W_n \( t \) + i y \)) . $

#thm([Proposition 6.5.])[
  (Macroscopic tip approximation).  #emph[For every $T \, R < oo$ and $epsilon > 0$,
#[#set math.equation(numbering: n => "(6.3)")
 $ lim_(y arrow.b 0) limsup_(n arrow.r oo) bb(P)
   (sup_(0 lt.eq t lt.eq tau_n \( T \, R \)) \| H_n \( t \, y \) - eta_n \( t \) \| > epsilon) =
   0 . $ <eq:tip-approximation>]

]
] <prop:tip-approximation>

#proof[
  We first describe the deterministic obstruction to a good approximation,
    and then bound its probability using actual stopping rules.
    On the indicated range, the half-plane hull lies in a fixed bounded region:
    the standard Loewner height and horizontal-range bounds use only $T$ and $R$.
    Thus the disk prefix stays outside a fixed cap at $1$. The inverse map is close to the identity near infinity,
    so the crosscuts used below also stay outside a possibly smaller fixed target cap.
  For each $t$ and sufficiently small $y$, the length-area estimate for $Psi^(- 1) compose
    g_(n \, t)^(- 1)$ supplies a radius $y' in \[ y \, sqrt(y) \]$ whose upper semicircle about $W_n \( t \)$ has
    an image crosscut $C$ of length at most $c \/ sqrt(\| log y \|)$.
    Indeed, integration of the squared image lengths with logarithmic measure is bounded by a constant times the
    area of $bb(D)$; see also [19] Proposition 2.2. The crosscut contains $w =
    H_n \( t \, y' \)$ and separates the tip access from the target.
    The hyperbolic geodesic from $w$ to that tip is the image of the vertical segment from $W_n \( t \) +
    i y'$ to $W_n \( t \)$ and contains $H_n \( t \, y \)$. By the diameter form of the Gehring–Hayman
    theorem [19] Theorem 4.20, used in the same way in [14] Proof of Theorem 3.11,
    if $w$ can be joined to the tip in the slit disk by a path of diameter $a$,
    this geodesic has diameter at most a universal constant times $a$.
    The assertion extends to prime-end endpoints by taking limits.
  Fix a small crosscut cutoff $r$. Decrease $y$ until the above crosscuts have diameter less than $r$.
    A small perturbation of their endpoints, retaining $w$, gives regular endpoints with distinct physical
    positions and diameter less than $2 r$. The prime boundary maps are continuous for each finite simple drawing;
    we may avoid the slit root and tip in this perturbation. If both endpoints lie on the original disk circle,
    the small circle cap cut off by $C$ has diameter $O \( r \)$ and avoids the target.
    Since $C$ separates tip from target, the tip is in this cap.
    It can be joined to $w$ there; an existing slit disjoint from the crosscut does not change this separation.
  Otherwise let $s$ be the latest prefix time at an endpoint of $C$.
    If $eta_n \[ s \, t \]$ stays in a small ball about $eta_n \( s \)$,
    following $C$ to that endpoint and then the prime bank to the tip gives a small-diameter path from $w$ to the
    tip. Hence failure of the claimed tip accuracy implies a fixed $b > 0$,
    depending on $epsilon$ but independent of $r \, y \, n$, such that
  #[#set math.equation(numbering: n => "(6.4)")
   $ eta_n \[ s \, t \] subset.not B \( eta_n \( s \) \, b \) . $ <eq:gate-excursion>]
  At time $s$, the crosscut joins the tip either to an earlier slit point or to the original circle.
    In the first case it and the intervening prefix form a Jordan loop.
    In the second case use the prefix from its beginning and the circle arc avoiding the target to close the loop.
    The portion of the disk cut off by this loop is on the non-target side.
    The tail relevant to (6.4) lies on that side: it is disjoint from $C$,
    and its final tip access is separated from target by $C$.
    This is the small gate whose probability we must control; Figure 2 illustrates the case of two slit endpoints.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  merge-path({bezier((-0.392, 0.504), (-0.5152, 0.2464), (-0.4032, 0.4032), (-0.4592, 0.336)); bezier((-0.5152, 0.2464), (-2.072, -1.4), (-1.12, -0.224), (-2.24, -0.672)); bezier((-2.072, -1.4), (1.4, -2.072), (-1.904, -2.744), (0.336, -2.968)); bezier((1.4, -2.072), (0.112, 0.56), (2.408, -1.232), (1.96, 0.504)); bezier((0.112, 0.56), (-0.168, 0.504), (0, 0.5712), (-0.0896, 0.5488)); line((-0.168, 0.504), (-0.392, 0.504))}, close: true, fill: rgb("#f0f0ff"), stroke: none)
  circle((0, 0), radius: (4.032, 3.304), stroke: (paint: rgb("#808080"), thickness: 0.65pt, cap: "round", join: "round"))
  circle((-0.168, 0.504), radius: 0.6944, stroke: (paint: rgb("#a6a6a6"), thickness: 0.5pt, cap: "round", join: "round", dash: (3pt, 2pt)))
  circle((-0.168, 0.504), radius: 1.814, stroke: (paint: rgb("#a6a6a6"), thickness: 0.5pt, cap: "round", join: "round", dash: (3pt, 2pt)))
  content((0.4816, -0.3808), [#text(fill: rgb("#666666"))[#text(size: 9pt)[inner rim]]])
  content((-1.848, 1.288), [#text(fill: rgb("#666666"))[#text(size: 9pt)[outer rim]]], anchor: "east", padding: 0.1176cm)
  bezier((-4.032, 0), (-0.616, 0.6496), (-3.024, 1.232), (-1.288, 1.176), stroke: (paint: rgb("#000000"), thickness: 1.05pt, cap: "round", join: "round"))
  bezier((-0.616, 0.6496), (-0.392, 0.504), (-0.4704, 0.6048), (-0.4144, 0.56), stroke: (paint: rgb("#000000"), thickness: 1.05pt, cap: "round", join: "round"))
  bezier((-0.392, 0.504), (-0.5152, 0.2464), (-0.4032, 0.4032), (-0.4592, 0.336), stroke: (paint: rgb("#000000"), thickness: 1.05pt, cap: "round", join: "round"))
  bezier((-0.5152, 0.2464), (-2.072, -1.4), (-1.12, -0.224), (-2.24, -0.672), stroke: (paint: rgb("#000000"), thickness: 1.05pt, cap: "round", join: "round"))
  bezier((-2.072, -1.4), (1.4, -2.072), (-1.904, -2.744), (0.336, -2.968), stroke: (paint: rgb("#000000"), thickness: 1.05pt, cap: "round", join: "round"))
  bezier((1.4, -2.072), (0.112, 0.56), (2.408, -1.232), (1.96, 0.504), stroke: (paint: rgb("#000000"), thickness: 1.05pt, cap: "round", join: "round"))
  bezier((0.112, 0.56), (-0.168, 0.504), (0, 0.5712), (-0.0896, 0.5488), stroke: (paint: rgb("#000000"), thickness: 1.05pt, cap: "round", join: "round"))
  bezier((-0.616, 0.6496), (-0.392, 0.504), (-0.4704, 0.6048), (-0.4144, 0.56), stroke: (paint: rgb("#0000a6"), thickness: 2.4pt, cap: "round", join: "round"))
  bezier((-0.392, 0.504), (-0.5152, 0.2464), (-0.4032, 0.4032), (-0.4592, 0.336), stroke: (paint: rgb("#0000a6"), thickness: 2.4pt, cap: "round", join: "round"))
  bezier((0.112, 0.56), (-0.168, 0.504), (0, 0.5712), (-0.0896, 0.5488), stroke: (paint: rgb("#0000a6"), thickness: 2.4pt, cap: "round", join: "round"))
  content((-0.6944, 0.28), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$J$]]], anchor: "east", padding: 0.1176cm)
  content((0.1456, 0.728), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$K$]]], anchor: "west", padding: 0.1176cm)
  line((-0.168, 0.504), (-0.392, 0.504), stroke: (paint: rgb("#cc6600"), thickness: 1.05pt, cap: "round", join: "round", dash: "densely-dotted"))
  content((-0.28, 0.8176), [#text(fill: rgb("#cc6600"))[#text(size: 9pt)[$C$]]], anchor: "south", padding: 0.1176cm)
  circle((-0.168, 0.504), radius: 0.04762, fill: black, stroke: none)
  content((0.0224, 0.2464), [#text(size: 9pt)[$eta (s)$]], anchor: "west", padding: 0.1176cm)
  bezier((-0.168, 0.504), (-0.8176, -1.176), (-0.168, 0.0448), (-1.053, -0.672), stroke: (thickness: 1.15pt, cap: "round", join: "round"))
  bezier((-0.8176, -1.176), (0.1456, -2.173), (-0.6384, -1.546), (0.2128, -1.658), stroke: (thickness: 1.15pt, cap: "round", join: "round"), mark: (end: ">"))
  content((0.5712, -0.9856), [#text(size: 9pt)[trapped tail#linebreak()$eta (s,t]$]])
  bezier((-0.168, 0.504), (2.139, 1.411), (0.1232, 1.31), (1.154, 1.669), stroke: (thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"))
  bezier((2.139, 1.411), (4.032, 0), (2.878, 1.254), (3.562, 0.672), stroke: (thickness: 0.8pt, cap: "round", join: "round", dash: "dashed"), mark: (end: ">"))
  content((1.938, 2.05), [#text(size: 9pt)[available access#linebreak()to $b$ at time $s$]])
  circle((-4.032, 0), radius: 0.04233, fill: black, stroke: none)
  circle((4.032, 0), radius: 0.04233, fill: black, stroke: none)
  content((-4.099, 0), [#text(size: 9pt)[$a$]], anchor: "east", padding: 0.1176cm)
  content((4.099, 0), [#text(size: 9pt)[$b$]], anchor: "west", padding: 0.1176cm)
  content((-1.243, -2.688), [#text(size: 9pt)[earlier prefix]], anchor: "north", padding: 0.1176cm)
})],
    caption: [Figure 2: A small gate with both endpoints on the slit, shown schematically. The endpoints of $C$ lie on an earlier piece $J$ and a later piece $K$; $eta \( s \)$ is the latest endpoint along the prefix. The gate and the intervening prefix enclose the shaded region. A macroscopic tail inside that region crosses the two rims, while at time $s$ there is an available route to the target on the other side of the gate. The dashed route denotes this possible access, not another sampled continuation. The annular radii and gate width are not drawn to scale. ],
  ) <fig:tip-gate>
  Subdivide the curve successively into pieces of diameter less than $b \/ 100$,
    by ending a piece when it attains a chosen still smaller fixed diameter.
    Subdivide each of the two original circle arcs into pieces with the same diameter bound.
    The number of curve pieces is stochastically bounded by Proposition 19.
    Every gate just constructed has its two endpoints in a pair $\( J \, K \)$,
    where $K$ is a later curve piece and $J$ is an earlier curve piece or a circle piece.
    They cannot belong to the same curve piece: that would make the loop too small to contain the excursion in (6.4).
  For each ordered pair use the following revealing stopping rule during piece $K$:
    stop the first time in a finite deterministic schedule that there exists a crosscut of diameter at most $2
    r$ from the current tip to an earlier point of $J$. Only non-root slit endpoints and circle-interior endpoints
    are admitted. Such a schedule can always detect the witness above.
    At fixed mesh there are finitely many complete switch configurations.
    For each configuration exhibiting a witness choose one witness time in an exploration-compatible clock,
    and take the union of those finitely many times. Although the selections used the full configurations,
    their union is a deterministic schedule. The detection test at each scheduled time depends only on the current
    prefix. It is therefore a stopping rule, and it occurs no later than the witness time for the pair in
    question. If a time is inside a local piece, only its already encountered switch is revealed.
    A witnessing crosscut at detection may also be selected deterministically from the current history.
  Let $C_1$ be this first detected crosscut for the witness pair.
    We claim that its trapped region and that of $C$ agree outside $B \( eta_n \( s \) \, b \/ 8 \)$,
    after taking $r$ sufficiently small. To prove this, compare the two closed loops modulo two.
    Their long common prefix segments cancel. The remaining prefix subarcs lie in $J$ and $K$,
    and the other remaining arcs are $C$ and $C_1$; in the circle case there is also a subarc of the one circle
    piece $J$. The two pieces have small diameter and are joined by a small crosscut.
    Thus this entire symmetric difference is confined to the displayed ball.
    The winding numbers modulo two of the loops coincide outside it.
    Since each loop is Jordan, its winding parity is exactly the indicator of its trapped region there.
    This proves the claim without any bound on the length or shape of the intervening common prefix.
  The far excursion in (6.4) consequently visits the region cut off by $C_1$.
    At detection, its tip endpoint has access to the target side directly across $C_1$ within a ball of radius
    $O \( r \)$. An excursion reaching the far trapped region either starts into that region at the detecting tip,
    or enters it later through $C_1$, since the other sides of its boundary belong to the past or the original
    boundary. Both entrances occur inside the inner ball. The excursion therefore produces a radial crossing,
    on the trapped side, from radius $4 r$ to a fixed radius, say $b \/ 3$, about the detection tip.
    Outside the inner ball, the trapped region is bounded only by the past and the original boundary.
    Its annular components therefore cannot connect to the target-side region without entering the inner ball.
    A route from tip to target is available on the other side of the gate and avoids all these components,
    so they are avoidable. The argument allows repeated future crossings of the fictitious crosscut;
    every such entrance still occurs inside the inner rim.
  By the disk version of Lemma 18, the probability of this event for each ordered pair tends to zero as $r arrow.b
    0$ after the mesh limit. To finish, first use Proposition 19 to bound the number of pieces with arbitrarily
    high probability. The resulting number of pairs is finite and independent of $r$.
    Next choose $r$ to make the sum of their crossing bounds small,
    and finally choose $y$ small enough for the crosscut construction.
    This proves (6.3) with the asserted order of limits. ◻
]

#thm([Lemma 6.6.])[
  (No return from a small target cap).  #emph[Let $theta_n \( r \)$ be the first time $eta_n$ enters the disk cap
    $bb(D) ∩ B \( 1 \, r \)$. For every $b > 0$,
$ lim_(r arrow.b 0) limsup_(n arrow.r oo) bb(P) #scale(x: 120%, y: 120%)[\(] "diam"
  eta_n \[ theta_n \( r \) \, oo \) > b #scale(x: 120%, y: 120%)[\)] = 0 . $

]
] <lem:no-return>

#proof[
  At first entrance, the cap has not previously been visited.
    It gives a route from the tip access to the target inside a ball of radius $O \( r \)$.
    Stop at the entering local piece and allow a one-step buffer.
    A subsequent displacement of diameter $b$ forces a crossing from an enlarged inner rim to a fixed positive
    distance, and every relevant annular component is avoidable because of that tip-to-target route.
    Apply Lemma 18 in disk coordinates. This is also the proof of the corresponding target-cap Corollary in [17]
    Section “Identification of the Dobrushin strand”. Initial inverse-chart continuity gives the analogous
    assertion in physical coordinates. ◻
]

== 7 Four-mark tests after exploration <sec:slits>

Proposition 9 concerns a fixed polygon. The conditional law seen by an exploration lives instead in a domain whose
  boundary contains the entire past of the curve. We now extend the four-mark test to these remaining domains.
  The main geometric step is to place the relevant part of such a domain in a compact portion of a covering
  surface. A polygon in that surface still uses the original square grid, so Proposition 9 applies to it.

Throughout this Section we fix the deterministic subsequence and the environment supplied by Lemma 16.
  In particular, the fixed polygon limits hold simultaneously for the countable stock of rational polygons on
  finitely many square-grid charts, for both colors. All probabilities below are quenched.
  Limits of probabilities are taken along this subsequence; a geometric radius is fixed before the mesh tends to zero.

We use the simple drawings of Lemma 15. A #emph[history] is a prefix stopped by a rule that reveals only the
  switches encountered by the strand. Its remaining domain is the slit disk $U_n$,
  viewed with its prime-end boundary. Under separate primal closure,
  the two primal boundary intervals are wired separately; we call them the #emph[electrodes].
  An actual connection between them uses open edges, together with the identifications within each electrode.
  A #emph[possible connection] means a connection after all unrevealed edges of the tested color have been
  allowed, before any jump along an external wire. Known bank edges have the physical accesses described in Lemma 15.

#thm([Proposition 7.1.])[
  (Four-mark test in a remaining domain).  #emph[Consider the four-change open-cap law and any sequence of
    switch-revealing stopping rules before completion of its strand.
    Let $A_n$ be events determined by the stopped history. Suppose that, on $A_n$,
    there are basepoints $z_n$ and constants $r_0 \, alpha_0 > 0$, independent of $n$ and of the history, such that]
  + #emph[$B \( z_n \, r_0 \) subset U_n$;]
  + #emph[in the conformal disk chart normalized at $z_n$, the four current prime-end marks, including the tip,
    have pairwise distance at least $alpha_0$ on the unit circle.]
  #emph[Assume also that the stopped prefixes form a tight family in the oriented-curve topology,
    as in Proposition 19. Write $cal(F)_n$ for the stopped information, $E_(upright(P))$ for the primal pairing,
    and $chi_(U_n)$ for the ordered cross-ratio of the four current marks. Then, for every $t > 0$,
#[#set math.equation(numbering: n => "(7.1)")
 $ bb(P)_(upright("open"))
   (A_n ∩ {lr(|bb(P)_(upright("open")) \( E_(upright(P)) divides cal(F)_n \) - f \( chi_(U_n) \)|) > t}) arrow.r
   0 . $ <eq:slits-moving-test>]

 The basepoints may be selected from the history. The original domains lie in a fixed bounded set,
   so every deterministic sequence of these basepoints has a convergent subsequence.]
] <prop:moving-test>

The function $f$ is the open-cap function of Proposition 13.
  Under separate closure the corresponding crossing function is

#[#set math.equation(numbering: n => "(7.2)")
 $ g \( chi \) = T \( f \( chi \) \) \, wide T \( p \) = frac(p, p + sqrt(2) \( 1 - p \)) . $ <eq:slits-odds>]

It will suffice to prove an upper bound by $g \( chi_(U_n) \)$ for the conditional primal crossing probability.
  The identical upper bound for the dual crossing, together with $f \( 1 - chi \) = 1 -
  f \( chi \)$ and the exact conditional change of closure, will give both sides of (7.1).

=== 7.1 Physical access and the cost of deleting small balls <physical-access-and-the-cost-of-deleting-small-balls>

The first two lemmas isolate the probabilistic part of the comparison.
  They are the chart and deletion arguments of [17] Section “Alternating tests after exploration”,
  with the one-arm input replaced by Lemma 17. We give their proofs to specify precisely which boundary
  identifications are allowed.

Map $U_n$ to

$ R_n = \( 0 \, 1 \) times \( 0 \, h_n \) $

so that the electrodes are the vertical sides, and let $u_n$ denote the first coordinate.
  The assumptions of Proposition 22 keep $h_n$ in a compact subinterval of $\( 0 \, oo \)$.

#thm([Lemma 7.2.])[
  (Small physical paths have small chart oscillation).  #emph[Under the base-disk and mark-separation assumptions
    above, there is a common modulus $omega \( r \) arrow.b 0$ such that the oscillation of $u_n$ on any connected
    path in $U_n$ of physical diameter at most $r$ is at most $omega \( r \)$.
    The statement includes prime-end accesses by interior approximation.]
  #emph[Consequently, for every $beta > 0$, a possible connection starting in
#[#set math.equation(numbering: n => "(7.3)")
 $ B_n \( beta \) = { beta lt.eq u_n lt.eq 1 - beta } $ <eq:slits-wide-band>]

 must travel a fixed positive physical distance before reaching an electrode or a known open bank edge of the
   tested color, for all sufficiently small meshes. The distance is uniform in the history.]
] <lem:slits-chart>

#proof[
  Choose a disk $O$ containing all physical domains with a fixed margin.
    For a small ball away from $B \( z_n \, r_0 \/ 2 \)$, the probability that Brownian motion from $z_n$ hits
    that ball before leaving $O$ tends uniformly to zero with its radius.
    For example, the logarithmic harmonic function in an enclosing annulus gives a bound of order $1 \/ \| log
    r \|$. Killing earlier on leaving $U_n$ only decreases this probability.
  In the normalized unit disk, a connected set of diameter at least $a >
    0$ has hitting probability from the origin bounded below by a positive number depending only on $a$.
    This is the crosscut form of the Beurling estimate: a connected set joining two separated small sectors is
    either met before exit or separates a boundary interval of uniformly positive harmonic measure from the
    origin. The estimate also applies to connected sets close to the circle; the set itself,
    rather than its boundary projection, lies in the disk. Conformal invariance therefore implies that a small
    physical path away from the basepoint has small diameter in the disk chart.
    Near the basepoint the same conclusion follows from interior distortion on the fixed base disk.
    The maps from the disk to $R_n$ form a compact family on the closed disk because the four angles remain
    separated. This proves the asserted modulus for $u_n$.
  Every electrode attachment and every known open bank edge has an access to $u_n = 0$ or $u_n =
    1$ within $O \( delta_n \)$, by Lemma 15. A short possible connection from $B_n \( beta \)$ to such an
    attachment would, after adding this access, have chart oscillation at least $beta$ and physical diameter
    tending to zero. Choose the physical distance so that its modulus is smaller than $beta \/ 2$,
    and then absorb the tile error by taking $n$ large. This also shows that the two electrodes have not already
    met along the revealed bank under the stated localization. ◻
]

#thm([Lemma 7.3.])[
  (Deletion in a central band).  #emph[Fix a history and use separate closure for the tested color.
    Delete a set $S$ of unrevealed edges. The change in the probability of an actual electrode-to-electrode
    connection is at most the original conditional probability that an endpoint of an edge in $S$ has an actual
    connection to an electrode, allowing one edge of $S$ as an initial test step.]
  #emph[If the deleted incidences lie in $B_n \( beta \)$ and in a union of $m$ balls of radius $r$,
    where $m$ is fixed, this cost tends to zero uniformly in their centers and in the histories, in the order
$ lim_(r arrow.b 0) limsup_(n arrow.r oo) . $

 The same conclusion holds with a fixed number of nested bands and slightly enlarged balls.]
] <lem:slits-deletion>

#proof[
  Couple the original law and the law with the edges in $S$ closed monotonically.
    Explore, in the stronger configuration, the actual clusters from the deletion endpoints,
    revealing their incident edges in both configurations. FK partition monotonicity remains valid at each step.
    Once these clusters are enclosed by their closed edge cuts,
    the conditional laws outside agree and may be coupled identically.
    If no explored cluster reaches an electrode, the crossing decision is the same.
    Known connections along a bank count as electrode access in this argument.
  For the second assertion choose an outer radius $R_beta > 0$ using Lemma 23.
    Every component of possible edges in a ball of radius $R_beta$ that meets the deleted central incidences has
    no accessible wire or known open attachment there. All its remaining boundary identifications arise at the rim
    of the ball. Project this graph to the physical grid, fill missing edges,
    identify any copies of a physical vertex, and wire the rim.
    These operations increase the induced FK partition and dominate its actual arm event.
    Cropping the annulus by a few tile widths accommodates the drawing and the possible initial test step.
    Lemma 17 bounds the resulting probability of an arm from radius $r$ to $R_beta$ by a quantity tending to zero
    in the asserted order. A union bound over the fixed $m$ balls completes the proof. ◻
]

=== 7.2 Fibers that become crosscuts of a cover <fibers-that-become-crosscuts-of-a-cover>

We next construct a comparison domain without regularizing the slit boundary itself.
  The argument is deterministic. Consider a sequence of localized histories whose prefixes converge after
  increasing reparametrizations. The initial boundary curves converge as well.
  After passage to a subsequence, the basepoints converge to $z$, the remaining domains have pointed kernel $U$,
  their boundaries have a Hausdorff limit, and the four normalized boundary angles converge.
  Here $U$ means the component containing $z$. The normalized maps from the disk converge on compact subsets,
  as do the inverse rectangle parametrizations, which we denote by $F_n : R_n arrow.r U_n$.
  Every point of $partial U$ is approached by complements of $U_n$.
  These uses of normalized kernel convergence and prime-end parametrization are the usual conformal mapping facts;
  see [19].

Fix a small trimming parameter $a_(*) > 0$, and then choose $0 < beta < a_(*) \/ 20$.
  We shall compare the original crossing with a test between the levels $a_(*)$ and $1 - a_(*)$.
  To control the coordinates of every possible path between these levels, choose ordered disjoint abscissa bins,
  each of width at most $lambda$ and with every intervening gap at most $lambda$, where $lambda lt.double beta$.
  Their convex hull contains $\[ 2 beta \, 1 - 2 beta \]$. Include one bin in $\( 2 beta \, 3 beta \)$ and one in
  $\( 1 - 3 beta \, 1 - 2 beta \)$; the fibers chosen in these two bins will be called the #emph[anchor fibers].
  These are distinguished members of the family, not necessarily its extreme fibers;
  the other bins may extend beyond them toward the electrodes.

#thm([Lemma 7.4.])[
  (Choice of fibers).  #emph[For every prescribed physical tail radius $r > 0$,
    one can choose a simple top-to-bottom fiber in each bin, and pass to a subsequence, with the following properties.]
  + #emph[Each fiber stays in its bin in rectangle coordinates.
    Apart from a top and a bottom tail, it converges inside a compact subset of $U$.
    Each tail is contained in a physical ball of radius $r$.]
  + #emph[All physical endpoints of all the fibers have distinct limits.]
  + #emph[The fibers are mutually disjoint and ordered by their bins.]
  #emph[The omitted top and bottom portions may have fixed, sufficiently small fractions of the rectangle height.
    The two half-fibers may use different abscissas within the same bin.]
] <lem:slits-fibers>

#proof[
  Let $I$ be one bin and let $J$ be a short interval adjacent to the top or bottom of $R_n$. By Cauchy–Schwarz,
  #[#set math.equation(numbering: n => "(7.4)")
   $ integral_I "length" #scale(x: 120%, y: 120%)[\(] F_n \( { x } times J \) #scale(x: 120%, y: 120%)[\)] thin d
     x lt.eq \( \| I \| \| J \| \)^(1 \/ 2)
     (integral_(I times J) \| F'_n \( w \) \|^2 thin d A \( w \))^(1 \/ 2) . $ <eq:slits-length-area>]
  The last integral is at most the area of the common physical enclosing disk.
    By making the height fraction sufficiently small, the set of levels with tail length exceeding $r$ occupies an
    arbitrarily small fraction of $I$.
  We can simultaneously separate the endpoints. On the compact portions of the horizontal rectangle sides
    containing the bins, harmonic measure from the basepoint is uniformly comparable to abscissa length.
    An endpoint in a small physical ball contributes at most the Brownian probability of reaching that ball before
    leaving the enclosing disk. This tends uniformly to zero as the ball shrinks,
    by the logarithmic estimate used in Lemma 23. Choose the endpoints successively,
    excluding fixed small balls around the endpoints already chosen.
    There are only finitely many choices, and these exclusions together with the length exclusions occupy less
    than the bin. A positive separation can therefore be retained before taking a subsequence.
  Choose the top and bottom levels independently, then join them by an interpolation inside the middle of the same
    bin. Interior convergence of $F_n$ gives convergence of the retained cores after a further subsequence.
    Different bins are disjoint, so the resulting fibers are disjoint and ordered.
    Endpoints can be chosen away from the finitely many tile corners and exceptional prime accesses. ◻
]

Fix an enclosing disk $O$ with a positive margin around all physical domains.
  We enlarge the domain by removing only finitely many physical points from $O$ and passing to a universal cover.
  Include every selected fiber endpoint among these punctures.
  Add finitely many points of $O \\ U_n$ whose distinct limits sample $partial U$ as finely as required.
  Write the resulting set as $P_n$ and its set of distinct limits as $P$. Let

$ pi_n : tilde(O)_n arrow.r O \\ P_n $

be the universal cover, with a chosen lift of $z_n$. Its disk uniformization is normalized by sending $0$ to this
  lift and making the derivative of the projection positive at $0$.
  Since $U_n$ is simply connected, its inclusion has a unique lift

$ iota_n : U_n arrow.r tilde(O)_n $

through the chosen basepoint. This lift is injective, because $pi_n compose iota_n$ is the inclusion.
  The surface has the ordinary physical coordinate in every sufficiently small chart; there are no branch points.

#thm([Lemma 7.5.])[
  (Cover charts and strip trapping).  #emph[By choosing the finite boundary sample sufficiently fine,
    the disk charts of $tilde(O)_n$ on the retained fiber cores and any fixed compact access paths in $U$ can be
    made arbitrarily close to those of $U_n$, for all sufficiently large $n$.]
  #emph[Give $tilde(O)_n$ rectangle coordinates using the same four disk angles as for $U_n$,
    and denote their horizontal coordinate by $v_n$. After the tail radius and chart error have been chosen
    sufficiently small relative to the bin spacing, each lifted fiber is a crosscut of the cover rectangle,
    joining its horizontal sides and lying in the corresponding abscissa bin with an arbitrarily small
    enlargement. Consequently
#[#set math.equation(numbering: n => "(7.5)")
 $ \| v_n compose iota_n - u_n \| lt.eq C lambda $ <eq:slits-chart-matching>]

 between the two extreme fibers. If $Gamma_n^(-)$ and $Gamma_n^(+)$ are the first and last fibers, respectively, then
$ v_n \( iota_n \( w \) \) & lt.eq sup_(iota_n \( Gamma_n^(-) \)) v_n &  &
  upright("on the left electrode side of ") Gamma_n^(-) \,\
v_n \( iota_n \( w \) \) & gt.eq inf_(iota_n \( Gamma_n^(+) \)) v_n &  &
  upright("on the right electrode side of ") Gamma_n^(+) . $

 In particular, the enlarged extreme bins bound these coordinates strictly outside the future test cuts at $a_(*)$
   and $1 - a_(*)$.]
] <lem:slits-cover>

#proof[
  First consider increasingly fine finite samples of $partial U$.
    The normalized projections from the unit disk to the punctured domains form a bounded normal family.
    Their derivative at $0$ is bounded below by the radius of the common base disk:
    that disk lifts to the cover, and Schwarz’s lemma gives the derivative comparison.
    Any subsequential limit is therefore nonconstant. Hurwitz’s theorem shows that it omits each point of the
    dense boundary sample. Its image is consequently contained in $U$, the component at $z$.
  Conversely, every simply connected domain compactly contained in $U$ and containing $z$ lifts into all the
    covers under consideration once $n$ is large. The same derivative comparison bounds the projection derivative
    below by the conformal radius of that domain. Exhausting $U$ and then applying Schwarz’s lemma to the limit
    map into $U$ shows equality with the conformal radius of $U$.
    Thus the limit is precisely the normalized Riemann map onto $U$.
    This proves the asserted approximation on compact sets and along their access paths.
    The order is to fix the desired compact accuracy, choose a finite puncture list,
    and only then let $n$ tend to infinity.
  For a fixed list with distinct limiting punctures, the charts of the covers converge under continuation in
    physical coordinates. One direct verification is to move the finitely many punctures by diffeomorphisms
    supported in disjoint small neighborhoods, fixing the base disk and the outer boundary,
    with dilatations tending to one. Their lifts, in normalized disk coordinates, converge to the identity.
    On every compact set away from the punctures this identifies the limiting cover charts and preserves
    continuation along any fixed finite collection of paths.
  Consider now a fiber tail. Its projection lies in a ball of radius $r$ away from the basepoint.
    Brownian motion on the cover, projected to $O$, gives the same upper bound for hitting this tail as for
    hitting its physical ball before exit from $O$. The connected-set estimate in the unit disk used in Lemma 23
    thus makes its diameter small in the cover’s disk coordinate.
    The disk-to-rectangle maps form a compact family on the closure, so its rectangle diameter is small as well.
    Apply this observation to successively shorter tails approaching the endpoint.
    The lift has a continuous endpoint in the closed uniformizing disk. That endpoint cannot be interior:
    its projection tends to a puncture. It is therefore an ideal boundary point of the cover.
  On the retained core, both charts are close to the limiting chart of $U$.
    Taking the omitted height fractions small locates the top and bottom endpoints near the corresponding
    horizontal sides, away from their corners. The lifted fiber is consequently a crosscut joining those sides.
    Its entire $v_n$-range lies in its bin with a small enlargement.
    These crosscuts are disjoint because $iota_n$ is injective,
    and their order is the order seen on the common compact cores.
  Each crosscut separates the whole cover disk into two components.
    The two components of $U_n$ cut by its original fiber lift to the corresponding sides:
    each is connected, and the side is determined on an interior core.
    A point between consecutive fibers is therefore trapped between their lifted crosscuts.
    Both its $u_n$ and $v_n$ coordinates lie between the adjacent bins, up to the chosen errors.
    This proves (7.5). The same separation argument outside the two extreme fibers gives the one-sided bounds.
    In particular, the conclusion is global in the lifted domain; compact convergence alone would not give it. ◻
]

=== 7.3 Keeping the relevant graph in finitely many charts <keeping-the-relevant-graph-in-finitely-many-charts>

The cover has infinitely many sheets. To apply a fixed polygon test,
  we must contain every relevant central incidence in one compact portion of it.
  A bounded physical region and positive puncture clearance alone would allow arbitrarily many windings around a
  puncture. We will instead construct one access path to each relevant point with a bounded number of fixed-size
  displacements; clearance then bounds the number of chart continuations needed to lift it.
  We first delete edges near the finitely many punctures. The cost of these deletions is controlled by Lemma 24;
  tightness of the histories will control the number of sheets that remain accessible.

Two different deletions serve this construction. Removing the anchor tails forces a central path toward an
  electrode to cross a retained anchor core. The smaller puncture neighborhoods give the clearance needed to
  control the lift of that path and its continuation from the core to the basepoint.
  In the whole band $B_n \( beta \)$ make the following deletions:

+ delete uncertain edges in slightly enlarged balls containing the four tails of the two anchor fibers;
+ delete uncertain edges in small balls about every puncture of $P_n$.

The tail radius was chosen during Lemma 25. Choose the second set of radii only after the finite puncture list has
  been fixed. They may be made small enough that the retained anchor cores and fixed compact paths joining those
  cores to the basepoint have positive clearance from this second set of balls.
  No such clearance from the larger tail balls is required of these auxiliary paths.
  All radii are positive and fixed before the mesh limit. Lemma 24 makes the total crossing cost arbitrarily
  small, first for the four tail balls and then for the fixed finite number of puncture balls.

In the resulting graph, call an edge or vertex a #emph[candidate] if its component of possible edges can reach an
  electrode. Components without possible electrode access can be discarded:
  they cannot contribute to a crossing or attach to a component that can.

#thm([Lemma 7.6.])[
  (Compact containment of central candidates).  #emph[After these deletions,
    all candidate incidences in $B_n \( 5 beta \)$ lift into a fixed compact part of the limiting cover charts,
    for all sufficiently large $n$.]
] <lem:slits-compact-candidates>

#proof[
  Start from a central candidate and follow a possible connection toward an electrode until its first exit from
    $B_n \( beta \)$. Lemma 23 excludes a wire jump before this exit.
    The path crosses the anchor fiber on that side. Up to this crossing it lies in the band where the
    puncture-ball edges were deleted, so it stays away from the punctures.
    Its crossing of the anchor cannot be in a deleted tail. Following the retained anchor core and then one of its
    fixed compact access paths joins the candidate to the basepoint while still avoiding the smaller puncture
    balls. Physical accesses at vertices can be shifted slightly into $U_n$, retaining this clearance;
    tile errors are smaller than every fixed margin.
  We show that all points accessible in this way have bounded sheet indices.
    Trim $U_n$ by mutually disjoint disks centered at $P_n$, with slightly smaller positive radii than the second
    deletion radii, and let $T_n$ be the component containing $z_n$.
    The preceding paths put all the central candidates in $T_n$, or in its boundary accesses.
    The trimming circles can be chosen in general position, so that they meet the finite polygonal slit drawing
    transversely in finitely many points.
  The prime boundary of $T_n$ consists of inherited portions of the prime boundary of $U_n$,
    in their original cyclic order, interleaved with arcs of the trimming circles.
    To verify this description, note that each puncture disk reaches the complement of $U_n$.
    A whole circle surrounding its center cannot lie in the simply connected domain $U_n$.
    Each portion of a trimming circle inside $U_n$ is therefore a crosscut in the prime-end disk:
    its two physical endpoints may coincide on opposite slit banks, but its endpoint accesses are distinct.
    The crosscuts from the disjoint trimming circles are disjoint,
    and successive crosscut separation gives the asserted boundary description of each remaining component.
    The two banks of the slit are counted separately in this description.
  The inserted circle arcs have uniformly bounded total length: on each circle their interiors are disjoint.
    The inherited boundary has a uniform bound on the number of successive oscillations of every fixed positive
    size. Indeed, it consists of the original boundary traversal and two traversals of the prefix;
    the original boundaries converge uniformly and the prefixes belong to a compact family of curves.
    The same oscillation bound holds for the trimmed boundary.
    More explicitly, subdivide the original parametrization into a bounded number of pieces of diameter less than
    a prescribed small fraction of the oscillation scale. Inherited arcs occur in that order.
    Inserted arcs whose endpoints lie in one such piece can make a substantial additional excursion only if their
    length exceeds a fixed fraction of the scale. Their number is bounded by the total circle length.
    Arcs crossing subdivision points account for only a bounded number of further changes.
  It remains to turn this boundary control into control of an access path.
    Join a point of $T_n$ and $z_n$ by straight segments to their first boundary hits,
    and connect the two resulting prime accesses along the trimmed boundary.
    The straight segments have bounded length. The intervening boundary path has the oscillation bound just
    established. Polygonal prime-boundary paths admit arbitrarily close interior approximations with those
    accesses, including on the two sides of a slit. Thus one obtains an interior path from $z_n$ to the point with
    uniformly bounded oscillation count at a fixed scale smaller than its clearance from every puncture.
    An additional arbitrarily short access segment handles a boundary incidence.
  Cover the common compact physical region away from the punctures by finitely many ordinary chart disks,
    smaller than this clearance. Subdivide the access path whenever its diameter reaches a still smaller fixed
    scale. There are boundedly many pieces, and each lies in one of these ordinary disks.
    Its lift is obtained by a bounded number of continuations among a finite list of charts,
    so it lies in a compact part of the universal cover. The same compact chart bound works for the varying
    punctures by Lemma 26. Only one controlled access path is needed for each point:
    any other path in $U_n$ reaches the same lift because $iota_n$ is single-valued. This proves the lemma. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.225, 0), (5.175, 2.7), fill: rgb("#f2f2ff"), stroke: none)
  rect((0.9, 0), (4.5, 2.7), fill: rgb("#e6e6ff"), stroke: none)
  rect((0, 0), (5.4, 2.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0.225, 0), (0.225, 2.7), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.175, 0), (5.175, 2.7), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.9, 0), (0.9, 2.7), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((4.5, 0), (4.5, 2.7), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  bezier((0.324, 0), (0.324, 2.7), (0.252, 0.9), (0.396, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((1.62, 0), (1.62, 2.7), (1.548, 0.9), (1.692, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((2.7, 0), (2.7, 2.7), (2.628, 0.9), (2.772, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((3.78, 0), (3.78, 2.7), (3.708, 0.9), (3.852, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((5.076, 0), (5.076, 2.7), (5.004, 0.9), (5.148, 1.8), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0.468, 0.315), (0.504, 2.385), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  line((4.905, 0.315), (4.941, 2.385), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  line((0.45, 0), (0.468, 0.315), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((0.504, 2.385), (0.513, 2.7), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((4.887, 0), (4.905, 0.315), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  line((4.941, 2.385), (4.959, 2.7), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((2.7, 2.925), [#text(size: 9pt)[$U_n$ in its $u_n$-rectangle]], anchor: "south", padding: 0.1176cm)
  content((-0.225, 1.35), [#text(size: 9pt)[electrode $0$]], angle: 90deg)
  content((5.625, 1.35), [#text(size: 9pt)[electrode $1$]], angle: 90deg)
  content((0.225, -0.072), [#text(size: 9pt)[$beta$]], anchor: "north", padding: 0.1176cm)
  content((0.9, -0.072), [#text(size: 9pt)[$5 beta$]], anchor: "north", padding: 0.1176cm)
  content((4.5, -0.072), [#text(size: 9pt)[$1-5 beta$]], anchor: "north", padding: 0.1176cm)
  content((2.7, -0.72), [#text(fill: rgb("#b20000"))[#text(size: 9pt)[red fibers: anchors]]])
  rect((0, -5.13), (5.4, -2.43), stroke: (thickness: 0.8pt, miter-limit: 10))
  rect((0.855, -4.68), (4.545, -2.88), fill: rgb("#f4e8f4"), stroke: none)
  rect((0.855, -4.68), (4.545, -2.88), stroke: (paint: rgb("#5a005a"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  bezier((0.432, -5.13), (0.522, -2.43), (0.594, -4.23), (0.36, -3.33), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  bezier((4.86, -5.13), (4.968, -2.43), (5.04, -4.23), (4.842, -3.33), stroke: (paint: rgb("#b20000"), thickness: 0.8pt, miter-limit: 10))
  bezier((0.27, -5.13), (0.378, -2.43), (0.414, -4.23), (0.234, -3.33), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((1.566, -5.13), (1.674, -2.43), (1.71, -4.23), (1.53, -3.33), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((2.646, -5.13), (2.754, -2.43), (2.79, -4.23), (2.61, -3.33), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((3.726, -5.13), (3.834, -2.43), (3.87, -4.23), (3.69, -3.33), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  bezier((5.022, -5.13), (5.13, -2.43), (5.166, -4.23), (4.986, -3.33), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((1.62, -4.905), (3.78, -4.905), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((1.62, -2.655), (3.78, -2.655), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((1.62, -4.905), (1.62, -2.655), stroke: (thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  line((3.78, -4.905), (3.78, -2.655), stroke: (thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  circle((1.08, -4.14), radius: 0.05292, fill: rgb("#660066"), stroke: none)
  circle((1.26, -3.24), radius: 0.05292, fill: rgb("#660066"), stroke: none)
  circle((1.98, -4.32), radius: 0.05292, fill: rgb("#660066"), stroke: none)
  circle((2.43, -3.51), radius: 0.05292, fill: rgb("#660066"), stroke: none)
  circle((3.15, -4.14), radius: 0.05292, fill: rgb("#660066"), stroke: none)
  circle((4.14, -3.42), radius: 0.05292, fill: rgb("#660066"), stroke: none)
  circle((4.32, -4.32), radius: 0.05292, fill: rgb("#660066"), stroke: none)
  content((2.7, -2.205), [#text(size: 9pt)[the whole cover in its $v_n$-rectangle]], anchor: "south", padding: 0.1176cm)
  content((1.62, -5.202), [#text(size: 9pt)[$a_*$]], anchor: "north", padding: 0.1176cm)
  content((3.78, -5.202), [#text(size: 9pt)[$1-a_*$]], anchor: "north", padding: 0.1176cm)
  content((4.545, -3.006), [#text(fill: rgb("#5a005a"))[#text(size: 9pt)[$K$]]], anchor: "east", padding: 0.1176cm)
  content((2.7, -5.895), [#text(size: 9pt)[ideal inset quad, before physical-chart polygonization]])
})],
  caption: [Figure 3: Coordinate trapping and compact containment, schematically and not to scale; only a few of the finely spaced fibers are shown. Fibers in separated bins become ordered crosscuts of the universal cover; their coordinates agree up to the error in (7.5), not exactly. Their separation controls the coordinates throughout the lifted domain. After the deletions, the central candidates lie in a compact set $K$, shown inside a rectangular compact enclosure in the lower panel. The horizontal test sides can therefore be inset by less than their distance from $K$. Candidates may extend past both vertical cuts; those exterior pieces may attach only to the wired test electrodes. The teal rectangle is the ideal inset quad; it is subsequently approximated by a fixed orthogonal polygon in physical-coordinate charts. Dashed anchor ends in the upper panel indicate the tails covered by deletion balls in physical coordinates. ],
) <fig:slits-cover>

=== 7.4 A fixed polygon and its FK comparison <a-fixed-polygon-and-its-fk-comparison>

We can now choose the polygon to which the fixed-domain theorem will be applied.
  In the limiting cover rectangle, cut at $v = a_(*)$ and $v = 1 - a_(*)$.
  Place the horizontal sides a small positive distance inside the top and bottom.
  By Lemma 27, this distance can be chosen so small that every central candidate lies strictly on the inner side
  of both horizontal walls, with a positive margin. The resulting quad is relatively compact in the cover.
  Figure 3 shows the distinction between this horizontal containment and the two vertical cuts,
  across which candidate paths are allowed to pass.

Approximate the quad by a rational horizontal–vertical polygon in physical-coordinate charts,
  with still smaller error and a compact collar. Such approximations can be constructed first by polygonal curves,
  then by staircases in disjoint thin corridors, and finally by joining the staircases in disjoint small vertex
  neighborhoods. The marked points can be put in straight side interiors.
  Uniform Jordan convergence in a disk chart of the surface implies convergence of the marked moduli.
  Thus the approximation errors can be chosen after all the preceding margins have been fixed.

#thm([Lemma 7.7.])[
  (The comparison polygon is a fixed test).  #emph[The polygon just constructed may be chosen from the countable
    stock in Lemma 16. For all sufficiently large $n$, its rounded graph on the varying cover uses the same finite
    system of physical-coordinate charts and the same incidence data.
    Its quenched crossing probability therefore converges to the pure four-mark value for this fixed polygon.]
] <lem:slits-fixed-test>

#proof[
  A compact collared polygon away from the punctures is covered by finitely many ordinary projection charts.
    Choose rational rectangles inside these charts, with overlaps large enough for the required continuations.
    Their gluings have identity projection transitions. Subdividing further,
    the polygon and a collar can be specified by finitely many rational rectangles or squares, their sheet labels,
    and the incidence identifications on overlaps. There are countably many finite descriptions of this kind,
    including when projections of different sheets overlap.
  These finite chart continuations stay a positive distance from the limiting punctures.
    As the punctures move, the same projected paths and neighborhoods avoid them,
    and their lift identifications agree for all large $n$, by the finite-list continuity in Lemma 26.
    Thus both the physical polygon and its square-grid rounding have fixed chart and incidence descriptions.
    Copies of the same physical edge have the same disorder, exactly as in Proposition 9;
    they are distinct FK edges when they lie on different sheets.
    The simultaneous fixed-test limit on the chosen environment, followed by Proposition 13, gives the assertion. ◻
]

The next comparison is between finite FK graphs, before any limit is taken.
  Let $H_n$ be the conditional graph after the deletions and discard the components without possible electrode
  access. Let $Q_n$ be the rounded fixed test on the cover.
  An edge is #emph[shared] if it is a remaining central candidate edge of $H_n$ and its lift is an edge of $Q_n$.
  We include all edges in the closure of the rounded test, so an edge path leaving through a vertical side has a
  vertex on the corresponding test electrode.

#thm([Lemma 7.8.])[
  (Comparison on shared edges).  #emph[For sufficiently small geometric errors and sufficiently large $n$,
#[#set math.equation(numbering: n => "(7.6)")
 $ phi.alt_(H_n) \( upright("actual original-electrode crossing") \) lt.eq
   phi.alt_(Q_n)^(upright("sep")) \( upright("test-electrode crossing") \) \, $ <eq:slits-shared-comparison>]

 where $phi.alt_(H_n)$ is the conditional FK law and the two test electrodes are wired separately in
   $phi.alt_(Q_n)^(upright("sep"))$.]
] <lem:slits-shared>

#proof[
  Take the central range for shared edges inside $B_n \( 5 beta \)$,
    allowing fixed smaller margins at its boundary. Since $beta < a_(*) \/ 20$,
    this range extends well past both vertical test cuts. The chart errors in (7.5) and the polygonization error
    are chosen much smaller than these margins.
  There is no attachment from a shared edge to a nonshared original piece through a horizontal test side.
    Indeed, every possible central attachment belongs to the compact candidate set,
    which lies on the inner side of those walls with positive clearance.
    A noncentral piece cannot enter there either: the global strip trapping and its one-sided bounds put such
    pieces beyond the corresponding vertical cut. Consequently a nonshared original piece can attach to the shared
    graph only along one of the two test electrodes.
  Nor can a nonshared piece connect the two electrodes to each other.
    Between small neighborhoods of the vertical cuts there is a middle strip in which every candidate edge is
    shared. A possible path from the left exterior group to the right must traverse that strip, by (7.5).
    All identifications from known banks and original wires belong to the separate left and right groups:
    Lemma 23 excludes a central access to either wire and excludes an already known connection between them.
  These statements remain valid when the drawing is matched to physical lattice vertices.
    Each uncertain switch supplies only one random edge, by Lemma 15.
    For a primal-open switch, the primal bank follows the revealed ordinary edge,
    attaching both endpoint vertex regions to that bank. For a primal-closed switch,
    the encountered turn cuts off only its visited primal corner, where the bank stays at the same vertex.
    The opposite, unvisited corner retains a connected small neighborhood of its incidences.
    If that other turn is visited later, the same rule then attaches its corner to the bank.
    Thus every vertex whose required identifications have been separated by the explored strand is already
    bank-attached and is excluded from the central band by Lemma 23.
  The boundary construction retains all interior incidences of a primal boundary vertex.
    Exterior dual tabs are separate vertices of the drawn graph.
    Apart from the prescribed electrode-wire identifications already handled above,
    distinct tabs require no identification with one another,
    and the comparison does not merge their different lifts. If two such copies occupy the same ordinary vertex in
    one lifted test chart, their merger in the test only strengthens the local partition.
    Interchanging the two colors gives the same switch argument for a dual test.
    Consequently all identifications required among the remaining unbanked incidences have representatives in a
    common small vertex neighborhood. Away from the puncture balls these representatives have a common local lift,
    identical to that of the ordinary grid incidences. No additional central identification can therefore join
    different sheets or connect the two exterior groups around the shared strip.
  Condition now on all nonshared original edges. Their induced partition on the shared graph identifies vertices
    only within one test electrode or within the other. It is therefore dominated by the partition that wires each
    test electrode separately. The weights on every shared edge are exactly those in $Q_n$.
    Adding the remaining test edges and applying FK monotonicity gives a stochastic upper comparison on the shared
    graph. Finally, every actual original crossing contains a shared-edge crossing between the two test
    electrodes: take its traversal from the left exterior group to the right,
    and use the absence of any nonshared bypass. This event inclusion and the conditional stochastic comparison
    prove (7.6) after averaging the conditioned edges. The proof is unchanged for the dual grid and its actual odds. ◻
]

=== 7.5 Completion of the moving test and order of limits <completion-of-the-moving-test-and-order-of-limits>

#proof[
  Suppose that (7.1) fails with a fixed positive error and a fixed positive probability along a subsequence.
    Tightness of the prefixes lets us restrict to a compact family of curves while losing less than this
    probability. In particular, their numbers of successive displacements of every fixed size have deterministic
    bounds on that family. Select a deterministic failing history at each remaining mesh.
    The initial boundaries already converge, so we may take the convergent-prefix, basepoint, angle,
    and kernel subsequences used above.
  It is enough to contradict failure of an upper crossing bound in one of the two separate closures.
    Indeed, if $p_n$ is the conditional open-cap pairing probability,
    those crossing probabilities are exactly $T \( p_n \)$ and $T \( 1 - p_n \)$, respectively, by Lemma 12.
    The continuous increasing map $T$ has a continuous inverse on $\[ 0 \, 1 \]$.
    The two upper bounds by $g \( chi_(U_n) \) = T \( f \( chi_(U_n) \) \)$ and $g \( 1 - chi_(U_n) \) =
    T \( 1 - f \( chi_(U_n) \) \)$ therefore force $p_n - f \( chi_(U_n) \) arrow.r 0$.
  Fix an error tolerance. Choose $a_(*)$ small, then $beta < a_(*) \/
    20$ and the fiber-bin precision $lambda$ much smaller than $beta$.
    Choose the tail radius so that the four anchor-tail deletions have small total cost and the lifted tails have
    sufficiently small chart diameter. Lemma 25 gives a fixed finite number of fibers and their limiting
    endpoints. Choose a fixed finite puncture sample fine enough for Lemma 26.
    Only after that choice, take the puncture-ball radii small enough for both the required core clearances and a
    small total deletion cost. Lemma 27 then gives one compact part of the cover containing the surviving central
    candidates. Choose the horizontal inset of the test smaller than the clearance of this compact set,
    and finally choose the rational polygon with strictly smaller approximation errors.
  All these data are fixed before taking the mesh limit. The deletion bound and Lemmas 28 and 29 give
  $ limsup_(n arrow.r oo)
    [phi.alt_n^(upright("sep")) \( upright("original crossing") divides cal(F)_n \) - g \( chi_(U_n) \)] lt.eq
    upright("deletion error") + upright("modulus error") . $
  The modulus error tends to zero as the vertical trim $a_(*)$, the horizontal inset,
    and the polygonization error tend to zero. The cover rectangle was given the same four-angle data as $U_n$,
    and all rectangle heights remain in a compact nondegenerate range,
    so continuity of the pure four-mark function justifies this comparison uniformly in the limiting height.
    The deletions have the independently small costs proved above.
    The right side can therefore be made arbitrarily small. Applying the same argument to the dual proves the two
    upper bounds and contradicts the selected failure.
  Although the geometry was selected after fixing an environment and a failing history subsequence,
    the polygon used at the last step is one fixed member of the previously simultaneous countable stock.
    No estimate is applied to a boundary that continues to change with the mesh,
    and no uniform rate over all polygons is needed. This completes the proof for arbitrary stopping rules
    satisfying the stated localization and tightness assumptions. ◻
]

== 8 Identification of the driving process and the ordered curve <sec:identification>

We remain on the deterministic subsequence and fixed environment of Lemma 16.
  Proposition 22 now supplies the four-change crossing probability after localized exploration.
  To extract the Dobrushin driving process from this probability,
  we insert a short wired interval on the free boundary. The pairing martingale belongs to the resulting
  four-change law. We first replace it by a bounded Loewner expression,
  and only then compare that law with the original Dobrushin law.
  This order is what permits the interval to shrink without amplifying the comparison error.
  The method follows the #emph[Bounded martingale tests] Lemma and #emph[Driving convergence] Proposition of [17]
  Section “Identification of the Dobrushin strand”.

=== 8.1 Bounded tests from a shrinking boundary interval <bounded-tests-from-a-shrinking-boundary-interval>

Use the initial half-plane coordinate $psi_n = Psi compose phi_n$ from Section 6,
  reflecting the half-plane picture if necessary so that its positive real side is primal-free.
  Write $g_(n \, t)$ and $W_n \( t \)$ for the maps and driver in (6.2).
  Fix $T \, R < oo$ and stop at $tau_n = tau_n \( T \, R \)$.
  Write $bb(E)_n$ for expectation under the original Dobrushin law in the fixed environment.
  Let $cal(F)_(n \, t)$ be the filtration of the explored path and the switches it has encountered.
  For $x > 2 R + 1$, define

#[#set math.equation(numbering: n => "(8.1)")
 $ M_(n \, t) \( x \) = (frac(x g'_(n \, t) \( x \), g_(n \, t) \( x \) - W_n \( t \)))^(1 \/ 2) \, wide 0 lt.eq
   t lt.eq tau_n . $ <eq:power-test>]

The real point $x$ is not swallowed on this range. Indeed, $g_(n \, t) \( x \) gt.eq x$ and

#[#set math.equation(numbering: n => "(8.2)")
 $ x - R & lt.eq g_(n \, t) \( x \) - W_n \( t \) lt.eq x + R + frac(2 T, x - R) \,\
g'_(n \, t) \( x \) & = exp (- integral_0^t frac(2 thin d u, \( g_(n \, u) \( x \) - W_n \( u \) \)^2)) .
  $ <eq:real-flow-bounds>]

Consequently $M_(n \, t) \( x \)$ and its reciprocal are bounded by constants depending only on $T \, R \, x$.

#thm([Lemma 8.1.])[
  (Approximate martingale identities).  #emph[For each $x > 2 R + 1$,
    every sequence of revealing stopping times $0 lt.eq sigma_n lt.eq upsilon_n lt.eq tau_n$,
    and every uniformly bounded $cal(F)_(n \, sigma_n)$-measurable sequence $F_n$, the original Dobrushin law satisfies
#[#set math.equation(numbering: n => "(8.3)")
 $ bb(E)_n
   [F_n #scale(x: 120%, y: 120%)[\(] M_(n \, upsilon_n) \( x \) - M_(n \, sigma_n) \( x \)
   #scale(x: 120%, y: 120%)[\)]] arrow.r 0 . $ <eq:approximate-martingale>]

 Stops during a known local arc are allowed.]
] <lem:bounded-martingale-tests>

#proof[
  Fix $s > 0$, initially without taking a limit in $s$. Insert a separate primal wired interval on the formerly
    free side, with lattice endpoints whose initial half-plane coordinates tend to $x \, x + s$.
    In the open-cap four-change law, explore the strand starting at the original initial mark $a_n$,
    whose half-plane coordinate is $0$. By Lemma 15, the domain, initial charts,
    and drawings may be chosen the same away from this insertion.
    Regard the Dobrushin stopping rules and $F_n$ as functions of revealed histories.
    Apply the same rules on the common tree of prefix histories,
    extend them as stopping rules outside that tree by stopping at its first exit,
    and extend $F_n$ boundedly there. These conventions retain the order of the two stops and their localization;
    below we show that the relevant stopped prefixes stay in the common tree.
    Thus the same symbols will denote well-defined stopping times and history tests under open caps.
  We check the localization required by Proposition 22. Real Loewner trajectories from $x$ and $x +
    s$ remain separated from the driver, and their gap solves
  #[#set math.equation(numbering: n => "(8.4)")
   $ partial_t #scale(x: 120%, y: 120%)[\(] g_(n \, t) \( x + s \) -
     g_(n \, t) \( x \) #scale(x: 120%, y: 120%)[\)] = -
     frac(2 #scale(x: 120%, y: 120%)[\(] g_(n \, t) \( x + s \) - g_(n \, t) \( x \)
     #scale(x: 120%, y: 120%)[\)], \( g_(n \, t) \( x + s \) - W_n \( t \) \) \( g_(n \, t) \( x \) - W_n \(
     t \) \)) . $ <eq:real-gap>]
  For fixed $s$, this gap is bounded below by a positive constant.
    The same ODE is regular in a complex neighborhood of the interval, uniformly on the stopped range.
    The prefix therefore stays out of a fixed neighborhood of the insertion,
    and cannot terminate at either inserted mark before the stop.
    A point initially corresponding to $i Y$, with $Y$ sufficiently large,
    has a fixed disk untouched by all these hulls. It supplies the basepoint of Proposition 22.
    The four marks, including tip and infinity, are uniformly separated in the normalized charts for each fixed
    $s$. Initial marked Jordan convergence transfers these statements to the physical drawings.
    The history tightness hypothesis follows from Proposition 19 for the four fixed marks.
  Let $Z_(n \, t)^s$ be the conditional probability of the rare primal pairing under the open-cap law.
    It is an exact bounded martingale in the revealed-switch filtration.
    At each of the allowed stopping times, Proposition 22 gives
  #[#set math.equation(numbering: n => "(8.5)")
   $ Z_(n \, t)^s - f \( chi_(n \, t)^s \) arrow.r 0 quad upright("in probability and in mean") \, wide
     chi_(n \, t)^s = frac(g_(n \, t) \( x + s \) - g_(n \, t) \( x \), g_(n \, t) \( x + s \) - W_n \( t \)) .
     $ <eq:four-mark-replacement>]
  The vanishing initial errors in the lattice mark positions are included here;
    they do not affect the fixed-$s$ limit. Optional sampling and the boundedness of $F_n$ thus give the
    approximate martingale identity for $f \( chi_(n \, t)^s \)$.
  Divide this identity by $f \( s \/ \( x + s \) \)$ while $s$ is fixed.
    The small-interval behavior in Proposition 13, together with analytic ODE bounds near $x$, gives
  #[#set math.equation(numbering: n => "(8.6)")
   $ frac(f \( chi_(n \, t)^s \), f \( s \/ \( x + s \) \)) = M_(n \, t) \( x \) + o_s \( 1 \) +
     o_n \( 1 \) . $ <eq:normalized-small-interval>]
  Here $o_n \( 1 \)$ is taken first for fixed $s$, and $o_s \( 1 \)$ is uniform over the stopped paths. More explicitly,
  $ frac(chi_(n \, t)^s, s \/ \( x + s \)) = frac(x g'_(n \, t) \( x \), g_(n \, t) \( x \) - W_n \( t \)) +
    O \( s \) \, $
  with the ratio bounded above and away from zero; applying $f \( u \) tilde.op c
    sqrt(u)$ proves the displayed replacement. By (8.2), the expression after replacement is bounded independently
    of small $s$.
  We can now compare laws using only bounded functions of the stopped histories.
    First compare the deterministic separate primal closure with the Dobrushin law.
    The former adds just the short wired interval, so FK monotonicity gives a coupling.
    Explore its actual open clusters in the stronger law. Unless one reaches a fixed outer neighborhood of the
    insertion, the configurations outside that neighborhood can be coupled identically:
    the explored clusters are enclosed by closed cuts, and the conditional outside laws then agree.
    The insertion has physical diameter tending to zero as $s arrow.b 0$,
    by the uniform continuity of the initial inverse maps. The old primal wire stays a positive distance away.
    The intervening annulus therefore has no primal wire attachments except at its rims,
    and Lemma 17 shows that the probability of reaching the outer neighborhood tends to zero,
    first in the mesh limit and then as $s arrow.b 0$.
  Second, compare this deterministic closure to open caps. Lemma 12 gives a likelihood depending only on the
    pairing, with two fixed positive values. If the exceptional pairing has probability $p$ under the
    separate-closure law, normalizing these two weights shows that the total variation difference is at most $C
    p$. By Proposition 22 at the empty prefix and Lemma 12, for fixed $s$ that separate-closure pairing
    probability tends to $g \( s \/ \( x + s \) \)$, which tends to zero as $s arrow.b 0$.
  The stopped prefixes avoid the spare neighborhood of the insertion established above.
    On the successful coupling event their drawings, revealed histories, Loewner maps,
    and stopping rules therefore agree. The extension convention also makes the stopped tests agree on these
    common histories. Combining the two comparisons with (8.6) yields
  $ limsup_(n arrow.r oo) lr(|bb(E)_n #h(-0.16667em)
    [F_n \( M_(n \, upsilon_n) \( x \) - M_(n \, sigma_n) \( x \) \)]|) lt.eq e \( s \) \, wide
    lim_(s arrow.b 0) e \( s \) = 0 . $
  This proves (8.3). Notice that the coupling errors were applied after replacement by bounded tests;
    they were never divided by the small number $f \( s \/ \( x + s \) \)$. ◻
]

=== 8.2 Two tests determine the driver <two-tests-determine-the-driver>

#thm([Proposition 8.2.])[
  (Driving convergence).  #emph[In the fixed environment under consideration, $W_n$ converges in law,
    uniformly on compact capacity intervals, to $sqrt(16 \/ 3) thin B$, where $B$ is standard real Brownian motion.]
] <prop:driving-convergence>

#proof[
  We first prove tightness under the fixed localization $T \, R$. Set $h = 1 \/ 2$ and, for $x > 2 R + 1$, write
  $ X_(n \, t) \( x \) = g_(n \, t) \( x \) \, wide A_(n \, t) \( x \) = x^h g'_(n \, t) \( x \)^h \, wide
    M_(n \, t) \( x \) = A_(n \, t) \( x \) \( X_(n \, t) \( x \) - W_n \( t \) \)^(- h) . $
  The real-flow bounds show that $X_n \, A_n$ are uniformly bounded and Lipschitz in time,
    with $A_n$ bounded away from zero. Choose $2 R + 1 < x_1 < x_2$.
    Equation (8.4) also gives a positive lower bound on $X_(n \, t) \( x_2 \) -
    X_(n \, t) \( x_1 \)$ throughout the stopped range.
  At a revealing stopping time $sigma_n$, freeze these two quantities and define, for $- R lt.eq w lt.eq R$,
  $ F_j \( w \) = A_(n \, sigma_n) \( x_j \) \( X_(n \, sigma_n) \( x_j \) - w \)^(- h) \, wide j = 1 \, 2 . $
  Both derivatives are positive. Their ratio is
  $ r \( w \) := frac(F'_1 \( w \), F'_2 \( w \)) = frac(A_(n \, sigma_n) \( x_1 \), A_(n \, sigma_n) \( x_2 \))
    (frac(X_(n \, sigma_n) \( x_2 \) - w, X_(n \, sigma_n) \( x_1 \) - w))^(h + 1) . $
  The separation of the two real solutions and their uniform bounds imply $r' \( w \) gt.eq c > 0$.
    Also $F'_2 \( w \)$ is bounded above and away from zero. Put $a_n = r \( W_n \( sigma_n \) \)$.
    Integrating $F'_2 \( w \) \( r \( w \) - a_n \)$ on either side of $W_n \( sigma_n \)$ gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ F_1 \( w \) - F_1 \( W_n \( sigma_n \) \) - a_n #scale(x: 120%, y: 120%)[\(] F_2 \( w \) -
     F_2 \( W_n \( sigma_n \) \) #scale(x: 120%, y: 120%)[\)] gt.eq c_1 \| w -
     W_n \( sigma_n \) \|^2 . $ <eq:two-test-convexity>]
  The predictable coefficient $a_n$ is uniformly bounded.
  Between $sigma_n$ and another allowed stop $upsilon_n$, changing the frozen $X_n \,
    A_n$ costs at most $C \( upsilon_n - sigma_n \)$. Apply Lemma 30 to the two increments,
    using the bounded $cal(F)_(n \, sigma_n)$-measurable coefficient $a_n$ as a test for the second.
    Equation (8.7) then yields
  #[#set math.equation(numbering: n => "(8.8)")
   $ bb(E)_n \| W_n \( upsilon_n \) - W_n \( sigma_n \) \|^2 lt.eq C bb(E)_n \( upsilon_n - sigma_n \) +
     o \( 1 \) . $ <eq:driver-increment>]
  This holds for every sequence of allowed stopping times. In particular, for the driver stopped at $tau_n$,
    it implies the stopping-time tightness criterion of Aldous [1] in the Skorokhod $J_1$ topology.
    The drivers are bounded on this range. Every prelimit driver is continuous,
    and the continuous paths form a closed subspace for $J_1$ convergence.
    Thus all limits are continuous, and convergence along a subsequence may be realized uniformly on compact
    stopped intervals.
  We identify any such limit inside an inner driver bound, choosing inner levels which are continuity levels for
    the stopping operation. These levels can be increased to the outer bound.
    Continuity of the Loewner ODE under uniform driver convergence gives limits $X_t \( x \) \, A_t \( x \)$ and
  #[#set math.equation(numbering: n => "(8.9)")
   $ M_t \( x \) = A_t \( x \) \( X_t \( x \) - W_t \)^(- h) . $ <eq:limiting-power-test>]
  Use bounded continuous functions of finitely many earlier driver values as tests in (8.3),
    and then a monotone-class argument. It follows that each $M \( x \)$ is a martingale in the limiting
    filtration. This argument applies at the localized stops as well. The bounds above and below persist.
  Before applying Itô’s formula, note that
  $ W_t = X_t \( x \) - (frac(A_t \( x \), M_t \( x \)))^(1 \/ h) . $
  The processes $X \, A$ are continuous of finite variation, $M$ is a continuous martingale,
    and the function in this identity is smooth on the range of their positive bounds.
    Hence $W$ is a continuous semimartingale. Write its decomposition as a continuous local martingale plus a
    continuous finite-variation process $B^(upright("fv"))$, and denote its quadratic variation by $\[ W \]$.
  Put $Z_t \( x \) = X_t \( x \) - W_t$. The Loewner equations give
  $ d X_t \( x \) = 2 Z_t \( x \)^(- 1) thin d t \, wide d log A_t \( x \) = - 2 h Z_t \( x \)^(- 2) thin d t . $
  The finite-variation part of $d M_t \( x \) \/ M_t \( x \)$ is consequently
  $ h Z_t \( x \)^(- 1) thin d B_t^(upright("fv")) - 4 h Z_t \( x \)^(- 2) thin d t +
    frac(h \( h + 1 \), 2) Z_t \( x \)^(- 2) thin d \[ W \]_t . $
  It vanishes because $M \( x \)$ is a martingale. Multiplication by $Z_t \( x \)^2 \/
    h$ gives an identity of signed measures,
  #[#set math.equation(numbering: n => "(8.10)")
   $ Z_t \( x \) thin d B_t^(upright("fv")) - 4 thin d t + frac(1 + h, 2) thin d \[ W \]_t =
     0 . $ <eq:driver-characteristics>]
  Subtract this identity for $x_1$ and $x_2$. Their strictly positive separation forces $d B^(upright("fv")) = 0$.
    Substitution back into (8.10) yields
  $ d \[ W \]_t = frac(8, 1 + h) thin d t = 16 / 3 thin d t . $
  Lévy’s characterization therefore identifies the stopped limit as Brownian motion with variance rate $16 \/ 3$.
    If the initial half-plane picture was reflected, reflecting back negates the driver and leaves this Brownian
    law unchanged.
  It remains to remove the outer driver bound. For any fixed capacity horizon,
    the limiting upper bound on the probability that $W_n$ exits $\[ - R \, R \]$ is bounded by the Brownian
    probability of reaching inner levels tending to $R$. This follows by applying the stopped convergence at
    continuity levels below $R$; exiting the outer interval entails first reaching each such inner level.
    These Brownian probabilities tend to zero as $R arrow.r oo$.
    Thus the full drivers are tight on every compact capacity interval,
    and each subsequential law has the Brownian identification just proved. This proves the proposition. ◻
]

=== 8.3 From capacity time to the full oriented curve <from-capacity-time-to-the-full-oriented-curve>

We can now complete the proof of Theorem 1. We first work in the common disk,
  and then return to the physical domains and to environmental probability.

#proof[
  Fix the environment and subsequence of Lemma 16. By Proposition 31,
    the drivers converge uniformly on compact time intervals in law to $W = sqrt(16 \/ 3) thin B$.
    For every fixed height $y > 0$, continuity of the inverse Loewner equation gives convergence of
  $ H_n \( t \, y \) = Psi^(- 1) #h(-0.16667em) (g_(n \, t)^(- 1) \( W_n \( t \) + i y \)) $
  uniformly in $t$ on each compact capacity interval to the analogous $H \( t \, y \)$ for $W$.
    A large driver bound has arbitrarily high probability on that interval,
    so Proposition 20 applies after localization.
  For completeness, the uniform conclusion at height zero follows without assuming uniform boundary convergence of
    the inverse maps. For two small positive heights, the triangle inequality and (6.3) show that
    $H_n \( dot.op \, y \)$ and $H_n \( dot.op \, y' \)$ are close in the uniform metric, in probability,
    after the mesh limit. Passing at these fixed heights to the limiting driver proves that $H \( dot.op \, y \)$
    is Cauchy in probability in the space of continuous disk-valued functions on the time interval as $y arrow.b
    0$. Its limit is continuous. The SLE trace theorem [20] identifies its pointwise values with the SLE trace,
    first at rational times and then at all times by continuity. The same approximation argument now gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ eta_n med arrow.r.double med eta quad upright("uniformly on every compact capacity interval") \,
     $ <eq:capacity-trace-convergence>]
  where $eta$ is chordal $upright("SLE")_(16 \/ 3)$ in $bb(D)$ from $- 1$ to $1$.
    In particular, a macroscopic excursion cannot be hidden in a sequence of capacity intervals of vanishing
    length: the uniform tip estimate already controls all times in those intervals.
  To include the terminal part of the curve, first fix a small cap about $1$.
    Chordal SLE tends to its target almost surely [20]; hence with probability as close to one as desired its tail
    after a sufficiently large deterministic time lies in a smaller cap.
    By (8.11), the discrete curve has entered the original cap by that time with the same high probability.
    Lemma 21 bounds the diameter of its subsequent tail. Letting the cap shrink therefore makes both tails
    uniformly small. Parametrize the two curves by the common capacity clock until the chosen time and then by any
    increasing parametrizations of their tails. This proves convergence in the full uniform oriented-curve metric
    modulo increasing reparametrization.
  The initial inverse disk charts converge uniformly on their closures by marked Jordan convergence.
    Composing with them transfers the curve convergence to the original physical embedding.
    Finally, the drawing comparison gives $d \( gamma_n \, hat(gamma)_n \) =
    O \( delta_n \)$ in that same oriented metric. We have proved the asserted weak convergence of quenched laws
    for every environment in the full-probability event of Lemma 16.
  Return now to the entire prescribed mesh sequence. The oriented-curve space,
    with constant waiting intervals identified, is separable,
    and its weak probability-law topology is metrized by the bounded-Lipschitz distance for the bounded curve
    metric. Each finite quenched law is measurable in its bonds.
    From every subsequence, Lemma 16 selects a further deterministic subsequence along which this distance from
    the SLE law tends to zero almost surely. The subsequence criterion for convergence in probability proves
    convergence in environmental probability along the full sequence.
    All choices requiring small disorder were made before choosing the domain and its approximation,
    as in the polygon comparison. This completes the proof. ◻
]

#heading(level: 1)[References]
#bibitem([1])[D.~Aldous, #emph[Stopping times and tightness], Ann. Probab. #strong[6] (1978), 335--340.]
#bibitem([2])[E.~Avérous and R.~Mahfouf, #emph[The near-critical random bond FK-percolation model],
  preprint (2025), #link("https://arxiv.org/abs/2509.08938")[arXiv:2509.08938].]
#bibitem([3])[D.~Chelkak, H.~Duminil-Copin, and C.~Hongler,
  #emph[Crossing probabilities in topological rectangles for the critical planar FK-Ising model], Electron. J.
  Probab. #strong[21] (2016), paper no.~5, 28~pp. #link("https://doi.org/10.1214/16-EJP3452")[doi:10.1214/16-EJP3452].]
#bibitem([4])[D.~Chelkak, H.~Duminil-Copin, C.~Hongler, A.~Kemppainen, and S.~Smirnov,
  #emph[Convergence of Ising interfaces to Schramm's SLE curves], C. R. Math. Acad. Sci.
  Paris #strong[352] (2014), 157--161.
  #link("https://doi.org/10.1016/j.crma.2013.12.002")[doi:10.1016/j.crma.2013.12.002].]
#bibitem([5])[D.~Chelkak and K.~Izyurov, #emph[Holomorphic spinor observables in the critical Ising model], Comm.
  Math. Phys. #strong[322] (2013), 303--332.
  #link("https://doi.org/10.1007/s00220-013-1763-5")[doi:10.1007/s00220-013-1763-5].]
#bibitem([6])[D.~Chelkak and S.~Smirnov, #emph[Universality in the 2D Ising model and conformal invariance of
  fermionic observables], Invent. Math. #strong[189] (2012), 515--580.
  #link("https://doi.org/10.1007/s00222-011-0371-2")[doi:10.1007/s00222-011-0371-2].
  Theorem and equation locators agree with #link("https://arxiv.org/abs/0910.2045v2")[arXiv:0910.2045v2].]
#bibitem([7])[Vik.~S.~Dotsenko and Vl.~S.~Dotsenko, #emph[Critical behaviour of the 2D Ising model with impurity
  bonds], J. Phys. C: Solid State Phys. #strong[15] (1982), 495--507.
  #link("https://doi.org/10.1088/0022-3719/15/3/015")[doi:10.1088/0022-3719/15/3/015].]
#bibitem([8])[H.~Duminil-Copin, C.~Hongler, and P.~Nolin,
  #emph[Connection probabilities and RSW-type bounds for the two-dimensional FK Ising model], Comm. Pure Appl.
  Math. #strong[64] (2011), 1165--1198. #link("https://doi.org/10.1002/cpa.20370")[doi:10.1002/cpa.20370].]
#bibitem([9])[R.~G.~Edwards and A.~D.~Sokal, #emph[Generalization of the Fortuin--Kasteleyn--Swendsen--Wang
  representation and Monte Carlo algorithm], Phys. Rev. D #strong[38] (1988), 2009--2012.
  #link("https://doi.org/10.1103/PhysRevD.38.2009")[doi:10.1103/PhysRevD.38.2009].]
#bibitem([10])[C.~M.~Fortuin and P.~W.~Kasteleyn, #emph[On the random-cluster model. I.
  Introduction and relation to other models], Physica #strong[57] (1972), 536--564.
  #link("https://doi.org/10.1016/0031-8914(72)90045-6")[doi:10.1016/0031-8914(72)90045-6].]
#bibitem([11])[C.~M.~Fortuin, P.~W.~Kasteleyn, and J.~Ginibre,
  #emph[Correlation inequalities on some partially ordered sets], Comm. Math. Phys. #strong[22] (1971), 89--103.
  #link("https://doi.org/10.1007/BF01651330")[doi:10.1007/BF01651330].]
#bibitem([12])[A.~B.~Harris, #emph[Effect of random defects on the critical behaviour of Ising models], J. Phys.
  C: Solid State Phys. #strong[7] (1974), 1671--1692.
  #link("https://doi.org/10.1088/0022-3719/7/9/009")[doi:10.1088/0022-3719/7/9/009].]
#bibitem([13])[K.~Izyurov, #emph[Critical Ising interfaces in multiply-connected domains], Probab.
  Theory Related Fields #strong[167] (2017), 379--415.
  #link("https://doi.org/10.1007/s00440-015-0685-x")[doi:10.1007/s00440-015-0685-x].
  Theorem and equation locators refer to #link("https://arxiv.org/abs/1309.5302")[arXiv:1309.5302].]
#bibitem([14])[A.~Kemppainen and S.~Smirnov, #emph[Random curves, scaling limits and Loewner evolutions], Ann.
  Probab. #strong[45] (2017), 698--779. #link("https://doi.org/10.1214/15-AOP1074")[doi:10.1214/15-AOP1074].]
#bibitem([15])[A.~W.~W.~Ludwig, #emph[Critical behavior of the two-dimensional random $q$-state Potts model by
  expansion in $\( q - 2 \)$], Nuclear Phys. B #strong[285] (1987), 97--142.
  #link("https://doi.org/10.1016/0550-3213(87)90330-0")[doi:10.1016/0550-3213(87)90330-0].]
#bibitem([16])[A.~W.~W.~Ludwig, #emph[Infinite hierarchies of exponents in a diluted ferromagnet and their
  interpretation], Nuclear Phys. B #strong[330] (1990), 639--680.
  #link("https://doi.org/10.1016/0550-3213(90)90126-X")[doi:10.1016/0550-3213(90)90126-X].]
#bibitem([17])[OpenAI, #emph[Conformal Limits of Critical Square-Lattice Random-Cluster Interfaces],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Conformal-Limits-of-Critical-Square-Lattice-Random-Cluster-Interfaces-October-5-2026/paper.pdf")[OAI:Conformal-Limits-of-Critical-Square-Lattice-Random-Cluster-Interfaces-October-5-2026],
  2026.]
#bibitem([18])[OpenAI, #emph[Quenched $upright(S L E)_3$ Universality for the Weak Random-Bond Ising Model],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Quenched-SLE3-Universality-for-the-Weak-Random-Bond-Ising-Model-October-5-2026/quenched-sle3-weak-random-bond-ising.pdf")[OAI:Quenched-SLE3-Universality-for-the-Weak-Random-Bond-Ising-Model-October-5-2026],
  2026.]
#bibitem([19])[Ch.~Pommerenke, #emph[Boundary Behaviour of Conformal Maps],
  Grundlehren der mathematischen Wissenschaften, vol.~299, Springer-Verlag, Berlin, 1992.
  #link("https://doi.org/10.1007/978-3-662-02770-7")[doi:10.1007/978-3-662-02770-7].]
#bibitem([20])[S.~Rohde and O.~Schramm, #emph[Basic properties of SLE], Ann. of Math.
  (2) #strong[161] (2005), 883--924.
  #link("https://doi.org/10.4007/annals.2005.161.883")[doi:10.4007/annals.2005.161.883].]
#bibitem([21])[B.~N.~Shalaev, #emph[Critical behavior of the two-dimensional Ising model with random bonds], Phys.
  Rep. #strong[237] (1994), 129--188.
  #link("https://doi.org/10.1016/0370-1573(94)90086-8")[doi:10.1016/0370-1573(94)90086-8].]
#bibitem([22])[S.~Smirnov, #emph[Conformal invariance in random cluster models. I.
  Holomorphic fermions in the Ising model], Ann. of Math. (2) #strong[172] (2010), 1435--1467.
  #link("https://doi.org/10.4007/annals.2010.172.1435")[doi:10.4007/annals.2010.172.1435].]
