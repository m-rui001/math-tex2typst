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

#align(center)[#text(size: 16pt, weight: "bold")[Gaussian free-field limits \
of weighted integer Lipschitz heights]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

An integer Lipschitz function on the triangular lattice is a discrete surface with a hard constraint on its
  nearest-neighbor slopes. We weight each unit height change by a parameter $x$.
  The associated contours form the loop $O \( 2 \)$ model on the hexagonal lattice.
  We prove that the smoothly averaged surface has a Gaussian free field limit throughout $1 \/ sqrt(2) lt.eq
  x lt.eq 1$, including the predicted critical endpoint. The normalization is independent of the domain and of its
  lattice approximation.

=== 1.1 Model, approximation, and theorem <model-approximation-and-theorem>

Let $bb(H)$ be the hexagonal lattice embedded in $bb(R)^2$ so that its face centers form the triangular lattice

$ bb(T) = bb(Z) \( 1 \, 0 \) + bb(Z) \( 1 \/ 2 \, sqrt(3) \/ 2 \) . $

Two faces are adjacent when they share an edge. We identify each face with its center whenever using the
  triangular-lattice description.

#prodef([Definition 1.1.])[
  (Inside approximation).  Let $D subset bb(R)^2$ be a bounded simply connected domain with $C^2$ Jordan boundary.
    For each mesh $delta$ in a sequence tending to zero, let $gamma_delta$ be a simple cycle in $delta bb(H)$,
    let $D_delta$ be its bounded interior, and include every lattice vertex and edge on or inside the cycle.
    We require $D_delta subset D$, that every compact subset of $D$ is eventually contained in $D_delta$,
    and that there are parametrizations
  $ gamma_delta : S^1 arrow.r partial D_delta \, wide gamma : S^1 arrow.r partial D \, wide parallel gamma_delta -
    gamma parallel_oo arrow.r 0 . $
  Here each parametrization is a homeomorphism onto the indicated curve.
    Write $F_delta$ for the hexagonal faces enclosed by $gamma_delta$,
    and $partial F_delta$ for those adjacent to the boundary cycle.
] <def:approximation>

Fix $x in \[ 1 \/ sqrt(2) \, 1 \]$. An admissible height is a function $h : F_delta arrow.r bb(Z)$ such that

$ h = 0 quad upright("on ") partial F_delta \, wide \| h \( u \) - h \( v \) \| lt.eq 1 quad
  upright("whenever ") u tilde.op v . $

Its probability is

#[#set math.equation(numbering: n => "(1.1)")
 $ bb(P)_(delta \, x) \( h \) = x^(N_delta \( h \)) / Z_(delta \, x) \, wide N_delta \( h \) =
   sum_({ u \, v } subset F_delta : thin u tilde.op v) upright(bold(1))_({ h \( u \) eq.not h \( v \) }) . $ <eq:model>]

The sum counts each unordered adjacent pair once. The admissible set is finite,
  since the height at any face is bounded in absolute value by its graph distance to $partial F_delta$.
  It contains the zero function, so $Z_(delta \, x)$ is finite and positive.
  Height reflection preserves (1.1); in particular, $bb(E) h_delta \( u \) = 0$.

Extend $h_delta$ as a constant on each enclosed face and by zero outside $D_delta$.
  For $f in C_c^oo \( D \)$ we always use the Euclidean area pairing

#[#set math.equation(numbering: n => "(1.2)")
 $ h_delta \( f \) = integral_D h_delta \( z \) f \( z \) thin upright(d) z =
   sum_(u in F_delta) w_(delta \, f) \( u \) h_delta \( u \) \, wide w_(delta \, f) \( u \) =
   integral_(upright("face at ") u) f \( z \) thin upright(d) z . $ <eq:area-pairing>]

For small enough $delta$, these weights sum to $integral_D f$ exactly.

Let $Phi_D$ denote the real zero-Dirichlet Gaussian free field with covariance

#[#set math.equation(numbering: n => "(1.3)")
 $ bb(E) \[ Phi_D \( f \) Phi_D \( g \) \] = integral.double_(D times D) f \( z \) G_D \( z \, w \) g \( w \) thin
   upright(d) z thin upright(d) w \, wide G_D = \( - Delta_D \)^(- 1) . $ <eq:gff-covariance>]

The Laplacian is the Euclidean Laplacian. Thus the singular part of $G_D \( z \, w \)$ is $\( 2 pi \)^(- 1)
  log \( 1 \/ \| z - w \| \)$.

#thm([Theorem 1.2.])[
  #emph[For every fixed $x in \[ 1 \/ sqrt(2) \, 1 \]$ there exists $sigma \( x \) in \( 0 \, oo \)$,
    independent of $D$ and of the inside approximation in Definition 1, such that
$ frac(h_delta, sigma \( x \)) med arrow.r.double med Phi_D wide upright("in ") cal(D)' \( D \) . $

 In particular, the fields are tight as random distributions and, for every $k gt.eq 1$ and $f_1 \, dots.h \,
   f_k in C_c^oo \( D \)$, the vector $\( h_delta \( f_i \) \/ sigma \( x \) \)_(i = 1)^k$ converges to
   $\( Phi_D \( f_i \) \)_(i = 1)^k$. All mixed moments of these vectors converge.]
] <thm:main>

There is no logarithmic rescaling of the amplitude. The logarithmic growth of point variances
  #cite(label("GL2025")) Section 1.2.4 is compatible with finite fluctuations after smooth spatial averaging.
  The theorem is for each fixed $x$; it neither specifies a formula for $sigma \( x \)$ nor asserts that this
  constant is independent of $x$.

The loop description is exact. At each interior vertex of $bb(H)$,
  the three incident face heights have range at most one. Consequently either zero or two incident edges separate
  unequal heights. The occupied edges therefore form mutually vertex-disjoint loops away from the boundary cycle.
  Conversely, such a loop family, together with an independent choice of one of its two orientations for each
  loop, determines an admissible height by summing its signed nesting increments from the zero exterior.
  Thus its un-oriented weight is

#[#set math.equation(numbering: n => "(1.4)")
 $ 2^(\# upright("loops")) x^(\# upright("occupied edges")) . $ <eq:loop-weight>]

Theorem 2 concerns the field law; no convergence claim for the individual loops or their ensemble is needed.

=== 1.2 Context and significance <context-and-significance>

Schramm’s problem collection asks for Gaussian free field behavior of the uniform odd-integer Lipschitz height on
  the triangular lattice with two boundary arcs, and separately asks about its interface
  #cite(label("Schramm2007")) Problem 2.2. That formulation has a different boundary condition and height
  convention from (1.1). It motivates the field question studied here.
  The real-valued model in his Problem 2.3 is another distinct model.

The loop description belongs to the classical solid-on-solid viewpoint:
  Nienhuis relates honeycomb loop weights to integer heights on the triangular lattice
  #cite(label("Nienhuis1982")) p. 1062. The predicted critical curve discussed in #cite(label("GL2025"))
  Section 1.4.1 gives $x_c \( 2 \) = 1 \/ sqrt(2)$. Throughout this paper,
  the phrase #emph[predicted critical endpoint] refers to that prediction;
  a sharp description of the complete phase diagram is not part of the theorem.

At $x = 1 \/ sqrt(2)$, macroscopic loops and the resulting logarithmic height variances were established by
  Duminil-Copin, Glazman, Peled and Spinka #cite(label("DGPS2021")) Theorem 1 and Section 1.2.
  Glazman and Manolescu established logarithmic height variances for the uniform integer Lipschitz model and
  developed its two-spin representation and associated correlation and crossing estimates #cite(label("GM2021")).
  Glazman and Lammers proved delocalization and logarithmic variance estimates in a broader loop-parameter regime,
  and related these estimates to the predicted Gaussian free field limit #cite(label("GL2025")) Section 1.2.4.
  More recently, Glazman, Harel and Zelesko gave another proof of delocalization:
  for $n = 2$ and every $x in \[ 1 \/ sqrt(2) \, 1 \]$, each translation-invariant loop Gibbs measure has
  infinitely many loops surrounding every face #cite(label("GHZ2025")) Theorem 2.
  These are roughness results, distinct from the field limit proved here.

The proof develops the reflection and moment method of the companion article #cite(label("UniformIntegerGFF"))
  Sections 5, 7, 9, and 10 for the weighted family (1.1). That article treats uniform odd integer heights with two
  boundary arcs. Table 1 records the different inputs and conclusions.
  The two-spin representation of Glazman–Manolescu and the weighted percolation augmentation of Glazman–Lammers
  provide the starting point for the conditional cuts #cite(label("GM2021")) #cite(label("GL2025")).
  The extension requires order inequalities after restricted observations and estimates for moments conditioned on
  rare weighted pinning events. We prove these statements below and give the ensuing spectral, boundary,
  and moment arguments in full.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[Uniform two-arc companion
], table.cell(rowspan: 1, colspan: 1)[Present weighted model
]),
  table.cell(rowspan: 1, colspan: 1)[Height
], table.cell(rowspan: 1, colspan: 1)[Odd integers, adjacent differences $0$ or $2$
], table.cell(rowspan: 1, colspan: 1)[Integers, adjacent differences at most $1$
],
  table.cell(rowspan: 1, colspan: 1)[Law
], table.cell(rowspan: 1, colspan: 1)[Uniform; $H = \( h - 1 \) \/ 2$ gives unit-weight increments
], table.cell(rowspan: 1, colspan: 1)[Weight $x$ for each unequal adjacent pair
],
  table.cell(rowspan: 1, colspan: 1)[Boundary
], table.cell(rowspan: 1, colspan: 1)[Two marked arcs with values $+ 1$ and $- 1$
], table.cell(rowspan: 1, colspan: 1)[Zero on the boundary layer of an inside approximation
],
  table.cell(rowspan: 1, colspan: 1)[Cuts
], table.cell(rowspan: 1, colspan: 1)[Uniform spin cuts and loop estimates
], table.cell(rowspan: 1, colspan: 1)[The $x$-dependent open-cell table and complete first-color/status histories
],
  table.cell(rowspan: 1, colspan: 1)[Normalization
], table.cell(rowspan: 1, colspan: 1)[An absolutely convergent finite-volume series
], table.cell(rowspan: 1, colspan: 1)[An implicit positive constant $sigma \( x \)$ for each fixed $x$
],
  table.cell(rowspan: 1, colspan: 1)[Limit
], table.cell(rowspan: 1, colspan: 1)[Harmonic boundary profile plus a Dirichlet GFF
], table.cell(rowspan: 1, colspan: 1)[A zero-Dirichlet GFF
],
)
]],
  caption: [Table 1: The two integer-height articles retain separate model-specific proofs. The common reflection, pin-motion, and moment strategy does not identify their normalization constants or extend the weighted theorem to two-arc boundary data. ],
)

Reflection positivity provides a classical route from spatial symmetries to positive transfer operators;
  see Fröhlich–Israel–Lieb–Simon #cite(label("FILS1978")) and the scalar spectral discussion of Usui
  #cite(label("Usui2012")) Sections 3–4. Here the original edge interaction factorizes across a row of sites.
  We prove the associated positive normal transfer, including its phase-augmented form, directly.
  Appendix 8 constructs the scalar measures needed for its Cauchy representation and for analytic translation.

The six-vertex GFF theorem of Duminil-Copin, Kozlowski, Lammers,
  and Manolescu provides substantial methodological precedents through transfer spectra, analytic translation,
  and harmonic multipoint functions #cite(label("DCKLM2026")) Section 4.5; Lemma 7.4; Section 7.2.
  Their result concerns a full-plane zero-slope state on the square lattice for $a = b =
  1$ and $c in \[ sqrt(3) \, 2 \]$. Its covariance normalization uses surface tension and Bethe ansatz.
  Our plane coefficient is fixed by a three-mirror angular identity and a signed cutoff limit;
  the passage to the actual bounded-domain boundary additionally uses weighted rare-pin comparisons and boundary
  attachment. The final collision-to-moment argument also has a precedent in Kenyon’s identification of
  dimer-height correlations #cite(label("Kenyon2001")) Lemma 3.1 and Proposition 3.2.
  In the present model the collision coefficient comes from conditional local matching and logarithmic harmonic
  expansions.

A related six-vertex result #cite(label("BalancedSixVertexGFF2026")) Theorem 1.1 establishes the GFF limit for
  $a = b = 1$ and every fixed $c in \( 0 \, 2 \]$, in the zero-slope plane law defined by its prescribed iterated
  limit of balanced tori.

The conclusion strengthens logarithmic variance estimates to a limit law for the entire distribution-valued field.
  Identifying a covariance is only one part of this conclusion:
  the proof also establishes Gaussian higher moments, the zero boundary condition, and tightness.
  The parameter interval includes both the uniform height model $x = 1$ and its predicted critical endpoint $x =
  1 \/ sqrt(2)$.

=== 1.3 Structure of the proof <structure-of-the-proof>

===== 1.3.1 Exact weighted cuts and conditional order. <exact-weighted-cuts-and-conditional-order.>

Section 2 encodes a height modulo four by two spins and augments each upward triangular cell with a status.
  An open circuit fixes the first spin while leaving the second spin free.
  The resulting cell factorization gives an exact conditional cut.
  The order statement is proved for histories which record every first-spin site of an observed cell.
  This restriction is essential: conditioning on a status alone need not preserve positive association.
  Stopped explorations then give local mixing and multiplicative comparisons for separated pins.

===== 1.3.2 Uniform moments and the plane coefficient. <uniform-moments-and-the-plane-coefficient.>

Section 3 proves moment bounds for smeared heights, including irregular domains exposed by explorations.
  A discrete midpoint inequality of Klartag–Lehec #cite(label("KlartagLehec2019")) Theorem 1.4,
  in the nonnegative-function form of #cite(label("GRST2019")) Theorem 3,
  amplifies central probability bounds to all moments. We derive the finite-support zero case directly from
  #cite(label("GRST2019")) Theorem 8, then verify the multidimensional application and rounding conditions
  explicitly. In Section 4, site reflection positivity gives a positive normal transfer operator.
  Its covariance is a mixture of Cauchy kernels in normal frequency.
  An angular identity using all three mirror directions forces every scaling limit of the spectral measure to be
  $c thin thin upright(d) p \/ \| p \|^2$. A signed cutoff identity proves uniqueness of $c$,
  and a two-disk variance bound proves $c > 0$. With our Fourier convention,

#[#set math.equation(numbering: n => "(1.5)")
 $ v = \( 2 pi \)^2 c \, wide sigma \( x \) = sqrt(v) . $ <eq:normalization>]

===== 1.3.3 Pins, reflection, and the true boundary. <pins-reflection-and-the-true-boundary.>

Section 5 compares the field with upper and lower pinning brackets.
  Uniform normalized moment bounds allow analytic movement of separated pins in three directions.
  Averaging their phases and then closing the gaps transfers the reflection-null Laplace insertion from the plane
  to these brackets. Section 6 proves the boundary attachment estimate:
  a synthetic boundary law gives a favorable level path, and a deterministic attachment argument connects it to
  the required boundary segment. Iterating in tubes yields boundary arches, makes the bracket means vanish,
  and controls boundary reference averages.

===== 1.3.4 Harmonic moments and the full field law. <harmonic-moments-and-the-full-field-law.>

Section 7 first establishes distributional tightness and uniform integrability.
  The ordered coupling and the vanishing bracket means then identify the bracket limits with the true field and
  transfer the insertion identity to it. The insertion and boundary references make every limiting moment
  distribution separately harmonic away from collisions. Logarithmic moment bounds exclude distributions supported
  on the diagonals. Local comparison with the plane fixes the coefficient of every collision singularity.
  Subtracting the corresponding Green functions gives Wick’s recursion, which determines the Gaussian law.
  This completes the proof of Theorem 2.

=== 1.4 Conventions <conventions>

The parameter $x$ is fixed. Constants may depend on $x$ and on a stated fixed macroscopic arrangement;
  this dependence is not asserted to be uniform over the parameter interval.
  The symbols $C \, c \, alpha$ denote positive constants whose value may change between occurrences.
  A test at radius $r$ has support in a ball of that radius and magnitude $O \( r^(- 2) \)$.
  A zero-total test has integral zero. On the full plane we use

$ hat(f) \( p \) = integral_(bb(R)^2) e^(- i p dot.op z) f \( z \) thin upright(d) z \, wide
  chevron.l f \, \( - Delta \)^(- 1) g chevron.r = frac(1, \( 2 pi \)^2) integral_(bb(R)^2)
  frac(overline(hat(f) \( p \)) hat(g) \( p \), \| p \|^2) thin upright(d) p $

for real smooth compactly supported zero-total tests. The symbol $H$ denotes a generic integer lift in the
  discrete representations; it is distinct from the hexagonal lattice $bb(H)$.

Every argument involving collars, windows, disks, or tubes first fixes their positive macroscopic widths and
  separations, then sends $delta arrow.b 0$. Limits that close gaps, shrink windows,
  or approach the boundary are taken afterward. A bound for fixed geometry is not used uniformly for a
  degenerating geometry. Explorations are stopped before inspecting the interior region whose conditional Gibbs
  law is subsequently used.

== 2 Exact cuts and conditional comparison <sec:discrete>

Throughout this section $x in \[ 1 \/ sqrt(2) \, 1 \]$ is fixed. We first work in lattice units.
  A finite ambient graph $G = \( V \, E \)$ is a connected induced subgraph of $bb(T)$ whose bounded faces are
  elementary triangles and whose union is a topological disk. We can always take a large regular hexagon.
  Holes in a height domain will be represented by fixed sites in such an ambient graph,
  rather than by deleting triangles. This distinction is needed in the wall factorization below.

The cell representation below will provide three conclusions:
  an exact conditional factorization across open circuits, order under observations that record a cell together
  with all its first-spin sites, and a multiplicative comparison for separated pin events.
  The last comparison remains useful when each pin event has probability tending to zero.
  We first construct the cell law whose open circuits make all three statements possible.

=== 2.1 Spins, cells, and exact cuts <spins-cells-and-exact-cuts>

Associate to an integer $H$ the two spins $\( B \, W \)$ given by

#[#set math.equation(numbering: n => "(2.1)")
 $ H med \( mod med 4 \) & 0 & 1 & 2 & 3\
\( B \, W \) & \( + \, + \) & \( + \, - \) & \( - \, - \) & \( - \, + \) . $ <discrete:gray>]

Call a spin pair coherent if on each edge at least one of its two spins is constant. Its free weight on $G$ is

#[#set math.equation(numbering: n => "(2.2)")
 $ product_(u v in E) x^(upright(bold(1)) { \( B_u \, W_u \) eq.not \( B_v \, W_v \) }) thin upright(bold(1))
   { \( B \, W \) upright(" is coherent") } . $ <discrete:pair-weight>]

All ambient finite-volume laws in this section use this edge convention.

#thm([Lemma 2.1.])[
  (Integer lift).  #emph[Every coherent pair on $G$ has an integer Lipschitz lift,
    unique up to addition of a multiple of four once the correspondence (2.1) is fixed.
    For the oriented edge $u v$ its increment is
#[#set math.equation(numbering: n => "(2.3)")
 $ H_v - H_u = frac(W_u B_v - B_u W_v, 2) . $ <discrete:increment>]

 The free spin law induces the weighted height-increment law with one height anchored.
   Fixing a constant pair on a connected skeleton, and fixing the lift there,
   induces the usual weighted height Gibbs law in each bounded face of the skeleton.]
] <lem:spin-lift>

#proof[
  The right side of (2.3) is $0$, $1$, or $- 1$, and has the required residue in (2.1).
    A triangle cannot have both spins nonconstant: each nonconstant binary spin changes on two triangle edges,
    and these two pairs of edges must intersect. If $B$ is constant on a triangle, (2.3) is $-
    B thin d W \/ 2$ there; if $W$ is constant, it is $W thin d B \/ 2$. Its circulation therefore vanishes.
    Every cycle of the triangulated disk is a sum of its triangle boundaries, so the increments integrate to $H$.
    The four choices of the anchor residue give four equally weighted spin representations of each anchored
    increment configuration: cyclic rotation of the states in (2.1) preserves all increments and the weight.
    Finally each disagreeing pair contributes exactly one factor $x$.
    Fixing the connected trace fixes the lift on the whole skeleton,
    and the remaining edge factors are precisely those of the height Gibbs specification. ◻
]

Let $Y$ be the centers of the upward-pointing elementary triangles,
  viewed as one partite class of the dual honeycomb lattice.
  Each primal edge belongs to exactly one such triangle. At the ambient boundary a cell can be clipped to a single
  edge; cells containing at most one site have no interaction.
  For an interacting cell $y$ write $V_y$ for its two or three sites and put

$ q_y = cases(delim: "{", x^2 \, & \| V_y \| = 3 \,, x \, & \| V_y \| = 2 .) $

Introduce an open/closed variable by the following joint weights:

#[#set math.equation(numbering: n => "(2.4)")
 $ upright("status") & upright("allowed spins") & upright("weight")\
upright("open") & B upright(" constant on ") V_y \, med W upright(" arbitrary") & q_y\
upright("closed") & B \, W upright(" both constant on ") V_y & 1 - q_y\
upright("closed") & B upright(" nonconstant") \, med W upright(" constant on ") V_y & q_y . $ <discrete:cell-table>]

An open cell is denoted $+$ or $-$ according to its constant $B$ value, and a closed cell is denoted $0$;
  thus $tau_y in { - \, 0 \, + }$. An interior nonconstant triangle has two changing edges.
  Summing (2.4) consequently gives (2.2), including the clipped edge convention.

We permit arbitrary deterministic $B$ pins and deterministic equalities $W_u = W_v$ on a set $E_0 subset E$.
  These equalities are not prescribed component labels. Given $\( B \, tau \)$,
  form the graph containing the edges of all closed cells and all edges of $E_0$, with isolated sites included.
  The conditional $W$ law labels its connected components by independent fair signs.
  In particular, if $m$ connected subgraphs have already been required to have constant $W$,
  the conditional probability that all their labels are plus lies in $\[ 2^(- m) \, 1 \]$.
  This includes singleton subgraphs and allows several prescribed subgraphs to belong to the same component.

A honeycomb edge is #emph[authorized with sign $s$] if its endpoint in $Y$ has $tau_y = s$.
  A good path or circuit of sign $s$ uses authorized edges.
  We only use these paths away from clipped ambient cells. The faces adjacent to a good path have $B =
  s$ and their connected face chain therefore has a height trace in one pair of consecutive integers.
  A nearest-neighbor path of good $Y$ vertices can be converted into a honeycomb walk by joining successive
  vertices through their common honeycomb neighbor. The displacement is bounded in lattice units.
  A closed walk with nonzero winding around a target contains a simple surrounding circuit.
  All geometric constructions below have positive clearance,
  so this conversion preserves their requirements for sufficiently fine mesh.

#thm([Lemma 2.2.])[
  (Open-cell cut).  #emph[Let $gamma$ be a simple honeycomb circuit strictly inside the ambient graph.
    Prescribe $tau_y = s$ at every $y in Y ∩ gamma$. Suppose no edge of $E_0$ crosses $gamma$.
    Conditional on these prescriptions and any deterministic constraints on the two respective sides,
    the two sides are independent after their prescribed first-spin layers are identified.
    On the inside, all cells centered strictly inside retain their original weights;
    crossing cells contribute constants and impose no condition on $W$.
    This inside law depends only on $gamma$, $s$, and the constraints inside.
    Given the complete height trace of the inside boundary layer,
    its free sites have the ordinary weighted height Gibbs law, with any additional inside constraints retained.]
] <lem:cell-cut>

#proof[
  Every interacting cell meeting both sides has its honeycomb center on $gamma$.
    Its open prescription fixes every incident first spin to $s$,
    and its factor in (2.4) is the constant $q_y$ for every choice of its second spins.
    All remaining factors involve sites on one side only. Equality edges do not cross by assumption.
    The product weight and its partition sum thus factor. In particular,
    complementary components cannot cross the circuit. After specifying the complete inner height layer,
    the spin lift and the edge weights in Lemma 3 give the claimed height specification.
    No first-spin agreement event without the open-cell prescriptions has been used in this factorization. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, -1.25), (15, 5.3), stroke: none)
  content((0, 5.05), [#text(size: 9pt)[\(a\) An open interaction cell]], anchor: "west", padding: 0.1176cm)
  line((0.65, 1.35), (3.85, 1.35), (2.25, 4.12), close: true, fill: rgb("#f7f7f7"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((1.45, 2.735), (2.25, 2.273), (3.05, 2.735), stroke: (thickness: 1.3pt, cap: "round", join: "round"))
  content((1.44, 2.78), [#text(size: 9pt)[$gamma$]], anchor: "south-east", padding: 0.1176cm)
  circle((2.25, 2.273), radius: 0.08114, fill: black, stroke: none)
  content((2.25, 2.13), [#text(size: 9pt)[$tau_y=+$]], anchor: "north", padding: 0.1176cm)
  circle((0.65, 1.35), radius: 0.08114, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  circle((3.85, 1.35), radius: 0.08114, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  circle((2.25, 4.12), radius: 0.08114, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((2.25, 4.2), [#text(size: 9pt)[$B=+$, $W_3$ free]], anchor: "south", padding: 0.1176cm)
  content((0.65, 1.18), [#text(size: 9pt)[$B=+$#linebreak()$W_1$ free]], anchor: "north", padding: 0.1176cm)
  content((3.85, 1.18), [#text(size: 9pt)[$B=+$#linebreak()$W_2$ free]], anchor: "north", padding: 0.1176cm)
  content((2.25, -0.35), [#text(size: 9pt)[Cell weight $q=x^2$#linebreak()independent of $(W_1,W_2,W_3)$]])
  content((5.65, 5.05), [#text(size: 9pt)[\(b\) A prescribed open-cell circuit]], anchor: "west", padding: 0.1176cm)
  rect((6.831, 0.3774), (14.28, 4.733), fill: rgb("#f0f0f0"), stroke: none)
  line((8.82, 2.256), (8.82, 2.844), (9.33, 3.139), (9.33, 3.728), (9.84, 4.022), (10.35, 3.728), (10.86, 4.022), (11.37, 3.728), (11.37, 3.139), (11.88, 2.844), (11.88, 2.256), (11.37, 1.961), (11.37, 1.372), (10.86, 1.078), (10.35, 1.372), (9.84, 1.078), (9.33, 1.372), (9.33, 1.961), close: true, fill: rgb("#ffffff"), stroke: none)
  line((7.8, 2.256), (7.8, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((7.8, 2.256), (8.31, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((7.8, 2.844), (8.31, 3.139), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.31, 1.372), (8.31, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.31, 1.372), (8.82, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.31, 1.961), (8.82, 2.256), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.31, 3.139), (8.31, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.31, 3.139), (8.82, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.31, 3.728), (8.82, 4.022), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 0.4889), (8.82, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 0.4889), (9.33, 0.1944), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 1.078), (9.33, 1.372), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 2.256), (8.82, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 2.256), (9.33, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 2.844), (9.33, 3.139), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 4.022), (8.82, 4.611), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 4.022), (9.33, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 4.611), (9.33, 4.906), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 0.1944), (9.84, 0.4889), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 1.372), (9.33, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 1.372), (9.84, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 1.961), (9.84, 2.256), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 3.139), (9.33, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 3.139), (9.84, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 3.728), (9.84, 4.022), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.33, 4.906), (9.84, 4.611), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 0.4889), (9.84, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 0.4889), (10.35, 0.1944), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 1.078), (10.35, 1.372), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 2.256), (9.84, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 2.256), (10.35, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 2.844), (10.35, 3.139), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 4.022), (9.84, 4.611), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 4.022), (10.35, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((9.84, 4.611), (10.35, 4.906), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 0.1944), (10.86, 0.4889), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 1.372), (10.35, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 1.372), (10.86, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 1.961), (10.86, 2.256), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 3.139), (10.35, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 3.139), (10.86, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 3.728), (10.86, 4.022), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.35, 4.906), (10.86, 4.611), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 0.4889), (10.86, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 0.4889), (11.37, 0.1944), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 1.078), (11.37, 1.372), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 2.256), (10.86, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 2.256), (11.37, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 2.844), (11.37, 3.139), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 4.022), (10.86, 4.611), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 4.022), (11.37, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((10.86, 4.611), (11.37, 4.906), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 0.1944), (11.88, 0.4889), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 1.372), (11.37, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 1.372), (11.88, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 1.961), (11.88, 2.256), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 3.139), (11.37, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 3.139), (11.88, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 3.728), (11.88, 4.022), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.37, 4.906), (11.88, 4.611), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.88, 0.4889), (11.88, 1.078), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.88, 1.078), (12.39, 1.372), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.88, 2.256), (11.88, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.88, 2.256), (12.39, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.88, 2.844), (12.39, 3.139), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.88, 4.022), (11.88, 4.611), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((11.88, 4.022), (12.39, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((12.39, 1.372), (12.39, 1.961), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((12.39, 1.961), (12.9, 2.256), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((12.39, 3.139), (12.39, 3.728), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((12.39, 3.139), (12.9, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((12.9, 2.256), (12.9, 2.844), stroke: (paint: rgb("#bfbfbf"), thickness: 0.3pt, cap: "round", join: "round"))
  line((8.82, 2.256), (8.82, 2.844), (9.33, 3.139), (9.33, 3.728), (9.84, 4.022), (10.35, 3.728), (10.86, 4.022), (11.37, 3.728), (11.37, 3.139), (11.88, 2.844), (11.88, 2.256), (11.37, 1.961), (11.37, 1.372), (10.86, 1.078), (10.35, 1.372), (9.84, 1.078), (9.33, 1.372), (9.33, 1.961), close: true, stroke: (thickness: 1.25pt, cap: "round", join: "round"))
  circle((8.82, 2.256), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((8.82, 2.844), radius: 0.06703, fill: black, stroke: none)
  circle((9.33, 3.139), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((9.33, 3.728), radius: 0.06703, fill: black, stroke: none)
  circle((9.84, 4.022), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((10.35, 3.728), radius: 0.06703, fill: black, stroke: none)
  circle((10.86, 4.022), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((11.37, 3.728), radius: 0.06703, fill: black, stroke: none)
  circle((11.37, 3.139), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((11.88, 2.844), radius: 0.06703, fill: black, stroke: none)
  circle((11.88, 2.256), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((11.37, 1.961), radius: 0.06703, fill: black, stroke: none)
  circle((11.37, 1.372), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((10.86, 1.078), radius: 0.06703, fill: black, stroke: none)
  circle((10.35, 1.372), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((9.84, 1.078), radius: 0.06703, fill: black, stroke: none)
  circle((9.33, 1.372), radius: 0.06703, fill: rgb("#ffffff"), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  circle((9.33, 1.961), radius: 0.06703, fill: black, stroke: none)
  content((8.31, 2.55), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((8.82, 3.433), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((9.33, 4.317), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((8.82, 1.667), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((9.33, 2.55), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((9.84, 3.433), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((10.35, 4.317), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((9.33, 0.7833), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((9.84, 1.667), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  circle((10.35, 2.55), radius: 0.03528, fill: black, stroke: none)
  content((10.86, 3.433), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((11.37, 4.317), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((10.35, 0.7833), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((10.86, 1.667), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((11.37, 2.55), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((11.88, 3.433), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((11.37, 0.7833), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((11.88, 1.667), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((12.39, 2.55), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.02117cm, fill: rgb("#ffffff"), stroke: none)
  content((10.35, 2.193), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[interior]]])])
  content((12.24, 4.345), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#f0f0f0"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[tested side]]])], anchor: "west")
  content((12.29, 3.264), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#f0f0f0"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$gamma$]]])], anchor: "west")
  circle((6.15, -0.13), radius: 0.06703, fill: black, stroke: none)
  content((6.28, -0.13), [#text(size: 9pt)[$Y$-cell on $gamma$: $tau_y=+$]], anchor: "west", padding: 0.1176cm)
  content((10.5, -0.13), [#text(size: 9pt)[$+$: prescribed $B$ site]], anchor: "west", padding: 0.1176cm)
  content((6.05, -0.72), [#text(size: 9pt)[$W$ is unobserved; no $E_0$ edge crosses $gamma$.]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: An exact open-cell cut. In (a), prescribing $B = +$ and $tau_y = +$ gives the constant cell weight $q = x^2$ for every second-spin assignment. In (b), filled circuit vertices are open-plus $Y$ cells; plus signs mark their prescribed first-spin sites. The tested exterior is shaded. No equality edge crosses $gamma$, and the unobserved second spins have no component joining its two sides. Strictly interior cells retain their original interactions. ],
) <discrete:fig-cut>

Here is the only crossing estimate imported into the discrete argument.
  The boundary convention in its statement is part of the theorem.

#thm([Theorem 2.3.])[
  (Glazman–Lammers circuit input).  #emph[For $r gt.eq 0$, let $Lambda_r$ be the ball of radius $r$ in the
    triangular graph metric, with its bounding honeycomb contour; thus $Lambda_r = Lambda_(floor.l r floor.r)$.
    For $a > 1$ and an integer $n in bb(N)$, consider on $Lambda_(a n)$ the cell spin law whose interior cells
    have weight $\( x^2 \)^(upright(bold(1)) { B upright(" or ") W upright(" nonconstant") })$ and whose boundary
    $Y$ cells are excluded. Fix $B = -$ on the boundary face layer and leave $W$ free.
    There is $c = c \( x \, a \) > 0$ such that, for $n gt.eq 3 \/ \( a - 1 \)$,
    the probability of an occupied open-plus cell circuit surrounding $Lambda_n$ and contained in $Lambda_(a n)$
    is at least $c$. The same statement holds with the signs or the two spin colors interchanged.]
] <thm:circuit-input>

This is equation (55) in Appendix A of the third arXiv version of #cite(label("GL2025")),
  with Definitions 3.2 and 3.5. Its augmentation includes a cell whenever $W$ is nonconstant,
  excludes it whenever $B$ is nonconstant, and otherwise includes it with probability $x^2$.
  It is therefore exactly (2.4).
  The source uses $Y \( Omega \) = \( Y ∩ V \( Omega \) \) \\ V \( partial Omega \)$;
  simply pinning $B = -$ in our edge-weight law would still charge certain boundary $W$ changes.
  Lemma 4 instead identifies the source law with the law inside a prescribed regular open-minus circuit:
  the excluded boundary factors become constants. This is also the conditional law described by Lemma 3.8 of
  #cite(label("GL2025")). We use the theorem only through this exact identification,
  with fixed slack for lattice rounding. In particular its validity includes $x = 1 \/ sqrt(2)$.

=== 2.2 Restricted histories and the two-law inequality <restricted-histories-and-the-two-law-inequality>

A #emph[history] fixes some first-spin sites and some cell statuses,
  with the rule that it fixes #emph[all] first-spin sites of every observed cell.
  The equality set $E_0$ remains deterministic. No second-spin component labels are part of a history.
  Order first spins by $- < +$ and statuses by $- < 0 < +$.
  Ordered histories have the same observation sets and ordered values.
  They may also have additional deterministic plus $B$ pins only in the upper law,
  or additional deterministic minus $B$ pins only in the lower law, compatible with the common pins.

#thm([Proposition 2.4.])[
  (Association and conditional order).  #emph[For every feasible history,
    the unobserved $\( B \, tau \)$ variables are positively associated.
    Two laws with ordered histories and common $E_0$ are stochastically ordered,
    including the unequal extreme pins just described. Extra prescribed open-plus cells only in the upper law,
    or open-minus cells only in the lower law, can be incorporated by observing those cells and all their
    first-spin sites also in the other law. These claims hold for clipped cells and at $x = 1$.]
] <prop:history-order>

We first prove two finite-weight inequalities used in the proof of this proposition, then apply them to the cell law.

We use the finite association inequality of Fortuin–Kasteleyn–Ginibre #cite(label("FKG1971")),
  including weights that vanish. Its precise form follows from the rounded-midpoint inequality stated and
  tensorized in Theorem 18: for nonnegative finitely supported arrays, the premise $f \( b \) g \( c \) lt.eq
  u \( floor.l \( b + c \) \/ 2 floor.r \) v \( ceil.l \( b + c \) \/ 2 ceil.r \)$ implies
  $\( sum f \) \( sum g \) lt.eq \( sum u \) \( sum v \)$. Indeed,
  on a Boolean cube the rounded midpoints of $b \, c$ are their coordinatewise minimum $b and
  c$ and maximum $b or c$. If a nonnegative weight $w$ satisfies $w \( b \) w \( c \) lt.eq
  w \( b and c \) w \( b or c \)$ and $F \, G$ are nonnegative increasing functions, then

$ w \( b \) F \( b \) w \( c \) G \( c \) lt.eq w \( b and c \) w \( b or c \) F \( b or c \) G \( b or c \) . $

Apply the midpoint inequality to $w F \, w G \, w \, w F G$, extended by zero outside the cube.
  Its conclusion is $\( sum w F \) \( sum w G \) lt.eq \( sum w \) \( sum w F G \)$,
  which is association after normalization. Encode an element of a finite chain by a prefix of ones followed by
  zeros. The encoded product of chains is closed under minimum and maximum,
  so extension by zero proves the same result there. Adding constants to bounded increasing functions covers
  signed functions. This deduction explains every finite association use below;
  the midpoint tensorization itself uses no association statement.

The wall decomposition below expresses the first-spin weight using two partition sums for the complementary spin.
  We record the two properties of those sums needed to compare first-spin configurations.

#thm([Lemma 2.5.])[
  (The complementary-spin partition sum).  #emph[For $a in \[ 0 \, 1 \]^E$ define
#[#set math.equation(numbering: n => "(2.5)")
 $ Z \( a \) = sum_(sigma in { - \, + }^V) product_(e = u v in E)
   a_e^(upright(bold(1)) { sigma_u eq.not sigma_v }) \, wide 0^0 = 1 . $ <discrete:ising-Z>]

 Then $Z$ is increasing in every coordinate and is log-supermodular:
#[#set math.equation(numbering: n => "(2.6)")
 $ Z \( a and b \) Z \( a or b \) gt.eq Z \( a \) Z \( b \) . $ <discrete:Z-lattice>]

]
] <discrete:ising-partition>

#proof[
  Monotonicity follows term by term. For positive coordinates the second assertion follows by differentiating in
    $log a_e$. For distinct edges $e = u v$ and $f = s t$,
  $ frac(partial^2 log Z, partial log a_e thin partial log a_f) =
    "Cov" \( upright(bold(1)) { sigma_u eq.not sigma_v } \, upright(bold(1)) { sigma_s eq.not sigma_t } \) = 1 /
    4 "Cov" \( sigma_u sigma_v \, sigma_s sigma_t \) gt.eq 0 . $
  The last inequality is a special case of the second Griffiths inequality #cite(label("GKS1968"));
    we recall its random-cluster proof #cite(label("FKG1971")) p. 102.
    Put $J_e = - 1 / 2 log a_e gt.eq 0$ and $p_e = 1 - e^(- 2 J_e) = 1 - a_e$. Expanding
  $ e^(J_e sigma_u sigma_v) = e^(J_e) #scale(x: 120%, y: 120%)[\(] \( 1 - p_e \) +
    p_e upright(bold(1)) { sigma_u = sigma_v } #scale(x: 120%, y: 120%)[\)] $
  over edges gives a joint spin–bond law whose bond marginal on $omega subset E$ has weight
  $ 2^(k \( omega \)) product_(e in omega) p_e product_(e in.not omega) \( 1 - p_e \) \, $
  where $k \( omega \)$ counts all connected components, including isolated vertices.
    This weight satisfies the lattice condition. Indeed, if $cal(C) \( A \)$ is the binary cycle space of the edge
    set $A$, then $cal(C) \( A \) ∩ cal(C) \( B \) = cal(C) \( A ∩ B \)$ and $cal(C) \( A \) +
    cal(C) \( B \) subset cal(C) \( A union B \)$. Taking dimensions and using $k \( A \) = \| V \| - \| A \| +
    dim cal(C) \( A \)$ proves supermodularity of $k$; the remaining edge factors are modular.
    The FKG theorem #cite(label("FKG1971")) therefore associates increasing bond events.
    Conditional on $omega$, the spins are independent fair signs on its components.
    Consequently $bb(E) \( sigma_u sigma_v \) = bb(P) \( u arrow.l.r v \)$,
    while the conditional expectation of $sigma_u sigma_v sigma_s
    sigma_t$ is one precisely when each component contains an even number of the four listed vertices,
    counted with multiplicity, and is zero otherwise. In particular
  $ bb(E) \( sigma_u sigma_v sigma_s sigma_t \) gt.eq bb(P) \( u arrow.l.r v \, med s arrow.l.r t \) gt.eq
    bb(P) \( u arrow.l.r v \) bb(P) \( s arrow.l.r t \) . $
  This proves the required covariance inequality, also when the edges share vertices.
    The cases $p_e in { 0 \, 1 }$ follow by continuity. Integrating the nonnegative mixed derivatives over
    coordinate rectangles gives (2.6); continuity of the polynomial $Z$ includes its zero-coordinate cases. ◻
]

#proof[
  We first sum the second spins by splitting their walls according to the first-spin sign.
    Lemma 7 will give the two-law inequality for this marginal. We then restore the statuses.
  Fix a first-spin configuration $b$. A binary edge set is a second-spin wall precisely when it has even
    intersection with every triangle boundary. Indeed this condition makes its mod-two integral independent of the
    path from a fixed anchor, since triangle boundaries generate the cycle space.
    There are exactly two spin labelings for each such wall. Every allowed wall edge has homogeneous $b$
    endpoints. Split these edges according to their common sign. A homogeneous triangle has only one sign class.
    A mixed triangle has just one homogeneous edge, which its even rule forces to be absent.
    Thus none of the triangle equations couples the two sign classes.
    Each sign restriction of an allowed wall is itself a wall,
    and arbitrary walls supported in the two allowed sign sets can be combined.
    This proves factorization without an additional global compatibility condition.
  For an unobserved cell let $r_y \( b \) = 1$ if $b$ is homogeneous there and $r_y \( b \) = q_y$ otherwise.
    Define $a_h^(+) \( b \)$ as follows: it equals $x$ on edges of unobserved homogeneous-plus cells,
    equals $1$ on observed open-plus cells, and is zero on all other edges. Set it to zero also on $E_0$.
    Define $a_h^(-) \( b \)$ with minus in place of plus. Summing the unobserved statuses and then the second
    spins gives the first-spin weight
  #[#set math.equation(numbering: n => "(2.7)")
   $ w_h \( b \) = c_h / 2 thin product_(y upright(" unobserved")) r_y \( b \) thin Z \( a_h^(+) \( b \) \)
     Z \( a_h^(-) \( b \) \) thin upright(bold(1)) { b upright(" satisfies its fixed sites") } .
     $ <discrete:wall-factor>]
  Here $c_h > 0$ is the product of the observed-cell factors;
    these are constants because their first spins are fixed. The factor $1 \/ 2$ is exact:
    each $Z$ counts two global signs whereas the actual second-spin sum counts only two, not four.
    In particular $E_0$ deletes wall coordinates and does not impose a relation between the two global signs.
    Formula (2.7) would in general fail on a graph with a hole if the missing cycle constraints were omitted,
    explaining our ambient triangulation convention.
  Let $h_(-) lt.eq h_(+)$ be ordered histories. For any $b$ in the lower support and $c$ in the upper support,
    $b and c$ belongs to the lower support and $b or c$ to the upper support,
    also when pins occur in just one law. On an unobserved cell,
    homogeneous-plus eligibility at the meet is the intersection of the input eligibilities;
    at the join it contains their union. Therefore, coordinatewise,
  $ a_(h_(-))^(+) \( b and c \) & gt.eq a_(h_(-))^(+) \( b \) and
    a_(h_(+))^(+) \( c \) \, & a_(h_(+))^(+) \( b or c \) & gt.eq a_(h_(-))^(+) \( b \) or a_(h_(+))^(+) \( c \) \,\
a_(h_(-))^(-) \( b and c \) & gt.eq a_(h_(-))^(-) \( b \) or a_(h_(+))^(-) \( c \) \, &
  a_(h_(+))^(-) \( b or c \) & gt.eq a_(h_(-))^(-) \( b \) and a_(h_(+))^(-) \( c \) . $
  On observed cells the plus vectors are already ordered and the minus vectors reverse-ordered;
    hence the same inequalities hold there. Deleting the common coordinates $E_0$ preserves all four inequalities.
    Furthermore
  $ r_y \( b and c \) r_y \( b or c \) gt.eq r_y \( b \) r_y \( c \) . $
  To check this last assertion, comparable restrictions are unchanged by sorting.
    For incomparable restrictions both inputs are mixed, whereas each output has weight at least $q_y$.
    A homogeneous input is extremal and cannot be lost. Applying monotonicity and (2.6) to each sign in (2.7) now proves
  #[#set math.equation(numbering: n => "(2.8)")
   $ w_(h_(-)) \( b and c \) w_(h_(+)) \( b or c \) gt.eq w_(h_(-)) \( b \) w_(h_(+)) \( c \) . $ <discrete:two-law>]
  Observed-cell constants cancel. This also proves the lattice condition within either first-spin law.
  For clarity, zero weights and unequal supports cause no invocation of an unstated strictly positive version of
    Holley’s criterion #cite(label("Holley1974")). Extend the weights by zero to the whole first-spin cube and put
    $tilde(w) \( b \, 0 \) = w_(h_(-)) \( b \)$, $tilde(w) \( b \, 1 \) = w_(h_(+)) \( b \)$.
    The two within-layer inequalities and (2.8) say that $tilde(w)$ satisfies the lattice condition on the cube
    times ${ 0 \, 1 }$. The nonnegative-weight FKG theorem #cite(label("FKG1971")) applies.
    For increasing $f$, its positive covariance with the last coordinate says exactly $bb(E)_(h_(-)) f \( B \)
    lt.eq bb(E)_(h_(+)) f \( B \)$. The same theorem gives association of each first-spin law.
    This proves the needed extension to sorted supports.
  It remains to restore statuses. Given $b$, each unobserved homogeneous cell is eligible to open with its sign;
    mixed cells are necessarily closed. Let $S_(+)$ and $S_(-)$ be the two open subsets of eligible cells.
    Wall factorization now gives independent weights for these subsets.
    Apart from constants their respective weights are
  #[#set math.equation(numbering: n => "(2.9)")
   $ product_(y in S_s) q_y product_(y in I_s \\ S_s) \( 1 - q_y \) thin Z #scale(x: 120%, y: 120%)[\(]
     upright(bold(1)) { e upright(" lies in an open cell of sign ") s } upright(bold(1)) { e in.not E_0 }
     #scale(x: 120%, y: 120%)[\)] \, $ <discrete:subset-weight>]
  where $I_s$ is the eligible set and observed open cells of sign $s$ are included as fixed allowed cells in the
    last factor. Different cells have disjoint edge sets. The Bernoulli factor is modular;
    the $Z$ factor is log-supermodular in the cell set by (2.6). Thus each subset law is associated.
    The same two-law calculation shows stochastic increase under enlarging $I_s$ or the fixed allowed cells:
    on a common subset cube the sorted allowed-edge sets contain the coordinatewise intersection and union,
    and the Bernoulli factors cancel. Ineligible cells are held closed.
    The preceding nonnegative-weight argument again handles these deterministic restrictions.
  Increasing $b$ enlarges plus eligibility and shrinks minus eligibility.
    Hence $S_(+)$ increases and $S_(-)$ decreases in inclusion order, exactly the status order $- < 0 < +$.
    Association of the minus block is also association in reverse inclusion order,
    since the covariance of decreasing functions equals that of their negatives. The two blocks are independent.
    If $F \, G$ are increasing functions of $\( B \, tau \)$,
    conditional association gives $bb(E) \( F G divides B \) gt.eq
    bb(E) \( F divides B \) bb(E) \( G divides B \)$; the two conditional expectations are increasing in $B$.
    Association of $B$ completes the joint association claim.
    An ordered coupling of the first spins followed by ordered conditional status kernels gives the two-law assertion.
  If $q_y = 1$, a homogeneous unobserved cell is open deterministically,
    and an observed homogeneous closed cell is infeasible. All displayed inequalities remain valid on feasible
    supports, either directly or by continuity as $q_y arrow.t 1$; no division by $1 - q_y$ is used.
    Finally an extra open-plus cell in the upper law has the maximum possible status and first-spin values.
    Querying that same block in the lower law always gives ordered values and retains its correct distribution.
    This is observation in the other law, not imposition of the upper event on it. The open-minus case is symmetric. ◻
]

#prodef([Remark 2.6.])[
  Proposition 6 asserts association of the joint law, not the lattice condition for its unsummed density.
    Nor does it allow observation of a closed status without its first spins.
    For example, on a single triangle conditioned only to be closed, the first-spin weight is $1 -
    q$ on the two homogeneous configurations and $q$ on the six mixed ones.
    Its pair covariance is $\( 1 - 2 q \) \/ \( 1 + 2 q \) < 0$ when $q > 1 \/ 2$.
] <discrete:not-raw-FKG>

=== 2.3 Online exploration and buffered circuits <online-exploration-and-buffered-circuits>

We next specify the probabilistic meaning of coupled exploration.
  This will matter again when the remaining interior is compared with a plane sample independent of exterior
  observables.

#thm([Lemma 2.7.])[
  (Conditional kernels at a joint record).  #emph[Consider two finite-volume laws ordered as in Proposition 6.
    There is an online exploration coupling with the following invariant:
    conditional on every full joint query record, the eventual completion in either coordinate has that
    coordinate’s original Gibbs conditional law given its own observed values and deterministic constraints.
    The next cell, together with all its first spins, may be chosen as any deterministic function of the joint
    record. If the retained conditional problems become identical, their completions can be sampled identically.]
] <discrete:online>

#proof[
  At a joint record $R$ let $mu_i^R$ be the two specified own-history conditional laws.
    Select a common query block $Q = Q \( R \)$ and couple its marginals by an ordered kernel $kappa_R$,
    available from Proposition 6. For each possible pair of answers $\( a_1 \, a_2 \)$ recursively complete with
    the respective conditional laws $mu_i^R \( dot.op divides Q = a_i \)$. This is a finite recursion:
    every nonterminal query adds a new cell or site. At a terminal node with the same remaining specification,
    use one draw from that common law. At any other terminal node use any coupling of its two remaining laws.
  Backward induction proves the marginal invariant. For a completed observable $f$ in coordinate $1$,
    the expectation from the node $R$ is
  $ sum_(a_1 \, a_2) kappa_R \( a_1 \, a_2 \) mu_1^R \( f divides Q = a_1 \) =
    sum_(a_1) mu_1^R \( Q = a_1 \) mu_1^R \( f divides Q = a_1 \) = mu_1^R \( f \) . $
  The second coordinate is identical. Applying the same induction starting at any reached node gives the assertion
    conditional on the whole joint record, not merely on an individual history.
    Independent randomness used to select a query can be put in the record and conditioned on first.
    No conditioning of a previously sampled full-field coupling is involved. ◻
]

The following geometric exploration implements the lemma.
  In a prescribed annular search area authorize the honeycomb edges incident to favorable open $Y$ cells;
  edges outside the area may be declared unavailable. Start from the exterior face set for an inward search,
  or from a connected inner face layer for an outward search.
  Invade across unauthorized honeycomb edges, querying the responsible cell and its full first-spin block in both
  laws when needed. On reaching a prescribed authorized circuit with clearance the invasion cannot cross it.
  The boundary of the invaded union of honeycomb faces consists of authorized contours.
  Select the component separating the start from the protected target,
  deleting inessential excursions to obtain a simple circuit.
  In an inward search this is the boundary around the component containing the connected target;
  in an outward search it is the outer boundary of the invaded set.

There is no hidden revelation on the retained side. A queried cell touches the invaded face set.
  A honeycomb vertex strictly on one side of an edge contour touches only faces on that side.
  A queried cell meeting both sides therefore lies on the contour and is favorable open,
  so its retained first-spin sites have the prescribed contour sign.
  If a queried cell is not favorable, invasion crosses all its incident unauthorized edges;
  it cannot leave an unprescribed first-spin neighbor behind that cell.
  Thus the only retained sites queried are prescribed cut-layer first spins. Second-spin labels remain unqueried.
  In the absence of crossing $E_0$ edges, Lemma 4 identifies the stopped retained law.
  Together with Lemma 9, this proves the exact stopped-cut and common-sampling assertions for either direction of
  exploration.

#thm([Lemma 2.8.])[
  (Buffered circuits and paths).  #emph[Fix a finite collection of annuli and tubes in a bounded planar region,
    each with a positive-width buffer and with prescribed geometric clearance.
    At mesh $delta$, suppose the buffers contain no equality edge $E_0$ and no first-spin pin adverse to a
    requested sign. Then each request for good circuits, or connected good paths formed from a finite annular
    chain, has probability bounded below by a positive constant independent of $delta$ for all sufficiently small
    $delta$. The bound is uniform over feasible histories supported away from the buffers and over lattice
    translations preserving the clearances. Requests with the same sign may be combined by association;
    requests of different signs in disjoint buffers may be made successively.
    In an annular stack of fixed-ratio, separated slots between lattice scales $r$ and $L$,
    the probability of finding no requested good circuit is at most
#[#set math.equation(numbering: n => "(2.10)")
 $ C \( r \/ L \)^alpha \, $ <discrete:stack>]

 for constants $C \, alpha > 0$.]
  #emph[Moreover, conditioning a free ambient law on any deterministic collection of open-plus cells and their
    first-spin values increases every increasing event in $\( B \, tau \)$.
    This applies to a favorable path event in the ambient plane even when its path leaves the interior of a
    prescribed good contour.]
] <lem:buffer-circuits>

#proof[
  The primitive comparison takes place in a small #emph[filled] regular disk whose entire larger comparison cut
    and interior fit inside the buffer. In that disk consider a smaller regular annulus.
    Delete favorable pins in the filled disk, which can only decrease the probability of the favorable increasing
    event. Prescribing the outer cut open with the adverse sign decreases it again by Proposition 6.
    There are no other constraints inside this small outer cut.
    Lemma 4 and Theorem 5 give a positive lower bound in the resulting deterministic regular problem.
    The same comparison applies after any allowed outside history.
    For a minus request reverse all first spins and the status order.
  For gluing, use regular annuli of inner radius $rho$ and outer radius $2 rho$,
    with a small fixed geometric slack. Consecutive centers are separated by a distance strictly between $rho$ and
    $2 rho$ in the triangular graph norm. Their inner balls intersect,
    and each inner ball has a point outside the other’s outer ball.
    Any two corresponding surrounding circuits must therefore intersect:
    disjoint Jordan curves with overlapping interiors would be nested, contradicting the latter property.
    Intersecting good honeycomb paths of the same sign join. Finitely many such annuli give a connected path
    following a prescribed tube. A closed chain following a polygonal Jordan curve gives a closed walk with the
    same winding number about its protected target, and hence a surrounding simple circuit.
    Choose the annuli small enough that their larger filled comparison disks stay in the buffer.
    Thus the target annulus may enclose arbitrary pins in its hole: none lies in these small comparison disks.
    Association multiplies their fixed positive probabilities.
    A general fixed collar is covered by a finite such chain. Rounding moves paths by only $O \( delta \)$.
  For requests in disjoint buffers expose the previous successful constructions only in those buffers and
    condition on their full allowed histories. The next buffer still has the same uniform bound,
    regardless of the previous sign. For a stack choose $k gt.eq c_1 log \( L \/ r \) - c_2$ separated slots.
    Conditional on all previously inspected slots, failure in the next slot has probability at most $1 - c_3$.
    Thus the total failure probability is at most $\( 1 - c_3 \)^k$, which is (2.10).
    Slots of bounded lattice size are absorbed into $C$; no estimate at a sublattice scale is asserted.
  Finally a prescription of open-plus cells is an extreme upper constraint.
    Proposition 6 shows that it increases every increasing ambient event.
    This conclusion does not require the event to lie inside the prescribed contour.
    If an ambient favorable path runs from that contour to an interior target,
    the segment after its last intersection with the contour lies inside and connects its prescribed first-spin
    layer to the target. This observation requires no regularity or interior corridor for the contour itself. ◻
]

#thm([Proposition 2.9.])[
  (Local matching and the free plane law).  #emph[There are $C \, alpha > 0$ with the following property.
    Suppose a finite ambient graph contains a ball of radius $L$ together with its interaction cells,
    and its law has first-spin pins and second-spin equalities, none in that ball.
    Then its pair marginal in the concentric radius-$r$ ball is within $C \( r \/ L \)^alpha$ in total variation
    of a common free plane law, for $L gt.eq C r gt.eq C$. The same is true with the statuses of either fixed
    choice of first color. The plane law is the local limit of free ambient laws along every exhaustion,
    and its unaugmented pair and increment laws preserve translations, lattice symmetries, and height symmetries.]
  #emph[Adding extreme first-spin pins in a bounded inner region can be coupled to the original law so that the
    configurations agree beyond a common circuit of the added sign.
    If there are $k$ separated favorable annular slots outside all the changes and no adverse pins or equality
    edges in their buffers, the failure probability is at most $C e^(- c k)$.
    All matches preserve the individual conditional marginals at every joint record as in Lemma 9.]
] <prop:local-mixing>

#proof[
  Inside the pin-free radius-$L$ ball choose a deterministic regular open-minus cut of radius comparable to $L$.
    Let $mu^(-)$ be the original law with this extra prescription. It is below the original law $mu$.
    Query the cut cells also in $mu$, and use the ordered online kernels thereafter.
    Search inward in separated annular slots for a good plus circuit in the lower law.
    By Lemma 10, the failure probability is $C \( r \/ L \)^alpha$.
    A plus cell in the lower law is plus also in the upper law, so the selected circuit is common.
    The exploration geometry just proved leaves identical inner conditional problems,
    with no equality edges or pins. Sample them once, including their free second-spin component labels.
    The inside law of the deterministic minus cut is independent of all the original exterior constraints.
    Thus every eligible $mu$ is within $C \( r \/ L \)^alpha$ of this common comparison law on the small ball.
  For two free ambient volumes containing a radius-$L$ ball this gives a total-variation distance at most $2
    C \( r \/ L \)^alpha$ on the radius-$r$ ball. The finite-state local marginals are Cauchy along any
    exhaustion. Their consistent limits define a plane law. Comparing any given finite ambient law first with a
    much larger free volume and then taking its limit gives the claimed bound, with a changed constant.
    Apply the same argument to translated, reflected, rotated,
    or spin-rotated exhaustions to obtain the stated invariances.
    The augmentation itself singles out one partite class, so only its corresponding lattice symmetries are
    asserted; the unaugmented interaction (2.2) has all lattice symmetries.
  For additional plus pins search outward for a good plus circuit in the lower law; every such circuit is common.
    On its exterior the deterministic constraints agree and the stopped specifications are identical.
    The upper law can therefore use the same exterior sample.
    For additional minus pins reverse the order and the signs. The slot bound gives $C e^(- c k)$.
    The correctness of all marginal conditionings follows from the finite recursion of Lemma 9,
    followed only then by volume limits. ◻
]

Two consequences of this formulation will be useful. First,
  every feasible finite event consisting of first-spin pins and finitely many connected second-spin plus
  constraints has positive plane probability. Find an exterior-searched good circuit around its entire support,
  an event of positive probability. In the finite inside law,
  make the second spin constant plus and prescribe the desired first spins;
  every such first-spin configuration has positive total weight. The finite conditional probability is positive.
  Second, all finite conditional identities pass to the plane by exhaustion,
  since the event being conditioned on has positive probability.
  In particular height interiors with fixed traces have the Gibbs property in the plane construction.

The next conditional form will let us match a local increment field with a plane copy independent of distant
  absolute-height observations. Its hypothesis concerns the retained law after an exact cut;
  arbitrary exterior spin labels without such a cut are not a conditioning class in Proposition 11.

#thm([Corollary 2.10.])[
  (Plane matching after a stopped cut).  #emph[Let $cal(R)$ be an exterior record,
    and let $G$ be its successful-search event, determined by that record.
    Suppose that on every successful record a good circuit surrounds $B \( z \, L \)$ together with its
    interaction cells, and that conditional on this record the retained law is the open-cut law of Lemma 4,
    with no additional inside pins or equality edges. For $L gt.eq C r gt.eq C$,
    the pair variables in $B \( z \, r \)$ can be coupled with variables $P_r$ of the fixed free-plane marginal
    $nu_r$ so that
$ bb(P) \( P_r in A divides cal(R) \) = nu_r \( A \) quad upright("for every event ") A \, wide
  bb(P) \( upright("mismatch") divides cal(R) \) lt.eq C \( r \/ L \)^alpha quad upright("on ") G . $

 The same plane marginal is assigned on failure. Consequently $P_r$ is independent of the entire record and the
   total mismatch probability is at most $bb(P) \( G^c \) + C \( r \/ L \)^alpha$.
   Agreement of pair variables also matches increments along paths contained in $B \( z \, r \)$.]
] <cor:conditional-plane-matching>

#proof[
  The local comparison proof applies uniformly to the retained open-cut law.
    To see this directly, put a deterministic regular open-minus circuit inside $B \( z \, L \)$ at a radius
    comparable to $L$. Adding this prescription lowers the first-color/status law by Proposition 6.
    The old boundary prescriptions are outside this regular circuit.
    Search inward for a common open-plus circuit and use the same annular stack and exact inside sampling as in
    Proposition 11. The error is $C \( r \/ L \)^alpha$, independently of the old circuit and its exterior record.
    The law inside the deterministic minus circuit is independent of that record.
    Comparing it with the free-plane law gives the stated conditional total-variation bound, with a changed constant.
  For each record choose a maximal coupling of its retained marginal with the same second marginal $nu_r$.
    On failed records use that second marginal and any coupling.
    On these finite local state spaces the usual maximal-coupling formula gives a measurable kernel.
    The conditional second-marginal identity in the statement proves independence from $cal(R)$,
    and averaging the mismatch bound proves the final estimate.
  For a stopped exploration from Lemma 9, assume there are no additional pins or equality edges inside the cut and
    no equality edge crosses it. The geometric invasion above records only the prescribed first-color cut layer on
    the retained side. Exterior second-spin labels, including those needed to read absolute heights along exterior
    paths, reveal no retained component label: open crossing cells have constant factors and no equality edge
    crosses the cut. Lemma 4 therefore verifies the retained-law hypothesis for precisely these records.
    Retained second-spin labels must remain unobserved. ◻
]

If a connected fixed skeleton has constant $W$ by equality edges,
  giving its component the actual label plus has conditional probability exactly $1 \/ 2$,
  independent of $\( B \, tau \)$. Thus it does not bias any first-spin search.
  More generally, at most $m$ connected all-plus constraints have conditional probability between $2^(- m)$ and
  $1$; any failed-search probability increases by at most $2^m$ after imposing them.
  Once a stopped open cut separates all these constraints from a retained region containing no other pins or
  equality edges, revealing their labels fixes no retained component.
  Its conditional law is the unlabelled open-cut law. Applying Corollary 12 inside a cut at an intermediate scale
  gives local plane matching also in this situation, with constants depending on $m$ and, if necessary,
  a smaller positive exponent. For example a cut between $sqrt(r L)$ and a fixed fraction of $L$ has failure
  $C_m \( r \/ L \)^(alpha \/ 2)$ and leaves an inside comparison error of the same order.
  Absolute exterior heights may be included in the record by revealing paths from their sites to an exterior
  anchor; the inner complementary labels remain unqueried. Zero-total interior tests do not depend on the
  unspecified lift offset.

=== 2.4 Multiplicative comparison for rare pins <multiplicative-comparison-for-rare-pins>

Additive mixing does not control an event whose probability tends to zero with the mesh.
  We next prove the comparison that will be used for such events.
  All geometric neighborhoods in this proposition are fixed before letting $delta$ tend to zero.

#thm([Proposition 2.11.])[
  (Separated rare pins).  #emph[Fix $k$ bounded filled simply connected neighborhoods $U_1 \, dots.h \,
    U_k$ with disjoint closures. In each $U_i$ let $P_i$ prescribe arbitrary first spins on a finite site set and
    prescribe second-spin plus on at most $m_i$ connected lattice subgraphs, singletons allowed.
    Assume the supports stay a fixed positive distance from $partial U_i$,
    so that isolating circuit collars fit inside $U_i$, and let $m = sum_i m_i$ be fixed. In the free plane law,
#[#set math.equation(numbering: n => "(2.11)")
 $ c product_(i = 1)^k bb(P) \( P_i \) lt.eq bb(P) #scale(x: 180%, y: 180%)[\(] ⋂_(i = 1)^k P_i
   #scale(x: 180%, y: 180%)[\)] lt.eq C product_(i = 1)^k bb(P) \( P_i \) . $ <discrete:rare-pins>]

 The constants depend on $x$, $k$, $m$, and the fixed buffers, but not on the numbers of pinned sites,
   the lengths of the connected subgraphs, or lattice translations preserving the buffers.
   The comparison also holds in finite free ambient volumes containing all the required comparison collars.
   Previous pins inside the currently considered obstacle are retained in both comparison laws.]
] <prop:rare-pins>

#proof[
  We first establish a single-sign comparison under arbitrary existing first-spin pins and second-spin equalities.
    Consider an obstacle $K$ with an empty collar, and an event $A$ adding only first-spin pins of sign $s$ on
    $K$. There can be previous pins of either sign inside $K$, as well as equality edges there.
    Choose a deterministic outer good cut $gamma_s$ of sign $s$ in the collar.
    Let $p_(*)$ be the probability of $A$ in the law with this additional cut.
    By the exact-cut lemma, $p_(*)$ depends on the previous #emph[inside] constraints and on the chosen outer cut,
    but not on any remote constraints. Order gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ bb(P) \( A \) lt.eq p_(*) . $ <discrete:pstar>]
  For minus pins this is the same assertion in reversed order.
  An exterior search finds a closer good cut $C_s$ of sign $s$ in a strictly inner collar with probability at
    least $c_0 > 0$, uniformly over all existing constraints.
    Conditional on any stopped successful record, the remaining conditional probability of $A$ is exactly its
    probability inside $C_s$, with all previous internal constraints retained.
    In the deterministic outer-cut law, conditioning on this particular closer favorable cut increases the event
    $A$. Its inside law is the same by Lemma 4; hence the conditional probability is at least $p_(*)$.
    Averaging over successful records proves
  #[#set math.equation(numbering: n => "(2.13)")
   $ c_0 p_(*) lt.eq bb(P) \( A \) lt.eq p_(*) . $ <discrete:single-sign>]
  In particular probabilities under two different remote constraint sets are comparable whenever their previous
    internal constraints coincide. This argument retains opposite pins inside the obstacle;
    it does not erase them when the next sign block is considered.
  Write $E_i$ for the event that each of the specified second-spin subgraphs in obstacle $i$ is constant,
    and $L_i$ for the event that their labels are all plus. Initially impose no first-spin pins.
    Apply (2.13) with $W$ as first color to the events $L_i$, obstacle by obstacle.
    Each conditional factor, given earlier obstacles, is comparable with its unconditional factor,
    because those constraints are remote and the same reference cut can be used. Therefore
  $ bb(P) #scale(x: 180%, y: 180%)[\(] ⋂_i L_i #scale(x: 180%, y: 180%)[\)] asymp product_i bb(P) \( L_i \) . $
  The component-label estimate gives, both jointly and separately,
  $ 2^(- m) bb(P) #scale(x: 180%, y: 180%)[\(] ⋂_i E_i #scale(x: 180%, y: 180%)[\)] lt.eq
    bb(P) #scale(x: 180%, y: 180%)[\(] ⋂_i L_i #scale(x: 180%, y: 180%)[\)] lt.eq
    bb(P) #scale(x: 180%, y: 180%)[\(] ⋂_i E_i #scale(x: 180%, y: 180%)[\)] \, wide
    2^(- m_i) bb(P) \( E_i \) lt.eq bb(P) \( L_i \) lt.eq bb(P) \( E_i \) . $
  Consequently $bb(P) \( ⋂_i E_i \) asymp product_i bb(P) \( E_i \)$.
  Now regard all $E_i$ as the common equality set $E_0$ for the original first color.
    Let $A_i$ be its prescribed first-spin event. Add the plus pins in obstacle $1$, then its minus pins,
    then the two blocks in obstacle $2$, and so on. At each step (2.13) compares the conditional probability with
    the same factor in the individual law conditioned on $E_i$ and on earlier sign blocks #emph[in this obstacle].
    Remote $E_j$ and earlier remote first-spin pins disappear behind the reference cut.
    Previous internal plus pins remain when the minus block is added.
    There are at most $2 k$ factors, so multiplication gives
  $ bb(P) #scale(x: 180%, y: 180%)[\(] ⋂_i A_i thin \| thin ⋂_i E_i #scale(x: 180%, y: 180%)[\)] asymp product_i
    bb(P) \( A_i divides E_i \) . $
  Combining with the equality comparison gives $bb(P) \( ⋂_i \( A_i ∩ E_i \) \) asymp product_i
    bb(P) \( A_i ∩ E_i \)$. Finally restoring all the actual plus labels costs a factor between $2^(- m)$ and $1$,
    even after the arbitrary first-spin pins and statuses have been specified.
    The same holds individually with $m_i$. Since $P_i = A_i ∩ L_i$, this proves (2.11).
    Every comparison was finite-volume and uniform. Positive probability of the finite pin events permits passage
    to the plane limit. No division by a mesh-dependent lower bound for a pin probability occurred. ◻
]

=== 2.5 Protected switches and height order <protected-switches-and-height-order>

A spin configuration records height only modulo four. The next switch changes an integer lift by four in a
  protected region while preserving both of its spins. It will supply nonzero height fluctuations and allow the
  moment argument to compare different integer-offset parity classes.

#thm([Lemma 2.12.])[
  (Protected component switch).  #emph[Suppose two nested good circuits have opposite first-spin signs.
    Between and on the two circuits assume there are no second-spin equality constraints or prescribed second-spin
    labels. Conditional on the first spins and cell statuses,
    there is a deterministically selectable second-spin component in that collar whose fair label flip changes the
    integer lift throughout the protected inner region by $+ 4$ or $- 4$ relative to the protected exterior,
    while preserving both spins in both protected regions. The selection uses only the first spins, statuses,
    equality edges, and the two circuits. It therefore preserves any stopped selection of the circuits based on
    these data.]
  #emph[For disjoint collars the switches commute and give equally weighted orbits containing every parity vector
    of the corresponding inner lift offsets in $4 bb(Z)$. Spin constraints and comparisons of lifts along paths
    inside the protected regions are preserved. With the height anchor fixed in the protected exterior,
    a test supported there is unchanged; a zero-total test supported entirely in the protected inner region is
    also unchanged. Opposite good cuts can be required in any fixed nested pin-free collars with uniformly
    positive probability. The assertion holds with the two colors interchanged.]
] <lem:collar-switch>

#proof[
  For an oriented edge, direct use of (2.3) gives
  #[#set math.equation(numbering: n => "(2.14)")
   $ d \( H + B W \/ 2 \) = W thin d B . $ <discrete:switch-differential>]
  Whenever $B$ changes, $W$ is constant on that edge and its endpoints belong to the same closed-cell component.
    For such a component $C$ define an edge form $omega_C$ equal to $d
    B$ on its changing edges and zero on the other edges. On any triangle the two changing edges, if present,
    share a vertex and consequently belong to the same component. Their contributions cancel.
    Thus $omega_C$ has zero circulation and, by simple connectedness, has a potential $psi_C$.
  On $C$ one has $psi_C = B + upright("constant")$, since this is true along each closed-cell or equality edge of
    a component path. Every site outside $C$ can be joined to a first site of $C$ by a path whose preceding edges
    have zero $omega_C$. A changing last edge would put both endpoints in $C$, so it too has zero form.
    Hence every value of $psi_C$ is a value attained on $C$, and its range has diameter at most two.
    In particular its nonzero differences are $plus.minus 2$.
  Open cuts prevent these components from crossing either circuit.
    Choose a path in the collar from the exterior-side layer of the inner circuit to the interior-side layer of
    the outer circuit. The difference of its first-spin endpoints is $plus.minus 2$.
    Since $sum_C d psi_C = d B$, at least one component meeting this path contributes a difference $plus.minus 2$.
    Such a component is confined to the collar; its potential is constant on each connected protected inner and
    outer region. Choose the first such component in a fixed deterministic order.
    No label of this component is prescribed. Let its label be $w in { - \, + }$.
    Flipping it changes the right side of (2.14) by $- 2 w thin d psi_C$.
    Neither endpoint spin changes in the protected regions, so their relative height shift is $-
    2 w \( plus.minus 2 \) = plus.minus 4$. Anchor the lift in the protected exterior to fix its absolute value
    there. The flip is an involution preserving its conditional probability because the label is fair.
  The chosen component and circuits are unchanged by this operation,
    since they depend only on $\( B \, tau \, E_0 \)$. A switch changes an inner offset $4
    t$ to $4 \( t plus.minus 1 \)$ and therefore reverses its parity.
    Switches in disjoint collars act on disjoint components and commute.
    Every orbit has $2^j$ equally weighted elements for $j$ collars and visits each parity vector exactly once.
    This conclusion remains true after imposing any checks invariant under the switches;
    it asserts an orbit identity, not independence after arbitrary checks.
    The statements about tests follow from their supports and total weights.
    If a central event involves absolute offsets and is not invariant,
    one must enlarge its bounded range to contain the orbit before applying this identity.
    Finally apply Lemma 10 successively in two disjoint nested collars to require opposite signs,
    with the given constraints away from both buffers. Swapping the colors is a symmetry of the Gray representation. ◻
]

#thm([Lemma 2.13.])[
  (Height comparison and flat loops).  #emph[Let the free sites be in bounded faces of a connected
    triangular-lattice skeleton of fixed integer trace. Include all neighbors of free sites up to that trace.
    The weighted height law is positively associated, and ordered feasible traces give stochastically ordered
    laws. The assertion also applies after restricting to components separated by further fixed curves.
    With constant trace, the changing dual edges are disjoint closed honeycomb loops.
    Given their unoriented geometry their jumps are independent fair signs.
    Exposing such loops from the outside leaves in each unexposed interior the empty-exterior loop law with the
    appropriate constant inner boundary layer.]
] <lem:height-order>

#proof[
  Write the edge potential as
  $ V \( t \) =
    cases(delim: "{", - \( log x \) \| t \| \, & t in { - 1 \, 0 \, 1 } \,, + oo \, & upright("otherwise") .) $
  This is a convex extended-real potential on the integers.
    For two admissible arrays $h \, g$, sorting their endpoint values gives on each edge
  $ V \( \( h and g \)_v - \( h and g \)_u \) + V \( \( h or g \)_v - \( h or g \)_u \) lt.eq V \( h_v - h_u \) +
    V \( g_v - g_u \) . $
  For completeness, if the endpoint orders agree this is equality.
    If they disagree, write the four ordered endpoint values;
    sorting replaces two crossing intervals by two nested pairings and cannot increase the sum of their lengths.
    The new edge differences lie between the two old ones, so their absolute values remain at most one.
    Since $- log x gt.eq 0$, the displayed inequality follows, including $x = 1$.
    Ordered traces put the meet in the lower support and the join in the upper support.
    Multiplying the edge inequalities proves the within-law lattice condition and the two-law inequality.
    Heights are bounded in this finite problem by the trace bounds plus graph distance to the trace.
    FKG and the product-with-${ 0 \, 1 }$ argument used in Proposition 6 therefore give association and ordered
    comparison on a finite lattice, with inadmissible arrays assigned zero weight.
  On each triangle integer Lipschitz heights take at most two consecutive values.
    Its dual honeycomb vertex consequently has either zero or two changing edges.
    Constant trace prevents such edges from ending on the bounding skeleton.
    They thus form mutually vertex-disjoint loops. A loop lying in a bounded face of the connected skeleton cannot
    enclose any piece of that skeleton: a connection from that piece to the bounding skeleton would cross the
    loop. Every choice of one of two jump signs for each loop therefore yields exactly one admissible height field
    with the specified constant trace. Its weight is $x$ to the total loop length, independent of all the signs.
    Conditional jumps are independent and fair, and the marginal geometric weight is $2$ per loop times $x$ per
    occupied edge.
  For a fixed exposed loop, the loops strictly inside cannot touch its vertices.
    The edge and loop factors split between inside and outside;
    the inside boundary face layer has a constant height. Selecting the next enclosing loop by an exploration
    depending only on already exposed outside geometry does not inspect a strict inside edge.
    Summing the product weights over completions, or equivalently conditioning the constant inner height layer,
    proves the same factorization at each stopping step. This is the asserted empty-exterior law and applies
    without regularity of the exposed loop. Finally the ambient realization in Lemma 3,
    with constant pair pins on the connected skeleton, gives the same flat height problems used above. ◻
]

Every use of a positive-width buffer in later sections has the following order of quantifiers:
  first fix the finite geometry, its clearances, and its number of requests; next let $delta arrow.b 0$;
  only afterwards shrink a gap or exceptional window. The constants of this section may depend on that fixed
  geometry and on the fixed parameter $x$. No uniformity as $x$ varies or as a buffer degenerates is asserted.

== 3 Shell counts and smearing moments <sec:moments>

All distances in this section are in lattice units. A #emph[smearing of radius $a gt.eq
  1$ and weight bound $A$] is a linear statistic

#[#set math.equation(numbering: n => "(3.1)")
 $ Y \( H \) = sum_u w_u H \( u \) \, wide "supp" w subset B \( z_0 \, a \) \, wide sum_u \| w_u \| lt.eq A \,
   wide sup_u \| w_u \| lt.eq A a^(- 2) . $ <moments:weights>]

The weights are real and may have either sign. If $sum_u w_u = 0$, we call the smearing #emph[zero-total];
  its value is independent of the additive constant in the height lift.
  Constants throughout may depend on the fixed parameter $x$.

The bounded height problems below use the convention of Lemma 15:
  a connected fixed-trace lattice skeleton bounds the free sites,
  and every incident interaction up to that trace is retained.
  This includes the interior of a stopped contour after its inner face layer has been fixed.
  The skeleton need not be convex or have a lower bound on the widths of its fjords.

We will prove two bounds for these smearings, for every finite $p gt.eq 1$.
  Suppose the radius $a$ is at most a fixed small fraction of the distance $n$ from the smearing center to the
  trace. If that trace has magnitude at most $K$, the $L^p$ norm is controlled by $1 + K +
  sqrt(log \( n \/ a \))$. For zero-total smearings in the free plane law,
  the norms are bounded independently of $a$. The common starting point is a bound on the number of enclosing
  loops in each shell. It gives a logarithmic covariance estimate and hence positive mass in a central interval;
  rounded midpoints then turn that central mass into all finite moments.

=== 3.1 A shell estimate without an upper crossing input <a-shell-estimate-without-an-upper-crossing-input>

#thm([Lemma 3.1.])[
  (Geometric tails for shell counts).  #emph[In a finite constant-boundary height problem,
    let $N_d \( z \)$ be the number of level loops surrounding a site $z$ whose Euclidean closest approach to $z$
    belongs to $\[ d \, 2 d \)$, where $d gt.eq 1$. There are $c \, C > 0$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(P) { N_d \( z \) gt.eq t } lt.eq C e^(- c t) wide \( t gt.eq 0 \) . $ <moments:shell-tail>]

 In particular, for each finite $p gt.eq 1$, $bb(E) N_d \( z \)^p lt.eq C_p$.
   These constants are independent of the shape, $z$, and $d$,
   and the same assertions hold in any bounded face of a connected flat skeleton.]
] <lem:shell-moments>

#proof[
  A constant shift reduces to boundary height zero. Conditional on their unoriented geometry,
    the level loops have independent fair height increments. Expose enclosing loops from outside inward,
    using the stopping rule in Lemma 15. If the first loop counted by $N_d \( z \)$ exists,
    its unexplored interior has the empty-exterior loop law with a constant inner trace.
    Its distance from $z$ is at most $2 d + O \( 1 \)$. Every further counted loop surrounds
    $B \( z \, d \/ 2 \)$, for all sufficiently large $d$. The factor $1 \/
    2$ provides clearance from all rounding and incident-face conventions.
  We first prove a uniform obstruction in any such remaining domain.
    Suppose an exterior search finds a good open-plus $B$ contour $C$ strictly inside its boundary,
    surrounding $B \( z \, d \/ 2 \)$. Choose the outermost such contour by the authorized-edge invasion following
    Lemma 9. The search exposes only exterior history and the prescribed open-plus cut data.
    In particular it reveals no strict interior cell and leaves the exact cut law of Lemma 4 inside $C$. Moreover
  #[#set math.equation(numbering: n => "(3.3)")
   $ d \/ 2 lt.eq "dist" \( z \, C \) lt.eq 2 d + O \( 1 \) . $ <moments:cut-radius>]
  There is a number $kappa > 0$, independent of $C$, such that under this interior law a $B$-plus path joins its
    prescribed inner layer to $B \( z \, d \/ 2 \)$ with probability at least $kappa$.
  Here are geometric and conditional details of this last assertion.
    Fix a sufficiently small constant $epsilon.alt > 0$, and choose a closest point $p$ of $C$ to $z$.
    Realize the same interior law in a new free ambient triangulation containing $B \( z \, 10 d \)$,
    conditioned only on the same open-plus cells and first-spin sites of $C$.
    Exact cutting justifies this replacement even for an arbitrarily nonconvex $C$.
    In this ambient graph request a good plus circuit in an annulus about $p$ with radii $epsilon.alt d$ and $2
    epsilon.alt d$. Since $C$ visits the inner ball and surrounds $B \( z \, d \/ 2 \)$,
    it must exit the outer ball and intersect this circuit. Next request a chain of annular plus circuits of these
    same radii, from $p$ to an annulus wholly inside $B \( z \, d \/ 2 \)$.
    The centers may follow a straight segment in the ambient plane.
    Choose successive spacings strictly between $epsilon.alt d$ and $2 epsilon.alt d$, with fixed slack.
    The inner balls of consecutive annuli overlap and each protrudes outside the other’s outer ball.
    Consequently their surrounding circuits intersect: disjoint circuits would have either disjoint interiors,
    contradicting the overlap, or nested interiors, contradicting that protrusion.
    Equation (3.3) bounds the number of requests by a constant depending only on $epsilon.alt$.
    Bounded lattice displacements are absorbed by the slack.
  Lemma 10 and positive association give a fixed positive probability for their intersection in the free ambient
    law. All the data imposed on $C$ are favorable for this increasing event,
    so Proposition 6 gives the same lower bound after conditioning on $C$.
    The connected circuit chain contains a path from $C$ to the terminal circuit inside the disk.
    Take its last intersection with $C$ before that endpoint.
    The remaining path stays inside $C$, since otherwise planar separation would force another intersection.
    Its adjacent plus face chain therefore joins the prescribed inner layer to the disk.
    This proves the asserted lower bound $kappa$. In particular this connection precludes a deeper $B$ wall
    surrounding the disk. The ambient chain was allowed to leave $C$;
    no interior corridor of prescribed width was assumed.
  To turn this obstruction into a bound on the number of loops,
    let $N$ be the number of further qualifying enclosing loops in the remaining flat problem.
    Closest approach is nonincreasing under nesting, so the qualifying loops are consecutive in the enclosing
    nesting order until their closest approach falls below $d$.
    Conditional on all unoriented geometry, write the height residues along them as a nearest-neighbor walk on
    $bb(Z) \/ 4 bb(Z)$, with independent fair signs. From every starting residue there is a prescribed block of
    four signs that contains a $W$ wall with unchanged $B = +$, followed inward by a $B$ wall.
    For example, starting from residues $0 \, 1 \, 2 \, 3$, respectively, the initial strings $+ +$, $- -$,
    $- - -$, $+ + +$ have that property; complete each to four signs arbitrarily.
    Every chosen four-sign block has probability $1 \/ 16$. Hence, on ${ N gt.eq k }$,
    the conditional probability of seeing this ordered pair of walls among the first $k$ loops is at least
  $ 1 - epsilon_k \, wide epsilon_k = \( 15 \/ 16 \)^(floor.l k \/ 4 floor.r) . $
  The statement follows by conditioning successively on the starting residue of each block;
    independence between block-success events is not required.
  Call this ordered-wall event $cal(A)$. A $W$ wall with $B = +$ is a good open-plus contour,
    because every cell at which $W$ is nonconstant is necessarily open.
    Thus $cal(A)$ implies existence of the exterior-searched outermost plus cut above and of a $B$ wall strictly
    inside it surrounding the disk. The preceding obstruction, conditioned on every possible stopped cut, yields
  $ \( 1 - epsilon_k \) bb(P) \( N gt.eq k \) lt.eq bb(P) \( cal(A) \) lt.eq 1 - kappa . $
  Choose a fixed integer $k$ with $epsilon_k lt.eq kappa \/
    2$ and put $rho = \( 1 - kappa \) \/ \( 1 - kappa \/ 2 \) < 1$.
    The probability of continuing for $k$ further qualifying loops is at most $rho$.
  After exposing these $k$ loops, the last one’s interior is again an empty-exterior flat problem of exactly the
    same type, with closest boundary distance at most $2 d + O \( 1 \)$. Restarting conditionally gives
  $ bb(P) { N_d \( z \) gt.eq 1 + m k } lt.eq rho^m wide \( m gt.eq 0 \) . $
  This is a stopping recursion; it asserts no independence of successive geometric shells.
    It proves (3.2) for sufficiently large $d$. For bounded $d$,
    each counted loop visits a fixed-size ball and the loops have disjoint honeycomb vertices,
    giving a deterministic bound on their number. Finally, integration of the exponential tail gives every stated
    moment. ◻
]

#thm([Lemma 3.2.])[
  (Common loops and the logarithmic covariance bound).  #emph[Let the flat trace be zero,
    let $n$ be the distance from $z_0$ to its bounding skeleton, and let $z \, w in B \( z_0 \, a \)$,
    where $1 lt.eq a lt.eq c_0 n$ for a sufficiently small absolute $c_0$. With $b = max \( 1 \, \| z - w \| \)$,
#[#set math.equation(numbering: n => "(3.4)")
 $ 0 lt.eq bb(E) \[ H \( z \) H \( w \) \] lt.eq C (1 + log n / b) . $ <moments:covariance-bound>]

 Every smearing (3.1) in this ball therefore satisfies
#[#set math.equation(numbering: n => "(3.5)")
 $ bb(E) Y^2 lt.eq C A^2 (1 + log n / a) . $ <moments:second-moment>]

]
] <moments:covariance>

#proof[
  The independent centered loop orientations give the exact identity
  #[#set math.equation(numbering: n => "(3.6)")
   $ bb(E) \[ H \( z \) H \( w \) \] = bb(E) \# { upright("level loops surrounding both ") z upright(" and ")
     w } . $ <moments:common-loops>]
  Fix a dyadic closest-approach shell $\[ d \, 2 d \)$ about $z$ with $d lt.eq b \/ 100$.
    A loop surrounding both sites and entering $B \( z \, 2 d \)$ must also leave a ball about $z$ of radius
    comparable to $b$; otherwise it could not enclose $w$. It supplies a wall arm across the intervening annuli.
    Along the whole loop exactly one of $B \, W$ changes. A good circuit of that color cannot be crossed by its
    wall, since the circuit’s open cells have constant first spin.
  Use the wall color as the first spin. The zero-height skeleton fixes that first spin and imposes constancy of
    the second spin along a connected skeleton. Represent the latter constancy by $E_0$ edges.
    Its actual constant label costs exactly $1 \/ 2$, independent of the first spins and statuses,
    and hence does not change their marginal. All arm annuli lie away from the skeleton, since $b lt.eq 2 a +
    1$ and $c_0$ is small. The logarithmic circuit stack from Lemma 10,
    applied for each of the two possible wall colors, consequently gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ bb(P) { upright("such a common loop exists in the shell") } lt.eq C \( d \/ b \)^alpha . $ <moments:arm>]
  If $M_d$ counts common loops in this shell, then $M_d lt.eq N_d \( z \)$ and $M_d =
    0$ outside the event in (3.7). Cauchy–Schwarz and Lemma 16 imply
  $ bb(E) M_d lt.eq \( bb(E) N_d \( z \)^2 \)^(1 \/ 2) bb(P) \( M_d > 0 \)^(1 \/ 2) lt.eq
    C \( d \/ b \)^(alpha \/ 2) . $
  Loops at distance below one give a deterministic bounded contribution by disjointness.
    The sum over the small dyadic scales is bounded. Each of the $O \( 1 + log \( n \/ b \) \)$ remaining shells
    contributes at most a constant. There are no shells beyond scale $O \( n \)$:
    a nearest skeleton site is outside every enclosing loop, so the segment from $z$ to that site meets the loop
    within distance $n + a + O \( 1 \)$. These facts and (3.6) prove (3.4).
  For completeness the average of the singularity is uniformly bounded, including its diagonal.
    Triangular-lattice balls have at most $C \( 1 + r \)^2$ sites.
    For fixed $z$, the layer-cake formula gives, when $a > 1$,
  $ & sum_w \| w_w \| log^(+) frac(a, max \( 1 \, \| z - w \| \))\
 & wide = integral_0^(log a) sum_(max \( 1 \, \| z - w \| \) < a e^(- t)) \| w_w \| thin thin upright(d) t lt.eq
   C A a^(- 2) integral_0^(log a) a^2 e^(- 2 t) thin thin upright(d) t lt.eq C A . $
  For $a = 1$ the sum vanishes. Sum (3.4) against $\| w_z w_w \|$, separate the constant term $log \( n \/ a \)$,
    and use this bound and $sum \| w_z \| lt.eq A$. This proves (3.5) for arbitrary signed weights. ◻
]

=== 3.2 Weighted midpoint amplification <weighted-midpoint-amplification>

We use the discrete midpoint inequality of Klartag–Lehec #cite(label("KlartagLehec2019")) in the
  nonnegative-function formulation of Gozlan–Roberto–Samson–Tetali #cite(label("GRST2019")) Theorem 3.
  Its one-dimensional finite-support statement follows directly from their entropy inequality
  #cite(label("GRST2019")) Theorem 8, equation (9), including zero weights.
  We give that deduction, its coordinate induction, and all additional hypotheses used here.

#thm([Theorem 3.3.])[
  (Discrete midpoint inequality).  #emph[Let $f \, g \, u \, v :
    bb(Z)^m arrow.r \[ 0 \, oo \)$ have finite support, and write $m_(-) \( s \, t \) =
    floor.l \( s + t \) \/ 2 floor.r$ and $m_(+) \( s \, t \) = ceil.l \( s + t \) \/ 2 ceil.r$,
    with coordinatewise rounding. If, for every $s \, t in bb(Z)^m$,
$ f \( s \) g \( t \) lt.eq u \( m_(-) \( s \, t \) \) v \( m_(+) \( s \, t \) \) \, $

 then
$ (sum f) (sum g) lt.eq (sum u) (sum v) . $

]
] <thm:midpoint>

#proof[
  First let $m = 1$. Write $A = sum f$ and $B = sum g$. If either is zero there is nothing to prove.
    Otherwise let $nu_0 = f \/ A$ and $nu_1 = g \/ B$, and couple them monotonically:
    take their quantile functions at the same uniform point of $\( 0 \, 1 \)$.
    Let $pi$ be this coupling, and let $nu_(-) \, nu_(+)$ be its pushforwards by the floor and ceiling midpoint
    maps. The entropy theorem just cited states
  $ cal(H) \( nu_(-) \) + cal(H) \( nu_(+) \) lt.eq cal(H) \( nu_0 \) + cal(H) \( nu_1 \) \, wide
    cal(H) \( nu \) = sum_z nu \( z \) log nu \( z \) \, $
  for finitely supported probability measures on $bb(Z)$, with zero terms omitted.
    Every pair charged by $pi$ has $f \( s \) g \( t \) > 0$;
    the pointwise hypothesis therefore makes both corresponding output weights positive.
    All logarithms below are thus evaluated on finite positive supports.
    Integrating the logarithm of the pointwise hypothesis and then using the entropy inequality gives
  $ log A + log B & lt.eq sum_z nu_(-) \( z \) log u \( z \) + sum_z nu_(+) \( z \) log v \( z \) -
    cal(H) \( nu_0 \) - cal(H) \( nu_1 \)\
 & lt.eq (sum_z nu_(-) \( z \) log u \( z \) - cal(H) \( nu_(-) \)) +
   (sum_z nu_(+) \( z \) log v \( z \) - cal(H) \( nu_(+) \))\
 & lt.eq log sum_z u \( z \) + log sum_z v \( z \) . $
  The last inequality is Jensen’s inequality applied to $sum nu
    log \( a \/ nu \)$ on the positive support of each probability measure;
    adding any unused nonnegative weights only enlarges the sum.
    Exponentiating proves the scalar statement without modifying zero values or assuming that a positive
    approximation preserves its premise.
  For the induction step write $s = \( s' \, a \)$ and $t = \( t' \, b \)$.
    Fix $s' \, t'$ and apply the one-dimensional theorem in $a \, b$.
    For the partial sums $F \( s' \) = sum_a f \( s' \, a \)$, and likewise $G \, U \, V$, its conclusion is
  $ F \( s' \) G \( t' \) lt.eq U \( m_(-) \( s' \, t' \) \) V \( m_(+) \( s' \, t' \) \) . $
  The induction hypothesis in the other $m - 1$ coordinates proves the claim.
    No factorization of the functions is used. A finite array is extended by zero to $bb(Z)^m$;
    the premise must still be checked on every pair of its nonzero input supports. ◻
]

#thm([Lemma 3.4.])[
  (Admissibility and energy at rounded midpoints).  #emph[Let $cal(S)$ be the integer $1$-Lipschitz arrays on a
    finite connected graph, with fixed integer heights on a nonempty set of vertices. Set
$ cal(W) \( h \) = upright(bold(1))_({ h in cal(S) }) x^(sum_({ i \, j }) \| h_i - h_j \|) . $

 Then $cal(S)$ is finite, both rounded midpoints of $s \, t in cal(S)$ belong to $cal(S)$, and
#[#set math.equation(numbering: n => "(3.8)")
 $ cal(W) \( m_(-) \( s \, t \) \) cal(W) \( m_(+) \( s \, t \) \) gt.eq
   cal(W) \( s \) cal(W) \( t \) . $ <moments:weight-midpoint>]

 Moreover a linear statistic with $sum \| w_i \| lt.eq A$ obeys
#[#set math.equation(numbering: n => "(3.9)")
 $ lr(|Y \( m_plus.minus \( s \, t \) \) - frac(Y \( s \) + Y \( t \), 2)|) lt.eq A \/ 2 . $ <moments:rounding>]

 The same energy inequality holds with additional support constraints whenever both outputs satisfy those constraints.]
] <moments:weighted-midpoints>

#proof[
  One fixed height bounds every coordinate by its graph distance from that vertex, so the array is finite.
    For an edge $i j$ put $a = s_i - s_j$ and $b = t_i - t_j$.
    If $c \, d$ are its differences in the two rounded arrays, and $epsilon_i$ is the parity of $s_i + t_i$, then
  $ c = frac(a + b - epsilon_i + epsilon_j, 2) \, wide d = frac(a + b + epsilon_i - epsilon_j, 2) . $
  Thus $c + d = a + b$, $\| c - d \| lt.eq 1$, and $c \, d$ are its two nearest integer halves.
    In particular $c \, d in { - 1 \, 0 \, 1 }$ and
  $ \| c \| + \| d \| = \| a + b \| lt.eq \| a \| + \| b \| . $
  Each fixed integer coordinate is preserved exactly. Summing over edges and using $x lt.eq 1$ proves (3.8),
    including $x = 1$. Each rounded coordinate differs from its average by at most $1 \/ 2$,
    which proves (3.9) even for signed weights. ◻
]

#thm([Lemma 3.5.])[
  (Central mass in finitely many classes).  #emph[Let $mu \( h \) =
    cal(W) \( h \) \/ Z$ be a finite probability measure on integer arrays.
    Partition its support into at most $J$ classes. Suppose that two arrays from the same class have both rounded
    midpoints in the full support, with the weight inequality (3.8).
    Let $Y$ be a linear statistic satisfying (3.9). If $M > 0$, $M gt.eq A \/ 2$, and, for every class $cal(S)_i$,
#[#set math.equation(numbering: n => "(3.10)")
 $ mu #scale(x: 120%, y: 120%)[\(] cal(S)_i ∩ { \| Y \| lt.eq M } #scale(x: 120%, y: 120%)[\)] gt.eq c > 0 \,
   $ <moments:class-central>]

 then there are $a_(*) > 0$ and $C_p < oo$, depending only on $J \, c \, p$, such that
#[#set math.equation(numbering: n => "(3.11)")
 $ mu { \| Y \| > t M } lt.eq 4 e^(- a_(*) t) quad \( t gt.eq 0 \) \, wide
   parallel Y parallel_(L^p \( mu \)) lt.eq C_p M quad \( 1 lt.eq p < oo \) . $ <moments:amplification>]

 Outputs may belong to any class. In particular no stability of an individual class under midpoint rounding is
   required.]
] <lem:midpoint-amplification>

#proof[
  For integers $j gt.eq 3$ define
  $ I_j = \[ \( 2^j - 4 \) M \, \( 2^(j + 1) + 4 \) M \] \, wide p_j = mu \( Y in I_j \) . $
  For $j gt.eq 4$ choose a class carrying at least $p_j \/ J$ of the mass of $I_j$,
    and pair its tail arrays with its central arrays from (3.10). Every output has its statistic in
  $ \[ \( 2^(j - 1) - 7 \/ 2 \) M \, \( 2^j + 7 \/ 2 \) M \] subset I_(j - 1) \; $
  indeed the central average contributes at most $M \/ 2$ and rounding at most $A \/ 2 lt.eq M$.
    Apply Theorem 18 to $cal(W)$ restricted to the chosen tail and central sets,
    and to two copies of $cal(W)$ restricted to ${ Y in I_(j - 1) }$. Dividing by $Z^2$ gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ p_j lt.eq \( J \/ c \) p_(j - 1)^2 . $ <moments:recursion>]
  Put $K_(*) = J \/ c gt.eq 1$, $N = ceil.l 4 K_(*) ceil.r$, and $L = 3 + N$.
    For $j gt.eq 4$ these intervals have overlap at most two:
    the upper endpoint of $I_j$ is strictly below the lower endpoint of $I_(j + 2)$.
    Thus $sum_(j gt.eq 4) p_j lt.eq 2$, and among $j = 4 \, dots.h \, L$ there is $j_0$ with $K_(*) p_(j_0) lt.eq
    1 \/ 2$. Iteration of (3.12) yields
  $ K_(*) p_(j_0 + r) lt.eq 2^(- 2^r) quad \( r gt.eq 0 \) \, wide p_j lt.eq
    K_(*)^(- 1) exp { - \( log 2 \) 2^(j - L) } quad \( j gt.eq L \) . $
  Repeat the argument for $- Y$, with the same $L$. If $t gt.eq 2^L$ and $k = floor.l log_2 t floor.r$,
    the cores $\[ 2^j M \, 2^(j + 1) M \] subset I_j$ for $j gt.eq k$ cover the positive tail,
    and their negative counterparts cover the negative tail. Writing $q_0 = exp { - \( log 2 \) 2^(k - L) } lt.eq
    1 \/ 2$, we obtain
  $ mu \( \| Y \| > t M \) lt.eq 2 / K_(*) sum_(r gt.eq 0) q_0^(2^r) lt.eq 4 q_0 lt.eq
    4 exp { - \( log 2 \) 2^(- L - 1) t } . $
  For $0 lt.eq t < 2^L$ the last bound exceeds one. This proves the tail claim with $a_(*) = \( log 2 \)
    2^(- L - 1)$. Finally $bb(E) \| Y \|^p = integral_0^oo p t^(p - 1) mu \( \| Y \| > t \) thin thin upright(d)
    t$ proves the moment claim. This proof explicitly uses the unconditional central mass in each class;
    a central bound for their union would not suffice. ◻
]

=== 3.3 Bounded traces and plane increments <bounded-traces-and-plane-increments>

#thm([Proposition 3.6.])[
  (Smearing with bounded boundary values).  #emph[In a bounded height problem as specified above,
    suppose its fixed trace has absolute value at most $K$. Let $n$ be the distance from the smearing center to
    the bounding sites. For $1 lt.eq a lt.eq c_0 n$ and every finite $p gt.eq 1$,
#[#set math.equation(numbering: n => "(3.13)")
 $ ∥sum_u w_u H \( u \)∥_p lt.eq C_(p \, A) (1 + K + sqrt(log \( n \/ a \))) . $ <moments:smearing-bound>]

 The bound is uniform over the shape of the trace and applies in particular to the interior of a good cut after
   its complete inner height layer has been specified.]
] <prop:smearing>

#proof[
  For zero trace, Lemma 17 and Chebyshev’s inequality supply central probability at least $1 \/ 2$ with $M =
    C_A \( 1 + sqrt(log \( n \/ a \)) \)$, increased if necessary to exceed $A \/ 2$.
    Lemma 19 verifies all midpoint hypotheses for the actual weighted height measure.
    Apply Lemma 20 with one class to prove (3.13) for zero trace.
  For general trace, put $K_0 = ceil.l K ceil.r$. Height order from Lemma 15 traps the law between the flat laws
    with traces $- K_0$ and $K_0$. For nonnegative weights, the corresponding smearing laws are the zero-trace
    smearing shifted by $plus.minus K_0 sum_u w_u$. Both tails are therefore bounded by the zero-trace tails with
    an additive displacement at most $A K_0$. This gives (3.13).
    Split arbitrary signed weights into their positive and negative parts; each satisfies (3.1),
    and the triangle inequality in $L^p$ finishes the proof. On a cut, fix the entire actual inner trace first,
    so its interior is an ordinary weighted height problem by Lemma 4. The same argument applies conditionally. ◻
]

#thm([Proposition 3.7.])[
  (Uniform plane moments for zero-total smearings).  #emph[For the infinite-volume increment law furnished by
    Proposition 11, every zero-total smearing (3.1) satisfies
#[#set math.equation(numbering: n => "(3.14)")
 $ ∥sum_u w_u H \( u \)∥_p lt.eq C_(p \, A) wide \( 1 lt.eq p < oo \) . $ <moments:plane-bound>]

 The constants are uniform in $a gt.eq 1$ and the center. The same estimate holds for the increment law in a
   finite free simply connected triangulation containing $B \( z_0 \, C_0 a \)$, for a sufficiently large fixed $C_0$.]
] <prop:plane-moments>

#proof[
  Work first with the free spin pair in the finite ambient graph.
    Choose a fixed large constant $L_0$ with $1 \/ L_0 < c_0 \/ 4$,
    and search from outside for a good $B$ circuit in an annulus with radii $L_0 a$ and $2 L_0 a$.
    Choose $C_0$ large enough that all search buffers fit in the ambient graph.
    Lemma 10 gives this stopped-cut event probability at least $c_1 > 0$.
    Its trace is contained in two consecutive integers. Conditional also on the complete inner trace,
    subtract the lower of these integers. The interior is now an ordinary height problem with trace in ${ 0 \,
    1 }$, and its distance from $z_0$ is between fixed multiples of $L_0 a$.
    Proposition 21 therefore gives a uniform conditional second-moment bound $C_A$.
    The random subtraction changes no zero-total smearing. Chebyshev’s inequality and then averaging over the
    search show, for some fixed $M gt.eq A \/ 2$,
  #[#set math.equation(numbering: n => "(3.15)")
   $ bb(P) \( \| Y \| lt.eq M \) gt.eq c_1 \/ 2 . $ <moments:plane-central>]
  If the finitely many smallest lattice scales require enlarging the annulus to accommodate rounding,
    use a fixed minimal annulus radius; its ratio to $a gt.eq 1$ remains bounded and the same constants suffice.
  To amplify this central bound, use the correct finite height measure.
    For any chosen anchor $o$, the four cyclic rotations of the Gray states preserve every increment and every
    interaction weight, and act transitively on the pair state at $o$.
    Consequently the unconditioned free pair has exactly the same increment law as its version with state
    $\( + \, + \)$ at $o$. By Lemma 3, the latter is the measure on integer $1$-Lipschitz arrays with $H \( o \) =
    0$ and density proportional to $x^(sum_(i j) \| H \( i \) - H \( j \) \|)$.
    Thus $Y$ in this anchored measure has the central bound (3.15).
    This argument obtains the cut central bound before fixing the anchor,
    and hence introduces no extra anchor constraint into the stopped interior law.
  The anchored arrays form one midpoint-admissible class by Lemma 19.
    Applying Lemma 20 proves (3.14) in finite volume. At fixed lattice weights, enlarge that volume.
    The increment convergence from Proposition 11 and the uniform bounds pass the estimate to the plane;
    higher moments also give convergence of every fixed finite moment.
    All constants above are independent of the location and radius of the smearing. ◻
]

#thm([Lemma 3.8.])[
  (Nondegeneracy between two disks).  #emph[Let $U_1 \, U_2$ be two fixed disjoint round disks with disjoint
    closures, and let $f_i gt.eq 0$ be smooth functions supported compactly in $U_i$, with $integral f_i = 1$.
    Form their exact face-area averages on the dilated lattice geometry of scale $R$.
    If $Y_R$ is the first average minus the second, there is $c > 0$ such that
#[#set math.equation(numbering: n => "(3.16)")
 $ bb(E) Y_R^2 gt.eq c $ <moments:nondegeneracy>]

 for all sufficiently large $R$, in the plane and in sufficiently large finite free volumes.
   The bound is uniform under translations of the fixed arrangement.]
] <lem:nondegeneracy>

#proof[
  Choose two disjoint nested annular collars around $"supp" f_1$ inside $U_1$, avoiding $"supp" f_2$.
    Prescribe an outer good $B$-plus cut and an inner good $B$-minus cut.
    Successive applications of Lemma 10 in these separated buffers give their joint probability at least $c_2 >
    0$, uniformly in $R$ large enough for rounding. Make the choices by the stopped searches following Lemma 9;
    the event and the selected cuts depend on first spins and cell statuses,
    and do not prescribe any second-spin labels.
  By Lemma 14, conditional on those variables there is a second-spin component in the intervening collar whose
    fair label flip changes every height in the inner protected region by $4$ in absolute value relative to the
    exterior of the outer cut. Choose the component measurably using a fixed ordering,
    and condition on all its other labels. The cuts, their event,
    and all weights of $Y_R$ are unchanged by this flip. Exact unit mass in the first disk and zero weight in the
    collar mean that the two values of $Y_R$ differ by $4$. A fair pair of real numbers at distance $4$ has
    variance $4$ and second moment at least $4$. Averaging over the cut event yields $bb(E) Y_R^2 gt.eq
    4 c_2$ in finite volume. The fourth-moment bound in Proposition 22 allows passage of these second moments to
    the plane. This proves the claim. ◻
]

=== 3.4 Exact area interpolation <exact-area-interpolation>

Let $Q_(delta \, u)$ be the hexagonal face centered at $u in delta bb(T)$.
  For a bounded compactly supported test $f$, use precisely

#[#set math.equation(numbering: n => "(3.17)")
 $ w_(delta \, f) \( u \) = integral_(Q_(delta \, u)) f \( z \) thin thin upright(d) z \, wide
   chevron.l h_delta \, f chevron.r = sum_u w_(delta \, f) \( u \) h_delta \( u \) . $ <moments:area-weights>]

This identity follows from the piecewise constant extension in the problem,
  including its zero extension outside the discrete domain.
  For tests supported inside that domain the tessellation gives the exact, rather than asymptotic, identities

$ sum_u w_(delta \, f) \( u \) = integral f \, wide sum_u \| w_(delta \, f) \( u \) \| lt.eq
  parallel f parallel_(L^1) \, wide \| w_(delta \, f) \( u \) \| lt.eq sqrt(3) / 2 delta^2 parallel f parallel_oo . $

In the plane these hold for every compactly supported test.
  A test supported in a disk of physical radius $r$, with $parallel f parallel_1 lt.eq
  A$ and $parallel f parallel_oo lt.eq A r^(- 2)$, therefore has smearing weights at radius $a = r \/ delta +
  O \( 1 \)$ with a constant multiple of the same weight bound.
  For any fixed physical geometry the condition $a gt.eq 1$ holds once the mesh is small.
  Reflection in a lattice symmetry takes each face to its reflected face,
  so this interpolation is exactly equivariant under every site reflection used below.
  A zero-integral test gives a zero-total smearing at every mesh.

In particular, on a fixed compact subset of a bounded domain,
  Proposition 21 bounds a normalized radius-$r$ average by $C_p \( 1 + sqrt(log \( 1 \/ r \)) \)$,
  with fixed geometry and the mesh sent to zero first. Finite sums of such localized smearings obey the same
  bounds by the triangle inequality. If the radius is a fixed small fraction of the distance to a bounded trace,
  the right side of (3.13) is uniformly bounded, even as both physical scales subsequently tend to zero.
  Finally, Proposition 22 gives a uniform bound for each fixed bounded family of zero-total smooth tests and their
  dilations. These assertions use ordinary Euclidean area weights throughout.

The class hypothesis (3.10) has deliberately not been asserted for any spin-pinned ensemble.
  The parity-class admissibility and central mass required in that setting will be proved in Proposition 38 before
  Lemma 20 is applied there.

== 4 Reflection and the plane normalization <sec:plane>

Throughout this section the law is the free plane pair obtained in Proposition 11,
  with the fixed weight $x in \[ 1 \/ sqrt(2) \, 1 \]$. Only its original nearest-neighbor interaction is used for
  reflection; no reflection symmetry of the auxiliary cell variables is needed.
  Write $xi_u = H \( u \) - H \( 0 \)$ for its height increments. If $f in C_c^oo \( bb(R)^2 \)$ has integral zero, set

$ H_delta \( f \) = sum_(u in bb(T)) w_(delta \, f) \( u \) H \( u \) \, wide w_(delta \, f) \( u \) =
  integral_(delta \( u + V \)) f \( z \) thin upright(d) z \, $

where $V$ is the closed unit-mesh hexagonal face centered at zero, with boundaries ignored in integrals.
  The faces $u + V$ tile the plane. In particular, $sum_u w_(delta \, f) \( u \) = integral f = 0$,
  so the statistic is independent of the additive lift. All these finite sums are centered by height reflection.
  We will show that their covariances converge to a positive multiple of the plane Green form,
  with the same constant along every mesh sequence. We then use this covariance to show that a Laplace test
  supported strictly on one side of a reflection line has covariance with its reflected test tending to zero.
  Reflection positivity will interpret this as a vanishing reflection seminorm,
  which Section 5 will use to transfer the Laplace identity through separated pinning conditions.

Use Euclidean coordinates, and put

$ e_1 = \( 1 \, 0 \) \, wide e_2 = \( 1 \/ 2 \, sqrt(3) \/ 2 \) \, wide P = frac(2 pi, sqrt(3)) \, wide
  bb(T)^(*) = { \( 2 pi m \, P \( 2 n - m \) \) : m \, n in bb(Z) } . $

The reciprocal torus is $hat(bb(T)) = bb(R)^2 \/ bb(T)^(*)$, with characters $u mapsto e^(i p dot.op u)$.
  Small neighborhoods of its origin always use their Euclidean representatives.
  We use $hat(f) \( p \) = integral e^(- i p dot.op z) f \( z \) thin upright(d) z$ for the continuum Fourier transform.

The covariance statement below is the output of the spectral argument.
  Its coefficient will be fixed by a full scalar cutoff limit,
  after the possible subsequential spectra have been identified.
  The proof is completed in the final subsection; the reflection-null insertion then follows from it.

#thm([Proposition 4.1.])[
  (Plane covariance and normalization).  #emph[There is a constant $v = v \( x \) in \( 0 \, oo \)$,
    depending only on the fixed weight $x$, such that for every pair of real zero-integral tests $f \,
    g in C_c^oo \( bb(R)^2 \)$,
#[#set math.equation(numbering: n => "(4.1)")
 $ lim_(delta arrow.b 0) bb(E) \[ H_delta \( f \) H_delta \( g \) \] & =
   frac(v, \( 2 pi \)^2) integral_(bb(R)^2) frac(hat(f) \( p \) overline(hat(g) \( p \)), \| p \|^2) thin upright(d) p\
 & = frac(v, 2 pi) integral.double_(bb(R)^2 times bb(R)^2) f \( z \) log frac(1, \| z - w \|) thin g \( w \) thin
   upright(d) z thin upright(d) w . $ <plane:eq:covariance>]

 The conclusion also holds for zero-integral tests converging in $C_c^oo$ with a common compact support.]
] <prop:plane-covariance>

=== 4.1 Reflection positivity and normal translation <reflection-positivity-and-normal-translation>

The row-conditioning proof below is the site-reflection construction of #cite(label("FILS1978")) Section 3,
  example 5 specialized to the present edge law. We include the normal-translation argument because positivity of
  that translation, not only reflection positivity of the field, is needed for the nonnegative Cauchy mixture.

#thm([Proposition 4.2.])[
  (Positive normal transfer).  #emph[Let $ell$ be any row of lattice sites parallel to one of the three unoriented
    nearest-neighbor directions, and choose one of its closed half-planes.
    The plane pair is reflection positive across $ell$. The assertion remains valid after adjoining any finite
    collection of fields
#[#set math.equation(numbering: n => "(4.2)")
 $ Z_s \( u \) = U_s exp { i s \( H \( u \) - H \( o \) \) } \, $ <plane:eq:phases>]

 where the $U_s$ are independent unit-circle Haar variables, independent of the pair, and $o$ is any anchor.]
  #emph[More precisely, let $theta_ell$ act on observables by spatial reflection,
    and take local functions supported in the chosen half-plane,
    whose height differences are evaluated along paths in that half-plane. Then
$ chevron.l F \, G chevron.r_ell = bb(E) #scale(x: 120%, y: 120%)[\[] overline(theta_ell F) thin G
  #scale(x: 120%, y: 120%)[\]] $

 is a positive semidefinite Hermitian form. In its quotient completion,
   translation farther into the half-plane by the pure normal vector of length $sqrt(3)$ is a positive
   self-adjoint contraction $S$. Unit translation along the row is a commuting unitary $U$.
   At mesh $delta$ the normal step is $sqrt(3) delta$.]
] <prop:reflection-transfer>

#proof[
  Take first a reflection-symmetric finite free volume, chosen so that its intersection with the row is connected
    and contains the observables under consideration. No edge of the triangular lattice jumps across a row of
    sites. Conditional on the row spins, the two strict sides therefore have independent,
    reflected-identical laws: every original edge weight belongs to a single side together with its row boundary.
    Row spins determine relative row heights. If phases are present,
    condition also on their values at one row anchor. On each side the other phases are determined from those
    anchor phases and the increments on that side. Their conditional Haar law at the row anchor is independent of
    the spins, even if the original anchor $o$ was elsewhere. Consequently
  $ bb(E) #scale(x: 120%, y: 120%)[\[] overline(theta_ell F) thin F #scale(x: 120%, y: 120%)[\]] =
    bb(E) [lr(|bb(E) \[ F divides upright("row spins and row phases") \]|)^2] gt.eq 0 . $
  The plane limit gives the same inequality for local functions.
    Ordinary $L^2$ approximation is also allowed, since $\| chevron.l F \, G chevron.r_ell \| lt.eq
    parallel F parallel_2 parallel G parallel_2$. Changing the anchor or translating the configuration multiplies
    each $U_s$ by a unit complex number determined by the increments. Conditional Haar measure is unchanged.
    This proves stationarity and all the lattice reflection symmetries also for the augmented law.
  For the operator statement take $ell = { y = 0 }$ and the upper half-plane.
    A site has coordinates $\( m + n \/ 2 \, n sqrt(3) \/ 2 \)$.
    Reflections in $y = 0$ and $y = sqrt(3) \/ 2$ send its integer coordinates respectively to
    $\( m + n \, - n \)$ and $\( m + n - 1 \, 2 - n \)$. Thus both are site-row reflections,
    and their composition gives the pure normal translation $a = \( 0 \, sqrt(3) \)$.
    Let $T$ denote translation of observables by $a$. Stationarity and $theta_ell T = T^(- 1) theta_ell$ imply
  $ chevron.l T F \, G chevron.r_ell = chevron.l F \, T G chevron.r_ell . $
  Furthermore $T F$ is supported above the halfway row $y = sqrt(3) \/ 2$,
    and reflection of $T F$ in that row is $theta_ell F$. Reflection positivity at that row gives $chevron.l F \,
    T F chevron.r_ell gt.eq 0$.
  Boundedness must be proved before taking the quotient. Put $a_n = chevron.l T^n F \,
    T^n F chevron.r_ell^(1 \/ 2)$. Symmetry and reflection Cauchy–Schwarz yield
  $ a_n^2 = chevron.l T^(n - 1) F \, T^(n + 1) F chevron.r_ell lt.eq a_(n - 1) a_(n + 1) quad \( n gt.eq 1 \) \,
    wide a_n lt.eq parallel F parallel_2 . $
  If $a_0 = 0$, the first inequality gives $a_1 = 0$. Otherwise an increase $a_1 > a_0$ would, by log-convexity,
    force geometric growth, contradicting the second inequality.
    Hence $parallel T F parallel_ell lt.eq parallel F parallel_ell$.
    The operator descends to the quotient and extends to a bounded symmetric positive operator on its completion,
    hence to a positive self-adjoint contraction $S$. Tangential translation preserves the form and has an inverse
    with the same property. It therefore gives a unitary $U$; $U \, U^(- 1)$ commute with $S$.
    Rotation by $pi \/ 3$ and $2 pi \/ 3$, and translation of the base row,
    give exactly the same construction in all three directions. ◻
]

=== 4.2 The increment spectrum and its Cauchy representation <the-increment-spectrum-and-its-cauchy-representation>

#thm([Lemma 4.3.])[
  (Punctured spectral measure).  #emph[There is a positive, locally finite measure $C$ on $hat(bb(T)) \\ { 0 }$,
    invariant under the lattice rotations and reflections, such that every finitely supported real array
    $\( b_u \)$ with $sum b_u = 0$ satisfies
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) lr(|sum_u b_u H \( u \)|)^2 = integral lr(|sum_u b_u e^(i p dot.op u)|)^2 C \( thin upright(d) p \) .
   $ <plane:eq:spectrum>]

 There is no invariant random linear tilt term. Moreover, for some $r_0 > 0$ and $K < oo$,
#[#set math.equation(numbering: n => "(4.4)")
 $ C { r lt.eq \| p \| lt.eq 2 r } lt.eq K quad \( 0 < r < r_0 \) \, wide
   integral_(0 < \| p \| < r_0) \| p \|^t C \( thin upright(d) p \) < oo quad \( t > 0 \) . $ <plane:eq:annuli>]

]
] <plane:lem:spectrum>

#proof[
  Let $V_u$ be ordinary unitary translation on the plane probability space.
    Lemma 60, applied to the two basis translations, constructs their scalar covariance measures
    $mu_(a \, b) \( thin upright(d) p \)$ on $hat(bb(T))$. Write $P_0$ for the common invariant projection.
    All increments belong to $L^2$, since $\| xi_u \|$ is bounded by the graph distance from zero to $u$.
    The cocycle identity gives
  $ xi_(u + v) = xi_v + V_v xi_u \, wide \( V_v - I \) xi_u = \( V_u - I \) xi_v . $
  Put $d_u \( p \) = e^(i p dot.op u) - 1$. The polynomial covariance identity in Lemma 60 transfers the cocycle
    relation to the scalar measures. On a patch where $d_v eq.not 0$, it gives $mu_(xi_u \, xi_w) =
    overline(d_u) d_w mu_(xi_v \, xi_v) \/ \| d_v \|^2$. Division is made first on compact subpatches where the
    denominator is bounded below. Thus define there
  $ C \( thin upright(d) p \) = frac(mu_(xi_v \, xi_v) \( thin upright(d) p \), \| e^(i p dot.op v) - 1 \|^2) . $
  The definitions agree on overlaps. The two choices $v = e_1 \, e_2$ cover the punctured torus;
    on every compact subset their denominators are bounded below on a finite cover.
    This proves local finiteness and (4.3) for the part orthogonal to $P_0$.
  The remaining projected cocycle is additive: $P_0 xi_u = A dot.op u$ for some random vector $A in L^2$.
    For a smooth compactly supported $f$ of integral zero, use the exact face weights for $R^(- 2)
    f \( z \/ R \)$ at unit mesh. Their first lattice moment is
  $ sum_u u integral_(u + V) R^(- 2) f \( z \/ R \) thin upright(d) z = R integral z f \( z \) thin upright(d) z +
    O \( 1 \) \, $
  where the deterministic error is bounded because $\| u - z \|$ is bounded on $u + V$.
    Orthogonal projection and Proposition 22 bound the $L^2$ norm of the dot product of $A$ with this vector
    uniformly in $R$. Divide by $R$ and let $R arrow.r oo$. Choosing two such $f$ with independent first moments
    proves $A = 0$. Orthogonality rules out any cancellation between this tilt and other spectral components.
    Uniqueness of the local construction of $C$ gives its stated symmetries.
  For the annular estimate choose a real smooth bump $b$ with integral one and support so small that $hat(b)$ has
    no zero on $\| p \| lt.eq 2$. The tests $f_1 = partial_1 b$ and $f_2 = partial_2 b$ have integral zero,
    and $\| hat(f)_1 \|^2 + \| hat(f)_2 \|^2$ is bounded below on $1 lt.eq \| p \| lt.eq 2$.
    Let $b_u^(\( r \, j \))$ be the unit-face weights for $r^2 f_j \( r z \)$.
    Their absolute sums are bounded and their largest absolute values are $O \( r^2 \)$;
    their supports have radius $O \( r^(- 1) \)$. For $1 lt.eq \| p \| lt.eq 2$,
  $ sum_u b_u^(\( r \, j \)) e^(i r p dot.op u) arrow.r hat(f)_j \( - p \) quad upright("uniformly as ") r arrow.b 0 . $
  Indeed replacing the face center by a point in its face changes the exponential by $O \( r \)$ uniformly here.
    Apply Proposition 22 and (4.3) to the two weights. Their squared transforms bound below a positive constant on
    $r lt.eq \| p \| lt.eq 2 r$, proving the first assertion in (4.4) for small $r$.
    Local finiteness handles any remaining compact range of radii.
    Summation over dyadic annuli gives the second assertion. ◻
]

Restrict translations to the rectangular sublattice generated by $e_1$ and $\( 0 \, sqrt(3) \)$.
  Its reciprocal torus has centered rectangle

$ cal(R) = \[ - pi \, pi \) times \[ - P \/ 2 \, P \/ 2 \) . $

The projection $pi : hat(bb(T)) arrow.r cal(R)$ is a two-sheeted covering.
  The preimages of zero are zero and the nonzero alias $a_(*) = \( 0 \, P \)$ on $hat(bb(T))$.
  Let $C' = pi_(*) C$, with the value of $C$ at the omitted origin set to zero when interpreting this pushforward.
  For $0 < s < oo$ define the probability measure $Q_s$ on the normal circle by

#[#set math.equation(numbering: n => "(4.5)")
 $ Q_s \( thin upright(d) l \) = q_s \( l \) thin upright(d) l \, wide q_s \( l \) =
   sum_(n in bb(Z)) frac(s, pi { s^2 + \( l + n P \)^2 }) . $ <plane:eq:cauchy>]

Here and below an integral over $l$ uses the centered period.
  Set $Q_0 = delta_0$ and let $Q_oo$ be uniform probability on that circle.

#thm([Lemma 4.4.])[
  (Positive Cauchy mixture and exceptional sets).  #emph[On $k eq.not
    0$ in the rectangular torus there is a positive measure $nu \( thin upright(d) k \, thin upright(d) s \)$ such that
#[#set math.equation(numbering: n => "(4.6)")
 $ C' \( thin upright(d) k \, thin upright(d) l \) = integral_(\[ 0 \, oo \]) Q_s \( thin upright(d) l \) thin
   nu \( thin upright(d) k \, thin upright(d) s \) . $ <plane:eq:mixture>]

 The measure $nu$ is finite on horizontal bands bounded away from zero, and,
   for every sufficiently small fixed $kappa > 0$,
#[#set math.equation(numbering: n => "(4.7)")
 $ integral_(0 < \| k \| < kappa) \| k \| thin nu \( thin upright(d) k \, thin upright(d) s \) < oo .
   $ <plane:eq:weighted-nu>]

 The physical punctured line $k = 0$ near zero has zero $C$ mass, and $C { a_(*) } = 0$.
   These conclusions hold before any rescaling limit is taken.
   The analogous assertions hold in each of the three rotated charts.]
] <plane:lem:mixture>

#proof[
  Take $F = xi_(e_1)$, an observable on the horizontal reflection row.
    Apply the scalar construction of Lemma 61 to the commuting $U \, S$ from Proposition 25.
    It gives a finite positive measure $gamma \( thin upright(d) k \, thin upright(d) lambda \)$ on the unit
    circle times $\[ 0 \, 1 \]$ such that, for every $m in bb(Z)$ and $j gt.eq 0$,
  $ bb(E) \[ F thin V_(m e_1 + j \( 0 \, sqrt(3) \)) F \] = chevron.l F \, U^m S^j F chevron.r_ell =
    integral e^(i m k) lambda^j thin gamma \( thin upright(d) k \, thin upright(d) lambda \) . $
  Reflection in the base row gives the same expression with $\| j \|$ for negative $j$.
    Put $lambda = e^(- sqrt(3) s)$, interpreting $lambda = 0$ as $s = oo$.
    The $j$th Fourier coefficient of $Q_s$ is $e^(- sqrt(3) s \| j \|)$, including both endpoints.
    Uniqueness of Fourier coefficients of finite measures on the rectangular torus identifies the ordinary
    spectral measure of $F$ with this mixture. By (4.3) that measure is $\| e^(i k) -
    1 \|^2 C' \( thin upright(d) k \, thin upright(d) l \)$. Dividing by this strictly positive factor on $k
    eq.not 0$ gives (4.6) and local finiteness of $nu$ there.
    Since $Q_s$ has total mass one, the left side of (4.7) equals $integral_(0 < \| k \| < kappa) \| k \| thin
    C' \( thin upright(d) k \, thin upright(d) l \)$. Near the physical origin this is finite by (4.4) and $\|
    k \| lt.eq \| p \|$; its remaining preimage has finite mass by local finiteness on the physical torus away
    from zero. This includes a neighborhood of $a_(*)$ and does not require any estimate on horizontal bands near zero.
  For the physical line take a compact segment of $k = 0$ in a small punctured disk and rotate it through $pi \/
    3$. Its coordinates become $\( k' \, l' \) = \( - sqrt(3) l \/ 2 \, l \/ 2 \)$:
    both are nonzero, and the image is a nonvertical graph away from $l' = 0$.
    For each fixed $k'$ its normal section is a singleton outside zero.
    Every $Q_s$ assigns zero mass to this singleton: $Q_s$ is nonatomic for $s > 0$, including $s = oo$,
    while $Q_0$ is supported at zero. Applying (4.6) and then positivity of the pushforward gives zero mass to the
    rotated segment, hence to the original segment. Countably many segments cover the punctured line.
    For the alias, rotation sends $\( 0 \, P \)$ to $\( - pi \, P \/ 2 \)$.
    On the rectangular torus this point has nonzero tangential and nonzero normal coordinates.
    The same mixture argument gives zero mass to that point. Projection can only add mass,
    so invariance under rotation yields $C { a_(*) } = 0$. In particular this argument does not identify the two
    boundary representatives of the rectangle on the physical torus.
    Rotating the entire construction proves the assertions for the other row directions. ◻
]

=== 4.3 A summable dispersion defect <a-summable-dispersion-defect>

The unperiodized Cauchy kernel with $s = \| k \|$ has density $\| k \| \/ { pi \( k^2 + l^2 \) }$.
  We next show that only mixing mass near this relation survives at small frequencies.
  The three mirror directions will then determine the tangential measure as well.
  The key estimate comes from averaging a fourth angular harmonic,
  whose rotational average vanishes but whose Cauchy average measures the deviation from $s = \| k \|$.

For centered coordinates write

$ chi \( k \, l \) = cos \( 4 arg \( k + i l \) \) = 1 - frac(8 k^2 l^2, \( k^2 + l^2 \)^2) \,
  wide \( k \, l \) eq.not 0 \, $

and put

$ D \( k \, s \) = (frac(\| k \| - s, \| k \| + s))^2 quad \( s < oo \) \, wide D \( k \, oo \) = 1 . $

#thm([Lemma 4.5.])[
  (Angular identity and summable defect).  #emph[Uniformly for $s in \[ 0 \, oo \]$ and sufficiently small $k eq.not 0$,
#[#set math.equation(numbering: n => "(4.8)")
 $ integral chi \( k \, l \) Q_s \( thin upright(d) l \) = D \( k \, s \) + O \( \| k \| \) . $ <plane:eq:poisson>]

 For some fixed $kappa > 0$,
#[#set math.equation(numbering: n => "(4.9)")
 $ integral_(0 < \| k \| < kappa) D \( k \, s \) thin nu \( thin upright(d) k \, thin upright(d) s \) < oo .
   $ <plane:eq:defect>]

 There is also $K_1 < oo$ such that, for all sufficiently small $r > 0$,
#[#set math.equation(numbering: n => "(4.10)")
 $ nu { r lt.eq \| k \| lt.eq 2 r } lt.eq K_1 . $ <plane:eq:bands>]

]
] <plane:lem:defect>

#proof[
  Put $a = \| k \|$. The analytic function $\( \( a + i z \) \/ \( a - i z \) \)^2$ is bounded in the upper
    half-plane, has boundary real part $chi \( a \, l \)$, and has real value $\( \( a - s \) \/ \( a + s \) \)^2$
    at $z = i s$. The Poisson formula therefore gives the exact line identity
  #[#set math.equation(numbering: n => "(4.11)")
   $ integral_(bb(R)) chi \( a \, l \) frac(s thin upright(d) l, pi \( s^2 + l^2 \)) =
     (frac(a - s, a + s))^2 quad \( 0 < s < oo \) . $ <plane:eq:line-poisson>]
  Here the Poisson formula applies to a bounded harmonic function with continuous boundary values,
    so no boundary growth condition is missing. To estimate periodization, let $f_a \( l \) = 1 -
    chi \( a \, l \) = 8 a^2 l^2 \/ \( a^2 + l^2 \)^2$. Direct integration gives
  $ integral_(bb(R)) f_a \( l \) thin upright(d) l = 4 pi a \, wide 0 lt.eq f_a \( l \) lt.eq
    frac(8 a^2, l^2) quad \( l eq.not 0 \) . $
  If $p_s \( l \) = s \/ { pi \( s^2 + l^2 \) }$, then
  $ M_P := sup_(s > 0 \, med \| l \| lt.eq P \/ 2) sum_(n eq.not 0) p_s \( l + n P \) < oo . $
  Indeed for $s lt.eq P$ use $\| l + n P \| gt.eq P \( \| n \| - 1 \/ 2 \)$ and sum the square tail;
    for $s > P$ the $O \( s \/ P \)$ terms with $\| n \| lt.eq 2 s \/ P +
    1$ are each at most $1 \/ \( pi s \)$ and the remaining terms have a summable $s \/ \( n P \)^2$ bound.
    The difference between the periodized and line integrals of $f_a$ is at most
  $ 4 pi M_P a + integral_(\| l \| > P \/ 2) f_a \( l \) p_s \( l \) thin upright(d) l lt.eq 4 pi M_P a +
    32 a^2 \/ P^2 . $
  This proves (4.8) uniformly for finite positive $s$. For $s = 0$ it is exact; for $s =
    oo$ use the uniform density and $integral f_a lt.eq 4 pi a$.
  Integrate (4.8) over $epsilon.alt < \| k \| < kappa$. Its error is bounded independently of $epsilon.alt$ by
    (4.7). Replacing the projected integral by the physical integral inside $\| p \| <
    kappa$ changes it by a bounded amount: the remaining physical region, including the other sheet,
    has finite mass away from zero. Thus it suffices to bound above
  $ integral_(epsilon.alt < \| p \| < kappa \, med \| k \| > epsilon.alt) chi \( k \, l \) thin
    C \( thin upright(d) p \) . $
  The integral over the full radial annulus is exactly zero,
    since $sum_(j = 0)^5 cos \( 4 \( arg p + j pi \/ 3 \) \) = 0$ and $C$ is rotation invariant.
    In the deleted cap $\| k \| lt.eq epsilon.alt$, the negative part of $chi$ is confined to $\|
    l \| < \( 1 + sqrt(2) \) \| k \|$, hence to $epsilon.alt < \| p \| < K_2
    epsilon.alt$ for an absolute constant $K_2$. A fixed number of annular bounds in (4.4) controls that negative
    part. Deleting the positive part can only lower the integral.
    We have obtained an upper bound independent of $epsilon.alt$.
    Since $D gt.eq 0$, monotone convergence proves (4.9). This use of a negative cap requires only annular bounds,
    not the quantitative endcap estimate proved below.
  On $r lt.eq \| k \| lt.eq 2 r$, if $s in.not \[ r \/ 2 \, 4 r \]$ then $D \( k \, s \) gt.eq 1 \/ 9$;
    (4.9) bounds the mass of this part. For $s in \[ r \/ 2 \, 4 r \]$, the central, unperiodized part of $Q_s$ gives
  $ Q_s { \| l \| lt.eq 2 r } gt.eq 2 / pi arctan \( 1 \/ 2 \) > 0 $
  when $r$ is small. Equation (4.6) therefore bounds the remaining $nu$ mass by a constant times $C' { r lt.eq \|
    k \| lt.eq 2 r \, med \| l \| lt.eq 2 r }$. The physical-origin preimage lies in a fixed number of annuli of
    scale $r$, and the alias preimage has bounded finite mass. This proves (4.10). ◻
]

#thm([Lemma 4.6.])[
  (Endcaps).  #emph[After decreasing $r_0$ if necessary, there is $K_3 < oo$ such that
#[#set math.equation(numbering: n => "(4.12)")
 $ C { b < \| p \| lt.eq 2 b \, med \| k \| lt.eq h } lt.eq K_3 h /
   b wide \( 0 < b < r_0 \, quad 0 < h < b \/ 10 \) . $ <plane:eq:endcaps>]

 The same bound holds in each rotated chart. In particular,
   rescaling cannot create mass on one of the tangential zero lines inside a compact punctured annulus.]
] <lem:endcaps>

#proof[
  Rotate the indicated cap through $pi \/ 3$. Both new coordinates $k' \, l'$ have magnitude comparable to $b$.
    At fixed $k'$, the inequality $\| k \| lt.eq h$ restricts $l'$ to an interval of length $4 h \/ sqrt(3)$.
    For example $0.8 b lt.eq \| k' \| lt.eq 1.8 b$ and $0.4 b lt.eq \| l' \| lt.eq
    1.1 b$ suffice when $h < b \/ 10$. The central Cauchy density is bounded there, uniformly in $s > 0$,
    by $1 \/ \( 2 pi \| l' \| \) lt.eq K \/ b$; its folded tails are bounded by $M_P$.
    The uniform endpoint obeys the same bound, and the $s = 0$ atom misses the interval.
    The relevant horizontal band has bounded $nu$ mass by (4.10),
    enlarging by finitely many dyadic bands if necessary. Apply (4.6) and note that projection adds nonnegative
    mass to the rotated physical cap. This proves (4.12). Applying the bound with $b = delta b_0$ and $h =
    delta h_0$, then sending $h_0 arrow.b 0$, proves the last assertion for every vague limit;
    continuous cutoff majorants justify passage to such limits. ◻
]

=== 4.4 The full spectral scaling limit <the-full-spectral-scaling-limit>

For $delta > 0$ rescale a fixed small physical neighborhood of zero by $p mapsto p \/ delta$,
  and denote its image measure by $C_delta$. On every fixed compact subset of $bb(R)^2 \\ {
  0 }$ this is well defined for small $delta$. Equation (4.4) gives local boundedness and hence subsequential
  vague compactness.

#thm([Lemma 4.7.])[
  (Form of every subsequential spectrum).  #emph[Every vague subsequential limit is
#[#set math.equation(numbering: n => "(4.13)")
 $ M \( thin upright(d) p \) = c frac(thin upright(d) p, \| p \|^2) $ <plane:eq:subsequence>]

 for some finite $c gt.eq 0$, at this point possibly depending on the subsequence.
   This identity holds on the entire punctured plane, including the tangential zero lines.]
] <plane:lem:subsequences>

#proof[
  Fix $0 < a < b < oo$ and work on the rescaled horizontal band $a lt.eq \| k \| \/ delta lt.eq b$.
    Rescale the mixing variables to $\( k \/ delta \, s \/ delta \)$.
    Their masses are bounded by finitely many instances of (4.10).
    Their integral of $D$ tends to zero by (4.9), since the unscaled bands shrink to zero while excluding it.
    On this band the scale-invariant function $D$ is bounded below away from zero whenever $s \/
    delta$ stays outside any fixed neighborhood of $\| k \| \/ delta$; this includes $s \/ delta = oo$.
    Thus every limiting mixing measure is concentrated on the graph $s = \| k \|$ in the rescaled coordinates.
    More explicitly, mass outside $\| s \/ \| k \| - 1 \| < epsilon$ is bounded by a constant depending on
    $epsilon$ times the integral of $D$, and tends to zero. This also gives tightness in the rescaled $s$ coordinate.
  Uniformly for $a \/ 2 lt.eq t lt.eq 2 b$ and $l$ in a compact set,
  $ delta q_(delta t) \( delta l \) = frac(t, pi \( t^2 + l^2 \)) + O \( delta \) \, $
  by the folded-tail bound in the proof of Lemma 28. Consequently every further extraction of the bounded mixing
    measures gives, on $k eq.not 0$,
  #[#set math.equation(numbering: n => "(4.14)")
   $ M \( thin upright(d) k \, thin upright(d) l \) = frac(\| k \|, pi \( k^2 + l^2 \)) thin
     eta \( thin upright(d) k \) thin upright(d) l $ <plane:eq:limiting-mixture>]
  for some locally finite positive measure $eta$ in the tangential coordinate.
    A diagonal extraction over compact horizontal subbands makes these descriptions consistent.
    The other physical preimage of a bounded rescaled set shrinks to $a_(*)$;
    its mass tends to zero by local finiteness there and $C { a_(*) } = 0$, already proved in Lemma 27.
    Thus (4.14) indeed describes the physical measure, with no alias contribution.
  Multiplying (4.14) by $\| p \|^2$ shows that the normal distributional derivative of $\| p \|^2
    M$ vanishes on $k eq.not 0$. No density assumption on $eta$ is being made.
    Repeating in the other two row directions, at every nonzero point at least two of the three tangential
    coordinates are nonzero. The corresponding normal directions are independent.
    On a neighborhood of that point the two independent directional derivatives of $\| p \|^2 M$ vanish.
    A distribution with this property is constant there: convolve on a smaller ball with a smooth approximate
    identity, observe that both derivatives of each convolution vanish, and pass to the limit.
    The constants agree on overlaps, and the punctured plane is connected.
    It follows that $\| p \|^2 M = c thin upright(d) p$ there.
    This argument covers the axes by the other charts; Lemma 29 also directly excludes concentration on them.
    Positivity and the annular bound give $0 lt.eq c < oo$. ◻
]

The annular bound and the preceding lemma alone would not imply that $c$ is unique.
  We next construct a scalar limit before selecting a spectral subsequence.

#thm([Lemma 4.8.])[
  (A cutoff identity determining the coefficient).  #emph[There is a single $c gt.eq
    0$ such that $C_delta$ converges vaguely to $c thin upright(d) p \/ \| p \|^2$ as $delta arrow.b 0$.]
] <plane:lem:unique>

#proof[
  Choose an even smooth $q_0$ with $0 lt.eq q_0 lt.eq 1$, equal to one on $\[ - 1 \/ 2 \, 1 \/ 2 \]$ and zero
    outside $\( - 1 \, 1 \)$. Let $Q$ be a smooth radial cutoff supported in a sufficiently small physical disk
    and equal to one near zero. For $h > 0$ put
  #[#set math.equation(numbering: n => "(4.15)")
   $ J \( h \) = integral Q \( p \) chi \( k \, l \) \[ q_0 \( \| p \| \/ h \) - q_0 \( k \/ h \) \] thin
     C \( thin upright(d) p \) . $ <plane:eq:cutoff>]
  Each integrand vanishes near zero and has compact support in the physical chart, so this is a finite integral.
    We first show that $J \( h \)$ has a full limit as $h arrow.b 0$. Split its bracket as
  $ \[ q_0 \( \| p \| \/ h \) - 1 \] + \[ 1 - q_0 \( k \/ h \) \] . $
  The first term has integral zero by sixfold rotation, since its other factors except $chi$ are radial and it
    vanishes near zero. For the second term replace the physical cutoff $Q$ by the rectangular strip $0 < \|
    k \| < kappa$ in (4.6). The resulting error has a limit by dominated convergence:
    in a sufficiently small physical neighborhood of zero the cutoffs and centered coordinates agree;
    all remaining contributions come from a finite measure away from that origin,
    including the alias neighborhood. Their multipliers are bounded and converge pointwise as $h arrow.b 0$.
    On $k = 0$ the factor $1 - q_0 \( k \/ h \)$ is identically zero.
  For the strip contribution set $A \( k \, s \) = integral chi \( k \, l \) Q_s \( thin upright(d) l \)$.
    Equations (4.8), (4.9), and (4.7) give
  $ \| A \( k \, s \) \| lt.eq D \( k \, s \) + K \| k \| \, wide
    integral_(0 < \| k \| < kappa) \| A \( k \, s \) \| thin nu \( thin upright(d) k \, thin upright(d) s \) < oo . $
  Dominated convergence applied to $integral \( 1 - q_0 \( k \/ h \) \) A \( k \, s \)
    nu \( thin upright(d) k \, thin upright(d) s \)$ proves that the strip contribution has a limit. Thus
  #[#set math.equation(numbering: n => "(4.16)")
   $ L := lim_(h arrow.b 0) J \( h \) $ <plane:eq:cutoff-full-limit>]
  exists, using only the summable defect and finite cutoff errors,
    without any assumption about a spectral scaling limit.
  Now take any sequence along which $C_h arrow.r c thin upright(d) p \/ \| p \|^2$.
    In the rescaled variable the bracket in (4.15) is $q_0 \( \| p \| \) - q_0 \( k \)$,
    which vanishes on $\| p \| lt.eq 1 \/ 2$. On a dyadic annulus $R < \| p \| lt.eq 2 R$ with $R > 10$,
    it is supported on $\| k \| lt.eq 1$. Equation (4.12), used at physical scales $b =
    h R$ and horizontal width $h$, bounds that mass by $K \/ R$.
    Summing dyadic annuli gives a uniform $O \( 1 \/ R \)$ tail, up to the edge of the fixed support of $Q$.
    Vague convergence on the remaining compact annulus therefore gives
  #[#set math.equation(numbering: n => "(4.17)")
   $ L & = c integral_(bb(R)^2) frac(chi \( k \, l \), \| p \|^2) \[ q_0 \( \| p \| \) - q_0 \( k \) \] thin
     upright(d) p\
 & = c integral_0^(2 pi) cos \( 4 u \) integral_0^oo \[ q_0 \( r \) - q_0 \( r \| cos u \| \) \]
   frac(thin upright(d) r, r) thin upright(d) u = - pi / 2 c . $ <plane:eq:cutoff-value>]
  For completeness, for $t > 0$ the inner radial integral with $t = \| cos u \|$ equals $log t$:
    integrate first from $epsilon$ to $M$, change variables in the second term, then use that $q_0 =
    1$ near zero and vanishes for large argument. Its absolute integral is bounded by $K \( 1 + \| log t \| \)$,
    which is integrable in $u$, justifying Fubini. The angular value can be checked without a Fourier-series limit:
  $ integral_0^(2 pi) cos \( 4 u \) log \| cos u \| thin upright(d) u =
    4 integral_0^(pi \/ 2) cos \( 4 u \) log \( cos u \) thin upright(d) u =
    4 integral_0^(pi \/ 2) sin^2 u cos \( 2 u \) thin upright(d) u = - pi / 2 . $
  The middle equality follows by integration by parts; the boundary term $sin \( 4 u \)
    log \( cos u \)$ vanishes at both ends. Since $L$ was defined by a full limit,
    (4.17) fixes the same $c$ for every subsequence. Subsequence compactness then gives full vague convergence. ◻
]

=== 4.5 Euclidean area covariance and reflection-null insertions <euclidean-area-covariance-and-reflection-null-insertions>

#proof[
  For the exact area weights define $A_(delta \, f) \( p \) = sum_u w_(delta \, f) \( u \) e^(i p dot.op u)$.
    On every fixed compact set of $zeta$,
  #[#set math.equation(numbering: n => "(4.18)")
   $ A_(delta \, f) \( delta zeta \) arrow.r hat(f) \( - zeta \) quad
     upright("uniformly") . $ <plane:eq:transform-limit>]
  Indeed the defining sum is the integral of $f \( z \)$ times the exponential at its face center.
    Replacing that center by $z$ changes the exponential by $O \( delta \| zeta \| \)$ on each face.
    The total integral is exact, so no lattice-cell area factor remains.
  We record bounds that also control frequencies outside a fixed rescaled annulus.
    For every integer $N gt.eq 1$, in a fixed small physical neighborhood of zero,
  #[#set math.equation(numbering: n => "(4.19)")
   $ \| A_(delta \, f) \( p \) \| lt.eq K_N min {frac(\| p \|, delta) \, \( 1 + \| p \| \/ delta \)^(- N)} \,
     $ <plane:eq:transform-bounds>]
  and on the complement of that neighborhood it is $O_N \( delta^N \)$.
    The first bound follows from exact zero total and $sum_u \| w_(delta \, f) \( u \) \| thin \| u \| =
    O \( delta^(- 1) \)$. For the other bounds, let $Delta_e$ denote a unit lattice difference in a basis
    direction. Translation of faces gives
  $ sum_u \| Delta_e^N w_(delta \, f) \( u \) \| lt.eq integral_(bb(R)^2) \| Delta_(delta e)^N f \( z \) \| thin
    upright(d) z lt.eq delta^N parallel partial_e^N f parallel_(L^1) . $
  Discrete summation by parts therefore bounds $\| 1 - e^(i p dot.op e) \|^N \|
    A_(delta \, f) \( p \) \|$ by this last quantity. Near zero at least one of the two basis multipliers is at
    least $a \| p \|$; away from zero on the reciprocal torus at least one is bounded below on a finite compact
    cover. Together with $\| A_(delta \, f) \| lt.eq parallel f parallel_1$, these estimates prove (4.19).
    Their constants are uniform for a bounded smooth family with a common compact support.
  Equations (4.3) and (4.4) now allow passage to the full Fourier integral.
    For example the contribution of $\| p \| < epsilon.alt delta$ to a variance is $O \( epsilon.alt^2 \)$ by the
    first bound in (4.19) and dyadic summation. The contribution of $R delta < \| p \| <
    r_0$ is $O_N \( R^(- 2 N) \)$; the remaining compact part of the torus contributes $O_N \( delta^(2 N) \)$ by
    local finiteness. On $epsilon.alt delta lt.eq \| p \| lt.eq R delta$ use Lemma 31 and (4.18).
    Let first $delta arrow.b 0$, then $epsilon.alt arrow.b 0$ and $R arrow.r oo$.
    This gives the variance limit $c integral \| hat(f) \( p \) \|^2 \| p \|^(- 2) thin upright(d) p$;
    polarization gives the bilinear formula. The same estimates prove the assertion for smoothly converging tests.
  The distribution $\( 2 pi \)^(- 1) log \( 1 \/ \| z \| \)$ is the fundamental solution of $-
    Delta$ on the plane. Its ambiguity by a constant is irrelevant to zero-integral tests.
    Fourier inversion with the stated convention thus gives the second line of (4.1) and the normalization
  #[#set math.equation(numbering: n => "(4.20)")
   $ v = \( 2 pi \)^2 c \, wide sigma \( x \) = sqrt(v) . $ <plane:eq:normalization>]
  Finiteness of $c$ was already proved. Lemma 23 supplies two fixed smooth nonnegative unit averages on separated
    disks whose difference $f$ has $inf_(delta upright(" small")) bb(E) H_delta \( f \)^2 > 0$.
    The covariance limit therefore rules out $c = 0$. All constructions have used only the fixed plane law at
    weight $x$; there is no domain or approximation parameter in $v$. ◻
]

#thm([Proposition 4.9.])[
  (Reflection-null Laplace insertion).  #emph[Fix one of the three row directions.
    Let $ell_delta$ be site rows of $delta bb(T)$ converging to a line $ell$ in that direction,
    and choose the same side of each row. Suppose that real $phi_delta arrow.r phi$ in $C_c^oo \( bb(R)^2 \)$,
    with common compact support lying on that side at a positive distance from $ell_delta$ for all sufficiently
    small $delta$. Put $X_delta = H_delta \( Delta phi_delta \)$, using exact area weights. Then
#[#set math.equation(numbering: n => "(4.21)")
 $ parallel X_delta parallel_(ell_delta)^2 = bb(E) \[ \( theta_(ell_delta) X_delta \) X_delta \] arrow.r 0 \, wide
   sup_(delta upright(" small")) parallel X_delta parallel_(L^2) < oo . $ <plane:eq:reflection-null>]

 This holds also in every finitely phase-augmented reflection space of Proposition 25.
   In particular, if $Y_delta$ is supported on the same side and has bounded reflection norm,
   then $bb(E) \[ \( theta_(ell_delta) Y_delta \) X_delta \] arrow.r 0$.]
] <prop:reflection-null>

#proof[
  All Laplace tests have integral zero. Reflection in a site row permutes the hexagonal faces exactly, so
  $ theta_(ell_delta) X_delta = H_delta #scale(x: 120%, y: 120%)[\(]
    Delta \( phi_delta compose theta_(ell_delta) \) #scale(x: 120%, y: 120%)[\)] $
  as zero-total increment observables. Their supports, including the finitely many faces meeting the test
    supports, lie strictly on opposite sides once $delta$ is small.
    The tests and their reflections converge smoothly on fixed compact sets.
    By Proposition 24, the limit of their covariance is
  $ frac(v, \( 2 pi \)^2) integral \| p \|^2 hat(phi) \( p \) overline(accent(phi compose theta_ell, ̂) \( p \))
    thin upright(d) p = v integral nabla phi \( z \) dot.op nabla \( phi compose theta_ell \) \( z \) thin
    upright(d) z = 0 \, $
  because the two supports are disjoint. Reflection positivity makes the finite-mesh quantity a squared seminorm.
    The ordinary second moments are bounded by Proposition 22, or by Proposition 24.
    Adjoining independent Haar variables does not change the reflection norm of the phase-independent $X_delta$.
    Finally apply reflection Cauchy–Schwarz. Only the reflection seminorm vanishes;
    an ordinary variance need not do so. ◻
]

== 5 Separated pins and transfer to boundary brackets <sec:pins>

The reflection norm of a Laplace insertion tends to zero by Proposition 32.
  We will transfer this identity to upper and lower height laws whose boundary traces bracket zero.
  We do this by cutting the pinned boundary into separated pieces and moving those pieces to one side of the
  insertion. The same prescribed spins can represent different integer heights on different pieces.
  We first require the pinned sites within each piece to lie in one consecutive pair of heights,
  then require these pairs to have the same integer offset.
  Moment bounds and multiplicative comparisons of pin probabilities control the motion.
  Local phase factors allow the common-offset condition to be imposed after the pieces have been moved back.

All geometric lengths in this section are physical lengths.
  A window, a gap, or an arrangement of separated sets is fixed before the mesh tends to zero.

An increment function supported in a disk means a function of the height differences on edges in that disk,
  allowing a fixed arbitrarily small enlargement for connecting paths.
  If $f$ is smooth, supported in the disk, and $integral f = 0$,
  the exact area pairing $H_delta \( f \)$ is such a function:
  its coefficients sum to zero, so paths in the enlarged disk express it in terms of increments.
  Throughout the section put

#[#set math.equation(numbering: n => "(5.1)")
 $ X_delta = H_delta \( Delta phi \) \, wide F_delta = product_(j = 1)^q F_(j \, delta) \, wide
   phi in C_c^oo \( K_0 \) \, wide product_(j = 1)^q parallel F_(j \, delta) parallel_oo lt.eq C_F \,
   $ <pins:insertion-data>]

where $phi$ is real, $K_0 subset.double D$ is a disk, and $F_(j \, delta)$ is an increment function in a disk $K_j
  subset.double D$. The spectator disks may overlap each other,
  but have positive distance from a fixed neighborhood of $K_0$. The empty product is allowed.

=== 5.1 The boundary walk and the two brackets <the-boundary-walk-and-the-two-brackets>

Let $gamma : bb(R) \/ L bb(Z) arrow.r partial D$ be the positively oriented arclength parametrization.
  In a fixed tubular neighborhood of $partial D$, let $pi$ be normal projection followed by the coordinate
  $gamma^(- 1)$, with values in $bb(R) \/ L bb(Z)$. This map exists because the boundary is a $C^2$ embedded
  compact curve. Write $d_L$ for circular distance in $bb(R) \/ L bb(Z)$.

#thm([Lemma 5.1.])[
  (Inner boundary walk).  #emph[There is a closed walk $S_(0 \, delta)$ of adjacent triangular-lattice face
    centers, with repeated vertices and edges allowed, whose vertex set is exactly the boundary face layer
    $partial F_delta$. Its parametrized trace is within $O \( delta \)$ of the boundary cycle in traversal order.
    Every free interior site lies in a bounded face of this walk, with winding number one,
    and every interaction path from a free interior site to an exterior site meets its vertex set.]
  #emph[For small $delta$, $pi$ is defined on the walk, its degree is one,
    and the following fixed-scale assertions hold. For each $b > 0$,
    the number of subwalks with disjoint traversal-time interiors and projected diameter at least $b$ is bounded
    independently of sufficiently small $delta$. Every proper projected boundary arc is traversed from end to end
    by a subwalk, up to $o \( 1 \)$ errors at its endpoints. These assertions do not require a bound on the length
    of $S_(0 \, delta)$ or on its number of crossings of a line.]
] <lem:boundary-walk>

#proof[
  Associate to each successive edge of the honeycomb boundary cycle its incident interior face.
    At a trivalent boundary vertex, the two such faces are either the same, or meet across the third edge.
    Joining their centers therefore gives the required walk after constant steps are removed.
    This also proves the $O \( delta \)$ position bound. Every face adjacent to the boundary appears.
    An edge path leaving the enclosed face set first passes through such a face, proving separation.
  One can deform each boundary edge to the corresponding center path in the union of its incident faces and the
    stars of its endpoints. This deformation never meets a nonboundary interior face center.
    Consequently the original cycle and the center walk have the same winding number around every free interior
    center. In particular those centers lie in bounded complementary components of the walk.
  Use the uniformly convergent parametrizations in Definition 1,
    and parametrize the center walk in the corresponding traversal order.
    The position error still tends to zero uniformly. Normal projection is uniformly continuous on a smaller
    closed tubular collar, so the projected walks converge uniformly to the corresponding degree-one
    parametrization of the boundary circle. They have degree one for fine mesh by homotopy in that circle.
    For any fixed $b$, uniform continuity of the limiting parametrization gives $omega \( b \) >
    0$ such that a projected excursion of diameter $b$ needs at least $omega \( b \)$ units of parameter time,
    once the uniform error is smaller than $b \/ 4$. Disjoint excursion intervals therefore number at most $1 \/
    omega \( b \)$, after normalizing the parameter circle to length one.
    Finally lift the projected walk to the real line. Its net change in one traversal is $L$.
    Before a first visit to the right endpoint of a lifted proper arc, take its last visit to the left endpoint.
    The intervening subwalk stays in that interval and crosses it.
    Discrete endpoints introduce only $o \( 1 \)$ errors. This proves the final assertion. ◻
]

In the following, the graph of a walk means its image with all traversed edges.
  Removing a set of its vertices removes the incident edges too.
  Additional lattice adjacencies could only merge the components used below,
  so the specified graph convention is harmless but convenient.

Fix a finite collection $cal(L)$ of horizontal levels that meet $D$ and are regular values of the vertical
  coordinate on $partial D$. We use nonempty collections, so their boundary intersection set is nonempty.
  Their intersections with $partial D$ are finite: each is isolated by transversality, and their set is compact.
  Let $cal(C) subset bb(R) \/ L bb(Z)$ be the finite set of projected intersection coordinates.
  Choose $epsilon.alt > 0$ so small that the arcs ${ d_L \( s \, c \) < 2 epsilon.alt }$, $c in cal(C)$,
  are disjoint and every complementary arc has nonempty interior. These arcs specify fixed exceptional windows.
  The pins will be exact off the smaller windows $d_L \( pi \( dot.op \) \, cal(C) \) < epsilon.alt$.

Remove the vertices of $S_(0 \, delta)$ with $d_L \( pi \( v \) \, cal(C) \) < epsilon.alt \/ 2$.
  Among the remaining graph components retain those that contain a vertex with $d_L \( pi \( v \) \, cal(C) \)
  gt.eq epsilon.alt$; denote their union by $A_(delta \, epsilon.alt)$.
  Thus every skeleton vertex outside the $epsilon.alt$ windows belongs to $A_(delta \, epsilon.alt)$,
  while this set avoids the $epsilon.alt \/ 2$ windows.

#thm([Lemma 5.2.])[
  (Bounded label count).  #emph[At fixed $cal(L)$ and $epsilon.alt$,
    the number of connected components used to form $A_(delta \, epsilon.alt)$ is bounded by a constant
    $M \( cal(L) \, epsilon.alt \)$ independent of sufficiently small $delta$.]
] <pins:label-count>

#proof[
  A retained component contains a traversal segment beginning next to a removed interval and reaching distance at
    least $epsilon.alt$ from $cal(C)$, without visiting a removed vertex.
    Indeed use a maximal portion of the original traversal outside the removed set that visits a deep vertex.
    Its projection travels a distance at least $epsilon.alt \/ 2 - o \( 1 \)$.
    For distinct graph components these portions have disjoint time interiors,
    because a shared traversal vertex would join the components. Lemma 33 bounds their number.
    The same proof, using any fixed smaller constants in the two thresholds, covers rounding at endpoints.
    It puts no bound on the number of short excursions confined to the windows. ◻
]

#prodef([Definition 5.3.])[
  (Filled brackets).  In the plane spin law impose $B = +$ on all of $S_(0 \, delta)$ and $W = +$ on
    $A_(delta \, epsilon.alt)$. Anchor the height to zero at one doubly pinned vertex,
    and restrict it to the original interior. Its law is the #emph[upper filled bracket],
    denoted $H_delta^(+ \, epsilon.alt)$. For the #emph[lower filled bracket] $H_delta^(- \, epsilon.alt)$
    interchange the colors: impose $W = +$ on the whole skeleton and $B = +$ on $A_(delta \, epsilon.alt)$,
    with the same zero anchor.
] <def:brackets>

These finite pin events have positive probability. In a finite free ambient graph the constant zero height is an
  admissible extension; Proposition 13, or its deterministic enclosing-cut comparison,
  keeps the finite event positive in the plane limit. All plane conditionings below can equivalently be obtained
  by first taking the ambient-volume limit at a fixed mesh.
  Local comparison gives this limit, and division is only by a fixed positive finite-event probability at that stage.

#thm([Lemma 5.4.])[
  (Integer traces and order).  #emph[The bracket traces are actual integer heights satisfying
#[#set math.equation(numbering: n => "(5.2)")
 $ H_delta^(+ \, epsilon.alt) in { 0 \, 1 } \, wide H_delta^(- \, epsilon.alt) in { - 1 \, 0 } quad
   upright("on ") S_(0 \, delta) \, wide H_delta^(plus.minus \, epsilon.alt) = 0 quad
   upright("on ") A_(delta \, epsilon.alt) . $ <pins:trace-intervals>]

 Conditional on either trace, the free interior has the original weighted height Gibbs law. There is an ordered coupling
#[#set math.equation(numbering: n => "(5.3)")
 $ H_delta^(- \, epsilon.alt) lt.eq h_delta lt.eq H_delta^(+ \, epsilon.alt) $ <pins:height-sandwich>]

 on every interior face. The bounded-trace smearing estimates of Proposition 21 apply to both brackets with
   constants independent of the window sizes.]
] <pins:bracket-order>

#proof[
  The integer inverse image of $B = +$ is the union of the pairs $4 t + { 0 \, 1 }$,
    whereas that of $W = +$ is the union of $4 t + { - 1 \, 0 }$.
    A nearest-neighbor chain of constant first color cannot leave its lifted pair,
    since different pairs have distance at least three. Connectedness of $S_(0 \, delta)$ and its zero anchor
    therefore give precisely (5.2); second-color plus pins select the zero endpoint of the pair.
    This argument establishes the integer branch, rather than merely its residue modulo four.
  Lemma 33 separates every free site from exterior interactions.
    After conditioning on the skeleton heights, the nearest-neighbor weights factor over the interior components
    and the exterior; factors between fixed sites affect only the trace probability.
    Lemma 3 identifies each interior factor with the weighted height law.
    Applying Lemma 15 to each fixed trace, and then averaging the resulting kernels, proves (5.3).
    All these traces have absolute value at most one, so Proposition 21 gives the last assertion.
    In particular the upper mean is between zero and one, and the lower mean between minus one and zero,
    by comparison with the flat laws. ◻
]

Our target is the identity

#[#set math.equation(numbering: n => "(5.4)")
 $ lim_(delta arrow.b 0) bb(E) [H_delta^(plus.minus \, epsilon.alt) \( Delta phi \) F_delta] =
   0 $ <eq:bracket-insertion>]

for the local factors in (5.1), with the grid and windows fixed.
  We will prove it under the separating geometric hypotheses stated in Proposition 44:
  two grid levels must bracket the insertion disk and miss the spectators,
  and the remaining pieces in the intervening strip must separate to its two sides in an oblique projection.
  This condition will let us move all the other factors to one side of a reflection line while keeping the moved
  pin sets separated. The next constructions provide the integer and moment control needed to carry out those moves.

=== 5.2 Opening gaps and checking the local lift <opening-gaps-and-checking-the-local-lift>

Choose two levels $ell_(-) < ell_(+)$ from $cal(L)$ strictly below and above $K_0$, respectively,
  and missing every spectator disk with a positive margin. Let $cal(C)_0 subset
  cal(C)$ be their boundary intersection coordinates. Fix $0 < a lt.double epsilon.alt$,
  smaller also than all interpoint distances in $cal(C)_0$.
  Delete skeleton sites satisfying $d_L \( pi \( v \) \, cal(C)_0 \) < a$.
  Of the remaining graph components keep only those reaching distance at least $2 a$ from $cal(C)_0$.
  Delete the first-color pins on the discarded sites as well.
  All deletions lie in $O \( a \)$ neighborhoods of $gamma \( cal(C)_0 \)$; no second-color pin is changed.
  The first color is $B$ for the upper bracket and $W$ for the lower one;
  the proof below uses upper-bracket color names.

Group the retained first-color sites according to the successive projected arcs between points of $cal(C)_0$.
  Let $P_i$ be the spin pin event on group $i$, including its second-color pins, and put

#[#set math.equation(numbering: n => "(5.5)")
 $ P = ⋂_(i = 1)^m P_i \, wide p_(i \, delta) = bb(P) \( P_i \) \, wide J_delta =
   product_(i = 1)^m p_(i \, delta) . $ <pins:rare-normalization>]

The number $m$ is fixed. It bounds the number of groups, not the number of first-color graph components.
  Each group contains a doubly pinned representative $v_i$:
  the degree-one traversal crosses the intervening arc, including its nonempty exact-pin core.
  Transversality at $ell_plus.minus$ implies that, after the deletions,
  every group has a positive distance from the two levels. Thin neighborhoods with endcaps around its limiting
  compact arc give pairwise disjoint filled isolating neighborhoods $U_i$, each a topological disk.
  Choose also a smaller filled core $V_i subset.double U_i$ containing all its pin sites,
  with room in $U_i \\ V_i$ for two nested collar cuts. These neighborhoods avoid all fixed test disks.
  All clearances are positive at this fixed $a$.

Let $C_i$ be the additional local check that all first-color pinned sites in group $i$ use one and the same lifted
  pair. It is an event of the spins and relative increments in $V_i$:
  choose connecting paths there from $v_i$ to all the pinned sites and compare their lifts.
  The result is independent of the selected paths by Lemma 3. Define

#[#set math.equation(numbering: n => "(5.6)")
 $ P_(upright("loc")) = P ∩ ⋂_(i = 1)^m C_i . $ <pins:checked-event>]

The checks are not included in the probabilities $p_(i \, delta)$.

#thm([Lemma 5.5.])[
  (Marker checks).  #emph[For every fixed $a \, epsilon.alt$ and separated placement of the groups,
#[#set math.equation(numbering: n => "(5.7)")
 $ bb(P) \( P_(upright("loc")) divides P \) arrow.r 1 . $ <pins:check-success>]

 The assertion holds also after any fixed rigid translations or lattice reflections of the groups,
   and along converging placements that retain the specified positive clearances.]
] <pins:marker-checks>

#proof[
  Consider one intervening projected arc. Every retained graph component touches the boundary of one of the
    deleted intervals: otherwise it would be a component of the original connected walk with no neighbor outside.
    More explicitly, a maximal unremoved traversal interval containing a vertex at depth $2
    a$ starts or ends at depth $a + o \( 1 \)$. It gives a pinned chain from that endpoint to depth $2 a -
    o \( 1 \)$, hence a crossing of the projected marker at depth $3 a \/ 2$.
    There is also a retained component crossing the whole intervening arc.
    The last-left-visit, first-right-visit construction in Lemma 33 gives such a chain;
    since $a$ is much smaller than the arc length, it crosses both endpoint markers.
    Thus every component reaches at least one marker, and one component joins the two markers.
  Fix an endpoint marker $s_(*)$ and its spatial point $z_(*) = gamma \( s_(*) \)$.
    All crossings of that marker, however numerous, occur in a ball $B \( z_(*) \, r_delta \)$ with $r_delta
    arrow.r 0$. This follows from uniform convergence into the normal collar;
    an edge crossing the projected coordinate adds only an $O \( delta \)$ error.
    Choose a fixed outer radius $rho lt.double a$ such that $B \( z_(*) \, 2 rho \) subset
    U_i$ and the ball avoids all second-color pins and equality edges.
    Each of the relevant pinned chains enters the inner ball and leaves the outer one,
    because its endpoints have projected distances at least $a \/ 2 - o \( 1 \)$ from $s_(*)$.
    At these short scales arclength and Euclidean distance along the $C^2$ boundary are uniformly comparable.
  First fix $r > 0$, and then take $delta$ small enough that $r_delta < r$.
    By Lemma 10, a stack of favorable good circuits between radii $r$ and $rho$ fails with probability at most
    $C \( r \/ rho \)^alpha$. Apply this estimate keeping all second-color constraints first as equality edges
    $E_0$. They avoid this annulus, and every first-color pin in it is favorable.
    Restoring the actual plus labels costs at most $2^(M \( cal(L) \, epsilon.alt \))$ by Lemma 34 and the
    component-label construction of Section 2. A good surrounding circuit joins all the pinned chains through its
    constant first-color boundary layer. Every joined chain therefore has the same actual lifted pair.
    This costs one circuit event at the marker, regardless of the number of chains.
  There are finitely many markers. After the mesh limit send $r$ to zero to make all their failure probabilities
    vanish. The traversing component ties together the two marker pairs of each group, proving (5.7).
    Translations and reflections preserve this geometric argument;
    apply the buffer estimate afresh in their images. Only spins and increments enter $C_i$,
    so no reflection invariance of the particular cell augmentation is being assumed. ◻
]

=== 5.3 Moments after rare conditioning <moments-after-rare-conditioning>

Proposition 13 applies to the ordinary events $P_i$, because their filled neighborhoods are disjoint and their
  total number of connected second-color prescriptions is bounded. It gives

#[#set math.equation(numbering: n => "(5.8)")
 $ c J_delta lt.eq bb(P) \( P \) lt.eq C J_delta . $ <pins:multiplicative>]

Constants depend on the fixed separated geometry, including $a$.
  This is a multiplicative estimate at the scale of the pin probabilities.
  An additive mixing error would give no bound after division by $J_delta$, which may be extremely small.

#thm([Proposition 5.6.])[
  (Checked pin moments).  #emph[Consider any of the fixed separated arrangements above,
    including arrangements enlarged by reflected copies. Let $Y_delta = H_delta \( f \)$,
    where $f$ is a real smooth zero-integral test supported in a disk having a filled cut-search neighborhood
    disjoint from all $U_i$. For every $1 lt.eq p < oo$,
#[#set math.equation(numbering: n => "(5.9)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] \| Y_delta \|^p divides P_(upright("loc")) #scale(x: 120%, y: 120%)[\]]
   lt.eq C_p $ <eq:pin-moments>]

 for all sufficiently small $delta$. The constants are uniform on compact families of such arrangements with
   positive clearances and bounded smooth test norms. The same holds for finite collections of these tests and,
   by separating real and imaginary parts, for complex tests.]
] <prop:pin-moments>

#proof[
  Work first in a finite simply connected free ambient triangulation,
    large enough to contain all neighborhoods and collars. On $P_(upright("loc"))$, anchor $H \( v_1 \) = 0$.
    The constrained height arrays are exactly those satisfying, for integers $t_i$ with $t_1 = 0$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ H \( v \) & in 4 t_i + I quad &  & upright("on all first-color pins in group ") i \,\
H \( v \) & = 4 t_i &  & upright("on its second-color pins") \, wide I =
  cases(delim: "{", { 0 \, 1 } \, & upright("upper bracket") \,, { - 1 \, 0 } \, & upright("lower bracket") .)
  $ <pins:offset-constraints>]
  The forward implication is the definition of the checks. Conversely these constraints impose both colors at
    their prescribed sites and one pair on each whole group. Simple connectedness and the Gray-code lift exclude
    additional winding constraints. The array weight is exactly the product of the original edge weights.
  Partition these arrays by $kappa = \( t_2 med mod med 2 \, dots.h \, t_m med mod med 2 \)$,
    so there are at most $2^(m - 1)$ classes. If $H \, H'$ belong to the same class,
    put $s_i = \( t_i + t'_i \) \/ 2 in bb(Z)$. On a first-color pinned site,
    each of $floor.l \( H + H' \) \/ 2 floor.r$ and $ceil.l \( H + H' \) \/ 2 ceil.r$ belongs to $4 s_i + I$;
    on a double pin both equal $4 s_i$. Thus both rounded outputs satisfy (5.10),
    although their parity classes can differ from the input class. The anchor stays zero.
    The weighted midpoint verification in Section 3 establishes the edge-weight premise of Theorem 18.
    What remains is a positive central mass in every input class.
  In the test neighborhood require one good cut surrounding the test,
    with a fixed positive separation from its support. In the collar of each nonanchor obstacle require two nested
    good cuts of opposite signs of the first color in $U_i \\ V_i$, enclosing the entire check support.
    All these searches have disjoint fixed buffers free of equality edges and second-color labels.
    Lemma 10, successive conditioning, and the bounded label cost give a joint conditional probability at least
    $c_0 > 0$ under $P$. Expose the test cut from the exterior and choose the collar cuts by their corresponding
    stopped explorations. Lemma 37 implies that intersecting this event with $P_(upright("loc"))$ still has
    probability at least $c_0 \/ 2$ under $P$ for fine mesh.
  The pin checks can be read within the $U_i$, outside the entire test search region.
    Conditional on the exterior record and on the actual height layer of the test cut,
    its inside is the unconstrained weighted height problem with a consecutive-pair trace.
    Subtract its possibly random common offset. Since $integral f = 0$, this does not change $Y_delta$.
    Proposition 21, using a finite partition into smaller smearing balls if necessary,
    gives a fixed $M_0$ and a conditional probability at least $1 \/ 2$ of $\| Y_delta \| lt.eq M_0$.
    Consequently a central event $cal(A)$, including all selected cuts and checks and the condition $\| Y_delta \|
    lt.eq M_0$, has
  #[#set math.equation(numbering: n => "(5.11)")
   $ bb(P) \( cal(A) divides P_(upright("loc")) \) gt.eq c_1 > 0 \, wide cal(A) subset { \| Y_delta \| lt.eq
     M_0 } . $ <pins:central-unpartitioned>]
  Lemma 14 supplies in each nonanchor collar a weight-preserving involution shifting all its inner heights by $+
    4$ or $- 4$, relative to the exterior. The relevant component is chosen from the first-color, status,
    and cut record, without using its fair second-color label. Its flip preserves that record.
    All spins on the protected inner and outer regions, all pin labels, and all local checks remain unchanged.
    It also preserves $Y_delta$ and its test-cut record: the entire test search neighborhood lies outside $U_i$,
    in the protected exterior of the switch. The disjoint collars give commuting involutions;
    the $i$th one flips precisely the parity of $t_i$. These involutions act on the augmented spin and status
    measure. The event $cal(A)$ records only the selected cuts, the checks, and the displayed bound on $Y_delta$;
    it does not fix the extra exterior heights used to estimate its probability.
    It is therefore invariant under the involutions. Each orbit has one equally weighted member for every parity
    vector, so
  #[#set math.equation(numbering: n => "(5.12)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \| Y_delta \| lt.eq M_0 \, med kappa =
     k divides P_(upright("loc")) #scale(x: 120%, y: 120%)[\)] gt.eq 2^(- \( m - 1 \)) c_1 quad
     upright("for every ") k . $ <pins:every-class-mass>]
  Marginalizing the statuses preserves this identity for the height parity classes.
    The orbit calculation does not assert independence after conditioning on the checks.
    When $m = 1$ no collar switch is needed.
  The face-area weights of $f$ have bounded total absolute mass,
    and coordinatewise rounding changes the associated linear statistic by at most half that mass.
    Increase $M_0$ to absorb this bound. Apply Lemma 20 with (5.12) and the parity partition.
    It gives (5.9), uniformly in the ambient volume. Exhaustion at each fixed mesh gives the plane assertion;
    Fatou’s lemma transfers the moment bounds. With no obstacles use Proposition 22.
    The construction uses only fixed positive margins and finitely many requests,
    proving the stated uniformity and the finite-collection version by Hölder’s inequality. ◻
]

=== 5.4 Normalized reflection bounds and analytic translation <normalized-reflection-bounds-and-analytic-translation>

A height difference between representatives of two obstacles is not local to either obstacle.
  Its exponential can be split into two local phase factors, one at each representative.
  We use the stationary Haar-lift phases from Proposition 25: for any fixed real frequency $theta$, put

#[#set math.equation(numbering: n => "(5.13)")
 $ Z_theta \( v \) = U_theta exp { i theta \( H \( v \) - H \( o \) \) } \, $ <pins:haar-phase>]

with an independent uniform unit complex variable for every phase field needed.
  Two factors from the same field share this auxiliary variable, so $Z_theta \( v \) overline(Z_theta \( w \)) =
  exp { i theta \( H \( v \) - H \( w \) \) }$. Changing the anchor is absorbed by Haar invariance.
  The joint spin, increment, and phase law is reflection positive,
  and a phase value at a site on one side of a row belongs to that side’s algebra.
  Thus each factor can move with its own obstacle, including when its balancing factor lies on the other side of
  the row.

For a site-row reflection $theta.alt$, use $chevron.l A \, B chevron.r_theta.alt =
  bb(E) \[ overline(theta.alt A) B \]$ on its positive side, quotienting by null vectors.
  Pure normal translation by $b_delta = sqrt(3) thin delta$ is the positive self-adjoint contraction $S_delta$ of
  Proposition 25.

#thm([Lemma 5.7.])[
  (Normalized side norm).  #emph[Suppose a family of checked obstacles and factors lies strictly on one side of a
    site row. Their filled neighborhoods and all needed check paths lie on that side;
    unbounded factors have free test neighborhoods disjoint from the obstacle neighborhoods.
    If $A$ is a bounded product, possibly including arbitrary Haar phases,
    times at most one smooth zero-total insertion, then
#[#set math.equation(numbering: n => "(5.14)")
 $ ∥A product_i upright(bold(1))_(P_i ∩ C_i) / p_(i \, delta)∥_theta.alt lt.eq C . $ <pins:normalized-side-bound>]

 The bound is uniform on compact families with the stated margins.]
] <pins:side-norm>

#proof[
  Let $J$ denote the product of the probabilities on this side. Squaring the norm gives
  $ J^(- 2) bb(E)
    [overline(theta.alt A) A thin upright(bold(1))_(P_(upright("loc")) ∩ theta.alt P_(upright("loc")))] . $
  The reflected arrangement consists of two copies of every obstacle, all with disjoint filled neighborhoods.
    The strict row margin separates the two copies. Their individual probabilities are the same $p_(i \, delta)$,
    so (5.8) bounds the probability of the ordinary doubled pin event by $C J^2$.
    The checked event has no larger probability. If $A$ contains an insertion $Y$,
    Proposition 38 in this doubled arrangement and Cauchy–Schwarz bound
    $bb(E) \[ \| Y thin theta.alt Y \| divides P_(upright("loc")) ∩ theta.alt P_(upright("loc")) \]$ by a
    constant. Bounded factors and unit-modulus phases contribute only their uniform bounds.
    The factor $J^2$ cancels exactly, proving the assertion. ◻
]

For a related separating-line continuation, see #cite(label("DCKLM2026")) Section 7.1, Lemma 7.4.
  Here we must also normalize by rare pin probabilities: Lemma 39 supplies the bounded matrix elements before the
  continuation is applied. The following argument proves the exact version needed for these checked obstacles.

#thm([Lemma 5.8.])[
  (Analytic translation).  #emph[Partition a finite arrangement of the preceding checked obstacles and local
    factors into two families separated strictly in projection on a lattice reflection normal $n$.
    At most one factor is an unbounded zero-total insertion. Translate the high family by $s n$,
    and let $M_delta \( s \)$ be its plane expectation normalized by the product $J_delta$ of all individual
    ordinary pin probabilities, at lattice normal-step translations. If
$ M_delta \( s_delta \) arrow.r 0 $

 for every $s$ in a nonempty open interval $I subset \( 0 \, oo \)$ and every lattice rounding $s_delta arrow.r
   s$, then $M_delta \( 0 \) arrow.r 0$. The same is true for a low family translated by $- s n$,
   and along any converging sequence of other placements preserving the required margins.]
] <lem:analytic-translation>

#proof[
  Choose $eta > 0$ smaller than the actual projection gap between the enlarged supports.
    Back the high family up by $eta_delta = N_delta b_delta arrow.r eta$, where $N_delta$ is a positive integer.
    There is still a fixed gap; choose a site row in it, converging to a line in the limiting gap.
    Let $B_delta$ be the normalized high-side factor in this backed arrangement and let $A_delta$ be the reflected
    conjugate of the normalized low-side factor. Lemma 39 gives $parallel A_delta parallel_theta.alt \,
    parallel B_delta parallel_theta.alt lt.eq C$. Individual $p_(i \, delta)$ are invariant under lattice
    translation and reflection, so their product is the same throughout the motion.
  For $Re z > - eta_delta$ set
  #[#set math.equation(numbering: n => "(5.15)")
   $ f_delta \( z \) = integral_(\[ 0 \, 1 \]) lambda^(\( z + eta_delta \) \/ b_delta) thin
     gamma_(A_delta \, B_delta) \( thin upright(d) lambda \) \, $ <pins:analytic-family>]
  where the finite cross measure is constructed in Lemma 61, with its circle variable integrated out.
    For $Re w > 0$ use $lambda^w = e^(w log lambda)$ on $lambda > 0$ and give it value zero at $lambda = 0$.
    Corollary 62 proves that this is holomorphic and bounded by $parallel A_delta parallel_theta.alt parallel
    B_delta parallel_theta.alt$. Thus $\| f_delta \| lt.eq C^2$,
    and all fine meshes have the common domain $Re z > - eta \/ 2$, which contains zero as an interior point.
  At $s_delta = m b_delta gt.eq 0$, the exponent in (5.15) is the positive integer $m + N_delta$.
    The transfer interpretation therefore gives the exact equality $f_delta \( s_delta \) =
    M_delta \( s_delta \)$. This never evaluates a zeroth spectral power at the kernel.
    Cauchy’s estimates give a uniform derivative bound on compact subsets of the common half-plane,
    so converging lattice roundings sample the same limiting function.
    Every sequence has a subsequence on which $f_delta$ converges locally uniformly to a bounded holomorphic
    function. It vanishes on $I$ by hypothesis, hence throughout the half-plane by the identity theorem,
    and in particular at zero. Subsequence extraction proves the claim for the original sequence.
  Rigid translation preserves distances inside each family,
    and moving the families apart increases their projection gap.
    The preliminary backoff was smaller than that gap. Thin filled neighborhoods and check paths can therefore be
    kept on their own sides at every step; their reflected copies have the same separation.
    These observations verify the side-norm hypotheses, including for convergent variations of the other
    placements. Reversing $n$ proves the low-family version. ◻
]

=== 5.5 The three-direction geometry and phase projection <the-three-direction-geometry-and-phase-projection>

Here is the precise geometry needed for the insertion identity. Put

#[#set math.equation(numbering: n => "(5.16)")
 $ e = \( 0 \, 1 \) \, wide u = \( sqrt(3) \/ 2 \, 1 \/ 2 \) \, wide
   u' = \( - sqrt(3) \/ 2 \, 1 \/ 2 \) . $ <pins:three-normals>]

The levels $ell_plus.minus$ chosen above strictly bracket $K_0$ and avoid every spectator disk.
  After the boundary intersection gaps are opened, each boundary group and each spectator support lies wholly
  above, below, or between these levels. Call the outer families $T$ and $B$.
  Require the middle family to split into $L$ and $R$ with, for some $kappa > 0$,

#[#set math.equation(numbering: n => "(5.17)")
 $ sup_(z in L) z dot.op u < inf_(z in K_0) z dot.op u - kappa \, wide
   inf_(z in R) z dot.op u > sup_(z in K_0) z dot.op u + kappa . $ <pins:middle-geometry>]

Suprema over a family mean over all its enlarged supports.
  Its obstacle neighborhoods, check paths, and representative phases are included in those supports.
  Empty families are omitted. Choose the neighborhoods sufficiently thin to preserve these inequalities.
  Overlapping spectator disks must belong to the same family and move together.
  This geometry is used later only with $K_0$ and the strip very small compared with their distance to all
  remaining supports.

#thm([Lemma 5.9.])[
  (A local choice of the grid).  #emph[Fix $z_0 in D$, $overline(B \( z_0 \, rho \)) subset D$,
    and an integer $q gt.eq 0$. One can choose a finite grid of regular horizontal levels,
    depending only on $z_0 \, rho \, q$, with the following property.
    If $K_0 subset B \( z_0 \, rho \/ 1000 \)$ and at most $q$ spectator disks of radii less than
    $rho \/ \( 1000 \( q + 1 \) \)$ lie outside $B \( z_0 \, rho \)$,
    two grid levels give all the strict geometry in (5.17). The same grid works for any finite number of such
    collections of spectator disks.]
] <pins:local-geometry>

#proof[
  Translate $z_0$ to zero for this geometric calculation. In each interval $\( rho \/ 40 \, rho \/ 20 \)$ and
    $\( - rho \/ 20 \, - rho \/ 40 \)$ choose $q + 1$ regular levels with mutual distances exceeding
    $rho \/ \( 80 \( q + 1 \) \)$. They exist because regular values are dense and each candidate interval has
    length $rho \/ 40$. Their union is the grid. A spectator’s closed vertical projection has length less than $2
    rho \/ \( 1000 \( q + 1 \) \)$, so it meets at most one level in either candidate family.
    At least one level in each family therefore avoids all $q$ disks, with a positive margin.
    These two levels strictly bracket $K_0$.
  Every boundary point and middle-strip spectator point is outside $B \( 0 \, rho \)$ and has $\| y \| < rho \/
    20$. Thus $\| x \| > sqrt(399 \/ 400) thin rho$, and $\| \( sqrt(3) \/ 2 \) x + y \/ 2 \| > rho \/ 2$,
    with the sign of $x$. A connected middle boundary arc or spectator disk cannot change this sign.
    It consequently belongs wholly to $L$ or $R$, whereas the $u$-projections of $K_0$ have absolute value at most
    $rho \/ 1000$. Opening small intersection gaps and choosing sufficiently thin filled neighborhoods preserves
    these strict inequalities. The construction of the grid preceded the choice of the disks,
    proving the last assertion. ◻
]

#thm([Lemma 5.10.])[
  (Separated insertion).  #emph[At fixed positive gaps satisfying (5.17),
    and for any product $Psi_delta$ of local Haar-phase factors at the representatives with fixed frequencies,
#[#set math.equation(numbering: n => "(5.18)")
 $ J_delta^(- 1) bb(E) [X_delta F_delta Psi_delta upright(bold(1))_(P_(upright("loc")))] arrow.r
   0 . $ <pins:separated-identity>]

 This holds for every converging lattice-rounded sequence of placements with the stated strict separations.]
] <pins:three-moves>

#proof[
  Figure 2 records the successive separating projections. Keep $X_delta$ fixed and move all other factors,
    including each check and each phase with its obstacle. First translate $T$ by $a_(+) e$ and $B$ by $-
    a_(-) e$. Each is an entire extreme side across an existing horizontal gap.
    Choose these two distances sufficiently large that $T$ is strictly above $K_0$ and $B$ strictly below it in
    $u$-projection. With (5.17), the families $Q_(+) = T union R$ and $Q_(-) =
    B union L$ are then strictly above and below $K_0$, respectively, in that projection.
  Translate $Q_(+)$ by $b u$, with $b$ sufficiently large that it is vertically above $K_0$ and below $K_0$ in
    $u'$-projection. Both requirements are possible because $u dot.op e = 1 \/ 2$ and $u dot.op u' = - 1 \/ 2$.
    Translate $Q_(-)$ by $- c u$, with $c$ so large that it is above $K_0 union Q_(+)$ in $u'$-projection.
    Each of these moves increases an existing $u$ gap. Finally translate $Q_(-)$ by $d u'$.
    It is an entire extreme side across a strict $u'$ gap, and $u' dot.op e = 1 \/ 2$,
    so large $d$ puts it vertically above $K_0$ as well. At every move,
    within-family distances stay fixed and between-family projection gaps increase.
    Thus no filled obstacle neighborhood meets another obstacle or the insertion neighborhood.
    The required thin local paths remain available.
  All distances can be chosen in open ranges, in the order $a_(+) \, a_(-) \, b \, c \, d$.
    The translations can be made exactly on the lattice. If $a_1 = \( 1 \, 0 \)$ and
    $a_2 = \( 1 \/ 2 \, sqrt(3) \/ 2 \)$ generate $bb(T)$, then
  $ sqrt(3) e = - a_1 + 2 a_2 \, wide sqrt(3) u = a_1 + a_2 \, wide sqrt(3) u' = - 2 a_1 + a_2 . $
  Round each physical distance to a multiple of $b_delta$. The five rounding errors are $O \( delta \)$;
    all the finitely many strict margins therefore survive. Site reflection rows in these directions have spacing
    $b_delta \/ 2$, so a row can also be chosen in every fixed gap.
  At the final placement there is a horizontal site row separating $X_delta$ from every other factor.
    Reflection Cauchy–Schwarz, Lemma 39, and Proposition 32 bound the absolute value of the normalized expectation
    by $C parallel X_delta parallel_theta.alt arrow.r 0$. Adding phases does not change this norm of the
    phase-free insertion.
  For every fixed admissible $a_(+) \, a_(-) \, b \, c$, the last assertion holds for $d$ in a nonempty open
    interval of sufficiently large values and for every lattice rounding.
    Lemma 40 therefore removes the $d u'$ move. The resulting assertion holds for every sufficiently large $c$
    with earlier distances fixed, so the same lemma removes the $- c u$ move.
    Continue in the order $b u$, $- a_(-) e$, $a_(+) e$. At each stage later distances may depend on the already
    fixed earlier ones; the open-interval assertion is exactly what the analytic lemma needs.
    This proves (5.18) at the original placement. Empty families simply omit their moves. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 2.15), [#text(size: 8pt)[\(a\) Initial placement]])
  line((-2.3, 0.46), (2.3, 0.46), stroke: (paint: rgb("#8c8c8c"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  content((2.3, 0.46), [#text(fill: rgb("#000000"))[#text(size: 8pt)[$ell_+$]]], anchor: "west", padding: 0.1176cm)
  line((-2.3, -0.46), (2.3, -0.46), stroke: (paint: rgb("#8c8c8c"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  content((2.3, -0.46), [#text(fill: rgb("#000000"))[#text(size: 8pt)[$ell_-$]]], anchor: "west", padding: 0.1176cm)
  circle((0, 0), radius: 0.23, fill: rgb("#f0f0f0"), stroke: (paint: rgb("#666666"), thickness: 0.65pt, miter-limit: 10))
  content((0, 0), [#text(size: 8pt)[$K_0$]])
  circle((0, 0.95), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((-0.23, 0.98), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((0.2, 1.05), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((0.23, 0.86), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((0, 0.95), [#text(size: 9pt)[$T$]])
  circle((0, -0.95), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((-0.23, -0.92), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((0.2, -0.85), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((0.23, -1.04), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((0, -0.95), [#text(size: 9pt)[$B$]])
  circle((-1.7, 0), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((-1.93, 0.03), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((-1.5, 0.1), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((-1.47, -0.09), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((-1.7, 0), [#text(size: 9pt)[$L$]])
  circle((1.7, 0), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((1.47, 0.03), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((1.9, 0.1), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((1.93, -0.09), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((1.7, 0), [#text(size: 9pt)[$R$]])
  line((0, 1.23), (0, 1.72), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#000099"))))
  content((0.1058, 1.475), [#text(size: 8pt)[$(1)#h(0.3333em) a_+e$]], anchor: "west", padding: 0.1176cm)
  line((0, -1.23), (0, -1.72), stroke: (paint: rgb("#a65300"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#a65300"))))
  content((0.1058, -1.475), [#text(size: 8pt)[$(2)#h(0.3333em) -a_-e$]], anchor: "west", padding: 0.1176cm)
  line((-2.3, -1.95), (2.3, -1.95), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: rgb("#808080"))))
  content((2.3, -1.95), [#text(fill: rgb("#000000"))[#text(size: 7pt)[$pi_e$]]], anchor: "west", padding: 0.1176cm)
  line((-1.75, -1.95), (-1.05, -1.95), stroke: (paint: rgb("#a65300"), thickness: 2.3pt, miter-limit: 10))
  line((-0.35, -1.95), (0.35, -1.95), stroke: (paint: rgb("#595959"), thickness: 2.3pt, miter-limit: 10))
  line((1.05, -1.95), (1.75, -1.95), stroke: (paint: rgb("#000099"), thickness: 2.3pt, miter-limit: 10))
  content((-1.4, -2.03), [#text(size: 8pt)[$B$]], anchor: "north", padding: 0.1176cm)
  content((0, -2.03), [#text(size: 8pt)[$K_0,L,R$]], anchor: "north", padding: 0.1176cm)
  content((1.4, -2.03), [#text(size: 8pt)[$T$]], anchor: "north", padding: 0.1176cm)
  content((0, -2.8), [#box(width: 6.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$L<_"uK"_0<_"uR"$;#linebreak()the two horizontal gaps are strict.]]])])
  content((7.15, 2.15), [#text(size: 8pt)[\(b\) After moves 1--2]])
  line((8.564, -1.45), (6.89, 1.45), stroke: (paint: rgb("#8c8c8c"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((7.41, -1.45), (5.736, 1.45), stroke: (paint: rgb("#8c8c8c"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  circle((7.15, 0), radius: 0.23, fill: rgb("#f0f0f0"), stroke: (paint: rgb("#666666"), thickness: 0.65pt, miter-limit: 10))
  content((7.15, 0), [#text(size: 8pt)[$K_0$]])
  circle((8.05, 0.95), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((7.82, 0.98), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((8.25, 1.05), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((8.28, 0.86), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((8.05, 0.95), [#text(size: 9pt)[$T$]])
  circle((8.75, 0.05), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((8.52, 0.08), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((8.95, 0.15), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((8.98, -0.04), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((8.75, 0.05), [#text(size: 9pt)[$R$]])
  circle((6.25, -0.95), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((6.02, -0.92), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((6.45, -0.85), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((6.48, -1.04), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((6.25, -0.95), [#text(size: 9pt)[$B$]])
  circle((5.55, -0.05), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((5.32, -0.02), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((5.75, 0.05), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((5.78, -0.14), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((5.55, -0.05), [#text(size: 9pt)[$L$]])
  content((8.75, 1.45), [#text(fill: rgb("#000099"))[#text(size: 8pt)[$Q_+=T union R$]]])
  content((5.55, -1.45), [#text(fill: rgb("#a65300"))[#text(size: 8pt)[$Q_-=B union L$]]])
  line((9.15, 0.27), (9.84, 0.67), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#000099"))))
  content((9.495, 0.6111), [#text(size: 8pt)[$(3)#h(0.3333em) "bu"$]], anchor: "south", padding: 0.1176cm)
  line((5.15, -0.27), (4.46, -0.67), stroke: (paint: rgb("#a65300"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#a65300"))))
  content((4.805, -0.6111), [#text(size: 8pt)[$(4)#h(0.3333em) -"cu"$]], anchor: "north", padding: 0.1176cm)
  line((4.85, -1.95), (9.45, -1.95), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: rgb("#808080"))))
  content((9.45, -1.95), [#text(fill: rgb("#000000"))[#text(size: 7pt)[$pi_u$]]], anchor: "west", padding: 0.1176cm)
  line((5.4, -1.95), (6.1, -1.95), stroke: (paint: rgb("#a65300"), thickness: 2.3pt, miter-limit: 10))
  line((6.8, -1.95), (7.5, -1.95), stroke: (paint: rgb("#595959"), thickness: 2.3pt, miter-limit: 10))
  line((8.2, -1.95), (8.9, -1.95), stroke: (paint: rgb("#000099"), thickness: 2.3pt, miter-limit: 10))
  content((5.75, -2.03), [#text(size: 8pt)[$Q_-$]], anchor: "north", padding: 0.1176cm)
  content((7.15, -2.03), [#text(size: 8pt)[$K_0$]], anchor: "north", padding: 0.1176cm)
  content((8.55, -2.03), [#text(size: 8pt)[$Q_+$]], anchor: "north", padding: 0.1176cm)
  content((7.15, -2.8), [#box(width: 6.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[Move each entire family outwards#linebreak()across its $u$-gap.]]])])
  content((0, -3.5), [#text(size: 8pt)[\(c\) After moves 3--4]])
  line((-1.299, -7.1), (0.375, -4.2), stroke: (paint: rgb("#8c8c8c"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.375, -7.1), (1.299, -4.2), stroke: (paint: rgb("#8c8c8c"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  circle((0, -5.65), radius: 0.23, fill: rgb("#f0f0f0"), stroke: (paint: rgb("#666666"), thickness: 0.65pt, miter-limit: 10))
  content((0, -5.65), [#text(size: 8pt)[$K_0$]])
  circle((1.8, -4.47), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((1.57, -4.44), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((2, -4.37), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((2.03, -4.56), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((1.8, -4.47), [#text(size: 9pt)[$T$]])
  circle((2.28, -5.1), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((2.05, -5.07), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((2.48, -5), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((2.51, -5.19), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((2.28, -5.1), [#text(size: 9pt)[$R$]])
  circle((-1.8, -6.83), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((-2.03, -6.8), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((-1.6, -6.73), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((-1.57, -6.92), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((-1.8, -6.83), [#text(size: 9pt)[$B$]])
  circle((-2.28, -6.2), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((-2.51, -6.17), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((-2.08, -6.1), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((-2.05, -6.29), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((-2.28, -6.2), [#text(size: 9pt)[$L$]])
  content((1.95, -4.02), [#text(fill: rgb("#000099"))[#text(size: 8pt)[$Q_+$]]])
  content((-1.85, -7.28), [#text(fill: rgb("#a65300"))[#text(size: 8pt)[$Q_-$]]])
  line((-2.38, -5.82), (-2.99, -5.47), stroke: (paint: rgb("#a65300"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#a65300"))))
  content((-2.685, -5.469), [#text(size: 8pt)[$(5)#h(0.3333em) "du"'$]], anchor: "south", padding: 0.1176cm)
  line((-2.3, -7.6), (2.3, -7.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: rgb("#808080"))))
  content((2.3, -7.6), [#text(fill: rgb("#000000"))[#text(size: 7pt)[$pi_(u')$]]], anchor: "west", padding: 0.1176cm)
  line((-1.75, -7.6), (-1.05, -7.6), stroke: (paint: rgb("#000099"), thickness: 2.3pt, miter-limit: 10))
  line((-0.35, -7.6), (0.35, -7.6), stroke: (paint: rgb("#595959"), thickness: 2.3pt, miter-limit: 10))
  line((1.05, -7.6), (1.75, -7.6), stroke: (paint: rgb("#a65300"), thickness: 2.3pt, miter-limit: 10))
  content((-1.4, -7.68), [#text(size: 8pt)[$Q_+$]], anchor: "north", padding: 0.1176cm)
  content((0, -7.68), [#text(size: 8pt)[$K_0$]], anchor: "north", padding: 0.1176cm)
  content((1.4, -7.68), [#text(size: 8pt)[$Q_-$]], anchor: "north", padding: 0.1176cm)
  content((0, -8.45), [#box(width: 6.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$K_0<_"eQ"_+$;#linebreak()now $Q_-$ is the extreme high $u'$-side.]]])])
  content((7.15, -3.5), [#text(size: 8pt)[\(d\) After move 5]])
  line((4.45, -5.25), (9.85, -5.25), stroke: (paint: rgb("#8c8c8c"), thickness: 0.45pt, miter-limit: 10, dash: "densely-dashed"))
  content((9.85, -5.25), [#text(fill: rgb("#000000"))[#text(size: 8pt)[$theta$]]], anchor: "west", padding: 0.1176cm)
  circle((7.15, -5.65), radius: 0.23, fill: rgb("#f0f0f0"), stroke: (paint: rgb("#666666"), thickness: 0.65pt, miter-limit: 10))
  content((7.15, -5.65), [#text(size: 8pt)[$K_0$]])
  circle((8.45, -4.32), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((8.22, -4.29), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((8.65, -4.22), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((8.68, -4.41), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((8.45, -4.32), [#text(size: 9pt)[$T$]])
  circle((9.25, -4.85), radius: (0.34, 0.23), fill: rgb("#ebebf7"), stroke: (paint: rgb("#000099"), thickness: 0.65pt, miter-limit: 10))
  circle((9.02, -4.82), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((9.45, -4.75), radius: 0.018, fill: rgb("#000099"), stroke: none)
  circle((9.48, -4.94), radius: 0.018, fill: rgb("#000099"), stroke: none)
  content((9.25, -4.85), [#text(size: 9pt)[$R$]])
  circle((5.85, -4.85), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((5.62, -4.82), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((6.05, -4.75), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((6.08, -4.94), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((5.85, -4.85), [#text(size: 9pt)[$B$]])
  circle((5.05, -4.32), radius: (0.34, 0.23), fill: rgb("#f8f1eb"), stroke: (paint: rgb("#a65300"), thickness: 0.65pt, miter-limit: 10))
  circle((4.82, -4.29), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((5.25, -4.22), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  circle((5.28, -4.41), radius: 0.018, fill: rgb("#a65300"), stroke: none)
  content((5.05, -4.32), [#text(size: 9pt)[$L$]])
  content((8.95, -3.88), [#text(fill: rgb("#000099"))[#text(size: 8pt)[$Q_+$]]])
  content((5.35, -3.88), [#text(fill: rgb("#a65300"))[#text(size: 8pt)[$Q_-$]]])
  content((7.15, -5.94), [#text(size: 8pt)[$X_ delta$ stays fixed in $K_0$]], anchor: "north", padding: 0.1176cm)
  line((7.15, -7.12), (7.15, -6.56), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  content((7.15, -6.56), [#text(fill: rgb("#000000"))[#text(size: 8pt)[$e$]]], anchor: "south", padding: 0.1176cm)
  line((7.15, -7.12), (7.8, -6.745), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  content((7.8, -6.745), [#text(fill: rgb("#000000"))[#text(size: 8pt)[$u$]]], anchor: "west", padding: 0.1176cm)
  line((7.15, -7.12), (6.5, -6.745), stroke: (paint: rgb("#4d4d4d"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#4d4d4d"))))
  content((6.5, -6.745), [#text(fill: rgb("#000000"))[#text(size: 8pt)[$u'$]]], anchor: "east", padding: 0.1176cm)
  line((4.85, -7.6), (9.45, -7.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, fill: rgb("#808080"))))
  content((9.45, -7.6), [#text(fill: rgb("#000000"))[#text(size: 7pt)[$pi_e$]]], anchor: "west", padding: 0.1176cm)
  line((5.4, -7.6), (6.1, -7.6), stroke: (paint: rgb("#595959"), thickness: 2.3pt, miter-limit: 10))
  line((7.7, -7.57), (8.9, -7.57), stroke: (paint: rgb("#000099"), thickness: 2.3pt, miter-limit: 10))
  line((7.7, -7.63), (8.9, -7.63), stroke: (paint: rgb("#a65300"), thickness: 2.3pt, miter-limit: 10))
  content((5.75, -7.68), [#text(size: 8pt)[$K_0$]], anchor: "north", padding: 0.1176cm)
  content((8.3, -7.68), [#text(size: 8pt)[$Q_+ union Q_-$]], anchor: "north", padding: 0.1176cm)
  content((7.15, -8.45), [#box(width: 6.335cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 8pt)[A horizontal reflection row#linebreak()separates the insertion.]]])])
})],
  caption: [Figure 2: The five moves in Lemma 42. The normal projection is $pi_n \( z \) = z dot.op n$, and $A <_n B$ means $sup_(z in A) z dot.op n < inf_(z in B) z dot.op n$ for the enlarged supports. The interval bars record this order; panels do not share a common scale. Each family carries its obstacle neighborhoods, checks, local factors, and representative phases together. Choose $a_(+) \, a_(-) \, b \, c \, d$ successively in nonempty open ranges, each depending on the earlier choices. After the final reflection bound, analytic translation removes the moves in reverse order $d \, c \, b \, a_(-) \, a_(+)$ by successive continuation of the normalized expectation. Empty families omit their moves. ],
) <fig:pins-five-moves>

On $P_(upright("loc"))$ the double-pin representatives satisfy $H \( v_i \) =
  4 t_i$ in the anchor convention of (5.10). In particular

$ D_i = frac(H \( v_i \) - H \( v_1 \), 4) = t_i - t_1 in bb(Z) . $

For $s = \( s_2 \, dots.h \, s_m \) in \[ 0 \, 2 pi \]^(m - 1)$,
  independent Haar fields give the exact balanced character identity

#[#set math.equation(numbering: n => "(5.19)")
 $ exp (i sum_(i = 2)^m s_i D_i) = product_(i = 2)^m Z_(s_i \/ 4)^(\( i \)) \( v_i \)
   overline(Z_(s_i \/ 4)^(\( i \)) \( v_1 \)) . $ <pins:balanced-characters>]

The auxiliary Haar variables cancel. This identity is valid for unbounded integer lifts;
  no reduction of the differences modulo four has been made. Let

#[#set math.equation(numbering: n => "(5.20)")
 $ P_(=) = P_(upright("loc")) ∩ { D_i = 0 upright(" for all ") i gt.eq 2 } . $ <pins:common-offset-event>]

Fourier orthogonality on the integer variables gives

#[#set math.equation(numbering: n => "(5.21)")
 $ upright(bold(1))_(P_(=)) = frac(upright(bold(1))_(P_(upright("loc"))), \( 2 pi \)^(m - 1))
   integral_(\[ 0 \, 2 pi \]^(m - 1)) exp (i sum_(i = 2)^m s_i D_i) thin thin upright(d) s .
   $ <pins:fourier-projection>]

For each fixed $s$, Lemma 42 applies to the right-hand character.
  At this fixed geometry its normalized integrand is bounded uniformly in $s$ and $delta$, since

$ J_delta^(- 1) bb(E) \[ \| X_delta F_delta \| upright(bold(1))_(P_(upright("loc"))) \] lt.eq
  frac(bb(P) \( P \), J_delta) thin C_F bb(E) \[ \| X_delta \| divides P_(upright("loc")) \] lt.eq C . $

Equations (5.8) and (5.9) justify this bound. Dominated convergence in (5.21) yields

#[#set math.equation(numbering: n => "(5.22)")
 $ J_delta^(- 1) bb(E) \[ X_delta F_delta upright(bold(1))_(P_(=)) \] arrow.r 0 . $ <pins:common-offset-numerator>]

=== 5.6 Synchronizing offsets and filling the gaps <synchronizing-offsets-and-filling-the-gaps>

Keep the grid and windows fixed. Choose a radius $r_0 > 0$ so small that the balls about $gamma \( cal(C)_0 \)$ of
  radius $2 r_0$ are disjoint, avoid every test disk, and lie within the single-color portions of the windows.
  In particular they meet no second-color equality edge or pin.
  The first-color deletions are contained in balls of radius $C a$ about these points, for a fixed $C$.
  Write $mu_(delta \, a)$ for the law conditioned on $P$, $mu_(delta \, a)^(=)$ for the law conditioned on
  $P_(=)$, and $mu_(delta \, 0)$ for the corresponding filled bracket. These denote one chosen bracket sign at a time.

#thm([Lemma 5.11.])[
  (Gap closing).  #emph[There is a function $omega \( a \) arrow.r 0$ as $a arrow.b 0$ such that
#[#set math.equation(numbering: n => "(5.23)")
 $ limsup_(delta arrow.b 0) bb(P) \( P_(=)^c divides P \) & lt.eq omega \( a \) \,\
limsup_(delta arrow.b 0) ∥mu_(delta \, a)^(=) \|_(cal(I)_delta) -
  mu_(delta \, 0) \|_(cal(I)_delta)∥_(upright("TV")) & lt.eq omega \( a \) \,\
limsup_(delta arrow.b 0) bb(E)_(mu_(delta \, a)^(=)) \| X_delta \|^p & lt.eq C_p wide \( 1 lt.eq p < oo \) \,
  $ <pins:offset-synchronization>]

 where $cal(I)_delta$ is the joint increment information in the fixed test disks.
   The constants in the last line are independent of all sufficiently small $a$.]
] <pins:gap-closing>

#proof[
  For each whole gap use a logarithmic stack between radii $C a$ and $r_0$,
    retaining the second-color prescriptions first as equality edges $E_0$.
    All first-color pins in this stack are favorable and there is no equality edge crossing it.
    A surrounding good plus circuit joins the traversing first-color arms on its two sides.
    The arms exist by the degree-one traversal in Lemma 33; they run from the inner gap neighborhood to beyond the
    chosen outer collar. Together with the local checks, such a circuit identifies the lifted pairs of the
    neighboring groups. The stack failure probability is at most $C \( a \/ r_0 \)^alpha$.
    Restoring the boundedly many second-color plus labels costs at most a fixed factor $2^M$.
    There are finitely many gaps, and their successive connections join all groups cyclically.
    Lemma 37 thus proves (5.23), with a bound of this power form plus terms whose mesh limsup is zero.
  For comparison with the filled bracket, keep exactly the same second-color equalities $E_0$ in both laws.
    Add the missing favorable first-color pins in one gap and use the ordered stopped coupling of Proposition 6.
    Search outward from the changed region for a common good plus circuit in the same stack.
    Except with probability $C \( a \/ r_0 \)^alpha$, such a cut is found before the search meets any equality
    edge or label prescription. The only changes are on its near side,
    so the correct stopped kernels agree on its far side by Lemma 4. Sample those remaining variables identically.
    This matches the spins and increments in all test disks, and also the second-color data needed to read every
    prescribed plus label. The exterior of the small gap ball contains paths within each test disk,
    so the matching of pair variables there indeed matches its full local increment information.
  Repeat for the finitely many gaps, including all discarded shallow components inside the changed balls.
    The conditional laws at every stage use the common $E_0$ and their own correct query marginals.
    After this coupling restore the label event. Under each equality law its probability is at least $2^(- M)$.
    If the joint records match the label data outside an exceptional event of probability $r$,
    then for any event of the test data its two label-conditioned probabilities differ by at most $C 2^M r$.
    This follows by comparing the two joint numerators and the two label-event denominators separately.
    Thus the bounded label cost preserves the vanishing total-variation error.
    Finally conditioning the gapped law further on $P_(=)$ changes its total variation by at most
    $bb(P) \( P_(=)^c divides P \)$, which proves (5.23). No estimate here divides an additive error by the
    probability of the rare first-color pin event: all couplings already have those conditional laws as their marginals.
  It remains to prove (5.23); the separated estimate (5.9) alone does not provide a uniform constant as the
    obstacle gaps close. Fix one cut-search annulus around the test support, independent of $a$,
    away from the boundary collar. Under $P$ it has a favorable good cut with conditional probability at least
    $c > 0$, uniformly in $a$: use the buffer bound with all remote equalities retained and then the same bounded
    label cost. By (5.23), for all sufficiently small $a$ its intersection with $P_(=)$ has conditional
    probability at least $c \/ 2$ in mesh limsup. More precisely choose $a$ so that $omega \( a \) < c \/ 4$,
    and then take the mesh sufficiently small.
  The common-offset event can be read outside this whole search disk.
    Indeed its local checks use the boundary neighborhoods, and one can join all representatives by paths in the
    complement of the disk. Expose the cut from outside. Conditional on the exterior and its height trace,
    the interior is again the unconditioned weighted height problem with a consecutive-pair trace.
    Subtracting its offset and applying Proposition 21 provides a central interval $\| X_delta \| lt.eq
    M_1$ with positive conditional mass, where $M_1$ is independent of $a$.
  In the anchored array description of $P_(=)$ every offset is zero.
    Thus the constraints are just the fixed intervals $I$ and fixed singletons ${ 0 }$ in (5.10).
    Both rounded midpoints of any two such arrays are admissible, without a parity partition.
    Lemma 20, with the preceding uniform central mass and bounded rounding error, proves (5.23).
    Ambient exhaustion is justified as in Proposition 38. The filled brackets have the corresponding uniform
    moments by Lemma 36. ◻
]

#thm([Proposition 5.12.])[
  (Bracket insertion identity).  #emph[Fix a grid, windows, and local factors as in (5.1).
    Suppose two grid levels strictly bracket $K_0$, miss every spectator disk,
    and give the strict middle-strip geometry (5.17) for the boundary groups after arbitrarily small intersection
    gaps are opened. Then both filled brackets satisfy the target identity (5.4).
    In particular, any subsequential distributional bracket limit with convergent local test statistics satisfies
    the corresponding identity against products of bounded continuous functions of those statistics.]
] <prop:bracket-insertion>

#proof[
  At each fixed sufficiently small $a$, equations (5.8) and (5.23) give $liminf_(delta arrow.b 0)
    bb(P) \( P_(=) \) \/ J_delta > 0$. Divide (5.22) by this quantity to obtain
    $bb(E)_(mu_(delta \, a)^(=)) \[ X_delta F_delta \] arrow.r 0$.
    Let $T_M \( t \) = max \( - M \, min \( t \, M \) \)$. The second moments in (5.23) and in the filled bracket imply
  $ bb(E) \[ \| X_delta - T_M \( X_delta \) \| \] lt.eq C \/ M $
  in both laws, uniformly in small $a$ after the mesh limit. Total variation in (5.23) therefore yields
  $ limsup_(delta arrow.b 0) \| bb(E)_(mu_(delta \, 0)) \[ X_delta F_delta \] \| lt.eq 2 C_F M omega \( a \) +
    2 C_F C \/ M . $
  First take the mesh limit at fixed $a$ as displayed, then let $a arrow.b 0$, and finally let $M arrow.r oo$.
    This proves (5.4). Weak convergence of the local test statistics, continuity of their bounded factors,
    and the same moment bound pass the identity to subsequential bracket limits.
  The window size $epsilon.alt$ has stayed fixed throughout.
    The boundary estimates in Section 6 will control the effect of shrinking these windows,
    and Section 7 will then transfer the identity to the true field.
    In particular no separated-obstacle constant was used uniformly when the gaps collided;
    the independent common-offset estimate was the ingredient that permitted their closure. ◻
]

== 6 Boundary attachments and vanishing boundary effects <sec:boundary>

The construction below joins two nearby boundary points by a nonnegative path and completes it through a suitable
  part of the genuine exterior to surround a small boundary neighborhood.
  We call the resulting separator a boundary arch. Its failure probability will decay exponentially in the number
  of available scales. Searches from the small-neighborhood side will then remove the exceptional windows in the
  pinning brackets. Searches from the opposite side will control an absolute height average near the boundary
  while leaving distant height observations measurable outside the arch.

The first task is to attach a nonnegative path to a prescribed boundary arc.
  A bulk circuit alone does not give that attachment. We construct a lower comparison law whose mean near the arc
  is close to $- 1 \/ 2$; a level-path exploration then forces a boundary-attached zero path with positive
  probability. Every real separating site retains its actual height throughout these comparisons.

=== 6.1 The boundary convention and a synthetic lower trace <the-boundary-convention-and-a-synthetic-lower-trace>

Write $V_delta$ for the set of face centers on which the finite height problem is defined,
  including its prescribed boundary sites, and write $S_(0 \, delta)$ for the connected boundary walk of Lemma 33.
  We use its image as a graph; occurrences of one vertex in the traversal are not different height variables.
  If a further site circuit is exposed, the #emph[usable trace] of a retained component consists of its real fixed
  neighboring sites. The values at those sites remain part of the conditioning.

For a height $H$ and a level $t$, put

#[#set math.equation(numbering: n => "(6.1)")
 $ hat(cal(O))_t \( H \) = \( delta bb(T) \\ V_delta \) thin union thin { v in V_delta : H \( v \) gt.eq
   t } . $ <boundary:artificial-exterior>]

Thus only sites outside the #emph[original] height problem are declared open artificially.
  A real vertex which is removed during a search is still a real vertex, with its observed height.
  For the reversed convention replace $H gt.eq t$ by $H lt.eq t$.

Here and below every geometric length is positive and fixed before the mesh limit.
  In tangent and inward normal coordinates at $p in partial D$, let $Q_a \( p \) = p + \[ - a \, a \]^2$.
  There is a radius, uniform in $p$, on which the limiting boundary is a graph with any prescribed small slope
  tolerance. Parametric convergence has two further uses. First,
  all portions of $S_(0 \, delta)$ in a fixed local box lie in a vanishing neighborhood of the corresponding
  limiting arc. Second, two visits belonging to a smaller boundary patch can be joined along the walk in a
  slightly larger patch. Both assertions have fixed positive slack;
  they do not assert that the discrete boundary is a graph.
  To connect such a patch to the genuine exterior, take a lattice path from a point on its exterior side towards
  an interior point and stop at its first boundary site. Join that site to the desired boundary endpoint along the
  walk in the larger patch. To justify this local connection,
  choose a slightly larger limiting arc containing the smaller patch.
  The inverse of the limiting Jordan parametrization is uniformly continuous.
  Hence, for fine mesh, all visits to the smaller patch occur in the corresponding traversal interval,
  up to its fixed endpoint slack. The intervening walk stays in the larger patch by uniform parametric
  convergence. This applies to repeated visits as well as distinct vertices.

For the lower comparison, use $W$ as the first color. Its plus sign can represent the pair ${ - 1 \,
  0 }$ and its minus sign the pair ${ - 3 \, - 2 }$. We place the first pair near a clean boundary arc and the
  second pair elsewhere. An open-plus cut near the clean arc will then permit reflection of the inner height about
  $- 1 \/ 2$. The following construction fixes these actual integer pairs with only finitely many component
  labels, even when the discrete boundary walk has many repeated visits.
  This bounded label count is what keeps the later circuit estimates uniform.

#thm([Lemma 6.1.])[
  (Synthetic trace).  #emph[Fix finitely many high and low boundary arcs,
    separated by transition neighborhoods of positive length, with both types present.
    The high cores and all their transition neighborhoods lie where the usable actual trace is at least zero;
    the remaining usable trace is at least $- 2$. One may also add real separator pieces,
    each connected piece meeting its low part and staying a positive distance from the high cores and their
    transition neighborhoods. There may be arbitrarily many such pieces,
    for example when two site circuits enter and leave the domain many times.
    For all sufficiently small meshes there is a synthetic height $K$,
    obtained from a free ambient spin law by first-color pins and at most $M$ second-color labels,
    such that its connected prescribed skeleton $S$ has trace
#[#set math.equation(numbering: n => "(6.2)")
 $ K \|_(S^(+)) in { - 1 \, 0 } \, wide K \|_(S^(-)) in { - 3 \, - 2 } . $ <boundary:synthetic-pairs>]

 Here $S = S^(+) union S^(-)$, the high part contains the high cores and stays inside their prescribed larger
   arcs, and $M$ depends only on the number of these arcs. It does not depend on the separator pieces,
   the length of the discrete walk or the number of its repeated vertices.
   Given its full trace, $K$ has the usual height Gibbs laws in the bounded faces of $S$,
   and these laws are below the actual laws in height order.
   Before imposing the second-color labels, an event measurable in the first color and its statuses whose failure
   probability is $epsilon$ has failure probability at most $2^M epsilon$ after they are imposed.]
] <boundary:synthetic-trace>

#proof[
  Choose shortened cores of the prescribed arcs, leaving disjoint transition neighborhoods between consecutive
    cores. The image of an appropriate consecutive portion of the boundary traversal gives a connected graph for
    each core. Compact limiting cores of opposite types are separated,
    so their images neither intersect nor have an edge between them at sufficiently small mesh.
    Any portion not yet assigned is in one of the transition neighborhoods.
    Repeated visits inside a core belong to that same connected core image.
    Any repeated visit that could affect assignment outside the cores is localized to a transition neighborhood:
    otherwise two traversal parameters a fixed positive distance apart would converge to the same point of the
    Jordan curve. Uniform continuity of its inverse parametrization excludes this possibility.
  Grow the connected core sets in the finite walk graph. For example,
    give each unassigned vertex to a nearest core in graph distance, breaking ties in a fixed order,
    and use a shortest path to that core as its parent. Each resulting part is connected.
    Each component of the still unassigned graph had a neighboring core, since the entire walk graph is connected;
    hence the procedure assigns every vertex. The growth stays in the transition neighborhoods until it meets an
    already assigned core. In particular it never changes a prescribed core or its type.
    Merge neighboring parts of the same type. Added separator pieces are assigned low and joined to the low parts
    they meet. Their clearance from the high patch makes this consistent.
    Every added piece attaches to an existing low part, so it creates no new part;
    it may merge existing low parts. In particular no cost is charged for the number of real components of an
    added circuit.
  Pin $W = +$ or $W = -$ on the resulting parts. Their adjacency graph is connected.
    On each edge of a spanning tree joining opposite-sign parts,
    choose one corresponding skeleton edge and prescribe $B = -$ there.
    Its two endpoints already have opposite $W$ signs, so coherence forces their $B$ signs to agree.
    There are at most $M$ such labels. Anchor the lift by $K \( o \) = -
    1$ at a plus endpoint of one of these edges. Along a connected constant-$W$ part the lifted pair is unchanged;
    a labeled transition changes $- 1$ to $- 2$. Propagation along the spanning tree therefore gives (6.2).
    Extra contacts between parts create no further choice of lift: the ambient lift is single valued.
    The configuration $B equiv -$ shows that all the imposed conditions are simultaneously feasible.
    The separate flat comparison below fixes both spins and does not use this construction.
  Conditional on $W$ and its statuses, the $B$ components have fair independent labels.
    Requiring at most $M$ of them to have label minus has conditional probability at least $2^(- M)$,
    even if several requests refer to the same component. This proves the last assertion.
    The height Gibbs property follows on conditioning on the whole trace and integrating out the statuses.
    On each high part the synthetic trace is at most zero, and on each low part it is at most $- 2$.
    Lemma 15 gives the claimed comparison on every retained component. ◻
]

For later stopping arguments it is useful to state the elementary site-circuit fact explicitly.

#thm([Lemma 6.2.])[
  (Extremal site circuits).  #emph[In a specified finite annular strip,
    consider the simple open site circuits surrounding a fixed connected inner box.
    If one exists, there is an innermost and an outermost such circuit,
    ordered by their geometric Jordan interiors. Selection of the innermost circuit requires only its trace and
    observations on its inner side in the strip; selection of the outermost requires only its trace and
    observations on its outer side. Artificial openness as in (6.1) does not change these assertions.]
  #emph[Consequently, inner circuits selected from the inside and outer circuits selected from the outside in
    disjoint strips leave the pairwise disjoint unexamined middle components with their height Gibbs laws,
    independent given the revealed data and their real traces.]
] <boundary:extremal>

#proof[
  Two eligible cycles have inner and outer envelopes made of edges in their union.
    To see this, if they share at least two vertices, their union is two-vertex-connected.
    Indeed, after deleting any vertex, each cycle is connected and at least one common vertex remains.
    The face of this union containing the inner box and its unbounded face have simple cycle boundaries.
    They give the required envelopes. The inner box is connected and disjoint from the cycles,
    so it lies in a single face. If the cycles have no common vertex or only one,
    the requirement that both surround the box makes them nested.
    In every case the envelopes stay in the original strip and surround its inner box.
    Finitely many repeated envelopes give the least and greatest Jordan interiors.
    Geometric interiors, not just sets of enclosed lattice vertices, determine this order.
  For a proposed innermost circuit $gamma$, the assertion that it is selected is equivalent to its being open and
    to the nonexistence of an eligible open circuit with strictly smaller interior contained in its interior.
    A nonnested competitor would give such a circuit by the inner-envelope operation.
    The equivalent assertion reads only the sites on or inside $gamma$ in the strip.
    The outer case is identical with the order reversed. Deterministic tie conventions for a traversal of the
    selected cycle do not reveal additional sites. An unsuccessful strip can be read in its entirety.
  All these selection events are consequently measurable in the discarded regions and the separating traces.
    The nearest-neighbor height density factors over the remaining components,
    proving the Gibbs and independence claims. Only the goodness test of a genuinely exterior site is
    deterministic. Every selected real site retains its actual observed height in this factorization. ◻
]

=== 6.2 A local attachment <a-local-attachment>

We isolate the probabilistic and topological step which joins a bulk path to the actual boundary.
  Its constants are uniform over the separator traces allowed in the statement.

#thm([Lemma 6.3.])[
  (Attachment to a clean arc).  #emph[There are constants $lambda > 0$ and $a_0 > 0$, depending only on $x$,
    with the following property. Fix $b > 0$ and put $s = lambda b$.
    Suppose a retained height problem has a connected bounding skeleton consisting of $S_(0 \, delta)$ and
    separator pieces, all with usable trace at least $- 2$. A clean local patch of the base skeleton has trace at
    least zero. Use tangential and inward-normal coordinates $\( t \, y \)$ at this patch, and call $y$ its depth.
    Assume that all its base-skeleton sites in the box $\| t \| lt.eq 2 b$, $\| y \| lt.eq
    b$ lie in $\| y \| < s \/ 10$, the added separators miss the box,
    and the compact part above that band is in the domain. The high core and all transition sites can be chosen
    within $\| t \| < b \/ 3$, with a core covering $\| t \| lt.eq b \/ 8$.]
  #emph[At all sufficiently small meshes, uniformly in the retained trace,
    the probability of an actual path of heights at least zero from the clean base patch to depth $s$,
    staying in $\| t \| < b$, is at least $a_0$. Its boundary endpoint can be joined,
    through real nonnegative boundary sites in a slightly larger clean patch, to the artificially open exterior.]
] <lem:boundary-attachment>

#proof[
  Choose $s \/ b$ small, to be fixed at the end of the proof.
    Apply Lemma 45 with one high patch as stated and the rest of the skeleton low.
    The separators are low and meet the low base part, so the number $M$ of transition labels is bounded by an
    absolute constant. Work first with this synthetic height $K$ in a large free ambient triangulation containing
    the local boxes. Any sufficiently large finite volume suffices:
    after conditioning on the full skeleton trace, the interior height law is independent of that ambient volume.
    All estimates below are uniform in this choice. Let $z$ be a lattice site at distance $O \( delta \)$ from
    $\( 0 \, 3 s \)$.
  ===== 6.2.1 The successful cut and its reflection. <the-successful-cut-and-its-reflection.>
  Look for a good $W$-plus cut surrounding $z$ between an inner box of radius $4
    s$ and an outer box of radius $b \/ 16$. Slight fixed changes of these numerical radii accommodate lattice
    rounding. The inner box also contains a site $v$ of the high core.
    The annular buffers meet only favorable plus pins, and all transition labels lie outside the outer box.
    The stack estimate of Lemma 10, followed by the bounded label cost, gives an event $G$ with
  #[#set math.equation(numbering: n => "(6.3)")
   $ bb(P) \( G^c \) lt.eq eta \( s \/ b \) \, wide eta \( u \) lt.eq C u^alpha \, $ <boundary:cut-failure>]
  for some $C \, alpha > 0$. The event and the choice of cut are measurable in $W$ and its statuses.
  Given these variables and the prescribed transition labels,
    every $B$ component inside the good cut is free and no such component crosses it. Flip all their labels.
    On the connected pinned high part one has
  $ K \( v \) - 1 / 2 B \( v \) = - 1 / 2 . $
  Consequently this flip sends $K \( v \)$ to $- 1 - K \( v \)$.
    All increments inside the cut also change sign, since $W$ is unchanged and $B$ is reversed.
    It follows throughout its protected interior that
  #[#set math.equation(numbering: n => "(6.4)")
   $ K mapsto - 1 - K . $ <boundary:minus-half-reflection>]
  This is a weight-preserving involution of the still fair component labels.
    In particular the conditional mean at $z$, on $G$, is exactly $- 1 \/ 2$.
  ===== 6.2.2 Why failure has bounded conditional mean. <why-failure-has-bounded-conditional-mean.>
  Let $cal(A)$ contain the full first color and its statuses and the prescribed second-color labels. Increments satisfy
  #[#set math.equation(numbering: n => "(6.5)")
   $ thin upright(d) \( K - B W \/ 2 \) = - B thin thin upright(d) W . $ <boundary:component-identity>]
  For each $B$ component $C$, the portion of $thin upright(d) W$ carried by that component has zero curl.
    Every $W$-changing edge belongs to a closed cell. The two changing edges of any triangle share a vertex,
    so their endpoints belong to the same $B$ component and their contributions cancel.
    Its potential $phi.alt_C$ has oscillation at most two: on $C$ it equals $W$ up to a constant,
    and outside $C$ it is constant until a path first hits $C$.
    This is also the component-potential calculation in Lemma 14.
    Integrating (6.5) from the labeled anchor $o$, where $K \( o \) = - 1$,
    gives an endpoint correction of absolute value at most one and one term $-
    B_C \( phi.alt_C \( z \) - phi.alt_C \( o \) \)$ for each component.
    Every unlabeled component has conditional mean zero. At most $M$ components are labeled. Therefore
  #[#set math.equation(numbering: n => "(6.6)")
   $ \| bb(E) \[ K \( z \) divides cal(A) \] \| lt.eq 2 + 2 M . $ <boundary:failure-mean>]
  Since $G$ is $cal(A)$-measurable, its failure contributes at most $\( 2 + 2 M \)
    bb(P) \( G^c \)$ to the #emph[mean]. No pointwise height bound or bound on
    $bb(E) \[ \| K \( z \) \| divides G^c \]$ is being used. Combining (6.4)–(6.6) shows that
  #[#set math.equation(numbering: n => "(6.7)")
   $ lr(|bb(E) K \( z \) + 1 / 2|) lt.eq C_M eta \( s \/ b \) . $ <boundary:synthetic-mean>]
  ===== 6.2.3 Boundary-entering level paths and a Gibbs ceiling. <boundary-entering-level-paths-and-a-gibbs-ceiling.>
  Condition on the synthetic height trace on $S$ and consider the bounded face containing $z$.
    Starting at every trace edge with values $- 1 \, 0$, follow its dual level path at level $- 1 \/ 2$,
    stopping when it returns to the skeleton. Reveal only the path and its two adjacent site lips.
    Continuation is unique: in a triangle containing an edge with values $- 1 \, 0$, the third height is either $-
    1$ or $0$, so exactly two of its edges cross this level. Such a path cannot branch or turn into an independent
    closed contour. Stop a path also at an earlier revealed segment if necessary,
    and exhaust all the boundary-entering paths. Each high lip is a connected chain of zeros attached to a zero on
    the prescribed skeleton; each low lip has height $- 1$.
  This is a stopped height exploration: the next query is determined by the already revealed heights,
    so the unrevealed regions retain their height Gibbs laws.
    Give a remaining region the high or low designation inherited from the side of the exposed paths and the
    original trace. This designation ignores every unexposed closed contour.
    It is consistent because a closed contour in a bounded face cannot enclose part of the connected bounding
    skeleton, or part of a path attached to that skeleton. After all the entering paths have been traced,
    a low region has usable boundary at most $- 1$, while a high region has usable boundary at most zero.
    This can alternatively define the designation by cutting the face along the exposed paths and using their
    oriented lips. If $z$ is itself revealed, its lip gives the same bounds directly.
  Height comparison with the constant ceilings $- 1$ and $0$, whose mean fields are respectively $- 1$ and $0$,
    now gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ bb(E) K \( z \) lt.eq - 1 + bb(P) \( z upright(" has the high designation") \) . $ <boundary:ceiling>]
  An unseen closed contour can create a high island inside a low-designated region.
    Its entire Gibbs contribution is included in this ceiling comparison;
    the high designation is not the event $K \( z \) gt.eq 0$.
    Equations (6.7) and (6.8) yield a high-designation probability at least $1 \/ 2 - C_M eta \( s \/ b \)$.
  ===== 6.2.4 The barriers force a real attachment. <the-barriers-force-a-real-attachment.>
  Figure 3 depicts the following separation argument. At the two boundary projections $t = plus.minus 2 b \/ 3$,
    request good $W$-minus circuits in annuli with inner size $2 s$ and outer size less than $b \/ 8$.
    Choose the inner boxes to contain the whole cross-section $- s \/ 10 lt.eq y lt.eq
    s$ at the corresponding projection. Each annulus meets only low skeleton pins;
    its circuit meets the low part and therefore uses the anchored pair ${ - 3 \, - 2 }$.
    Its adjacent site path contains a surrounding site circuit of heights at most $- 2$.
    The same stack estimate and label cost bound the probability of failure of either barrier by $2
    eta_1 \( s \/ b \)$, where $eta_1 \( u \) arrow.r 0$. These barrier events are intersected with the
    high-designation event after deriving (6.8); they were not extra observations in that Gibbs comparison.
  Every exposed zero lip starts on the designated high patch:
    the rest of $S$, including the added separators, has heights $- 3 \, - 2$.
    Suppose no such lip reaches depth $s$ while $\| t \| < b$.
    Before any sideways exit its sites have depth less than $s + O \( delta \)$,
    and they cannot have depth less than $- s \/ 10 - O \( delta \)$ locally because they lie in the closure of
    the bounded face on the domain side of the base boundary.
    To pass the lateral projection $2 b \/ 3$, a lip starting in $\| t \| < b \/
    3$ would have to enter the inner box of the right low circuit.
    It starts outside that circuit, and planar site paths cannot cross without sharing a vertex.
    It would therefore meet a site of height at most $- 2$, impossible for a zero lip.
    The left barrier gives the other side. This argument applies to the entire lip,
    regardless of its number of visits to the shallow strip. Thus all exposed boundary-entering contours are
    confined to $\| t \| < 2 b \/ 3 + O \( delta \)$ and $y < s + O \( delta \)$.
  There is now a path from $z$ at depth $3 s$ along a horizontal corridor to $t$ close to $b$,
    followed by a downward path towards depth $- s$. Choose nearest-neighbor lattice paths within $O \( delta \)$
    of these segments and stop at the first real skeleton site.
    The horizontal corridor is inside the domain and above all the confined exposed paths.
    The descent lies beyond their horizontal range. Its proposed endpoint below the shallow band is genuinely
    exterior, so the separation property of $S_(0 \, delta)$ forces a first skeleton hit.
    That hit is low, since its tangential coordinate lies beyond the high patch and all transition zones.
    No added separator enters this box. Until the first hit the route stays in the same face of $S$,
    even when that face has a boundary walk with repeated vertices.
    It crosses no exposed level path and therefore connects $z$ to a low-designated boundary portion.
    This contradicts the high designation of $z$. The low circuits themselves need not be avoided by this route;
    they were not used to subdivide the designation.
  It follows that high designation and the two barriers force an actual zero lip attached to the high patch to
    rise to depth $s$. Choose $s \/ b = lambda$ so small that $C_M eta \( lambda \) +
    2 eta_1 \( lambda \) < 1 \/ 4$. The synthetic attachment then has probability at least $1 \/ 4$.
    All slope tolerances and mesh errors are chosen only after this positive ratio is fixed.
  Finally the existence of a path of heights at least zero from this patch to depth $s$ is an increasing height
    event. Lemma 45 transfers its lower probability to the actual retained law.
    Its endpoint is a real clean boundary site. The local walk connection described above joins it to a boundary
    site incident to the genuine exterior, using real clean sites whose heights are all at least zero.
    Only after this connection do we use artificial openness outside $V_delta$.
    This proves the lemma, for instance with $a_0 = 1 \/ 4$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-7.289, -5.94), (7.684, 3.333), stroke: none)
  rect((-6.554, -0.627), (6.554, -0.066), fill: rgb("#ededed"), stroke: none)
  rect((-6.554, -0.066), (6.554, 0.066), fill: rgb("#f7f7f7"), stroke: none)
  line((-6.554, -0.066), (6.554, -0.066), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((-6.554, 0.066), (6.554, 0.066), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((-6.554, 0.66), (6.554, 0.66), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((-6.554, 1.98), (6.554, 1.98), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  content((-6.724, 0.66), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s$]]])], anchor: "east")
  content((-6.724, 1.98), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$3s$]]])], anchor: "east")
  content((-6.724, 0), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.03528cm)
  line((-6.554, 0.0132), (-5.65, 0.0264), (-4.916, -0.0165), (-4.52, 0.0396), (-4.689, 0.0033), (-4.52, 0.0396), (-3.729, 0.0099), (-2.882, -0.0132), (-2.204, 0.0264), (-1.469, 0.0099), (-1.243, -0.0165), (-1.384, 0.0231), (-1.243, -0.0165), (-0.7063, 0.0099), (0, 0.0264), (0.7063, 0.0099), (1.243, -0.0198), (1.978, 0.0264), (2.712, 0.0033), (3.108, 0.0363), (2.91, -0.0165), (3.108, 0.0363), (3.786, 0.0132), (4.633, -0.0066), (5.65, 0.0264), (6.554, 0.0099), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  line((-0.7063, 0.0099), (0, 0.0264), (0.7063, 0.0099), stroke: (thickness: 2.0pt, cap: "round", join: "round"))
  circle((-3.769, 0.594), radius: (0.5933, 0.858), stroke: (thickness: 1.0pt, cap: "round", join: "round"))
  circle((3.769, 0.594), radius: (0.5933, 0.858), stroke: (thickness: 1.0pt, cap: "round", join: "round"))
  content((-3.769, 1.597), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$K lt.eq -2$]]])], anchor: "south")
  content((3.769, 1.597), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$K lt.eq -2$]]])], anchor: "south")
  circle((0, 1.98), radius: 0.05644, fill: black, stroke: none)
  content((-3.769, -0.3102), [#text(size: 9pt)[$-2b"/"3$]], anchor: "north", padding: 0.1176cm)
  content((3.769, -0.3102), [#text(size: 9pt)[$2b"/"3$]], anchor: "north", padding: 0.1176cm)
  content((0, -0.2112), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ededed"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[high patch]]])], anchor: "north")
  content((-6.469, -0.4488), [#text(size: 9pt)[actual exterior]], anchor: "west", padding: 0cm)
  rect((-6.554, -5.379), (6.554, -4.818), fill: rgb("#ededed"), stroke: none)
  rect((-6.554, -4.818), (6.554, -4.686), fill: rgb("#f7f7f7"), stroke: none)
  line((-6.554, -4.818), (6.554, -4.818), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((-6.554, -4.686), (6.554, -4.686), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  line((-6.554, -4.092), (6.554, -4.092), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((-6.554, -2.772), (6.554, -2.772), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dotted"))
  content((-6.724, -4.092), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s$]]])], anchor: "east")
  content((-6.724, -2.772), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$3s$]]])], anchor: "east")
  content((-6.724, -4.752), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.03528cm)
  line((-6.554, -4.739), (-5.65, -4.726), (-4.916, -4.769), (-4.52, -4.712), (-4.689, -4.749), (-4.52, -4.712), (-3.729, -4.742), (-2.882, -4.765), (-2.204, -4.726), (-1.469, -4.742), (-1.243, -4.769), (-1.384, -4.729), (-1.243, -4.769), (-0.7063, -4.742), (0, -4.726), (0.7063, -4.742), (1.243, -4.772), (1.978, -4.726), (2.712, -4.749), (3.108, -4.716), (2.91, -4.769), (3.108, -4.716), (3.786, -4.739), (4.633, -4.759), (5.65, -4.726), (6.554, -4.742), stroke: (thickness: 0.7pt, cap: "round", join: "round"))
  line((-0.7063, -4.742), (0, -4.726), (0.7063, -4.742), stroke: (thickness: 2.0pt, cap: "round", join: "round"))
  circle((-3.769, -4.158), radius: (0.5933, 0.858), stroke: (thickness: 1.0pt, cap: "round", join: "round"))
  circle((3.769, -4.158), radius: (0.5933, 0.858), stroke: (thickness: 1.0pt, cap: "round", join: "round"))
  content((-3.769, -3.155), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$K lt.eq -2$]]])], anchor: "south")
  content((3.769, -3.155), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$K lt.eq -2$]]])], anchor: "south")
  circle((0, -2.772), radius: 0.05644, fill: black, stroke: none)
  content((-3.769, -5.062), [#text(size: 9pt)[$-2b"/"3$]], anchor: "north", padding: 0.1176cm)
  content((3.769, -5.062), [#text(size: 9pt)[$2b"/"3$]], anchor: "north", padding: 0.1176cm)
  content((0, -4.963), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ededed"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[high patch]]])], anchor: "north")
  content((-6.469, -5.201), [#text(size: 9pt)[actual exterior]], anchor: "west", padding: 0cm)
  content((-6.554, 3.069), [#text(size: 9pt)[\(a\) A boundary-tied zero lip reaches depth $s$]], anchor: "west", padding: 0.1176cm)
  bezier((-0.4803, 0.0165), (-1.639, 2.086), (-1.639, 0.495), (-1.752, 1.386), stroke: (thickness: 1.7pt, cap: "round", join: "round"))
  bezier((-1.639, 2.086), (1.808, 2.092), (-1.582, 2.462), (1.639, 2.521), stroke: (thickness: 1.7pt, cap: "round", join: "round"))
  bezier((1.808, 2.092), (0.4803, 0.0165), (1.921, 1.34), (1.695, 0.5016), stroke: (thickness: 1.7pt, cap: "round", join: "round"))
  content((2.26, 2.389), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[exposed lip $K=0$]])], anchor: "west")
  line((2.288, 2.31), (1.695, 2.284), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  content((0, 1.267), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[high side]]])])
  content((0, 1.874), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$z=(0,3s)$]]])], anchor: "north")
  content((-6.497, -0.99), [#text(size: 9pt)[The real boundary walk, including repetitions, lies in $| upright("depth") |<s"/"10$.]], anchor: "west", padding: 0cm)
  content((-6.554, -1.683), [#text(size: 9pt)[\(b\) Hypothetical: every exposed high lip stays shallow]], anchor: "west", padding: 0.1176cm)
  content((-0.08475, -2.706), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$z=(0,3s)$]]])], anchor: "south-east")
  bezier((-0.5933, -4.739), (-0.1413, -4.729), (-2.147, -4.435), (-1.582, -4.151), stroke: (thickness: 1.7pt, cap: "round", join: "round"))
  bezier((0.08475, -4.729), (0.5933, -4.739), (1.639, -4.151), (2.147, -4.435), stroke: (thickness: 1.7pt, cap: "round", join: "round"))
  content((-1.187, -3.742), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$K=0$ lips]]])], anchor: "east")
  line((-1.526, -3.815), (-1.3, -4.396), stroke: (thickness: 0.4pt, cap: "round", join: "round"))
  line((0.1695, -2.772), (5.255, -2.772), stroke: (thickness: 0.85pt, cap: "round", join: "round", dash: "dashed"), mark: (end: ">"))
  line((5.65, -2.772), (5.65, -4.666), stroke: (thickness: 0.85pt, cap: "round", join: "round", dash: "dashed"), mark: (end: ">"))
  line((5.255, -2.772), (5.65, -2.772), stroke: (thickness: 0.85pt, cap: "round", join: "round", dash: "dashed"))
  circle((5.65, -4.726), radius: 0.07056, fill: rgb("#ffffff"), stroke: (thickness: 0.8pt, cap: "round", join: "round"))
  content((3.164, -2.62), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[geometric route; no exposed contour crossed]]])], anchor: "south")
  content((5.848, -3.544), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[descent]]])], anchor: "west")
  content((5.848, -4.429), [#text(size: 9pt)[low hit]], anchor: "west", padding: 0.03528cm)
  content((5.65, -5.003), [#text(size: 9pt)[$t tilde.eq b$]], anchor: "north", padding: 0.03528cm)
  content((-6.497, -5.742), [#text(size: 9pt)[The descent stops at its first real walk hit, where the synthetic trace is low.]], anchor: "west", padding: 0cm)
})],
  caption: [Figure 3: The local attachment geometry, schematically and not to scale. In the application to Proposition 49, the box lies near $\( 2 ell \, 0 \)$ in the untouched band $Q_(5 ell) \\ Q_ell$, away from the preliminary separators. Every local branch of the real boundary walk lies in the shallow tolerance band. The high synthetic trace is in $\[ - 1 \, 0 \]$, the remaining trace in $\[ - 3 \, - 2 \]$. Low ambient site circuits enclose the shallow cross-section near $t = plus.minus 2 b \/ 3$. (a) An exposed zero lip attached to the high patch rises to depth $s$; “high side” is a contour-side designation, not a sign assertion for $K \( z \)$. (b) If every such lip stays shallow, the dashed geometric route reaches its first real low-trace site without crossing an exposed contour. Unexposed closed contours remain integrated in the Gibbs law. The exterior is joined only after a real attachment is obtained. ],
) <fig:boundary-attachment>

=== 6.3 From attachments to many-scale boundary arches <from-attachments-to-many-scale-boundary-arches>

The local attachment will be joined to other attachments by paths in the free bulk.
  We establish that second ingredient before iterating the construction across scales.

#thm([Lemma 6.4.])[
  (Nonnegative paths through bulk tubes).  #emph[Consider a bounded face of a connected fixed skeleton,
    with its weighted height law and usable trace at least $- 2$.
    Fix a finite network of tubes in that face with positive widths and clearance from the skeleton.
    Their lengths, widths and clearances are specified by fixed ratios.
    For all sufficiently small meshes, the probability that every requested tube is traversed in its prescribed
    direction by a site path of heights at least zero is bounded below by a positive constant depending only on
    $x$ and the network geometry. The bound is uniform over the shape of the skeleton outside these clearances and
    over its prescribed trace.]
] <boundary:bulk-tubes>

#proof[
  Compare from below with the flat trace $- 2$ on the connected bounding skeleton.
    Realize this flat problem by constant spin pins in the ambient graph.
    In an allocated annulus around a tube ball, ask for at least three nested good first-color circuits with
    alternating signs, using disjoint buffers. The conditional buffer estimates give positive probability.
    Constancy of the other color on the connected skeleton is first imposed as equality.
    Its single component label is fair conditional on the first color and its statuses.
    Prescribing that label therefore leaves the circuit-search probability unchanged.
    Between successive opposite-sign circuits there are enclosing first-color walls,
    so there are at least two enclosing height loops in the allocated annulus. The loops lie wholly in the free bulk.
  Let $E$ be the event that at least two enclosing height loops lie wholly in the allocated annulus.
    This event depends only on the unoriented geometry and contains the alternating-color circuit event,
    so its probability has the same positive lower bound. Condition now only on unoriented geometry in $E$.
    Choose two consecutive enclosing loops in the annulus by a deterministic rule, ordered from outer to inner.
    All loop jumps are independent fair signs under the flat boundary, by Lemma 15.
    The height outside the first chosen loop is $- 2$ plus a symmetric sum of other signs,
    and hence is at least $- 2$ with probability at least $1 \/ 2$.
    Independently, both chosen jumps are positive with probability $1 \/ 4$.
    With probability at least $1 \/ 8$ their inner lip therefore supplies a surrounding site circuit of height at
    least zero. Each loop’s two site lips have constant heights:
    at every trivalent vertex on the loop the third edge is unoccupied,
    joining the same-height sites along each lip. Loops not enclosing the target ball cannot change this lip
    height. A surrounding site circuit can be extracted from its connected site walk.
  The allocated annuli can be chosen so that successive surrounding site circuits must intersect.
    For example take equal inner radii $a$, outer radii $2 a$, and successive center distance $3 a \/ 2$.
    The enclosed inner disks overlap, whereas either inner disk has a portion beyond the other outer disk;
    disjoint surrounding circuits could consequently be neither unnested nor nested.
    After small fixed changes to the radii for lattice rounding, planarity forces an intersection.
    Finite strings of these annuli give the desired tube paths.
    Each surrounding-height-circuit event is increasing, so height association multiplies their lower bounds,
    first in the flat problem and then in the actual problem by height comparison.
    Only finitely many balls are needed for the fixed tube network. ◻
]

#thm([Proposition 6.5.])[
  (Boundary arch estimate).  #emph[There are constants $L > 100$, $c \,
    C > 0$ and a positive slope tolerance such that the following holds.
    Fix $p in partial D$ and a local radius $R$ satisfying that tolerance.
    Suppose the actual prescribed trace on $S_(0 \, delta)$ is at least $-
    1$ everywhere and at least zero in $Q_R \( p \) \\ Q_r \( p \)$. Choose any $N$ positive scales
$ 16 r lt.eq ell_1 \, wide L ell_j lt.eq ell_(j + 1) \, wide ell_N lt.eq R \/ 10 . $

 At all sufficiently small meshes,
#[#set math.equation(numbering: n => "(6.9)")
 $ bb(P) #h(-0.16667em)
   vec(upright("a site circuit in ") hat(cal(O))_0 \( H \) upright(" surrounds ") Q_r \( p \),
   upright("and is contained in ") Q_R \( p \) \\ Q_r \( p \)) gt.eq 1 - C e^(- c N) . $ <boundary:arch-estimate>]

 The constants are independent of $N \, p$ and the prescribed trace;
   the required mesh threshold may depend on the chosen positive scales and the boundary approximation.
   The same assertion holds with all inequalities reversed when the original trace is at most $1$ everywhere and
   at most zero in the clean annulus. All usable sites of the resulting arch have their real height at least zero,
   or at most zero in the reversed assertion.]
] <prop:boundary-arch>

#proof[
  We give the increasing construction. All choices of relative widths below are fixed once and for all,
    depending at most on $x$.
  ===== 6.3.1 Preliminary blocks at level $- 1$. <preliminary-blocks-at-level--1.>
  In block $j$ seek site circuits of level at least $- 1$ in the two strips
  $ Q_(ell_j) \\ Q_(ell_j \/ 2) \, wide Q_(7 ell_j) \\ Q_(5 ell_j) \, $
  with artificial exterior allowed, each surrounding its inner box.
    Use Lemma 45 with high intervals on the two clean boundary subarcs running through #emph[all] these strips.
    Place their transitions before the innermost buffers and beyond the outermost ones,
    in the available clean annulus. Low intervals are used on the remaining skeleton.
    There are only two high arcs, so the number $M$ of transition labels is independent of $N$.
  Before imposing those labels, the slightly narrower buffers in each strip see only favorable first-color pins.
    By Lemma 10 there is $a_1 > 0$ such that, given the earlier complete first-color/status slot records,
    both good plus circuits in the next block occur with conditional probability at least $a_1$.
    All such buffers are disjoint by the choice of $L$. A good circuit meets a high boundary arc,
    since that arc traverses the strip. Its adjacent site path is consequently in the anchored pair ${ - 1 \,
    0 }$. That path has winding number one around the inner box;
    erasing unnecessary pieces gives a simple surrounding site circuit at level at least $- 1$.
  If $I_j$ records the two-circuit success, the conditional estimate implies, for $t > 0$,
  $ bb(E) exp #h(-0.16667em) (- t sum_(j = 1)^N I_j) lt.eq \( 1 - a_1 + a_1 e^(- t) \)^N . $
  Choosing $t$ and then a sufficiently small $a_2 > 0$ gives $bb(P) \( sum I_j < a_2 N \) lt.eq e^(- c_1 N)$.
    Conditioning on the bounded number of transition labels multiplies this failure bound by at most $2^M$.
    Thus with probability at least $1 - C_1 e^(- c_1 N)$ at least $a_2 N$ blocks have both site circuits.
    The event that at least this many blocks succeed is increasing in the heights.
    Height comparison transfers the entire count estimate to the actual law,
    without conditioning successively on synthetic events in that law.
  In each actual successful block select an innermost circuit in the inner strip and an outermost circuit in the
    outer strip. Reveal the unsuccessful strips and every nonretained region.
    By Lemma 46, conditional on this record $cal(R)$, all retained middle components have independent height Gibbs
    laws. Their skeleton is the base skeleton together with the real portions of the two selected circuits.
    Each circuit surrounds a boundary-centered box containing a point a fixed positive distance outside $D$.
    A site circuit lying wholly in the real domain would have its geometric interior in the simply connected
    $D_delta$, so each selected circuit visits the genuine exterior.
    Every maximal real run along it therefore ends at a transition to the exterior;
    its endpoint is a site of the original boundary face layer.
    Thus every connected real portion meets the base skeleton. There can be arbitrarily many such real portions.
    In either local attachment comparison they all meet low base sites,
    since the high patch lies in the untouched middle band. They can therefore be adjoined to the existing low
    parts without creating new parts or new transition labels, exactly as in Lemma 45.
    The resulting prescribed graph is connected. Its usable values are at least $- 1$,
    and in particular at least $- 2$; allowing an extra observed outer rounding layer would give the same latter
    bound. We do not expose any additional layer on the retained side.
    The band $Q_(5 ell_j) \\ Q_(ell_j)$ is untouched, and its original base boundary has height at least zero.
  ===== 6.3.2 Upgrading a retained block. <upgrading-a-retained-block.>
  For clarity suppress the index $j$. Put attachment boxes near the two boundary positions with tangential
    coordinate $plus.minus 2 ell$. Choose $b$ to be a small fixed fraction of $ell$, then $s =
    lambda b$ as in Lemma 47. Use the local reference height of the limiting boundary in each box.
    Both boxes lie in $Q_(5 ell) \\ Q_ell$, away from the preliminary separators.
    Choose the slope tolerance so small that the limiting arc varies by less than $s \/ 20$ within each box.
    At small enough mesh the full base skeleton, including all its repeated branches,
    is in the required $s \/ 10$ band. These are fixed geometric requirements before the mesh limit.
    The attachment lemma gives, uniformly conditional on $cal(R)$, a probability at least $a_0$ at each box.
  Place a horizontal crossbar tube at depth close to $s \/ 2$ in each box,
    with depth width less than $s \/ 10$ and ends beyond its two sides.
    It must meet every successful rise from the base band to depth $s$:
    two primal lattice paths crossing a rectangle in the two different directions share a site.
    Join these crossbars by narrow bulk tubes running upwards near tangential positions $plus.minus 2
    ell$ and across at depth close to $2 ell$. All widths are positive fixed fractions of $s$,
    and all tubes lie in the free part of $Q_(5 ell) \\ Q_ell$.
    Lemma 48 gives a positive lower bound for their simultaneous crossings.
    The two attachments and the bulk crossings are increasing events in the same actual conditional height law.
    Height association therefore gives their intersection probability at least a fixed $a_3 > 0$.
  Join the boundary ends through the clean real boundary sites to the genuine exterior,
    as in the attachment lemma. In that exterior connect them by a path below the arc,
    around the lower side of $Q_ell$, staying in $Q_(5 ell) \\ Q_ell$.
    The upper bulk route and lower exterior route lie in disjoint opposite corridors,
    so their union contains a closed site walk with winding number one around $Q_ell$.
    It contains a simple surrounding open circuit. Only sites outside the original $V_delta$ have been used
    artificially; no real preliminary separator was given artificial height.
    This produces the desired level-zero arch in the block.
  Conditional on $cal(R)$, distinct retained middle problems are independent.
    If at least $a_2 N$ preliminary blocks succeeded, the probability that none upgrades is at most
    $\( 1 - a_3 \)^(a_2 N)$. Adding the preliminary count failure proves (6.9).
    Reflection $H mapsto - H$ proves the reversed assertion. When a resulting arch is later used as a conditioning
    boundary, it is searched for afresh by the height extremal selection of Lemma 46;
    none of the synthetic constructions or auxiliary successes is then conditioned on. ◻
]

=== 6.4 Vanishing brackets and boundary correlations <vanishing-brackets-and-boundary-correlations>

The next estimate removes the mean contribution of the exceptional windows.
  After establishing compactness in Section 7, we will combine it with the ordered bracket coupling to identify
  the limiting brackets with the true field.

#thm([Proposition 6.6.])[
  (Vanishing bracket means).  #emph[Fix a finite regular grid as in Definition 35.
    For every $f in C_c^oo \( D \)$, the upper and lower bracket fields satisfy
#[#set math.equation(numbering: n => "(6.10)")
 $ lim_(epsilon.alt arrow.b 0) med limsup_(delta arrow.b 0)
   lr(|bb(E) H_delta^(plus.minus \, epsilon.alt) \( f \)|) = 0 . $ <boundary:bracket-means>]

]
] <prop:bracket-collapse>

#proof[
  The bracket trace belongs to $\[ - 1 \, 1 \]$ and equals zero away from the finitely many exceptional windows.
    Choose pairwise disjoint fixed outer neighborhoods of their centers, missing $"supp" f$.
    Given $N$, choose $N$ separated positive scales in each neighborhood and then take $epsilon.alt$ sufficiently
    small that its exceptional window lies inside the innermost box.
    Finally take the mesh small with this geometry fixed.
  Condition on the bracket trace. Proposition 49 gives increasing level-zero arches around all windows except with
    probability at most $J C e^(- c N)$, where $J$ is their fixed number.
    Select innermost arches by testing from the exceptional side.
    On simultaneous success every retained component meeting $"supp" f$ has nonnegative usable trace:
    each new real separator site has height at least zero and the old visible base trace is zero.
    By height comparison the conditional mean on each such component is nonnegative,
    and hence so is their sum against a nonnegative $f$. Thus,
    using the unconditional bracket moment bound of Proposition 21,
  $ bb(E) H_delta^(plus.minus \, epsilon.alt) \( f \) gt.eq -
    parallel H_delta^(plus.minus \, epsilon.alt) \( f \) parallel_2 \( J C e^(- c N) \)^(1 \/ 2) gt.eq -
    C_f e^(- c N \/ 2) . $
  The same argument with decreasing arches gives the upper bound.
    In particular no bound conditioned on arch failure is needed.
    The moment constant is uniform over the original traces in $\[ - 1 \, 1 \]$.
    Since $N$ is arbitrary, this proves (6.10) for nonnegative tests.
    Splitting a smooth signed test into a difference of nonnegative smooth compactly supported tests proves the
    general case. ◻
]

#thm([Proposition 6.7.])[
  (Boundary moments with exterior spectators).  #emph[Fix a nonnegative smooth radial bump $rho$,
    supported in the unit disk, with integral one, and fix a sufficiently small $theta > 0$.
    For $z in D$ write $d \( z \) = "dist" \( z \, partial D \)$ and
$ rho_z \( u \) = \( theta d \( z \) \)^(- 2) rho #h(-0.16667em) (frac(u - z, theta d \( z \))) \, wide Y_z =
  H \( rho_z \) \, $

 where $H$ is any subsequential distributional and moment limit of the true fields. For every $1 lt.eq p < oo$,
#[#set math.equation(numbering: n => "(6.11)")
 $ sup_(z in D) parallel Y_z parallel_p lt.eq C_(p \, theta \, D \, rho) . $ <boundary:uniform-depth-moments>]

 In particular this bound is uniform when $z$ approaches any point of a fixed compact boundary arc.]
  #emph[Let $p_0 in partial D$ and let $F$ be a product of a fixed number of smooth averages supported a positive
    distance from $p_0$. The averages may be fixed in the interior,
    or may be of the same comparable-depth form with centers approaching fixed boundary points distinct from
    $p_0$. Then, jointly in those allowed approaches,
#[#set math.equation(numbering: n => "(6.12)")
 $ bb(E) \[ Y_z F \] arrow.r 0 wide \( z arrow.r p_0 \) . $ <boundary:spectator-vanishing>]

 The same statement holds for finite linear combinations of these products.]
  #emph[If $p_1 \, dots.h \, p_m$ are distinct fixed boundary points and $z_i arrow.r p_i$,
    then the reference average $Z_m = m^(- 1) sum_(i = 1)^m Y_(z_i)$ satisfies
#[#set math.equation(numbering: n => "(6.13)")
 $ limsup_(z_i arrow.r p_i) parallel Z_m parallel_2 lt.eq C m^(- 1 \/ 2) \, wide
   sup_m sup_(z_1 \, dots.h \, z_m) parallel Z_m parallel_p lt.eq C_p . $ <boundary:reference-average>]

 In the first assertion $m$ and its distinct boundary points are fixed before taking the depth limits.
   Subsequently $m arrow.r oo$ makes these references tend to zero in every finite $L^p$.]
] <prop:boundary-moments>

#proof[
  At mesh $delta$ put $Y_(z \, delta) = h_delta \( rho_z \)$,
    and denote the corresponding lattice spectator product by $F_delta$.
    At a fixed $z$, the distance from its lattice representative to the prescribed skeleton tends to $d \( z \)$.
    The exact face-area weights of $rho_z$ have total mass one,
    are supported in a ball of radius $theta d \( z \) + O \( delta \)$,
    and are bounded by a constant times $\( delta \/ d \( z \) \)^2$.
    The ratio between boundary distance and smearing radius is thus bounded above and below independently of $z$
    once the mesh is taken sufficiently small for that fixed placement.
    Proposition 21, with original trace zero, gives (6.11). The passage to the limit uses the higher moments from
    the same proposition. Compactness of the smooth boundary makes its constants uniform over boundary points;
    no estimate uniform in the approximation error divided by a moving depth is asserted before taking the mesh limit.
  Choose a small fixed outer neighborhood of $p_0$ missing all the spectator supports;
    for approaching spectators this is possible uniformly once their limiting distinct points have been fixed.
    Given $N$, choose $N$ fixed separated scales inside this neighborhood.
    For all sufficiently close $z$ the support of $rho_z$ is in the inner box of this stack.
    Apply Proposition 49 to the true zero boundary. Select an outermost increasing arch by testing from outside
    and reveal its exterior and real trace. The spectator product $F_delta$, including its absolute height values,
    is measurable in that exterior record. On success, the retained region containing the testing ball has
    nonnegative usable trace, and hence nonnegative conditional mean for its unit nonnegative average.
    For any nonnegative exterior-measurable factor $U$ it follows that
  $ bb(E) \[ Y_(z \, delta) U \] gt.eq - bb(E) #scale(x: 120%, y: 120%)[\[] \| Y_(z \, delta) \| U
    upright(bold(1))_({ upright("increasing search fails") }) #scale(x: 120%, y: 120%)[\]] . $
  The separate decreasing search gives the corresponding upper bound.
    These searches reveal only their tested sides; they do not condition on the intermediate constructions in the
    arch proof.
  Apply the two bounds to $U = \( F_delta \)_(+)$ and $U = \( F_delta \)_(-)$,
    the positive and negative parts of the whole spectator product.
    If $F$ has $k$ factors, Hölder’s inequality and the unconditional $2 \( k + 1 \)$-moment bounds give
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \| Y_(z \, delta) F_delta \|
    upright(bold(1))_({ upright("a search fails") }) #scale(x: 120%, y: 120%)[\]] lt.eq
    parallel Y_(z \, delta) F_delta parallel_2 thin bb(P) \( upright("a search fails") \)^(1 \/ 2) lt.eq
    C_F e^(- c N \/ 2) . $
  The constants remain bounded for comparable-depth spectators at the other fixed boundary points, by (6.11).
    In particular the estimate uses moments in the original zero-boundary law,
    not moments under a failure event or a random high trace.
    First take the mesh limit at fixed positions and scales. Then take the indicated approaches to the distinct
    boundary points. The resulting limsup is at most $C_F e^(- c N \/ 2)$. Since $N$ was arbitrary, this proves (6.12).
  Finally, (6.11) bounds the diagonal terms in $bb(E) Z_m^2$ by $C \/ m$.
    Each of the finitely many off-diagonal terms vanishes as the depths tend to zero,
    by (6.12) with one spectator. This proves the first assertion of (6.13).
    Minkowski’s inequality gives its uniform $L^p$ bounds independently of $m$.
    Interpolation between $L^2$ and any larger finite moment then proves the final claim; for $p lt.eq
    2$ use monotonicity of $L^p$ norms. These are absolute-height references, with no lift constant left unspecified. ◻
]

== 7 Identification of the limiting field <sec:limit>

Fix $x$ throughout, and let $v in \( 0 \, oo \)$ be the domain-independent constant in Proposition 24.
  We identify every subsequential limit of the actual zero-boundary fields.
  The steps below also establish tightness and justify passage of all moments;
  no assertion of Gaussianity is used before the last step.

=== 7.1 Compactness, moments, and the insertion identity <compactness-moments-and-the-insertion-identity>

We write $h_delta \( f \) = integral_D h_delta \( z \) f \( z \) thin upright(d) z$.
  This is the exact face-area pairing from the introduction, including for signed tests.
  In particular $integral f = 0$ means that its discrete weights sum to exactly zero,
  so adding a constant to a height lift has no effect.

#thm([Proposition 7.1.])[
  (Tightness and moment convergence).  #emph[For every $t > 1$,
    the true fields are tight in $H_(upright("loc"))^(- t) \( D \)$.
    The same holds for the upper and lower brackets, uniformly in their exceptional windows.
    Every fixed finite collection of test pairings has uniformly bounded moments of every order.
    Along a distributional law limit, all its mixed moments converge.
    These assertions hold also for finite joint couplings of the indicated fields.]
] <prop:tightness>

#proof[
  A consequence of Proposition 21, using a finite cover of a compact set by interior disks, is
  #[#set math.equation(numbering: n => "(7.1)")
   $ sup_delta parallel h_delta \( f \) parallel_(L^p) lt.eq C_(K \, p) parallel f parallel_oo \, wide
     "supp" f subset K subset.double D \, quad 1 lt.eq p < oo . $ <eq:limit-fixed-moments>]
  Indeed, split the face weights by a smooth partition of unity subordinate to that cover.
    Each resulting weight family has bounded total variation and the required maximum weight on its fixed disk;
    apply the smearing estimate and the triangle inequality. The argument applies to the brackets after
    conditioning on their traces, whose values lie between $- 1$ and $1$.
    Its constants thus do not depend on the windows. Complex tests are handled by their real and imaginary parts.
  Here is the compactness argument in detail. Place $D$ in a square torus and fix $chi in C_c^oo \( D \)$.
    For its Fourier basis $e_k$, $k in bb(Z)^2$, let $a_(delta \, k) = h_delta \( chi overline(e_k) \)$.
    Since the moduli of the basis functions are constant, (7.1) bounds $parallel a_(delta \, k)
    parallel_(L^p)$ independently of $k$. For $s > 1$ and $p gt.eq 2$, Minkowski’s inequality gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ parallel parallel chi h_delta parallel_(H^(- s))^2 #scale(x: 120%, y: 120%)[parallel]_(L^(p \/ 2)) & lt.eq
     sum_(k in bb(Z)^2) \( 1 + \| k \|^2 \)^(- s) parallel a_(delta \, k) parallel_(L^p)^2 lt.eq
     C_(chi \, p \, s) . $ <eq:limit-sobolev-moments>]
  The bounds for smaller $p$ follow by monotonicity of $L^p$ norms. Choose $1 < s < t$.
    A bounded $H^(- s)$ ball is relatively compact in $H^(- t)$:
    its Fourier tail beyond frequency $M$ has squared $H^(- t)$ norm at most $\( 1 + M^2 \)^(- \( t - s \))$ times
    its squared $H^(- s)$ norm, and its first finitely many coordinates lie in a bounded finite-dimensional set.
    Markov’s inequality and (7.2) therefore give tightness of $chi h_delta$ in $H^(- t)$.
  Choose nested interior compacts exhausting $D$, and smooth cutoffs equal to one on successive compacts.
    For any prescribed error probability, choose a compact set for the $n$-th cutoff with error at most that
    probability times $2^(- n)$. The simultaneous localizations then lie in a relatively compact set for the local
    $H^(- t)$ topology. This proves the stated local tightness.
    Equivalently, this topology is the compatible subspace of a countable product of the localized Sobolev spaces,
    with its usual metrizable topology. The same argument and a union bound treat finite joint couplings.
  For fixed $f_1 \, dots.h \, f_k$, a monomial $product_i h_delta \( f_i \)^(a_i)$ has uniformly bounded
    $L^(1 + epsilon.alt)$ norm, for instance with $epsilon.alt = 1$,
    by (7.1) and Hölder’s inequality at sufficiently high orders.
    Its uniform integrability, joint convergence of the pairings,
    and truncation prove convergence of that mixed moment. The same argument gives moment convergence with bounded
    continuous functions of finitely many pairings. In particular all the preceding moment bounds pass to every limit. ◻
]

A second consequence of the smearing estimate, which we will use at collisions, is the following.
  If $f_(z \, r) \( w \) = r^(- 2) f \( \( w - z \) \/ r \)$,
  where $f$ ranges over a fixed bounded family of smooth functions supported in a fixed disk,
  then on an interior compact, for sufficiently small $r$,

#[#set math.equation(numbering: n => "(7.3)")
 $ parallel h_delta \( f_(z \, r) \) parallel_(L^p) lt.eq C_(p \, f) #scale(x: 120%, y: 120%)[\(] 1 +
   log \( 1 \/ r \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <eq:limit-small-moments>]

It suffices here and below to take the mesh sufficiently small at each fixed $r$.
  Proposition 21 gives this bound since the distance to the boundary is bounded below and the smearing radius is
  $r$. It passes to limits by Proposition 52. For plane fields and zero-total $f$,
  Proposition 22 instead gives a bound independent of $r$.

Fix henceforth any subsequence on which the true fields converge, and denote its limit by $H$.
  Height reflection and moment convergence imply $bb(E) H \( f \) = 0$.

#thm([Lemma 7.2.])[
  (Transfer to the chosen field).  #emph[The field $H$ satisfies the limiting insertion identity of Proposition 44
    in every disk arrangement allowed there:
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E) [H \( Delta phi \) product_(ell = 1)^k H \( g_ell \)] = 0 \, wide integral g_ell = 0 \, $ <eq:limit-insertion>]

 where each $g_ell$ is supported in its indicated spectator disk.
   The same assertion first holds with each spectator replaced by a bounded continuous function of finitely many
   zero-total tests in that disk.]
] <limit:transfer>

#proof[
  Fix a finite grid of regular horizontal levels and positive exceptional windows sufficiently small for the given
    arrangement. We pass first to the mesh limit and then to the window limit,
    keeping the chosen true-field marginal throughout.
  Couple its lower and upper brackets with the true field in order, as in Lemma 36.
    First take a joint law limit along the chosen subsequence, with the windows fixed.
    Next shrink the windows and take a further joint limit. Proposition 52 applies uniformly throughout,
    so these extractions are possible and the middle marginal is always the already chosen law of $H$.
    Distributional order passes to the limits because evaluation against each nonnegative smooth test is
    continuous. Write the resulting ordered triple as
  $ H^(-) lt.eq H lt.eq H^(+) . $
  Proposition 50 and moment convergence give $bb(E) H^(-) \( f \) = bb(E) H^(+) \( f \) = 0$,
    as well as $bb(E) H \( f \) = 0$. For every nonnegative smooth $f$,
    both nonnegative random variables $H^(+) \( f \) - H \( f \)$ and $H \( f \) -
    H^(-) \( f \)$ thus have expectation zero. Apply this to a countable dense family of nonnegative tests on an
    exhaustion of $D$. Continuity of distributions then shows $H^(-) = H = H^(+)$ almost surely as distributions.
  At fixed windows, Proposition 44 gives the insertion identity for bounded local increment factors.
    For bounded continuous functions of zero-total pairings it passes to the first law limit by uniform
    integrability of $H \( Delta phi \)$, and then to the window limit by the same argument.
    The collapsed marginal is the chosen $H$, so this proves that identity for $H$.
    Repeat for any desired finite grid; no change to the chosen marginal is involved.
    Finally truncate each $H \( g_ell \)$ by a bounded continuous truncation.
    Hölder’s inequality and moments of orders larger than the number of factors show that the expectation of the
    truncation error tends to zero. This proves (7.4). ◻
]

=== 7.2 Boundary references and harmonic moment distributions <boundary-references-and-harmonic-moment-distributions>

The insertion identity currently permits only zero-total spectator tests.
  To obtain harmonicity of the full moment distributions, we must allow arbitrary tests,
  including averages of absolute heights. We construct reference averages that vanish near the boundary;
  subtracting such a reference expresses each spectator as a finite sum of local zero-total observations.

Fix a nonnegative smooth radial bump $rho$ of integral one, supported in the unit disk.
  All unit radial averages below are translations and dilations of this bump.

#thm([Lemma 7.3.])[
  (Vanishing references).  #emph[There are finite averages $R_m$ of unit radial pairings of $H$,
    supported arbitrarily near the boundary, such that
$ parallel R_m parallel_(L^p) arrow.r 0 quad upright("for every ") p < oo . $

 Each $R_m$ uses finitely many distinct boundary points, with depth chosen after those points are fixed.
   Its constituent disks can be required to have any prescribed small positive maximum diameter.]
] <limit:references>

#proof[
  Choose distinct points $p_1 \, dots.h \, p_m$ on a fixed boundary arc.
    For small $a > 0$, put the centers a distance $a$ along their inward normals and use bumps $psi_(ell \, a)$ of
    radius $theta a$, where $0 < theta < 1 \/ 4$ is fixed. The tubular neighborhood theorem for a $C^2$ Jordan
    curve gives distance exactly $a$ to the boundary for these centers when $a$ is sufficiently small. Define
  $ Y_(ell \, a) = H \( psi_(ell \, a) \) \, wide R_(m \, a) = 1 / m sum_(ell = 1)^m Y_(ell \, a) . $
  The comparable-depth moment bound in Proposition 51 is uniform along this fixed arc.
    Minkowski’s inequality therefore gives $sup_(m \, a) parallel R_(m \, a) parallel_(L^q) lt.eq
    C_q$ for each finite $q$, after restricting to the corresponding sufficiently small depths.
    For fixed $m$, the same proposition gives $bb(E) \[ Y_(ell \, a) Y_(k \, a) \] arrow.r 0$ when $ell eq.not k$.
    Consequently
  #[#set math.equation(numbering: n => "(7.5)")
   $ limsup_(a arrow.b 0) parallel R_(m \, a) parallel_(L^2)^2 lt.eq C_2^2 / m . $ <eq:limit-reference-second>]
  For each $m$, choose a positive depth $a_m$ small enough that this squared norm is at most $\( C_2^2 + 1 \) \/
    m$ and all disk diameters meet the prescribed bound. Then $R_m = R_(m \, a_m)$ tends to zero in $L^2$.
    For $p > 2$, interpolate this convergence with the uniform $L^q$ bound for any $q > p$; for $p lt.eq 2$,
    use monotonicity. This proves the assertion. The order in (7.5) is depth first at fixed $m$, then $m arrow.r oo$. ◻
]

For $j gt.eq 1$, define the moment distribution $T_j = bb(E) H^(⊗ j)$ on $D^j$, and set $T_0 = 1$.
  This definition is legitimate for general smooth tests on the product, not just tensor tests.
  For example, after localizing in a square torus, expand a product-space test in its Fourier series.
  Its coefficients decay faster than any power, while Hölder’s inequality and (7.1) bound the expected absolute
  product of any $j$ Fourier coefficients uniformly. The resulting series is absolutely convergent and defines a
  continuous distribution. For tensor tests it gives precisely

$ T_j \( f_1 ⊗ dots.h.c ⊗ f_j \) = bb(E) product_(i = 1)^j H \( f_i \) . $

This construction agrees with taking the expectation of the tensor power of the random distribution by (7.2).

For $j gt.eq 2$, we will determine $T_j$ from $T_(j - 2)$ by its behavior in one variable.
  The next steps establish harmonicity away from coincident points,
  rule out additional distributions supported at coincidences,
  and identify each logarithmic collision coefficient. Together with the zero boundary value,
  these properties will give the Gaussian moment recursion by subtraction of Dirichlet Green functions.

#thm([Proposition 7.4.])[
  (Harmonic moments).  #emph[Let
$ cal(C)_j = { \( z_1 \, dots.h \, z_j \) in D^j : z_i eq.not z_k upright(" for ") i eq.not k } . $

 On $cal(C)_j$, $T_j$ is a smooth function and is harmonic in each variable separately.]
] <prop:harmonic-moments>

#proof[
  We prove the first-variable distributional Laplace identity in a small product neighborhood of any distinct
    tuple; symmetry then gives all the identities. Translate the first center to the origin.
    Choose $R > 0$ so that $B \( 0 \, 4 R \) subset.double D$ and all the other centers lie outside
    $overline(B \( 0 \, 4 R \))$. Choose $0 < b < R \/ 1000$ and $0 < eta < R \/ \( 1000 j \)$.
    Fix the finite regular grid supplied by Lemma 41 for $z_0 = 0$, $rho = R$, and $q = j - 1$.
    Its choice is independent of the small spectator disks and chains constructed below.
    Take $phi$ supported in $B \( 0 \, b \)$, and take each spectator test $f_i$, $2 lt.eq i lt.eq j$,
    in a sufficiently small neighborhood of its center, of diameter less than $eta \/ 4$. We will show
  #[#set math.equation(numbering: n => "(7.6)")
   $ bb(E) [H \( Delta phi \) product_(i = 2)^j H \( f_i \)] = 0 . $ <eq:limit-harmonic-tensor>]
  For $j = 1$ this follows from the zero mean; suppose $j gt.eq 2$.
  Write $c_i = integral f_i$, and choose a unit bump $rho_i$ in that spectator neighborhood.
    Take a reference $R_(m \, a)$ from the preceding lemma, at a fixed positive depth small enough that all its
    disks have diameter less than $eta \/ 4$ and lie outside $overline(B \( 0 \, 4 R \))$.
    This is possible because that closed ball is a compact subset of $D$,
    whereas the reference disks can be placed arbitrarily near the boundary.
    Every center can be joined to each reference center by a finite path in $D \\ overline(B \( 0 \, R \))$.
    To verify this last geometric point, start with a polygonal path in the connected open set $D$.
    Whenever it enters the protected disk, replace that portion by an arc in
    $B \( 0 \, 2 R \) \\ overline(B \( 0 \, R \))$; this annulus lies in $D$.
    A small perturbation and a finite subdivision give a path with compact image and positive clearance from both
    the protected disk and the boundary.
  Along each such path choose a finite chain of smooth unit bumps,
    beginning with $rho_i$ and ending with $psi_(ell \, a)$. Make the step lengths and bump radii so small that
    the union of two consecutive supports is contained in a disk of radius less than $eta$,
    disjoint from $overline(B \( 0 \, R \))$. If necessary interpolate their radii in finitely many steps near the
    endpoints. Telescoping yields
  $ H \( f_i \) - c_i H \( psi_(ell \, a) \) = H \( f_i - c_i rho_i \) +
    c_i sum_(upright("chain")) H \( rho_(upright("old")) - rho_(upright("new")) \) . $
  Every summand on the right is a zero-total test in one of these small disks.
    Averaging this equality over $ell$ expresses $H \( f_i \) -
    c_i R_(m \, a)$ as a finite linear combination of such observations.
  Expand the product of these $j - 1$ finite sums. Each monomial selects at most $j - 1$ spectator disks,
    whatever the number or length of the chains. The insertion support lies in $B \( 0 \, R \/ 1000 \)$,
    and every selected disk is outside $B \( 0 \, R \)$ with radius less than $R \/ \( 1000 j \)$.
    These are precisely the hypotheses for the grid already fixed from Lemma 41.
    For each monomial its two selected levels give the oblique separation of the middle-strip boundary pieces and
    spectators needed by Proposition 44. The pair of levels may depend on the monomial; the grid does not.
  There are only finitely many monomials. Choose the exceptional windows small enough to preserve all their
    positive margins. Lemma 53 gives zero expectation for each monomial with the insertion.
    Summing these exact identities gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ bb(E)
     [H \( Delta phi \) product_(i = 2)^j #scale(x: 120%, y: 120%)[\(] H \( f_i \) - c_i R_(m \, a)
     #scale(x: 120%, y: 120%)[\)]] = 0 . $ <eq:limit-subtracted-references>]
  All disks, chains, tests and grid levels used to obtain this equality are finite and fixed before using the
    limiting insertion identity.
  It remains to remove the reference. This error is estimated before the chain expansion.
    The algebraic difference between the product in (7.7) and $product_i H \( f_i \)$ is a sum of $j - 1$ terms,
    each containing one factor $c_i R_(m \, a)$ and other factors of the form $H \( f_k \)$ or $H \( f_k \) -
    c_k R_(m \, a)$. Hölder’s inequality and the uniform moment bounds give, for some finite $p$ depending only on $j$,
  $
    lr(|bb(E) H \( Delta phi \) {product_(i = 2)^j H \( f_i \) - product_(i = 2)^j \( H \( f_i \) - c_i R_(m \,
    a) \)}|) lt.eq C parallel R_(m \, a) parallel_(L^p) . $
  The constant does not count chain terms. Choose depths and then $m$ as in Lemma 54;
    the right side tends to zero. This proves (7.6).
  Finite sums of tensor tests are dense in the test-function space on each such product neighborhood,
    for example by a localized Fourier expansion with convergence of every derivative.
    Consequently $Delta_(z_1) T_j = 0$ there as a distribution. Symmetry gives all $j$ separate Laplace equations.
    Their sum is the ordinary elliptic Laplacian on $bb(R)^(2 j)$;
    the local regularity theorem for harmonic distributions makes $T_j$ smooth there.
    The separate distributional equations then hold pointwise. ◻
]

#thm([Lemma 7.5.])[
  (No distributions supported on collisions).  #emph[On every compact subset of $D^j$,
    the off-diagonal function from Proposition 55 is locally integrable and represents all of $T_j$.
    For $j gt.eq 2$, if $d \( upright(bold(z)) \) = min_(i < k) \| z_i - z_k \|$, then, locally away from the boundary,
#[#set math.equation(numbering: n => "(7.8)")
 $ \| T_j \( upright(bold(z)) \) \| lt.eq C #scale(x: 120%, y: 120%)[\(] 1 +
   log_(+) \( 1 \/ d \( upright(bold(z)) \) \) #scale(x: 120%, y: 120%)[\)]^(j \/ 2) \, wide
   upright(bold(z)) in cal(C)_j . $ <eq:limit-log-bound>]

 Moreover, for distinct fixed $z_2 \, dots.h \, z_j in D$,
#[#set math.equation(numbering: n => "(7.9)")
 $ T_j \( z_1 \, z_2 \, dots.h \, z_j \) arrow.r 0 quad upright("as ") z_1 arrow.r
   p in partial D . $ <eq:limit-zero-boundary>]

]
] <lem:no-diagonal>

#proof[
  Let $T_(j \, h)$ be the convolution of $T_j$ with a product of $j$ radial unit bumps of common radius $h$,
    considered on a fixed interior compact and with $h$ small enough to remain in $D$. By Hölder’s inequality and (7.3),
  #[#set math.equation(numbering: n => "(7.10)")
   $ \| T_(j \, h) \( upright(bold(z)) \) \| = lr(|bb(E) product_(i = 1)^j H \( rho_(z_i \, h) \)|) lt.eq
     C \( 1 + log \( 1 \/ h \) \)^(j \/ 2) \, $ <eq:limit-mollifier-bound>]
  including at coincident centers. Whenever $d \( upright(bold(z)) \) > 2 h$,
    the product of bump supports is off the diagonals. The radial mean value property,
    successively in each harmonic variable, gives $T_(j \, h) \( upright(bold(z)) \) =
    T_j \( upright(bold(z)) \)$. Taking $h$ to be the smaller of $d \( upright(bold(z)) \) \/
    4$ and a fixed interior radius proves (7.8).
  For completeness, a collision tube
  $ A_h = { upright(bold(z)) : d \( upright(bold(z)) \) lt.eq 2 h } $
  in a fixed compact set has volume at most $C_j h^2$: use the union bound over pairs,
    fix all but one point in a selected pair, and integrate that point over a disk of radius $2 h$.
    The same bound at every radius $s$, followed by integration of the distribution function, gives for $q gt.eq 0$
  $ integral_(A_h) #scale(x: 120%, y: 120%)[\(] 1 + log_(+) \( 1 \/ d \( upright(bold(z)) \) \)
    #scale(x: 120%, y: 120%)[\)]^q thin upright(d) upright(bold(z)) lt.eq C_q h^2 \( 1 + log \( 1 \/ h \) \)^q . $
  Indeed for $q > 0$, integrate $q \( 1 + log \( 1 \/ s \) \)^(q - 1) thin upright(d) s \/ s$ against the bound $C
    s^2$; the endpoint term is $C h^2 \( 1 + log \( 1 \/ h \) \)^q$. This proves local integrability.
    It also shows that the off-diagonal function has vanishing $L^1$ mass on $A_h$.
    Equation (7.10) gives the same assertion for $T_(j \, h)$,
    since $h^2 \( 1 + log \( 1 \/ h \) \)^(j \/ 2) arrow.r 0$. Off $A_h$ the two functions agree exactly.
    Thus $T_(j \, h)$ converges locally in $L^1$ to the off-diagonal function.
    But convolution also converges to $T_j$ in distributions. These limits are equal.
    In particular neither a delta distribution nor any of its derivatives on a collision diagonal can be present.
    The case $j = 1$ has no collision set and follows directly from harmonicity.
  To prove (7.9), choose disjoint small fixed radial averaging disks around $z_2 \, dots.h \, z_j$.
    For $z_1$ near $p$, choose its averaging radius to be $theta "dist" \( z_1 \, partial D \)$.
    The supports are pairwise separated. The harmonic mean value property in every variable identifies the
    displayed pointwise value with
  $ bb(E) [H \( rho_(z_1 \, theta "dist" \( z_1 \, partial D \)) \) product_(i = 2)^j H \( rho_(z_i \, s_i) \)] . $
  Proposition 51 makes this tend to zero. For $j = 1$ the same conclusion also follows from the zero mean. ◻
]

=== 7.3 The logarithmic collision coefficient <the-logarithmic-collision-coefficient>

#thm([Lemma 7.6.])[
  (Punctured harmonic expansion).  #emph[Let $j gt.eq 2$. Fix a collision point $y in
    D$ and distinct spectators $upright(bold(z)) = \( z_3 \, dots.h \, z_j \)$, all separated from $y$.
    For $x$ in a sufficiently small punctured disk about $y$,
#[#set math.equation(numbering: n => "(7.11)")
 $ T_j \( x \, y \, upright(bold(z)) \) = L \( y \, upright(bold(z)) \) log \( 1 \/ \| x - y \| \) +
   R \( x \; y \, upright(bold(z)) \) \, $ <eq:limit-puncture>]

 where $R$ extends harmonically across $x = y$. The coefficient $L$ is smooth in the separated parameters
   $\( y \, upright(bold(z)) \)$, and the first-variable derivatives of $R$ are bounded uniformly on smaller disks
   and compact sets of these parameters. The coefficient $L$ is separately harmonic in each spectator variable.]
] <limit:puncture>

#proof[
  For fixed parameters, the angular Fourier coefficients of a harmonic function in a punctured disk have the forms
    $a_0 + b_0 log r$ and $a_n r^n + b_n r^(- n)$, $n gt.eq 1$, for the sine and cosine modes.
    Equation (7.8) bounds the function by a power of $1 + log \( 1 \/ r \)$.
    Multiplying its $n$-th Fourier coefficient by $r^n$ and sending $r arrow.b 0$ therefore shows $b_n =
    0$ for every $n gt.eq 1$. After subtracting the logarithmic term,
    the remaining nonnegative modes are the harmonic extension of their values on any fixed smaller circle,
    and hence extend across the center.
  On a circle of radius $s > 0$ enclosing no other spectator, the coefficient is the flux
  #[#set math.equation(numbering: n => "(7.12)")
   $ L \( y \, upright(bold(z)) \) = - frac(1, 2 pi) integral_(\| x - y \| = s) partial_(n_x)
     T_j \( x \, y \, upright(bold(z)) \) thin upright(d) ell \( x \) . $ <eq:limit-flux>]
  One can keep $s$ fixed on a neighborhood of any separated parameter tuple.
    Parameterizing $x = y + s e^(i theta)$, the integrand is smooth by Proposition 55; thus $L$ is smooth.
    Applying a spectator Laplacian under this integral also proves its separate harmonicity.
    Subtract $L log \( 1 \/ \| x - y \| \)$ on that circle. Its values are smooth and uniformly bounded on compact
    parameter sets. The Poisson formula for their harmonic extension, differentiated in $x$ on a smaller disk,
    yields the claimed uniform derivative bounds for $R$. ◻
]

#thm([Proposition 7.7.])[
  (Collision coefficient).  #emph[In (7.11),
#[#set math.equation(numbering: n => "(7.13)")
 $ L \( y \, upright(bold(z)) \) = frac(v, 2 pi) T_(j - 2) \( upright(bold(z)) \) . $ <eq:limit-collision>]

 The convention $T_0 = 1$ applies when $j = 2$.]
] <prop:collision>

#proof[
  Choose two real smooth signed tests $alpha \, beta$ with zero integral, supported in disjoint disks, such that
  $ I = integral.double alpha \( u \) log \( 1 \/ \| u - w \| \) beta \( w \) thin upright(d) u thin upright(d) w
    eq.not 0 . $
  Such tests can be obtained by taking horizontal derivatives of unit mollifiers concentrated about two distinct
    points on a horizontal line. As their radii tend to zero,
    integration by parts makes the displayed integral tend to the mixed horizontal derivative of the logarithmic
    kernel at these two points, which is nonzero. Fix one such pair. For a fixed point $y_0$, define
  $ alpha_r \( x \) = r^(- 2) alpha \( \( x - y_0 \) \/ r \) \, wide beta_r \( x \) =
    r^(- 2) beta \( \( x - y_0 \) \/ r \) . $
  Let $F = product_(i = 3)^j H \( rho_(z_i \, s_i) \)$, where the spectator disks are fixed, small,
    pairwise disjoint and separated from a fixed closed disk $overline(B \( y_0 \, R_0 \)) subset.double D$.
    An empty product is one. We first prove
  #[#set math.equation(numbering: n => "(7.14)")
   $ lim_(r arrow.b 0) bb(E) \[ H \( alpha_r \) H \( beta_r \) F \] =
     frac(v, 2 pi) I thin T_(j - 2) \( upright(bold(z)) \) . $ <eq:limit-plane-factorization>]
  We will evaluate this limit in two ways. A plane copy independent of the spectators gives the right side of
    (7.14); the punctured harmonic expansion will give $I L \( y_0 \, upright(bold(z)) \)$.
    Their equality determines $L$. For the first evaluation, the plane copy must be independent of the exterior
    record that determines the absolute spectator heights.
  Fix $r > 0$ small enough that both inner supports lie in $B \( y_0 \, C r \)$ and $sqrt(r) < R_0 \/ 4$,
    and return to the finite mesh along the subsequence defining $H$.
    Use the ambient pair representation of the true law, with both colors plus on the connected boundary skeleton
    and height anchored to zero at one of its sites. As in Lemma 33, this gives the required interior height law.
    Retain the complementary-spin boundary constraint first as edge equalities on this connected set.
    Conditional on the first spins and cell statuses, prescribing its single plus component label has probability
    exactly $1 \/ 2$. It therefore creates no additional bias in a first-color circuit search.
  Search from outside for a good first-color circuit in separated annular slots between scales $sqrt(r)$ and
    $R_0 \/ 2$. Lemma 10 gives failure probability at most $C r^(kappa_1)$ in the mesh-first limsup,
    for some $kappa_1 > 0$. The exploration always queries a cell status together with all its first-color sites,
    using the stopped kernels of Proposition 11. Let $cal(G)_delta$ contain the stopped query record (including
    its success or failure outcome), the selected cut and its first-color data when it exists,
    and the genuinely exterior pair data needed below. Do not reveal complementary-spin values at strictly inside
    boundary-layer sites merely because their first-color values were queried.
  We verify both the measurability and the conditional law at this stage.
    Each spectator disk can be joined to the zero-height anchor by paths outside $B \( y_0 \, R_0 \)$.
    One may choose paths in the ambient triangulation, outside the search disk, to the anchored skeleton.
    Their sums of the local increments from Lemma 3 give the absolute spectator heights,
    with the correct common lift fixed at the anchor. Alternatively,
    portions of paths in $D \\ overline(B \( y_0 \, R_0 \))$ can detour around the interior disk and then reach
    the boundary layer; their fixed compact portions occur in every sufficiently fine approximation.
    The ambient construction requires no microscopic regularity of that last approach to the skeleton.
    Include all these exterior paths and the pair data on the spectator disks in $cal(G)_delta$.
    Thus the entire discrete spectator product $F_delta$ is $cal(G)_delta$-measurable,
    as an absolute-height observation, not merely a spin observation.
  Every crossing cell of the selected contour is open with prescribed first color.
    Its factor is constant and leaves the complementary spin unrestricted.
    No imposed equality edge crosses the contour. By Lemma 4,
    closed-cell complementary components on its two sides are disconnected.
    Hence revealing exterior labels reveals no strictly interior component label.
    The stopped query convention likewise fixes no further strictly interior first-color variables.
    Conditional on $cal(G)_delta$, the unexamined interior is exactly the open-cut law with no inner pins or
    equalities. Its height lift may have an exterior-dependent additive constant;
    both local tests have exactly zero total and discard that constant.
  The cut surrounds a ball of radius comparable to $sqrt(r)$.
    The retained-law and exterior-measurability verifications above allow us to apply Corollary 12.
    It couples the increments in $B \( y_0 \, C r \)$, with its connecting paths,
    to the fixed plane increment marginal $nu_delta$ with error $C \( r \/ sqrt(r) \)^(kappa_2)$,
    uniformly in each successful exterior record. For every such record choose a coupling kernel whose second
    marginal is this same $nu_delta$. On failed searches choose an independent variable with marginal $nu_delta$.
    These are ordinary conditional couplings on finite discrete spaces;
    the finite ambient volume may subsequently be exhausted using the same local comparison.
    In particular the resulting plane variable $P_delta$ satisfies
  $ bb(P) \( P_delta in A divides cal(G)_delta \) = nu_delta \( A \) $
  for every measurable event $A$, also on failure. This identity proves genuine independence of $P_delta$ from
    $cal(G)_delta$, and therefore from $F_delta$. It is stronger than specifying just its unconditional marginal.
  Write $U_delta = h_delta \( alpha_r \)$, $V_delta = h_delta \( beta_r \)$, and let $U'_delta \,
    V'_delta$ be the corresponding statistics of this plane copy.
    Matching increments in a connected disk implies equality of both statistics because their area weights have
    exact total zero. If $E_delta$ is the union of search failure and coupling mismatch, then for some $kappa > 0$
  $ limsup_(delta arrow.b 0) bb(P) \( E_delta \) lt.eq C r^kappa . $
  Cauchy–Schwarz and equality off $E_delta$ give
  #[#set math.equation(numbering: n => "(7.15)")
   $ & lr(|bb(E) \[ \( U_delta V_delta - U'_delta V'_delta \) F_delta \]|)\
 & quad lt.eq
   bb(P) \( E_delta \)^(1 \/ 2)
   (parallel U_delta V_delta F_delta parallel_(L^2) + parallel U'_delta V'_delta F_delta parallel_(L^2)) .
   $ <eq:limit-coupling-error>]
  Applying Hölder inside each norm at an order at least $2 j$,
    (7.3) bounds the first norm by $C \( 1 + log \( 1 \/ r \) \)$. All fixed spectator norms are bounded.
    The plane zero-total moment bound in Proposition 22 bounds the second norm uniformly.
    Thus the mesh limsup of (7.15) is at most
  $ C r^(kappa \/ 2) \( 1 + log \( 1 \/ r \) \) \, $
  which tends to zero.
  For each fixed $r$, first let the mesh tend to zero. Moment convergence treats the true field and the
    spectators, whereas independence factors the plane term as $bb(E) \[ U'_delta V'_delta \]
    bb(E) \[ F_delta \]$. Proposition 24 evaluates its first factor:
  $ lim_(delta arrow.b 0) bb(E) \[ U'_delta V'_delta \] = frac(v, 2 pi) integral.double alpha_r \( x \)
    log \( 1 \/ \| x - y \| \) beta_r \( y \) thin upright(d) x thin upright(d) y = frac(v, 2 pi) I . $
  The last equality uses exact zero totals to cancel the dilation constant.
    Separate harmonicity and radial mean value give $bb(E) F = T_(j - 2) \( upright(bold(z)) \)$.
    Only now let $r arrow.b 0$; the preceding error bound proves (7.14).
  We read the same limit from (7.11). First average its spectator variables on their radial disks.
    Their harmonic mean value property, including that for $L$ from Lemma 57,
    evaluates them at $upright(bold(z))$. After substituting $x = y_0 + r u$, $y = y_0 + r w$, the singular term is
  $ integral.double alpha \( u \) beta \( w \) L \( y_0 + r w \, upright(bold(z)) \) { log \( 1 \/ r \) +
    log \( 1 \/ \| u - w \| \) } thin upright(d) u thin upright(d) w . $
  For every fixed $w$, the term containing $log \( 1 \/ r \)$ is zero because $integral alpha = 0$.
    This cancellation is exact even though $L$ varies with the second colliding variable.
    The remaining kernel is bounded on the two disjoint supports;
    smoothness of $L$ makes the remaining integral tend to $I L \( y_0 \, upright(bold(z)) \)$.
    For the regular term, subtract $R \( y_0 \; y_0 + r w \, upright(bold(z)) \)$ before integrating against
    $alpha \( u \)$. The uniform first-variable derivative bound from Lemma 57 bounds its contribution by $C r$.
    The left side of (7.14) therefore tends to $I L \( y_0 \, upright(bold(z)) \)$.
    Since $I eq.not 0$, comparison proves (7.13). ◻
]

=== 7.4 Wick recursion and convergence of the full law <wick-recursion-and-convergence-of-the-full-law>

The remaining identification uses harmonicity, prescribed collision singularities, and the boundary condition.
  Related collision arguments identify dimer-height moments in #cite(label("Kenyon2001")) Section 3 and six-vertex
  moments in #cite(label("DCKLM2026")) Section 7.2. Here Proposition 58 gives the logarithmic coefficient from a
  plane copy independent of the absolute-height spectators,
  and Lemma 56 supplies the boundary value and excludes additional distributions on collisions.

#thm([Theorem 7.8.])[
  (Moment identification and the full field law).  #emph[For every $j gt.eq 2$ and distinct $x \, y_2 \, dots.h \,
    y_j in D$,
#[#set math.equation(numbering: n => "(7.16)")
 $ T_j \( x \, y_2 \, dots.h \, y_j \) = v sum_(i = 2)^j G_D \( x \, y_i \) thin
   T_(j - 2) \( y_2 \, dots.h \, hat(y_i) \, dots.h \, y_j \) . $ <eq:limit-wick>]

 Together with $T_0 = 1$ and $T_1 = 0$, this identifies every moment distribution with that of $sqrt(v) thin
   Phi_D$. Every subsequential field limit has that law. Consequently $h_delta \/
   sqrt(v)$ converges to $Phi_D$ as a random distribution, with joint convergence of every finite collection of
   smooth compactly supported pairings.]
] <thm:wick>

#proof[
  Fix the distinct $y_i$’s and subtract the right side of (7.16) from its left side as a function of $x$.
    It is harmonic outside these finitely many points. The Dirichlet Green function for the negative Euclidean
    Laplacian has local singularity
  $ frac(1, 2 pi) log \( 1 \/ \| x - y_i \| \) . $
  Proposition 58 shows that its coefficient agrees with the logarithmic singularity of $T_j$ at each point.
    Lemma 57 therefore makes the difference removable there. It is harmonic on all of $D$.
    Equation (7.9) gives zero limit at every boundary point, as does the Dirichlet Green function on a $C^2$
    Jordan domain. Thus the difference extends continuously by zero to the boundary.
    The maximum principle, applied to it and to its negative, makes it identically zero. This proves (7.16).
    The base $T_1 = 0$ follows from the exact height-reflection symmetry and uniform integrability.
  Induction gives zero for odd moments and, for even $j$, the sum over pairings of the products of $v G_D$.
    Lemma 56 says that these are identities of the entire moment distributions,
    including tests crossing diagonals. The Green products are locally integrable;
    in each pairing their variables occur in disjoint pairs, and the logarithmic singularity is integrable in two
    dimensions. It follows that for every real $f in C_c^oo \( D \)$,
    $H \( f \)$ has exactly the centered Gaussian moments with variance
  $ v integral.double_(D times D) f \( z \) G_D \( z \, w \) f \( w \) thin upright(d) z thin upright(d) w . $
  These moments determine its law. One direct justification avoids assuming an exponential moment in advance:
    the nonnegative series for $cosh \( t H \( f \) \)$, monotone convergence,
    and the known even moments give $bb(E) cosh \( t H \( f \) \) =
    exp \( t^2 "Var" \( H \( f \) \) \/ 2 \)$ for every real $t$.
    Since $e^(\| t H \( f \) \|) lt.eq 2 cosh \( t H \( f \) \)$, the exponential moment is finite.
    The absolutely integrable power series for its characteristic function then yields the Gaussian characteristic
    function. This also covers zero variance.
  Apply this conclusion to $f = sum_(ell = 1)^k a_ell f_ell$, for every real vector $\( a_1 \, dots.h \, a_k \)$.
    All these real linear combinations are Gaussian with the stated covariance form.
    Their characteristic functions identify the joint vector $\( H \( f_1 \) \, dots.h \, H \( f_k \) \)$ with
    that of $sqrt(v) thin Phi_D$.
  Finally choose a countable dense family of smooth tests on an interior exhaustion of $D$.
    Evaluation on these tests determines a distribution and generates the Borel sigma-field of the local Sobolev
    spaces used in Proposition 52; this follows, for example,
    from their realization by countably many localized Fourier coordinates.
    Hence equality of the finite-dimensional laws on this family determines the random-distribution law.
    We chose the original subsequence arbitrarily, so every limit allowed by tightness has the same law.
    Tightness and uniqueness give convergence of the full sequence,
    for each $t > 1$ in $H_(upright("loc"))^(- t) \( D \)$, and therefore as distributions.
    Continuity of test evaluation gives the claimed simultaneous test limits,
    and Proposition 52 also gives their mixed-moment convergence.
  The normalization is $sigma \( x \) = sqrt(v)$. Its strict positivity, finiteness,
    and independence of $D$ and the approximation were proved in Proposition 24.
    All estimates here are for fixed $x$ in the stated closed interval,
    so the endpoint is included with no additional limiting argument in the parameter.
    This completes the proof of Theorem 2. ◻
]

== 8 Scalar spectral measures <sec:scalar-spectra>

The spectral arguments in Sections 4 and 5 use scalar covariance measures and bounded analytic matrix elements.
  We construct these objects directly. Inner products in this appendix are conjugate linear in the first variable.
  Haar measure on a torus is normalized to have mass one.

#thm([Lemma 8.1.])[
  (Commuting translations).  #emph[Let $V_1 \, dots.h \, V_d$ be commuting unitaries on a complex Hilbert space.
    For vectors $a \, b$ there is a unique finite complex measure $mu_(a \, b)$ on the $d$-torus such that
$ integral e^(i upright(bold(n)) dot.op theta) thin mu_(a \, b) \( thin upright(d) theta \) = chevron.l a \,
  V_1^(n_1) dots.h.c V_d^(n_d) b chevron.r wide \( upright(bold(n)) in bb(Z)^d \) . $

 The measure $mu_(a \, a)$ is positive, has mass $parallel a parallel^2$,
   and $parallel mu_(a \, b) parallel_(upright("TV")) lt.eq parallel a parallel parallel b parallel$.
   For Laurent polynomials $P \, Q$,
$ mu_(P \( V \) a \, Q \( V \) b) = overline(P \( e^(i theta) \)) Q \( e^(i theta) \) mu_(a \, b) . $

 If $P_0$ is the orthogonal projection onto the common invariant subspace, then $mu_(a \, b) \( { 0 } \) =
   chevron.l P_0 a \, P_0 b chevron.r$.]
] <spectra:unitary>

#proof[
  For a vector $a$ and an integer $N gt.eq 1$, consider the nonnegative density
  $ K_(N \, a) \( theta \) = N^(- d) ∥sum_(0 lt.eq n_1 \, dots.h \, n_d < N) e^(- i upright(bold(n)) dot.op theta)
    V_1^(n_1) dots.h.c V_d^(n_d) a∥^2 . $
  Its mass is $parallel a parallel^2$. Its Fourier moment at $upright(bold(m))$ is
  $ product_(r = 1)^d \( 1 - \| m_r \| \/ N \)_(+) chevron.l a \, V_1^(m_1) dots.h.c V_d^(m_d) a chevron.r . $
  Compactness of finite measures on the torus gives a subsequential limit with the asserted moments.
    Trigonometric polynomials are uniformly dense in continuous functions,
    so those moments determine the limit uniquely. This constructs $mu_(a \, a)$ without an operator-valued
    measure. Polarization constructs $mu_(a \, b)$ and gives its stated moments.
  For every Borel set $A$ and any finite list of vectors, the matrix $\[ mu_(a_r \, a_s) \( A \) \]_(r \, s)$ is
    positive semidefinite: its quadratic forms are the positive measures of their linear combinations.
    Thus $\| mu_(a \, b) \( A \) \|^2 lt.eq mu_(a \, a) \( A \) mu_(b \, b) \( A \)$.
    Apply Cauchy–Schwarz to a finite measurable partition and take the supremum over such partitions to obtain the
    total-variation bound. The covariance identity for Laurent polynomials follows by checking each Fourier
    moment, then using uniqueness.
  Set
  $ A_N = product_(r = 1)^d (N^(- 1) sum_(k = 0)^(N - 1) V_r^k) . $
  These contractions act identically on common invariant vectors.
    On a vector of the form $\( I - V_r \) b$, telescoping gives $parallel A_N \( I - V_r \) b parallel lt.eq
    2 parallel b parallel \/ N$. The orthogonal complement of the common invariant subspace is the closed span of
    these ranges: a vector orthogonal to every range is fixed by every $V_r^(*)$ and hence by every $V_r$.
    Consequently $A_N$ converges strongly to $P_0$. The polynomial covariance identity gives
  $ parallel A_N a parallel^2 = integral product_(r = 1)^d lr(|N^(- 1) sum_(k = 0)^(N - 1) e^(i k theta_r)|)^2
    mu_(a \, a) \( thin upright(d) theta \) . $
  The integrand is bounded by one and converges to the indicator of the origin.
    Dominated convergence identifies its limit with $mu_(a \, a) \( { 0 } \) = parallel P_0 a parallel^2$.
    Polarization proves the cross identity. ◻
]

#thm([Lemma 8.2.])[
  (A unitary and a positive contraction).  #emph[Let $U$ be unitary and $S$ a positive self-adjoint contraction,
    with $U S = S U$. For vectors $a \, b$ there is a unique finite complex measure $gamma_(a \, b)$ on the circle
    times $\[ 0 \, 1 \]$ satisfying
$ integral e^(i m theta) lambda^j thin gamma_(a \, b) \( thin upright(d) theta \, thin upright(d) lambda \) =
  chevron.l a \, U^m S^j b chevron.r wide \( m in bb(Z) \, med j gt.eq 0 \) . $

 The diagonal measures are positive, both endpoint atoms are retained,
   and $parallel gamma_(a \, b) parallel_(upright("TV")) lt.eq parallel a parallel parallel b parallel$.]
] <spectra:transfer>

#proof[
  For $0 lt.eq k lt.eq N$ put
  $ B_(N \, k) = binom(N, k) S^k \( I - S \)^(N - k) . $
  These operators are positive and sum to the identity. To check positivity without measurable functional
    calculus, first note that $S$ and $I - S$ are positive contractions.
    The scalar binomial series for $sqrt(1 - t)$ has absolutely summable coefficients on $\| t \| lt.eq 1$.
    It therefore gives norm-convergent self-adjoint square roots of $S$ and $I - S$, by substituting $I -
    S$ and $S$, respectively. They commute, being limits of polynomials in $S$.
    Their suitable powers exhibit each $B_(N \, k)$ as a square of a self-adjoint operator.
    The binomial theorem gives $sum_k B_(N \, k) = I$.
  The same square-root series applies to $B_(N \, k) \/ parallel B_(N \, k)
    parallel$ when this operator is nonzero. It gives $B_(N \, k)^(1 \/ 2)$,
    which commutes with $U$ because all its approximating polynomials do. The zero operator has square root zero.
  For each $k$ apply the one-dimensional positive kernels in the proof of Lemma 60 to $B_(N \, k)^(1 \/ 2) a$,
    using $U$ and the same integer $N$. Place the resulting circle measure at $lambda = k \/ N$ and sum over $k$.
    The obtained positive measure has mass $parallel a parallel^2$, and its $\( m \, j \)$ moment is
  $ \( 1 - \| m \| \/ N \)_(+) ⟨a \, U^m sum_(k = 0)^N \( k \/ N \)^j B_(N \, k) a⟩ . $
  For every fixed $j$ the operator sum converges in norm to $S^j$.
    Indeed express $k^j$ as a fixed linear combination of falling factorials $\( k \)_r$;
    the binomial identity $sum_k \( k \)_r B_(N \, k) = \( N \)_r
    S^r$ shows that the coefficient of $S^j$ tends to one and all lower coefficients tend to zero.
    Compact extraction now yields the desired positive diagonal measure.
    Products of trigonometric polynomials in $theta$ and ordinary polynomials in $lambda$ approximate continuous
    functions uniformly, so the moments uniquely determine it.
    Polarization and the positive-matrix argument from Lemma 60 give the cross measures and their total-variation
    bounds. The construction takes place on the compact interval $\[ 0 \, 1 \]$; neither endpoint is removed. ◻
]

#thm([Corollary 8.3.])[
  (Bounded analytic matrix elements).  #emph[For the positive contraction $S$ above and vectors $a \, b$,
    there is a bounded holomorphic function $F_(a \, b)$ on $Re w > 0$ such that
$ F_(a \, b) \( j \) = chevron.l a \, S^j b chevron.r quad \( j = 1 \, 2 \, dots.h \) \,
  wide \| F_(a \, b) \( w \) \| lt.eq parallel a parallel parallel b parallel . $

 It is obtained by integrating $lambda^w$ against the $\[ 0 \, 1 \]$ marginal of $gamma_(a \, b)$,
   with value zero at $lambda = 0$.]
] <spectra:analytic>

#proof[
  Take $U = I$ in Lemma 61 if no tangential operator is present.
    For $lambda > 0$ put $lambda^w = exp \( w log lambda \)$ and set it equal to zero at zero.
    When $Re w > 0$ its absolute value is at most one, giving the bound and the positive-integer identities.
    On each closed smaller half-plane $Re w gt.eq eta > 0$, every $lambda^eta \| log
    lambda \|^r$ is bounded for integer $r gt.eq 0$. Dominated differentiation against the finite cross measure
    proves holomorphy. No value or continuity at exponent zero is asserted. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
