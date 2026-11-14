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

#align(center)[#text(size: 16pt, weight: "bold")[Signed cylinder propagation and marked polygons on the honeycomb lattice]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

Critical honeycomb walks and polygons have positive geometric weights,
  while exact transfer representations of their partitions can involve signed auxiliary weights.
  We study how cancellations in such a representation can be controlled well enough to prove power laws.
  Our principal cylinder estimate yields a planar nesting exponent.
  An independent boundary calculation supplies the normalization and visit identity needed for conclusions about
  lengths of finite chords. A separate two-bond calculation controls the length-square mass of planar polygons.

=== 1.1 The physical observables <the-physical-observables>

Let $bb(H)$ be the honeycomb graph formed by the centers of the triangles of a regular triangular tessellation of
  side length one. Planar distances and diameters refer to this Euclidean embedding.
  A port is the midpoint of a tessellation side on the boundary of a region.
  A port-to-port walk traverses distinct triangle centers and stops at its first boundary exit.
  If it visits $N$ centers, its critical weight is $x^N$, where

$ x = \( 2 + sqrt(2) \)^(- 1 \/ 2) . $

For a closed polygon, $\| lambda \|$ denotes its number of bonds, which is also its number of vertices.
  All polygon sums below count unoriented, unrooted cycles.
  A sum modulo translations counts each lattice translation class once.
  Two cycles are incompatible if they share a vertex; a cycle is incompatible with itself.
  Their basic pair weight is $x^(\| lambda \| + \| lambda' \|)$.

Identify horizontal tessellation coordinates modulo $M = 2 m$, with $m$ even.
  Mark the face centers $O = \( 0 \, 0 \)$ and $O' = \( m \, 0 \)$ on a horizontal cut.
  Call the $2 m$ tessellation sides along this cut its sites.
  Write $A$ for the $m$ sites from $O$ to $O'$ in eastward order and $B$ for the remaining $m$ sites.
  Let $G_m \( g \)$ be the sum over collections of disjoint simple cylinder cycles, each separating $O$ from $O'$,
  with weight

$ product_lambda g x^(\| lambda \|) . $

The empty collection contributes one; Figure 1 shows the two site intervals.
  The cylinder is infinite in the vertical direction; equivalently take increasing finite cylinders with closed
  rims, meaning that every port on either rim is unused. The proof below establishes finiteness and identifies
  this limit. Because each cycle crosses the cut between the marks,
  $G_m$ is a polynomial in $g$ of degree at most $2 m$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, -1.2), (8, 1.2), fill: rgb("#f7f7ff"), stroke: none)
  line((0, -1.4), (0, 1.4), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((8, -1.4), (8, 1.4), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((0, 0), (8, 0), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.07056, fill: black, stroke: none)
  content((0, 0), [$O$], anchor: "north-east", padding: 0.1176cm)
  circle((4, 0), radius: 0.07056, fill: black, stroke: none)
  content((4, 0), [$O'$], anchor: "north", padding: 0.1176cm)
  circle((8, 0), radius: 0.07056, fill: black, stroke: none)
  content((8, 0), [$O$], anchor: "north-west", padding: 0.1176cm)
  line((0.1, -1.5), (3.9, -1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2, -1.5), [$m$ sites], anchor: "north", padding: 0.1176cm)
  line((4.1, -1.5), (7.9, -1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((6, -1.5), [$m$ sites], anchor: "north", padding: 0.1176cm)
  circle((4, 0.05), radius: (1.05, 0.82), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10))
  circle((4, 0.05), radius: (1.55, 1.03), stroke: (paint: rgb("#000099"), thickness: 1.2pt, miter-limit: 10))
  line((-0.5, 0.65), (0.1, 0.65), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  line((7.9, 0.65), (8.5, 0.65), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((4, 1.6), [horizontal cut; identify the two dashed sides])
})],
  caption: [Figure 1: The balanced cylinder, shown cut open along its seam. The two marks split a period into equal site lists. The drawn nested cycles separate the marks; the definition also permits noncontractible separating cycles. The drawing is schematic rather than a lattice embedding. ],
) <j:fig-cylinder>

For a regular tessellation hexagon $D_R$ of integer side length $R$,
  let $cal(Z) \( R \)$ be the partition of disjoint polygons contained in $D_R$ and surrounding its central face,
  each weighted by $2 x^(\| lambda \|)$; the empty collection contributes one.
  Let $cal(C)_R$ consist of the ordered first-exit chords of $D_R$ whose diameter is at least $R \/ 10$.
  Both boundary ports are free: the sum includes every starting port and every possible first-exit port,
  retaining the direction from start to exit. Define the finite partition and probability law by

$ Z_R^(upright("chord")) = sum_(gamma in cal(C)_R) x^(N \( gamma \)) \, wide
  bb(P)_R^(upright("chord")) \( gamma \) = x^(N \( gamma \)) / Z_R^(upright("chord")) quad \( gamma in cal(C)_R \) . $

For a positive quantity $F \( R \)$, the notation $F \( R \) =
  R^(a + o \( 1 \))$ means $log F \( R \) \/ log R arrow.r a$.
  An upper bound $F \( R \) lt.eq R^(a + o \( 1 \))$ means that for every $epsilon.alt >
  0$ it is at most $C_epsilon.alt R^(a + epsilon.alt)$. Uniform occurrences of this notation have constants and
  thresholds independent of the indicated geometric data.

#thm([Theorem 1.1.])[
  (Cylinder pressure and planar nesting).  #emph[As $m arrow.r oo$ through even integers,
$ G_m \( 2 \) = m^(1 \/ 6 + o \( 1 \)) \, wide - frac(d^2, d g^2) log G_m \( g \)\|_(g = 0) = O \( log m \) . $

 The derivative is the total basic weight of ordered incompatible pairs of separating cycles,
   including a cycle paired with itself. Locally uniformly for complex $Theta$ with $\| Re Theta \| < pi$,
$ \| G_m \( 2 cos Theta \) \| lt.eq m^(Re \( 1 \/ 6 - 2 Theta^2 \/ \( 3 pi^2 \) \) + o \( 1 \)) . $

 The planar partition satisfies $cal(Z) \( R \) = R^(1 \/ 12 + o \( 1 \))$ as $R$ tends to infinity through integers.]
] <j:cylinder>

#thm([Theorem 1.2.])[
  (Finite chords and marked polygons).  #emph[For the chord law just defined,
$ Z_R^(upright("chord")) = R^(3 \/ 4 + o \( 1 \)) \, wide bb(E)_R^(upright("chord")) N = R^(4 \/ 3 + o \( 1 \)) . $

 Uniformly for honeycomb vertices $v$ at distance at most $R \/ 10$ from the hexagon center,
$ bb(P)_R^(upright("chord")) \( v in gamma \) = R^(- 2 \/ 3 + o \( 1 \)) . $

 Furthermore, for planar polygons modulo lattice translations,
#[#set math.equation(numbering: n => "(1.1)")
 $ sum_("diam" lambda lt.eq H) x^(\| lambda \|) \| lambda \|^2 lt.eq H^(2 \/ 3 + o \( 1 \)) . $ <j:polygon-square>]

]
] <j:hexagon>

The chord conclusions describe this finite law, which is normalized over all lengths allowed by the domain and the
  diameter cutoff. The visit estimate concerns the stated bulk vertices.
  The final inequality sums closed polygons modulo translations.
  Its proof uses the positive mass of single polygons passing through two specified bonds on a tilted cylinder.
  Theorem 29, stated at the start of Section 12, gives the precise restrictions on the two site lists and the
  uniform estimate used for this purpose.

=== 1.2 Earlier work <earlier-work>

Nienhuis’s analysis of the dilute $O \( n \)$ model predicted the two-dimensional self-avoiding-walk exponents
  [14]. The conventional spatial prediction is $nu = 3 \/ 4$:
  the mean-square displacement of a uniform length-$n$ walk is expected to be $n^(2 nu + o \( 1 \))$ [3]
  Equation (8). The reciprocal $1 \/ nu = 4 \/ 3$ motivates the length exponent in our finite chord law,
  whose normalization and boundary conditions are specified above.
  Duminil-Copin and Smirnov proved the exact honeycomb connective constant by a parafermionic local cancellation
  and a boundary-flux argument [3]. Their theorem determines the critical activity used here.
  The local cancellation also gives a positive bound on a convex boundary partition;
  the chord law requires quantitative control of the part carried by macroscopic exits.
  The vanishing of critical bridge mass was proved by Beaton, Bousquet-Mélou, de Gier,
  Duminil-Copin and Guttmann [2]. For honeycomb bridges, Glazman and Manolescu subsequently obtained a logarithmic
  subsequence bound. For their specified columnwise rhombic half-plane tilings they also proved invariance of
  boundary two-point functions [8] Theorem 1 and Proposition 1.1.
  Krachun and Panagiotis obtained a polynomial upper bound on the critical bridge partition and used it to prove
  quantitative sub-ballisticity for uniform length-$n$ honeycomb walks [13].
  These results concern distinct normalizations and precision levels;
  our boundary proof establishes the radius-arch exponent with arbitrary exponent slack.

The extension to rhombic weights connects this cancellation to Yang–Baxter methods [8].
  Our local-weight and fusion calculations keep the physical normalization explicit.

Grimm and Pearce developed a two-colour braid–monoid formulation of dilute loop models and its Yang–Baxterization
  [9] Sections 4.2 and 4.6. The trigonometric weights underlying the rhombic model trace back to Nienhuis [15,8].
  Finite-size corrections to periodic dilute-loop transfer-matrix spectra have integrable-model predecessors [18].
  For an open-strip dilute $O \( 1 \)$ model, Fehér and Nienhuis derive fusion and current recursions [4].
  Their current interpolation in Section 6 uses rapidity-symmetry hypotheses stated in Section 5;
  Appendix E supplies a boundary fusion construction and explains why that construction does not establish the
  current symmetries. The finite observable here is different,
  and the symmetry within each of its two site groups is proved directly.
  These earlier spectral and current formulas do not by themselves identify its marked vacuum pairing or physical
  normalization.

The fermionic contractions and bosonic oscillator conversion belong to the classical Wick and boson–fermion
  methods [17,5,6]; we compute their twist, charge conventions and analytic limits in the normalization needed here.

=== 1.3 Proof strategy <proof-strategy>

The cylinder calculation begins by orienting occupied edges, with the three states empty, forward and backward.
  Phases attached to turns, seam crossings, and crossings of $A$ make the two orientations of a loop cancel unless
  it separates the marks; a separating loop contributes $g$.
  Long stacks with empty rims converge to vectors indexed by spin configurations on the cut,
  whose pairing with the cut insertion gives the partition.
  Finiteness of the total half-plane arch weight, proved in Section 2, justifies their limits.
  Section 3 then uses local exchange and fusion, a spectral projector,
  and polynomial interpolation to obtain an exact finite sum over three-valued site spins.
  It temporarily allows arbitrary consecutive lists $A \, B$ and nonzero complex spectral variables at their
  sites. The balanced honeycomb case is recovered by choosing equal list sizes and setting all site spectral
  variables to $1$.

Individual terms in this spin sum have poles when these variables coincide,
  although the combined expression is regular. Sections 4 and 5 replace the sum by contour residues,
  separate the coincident sites, and express the contractions as an angular fermion trace.
  Evaluating that trace in oscillator coordinates gives a gas on a horizontal circle of auxiliary length $T$.
  Its particles have two species, corresponding to $A$ and $B$, and carry integer charges.
  The gas records a running total charge, an integer that changes by minus each particle’s total charge as
  particles are crossed. The resulting weights are signed or complex.
  For the balanced cylinder, the limit $T arrow.r oo$ is taken at each fixed site count;
  the estimates in the site count come afterward.

Section 6 controls the absolute gas weights by a quadratic cost in the number of particles in each box and in this
  running total charge at box boundaries. Section 7 uses this estimate to form a compact block propagator,
  with a contracting auxiliary coordinate carrying the interaction with earlier blocks exactly.
  The site factors suppress certain particle types on a central interval of length proportional to $log m$.
  The limiting operator there omits those types; the exterior operator allows all types.
  Their propagation rates therefore produce a power of $m$.

The exterior operator still has signed weights, and its eigenvalues of maximal modulus may have Jordan blocks.
  At fixed $m$, the finite identity supplies a limit in which the perturbed trace minus the normalized physical
  value times the unperturbed trace tends to zero. After normalization by the spectral radius,
  Lemma 18 expands the $n$th power of the exterior operator into factors $zeta^n$ with $\| zeta \| = 1$,
  multiplied by polynomials in $n$, and compares the polynomial coefficients in the trace identity.
  This retains all Jordan terms and bounds the physical value without dividing by a trace that may cancel.
  The Pfaffian scalar computed in Section 8, the exact normalization $G_m \( 0 \) = 1$,
  and positivity of the coefficients of $G_m$ then give the cylinder exponent and the incompatible-pair bound.

The chord mean also requires the size of its own finite partition $Z_R^(upright("chord"))$.
  The local boundary balance controls the total exit weight from a port;
  the chord partition requires the part carried by macroscopic exits.
  Write $W_R$ for the total critical weight of first-exit same-boundary arches in a half-plane bounded by a
  horizontal tessellation line that start at a fixed port and reach distance at least $R$.
  Section 10 determines $W_R$ by an argument depending on the local transfer identities and independent of the
  compact propagator. The added-row expansion identifies the derivative of a one-row auxiliary cylinder increment
  with its circumference $M$ times the deficit left in the boundary balance by half-plane arches that embed in
  that cylinder. Fusion gives functional relations for the increment,
  which determine the derivative through a positive density on ordered points $0 < k_1 < dots.h.c <
  k_M$ whose additional factor is an average over unitary conjugates.
  Comparison with ensembles whose orthogonal polynomials can be evaluated gives the derivative exponent $3 \/ 4$.
  The resulting deficit recovers the full mass in the boundary balance and gives an upper bound for the endpoint
  tail and a lower bound for the radius tail. A wedge comparison supplies the matching radius upper bound,
  hence $W_R = R^(- 1 \/ 4 + o \( 1 \))$. A boundary comparison transfers this estimate to macroscopic hexagon
  exits; summing over the free starting ports gives $Z_R^(upright("chord")) = R^(3 \/ 4 + o \( 1 \))$.

Proposition 26 applies the boundary balance after removing the triangle centered at a honeycomb vertex $v$ not
  adjacent to a boundary port. It compares the raw weight of chords visiting $v$ with the sum of the nesting
  partitions around its three incident faces. For vertices within $R \/ 10$ of the hexagon center,
  every such chord meets the diameter cutoff when $R$ is sufficiently large.
  Summing over vertices bounds the mean below by a constant times $R^2 cal(Z) \( floor.l R \/ 2 floor.r \) \/
  Z_R^(upright("chord"))$ and above by a constant times $R^2 cal(Z) \( 3 R \) \/ Z_R^(upright("chord")) + R$;
  the additive term accounts for vertices adjacent to boundary ports.
  Section 11 uses the $O \( log m \)$ incompatible-pair bound to show that the sum of $x^(\| lambda \|)$ over all
  noncontractible separating cycles and all contractible cycles whose disk lifts are not confined within a fixed
  multiple of $m$ around their enclosed mark is $O \( sqrt(log m) \)$. Their contribution costs a subpower factor.
  The remaining cycles lift near one of the marks, giving upper and lower comparisons of $G_m \( 2 \)$ with
  products of planar nesting partitions at comparable radii.
  This gives the exponent $1 \/ 12$; the visit comparison and chord normalization then give the mean and
  bulk-visit exponents.

The length-square mass is handled through the positive sum of $x^(\| lambda \|)$ over single polygons using two
  specified bonds. After a lattice rotation or reflection, the marked estimate in Theorem 29 applies to cylinders
  whose cuts use horizontal tessellation steps and steps tilted by $pi \/ 3$.
  Both marked bonds cross horizontal steps, and the proportions of the two directions in each unmarked list
  satisfy the restrictions in that theorem. Sections 12–14 derive the matrix and horizontal representations of
  this two-bond sum, including their scalar normalization and uniform suppression for those lists.
  If their sizes are $m$ and $n$, the two suppression intervals have lengths proportional to $log m$ and $log n$.
  On the parts covered by only the longer interval, the mixed propagator allows all types in one species and only
  the unsuppressed types in the other. Section 15 bounds this propagator by a separate calculation with one
  species. Monotonicity of the running total charge controls the central region where both suppressions act.
  The final counting argument sums the marked estimate over selected bond pairs whose displacements fit these cuts
  and separately bounds polygons for which too few such pairs are available. This proves (1.1).

== 2 Boundary balance and local transfer identities <j:local>

We first prove the local identities used by both cylinder observables.
  The boundary balance also shows that the total half-plane arch weight is finite;
  this finiteness justifies the vacuum limits in Section 3. The sharper arch exponent is proved in Section 10.

We keep the lattice, ports and first-exit convention of the introduction.
  In particular a walk traversing $N$ triangle centers has weight $x^N$, where $x = \( 2 + sqrt(2) \)^(- 1 \/ 2)$.
  The local turning balance is the Duminil-Copin–Smirnov parafermionic cancellation.
  The extension to rhombic tiles uses the Yang–Baxter weights discussed by Glazman and Manolescu [3,8].

The boundary estimate ultimately obtained in Section 10 is:
  in the half-plane bounded by a horizontal tessellation line,
  the total weight $W_R$ of boundary-to-boundary walks from a fixed port reaching Euclidean distance $R$ or more
  from that port satisfies

$ W_R = R^(- 1 \/ 4 + o \( 1 \)) . $

Write $s = 3 \/ 8$, $alpha = pi \/ 8$, so $2 x cos \( s pi \/ 3 \) = 1$.
  For any finite convex tessellation polygon $D$ and starting port $a$, the sum over all SAWs to ports,
  with the extra factor $e^(i s T)$ for total turning $T$, is 1.
  In fact, extend the nonbacktracking walk from vertex to vertex,
  with factors $x e^(plus.minus i s pi \/ 3)$ summing to 1, and stop before traversing an already visited vertex.
  Ends of this tree due to first collision cancel: after a common incoming stem there are two ways around the
  newly formed simple loop, and the stem approaches the loop from outside.
  The turn at closure would be $plus.minus pi \/ 3$ (unused third branch outside means a convex corner);
  thus other loop vertices contribute $plus.minus 5 pi \/ 3$ and the turn from the stem onto the loop $minus.plus
  pi \/ 3$. The extra factor therefore sums to $2 cos \( 4 pi s \/ 3 \) = 0$.
  For the walks to ports $b$, $T = Delta - pi$ where $Delta$ is the counterclockwise boundary tangent turn
  accumulated from $a$ to $b$ (close the walk along the boundary from $b$ to $a$,
  giving positive orientation and two extra quarter turns). In particular $cos \( s T \) gt.eq sin alpha > 0$.
  This turning calculation is the local parafermionic balance in path form. [3]

Let $H \( d \)$ denote the half-plane arch weight from a port to a port $d$ steps to the right.
  Reflection gives the same weight to the left; by convex exhaustions $2 sin alpha sum_(d > 0) H \( d \) lt.eq 1$.

=== 2.1 An auxiliary cylinder and spectral equation <an-auxiliary-cylinder-and-spectral-equation>

Take a cylinder obtained by identifying modulo $M$ steps horizontally, tiled by rows of $M$ rhombi each,
  with basis $1 \, e^(i theta)$ and potentially a different $theta$ per row.
  Connections inside a tile link pairs of bond midpoints on distinct sides, using each at most once,
  noncrossingly. The empty weight is 1, a straight connection between opposite sides weighs $v$,
  the single turns of absolute angles $theta \, pi - theta$ weigh $u \,
  d$ respectively (port directions normal to sides); and two simultaneous turns weigh $a$ for the pairing
  left–down and up–right, or $b$ for left–up and right–down.
  With $phi.alt = 3 theta \/ 8$, $s_k = sin \( phi.alt + k alpha \)$, $h = sin \( 2 alpha \)$,
  use the trigonometric SAW weights

$ \( u \, d \, v \, a \, b \) = frac(\( h s_5 \, h s_0 \, s_0 s_5 \, s_5 s_6 \, - s_0 s_7 \), s_2 s_3) . $

At $phi.alt = alpha$ these are $\( x \, x^2 \, x^2 \, x^2 \, 0 \)$,
  exactly the original lattice rules (split each tile into the two equilateral triangles).
  The relation between rhombic geometry, parafermionic cancellation and integrable loop weights was developed by
  Ikhlef and Cardy [10]. Glazman’s corrected general loop-weight formulas [7] Section 5 give a useful comparison;
  the five weights and their critical specialization here are checked directly below.
  See also the boundary two-point results in [8].

For a finite stack, close both rims (require unused ports).
  The partition $Z$ of #strong[one noncontractible polygon only] (unoriented,
  unrooted) is the linear coefficient in fugacity $n$ of the full loop sum giving weight zero to contractible
  loops and weight $n$ per noncontractible loop. For real angles $0 < theta < pi$,
  orient loops with factor $exp \( - i T \/ 4 \)$ and twist $p$ to the power signed number of seam crossings (east
  positive); summing orientations effects precisely these loop weights for $n = p + p^(- 1)$.
  Indeed disjoint arcs can be drawn in tiles with the indicated tangent turns;
  an embedded loop in the flat cylinder is either contractible with turn $plus.minus 2
  pi$ or has winding $plus.minus 1$ and turn zero. For instance the latter follows by mapping conformally by an
  exponential to a round annulus and using the plane turning formula there. These identities then extend algebraically.

The oriented matrix, with spins $0 \, plus.minus 1$ on horizontal-flow and descending-flow bonds (respectively
  across the sides parallel to $e^(i theta)$ and to $1$), has row indices (left, up), column indices (right,
  down), positive signs meaning left to right or up to down.
  Remove the phase $e^(i theta \( upright("left") - upright("right") \) \/ 4)$ (telescoping).
  The resulting $R \( phi.alt \)$ conserves the sum, with blocks, $lambda = e^(- 2 i alpha)$:

$ \( s' \, s' \) quad \( s' = plus.minus 1 \) & a\
\( s' \, 0 \) \, \( 0 \, s' \) & mat(delim: "(", v, u; u, v)\
\( 1 \, - 1 \) \, \( 0 \, 0 \) \, \( - 1 \, 1 \) &
  mat(delim: "(", b, d lambda, b lambda^2 + a; d lambda^(- 1), 1, d lambda; b lambda^(- 2) + a, d lambda^(- 1), b) $

(the turns connecting left to down have magnitude $theta$, those connecting left to up have magnitude $pi - theta$).

=== 2.2 Local exchange and fusion <local-exchange-and-fusion>

The matrix identities below have two uses. Exchange lets us interchange two rows of local matrices.
  Fusion identifies the action on a smaller auxiliary space;
  at a matching site the action on the quotient vanishes. We treat these as meromorphic identities,
  including at the rank-deficient fusion matrices.

Let $V = bb(C)^3$ with basis $\| 0 chevron.r \, \| + chevron.r \, \| - chevron.r$,
  and use subscripts to indicate an ordered pair of tensor factors.
  On a copy $V_i$, let $s_i \| k chevron.r_i = k \| k chevron.r_i$.
  Write $P_(i j)$ for the interchange of factors $i \, j$, and put

$ Delta_R \( psi \) = sin \( psi + 2 alpha \) sin \( psi + 3 alpha \) . $

#thm([Lemma 2.1.])[
  (Local exchange and fusion).  #emph[The entries of $R \( psi \)$ are meromorphic,
    with possible poles at $Delta_R \( psi \) = 0$. The following are identities of meromorphic matrix functions:
$ R_12 \( t \) R_13 \( t + phi.alt \) R_23 \( phi.alt \) & = R_23 \( phi.alt \) R_13 \( t + phi.alt \) R_12 \( t \) \,\
R_12 \( phi.alt \) R_21 \( - phi.alt \) & = I . $

 In particular the second equality is a pointwise inverse identity where both factors are regular,
   and $R_12 \( 0 \) = P_12$.]
  #emph[For $delta = 2 \, 3$, let $E_2 = V$, $E_3 = bb(C)$, and define injective maps $J_delta : E_delta arrow.r
    V ⊗ V$ by
$ J_2 \| 0 chevron.r & = \| 00 chevron.r + x sum_(k = plus.minus 1) lambda^k \| k \, -
  k chevron.r \, & J_2 \| k chevron.r & = x \( \| k \, 0 chevron.r + \| 0 \, k chevron.r \)
  quad \( k = plus.minus 1 \) \,\
J_3 \( 1 \) & = sum_(k = 0 \, plus.minus 1) lambda^k \| k \, - k chevron.r . $

 On $E_2$ let $s_(upright(f)) \| k chevron.r = k \| k chevron.r$, and on $E_3$ let $s_(upright(f)) = 0$.
   Then $R_12 \( delta alpha \) = J_delta J_delta^(*)$ and, writing $J = J_delta$,
$ R_23 \( phi.alt \) R_13 \( phi.alt + delta alpha \) \( J ⊗ I \) = \( J ⊗ I \) R_(upright(f)) \( phi.alt \) \,
  wide R_(upright(f)) \( phi.alt \) = cases(delim: "{", R \( phi.alt + alpha \) \, & delta = 2 \,, I \, & delta = 3 .) $

 The intertwining equality is again meromorphic in $phi.alt$.]
] <j:local-exchange-fusion>

#proof[
  At $0 \, 2 alpha \, 3 alpha$ the five weights are, respectively, $\( 1 \, 0 \, 0 \, 1 \, 0 \)$,
    $\( x^2 \, x \, x^2 \, 0 \, x^2 \)$ and $\( 0 \, 1 \, 0 \, 0 \, 1 \)$.
    The blocks give $R_12 \( 0 \) = P_12$ and the two factorizations directly.
    For example, the charge-zero column of $J_2$ is $\( x lambda \, 1 \, x lambda^(- 1) \)^T$,
    and the charge-$plus.minus 1$ columns are $x \( 1 \, 1 \)^T$. These are embeddings rather than isometries:
    $J_2^(*) J_2 = "diag" \( 3 - sqrt(2) \, 2 - sqrt(2) \, 2 - sqrt(2) \)$ in the displayed basis,
    and $J_3^(*) J_3 = 3$.
  For regular $phi.alt$ and $- phi.alt$, unitarity follows by block multiplication, using $lambda^4 = - 1$.
    With primes denoting $- phi.alt$, the required scalar relations are
  $ a a' = 1 \, quad a b' + b a' + d d' = 0 \, quad a d' + d = a' d + d' = 0 \, quad v v' + u u' = 1 \, quad
    v u' + u v' = 0 $
  by $s'_j = s_(8 - j)$ and the sine products above. For instance the first diagonal entry of the charge-zero
    product is $a a' + lambda^2 \( a b' + b a' + d d' \)$, and its adjacent entry is $lambda \( a d' + d \)$.
    Since these are rational trigonometric identities, unitarity follows meromorphically as stated.
  Writing $B \( i \, l \; j \, k \; phi.alt \)$ for entries of $R$, the same blocks give
  $ B \( i \, l \; r \, k \; phi.alt + 3 alpha \) = lambda^(k - l) B \( l \, - r \; k \, - i \; - phi.alt \) $
  (weights swap $u \, d$ and $a \, b$, keeping $v$). Thus for the single column intertwining, the coefficient is
  $ sum_r B \( j \, m \; - r \, l \; phi.alt \) B \( i \, l \; r \, k \; phi.alt + 3 alpha \) lambda^r =
    lambda^i delta_(j \, - i) delta_(m \, k) \, wide l = r + k - i \, $
  with out-of-range entries zero.
  For the other intertwining, denote the five weights at $phi.alt + 2 alpha$ by $U \, D \, V \, A \, B_0$,
    at $phi.alt + alpha$ by $w \, X \, g \, e \, f$. To detail the block multiplication,
    the components with inputs fused spin $r$ and site spin $k$, outputs $i \, j \, m$ ($i + j + m = r + k$) are
  $ sum_t J_(t \, r - t \; r) thin R \( phi.alt + 2 alpha \)_(i \, t + k - i \; t \, k) thin
    R \( phi.alt \)_(j \, m \; r - t \, t + k - i) = J_(i \, j \; i + j)
    R \( phi.alt + alpha \)_(i + j \, m \; r \, k) . $
  It suffices (opposite spins conjugate the phases) to check the following scalar identities for each group after
    substitution and $lambda^2 + lambda^(- 2) = 0$:
$ \( r \, k \) & \
\( 1 \, 1 \) & V a = A v + U u = e \, quad A u + U v = 0\
\( 1 \, 0 \) & D a = w \, quad x \( U v + u \) = w \, quad U u + v = D d + V = g \, quad D b + V d = 0\
\( 0 \, 1 \) & B_0 a = g \, quad x D u + V v = g \, quad x D v + V u = x w \, quad x \( A a + B_0 b \) + U d =
  0 \, quad x B_0 d + U = x w\
\( 1 \, - 1 \) & B_0 v = D d + V b = f \, quad B_0 u = x \( D + V d \) = X \, quad V a = A v + U u = e \, quad
  A u + U v = 0\
\( 0 \, 0 \) & x U a + d = x X \, quad D u + x V v = x \, quad D v + x V u = x X $

  For clarity $U \, D \, V \, A \, B_0$ have numerators $\( h s_7 \, h s_2 \, s_2 s_7 \, - s_0 s_7 \, s_2 s_1 \)$
    over $s_4 s_5$, and $w \, X \, g \, e \, f$ numerators $\( h s_6 \, h s_1 \, s_1 s_6 \, s_6 s_7 \, s_1 s_0 \)$
    over $s_3 s_4$. Direct common factors cancel; the remaining identities reduce to
  $ s_2 s_6 = h^2 - s_0^2 = x \( s_0 s_7 + s_4 s_5 \) \, quad s_1 s_5 = h^2 - s_7^2 = x \( s_0 s_7 + s_2 s_3 \) \,\
s_1 - s_7 = s_0 \/ x \, quad s_6 - s_0 = s_7 \/ x \,\
s_0 s_1 + s_4 s_5 = s_2 s_3 + s_6 s_7 = s_1 s_2 + s_5 s_6 = h^2 \/ x \,\
s_1 s_6 - s_0 s_7 = h^2 x \, quad s_3 s_4 - s_0 s_7 = h^2 \/ x \, quad x \( s_5 s_6 - s_0 s_1 \) = s_3 s_7 \, quad
  x \( s_1 s_2 - s_6 s_7 \) = s_0 s_4 \, $
  all by product-to-sum.
  For regular real parameters the matrices are Hermitian. The intertwining and its adjoint therefore give the
    three-space exchange at $t = 2 alpha \, 3 alpha$; the swap gives it at $t = 0$.
    Interchange spaces 2 and 3 in these equalities and apply unitarity at a generic $phi.alt$.
    This gives exchange also at $t + phi.alt = 0 \, 2 alpha \, 3 alpha$.
  It remains to see why these special values determine the identity.
    Every entry of $Delta_R \( psi \) R \( psi \)$ has Fourier exponents between $- 2$ and $2$.
    Moreover, if $Z \| k chevron.r = \( - 1 \)^(k^2) \| k chevron.r$, then $R \( psi + pi \) =
    Z_1 R \( psi \) Z_1$: only the single-turn weights change sign.
    After multiplying the exchange difference by $Delta_R \( t \) Delta_R \( t + phi.alt \)
    Delta_R \( phi.alt \)$, each entry consequently has exponents between $- 4$ and $4$ in $e^(i t)$,
    all of one parity. After a monomial factor it is a polynomial in $e^(2 i t)$ of degree at most $4$.
    The six values $0 \, 2 alpha \, 3 alpha \, - phi.alt \, 2 alpha - phi.alt \, 3 alpha -
    phi.alt$ are distinct modulo $pi$ for generic real $phi.alt$, so the polynomial vanishes.
    Continuation in the two parameters proves the meromorphic identity. ◻
]

#thm([Lemma 2.2.])[
  (Restriction and quotient at fusion).  #emph[Fix $delta in { 2 \, 3 }$, put $W_delta =
    "im" J_delta subset V_1 ⊗ V_2$, and for another factor $V_k$ set
$ F_(delta \, k) \( psi \) = R_(2 k) \( psi \) R_(1 k) \( psi + delta alpha \) . $

 At regular parameters the subspace $W_delta ⊗ V_k$ is invariant,
   and transporting the restriction through $J_delta ⊗ I$ gives $R_(upright(f)) \( psi \)$ from Lemma 3.
   At $psi = 0$ the full image of $F_(delta \, k) \( 0 \)$ lies in this subspace.
   Hence the induced operator on $#scale(x: 120%, y: 120%)[\(] \( V_1 ⊗ V_2 \) \/ W_delta
   #scale(x: 120%, y: 120%)[\)] ⊗ V_k$ is zero there and, near $z = e^(2 i psi) = 1$,
   is holomorphic and divisible by $z - 1$.]
  #emph[The twist restricts by $p^(s_1 + s_2) J_2 = J_2 p^(s_(upright(f)))$ and $p^(s_1 + s_2) J_3 =
    J_3$ for every $p eq.not 0$. There is also the meromorphic site intertwining
#[#set math.equation(numbering: n => "(2.1)")
 $ R_(a 1) \( psi \) R_(a 2) \( psi + delta alpha \) \( I_a ⊗ J_delta \) = \( I_a ⊗ J_delta \)
   cases(delim: "{", R_(a upright(f)) \( psi + alpha \) \, & delta = 2 \,, I_a \, & delta = 3 .) $ <j:site-fusion>]

]
] <j:local-restriction>

#proof[
  Invariance and the restricted action are the preceding intertwining.
    Write $J_(delta \, 1 k)$ for the embedding on factors 1 and $k$, with the other factor unchanged.
    At the matching point the factorization supplies the stronger inclusion
  $ F_(delta \, k) \( 0 \) = P_(2 k) R_(1 k) \( delta alpha \) = P_(2 k) J_(delta \, 1 k) J_(delta \, 1 k)^(*) \,
    wide "im" F_(delta \, k) \( 0 \) subset.eq W_delta ⊗ V_k . $
  Indeed $P_(2 k)$ carries the image of $J_(delta \, 1 k)$ to that of $J_(delta \, 12)$.
    The quotient operator is holomorphic near zero because the local parameters $0 \, delta alpha$ are regular.
    Its vanishing gives the claimed factor in the local coordinate $z - 1$.
    The twist formulas follow because every term of $J_2 \| s_(upright(f))
    chevron.r$ has total spin $s_(upright(f))$ and every term of $J_3$ has total spin zero.
  For real regular parameters the blocks give $overline(R_(i j)) = R_(j i)$ and $P_12 overline(J_delta) =
    J_delta$. Conjugating the row intertwining and exchanging spaces 1 and 2 gives (2.1);
    continuation gives its meromorphic form. ◻
]

=== 2.3 A Fourier identity for the scalar kernels <a-fourier-identity-for-the-scalar-kernels>

The finite vacuum normalization and the later boundary moment problem use the same elementary transform.
  Recording it here makes both calculations independent of their order.

#thm([Lemma 2.3.])[
  #emph[For $0 < beta < pi$ and $\| Im y \| < pi - beta$,
$ integral_(bb(R)) e^(i k y) frac(sinh \( beta k \), sinh \( pi k \)) thin d k = frac(sin beta, cosh y + cos beta) . $

 The integral and its parameter derivatives converge locally uniformly on the indicated strip.]
] <j:fourier-kernel>

#proof[
  For real $y > 0$, close the contour by rectangles in the upper half-plane with upper edges at half-integer
    heights. The ratio of hyperbolic sines decays exponentially on the vertical edges as their real coordinates
    tend to infinity; the factor $e^(i k y)$ controls the upper edge as its height tends to infinity.
    The residues at $k = i n$, $n gt.eq 1$, give
  $ 2 sum_(n gt.eq 1) \( - 1 \)^(n + 1) sin \( n beta \) e^(- n y) = frac(sin beta, cosh y + cos beta) . $
  The geometric series proves the last equality. Evenness extends it to negative real $y$,
    and dominated convergence covers $y = 0$. Exponential decay in $\|
    k \|$ proves local uniform convergence and parameter differentiation on smaller strips.
    Analytic continuation then gives the asserted domain. ◻
]

== 3 The two-puncture observable and its finite spin formula <c7:finite>

We construct the finite cylinder observable that determines the nesting partition.
  Orienting the loops expresses it as a pairing of two vacuum vectors.
  We then identify the scalar factor that clears the denominators of these particular vectors and use their
  polynomial degrees and fusion values to determine the spin formula.
  The same vector statement will also supply the regularity needed for the two marked bonds.

Keep the honeycomb cylinder of circumference $M$, first with finite height on either side of a cut along a
  horizontal tessellation line. Mark two face centers (tessellation vertices) $O \, O'$ on the cut,
  the first at the seam, dividing the sites into consecutive groups $A \, B$ in eastward order starting at $O$.
  Close both rims. Use any collection of disjoint simple cycles, #emph[each separating] $O \, O'$,
  with weight $x^(\| gamma \|) g$ per cycle, $x$ the critical weight above.
  Write $G_(A \, B) \( g \)$ for this partition including the empty term, with the height sent to infinity.
  We use $g = h + h^(- 1)$ (in this part $h$ denotes a twist parameter, not the sine constant in the weights).
  The degree in $g$ is bounded by $M$ since the cycles must intersect the arc of the cut from $O$ to $O'$.

Here and below matrices of oriented weights and their spectral parameter $phi.alt$ refer to $R \( phi.alt \)$
  above, $lambda = e^(- 2 i alpha)$ and $alpha = pi \/ 8$. The rhombic Yang–Baxter setting and periodic
  dilute-loop spectra have the precedents [8,18]. The current calculation of [4] Section 6 is a related recursion
  under a rapidity-symmetry hypothesis; our finite observable and its symmetry are derived below.

=== 3.1 The oriented observable and its vacuum limits <the-oriented-observable-and-its-vacuum-limits>

Put $q = e^(2 i alpha) = lambda^(- 1)$, introduce site variables $x_j =
  e^(2 i phi.alt_j)$ (not vertex fugacities), and, with $w = e^(2 i xi)$, set

$ T_p \( w \) = upright("Tr")_a thin p^(s_a) R_(a 1) \( xi - phi.alt_1 \) R_(a 2) \( xi - phi.alt_2 \) dots.h.c
  R_(a M) \( xi - phi.alt_M \) \, wide p in { i \, - i } . $

Here $s_j$ is the diagonal spin, index $a$ the auxiliary space. We work on the total site charge zero subspace

$ cal(H)_M = "Span" { \| sigma chevron.r : sigma in { - 1 \, 0 \, 1 }^M \, med sum_j sigma_j = 0 } $

and denote its empty vector by $\| 0 chevron.r$. Choices of square roots of the variables are understood.
  For each fixed $p$, the rows commute by Lemma 3. The vacuum matrix element satisfies

$ chevron.l 0 \| T_(p_1) \( w_1 \) dots.h.c T_(p_L) \( w_L \) \| 0 chevron.r = 1 $

for arbitrary words in the two twists, at regular parameters.
  Indeed the oriented phases in the blocks can still be drawn on the reference tiling with fixed angle $pi \/ 3$,
  keeping the angle-independent phases after removing the telescoping factor and varying only the scalar weights
  of the tile pictures. Each contractible loop has phase $plus.minus i$ before seam signs,
  and each noncontractible one has turn zero and winding $plus.minus 1$.
  Seam factors for either orientation are those for uniform twist $i$,
  times the same sign from the layers of twist $- i$. All loops therefore cancel.

We will use this word identity in two ways. First, every linear combination $A$ of operators $T_p \( w \) - I$,
  even with the two twists mixed, has zero as an eigenvalue:
  $chevron.l 0 \| A^k \| 0 chevron.r = 0$ for $k gt.eq 1$, and the characteristic polynomial would contradict this
  if its constant term were nonzero. Second, fix one twist $p$.
  Choose finitely many row deviations spanning the linear span of all $T_p \( w \) -
  I$ in $"End" cal(H)_M$ and simultaneously triangularize them.
  For every choice of coefficients, one diagonal character of the corresponding linear combination vanishes.
  A finite union of proper hyperplanes cannot cover the coefficient space, so one character vanishes identically.
  Thus this fixed-twist family has the simultaneous eigencharacter $T_p \( w \) = 1$.

For physical site variables all one, use twist $p = - i$ above the cut and $p = i$ below, with the insertion

$ D_A = \( i h \)^(sum_(j in A) s_j) . $

To check the weight, orient a contractible simple cycle counterclockwise or a noncontractible one eastward,
  and let $I_1 \, I_2$ indicate whether $O \, O'$ belong to its left component (interior or upper, respectively).
  The signed cut crossings in $A$ (downward positive) give $I_2 - I_1$.
  Signed seam crossings above and below $O$ (eastward positive) give $- I_1 \,
  I_1$ in the contractible case and $1 - I_1 \, I_1$ otherwise.
  These numbers follow by moving along the corresponding transverse arcs from component to component.
  Including turn, seam and insertion, the phase is $\( - i \) \( - 1 \)^(I_1) \( i h \)^(I_2 - I_1)$,
  with its inverse for reversed orientation. Thus it cancels unless the cycle separates the marks, and then sums to $g$.

The top and bottom vacuum vectors tend to finite limits $L_(-)^(upright("phys")) \, R_(+)^(upright("phys"))$;
  the subscripts $+ \, -$ on vacuum vectors stand for twists $i \, - i$.
  Untouched closed loops separately cancel, leaving disjoint arcs connecting ports on the cut in each
  half-cylinder. Any lift of such an arc has port separation less than $M$:
  otherwise its endpoints interlace those of a period translate, contradicting noncrossing.
  Products of finitely many half-plane arch sums $H \( d \)$ from Section 2 therefore dominate the absolute weights.

These physical vectors have the simultaneous eigencharacter $T = 1$ for their respective twists.
  For example, insert a regular row $T_i \( w \)$ just below the cut and commute it to the far closed rim.
  With the rim ports empty that row uses no double turn, so its absolute weights are bounded by the physical
  weights times a constant depending on $M \, w$. An arc affected by the row must reach the receding rim.
  Its total weight tends to zero by the same arch summability.
  The inserted row thus leaves the limit unchanged, and the top vector is treated in the same way.
  Both vacuum components are 1. This proves the height limit and finite coefficient sums (for example by taking
  $g > 0$), with

$ G_(A \, B) = L_(-)^(upright("phys")) D_A R_(+)^(upright("phys")) . $

=== 3.2 Fusion and the algebraic vacuum projector <fusion-and-the-algebraic-vacuum-projector>

Write $H_p = T_p - I$. We first record the behavior of a local matrix when $z =
  w \/ x_j$ tends to zero or infinity. Directly from the sine weights,

$ & \( a \, b \, v \) & \( u \, d \)\
z arrow.r 0 & \( q^(- 3) \, q^3 \, 1 \) & O \( z^(1 \/ 2) \)\
z arrow.r oo & \( q^3 \, q^(- 3) \, 1 \) & O \( z^(- 1 \/ 2) \) . $

The entries are holomorphic in $z^(1 \/ 2)$ at zero and in $z^(- 1 \/ 2)$ at infinity.
  On a state with auxiliary spin $r$ and site spin $s$, the diagonal limit is $q^(3 r s)$ at infinity and
  $q^(- 3 r s)$ at zero. The only surviving off-diagonal entry at infinity changes the auxiliary spin from $-
  1$ to $1$ and the site spin from $1$ to $- 1$ (row minus column); at zero this move is reversed.
  In particular every surviving move at an inactive site preserves its vacancy parity.

Square-root factors occur only in the single turns, which change auxiliary vacancy parity.
  Their number in an auxiliary trace is even, so $H_p \( w \)$ is rational in $w$,
  with possible simple poles $q^5 x_j \, q^6 x_j$ at generic sites.
  The same observation for a site says that changing a square-root sign conjugates $T_p$ by
  $P_j = \( - 1 \)^(s_j^2)$. At either endpoint of the row parameter,
  a closed auxiliary trace cannot use a strictly one-directional off-diagonal move.
  On $cal(H)_M$ the remaining diagonal trace is $sum_(r = - 1)^1 p^r q^(plus.minus 3 r sum_j s_j) = 1$.
  Thus $T_p \( 0 \) = T_p \( oo \) = I$. With $C_ell \( z \, b \) = z \/ \( z - q^ell b \)$ we obtain

$ H_p \( w \) = sum_(j = 1)^M sum_(t = 0)^1 C_(5 + t) \( w \, x_j \) U_(j t) \, $

where the coefficient operators commute. The basis functions vanish at zero and have distinct poles;
  the condition at infinity additionally gives $sum_(j \, t) U_(j t) = 0$.

The two embeddings and row fusion above give at any site $x_j$, generically,

$ T_p \( x_j \) T_p \( q^2 x_j \) = T_p \( q x_j \) \, wide T_p \( x_j \) T_p \( q^3 x_j \) = I . $

Indeed the combined auxiliary monodromy has local factors $R_(2 k) \( phi.alt \)
  R_(1 k) \( phi.alt + delta alpha \)$, with the lower parameter on the left.
  Lemma 4 identifies their restriction to $"im" J_delta$ and shows that the quotient factor at site $j$ is zero:
  its full image is already in $"im" J_delta ⊗ V_j$. The quotient monodromy therefore has zero trace.
  On the restriction the twist is the fused twist, or the identity for $delta = 3$, giving the two formulas.
  This is a trace of the restriction transported through $J_delta$, so no isometry factor enters.
  Square roots can be chosen consistently; shifting a whole row parameter by $pi$ leaves $T_p$ unchanged.

Set $T_j = T_p \( x_j \)$. Expanding the fusion formulas in the commuting coefficients $U_(k t)$ gives a
  homogeneous system $cal(L) \( T \) U = 0$. Its two rows for site $j$, with column site $k$, type $t$,
  and $C_ell = C_ell \( x_j \, x_k \)$, are

$ C_(5 + t) - C_(4 + t) + T_j C_(3 + t) \,\
C_(4 + t) + T_j \( C_(2 + t) - C_(3 + t) \) . $

The second is the rank-one fusion equation minus the first.
  At $T = 1$ these rows are $C_5 + C_3 - C_4$ on the same row and column list
  $Y = \( x_1 \, q x_1 \, dots.h \, x_M \, q x_M \)$. Subtracting the constant $1 \/ 2$ gives the skew kernel

$ S \( u \, v \) = frac(\( u - v \) \( 2 \( u + v \)^2 - d \( u \, v \) \), 2 \( u + v \) d \( u \, v \)) \, wide
  d \( u \, v \) = u^2 + sqrt(2) u v + v^2 . $

The adjugate of an even skew matrix is skew. Adding a matrix with constant entries therefore does not change its
  determinant, and $det cal(L) \( 1 \) = \( "Pf" S \( Y \) \)^2$. Whenever this scalar denominator is nonzero,

$ Pi_p = frac(det cal(L) \( T \), det cal(L) \( 1 \)) $

is a projector onto the common fixed space. Indeed the determinant is taken in the commutative algebra generated
  by the rows. The adjugate identity for $cal(L) \( T \) U = 0$ shows that $Pi_p$ annihilates every $U_(j t)$,
  while on their joint kernel $T_j = 1$ and $Pi_p = 1$. Hence its image is exactly that kernel and it is
  idempotent. Evaluating its polynomial numerator by the arbitrary-word vacuum identity also gives

$ chevron.l 0 \| Pi_p \| 0 chevron.r = chevron.l 0 \| Pi_p Pi_(p') \| 0 chevron.r =
  1 wide \( p \, p' in { i \, - i } \) . $

=== 3.3 The scalar normalizers <the-scalar-normalizers>

The denominator of the projector is governed by three scalar functions.
  The factorization below separates the factor $N$, which will clear the two selected vacuum vectors,
  from the additional factor $N_2^(*)$ present for the full projector.

We use the Pfaffian of an even skew matrix: it is the signed matching sum,
  equivalently the coefficient of the oriented volume form in the normalized top power of its two-form.
  It transforms under simultaneous row and column change by the determinant, and its square is the determinant,
  as follows by reduction to two-dimensional skew blocks. For the site list $X$, put $cal(P) \( X \) =
  product_(j < k) d \( x_j \, x_k \) \/ \( x_j - x_k \)$ and define

$ N \( X \) & = cal(P) \( X \) "Pf"_(j \, k) frac(x_j^2 - x_k^2, d \( x_j \, x_k \)) \,\
N_2^(*) \( X \) & = cal(P) \( X \)^2 det_(j \, k) frac(\( 2 + sqrt(2) \) x_j x_k, d \( x_j \, x_k \)) \,\
cal(J) \( X \) & = S \( 1 \, q \)^(- M) "Pf" S \( Y \) product_(j < k) P_(*) \( x_j \, x_k \) \,\
P_(*) \( u \, v \) & =
  frac(\( u + v \) \( u^2 + v^2 \) d \( u \, v \)^2, \( u - v \)^2 \( u^2 - sqrt(2) u v + v^2 \)) . $

When $M$ is odd, pad the Pfaffian defining $N$ by a last index whose column entries above the diagonal are 1.
  All empty-list normalizations are 1. Write $N_1 = N$, $N_2 = N_2^(*)$, $N_3 = cal(J)$, and set

$ ell_2 \( u \, z \) = z - q^5 u \, wide ell_3 \( u \, z \) = \( z - q^5 u \) \( z - q^6 u \) . $

#thm([Lemma 3.1.])[
  (Scalar normalizers).  #emph[For every list size $M$, the functions $N_l$ are symmetric homogeneous polynomials
    of individual degree at most $l \( M - 1 \)$ for $M gt.eq 1$, and
$ cal(J) = N N_2^(*) . $

 For $l = 1 \, 2$ and $X = \( u \, Z \)$ of size $M gt.eq 1$, their deletion values are
#[#set math.equation(numbering: n => "(3.1)")
 $ N_l \( 0 \, Z \) = (product_(z in Z) z^l) N_l \( Z \) \, wide \[ u^(l \( M - 1 \)) \] N_l \( u \, Z \) =
   N_l \( Z \) . $ <j:normalizer-deletion>]

 For $delta = 2 \, 3$ all three satisfy
#[#set math.equation(numbering: n => "(3.2)")
 $ N_l \( u \, q^delta u \, Z \) = N_l \( u \, q^delta u \) med product_(z in Z) ell_delta \( u \, z \)^l med
   N_l \( X_(upright("red")) \) \, wide X_(upright("red")) =
   cases(delim: "{", \( q u \, Z \) & delta = 2 \,, Z & delta = 3 .) $ <j:normalizer-fusion>]

 At two sites,
$ N \( u \, v \) = u + v \, wide N_2^(*) \( u \, v \) = u^2 + 2 \( 1 + sqrt(2) \) u v + v^2 . $

 Finally, $N$ and $N_2^(*)$ are nonzero at every homogeneous list $\( b \, dots.h \, b \)$ with $b eq.not 0$.]
] <j:scalar-normalizers>

#proof[
  We first remove the apparent poles. For $N$ and $N_2^(*)$ all $d$ denominators are cleared by $cal(P)$ or
    $cal(P)^2$. The remaining numerator vanishes on equal sites by alternating rows,
    or by alternating rows and columns, so it is divisible by the corresponding Vandermonde factors.
    The sign from a site interchange in the Pfaffian is canceled by that of $cal(P)$;
    the determinant has the corresponding row and column signs.
    For $cal(J)$, interchanging two paired blocks is an even permutation. Thus all three functions are symmetric.
  For $cal(J)$, fix a pair of sites $u \, v$ with $v = q^delta u$ and keep all other sites generic.
    In the skew kernel on the paired list $Y$, repeated rows and columns give a zero of order at least two at
    $delta = 0$ and at least one at $delta = plus.minus 1$. At $delta =
    2$ the only singular cross coupling is between $u \, q v$, so there is at most a simple Pfaffian pole.
    At $delta = 3$ there is at most a double pole, and the reflected cases have the same bounds.
    At $delta = 4$ the $2 times 2$ cross residue, up to a common scalar,
    has diagonal entries 1 and off-diagonal entries $- 1$. Its rank is one, so the potential double pole cancels.
    The factors in
  $ P_(*) \( u \, v \) =
    frac(\( v - q^4 u \) \( v - q^2 u \) \( v - q^6 u \) \( v - q^3 u \)^2 \( v - q^5 u \)^2, \( v - u \)^2 \( v -
    q u \) \( v - q^7 u \)) $
  clear these possible orders. These calculations are at generic points of each possible divisor.
    Unique factorization then removes every irreducible denominator;
    simultaneous intersections are included by this polynomial conclusion.
  Homogeneity follows from the displayed formulas, and the individual degree bounds follow by taking a variable to
    infinity. For the paired rows of $"Pf" S \( Y \)$ the cross rows have identical limits,
    so they decouple from the rest of the Pfaffian. The deletion rules for $N \,
    N_2^(*)$ follow in the same way at zero and infinity. The extra determinant index decouples.
    For the Pfaffian, place the varied variable first. Its row on the other sites has constant limit $-
    1$ at zero and $1$ at infinity. Without padding it becomes the padding row after reordering;
    with padding the two constant rows pair off since their mutual coupling is 1.
    The signs cancel those from $cal(P)$, giving (3.1).
  We next prove the reductions. For $cal(J)$ the leading pole at $delta = 3$ removes both pairs of site indices,
    while at $delta = 2$ the pole between $u \, q^3 u$ leaves $q u \, q^2 u$, the pair for the reduced site.
    The internal scalar is the two-site value. The remaining factors are
  $ P_(*) \( u \, z \) P_(*) \( q^3 u \, z \) = ell_3 \( u \, z \)^3 \, wide
    frac(P_(*) \( u \, z \) P_(*) \( q^2 u \, z \), P_(*) \( q u \, z \)) = ell_2 \( u \, z \)^3 . $
  For $delta = 3$, the $d$ pole and $cal(P)$ give the same reduction for the first two polynomials.
  For $N$ at $delta = 2$, first divide out $product_(z in Z) \( z - q^5 u \)$.
    At each $z = q^5 u$ the prefactor has two zeros, whereas the Pfaffian has at most one pole because the two
    singular entries share the index $z$. After division, compare the two sides as polynomials of degree at most
    $M - 2$ in one spectator $z$, inductively in $M$. The deletion rules give their values at zero and their top
    coefficients. At $z = q^(plus.minus 3) y$ for every other spectator $y$, the already proved $delta =
    3$ reduction and induction give equality, using
  $ frac(ell_3 \( y \, u \) ell_3 \( y \, q^2 u \), \( y - q^5 u \) \( q^3 y - q^5 u \)) = ell_3 \( y \, q u \) . $
  These evaluations suffice for $M gt.eq 3$; for $M = 2$ the formula is tautological.
  For $N_2^(*)$ at $delta = 2$, write its determinant kernel as
  $ K \( x \, y \) = \( 2 + sqrt(2) \) frac(chevron.l f \( x \) \, f \( y \) chevron.r, x^4 + y^4) \, wide
    f \( x \) = \( x \, x^2 \, x^3 \) \, quad chevron.l a \, b chevron.r = a_1 b_3 + a_3 b_1 - sqrt(2) a_2 b_2 . $
  The two vectors at $u \, q^2 u$ span the orthogonal complement of the nonisotropic vector at $q u$.
    Here $u^4 = \( q^2 u \)^4 = U$, while $\( q u \)^4 = - U$.
    Eliminate the first two rows and columns by a Schur complement.
    On their span, the subtracted scalar factor is $2 U \/ \[ \( x^4 + U \) \( y^4 + U \) \]$, and
  $ frac(1, x^4 + y^4) - frac(2 U, \( x^4 + U \) \( y^4 + U \)) = frac(r \( x \) r \( y \), x^4 + y^4) \, wide
    r \( x \) = frac(x^4 - U, x^4 + U) . $
  The orthogonal line is unchanged. Eliminating instead the single $q
    u$ in the reduced determinant leaves the complement unchanged and multiplies the line pairing by
    $1 \/ \( r \( x \) r \( y \) \)$. Thus multiplying each spectator row and column of that Schur matrix by $r$
    gives the first Schur matrix. Their determinants differ by $product r^2$, and inserting $cal(P)^2$ gives (3.2).
  The stated two-site formulas follow directly from the Pfaffian and determinant.
    Their product agrees with $cal(J)$: by symmetry and homogeneity it suffices to expand at $\( 1 \, v \)$
    through first order. Here $P_(*) \( 1 \, v \) = 1 + \( 3 + 3 sqrt(2) \) v + dots.h.c$, $S \( 1 \, v \) =
    1 \/ 2 + \( 1 - sqrt(2) \) v + dots.h.c$, and $S \( 1 \, q \) = - i \( 2 - sqrt(2) \) \/ 2$.
    The cross contractions $- S \( 1 \, v \) S \( q \, q v \) +
    S \( 1 \, q v \) S \( q \, v \)$ shift the linear coefficient by $- sqrt(2)$, giving the product.
    The one-site values are 1. Induction using the common reductions now proves $cal(J) = N N_2^(*)$:
    in one variable there are $4 \( M - 1 \)$ evaluations at $q^(plus.minus 2) \,
    q^(plus.minus 3)$ times the other variables, more than its degree $3 \( M - 1 \)$.
  Finally consider confluence at a nonzero homogeneous list.
    In log variables the Pfaffian kernel is $B \( t \) = sinh t \/ \( cosh t + cos beta \)$, with $beta =
    pi \/ 4$, and the determinant kernel is a positive multiple of $\( cosh t + cos beta \)^(- 1)$.
    Dividing the Vandermondes takes confluent row and column derivatives, up to nonzero constants.
    Lemma 5 gives the latter kernel a strictly positive Fourier density with all moments finite,
    so its derivative matrix is a nondegenerate Gram matrix. Applying $cos beta +
    sin beta thin partial_beta$ to that transform gives
  $ hat(B') \( k \) = frac(2 pi k cosh \( beta k \), sinh \( pi k \)) . $
  This is also a strictly positive even density. For even $M$,
    the cross matrix of even and odd derivative orders of $B$ is, up to row and column signs,
    its moment Gram matrix on even powers; the other entries vanish.
    For odd $M$ the padding pairs with derivative order zero and the remaining cross matrix has the same form with
    the positive weight multiplied by $k^2$. Both are nondegenerate. ◻
]

=== 3.4 The fixed vacuum lines <the-fixed-vacuum-lines>

We use widely separated site magnitudes to identify the fixed character and to locate the possible poles of its
  projection. The following description also records the common similarity needed when the sites of a scale are
  interspersed in the cyclic order.

#thm([Lemma 3.2.])[
  (Separated scales).  #emph[Let positive scales $rho_1 \, dots.h \, rho_r$ satisfy $rho_(k + 1) \/ rho_k arrow.r
    oo$, and suppose $x_i \/ rho_(k_i)$ tends to a finite nonzero limit. Choose consistent local square roots.
    Probe with $w \/ rho_j$ tending to a finite nonzero limit for which the active local matrices are regular.
    The limiting row matrices are triangular in the grading $sum_i k_i s_i$, with row grade at least column grade.
    Their diagonal grade blocks preserve every scale total $S_k =
    sum_(i : k_i = k) s_i$ and act on the active scale $j$ with effective twist
$ p_j = p q^(3 sum_(k eq.not j) "sgn" \( j - k \) S_k) . $

 Each block entry is the corresponding active-transfer entry multiplied by $F \( s^(upright("row")) \) \/
   F \( s^(upright("col")) \)$, using the same diagonal matrix for every probe and twist, where
$ F \( s \) = q^(\( 3 \/ 2 \) sum_(l < i) "sgn" \( k_l - k_i \) s_l s_i) \, $

 restricted to the block in question.]
] <j:separated-scales>

#proof[
  Let $Delta s_i = s_i^(upright("row")) - s_i^(upright("col"))$.
    At an inactive site on a smaller scale than $j$, the local limit gives $Delta s_i lt.eq 0$;
    on a larger scale it gives $Delta s_i gt.eq 0$. Total charge conservation gives
  $ Delta #h(-0.16667em) (sum_i k_i s_i) = sum_i \( k_i - j \) Delta s_i gt.eq 0 . $
  The inequality is strict if any inactive charge changes. Thus a diagonal grade block fixes the inactive spins
    and conserves the total on the active scale.
  At an inactive site the diagonal factor is $q^(3 "sgn" \( j - k_i \) h_i s_i)$,
    where the incoming horizontal spin is $h_i = h_0 +
    sum_(l < i) \( s_l^(upright("row")) - s_l^(upright("col")) \)$.
    The $h_0$ contribution changes the seam twist to $p_j$. For the remaining contribution all changes lie on the
    active scale and sum to zero. In the exponent of $F \( s^(upright("row")) \) \/ F \( s^(upright("col")) \)$,
    an inactive site receives equal contributions from the active sites before and after it,
    because those two charge changes have opposite sums. Their combined exponent is $3 "sgn" \( j - k_i \) s_i
    sum_(l < i) Delta s_l$, exactly the remaining local factor. This proves the stated common similarity. ◻
]

Take all scales to be singletons and probe at each singleton’s swap point.
  On a diagonal block its eigenvalue is $p_j^(S_j)$. If $S_j = plus.minus 1$,
  total charge zero implies $sum_(k eq.not j) "sgn" \( j - k \) S_k$ is odd.
  Since $p = q^2$ or $q^6$, the exponent of $q$ in $p_j$ is odd, and $p_j^(S_j) eq.not 1$.
  Only the all-empty block can have the simultaneous character, with multiplicity one.
  A generic linear combination of these finitely many probe deviations therefore has a simple zero eigenvalue in
  the limit and for sufficiently separated actual sites; zero is always an eigenvalue by the vacuum argument.
  Rationality in square-root coordinates proves generic simplicity, with no Jordan extension at the fixed character.

Consequently the generic projector has rank one. Set

$ L_p = chevron.l 0 \| Pi_p \, wide R_p = Pi_p \| 0 chevron.r . $

Vacuum normalization gives $Pi_p = R_p L_p$ and $L_p R_(p') = 1$ for both twists.
  We use $R_(+) = R_i$, $L_(-) = L_(- i)$ and the corresponding shorthand for the other two vectors.

===== 3.4.1 Homogeneous sites. <homogeneous-sites.>

At a list $\( b \, dots.h \, b \)$ with $b eq.not 0$, the determinant projector has a confluent form.
  The pole basis for $H_p$ consists of $C_5 \( w \, b \) \,
  C_6 \( w \, b \)$ and their $b$-derivatives through order $M - 1$;
  these are independent partial fractions with value zero at $w = 0$.
  Use identical rapidity branches near the common site. By Lemma 4,
  each quotient factor in the fusion monodromy is analytic and divisible by $w - b$.
  The product of the $M$ factors is therefore $O \( \( w - b \)^M \)$.
  Both row fusion identities, viewed as functions of the probe $w$, hold through derivatives of order $M - 1$ at $b$.

Apply these derivatives to the rows of $cal(L)$, differentiating $T_p \( w \)$ as well,
  and apply the corresponding derivatives to its pole columns.
  The resulting system annihilates the confluent pole coefficients.
  Its scalar determinant is the limit of $det cal(L) \( 1 \)$ after division by two row and two column
  Vandermondes. To see its value, put $Delta \( X \) = product_(j < k) \( x_j - x_k \)$.
  The product $P_(*) \( u \, v \) \( u - v \)^2$ is analytic and nonzero near $u = v = b eq.not 0$.
  Thus $det cal(L) \( 1 \) \/ Delta \( X \)^4$ is a nonvanishing analytic factor times $\( N N_2^(*) \)^2$,
  and is nonzero at the homogeneous list by Lemma 6. The same row and column divided differences in the numerator
  show that the determinant quotient is the ordinary limit of the generic $Pi_p$:
  all functions involved are jointly analytic near the differentiation points.
  The limit is a rank-one projector with vacuum normalization.
  At $X = \( 1 \, dots.h \, 1 \)$ its fixed vectors are therefore the physical limits $L_(-)^(upright("phys")) \,
  R_(+)^(upright("phys"))$ constructed above.

=== 3.5 Selected vacuum vectors and polynomial degrees <selected-vacuum-vectors-and-polynomial-degrees>

The projector denominator contains both $N$ and $N_2^(*)$.
  We now show that $N$ alone removes the poles of the particular column $R_i$ and row $L_(- i)$,
  after accounting for their square-root parity. This component statement will give the degree bound for the
  scalar pairing.

#thm([Lemma 3.3.])[
  (Selected vacuum vectors).  #emph[Let $M gt.eq 1$, let $X = \( x_1 \, dots.h \, x_M \)$ be generic and nonzero,
    and choose $t_j$ with $t_j^2 = x_j$. For $sigma in { - 1 \, 0 \, 1 }^M$ with $sum_j sigma_j = 0$,
    define from the vacuum-normalized vectors $R_i = Pi_i \| 0 chevron.r$ and $L_(- i) =
    chevron.l 0 \| Pi_(- i)$ the functions
$ V_sigma^R \( X \) = frac(N \( X \) \( R_i \)_sigma, product_j t_j^(sigma_j^2)) \, wide V_sigma^L \( X \) =
  frac(N \( X \) \( L_(- i) \)_sigma, product_j t_j^(sigma_j^2)) . $

 They are independent of the choices of square-root signs and extend to polynomials in
   $bb(C) \[ x_1 \, dots.h \, x_M \]$ satisfying
$ deg_(x_j) V_sigma^epsilon.alt lt.eq M - 1 - sigma_j^2 wide \( epsilon.alt = R \, L \) . $

 Write $X_(hat(j))$ and $hat(sigma)$ for deletion of coordinate $j$, and set $V_diameter^R = V_diameter^L = 1$.
   If $sigma_j = 0$, then for either superscript
$ V_sigma \( X \)\|_(x_j = 0) = (product_(k eq.not j) x_k) V_(hat(sigma)) \( X_(hat(j)) \) \,
  wide \[ x_j^(M - 1) \] V_sigma \( X \) = V_(hat(sigma)) \( X_(hat(j)) \) . $

]
] <j:selected-vacuum-vectors>

#proof[
  Site sign covariance gives $Pi_p \( - t_j \) = P_j Pi_p \( t_j \) P_j$.
    Since the empty vector has even vacancy parity,
  $ \( R_p \)_sigma \( - t_j \) = \( - 1 \)^(sigma_j^2) \( R_p \)_sigma \( t_j \) \,
    wide \( L_p \)_sigma \( - t_j \) = \( - 1 \)^(sigma_j^2) \( L_p \)_sigma \( t_j \) . $
  The determinant formula makes the functions in the statement rational in the $t_j$,
    and they are invariant under every sign change. The invariant rational field is
    $bb(C) \( t_1^2 \, dots.h \, t_M^2 \) = bb(C) \( X \)$, so they are rational in the ordinary variables.
  We locate their possible nonzero finite poles one variable at a time, with generic spectators.
    Fix all sites except $zeta$ on widely separated singleton scales.
    At a putative pole, suppose a regular linear combination of commuting probe deviations has a simple zero
    eigenvalue. Its eigenprojection agrees nearby with $Pi_p$, since it projects onto the same fixed line,
    and is regular there. Such a probe rules out a pole of every normalized row and column.
  If the varied site shares a scale with one spectator, the singleton tests in Lemma 7 require every other site to
    be empty in a diagonal block carrying the fixed character.
    The active pair then has total zero and original twist $p$.
    Write its coordinates in left-to-right order as $u \, v$ and put $z = u \/ v$.
    The probe $w = u$ is the twisted swap reduction $R \( phi.alt_u - phi.alt_v \)
    "diag" \( p^(s_(upright("first"))) \)$. Its neutral block has eigenvalues $1 \, a \, - a$, where
  $ a = q^3 frac(\( z - q^2 \) \( z - q^3 \), \( z - q^6 \) \( z - q^5 \)) . $
  Indeed it has eigenvalue 1 by the vacuum character, trace 1, and trace of its square $1 + 2 a^2$.
    In this pair block, normalize the right and left fixed vectors $r \, l$ at the state $\( 0 \, 0 \)$,
    and let their subscripts $+ \, -$ denote states $\( 1 \, - 1 \) \, \( - 1 \, 1 \)$. Direct multiplication gives
  $ r_(-) = i r_(+) \, wide l_(-) = i l_(+) \, wide r_(+) = frac(d_(upright("tile")) lambda, 1 - i a \/ p) \, wide
    l_(+) = frac(d_(upright("tile")) p \/ lambda, 1 - i a p) . $
  Here $d_(upright("tile"))$ is the local single-turn weight,
    a nonzero constant times $sqrt(z) \( z - 1 \) \/ \[ \( z - q^6 \) \( z - q^5 \) \]$,
    and is distinct from the quadratic $d \( u \, v \)$. These formulas also give $l r = 1$.
  At a pole of $a$, the reverse probe $w = v$ is regular and has $a \( 1 \/ z \) = 0$;
    moving the seam cyclically only conjugates the pair. Thus the fixed eigenvalue is simple there.
    If $D \( z \) = \( z - q^5 \) \( z - q^6 \)$, the remaining crossings are explicit:
  $ a - 1 = frac(\( q^3 - 1 \) \( z^2 - 1 \), D \( z \)) \, wide a + 1 =
    frac(\( q^3 + 1 \) \( z^2 + 2 \( 1 + sqrt(2) \) z + 1 \), D \( z \)) . $
  At $z = 1$ use identical rapidity branches and also probe at $w = q u$.
    On the two-dimensional 1-space of the twisted swap, this probe has trace $1 + v_(upright("tile"))^2 +
    a_(upright("tile"))^2 + b_(upright("tile"))^2$, with weights at $alpha$.
    Its polar diagonal entries are $v_(upright("tile"))^2$ and its polar cross entries are
    $\( b_(upright("tile"))^2 + a_(upright("tile"))^2 \) p^(plus.minus 1)$.
    One eigenvalue is 1 and the other is $v_(upright("tile"))^2 + a_(upright("tile"))^2 +
    b_(upright("tile"))^2 eq.not 1$. Joint simplicity therefore holds.
    All these pair calculations concern the diagonal block with empty spectators.
  To make the localization uniform, consider any sequence of generic spectator lists whose scale gaps tend to
    infinity and any associated putative poles $zeta eq.not 0 \, oo$.
    After a subsequence, $zeta$ is either on a separated singleton scale or in a pair whose ratio tends to a
    finite nonzero limit. The corresponding scale probes converge locally analytically in a square-root chart.
    In the singleton case and at every jointly simple pair ratio,
    a probe combination has a simple zero in the limit and hence for sufficiently large gaps.
    The only ratios left are $- 1$ and the two negative roots of $z^2 + 2 \( 1 + sqrt(2) \) z + 1$.
  Around one of these three ratios take a small complex $z$-disk and use the pair probe $w =
    u$ together with the spectator singleton probes. For generic constants set
  $ A \( z \) = sum_nu c_nu \( T_p \( w_nu \) - I \) \, wide d_A \( z \) =
    partial_rho det \( rho I - A \( z \) \)\|_(rho = 0) . $
  Here $d_A$ is a scalar derivative, unrelated to the insertion $D_A$.
    The singleton tests keep every block with a charged spectator invertible for $A$.
    In the remaining block the singleton probes are identity and the pair eigenvalues cross transversely by the
    displayed factorizations. Thus the limiting $d_A$ has a simple zero at the central ratio.
    Convergence on the boundary and the argument principle give exactly one zero counted with multiplicity for
    sufficiently large gaps, so any zero is unique and simple.
    Zero is an exact eigenvalue throughout; on the simple set its projector is
  $ Pi_p = frac("adj" \( - A \), d_A) . $
  The entire projector therefore has at most one simple pole in this disk.
  At either quadratic root, the pair formula for $L_i$ has denominator $1 + a$ and nonzero numerator.
    Its polarized component with all spectators empty converges uniformly on the disk boundary to $l_(+)$,
    with nonzero residue, because the limiting projection is simple there.
    Triangularity ensures this entry uses only the diagonal grade block, and $F = 1$ there.
    Its Cauchy integral is consequently nonzero for sufficiently large gaps, so $L_i$ has a pole inside the disk.
    Every vector pole is a projector pole because the vectors are its vacuum row and column.
    Since $Pi_i = R_i L_i$ has at most one simple pole, $R_i$ is analytic there:
    poles in both factors would give a nonzero double-pole outer product.
    For $p = - i$ it is $R_(- i)$ whose pair denominator is $1 + a$; the same argument proves analyticity of $L_(- i)$.
  Near $- 1$, $N_2^(*)$ is nonzero for sufficiently separated spectators.
    Its normalized determinant decouples into the pair and singleton diagonal entries,
    and its pair value at $\( u \, - u \)$ is $- 2 sqrt(2) thin u^2$.
    Away from exact shifted-site coincidences, the determinant criterion and $cal(J) =
    N N_2^(*)$ put every projector pole at a zero of $N$. At the sole shift in this disk, $v = - u$,
    retain the first row type of $cal(L)$ and the sum of its two row types,
    and multiply the first type for each of the two sites by $u + v$. The resulting matrix is analytic.
    The first type had at most a simple kernel pole; the sum is the rank-one inversion row,
    using only probes $x_j \, q^3 x_j$, which meet no local pole here, and $T_p \( x_j \)$ is regular.
    The factor $\( u + v \)^2$ in its scalar determinant exactly removes the Pfaffian denominator poles.
    The new scalar determinant is nonzero at the shift whenever $cal(J) eq.not 0$.
    Thus a pole here also requires a zero of $N$. As the projector has at most a simple pole,
    one factor $N$ clears every component of each selected vector.
  It remains to control zero and infinity in the varied coordinate.
    Keep the other sites generic on one scale and put $zeta$ on a separate singleton scale.
    The only block carrying the character has the singleton vacant and the other list in its generically simple
    fixed character. Choose enough probes to isolate this simple zero.
    In the coordinates $t = sqrt(zeta)$ near zero and $t^(- 1)$ near infinity,
    the original probe matrices are holomorphic by the local limits recorded above,
    including the moving singleton probe $w = zeta$. Their simple spectral projection,
    and hence its vacuum row and column, are holomorphic at the endpoint.
  These limiting probes preserve the singleton’s vacancy parity.
    If the singleton is inactive its only possible change is by 2; if it is active,
    all inactive changes are even and total charge conservation makes its change even as well.
    The sign covariance then gives the precise endpoint orders:
    a coordinate with $sigma_j = plus.minus 1$ is $O \( t \)$ at zero and $O \( t^(- 1) \)$ at infinity,
    whereas one with $sigma_j = 0$ is bounded. In the singleton-vacant diagonal block the similarity $F$ is 1 and
    the projection is exactly the reduced projection. Every coordinate with $sigma_j =
    0$ therefore tends to the corresponding reduced coordinate at both endpoints.
  For sufficiently separated generic spectators, these arguments clear all nonzero finite poles of
    $N \( R_i \)_sigma$ and $N \( L_(- i) \)_sigma$. Otherwise a sequence of counterexamples with growing scale
    gaps would contradict the simple-probe and disk analysis.
    After dividing by the displayed half powers, the endpoint orders give no pole at zero.
    At infinity, $deg_(x_j) N lt.eq M - 1$ gives degree at most $M - 1 - sigma_j^2$.
    The set of separated generic spectator values is Zariski dense.
    A relatively prime numerator and denominator in $x_j$ remain relatively prime for generic specializations of
    the spectators, so the one-variable conclusion holds over their coefficient field.
    Applying this to every $j$ removes every irreducible denominator and proves joint polynomiality.
    This last step includes simultaneous divisor intersections;
    the simple-pole analysis was only needed at generic divisor points.
    Finally the coordinate limits and (3.1) give the stated deletion values and top coefficients. ◻
]

At any nonzero site list with $N \( X \) eq.not 0$, this lemma gives componentwise continuation of $R_i$ and
  $L_(- i)$ through the polynomial formulas, including at simultaneous shifted-site coincidences.
  This is the continuation used later for tilted physical lists;
  the homogeneous determinant confluence above is a separate construction.

#thm([Corollary 3.4.])[
  (The scalar vacuum polynomial).  #emph[For two consecutive lists $A \, B$, allowing either to be empty,
    and $h eq.not 0$, put $cal(G) \( X \; A \, B \) = L_(-) D_A R_(+)$. Then
$ N \( X \)^2 cal(G) \( X \; A \, B \) = sum_(sigma in { - 1 \, 0 \, 1 }^M\
sum_j sigma_j = 0) \( i h \)^(sum_(j in A) sigma_j) (product_j x_j^(sigma_j^2)) V_sigma^L \( X \) V_sigma^R \( X \) . $

 The empty-list value is 1. For $M gt.eq 1$ it is a polynomial in $X$ with Laurent polynomial coefficients in $h$,
   of individual degree at most $2 \( M - 1 \)$. For a deleted site $j$, its value at $x_j =
   0$ is the reduced polynomial times $product_(k eq.not j) x_k^2$,
   and its coefficient of $x_j^(2 \( M - 1 \))$ is the reduced polynomial.
   Moreover $cal(G)$ itself tends to the reduced $cal(G)$ as $x_j arrow.r 0 \, oo$ with generic spectators.]
] <j:scalar-vacuum-polynomial>

#proof[
  Expand the diagonal insertion in the physical spin basis and apply Lemma 8.
    A summand has degree at most $2 \( M - 1 \) - sigma_j^2$ in $x_j$.
    Only $sigma_j = 0$ can contribute to the value at zero or to the stated top coefficient,
    and its two vector deletion rules give the claims. The normalized coordinate limits in the proof of the lemma
    give the last assertion, also when a group becomes empty. ◻
]

=== 3.6 Fusion of the scalar observable <fusion-of-the-scalar-observable>

The function $cal(G)$ is symmetric within each group. At generic sites the Yang–Baxter similarity interchanges
  adjacent site parameters, preserves charge on that pair, and works for both twists.
  It therefore commutes with $D_A$ for a same-group interchange.
  The fixed lines transform by this similarity; their normalization scalars cancel in $L_(-) D_A
  R_(+)$ because $L_(-) R_(+) = 1$ before and after the interchange.

For a same-group pair $u \, q^delta u$, $delta = 2 \, 3$,
  the function $cal(G)$ reduces to $cal(G) \( X_(upright("red")) \)$.
  By symmetry place $q^delta u$ immediately before $u$. Equation (2.1) then intertwines the full row with a row
  whose site is $q u$ for $delta = 2$, or with both sites removed for $delta = 3$.
  Full and reduced fixed lines are simple at generic points of this specialization:
  separate the other scales and use the active pair test, where $a \( q^delta \) = 0$.
  Thus the specialization is taken by regular eigenprojection.
  The full right vector is $J_delta$ applied to the reduced one,
  since the vacuum row of $J_delta$ extracts the vacuum. The full left vector restricts along $J_delta$ to the
  reduced left vector; its scalar is 1 by the overlap $L_(-) R_(+) = 1$.
  The insertion commutes through $J_delta$ because the pair lies in one group.
  These generic evaluations, together with (3.2), give exact fusion evaluations of the cleared scalar polynomial.

=== 3.7 Normalization on paired scales <normalization-on-paired-scales>

When the groups have equal size, the fusion and deletion evaluations leave one scalar coefficient undetermined.
  We determine it by putting one site of each group on each separated scale, with generic fixed ratios.
  A charged scale block cannot carry the character. For an odd pair total $S_j = plus.minus 1$,
  the product of the two regular site probes is $p_j^(S_j) eq.not 1$ by the parity test.
  Indeed the two transfers on active spaces 1,2 are $R_12 p_j^(s_1)$ and $p_j^(s_2) R_21$ at opposite differences,
  and unitarity gives the product. For $S_j = plus.minus 2$,
  the first probe gives $p_j^(plus.minus 1) a eq.not 1$ at a generic ratio.

There is consequently an isolated simple character in the product of neutral pair blocks,
  with the original twists. In the vacuum matrix element only its vacuum grade block contributes.
  The insertion $D_A$ is diagonal and commutes with the common diagonal similarity $F$.
  That similarity therefore cancels between the two projections, and its entry on the empty vector is 1.
  The result is a product of pair projections. For a pair whose first coordinate $u$ is in $A$ and second
  coordinate $v$ is in $B$, the formulas for $l \, r$ and the sine weights give

$ frac(d_(upright("tile"))^2, \( 1 - a \)^2) = \( 2 - sqrt(2) \) frac(u v, \( u + v \)^2) . $

Thus the paired-scale limit is

#[#set math.equation(numbering: n => "(3.3)")
 $ cal(G) med arrow.r med
   product_(upright("pairs")) (1 + \( 2 - sqrt(2) \) \( h + h^(- 1) \) frac(u v, \( u + v \)^2))
   $ <j:paired-vacuum-limit>]

(read at the limiting ratios).

=== 3.8 The scalar characterization <the-scalar-characterization>

Put $cal(F)_(A \, B) = N \( X \)^2 cal(G) \( X \; A \, B \)$, and write $e_k \( u \, v \) = v - q^k u$.
  In a deletion or fusion, the remaining coordinates keep their groups and cyclic order;
  a fused site belongs to the group of its two predecessors.

#thm([Lemma 3.5.])[
  (Scalar characterization).  #emph[The family $cal(F)_(A \, B)$ is the unique family in $bb(C) \( h \) \[ X \]$
    with the following properties. The empty-list value is 1.
    For $M = \| A \| + \| B \| gt.eq 1$, each polynomial is symmetric within the two groups and has individual
    degree at most $2 \( M - 1 \)$. Deleting a site $j$ gives
$ cal(F)_(A \, B)\|_(x_j = 0) = (product_(k eq.not j) x_k^2) cal(F)_(hat(j)) \,
  wide \[ x_j^(2 \( M - 1 \)) \] cal(F)_(A \, B) = cal(F)_(hat(j)) . $

 For two sites $u \, q^delta u$ in one group, $delta = 2 \, 3$, it satisfies
$ cal(F)_(A \, B) \( u \, q^delta u \, Z \) = \( u + q^delta u \)^2 (product_(z in Z) ell_delta \( u \, z \)^2)
  cal(F)_(upright("red")) \( X_(upright("red")) \) \, $

 with $X_(upright("red"))$ as in (3.2). When $\| A \| = \| B \|$,
   its quotient by $N^2$ has the paired-scale limit (3.3) at generic fixed pair ratios.]
] <j:scalar-characterization>

#proof[
  The preceding corollary, fusion argument and paired normalization show that $cal(F)_(A \, B)$ has these
    properties. For uniqueness, induct on $M$ and take the difference of two such families.
    If the larger group has size $n > M \/ 2$, vary one of its sites.
    Induction gives zeros at the $4 \( n - 1 \)$ fusion points $q^(plus.minus 2) \,
    q^(plus.minus 3)$ times the other sites of that same group and at zero.
    Its top coefficient also vanishes, so its degree is at most $2 M - 3$.
    Since $4 \( n - 1 \) + 1 > 2 M - 3$, the difference is zero.
  If the two groups have size $n$, then $M = 2 n$ and the vanished top coefficient reduces the degree in each
    variable to at most $2 M - 3$. The zero at the origin and the four zeros for each same-group partner give
    degree $1 + 4 \( n - 1 \) = 4 n - 3 = 2 M - 3$. Divisibility by these distinct linear factors therefore shows
    that the difference is a constant in the site variables times
  $ product_i x_i product_(upright("same-group pairs ") i \, j) e_2 \( x_i \, x_j \) e_3 \( x_i \, x_j \)
    e_5 \( x_i \, x_j \) e_6 \( x_i \, x_j \) . $
  To determine the constant, put matched coordinates $u_j \, v_j$ on successive increasing scales $rho_j$.
    At generic ratios,
  $ N \( X \) tilde.op product_j \( u_j + v_j \) product_(j < k) \( u_k v_k \)^2 . $
  Indeed group the pairs in the Pfaffian. Their two cross rows toward each external pair have identical limits,
    so the Pfaffian factors into its internal pair terms; $cal(P)$ supplies the displayed cross-scale powers.
    If the coefficient of the possible difference is nonzero, its quotient by $N^2$ has nonzero limit,
    that coefficient times $product_j u_j v_j \/ \( u_j + v_j \)^2$.
    The common paired-scale normalization forces that constant to vanish. ◻
]

=== 3.9 Finite spin sum <finite-spin-sum>

We now verify an explicit family with the properties of Lemma 10.
  Use indices $s \, t = - 1 \, 0 \, 1$ (symbols $- \, 0 \, +$ in tables), and let $kappa_(s t) in { - 1 \, 0 \,
  1 }$ be congruent to $s - t$ modulo 3. Define

$ p_(s t) \( u \, v \) = q^(- kappa_(s t)) P_(s t) \, wide p'_(s t) \( u \, v \) = q^(kappa_(s t)) P'_(s t) $

by the following products, listing ascending order; for descending use the swapped-index products with $k mapsto -
  k$ throughout.

$ \( s t \) & P & P'\
\( - - \) \, \( + + \) & e_2 e_3 e_5 e_6 & 1\
\( 00 \) & e_2 e_3 e_5 e_6 \/ \( e_1 e_7 \) & e_4^2\
\( - 0 \) \, \( 0 + \) & e_3 e_5 e_6 \/ e_0 & e_5^2\
\( - + \) & e_5 e_6 \/ \( e_0 e_1 \) & \( e_5 e_6 \)^2 $

Both phased products are symmetric under simultaneous swap of spins and arguments, since $e_k \( v \, u \) = -
  q^k e_(- k) \( u \, v \)$. Set $c = 2 - sqrt(2)$ and $d_(upright(a)) = i sqrt(c) \, med d_(upright(b)) = -
  i sqrt(c)$ on the two groups.

#thm([Theorem 3.6.])[
  (Finite spin sum).  #emph[For $h eq.not 0$ and the two-list vacuum observable at generic sites,
#[#set math.equation(numbering: n => "(3.4)")
 $ N \( X \)^2 cal(G) =  & sum_(\( s_i \)\
sum_(i in A) s_i = sum_(i in B) s_i = Q) h^Q product_i \( d_(sigma \( i \)) x_i \)^(s_i^2)\
 & wide dot.op product_(upright("same-group pairs ") i \, j) p_(s_i s_j) \( x_i \, x_j \)
   product_(upright("cross pairs ") i \, j) p'_(s_i s_j) \( x_i \, x_j \) \, $ <j:finite-spin-sum>]

 where $sigma \( i \) = upright(a) \, upright(b)$ indicates group and $Q$ ranges freely subject to the displayed
   equality. These auxiliary spins in group $B$ use the equal-sum convention.
   The combined expression is evaluated at same-group coincidences by its polynomial limit.]
] <j:finite-spin-formula>

#proof[
  We verify the properties in Lemma 10. Pair degrees in the same-group and cross factors are $2 + 2 s t$ and $2 -
    2 s t$. The charge constraint therefore gives termwise growth degree at most $2 \( M - 1 \) -
    s^2$ in a variable of spin $s$.
  Poles can occur only between same-group sites. At equal sites the sum is symmetric and has at most a simple
    pole, so its residue is zero. At $v = q u$ the two singular types are $\( - \, + \)$ and $\( 0 \, 0 \)$.
    Their spectator $P$ products agree, as do their spectator $P'$ products:
    shift the indices $k$ in the second site’s factors up by 1.
    The phased ratios for a spectator of spin $t$ are $q^(- 3 t)$ in the same group and $q^(3 t)$ in the other
    group; their total is 1 by the equal-sum constraint. The internal ratio of residues, including site factors, is
  $ - c thin frac(q - q^7, \( q - 1 \) \( q - q^2 \) \( q - q^3 \)) = - 1 . $
  The two residues cancel, and symmetry gives the reverse shift.
    These generic divisor cancellations remove all denominators of the sum.
    At zero and in the top coefficient only spin 0 survives. Its phases against the other sites cancel by the sum
    constraint, giving the reduced sum times $product_(j eq.not i)
    x_j^2$ at zero and the reduced sum in the top coefficient.
  At $v = q^delta u$ within a group the surviving terms fuse bijectively to reduced configurations.
    Write their spins as $a \, b$ and the reduced spin as $gamma$, with $*$ for a removed pair.
    For a spectator spin $t$ at $w$, divide its two couplings by the reduced coupling when there is one.
    The result is the monic factor $ell_delta \( u \, w \)^2$ times $q^(nu t)$ for a same-group spectator or
    $q^(- nu t)$ for a cross spectator. Divide the internal site and pair factors by the reduced site factor,
    when present, and by $\( u + q^delta u \)^2$; call the result $I$. The possibilities are
  $ delta & a & b & gamma & nu & I\
2 & - & 0 & - & 1 & q^(- 1)\
2 & 0 & + & + & 1 & q\
2 & - & + & 0 & - 2 & 1\
3 & - & + & * & - 1 & 1 $
  All other types have a zero $e_delta$. To check the spectator factors,
    add the index multisets for $\( a \, t \)$ and the $delta$-shifted multiset for $\( b \, t \)$,
    counting denominator multiplicities negatively. For $delta =
    2$ subtract the 1-shifted multiset for $\( gamma \, t \)$.
    The remaining indices are $2 \[ 5 \]$ or $2 \[ 5 \] + 2 \[ 6 \]$, respectively,
    and the $kappa$ differences give the displayed phases. Internally,
  $ p_(- 0) \( 1 \, q^2 \) = p_(0 +) \( 1 \, q^2 \) = \( 1 + q^2 \)^2 \, quad p_(- +) \( 1 \, q^2 \) = - 2 \/ c \,
    quad p_(- +) \( 1 \, q^3 \) = - 1 \, $
  using $\( q - 1 \)^2 = - c q$. The spectator phases and $I$ cancel by the charge constraint,
    and $Q$ is unchanged. This is the required fusion multiplier.
  It remains to check the paired-scale normalization. For a term with spins $s_j \,
    t_j$ on matched coordinates $u_j \, v_j$, put $H_j = sum_(k lt.eq j) \( s_k - t_k \)$, so $H_0 = H_n = 0$.
    Its net scaling after division by $N^2$ is
  $ product_j rho_j^(H_j^2 - H_(j - 1)^2) = product_(j < n) (rho_j / rho_(j + 1))^(H_j^2) . $
  It vanishes unless every $s_j = t_j$. In that case the cross-scale phases cancel,
    as do the monomials against the asymptotic for $N^2$ in the characterization proof.
    Inside a pair the neutral numerator is $\( u_j + v_j \)^2$,
    and the two polarized numerators are $c u_j v_j h^(plus.minus 1)$. The resulting product is (3.3).
    The empty-list sum is 1, so all properties of Lemma 10 hold and the formula follows.
    At the physical homogeneous point its quotient by $N^2$ is $G_(A \, B)$ by the homogeneous projector
    identification. ◻
]

== 4 Contour currents and angular transfer <c7:contour>

The finite spin formula is regular at equal site coordinates, although its individual terms have poles there.
  We first replace the combined homogeneous value by a periodic Pfaffian contour expression.
  For each fixed number of sites, its limit as the period tends to infinity recovers the finite spin formula.
  We then identify the periodic expression, conditional on its Gaussian fields,
  with a fermionic trace propagating in the imaginary direction.
  Section 5 evaluates that trace, and Section 6 supplies the absolute estimate needed to integrate its reorganized
  series.

Use balanced groups of size $m$ each, with $m in bb(N)_0$.
  Write $eta = pi \/ 4 \, med p_0 = 2 + sqrt(2) \, med c = 2 - sqrt(2)$, and put $z = e^(i theta)$ and $h =
  z^(- 2)$ for $theta in bb(C)$. The logarithmic site coordinates are $x_j = exp \( eta w_j \)$.
  Normalize (3.4) by its all-zero-spin term. Its value at homogeneous rapidities $w_j = 0$ is

$ P_0 = p_0^(- 2 m) \( 4 p_0^2 \)^(m^2) . $

=== 4.1 Defects and their pair kernels <defects-and-their-pair-kernels>

We split the factors between nonzero spins into a Schur Pfaffian and a Gaussian quadratic form.
  The accompanying one-site factor will provide the poles whose residues select the sites carrying nonzero spins.

First let both groups have the same generic distinct real coordinates $\( w_i \)_(i = 1)^m$.
  Regard nonzero spin as a defect labeled $delta = - s = plus.minus 1$ with centered argument $v_i = w_i +
  i delta \/ 2$ (in shifts $i$ denotes the imaginary unit). Define

$ V_(-) \( w \) & = frac(e_1 e_7 e_3^2, e_0 e_6 e_4^2) \, wide V_(+) \( w \) =
  frac(e_1 e_7 e_5^2, e_0 e_2 e_4^2) = frac(1, V_(-) \( w + i \)) \, wide e_k = 1 - q^k e^(eta w) \,\
L \( d \) & = frac(\( y - x \)^2 \( y^2 + x^2 \), x y \( y^2 - sqrt(2) x y + x^2 \)) \, wide J \( d \) =
  frac(x y \( y + x \)^2, \( y^2 + sqrt(2) x y + x^2 \)^2) \, wide y \/ x = e^(eta d) . $

Then the normalized sum uses one factor

$ z^delta thin frac(p_0 sqrt(c), 4) product_(l eq.not i) V_delta \( w_i - w_l \) $

per defect and pair factors $L \( v_j - v_i \)^(delta_i delta_j)$ for the same group (species),
  $J \( v_j - v_i \)^(delta_i delta_j)$ across species, subject to equal total $delta$.

Indeed remove powers $\( x y \)^(s t)$ from same-group pairs of the table, $\( x y \)^(- s t)$ across,
  and $x^(s^2)$ per site (total 1). For $s = +$ against two matched zeros the same-group ratio to baseline is
  $q^(- 1) e_1 e_7 \/ \( e_0 e_6 \)$ and the cross ratio $q e_3^2 \/ e_4^2$; for $s = -$ reflect $q$.
  At its own matched coordinate only the second contributes ($p_0 \/ 4$).
  Dividing the two-defect ratio by the two corresponding one-defect ratios gives $\( delta_i delta_j \)
  L \( v_j - v_i \)^(delta_i delta_j)$ or $\( delta_i delta_j \)
  J \( v_j - v_i \)^(delta_i delta_j)$ from the pair table (the argument shift multiplies $y \/
  x$ by $q^(\( s_i - s_j \) \/ 2)$). Total defect number is even,
  so the signs multiply to $\( - 1 \)^(n_(-))$ with $n_(-)$ counting negative $delta$.
  This cancels the site phase $i^(n_(upright(a)) - n_(upright(b)))$ ($n_(upright(a)) \,
  n_(upright(b))$ the defect counts per group) by equal total charges.

Introduce

$ a_(*) = pi \/ 6 \, quad C \( s \) = tanh \( a_(*) s \) \,\
R^0 \( s \) = C \( s \)^2 \/ \[ C \( s + i \) C \( s - i \) \] \,\
G_d \( s \) = log \( R^0 \( s \) \/ L \( s \) \) \, quad G_c \( s \) = - log J \( s \) . $

Take the real logarithms on the real line, with the limiting value at $s = 0$,
  and then their analytic continuations. The matrix kernel $G$ has diagonal $G_d$ and off-diagonal $G_c$,
  with $G_d \( 0 \) = - log A_(*)$, $A_(*) = 3 \/ \( 2 c \)$.
  At infinity $G_d \( s \) + eta \| s \| \, med G_c \( s \) - eta \| s \|$ decay exponentially.
  In Fourier notation $hat(f) \( k \) = integral e^(- i k v) f \( v \) thin d v$, the transforms of $G_d \,
  G_c$ themselves at $k eq.not 0$, in units of $2 pi \/ k$, are

$ g_d = frac(cosh 4 k + cosh 2 k - cosh 3 k, sinh 4 k) - frac(cosh 3 k - cosh 2 k + cosh k - 1, sinh 3 k) \, wide
  g_c = frac(1 - 2 cosh k, sinh 4 k) . $

The difference channel is used as covariance only with neutral tests.
  For instance $log \[ 2 \( cosh \( eta v \) - cos \( eta b \) \) \]$, $0 lt.eq b lt.eq 4$,
  gives $- \( 2 pi \/ k \) cosh \( \( 4 - b \) k \) \/ sinh \( 4 k \)$ off zero,
  by expanding the log after subtracting $eta \| v \|$ (sum of rational transforms is the elementary cosine series
  of $cosh \( \( 4 - b \) k \)$ on $0 lt.eq b lt.eq 4$). The same rule at period 6 gives the terms of $log
  R^0$ using absolute values paired for conjugates. Constants at infinity fix transforms of integrable
  combinations; a residual linear $\| v \|$ part uses the usual neutral kernel by integrating
  $\( 1 - cos \( k v \) \) \/ k^2$. The covariance is positive in both channels; for $k > 0 \, med t = e^(- k)$,

$ g_d + g_c = frac(t^4 \( 1 - t \), \( 1 + t \) \( 1 + t^2 \) \( 1 + t^4 \) \( 1 - t + t^2 \)) \, wide g_c < 0 . $

Write $hat(G)_plus.minus = hat(G)_d plus.minus hat(G)_c$. The same formulas give

#[#set math.equation(numbering: n => "(4.1)")
 $ hat(G)_(+) \( k \) & = pi \/ 4 + O \( k^2 \) \, & hat(G)_(-) \( k \) & = pi \/ k^2 +
   O \( 1 \) &  & \( k arrow.r 0 \) \,\
hat(G)_(+) \( k \) & = O \( e^(- 4 \| k \|) \/ \| k \| \) \, & hat(G)_(-) \( k \) & =
  O \( e^(- 3 \| k \|) \/ \| k \| \) &  & \( \| k \| arrow.r oo \) . $ <c7:gaussian-symbol-bounds>]

Thus the common channel has the ordinary value $hat(G)_(+) \( 0 \) = pi \/ 4$,
  whereas the difference channel is applied to tests of total mass zero.
  The neutral formulas continue analytically for differences of arguments in $\| Im s \| < 3$.

For $k eq.not 0$, define multipliers

$ E \( k \) = frac(cosh \( 3 k \/ 2 \), 2 sinh \( k \/ 2 \) cosh k) \, wide D \( k \) = frac(k, 2 pi) E \( k \) \, $

and decaying functions $a \, lambda_0$ by odd real transforms, at $k > 0$ given by

$ hat(a) \( k \) = frac(2 pi, k) frac(t^(1 \/ 2) \( 1 - t \) \( 1 - t^4 \), \( 1 + t^3 \)^2) \, wide
  hat(lambda)_0 = D hat(a) = frac(sinh k, cosh \( 3 k \/ 2 \)) . $

Both transforms have value zero at $k = 0$. In particular $a$ and $lambda_0$ are purely imaginary on the real
  line. Define

$ U_delta \( w \) =
  V_delta \( w \) exp #h(-0.16667em) (delta \[ \( G_d + G_c \) * lambda_0 \] \( w + i delta \/ 2 \)) . $

We claim that, for $\| Im v \| < 1 \/ 2$,

$ U_(-) \( v + i \/ 2 \) = e^(a \( v \)) \, wide U_(+) \( v - i \/ 2 \) = e^(- a \( v \)) . $

For the first identity, note that $log V_(-) \( v + i \/ 2 \)$ is decaying with zero winding near the real $v$
  line: factors $1 - e^(eta \( v + i b \))$ at $0 < b < 8$ have phase change $eta b - pi$,
  and the signed multiplicities at $1.5 \, 7.5 \, 3.5 \, 0.5 \, 6.5 \,
  4.5$ are respectively $\( 1 \, 1 \, 2 \, - 1 \, - 1 \, - 2 \)$, balanced also in the sums of $b$.
  In fact if a sum of such logs (plus a constant) has multiplicities $n_b$ with $sum n_b = 0$,
  its derivative decays exponentially at both horizontal infinities and is $8
  i$-periodic with residues $n_b$ at $- i b$ modulo period.
  Shifting the derivative transform down by $8 i$ (positive $k$) thus gives the log transform $- \( 2 pi \/ k \)
  sum_b n_b t^b \/ \( 1 - t^8 \)$ there. This off-zero calculation also applies for bounded logs with step limits
  by taking the transform via differentiation. For our decaying log it gives the expression $\( 2 pi \/ k \)
  t^(1 \/ 2) \( 1 - t \) \( 1 - t^3 \)^2 \/ \( 1 - t^8 \)$ (extended oddly).
  This equals $\( 1 + D \( hat(G)_d + hat(G)_c \) \) hat(a)$.
  The Fourier bounds give the stated strip continuation, and $V_(+) \( w \) =
  V_(-) \( w + i \)^(- 1)$ gives the second identity. In particular $U_(+) \( w \) =
  U_(-) \( w + i \)^(- 1)$ meromorphically. The decays and strip continuations also follow by shifting Fourier
  integrals; the convolution in $U$ continues well beyond $\| Im \| < 2$.

=== 4.2 A fixed-site periodic Pfaffian <a-fixed-site-periodic-pfaffian>

Fix a horizontal period $T > 0$. For a decaying function, subscript $T$ denotes the sum over translates by $T$;
  for a meromorphic function tending to $1$ exponentially at both horizontal infinities,
  it denotes the product over those translates. These sums and products converge locally uniformly on the strips
  used below, away from their stated poles. An integral $integral_T d
  x$ is over one full period and is unnormalized. For $k = 2 pi n \/ T$,
  the coefficient of $e^(i k x)$ in a periodized decaying function is $hat(f) \( k \) \/ T$.

Let $P_plus.minus$ be the orthogonal projections on the spans of $\( 1 \, 1 \)^t$ and $\( 1 \, - 1 \)^t$.
  Take centered real Gaussian oscillators

$ chi_sigma \( v \) = sum_(k = 2 pi n \/ T eq.not 0) chi_(sigma \, k) e^(i k v) \, wide chi_(sigma \, - k) =
  overline(chi_(sigma \, k)) \, $

whose covariance between the coefficients at $k \, - k$ is $hat(G) \( k \) \/ T$,
  and whose other mode covariances vanish. Positivity follows from the two channels above. By (4.1),

$ bb(E) sum_(k eq.not 0) \| chi_(sigma \, k) \| e^(rho \| k \|) < oo wide \( 0 lt.eq rho < 3 \/ 2 \) . $

Consequently these series are almost surely analytic on $\| Im v \| < 3 \/ 2$,
  with absolute convergence on every smaller closed strip.

Choose a centered common Gaussian vector with covariance $hat(G)_(+) \( 0 \) P_(+) \/
  T$ and a uniform vector $\( t_0 \, - t_0 \)$ with $0 lt.eq t_0 < 2 pi$,
  independently of each other and of $chi$. Their sum is denoted by $\( phi_01 \, phi_02 \)$.
  Independently of all preceding variables, choose

$ bold(ell) = \( ell_1 \, ell_2 \) = \( j \, - j \) \, quad j in 8 bb(Z) \, wide bb(P) \( j \) =
  D_ell^(- 1) e^(- 4 pi j^2 \/ T) \, quad D_ell = sum_(j in 8 bb(Z)) e^(- 4 pi j^2 \/ T) \, $

and set

$ phi_sigma \( v \) = phi_(0 sigma) + \( 2 pi \/ T \) ell_sigma v + chi_sigma \( v \) . $

We write $phi \( v \) = \( phi_1 \( v \) \, phi_2 \( v \) \)^t$.

For each species use a Wick expectation: the expectation of an ordered list of an even number of fields is the
  Pfaffian of their two-point entries, and odd expectations are zero. Its two-point function is

$ chevron.l psi \( u \) psi \( v \) chevron.r_T = C^(\[ T \]) \( v - u \) \, wide C^(\[ T \]) \( d \) =
  sum_(n in bb(Z)) frac(pi, a_(*) T sin \( pi \( d + 3 i + 6 i n \) \/ T \)) . $

For fixed $T$ the image series converges locally uniformly away from its poles.
  It is odd, $6 i$-periodic, horizontally antiperiodic, and has residue $1 \/ a_(*)$ at $3 i$.

To define the contour expression also at coalescing sites, choose

$ 0 < r < min { 1 \/ 8 \, T \/ 8 } \, wide \| w_l \| < r \/ 4 quad \( 1 lt.eq l lt.eq m \) \, $

initially with distinct real $w_l$, and let $gamma_r$ be the positive circle $\| w \| = r$.
  Put $W = \( w_1 \, dots.h \, w_m \)$ and

$ Lambda_W \( x \) = sum_(l = 1)^m lambda_(0 \, T) \( x - w_l \) . $

Define, at first as its Wick expansion,

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(C)_(sigma \, T) \( W \) = ⟨exp
   (a_(*) sum_(delta = plus.minus 1) integral.cont_(gamma_r) frac(d w, 2 pi i) \( - z^delta \) e^(i delta
   phi_sigma \( w + i delta \/ 2 \)) product_(l = 1)^m U_(delta \, T) \( w - w_l \) thin psi \( w + 3 i \) psi \(
   w + i delta \))⟩_T . $ <c7:contour-current>]

The same list $W$ is used for both species. The normalized expression is

#[#set math.equation(numbering: n => "(4.3)")
 $ frak(C)_T \( W \; theta \) =
   frac(bb(E) #h(-0.16667em)
   [e^(i integral_T Lambda_W \( x \) \( chi_1 + chi_2 \) \( x \) thin d x) cal(C)_(1 \, T) \( W \) cal(C)_(2 \,
   T) \( W \)], bb(E) e^(i integral_T Lambda_W \( x \) \( chi_1 + chi_2 \) \( x \) thin d x)) .
   $ <c7:regulated-contour>]

At $W = 0^m = \( 0 \, dots.h \, 0 \)$ write $cal(C)_sigma = cal(C)_(sigma \, T) \( 0^m \)$ and $frak(C)_(m \, T) =
  frak(C)_T \( 0^m \; theta \)$. For comparison with the finite formula put

$ x_l = e^(eta w_l) \, wide X \( W \) = \( x_1 \, dots.h \, x_m \, x_1 \, dots.h \, x_m \) \, wide P_0 \( W \) =
  product_(i < j) p_00 \( x_i \, x_j \)^2 product_(i \, j) p'_00 \( x_i \, x_j \) . $

This is the all-zero term for the matched list. The displayed domain avoids its zeros and poles,
  and its value at $W = 0^m$ is $P_0$. The first and second copies in $X \( W \)$ belong to $A$ and $B$, respectively.

#thm([Proposition 4.1.])[
  (Fixed-site regulated Pfaffian).  #emph[For every fixed $T > 0$, $m in bb(N)_0$, and $theta in bb(C)$,
    on the full-probability event of analytic samples described above,
    the Wick expansion in (4.2) terminates after order $m$ in each species.
    Its value is independent of the admissible circle enclosing $W$,
    and its contour coefficients extend holomorphically to the coalescing lists $\| w_l \| < r \/ 4$.
    The average (4.3) is holomorphic there and its denominator is nonzero. In particular $frak(C)_(0 \, T) = 1$.]
  #emph[For fixed $m gt.eq 1$ and $theta in bb(C)$,
#[#set math.equation(numbering: n => "(4.4)")
 $ lim_(T arrow.r oo) frak(C)_(m \, T) = frac(N \( 1 \, dots.h \, 1 \)^2, P_0) thin
   G_(A \, B) \( h + h^(- 1) \) \, wide \| A \| = \| B \| = m . $ <c7:regulated-limit>]

 This limit is locally uniform in $theta$.]
] <c7:regulated-pfaffian>

#proof[
  For any distinct complex list with $\| w_l \| < r \/ 4$, the only poles of each current variable inside
    $gamma_r$ are the simple site poles. The Pfaffian is analytic there in all current variables:
    its nearest inter-current poles require an imaginary difference $plus.minus
    1$ between the unshifted variables, whereas their differences in this disk have imaginary part less than $2
    r < 1$. If two residues in the same species select the same site,
    their first fields $psi \( w + 3 i \)$ coincide, so the Pfaffian vanishes.
    Thus at most $m$ currents occur in each species. Cauchy’s theorem applied to each coefficient also shows
    independence of the admissible circle. On $gamma_r$ every coefficient is holomorphic in the $w_l$ for $\|
    w_l \| < r \/ 4$. The coefficients of higher orders vanish there by continuity from distinct lists,
    proving termination at confluence as well. If $m = 0$, there are no enclosed site poles and $cal(C)_sigma = 1$.
  We next compute the Gaussian factor of any one of these finitely many terms.
    If its current variables are $omega_a in gamma_r$, let $v_a = omega_a + i delta_a \/ 2$ and set
  $ q_a = delta_a e_(sigma_a) \, quad Q \( k \) = sum_a q_a e^(- i k v_a) \, quad Q_0 = Q \( 0 \) \, quad V_Q =
    sum_a q_a v_a \, quad upright(bold(1)) = \( 1 \, 1 \)^t \, quad upright(bold(e))_(-) = \( 1 \, - 1 \)^t \, $
  where $e_1 \, e_2$ are the species basis vectors. The Fourier transform of the source is
  $ S_W \( k \) = hat(lambda)_0 \( k \) sum_l e^(- i k w_l) upright(bold(1)) . $
  For $k = 2 pi n \/ T eq.not 0$, the exact ratio, including the constant and winding modes, is
  #[#set math.equation(numbering: n => "(4.5)")
   $ & frac(bb(E) exp #h(-0.16667em) (i integral_T Lambda_W \( chi_1 + chi_2 \) + i sum_a q_a^t phi \( v_a \)),
     bb(E) exp #h(-0.16667em) (i integral_T Lambda_W \( chi_1 + chi_2 \)))\
 & quad = exp #h(-0.16667em) {- frac(1, 2 T) sum_(k eq.not 0)
   [Q \( - k \)^t hat(G) \( k \) Q \( k \) + 2 S_W \( - k \)^t hat(G) \( k \) Q \( k \)]}\
 & wide quad  times upright(bold(1))_({ \( Q_0 \)_1 = \( Q_0 \)_2 }) thin exp #h(-0.16667em)
   [- frac(hat(G)_(+) \( 0 \), 2 T) Q_0^t P_(+) Q_0] 1 / D_ell sum_(j in 8 bb(Z))
   e^(- 4 pi j^2 \/ T + \( 2 pi i j \/ T \) upright(bold(e))_(-)^t V_Q) . $ <c7:gaussian-coefficient>]
  All pairings in this formula are bilinear, without complex conjugation.
    The uniform mode gives the charge constraint exactly at each $T$.
    The oscillator part is the elementary centered Gaussian exponential identity,
    first on finitely many modes and then in the limit. Its denominator is
  $ exp #h(-0.16667em) [- frac(1, 2 T) sum_(k eq.not 0) S_W \( - k \)^t hat(G) \( k \) S_W \( k \)] \, $
  which is nonzero; for real $W$ it is positive. The covariance sums converge absolutely,
    since $\| Im v_a \| lt.eq 1 \/ 2 + r < 3 \/ 2$, while $hat(lambda)_0 \( k \) =
    O \( e^(- \| k \| \/ 2) \)$ and $\| Im w_l \| < r \/ 4$ control the source.
    Together with (4.1), these estimates give an exponential margin and finite exponential moments uniformly on
    the compact contours for each fixed $T$. They also make the coefficient sums holomorphic in $W$.
    The winding sum is dominated by $e^(- 4 pi j^2 \/ T + C \| j \| \/ T)$.
    Thus the Gaussian and contour integrations in the finite expansion are justified.
  The cross term with $S_W$ in (4.5) is
  $ - sum_a delta_a sum_l \[ \( G_d + G_c \) * lambda_0 \]_T \( v_a - w_l \) . $
  The zero Fourier coefficient of $lambda_0$ vanishes, so the periodized convolution here is exactly the periodic
    convolution arising from the source. The definition of $U_delta$ and the normally convergent periodized
    products therefore show that this cross term converts every $U_(delta \, T)$ factor to $V_(delta \, T)$
    already at finite $T$.
  It remains to take the limit of the combined quadratic in (4.5).
    On the terms surviving the uniform mode, $P_(-) Q \( 0 \) = 0$, and hence $P_(-) Q \( k \) =
    O \( k \)$ uniformly on the contours. This cancels the $k^(- 2)$ singularity of $hat(G)_(-)$ inside the
    complete quadratic. The common channel is regular at zero.
    At high frequency the pairwise imaginary differences have absolute value at most $1 + 2 r < 3$.
    Consequently the Riemann sums converge uniformly to the neutral Fourier integral, giving
  #[#set math.equation(numbering: n => "(4.6)")
   $ 1 / T sum_(k eq.not 0) Q \( - k \)^t hat(G) \( k \) Q \( k \) arrow.r
     sum_(a \, b) q_a^t G \( v_b - v_a \) q_b . $ <c7:neutral-limit>]
  Here the common channel uses its ordinary Fourier inverse,
    and the difference channel uses its zero-total-mass interpretation described above.
    Combining the quadratic before the limit is essential: the periodic difference-channel variance at a single
    point grows as $pi T \/ 12$. Formula (4.6), rather than separate limits of its discrete self and pair terms,
    permits the self and pair decomposition of the limiting $G$ form.
  The constant Gaussian factor in (4.5) tends to $1$. The winding factor does as well,
    uniformly for bounded $V_Q$: its distribution has $bb(E) \| j \| =
    O \( sqrt(T) \)$ and each fixed exponential moment of $\| j \| \/ sqrt(T)$ is bounded as $T$ grows.
    The periodized scalar factors tend locally uniformly to their unperiodized versions.
    For the fermion kernel, pair the image terms with imaginary shifts $plus.minus \( 3 + 6 n \) i$.
    The sine derivative bound gives a uniform $O \( \( n + 1 \)^(- 2) \)$ bound on each paired term for $d$ in a
    compact set off the poles. Termwise limits and the elementary partial fractions of $tanh$ give
    $C^(\[ T \]) \( d \) arrow.r C \( d \)$ there.
  The limiting Wick Pfaffian has the Schur product form
  $ ⟨psi \( u_1 \) dots.h.c psi \( u_(2 s) \)⟩ = product_(a < b) C \( u_b - u_a \) . $
  Indeed, after $y_a = e^(2 a_(*) u_a)$, its kernel is $\( y_b - y_a \) \/ \( y_b + y_a \)$.
    Alternating Vandermonde divisibility and induction at a pairing pole prove that its Pfaffian is the full pair
    product. Within a current the product gives $C \( i delta - 3 i \) = 1 \/ C \( i delta \)$.
    Between two currents it gives $R^0 \( v_b - v_a \)^(delta_a delta_b)$.
    In the representation (4.6), each self term gives $exp \( - G_d \( 0 \) \/ 2 \) = sqrt(A_(*))$,
    and the pair terms change these factors to $L^(delta_a delta_b)$ within a species and $J^(delta_a delta_b)$
    across species. Finally
  $ C \( i delta \) = i delta \/ sqrt(3) \, wide - a_(*) "Res"_(w = 0) V_delta \( w \)
    frac(sqrt(A_(*)), C \( i delta \)) = frac(1, 2 sqrt(c)) = frac(p_0 sqrt(c), 4) \, $
  using $"Res"_0 V_delta = - i delta sqrt(2) \/ \( 4 eta \)$ and $c p_0 = 2$.
    For distinct sites these are exactly the one-defect and pair factors derived from the finite spin sum.
  For the confluence to the homogeneous value, keep one fixed circle $gamma_r$ with $0 < r < 1 \/ 8$,
    let $\| w_l \| lt.eq r \/ 8$, and take $T > 8 r$ to infinity.
    All the covariance, image, and scalar convergence just used is uniform on this circle and polydisk.
    These local estimates permit the limiting contour expression to be evaluated at $W = 0^m$.
    At distinct real $W$ the residue calculation identifies it with the normalized finite spin expression.
    By Section 3, the numerator $N \( X \( W \) \)^2 cal(G) \( X \( W \) \; A \, B \)$ has a polynomial
    continuation and $P_0 \( W \)$ is nonzero here. Holomorphic uniqueness in the auxiliary coordinates therefore
    identifies the value at $W = 0^m$, giving (4.4). Compact sets of $theta$ cause only bounded factors in this
    finite expansion, proving the stated local uniformity. ◻
]

The proposition takes the infinite-period limit at fixed $m$,
  before introducing any infinite expansion of trace operators.
  The identities in the rest of this section hold for each fixed $T > 0$.
  Their use as an absolutely integrated horizontal gas will require the later stability estimate,
  which is needed only for sufficiently large integer block periods.

=== 4.3 A conditional angular trace <a-conditional-angular-trace>

We now fix $T > 0$, $m$, $theta$, and one analytic sample of the fields, and use homogeneous sites.
  The contraction rule is the normal-ordering principle of Wick [17];
  here we compute its periodic covariance and trace realization. Suppress the species index.
  Fold the imaginary coordinate into six sheets, indexed cyclically by $j = 1 \, dots.h \, 6$, and write $j^(*) =
  j + 3$. On the fermionic exterior space take

$ { Psi_(j \, r) \, Psi_(l \, s) } = delta_(j^(*) \, l) delta_(r \, - s) \, wide Psi_(j \, r)^(*) =
  Psi_(j^(*) \, - r) \, wide r \, s in 1 / 2 + bb(Z) \, wide Psi_j \( v \) = sum_r Psi_(j \, r) y^(- r) \, quad
  y = e^(2 pi i v \/ T) . $

The modes with $r > 0$ annihilate the vacuum. Let $L_0$ be total creation energy, let $upright(bold(q)) =
  e^(- 2 pi \/ T)$, and let $cal(U)$ fix the vacuum and send $Psi_j$ to $- Psi_(j - 1)$ under conjugation.
  Put $Gamma = upright(bold(q))^(L_0) cal(U)$.

For the off-diagonal roots below define

$ X_(b c) \( f \) = - sum_(n in bb(Z)) f_n sum_(r + s = n) Psi_(b^(*) \, r) Psi_(c \, s) = -
  integral_T frac(d v, T) thin f \( v \) Psi_(b^(*)) \( v \) Psi_c \( v \) \, wide J_(b c) = upright(e)_(b c) -
  upright(e)_(c^(*) b^(*)) \, $

where $f \( v \) = sum_n f_n y^n$ is analytic and periodic and the integral means its modewise Fourier integral.
  We only use $b in.not { c \, c^(*) }$. The notation $X_(b c) \( f \; gamma \)$ uses a shifted horizontal line
  $gamma$; it gives the same Fourier integral when $f$ is analytic between the lines.
  As a formal mode series, the commutator of $X_(b c) \( f \)$ with the column of fields is $f
  J_(b c)$ times that column. Thus the matrices of conjugations multiply in the reverse order from the operators.

For the fixed sample set

$ b \( v \) = z^(- 1) e^(- i phi \( v \)) \[ U_(- \, T) \( v + i \/ 2 \) \]^m \, wide b_plus.minus \( v \) =
  b \( v plus.minus i \) . $

This function is periodic, since $ell in 8 bb(Z)$. For $U_(- \, T) \( v + i \/ 2 \)$,
  the nearest zero and pole occur at $v = i \/ 2$ and $v = - i \/ 2$ modulo $T$, respectively;
  the next divisors occur at $v = plus.minus 3 i \/ 2$ modulo $T$.
  Its exponential factor is nonzero wherever it is analytic.
  Combining these facts with the sample strip $\| Im v \| < 3 \/ 2$ shows that $b \, b_(+) \,
  b_(-)$ and their inverses are analytic on $\| Im v \| < 1 \/ 2$,
  bounded on each smaller closed strip over one period. These are conditional bounds depending on the sample and
  the fixed parameters.

#thm([Lemma 4.2.])[
  (Conditional angular trace).  #emph[Fix $T > 0$, $m in bb(N)_0$, $theta in bb(C)$,
    and a homogeneous analytic sample as above. The normalizing trace is
$ Z_Gamma := "Tr" Gamma = product_(r in 1 / 2 + bb(N)_0) \( 1 - upright(bold(q))^(6 r) \) > 0 . $

 For $s gt.eq 1$, if the folded coordinates have strictly increasing imaginary parts with total range less than
   $1$, then
#[#set math.equation(numbering: n => "(4.7)")
 $ (- frac(2 pi i, a_(*) T))^s
   frac("Tr" #scale(x: 120%, y: 120%)[\(] Gamma Psi_(j_1) \( v_1 \) dots.h.c Psi_(j_(2 s)) \( v_(2 s) \)
   #scale(x: 120%, y: 120%)[\)], Z_Gamma) = "Pf"_(1 lt.eq a \, b lt.eq 2 s) C^(\[ T \])
   #scale(x: 120%, y: 120%)[\(] v_b - v_a + i \( j_b - j_a \) #scale(x: 120%, y: 120%)[\)] . $ <c7:angular-wick>]

 The trace in this display denotes its absolutely convergent ordered mode sum. For $s = 0$ both sides are $1$.
   The formula at other nonsingular coordinates is its meromorphic continuation; odd products vanish.]
  #emph[Let $P_N$ project onto the energy-$N$ subspace, for $N in 1 / 2 bb(N)_0$.
    For a fixed finite word $Y$ of exponentials of the currents $X_(b c) \( f \)$,
    with periodic coefficients analytic on a common strip of positive width, there are $C \, c > 0$ such that
#[#set math.equation(numbering: n => "(4.8)")
 $ parallel P_(N') Y P_N parallel lt.eq C e^(C sqrt(N + 1)) e^(- c \| N' - N \|) . $ <c7:graded-current-bound>]

 The constants can be taken locally uniform in numerical parameters multiplying the currents in the exponentials.
   In particular the energy-level trace with $Gamma$ is absolutely convergent,
   as are its exponential series of scalar trace coefficients.]
  #emph[For the homogeneous contour expression (4.2) and the fixed analytic sample,
#[#set math.equation(numbering: n => "(4.9)")
 $ cal(C)_sigma = 1 / Z_Gamma "Tr"_(upright("gr")) #h(-0.16667em)
   (Gamma e^(X_23 \( b_(+)^(- 1) \)) e^(X_21 \( b \)) e^(- X_12 \( b^(- 1) \)) e^(- X_16 \( b_(-) \))) .
   $ <c7:four-current-trace>]

 Here the absolutely convergent trace furnished by (4.8) is
$ "Tr"_(upright("gr")) \( Gamma Y \) = sum_N upright(bold(q))^N "tr"_(P_N cal(F)) \( cal(U) P_N Y P_N \) \, $

 where $cal(F)$ is the fermionic exterior space. The convergence assertions concern this fixed sample.]
] <c7:angular-trace>

#proof[
  The operator $upright(bold(q))^(L_0)$ is trace class because $product_(r > 0) \( 1 + upright(bold(q))^r \)^6 <
    oo$, and $cal(U)$ is unitary. The trace of the exterior space at each positive energy $r$ is the determinant
    of $I$ plus the one-particle action. That action is $- upright(bold(q))^r$ times a six-cycle,
    so its determinant is $1 - upright(bold(q))^(6 r)$. Since $sum_(r > 0) upright(bold(q))^(6 r) < oo$,
    this proves the product for $Z_Gamma$ and its positivity.
  Cyclicity for bounded individual CAR modes gives, for $r > 0$,
  $ frac("Tr" \( Gamma Psi_(j \, r) Psi_(l \, - r) \), Z_Gamma) =
    sum_(n gt.eq 0) upright(bold(q))^(r n) delta_(l - n \, j^(*)) . $
  Indeed the left side, denoted $C_(j l)$, obeys $C_(j l) = delta_(l \, j^(*)) +
    upright(bold(q))^r C_(j + 1 \, l)$. The CAR then give $- sum_(n gt.eq 1) upright(bold(q))^(- r n)
    delta_(l + n \, j^(*))$ for $r < 0$. Other energy pairings vanish.
    For $0 < Im \( v - u \) < 1$, summing the half-integer modes yields
  $ frac("Tr" \( Gamma Psi_j \( u \) Psi_l \( v \) \), Z_Gamma) = i / 2 sum_(n in bb(Z)\
n equiv l - j - 3 med \( mod med 6 \)) frac(1, sin \( pi \( v - u + i n \) \/ T \)) . $
  Here the positive and negative geometric sums converge respectively on the two sides of the annulus.
    Multiplication by $- 2 pi i \/ \( a_(*) T \)$ gives $C^(\[ T \]) \( v - u + i \( l - j \) \)$.
    Moving one mode cyclically in a higher product, contracting it by the CAR,
    and solving the same six-step recurrence gives Wick’s Pfaffian rule.
    For two ordered heights $eta_a < eta_b$, direct contractions have decay from $eta_b - eta_a$,
    and contractions wrapping through $Gamma$ have decay from $1 - \( eta_b - eta_a \)$.
    Both are positive in the stated strip, which makes the finite products of mode sums absolute.
    This proves (4.7); graded alternation gives its meromorphic continuation.
  We give the estimates needed for the integrated currents.
    Suppose $f$ is bounded and analytic on a closed strip of width $rho > 0$.
    Its coefficients obey $\| f_n \| lt.eq C e^(- 2 pi rho \| n \| \/ T)$.
    The quadratic mode with $r + s = n$ changes energy by $- n$. On energy $N$ its norm is at most
  $ C \( sqrt(N + 1) + \| n \| \) . $
  For the creator-annihilator part this is the second-quantized norm of a bounded one-particle shift times the
    particle count, which is $O \( sqrt(N + 1) \)$ by exclusion.
    The two-creator and two-annihilator parts have $O \( \| n \| \)$ terms.
    Normal ordering adds no contraction for these roots.
  We also need a bound before summing the constituent mode pairs.
    On an occupation state of energy $N$, at most $O \( N + \| n \| + 1 \)$ pairs $r + s = n$ can act:
    in the mixed-sign part the annihilator must meet an occupied mode,
    and the same-sign part has $O \( \| n \| \)$ pairs. Each constituent has norm at most one.
    This coarser count, the Fourier exponential, and the energy damping below give absolute sums of
    occupation-basis terms for any fixed monomial of currents.
  For a product of $s$ quadratic modes, let $u$ be the sum of the absolute energy movements.
    Absorbing the individual $\| n \|$ factors into part of the Fourier exponential leaves a bound
    $C^s \( 1 + sqrt(N) + sqrt(u) \)^s$. Absorbing another part and summing the movements gives
  $ C_1^s \( 1 + sqrt(N) + sqrt(s) \)^s e^(- c \| N' - N \|) $
  before the exponential-series factorials. Summing in $s$ gives (4.8):
    splitting $\( 1 + sqrt(N) + sqrt(s) \)^s$ into the two terms with bases $1 + sqrt(N)$ and $sqrt(s)$,
    and using the factorial, bounds the sum by $e^(C sqrt(N + 1))$.
    Finite-energy dimensions are bounded by $e^(C sqrt(N + 1))$,
    as follows by evaluating the exterior generating product at nome $e^(- 1 \/ sqrt(N + 1))$.
    The factor $upright(bold(q))^N$ therefore makes the energy-level trace absolute.
    The same estimates are locally uniform in numerical exponential parameters, so commutators,
    differentiation in those parameters, and the conjugations below can be verified by convergent coefficients.
    The argument also applies to the nonzero normally ordered Cartan modes used below.
  It remains to relate the contour to those currents. Use $0 < epsilon < 1 \/
    8$ and expand $gamma_r$ to the boundary of the band $\| Im w \| < 1 \/ 2 - epsilon$ in $bb(C) \/ T bb(Z)$.
    No inter-current pole is crossed, since all unshifted differences have imaginary part strictly between $-
    1$ and $1$. The Gaussian arguments remain inside $\| Im v \| < 3 \/ 2$.
    Each bilinear is periodic horizontally, so the vertical sides cancel.
    On the top set $v = w - i \/ 2$ and on the bottom set $v = w + i \/ 2$. The identification in (4.7) is
  $ psi \( v + i \( j - 3 \/ 2 \) \) arrow.l.r (- frac(2 pi i, a_(*) T))^(1 \/ 2) Psi_j \( v \) . $
  A positive boundary runs west along the top and east along the bottom.
    Using $U_(+) \( w \) = U_(-) \( w + i \)^(- 1)$, the four contributions are
  #[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[boundary and defect
], table.cell(rowspan: 1, colspan: 1)[folded line
], table.cell(rowspan: 1, colspan: 1)[ordered sheets
], table.cell(rowspan: 1, colspan: 1)[current
]),
  table.cell(rowspan: 1, colspan: 1)[top, $delta = - 1$
], table.cell(rowspan: 1, colspan: 1)[$w = v + i \/ 2 \, med Im v = - epsilon$
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, 1 \)$
], table.cell(rowspan: 1, colspan: 1)[$X_21 \( b \)$
],
  table.cell(rowspan: 1, colspan: 1)[top, $delta = + 1$
], table.cell(rowspan: 1, colspan: 1)[$w = v + i \/ 2 \, med Im v = - epsilon$
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, 3 \)$
], table.cell(rowspan: 1, colspan: 1)[$X_23 \( b_(+)^(- 1) \)$
],
  table.cell(rowspan: 1, colspan: 1)[bottom, $delta = + 1$
], table.cell(rowspan: 1, colspan: 1)[$w = v - i \/ 2 \, med Im v = epsilon$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 2 \)$
], table.cell(rowspan: 1, colspan: 1)[$- X_12 \( b^(- 1) \)$
],
  table.cell(rowspan: 1, colspan: 1)[bottom, $delta = - 1$
], table.cell(rowspan: 1, colspan: 1)[$w = v - i \/ 2 \, med Im v = epsilon$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[$- X_16 \( b_(-) \)$
],
)
]
  For example, the coefficient on the unoriented top line for $delta = - 1$ is $- b \( v \)$,
    and reversing that line changes it to $b \( v \)$. The pair of physical field multipliers changes $a_(*) thin
    d v \/ \( 2 pi i \)$ to $- d v \/ T$, exactly the normalization in $X_(b c)$.
  Within either line there are no dual field pairs, so its bilinears have no internal contraction poles and may be
    separated infinitesimally. The top folded line is below the bottom folded line and their range is $2 epsilon <
    1$, as required by (4.7). Match first each coefficient after inserting one numerical parameter multiplying all
    contour currents. The contour deformation and Wick rule give the corresponding coefficient of the four current
    exponentials; exchanging entire bilinears costs no sign because they are even.
    The two top roots commute, and so do the two bottom roots.
    The graded estimate makes the trace series entire in the numerical parameter.
    Summing the matched coefficients at parameter $1$ proves (4.9). ◻
]

=== 4.4 The seam operator and outgoing coefficients <the-seam-operator-and-outgoing-coefficients>

The four-current trace can be reorganized so that one operator carries the exchange of sheets $1 \, 2$. Define

$ W_b = e^(- X_12 \( b^(- 1) \)) e^(X_21 \( b \)) e^(- X_12 \( b^(- 1) \)) . $

It acts on the formal field series by the matrix $P_b$ whose blocks on sheets $1 \, 2$ and $4 \, 5$ are

$ P_b \|_(1 \, 2) = mat(delim: "(", 0, - b^(- 1); b, 0) \, wide P_b \|_(4 \, 5) =
  mat(delim: "(", 0, - b; b^(- 1), 0) = \( P_b \|_(1 \, 2) \)^(- t) \, $

and which fixes sheets $3 \, 6$. The exact operator identity is

#[#set math.equation(numbering: n => "(4.10)")
 $ & e^(X_23 \( b_(+)^(- 1) \)) e^(X_21 \( b \)) e^(- X_12 \( b^(- 1) \)) e^(- X_16 \( b_(-) \))\
 & wide = e^(X_26 \( b b_(-) \)) e^(X_D) W_b e^(- X_13 \( \( b b_(+) \)^(- 1) \)) \,\
 & X_D = X_12 \( b^(- 1) \) + X_13 \( \( b b_(+) \)^(- 1) \) - X_16 \( b_(-) \) +
   X_15 \( b_(-) \/ b_(+) \) . $ <c7:seam-factorization>]

We verify the scalar as well as the field action. Put $A_(upright(r)) = X_23 \( b_(+)^(- 1) \)$, $B_(upright(r)) =
  X_26 \( b b_(-) \)$, and $C_(upright(r)) = X_12 \( b^(- 1) \)$.
  Isolating the defining three-root word for $W_b$ and conjugating the left field of $X_16$ by $W_b$ writes the
  left side as $e^(A_(upright(r))) e^(C_(upright(r))) e^(B_(upright(r))) W_b$.
  The roots $A_(upright(r)) \, B_(upright(r))$ commute, with no central term:
  their only possible single contraction leaves two copies of $Psi_5$, and two contractions are impossible.
  Thus the middle exponent after moving them past it is $e^(- "ad" B_(upright(r))) e^("ad" A_(upright(r)))
  C_(upright(r))$. In this conjugation $Psi_4$ stays fixed and its partner changes by

$ Psi_2 mapsto Psi_2 + b_(+)^(- 1) Psi_3 - b b_(-) Psi_6 + \( b b_(-) \/ b_(+) \) Psi_5 . $

Multiplying by $b^(- 1)$ gives exactly $X_D$. Also $W_b^(- 1) A_(upright(r)) W_b = -
  X_13 \( \( b b_(+) \)^(- 1) \)$. Every transformed partner in these steps is nondual to its first field,
  so normal ordering produces no scalar contraction. The graded convergence in Lemma 13 makes these conjugations
  identities of the operators used in the trace. The field calculation therefore fixes the scalar as well as the
  matrices $J_(b c)$ and proves (4.10).

The part of $W_b$ depending on the oscillators will be evaluated in Section 5.
  Periodizing $U_(-) \( v + i \/ 2 \) = e^(a \( v \))$ gives $U_(- \, T) \( v + i \/ 2 \) =
  e^(a_T \( v \))$ on $\| Im v \| < 1 \/ 2$. Hence write

$ b = b_w e^(sans(A)) \, wide b_w = b_0 y^(- ell) \, wide b_0 = e^(- i \( theta + phi_0 \)) \, wide sans(A) =
  m a_T - i chi = sum_n sans(A)_n y^n . $

Here $sans(A)_0 = 0$ because $hat(a) \( 0 \) = 0$ and $chi$ has zero spatial mean.
  For $j = 1 \, 2 \, 3$ use the normally ordered currents

$ h_(j \, n) = sum_(r + s = n) : Psi_(j \, r) Psi_(j^(*) \, s) : \, wide \[ h_(j \, n) \, Psi_j \( v \) \] =
  y^n Psi_j \( v \) . $

Then

#[#set math.equation(numbering: n => "(4.11)")
 $ W_b = W_(b_w) exp #h(-0.16667em) (sum_n sans(A)_n \( - h_(1 \, n) + h_(2 \, n) \)) . $ <c7:cartan-seam>]

Indeed, with $K = 1 / 2 sum_n sans(A)_n \( h_(1 \, n) - h_(2 \, n) \)$,
  conjugating the defining root word for $W_(b_w)$ by $e^K$ changes its coefficients to those of $W_b$.
  The action of $W_(b_w)$ interchanges the nonzero $h_(1 \, n) \, h_(2 \, n)$, so $W_(b_w) K W_(b_w)^(- 1) = -
  K$ and $e^K W_(b_w) e^(- K) = W_(b_w) e^(- 2 K)$. Only nonzero modes enter.
  At zero mode the Cartan difference would instead transform to $- \( h_(1 \, 0) - h_(2 \, 0) \) + 2 ell$,
  which explains the use of $sans(A)_0 = 0$.

Finally we put each fixed coefficient of the remaining three exponentials on the outgoing side of $W_b$.
  On the finite-energy core the mode identity is

$ Gamma Psi_(j \, r) Gamma^(- 1) = - upright(bold(q))^(- r) Psi_(j - 1 \, r) . $

Equivalently, as a formal mode series,

$ Gamma Psi_j \( v \) Gamma^(- 1) = - Psi_(j - 1) \( v + i \) . $

The corresponding current rule, including its scalar argument, is

#[#set math.equation(numbering: n => "(4.12)")
 $ Gamma X_(b c) \( f \; gamma \) Gamma^(- 1) = X_(b - 1 \, c - 1) #scale(x: 120%, y: 120%)[\(]
   f \( thin dot.op - i thin \) \; gamma + i #scale(x: 120%, y: 120%)[\)] . $ <c7:cyclic-current>]

The two field signs cancel and the orientation is unchanged.
  In a trace this identity is first applied to fixed modes; the movement estimates in the proof of Lemma 13,
  before factorial summation, give absolute sums for each fixed monomial and permit their reindexing and Fourier
  integration.

More explicitly, let $Y_L \, Y_D \, Y_U$ be fixed monomials from the leftmost, middle,
  and rightmost exponentials of (4.10). Cyclicity gives

$ "Tr"_(upright("gr")) \( Gamma Y_L Y_D W_b Y_U \) = "Tr"_(upright("gr")) #scale(x: 120%, y: 120%)[\(] Gamma W_b
  Y_U \( Gamma Y_L Gamma^(- 1) \) \( Gamma Y_D Gamma^(- 1) \) #scale(x: 120%, y: 120%)[\)] . $

The denominator remains $Z_Gamma$. Call the rightmost root $U$, the cycled leftmost root $L$,
  and retain $D$ for the middle sum. Their outgoing order is $U \, L \, D$.
  One may initially put the unshifted $U$ pairs just above folded height $0$, and the incoming $L \,
  D$ pairs on lines $- rho_L \, - rho_D$ with $0 < rho_D < rho_L < 1 \/ 2$.
  After (4.12) these latter lines have heights $1 - rho_L \, 1 - rho_D$.
  Further infinitesimal separations realize strict order

$ 0 < eta_U < eta_L < eta_D < 1 $

for each fixed coefficient, within the original scalar analytic strips.
  Section 5 evaluates these ordered coefficients and establishes its further contour displacements from their
  paired analytic expressions.

Thus the Gaussian expectation of the total trace is defined by its equality to the finite contour polynomial.
  Passing that expectation through the reorganized infinite expansion requires the absolute estimate of Section 6.
  The conditional trace identities here hold for every fixed $T > 0$;
  the later integrated gas identity uses sufficiently large integer periods to which that estimate applies.

== 5 Bosonization and the horizontal gas <c7:boson>

The conditional angular trace from Section 4 will now be rewritten as a gas on the horizontal circle.
  This change of description has two analytic stages. We first evaluate each fixed current coefficient and prove
  that the resulting series is absolutely integrable under a real tilted Gaussian law on contours inside the
  field’s analytic strip. After this integration, the resulting meromorphic terms can cross the collision divisor;
  its residue creates one additional particle type. The exact gas identity is then proved at each fixed site count
  for the sufficiently large integer periods covered by the stability estimate.
  The later limit in the period uses the original finite residue regulator, rather than a termwise limit of the gas.

The charged-fermion and oscillator descriptions below implement the boson–fermion correspondence [5];
  a primary treatment connecting Clifford operators and Heisenberg fields is [6] Sections 6.4 and 8.1.
  We include the mode calculation because the charge shifts and phases determine the scalar normalization.
  Throughout the conditional calculations, $T > 0$ and the analytic loop coefficients are fixed,
  and $upright(bold(q)) = e^(- 2 pi \/ T)$.

=== 5.1 Charge sectors and the seam trace <charge-sectors-and-the-seam-trace>

Work first with one species. Write $Psi_j^(+) = Psi_j$ and $Psi_j^(-) = Psi_(j^(*))$ for $j = 1 \, 2 \, 3$.
  The eigenvalues $c = \( c_1 \, c_2 \, c_3 \) in bb(Z)^3$ of the three zero modes $h_(j \, 0)$ label charge
  sectors. In each sector the nonzero modes satisfy

$ \[ h_(j \, n) \, h_(l \, s) \] = n delta_(n \, - s) delta_(j l) \, wide h_(j \, n)^(*) = h_(j \, - n) \, $

and generate an oscillator space from a ground state $\| c chevron.r$ of energy $\| c \|^2 \/ 2$.
  To define this ground state, for each $j$ fill the creators of sign $"sgn" c_j$ up to energy $\| c_j \| -
  1 \/ 2$, with the largest energy leftmost, and put the three lists in the order $j = 1 \, 2 \, 3$.
  The anticommutation relations give the displayed commutator:
  changing normal order contributes exactly $n$ mode pairs for $n > 0$.
  The positive oscillator modes kill $\| c chevron.r$.

These oscillator spaces account for all fermionic states.
  For one value of $j$, encode a configuration by occupied positions in $1 / 2 + bb(Z)$,
  starting with the negative positions filled. A positive-sign creator inserts a particle at a positive position,
  and a negative-sign creator deletes one at a negative position.
  In charge $c_j$, the occupied positions in decreasing order are

$ c_j + 1 / 2 - k + lambda_k \, wide k gt.eq 1 \, $

for a unique partition $\( lambda_k \)$. Every partition occurs, and its excess energy is $sum_k lambda_k$.
  These are exactly the multiplicities generated by the negative oscillator modes.

Let $R_j$ raise $c_j$ by one, commute with nonzero modes,
  and act on the charge basis with Klein sign $\( - 1 \)^(sum_(l < j) c_l)$. In matrix elements the field is

#[#set math.equation(numbering: n => "(5.1)")
 $ Psi_j^epsilon.alt \( v \) = y^(1 \/ 2) R_j^epsilon.alt y^(epsilon.alt h_(j \, 0)) exp #h(-0.16667em)
   (epsilon.alt sum_(n > 0) y^n h_(j \, - n) \/ n) exp #h(-0.16667em)
   (- epsilon.alt sum_(n > 0) y^(- n) h_(j \, n) \/ n) \, wide y = e^(2 pi i v \/ T) \, quad epsilon.alt =
   plus.minus 1 . $ <c7:vertex-field>]

Both sides have the same commutators with all nonzero $h$ modes.
  Their matrix elements between ground states agree by inserting or deleting the largest filled mode,
  which fixes the remaining factor and sign. Powers of $y$ use the indicated coordinate before exponentiation.

Recall from the preceding section that

$ b = b_w e^(sans(A)) \, wide b_w = b_0 y^(- ell) \, wide b_0 = e^(- i \( theta + phi_0 \)) \, wide sans(A) =
  m a_T - i chi \, $

where $sans(A)$ has zero spatial mean, and that

$ W_b = W_(b_w) exp #h(-0.16667em) (sum_n sans(A)_n \( - h_(1 \, n) + h_(2 \, n) \)) . $

We also retain $Z_Gamma = upright("tr") Gamma$ from the conditional trace. The action of $W_(b_w)$ on a ground state is

#[#set math.equation(numbering: n => "(5.2)")
 $ W_(b_w) \| c chevron.r = \( - 1 \)^(c_1 + c_1 c_2) b_0^(ell + c_2 - c_1) \| c_2 + ell \, c_1 - ell \,
   c_3 chevron.r \, $ <c7:weyl-ground>]

and it swaps oscillator labels 1 and 2. Here is a verification that also fixes its scalar.
  In the three-root word for $W_(b_w)$, the modes with $r + s =
  ell$ form commuting blocks $\( 1 + F \) \( 1 + E' \) \( 1 + F \)$, where

$ F = b_0^(- 1) Psi_(4 \, r) Psi_(2 \, s) \, wide E' = - b_0 Psi_(5 \, - s) Psi_(1 \, - r) . $

When $r \, s$ have opposite signs the block fixes the vacuum.
  When both are positive it contributes $E'$, and when both are negative it contributes $F$.
  Put the species-1 creator first in each contributing block.
  The sign for grouping creators by species cancels the sign for reversing the second energy list,
  giving $W_(b_w) \| 0 chevron.r = b_0^ell \| ell \, - ell \, 0 chevron.r$.
  This calculation can be made on finite occupation sets, since only finitely many blocks act nontrivially there.
  Conjugation of fields sends $Psi_1 mapsto - b_0^(- 1) y^ell Psi_2$ and $Psi_2 mapsto b_0 y^(- ell) Psi_1$.
  With the Klein signs, increasing $c_1$ changes the ground coefficient by $\( - 1 \)^(1 + c_2)
  b_0^(- 1)$ and increasing $c_2$ changes it by $\( - 1 \)^(c_1) b_0$. Increasing $c_3$ changes nothing.
  These ratios and the vacuum value prove (5.2); the evenness of $ell in 8 bb(Z)$ is used here.

Rotation sends a ground charge $d$ to $\( d_2 \, d_3 \, - d_1 \)$ with sign
  $\( - 1 \)^(sum d_j + d_1 \( d_2 + d_3 \))$. The first part counts the minus sign on each creator,
  and the second moves the first species list past the other two. Applying rotation to (5.2) therefore gives

#[#set math.equation(numbering: n => "(5.3)")
 $ Gamma W_(b_w) \| c chevron.r = upright(bold(q))^(\| c'' \|^2 \/ 2) \( - 1 \)^(c_2 + c_3 + c_2 c_3)
   b_0^(ell + c_2 - c_1) \| c'' chevron.r \, wide c'' = \( c_1 - ell \, c_3 \, - c_2 - ell \) . $ <c7:seam-ground>]

On creation oscillators of frequency $n > 0$, in addition to this ground state action, it acts by

#[#set math.equation(numbering: n => "(5.4)")
 $ B_n = upright(bold(q))^n "diag" \( 1 \, R \) \, wide R = mat(delim: "(", 0, 1; - 1, 0) . $ <c7:oscillator-twist>]

Consider a fixed coefficient in the three current exponentials on the two sides of $W_b$.
  By the cyclic rule (4.12), its outgoing field pairs can be put to the right of $W_b$ in the order $U \, L \, D$.
  Here $U$ denotes the rightmost root, $L$ the cycled leftmost root, and $D$ the middle exponential;
  their individual labels will be specified below. Each $Psi$ carries again the physical multiplier
  $\( - 2 pi i \/ \( a_(*) T \) \)^(1 \/ 2)$. Consequently a current $X_(b c) \( f \)$ contributes
  $\( a_(*) \/ \( 2 pi i \) \) f \( v \) thin d v$ together with its pair of physical fields.
  For a field of sign $epsilon.alt$ at folded coordinate $v$, define its centered coordinate $w$ by

#[#set math.equation(numbering: n => "(5.5)")
 $ w = v - i \/ 2 quad \( j = 1 \, upright(" short") \) \, wide w = v - i quad \( j = 2 \, upright(" outer") \) \,
   wide w = v quad \( j = 3 \, upright(" outer") \) . $ <c7:centered-fields>]

Let the total inserted charges of types $1 \, 2 \, 3$ be $\( S_1 \, E_2 \, F_3 \)$,
  and let $n = \( n_1 \, n_2 \, n_3 \)$ be the ground charge to the right of the fields.
  Applying (5.3) to $c = n + \( S_1 \, E_2 \, F_3 \)$ and imposing trace closure gives

#[#set math.equation(numbering: n => "(5.6)")
 $ S_1 = ell \, wide n_2 = \( F_3 - E_2 - ell \) \/ 2 \, wide
   n_3 = \( - F_3 - E_2 - ell \) \/ 2 . $ <c7:charge-closure>]

The last two values are integral: every current has two fields, so $S_1 + E_2 + F_3$ is even, and $ell$ is even.
  The charge $n_1$ remains free. The $b_0$ factor becomes $b_0^(\( F_3 + E_2 - ell \) \/ 2 - n_1)$.

For later sign accounting, order all fields from left to right.
  If $N_j$ is the number of fields of type $j$, the Klein exponent apart from inversions is $n_1 \( N_2 + N_3 \) +
  n_2 N_3$. Add the exponent in (5.3) and substitute (5.6). The result modulo two is

#[#set math.equation(numbering: n => "(5.7)")
 $ \( F_3 + E_2 \) \/ 2 + \# \( 3 upright(" before ") 2 \) + \# \( upright("outer before short") \) . $ <c7:klein-sign>]

For example, $N_2 + N_3$ is even and the non-inversion remainder reduces to $n_2 +
  F_3 equiv \( E_2 + F_3 \) \/ 2 med \( mod med 2 \)$. The initial ground-coordinate power on field $i$ of type
  $j$ is $y_i^(1 \/ 2 + epsilon.alt_i \( n_j + sum_(l > i \, thin j_l = j) epsilon.alt_l \))$.

=== 5.2 Oscillator contractions at fixed insertion order <oscillator-contractions-at-fixed-insertion-order>

For normalized creators with coefficient vector $u$ followed by normalized annihilators with coefficient vector
  $v'$, the oscillator trace with propagator $B_n$, divided by its empty trace, is

$ exp #h(-0.16667em) (v'^t B_n \( I - B_n \)^(- 1) u) . $

For one oscillator with multiplier $t$, cyclicity and the commutator give $chevron.l \( a^(*) \)^l a^l chevron.r =
  l ! \( t \/ \( 1 - t \) \)^l$ and zero for unbalanced moments;
  diagonalizing the unitary part gives the vector formula. Reordering two exponentials adds the contraction of the
  earlier annihilator with the later creator. An unsplit exponential adds half of its internal contraction.

Apply these rules to the seam source $exp \( sum_n sans(A)_n \( - h_(1 \, n) + h_(2 \, n) \) \)$.
  For $k = 2 pi n \/ T > 0$ and $s = \( - 1 \, 1 \, 0 \)^t$, (5.4) gives

$ s^t (1 / 2 + B_n \( I - B_n \)^(- 1)) s = 1 / 2 coth \( k \/ 2 \) + 1 / 2 tanh k =
  frac(cosh \( 3 k \/ 2 \), 2 sinh \( k \/ 2 \) cosh k) = E \( k \) . $

Since $D \( k \) = k E \( k \) \/ \( 2 pi \)$, the source self-contraction is
  $exp \( 1 / 2 integral_T sans(A) D sans(A) \)$. Its cross contractions dress a positive short and a positive
  outer field respectively by

#[#set math.equation(numbering: n => "(5.8)")
 $ f_s^(upright("osc")) \( w \) = - sum_(k = 2 pi n \/ T eq.not 0)
   frac(sans(A)_n e^(i k w), 2 sinh \( k \/ 2 \)) \, wide f_o^(upright("osc")) \( w \) =
   sum_(k = 2 pi n \/ T eq.not 0) frac(sans(A)_n e^(i k w), 2 cosh k) . $ <c7:oscillator-dresses>]

A negative field receives the negative exponent. To check the centering in this formula,
  the creator contraction uses $s^t \( I - B_n \)^(- 1)$ and the annihilator contraction uses
  $B_n \( I - B_n \)^(- 1) s$. The short coordinate has $y^n = upright(bold(q))^(n \/ 2) e^(i k w)$;
  the two outer coordinates have $y^n = upright(bold(q))^n e^(i k w)$ and $e^(i k w)$.
  Substitution gives the two displayed multipliers. The empty oscillator trace is

#[#set math.equation(numbering: n => "(5.9)")
 $ D_W = product_(n gt.eq 1) \( 1 - upright(bold(q))^n \)^(- 1) \( 1 + upright(bold(q))^(2 n) \)^(- 1) .
   $ <c7:empty-oscillator>]

For fields $i < l$ put $d' = w_l - w_i$ and $Z = e^(2 pi i d' \/ T)$.
  Each short field has self-factor $H_s = product_(n gt.eq 1) \( 1 - upright(bold(q))^n \)$, and its pair base is

$ F_s \( Z \) = \( 1 - Z \) product_(r gt.eq 1) \( 1 - upright(bold(q))^r Z \) \( 1 - upright(bold(q))^r \/ Z \) . $

Each outer field has self-factor $H_o = product_(r gt.eq 1) \( 1 - upright(bold(q))^(2 r) \)^(\( - 1 \)^r)$,
  and its pair base is

$ F_o \( Z \) = \( 1 - Z \)
  product_(r gt.eq 1) \[ \( 1 - upright(bold(q))^(2 r) Z \) \( 1 - upright(bold(q))^(2 r) \/ Z \) \]^(\( - 1 \)^r) . $

Every pair base is raised to $epsilon.alt_i epsilon.alt_l$.
  Use $F_o \( Z^(- 1) \)$ when a type-3 field precedes a type-2 field.
  For example, the outer block of $B_n \( I - B_n \)^(- 1)$ at $t =
  upright(bold(q))^n$ is $\( t R - t^2 I \) \/ \( 1 + t^2 \)$;
  combining it with the two centered $y$ powers gives this orientation.
  There is no oscillator pair contraction between a short and an outer field.

These formulas hold for the fixed current coefficient under discussion.
  Here are the convergence details needed for that assertion.
  Start with outgoing folded coordinates in strict strip order $0 < eta_1 < dots.h.c < eta_a < 1$, where $eta_i =
  Im v_i$. The uncycled pairs start slightly above zero; the cycled pairs start slightly below one.
  Cyclicity may first be applied to individual mode pairs. At fixed analytic loop coefficients,
  a quadratic Fourier mode of energy increment $Delta N$ has only $O \( 1 + N + \| Delta N \| \)$ potentially
  acting terms on energy $N$. Exponential Fourier decay and the graded kernel estimate of Lemma 13 therefore make
  the integrated sums absolute under $upright(bold(q))^(L_0)$.
  Cycling reindexes these absolutely convergent energy and occupation sums.

At separated field coordinates, let $N_0$ be the energy just left of the first field,
  $N_i$ the energy to the right of field $i$, and $N_a$ the terminal energy.
  A field mode $r$ changes energy by $- r$, so its coordinate power together with $Gamma$ supplies the damping

$ exp #h(-0.16667em)
  [- frac(2 pi, T) (eta_1 N_0 + sum_(i = 1)^(a - 1) \( eta_(i + 1) - eta_i \) N_i + \( 1 - eta_a \) N_a)] . $

The energy dimensions and the remaining graded kernels grow only subexponentially.
  Inside one bilinear no internal contraction is possible; if its two coordinates coincide,
  the intermediate energy is bounded by the sum of its bracketing energies and the number of mode splittings is
  polynomial. The same formula is therefore integrable on the original nearby lines,
  also by a coincident-coordinate limit within a bilinear.

One may equivalently sum the same finite-level matrix elements in oscillator bases and first truncate the
  oscillator modes. After replacing coefficients by their absolute values,
  $B_n$ is bounded by $upright(bold(q))^n$ times a permutation.
  Direct creator–annihilator sums have the ordered-radius gap, thermal wraps have the remaining annulus gap,
  and source terms have the Fourier decay of $sans(A)$. Their large-$n$ logarithms are summable.
  The ground sums have Gaussian decay at this fixed field list and winding.
  This permits removal of the truncations and proves the oscillator formulas on the initial lines.
  Subsequent fixed-term moves use analytic continuation of these formulas.
  Absolute integration over the Gaussian samples will be proved separately below.

=== 5.3 Changing the period <changing-the-period>

The product formulas that turn the angular contractions into horizontal ones are

#[#set math.equation(numbering: n => "(5.10)")
 $ Z^(- 1 \/ 2) F_s \( Z \) \/ H_s^2 & = frac(- i, T) e^(- pi d' ""^2 \/ T)
   frac(2 sinh pi d' product_(r gt.eq 1) \( 1 - e^(- 2 pi \( r T + d' \)) \) \( 1 - e^(- 2 pi \( r T - d' \)) \),
   H_(*)^2) \,\
H_s & = sqrt(T) thin e^(- pi T \/ 12 + pi \/ \( 12 T \)) H_(*) \, wide H_(*) =
  product_(r gt.eq 1) \( 1 - e^(- 2 pi T r) \) \,\
Z^(- 1 \/ 2) F_o \( Z \) & = - i upright(bold(q))^(- 1 \/ 2) tanh \( pi d' \/ 4 \) product_(r gt.eq 1)
  tanh \( pi \( r T + d' \) \/ 4 \) tanh \( pi \( r T - d' \) \/ 4 \) \,\
H_o & = sqrt(T \/ 8) thin upright(bold(q))^(- 1 \/ 4) product_(r gt.eq 1) tanh \( pi r T \/ 4 \) .
  $ <c7:modular-products>]

For the first identity, the two sides have the same simple zeros and multipliers under $d' mapsto d' + T \, d' +
  i$. Their quotient is a pole-free doubly periodic function, and the derivatives at zero fix it.
  The scalar formula for $H_s$ can be obtained in the same comparison:
  after removing the zero, compare the quadratic logarithmic coefficients.
  With $U \( p \) = sum_(r gt.eq 1) p^r \/ \( 1 - p^r \)^2 = sum_(r gt.eq 1) r p^r \/ \( 1 - p^r \)$,
  divisor interchange gives

$ - frac(pi^2, 6 T^2) + frac(4 pi^2, T^2) U \( upright(bold(q)) \) = pi^2 / 6 - pi / T - 4 pi^2 U \( e^(- 2 pi T) \) . $

Multiplying this equality by $- 1 \/ \( 2 pi \)$ gives $partial_T log \( H_s \/ H_(*) \) = 1 \/ \( 2 T \) -
  pi \/ 12 - pi \/ \( 12 T^2 \)$; equality at $T = 1$ fixes the scalar constant.
  For the outer identity, compare divisors and multipliers under $+ T \, + 4 i$.
  The product of the left side and its $2 i$ translate is $- upright(bold(q))^(- 1)$,
  fixing the magnitude of the constant; a small positive real $d'$ fixes its sign.
  The derivative at zero then gives the formula for $H_o$.

Write $alpha_p = theta + phi_0 + 2 pi p$ and $g_w = 2 pi ell \/ T$.
  For the short fields let $N_s$ be their count and $X_s = sum_i epsilon.alt_i w_i$.
  Extracting $Z^(1 \/ 2)$ from their pair bases changes the coordinate powers to
  $y_i^(epsilon.alt_i \( n_1 + ell \/ 2 \))$. The identities

$ 2 sum_(i < l) epsilon.alt_i epsilon.alt_l = ell^2 - N_s \, wide
  sum_(i < l) epsilon.alt_i epsilon.alt_l \( w_l - w_i \)^2 = ell sum_i epsilon.alt_i w_i^2 - X_s^2 $

show that the net $H_s$ power is $ell^2$ and describe the pair Gaussian.
  Completing the heat and coordinate powers leaves $upright(bold(q))^(\( n_1 + ell \/ 2 \)^2 \/ 2 + ell^2 \/ 8)$
  and $e^(- i alpha_p ell \/ 2)$. Since $ell \/ 2$ is integral, Poisson summation gives

$ sum_(n_1 in bb(Z)) upright(bold(q))^(\( n_1 + ell \/ 2 \)^2 \/ 2) e^(i \( theta + phi_0 \) \( n_1 + ell \/ 2 \))
  e^(2 pi i \( n_1 + ell \/ 2 \) X_s \/ T) = sqrt(T) sum_(p in bb(Z))
  e^(- T alpha_p^2 \/ \( 4 pi \) - alpha_p X_s - pi X_s^2 \/ T) . $

The $X_s^2$ term cancels the pair Gaussian. Including physical field normalizations,
  the short contribution apart from $sqrt(T) e^(- T alpha_p^2 \/ \( 4 pi \))$ is as follows:

$ upright("field dress: ") quad epsilon.alt_i \( - alpha_p w_i - g_w w_i^2 \/ 2 \) \,\
upright("scalar: ") quad exp \[ - pi T ell^2 \/ 12 - pi ell^2 \/ \( 6 T \) - i alpha_p ell \/ 2 \] \,\
upright("per-field factor: ") quad \( 2 pi \/ a_(*) \)^(1 \/ 2) H_(*) . $

The remaining short pair base is $2 sinh pi d'$ with its two image factors from (5.10).
  The possible phase $\( - i \)^(ell^2 \/ 2)$ is one for $ell in 8 bb(Z)$.

For the outer fields put $Y_i = e^(2 pi i w_i \/ T)$. Extract the inverse square root when type 3 precedes type 2
  and the ordinary square root otherwise. The residual power of every $Y_i$ is $- ell epsilon.alt_i \/ 2$.
  The ground and coordinate exponent of $upright(bold(q))$ before the modular factors is

$ frac(n_2^2 + n_3^2, 2) + E_2 n_2 + E_2^2 / 2 = frac(\( E_2 + F_3 \)^2 + ell^2, 4) . $

The modular pair and self factors remove $\( E_2 + F_3 \)^2 \/ 4$.
  Orient every remaining odd outer base as $d' = w_l - w_i$; this contributes the 3-before-2 sign.
  The outer contribution is

$ upright("field dress: ") quad - i epsilon.alt_i \( alpha_p + g_w w_i \) \/ 2 \,\
upright("scalar and phase: ") quad upright(bold(q))^(ell^2 \/ 4)
  e^(i alpha_p ell \/ 2) \( - i \)^(\( E_2 + F_3 \)^2 \/ 2) \,\
upright("per-field factor: ") quad \( pi \/ \( 4 a_(*) \) \)^(1 \/ 2) product_(r gt.eq 1) tanh \( pi r T \/ 4 \) . $

The remaining pair base is $tanh \( pi d' \/ 4 \)$ with its images.
  Writing $E_2 + F_3 = 2 h$, the displayed phase is $\( - 1 \)^h$.
  It cancels the charge sign in (5.7), and the reorientation cancels its 3-before-2 sign.
  The sign left is exactly $\( - 1 \)^(\# \( upright("outer before short") \))$.
  In combination with the odd like-family bases, it makes the coordinate expression alternating under exchange of
  any neighboring fields. Whole even current pairs may therefore be reordered without a sign.
  The total winding scalar per species is

#[#set math.equation(numbering: n => "(5.11)")
 $ exp \[ - pi T ell^2 \/ 12 - 2 pi ell^2 \/ \( 3 T \) \] . $ <c7:modular-winding>]

=== 5.4 The tilted field and the first particle lists <the-tilted-field-and-the-first-particle-lists>

Return to the two species and put $upright(bold(1)) = \( 1 \, 1 \)^t$.
  The source in the regulator is $i m integral_T D a_T thin upright(bold(1)) dot.op chi$, since $hat(lambda)_0 =
  D hat(a)$. The curvature just computed satisfies

$ 1 / 2 integral_T \( m a_T upright(bold(1)) - i chi \)^t D \( m a_T upright(bold(1)) - i chi \) +
  i m integral_T D a_T thin upright(bold(1)) dot.op chi = m^2 integral_T a_T D a_T - 1 / 2 integral_T chi^t D chi . $

This is an identity for the common factor of each fixed current coefficient.
  The odd real transforms of $a$ and $lambda_0$ make them purely imaginary on the real line;
  $D$ is real and positive. Thus the remaining quadratic factor is a real Gaussian tilt.
  Including division by the original source expectation gives

#[#set math.equation(numbering: n => "(5.12)")
 $ tilde(G) = \( I + hat(G) D \)^(- 1) hat(G) \, wide D_g =
   product_(n gt.eq 1) det \( I + E \( k \) g \( k \) \)^(- 1) \, wide kappa_T =
   integral_T a_T D \( I + \( hat(G)_d + hat(G)_c \) D \) a_T \, $ <c7:source-removal>]

with overall scalar $D_g e^(m^2 kappa_T)$ and $k = 2 pi n \/ T$ in the product.
  The determinant has power $- 1$ because each positive frequency represents the two real modes $k \, - k$.
  The products converge at fixed period: the zero frequency is excluded and $g
  E$ decays exponentially at high frequency. We henceforth let $chi$ have this centered real tilted law.
  This operation is performed on the common factor before summing the new integrated series.

Combine (5.8) with the mean/winding field dresses:

$ f_s \( w \) = f_s^(upright("osc")) \( w \) - alpha_p w - g_w w^2 \/ 2 \, wide f_o \( w \) =
  f_o^(upright("osc")) \( w \) - i \( alpha_p + g_w w \) \/ 2 . $

Their multipliers give

$ e^(f_s \( v - i \/ 2 \) - f_s \( v + i \/ 2 \)) = b \( v \)^(- 1) \, wide
  e^(f_o \( v - i \) + f_o \( v + i \)) = b \( v \) . $

Define $H \( v \) = e^(f_s \( v + i \/ 2 \) - f_o \( v - i \))$.
  The nonzero-mode multiplier in its exponent is $- E$ on $sans(A)$, while the mean/winding difference is $-
  alpha_p v - g_w v^2 \/ 2 + 5 g_w \/ 8$. Therefore

#[#set math.equation(numbering: n => "(5.13)")
 $ H \( v \) = B_T \( v \)^m exp \( 2 pi m \/ T + xi \( v \) - alpha_p v - g_w v^2 \/ 2 + 5 g_w \/ 8 \) \,\
B \( v \) = frac(cosh \( pi v \/ 3 \) - sqrt(3) \/ 2, cosh \( pi v \/ 3 \) + sqrt(3) \/ 2) \, wide
  hat(xi) \( k \) = i E \( k \) hat(chi) \( k \) quad \( k eq.not 0 \) . $ <c7:H-dress>]

Here $B_T$ is the periodized product. Indeed

$ accent(log B, ̂) \( k \) = - \( 2 pi \/ k \) sinh k \/ cosh \( 3 k \/ 2 \) = - E \( k \) hat(a) \( k \) \, wide
  accent(log B, ̂) \( 0 \) = - 2 pi . $

Removing this zero coefficient accounts for $2 pi m \/ T$ in (5.13). The field $xi$ is real on the real line:
  $E$ is real and odd. Its high-frequency covariance below shows that it is analytic on $\| Im v \| < 3 \/ 2$.
  The displayed exponential recurrences continue from their defining strips.
  For example, for $1 \/ 2 < Im v < 3 \/ 2$, the upper value of $H$ can also be written as
  $e^(f_s \( v - i \/ 2 \) - f_o \( v - i \)) b \( v \)$; the first recurrence provides that continuation.
  The lower continuation is analogous.

We now specify the current pairs as particles. A short or outer entry $\( a \, epsilon.alt \)$ means a field at
  $w = x + i a$ of sign $epsilon.alt$; an $H$ entry $\( a \, r \)$ means the full factor $H \( x + i a \)^r$.
  All entries in one row belong to one species. The four rows $P \, M \, O_(+) \, O_(-)$ come from roots $12 \,
  15 \, 13 \, 16$ in $D$. The rows $U \, L$ come from the rightmost root and the cycled leftmost root
  respectively. The separate sign is their scalar coefficient sign.

#[#set math.equation(numbering: n => "(5.14)")
 $ & upright("shorts") & upright("outers") & upright("sign") & H upright("-charges")\
P & \( 1 \/ 2 \, 1 \) & \( 1 \, 1 \) & + & \( 0 \, 1 \)\
M & \( 1 \/ 2 \, - 1 \) & \( 1 \, 1 \) & + & \( 0 \, 1 \) \, \( 1 \, - 1 \) \, \( - 1 \, - 1 \)\
O_(+) & diameter & \( 1 \, 1 \) \, \( 0 \, 1 \) & + & \( 0 \, 1 \) \, \( 1 \, - 1 \)\
O_(-) & diameter & \( 1 \, 1 \) \, \( 0 \, - 1 \) & - & \( 0 \, 1 \) \, \( - 1 \, - 1 \)\
U & \( d \, - 1 \) & \( 1 \/ 2 + d \, 1 \) & - & \( 3 \/ 2 + d \, - 1 \)\
L & \( - d \, - 1 \) & \( - 1 \/ 2 - d \, - 1 \) & + & \( - 3 \/ 2 - d \, - 1 \) $ <j:particle-list>]

The internal order puts the height-$1$ outer first in each $D$ row, and the short first in $U \, L$.
  To verify the table, a cycled $D$ pair has fields $Psi_3 Psi_(j - 1)$ at $x + i$ and its coefficient at $x$.
  The recurrences give the four dresses

$ H \( x \) \, quad frac(H \( x \), H \( x + i \) H \( x - i \)) \, quad frac(H \( x \), H \( x + i \)) \, quad -
  frac(H \( x \), H \( x - i \)) . $

For $U$ at folded coordinate $v = x + i \( 1 \/ 2 + d \)$ the dress is $- H \( v + i \)^(- 1)$;
  for $L$ at its pre-cycling coordinate $v = x - i \( 1 \/ 2 + d \)$ it is $H \( v - i \)^(- 1)$.
  These are exactly the listed heights and signs.

At this stage fix $d = d_(-) < 0$ with $\| d_(-) \|$ sufficiently small.
  Starting from the outgoing ordered strip in the preceding subsection,
  move the folded $U$ coordinates to imaginary part $1 \/ 2 + d_(-)$, the cycled $L$ coordinates to $1 \/ 2 -
  d_(-)$, and the cycled $D$ coordinates to $1$ by a limit from below.
  Repeated pairs retain close separations until their analytic coincident limits are taken.
  These moves remain in the ordered strip. The original $b$ coefficients have no poles there by their $U_delta$
  products, and a possible dual-pair singularity between $D$ pairs is cancelled by the zero from their common
  first field. In particular the extreme $H$ heights have absolute value $3 \/ 2 - \| d_(-) \| < 3 \/ 2$.
  The moves and the table thus hold for every fixed coefficient before Gaussian integration.

Let $e_1 \, e_2$ be the species basis. For a particle $j$ in species $sigma$ define $q_j$ as its total short
  charge times $e_sigma$. Inspection of the table shows that the total of its $H$-charges is the same vector.
  The six values are $\( 1 \, - 1 \, 0 \, 0 \, - 1 \, - 1 \) e_sigma$.
  Consequently the trace constraints (5.6) imply, for every contributing term,

#[#set math.equation(numbering: n => "(5.15)")
 $ sum_j q_j = bold(ell) = \( ell_1 \, ell_2 \) in 8 bb(Z) \( 1 \, - 1 \) . $ <c7:gas-charge-closure>]

This constraint is retained in all sums below.

=== 5.5 Absolute integration on the first contours <absolute-integration-on-the-first-contours>

We first record the covariance used in the absolute estimate.
  Write $P_(+)$ for the common and $P_(-)$ for the difference species projection.
  At nonzero frequency the covariance of $xi$ has symbol $2 pi sans(h) \( k \) \/ k$, where

#[#set math.equation(numbering: n => "(5.16)")
 $ sans(h) = g E^2 \( I + g E \)^(- 1) \, wide cal(S) = P_(-) + P_(+) \/ 9 \, wide cal(L) = I -
   cal(S) = \( 8 \/ 9 \) P_(+) \,\
sans(h) \( k \) \/ k = cal(S) \/ k^2 + c_0 + O \( k^2 \) \, wide c_(0 \, -) = - 17 \/ 12 \, quad c_(0 \, +) = -
  25 \/ 108 . $ <c7:xi-symbol>]

For example, $E = 1 \/ k + 7 k \/ 12 + O \( k^3 \)$, $g_(+) = k \/ 8 - 43 k^3 \/ 96 + O \( k^5 \)$, and $g_(-) =
  1 \/ \( 2 k \) - 17 k \/ 24 + O \( k^3 \)$ give these expansions. With $t = e^(- k)$ the exact channel symbols are

$ sans(h)_(+) = frac(t^4 \( t + 1 \), \( 1 - t \) \( 1 + t^2 \) \( 1 - t + t^2 \) \( 1 + t + t^2 \)^2) \, wide
  sans(h)_(-) =
  frac(t^3 \( 4 t^4 - 7 t^3 + 10 t^2 - 7 t + 4 \), \( 1 - t \) \( 1 + t \) \( 1 + t^2 \) \( 1 - t + t^2 \)^3) . $

Define $K^r$ on the real line by transform $2 pi \( sans(h) \/ k - cal(S) \/ k^2 \)$.
  It is continuous, even, and exponentially decaying. More precisely, for $s > 0$,

#[#set math.equation(numbering: n => "(5.17)")
 $ K^r \( s \) = sum_(j gt.eq 1) P_j \( s \) e^(- pi j s \/ 6) \, $ <c7:residual-series>]

where the matrix polynomials have uniformly bounded degree and coefficients of at most polynomial growth.
  The series also defines $K^r$ for $Re s > 0$. To see this,
  the transform is removable at zero and its other poles lie on the imaginary $i pi \/ 6$ grid with bounded order.
  Shift Fourier inversion to lines between successive grid points.
  On those lines $sans(h)$ is $O \( e^(- 3 \| Re k \|) \)$ uniformly,
  while the subtracted rational term is integrable; the residues give (5.17).
  The principal parts of the rational functions of $e^(- k)$ are periodic along the grid,
  which gives the stated coefficient bounds.

The form convenient at coincident horizontal coordinates is

#[#set math.equation(numbering: n => "(5.18)")
 $ K_0 \( s \) = K^r \( 0 \) + integral_(bb(R)) \( cos \( k s \) - 1 \) sans(h) \( k \) frac(d k, k) . $ <c7:K0>]

It equals $K^r \( s \) - pi \| s \| cal(S)$ for real $s$. It is analytic on $\| Im s \| < 3$.
  Since the leading high-frequency term is $4 P_(-) e^(- 3 k)$ for $k > 0$,
  its continuation to $\| Im s \| < 4$ has the sole singular part

#[#set math.equation(numbering: n => "(5.19)")
 $ - 4 P_(-) log \( 1 + s^2 \/ 9 \) . $ <c7:K0-singular>]

In particular the exponentials between integer species charges are meromorphic in that wider strip.
  The zero-mean periodic covariance is

#[#set math.equation(numbering: n => "(5.20)")
 $ K_T \( s \) = sum_(j in bb(Z)) K^r \( s + j T \) + pi \( s^2 \/ T - \| s \| + T \/ 6 \) cal(S) -
   2 pi c_0 \/ T \, wide - T < s < T . $ <c7:periodic-K>]

Fourier series proves this identity. At complex shifts the term involving $K^r \( s \) -
  pi \| s \| cal(S)$ is read as $K_0 \( s \)$ and the other terms continue analytically.

The following calculation concerns one finite list of $H$-charges.
  Write $r_i$ for its signed species vector, $w_i = x_i + i a_i$, and

$ X = sum_i r_i w_i \, wide X^(\( 2 \)) = sum_i r_i w_i^2 . $

All squares in analytic formulas are bilinear. Wick’s formula for this list is
  $exp \( 1 / 2 sum_(i \, l) r_i^t K_T \( w_l - w_i \) r_l \)$. Under (5.15), $cal(S) bold(ell) = bold(ell)$.
  The quadratic and constant terms of (5.20) therefore contribute

#[#set math.equation(numbering: n => "(5.21)")
 $ exp #h(-0.16667em)
   [pi / T \( bold(ell) dot.op X^(\( 2 \)) - X^t cal(S) X \) + frac(pi T, 12) \| bold(ell) \|^2 + frac(17 pi, 12
   T) \| bold(ell) \|^2] . $ <c7:wick-quadratic>]

The first term cancels the $- g_w w_i^2 \/ 2$ dresses. The remaining winding terms cancel exactly:
  (5.11) cancels the term of order $T$, and the coefficients of $pi \| bold(ell) \|^2 \/ T$ from Wick,
  the $5 g_w \/ 8$ dresses, the modular scalar, and the normalized regulator weight are respectively

$ 17 / 12 + 15 / 12 - 8 / 12 - 24 / 12 = 0 . $

The common factor $e^(2 pi m \/ T)$ in $H$ also cancels, since $upright(bold(1)) dot.op bold(ell) = 0$.

We apply this algebra first to an absolute moment on the $d_(-)$ contours.
  Write $r_i = t_i e_(sigma_i)$ with $t_i in bb(R)$. Because each $xi_sigma$ is real on the real line,

$ lr(|e^(sum_i t_i xi_(sigma_i) \( x_i + i a_i \))|) = e^(sum_i t_i Re xi_(sigma_i) \( x_i + i a_i \)) . $

Writing $r @ w$ for a signed species charge $r$ at $w$, its expectation under the tilted law is precisely the
  ordinary Wick exponential obtained by replacing each signed charge by two signed halves,

#[#set math.equation(numbering: n => "(5.22)")
 $ r_i @ \( x_i + i a_i \) quad mapsto quad 1 / 2 r_i @ \( x_i + i a_i \) + 1 /
   2 r_i @ \( x_i - i a_i \) . $ <c7:symmetrized-charges>]

No sign of $t_i$ is changed. This is a finite real Gaussian moment:
  the largest height is $3 \/ 2 - \| d_(-) \|$, so the high-frequency variance has a positive exponential gap
  against $sans(h)_(-) \( k \) = O \( e^(- 3 k) \)$. In channel $epsilon = plus.minus$,
  the resulting height kernel is $- sans(h)_epsilon \( k \) cosh \( a_i k \)
  cosh \( a_l k \)$ in the negative logarithm of the residual magnitude. No continuation term is present.

The symmetrized list has the same total $bold(ell)$, and its two moments are

#[#set math.equation(numbering: n => "(5.23)")
 $ tilde(X) = Re X = sum_i r_i x_i \, wide tilde(X)^(\( 2 \)) = Re X^(\( 2 \)) =
   sum_i r_i \( x_i^2 - a_i^2 \) . $ <c7:symmetrized-moments>]

In particular the second moment retains $- a_i^2$. Substituting these moments in (5.21) proves exactly the same
  winding cancellations for the absolute moment. Once those cancellations are made,
  $bold(ell)$ remains fixed by (5.15); it is not an additional unrestricted summation index.

The heat sum is bounded before integration over constant modes.
  Write $theta = theta.alt + i tau$, $X = Y + i Z$, and $bold(alpha)_(upright(bold(p))) = a_(upright(bold(p))) +
  i tau upright(bold(1))$ with $a_(upright(bold(p)))$ real. For each heat summand,

#[#set math.equation(numbering: n => "(5.24)")
 $ lr(|e^(- T bold(alpha)_(upright(bold(p)))^2 \/ \( 4 pi \) - bold(alpha)_(upright(bold(p))) dot.op X)|) =
   e^(- T a_(upright(bold(p)))^2 \/ \( 4 pi \) - a_(upright(bold(p))) dot.op Y)
   e^(T tau^2 \| upright(bold(1)) \|^2 \/ \( 4 pi \) + tau upright(bold(1)) dot.op Z) . $ <c7:absolute-heat>]

The second factor costs $e^(O_theta \( T + N \))$, where $N$ is particle count,
  because the height lists are bounded. Apply the triangle inequality to the heat sum.
  At fixed $k_0 = p_1 + p_2$, the opposite uniform mode and the remaining integer sum unfold to $d
  u \/ \( 2 pi \)$ on $\( u \, - u \)$. The common Gaussian has covariance $pi P_(+) \/ \( 4 T \)$.
  Its real completion, including $e^(- pi Y^t cal(S) Y \/ T)$, gives

#[#set math.equation(numbering: n => "(5.25)")
 $ sqrt(8 \/ 9) /
   sqrt(2 T) sum_(k_0 in bb(Z))
   e^(- T beta_theta.alt^t cal(L) beta_theta.alt \/ \( 4 pi \) - beta_theta.alt^t cal(L) Y) \, wide
   beta_theta.alt = \( theta.alt + pi k_0 \) upright(bold(1)) . $ <c7:real-heat-completion>]

Here $Y_(+) = upright(bold(1)) dot.op Y \/ sqrt(2)$ and $Y_(-) = \( 1 \, - 1 \) dot.op Y \/ sqrt(2)$.
  The opposite integral contributes $\( 2 T \)^(- 1 \/ 2) e^(pi Y_(-)^2 \/ T)$,
  and the common integral contributes $sqrt(8 \/ 9) e^(pi Y_(+)^2 \/ \( 9 T \))$ as well as the displayed terms.
  These two exponentials cancel the corresponding parts of $- pi Y^t cal(S) Y \/ T$.
  The two factors $sqrt(T)$ from Poisson summation have been kept outside this calculation.

For this real majorant, order the real particle coordinates and put $Q \( x \) = sum_(x_j < x) q_j$.
  The real long-distance short and $H$ terms are

$ pi sum_(u < j) \( x_j - x_u \) q_u^t cal(L) q_j . $

For each $k_0$ summand in (5.25), its exponent together with these terms is the exponent of the real state square
  below, with $p \( x \) = p_0 - Q \( x \)$ and $p_0 in bb(Z)^2$ having sum $k_0$:

$ exp #h(-0.16667em)
  [- pi integral_T \( p + \( theta.alt \/ \( 2 pi \) \) upright(bold(1)) \)^t cal(L) \( p + \( theta.alt \/ \( 2
  pi \) \) upright(bold(1)) \) thin d x] . $

Closure holds modulo $8 bb(Z) \( 1 \, - 1 \)$ by (5.15). For each such path,
  the base real product consists of this state square, the short and outer local and residual magnitudes,
  and the local and residual Wick factors from the complete symmetrized $H$ lists.
  It is the weight $W_(d_(-) \, theta.alt)^(upright("pre")) \( cal(Y) \, p \)$ in Theorem 15,
  with state angle $theta.alt = Re theta$. The explicit second factor of (5.24) is kept outside this product and
  bounded separately by $e^(C_Omega \( T + N \))$ on a compact set $Omega$ of angles.
  The height phases have disappeared under the modulus, so this base product has no Berry factor.
  In particular no signed phase formula is applied to the symmetrized list, whose $H$ height moment is zero.

At fixed $m \, T \, d_(-)$ the deterministic $B_T$ factors on these contours have a finite bound per particle.
  The pre-collision clause of Theorem 15, after absorbing the heat factor $e^(C_Omega \( T + N \))$ and the
  deterministic linear count cost, therefore proves the required absolute summability on its domain of integer
  periods for every finite $m$. The allowed periods are independent of $m$; only the absorbed count cost changes.
  More explicitly, let $nu$ index a finite current monomial with specified species and roots,
  with the winding fixed by (5.15). Let $I_(nu \, upright(bold(p)))$ be its full conditional scalar coefficient
  after the common factor in (5.12) is extracted. It includes the exponential factorial, modular field, pair,
  and image factors, table signs and $H$ dresses, the $upright(bold(p))$ heat factor,
  and the original winding probability. Then

#[#set math.equation(numbering: n => "(5.26)")
 $ sum_nu sum_(upright(bold(p)) in bb(Z)^2) integral_(Gamma_(-)^nu) integral d mu_(upright("const")) thin
   bb(E)_(upright("tilt")) \| I_(nu \, upright(bold(p))) \| < oo . $ <c7:pre-tonelli>]

Here $Gamma_(-)^nu$ is the product of the fixed $d_(-)$ contours, integrated with product arclength,
  equivalently $product_j d x_j$ on the shifted horizontal lines,
  and $d mu_(upright("const"))$ is the original common-Gaussian and opposite-uniform constant-mode law.
  To see the final summation explicitly, if $n_j$ counts particles in unit box $j$ and
  $p_(c \, j) = \( p_1 + p_2 \) \/ sqrt(2)$ is the state at its left endpoint,
  stability bounds the magnitude by $exp \( C T - c sum_j \( n_j^2 + p_(c \, j)^2 \) \)$,
  up to the absorbed linear costs. For a finite label count $J$, every box contributes at most a sum of the form

$ sum_(n gt.eq 0) frac(J^n, n !) e^(- c n^2 + A_(m \, T \, d_(-)) n) < oo . $

The initial-state sum is Gaussian in $k_0 = sqrt(2) p_(c \, 0)$ and has eight quotient classes for each $k_0$.
  Dropping other configuration constraints only enlarges this bound. There is no further winding multiplicity.
  This proves (5.26), locally uniformly for $theta$ in compact sets.
  Its constants may depend on the fixed $d_(-)$; it asserts no uniform estimate as $d_(-) arrow.t 0$.

Tonelli and Fubini now pass the conditional current identities through the Gaussian and constant-mode
  integrations. This is the point at which the regulator becomes the sum of the signed Wick-integrated terms on
  the first contours. The conditional trace calculation alone was not used for that interchange.

=== 5.6 Wick integration and the collision residue <wick-integration-and-the-collision-residue>

For each signed term furnished by (5.26), use the original integer $H$-charges in Wick’s formula.
  Equation (5.21) and its winding cancellations now hold with complex $X \, X^(\( 2 \))$.
  The signed constant-mode integration is the analytic version of (5.25):

#[#set math.equation(numbering: n => "(5.27)")
 $ sqrt(8 \/ 9) / sqrt(2 T) sum_(k_0 in bb(Z)) exp \[ - T beta^t cal(L) beta \/ \( 4 pi \) - beta^t cal(L) X \] \,
   wide beta = \( theta + pi k_0 \) upright(bold(1)) . $ <c7:signed-heat-completion>]

The two Poisson factors $sqrt(T)$ remain outside. For a fixed finite field list the full heat sum converges
  normally on compact contour regions, with a bound of the form $e^(- c T k_0^2 + C_N \| k_0 \|)$.
  Retaining this sum gives the horizontal periodicity inherited from the original current expression.
  This periodic meromorphic expression is the one used in the contour moves;
  an individual heat summand need not be periodic.

We make the local normalization explicit before calculating the residue.
  For a basic type $v$, let $N_s \( v \) \, N_o \( v \)$ be its field counts,
  let $I_v$ count outer-before-short pairs inside its displayed internal order, and let $tau_v$ be its table sign.
  The global outer-before-short sign from (5.7) can be assigned locally as $\( - 1 \)^(I_v)
  i^(N_s \( v \) med mod med 2)$. Indeed a particle has the same parity of short and outer counts.
  If $N_(upright("odd"))$ particles have odd short count, the interparticle inversion exponent is
  $N_(upright("odd")) \( N_(upright("odd")) - 1 \) \/ 2$. The trace constraint makes $N_(upright("odd"))$ even in
  each species, and then $\( - 1 \)^(N_(upright("odd")) \( N_(upright("odd")) - 1 \) \/ 2) = i^(N_(upright("odd")))$.

Put $K_(upright("diag")) \( s \) = \( K_0 \( s \) \)_(sigma sigma)$, the same for either species,
  and $kappa_j^(upright("loc")) = K_(upright("diag")) \( j i \)$ for $j = 0 \, 1 \, 2$.
  For each type $v$, denote its ordered short, outer, and $H$ lists by $cal(S)_v \, cal(O)_v \, cal(H)_v$.
  The constant local factor of a basic particle is

#[#set math.equation(numbering: n => "(5.28)")
 $ gamma_v =  & frac(a_(*), 2 pi i) tau_v \( - 1 \)^(I_v) i^(N_s \( v \) med mod med 2)
   (frac(2 pi, a_(*)))^(N_s \( v \) \/ 2) (frac(pi, 4 a_(*)))^(N_o \( v \) \/ 2)\
 & times
   product_(i < l upright(" in ") cal(S)_v) \[ 2 sinh \( pi i \( a_l - a_i \) \) \]^(epsilon.alt_i epsilon.alt_l)
   product_(i < l upright(" in ") cal(O)_v) \[ tanh \( pi i \( a_l - a_i \) \/ 4 \) \]^(epsilon.alt_i epsilon.alt_l)\
 & times
   exp #h(-0.16667em)
   (1 / 2 sum_(i \, l upright(" in ") cal(H)_v) r_i r_l K_(upright("diag")) \( i \( a_l - a_i \) \)) .
   $ <c7:local-factor-rule>]

The factor uses $K_0$ within a particle; image factors remain outside it.
  Since $a_(*) \/ \( 2 pi i \) = - i \/ 12$, the short and outer field norms are $sqrt(12)$ and $sqrt(3 \/ 2)$.
  Substitution gives

#[#set math.equation(numbering: n => "(5.29)")
 $ gamma_P = gamma_U & = - sqrt(2) / 4 e^(kappa_0^(upright("loc")) \/ 2) \, & gamma_L & = sqrt(2) /
   4 e^(kappa_0^(upright("loc")) \/ 2) \,\
gamma_M & = - sqrt(2) /
  4 e^(3 kappa_0^(upright("loc")) \/ 2 - 2 kappa_1^(upright("loc")) + kappa_2^(upright("loc"))) \, &
  gamma_(O_(+)) = gamma_(O_(-)) & = - 1 / 8 e^(kappa_0^(upright("loc")) - kappa_1^(upright("loc"))) .
  $ <c7:basic-activities>]

For the $O$ rows the outer base at height difference $- 1$ is $- i$;
  its inverse for $O_(-)$ accounts for the equality of the two constants.
  In particular $P$ and $M$ have nonzero local factors.

Choose a fixed $d_(+) > 0$ in the post-collision stability range, with $\| d_(-) \| < d_(+)$;
  both are small enough for the strips used below. In each finite term move the $U$ short-center contours upward
  first, from height $d_(-)$ to $d_(+)$. They cross the $L$ short-center contours, initially at height $- d_(-)$.
  Then move the remaining $L$ contours downward to $- d_(+)$ and move any fused centers to the real line.
  A lower horizontal contour minus an upper one is the positive boundary of the intervening cylinder strip.
  Thus a crossed pole contributes $+ 2 pi i$ times its residue in the $U$ center.

For a same-species $U \, L$ pair write $delta = z_U - z_L$, where $z_U \, z_L$ are their short centers.
  Their ordered fields are

$ \( z_U \, - \)_s \, quad \( z_U + i \/ 2 \, + \)_o \, quad \( z_L \, - \)_s \, quad \( z_L - i \/ 2 \, - \)_o . $

Their $H$-charges are $- 1$ at $z_U + 3 i \/ 2$ and $z_L - 3 i \/ 2$.
  The joint table sign is negative and the ordered union has one outer-before-short inversion,
  so those two signs cancel. Its two shorts have even parity.
  The current and field-norm factors together are $- 1 \/ 8$. Therefore the full local germ is

#[#set math.equation(numbering: n => "(5.30)")
 $ - 1 / 8 thin 2 sinh \( - pi delta \) thin coth #h(-0.16667em) (- frac(pi \( delta + i \), 4))
   exp \[ K_(upright("diag")) \( 0 \) + K_(upright("diag")) \( delta + 3 i \) \] . $ <c7:fusion-germ>]

Define $K_(upright("diag"))^(upright("reg")) \( s \) = K_(upright("diag")) \( s \) +
  2 log \( 1 + s^2 \/ 9 \)$ by continuation from the inner strip. By (5.19) it is regular at $3 i$, and

$ e^(K_(upright("diag")) \( delta + 3 i \)) =
  frac(81 e^(K_(upright("diag"))^(upright("reg")) \( delta + 3 i \)), delta^2 \( delta + 6 i \)^2) tilde.op -
  frac(9, 4 delta^2) e^(K_(upright("diag"))^(upright("reg")) \( 3 i \)) . $

Using $2 sinh \( - pi delta \) tilde.op - 2 pi delta$ and $coth \( - i pi \/ 4 \) = i$,
  the residue of (5.30) in $z_U$ is

$ - frac(9 pi i, 16) exp \[ K_(upright("diag")) \( 0 \) + K_(upright("diag"))^(upright("reg")) \( 3 i \) \] . $

The fused local activity is hence

#[#set math.equation(numbering: n => "(5.31)")
 $ gamma_(F_(upright("pair"))) =
   frac(9 pi^2, 8) exp \[ K_(upright("diag")) \( 0 \) + K_(upright("diag"))^(upright("reg")) \( 3 i \) \] > 0 .
   $ <c7:fused-activity>]

The singular power is the integer $- 2$, so it has no branch sign; also $d delta \/ d z_U = 1$.
  The regular value is real by continuation along $s = i y$ with $y < 3$, proving the last inequality.

Call this fused particle $F_(upright("pair"))$. Its internal order is $U$ then $L$, and its complete lists,
  at its real center $x$, are

#[#set math.equation(numbering: n => "(5.32)")
 $ upright("shorts") & upright("outers") & H upright("-charges")\
\( 0 \, - 1 \) \, \( 0 \, - 1 \) & \( 1 \/ 2 \, 1 \) \, \( - 1 \/ 2 \, - 1 \) & \( 3 \/ 2 \, - 1 \) \, \( - 3 \/
  2 \, - 1 \) . $ <c7:fused-list>]

These are the lists $cal(S)_(F_(upright("pair"))) \, cal(O)_(F_(upright("pair"))) \,
  cal(H)_(F_(upright("pair")))$. The local activity has already taken the residue of the entire factor (5.30);
  no internal pair product is evaluated at its coincident short centers.
  External interactions and nonzero images simply evaluate at equality and combine into these union lists.
  The constant (5.31) is independent of $T \, m$ and the state.
  In particular the local germ uses $K_0$, before any long-distance separation;
  the corresponding constant from $K^r$ alone would have an extra phase.

Here are all possible divisor crossings in these moves. From (5.19), two extreme $H$-charges of sign $-
  1$ in the same species give a double pole at height difference $3$;
  in different species they give a double zero. The two negative shorts in a $U \, L$ pair give one zero,
  leaving exactly the simple same-species pole used above. Against a fused particle,
  $U$ or $L$ has two short zeros and at most one double extreme-height pole.
  Two fused particles have four short zeros and at most two such double poles.
  Thus these later encounters are regular and cannot create a second fusion of the same particle.
  A same-species $U \, U$ or $L \, L$ coincidence has like-charge short and outer zeros and equal $H$ heights;
  a cross-species coincidence has only the regular equal-height $H$ factor. Neither has a pole.

Among $D$ rows, a $P \, M$ coincidence has one inverse short factor,
  cancelled by the zero of their common height-$1$ outer field.
  An $O_(+) \, O_(-)$ coincidence has one inverse height-$0$ outer factor,
  cancelled by the same common outer zero. The other $D$ coincidences have no uncancelled inverse factor.
  Their $H$ height differences are at most $2$. Mixed $D$ and $U \, L \,
  F_(upright("pair"))$ $H$ differences are at most $5 \/ 2 + d_(+) < 3$;
  the other outer differences remain below $2$, and no other short divisor is crossed. Finally

#[#set math.equation(numbering: n => "(5.33)")
 $ B \( v + i \) B \( v - i \) = B \( v \) \, wide B \( v + 3 i \) = B \( v \)^(- 1) $ <c7:B-recurrences>]

gives the simplified $D$ factors $B \( x \) \, 1 \, B \( x - i \) \, B \( x + i \)$ and makes the $U \,
  L$ factors cancel at fusion. The zeros of $B$ are at $i \( plus.minus 1 \/ 2 + 6 n \)$ and its poles are at
  $i \( plus.minus 5 \/ 2 + 6 n \)$, $n in bb(Z)$. The moving inverse $U \,
  L$ arguments have heights in $\( 1 \, 2 \)$ and $\( - 2 \, - 1 \)$, respectively,
  while the $D$ arguments have heights $0 \, plus.minus 1$.
  Thus these factors meet no divisor during the collision moves.
  The same statements hold for their periodized products. They account for every pair of rows in (5.14) and (5.32).

At fixed particle number the preceding statements are identities of periodic meromorphic contour integrals.
  Each $U$ may fuse with at most one $L$, and fusions occur only within a species.
  For $u \, l$ original particles and $r$ disjoint pairs the multiplicity is

#[#set math.equation(numbering: n => "(5.34)")
 $ frac(binom(u, r) binom(l, r) r !, u ! thin l !) = frac(1, \( u - r \) ! \( l - r \) ! r !) . $ <c7:fusion-factorial>]

There is no additional $1 \/ 2$, because $U \, L$ are distinct and the residue is always in the $U$ center.
  Reordering whole bilinears has even parity, and each matching gives the same ordered union and sign.
  Thus the formula also counts the absolute values of the individual residue contributions.

=== 5.7 The post-collision data and endpoint summability <the-post-collision-data-and-endpoint-summability>

From now on write $d = d_(+) > 0$. For a type $v$ define its scalar charge and height moments by

$ q_v = sum_(\( a \, epsilon.alt \) in cal(S)_v) epsilon.alt = sum_(\( a \, r \) in cal(H)_v) r \, wide s_v =
  sum_(\( a \, epsilon.alt \) in cal(S)_v) a epsilon.alt \, wide b_v = sum_(\( a \, r \) in cal(H)_v) a r . $

For a particle of this type in species $sigma$, the vectors used below are $q_j = q_v e_sigma$, $s_j =
  s_v e_sigma$, and $b_j = b_v e_sigma$. Let $omega_v$ be the product of its $B$ factors with the signed $H$
  powers. The recurrences (5.33) give the complete table

#[#set math.equation(numbering: n => "(5.35)")
 $ v & q_v & s_v & b_v & omega_v \( x \)\
P & 1 & 1 \/ 2 & 0 & B \( x \)\
M & - 1 & - 1 \/ 2 & 0 & 1\
O_(+) & 0 & 0 & - 1 & B \( x - i \)\
O_(-) & 0 & 0 & 1 & B \( x + i \)\
U & - 1 & - d & - 3 \/ 2 - d & B \( x + i \( 3 \/ 2 + d \) \)^(- 1)\
L & - 1 & d & 3 \/ 2 + d & B \( x - i \( 3 \/ 2 + d \) \)^(- 1)\
F_(upright("pair")) & - 2 & 0 & 0 & 1 . $ <c7:particle-data>]

The periodized product is denoted $omega_(v \, T)$, with value $1$ in the two constant rows.
  The original deterministic factor is exactly $omega_(v \, T) \( x \)^m$.
  These simplified expressions also specify the value when separate factors in a ratio have cancelling zeros and
  poles. The physical fused particle has charge $- 2 e_sigma$;
  the normalized half-fused vector used in the matrix proof of stability is only a coordinate in that proof.

For positive real separation $x$ and species-labelled types $u \, v$,
  define the forward residual factor using their complete lists by

#[#set math.equation(numbering: n => "(5.36)")
 $ cal(R)_(u v) \( x \) =  & product_(\( a \, epsilon.alt \) in cal(S)_u\
\( b \, epsilon.alt' \) in cal(S)_v\
sigma_u = sigma_v) \[ 1 - e^(- 2 pi \( x + i \( b - a \) \)) \]^(epsilon.alt epsilon.alt')\
 & times product_(\( a \, epsilon.alt \) in cal(O)_u\
\( b \, epsilon.alt' \) in cal(O)_v\
sigma_u = sigma_v) \[ tanh \( pi \( x + i \( b - a \) \) \/ 4 \) \]^(epsilon.alt epsilon.alt')\
 & times exp #h(-0.16667em) [sum_(\( a \, r \) in cal(H)_u\
\( b \, r' \) in cal(H)_v) r r' e_(sigma_u)^t K^r \( x + i \( b - a \) \) e_(sigma_v)] . $ <c7:forward-residual>]

An empty product is one. The series (5.17) and the logarithmic short and outer expansions make its log
  exponentially decaying at large $x$. On a periodic configuration,
  its forward product takes each particle in one period as source and every strictly later particle in the
  periodized sequence as target. In particular it includes all nonzero self-images.
  Only the true diagonal at separation zero is omitted.

We next justify summing the finite contour identities. For each summand of (5.27), write $beta = beta_theta.alt +
  i tau upright(bold(1))$ and $X = Y + i Z$. Its modulus is the real heat summand with $theta.alt$ and $Y$,
  times
  $exp \[ T tau^2 upright(bold(1))^t cal(L) upright(bold(1)) \/ \( 4 pi \) + tau upright(bold(1))^t cal(L) Z \]$.
  On a compact $theta$ set the latter costs $e^(O_theta \( T + N \))$.
  For distinct sorted particles let $A_(u v) \( x \)$ be the direct pair factor obtained from
  $cal(R)_(u v) \( x \)$ by replacing each short base by $2
  sinh \( pi \( x + i \( b - a \) \) \)$ and each $K^r$ by $K_0$.
  The relation $K_0 \( s \) = K^r \( s \) - pi s cal(S)$ on $Re s > 0$ gives directly

$ \| A_(u v) \( x \) \| = e^(pi x q_u^t cal(L) q_v) \| cal(R)_(u v) \( x \) \| . $

All height terms in the ratio are phases, also after continuation across height $3$ for the integer $H$-charges.
  The images are already residual factors. The real long-distance part therefore completes into the common state
  square used above, and the remaining pair magnitudes are exactly $\|
  cal(R)_(u v) \|$ from the actual integer height lists. The local magnitudes are those of (5.29) and (5.31).
  This is exactly the post-collision real pair/state/local weight estimated by Theorem 15.
  The bounded imaginary-angle costs are linear in the count and are absorbed there.

The deterministic factors require no added count cost on these contours.
  Writing $z = cosh \( pi \( x + i a \) \/ 3 \)$ and $r = sqrt(3) \/ 2$ shows $\| z - r \| < \| z +
  r \|$ precisely when $cos \( pi a \/ 3 \) > 0$. Hence $\| B \( x + i a \) \| < 1$ for $\| a \| < 3 \/ 2$ and $\|
  B \( x + i a \) \| > 1$ just beyond those lines. Every nonconstant row of (5.35) has $\| omega_v \( x \) \| <
  1$, and this remains true image by image. The post-collision stability bound and the same count and state
  summation used in (5.26) therefore prove absolute summability at this fixed $d_(+)$ for all supported periods.

Each finite term has already been deformed with its residues.
  Equation (5.34) shows that the sum of their absolute residue contributions is bounded by the ordinary
  post-collision factorial series, so the two endpoint bounds permit summation of all those identities.
  No estimate uniform between $d_(-)$ and $d_(+)$ is required.
  In particular the raw Gaussian field was evaluated only on the first contours;
  the contour crossing used its Wick-integrated meromorphic functions.

=== 5.8 The exact horizontal gas <the-exact-horizontal-gas>

It remains to express each signed post-collision term in variables local to the horizontal direction.
  Order its distinct real centers in one period. For a positive separation $s = x + i \( b - a \)$,
  the full short factor splits as $2 sinh pi s = e^(pi s) \( 1 - e^(- 2 pi s) \)$, and $K_0 \( s \) =
  K^r \( s \) - pi s cal(S)$ on $Re s > 0$. Keep the full $K_0$ within a particle.
  For distinct particles $u < j$, summing the separated linear terms from their lists gives

$ pi sum_(u < j) \( x_j - x_u \) q_u^t cal(L) q_j + i pi sum_j \( s_j - cal(S) b_j \)
  dot.op \( Q \( x_j - \) + Q \( x_j + \) - bold(ell) \) \, wide Q \( x \) = sum_(x_j < x) q_j . $

The residual factors, including all images, are precisely (5.36).

Choose $p_0 in bb(Z)^2$ with $p_(0 \, 1) + p_(0 \, 2) = k_0$ and put $p \( x \) = p_0 - Q \( x \)$.
  The real-coordinate linear term above and the heat and mean terms of (5.27) complete to

$ - pi integral_T \( p + \( theta \/ \( 2 pi \) \) upright(bold(1)) \)^t
  cal(L) \( p + \( theta \/ \( 2 pi \) \) upright(bold(1)) \) thin d x . $

This follows by expanding the square, using $integral_T Q thin d x = T bold(ell) -
  sum_j q_j x_j$ and $cal(L) bold(ell) = 0$. The imaginary terms become

$ - i pi sum_j \( s_j - cal(S) b_j \) dot.op \( p \( x_j - \) + p \( x_j + \) \) -
  i theta upright(bold(1))^t cal(L) sum_j b_j . $

To check the discarded phase exactly, (5.35) gives

$ s_v - b_v = \( 1 \/ 2 \, - 1 \/ 2 \, 1 \, - 1 \, 3 \/ 2 \, - 3 \/ 2 \, 0 \) quad upright("for ") P \, M \,
  O_(+) \, O_(-) \, U \, L \, F_(upright("pair")) . $

It is congruent to $q_v \/ 2$ modulo integers, so its total is integral in each species by (5.15).
  The phase left by the substitution is

$ 2 pi p_0 dot.op sum_j \( s_j - b_j \) - pi bold(ell) dot.op sum_j \( s_j - b_j \) \, $

a multiple of $2 pi$. Shifting $p_0$ by $8 \( 1 \, - 1 \)$ leaves each local weight unchanged.
  For a fixed sum $k_0$, the eight classes modulo this shift have the same full-tour weight:
  shifting between them by $\( 1 \, - 1 \)$ changes the product phase by $2 pi$ times the same integral total.
  This explains the factor $1 \/ 8$ in the normalization below.

This computation also checks the fused local phase. If $U$ precedes $L$ and $s = z_L - z_U = x - 2 i d$,
  their full short and $H$ factors divided by their residual factors give

$ e^(pi s - pi cal(S)_(sigma sigma) \( s - 3 i \)) = e^(pi cal(L)_(sigma sigma) x)
  e^(i pi \( 3 cal(S)_(sigma sigma) - 2 d cal(L)_(sigma sigma) \)) . $

The first factor is their pair term in the state square. The second is the product of their local phases for
  successive states $p \, p + e_sigma \, p + 2 e_sigma$; their $theta$ phases cancel since $b_U + b_L = 0$.
  At collision this phase is already part of the full $K_0$ germ (5.30).
  The fused row has $q = - 2$, $s = b = 0$ and therefore requires no further local phase.

We can now define the post-collision gas. Let

$ cal(V) = { 1 \, 2 } times { P \, M \, O_(+) \, O_(-) \, U \, L \, F_(upright("pair")) } . $

A configuration $cal(Y) = \( \( x_j \, v_j \) \)_(j = 1)^N$ consists of a finite number of particles with $0 lt.eq
  x_j < T$ and $v_j in cal(V)$; coincident real positions form a null set and are discarded.
  For $\[ p_0 \] in bb(Z)^2 \/ 8 bb(Z) \( 1 \, - 1 \)$ let $p$ have the jumps $- q_j$ in increasing order,
  using a consistent lift during the period, and impose $p \( T \) = p \( 0 \)$ in the quotient. Define

#[#set math.equation(numbering: n => "(5.37)")
 $ cal(Q)_theta \( cal(Y) \, p \) =  & exp #h(-0.16667em)
   [- pi integral_T \( p + \( theta \/ \( 2 pi \) \) upright(bold(1)) \)^t cal(L) \( p + \( theta \/ \( 2 pi \) \)
   upright(bold(1)) \) thin d x]\
 & times
   product_j exp #h(-0.16667em)
   [- i pi \( s_j - cal(S) b_j \) dot.op \( p \( x_j - \) + p \( x_j + \) \) - i theta upright(bold(1))^t cal(L)
   b_j] . $ <c7:state-weight>]

The weight with the deterministic site factors omitted is

#[#set math.equation(numbering: n => "(5.38)")
 $ W_(d \, theta) \( cal(Y) \, p \) = cal(Q)_theta \( cal(Y) \, p \) product_j gamma_(v_j)
   product_(1 lt.eq j \, k lt.eq N \, med n in bb(Z)\
x_k + n T > x_j) cal(R)_(v_j v_k) \( x_k + n T - x_j \) . $ <c7:horizontal-weight>]

Thus $j = k \, n = 0$ is excluded and every $j = k \, n gt.eq 1$ is included.
  The constants $gamma_v$ use (5.29) or (5.31), independently of the species.
  For the empty configuration the particle and residual products are one, while the state heat factor remains.
  For distinct positions the factors in (5.38) are continuous and nonzero:
  the local activities are nonzero, the short and outer residual bases have no zero or pole at positive real
  separation, and the remaining factors are exponentials.

For counts $\( n_v \)_(v in cal(V))$ with $N = sum_v n_v$,
  use any fixed labeling of those particles in the integral and set

#[#set math.equation(numbering: n => "(5.39)")
 $ Z_(m \, T) = sum_(\( n_v \) in bb(Z)_(gt.eq 0)^(cal(V))) frac(1, product_v n_v !)
   sum_(\[ p_0 \] in bb(Z)^2 \/ 8 bb(Z) \( 1 \, - 1 \)) integral_(\[ 0 \, T \)^N) #h(-0.16667em)
   upright(bold(1))_({ p \( T \) = p \( 0 \) }) W_(d \, theta) \( cal(Y) \, p \) product_(j = 1)^N
   omega_(v_j \, T) \( x_j \)^m thin product_(j = 1)^N d x_j . $ <c7:gas-definition>]

The indicator uses quotient closure. All definitions are independent of the chosen lift by the preceding phase
  check. The absolute endpoint bound proves convergence of this series for the periods in the next proposition,
  locally uniformly for $theta$ in compact sets. The local factors use $K_0$ and the forward product uses $K^r$,
  so no complex convention for $\| s \|$ is needed inside a particle.

#thm([Proposition 5.1.])[
  (Exact gas representation).  #emph[Fix $d_(-) < 0 < d$ in the respective nonzero displacement ranges of
    Theorem 15, with $0 < \| d_(-) \| < d < 1 \/ 2$. Fix also a compact set $Omega subset
    bb(C)$ of values of $theta$. There is an integer $T_0$, independent of $m$,
    such that for every integer $T gt.eq T_0$ and every finite integer $m gt.eq 0$,
    the gas (5.39) converges absolutely, uniformly for $theta in Omega$ at that $m \, T$, and satisfies
#[#set math.equation(numbering: n => "(5.40)")
 $ frak(C)_(m \, T) = c \( T \) e^(m^2 kappa_T) Z_(m \, T) \, wide c \( T \) =
   frac(sqrt(8 \/ 9), 8 sqrt(2 T) thin D_ell) (frac(sqrt(T) D_W, Z_Gamma))^2 D_g \, wide D_ell =
   sum_(j in 8 bb(Z)) e^(- 4 pi j^2 \/ T) . $ <c7:regulator-gas>]

 In particular it holds along $T = b n$ for any fixed integer block length $b gt.eq
   T_0$ and every positive integer $n$. This common period domain allows $T$ to remain fixed while $m$ varies
   through finite integers. The absolute bounds may depend on $m \, T$ and the fixed displacements;
   no bound uniform in $m$ or limiting assertion as $d_(-) arrow.t 0$ or $d arrow.b 0$ is made.]
] <c7:gas-identity>

#proof[
  The conditional trace and oscillator calculation gives each fixed current coefficient,
    with two empty oscillator factors $D_W \/ Z_Gamma$ and two Poisson factors $sqrt(T)$.
    Source removal gives $D_g e^(m^2 kappa_T)$. Equation (5.26) justifies integrating and summing these
    coefficients on the first contours. Their signed Wick and constant-mode integrations give (5.27),
    with factor $sqrt(8 \/ 9) \/ sqrt(2 T)$, and cancel all winding-dependent exponentials, leaving $D_ell^(- 1)$.
  The finite periodic contour identities give precisely the basic and fused terms with constants (5.29)–(5.31).
    Their endpoint absolute bounds and (5.34) justify summing them.
    The signed algebra leading to (5.37)–(5.39) then identifies that sum with $Z_(m \, T)$.
    The eight equal full-tour representatives supply the factor $1 \/ 8$.
    Multiplying the displayed constants proves (5.40) on the supported periods. ◻
]

The table now exposes the properties used by the following sections.
  There are finitely many types with bounded integer jumps; the nonzero $P \,
  M$ activities permit both signs of each species jump. The two types whose site multipliers are exactly one,
  $M \, F_(upright("pair"))$, have strictly negative common charge.
  Every other site multiplier has modulus below one on the post-collision real line.
  The forward residual log has the exponentially decaying finite-degree expansion inherited from (5.17).
  Theorem 15 controls the absolute closed-sequence weights,
  and Section 7 uses these properties to build the horizontal operator.

=== 5.9 The scalar rates <the-scalar-rates>

We finish by calculating the two scalar limits used in that operator argument.
  In terms of $t = e^(- k)$, the eigenvalues of $I + E g$ are

$ frac(\( 1 - t^6 \)^2, \( 1 - t^4 \) \( 1 - t^8 \)) \, wide frac(\( 1 + t^3 \)^4, \( 1 - t^4 \) \( 1 - t^8 \)) . $

Riemann sums have only logarithmic endpoint singularities. Using

$ integral_0^oo log \( 1 - e^(- a k) \) thin d k = - frac(pi^2, 6 a) \, wide
  integral_0^oo log \( 1 + e^(- a k) \) thin d k = frac(pi^2, 12 a) \, $

gives the rates $- 13 pi \/ 144$ for $D_g$ and $11 pi \/ 144$ for each $D_W \/ Z_Gamma$.
  The Gaussian sum has $D_ell = Theta \( sqrt(T) \)$ by comparison with its integral,
  so it and the powers of $T$ are subexponential. Consequently

#[#set math.equation(numbering: n => "(5.41)")
 $ lim_(T arrow.r oo) frac(log c \( T \), T) = pi / 16 . $ <c7:c-rate>]

The symbols in (5.12), with $hat(a) \( - k \) = - hat(a) \( k \)$, similarly give

#[#set math.equation(numbering: n => "(5.42)")
 $ lim_(T arrow.r oo) kappa_T = -
   2 integral_0^oo frac(t \( 1 - t \) \( 1 - t^3 \)^2, \( 1 + t^2 \) \( 1 + t^3 \) \( 1 + t^4 \)) frac(d k, k) =
   2 log frac(2 \( 2 + sqrt(2) \), 9) . $ <c7:kappa-rate>]

Here is the evaluation of the integral. Multiplying its rational function of $t$ by $1 -
  t^24$ gives coefficients $d_j = d_(24 - j)$ for $1 lt.eq j lt.eq 23$, whose first twelve values are

$ \( 1 \, - 1 \, - 1 \, - 2 \, 3 \, 3 \, 1 \, - 4 \, - 3 \, - 1 \, 3 \, 2 \) . $

Their total after reflection is zero. Let $R \( t \)$ denote the rational function in the integrand,
  so $\( 1 - t^24 \) R \( t \) = sum_j d_j t^j$. The grouped partial sum through period $N$ is
  $R \( e^(- k) \) \( 1 - e^(- 24 \( N + 1 \) k) \)$. After division by $k$ it is dominated by $R \( e^(- k) \) \/
  k$, which is integrable because $R \( e^(- k) \) = O \( k^3 \)$ at zero and $O \( e^(- k) \)$ at infinity.
  Dominated convergence therefore justifies the period expansion.
  Frullani’s log difference on each block gives its integral as $- sum_j d_j log \( 24 n + j \)$.
  Pair $j$ with $24 - j$, using exponent $d_12 \/ 2$ at $j = 12$. The normalized product

$ frac(product_(n = 0)^N \( n + a \) \( n + 1 - a \), N ! \( N + 1 \) !) arrow.r
  a product_(n gt.eq 1) \( 1 - a^2 \/ n^2 \) = frac(sin pi a, pi) $

then gives the exponentiated sum of the paired logarithms as $product_(j = 1)^11 sin \( pi j \/ 24 \)^(d_j)$.
  The sine product itself follows, for example, by taking the limit in finite odd sine multiplication

$ frac(sin x, N' sin \( x \/ N' \)) = product_(j = 1)^(\( N' - 1 \) \/ 2)
  (1 - frac(sin^2 \( x \/ N' \), sin^2 \( pi j \/ N' \))) \, wide N' upright(" odd") . $

Writing $s_j = sin \( pi j \/ 24 \)$ and pairing complementary small angles reduces the required product to

$ frac(\( s_11 s_5 \)^2, s_9^2 s_8^4) = frac(2 \( 2 + sqrt(2) \), 9) \, $

which proves (5.42). Proposition 14 combined with the fixed-site regulator limit of Section 4 therefore supplies
  the period limit needed later, always at fixed $m$.

== 6 Stability of the horizontal weights <c7:stability>

The horizontal representation has signed and complex weights. Its use requires an absolute estimate:
  configurations with many particles or a large common charge must have a summable total weight.
  We prove that estimate directly from the signed height lists.
  The estimate applies both to the absolute Gaussian moment before collisions and to the Wick-evaluated gas after
  collisions.

For the post-collision gas, let $W_(d \, theta)$ be the weight (5.38),
  with the deterministic $B_T$-powers omitted. Thus it includes the local constants, the state factor,
  and every forward residual pair factor, including nonzero self-images.
  We next define the precise real product needed before collision.

For a basic label $v$ at a fixed $- 1 \/ 2 < d < 0$, let $tilde(cal(H))_v$ be obtained from its signed $H$-list by
  replacing every entry $\( a \, r \)$ by $\( a \, r \/ 2 \) \, \( - a \, r \/ 2 \)$, retaining multiplicities.
  Evaluate the basic short and outer lists at this same $d$.
  Define $gamma_v^(upright("pre"))$ to be the modulus of the right side of (5.28) with its internal $H$-list
  replaced by $tilde(cal(H))_v$, leaving those short and outer lists unchanged.
  Similarly, for $x > 0$, define $cal(R)_(u v)^(upright("pre")) \( x \)$ as the modulus of the right side of
  (5.36) with both $H$-lists replaced by their tilded lists,
  again leaving the short and outer lists at the same $d$. Thus the internal $H$ self-list is symmetrized as well
  as the external pairs. For example, for $U$ with $a = 3 \/ 2 + d$, its internal $H$-logarithm is

$ 1 / 4 #scale(x: 120%, y: 120%)[\(] K_(upright("diag")) \( 0 \) +
  K_(upright("diag")) \( 2 i a \) #scale(x: 120%, y: 120%)[\)] \, $

which is finite because $\| 2 a \| < 3$; it is generally different from the signed local logarithm
  $K_(upright("diag")) \( 0 \) \/ 2$.

For a configuration $cal(Y) = \( \( x_j \, v_j \) \)_(j = 1)^N$ of basic labels and a compatible state path $p$,
  define, for real $theta.alt$,

#[#set math.equation(numbering: n => "(6.1)")
 $ W_(d \, theta.alt)^(upright("pre")) \( cal(Y) \, p \) :=  & exp #h(-0.16667em)
   [- pi integral_T \( p + \( theta.alt \/ \( 2 pi \) \) upright(bold(1)) \)^t cal(L) \( p + \( theta.alt \/ \( 2
   pi \) \) upright(bold(1)) \) thin d x]\
 & times product_j gamma_(v_j)^(upright("pre")) product_(1 lt.eq j \, k lt.eq N \, med n in bb(Z)\
x_k + n T > x_j) cal(R)_(v_j v_k)^(upright("pre")) \( x_k + n T - x_j \) . $ <j:pre-weight>]

This is a nonnegative product and has no Berry factor. The common scalar prefactors from the real heat completion
  are outside this configuration weight.

#thm([Theorem 6.1.])[
  (Absolute stability at a fixed displacement).  #emph[There is $0 < d_0 < 1 \/ 2$ with the following property.
    Fix a compact set $Theta subset bb(C)$, and fix either a pre-collision displacement $-
    d_0 < d < 0$ or a post-collision displacement $0 < d < d_0$.
    There are constants $c > 0$ and $C < oo$, depending on $d$ and $Theta$,
    such that the following holds for every positive integer $T$ and $theta in Theta$.]
  #emph[Consider a finite configuration $cal(Y)$ with distinct real positions on $bb(R) \/ T bb(Z)$,
    using the six basic labels in the pre-collision case and those labels together with $F_(upright("pair"))$ in
    the post-collision case. Give it a state path $p$ with jumps $-
    q_i$ and closure in $bb(Z)^2 \/ 8 bb(Z) \( 1 \, - 1 \)$. Let $n_j$ be the number of physical particles in
    $\[ j \, j + 1 \)$, and let
$ p_(c \, j) = frac(p_1 \( j + \) + p_2 \( j + \), sqrt(2)) \, wide 0 lt.eq j < T . $

 Then
$ lr(|W_(d \, theta) \( cal(Y) \, p \)|) med lt.eq med exp #h(-0.16667em)
  (C T - c sum_(j = 0)^(T - 1) \( n_j^2 + p_(c \, j)^2 \)) $

 in the post-collision case. The same bound holds for $W_(d \, Re theta)^(upright("pre")) \( cal(Y) \, p \)$ in
   the pre-collision case.]
] <j:absolute-stability>

For the actual pre-collision Gaussian majorant, write $theta = theta.alt + i tau$ and

$ Z = sum_j sum_(\( a \, r \) in cal(H)_(v_j)) r a thin e_(sigma \( v_j \)) = Im X \, $

using the original $H$-lists. The explicit factor from (5.24) that lies outside (6.1) is

$ exp #h(-0.16667em) (frac(T tau^2 \| upright(bold(1)) \|^2, 4 pi) + tau upright(bold(1)) dot.op Z) lt.eq
  exp \( C_Theta \( T + N \) \) . $

The inequality follows from bounded heights and charges per basic particle.
  This factor is absorbed by the theorem’s quadratic count bound.
  The $B_T$-powers are outside both weights as well. They have modulus at most one on the post-collision contours:
  their simplified one-particle factors use $B \( v + i \) B \( v - i \) = B \( v \)$,
  while $\| B \( v \) \| < 1$ for $\| Im v \| < 3 \/ 2$ and $\| B \( v \) \| >
  1$ just beyond either boundary line; the fused factor is one.
  Before collision they have a finite bound per particle at fixed $T \, m \, d$,
  which gives a further absorbable linear count cost. These observations give the Gaussian integration at each
  fixed period and finite site count. The later marked application will use the separate proof at $d =
  1 \/ 8$ in Section 14.

=== 6.1 The matrix of signed height measures <the-matrix-of-signed-height-measures>

Write $mu_i^s \, mu_i^o \, mu_i^H$ for the signed measures on real heights in the short, outer,
  and $H$ columns of (5.14), for a label $i$ in one species. For example,

$ mu_P^s = delta_(1 \/ 2) \, wide mu_P^o = delta_1 \, wide mu_P^H = delta_0 . $

The separate coefficient sign in the table belongs to the local factor and does not multiply these measures.
  The fused measures are the union of the $U \, L$ measures at zero displacement:

$ mu_(F_(upright("pair")))^s = - 2 delta_0 \, wide mu_(F_(upright("pair")))^o = delta_(1 \/ 2) -
  delta_(- 1 \/ 2) \, wide mu_(F_(upright("pair")))^H = - delta_(3 \/ 2) - delta_(- 3 \/ 2) . $

In the order $P \, M \, O_(+) \, O_(-) \, U \, L \, F_(upright("pair"))$,
  the total of both the short measure and the $H$-measure is

$ macron(q)_i = \( 1 \, - 1 \, 0 \, 0 \, - 1 \, - 1 \, - 2 \)_i $

in that species. Thus the physical charge vector is $q_(\( alpha \, i \)) =
  macron(q)_i e_alpha$ for species $alpha$. For a label $iota = \( alpha \, i \)$, put

$ c_iota = macron(q)_i / sqrt(2) \, wide bold(c) = \( c_iota \)_iota \, wide a_c = 8 / 9 . $

The jump of the common charge at label $iota$ is $- c_iota$.

For $k > 0$, the short and outer height kernels are

$ p \( a \) & =
  frac(cosh \( \( 1 \/ 2 - \| a \| \) k \), 2 sinh \( k \/ 2 \)) &  & \( \| a \| lt.eq 1 \, med upright("period ")
  1 \) \,\
o \( a \) & =
  frac(sinh \( \( 1 - \| a \| \) k \), 2 cosh k) &  & \( \| a \| lt.eq 2 \, med upright("antiperiod ") 2 \) . $

They are positive covariance kernels. More explicitly, their Green series are

$ p \( a \) = sum_(n in bb(Z)) frac(k e^(2 pi i n a), k^2 + \( 2 pi n \)^2) \, wide o \( a \) = 1 /
  2 sum_(n in bb(Z)) frac(k e^(pi i \( n + 1 \/ 2 \) a), k^2 + pi^2 \( n + 1 \/ 2 \)^2) . $

Set

$ C_i \( k \) = integral cosh \( k a \) thin d mu_i^H \( a \) \, wide S_i \( k \) =
  integral sinh \( k a \) thin d mu_i^H \( a \) . $

Define the dimensionless matrix $cal(H)$ by

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(H)_(alpha i \, beta j) \( k \) =  & delta_(alpha beta)
   [integral.double p \( a - b \) thin d mu_i^s \( a \) d mu_j^s \( b \) + integral.double o \( a - b \) thin d
   mu_i^o \( a \) d mu_j^o \( b \)]\
 & + sum_(sigma = plus.minus) \( P_sigma \)_(alpha beta) Phi_(i j)^sigma \( k \) \, $ <j:height-matrix>]

where the two uses have

$ Phi_(i j)^(sigma \, upright("pre")) & = - sans(h)_sigma C_i C_j \,\
Phi_(i j)^(sigma \, upright("post")) & = - sans(h)_sigma \( C_i C_j - S_i S_j \) +
  4 upright(bold(1))_({ sigma = - }) integral.double sinh #h(-0.16667em) #scale(x: 120%, y: 120%)[\(]
  k \( \| a - b \| - 3 \)_(+) #scale(x: 120%, y: 120%)[\)] thin d mu_i^H \( a \) d mu_j^H \( b \) . $

The first formula is the Gaussian absolute moment: reality of $xi$ on the real line gives $Re
  xi \( x + i a \) = \( xi \( x + i a \) + xi \( x - i a \) \) \/ 2$.
  The second uses the original charges and $cosh \( k \( a - b \) \) = cosh \( k a \) cosh \( k b \) -
  sinh \( k a \) sinh \( k b \)$.

We verify the continuation term, since it controls the collision directions.
  The only singular part of $K_0$ below height $4$ is $K_(upright("lead")) \( s \) = -
  4 P_(-) log \( 1 + s^2 \/ 9 \)$. For $k > 0$, the transform of its negative real part at height $a$ is

$ frac(k, 2 pi) accent(- Re K_(upright("lead")) \( x + i a \), ̂) =
  P_(-) [- 4 e^(- 3 k) cosh \( a k \) + 4 sinh #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] \( \| a \| - 3 \)_(+) k
  #scale(x: 120%, y: 120%)[\)]] . $

Indeed the two real logarithms involve $x^2 + \( 3 - a \)^2$ and $x^2 + \( 3 + a \)^2$;
  their transforms use $e^(- \| 3 - a \| k)$ and $e^(- \| 3 + a \| k)$.
  Crossing height $3$ therefore replaces the growing factor $e^(- \( 3 - \| a \| \) k)$ by
  $e^(- \| 3 - \| a \| \| k)$, giving the displayed correction.
  In the pre-collision absolute moment all extreme height differences are less than $3$, so that correction is absent.

Let $V_(iota dotless.j)^r \( x \)$ be the even extension of the negative log magnitude of one forward residual
  pair, for $x eq.not 0$. In the pre-collision use it denotes the analogous real symmetrized pair.
  It is integrable: possible singularities at zero are logarithmic,
  and the residual factors decay exponentially at infinity.
  Expanding the short logarithm gives transform $\( 2 pi \/ k \) \( p \( a \) - 1 \/ k \)$;
  the outer logarithm gives $\( 2 pi \/ k \) o \( a \)$. The relation $K^r = K_0 +
  pi \| x \| cal(S)$ adds $\( 2 pi \/ k \) cal(S) \/ k$ to the $H$ residual transform.
  Since both charge totals are $macron(q)_i$, removing the full-factor linear terms leaves

#[#set math.equation(numbering: n => "(6.3)")
 $ hat(V)^r \( k \) = frac(2 pi, k) (cal(H) \( k \) - a_c / k bold(c) bold(c)^t) \, wide k > 0 . $ <j:residual-symbol>]

There is no constant ambiguity here because the residual kernel decays at infinity.

=== 6.2 Coercivity at a fixed displacement <coercivity-at-a-fixed-displacement>

The useful positive part of $cal(H)$ is most easily found after normalizing the fused coordinate.
  In this calculation only, put $F = F_(upright("pair")) \/ 2$, halving all three signed measures.
  It can be included as an auxiliary coordinate in the pre-collision calculation and removed afterward. Let

$ D_0 = "diag" \( 1 \, 1 \, 1 \, 1 \, 1 \, 1 \, 2 \) $

on $P \, M \, O_(+) \, O_(-) \, U \, L \, F$, and let $D_F = "diag" \( D_0 \, D_0 \)$ on the two species.
  Then $cal(H)_(upright("phys")) = D_F cal(H)_(upright("norm")) D_F$.
  A coefficient vector $v_(upright("phys"))$ has normalized coordinates $D_F v_(upright("phys"))$,
  so physical particle count is represented there by

$ frak(n)_(upright("norm")) \|_(upright("one species")) =
  D_0^(- 1) upright(bold(1))_7 = \( 1 \, 1 \, 1 \, 1 \, 1 \, 1 \, 1 / 2 \) . $

The normalized charge row is $\( 1 \, - 1 \, 0 \, 0 \, - 1 \, - 1 \, - 1 \)$.
  In particular $F$ has count $1 \/ 2$ and charge $- 1$, whereas $R_d = \( U + L \) \/
  2$ has count $1$ and charge $- 1$.

This distinction explains the fixed-displacement hypothesis.
  At $d = 0$, the height measures of $R_d$ and $F$ agree but their count values do not.
  Thus the all-ones count bound below cannot be uniform through $d = 0$.
  The same-species $U \, L$ factor also has the simple collision pole from Section 5,
  with magnitude proportional to $1 \/ \| x plus.minus 2 i d \|$ near collision.
  The pointwise estimate consequently needs constants depending on $d$.
  The contour argument sums the series at fixed endpoints on the two sides of the collision.

In normalized coordinates subtract from $cal(H)$ the species-off-diagonal matrix

$ K_(upright("norm")) \( k \) = mat(delim: "(", 0, lambda V V^t; lambda V V^t, 0) \, wide lambda = 3 /
  8 tanh \( 2 k \) \, $

where

$ V_P = 0 \, quad V_M = 1 \, quad V_(O_plus.minus) = 1 / 2 \, quad V_U = V_L = e^(- \| d \| k) \, quad V_F = 1 . $

Write $cal(H)' = cal(H) - K$, using congruence by $D_F$ for both matrices when returning to the physical basis.
  Reflection of heights, together with negation of outer signs, preserves these forms;
  the outer at height $1$ is unchanged by antiperiodicity. Thus $P \, M \, F$ are even, while $O_(+)$ and $O_(-)$,
  and $U$ and $L$, are exchanged. The exact measure identity

$ O_(+) + O_(-) = P + M $

also holds for $V$. Its two species copies generate a fixed nullspace $cal(N)$.
  Both physical count and common charge vanish on $cal(N)$.

#thm([Lemma 6.2.])[
  (Coercive matrix part).  #emph[For each fixed displacement in Theorem 15,
    the physical matrix $cal(H)' \( k \)$ has nullspace $cal(N)$ for every $k > 0$.
    On the quotient by $cal(N)$, it is bounded below near zero by a positive constant times
$ k I + frac(bold(c) bold(c)^t, k) \, $

 and it converges exponentially at infinity to a strictly positive matrix $cal(H)' \( oo \)$.
   The physical limit $Q_oo = cal(H) \( oo \)$ is entrywise nonnegative.]
  #emph[Consequently one can choose $0 < e < 2$ and $gamma > 0$, depending on the fixed displacement, such that
#[#set math.equation(numbering: n => "(6.4)")
 $ J \( k \) := cal(H)' \( k \) - cal(H)' \( oo \) tanh \( e k \) \, wide frac(J \( k \), k) gt.eq
   gamma e^(- k^2) (frak(n) frak(n)^t + frac(bold(c) bold(c)^t, k^2)) \, quad k > 0 \, $ <j:stability-J>]

 where $frak(n)$ is the all-ones vector on the actual physical labels.
   In the pre-collision case the matrices in this statement are restricted to the six basic labels.]
] <j:stability-coercivity>

#proof[
  We first analyze the even directions, then the odd directions, in each species channel $sigma = plus.minus$.
  ===== 6.2.1 The even core. <the-even-core.>
  In the quotient, the even direction $\( O_(+) + O_(-) \) \/ 2$ equals $\( P + M \) \/ 2$.
    On $P \, M \, F$, the short and outer measures give
  #[#set math.equation(numbering: n => "(6.5)")
   $ A_sigma = M_0 - sans(h)_sigma X X^t - sigma lambda V V^t \,\
M_0 = mat(delim: "(", f + g, - f + g, - l + j_0; - f + g, f + g, l + j_0; - l + j_0, l + j_0, f + g \/ 2) \,
  $ <j:stability-core>]
  with
  $ f = p \( 0 \) \, quad g = o \( 0 \) \, quad l = p \( 1 \/ 2 \) \, quad j_0 = o \( 1 \/ 2 \) \,\
X = \( 1 \, 1 - 2 cosh k \, - cosh \( 3 k \/ 2 \) \)^t \, quad V = \( 0 \, 1 \, 1 \)^t . $
  For example, the normalized $F$ short is $- delta_0$ and its two outers have weights $1 \/ 2 \, - 1 \/ 2$,
    producing the third row of $M_0$. The three even $H$-moments give $X$.
    The same core submatrix is present for nonzero $d$. Strict Green positivity makes $M_0 > 0$:
    cancellation of its short measure requires equal $P \, M$ coefficients and zero $F$ coefficient,
    and the remaining outer measure then forces both coefficients to vanish.
  Let $u = e^(- k \/ 2)$ and set
  $ x = X^t M_0^(- 1) X \, wide y = X^t M_0^(- 1) V \, wide v = V^t M_0^(- 1) V . $
  Direct inversion gives
  $ x & = frac(\( 1 - u^2 \) \( u^4 + 1 \) \( u^8 + u^6 - u^4 + u^2 + 1 \), 3 u^6 \( u^2 + 1 \)) \,\
y & = frac(2 \( u^2 - 1 \) \( u^4 + 1 \), 3 u^3) \, wide v = frac(7 u^2 - 12 u + 7, 3 \( 1 - u^2 \)) . $
  The signs of $1 - sans(h)_(+) x$ and $1 - sans(h)_(-) x$ are respectively positive and negative.
    After positive denominators are removed their numerators are
  $ \( u^4 + 1 \) \( 3 u^8 + 2 u^6 + 2 u^4 + 2 u^2 + 3 \) \,
    quad - \( 1 - u^2 \)^2 \( u^4 + 1 \) \( u^8 + 2 u^6 - 2 u^4 + 2 u^2 + 1 \) . $
  The last parenthesis is positive: with $v_0 = u^2$ it equals $\( 1 - v_0^2 \)^2 + 2 v_0 \( 1 + v_0^2 \)$. Put
  $ w_sigma = v + frac(sans(h)_sigma y^2, 1 - sans(h)_sigma x) . $
  Substitution of the rational formulas for $sans(h)_sigma \( t = u^2 \)$ and $lambda =
    3 \( 1 - u^8 \) \/ \( 8 \( 1 + u^8 \) \)$ gives
  $ 1 / w_sigma - sigma lambda = frac(1 - u^2, u) frac(N_sigma \( z \), D_sigma \( z \)) > 0 \, wide z = u +
    u^(- 1) - 2 . $
  The coefficients, in ascending order, are
  $ N_(+) & : \( 96 \, 1280 \, 5496 \, 9312 \, 7696 \, 3360 \, 772 \, 84 \, 3 \) \,\
D_(+) & : \( 128 \, 2240 \, 13888 \, 38304 \, 55392 \, 45584 \, 21984 \, 6128 \, 912 \, 56 \) \,\
N_(-) & : \( 32 \, 256 \, 424 \, 1024 \, 1384 \, 832 \, 232 \, 28 \, 1 \) \,\
D_(-) & : \( 128 \, 2240 \, 13760 \, 36704 \, 49120 \, 36176 \, 15264 \, 3664 \, 464 \, 24 \) . $
  Clearing denominators verifies the identities, and all these coefficients are positive for $z gt.eq 0$.
    The finite positive right side prevents $w_sigma$ from vanishing.
    In the plus channel, $M_0 - sans(h)_(+) X X^t > 0$, so $w_(+) > 0$, and the displayed inequality is $1 -
    lambda w_(+) > 0$. Both negative rank-one updates preserve positivity.
    In the minus channel, the first update has exactly one negative direction.
    Since $w_(-) arrow.r - 3$ as $u arrow.r 0$, it is negative throughout; the inequality now gives $1 +
    lambda w_(-) < 0$. The determinant lemma makes the determinant positive after addition of $lambda V V^t$.
    A positive rank-one update cannot add negative directions, so this removes the unique negative direction.
    Hence $A_sigma > 0$ for every $k > 0$.
  The endpoint expansions give uniform core gaps. With $q = \( 1 \, - 1 \, - 1 \)^t$,
  $ M_0 = frac(q q^t, k) + k / 24 mat(delim: "(", 14, 10, 7; 10, 14, 5; 7, 5, 8) + O \( k^3 \) \, wide X = q +
    k^2 \( 0 \, - 1 \, - 9 \/ 8 \)^t + O \( k^4 \) . $
  They yield
  $ A_(-) / k arrow.r mat(delim: "(", 2, 0, 0; 0, 3 \/ 4, 1 \/ 4; 0, 1 \/ 4, 1 \/ 4) \, $
  while $A_(+)$ has leading term $\( 8 \/ 9 \) q q^t \/ k$.
    Its order-$k$ restriction to $q^perp$, in the basis $\( 1 \, 1 \, 0 \) \, \( 1 \, 0 \, 1 \)$,
    is $mat(delim: "(", 5 \/ 4, 3 \/ 4; 3 \/ 4, 3 \/ 4) > 0$. At infinity,
  $ A_sigma^oo = "diag" \( 1 \, 1 \, 3 \/ 4 - upright(bold(1))_({ sigma = - }) \) - sigma \( 3 \/ 8 \) V V^t . $
  The leading principal minors are $\( 1 \, 5 \/ 8 \, 3 \/ 32 \)$ for $+$ and $\( 1 \, 11 \/ 8 \, 1 \/ 32 \)$ for
    $-$. Positivity on the intervening compact frequency ranges therefore gives
  $ A_sigma gt.eq c_(*) min \( k \, 1 \) I \, $
  with an additional $c_(*) q q^t \/ k$ term for $A_(+)$ near zero.
  ===== 6.2.2 The displaced directions. <the-displaced-directions.>
  The remaining even direction is $R_d = \( U + L \) \/ 2$; put $Z_d = R_d - F$ and $D_(*) = \| d \| k$.
    The $H$-moment of $R_d$ is $- cosh \( \( 3 \/ 2 + d \) k \)$. The odd directions are
  $ O_(upright("odd")) = \( O_(+) - O_(-) \) \/ 2 \, wide W_d = \( U - L \) \/ 2 \, $
  whose $H$-sinh moments are $- sinh k$ and $- sinh \( \( 3 \/ 2 + d \) k \)$.
    Write $cal(T)$ for the continued correction in the post-collision minus channel.
    Summing the opposite extreme charges with their actual half weights gives precisely
  #[#set math.equation(numbering: n => "(6.6)")
   $ cal(T)_(R_d R_d) = 2 sinh \( 2 D_(*) \) \, wide cal(T)_(R_d F) = 2 sinh D_(*) \, wide cal(T)_(W_d W_d) = -
     2 sinh \( 2 D_(*) \) \, $ <j:height-continuations>]
  and no other continued entries. These terms are absent before collision.
  When $D_(*)$ and $\| d \|$ are sufficiently small, the square of $Z_d$ is
    $D_(*) \( 1 + O \( D_(*) + \| d \| \) \)$ and its crosses with the core are $O \( D_(*) \)$, uniformly.
    For the field part, its short square is exactly
  $ 3 / 2 p \( 0 \) + 1 / 2 p \( 2 d \) - 2 p \( d \) = f \( cosh D_(*) - 1 \)^2 + sinh D_(*) - 1 /
    4 sinh \( 2 D_(*) \) \, $
  and its outer square is
  $ o \( 0 \) - o \( d \) + o \( 1 + d \) - 1 / 2 o \( 1 + 2 d \) . $
  Each has leading term $D_(*) \/ 2$; the formulas for $p \, o$ also give the asserted cross bounds.
    At small $k$, the potentially larger second-order bounds $O \( D_(*)^2 \/ k \)$ are still
    $O \( \| d \| D_(*) \)$. The uncontinued $H$-square difference is $O \( D_(*)^2 \)$ and its crosses are
    $O \( D_(*) \)$, using
  $ sans(h)_(+) = frac(1, 9 k) + O \( k \) \, quad sans(h)_(-) = 1 / k + O \( k \) quad \( k arrow.b 0 \) \, wide
    sans(h)_(+) = O \( e^(- 4 k) \) \, quad sans(h)_(-) = 4 e^(- 3 k) + O \( e^(- 4 k) \) quad \( k arrow.r oo \) . $
  The continued contribution to the $Z_d$ square is $2 sinh \( 2 D_(*) \) - 4 sinh D_(*) = O \( D_(*)^3 \)$.
    The $V$-terms have the same bounds. The Schur cost of all crosses is at most
  $ frac(C D_(*)^2, min \( k \, 1 \)) lt.eq C max \( \| d \| \, D_(*) \) D_(*) $
  when $D_(*)$ and $\| d \|$ are small, because $D_(*) \/ min \( k \, 1 \) lt.eq max \( \| d \| \, D_(*) \)$.
    Absorption against the core gap leaves a positive multiple of the $D_(*)$ square and part of the plus charge
    gap. The direction $Z_d$ has zero total charge.
  For large $k$ with $D_(*)$ bounded below by a fixed positive constant, the core cross row of $R_d$ is
  $ e^(- D_(*)) A_(sigma \, F bullet)^oo + O \( e^(- c' k) \) \, $
  and its square is
  $ e^(- 2 D_(*)) A_(sigma \, F F)^oo + 1 / 2 \( 1 - e^(- 2 D_(*)) \) + O \( e^(- c' k) \) . $
  The field square tends to $1 \/ 2 + e^(- 2 D_(*)) \/ 4$, and the field $R_d \, F$ entry to $3 e^(- D_(*)) \/ 4$.
    In the minus channel the leading uncontinued height terms are $- e^(2 d k)$ and $- e^(d k)$.
    For $d > 0$, (6.6) changes these exactly to
  $ - e^(2 D_(*)) + 2 sinh \( 2 D_(*) \) = - e^(- 2 D_(*)) \, wide - e^(D_(*)) + 2 sinh D_(*) = - e^(- D_(*)) . $
  For $d < 0$ they already have the decaying signs. The remaining errors are exponentially small uniformly for $\|
    d \|$ in a sufficiently small fixed interval, since the next height rate is $4$ and $3 + 2 \| d \| < 4$.
    The limiting quadratic form in a core vector $z$ and added coordinate $r$ is
  $ \( z + e^(- D_(*)) e_F r \)^t A_sigma^oo \( z + e^(- D_(*)) e_F r \) + 1 / 2 \( 1 - e^(- 2 D_(*)) \) r^2 \, $
  which has a strict gap when $D_(*)$ is bounded below. Together the two regimes cover every frequency for
    sufficiently small fixed $\| d \| > 0$.
  For the odd directions the outer part alone is
  $ mat(delim: "(", o \( 0 \), o \( 1 \/ 2 + d \); o \( 1 \/ 2 + d \), \( o \( 0 \) + o \( 1 + 2 d \) \) \/ 2)
    gt.eq c_(*) min \( k \, 1 \) I $
  for small $\| d \|$, by strict Green positivity and its limits at zero and infinity.
    The short part is nonnegative. The pre-collision $H$-part vanishes.
    In the post-collision case its uncontinued part is the positive rank-one form from the two sinh moments above.
    The only adverse continuation is the last entry of (6.6).
    On bounded frequency intervals its cost is $O \( \| d \| k \)$.
    At large $k$, its sum with the leading height diagonal is
  $ e^(2 D_(*)) - 2 sinh \( 2 D_(*) \) = e^(- 2 D_(*)) \, $
  up to exponentially small errors, and the height cross is exponentially small.
    First choose a large-frequency cutoff that absorbs these errors uniformly for $\|
    d \|$ in a small fixed interval. Then choose $\| d \|$ small enough on the remaining bounded frequency
    interval. This proves the odd gap.
  ===== 6.2.3 The physical limit and $J$. <the-physical-limit-and-j.>
  The sector gaps show that the only null directions are the two $O$ relations.
    At small $k$ the common channel supplies the $bold(c) bold(c)^t \/ k$ term,
    and all quotient directions have a $k$-order gap. After physical congruence the same assertions hold with the
    physical count and charge. More precisely, the expansions of $p \, o \, sans(h)_sigma$, the continued term,
    and $K$ give
  $ cal(H)' \( k \) = a_c / k bold(c) bold(c)^t + k B_d + O_d \( k^2 \) $
  for a real symmetric matrix $B_d$. This records the exact leading coefficient that will cancel the state square.
    For fixed nonzero $d$, the preceding high-frequency formulas give exponential convergence to a positive
    quotient matrix.
  The physical high-frequency limit is also entrywise nonnegative.
    On the same-species $D$ labels $P \, M \, O_(+) \, O_(-)$, the endpoint coincidences give
  $ mat(delim: "(", 1, 0, 1 \/ 2, 1 \/ 2; 0, 1, 1 \/ 2, 1 \/ 2; 1 \/ 2, 1 \/ 2, 1, 0; 1 \/ 2, 1 \/ 2, 0, 1) . $
  The common outer endpoint compensates each opposite short or outer coincidence.
    The $U \, L$ diagonals are $1$, with no other surviving $U \, L$ entries for fixed nonzero $d$.
    In normalized fused coordinates, the $F \, F$ diagonal is $1 \/ 4$ and the cross-species $F \,
    F$ entry is $1 \/ 2$; these come from the extreme height difference $3$.
    There are no other surviving fused crosses. Physical congruence changes these last two values to $1$ and $2$,
    preserving nonnegativity. Restriction gives the same conclusion on the actual pre-collision labels.
  Finally choose $2 e$ below the fixed exponential convergence rate of $cal(H)'$ at infinity.
    There the positive term $cal(H)' \( oo \) \( 1 - tanh \( e k \) \)$ dominates the convergence error,
    so $J$ has a positive exponential lower bound on the quotient.
    At zero the subtracted term is $O \( e k \)$; reduce $e$ to retain the low gap.
    Reducing it again on a remaining compact frequency interval preserves positivity there as well.
    The resulting low, intermediate, and high bounds imply (6.4):
    at high frequency the positive exponential divided by $k$ dominates $e^(- k^2)$,
    and at low frequency the two required rows are controlled by the quotient gap.
    Both $frak(n)$ and $bold(c)$ annihilate $cal(N)$, so the full-coordinate inequality follows. ◻
]

=== 6.3 The Fourier energy and box confinement <the-fourier-energy-and-box-confinement>

We now prove Theorem 15. Split the full matrix as

$ cal(H) \( k \) = Q_oo tanh \( e k \) + #scale(x: 120%, y: 120%)[\(] K \( k \) -
  K \( oo \) tanh \( e k \) #scale(x: 120%, y: 120%)[\)] + J \( k \) . $

After multiplication by $2 pi \/ k$, each of the first two matrices represents an entrywise nonnegative pair
  potential. To see this, put

$ phi.alt_L \( x \) = - 2 log \| tanh \( pi x \/ \( 4 L \) \) \| . $

It is positive and increasing in $L$, and its transform is $2 pi tanh \( L k \) \/ k$.
  The first matrix has nonnegative coefficients by the lemma.
  Each nonzero entry of $K$ is a positive multiple of $tanh \( 2 k \) e^(- r k)$, with $r gt.eq 0$;
  here $r > 0$ exactly when an entry involves $U$ or $L$. If $r = 0$,
  the difference above gives a positive multiple of $phi.alt_2 - phi.alt_e$.
  If $r > 0$, $K \( oo \)$ vanishes in that entry and the potential is the convolution of $phi.alt_2$ with the
  positive Poisson kernel of parameter $r$. These pair potentials can therefore be dropped from a lower bound on
  the negative log weight, on every forward pair and self-image.

For the remaining regular part, use the even symbol

$ hat(cal(R)) \( k \) = frac(2 pi, \| k \|) (J \( \| k \| \) - frac(a_c, \| k \|) bold(c) bold(c)^t) \, wide
  k eq.not 0 \, $

with its continuous value at $k = 0$. The low expansions above show bounded one-sided derivatives there;
  terms in $\| k \|$ are allowed. At infinity the symbol is integrable, with tail $O \( k^(- 2) \)$,
  and its piecewise second derivatives are integrable. Fourier inversion and two integrations by parts therefore
  show that $cal(R) \( x \)$ is continuous, bounded, and $O \( \( 1 + x^2 \)^(- 1) \)$. Its periodization

$ cal(R)_T \( x \) = sum_(r in bb(Z)) cal(R) \( x + r T \) $

converges absolutely.

Index the physical particles by $alpha = 1 \, dots.h \, N$,
  with labels $iota_alpha$ and positions $x_alpha$ in one period, and define the vector of point measures

$ rho_iota = sum_(alpha : thin iota_alpha = iota) delta_(x_alpha) \, wide hat(rho) \( k \) =
  integral_T e^(- i k x) rho \( d x \) \, wide k in \( 2 pi \/ T \) bb(Z) . $

The forward regular energy, including nonzero self-images, is

$ E_(cal(R)) & := sum_(alpha \, beta) med sum_(r in bb(Z)\
x_beta + r T > x_alpha) cal(R)_(iota_alpha iota_beta) \( x_beta - x_alpha + r T \)\
 & = 1 / 2 sum_(alpha \, beta) \( cal(R)_T \)_(iota_alpha iota_beta) \( x_beta - x_alpha \) - 1 /
   2 sum_alpha cal(R)_(iota_alpha iota_alpha) \( 0 \)\
 & = frac(1, 2 T) sum_(k in \( 2 pi \/ T \) bb(Z)) hat(rho) \( k \)^(*) hat(cal(R)) \( k \) hat(rho) \( k \) - 1 /
   2 sum_alpha cal(R)_(iota_alpha iota_alpha) \( 0 \) . $

Indeed the half-double sum pairs the forward image $\( alpha \, beta \, r \)$ with its reverse
  $\( beta \, alpha \, - r \)$. Only $\( alpha \, alpha \, 0 \)$ is excluded from the gas.
  The subtracted diagonal is therefore the unperiodized value $cal(R)_(iota_alpha iota_alpha) \( 0 \)$;
  every nonzero self-image remains.

Closure of the state path gives

$ bold(c)^t hat(rho) \( 0 \) = 0 \, wide p'_c = - bold(c)^t rho \, wide i k hat(p)_c \( k \) = -
  bold(c)^t hat(rho) \( k \) quad \( k eq.not 0 \) . $

The common component $p_c = \( p_1 + p_2 \) \/ sqrt(2)$ is periodic because the total charge is in $8
  bb(Z) \( 1 \, - 1 \)$. Put $eta = theta \/ \( sqrt(2) pi \)$ and $macron(p)_c = T^(- 1) integral_T p_c$.
  Parseval’s identity now gives the exact cancellation

#[#set math.equation(numbering: n => "(6.7)")
 $ E_(cal(R)) + pi a_c Re integral_T \( p_c + eta \)^2 thin d x =  & pi /
   T sum_(k eq.not 0) hat(rho) \( k \)^(*) frac(J \( \| k \| \), \| k \|) hat(rho) \( k \) +
   frac(1, 2 T) hat(rho) \( 0 \)^t hat(cal(R)) \( 0 \) hat(rho) \( 0 \)\
 & + pi a_c T #scale(x: 120%, y: 120%)[\[] \( macron(p)_c + Re eta \)^2 - \( Im eta \)^2
   #scale(x: 120%, y: 120%)[\]] - 1 / 2 sum_alpha cal(R)_(iota_alpha iota_alpha) \( 0 \) . $ <j:stability-energy>]

Here and below the sum uses $k in \( 2 pi \/ T \) bb(Z)$.
  At each nonzero frequency the negative term $- pi a_c \| bold(c)^t
  hat(rho) \( k \) \|^2 \/ \( T k^2 \)$ in the pair energy is canceled by the state square.
  At zero, $hat(rho) \( 0 \)$ is perpendicular to $bold(c)$, so the limit of (6.4) gives

$ frac(1, 2 T) hat(rho) \( 0 \)^t hat(cal(R)) \( 0 \) hat(rho) \( 0 \) gt.eq
  frac(pi gamma, T) lr(|frak(n)^t hat(rho) \( 0 \)|)^2 . $

No positivity of $hat(cal(R)) \( 0 \)$ on other vectors is required.
  The mean square in (6.7) bounds a positive multiple of $T macron(p)_c^2$ up to $O_Theta \( T \)$.
  The diagonal correction costs $O_d \( N \)$, independently of $T$.

Let $g_T$ be the normalized periodic Gaussian whose Fourier multiplier is $e^(- k^2 \/ 2)$, and let $nu =
  frak(n)^t rho = sum_alpha delta_(x_alpha)$. Combining (6.4) with (6.7), and including the local factors,
  gives for every nonzero post-collision weight

$ - log \| W_(d \, theta) \| gt.eq
  c_2 (parallel g_T * nu parallel_(L^2 \( T \))^2 + parallel g_T * p_c parallel_(L^2 \( T \))^2) - C_2 \( N + T \) . $

Here $c_2 \, C_2$ depend only on $d \, Theta$. The local constants have logarithmic cost $O_d \( N \)$.
  The Berry factors containing real state charges are phases;
  their $theta$-dependent parts cost $O_Theta \( N \)$. For the pre-collision product (6.1),
  use the same identity with the real angle $theta.alt = Re theta$.
  Its symmetrized local constants are finite for fixed $d < 0$, so they cost $O_d \( N \)$,
  and the same bound holds with $- log W_(d \, Re theta)^(upright("pre"))$ on the left.
  The explicit heat and deterministic costs outside that product are absorbed afterward as described following the
  theorem. Zero weights already satisfy the desired inequality.

The first norm controls the box counts. In fact, with $h_T = g_T * g_T$,

$ parallel g_T * nu parallel_2^2 = sum_(alpha \, beta) h_T \( x_alpha - x_beta \) gt.eq
  c_1 sum_(j = 0)^(T - 1) n_j^2 \, $

because $h_T$ is positive and has a uniform positive lower bound for pairs in the same unit box.
  Each jump of $p_c$ has magnitude at most $sqrt(2)$. For $x$ in box $j$,
  express $p_c \( x \) - \( g_T * p_c \) \( x \)$ by integrating its increments against the Gaussian.
  A jump in a box $r$ boxes away is then multiplied by a Gaussian tail bounded by $C e^(- c \( r - 2 \)_(+)^2)$.
  The resulting sequence of bounds is summable uniformly after periodization.
  Discrete Young’s inequality therefore gives

$ parallel p_c - g_T * p_c parallel_2^2 lt.eq C_1 sum_j n_j^2 . $

Within box $j$, the same jump bound gives

$ sum_j p_(c \, j)^2 lt.eq 2 parallel p_c parallel_2^2 + C_2 sum_j n_j^2 . $

Using a smaller positive constant, the two smoothed norms consequently control $sum_j \( n_j^2 + p_(c \, j)^2 \)$.
  Finally $sum_j n_j lt.eq epsilon sum_j n_j^2 + C_epsilon T$ absorbs the linear costs. This proves Theorem 15.

The pointwise bound gives the required absolute summability.
  For a fixed common integer $p_1 + p_2$, there are eight classes in $bb(Z)^2 \/ 8 bb(Z) \( 1 \, - 1 \)$;
  the Gaussian bound on the common charge sums over that integer.
  In each box, integration and the ordinary particle factorials reduce to a convergent sum of the form
  $sum_(n gt.eq 0) A^n e^(- c n^2) \/ n !$. Thus both the pre-collision Gaussian integration and the
  post-collision gas series are absolutely summable at the fixed displacements used in Section 5.

== 7 Compact propagation with possible Jordan blocks <c7:compact>

The horizontal gas gives a representation of the cylinder partition, but its weights are signed.
  For the balanced lists with $m$ sites in each group, we now turn that representation into a compact operator and
  estimate the effect of the site factors on its power traces.
  The main point is that these factors suppress particles on an interval of length proportional to $log m$.
  We compare propagation across that interval with propagation outside it,
  while retaining every peripheral Jordan term of the exterior operator.

There are two inputs from the preceding sections. Absolute stability controls particle counts and the common
  charge on each spatial block. The residual pair interaction has an exponentially convergent expansion at large
  separation. The first input gives a summable local kernel after a change of gauge;
  the second is carried exactly by an auxiliary Bargmann space.
  We first construct the state space and establish the bounds used by the operator representation.

=== 7.1 The local state and its gauge <the-local-state-and-its-gauge>

Fix a sufficiently small positive post-collision displacement $d$, as in Section 6.
  Take $T = b n$, where the integer block size $b$ will be chosen sufficiently large and then held fixed.
  In block $j$ write $x = j b + t$, $0 < t < b$. Positions at ties or block boundaries form null sets and are discarded.

A block configuration $Y$ is a finite ordered list of positions $t$ and particle labels.
  It is measured by Lebesgue measure on each ordered simplex and counting measure on labels;
  the empty configuration is an atom. This is equivalent to the factorial convention for indistinguishable
  particles. Write $q \( Y \)$ for its total charge vector. The state before a block is

$ S = \( Y_(upright("prev")) \, p \) \, wide p in bb(Z)^2 \/ 8 bb(Z) \( 1 \, - 1 \) \, $

where $Y_(upright("prev"))$ records the preceding block in translated coordinates. Its successor after inserting $Y$ is

#[#set math.equation(numbering: n => "(7.1)")
 $ S' = \( Y \, p - q \( Y \) \) . $ <j:successor-state>]

We use the indicated charge jumps to choose one consistent lift within each block.
  State measure is the product of the block-configuration measure and counting measure on $p$.
  Particle types with zero local factor may be omitted. In particular $P \,
  M$ in each species have nonzero local factors, so their charges can be used to connect states.

Separate the forward residual interactions into pairs in the same block, pairs in neighboring blocks,
  and pairs at least two blocks apart. Let $w_theta \( S \, S' \)$ be the product of all constants, phases,
  and the integral-square weight in $Y$, starting at $p$, together with residual factors within $Y$ and from
  $Y_(upright("prev"))$ to $Y$. The site factors involving $B_T$ are omitted for now.
  The function $w_theta$ is continuous and nonzero on each allowed open position simplex.

For a closed sequence of $n$ blocks, the sum of the absolute values of the omitted tail log-magnitudes is at most

$ C e^(- c b) sum_j \| Y_j \|^2 . $

Indeed an interaction across $l gt.eq 2$ blocks has horizontal separation at least $\( l - 1 \) b$,
  and each residual log decays exponentially there. This also applies to short periodic sequences,
  with their images included. For large $b$, stability therefore bounds the sum of the local costs by

#[#set math.equation(numbering: n => "(7.2)")
 $ sum_j - log \| w_0 \( S_j \, S_(j + 1) \) \| gt.eq c' / b sum_j #scale(x: 120%, y: 120%)[\(] \| Y_j \|^2 +
   p_(c \, j)^2 #scale(x: 120%, y: 120%)[\)] - C_b n \, wide p_(c \, j) =
   frac(p_(1 \, j) + p_(2 \, j), sqrt(2)) . $ <j:local-cycle-cost>]

Fix an open parameter neighborhood $cal(U)_theta$ whose closure $D$ is compact in the complex $theta$ plane.
  The same bound, with adjusted constants, holds for the sum of $- log sup_(theta in D) \| w_theta \|$.
  The change from $theta = 0$ costs at most a constant times $b \( 1 + \| p_c \| + \| Y \| \)$ per block,
  which is absorbed by the quadratic terms. Constants in this section may depend on $b \, d \, D$.

There is consequently a real measurable function $Phi$ on states such that

#[#set math.equation(numbering: n => "(7.3)")
 $ lr(|e^(Phi \( S' \) - Phi \( S \)) w_theta \( S \, S' \)|) lt.eq
   exp #h(-0.16667em) (C_b - delta_b \( \| Y_(upright("prev")) \|^2 + \| Y \|^2 + p_c^2 \)) \, wide delta_b =
   c'' \/ b > 0 \, $ <j:local-gauge>]

for $theta in D$ and allowed successors. To construct it,
  subtract a smaller quadratic cost from the edge costs used in (7.2), and add $C_b$,
  so that every finite directed cycle has nonnegative modified cost.
  Let $Phi \( S \)$ be the infimum of modified costs of paths from a reference state to $S$.
  Every state can be reached and returned from: insert $P \, M$ charges as needed at distinct positions,
  and then insert the required final block. A fixed return path bounds the infimum below by the negative of its
  cost, so the infimum is finite. The directed triangle inequality gives (7.3).
  For measurability, the intermediate positions in the infimum may be restricted to rational translated
  coordinates, using continuity on the open simplices; the terminal state $S$ remains arbitrary and fixed.
  The discrete constraints depend only on the labels. On each label stratum this is a countable infimum of
  functions continuous in the endpoint, hence is measurable.

=== 7.2 Exact propagation of the interaction tail <exact-propagation-of-the-interaction-tail>

Choose the logarithm of each far residual factor using the expansion of $K^r$ and the convergent logarithmic
  expansions of the short and outer factors. For an earlier label $u$, a later label $v$,
  and sufficiently large positive separation $s$, that log has a representation

#[#set math.equation(numbering: n => "(7.4)")
 $ g_v e^(- D_0 s) h_u $ <j:tail-linear-form>]

on a complex sequence space, with bilinear row-column pairing.
  Here $D_0$ is a direct sum of finite Jordan arrays whose diagonal values are $pi l \/ 6$, $l gt.eq 1$.
  Their sizes and the entries of their nilpotent parts are uniformly bounded;
  those parts generate the polynomial factors below. The components of $g_v \,
  h_u$ have at most polynomial growth. To obtain this representation, write the residual log as

$ sum_(l gt.eq 1) e^(- pi l s \/ 6) P_(l \; u v) \( s \) . $

The polynomials have uniformly bounded degree and polynomially growing coefficients,
  also after the fixed imaginary height shifts. A nilpotent chain generates each power of $s$;
  separate coordinates can be used for each ordered label pair and degree.
  Any positive intervening delay then puts the resulting vectors in $ell^2$.

Set

#[#set math.equation(numbering: n => "(7.5)")
 $ A_0 & = e^(- b D_0) \,\
G \( Y \) & = sum_(\( t \, v \) in Y) g_v e^(- D_0 \( t + b \/ 2 \)) \,\
H_1 \( Y_(upright("prev")) \) & = sum_(\( t \, u \) in Y_(upright("prev"))) e^(- D_0 \( 3 b \/ 2 - t \)) h_u .
  $ <j:tail-data>]

Thus $parallel G \( Y \) parallel lt.eq C e^(- c b) \| Y \|$ and $parallel H_1 \( Y_(upright("prev")) \) parallel
  lt.eq C e^(- c b) \| Y_(upright("prev")) \|$, while the trace norm of $A_0$ tends to zero as $b$ increases.
  The offsets in (7.5) put exactly two blocks between a source and its first use.
  For example, a particle $\( t_u \, u \)$ in $Y_(j - 2)$ enters the field used by $\( t_v \, v \)$ in $Y_j$ with
  exponent

$ g_v e^(- D_0 \( t_v + b \/ 2 \)) e^(- D_0 \( 3 b \/ 2 - t_u \)) h_u = g_v e^(- D_0 \( 2 b + t_v - t_u \)) h_u \, $

which is (7.4) at their actual separation. Each additional factor $A_0$ adds one more block of delay.

On the holomorphic Bargmann space over this sequence space, with orthonormal monomials $z^alpha \/ sqrt(alpha !)$,
  define the edge operator

#[#set math.equation(numbering: n => "(7.6)")
 $ cal(K) \( S \, S' \) f \( z \) = e^(G \( Y \) z) f \( A_0 z + H_1 \( Y_(upright("prev")) \) \) . $ <j:bargmann-edge>]

Finite-mode Bose and Fermi trace–determinant formulas are derived in [12] Section 2.
  Here the affine terms and infinite-mode limit are also needed.

For large $b$, the trace norm of (7.6) is at most

#[#set math.equation(numbering: n => "(7.7)")
 $ C exp #h(-0.16667em)
   (C \( parallel G \( Y \) parallel^2 + parallel H_1 \( Y_(upright("prev")) \) parallel^2 \)) . $ <j:bargmann-bound>]

Indeed linear composition $C_B f \( z \) = f \( B z \)$ acts by symmetric tensor powers and has trace norm at most
  $\( 1 - parallel B parallel_1 \)^(- 1)$ when $parallel B parallel_1 < 1$.
  Factor (7.6) through $C_(4 A_0)$, with outside linear dampings $z mapsto z \/
  2$ carrying the exponential multiplier and the translation.
  Such damped operators are bounded with the estimate in (7.7):
  a map $e^(g z) f \( d z + h \)$, $d = 1 \/ 2$, is a scalar times $W_v C_d W_w$, where

$ W_v f \( z \) = e^(- parallel v parallel^2 \/ 2 + macron(v)^t z) f \( z - v \) \, wide v + d w = macron(g) \,
  quad d v + w = - h . $

The operators $W_v$ are unitary and strongly continuous, by Gaussian translation in finite dimensions or directly
  on total exponential vectors.

For a closed sequence, multiply the edge operators in increasing block order. Composition and trace give

#[#set math.equation(numbering: n => "(7.8)")
 $ "tr" product_(j = 0)^(n - 1) cal(K) \( S_j \, S_(j + 1) \) =
   det \( I - A_0^n \)^(- 1) exp #h(-0.16667em) (sum_j G \( Y_j \) z_j) \,\
z_(j + 1) = A_0 z_j + H_1 \( Y_(j - 1) \) \, wide z_n = z_0 . $ <j:bargmann-cycle>]

In finite one-particle dimension, the trace of $e^(g z) f \( B z + h \)$ for small $parallel B
  parallel$ is $det \( I - B \)^(- 1) exp \( g \( I - B \)^(- 1) h \)$.
  Integrating its coherent diagonal $e^(g z + macron(z)^t \( B z + h \))$ against normalized complex Gaussian
  gives this formula: Gaussian monomial orthogonality gives the trace resolution,
  and square completion works first for Hermitian $B$ and then analytically in its entries.
  Composition proves (7.8) in finite dimension. Increasing Jordan-block truncations converge in trace norm by the
  preceding factorization: $C_(4 A_0)$ converges in trace norm by its tensor series,
  and the outside factors and their adjoints converge strongly.
  The periodic solution $z_j$ sums the sources in blocks up to $j - 2$ in the periodic past.
  The explicit delay calculation above shows that the exponential in (7.8) is precisely the entire omitted tail,
  including its images.

#thm([Proposition 7.1.])[
  (Block kernel and trace realization).  #emph[Use the state space, measure, and successor rule (7.1).
    Suppose the local kernel satisfies (7.3), and use the tail data and edge operator (7.5)–(7.6) with the bounds
    just proved. On $L^2$ of states with these Bargmann fibers, give an allowed edge the operator-valued kernel
#[#set math.equation(numbering: n => "(7.9)")
 $ e^(Phi \( S' \) - Phi \( S \)) w_theta \( S \, S' \) thin mu \( Y \) thin cal(K) \( S \, S' \) \,
   $ <j:gauged-kernel>]

 and give every other edge value zero. The choices of $mu \( Y \)$ used in this section are one,
   the indicator that every label is $M$ or $F_(upright("pair"))$,
   and the products of the specified balanced periodized or infinite-volume $B$ factors.
   Their per-particle factors have modulus at most one. For sufficiently large fixed $b$,
   these kernels are Hilbert–Schmidt uniformly in those choices and in $theta in D$.
   The same conclusion permits fixed polynomial factors in the particle counts.
   For the fixed gauge on $D$, the kernels form holomorphic families in Hilbert–Schmidt norm on the open parameter
   neighborhood $cal(U)_theta$, with bounds uniform on compact subsets.]
  #emph[For a product of $n gt.eq 2$ such kernels, its trace is the absolutely convergent integral over closed
    successor sequences, with the gauge factors canceled and the Bargmann trace given by (7.8).
    In particular, let $T_j$ carry the specified periodized $B_T$ site factors for block $j$.
    Then, in increasing block order,
#[#set math.equation(numbering: n => "(7.10)")
 $ "tr" product_(j = 0)^(n - 1) T_j = det \( I - A_0^n \)^(- 1) Z_(m \, b n) . $ <j:operator-gas-trace>]

]
] <j:block-kernel>

#proof[
  The squared Hilbert–Schmidt norm is the integral of the squared fiber Hilbert–Schmidt norms.
    By (7.7), their extra cost is at most $exp \( C e^(- 2 c b) \( \| Y_(upright("prev")) \|^2 + \| Y \|^2 \) \)$.
    Increase $b$ so this is absorbed by (7.3). The remaining integrals converge:
    the volume for a list of $r$ positions is $b^r \/ r !$, there are finitely many labels,
    and the charge sum has finitely many representatives for each value of $p_1 + p_2$.
    The successor charge $p'$ is uniquely fixed by $Y \, p$, so no additional charge sum occurs in the squared
    kernel integral. The same domination absorbs fixed polynomial count factors and gives the stated local holomorphy.
  For two kernels, the trace formula is Hilbert–Schmidt pairing.
    For a longer finite product, the same confining bounds make every successive contraction over states and
    fibers absolute. The gauges telescope on a closed sequence.
    Equation (7.8) then supplies exactly the far interactions, while $w_theta$ supplies the local ones,
    proving (7.10). ◻
]

The marked profile comparisons will apply this construction after establishing their local bounds and suppression
  estimates.

=== 7.3 Empty-block traces and spectral consequences <empty-block-traces-and-spectral-consequences>

Let $E_0$ be the homogeneous operator with every site multiplier equal to one.
  Let $I_0$ be the operator retaining only the labels $M \, F_(upright("pair"))$. Both depend on $theta$.
  The exact traces are

#[#set math.equation(numbering: n => "(7.11)")
 $ "tr" E_0^n & = det \( I - A_0^n \)^(- 1) \/ c \( b n \) \,\
"tr" I_0^n & = 8 det \( I - A_0^n \)^(- 1) sum_(k in bb(Z)) u_k^n \, wide n gt.eq 2 . $ <j:empty-block-traces>]

Here

$ u_k = exp #h(-0.16667em) [- frac(4 pi b, 9) \( k + theta \/ pi \)^2] . $

The first equality follows from the empty contour at $m = 0$ and the gas identity.
  In the second, every retained particle has strictly negative common charge.
  A closed sequence can therefore contain no particles, and the eight representatives at each $k = p_1 +
  p_2$ give the displayed empty-block sum. The same reasoning gives the trace formula with the sum restricted to a
  consecutive range of $k$ for a triangular diagonal compression to that range.
  This full formula will also be used for the marked intervals.

We recall the spectral facts needed to read these traces.
  For a compact Hilbert–Schmidt operator, the limsup of the absolute $n$th roots of its power traces is its
  spectral radius, and those traces determine every nonzero eigenvalue with its algebraic multiplicity.
  To see this, approximate the operator by finite rank with norm error less than $epsilon.alt$.
  Outside radius $epsilon.alt$, the error resolvent exists and finite-dimensional inversion makes the full
  resolvent meromorphic with finite-rank pole parts. Resolvent contour integration isolates the Riesz blocks.
  The resolvent identity makes each Riesz projection idempotent and commuting,
  and Laurent comparison identifies the higher pole parts with powers of the nilpotent part on that block.
  The complementary powers are exponentially bounded at any radius containing the remaining spectrum;
  their traces have the same rate by retaining two Hilbert–Schmidt factors.
  On an isolated spectral radius the trace is therefore a sum of algebraic multiplicities times eigenvalue powers.
  Cesàro extraction of distinct unit-circle frequencies shows that this sum cannot tend to zero unless all its
  coefficients vanish. Applying this successively off zero proves the assertions.
  Separating resolvent contours give locally uniform bounds for norm-continuous families.

It follows from (7.11) and $log c \( T \) \/ T arrow.r pi \/
  16$ that all nonzero eigenvalues of $E_0$ are independent of $theta$, and

#[#set math.equation(numbering: n => "(7.12)")
 $ r \( E_0 \) = r_E = e^(- b pi \/ 16) . $ <j:exterior-radius>]

For $\| Re theta \| < pi \/ 2$, the unique leading eigenvalue of $I_0$ is $u = u_0$,
  with algebraic multiplicity eight. It is semisimple in this strip.
  Along successor edges a negative particle charge increases $k$;
  the operator acts from an argument state to an output state,
  so in that operator direction $k$ can only stay or decrease.
  Split into the three triangular diagonal compressions with negative, zero, and positive $k$.
  Their traces are (7.11) restricted to the corresponding ranges,
  so the two side blocks are spectrally separated from $u$.
  In the zero block, a successor state must have empty $Y$.
  Splitting off these empty fibers leaves, per representative,
  the diagonal operator $u C_(A_0)$ on an empty fiber and zero on the other diagonal block.
  The constants give a simple semisimple eigenvalue $u$ for $u C_(A_0)$;
  $C_(A_0)$ is strictly contracting on higher Bargmann degrees.

For completeness, semisimplicity passes through each of these finite triangular decompositions as follows.
  A generalized $u$-eigenvector has zero component on the incoming nonresonant side by invertibility there.
  Its component on the resonant block is already a genuine eigenvector.
  Applying the operator minus $u$ leaves a generalized eigenvector on the outgoing nonresonant side,
  which must also be zero. Thus, locally uniformly on compact neighborhoods in the strip,

#[#set math.equation(numbering: n => "(7.13)")
 $ \( I_0 \/ u \)^s = P_I + O \( e^(- c s) \) $ <j:interior-powers>]

in operator norm, where $P_I$ is its Riesz projection. For $E' = E_0 \/ r_E$,
  peripheral Jordan blocks are retained: locally uniformly, $parallel \( E' \)^s parallel lt.eq C \( 1 + s \)^r$,
  and its powers equal their finite peripheral Riesz expansions up to exponentially small error.
  The uniformity follows from fixed separating contours and the fixed finite ranks of the Riesz blocks.

=== 7.4 The logarithmic interval and its exterior words <the-logarithmic-interval-and-its-exterior-words>

We now return to the balanced $2 m$-site problem, with $m$ even and sufficiently large at fixed $b$. Put

$ kappa_1 = pi \/ 3 \, wide L = ⌊frac(log m, kappa_1 b)⌋ \, wide a_m =
  m e^(- kappa_1 b L) in \[ 1 \, e^(kappa_1 b) \) . $

For the labels $P \, O_plus.minus \, U \, L$, the infinite-volume factors before taking the $m$th power are,
  respectively,

$ B \( x \) \, wide B \( x minus.plus i \) \, wide B \( x + i \( 3 \/ 2 + d \) \)^(- 1) \, wide
  B \( x - i \( 3 \/ 2 + d \) \)^(- 1) . $

Call these functions $omega_v \( x \)$; the labels $M \, F_(upright("pair"))$ have factor one.
  The explicit formula for $B$ gives $\| omega_v \( x \) \| < 1$ and

#[#set math.equation(numbering: n => "(7.14)")
 $ omega_v \( x \) = 1 - Lambda_(v \, plus.minus) e^(- kappa_1 \| x \|) +
   O \( e^(- 2 kappa_1 \| x \|) \) quad \( x arrow.r plus.minus oo \) \, wide
   Re Lambda_(v \, plus.minus) > 0 . $ <j:site-tail>]

In particular

$ \| omega_v \( x \)^m \| lt.eq e^(- c m e^(- kappa_1 \| x \|)) \, wide \| omega_v \( x \)^m - 1 \| lt.eq
  C m e^(- kappa_1 \| x \|) . $

Inside $\| x \| lt.tilde b L$, these factors suppress all labels except $M \, F_(upright("pair"))$;
  outside they approach one. This is the logarithmic interval over which the interior and exterior propagation
  rates differ.

Let $T_(m \, j)$ be the one-block kernel of Proposition 17 with the factor $product_(\( t \, v \) in Y)
  omega_v \( j b + t \)^m$. Define the central product and the exterior differences by

#[#set math.equation(numbering: n => "(7.15)")
 $ tilde(C)_m & = product_(j = - L)^(L - 1) \( T_(m \, j) \/ u \) \,\
D_(+ \, k) & = T_(m \, L + k) \/ r_E - E' \,\
D_(- \, k) & = T_(m \, - L - 1 - k) \/ r_E - E' \, wide k gt.eq 0 \, $ <j:central-and-defects>]

where products in the spatial coordinate are in increasing order.
  A finite subset of exterior indices on a side has length $l_plus.minus$ equal to one more than its maximum,
  and length zero when it is empty. Its word $W_(+)$ consists of the factors on indices $0 \, dots.h \, l_(+) -
  1$, with $D_(+ \, k)$ at chosen indices and $E'$ otherwise. Define $W_(-)$ in the same way in reverse order.
  The empty subset gives the identity operator. The occupied index interval of a nonempty word ends at its largest
  chosen index, with no factors beyond that index.

For a centered interval of $n gt.eq 2 L$ blocks containing the central range,
  expand the exterior factors and rotate the trace to begin with $C'_m = \( u \/ r_E \)^(2 L) tilde(C)_m$.
  The term for two compatible exterior words has the form

#[#set math.equation(numbering: n => "(7.16)")
 $ "tr" #scale(x: 120%, y: 120%)[\(] C'_m W_(+) \( E' \)^(s - l_(+) - l_(-)) W_(-) #scale(x: 120%, y: 120%)[\)] \,
   wide s = n - 2 L . $ <j:word-trace-form>]

The next lemma identifies what is needed to estimate this trace:
  a trace-norm bound for the central product, exponential moments of the word lengths,
  and a limiting difference from a bare power trace. It allows all peripheral nilpotent terms of $E'$.

=== 7.5 A coefficient lemma for signed traces <a-coefficient-lemma-for-signed-traces>

The preceding decomposition leads to the following abstract statement.
  The operator $E$ describes the exterior, $C$ contains the central interval,
  and the two word families collect the perturbations at its ends.
  Their lengths include the unperturbed blocks between chosen perturbations.
  The lemma extracts the coefficient of each peripheral eigenvalue from a difference of traces.

#thm([Lemma 7.2.])[
  (Signed trace coefficients).  #emph[Let $E$ be a Hilbert–Schmidt operator on a complex Hilbert space with
    spectral radius one. Let $cal(P) = { zeta in sigma \( E \) : \| zeta \| = 1 }$.
    For each $zeta in cal(P)$ let $P_zeta$ be its Riesz projection, $d_zeta = "rank" P_zeta$,
    and $J_zeta = \( E - zeta I \) P_zeta$, with $J_zeta^(q_zeta) = 0$ on $"ran" P_zeta$. Let $C$ be trace class.
    Suppose two countable families of bounded operators $W_(+) \,
    W_(-)$ have integer lengths $ell \( W_plus.minus \) gt.eq 0$ and, for some $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(7.17)")
 $ sum_(W_plus.minus) e^(epsilon.alt ell \( W_plus.minus \)) parallel W_plus.minus parallel < oo . $ <j:word-moment>]

 For integers $s gt.eq 0$ put
$ F_s =
  sum_(ell \( W_(+) \) + ell \( W_(-) \) lt.eq s) "tr" \( C W_(+) E^(s - ell \( W_(+) \) - ell \( W_(-) \)) W_(-) \) . $

 Assume that $a gt.eq 0$ is an integer and $R in bb(C)$ satisfy $F_s - R "tr" E^(s + a) arrow.r 0$ as $s arrow.r
   oo$. Only sufficiently large $s$, with $s + a gt.eq 2$, are used in this limit.
   Then the coefficientwise absolutely convergent polynomial
$ cal(P)_zeta \( z \) = sum_(W_(+) \, W_(-)) zeta^(- ell) "tr"
  (C W_(+) [sum_(t = 0)^(q_zeta - 1) binom(z - ell, t) zeta^(- t) J_zeta^t P_zeta] W_(-)) \, quad ell =
  ell \( W_(+) \) + ell \( W_(-) \) \, $

 is identically $R d_zeta zeta^a$. In particular,
$ R = frac(cal(P)_zeta \( 0 \), d_zeta zeta^a) \, wide \| R \| lt.eq K parallel C parallel_1 \, $

 where $K$ depends on $E$ and the bounds in (7.17), but not on $C$ or $a$.
   More precisely it may be chosen in terms of $epsilon.alt$, the two weighted word sums,
   the finite nilpotent orders $q_zeta$, and the norms $parallel J_zeta^t P_zeta parallel$.
   Thus the conclusion is uniform for a family with uniform bounds on these data.
   No peripheral semisimplicity is assumed.]
] <j:trace-extraction>

#proof[
  Compactness makes $cal(P)$ finite and nonempty. On its finite Riesz blocks,
  $ E^n P_zeta = zeta^n sum_(t = 0)^(q_zeta - 1) binom(n, t) zeta^(- t) J_zeta^t P_zeta . $
  The complementary restriction $E_(<)$ has spectral radius strictly less than one.
    Thus the remainder in this expansion is $O \( rho^n \)$ in operator norm for some $rho < 1$,
    and $parallel E^n parallel lt.eq K_0 \( 1 + n \)^q$ for a fixed $q$.
    For $n gt.eq 2$, the complementary trace norm is bounded by $parallel E_(<) parallel_2^2 parallel
    E_(<)^(n - 2) parallel$. Every positive nilpotent power has trace zero on a finite Riesz block, so
  #[#set math.equation(numbering: n => "(7.18)")
   $ "tr" E^n = sum_(zeta in cal(P)) d_zeta zeta^n + O \( rho_1^n \) \, wide rho_1 < 1 . $ <j:bare-trace-expansion>]
  The inequality $\| "tr" \( C A B \) \| lt.eq parallel C parallel_1 parallel A parallel parallel B
    parallel$ and the polynomial power bound prove absolute convergence of $F_s$.
    A coefficient of $binom(z - ell, t)$ is bounded by a constant times $\( 1 + ell \)^t$,
    so the exponential moments in (7.17) also prove coefficientwise convergence of $cal(P)_zeta$.
    For pairs with $ell lt.eq s \/ 2$, replacing the middle power by its peripheral expansion costs
    $O \( rho^(s \/ 2) \) parallel C parallel_1$. For the remaining pairs use the polynomial bound and the
    exponential tail of the word sums. Their total is at most a polynomial in $s$ times $e^(- epsilon.alt s \/ 2)
    parallel C parallel_1$. The same estimate permits extending the peripheral sum to all word pairs,
    using the polynomial growth of the generalized binomial coefficients. Hence
  $ F_s = sum_(zeta in cal(P)) zeta^s cal(P)_zeta \( s \) + o \( 1 \) . $
  Together with the assumed difference of traces and (7.18), this gives
  $ sum_(zeta in cal(P)) zeta^s #scale(x: 120%, y: 120%)[\(] cal(P)_zeta \( s \) -
    R d_zeta zeta^a #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  Distinct unit-modulus exponentials cannot cancel a nonzero polynomial coefficient in this way.
    Divide by the largest occurring power $s^d$, multiply by $overline(eta)^s$ for one $eta in cal(P)$,
    and take Cesàro means. The geometric-series formula makes every frequency except $eta$ vanish,
    leaving its leading coefficient. That coefficient is zero; descend through the degrees.
    This proves the polynomial identity. Evaluation at zero is bounded by
  $ K_1 parallel C parallel_1 sum_(W_(+) \, W_(-)) parallel W_(+) parallel parallel W_(-)
    parallel \( 1 + ell \)^(q_zeta - 1) \, $
  which is finite by (7.17). Since $d_zeta gt.eq 1$ and $\| zeta^a \| = 1$, the asserted bound follows. ◻
]

=== 7.6 Bounds for the central product and the words <bounds-for-the-central-product-and-the-words>

Fix $b \, d$ and a compact parameter neighborhood $D$ inside $\| Re theta \| < pi \/ 2$.
  The gauged kernel bound and (7.14) give

#[#set math.equation(numbering: n => "(7.19)")
 $ parallel D_(plus.minus \, k) parallel_2 lt.eq C e^(- kappa_1 b k) . $ <j:defect-bounds>]

For $- L lt.eq j < L$, the Hilbert–Schmidt norm of $T_(m \, j) \/ u -
  I_0 \/ u$ is at most $C exp \( - c e^(kappa_1 b k) \)$, where $k$ is the number of full blocks between $j$ and
  the nearer edge. These estimates follow by telescoping the products of the specified scalar multipliers.
  A telescoping term costs at most a particle count times the displayed scalar difference;
  the quadratic gauge bound absorbs that count. In the central estimate,
  any configuration omitted by $I_0$ contains at least one suppressed particle.

Expand the central differences against the bounded powers (7.13). Their norms are summable from both ends.
  Keeping a Hilbert–Schmidt factor at each endpoint gives

#[#set math.equation(numbering: n => "(7.20)")
 $ parallel tilde(C)_m parallel_1 lt.eq C . $ <j:central-trace-bound>]

Likewise the peripheral projections and nilpotent powers of $E'$ are uniformly bounded on $D$ by separating
  contours, with orders bounded by their fixed finite ranks.
  Thus $parallel \( E' \)^k parallel lt.eq A \( 1 + k \)^(r_J)$ there, for a fixed nonnegative integer $r_J$.
  For a nonempty exterior word, pair each intervening power with the farther chosen perturbation at index $k$.
  There is no unrestricted gap, so

$ parallel W_plus.minus parallel lt.eq product_(k upright(" chosen")) A_1 \( 1 + k \)^(r_J) e^(- kappa_1 b k) . $

Its length is at most the sum of $k + 1$ over its chosen indices. Hence for $0 < epsilon.alt < kappa_1 b$,

#[#set math.equation(numbering: n => "(7.21)")
 $ sum_W e^(epsilon.alt l \( W \)) parallel W parallel lt.eq
   product_(k gt.eq 0) (1 + A_1 \( 1 + k \)^(r_J) e^(- kappa_1 b k + epsilon.alt \( k + 1 \))) < oo \,
   $ <j:exterior-word-bound>]

uniformly in $m$. Equations (7.20) and (7.21) give the uniform central and word bounds required by Lemma 18.

We also need the dependence on the position of each edge within a block.
  At the right edge, with $s = x - b L$, replace the suppressed powers by
  $exp \( - a Lambda_(v \, +) e^(- kappa_1 s) \)$. At the left edge, with $s = x + b L$,
  use $exp \( - a Lambda_(v \, -) e^(kappa_1 s) \)$. These profiles define kernels analytic in $a$ near the closed
  interval $\[ 1 \, e^(kappa_1 b) \]$. Choose this neighborhood so that $Re \( a Lambda_(v \, plus.minus) \)$
  remains positive for every suppressed label; the same domination and summable bounds then apply.
  The exterior differences in (7.15) converge to their profile differences at $a =
  a_m$ with error $C e^(- c L) e^(- c k)$. In the first $floor.l L \/ 4
  floor.r$ central blocks from each edge the analogous normalized error is $C e^(- c L)$.
  Indeed the error from the two-term expansion of $log omega_v$, after multiplication by $m$,
  is $O \( m e^(- 2 kappa_1 \| x \|) \)$ in these regions. Deeper central blocks differ from $I_0 \/
  u$ by a superexponentially small amount.

It follows that there is an analytic trace-class family $C \( a \, theta \)$ such that

#[#set math.equation(numbering: n => "(7.22)")
 $ tilde(C)_m = C \( a_m \, theta \) + O \( e^(- c L) \) quad upright("in trace norm") . $ <j:central-profile>]

Construct it by taking the ordered left interior profile from its edge inwards, then $P_I$,
  then the right interior profile from inside to its edge, and taking limits in the two lengths.
  Inserting an additional block next to $P_I$ changes the product by a summable superexponential error,
  since $P_I$ is fixed by $I_0 \/ u$ and all partial products are bounded.
  For comparison with $tilde(C)_m$, the middle portion after the first interior blocks from both edges is $P_I +
  O \( e^(- c L) \)$ in operator norm by (7.13) and the same expansion.
  The bracketing products have bounded Hilbert–Schmidt norms.
  Replacing their edge portions by the profile kernels then gives (7.22) by telescoping.

=== 7.7 The finite-site limit and coefficient extraction <the-finite-site-limit-and-coefficient-extraction>

For fixed $m$, define the normalized physical quantity

#[#set math.equation(numbering: n => "(7.23)")
 $ R_m \( theta \) = e^(- m^2 kappa_oo) frac(N \( X \)^2, P_0) G_(A \, B) \( h + h^(- 1) \) \, wide kappa_oo =
   lim_(T arrow.r oo) kappa_T \, $ <j:normalized-cylinder>]

with homogeneous $X$ and $h = e^(- 2 i theta)$. The fixed-site contour limit, the gas identity, and the $m =
  0$ trace in (7.11) identify $R_m$ with the $n arrow.r oo$ limit of the ratio of the trace with periodized site
  factors to $"tr" E_0^n$. Use blocks $- floor.l n \/ 2 floor.r lt.eq j < ceil.l n \/ 2 ceil.r$.

In the numerator normalized by $r_E^n$, the periodized site factors can be replaced by the actual single-profile
  factors $T_(m \, j)$, not by their edge limits, with an error tending to zero.
  At fixed $m$ each block difference costs $O_m \( e^(- c n) \)$ in the kernel estimate.
  To control its surrounding products, expand the unperiodized exterior differences by subsets in increasing or
  decreasing exterior index. Pair each power gap between successive perturbations with the farther index;
  the polynomial power bound for $E'$ is then absorbed by the exponential decay in (7.19).
  Only one unrestricted power gap remains, giving a polynomial bound in $n$ for any exterior half-segment.
  A whole subinterval has at most two such portions and a fixed central part.
  Expanding the additional periodization differences retains these polynomial bounds,
  while their exponential smallness makes the total error tend to zero.
  The same argument applies to traces by keeping two Hilbert–Schmidt factors.

The bare normalized traces $"tr" \( E' \)^n$ are bounded:
  their peripheral expansions contain only multiplicity times eigenvalue powers,
  since positive nilpotent powers have trace zero. Multiplying the known ratio limit by these bounded traces and
  using the replacement just proved therefore gives

#[#set math.equation(numbering: n => "(7.24)")
 $ "tr" product_j \( T_(m \, j) \/ r_E \) - R_m "tr" \( E' \)^n arrow.r 0 $ <j:fixed-site-trace-difference>]

at fixed $m$. No lower bound on the bare trace is used.

We now apply Lemma 18 to (7.16). Each actual exterior half has length $s \/ 2 + O \( 1 \)$,
  rather than allowing every pair with $l_(+) + l_(-) lt.eq s$.
  Extending to that latter set adds only pairs with total word length at least $s \/ 2 - O \( 1 \)$.
  By (7.21) and the polynomial power bound, their contribution is $O_m \( \( 1 + s \)^r e^(- c s) \)$.
  It is negligible at fixed $m$. Thus (7.24) is the lemma’s difference hypothesis with

$ E = E' \, wide C = C'_m = \( u \/ r_E \)^(2 L) tilde(C)_m \, wide a = 2 L . $

For a peripheral eigenvalue $zeta$ of $E'$, write $P_zeta$ for its Riesz projection, $d_zeta = "rank" P_zeta$,
  and $J_zeta = \( E' - zeta \) P_zeta$. The coefficient polynomial supplied by the lemma is, in the present notation,

#[#set math.equation(numbering: n => "(7.25)")
 $ cal(P)_(zeta \, m) \( s \) = sum_(W_(+) \, W_(-)) zeta^(- l_(+) - l_(-)) "tr" #h(-0.16667em)
   (C'_m W_(+) [sum_(t gt.eq 0) binom(s - l_(+) - l_(-), t) zeta^(- t) J_zeta^t P_zeta] W_(-)) .
   $ <j:cylinder-coefficient>]

The nilpotent sum is finite. The word sum is coefficientwise absolutely convergent by (7.21). The lemma gives directly

#[#set math.equation(numbering: n => "(7.26)")
 $ R_m = frac(cal(P)_(zeta \, m) \( 0 \), d_zeta zeta^(2 L)) \, wide \| R_m \| lt.eq
   C \| u \/ r_E \|^(2 L) . $ <j:balanced-trace-estimate>]

The constant is uniform in $m$ on the fixed parameter neighborhood:
  the word moments, central trace norm, and peripheral nilpotent bounds are uniform, and $\| zeta^(2 L) \| =
  1$ makes the changing offset harmless.

The analytic dependence on the edge position is also retained.
  Replace $tilde(C)_m$ in (7.25) by $C \( a \, theta \)$ and each exterior difference by its profile limit.
  Their exponentially small weighted errors telescope in the absolutely summable word series.
  Hence, locally uniformly in $\| Re theta \| < pi \/ 2$,

#[#set math.equation(numbering: n => "(7.27)")
 $ R_m \( u \/ r_E \)^(- 2 L) d_zeta zeta^(2 L) = cal(F)_zeta \( a_m \, theta \) + O \( e^(- c L) \) \,
   $ <j:balanced-trace-profile>]

where $cal(F)_zeta$ is analytic in $a$ near $\[ 1 \, e^(kappa_1 b) \]$ and locally analytic in $theta$.
  Fixed separating contours give the stated uniform spectral bounds.
  Equations (7.26)–(7.27) are the operator outputs used after the remaining homogeneous scalar normalization.

== 8 Homogeneous Pfaffian normalization <c7:pfaffian>

We now compute the scalar normalization used in the cylinder pressure.
  Recall from Section 3 that, for an even list $X = \( x_1 \, dots.h \, x_(2 m) \)$,

$ d \( u \, v \) & = u^2 + sqrt(2) u v + v^2 \, wide cal(P) \( X \) =
  product_(j < k) frac(d \( x_j \, x_k \), x_j - x_k) \,\
N \( X \) & = cal(P) \( X \) "Pf"_(j \, k) frac(x_j^2 - x_k^2, d \( x_j \, x_k \)) . $

The coincident-site value is defined by polynomial continuation. We prove

#[#set math.equation(numbering: n => "(8.1)")
 $ N \( 1 \, dots.h \, 1 \) = (frac(2 p_0, 3))^(m \( 2 m - 1 \)) (2 / 3)^m m^(5 \/ 48 + o \( 1 \)) \, wide p_0 =
   2 + sqrt(2) . $ <j:homogeneous-normalization>]

A reference Pfaffian supplies the first factor. The ratio to that reference becomes a Gram determinant,
  and an even-test logarithmic statistic supplies the remaining power.

=== 8.1 Confluence and the even cross Gram matrix <confluence-and-the-even-cross-gram-matrix>

Put $eta = pi \/ 4$ and $x_j = e^(eta w_j)$. The kernel of $N$ is

$ B_0 \( w \) = frac(sinh \( eta w \), cosh \( eta w \) + cos \( pi \/ 4 \)) . $

Compare it with $C \( w \) = tanh \( pi w \/ 6 \)$. Schur’s Pfaffian identity [11] (1.2) gives

$ "Pf"_(j \, k) frac(y_j - y_k, y_j + y_k) = product_(j < k) frac(y_j - y_k, y_j + y_k) . $

For clarity, multiplying the Pfaffian by $product_(j < k) \( y_j + y_k \)$ produces an alternating polynomial of
  Vandermonde degree, hence a constant times $product_(j < k) \( y_j - y_k \)$.
  The constant is one by taking positive $y_1 gt.double y_2 gt.double dots.h.c$:
  the limiting skew matrix with all upper entries one has Pfaffian one by first-row induction.
  Taking $y_j = e^(pi w_j \/ 3)$ gives the pair product for $C$. As the $w_j$ tend to zero,

$ frac(d \( x_j \, x_k \), x_j - x_k) C \( w_j - w_k \) arrow.r p_0 frac(pi \/ 6, eta) = frac(2 p_0, 3) . $

Thus $cal(P) \( X \) "Pf" C \( w_j - w_k \)$ tends to $\( 2 p_0 \/ 3 \)^(m \( 2 m - 1 \))$.

We next make the ratio of the two confluent Pfaffians explicit.
  For either analytic odd kernel $B = B_0 \, C$, apply the same divided-difference transformations to its rows and
  columns. At confluence the entry of orders $r \, s$ is

$ frac(\( - 1 \)^s, r ! thin s !) B^(\( r + s \)) \( 0 \) \, wide 0 lt.eq r \, s < 2 m . $

Entries with $r \, s$ of the same parity vanish. After grouping the even and odd orders,
  the Pfaffian is therefore, up to common signs, the determinant of the cross matrix with $r = 2 a$, $s = 2 b +
  1$. With the Fourier convention $hat(h) \( k \) = integral_(bb(R)) e^(- i k w) h \( w \) thin d w$,
  this cross entry is

$ - frac(\( - 1 \)^(a + b), \( 2 a \) ! \( 2 b + 1 \) !) frac(1, 2 pi) integral_(bb(R)) k^(2 \( a + b \))
  hat(B') \( k \) thin d k . $

The signs and factorials cancel in the ratio for $B_0$ and $C$.
  Consequently that ratio is the ratio of Gram determinants of $1 \, k^2 \, dots.h \,
  k^(2 m - 2)$ for the weights $hat(B'_0) \( k \) thin d k$ and $hat(C') \( k \) thin d k$.

Both weights are strictly positive and have all moments finite.
  To compute them, put $tilde(B)_beta \( t \) = sinh t \/ \( cosh t + cos beta \)$, so

$ B_0 \( w \) = tilde(B)_(pi \/ 4) \( pi w \/ 4 \) \, wide C \( w \) = tilde(B)_(pi \/ 2) \( pi w \/ 6 \) . $

Applying $cos beta + sin beta thin partial_beta$ to the transform of $\( cosh t + cos beta \)^(- 1)$ from Lemma 5
  gives $hat(tilde(B)'_beta) \( xi \) = 2 pi xi cosh \( beta xi \) \/ sinh \( pi xi \)$.
  Scaling the two identities above gives

$ hat(B'_0) \( k \) = frac(8 k cosh k, sinh 4 k) \, wide hat(C') \( k \) = frac(6 k, sinh 3 k) . $

At zero these expressions use their continuous limits. For $t = e^(- \| k \|)$ their ratio is

$ frac(hat(B'_0) \( k \), hat(C') \( k \)) = 2 / 3 e^(phi.alt \( k \)) \, wide phi.alt \( k \) =
  log frac(\( 1 + t^2 \) \( 1 - t^6 \), 1 - t^8) . $

Extend $phi.alt$ continuously by $phi.alt \( 0 \) = log \( 3 \/ 2 \)$. Set $u = 3 k \/ pi$ and

$ mu \( u \) = frac(2 u, sinh pi u) \, wide f \( u \) = phi.alt \( pi u \/ 3 \) . $

Use $mu \( 0 \) = 2 \/ pi$. The measure $mu \( u \) thin d u$ is a probability measure, and $f$ is real,
  continuous, even, and exponentially decaying. Let $P_m$ be the orthogonal projection in
  $L^2 \( mu \( u \) thin d u \)$ onto $"span" { 1 \, u^2 \, dots.h \, u^(2 m - 2) }$.
  Changing variables in the Gram determinants gives the exact identity

#[#set math.equation(numbering: n => "(8.2)")
 $ N \( 1 \, dots.h \, 1 \) = (frac(2 p_0, 3))^(m \( 2 m - 1 \)) (2 / 3)^m det \( P_m e^f P_m \|_("ran" P_m) \) .
   $ <j:pfaffian-projection>]

Here $e^f$ denotes multiplication by $e^(f \( u \))$. We now evaluate this last determinant at logarithmic order.

=== 8.2 A logarithmic statistic for even tests <a-logarithmic-statistic-for-even-tests>

#thm([Lemma 8.1.])[
  #emph[Let $mu \( u \) = 2 u \/ sinh \( pi u \)$, with its continuous value at zero,
    and let $P_m$ project in $L^2 \( mu \( u \) thin d u \)$ onto the even polynomials of degree at most $2 m -
    2$. If $f : bb(R) arrow.r bb(R)$ is continuous and even and satisfies $\| f \( u \) \| lt.eq
    C e^(- c \| u \|)$ for some $C \, c > 0$, then
$ log det \( P_m e^f P_m \|_("ran" P_m) \) = frac(log m, 2 pi) integral_(bb(R)) f \( u \) thin d u + o \( log m \) . $

]
] <j:even-log-statistic>

#proof[
  We first describe the projection kernel. The Fourier transform of the probability density $mu$ is
  $ integral_(bb(R)) e^(i s u) mu \( u \) thin d u = frac(1, cosh^2 \( s \/ 2 \)) . $
  For example, for $s > 0$ the residues at $u = i n$, $n gt.eq 1$,
    give $4 sum_(n gt.eq 1) \( - 1 \)^(n + 1) n e^(- n s)$, which is the displayed function;
    evenness and dominated convergence cover the remaining real $s$. It follows that
  $ H \( z \, u \) = \( 1 - i z \)^(- 1 + i u) \( 1 + i z \)^(- 1 - i u) = sum_(n gt.eq 0) p_n \( u \) z^n $
  generates real orthogonal polynomials of degree $n$, with leading coefficient $2^n \/ n !$, parity $n$,
    and squared norm $n + 1$. Indeed, integrate $H \( z \, u \) H \( z' \, u \)$ near $z = z' =
    0$ and use the Fourier transform to obtain $\( 1 - z z' \)^(- 2)$.
    These are the Meixner–Pollaczek polynomials with parameters $\( 1 \, pi \/ 2 \)$ [16] Equation 18.23.7.
    In particular the even members span $"ran" P_m$.
  Uniformly for $u$ in a fixed real compact set, singularity expansion of this generating function gives,
    as $j arrow.r oo$,
  #[#set math.equation(numbering: n => "(8.3)")
   $ p_(2 j) \( u \) = \( - 1 \)^j (a \( u \) \( 2 j \)^(i u) + overline(a \( u \)) \( 2 j \)^(- i u)) +
     O \( log j \/ j \) \, $ <j:even-polynomial-asymptotic>]
  where $a \( - u \) = overline(a \( u \))$ and
  #[#set math.equation(numbering: n => "(8.4)")
   $ \| a \( u \) \|^2 mu \( u \) = frac(1, 2 pi) . $ <j:even-amplitude>]
  Here is a direct error estimate. Subtract from $H$ its two leading singular terms
  $ 2^(- 1 + i u) \( 1 + i z \)^(- 1 - i u) + 2^(- 1 - i u) \( 1 - i z \)^(- 1 + i u) . $
  Taylor expansion of the regular factors at $z = i$ and $z = -
    i$ bounds the derivative of the remainder in the unit disk by
    $C \( 1 + \| z - i \|^(- 1) + \| z + i \|^(- 1) \)$, uniformly on the chosen $u$ compact.
    Cauchy’s formula for its derivative on the circle of radius $1 - 1 \/ n$, followed by division by $n$,
    bounds its coefficient by $O \( log n \/ n \)$. The binomial coefficients of the two singular terms give
  $ a \( u \) = 2^(- 1 + i u) lim_(n arrow.r oo) n^(- i u) product_(ell = 1)^n \( 1 + i u \/ ell \) . $
  Logarithms give convergence with $O \( 1 \/ n \)$ error on compacts.
    Taking moduli and using the sine product gives $\| a \( u \) \|^2 = sinh \( pi u \) \/ \( 4 pi u \)$,
    proving (8.4) and (8.3).
  The projection kernel relative to $mu \( u \) thin d u$ is
  $ K_m \( u \, v \) = sum_(j = 0)^(m - 1) frac(p_(2 j) \( u \) p_(2 j) \( v \), 2 j + 1) . $
  Put $D_m = log m$. For fixed $u eq.not 0$,
  #[#set math.equation(numbering: n => "(8.5)")
   $ frac(K_m \( u \, u \), D_m) arrow.r \| a \( u \) \|^2 \,\
frac(K_m \( u \, plus.minus u + s \/ D_m \), D_m) arrow.r \| a \( u \) \|^2 frac(sin s, s) \, $ <j:even-kernel-peaks>]
  uniformly for $s$ in bounded intervals, with the continuous value at $s = 0$. To verify this, insert (8.3).
    The summable errors contribute $O \( 1 \)$. Comparing $sum_(1 lt.eq j < m) e^(i r log \( 2 j \)) \/
    j$ with its integral has bounded error for $r$ in compact sets.
    Only $r = u - v$ near the first peak and $r = u + v$ near the second peak contribute at order $D_m$.
    Their two conjugate terms yield $sin s \/ s$. At $u = 0$ the peaks coalesce;
    this single point will not affect the integrals below.
  The two peaks exhaust the leading projection norm. Indeed,
  $ integral_(bb(R)) \| K_m \( u \, v \) \|^2 mu \( v \) thin d v = K_m \( u \, u \) . $
  For fixed $u eq.not 0$, integrate over the two intervals $v = plus.minus u + s \/ D_m$, $\| s \| lt.eq A$.
    By (8.5), their total contribution divided by $D_m$ tends to
  $ 2 \| a \( u \) \|^4 mu \( u \) integral_(- A)^A \( sin s \/ s \)^2 thin d s . $
  As $A arrow.r oo$ this tends to $\| a \( u \) \|^2$, by (8.4) and $integral_(bb(R)) \( sin s \/ s \)^2 thin d
    s = pi$. This is exactly the limit of $K_m \( u \, u \) \/ D_m$.
  We also need a bound valid for all $u$:
  #[#set math.equation(numbering: n => "(8.6)")
   $ K_m \( u \, u \) mu \( u \) lt.eq C D_m \( 1 + \| u \| \) \, wide m gt.eq 2 . $ <j:even-kernel-bound>]
  Take $r = e^(- 1 \/ m)$. Up to an absolute factor, $K_m \( u \, u \)$ is at most $sum_(n gt.eq 0) p_n \( u \)^2
    r^n \/ \( n + 1 \)$. Angular averaging of the generating function gives
  $ sum_(n gt.eq 0) frac(p_n \( u \)^2 r^n, n + 1) = 1 / r integral_0^r frac(1, 2 pi) integral_0^(2 pi) \|
    H \( sqrt(t) thin e^(i theta) \, u \) \|^2 thin d theta thin d t . $
  The quotient $\( 1 - i z \) \/ \( 1 + i z \)$ has positive real part in the unit disk. Thus
  $ \| H \( z \, u \) \|^2 lt.eq e^(pi \| u \|) \| 1 + z^2 \|^(- 2) . $
  The angular average of the last factor is $\( 1 - \| z \|^4 \)^(- 1)$, so the preceding integral is at most
  $ e^(pi \| u \|) / r integral_0^r frac(d t, 1 - t^2) lt.eq C e^(pi \| u \|) log m . $
  Multiplying by $mu \( u \) lt.eq C \( 1 + \| u \| \) e^(- pi \| u \|)$ proves (8.6).
  Dominated convergence using (8.5), (8.4), and (8.6) now gives
  #[#set math.equation(numbering: n => "(8.7)")
   $ frac("tr" \( P_m f P_m \), D_m) arrow.r frac(1, 2 pi) integral_(bb(R)) f \( u \) thin d u . $ <j:even-trace-limit>]
  There is also a smaller fluctuation term:
  #[#set math.equation(numbering: n => "(8.8)")
   $ parallel \( 1 - P_m \) f P_m parallel_2^2 = o \( D_m \) \, $ <j:even-commutator>]
  where $parallel dot.op parallel_2$ is the Hilbert–Schmidt norm. The squared norm equals
  $ 1 / 2 integral.double_(bb(R)^2) \( f \( u \) - f \( v \) \)^2 \| K_m \( u \, v \) \|^2 mu \( u \) mu \( v \)
    thin d u thin d v . $
  For each fixed $u eq.not 0$, the inner integral divided by $D_m$ tends to zero:
    the two peak neighborhoods exhaust the projection norm, and continuity and evenness give $f \( v \) arrow.r
    f \( u \)$ in both neighborhoods. The diagonal bound permits dominated convergence when either variable is in
    a fixed compact interval. When both variables are outside that interval,
    use $\( f \( u \) - f \( v \) \)^2 lt.eq 2 f \( u \)^2 + 2
    f \( v \)^2$ and the projection identity to bound the normalized contribution by
  $ C integral_(\| u \| > A) f \( u \)^2 \( 1 + \| u \| \) thin d u \, $
  which tends to zero as $A arrow.r oo$. This proves (8.8).
    The evenness assumption is used precisely at the second peak $v = - u$.
  Finally set
  $ L_m \( s \) = log det \( P_m e^(s f) P_m \|_("ran" P_m) \) \, wide 0 lt.eq s lt.eq 1 . $
  This determinant is positive. If $P_(m \, s)$ projects onto $e^(s f \/ 2) "ran" P_m$,
    differentiating its Gram matrix gives
  $ L'_m \( s \) = "tr" \( P_(m \, s) f \) \, wide L''_m \( s \) =
    parallel \( 1 - P_(m \, s) \) f P_(m \, s) parallel_2^2 . $
  These second derivatives are bounded uniformly in $s$ by a constant times the left side of (8.8).
    To see this, regard $U_s = e^(s f \/ 2) P_m$ as a map from $"ran" P_m$,
    and use the isometry $U_s \( U_s^(*) U_s \)^(- 1 \/ 2)$ onto $"ran" P_(m \, s)$. The identity
  $ \( 1 - P_(m \, s) \) f e^(s f \/ 2) P_m = \( 1 - P_(m \, s) \) e^(s f \/ 2) \( 1 - P_m \) f P_m $
  and the bounds on $e^(s f \/ 2)$ and $\( U_s^(*) U_s \)^(- 1 \/ 2)$ give the comparison,
    with a constant depending only on $parallel f parallel_oo$.
    Since $L_m \( 0 \) = 0$ and $L'_m \( 0 \) = "tr" \( P_m f P_m \)$,
  $ L_m \( 1 \) = L'_m \( 0 \) + integral_0^1 \( 1 - s \) L''_m \( s \) thin d s . $
  The uniform second-derivative bound and (8.7) prove the lemma. ◻
]

For the function in (8.2),

$ frac(1, 2 pi) integral_(bb(R)) f \( u \) thin d u = 3 / pi^2 integral_0^oo phi.alt \( k \) thin d k . $

Expanding the three logarithms into geometric series gives

$ integral_0^oo phi.alt \( k \) thin d k = pi^2 / 24 - pi^2 / 36 + pi^2 / 48 = frac(5 pi^2, 144) . $

Lemma 19 therefore makes the determinant in (8.2) equal to $m^(5 \/ 48 + o \( 1 \))$. Substitution proves (8.1).

== 9 The physical cylinder exponent <c7:cylinder-exponent>

The operator estimate in Section 7 controls the normalized quantity $R_m$ from (7.23).
  We now insert the homogeneous scalar normalization and return to the positive cylinder partition.
  Here $A \, B$ are the two intervals on the balanced horizontal cut of the introduction, so $G_(A \, B) = G_m$.
  Each has size $m$, and $m$ tends to infinity through even integers.

For $X = \( 1 \, dots.h \, 1 \)$ of size $2 m$, (8.1) gives

$ N \( X \) = \( 2 p_0 \/ 3 \)^(m \( 2 m - 1 \)) \( 2 \/ 3 \)^m m^(5 \/ 48 + o \( 1 \)) \, wide p_0 = 2 + sqrt(2) \, $

where the absolute value would suffice. Together with $P_0$ and $kappa_oo$, this gives

#[#set math.equation(numbering: n => "(9.1)")
 $ e^(- m^2 kappa_oo) frac(N \( X \)^2, P_0) = m^(5 \/ 24 + o \( 1 \)) . $ <j:physical-scalar-normalization>]

Put $Theta = - 2 theta$, $g = 2 cos Theta$, and

$ p_(*) \( Theta \) = 1 / 6 - frac(2 Theta^2, 3 pi^2) . $

In (7.26), $u = u_0$ and $L = log m \/ \( kappa_1 b \) + O \( 1 \)$, with $kappa_1 = pi \/ 3$.
  The contribution of the interval follows from the exact exponential expression

$ u / r_E = exp #h(-0.16667em) (frac(b pi, 16) - frac(4 b theta^2, 9 pi)) \,\
frac(2, kappa_1 b) (frac(b pi, 16) - frac(4 b theta^2, 9 pi)) = 3 / 8 - frac(8 theta^2, 3 pi^2) . $

Subtracting the exponent $5 \/ 24$ in (9.1) proves the locally uniform bound

#[#set math.equation(numbering: n => "(9.2)")
 $ \| G_(A \, B) \( 2 cos Theta \) \| lt.eq m^(Re p_(*) \( Theta \) + o \( 1 \)) \,
   wide \| Re Theta \| < pi . $ <j:cylinder-complex-bound>]

The exact normalization at $g = 0$ supplies the logarithmic derivative bound.
  At $theta_i = - pi \/ 4$, equivalently $Theta = pi \/ 2$, the partition is $G_(A \, B) \( 0 \) =
  1$ and $p_(*) \( pi \/ 2 \) = 0$. Thus it saturates the exponent in (9.2).
  In particular the analytic coefficient $cal(F)_zeta \( a \, theta_i \)$ in (7.27) cannot vanish at any point of
  $\[ 1 \, e^(kappa_1 b) \]$. Indeed even integers $m$ can approximate any point of this interval by $a_m$ with
  error exponentially small in $L$, from inside at the endpoints.
  A zero, together with the exponentially small error in (7.27),
  would make $\| R_m \( u \/ r_E \)^(- 2 L) \|$ exponentially small in $L$.
  This contradicts (9.1) and $G_(A \, B) \( 0 \) = 1$, which give $\| R_m \( u \/ r_E \)^(- 2 L) \| =
  m^(o \( 1 \))$ there.

Compactness of the $a$ interval now gives a parameter neighborhood of $theta_i$ on which the analytic factor stays
  nonzero and its fixed-order logarithmic derivatives are bounded.
  The analytic error in (7.27) has the same local derivative control on a smaller neighborhood by Cauchy
  estimates. Differentiating the resulting expression for $G_(A \, B)$ along the local branch $Theta \( g \)$ near
  $g = 0$ therefore yields

#[#set math.equation(numbering: n => "(9.3)")
 $ - partial_g^2 log G_(A \, B) \( 0 \) = O \( log m \) . $ <j:cylinder-pair-bound>]

It remains to obtain the matching lower bound at $g = 2$. We claim

#[#set math.equation(numbering: n => "(9.4)")
 $ G_(A \, B) \( 2 \) = m^(1 \/ 6 + o \( 1 \)) . $ <j:cylinder-positive-exponent>]

The upper bound is (9.2). If the lower bound failed along a sequence by a fixed exponent gap,
  positivity of the polynomial coefficients would give $\| G_(A \, B) \( g \) \| lt.eq
  G_(A \, B) \( 2 \)$ for $\| g \| lt.eq 2$. Choose a sufficiently small nonzero real $Theta_0$ and then a disk
  about it on which $\| 2 cos Theta \| < 2$ and $Re p_(*) \( Theta \)$ is sufficiently close to $1 \/ 6$.
  On this disk the analytic function

$ G_(A \, B) \( 2 cos Theta \) m^(- p_(*) \( Theta \)) $

would have modulus at most $m^(- delta)$ for some fixed $delta > 0$.
  Its local upper bound elsewhere in the strip is subpower by (9.2).
  The three-circle inequality on finitely many overlapping disks along the interval from $Theta_0$ to $pi \/
  2$ propagates a positive fraction of the exponent gap to $pi \/ 2$. This contradicts the exact value one there.
  This proves (9.4), and with (9.2)–(9.3) proves the cylinder assertions of Theorem 1.

== 10 Half-plane arches and interior visits <c7:boundary>

The boundary argument starts from the local balance and fusion identities of Section 2.
  An added cylinder row measures the deficit between the boundary balance and the arches that embed in that
  cylinder. We express its derivative by a positive integral, estimate that integral,
  and then use a wedge comparison to control the radius of an arch.
  The last subsection relates boundary chords visiting an interior vertex to the planar nesting partition.

#thm([Proposition 10.1.])[
  (Boundary arch mass).  #emph[Fix a port on a horizontal tessellation half-plane boundary.
    Let $W_R$ be the total critical weight $x^N$ of first-exit same-boundary arches reaching Euclidean distance at
    least $R$ from that port. Then $W_R = R^(- 1 \/ 4 + o \( 1 \))$.
    If $H \( d \)$ is the mass of arches ending $d$ boundary steps to the right, then
$ 2 sin \( pi \/ 8 \) sum_(d > 0) H \( d \) = 1 \, wide sum_(d gt.eq n) H \( d \) lt.eq n^(- 1 \/ 4 + o \( 1 \)) . $

 The constants are unchanged by lattice translations and rotations.]
] <j:boundary>

=== 10.1 The fused cylinder increment <the-fused-cylinder-increment>

On a finite cylinder of circumference $M$ with closed rims,
  let $Z$ be the partition of exactly one unoriented noncontractible polygon.
  As in Section 2, it is the coefficient of $n$ in the loop sum with contractible-loop weight zero and
  noncontractible-loop weight $n = p + p^(- 1)$. Write $cal(T)_p \( phi.alt \)$ for the oriented row transfer
  matrix with row parameter $phi.alt$, and put $alpha = pi \/ 8$.

The row matrices with the same twist commute. Indeed, multiply the local exchange identity across the sites and
  trace over the two auxiliary spaces. Their twist $p^(s_1 + s_2)$ commutes with the exchanging matrix.
  This proves commutation where that matrix is invertible, and then identically by continuation.
  In particular, a stack matrix element between empty rims, and its coefficient $Z$, is symmetric in its rows.

We will also need the order of the error in fusing two rows.
  Let $U = "im" J subset V_1 ⊗ V_2$ for the embedding at $2 alpha$ in Section 2, and at site $j$ set

$ X_j \( phi.alt \) = R_(2 j) \( phi.alt \) R_(1 j) \( phi.alt + 2 alpha \) . $

The local intertwining preserves $U ⊗ V_j$ and, through the isomorphism $J : V arrow.r U$,
  induces $R \( phi.alt + alpha \)$. At $phi.alt = 0$,

$ X_j \( 0 \) = P_(2 j) R_(1 j) \( 2 alpha \) \, wide "im" X_j \( 0 \) subset U ⊗ V_j \, $

where $P_(2 j) = R_(2 j) \( 0 \)$ is the swap. The inclusion follows because $R_(1 j) \( 2 alpha \) =
  J_(1 j) J_(1 j)^(*)$ and the swap carries the embedded spaces $1 \, j$ to $1 \, 2$.
  Thus the operator induced by $X_j \( phi.alt \)$ on the quotient by $U ⊗ V_j$ is $O \( phi.alt \)$.
  Its product over the $M$ sites is $O \( phi.alt^M \)$.

The twist preserves this invariant subspace and satisfies $p^(s_1 + s_2) J = J p^s$.
  Taking the auxiliary trace on the invariant subspace is therefore the trace of the fused row;
  the similarity through $J$ introduces no factor involving $J^(*) J$. Taking the trace on the quotient gives

#[#set math.equation(numbering: n => "(10.1)")
 $ cal(T)_p \( phi.alt \) cal(T)_p \( phi.alt + 2 alpha \) = cal(T)_p \( phi.alt + alpha \) +
   O \( phi.alt^M \) . $ <j:boundary-row-fusion>]

This is a locally holomorphic statement in $\( phi.alt \, p \)$ near $\( 0 \, i \)$.
  After taking an empty-rim stack matrix element, the loop sum is a polynomial in $n = p + p^(- 1)$.
  Since $d n \/ d p = 2$ at $p = i$, extracting its coefficient of $n$ preserves the order of vanishing.

Put one new outer row on $L$ honeycomb rows, whose parameters are all $alpha$,
  and subtract the partition without the new row. We next describe the height limit of this increment.
  A loop wholly in the new row gives $v^M$. Otherwise the lift of the loop uses $2 k >
  0$ ports into the base strip per period. No exterior port is used.
  The new row therefore pairs consecutive ports in $k$ occupied intervals, each with one turn of weight $u$,
  one of weight $d$, and straight tiles of weight $v$.

Here the topology forces a particularly simple matching in the base.
  Number the lifted ports in increasing order so that the outer intervals are $\( 2 j - 1 \, 2 j \)$.
  In a noncrossing lower perfect matching, the interior of a pair is matched internally,
  so the pair’s endpoints have opposite parity. If its left endpoint is odd,
  the block including the endpoints is closed under both matchings.
  If its left endpoint is even but the right endpoint is not the next port,
  the interior is closed under both matchings. Either case creates a finite component.
  The lift of one noncontractible polygon is an infinite component,
  so the lower pairs are exactly $\( 2 j \, 2 j + 1 \)$.

For $1 lt.eq d < M$, let $H_M \( d \)$ be the weight of half-plane arches from a fixed port to the port $d$ steps
  to its right that are disjoint from all their nontrivial horizontal translates by $M$.
  More generally the coefficient for $k$ lower arches requires the arches and all their translates to be mutually
  disjoint. At fixed $M$ these coefficient sums converge as $L arrow.r oo$:
  dropping the mutual disjointness conditions bounds each by a product of the finitely many $H \( d \)$ involved.
  The coarse summability proved in Section 2 suffices for this limit.

The tile weights satisfy

$ u d = c_alpha v \( 1 - v \) \, wide c_alpha = 2 sin alpha . $

There are at most $M - 2 k$ straight tiles in a $k$-interval term.
  Hence the limiting increment is a polynomial $F \( v \)$ of degree at most $M$.
  For one lower gap of length $d$, the upper interval has $M - d -
  1$ straight tiles and $M$ possible positions in a labeled period.
  These positions count each unoriented polygon once. Isolating these terms gives

#[#set math.equation(numbering: n => "(10.2)")
 $ F \( v \) & = v^M + M c_alpha v \( 1 - v \) sum_(d = 1)^(M - 1) v^(M - d - 1) H_M \( d \)\
 & wide + \( 1 - v \)^2 Q_M \( v \) \,\
F \( 1 \) & = 1 \, wide F'_v \( 1 \) = M (1 - c_alpha sum_(d = 1)^(M - 1) H_M \( d \)) \,
  $ <j:boundary-arch-derivative>]

for a polynomial $Q_M$ (zero when no term with two intervals is possible).

We now pass (10.1) to these increments. Commute its two added rows to opposite closed rims of the base stack.
  Inclusion–exclusion says that the difference between the two-row increment and the sum of the one-row increments
  consists precisely of loops touching both added rows. On a closed rim no tile can use a double turn.
  On a fixed complex parameter neighborhood each remaining outer weight is bounded in absolute value by a constant
  times the corresponding positive honeycomb weight. There are only $2 M$ outer tiles.
  In the arch decomposition from the top, at least one base arch of a loop touching both rims reaches depth
  comparable to $L$. Its weight tends to zero by monotone convergence in the finite sums $H \( d \)$,
  after dropping the other disjointness conditions. The same domination makes this convergence locally uniform in
  the two outer parameters.

The one-row increments converge coefficientwise as polynomials in $v$,
  and therefore locally uniformly in their parameters. Cauchy’s formula now passes every vanishing derivative of
  order below $M$ in (10.1) to the limiting increments. With

$ y = i \( 2 phi.alt - 3 alpha \) \, wide v = frac(cosh y - sin alpha, cosh y + cos alpha) \, wide f \( y \) = 1 -
  F \( v \) \, $

the resulting identity near $y = - 3 i alpha$ is

#[#set math.equation(numbering: n => "(10.3)")
 $ f \( y \) + f \( y + 4 i alpha \) - f \( y + 2 i alpha \) = 1 +
   O \( \( y + 3 i alpha \)^M \) . $ <j:boundary-fusion-jet>]

=== 10.2 A positive moment representation <a-positive-moment-representation>

For $k > 0$, introduce column vectors indexed by $j = 0 \, dots.h \, M - 1$ and positive scalar weights

$ A_j \( k \) = partial_alpha^j sinh \( alpha k \) \, wide B_j \( k \) = partial_alpha^j cosh \( alpha k \) \,\
w \( k \) = frac(2 \( 1 + 4 sinh^2 \( alpha k \) \), sinh \( pi k \)) \, wide w_0 \( k \) = k w \( k \) . $

Since $F \( 1 \) = 1$, the function $f \( y \)$ is a linear combination of $\( cosh y + cos alpha \)^(- r)$,
  $1 lt.eq r lt.eq M$. The first $M$ parameter derivatives of

$ frac(sin alpha, cosh y + cos alpha) = integral_(bb(R)) e^(i k y) frac(sinh \( alpha k \), sinh \( pi k \)) thin d k $

span these powers: the derivative of order $j$ has a nonzero coefficient of the denominator power $j + 1$.
  Lemma 5 therefore gives a vector $upright(bold(c))$ such that

$ f \( y \) = integral_(bb(R)) e^(i k y) frac(A \( k \)^T upright(bold(c)), sinh \( pi k \)) thin d k . $

The integral and its required derivatives converge locally uniformly in $\| Im y \| < pi - alpha$.

At $y = - 3 i alpha$, the three arguments in (10.3) are $- 3 i alpha \, i alpha \, - i alpha$, all in this strip.
  Split the Fourier integral into positive and negative $k$.
  For derivative order $j$, this gives a factor $2 i^j k^j$ times $cosh \( 3 alpha k \)$ if $j$ is even,
  and times $sinh \( 3 alpha k \) - 2 sinh \( alpha k \)$ if $j$ is odd.
  Since $B_j \( k \)$ is $k^j cosh \( alpha k \)$ or $k^j sinh \( alpha k \)$ in the two cases, the identities

$ frac(cosh \( 3 z \), cosh z) = frac(sinh \( 3 z \) - 2 sinh z, sinh z) = 1 + 4 sinh^2 z $

then turn the $M$ derivative equations into

#[#set math.equation(numbering: n => "(10.4)")
 $ D upright(bold(c)) = B \( 0 \) \, wide D = integral_0^oo B \( k \) A \( k \)^T w \( k \) thin d k .
   $ <j:boundary-moment>]

Write $Delta \( z \) = product_(i < j) \( z_j - z_i \)$ for the Vandermonde. The matrix $D$ is nonsingular.
  Indeed, the ordered determinant expansion gives

$ det D =  & integral_(0 < k_1 < dots.h.c < k_M) det \[ B \( k_1 \) \, dots.h \, B \( k_M \) \]\
 & quad dot.op det \[ A \( k_1 \) \, dots.h \, A \( k_M \) \] product_i w \( k_i \) thin d k_i . $

Both determinants in the integrand are strictly positive.
  To see this, expand $sinh \( u k \)$ or $cosh \( u k \)$ in its positive power series.
  For each increasing list of powers $p_ell$, the coefficient minor after taking successive derivatives at $u =
  alpha$ is a positive factor times $det \[ \( p_ell \)_(underline(j)) \] = Delta \( p \)$.
  The other minor is a generalized Vandermonde in the ordered positive $k_i$, also positive.
  Its nonvanishing follows by the usual zero bound obtained from Rolle’s theorem after successively dividing out
  the lowest power; its sign follows by separating the positive $k_i$ in scale.
  The positive series expansion now proves the claim.

Set

$ K \( z \) = A \( z \)^T D^(- 1) B \( 0 \) . $

For real $y arrow.r + oo$, the residue at $k = i$ in the Fourier formula for $f$ gives $-
  2 i K \( i \) e^(- y)$ as its first term. On the polynomial side,

$ 1 - v = 2 \( cos alpha + sin alpha \) e^(- y) + O \( e^(- 2 y) \) . $

Equating the coefficients proves

#[#set math.equation(numbering: n => "(10.5)")
 $ F'_v \( 1 \) = frac(- i K \( i \), cos alpha + sin alpha) . $ <j:boundary-residue>]

We next express the quantity on the right by a positive expectation.

Give $0 < k_1 < dots.h.c < k_M$ the probability density proportional to

#[#set math.equation(numbering: n => "(10.6)")
 $ det \[ A \( k_1 \) \, dots.h \, A \( k_M \) \]\
 dot.op det \[ B \( k_1 \) \, dots.h \, B \( k_M \) \] product_i w \( k_i \) . $ <j:boundary-determinant-law>]

This law has a useful orbital form. For

$ D_k = "diag" \( k_1 \, dots.h \, k_M \, - k_1 \, dots.h \, - k_M \) \, wide Q =
  cal(U) "diag" \( alpha I_M \, - alpha I_M \) cal(U)^(*) \, $

where $cal(U)$ has normalized Haar measure on $U \( 2 M \)$, put

$ I \( k \) = bb(E) exp \( "tr" \( D_k Q \) \) . $

Then (10.6) is proportional to

#[#set math.equation(numbering: n => "(10.7)")
 $ Delta \( k^2 \)^2 product_i w_0 \( k_i \) thin I \( k \) . $ <j:boundary-orbital-law>]

In particular it is a positive probability density.

For completeness, we derive the paired confluent form used here from the Harish-Chandra–Itzykson–Zuber integral
  [19] Section 2, (2.1). For distinct real lists $z \, u$ of size $d$, put $D_z = "diag" \( z \)$ and $D_u =
  "diag" \( u \)$. Normalized unitary integration gives

$ integral_(U \( d \)) e^("tr" \( D_z cal(U) D_u cal(U)^(*) \)) thin d cal(U) =
  C_d frac(det \[ e^(z_i u_j) \], Delta \( z \) Delta \( u \)) \, wide C_d > 0 . $

One derivation uses the isotropic compression mechanism of [1] Section 4.
  Compress $cal(U) D_u cal(U)^(*)$ to a leading $\( d - 1 \)$-dimensional minor.
  Its ordered eigenvalues $l_i$ interlace the ordered $u_i$, and the last resolvent entry is

$ sum_(j = 1)^d frac(omega_j, t - u_j) = frac(product_(j < d) \( t - l_j \), product_(j lt.eq d) \( t - u_j \)) . $

Here $omega$ is uniform on the simplex, since its entries are squared moduli of a uniform complex unit vector.
  The residues give a bijection between the simplex interior and the interlacing region.
  Its absolute Jacobian is $Delta \( l \) \/ Delta \( u \)$, as follows by differentiating the residues,
  or by passing through the coefficients of the monic numerator.
  The compressed matrix, conditional on its eigenvalues, is again unitarily invariant.
  Induction with test parameters $z_i - z_d$ integrates each exponential column over $\[ u_j \, u_(j + 1) \]$;
  column subtraction and the factor $e^(z_d sum u_j)$ give the displayed determinant formula.
  The simplex normalization changes only $C_d$.

Apply this formula to the lists $plus.minus k_i \, plus.minus u_i$. The absolute paired Vandermonde is

$ \| Delta \( k_1 \, dots.h \, k_M \, - k_1 \, dots.h \, - k_M \) \| = 2^M product_i k_i thin Delta \( k^2 \)^2 \, $

and similarly for $u$. Splitting the exponential determinant into its sinh and cosh blocks therefore gives a
  positive constant times

$
  frac(det \[ sinh \( k_i u_j \) \] det \[ cosh \( k_i u_j \) \], Delta \( k^2 \)^2 Delta \( u^2 \)^2 product_i
  k_i u_i) . $

Divide both numerator determinants by $Delta \( u \)$ and let $u_i arrow.r alpha$ by divided differences.
  The remaining $u$ factors are constants, and the numerator becomes the two derivative determinants in (10.6).
  This proves (10.7). Also

$ I \( k \) lt.eq e^(2 alpha sum_i k_i) \, wide w_0 \( k \) tilde.op 4 k e^(- 6 alpha k)
  quad \( k arrow.r oo \) \, wide w_0 \( 0 \) = 2 \/ pi \, $

so the density is integrable and extends continuously when one point approaches zero.

#thm([Lemma 10.2.])[
  (Pinning at the origin).  #emph[Let $rho \( 0 \)$ be the one-point intensity at zero of (10.7).
    Pinning one point there leaves $N = M - 1$ positive points with density proportional to
$ Delta \( k^2 \)^2 product_(j = 1)^N k_j^4 w_0 \( k_j \) thin I \( k_1 \, dots.h \, k_N \, 0 \) . $

 The orbital integral here still uses the $2 M$-dimensional orbit, with one zero pair in $D_k$.
   For its expectation $bb(E)_(upright("pin"))$,
$ frac(sin alpha, alpha) frac(rho \( 0 \), w_0 \( 0 \)) bb(E)_(upright("pin"))
  product_(j = 1)^N \( 1 + k_j^(- 2) \) & lt.eq - i K \( i \)\
 & lt.eq frac(rho \( 0 \), w_0 \( 0 \)) bb(E)_(upright("pin")) product_(j = 1)^N \( 1 + k_j^(- 2) \) . $

 Empty products have value one.]
] <j:orbital-pin>

#proof[
  The continuous density at a single zero point defines $rho \( 0 \)$.
    For fixed $M$, the probability of two points in $\[ 0 \, t \]$ is $O_M \( t^6 \)$ by their squared Vandermonde
    factor. Hence
  $ lim_(t arrow.b 0) frac(bb(P) \( min_i k_i < t \), t) = rho \( 0 \) . $
  In the determinant density, evaluating a point at zero inserts $A' \( 0 \)$ and $B \( 0 \)$, since $A \( k \) =
    k A' \( 0 \) + O \( k^3 \)$ and $w \( k \) = w_0 \( 0 \) \/ k + O \( k \)$. Define
  $ cal(R) \( k \) =
    frac(det \[ A \( i \) \/ i \, A \( k_1 \) \, dots.h \, A \( k_N \) \], det \[ A' \( 0 \) \, A \( k_1 \) \,
    dots.h \, A \( k_N \) \]) . $
  The ordered adjugate expansion for $K \( i \) = A \( i \)^T D^(- 1) B \( 0 \)$ then gives exactly
  $ frac(K \( i \), i) = frac(rho \( 0 \), w_0 \( 0 \)) bb(E)_(upright("pin")) cal(R) \( k \) . $
  To compare the two determinants, first take distinct $0 < u_1 < dots.h.c <
    u_M$ in a fixed neighborhood of $alpha$ contained in $\( 0 \, pi \)$, before taking their confluent limit.
    Put $f_z \( u \) = sinh \( z u \) \/ z$, with $f_0 \( u \) = u$; thus $f_i \( u \) = sin u$.
    In the determinant with first column $f_z \( u \)$ and remaining columns $sinh \( k_j u \)$,
    remove $product_i f_z \( u_i \)$ and subtract adjacent rows. The identity
  $ (frac(sinh \( k_j t \), f_z \( t \)))' = frac(k_j^2 - z^2, f_z \( t \)^2) integral_0^t f_z \( v \)
    sinh \( k_j v \) thin d v $
  follows by differentiating the numerator of the left side and using the two second-order differential equations.
    After removing $product_j \( k_j^2 - z^2 \)$, row differences on the inner integrals express the remaining
    determinant as an integral of
  $ det \[ sinh \( k_j v_i \) \] product_i frac(f_z \( v_i \), f_z \( t_i \)^2) $
  over $u_i < t_i < u_(i + 1)$ and $t_(i - 1) < v_i < t_i$, with $t_0 = 0$.
    Its measure is positive by the same generalized Vandermonde argument.
  Let $g \( t \) = sin t \/ t$ with $g \( 0 \) = 1$. The ratio for $z = i$ and $z = 0$,
    after removing $product_j \( 1 + k_j^(- 2) \)$, is a positive weighted average of
  $ R =
    frac(product_(i = 1)^M g \( u_i \) product_(i = 1)^(M - 1) g \( v_i \), product_(i = 1)^(M - 1) g \( t_i \)^2) . $
  The function $log g$ decreases on $\( 0 \, pi \)$. The two interlacings give
  $ log g \( u_M \) lt.eq sum_i log g \( u_i \) - sum_i log g \( t_i \) lt.eq log g \( u_1 \) \, $
  and
  $ 0 lt.eq sum_i log g \( v_i \) - sum_i log g \( t_i \) lt.eq - log g \( t_(M - 1) \) . $
  Consequently $g \( u_M \) lt.eq R lt.eq g \( u_1 \) \/ g \( u_M \)$, uniformly in $M$ and the $k_j$.
    Taking all $u_i arrow.r alpha$ bounds this residual ratio between $sin alpha \/ alpha$ and one.
    The exact adjugate formula and $1 \/ i = - i$ prove the lemma. ◻
]

=== 10.3 Orbital derivatives and stochastic comparison <orbital-derivatives-and-stochastic-comparison>

We will apply the same estimates to the unpinned and pinned densities.
  For $e = 0$, write $bb(O)_N^(\( 0 \))$ for the unpinned orbital law of size $N$.
  For $e = 4$, write $bb(O)_N^(\( 4 \))$ for the law obtained by pinning one point of the size-$N +
  1$ orbital law. Their densities have the form

$ Delta \( k^2 \)^2 product_(i = 1)^N k_i^e w_0 \( k_i \) thin I^(\( e \)) \( k \) \, $

where $I^(\( 4 \))$ retains its zero pair. All coordinates below are sorted and positive.

#thm([Lemma 10.3.])[
  (Orbital derivative bound).  #emph[For either orbital factor, there are numbers $q_j$ such that
$ partial_(k_j) log I^(\( e \)) = 2 q_j \, wide 0 lt.eq q_j lt.eq min {alpha \, alpha^2 k_j \,
  frac(alpha^2, sum_(ell = 1)^N \( k_j + k_ell \)^(- 1))} . $

 The bounds are uniform in $N$.]
] <j:orbital-ward>

#proof[
  Use brackets for expectation tilted by $exp \( "tr" \( D_k Q \) \)$, and set $q_j =
    chevron.l Q_(+ j \, + j) chevron.r$. Exchanging all paired positions and sending $Q$ to $-
    Q$ preserves the orbit and this tilt. It gives $chevron.l Q_(- j \, - j) chevron.r = - q_j$,
    proving the derivative formula. The orbital integral is even in each $k_j$,
    while its logarithm is convex in that coordinate as a logarithmic moment generating function.
    Thus $q_j gt.eq 0$. Also $q_j lt.eq alpha$ because $parallel Q parallel = alpha$.
  Infinitesimal conjugation mixing two indices $a \, b$ gives
  $ chevron.l Q_(a a) - Q_(b b) chevron.r = \( \( D_k \)_(a a) - \( D_k \)_(b b) \) chevron.l \| Q_(a b) \|^2
    chevron.r . $
  For example, differentiate the integral of $Re Q_(a b)$ times the tilt under the generator $E_(a b) - E_(b a)$.
    Diagonal-unitary symmetry gives $2 chevron.l \( Re Q_(a b) \)^2 chevron.r =
    chevron.l \| Q_(a b) \|^2 chevron.r$, yielding the displayed factor. For $a = + j \, b = - ell$, this becomes
  $ chevron.l \| Q_(+ j \, - ell) \|^2 chevron.r = frac(q_j + q_ell, k_j + k_ell) . $
  The $ell = j$ term and $sum_b chevron.l \| Q_(+ j \, b) \|^2 chevron.r = alpha^2$, which follows from $Q^2 =
    alpha^2 upright("Id")$, give $q_j lt.eq alpha^2 k_j$. Sum over all moving negative positions and drop $q_ell
    gt.eq 0$ to get
  $ q_j sum_(ell = 1)^N \( k_j + k_ell \)^(- 1) lt.eq alpha^2 . $
  In the pinned case the omitted zero positions only add nonnegative terms to the full row sum. ◻
]

For a positive one-point weight $w_(*)$, let $bb(P)_N \[ w_(*) \]$ denote the pure law with density
  $Delta \( k^2 \)^2 product_i w_(*) \( k_i \)$, whenever integrable.
  Write $mu prec.curly.eq_(upright("st")) nu$ when the expectation of every bounded coordinatewise increasing
  function under $mu$ is at most its expectation under $nu$.

Every pure law used here is positively associated: the covariance of two bounded increasing functions is
  nonnegative. Here is an induction that also covers any fixed upper endpoint.
  The size-one assertion is the one-dimensional covariance inequality.
  Given the last point $t$, the earlier points have the same pure form with weight
  $w_(*) \( k \) \( t^2 - k^2 \)^2$ below $t$. If $s < t$, the likelihood ratio for conditioning at $s$ relative
  to conditioning at $t$ is proportional to

$ upright(bold(1))_(k_(N - 1) < s) product_(i < N) (frac(s^2 - k_i^2, t^2 - k_i^2))^2 . $

It decreases in every coordinate, including across its cutoff.
  Association at size $N - 1$ therefore makes the earlier points stochastically increasing in the last point.
  Conditional covariance and the one-dimensional covariance inequality then prove association at size $N$.
  In particular an increasing (respectively decreasing) likelihood ratio tilting a pure law moves the points
  upward (respectively downward) in stochastic order. Truncation extends this rule to the unbounded nonnegative
  tests used below.

The logarithmic derivative of $w_0$ is

$ D_0 \( k \) = 1 / k + 3 alpha tanh \( 3 alpha k \) - alpha tanh \( alpha k \) - 8 alpha coth \( 8 alpha k \) . $

It satisfies

#[#set math.equation(numbering: n => "(10.8)")
 $ - 6 alpha < D_0 \( k \) < 0 \, wide D_0 \( k \) arrow.r - 6 alpha \,\
D_0 \( k \) = - 40 / 3 alpha^2 k + O \( k^3 \) quad \( k arrow.b 0 \) . $ <j:boundary-weight-slope>]

For the upper bound put $u = alpha k$ and use $8 coth \( 8 u \) > 1 \/ u + 4 tanh \( 4 u \)$.
  For the lower bound, it suffices to use

$ frac(16 u, e^(16 u) - 1) + frac(6 u, e^(6 u) + 1) < 1 \, $

which follows from $e^(16 u) gt.eq 1 + 16 u + \( 16 u \)^2 \/ 2$ and $e^(6 u) gt.eq 1 + 6 u$.
  The limits follow by expansion.

By Lemma 22, the logarithmic derivative of the orbital density relative to the pure density with weight $k^e
  w_0 \( k \) e^(2 alpha k)$ is $2 q_i - 2 alpha lt.eq 0$. Hence

#[#set math.equation(numbering: n => "(10.9)")
 $ bb(O)_N^(\( e \)) prec.curly.eq_(upright("st")) bb(P)_N \[ k^e w_0 \( k \) e^(2 alpha k) \] \, wide e = 0 \,
   4 . $ <j:boundary-upper-pure>]

For this pure law its first $j$ points are in turn stochastically below
  $bb(P)_j \[ k^e w_0 \( k \) e^(2 alpha k) \]$. Indeed, conditioning on the later points multiplies the latter
  density by $product_(i lt.eq j < r) \( k_r^2 - k_i^2 \)^2$ and an upper cutoff,
  both decreasing in the first $j$ coordinates.

The largest point of this standalone size-$j$ law is at most $C j$ with probability $1 - O \( e^(- c j) \)$,
  with constants valid for $e = 0 \, 4$. To verify the needed uniformity,
  condition on all but one of its unsorted points. The remaining density is proportional to $p \( k \)^2
  W \( k \)$, where $deg p lt.eq 2 j$ and $W \( k \) = k^e w_0 \( k \) e^(2 alpha k)$.
  On $\[ j \, 2 j \]$, $W gt.eq c e^(- C_0 j)$, while $W$ is bounded above by a fixed polynomial times an
  exponentially decaying function. Choose $2 j + 1$ interpolation points in uniformly spaced small subintervals of
  $\[ j \, 2 j \]$, with widths and intervening gaps bounded below, at which $\| p \| lt.eq
  C parallel p parallel_(L^2 \[ j \, 2 j \])$. Lagrange interpolation,
  using denominators bounded below by $c^(2 j) l ! \( 2 j - l \) !$, gives for $k > 2 j$

$ \| p \( k \) \| lt.eq parallel p parallel_(L^2 \[ j \, 2 j \]) \[ C_1 \( k + 2 j \) \/ j \]^(2 j) . $

After weakening the exponential decay to absorb the fixed polynomial, this implies, for a sufficiently large fixed $A$,

$ frac(integral_(A j)^oo p \( k \)^2 W \( k \) thin d k, integral_0^oo p \( k \)^2 W \( k \) thin d k) & lt.eq
  C e^(C_0 j) integral_(A j)^oo \[ C_1 \( k + 2 j \) \/ j \]^(4 j) e^(- c_0 k) thin d k\
 & lt.eq C e^(- c_1 j) . $

The last inequality follows after $k = j t$ because the linear negative term in $t$ eventually dominates $4
  log \( C_1 \( t + 2 \) \)$. A union bound proves the maximum estimate.

Fix $0 < epsilon.alt < 1$ and let $m = floor.l N^(1 - epsilon.alt) floor.r$.
  Applying the preceding bounds to the first $j$ points and summing over $j gt.eq
  m$ shows that under either orbital law the event

$ E = { k_j lt.eq C max \( m \, j \) upright(" for every ") j } $

has probability $1 - O \( e^(- c m) \)$. On $E$, for $i lt.eq m$,

$ sum_(ell = 1)^N \( k_i + k_ell \)^(- 1) gt.eq c sum_(ell = m)^N \( m + ell \)^(- 1) gt.eq c' log \( N \/ m \) . $

Lemma 22 therefore gives

#[#set math.equation(numbering: n => "(10.10)")
 $ sup_(i lt.eq m\
k in E) q_i lt.eq frac(C, epsilon.alt log N) = o \( 1 \) $ <j:boundary-small-orbit>]

for each fixed $epsilon.alt$.

=== 10.4 Gamma comparison and evaluation <gamma-comparison-and-evaluation>

For $ell \, beta > 0$ define

$ W_(ell \, beta) \( k \) = \| Gamma \( ell + i beta k \) \|^2 \, wide b = pi beta . $

These weights will bound the points in the direction needed for the decreasing product in Lemma 21.
  For the event $E$ above, write $k_(lt.eq m) = \( k_1 \, dots.h \, k_m \)$ and
  $k_(> m) = \( k_(m + 1) \, dots.h \, k_N \)$.

#thm([Lemma 10.4.])[
  (Gamma comparison).  #emph[For every fixed $b_(+) > 6 alpha$, there is $ell_(+) > 0$ such that, with $beta_(+) =
    b_(+) \/ pi$, for all $N$ and $e = 0 \, 4$,
$ bb(P)_N \[ k^e W_(ell_(+) \, beta_(+)) \] prec.curly.eq_(upright("st")) bb(O)_N^(\( e \)) . $

 For fixed $0 < b_(-) < 6 alpha$ and $0 < epsilon.alt < 1$, there is $ell_(-) > 0$ such that, with $beta_(-) =
   b_(-) \/ pi$ and for sufficiently large $N$,
$ cal(L)_(bb(O)_N^(\( e \))) \( k_(lt.eq m) divides E \, k_(> m) \) prec.curly.eq_(upright("st"))
  bb(P)_m \[ k^e W_(ell_(-) \, beta_(-)) \] $

 for almost every later configuration compatible with $E$, where $m = floor.l N^(1 - epsilon.alt) floor.r$.]
] <j:boundary-gamma-comparison>

#proof[
  The Euler product gives
  $ G_(ell \, beta) \( k \) := \( log W_(ell \, beta) \)' \( k \) = -
    2 beta^2 k sum_(n gt.eq 0) frac(1, \( n + ell \)^2 + beta^2 k^2) . $
  The product for the ratio to $Gamma \( ell \)^2$ can also be obtained by approximating the Gamma integral by the
    beta integral, using $\( 1 - y \/ L \)^L arrow.r e^(- y)$ and integration by parts.
    Integral comparison of the decreasing summand gives
  $ G_(ell \, beta) \( k \) lt.eq - b + 2 \/ k \, & 0 < ell lt.eq 1 \,\
G_(ell \, beta) \( k \) gt.eq - b \, quad \| G_(ell \, beta) \( k \) \| \/ k lt.eq
  2 beta^2 \( ell^(- 2) + ell^(- 1) \) \, & ell gt.eq 1 . $
  The first summand also gives
  $ G_(ell \, beta) \( k \) \/ k lt.eq - frac(2 beta^2, ell^2 + beta^2 k^2) . $
  Suppose first that $b > 6 alpha$. At fixed $k > 0$, as $ell arrow.b 0$, the sum dominates its integral strictly,
    so $G_(ell \, beta) \( k \)$ tends to a value below $- b < - 6 alpha < D_0 \( k \)$.
    On a fixed compact interval away from zero this inequality holds uniformly for sufficiently small $ell$.
    In a sufficiently small interval at zero, the last displayed bound and the boundedness of $D_0 \( k \) \/
    k$ give the same comparison. In the tail use $G_(ell \, beta) lt.eq - b + 2 \/ k$ and $D_0 > - 6 alpha$.
    These three regions select one fixed $ell > 0$ with $G_(ell \, beta) lt.eq D_0$ everywhere.
    The likelihood ratio of the orbital law to $bb(P)_N \[ k^e W_(ell \, beta) \]$ is then increasing,
    since its logarithmic derivative is $D_0 + 2 q_i - G_(ell \, beta) gt.eq 0$.
    Association of the pure law proves the first assertion.
  Now fix $b < 6 alpha$ and $epsilon.alt > 0$. Near zero, (10.8) and $q_i lt.eq alpha^2 k_i$ give
  $ D_0 \( k_i \) + 2 q_i lt.eq - #scale(x: 120%, y: 120%)[\(] 34 / 3 +
    o \( 1 \) #scale(x: 120%, y: 120%)[\)] alpha^2 k_i . $
  Choose $c_0 > 0$ and a fixed small interval on which $D_0 \( k \) + 2 alpha^2 k lt.eq - c_0 k$.
    Then choose $ell$ so large that $2 beta^2 \( ell^(- 2) + ell^(- 1) \) < c_0$.
    The bound on the Gamma derivative gives $G_(ell \, beta) \( k \) gt.eq - c_0 k gt.eq D_0 \( k \) +
    2 q_i$ on that interval. On a fixed compact interval away from zero, $D_0 < 0$,
    the Gamma derivative tends uniformly to zero as $ell$ grows, and (10.10) makes $q_i =
    o \( 1 \)$ uniformly on $E$. In the tail, use $D_0 arrow.r - 6 alpha < - b$, $G_(ell \, beta) gt.eq - b$,
    and the same bound on $q_i$. Thus, for one fixed large $ell$ and sufficiently large $N$,
  $ G_(ell \, beta) \( k_i \) gt.eq D_0 \( k_i \) + 2 q_i quad upright("for ") i lt.eq m upright(" on ") E . $
  Given the later points and $E$, the likelihood ratio of the first $m$ points to
    $bb(P)_m \[ k^e W_(ell \, beta) \]$ is proportional to
  $ upright(bold(1))_(k_m < min \( C m \, k_(m + 1) \)) I^(\( e \)) \( k \) product_(i lt.eq m)
    frac(w_0 \( k_i \), W_(ell \, beta) \( k_i \)) product_(i lt.eq m\
r > m) \( k_r^2 - k_i^2 \)^2 . $
  The factors $k_i^e$ have canceled. Inside this downward closed support, its logarithmic derivative in $k_i$ is
  $ D_0 \( k_i \) + 2 q_i - G_(ell \, beta) \( k_i \) - 4 k_i sum_(r > m) \( k_r^2 - k_i^2 \)^(- 1) lt.eq 0 . $
  It is therefore a decreasing ratio, including across the cutoff.
    Association of the pure comparison law proves the conditional assertion. ◻
]

We next compute the particular pure statistic appearing here.
  Throughout this calculation $ell \, beta > 0$ are fixed. Normalize $\| Gamma \( ell + i u \) \|^2 thin d
  u$ to a probability measure on $bb(R)$. Its Fourier transform is $cosh \( t \/ 2 \)^(- 2 ell)$: writing

$ Gamma \( ell + i u \) = integral_(bb(R)) e^(\( ell + i u \) y - e^y) thin d y $

reduces the transform of its squared modulus to the autocorrelation of $e^(ell y - e^y)$,
  which is evaluated by scaling $e^y$. Shifting this Fourier contour by a small positive or negative imaginary
  amount also gives exponential decay of the weight. Thus the generating function

$ \( 1 - i z \)^(- ell + i u) \( 1 + i z \)^(- ell - i u) = sum_(n gt.eq 0) P_n \( u \) z^n $

gives the Meixner–Pollaczek polynomials $P_n^(\( ell \)) \( u \; pi \/ 2 \)$ [16] Equation 18.23.7.
  Integrating the product of two generating functions near zero gives $\( 1 - z z' \)^(- 2 ell)$.
  Consequently the $P_n$ are real, have degree $n$ with leading coefficient $2^n \/ n !$, have parity $n$,
  and have squared norms

$ c_n = frac(\( 2 ell \)_n, n !) tilde.op frac(n^(2 ell - 1), Gamma \( 2 ell \)) . $

Their evaluations needed below satisfy

$ \( - 1 \)^j P_(2 j) \( 0 \) & = frac(\( ell \)_j, j !) tilde.op frac(j^(ell - 1), Gamma \( ell \)) \,\
\( - 1 \)^j P_(2 j) \( i beta \) & tilde.op frac(2^(2 beta - 1) j^(ell + beta - 1), Gamma \( ell + beta \)) . $

For the second equivalent, take the even coefficients of $\( 1 - t \)^(- ell - beta) \( 1 + t \)^(- ell + beta)$.
  If $ell gt.eq beta$, factor it as $\( 1 - t^2 \)^(- ell + beta) \( 1 - t \)^(- 2 beta)$ and use the positive
  binomial convolution. For $ell > beta$, its binomial equivalents, with the summation index divided by $j$,
  give the leading constant

$ frac(2^(2 beta - 1), Gamma \( ell - beta \) Gamma \( 2 beta \)) integral_0^1
  v^(ell - beta - 1) \( 1 - v \)^(2 beta - 1) thin d v = frac(2^(2 beta - 1), Gamma \( ell + beta \)) \; $

the case $ell = beta$ is immediate. If $ell < beta$, the coefficients of $\( 1 + t \)^(beta - ell)$ are
  $O \( \( 1 + n \)^(ell - beta - 1) \)$ and are absolutely summable.
  Convolution with the first factor is asymptotic to its coefficient times their sum $2^(beta - ell)$;
  the indices of the summable factor above $n \/ 2$ contribute only $O \( n^(2 ell - 1) \)$,
  smaller than the main term. This proves the displayed equivalents.

Use the even polynomials $P_(2 j) \( beta k \)$ on the positive axis.
  Their evaluation kernel through $j = L - 1$ is the kernel of $bb(P)_L \[ W_(ell \, beta) \]$,
  up to its fixed one-point normalization. The determinant expansion for its intensity at zero therefore gives

$ rho_(Gamma \, L) \( 0 \) asymp_(ell \, beta) sum_(j < L) frac(P_(2 j) \( 0 \)^2, c_(2 j)) asymp_(ell \, beta)
  1 + log L . $

Pinning one point of this law gives $bb(P)_(L - 1) \[ k^4 W_(ell \, beta) \]$;
  denote its expectation by $bb(E)_(Gamma \, L)^(upright("pin"))$.
  Replacing evaluation at zero in one determinant by evaluation at $i$ changes its Vandermonde by exactly
  $product_j \( 1 + k_j^(- 2) \)$. Hence

#[#set math.equation(numbering: n => "(10.11)")
 $ bb(E)_(Gamma \, L)^(upright("pin")) product_j \( 1 + k_j^(- 2) \) & =
   frac(sum_(j < L) P_(2 j) \( 0 \) P_(2 j) \( i beta \) \/ c_(2 j), sum_(j < L) P_(2 j) \( 0 \)^2 \/ c_(2 j))\
 & asymp_(ell \, beta) frac(L^beta, 1 + log L) = L^(beta + o \( 1 \)) . $ <j:boundary-gamma-statistic>]

Indeed the denominator summands are asymptotic to a positive constant times $j^(- 1)$,
  and the numerator summands to a positive constant times $j^(beta - 1)$.
  In particular the exponent statement is for fixed $ell \, beta$.

We can now finish the estimate of (10.5). For the unpinned orbital law,
  its lower stochastic bound in Lemma 23 bounds its decreasing minimum-tail event from above by the Gamma minimum
  tail. Conversely, (10.9) and the comparison of the first point to the standalone one-point pure law bound that
  event from below by the one-point law with weight $w_0 e^(2 alpha k)$. Taking $t arrow.b 0$ for each $M$ gives

$ c lt.eq rho \( 0 \) lt.eq C \( 1 + log M \) . $

The constants may depend on the fixed comparison parameters.

For the pinned law, the product in Lemma 21 is decreasing.
  The first Gamma comparison therefore bounds its expectation above by (10.11) with $L = N + 1 = M$,
  since the pinned law has $N = M - 1$ moving points. For a lower bound,
  restrict to $E$ and discard all factors after $m$, which are at least one.
  Conditional on the later points, the second Gamma comparison bounds the remaining decreasing product below by
  the pure size-$m$ expectation, namely (10.11) with $L = m + 1$.
  Its bound is multiplied by $bb(P) \( E \) = 1 - O \( e^(- c m) \)$.

To record the order of limits, first fix $b_(+) > 6 alpha$ for the upper bound,
  and fix $b_(-) < 6 alpha$ and $epsilon.alt > 0$ for the lower bound.
  Choose their $ell$ parameters as in the comparison lemma, and only then let $M arrow.r oo$.
  Put $a_M = log F'_v \( 1 \) \/ log M$. The pin and residue formulas give

$ \( 1 - epsilon.alt \) b_(-) / pi lt.eq liminf_(M arrow.r oo) a_M lt.eq limsup_(M arrow.r oo) a_M lt.eq b_(+) / pi . $

Letting these fixed parameters approach $6 alpha$ and then $epsilon.alt arrow.b 0$ proves

#[#set math.equation(numbering: n => "(10.12)")
 $ F'_v \( 1 \) = M^(3 \/ 4 + o \( 1 \)) . $ <j:boundary-increment-exponent>]

=== 10.5 Wedge comparison <j:wedge-comparison>

We return to the physical arches. Define the positive deficit

$ delta_M = 1 / c_alpha - sum_(d = 1)^(M - 1) H_M \( d \) = frac(F'_v \( 1 \), c_alpha M) = M^(- 1 \/ 4 + o \( 1 \)) . $

The coarse bound $c_alpha sum_(d > 0) H \( d \) lt.eq 1$ from Section 2, together with $H_M \( d \) lt.eq
  H \( d \)$ and $delta_M arrow.r 0$, gives the saturation

$ sum_(d > 0) H \( d \) = 1 / c_alpha . $

Consequently, with $A \( n \) = sum_(d gt.eq n) H \( d \)$,

$ A \( M \) lt.eq delta_M . $

Every arch contained within distance strictly less than $M \/
  2$ of its source is disjoint from its nontrivial translates by $M$.
  Thus the arches counted in the deficit all reach distance at least $M \/ 2$, giving

$ delta_M lt.eq W_(M \/ 2) . $

Choosing $M$ just above $2 R$ proves the required lower exponent for $W_R$ and the stated upper exponent for
  $A \( n \)$.

For the upper radius bound, intersect the upper half-plane with the wedge between rays of angles $0$ and $theta =
  pi \/ 3$. A source on its horizontal ray has distance $a in { 1 \/ 2 \, 3 \/ 2 \, dots.h }$ from the vertex.
  The signed balance holds on the infinite wedge. To justify this,
  first exhaust the half-plane by convex tessellation polygons with extending horizontal bases.
  The real contribution of their same-side arches tends to one by saturation.
  Every other real boundary coefficient is at least $sin alpha$,
  so the total raw weight of remote exits tends to zero. Remote exits in the wedge intersections are a subset of
  these exits. The fixed-ray exit sums converge absolutely by the same positive bound,
  and the finite signed identities therefore pass to the wedge.

Put $s = 3 \/ 8$. For same-side walks the phases are $e^(i s pi)$ to the left and $e^(- i s pi)$ to the right,
  while exits to the other ray have phase $e^(i s theta)$. Let $L_(<) \( a \)$ and $L_(>) \( a \)$ be the lost
  left and right same-side weights on restriction from the half-plane to the wedge,
  including endpoints removed by the restriction. Subtract the balances and project perpendicular to
  $e^(i s theta)$. This gives

$ sin \( s \( pi - theta \) \) L_(<) \( a \) - sin \( s \( pi + theta \) \) L_(>) \( a \) = 0 \, wide
  L_(<) \( a \) = r L_(>) \( a \) \, quad r = sqrt(2) . $

For positive half-integer ports $a \, b$, let $D \( a \, b \)$ be the lost same-side weight with those fixed
  endpoints. Reversal gives $D \( a \, b \) = D \( b \, a \)$.
  The missing negative ports to the left contribute $A \( ceil.l a ceil.r \)$, so

$ L_(<) \( a \) = A \( ceil.l a ceil.r \) + sum_(0 < b < a) D \( a \, b \) \, wide L_(>) \( a \) =
  sum_(b > a) D \( a \, b \) . $

Summing $L_(<) = r L_(>)$ over $0 < a lt.eq T$ gives the positive identity

$ \( r - 1 \) sum_(0 < a < b lt.eq T) D \( a \, b \) + r sum_(0 < a lt.eq T < b) D \( a \, b \) & =
  sum_(0 < a lt.eq T) A \( ceil.l a ceil.r \)\
 & lt.eq T^(3 \/ 4 + o \( 1 \)) . $

Because $r > 1$, this bounds $sum_(0 < a lt.eq T) \( L_(<) \( a \) + L_(>) \( a \) \)$ by the same order.
  After translating the source to a fixed port, the wedges increase with $a$;
  their total loss therefore decreases. The summed bound implies

$ L_(<) \( a \) + L_(>) \( a \) lt.eq a^(- 1 \/ 4 + o \( 1 \)) . $

Intersect two reflected wedges whose vertices are horizontal distance $a$ on opposite sides of the source.
  Their intersection is a triangle of diameter $O \( a \)$.
  An arch reaching distance $C a$ for sufficiently large fixed $C$ leaves at least one wedge,
  so its weight is bounded by the sum of these two losses. This proves the upper exponent for $W_R$ and completes
  Proposition 20.

=== 10.6 A bound for segments between height extrema <a-bound-for-segments-between-height-extrema>

We record a segment bound used later in the marked-bond summability argument.
  Measure vertex height in units of one third of the spacing between horizontal tessellation lines.
  Heights are integers and change by one or two on an edge.

#thm([Lemma 10.5.])[
  #emph[Fix a honeycomb vertex and two distinct height levels, with the fixed vertex on one level.
    The total critical weight of SAW segments from that vertex to any vertex on the other level,
    whose endpoints are opposite height extrema of the segment,
    is bounded by an absolute constant independent of the levels.]
] <j:extremal-segment>

#proof[
  Extend each endpoint to a port on the adjacent horizontal line beyond its extremal level.
    This requires at most one additional triangle at each end, strictly beyond the segment’s range of heights.
    Between two successive horizontal lines the lower triangles have a port on the bottom and the higher triangles
    a port on the top; a triangle of either type has a neighbor of the other type.
    These observations provide the extension without intersecting the segment.
    Choose an extension by a fixed local rule. Trimming the vertices beyond the extremal levels recovers the
    segment, and the possible choices have bounded multiplicity.
  The extended walk is a first-exit crossing of the slab between the two chosen lines.
    The convex boundary balance, exhausted horizontally, bounds its total weight for each of the finitely many
    possible starting ports. Removing the at most two extra vertices costs at most $x^(- 2)$.
    This gives a constant independent of the height difference. ◻
]

For the later use, split an $n$-edge walk at a highest vertex and treat the two halves from that vertex.
  Within either half, go to the last occurrence of its lowest remaining level,
  then to the last occurrence of its highest remaining level, and continue alternately.
  These are segments of Lemma 24. Their positive integer spans decrease strictly after a possible equality of the
  first two, since each chosen extremum was the last occurrence of its level.
  The sum of the spans is at most $2 n$, so there are $O \( sqrt(n) \)$ segments and at most
  $\( 2 n + 1 \)^(O \( sqrt(n) \))$ span lists. For a prescribed list,
  successive use of the lemma bounds the endpoint-summed product of segment weights by a constant to the number of
  segments. Recovering the weight of the joined walk costs $x^(- 1)$ per shared endpoint.
  These are the subexponential concatenation bounds needed in Section 12.

They also recover the reciprocal exponential growth rate of full-plane SAWs.
  Let $c_n$ count $n$-edge SAWs from a fixed vertex. A highest vertex has only $O \( n^2 \)$ possible positions,
  and the split has at most $n + 1$ positions. Summing the span lists and the preceding product bounds gives $c_n
  x^(n + 1) lt.eq exp \( O \( sqrt(n) log n \) \)$, hence $limsup c_n^(1 \/ n) lt.eq x^(- 1)$.
  Lattice symmetry gives $c_(n + m) lt.eq c_n c_m$, so the limit $mu = lim c_n^(1 \/ n)$ exists.
  If $mu < x^(- 1)$, then $c_n x^n lt.eq C r^n$ for some $r < 1$.
  An arch reaching radius $R$ has at least a constant times $R$ vertices,
  so summing this bound over its possible lengths would make $W_R$ exponentially small,
  contrary to Proposition 20. Thus $mu = x^(- 1)$. [3]

=== 10.7 Boundary chords and interior visits <boundary-chords-and-interior-visits>

We first convert the arch estimate into the partition of macroscopic chords.
  The following consequence of the signed balance makes the comparison precise.

#thm([Lemma 10.6.])[
  (Restriction to a convex cap).  #emph[Let $K subset D$ be finite convex tessellation polygons sharing a starting
    port with the same inward direction. Let $L$ be the raw weight of first-exit chords of $D$ other than those
    confined to $K$ and ending at a boundary port shared by $K$ and $D$.
    Let $E$ be the raw weight of first-exit chords of $K$ ending on ports newly created by the restriction. Then
$ sin alpha thin L lt.eq E lt.eq L \/ sin alpha . $

 The same conclusion holds with $D$ the saturated tessellation half-plane and $K$ a finite convex cap.]
] <j:convex-cap>

#proof[
  The common chords, confined to $K$ and ending on a shared true boundary port,
    have the same intrinsic turning phase in both balances and cancel. The two remaining complex sums are equal.
    Every real coefficient in either convex domain lies between $sin alpha$ and one.
    Taking real parts proves both inequalities. For the half-plane,
    use the convex exhaustion justified by saturation in the wedge argument. ◻
]

Recall the regular tessellation hexagon $D_R$, the ordered first-exit chords $cal(C)_R$ of diameter at least $R \/
  10$, and their raw partition $Z_R^(upright("chord"))$. For an upper bound at a source $a$,
  choose a small similarly aligned tessellation hexagon $P$ contained within distance $R \/ 25$ of $a$,
  with $"dist" \( a \, partial P \) gt.eq c R$. Such a choice is possible with fixed constants for large $R$ by
  taking its center within a bounded lattice distance of $a$.
  A chord of diameter at least $R \/ 10$ reaches distance at least $R \/ 20$ from $a$,
  and hence is lost on restriction to $D_R ∩ P$. Lemma 25 bounds its weight by a constant times the artificial
  exits of that intersection. These exits are a subset of the artificial exits of $P$ intersected with the
  supporting tessellation half-plane at $a$. Applying the lemma to this half-plane cap bounds them by $C W_(c R)$.
  Thus the macroscopic weight at every source is at most $R^(- 1 \/ 4 + o \( 1 \))$.

For a lower bound choose the ports in a fixed middle portion of one side,
  at distance at least $c R > R \/ 10$ from every other side.
  A half-plane arch from such a source reaching radius $R$ is either a macroscopic chord contained in $D_R$ or is
  lost on restriction to $D_R$. By Lemma 25, all lost arch weight is bounded by a constant times the exits of
  $D_R$ on the other sides, and these are macroscopic as well.
  Thus the macroscopic weight at each of these sources is at least a constant times $W_R =
  R^(- 1 \/ 4 + o \( 1 \))$. There are $O \( R \)$ boundary ports in all and order $R$ chosen ports. We have proved

#[#set math.equation(numbering: n => "(10.13)")
 $ Z_R^(upright("chord")) = R^(3 \/ 4 + o \( 1 \)) . $ <j:chord-partition>]

#thm([Proposition 10.7.])[
  (Interior visits and nested polygons).  #emph[Let $D$ be a finite convex tessellation polygon and let $v$ be a
    honeycomb vertex not adjacent to a boundary port. Sum over all ordered first-exit boundary chords of $D$ that
    visit $v$, and put
$ S_D \( v \) = sum_(gamma in.rev v) x^(N \( gamma \)) cos \( 3 T \( gamma \) \/ 8 \) . $

 Let $Z_v$ be the partition of disjoint unoriented cycles in $D$ strictly enclosing $v$ and avoiding it,
   with cycle weight $2 x^(\| lambda \|)$. Let $Z_(upright("out")) \( lambda \)$ count disjoint cycles in $D$
   surrounding and disjoint from $lambda$ with the same weights.
   At a vertex of $lambda$, call the corner convex or reflex when its interior angle is $2 pi \/ 3$ or $4 pi \/
   3$, respectively, and put
$ c_lambda =
  cases(delim: "{", sqrt(2) \, & v upright(" is a convex corner of ") lambda \,, 2 + sqrt(2) \, & v
  upright(" is a reflex corner of ") lambda .) $

 Then
#[#set math.equation(numbering: n => "(10.14)")
 $ S_D \( v \) = 3 Z_v + sum_(lambda in.rev v) c_lambda x^(\| lambda \|) Z_(upright("out")) \( lambda \) .
   $ <j:visit-identity>]

]
  #emph[For each of the three incident face centers $f$, let $Z_D \( f \)$ be the partition of disjoint cycles in
    $D$ surrounding $f$, again with weight $2 x^(\| lambda \|)$.
    Put $k_lambda = 1$ at a convex corner and $k_lambda = 2$ at a reflex corner. Then
#[#set math.equation(numbering: n => "(10.15)")
 $ sum_(f tilde.op v) Z_D \( f \) = 3 Z_v + sum_(lambda in.rev v) 2 k_lambda x^(\| lambda \|)
   Z_(upright("out")) \( lambda \) . $ <j:incident-face-partition>]

 In particular the ordinary visit mass $sum_(gamma in.rev v) x^(N \( gamma \))$ is comparable,
   with absolute positive constants, to $sum_(f tilde.op v) Z_D \( f \)$.]
] <j:visit>

#proof[
  Remove the triangle centered at $v$, creating three inner ports.
    For each outer starting port, the signed balance still holds in the punctured domain:
    its source is outside every possible first-collision loop, including a loop surrounding the removed triangle,
    so the same collision cancellation applies. Subtract the punctured balance from the original one.
    The outer chords avoiding $v$ cancel, leaving the outer chords through $v$ equal to the paths ending at an
    inner port. Take real parts, sum over the outer sources, and reverse these paths.
    Reversal changes $T$ to $- T$ and preserves the real part.
    Thus $S_D \( v \)$ is the real sum of paths from the three inner ports to the outer ports.
  For each inner source, attach an arbitrary configuration counted by $Z_v$ as a background and grow the weighted
    path tree in the punctured domain. Stop at an exit, a first self-collision,
    or first contact with a background cycle. The initial total strength of the three trees is $3 Z_v$.
    A self-collision loop not enclosing $v$ is approached from outside and cancels with its reverse exactly as in
    Section 2. A loop enclosing $v$ is approached from inside,
    because the inner source is in the same component as $v$. Its corner at the collision vertex is reflex:
    the other loop vertices contribute $plus.minus 7 pi \/ 3$ of turning,
    and departure from the incoming stem contributes $plus.minus pi \/ 3$.
    The two orientations of that loop therefore contribute
  $ 2 x^(\| lambda \|) cos (3 / 8 frac(8 pi, 3)) = - 2 x^(\| lambda \|) . $
  This cancels first contact with the same loop added to the background.
    Conversely, remove the first contacted, necessarily innermost,
    background cycle and follow it from the contact in either orientation.
    First contact ensures that this cycle has no earlier intersection with the stem.
    This is the inverse operation, so every background-contact term is canceled exactly once.
  An outer exit can coexist with no background cycle, since the source starts inside every such cycle.
    Its real sum is the $S_D \( v \)$ identified above. An exit to another inner port, closed through $v$,
    gives a simple cycle $lambda$ through $v$, and every remaining background cycle surrounds it.
    If $L = \| lambda \|$, opening the cycle at $v$ leaves two directed inner-return paths of weight $x^(L - 1)$
    each. At a convex corner their turns are $plus.minus 5 pi \/ 3$,
    and at a reflex corner they are $plus.minus 7 pi \/ 3$: the full loop turn is $plus.minus 2 pi$,
    with the turn at $v$ removed. Write $t_lambda = 5 pi \/ 3$ or $7 pi \/ 3$ in these two cases.
    The remaining real tree identity is
  $ 3 Z_v = S_D \( v \) + sum_(lambda in.rev v) 2 x^(\| lambda \| - 1) cos (3 / 8 thin t_lambda)
    Z_(upright("out")) \( lambda \) . $
  Moving the inner-return terms to the other side supplies the required factor $x^(- 1)$:
  $ - 2 / x cos \( 5 pi \/ 8 \) = sqrt(2) \, wide - 2 / x cos \( 7 pi \/ 8 \) = 2 + sqrt(2) . $
  This proves (10.14).
  A cycle avoiding $v$ places all three incident face centers in the same component as $v$,
    because it uses none of the three edges incident to $v$. A cycle through $v$ encloses exactly one incident
    face center at a convex corner and two at a reflex corner.
    In a surrounding configuration it must be the innermost cycle:
    an inner cycle avoiding $v$ would also enclose $v$, which lies on the outer cycle.
    These facts partition the configurations counted by the three $Z_D \( f \)$ and prove (10.15).
    Comparing the positive coefficients in the two identities gives
  $ 1 / sqrt(2) sum_(f tilde.op v) Z_D \( f \) lt.eq S_D \( v \) lt.eq sum_(f tilde.op v) Z_D \( f \) . $
  Finally convex boundary positivity gives
  $ S_D \( v \) lt.eq sum_(gamma in.rev v) x^(N \( gamma \)) lt.eq frac(S_D \( v \), sin alpha) \, $
  which proves the ordinary visit comparison. ◻
]

Let $cal(Z) \( R \)$ be the $+ 2$ partition around the central face center in $D_R$.
  For a honeycomb vertex $v$ in $D_R$, write

$ cal(V)_R \( v \) = sum_(gamma in cal(C)_R\
v in gamma) x^(N \( gamma \)) . $

This is a raw mass under the finite chord ensemble, so

$ bb(E)_R^(upright("chord")) N = 1 / Z_R^(upright("chord")) sum_(v in D_R) cal(V)_R \( v \) . $

For $v$ at distance at most $R \/ 10$ from the center, every first-exit boundary chord visiting $v$ is macroscopic
  for large $R$. A translated hexagon of side $floor.l R \/ 2
  floor.r$ centered at each incident face lies inside $D_R$.
  Positivity under domain inclusion and Proposition 26 therefore give

$ cal(V)_R \( v \) gt.eq c cal(Z) \( floor.l R \/ 2 floor.r \) quad upright("uniformly for these bulk vertices") . $

For every vertex not adjacent to a boundary port, a translated hexagon of side $3
  R$ centered at an incident face contains $D_R$. The same proposition gives $cal(V)_R \( v \) lt.eq
  C cal(Z) \( 3 R \)$ uniformly. There are order $R^2$ bulk vertices and at most order $R$ vertices adjacent to
  boundary ports. Each of the latter contributes at most one to the normalized mean,
  since a chord visits a vertex at most once. Hence

$ frac(c R^2 cal(Z) \( floor.l R \/ 2 floor.r \), Z_R^(upright("chord"))) & lt.eq bb(E)_R^(upright("chord")) N\
 & lt.eq frac(C R^2 cal(Z) \( 3 R \), Z_R^(upright("chord"))) + C R . $

Using (10.13) and $cal(Z) gt.eq 1$ yields

$ R^(5 \/ 4 + o \( 1 \)) cal(Z) \( floor.l R \/ 2 floor.r \) & lt.tilde bb(E)_R^(upright("chord")) N\
 & lt.tilde R^(5 \/ 4 + o \( 1 \)) cal(Z) \( 3 R \) . $

In particular $bb(E)_R^(upright("chord")) N gt.eq R^(5 \/ 4 + o \( 1 \))$.
  Section 11 will supply $cal(Z) \( R \) = R^(1 \/ 12 + o \( 1 \))$,
  completing the mean exponent $4 \/ 3$ for this finite chord law.

== 11 Localization and the chord mean <c7:localization>

The cylinder estimate bounds the total weight of incompatible pairs of separating cycles.
  We use that bound to remove cycles that travel far from the mark they enclose.
  We compare the remaining cycles with two planar nesting partitions, one near each mark.
  This gives the planar nesting exponent and completes the chord-length calculation.

Use the balanced physical cylinder with period

$ P = \( M \, 0 \) \, wide M = 2 m \, wide m med upright("even") \, $

and marked tessellation vertices $O = \( 0 \, 0 \)$ and $O' = \( M \/ 2 \, 0 \)$.
  For a separating cycle $lambda$, write $w_lambda = x^(\| lambda \|)$.
  Two cycles are incompatible when they share a honeycomb vertex; in particular,
  a cycle is incompatible with itself. Expanding the positive cylinder partition at $g = 0$ gives

$ I_M := sum_(lambda \, lambda' med upright("separating")\
lambda \, lambda' med upright("incompatible")) w_lambda w_(lambda') = -
  partial_g^2 log G_(A \, B) \( g \)\|_(g = 0) = O \( log M \) . $

The pairs in this sum are ordered. Indeed the square of the linear coefficient counts every ordered pair,
  whereas twice the quadratic coefficient counts exactly the ordered compatible pairs.

We first record the separation facts used below. A contractible simple cycle on the cylinder bounds a unique
  embedded closed disk. If the cycle separates $O$ and $O'$, this disk contains exactly one of them.
  Choose its planar lift containing the specified lift of that mark.
  Two disjoint contractible boundaries have disks that are either disjoint or strictly nested,
  by Jordan separation. Hence disjoint same-mark boundaries have strictly nested disks,
  while disjoint opposite-mark boundaries have disjoint disks.
  These alternatives hold literally for the chosen lifts: a lift of an embedded disk cannot contain two period
  translates of a mark. Finally, strict containment of compact disks implies strict inequality of their Euclidean
  diameters. To see this, extend one endpoint of a diameter-realizing pair a short distance inside the outer disk.

#thm([Lemma 11.1.])[
  (Cycles escaping the two marks).  #emph[Fix $C > 1$. For a contractible separating cycle,
    measure horizontal coordinates relative to the enclosed mark in its chosen disk lift.
    Let $cal(E)_M$ consist of all noncontractible separating cycles and all contractible separating cycles whose
    chosen disk either reaches $\| x_(upright("horiz")) \| gt.eq M \/ 4$ or has diameter greater than $C M$. Then
$ sum_(lambda in cal(E)_M) w_lambda lt.eq \( 5 sqrt(2) + 2 \) sqrt(I_M) . $

 Every cycle outside $cal(E)_M$ has a disk lift contained in the closed Euclidean ball of radius $C
   M$ about its enclosed mark.]
] <j:localization-escape>

#proof[
  All class sums may first be restricted to finite subfamilies;
    monotone convergence then gives the stated bounds and their finiteness.
  First consider disks enclosing $O$, with lifts containing the origin.
    Call a disk #emph[wide] if it reaches $\| x_(upright("horiz")) \| gt.eq M \/ 4$,
    and write $S_W$ for the total weight of their boundaries.
    Let $V^(*)$ be the reflection of $V$ in the vertical axis, and put $t = \( M \/ 2 \, 0 \)$.
    Reflection fixes both cylinder marks, and translation by $t$ interchanges them.
    Both operations preserve the honeycomb graph and give weight-preserving injections on these cycles.
  Suppose $U \, V$ are wide and $"diam" U gt.eq "diam" V$. If the boundary of $U$ were compatible with the
    boundaries of both $V$ and $V^(*)$, the same-mark alternatives above and the diameter ordering would give
  $ V union V^(*) subset "int" U . $
  Compatibility also with the boundaries of $V + t$ and $V^(*) +
    t$ would make those opposite-mark disks disjoint from $U$. These conclusions conflict.
    In fact, a path in $V$ from the origin to a wide point meets one of the lines $x_(upright("horiz")) =
    plus.minus M \/ 4$, say at $p_(+)$ or $p_(-)$. Reflection supplies the other point at the same height. Thus
  $ p_(-) in V union V^(*) \, wide p_(+) = p_(-) + t in V union V^(*) \, $
  so $V union V^(*)$ meets $\( V union V^(*) \) + t$. This uses only a path in the disk,
    not convexity or connectedness of any horizontal slice. Figure 2(a) shows this contact.
  For each diameter-sorted pair, at least one of the four indicated images is therefore incompatible with $U$.
    Each image map is injective and preserves weight, so each of the four sums is at most $I_M$.
    The diameter-sorted pairs carry at least half of $S_W^2$. Consequently
  $ 1 / 2 S_W^2 lt.eq 4 I_M \, wide S_W lt.eq sqrt(8 I_M) . $
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((3.65, 2.55), [#text(size: 9pt)[\(a\) Reflected contact]])
  line((0.6, 0), (5.55, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((1.05, -0.18), (1.05, 1.28), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.75, -0.18), (3.75, 1.28), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  bezier((2.4, 0), (3.75, 1.05), (2.68, 0.15), (2.95, 1.48), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  bezier((2.4, 0), (1.05, 1.05), (2.12, 0.15), (1.85, 1.48), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10, dash: "densely-dotted"))
  bezier((5.1, 0), (3.75, 1.05), (4.82, 0.15), (4.55, 1.48), stroke: (paint: rgb("#cc6600"), thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  line((1.05, 1.05), (1.05, 1.85), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((3.75, 1.05), (3.75, 1.85), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((1.05, 1.75), (3.75, 1.75), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((2.4, 1.75), [#text(size: 9pt)[$+t, t=(M"/"2,0)$]], anchor: "south", padding: 0.1176cm)
  circle((2.4, 0), radius: 0.0635, fill: black, stroke: none)
  content((2.4, 0), [#text(size: 9pt)[$O$]], anchor: "north", padding: 0.1176cm)
  circle((5.1, 0), radius: 0.0635, fill: black, stroke: none)
  content((5.1, 0), [#text(size: 9pt)[$O'$]], anchor: "north", padding: 0.1176cm)
  circle((1.05, 1.05), radius: 0.07056, fill: black, stroke: none)
  content((1.05, 1.05), [#text(size: 9pt)[$p_-$]], anchor: "east", padding: 0.1176cm)
  circle((3.75, 1.05), radius: 0.07056, fill: black, stroke: none)
  content((3.75, 1.05), [#text(size: 9pt)[$p_+=p_-+t$]], anchor: "west", padding: 0.1176cm)
  content((1.05, -0.18), [#text(size: 9pt)[$-M"/"4$]], anchor: "north", padding: 0.1176cm)
  content((3.75, -0.18), [#text(size: 9pt)[$M"/"4$]], anchor: "north", padding: 0.1176cm)
  content((2.82, 0.88), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$V$]]]])])
  content((1.95, 0.55), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$V^*$]]]])])
  content((4.58, 0.76), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#cc6600"))[#text(size: 9pt)[$V^*+t$]]]])])
  content((3.25, -0.85), [#box(width: 5.935cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[The curves are paths inside the indicated disks.#linebreak()$p_-$ and $p_+$ have the same height; no horizontal slice is assumed connected.]]])], anchor: "north")
  content((10.45, 2.55), [#text(size: 9pt)[\(b\) Two strict strips]])
  rect((9.45, -3), (11.45, 3), fill: rgb("#ebebff"), stroke: none)
  line((12.55, -2.366), (13.55, -0.634), (8.352, 2.366), (7.352, 0.634), close: true, fill: rgb("#fff2e6"), stroke: none)
  line((11.45, 0.5774), (11.45, -1.732), (9.45, -0.5774), (9.45, 1.732), close: true, fill: black, stroke: none)
  line((9.45, -3), (9.45, 3), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((11.45, -3), (11.45, 3), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((12.55, -2.366), (7.352, 0.634), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((13.55, -0.634), (8.352, 2.366), stroke: (paint: rgb("#cc6600"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((9.45, 1.732), (11.45, -1.732), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((10.73, -0.485), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$R^(-1)P$]]])], anchor: "north")
  circle((10.45, 0), radius: 0.0635, fill: black, stroke: none)
  content((10.45, 0), [#text(size: 9pt)[$O$]], anchor: "south-west", padding: 0.1176cm)
  circle((9.45, 1.732), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((9.45, 1.732), [#text(size: 9pt)[$R^(-1)(O'-P)$]], anchor: "east", padding: 0.1176cm)
  circle((11.45, -1.732), radius: 0.08467, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((11.45, -1.732), [#text(size: 9pt)[$R^(-1)O'$]], anchor: "west", padding: 0.1176cm)
  content((10.45, 1.95), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$S$]]]])])
  content((8.78, 0.63), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#cc6600"))[#text(size: 9pt)[$"RS"$]]]])])
  content((9.45, -2.03), [#text(size: 9pt)[$-M"/"4$]], anchor: "north", padding: 0.1176cm)
  content((11.45, -2.03), [#text(size: 9pt)[$M"/"4$]], anchor: "north", padding: 0.1176cm)
  content((10.45, -2.68), [#text(size: 9pt)[$|R^(-1)P|=M$]])
})],
    caption: [Figure 2: The two planar constructions in the escape bound. In (a), only connecting paths inside $V$, $V^(*)$, and $V^(*) + t$ are drawn; the two marked points at a common height establish the contact without asserting that a horizontal slice is connected. In (b), $S = { \| x_(upright("horiz")) \| < M \/ 4 }$ and $R S$ are the two open strips. The open circles are adjacent rotated-back lifts of the opposite mark. Their separation is $M$, the long diagonal of the strip intersection. The paths in (a) are schematic; (b) is drawn to scale. ],
  ) <j:fig-localization>
  Now let $U$ be nonwide and have diameter greater than $C M$.
    It is contained in the strict strip $S = { \| x_(upright("horiz")) \| < M \/ 4 }$.
    Let $R$ be rotation by $pi \/ 3$ about $O$. Although this rotation is not an automorphism of the cylinder,
    $R U$ projects to an embedded disk on the same cylinder. Indeed
  $ R^(- 1) P = \( M \/ 2 \, - sqrt(3) M \/ 2 \) \, $
  and the strips $S$ and $S + k R^(- 1) P$ are disjoint for every nonzero integer $k$.
    Hence $R U$ is disjoint from all its nontrivial period translates. Moreover
  $ #scale(x: 120%, y: 120%)[\(] R^(- 1) \( O' + k P \) #scale(x: 120%, y: 120%)[\)]_(upright("horiz")) = M \/ 4 +
    k M \/ 2 $
  lies outside $S$ for every integer $k$. The projected disk therefore encloses $O$ and excludes $O'$.
    Rotation preserves the honeycomb graph and the weight. It is injective on this class because the image disk
    has a unique lift containing the origin.
  For any two such disks $U \, V$, compatibility of the boundaries of $U$ and $R
    V$ would force one disk strictly inside the other. The inner disk would then lie in $S ∩ R S$.
    The closure of this intersection is a parallelogram with diagonals $M$ and $M \/ sqrt(3)$;
    in particular its diameter is $M$, as shown in Figure 2(b).
    Both candidate inner disks have diameter greater than $C M > M$, a contradiction.
    Every original/image pair is incompatible, so the weight $S_L$ of this nonwide large class satisfies
  $ S_L^2 lt.eq I_M . $
  Translation by $t$ gives the identical two estimates for disks enclosing $O'$.
  It remains to handle noncontractible cycles. Each simple noncontractible cycle separates the two ends of the
    infinite cylinder. Two disjoint such cycles are vertically ordered:
    after compactifying the two ends, this is the nesting order of two disjoint curves separating the two added
    points. Divide the cycles that separate the marks into two classes according as $O$ lies in their upper or
    lower component. A cycle in one class is incompatible with every cycle in the other,
    since disjoint vertically ordered cycles cannot reverse the order of $O \, O'$.
    Reflection in the horizontal line interchanges the classes and preserves weight.
    If each class has weight $s$, their ordered cross-pairs give $I_M gt.eq 2 s^2$.
    Their combined weight is therefore at most $sqrt(2 I_M)$.
  The two wide classes, the two nonwide large classes, and the noncontractible classes are disjoint and exhaust
    $cal(E)_M$. Their bounds sum to
  $ 2 sqrt(8 I_M) + 2 sqrt(I_M) + sqrt(2 I_M) = \( 5 sqrt(2) + 2 \) sqrt(I_M) . $
  Outside these classes a disk contains its marked lift and has diameter at most $C M$,
    so every point in it is within distance $C M$ of that mark. ◻
]

We now compare the cylinder partition with $cal(Z)$, the planar $+ 2$ nesting partition defined in Section 10.
  At fugacity $2$, dropping every disjointness constraint involving $cal(E)_M$ costs at most

$ product_(lambda in cal(E)_M) \( 1 + 2 w_lambda \) lt.eq exp (2 sum_(lambda in cal(E)_M) w_lambda) =
  exp \( O \( sqrt(log M) \) \) . $

Every remaining disk lift lies in a ball of radius $C M$.
  A regular tessellation hexagon of side $ceil.l C' M ceil.r$, for fixed $C' > 2 C \/ sqrt(3)$,
  contains this ball. Same-mark disjointness is preserved on the chosen lifts.
  Dropping constraints between the two marks therefore bounds the remaining partition by the product of the two
  corresponding planar partitions.

For the reverse comparison fix $0 < c < 1 \/ 4$. Hexagons of side $floor.l c M
  floor.r$ about the two marked lifts, together with all their period translates,
  are pairwise disjoint for large $M$. Their surrounding cycles project to separating cylinder cycles with all
  joint disjointness preserved. We have proved

$ cal(Z) \( floor.l c M floor.r \)^2 lt.eq G_(A \, B) \( 2 \) lt.eq
  cal(Z) \( ceil.l C' M ceil.r \)^2 exp \( O \( sqrt(log M) \) \) . $

The cylinder estimate $G_(A \, B) \( 2 \) = M^(1 \/ 6 + o \( 1 \))$ now gives $cal(Z) \( R \) =
  R^(1 \/ 12 + o \( 1 \))$. To pass from the displayed arguments to every integer $R$,
  use monotonicity of $cal(Z)$. For its upper bound choose the least multiple $M$ of $4$ with $floor.l c M floor.r
  gt.eq R$; for its lower bound choose the greatest multiple $M$ of $4$ with $ceil.l C' M ceil.r lt.eq R$.
  These choices differ from $R \/ c$ and $R \/ C'$, respectively, by bounded additive amounts.

Substituting this nesting exponent in the bounds for the mean in Section 10 gives

$ bb(E)_R^(upright("chord")) N = R^(4 \/ 3 + o \( 1 \)) . $

For the bulk-visit conclusion, Proposition 26 compares the ordinary visit mass with $sum_(f tilde.op v)
  Z_D \( f \)$ by (10.14) and (10.15). The domain inclusions following that proposition therefore give,
  uniformly for honeycomb vertices $v$ at distance at most $R \/ 10$ from the center,

$ c cal(Z) \( floor.l R \/ 2 floor.r \) lt.eq cal(V)_R \( v \) lt.eq C cal(Z) \( 3 R \) $

for all sufficiently large integer $R$. Using the chord normalization (10.13), we obtain

$ bb(P)_R^(upright("chord")) \( v in gamma \) = frac(cal(V)_R \( v \), Z_R^(upright("chord"))) =
  R^(- 2 \/ 3 + o \( 1 \)) $

uniformly in the stated range. This proves the mean and bulk-visit conclusions of Theorem 2.

== 12 Two marked bonds on tilted cylinders <c7:marked>

The length-square estimate in (1.1) will follow by summing the weight of polygons through pairs of specified
  bonds. We first represent that positive sum by a finite matrix element.
  The quantitative estimate allows the two intervals between the bonds to have different lengths.

=== 12.1 The physical sum and the estimate to prove <the-physical-sum-and-the-estimate-to-prove>

Put $tau = e^(i pi \/ 3)$. After a lattice rotation or reflection,
  a #emph[permitted cut] is a periodic path of tessellation sides whose steps are $1$ and $tau$.
  Translating it by the time step $tau^2$ gives rows of rhombi:
  the spatial projection transverse to $tau^2$ is strictly increasing, so these rows tile the plane.
  A period has $M$ sides and a nonzero lattice translation $P$.
  We call a site horizontal when its cut step is $1$, and mark the honeycomb bond crossing each of two horizontal
  sites $i \, j$. Choose the seam just before $i$. The period then consists of consecutive nonempty lists $A \,
  B$, with $i$ first in $A$ and $j$ first in $B$; write $A' = A \\ { i }$ and $B' = B \\ { j }$.

On the cylinder modulo $P$, let $H^(upright("poly"))$ be the increasing closed-rim height limit of

$ sum_(lambda med upright(a med s i n g l e med s i m p l e med u n o r i e n t e d med c y c l e)\
lambda med upright(u s e s med b o t h med m a r k e d med b o n d s)) x^(\| lambda \|) . $

The sum includes contractible and noncontractible cycles. The proposition below proves that the limit is finite.

The associated physical site variables have shifted-to-horizontal ratio $q = e^(i pi \/ 4)$.
  Indeed the angles of the two rhombi relative to the time step are $pi \/ 3$ and $2 pi \/ 3$;
  at one common physical row their spectral differences are $alpha$ and $2
  alpha$ for the shifted and horizontal sites, respectively.
  At both differences the scalar weights are exactly the honeycomb weights after splitting each rhombus into two
  equilateral triangles. At $2 alpha$ the weights $u \, d$ and $a \, b$ are interchanged relative to $alpha$.

For a generic nonzero site list $X$ on the same two lists, define a separate algebraic quantity

#[#set math.equation(numbering: n => "(12.1)")
 $ H^(upright("flip")) \( X \) = L_(-) f_i thin i^(sum_(a in A') s_a^(upright("phys"))) e_j R_(+) \, wide
   f_i = \| - chevron.r_i chevron.l + \| \, quad e_j = \| + chevron.r_j chevron.l - \| . $ <j:marked-flip-definition>]

Here $s_a^(upright("phys"))$ is the diagonal site-spin operator, and $R_(+) = R_i$, $L_(-) =
  L_(- i)$ are the selected vacuum vectors of Lemma 8. Their generic normalization is the one fixed in Section 3.

#thm([Proposition 12.1.])[
  (Physical two-bond identity).  #emph[Let the permitted cut have even $M$,
    and let both marked sites be horizontal. The positive sum $H^(upright("poly"))$ is finite.
    The generic matrix element $H^(upright("flip"))$ has a regular limit at the associated physical site list,
    and at that list
$ H^(upright("flip")) = H^(upright("poly")) . $

 This holds for every order and every number of the two site types in the two nonempty lists;
   the unmarked lists may be empty.]
] <j:marked-physical>

#thm([Theorem 12.2.])[
  (Unequal marked intervals).  #emph[Use the physical tilted cylinder and horizontal-type marked bonds just
    defined. Its two cut intervals have $m + 1$ and $n + 1$ sites, with $n gt.eq m$ and $M = m + n + 2$ even.
    In each unmarked list the logarithmic site coordinates have imaginary parts $- f$ and $1 - f$, where $0 lt.eq
    f lt.eq 0.6$. Their respective counts differ from $m \( 1 - f \) \,
    m f$ in the first unmarked list and from $n \( 1 - f \) \, n f$ in the second by at most a fixed constant.
    Let $H^(upright("poly"))$ be the sum of $x^(\| lambda \|)$ over single unoriented polygons through the two
    specified bonds. Uniformly over these lists and their orders,
    for every $epsilon.alt > 0$ there are $C_epsilon.alt$ and $m_epsilon.alt$ such that
$ H^(upright("poly")) lt.eq C_epsilon.alt n^epsilon.alt m^(- 4 \/ 3) \( n \/ m \)^(1 \/ 3)
  wide \( n gt.eq m gt.eq m_epsilon.alt \) . $

 Both $C_epsilon.alt$ and $m_epsilon.alt$ may depend on the fixed bound for the count discrepancies.]
] <j:unequal>

The physical identity has the broader domain: its proof uses the selected vacuum vectors,
  a finite nonvanishing result for their scalar normalizer, summability on a fixed cylinder,
  and a two-arc phase calculation. The count restrictions in Theorem 29 enter later,
  when Sections 13–15 estimate the horizontal representation.
  We keep the algebraic and positive sums separate until Proposition 28 is proved.

=== 12.2 The generic flip formula <the-generic-flip-formula>

Put $U = x_i$, $V = x_j$, and retain arbitrary nonzero values of these variables.
  For the unmarked lists $\( A' \, B' \)$, let $C_s$ denote the summand in (3.4) for $N^2 cal(G)$ at $h = 1$,
  including its phases. Thus the labels satisfy $Q = sum_(A') s_a = sum_(B') s_a$.
  For a pair $\( u \, v \)$ write $e_k \( u \, v \) = v - q^k u$.

#thm([Proposition 12.3.])[
  (Generic long-flip formula).  #emph[For generic nonzero $X$ on consecutive nonempty lists $A \, B$,
#[#set math.equation(numbering: n => "(12.2)")
 $ N \( X \)^2 H^(upright("flip")) \( X \) & = c U V sum_s q^(- 6 Q) C_s product_(a in A' union B')
   F_(s_a) \( U \, x_a \) F_(s_a) \( V \, x_a \) \,\
\( F_(+) \, F_0 \, F_(-) \) & = \( e_5 e_6 \, e_3 e_5 \, e_2 e_3 \) \, wide c = 2 - sqrt(2) . $ <c7:eq-L>]

 The two endpoint variables $U \, V$ are independent in this identity.]
] <j:marked-flip-formula>

#proof[
  We first separate the individual spin terms of the unflipped pairing.
    For each of two lists, use its ordered partial monodromy with both auxiliary ends fixed at $+
    1$ for the first list and at $- 1$ for the second. Within a list these operators commute as the probe varies:
    the exchange proof applies because the equal extremal auxiliary pair has a scalar block.
    Label basis spins by $s = s^(upright("phys"))$ in the first list and $s = -
    s^(upright("phys"))$ in the second. At fixed total spin, order configurations by their prefix sums.
    Each partial monodromy is triangular, with row $lt.eq$ column,
    because the intermediate auxiliary spin stays within its bounds.
  The diagonal characters are products of the one-site entries $r_s \( w \/ x \)$,
    where $\( r_(+) \, r_0 \, r_(-) \) = \( a_(upright("tile")) \, v_(upright("tile")) \, b_(upright("tile")) \)$.
    They are distinct jointly at generic variables. Their denominator roots are $w \/ x = q^5 \, q^6$,
    and their numerator root indices are
  $ D_(-) = { 0 \, 1 } \, quad D_0 = { 0 \, 3 } \, quad D_(+) = { 2 \, 3 } . $
  Apply the joint eigenprojection to its leading coordinate to obtain $\| s chevron.r chevron.r$ and $chevron.l
    chevron.l s \|$, taking the product over the two lists. Their leading coefficients are one,
    their ket and bra supports are respectively $lt.eq s$ and $gt.eq s$, and they are dual.
    Indeed each generic projection is a polynomial in triangular matrices with exactly one diagonal entry equal to one.
  Consider the two amplitudes $N chevron.l chevron.l s \| R_(+)$ and $N L_(-) \| s chevron.r chevron.r$,
    in total physical charge zero. We list forced factors, omitting phases.
    In both there is a factor $product_a x_a^(s_a^2 \/ 2)$. For a same-group pair in order $x \, y$, labels $a \,
    b$, the right amplitude (involving $R_(+)$) has zeros
  - $e_5 \( x \, y \)$ unless $\( a \, b \) = \( + \, - \)$;
  - $e_6 \( x \, y \)$ unless $\( a \, b \) in { \( + \, 0 \) \, \( 0 \, - \) \, \( + \, - \) }$.
  Allow denominator $e_0$ if $a < b$, $e_1$ for $\( - \, + \)$, $e_7$ for $\( 0 \, 0 \)$.
    For the left amplitude use the same right rule with the order reversed.
    Thus the product of the two rules gives the rational monic part of $p_(a b)$ above up to constants.
    For a cross pair (either list first), in #strong[each] amplitude use a factor $e_5$ if $a < b$,
    $e_3$ if $a > b$, additionally $e_6$ for $\( - \, + \)$, $e_2$ for $\( + \, - \)$.
    There are no cross denominator factors.
  ===== 12.2.1 Forced factors and partial spectra. <forced-factors-and-partial-spectra.>
  The vacuum input here is precisely the asymmetric statement of Lemma 8.
    For a physical zero-charge configuration $sigma$ and $t_a^2 = x_a$, it says that
  $ frac(N \( R_(+) \)_sigma, product_a t_a^(sigma_a^2)) \, wide frac(N \( L_(-) \)_sigma, product_a t_a^(sigma_a^2)) $
  are polynomials in the ordinary site variables, independent of the square-root signs,
    of degree at most $\| X \| - 1 - sigma_a^2$ in $x_a$. For a vacant coordinate, their value at $x_a =
    0$ is $product_(b eq.not a) x_b$ times the corresponding reduced polynomial,
    and their coefficient of $x_a^(\| X \| - 1)$ is that reduced polynomial.
    With one varied site and generic fixed spectators, the proof also gives, for the normalized coordinates,
    an occupied coordinate of order $O \( t_a \)$ at zero and $O \( t_a^(- 1) \)$ at infinity,
    and the reduced vacant coordinate at both limits. These conclusions apply to $R_(+)$ and $L_(-)$ only.
  The additional poles of our amplitudes come from the partial projections.
    At a generic point of a same-list divisor $y = q^delta x$,
    their spectral coincidences require equality of $D_a union \( delta + D_b \)$ modulo 8 at fixed $a + b$.
    The displayed root lists give only the following doublets:
    unequal swapped labels at $delta = 0$; $\( - \, + \)$ and $\( 0 \, 0 \)$ at $delta = 1$;
    and their reflections at $delta = - 1$. The spectator labels agree,
    and there are no coincidences at other generic divisors. A regular generic linear combination of probes
    separates either doublet to first order: moving the second ratio moves a different multiset of numerator
    roots, so the logarithmic derivatives differ. It also separates the other characters.
    Thus these poles have order at most one. Solving in triangular order on supports shows that the ket of the
    lower label and bra of the higher have no pole, since those supports exclude the colliding index.
    This is exactly the denominator rule above. Several characters can coincide at an intersection of these
    divisors; we make no doublet assertion there.
  The singleton limits of the partial basis require a separate observation.
    With one site on its own scale, fixed regular probes have diagonal entry $q^(plus.minus 3 s)$ times the
    generic spectator character, so a generic probe has a holomorphic simple projection at that limit.
    It preserves the varied site’s vacancy parity there. Let $P_a$ act by $\( - 1 \)^(sigma_a^2)$ on the physical
    site basis. The leading-coordinate normalization gives
  $ \| s chevron.r chevron.r \( - t_a \) = \( - 1 \)^(s_a^2) P_a \| s chevron.r chevron.r \( t_a \) \, wide
    chevron.l chevron.l s \| \( - t_a \) = \( - 1 \)^(s_a^2) chevron.l chevron.l s \| \( t_a \) P_a . $
  Together with the coordinate limits of the selected vectors,
    this shows that either amplitude divided by $N$ is bounded at both singleton ends,
    and is respectively $O \( t_a \)$ and $O \( t_a^(- 1) \)$ there if $s_a = plus.minus 1$.
    It also shows that extracting $product_a t_a^(s_a^2)$ makes each amplitude rational in the ordinary variables.
  For same-group fusion put a higher site $q^delta u$ before a lower $u$, $delta = 2 \, 3$.
    The site intertwiner used above places $R_(+)$ in its image and intertwines even the partial monodromy there
    (for adjacent sites). Simplicities of the full and reduced fixed characters hold generically there by the same
    paired-scale tests, and the partial spectra are still simple by the root lists.
    Only labels realizing a reduced eigenvalue can occur in $chevron.l chevron.l s \| R_(+)$.
    Comparing numerator lists after denominator cancellation, in (high,
    low) order these are $\( + \, - \)$ for $delta = 3$, and $\( + \, 0 \) \, \( 0 \, - \) \, \( + \, - \)$ for
    $delta = 2$. For instance at $delta = 2$ the two removed poles in numerator indices relative to $u$ are $0 \,
    5$. This proves the same-group right zeros. Swaps moving the pair together while preserving their relative
    order are allowed by regular exchange similarities at generic spectators,
    mapping the partial label projections along with the fixed lines.
    The normalizations cause only nonzero finite scalars (all these lines simple with their stated leading
    coefficients). The identical reasoning in reversed order proves left zeros:
    at real phases take Hermitian adjoints of monodromies, which reverses order (and conjugates the twist),
    then extend identities algebraically.
  For cross fusion with $x = q^delta y$, put the high site last of its list and the low first of its list.
    This uses same-list swaps, and, if the lists have to be interchanged cyclically,
    a seam change acting by a diagonal twist on the conserved list spin (hence preserving partial eigenspaces),
    directly by charge conservation. Suppose first the high site is in the first ($+$ convention) list.
    In the right-amplitude bra its physical spin is $lt.eq a$ by prefix support; that of the low site is $lt.eq -
    b$. But the vacuum ket in the fusion image uses total spin on the pair equal to 0 at $delta = 3$,
    or in $\[ - 1 \, 1 \]$ at $delta = 2$. This excludes $a < b$ or $a < b - 1$ respectively.
    When the high site belongs to the other list negate physical spins in this argument.
    Apply the same adjacency arrangement in reversed order to the adjoint for the left amplitude.
    This proves the claimed cross factors, with both signs of shifts by interchanging arguments.
  After dividing by the stated rational factors and site half powers, the remaining rational function has no pole.
    Indeed every possible irreducible divisor at finite nonzero values has been checked at a generic point,
    and the singleton parity estimate removes the possible pole at zero.
    Unique factorization then removes the same denominators globally,
    including at intersections of shifted divisors. The remainder is a polynomial.
    For a pair, the net degrees used by the rational factors are $1 + s t$ in the same list and $1 - s t -
    upright(bold(1))_(s = t = 0)$ across lists. Charge equality, the singleton bounds,
    and $deg_(x_a) N lt.eq \| X \| - 1$ show that this polynomial is independent of every nonzero-label variable.
    Its degree in a zero-label variable is at most the number of zeros in the opposite list.
  It follows that individually for the unflipped two-list problem
  $ N^2 thin i^Q \( L_(-) \| s chevron.r chevron.r \) \( chevron.l chevron.l s \| R_(+) \) = C_s $
  (here $C_s$ and $Q$ temporarily refer to those arbitrary lists). Indeed induct on size.
    If a list has a distinct-label pair, choose a specialization $\( x \, y \) = \( u \, q^2 u \)$ on these labels
    in #emph[ascending label] order (regardless of site order).
    This imposes a value on a nonzero-label variable, still free in the factored-out portion,
    without any zero or pole from its forced factors. By full similarity covariance of the left-right projected
    product (normalization by vacuum overlap 1), we may arrange the high site immediately before the other
    (same-list reordering here is an identity first at generic coordinates,
    continued to the regular values on this specialization even if an exchange itself becomes singular).
    Site fusion now reduces the cleared expression exactly to the reduced individual label expression times the
    $N^2$ fusion multiplier: the right fixed vector lies in the image,
    the partial probes intertwine there with simple spectra, the left fixed vector restricts to the reduced one up
    to normalization (product of normalizing scalars 1 by overlap), and the list spin is unchanged.
    The product check for surviving summands in the earlier spin formula has precisely this individual reduction.
    The displayed candidate shares the rational/degree rules (with the extra cross $00$ numerator),
    so the single evaluation in the nonzero-label variable proves equality. This handles all nonuniform cases.
    The remaining cases then follow by summing projections and comparing coefficients of $h^Q$ in the known
    unflipped spin sum: the all-zero term is the only unaccounted one there at $Q = 0$,
    and a uniform charged configuration, if any, uniquely realizes its extremal $Q$ on two equal nonempty lists.
    This includes the induction base.
  ===== 12.2.2 Insertion of the two long flips. <insertion-of-the-two-long-flips.>
  Insert now the long flips between expansions in the partial bases on the #strong[full] lists.
    By first-site triangular support the matrix element from ket label $v$ to bra label $u$ is zero unless $v_i =
    v_j = +$ and $u_i = u_j = -$. In these branches (physical first spins necessarily extremal due to the flips),
    the sections of basis vectors at their indicated first labels are exactly the corresponding normalized partial
    basis vectors on the remaining lists: the fixed-first-label triangular diagonal block of the probes is just
    the reduced probe times that first diagonal factor. Thus remaining labels have to match, say $s$ there,
    and the matrix element equals $i^Q$.
    We must evaluate $N^2 \( L_(-) \| u chevron.r chevron.r \) \( chevron.l chevron.l v \| R_(+) \)$ with these
    labels. As functions of $U \, V$ the forced factors and degree rule determine this up to a spectator factor:
    multiplying the two tables gives precisely
  $ U V product_a F_(s_a) \( U \, x_a \) F_(s_a) \( V \, x_a \) $
  for their entire dependence (product over unmarked sites). Here the endpoints were first of their own lists.
  Put the endpoints now together on one large scale above the spectators, in generic ratio.
    In these particular amplitudes $\| u chevron.r chevron.r$ and $chevron.l chevron.l
    v \|$ have actual first spins fixed by extremality, and reduced-list sections as just noted.
    Their physical endpoint total charge is zero, so only the diagonal grade block of the vacuum projections is
    needed. The two-scale argument above isolates the fixed character as a product of endpoint pair and spectator
    projections, up to the common diagonal similarity: charged endpoint totals are excluded exactly by the regular
    pair tests used for matched pair scales ($p_j^(S_j)$ for odd total,
    and the generic scalar $p_j^(plus.minus 1) a_(upright("tile"))$ for absolute total two).
    Neutral blocks see original twists. On endpoint physical spins $\( t \, - t \)$ and given spectator list
    totals $\( Q \, - Q \)$ the similarity displayed there acts by $q^(3 t Q)$.
    Hence the amplitudes divided by $N$ each pick up $q^(3 Q)$ relative to the reduced-list ones in this limit,
    as well as the endpoint pair components, whose combined multiplier by the explicit vacuum pair formula ($p =
    i$ on right, $- i$ on left, respectively entries $+ \, -$) is $c U V \/ \( U + V \)^2$. Also
  $ N \( X \) tilde.op \( U V \)^(\| X \| - 2) \( U + V \) N \( X \\ { U \, V } \) \; $
  cross rows in the Pfaffian coincide toward the rest. Finally the leading phase in the displayed $F$ product is
    $q^(6 sum_a s_a) = q^(12 Q)$. This computes the spectator factor by the individual unflipped formula and
    proves (12.2). ◻
]

=== 12.3 Finite nonvanishing at the physical sites <finite-nonvanishing-at-the-physical-sites>

The physical vacuum argument needs only finite nonvanishing.
  The growth of the same scalar with the number of sites will enter later in Section 13.

#thm([Lemma 12.4.])[
  (Orbital ratio and nonvanishing).  #emph[Let $M = 2 L gt.eq 2$, $w_j =
    i h_j$ with $h_j in bb(R)$ of spread at most one, and $x_j = e^(eta w_j)$, where $eta = pi \/ 4$. Define
$ cal(S) \( X \) = cal(P) \( X \) product_(j < l) C \( w_j - w_l \) \, wide C \( r \) = tanh \( pi r \/ 6 \) \, $

 using the confluent value for equal sites. Then $cal(S) \( X \) eq.not 0$ and
#[#set math.equation(numbering: n => "(12.3)")
 $ frac(N \( X \), cal(S) \( X \)) = (2 / 3)^L bb(E)_h exp #h(-0.16667em) (sum_(a = 1)^L phi.alt \( k_a \)) > 0 \,
   wide phi.alt \( k \) = log (1 + frac(e^(- 2 k), 1 + e^(- 4 k))) . $ <j:shifted-orbital-ratio>]

 Here $bb(E)_h$ has ordered density on $0 < k_1 < dots.h.c < k_L$ proportional to
$ Delta \( k^2 \)^2 product_(a = 1)^L frac(k_a, sinh 3 k_a) med I_h \( k \) \, wide I_h \( k \) =
  integral_(U \( 2 L \)) e^("tr" \( D_k cal(U) D_h cal(U)^(*) \)) thin d cal(U) \, $

 where $D_k = "diag" \( k_1 \, dots.h \, k_L \, - k_1 \, dots.h \, - k_L \)$ and $D_h =
   "diag" \( h_1 - h_(*) \, dots.h \, h_M - h_(*) \)$ for $h_(*) = \( max h_j + min h_j \) \/ 2$.
   The measure on $U \( 2 L \)$ is normalized Haar measure. In particular $N \( X \) eq.not 0$.
   The nonvanishing also holds after multiplying every $x_j$ by the same nonzero scalar.]
] <j:shifted-nonvanishing>

#proof[
  First, each pair factor $d \( x_j \, x_l \) C \( w_j - w_l \) \/ \( x_j - x_l \)$ is nonzero on this domain,
    including its finite nonzero limit at equality. Indeed the roots of $d \( u \, v \) = u^2 + sqrt(2) u v +
    v^2$ have relative arguments $plus.minus 3 pi \/ 4$, outside the present range $\[ - pi \/ 4 \, pi \/ 4 \]$.
    Within $\| Im \( w_j - w_l \) \| lt.eq 1$, the only zero of $C$ is the simple zero at equality and $C$ has no
    pole. This proves the assertion about $cal(S)$.
  For distinct $h_j$, use the transforms of $B'_0$ and $C'$ in the homogeneous normalization calculation.
    For either odd kernel $B = B_0 \, C$,
  $ B \( i \( h_j - h_l \) \) = integral_0^oo frac(i sinh \( \( h_j - h_l \) k \), pi k) hat(B') \( k \) thin d k . $
  The $L$th exterior power of the integral of these decomposable two-forms expresses its Pfaffian as an integral
    of $det \[ e^(plus.minus h_j k_a) \]$ on ordered positive $k_a$,
    with the product of the corresponding weights $hat(B') \( k_a \) \/ k_a$ and common constants.
    Apply the unitary orbital determinant identity derived before (10.7).
    The Vandermonde of the paired $k$ list supplies a constant times $product_a k_a thin Delta \( k^2 \)^2$.
    Schur’s identity gives $"Pf" C \( w_j - w_l \) = product_(j < l) C \( w_j - w_l \)$, while
  $ frac(hat(B'_0) \( k \), hat(C') \( k \)) = 2 / 3 e^(phi.alt \( k \)) \, wide hat(C') \( k \) =
    frac(6 k, sinh 3 k) . $
  Taking the ratio proves (12.3).
  All integrations are absolute on the stated domain: $parallel D_h parallel lt.eq
    1 \/ 2$ gives $I_h \( k \) lt.eq e^(sum_a k_a)$, whereas $k \/ sinh 3
    k$ decays like a polynomial times $e^(- 3 k)$. This bound also permits coincident $h_j$ by continuity in the
    orbital formula. The expectation is strictly positive at every size, proving $N eq.not 0$.
    Homogeneity of $N$ and $cal(S)$ gives the last assertion. ◻
]

=== 12.4 Summability on a fixed cylinder <summability-on-a-fixed-cylinder>

#thm([Lemma 12.5.])[
  (Period exclusion).  #emph[Fix a nonzero lattice translation $P$ and a honeycomb vertex $v$.
    The total critical weight of plane SAWs starting at $v$ whose visited vertices are distinct modulo $P$ is
    finite. The empty walk may be included. The bound may depend on $P$.]
] <j:period-excluded>

#proof[
  Rotate the lattice and, if necessary, replace $P$ by $- P$ so that $P = a tau +
    b \( tau - 1 \)$ with integers $a \, b gt.eq 0$. These choices are possible because the sixty-degree cones
    spanned by successive lattice directions cover the plane.
    Use horizontal tessellation lines for these coordinates. Let $a_h$ be the total weight of first-exit slab
    crossings from a fixed bottom port to any top port $h$ layers above,
    and let $b_h$ be the weight of those crossings with no intermediate level crossed exactly once.
    The convex balance in Section 2, exhausted horizontally, gives $a_h lt.eq csc \( pi \/ 8 \)$ for every $h$.
  Cut a crossing at every intermediate level that it crosses exactly once.
    The resulting blocks are irreducible crossings counted by the $b_h$.
    Conversely, any word of such blocks concatenates freely: the first-exit property places successive blocks in
    disjoint open slabs, sharing only their joining port. Their weights multiply. Thus, for $0 < t < 1$,
  $ A \( t \) := sum_(h gt.eq 1) a_h t^h = sum_(r gt.eq 1) B \( t \)^r < oo \, wide B \( t \) :=
    sum_(h gt.eq 1) b_h t^h . $
  It follows that $B \( t \) < 1$ and, by monotone convergence, $mu := sum_(h gt.eq 1) b_h lt.eq 1$.
  Among the height-one blocks, choose the word that takes the $a +
    b$ upward moves whose sum is $P$ and then repeats its first block.
    Its length is $r_P = a + b + 1$ and its weight is $p_P = x^(2 r_P) > 0$: each move traverses two triangles.
    Its first and last repeated blocks visit vertices equal modulo $P$.
    A period-excluding word must therefore avoid this specified word.
    Divide any longer word into disjoint chunks of length $r_P$ and a last shorter chunk.
    The sum of weights of words that avoid the specified word is at most
  $ sum_(j = 0)^(r_P - 1) mu^j sum_(r gt.eq 0) \( mu^(r_P) - p_P \)^r lt.eq r_P / p_P < oo . $
  The same remains true if a first and a last irreducible block are left unrestricted,
    since their total masses are at most $mu$.
  We transfer this bound from ports to vertices. Measure a vertex span $l$ in units of one third of the layer
    spacing. Extend a segment whose endpoints are opposite height extrema to the adjacent port lines,
    as in Lemma 24. The extension adds at most one triangle at either end, at bounded multiplicity.
    If the resulting slab has height $h$, then $3 h - l in { 2 \, 3 \, 4 }$.
    The sequence of middle irreducible blocks still belongs to the original period-excluding segment,
    so it avoids the specified word. The preceding sum therefore gives bounds $C_l$ for the weight of such
    segments from a fixed vertex to all opposite extremal endpoints, with
  $ sum_(l gt.eq 1) C_l < oo . $
  We take the maximum over both directions and the two vertex types; the port extension costs only a fixed factor.
  A segment starting at its highest vertex and staying no higher splits at successive last opposite extrema as
    described after Lemma 24. Its positive spans decrease strictly,
    apart from a possible equality of the first two. Put $d_l = C_l \/ x$,
    accounting for the shared vertex at a join. Summing over these span lists costs at most a fixed factor times
  $ (1 + sum_(l gt.eq 1) d_l^2) product_(l gt.eq 1) \( 1 + d_l \) < oo . $
  The empty segment is included. Finally split a full walk at a specified highest vertex,
    for example the first such vertex. To count the reversed first half without summing over free highest
    positions, translate its highest endpoint to one of two fixed representatives, according to vertex type.
    Its translated end and the original fixed start determine the translation.
    Both halves are therefore bounded by the preceding endpoint-summed bound. ◻
]

=== 12.5 The phase of two marked arcs <the-phase-of-two-marked-arcs>

We calculate phases on the reference flat cylinder with horizontal cut and angle $pi \/ 3$,
  keeping the scalar weights of the physical tilted rows. The local pictures and phases after the telescoping
  removal in Section 2 are unchanged by this choice. Place the seam at zero and write the endpoint abscissae as
  $0 < i < j < M$.

Consider a smooth regular embedded lift of one directed arc $X : \[ 0 \, 1 \] arrow.r
  bb(R)^2$ from $\( i \, 0 \)$ to $\( j + k M \, 0 \)$, $k in bb(Z)$,
  disjoint from all of its nontrivial horizontal $M$-translates.
  Its endpoint tangents are vertical with signs $zeta_i \, zeta_j in { - 1 \, 1 }$, upward positive.
  Use a small perturbation to make its interior cut and seam-ray crossings transverse,
  retaining the absence of interior cut crossings at seam or endpoint abscissae and its prescribed tangent turns.
  The actual reference lattice arcs have this absence before smoothing.
  Let $x_z$ and $epsilon.alt_z$ be the abscissae and signed directions of the interior cut crossings, and define

$ mu = sum_(upright("interior crossings ") z) epsilon.alt_z delta_(x_z) + zeta_i / 2 delta_i + zeta_j /
  2 delta_(j + k M) \, wide C \( a \) = mu \( \( - oo \, a \) \) + 1 / 2 mu \( { a } \) . $

The total mass is zero, since the interior signed crossing total is $- \( zeta_i + zeta_j \) \/ 2$.
  In particular $C$ has compact support. Define the finite sums

$ C_0 = sum_(ell in bb(Z)) C \( ell M \) \, wide C_(upright("per")) \( a \) =
  sum_(ell in bb(Z)) C \( a + ell M \) - C_0 . $

There is no interior crossing at a seam or an endpoint translate.
  At an endpoint, $C$ includes half of an atom already of mass $zeta \/ 2$, hence the contribution $zeta \/ 4$.

#thm([Lemma 12.6.])[
  (Arc turn and seam count).  #emph[Let $T \( X \)$ be the total turn of the lifted arc,
    and let $K$ be its integer signed number of eastward crossings of the upper seam rays ${ ell M }
    times \( 0 \, oo \)$, summed over $ell$. Then
#[#set math.equation(numbering: n => "(12.4)")
 $ T \( X \) = - 2 pi #scale(x: 120%, y: 120%)[\(] C_(upright("per")) \( i \) + C_(upright("per")) \( j \) +
   2 C_0 #scale(x: 120%, y: 120%)[\)] \, wide K = C_0 + k / 2 . $ <j:marked-phase-identities>]

 Consequently, for $q = e^(i pi \/ 4)$,
$ q^(4 C_0) i^k \( - 1 \)^K = e^(2 pi i K) = 1 . $

]
] <j:marked-phase>

#proof[
  For a seam or endpoint abscissa $a$, use the branch $arg \( a - X \) in \( 0 \, 2 pi \)$.
    Each upward cut crossing to the left of $a$ requires a correction $- 2 pi$.
    The initial and terminal branch arguments are respectively
  $ pi #scale(x: 120%, y: 120%)[\(] 1 + zeta_i upright(bold(1))_(i < a) #scale(x: 120%, y: 120%)[\)] \, wide
    pi #scale(x: 120%, y: 120%)[\(] 1 - zeta_j upright(bold(1))_(j + k M < a) #scale(x: 120%, y: 120%)[\)] \, $
  where an indicator is $1 \/ 2$ at equality. Thus the continuous variation of $arg \( a - X \( t \) \)$,
    using one-sided endpoint limits, is $- 2 pi C \( a \)$.
  Lift $arg \( X \( t \) - X \( s \) \)$ continuously on the triangle $s < t$.
    On the route $\( 0 \, 0 \) arrow.r \( 0 \, 1 \) arrow.r \( 1 \, 1 \)$, its changes are $-
    2 pi C \( i \)$ and $- 2 pi C \( j + k M \)$. On the diagonal its limiting angle is the tangent angle,
    whose change is $T \( X \)$. The two routes have the same endpoints, so $T \( X \) = -
    2 pi \( C \( i \) + C \( j + k M \) \)$. For $ell eq.not 0$ instead lift
    $arg \( X \( t \) + ell M - X \( s \) \)$ on the whole square.
    Disjointness from the translate makes this well defined. The diagonal angle is constant;
    the same two-edge route therefore gives
  $ C \( i - ell M \) + C \( j + k M + ell M \) = 0 . $
  Summing these identities with the $ell = 0$ turn identity gives the first formula in (12.4).
  For a seam at $a$, let $I_a$ be the interior signed upward cut flux to its left and let $K_a$ be the signed
    eastward crossings of its upper ray. Flux from the upper-left region gives
  $ K_a = I_a + upright(bold(1))_({ zeta_i = 1 \, med i < a }) -
    upright(bold(1))_({ zeta_j = - 1 \, med j + k M < a }) . $
  Substituting the endpoint half-atoms into $C \( a \)$ makes this
  $ K_a = C \( a \) + frac(upright(bold(1))_(i < a) - upright(bold(1))_(j + k M < a), 2) . $
  An interior upward cut crossing enters that region and a downward one leaves it; an upward start contributes $+
    1$, and a downward finish contributes $- 1$. Summing over $a = ell M$ gives $K = C_0 + k \/ 2$,
    because $0 < i < j < M$ makes the sum of the indicator differences equal to $k$.
    Here $K$ is an integer by its definition as a signed crossing count.
    The displayed phase cancellation now follows by substituting $C_0 + k \/ 2 = K$. ◻
]

=== 12.6 Identification of the physical matrix element <identification-of-the-physical-matrix-element>

#proof[
  For the physical site list, Lemma 31 gives $N eq.not 0$: after a common rescaling its logarithmic heights lie in
    ${ 0 \, 1 }$, so their spread is at most one. Lemma 8 therefore continues the selected vectors $R_(+)$ and
    $L_(-)$ componentwise to this list, including its simultaneous coincidences.
    Their vacuum components remain one, and the regular physical row matrices still fix them.
  We identify these algebraic vectors with the physical vacuum limits.
    Stack the uniform-twist physical transfers, with twist $i$ or $- i$, on the fixed cylinder modulo $P$.
    Untouched closed loops cancel in the oriented sum. With any fixed rim states,
    the remaining finitely many occupied rim ports are paired by oriented arcs.
    The absolute weights of those arcs are bounded by products of the period-excluding SAW sums of Lemma 32.
    Arcs reaching depth tending to infinity from a rim have vanishing total weight,
    by the tail of that finite sum. After discarding arcs that reach the middle row,
    the bottom and top configurations occupy disjoint slabs and hence factor.
    Thus, as the distance between the rims tends to infinity,
    the transfer matrix factors into independent bottom and top vacuum vectors. Their vacuum components are one.
    This argument is for each fixed $P$ and needs no uniformity in its length.
    Multiplying the continued fixed vectors by these large powers identifies them, by their vacuum normalization,
    with the corresponding physical vectors.
  It remains to compute the finite-stack matrix element with the two flips.
    On the reference geometry, the flips create two directed arcs from $i$ to $j$,
    with opposite vertical signs at each endpoint. Every other loop is disjoint from both arcs and cannot separate
    the endpoints. Its interval insertion phase is therefore one, so the usual orientation cancellation,
    including its seam twist, removes it. The two arcs join to a single unoriented polygon.
  For either arc, Lemma 33 makes its turning phase
  $ e^(- i T \( X \) \/ 4) = q^(2 \( C_(upright("per")) \( i \) + C_(upright("per")) \( j \) + 2 C_0 \)) . $
  The total signed seam crossing count is $k$, and the signed upper count is $K$.
    The lower twist $i$ and upper twist $- i$ thus contribute $i^k \( - 1 \)^K$.
    Between the two arcs the endpoint atoms cancel. Since the seam immediately precedes $i$,
    their summed $C_(upright("per")) \( i \)$ is zero. Physical spin counts downward crossings positively,
    so the interval insertion equals
  $ i^(sum_(a in A') s_a^(upright("phys"))) =
    q^(- 2 sum_(upright("arcs")) \( C_(upright("per")) \( i \) + C_(upright("per")) \( j \) \)) . $
  The remaining phase for each arc is $q^(4 C_0) i^k \( - 1 \)^K = 1$. This holds for arbitrary integer $k$.
    Each polygon has exactly the specified source-to-sink flow,
    so its scalar weight is counted once and is $x^(\| lambda \|)$.
  The absolute arc sums above allow both rim heights to tend to infinity in this finite-stack identity.
    They also prove finiteness of the positive polygon sum. Hence $H^(upright("flip")) =
    H^(upright("poly"))$ at the physical list. ◻
]

At a physical list we may henceforth write $H_(upright("lg")) = H^(upright("poly")) = H^(upright("flip"))$.
  At nearby generic lists only $H^(upright("flip"))$ is used.
  In particular any use of (12.2) at a nongeneric list means the limit of its combined expression.
  The next section estimates that algebraic quantity before taking the physical limit.

== 13 The horizontal representation with marked bonds <c7:markedgas>

The marked matrix element changes the site source and adds one varying angle.
  We first establish its horizontal gas identity for finite lists at a supported finite period.
  We then continue the identity to nearby shifted lists and send the period to infinity with those lists fixed.
  The estimates uniform in their sizes and orders come in Sections 14 and 15;
  only after those estimates do we approach the physical spread-one lists.
  The auxiliary site-count limit at fixed period used for the mixed spectral radius is stated separately below.

=== 13.1 The endpoint source and the finite-list regulator <the-endpoint-source-and-the-finite-list-regulator>

Take the combined limit of (12.2) at $U = V = e^(eta w_e)$.
  This is the only specialization of its two endpoint variables.
  Write $W_sigma = \( w_(sigma \, 1) \, dots.h \, w_(sigma \, n_sigma) \)$ for the unmarked coordinates in species
  $sigma = 1 \, 2$, with $n_sigma gt.eq 0$, and set $x_(sigma \, a) = e^(eta w_(sigma \, a))$.
  The full ordered list is $\( U \, e^(eta W_1) \, U \, e^(eta W_2) \)$ and has size $M = n_1 + n_2 + 2$.
  Let $P_0 \( W_1 \, W_2 \)$ be the all-zero term of the finite spin sum on the unmarked lists.
  Empty products have value one.

The pair factors and sign cancellation for a defect $delta = - s = plus.minus 1$ at centered coordinate $v = w +
  i delta \/ 2$ are unchanged. Before Gaussian splitting, its potentials against a zero site in the same and
  opposite species are respectively

$ V_(d \, -) \( w \) = q^(- 1) frac(e_1 e_7, e_0 e_6) \, wide V_(c \, -) \( w \) = q e_3^2 / e_4^2 \, wide e_k =
  1 - q^k e^(eta w) \, $

and $V_(rho \, +) \( v - i \/ 2 \) = V_(rho \, -) \( v + i \/ 2 \)^(- 1)$.
  The local factor after sign cancellation is $sqrt(c)$, before these zero-site interactions.
  The extra $p_0 \/ 4$ in the matched prescription came from the opposite-species zero at the same coordinate.

The phase $q^(- 6 Q)$ and the two endpoint ratios in (12.2) contribute $exp \( i delta D_e \( v - w_e \) \)$ per
  defect, where the odd branch $D_e$, real on the real line, is determined by

$ e^(- i D_e \( v \)) = q^(- 3) (frac(e^(eta v) - q^(11 \/ 2), e^(eta v) - q^(5 \/ 2)))^2 . $

It is analytic on $\| Im v \| < 5 \/ 2$ and tends exponentially to $plus.minus nu$ at the two real infinities,
  where $nu = 3 pi \/ 4$. Indeed

$ D'_e \( v \) = frac(2 eta sin \( 5 pi \/ 8 \), cosh \( eta v \) - cos \( 5 pi \/ 8 \)) \, wide
  hat(D'_e) \( k \) = 4 pi frac(sinh \( 3 k \/ 2 \), sinh 4 k) . $

Fix $0 < r < 1 \/ 8$. Start with distinct real unmarked coordinates and a real endpoint coordinate,
  all of absolute value less than $r \/ 8$, and take $T > 8 r$. Use the Gaussian and Wick data of Section 4.
  In the current (4.2) of species $sigma$, put $z = 1$, use the product of $U_(delta \, T)$ translated to its own
  list $W_sigma$, and use the circle $gamma_r$ enclosing that list.
  Replace $phi_sigma \( v \)$ by $phi_sigma \( v \) + d_T \( v \)$, where

#[#set math.equation(numbering: n => "(13.1)")
 $ d_T \( v \) = sum_(ell in bb(Z)) #scale(x: 120%, y: 120%)[\[] D_e \( v - w_e + ell T \) -
   D_e \( v - w_e - T \/ 2 + ell T \) #scale(x: 120%, y: 120%)[\]] - nu . $ <j:marked-kink>]

This function has zero mean, changes sign on translation by $T \/ 2$,
  and tends to $D_e \( v - w_e \)$ on compact sets as $T arrow.r oo$.
  Call the resulting Wick current $cal(C)_(sigma \, T)^L$. With the zero-mean source

$ A_sigma \( x \) = sum_(w in W_sigma) a_T \( x - w \) \, wide A = \( A_1 \, A_2 \)^t \, $

define the normalized regulator

#[#set math.equation(numbering: n => "(13.2)")
 $ frak(C)_T^L =
   frac(bb(E) #h(-0.16667em)
   [e^(i integral_T \( D A \) dot.op chi) e^(- 2 pi sum_sigma n_sigma ell_sigma \/ T) cal(C)_(1 \, T)^L
   cal(C)_(2 \, T)^L], bb(E) e^(i integral_T \( D A \) dot.op chi)) . $ <j:marked-regulator>]

The source denominator is a nonzero Gaussian exponential.

#thm([Proposition 13.1.])[
  (Fixed-list marked regulator).  #emph[For every $T > 8 r$ and fixed finite initial lists and endpoint coordinate
    as above, the Wick expansion in species $sigma$ terminates after order $n_sigma$ and extends to coalescing own
    lists in the same neighborhood. As $T arrow.r oo$ with generic initial data fixed,
#[#set math.equation(numbering: n => "(13.3)")
 $ frak(C)_T^L arrow.r
   frac(N \( X \)^2 H^(upright("flip")) \( X \), c U^2 P_0 \( W_1 \, W_2 \) product_(a in A' union B') F_0 \( U \,
   x_a \)^2) . $ <j:marked-regulator-limit>]

 This statement is initially at values where the displayed denominator is nonzero.]
] <j:marked-regulated-limit>

#proof[
  The current poles inside the contour are the simple poles at its own sites.
    If two residues in one species select the same site, their first Wick fields coincide and their Pfaffian
    vanishes. The kink is analytic on these contours. The same fixed-contour argument as in Proposition 12
    therefore proves termination and continuation to coalescing lists.
    In particular this is a finite residue calculation at each fixed pair of lists.
  Here is the changed one-site contraction. Put $frak(a)_rho \( v \) = log V_(rho \, -) \( v + i \/ 2 \)$,
    using the odd branch zero at $v = 0$. These logs have step limits.
    At $k > 0$, their transforms in units $2 pi \/ k$ are
  $ frac(t^(1 \/ 2) \( 1 - t \) \( 1 + t^6 \), 1 - t^8) \, wide - frac(2 t^(7 \/ 2) \( 1 - t \), 1 - t^8) \, wide
    t = e^(- k) \, $
  for $rho = d \, c$. Differentiate the factors and use the hyperbolic transform from Section 4:
    the exponents in $\( 0 \, 8 \)$ are $1.5 \, 7.5$ versus $.5 \, 6.5$ for the first log, and $3.5 \,
    3.5$ versus $4.5 \, 4.5$ for the second. Integrating the transforms symmetrically fixes their odd primitives.
    The resulting column of transforms is $\( I + g E \) \( hat(a) \, 0 \)^t$.
  At centered argument, the own-site $U$ translate contributes $- delta a$ to the logarithm.
    The normalized Gaussian source contributes $- delta G_(sigma sigma') D a$ per site of species $sigma'$.
    Their sum is exactly $- delta frak(a)_rho$. The other pair and constant-mode contractions are those already
    proved; in particular the difference charge is neutral, so the singular difference-channel covariance acts
    only on tests vanishing at zero frequency. Symmetric Fourier sums for the step primitive converge after
    differentiation and integration from zero. At fixed lists the winding slopes and the compensation in (13.2)
    disappear in the large-period Gaussian sum. The local residue is $sqrt(c)$;
    multiplying it by $V_(c \, delta) \( 0 \) = p_0 \/ 4$ recovers the earlier matched residue.
    The finite residue terms are consequently exactly those in (12.2) after its all-zero normalization.
    Their convergence is locally uniform at the fixed generic initial data, proving (13.3). ◻
]

=== 13.2 The changed gas data <the-changed-gas-data>

Write

$ g_(+) = g_d + g_c \, wide l \( k \) = frac(k E \( k \), 1 + g_(+) \( k \) E \( k \)) \, wide L_(*) :=
  l \( 0 \) = 8 / 9 . $

Let $y_T = partial^(- 1) d_T$ have zero mean. Define $J_T^(upright("loc"))$ by applying the Fourier multiplier
  $\( l \( k \) - L_(*) \) \/ k^2$ to $d'_T$, using its regular value at zero.
  This is a periodized difference of translates to $w_e$ and $w_e +
  T \/ 2$ of a fixed exponentially decaying function. It is analytic at position heights of absolute value less
  than $5 \/ 2$ relative to either center. These facts follow by multiplying $hat(D'_e)$ by the displayed symbol:
  the symbol is regular at zero and meromorphic with polynomial growth on a narrow strip about the real frequency axis.

Use the six complete particle lists (5.14), the fused union list (5.32), and the state gas (5.39),
  now at the fixed post-collision displacement $d = 1 \/ 8$.
  The residual pair factors, local activities, state space,
  and charge jumps are those of that gas at this displacement. Its changes are the following.

+ In each $H$ dress of species $sigma$, replace $B_T \( v \)^m$ by $product_(w in W_sigma) B_T \( v - w \)$.
  These products use only that species’ unmarked list.
+ In the integral square of (5.37), replace $theta$ by $d_T \( x \)$;
  in the local Berry phase of a particle at $x_j$, replace it by $d_T \( x_j \)$.
+ For an $H$ entry at height $a'$ and center $x$, with signed power $r$, add to its dress logarithm
  #[#set math.equation(numbering: n => "(13.4)")
   $ r
     [J_T^(upright("loc")) \( x + i a' \) - L_(*) #scale(x: 120%, y: 120%)[\(] y_T \( x + i a' \) - y_T \( x \) -
     i a' d_T \( x \) #scale(x: 120%, y: 120%)[\)]] . $ <j:marked-local-dress>]

The last logarithms are bounded and exponentially localized near the two kinks, for $\| Im w_e \| lt.eq
  0.6$ and the listed heights. They are evaluated on every $H$ entry,
  preserving the listed internal order and the analytic fused union value.
  In particular the fused particle’s kink multiplier is generally not one.

For later boundary evaluation, the site part of item 1 must first be simplified by (5.33).
  For a particle in species $sigma$ it is

#[#set math.equation(numbering: n => "(13.5)")
 $ P & product_(w in W_sigma) B_T \( x - w \)\
M \, med F_(upright("pair")) & 1\
O_(+) & product_(w in W_sigma) B_T \( x - w - i \)\
O_(-) & product_(w in W_sigma) B_T \( x - w + i \)\
U & product_(w in W_sigma) B_T \( x - w + i \( 3 \/ 2 + d \) \)^(- 1)\
L & product_(w in W_sigma) B_T \( x - w - i \( 3 \/ 2 + d \) \)^(- 1) . $ <j:marked-site-factors>]

The value one in the $F_(upright("pair"))$ row concerns only these site products, not item 3.
  Denote the resulting gas by $Z_T^L$.

#thm([Proposition 13.2.])[
  (Exact marked gas).  #emph[Fix a sufficiently small negative pre-collision displacement $d_(-)$ in the stability
    range, with $\| d_(-) \| < 1 \/ 8$, and use post-collision displacement $d = 1 \/ 8$.
    For all sufficiently large integer periods $T$, chosen independently of the finite site counts,
    and for every pair of finite initial real lists and real endpoint coordinate in the fixed neighborhood above,
    the gas $Z_T^L$ converges absolutely and
#[#set math.equation(numbering: n => "(13.6)")
 $ frak(C)_T^L & =
   c \( T \) Z_T^L exp
   (1 / 2 integral_T A^t D \( I + g E \) A - i integral_T A^t D upright(bold(1)) thin d_T + R_T^d) \,\
R_T^d & = - frac(\| upright(bold(1)) \|^2, 4 pi) integral_T d_T \( l - L_(*) \) d_T \, wide
  upright(bold(1)) = \( 1 \, 1 \)^t . $ <c7:eq-M>]

 Here $c \( T \)$ is exactly the scalar in (5.40). The identity includes coalescing own lists by continuity.
   The absolute convergence bounds may depend on the fixed lists, $T$, and the fixed displacements.
   The same identity holds along $T = b n$ for a sufficiently large fixed integer block length $b$ and positive
   integers $n$. No estimate uniform as a displacement tends to zero is asserted.]
] <j:marked-gas-identity>

#proof[
  We first compute each conditional current coefficient. Its loop source is $sans(A) = A -
    i \( chi + upright(bold(1)) d_T \)$. Oscillator curvature gives $D$ as before,
    and the normalized source cancels the $A \, chi$ cross term:
  $ & 1 / 2 integral_T \( A - i \( chi + upright(bold(1)) d_T \) \)^t
    D \( A - i \( chi + upright(bold(1)) d_T \) \) + i integral_T A^t D chi\
 & wide = 1 / 2 integral_T A^t D A - i integral_T A^t D upright(bold(1)) thin d_T - 1 /
   2 integral_T \( chi + upright(bold(1)) d_T \)^t D \( chi + upright(bold(1)) d_T \) . $
  Completing this Gaussian shifts its mean by $- g_(+) E \( 1 + g_(+) E \)^(- 1) upright(bold(1))
    d_T$ and retains the centered covariance $tilde(G)$ in (5.12).
    Including the source denominator, its scalar logarithm is
  $ 1 / 2 integral_T A^t D \( I + g E \) A - i integral_T A^t D upright(bold(1)) thin d_T -
    frac(\| upright(bold(1)) \|^2, 4 pi) integral_T d_T l thin d_T . $
  The induced common extra $H$ logarithm is
  $ frac(i E, 1 + g_(+) E) d_T = - L_(*) y_T + J_T^(upright("loc")) . $
  The deterministic $H$ dress also has the constant $exp \( 2 pi n_sigma \/ T \)$.
    Its total exponent in species $sigma$ is $2 pi n_sigma ell_sigma \/ T$,
    because the total $H$ charge equals $ell_sigma$ by (5.15). The winding compensation cancels it exactly.
  At the post-collision endpoint, the following state rearrangement identifies the gas defined above.
    The common component of $p$ is periodic and has jumps $- upright(bold(1)) dot.op q_j$.
    Integration by parts therefore gives
  $ sum_j \( upright(bold(1)) dot.op q_j \) y_T \( x_j \) =
    integral_T \( upright(bold(1)) dot.op p \( x \) \) d_T \( x \) thin d x . $
  Splitting $- L_(*) y_T \( x + i a' \)$ into its value at $x$, its part linear in $a'$,
    and its remainder now completes the varying-angle state square and the Berry phase.
    The scalar part used to complete that square is the $L_(*)$ term removed from the last integral.
    The remainder is exactly (13.4) and the scalar left is $R_T^d$.
    Applying the regular multiplier $\( l - L_(*) \) \/ k^2$ to $d'_T$ shows that $R_T^d$ has a finite limit as $T
    arrow.r oo$.
  We next justify summing the conditional calculation. On the first contours the displacement is the fixed
    $d_(-) < 0$, there is no fused particle, and all $H$ heights have absolute value at most $3 \/ 2 - \|
    d_(-) \|$. The conditional angular trace and oscillator calculation uses its strict strip order.
    Absolute Gaussian integration uses the symmetrized pre-collision estimate of Section 6.
    At each fixed list and period, the extra deterministic factors cost at most a constant per particle;
    the quadratic count confinement sums every particle number.
    This constant may depend on the finite list, whereas the supported period threshold comes from the fixed
    contours and stability and is independent of the site count.
  After that integration, deform the Wick-integrated meromorphic terms,
    retaining both the full heat sum and the unsplit analytic extra $H$ logarithm $- L_(*) y_T \( v \) +
    J_T^(upright("loc")) \( v \)$. The state rearrangement above is applied at the endpoint of this move.
    For the move to $d = 1 \/ 8$, the extreme $H$ height differences are at most $3 + 2 d = 13 \/ 4 < 4$,
    the mixed $D$–external differences are at most $5 \/ 2 + d = 21 \/ 8 < 3$,
    and the other outer differences stay below $2$. The divisor checks of Section 5 therefore leave exactly the
    same simple $U \, L$ fusion residue. The kink dress is analytic through it and evaluates on the fused union
    list. There is no assertion about the raw Gaussian field on these post-collision contours.
  Proposition 37 supplies the post-collision absolute bound at this displacement.
    A bounded varying angle changes the logarithmic modulus, relative to angle zero,
    by at most linear costs in the local counts and common charge, plus $O \( T \)$.
    The quadratic count and charge terms absorb these costs, as well as the bounded local dress logarithms.
    For the initial real lists the simplified site factors have modulus at most one;
    for fixed continued lists they will instead have locally bounded per-particle costs.
    The absolute estimates at the two endpoints of the deformation and the fusion factorial identity permit
    summing the finite-term identities. Fixed-count domination also passes to coalescing own lists.
    This closes the proof of (13.6). ◻
]

We will also use the following precise variant. Omit $d_T$, put $z = e^(i theta)$ in the currents,
  and use the constant real angle $theta$ in the gas. Equation (13.6) then holds with the two $d_T$ terms absent,
  at every supported period and every finite pair of initial real lists in $\| w \| < r \/ 8$,
  including coalescing lists by continuity, with bounds for fixed lists and $theta$ in a fixed compact set.
  Bounded functions of the winding may be inserted and carried to functions of the total species charges.
  In Section 15, the homogeneous lists $\( 0 \, m_(*) \)$ in this variant are taken to $m_(*) arrow.r
  oo$ at one fixed supported $T$; their post-collision site factors have modulus at most one,
  which supplies the needed domination in that distinct auxiliary limit.

=== 13.3 Continuation and the fixed-list period limit <continuation-and-the-fixed-list-period-limit>

At each fixed supported period, continue the finite lists through generic coordinates whose imaginary parts,
  including the endpoint coordinate, have total spread less than one.
  We use $\| Im w_e \| lt.eq 0.6$ and $\| Im w_(sigma \, a) \| lt.eq 1$.
  For the final application, take $w_e = - i f$ and $w_(sigma \, a) = i h_(sigma \, a)$, where $0 lt.eq f lt.eq
  0.6$ and the $h_(sigma \, a)$ lie in the single neighborhood of $- f \, 1 - f$ supplied by Proposition 38,
  still with total spread strictly less than one.

This continuation acts first on the finite residue expression for (13.2).
  Its Gaussian source-to-defect contractions use the rapidly converging high-frequency symbol $hat(G) D hat(a)$;
  its low frequencies in the period limit use the same odd step primitive.
  Defect-to-defect contractions remain in their analytic strips,
  and Wick poles between generic sites are avoided at spread less than one.
  The $U$ factors are meromorphic by their defining products.
  Thus the finite meromorphic identity continues from the initial real set.
  For each fixed pair of counts, its finite residue expression converges locally uniformly as $T arrow.r
  oo$ on compact subsets of the specified generic domain of spread less than one that avoid its poles.
  Indeed such a compact set has a common high-frequency decay margin and uniform convergence of the symmetric
  low-frequency sums, and there are only finitely many residue terms.
  Holomorphic uniqueness therefore identifies this limit with the continued right side of (13.3).

On the gas side, continue the already contracted Fourier scalars,
  not an uncontracted translate of $a_T$ outside its strip.
  The contracted scalars need only the stated site differences or the wider kink strip,
  so their period limits converge. Use the simplified site factors (13.5) before evaluating any boundary value.
  They have no poles for $\| Im w_(sigma \, a) \| lt.eq 1$ on the post-collision real centers:
  the inverse factors may equivalently be shifted by $3 i$ using (5.33).
  At fixed period and fixed lists these factors are locally bounded per particle.
  The stability bound therefore gives locally absolute summability along the continuation.
  This proves both (13.6) and (13.3) for the generic continued lists just specified.
  It asserts no bound uniform in the list sizes from this continuation alone.

=== 13.4 The growing scalar normalizer <the-growing-scalar-normalizer>

The exact orbital ratio in Lemma 31 now supplies the power of $M$ needed after scalar cancellation.

#thm([Lemma 13.3.])[
  (Uniform shifted normalizer bound).  #emph[For every $epsilon > 0$, for all sufficiently large even $M$,
    uniformly over real $h_j$ of spread at most one,
#[#set math.equation(numbering: n => "(13.7)")
 $ frac(N \( X \), cal(S) \( X \)) gt.eq (2 / 3)^(M \/ 2) M^(5 \/ 48 - epsilon) \, wide x_j =
   e^(i eta h_j) . $ <c7:eq-P>]

]
] <j:shifted-normalizer-bound>

#proof[
  Write $M = 2 L$ and use the law in (12.3). Under the orbital tilt put $Q =
    cal(U) D_h cal(U)^(*)$ and use brackets for expectation. If $i^(-)$ is the position of $- k_i$,
    the conjugation identity used in Lemma 22 gives
  $ 0 lt.eq partial_(k_i) log I_h = chevron.l Q_(i i) - Q_(i^(-) \, i^(-)) chevron.r lt.eq min {1 \, k_i / 2 \,
    frac(1 \/ 4, sum_(j gt.eq i) \( k_i + k_j \)^(- 1))} . $
  For clarity, that identity is $chevron.l Q_(a a) - Q_(b b) chevron.r = \( \( D_k \)_(a a) - \( D_k \)_(b b) \)
    chevron.l \| Q_(a b) \|^2 chevron.r$. It orders the mean diagonal entries by their test values.
    The direct comparison of $i \, i^(-)$ and $parallel Q parallel lt.eq 1 \/ 2$ give the first two upper bounds.
    For $j gt.eq i$, the comparison with $j^(-)$ has numerator at least $chevron.l Q_(i i) -
    Q_(i^(-) \, i^(-)) chevron.r$. Sum over those $j$ and use $sum_b chevron.l \| Q_(i b) \|^2 chevron.r lt.eq
    1 \/ 4$ to get the last bound.
  The first upper bound makes this orbital law stochastically smaller than the pure law with weight
    $\( k \/ sinh 3 k \) e^k$, by the association argument in Section 10.
    Its polynomial tail argument, applied to the first $j$ points and then summed over $j$, shows that for $m_0 =
    floor.l L^(1 - epsilon.alt) floor.r$, with fixed $0 < epsilon.alt < 1$, the event
  $ cal(E)_L = { k_j lt.eq C max \( j \, m_0 \) upright(" for every ") j } $
  has probability $1 - O \( e^(- c m_0) \)$, uniformly in $h$.
    On this event the last derivative bound is $O \( \( epsilon.alt log L \)^(- 1) \)$ for $i lt.eq m_0$.
  Fix $0 < beta < 3$. Conditional on $cal(E)_L$ and the later points,
    the first $m_0$ points are stochastically smaller than the pure law of size $m_0$ with weight
  $ W_beta \( k \) = frac(k, sinh \( beta k \)) exp \( min \( k^2 \, 1 \) \) $
  when $L$ is large. Indeed, for $k < 1$ its logarithmic derivative majorizes $\( log \( k \/ sinh 3 k \) \)' +
    k \/ 2$. For $k gt.eq 1$ it exceeds $\( log \( k \/ sinh 3 k \) \)'$ by a fixed positive margin,
    which absorbs the displayed $o \( 1 \)$ orbital derivative.
    The later Vandermonde factors and the cutoff defining $cal(E)_L$ decrease the relative density further.
    Association of the pure law therefore proves the conditional stochastic comparison.
  The function $phi.alt$ in (12.3) is nonnegative and decreasing.
    Restrict to $cal(E)_L$, discard the later terms, and apply the conditional comparison to its decreasing
    product exponential. The resulting lower bound is $bb(P) \( cal(E)_L \)$ times the pure $W_beta$ expectation.
    Lemma 19, rescaled by $u = beta k \/ pi$, evaluates the latter:
  $ log bb(E)_(W_beta) exp (sum_(a = 1)^(m_0) phi.alt \( k_a \)) = beta /
    pi^2 log m_0 integral_0^oo phi.alt \( k \) thin d k + o \( log m_0 \) . $
  To see the applicability to $W_beta$, take the difference of that lemma for the two even continuous tests
    $min \( k^2 \, 1 \) - 1 + phi.alt \( k \)$ and $min \( k^2 \, 1 \) - 1$, after rescaling.
    Both decay exponentially, and the difference removes the tilt.
    The integral is $5 pi^2 \/ 144$ as evaluated in Section 8.
    First let $L arrow.r oo$ with $beta \, epsilon.alt$ fixed,
    then let $beta arrow.t 3$ and $epsilon.alt arrow.b 0$. The comparisons were uniform in $h$,
    so (12.3) gives (13.7). ◻
]

=== 13.5 Cancellation and the interface for propagation <cancellation-and-the-interface-for-propagation>

We finish the scalar calculation at the fixed continued lists.
  For an unmarked pair, denote its factors in $P_0 \/ cal(S) \( X_(upright("un")) \)^2$ by $S_d \,
  S_c$ for the same and opposite species, where $X_(upright("un")) = \( e^(eta W_1) \, e^(eta W_2) \)$.
  Here $cal(S)$ is the site prefactor of Lemma 31. Writing $u \,
  v$ for the site exponential variables and $C$ for its comparison kernel at their log difference gives

$ S_d = frac(\( v - u \)^2 \( v^2 + u^2 \), \( v^2 - sqrt(2) u v + u^2 \) \( v^2 + sqrt(2) u v + u^2 \) C^2) \,
  wide S_c = frac(\( v - u \)^2 \( v + u \)^2, \( v^2 + sqrt(2) u v + u^2 \)^2 C^2) . $

Each unmarked site versus one endpoint similarly gives, using $F_0$,

$ S_e = frac(\( v - u \)^2, \( v^2 + sqrt(2) u v + u^2 \) C^2) . $

The distinct-site quadratic contractions in (13.6) converge to $- log S_d$ and $- log S_c$.
  Their self exponentials are $S_d \( 0 \)^(- 1 \/ 2) = 2 \/ 3$ per unmarked site.
  The contraction $- i integral_T A^t D upright(bold(1)) thin d_T$ converges to $- 2 log S_e$ per unmarked site.

Here are the transform checks for these cancellations. In units $2 pi \/ k$, the transforms of $log S_rho$ are

$ - [frac(P_rho, sinh 4 k) - frac(cosh 3 k - 1, sinh 3 k)] \, $

where

$ P_d & = cosh 4 k + cosh 2 k - cosh 3 k - cosh k \,\
P_c & = cosh 4 k + 1 - 2 cosh k \,\
P_e & = cosh 4 k - cosh k . $

For $d \, c$ these full transforms equal $hat(lambda)_0 \( k \) hat(frak(a))_rho \( k \)$.
  Their negatives use $hat(lambda)_0 \( - k \)$ instead, exactly as in the quadratic $A$ contraction.
  For $e$ the bracket is $tanh \( 3 k \/ 2 \) sinh k \/ sinh 4 k$, and

$ - 2 accent(log S_e, ̂) \( k \) = hat(lambda)_0 \( k \) frac(hat(D'_e) \( k \), k) . $

The kink dipole inserts the additional factor $1 - e^(- i k T \/ 2)$;
  its second term averages to zero in the periodic Riemann sum by regularity at zero and high-frequency decay.
  These identities first hold for decaying logs on the real difference line,
  then continue to the stated fixed-list domain.

Insert $cal(S) \( X \)^2$ into (13.3) and use (13.6). All distinct unmarked pairs and unmarked-to-endpoint pairs
  cancel by the preceding identities. The $M - 2$ self factors $2 \/
  3$ cancel $\( 2 \/ 3 \)^(- M)$ from the reciprocal square of (13.7), up to a constant.
  The reciprocal squared Schur factor of the two endpoints, multiplied by $c U^2$, is bounded at $U =
  V$ by its nonzero confluent value. The limit of $R_T^d$ is bounded for $\| Im w_e \| lt.eq 0.6$.

Consequently, fix any supported integer block length $b$.
  For every fixed pair of generic imaginary lists in the common neighborhood above,
  with total spread less than one including $w_e = - i f$, the limit below exists along $T = 4 N b$.
  For every $epsilon > 0$ and all sufficiently large even $M$,

#[#set math.equation(numbering: n => "(13.8)")
 $ \| H^(upright("flip")) \( X \) \| lt.eq C_epsilon M^(- 5 \/ 24 + epsilon)
   lr(|lim_(N arrow.r oo) c \( 4 N b \) Z_(4 N b)^L|) . $ <c7:eq-Z>]

The constant and threshold are uniform in $0 lt.eq f lt.eq 0.6$, the list orders, and their finite counts.
  Existence of the limit comes from the finite-list regulator limit and the convergence of the contracted scalars,
  with the lists held fixed; the uniform prefactor comes from (13.7) and the exact cancellations.
  No uniform operator estimate is being inferred from this scalar argument.

Sections 14 and 15 now estimate the right side uniformly for lists with the proportions in Theorem 29.
  Once that bound is available, approach the physical spread-one heights separately for each fixed pair of lists.
  Proposition 28 supplies the regular limit of $H^(upright("flip"))$ and its identification with
  $H^(upright("poly"))$ there; no period limit at the boundary is needed.

== 14 Shifted lists and the fixed contour displacement <c7:shifted>

The marked-bond representation uses post-collision displacement $d = 1 \/ 8$.
  Its translated site lists also approach two imaginary heights whose separation is one.
  We first prove the stability estimate at that displacement,
  then prove uniform suppression for lists near the two physical heights with the required proportions.

#thm([Proposition 14.1.])[
  (Stability at displacement $1 \/ 8$).  #emph[For the post-collision gas at $d = 1 \/ 8$,
    the conclusion of Theorem 15 holds, with constants uniform in $T$ and in $theta$ in a fixed compact subset of
    $bb(C)$.]
] <j:stability-eighth>

#proof[
  We establish the same matrix conclusions as Lemma 16 for this particular displacement.
    Keep its normalized coordinate $F = F_(upright("pair")) \/ 2$, even direction $R_d = \( U + L \) \/ 2$,
    and odd directions $O_(upright("odd")) = \( O_(+) - O_(-) \) \/ 2$, $W_d = \( U - L \) \/ 2$. In this proof put
  $ Delta = k \/ 8 \, wide c_Delta = cosh Delta \, wide s_Delta = sinh Delta \, wide u = e^(- k \/ 2) \, quad z =
    e^(- k \/ 4) \, quad h = sans(h)_sigma \( k \) . $
  The core $A_sigma$, and $M_0 \, f \, g \, l \, j_0 \, X \, V \, lambda$, are those of (6.5).
  ===== 14.1 Schur complements from the height lists. <schur-complements-from-the-height-lists.>
  Define $j_c = cosh \( k \/ 2 \) \/ \( 2 cosh k \)$, and let $M^(s o)$ denote the short-plus-outer part of the
    normalized matrix. Summing those kernels on the signed measures gives
  $ M_(R_d \, \( P \, M \, F \))^(s o) & = c_Delta M_(0 \, F \, \( P \, M \, F \)) +
    s_Delta (j_c \, j_c \, - 3 / 4 + frac(1, 4 cosh k)) \,\
M_(R_d R_d)^(s o) & = f c_Delta^2 + g / 2 + (- 1 / 2 + frac(1, 2 cosh k)) s_Delta c_Delta . $
  For example $p \( d \) = f c_Delta - s_Delta \/ 2$ and $o \( 1 \/ 2 + d \) = j_0 c_Delta - j_c s_Delta$;
    applying these identities to the two half-weight heights of $R_d$ gives the displayed row and square. For
  $ N_Delta = frac(R_d - c_Delta F, s_Delta) \, $
  the field cross row and square are therefore
  $ M_(N_Delta \, \( P \, M \, F \))^(s o) = (j_c \, j_c \, - 3 / 4 + frac(1, 4 cosh k)) \, wide
    M_(N_Delta N_Delta)^(s o) = coth Delta - g \/ 2 . $
  The even $H$-moment of $N_Delta$ is
  $ Y = - sinh \( 3 k \/ 2 \) \, $
  and $V_(N_Delta) = - 1$, since $V_(R_d) = e^(- Delta) = c_Delta - s_Delta$.
    The continued entries (6.6) give a contribution $2$ to the $N_Delta \,
    F$ cross in the minus channel and zero to its square:
  $ frac(2 sinh \( 2 Delta \) - 4 c_Delta sinh Delta, s_Delta^2) = 0 . $
  Thus the cross column of $N_Delta$ with the positive core is exactly
  $ d_1 = (j_c \, j_c \, - 3 / 4 + frac(1, 4 cosh k) + 2 upright(bold(1))_({ sigma = - }))^t - h X Y +
    sigma lambda V . $
  Its diagonal before the Schur subtraction is $coth Delta - g \/ 2 - h Y^2 - sigma lambda$.
    The even second Schur complement is consequently
  #[#set math.equation(numbering: n => "(14.1)")
   $ coth Delta - a \, wide a = g \/ 2 + h Y^2 + sigma lambda + d_1^t A_sigma^(- 1) d_1 . $ <j:eighth-even-schur>]
  The odd list gives the first diagonal
  $ G = g + h sinh^2 k > 0 $
  and cross $c_Delta r_0 + s_Delta r_1$, where
  $ r_0 = j_0 + h sinh k sinh \( 3 k \/ 2 \) \, wide r_1 = - j_c + h sinh k cosh \( 3 k \/ 2 \) . $
  Its field square is
  $ g \/ 2 - f s_Delta^2 + (1 / 2 - frac(1, 2 cosh k)) s_Delta c_Delta . $
  The uncontinued height square uses $h sinh^2 \( 3 k \/ 2 + Delta \)$,
    and its continued correction in the minus channel is $- 4 s_Delta c_Delta$.
    Subtracting the cross square divided by $G$, and then dividing by $c_Delta^2$, gives
  #[#set math.equation(numbering: n => "(14.2)")
   $ o_0 + b_1 tanh Delta + b_2 tanh^2 Delta \, $ <j:eighth-odd-schur>]
  where
  $ o_0 & = g \/ 2 + h sinh^2 \( 3 k \/ 2 \) - r_0^2 \/ G \,\
b_2 & = - f - g \/ 2 + h cosh^2 \( 3 k \/ 2 \) - r_1^2 \/ G \,\
b_1 & = 1 / 2 - frac(1, 2 cosh k) - 4 upright(bold(1))_({ sigma = - }) +
  2 h sinh \( 3 k \/ 2 \) cosh \( 3 k \/ 2 \) - 2 r_0 r_1 \/ G . $
  Here $o_0 > 0$ is the odd Schur complement at zero displacement,
    whose $min \( k \, 1 \)$ gap follows from the odd Green form in Section 6.
    These derivations attach both complements to the physical signed lists.
  ===== 14.2 Exact signs and endpoint gaps. <exact-signs-and-endpoint-gaps.>
  Substituting the rational core formulas into (14.1) and clearing denominators gives
  $ a - 1 = frac(u^2 sans(P)_sigma \( u \), \( 1 - u^2 \) sans(Q)_sigma \( u \)) . $
  The ascending coefficients are
  $ sans(P)_(+) & 45 \, 12 \, - 13 \, 0 \, 5 \, - 12 \, 29 \, 0 \, 105 \, - 12 \, - 19 \, 0 \, - 37 \, 12 \, 35 \,
    0 \, 42\
sans(Q)_(+) & 3 \, 36 \, - 44 \, 60 \, - 68 \, 84 \, - 92 \, 108 \, - 78 \, 108 \, - 92 \, 84 \, - 68 \, 60 \, -
  44 \, 36 \, 3\
sans(P)_(-) & 19 \, - 12 \, - 63 \, 96 \, 31 \, 12 \, 3 \, 48 \, - 177 \, 108 \, 15 \, 0 \, 49 \, 84 \, - 147 \,
  48 \, 14\
sans(Q)_(-) & 1 \, 12 \, - 40 \, 36 \, 4 \, 12 \, - 16 \, 36 \, - 58 \, 36 \, - 16 \, 12 \, 4 \, 36 \, - 40 \,
  12 \, 1 . $
  Since $u = z^2$ and $tanh Delta = \( 1 - z \) \/ \( 1 + z \)$, define
  $ sans(E)_sigma \( z \) = 2 \( 1 + z + z^2 + z^3 \) sans(Q)_sigma \( z^2 \) - z^3 sans(P)_sigma \( z^2 \) . $
  The sign needed in (14.1) is exactly
  $ coth Delta - a = frac(z sans(E)_sigma \( z \), \( 1 - z^4 \) sans(Q)_sigma \( z^2 \)) . $
  For the odd complement, substitution into (14.2) gives
  $ frac(o_0 + b_1 tanh Delta + b_2 tanh^2 Delta, o_0) =
    frac(4 z thin sans(T)_sigma \( z \), \( 1 + z \)^4 \( z^2 + 1 \)^2 sans(D)_sigma \( z^4 \)) . $
  The ascending first twelve coefficients of the reciprocal degree-$22$ polynomials $sans(T)_(+) \,
    sans(T)_(-)$ are respectively
  $ \( 4 \, 6 \, 8 \, 8 \, 16 \, 18 \, 20 \, 20 \, 30 \, 33 \, 36 \, 33 \) \,
    wide \( 4 \, 14 \, 24 \, 24 \, 8 \, - 18 \, - 44 \, - 52 \, - 26 \, 13 \, 52 \, 73 \) \, $
  and the coefficients of $sans(D)_(+) \, sans(D)_(-)$ are
  $ \( 2 \, 4 \, 7 \, 4 \, 2 \) \, wide \( 10 \, - 16 \, 23 \, - 16 \, 10 \) . $
  The first denominator is positive by its coefficients, and
  $ sans(D)_(-) \( y \) = \( 1 - y \)^2 \( 10 + 4 y + 10 y^2 \) + 11 y^2 > 0 quad \( 0 lt.eq y lt.eq 1 \) . $
  For each of the polynomials $sans(Q)_sigma \( z^2 \) \, sans(E)_sigma \( z \) \, sans(T)_sigma \( z \)$,
    write its ascending coefficients as $p_i$ and its degree as $s$.
    The coefficient of $r^j$ in $\( 1 + r \)^s p \( 1 \/ \( 1 + r \) \)$ is
  $ sum_(i = 0)^(s - j) binom(s - i, j) p_i . $
  Direct binomial expansion gives the following minimum coefficient in each case:
  $ & s & sigma = + & sigma = -\
sans(Q)_sigma \( z^2 \) & 32 & 3 & 1\
sans(E)_sigma \( z \) & 35 & 6 & 2\
sans(T)_sigma \( z \) & 22 & 4 & 4 . $
  All coefficients are positive. Taking $r = \( 1 - z \) \/ z$ proves positivity for $0 < z lt.eq 1$,
    and the constant coefficients give positivity at $z = 0$. This proves both Schur signs for every $k > 0$.
  The same identities give the following limits as $k arrow.b 0$:
  $ & sigma = + & sigma = -\
k \( coth Delta - a \) & 6 & 4\
k^(- 1) "Schur"_(R_d - c_Delta F) & 3 \/ 32 & 1 \/ 16\
G \/ k & 11 \/ 18 & 3 \/ 2\
k^(- 1) "Schur"_(W_d) & 431 \/ 1408 & 71 \/ 384 . $
  Here the second row restores the factor $s_Delta^2$, and the last row restores $c_Delta^2$ in the odd
    complement. The cross column of $R_d - c_Delta F$ is $s_Delta d_1 = O \( k \)$.
    Its total charge is $cosh Delta - 1 = O \( k^2 \)$; also $q^t A_(+)^(- 1) = O \( k \)$ by the core expansion.
    Completing the square with the core therefore retains a positive part of the common-charge bound.
    In the odd block all entries are $O \( k \)$, so its two positive pivot limits give a $k$-order gap.
  For high frequencies return to the fixed basis $P \, M \, F \, R_d$ and $O_(upright("odd")) \, W_d$.
    The $R_d$ crosses decay to zero and its extra diagonal tends to $1 \/ 2$, as does the extra odd diagonal.
    In the minus channel the growing extreme terms cancel by (6.6);
    their remainders decay because the next height rate is $4$ and $3 + 2 d = 13 \/ 4 < 4$.
    Thus the fixed-basis matrices converge exponentially to positive quotient limits.
    The count null relation and the entrywise nonnegative physical limit are unchanged.
    The construction of $J$ and the Fourier identity (6.7) now apply at $d = 1 \/ 8$, proving the proposition. ◻
]

=== 14.1 Suppression for translated site lists <suppression-for-translated-site-lists>

For one species, a site at imaginary height $h$ contributes to a suppressed particle $tau$ the factor

$ omega_tau \( x \; h \) = B \( x + i \( a_tau - h \) \)^(epsilon.alt_tau) \, wide tau & P & O_(+) & O_(-) & U & L\
a_tau & 0 & - 1 & 1 & 13 \/ 8 & - 13 \/ 8\
epsilon.alt_tau & 1 & 1 & 1 & - 1 & - 1 . $

The $M$ and $F_(upright("pair"))$ site factors are exactly one after the per-site meromorphic cancellations
  supplied by the identities for $B$. These are statements about the $B$-products;
  the additional marked-source dresses are separate.

#thm([Proposition 14.2.])[
  (Uniform suppression near the two physical heights).  #emph[There are constants $0 < delta_0 < 1 \/
    16$ and $c_1 > 0$ with the following property. For every fixed discrepancy bound $0 lt.eq
    C_0 < oo$ there is $n_0 \( C_0 \)$ such that, for integers $n gt.eq n_0 \( C_0 \)$,
    the conclusion below holds uniformly in $f in \[ 0 \, 3 \/ 5 \]$.]
  #emph[Partition a list of $n$ real heights into groups $I_0 \, I_1$ such that
$ \| \| I_0 \| - n \( 1 - f \) #scale(x: 120%, y: 120%)[\|] lt.eq C_0 \, wide \| \| I_1 \| -
  n f #scale(x: 120%, y: 120%)[\|] lt.eq C_0 . $

 Suppose
$ \| h_a + f \| < delta_0 quad \( a in I_0 \) \, wide \| h_a - \( 1 - f \) \| < delta_0 quad \( a in I_1 \) . $

 For every real $x$ and every $tau in { P \, O_(+) \, O_(-) \, U \, L }$,
#[#set math.equation(numbering: n => "(14.3)")
 $ lr(|product_(a = 1)^n omega_tau \( x \; h_a \)|) lt.eq exp #h(-0.16667em) (- c_1 n e^(- kappa_1 \| x \|)) \,
   wide kappa_1 = pi \/ 3 . $ <j:shifted-suppression-bound>]

 The sums of the one-site logarithms chosen to vanish at either infinity are $O \( n e^(- kappa_1 \| x \|) \)$
   there, uniformly in these lists. The proposition applies separately to each species.]
] <j:shifted-suppression>

#proof[
  We first prove strict suppression at the exact heights, with proportions $1 - f \, f$.
    The $U \, L$ factors are the delicate ones. For real $x$, put
  $ C_1 = cosh \( kappa_1 x \) \, wide s_0 = frac(\( sqrt(3) \/ 2 \) C_1, sqrt(C_1^2 - 1 \/ 4)) \, wide R =
    frac(sin \( kappa_1 t \), sqrt(C_1^2 - 1 \/ 4)) . $
  Then
  $ b \( t \) := log \| B \( x + i \( 3 \/ 2 + t \) \) \| = "atanh" frac(2 s_0 R, 1 + R^2) . $
  Unless both terms already have the favorable sign, the required comparison for $U$ is
  $ \( 1 - f \) b \( f + 1 \/ 8 \) > f b \( 7 \/ 8 - f \) \, wide 0 lt.eq f lt.eq 7 \/ 8 . $
  The $L$ comparison is the same after using $1 - f$ in place of $f$;
    outside the displayed mixed-sign range both terms are favorable.
  For $0 lt.eq t lt.eq 1$, with limiting values at the endpoints,
  $ 9 / 10 lt.eq frac(b \( t \), 2 s_0 R) lt.eq 1 +
    frac(sin^2 \( kappa_1 t \), 3 \( 3 \/ 4 - sin^2 \( kappa_1 t \) \)) . $
  For the upper bound, $s_0 lt.eq 1$ reduces the ratio to at most $"atanh" \( R \) \/ R$.
    Its positive series is at most $1 + R^2 \/ \( 3 \( 1 - R^2 \) \)$, and $R^2 lt.eq
    sin^2 \( kappa_1 t \) \/ \( 3 \/ 4 \)$ gives the displayed bound.
    For the lower bound, use $s_0^2 gt.eq \( 3 + R^2 \) \/ 4$ and
  $ v coth v gt.eq 1 + v^2 \/ 3 - v^4 \/ 45 . $
  The latter follows by multiplying by $sinh v$ and comparing its power series.
    The desired lower bound is equivalent to $v coth v gt.eq \( 9 \/ 10 \) \( 1 + R^2 \)$ at $v = \( 9 \/ 5 \) s_0
    R$. The polynomial on the right increases with $v^2$ for $0 lt.eq v^2 lt.eq 81 \/ 25$,
    so we may substitute the lower bound for $s_0^2$. The difference then has numerator
  $ 5000 - 4500 y + 6939 y^2 - 4374 y^3 - 729 y^4 \, wide y = R^2 in \[ 0 \, 1 \] \, $
  over $50000$. Under $y = r \/ \( 1 + r \)$, multiplication by $\( 1 + r \)^4$ gives the positive coefficient list
  $ \( 5000 \, 15500 \, 23439 \, 16004 \, 2336 \) . $
  This proves the lower ratio bound.
  Put $t = 7 \/ 8 - f$. Concavity of sine gives
  $ sin \( kappa_1 \( f + 1 \/ 8 \) \) gt.eq \( sqrt(3) \/ 2 \) \( 1 - t \) \, $
  and its Taylor estimate, using $kappa_1 < 21 \/ 20$, gives
  $ sin \( kappa_1 t \) lt.eq p \( t \) := \( 21 \/ 20 \) t - \( 9 \/ 50 \) t^3 < sqrt(3) \/ 2 . $
  The preceding ratio bounds reduce the strict comparison to
  $ 77 / 100 \( 1 \/ 8 + t \) \( 1 - t \) 3 \( 3 \/ 4 - p \( t \)^2 \) - \( 7 \/ 8 - t \)
    p \( t \) \( 9 \/ 4 - 2 p \( t \)^2 \) > 0 \, wide 0 lt.eq t lt.eq 7 \/ 8 . $
  After $t = \( 7 \/ 8 \) r \/ \( 1 + r \)$ and multiplication by $\( 1 + r \)^10$,
    direct binomial expansion gives every coefficient greater than $1 \/ 50$. This proves the $U \, L$ comparison.
    For $O_plus.minus$, the mixed-sign comparison is
  $ \( 1 - f \) b \( f + 1 \/ 2 \) > f b \( 1 \/ 2 - f \) \, wide 0 lt.eq f lt.eq 1 \/ 2 \, $
  or its exchanged version, and follows from monotonicity of $b$ on $\[ 0 \, 1 \]$.
    The $P$ factor is strictly suppressed because both exact heights lie in $\| Im v \| < 3 \/ 2$.
  We make the uniform neighborhood in the proposition explicit.
    By $B \( v + 3 i \) = 1 \/ B \( v \)$, all five one-site factors can also be written
  $ omega_tau \( x \; h \) = B \( x + i \( tilde(a)_tau - h \) \) \,
    wide \( tilde(a)_P \, tilde(a)_(O_(+)) \, tilde(a)_(O_(-)) \, tilde(a)_U \, tilde(a)_L \) = \( 0 \, - 1 \,
    1 \, - 11 \/ 8 \, 11 \/ 8 \) . $
  If a height is within $1 \/ 16$ of either $- f$ or $1 - f$, then every imaginary argument here lies in
  $ \[ - 39 \/ 16 \, thin 163 \/ 80 \] subset \( - 5 \/ 2 \, 5 \/ 2 \) . $
  On this tube the factors have no poles; their only possible singular behavior in the negative logarithm is $+
    oo$ at a zero.
  Define the rescaled energy
  $ Phi_tau \( x \, h \) = - e^(kappa_1 \| x \|) log \| B \( x + i \( tilde(a)_tau - h \) \) \| \, $
  assigning $+ oo$ at zeros. The expansion at either infinity gives the continuous limiting value
  $ Phi_tau \( plus.minus oo \, h \) = 2 sqrt(3) cos \( kappa_1 \( tilde(a)_tau - h \) \) . $
  Let $J_h = \[ - 53 \/ 80 \, 17 \/ 16 \]$, which contains every height in the preliminary tube.
    For each finite $M$, the truncation $Phi_(tau \, M) = min \( Phi_tau \, M \)$ is continuous on the compact
    space $overline(bb(R)) times J_h$, where $overline(bb(R))$ adjoins $x = plus.minus oo$.
    At infinity the rescaled $b \( t \)$ is $2 sqrt(3) sin \( kappa_1 t \)$,
    and the same strict ideal comparisons persist. Thus the ideal comparisons say that
  $ \( 1 - f \) Phi_tau \( x \, - f \) + f Phi_tau \( x \, 1 - f \) > 0 $
  at every $\( x \, f \) in overline(bb(R)) times \[ 0 \, 3 \/ 5 \]$, with the value $0 dot.op \( + oo \) = 0$.
    The truncated expressions increase to this positive expression as $M arrow.r oo$.
    At each point some finite $M$ gives a positive margin; continuity and a finite cover therefore provide one $M$
    and one $a_0 > 0$, common to all five labels, such that
  $ \( 1 - f \) Phi_(tau \, M) \( x \, - f \) + f Phi_(tau \, M) \( x \, 1 - f \) gt.eq a_0 $
  uniformly in $x \, f \, tau$.
  Uniform continuity of these finitely many truncated functions now gives one $0 < delta_0 < 1 \/
    16$ such that changing a height by less than $delta_0$ changes $Phi_(tau \, M)$ by at most $a_0 \/ 4$,
    uniformly in $x$ and the target height. Let $B_0$ bound their absolute values.
    For the perturbed list in the proposition,
  $ sum_(a = 1)^n Phi_tau \( x \, h_a \) & gt.eq sum_(a = 1)^n Phi_(tau \, M) \( x \, h_a \)\
 & gt.eq n a_0 - 1 / 4 n a_0 - 2 C_0 B_0 . $
  For $n gt.eq n_0 \( C_0 \)$ the last expression is at least $n a_0 \/ 2$.
    This proves (14.3) with $c_1 = a_0 \/ 2$, independent of $f$ and $n$.
    The uniform expansion of $B$ on the same tube gives the asserted logarithmic bounds at infinity.
    Applying (14.3) to each image gives the corresponding periodized suppression. ◻
]

== 15 Mixed propagation and unequal intervals <c7:mixed>

Theorem 29 concerns two site lists whose sizes can differ.
  Through (13.8), its proof reduces to estimating the signed horizontal gas.
  Between the two suppression scales only the larger list suppresses its species,
  so the interior operator from Section 7 does not suffice there.
  We first bound the operator for this intermediate region.
  We then extract the two exterior power gaps and use the direction of the common-charge jumps in the innermost
  region. The final subsection transfers the resulting marked-bond estimate to planar polygons.

=== 15.1 The mixed spectral radius <the-mixed-spectral-radius>

Fix the post-collision displacement $d = 1 \/ 8$ and a sufficiently large integer block size $b$,
  using Proposition 37. On any fixed compact set of real angles, choose a common gauge with quadratic slack.
  For a constant real angle $theta$, let $E_theta$ be the homogeneous operator allowing all particle types,
  and let $I_theta$ allow only $M \, F_(upright("pair"))$ in both species.
  Let $X_theta$ allow all types in species 1 and only $M \, F_(upright("pair"))$ in species 2.
  These are the Hilbert–Schmidt operators constructed from the common gauge and Bargmann tail in Section 7.
  The empty-contour power traces give

$ r \( E_theta \) = r_E = e^(- pi b \/ 16) . $

The angles used below are $theta = plus.minus nu$, where $nu = 3 pi \/ 4$.

#thm([Proposition 15.1.])[
  (Mixed spectral bound).  #emph[For every real $theta$,
#[#set math.equation(numbering: n => "(15.1)")
 $ r \( X_theta \) lt.eq r_X^(+) \, wide r_X^(+) = exp #h(-0.16667em)
   [b (- frac(5 pi, 96) + frac(1, 6 sqrt(3)))] . $ <c7:eq-X>]

]
] <c7:mixed-radius>

#proof[
  Use the regulator of Section 13 without $d_T$, with constant angle $theta$,
    and with homogeneous site counts $\( 0 \, m_(*) \)$. Here $m_(*)$ is an auxiliary site count.
    For a block count $N_(*) gt.eq 2$, keep $T = b N_(*)$ fixed until both site-count limits below have been
    taken. The contour geometry gives a common period threshold $T_0$ independent of the finite count $m_(*)$;
    the pre-collision domination constants may depend on $m_(*)$.
    Enlarge $b$ so every such $T$ is at least $T_0$ for both of the fixed displacement choices used below.
    The unequal-list winding compensation is retained. Write
  $ Q_(m_(*) \, T) = m_(*)^2 / 2 integral_T a_T D \( 1 + g_d E \) a_T . $
  The two-species reorganization gives an exact finite-period identity
  #[#set math.equation(numbering: n => "(15.2)")
   $ frak(C)_T^(\( 0 \, m_(*) \)) = c \( T \) e^(Q_(m_(*) \, T)) cal(Z)_(m_(*) \, T)^(\( 2 \)) \,
     $ <c7:two-species-comparison>]
  where $cal(Z)_(m_(*) \, T)^(\( 2 \))$ is the gas at displacement $1 \/ 8$ with these site powers.
    Its source is $\( 0 \, m_(*) a_T \)$, so the quadratic source contraction is exactly the species-2 diagonal
    entry $1 + g_d E$.
  The species-1 contour has no site poles. On a sufficiently small disk,
    all of its positive-order Wick integrands are jointly analytic in their contour variables,
    including at coincidences. Each such contour integral vanishes,
    so this species contributes exactly 1 before the Gaussian average.
    The remaining source and winding compensation depend only on species 2.
    We can therefore evaluate the same regulator from its original one-species marginal.
    Its nonzero Gaussian symbol is $2 pi g_d \/ k$. Its constant mode is uniform modulo $2 pi$:
    the opposite uniform mode remains uniform after addition of the independent common Gaussian.
    Its winding $ell in 8 bb(Z)$ has law $e^(- 4 pi ell^2 \/ T) \/ D_ell$.
  The one-species oscillator calculation uses the marginal before tilting. After tilting, the height symbol is
  $ sans(h)_(*) = frac(g_d E^2, 1 + g_d E) = E #scale(x: 120%, y: 120%)[\(] 1 - \( 1 + g_d E \)^(- 1)
    #scale(x: 120%, y: 120%)[\)] \,\
1 + g_d E = frac(\( 1 + t^3 \)^2 \( 1 + t^6 \), \( 1 - t^4 \) \( 1 - t^8 \)) \, quad t = e^(- k) \,\
sans(h)_(*) / k = 1 / k^2 - 41 / 12 + O \( k^2 \) quad \( k arrow.b 0 \) \, wide sans(h)_(*) = 2 e^(- 3 k) +
  O \( e^(- 4 k) \) quad \( k arrow.r oo \) . $
  Thus the one-species versions of $K^r \, K_0$ use $cal(S) = 1$ and have leading singularity $-
    2 log \( 1 + s^2 \/ 9 \)$. The winding coefficients cancel:
  $ 41 / 12 - 4 + 5 / 4 - 2 / 3 = 0 . $
  These four terms come respectively from the covariance constant, the winding law, the $H$ dress,
    and the modular scalar, in units $pi ell^2 \/ T$. The $ell
    X^(\( 2 \))$ term cancels the quadratic winding dress as before.
    The inserted winding compensation cancels the remaining $2 pi m_(*) ell \/ T$ from the site-dependent $H$ constants.
  The uniform constant mode unfolds the short heat sum. If $sans(X)$ is the charge-coordinate moment of the $H$
    list, its integral is
  $ sqrt(T) integral_(bb(R)) e^(- T alpha^2 \/ \( 4 pi \) - alpha sans(X)) frac(d alpha, 2 pi) =
    e^(pi sans(X)^2 \/ T) . $
  It cancels the covariance factor $e^(- pi sans(X)^2 \/ T)$, including the Poisson factor $sqrt(T)$.
    Hence the one-species gas has no state square or initial-state sum.
    Its total particle charge must equal one $ell in 8 bb(Z)$.
    The leading linear interactions cancel in modulus because $cal(S) = 1$,
    and the remaining real-position Berry factors have modulus one.
    The local and residual rules are otherwise those of Section 5,
    with $sans(h)_(*)$ in place of the two-species height symbol.
    We use a fixed sufficiently small positive post-collision displacement,
    reached from a sufficiently small negative pre-collision displacement by the same contour deformation.
    The resulting gas is denoted $cal(Z)_(m_(*) \, T)^(\( * \))$. The second identity is
  #[#set math.equation(numbering: n => "(15.3)")
   $ frak(C)_T^(\( 0 \, m_(*) \)) & = c_(*) \( T \) e^(Q_(m_(*) \, T)) cal(Z)_(m_(*) \, T)^(\( * \)) \,\
c_(*) \( T \) & =
  frac(D_W, D_ell "tr" Gamma) product_(j gt.eq 1) \[ 1 + g_d \( 2 pi j \/ T \) E \( 2 pi j \/ T \) \]^(- 1) .
  $ <c7:one-species-comparison>]
  In particular, the deterministic exponential in the two identities is the same.
  ===== 15.1.1 Absolute summability in one species. <absolute-summability-in-one-species.>
  We give the stability check needed to pass to the site-count limit in (15.3).
    Use the normalized $F = F_(upright("pair")) \/ 2$, and retain $M_0 \, X \, f \, g \, l \, j_0$ from (6.5).
    The same parity decomposition and the relation $\( O_(+) + O_(-) \) \/ 2 = \( P + M \) \/ 2$ apply.
    Use $sans(h)_(*)$ in the height kernels; the post-collision continuation coefficient is 2,
    and there is no species off-diagonal subtraction. For the even core $cal(A)_(*) = M_0 - sans(h)_(*) X X^t$,
    direct reduction with $u = e^(- k \/ 2)$ gives
  $ 1 - sans(h)_(*) X^t M_0^(- 1) X =
    frac(\( 1 - u^2 \)^2 \( 1 + u^4 \)^2, 3 \( 1 - u^2 + u^4 \) \( 1 - u^4 + u^8 \)) > 0 . $
  The rank-one criterion and $M_0 > 0$ give $cal(A)_(*) > 0$. Its endpoint matrices are
  $ cal(A)_(*) / k arrow.r mat(delim: "(", 4, - 2, - 2; - 2, 2, 3 \/ 2; - 2, 3 \/ 2, 3 \/ 2)
    quad \( k arrow.b 0 \) \, wide cal(A)_(*) arrow.r "diag" \( 1 \, 1 \, 1 \/ 4 \) quad \( k arrow.r oo \) . $
  The first matrix has leading principal minors $4 \, 4 \, 1$.
    Continuity therefore gives $cal(A)_(*) gt.eq c min \( k \, 1 \) I$.
  Here the displaced directions admit exact Schur complements.
    Put $R_d = \( U + L \) \/ 2$, $delta_d = \| d \|$, $Delta = delta_d k$, and
  $ cal(W)_d = frac(R_d - cosh Delta thin F, sinh Delta) . $
  Put $j_c = cosh \( k \/ 2 \) \/ \( 2 cosh k \)$ and $Y = - sinh \( 3 k \/ 2 \)$.
    The cross columns of $cal(W)_d$ against the core, obtained from the height lists, are
  $ upright(bold(d))_(upright("pre")) & = vec(- j_c, - j_c, - 3 \/ 4 - 1 \/ \( 4 cosh k \)) + sans(h)_(*) X Y \,\
upright(bold(d))_(upright("post")) & = vec(j_c, j_c, 1 \/ 4 + 1 \/ \( 4 cosh k \)) - sans(h)_(*) X Y . $
  In both cases its diagonal entry is $coth Delta - g \/ 2 - sans(h)_(*) Y^2$. Direct rational reduction gives
  $ g \/ 2 + sans(h)_(*) Y^2 + upright(bold(d))_(upright("pre"))^t cal(A)_(*)^(- 1)
    upright(bold(d))_(upright("pre")) & = coth \( k \/ 2 \) \,\
g \/ 2 + sans(h)_(*) Y^2 + upright(bold(d))_(upright("post"))^t cal(A)_(*)^(- 1)
  upright(bold(d))_(upright("post")) & = E \( k \) . $
  Thus the Schur complements of $cal(W)_d$ against the core are
  #[#set math.equation(numbering: n => "(15.4)")
   $ S_(e \, cal(W))^(upright("pre")) = coth Delta - coth \( k \/ 2 \) \, wide S_(e \, cal(W))^(upright("post")) =
     coth Delta - E \( k \) . $ <c7:one-species-even-schur>]
  Here “pre” denotes the symmetrized absolute kernel at $d < 0$, and “post” the continued kernel at $d > 0$.
    In these entries the post continuation adds $sinh \( 2 Delta \)$ to the $R_d \,
    R_d$ entry and $sinh Delta$ to the $R_d \, F$ entry. Since
  $ E \( k \) = frac(1 + t^3, \( 1 - t \) \( 1 + t^2 \)) < frac(1 + t, 1 - t) = coth \( k \/ 2 \) \, $
  both Schurs are positive when $0 < delta_d < 1 \/ 2$. We use this algebraic range only at the sufficiently small
    contour displacements fixed above.
  For the odd vectors $\( O_(+) - O_(-) \) \/ 2$ and $\( U - L \) \/ 2$, put $rho_k =
    tanh \( k \/ 2 \)$ and $tau_d = tanh Delta$. The Schur complements against the first odd vector,
    divided by $cosh^2 Delta$, are
  #[#set math.equation(numbering: n => "(15.5)")
   $ frac(S_o^(upright("pre")), cosh^2 Delta) & = frac(\( rho_k - tau_d \) \( rho_k + 3 tau_d \), 4 rho_k) \,\
frac(S_o^(upright("post")), cosh^2 Delta) & = frac(rho_k L_o - J_o \( 2 tau_d + tau_d^2 \/ rho_k \), 4 D_o) \,
  $ <c7:one-species-odd-schur>]
  where
  $ D_o & = 2 t^4 - t^2 + 2 \,\
J_o & = 2 t^4 - 2 t^3 + t^2 - 2 t + 2 \,\
L_o & = 6 t^4 + 2 t^3 - 5 t^2 + 2 t + 6 . $
  The first odd pivot is $g > 0$ pre-collision and $g + sans(h)_(*) sinh^2 k > 0$ post-collision. Also $tau_d < rho_k$,
  $ D_o = 2 \( t^2 - 1 \/ 4 \)^2 + 15 \/ 8 > 0 \, quad J_o = 2 \( 1 - t \)^2 \( t^2 + t + 1 \) + t^2 > 0 \, quad
    L_o - 3 J_o = 8 t \( t^2 - t + 1 \) > 0 . $
  The post expression in (15.5) decreases with $tau_d$; at $tau_d =
    rho_k$ it is $2 rho_k t \( t^2 - t + 1 \) \/ D_o > 0$. This proves both odd signs.
  Restoring the original $R_d$ coordinate multiplies the even Schur in (15.4) by $sinh^2 Delta$.
    For fixed $0 < delta_d < 1 \/ 2$, the limits of the original Schurs divided by $k$ at zero are
  $ & upright("pre") & upright("post")\
S_e \/ k & delta_d \( 1 - 2 delta_d \) & delta_d \( 1 - delta_d \)\
S_o \/ k & \( 1 - 2 delta_d \) \( 1 + 6 delta_d \) \/ 8 & \( 11 - 4 delta_d - 4 delta_d^2 \) \/ 24 . $
  The original cross entries are $O \( k \)$ there. At infinity the added Schurs tend to $1 \/
    2$ and the cross entries tend to zero. For the extreme post height terms the required cancellations are explicitly
  $ - 1 / 2 e^(2 Delta) + sinh \( 2 Delta \) = - 1 / 2 e^(- 2 Delta) \, wide - 1 / 2 e^Delta + sinh Delta = - 1 /
    2 e^(- Delta) \; $
  the remaining high-frequency terms decay because $delta_d < 1 \/ 2$.
    Together with the core bounds, these limits give a lower bound $c_d
    min \( k \, 1 \)$ on the count-respecting quotient for each fixed nonzero $d$ used here.
    Its dependence on $d$ matters: the count functional has value $1 \/ 2$ on normalized $F$ and value 1 on $R_d$,
    so the extra null direction $R_0 - F$ at $d = 0$ is visible to count.
  The physical high-frequency matrix is entrywise nonnegative,
    with the same endpoint coincidences as before and normalized $F \, F$ entry $1 \/ 4$.
    Split off this matrix times $tanh \( e k \)$ with a sufficiently small fixed $e > 0$.
    The remaining positive symbol divided by $k$ is regular at zero;
    there is no common-charge subtraction in one species. The periodized argument of Section 6 therefore controls
    the sum of squared box counts.
  For precision, its pre-collision base product is the one-species counterpart of (6.1).
    Replace every $H$ atom $\( a \, r \)$ by $\( a \, r \/ 2 \) \, \( - a \, r \/ 2 \)$ in both the local rule
    (5.28) and the forward rule (5.36), using the scalar $K_0 \, K^r$ determined by $sans(h)_(*)$.
    This symmetrizes the internal $H$ self-list as well. These local factors are finite on the chosen negative
    contours, since their extreme symmetrized height difference is $3 + 2 d < 3$.
    Keep the short and outer lists at the same negative displacement, take the moduli,
    and multiply all local factors and all forward factors, including nonzero self-images.
    At the real angle used here, the heat modulus replaces $sans(X)$ by $Re sans(X)$.
    The unfolded integral above cancels $e^(- pi \( Re sans(X) \)^2 \/ T)$, including its Poisson normalization.
    The scalar state coefficient $1 - cal(S)$ is zero, so this base product has state factor one and no
    initial-state sum. The matrix bound just proved applies to this product.
    The remaining deterministic pre-collision factors have a finite bound per particle at each fixed
    $\( m_(*) \, T \, d \)$, and their linear count cost is absorbed by the quadratic bound.
    Each configuration fixes at most one permitted winding. This proves absolute summability for the actual
    pre-collision Gaussian moment and the post gas, justifying (15.3).
    On the post contours it also provides domination independent of $m_(*)$ at fixed $T$.
  ===== 15.1.2 The fixed-period site-count limit. <the-fixed-period-site-count-limit.>
  In either gas, the site multipliers have modulus at most one on its chosen post contours.
    At fixed $T$, as $m_(*) arrow.r oo$, all suppressed species-2 types disappear and $M \,
    F_(upright("pair"))$ retain multiplier one. The preceding count bound and the two-species stability bound
    justify dominated convergence. Thus
  $ lim_(m_(*) arrow.r oo) cal(Z)_(m_(*) \, b N_(*))^(\( 2 \)) = det \( I - A_0^(N_(*)) \) "tr" X_theta^(N_(*)) . $
  We next bound the corresponding one-species limit.
  For its remaining types $M \, F_(upright("pair"))$, the negative logarithms of the residual pair magnitudes have
    Fourier symbols, in units $2 pi \/ k$,
  $ M M & \( 1 - t^4 \) \( 1 - t + t^2 \) \/ \( 1 + t^6 \)\
F F & \( 1 - t^4 \) \( 1 + t + t^2 \) \/ \( 1 + t^6 \)\
M F & t^(1 \/ 2) \( 1 - t^3 \) \( 1 + t^2 \) \/ \( 1 + t^6 \) . $
  These are the $M \, F$ entries of $M_0 - sans(h)_(*) X X^t$ after restoring $F_(upright("pair")) = 2 F$.
    To invert them, put $D_x = cosh \( pi x \/ 6 \)$ and $R_x \( a \) = \( D_x - a \) \/ \( D_x + a \)$.
    The hyperbolic log transform gives
  $ P_(M M) \( x \) & = R_x \( 1 \) R_x \( 1 \/ 2 \) \/ R_x \( sqrt(3) \/ 2 \) \,\
P_(F F) \( x \) & = R_x \( 1 \) R_x \( 1 \/ 2 \) R_x \( sqrt(3) \/ 2 \) \,\
P_(M F) \( x \) & = R_x \( cos \( pi \/ 12 \) \) R_x \( cos \( 5 pi \/ 12 \) \) . $
  Indeed $- log R_x \( cos \( pi h \/ 6 \) \)$ has symbol $\( t^h - t^(6 - h) \) \/ \( 1 + t^6 \)$ in these units
    for $0 lt.eq h lt.eq 3$. All three pair magnitudes are at most one for $x > 0$.
    For $P_(M M)$ use $R_x \( 1 \) lt.eq R_x \( sqrt(3) \/ 2 \)$ and $R_x \( 1 \/ 2 \) lt.eq 1$;
    the other two bounds are immediate. This includes every forward image factor.
  The absolute local constants for $i = M \, F_(upright("pair"))$ satisfy
  $ z_i = lim_(x arrow.b 0) frac(sqrt(P_(i i) \( x \)), 2 pi x) . $
  For $M$, the field prefactor has magnitude $1 \/ sqrt(8)$,
    and its internal height exponent is half the coincident two-body contraction.
    The short and outer zeros give $\( 2 pi x \) \( pi x \/ 4 \)$, proving this rule.
    The linear part of $K^r$ has no contribution to the limiting real part.
    For $F_(upright("pair"))$, set $rho_(upright("col")) = lim_(epsilon arrow.r 0) \| epsilon \|^2
    e^(Re K_0 \( 3 i + epsilon \))$. Its collision residue has magnitude $\( 4 pi^2 \/ 8 \) e^(K_0 \( 0 \))
    rho_(upright("col"))$: this uses the short-pair zero and the unit outer magnitude at height difference one.
    The leading two-body factor is
  $ \( 2 pi x \)^4 \( pi x \/ 4 \)^2 e^(2 K_0 \( 0 \)) rho_(upright("col"))^2 \/ x^4 \, $
  which gives the same local rule. Consequently
  $ z_M = frac(2 + sqrt(3), 24 sqrt(3)) \, wide z_F = frac(2 - sqrt(3), 24 sqrt(3)) \, wide z_M + z_F =
    frac(1, 6 sqrt(3)) . $
  Dropping the pair factors and the winding constraint only increases the absolute sum.
    The indistinguishable-particle factorials then give
  $ lr(|lim_(m_(*) arrow.r oo) cal(Z)_(m_(*) \, T)^(\( * \))|) lt.eq e^(T \( z_M + z_F \)) =
    e^(T \/ \( 6 sqrt(3) \)) . $
  Divide (15.2) and (15.3) by their common nonzero exponential, and take these two limits at the fixed period. We obtain
  $ \| "tr" X_theta^(N_(*)) \| lt.eq \| det \( I - A_0^(N_(*)) \) \|^(- 1)
    lr(|frac(c_(*) \( b N_(*) \), c \( b N_(*) \))|) e^(b N_(*) \/ \( 6 sqrt(3) \)) . $
  Using $integral_0^oo log \( 1 + e^(- a k) \) thin d k = pi^2 \/ \( 12 a \)$ and the corresponding minus-sign
    integral from Section 5, the determinant product in $c_(*)$ has rate $- 19 pi \/ 288$;
    together with $11 pi \/ 144$ from $D_W \/ "tr" Gamma$, this gives $log c_(*) \( T \) \/ T arrow.r pi \/ 96$.
    Since $log c \( T \) \/ T arrow.r pi \/ 16$,
  $ 1 / T log frac(c_(*) \( T \), c \( T \)) arrow.r - frac(5 pi, 96) . $
  Now let $N_(*) arrow.r oo$. The determinant tends to one,
    and the power-trace spectral-radius criterion from Section 7 gives (15.1).
    The fixed-site physical limit has not entered this comparison. ◻
]

=== 15.2 A coefficient lemma for two exterior gaps <a-coefficient-lemma-for-two-exterior-gaps>

The fixed-list limit in (13.8) controls a trace with two long exterior portions, one at each limiting angle.
  The following version of Lemma 18 records the frequency collision that occurs when both portions have length $2
  N - L$.

#thm([Lemma 15.2.])[
  (Two exterior gaps).  #emph[Let $E_(+) \, E_(-)$ be Hilbert–Schmidt operators on a complex Hilbert space,
    each with spectral radius one. Write $cal(P)_plus.minus = { zeta in sigma \( E_plus.minus \) : \| zeta \| =
    1 }$ for their finite nonempty peripheral spectra. For $zeta in cal(P)_plus.minus$,
    let $P_zeta^plus.minus$ be the Riesz projection, $J_zeta^plus.minus = \( E_plus.minus - zeta I \)
    P_zeta^plus.minus$, and choose $q_zeta^plus.minus gt.eq 1$ to be its nilpotent order on $"ran"
    P_zeta^plus.minus$. Let $C$ be trace class. For $i = 1 \, 2 \, 3 \, 4$,
    let $cal(W)_i$ be a countable family of bounded operators with integer lengths $ell \( W \) gt.eq
    0$ such that, for fixed $epsilon \, B > 0$,
$ sum_(W in cal(W)_i) e^(epsilon ell \( W \)) parallel W parallel lt.eq B . $

 Fix an integer $L gt.eq 0$. For integers $N gt.eq 1$ with $g = 2 N - L gt.eq 0$, put
$ F_(N \, L) = sum_(W_i in cal(W)_i\
ell_(+) lt.eq g \, med ell_(-) lt.eq g) "tr" #scale(x: 120%, y: 120%)[\(] C W_1 E_(+)^(g - ell_(+)) W_2 W_3
  E_(-)^(g - ell_(-)) W_4 #scale(x: 120%, y: 120%)[\)] \,\
ell_(+) = ell \( W_1 \) + ell \( W_2 \) \, quad ell_(-) = ell \( W_3 \) + ell \( W_4 \) . $

 Suppose $F_(N \, L) - R "tr" E_(+)^(4 N) arrow.r 0$ for a scalar $R$ as $N arrow.r oo$ at this fixed $L$.
   For either sign define
$ cal(B)_zeta^plus.minus \( z \, ell \) = sum_(a = 0)^(q_zeta^plus.minus - 1) binom(z - ell, a)
  zeta^(- a) \( J_zeta^plus.minus \)^a P_zeta^plus.minus . $

 The following series is coefficientwise absolutely convergent and defines a polynomial:
$ cal(P)_(zeta \, eta) \( z \) =  & sum_(W_1 \, W_2 \, W_3 \, W_4) zeta^(- ell_(+)) eta^(- ell_(-))\
 & quad dot.op "tr" #scale(x: 120%, y: 120%)[\(] C W_1 cal(B)_zeta^(+) \( z \, ell_(+) \) W_2 W_3
   cal(B)_eta^(-) \( z \, ell_(-) \) W_4 #scale(x: 120%, y: 120%)[\)] . $

 Then for every frequency $beta$ in ${ alpha^4 : alpha in cal(P)_(+) } union { \( zeta eta \)^2 :
   zeta in cal(P)_(+) \, eta in cal(P)_(-) }$,
#[#set math.equation(numbering: n => "(15.6)")
 $ R sum_(alpha in cal(P)_(+)\
alpha^4 = beta) "rank" P_alpha^(+) & = sum_(zeta in cal(P)_(+) \, eta in cal(P)_(-)\
\( zeta eta \)^2 = beta) \( zeta eta \)^(- L) cal(P)_(zeta \, eta) \( - L \) . $ <c7:two-gap-frequency>]

 In particular
$ \| R \| lt.eq K \( 1 + L \)^h parallel C parallel_1 \, wide h =
  max_(zeta \, eta) \( q_zeta^(+) + q_eta^(-) - 2 \) \, $

 where $K$ depends only on $E_plus.minus$, $epsilon$, and $B$, and is independent of $C \, L \, R$.]
] <c7:two-gap>

#proof[
  The peripheral expansions from Lemma 18 give, for either operator,
    a finite sum of its Riesz nilpotent polynomials plus an exponentially small remainder in operator norm.
    Its powers have a fixed polynomial bound. The exponential word moments make the displayed series for
    $cal(P)_(zeta \, eta)$ coefficientwise absolutely convergent:
    a coefficient of $binom(z - ell, a)$ is at most $C_a \( 1 + ell \)^a$.
    Thus every coefficient has magnitude at most $K parallel C parallel_1$, and the degree is at most $h$.
  For word quadruples with both $ell_(+) \, ell_(-) lt.eq g \/ 2$,
    replace both powers in $F_(N \, L)$ by their peripheral expansions.
    Their total error is exponentially small in $g$ times a polynomial, by the word bounds.
    If either total word length exceeds $g \/ 2$, its exponential tail absorbs the polynomial power bounds.
    The same estimate permits extending the peripheral sums to all quadruples. Hence, at fixed $L$,
  $ F_(N \, L) = sum_(zeta in cal(P)_(+) \, eta in cal(P)_(-)) \( zeta eta \)^g cal(P)_(zeta \, eta) \( g \) +
    o \( 1 \) . $
  The bare trace is $sum_(alpha in cal(P)_(+)) d_alpha alpha^(4 N) + o \( 1 \)$, with $d_alpha =
    "rank" P_alpha^(+)$; positive nilpotent powers have trace zero.
    Rewrite $g = 2 N - L$ and group the frequencies in $N$. Uniqueness of unit-circle exponential polynomials,
    proved by Cesàro extraction in Lemma 18, gives the polynomial identity
  $ sum_(\( zeta eta \)^2 = beta) \( zeta eta \)^(- L) cal(P)_(zeta \, eta) \( 2 z - L \) equiv
    R sum_(alpha^4 = beta) d_alpha . $
  Its value at $z = 0$ is (15.6). Choose a frequency $beta = alpha_0^4$ from $cal(P)_(+)$.
    The sum on the left side of (15.6) multiplying $R$ is a positive integer.
    Since $\| \( zeta eta \)^(- L) \| = 1$ and the polynomial coefficients are bounded as above, evaluation at $-
    L$ proves the asserted bound. ◻
]

=== 15.3 Proof of the unequal-interval estimate <proof-of-the-unequal-interval-estimate>

#proof[
  Fix the bound on the count discrepancies. We first use distinct generic imaginary site heights in the single
    neighborhood supplied by Proposition 38, with $w_e = - i f$ and with the site heights together with the
    endpoint height $- f$ having total spread strictly below one.
    All constants below are uniform over these nearby heights, $0 lt.eq f lt.eq 0.6$, and the list orders.
    The interval sizes are $m + 1 \, n + 1$, where $n gt.eq m$ and $M = m + n + 2$.
    Formula (13.8) applies to the continued matrix quantity $H^(upright("flip"))$ on each such fixed pair of lists.
  Use one homogeneous gauge with quadratic slack for all kernels in this proof.
    The bounded angle profiles and bounded extra dress logarithms cost only linear terms in the local counts and
    common charge, which the quadratic gauge absorbs uniformly.
    The Bargmann tail is independent of these profiles. Normalize every block by $r_E$.
    The resulting kernels have uniform Hilbert–Schmidt bounds.
    A perturbation of size $delta$ in the angle and per-particle logarithms changes a kernel by $O \( delta \)$ in
    Hilbert–Schmidt norm; polynomial count and charge factors from exponentiating the difference are absorbed by
    the same quadratic bound. For suppressed multipliers of modulus at most one,
    the corresponding estimate uses their differences directly, so it also applies at their zeros.
  ===== 15.3.1 Removing the distant periodic copies. <removing-the-distant-periodic-copies.>
  Take $T = 4 N b$ and let $N arrow.r oo$ while the two lists are fixed.
    On blocks $j = - N \, dots.h \, N - 1$, use the single origin kink $D_e \( x - w_e \)$,
    its single localized dress corrections from (13.6), and the unperiodized products of all site factors.
    On blocks $j = N \, dots.h \, 3 N - 1$, use the opposite kink translated to $2 N b$,
    negate those angle and correction logs, and omit all site products.
    Exponential image tails show that each replacement of a periodized kernel costs $O_(m \, n) \( e^(- c N) \)$
    at these fixed lists.
  Put
  $ L = ⌈frac(log n, kappa_1 b)⌉ \, wide kappa_1 = pi \/ 3 \, $
  and let $cal(K)_c$ be the ordered product of the normalized origin profile kernels on $- L lt.eq j < L$.
    For large $N$ it is followed by a positive-angle portion of length $g = 2 N -
    L$ and a negative-angle portion of the same length. Their homogeneous operators are $E'_(+) =
    E_nu \/ r_E$ and $E'_(-) = E_(- nu) \/ r_E$.
  On each portion, the deviations from the homogeneous operator decay as $C
    e^(- c k)$ in block distance $k$ from its two ends. At the end next to $cal(K)_c$,
    the site log tail is bounded because $n e^(- kappa_1 b L) lt.eq 1$; the kink corrections also decay there.
    At the other end only the opposite kink contributes. These constants are uniform in the lists.
    Expand each end in subsets of its deviations, ending a word at its last chosen deviation.
    Pair each intervening polynomially bounded power of $E'_plus.minus$ with the farther chosen index.
    The exponential deviation bounds then give four word families with
  $ sum_W e^(c' ell \( W \)) parallel W parallel lt.eq C $
  for fixed $c' > 0$, uniformly in the lists. The same expansion bounds every subinterval product polynomially in
    $N$ at fixed lists. Consequently the $O_(m \, n) \( e^(- c N) \)$ periodization errors have total trace
    contribution $o \( 1 \)$; keep two Hilbert–Schmidt factors and use the polynomial bounds on the intervening
    products.
  Let $F_N^(upright("per"))$ be the normalized trace with the periodized kernels.
    The exact trace formulas, including their common Bargmann determinant, say
  $ F_N^(upright("per")) = c \( 4 N b \) Z_(4 N b)^L "tr" \( E'_(+) \)^(4 N) . $
  For these fixed lists, (13.8) supplies $R = lim_(N arrow.r oo) c \( 4 N b \) Z_(4 N b)^L$.
    The bare power traces are bounded by their peripheral expansion even when $E'_(+)$ has Jordan blocks.
    It follows that $F_N^(upright("per")) - R "tr" \( E'_(+) \)^(4 N) arrow.r 0$.
    After the periodization replacement the same limit holds for the profile trace.
    Its four anchored words occupy portions of lengths $N - L$ and $N$ in each gap.
    Extending those separate cutoffs to the word sums of Lemma 40 adds $o \( 1 \)$ at fixed $L$:
    every extra word has length at least $N - L$, and its exponential tail absorbs the polynomial powers.
    The lemma applies with $C = cal(K)_c$. We have proved the uniform estimate
  #[#set math.equation(numbering: n => "(15.7)")
   $ lr(|lim_(N arrow.r oo) c \( 4 N b \) Z_(4 N b)^L|) lt.eq
     C \( 1 + L \)^h parallel cal(K)_c parallel_1 . $ <c7:eq-G>]
  The dependence of the discarded periodization errors on the fixed lists has no effect on the uniform constant in
    this coefficient bound.
  ===== 15.3.2 The central charge estimate. <the-central-charge-estimate.>
  Put
  $ J = ⌊frac(log m, kappa_1 b)⌋ \, wide W = floor.l gamma L floor.r $
  for a fixed small buffer fraction $gamma > 0$. Radii here count full blocks from the origin.
    On each side, ignore buffers around radii $0 \, J \, L$. The remaining inner comparison has length
    $\( J - 2 W \)_(+)$ and the remaining mixed comparison has length $\( L - J - 2 W \)_(+)$,
    up to bounded endpoint changes. Thus the ignored length relative to $J$ and $L -
    J$ is $O \( W + 1 \)$ even when intervals overlap or are empty.
    Buffer products cost at most $C^(O \( W + 1 \))$; reserve one Hilbert–Schmidt factor at each end of the whole
    product.
  At radii between $J + W$ and $L - W$, the small-list multipliers differ from one by $O \( e^(- c W) \)$,
    and the large-list suppressed multipliers are superexponentially small in $W$.
    The angle and localized dress differ from their limiting values by $O \( e^(- c W) \)$.
    Hence these normalized kernels are $O \( e^(- c W) \)$ from $X_(- nu) \/ r_E$ on the left and $X_nu \/
    r_E$ on the right.
  At radii below $J - W$, omit both species’ suppressed labels, including through the center buffer.
    The total error in the central product is at most
  $ L C^(2 L) exp \( - c e^(c W) \) \, $
  with zero error if this inner interval is empty. This follows directly from suppression at that distance inside
    the smaller scale and the crude uniform bound for every other kernel.
    Between radii $W$ and $J - W$, the remaining normalized kernels are $O \( e^(- c W) \)$ from $I_(- nu) \/
    r_E$ and $I_nu \/ r_E$ on the two sides.
  Only after this omission do we restrict charge sectors. A spatial successor satisfies $p' = p - q$,
    and the remaining particles have $q_M = - 1$ and $q_(F_(upright("pair"))) = - 2$ in their species.
    Therefore $k = p_1 + p_2$ is nondecreasing along the whole restricted inner interval.
    This is the spatial direction; the operator acts from successor to predecessor.
    Partition the product by the sign of $k$ at its midpoint.
    For the left and right angles define $d_(-) \( k \) = \| k - 3 \/ 4 \|$ and $d_(+) \( k \) = \| k +
    3 \/ 4 \|$. Monotonicity permits the following comparison ranges $cal(R)_(-) \, cal(R)_(+)$;
    the columns $k_(-)^(*) \, k_(+)^(*)$ give the spectral maximizers in those ranges:
  $ upright("midpoint ") k & cal(R)_(-) & k_(-)^(*) & cal(R)_(+) & k_(+)^(*) & d_(-) \( k_(-)^(*) \)^2 +
    d_(+) \( k_(+)^(*) \)^2\
0 & { k lt.eq 0 } & 0 & { k gt.eq 0 } & 0 & 9 \/ 8\
> 0 & bb(Z) & 1 & { k gt.eq 1 } & 1 & 25 \/ 8\
< 0 & { k lt.eq - 1 } & - 1 & bb(Z) & - 1 & 25 \/ 8 $
  For any range $cal(R)$ in the table, the compression of $I_theta$ to its common-charge fibers has radius
  $ max_(k in cal(R)) u_k \( theta \) \, wide u_k \( theta \) =
    exp #h(-0.16667em) [- frac(4 pi b, 9) \( k + theta \/ pi \)^2] . $
  Every closed trace in a compression contains only empty blocks,
    because all allowed particles have negative common charge.
    The empty-block power traces therefore give this radius, as in Section 7.
    This argument works at the real angles $plus.minus nu$ and needs no semisimplicity assertion.
    The last column of the table shows that every product of the applicable left and right radii is at most
  $ u_c^2 = e^(- \( 4 pi b \/ 9 \) \( 9 \/ 8 \)) \, wide u_c = e^(- pi b \/ 4) . $
  For each of the finitely many comparison operators, a spectral-radius upper bound $r > 0$ gives $parallel B^s
    parallel lt.eq C_delta \( r e^delta \)^s$ for every fixed $delta > 0$.
    Expanding the $O \( e^(- c W) \)$ kernel deviations by subsets gives the same bound with an arbitrarily small
    further spectral slack once $W$ is large. All constants are uniform because the comparison operators are the
    fixed $X_(plus.minus nu) \/ r_E$ and the finitely many compressed $I_(plus.minus nu) \/ r_E$.
    Combine these bounds with the table, Proposition 39, and the buffer costs.
    For fixed $gamma \, delta > 0$ the result is
  $ parallel cal(K)_c parallel_1 lt.eq  & C_(gamma \, delta)
    e^(C_b gamma L + 2 delta L) \( u_c \/ r_E \)^(2 J) \( r_X^(+) \/ r_E \)^(2 \( L - J \))\
 & + L C^(2 L) e^(- c e^(c W)) . $
  The additive error is negligible even relative to an exponential in $- L$ for each fixed $gamma > 0$.
    Since $J = log m \/ \( kappa_1 b \) + O \( 1 \)$ and $L - J = log \( n \/ m \) \/ \( kappa_1 b \) +
    O \( 1 \)$, choosing arbitrarily small fixed $gamma \, delta$ proves that for every $eta > 0$
  $ parallel cal(K)_c parallel_1 lt.eq
    C_eta
    n^eta \( u_c \/ r_E \)^(2 log m \/ \( kappa_1 b \)) \( r_X^(+) \/ r_E \)^(2 log \( n \/ m \) \/ \( kappa_1 b \)) $
  whenever $n gt.eq m$ are sufficiently large. The threshold can be imposed on $m$,
    and may depend on the fixed count-discrepancy bound. This also covers short or absent comparison segments
    through the stated buffer allowance.
  The polynomial factor in (15.7) is absorbed by an arbitrarily small power of $n$.
    Combining that equation with the uniform version of (13.8), using $M asymp n$, gives the desired power because
  $ - 5 / 24 + frac(2 log \( u_c \/ r_E \), kappa_1 b) & = - 4 / 3 \,\
- 5 / 24 + frac(2 log \( r_X^(+) \/ r_E \), kappa_1 b) & = frac(1, pi sqrt(3)) - 7 / 48 < 1 / 3 . $
  For each prescribed $epsilon.alt > 0$, choose the induced Pfaffian, buffer, spectral,
    and polynomial exponents with total at most $epsilon.alt$.
    This proves a bound with constant $C_epsilon.alt$ uniform over the nearby generic heights and orders.
    Now approach the physical spread-one heights for each fixed pair of lists.
    Proposition 28 gives regularity of $H^(upright("flip"))$ and its identification with $H_(upright("lg")) =
    H^(upright("poly"))$ there. No regulator limit at the boundary is needed.
    We conclude, in the uniform notation of the introduction,
  #[#set math.equation(numbering: n => "(15.8)")
   $ H_(upright("lg")) lt.eq n^(o \( 1 \)) m^(- 4 \/ 3) \( n \/ m \)^(1 \/ 3) . $ <c7:eq-U>]
  This is the assertion of Theorem 29, with constants and threshold allowed to depend on the fixed discrepancy bound. ◻
]

=== 15.4 From selected bond pairs to planar polygons <from-selected-bond-pairs-to-planar-polygons>

We finish the length-square estimate for planar polygons modulo lattice translations:

#[#set math.equation(numbering: n => "(15.9)")
 $ sum_(lambda : thin "diam" lambda lt.eq H) x^(\| lambda \|) \| lambda \|^2 lt.eq
   H^(2 \/ 3 + o \( 1 \)) . $ <c7:eq-Pol>]

The argument first removes polygons with too few locally available bond directions.
  For the remaining polygons it selects many bond pairs and constructs, for each pair,
  a cylinder satisfying every hypothesis of Theorem 29.

Fix a large integer $K$. A vertex of a polygon is called good if the cyclic window of $2
  K$ path edges centered at that vertex uses bonds crossing tessellation sides of all three orientations.
  Write $N = \| lambda \|$ for the polygon length.

#thm([Lemma 15.3.])[
  (Summability of polygons with few good vertices).  #emph[For a sufficiently large fixed $K$,
$ sum_(lambda : thin \# { upright("good vertices of ") lambda } < \| lambda \| \/ 2) x^(\| lambda \|) \|
  lambda \|^2 < oo \, $

 where polygons are counted modulo translations.]
] <c7:bad-windows>

#proof[
  For large $N$, at least $N \/ 2$ centers have a window omitting one orientation.
    Greedily select disjoint cyclic radius-$K$ windows at such centers.
    A selected window excludes at most $4 K + 1$ possible centers, and contains $2 K$ path edges.
    The number of covered edges, after discarding the possible window crossing a chosen root, is at least
  $ 2 K (frac(N \/ 2, 4 K + 1) - 1) - 2 K gt.eq N / 7 $
  for $N$ sufficiently large at fixed $K$.
  Count the resulting rooted oriented paths. There are at most $N \/ \( 2 K \)$ selected window starts.
    Specifying those starts, one missing orientation and the first step of each window costs at most
  $ sum_(j lt.eq N \/ \( 2 K \)) binom(N, j) 6^j lt.eq exp \( epsilon_K N + o \( N \) \) \, wide epsilon_K arrow.r
    0 quad \( K arrow.r oo \) . $
  Inside a selected window continuation is forced: after one of the three bond orientations is forbidden,
    the allowed graph has degree two, and a nonbacktracking path has one next edge.
    Outside the windows there are at most two choices per edge.
    Up to polynomial factors from rooting and closing, the number of paths is therefore at most
    $e^(epsilon_K N + o \( N \)) 2^(6 N \/ 7)$. Since
  $ x 2^(6 \/ 7) = \( 2 x \) 2^(- 1 \/ 7) < 1 \, $
  choose $K$ so the entropy factor preserves a strict exponential decay.
    The extra factor $N^2$ and the rooting factors are then summable.
    The finitely many shorter lengths contribute a finite amount. ◻
]

#thm([Lemma 15.4.])[
  (Selected pairs and permitted cylinders).  #emph[Let $lambda$ be a planar polygon of diameter at most $H$,
    and let $v_1 \, v_2$ be good vertices. Put $r_K = \( K - 1 \/ 2 \) \/ sqrt(3)$.
    If $\| v_2 - v_1 \| > 4 sqrt(19) thin r_K$, one can assign used bonds $e_1 \,
    e_2$ within their respective windows so that the following holds after a lattice rotation or reflection.
    Both bonds cross horizontal tessellation sides, and their midpoint displacement is
$ delta = a + b tau \, wide a gt.eq 1 \, quad b gt.eq 0 \, quad f = frac(b, a + b) < 0.6 . $

 There is a permitted cut with these two horizontal marked sites and, after a common rescaling,
   physical logarithmic heights $- f \, 1 - f$. Its interval sizes are $m + 1 \, n + 1$,
   its period has an even number $M = m + n + 2$ of sites, and its unmarked count discrepancies from the
   proportions $1 - f \, f$ are at most $f$. It has $n gt.eq m$, $m asymp \| delta \|$,
   and $n asymp H$ above a fixed distance cutoff. Projection to this cylinder is injective on the polygons of
   diameter at most $H$ containing the fixed ordered bond pair, when their first bond is fixed in the plane.]
] <c7:selected-pair>

#proof[
  Choose the tessellation ray closest to $v_2 - v_1$. Its angle from that displacement is at most $pi \/ 6$.
    Goodness supplies, in each window, a used bond crossing a side parallel to this ray.
    Its midpoint is within $r_K$ of the corresponding vertex. Let $delta$ be the displacement of these midpoints.
    Set $theta_(*) = arg \( 2 + 3 tau \)$. Elementary geometry gives
  $ sin \( theta_(*) - pi \/ 6 \) = frac(1, 2 sqrt(19)) . $
  Since $\| delta - \( v_2 - v_1 \) \| lt.eq 2 r_K$, the change of angle is at most
    $arcsin \( 2 r_K \/ \| v_2 - v_1 \| \)$. The stated distance cutoff therefore makes the angle of $delta$ from
    the selected ray strictly less than $theta_(*)$. Rotate the selected ray to the positive horizontal direction,
    then reflect if necessary to make that angle nonnegative.
    Midpoints of horizontal-type bonds form one coset of $bb(Z) + bb(Z) tau$.
    Thus $delta = a + b tau$ with integers $a gt.eq 1 \, b gt.eq 0$. Moreover
  $ tan arg delta = frac(sqrt(3) f, 2 - f) \, wide f = frac(b, a + b) \, $
  and the value at $f = 3 \/ 5$ is $tan theta_(*)$, proving $f < 0.6$.
  Put $s = a + b$ and $d = \| delta \|$. Then
  $ d = s sqrt(1 - f + f^2) \, wide sqrt(3) / 2 s lt.eq d lt.eq s . $
  Both midpoints lie in the convex hull of the polygon vertices, whose diameter is also at most $H$, so $d lt.eq
    H$. Construct a word of $a$ horizontal and $b$ shifted $tau$ steps,
    beginning with the horizontal side crossed by $e_1$. Its next copy begins with the side crossed by $e_2$.
    Repeat this word $2 L$ times, where
  $ L = ⌊frac(3 H, 2 d)⌋ + 1 . $
  For a lattice point $p + q tau$, the transverse coordinate $p +
    q$ increases by one along either allowed cut step and is unchanged by the time step $tau^2 = tau - 1$.
    The translated rows therefore tile the plane and the cut is permitted.
  The period vector and site count are $P = 2 L delta$ and $M = 2 L s$. Thus $\| P \| > 3 H$, $M$ is even, and
  $ 3 H < M lt.eq 10 / sqrt(3) H . $
  The upper bound uses $L lt.eq 3 H \/ \( 2 d \) + 1$, $s \/ d lt.eq 2 \/ sqrt(3)$, and $d lt.eq H$.
    The two interval sizes and their exact unmarked counts are
  $ m = s - 1 \, wide n = \( 2 L - 1 \) s - 1 \,\
\( a - 1 \, b \) = #scale(x: 120%, y: 120%)[\(] m \( 1 - f \) - f \, med m f + f #scale(x: 120%, y: 120%)[\)] \,\
\( \( 2 L - 1 \) a - 1 \, \( 2 L - 1 \) b \) = #scale(x: 120%, y: 120%)[\(] n \( 1 - f \) - f \, med n f +
  f #scale(x: 120%, y: 120%)[\)] . $
  The two marked sites are horizontal, and every count discrepancy is at most $f < 0.6$.
    Apply a common rescaling of the physical site variables so the horizontal logarithmic height is $- f$.
    The shifted-to-horizontal ratio $q$ then makes the shifted height $1 - f$, as required by Theorem 29.
    Since $d lt.eq H$, one has $L gt.eq 2$, hence $n gt.eq m$.
    The displayed comparisons give $m asymp d$ above a fixed cutoff and $n asymp H$.
  Finally, no two points of a diameter-$H$ polygon differ by a nonzero multiple of $P$, because $\| P \| > 3 H$.
    Its projection is therefore an embedded cylinder polygon through the two marked bonds.
    The lift of a connected projected polygon containing the fixed first plane bond is unique.
    Two plane polygons containing that fixed ordered pair cannot have the same projected polygon.
    This proves the claimed injection. ◻
]

Choose $K$ as in Lemma 41. For each prescribed exponent slack $epsilon.alt > 0$,
  choose a fixed distance cutoff large enough both for Lemma 42 and for its resulting $m gt.eq
  m_epsilon.alt$ in Theorem 29. In a polygon with at least $N \/ 2$ good vertices,
  lattice packing excludes only $O \( N \)$ ordered pairs within this fixed cutoff.
  Thus for sufficiently large $N$ the retained pairs number at least $c N^2$.
  Choosing a used bond in each window loses only a bounded multiplicity:
  each selected bond can be assigned by only $O \( K \)$ vertices along the polygon.
  The finitely many shorter lengths contribute a bounded total modulo translations.

Fix the first bond at one translation representative of each bond type.
  In a dyadic displacement annulus of radius $d$, there are $O \( d^2 \)$ possible second bonds.
  For each selected pair among these possibilities, Lemma 42 embeds the diameter-truncated plane polygons
  injectively into its positive cylinder sum. Its parameters satisfy $m asymp d$ and $n asymp H$,
  with the discrepancy bound $0.6$. Theorem 29 therefore bounds that sum by $C_epsilon.alt H^epsilon.alt
  d^(- 4 \/ 3) \( H \/ d \)^(1 \/ 3)$. Summing gives

$ sum_(d med upright("dyadic") \, med d lt.tilde H) C_epsilon.alt d^2 H^epsilon.alt
  d^(- 4 \/ 3) \( H \/ d \)^(1 \/ 3) & lt.eq C_epsilon.alt H^(1 \/ 3 + epsilon.alt)
  sum_(d med upright("dyadic") \, med d lt.tilde H) d^(1 \/ 3)\
 & lt.eq C_epsilon.alt H^(2 \/ 3 + epsilon.alt) . $

Combine this with the summable family from Lemma 41 and the bounded short lengths.
  Since $epsilon.alt > 0$ was arbitrary, this proves (15.9).

#heading(level: 1)[References]
#bibitem([1])[Yu.~Baryshnikov. GUEs and queues. #emph[Probability Theory and Related Fields] #strong[119] (2001),
  256--274. #link("https://doi.org/10.1007/PL00008760")[doi:10.1007/PL00008760].]
#bibitem([2])[N.~R.~Beaton, M.~Bousquet-Mélou, J.~de Gier, H.~Duminil-Copin and A.~J.~Guttmann.
  The critical fugacity for surface adsorption of self-avoiding walks on the honeycomb lattice is $1 + sqrt(2)$.
  #emph[Communications in Mathematical Physics] #strong[326] (2014), 727--754.
  #link("https://doi.org/10.1007/s00220-014-1896-1")[doi:10.1007/s00220-014-1896-1].]
#bibitem([3])[H.~Duminil-Copin and S.~Smirnov. The connective constant of the honeycomb lattice equals
  $sqrt(2 + sqrt(2))$. #emph[Annals of Mathematics] #strong[175] (2012), 1653--1665.
  #link("https://doi.org/10.4007/annals.2012.175.3.14")[doi:10.4007/annals.2012.175.3.14].]
#bibitem([4])[G.~Z.~Fehér and B.~Nienhuis. Currents in the dilute $O \( n = 1 \)$ model.
  Preprint (2015), revised 2018. #link("https://arxiv.org/abs/1510.02721")[arXiv:1510.02721].]
#bibitem([5])[I.~B. Frenkel, #emph[Two constructions of affine Lie algebra representations and boson--fermion
  correspondence in quantum field theory], J. Funct. Anal. #strong[44] (1981), no.~3, 259--327.
  #link("https://doi.org/10.1016/0022-1236(81)90012-4")[doi:10.1016/0022-1236(81)90012-4].]
#bibitem([6])[I.~B. Frenkel, N. Jing and W. Wang, #emph[Vertex representations via finite groups and the McKay
  correspondence], Internat. Math. Res. Notices #strong[2000] (2000), no.~4, 195--222.
  #link("https://doi.org/10.1155/S107379280000012X")[doi:10.1155/S107379280000012X].
  #link("https://arxiv.org/abs/math/9907166v2")[arXiv:math/9907166v2].]
#bibitem([7])[A.~Glazman. Connective constant for a weighted self-avoiding walk on $bb(Z)^2$.
  #emph[Electronic Communications in Probability] #strong[20] (2015), no.~86, 1--13.
  #link("https://doi.org/10.1214/ECP.v20-3844")[doi:10.1214/ECP.v20-3844].]
#bibitem([8])[A.~Glazman and I.~Manolescu. Self-avoiding walk on $bb(Z)^2$ with Yang--Baxter weights:
  universality of critical fugacity and 2-point function. #emph[Annales de l'Institut Henri Poincaré,
  Probabilités et Statistiques] #strong[56] (2020), 2281--2300.
  #link("https://doi.org/10.1214/19-AIHP1024")[doi:10.1214/19-AIHP1024].]
#bibitem([9])[U.~Grimm and P.~A.~Pearce. Multi-colour braid--monoid algebras. #emph[Journal of Physics A:
  Mathematical and General] #strong[26] (1993), 7435--7460.
  #link("https://doi.org/10.1088/0305-4470/26/24/018")[doi:10.1088/0305-4470/26/24/018].
  #link("https://arxiv.org/abs/hep-th/9303161")[arXiv:hep-th/9303161].]
#bibitem([10])[Y.~Ikhlef and J.~Cardy. Discretely holomorphic parafermions and integrable loop models.
  #emph[Journal of Physics A: Mathematical and Theoretical] #strong[42] (2009), 102001.
  #link("https://doi.org/10.1088/1751-8113/42/10/102001")[doi:10.1088/1751-8113/42/10/102001].]
#bibitem([11])[M.~Ishikawa, S.~Okada, H.~Tagawa and J.~Zeng.
  Generalizations of Cauchy's determinant and Schur's Pfaffian.
  #emph[Advances in Applied Mathematics] #strong[36] (2006), 251--287.
  #link("https://doi.org/10.1016/j.aam.2005.07.001")[doi:10.1016/j.aam.2005.07.001].
  #link("https://arxiv.org/abs/math/0411280v2")[arXiv:math/0411280v2].]
#bibitem([12])[I. Klich, #emph[Full counting statistics: An elementary derivation of Levitov's formula], 2002.
  #link("https://arxiv.org/abs/cond-mat/0209642v1")[arXiv:cond-mat/0209642v1].]
#bibitem([13])[D.~Krachun and C.~Panagiotis. Quantitative sub-ballisticity of self-avoiding walk on the hexagonal
  lattice. #emph[Annals of Probability] #strong[54] (2026), 1109--1125.
  #link("https://doi.org/10.1214/24-AOP1730")[doi:10.1214/24-AOP1730].]
#bibitem([14])[B.~Nienhuis. Exact critical point and critical exponents of $O \( n \)$ models in two dimensions.
  #emph[Physical Review Letters] #strong[49] (1982), 1062--1065.
  #link("https://doi.org/10.1103/PhysRevLett.49.1062")[doi:10.1103/PhysRevLett.49.1062].]
#bibitem([15])[B.~Nienhuis. Critical and multicritical $O \( n \)$ models.
  #emph[Physica A] #strong[163] (1990), 152--157.
  #link("https://doi.org/10.1016/0378-4371(90)90325-M")[doi:10.1016/0378-4371(90)90325-M].]
#bibitem([16])[NIST Digital Library of Mathematical Functions, Version 1.2.8, 15 September 2026,
  Sections~18.19 and~18.23. #link("https://dlmf.nist.gov/18.23").]
#bibitem([17])[G.~C. Wick, #emph[The evaluation of the collision matrix], Phys. Rev. #strong[80] (1950), 268--272.
  #link("https://doi.org/10.1103/PhysRev.80.268")[doi:10.1103/PhysRev.80.268].]
#bibitem([18])[Y.~K.~Zhou and M.~T.~Batchelor. Critical behaviour of the dilute $O \( n \)$,
  Izergin--Korepin and dilute $A_L$ face models: Bulk properties.
  #emph[Nuclear Physics B] #strong[485] (1997), 646--664.
  #link("https://doi.org/10.1016/S0550-3213(96)00654-2")[doi:10.1016/S0550-3213(96)00654-2].
  #link("https://arxiv.org/abs/cond-mat/9611156")[arXiv:cond-mat/9611156].]
#bibitem([19])[P.~Zinn-Justin and J.-B.~Zuber. On some integrals over the $U \( N \)$ unitary group and their
  large $N$ limit. #emph[Journal of Physics A: Mathematical and General] #strong[36] (2003), 3173--3193.
  #link("https://doi.org/10.1088/0305-4470/36/12/318")[doi:10.1088/0305-4470/36/12/318].
  #link("https://arxiv.org/abs/math-ph/0209019v3")[arXiv:math-ph/0209019v3].]
