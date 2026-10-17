#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Thermal FK--Ising interfaces and massive SLE]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Critical FK–Ising interfaces converge to chordal $upright("SLE")_(16 \/ 3)$. Moving the temperature away from criticality on the scale of the mesh retains a macroscopic mass and leads to a different interface law. The term #emph[massive SLE] describes this expected deformation, but does not by itself specify a continuum process or establish that lattice approximations have a unique limit. The aim of this paper is to provide both the limit and a well-posed continuum characterization for the thermal FK–Ising model.

The off-critical interface program was formulated by Makarov and Smirnov [5] Problems A–B and Section 2.4: find the scaling limit of the relevant observable, derive a driving equation, and prove uniqueness and convergence of the interfaces. For FK–Ising, the fermionic boundary value problem makes the second step substantially different from the massive harmonic examples in that work. At criticality, the observable approach originates in Smirnov’s work [8]; isoradial observables were developed by Chelkak and Smirnov [2], and convergence of the Ising and FK–Ising interfaces was proved in [1]. Park [6] established the massive two-point fermionic observable and uniform near-critical rectangle crossings on isoradial lattices. These supply the observable and crossing inputs; identifying a unique interface law still requires the stochastic analysis carried out here. The general crossing-to-Loewner compactness theory of Kemppainen and Smirnov [3] supplies the passage from uniform conditional crossing bounds to subsequential curves and drivers.

We prove that the thermal interfaces converge along the full sequence for every bounded simply connected marked domain, both signs of the mass, varying uniformly angle-bounded isoradial lattices, and every nome sequence with the prescribed asymptotic ratio. The approximating domains need only converge in the marked Carathéodory sense; their diameters may diverge. Curves are compared after normalized transfer to the closed disc, so no regularity of physical boundary impressions is required. This settles the scaling-limit and uniqueness problem for the thermal FK–Ising interfaces in the formulation of Theorem 1.

The limiting equation is particularly concrete. For $m > 0$, in the active physical domain let $h$ be the bounded solution of

$ Delta h = - 4 m \| nabla h \| $

with value $1$ on the primal-wired bank and $0$ on the dual-wired bank. These map respectively to the negative and positive real axes in the current half-plane chart centered at the tip. Write $psi$ for the inverse conformal map and $mu = m \| psi' \|$. For positive mass the driving equation is

$ upright(d) W_t = sqrt(16 \/ 3) thin upright(d) B_t + frac(2 pi, 3) C_t upright(d) t \, #h(2em) C_t = 4 / pi integral_(bb(H)) "Im" frac(- 1, v) thin mu_t \( v \) \| nabla \( h_t compose psi_t \) \( v \) \| thin upright(d) A \( v \) . $

The variance, the absolute continuity of the drift, and its finite energy are conclusions of the proof. They are not assumed in the compactness argument. Weak uniqueness holds in the finite-energy class; it yields a definition independent of a lattice subsequence. The negative-mass law follows by duality and reversal.

There are three main technical points. First, we obtain a moving-mark energy estimate before knowing that the driver is a semimartingale. Conditional crossing bounds give restarted control of the angle seen from a bulk point. Reflection near an avoided boundary interval and a small-power contraction in the point’s Loewner clock then yield

$ bb(E) integral_0^oo (integral_(bb(H)) frac(m \| psi'_t \( v \) \|, \| v \|^2) thin upright(d) A \( v \))^2 upright(d) t < oo . $

The proof handles small initial angles and infinite clock lifetime at a finite swallowing time in capacity parametrization. Its dependence on crossing geometry rather than on an already known stochastic differential equation makes the estimate useful for identifying new interface limits.

Second, a height cutoff justifies stochastic Green-potential calculus up to swallowing. A common clock gives simultaneous densities for capacity, the variation of the driver’s finite-variation part, and spatial martingale brackets. Averaged near-tip expansions then show that the quadratic variation of the driver’s martingale part and its finite-variation measure are absolutely continuous with respect to capacity time, and identify their densities in the equation above. This avoids assuming a boundary value for the martingale bracket field at the moving tip. A stopped-Girsanov argument subsequently proves uniqueness for the measurable drift functional, including a precise treatment of its energy stopping times.

Third, kernel convergence alone does not bound the physical size of the lattice domains. We remove remote pieces by a boundary cluster exploration that leaves an ordinary bounded Dobrushin problem. Restricted length–area estimates control the normalized images of remote crosscuts. A hierarchy of mandatory gates gives a summable failure bound even when there are arbitrarily many entrances to distant regions. This localization preserves the full disc curve topology and avoids using near-critical rectangle bounds at diverging physical scales.

The proof is organized by these dependencies. Section 2 states the model and continuum prescription. Section 3 constructs the subsequential martingale fields. Sections 4 and 5 establish the energy estimate and identify the driver. Section 6 proves uniqueness and the bounded-approximation result, and Section 7 completes the arbitrary-domain and negative-mass cases.

== 2 The model and the limiting law <sec:model>

=== 2.1 Domains, weights and curves <domains-weights-and-curves>

Fix a bounded simply connected domain $Omega subset bb(C)$, an interior point $z_(*)$, distinct boundary prime ends $a \, b$, and a real mass $m eq.not 0$. Throughout, boundary statements for a simply connected domain refer to its prime-end compactification; see [7] for this standard conformal background. No local connectivity or accessibility hypothesis is imposed on its physical boundary.

For each mesh $delta$, let $Omega^delta$ be a finite simply connected polygonal domain made from rhombi of an isoradial lattice. Every primal face has circumradius $delta$; the dual vertices are the circumcentres. A primal edge and its dual form the diagonals of a rhombus. Its half-angle at a primal vertex, denoted by $theta_e$, satisfies

#[#set math.equation(numbering: n => "(2.1)")
 $ eta lt.eq theta_e lt.eq pi / 2 - eta $ <mod:angles>]

for one $eta > 0$ independent of the mesh. Boundary half-rhombi and boundary occurrences of vertices are interpreted with the usual wired edge convention, described further in Section 3. The lattices themselves may vary with $delta$.

Let $chi_delta : Omega^delta arrow.r bb(D)$ and $chi : Omega arrow.r bb(D)$ be normalized at $z_(*)$ by $chi_delta \( z_(*) \) = chi \( z_(*) \) = 0$ and positive real derivative. For all sufficiently small meshes the basepoint belongs to $Omega^delta$. The marked convergence assumed here is precisely kernel convergence from $z_(*)$, together with

#[#set math.equation(numbering: n => "(2.2)")
 $ chi_delta \( a^delta \) arrow.r chi \( a \) \, #h(2em) chi_delta \( b^delta \) arrow.r chi \( b \) . $ <mod:marks>]

In particular, there is no common diameter or area bound on the approximating domains.

For $0 < k < 1$ put

$ U_k \( t \) = integral_0^t frac(upright(d) s, sqrt(1 - k^2 sin^2 s)) \, #h(2em) K \( k \) = U_k \( pi \/ 2 \) . $

Choose any nome sequence $r_delta in \( 0 \, 1 \)$ such that $r_delta \/ delta arrow.r \| m \| \/ 2$, and define $k_delta in \( 0 \, 1 \)$ by

$ r_delta = exp {- pi frac(K \( sqrt(1 - k_delta^2) \), K \( k_delta \))} . $

Let $A_delta \( theta \) in \( 0 \, pi \/ 2 \)$ be determined by $U_(k_delta) \( A_delta \( theta \) \) = 2 K \( k_delta \) theta \/ pi$ and set

#[#set math.equation(numbering: n => "(2.3)")
 $ hat(theta)_e = cases(delim: "{", A_delta \( theta_e \) \, & m > 0 \,, pi \/ 2 - A_delta \( pi \/ 2 - theta_e \) \, & m < 0 .) $ <mod:thermal-angle>]

Wire the counterclockwise boundary arc $\( b^delta a^delta \)$ by primal-open edges and $\( a^delta b^delta \)$ by dual-open edges. For a set $E$ of interior primal-open edges, put a dual-open edge across each edge outside $E$. The smoothed cluster boundaries comprise one oriented interface $gamma_delta : a^delta arrow.r b^delta$ and $ell \( E \)$ closed medial loops. The probability of $E$ is

#[#set math.equation(numbering: n => "(2.4)")
 $ bb(P)_(delta \, m) \( E \) = 1 / Z_(delta \, m) \( sqrt(2) \)^(ell \( E \)) product_(e in E) sin hat(theta)_e / 2 product_(e in.not E) sin (pi / 4 - hat(theta)_e / 2) . $ <mod:law>]

Here $Z_(delta \, m)$ normalizes the sum over all subsets of interior primal edges. The cluster weight is $2$. The symbol $r_delta$ denotes the elliptic nome and has no relation to the cluster weight. The negative branch in Equation (2.3) is exactly the planar dual of the positive branch.

All curve laws are compared in the same space: continuous oriented curves in $overline(bb(D))$ modulo increasing reparametrization, equipped with the uniform curve metric

#[#set math.equation(numbering: n => "(2.5)")
 $ d_(upright("curv")) \( alpha \, beta \) = inf_rho sup_(0 lt.eq s lt.eq 1) \| alpha \( s \) - beta \( rho \( s \) \) \| \, $ <mod:curve-metric>]

where the infimum is over increasing homeomorphisms of $\[ 0 \, 1 \]$; curves at distance zero are identified. Equivalently, one may allow continuous nondecreasing surjections and parametrize both curves. The curve representing the discrete model is $chi_delta compose gamma_delta$. Thus a physically long piece in a vanishing disc cap has vanishing curve diameter in the topology used here.

#thm([Theorem 2.1.])[
  #emph[For every $\( Omega \, a \, b \, m \)$ as above, there is a curve law $mu_(Omega \, a \, b \, m)$ such that, for every sequence with mesh tending to zero and satisfying all the preceding domain, marked Carathéodory, angle and nome assumptions, 
$ cal(L) \( chi_delta compose gamma_delta \) med arrow.r.double med chi_(*) mu_(Omega \, a \, b \, m) $

 in the metric (2.5), along the full sequence. The physical prime-end curve law $mu_(Omega \, a \, b \, m)$ is independent of the lattices, admissible domain approximations and nome sequence.]
  #emph[For $m > 0$, $mu_(Omega \, a \, b \, m)$ is the unique law in Definition 3. For $m < 0$, it is the reversal of the positive-mass law in $\( Omega \, b \, a \)$ with mass $\| m \|$, with primal and dual boundary labels interchanged. In either case we call it thermal massive $upright("SLE")_(16 \/ 3)$.]
] <thm:main>

The remainder of the paper proves the theorem. Until the final duality argument, $m > 0$.

=== 2.2 The scalar boundary value problem <the-scalar-boundary-value-problem>

Our Laplacian is the ordinary Euclidean $Delta$. Green functions are for $- Delta$, so their logarithmic singularity has coefficient $1 \/ \( 2 pi \)$. We write $D = 2 upright(i) partial_z$. Consequently

#[#set math.equation(numbering: n => "(2.6)")
 $ upright(d) h = "Im" \( f^2 upright(d) z \) quad arrow.l.r.double quad D h = f^2 \, #h(2em) \| nabla h \| = \| f \|^2 . $ <mod:square-gradient>]

For a bounded simply connected marked domain $\( O \, c \, d \)$, use a conformal map taking $c \, d$ to $0 \, oo$. Its negative real bank is the primal-wired side, and its positive real bank is the dual-wired side. Consider

#[#set math.equation(numbering: n => "(2.7)")
 $ Delta h = - 4 m \| nabla h \| quad upright("in ") O \, #h(2em) h = 1 upright(" on the negative side") \, quad h = 0 upright(" on the positive side") . $ <mod:bvp>]

The solution class consists of bounded functions classical in the interior, with the specified prime-end limits off the two marks.

#thm([Proposition 2.2.])[
  #emph[Equation (2.7) has exactly one solution in this class. It satisfies $0 lt.eq h lt.eq 1$. On interior compact sets, $h$ and its first derivatives depend continuously on the marked domain in the Carathéodory topology, when the domains lie in a fixed bounded physical region.]
] <mod:bvp-unique>

#proof[
  Park’s two-point observable supplies a massive-holomorphic $f$ and its square integral $h$, with the asserted arc values, bounds and interior regularity; see [6] Theorem 1.1, Definition 5.2, Proposition 5.8. Equation (2.6) gives the displayed scalar equation with precisely the coefficient $4 m$. The source states uniqueness in its observable and square-integral class. We verify that the bounded scalar class used here is also unique.
  If $h_1 \, h_2$ are two bounded classical solutions and $q = h_1 - h_2$, define
  $ beta = 4 m frac(nabla h_1 + nabla h_2, \| nabla h_1 \| + \| nabla h_2 \|) \, $
  with value zero when both gradients vanish. The identity $\( \| p \| - \| p' \| \) \( \| p \| + \| p' \| \) = \( p + p' \) dot.op \( p - p' \)$ shows that
  $ Delta q + beta dot.op nabla q = 0 \, #h(2em) \| beta \| lt.eq 4 m . $
  Extend $beta$ boundedly and measurably outside $O$ and use the diffusion $upright(d) X = sqrt(2) thin upright(d) B + beta \( X \) upright(d) t$, killed on exit from $O$. Bounded-drift Girsanov constructs this diffusion and makes its law equivalent to Brownian law on every finite time interval. Its exit time is almost surely finite. Indeed, in a fixed time block a Brownian coordinate increment larger than the diameter of $O$ plus the maximal drift displacement forces exit. This event has a positive probability uniform over the starting point and the past; iteration gives a geometric bound on the number of such blocks.
  Brownian exit from a simply connected domain has a prime-end limit, and its harmonic measure gives mass zero to each specified prime end. Finite-horizon equivalence and then a countable union over horizons transfer these assertions to $X$. In particular its exit prime end is almost surely different from $c \, d$. Itô’s formula on compact interior exhaustions makes $q \( X \)$ a bounded stopped martingale. At exit its limit is zero by the prescribed boundary limits. Bounded convergence and optional stopping give $q = 0$.
  For continuity, take any converging sequence of bounded marked domains. Approximate each domain by a rhombic domain sufficiently finely that its discrete square integral and reconstructed squared fermion approximate $h$ and $D h$ on the first finitely many compact sets. The mesh can also be chosen so that this diagonal sequence converges to the limiting marked domain. Park’s convergence theorem applies to that sequence. Uniqueness just proved identifies every subsequential limit with the scalar solution in the limiting domain. Interior estimates for the massive equation give convergence of first derivatives on smaller compact sets. This proves the stated continuity and does not impose a factorization condition on the scalar solution class. ◻
]

=== 2.3 A continuum definition <a-continuum-definition>

Choose a conformal chart $phi.alt : Omega arrow.r bb(H)$ with $phi.alt \( a \) = 0$ and $phi.alt \( b \) = oo$. For a continuous real driving function $W$ with $W_0 = 0$, let

#[#set math.equation(numbering: n => "(2.8)")
 $ partial_t g_t \( z \) = frac(2, g_t \( z \) - W_t) \, #h(2em) g_0 \( z \) = z \, $ <mod:loewner>]

be the chordal Loewner maps, normalized at infinity, and let $O_t$ be the physical active domain, the inverse under $phi.alt$ of the unbounded Loewner component. Thus $g_t$ acts in the initial half-plane; $g_t compose phi.alt$ is the physical uniformization. Put

#[#set math.equation(numbering: n => "(2.9)")
 $ Z_t \( w \) & = g_t \( phi.alt \( w \) \) - W_t \, & #h(2em) psi_t \( v \) & = phi.alt^(- 1) \( g_t^(- 1) \( W_t + v \) \) \,\
mu_t \( v \) & = m \| psi'_t \( v \) \| \, & P \( v \) & = "Im" frac(- 1, v) . $ <mod:chart>]

Let $h_t$ be the solution of Equation (2.7) in $O_t$, with the two banks read in the chart $Z_t$. Define the nonnegative extended integral

#[#set math.equation(numbering: n => "(2.10)")
 $ C_t = 4 / pi integral_(bb(H)) P \( v \) mu_t \( v \) \| nabla \( h_t compose psi_t \) \( v \) \| thin upright(d) A \( v \) . $ <mod:C>]

An arbitrary fixed dummy value may be assigned when this integral is infinite or undefined; admissibility below separately requires that the actual integral be finite at almost every time.

#prodef([Definition 2.3.])[
  A positive-mass interface law in $\( Omega \, a \, b \)$ is a law of an oriented continuous curve in the prime-end compactification, from $a$ to $b$, with the following properties. In the chart $phi.alt$ it is the Loewner trace for the entire evolution (2.8), parametrized by half-plane capacity $2 t$, $0 lt.eq t < oo$, and completed continuously at $b$ in disc coordinates. Its driving function is a weak solution of
  #[#set math.equation(numbering: n => "(2.11)")
   $ upright(d) W_t = sqrt(16 / 3) thin upright(d) B_t + frac(2 pi, 3) C_t thin upright(d) t \, #h(2em) W_0 = 0 \, $ <mod:SDE>]
  where $B$ is Brownian motion in a filtration to which the driver is adapted. The actual integral in Equation (2.10) is finite almost everywhere and, for every finite $T$,
  #[#set math.equation(numbering: n => "(2.12)")
   $ integral_0^T C_t^2 thin upright(d) t < oo #h(2em) upright("almost surely") . $ <mod:finite-energy>]
  The trace requirement includes the full parametrized evolution; one cannot append curve pieces inside already swallowed hulls.
] <def:law>

This is a continuum prescription involving no lattice or selected subsequence. Existence will follow from compactness and identification, and uniqueness in law is proved in Section 6. Pathwise uniqueness is neither asserted nor used.

#prodef([Remark 2.4.])[
  The choice of $phi.alt$ is immaterial. Replacing it by $lambda phi.alt$, $lambda > 0$, replaces $t \, W_t \, v$ by $lambda^2 t \, lambda W_t \, lambda v$. Directly from Equation (2.10), the new coefficient at time $lambda^2 t$ is $C_t \/ lambda$. Brownian scaling therefore preserves Equation (2.11) and its finite-energy condition. The initial disc normalization similarly provides coordinates for the curve topology, rather than extra data for the law.
] <mod:chart-independence>

== 3 Geometry, compactness, and the martingale observable <geo:section>

Throughout this section $m > 0$, and the physical diameters of the approximating domains are bounded by a fixed number $L$. The restriction on the diameters will be removed in Section 7. Constants may depend on $m \, L$, and the common angle bound, but never on the lattice, the mesh, or an explored slit. An arm always means a path of actual sampled open edges of the indicated color. Identifications used to specify a boundary condition are not edges of an arm.

=== 3.1 The two established inputs <the-two-established-inputs>

#thm([Proposition 3.1.])[
  (Observable convergence and rectangle crossings).  #emph[Consider the weights of Section 2, with $r_delta \/ delta arrow.r m \/ 2$, on isoradial meshes whose rhombus half-angles belong to $\[ eta \, pi \/ 2 - eta \]$.]
  + #emph[For marked Carathéodory convergence to a bounded simply connected two-point domain, the reconstructed two-point FK fermion converges locally uniformly, up to its common sign, to a smooth massive-holomorphic function $f$: 
$ accent(partial f, ‾) + upright(i) m overline(f) = 0 . $

 Its square integral $h$, normalized by its two boundary values, is the unique bounded solution 
$ Delta h = - 4 m \| nabla h \| \, #h(2em) h = 1 med upright("on the wired bank") \, #h(2em) h = 0 med upright("on the dual-wired bank") . $

 The boundary values are prime-end limits away from the two marked ends, and $0 lt.eq h lt.eq 1$. The convergence includes uniform interior bounds on protected compact subsets.]
  + #emph[For every fixed rectangle aspect ratio and every finite physical scale bound, the crossing probabilities of both colors are bounded away from zero, uniformly over all boundary conditions and all nondegenerate lattice rectangles below that scale whose side lengths exceed a fixed multiple of the mesh. The scale constants are independent of the mesh.]
] <prop:inputs>

The observable convergence, its two-point characterization, and the rectangle estimates are the parts of [6] Theorems 1.1 and 1.3, Definition 5.2, Proposition 5.8 that we use. Uniqueness in the full class of bounded scalar solutions, as stated above, follows from the comparison argument of Proposition 2. The abstract angle in that paper is the angle defined here by the elliptic integral, and its nome is $r_delta$, not the cluster weight. The allowance $r_delta \/ delta arrow.r m \/ 2$, rather than an exact equality for every mesh, is part of its scaling setup. Rescaling a rectangle changes its effective mass by its physical scale; hence a fixed upper scale bound gives the uniform version of the second assertion. No convergence theorem for massive interfaces is included in Proposition 5.

For later use, we specify the probabilistic normalization of the first input. Let $nu_xi$ be the unit vector from the primal to the dual vertex of a corner $xi$. For an evaluated corner $xi$, let $"wind" \( gamma^delta : b^delta arrow.r.squiggly xi \)$ denote the total tangent turning along the interface traversed backwards from its terminal corner to $xi$. We fix the terminal phase by the corner projection convention in [6] Proposition 2.2 and Lemma 2.5. The corner fermion is

#[#set math.equation(numbering: n => "(3.1)")
 $ F^delta \( xi \) = (frac(1, 2 delta upright(i) nu_(b^delta)))^(1 \/ 2) bb(E) #h(-0.16667em) [upright(bold(1))_({ xi in gamma^delta }) thin exp #h(-0.16667em) (- upright(i) / 2 thin "wind" \( gamma^delta : b^delta arrow.r.squiggly xi \))] . $ <geo:corner-observable>]

Indeed, the tangent directions give $exp \( upright(i) "wind" \( b^delta arrow.r.squiggly xi \) \) = nu_xi \/ nu_(b^delta)$, so $F^delta \( xi \) in \( upright(i) nu_xi \)^(- 1 \/ 2) bb(R)$, as required by the projection rule. Its square primitive satisfies $H \( u \) - H \( w \) = 2 delta \| F^delta \( chevron.l u w chevron.r \) \|^2$; at the terminal corner this gives the unit boundary jump. This also agrees with the normalization in [2] Section 2.1.1, where $nu_(b^delta) = - upright(i)$, after rotation to arbitrary terminal direction.#footnote[For the primal-to-dual direction $nu$ and ordinary tangent turning used here, the factor $upright(i)$ in the terminal phase is forced by the projection lines. The printed prefactor in [6] Equation (2.1) omits this factor; we use its projection and square-integral conventions to specify the normalization.] We use one fixed choice of the terminal square root. Changing that choice multiplies the field by a common sign and has no effect on its square. Edge reconstruction is a fixed real-linear local projection of corner values. In particular, while a test edge is still in the active unexplored domain, its reconstructed value is a martingale for exploration from the initial corner. The phase is continued from the original terminal end; it is not reset at the moving tip.

The other established input is the curve theorem of [3]. We use its conditional unforced-annulus condition G2, the equivalent power condition G3, their conformal transport [3] Proposition 2.6 and Remark 2.8, and joint compactness of curves and driving functions [3] Theorem 1.5 and Corollary 1.7. In its annulus formulation the inner circle must meet the current boundary. A component is unforced when removing it does not separate the current initial mark from the terminal mark. The condition bounds the event of crossing in the union of all such components. Its consequences include a continuous driver, strict capacity growth, convergence in the curve metric, and attainment of the target only at the end. We establish the condition for the present model below, including its graph-boundary and submesh conventions.

=== 3.2 Exploration domains and a simultaneous arm comparison <exploration-domains-and-a-simultaneous-arm-comparison>

We record a graph convention used throughout the paper. Boundary edges of the wired and dual-wired banks are regarded as already open in their respective colors. A turn of the interface exposes the adjacent diagonal and extends one of those banks. Clip the revealed half-rhombus along that diagonal, and retain the component containing the continuing interface. If two boundary occurrences occupy the same physical vertex, they are first recorded as distinct incident sectors. A forced turn is traversed without a new random decision.

#thm([Lemma 3.2.])[
  (Exploration and boundary occurrences).  #emph[After any finite sequence of these revelations, the unqueried continuing problem is an isoradial Dobrushin problem with the same interior weights. Its two banks are the old banks extended by the revealed diagonals. All discrepancies between the geometric slit and this graph domain occur in a bounded number of cell layers along the slit, together with components cut off from the continuation. The conditional probabilities of the two outcomes of a genuine new pairing are uniformly bounded below.]
] <geo:domain-markov>

#proof[
  Pair the medial half-edges locally at each revealed rhombus. Pairings already fixed can be removed from the product defining the law. A closed medial loop contributes its fixed factor $sqrt(2)$; the remaining pairings give the same loop law in the continuing component. In the cluster formulation this is precisely the spatial domain Markov property with cluster weight $2$. The two boundary colors meet at the current and terminal corners.
  Clipping along an open primal diagonal leaves a primal wired edge on the retained side; clipping along a dual-open diagonal has the dual interpretation. These are the half-rhombus boundary conventions in the observable problem of Proposition 5. If a bank contacts itself, its different occurrences are read in boundary order. Components behind the contact have no continuing change point and may be removed. Thus no new interior weight or extra boundary-change point is introduced. This proves the assertion even when the physical polygon has pinches: the simply connected polygon is the one with its incident sectors kept separate. Equivalently one may draw a thin polygonal collar within the corresponding half-rhombi. A fixed number of neighboring cell layers contains the entire change.
  Finally, the ratio of the two local edge weights stays in a compact subset of $\( 0 \, oo \)$, by the angle bound and the convergence of the abstract angles to the geometric angles. Opening an edge changes the number of FK clusters by either zero or one. The two conditional odds therefore differ from the weight ratio by at most the fixed cluster factor $2$. Both outcomes have a common positive lower bound. ◻
]

#thm([Lemma 3.3.])[
  (Comparison for a union of free-bank regions).  #emph[Let $A = A \( z \; r \, R \)$ be a physical annulus with $R lt.eq L_1$, where $L_1$ is fixed. Inside $A$, let $cal(V)$ be a union of regions whose accessible noncircular banks all have one color, and let $c$ be the other color. Circular ends may carry arbitrary induced boundary identifications. After buffering the two ends by a fixed number of cell layers, the probability of an actual $c$-arm crossing $A$ in any of the regions is at most 
#[#set math.equation(numbering: n => "(3.2)")
 $ K (frac(r or delta, R))^alpha . $ <geo:arm-bound>]

 The constants are independent of the number of regions and remain valid after arbitrary conditioning outside buffered shells. For specified disjoint buffered annuli the corresponding upper bounds can be multiplied.]
] <geo:arm>

#proof[
  We first describe the comparison, since simply summing over components would not prove the assertion. Work in the graph of color $c$, keeping boundary-sector copies until the comparison is made. Let $H$ be the union of all its portions in the regions under consideration. An actual $c$-path cannot exit $H$ through a noncircular bank: that bank is wired in the other color. Consequently every exterior connection that can influence $H$ enters through its radial-end vertices. Conditioning on all edges off the shell may impose any partition of these vertices. Dominate it by the single partition wiring all radial ends together, including the inner and outer ends.
  Identify copies that project to the same ambient lattice vertex. For $q = 2$ this is an increase in boundary identification, hence it increases open-edge connectivity. Embed the resulting graph into the ambient lattice annulus. Edges missing because of a bank or a deleted sector may be viewed as conditioned $c$-closed. Release those conditions and add the remaining ambient vertices and edges. Random-cluster monotonicity couples these operations so that every open edge of $H$ remains open in the larger graph. Each counted arm projects to an actual arm of the ambient graph. The construction couples the entire union at once and therefore pays no multiplicity factor.
  This also explains why winding around the annulus causes no additional problem. A winding region changes the partition induced at the radial ends, but that partition was already dominated by the maximal one. An artificial wire is used only in the measure and is not counted as an edge in the arm event. Thus an opposite-color circuit in the interior of a buffered subannulus blocks every counted arm, even if the boundary condition artificially connects the two radial ends.
  In a subannulus of fixed ratio, cover a circuit by a fixed number of overlapping rectangles. Proposition 5 bounds below the conditional probability of each opposite-color crossing under the worst boundary condition. FKG glues those crossings into a circuit, giving a probability at least $c_(*) > 0$, uniformly under conditioning off that subannulus. Use a family of disjoint buffered subannuli of fixed ratio between scales $K_0 \( r or delta \)$ and $R \/ K_0$. Exposing them successively gives an upper bound $\( 1 - c_(*) \)^N$, with $N gt.eq c log \( R \/ \( r or delta \) \) - C$. This is (3.2). The same exposure argument proves the product claim for disjoint annuli. Restriction to a rectangle inside any shell induces a boundary partition that is dominated by its fully wired partition, so arbitrary off-shell conditioning is harmless. ◻
]

#prodef([Remark 3.4.])[
  The noncircular-bank hypothesis is a statement about the accessible side of the bank. A vertex identified with another occurrence on the far side of a slit does not supply an accessible wire of color $c$. One first works in incident sectors and then makes the monotone identification in the proof. Likewise an incident determined diagonal of color $c$ would expose its own color on an accessible bank; it cannot be silently placed on a bank declared to have the other color. Buffering by more than the diameter of the local cell templates removes the only ambiguity at the circular ends.
] <geo:actual-arm>

#thm([Proposition 3.5.])[
  (Conditional unforced crossings).  #emph[The regularly drawn medial interfaces in domains of diameter at most $L$ satisfy condition G2 of [3], uniformly over the allowed meshes, domains, and thermal parameters.]
] <geo:g2>

#proof[
  At a stopping time, complete the currently exposed tile if the drawing has been stopped in its interior. This reveals only a bounded number of local turns. Use the graph domain of Lemma 6. Consider an annulus whose inner circle meets its boundary, and a component of its intersection with the domain that does not separate the two current marks.
  Such a component cannot have accessible banks of both colors. Indeed, an interior path joining the two banks, together with short terminal pieces in their incident sectors, would be a crosscut joining the two Dobrushin arcs. The two change points alternate with the ends of that crosscut on the prime-end circle, so it separates them. Removing the whole annular component would then also separate them, a contradiction. An interface crossing in a component with one bank color has an actual arm of the other color beside its strand. The neighboring diagonals join in boundary order along the strand; trimming a fixed number of cells at each circular end removes any terminal ambiguity. Components with no accessible bank can be assigned either color, since the strand has both adjacent cluster arms.
  Apply Lemma 7 separately to the two possible missing colors. For radii larger than a fixed multiple of the mesh this gives $K \( r \/ R \)^alpha$ for the probability of any unforced crossing, with no dependence on the number of components. For $R$ exceeding a fixed multiple of $L$ a crossing is impossible; thus all rectangle scales used by the comparison are uniformly bounded.
  It remains to give the drawing convention at submesh scales. In each rhombus use simple polygonal tracks through its side midpoints for its two possible pairings. Choose the tracks and the boundary half-cell tracks with a clearance $c_eta delta$ between nonincident pieces. The initial and terminal tracks leave their boundary corners transversely. Compactness of the angle interval gives uniform nondegeneracy of these finitely many types of local templates, including their lengths, turning angles, and transverse clearances. This is a perturbation inside a bounded number of cells.
  If $r lt.double delta$, an inner circle meeting the current boundary can be visited by the future track only within $O \( r \)$, measured along the incident template, of the current or terminal mark. Away from consecutive pieces this follows from clearance. Along consecutive pieces it follows from their uniformly nondegenerate angles. In that local picture both incident banks occur. A subannulus with inner radius larger than a fixed multiple of $r$, outer radius smaller than $c_eta delta$, and still inside the original annulus separates the mark from the distant continuation. Its component is therefore forced. Consequently, if $R \/ delta$ is bounded and $R \/ r$ is sufficiently large, there is no unforced crossing at all. If $R \/ delta$ is larger than a prescribed large constant, use instead Lemma 7 between scale $K delta$ and $R \/ K$. Choosing that constant first makes its upper bound smaller than the constant required in G2. These two cases cover all submesh inner radii. The argument is conditional on the entire revealed past, as required. ◻
]

=== 3.3 Conformal control of cell changes <conformal-control-of-cell-changes>

The following elementary use of conformal geometry will always concern connected #emph[interior] sets and their specified endpoint occurrences. The distinction matters in a slit domain: the two prime-end copies of one physical slit point are not a connected set in the prime-end compactification.

#thm([Lemma 3.6.])[
  (Small connected sets in normalized coordinates).  #emph[Let $V_n$ be simply connected planar domains containing $z_0$, and let $chi_n : V_n arrow.r bb(D)$ satisfy $chi_n \( z_0 \) = 0$ and the same angular normalization. Suppose 
$ 0 < c_0 lt.eq "crad"_(V_n) \( z_0 \) lt.eq C_0 < oo . $

 If $E_n subset V_n$ is connected and $"diam" E_n arrow.r 0$, then $"diam" chi_n \( E_n \) arrow.r 0$. The same conclusion holds after adjoining accessible prime-end endpoints approached along $E_n$. In particular, bounded-cell changes of a mesh tending to zero have vanishing diameter in the normalized disc, provided their incident sectors are respected.]
] <geo:crosscut>

#proof[
  We give a length–area proof; in fact only the lower conformal-radius bound is needed. First let $V$ be a finite polygon, put $c = c_0$, and let $E subset V$ be connected with diameter $d < c \/ 64$. Koebe’s theorem gives $B \( z_0 \, c \/ 4 \) subset V$. If $E$ meets $B \( z_0 \, c \/ 8 \)$, Cauchy’s estimate for the bounded analytic function $chi$, on a slightly larger interior disc, gives $"diam" chi \( E \) lt.eq 16 d \/ c$.
  Otherwise choose $x in E$, put $r = 2 d$ and $R = c \/ 16$. Then $E subset B \( x \, r \)$, whereas $z_0 in.not B \( x \, R \)$. For a regular radius $s in \( r \, R \)$, let
  $ L \( s \) = integral_(V ∩ partial B \( x \, s \)) \| chi' \( z \) \| thin \| upright(d) z \| $
  be the #emph[total] image length of all circular components. Cauchy–Schwarz and polar integration give
  $ integral_r^R L \( s \)^2 frac(upright(d) s, s) lt.eq 2 pi integral_(V ∩ { r < \| z - x \| < R }) \| chi' \( z \) \|^2 thin upright(d) A \( z \) lt.eq 2 pi^2 . $
  There is therefore a regular $s$ for which
  $ L \( s \) lt.eq ell := (frac(2 pi^2, log \( R \/ r \)))^(1 \/ 2) . $
  The source circle is either wholly inside $V$, or cuts it into finitely many disjoint crosscuts. Their images have total length at most $ell$. When $ell < 1 \/ 4$, each image crosscut lies within distance $ell$ of one of its circle endpoints. The shorter boundary-circle arc joining its endpoints lies in that same ball. The enclosed Jordan region has diameter at most $2 ell$ and does not contain $0$; it is exactly the noncentral shadow of that crosscut. A full image circle of length $ell$ has bounded interior of diameter at most $ell \/ 2$.
  The connected set $chi \( E \)$ lies in a component separated from $0$ by this finite collection of image crosscuts. Such a component is contained in the noncentral shadow of one crosscut: adding disjoint crosscuts one at a time gives a tree of components, and the first edge on the route from the central component identifies a separating shadow. Thus $"diam" chi \( E \) lt.eq 2 ell$. This proves a modulus of order $\( log \( c \/ \( 32 d \) \) \)^(- 1 \/ 2)$, independent of physical area, diameter, or the number of boundary pieces.
  For a general simply connected $V$, first connect any two points of $E$ by a compact path in an arbitrarily small open neighborhood of $E$ contained in $V$. Such a neighborhood can be chosen connected, as a union of small discs centered on the connected set $E$. Its physical diameter is at most $d + o \( 1 \)$. Exhaust $V$ by finite Jordan polygons containing this path and an interior reference disc. Their conformal radii eventually exceed $c \/ 2$, and their normalized maps converge on compact sets. The polygon estimate passes to the two chosen points. Taking their supremum proves the assertion for $E$.
  Accessible endpoints are handled by truncating their actual approaching arcs and then taking prime-end limits. For a boundary-following connected lift in one of the finite polygon domains used here, write $f = chi^(- 1)$ and approximate its parameter image $C subset overline(bb(D))$ by $t C$, $t arrow.t 1$. The continuous physical boundary extension of $f$ makes $f \( t C \)$ an interior approximation with the same limiting physical diameter. This extension need not be injective at a slit, which is why the lift, not an unlabelled physical boundary set, was specified. A retained cell sector and a fixed number of neighboring sectors have physical diameter $O \( delta \)$; the last assertion follows. ◻
]

#thm([Proposition 3.7.])[
  (Joint compactness).  #emph[Under the common diameter bound, the laws of the interfaces transferred by their normalized maps to the closed disc are tight in the oriented curve metric. Every subsequential limit is a chordal Loewner trace with a continuous driving function and strict capacity growth. It reaches the target only at the end and is continuously completed in disc coordinates. Along a further coupling, the curves and their half-plane drivers converge jointly, with uniform convergence of the drivers and capacity-parametrized curves on every finite capacity interval.]
] <geo:compactness>

#proof[
  Apply [3] Theorem 1.5 and Corollary 1.7 to Proposition 9. Their modified simple medial drawing agrees with the separated drawing used above. The changes of drawing have vanishing disc diameter by Lemma 10, and so do not change the limiting curve law.
  The disc maps used in that theorem fix the two endpoints, whereas our normalization fixes an interior point and angle. Marked Carathéodory convergence makes the intervening disc automorphisms converge to a nondegenerate automorphism. Thus the two normalizations give the same tightness and convergence statements. Choose the half-plane maps $phi.alt_delta$ taking the marks to $0 \, oo$ so that $phi.alt_delta arrow.r phi.alt$ on compact subsets; the remaining positive dilation is fixed by the interior normalization. The joint half-plane conclusion then has precisely the capacity convention $partial_t g_t = 2 \/ \( g_t - W_t \)$ used here. ◻
]

#thm([Lemma 3.8.])[
  (Active graph domains and moving prime ends).  #emph[In a coupling as in Proposition 11, let $t_n arrow.r t < oo$. The active graph domains at the corresponding exploration times converge in the marked Carathéodory sense to $O_t$, locally from any protected point in $O_t$. Their moving corner converges to the prime end represented by $W_t$. The assertion includes contacts of the limiting trace with itself or with an original bank.]
] <geo:active>

#proof[
  Work first in the normalized initial disc. The kernel of the geometric slit domains on the nonswallowed side is identified by joint Loewner convergence. To compare a graph domain with its geometric slit, take a compact interior path and a compact neighborhood of it in $O_t$. They have positive distance from the limiting past. For all large $n$, neither the discrete past nor its cell collar meets this neighborhood. Join the path to a fixed interior point near the terminal mark. A sufficiently small terminal neighborhood is untouched by the past through the given finite time, because the target is reached only at the end. The remaining connection to the terminal boundary occurrence can therefore be made in that unchanged neighborhood. The compact path belongs to the active graph component.
  This proves that every protected compact subset of $O_t$ is retained. Conversely, no kernel from such a basepoint can cross the limiting slit. A component joined only by a neck collapsing to that slit is not part of its kernel. Thus removal of discarded components and the cell collar changes do not alter the active kernel.
  Kernel convergence alone does not identify the moving prime end. Choose times $s > t$, arbitrarily close to $t$, for which $gamma \( s \)$ is interior to $O_t$. Such times exist: a whole interval of trace confined to the old boundary and hull would add no hull and hence no capacity, contrary to strict capacity growth. For fixed $s$, a compact corridor from $gamma \( s \)$ to an untouched target neighborhood is retained in the graph domain by the preceding paragraph. The corresponding discrete continuation from its moving corner to a point converging to $gamma \( s \)$ is an actual connected chain in that domain, up to its incident boundary sectors. Include all forced steps before the next decision; they remain in the same chain.
  By uniform curve convergence, the diameter of this chain in the initial disc can be made arbitrarily small by first taking $s - t$ small and then taking $n$ large. Normalize the current domains at a fixed protected bulk point. Their conformal radii there are uniformly nondegenerate. Lemma 10 therefore makes the current-chart diameter of the chain small. Its interior endpoint converges by kernel convergence, whereas its other end is the current corner occurrence. As $s arrow.b t$, the image of the interior endpoint tends to $W_t$, by the trace property. The moving corner consequently tends to the same prime end. There is no use of marked convergence in applying Lemma 10; it is a uniform statement for connected interior sets. In particular, near a self-contact the actual continuation chain selects the correct incident sector.
  Finally, returning to physical coordinates uses the compact convergence of the initial uniformizations. The proof can be localized at any protected bulk basepoint in $O_t$, so it does not require the original basepoint to remain unswallowed. ◻
]

#thm([Corollary 3.9.])[
  (Conditional geometric estimates in the limit).  #emph[Every limit of Proposition 11 inherits the conditional crossing estimates needed below in its natural driving filtration. They hold after a live stopping time and after localization on a finite interval on which the relevant Loewner coordinates remain nondegenerate. In the following two estimates, reset capacity time to zero at the chosen live stopping time.]
  + #emph[In the current half-plane chart, put the tip at $0$, rescale a given live point to modulus $1$, and write $x$ for its real part. If its imaginary part is small, so $x$ is near $1$ or $- 1$, then 
$ bb(P) { upright("the future trace visits ") B \( x \, d \) divides upright("past") } lt.eq K d^alpha $

 for all sufficiently small $d$.]
  + #emph[For a live physical point $w$, 
$ bb(P) {inf_(s upright(" before swallowing")) "crad"_(O_s) \( w \) < epsilon thin "crad"_(O_0) \( w \) thin mid(bar.v) thin upright("past at the restart")} lt.eq K epsilon^alpha . $

]
  #emph[The assertions apply in particular at inverse elapsed-clock times and at first angular-level crossings used in Section 4. No semimartingale property of the driver is assumed here.]
] <geo:restart>

#proof[
  At a discrete restart, the future graph problem is Dobrushin by Lemma 6. Proposition 9, conformal transport, and the equivalence of G2 and G3 give the same conditional power constants in its current chart. For the first event, use a half-annulus centered at $x$, of inner radius $d$ and a fixed small outer radius avoiding $0$. It is unforced for the marks $0 \, oo$, and its inner circle meets the real boundary. Entry into the ball requires its crossing. A ball later swallowed without being visited does not create an entry event.
  For the second event, write $r_0 = "crad"_(O_0) \( w \)$. Koebe’s theorem puts the old boundary at distance at least $r_0 \/ 4$. A decrease of the active conformal radius below $epsilon r_0$ therefore requires the new trace to approach $w$ within $O \( epsilon r_0 \)$. The annulus from that scale to $r_0 \/ 8$ lies in the old domain. The interface has an actual cluster arm across it. The blocking-circuit proof of Lemma 7, now in a bulk annulus, gives the bound. Only physical radii bounded by the original diameter are used. The infimum stops at swallowing; assigning radius zero after swallowing would give a different and false assertion.
  We explain the limiting conditional statement. First stop before a protected point has small chart height, before chart coordinates or the driver leave fixed bounds, and before a fixed capacity horizon. Joint convergence and Lemma 12 make the current charts converge on all compact sets used in the estimate. Apply the discrete conditional inequality, multiplied by any bounded nonnegative continuous function of the stopped driver history. Pass to the limit with slightly enlarged balls and relaxed thresholds; then decrease those enlargements. A monotone-class argument gives the conditional inequality for the limiting history.
  On such a protected interval, a clock with rate $\| g_t \( phi.alt \( w \) \) - W_t \|^(- 2)$ is continuous and strictly increasing. Its inverse stopping times are obtained by convergence of these clocks. First-crossing times of angular levels can either be taken at generic levels or approximated on clock-time grids. Continuity, followed by exhaustion of the protected intervals, gives all stopping times used here. This procedure concerns only the driver filtration. It does not presume that conformally mapping a nonsimple future trace through an old swallowed pocket is a valid operation. ◻
]

=== 3.4 The signed martingale field <the-signed-martingale-field>

#thm([Proposition 3.10.])[
  (Continuum fermion martingales).  #emph[Every subsequential curve law of Proposition 11 has a joint realization with a complex field $M_t \( w \)$, $w in O_t$, such that 
$ M_t \( w \)^2 = D h_t \( w \) \, #h(2em) accent(partial M, ‾)_t + upright(i) m overline(M_t) = 0 . $

 The field is continuous locally in space and time before swallowing, and is smooth in its spatial variable. On every protected compact subset of the live domain, after localization, $M_t \( w \)$ is a continuous martingale in the joint natural filtration of the curve and field. In particular it is a continuous local martingale at each fixed point before its swallowing time.]
] <geo:martingale>

#proof[
  First consider deterministic sequences of active graph domains along a joint curve–driver convergence as above. Lemma 12 and Proposition 5 identify the locally uniform limit of the squares of their fermions as $D h_t$. The same reasoning for every sequence of times $t_n arrow.r t$ gives convergence locally along the evolution.
  We also need continuity of the limiting square under this domain variation. It follows directly from the deterministic observable theorem: approximate each marked continuum domain by an admissible lattice domain and choose the meshes diagonally. Interior compactness and uniqueness of the bounded two-point solution identify every subsequential limit. Equivalently, bounded solutions of the displayed elliptic equation are compact on interior discs and their prime-end boundary values are controlled by the same two-point boundary estimates. Thus the limiting square is continuous in the marked kernel topology, locally on protected compacts. The assertion applies uniformly along a compact family of convergent curve–driver paths: otherwise a contradicting sequence of times and paths would give a deterministic violating sequence of domains.
  It remains to lift convergence of squares to signed martingales. We give the argument rather than presuming a continuous choice of sign. Work at finitely many test edges near fixed protected bulk points, stopped before they lose a larger protection buffer, and before the observables exceed the deterministic interior bound. At a genuine exploration decision there are two possible next pairings. Each next domain and its observable are determined by the revealed past and the hypothetical pairing. The two conditional probabilities are at least $p_0 > 0$, by Lemma 6.
  Fix a tolerance $epsilon > 0$. Stop immediately before the first decision at which either hypothetical next square changes by more than $epsilon$, or either hypothetical next domain loses the smaller protection buffer, while the prevalue remains in the larger one. This is a predictable decision index: no future continuation is used to test the two hypothetical domains. Select one bad alternative measurably if there are two. Conditional on reaching this index, the probability of selecting a bad alternative is at least $p_0$. Consequently
  #[#set math.equation(numbering: n => "(3.3)")
   $ p_0 bb(P) { upright("a bad-alternative stop occurs") } lt.eq bb(P) { upright("an observed bad step occurs") } . $ <geo:bad-alternative>]
  The right side tends to zero by the preceding square convergence, the protected-domain convergence, and the fact that individual cell steps have vanishing capacity increment on a protected finite capacity interval. There is no sum over the number of decisions.
  Suppose now that the current value is $f$, with $\| f \| gt.eq a > 0$, and both next squares are within $epsilon$ of $f^2$. For $epsilon lt.double a^2$, each next value lies within $K epsilon \/ a$ of either $f$ or $- f$. If one alternative were near $- f$, the real projection of the conditional average onto the direction $f$ would be at most
  $ \| f \| - 2 p_0 \| f \| + K epsilon \/ a . $
  For $epsilon lt.double p_0 a^2$, this contradicts the martingale identity. Thus neither alternative changes sheets where the square is bounded away from zero.
  This statement gives tightness through zeros as well. On a short time interval, uniform continuity of the limiting square implies one of two possibilities. Either all its amplitudes are small, in which case every square root is small, or its values stay in a small disc not containing zero, in which case the signed field stays on one continuous root branch and has a small oscillation. Rapidly moving zeros cannot produce a fixed-size oscillation: such an oscillation would require either a nonzero sheet switch or a visible oscillation of the square. Deterministic forced steps add no martingale decision and are handled by the same square convergence. Combining this argument with (3.3) proves continuity tightness at each protected test point.
  Take countably many test points and rational protected neighborhoods, together with a countable collection of stopping levels. Extract jointly with the curve and driver. Spatial compactness of the fermions up to one common sign, furnished by Proposition 5, identifies the limits on overlapping neighborhoods and gives the whole field. The spatial equation passes to the limit. Its interior elliptic estimates give all spatial derivatives on smaller compact sets. In particular the field is locally continuous in space and time, with the asserted square.
  Finally, before any tighter protected stop, the discrete fields are bounded martingales: their conditional-expectation interpretation is valid at every still active test edge and their terminal phase is unchanged. Multiply each martingale identity by a bounded continuous function of finitely many earlier curve–field evaluations and pass to the joint limit. The uniform bound gives uniform integrability. A monotone-class argument gives the conditional expectation identity in the joint natural filtration. Stopping at generic levels of continuous protection quantities, or first using a tighter buffer and then exhausting, removes any discontinuity of the stopping operation. This proves precisely the stated local martingale assertion on the live domain. It gives no assertion about a zero extension through swallowing, and none will be used. ◻
]

#prodef([Remark 3.11.])[
  (Measurability and the use of the filtration).  The scalar field $h_t$ and its square derivative are functions of the current marked domain. Their interior data are kernel-continuous, and integrals of nonnegative functions of them are measurable by compact exhaustion. A signed lift need not be selected as a continuous deterministic function of every possible curve; the joint-limit construction in Proposition 14 is enough for stochastic calculus. The geometric estimates in Corollary 13 are needed only in the natural driver filtration. Their unconditional integrability consequences remain valid on adjoining the signed field, without an assertion that arbitrary filtration enlargements preserve conditional crossing estimates.
] <geo:filtration>

== 4 A finite-energy estimate at the moving marked point <eng:section>

In this section the approximating domains have a common physical diameter bound. We work with any of their subsequential interface laws supplied by Proposition 11. Constants may depend on this bound, the fixed mass, the common rhombic angle bound, and the resulting crossing constants. They do not depend on a test point, a stopping time, or the particular subsequential law. The natural filtration of the continuous driver, with its usual augmentation, is denoted by $\( cal(F)_t \)$.

Only geometric crossing estimates and deterministic Loewner identities are used below. In particular, we do not yet assume that the driver is a semimartingale. The distinction is consequential: the estimate proved here will justify the stochastic reconstruction of the driver in the next section.

Recall the initial chart $phi.alt : Omega arrow.r bb(H)$, the half-plane Loewner maps $g_t$, and the translated inverse chart

$ psi_t \( v \) = phi.alt^(- 1) #scale(x: 120%, y: 120%)[\(] g_t^(- 1) \( W_t + v \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) mu_t \( v \) = m \| psi'_t \( v \) \| . $

All integrals in this section are nonnegative integrals and are allowed initially to take the value $+ oo$.

#thm([Proposition 4.1.])[
  (Moving-mark energy).  #emph[For 
#[#set math.equation(numbering: n => "(4.1)")
 $ J_t = integral_(bb(H)) frac(mu_t \( v \), \| v \|^2) thin upright(d) A \( v \) \, $ <eng:J-definition>]

 there is a constant $K < oo$ such that 
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E) integral_0^oo J_t^2 thin upright(d) t lt.eq K m^2 "area" \( Omega \) < oo . $ <eng:energy-bound>]

 Consequently $J_t$ is finite for almost every capacity time, almost surely.]
] <eng:energy>

We prove the proposition by following one physical point in a clock adapted to its distance from the driver. Keeping a small positive power of its angular coordinate is necessary when summing over physical area.

=== 4.1 The point clock and the two geometric inputs <the-point-clock-and-the-two-geometric-inputs>

Fix $w in Omega$. Its lifetime $T_w$ is the supremum of the capacity times for which $w$ belongs to the active domain $O_t$. Before that lifetime put

#[#set math.equation(numbering: n => "(4.3)")
 $ Z_t = g_t \( phi.alt \( w \) \) - W_t \, #h(2em) r_t = \| Z_t \| \, #h(2em) Y_t = "Im" Z_t \, #h(2em) X_t = Y_t / r_t in \( 0 \, 1 \] . $ <eng:point-variables>]

The letter $r_t$ in this section denotes a radial coordinate and is unrelated to the elliptic nome $r_delta$. Define

$ sigma \( t \) = integral_0^t frac(upright(d) u, r_u^2) \, #h(2em) 0 lt.eq t < T_w \, #h(2em) sigma_(*) = lim_(t arrow.t T_w) sigma \( t \) \, $

where $T_w = oo$ is permitted. Let $t \( s \)$ be the inverse clock on $0 lt.eq s < sigma_(*)$. A subscript $s$ on $X$, $Y$, or $r$ will mean evaluation at $t \( s \)$ whenever we explicitly work in this clock. Set $X_s = 0$ for $s gt.eq sigma_(*)$. This killing convention applies also if $T_w = oo$ but the total clock $sigma_(*)$ is finite. Ratios involving $r_s$ below are used only for $s < sigma_(*)$, and their entire integrands are set to zero afterward.

#thm([Lemma 4.2.])[
  (Deterministic clock identities).  #emph[Before the point’s lifetime, 
#[#set math.equation(numbering: n => "(4.4)")
 $ Y_s = Y_0 e^(- 2 s) \, #h(2em) upright(d) log "crad"_(O_(t \( s \))) \( w \) = - 4 X_s^2 thin upright(d) s \, #h(2em) upright(d) t = r_s^2 thin upright(d) s . $ <eng:clock-identities>]

 The same identities hold after any live stopping time, with elapsed capacity and clock times and the corresponding starting values.]
] <eng:clock>

#proof[
  The imaginary part of the Loewner equation gives $partial_t Y_t = - 2 Y_t \/ r_t^2$. This differentiates $g_t \( phi.alt \( w \) \)$, not $W_t$: the driver is real, so its subtraction does not affect the imaginary part. If $H_t = g_t compose phi.alt$, then
  $ "crad"_(O_t) \( w \) = frac(2 Y_t, \| H'_t \( w \) \|) \, #h(2em) partial_t log \| H'_t \( w \) \| = - 2 "Re" 1 / Z_t^2 . $
  It follows that
  $ partial_t log "crad"_(O_t) \( w \) = - 2 / r_t^2 + 2 "Re" 1 / Z_t^2 = - frac(4 Y_t^2, r_t^4) . $
  The clock has a strictly positive continuous rate on every compact live interval. Changing variables proves all the assertions. ◻
]

We spell out the precise restarted estimates inherited from the discrete crossing bounds. The first is a boundary estimate in a current conformal chart; the second is a bulk estimate in physical coordinates. The latter uses the FK rectangle bounds as well as the conditional geometry. It is not an application of the boundary form of G3 to an annulus wholly inside the domain.

#thm([Lemma 4.3.])[
  (Restarted geometric estimates).  #emph[There are $a > 0$, $K < oo$, and $d_(*) > 0$ with the following properties. They hold conditionally on the past at every stopping time $tau$ on the event $w in O_tau$.]
  + #emph[Translate and dilate the current half-plane chart so that its tip is $0$, its target is $oo$, and $\| Z_tau \| = 1$. If $X_tau lt.eq d_(*)$ and $x = "Re" \( Z_tau \/ \| Z_tau \| \)$, then, for $0 < d < d_(*)$, the probability that the restarted trace visits $B \( x \, d \)$ is at most $K d^a$.]
  + #emph[With $R = "crad"_(O_tau) \( w \)$ and $0 < epsilon < 1$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ bb(P) {inf_(tau lt.eq t < T_w) "crad"_(O_t) \( w \) < epsilon R thin mid(bar.v) thin cal(F)_tau} lt.eq K epsilon^a . $ <eng:bulk-crad>]

 The infimum in this formula is strictly before the lifetime. Conformal radius is not assigned the value zero upon swallowing.]
  #emph[These estimates remain valid for the inverse-clock stopping times and the first angular-level stopping times used below.]
] <eng:restarts>

#proof[
  For the first assertion, decrease $d_(*)$ so that $\| x \|$ stays, for example, between $3 \/ 4$ and $1$. A half-annulus centered at $x$, with a fixed outer radius less than $1 \/ 4$ and inner radius $d$, misses the tip $0$ and the target $oo$ and is unforced. A visit to its inner ball entails an unforced crossing. Conditional G3 and its uniform conformal transport therefore give the asserted bound. A subsequent swallowing of the ball without visiting it is not a crossing and causes no difficulty for this statement.
  For the second assertion, Koebe’s conformal-radius comparison gives
  $ "dist" \( w \, partial O_tau \) gt.eq R \/ 4 . $
  If $w$ is still alive and its conformal radius drops below $epsilon R$, its distance to the current boundary is less than $epsilon R$. For sufficiently small $epsilon$, this new nearby boundary cannot be a piece of the old boundary, which is at distance at least $R \/ 4$. The future interface must therefore approach within $epsilon R$ of $w$. Such an approach supplies an actual FK arm through the annulus with inner radius comparable to $epsilon R$ and outer radius, say, $R \/ 8$. This annulus is initially in the protected bulk. In each of a sequence of disjoint buffered shells, rectangle crossings and FK positive association give a blocking circuit with a probability bounded below, uniformly under every conditioning outside that shell. Their product gives $K epsilon^a$. The physical outer radius is uniformly bounded by the assumed diameter bound. Larger values of $epsilon$ are absorbed by increasing $K$.
  Here these statements are inherited by the subsequential law through the localized conditional convergence of Corollary 13. We detail the role of the stopping times, since no stochastic differential equation for $W$ is available. First restrict to a finite capacity interval on which the test point has positive chart height, its relevant coordinates stay bounded, and its physical access and conformal radius are protected. Driver convergence and the Loewner ODE then imply convergence of its coordinates, derivatives, and point clocks. The inverse clock is continuous on such an interval because its rate is positive and continuous. In the discrete conditional future, finish the current tile when necessary and use the uniform crossing bounds; the tile error disappears under the same protections. One passes these bounds by multiplying them by bounded continuous functions of the stopped driver history, slightly enlarging visiting balls and relaxing conformal-radius thresholds before taking the limit. The conditional inequalities consequently hold in the natural driver filtration.
  For a bounded live stopping time, approximation from above by stopping times on a deterministic time grid gives the same conclusion. Current charts and coordinates are continuous under the protections; relaxed thresholds remove a possible equality at the limiting time. First angular-level times can equivalently be approximated on clock grids, with a slightly relaxed level, and then obtained by continuity. Finally exhaust the finite horizons and the protections. For the physical annulus estimate, take the mesh to zero at each fixed positive protected radius before removing that protection. Thus the annuli used in the limiting estimate are always above the lattice cutoff during its proof. This establishes the two estimates, including all their live clock restarts, without assuming a continuum domain Markov property or a semimartingale driver. Only the natural past is conditioned on; no enlargement revealing future information is used. ◻
]

=== 4.2 A deterministic estimate on boundary avoidance <a-deterministic-estimate-on-boundary-avoidance>

#thm([Lemma 4.4.])[
  (Reflected-ball estimate).  #emph[Consider a chordal Loewner trace in $bb(H)$ with continuous driver, starting from $0$. Let its maps be $l_t$, so that $l_0$ is the identity. Start a point at $z_0 = x + upright(i) X_0$ with $\| z_0 \| = 1$. There are absolute constants $c_0 > 0$ and $K < oo$ such that, if $0 < d < 1 \/ 8$, $X_0 lt.eq c_0 d$, and the trace avoids $B \( x \, d \)$, then up to the point’s lifetime 
#[#set math.equation(numbering: n => "(4.6)")
 $ sup_s X_s / X_0 lt.eq K / d \, #h(2em) integral_0^(sigma_(*)) X_s / X_0 thin upright(d) s lt.eq K / d . $ <eng:avoidance-deterministic>]

 Consequently 
#[#set math.equation(numbering: n => "(4.7)")
 $ integral_0^(sigma_(*)) (X_s / X_0)^2 upright(d) s lt.eq K / d^2 . $ <eng:avoidance-square>]

]
] <eng:reflection>

#proof[
  Shrink the ball radius by a fixed factor whenever needed below; this only changes the constants. Because the trace misses the original ball, its connected upper half-ball is disjoint from the trace at every time. All points of the smaller upper half-ball are in the same component of the trace complement. They are therefore disconnected from infinity simultaneously, if disconnection occurs. The real boundary germ at $x$ will have this same swallowing time, as we verify below. This assertion uses avoidance of a whole ball, not merely avoidance of the point $x$.
  Before this common lifetime the map extends by Schwarz reflection to a univalent map on a smaller full ball centered at $x$. Its derivative $l'_t \( x \)$ is positive. The driver is outside this reflected image: if $W_t = l_t \( xi \)$ for a point in the ball, symmetry and univalence force $xi$ to be real. The local inverse would then give
  $ gamma \( t \) = lim_(y arrow.b 0) l_t^(- 1) \( W_t + upright(i) y \) = xi \, $
  contrary to trace avoidance.
  Fix any $t_0$ before the common bulk lifetime. Since $l_(t_0) \( x \) eq.not W_(t_0)$, the complex Loewner ODE has a flow $Phi_(t \, t_0)$, holomorphic near $l_(t_0) \( x \)$, for $t$ in a time neighborhood of $t_0$ within this lifetime (one-sided at $0$). On a sufficiently small fixed disc $D$ about $x$, the composition $Phi_(t \, t_0) compose l_(t_0)$ is defined and holomorphic. Forward and backward ODE uniqueness identify it with $l_t$ on $D ∩ bb(H)$; the identity theorem extends this equality to $D$. Hence $t mapsto l_t \( x \)$ satisfies $partial_t l_t \( x \) = 2 \/ \( l_t \( x \) - W_t \)$ before the common bulk lifetime.
  Thus the real Loewner solution at $x$ cannot meet the driver before the common bulk lifetime. Conversely, if that real solution survived a finite bulk disconnection time, its distance from the continuous driver would be positive on a slightly longer compact time interval. Continuous dependence for the complex Loewner ODE would then make all sufficiently close points $x + upright(i) y$ survive that longer interval. This contradicts the simultaneous disconnection of all points in the half-ball. The real and bulk lifetimes therefore agree; the argument also covers an infinite lifetime by exhaustion.
  Koebe’s theorem and interior distortion yield, with $r_x \( t \) = \| l_t \( x \) - W_t \|$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ r_x \( t \) gt.eq c d thin l'_t \( x \) \, #h(2em) lr(|frac(l''_t \( x \), l'_t \( x \))|) lt.eq K / d \, #h(2em) Y_t asymp X_0 l'_t \( x \) \, #h(2em) r_t asymp r_x \( t \) . $ <eng:reflection-distortion>]
  For the last comparison, distortion first gives $\| l_t \( z_0 \) - l_t \( x \) \| lt.eq K X_0 l'_t \( x \)$; choosing $c_0$ sufficiently small and using the first inequality makes this a small fraction of $r_x \( t \)$.
  Differentiate the deterministic Loewner equation in its spatial variable. On the real reflected interval it gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ partial_t (l''_t / l'_t) \( x \) = frac(4 l'_t \( x \), \( l_t \( x \) - W_t \)^3) . $ <eng:logarithmic-derivative>]
  The real denominator cannot change sign before swallowing. Hence the right-hand side has a fixed sign. The primitive starts from zero and is bounded in absolute value by $K \/ d$ through (4.8). It follows that
  #[#set math.equation(numbering: n => "(4.10)")
   $ integral frac(l'_t \( x \), r_x \( t \)^3) thin upright(d) t lt.eq K / d $ <eng:real-integral>]
  up to any strictly earlier time and then up to the lifetime by monotone convergence. This argument differentiates a map with respect to space and capacity; it never differentiates the continuous driver.
  The distortion inequalities give $X_t \/ X_0 asymp l'_t \( x \) \/ r_x \( t \) lt.eq K \/ d$. Since $upright(d) s = upright(d) t \/ r_t^2$ and $r_t asymp r_x \( t \)$,
  $ integral X_s / X_0 thin upright(d) s lt.eq K integral frac(l'_t \( x \), r_x \( t \)^3) thin upright(d) t lt.eq K / d . $
  Taking the product of this bound and the supremum bound proves (4.7). Disconnection introduces no additional term: the integrals stop at the common lifetime, and the killed angular process is zero beyond its clock lifetime. ◻
]

=== 4.3 Uniform angular controls and exponential contraction <uniform-angular-controls-and-exponential-contraction>

#thm([Lemma 4.5.])[
  (Supremum tails and occupation tightness).  #emph[At every live restart, use elapsed point clock and write $X_0$ for its starting angular coordinate. There are $a > 0$ and $K < oo$ such that 
#[#set math.equation(numbering: n => "(4.11)")
 $ bb(P) {sup_(s gt.eq 0) X_s / X_0 > u thin mid(bar.v) thin upright("past")} lt.eq K u^(- a) \, #h(2em) u gt.eq 1 . $ <eng:supremum-tail>]

 Moreover the conditional laws of 
#[#set math.equation(numbering: n => "(4.12)")
 $ I = integral_0^oo (X_s / X_0)^2 upright(d) s $ <eng:occupation>]

 are uniformly tight, over all live restarts and all starting angles.]
] <eng:controls>

#proof[
  Translate and dilate the current chart to make the starting radial coordinate equal to one. The corresponding capacity scaling leaves $upright(d) t \/ r_t^2$, and hence the point clock, unchanged. Time zero and the notation $O_0$ in this proof refer to the chosen restart.
  For a large $u$ take $d = A \/ u$, with a fixed $A$ larger than both the constant in (4.6) and $1 \/ c_0$. If $X_0 lt.eq c_0 d$, the reflected-ball bound makes the supremum at most $u$ unless the trace visits $B \( x \, d \)$. Lemma 18 bounds that exception by $K d^a$. If $X_0 > c_0 d$, the deterministic inequality $X lt.eq 1$ already gives $X \/ X_0 < u$. Increasing $K$ handles the bounded range of $u$ for which $d$ is not yet sufficiently small. This proves (4.11).
  For tightness, fix a sufficiently small $d > 0$. If $X_0 lt.eq c_0 d$, then $I lt.eq K \/ d^2$ outside an event of conditional probability at most $K d^a$, by Lemmas 18 and 19. If $X_0 > c_0 d$, the conformal-radius identity instead gives
  $ I = frac(1, 4 X_0^2) log frac("crad"_(O_0) \( w \), inf_(t < T_w) "crad"_(O_t) \( w \)) . $
  This is an equality of extended nonnegative quantities, with the infimum taken on the live interval. By (4.5),
  $ bb(P) { I > L divides upright("past") } lt.eq K exp \( - 4 a c_0^2 d^2 L \) #h(2em) upright("if ") X_0 > c_0 d . $
  For $L gt.eq K \/ d^2$ the two cases therefore give a uniform bound by $K d^a + K exp \( - 4 a c_0^2 d^2 L \)$. Given an error probability, first choose $d$ small and then $L$ large. This proves the asserted tightness. ◻
]

#thm([Lemma 4.6.])[
  (Small-power contraction).  #emph[There exist $p in \( 0 \, 1 \/ 4 \)$, $b > 0$, and $K < oo$ such that, from every live restart, 
#[#set math.equation(numbering: n => "(4.13)")
 $ bb(E) \[ X_s^p divides upright("past") \] lt.eq K X_0^p e^(- b s) \, #h(2em) s gt.eq 0 . $ <eng:moment-decay>]

 The same choice of $p$ has a uniformly bounded conditional $2 p$-moment of $sup_(s gt.eq 0) X_s \/ X_0$.]
] <eng:decay>

#proof[
  Choose $p < 1 \/ 4$ so small that $4 p < a$, with $a$ from (4.11). Integrating that tail gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E) [(sup_(s gt.eq 0) X_s / X_0)^(2 p) thin mid(bar.v) thin upright("past")] lt.eq K_p . $ <eng:supremum-moment>]
  We next find a deterministic clock time $H$ at which the conditional $p$-moment contracts strictly.
  Fix a small error tolerance $alpha > 0$, to be chosen below. Choose $rho in \( 0 \, 1 \/ 2 \)$ so small that $K \( 2 rho \)^a lt.eq alpha$. By occupation tightness choose $L$ with $bb(P) { I > L divides upright("past") } lt.eq alpha$, uniformly over the restart. Take $H > L \/ rho^2$. If the angular process is alive throughout $\[ 0 \, H \]$ and never reaches $rho X_0$, then $I gt.eq rho^2 H > L$. Thus with conditional probability at least $1 - alpha$ it either dies or reaches $rho X_0$ by $H$. At the first live hitting time, the restarted supremum estimate gives
  $ bb(P) {sup_(upright("after hit")) X_s > X_0 \/ 2 thin mid(bar.v) thin upright("past at hit")} lt.eq K \( 2 rho \)^a lt.eq alpha . $
  The killed process never rebounds. Consequently
  #[#set math.equation(numbering: n => "(4.15)")
   $ bb(P) { X_H \/ X_0 > 1 \/ 2 divides upright("past") } lt.eq 2 alpha . $ <eng:half-probability>]
  Using (4.14) and conditional Cauchy–Schwarz on the exceptional event,
  $ bb(E) \[ \( X_H \/ X_0 \)^p divides upright("past") \] lt.eq 2^(- p) + K_p^(1 \/ 2) \( 2 alpha \)^(1 \/ 2) . $
  Choose $alpha$ sufficiently small to make the right-hand side a constant $lambda < 1$. All choices were uniform in the starting angle and past.
  Apply this contraction successively at clock times $H \, 2 H \, dots.h$ while alive; after death the conditional contribution is zero. This gives $bb(E) \[ X_(n H)^p divides upright("initial past") \] lt.eq lambda^n X_0^p$. For $s = n H + u$, $0 lt.eq u < H$, the restarted supremum moment bounds the last partial interval by a fixed factor. With $b = - H^(- 1) log lambda > 0$, enlarging $K$ proves (4.13). Only this $p$-moment is asserted to contract; the higher moment needed later comes from (4.14). ◻
]

=== 4.4 The two capacity-to-clock ratios <the-two-capacity-to-clock-ratios>

#thm([Lemma 4.7.])[
  (Weighted clock integral).  #emph[For the $p$ in Lemma 21, there are $epsilon.alt > 0$ and $K < oo$ such that, uniformly over every initial live point, 
#[#set math.equation(numbering: n => "(4.16)")
 $ bb(E) integral_0^(sigma_(*)) X_s^(2 p) [(sqrt(t \( s \)) / r_s)^epsilon.alt + (r_s / sqrt(t \( s \)))^epsilon.alt] upright(d) s lt.eq K . $ <eng:weighted-clock>]

 Here $t \( s \)$ is capacity elapsed from the chosen starting instant. The value at $s = 0$ is immaterial.]
] <eng:weighted>

#proof[
  On a surviving clock interval, Lemma 17 gives
  #[#set math.equation(numbering: n => "(4.17)")
   $ r_s = frac(Y_0 e^(- 2 s), X_s) \, #h(2em) t \( s \) = Y_0^2 integral_0^s e^(- 4 v) / X_v^2 thin upright(d) v . $ <eng:time-formula>]
  Since $X_v lt.eq 1$, the second integral is at least a fixed constant times $min \( 1 \, s \)$. Therefore
  #[#set math.equation(numbering: n => "(4.18)")
   $ r_s / sqrt(t \( s \)) lt.eq frac(K, X_s sqrt(min \( 1 \, s \))) . $ <eng:inverse-ratio>]
  For $0 < epsilon.alt lt.eq p$, the inequality $X_s^(2 p - epsilon.alt) lt.eq X_s^p$ and (4.13) imply
  #[#set math.equation(numbering: n => "(4.19)")
   $ bb(E) [X_s^(2 p) (r_s / sqrt(t \( s \)))^epsilon.alt \; s < sigma_(*)] lt.eq K min \( 1 \, s \)^(- epsilon.alt \/ 2) X_0^p e^(- b s) . $ <eng:inverse-ratio-mean>]
  Its integral is uniformly finite when $epsilon.alt < 2$.
  For the other ratio put $q_s = min_(0 lt.eq v lt.eq s) X_v$ on ${ s < sigma_(*) }$. This minimum is strictly positive on each surviving compact clock interval. Equation (4.17) gives
  #[#set math.equation(numbering: n => "(4.20)")
   $ sqrt(t \( s \)) / r_s lt.eq sqrt(s) thin e^(2 s) X_s / q_s . $ <eng:forward-ratio>]
  Partition the surviving event into the disjoint bins
  $ B_k \( s \) = { s < sigma_(*) \, quad 2^(- k - 1) X_0 < q_s lt.eq 2^(- k) X_0 } \, #h(2em) k = 0 \, 1 \, dots.h . $
  For $k gt.eq 1$, on $B_k \( s \)$ the process has reached $2^(- k) X_0$ while alive by clock time $s$. Restarting the $2 p$-moment supremum estimate there gives
  #[#set math.equation(numbering: n => "(4.21)")
   $ bb(E) \[ X_s^(2 p) \; B_k \( s \) \] lt.eq K X_0^(2 p) 2^(- 2 p k) . $ <eng:bin-hit>]
  For $k = 0$ the same bound follows by restarting at time zero. Independently, $X_s^(2 p) lt.eq X_s^p$ and the small-power contraction give
  #[#set math.equation(numbering: n => "(4.22)")
   $ bb(E) \[ X_s^(2 p) \; B_k \( s \) \] lt.eq K X_0^p e^(- b s) . $ <eng:bin-decay>]
  Taking the geometric mean of these two upper bounds yields
  #[#set math.equation(numbering: n => "(4.23)")
   $ bb(E) \[ X_s^(2 p) \; B_k \( s \) \] lt.eq K X_0^(3 p \/ 2) 2^(- p k) e^(- b s \/ 2) . $ <eng:bin-interpolation>]
  No exponential contraction of the $2 p$-moment has been used.
  On $B_k \( s \)$ we have $q_s^(- epsilon.alt) lt.eq 2^(\( k + 1 \) epsilon.alt) X_0^(- epsilon.alt)$. Combining this with (4.20), $X_s^(2 p + epsilon.alt) lt.eq X_s^(2 p)$, and (4.23), we obtain the full bin sum
  #[#set math.equation(numbering: n => "(4.24)")
   $ & bb(E) [X_s^(2 p) (sqrt(t \( s \)) / r_s)^epsilon.alt \; s < sigma_(*)]\
 & #h(2em) lt.eq K s^(epsilon.alt \/ 2) e^(2 epsilon.alt s) X_0^(- epsilon.alt) sum_(k gt.eq 0) 2^(k epsilon.alt) bb(E) \[ X_s^(2 p) \; B_k \( s \) \]\
 & #h(2em) lt.eq K s^(epsilon.alt \/ 2) e^(- \( b \/ 2 - 2 epsilon.alt \) s) X_0^(3 p \/ 2 - epsilon.alt) sum_(k gt.eq 0) 2^(- \( p - epsilon.alt \) k) . $ <eng:bin-sum>]
  Choose once and for all
  #[#set math.equation(numbering: n => "(4.25)")
   $ 0 < epsilon.alt < min { p \, b \/ 4 \, 2 } . $ <eng:epsilon-choice>]
  The geometric series converges, $X_0^(3 p \/ 2 - epsilon.alt) lt.eq 1$, and the remaining expression is integrable at both zero and infinity. Together with (4.19), this proves (4.16). All estimates are uniform as $X_0$ tends to zero. Killed paths contribute nothing to either integral. ◻
]

=== 4.5 Shell summation and integration over physical area <shell-summation-and-integration-over-physical-area>

#proof[
  Fix $t > 0$, and divide $bb(H)$ into the dyadic shells
  $ A_j \( t \) = { v in bb(H) : 2^j sqrt(t) lt.eq \| v \| < 2^(j + 1) sqrt(t) } \, #h(2em) j in bb(Z) . $
  Write $theta.alt = arg v$ and $L_j \( t \) = integral_(A_j \( t \)) mu_t \( v \) \| v \|^(- 2) thin upright(d) A \( v \)$. Cauchy–Schwarz with the two factors $mu_t sin^p theta.alt \/ \| v \|$ and $sin^(- p) theta.alt \/ \| v \|$ gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ L_j \( t \)^2 & lt.eq (integral_(A_j \( t \)) frac(mu_t \( v \)^2 sin^(2 p) theta.alt, \| v \|^2) thin upright(d) A \( v \)) (integral_(A_j \( t \)) frac(sin^(- 2 p) theta.alt, \| v \|^2) thin upright(d) A \( v \))\
 & lt.eq K_p integral_(A_j \( t \)) frac(mu_t \( v \)^2 sin^(2 p) theta.alt, \| v \|^2) thin upright(d) A \( v \) . $ <eng:shell-cs>]
  Indeed the second factor is exactly
  $ \( log 2 \) integral_0^pi \( sin theta.alt \)^(- 2 p) thin upright(d) theta.alt < oo \, $
  because $2 p < 1$. This is where the small angular power is retained.
  For the $epsilon.alt$ chosen in (4.25), weighted Cauchy–Schwarz over a finite set of shell indices gives
  $ (sum_j L_j \( t \))^2 lt.eq (sum_(j in bb(Z)) 2^(- epsilon.alt \| j \|)) sum_j 2^(epsilon.alt \| j \|) L_j \( t \)^2 . $
  On $A_j \( t \)$, the weight $2^(epsilon.alt \| j \|)$ is bounded by a constant times $\( \| v \| \/ sqrt(t) \)^epsilon.alt + \( sqrt(t) \/ \| v \| \)^epsilon.alt$. Increasing the finite sets of indices and using monotone convergence therefore gives the extended-integral inequality
  #[#set math.equation(numbering: n => "(4.27)")
   $ J_t^2 lt.eq K integral_(bb(H)) frac(mu_t \( v \)^2 sin^(2 p) \( arg v \), \| v \|^2) [(frac(\| v \|, sqrt(t)))^epsilon.alt + (frac(sqrt(t), \| v \|))^epsilon.alt] upright(d) A \( v \) . $ <eng:shell-global>]
  Under $w = psi_t \( v \)$ the area formula is
  $ mu_t \( v \)^2 thin upright(d) A \( v \) = m^2 thin upright(d) A \( w \) . $
  The angular coordinate and radial coordinate in (4.27) become $X_t \( w \)$ and $r_t \( w \)$ from (4.3). Thus Tonelli’s theorem gives
  #[#set math.equation(numbering: n => "(4.28)")
   $ bb(E) integral_0^oo J_t^2 thin upright(d) t & lt.eq K m^2 integral_Omega bb(E) integral_0^(T_w) X_t \( w \)^(2 p) [(frac(r_t \( w \), sqrt(t)))^epsilon.alt + (frac(sqrt(t), r_t \( w \)))^epsilon.alt] frac(upright(d) t, r_t \( w \)^2) thin upright(d) A \( w \)\
 & lt.eq K m^2 "area" \( Omega \) \, $ <eng:area-conclusion>]
  where the last inequality is precisely Lemma 22 for each fixed physical point, followed by its point-clock change of variables. The constants are independent of $w$. There is no need to choose a common exceptional event for all physical points: Tonelli applies to the nonnegative jointly measurable integrands and the uniform expected bound for each fixed point. The single time $t = 0$ has no effect on the integral. This proves (4.2) and the almost-everywhere finiteness assertion. ◻
]

#prodef([Remark 4.8.])[
  The estimate holds on the entire capacity half-line. Neither an exponential-martingale estimate nor any absolute continuity with a Brownian-driven law was used in obtaining it. Its geometric inputs remain uniform after live restarts, and every conformal-radius infimum was taken before swallowing. These two features are what make the estimate available for the subsequent potential calculus.
] <eng:scope>

== 5 Green potentials and the driving process <cal:section>

Throughout this section $m > 0$. We work under one of the subsequential laws supplied by Proposition 11, in the joint filtration of the curve and the fermion field of Proposition 14. In particular, $M_t \( w \)$ is a continuous local martingale only while $w$ is in the active domain. No martingale property after swallowing will be used. Proposition 16 supplies the other probabilistic input:

#[#set math.equation(numbering: n => "(5.1)")
 $ bb(E) integral_0^oo J_t^2 thin upright(d) t < oo \, #h(2em) J_t = integral_(bb(H)) frac(mu_t \( v \), \| v \|^2) thin upright(d) A \( v \) . $ <cal:energy-input>]

Here and below an expression involving an active point is used only before its lifetime. In a nonnegative space–time integral it is set to zero after that lifetime.

It is convenient to abbreviate the physical uniformizing map by

$ Phi_t = g_t compose phi.alt \, #h(2em) Z_t \( w \) = Phi_t \( w \) - W_t \, #h(2em) P_t \( w \) = P \( Z_t \( w \) \) . $

Thus $Phi_t$ and $Z_t$ map the physical active domain to $bb(H)$, while $psi_t \( v \) = Phi_t^(- 1) \( W_t + v \)$ is the inverse centered chart. The disc maps $chi$ are used to compare complete curves; throughout this section $t$ remains capacity time. We use the Dirichlet Green kernel for $- Delta$:

#[#set math.equation(numbering: n => "(5.2)")
 $ G_(bb(H)) \( z \, v \) = frac(1, 2 pi) log lr(|frac(z - overline(v), z - v)|) \, #h(2em) G_t \( z \, w \) = G_(bb(H)) \( Phi_t \( z \) \, Phi_t \( w \) \) . $ <cal:green-normalization>]

The kernel $G_t$ is set to zero when either argument has left the active domain. The following proposition is the conclusion of the section.

#thm([Proposition 5.1.])[
  (Identification of the driver).  #emph[The subsequential driving process is a continuous semimartingale and, in the above joint filtration, satisfies 
#[#set math.equation(numbering: n => "(5.3)")
 $ upright(d) W_t = sqrt(16 / 3) thin upright(d) B_t + frac(2 pi, 3) C_t thin upright(d) t \, #h(2em) integral_0^T C_t^2 thin upright(d) t < oo quad upright("almost surely for every ") T < oo \, $ <cal:driver-equation>]

 where $B$ is a Brownian motion and 
#[#set math.equation(numbering: n => "(5.4)")
 $ C_t = 4 / pi integral_(bb(H)) P \( v \) mu_t \( v \) \| nabla \( h_t compose psi_t \) \( v \) \| thin upright(d) A \( v \) . $ <cal:C-definition>]

 In particular, neither absolute continuity of the quadratic variation nor absolute continuity of the finite-variation part of $W$ is an assumption of the argument.]
] <cal:driver>

We first express $h_t$ as harmonic measure plus a bounded Green potential. A height cutoff makes this potential a semimartingale up to swallowing; differences at two protected points then recover semimartingality of $W$. A common covariance clock records possible singular parts of both the driver and the fermion brackets. Finally, averaged expansions at the moving mark identify the cubic and quadratic poles, giving the variance, eliminating singular driver variation, and determining the drift.

=== 5.1 The bounded potential and interior estimates <cal:deterministic>

With $D = 2 upright(i) partial_z$, the relation $D h_t = M_t^2$ reads

$ D h = h_y + upright(i) h_x \, #h(2em) \| nabla h_t \| = \| M_t \|^2 \, #h(2em) overline(partial M)_t = - upright(i) m overline(M_t) . $

Consequently $Delta h_t = - 4 m \| M_t \|^2$. With $u_t \( w \) = arg Z_t \( w \) \/ pi$, the boundary values of $h_t - u_t$ are zero at all prime ends other than the two marks.

#thm([Lemma 5.2.])[
  (Potential representation and bulk bound).  #emph[There is a constant $K$, depending only on $m$ and a physical diameter bound, such that on every active domain 
#[#set math.equation(numbering: n => "(5.5)")
 $ h_t \( z \) & = u_t \( z \) + 4 m integral_(O_t) G_t \( z \, w \) \| M_t \( w \) \|^2 thin upright(d) A \( w \) \,\
\| M_t \( w \) \|^2 & lt.eq frac(K, "crad"_(O_t) \( w \)) . $ <cal:representation>]

 In particular the nonnegative potential 
#[#set math.equation(numbering: n => "(5.6)")
 $ Q_t \( z \) := integral_(O_t) G_t \( z \, w \) \| M_t \( w \) \|^2 thin upright(d) A \( w \) quad upright("satisfies") quad 0 lt.eq Q_t \( z \) lt.eq frac(1, 4 m) . $ <cal:bounded-potential>]

]
] <cal:potential>

#proof[
  We first justify the gradient estimate for a bounded solution of $Delta h = - 4 m \| nabla h \|$ in a bounded domain. The following elementary interior argument keeps its constants uniform as the domain is slit. On a disc $B \( x \, R \)$ compactly contained in the domain, let
  $ N = sup_(y in B \( x \, R \)) \( R - \| y - x \| \) \| nabla h \( y \) \| . $
  One can first replace the disc by a slightly smaller disc, so that $N < oo$. Choose $y$ attaining at least $N \/ 2$, and put $d = R - \| y - x \|$. On $B \( y \, d \/ 2 \)$ the gradient is at most $2 N \/ d$. Decompose $h$ there into its harmonic extension of the boundary data and its Green potential. The derivative of the Poisson kernel at the centre, and the integrability of the derivative of the disc Green kernel, give
  $ \| nabla h \( y \) \| lt.eq K / d parallel h parallel_oo + K d thin parallel Delta h parallel_(L^oo \( B \( y \, d \/ 2 \) \)) lt.eq K / d parallel h parallel_oo + K m N . $
  Multiplication by $d$ absorbs the last term when $m R$ is below a fixed constant. Taking $R$ comparable to $min { "dist" \( x \, partial O_t \) \, m^(- 1) }$, and using $0 lt.eq h_t lt.eq 1$, proves
  $ \| nabla h_t \( x \) \| lt.eq K #scale(x: 120%, y: 120%)[\(] "dist" \( x \, partial O_t \)^(- 1) + m #scale(x: 120%, y: 120%)[\)] . $
  The distance is bounded above by the physical diameter. Koebe’s one-quarter estimate compares distance with conformal radius and gives (5.5). Interior regularity needed in this argument also follows directly from the constant-coefficient equation for $M$; indeed $Delta M = 4 m^2 M$.
  For the representation, fix $t$ and write $k = h_t - u_t$. Exhaust $O_t$ by images of concentric discs of radii $r arrow.t 1$ under an interior normalized Riemann map. Green’s formula in each exhaustion domain is
  $ k \( z \) = H_r \( z \) + 4 m integral_(O_t^(\( r \))) G_(O_t^(\( r \))) \( z \, w \) \| M_t \( w \) \|^2 thin upright(d) A \( w \) \, $
  where $H_r$ is the harmonic extension of $k$ from the exhaustion boundary. In disc coordinates the functions $k$ are uniformly bounded and tend to zero radially at every boundary point except the two marks. The Poisson formula and dominated convergence imply $H_r \( z \) arrow.r 0$. The Green kernels increase to $G_t$; monotone convergence therefore proves (5.5), as well as nonnegativity of $k$. Since $0 lt.eq h_t \, u_t lt.eq 1$, this also proves (5.6). This reasoning uses prime-end boundary values and requires no physical boundary regularity. ◻
]

At a fixed time, put

$ F_t \( v \) = psi'_t \( v \)^(1 \/ 2) M_t \( psi_t \( v \) \) \, $

using either consistent square-root choice. Conformal radius and area transform as

#[#set math.equation(numbering: n => "(5.7)")
 $ "crad"_(O_t) \( psi_t \( v \) \) = 2 "Im" v thin \| psi'_t \( v \) \| \, #h(2em) m \| M_t \( psi_t \( v \) \) \|^2 thin upright(d) A \( psi_t \( v \) \) = mu_t \( v \) \| F_t \( v \) \|^2 thin upright(d) A \( v \) . $ <cal:changes-of-variables>]

It follows that

#[#set math.equation(numbering: n => "(5.8)")
 $ \| F_t \( v \) \|^2 lt.eq frac(K, "Im" v) \, #h(2em) m integral_(O_t) P_t \( w \) \| M_t \( w \) \|^2 thin upright(d) A \( w \) lt.eq K J_t \, #h(2em) C_t lt.eq K J_t . $ <cal:poisson-control>]

For the last inequality we used $\| nabla \( h_t compose psi_t \) \| = \| F_t \|^2$. Also, bounded physical area gives the deterministic identity

#[#set math.equation(numbering: n => "(5.9)")
 $ integral_(bb(H)) mu_t \( v \)^2 thin upright(d) A \( v \) = m^2 \| O_t \| < oo . $ <cal:mu-L2>]

=== 5.2 Differentiating the potential without a killing term <cal:cutoff-subsection>

A direct differentiation of the logarithmic kernel, using the Loewner ordinary differential equation, gives

#[#set math.equation(numbering: n => "(5.10)")
 $ partial_t G_t \( z \, w \) = - 2 / pi P_t \( z \) P_t \( w \) . $ <cal:hadamard>]

This identity differentiates only $Phi_t \( z \)$ and $Phi_t \( w \)$. In particular it holds for every continuous driver and does not assume that $W$ is a semimartingale.

We will localize at a protected physical point $z$: the time horizon is bounded, $z$ has a fixed open neighbourhood in the active domain, and its chart height, coordinates, and derivative stay in compact ranges with positive lower bounds where appropriate. These are adapted stopping localizations. A countable family of physical discs and positive rational protection levels suffices. The essential protection is a positive lower bound on chart height; positive physical distance alone would not exclude swallowing inside a disconnected pocket.

#thm([Lemma 5.3.])[
  (Stochastic Green potential).  #emph[On every such stopped interval $\[ 0 \, T \]$, 
#[#set math.equation(numbering: n => "(5.11)")
 $ bb(E) integral_0^T integral_(O_t) G_t \( z \, w \) thin upright(d) \[ M \( w \) \, overline(M \( w \)) \]_t thin upright(d) A \( w \) < oo . $ <cal:weighted-bracket>]

 The potential $Q_t \( z \)$ has a continuous semimartingale version, and 
#[#set math.equation(numbering: n => "(5.12)")
 $ upright(d) Q_t \( z \) =  & - 2 / pi P_t \( z \) (integral_(O_t) P_t \( w \) \| M_t \( w \) \|^2 thin upright(d) A \( w \)) upright(d) t\
 & + integral_(O_t) G_t \( z \, w \) thin upright(d) \[ M \( w \) \, overline(M \( w \)) \]_t thin upright(d) A \( w \)\
 & + 2 "Re" integral_(O_t) G_t \( z \, w \) overline(M_t \( w \)) thin upright(d) M_t \( w \) thin upright(d) A \( w \) . $ <cal:potential-differential>]

 The last line is defined by the weighted bracket-isometry limit of compactly supported stochastic integrals. The statement holds simultaneously for countably many protected spatial points, and also as a spatial distribution identity on protected open sets.]
] <cal:stochastic-potential>

#proof[
  Choose a smooth nondecreasing function $chi : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ which is zero on $\[ 0 \, 1 \]$ and one on $\[ 2 \, oo \)$. Write $Y_t \( w \) = "Im" Phi_t \( w \)$, and insert the factor $chi \( Y_t \( w \) \/ lambda \)$ in $Q_t$. First also insert time-independent compact physical cutoffs $0 lt.eq rho_N lt.eq 1$ increasing to one. Denote the resulting potential by $Q_t^(N \, lambda) \( z \)$.
  For fixed $N \, lambda$ the product formula is legitimate entirely before lifetimes. Here is one explicit way to implement this assertion. For each $w$ in the compact support, stop its martingale when $Y_t \( w \) lt.eq lambda$, and freeze it thereafter. On the set where the cutoff is nonzero this stopped martingale equals $M_t \( w \)$. Moreover, on a bounded time horizon,
  $ \| Phi'_t \( w \) \| lt.eq \| phi.alt' \( w \) \| exp \( 2 T \/ lambda^2 \) quad upright("as long as ") Y_t \( w \) gt.eq lambda . $
  Together with (5.5), this bounds these stopped martingales uniformly over the compact support. Their pointwise expected brackets are therefore uniformly bounded. The kernel is bounded above by $G_Omega \( z \, w \)$; its only interior singularity is logarithmic and is integrable in $w$. These bounds justify stochastic Fubini for the compact integral. Equivalently, approximate its spatial integrals by simple functions and use the covariance Cauchy–Schwarz inequality. The singularity can also be tested first against a smooth compact function of $z$.
  Both time-dependent factors multiplying $\| M \|^2$ decrease. Formula (5.10) gives one nonnegative loss. The other is
  $ - upright(d) chi \( Y_t \/ lambda \) = frac(2 Y_t, lambda \| Z_t \|^2) chi' \( Y_t \/ lambda \) thin upright(d) t . $
  Take $lambda$ smaller than a fixed fraction of the protected height of $z$. On $lambda lt.eq Y_t \( w \) lt.eq 2 lambda$ the explicit half-plane kernel gives $G_t \( z \, w \) lt.eq K_z Y_t \( w \)$. Including the area Jacobian from (5.7), the absolute cutoff loss is at most
  #[#set math.equation(numbering: n => "(5.13)")
   $ & K_z integral_(lambda lt.eq "Im" v lt.eq 2 lambda) frac(\( "Im" v \)^2, lambda \| v \|^2) frac(mu_t \( v \), m) \| F_t \( v \) \|^2 thin upright(d) A \( v \) thin upright(d) t\
 & #h(25mm)  lt.eq K_z integral_("Im" v lt.eq 2 lambda) frac(mu_t \( v \), \| v \|^2) thin upright(d) A \( v \) thin upright(d) t . $ <cal:cutoff-loss>]
  Constants may depend on the fixed mass and the protection of $z$, but not on $N$. By (5.1), $bb(E) integral_0^T J_t thin upright(d) t < oo$. Dominated convergence shows that the expected total loss in (5.13) tends to zero as $lambda arrow.b 0$. The ordinary kernel loss is bounded by $K_z J_t thin upright(d) t$, by (5.8).
  Apply the product formula to $Q^(N \, lambda)$ and take expectations. Its bracket contribution is nonnegative, and its initial and terminal potentials lie between zero and $1 \/ \( 4 m \)$. Consequently
  $ bb(E) integral_0^T integral rho_N \( w \) chi \( Y_t \( w \) \/ lambda \) G_t \( z \, w \) thin upright(d) \[ M \( w \) \, overline(M \( w \)) \]_t thin upright(d) A \( w \) lt.eq K_z (1 + bb(E) integral_0^T J_t thin upright(d) t) . $
  If an additional martingale localization is used in deriving this inequality, positivity allows its removal by Fatou’s lemma. Letting $N arrow.t oo$ and $lambda arrow.b 0$ monotonically proves (5.11).
  For completeness, the covariance inequality controlling the martingale integrals is
  #[#set math.equation(numbering: n => "(5.14)")
   $ & lr(|integral G_t \( z \, w \) thin 2 "Re" \( overline(M_t \( w \)) A_t \( w \) \) thin upright(d) A \( w \)|)^2\
 & #h(2em) lt.eq 4 (integral G_t \( z \, w \) \| M_t \( w \) \|^2 thin upright(d) A \( w \)) (integral G_t \( z \, w \) \| A_t \( w \) \|^2 thin upright(d) A \( w \)) . $ <cal:weighted-isometry>]
  Here $A$ can be any Hilbert realization of a finite family of covariance densities; approximation gives the same inequality for spatial integrals. For the difference of two cutoffs one inserts the absolute cutoff difference in both factors. The first factor is uniformly bounded by (5.6), and the expected integral of the second tends to zero by (5.11). Thus the martingale terms converge in $L^2$, uniformly in probability on the stopped time interval. The positive bracket terms converge in expected total variation. The kernel-loss terms converge in $L^1$, and the cutoff loss disappears by (5.13). At each fixed time the potentials converge by their nonnegative integral representation. Passing to the limit in the product identity proves (5.12) and its continuous version. In particular the cutoff does not leave a measure concentrated on swallowing times. The positive bracket limits are continuous as well: along a subsequence their total variation tails converge uniformly to zero, and the approximating bracket integrals are continuous.
  The construction applies to every protected point in a countable dense set. Spatially testing before applying the same argument gives the distributional statement. Local elliptic estimates, made explicit in Lemma 28, identify these versions with point evaluations wherever those are used below. ◻
]

=== 5.3 Recovering semimartingality of the driver <cal:recovery-subsection>

#thm([Lemma 5.4.])[
  (Recovery and global localization).  #emph[The continuous process $W$ is a semimartingale in the joint filtration.]
] <cal:recovery>

#proof[
  Take $z \, z'$ joined by a fixed path inside a protected physical disc. The identity
  $ h_t \( z \) - h_t \( z' \) = "Im" integral_(z')^z M_t \( zeta \)^2 thin upright(d) zeta $
  shows that this difference is a continuous semimartingale. Indeed the field is uniformly bounded after protection, the expected brackets are uniformly bounded on the compact path, and covariance Cauchy–Schwarz justifies the one-dimensional spatial stochastic integral in its product formula. Subtracting (5.12) at the two points proves that $u_t \( z \) - u_t \( z' \)$ is a semimartingale.
  For complex $a \, a' in bb(H)$ and real $w$, define
  $ H \( a \, a' \, w \) = 1 / pi #scale(x: 120%, y: 120%)[\(] arg \( a - w \) - arg \( a' - w \) #scale(x: 120%, y: 120%)[\)] . $
  Its derivative in the real variable is
  $ partial_w H \( a \, a' \, w \) = 1 / pi #scale(x: 120%, y: 120%)[\(] P \( a - w \) - P \( a' - w \) #scale(x: 120%, y: 120%)[\)] . $
  Whenever $P_t \( z \) eq.not P_t \( z' \)$, the implicit-function theorem therefore recovers $W_t$ smoothly from $u_t \( z \) - u_t \( z' \)$, $Phi_t \( z \)$, and $Phi_t \( z' \)$ in a neighbourhood of the current state. The last two processes have finite variation by the Loewner equation. This proves semimartingality on that neighbourhood without applying stochastic calculus to $W$ in advance.
  We give a stopping localization that covers every finite time, so that repeated swallowings cannot leave an exceptional accumulation time. Enumerate rational physical discs with closure in $Omega$, rational positive chart-protection levels, and finite collections of rational pairs in each disc. Stop before chart height on the closed disc falls below its specified level, before the coordinates and $W$ exceed specified bounds, or at a specified finite horizon. All these quantities are continuous before loss of protection. Also stop when the maximum of the absolute Poisson-kernel differences over the finite collection falls below a specified positive threshold. If the initial inequalities fail, set the stopping time equal to zero.
  For each such choice, the allowed coordinate states form a compact set on which at least one of the finitely many derivatives $partial_w H$ is bounded away from zero. Cover this compact set by a finite collection of implicit-function neighbourhoods, each with a smaller neighbourhood whose closure is contained in the first. Select a valid smaller neighbourhood measurably, and change charts only on leaving the corresponding larger neighbourhood. The fixed positive separation and continuity of the finitely many coordinate processes prevent an accumulation of chart changes on a protected finite interval. For clarity, let $S_k$ be the successive chart-change times, capped at this protection stop $sigma$ and kept equal to $sigma$ once it is reached. Each finite concatenation gives the semimartingale $W^(S_k)$; the chart selected at $S_k$ is $cal(F)_(S_k)$-measurable, so its stopped increment is a finite sum of predictable stopped integrals of the corresponding smooth implicit function. Define
  $ R_k = cases(delim: "{", S_k \, & S_k < sigma \,, oo \, & S_k = sigma .) $
  These are increasing stopping times, and the nonaccumulation of chart changes gives $R_k arrow.t oo$. Since $\( W^sigma \)^(R_k) = W^(S_k)$, they are ordinary semimartingale localizers for $W^sigma$. Thus $W$ stopped at every enumerated protection time is a semimartingale.
  To see that these times cover all horizons, fix a sample path and $T < oo$. The active domain $O_T$ is nonempty; choose a rational closed disc contained in it. This disc survives on $\[ 0 \, T \]$, and compactness provides positive chart-height and finite coordinate bounds there. The function $P_t$ is not constant on this disc:
  $ \| nabla P_t \( z \) \| = frac(\| Phi'_t \( z \) \|, \| Z_t \( z \) \|^2) > 0 . $
  At each time some rational pair has different Poisson-kernel values. Continuity and compactness of $\[ 0 \, T \]$ select finitely many pairs whose maximum difference stays above a positive threshold. Some localization in the enumeration therefore lasts beyond $T$.
  Finally, finite maxima of semimartingale stopping localizations are again such localizations, using $W^(sigma or tau) = W^sigma + W^tau - W^(sigma and tau)$. The successive finite maxima tend to infinity almost surely, by the previous paragraph. This is a global semimartingale localization sequence. The normalized continuous local-martingale and continuous finite-variation decompositions agree on overlaps, because a continuous finite-variation local martingale is constant. They therefore glue to the canonical decomposition
  #[#set math.equation(numbering: n => "(5.15)")
   $ W = W^(upright(M)) + V \, $ <cal:decomposition>]
  where $W^(upright(M))$ is a continuous local martingale and $V$ has locally finite variation. At this stage $V$ and $\[ W^(upright(M)) \]$ may have singular parts. ◻
]

=== 5.4 A simultaneous covariance clock <cal:clock-subsection>

The next construction is needed because the driver decomposition in (5.15) may still charge sets of zero capacity time. Pointwise covariance densities chosen separately at each spatial point would not be sufficient: later we will choose a chart and balls approaching its moving boundary mark after fixing a time. The clock $L$ below serves this simultaneous covariance construction; it differs from the point-dependent clock $sigma$ used for geometric estimates in Section 4.

#thm([Lemma 5.5.])[
  (Spatial covariance realization).  #emph[Locally in time there is a continuous increasing process $L$ such that $upright(d) t$, $\| upright(d) V \|$, $upright(d) \[ W^(upright(M)) \]$, and all the spatial bracket measures used below are absolutely continuous with respect to $upright(d) L$. Outside one null set for $upright(d) L thin upright(d) bb(P)$, write 
#[#set math.equation(numbering: n => "(5.16)")
 $ tau = frac(upright(d) t, upright(d) L) \, #h(2em) nu = frac(upright(d) V, upright(d) L) \, #h(2em) U = dot(W)^(upright(M)) \, #h(2em) A_(upright("phys")) \( w \) = dot(M) \( w \) . $ <cal:clock-notation>]

 The dots denote covariance vectors with respect to $upright(d) L$, not time derivatives. These vectors lie in a real Hilbert space, complexified for $A_(upright("phys"))$. Their scalar products are the corresponding bracket densities. The product is extended bilinearly, so $A dot.op overline(A) = \| A \|^2$ and $U dot.op U = \| U \|^2$. The field $A_(upright("phys"))$ is spatially smooth on every compact subset of the live domain. Spatial evaluations, derivatives, compact tests, and the Green stochastic integrals in (5.12) have their covariance vectors on this same full set. In particular, for protected $z$, 
#[#set math.equation(numbering: n => "(5.17)")
 $ integral_(O_t) G_t \( z \, w \) \| A_(upright("phys")) \( w \) \|^2 thin upright(d) A \( w \) < oo quad upright("for ") upright(d) L upright("-almost every live time.") $ <cal:clock-green-integrability>]

]
] <cal:covariance>

#proof[
  We describe the construction on a countable exhaustion; this also specifies the simultaneous exceptional set. Let $B$ range over rational physical discs with closure in $Omega$. Stop the entire field on $B$ at one common stopping time, before the minimum chart height on its closure falls below a positive rational level and before a fixed time or coordinate bound is exceeded. Include slightly larger discs whenever interior evaluations on $B$ will be used. The resulting stopped field is uniformly bounded, by (5.5) and the Loewner derivative estimate in the proof of Lemma 26. Freezing the whole field at the same time preserves its equation in the spatial variable.
  Let $cal(H)_B$ be the real Hilbert space of square-integrable complex functions on $B$ which solve $overline(partial f) + upright(i) m overline(f) = 0$ distributionally, with inner product $"Re" integral_B f overline(g) thin upright(d) A$. It is a closed subspace of real $L^2 \( B \; bb(C) \)$ and hence is separable. Interior estimates for $Delta f = 4 m^2 f$ show that evaluation and every spatial derivative on a smaller disc are bounded linear functionals on $cal(H)_B$. Their Riesz representatives depend smoothly on the evaluation point: the Taylor remainder estimates follow from the same interior bounds one derivative further.
  The stopped field is a continuous square-integrable $cal(H)_B$-valued martingale. To verify this assertion, integrate its bounded scalar martingale identities against a countable dense set of $L^2$ tests; approximation gives all Hilbert-space conditional expectation identities. Joint local continuity gives Hilbert continuity. If $\( e_j \)$ is a real orthonormal basis, its trace bracket is
  $ sum_j \[ chevron.l M \, e_j chevron.r \]_t \, #h(2em) bb(E) sum_j \[ chevron.l M \, e_j chevron.r \]_T = bb(E) parallel M_T - M_0 parallel_(cal(H)_B)^2 < oo . $
  Enumerate all discs and protections. Multiplying their centred stopped martingales by sufficiently small positive deterministic weights makes their direct sum a continuous square-integrable martingale in a separable real Hilbert space. This is possible because each stopped field has a deterministic norm bound. For the driver use the normalized martingale
  $ N_t^0 = integral_0^t frac(upright(d) W_s^(upright(M)), 1 + \[ W^(upright(M)) \]_s) \, #h(2em) \[ N^0 \]_t = frac(\[ W^(upright(M)) \]_t, 1 + \[ W^(upright(M)) \]_t) lt.eq 1 . $
  It is square-integrable and can be included as one real coordinate. The joint covariance of this direct sum retains all cross-brackets, including those between different discs and this normalized driver. The covariance vector of the original driver is recovered by multiplying that coordinate’s vector by $1 + \[ W^(upright(M)) \]_t$.
  A positive trace-class covariance measure has an operator density with respect to its trace measure. This can be constructed directly: take Radon–Nikodym derivatives of its matrix entries in a countable orthonormal basis, impose positivity on the countable collection of rational finite linear combinations, and complete the resulting positive form. Its finite trace makes it a bounded positive trace-class operator at almost every clock time. Its positive square root applied to the Riesz representatives of evaluation gives the vectors in (5.16). Real and imaginary evaluations supply the complexified vector $A_(upright("phys"))$. Smoothness of the Riesz representatives proves smoothness in $w$. On overlapping protected discs the evaluation martingales coincide before either stop; the bracket of their difference is zero there. Impose this equality first at rational spatial points and then use smoothness. The local realizations therefore agree on their overlaps on one common full set.
  Add $upright(d) t$, $\| upright(d) V \|$, and $upright(d) \[ W^(upright(M)) \]$ to the trace clock. Also add the countably many positive Green-integrated bracket measures from (5.11), using rational protected points or nonnegative compact tests in $z$. Their cumulative processes are finite on their stopped intervals. There is no issue in making this sum locally finite: for any continuous increasing process $H$, the measure $\( 1 + H_t \)^(- 2) upright(d) H_t$ has total mass at most one and has the same null sets as $upright(d) H$; use these measures with summable positive weights. Every required measure is therefore absolutely continuous with respect to $upright(d) L$. Matrix Radon–Nikodym derivatives with respect to this clock give the same construction, now including singular parts of $upright(d) V$ or $upright(d) \[ W^(upright(M)) \]$.
  Choose the countable smooth test families dense in the $C^oo$ topology for each fixed compact support in a countable protected exhaustion, and include a nonzero nonnegative bump in each protected disc. For each such nonnegative test, nonnegative Fubini identifies the density of its Green-integrated bracket measure with the corresponding integral of $G_t \| A_(upright("phys")) \|^2$. Fix a time in the resulting common full set and a surviving bump $eta$, and put
  $ K_eta \( w \) = integral eta \( z \) G_t \( z \, w \) thin upright(d) A \( z \) . $
  Then $integral K_eta \| A_(upright("phys")) \|^2 thin upright(d) A < oo$. For $z$ in any compact subset of the live domain, the explicit half-plane kernel bounds $G_t \( z \, w \)$ and its first $z$-derivatives by a constant times $K_eta \( w \)$ outside a slightly larger compact subset. Locally, their logarithmic and inverse-distance singularities are integrable against the smooth spatial fields. This proves (5.17) at every live interior point on the same full set. Weighted Cauchy–Schwarz gives the corresponding tail control for the mixed Green integrals; (5.14) and (5.6) identify their compact-truncation limits with the covariance vectors of the noncompact martingale integrals. The potential expressions define continuous spatial distributions, so density of the chosen tests extends the identities and their distributional derivatives to all compact tests on this same full set. An arbitrary current conformal chart, and the boundary-approaching balls chosen later, are deterministic spatial choices after a time in this full set has been fixed. ◻
]

At such a time, translate the half-plane to put $W_t$ at zero and omit the time subscript. Set

$ A \( v \) = psi'_t \( v \)^(1 \/ 2) A_(upright("phys")) \( psi_t \( v \) \) \, #h(2em) F \( v \) = psi'_t \( v \)^(1 \/ 2) M_t \( psi_t \( v \) \) \, #h(2em) mu \( v \) = m \| psi'_t \( v \) \| . $

The same square root is used in the two definitions. Formula (5.17) implies

#[#set math.equation(numbering: n => "(5.18)")
 $ integral_(bb(H)) frac("Im" v, 1 + \| v \|^2) mu \( v \) \| A \( v \) \|^2 thin upright(d) A \( v \) < oo . $ <cal:weighted-A>]

Indeed, for every fixed $z_0 in bb(H)$ there is $c \( z_0 \) > 0$ such that

$ G_(bb(H)) \( z_0 \, v \) gt.eq c \( z_0 \) frac("Im" v, 1 + \| v \|^2) \, #h(2em) v in bb(H) . $

This follows from the explicit kernel near the real line and infinity, and positivity on the remaining compact set; its pole only increases the ratio. A Green average against a protected nonnegative test has the same lower bound. Finally,

$ \| A_(upright("phys")) \( psi_t \( v \) \) \|^2 thin upright(d) A \( psi_t \( v \) \) = frac(mu \( v \), m) \| A \( v \) \|^2 thin upright(d) A \( v \) \, $

which proves (5.18) on the same full clock-measure set.

=== 5.5 Three identities in the current half-plane <cal:identities-subsection>

All the next identities are first identities of spatial distributions; the estimates that follow also justify the displayed kernels directly. Every occurrence of $D G$ differentiates the first variable. We claim

#[#set math.equation(numbering: n => "(5.19)")
 $ F \( z \)^2 =  & frac(1, pi z) + 4 integral_(bb(H)) D G \( z \, v \) mu \( v \) \| F \( v \) \|^2 thin upright(d) A \( v \) \,\
2 F \( z \) A \( z \) =  & frac(U, pi z^2) + 8 integral_(bb(H)) D G \( z \, v \) mu \( v \) "Re" \( overline(F \( v \)) A \( v \) \) thin upright(d) A \( v \) \,\
A \( z \) dot.op A \( z \) =  & frac(\| U \|^2 - 4 tau, pi z^3) + frac(nu, pi z^2) - frac(2 C tau, z^2) + 4 integral_(bb(H)) D G \( z \, v \) mu \( v \) \| A \( v \) \|^2 thin upright(d) A \( v \) . $ <cal:identity-zero>]

When $tau = 0$, the expression $C tau$ is defined to be zero; it is a capacity-density term and does not require a value for $C$ on that part of the clock.

Here is a derivation including the constants. In physical coordinates,

$ D u_t \( w \) = frac(Phi'_t \( w \), pi Z_t \( w \)) \, #h(2em) partial_t Phi'_t \( w \) = - frac(2 Phi'_t \( w \), Z_t \( w \)^2) . $

Itô’s formula, now justified by Lemma 27, gives

#[#set math.equation(numbering: n => "(5.20)")
 $ upright(d) (frac(Phi'_t \( w \), pi Z_t \( w \))) = frac(Phi'_t \( w \), pi Z_t \( w \)^2) thin upright(d) W_t + frac(Phi'_t \( w \), pi Z_t \( w \)^3) #scale(x: 120%, y: 120%)[\(] upright(d) \[ W^(upright(M)) \]_t - 4 upright(d) t #scale(x: 120%, y: 120%)[\)] . $ <cal:ito-harmonic>]

The two contributions $- 2 upright(d) t$ in the last coefficient come from $upright(d) \( 1 \/ Z_t \)$ and from $upright(d) Phi'_t$, respectively. Applying $D$ to (5.5) gives (5.19) after division by $Phi'_t$. Applying $D$ to (5.12), and comparing with

$ upright(d) \( M_t^2 \) = 2 M_t thin upright(d) M_t + upright(d) \[ M \, M \]_t \, $

gives the other two identities. In particular the kernel-loss term has derivative

$ - frac(8 m, pi) thin D P_t \( w \) integral_(O_t) P_t \( zeta \) \| M_t \( zeta \) \|^2 thin upright(d) A \( zeta \) thin upright(d) t . $

Since $D P \( z \) = z^(- 2)$ and

$ C = frac(4 m, pi) integral_(O_t) P_t \( zeta \) \| M_t \( zeta \) \|^2 thin upright(d) A \( zeta \) \, $

this becomes $- 2 C tau \/ z^2$ after division by $Phi'_t$ and $upright(d) L$. The martingale potential has factor $4 m times 2 = 8 m$. Changing physical area to chart area turns $m "Re" \( overline(M) A_(upright("phys")) \) upright(d) A$ into $mu "Re" \( overline(F) A \) upright(d) A$, and turns $m \| A_(upright("phys")) \|^2 upright(d) A$ into $mu \| A \|^2 upright(d) A$. These are precisely the factors eight and four in (5.19)–(5.19). This procedure differentiates identities in physical space first and only then changes coordinates at a fixed time; it does not apply Itô’s formula to a fermion evaluated at a random moving point.

=== 5.6 Averaged estimates at the moving mark <cal:tip-subsection>

For $s > 0$ let

$ B_s = B \( upright(i) s \, s \/ 4 \) \, #h(2em) N_s = B \( upright(i) s \, s \/ 2 \) . $

For a scalar or Hilbert-valued function $q$, write

$ parallel q parallel_(L_(upright("av"))^p \( B_s \)) = (frac(1, \| B_s \|) integral_(B_s) \| q \|^p thin upright(d) A)^(1 \/ p) . $

Constants in this subsection may depend on the fixed time and its finite clock densities. Each little-oh assertion concerns $s arrow.b 0$ at that time.

#thm([Lemma 5.6.])[
  (Tip expansions).  #emph[In the current conformal setting, assume (5.9), (5.18), and the bulk bound $\| F \( v \) \|^2 lt.eq K \/ "Im" v$ from (5.8). Then (5.19)–(5.19) imply 
#[#set math.equation(numbering: n => "(5.21)")
 $ F \( z \)^2 & = frac(1, pi z) + o \( s^(- 1) \) #h(2em) upright("uniformly on ") B_s \,\
2 F \( z \) A \( z \) & = frac(U, pi z^2) + o \( s^(- 3 \/ 2) \) #h(2em) upright("in ") L_(upright("av"))^2 \( B_s \) \,\
integral_(bb(H)) D G \( z \, v \) mu \( v \) \| A \( v \) \|^2 thin upright(d) A \( v \) & = o \( s^(- 2) \) #h(2em) upright("in ") L_(upright("av"))^1 \( B_s \) . $ <cal:tip-leading>]

 If in addition $J = integral_(bb(H)) mu \( v \) \| v \|^(- 2) thin upright(d) A \( v \) < oo$, then 
#[#set math.equation(numbering: n => "(5.22)")
 $ F \( z \)^2 & = frac(1, pi z) + C + o \( 1 \) #h(2em) upright("uniformly on ") B_s \,\
2 F \( z \) A \( z \) & = frac(U, pi z^2) + o \( s^(- 1) \) #h(2em) upright("in ") L_(upright("av"))^2 \( B_s \) . $ <cal:tip-constant>]

 No finiteness of $J$ is required for (5.21)–(5.21).]
] <cal:tip-expansions>

#proof[
  Differentiating (5.2) gives
  #[#set math.equation(numbering: n => "(5.23)")
   $ D G \( z \, v \) = frac("Im" v, pi \( z - overline(v) \) \( z - v \)) . $ <cal:DG-explicit>]
  For $z in B_s$ and $v in.not N_s$ this implies
  #[#set math.equation(numbering: n => "(5.24)")
   $ \| D G \( z \, v \) \| lt.eq K frac("Im" v, \( s + \| v \| \)^2) . $ <cal:kernel-far>]
  For $v in N_s$ the additional singular bound is
  #[#set math.equation(numbering: n => "(5.25)")
   $ \| D G \( z \, v \) \| lt.eq frac(K, \| z - v \|) . $ <cal:kernel-near>]
  The first bound follows by comparing both denominator factors to $s + \| v \|$; when $\| v \|$ is comparable to $s$, the exclusion of $N_s$ keeps $\| z - v \|$ at least $s \/ 4$. The second follows because $\| z - overline(v) \| gt.eq "Im" z + "Im" v$. For each fixed $v in bb(H)$, uniformly as $z in B_s$ tends to zero,
  #[#set math.equation(numbering: n => "(5.26)")
   $ D G \( z \, v \) arrow.r frac(P \( v \), pi) . $ <cal:kernel-limit>]
  We record two consequences of analyticity of $psi'$. Its subharmonic mean inequalities on discs of radius comparable to $s$, contained in $B \( upright(i) s \, 3 s \/ 4 \)$, give
  #[#set math.equation(numbering: n => "(5.27)")
   $ sup_(N_s) mu & lt.eq K / s (integral_(B \( upright(i) s \, 3 s \/ 4 \)) mu^2 thin upright(d) A)^(1 \/ 2) = o \( s^(- 1) \) \,\
sup_(N_s) mu & lt.eq K / s^2 integral_(B \( upright(i) s \, 3 s \/ 4 \)) mu thin upright(d) A lt.eq K integral_(B \( upright(i) s \, 3 s \/ 4 \)) frac(mu, \| v \|^2) thin upright(d) A = o \( 1 \) quad upright("if ") J < oo . $ <cal:mu-sup-L2>]
  The vanishing follows from absolute continuity of the corresponding area integral. Define the finite measure
  #[#set math.equation(numbering: n => "(5.28)")
   $ upright(d) rho \( v \) = frac("Im" v, 1 + \| v \|^2) mu \( v \) \| A \( v \) \|^2 thin upright(d) A \( v \) . $ <cal:rho>]
  On $N_s$, for small $s$, its density is comparable to $s mu \| A \|^2$. In particular
  #[#set math.equation(numbering: n => "(5.29)")
   $ integral_(N_s) s mu \| A \|^2 thin upright(d) A = o \( 1 \) . $ <cal:near-bracket-mass>]
  We now estimate each potential separately.
  #emph[The potential in (5.19).] Off $N_s$, (5.24) and $\| F \|^2 lt.eq K \/ y$ bound it by
  $ K integral_(bb(H)) frac(mu, \( s + \| v \| \)^2) thin upright(d) A = o \( s^(- 1) \) . $
  To see the little-oh rather than merely a big-oh, split at a fixed small radius $epsilon$. On its inner side the $L^2$ norm of $\( s + \| v \| \)^(- 2)$ is $O \( s^(- 1) \)$, multiplied by an arbitrarily small $L^2$ norm of $mu$. On the outer side the integral has a bound independent of $s$, by $mu in L^2$. First let $s$ tend to zero and then let $epsilon$ tend to zero. This also controls infinity. On $N_s$, (5.25), $\| F \|^2 lt.eq K \/ s$, and $integral_(N_s) \| z - v \|^(- 1) upright(d) A \( v \) lt.eq K s$ give the uniform bound $K sup_(N_s) mu = o \( s^(- 1) \)$. This proves (5.21).
  If $J < oo$, the far integrand is dominated by $K mu \/ \| v \|^2$. Equations (5.26) and dominated convergence give its limit
  $ 4 / pi integral_(bb(H)) P \( v \) mu \( v \) \| F \( v \) \|^2 thin upright(d) A \( v \) = C . $
  The near part tends uniformly to zero by (5.27). The portion of the limiting integral removed with $N_s$ tends to zero by the same $J$ majorant. This proves (5.22).
  #emph[The mixed potential in (5.19).] Covariance Cauchy–Schwarz against the finite measure (5.28) bounds the far part uniformly in $z in B_s$ by
  #[#set math.equation(numbering: n => "(5.30)")
   $ K rho \( bb(H) \)^(1 \/ 2) (integral_(bb(H)) frac(\( 1 + \| v \|^2 \) mu \( v \), \( s + \| v \| \)^4) thin upright(d) A \( v \))^(1 \/ 2) . $ <cal:mixed-far>]
  Here the square of the kernel contributes $y^2$, and the weights $\| F \|^2 lt.eq K \/ y$ and $upright(d) rho$ remove both factors of $y$. The integral inside parentheses is $o \( s^(- 3) \)$: near zero this follows from the $O \( s^(- 3) \)$ $L^2$ norm of $\( s + \| v \| \)^(- 4)$ and the preceding small-radius truncation argument; away from zero its kernel is square-integrable, including its $\| v \|^(- 2)$ tail. Thus (5.30) is $o \( s^(- 3 \/ 2) \)$. If $J < oo$, multiply that integral by $s^2$ and write it against $mu \( v \) \| v \|^(- 2) upright(d) A \( v \)$. The remaining factor
  $ frac(s^2 \| v \|^2 \( 1 + \| v \|^2 \), \( s + \| v \| \)^4) $
  is bounded for $0 < s lt.eq 1$ and tends to zero for each fixed $v eq.not 0$. Dominated convergence improves (5.30) to $o \( s^(- 1) \)$.
  For the near part put $q \( v \) = mu \( v \) "Re" \( overline(F \( v \)) A \( v \) \) 1_(N_s) \( v \)$. Hilbert norms give
  #[#set math.equation(numbering: n => "(5.31)")
   $ parallel q parallel_(L^2 \( bb(H) \))^2 lt.eq frac(K sup_(N_s) mu, s^2) integral_(N_s) s mu \| A \|^2 thin upright(d) A . $ <cal:mixed-near-input>]
  The truncated kernel $1_({ \| v \| < 2 s }) \/ \| v \|$ has $L^1$ norm $O \( s \)$. Young’s inequality, followed by the factor $O \( s^(- 1) \)$ converting an $L^2$ norm on $B_s$ to its normalized-area norm, therefore gives
  #[#set math.equation(numbering: n => "(5.32)")
   $ parallel upright("mixed near part") parallel_(L_(upright("av"))^2 \( B_s \)) & lt.eq frac(K \( sup_(N_s) mu \)^(1 \/ 2), s) (integral_(N_s) s mu \| A \|^2 thin upright(d) A)^(1 \/ 2)\
 & = o #scale(x: 120%, y: 120%)[\(] \( sup_(N_s) mu \)^(1 \/ 2) \/ s #scale(x: 120%, y: 120%)[\)] . $ <cal:mixed-near>]
  Hilbert-valued Young’s inequality follows from the scalar convolution inequality for the norm, so no finite-dimensional restriction is involved. Equations (5.27) and (5.27) yield precisely (5.21) and (5.22). This step uses weighted integral control of $A$, not a pointwise boundary bound.
  #emph[The bracket potential in (5.19).] Its far part is bounded by
  $ K integral_(bb(H)) frac(1 + \| v \|^2, \( s + \| v \| \)^2) thin upright(d) rho \( v \) = o \( s^(- 2) \) . $
  Indeed multiplication of the integrand by $s^2$ makes it bounded uniformly for $s lt.eq 1$ and tending to zero pointwise. Finite $rho$ then gives dominated convergence. For the near part, first integrate the singular kernel in $z$:
  $ & frac(1, \| B_s \|) integral_(B_s) integral_(N_s) frac(K mu \( v \) \| A \( v \) \|^2, \| z - v \|) thin upright(d) A \( v \) thin upright(d) A \( z \)\
 & #h(20mm)  lt.eq K / s integral_(N_s) mu \| A \|^2 thin upright(d) A = K / s^2 integral_(N_s) s mu \| A \|^2 thin upright(d) A = o \( s^(- 2) \) . $
  This proves (5.21) using only (5.18), and completes the proof. ◻
]

=== 5.7 Pole comparison, including singular clock time <cal:comparison-subsection>

#proof[
  Work at a time in the simultaneous full set of Lemma 28. The uniform leading expansion (5.21) implies $\| F \( z \)^2 \| asymp s^(- 1)$ on $B_s$ for all sufficiently small $s$. Consequently division by $F^2$ is legitimate there. Bilinearly squaring (5.21) and dividing by $4 F^2$ gives
  #[#set math.equation(numbering: n => "(5.33)")
   $ A \( z \) dot.op A \( z \) = frac(\| U \|^2, 4 pi z^3) + o \( s^(- 3) \) quad upright("in ") L_(upright("av"))^1 \( B_s \) . $ <cal:leading-square>]
  For example, if $R = 2 F A - U \/ \( pi z^2 \)$, the cross-error is controlled by $parallel U \/ \( pi z^2 \) parallel_(L_(upright("av"))^2) parallel R parallel_(L_(upright("av"))^2)$ and the quadratic error by $parallel R parallel_(L_(upright("av"))^2)^2$; multiplication by $1 \/ F^2 = O \( s \)$ gives the displayed order. This justifies the use of averaged errors in a bilinear, rather than Hermitian, square.
  Compare the cubic coefficients in (5.19), using (5.21). This yields
  #[#set math.equation(numbering: n => "(5.34)")
   $ frac(\| U \|^2, 4) = \| U \|^2 - 4 tau \, #h(2em) \| U \|^2 = 16 / 3 tau . $ <cal:bracket-density>]
  Coefficient comparison in these averaged statements can be read without pointwise subsequences: set $z = s zeta$, multiply by $s^3$, and test on the fixed disc $B \( upright(i) \, 1 \/ 4 \)$ against a smooth test with nonzero pairing with $zeta^(- 3)$. The lower-order and little-oh terms vanish.
  Consider first the singular part of the clock, where $tau = 0$. Equation (5.34) gives $U = 0$. Now the same weak mixed estimate gives the stronger conclusion
  $ A dot.op A = frac(R dot.op R, 4 F^2) = o \( s^(- 2) \) quad upright("in ") L_(upright("av"))^1 \( B_s \) . $
  In (5.19) only $nu \/ \( pi z^2 \)$ can remain at order $s^(- 2)$, by (5.21). Rescaling and testing at that order proves
  #[#set math.equation(numbering: n => "(5.35)")
   $ nu = 0 quad upright("on ") { tau = 0 } . $ <cal:singular-elimination>]
  In particular this conclusion has not used $J < oo$ on a set singular to capacity time.
  On ${ tau > 0 }$, (5.1) ensures $J < oo$ at $upright(d) L$-almost every time: a capacity-null set has zero $tau upright(d) L$ measure, hence zero $upright(d) L$ measure on ${ tau > 0 }$. We can therefore use (5.22) and (5.22). Uniformly on $B_s$,
  $ 1 / F^2 = pi z - pi^2 C z^2 + o \( s^2 \) . $
  The refined mixed remainder is $o \( s^(- 1) \)$ in normalized $L^2$; its cross term, after division by $F^2$, is $o \( s^(- 2) \)$ in normalized $L^1$. We obtain
  #[#set math.equation(numbering: n => "(5.36)")
   $ A dot.op A = frac(\| U \|^2, 4 pi z^3) - frac(\| U \|^2 C, 4 z^2) + o \( s^(- 2) \) . $ <cal:second-square>]
  Comparing the quadratic coefficients in (5.19), after cancelling the cubic ones, gives
  $ nu / pi - 2 C tau = - frac(\| U \|^2 C, 4) \, #h(2em) nu = frac(2 pi, 3) C tau . $
  Together with (5.35) this identity holds on the whole clock. Hence, in physical capacity time,
  $ upright(d) \[ W^(upright(M)) \]_t = 16 / 3 upright(d) t \, #h(2em) upright(d) V_t = frac(2 pi, 3) C_t thin upright(d) t . $
  The continuous martingale characterization of Brownian motion shows that $B = sqrt(3 \/ 16) thin W^(upright(M))$ is Brownian, with the harmless initial constant chosen to make $W_0 = 0$. Finally (5.8) and (5.1) give
  $ bb(E) integral_0^T C_t^2 thin upright(d) t lt.eq K bb(E) integral_0^T J_t^2 thin upright(d) t < oo . $
  This proves (5.3). The stochastic proof used the joint filtration only for the fermion martingales and their calculus. The energy input itself concerns the marginal driver law, so its use here does not require conditional crossing estimates in a larger, possibly anticipative filtration. ◻
]

== 6 Uniqueness of the continuum law <sec:uniqueness>

The preceding sections identify every bounded-domain subsequential limit with Equation (2.11). We now prove that the continuum prescription determines one law. The argument uses weak uniqueness for a measurable drift functional; it requires no Lipschitz estimate for the dependence of the boundary value problem on a slit.

=== 6.1 The coefficient as a path functional <the-coefficient-as-a-path-functional>

#thm([Lemma 6.1.])[
  #emph[There is a fixed nonanticipating progressively measurable extension of $C_t$ to continuous driving paths, agreeing with Equation (2.10) whenever its integral is finite. The same extension can be used for every candidate law in Definition 3.]
] <uni:measurable>

#proof[
  For a continuous driver and a fixed time, the Loewner ordinary differential equation determines the maps on all unswallowed compact sets. The inverse maps depend continuously on the driver on such protected sets. This also gives the marked kernel topology of $O_t$: in the centered chart the two marks are always $0 \, oo$.
  Proposition 2 supplies a unique $h_t$ and kernel-continuous interior values and gradients. To spell out the measurability consequence, exhaust $bb(H)$ by deterministic compact sets $K_j$ avoiding $0$ and the real line. The integrals
  $ C_t^(\( j \)) = 4 / pi integral_(K_j) P \( v \) m \| psi'_t \( v \) \| \| nabla \( h_t compose psi_t \) \( v \) \| thin upright(d) A \( v \) $
  are Borel functions of the stopped driver. One can first use compact sets on which the maps and their derivatives satisfy fixed protection bounds and then exhaust these bounds. The continuity assertion in Proposition 2 applies because all physical active domains lie in the fixed bounded domain $Omega$. Taking an increasing exhaustion $K_j$ makes $C_t = lim_j C_t^(\( j \))$ an extended nonnegative Borel function.
  All these constructions at time $t$ use only the path up to $t$. More explicitly they are Borel functions of $\( t \, x^t \)$, where $x^t \( s \) = x \( s and t \)$ and the stopped-path map is continuous on each finite time interval. They are therefore progressively measurable. Set the extension to zero on the measurable set where the extended integral is infinite or the prescription is undefined. The admissibility conditions retain the requirement that the actual integral be finite almost everywhere, so this convention adds no solutions by substituting a value on a positive-measure set of undefined coefficients. ◻
]

=== 6.2 A finite-energy uniqueness lemma <a-finite-energy-uniqueness-lemma>

The following formulation isolates a small point about energy stopping. Energy on an arbitrary reference Brownian path is allowed to become infinite immediately to the right of a time. Its first level need not then be attained continuously. The proof uses attainment under the candidate solution to fix the stopping rule under the comparison Wiener law.

#thm([Lemma 6.2.])[
  #emph[Let $kappa > 0$, and let $b \( t \, x \)$ be a fixed progressively measurable nonanticipating real functional on continuous paths starting at zero. There is at most one law of a continuous weak solution of 
#[#set math.equation(numbering: n => "(6.1)")
 $ upright(d) X_t = sqrt(kappa) thin upright(d) B_t + b \( t \, X \) upright(d) t \, #h(2em) X_0 = 0 \, $ <uni:generic-SDE>]

 among solutions satisfying 
#[#set math.equation(numbering: n => "(6.2)")
 $ integral_0^T b \( t \, X \)^2 upright(d) t < oo quad upright("almost surely") $ <uni:generic-energy>]

 for every finite $T$.]
] <uni:weak>

#proof[
  Fix a finite horizon $T$. On canonical path space define extended energy and its first level by
  $ A_t \( x \) = integral_0^t b \( s \, x \)^2 upright(d) s in \[ 0 \, oo \] \, #h(2em) sigma_n \( x \) = inf { t gt.eq 0 : A_t \( x \) gt.eq n } and T . $
  Use the usual right-continuous augmentation for stopping times. Even for extended energy, $sigma_n$ is a stopping time: the strict sublevel events ${ sigma_n < t }$ can be expressed using rational times less than $t$, and right continuity gives the weak sublevel events.
  Let $X$ be any candidate solution and put $tau_n = sigma_n \( X \)$. By Equation (6.2), $A_t \( X \)$ is finite and continuous on $\[ 0 \, T \]$, and $A_(tau_n) \( X \) lt.eq n$. The stochastic exponential
  #[#set math.equation(numbering: n => "(6.3)")
   $ Z_n = exp {- 1 / sqrt(kappa) integral_0^(tau_n) b \( s \, X \) upright(d) B_s - frac(1, 2 kappa) A_(tau_n) \( X \)} $ <uni:tilt>]
  is a true martingale density by the bounded-energy Novikov criterion; for this criterion and the following Girsanov change of measure, see [4] Section 5.3, Theorems 5.3.1–5.3.2 and (5.10). It is strictly positive. Under the equivalent measure $Q_n$ with density $Z_n$, the process
  $ tilde(B)_t = B_t + 1 / sqrt(kappa) integral_0^(t and tau_n) b \( s \, X \) upright(d) s \, #h(2em) 0 lt.eq t lt.eq T \, $
  is Brownian motion. Set $Y_t = sqrt(kappa) tilde(B)_t$. It has the full Wiener law $sans(W)_kappa$ on $\[ 0 \, T \]$ and agrees with $X$ through $tau_n$.
  Nonanticipation implies $A_t \( Y \) = A_t \( X \)$ for $t lt.eq tau_n$. If $tau_n < T$, that energy is strictly below $n$ earlier and equals $n$ at $tau_n$. Consequently
  #[#set math.equation(numbering: n => "(6.4)")
   $ sigma_n \( Y \) = tau_n . $ <uni:same-stop>]
  If $tau_n = T$, the paths agree on the whole horizon and the same identity holds. Possible nonintegrability of $b \( s \, Y \)^2$ immediately after $tau_n$ cannot change this first level: it has already been attained. This observation also proves, under the fixed full Wiener law, that $A_(sigma_n) \( Y \) lt.eq n$ almost surely. A hypothetical Wiener path whose energy jumps from below $n$ to infinity before this first attained prefix has Wiener measure zero whenever a finite-energy solution exists.
  The inverse of Equation (6.3), written under $Q_n$, is the canonical Wiener functional
  #[#set math.equation(numbering: n => "(6.5)")
   $ R_n \( y \) = exp {1 / kappa integral_0^(sigma_n \( y \)) b \( s \, y \) upright(d) y_s - frac(1, 2 kappa) A_(sigma_n \( y \)) \( y \)} . $ <uni:inverse>]
  The stopped energy bound just established defines this stochastic integral in $L^2 \( sans(W)_kappa \)$, and hence as a measurable functional of the canonical path, up to a single Wiener-null set. One may use predictable simple-process approximations to choose that version once for all candidate solutions. In particular, both the stopped path and its inverse density are fixed by the same Wiener law. For every bounded Borel functional $F$,
  #[#set math.equation(numbering: n => "(6.6)")
   $ bb(E) F \( X^(tau_n) \) = integral F \( y^(sigma_n \( y \)) \) R_n \( y \) thin sans(W)_kappa \( upright(d) y \) . $ <uni:stopped-law>]
  The right side does not depend on the candidate solution. Thus all candidate stopped laws coincide.
  Under each candidate, $A_T \( X \) < oo$ almost surely; hence $tau_n = T$ for all sufficiently large $n$ on each sample path. Bounded convergence in Equation (6.6) proves equality of the full laws on $\[ 0 \, T \]$. No assertion that $sigma_n arrow.r T$ under unweighted Wiener measure is needed. Since $T$ was arbitrary, the laws on the full continuous path space coincide. ◻
]

=== 6.3 Existence, curves and bounded approximations <existence-curves-and-bounded-approximations>

#thm([Proposition 6.3.])[
  #emph[Definition 3 determines exactly one law. Every admissible approximation whose physical domains have a common diameter bound converges to this law in the disc curve topology.]
] <uni:bounded>

#proof[
  Consider first any such approximating sequence. The marked basepoint normalization and common diameter bound place all its domains in a fixed physical ball. Proposition 11 gives tightness jointly for curves and drivers; every subsequential limit has the full continuous Loewner trace and terminal completion required in Definition 3. Proposition 24, together with Proposition 16, identifies its driver as a weak solution of Equation (2.11) with Equation (2.12).
  Apply Lemma 31 to the extension in Lemma 30, with $kappa = 16 \/ 3$ and $b = \( 2 pi \/ 3 \) C$. Every admissible continuum solution has the same driving law. A continuous driving path determines its Loewner hulls. Whenever it has a trace, that trace at each finite time is the boundary limit
  $ lim_(y arrow.b 0) phi.alt^(- 1) #scale(x: 120%, y: 120%)[\(] g_t^(- 1) \( W_t + upright(i) y \) #scale(x: 120%, y: 120%)[\)] \, $
  read in disc coordinates if a physical boundary value is ambiguous. Thus the full capacity trace, its orientation and its continuous terminal completion are determined by the driver. Inserting an extra curve in a swallowed component would violate the trace requirement and does not create another admissible curve law.
  Existence requires only one bounded approximation. Such approximations exist, for example on square rhombic meshes: exhaust $Omega$ by simply connected polygonal interiors, approximate a chosen interior access sequence for each marked prime end, and then refine the mesh diagonally. The polygonal approximation can be kept in a fixed neighborhood of $Omega$; compact kernel convergence and convergence of the two prime-end coordinates are preserved by the diagonal choice. With any nomes having the required asymptotic ratio, compactness supplies a subsequential limit and hence an admissible continuum law.
  This use of a subsequence is an existence proof for the already specified continuum equation; the definition and uniqueness do not depend on its choice. For every bounded admissible approximation, all tight subsequences have that unique law. The subsequence criterion gives full-sequence convergence. Section 7 removes the common diameter restriction. ◻
]

#prodef([Remark 6.4.])[
  The uniqueness argument localizes energy on finite capacity horizons. It needs neither a global Novikov condition nor a comparison of complete infinite-horizon curve laws. In particular, no assertion of mutual absolute continuity at infinite capacity is used in Theorem 1.
]

== 7 Localization of arbitrary approximating domains <loc:section>

Marked kernel convergence to a bounded domain does not bound the diameters, areas, or numbers of remote appendages of its approximants. Thus Proposition 32 does not yet prove the full theorem. We reduce the general case to that proposition by a finite edge exploration. The exploration will leave an ordinary bounded Dobrushin problem, with probability tending to one, and change the transferred curve by a vanishing amount. Every probability estimate below uses rectangles in a fixed bounded physical region. The deterministic gates belong to the original domain and organize the probability estimates; their shadows are the components separated from the basepoint. After the endpoint heads have been explored, portals bound monochromatic caps, which a cluster search shields with high probability while preserving the conditional FK law on success.

Let $\( Omega_n \, a_n \, b_n \)$ be an arbitrary sequence in the theorem, with mesh $delta_n arrow.r 0$. Translate the fixed kernel basepoint to $0$, and write

$ chi_n : Omega_n arrow.r bb(D) \, #h(2em) f_n = chi_n^(- 1) $

for the normalized disc maps. Their kernel limit is $chi : Omega arrow.r bb(D)$, with inverse $f$. Fix once and for all

$ S > sup_(z in Omega) \| z \| + 10 . $

All subsequent subsequences retain this choice of $S$.

=== 7.1 Two uniformization lemmas <two-uniformization-lemmas>

#thm([Lemma 7.1.])[
  (Small parameter shadows of remote pieces).  #emph[For every connected interior arc $E_n subset Omega_n \\ B \( 0 \, S - 1 \)$, its disc image has diameter tending to zero, uniformly over the choice of arc. The same is true for the noncentral shadow of a crosscut contained there.]
  #emph[More precisely, fix a point $xi in partial bb(D)$, a positive parameter tolerance $a$, and a positive physical tolerance $rho$. For all sufficiently large $n$, one can choose $s_n$ in a fixed interval $\[ s_(-) \, s_(+) \] subset \( 0 \, a \)$ such that the entire preimage of $partial B \( xi \, s_n \) ∩ bb(D)$ is contained in $B \( 0 \, S - 2 \)$ and has length at most $rho$. The endpoints and shadows are understood in the prime-end compactification. The conclusion holds simultaneously for finitely many specified $xi$’s, with disjoint parameter caps when those points are distinct.]
] <loc:remote>

#proof[
  Choose as many consecutive fixed dyadic rings about $xi$ as needed, all with radii below $a$. For a radius $s$ in their range, the circular crosscut contains the inward radial point $\( 1 - s \) xi$. All these radial points belong to a fixed compact subset of $bb(D)$, because the smallest radius is positive. Compact convergence of $f_n$ puts their physical images in a fixed neighborhood of the bounded limit domain. In particular they are separated from $partial B \( 0 \, S - 2 \)$ by a positive gap $g$, uniformly for all large $n$.
  Let $L_n \( s \)$ be the length of only that part of $f_n \( partial B \( xi \, s \) ∩ bb(D) \)$ lying in $B \( 0 \, S - 2 \)$. Polar Cauchy–Schwarz and univalence imply
  #[#set math.equation(numbering: n => "(7.1)")
   $ integral L_n \( s \)^2 thin frac(upright(d) s, s) lt.eq 2 pi integral_(f_n^(- 1) \( B \( 0 \, S - 2 \) \)) \| f'_n \( z \) \|^2 thin upright(d) A \( z \) lt.eq 2 pi^2 \( S - 2 \)^2 . $ <loc:restricted-area>]
  The right side bounds only the area of a fixed physical ball. It makes no assumption on $"area" \( Omega_n \)$. By taking enough fixed dyadic rings, a regular radius can be selected for which $L_n \( s \) < min \( rho \, g \)$. If its full preimage arc left the physical ball, the segment from the anchored radial point to its first exit would already have length at least $g$ inside the ball, contradicting this inequality. The whole arc therefore stays in the ball and has length at most $rho$. Radii can be chosen away from the finitely many contour degeneracies of the polygon.
  For a fixed prescribed parameter accuracy, apply this construction to a finite collection of circle points whose small caps cover $partial bb(D)$. Images of remote arcs lie uniformly close to $partial bb(D)$: every fixed compact subset of $bb(D)$ has bounded physical preimage contained in $B \( 0 \, S - 1 \)$ for all large $n$. They avoid the bounding crosscuts of the chosen caps, since those have physical preimages in $B \( 0 \, S - 2 \)$. Connectedness therefore traps each remote image in one of the small caps. This proves the uniform diameter assertion. If the remote arc is a crosscut, join its endpoints by the short boundary-circle interval. Its noncentral shadow is contained in the same cap.
  For finitely many distinct prescribed points, first choose disjoint outer parameter neighborhoods and then perform the selection within each. Every radius range remains fixed at this stage, although its lower endpoint can be very small. All mesh limits are taken after these ranges have been fixed. ◻
]

#thm([Lemma 7.2.])[
  (Small attached changes preserve normalized coordinates).  #emph[Let $V_n subset bb(D)$ be the simply connected component containing $0$ after removing finitely many closed, piecewise analytic obstructions and filling the other components. Assume that the obstructions lie within distance $epsilon_n arrow.r 0$ of $partial bb(D)$, and that every point on an obstruction can be joined to $bb(C) \\ bb(D)$ within the removed set by a connected set of diameter at most $epsilon_n$. Then the normalized maps $F_n : bb(D) arrow.r V_n$ satisfy 
#[#set math.equation(numbering: n => "(7.2)")
 $ sup_(overline(bb(D))) \| F_n \( z \) - z \| arrow.r 0 . $ <loc:maps-identity>]

 For every prime-end occurrence $w = F_n \( zeta \)$, this also gives $\| F_n^(- 1) \( w \) - w \| arrow.r 0$, uniformly. The same conclusion holds for any number of such obstructions; no bound on their number or total length is required.]
] <loc:obstructions>

#proof[
  First note that filling preserves a small attachment property. The central component contains $\( 1 - epsilon_n \) bb(D)$. A point in a discarded component lies in the remaining boundary collar. Follow its outward radial segment to its first encounter with an obstruction or the circle. Before that encounter the segment stays in the same discarded component and has length at most $epsilon_n$. Append the obstruction’s small attachment when necessary. Every point of the filled complement thus has a connected route of diameter at most $2 epsilon_n$ to the old outer complement.
  We give a quantitative crosscut proof of (7.2). Suppress $n$ and suppose
  $ \( 1 - d \) bb(D) subset V subset bb(D) \, #h(2em) "diam" A_x lt.eq e $
  for a connected complement attachment $A_x$ from each complement point $x$ to the old exterior. The normalized map $F : bb(D) arrow.r V$ extends continuously to the physical boundary, since $V$ has a finite, locally connected piecewise analytic boundary, with occurrences retained at slits. Put $a = F' \( 0 \)$. Schwarz’s lemma, also applied to $F^(- 1)$ on $\( 1 - d \) bb(D)$, gives $1 - d lt.eq a lt.eq 1$. Schwarz–Pick applied to $F \( z \) \/ z$ yields
  #[#set math.equation(numbering: n => "(7.3)")
   $ \| F \( z \) - z \| lt.eq frac(2 d, 1 - \| z \|) . $ <loc:interior-map>]
  Fix $zeta in partial bb(D)$ and $0 < h < 1$. Length–area on the circular crosscuts $partial B \( zeta \, t \) ∩ bb(D)$, $h < t < sqrt(h)$, gives one whose image $sigma$ has length at most
  $ L_h = frac(2 pi, sqrt(log \( 1 \/ h \))) . $
  It contains $F \( \( 1 - t \) zeta \)$, whose distance from $zeta$ is at most $sqrt(h) + 2 d \/ h$ by (7.3). Let $p \, q$ be the endpoint occurrences of $sigma$. Their physical locations have distance at most $L_h$. Join them in the complement by their $e$-attachments and the shorter arc of $partial bb(D)$ between the attachment endpoints. This gives a connected complement set within distance $L_h + 3 e$ of $p$.
  The complement is locally path connected in the present finite-arc setting. For any $epsilon.alt > 0$, the joining continuum can therefore be replaced by a simple complement arc within its $epsilon.alt$-neighborhood. Together with $sigma$ it forms a Jordan curve. If the physical endpoints coincide, $sigma$ itself is the corresponding closed curve; the same separation argument applies to its two boundary occurrences. When
  $ 2 L_h + sqrt(h) + 2 d \/ h + 3 e + epsilon.alt < 1 \, $
  this curve is in a ball missing $0$. Its bounded side contains the noncentral image cap. It follows that
  $ \| F \( zeta \) - zeta \| lt.eq 2 L_h + sqrt(h) + 2 d \/ h + 3 e + epsilon.alt . $
  Let $epsilon.alt arrow.b 0$. The bound is uniform in $zeta$, and the maximum principle gives the same bound on $overline(bb(D))$. Choose $h$ small first and then $d \, e$ small. This proves (7.2). The argument uses the number of obstructions nowhere.
  Finally, if $w = F_n \( zeta \)$, then $\| F_n^(- 1) \( w \) - w \| = \| zeta - F_n \( zeta \) \|$. This proves the inverse statement with prime-end occurrences, without making an inverse single-valued at an unlabelled physical slit point. ◻
]

#prodef([Remark 7.3.])[
  Both lemmas apply to the cell collars used below. In the initial disc, each retained cell sector has vanishing diameter by Lemma 10. A boundary cell is attached to the old boundary through its own sector. Filling behind a boundary pinch is covered by the first paragraph of Lemma 35. The finite-arc boundary condition in that lemma is imposed only on the approximating polygons and their conformal images, not on the limiting domain $Omega$.
] <loc:collars>

=== 7.2 Mandatory gates in a bounded physical band <mandatory-gates-in-a-bounded-physical-band>

Set

#[#set math.equation(numbering: n => "(7.4)")
 $ s_j = S + 1 - frac(1, j + 1) \, #h(2em) 1 lt.eq j lt.eq N_n \, #h(2em) N_n = ⌊log_2 \( 1 \/ delta_n \)⌋ . $ <loc:levels>]

Perturb the levels, if necessary, by a fixed small fraction of their gaps so that all circular intersections are transverse to graph edges and avoid vertices. The estimates below are unchanged.

#thm([Lemma 7.4.])[
  (Visible gates and their ancestors).  #emph[Let $U_(n \, j)$ be the component of $Omega_n ∩ B \( 0 \, s_j \)$ containing $0$. Its visible exit arcs on $partial B \( 0 \, s_j \)$ are crosscuts of the initial domain, with pairwise disjoint noncentral shadows. Every point of $Omega_n$ outside that circle lies behind one mandatory visible gate: every path from $0$ to that point crosses it. A gate at a later level has one specified ancestor gate at every earlier level.]
  #emph[Call a gate at level $j$ large when its length is at least $2^(- j)$. There are at most $K_S 2^j$ large gates at that level. A chain of small ancestors at levels $j$ gives disjoint annuli centered on those ancestors, with inner radii $K 2^(- j)$ and outer radii $c_0 \( j + 2 \)^(- 2)$, for all sufficiently large $j$. Every path from a circle-$S$ portal to a point of radius $S + 2$, continued to $0$ within $B \( 0 \, S \)$, crosses these annuli.]
] <loc:gates>

#proof[
  For all large $n$, none of the indicated circles is wholly contained in $Omega_n$. Otherwise simple connectivity would put its full interior in $Omega_n$, contradicting kernel convergence to the much smaller bounded domain. At a generic circle, its components inside a finite polygon are open arcs with endpoints on boundary occurrences. Those incident to $U_(n \, j)$ are its visible gates.
  Cut the domain at all these circular arcs. The adjacency graph of the resulting components, with one edge for each crosscut, is a finite tree: successively adding disjoint proper crosscuts splits one simply connected component into two and preserves connectedness and absence of cycles. Root this tree at $U_(n \, j)$. The visible gates are exactly its root-adjacent edges, and their noncentral shadows are the corresponding disjoint branches. Every point outside the circle belongs to a nonroot component, so the unique first edge of its root path is its mandatory gate. Crosscut separation makes every domain path to that point cross this gate. The tree uses boundary occurrences, so the argument also applies at repeated physical vertices.
  A connected later gate lies outside every earlier circle and hence in one unique earlier shadow. For two disjoint crosscuts the root-oriented shadows are either disjoint or nested, by the same tree argument. These ancestors are therefore consistent across levels. A shadow may contain further components inside the earlier circle; this does not affect the root path or the mandatory-gate property.
  The total length of gates on a circle is at most $2 pi \( S + 1 \)$, proving the count for large gates. A small gate fits in a ball of radius $K 2^(- j)$ centered at any one of its points. Successive level gaps are comparable to $\( j + 2 \)^(- 2)$. Choose $c_0$ sufficiently small that the outer balls lie in disjoint radial bands, and omit finitely many initial levels so that their inner radii are smaller than the outer radii.
  The center-to-far-point route must cross each mandatory gate. Its appended core portion has radius at most $S$, whereas all gates have larger radius. Thus each crossing is on the original portal-to-far-point path. Its two endpoints lie outside every indicated outer ball, so visiting the small gate requires an annular crossing. At lattice scale the path and gate may be moved within incident cells. Since $2^(- j) gt.eq delta_n$ for $j lt.eq N_n$, these changes are absorbed by the fixed constant in the inner radius. The smallest radial gap between outer bands is at least $c \( N_n + 2 \)^(- 2)$. Since $delta_n \( N_n + 2 \)^2 arrow.r 0$, any fixed number of buffer cells preserves their disjointness uniformly through the moving final level $N_n$. ◻
]

=== 7.3 Preparing monochromatic portals <preparing-monochromatic-portals>

Fix an error tolerance for this stage of the argument and a finite integer $J$. At the levels $j lt.eq J$, there are only finitely many large gates, with a bound depending on $S \, J$ but not on $n$. By Lemma 34, each such gate and its shadow has vanishing disc diameter. Pass to a further subsequence, labeling the finitely many gates after stabilizing their numbers, so that their locations converge on $partial bb(D)$. Let $H$ be the resulting finite set of limiting locations; coincident limits are recorded only once.

We shall use two kinds of cuts: the physical circle $partial B \( 0 \, S \)$, and small parameter caps about $H$. Their preimages will be disjoint, because the latter cuts can be chosen inside $B \( 0 \, S - 2 \)$. The small caps are chosen to contain all large gates at the first $J$ levels. Before fixing their sizes, one must remove the possibility that a current mark lies on their distal side.

#thm([Lemma 7.5.])[
  (Protected endpoint explorations).  #emph[For every sufficiently small parameter tolerance $a > 0$, the two ends can be explored, each stopped before its first unpeeled cell on a protected fence, with the following properties:]
  + #emph[Each explored head has disc diameter at most $K a + o \( 1 \)$. The two heads lie in disjoint endpoint neighborhoods.]
  + #emph[The center has unqueried connected access chains to the two resulting front corners. These chains lie in $B \( 0 \, S - 1 \)$ and on the inner side of every proposed small $H$-cap and of the circle at $S$.]
  + #emph[Conditional on these local revelations, the connecting problem is an ordinary Dobrushin problem. In the initial disc its changes are attached obstructions of diameter at most $K a + o \( 1 \)$, with fillings behind them.]
  #emph[The preimages of the $H$-cap cuts can subsequently be chosen to have any prescribed small physical diameter $rho > 0$, while retaining these properties and containing the large gates at levels $j lt.eq J$.]
] <loc:heads>

#proof[
  The marked parameter endpoints converge to two distinct circle points. Around each choose a small circular cap of angular size at most $a$. These two caps are disjoint. Choose their bounding circular crosscuts using Lemma 34, so that their physical preimages lie in $B \( 0 \, S - 2 \)$. Call them endpoint fences. Their parameter radii are in fixed intervals and can be chosen to avoid every point of $H$ on the fences themselves. A point of $H$ coinciding with an endpoint is inside its fence. Other points of $H$ can be kept away by reducing the endpoint neighborhood first.
  Join a middle point of each fence to $0$ by fixed compact paths in the parameter disc. Their physical preimages stay in $B \( 0 \, S - 2 \)$ for all large $n$, by compact convergence. The paths, together with the fences, form two protected access chains. Now choose the still smaller disjoint caps about the points of $H$, applying Lemma 34 within fixed radius intervals. Their physical cuts have diameter at most $rho$. They avoid the protected paths and fences, since those are compact and their boundary endpoints are away from $H$. When an $H$-point is an endpoint limit, its cap is placed entirely behind that endpoint’s fence. For all large $n$, the finitely many large gates lie inside their designated $H$-caps.
  Replace each protected fence and access path by the chain of cells it crosses, including terminal boundary half-cells. A generic small perturbation avoids vertices, so the chain is connected through sides. Its disc distance from the original path tends to zero by Lemma 10. Explore from an endpoint until just before taking the turn in the first cell of its protected chain, even if that turn would be forced. No tile of that chain has been clipped.
  The stopping event is unavoidable for a path to the opposite endpoint, since that path must cross the fence. Before the stopping event, the explored head stays on the endpoint side of the fence, up to its neighboring cells. Thus its parameter diameter is at most $K a + o \( 1 \)$. No discarded component can contain the whole protected chain: its connected access has not been clipped, and the continuing path must still reach the fence. In particular the center-to-front-corner access remains on the continuing side. The two explorations are in disjoint endpoint neighborhoods and may be carried out in either order.
  Lemma 6 now gives an ordinary Dobrushin problem with the two front corners as its change points. The procedure has stopped on the first local arrival; it has not conditioned the unknown connecting path to hit an interior target. All head changes are within the two small parameter caps and are attached to the old boundary there. The active-side convention fills only components behind these obstructions. Their attachments and fillings satisfy Lemma 35. ◻
]

In the post-head domain, intersect the physical circle at $S$ and the preimages of the $H$-cap cuts with the domain. Take the crosscut components visible from the central component containing the two protected accesses. Call them #emph[portals]. They are disjoint; a single cutting line may contribute many portal fragments. Their distal caps have disjoint shadows and separate the central component from every route to $\| z \| > S + 1$. Both moving marks are on the central side. Consequently the distal boundary interval of every portal contains no boundary-change point and has a single color. This prime-end assertion, rather than a statement about unlabelled physical vertices, is what will permit exact FK shielding.

=== 7.4 A finite shielding exploration <a-finite-shielding-exploration>

Figure 1 illustrates the retained region and the exposed frontier in the shielding construction.

#thm([Lemma 7.6.])[
  (Exact shielding of a monochromatic cap).  #emph[Let a distal cap have boundary color $c$, with its portal strictly inside the physical cutoff $S + 3$. There is a finite edge exploration on its distal side with the following alternatives.]
  + #emph[On success, all retained parts of the cap have radius less than $S + 3 + K delta_n$. The new retained boundary is made of $c$-open diagonals attached to the original $c$-bank. Every queried edge lies outside or on that boundary, so the retained connecting problem has its ordinary Dobrushin conditional law.]
  + #emph[Failure implies an actual opposite-color path from radius at least $S + 3 - K delta_n$ to cells incident to the portal, with an endpoint error of at most $K delta_n$.]
  #emph[The same statements hold for all caps explored in a fixed order, stopping the entire surgery at its first failure. Conditioning on the complete successful revelation record imposes no further event on the unqueried central edges.]
] <loc:shield>

#proof[
  Declare all opposite-color vertices incident to cells of the cap reaching $\| z \| gt.eq S + 3$ to be seeds, and reveal the exterior cells. The seed region is topologically attached to the original cap bank. Indeed, from any point of its exterior component, an outward radial route reaches its first exit from the finite polygon while staying outside the cutoff; it cannot encounter the portal, which lies strictly further in. Include the cells of such routes in the exterior region when recording its boundary. This is a topological attachment of an exposed set. The seeds need not belong to one open opposite-color cluster.
  Search every opposite-color cluster meeting this region, revealing incident edges until its full inner frontier is known. Stop with failure if the search or its necessary clipping cells reach the portal buffer. On success, every edge at the inner frontier is closed for the searched color, hence is an open diagonal of color $c$, or is an original $c$-bank edge. The union of the seed region and the searched clusters is attached to the bank. Take the component containing the portal on its unsearched side, and fill the holes discarded on the other side. Its new boundary is therefore a collection of $c$-paths attached to that same bank, not a collection of interior wired islands.
  Every tested edge is either in the removed seed-and-cluster region or is one of the known frontier edges. None is strictly in the retained unqueried component. Conditioning on the full record, the FK spatial Markov property imposes exactly its original Dobrushin wires, extended by the new $c$-frontier. The retained interface cannot cross that frontier into the discarded side. The event of success is already determined by the record, so it imposes no extra condition on retained edges.
  For a failure witness, choose a reached vertex in the portal buffer and trace its searched-color cluster back to its first exterior seed. That seed is at radius at least $S + 3 - K delta_n$. The path between it and the last buffered cells consists of actual open edges; no artificial connection within the whole seed region is needed. If a last incident edge triggers failure before being queried, the known path ends only $K delta_n$ short of the portal, which gives the stated endpoint allowance.
  All constructions can be performed on incident sectors before identifying repeated boundary vertices. Frontiers of a multiply armed cluster or of a fragmented portal are treated on their accessible side. Filling holes removes them from the retained domain and does not query inside it. Apply the construction to caps in a deterministic order. On success in an earlier cap only a wired frontier outside the remaining core has been added, so the same argument restarts in every later cap. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((5.412, 0), (6.56, 2.46), fill: rgb("#ebebff"), stroke: none)
  line((1.312, 0), (6.56, 0), (6.56, 2.46), (1.312, 2.46), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((1.312, 0), (1.312, 2.46), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "densely-dashed"))
  line((5.412, -0.205), (5.412, 2.665), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((3.854, 0), (4.018, 0.328), (3.731, 0.574), (3.936, 0.82), (3.649, 1.107), (3.813, 1.435), (3.69, 1.722), (4.018, 2.009), (3.854, 2.46), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((6.15, 0.492), (5.576, 0.574), (5.002, 0.41), (4.346, 0.656), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((6.068, 1.23), (5.494, 1.312), (4.92, 1.148), (4.182, 1.312), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((4.92, 1.148), (4.51, 0.902), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  line((6.068, 2.05), (5.576, 1.886), (4.92, 2.132), (4.346, 1.886), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  content((0.123, 1.23), [protected#linebreak()core])
  line((0.738, 1.23), (1.189, 1.23), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.312, -0.123), [portal], anchor: "north", padding: 0.1176cm)
  content((2.46, 1.23), [unqueried#linebreak()retained side])
  content((3.854, 2.706), [#text(fill: rgb("#a60000"))[new $c$-frontier]], anchor: "south", padding: 0.1176cm)
  content((5.904, 3.075), [exterior seeds], anchor: "south", padding: 0.1176cm)
  content((5.412, -0.123), [cutoff $S+3$], anchor: "north", padding: 0.1176cm)
  content((3.28, -0.574), [#text(fill: rgb("#a60000"))[original bank has color $c$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Schematic shielding of one monochromatic cap. The searched clusters, drawn in blue on the distal side, grow from the exposed exterior region. Their tested inner frontier is open in the bank color $c$. On success, all queried edges are on the frontier or to its distal side; the retained region keeps an ordinary FK law. The picture illustrates the separation argument and is not an additional geometric assumption. ],
) <loc:fig-shield>

=== 7.5 A uniform bound on the failure probability <a-uniform-bound-on-the-failure-probability>

#thm([Lemma 7.7.])[
  (The gate product estimate).  #emph[With the first $J$ levels and their finite set $H$ fixed, let all $H$-cut preimages have diameter at most $rho$. Uniformly conditional on the two explored heads, the probability that the shielding procedure fails is bounded by 
#[#set math.equation(numbering: n => "(7.5)")
 $ & K \| H \| rho^alpha\
 & quad + K sum_(k > J) 2^k product_(j_(*) lt.eq j < k) K #scale(x: 120%, y: 120%)[\(] 2^(- j) \( j + 2 \)^2 #scale(x: 120%, y: 120%)[\)]^alpha\
 & quad + K delta_n^(- 2) product_(j_(*) lt.eq j lt.eq N_n) K #scale(x: 120%, y: 120%)[\(] 2^(- j) \( j + 2 \)^2 #scale(x: 120%, y: 120%)[\)]^alpha + o \( 1 \) . $ <loc:failure-bound>]

 Here $j_(*)$ and the constants are independent of $J \, n$ and of the unbounded part of the domain. In particular, the failure probability tends to zero by first taking $J$ large, then $rho$ small at that stage, and finally the mesh sufficiently small.]
] <loc:failure>

#proof[
  We compare all possible failure arms of one portal type and one bank color together. Inside an annulus separated from the portals and from the two ends of an arm, their accessible side banks are free for the intruding color. Lemma 7 applies to this union, including all portal fragments and boundary-sector occurrences. The comparison wires radial ends only; it counts actual open arms and permits arbitrary off-shell conditioning. It therefore gives product bounds in disjoint buffered annuli without a factor for the number of fragments. Earlier successful searches merely add favorable single-color frontiers and do not change this argument.
  If failure ends at a portal on an $H$-cut, the actual intrusion arm from Lemma 39 joins a ball containing that entire cut to a fixed outer radius, say $1 \/ 2$. The source is outside $S + 3 - O \( delta_n \)$, whereas the cut lies inside $S - 2$. Applying Lemma 7 to all fragments of that cut and summing over the finitely many $H$-cuts gives the first term in (7.5).
  Now suppose failure ends at a circle-$S$ portal. Join its endpoint to $0$ through the central core, which excludes the initial $H$-caps and stays inside radius $S$, up to the fixed cell buffer. Select a far point on the arm at radius $S + 2$. This center-to-far-point route has the mandatory initial gate sequence of Lemma 37.
  If any gate at a level $j lt.eq J$ is large, it lies inside its selected parameter $H$-cap. The arm therefore visits that cap, while its core extension stays on the inner side. It crosses the corresponding $H$-cut. This gives an arm through an annulus about the physically tiny cut, again up to a bounded number of cells. Circle-$S$ portals are outside these annuli because the $H$-cut lies inside $S - 2$. The union comparison for the circle-portal type therefore gives the same first term.
  Otherwise let $k > J$ be the first level at which the gate is large. There are at most $K 2^k$ choices for it, and each fixes all its ancestors. The earlier ancestors are small. Figure 2 illustrates their surrounding annuli. For $j_(*) lt.eq j < k$, the same arm crosses an annulus with inner scale $K 2^(- j)$ and outer scale $c_0 \( j + 2 \)^(- 2)$. These annuli lie in disjoint radial bands and miss the circle-$S$ portals. Both endpoints of the arm are outside the bands. Applying the conditional product bound gives
  $ K 2^k product_(j_(*) lt.eq j < k) K #scale(x: 120%, y: 120%)[\(] 2^(- j) \( j + 2 \)^2 #scale(x: 120%, y: 120%)[\)]^alpha . $
  The two possible bank colors cost only another fixed factor.
  Finally, if all gates through $N_n$ are small, specify the connected initial-domain sector of an incident cell at the first crossing of radius $S + 2$. That sector fixes the ancestor chain, since it is connected and lies outside all the tested circles. The angle bound gives cell areas at least $c_eta delta_n^2$ and bounded local degree. A bounded annular band therefore has at most $K delta_n^(- 2)$ possible terminal cells and sectors. The product through $N_n$ gives the last term.
  For completeness, the logarithm of the product through $k$ is
  $ - frac(alpha log 2, 2) k^2 + O \( k log \( k + 2 \) \) . $
  It dominates both the factor $2^k$ and, when $k = N_n$, the factor $delta_n^(- 2) = exp \( O \( N_n \) \)$. The last term vanishes, and the tail sum can be made arbitrarily small by increasing $J$. At every fixed stage the number $\| H \|$ is finite, so $rho$ can then make the first term small. Cell buffers and generic contour perturbations are absorbed once the stage is fixed and the mesh is sufficiently small. All comparison annuli have uniformly bounded physical radii. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0.9, -1.26), (2.34, 1.26), fill: rgb("#f7f7f7"), stroke: none)
  rect((3.33, -1.26), (4.59, 1.26), fill: rgb("#f7f7f7"), stroke: none)
  rect((5.49, -1.26), (6.57, 1.26), fill: rgb("#f7f7f7"), stroke: none)
  line((0, -1.575), (7.38, -1.575), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.38, -1.575), [outward], anchor: "west", padding: 0.1176cm)
  line((1.62, -1.26), (1.62, 1.26), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((1.62, -1.575), [$s_j$], anchor: "north", padding: 0.1176cm)
  line((3.96, -1.26), (3.96, 1.26), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((3.96, -1.575), [${s_(j+1)}$], anchor: "north", padding: 0.1176cm)
  line((6.03, -1.26), (6.03, 1.26), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((6.03, -1.575), [${s_(j+2)}$], anchor: "north", padding: 0.1176cm)
  bezier((0, 0.09), (1.62, 0.09), (0.72, 0.54), (1.08, 0.18), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  bezier((1.62, 0.09), (3.96, -0.18), (2.52, -0.63), (3.24, -0.45), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  bezier((3.96, -0.18), (6.03, 0.315), (4.59, 0.54), (5.49, 0.45), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10))
  bezier((6.03, 0.315), (7.2, 0.225), (6.48, -0.09), (6.93, 0.18), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((1.62, -0.081), (1.62, 0.261), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((3.96, -0.306), (3.96, -0.054), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  line((6.03, 0.225), (6.03, 0.405), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  circle((1.62, 0.09), radius: 0.63, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.62, 0.09), radius: 0.207, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.96, -0.18), radius: 0.54, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.96, -0.18), radius: 0.153, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.03, 0.315), radius: 0.45, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.03, 0.315), radius: 0.108, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.62, 1.35), [small ancestor], anchor: "south", padding: 0.1176cm)
  content((4.95, 1.35), [disjoint buffered bands], anchor: "south", padding: 0.1176cm)
  content((3.96, -2.34), [inner scale $2^(-j)$, outer scale $c_0(j+2)^(-2)$])
})],
  caption: [Figure 2: Schematic gate hierarchy, with the radial direction flattened for clarity. Short segments mark gates, pairs of circles bound their annuli, and shaded strips mark disjoint radial bands. The curved intrusion arm visits each mandatory small ancestor and therefore crosses every surrounding annulus. The exponentially small inner scales and polynomially spaced outer scales give the product in (7.5). ],
) <loc:fig-gates>

=== 7.6 Reduction, mixtures, and the full theorem <reduction-mixtures-and-the-full-theorem>

#thm([Proposition 7.8.])[
  (Reduction to bounded Dobrushin problems).  #emph[From every admissible approximation sequence one can extract a further subsequence and perform finite edge revelations with success probability tending to one, so that on success:]
  + #emph[the unqueried connecting domain $hat(Omega)_n$ is a Dobrushin polygon on the original mesh with the same thermal parameters and diameter at most $2 S + 20$;]
  + #emph[conditional on the complete revelation record, its interface has the ordinary Dobrushin FK law;]
  + #emph[every deterministic sequence of possible successful outputs $\( hat(Omega)_n \, hat(a)_n \, hat(b)_n \)$ converges in the marked Carathéodory sense to $\( Omega \, a \, b \)$;]
  + #emph[the normalized coordinates on the retained domain are uniformly $o \( 1 \)$ from its original normalized coordinates, including prime-end occurrences, and the removed endpoint heads have vanishing disc diameter.]
  #emph[All error bounds are uniform over successful outcomes.]
] <loc:reduction>

#proof[
  Let the prescribed parameter accuracy and failure probability decrease to zero in stages. At one stage, choose $J$ so that the tail in (7.5) is smaller than its failure tolerance. Pass to the subsequence determining the finite set $H$. Choose endpoint fences with the prescribed small parameter size and protect their access chains. Next choose the $H$-caps with still smaller parameter size and physical cut diameter $rho$ making the first term of (7.5) small. Only then take the mesh small enough for all deterministic contour and cell comparisons at that stage. Iterate and take a diagonal subsequence.
  On success, Lemma 39 has removed all parts beyond $S + 3 + K delta_n$. The central core and the two front corners remain, and every new boundary is a wired extension of one original bank. This proves the uniform diameter assertion and the conditional-law assertion. The failure probability tends to zero by Lemma 40.
  It remains to verify coordinate control uniformly in the explored outcomes. In initial disc coordinates, the removed heads and their filled components are small attached obstructions by Lemma 38. Thus their removal changes normalized coordinates by $o \( 1 \)$ along the diagonal stages, by Lemma 35.
  The portals in the resulting domain also have uniformly vanishing parameter diameter. For the $H$-portals this follows from their chosen angular sizes. For circle-$S$ portals it follows from Lemma 34, since the entire circle is outside $B \( 0 \, S - 1 \)$. Their noncentral shadows are consequently small. Every subsequent searched or discarded portion lies behind one of these portals. Its points attach to the old boundary within that small shadow. Any remaining boundary-cell modifications have vanishing parameter diameter by Lemma 10 and attach through their incident sectors. Filling discarded components preserves the small attachment property. A second application of Lemma 35 therefore gives uniform $o \( 1 \)$ closeness between the final and initial normalized maps.
  In particular all fixed kernel compacts are eventually unmodified; the successive cuts lie in parameter neighborhoods shrinking to the circle. The two new marks are within the endpoint fence neighborhoods, whose diameters tend to zero. This proves marked Carathéodory convergence of every deterministic sequence of successful outputs. The same reasoning is uniform over outcomes, because only the deterministic stage tolerances, cell sizes, and parameter shadows were used.
  Finally the original curve on success is the first head, followed by the retained interface, followed by the reverse of the second head. Its middle part is exactly the ordinary conditional interface already described. Uniform coordinate closeness and vanishing head diameters show that this concatenation and the retained curve have distance $o \( 1 \)$ in the oriented uniform metric modulo increasing reparametrization. One may allocate a vanishing parameter interval to each head, or use continuous nondecreasing reparametrizations and approximate them by strictly increasing ones. This proves the last assertion. ◻
]

#thm([Corollary 7.9.])[
  (Universality without a diameter assumption).  #emph[For $m > 0$, every approximation sequence in Theorem 1 converges to the law of Definition 3, in the specified normalized-disc curve topology.]
] <loc:universality>

#proof[
  Apply Proposition 41 to any subsequence. Conditional on a successful record, the retained law is one of the bounded laws of Proposition 32. Their convergence is uniform over the possible successful outputs in the required sequential sense. Indeed, if a bounded continuous test function of curves had an error bounded below along some sequence of outputs, choosing one such output at each mesh would contradict that proposition, since every chosen domain sequence has the same marked limit and a common diameter bound.
  Integrate this convergence against the distribution of the successful records. The failure probability vanishes, and the original and retained curves have vanishing distance on success. Thus this further subsequence converges to the same continuum law. Every subsequence admits such a further subsequence, which proves full-sequence convergence. In particular the limiting law is independent of the lattices, domain approximations, and nome sequence. ◻
]

===== 7.6.1 Negative mass and completion of the theorem. <negative-mass-and-completion-of-the-theorem.>

For $m < 0$, exchange primal and dual vertices and the corresponding rhombus diagonals. The prescribed negative abstract angle is the complement of the positive abstract angle at the complementary geometric half-angle. Hence the two sine factors in the loop weight are exchanged exactly, while the number of closed loops and the angle bound are preserved. The two boundary banks exchange roles. Apply the positive-mass construction on the dual domain with the starting and terminal marks interchanged, and reverse the resulting oriented path. Any boundary half-cell adjustment has vanishing normalized diameter by Lemma 10 and the attachment argument above. This yields the claimed continuum characterization and full-sequence universality for the negative branch as well. Together with Proposition 32, Corollary 42 proves Theorem 1.

#heading(level: 1)[References]
#bibitem([1])[Dmitry Chelkak, Hugo Duminil-Copin, Clément Hongler, Antti Kemppainen, and Stanislav Smirnov, #emph[Convergence of Ising interfaces to Schramm's SLE curves], Comptes Rendus. Mathématique #strong[352] (2014), no.~2, 157--161. #link("https://doi.org/10.1016/j.crma.2013.12.002")[doi:10.1016/j.crma.2013.12.002]. #link("https://arxiv.org/abs/1312.0533v2")[arXiv:1312.0533v2].]
#bibitem([2])[Dmitry Chelkak and Stanislav Smirnov, #emph[Universality in the 2D Ising model and conformal invariance of fermionic observables], Inventiones Mathematicae #strong[189] (2012), no.~3, 515--580. #link("https://doi.org/10.1007/s00222-011-0371-2")[doi:10.1007/s00222-011-0371-2]. #link("https://arxiv.org/abs/0910.2045v2")[arXiv:0910.2045v2].]
#bibitem([3])[Antti Kemppainen and Stanislav Smirnov, #emph[Random curves, scaling limits and Loewner evolutions], Annals of Probability #strong[45] (2017), no.~2, 698--779. #link("https://doi.org/10.1214/15-AOP1074")[doi:10.1214/15-AOP1074]. The version used for numbered statements is #link("https://arxiv.org/abs/1212.6215v3")[arXiv:1212.6215v3] (2015).]
#bibitem([4])[Gregory~F. Lawler, #emph[Stochastic Calculus: An Introduction with Applications], author-hosted text, revised 15 February 2023. #link("https://www.math.uchicago.edu/~lawler/finbook.pdf").]
#bibitem([5])[Nikolai Makarov and Stanislav Smirnov, #emph[Off-critical lattice models and massive SLEs], in #emph[XVIth International Congress on Mathematical Physics], World Scientific, Hackensack, NJ, 2010, pp.~362--371. #link("https://doi.org/10.1142/9789814304634_0024")[doi:10.1142/9789814304634\_0024]. #link("https://arxiv.org/abs/0909.5377v1")[arXiv:0909.5377v1] (2009).]
#bibitem([6])[S.~C. Park, #emph[Convergence of fermionic observables in the massive planar FK-Ising model], Communications in Mathematical Physics #strong[396] (2022), 1071--1133. #link("https://doi.org/10.1007/s00220-022-04488-6")[doi:10.1007/s00220-022-04488-6]. The version used for numbered statements is #link("https://arxiv.org/abs/2103.04649v3")[arXiv:2103.04649v3] (2022).]
#bibitem([7])[Christian Pommerenke, #emph[Boundary Behaviour of Conformal Maps], Grundlehren der mathematischen Wissenschaften, vol.~299, Springer-Verlag, Berlin, 1992. #link("https://doi.org/10.1007/978-3-662-02770-7")[doi:10.1007/978-3-662-02770-7].]
#bibitem([8])[Stanislav Smirnov, #emph[Conformal invariance in random cluster models. I. Holomorphic fermions in the Ising model], Annals of Mathematics #strong[172] (2010), no.~2, 1435--1467. #link("https://doi.org/10.4007/annals.2010.172.1435")[doi:10.4007/annals.2010.172.1435]. #link("https://arxiv.org/abs/0708.0039")[arXiv:0708.0039].]


