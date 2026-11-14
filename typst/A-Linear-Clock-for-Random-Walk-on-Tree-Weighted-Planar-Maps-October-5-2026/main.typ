#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A Linear Clock for Random Walk \
on Tree-Weighted Planar Maps]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A scaling limit for the metric and area of a random surface does not by itself determine the motion of a particle
  on that surface. The electrical conductances of the approximating graphs can change the limiting diffusion,
  even when their measured metric spaces converge. A further question is whether the time needed to see the
  continuum motion has a single deterministic normalization.

We resolve this question for planar maps weighted by their numbers of spanning trees.
  The geometric input is the metric-measure limit and the contour reconstruction theory of [22].
  We prove the additional convergence of the conditional walk laws, with an exact linear clock.
  The proof separates the identification of the electrical energy from the control of the speed measure.
  This separation is useful because neither part follows from metric-measure convergence alone.

=== 1.1 The model and the continuum process <the-model-and-the-continuum-process>

A rooted planar map is a finite connected graph embedded in the oriented sphere,
  up to orientation-preserving homeomorphism, with a distinguished oriented edge.
  Loops and multiple edges are allowed. For $n gt.eq 1$, let $\( M_n \, T_n \)$ be uniform among rooted maps with
  $n$ edges decorated by one of their spanning trees. Thus the marginal weight of $M_n$ is proportional to its
  number of spanning trees; conditional on $M_n$, the tree $T_n$ is uniform.
  Write $V_n$ for the vertex set and $d_n$ for graph distance using all map edges, each of length one. Set

#[#set math.equation(numbering: n => "(1.1)")
 $ mu_n = sum_(v in V_n) frac(deg \( v \), 2 n) thin delta_v \, $ <eq:degree-measure>]

where each loop contributes two to the degree.

Conditional on the map, let $X^n$ start from $mu_n$. At the times of an independent rate-one Poisson process it
  chooses an incident half-edge uniformly and moves to its other endpoint. Choosing a loop makes no displacement.
  Its generator is

#[#set math.equation(numbering: n => "(1.2)")
 $ \( L_n f \) \( v \) = frac(1, deg \( v \)) sum_(e upright(" a half-edge at ") v) #scale(x: 120%, y: 120%)[\(]
   f \( "other" \( e \) \) - f \( v \) #scale(x: 120%, y: 120%)[\)] . $ <eq:walk-generator>]

The measure $mu_n$ is stationary and reversible for this walk.

Let $\( S \, h \)$ be an ordinary unit-area $sqrt(2)$-Liouville quantum sphere,
  with its distinguished points forgotten. We use the ordinary fixed-area sphere law of Duplantier, Miller,
  and Sheffield [5]. Its quantum area measure $mu_h$ has total mass one.
  Write $D_h$ for its Liouville quantum gravity metric in a fixed deterministic normalization.
  Identify the underlying conformal sphere with the round sphere.
  The continuum process $B^h$ is the conservative $mu_h$-symmetric diffusion associated with the closure on
  $L^2 \( mu_h \)$ of

#[#set math.equation(numbering: n => "(1.3)")
 $ cal(E)_h \( f \, g \) = 1 / 2 integral_(S^2) chevron.l nabla f \,
   nabla g chevron.r_(upright("round")) thin upright(d) "vol"_(upright("round")) \, wide f \,
   g in C^oo \( S^2 \) . $ <eq:continuum-form>]

The closed form uses quasi-continuous representatives. This is Liouville Brownian motion,
  started with conditional law $mu_h$; see [8,2] and the Dirichlet-form framework in [7].
  Conformal invariance of the two-dimensional Dirichlet integral makes (1.3) independent of the conformal
  coordinate. Its factor $1 \/ 2$ fixes the continuum clock.

For precision we fix the spatial normalization used throughout.
  For a finite real random variable $Y$, let $m \( Y \)$ be the unique real solution of
  $bb(E) \[ arctan \( Y - m \( Y \) \) \] = 0$. Put

#[#set math.equation(numbering: n => "(1.4)")
 $ Delta_n = max { 1 \, "diam" \( V_n \, d_n \) } \, wide Delta = "diam" \( S \, D_h \) \, wide a_n =
   exp { m \( log Delta \) - m \( log Delta_n \) } . $ <eq:spatial-normalization>]

Both centers use unconditional laws, so $a_n$ is deterministic. We use the geometric limit of [22] in the form

#[#set math.equation(numbering: n => "(1.5)")
 $ a_n arrow.r 0 \, wide \( V_n \, a_n d_n \, mu_n \) arrow.r^(med d med) \( S \, D_h \, mu_h \) quad
   upright("in Gromov–Hausdorff–Prokhorov topology") . $ <eq:metric-premise>]

The contour and topological results from that work needed in addition to (1.5) are stated in Section 2.

=== 1.2 Retaining the conditional path law <retaining-the-conditional-path-law>

Fix $T > 0$. If $\( K \, d \, mu \)$ is a compact metric probability space,
  let $Q$ be a Borel probability measure on $D \( \[ 0 \, T \] \, K \)$.
  We regard $\( K \, d \, mu \, Q \)$ up to isometries transporting both measures.
  For two such quadruples, define $delta_T$ as the infimum over isometric embeddings $i : K arrow.r Z$ and $j :
  K' arrow.r Z$ into a common complete separable metric space of

#[#set math.equation(numbering: n => "(1.6)")
 $ max {d_H^Z \( i K \, j K' \) \, med d_P^Z \( i_(*) mu \, j_(*) mu' \) \, med
   d_P^(D \( \[ 0 \, T \] \, Z \)) \( i_(*) Q \, j_(*) Q' \)} . $ <eq:delta>]

Here $d_H$ and $d_P$ denote Hausdorff and Prokhorov distances. The last term uses the Skorokhod $J_1$ topology:
  time changes are increasing continuous bijections of $\[ 0 \, T \]$,
  and both their uniform time displacement and the uniform spatial discrepancy tend to zero.
  Each of the three distances may be truncated at one. An embedding acts on a path at every time.

#thm([Theorem 1.1.])[
  (Linear clock and conditional laws).  #emph[For every finite $T > 0$, define
$ Q_n^T = "Law" #scale(x: 120%, y: 120%)[\(] \( X_(n t)^n \)_(0 lt.eq t lt.eq T) divides M_n \,
  T_n #scale(x: 120%, y: 120%)[\)] \, wide Q_h^T =
  "Law" #scale(x: 120%, y: 120%)[\(] \( B_t^h \)_(0 lt.eq t lt.eq T) divides h #scale(x: 120%, y: 120%)[\)] . $

 With the spatial normalization (1.4),
$ \( V_n \, a_n d_n \, mu_n \, Q_n^T \) arrow.r^(med d med) \( S \, D_h \, mu_h \, Q_h^T \) wide
  upright("for ") delta_T \, $

 through all positive integers $n$. Thus the deterministic clock multiplier for (1.2) and (1.3) is $c = 1$.]
] <thm:main>

The random probability law is part of the state in Theorem 1.
  For example, the same argument gives joint convergence of any fixed number of conditionally independent
  stationary walks on the same map: in a common embedding, the associated conditional joint laws are the finite
  products of $Q_n^T$. Their weak convergence follows from that of $Q_n^T$.
  This preserves information about the shared environment.

=== 1.3 Context and related work <context-and-related-work>

Mullin’s enumeration of tree-rooted maps [20] gives the combinatorial starting point:
  the selected spanning tree and its complementary dual tree encode a map by a two-coordinate walk.
  The continuum counterpart is the mating-of-trees construction of Duplantier, Miller, and Sheffield [5].
  At $gamma = sqrt(2)$ its boundary-length coordinates are independent Brownian motions.
  Miller and Sheffield [19] give the corresponding finite-area sphere description,
  and their imaginary-geometry construction [18] supplies the space-filling $upright("SLE")_8$ between the two
  continuum trees. Couplings of discrete and continuum encodings have also been used to compare graph distances
  across random-map models [10]. The continuum metric itself is characterized in [11],
  with conformal covariance established in [12].

Liouville Brownian motion was constructed by Garban, Rhodes,
  and Vargas [8] and independently by Berestycki [2] through a change of Brownian time determined by quantum area.
  Its Dirichlet-form description [9] separates two structures:
  the energy is conformally invariant, while the speed measure is quantum area.
  This distinction explains why the clock is a separate part of a random-map scaling limit.

Several works establish important parts of the discrete picture.
  Gwynne, Miller, and Sheffield prove convergence of the Tutte embedding of mated-CRT maps,
  including conditional walk-law convergence modulo time parameterization [15].
  Their estimates for harmonic functions compare discrete and continuum energies up to constants and control
  oscillation [14]; their invariance principle for ergodic scale-free environments develops a broader framework
  for embedded networks [16]. Gwynne and Miller obtain resistance, return-probability,
  and displacement estimates for several infinite random planar maps, including spanning-tree-weighted maps [13].

Berestycki and Gwynne prove parameterized, quenched convergence to Liouville Brownian motion for mated-CRT maps
  [3]. Their deterministic time scale is an annealed exit-time median,
  comparable to the inverse quantum area of a cell. Whether its ratio to that inverse area converges is left open
  in [3] Remark 1.3. Theorem 1 concerns the finite combinatorial tree-weighted map and its stationary half-edge
  walk. It retains the conditional path law together with metric and area,
  and identifies the acceleration as exactly $n$ for (1.3).

Our geometric inputs are the companion results in [22]. The nondegeneration argument adapts the local-flow method
  in [21] Section “The canonical conformal structure” to a primal and a dual electrical network.
  The use of planar duality to determine an effective conductivity has classical precedents,
  including Dykhne’s exact-conductivity argument [6]. Here we must first construct the energy limit without
  regularity assumptions on the shapes of discrete faces. A separate Green estimate in the original finite-map law
  then controls sources of small stationary mass and supplies the missing clock information.

=== 1.4 Proof strategy and reusable estimates <proof-strategy-and-reusable-estimates>

For a finite graph embedded in the sphere, write

#[#set math.equation(numbering: n => "(1.7)")
 $ sans(e) \( u \) = sum_(a b in E) \( u \( a \) - u \( b \) \)^2 \, $ <eq:network-energy>]

with one term for each unoriented edge, including multiplicities. Loops contribute zero.
  The same convention defines $sans(e)^(*)$ on the dual graph.
  The two main tasks are to identify the limit of these unnormalized energies and to pass from that limit to
  motion in actual time.

The contour description of the map gives local finite graph pieces in conformal coordinates.
  Section 2 explains why the local reconstruction and conditional-kernel calculations of [22] also apply to
  extremal lengths and constrained energy minima on these pieces. Exact edge incidences matter here:
  approximation of graph distances alone would not identify an energy.
  The extension retains compact numerical outputs before extracting a subsequence,
  and uses a change of measure depending only on the contour inputs.

Section 3 proves bounded-energy cutoff estimates without geometric control of individual faces.
  Its central argument is a planar obstruction to simultaneous degeneracy of the primal and dual networks.
  If annular extremal lengths could vanish, low-energy flows would have a nonzero limiting average length measure.
  Locality and triviality of field point germs produce transverse primal and dual crossing flows at a typical
  point. Every such pair crosses an edge and its dual, contradicting the vanishing traffic norms.
  The cutoffs then yield harmonic compactness.

Section 4 identifies every local variational limit as $lambda integral \| nabla u \|^2$,
  with the same positive deterministic $lambda$ for the primal and dual.
  To determine $lambda$, we compare a condenser on an annulus with the period of its rotated current.
  The comparison in one direction gives $lambda lt.eq 1$; recovery of an angular cochain and the signed
  primal–dual pairing give $lambda gt.eq 1$. Thus the coefficient is exactly one in every subsequence.
  Section 5 transfers the result to fixed-area spheres using interior excursion densities and removes the single
  omitted contour endpoint by zero Sobolev capacity.

The remaining speed-measure issue is addressed by the following estimate, proved in Section 6.
  Let $H_n$ be the positive unweighted graph Laplacian. For $mu_n \( f \) = 0$, define $G_n f$ by $H_n G_n f =
  mu_n f$ and $mu_n \( G_n f \) = 0$, where the product $mu_n f$ on the right denotes its vector of vertex masses.
  For every $0 < rho < 1 \/ 2$ there are map-measurable random variables $A_n$ with $sup_n bb(E) A_n <
  oo$ such that, simultaneously for $parallel f parallel_oo lt.eq 1$,

#[#set math.equation(numbering: n => "(1.8)")
 $ parallel G_n f parallel_oo lt.eq A_n thin mu_n \( \| f \| \)^rho . $ <eq:intro-green>]

Its proof is entirely in the fixed-size map law. A spanning-forest identity expresses the centered inverse
  Laplacian through tree cuts; the contour bijection expresses each cut size as one plus a dual-tree distance.
  Dyck-excursion estimates then control the interval sums. This estimate can be used independently of the energy
  identification.

Finally, Section 7 uses (1.8) to obtain uniform resolvent convergence and a stopping-time tightness estimate.
  The resolvents identify the conditional path laws by their integrated finite-dimensional distributions.
  The normalization is visible already at the discrete level:

$ - chevron.l f \, n L_n f chevron.r_(L^2 \( mu_n \)) = 1 / 2 sans(e) \( f \) . $

Combining this identity with the coefficient $lambda = 1$ gives the clock in Theorem 1.

== 2 Sewing and local electrical observations <sec:inputs>

Electrical energy depends on every edge, including parallel edges.
  Consequently, a description that approximates graph distances does not by itself suffice for our purpose.
  This section explains how the local sewing construction of [22] retains exact graph pieces and gives conditional
  laws for numerical observations on those pieces. The observations may be extremal lengths or constrained energy
  minima; we do not yet assert that they are bounded or identify their limits. The construction has three parts.
  We recover complete finite graph pieces from contour cells,
  pass their numerical observations to conditional limiting laws,
  and then read those laws from the fields in the corresponding spatial regions.

Throughout this section,

$ gamma = sqrt(2) \, wide Q = 2 / gamma + gamma / 2 = 3 / sqrt(2) \, wide chi = 1 / sqrt(2) . $

All quantum surfaces use the field and boundary-length normalizations of [22].
  A compact containment $K subset.double U$ means that $K$ is compact and contained in the open coordinate domain
  $U$. A buffer for $K$ is an open neighborhood whose closure is compactly contained in $U$.

=== 2.1 The discrete graph and its continuum background <the-discrete-graph-and-its-continuum-background>

Let $Z^(upright(d)) = \( L^(upright(d)) \, R^(upright(d)) \)$ be a bilateral walk whose increments are independent
  and uniform on the four axial unit vectors. For integer times $i lt.eq j$, set

#[#set math.equation(numbering: n => "(2.1)")
 $ i tilde.op_L j quad arrow.l.r.double quad L_i^(upright(d)) = L_j^(upright(d)) =
   min_(i lt.eq k lt.eq j) L_k^(upright(d)) . $ <inp:vertex-equivalence>]

The equivalence classes are the primal vertices. Horizontal steps give tree edges between consecutive classes,
  with the two traversals of a tree edge counted as one edge.
  A vertical up-step ending at $u$ and the vertical down-step ending at $v > u$ are matched when

#[#set math.equation(numbering: n => "(2.2)")
 $ R_(u - 1)^(upright(d)) = R_v^(upright(d)) < min_(u lt.eq k < v) R_k^(upright(d)) . $ <inp:step-match>]

Each matched pair contributes one further edge between $\[ u - 1 \]_L$ and $\[ v - 1 \]_L$.
  Distinct matched pairs remain distinct edges when their endpoints agree.
  In particular loops and parallel edges are retained. Interchanging $L^(upright(d))$ and $R^(upright(d))$ gives
  the dual graph and its complementary spanning tree.

For a finite interval of indices, the #emph[internal graph] uses the same vertex relation,
  all horizontal steps in that interval, and the vertical pairs whose two occurrences lie in the interval.
  Its vertices embed injectively into the full graph: the minimum test between two retained times is the same in
  both constructions. It need not contain every full-graph edge between those vertices.

#thm([Proposition 2.1.])[
  (Sewing and continuum background).  #emph[The following couplings and normalizations will be used.]
  + #emph[A uniform rooted map–spanning-tree pair with $n$ edges is encoded by the axial walk conditioned to
    remain in $bb(Z)_(gt.eq 0)^2$ and return to zero after $2 n$ steps.
    The preceding rules recover every primal and dual edge with its incidences.]
  + #emph[Give the bilateral walk an independent Poisson clock of rate $m$ and multiply its heights by
    $m^(- 1 \/ 2)$. As $m arrow.r oo$, its interpolated contour converges locally uniformly in distribution to
    $Z = \( L \, R \)$, whose independent Brownian coordinates have variance $1 \/ 2$ per unit time.
    The limiting contour has the peanosphere coupling with a $sqrt(2)$-quantum cone $h$ and an independent
    whole-plane space-filling $upright("SLE")_8$, subsequently parameterized by $mu_h$.
    Write this curve as $eta$ and normalize $eta \( 0 \) = 0$.]
  + #emph[The imaginary field $hat(h)$ is independent of $h$ and is a whole-plane GFF modulo $2 pi chi bb(Z)$,
    with uniform phase in one period. It determines the oriented curve before area parameterization.
    The fields, curve, and contour are retained with their joint peanosphere law.]
  + #emph[A finite interval of contour increments determines its abstract decorated quantum surface,
    its restricted curve, and the quantum lengths of its incoming and outgoing frontiers,
    modulo conformal coordinates. The analogous statement holds for every symmetric interior interval of the
    Brownian-excursion encoding of the ordinary unit-area sphere.]
] <inp:sewing>

The discrete assertion is Mullin’s encoding [20], in the form of Theorem “Mullin encoding and its infinite
  version” in [22]. The continuum assertions are recorded in its Theorem “Peanosphere and interval surfaces” and
  its imaginary-field normalization. Their principal continuum inputs are the mating of trees theorems of [5]
  Theorems 1.9 and 1.11 and the space-filling construction of [18].
  The use of a Poisson clock makes the two coordinate jump processes independent;
  index time divided by $m$ has the same limiting area time.

We recall the geometric information accompanying this coupling.
  Two continuum times have the same image under $eta$ precisely when they are equivalent under the relation generated by

#[#set math.equation(numbering: n => "(2.3)")
 $ L_s = L_t = inf_(\[ s \, t \]) L quad upright("or") quad R_s = R_t = inf_(\[ s \, t \]) R \, wide s lt.eq
   t . $ <inp:brownian-fibers>]

Except for the common endpoint in the sphere encoding, every class has at most three elements and belongs to one
  coordinate when it is nonsingleton. In a class $t_1 < t_2 < t_3$, the middle time is a strict local minimum;
  distinct strict local minima have different heights. At parameter $8$,
  the interval cells are closed topological disks. The cone curve is proper,
  so inverse images of compact sets are bounded. These facts,
  including their simultaneous versions on a countable collection of intervals and independent Poisson cuts,
  are the topological input accompanying Theorem “Peanosphere and interval surfaces” of [22];
  see also the identification description in [5] Section 1.3.1 and Lemma 8.15.

All subsequential arguments below can be placed in a coupling with locally uniform contour convergence.
  We attach the full continuum background conditionally on the limiting contour,
  independently of the additional #emph[raw] discrete observations given that contour.
  Here raw means that the observation uses contour labels, without projecting them through $eta$.
  This convention is compatible with further extraction. Indeed, for a bounded background test $F$,
  its conditional expectation $k_F \( Z \)$ can be approximated in $L^1$ of the fixed Brownian marginal by bounded
  continuous functions of $Z$. Multiplying by any bounded raw test leaves the approximation error uniformly
  bounded by the same $L^1$ error. Joint weak convergence therefore preserves the conditional sampling identity.
  Spatially projected observations will depend on both the raw data and the background;
  we only make this conditional sampling assertion before projection.

=== 2.2 Projections and planar topology <projections-and-planar-topology>

Regard the map together with its dual as a cell decomposition of a surface,
  subdivided into triangles at its corners. Assign a primal or dual vertex the point $eta \( t \)$ corresponding
  to any of its visits. All choices at one vertex, and all corners of an incident triangle,
  have uniformly vanishing discrepancy. Otherwise a subsequence of visit times would limit to a discrete equality
  or matching relation whose endpoints have distinct continuum images, contradicting (2.3).
  Join nearby assigned points by short coordinate arcs and fill the triangles in small disks.
  This gives continuous projections $pi_m$ with vanishing projected triangle mesh.
  On the plane this construction is made in a bounded window containing the region under consideration,
  after preserving its necessary stars and capping the window.
  This protection is obtained directly from lower contour visits, as in the proof below;
  it does not use a local instruction graph or any numerical-array limit.

#thm([Proposition 2.2.])[
  (Topological comparison).  #emph[In the contour coupling,
    the projections $pi_m$ may be chosen so that the following conclusions hold on the sphere and on every
    buffered compact part of the plane. Each conclusion is eventual for each fixed choice of margins.]
  + #emph[If the projections of two primal vertices approach each other,
    they can be joined by primal paths with arbitrarily small projected diameter.
    This is uniform over all lifts in a fixed compact region.
    The same statement holds on the dual graph and for surface paths.
    In particular fixed tubes with clearance contain paths following them on either graph.]
  + #emph[All lifts of a sufficiently small closed disk or other compact well can be included in a connected set
    over any fixed open enlargement. A loop projecting into a small disk can be filled over a slightly larger
    disk, provided that both have the prescribed clearance.]
  + #emph[The projection has degree $+ 1$ or $- 1$ in a compact spherical completion.
    Robustly transverse primal and dual tube crossings intersect at an edge and its dual.
    Projected circuits with nonzero winding difference about two separated wells separate all the corresponding
    lifted fibers.]
  + #emph[Integer winding differences about two wells agree upstairs and downstairs up to the common degree sign,
    when loops and wells have fixed separation. These statements retain repeated edge and face incidences.]
] <inp:topology>

#proof[
  The construction and the first three assertions are the construction preceding Lemma “Uniform topological
    joining”, that lemma, Lemma “Exterior connection and small-loop filling”,
    Proposition “Degree and robust planar topology”, and Lemma “Separation of entire fibers” in [22].
    We explain their applicability to both graphs and to the plane.
  The hypotheses are uniform contour convergence, vanishing projected cell mesh,
    and approximation of the limiting fiber generators by discrete links with small projected connecting paths.
    For a Brownian excursion above a level, use last and first crossings of nearby levels on the two sides of an
    interior time. Their discrete analogues approximate the chord.
    At a triple, apply this on the two excursions on either side of its middle minimum.
    The fiber description above therefore supplies every generator required for topological joining.
    Interchanging the coordinates gives the same argument for the dual.
    Applying planar separation to the two embedded graph paths gives the mixed crossing assertion:
    a primal path and a dual path can meet only through a primal edge and its dual,
    with the usual corner subdivision making the intersection literal on the surface.
  For a bounded plane region, choose a window containing all its visits and its fixed additional star layers.
    Both contour coordinates make strictly lower visits on both sides of a sufficiently large window.
    Lemma “Protected capping of a bounded window” in [22] then supplies a spherical completion preserving all
    these incidences. Its continuum completion is absolutely continuous with respect to a Brownian excursion,
    which supplies the sphere quotient needed for the preceding topological results.
  For the integer assertion, connect all lifts of each well away from the tested loop,
    using the first two assertions. A two-chain bounded by that loop has constant multiplicity along each such
    connected fiber. Projection multiplies the difference of its multiplicities at the two fibers by $deg pi_m =
    plus.minus 1$. This is exactly the equality of winding differences.
    Equivalently, one can use relative homology after a simplicial perturbation inside the fixed margins. ◻
]

=== 2.3 Finite instruction graphs and numerical tests <finite-instruction-graphs-and-numerical-tests>

For a finite multigraph $G$, write

#[#set math.equation(numbering: n => "(2.4)")
 $ sans(e)_G \( u \) = sum_(a b in E \( G \)) \( u \( a \) - u \( b \) \)^2 . $ <inp:graph-energy>]

The sum has one term for each unoriented edge; loops contribute zero.
  An energy test is the infimum of (2.4) subject to finitely specified value constraints at vertices of a
  specified subgraph. We allow $+ oo$ for an infeasible test.
  An extremal-length test for a family $cal(P)$ of graph paths is

#[#set math.equation(numbering: n => "(2.5)")
 $ "EL"_G \( cal(P) \) = sup_(w : E \( G \) arrow.r \[ 0 \, oo \))
   frac(#scale(x: 120%, y: 120%)[\(] inf_(P in cal(P)) sum_(e in P) w \( e \) #scale(x: 120%, y: 120%)[\)]^2,
   sum_(e in E \( G \)) w \( e \)^2) \, $ <inp:el-test>]

with the usual conventions for empty families and constant paths.
  Only nontrivial families will be used in the crossing arguments.

The graph on which one computes these quantities must be specified before taking a limit.
  We use the finite instruction graphs of Lemma “Finite-band reconstruction” in [22], recalled next.
  Their inputs consist of finite strings and relative heights.
  This description will also show why the conditional-law proof applies to our numerical tests.

#prodef([Definition 2.3.])[
  (Finite packages).  A #emph[master block] consists of two increment strings on a time interval
    $\[ 0 \, ell_b \]$, starting at zero, together with a finite list of internal cuts.
    A finite package contains finitely many master blocks. For each coordinate $a in { L \,
    R }$ choose a forest on these blocks and record its height differences $o_(b d)^a = s_d^a - s_b^a$.
    The values $s_b^a$ are thereby determined within each forest component up to one additive constant.
  A test chooses finitely many #emph[active windows], each between recorded cuts of a master block.
    Each active window initially has its own copy of the contour vertices.
    Its starting heights and increment strings are obtained by restriction of its master block.
    Enable the ordinary sewing inside each active window. The additional cross-window links are specified by the
    band rules below. A package can retain several tests on the same master strings.
] <inp:packages>

For an active window $b$, write $z_b^a$ for its increment string, $s_b^a$ for its starting height, and $m_b^a =
  min z_b^a$. Its incoming and outgoing record arcs are the times satisfying, respectively,

$ z_b^a \( t \) = min_(0 lt.eq u lt.eq t) z_b^a \( u \) \, wide z_b^a \( t \) =
  min_(t lt.eq u lt.eq ell_b) z_b^a \( u \) . $

A band from window $b$ to window $d$ permits outgoing-to-incoming links with common absolute height $H$ satisfying

#[#set math.equation(numbering: n => "(2.6)")
 $ alpha lt.eq H - q lt.eq beta \, wide H lt.eq s_w^a + min_J z_w^a
   quad \( w \, J upright(" in the cap list") \) . $ <inp:bands>]

Here $alpha < beta$ are fixed rational parameters, $q$ is the height at a recorded anchor cut,
  and each $J$ is a recorded subwindow. The forest supplies every relative height appearing in the rule.
  Each selected minimum is evaluated from the discrete string itself.

In the primal graph, an $L$-band identifies its permitted vertices.
  An $R$-band is a rule for pairs of oriented step occurrences:
  an outgoing up-step and an incoming down-step must carry the same unit height strip,
  and the #emph[whole strip] must satisfy the band and cap conditions.
  Such a pair contributes an edge; it does not impose an $R$-vertex identification.
  The dual uses the exchanged convention. If a tree edge is represented in several retained pieces it is counted
  once after the corresponding vertex identifications: its unordered endpoint pair identifies it,
  since a tree has no parallel edges. Each additional matched-step edge is counted once for that matched pair,
  even when another such pair has the same endpoints.

The same active windows and band instructions continue to define an old test when cuts are added or master blocks
  are merged. In the merged string, old starting heights are evaluated at the old cuts;
  they are no longer independent offset parameters. A graph allowed to use the entire merged interval is a
  separate new test. In particular an old test cannot be recovered by merely confining paths in that larger graph,
  since the larger graph may use newly enabled edges witnessed in a formerly omitted gap.

For each instruction list we retain a countable family of numerical outputs.
  A vertex is selected when one of its visits lies in a finite union of intervals of relative time.
  Endpoints can be recorded cuts or rational fractions between cuts.
  Such selectors specify the subgraph, its ports, and any confinement condition.
  Rational value intervals at selected visits specify energy constraints;
  repeated visits impose simultaneous constraints on the same vertex.
  The output library includes both graphs, finite joint lists of tests, and tests recomputed on union graphs.
  Inapplicable tests receive a fixed default value. Every nonnegative output is compactified in $\[ 0 \, oo \]$,
  for example by $x mapsto x \/ \( 1 + x \)$. We can retain outputs divided by any prescribed positive
  deterministic factor $b_m$, including factors tending to zero.

This gives compact countable products of numerical observations.
  The master strings, durations, cuts, and offsets remain separate input coordinates.
  Along any sequence $m arrow.r oo$, one may therefore extract joint limits of all the raw tests and the locally
  convergent contours. The issue is now to relate these formal tests to complete pieces of the actual map.

=== 2.4 Exact cores and the selector sandwich <exact-cores-and-the-selector-sandwich>

Add independent Poisson cuts in area time, using nested refinements.
  A cell is the image of a consecutive cut interval under $eta$.
  Only cells compactly contained in the current testing domain will be used.
  Their local data consist of their oriented traversals, quantum area parameterizations,
  and tagged incoming and outgoing frontier lengths, with repeated frontier occurrences retained.
  A #emph[run] is a finite union of consecutive cells, viewed with its concatenated traversal and tagged incoming
  and outgoing frontiers. For any finite selection of cells,
  its maximal runs are the maximal consecutive groups in that selection.

Here is how these local data provide the relative heights used in a package.
  Fix a run $b$ and one coordinate $a in { L \, R }$. For an initial segment of the run,
  the incoming frontier length is the drop from its starting contour height to the minimum on that segment;
  the outgoing length is the rise from that minimum to its ending height.
  Their difference is therefore the contour increment. Reading these two tagged lengths at every rational relative
  area time, and using continuity, recovers the whole increment path $z_b^a$ from the local traversal.
  Put $m_b^a = min z_b^a$ and $e_b^a = z_b^a \( ell_b \)$.

The incoming frontier of the whole run has relative-height range $\[ m_b^a \, 0 \]$,
  and the outgoing frontier has range $\[ m_b^a \, e_b^a \]$.
  For a tagged point $p$ on either frontier, define its #emph[relative height] $theta.alt_b^a \( p \)$ by starting
  with value $m_b^a$ at the minimum endpoint and increasing by quantum boundary length along that frontier toward
  its tip. Thus the incoming tip has height $0$ and the outgoing tip has height $e_b^a$.
  This orientation is by increasing height, irrespective of the orientation in which the contour traverses the
  frontier. Equivalently, if $p$ is represented by a record time $t$, then $theta.alt_b^a \( p \) = z_b^a \( t \)$.

A #emph[directed shared seam] $b arrow.r d$ is a common frontier subarc of positive quantum length,
  tagged as outgoing for $b$ and incoming for $d$, in the same coordinate.
  At a paired point $p$ of this seam, the two absolute heights agree. Hence

#[#set math.equation(numbering: n => "(2.7)")
 $ s_b^a + theta.alt_b^a \( p \) = s_d^a + theta.alt_d^a \( p \) \, wide s_d^a - s_b^a = theta.alt_b^a \( p \) -
   theta.alt_d^a \( p \) . $ <inp:seam-offset>]

The right side is constant along the seam and is determined by the two local tagged frontier parameterizations.
  One may read it at an interior point, so the construction does not require selecting or assigning a height to a
  branch endpoint. Taking a spanning forest of such seams supplies exactly the offsets in Definition 4.
  Their outgoing and incoming tags also specify which linked run precedes the other.
  A chronological order between runs without a declared seam is unnecessary.

There is one endpoint configuration requiring an exact comparison.
  Suppose three visits of one coordinate meet at height $H$, in three disjoint runs $b \, w \, d$ in that order,
  with the middle visit a strict local minimum. The outer runs $b \,
  d$ share a positive interval of seam heights below $H$. Above $H$,
  the two positive seam intervals are $b arrow.r w$ and $w arrow.r d$; see Figure 1.
  Formula (2.7) on these intervals recovers $s_w^a$ relative to the outer starts.
  The tag directions identify $w$ as the middle run. It lies between the two outer visits and contains the middle
  contact. The contour stays at least $H$ throughout that interval by (2.3), and attains $H$ in $w$. Hence

#[#set math.equation(numbering: n => "(2.8)")
 $ H = s_w^a + m_w^a . $ <inp:exact-cap>]

A band for the outer pair may extend above the continuum value $H$,
  but it must include the cap in (2.6) evaluated as $s_(w \, m)^a +
  min z_(w \, m)^a$ at every discrete resolution. It is this exact minimum,
  rather than a rounded approximation of $H$, that excludes the outer-to-outer links above the branch.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-0.1275, 1.89), (5.228, 2.295), fill: rgb("#ededff"), stroke: none)
  rect((-0.1275, 0.36), (5.228, 0.765), fill: rgb("#ededff"), stroke: none)
  line((-1.445, 0), (-1.445, 2.79), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((-1.445, 2.79), [#text(size: 9pt)[height]], anchor: "south", padding: 0.1176cm)
  line((0, 0.135), (0, 2.655), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 2.655), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  line((2.55, 1.35), (2.55, 2.655), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((2.55, 2.655), [#text(size: 9pt)[$w$]], anchor: "south", padding: 0.1176cm)
  line((5.1, 0.135), (5.1, 2.655), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((5.1, 2.655), [#text(size: 9pt)[$d$]], anchor: "south", padding: 0.1176cm)
  line((0.068, 2.07), (2.482, 2.07), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((2.618, 2.07), (5.032, 2.07), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((0.068, 0.558), (5.032, 0.558), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((1.275, 2.07), [#text(size: 9pt)[$b arrow.r w$]], anchor: "south", padding: 0.1176cm)
  content((3.825, 2.07), [#text(size: 9pt)[$w arrow.r d$]], anchor: "south", padding: 0.1176cm)
  content((2.55, 0.558), [#text(size: 9pt)[$b arrow.r d$]], anchor: "north", padding: 0.1176cm)
  line((-1.615, 1.35), (5.44, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-1.615, 1.35), [#text(size: 9pt)[$H$]], anchor: "east", padding: 0.1176cm)
  circle((2.55, 1.35), radius: 0.07056, fill: black, stroke: none)
  content((2.762, 1.557), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s_w^a+m_w^a$]]])], anchor: "west")
  line((-0.5525, 0.405), (-0.5525, 2.25), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((-0.7225, 0.405), (-0.3825, 0.405), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  line((-0.7225, 2.25), (-0.3825, 2.25), stroke: (paint: rgb("#a60000"), thickness: 0.4pt, miter-limit: 10))
  content((-0.7905, 2.205), [#text(fill: rgb("#a60000"))[#text(size: 9pt)[uncapped band]]], anchor: "east", angle: 90deg, padding: 0.1176cm)
})],
  caption: [Figure 1: A triple contact in height coordinates. The shaded strips indicate positive intervals of shared quantum-boundary heights; they are not drawings of Euclidean seams. The outer pair is linked below $H$, while above $H$ each outer run is linked to the middle run. The middle run’s exact discrete minimum caps the outer-pair band. ],
) <inp:triple-figure>

We use bands lying inside these shared height intervals with positive margins at their effective endpoints,
  with two exceptions prescribed by the record data. At a natural lower record minimum the rational band starts
  below the minimum and is clipped by the exact record condition.
  At an upper endpoint with the three-seam configuration, the band is clipped by the exact selected minimum (2.8).
  These are the admissible band choices in the proof of Lemma “Finite-band reconstruction” of [22].
  All their tests use the local tagged frontiers, relative increments, and quantum lengths just described.

#thm([Lemma 2.4.])[
  (Complete graph pieces in a buffer).  #emph[Fix $K subset.double U$ in a coordinate chart.
    Almost surely, there is a finite prescription, selectable from the local cells in $U$ and their frontier data,
    with the following property. In a neighborhood of $K$, its instruction graph agrees with the actual discrete
    graph, including vertex equalities and all edge incidences,
    for all sufficiently large resolutions in the coupling. The same prescription can retain both the primal and
    the dual graph. One can require any fixed smaller collar of this neighborhood before restricting the tests to it.]
  #emph[The prescriptions can be taken from the countable instruction scheme above and chosen measurably using the
    fields and spatial cut marks in $U$, with an arbitrarily small open buffer.
    The assertion also holds in the interior of a fixed interval cell, using only its internal increment string.]
] <inp:complete-core>

#proof[
  We use the exact-incidence part of the proof of Lemma “Finite-band reconstruction” in [22].
    We give the argument because exactness, rather than an approximation of path costs, is essential for energy tests.
  Choose $r > 0$ so that the closed $3 r$-neighborhood of $K$ lies in $U$.
    Properness bounds all its visit times in a finite window.
    Refine the Poisson cuts until every cell meeting this neighborhood has diameter less than $r$.
    Select all cells meeting the closed $2 r$-neighborhood of $K$ and merge consecutive selected cells into
    maximal runs. These runs are disjoint intervals; all visits sufficiently near $K$ lie in them.
    Their endpoints stay away from $K$, since otherwise the neighboring cell would also have been selected.
    Local traversal data identify the selection: first inspect a slightly larger buffer and require the portions
    around every visit to the smaller compact to be flanked by marks while they remain in that buffer.
    Properness, continuity, and refinement make this condition hold eventually.
    No global index for the retained runs is part of this inspection.
  Consider one coordinate and two selected runs $b < d$ in chronological order.
    An outgoing point of $b$ and an incoming point of $d$ at height $H$ are linked exactly when
  #[#set math.equation(numbering: n => "(2.9)")
   $ H lt.eq min_(upright("between the two runs")) Z^a . $ <inp:gap-test>]
  The same assertion holds discretely, with the full-strip convention for a matched step.
    Split the intervening interval into selected runs and omitted gaps.
    If a limiting link projects near $K$, any intervening time at its height represents that same continuum point.
    It must therefore belong to a selected cell. Thus every omitted-gap minimum is strictly above the height of
    that link. The relevant endpoint pairs form a compact set, and there are only finitely many gaps.
    Their positive slack is consequently uniform: a sequence of slacks tending to zero would limit to a contact in
    an omitted gap, contrary to the selection.
  An obstruction without slack can only be a minimum of a selected run.
    At a triple contact, the three directed seams in Figure 1 identify the middle run and recover its offset
    through (2.7). Formula (2.8), evaluated on the discrete string, supplies the cap in (2.6).
    At a natural lower seam endpoint, choose the lower rational band endpoint below the record minimum;
    the exact incoming or outgoing record condition then clips the band at that minimum.
    This retains links at the minimum as well as links at nearby lattice heights.
  For every pair of runs, cover the compact set of relevant link heights by finitely many such bands.
    Choose each band to be admissible over its entire effective height interval:
    that interval lies in a genuine shared seam, its omitted-gap comparisons have positive slack,
    and every allowed non-strict cap is the exact selected minimum just described.
    The natural record conditions provide the exact clipping at lower seam endpoints.
    Include the positive seam intervals needed to read the relative heights,
    and retain a spanning forest of these comparisons in each coordinate.
    All needed offsets are sums along that forest. Seam directions specify the order of linked runs and
    distinguish each middle cap; the instructions do not need an order between unrelated runs.
    Each band retains every discrete link satisfying its rule.
    Uniform contour convergence, the positive omitted-gap slack, and the exact selected minima show two things:
    every actual link near $K$ belongs to one of these bands eventually,
    and every permitted link in those effective bands is an actual link eventually.
    In particular the latter assertion applies to any permitted link with one endpoint over a smaller core collar:
    its two limiting endpoints lie on the same shared-seam point and hence remain inside the captured collar.
    The assertions hold simultaneously for all links, regardless of their number.
  Vertex equality is the same first-coordinate minimum test, so it is captured as well.
    Start a chain of enabled identifications at a core representative.
    Its first link is an actual identification by the preceding band validity.
    All visits to that actual vertex have uniformly close projections, independently of the instruction graph,
    and lie in the captured collar. Inductively the next enabled link is therefore actual as well and remains at
    that vertex. Thus a peripheral chain cannot introduce an additional equality at the core.
    Horizontal tree traversals with the same identified endpoint pair give one tree edge;
    no two distinct tree edges have that pair. Added edges are instead identified by their matched step-occurrence
    pair, preserving distinct parallel edges. Hence the result is equality of graphs with incidences,
    not merely equality of their path relations. Applying the argument to the other coordinate gives the dual
    conclusion.
  All seam, cap, and positive-margin conditions are measurable in the oriented local cells and frontier lengths.
    Rational bands, integer lower bounds on positive margins,
    and finite forest choices give a countable selection rule.
    Taking a further collar before the final restriction gives the stated neighborhood of $K$.
    Inside a fixed interval cell, every visit to a compact subset of its interior lies in that interval with a
    time margin; the same argument then uses only its internal string. ◻
]

An arbitrary union of overlapping formal window copies need not be an injective copy of a map subgraph.
  The lemma asserts the existence of #emph[complete] prescriptions,
  obtained from disjoint maximal runs or from a freshly computed merged graph.
  All comparisons to the actual map below use these complete prescriptions.

#thm([Lemma 2.5.])[
  (Spatial and value selectors).  #emph[In the setting of Lemma 5, suppose $K subset O$ with $K$ compact,
    $O$ open, and $overline(O) subset.double U$. There is an interval selector on a complete prescription which,
    eventually, includes every vertex projected into $K$ and includes only vertices projected into $O$.
    Several such choices may be made together, for confinement and for each port set.]
  #emph[Let $u$ be continuous on a neighborhood of $overline(O)$.
    For any two uniform value tolerances $0 < delta_(-) < delta_(+)$,
    finite rational interval constraints on selected visit labels can be placed between the constraints $\| v -
    u compose pi_m \| lt.eq delta_(-)$ on a slightly larger compact set and $\| v - u compose pi_m \| lt.eq
    delta_(+)$ on a smaller one. All these comparisons hold simultaneously for every continuous target through the
    same retained test library.]
] <inp:sandwich>

#proof[
  On the finitely many selected windows, the limiting parameterizations are continuous.
    Cover the inverse image of $K$ by finitely many relative-time intervals with closures projecting inside $O$.
    Their endpoints may be chosen from the prescribed dense countable relative-time library.
    Uniform projection accuracy and the complete collar of Lemma 5 give the desired inclusions.
    Select a vertex when any of its visits is in this union. The same argument applies to each port,
    while vanishing edge mesh allows an induced-edge rule within the complete prescription.
  For value constraints, refine the intervals until the oscillation of $u compose
    eta$ on each is less than a fixed fraction of $delta_(+) - delta_(-)$.
    Choose a rational value interval between the two allowed tolerances.
    Impose it at every selected visit in that interval, retaining all simultaneous constraints when a vertex has
    several visits. The strict tolerance gap and uniform projection error give the two implications.
    The construction chooses among an already countable collection of tests;
    it does not add a new exceptional null set for each target $u$.
    Compact exhaustion and rational positive tolerances therefore yield common measurable versions for all
    continuous targets. ◻
]

The selector lemma compares variational values with strict margins.
  It does not assert convergence for a prescribed sharp boundary.
  For a crossing event, for example, choose smaller port and confinement constraints and then relaxed constraints,
  both strictly inside the desired geometry. An intermediate selector produces actual paths in the relaxed test,
  and any path family having the smaller clearance can be included by a sufficiently relaxed selector.
  Thus existence of a strictly fitting test with finite limiting extremal length is independent of the particular
  complete prescription. Exhausted energy values have the same property.
  These conventions also make readouts with a varying spatial center jointly measurable:
  all membership and value comparisons use finite selectors with a strict gap, followed by countable exhaustion.

=== 2.5 The conditional law of enlarged outputs <the-conditional-law-of-enlarged-outputs>

We now identify the conditional law of the finite numerical arrays.
  The proof is the finite-experiment argument of [22], with the output vector enlarged before taking a
  subsequence. The enlargement is harmless for a specific reason:
  every change of density in that argument is a function of the inputs alone.

#thm([Lemma 2.6.])[
  (Conditional transfer for numerical outputs).  #emph[Consider finitely many packages as in Definition 4.
    Different packages use disjoint master blocks and disjoint offset forests.
    Sample their Poissonized strings independently; give their durations, cuts,
    and offset vectors smooth positive densities, with offsets discretized on the height lattice.
    Retain any finite or countable vector of compactified numerical tests of their instruction graphs,
    including tests on both graphs.]
  #emph[Along a common subsequence the reference laws have disintegrations
$ nu_r \( upright(d) x_r \) K_r \( x_r \, upright(d) y_r \) \, $

 where $x_r$ denotes the durations, cuts, increment strings, and forest offsets,
   and $y_r$ denotes the numerical outputs. Insert these blocks in the actual bilateral walk with positive omitted
   gaps. Conditional on the entire limiting contour and its cuts, their output law is
#[#set math.equation(numbering: n => "(2.10)")
 $ ⨂_r K_r \( x_r \, upright(d) y_r \) . $ <inp:conditional-product>]

 The kernels are invariant under changes of positive reference densities and under relabeling blocks or changing
   the forest basis. They are compatible with jointly retained refinements and merged tests.
   These identities hold after selection from the countable instruction library using the limiting contour and cuts.]
] <inp:kernel-transfer>

#proof[
  This is the argument of Lemma “Finite reference experiment and conditional transfer” in [22].
    We include its measure calculation to specify its application to potentially discontinuous variational outputs.
  Write $epsilon.alt_m = m^(- 1 \/ 2)$. For one coordinate, order all selected blocks chronologically as $1 \,
    dots.h \, k$. Let $s_i$ be their starts, $e_i$ their net increments, and $g_i > 0$ the intervening durations.
    Complete the union of the package forests to a tree $T$ on these blocks.
    Give its extra offsets independent positive densities. If the density on an edge $e$ is $rho_e$, use lattice mass
  $ r_(m \, e) \( a \) = integral_(a - epsilon.alt_m \/ 2)^(a + epsilon.alt_m \/ 2) rho_e \( u \) thin upright(d)
    u \, wide a in epsilon.alt_m bb(Z) . $
  Let $p_t \( j \)$ be the transition mass of one coordinate of the unscaled rate-one axial Poisson walk,
    so its variance rate is $sigma^2 = 1 \/ 2$. The exact density of the actual relative starts with respect to
    these reference offsets is
  #[#set math.equation(numbering: n => "(2.11)")
   $ W_m^a =
     frac(product_(i = 1)^(k - 1) p_(m g_i) #scale(x: 120%, y: 120%)[\(] epsilon.alt_m^(- 1) \( s_(i + 1) - s_i -
     e_i \) #scale(x: 120%, y: 120%)[\)], product_(e in T) r_(m \, e) \( a_e \)) . $ <inp:density>]
  Indeed, tree differences and consecutive differences are related by an integer linear map with integer inverse,
    obtained by summing along paths in $T$. Its determinant is $plus.minus 1$,
    so there is no lattice multiplicity. Multiply (2.11) for the two coordinates and include the density ratio for
    the durations and cuts to obtain $W_m$.
  On compact input sets with all gaps bounded below by a positive constant, the local central limit theorem gives
  $ epsilon.alt_m^(- 1) p_(m t) \( j \) arrow.r \( 2 pi sigma^2 t \)^(- 1 \/ 2) exp { -
    x^2 \/ \( 2 sigma^2 t \) } \, wide x = epsilon.alt_m j \, quad sigma^2 = 1 / 2 \, $
  uniformly in bounded $x$ and in such $t$. The numerator and denominator of (2.11) have the same number of
    lattice factors. They cancel, leaving uniform convergence $W_m arrow.r
    W$ to a continuous finite function on these compact sets.
  Conditional on the selected inputs, the omitted strings are independent bridges and are independent of the
    numerical outputs. Their rescaled laws converge uniformly on these input sets to Brownian bridge laws.
    For completeness, their finite-dimensional densities are ratios of transition masses,
    so the preceding local limit theorem applies. On the first half of a bridge the density relative to the free
    walk is bounded by
  $ frac(sup_j p_(m \( t - u \)) \( j \), p_(m t) \( j_0 \)) lt.eq C \, wide u lt.eq t \/ 2 \, $
  when $t$ and $epsilon.alt_m j_0$ range in the chosen compact sets.
    The numerator is at most $C epsilon.alt_m$ and the denominator at least $c epsilon.alt_m$.
    Free-walk tightness and the reversed argument on the other half prove uniform bridge tightness.
    The same applies to a finite list of gaps and to exterior contour portions on a bounded window.
  The full independent reference experiments converge jointly to the product of their limits,
    because their output spaces are compact and their input marginals converge.
    Let $a$ denote the completion offsets and $z$ the omitted bridges.
    Integrating bounded continuous bridge tests first, the preceding uniform convergence gives the limiting actual law
  #[#set math.equation(numbering: n => "(2.12)")
   $ W \( x \, a \) thin nu \( upright(d) x \, upright(d) a \) thin cal(B) \( x \, a \; upright(d) z \) product_r
     K_r \( x_r \, upright(d) y_r \) . $ <inp:weighted-law>]
  The weight and the bridge law depend only on contour inputs.
    The complete contour and cuts recover $\( x \, a \, z \)$, so disintegration of (2.12) gives (2.10).
  To remove the compact restrictions, first keep all finitely many limiting gaps positive,
    then bound endpoints and offsets, and finally restrict the block paths to compact sets.
    Under the actual law the excluded probability tends to zero by finite-window contour tightness.
    If $P_m$ is the actual law and $Q_m$ the reference law, the exact identity
  $ bb(E)_(Q_m) \[ W_m upright(bold(1))_(A^c) \] = P_m \( A^c \) $
  controls the omitted density mass. No global bound on $W_m$ is required.
    Exhaustion, followed by a monotone-class argument, gives the assertion for bounded measurable tests and for
    the entire bilateral contour.
  A change of reference density adds another input-only density ratio, continuous in the limit on compact sets,
    and thus leaves $K_r$ unchanged. Forest bases are related by unimodular integer maps.
    The pushed-forward lattice cells and the directly discretized cells have the same volume and vanishing
    diameter. Their mass ratios converge to one on compact sets;
    tightness makes the two lattice laws converge in total variation.
    This comparison remains valid after applying a discontinuous graph-output map.
    Absolute time labels and the order of unrelated blocks occur only in $W_m$,
    and disappear from the conditional output law.
  For merged tests one must also check the old output. Begin with the old independent blocks, their offsets,
    and their old numerical outputs. Insert the formerly omitted positive-duration gaps by the exact density and
    bridge construction. The resulting string has the new master-block law.
    Recompute the old graph from its unchanged active windows and bands,
    and compute the new union graph as a separate output on that same string.
    Formula (2.12), applied before conditioning on the new master string, proves the old conditional marginal.
    It never evaluates a previously chosen kernel on a forced-offset diagonal.
    Windows with a common endpoint were already within one maximal run,
    so no positive-density argument is applied to a zero-length gap.
    Jointly retaining finite vectors proves consistency for all refinements and unions,
    and then for the countable library.
  Every step used only compactness of the output coordinates and their measurability from their own package.
    Thus it applies to the energy and extremal-length tests, with any deterministic normalization.
    It does not require continuity of those outputs or preservation of conditional independence under arbitrary
    weak limits. Finally, after conditioning the identities hold for all countably retained templates on one
    event; contour- and cut-measurable selection from them is therefore permitted. ◻
]

=== 2.6 Spatial locality and changes of quantum units <spatial-locality-and-changes-of-quantum-units>

The preceding kernels are indexed by contour blocks. To use them in disjoint spatial regions,
  their inputs must be readable from the fields in those regions.
  This is where oriented cells and relative frontier heights enter.

#thm([Proposition 2.7.])[
  (Local numerical-array kernels).  #emph[On each open coordinate domain,
    take the limits of the numerical tests on complete buffered prescriptions,
    with relative labels localized to their cells. Conditional on $\( h \, hat(h) \)$,
    the resulting local arrays admit kernels depending only on the fields in an arbitrarily small open enlargement
    of the testing region. Arrays using disjoint such enlargements are conditionally independent given the
    complete fields.]
  #emph[One may retain the local Poisson marks. Their conditional laws are the corresponding Poisson processes
    with intensity proportional to $mu_h$, and their restrictions to disjoint domains are independent.
    The kernels are consistent under restriction, common refinements, and compact exhaustion.]
] <inp:local-kernels>

#proof[
  Proposition “Background locality” in [22] states that $hat(h)$ in a buffer determines the oriented curve
    segments through the testing region. The restriction of $h$ gives their area parameterizations and their
    directed frontier lengths. These data determine the locally retained marked cells.
    For a segment from time $s$ to time $t$, its coordinate increment is the outgoing frontier length minus the
    incoming frontier length of that coordinate, with tagged multiplicities retained:
  #[#set math.equation(numbering: n => "(2.13)")
   $ Z_t^q - Z_s^q = nu_h \( partial_q^(upright("out")) eta \( \[ s \, t \] \) \) -
     nu_h \( partial_q^(upright("in")) eta \( \[ s \, t \] \) \) \, wide q in { L \, R } . $ <inp:frontier-increments>]
  Formula (2.13) reads the increments without an absolute contour height.
    Positive shared seams read the forest offsets, and the three-seam configuration in Lemma 5 reads the offsets
    needed at a minimum cap. Durations and relative cuts are local area data.
    Thus all four types of input in Lemma 7 are local.
  For finitely many prescriptions in disjoint spatial domains, merge within each domain.
    Different domains use disjoint cells; two runs from different domains cannot share a cut,
    since its image would belong to both compactly contained cells.
    Their intervening chronological gaps are therefore positive even if the runs interleave in time.
    Lemma 7 gives their product law conditional on the contour and cuts.
    Its invariance under labels and forest bases lets us enumerate the cells locally without retaining a global
    cut index.
  Adjoin the continuum background by the conditional sampling convention above.
    The product formula remains valid upon conditioning additionally on the fields.
    Its factors are now measurable functions of the local fields and spatial marks,
    by the preceding input reconstruction. Conditional expectation therefore gives the same product formula given
    the complete fields and spatial marks. This is exactly the argument of Proposition “Spatial product kernels”
    in [22], applied to the enlarged output vector of Lemma 7.
  The time cuts are independent of the continuum background.
    Area parameterization and the Poisson mapping theorem give their spatial conditional intensity $rho
    mu_h$ for a layer of time intensity $rho$. Write $Pi_i$ for the marks in the $i$th domain and
    $K_i^(upright("marks")) \( h \, hat(h) \, Pi_i \; dot.op \)$ for the conditional output kernel already
    obtained. Given the fields, the marks have independent Poisson laws, and hence the output law after removing them is
  $ ⨂_i integral K_i^(upright("marks")) \( h \, hat(h) \, pi_i \; dot.op \) thin
    "Pois"_(rho mu_h \|_(U_i)) \( upright(d) pi_i \) . $
  This proves the fields-only assertion. It uses no independence between the marks and the numerical arrays,
    whose tests may depend on those marks. Alternatively, retain each $Pi_i$ together with its array as the local
    output. Finite joint consistency and the countable prescription library then give the kernel on all tests.
    Lemmas 5 and 6 identify its buffered exhaustion with the corresponding observations from the actual graph.
    No additional conditioning on exterior numerical outputs is used. ◻
]

#thm([Proposition 2.8.])[
  (Coordinate and unit transport).  #emph[The kernels in Proposition 8 can be retained jointly with the following
    transformations.]
  + #emph[For a fixed conformal coordinate map $phi.alt$, pull back the fields by
$ g mapsto g compose phi.alt + Q log \| phi.alt' \| \, wide hat(g) mapsto hat(g) compose phi.alt - chi arg phi.alt' . $

 The numerical-array law is transported by the corresponding spatial relabeling of its tests.]
  + #emph[Fix $v = 2^k$, $k in bb(Z)$, and put $c_v = gamma^(- 1) log v$.
    Expressing the surface in the field $g - c_v$ replaces area time by time divided by $v$ and replaces rate $m$
    by rate $m v$. Electrical energies and extremal lengths are unchanged by this relabeling.
    If a numerical output is divided by $b_m$, retain this same factor $b_m$ in the $m
    v$ experiment of the joint extraction.]
  + #emph[Write $K_(\( 1 \))$ for the original local law, including the mark kernel,
    and $K_(\( v \))$ for the law of the corresponding transformed rate experiment. Then
#[#set math.equation(numbering: n => "(2.14)")
 $ K_(\( v \)) \( g \, hat(g) \) = "Relabel"_v K_(\( 1 \)) \( g + c_v \, hat(g) \) . $ <inp:unit-kernel>]

 All fixed dyadic indices, their transformed templates, and the required Poisson layers may be retained in one
   joint extraction.]
] <inp:transport>

#proof[
  This is the finite-experiment identity underlying Proposition “Intrinsic transport and fixed quantum units” in
    [22]. A conformal change leaves quantum areas, frontier lengths, directed seam roles,
    and their relative heights unchanged. Hence it leaves the finite instruction graph unchanged and only changes
    the projection of its labels.
  Adding $c_v$ multiplies areas by $v$ and boundary lengths by $sqrt(v)$. Thus the block inputs transform as
  #[#set math.equation(numbering: n => "(2.15)")
   $ ell mapsto v ell \, wide z \( t \) mapsto sqrt(v) thin z \( t \/ v \) \, wide
     o mapsto sqrt(v) thin o . $ <inp:block-units>]
  Cuts transform with time; band endpoints, their anchors, and selected minima transform with height.
    A rate-$m$ Poisson string of duration $v ell$ is, after this time change,
    a rate-$m v$ string of duration $ell$. The height lattices agree because $sqrt(v) thin \( m v \)^(- 1 \/ 2) =
    m^(- 1 \/ 2)$. Matching strips and minimum comparisons are exactly the same integer tests.
    Therefore the numerical costs on the resulting graph are identical.
    Smooth sampling densities may change, but Lemma 7 leaves the conditional kernels unchanged.
  The cuts must be transformed too. At field $g + c_v$, the layer corresponding to a fixed layer at field $g$ has
    time intensity divided by $v$. Its spatial intensity is then unchanged.
    Choose a countable family of layers closed under these changes,
    with independent layers and nested refinements as required.
    Their joint input and output identities give (2.14). A fixed field translation is locally equivalent to the
    Gaussian reference law, as specified below; this makes the identity valid under that fixed reference marginal
    as well. No estimate uniform in unbounded $v$ is asserted or needed. ◻
]

For exhaustion of the plane we retain the joint cone normalization,
  not only the deterministic-coordinate kernel identity. In the circle-average embedding define

#[#set math.equation(numbering: n => "(2.16)")
 $ r_v & = sup { r > 0 : h_r \( 0 \) + Q log r = c_v } \,\
h^(\( v \)) & = h \( r_v thin dot.op \) + Q log r_v - c_v \, wide hat(h)^(\( v \)) = hat(h) \( r_v thin dot.op \) \,\
eta^(\( v \)) \( t \) & = r_v^(- 1) eta \( v t \) \, wide Z^(\( v \)) \( t \) =
  v^(- 1 \/ 2) Z \( v t \) . $ <inp:joint-zoom>]

The complete marginal has the original cone peanosphere law,
  by the joint zoom in [22] and [5] Proposition 4.13(i). The positive dilation preserves the independent
  stationary-phase imaginary-field law. These transformations are applied to the contour, raw arrays,
  and full background together, before disintegration. Thus field-dependent reembedding does not require
  substituting a random map into separately chosen versions of deterministic-coordinate kernels.
  Moreover $r_(2^k) arrow.r oo$ as $k arrow.r oo$: the level $c_(2^k)$ diverges, whereas $h_r \( 0 \) +
  Q log r$ is bounded above on compact sets of radii and tends to $- oo$ as $r arrow.b 0$.
  Ordinary patches inside these normalized disks therefore exhaust the plane away from the cone point.

#thm([Lemma 2.9.])[
  (Ordinary Gaussian reference patches).  #emph[On a buffered patch compactly inside the cone’s normalization disk
    and away from its marked point, the actual real and imaginary fields are locally equivalent to Gaussian
    reference restrictions. The real-field pinning circle can be fixed outside all testing buffers.
    This comparison preserves the actual additive constant and can be made after any fixed affine change of
    coordinates.]
  #emph[Adjoining any of the local kernels above preserves the same field-only Radon–Nikodym derivative.
    Consequently one fixed density truncation transfers high-probability events uniformly over all kernels
    attached to that reference marginal. Fixed additive real-field shifts and the fixed coordinate transforms used
    in Proposition 9 preserve the corresponding local null sets.]
] <inp:gaussian>

#proof[
  This is Lemma “Ordinary cone patches and exterior Gaussian pins” in [22].
    Inside the unit disk the circle-average cone field has the law of the circle-average-zero whole-plane GFF
    minus $gamma log \| z \|$. On the patch, this deterministic term has a smooth extension supported away from
    the marked point and the pinning circle. The Cameron–Martin theorem and Gaussian domain comparison give local
    equivalence, with the actual constant retained. The same argument applies to a fixed additive shift on the
    patch. The imaginary field is independent and is interpreted modulo its angular period;
    its local restrictions have the corresponding Gaussian equivalence and stationary-phase coordinate invariance.
  If $Z = upright(d) nu \/ upright(d) mu$ is a field density and $K_i$ any of the conditional kernels,
    then for every event $A$ and every $R > 0$,
  #[#set math.equation(numbering: n => "(2.17)")
   $ \( nu ⊗ K_i \) \( A \) lt.eq R \( mu ⊗ K_i \) \( A \) +
     bb(E)_mu \[ Z upright(bold(1))_({ Z > R }) \] . $ <inp:density-truncation>]
  The last term does not depend on $i$. This proves the uniform probability comparison;
    local equivalence gives both directions for probability-one events.
    A test domain containing the full pinning circle is excluded by the stated buffer condition. ◻
]

#thm([Lemma 2.10.])[
  (Primal–dual reflection).  #emph[The joint local-array laws are invariant under exchanging the primal and dual
    graphs and reflecting their coordinate tests. They are also covariant under fixed rigid motions,
    with the natural transformations of the two fields.]
] <inp:reflection>

#proof[
  The discrete assertion follows by exchanging the two independent coordinate strings and their forests.
    In the continuum, spatial reflection combined with negation of the reflected imaginary field exchanges the two
    angle trees and the two sides of the curve. The space-filling ordering is preserved:
    it can be read either from the $+ pi \/ 2$ tree with right merges or from the $-
    pi \/ 2$ tree with left merges, as in [18] Section 1.2.3, Figure 1.16.
    Both descriptions are exchanged by this operation, so no reversal of area time is involved.
    The cone field and the independent stationary-phase imaginary field have the required reflected law.
    Boundary lengths exchange $L$ and $R$, and conditional sampling of the background therefore gives the same
    operation on the joint raw-array limit. The intrinsic kernels and the selector construction then transport the
    spatial tests. Fixed rotations and translations follow from coordinate covariance and local field equivalence
    on buffered ordinary patches. A countable group of such transformations can be retained simultaneously. ◻
]

#thm([Proposition 2.11.])[
  (Local-array interface).  #emph[From every sequence of resolutions tending to infinity one can extract,
    jointly with the continuum peanosphere background, all compactified numerical tests described above,
    on both graphs and at every fixed dyadic area offset. Prescribed deterministic normalizing factors may be
    retained even when they tend to zero. In this extraction:]
  + #emph[complete buffered graph pieces and the selector sandwich of Lemmas 5 and 6 identify local tests with
    actual graph observations;]
  + #emph[Proposition 8 supplies buffer-local conditional kernels and product laws in disjoint domains;]
  + #emph[Proposition 9 and Lemmas 10–11 supply their coordinate, unit, Gaussian-reference,
    and primal–dual comparisons;]
  + #emph[these properties persist under further joint extraction and under countable exhaustion with strict margins.]
] <inp:array-interface>

#proof[
  All numerical coordinates belong to compact spaces, and the input contours are tight on bounded windows.
    Include the countable transformed instruction lists and mark layers before the diagonal extraction.
    The preceding results apply to every finite collection. Their exact density and bridge calculation passes to
    any further limit by compact truncation; the continuum background passes by the $L^1$ conditional sampling
    argument. Countable intersection and the selector exhaustions give the stated simultaneous version. ◻
]

The interface provides laws and exact local observability.
  The bounds which prevent degeneration of the electrical tests,
  and the identification of their variational limits, are proved next.

== 3 Nondegeneration of the electrical networks <sec:nondegeneration>

We first prove that a fixed conformal annulus admits cutoffs of bounded electrical energy on both sewn graphs.
  The bound will depend on the annulus aspect and the coordinate patch,
  but not on its radius or the discrete resolution. This is the coercivity input for the variational argument in
  the next section. Throughout this section we work with the bilateral sewing, at rates $m arrow.r oo$,
  and use the coupled extractions and projections $pi_m$ of Proposition 12.

The proof combines two uses of extremal length. A lower bound supplies densities that charge every crossing of an
  annulus. If lower bounds failed, a suitable quantile would instead supply probability measures on crossing paths
  with very small squared traffic. Annular densities make their projected limits rectifiable.
  Locality then forces a transverse crossing witness on the other graph, contradicting the small traffic.
  The annular-density, rectifiable-flow, and local-germ strategy is developed for flag extremal length in [21]
  Section “The canonical conformal structure”. We adapt it to edge energies on paired primal and dual graphs.

=== 3.1 Extremal length and local germs <extremal-length-and-local-germs>

Let $cal(P)$ be a nonempty family of paths in a finite graph, with no path of length zero.
  Edge occurrences are counted with multiplicity. Its edge extremal length is

#[#set math.equation(numbering: n => "(3.1)")
 $ "EL" \( cal(P) \) =
   sup_(a : E arrow.r \[ 0 \, oo \))
   frac(#scale(x: 120%, y: 120%)[\(] inf_(P in cal(P)) sum_(e in P) a \( e \) #scale(x: 120%, y: 120%)[\)]^2,
   sum_(e in E) a \( e \)^2) \, $ <nd:el-definition>]

where the zero density is omitted. For a probability measure $nu$ on paths, write $j_nu \( e \) =
  integral \# { upright("occurrences of ") e upright(" in ") P } thin
  nu \( upright(d) P \)$ for its unsigned edge traffic.

#thm([Lemma 3.1.])[
  (Densities and traffic).  #emph[For a finite family of simple paths,
#[#set math.equation(numbering: n => "(3.2)")
 $ "EL" \( cal(P) \) = min_nu sum_e j_nu \( e \)^2 . $ <nd:traffic-identity>]

 If $cal(P)$ consists of all paths between two disjoint wired sets in a finite subgraph,
   then $"EL" \( cal(P) \)$ is the reciprocal of the minimum energy $sans(e) \( u \)$ subject to the values zero
   and one on the two sets. In particular, $"EL" \( cal(P) \) gt.eq
   b > 0$ supplies a density charging each path by one with squared norm at most $1 \/ b$.]
] <nd:el-traffic>

#proof[
  The traffic vectors form the convex hull of the path-incidence vectors.
    Let $j$ be its point nearest to the origin. The supporting inequality $chevron.l j \, j_P chevron.r gt.eq
    parallel j parallel_2^2$ for every path $P$ shows that the density $j$ gives a value at least $parallel j
    parallel_2^2$ in (3.1). Conversely, averaging path length under any $nu$ and applying Cauchy–Schwarz gives
    $"EL" \( cal(P) \) lt.eq parallel j_nu parallel_2^2$. This proves (3.2).
    In the wired-set case loops may be removed from paths. Absolute potential increments give a charging density,
    while the distance from the first set in any charging density, clipped at one,
    gives an admissible potential whose energy is at most the squared density norm.
    These two constructions prove the reciprocal identity. ◻
]

We will also use a consequence of the local conditional kernels from Section 2.
  A #emph[point-germ readout] is a jointly measurable random function $Y \( z \)$ whose value at $z$ can be read
  from the fields and extracted arrays in every neighborhood of $z$.
  The readout may use countably many tests with strictly positive domain margins.
  In particular, an assertion that specified tests succeed at every sufficiently small scale is a point-germ readout.

#thm([Lemma 3.2.])[
  (Determinism of point germs).  #emph[In an ordinary field chart,
    every bounded real point-germ readout of the extracted local arrays is, almost surely,
    equal at Lebesgue-almost every point to a deterministic measurable function of the point.
    The same conclusion holds for readouts with values in a separable metric space,
    using a countable family of bounded coordinates that separates its points.]
] <nd:germs>

#proof[
  Let $cal(H)$ denote the pair of fields. By Proposition 8,
    $bb(E) \[ Y \( z \) divides cal(H) \]$ is measurable with respect to the field restrictions to every
    neighborhood of $z$. This field germ is trivial. Indeed, for a zero-boundary Gaussian free field,
    the intersection of the Gaussian subspaces generated by restrictions to shrinking disks is orthogonal to the
    Gaussian variables associated with Dirichlet functions vanishing near $z$.
    Such functions are dense in the Dirichlet space: logarithmic cutoffs express the zero capacity of a point.
    The intersection is thus zero, and the Gaussian chaos decomposition gives triviality of the corresponding
    sigma-field. Apply this to both independent fields. Local equivalence in Lemma 10 transfers the conclusion to
    the ordinary chart, including the imaginary field modulo its period.
    Consequently $bb(E) \[ Y \( z \) divides cal(H) \] = y \( z \)$ for a deterministic $y$.
  For distinct $z \, w$, disjoint sufficiently small neighborhoods and the product-kernel assertion give
    conditional independence of $Y \( z \)$ and $Y \( w \)$ given $cal(H)$.
    Hence, for every rational disk $D$ compactly in the chart,
  $ bb(E) [(integral_D \( Y \( z \) - y \( z \) \) thin upright(d) z)^2] = 0 . $
  The diagonal in $D times D$ has Lebesgue measure zero. Countably many disks and differentiation of integrals
    prove the assertion. Applying the argument to bounded separating coordinates proves the final statement. ◻
]

#prodef([Remark 3.3.])[
  (Coordinate and dual symmetries).  For a readout defined intrinsically from local tests,
    its deterministic values respect the coordinate transports of Proposition 9.
    More explicitly, let $cal(A)$ be the extracted local array and let $T
    cal(A)$ denote its relabeling by a fixed translation or rotation $T$. A covariant readout satisfies
  $ Y_(T cal(A)) \( T z \) = T dot.op Y_(cal(A)) \( z \) \, $
  where $T dot.op$ is the natural action on its values or direction labels.
    The transport proposition identifies the law of $T cal(A)$ with the same extracted kernel attached to the
    transformed fields. Local equivalence of these field laws and Lemma 14 therefore give $y \( T z \) =
    T dot.op y \( z \)$ almost everywhere. This uses a relabeling in the joint extraction,
    rather than a newly chosen subsequential kernel. For translation-covariant scalar readouts it implies
    constancy: first use rational translations, then continuity of translations in local $L^1$.
    Rotations act on direction or matrix readouts in the stated natural way,
    and a countable dense rotation group suffices. Finally, Lemma 11 exchanges the two graphs and reflects the
    tests. These observations apply on overlapping ordinary charts and identify their deterministic values.
    The definition through strict margins is important here: a transported test is still an admissible test after
    an arbitrarily small reduction of its clearance, by Lemma 6.
] <nd:germ-symmetries>

=== 3.2 Annular barriers at absolute quantum scales <annular-barriers-at-absolute-quantum-scales>

Choose once and for all an ordinary cone patch, strictly inside the normalization disk and away from the cone
  point. After a fixed affine coordinate change, it contains the annulus ${ 1 \/ 16 < \| z \| <
  4 }$ and the buffers needed below. For each graph take paths between the vertex sets selected by visits in the bands

$ A_1 = { .9 < \| z \| < 1.1 } \, wide A_2 = { 1.9 < \| z \| < 2.1 } \, $

confined to the actual subgraph selected in $A_0 = { .7 < \| z \| < 2.3 }$.
  Denote the extremal lengths of these primal and dual path families by $Z_m^(upright(p))$ and $Z_m^(upright(d))$.
  Here selection uses the continuum visit labels in the coupling, with a fixed step-endpoint convention.
  This defines a comparison variable; it need not itself be a local instruction test.
  Properness makes the selected labels finite. All their incidences and adjoining star layers are protected in
  larger bounded contour windows. The projection and tube properties of Proposition 3 therefore apply.
  If the ports overlap or there is no crossing, give the comparison the value one.
  The probability of these exceptions tends to zero.

Let $Z_m = min { Z_m^(upright(p)) \, Z_m^(upright(d)) }$.
  Fix $epsilon > 0$, to be chosen below, and choose deterministic $q_m > 0$ such that

#[#set math.equation(numbering: n => "(3.3)")
 $ bb(P) \[ Z_m lt.eq 2 q_m \] gt.eq epsilon \/ 2 \, wide bb(P) \[ Z_m gt.eq q_m \/ 2 \] gt.eq 1 -
   2 epsilon . $ <nd:quantiles>]

We use rates in a countable set closed under dyadic multiplication and division,
  for example the positive dyadic rationals. The quantiles can be chosen bounded below on every bounded rate
  interval in $\[ 1 \, oo \)$. To see this, first bound the continuum preimage window with high probability,
  then bound the Poisson step count and the degrees of the finitely many encountered vertices.
  Local finiteness of the bilateral sewing makes these bounds uniform at bounded rates.
  A nonexceptional finite graph with at most $L$ edges has positive crossing extremal length at least $1 \/ L$.

The comparison in (3.3) produces genuinely local barrier events.
  For example, select ports near radii $.96$ and $2.04$, and confinement between $.94$ and $2.06$,
  with strictly positive slack. Every path from ${ \| z \| < .6 }$ to ${ \| z \| >
  2.5 }$ contains such a crossing portion. A complete local prescription covering this intermediate shell exists
  by Lemma 5; Lemma 6 selects the ports and confinement. Its path family is a subfamily of the comparison family,
  so its EL is no smaller.

The selection can depend on the limiting fields without changing this probability comparison.
  To see the quantifiers, let $j$ enumerate pairs of primal and dual prescription templates.
  Let $sans(A)_j$ be the local event that both templates’ seam, cap,
  and positive-margin conditions cover the required shell and implement the selector sandwich.
  These conditions are read from the local fields and marks;
  their proved consequence is eventual completeness on the actual graph.
  They do not test completeness by inspecting exterior numerical arrays.
  For any deterministic units $b_m > 0$ retained in the extraction,
  write $xi_j$ for the minimum of the two retained limits of $"EL" \/ b_m$.
  Thus success supplies barriers on both graphs. If a comparison event asserts $Z_m \/ b_m gt.eq a > 0$,
  retain its indicator in a further coupling. On the event $E$ where the limiting indicator is one,
  choose an applicable $j$ from the limiting local cell data, keeping it fixed as $m arrow.r oo$.
  Its eventual domination of the comparison gives $xi_j gt.eq a$. Consequently

$ E subset.eq union.big_j #scale(x: 120%, y: 120%)[\(] sans(A)_j ∩ { xi_j > a \/ 4 } #scale(x: 120%, y: 120%)[\)] . $

The union on the right is a local event with at least the limiting comparison probability.
  Simultaneous convergence of the countably retained tests justifies the random choice of $j$;
  no deterministic bound on that index is required. This argument uses the comparison for its probability and the
  local union for its conditional kernel, without conditioning that kernel on $E$.

We recall precisely the annulus input that spreads these barriers through a chart.
  It is Lemma “All-point absolute quantum-scale annuli” in [22] Section “Annuli at absolute quantum scales”.
  Write $v_i = 2^(- i)$ for the backward quantum-area offsets.
  By Proposition 9, graph costs are unchanged at these offsets;
  any deterministic denominator $b_m$ is kept the same across the offset experiments in one extraction.

#thm([Lemma 3.4.])[
  (Aligned annular barriers).  #emph[Fix an ordinary chart and a compact subset of its interior.
    Suppose that, at every fixed backward index $i$, a local unit-annulus event has probability at least $1 -
    epsilon_(*)$ in the reference law and supplies, on both graphs,
    a crossing density of charge one and squared norm at most $C \/ b_m$.
    Here $b_m > 0$ is deterministic and the events belong to the common extracted offset kernels.
    For a sufficiently small reference threshold $epsilon_(*) > 0$, there are constants $0 < a < B$,
    $c > 0$ such that the following holds almost surely for all sufficiently large integers $N$.
    Every point in the compact set belongs to the central holes of at least $c
    N$ pairwise disjoint buffered annuli whose local barrier events hold.
    Their radii belong to one fixed geometric sequence in $\[ e^(- B N) \, e^(- a N) \]$,
    their centers lie on deterministic meshes of spacing comparable to their radii,
    and their assigned indices belong to ${ N \, dots.h \, 2 N }$.
    For each fixed such finite configuration, its density conclusions hold on the discrete graphs for all
    sufficiently large $m$.]
] <nd:coverage>

#proof[
  Apply the cited lemma to the kernels of Proposition 8, with the intrinsic transport of Proposition 9.
    Its hypotheses are the local product rule, the actual-field coordinate rule,
    and a common fixed-index change of quantum unit; all are supplied by Proposition 12.
    The real-field parameter $Q = 2 \/ gamma + gamma \/ 2$ is greater than two.
    The cost-index factor in the stated annulus lemma is undone in our numerical tests;
    the proof of that lemma uses the factor only in the indexed observation rule.
    Thus it applies equally to the present unchanged network costs.
    Local Poisson marks are included in the kernels with their corresponding intensities.
  For completeness, the probability transfer needed here is a fixed one.
    Work first with the zero-boundary Gaussian reference patch of that lemma.
    Local equivalence, retaining the actual additive constant of the real field,
    gives a single absolute-continuity modulus from our chosen ordinary cone patch to this reference patch.
    Choose $epsilon$ in (3.3) sufficiently small that a barrier event of probability $1 - 2 epsilon$,
    with a strict threshold as above, has reference probability at least $1 - epsilon_(*)$.
    The annulus lemma gives an exponentially small failure probability at scale $N$.
    Borel–Cantelli gives the eventual assertion. A fixed local change of field law transfers this probability-one
    assertion to any ordinary chart. No likelihood bound uniform over those charts is needed.
    Finally, success of an annulus is the existence of a retained EL coordinate strictly above a fixed threshold.
    No density or path is retained as an additional output. All centers, radii, indices,
    and prescription templates belong to countable libraries.
    On their simultaneous convergence event, the successful local prescription on each realized annulus gives an
    eventual discrete EL lower bound. Lemma 13 then constructs a density on that finite graph.
    For fixed $N$ only finitely many annuli are used, so their thresholds in $m$ can be met simultaneously,
    even though the successful annuli and prescriptions were selected from the fields and arrays.
    Thus $N$ is fixed before $m$ is sent to infinity. ◻
]

The geometric content of these many annuli is an area bound for a density that charges macroscopic displacement.
  For a set $U subset bb(C)$ write $U^(+ r) = { z : "dist" \( z \, U \) < r }$, and put $R_N = e^(- a N)$.

#thm([Lemma 3.5.])[
  (Densities controlling displacement).  #emph[Under the hypotheses of Lemma 16,
    let $U$ be a finite union of open boxes compactly in a fixed ordinary chart.
    For all sufficiently large $N$, and then all sufficiently large $m$,
    there is on either graph a nonnegative density $g_(m \, N \, U)$, supported near $U$, such that
#[#set math.equation(numbering: n => "(3.4)")
 $ b_m sum_e g_(m \, N \, U) \( e \)^2 lt.eq C "vol" \( U^(+ C R_N) \) . $ <nd:density-area>]

 Every path subinterval whose projection is contained in $U$ pays at least
#[#set math.equation(numbering: n => "(3.5)")
 $ c "diam" \( pi_m \( P \) \) - C R_N - o_m \( 1 \) . $ <nd:density-charge>]

 The constants depend only on the smaller chart and the fixed annular geometry.
   The error and the threshold in $m$ may depend on $N$ and $U$. Charges add over disjoint path subintervals.]
] <nd:densities>

#proof[
  On a successful shell of radius $r$, multiply its barrier density by $r$.
    Its charge is now $r$ and its squared norm is at most $C r^2 \/ b_m$.
    Sum these densities over the shells whose central holes meet $U$, using one density for each geometric shell,
    and divide by $N$. At any fixed radius the buffered shells have bounded overlap,
    because their centers lie on a mesh of comparable spacing. There are at most $C N$ radii.
    Cauchy–Schwarz across these radii gives (3.4); all the involved shells lie within distance $C R_N$ of $U$.
  For the charge estimate choose a coordinate in which the projected path has oscillation comparable to its
    diameter. Consider levels between its extreme values, discarding $C R_N$ near either end.
    At a visit to each remaining level, the point lies in at least $c N$ central holes.
    Since all these shells have radius at most $R_N$, the path crosses each of them before reaching a suitable
    extreme. A shell of radius $r$ can account for at most $C r$ of the levels.
    Integrating over levels therefore bounds the total length in the summed densities from below by $c
    N$ times the remaining coordinate oscillation. Divide by $N$.
    At fixed $N$ the vanishing projected mesh permits full-edge crossing portions;
    the discarded endpoint pieces contribute $o_m \( 1 \)$. Distributing each edge’s density uniformly along that
    edge permits fractional first and last edges and makes additivity over disjoint intervals explicit. ◻
]

=== 3.3 Small traffic would force transverse crossings <small-traffic-would-force-transverse-crossings>

We now prove the quantitative fact needed for unnormalized energies.

#thm([Proposition 3.6.])[
  (Nondegeneration).  #emph[For the quantiles in (3.3), with $epsilon$ chosen as in Lemma 16,
#[#set math.equation(numbering: n => "(3.6)")
 $ liminf_(m arrow.r oo) q_m > 0 . $ <nd:positive-quantile>]

 The conclusion holds along all rates in the chosen countable set.]
] <nd:nondegeneration>

#proof[
  Suppose otherwise. Choose approximate record lows $m arrow.r oo$ such that $b_m := q_m arrow.r 0$ and
  $ q_s gt.eq c b_m wide \( 1 lt.eq s lt.eq m \, med s upright(" in the chosen rate set") \) $
  for a fixed $c > 0$. The bounded-rate lower bounds ensure $m arrow.r oo$.
    For each fixed $i$, the quantile at $m 2^(- i)$ therefore gives the high-probability barrier event in units
    $b_m$. Extract jointly with all these backward offsets. Lemmas 16 and 17 apply in the comparison region.
  The first inequality of (3.3) and Lemma 13, on the other hand,
    supply with positive probability one graph’s probability flow $nu_m$ between the two macroscopically separated
    ports, confined in a fixed compact set, with
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_e j_(nu_m) \( e \)^2 lt.eq C b_m . $ <nd:small-traffic>]
  Retain the event indicator, choose a graph on a positive-probability subevent,
    and work pathwise in a further coupling. We establish two properties of the projected flows before using locality.
  #emph[Compactness of the flows.] For a path $P$, let $J_h \( P \)$ be the maximum number of disjoint
    subintervals making a projected advance of at least $h$. Choose $N$ large enough that $C R_N < c h \/
    2$ in (3.5), and then take $m$ large. Use a fixed larger box union $U$ containing the compact confinement.
    By (3.4), (3.7), and Cauchy–Schwarz,
  #[#set math.equation(numbering: n => "(3.8)")
   $ integral J_h \( P \) thin nu_m \( upright(d) P \) lt.eq C \/ h . $ <nd:crossing-count>]
  Thus the paths are tight after reparameterization. One explicit choice of parameters is useful.
    At every dyadic $h = 2^(- l)$ place clock atoms at successive completed moves of distance $h$,
    each with mass $2^(- l) \/ \( 1 + J_h \( P \) \)$. Add the original traversal time of total mass one,
    invert this clock with pauses at its atoms, and rescale its total duration to one.
    On sets where every $J_(2^(- l))$ has a fixed bound, these parameterized paths are equicontinuous:
    an oscillation of several times $2^(- l)$ must cross a whole atom interval of a fixed positive duration.
    The bounds (3.8) and a countable union bound make such sets have arbitrarily large flow probability.
    The finitely many initial resolutions omitted at an individual scale can be included by enlarging its bound.
    A subsequence therefore converges to a probability law $nu$ on continuous paths. Their endpoints remain separated.
  #emph[An absolutely continuous measure of arclength.] For at most $J$ disjoint path intervals compactly confined
    in an open box union $U$, the same argument gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ integral sup sum_(k = 1)^J \| pi_m \( P \( t_k \) \) - pi_m \( P \( s_k \) \) \| thin nu_m \( upright(d) P \)
     lt.eq C sqrt("vol" \( U^(+ C R_N) \)) + C J R_N + o_m \( 1 \) . $ <nd:variation-bound>]
  The supremum may be taken over rational intervals with closure in the prescribed open condition.
    It is lower semicontinuous under uniform convergence. Pass first to the path limit, next let $N arrow.r oo$,
    and finally let $J arrow.r oo$. These interval sums exhaust variation on open sets.
    With a larger $U$ containing all paths, they first show that $nu$-almost every path is rectifiable with
    integrable length. Its average arclength measure $Lambda$ consequently satisfies
  #[#set math.equation(numbering: n => "(3.10)")
   $ 0 < Lambda \( bb(C) \) < oo \, wide Lambda \( U \) lt.eq C sqrt("vol" \( U \)) . $ <nd:length-area>]
  The positivity follows from the separated endpoints. Open box covers now show $Lambda lt.double "vol"$.
  We next convert a tangent of a limiting path into a local event.
    Choose a sufficiently fine finite grid $cal(W)$ of unoriented directions,
    closed under quarter-turn and reflection in a coordinate axis.
    For $z in bb(C)$, $w in cal(W)$, and $s > 0$, consider the tube
  #[#set math.equation(numbering: n => "(3.11)")
   $ T \( z \, w \, s \) = { z + t w + l w^perp : \| t \| < 2 s \, med \| l \| < s \/ 16 } . $ <nd:tube>]
  A #emph[strict crossing test] in this tube has ports strictly beyond the two lines $t = - s$ and $t = s$,
    and has confinement and ports with positive clearance from the tube boundary.
    It is computed on a complete local prescription. Accept all countably many selectors with these properties,
    and require that the prescription be readable within a fixed-factor enlargement of the tube,
    with positive margins. Lemma 6 makes existence of such a test independent of the particular selector library
    after arbitrarily small relaxation of the margins.
  At $Lambda$-almost every point there is a direction $w in cal(W)$ for which,
    at every sufficiently small dyadic scale $s$, one of these tests on the graph supplying $nu_m$ has finite
    limiting $"EL" \/ b_m$. Indeed, arclength parameterization gives a unit tangent at almost every parameter of
    almost every rectifiable path. The fine direction grid puts that tangent inside one of the tubes with strict
    slack at all sufficiently small scales. Almost every path is in the support of $nu$.
    The existence of the strict crossing subpath is an open path event,
    so it has positive $nu$-probability at each such fixed scale.
    Restrict $nu_m$ to this event, take the crossing portions, and normalize.
    Its traffic still has squared norm $O \( b_m \)$, with a constant allowed to depend on the scale and the event
    probability. The complete-selector sandwich gives the asserted finite limiting test value.
    The statement can be imposed simultaneously at the countably many dyadic scales.
  Let $I_w^(upright(p)) \( z \)$, respectively $I_w^(upright(d)) \( z \)$,
    be the indicator of existence of these finite-$"EL" \/ b_m$ tests at every sufficiently small dyadic scale,
    on the primal or dual graph. These are jointly measurable point-germ readouts:
    the tests and their fixed-factor buffers eventually lie in every neighborhood of $z$.
    The preceding paragraph and (3.10) give a positive-area set of witnesses on our positive-probability event.
    Lemma 14 and Remark 15 therefore imply that one of these indicators has deterministic value one almost
    everywhere in ordinary charts. Reflection exchanges the graphs;
    rotations within the finite direction grid then give the other graph’s indicator in the perpendicular
    direction. The null sets can be discarded simultaneously,
    since only finitely many directions and two graphs are involved.
  Choose a point with both perpendicular indicators equal to one,
    and then a sufficiently small common dyadic scale. We obtain primal and dual strict crossing families with
    $"EL" = O \( b_m \)$ in perpendicular tubes, as illustrated in Figure 2.
    Every path of one family meets every path of the other upstairs by the transverse-tube rule in Proposition 3.
    Such an intersection uses an edge and its dual. Choose traffic minimizers $j_m \, j_m^(*)$ by Lemma 13.
    Their unsigned pairing satisfies
  $ 1 lt.eq sum_e j_m \( e \) j_m^(*) \( e^(*) \) lt.eq #scale(x: 180%, y: 180%)[\(] sum_e j_m \( e \)^2
    #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) #scale(x: 180%, y: 180%)[\(] sum_(e^(*)) j_m^(*) \( e^(*) \)^2
    #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) = O \( b_m \) \, $
  contradicting $b_m arrow.r 0$. This proves (3.6). ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((-3.15, -0.441), (3.15, 0.441), fill: rgb("#ededff"), stroke: none)
  rect((-0.441, -2.363), (0.441, 2.363), fill: rgb("#fff0e0"), stroke: none)
  rect((-3.15, -0.441), (3.15, 0.441), stroke: (paint: rgb("#7373ff"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((-0.441, -2.363), (0.441, 2.363), stroke: (paint: rgb("#b25a00"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  bezier((-2.835, 0.0525), (-0.2625, 0.0525), (-1.89, -0.2625), (-1.05, 0.252), stroke: (paint: rgb("#0000bf"), thickness: 0.8pt, miter-limit: 10))
  bezier((-0.2625, 0.0525), (2.835, -0.0315), (0.5775, -0.1575), (1.68, 0.2835), stroke: (paint: rgb("#0000bf"), thickness: 0.8pt, miter-limit: 10))
  bezier((0.084, -2.1), (0.021, 0.0525), (-0.273, -1.26), (0.2415, -0.63), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  bezier((0.021, 0.0525), (-0.021, 2.1), (-0.189, 0.735), (0.2415, 1.312), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  line((-2.257, -0.441), (-2.257, 0.441), stroke: (paint: rgb("#0000bf"), thickness: 0.8pt, miter-limit: 10))
  line((2.257, -0.441), (2.257, 0.441), stroke: (paint: rgb("#0000bf"), thickness: 0.8pt, miter-limit: 10))
  line((-0.441, -1.575), (0.441, -1.575), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  line((-0.441, 1.575), (0.441, 1.575), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10))
  content((1.785, 0.5145), [#text(fill: rgb("#0000bf"))[primal crossing]], anchor: "south", padding: 0.1176cm)
  content((0.5565, 1.418), [#text(fill: rgb("#cc6600"))[dual crossing]], anchor: "west", padding: 0.1176cm)
  circle((0, 0), radius: 0.04586, fill: black, stroke: none)
  content((0.105, -0.147), [$z$], anchor: "north-west", padding: 0.1176cm)
})],
  caption: [Figure 2: The two narrow tubes force transverse passages. The drawing shows only projected path ranges; it asserts neither injectivity of the projection nor shape control of discrete edges. The topological input lifts this configuration to an intersection of a primal edge with its paired dual edge. ],
) <nd:transverse-figure>

=== 3.4 Uniformly bounded ring cutoffs <uniformly-bounded-ring-cutoffs>

We can now apply the annular construction in constant energy units,
  rather than the hypothetical vanishing units used in the contradiction.

#thm([Proposition 3.7.])[
  (Ring cutoffs).  #emph[Fix a compact subpatch of an ordinary chart and an aspect ratio $tau > 1$.
    Along a coupled further extraction from any rate sequence, there is a constant $C$,
    depending only on the chart and $tau$, with the following property.
    For every fixed disk $overline(B \( z \, tau r \))$ contained with a margin in that subpatch,
    both graphs eventually admit functions $chi_m$ valued in $\[ 0 \, 1 \]$ such that
$ chi_m = 1 quad upright("on every lift of ") overline(B \( z \, r \)) \, wide chi_m = 0 quad
  upright("on every lift outside ") B \( z \, tau r \) \, wide sans(e) \( chi_m \) lt.eq C $

 on the primal graph, with $sans(e)^(*) \( chi_m \) lt.eq C$ on the dual.
   Their energy is supported in the indicated ring, up to vanishing projected mesh.
   The constant is independent of $z \, r \, m$; the threshold in $m$ may depend on the fixed disk.
   These assertions hold simultaneously for the countable buffered disk tests,
   and extend to arbitrary fixed disks by strict inner and outer margins.]
] <nd:cutoffs>

#proof[
  Proposition 18 and the second quantile bound in (3.3) give the barrier hypotheses with deterministic units equal
    to one, at every fixed backward offset. Choose an intermediate closed ring whose two radii lie strictly
    between $r$ and $tau r$, with all three resulting radial widths comparable to $\( tau - 1 \) r$.
    Cover it by a finite union $U$ of open boxes with closure strictly inside the target ring and area
    $O_tau \( r^2 \)$. Apply Lemma 17 to this $U$. First choose $N$ so large that $R_N$ is small compared with the
    intermediate width and both collars, and then take $m$ large. The density is supported in the target ring.
    Every full ring crossing has a subcrossing through the intermediate ring, confined to $U$,
    with advance comparable to $\( tau - 1 \) r$. The density therefore charges it by a fixed multiple of this
    width. After division by the width, the squared density norm is bounded by $C \( tau \)$ times the chart
    constant. The clipped-distance construction of Lemma 13 gives the cutoff,
    with exact constants on all inner and outer lifts. One may carry out the construction on a protected capped
    sphere and extend by constants beyond the chart. Only the ring density changes the function.
  Countable buffered comparisons make all the fixed tests available in one extraction.
    A disk outside the chosen countable library is handled by choosing a nearby library center,
    an inner library disk containing $overline(B \( z \, r \))$,
    and a concentric outer library disk contained in $B \( z \, tau r \)$.
    Their radii can be chosen comparable to $r$, with constants depending only on $tau$,
    and their radial separation at least $c \( tau - 1 \) r$.
    The preceding density estimate bounds the cutoff energy by a chart constant times the squared ratio of outer
    radius to radial separation. It therefore gives a uniform $C \( tau \)$ for these library tests,
    with the required constants on the original inner and outer sets.
    This use does not require a resolution threshold uniform over all disk radii. ◻
]

All these conclusions are local in the actual conformal coordinate.
  They therefore also hold in each fixed forward quantum-area offset of Proposition 9.
  The joint cone zoom and ordinary-patch exhaustion of [22] Lemma “From indexed Gaussian charts to the whole cone”
  let these patches exhaust the plane away from its marked cone point.
  Only probability-one conclusions are transferred in this exhaustion.
  The marked point will be handled by removability when the variational limits are assembled.

== 4 The limiting electrical energy <sec:energy>

We now identify the unnormalized energies of the primal and dual graphs.
  The cutoffs of Proposition 19 first give compactness for harmonic functions and coercivity for arbitrary
  continuous limits. The locality of the extracted arrays then makes the limiting energy a deterministic scalar
  multiple of the conformal Dirichlet integral. An annular current–period argument will show that this scalar is
  exactly one. Thus the normalization is obtained from the network itself.

Throughout this section we work in an ordinary conformal chart,
  in a coupled extraction with the conclusions of Proposition 12 and Proposition 19.
  Write $G_m \, G_m^(*)$ for the primal and dual graphs and $pi_m$ for their surface projections.
  All sets used below have fixed positive clearance inside the chart before $m$ tends to infinity.
  The energy $sans(e)_m \( v \; U \)$ is the sum of $\| v \( y \) -
  v \( x \) \|^2$ over edges with both projected endpoints in $U$; we use the same convention for compact sets.
  Replacing this convention by edge-location membership does not change an inner limit,
  because the projected mesh tends to zero. Uniform convergence on a compact set always means convergence at every
  vertex over that set, including every lift of a point.

=== 4.1 Circuits and harmonic compactness <circuits-and-harmonic-compactness>

A cutoff on one graph gives a short level circuit on the other,
  where “short” is measured by the increments of the function under study.
  This elementary coarea observation is the bridge between the cutoffs and the analysis of functions.

#thm([Lemma 4.1.])[
  (A separating circuit).  #emph[Fix concentric disks with radii $0 < r <
    R$ and with a neighborhood of the closed larger disk inside an ordinary chart.
    Given a primal function $v_m$, there is a simple primal circuit $C_m$ in a slightly buffered annulus which
    surrounds all lifts of the smaller disk and whose inside contains no lift outside a slightly enlarged larger
    disk, such that
#[#set math.equation(numbering: n => "(4.1)")
 $ (sum_(e in C_m) \| upright(d) v_m \( e \) \|)^2 lt.eq C thin sans(e)_m \( v_m \; A^(+) \) . $ <en:circuit-bound>]

 Here $A^(+)$ is a fixed buffered annulus and $C$ depends only on its aspect and the chart constants.
   The conclusion holds eventually for every fixed annulus. It also holds with the primal and dual graphs exchanged.]
] <en:circuit>

#proof[
  Take a dual cutoff $b_m$ which is one on the inner well and zero on the outer well, with energy at most $C$.
    These wells include all relevant lifts, with fixed collars.
    For $t in \( 0 \, 1 \)$ away from the finitely many vertex values,
    color the primal faces according to whether their dual vertices satisfy $b_m > t$.
    The oriented boundary of the colored faces splits into simple circuits.
    A face appearing on both sides of an edge contributes no boundary occurrence;
    other edge occurrences have their usual multiplicities.
  The boundary chain has winding difference one between an inner dual vertex and an outer dual vertex,
    because their face colors are one and zero. After splitting the chain into simple circuits,
    at least one circuit separates these two vertices. The inner dual well is connected through dual edges on
    which the cutoff is one; such a path cannot cross any boundary edge,
    including at a primal articulation vertex. Hence every vertex of this inner well is on the same side of the
    chosen circuit. The connected outer well has the analogous property.
    The collars and vanishing overlay mesh put all primal inner lifts on the inner side as well,
    and all lifts beyond the larger well on the outer side. This uses the all-lift joining statement of
    Proposition 3 and remains valid when the full boundary chain touches itself.
    The selected circuit lies in the change annulus and has variation at most that of the entire boundary.
    The coarea identity and Cauchy–Schwarz give
  $ integral_0^1 sum_(e in partial { b_m > t }) \| upright(d) v_m \( e \) \| thin upright(d) t =
    sum_e \| upright(d) v_m \( e \) \| thin \| upright(d) b_m \( e^(*) \) \| lt.eq
    sans(e)_m \( v_m \; A^(+) \)^(1 \/ 2) sans(e)_m^(*) \( b_m \)^(1 \/ 2) . $
  Choose a level at most this average. This proves (4.1), with an arbitrarily small slack if necessary.
    The same argument applies after exchanging the graphs. ◻
]

#thm([Lemma 4.2.])[
  (Harmonic compactness).  #emph[Let $U$ be a connected open subset of an ordinary chart.
    Suppose that $v_m$ is graph-harmonic at every vertex whose star projects into $U$,
    and that its energies are bounded on compactly contained neighborhoods.
    Then $v_m$ is macroscopically equicontinuous on every compact subset of $U$: for $K subset.double U$,
$ lim_(delta arrow.b 0) limsup_(m arrow.r oo) sup_(pi_m x \, pi_m y in K\
\| pi_m x - pi_m y \| < delta) \| v_m \( x \) - v_m \( y \) \| = 0 . $

 If $x_m$ is a vertex sequence with $pi_m x_m arrow.r z_0 in U$ and $v_m \( x_m \)$ is bounded,
   the functions have locally uniformly convergent subsequences.
   The assertions hold for both graphs and for local branches of potentials,
   with a normalization on each initial branch.]
] <en:harmonic-compactness>

#proof[
  Fix a disk with clearance inside $U$ and an energy bound $E$ on a larger disk.
    Around its center place $J$ disjoint annuli of one fixed aspect, all inside a prescribed small neighborhood.
    Choose all radii before taking $m$ large. Their energy sum is at most $E$,
    so Lemma 20 supplies a surrounding circuit on which the oscillation is at most $\( C E \/ J \)^(1 \/ 2)$.
    The discrete maximum principle bounds the oscillation everywhere inside by the same quantity.
    Taking $J$ large, and then using finitely many such neighborhoods, proves equicontinuity.
    No assertion is needed at a radius depending on $m$.
  The same construction at a fixed, nonvanishing scale bounds oscillation on compact balls.
    Overlapping chains of balls propagate an additive normalization throughout a connected compact subset.
    Vertex density and the small-image joining property identify the limits on overlaps.
    The usual finite-net proof of Arzelà–Ascoli now gives local uniform compactness.
    A local potential branch is an ordinary harmonic function on each of its branch disks,
    so the proof also applies to branches. ◻
]

=== 4.2 The uniform relaxation and its energy measures <the-uniform-relaxation-and-its-energy-measures>

The extracted variational tests let us define a single limiting energy for every continuous target.
  This definition does not assume a continuum Dirichlet form.

For $u in C \( U \)$, $K subset.double U$ compact, and $delta > 0$, let

$ M_m \( u \, K \, delta \) = inf {sans(e)_m \( v \; K \) : \| v \( x \) - u \( pi_m x \) \| lt.eq
  delta upright(" for every vertex ") x upright(" over ") K} . $

Define the #emph[inner relaxed energy] by

#[#set math.equation(numbering: n => "(4.2)")
 $ F \( u \, U \) = sup_(K subset.double U) sup_(delta > 0) liminf_(m arrow.r oo) M_m \( u \, K \, delta \) .
   $ <en:relaxation>]

One may use a countable exhaustion of compact finite unions of boxes and let $delta$ decrease through positive
  rationals. Define $F^(*)$ by the same formula on the dual graph.

#thm([Lemma 4.3.])[
  (Uniform variational limits).  #emph[The value in (4.2) is unchanged if $liminf$ is replaced by $limsup$.
    It is lower semicontinuous for locally uniform convergence and inner regular in $U$. Moreover:]
  + #emph[Every locally uniformly convergent sequence $v_m arrow.r
    u$ has local energy lower bounds given by $F \( u \, dot.op \)$, also along further subsequences.]
  + #emph[If $F \( u \, U \) < oo$, there are compact sets $K_m$ exhausting $U$ and functions $v_m$ on their graph
    neighborhoods such that $v_m arrow.r u$ locally uniformly and $sans(e)_m \( v_m \; K_m \) lt.eq
    F \( u \, U \) + o \( 1 \)$.]
  #emph[These statements hold simultaneously for all continuous targets.
    The values $F \( u \, U \)$ are locally readable from the arrays with arbitrarily small open buffers.]
] <en:envelope>

#proof[
  Given $K subset.double K' subset.double U$ and $0 < delta' < delta$,
    insert between the two tests a finite selector test from Lemma 6.
    Cover the relevant visit labels by finitely many selectors on which the target varies by less than a fixed
    fraction of $delta - delta'$, and use intermediate rational value constraints.
    Completeness of the selected graph preserves every edge incidence.
    Restriction of an admissible function for the larger test is admissible for the intermediate one;
    restriction from the intermediate test is admissible for the smaller one.
    The intermediate infimum has a retained limit. Consequently,
  $ limsup_m M_m \( u \, K \, delta \) lt.eq liminf_m M_m \( u \, K' \, delta' \) . $
  Taking the two inner suprema proves the assertion about $liminf$ and $limsup$, including infinite values.
  The same comparison proves the lower bound in (i). For (ii),
    choose almost minimizers on increasing compact sets with decreasing tolerances,
    and take a diagonal sequence using the $limsup$ formula. Tolerance slack also proves lower semicontinuity,
    directly from (4.2). Exhausting $U$ proves inner regularity.
    The selector library is countable; approximation of a continuous target uses its modulus of continuity on each
    compact, rather than a new exceptional event. This gives the simultaneous assertion.
    The locality and measurability claims follow from the same selector sandwich, with its spatial buffers. ◻
]

We call the sequences in Lemma 22(ii) recovery sequences.
  The next estimate explains why such sequences can be joined on overlaps.
  For an oriented edge $x y$, put $overline(v) \( x y \) = \( v \( x \) + v \( y \) \) \/ 2$.

#thm([Lemma 4.4.])[
  (Gluing estimate).  #emph[Let $v_m \, w_m$ converge uniformly to the same continuous function on a fixed
    transition region. Suppose $0 lt.eq b_m lt.eq 1$ has bounded energy, is supported where $v_m$ is defined,
    and equals one wherever $w_m$ is not used. Then $z_m = b_m v_m + \( 1 - b_m \) w_m$ has, on the gluing region,
#[#set math.equation(numbering: n => "(4.3)")
 $ sans(e)_m \( z_m \) & lt.eq \( 1 + epsilon \) sum_e
   (overline(b)_m \( e \) \| upright(d) v_m \( e \) \|^2 + \( 1 - overline(b)_m \( e \) \) \| upright(d) w_m \(
   e \) \|^2)\
 & quad + \( 1 + epsilon^(- 1) \) parallel v_m - w_m parallel_(oo \, upright("tr"))^2 sans(e)_m \( b_m \) \, wide
   epsilon > 0 . $ <en:gluing-estimate>]

 Finite partitions of unity have the corresponding estimate,
   with an error tending to zero when the local approximations agree uniformly on overlaps.
   Bounded-energy gluing weights exist for every fixed finite open cover of a compact set.]
] <en:fundamental>

#proof[
  The exact difference identity is
  $ upright(d) z_m = overline(b)_m thin upright(d) v_m + \( 1 - overline(b)_m \) thin upright(d) w_m +
    overline(v_m - w_m) thin upright(d) b_m . $
  Apply convexity of the square to the first two terms, followed by $\| a +
    c \|^2 lt.eq \( 1 + epsilon \) \| a \|^2 + \( 1 + epsilon^(- 1) \) \| c \|^2$.
    Only the transition region contributes to the last term. For finitely many weights the same identity follows
    by summing and using $sum_i upright(d) b_(i \, m) = 0$.
  To construct weights, choose finitely many disks whose smaller disks cover the compact set and whose larger
    disks stay in the prescribed members of the cover. Use Proposition 19, sum the resulting cutoffs,
    and normalize where their sum is at least one. Clipping and division on this fixed range preserve bounded
    energy. Extra cutoffs with collars extend the construction to a neighborhood of the compact set.
    All these choices precede the limit in $m$. ◻
]

#thm([Proposition 4.5.])[
  (Quadratic energy measures).  #emph[For each open $U$, the functional $F \( dot.op \, U \)$ is quadratic on its
    finite-energy space and vanishes on constants. If $u$ has locally finite relaxed energy, then
$ U mapsto F \( u \, U \) $

 is the restriction to open sets of a Radon measure. For smooth $u$, on a smaller ordinary chart,
#[#set math.equation(numbering: n => "(4.4)")
 $ F \( u \, U \) lt.eq C integral_U \| nabla u \|^2 thin upright(d) z . $ <en:smooth-upper>]

 The same statements hold for $F^(*)$.]
] <en:measure>

#proof[
  Recovery sequences for $u$ and $v$, the discrete parallelogram identity, and the energy lower bound give
  $ F \( u + v \, U \) + F \( u - v \, U \) lt.eq 2 F \( u \, U \) + 2 F \( v \, U \) . $
  Applying this inequality to $u + v$ and $u - v$ gives the reverse inequality.
    Homogeneity follows directly from the tolerance definition. Constant addition leaves every edge increment unchanged.
  For fixed $u$, restriction gives monotonicity and superadditivity on disjoint open sets.
    To prove subadditivity on $U union V$, first fix a compact subset of this union.
    Recover $u$ in $U$ and $V$, and join the recoveries with Lemma 23;
    the transition is compactly contained in $U ∩ V$. Let $m arrow.r oo$ and then $epsilon arrow.b 0$ in (4.3).
    Exhausting the compact gives
  $ F \( u \, U union V \) lt.eq F \( u \, U \) + F \( u \, V \) . $
  Finite subcovers and inner regularity imply countable subadditivity.
    For completeness, these properties give the required measure criterion as follows.
    Define $nu \( A \) = inf { F \( u \, O \) : A subset O \, med O upright(" open") }$.
    This is an outer measure by countable subadditivity. If two sets have positive distance,
    they have disjoint open neighborhoods; disjoint-open superadditivity shows that $nu$ is additive on such sets.
    Thus it is a metric outer measure and all Borel sets are measurable.
    On an open set $O$, monotonicity gives $nu \( O \) = F \( u \, O \)$.
    Local finiteness and inner regularity make this Borel measure Radon.
  It remains to prove (4.4); this will also establish local finiteness for smooth targets.
    On a compact set inside $U$, use a square grid of spacing $r$ and a bounded-overlap family of disk cutoffs
    with radii comparable to $r$. Normalize these cutoffs to weights $b_(z \, m)$ which sum to one near the
    compact, and set
  $ v_m = sum_z b_(z \, m) u \( z \) . $
  For fixed $r$ this approximates $u$ within its modulus of continuity at scale $C r$.
    On each edge the weight increments sum to zero. Subtracting one nearby node value and using bounded overlap
    bounds the energy by
  $ C sum_z r^2 sup_(B \( z \, C' r \)) \| nabla u \|^2 . $
  Indeed each unnormalized cutoff has bounded energy, and normalization has the same bound because the denominator
    is bounded below and only boundedly many supports meet an edge.
    First take $m$ large for this finite collection, and then let $r arrow.b 0$.
    The displayed sum converges to at most a constant times the gradient integral over the chosen region.
    Exhaustion inside $U$ proves (4.4). The arguments are unchanged on the dual. ◻
]

=== 4.3 Integral representation and coercivity <integral-representation-and-coercivity>

The energy measures of the two coordinate functions determine the whole functional. Coercivity is a separate step:
  it follows from intersecting level circuits and does not assume geometric regularity of the mesh.

#thm([Proposition 4.6.])[
  (Integral representation).  #emph[In every ordinary chart there is a measurable symmetric matrix field $A$,
    locally bounded and uniformly positive definite on smaller charts, such that,
    for every open $U$ and every $u in C \( U \)$,
#[#set math.equation(numbering: n => "(4.5)")
 $ F \( u \, U \) =
   cases(delim: "{", integral_U nabla u^(sans(T)) A nabla u thin upright(d) z \, & u in W_(upright("loc"))^(1 \,
   2) \( U \) \,, + oo \, & u in.not W_(upright("loc"))^(1 \, 2) \( U \) .) $ <en:matrix-form>]

 The integral is allowed to be infinite. There is an analogous field $A^(*)$ for the dual functional.]
] <en:representation>

#proof[
  We first identify the energy of smooth functions. Polarize the Radon measures from Proposition 24.
    The measures of the linear functions $ell_1 \( z \) = Re z$, $ell_2 \( z \) =
    Im z$ and their sums are absolutely continuous by (4.4). Define the entries of $A$ by their densities:
  $ A_(i i) thin upright(d) z = F \( ell_i \, upright(d) z \) \, wide 2 A_12 thin upright(d) z =
    F \( ell_1 + ell_2 \, upright(d) z \) - F \( ell_1 \, upright(d) z \) - F \( ell_2 \, upright(d) z \) . $
  Quadraticity and the upper bound imply that $A$ is symmetric, nonnegative, and locally bounded.
    At a Lebesgue point $z$ of these densities, compare a smooth $u$ with its affine first-order Taylor polynomial
    $p_z$. The seminorm inequality and (4.4) give
  $ lr(|F \( u \, B \( z \, r \) \)^(1 \/ 2) - F \( p_z \, B \( z \, r \) \)^(1 \/ 2)|) lt.eq
    C^(1 \/ 2) \| B \( z \, r \) \|^(1 \/ 2) sup_(B \( z \, r \)) \| nabla u - nabla u \( z \) \| . $
  Divide by $\| B \( z \, r \) \|^(1 \/ 2)$ and let $r arrow.b 0$.
    Differentiation of Radon measures yields (4.5) for smooth $u$.
  We next prove the converse bound, including weak differentiability:
  #[#set math.equation(numbering: n => "(4.6)")
   $ integral_U \| nabla u \|^2 thin upright(d) z lt.eq C F \( u \, U \) . $ <en:coercivity>]
  Suppose the right side is finite. Put a square grid of fixed small spacing $r$ in a compactly contained region
    of $U$. At every grid node $x$, apply Lemma 20 to a recovery sequence,
    using an annulus with inner and outer radii $0.7 r$ and $0.8 r$,
    and choose a value $a_(x \, m)$ at a vertex on the resulting circuit. Buffers are small fixed fractions of $r$.
  Circuits at neighboring grid nodes share a vertex. Here is the necessary topological verification.
    A point near the midpoint of the two centers is inside both inner disks.
    Points on the two opposite sides belong to exactly one inner disk and lie beyond the other outer disk;
    a distant point lies outside both. The all-lift separation rule therefore gives a common interior lift,
    a common exterior lift, and lifts with each of the two opposite memberships.
    Two disjoint simple circuits on the sphere with these memberships could be neither nested nor disjoint in
    their interiors, a contradiction. Since both circuits belong to the primal graph,
    their intersection contains a vertex. Consequently,
  $ \| a_(x \, m) - a_(y \, m) \|^2 lt.eq 2 (sum_(e in C_(x \, m)) \| upright(d) v_m \( e \) \|)^2 +
    2 (sum_(e in C_(y \, m)) \| upright(d) v_m \( e \) \|)^2 $
  for neighbors $x \, y$. Write $B_r$ for the union of the buffered grid annuli. Bounded overlap and (4.1) give
  $ sum_(x tilde.op y) \| a_(x \, m) - a_(y \, m) \|^2 lt.eq C sans(e)_m \( v_m \; B_r \) lt.eq
    C #scale(x: 120%, y: 120%)[\(] F \( u \, U \) + o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  For the last inequality, this fixed finite union lies in the recovery set $K_m$ for all sufficiently large $m$.
    The piecewise affine interpolation of the $a_(x \, m)$ on grid triangles has Dirichlet energy bounded by this
    sum times an absolute constant. Take $m$ large after fixing the grid, and then let $r arrow.b 0$.
    Continuity of $u$ and uniform recovery imply that these interpolations converge locally uniformly to $u$.
    Weak Sobolev compactness proves (4.6) on the compact region; exhaustion proves it on $U$.
    Applying it to smooth affine functions on arbitrary disks gives $A gt.eq c I$ locally.
  Finally, let $u in C \( U \) ∩ W_(upright("loc"))^(1 \, 2) \( U \)$.
    On smaller regions, smoothing approximates $u$ both uniformly and in $W^(1 \, 2)$.
    Lower semicontinuity and the smooth upper bound first extend that upper bound to such continuous Sobolev
    functions. Apply the extended bound to the difference between $u$ and its smooth approximations.
    Their $F$-seminorm difference tends to zero, so the smooth formula passes to $u$.
    Exhaustion gives (4.5), including infinite integrals. If local Sobolev regularity fails,
    (4.6) forces infinite energy. All steps apply equally to $F^(*)$. ◻
]

#thm([Lemma 4.7.])[
  (The deterministic scalar).  #emph[In each coupled extraction there is a deterministic $lambda
    in \( 0 \, oo \)$ such that
#[#set math.equation(numbering: n => "(4.7)")
 $ A = A^(*) = lambda I $ <en:scalar-form>]

 almost everywhere in all ordinary charts. At this stage $lambda$ may depend on the extracted rate sequence.]
] <en:scalar>

#proof[
  The derivatives of the energy measures of linear functions are point germs of the arrays:
    use the tolerance definition on successively smaller disks, with arbitrarily small open buffers.
    Choose measurable $limsup$ versions and a fixed default on the null set where Lebesgue differentiation fails.
    Lemma 14 applies to these matrix-valued readouts (or to a bounded injective encoding of their entries),
    so $A$ and $A^(*)$ are deterministic almost everywhere. Translation covariance makes each field a constant
    matrix on overlapping ordinary charts. Under a rotation, the matrix transforms by $A mapsto R A R^(sans(T))$.
    Rotation covariance, in particular a quarter-turn, therefore makes each symmetric matrix scalar.
    These uses of covariance are precisely those in Remark 15,
    and compare local laws with their actual field transformations.
    Primal–dual reflection (Lemma 11) equates the two scalar values.
    The upper bound and coercivity give $0 < lambda < oo$. ◻
]

=== 4.4 Annular reciprocity fixes the scalar <annular-reciprocity-fixes-the-scalar>

We have proved existence and isotropy of the limiting energy.
  To identify its normalization, compare a condenser potential with a potential whose value increases by one on
  going around an annulus. The first comparison rotates a discrete current to a dual potential;
  the reverse comparison recovers an angular potential with its period #emph[exactly] preserved.
  Both comparisons use only interior graph pieces with collars.
  The current–potential correspondence is the standard planar-network duality; see [17] Section 9.2.
  Its use to determine a scalar effective conductivity has a classical precedent in Dykhne’s planar self-duality
  argument [6]. Here we give both inequalities, including the recovery needed on our irregular graph pieces.

Let

$ A \( r \, R \) = { z : r < \| z \| < R } \, wide C_0 = frac(2 pi, log \( R \/ r \)) \, $

where the closed annulus and a neighborhood of it lie inside an ordinary chart.
  Thus $C_0$ is the ordinary Dirichlet capacity between its two boundary circles.
  The radial minimizer is $log \( \| z \| \/ r \) \/ log \( R \/ r \)$.
  A locally Sobolev potential with additive period $P$ around the annulus has energy at least

#[#set math.equation(numbering: n => "(4.8)")
 $ integral_(A \( r \, R \)) \| nabla v \|^2 thin upright(d) z gt.eq P^2 / C_0 . $ <en:period-bound>]

Indeed, on almost every circle, $integral_0^(2 pi) partial_theta v thin upright(d) theta = P$;
  apply Cauchy–Schwarz and integrate $upright(d) s \/ s$. Equality holds for $v = P theta \/ \( 2 pi \)$,
  interpreted in local branches.

#thm([Lemma 4.8.])[
  (Condenser convergence).  #emph[Prescribe $u_m = 0$ on every primal vertex over $\| z \| lt.eq r$ and $u_m =
    1$ on every vertex over $\| z \| gt.eq R$, using a protected cap outside the chart.
    Let $C_m$ be the minimum primal energy. Then
#[#set math.equation(numbering: n => "(4.9)")
 $ C_m arrow.r lambda C_0 . $ <en:condenser-limit>]

 The minimizers converge uniformly, including at the two plate boundaries, to the round radial condenser potential.]
] <en:condenser>

#proof[
  All nonzero increments of the minimizer project into any fixed collar of the closed annulus eventually.
    Indeed, both endpoints of an edge strictly on one plate have its prescribed value,
    and the overlay mesh vanishes. Thus the cap contributes no uncontrolled energy term.
  For the upper bound, approximate the radial potential by smooth functions which are constant on slightly wider
    plate collars and whose energies tend to $C_0$. Recover them uniformly on a neighborhood of the annulus.
    Bounded-energy weights in the flat collars paste in the exact constants at a vanishing energy cost,
    by Lemma 23. Lemma 26 gives $limsup C_m lt.eq lambda C_0$.
  The minimizer lies in $\[ 0 \, 1 \]$ and is harmonic off the plates.
    Its bounded energy and Lemma 21 give compactness in the open annulus.
    At a plate-boundary point, use the stacks of rings from that lemma, small enough to avoid the other plate.
    Every surrounding circuit meets a path lying strictly on the plate side:
    choose a tube there from the inner well to outside the ring and lift it by Proposition 3.
    Thus the circuit contains a vertex with the prescribed value.
    A circuit of small variation is uniformly close to that value.
    Inside it all remaining vertices are harmonic or have that same prescribed value,
    so the maximum principle proves continuity uniformly up to the plate.
    Fixed stacks followed by finite covers give the assertion simultaneously along both boundaries.
  Any uniform subsequential limit has the condenser boundary values.
    The variational lower bound and Lemma 26 give energy at least $lambda C_0$.
    This proves (4.9); equality in the round Dirichlet principle identifies the limit and gives the last assertion. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  compound-path({circle((0, 0), radius: 1.522, fill: rgb("#f2f2f2"), stroke: none); circle((0, 0), radius: 0.5775, fill: rgb("#f2f2f2"), stroke: none); line((0, 0), (0, 0))}, fill: rgb("#f2f2f2"), fill-rule: "even-odd", stroke: none)
  circle((0, 0), radius: 1.522, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.5775, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$u_m=0$]])
  content((-1.596, 0), [$u_m=1$], anchor: "east", padding: 0.1176cm)
  line((0.5148, 0.432), (1.038, 0.8707), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((-0.5148, 0.432), (-1.038, 0.8707), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((-0.5148, -0.432), (-1.038, -0.8707), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((0.5148, -0.432), (1.038, -0.8707), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  arc((1.039, 0.3374), start: 18deg, stop: 153deg, radius: 1.092, stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  content((0, 1.617), [#text(fill: rgb("#a60000"))[dual period $C_m$]], anchor: "south", padding: 0.1176cm)
  content((0, -1.68), [#text(fill: rgb("#0000a6"))[primal current $upright(d) u_m$]], anchor: "north", padding: 0.1176cm)
  line((1.995, 0.63), (3.255, 0.63), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.625, 0.0525), [unit-period#linebreak()recovery])
  compound-path({circle((5.25, 0), radius: 1.522, fill: rgb("#f2f2f2"), stroke: none); circle((5.25, 0), radius: 0.5775, fill: rgb("#f2f2f2"), stroke: none); line((5.25, 0), (5.25, 0))}, fill: rgb("#f2f2f2"), fill-rule: "even-odd", stroke: none)
  circle((5.25, 0), radius: 1.522, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((5.25, 0), radius: 0.5775, stroke: (thickness: 0.4pt, miter-limit: 10))
  arc((6.289, 0.3374), start: 18deg, stop: 330deg, radius: 1.092, stroke: (paint: rgb("#a60000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  content((5.25, 0), [$alpha_m$])
  content((5.25, 1.617), [#text(fill: rgb("#a60000"))[exact period $1$]], anchor: "south", padding: 0.1176cm)
  content((5.25, -1.68), [$| chevron.l upright(d) u_m, alpha_m chevron.r |=1$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 3: The two annular comparisons. Rotating the condenser current gives a dual potential with period $C_m$ and hence $lambda lt.eq 1$. An exact unit-period dual recovery pairs with the unit condenser jump to give $lambda gt.eq 1$. This is a schematic of the test annulus; the projected discrete graph need not resemble a regular mesh. ],
) <en:fig-reciprocity>

#thm([Lemma 4.9.])[
  (Rotation of a current).  #emph[Rotate the primal current $upright(d) u_m$ from Lemma 27 to the dual edges,
    with one consistent crossing orientation. In the annulus this is a closed dual cochain with harmonic local
    potential branches and period $plus.minus C_m$. The branches have subsequential locally uniform limits with
    period $plus.minus lambda C_0$ and with total dual relaxed energy at most $lambda C_0$ over one turn.]
] <en:current-period>

#proof[
  Closedness around a dual face is the primal harmonic equation.
    Harmonicity of a potential branch at a dual vertex is the telescoping sum of $upright(d)
    u_m$ around the corresponding primal face. These identities count all incidences and are valid also for loops
    and repeated edges. The squared dual increments sum to at most $C_m$ on every interior annular piece.
  We justify the existence of branches without assuming regular discrete annular boundaries.
    In a disk with clearance inside the annulus, arbitrary dual lifts in a smaller disk are connected within the
    larger one. Loops used to integrate the cochain can be filled inside a further buffer, by Proposition 3;
    every primal vertex there is harmonic. Cellular closedness therefore makes the integral independent of the
    chosen path. On connected overlaps the resulting potentials differ by constants.
  A dual loop with projected winding one can be built along fixed tubes and closed using small-image joining.
    The integer-winding statement of Proposition 3 makes its winding upstairs one,
    up to the fixed orientation sign. Its current integral is the total current entering one plate,
    since all intervening primal vertices are harmonic. Discrete summation by parts gives total current $C_m$:
    the potential difference is one and its energy is $C_m$. Hence the period is $plus.minus C_m$.
  Normalize branches on a finite overlapping disk cover of any compact subannulus,
    propagating constants through chosen overlaps. In particular,
    fix a cyclic chain of disks around one positively oriented circle.
    Continue a normalized branch along this chain, matching on each connected overlap;
    on returning to the first disk, the continued branch differs from the original by $plus.minus C_m$.
    Lemma 21 gives local uniform subsequential limits. Their transition constants converge,
    so their period is $plus.minus lambda C_0$. Exhausting the annulus yields branches everywhere.
    For the energy bound, use disjoint boxes lying in branch disks.
    Their discrete edge energies do not overlap, and their sum is at most $C_m$.
    Apply the local lower bound and then exhaust the annulus up to sets of Lebesgue measure zero.
    This gives the asserted bound over one turn. ◻
]

Combining Lemmas 26 and 28 with (4.8) gives

#[#set math.equation(numbering: n => "(4.10)")
 $ lambda C_0 gt.eq lambda frac(\( lambda C_0 \)^2, C_0) \, wide upright("hence ") lambda lt.eq 1 . $ <en:lambda-upper>]

For the reverse inequality, angular recovery must retain its period before taking any limit.
  We record first the measure observation that makes the gluing sharp.

#thm([Lemma 4.10.])[
  (Energy measures of recovery sequences).  #emph[Let $V$ be a bounded patch and let $p$ be smooth on a
    neighborhood of its closure. Choose a recovery sequence on compact sets exhausting $V$ whose total energy
    tends to $F^(*) \( p \, V \)$. Count only edges with both endpoints in these recovery sets,
    and put their squared increments at any of the corresponding projected edge locations.
    These measures converge vaguely in $V$ to $lambda \| nabla p \|^2 thin upright(d) z$.
    In particular, energies weighted by a compactly supported continuous function converge to the corresponding
    weighted integral.]
] <en:recovery-measures>

#proof[
  The total masses are bounded. Let $nu$ be a subsequential vague limit.
    To check its local lower bound, take open sets $W subset.double O subset.double V$ and a compact set $K subset
    O$ containing $W$ with a collar. The energy tests inside $W$ are eventually counted by the edge measure
    $nu_m \( K \)$. Lemma 22 and compact-set Portmanteau give
  $ F^(*) \( p \, W \) lt.eq liminf_m nu_m \( K \) lt.eq limsup_m nu_m \( K \) lt.eq nu \( K \) lt.eq nu \( O \) . $
  Exhaust $O$ by such $W$. Thus $nu$ dominates $lambda \| nabla p \|^2 thin upright(d) z$.
    Its total mass is at most the limiting total recovery energy, which is the total mass of that same measure.
    Equality follows. Every subsequential vague limit is consequently the stated measure, proving the claim. ◻
]

#thm([Lemma 4.11.])[
  (Recovery with exact unit period).  #emph[For every sufficiently small $eta > 0$, let $A_eta =
    A \( r - eta \, R + eta \)$. On the dual edges in a neighborhood of the closed annulus there are closed
    cochains $alpha_m$ with exact period one and
#[#set math.equation(numbering: n => "(4.11)")
 $ limsup_(m arrow.r oo) sum_(e^(*) subset A_eta) \| alpha_m \( e^(*) \) \|^2 lt.eq
   lambda (1 / C_0 + o_eta \( 1 \)) \, wide o_eta \( 1 \) arrow.r 0 . $ <en:angular-energy>]

 The cochains are closed at every cell whose star lies in this neighborhood;
   the region can be chosen to contain every edge where $upright(d) u_m eq.not 0$ for all large $m$.]
] <en:angular-recovery>

#proof[
  Take finitely many disks covering a slightly larger closed annulus, each avoiding the origin,
    with angle branches $p_i = theta_i \/ \( 2 pi \)$. Recover $p_i$ uniformly on larger branch disks.
    Lemma 29 applies to these recoveries, denoted $v_(i \, m)$.
    Take a smooth partition of unity $b_i$ with supports compactly inside the branch disks.
    Recover its weights, clip them to be nonnegative, cut them off in fixed support collars,
    and normalize their sum. This gives $b_(i \, m) arrow.r b_i$ uniformly, bounded energies,
    supports inside the branch disks, and $sum_i b_(i \, m) = 1$ near the annulus.
  There is a useful canonical cochain even though its own energy need not be bounded. On an oriented dual edge, let
  $ a_m \( e^(*) \) = frac(1, 2 pi) integral_(pi_m \( e^(*) \)) upright(d) arg z . $
  Here the integral means the endpoint increment of a continuous argument lift along the projected edge.
    Every sufficiently small edge image lies in a branch disk, so this is well defined.
    Vanishing face mesh makes $a_m$ closed around every cell under consideration,
    and its period around a loop is that loop’s projected integer winding.
  On the support of $b_(i \, m)$ the error $v_(i \, m) - p_i compose
    pi_m$ is a single-valued function tending uniformly to zero. Define the globally single-valued error and cochain by
  #[#set math.equation(numbering: n => "(4.12)")
   $ q_m = sum_i b_(i \, m) \( v_(i \, m) - p_i compose pi_m \) \, wide alpha_m = a_m +
     upright(d) q_m . $ <en:angular-error>]
  The support collars make this definition independent of how terms are extended by zero.
    Since a gradient has zero periods, $alpha_m$ is closed and has period exactly one,
    in the projected orientation. This conclusion is an identity at each finite resolution.
  To bound its energy, apply the discrete product identity on each edge.
    On a branch disk, $upright(d) \( p_i compose pi_m \) = a_m$.
    Since the weights sum to one, the terms containing $a_m$ cancel to give
  $ alpha_m \( e^(*) \) = sum_i overline(b)_(i \, m) \( e^(*) \) thin upright(d) v_(i \, m) \( e^(*) \) +
    sum_i overline(v_(i \, m) - p_i compose pi_m) \( e^(*) \) thin upright(d) b_(i \, m) \( e^(*) \) . $
  The second sum tends to zero in edge $ell^2$, by uniform convergence of the errors and bounded energy of the
    finitely many weights. Convexity bounds the squared norm of the first sum by the weighted sum of local
    recovery energies. Lemma 29 and $b_(i \, m) arrow.r b_i$ turn its limit into
  $ lambda sum_i integral_(A_eta) b_i \| nabla p_i \|^2 thin upright(d) z =
    lambda integral_(A_eta) lr(|nabla frac(theta, 2 pi)|)^2 thin upright(d) z =
    frac(lambda, 2 pi) log frac(R + eta, r - eta) . $
  One may compute first on a slightly larger closed annulus inside the cover;
    its boundary circles have zero limiting energy measure. The edge averages $overline(b)_(i \, m)$ converge
    uniformly to $b_i$ at the chosen edge locations, by vanishing mesh.
    This justifies both the weighted passage to the limit and restriction to the annulus. This proves (4.11).
    Finally, $u_m$ is constant on each plate, so its nonzero increments lie in $A_eta$ eventually by vanishing
    edge mesh. Choosing additional fixed collars gives the assertion about stars. ◻
]

#thm([Proposition 4.12.])[
  (Exact conductance normalization).  #emph[The scalar in Lemma 26 equals one.]
] <en:reciprocity>

#proof[
  Only $lambda gt.eq 1$ remains after (4.10). Pair $upright(d) u_m$ with the cochain $alpha_m$ of Lemma 30,
    matching each primal edge with its crossing dual edge and using the consistent crossing sign. Then
  #[#set math.equation(numbering: n => "(4.13)")
   $ lr(|sum_e upright(d) u_m \( e \) alpha_m \( e^(*) \)|) = 1 . $ <en:pairing>]
  To see this at the discrete level, replace $u_m$ by the indicator of the outer side of an intermediate circle.
    Their difference is supported strictly inside the region of closedness of $alpha_m$.
    Cellular summation by parts therefore leaves the pairing unchanged.
    The indicator’s gradient pairs with $alpha_m$ along the oriented dual boundary chain separating the two wells.
    This chain has total winding one up to sign by Proposition 3; the cochain has exact unit period by (4.12).
    This proves (4.13). The argument uses the boundary chain with its multiplicities and does not require a simple
    discrete plate boundary.
  Cauchy–Schwarz, (4.9), and (4.11) now give
  $ 1 lt.eq C_m sum_(e^(*) subset A_eta) \| alpha_m \( e^(*) \) \|^2 quad arrow.r.double quad 1 lt.eq
    lambda C_0 thin lambda (C_0^(- 1) + o_eta \( 1 \)) . $
  Let $eta arrow.b 0$. Thus $1 lt.eq lambda^2$, and (4.10) proves $lambda = 1$. ◻
]

#thm([Theorem 4.13.])[
  (Uniform conformal energy limit).  #emph[In every coupled extraction and every ordinary chart,
    both unnormalized network energies have the same inner relaxed limit:
#[#set math.equation(numbering: n => "(4.14)")
 $ F \( u \, U \) = F^(*) \( u \, U \) = integral_U \| nabla u \|^2 thin upright(d) z $ <en:final-energy>]

 for every $u in C \( U \) ∩ W_(upright("loc"))^(1 \, 2) \( U \)$,
   with infinite value when the integral diverges or local Sobolev regularity fails.
   The local uniform lower bounds and recovery conclusions of Lemma 22, the gluing estimate,
   and harmonic compactness hold simultaneously. In particular,
   the limiting energy has no subsequence-dependent multiplicative constant.]
] <en:variational>

#proof[
  Combine Proposition 25, Lemma 26, and Proposition 31. The preceding construction used the same countable
    buffered tests throughout, so its simultaneous and locality assertions persist.
    All arguments apply in every fixed quantum-unit offset of the extraction.
    Their compatibility is the transport statement of Proposition 12. ◻
]

== 5 From local plane energies to the sphere <sec:sphere>

The energy identification of Section 4 was obtained in ordinary patches of a quantum cone.
  We now transfer it to the fixed-area sphere and include the point at which the contour begins and ends.
  The output is a global variational statement in the same coupling as the metric-measure convergence.
  This common coupling will later allow us to compare the walks and their metric spaces simultaneously.

Write $upright(d) A$ for round area on the conformal sphere, and set

$ cal(D) \( u \) = integral_(S^2) \| nabla u \|^2 thin upright(d) A quad
  upright("for ") u in C \( S^2 \) ∩ W^(1 \, 2) \( S^2 \) \, $

with $cal(D) \( u \) = + oo$ for other continuous functions.
  The same notation on an open coordinate domain means the integral over that domain,
  with local weak differentiability required. Conformal invariance makes these definitions independent of the
  chosen chart.

=== 5.1 Transfer on the interior of a contour interval <transfer-on-the-interior-of-a-contour-interval>

First extend the plane conclusion beyond a single ordinary patch.
  Retain all forward dyadic unit changes $v = 2^k$ from Proposition 9.
  For each fixed $k$, the transformed rate still tends to infinity,
  so Theorem 32 applies on the ordinary patches inside that cone’s normalization disk.
  Under the joint zoom (2.16), these disks exhaust the plane away from the cone point.
  Pulling the countably many probability-one conclusions back to the original coordinate proves the local energy
  identity everywhere off that point. Both the network costs and the two-dimensional Dirichlet integral are
  unchanged by these transformations.

For $0 < d < 1 \/ 2$, let $I_d = \[ d \, 1 - d \]$. The decorated interval surface associated with the contour on
  $I_d$ has an interior determined by those increments. A compact subset of that interior,
  together with a small collar, has all its contour visits strictly inside $I_d$.
  Thus its eventual discrete incidences are read from the internal word;
  no information from either omitted end of the tour is needed.
  These are the interval-surface and complete-core assertions used in Lemma 5.

Here is the part of the excursion comparison that permits new variational observations.
  It concerns the joint law of the arrays and the word, not independence after weak convergence.

#thm([Lemma 5.1.])[
  (Additional observations under excursion conditioning).  #emph[Fix $0 < a < b < 1$.
    Let $W_N$ be the diffusively rescaled free axial increment path on
    $\[ floor.l a N floor.r \, floor.l b N floor.r \]$, with linear interpolation,
    and let $Z_N$ be any measurable function of these increments with values in a fixed compact metrizable space.
    Suppose $\( W_N \, Z_N \) arrow.r.double \( W \, Z \)$ along a sequence of even $N$.
    There is a nonnegative continuous function $f_(a \, b)$ of the limiting path, with expectation one,
    such that the corresponding pair under quadrant-excursion conditioning converges to the law
$ f_(a \, b) \( w \) thin "Law" \( W \, Z \) \( upright(d) w \, upright(d) z \) . $

 In particular, every probability-one property of $\( W \, Z \)$ also holds for this conditioned limit.
   A countable product of compact-valued observations is allowed for $Z_N$.]
] <sph:block-density>

#proof[
  The lemma #emph[Excursion densities] in the spanning-tree sphere section of [22] proves the following statements
    for the density $f_N$ of this increment block. If $w_N arrow.r w$ uniformly, then $f_N \( w_N \) arrow.r
    f_(a \, b) \( w \)$; the limit depends continuously on the two coordinate minima and the net increment.
    Moreover, $sup_N bb(E) \[ f_N \( W_N \)^2 \] < oo$ under the free law.
    These assertions follow there from the entrance-and-exit killed-walk density and its Gaussian bounds.
  Realize the assumed joint convergence almost surely. For any bounded continuous test $Phi$,
    first truncate the densities at height $K$. Sequential convergence and bounded convergence give convergence of
    the weighted expectations with truncated densities. The error in removing truncation is at most $K^(- 1)
    parallel Phi parallel_oo sup_N bb(E) \[ f_N \( W_N \)^2 \]$, and the analogous limit error has the same bound. Hence
  $ bb(E) \[ f_N \( W_N \) Phi \( W_N \, Z_N \) \] arrow.r bb(E) \[ f_(a \, b) \( W \) Phi \( W \, Z \) \] . $
  Taking $Phi = 1$ gives total mass one. The finite-resolution change of density depends only on the increment
    block, so its weighted expectation is precisely that of the additional block data under excursion
    conditioning. This proves the assertion. ◻
]

#thm([Proposition 5.2.])[
  (Energy identification under the sphere conditioning).  #emph[Consider any joint subsequential extraction of the
    sphere contour and the countable internal variational arrays on $I_d$,
    for every rational $d in \( 0 \, 1 \/ 2 \)$, using the extraction convention of Proposition 12.
    Almost surely, on every open domain compactly contained in the interior of one of these interval surfaces,
    both primal and dual inner relaxed energies equal $cal(D)$.
    This identity holds simultaneously for all continuous targets, with the value $+
    oo$ when the target is not locally Sobolev or its Dirichlet integral diverges.]
] <sph:transfer>

#proof[
  At each resolution retain the energy minima with rational value constraints and finite unions of relative-time
    intervals as selectors. Only increments within $I_d$ enter these internal graphs and tests.
    Their compactified values are therefore permissible additional block data in Lemma 33.
    The corresponding free experiment is the bilateral sewing at rate $m = 2 n$.
    In that experiment adjoin these jump-indexed internal tests to the Poisson-instruction arrays before
    extraction. Each added test is computed from its exact integer increment block and is unchanged when an
    independent Poisson clock is attached to the word. The earlier local identity applies in this enlarged
    extraction. To read it from the internal tests, use complete pieces and fixed spatial collars as described
    below. The vanishing discrepancy of the rescaled clocks only locates the selectors inside these collars;
    the numerical energy outputs themselves are retained unchanged,
    without a continuity claim for them under relabeling.
  Starting with the given conditioned extraction, take a further subsequence on which the corresponding free block
    and its internal array converge jointly. This is possible by tightness of the free contour and compactness of
    the array space, simultaneously for the countably many intervals by diagonal extraction.
    The weighted-limit lemma then identifies the already specified conditioned block limit with the density tilt
    of this free joint limit.
  Theorem 32 identifies the inner relaxed energies in that bilateral experiment,
    away from its distinguished point. The distinguished point does not belong to this interval surface:
    time zero is almost surely a singleton Brownian contour fiber.
    Indeed, each coordinate takes values strictly below its value at zero arbitrarily close to zero on both sides.
    Thus no nontrivial identification link in either coordinate can have zero as an endpoint,
    and neither can the equivalence relation generated by those links identify zero with another time.
    Since $I_d subset \( 0 \, 1 \)$, its image excludes the distinguished point.
  To express the local energy conclusion in terms of the block alone,
    reconstruct its abstract decorated interval surface $H_d$ from the limiting increments using the interval
    reconstruction in Proposition 2. This reconstruction supplies the surface and its restricted curve modulo
    conformal coordinates. Evaluate the local identity in a conformal representative,
    using a countable atlas and compact exhaustions of its interior;
    conformal invariance makes the event independent of that representative.
    Both the restricted curve locating the labels and the coordinate domains for the targets belong to this
    reconstructed interval surface. For a compact $K$ in one such domain and an open enlargement $U$ with a
    collar, Lemma 5 supplies all incidences near $K$ from the internal word.
    The selectors of Lemma 6 put every constraint on $K$ between constraints on internal graphs contained in $U$.
    Rational tolerances and compact exhaustion therefore express the inner relaxed energy using only the limiting
    block and its retained arrays. A change of the conformal representative preserves both the transported energy
    identity and the Dirichlet integral. The resulting assertion is intrinsic to $H_d$;
    the surrounding cone or sphere embedding supplies no further data for its definition.
  The simultaneous quantifier on targets can also be retained in this transfer.
    On a compact coordinate set use a countable dense library of continuous functions and rational tolerances.
    Uniform closeness of two targets enlarges or shrinks a tolerance constraint by at most that distance.
    The library therefore describes all the relaxed value tests,
    jointly measurably in the retained arrays and the target.
    This is a discretization of constraints, not an approximation of Dirichlet energy merely from values on a
    uniformly dense library. For varying charts use a countable atlas and compact exhaustions.
    The usual Dirichlet integral, with its infinite-value convention, is likewise Borel on continuous targets:
    weak derivatives and their energy can be tested against countably many smooth functions on the exhaustion.
    Existence of a continuous target violating the identity is consequently an analytic event,
    obtained by projection from its Polish function space. The event of equality for all targets is universally
    measurable. Theorem 32 gives precisely this simultaneous event under the free law,
    so absolute continuity applies to it without a target-dependent exceptional set.
  Absolute continuity of the joint block law now transfers the probability-one identity to the excursion
    experiment. A countable intersection over $d$, charts, and exhaustions proves the result.
    The rest of the sphere contour may be retained in this coupling:
    the complement of the event already has zero probability in the internal marginal, hence also in the joint law. ◻
]

The interval interiors exhaust the sphere away from the tour endpoint, denoted by $p$.
  In fact, the inverse image under the continuous contour of a compact set disjoint from $p$ is compact and avoids
  times $0$ and $1$; the same holds after a sufficiently small spatial enlargement.
  The interval-surface identification then places the set and its collar in an interior with $d > 0$.
  Consequently Proposition 34 gives the local energy identity at every point other than $p$.

=== 5.2 Removing the tour endpoint <removing-the-tour-endpoint>

There are two different issues at $p$. A limit of bounded-energy functions must have no extra Sobolev singularity
  there, and recovery sequences must incur no extra discrete energy there. The following elementary fact handles both.

#thm([Lemma 5.3.])[
  (Continuous Sobolev removability).  #emph[Let $p$ be a point of a smooth two-dimensional surface.
    If $u$ is continuous near $p$, is locally $W^(1 \, 2)$ off $p$, and has finite Dirichlet integral near $p$,
    then $u$ is $W^(1 \, 2)$ across $p$. Moreover, if $u$ is continuous and Sobolev on a compact surface,
    there are continuous Sobolev functions $u_r$, constant on a neighborhood of $p$ and equal to $u$ outside a
    shrinking disk, such that
$ parallel u_r - u parallel_oo arrow.r 0 \, wide parallel u_r - u parallel_(W^(1 \, 2)) arrow.r 0 . $

]
] <sph:removability>

#proof[
  Work in a coordinate disk centered at $p$. A point has zero two-dimensional Sobolev capacity:
    radial logarithmic cutoffs equal to one on a shrinking inner disk and zero outside a fixed disk have Dirichlet
    energies tending to zero. Testing the weak-derivative identity off $p$ with the complementary cutoffs proves
    the identity across $p$. More explicitly, the additional term containing the cutoff gradient tends to zero by
    Cauchy–Schwarz, since $u$ is bounded on the support of a fixed smooth test function,
    while the term containing $nabla u$ converges by its local square integrability.
  For the approximation choose a smooth cutoff $chi_r$ equal to one on $B \( p \, r \)$,
    zero outside $B \( p \, 2 r \)$, taking values in $\[ 0 \, 1 \]$,
    and with $integral \| nabla chi_r \|^2 thin upright(d) A lt.eq C$ independently of $r$. Set
  $ u_r = u \( p \) + \( 1 - chi_r \) \( u - u \( p \) \) . $
  The uniform error is bounded by the oscillation of $u$ on $B \( p \, 2 r \)$. For the gradient error,
  $ integral \| nabla \( u_r - u \) \|^2 thin upright(d) A lt.eq
    2 integral_(B \( p \, 2 r \)) \| nabla u \|^2 thin upright(d) A + 2 C sup_(B \( p \, 2 r \)) \| u -
    u \( p \) \|^2 \, $
  and both terms tend to zero. The ordinary $L^2$ error follows from uniform convergence. ◻
]

In a coupled extraction, choose a location $pi_n \( v \) in
  S^2$ for each primal vertex from one of its contour visits;
  different choices have uniformly vanishing discrepancy. Use $pi_n^(*)$ on the dual.
  For functions on the varying vertex sets, uniform convergence to $u$ means

$ max_(v in V_n) \| u_n \( v \) - u \( pi_n \( v \) \) \| arrow.r 0 . $

The small-image joining and mesh assertions in the input guarantee that this convention agrees with the local
  comparisons already used. Harmonicity on an open set $U$ means that the graph Laplacian vanishes at every vertex
  whose location is in $U$. For a compact subset of $U$, all adjoining stars also lie in $U$ once $n$ is large;
  thus this convention permits the buffered uses of Lemma 21.

#thm([Theorem 5.4.])[
  (Global sphere energies).  #emph[From any subsequence of the tree-decorated sphere maps,
    one can take a further joint extraction and a coupling with the limiting ordinary quantum sphere such that the
    following statements hold almost surely.]
  + #emph[If $u_n$ converges uniformly to $u in C \( S^2 \)$, then
$ liminf_(n arrow.r oo) sans(e)_n \( u_n \) gt.eq cal(D) \( u \) . $

]
  + #emph[For each $u in C \( S^2 \) ∩ W^(1 \, 2) \( S^2 \)$ there are uniformly convergent approximations $u_n$
    for which
$ sans(e)_n \( u_n \) arrow.r cal(D) \( u \) . $

 Both assertions hold on the dual with $sans(e)_n^(*)$ and $pi_n^(*)$.]
  + #emph[On every open set, graph-harmonic functions with bounded energy and bounded absolute value are locally
    equicontinuous under these locations and have locally uniformly convergent subsequences.
    This holds also on the dual and at the tour endpoint.]
  #emph[All these conclusions may be required in the same extraction as the metric and measure comparison below.]
] <sph:energy>

#proof[
  Retain the internal tests of Proposition 34 and also the whole-sphere tests defining uniform relaxed energy.
    The latter are countable compactified arrays; they need no local conditional kernel.
    The selector sandwich applies to them in the same way.
  Suppose first that $liminf_n sans(e)_n \( u_n \) < oo$ and pass to a subsequence realizing this liminf.
    On disjoint compact-interior patches away from $p$, Proposition 34 bounds their limiting Dirichlet integrals
    by the discrete energies in those patches. Exhausting the complement of $p$ gives
  $ integral_(S^2 \\ { p }) \| nabla u \|^2 thin upright(d) A lt.eq liminf_n sans(e)_n \( u_n \) . $
  Lemma 35 supplies the weak derivative at $p$. This proves the first assertion, including its infinite-value case.
  For the upper bound, first take a continuous Sobolev target that is constant near $p$.
    Cover the complement of a smaller constant disk by finitely many patches from Proposition 34.
    Subdivide it into finitely many smaller coordinate regions with piecewise smooth boundaries,
    each contained in one patch, and thicken these regions slightly.
    The boundaries have zero round area, so their collars can be chosen with arbitrarily small total integral of
    $\| nabla u \|^2$. Local recovery on the thickened regions and successive applications of Lemma 23 now give
    recovery on the compact complement: the main energy is bounded by the sum of the target energies on those
    regions, and only the chosen small collars are counted more than once.
    The error terms from gluing tend to zero by uniform agreement on each fixed collar.
    This proves recovery with arbitrarily small energy slack. Extend by the constant on the smaller disk.
    To make the extension exact, use a cutoff whose transition lies in a fixed annulus where the target is
    constant. Apply the finite-cover recovery just proved to a slightly larger annular neighborhood and a smooth
    cutoff $b$ that is constant on its two collars. If $b_n$ is its recovery and $delta_n > parallel b_n -
    b parallel_oo$ tends to zero, replace $b_n$ by
  $ (frac(b_n - delta_n, 1 - 2 delta_n)) or 0 and 1 . $
  This is exactly zero and one on the respective flat collars,
    and its energy is at most $\( 1 - 2 delta_n \)^(- 2) sans(e)_n \( b_n \)$.
    The functions being joined differ by $o \( 1 \)$ on the transition,
    so the extra term in the gluing estimate is $o \( 1 \)$. The mesh tends to zero,
    hence every edge crossing either gluing boundary is contained in the fixed collar for all sufficiently large $n$.
  For a general continuous Sobolev $u$, apply the approximation $u_r$ of Lemma 35.
    Recover each fixed $u_r$ first, then use a diagonal choice of $r arrow.b 0$.
    Uniform convergence and convergence of $cal(D) \( u_r \)$ give the desired upper bound;
    the first assertion makes it an equality. The proof for the dual is identical.
  Away from $p$, harmonic compactness follows from Lemma 21.
    To include $p$, take any fixed finite stack of disjoint annuli centered at $p$, each of the same aspect ratio,
    in a domain of harmonicity. Every transition annulus avoids $p$.
    By the preceding local recovery, its dual cutoff can be taken with energy bounded by a constant depending only
    on the aspect ratio, with exact constant values on its two sides.
    Fill the inner side by the constant; this uses only a flat collar in the annulus.
    Lemma 20 gives a primal circuit in each annulus whose oscillation squared is bounded by that constant times
    the primal energy in the annulus. Among $k$ disjoint annuli,
    one therefore has oscillation at most $C k^(- 1 \/ 2)$ when the total energy is bounded.
    The maximum principle transfers this oscillation to all vertices inside its circuit.
    First choose $k$, and then take large $n$; no annulus radius depends on $n$.
    Finite covers give equicontinuity, and bounded values give compactness.
    Exchanging primal and dual proves the remaining assertion. ◻
]

=== 5.3 Keeping the metric and the quantum area in the same coupling <keeping-the-metric-and-the-quantum-area-in-the-same-coupling>

The coordinate used for energy convergence must also describe the metric-measure limit.
  The contour correspondence makes this precise.

#thm([Proposition 5.5.])[
  (Joint spatial comparison).  #emph[The extraction in Theorem 36 can be chosen so that its limiting sphere is the
    one in the metric-measure limit and, almost surely,
#[#set math.equation(numbering: n => "(5.1)")
 $ sup_(v \, w in V_n) \| a_n d_n \( v \, w \) - D_h \( pi_n \( v \) \, pi_n \( w \) \) \| & arrow.r 0 \,\
sup_(x in S^2) "dist"_(D_h) \( x \, pi_n \( V_n \) \) & arrow.r 0 \,\
\( pi_n \)_(*) mu_n & arrow.r.double mu_h . $ <sph:distortion>]

 The maximum round diameter of a projected edge tends to zero.
   The measure $mu_h$ is nonatomic and has full support, and $D_h$ induces the round topology.]
] <sph:comparison>

#proof[
  The sphere-identification proposition and the final normalization argument for spanning-tree maps in [22] give,
    jointly with the excursion, the contour correspondence
  $ { \( v_(floor.l 2 n t floor.r) \, eta \( t \) \) : 0 lt.eq t lt.eq 1 #scale(x: 120%, y: 120%)[}] $
  with distortion tending to zero. Here $v_j$ is the primal vertex at the start of tour step $j$ and $eta$ is the
    sphere contour. Those results identify the metric of this very peanosphere limit;
    they do not introduce an independent quantum sphere. Their deterministic diameter normalization is the $a_n$
    in Theorem 1. Choosing one visit for each vertex changes the correspondence by a uniformly vanishing
    discrepancy, which gives (5.1) and (5.1).
  There are $2 n$ tour step starts. Their vertex occupation measure is $mu_n$:
    horizontal tree traversals are counted at their starting vertices,
    and vertical steps count the non-tree half-edges at their incident vertices.
    Every half-edge is counted once, including both half-edges of a loop.
    The area parameterization of $eta$ therefore gives (5.1).
    Mesh convergence is the sphere projection construction preceding Proposition 3.
    Nonatomicity, full support, and agreement of the metric and conformal topologies are the quantum-area and
    metric properties in the same repository input.
  All these variables may be retained together with the compactified energy arrays before extraction.
    The metric identification is unchanged upon a further extraction, so it holds in the coupling of Theorem 36. ◻
]

== 6 A Green estimate in the finite map law <sec:green>

Uniform approximation of energies concerns continuous functions.
  To control the walk clock, we also need to show that bounded sources of small stationary mass have small
  potentials. We prove this directly under the finite map law.
  The argument combines a spanning-forest formula for the inverse Laplacian with the two tree contours in Mullin’s
  encoding.

Write $N = 2 n$. Let $H_n$ be the positive graph Laplacian on $V_n$, using counting measure and unit conductances,
  so that

$ chevron.l u \, H_n u chevron.r = sans(e)_n \( u \) = sum_(a b in E \( M_n \)) \( u \( a \) - u \( b \) \)^2 . $

There is one term for each unoriented edge, and loops contribute zero.
  For a real function $f$ with $mu_n \( f \) = 0$, define $G_n f$ by

#[#set math.equation(numbering: n => "(6.1)")
 $ H_n G_n f = mu_n f \, wide mu_n \( G_n f \) = 0 . $ <gr:green-definition>]

Here $mu_n f$ on the right denotes the vector with entry $mu_n \( v \) f \( v \)$ at $v$.
  Connectedness gives existence and uniqueness.

#thm([Proposition 6.1.])[
  (Small-mass Green estimate).  #emph[For each fixed $rho in \( 0 \, 1 \/ 2 \)$ there are nonnegative random
    variables $A_n$, measurable functions of $M_n$, such that
#[#set math.equation(numbering: n => "(6.2)")
 $ sup_(n gt.eq 1) bb(E) A_n < oo \, wide parallel G_n f parallel_oo lt.eq
   A_n thin mu_n \( \| f \| \)^rho $ <gr:green-main>]

 simultaneously for all real functions $f : V_n arrow.r bb(R)$ satisfying $parallel f parallel_oo lt.eq
   1$ and $mu_n \( f \) = 0$. The expectation is under the map marginal of the uniform rooted map–spanning-tree
   pair law. In particular, $\( A_n \)$ is tight.]
] <gr:green-bound>

We first identify the exact inverse formula. We then estimate its terms by grouping tree cuts according to the
  amount of tour time on their smaller side.

=== 6.1 The inverse Laplacian as a sum over cuts <the-inverse-laplacian-as-a-sum-over-cuts>

The next identity is a consequence of the matrix-tree theorem and its forest expansions;
  see the all-minors theorem of [4] and [17] Chapter 4 for electrical networks and spanning trees.
  We give the determinant argument to specify the multiplicities and centering used here.

#thm([Lemma 6.2.])[
  (Forest representation).  #emph[Let $cal(G)$ be a finite connected multigraph,
    with positive probability measure $mu$ on its vertex set $V$,
    and let $H$ be its unit-conductance graph Laplacian. Suppose $q : V arrow.r
    bb(R)$ satisfies $sum_(v in V) q \( v \) = 0$, and let $u$ solve $H u = q$, $mu \( u \) = 0$.
    For a uniform spanning tree $T$ of $cal(G)$ and an edge $e in T$, choose either component $S_e$ of $T \\ e$,
    and let $b_e$ be the number of graph edges between $S_e$ and $V \\ S_e$, with multiplicity. Then
#[#set math.equation(numbering: n => "(6.3)")
 $ u \( x \) =
   bb(E)_T sum_(e in T)
   frac(q \( S_e \) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ x in S_e }) - mu \( S_e \)
   #scale(x: 120%, y: 120%)[\)], b_e) \, wide x in V \, $ <gr:forest-identity>]

 where $q \( S \) = sum_(v in S) q \( v \)$. The value does not depend on the choice of component for any $e$.]
] <gr:forest>

#proof[
  The one-vertex case is immediate, so suppose $m := \| V \| gt.eq 2$.
    Orient the non-loop edges arbitrarily and delete the row of a fixed vertex $o$ from the incidence matrix.
    Denote the resulting matrix by $B$, and write $hat(q)$ for $q$ with its $o$-coordinate deleted.
    The reduced Laplacian is $hat(H) = B B^(sans(T))$. If $tau$ is the number of spanning trees,
    the matrix-tree theorem and the determinant lemma give
  #[#set math.equation(numbering: n => "(6.4)")
   $ det \( hat(H) + z hat(q) hat(q)^(sans(T)) \) = tau #scale(x: 120%, y: 120%)[\(] 1 +
     z hat(q)^(sans(T)) hat(H)^(- 1) hat(q) #scale(x: 120%, y: 120%)[\)] . $ <gr:rank-one>]
  For $z gt.eq 0$, apply Cauchy–Binet to the matrix obtained by appending $sqrt(z) hat(q)$ to $B$.
    A term contributing to the coefficient of $z$ selects $m - 2$ incidence columns and the source column.
    The incidence columns are independent exactly when their edges form a spanning forest with two components.
    Indeed, a cycle gives a linear dependence, whereas an acyclic graph with $m -
    2$ edges has exactly two components, counting isolated vertices.
  For such a forest $F$, let $S_F$ be its component not containing $o$.
    Its corresponding determinant has absolute value $\| q \( S_F \) \|$.
    To see this, successively eliminate leaf rows and their incident forest columns.
    Eliminating a leaf adds its source entry to its neighbor’s entry.
    The component containing $o$ disappears into the deleted row,
    and the last entry in the other component is $sum_(v in S_F) q \( v \)$.
    Consequently, comparison of the coefficients of $z$ in (6.4) yields
  #[#set math.equation(numbering: n => "(6.5)")
   $ hat(q)^(sans(T)) hat(H)^(- 1) hat(q) = 1 / tau sum_F q \( S_F \)^2 . $ <gr:two-forest-quadratic>]
  Let $H^(+)$ be the inverse of $H$ on counting-mean-zero vectors, extended by zero on constants.
    Solving the equation with value zero at $o$ shows that the left side of (6.5) equals $q^(sans(T)) H^(+) q$.
    Polarization therefore gives, for any two vectors $q \, r$ of total sum zero,
  #[#set math.equation(numbering: n => "(6.6)")
   $ q^(sans(T)) H^(+) r = 1 / tau sum_F q \( S_F \) r \( S_F \) . $ <gr:two-forest-bilinear>]
  Replacing $S_F$ by its complement changes the sign of each factor, so the product is independent of this choice.
  Every two-component forest $F$ has exactly $b \( F \)$ extensions to a spanning tree:
    add any one of the graph edges across its cut. Thus, when all pairs $\( T \, e \)$ are counted, $F =
    T \\ e$ occurs exactly $b \( F \)$ times. This explains the denominator in (6.3).
    Apply (6.6) with $r = delta_x - mu$. Its left side is
  $ \( H^(+) q \) \( x \) - mu \( H^(+) q \) = u \( x \) \, $
  and its right side, regrouped by $\( T \, e \)$, is the asserted expression.
    Loops enter neither the reduced incidence matrix nor a cut; parallel edges are counted separately throughout. ◻
]

=== 6.2 What a tree cut records in the tour <what-a-tree-cut-records-in-the-tour>

We use the finite form of Mullin’s correspondence [20], with the incidence conventions of [22]
  Section “Independent-walk encoding and local quantum surfaces”.
  The $N$ steps form a quadrant excursion whose horizontal and vertical coordinates are denoted by $L$ and $R$.
  Horizontal steps traverse the selected primal tree $T$; vertical steps traverse the complementary dual tree
  $T^(*)$. In each coordinate an up-step is matched with the down-step that first returns to its initial height.
  A matched horizontal pair represents a tree edge. A matched vertical pair represents a non-tree map edge between
  the primal vertices at its two step starts. Let $v_i$ be the primal vertex at step start $i$,
  with all indices read cyclically modulo $N$.

#thm([Lemma 6.3.])[
  (Tour mass and cut size).  #emph[For each $v in V_n$,
#[#set math.equation(numbering: n => "(6.7)")
 $ \# { 0 lt.eq i < N : v_i = v } = deg_(M_n) \( v \) . $ <gr:tour-degree>]

 For $e in T$, the step starts visiting either component of $T \\ e$ form a cyclic interval.
   Choose a component $S_e$ whose interval $I_e$ has length $ell_e lt.eq N \/ 2$.
   If the lengths agree, choose the component not containing $v_0$. Then
#[#set math.equation(numbering: n => "(6.8)")
 $ mu_n \( S_e \) = ell_e / N \, wide b_e = 1 + D_e^(*) \, $ <gr:tour-cut-identities>]

 where $D_e^(*)$ is the distance in $T^(*)$ between the dual vertices at the two horizontal traversal steps of $e$.]
] <gr:tour-cut>

#proof[
  Associate each step start with the departing step. The two horizontal traversals of a tree edge depart once from
    each endpoint, and hence count its two incidences. The two steps of a vertical matched pair count the two
    incidences of its non-tree edge. When that edge is a loop, both are assigned to the same vertex.
    Every step belongs to one such pair, proving (6.7); this is also the tour-measure lemma of [22] Section “From
    tree excursions to the measured quantum sphere”.
  The primal vertex changes only along horizontal steps. It passes between the two components of $T \\ e$ exactly
    at the two traversals of $e$. Thus each side occupies one cyclic interval, and (6.7) proves the mass identity.
  There is exactly one tree edge across this cut, namely $e$.
    A non-tree edge crosses it precisely when exactly one step of its vertical matched pair belongs to $I_e$.
    Ignore horizontal holds and follow the resulting dual-tree contour segment.
    An edge of $T^(*)$ is traversed once on this segment exactly when its matched steps lie on opposite sides of
    $I_e$; every other dual edge is traversed zero or twice. In a tree the edges traversed an odd number of times
    by a path are exactly the edges on the simple path between its endpoints.
    These endpoints are the dual vertices at the two horizontal traversals of $e$,
    since horizontal steps do not change the dual vertex. There are therefore $D_e^(*)$ non-tree edges across the
    cut, giving $b_e = 1 + D_e^(*)$. ◻
]

Hereafter expectations involving both $T$ and the map use the uniform pair law.
  The sequence $\( v_i \)$ is determined by the horizontal contour and the locations of the horizontal slots.
  Thus the cut intervals, their lengths, and the smaller-side convention in Lemma 40 are determined without
  inspecting the shape of the vertical contour. By (6.7), the same is true of the vertex masses.

The conditional structure of the finite law is useful. Let $J$ be the number of horizontal steps.
  Conditional on $J$, the horizontal slots form a uniform $J$-subset of ${ 0 \, dots.h \, N - 1 }$.
  Conditional on these slots, the two coordinate strings, with holds deleted,
  are independent uniform Dyck excursions of lengths $J$ and $N - J$.
  In fact, writing $C_k = \( k + 1 \)^(- 1) binom(2 k, k)$ for the Catalan numbers,
  the number of quadrant excursions with $J = 2 k$ is

#[#set math.equation(numbering: n => "(6.9)")
 $ binom(2 n, 2 k) C_k C_(n - k) \, wide sum_(k = 0)^n binom(2 n, 2 k) C_k C_(n - k) =
   C_n C_(n + 1) . $ <gr:schedule-count>]

The last equality is Vandermonde’s identity after writing out the Catalan numbers.
  These counts also prove the stated conditional independence.
  Catalan estimates and a binomial tail bound give absolute $C \, c > 0$ such that

#[#set math.equation(numbering: n => "(6.10)")
 $ bb(P) { J in.not \[ N \/ 4 \, 3 N \/ 4 \] } lt.eq C \( N + 1 \)^3 e^(- c N) . $ <gr:count-tail>]

The same schedule calculation is recorded in the excursion discussion of [22] Section “From tree excursions to the
  measured quantum sphere”. It is an exact calculation in the fixed-size law.

=== 6.3 Distances in a uniform contour tree <distances-in-a-uniform-contour-tree>

The cut denominator in (6.8) is a dual-tree distance. The next estimates quantify its typical size and also
  control how many primal cuts can surround a given tour time.

#thm([Lemma 6.4.])[
  (Contour distance estimates).  #emph[Let $cal(T)_s$ be a uniform rooted plane tree with $s \/ 2$ edges,
    where $s gt.eq 2$ is even, and write $w_i$, $i in bb(Z) \/ s bb(Z)$, for its cyclic contour vertices.
    If $i \, j$ are deterministic with $0 lt.eq j lt.eq s$, set
$ D = "dist"_(cal(T)_s) \( w_i \, w_(i + j) \) \, wide d = 1 + min \( j \, s - j \) . $

 There are absolute constants $C \, c > 0$ such that, for every integer $a gt.eq 0$,
#[#set math.equation(numbering: n => "(6.11)")
 $ bb(P) \( D = a \) lt.eq C \( a + 1 \)^2 d^(- 3 \/ 2) e^(- c a^2 \/ d) . $ <gr:dyck-density>]

 Consequently, for every fixed $p > 0$,
#[#set math.equation(numbering: n => "(6.12)")
 $ parallel \( 1 + D \)^(- 1) parallel_(L^2) lt.eq C d^(- 1 \/ 2) \, wide parallel D parallel_(L^p) lt.eq
   C_p sqrt(d) . $ <gr:dyck-moments>]

 For every deterministic cyclic segment $K$ from corner $i$ through corner $i + L$, where $1 lt.eq L lt.eq s$,
#[#set math.equation(numbering: n => "(6.13)")
 $ parallel "diam"_(cal(T)_s) { w_(i + r) : 0 lt.eq r lt.eq L } #scale(x: 120%, y: 120%)[parallel]_(L^4) lt.eq
   C sqrt(L) . $ <gr:contour-diameter>]

]
] <gr:dyck>

#proof[
  Rerooting a plane tree at its $i$th contour corner is a bijection on rooted plane trees with $s \/ 2$ edges.
    Its inverse reroots by $s - i$ corners. Thus the rerooted tree is uniform,
    and $D$ has the law of the height at time $j$ of a uniform Dyck excursion of length $s$.
  Let $p_l \( a \)$ be the probability that a simple symmetric walk started at zero stays nonnegative for $l$
    steps and finishes at $a$. Reflection and the binomial estimate give
  #[#set math.equation(numbering: n => "(6.14)")
   $ p_l \( a \) & = 2^(- l) [binom(l, \( l + a \) \/ 2) - binom(l, \( l + a + 2 \) \/ 2)] \,\
p_l \( a \) & lt.eq C \( a + 1 \) \( l + 1 \)^(- 3 \/ 2) e^(- c a^2 \/ \( l + 1 \)) \, $ <gr:killed-kernel>]
  with inadmissible binomial coefficients interpreted as zero.
    For even $s$, $p_s \( 0 \)$ is comparable to $\( s + 1 \)^(- 3 \/ 2)$.
    The Markov property and time reversal of the second segment give
  $ bb(P) \( D = a \) = frac(p_j \( a \) p_(s - j) \( a \), p_s \( 0 \)) . $
  Inserting (6.14) proves (6.11). Summing it after multiplication by $\( a + 1 \)^(- 2)$ or by $a^p$ proves
    (6.12). In the first case the remaining Gaussian sum is at most $C sqrt(d)$,
    so the second moment is at most $C \/ d$.
  For completeness, the diameter estimate follows by dyadic chaining.
    Reroot at the deterministic first corner of $K$ and parametrize its steps by the integers in $\[ 0 \, L \]$.
    At refinement level $l$, use the times $floor.l k L \/ 2^l floor.r$, $0 lt.eq k lt.eq 2^l$, and stop at $l =
    ceil.l log_2 L ceil.r$. These grids are nested and the last one contains every integer in $\[ 0 \, L \]$.
    Include the initial increment from $0$ to $L$. For $l gt.eq 1$,
    there are $O \( 2^l \)$ new-to-parent increments at level $l$, each spanning at most $C L 2^(- l)$ steps.
    By the fourth-moment estimate and $parallel max_k Z_k parallel_(L^4)^4 lt.eq
    sum_k parallel Z_k parallel_(L^4)^4$, the maximum tree distance across these increments has $L^4$ norm at most
  $ C 2^(l \/ 4) sqrt(L 2^(- l)) = C sqrt(L) thin 2^(- l \/ 4) . $
  Every contour vertex can be joined to the first vertex through its ancestors in the dyadic grids.
    The triangle inequality and the summability of $2^(- l \/ 4)$ bound the maximum distance from that first
    vertex by $C sqrt(L)$ in $L^4$. The diameter is at most twice this maximum.
    For $L = 1$ the bound follows directly from the single edge. ◻
]

=== 6.4 The sum of reciprocal cut sizes at one scale <the-sum-of-reciprocal-cut-sizes-at-one-scale>

For a dyadic integer $M$ with $1 lt.eq M lt.eq N \/ 2$, let

$ cal(E)_M = { e in T : M lt.eq ell_e < 2 M } \, wide U_(M \, t) = sum_(e in cal(E)_M\
t in I_e) 1 / b_e \, wide t in bb(Z) \/ N bb(Z) . $

The intervals in this sum come from the horizontal tree. Their denominators are governed by the independent
  vertical tree once the schedule and the horizontal tree have been fixed.

#thm([Lemma 6.5.])[
  (One-scale estimate).  #emph[There is an absolute constant $C$ such that, for every $n$, every dyadic $M lt.eq
    N \/ 2$, and every deterministic tour time $t$,
#[#set math.equation(numbering: n => "(6.15)")
 $ bb(E) U_(M \, t)^2 lt.eq C . $ <gr:Ut>]

]
] <gr:one-scale>

#proof[
  First condition on a count $J in \[ N \/ 4 \, 3 N \/ 4 \]$.
    Consider all cyclic intervals containing $t$ whose lengths lie in $\[ M \, 2 M \)$ and are at most $N \/ 2$.
    There are at most $C \( M + 1 \)^2$ such intervals. For each one,
    a uniform schedule puts at least $c_0 M$ vertical steps in both the interval and its complement,
    except with probability $C e^(- c M)$, for suitable absolute $c_0 \, c > 0$.
    Indeed, the vertical density is at least $1 \/ 4$, both sets have at least $M$ slots,
    and the hypergeometric lower-tail bound applies. Taking a union bound,
    let $cal(B)_(M \, t)$ be the event that this property fails for some interval. Uniformly over the balanced counts,
  #[#set math.equation(numbering: n => "(6.16)")
   $ bb(P) \( cal(B)_(M \, t) divides J \) lt.eq C \( M + 1 \)^2 e^(- c M) . $ <gr:schedule-tail>]
  Fix a schedule outside $cal(B)_(M \, t)$ and then condition on the horizontal Dyck excursion.
    This fixes all intervals in $U_(M \, t)$. For each one, its dual endpoints are separated in the vertical
    contour by the number $j$ of vertical steps in that interval.
    Both $j$ and $\( N - J \) - j$ are at least $c_0 M$. Lemmas 40 and 41,
    followed by the triangle inequality in $L^2$ of the remaining vertical excursion, imply
  #[#set math.equation(numbering: n => "(6.17)")
   $ parallel U_(M \, t) parallel_(L^2 \( R divides upright("schedule") \, L \)) lt.eq C /
     sqrt(M) thin K_(M \, t) \, wide K_(M \, t) := \# { e in cal(E)_M : t in I_e } . $ <gr:vertical-bound>]
  We next bound this number of horizontal cuts. Any two components $S_e \,
    S_(e')$ containing $v_t$ are nested unless their union is all of $V_n$.
    This elementary tree property follows by considering the components cut off from $v_t$:
    they are either nested or disjoint. The union alternative cannot occur for the chosen smaller sides, since
  $ mu_n \( S_e union S_(e') \) = mu_n \( S_e \) + mu_n \( S_(e') \) - mu_n \( S_e ∩ S_(e') \) < 1 . $
  Here each of the first two terms is at most $1 \/ 2$, and the intersection contains $v_t$,
    whose mass is positive. Thus all components counted by $K_(M \, t)$ are nested.
  If the family is nonempty, let $S$ be its largest component and choose a contour vertex immediately outside its
    interval. It has a representative at cyclic distance at most $2 M + 2$ from $t$.
    The tree path from $v_t$ to that vertex crosses all $K_(M \, t)$ cut edges.
    Hence $K_(M \, t)$ is at most the diameter of the horizontal contour image of the deterministic window of tour
    times within $2 M + 2$ of $t$. After the schedule has been fixed and holds deleted,
    this is a deterministic contour segment with at most $4 M + 4$ horizontal steps.
    If the window covers the entire tour, the full horizontal contour instead has length $J lt.eq N lt.eq 4 M +
    4$. A segment with no horizontal steps has diameter zero; otherwise Lemma 41 applies.
    Uniformly in the schedule, we obtain
  #[#set math.equation(numbering: n => "(6.18)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] K_(M \, t)^2 divides upright("schedule") #scale(x: 120%, y: 120%)[\]]
     lt.eq C M . $ <gr:horizontal-count>]
  Combining (6.17) and (6.18) proves the required bound on schedules outside $cal(B)_(M \, t)$ with balanced counts.
  For the exceptional schedules, use a deterministic bound.
    Every interval counted by $K_(M \, t)$ has its two delimiting tree traversals within cyclic distance $2 M +
    2$ of $t$. Distinct tree edges have distinct traversal occurrences, so $K_(M \, t) lt.eq C \( M + 1 \)$.
    Since $b_e gt.eq 1$, the same bound holds for $U_(M \, t)$.
    By (6.16), the contribution of these schedules to its second moment is at most $C \( M + 1 \)^4 e^(- c M)$,
    uniformly bounded in $M$. Finally, $U_(M \, t) lt.eq N$ always.
    The unbalanced counts contribute at most $C N^2 \( N + 1 \)^3 e^(- c N)$ by (6.10), also uniformly bounded.
    This proves (6.15) under the full law. ◻
]

=== 6.5 Summing the scales <summing-the-scales>

We now return to the inverse formula. Lemma 42 controls the cut sum at a fixed time;
  a grid converts this into a uniform bound over vertices.

#proof[
  The one-vertex case has $G_n f = 0$, so set $A_n = 0$ there.
    Otherwise, for each dyadic $M lt.eq N \/ 2$, choose a deterministic cyclic grid $Gamma_M$.
    For $M gt.eq 8$, take its gaps at most $M \/ 4$, its cardinality at most $C N \/ M$,
    and its distinct points separated by at least $c M$. For $M < 8$, use all step indices;
    the same cardinality and separation bounds hold with absolute constants.
  An interval of length in $\[ M \, 2 M \)$ containing a fixed time $t$ contains a grid point within cyclic
    distance $2 M$ of $t$. There are only a bounded number of grid points in this neighborhood. Consequently,
  #[#set math.equation(numbering: n => "(6.19)")
   $ sup_t U_(M \, t) lt.eq C max_(t in Gamma_M) U_(M \, t) . $ <gr:grid-comparison>]
  Every visit to a given vertex belongs to the same side of a tree cut. Also, counting the visits in each interval gives
  $ sum_(e in cal(E)_M) frac(mu_n \( S_e \), b_e) = 1 / N sum_(t = 0)^(N - 1) U_(M \, t) . $
  It follows that
  #[#set math.equation(numbering: n => "(6.20)")
   $ W_M & := sup_(x in V_n) sum_(e in cal(E)_M) frac(upright(bold(1))_({ x in S_e }) + mu_n \( S_e \), b_e) lt.eq
     C max_(t in Gamma_M) U_(M \, t) \,\
bb(E) W_M & lt.eq C (sum_(t in Gamma_M) bb(E) U_(M \, t)^2)^(1 \/ 2) lt.eq C sqrt(N \/ M) . $ <gr:WM>]
  No independence among the grid variables is needed here.
  Fix $f$ as in the proposition and write $m_f = mu_n \( \| f \| \)$. For $e in cal(E)_M$, the source mass obeys
  #[#set math.equation(numbering: n => "(6.21)")
   $ lr(|sum_(v in S_e) mu_n \( v \) f \( v \)|) lt.eq min \( 2 M \/ N \, m_f \) lt.eq \( 2 M \/ N \)^(1 - rho)
     m_f^rho . $ <gr:source-interpolation>]
  Define, for the realized pair $\( M_n \, T \)$,
  $ Y_n \( M_n \, T \) = sum_(M lt.eq N \/ 2\
M upright(" dyadic")) \( 2 M \/ N \)^(1 - rho) W_M . $
  By (6.20),
  #[#set math.equation(numbering: n => "(6.22)")
   $ bb(E) Y_n lt.eq C_rho sum_(M lt.eq N \/ 2\
M upright(" dyadic")) \( M \/ N \)^(1 \/ 2 - rho) lt.eq C_rho . $ <gr:Y-mean>]
  The last bound is a geometric sum, using $rho < 1 \/ 2$.
  Conditional on $M_n$, the selected tree is uniform. Define
  #[#set math.equation(numbering: n => "(6.23)")
   $ A_n \( M_n \) = bb(E) #scale(x: 120%, y: 120%)[\[] Y_n \( M_n \, T \) divides M_n
     #scale(x: 120%, y: 120%)[\]] . $ <gr:An>]
  Apply Lemma 39 with $q = mu_n f$. Taking absolute values, grouping by $M$, and using (6.21) proves
  $ parallel G_n f parallel_oo lt.eq A_n \( M_n \) m_f^rho . $
  The variable in (6.23) is independent of the choice of $f$,
    so this bound holds simultaneously for all admissible functions.
    The tower property and (6.22) give $sup_n bb(E) A_n < oo$, and Markov’s inequality gives tightness. ◻
]

The estimate depends only on the finite map law and its spanning trees.
  In particular, it controls the full potential of a small source,
  including any behavior on vertex sets that uniform approximation of continuous functions might fail to detect.

== 7 Resolvents and conditional path laws <sec:dynamics>

Uniform convergence of energies concerns continuous functions,
  whereas the speed measure may be singular with respect to round area.
  The Green estimate bridges this difference: it makes a bounded source on a set of small quantum mass produce a
  uniformly small potential. After removing that potential, a resolvent is locally harmonic,
  so the compactness theorem for harmonic functions applies.
  We first give this argument for a deterministic sequence of graphs.
  The last subsection applies it in the coupled random environments and proves Theorem 1.

=== 7.1 A deterministic convergence criterion <a-deterministic-convergence-criterion>

Let $S^2$ carry its round distance $d_0$ and area $upright(d) A$.
  Let $mu$ be a nonatomic probability measure with full support. Suppose the quadratic form

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(E) \( u \, u \) = 1 / 2 integral_(S^2) \| nabla u \|^2 thin upright(d) A \, wide u in C^oo \( S^2 \) \,
   $ <dyn:continuum-form>]

is closable in $L^2 \( mu \)$, and its closure $\( cal(E) \, cal(F) \)$ is a regular conservative Dirichlet form
  with an associated continuous-path diffusion $B$. We always start $B$ with law $mu$.
  These hypotheses hold for the Liouville area measures used here;
  the time-change and Dirichlet-form constructions are treated in [8,2], with general form theory in [7].
  Our normalization is the explicit factor $1 \/ 2$ in (7.1).

For each $n$, let $cal(G)_n$ be a finite connected graph, allowing loops and multiple edges,
  with vertex set $V_n$ and a strictly positive probability measure $mu_n$ on $V_n$. Write

$ \( H_n u \) \( v \) = sum_(v w) #scale(x: 120%, y: 120%)[\(] u \( v \) -
  u \( w \) #scale(x: 120%, y: 120%)[\)] \, wide sans(e)_n \( u \) = sum_({ v \, w }) \( u \( v \) - u \( w \) \)^2 . $

The first sum counts incidences at $v$, and the second counts unoriented edges with multiplicity.
  Loop summands vanish. Let $Y^n$ be the chain with generator

#[#set math.equation(numbering: n => "(7.2)")
 $ \( cal(L)_n u \) \( v \) = - frac(\( H_n u \) \( v \), 2 mu_n \( v \)) . $ <dyn:abstract-generator>]

It is reversible with respect to $mu_n$, and its form is $cal(E)_n \( u \, u \) = sans(e)_n \( u \) \/ 2$.
  Choose maps $pi_n : V_n arrow.r S^2$. Uniform comparison of functions always means

$ parallel u_n - u compose pi_n parallel_(oo \, V_n) arrow.r 0 . $

No injectivity of $pi_n$ is required.

#thm([Theorem 7.1.])[
  (From energies and Green bounds to path laws).  #emph[In the deterministic setting just defined,
    assume the following.]
  + #emph[$\( pi_n \)_(*) mu_n arrow.r.double mu$, and the maximum projected edge length tends to zero:
$ max_({ v \, w } in E \( cal(G)_n \)) d_0 \( pi_n \( v \) \, pi_n \( w \) \) arrow.r 0 . $

]
  + #emph[Every uniformly convergent sequence with continuous limit $u$ satisfies
$ liminf_n sans(e)_n \( u_n \) gt.eq integral \| nabla u \|^2 thin upright(d) A \, $

 where the right side is $+ oo$ unless $u in W^(1 \, 2) \( S^2 \)$.
   Every smooth $u$ has a uniformly convergent recovery sequence with energy tending to that integral.]
  + #emph[For every open $U subset S^2$, sequences that are graph-harmonic at all vertices in $pi_n^(- 1) \( U \)$
    and have uniformly bounded supremum and total energy are locally equicontinuous in $U$ under $pi_n$,
    and locally uniformly precompact there. Here equicontinuity means that, for every compact $K subset U$,
$ lim_(delta arrow.b 0) limsup_n sup_(pi_n \( v \) \, pi_n \( w \) in K\
d_0 \( pi_n \( v \) \, pi_n \( w \) \) lt.eq delta) \| u_n \( v \) - u_n \( w \) \| = 0 \, $

 and precompactness means uniform comparison with a continuous function on each compact subset after a common
   subsequence.]
  + #emph[For the centered solution operator
$ H_n G_n g = mu_n g \, wide mu_n \( G_n g \) = 0 \, wide mu_n \( g \) = 0 \, $

 there are constants $C < oo$ and $rho > 0$, independent of $n$, such that
#[#set math.equation(numbering: n => "(7.3)")
 $ parallel G_n g parallel_oo lt.eq C thin mu_n \( \| g \| \)^rho quad upright("if ") parallel g parallel_oo lt.eq
   1 upright(" and ") mu_n \( g \) = 0 . $ <dyn:green-assumption>]

]
  #emph[Then the laws of $\( pi_n \( Y_t^n \) \)_(0 lt.eq t lt.eq T)$, with initial law $mu_n$,
    converge in $D \( \[ 0 \, T \] \, S^2 \)$ to the law of $\( B_t \)_(0 lt.eq t lt.eq T)$, for every finite $T$.
    The limit has continuous paths. In addition, for every $alpha > 0$ and $f in C \( S^2 \)$,
    the resolvents converge uniformly under $pi_n$.]
] <dyn:conditional>

We prove the theorem through four lemmas. Their hypotheses throughout are those of Theorem 43.
  Notice that full support and weak convergence of the measures already imply that $pi_n \( V_n \)$ becomes dense:
  otherwise a fixed open ball of positive $mu$-mass would be missed along a subsequence.

#thm([Lemma 7.2.])[
  (Continuous Sobolev functions in the closed form).  #emph[If $u in C \( S^2 \) ∩ W^(1 \, 2) \( S^2 \)$,
    then $u in cal(F)$ and its closed-form energy is the right side of (7.1).
    It has smooth approximations converging both uniformly and in the form norm.
    Two continuous versions of the same element of $L^2 \( mu \)$ are equal everywhere.]
] <dyn:smooth-core>

#proof[
  In coordinate disks, mollification of a continuous Sobolev function converges both uniformly on smaller disks
    and in Sobolev norm. A smooth partition of unity gives smooth functions $u_j$ on the sphere with these two
    convergences globally. Since $mu$ is finite, uniform convergence also gives $L^2 \( mu \)$ convergence.
    Thus $\( u_j \)$ is Cauchy for $cal(E) \( dot.op \, dot.op \) +
    parallel dot.op parallel_(L^2 \( mu \))^2$ and has limit $u$ in the stipulated closure.
    The gradient convergence identifies its energy. Polarization gives the same identity for the bilinear form on
    continuous Sobolev functions. Finally a nonzero continuous difference is bounded away from zero on some open
    set, which has positive $mu$-mass by full support. ◻
]

Let $R_alpha^n = \( alpha - cal(L)_n \)^(- 1)$, and let $R_alpha$ be the $L^2 \( mu \)$ resolvent of
  $\( cal(E) \, cal(F) \)$.

#thm([Lemma 7.3.])[
  (Uniform resolvent convergence).  #emph[For every $alpha > 0$ and $f in C \( S^2 \)$,
    $R_alpha f$ has a unique continuous version, which belongs to round $W^(1 \, 2)$, and
#[#set math.equation(numbering: n => "(7.4)")
 $ parallel R_alpha^n \( f compose pi_n \) - \( R_alpha f \) compose
   pi_n #scale(x: 120%, y: 120%)[parallel]_oo arrow.r 0 . $ <dyn:resolvent-limit>]

 The same conclusion holds with right-hand sides $f_n$ converging uniformly under $pi_n$ to $f$.]
] <dyn:resolvent>

#proof[
  Put $u_n = R_alpha^n \( f compose pi_n \)$. The maximum principle and the resolvent equation give
  #[#set math.equation(numbering: n => "(7.5)")
   $ parallel u_n parallel_oo lt.eq frac(parallel f parallel_oo, alpha) \, wide H_n u_n = mu_n g_n \, wide g_n =
     2 \( f compose pi_n - alpha u_n \) . $ <dyn:resolvent-bounds>]
  In particular $g_n$ is uniformly bounded, and multiplying the equation by $u_n$ shows that $sans(e)_n \( u_n \)$
    is uniformly bounded.
  We first prove equicontinuity. Fix a point $x in S^2$, and choose disjoint open neighborhoods $U$ of $x$ and $V$
    of a different point. Take $mu$-null boundaries, with $mu \( V \) > 0$.
    The neighborhood $U$ may be made arbitrarily small in $mu$-mass because $mu$ has no atoms.
    Write $U_n = pi_n^(- 1) \( U \)$ and $V'_n = pi_n^(- 1) \( V \)$, and set
  $ q_n = g_n upright(bold(1))_(U_n) - frac(mu_n \( g_n upright(bold(1))_(U_n) \), mu_n \( V'_n \))
    upright(bold(1))_(V'_n) . $
  For large $n$, the denominator is bounded below. Hence $q_n$ has mean zero, bounded supremum,
    and $mu_n \( \| q_n \| \) lt.eq C_1 mu_n \( U_n \)$. Scaling (7.3) yields
  $ parallel G_n q_n parallel_oo lt.eq C_2 mu_n \( U_n \)^rho . $
  Also
  $ sans(e)_n \( G_n q_n \) = mu_n \( \( G_n q_n \) q_n \) lt.eq parallel G_n q_n parallel_oo mu_n \( \| q_n \| \) . $
  Thus $u_n - G_n q_n$ has bounded energy and supremum and is harmonic on $U_n$.
    Hypothesis (iii) makes this difference equicontinuous on compact subsets of $U$.
    Given an oscillation tolerance, first choose $U$ so that $G_n q_n$ has smaller supremum,
    and then use harmonic equicontinuity inside $U$. A finite cover of $S^2$ proves equicontinuity of the original
    sequence. Boundedness and density of $pi_n \( V_n \)$ now give uniformly convergent subsequences.
  Let $u$ be one such limit. Hypothesis (ii) and Lemma 44 show that $u in cal(F) ∩ C \( S^2 \)$.
    The discrete resolvent minimizes
  $ J_n \( v \) = 1 / 2 sans(e)_n \( v \) + alpha mu_n \( v^2 \) - 2 mu_n \( \( f compose pi_n \) v \) . $
  The energy lower bound, uniform convergence, and weak convergence of the measures imply
  $ cal(E) \( u \, u \) + alpha mu \( u^2 \) - 2 mu \( f u \) lt.eq liminf_n J_n \( u_n \) . $
  For any smooth $v$, take its uniform recovery sequence $v_n$.
    Minimality gives $J_n \( u_n \) lt.eq J_n \( v_n \)$, and the latter converges to $cal(E) \( v \, v \) +
    alpha mu \( v^2 \) - 2 mu \( f v \)$. Smooth functions are a core of the closed form by its definition,
    so $u$ minimizes this functional over all of $cal(F)$. Strict convexity for $alpha > 0$ identifies $u =
    R_alpha f$ in $L^2 \( mu \)$. Full support makes its continuous version unique.
    Every subsequence has the same limit, which proves (7.4).
  Finally, $parallel R_alpha^n a - R_alpha^n b parallel_oo lt.eq alpha^(- 1) parallel a - b parallel_oo$.
    This contraction bound proves the claim for varying right-hand sides. ◻
]

=== 7.2 Controlling small time intervals <controlling-small-time-intervals>

Resolvent convergence integrates the walk over time. To recover the actual clock,
  we next construct functions that separate spatial sets and whose discrete generators are bounded.
  The needed continuum approximation is uniform, rather than merely in $L^2 \( mu \)$.

#thm([Lemma 7.4.])[
  (Uniform resolvent approximation).  #emph[For every $f in C \( S^2 \)$,
#[#set math.equation(numbering: n => "(7.6)")
 $ parallel alpha R_alpha f - f parallel_oo arrow.r 0 wide upright("as ") alpha arrow.r
   oo . $ <dyn:approximate-identity>]

]
] <dyn:feller>

#proof[
  First suppose $f$ is smooth, and put $w_alpha = alpha R_alpha f$.
    The spectral theorem for the nonnegative self-adjoint form operator gives $w_alpha arrow.r
    f$ in the form norm. Indeed the spectral multiplier $alpha \/ \( alpha + lambda \)$ tends to one and is
    bounded by one, so dominated convergence applies with spectral weight $1 + lambda$. By Lemma 44,
  $ parallel nabla \( w_alpha - f \) parallel_(L^2 \( upright(d) A \)) arrow.r 0 . $
  The maximum principle, or its discrete version followed by Lemma 45, gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ min f lt.eq w_alpha lt.eq max f . $ <dyn:range>]
  We also need convergence in round $L^2$, which does not follow by changing the measure in the form norm.
    Let $c_alpha$ be the round average of $w_alpha - f$. Round Poincare gives
  $ parallel w_alpha - f - c_alpha parallel_(L^2 \( upright(d) A \)) arrow.r 0 . $
  The constants $c_alpha$ are bounded by (7.7). If a subsequence has limit $c$, then $w_alpha arrow.r f +
    c$ in round $L^2$ on that subsequence, and therefore along a further subsequence almost everywhere.
    Consequently $min f lt.eq f + c lt.eq max f$ almost everywhere for round area.
    Continuity of $f$ makes its essential extrema equal to its extrema:
    every neighborhood of a minimizer or maximizer has positive round area.
    The two inequalities force $c gt.eq 0$ and $c lt.eq 0$. Thus $c = 0$, and $w_alpha - f arrow.r
    0$ in round $W^(1 \, 2)$.
  Fix a small coordinate disk about a point $x$, and a fixed annulus inside that disk surrounding a smaller
    neighborhood of $x$. Radial averaging of the round $W^(1 \, 2)$ error supplies, for each large $alpha$,
    a circle in this annulus on which the trace of $w_alpha - f$ tends to zero in one-dimensional $H^1$.
    The radii stay in a fixed compact subinterval of $\( 0 \, oo \)$,
    so the one-dimensional Sobolev inequality gives uniform convergence on these circles.
    Almost every radius has the Sobolev trace of the continuous representative, which is the trace we choose.
  Let $D_alpha$ be the disk inside the chosen circle. The resolvent equation is
  #[#set math.equation(numbering: n => "(7.8)")
   $ cal(E) \( w_alpha \, v \) + alpha integral \( w_alpha - f \) v thin upright(d) mu = 0 \, wide
     v in cal(F) . $ <dyn:weak-resolvent>]
  Choose a constant $K$ strictly above the boundary values of $w_alpha$ and at least $sup_(D_alpha) f$.
    The positive part $\( w_alpha - K \)^(+)$ on $D_alpha$, extended by zero,
    vanishes in a collar of the circle and is continuous Sobolev. Lemma 44 makes it an admissible test in (7.8).
    The two terms are nonnegative; the second is at least $alpha integral \( \( w_alpha - K \)^(+) \)^2 thin
    upright(d) mu$. Thus $w_alpha lt.eq K$ on the disk, first $mu$-almost everywhere and then everywhere by
    continuity and full support. The negative-part test gives the lower bound.
    Letting the strict slack tend to zero shows that the values inside the circle are bounded by its boundary
    values and the extrema of $f$ in the disk.
  The oscillation of $f$ on sufficiently small disks is arbitrarily small.
    The boundary convergence and this comparison therefore give uniform convergence on a neighborhood of $x$.
    A finite cover proves (7.6) for smooth $f$. For continuous $f$,
    approximate it uniformly by a smooth function and use the contraction $parallel alpha R_alpha
    parallel_(oo arrow.r oo) lt.eq 1$. ◻
]

#thm([Lemma 7.5.])[
  (An exit estimate uniform over starting vertices).  #emph[For $d > 0$ and $v in V_n$, let
$ tau_d^n \( v \) = inf { t gt.eq 0 : d_0 \( pi_n \( Y_t^n \) \, pi_n \( v \) \) gt.eq d } . $

 Then
#[#set math.equation(numbering: n => "(7.9)")
 $ lim_(s arrow.b 0) limsup_(n arrow.r oo) sup_(v in V_n) bb(P)_v \[ tau_d^n \( v \) lt.eq s \] = 0 . $ <dyn:exit>]

 The stationary projected path laws are tight in $D \( \[ 0 \, T \] \, S^2 \)$,
   and all their limits are supported on continuous paths.]
] <dyn:tightness>

#proof[
  Cover the sphere by finitely many round disks of radius less than $d \/ 8$.
    For each choose a smooth function $f$ in $\[ 0 \, 1 \]$, zero on that disk,
    and one outside the concentric disk of radius $d \/ 2$. If $pi_n \( v \)$ is in the smaller disk and
    displacement from $pi_n \( v \)$ reaches $d$, the value of $f$ at the new location is one.
  Fix $b > 0$. Lemmas 46 and 45, first with a sufficiently large fixed $alpha$ and then with sufficiently large
    $n$, give for each of this finite family a function
  $ v_n = alpha R_alpha^n \( f compose pi_n \) \, wide parallel v_n - f compose pi_n parallel_oo lt.eq b . $
  Its generator satisfies
  $ cal(L)_n v_n = alpha \( v_n - f compose pi_n \) \, wide parallel cal(L)_n v_n parallel_oo lt.eq C_b \, $
  with a common $C_b$ for the finite family and all sufficiently large $n$.
    Start the chain at $v$ in the corresponding small disk and stop at $sigma = tau_d^n \( v \) and s$.
    If $p = bb(P)_v \[ tau_d^n \( v \) lt.eq s \]$, then
  $ bb(E)_v \[ v_n \( Y_sigma^n \) \] gt.eq p - b \, wide bb(E)_v \[ v_n \( Y_sigma^n \) \] = v_n \( v \) +
    bb(E)_v integral_0^sigma cal(L)_n v_n \( Y_t^n \) thin upright(d) t lt.eq b + C_b s . $
  Hence $p lt.eq 2 b + C_b s$, uniformly over all starting vertices.
    First let $s arrow.b 0$ and then $b arrow.b 0$ to obtain (7.9).
  Apply the strong Markov property to the chain $Y^n$ after any stopping time.
    Since (7.9) is uniform over its current vertex, it gives the usual stopping-time increment condition for the
    projected paths. The projection itself need not be Markov.
    Apply Aldous’s stopping-time criterion [1] to the three coordinate functions of the round sphere in $bb(R)^3$;
    their values are bounded. This gives tightness of each coordinate path law.
    The largest coordinate jump is bounded by the maximum projected edge length, which tends to zero.
    Under $J_1$ convergence any jump of a limit is approximated by jumps of the approximating paths,
    so every coordinate limit is continuous. Coordinate tightness with continuous limits gives joint tightness
    with continuous limits in $bb(R)^3$: on continuous limits, $J_1$ convergence agrees with uniform convergence,
    allowing a common time comparison for the three coordinates.
    The limits remain in the closed set $S^2$, proving the assertion. ◻
]

=== 7.3 Identifying the entire conditional law <identifying-the-entire-conditional-law>

#proof[
  #emph[Completion of the proof of Theorem 43.] Take a subsequence of the stationary projected path laws with a
    weak limit. By Lemma 47, diagonal extraction on the horizons $1 \, 2 \,
    dots.h$ gives a consistent continuous-path law on $\[ 0 \, oo \)$, denoted by $Q$.
    Restrictions are consistent because the limits are continuous at the restriction times.
  Let $f_0 \, dots.h \, f_k in C \( S^2 \)$ and $alpha_1 \, dots.h \, alpha_k > 0$.
    Integrate the stationary finite-dimensional expectation at times $0 \, t_1 \, t_1 + t_2 \, dots.h \, t_1 +
    dots.h.c + t_k$ against $product_(j = 1)^k e^(- alpha_j t_j) thin upright(d) t_j$.
    The Markov property and the resolvent identity give exactly
  #[#set math.equation(numbering: n => "(7.10)")
   $ mu_n #h(-0.16667em)
     [\( f_0 compose pi_n \) R_(alpha_1)^n (\( f_1 compose pi_n \) R_(alpha_2)^n (dots.h.c \( f_(k - 1) compose
     pi_n \) R_(alpha_k)^n \( f_k compose pi_n \) dots.h.c))] . $ <dyn:laplace>]
  Successive applications of Lemma 45, including its varying-data assertion,
    and weak convergence of the measures show that (7.10) converges to
  $ mu #h(-0.16667em) [f_0 R_(alpha_1) (f_1 R_(alpha_2) (dots.h.c f_(k - 1) R_(alpha_k) f_k dots.h.c))] . $
  By the semigroup-resolvent relation for the closed form, this is the same integrated expectation for the
    stationary diffusion $B$.
  It is also the integrated expectation for $Q$. On bounded time boxes this follows from weak path convergence,
    since evaluation at fixed times is continuous at continuous paths.
    Dominated convergence then integrates over the gaps. The contribution of the complement of a large time box is
    bounded uniformly by the tails of the product of exponentials, times $product_j parallel f_j parallel_oo$.
  The product expectations under $Q$ and under $B$ are bounded continuous functions of
    $\( t_1 \, dots.h \, t_k \)$, including zero gaps. Uniqueness of multivariate Laplace transforms makes these
    functions equal: one may apply one-dimensional uniqueness successively in each coordinate,
    and then use continuity to remove almost-everywhere qualifications.
    Product tests determine probability measures on the compact product $\( S^2 \)^(k + 1)$.
    Thus $Q$ and the law of $B$ have the same finite-dimensional distributions,
    and hence the same law on continuous paths. Every subsequential limit is the same, proving the theorem. ◻
]

=== 7.4 The clock and the metric-space conclusion <the-clock-and-the-metric-space-conclusion>

We now return to the random maps. The exact relation between the graph energy and the prescribed walk fixes the
  clock without any subsequence-dependent factor.

#thm([Lemma 7.6.])[
  (Exact energy of the accelerated walk).  #emph[For the half-edge walk of Theorem 1,
$ - chevron.l u \, n L_n u chevron.r_(L^2 \( mu_n \)) = 1 / 2 sans(e)_n \( u \) . $

 Equivalently, $n L_n = - 1 / 2 mu_n^(- 1) H_n$, where $mu_n^(- 1)$ denotes division by vertex mass.]
] <dyn:energy-clock>

#proof[
  The generator convention gives $H_n = - deg thin L_n$. Since $mu_n \( v \) = deg \( v \) \/ \( 2 n \)$,
  $ - sum_v mu_n \( v \) u \( v \) n L_n u \( v \) = 1 / 2 sum_v u \( v \) H_n u \( v \) = 1 /
    2 sum_({ v \, w }) \( u \( v \) - u \( w \) \)^2 . $
  Loops contribute zero to both sides. Their degree contributions are already included in the first identity,
    so no holding-time correction is needed. ◻
]

#proof[
  Start with any subsequence. Retain the random variable $A_n$ of Proposition 38 together with all the contour,
    spatial, and local and whole-sphere array variables used in Theorem 36 and Proposition 37.
    Its uniform first-moment bound gives tightness, so these variables admit a joint further extraction.
    Apply the sphere results to this enlarged extraction and use a Skorokhod representation.
    On the resulting probability-one event, their conclusions hold and $A_n$ converges to a finite random
    variable. In particular $sup_n A_n < oo$ after discarding finitely many initial terms.
  Fix a realization in this probability-one event. Its limiting quantum sphere is now a fixed measured conformal
    sphere. The projections $pi_n$, measures, edge mesh, uniform energy bounds and recovery,
    and harmonic compactness satisfy hypotheses (i)–(iii) of Theorem 43.
    The realized bounded $A_n$ gives hypothesis (iv). The Liouville form is exactly (7.1) with $mu = mu_h$.
    By Lemma 48, the chain in that deterministic theorem is $Y_t^n = X_(n t)^n$.
    Consequently its conditional projected path law converges to the conditional law of $B^h$,
    for every fixed finite horizon. All probabilities in this invocation are taken on the individual fixed graphs.
    The random object being compared is the conditional probability law itself.
  It remains to express this comparison in the metric $delta_T$.
    The round topology and the $D_h$ topology agree on the compact limiting sphere,
    so the identity map between them is uniformly continuous in both directions.
    The path-law convergence just proved therefore also holds in $D \( \[ 0 \, T \] \, \( S^2 \, D_h \) \)$.
  The correspondences in Proposition 37 have distortions tending to zero.
    The standard correspondence gluing constructs a common metric space containing isometric copies of all
    $\( V_n \, a_n d_n \)$ and $\( S^2 \, D_h \)$, with
  $ sup_(v in V_n) "dist"_Z #scale(x: 120%, y: 120%)[\(] v \, pi_n \( v \) #scale(x: 120%, y: 120%)[\)] arrow.r 0 . $
  For completeness, for each $n$ attach its copy to the sphere by cross-distances obtained by taking the infimum
    over corresponding pairs, adding numbers $epsilon_n arrow.b 0$ larger than half the respective distortions;
    use the shortest-path metric on the union, identifying only the common sphere, and then take the completion.
    This preserves the metrics of every copy. The images become close in Hausdorff distance,
    and their measures become close in Prokhorov distance.
  Apply the embedding to each coordinate of a chain path. Its distance in the common Skorokhod space from its
    $pi_n$-projected path is bounded by the displayed supremum, using the identity time change.
    The corresponding probability laws therefore have Prokhorov distance tending to zero.
    Combining this with the projected law convergence shows that all three terms defining $delta_T$ tend to zero
    in the coupled extraction.
  We have obtained almost-sure convergence in a further coupling from every original subsequence,
    to the prescribed quantum sphere and its conditional diffusion law.
    The subsequence principle gives convergence in distribution through all positive integers $n$.
    Forgetting the root, the spanning tree, and the contour marks leaves precisely the states in Theorem 1.
    The same choice $c = 1$ works for every time horizon. ◻
]

#heading(level: 1)[References]
#bibitem([1])[D. Aldous, #emph[Stopping times and tightness], Ann. Probab. #strong[6] (1978), no.~2, 335--340.
  #link("https://doi.org/10.1214/aop/1176995579")[doi:10.1214/aop/1176995579].]
#bibitem([2])[N. Berestycki, #emph[Diffusion in planar Liouville quantum gravity], Ann. Inst.
  Henri Poincaré Probab. Stat. #strong[51] (2015), no.~3, 947--964.
  #link("https://doi.org/10.1214/14-AIHP605")[doi:10.1214/14-AIHP605].]
#bibitem([3])[N. Berestycki and E. Gwynne, #emph[Random walks on mated-CRT planar maps and Liouville Brownian
  motion], Comm. Math. Phys. #strong[395] (2022), no.~2, 773--857.
  #link("https://doi.org/10.1007/s00220-022-04482-y")[doi:10.1007/s00220-022-04482-y].
  #link("https://arxiv.org/abs/2003.10320v2")[arXiv:2003.10320v2].]
#bibitem([4])[S. Chaiken, #emph[A combinatorial proof of the all minors matrix tree theorem], SIAM J.
  Algebraic Discrete Methods #strong[3] (1982), no.~3, 319--329.
  #link("https://doi.org/10.1137/0603033")[doi:10.1137/0603033].]
#bibitem([5])[B. Duplantier, J. Miller, and S. Sheffield, #emph[Liouville quantum gravity as a mating of trees],
  Astérisque #strong[427] (2021), viii+258 pp. #link("https://doi.org/10.24033/ast.1149")[doi:10.24033/ast.1149].
  #link("https://arxiv.org/abs/1409.7055v4")[arXiv:1409.7055v4].]
#bibitem([6])[A. M. Dykhne, #emph[Conductivity of a two-dimensional two-phase system], Soviet Phys.
  JETP #strong[32] (1971), no.~1, 63--65; translated from Zh. Eksp. Teor. Fiz. #strong[59] (1970), 110--115.]
#bibitem([7])[M. Fukushima, Y. Oshima, and M. Takeda, #emph[Dirichlet Forms and Symmetric Markov Processes],
  second revised and extended edition, De Gruyter Studies in Mathematics, vol.~19, Walter de Gruyter,
  Berlin, 2011. #link("https://doi.org/10.1515/9783110218091")[doi:10.1515/9783110218091].]
#bibitem([8])[C. Garban, R. Rhodes, and V. Vargas, #emph[Liouville Brownian motion], Ann. Probab.
  #strong[44] (2016), no.~4, 3076--3110. #link("https://doi.org/10.1214/15-AOP1042")[doi:10.1214/15-AOP1042].]
#bibitem([9])[C. Garban, R. Rhodes, and V. Vargas, #emph[On the heat kernel and the Dirichlet form of Liouville
  Brownian motion], Electron. J. Probab. #strong[19] (2014), Paper No.~96, 1--25.
  #link("https://doi.org/10.1214/EJP.v19-2950")[doi:10.1214/EJP.v19-2950].]
#bibitem([10])[E. Gwynne, N. Holden, and X. Sun, #emph[A mating-of-trees approach for graph distances in random
  planar maps], Probab. Theory Related Fields #strong[177] (2020), nos.~3--4, 1043--1102.
  #link("https://doi.org/10.1007/s00440-020-00969-8")[doi:10.1007/s00440-020-00969-8].]
#bibitem([11])[E. Gwynne and J. Miller, #emph[Existence and uniqueness of the Liouville quantum gravity metric for
  $gamma in \( 0 \, 2 \)$], Invent. Math. #strong[223] (2021), no.~1, 213--333.
  #link("https://doi.org/10.1007/s00222-020-00991-6")[doi:10.1007/s00222-020-00991-6].]
#bibitem([12])[E. Gwynne and J. Miller, #emph[Conformal covariance of the Liouville quantum gravity metric for
  $gamma in \( 0 \, 2 \)$], Ann. Inst. Henri Poincaré Probab. Stat. #strong[57] (2021), no.~2, 1016--1031.
  #link("https://doi.org/10.1214/20-AIHP1105")[doi:10.1214/20-AIHP1105].]
#bibitem([13])[E. Gwynne and J. Miller, #emph[Random walk on random planar maps:
  spectral dimension, resistance and displacement], Ann. Probab. #strong[49] (2021), no.~3, 1097--1128.
  #link("https://doi.org/10.1214/20-AOP1471")[doi:10.1214/20-AOP1471].]
#bibitem([14])[E. Gwynne, J. Miller, and S. Sheffield, #emph[Harmonic functions on mated-CRT maps], Electron. J.
  Probab. #strong[24] (2019), Paper No.~58, 1--55. #link("https://doi.org/10.1214/19-EJP325")[doi:10.1214/19-EJP325].]
#bibitem([15])[E. Gwynne, J. Miller, and S. Sheffield, #emph[The Tutte embedding of the mated-CRT map converges to
  Liouville quantum gravity], Ann. Probab. #strong[49] (2021), no.~4, 1677--1717.
  #link("https://doi.org/10.1214/20-AOP1487")[doi:10.1214/20-AOP1487].]
#bibitem([16])[E. Gwynne, J. Miller, and S. Sheffield, #emph[An invariance principle for ergodic scale-free random
  environments], Acta Math. #strong[228] (2022), no.~2, 303--384.
  #link("https://doi.org/10.4310/ACTA.2022.v228.n2.a2")[doi:10.4310/ACTA.2022.v228.n2.a2].]
#bibitem([17])[R. Lyons and Y. Peres, #emph[Probability on Trees and Networks],
  Cambridge Series in Statistical and Probabilistic Mathematics, vol.~42, Cambridge University Press,
  New York, 2016. #link("https://doi.org/10.1017/9781316672815")[doi:10.1017/9781316672815].]
#bibitem([18])[J. Miller and S. Sheffield, #emph[Imaginary geometry IV:
  interior rays, whole-plane reversibility, and space-filling trees], Probab.
  Theory Related Fields #strong[169] (2017), nos.~3--4, 729--869.
  #link("https://doi.org/10.1007/s00440-017-0780-2")[doi:10.1007/s00440-017-0780-2].
  #link("https://arxiv.org/abs/1302.4738v2")[arXiv:1302.4738v2].]
#bibitem([19])[J. Miller and S. Sheffield, #emph[Liouville quantum gravity spheres as matings of finite-diameter
  trees], Ann. Inst. Henri Poincaré Probab. Stat. #strong[55] (2019), no.~3, 1712--1750.
  #link("https://doi.org/10.1214/18-AIHP932")[doi:10.1214/18-AIHP932].
  #link("https://arxiv.org/abs/1506.03804v4")[arXiv:1506.03804v4].]
#bibitem([20])[R. C. Mullin, #emph[On the enumeration of tree-rooted maps], Canad. J. Math.
  #strong[19] (1967), 174--183. #link("https://doi.org/10.4153/CJM-1967-010-x")[doi:10.4153/CJM-1967-010-x].]
#bibitem([21])[OpenAI, #emph[Canonical conformal limits of subcritical FK planar maps],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Canonical-conformal-limits-of-subcritical-FK-planar-maps-September-24-2026/main.pdf")[OAI:Canonical-conformal-limits-of-subcritical-FK-planar-maps-September-24-2026],
  2026.]
#bibitem([22])[OpenAI, #emph[Metric-measure limits of subcritical FK and spanning-tree planar maps],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Metric-measure-limits-of-subcritical-FK-and-spanning-tree-planar-maps-September-24-2026/main.pdf")[OAI:Metric-measure-limits-of-subcritical-FK-and-spanning-tree-planar-maps-September-24-2026],
  2026.]
