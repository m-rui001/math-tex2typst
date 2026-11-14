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

#align(center)[#text(size: 16pt, weight: "bold")[Spectral scalar curvature and Urysohn width \
in dimension three]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A positive scalar-curvature lower bound need not bound the diameter of a three-manifold:
  the product of a round two-sphere with a line is a basic example.
  A more suitable measure of size allows the manifold to extend along a graph while requiring the inverse image of
  every point of the graph to remain small. For a metric space $\( X \, d \)$, its #emph[Urysohn $1$-width] is

$ "UW"_1 \( X \, d \) = inf_(K \, f) med sup_(y in K) "diam"_d f^(- 1) \( y \) \, $

where $K$ ranges over simplicial complexes of dimension at most one, with their usual polyhedral topology,
  and $f : X arrow.r K$ ranges over continuous maps. We give the empty fiber diameter zero.
  The diameter here is that of the entire fiber, including distances between its different connected components.

We use the sign convention $Delta = "div" nabla$ for the Laplacian.
  The following theorem gives a width bound under a spectral, rather than a pointwise, scalar-curvature hypothesis.

#thm([Theorem 1.1.])[
  #emph[Let $\( M^3 \, g \)$ be a connected complete smooth Riemannian three-manifold without boundary.
    Suppose that $lambda > 0$ and
#[#set math.equation(numbering: n => "(1.1)")
 $ integral_M #scale(x: 120%, y: 120%)[\(] 4 \| nabla_g phi.alt \|_g^2 +
   "Scal"_g phi.alt^2 #scale(x: 120%, y: 120%)[\)] thin d "vol"_g gt.eq
   lambda integral_M phi.alt^2 thin d "vol"_g wide #scale(x: 120%, y: 120%)[\(] phi.alt in C_c^oo \( M \; bb(R) \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:main-spectral>]

 Then there exist a simplicial complex $K$ of dimension at most one and a continuous map $f : M arrow.r K$ such that
$ "diam"_g f^(- 1) \( y \) lt.eq 500 / sqrt(lambda) wide \( y in K \) . $

 The complex has its usual polyhedral topology. No orientability, spin, compactness,
   or bounded-geometry assumption is imposed on $M$.]
] <thm:main>

The notation $- 4 Delta_g + "Scal"_g gt.eq lambda$ will always mean (1.1).
  In particular, a pointwise bound $"Scal"_g gt.eq lambda$ implies the hypothesis, but is not required.
  The theorem concerns the given metric $g$; passing to a conformally related metric of positive scalar curvature
  would not by itself give the required distance estimate. The constant $500$ is convenient and is not optimized.

=== 1.1 Background and scope <background-and-scope>

Stable minimal surfaces provide a classical link between scalar curvature and the geometry of three-manifolds.
  Schoen and Yau used the stability inequality and the Gauss equation to obtain curvature and topological
  restrictions on such surfaces [13]. Fischer-Colbrie and Schoen developed the associated positive-solution method
  for Schrödinger operators [3]. The stable-surface radius estimate of Schoen and Yau [14] and the distance-level
  estimates of Gromov and Lawson [7] Section 10 show how local surface stability can control the large-scale
  geometry of the ambient three-manifold. The latter distance-level argument uses a topological condition on the
  first homology; it is not a diameter bound for an arbitrary distance sphere in an arbitrary three-manifold.

Gromov’s torus-stabilized scalar-curvature framework gives the closest precedent for the spectral formulation
  here. Torus stabilization means considering metrics on $M times bb(T)^N$ of the form $g +
  sum_(i = 1)^N phi_i^2 thin d theta_i^2$, with smooth positive functions $phi_i$ on $M$,
  while measuring width in the base metric $g$. In his #emph[Four lectures on scalar curvature],
  Gromov gives a three-dimensional graph-width theorem in this framework [5] Section 3.10.1, Theorem (G).
  That statement is formulated for orientable complete three-manifolds,
  with a mean-convex boundary allowed in the torus extension.
  The relation between torus stabilization and the coefficient $4$ in $- 4 Delta +
  "Scal"$ is made explicit in [6] Sections 1.A–1.B. Thus the spectral viewpoint and the scalar-curvature-to-width
  principle are established parts of this theory. Our purpose is to give a direct weighted proof of Theorem 1,
  including its nonorientable and noncompact cases, without a global bound on the auxiliary weight or its derivatives.

The prescribed-mean-curvature method used below also belongs to this development.
  Gromov’s $mu$-bubbles minimize area with an added volume term, whose density prescribes the mean curvature.
  Chodosh and Li developed weighted versions and a slice-and-dice construction that first simplifies the topology
  and then produces pieces of bounded diameter [1] Sections 3–6.
  The two-dimensional differential inequality underlying our closed-surface diameter estimate is equivalent to
  theirs [1] Lemma 16. Under a pointwise positive scalar-curvature lower bound,
  Liokumovich and Maximo constructed singular foliations of compact three-manifolds with simultaneous area,
  diameter, and genus control [10]. Liokumovich and Wang extended area and diameter control to complete noncompact
  three-manifolds [11]. These are stronger geometric conclusions in their pointwise setting,
  and they also imply graph-width bounds. Their level-set statements concern connected components of fibers of
  proper Morse functions; passing to their Reeb graphs distinguishes such components.
  The graph target in Theorem 1 likewise permits a uniform bound on whole fibers.

There are also sharp spectral band inequalities. For example, Hirsch, Kazaras, Khuri,
  and Zhang obtain quantitative bounds for bands from positivity of $- Delta + c "Scal"$, including $c = 1 \/ 4$,
  under the relevant orientability and topological hypotheses [8].
  Such an end-to-end distance estimate is a different conclusion from a graph-width bound.
  We use the weighted surface argument directly, keeping the spectral condition,
  the topology of separating surfaces, and the final fiber estimate within one proof.

=== 1.2 The proof and its useful components <the-proof-and-its-useful-components>

After scaling, assume $lambda = 1$. A positive supersolution of $\( - 4 Delta_g + "Scal"_g \) v gt.eq
  v$ gives a smooth function $t = - 2 log v$ such that

#[#set math.equation(numbering: n => "(1.2)")
 $ D \( g \, t \) := "Scal"_g + 2 Delta_g t - \| d t \|_g^2 gt.eq 1 . $ <eq:intro-weighted-scalar>]

The function $t$ supplies the positive area density $e^(- t)$,
  without changing the metric in which the final width is measured.
  All minimization and smoothing arguments involving this density take place in compact regions.

The first step is a weighted form of the stable-surface estimate.
  If a closed connected two-sided surface is stable for weighted area minus the weighted volume integral of a
  smooth pressure $mu$, its equation is $H - nu t = mu$, where $H$ is its mean curvature and $nu$ is the chosen
  unit normal. A positive function for its stability operator converts the ambient inequality into a
  two-dimensional inequality of the same form as (1.2). A conformal geodesic index argument then gives an
  intrinsic diameter bound in the #emph[original] surface metric whenever $D \( g \, t \) + mu^2 -
  2 \| d mu \|_g$ has a positive lower bound. The local version,
  proved on relatively compact surface domains in Section 2,
  also prevents stable minimizing sheets from escaping a sufficiently large fixed neighborhood.

We next cut along a locally finite family of closed stable weighted minimal surfaces.
  The family is chosen so that no finite subfamily disconnects $M$, and is maximal with this property.
  Every component $P$ of the cut manifold then has the following separation property:
  each compact connected two-sided surface meeting $partial P$ transversely,
  with its boundary exactly on $partial P$, separates $P$. Section 3 proves this by a localized minimizing
  argument. On the orientation cover, antisymmetric integral currents retain coorientations downstairs.
  A local area-nonincreasing retraction at a cut boundary permits full-neighborhood comparisons,
  so ordinary interior regularity applies even at boundary contacts.

The separation property allows small surfaces to control large distance slabs.
  To construct those surfaces without a boundary regularity problem,
  Section 4 doubles $P$ and smooths the metric and density compatibly with reflection.
  The useful smoothing variable is the logarithm of the weighted area density of the normal slices.
  Weighted minimality makes its first normal derivative vanish at the doubling locus,
  and the curvature inequality survives smoothing. A reflection-invariant weighted $mu$-bubble then restricts to a
  finite collection of compact separating surfaces in $P$, each with uniformly bounded diameter.
  The graph with complementary regions as vertices and interface components as edges is a tree,
  because each interface separates. The bubble places the basepoint and a fixed distant slab component in
  different regions, so one interface meets every path between them.
  Section 5 uses this common interface to bound the slab component’s diameter.

Finally, overlapping slabs give a cover of multiplicity at most two,
  and a subordinate partition of unity maps $P$ to a graph.
  Section 6 joins these maps across the original cuts, following the bounded-interface gluing principle of [5]
  Section 3.10.1, Lemma (A). Each cut surface is a sphere or a projective plane,
  so its map to a finite graph is nullhomotopic. The homotopies are kept inside finite subgraphs whose vertices
  correspond to cover sets meeting the relevant collar. This extra condition ensures that all collar pieces
  mapping to a given old graph point lie near one common cover set.
  New edges join only the two collars belonging to a single cut.
  These observations control entire fibers after gluing, rather than only their connected components.

The weighted surface estimate, the compatible smoothing of doubles,
  and the collar construction each isolate a useful part of the argument.
  Their proofs require local elliptic and geometric measure theory, but no uniform bounds on the geometry at infinity.

== 2 Weighted curvature and stable surfaces <sec:weighted-surfaces>

The spectral hypothesis produces a positive density for which closed stable weighted minimal surfaces have
  uniformly bounded diameter. We prove both the closed-surface estimate and a local version that does not require
  the surface to be complete. The latter will be used to extract compact surfaces in Section 3.

We use the sign convention $Delta = "div" nabla$ and take round spheres to have positive scalar curvature.
  A closed surface is compact without boundary. All integrals use Riemannian densities,
  so none of the formulas requires an orientation. For a Riemannian metric $h$ and a smooth real function $T$ on a
  manifold of any dimension, set

#[#set math.equation(numbering: n => "(2.1)")
 $ D \( h \, T \) = "Scal"_h + 2 Delta_h T - \| d T \|_h^2 . $ <eq:weighted-scalar>]

We work with the normalization $lambda = 1$ until the final rescaling in Section 6.

=== 2.1 From the quadratic form to a positive density <from-the-quadratic-form-to-a-positive-density>

We use the standard ground-state construction from a nonnegative quadratic form;
  see Fischer-Colbrie–Schoen [3] Theorem 1. We recall the exhaustion argument in the form needed here.

#thm([Lemma 2.1.])[
  (Positive weight).  #emph[Let $\( M \, g \)$ be a connected smooth Riemannian manifold without boundary. Suppose that
$ integral_M #scale(x: 120%, y: 120%)[\(] 4 \| d phi.alt \|_g^2 +
  "Scal"_g phi.alt^2 #scale(x: 120%, y: 120%)[\)] thin d "vol"_g gt.eq
  integral_M phi.alt^2 thin d "vol"_g wide \( phi.alt in C_c^oo \( M \; bb(R) \) \) . $

 There is a smooth function $t : M arrow.r bb(R)$ such that $D \( g \, t \) gt.eq 1$.]
] <lem:positive-weight>

#proof[
  It suffices to find a positive smooth function $v$ satisfying
  $ \( - 4 Delta_g + "Scal"_g \) v gt.eq v \, $
  since $t = - 2 log v$ then gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ D \( g \, t \) = "Scal"_g - 4 frac(Delta_g v, v) gt.eq 1 . $ <eq:log-weight>]
  If $M$ is compact, take a positive first eigenfunction of $- 4 Delta_g + "Scal"_g$.
    Its eigenvalue is at least one by the hypothesis.
  If $M$ is noncompact, fix $o in M$ and choose an increasing exhaustion $Omega_j$ by connected relatively compact
    smooth domains containing $o$. Let $lambda_j$ and $v_j$ be the first Dirichlet eigenvalue and a positive first
    eigenfunction on $Omega_j$, normalized by $v_j \( o \) = 1$.
    The quadratic-form hypothesis, extended to $H_0^1 \( Omega_j \)$ by density, gives $lambda_j gt.eq 1$.
    Domain monotonicity makes $lambda_j$ decreasing, and a fixed nonzero test function in $Omega_1$ bounds it from
    above. Thus $lambda_j arrow.r lambda_oo gt.eq 1$. On each compact subset of $M$, the local Harnack inequality,
    applied along finitely many chains of coordinate balls joining it to $o$,
    bounds $v_j$ above and away from zero for all sufficiently large $j$.
    Interior elliptic estimates [4] Theorems 6.2 and 8.20 and a diagonal subsequence now give smooth convergence
    on compact subsets to a positive function $v$ with
  $ \( - 4 Delta_g + "Scal"_g \) v = lambda_oo v . $
  Equation (2.2) proves the assertion. ◻
]

Fix this function $t$ on $M$. Its density $e^(- t)$ determines the weighted area used to cut $M$.
  We first carry out the surface calculation for arbitrary ambient data $\( h \, T \)$,
  since a modified metric and weight will also occur later.

=== 2.2 The stability inequality <the-stability-inequality>

Let $Sigma$ be a smooth two-sided surface, possibly with boundary, in a Riemannian three-manifold $\( X \, h \)$,
  and choose its unit normal $nu$. All surface variations and test functions will be compactly supported in $"int"
  Sigma$. Write $k = h \|_Sigma$ and use the conventions

$ B \( V \, W \) = h \( nabla_V nu \, W \) \, wide H = "tr"_k B . $

For a smooth ambient function $T$, weighted area means $integral_Sigma e^(- T) thin d "Area"_k$.
  If $Sigma$ is the boundary of a set $E$, with outward normal $nu$, the functional

#[#set math.equation(numbering: n => "(2.3)")
 $ integral_(partial E) e^(- T) thin d "Area"_h - integral_E mu e^(- T) thin d "vol"_h
   $ <eq:weighted-pressure-functional>]

has Euler–Lagrange equation

#[#set math.equation(numbering: n => "(2.4)")
 $ H - nu T = mu \, $ <eq:weighted-mean-curvature>]

where $mu$ is a smooth function on $X$. For a surface not globally bounding a set,
  the same equation and second variation are defined locally using its chosen normal.
  Stability always means unconstrained stability: all normal variations compactly supported in the surface
  interior are allowed, with no volume constraint.

The weighted surface Laplacian and the potential in the second variation are

#[#set math.equation(numbering: n => "(2.5)")
 $ Delta_(Sigma \, T) u & = Delta_k u - chevron.l d \( T \|_Sigma \) \, d u chevron.r_k \,\
Q & = "Ric"_h \( nu \, nu \) + "Hess"_h T \( nu \, nu \) + \| B \|_k^2 + nu mu . $ <eq:weighted-jacobi>]

In particular, stability is the inequality

#[#set math.equation(numbering: n => "(2.6)")
 $ integral_Sigma #scale(x: 120%, y: 120%)[\(] \| d u \|_k^2 -
   Q u^2 #scale(x: 120%, y: 120%)[\)] e^(- T) thin d "Area"_k gt.eq
   0 wide \( u in C_c^oo \( "int" Sigma \) \) . $ <eq:stability-form>]

To check the signs, a normal variation of speed $u$ satisfies

$ H' = - Delta_k u - \( "Ric"_h \( nu \, nu \) + \| B \|_k^2 \) u \, wide nu' = - nabla_k u . $

Differentiating $H - nu T - mu$ therefore gives $- Delta_(Sigma \, T) u - Q u$.
  The first variation of (2.3) has factor $H - nu T - mu$, so its second variation at a stationary surface is
  exactly (2.6).

#thm([Lemma 2.2.])[
  (Curvature transferred to a stable surface).  #emph[Suppose that a smooth two-sided surface $Sigma$ satisfies
    (2.4) and is stable in the sense of (2.6). Let $Omega$ be either the whole surface,
    if it is closed and connected, or a connected smooth surface domain with compact closure in $"int" Sigma$.
    There is a smooth positive function $w$ in $Omega$ such that, with $p = log w$ and $U = T \|_Sigma - p$,
#[#set math.equation(numbering: n => "(2.7)")
 $ D \( k \, U \) gt.eq D \( h \, T \) + mu^2 + \| B \|_k^2 + 2 nu mu + \| d p \|_k^2 wide
   upright("in ") Omega . $ <eq:surface-curvature-transfer>]

 In the domain case, no completeness hypothesis is imposed on $Sigma$.]
] <lem:weighted-stability>

#proof[
  Take a positive first eigenfunction of the self-adjoint operator $- Delta_(Sigma \, T) -
    Q$ in the measure $e^(- T) thin d "Area"_k$, with Dirichlet boundary condition in the domain case.
    Stability makes its first eigenvalue nonnegative. Thus
  #[#set math.equation(numbering: n => "(2.8)")
   $ - Delta_(Sigma \, T) w gt.eq Q w \, wide - Delta_(Sigma \, T) p gt.eq Q + \| d p \|_k^2 . $ <eq:log-jacobi>]
  The function $w$ is positive in $Omega$; its possible vanishing on $partial Omega$ will not enter the argument.
  The Gauss equation and the decomposition of the ambient Laplacian read
  $ "Scal"_k = "Scal"_h - 2 "Ric"_h \( nu \, nu \) + H^2 - \| B \|_k^2 \, wide Delta_h T =
    Delta_k \( T \|_Sigma \) + H nu T + "Hess"_h T \( nu \, nu \) . $
  Together with $\| d T \|_h^2 = \| d \( T \|_Sigma \) \|_k^2 + \( nu T \)^2$, these give
  #[#set math.equation(numbering: n => "(2.9)")
   $ D \( k \, T \|_Sigma \) =  & D \( h \, T \) - 2 #scale(x: 120%, y: 120%)[\(] "Ric"_h \( nu \, nu \) +
     "Hess"_h T \( nu \, nu \) #scale(x: 120%, y: 120%)[\)]\
 & + \( H - nu T \)^2 - \| B \|_k^2 . $ <eq:surface-gauss-weighted>]
  Changing $T \|_Sigma$ to $T \|_Sigma - p$ gives the exact identity
  $ D \( k \, U \) = D \( k \, T \|_Sigma \) - 2 Delta_(Sigma \, T) p - \| d p \|_k^2 . $
  Now substitute (2.8), (2.5), and $H - nu T = mu$ into (2.9).
    The ambient normal Ricci and Hessian terms cancel, leaving (2.7). ◻
]

In particular, the lower bound

#[#set math.equation(numbering: n => "(2.10)")
 $ D \( h \, T \) + mu^2 - 2 \| d mu \|_h gt.eq c > 0 $ <eq:pressure-curvature-condition>]

along a stable surface gives $D \( k \, U \) gt.eq c$ on the closed surface or the chosen relatively compact
  domain in Lemma 3. We next convert this curvature inequality into a length estimate in the original induced
  metric $k$, not merely in a conformal metric.

=== 2.3 The conformal length estimate <the-conformal-length-estimate>

The conformal geodesic argument is part of the stable-surface radius method of Schoen–Yau [14];
  the differential inequality used here also appears in Chodosh–Li [1] Lemma 16.
  We give the index calculation explicitly to track length in the original metric.

#thm([Lemma 2.3.])[
  (Conformal index estimate).  #emph[Let $\( S \, k \)$ be a smooth surface, let $U in C^oo \( S \)$,
    and suppose that $D \( k \, U \) gt.eq c > 0$. Let $gamma$ be a finite geodesic segment for $tilde(k) =
    e^(- 2 U) k$ whose index form is nonnegative for normal variations compactly supported in its interior. Then
$ "length"_k \( gamma \) lt.eq frac(2 pi, sqrt(c)) . $

 The same conclusion holds when the curvature hypothesis is assumed only on a neighborhood of the segment’s interior.]
] <lem:conformal-length>

#proof[
  The Gauss curvature of $tilde(k)$ is
  #[#set math.equation(numbering: n => "(2.11)")
   $ K_(tilde(k)) = e^(2 U) \( K_k + Delta_k U \) gt.eq 1 / 2 e^(2 U) \( c + \| d U \|_k^2 \) \, $ <eq:conformal-gauss>]
  because $"Scal"_k = 2 K_k$. Parametrize $gamma$ by $k$-arclength $s in \[ 0 \, L \]$.
    Choose a parallel $tilde(k)$-unit normal along its interior;
    such a choice exists along an interval even when $S$ is nonorientable.
    Since $d tilde(s) = e^(- U) d s$, the index inequality and (2.11) imply
  #[#set math.equation(numbering: n => "(2.12)")
   $ 0 lt.eq integral_0^L e^U (\( phi.alt' \)^2 - 1 / 2 \( c + \| d U \|_k^2 \) phi.alt^2) thin d s
     wide \( phi.alt in C_c^oo \( 0 \, L \) \) . $ <eq:conformal-index>]
  Here and below $U$ and its differential are evaluated along $gamma$. Set $phi.alt = e^(- U \/ 2) psi$.
    As $\| U' \| lt.eq \| d U \|_k$, completing the square gives
  $ e^U (\( phi.alt' \)^2 - 1 / 2 \( c + \| d U \|_k^2 \) phi.alt^2) & = 2 \( psi' \)^2 - c / 2 psi^2 -
    (psi' + 1 / 2 U' psi)^2\
 & quad - 1 / 2 #scale(x: 120%, y: 120%)[\(] \| d U \|_k^2 - \( U' \)^2 #scale(x: 120%, y: 120%)[\)] psi^2\
 & lt.eq 2 \( psi' \)^2 - c / 2 psi^2 . $
  Consequently
  $ 2 integral_0^L \( psi' \)^2 thin d s gt.eq c / 2 integral_0^L psi^2 thin d s
    wide \( psi in C_c^oo \( 0 \, L \) \) . $
  Approximating $sin \( pi s \/ L \)$ in $H_0^1 \( 0 \, L \)$ gives $2 pi^2 \/ L^2 gt.eq c \/ 2$,
    which is the asserted bound. All test variations are supported away from the endpoints,
    proving also the last assertion. ◻
]

#thm([Proposition 2.4.])[
  (Closed stable surfaces).  #emph[Let $Sigma$ be a smooth closed connected two-sided surface in a Riemannian
    three-manifold $\( X \, h \)$. Let $T \, mu$ be smooth ambient functions.
    Suppose that $Sigma$ satisfies $H - nu T = mu$, is stable for weighted area with pressure $mu$,
    and satisfies (2.10) for a constant $c > 0$. Then, in the induced metric $k = h \|_Sigma$,
$ "diam"_k Sigma lt.eq frac(2 pi, sqrt(c)) . $

 Moreover, $Sigma$ is diffeomorphic to $S^2$ or $bb(R) P^2$.]
] <prop:stable-surface>

#proof[
  Lemma 3 gives a smooth function $U$ on $Sigma$ with $D \( k \, U \) gt.eq c$.
    The conformal metric $e^(- 2 U) k$ is complete because $Sigma$ is compact.
    Join any two points by a minimizing geodesic for that metric.
    Its index form is nonnegative, so Lemma 4 bounds its $k$-length by $2 pi \/ sqrt(c)$.
    The $k$-distance between the endpoints is no greater.
  Integrating $D \( k \, U \) gt.eq c$ and using Gauss–Bonnet gives
  $ 4 pi chi \( Sigma \) = integral_Sigma 2 K_k thin d "Area"_k gt.eq c "Area"_k \( Sigma \) +
    integral_Sigma \| d U \|_k^2 thin d "Area"_k > 0 . $
  This formula is valid also for nonorientable surfaces, either directly with densities or by passing to the
    orientation double cover. The classification of closed connected surfaces now gives precisely $S^2$ and $bb(R)
    P^2$. ◻
]

#thm([Lemma 2.5.])[
  (Local exit estimate).  #emph[Let $Sigma$ be a smooth two-sided stable surface satisfying $H - nu T =
    mu$ in a Riemannian three-manifold $\( X \, h \)$. Suppose that (2.10) holds on $Sigma$.
    Let $Omega_0 \, Omega_1$ be connected smooth domains with compact closures in $"int"
    Sigma$ such that $overline(Omega_0) subset Omega_1$ and $partial Omega_0 eq.not diameter$.
    For every $x in Omega_0$ there is a path from $x$ to $partial Omega_0$, contained in $overline(Omega_0)$,
    whose length in $k = h \|_Sigma$ is at most $2 pi \/ sqrt(c)$.]
] <lem:stable-exit>

#proof[
  Apply Lemma 3 in $Omega_1$. The resulting $U$ is smooth on a neighborhood of $overline(Omega_0)$ and satisfies
    $D \( k \, U \) gt.eq c$ there. In the compact Riemannian manifold with boundary $overline(Omega_0)$,
    choose a path of least $e^(- 2 U) k$-length from $x$ to $partial Omega_0$,
    and stop it at its first boundary point. Its interior is a geodesic in $Omega_0$ and its index form is
    nonnegative for compactly supported interior variations. Lemma 4 gives the stated $k$-length estimate.
    This argument uses compactness only of the two chosen domains, not completeness of $Sigma$. ◻
]

For the original data $\( M \, g \, t \)$, weighted minimality means $mu = 0$.
  Since $D \( g \, t \) gt.eq 1$, Proposition 5 bounds every closed connected two-sided stable weighted minimal
  surface by $2 pi$ and identifies its topology. The same constant in Lemma 6 prevents an open stable sheet from
  extending arbitrarily far inside a region where it has compact intersections with ambient balls.

== 3 Cutting to obtain separation <sec:cutting>

The surface estimate controls the size of a closed stable weighted minimal surface,
  but does not make an arbitrary separating construction connected.
  We therefore first remove the topological obstruction: after cutting along a locally finite family of small
  stable surfaces, every compact connected two-sided hypersurface neatly embedded in a resulting piece will
  separate it. Throughout this section, $M$ is complete and $D \( g \, t \) gt.eq 1$.

A hypersurface in a manifold with boundary is #emph[neatly embedded] if its boundary is exactly its intersection
  with the ambient boundary and the intersection is transverse.
  A closed surface means a compact surface without boundary. All hypersurfaces considered below are smooth.

#thm([Proposition 3.1.])[
  #emph[There is a locally finite family $cal(S)$ of pairwise disjoint closed connected embedded two-sided stable
    weighted minimal surfaces in $M$ such that the following statements hold.
    Let $N$ be the manifold obtained by cutting $M$ along $cal(S)$, and let $q : N arrow.r
    M$ be the natural gluing map.]
  + #emph[The map $q$ is proper and is a quotient map. Each connected component $P$ of $N$,
    with the intrinsic length metric of the pulled-back metric $g$, is proper.]
  + #emph[Each boundary component of $P$ is a sphere or a real projective plane, is stable weighted minimal,
    and has intrinsic $g$-diameter at most $2 pi$. Each surface of $cal(S)$ gives two boundary copies in $N$.]
  + #emph[Every compact connected neatly embedded two-sided hypersurface in $P$ separates $P$.]
] <prop:separating-cut>

=== 3.1 A maximal locally finite family <a-maximal-locally-finite-family>

Order by inclusion the families of pairwise disjoint closed connected embedded two-sided stable weighted minimal
  surfaces for which no finite subfamily disconnects $M$. The empty family is admissible,
  and the union of a chain is admissible because each finite subfamily lies in one member of the chain.
  Zorn’s lemma gives a maximal family $cal(S)$.

We first verify local finiteness. By Proposition 5, every member has intrinsic, and hence ambient,
  diameter at most $2 pi$. Consequently, all members meeting a fixed compact set $A subset
  M$ lie in the compact closed $2 pi$-neighborhood of $A$. Here completeness is used through the properness of the
  Riemannian distance on $M$.

For any finite subfamily $S_1 \, dots.h \, S_k$, the classes $\[ S_i \] in
  H_2 \( M \; bb(Z) \/ 2 \)$ are linearly independent. Indeed,
  the connected complement of the subfamily contains a path joining the two sides of $S_i$;
  closing it by a short transverse arc gives a loop meeting $S_i$ once and missing the other surfaces.
  Modulo two, intersection with this loop pairs to one with $\[ S_i \]$ and to zero with the other classes.
  This uses only the intersection pairing of compact cycles,
  so neither orientability nor compactness of $M$ is required.
  A compact smooth submanifold neighborhood of the closed $2
  pi$-neighborhood of $A$ has finite-dimensional $H_2 \( - \; bb(Z) \/ 2 \)$.
  Its image in $H_2 \( M \; bb(Z) \/ 2 \)$ therefore bounds the size of every finite subfamily meeting $A$.
  Thus only finitely many members meet $A$.

Local finiteness makes cutting well-defined. In a tubular chart at a cut surface,
  $q$ glues the two closed half-charts along their boundary; away from the cuts it is a diffeomorphism.
  These charts show that $q$ is a quotient map and is proper locally over relatively compact neighborhoods.
  A finite such cover of a compact subset of $M$ proves global properness.
  The pulled-back metric induces the manifold topology, also for its intrinsic length metric on each component
  $P$. A closed bounded subset of $P$ maps into a bounded subset of $M$;
  it is closed in the compact inverse image of a sufficiently large closed ball. It is therefore compact.
  This proves properness of $P$.

The boundary assertions in Proposition 7 now follow from Proposition 5. It remains to prove separation.
  Fix a connected component $P$ of $N$. We first treat closed hypersurfaces in the interior;
  this is the only step requiring minimization.

=== 3.2 Producing an additional stable surface <producing-an-additional-stable-surface>

#thm([Lemma 3.2.])[
  #emph[Every closed connected embedded two-sided hypersurface in $"int" P$ separates $P$.]
] <lem:closed-separation>

#proof[
  Suppose that $F subset "int" P$ is such a hypersurface and does not separate. Fix a coorientation of $F$.
    A loop crossing $F$ once has nonzero algebraic crossing number.
    If it reverses ambient orientation, traverse it twice. A general-position perturbation in dimension three then
    gives a smooth embedded, transverse, orientation-preserving loop $gamma subset "int"
    P$ with nonzero algebraic crossing number with $F$. The crossing number is unchanged by this perturbation.
  ===== 3.2.1 A compact minimization problem. <a-compact-minimization-problem.>
  Let $pi : hat(P) arrow.r P$ be the orientation double cover, including both copies when $P$ is orientable.
    Give $hat(P)$ its canonical orientation and write $tau$ for the deck involution.
    The coorientation of $F$ and the ambient orientation orient its full lift as an integral $2$-cycle $T_F$ satisfying
  $ tau_(\#) T_F = - T_F . $
  Since $gamma$ preserves orientation, it has two closed lifts.
    In a small tubular neighborhood of one of them, choose a smooth compactly supported closed $2$-form $beta$
    such that $T_F \( beta \) eq.not 0$. Concretely, the normal disk bundle of this lifted loop is an oriented
    trivial $2$-disk bundle. A disk area form with a smooth bump of integral one,
    extended along the loop and by zero outside the tube, is a Thom form.
    Its evaluation is the signed crossing number, up to the orientation chosen for the disk.
    The tube and $"supp" beta$ lie in the interior. Preserving this nonzero evaluation will detect a nonseparating
    component, once the surface estimate has made the components meeting the form support compact.
  Choose a relatively open set $W subset P$ with compact closure that contains $F$ and the closed
    $10$-neighborhood of $pi \( "supp" beta \)$ in the intrinsic metric of $P$. Such a set exists by properness.
    Let $J subset P$ be a compact set containing $overline(W)$. In the conformal metric
  #[#set math.equation(numbering: n => "(3.1)")
   $ macron(g) = e^(- t) g \, $ <eq:area-metric>]
  surface area is precisely area weighted by $e^(- t)$. Minimize $macron(g)$-mass among integral $2$-cycles $T$
    supported in $pi^(- 1) \( J \)$ that satisfy
  #[#set math.equation(numbering: n => "(3.2)")
   $ tau_(\#) T = - T \, wide T \( beta \) = T_F \( beta \) . $ <eq:current-constraints>]
  These are absolute cycles, not relative cycles. To interpret them at the boundary,
    smoothly extend $P$ and $macron(g)$ across $partial P$, take the orientation cover of that extension,
    and regard the currents as currents in the extension with the indicated support constraint.
    The form $beta$ extends by zero. The competitor $T_F$ shows that the class is nonempty.
    Federer–Fleming compactness and closure [2], followed by lower semicontinuity of mass, give a minimizer $T_0$:
    support is confined to a fixed compact set, the boundaries vanish,
    and both conditions in (3.2) are closed under weak convergence.
  In a sufficiently small ball over $W ∩ "int" P$, $T_0$ is locally mass minimizing.
    A compactly supported integral-cycle change there evaluates to zero on $beta$,
    since $beta$ is exact in the ball. Making the opposite change in the disjoint deck translate preserves (3.2);
    a strict decrease would give a strict decrease of twice the amount upstairs.
    We must establish the same minimizing property across the boundary before using interior regularity.
  ===== 3.2.2 Comparison across a minimal boundary. <comparison-across-a-minimal-boundary.>
  Each boundary component is minimal for $macron(g)$, because its $macron(g)$-area is its original weighted area.
    Near any point of such a component there is a foliation by $macron(g)$-minimal disks,
    with the boundary disk as one leaf. Here is the local construction,
    which does not require a globally stable extension of the boundary.
    On a sufficiently small disk in that leaf, the Dirichlet Jacobi operator, with the stability sign,
    has strictly positive first eigenvalue: its zeroth-order term is bounded and the Poincaré inequality dominates
    it after shrinking the disk. Solve the minimal-graph equation with small constant normal boundary height by
    the implicit function theorem, using the standard Dirichlet elliptic theory [4].
    The derivative at height zero solves the Jacobi equation with boundary value one and is strictly positive by
    the maximum principle. After shrinking the disk and the height interval, these graphs give the asserted foliation.
  Let $Y$ be its unit normal field, directed toward the allowed side of the boundary.
    Since all leaves are minimal, $"div"_(macron(g)) Y = 0$. In an oriented flow box the $2$-form
  $ alpha = iota_Y thin d "vol"_(macron(g)) $
  is closed, annihilates $Y$, and is invariant under its flow.
    Projection along this flow onto the boundary leaf therefore pulls its area form back to $alpha$.
    As $alpha$ has comass one, this projection has $2$-Jacobian at most one on every tangent $2$-plane.
  To apply this to currents, choose a contractible flow box $U'$ upstairs, with coordinates $\( z \, s \)$,
    whose boundary leaf is $s = 0$ and whose allowed side is $s gt.eq 0$.
    Require that the allowed side lie over $W$, and that $overline(U')$ and $tau overline(U')$ be disjoint.
    Take a smaller box $U subset.double U'$. Suppose a compactly supported integral $2$-cycle $S$ in $U$ gave a
    strictly smaller mass for $T' = T_0 + S$. Use the locally Lipschitz map
  $ R \( z \, s \) = \( z \, max { 0 \, s } \) $
  near $overline(U)$, interpolating to the identity before leaving $U'$,
    and keeping $R$ equal to the identity everywhere on the allowed side.
    The interpolation can be made in the flow coordinate and can be taken to map $U'$ into itself.
    Every portion of $T'$ on the exterior side is supported in $U$, where the exact projection rule holds.
    On the allowed side, including tangent planes carried by the boundary leaf, $R$ is the identity.
    The area formula and the preceding Jacobian bound give
  #[#set math.equation(numbering: n => "(3.3)")
   $ upright(bold(M))_(macron(g)) \( R_(\#) T' \) lt.eq upright(bold(M))_(macron(g)) \( T' \) .
     $ <eq:boundary-retraction-mass>]
  No Jacobian bound for the interpolation region is needed, since $T'$ has no exterior mass there.
  Put $S' = R_(\#) T' - T_0$. Pushforward preserves the cycle condition, and $R_(\#) T_0 = T_0$.
    Thus $S'$ is an integral cycle supported on the allowed side in a compact subset of $U'$.
    Both $S'$ and $tau_(\#) S'$ evaluate to zero on $beta$: use exactness in the respective contractible boxes,
    with primitives cut off beyond the cycle supports. Consequently
  $ T_0 + S' - tau_(\#) S' $
  is again supported in $pi^(- 1) \( J \)$ and satisfies (3.2).
    The boxes are disjoint, and antisymmetry of $T_0$ makes the two mass changes equal.
    By (3.3) their sum is strictly negative, contradicting minimality.
    This proves local mass minimization in full neighborhoods across the boundary.
  ===== 3.2.3 Regular sheets and their coorientations. <regular-sheets-and-their-coorientations.>
  We now use codimension-one interior regularity for mass-minimizing integral currents:
    in a smooth Riemannian $3$-manifold, a locally mass-minimizing integral $2$-current without boundary is,
    near each support point, a smooth embedded minimal surface with locally constant integer multiplicity and a
    smooth orientation [15] Chapter 7, Section 5. The full-neighborhood comparison just proved supplies precisely
    the interior hypothesis even at points of $partial P$. The strong maximum principle implies that any sheet
    touching the boundary agrees there with the boundary leaf.
    Hence, over $W$, the projected support is smooth and each connected component is either contained in $partial
    P$ or disjoint from it.
  In a sufficiently small evenly covered neighborhood of a projected support point,
    regularity gives an embedded sheet in each lift. Deck invariance identifies their projections,
    so the projected support is itself an embedded surface. Moreover,
    the orientations give coorientations downstairs: $tau$ reverses both the current orientation and the ambient
    orientation, so preserves the resulting normal direction.
    The absolute multiplicities on the two lifts of a connected projected component agree.
    Every component in $W ∩ "int" P$ is therefore a two-sided stable weighted minimal surface,
    initially possibly noncompact. To see the asserted stability,
    extend a compactly supported normal variation of one sheet to an ambient flow isolating that sheet and
    supported in $W ∩ "int" P$. Its lifts preserve antisymmetry.
    They preserve evaluation on $beta$ by the homotopy formula, because $d beta = 0$ and $partial T_0 = 0$.
    Minimality of $T_0$, and the locally constant multiplicities,
    then give the weighted stability inequality for that sheet.
  We have obtained stable surfaces near the detecting form.
    The next point is that the surface length estimate makes the relevant components compact,
    even though no completeness of these intermediate sheets has been asserted.
  ===== 3.2.4 The components detected by the form are closed. <the-components-detected-by-the-form-are-closed.>
  Let $Sigma$ be a component of the projected support on $W$ meeting $pi \( "supp" beta \)$,
    and choose $x$ in that intersection. This component is disjoint from $partial P$.
    Its intersection with $overline(B)_P \( x \, 10 \)$ is compact.
    Indeed, this ball is compact and is contained in $W$; the projected support is closed relative to $W$ because
    the cover is finite, and its components are closed there.
    The regular embedded surface structure is the subspace topology.
  If $Sigma$ were noncompact, choose a connected relatively compact smooth domain $Omega_0 subset
    Sigma$ containing this intersection in its interior. Its nonempty boundary lies outside
    $overline(B)_P \( x \, 10 \)$. Choose another connected relatively compact smooth surface domain $Omega_1$
    with $overline(Omega_0) subset Omega_1$. Stability holds throughout $Omega_1$, and $D \( g \, t \) gt.eq 1$.
    Lemma 6, with $mu = 0$ and $c = 1$, produces a path from $x$ to $partial
    Omega_0$ of induced $g$-length at most $2 pi$. Its image in $P$ has no greater length.
    This contradicts the distance of $partial Omega_0$ from $x$, which is greater than $10$.
    Thus $Sigma$ is a closed surface in the interior of $P$.
  Only finitely many projected components meet the form support, by compactness and local regularity.
    Since $T_0 \( beta \) eq.not 0$, at least one of these closed components is nonseparating in $P$.
    For otherwise, for each component choose the closure of one of its sides,
    with the choice agreeing with its coorientation. On the orientation cover,
    Stokes’ theorem gives zero for the integral of $beta$ over its full oriented lift.
    This remains valid when the side is noncompact, since $beta$ is compactly supported;
    boundary portions in $partial P$ contribute nothing, since its support lies in the interior.
    Multiplying by the constant multiplicities and summing would give $T_0 \( beta \) = 0$.
  Let $S$ be such a nonseparating component. It is closed, connected, embedded, two-sided,
    stable weighted minimal, and lies in $"int" P$. Its image in $M$ is disjoint from every member of $cal(S)$.
    Adding this image preserves the defining property of $cal(S)$.
    In fact, after deleting any finite subfamily the ambient manifold remains connected,
    and the two sides of $S$ can still be joined while avoiding $S$:
    join them in $P \\ S$ and push the path into the interior of $P$.
    A connected two-sided hypersurface has at most two complementary components,
    so this joining path means that the new surface does not disconnect that complement.
    We have contradicted maximality, proving the lemma. ◻
]

=== 3.3 From closed to neat hypersurfaces <from-closed-to-neat-hypersurfaces>

We finish the proof of Proposition 7. A compact connected two-sided neat hypersurface has a bicollar,
  and its complement has at most two components. If it does not separate,
  the bicollar and a path joining its two sides produce a loop in the interior crossing it once.
  Suppose $F$ is such a nonseparating neat hypersurface. Its bicollar defines a smooth map

$ u : P arrow.r S^1 $

which is constant outside a compact set, goes once around the circle along the transverse collar coordinate,
  and has $F$ as a regular level. The map has nonzero degree on a loop crossing $F$ once.
  One may use a transverse profile that is constant near both ends of the bicollar,
  so extension by the same constant value outside the collar is smooth.

Every boundary component of $P$ has finite fundamental group.
  The restriction of $u$ to a collar of any such component therefore has a smooth real lift under $bb(R) arrow.r
  S^1$. Only finitely many boundary components meet the compact region where $u$ is not constant,
  by local finiteness. On their collars, multiply the difference between this lift and a chosen lift of the
  outside constant by a smooth cutoff that is zero near $partial P$ and one near the interior end.
  Exponentiating gives a compactly supported homotopy of $u$ to a smooth map $u_1$ that equals the same constant
  on a neighborhood of all of $partial P$. Its degree on the crossing loop is unchanged.

Choose a regular value of $u_1$ distinct from the constant value.
  Its inverse image is a compact cooriented hypersurface in $"int" P$, with finitely many connected components.
  Perturb the crossing loop to be transverse to it. The sum of its signed crossings with these components is the
  nonzero degree of $u_1$ on the loop. If every component separated $P$,
  every such signed crossing number would be zero. Thus a component would contradict Lemma 8.
  This proves the final assertion of Proposition 7.

== 4 Doubling and separating interfaces <sec:doubling-bubbles>

Fix a component $P$ of the cut manifold in Proposition 7.
  We will construct small separating surfaces between a base point and a distant distance slab.
  The boundary of $P$ prevents a direct use of the closed-surface estimate,
  so we first smooth the doubled weighted geometry. We then minimize weighted perimeter with a pressure that
  forces the resulting surfaces to lie in a prescribed annular region.

=== 4.1 Smoothing the double <smoothing-the-double>

Let $Z$ be the double of $P$ along $partial P$, and let $sigma$ exchange its two copies.
  If $partial P$ is empty, take two disjoint copies.

#thm([Lemma 4.1.])[
  (Weighted doubling).  #emph[There are smooth $sigma$-invariant data $\( h \, T \)$ on $Z$ such that
#[#set math.equation(numbering: n => "(4.1)")
 $ D \( h \, T \) gt.eq 1 / 2 \, wide 1 / 4 g lt.eq h lt.eq 4 g quad
   upright("on each copy of ") P . $ <eq:double-comparison>]

 The data can be left unchanged outside disjoint, locally finite collars of the boundary components.]
] <lem:double-smoothing>

#proof[
  Choose disjoint normal collars of the compact boundary components. Their widths may vary with the component.
    In one such collar, use inward distance $s gt.eq 0$ and write
  #[#set math.equation(numbering: n => "(4.2)")
   $ g = d s^2 + k \( s \) \, wide m \( s \) = log frac(d "vol"_(k \( s \)), d "vol"_(k \( 0 \))) -
     t \( s \) . $ <eq:weighted-collar-data>]
  The ratio in this formula is a ratio of densities on the boundary surface, so no orientation is needed.
    With the normal $partial_s$, the slices have mean curvature $H = 1 / 2 "tr"_(k \( s \)) k' \( s \)$, and $m' =
    H - t'$. Weighted minimality of the boundary therefore gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ m' \( 0 \) = 0 . $ <eq:even-weighted-density>]
  The useful curvature formula in these variables is
  #[#set math.equation(numbering: n => "(4.4)")
   $ D \( g \, t \) = D \( k \( s \) \, t \( s \) \) - lr(|1 / 2 k' \( s \)|)_(k \( s \))^2 - \( m' \)^2 -
     2 m'' . $ <eq:collar-curvature>]
  Here $D \( k \( s \) \, t \( s \) \)$ uses the two-dimensional slice metric. To verify the formula, use
  $ "Scal"_g = "Scal"_(k \( s \)) - lr(|1 / 2 k'|)^2 - H^2 - 2 H' \, wide Delta_g t = Delta_(k \( s \)) t + t'' +
    H t' \, $
  and combine the normal terms as $- \( H - t' \)^2 - 2 \( H' - t'' \)$.
  Reflect $k$ and $m$ evenly across $s = 0$. The reflected $k$ is continuous and locally Lipschitz,
    whereas the reflected $m$ is $C^2$ by (4.3). Convolve these data in $s$ with an even,
    nonnegative smooth mollifier of radius $delta$. An even cutoff,
    equal to one near zero and supported in a smaller collar, blends the convolution back to the original data.
    Denote the resulting smooth even data by $k_delta \, m_delta$, and set
  $ h_delta = d s^2 + k_delta \( s \) \, wide T_delta = log frac(d "vol"_(k_delta \( s \)), d "vol"_(k \( 0 \))) -
    m_delta \( s \) . $
  For small $delta$, the tensor $k_delta$ is positive definite.
  We check the curvature inequality also at points approaching the seam.
    On compact subcollars, $k_delta \, m_delta$ and their tangential derivatives through order two converge
    uniformly to the reflected data. The first two normal derivatives of $m_delta$ converge uniformly as well.
    Thus every term in (4.4), except the squared norm of $k'_delta \/ 2$,
    converges to its one-sided value at the seam. For a sequence of points approaching $\( x \, 0 \)$ as $delta
    arrow.r 0$, the convolved $k'$ averages tensors approaching $k' \( x \, 0 \)$ and $- k' \( x \, 0 \)$.
    Convexity of the squared norm, and convergence of the metrics used in that norm, give
  $ limsup_(delta arrow.r 0) lr(|1 / 2 k'_delta|)_(k_delta)^2 lt.eq lr(|1 / 2 k' \( x \, 0 \)|)_(k \( 0 \))^2 . $
  Consequently the lower limit of $D \( h_delta \, T_delta \)$ there is at least one.
    Away from the seam, the convergence is smooth. Compactness of the collar region in which changes occur now
    gives $D \( h_delta \, T_delta \) gt.eq 1 \/ 2$ for all sufficiently small $delta$.
    Uniform convergence also gives the metric comparison in (4.1).
    Choose the smoothing radius separately on each collar. The collars are locally finite,
    so these choices give global smooth data, equal to $\( g \, t \)$ elsewhere. ◻
]

Write $d$ for the intrinsic length metric of $h \|_P$. It is proper by (4.1) and properness of the original length
  metric on $P$. Fix $o in "int" P$ and put

#[#set math.equation(numbering: n => "(4.5)")
 $ r \( x \) = d \( o \, x \) wide \( x in P \) . $ <eq:radial-distance>]

Extend $r$ evenly to $Z$. The folding map $Z arrow.r P$ preserves the length of a path on either copy and does not
  increase length across the seam. This follows directly from $h = d s^2 + k \( s \)$, with $k$ even,
  by replacing $s$ with $\| s \|$ along an absolutely continuous path.
  In particular, the even extension of $r$ is proper and $1$-Lipschitz on each component of $Z$.
  We will also use the consequence

#[#set math.equation(numbering: n => "(4.6)")
 $ d \( x \, y \) lt.eq "length"_h \( gamma \) quad \( x \, y in P \) $ <eq:folding-distance>]

for every path $gamma$ in $Z$ from $x$ to $y$.

=== 4.2 Separating interfaces in a distance annulus <separating-interfaces-in-a-distance-annulus>

We use a weighted perimeter-minus-volume minimization, as in [1] Proposition 12,
  to obtain the following output for the slab argument. An open set here is understood relative to $P$ when it
  meets $partial P$.

#thm([Proposition 4.2.])[
  (Separating interfaces).  #emph[Let $ell gt.eq 100$, and suppose that ${ r > ell }$ is nonempty.
    There are finitely many disjoint smooth compact connected two-sided neat hypersurfaces $F_1 \, dots.h \,
    F_m$ in $P$ such that
#[#set math.equation(numbering: n => "(4.7)")
 $ F_i subset { ell - 91 < r < ell - 18 } \, wide "diam"_d F_i lt.eq 4 pi . $ <eq:interface-location>]

 Each $F_i$ separates $P$. Moreover, $P \\ union.big_i F_i$ is the disjoint union of two open sets $U_(+) \,
   U_(-)$, with $o in U_(+)$ and ${ r > ell } subset U_(-)$.]
] <prop:separating-interfaces>

#proof[
  First choose a smooth even function $rho$ on $Z$ such that
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| rho - r \| < 1 \, wide \| d rho \|_h lt.eq 2 . $ <eq:smooth-radial-distance>]
  For completeness, smooth a Lipschitz function in relatively compact coordinate charts in which the metric is
    sufficiently close to a constant metric. Local convolution then gives gradient norm at most $3 \/ 2$,
    with any prescribed positive value error on the compact support of a partition function.
    Let $f_j$ be these local smoothings and patch them using a countable,
    locally finite smooth partition of unity ${ phi.alt_j }$.
    Since $sum_j d phi.alt_j = 0$, the error in the gradient caused by patching is $sum_j \( f_j - r \) d
    phi.alt_j$. Taking the value errors smaller than $2^(- j - 2) \/ \( 1 + parallel d phi.alt_j parallel_oo \)$
    makes its norm less than $1 \/ 2$ and also makes the total value error less than one.
    Finally average the result with its reflection. Since reflection is an isometry, both bounds survive.
    The function $rho$ has compact sublevel sets because $r$ does.
  Choose regular values
  #[#set math.equation(numbering: n => "(4.9)")
   $ a in \( ell - 90 \, ell - 89 \) \, wide b in \( ell - 20 \, ell - 19 \) . $ <eq:pressure-levels>]
  On the band $a < rho < b$ define
  #[#set math.equation(numbering: n => "(4.10)")
   $ mu = cot (frac(pi \( rho - a \), b - a)) . $ <eq:cotangent-pressure>]
  The width $b - a > 69$ and (4.8) imply
  #[#set math.equation(numbering: n => "(4.11)")
   $ 2 \| d mu \|_h lt.eq frac(4 pi, b - a) \( 1 + mu^2 \) lt.eq 1 / 4 \( 1 + mu^2 \) . $ <eq:pressure-gradient>]
  The pressure tends to $+ oo$ at the inner end of the band and to $- oo$ at the outer end.
    These signs will keep a minimizing interface away from the constraints used to obtain it.
  ==== Existence and reflection symmetry <existence-and-reflection-symmetry>
  For sufficiently small $epsilon.alt > 0$, minimize among sets $E$ of finite perimeter satisfying,
    up to sets of measure zero,
  #[#set math.equation(numbering: n => "(4.12)")
   $ { rho < a + epsilon.alt } subset E \, wide E subset { rho lt.eq b - epsilon.alt } . $ <eq:phase-constraints>]
  Write
  $ cal(P)_T \( E \) = integral_Z e^(- T) thin d \| D chi_E \|_h \, wide cal(J) \( E \) = cal(P)_T \( E \) -
    integral_E mu_(*) e^(- T) thin d "vol"_h \, $
  where $mu_(*)$ is smooth, compactly supported, reflection invariant,
    and agrees with $mu$ on a neighborhood of ${ a + epsilon.alt lt.eq rho lt.eq b - epsilon.alt }$.
    Such an extension exists because this closed band is compactly contained in ${ a < rho < b }$.
    The perimeter is taken on all of $Z$, not relative to the band.
  Regular sublevel sets provide competitors. All admissible sets lie in a fixed compact set,
    where the smooth weight is bounded above and below by positive constants.
    A minimizing sequence therefore has uniformly bounded ordinary perimeter;
    compactness for functions of bounded variation gives an $L^1$-convergent subsequence.
    The constraints are closed under this convergence, the volume term converges,
    and weighted perimeter is lower semicontinuous; see, for example, [12]. Thus a minimizer exists.
  The lattice inequality for perimeter gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ cal(J) \( E union E' \) + cal(J) \( E ∩ E' \) lt.eq cal(J) \( E \) + cal(J) \( E' \) . $ <eq:perimeter-lattice>]
  Indeed the volume terms satisfy equality, while perimeter satisfies the indicated inequality.
    The reflected set $sigma E$ is another minimizer, and both its union and intersection with $E$ are admissible.
    Minimality and (4.13) show that both are minimizers. Replacing $E$ by $E union sigma E$,
    we may suppose that $E$ is invariant under reflection, up to a null set.
  ==== Removing the constraints near the interface <removing-the-constraints-near-the-interface>
  We show that $E$ fills a larger inner sublevel and avoids a larger outer superlevel.
    This is the step that permits unrestricted local variations of its boundary.
  Since $a$ is a regular value and its level set is compact,
    there is a fixed compact level neighborhood on which $d rho eq.not 0$.
    Choose a smooth compactly supported field $X$, with $\| X \|_h lt.eq 1$,
    that equals $nabla rho \/ \| d rho \|_h$ on a smaller such neighborhood.
    This one field can be used for all sufficiently small $epsilon.alt$. Set $A = { rho < a + 2 epsilon.alt }$.
    The field $X$ equals the outward unit normal along $partial A$,
    so the divergence theorem and the variational definition of perimeter give
  #[#set math.equation(numbering: n => "(4.14)")
   $ cal(P)_T \( E union A \) - cal(P)_T \( E \) & lt.eq cal(P)_T \( A \) - cal(P)_T \( E ∩ A \)\
 & lt.eq integral_(A \\ E) "div"_h \( e^(- T) X \) thin d "vol"_h . $ <eq:inner-barrier-comparison>]
  By (4.12), the difference set is contained, up to a null set, in ${ a + epsilon.alt lt.eq rho < a +
    2 epsilon.alt }$. On this shell, $mu_(*) e^(- T) > "div"_h \( e^(- T) X \)$ when $epsilon.alt$ is sufficiently
    small: the divergence is bounded on a fixed compact set, while the pressure tends uniformly to $+ oo$.
    Subtracting the volume terms in (4.14) shows that $E union
    A$ would strictly improve $cal(J)$ unless $A \\ E$ has measure zero. Hence
  #[#set math.equation(numbering: n => "(4.15)")
   $ { rho < a + 2 epsilon.alt } subset E quad upright("up to a null set") . $ <eq:inner-phase-clearance>]
  For the outer end apply the same comparison to the complement of $E$, whose pressure is $- mu_(*)$.
    Use $B = { rho > b - 2 epsilon.alt }$ and a field equal to $- nabla rho \/ \| d rho \|_h$ near its boundary.
    Both the field and the change of phase have compact support near that boundary;
    thus the divergence calculation also applies if $B$ itself is unbounded.
    The pressure $- mu_(*)$ tends uniformly to $+ oo$ on ${ b - 2 epsilon.alt < rho lt.eq b - epsilon.alt }$.
    It follows that
  #[#set math.equation(numbering: n => "(4.16)")
   $ E ∩ { rho > b - 2 epsilon.alt } = diameter quad upright("up to a null set") . $ <eq:outer-phase-clearance>]
  Let $S = "supp" \| D chi_E \|_h$. Equations (4.15) and (4.16) show that $S$ is a compact subset of the open band
    $a + epsilon.alt < rho < b - epsilon.alt$. Every compactly supported change of $E$ in this band is admissible.
    The minimizer therefore has the full local minimizing property for weighted perimeter with the smooth pressure
    $mu$ near every point of $S$.
  ==== Regularity, diameter, and restriction to the half <regularity-diameter-and-restriction-to-the-half>
  We use the following precise local regularity input: in a smooth three-manifold,
    a set locally minimizing perimeter with a smooth positive weight and a smooth pressure volume term has smooth
    embedded perimeter support, and its outward measure-theoretic unit normal extends smoothly to that support.
    For the weighted version, see [9] Theorem 4.3 and Remarks 4.4:
    the singular-set bound is ambient dimension minus eight, and smooth data give smooth regular parts by elliptic
    regularity. The weight can equivalently be absorbed in the smooth conformal metric $macron(h) = e^(- T) h$:
    in dimension three its surface area is the weighted $h$-area, and its pressure is $mu e^(T \/ 2)$.
    Only this local regularity theorem is used here, with the full-neighborhood minimizing property just
    established. In particular $S$ is a compact smooth two-sided hypersurface with finitely many connected
    components. On its complement the phase is locally constant:
    a characteristic function with zero distributional derivative on a connected open set is constant almost everywhere.
  Each connected component $Sigma$ of $S$ is stationary and stable for all normal variations of the weighted
    perimeter-minus-volume functional. Its outward normal satisfies
  $ H - nu T = mu . $
  From (4.1) and (4.11),
  $ D \( h \, T \) + mu^2 - 2 \| d mu \|_h gt.eq 1 / 4 + 3 / 4 mu^2 gt.eq 1 / 4 . $
  Proposition 5, with $c = 1 \/ 4$, now gives
  #[#set math.equation(numbering: n => "(4.17)")
   $ "diam"_(h \|_Sigma) Sigma lt.eq 4 pi . $ <eq:closed-interface-diameter>]
  Reflection preserves the full and empty phases and hence $S$ with its outward normal.
    At a point of $S$ on the seam, that normal is fixed by $d sigma$, so it is tangent to the seam.
    Thus $S$ meets the seam transversally. Its restriction to $P$ is consequently a finite union of disjoint
    compact two-sided neat hypersurfaces. Let $F_1 \, dots.h \, F_m$ be their connected components.
    Two points of one $F_i$ lie in one connected component $Sigma$ of $S$.
    A path in $Sigma$ of length at most $4 pi$, followed by folding, and (4.6) give $"diam"_d F_i lt.eq 4 pi$.
    Proposition 7 says that every $F_i$ separates $P$.
  The location of $S$ in $a < rho < b$, together with (4.8) and (4.9), gives (4.7).
    Restrict the full and empty phases of $Z \\ S$ to $P$ to obtain $U_(+) \, U_(-)$.
    They are disjoint relatively open sets covering $P \\ union.big_i F_i$.
    Since $rho \( o \) < 1 < a$, the base point is in the full phase.
    If $r \( x \) > ell$, then $rho \( x \) > ell - 1 > b$, so $x$ is in the empty phase.
    This proves the final assertion. ◻
]

== 5 Bounded components of distance slabs <sec:slabs>

The separating interfaces constructed in Section 4 will now give a cover of each cut component by sets of bounded
  diameter. The point is to find one interface component that every path from the base point to a given slab
  component must cross. Separate crossings of unrelated interface components would not suffice for this purpose.

#thm([Lemma 5.1.])[
  (The complementary-region tree).  #emph[Let $P$ be a connected smooth manifold, possibly with boundary.
    Let $F_1 \, dots.h \, F_m$ be disjoint compact connected two-sided neatly embedded hypersurfaces,
    each of which separates $P$. The graph with one vertex for each component of $P \\ union.big_i
    F_i$ and one edge across each $F_i$ is a finite tree. In particular,
    two connected subsets of the complement that lie in different components are separated by some single $F_i$.]
] <lem:region-tree>

#proof[
  A bicollar of $F_i$ can be chosen disjoint from all the other hypersurfaces.
    Its two sides are connected, so each side belongs to a unique complementary component.
    This defines the endpoints of its edge. The complement has finitely many components:
    insert the hypersurfaces one at a time, observing that removing a connected two-sided hypersurface from a
    connected manifold creates at most two components. The same argument applies with boundary and to a neat
    hypersurface, using its bicollar.
  The graph is connected. Indeed, points in complementary components can first be moved into the interior of $P$
    and then joined by an interior path transverse to the hypersurfaces.
    A transverse compact path has finitely many crossings and hence gives a walk in the graph.
    Every edge is a bridge: a graph path joining its endpoints without that edge could be realized by paths in
    complementary regions and bicollars, thereby joining the two sides of $F_i$ without meeting $F_i$.
    This contradicts separation by $F_i$. A connected finite graph in which every edge is a bridge is a tree.
    Any edge on the unique path between two distinct vertices gives the final assertion. ◻
]

Fix a connected component $P$ of the cut manifold of Proposition 7.
  As in Section 4, use the smoothed metric $h$ on its double, let $d$ be the intrinsic length metric of $h \|_P$,
  and fix $o in "int" P$. Write $r \( x \) = d \( o \, x \)$. The metric $d$ is proper, and Lemma 9 gives

#[#set math.equation(numbering: n => "(5.1)")
 $ "dist"_g \( q \( x \) \, q \( y \) \) lt.eq 2 d \( x \, y \) wide \( x \, y in P \) . $ <eq:projection-distance>]

Here $"dist"_g$ is distance in the original manifold $M$, not the intrinsic distance in a cut component:
  project paths in $P$ and use $g lt.eq 4 h$.

#thm([Proposition 5.2.])[
  (Slab diameter bound).  #emph[For $ell < u lt.eq ell + 2$, every connected component $C$ of
$ { x in P : ell < r \( x \) < u } $

 has $d$-diameter at most $220$.]
] <prop:slab-diameter>

#proof[
  If $ell < 100$, then $r < u < 102$ on the slab. The triangle inequality through $o$ gives $"diam"_d C lt.eq 204$.
  Suppose $ell gt.eq 100$ and the slab is nonempty. Apply Proposition 10 at level $ell$.
    It gives finitely many disjoint compact connected neat two-sided hypersurfaces $F_1 \, dots.h \, F_m$ in
  #[#set math.equation(numbering: n => "(5.2)")
   $ ell - 91 < r < ell - 18 \, $ <eq:interface-radius-window>]
  each separating $P$ and each of $d$-diameter at most $4 pi$.
    The full phase contains $o$, whereas the empty phase contains the slab;
    the phase is constant on each complementary region. Thus $o$ and $C$ lie in different complementary regions.
    In this assertion, $C$ lies in a single region because it is connected and misses every $F_i$.
  By Lemma 11, some one component $F_i$ separates $o$ from all of $C$.
    Proper length spaces are geodesic, so for each $x in C$ choose a minimizing path from $o$ to $x$.
    It meets $F_i$ at some point $z_x$. Each subpath is minimizing,
    and hence its remaining length after this crossing is
  #[#set math.equation(numbering: n => "(5.3)")
   $ d \( x \, z_x \) = r \( x \) - r \( z_x \) < \( ell + 2 \) - \( ell - 91 \) = 93 . $ <eq:slab-residual-length>]
  For $x \, y in C$, the triangle inequality and the ambient $d$-diameter bound for $F_i$ give
  $ d \( x \, y \) lt.eq d \( x \, z_x \) + d \( z_x \, z_y \) + d \( z_y \, y \) < 2 dot.op 93 + 4 pi < 220 . $
  Together with the first case this proves the proposition. ◻
]

For the graph construction we use the particular open cover

#[#set math.equation(numbering: n => "(5.4)")
 $ cal(U)_P = {upright("connected components of ") { j - 3 / 4 < r < j + 3 / 4 } : j = 0 \, 1 \, 2 \,
   dots.h} . $ <eq:slab-cover>]

These are open sets because a manifold with boundary is locally path connected.
  The intervals cover $\[ 0 \, oo \)$, and no point belongs to more than two of them.
  Components for a fixed $j$ are disjoint, so $cal(U)_P$ has multiplicity at most two.
  Each of its sets has compact closure, since $r$ is proper. By Proposition 12 and (5.1),

#[#set math.equation(numbering: n => "(5.5)")
 $ "diam"_g q \( U \) lt.eq 440 wide \( U in cal(U)_P \) . $ <eq:cover-diameter>]

The cover itself need not be locally finite. The next section makes the partition of unity,
  and therefore the target graph, locally finite without losing this diameter bound.

== 6 Graph maps and gluing across the cuts <sec:graph-gluing>

We first map each cut component to a locally finite graph using the slab cover.
  The two boundary copies of a cut surface need not have the same image.
  We will reconcile them by homotopies on small collars and a new edge path for that surface.
  Throughout this modification, each vertex will retain its original cover set as an anchor for the entire fiber.
  This is a collar version of the bounded-width gluing argument in [5] Section 3.10.1, Lemma (A).
  We keep the finite image subgraphs and the partition supports explicit to control both whole fibers and local
  finiteness of the target.

=== 6.1 A locally finite partition and its graph <a-locally-finite-partition-and-its-graph>

Fix a component $P$ of $N$, with the cover $cal(U)_P$ from (5.4).
  Choose a locally finite smooth partition of unity ${ psi_alpha }$ whose supports are compact and with each
  support contained in some assigned $U \( alpha \) in cal(U)_P$.
  Such a partition follows by taking a locally finite relatively compact refinement of the cover and then a
  subordinate partition of unity. Group functions assigned to the same set:

#[#set math.equation(numbering: n => "(6.1)")
 $ phi.alt_U = sum_(alpha : U \( alpha \) = U) psi_alpha . $ <eq:grouped-partition>]

There are only finitely many summands in each of these sums.
  Indeed, their nonempty supports all meet the compact set $overline(U)$,
  whereas the original family of supports is locally finite.
  Consequently $"supp" phi.alt_U$ is a compact subset of $U$.
  Moreover, the family ${ "supp" phi.alt_U }$ remains locally finite:
  a neighborhood meeting only finitely many of the original supports meets only finitely many grouped supports.
  Discard identically zero functions.

Give each remaining function a vertex $v$, and write $U_v$ and $phi.alt_v$ for the corresponding set and function.
  Include the edge $\[ v \, w \]$ precisely when $phi.alt_v$ and $phi.alt_w$ are simultaneously positive
  somewhere. This defines a simplicial graph $K_P$. It is locally finite,
  because the compact support of $phi.alt_v$ meets only finitely many supports of other functions.
  Since the original cover has multiplicity at most two, at most two of the functions are positive at any point.
  The formula

#[#set math.equation(numbering: n => "(6.2)")
 $ F_P \( x \) = sum_v phi.alt_v \( x \) v $ <eq:initial-graph-map>]

therefore defines a map to $K_P$, interpreted in barycentric coordinates on its vertices and edges.
  Near each point only finitely many coordinates occur, so this map is continuous for the usual polyhedral
  topology, not merely for a topology on an infinite coordinate product.

Use disjoint vertex sets for different components $P$, and put $K_0 = product.co_P K_P$.
  The maps $F_P$ give a continuous map $F_0 : N arrow.r K_0$.
  If $y$ belongs to the relative interior of a simplex of $K_0$ and $v$ is any vertex of that simplex, then

#[#set math.equation(numbering: n => "(6.3)")
 $ F_0 \( x \) = y quad arrow.r.double quad phi.alt_v \( x \) > 0 quad arrow.r.double quad
   x in U_v . $ <eq:initial-fiber-anchor>]

In particular, the whole fiber is controlled by a single set in (5.5).

=== 6.2 Collar homotopies with controlled anchors <collar-homotopies-with-controlled-anchors>

Choose disjoint closed collars $cal(C)_B$ of all boundary components $B$ of $N$,
  with the family of collars locally finite. Take them from sufficiently small tubular neighborhoods of the cut
  surfaces in $M$. Each collar is compact, and its normal $g$-length may be taken at most one.
  If $B^(+) \, B^(-)$ are the two copies of a cut surface $S$, the intrinsic diameter estimate $"diam"_g S lt.eq
  2 pi$ from Proposition 7 gives

#[#set math.equation(numbering: n => "(6.4)")
 $ "diam"_g q \( cal(C)_(B^(+)) union cal(C)_(B^(-)) \) lt.eq L \, wide L := 2 pi + 2 . $ <eq:paired-collar-diameter>]

Indeed, project any two collar points normally to $S$, join the projections in $S$, and add the two normal segments.

Write each collar as $B times \[ 0 \, 1 \]$, with $B times { 0 }$ the actual boundary and $B times
  { 1 }$ its inner end. Let

$ h_B : B arrow.r K_0 \, wide h_B \( x \) = F_0 \( x \, 1 \) . $

Its image lies in a finite connected subgraph $L_B$ of the appropriate $K_P$:
  take the smallest subcomplex containing $h_B \( B \)$. Compactness of $B$ and local finiteness of $K_P$ imply
  finiteness of this subcomplex, and connectedness of the image implies connectedness of the subcomplex.
  More importantly, its choice ensures that

#[#set math.equation(numbering: n => "(6.5)")
 $ v in L_B quad arrow.r.double quad \( B times { 1 } \) ∩ { phi.alt_v > 0 } eq.not diameter . $ <eq:homotopy-anchor>]

For a vertex in the image this is immediate. Any other vertex of $L_B$ is an endpoint of an edge whose interior
  meets the image, and both endpoint coordinates are positive at such a point.
  Thus (6.5) concerns the same cover sets $U_v$ as the original partition,
  even if the ensuing homotopy visits parts of $L_B$ outside $h_B \( B \)$.

Each $B$ is a sphere or a real projective plane by Proposition 7, so $pi_1 \( B \)$ is finite.
  Since the fundamental group of a connected graph is free and torsion free, $\( h_B \)_(*)$ is trivial.
  The map $h_B$ therefore lifts to the universal covering tree of $L_B$.
  Contracting this lift to a lift of a chosen vertex $a_B in L_B$ and projecting back gives a homotopy

#[#set math.equation(numbering: n => "(6.6)")
 $ H_B : B times \[ 0 \, 1 \] arrow.r L_B \, wide H_B \( x \, 0 \) = h_B \( x \) \, quad H_B \( x \, 1 \) =
   a_B . $ <eq:boundary-nullhomotopy>]

In particular, the homotopy stays inside a subgraph all of whose vertices satisfy (6.5).

=== 6.3 Adding edge paths and descending to the manifold <adding-edge-paths-and-descending-to-the-manifold>

For each cut surface $S$ add an edge path $A_S$ from $a_(B^(+))$ to $a_(B^(-))$,
  with interior disjoint from $K_0$ and from every other added path.
  More explicitly, introduce two distinct new vertices $c_S \, d_S$ and the three edges

$ \[ a_(B^(+)) \, c_S \] \, wide \[ c_S \, d_S \] \, wide \[ d_S \, a_(B^(-)) \] . $

All new vertices are distinct for different $S$. This produces an ordinary simplicial graph even if the two
  endpoints agree or other paths have the same endpoints. Parametrize this path by $alpha_S : \[ 0 \, 1 \] arrow.r
  A_S$, taking the first chosen endpoint at zero and the second at one; when these endpoints agree,
  the parametrization is injective on $\[ 0 \, 1 \)$ and only its endpoints are identified.
  Let $m_S = alpha_S \( 1 \/ 2 \)$.

Call the enlarged graph $K$. It is locally finite. The only point requiring verification is the number of added
  paths at an old vertex $v$. An endpoint attached there is some $a_B = v$,
  and (6.5) implies that the corresponding collar meets $"supp" phi.alt_v$.
  A compact set meets only finitely many members of a locally finite family of collars, proving the assertion.

Define $tilde(F) : N arrow.r K$ to agree with $F_0$ outside the collars.
  On the homotopy half of a collar, adjacent to its inner end and given by $1 \/ 2 lt.eq s lt.eq 1$, put

$ tilde(F) \( x \, s \) = H_B \( x \, 2 - 2 s \) . $

For the remaining halves of the paired collars of $S$, put

#[#set math.equation(numbering: n => "(6.7)")
 $ tilde(F) \( x \, s \) & = alpha_S \( 1 / 2 - s \) &  & upright("on ") cal(C)_(B^(+)) \, quad 0 lt.eq s lt.eq
   1 / 2 \,\
tilde(F) \( x \, s \) & = alpha_S \( 1 / 2 + s \) &  & upright("on ") cal(C)_(B^(-)) \, quad 0 lt.eq s lt.eq 1 /
  2 . $ <eq:arc-collar-map>]

The formulas agree at $s = 1 \/ 2$ and with $F_0$ at $s = 1$.
  Local finiteness of the collars proves continuity on all of $N$.
  Both boundary copies of $S$ are mapped constantly to $m_S$.
  Since $q : N arrow.r M$ is the quotient that identifies these copies, $tilde(F)$ descends to a continuous map

#[#set math.equation(numbering: n => "(6.8)")
 $ f : M arrow.r K \, wide f compose q = tilde(F) . $ <eq:final-graph-map>]

=== 6.4 The diameter of an entire fiber <the-diameter-of-an-entire-fiber>

Fix $y in K_0$, and let $v$ be a vertex of the unique simplex whose relative interior contains $y$.
  Every point of $f^(- 1) \( y \)$ lies at distance at most $L$ from the one set $q \( U_v \)$.
  To prove this, lift the point to $N$. If its value is unchanged from $F_0$, use (6.3).
  Otherwise it lies in some collar $cal(C)_B$. On the homotopy half, its image lies in $L_B$;
  because $L_B$ is a subcomplex and contains $y$, it contains $v$.
  On the remaining half the image can belong to $K_0$ only at the endpoint $a_B$, so again $v in L_B$.
  By (6.5), choose $z in B times { 1 }$ with $phi.alt_v \( z \) > 0$, hence $z in U_v$.
  Equation (6.4) gives the asserted distance to $q \( z \)$.

For any two points of this fiber, their anchor points therefore belong to the same set $q \( U_v \)$.
  It follows from (5.5) that

#[#set math.equation(numbering: n => "(6.9)")
 $ "diam"_g f^(- 1) \( y \) lt.eq 440 + 2 L = 440 + 2 \( 2 pi + 2 \) < 500 . $ <eq:whole-fiber-bound>]

If instead $y in K \\ K_0$, it belongs to the open part $A_S \\ K_0$ of exactly one added path.
  Its entire preimage is contained in the images of the two collars of $S$, so (6.4) gives the stronger bound $L$.
  This also covers the new vertices and the common value $m_S$. Empty fibers require no estimate.
  Thus (6.9) controls whole fibers, without any connectedness assumption.

#proof[
  For the normalized spectral inequality with $lambda = 1$,
    the preceding construction supplies the required graph and map with constant $500$.
    For general $lambda > 0$, replace $g$ by $g' = lambda g$.
    Scalar curvature and the Laplacian are multiplied by $lambda^(- 1)$,
    so the spectral inequality for $g'$ has lower bound one. Moreover $"dist"_(g') = sqrt(lambda) thin "dist"_g$.
    Applying the normalized conclusion and rescaling (6.9) gives
  $ "diam"_g f^(- 1) \( y \) lt.eq 500 lambda^(- 1 \/ 2) wide \( y in K \) \, $
  as claimed. ◻
]

#heading(level: 1)[References]
#bibitem([1])[O.~Chodosh and C.~Li, #emph[Generalized soap bubbles and the topology of manifolds with positive
  scalar curvature], Ann. of Math. (2) #strong[199] (2024), no.~2, 707--740.
  #link("https://doi.org/10.4007/annals.2024.199.2.3")[doi:10.4007/annals.2024.199.2.3].]
#bibitem([2])[H.~Federer and W.~H.~Fleming, #emph[Normal and integral currents], Ann. of Math.
  (2) #strong[72] (1960), no.~3, 458--520. #link("https://doi.org/10.2307/1970227")[doi:10.2307/1970227].]
#bibitem([3])[D.~Fischer-Colbrie and R.~Schoen, #emph[The structure of complete stable minimal surfaces in
  $3$-manifolds of non-negative scalar curvature], Comm. Pure Appl. Math. #strong[33] (1980), no.~2, 199--211.
  #link("https://doi.org/10.1002/cpa.3160330206")[doi:10.1002/cpa.3160330206].]
#bibitem([4])[D.~Gilbarg and N.~S.~Trudinger, #emph[Elliptic Partial Differential Equations of Second Order],
  Classics in Mathematics, Springer-Verlag, Berlin, 2001, reprint of the 1998 edition.
  #link("https://doi.org/10.1007/978-3-642-61798-0")[doi:10.1007/978-3-642-61798-0].]
#bibitem([5])[M.~Gromov, #emph[Four lectures on scalar curvature], in #emph[Perspectives in Scalar Curvature],
  Vol.~1, World Scientific, Hackensack, NJ, 2023, 1--514. Section and statement locators refer to
  #link("https://arxiv.org/abs/1908.10612v6")[arXiv:1908.10612v6], July 8, 2021.]
#bibitem([6])[M.~Gromov, #emph[Product inequalities for $bb(T)^times.r$-stabilized scalar curvature],
  SIGMA Symmetry Integrability Geom. Methods Appl. #strong[20] (2024), Paper No.~038, 25~pp.
  #link("https://doi.org/10.3842/SIGMA.2024.038")[doi:10.3842/SIGMA.2024.038].]
#bibitem([7])[M.~Gromov and H.~B.~Lawson, Jr., #emph[Positive scalar curvature and the Dirac operator on complete
  Riemannian manifolds], Publ. Math. Inst. Hautes Ètudes Sci. #strong[58] (1983), 83--196.
  #link("https://doi.org/10.1007/BF02953774")[doi:10.1007/BF02953774].]
#bibitem([8])[S.~Hirsch, D.~Kazaras, M.~Khuri, and Y.~Zhang,
  #emph[Spectral torical band inequalities and generalizations of the Schoen--Yau black hole existence theorem],
  Int. Math. Res. Not. IMRN (2024), no.~4, 3139--3175.
  #link("https://doi.org/10.1093/imrn/rnad129")[doi:10.1093/imrn/rnad129].]
#bibitem([9])[M.~Kemper, #emph[Gromov Hyperbolic Manifolds, Weighted Isoperimetry and Bubbles], Ph.D.
  thesis, Westfälische Wilhelms-Universität Münster, 2020.]
#bibitem([10])[Y.~Liokumovich and D.~Maximo, #emph[Waist inequality for $3$-manifolds with positive scalar
  curvature], in #emph[Perspectives in Scalar Curvature], Vol.~2, World Scientific, Hackensack, NJ, 2023,
  799--831. #link("https://doi.org/10.1142/9789811273230_0022")[doi:10.1142/9789811273230\_0022].]
#bibitem([11])[Y.~Liokumovich and Z.~Wang, #emph[On the waist and width inequality in complete $3$-manifolds with
  positive scalar curvature], Camb. J. Math. #strong[14] (2026), no.~2, 349--375.
  #link("https://arxiv.org/abs/2308.04044")[arXiv:2308.04044].]
#bibitem([12])[F.~Maggi, #emph[Sets of Finite Perimeter and Geometric Variational Problems:
  An Introduction to Geometric Measure Theory], Cambridge Studies in Advanced Mathematics, vol.~135,
  Cambridge University Press, Cambridge, 2012.]
#bibitem([13])[R.~Schoen and S.-T.~Yau, #emph[On the structure of manifolds with positive scalar curvature],
  Manuscripta Math. #strong[28] (1979), no.~1--3, 159--183.
  #link("https://doi.org/10.1007/BF01647970")[doi:10.1007/BF01647970].]
#bibitem([14])[R.~Schoen and S.-T.~Yau, #emph[The existence of a black hole due to condensation of matter], Comm.
  Math. Phys. #strong[90] (1983), no.~4, 575--579. #link("https://doi.org/10.1007/BF01216187")[doi:10.1007/BF01216187].]
#bibitem([15])[L.~Simon, #emph[Introduction to Geometric Measure Theory], Tsinghua lectures, 2014.
  #link("https://web.stanford.edu/class/math285/ts-gmt.pdf").]
