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

#align(center)[#text(size: 16pt, weight: "bold")[Random Walks on Critical FK--Ising Maps \
and Liouville Brownian Motion]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The scaling limit of a random surface does not by itself determine the scaling limit of a walk on that surface.
  A time-parametrized walk also depends on the electrical energy and on the mass assigned to vertices.
  We study this additional limit for critical Fortuin–Kasteleyn (FK)–Ising maps,
  using the common-coordinate and electrical convergence results of the spectral companion #cite(label("SC")).

=== 1.1 The model and the result <the-model-and-the-result>

Let $cal(F)_n$ be the finite set of rooted pairs $\( M \, A \)$,
  where $M$ is a connected planar multigraph with $n$ edges embedded in the oriented sphere and $A subset.eq
  E \( M \)$. Rooting is at an oriented edge, and pairs are identified by orientation-preserving homeomorphisms
  preserving the root and $A$. Loops and multiple edges are allowed. If $M^(*)$ is the dual map, set

$ A^(*) = { e^(*) : e in.not A } \, wide ell \( M \, A \) = k \( A \) + k \( A^(*) \) - 1 \, $

where each component count includes isolated vertices of the corresponding spanning subgraph.
  The critical spherical FK–Ising law is

#[#set math.equation(numbering: n => "(1.1)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] \( M_n \, A_n \) = \( M \, A \) #scale(x: 120%, y: 120%)[\)] =
   2^(ell \( M \, A \) \/ 2) / Z_n \, wide Z_n = sum_(\( M \, A \) in cal(F)_n) 2^(ell \( M \, A \) \/ 2) .
   $ <eq:fk-law>]

Write $V_n = V \( M_n \)$, let $d_n$ be graph distance with every original edge of length one, and let

#[#set math.equation(numbering: n => "(1.2)")
 $ mu_n \( v \) = frac(deg_(M_n) \( v \), 2 n) . $ <eq:corner-measure>]

A loop contributes two to the degree. Conditional on $\( M_n \, A_n \)$,
  a simple random walk chooses an incident half-edge uniformly and traverses its edge.
  Its initial vertex has law $mu_n$, which is stationary. The walk uses all map edges, not just those in $A_n$.

Let $\( S \, h \)$ be the ordinary unit-area $sqrt(3)$-Liouville quantum gravity (LQG) sphere:
  the quantum-sphere law disintegrated at area one, with its distinguished points forgotten.
  Write $mu_h$ for its area probability measure and $D_h$ for its intrinsic metric in a fixed deterministic
  normalization. Liouville Brownian motion is the diffusion associated with the closure on $L^2 \( mu_h \)$ of

#[#set math.equation(numbering: n => "(1.3)")
 $ cal(E)_h \( f \, f \) = 1 / 2 integral_S \| nabla_g f \|^2 thin upright(d) upright("vol")_g \, wide
   f in C^oo \( S \) \, $ <eq:continuum-form>]

where $g$ is any smooth metric in the conformal class of the sphere.
  Conformal invariance of the two-dimensional Dirichlet integral makes this definition independent of $g$.
  The factor $1 \/ 2$ fixes the time convention.

For a walk $X^n$, let $overline(X)^n$ be its continuous interpolation on the cable realization $overline(M)_n$,
  in which each edge is a unit interval and each selected edge is traversed linearly in one unit of time.
  We also write $d_n$ for the cable path metric. We use the curve-decorated Gromov–Hausdorff–Prokhorov topology:
  after isometric embeddings into common metric spaces, the underlying spaces converge in Hausdorff distance,
  the measures in Prokhorov distance, and every curve uniformly on each bounded time interval.

#thm([Theorem 1.1.])[
  #emph[Let $\( M_n \, A_n \)$ have law (1.1), and let $a_n > 0$ be any deterministic sequence with $a_n arrow.r
    0$ such that
#[#set math.equation(numbering: n => "(1.4)")
 $ \( V_n \, a_n d_n \, mu_n \) med arrow.r.double med \( S \, D_h \, mu_h \) $ <eq:assumed-ghp>]

 in Gromov–Hausdorff–Prokhorov law. Given the map, start $r$ independent simple random walks $X^(n \, 1) \,
   dots.h \, X^(n \, r)$ independently from $mu_n$. Given $h$,
   start $r$ independent Liouville Brownian motions $B^(h \, 1) \, dots.h \,
   B^(h \, r)$ independently from $mu_h$, with the convention (1.3). For every fixed integer $r gt.eq 1$,
#[#set math.equation(numbering: n => "(1.5)")
 $ (overline(M)_n \, a_n d_n \, mu_n \; \( overline(X)_(n t)^(n \, j) \)_(t gt.eq 0 \, thin 1 lt.eq j lt.eq r))
   med arrow.r.double med (S \, D_h \, mu_h \; \( B_t^(h \, j) \)_(t gt.eq 0 \, thin 1 lt.eq j lt.eq r))
   $ <eq:main-limit>]

 in the curve-decorated Gromov–Hausdorff–Prokhorov topology.]
] <thm:main>

Thus the deterministic acceleration can be taken to be exactly $n$.
  The finite-product assertion retains the conditional walk law in the random environment,
  rather than only the distribution of one trajectory after averaging over the surface.

The proof uses more than the metric-measure premise (1.4).
  The spectral companion supplies a joint conformal coordinate, unit conductivity, uniform local energy recovery,
  and convergence of centered inverse operators. We state these inputs precisely in Proposition 4;
  their proofs and the foundational companion results on which they depend are not reproduced here.
  The path-convergence argument from those inputs is proved in full.

=== 1.2 History and related work <history-and-related-work>

Sheffield’s inventory-accumulation encoding related critical FK-decorated planar maps to correlated Brownian
  paths #cite(label("Sheffield2016Inventory")). Gwynne and Sun proved that the finite-volume FK contour encoding
  converges to correlated Brownian motion conditioned to stay in the quadrant and return to the
  origin #cite(label("GwynneSun2015Finite")) Theorem 1.8. The mating-of-trees theory of Duplantier, Miller,
  and Sheffield, and its finite-volume sphere form due to Miller and Sheffield,
  identify the corresponding continuum quantum surfaces #cite(label("DuplantierMillerSheffield2021Mating"))
  #cite(label("MillerSheffield2019SphereMating")). The Brownian paths in that encoding describe boundary lengths;
  the vertex walk considered here is a different stochastic process.
  Liouville Brownian motion was constructed by Garban, Rhodes,
  and Vargas and by Berestycki #cite(label("GarbanRhodesVargas2016LBM")) #cite(label("Berestycki2015Diffusion")).
  Its Dirichlet-form description is developed in #cite(label("GarbanRhodesVargas2014Dirichlet")) Theorem 1.7.

For mated-CRT maps, Gwynne, Miller, and Sheffield proved quenched walk convergence modulo time
  parametrization #cite(label("GwynneMillerSheffield2021Tutte")) Theorem 3.4.
  Berestycki and Gwynne subsequently retained the parametrization #cite(label("BerestyckiGwynne2022MatedCRTLBM"))
  Theorems 1.2 and 1.4, using a deterministic median-exit clock comparable to inverse cell area.
  Its asymptotic constant is not identified there #cite(label("BerestyckiGwynne2022MatedCRTLBM")) Remark 1.3.
  The setting here is instead the ordinary finite FK–Ising sphere, the walks start in stationarity,
  and the limit is joint with the intrinsic metric and area measure.
  The exact clock in Theorem 1 rests on the unit-conductivity theorem of the spectral companion #cite(label("SC"))
  Theorem 5.2.

=== 1.3 From operators to paths <from-operators-to-paths>

The principal issue is tightness with the time parameter retained.
  Convergence of eigenvalues, or even convergence of the finite-dimensional walk laws,
  does not exclude rapid excursions of appreciable spatial diameter.
  The companion’s convergence of centered inverses gives positive-time semigroup convergence.
  Uniform tracking of the exploration tour, which lists the graph corners and parametrizes quantum area in the
  limit, then identifies the finite-dimensional distributions in one common coordinate.

To control entire paths, we use smooth spatial cutoffs. Local energy recovery provides uniformly accurate graph
  cutoffs with asymptotically no excess energy. Resolvent smoothing gives test functions whose generators are
  uniformly bounded at each fixed smoothing parameter. A reversible forward–backward martingale decomposition
  converts the form-norm error between these two approximations into an error uniform along a stationary
  trajectory. Optional sampling of the smoothed cutoffs then gives a stopping-time tightness estimate.

The local contribution is this passage from the companion’s electrical and operator limits to stationary,
  time-parametrized path convergence. The maximal inequality is a finite-state analogue of the classical
  Lyons–Zheng forward–backward decomposition #cite(label("LyonsZheng1988"));
  we prove the jump-chain identity directly. The last tightness step uses Aldous’s
  criterion #cite(label("Aldous1978")). Neither an additional mixing assumption nor a heat-kernel estimate is
  needed for this passage. Stationarity is essential to the argument as given;
  we do not assert convergence from arbitrary starting vertices.

Section 2 records the precise companion inputs and checks the normalization.
  Section 3 obtains the finite-dimensional laws. Section 4 proves the stationary maximal estimate and path
  tightness. Section 5 transfers the limit to cable paths, removes the exponential clock,
  and assembles the joint convergence in random environments.

== 2 Energy normalization and the common coupling <sec:inputs>

The proof needs more than the metric-measure limit: it needs convergence of inverse operators and uniform recovery
  of spatial test functions with the correct energy. We state these inputs from the spectral companion
  #cite(label("SC")) precisely, keeping its unhalved electrical convention separate from the Brownian convention
  of the theorem.

=== 2.1 The graph energy and the spatial scale <the-graph-energy-and-the-spatial-scale>

Let $P_n$ be the one-step transition operator of the walk, let $L_n = P_n - I$, and put

$ G_n = - n L_n = n \( I - P_n \) . $

Thus $- G_n$ is the generator with total attempt rate $n$, including attempts along loops.
  It is self-adjoint on $L^2 \( mu_n \)$. For a real vertex function $u$, write $cal(E)_n \( u \) = chevron.l u \,
  G_n u chevron.r_(L^2 \( mu_n \))$, and use polarization for the bilinear form.
  Choose either orientation of each edge and write $d_e u = u \( e^(+) \) - u \( e^(-) \)$.

#thm([Lemma 2.1.])[
  (Graph energy).  #emph[For all real vertex functions $u \, v$,
#[#set math.equation(numbering: n => "(2.1)")
 $ cal(E)_n \( u \, v \) = 1 / 2 sum_(e in E \( M_n \)) d_e u thin d_e v . $ <eq:graph-energy>]

 Every parallel edge is a separate summand, every loop has zero summand,
   and the kernel of $G_n$ consists of the constants.]
] <lem:graph-energy>

#proof[
  Since $mu_n \( x \) = deg \( x \) \/ \( 2 n \)$, every incident half-edge has $mu_n$-weighted accelerated rate
    $1 \/ 2$. A nonloop edge with endpoints $x \, y$ therefore contributes
  $ 1 / 2 #scale(x: 120%, y: 120%)[\(] u \( x \) \( v \( x \) - v \( y \) \) +
    u \( y \) \( v \( y \) - v \( x \) \) #scale(x: 120%, y: 120%)[\)] = 1 / 2 d_e u thin d_e v $
  to $chevron.l u \, G_n v chevron.r_(L^2 \( mu_n \))$. Both half-edges of a loop contribute zero.
    Summing proves (2.1), including multiplicities. Zero energy forces equality across each edge,
    hence constancy by connectedness. ◻
]

On the limiting conformal sphere, write $cal(E)_h \( f \) = cal(E)_h \( f \, f \)$, also for the closure,
  and let $G$ be its nonnegative self-adjoint operator. The existence and identification of this closure are part
  of #cite(label("SC")) Proposition 8.3. In the companion’s notation the unhalved operators are

#[#set math.equation(numbering: n => "(2.2)")
 $ B_n = 2 G_n = - 2 n L_n \, wide B_h = 2 G . $ <eq:raw-operators>]

In particular, the inverses imported below are inverses of $2 G_n$ and $2 G$, not of $G_n$ and $G$.

The companion fixes space by a deterministic diameter normalization.
  The next elementary comparison, reproduced from #cite(label("SC")) Lemma 2.3,
  shows why its conclusions apply to the sequence $a_n$ in the theorem.
  For a finite real random variable $Y$, let $frak(m) \( Y \)$ be the unique zero of $r mapsto
  bb(E) \[ arctan \( Y - r \) \]$. Set

$ Delta_n = max { 1 \, "diam" \( V_n \, d_n \) } \, wide Delta = "diam" \( S \, D_h \) \, $

and define

#[#set math.equation(numbering: n => "(2.3)")
 $ hat(a)_n = exp { frak(m) \( log Delta \) - frak(m) \( log Delta_n \) } . $ <eq:diameter-normalization>]

The expectations defining these centers use the unconditional laws, so $hat(a)_n$ is deterministic.

#thm([Lemma 2.2.])[
  (Comparison of spatial normalizations).  #emph[Under the metric-measure convergence assumption of the theorem,
    $hat(a)_n \/ a_n arrow.r 1$.]
] <lem:space-normalization>

#proof[
  For every finite real $Y$, bounded convergence shows that $F_Y \( r \) =
    bb(E) \[ arctan \( Y - r \) \]$ is continuous, strictly decreasing, and has limits $pi \/ 2$ and $-
    pi \/ 2$ at the two ends of the real line. Its zero therefore exists and is unique.
    Directly, $frak(m) \( Y + c \) = frak(m) \( Y \) + c$. If $Y_j$ converges in law to $Y$,
    then $F_(Y_j) \( r \) arrow.r F_Y \( r \)$ for each fixed $r$.
    For each $epsilon > 0$, the values at $frak(m) \( Y \) - epsilon$ and $frak(m) \( Y \) +
    epsilon$ have opposite strict signs. The same eventually holds for $F_(Y_j)$,
    trapping its zero between these two points. Thus $frak(m)$ is continuous under convergence in law.
  Diameter is continuous in the Gromov–Hausdorff topology. Since $a_n arrow.r 0$, the assumed convergence gives
  $ a_n Delta_n med arrow.r.double med Delta \, wide 0 < Delta < oo quad upright("almost surely") . $
  Applying the preceding continuity statement after taking logarithms and using the shift identity gives
  $ log a_n / hat(a)_n = frak(m) #scale(x: 120%, y: 120%)[\(] log \( a_n Delta_n \) #scale(x: 120%, y: 120%)[\)] -
    frak(m) \( log Delta \) arrow.r 0 . $
  ◻
]

=== 2.2 The geometric and analytic inputs <the-geometric-and-analytic-inputs>

We use $S^2$ for the coordinate sphere and $rho$ for its round distance.
  For each occurrence of a vertex, an incident edge, and an incident face,
  form an equilateral triangle with vertices labelled by these three objects. Repeated incidences remain distinct.
  Gluing the $4 n$ triangles according to the cyclic incidences gives a topological sphere with its piecewise
  Euclidean conformal structure. Uniformize this surface onto $S^2$, with the normalization of #cite(label("SC")),
  and write $z_n : V_n arrow.r S^2$ for the primal vertex locations.
  The images of the triangles are the embedded #emph[flags];
  the primal edges are embedded along their vertex-to-edge-midpoint sides.
  This common coordinate will retain both the intrinsic metric and the conformal energy.

#thm([Proposition 2.3.])[
  (Inputs from the spectral companion).  #emph[From every subsequence of sizes tending to infinity there is a
    further subsequence and a representation coupling on which the following properties hold almost surely,
    simultaneously. The limiting sphere in these coordinates has the ordinary unit-area $sqrt(3)$-LQG law,
    with area $mu_h$ and metric $D_h$; the latter induces the round topology.]
  + #emph[#emph[Geometry in one coordinate.] The vertex measures satisfy $\( z_n \)_(*) mu_n arrow.r mu_h$ weakly, and
#[#set math.equation(numbering: n => "(2.4)")
 $ delta_n & := sup_(u \, v in V_n) \| a_n d_n \( u \, v \) - D_h \( z_n \( u \) \, z_n \( v \) \) \| arrow.r 0 \,\
epsilon_n & := d_(upright(H))^(D_h) \( z_n \( V_n \) \, S^2 \) arrow.r 0 . $ <eq:vertex-distortion>]

 The maximum round diameter of the embedded flags tends to zero.
   Consequently the maximum round diameter of an embedded primal edge tends to zero as well.]
  + #emph[#emph[One Hilbert space.] There is an order $v_n \( i \)$, $0 lt.eq i < 2 n$,
    of the primal corner occurrences and a continuous tour $eta : \[ 0 \, 1 \] arrow.r S^2$ such that
#[#set math.equation(numbering: n => "(2.5)")
 $ eta_(*) thin upright(d) t = mu_h \, wide sup_(0 lt.eq t < 1) rho #scale(x: 120%, y: 120%)[\(]
   z_n \( v_n \( floor.l 2 n t floor.r \) \) \, eta \( t \) #scale(x: 120%, y: 120%)[\)] arrow.r
   0 . $ <eq:tour-tracking>]

 Each vertex $v$ occurs $deg \( v \)$ times in the corner list.
   For $mu_h$-almost every $z$, the fiber $eta^(- 1) \( { z } \)$ contains exactly one time.
   With $H = L^2 \( \[ 0 \, 1 \] \, thin upright(d) t \)$, the maps
$ J_n : L^2 \( mu_n \) & arrow.r H \, & \( J_n u \) \( t \) & = u \( v_n \( floor.l 2 n t floor.r \) \) \, quad
  0 lt.eq t < 1 \,\
J : L^2 \( mu_h \) & arrow.r H \, & J f & = f compose eta $

 are isometries, and $J$ is unitary. In particular,
#[#set math.equation(numbering: n => "(2.6)")
 $ lr(bar.v.double J_n \( f compose z_n \) - J f bar.v.double)_(L^oo \( \[ 0 \, 1 \] \)) arrow.r
   0 wide \( f in C \( S^2 \) \) . $ <eq:continuous-pullbacks>]

]
  + #emph[#emph[Centered inverse convergence.] The closed continuum form $cal(E)_h$ is a regular Dirichlet form
    and is the form of Liouville Brownian motion with the stated half-energy clock.
    Its operator $G$ has kernel exactly the constants. For a nonnegative operator whose kernel is the constants,
    write $A^dagger$ for its inverse on the mean-zero subspace, extended by zero on constants.
    Let $Pi$ be the orthogonal projection onto the constants in $H$, and put
#[#set math.equation(numbering: n => "(2.7)")
 $ K_n = J_n \( 2 G_n \)^dagger J_n^(*) \, wide K = J \( 2 G \)^dagger J^(*) . $ <eq:centered-inverses>]

 Thus $K_n$ is also zero on $J_n \( L^2 \( mu_n \) \)^perp$. These are bounded positive self-adjoint operators, and
#[#set math.equation(numbering: n => "(2.8)")
 $ lr(bar.v.double K_n - K bar.v.double)_(upright("HS")) arrow.r 0 . $ <eq:inverse-convergence>]

]
  + #emph[#emph[Local recovery with unit conductivity.] There are ordinary conformal chart domains whose interiors
    cover $S^2$. Let $V subset.double W subset.double U$ be open sets with $U$ compactly contained in one of these
    charts, and let $chi$ be a real smooth function on $S^2$ satisfying $0 lt.eq chi lt.eq
    1$ and $"supp" chi subset V$. There are local vertex functions $tilde(w)_n$,
    defined on graphs containing all incidences needed over $W$,
    that converge uniformly to $chi$ on a neighborhood of $overline(W)$, in the vertex locations, and satisfy
#[#set math.equation(numbering: n => "(2.9)")
 $ limsup_n sum_(e : thin z_n \( e \) in W) \( d_e tilde(w)_n \)^2 lt.eq
   integral_U \| nabla chi \|^2 thin thin upright(d) upright("vol") . $ <eq:local-recovery>]

 Here $z_n \( e \)$ is any chosen point on the embedded edge,
   and the integral is the unhalved conformal Dirichlet integral. Every edge is counted with its multiplicity.
   If one endpoint lies in a fixed compact subset of $W$, then eventually its entire edge, both endpoints,
   and all the required incidences lie in $W$, uniformly over such edges.]
  #emph[The assertions in (iv) hold simultaneously for these buffered tests on the coupled outcome,
    so the tests may be chosen after fixing that outcome.]
] <prop:inputs>

#proof[
  #emph[Source of the inputs and comparison of conventions.] The substantial assertions are imported from
    #cite(label("SC")). Its Proposition 2.4 supplies the common coordinate, the full flag mesh, and the tours;
    its Theorem 5.2 supplies the local recovery assertion; its Proposition 8.3 identifies the closed continuum
    form and centered inverse; and its Lemma 9.1 and Equation (9.11) give the Hilbert-space identification and
    Hilbert–Schmidt convergence. In the common extraction of its Section 9,
    retain also the countable family of local constrained-energy infima from its Lemma 5.1.
    These are infima of finite sums of squared edge differences under rational interval constraints on vertex
    values, viewed in the compact space $\[ 0 \, oo \]$. Their joint limits supply the simultaneous recovery
    statement of Theorem 5.2, and persist on further subsequences.
    Proposition 2.4 preserves the geometric conclusions under this joint extraction,
    so all four assertions hold on one coupling.
  The model conventions agree exactly: the companion uses the same rooted FK weight $2^(ell \/ 2)$,
    counts all $n$ primal edges, and pushes normalized corner counting to $deg \( v \) \/ \( 2 n \)$.
    Its all-edge network therefore has operator $B_n = 2 G_n$ by Lemma 2.
    Its limiting surface is the ordinary unit-area sphere with the original marks forgotten.
    Auxiliary marks and rerootings used in the coupling change neither of these marginals.
  For completeness, the companion first gives Hausdorff convergence of the distance graphs
  $ { \( z_n \( u \) \, z_n \( v \) \, hat(a)_n d_n \( u \, v \) \) : u \, v in V_n } arrow.r
    { \( x \, y \, D_h \( x \, y \) \) : x \, y in S^2 } $
  in the product of the round topology and the ordinary topology on $\[ 0 \, oo \)$.
    Uniform continuity of $D_h$ on the compact $S^2 times S^2$ turns this into vanishing vertex distortion.
    Approximating the triples $\( x \, x \, 0 \)$ in the opposite direction gives round density of the vertex
    locations, hence $D_h$-density. Lemma 3 permits replacement of $hat(a)_n$ by $a_n$:
    along this coupling the $hat(a)_n$-scaled diameters are bounded, and the ratio of the two scales tends to one.
  The corner multiplicities give the isometry of $J_n$, and the area pushforward gives that of $J$.
    The almost-everywhere singleton-fiber property makes $J$ onto, as detailed in #cite(label("SC")) Lemma 9.1.
    Uniform tour tracking and uniform continuity of $f$ give (2.6).
    The centered inverses in the companion are those of the unhalved operators, which yields exactly (2.7).
  Finally, the chart families in #cite(label("SC")) Proposition 2.4(iv) use two distinct exploration roots and
    separate auxiliary mark pairs. Their interiors cover the entire sphere, not merely the complement of one root.
    The finite-sphere clause of its Theorem 5.2 gives (2.9) in the common coordinate,
    simultaneously for continuous finite-energy inputs and buffered domains.
    We have stated only the smooth supported case needed here.
    The vanishing flag mesh and the strict buffers ensure that edges incident at the compact support are indeed
    among the edges counted in $W$. Conformal and anticonformal coordinate changes preserve the Dirichlet
    integral, and hence the diffusion and its clock. ◻
]

Fix henceforth one outcome in the probability-one event of Proposition 4,
  and relabel its further subsequence by $n$. Until we return to random environments, all graphs, coordinates,
  and the limiting measured conformal sphere are fixed. The symbols $bb(P)$ and $bb(E)$ will refer to the law and
  expectation of walks sampled with fresh randomness on these fixed graphs, started from $mu_n$,
  or of the limiting motion started from $mu_h$.

== 3 Operators and finite-dimensional laws <sec:operators>

Fix a realization in the probability-one event of Proposition 4, and retain its extracted sequence.
  All limits in this section and the next are on these fixed measured graphs and this fixed measured sphere.
  Let $Y^n$ be the stationary chain with generator $- G_n$, and set $xi_t^n = z_n \( Y_t^n \)$.
  We first identify its finite-dimensional limits. The centered inverses contain the required positive-time
  information, provided that the constants and the orthogonal complements of the discrete spaces are treated separately.

#thm([Proposition 3.1.])[
  #emph[For every $s > 0$ and $alpha > 0$, the following limits hold in operator norm on $H$:
#[#set math.equation(numbering: n => "(3.1)")
 $ J_n e^(- s G_n) J_n^(*) & arrow.r J e^(- s G) J^(*) \,\
J_n alpha \( alpha + G_n \)^(- 1) J_n^(*) & arrow.r J alpha \( alpha + G \)^(- 1) J^(*) . $ <eq:semigroup-convergence>]

 Consequently the finite-dimensional laws of $xi^n$ converge to those of the stationary Liouville Brownian motion
   $B^h$.]
] <prop:operators>

#proof[
  Write $Pi$ for the orthogonal projection onto the constants in $H$.
    On the mean-zero part of $J_n L^2 \( mu_n \)$, the operator $2 K_n$ is the inverse of $G_n$.
    On the constants and on $\( J_n L^2 \( mu_n \) \)^perp$, it is zero. Therefore
  #[#set math.equation(numbering: n => "(3.2)")
   $ J_n e^(- s G_n) J_n^(*) = Pi + psi_s \( 2 K_n \) \, wide psi_s \( y \) =
     cases(delim: "{", e^(- s \/ y) \, & y > 0 \,, 0 \, & y = 0 .) $ <eq:functional-calculus>]
  In particular, both sides vanish on the orthogonal complement of the discrete space,
    while both act as the identity on constants. The same identity holds for $G$ and $K$,
    with no extra orthogonal complement since $J$ is unitary.
    Hilbert–Schmidt convergence of $K_n$ implies operator-norm convergence and places all their spectra in a
    common bounded interval. Since $psi_s$ is continuous on that interval,
    continuous functional calculus proves (3.1). Similarly,
  $ J_n alpha \( alpha + G_n \)^(- 1) J_n^(*) = Pi + r_alpha \( 2 K_n \) \, wide r_alpha \( y \) =
    frac(alpha y, 1 + alpha y) \, $
  and the corresponding identity for $G$ proves (3.1). Neither argument asserts operator-norm convergence at time zero.
  To identify finite-dimensional laws, take continuous real functions $f_0 \, dots.h \,
    f_k$ on $S^2$ and times $0 lt.eq t_0 < t_1 < dots.h.c < t_k$.
    Put $g_(n \, i) = f_i compose z_n$ and let $M_a$ denote multiplication by a bounded function $a$ on $H$.
    By stationarity and the Markov property,
  #[#set math.equation(numbering: n => "(3.3)")
   $ bb(E) product_(i = 0)^k f_i \( xi_(t_i)^n \) = chevron.l 1 \,
     M_(J_n g_(n \, 0)) S_n \( t_1 - t_0 \) M_(J_n g_(n \, 1)) dots.h.c S_n \( t_k - t_(k - 1) \)
     M_(J_n g_(n \, k)) 1 chevron.r_H \, $ <eq:fdd-products>]
  where $S_n \( s \) = J_n e^(- s G_n) J_n^(*)$. Indeed, multiplication by $J_n
    g_(n \, i)$ preserves the range of $J_n$ and represents multiplication by $g_(n \, i)$ there.
    The tour convergence in Proposition 4 gives $J_n g_(n \, i) arrow.r J f_i$ uniformly,
    hence convergence of these multiplication operators in norm.
    Equation (3.1) now passes every factor in (3.3) to the limit.
    The resulting expression is the same product expectation for $B^h$:
    its semigroup is $e^(- s G)$ and its initial law $mu_h$ is stationary because $G 1 = 0$.
    Products of continuous functions determine the laws on each finite product of the compact sphere.
    Repeated observation times can be combined into a single test function,
    so all finite-dimensional distributions converge. ◻
]

We shall also need the operator applied to a resolvent approximation. If $f in C \( S^2 \)$, $g_n = f compose z_n$, and

#[#set math.equation(numbering: n => "(3.4)")
 $ u_(n \, alpha) = alpha \( alpha + G_n \)^(- 1) g_n \, wide u_alpha = alpha \( alpha + G \)^(- 1) f \,
   $ <eq:resolvent-functions>]

then, for every fixed $alpha > 0$,

#[#set math.equation(numbering: n => "(3.5)")
 $ J_n u_(n \, alpha) arrow.r J u_alpha \, wide J_n G_n u_(n \, alpha) arrow.r J G u_alpha quad
   upright("in ") H . $ <eq:resolvent-graph-convergence>]

The first assertion follows from (3.1) and $J_n g_n arrow.r J f$.
  The second follows from the resolvent equations $G_n u_(n \, alpha) =
  alpha \( g_n - u_(n \, alpha) \)$ and $G u_alpha = alpha \( f - u_alpha \)$.

== 4 From energy recovery to path tightness <sec:tightness>

Finite-dimensional convergence does not control excursions between observation times.
  We obtain that control from the local energy recovery in Proposition 4.
  First we extend buffered cutoff recoveries to the whole graph.
  A reversible maximal inequality then makes their resolvent approximations accurate along the entire stationary
  path. The bounded generators of those approximations will control motion after stopping times.

=== 4.1 Uniform recovery and a stationary maximal inequality <uniform-recovery-and-a-stationary-maximal-inequality>

#thm([Lemma 4.1.])[
  (Uniform cutoff recovery).  #emph[Let $chi : S^2 arrow.r \[ 0 \, 1 \]$ be smooth, and put $f = 1 - chi$.
    Suppose $"supp" chi subset V subset.double W subset.double
    U$ for buffered conformal chart regions to which the local recovery statement of Proposition 4 applies.
    There are real vertex functions $w_n$ such that
#[#set math.equation(numbering: n => "(4.1)")
 $ lr(bar.v.double w_n - f compose z_n bar.v.double)_(oo \, V_n) arrow.r 0 \, wide
   limsup_n cal(E)_n \( w_n \) lt.eq cal(E)_h \( f \) . $ <eq:uniform-recovery>]

]
] <lem:uniform-recovery>

#proof[
  Apply local recovery to $chi$ on $U$, obtaining $tilde(chi)_n$ uniformly close to $chi compose
    z_n$ at vertices in $W$. Choose $e_n arrow.b 0$ bounding these uniform errors;
    decreasingness can be achieved by taking tail suprema. Define
  $ chi_n \( v \) =
    cases(delim: "{", min { 1 \, max { 0 \, tilde(chi)_n \( v \) - e_n } } \, & z_n \( v \) in W \,, 0 \, & z_n \(
    v \) in.not W \,) wide w_n = 1 - chi_n . $
  The clipping map is $1$-Lipschitz, and $chi$ vanishes outside $W$,
    so $lr(bar.v.double chi_n - chi compose z_n bar.v.double)_oo lt.eq 2 e_n$.
    More importantly, $chi_n \( v \) > 0$ implies $chi \( z_n \( v \) \) > 0$.
    Thus an edge with a nonzero difference of $chi_n$ has an endpoint in $"supp" chi subset.double V$.
    The vanishing edge mesh and the buffer ensure that every such edge is eventually wholly in $W$,
    with both endpoints there. Its difference is then bounded in absolute value by the corresponding difference of
    $tilde(chi)_n$. Local recovery therefore gives
  $ limsup_n cal(E)_n \( w_n \) = limsup_n 1 / 2 sum_e \( d_e chi_n \)^2 lt.eq 1 /
    2 integral_U \| nabla chi \|^2 thin upright(d) upright("vol") = cal(E)_h \( f \) . $
  The last equality uses the support condition and conformal invariance of the two-dimensional Dirichlet integral.
    This proves (4.1), including the factor $1 \/ 2$. ◻
]

The following estimate is a finite-state analogue of the forward–backward martingale argument of Lyons and Zheng
  #cite(label("LyonsZheng1988")). We include its proof to handle jumps explicitly and to make the uniformity in
  the chain clear.

#thm([Lemma 4.2.])[
  (Stationary maximal inequality).  #emph[Let $Y$ be a continuous-time Markov chain on a finite state space,
    with generator $- A$ and reversible probability measure $pi$, started from $pi$.
    For every real function $v$ on that space and every $T > 0$,
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E) sup_(0 lt.eq t lt.eq T) \| v \( Y_t \) \|^2 lt.eq 2 lr(bar.v.double v bar.v.double)_(L^2 \( pi \))^2 +
   40 T chevron.l v \, A v chevron.r_(L^2 \( pi \)) . $ <eq:stationary-maximal>]

 The constants do not depend on the state space or its jump rates.]
] <lem:stationary-maximal>

#proof[
  Write $q \( x \, y \)$ for the off-diagonal jump rates. The process
  $ N_t = v \( Y_t \) - v \( Y_0 \) + integral_0^t A v \( Y_s \) thin upright(d) s $
  is a square-integrable martingale starting from zero. Its quadratic variation and stationarity give
  $ bb(E) \| N_T \|^2 & = T sum_x pi \( x \) sum_(y eq.not x) q \( x \, y \) \( v \( y \) - v \( x \) \)^2\
 & = 2 T chevron.l v \, A v chevron.r_(L^2 \( pi \)) . $
  Over $\[ 0 \, T \]$, reverse the path using its right-continuous modification in reversed time.
    Reversibility and stationarity give the same chain law, so its corresponding martingale $N'$ satisfies the
    same second-moment identity. At every fixed $t in \[ 0 \, T \]$,
    almost surely there is no jump at $t$ or at either deterministic endpoint.
    Subtracting the forward and backward formulas yields
  $ 2 #scale(x: 120%, y: 120%)[\(] v \( Y_t \) - v \( Y_0 \) #scale(x: 120%, y: 120%)[\)] =
    N_t - \( N'_T - N'_(T - t) \) . $
  Use this identity first at a countable dense set of times, together with $T$, and then use right continuity.
    It follows that
  $ sup_(t lt.eq T) \| v \( Y_t \) \| lt.eq \| v \( Y_0 \) \| + 1 / 2 sup_(t lt.eq T) \| N_t \| +
    sup_(t lt.eq T) \| N'_t \| . $
  If the two martingale suprema are $a$ and $b$, the square of the right side is at most $2 \| v \( Y_0 \) \|^2 +
    a^2 + 4 b^2$. Doob’s $L^2$ inequality bounds each of $bb(E) a^2$ and $bb(E) b^2$ by $8 T chevron.l v \,
    A v chevron.r_(L^2 \( pi \))$, proving (4.2). ◻
]

=== 4.2 Resolvent approximation along the whole path <resolvent-approximation-along-the-whole-path>

#thm([Lemma 4.3.])[
  #emph[For a cutoff $f = 1 - chi$ as in Lemma 6, write $g_n = f compose
    z_n$ and define $u_(n \, alpha)$ and $u_alpha$ by (3.4). For every $T > 0$,
#[#set math.equation(numbering: n => "(4.3)")
 $ lim_(alpha arrow.r oo) limsup_n bb(E) sup_(0 lt.eq t lt.eq T) \| u_(n \, alpha) \( Y_t^n \) -
   g_n \( Y_t^n \) \| = 0 . $ <eq:pathwise-resolvent-approximation>]

 For every $n$ and $alpha > 0$, moreover,
#[#set math.equation(numbering: n => "(4.4)")
 $ 0 lt.eq u_(n \, alpha) lt.eq 1 \, wide lr(bar.v.double G_n u_(n \, alpha) bar.v.double)_oo lt.eq
   alpha . $ <eq:bounded-generator>]

]
] <lem:resolvent-approximation>

#proof[
  Take the recoveries $w_n$ from Lemma 6. Their uniform approximation, together with the tour convergence,
    gives $J_n w_n arrow.r J f$ in $H$. For fixed $alpha$, Equation (3.5) therefore implies
  #[#set math.equation(numbering: n => "(4.5)")
   $ & limsup_n #scale(x: 120%, y: 120%)[\(]
     lr(bar.v.double w_n - u_(n \, alpha) bar.v.double)_(L^2 \( mu_n \))^2 +
     cal(E)_n \( w_n - u_(n \, alpha) \) #scale(x: 120%, y: 120%)[\)]\
 & #h(15mm)  lt.eq lr(bar.v.double f - u_alpha bar.v.double)_(L^2 \( mu_h \))^2 +
   cal(E)_h \( f - u_alpha \) . $ <eq:form-norm-approximation>]
  To see the energy assertion explicitly, expand
  $ cal(E)_n \( w_n - u_(n \, alpha) \) = cal(E)_n \( w_n \) - 2 chevron.l w_n \,
    G_n u_(n \, alpha) chevron.r_(L^2 \( mu_n \)) + chevron.l u_(n \, alpha) \,
    G_n u_(n \, alpha) chevron.r_(L^2 \( mu_n \)) . $
  The last two terms converge by (3.5), and the first has limsup at most $cal(E)_h \( f \)$.
    Since $u_alpha$ lies in the operator domain of $G$, the resulting expression is the form expansion of
    $cal(E)_h \( f - u_alpha \)$.
  The right side of (4.5) tends to zero. Indeed, if $nu_f$ is the spectral measure of $G$ at $f$, then it equals
  $ integral_(\[ 0 \, oo \)) \( 1 + lambda \) (frac(lambda, alpha + lambda))^2 thin upright(d) nu_f \( lambda \) . $
  Here $f$ belongs to the form domain, so $1 + lambda$ is integrable against $nu_f$;
    dominated convergence applies. Lemma 7, applied with $A = G_n$ to $w_n - u_(n \, alpha)$, now gives
  $ lim_(alpha arrow.r oo) limsup_n bb(E) sup_(t lt.eq T) \| w_n \( Y_t^n \) - u_(n \, alpha) \( Y_t^n \) \|^2 = 0 . $
  Cauchy–Schwarz and the uniform bound on $w_n - g_n$ yield (4.3).
  Finally, the Markov semigroup representation
  $ u_(n \, alpha) = integral_0^oo alpha e^(- alpha t) e^(- t G_n) g_n thin upright(d) t $
  shows that $0 lt.eq u_(n \, alpha) lt.eq 1$. The resolvent identity $G_n u_(n \, alpha) =
    alpha \( g_n - u_(n \, alpha) \)$ proves the remaining bound in (4.4). ◻
]

We now have approximations accurate for all times of the stationary path, not merely at a fixed time.
  Their generator bound makes that accuracy useful even when the starting time of an increment is selected from
  the path.

=== 4.3 Stopping-time increments <stopping-time-increments>

#thm([Proposition 4.4.])[
  #emph[On every fixed realization supplied by Proposition 4, and for every $T > 0$,
$ \( xi_t^n \)_(0 lt.eq t lt.eq T) med arrow.r.double med \( B_t^h \)_(0 lt.eq t lt.eq T) quad
  upright("in ") D \( \[ 0 \, T \] \, S^2 \) $

 for the Skorokhod $J_1$ topology associated with the round metric $rho$. Every subsequential path limit is continuous.]
] <prop:path-limit>

#proof[
  Fix $d > 0$. Choose finitely many round disks $O_1 \, dots.h \, O_m$ covering $S^2$ and smooth cutoffs $f_i =
    1 - chi_i$ to which Lemma 6 applies, such that
  #[#set math.equation(numbering: n => "(4.6)")
   $ f_i = 0 upright(" on ") O_i \, wide x in O_i \, med rho \( x \, y \) gt.eq d med arrow.r.double med
     f_i \( y \) = 1 . $ <eq:separating-cutoffs>]
  For example, take sufficiently small inner disks and slightly larger support disks,
    all compactly contained in chart regions and all with diameter smaller than $d$.
    Compactness gives a finite subcover, and there is room for the recovery buffers outside each support disk.
  Let $tau \, sigma$ be stopping times for $Y^n$, with $0 lt.eq tau lt.eq sigma lt.eq T$ and $sigma - tau lt.eq
    s$. Let $I$ be the first index for which $xi_tau^n in O_I$.
    This index is measurable with respect to the information $cal(F)_tau$ at time $tau$.
    Since $0 lt.eq f_i lt.eq 1$, (4.6) implies
  $ bb(P) { rho \( xi_tau^n \, xi_sigma^n \) gt.eq d } lt.eq
    bb(E) #scale(x: 120%, y: 120%)[\[] f_I \( xi_sigma^n \) - f_I \( xi_tau^n \) #scale(x: 120%, y: 120%)[\]] . $
  Denote by $u_(n \, alpha)^(\( i \))$ the resolvent approximation of $f_i compose z_n$.
    Optional sampling of its generator martingale gives
  $ & bb(E) #scale(x: 120%, y: 120%)[\[] u_(n \, alpha)^(\( I \)) \( Y_sigma^n \) -
    u_(n \, alpha)^(\( I \)) \( Y_tau^n \) #scale(x: 120%, y: 120%)[\]]\
 & wide = -
   sum_(i = 1)^m bb(E)
   [upright(bold(1))_({ I = i }) integral_tau^sigma G_n u_(n \, alpha)^(\( i \)) \( Y_t^n \) thin upright(d) t]
   lt.eq alpha s . $
  The equality is valid because each event ${ I = i }$ lies in $cal(F)_tau$;
    no independence of $I$ and the path is required. The last inequality uses (4.4) and the fact that the events
    ${ I = i }$ partition the sample space. Consequently
  #[#set math.equation(numbering: n => "(4.7)")
   $ bb(P) { rho \( xi_tau^n \, xi_sigma^n \) gt.eq d } & lt.eq alpha s +
     2 sum_(i = 1)^m bb(E) sup_(0 lt.eq t lt.eq T) \| f_i \( xi_t^n \) -
     u_(n \, alpha)^(\( i \)) \( Y_t^n \) \| . $ <eq:aldous-bound>]
  This bound is uniform over all the stated stopping-time pairs.
    First take $limsup_n$, then let $s arrow.b 0$ with $alpha$ fixed, and finally let $alpha arrow.r oo$. Lemma 8 gives
  $ lim_(s arrow.b 0) limsup_n sup_(tau lt.eq sigma lt.eq T\
0 lt.eq sigma - tau lt.eq s) bb(P) { rho \( xi_tau^n \, xi_sigma^n \) gt.eq d } = 0 . $
  This is the stopping-time increment condition in Aldous’s tightness criterion #cite(label("Aldous1978")).
    Compact containment is automatic on $S^2$, so the laws are tight in $D \( \[ 0 \, T \] \, S^2 \)$ with its
    $J_1$ topology.
  Every jump of $xi^n$ joins the endpoints of an embedded map edge.
    Proposition 4 therefore makes its largest jump tend to zero.
    A jump of a $J_1$ limit must be approximated by jumps of comparable size;
    hence every subsequential limit is continuous. Evaluation at fixed times is continuous at continuous paths,
    so Proposition 5 identifies the finite-dimensional laws of every such limit with those of $B^h$.
    These finite-dimensional laws determine the continuous path law.
    Tightness and uniqueness of the subsequential limit prove the proposition. ◻
]

== 5 Cable paths and the joint limit <sec:paths>

Proposition 9 identifies the walk in conformal coordinates and with exponential holding times.
  We now place the original cable graphs and the limiting metric sphere in one compact space,
  replace the exponential clock by the deterministic clock, and restore the randomness of the environment.
  Until the final proof, the realization supplied by Proposition 4 remains fixed.

=== 5.1 A common metric space <a-common-metric-space>

The following construction uses only the vertex-distance comparison.
  In particular, it does not require an extension of the conformal coordinate map to the interiors of cable edges.

#thm([Lemma 5.1.])[
  (A compact ambient space).  #emph[Let $C_n$ be finite connected cable graphs,
    with vertex sets $V_n$ and all edge lengths equal to $a_n > 0$, where $a_n arrow.r 0$.
    Write $d_(C_n)$ for their path metrics. Let $\( S \, d \)$ be a compact metric space,
    and suppose that maps $z_n : V_n arrow.r S$ satisfy
$ delta_n & := sup_(u \, v in V_n) \| d_(C_n) \( u \, v \) - d \( z_n \( u \) \, z_n \( v \) \) \| arrow.r 0 \,\
epsilon_n & := d_(upright(H))^S \( z_n \( V_n \) \, S \) arrow.r 0 . $

 There is a compact metric space $\( Z \, d_Z \)$ containing isometric copies of $S$ and every $C_n$, such that,
   with $c_n = delta_n \/ 2 + a_n$,
#[#set math.equation(numbering: n => "(5.1)")
 $ sup_(v in V_n) d_Z \( v \, z_n \( v \) \) & lt.eq c_n \,\
d_(upright(H))^Z \( C_n \, S \) & lt.eq max { a_n + c_n \, epsilon_n + c_n } . $ <eq:vertex-bridges>]

 If $nu_n$ is a probability measure on $V_n$ and $\( z_n \)_(*) nu_n arrow.r.double nu$ on $S$,
   then $d_(upright(P))^Z \( nu_n \, nu \) arrow.r 0$.]
] <lem:ambient-space>

#proof[
  Start with the disjoint union of $S$ and the $C_n$. Retain the metric within each piece,
    and allow a crossing from $v in V_n$ to $z_n \( v \) in S$ at cost $c_n$.
    Define distance as the infimum of the costs of finite chains made of such crossings and movements within
    individual pieces.
  This construction does not shorten any of the original metrics.
    Indeed, an excursion from $S$ through $C_n$, entering at $z_n \( u \)$ and returning at $z_n \( v \)$,
    costs at least
  $ 2 c_n + d_(C_n) \( u \, v \) gt.eq d \( z_n \( u \) \, z_n \( v \) \) . $
  Replacing all such excursions by movements in $S$ proves the assertion for pairs of points of $S$.
    For points of a fixed $C_n$, first remove excursions through the other cable graphs in this way.
    Each remaining excursion out of $C_n$, from a vertex $u$ to a vertex $v$, costs at least
  $ 2 c_n + d \( z_n \( u \) \, z_n \( v \) \) gt.eq d_(C_n) \( u \, v \) \, $
  so it too can be removed. This also proves the assertion for points in edge interiors.
    Distinct pieces remain separated: every chain leaving $C_n$ pays at least the positive cost $c_n$.
    Thus the chain construction defines a metric, not merely a pseudometric.
  Every point of $C_n$ is at distance at most $a_n$ from a vertex, even when its edge is a loop.
    It is consequently at distance at most $a_n + c_n$ from $S$.
    Conversely, every point of $S$ is at distance at most $epsilon_n + c_n$ from $C_n$.
    These observations prove (5.1)–(5.1) on the union. The union is totally bounded:
    its tail lies arbitrarily close to the compact space $S$,
    and each of the finitely many remaining cable graphs is compact. Its completion is the required compact space $Z$.
  The coupling $v mapsto \( v \, z_n \( v \) \)$ of $nu_n$ and $\( z_n \)_(*)
    nu_n$ has all its mass at pairs at distance at most $c_n$, whence
  $ d_(upright(P))^Z \( nu_n \, nu \) lt.eq c_n + d_(upright(P))^Z \( \( z_n \)_(*) nu_n \, nu \) arrow.r 0 . $
  For the last convergence, weak convergence on the compact subspace $S$ is also weak convergence in $Z$. ◻
]

Apply Lemma 10 to $C_n = \( overline(M)_n \, a_n d_n \)$ and $\( S \, d \) = \( S^2 \, D_h \)$, with $nu_n =
  mu_n$. The hypotheses are precisely the metric and measure conclusions of Proposition 4;
  vertex distances in a cable graph equal the corresponding graph distances.
  We henceforth regard these spaces as subsets of the resulting $Z$.

Because $rho$ and $D_h$ induce the same topology on the compact sphere,
  the identity map between the two metric spheres is uniformly continuous in both directions.
  Applying the same time changes in the definition of the Skorokhod $J_1$ topology therefore transfers
  Proposition 9 from $rho$ to $D_h$. Moreover, (5.1) gives the deterministic bound

$ sup_(0 lt.eq t lt.eq T) d_Z \( Y_t^n \, xi_t^n \) lt.eq c_n . $

It follows that, for every $T < oo$,

#[#set math.equation(numbering: n => "(5.2)")
 $ Y^n med arrow.r.double med B^h quad upright("in ") D \( \[ 0 \, T \] \, Z \) upright(" with the ") J_1
   upright(" topology") . $ <eq:ambient-path-limit>]

We shall use one consequence of the continuity of $B^h$. For a path $y : \[ 0 \, T \] arrow.r Z$, set

$ omega_T \( y \, s \) = sup_(t \, t' in \[ 0 \, T \]\
\| t - t' \| lt.eq s) d_Z \( y_t \, y_(t') \) . $

Then, for every $eta > 0$,

#[#set math.equation(numbering: n => "(5.3)")
 $ lim_(s arrow.b 0) limsup_n bb(P) #scale(x: 120%, y: 120%)[\[] omega_T \( Y^n \, s \) > eta
   #scale(x: 120%, y: 120%)[\]] = 0 . $ <eq:continuous-limit-modulus>]

To see this directly, use the Skorokhod representation theorem #cite(label("Billingsley1999")) Theorem 6.7 on the
  Polish space $D \( \[ 0 \, T \] \, Z \)$ in (5.2). Convergence in $J_1$ to a continuous path is uniform:
  composing with the convergent time changes changes that limiting path uniformly little;
  see also #cite(label("Billingsley1999")) Section 12, p. 124. On this representation,

$ omega_T \( Y^n \, s \) lt.eq 2 sup_(t lt.eq T) d_Z \( Y_t^n \, B_t^h \) + omega_T \( B^h \, s \) . $

Uniform continuity of each limiting path proves (5.3). The resulting probability statement depends only on the
  original path laws, not on the chosen representation.

=== 5.2 Removing the exponential clock <removing-the-exponential-clock>

The clock comparison must count every attempted step, including a loop traversal that does not change the vertex
  of the continuous-time chain.

#thm([Lemma 5.2.])[
  (The attempt clock).  #emph[Fix a realization supplied by Proposition 4, for which (5.2) holds.
    Let $X^n$ be the stationary discrete walk on $M_n$, including its selected half-edges,
    and let $overline(X)^n$ be its cable interpolation. Independently of the walk,
    let $\( e_(n \, k) \)_(k gt.eq 1)$ be independent exponential random variables of mean $1 \/ n$, and put
$ S_(n \, 0) = 0 \, wide S_(n \, k) = sum_(j = 1)^k e_(n \, j) \, wide N_n \( t \) = max { k : S_(n \, k) lt.eq t } . $

 Then $Y_t^n = X_(N_n \( t \))^n$ has generator $- G_n$ and $Y_(S_(n \, k))^n = X_k^n$.
   In the ambient space of Lemma 10, for every $T < oo$,
#[#set math.equation(numbering: n => "(5.4)")
 $ sup_(0 lt.eq t lt.eq T) d_Z \( overline(X)_(n t)^n \, Y_t^n \) arrow.r 0 quad
   upright("in probability") . $ <eq:clock-comparison>]

]
] <lem:clock>

#proof[
  Attempts occur at rate $n$ and apply the transition kernel $P_n$, so the generator is $n \( P_n - I \) = - G_n$.
    This remains true when an attempt traverses a loop. The identity at $S_(n \, k)$ follows from the
    right-continuous definition of $N_n$.
  Fix $T$ and write
  $ Delta_(n \, T) = max_(0 lt.eq k lt.eq floor.l n T floor.r) \| S_(n \, k) - k \/ n \| . $
  The centered partial sums form a martingale. Since $"Var" \( e_(n \, k) \) = n^(- 2)$,
    the $L^2$ maximal inequality gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ bb(E) \[ Delta_(n \, T)^2 \] lt.eq frac(4 floor.l n T floor.r, n^2) arrow.r 0 . $ <eq:clock-deviation>]
  For $k = floor.l n t floor.r$, the point $overline(X)_(n t)^n$ lies on the cable edge traversed from $X_k^n$,
    at distance at most $a_n$ from that vertex. Thus
  $ d_Z \( overline(X)_(n t)^n \, Y_t^n \) lt.eq a_n + d_Z \( Y_(S_(n \, k))^n \, Y_t^n \) \, wide \| S_(n \, k) -
    t \| lt.eq Delta_(n \, T) + 1 \/ n . $
  The spatial bound holds for loop edges as well as nonloop edges.
    On the event $Delta_(n \, T) + 1 \/ n lt.eq s lt.eq 1$, all the times appearing here lie in
    $\[ 0 \, T + 1 \]$. Consequently, for $a_n < eta \/ 2$,
  $ bb(P) [sup_(t lt.eq T) d_Z \( overline(X)_(n t)^n \, Y_t^n \) > eta] lt.eq
    bb(P) \[ Delta_(n \, T) + 1 \/ n > s \] + bb(P) \[ omega_(T + 1) \( Y^n \, s \) > eta \/ 2 \] . $
  First take the upper limit in $n$, using (5.5), and then let $s arrow.b 0$, using (5.3) on $\[ 0 \, T + 1 \]$.
    This proves (5.4). ◻
]

Combining Lemma 11 and (5.2) gives convergence of the cable paths to $B^h$ in $D \( \[ 0 \, T \] \, Z \)$.
  Both the cable paths and the limiting paths are continuous.
  The continuous path space is closed in the $J_1$ topology:
  a convergent sequence of continuous paths, after the defining time changes,
  converges uniformly and hence has a continuous limit. Its induced topology is the uniform topology,
  by the same time-change argument used above. Thus in fact

#[#set math.equation(numbering: n => "(5.6)")
 $ \( overline(X)_(n t)^n \)_(0 lt.eq t lt.eq T) med arrow.r.double med \( B_t^h \)_(0 lt.eq t lt.eq T) quad
   upright("in ") C \( \[ 0 \, T \] \, Z \) . $ <eq:cable-finite-horizon>]

This convergence holds on every integer time horizon, and therefore also in $C \( \[ 0 \, oo \) \, Z \)$ with the
  topology of uniform convergence on compact time intervals. Here are the compactness details.
  For each integer $m gt.eq 1$ and $epsilon.alt > 0$, finite-horizon tightness supplies a compact set $K_m subset
  C \( \[ 0 \, m \] \, Z \)$ such that the probability of leaving $K_m$ is at most $epsilon.alt 2^(- m)$,
  uniformly in $n$. The set of paths whose restriction belongs to $K_m$ for every $m$ is compact in
  $C \( \[ 0 \, oo \) \, Z \)$, by a diagonal subsequence argument, and has probability at least $1 -
  epsilon.alt$. Every subsequential limit has, by the continuous restriction maps,
  the law of $B^h$ on every $\[ 0 \, m \]$. These restrictions determine the entire path law. We have proved

#[#set math.equation(numbering: n => "(5.7)")
 $ \( overline(X)_(n t)^n \)_(t gt.eq 0) med arrow.r.double med \( B_t^h \)_(t gt.eq 0) quad
   upright("in ") C \( \[ 0 \, oo \) \, Z \) . $ <eq:cable-local-limit>]

=== 5.3 Restoring the random environment <restoring-the-random-environment>

We have obtained the conditional path limit for every fixed realization in the probability-one event of
  Proposition 4. We now combine it with convergence of the underlying measured spaces.

#proof[
  Start from an arbitrary subsequence and take the coupled further subsequence of Proposition 4.
    Fix a realization in its probability-one event and a finite integer $r gt.eq 1$.
    Conditional on this realization, the $r$ cable paths are independent with the common law in (5.7).
    Their joint law therefore converges to that of $r$ independent copies of $B^h$ in
    $C \( \[ 0 \, oo \) \, Z \)^r$. For example, a Skorokhod representation of (5.7),
    repeated on $r$ independent probability spaces, couples the product laws with almost sure convergence of every
    coordinate.
  Lemma 10 also gives Hausdorff convergence of the spaces and Prokhorov convergence of their measures in the same
    $Z$. Under the preceding product coupling, the curves converge uniformly on every compact time interval.
    By the definition of the curve-decorated Gromov–Hausdorff–Prokhorov topology,
    the decorated spaces consequently converge almost surely under that coupling.
    In particular, for any bounded continuous function $F$ on the space of such decorated objects,
    the expectation of $F$ over the $r$ walks on this fixed environment converges to its expectation over $r$
    independent stationary Liouville Brownian motions on the fixed limiting sphere.
  These expectations are the conditional expectations obtained by sampling walks with fresh randomness after the
    environment coupling. The walk kernel on a finite graph depends only on the map,
    not on the auxiliary coordinates, marks, or tours used in that coupling;
    the limiting kernel is the diffusion law specified by the quantum sphere.
    We have proved pointwise convergence of these conditional expectations on the probability-one event.
    The compact space $Z$, the path couplings, and the recovery functions used earlier are witnesses for this
    pointwise statement. They need not be chosen measurably as the environment varies.
    The conditional expectations from these sampling kernels are measurable,
    and bounded convergence now gives convergence of the unconditional expectations of $F$ along the coupled
    further subsequence.
  Thus every subsequence admits a further subsequence with the asserted joint limit.
    This proves convergence along the full sequence, for each fixed $r$.
    Lemma 11 used the deterministic acceleration $b_n = n$, which has exactly the time normalization in the theorem. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
