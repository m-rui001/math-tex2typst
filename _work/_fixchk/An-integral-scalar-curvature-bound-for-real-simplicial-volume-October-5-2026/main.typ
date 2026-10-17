#import "@preview/cetz:0.5.0"
#let page_rotate = rotate
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#set figure(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[An integral scalar curvature bound for real simplicial volume]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The simplicial volume of a closed connected oriented $n$-manifold $M$ is the $ell^1$-seminorm of its real fundamental class:

$ parallel M parallel = inf {sum_j \| a_j \| : sum_j a_j sigma_j upright(" is a finite real singular cycle representing ") \[ M \]_(bb(R))} . $

It measures topological complexity through the cost of a fundamental cycle. Gromov’s work on bounded cohomology connected this invariant with Riemannian volume under lower Ricci curvature bounds [10]. A lower scalar curvature bound retains much less directional information. The possibility that it still controls simplicial volume is therefore a particularly strong relation between local geometry and global topology.

In 1986, Gromov proposed precisely the integral estimate considered here: Conjecture 3.A, Remark (B), Equation (8$'$) of [11] asks for a dimension-dependent upper bound on simplicial volume by the integral of the $n \/ 2$-power of the negative part of scalar curvature. With

$ "Scal"_g^(-) := max { 0 \, - "Scal"_g } \, $

the integral $integral_M \( "Scal"_g^(-) \)^(n \/ 2) thin d V_g$ is invariant under constant rescaling of $g$. It records both the size and the concentration of negative scalar curvature.

The conjecture is closely related to the uniform volume assertion

$ "Scal"_g gt.eq - kappa^2 quad arrow.r.double quad parallel M parallel lt.eq C_n kappa^n "Vol"_g \( M \) \, #h(2em) kappa gt.eq 0 . $

Although the integral formulation keeps track of a varying scalar curvature, the two assertions, when required for every manifold and metric in a fixed dimension $n gt.eq 3$, are equivalent by the Yamabe reformulation. A precise statement appears in [18] Lemma 2.1.

Several results establish related forms under additional geometric or topological hypotheses. Braun and Sauer prove a macroscopic counterpart when the volumes of unit balls in the universal cover have a uniform upper bound; their constant also depends on that bound [3] Theorem 1.1. For the qualitative case of nonnegative scalar curvature, Ma, Wang, Xie, Yu, and Zhu prove vanishing when the universal cover is spin [16]. Min, Zheng, and Zhu prove the integral estimate for every Riemannian metric on every closed Kähler surface, with coefficient $27 \/ 2$ in the upper bound for $parallel M parallel$, and also treat an infinite family of non-Kähler symplectic four-manifolds [18] Theorem 1.2 and Section 4.

Our argument uses the vanishing theorem of the companion manuscript [20] Corollary 1.5: a closed connected oriented smooth manifold of positive dimension admitting a metric of nonnegative scalar curvature has zero real simplicial volume. We state the exact input in Theorem 2. The work of this paper is the passage from that qualitative vanishing result to a uniform quantitative estimate.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 3$, there is a constant $a_n > 0$, depending only on $n$, such that every closed connected oriented smooth $n$-manifold $M$ and every smooth Riemannian metric $g$ on $M$ satisfy 
$ integral_M \( "Scal"_g^(-) \)^(n \/ 2) thin d V_g gt.eq a_n parallel M parallel . quad "(1.1)" $ <eq:main>

]
] <thm:main>

For example, a metric with $"Scal"_g gt.eq - n \( n - 1 \)$ satisfies

$ "Vol"_g \( M \) gt.eq a_n \[ n \( n - 1 \) \]^(- n \/ 2) parallel M parallel . $

The constant is uniform over the topology of $M$ and over all its metrics. In particular, (1.1) permits the negative scalar curvature to be concentrated in a small region.

=== The route to the estimate <the-route-to-the-estimate>

The first step is a conformal reduction. If $parallel M parallel > 0$, the vanishing input forces the Yamabe minimizer in every conformal class to have negative scalar curvature. Normalize it to scalar curvature $- 1$. Hölder’s inequality bounds the volume of this normalized metric by the integral in (1.1) for the original metric. It remains to prove

$ parallel M parallel lt.eq C_n "Vol"_g \( M \) #h(2em) upright("when ") "Scal"_g = - 1 . $

This reduction is given in Proposition 3. The quantitative argument begins with this normalized problem.

Bounded cohomology supplies a cocycle of supremum norm at most one whose value $I$ on the fundamental class is at least $parallel M parallel \/ 2$. We realize it as a closed differential form on a simplex of probability vectors. An equivariant probability map from the universal cover pulls this form back with integral $I$. Thus the remaining task is to control this integral by the original volume.

The first construction changes the metric and the probability map together. For a metric $h$ and weight $phi.alt$, the relevant scalar quantity is

$ cal(S) \( h \, phi.alt \) = "Scal"_h - 2 Delta_h phi.alt - \| d phi.alt \|_h^2 . $

With $phi.alt = - f$, this is Perelman’s modified scalar curvature for the measure $e^(- f) d V_h$ [21] Section 1.3. A graph deformation enlarges $h$ while changing $phi.alt$ so that $e^phi.alt d V_h$ is preserved. Its scalar identity contains positive squares and a derivative of the prescribed weighted mean curvature. This adapts the graph stabilization and prescribed-curvature method of [20] Proposition 4.1 and Theorem 5.2. Choosing that prescription in terms of one probability coordinate at a time gives a gain in the energy of the probability map. Iterating the construction produces a measured equivariant family over $M$, with a density $rho lt.eq d V_g$, a new metric and weight, and a large coefficient $E$ satisfying the leafwise inequality

$ cal(S) \( h \, phi.alt \) gt.eq - C_n + 2 log frac(d V_h, rho) - n log E + E \| d F \|_(h \, upright("HS"))^2 . $

Integrals over this family include its auxiliary probability measure. The logarithmic volume term and the energy term have distinct roles: the first will cancel the volume expansion, and the second will pay for derivatives of comparison coordinates. The construction also makes $\| d F \|_(h \, upright("HS"))$ small in absolute terms. This allows its label overlaps to be controlled through a fixed graph even after many deformations. Theorem 9 states the full result, including the relation between $E$ and the complexity of that graph.

The second construction estimates the degree of a map from a measured family of $d$-manifolds to a $d$-cube. Its bound contains $- cal(S) \/ 2$ and a separate penalty for the derivative of each coordinate. The perimeter-minus-forcing functional is the $mu$-bubble functional used in scalar curvature geometry [12,4]. Here an ordered family of its minimizing boundaries reduces the dimension one coordinate at a time. Their normal speed, or lapse, appears both in the scalar identity and in coarea, producing the needed cancellation. In high dimensions these boundaries can be singular. We move the residual map away from the target near the singular region, while weighted distance potentials supply the scalar gain needed to control the change. The resulting Theorem 16 is formulated for general controlled measured bands; it does not depend on simplicial volume.

The final construction connects the cocycle integral $I$ to these degrees. Integrating the cocycle form on small primal grid cells gives a balanced chain of complementary dual cubes. This follows the probability-map and auxiliary-degree strategy of [20] Section 3. An unbiased rounding preserves the balance relations with integer multiplicities. We adapt Gaifullin’s reflected permutohedral realization [7,8], equipping the pairing choices with normalized probability laws and controlling the resulting smooth charts. An oppositely oriented mirror copy closes the unmatched faces. In the neighborhood used for comparison, the resolved family retains a side whose oriented pushforward is exactly the original rounded chain. The construction supplies the chart and metric bounds needed for the degree estimate and the final averaging.

Compare the probability map with the resolved dual cubes in dimension $q = n + m$, where $m$ is the dimension of a dual cube. Let $h \, rho \, E$ be the deformed metric, retained density, and energy coefficient produced above, and set $W = log \( d V_h \/ rho \)$. Assign the comparison lengths $L_T = b_(*) sqrt(E)$ in the $m$ directions tangent to the cube and $L_N = b_(*) sqrt(q E)$ in the $n$ normal directions, with $b_(*) > 0$ fixed dimensionally. The degree estimate contributes $\( L_T^m L_N^n \)^(- 1)$, the product metric contributes $L_T^m$, and the scalar term $2 W - n log E$ contributes $E^(n \/ 2) e^(- W)$. The factors involving $E$ and the volume density therefore satisfy

$ frac(L_T^m, L_T^m L_N^n) E^(n \/ 2) e^(- W) d V_h = b_(*)^(- n) q^(- n \/ 2) rho . $

On the straight part, where the resolution metric is pulled back from the flat cube, averaging the normal derivative penalties together with the Hilbert bound for the cocycle form costs at most $C_n q^(n \/ 2)$. For this contribution, if $r$ is the grid spacing, the cell coefficient, dual-cube volume, and density of grid centers contribute $r^n r^m r^(- q) = 1$. The seam contribution is controlled by its small coordinate volume. The required lower bound for $E$ is an elementary function of $q$, bounded by an exponential tower whose fixed height and base polynomial depend only on $n$. It is fixed by this transfer construction before the entropy theorem is applied. These balances bound the detector pairing by $I lt.eq C_n integral rho lt.eq C_n "Vol"_g \( M \)$.

Section 2 gives the conformal reduction and the detector. Section 3 establishes the graph identity, the prescribed graph equations, and the estimate for one sweep of the probability coordinates. Section 4 iterates that estimate and controls the label graph. Section 5 proves the degree theorem, including the treatment of singular hypersurfaces. Section 6 constructs the dual chains and their smooth resolution and completes the proof of Theorem 1.

== 2 Reduction and the bounded cohomology detector <sec:reduction-detector>

We first separate the conformal reduction from the quantitative part of the proof. We then construct a differential form on a simplex of probability vectors that detects simplicial volume. This form will remain fixed while the metric and the probability map are deformed.

=== 2.1 The conformal reduction <the-conformal-reduction>

We use the following result, stated here in the precise form needed.

#thm([Theorem 2.1.])[
  (OpenAI, Corollary 1.5 of [20]).  #emph[Let $M$ be a closed connected oriented smooth manifold of positive dimension. If $M$ admits a smooth Riemannian metric with nonnegative scalar curvature, then its real simplicial volume is zero.]
] <thm:vanishing-input>

In particular, the hypothesis permits scalar curvature to vanish identically. Theorem 2 is the only result from the companion manuscript invoked below without proof.

The Yamabe reformulation of the scalar curvature inequality is standard; [18] Lemma 2.1 records the equivalence of its uniform pointwise and integral forms. We include the short classwise reduction that identifies the use of the vanishing input.

#thm([Proposition 2.2.])[
  #emph[Fix $n gt.eq 3$. Suppose that a constant $C_n < oo$ has the following property: every closed connected oriented $n$-manifold with a smooth metric $h$ of constant scalar curvature $- 1$ satisfies 
$ parallel M parallel lt.eq C_n "Vol"_h \( M \) . quad "(2.1)" $ <eq:scalar-minus-one-target>

 Then every smooth Riemannian metric $g$ on every such manifold satisfies 
$ parallel M parallel lt.eq C_n integral_M \( "Scal"_g^(-) \)^(n \/ 2) thin d V_g . quad "(2.2)" $ <eq:yamabe-transfer>

]
] <prop:yamabe-reduction>

#proof[
  The assertion is immediate when $parallel M parallel = 0$, so assume that $parallel M parallel > 0$. Write $Y \( M \, \[ g \] \)$ for the Yamabe constant of the conformal class of $g$:
  $ Y \( M \, \[ g \] \) = inf_(u in C^oo \( M \) \, thin u > 0) frac(integral_M (frac(4 \( n - 1 \), n - 2) \| d u \|_g^2 + "Scal"_g u^2) d V_g, (integral_M u^(2 n \/ \( n - 2 \)) thin d V_g)^(\( n - 2 \) \/ n)) . $
  The Yamabe theorem, developed through the work of Yamabe, Trudinger, Aubin, and Schoen [25,24,2,23], gives a conformal metric attaining this value and having constant scalar curvature; see also [15] Section 11. Its scalar curvature is negative by Theorem 2. After a constant rescaling, it becomes a metric $h$ with $"Scal"_h = - 1$. Evaluating the Yamabe quotient at the constant function for this minimizing metric gives
  $ - Y \( M \, \[ g \] \) = "Vol"_h \( M \)^(2 \/ n) . $
  For each positive $u$, Hölder’s inequality gives
  $ integral_M "Scal"_g u^2 thin d V_g gt.eq - (integral_M \( "Scal"_g^(-) \)^(n \/ 2) thin d V_g)^(2 \/ n) (integral_M u^(2 n \/ \( n - 2 \)) thin d V_g)^(\( n - 2 \) \/ n) . $
  The gradient term in the Yamabe quotient is nonnegative. Taking the infimum therefore yields
  $ - Y \( M \, \[ g \] \) lt.eq (integral_M \( "Scal"_g^(-) \)^(n \/ 2) thin d V_g)^(2 \/ n) . $
  Consequently $"Vol"_h \( M \) lt.eq integral_M \( "Scal"_g^(-) \)^(n \/ 2) thin d V_g$, and (2.1) implies (2.2). ◻
]

For the rest of the proof we fix $M^n$ and $g$ with $"Scal"_g = - 1$, and prove (2.1). We may continue to assume $parallel M parallel > 0$.

=== 2.2 A bounded cocycle and its probability form <a-bounded-cocycle-and-its-probability-form>

Let $Gamma = pi_1 \( M \)$. This group is countable because $M$ has a finite triangulation. We use two standard facts about bounded cohomology with trivial real coefficients. First, duality between the $ell^1$-seminorm on homology and the supremum seminorm on bounded cohomology gives

$ parallel M parallel = sup {chevron.l beta \, \[ M \]_(bb(R)) chevron.r : beta in H_b^n \( M \; bb(R) \) \, med parallel beta parallel_oo lt.eq 1} . quad "(2.3)" $ <eq:bounded-duality>

See [10] Section 1.1. Second, the isometric Mapping Theorem identifies $H_b^k \( M \; bb(R) \)$ with $H_b^k \( Gamma \; bb(R) \)$ for every $k gt.eq 2$, through the classifying map. The version used here applies to connected countable CW spaces and preserves the seminorms. We use the Mapping Theorem of Gromov [10] Section 3.1 and its canonical group formulation in [13] Theorems 8.3 and 8.6.

We use the homogeneous model for group cochains. Thus an $n$-cochain is a bounded function on $Gamma^(n + 1)$, invariant under simultaneous left translation, and its coboundary is the alternating sum obtained by omitting one argument. Alternation is a cochain projection of norm at most one and is equivariantly cochain homotopic to the identity through maps bounded in each degree. It therefore preserves bounded cohomology classes [6] Section 4.10, Proposition 4.26. By (2.3), the Mapping Theorem, and approximation of the seminorm by cocycle representatives, there is a homogeneous alternating cocycle

$ c : Gamma^(n + 1) arrow.r bb(R) \, #h(2em) parallel c parallel_oo lt.eq 1 \, $

whose corresponding bounded singular cohomology class has value

$ I := chevron.l \[ c \] \, \[ M \]_(bb(R)) chevron.r gt.eq 1 / 2 parallel M parallel . quad "(2.4)" $ <eq:detector-value>

For completeness, one can choose a class in (2.3) with value at least $3 parallel M parallel \/ 4$, choose a group representative of norm at most $1 + epsilon$, alternate it, and divide by $1 + epsilon$, with $0 < epsilon lt.eq 1 \/ 2$. Replacing the cocycle by its negative first, if necessary, fixes the sign.

We allow a finite number of copies of every group label. More precisely, let $cal(L) = Gamma times { 1 \, dots.h \, s }$, with the free left $Gamma$-action on the first factor, and evaluate $c$ on $cal(L)^(n + 1)$ by projection to $Gamma^(n + 1)$. The same notation will be used when further finite copies of $cal(L)$ are introduced. Extend $c$ multilinearly to finitely supported vectors on $cal(L)$.

Let

$ Delta_(cal(L)) = {p = \( p_ell \)_(ell in cal(L)) : p_ell gt.eq 0 \, med sum_ell p_ell = 1 \, med p upright(" has finite support")} . $

On each finite-dimensional face define the $n$-form

$ eta_p \( v_1 \, dots.h \, v_n \) = n ! thin c \( p \, v_1 \, dots.h \, v_n \) . quad "(2.5)" $ <eq:probability-form>

These definitions agree on common faces.

We call a map $F = \( F_ell \)$ with nonnegative coordinates and $sum_ell F_ell^2 = 1$ a #emph[root probability map]. For the maps used here, whose coordinate supports are locally finite, the squared coordinates $p_ell = F_ell^2$ give the associated map to $Delta_(cal(L))$.

#thm([Proposition 2.3.])[
  #emph[The form $eta$ is closed on every finite-dimensional face of $Delta_(cal(L))$. There is a smooth $Gamma$-equivariant map 
$ F : tilde(M) arrow.r ell^2 \( cal(L) \) \, #h(2em) F_ell gt.eq 0 \, #h(2em) sum_ell F_ell^2 = 1 \, $

 with finitely many label orbits and locally finite compact supports for its coordinates. If $p_ell = F_ell^2$, then the descended form satisfies 
$ integral_M p^(*) eta = I . quad "(2.6)" $ <eq:detector-integral>

]
] <prop:detector>

#proof[
  Write $epsilon.alt \( v \) = sum_ell v_ell$ for the mass of a finitely supported vector. Multilinear extension of the cocycle equation gives
  $ 0 = sum_(j = 0)^(n + 1) \( - 1 \)^j epsilon.alt \( w_j \) c \( w_0 \, dots.h \, hat(w)_j \, dots.h \, w_(n + 1) \) . $
  Choose $w_0$ of mass one and let $w_1 \, dots.h \, w_(n + 1)$ have mass zero. It follows that $c \( w_1 \, dots.h \, w_(n + 1) \) = 0$. All tangent vectors to a probability simplex have mass zero. Differentiating (2.5) now shows $d eta = 0$.
  To construct $F$, choose finitely many evenly covered open sets in $M$ and smooth nonnegative bumps subordinate to them whose nonzero sets cover $M$. Lift each bump to one chosen sheet and take all its deck translates, denoting the resulting functions by $b_ell$. Their supports are compact and locally finite on $tilde(M)$. Set
  $ F_ell = b_ell / (sum_j b_j^2)^(1 \/ 2) . $
  The denominator is positive, and the stated properties follow.
  Choose a finite oriented triangulation of $M$. On its lift, assign one label to every vertex equivariantly, and let $p^(upright("aff"))$ be the probability map affine in barycentric coordinates on each simplex. The homotopy $\( 1 - t \) p + t p^(upright("aff"))$ is equivariant and has locally finite support. Applying Stokes’ theorem to each simplex times $\[ 0 \, 1 \]$, and cancelling the common faces, shows that its pullback integral is constant. On a simplex with ordered vertex labels $ell_0 \, dots.h \, ell_n$, write
  $ p^(upright("aff")) = e_(ell_0) + sum_(j = 1)^n t_j \( e_(ell_j) - e_(ell_0) \) . $
  Alternation makes the value of $c \( p^(upright("aff")) \, d p^(upright("aff")) \, dots.h \, d p^(upright("aff")) \)$ on the coordinate frame constant and equal to $c \( ell_0 \, dots.h \, ell_n \)$. The coordinate simplex has volume $1 \/ n !$, so the factor $n !$ in (2.5) makes its integral exactly this cocycle value. Summing over the oriented fundamental triangulation gives (2.6). The identification with the chosen group class is the usual cochain realization of the Mapping Theorem: an equivariant vertex labeling on the universal cover evaluates the homogeneous group cochain, and two such labelings give cochain-homotopic maps by the simplex prism construction. ◻
]

=== 2.3 Measured equivariant families <measured-equivariant-families>

The deformations below use auxiliary probability choices. We record their integration convention so that the detector value remains unambiguous.

Let $\( Omega \, mu \)$ be a standard Borel probability space with a measure-preserving $Gamma$-action. A measured equivariant family over $M$ consists of $Gamma$-equivariant Borel data on $tilde(M) times Omega$, smooth in the $tilde(M)$ variable. Geometrically one may regard the diagonal quotient

$ cal(M) = \( tilde(M) times Omega \) \/ Gamma $

as a space whose leaves are ordinary smooth manifolds. If $Gamma_omega$ is the stabilizer of $omega$, the corresponding leaf is $tilde(M) \/ Gamma_omega$; the deck action is free and proper in the $tilde(M)$ factor.

Related equivariant measured bundles are central to the macroscopic volume argument of Braun and Sauer [3] Sections 1.2 and 4. Here we need only Borel transverse data and use the following direct integration convention.

Choose a finite evenly covered atlas $U_a$ of $M$, chosen lifts $tilde(U)_a$, and a smooth partition of unity $chi_a$ subordinate to the atlas. For an integrable equivariant leafwise $n$-form $alpha$, set

$ integral_(cal(M)) alpha = sum_a integral_Omega integral_(tilde(U)_a) \( chi_a compose pi \) thin alpha_omega thin d mu \( omega \) . quad "(2.7)" $ <eq:measured-integral>

Equivariance and invariance of $mu$ show that this value is independent of the lifts and partition. The same convention applies to nonnegative densities. We write $d V_h$ for the resulting measured Riemannian density when $h = h_omega$ is a leafwise metric.

The data used in the first deformation will have bounds in a fixed finite lifted atlas that are uniform over $omega$. These bounds may depend on the instance: the original manifold and metric and the finite sequence of constructions already made. For the forms used here, these bounds ensure integrability over the compact base and justify differentiation and Fubini. Leafwise Stokes’ theorem follows from (2.7): apply ordinary Stokes’ theorem in each lifted chart to the partitioned form; the terms containing $d chi_a$ cancel on overlaps after the measure-preserving changes of transverse coordinate.

In particular, suppose that two equivariant probability maps $p^0 \, p^1$ have uniformly locally finite coordinate supports and uniform leafwise derivative bounds. Their affine homotopy has the same properties. Stokes’ theorem on the measured product with $\[ 0 \, 1 \]$ gives

$ integral_(cal(M)) \( p^0 \)^(*) eta = integral_(cal(M)) \( p^1 \)^(*) eta . $

Thus every probability map constructed below continues to detect the same number $I$. Enlarging $Omega$ by an independent probability space also preserves the integral by Fubini. We may discard invariant null sets whenever needed. More general measured spaces of leaves will enter the degree estimate in Section 5; their chart and integration conventions will be specified there.

== 3 Weighted graph deformations and a sweep <sec:graphs>

This section develops a deformation that changes the metric while preserving a weighted volume density. Its input is a smooth function on a Riemannian manifold; its output is the metric induced on the graph of that function. We first compute the change of weighted scalar curvature, then solve graph equations prescribing weighted mean curvature to control this change. A localized version of the construction will give an estimate for one sweep through the coordinates of a root probability map.

For a metric $h$ and a smooth weight $phi.alt$, write

$ cal(S) \( h \, phi.alt \) = "Scal"_h - 2 Delta_h phi.alt - \| d phi.alt \|_h^2 \, #h(2em) "div"_phi.alt V = e^(- phi.alt) "div" \( e^phi.alt V \) \, #h(2em) Delta_phi.alt = "div"_phi.alt nabla . $

Thus the weighted operators use $e^phi.alt d V_h$. The scalar quantity is Perelman’s $R^m$, with his $f = - phi.alt$ [21] Section 1.3. The estimates below concern its behavior under particular graph deformations. For antecedents of the graph and vertical Jacobi identities, see [20] Proposition 4.1; we include the calculation with the conventions needed here.

=== 3.1 The graph identity <the-graph-identity>

#thm([Lemma 3.1.])[
  (Weighted graph identity).  #emph[Let $\( X \, h \)$ be a smooth Riemannian manifold, let $phi.alt \, f$ be smooth real functions, and let $N > 0$. Set 
$ L = \( 1 + N^2 \| d f \|_h^2 \)^(1 \/ 2) \, #h(2em) v = L^(- 1) \, #h(2em) U = frac(N nabla_h f, L) \, #h(2em) h' = h + N^2 d f ⊗ d f \, #h(2em) phi.alt' = phi.alt - log L . $

 View $h'$ as the induced metric on the graph $Sigma = { \( x \, N f \( x \) \) : x in X }$ in $\( X times bb(R) \, h + d z^2 \)$, and extend $phi.alt$ constantly in the $z$-direction. Orient the graph by $nu = \( - U \, v \)$, put $upright("II") \( V \, W \) = chevron.l macron(nabla)_V nu \, W chevron.r$, and let 
$ H = "tr"_Sigma upright("II") \, #h(2em) D = H + partial_nu phi.alt = - "div"_phi.alt U . $

 Here $D$, and its derivative $U \( D \)$, are regarded as functions on $X$ through the graph projection. Then 
$ cal(S) \( h' \, phi.alt' \) - cal(S) \( h \, phi.alt \) = D^2 - 2 U \( D \) + \| upright("II") \|_(h')^2 + \| d log L \|_(h')^2 . quad "(3.1)" $ <eq:graph-identity>

 Moreover, 
$ e^(phi.alt') d V_(h') = e^phi.alt d V_h \, #h(2em) N^2 \| d f \|_(h')^2 = 1 - v^2 = \| U \|_h^2 \, #h(2em) \| d log L \|_(h') lt.eq L \| U \|_h \| upright("II") \|_(h') . quad "(3.2)" $ <eq:graph-basic-bounds>

]
] <lem:graph-identity>

#proof[
  Write $macron(h) = h + d z^2$, and suppress pullback by the graph projection. The formula for the graph mean curvature gives $H = - "div" U$, while $partial_nu phi.alt = - U \( phi.alt \)$; hence the stated formula for $D$ holds. The rank-one determinant formula gives $d V_(h') = L thin d V_h$, proving the first assertion in (3.2). The inverse rank-one formula gives its second assertion.
  Let
  $ P = \| upright("II") \|^2 + #scale(x: 120%, y: 120%)[\(] "Ric"_(macron(h)) - macron(nabla)^2 phi.alt #scale(x: 120%, y: 120%)[\)] \( nu \, nu \) . $
  The Gauss equation and the decompositions of the Laplacian and gradient of $phi.alt$ give
  $ "Scal"_(h') & = "Scal"_(macron(h)) - 2 "Ric"_(macron(h)) \( nu \, nu \) + H^2 - \| upright("II") \|^2 \,\
Delta_(macron(h)) phi.alt & = Delta_Sigma \( phi.alt \|_Sigma \) + H partial_nu phi.alt + macron(nabla)^2 phi.alt \( nu \, nu \) \,\
\| d \( phi.alt \|_Sigma \) \|^2 & = \| d phi.alt \|_(macron(h))^2 - \( partial_nu phi.alt \)^2 . $
  Since $cal(S) \( macron(h) \, phi.alt \) = cal(S) \( h \, phi.alt \)$, their combination is
  $ cal(S) \( h' \, phi.alt \|_Sigma \) = cal(S) \( h \, phi.alt \) + D^2 - 2 P + \| upright("II") \|^2 . quad "(3.3)" $ <eq:graph-gauss-weighted>
  Adding $log v$ to the restricted weight changes the left side by
  $ - 2 Delta_(Sigma \, phi.alt) log v - \| d log v \|^2 = - frac(2 Delta_(Sigma \, phi.alt) v, v) + \| d log v \|^2 . $
  The tangential part of vertical translation is
  $ T = partial_z - v nu = \( v U \, 1 - v^2 \) . $
  For a hypersurface variation with normal speed $v$, the variation of $H$ is $- Delta_Sigma v - \( \| upright("II") \|^2 + "Ric"_(macron(h)) \( nu \, nu \) \) v$. The additional variation of $partial_nu phi.alt$ is
  $ v macron(nabla)^2 phi.alt \( nu \, nu \) - chevron.l d \( phi.alt \|_Sigma \) \, d v chevron.r_Sigma . $
  Including the tangential velocity $T$, and using that vertical translation preserves the metric, weight, and $D$, therefore gives
  $ \( Delta_(Sigma \, phi.alt) + P \) v = T \( D \) . quad "(3.4)" $ <eq:graph-translation>
  The horizontal part of $T$ is $v U$, so $T \( D \) = v U \( D \)$. Substitution in (3.3) proves (3.1). Finally, differentiating $v = chevron.l nu \, partial_z chevron.r$ tangentially gives $d v \( V \) = upright("II") \( V \, T \)$. Since $\| T \|^2 = 1 - v^2 = \| U \|^2$, it follows that $\| d log v \| lt.eq v^(- 1) \| U \| \| upright("II") \|$, which is the last bound in (3.2). ◻
]

===== 3.1.1 A one-coordinate calculation. <a-one-coordinate-calculation.>

The square and differentiated terms in the graph identity suggest an ideal target for $N D$, the scaled weighted mean curvature. Let $F$ be one smooth input coordinate, restrict to a region where $f > 0$, and fix $epsilon.alt \, a > 0$. Also let $h_(upright("in")) lt.eq h$ be a comparison metric. In the later sweep, the incoming energy is measured in $h_(upright("in"))$, while $h$ already includes the earlier graphs.

Put $A = \| U \|_h$. Where $A > 0$, write $U = A e$ with $\| e \|_h = 1$. The longitudinal unit tangent to the graph is $tau = \( v e \, A \)$. Define

$ x = - upright("II") \( tau \, tau \) \, #h(2em) X_parallel = N x \, #h(2em) t = A^2 \/ f \, #h(2em) B = 1 - \| e \|_(h_(upright("in")))^2 in \[ 0 \, 1 \] . $

At $A = 0$, choose any $h$-unit vector $e$, put $tau = \( e \, 0 \)$, and use the same definitions. With $tau^flat$ denoting the dual covector in the graph metric $h'$, set

$ upright("II")^(upright("rem")) = upright("II") + x thin tau^flat ⊗ tau^flat . $

The component of $upright("II")^(upright("rem"))$ in the $tau^flat ⊗ tau^flat$ direction vanishes, so

$ N U \( f \) = L A^2 \, #h(2em) \| upright("II") \|_(h')^2 = x^2 + \| upright("II")^(upright("rem")) \|_(h')^2 \, #h(2em) "tr"_(h') upright("II")^(upright("rem")) = H + x \,\
x = e \( A \) quad upright("where ") A > 0 . quad "(3.5)" $ <eq:graph-longitudinal>

For the last identity, use $nu = \( - A e \, v \)$ and $A^2 + v^2 = 1$ to compute

$ upright("II") \( tau \, tau \) = - v^2 e \( A \) + A v thin e \( v \) = - e \( A \) . $

The first identity in (3.5) follows directly from the definitions of $U \, L \, A$.

Define the ideal target for $N D$ by

$ Z = epsilon.alt a \( F^2 \/ f - f \) + A^2 \/ \( 2 f \) . quad "(3.6)" $ <eq:graph-ideal-target>

Since $N U \( A^2 \) = 2 A^2 X_parallel$, with both sides zero at $A = 0$, differentiation gives

$ - 2 N U \( Z \) =  & - 4 epsilon.alt a \( F \/ f \) N A e \( F \) + 2 epsilon.alt a \( F^2 \/ f^2 + 1 \) L A^2\
 & - 2 X_parallel t + L t^2 . quad "(3.7)" $ <eq:graph-ideal-derivative>

The first term couples the prescribed $F^2 \/ f$ to the incoming energy. The $A^2 \/ \( 2 f \)$ term completes the longitudinal square:

$ X_parallel^2 - 2 X_parallel t + L t^2 = \( X_parallel - t \)^2 + \( L - 1 \) t^2 \,\
 & epsilon.alt N^2 \| d F \|_(h_(upright("in")))^2 - 4 epsilon.alt a \( F \/ f \) N A e \( F \)\
 & quad = epsilon.alt lr(|N thin d F - 2 a \( F \/ f \) A thin h_(upright("in")) \( e \, dot.op \)|)_(h_(upright("in")))^2 - 4 epsilon.alt a^2 \( F \/ f \)^2 A^2 \( 1 - B \)\
 & quad gt.eq - 4 epsilon.alt a^2 \( F \/ f \)^2 A^2 \( 1 - B \) . quad "(3.8)" $ <eq:graph-ideal-completions>

Consequently

$ & Z^2 - 2 N U \( Z \) + N^2 \| upright("II") \|_(h')^2 + N^2 \| d log L \|_(h')^2 + epsilon.alt N^2 \| d F \|_(h_(upright("in")))^2\
gt.eq  & Z^2 + \( X_parallel - t \)^2 + N^2 \| upright("II")^(upright("rem")) \|_(h')^2 + N^2 \| d log L \|_(h')^2\
 & + epsilon.alt A^2 #scale(x: 120%, y: 120%)[\[] \( 2 a - 4 a^2 \) F^2 \/ f^2 + 2 a #scale(x: 120%, y: 120%)[\]] + 4 epsilon.alt a^2 \( F^2 \/ f^2 \) A^2 B\
 & + \( L - 1 \) #scale(x: 120%, y: 120%)[\[] 2 epsilon.alt a \( F^2 \/ f^2 + 1 \) A^2 + t^2 #scale(x: 120%, y: 120%)[\]] . quad "(3.9)" $ <eq:graph-ideal-bound>

At $A = 0$, $t = 0$ and $\( X_parallel - t \)^2 + N^2 \| upright("II")^(upright("rem")) \|^2 = N^2 \| upright("II") \|^2$; every other direction-dependent term vanishes. Thus the inequality is independent of the arbitrary direction at such points.

This calculation is algebraic and assumes no equation for $D$. The complete equation below realizes $N D = Z - beta f$ up to a positive floor, and localization introduces controlled cutoff errors. A sweep will also have to account for normalization of the output map and the interaction of the ordered graph metrics.

=== 3.2 Prescribed graphs on complete leaves <prescribed-graphs-on-complete-leaves>

We specify the uniformity required for the analytic construction. A manifold has #emph[bounded geometry] here if it has coordinate charts of a common positive size whose smaller concentric domains cover the manifold, with a common positive buffer to each chart boundary, and with uniform bounds on the metric, its inverse, and all their coordinate derivatives. These bounds, as well as the chart size, may depend on the instance. A function is uniformly smooth if all its coordinate derivatives, including its value, are uniformly bounded on these charts. For a weight $phi.alt$, only positive-order derivatives are required to be uniformly bounded. The #emph[uniform Hölder space] below means the Banach space obtained by taking the supremum of the corresponding Hölder norms in these charts, after a fixed shrinkage within the buffers.

The use of complete prescribed graphs has precedents in [20] Theorem 5.2. The following statement records the precise uniform and measurable conclusions used here and in the hypersurface argument. Its positive branch realizes the designed prescription with a positive floor and will be localized for the sweep. Its tangent branch supplies the value approximation and the intrinsic gradient bound used in Section 5.

#thm([Lemma 3.2.])[
  (Prescribed graphs on a complete manifold).  #emph[Let $\( X \, h \)$ be a complete smooth Riemannian manifold without boundary, with bounded geometry as above, and suppose the positive-order derivatives of $phi.alt$ are uniformly bounded. For a graph of height $z$, set 
$ L_z = \( 1 + \| d z \|_h^2 \)^(1 \/ 2) \, quad v_z = L_z^(- 1) \, quad U_z = frac(nabla_h z, L_z) \, quad D_z = - "div"_phi.alt U_z . $

 Consider either of the following equations $D_z = p \( x \, z \, v_z \)$.]
  + #emph[Let $N \, epsilon.alt \, a > 0$, $0 < delta lt.eq 1$, and $H_(*) gt.eq 0$. Suppose $F_i \, beta$ are uniformly smooth, $\| F_i \| lt.eq 1$, and $0 lt.eq beta lt.eq H_(*)$. On the region $z > 0$, prescribe 
$ p \( x \, z \, v \) = frac(epsilon.alt a \( F_i \( x \)^2 + delta^2 \) + \( 1 - v^2 \) \/ 2, z) - \( epsilon.alt a + beta \( x \) \) z / N^2 . quad "(3.10)" $ <eq:graph-prescription-positive>

]
  + #emph[Let $e \, w > 0$ be constants. Suppose $B \, f_0$ are uniformly smooth and $B gt.eq B_min > 0$. On the region $\| \( f_0 \( x \) - e z \) \/ w \| < pi \/ 2$, prescribe 
$ p \( x \, z \, v \) = B \( x \) tan #scale(x: 120%, y: 120%)[\(] \( f_0 \( x \) - e z \) \/ w #scale(x: 120%, y: 120%)[\)] . quad "(3.11)" $ <eq:graph-prescription-tangent>

]
  #emph[In either case there is a smooth solution of bounded height with uniform bounds on all its derivatives, and it lies uniformly inside the stated open prescription region. Its angle satisfies $v_z gt.eq v_0 > 0$. In Case (i) it satisfies 
$ c_min := delta sqrt(frac(epsilon.alt a, epsilon.alt a + H_(*))) med lt.eq med f := z \/ N med lt.eq 2 . quad "(3.12)" $ <eq:graph-height-positive>

 In Case (ii) there is $eta > 0$ such that 
$ lr(|frac(f_0 - e z, w)|) lt.eq pi / 2 - eta \; #h(2em) \| e z - f_0 \| < frac(pi w, 2) \, quad \| z \| lt.eq frac(parallel f_0 parallel_oo + pi w \/ 2, e) . $

 The constants $v_0 \, eta$ and the derivative bounds may depend on all the indicated parameters and common bounds of the data. The solution is unique among bounded-height solutions whose $C^(2 \, alpha)$ norms in all buffered charts are uniformly bounded for some $0 < alpha < 1$, and whose values have a uniform margin inside the prescription region. Each such solution may have its own exponent, bound, and margin.]
  #emph[The graph metric $h_z = h + d z ⊗ d z$ is again complete and has bounded geometry, and $phi.alt_z = phi.alt - log L_z$ has uniform positive-order derivatives. In particular, 
$ e^(phi.alt_z) d V_(h_z) = e^phi.alt d V_h \, #h(2em) \| d z \|_(h_z)^2 = 1 - v_z^2 < 1 . $

 For the family assertion, let $cal(T)$ be a standard Borel parameter space indexing complete problems of a fixed dimension. Assume a common chart radius and buffers, common bounds for the metric, its inverse, and all their chart derivatives, and common bounds for the positive-order derivatives of $phi.alt$. Require common bounds, including order zero, for all chart derivatives of $F_i \, beta$ in Case (i) or $B \, f_0$ in Case (ii). In Case (i), let $N \, epsilon.alt \, a \, delta$ range in fixed compact subsets of their permitted positive ranges, and require a common finite upper bound on $H_(*)$. In Case (ii), let $e \, w$ range in fixed compact subsets of $\( 0 \, oo \)$, and require $B gt.eq B_min$ for one common $B_min > 0$. Suppose also that the data and chart overlaps are Borel and that the charts accessible along each leaf admit a countable Borel enumeration. Then the preceding estimates for the solutions and their graph metrics and weights hold with constants common to the family, including a common positive height margin in Case (i) and a common margin from the poles in Case (ii). The solutions are Borel in the chart representations and commute with any equivariant identifications of the complete problems.]
] <lem:graph-prescription>

#proof[
  We give existence and the estimates together, since the estimates also give uniqueness and measurable dependence.
  #emph[Height barriers and comparison.] In Case (i), replace $F_i \, beta$ by $t F_i \, t beta$, $0 lt.eq t lt.eq 1$. At $t = 0$ the constant $f = delta$ is a solution. For every $t$, the constant graphs $f = c_min$ and $f = 2$ are a lower and an upper barrier, respectively. Indeed their weighted mean curvature is zero, and at angle $v = 1$ the right side of (3.10) is nonnegative at $f = c_min$ and strictly negative at $f = 2$. In Case (ii), replace $f_0$ by $t f_0$, starting with $z = 0$. For $tau = pi \/ 2 - eta$, the graphs
  $ z_(-) = frac(t f_0 - w tau, e) \, #h(2em) z_(+) = frac(t f_0 + w tau, e) $
  have arguments $+ tau$ and $- tau$, respectively. Their weighted mean curvatures have a common bound independent of $eta$, because their derivatives do not involve $tau$. Choose $eta > 0$ so small that $B_min tan tau$ exceeds this bound. These are then lower and upper barriers for every $t$. They give the asserted height and pole margins.
  Both comparisons use strict decrease of $p$ in its height argument, with the other arguments held fixed:
  $ p_z & = - frac(epsilon.alt a \( F_i^2 + delta^2 \) + \( 1 - v^2 \) \/ 2, z^2) - frac(epsilon.alt a + beta, N^2) lt.eq - frac(epsilon.alt a, N^2) &  & upright("in Case (i)") \,\
p_z & = - frac(e B, w) sec^2 #scale(x: 120%, y: 120%)[\(] \( f_0 - e z \) \/ w #scale(x: 120%, y: 120%)[\)] lt.eq - frac(e B_min, w) &  & upright("in Case (ii)") . quad "(3.13)" $ <eq:graph-height-monotonicity>
  At an interior positive maximum of the difference between a solution and an upper barrier, their gradients, hence their angles, agree. The negative elliptic principal part of $D_z$ gives a nonnegative difference of mean curvatures there, whereas strict height decrease gives a negative difference of prescriptions. This is impossible. The lower comparison and uniqueness follow in the same way. On a noncompact manifold the maximum can be replaced by a supremum: take uniform charts centered at an extremizing sequence, subtract the value of $phi.alt$ at each center, and pass to a local limit. For any individual solution in the stated uniqueness class, its uniform $C^(2 \, alpha)$ bound and the coefficient bounds give such a limit, which attains the extremum at the center of an interior chart. This justifies the same comparison without compactness.
  #emph[The angle bound.] For a solution, (3.4) and the chain rule give
  $ \( Delta_(Sigma \, phi.alt) + P \) v_z = v_z chevron.l p_x \, U_z chevron.r + p_z \( 1 - v_z^2 \) + p_v T \( v_z \) . quad "(3.14)" $ <eq:graph-angle-equation>
  Here $p_x$ differentiates with $z \, v$ fixed, and we used $T \( z \) = 1 - v_z^2$. The ambient curvature and weight bounds imply $P gt.eq - C$, since the remaining term $\| upright("II") \|^2$ is nonnegative. At an infimum of $v_z$, taken by the same recentering procedure, $Delta_(Sigma \, phi.alt) v_z gt.eq 0$ and $T \( v_z \) = 0$. Consequently, if $v_z lt.eq 1 \/ 2$ there,
  $ \( 1 - v_z^2 \) \| p_z \| lt.eq v_z \( C + \| p_x \| \) . quad "(3.15)" $ <eq:graph-angle-infimum>
  The height margins just proved bound $p_x$ uniformly, and (3.13) bounds $\| p_z \|$ below by a positive constant. Since $1 - v_z^2 gt.eq 3 \/ 4$ in this case, (3.15) gives a uniform positive lower bound for $v_z$. In using recentered limits at this stage, a solution is first in an individual uniform $C^(2 \, alpha)$ class. Ordinary local bootstrapping gives its individual higher regularity before the common estimates are deduced, so the differentiations and limits in this argument are justified.
  #emph[Higher estimates.] In a uniform chart let $omega = e^phi.alt sqrt(det h)$, and divide $omega$ by its value at the chart center. The resulting density has a common upper bound and a positive lower bound, and all its derivatives are bounded. The equation is of the form
  $ - partial_j A^j \( x \, partial z \) = F \( x \, z \, partial z \) . quad "(3.16)" $ <eq:graph-divergence-equation>
  For example $A^j = omega h^(j k) z_k \/ L_z$ after the normalization. On the established height and gradient ranges the flux and the right side are smooth with uniformly bounded derivatives, and $partial A^j \/ partial z_k$ is uniformly elliptic. Differentiating (3.16) gives linear divergence equations for $partial_k z$. Their leading coefficients are bounded and uniformly elliptic. Gradient dependence of $F$ produces a bounded first-order coefficient; the remaining terms are a bounded function plus the divergence of a bounded vector field. The term $F_z partial_k z$ is included in the bounded source, since the gradient is already bounded.
  The interior De Giorgi–Nash estimate for these equations, with bounded lower-order coefficients and source data in $L^(s \/ 2)$ and $L^s$ for $s > dim X$, gives a common Hölder bound for $partial z$; see [9] Theorem 8.24. The coefficients in the nondivergence form of the original equation are now Hölder continuous. Interior Schauder estimates give a uniform $C^(2 \, alpha)$ bound for some $alpha > 0$, after shrinking within the chart buffers. Differentiating and applying Schauder estimates again yields uniform bounds for every derivative. All these estimates are local with common buffers, so their constants are uniform throughout $X$.
  #emph[Continuation.] Work in uniform $C^(2 \, alpha)$ spaces on the open set of functions with a uniform height margin. The equation $D_z - p \( x \, z \, v_z \) = 0$ defines a smooth map to uniform $C^(0 \, alpha)$. At a solution its linearization has negative uniformly elliptic principal part, uniform Hölder coefficients, and zeroth-order coefficient $- p_z$ bounded below by a positive constant. This linear operator is invertible on the uniform spaces. To see surjectivity, exhaust a noncompact component by smooth relatively compact domains and solve the linear Dirichlet problem with zero boundary data on each domain. The maximum principle bounds the supremum of the solutions by the supremum of the right side divided by the positive zeroth-order lower bound. Interior Schauder estimates then give the same $C^(2 \, alpha)$ bound in every buffered chart once it lies in the exhaustion. A diagonal local limit solves the equation on the component with the uniform bound. On a compact component the corresponding closed-manifold elliptic theory gives the same conclusion. Uniqueness follows from the maximum principle, using recentered limits on noncompact components. The estimate also makes the inverse bounded.
  The inverse function theorem gives openness of the set of homotopy parameters with a solution. The a priori height, angle, and higher bounds are common over the homotopy. For a sequence of parameters converging to a limit, diagonal smooth convergence on a countable chart cover therefore gives a solution at that limit with the same bounds and height margin. This gives closedness. Each homotopy starts from the constant solution specified above, so existence follows. Comparison gives the claimed uniqueness.
  The graph estimates now follow from (3.2). In particular $h_z gt.eq h$, and the gradient bound also gives a uniform upper comparison in the given charts. Thus $h_z$ is complete and has uniform buffered charts with bounds on all derivatives. The corresponding derivative bounds on $log L_z$ give those for $phi.alt_z$. This also permits successive applications of the lemma.
  #emph[Borel dependence.] For completeness, fix a starting plaque and enumerate the charts accessible along its leaf by words in the Borel overlap maps. Represent a solution by its functions in this countable family of charts, in a countable product of smooth function spaces. Compatibility on overlaps, the equation, the height margin, and the common derivative bounds are Borel conditions: each can be tested on countably many compact subcharts and dense sets, where the relevant functions and their derivatives are continuous. The chart data and changes of coordinates are Borel by hypothesis. The resulting Borel relation between data and local representatives has a singleton fiber over each set of data, by existence and uniqueness. The Borel injection theorem [14] Corollary 15.2, applied to its projection to the data, makes the inverse projection Borel. This proves measurable dependence. The coding refers to a full prescribed problem on the same complete leaf. It applies independently of the transverse mass of the chart family. Finally, applying an equivariant identification to a solution produces a solution of the identified problem, so uniqueness proves equivariance. ◻
]

=== 3.3 Localization of the positive prescription <localization-of-the-positive-prescription>

The positive solution in Lemma 6 is defined on the complete manifold and need not have compact support. For a probability coordinate we need a graph supported near that coordinate. We obtain one by forcing the complete solution close to a small constant on an outer region, and cutting it off there. The following lemma states the quantitative features of this procedure that enter the sweep.

#thm([Lemma 3.3.])[
  (Localization of the positive graph).  #emph[Let $X \, h \, phi.alt$ satisfy the hypotheses of Lemma 6, with $X$ connected, and let $h_(upright("ref")) lt.eq h$ be a complete second metric. Require the coefficients of $h_(upright("ref"))$, its inverse, and all their coordinate derivatives to have uniform bounds in the same buffered charts used for $h$. Suppose $F_i$ is uniformly smooth, $\| F_i \| lt.eq 1$, with compact support $K$, and let $alpha gt.eq 0$ be a uniformly smooth function. Fix 
$ epsilon.alt > 0 \, #h(2em) N^2 = l epsilon.alt \, #h(2em) a = 1 / 2 + theta \, #h(2em) 0 < l lt.eq 1 \, #h(2em) l lt.eq theta lt.eq 1 / 16 . $

 There is a radius $R_(upright("loc"))$, depending only on the dimension and a fixed sufficiently small numerical constant $c_0 > 0$, with the following property. For every sufficiently large $H_(*)$, one can choose smooth functions $beta_s gt.eq 0$ and $0 lt.eq chi lt.eq 1$ such that, with $beta = beta_s + alpha$, 
$ 0 lt.eq beta lt.eq H_(*) \, #h(2em) N \| d beta_s \|_h lt.eq c_0 #scale(x: 120%, y: 120%)[\(] theta epsilon.alt^(3 \/ 2) + beta_s^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] . quad "(3.17)" $ <eq:graph-spatial-cutoff>

 The function $beta_s$ vanishes on a neighborhood of $K$. The function $chi$ is one there, is supported in ${ "dist"_(h_(upright("ref"))) \( x \, K \) < R_(upright("loc")) }$, and changes from one to zero only within a region where $F_i = 0$ and $beta = H_(*)$. This region and the support of $d chi$ have fixed positive buffers in $h_(upright("ref"))$, independent of $H_(*)$. The derivatives of $chi$ are bounded independently of $H_(*)$, $chi$ is flat on its zero set, and $\| d chi \|_h^2 lt.eq C chi$.]
  #emph[Set $delta = H_(*)^(- 2)$, and let $tilde(f) = z \/ N$ be the complete solution of (3.10) for this $beta \, delta$. Define $f = chi tilde(f)$ and form the graph of height $N f$. Denote its quantities by $L \, U \, D \, upright("II")$, put $A = \| U \|_h$, and set, where $f > 0$, 
$ N D^0 = epsilon.alt a \( F_i^2 \/ f - f \) + A^2 \/ \( 2 f \) . quad "(3.18)" $ <eq:graph-ideal-prescription>

 The expressions $A^2 \/ f$ and $N D^0$ are extended by zero where $f = 0$. The bump $f$ is smooth, $0 lt.eq f lt.eq 2$, is positive on $K$, and is flat on its zero set. On the region $chi = 1$ it satisfies 
$ N D = N D^0 - beta f + epsilon.alt a delta^2 \/ f . quad "(3.19)" $ <eq:graph-core-prescription>

 On the region where the cutoff changes, the following quantities tend uniformly to zero as $H_(*) arrow.r oo$, with the preceding data and parameters fixed: 
$ N^2 \| cal(S) \( h + N^2 d f ⊗ d f \, phi.alt - log L \) - cal(S) \( h \, phi.alt \) #scale(x: 120%, y: 120%)[\|] \, quad A^2 \/ f \, quad \| N D^0 \| \, quad beta f \,\
\| N D \| \, quad N \| upright("II") \| \, quad N \| d log L \|_(h + N^2 d f ⊗ d f) . quad "(3.20)" $ <eq:graph-cutoff-small>

 In particular, on all of $X$ the function $upright("err") := N D - \( N D^0 - beta f \)$ tends uniformly to zero. All data retain the corresponding uniform bounds for each fixed choice of $H_(*)$, with the positive-order convention for weights. For the family assertion, let a standard Borel parameter space index such problems of a fixed dimension. Require common sizes and buffers for these simultaneous charts, and common bounds there for $h \, h^(- 1) \, h_(upright("ref")) \, h_(upright("ref"))^(- 1)$ and all their coordinate derivatives. Require common bounds for all derivatives, including values, of $F_i \, alpha$, and for the positive-order derivatives of $phi.alt$. Let $\( epsilon.alt \, l \, theta \)$ range in a fixed compact subset of the permitted parameter set. Require the data, including $h_(upright("ref"))$, to be Borel in the charts and preserved by the equivariant identifications under consideration. Require also the Borel chart overlaps and countable Borel enumerations of accessible charts in Lemma 6. Then the choices are Borel and commute with those identifications; their bounds for each fixed $H_(*)$, and the limits above as $H_(*) arrow.r oo$, are uniform over the family. When $K$ is empty one may take $f = 0$ and omit the operation.]
] <lem:graph-localization>

#proof[
  We first construct the outer coefficient while keeping its transition width bounded. Starting at a fixed positive distance from $K$, a scalar profile $b$ can increase from zero to $H_(*)$ at speed at most
  $ frac(c_0, C N) #scale(x: 120%, y: 120%)[\(] theta epsilon.alt^(3 \/ 2) + b^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] \, $
  where the fixed factor $C$ leaves room for the estimates below. Choose the speed comparable to this expression during the increase, with smooth flattening at either end. The width needed is at most
  $ C N integral_0^oo frac(d t, theta epsilon.alt^(3 \/ 2) + t^(3 \/ 2)) = C frac(N, theta^(1 \/ 3) sqrt(epsilon.alt)) = C sqrt(l) / theta^(1 \/ 3) lt.eq C . quad "(3.21)" $ <eq:graph-cutoff-width>
  For example one can use the primitive of the reciprocal of a smooth positive function comparable to $theta epsilon.alt^(3 \/ 2) + t^(3 \/ 2)$ as the new profile coordinate, and compose with fixed smooth flattenings. The last inequality uses $l lt.eq theta lt.eq 1 \/ 16$.
  One may use this profile in a smooth approximation of $"dist"_(h_(upright("ref"))) \( x \, K \)$ with gradient at most $2$ and a uniformly small error. Here is a construction with the needed uniformity. Shrinking the controlled charts gives normal charts at a fixed positive radius, by the uniform geodesic equation estimates. Average the distance function in such a chart centered at $x$ against a fixed smooth radial kernel in $T_x X$, at a sufficiently small radius. Written as an integral against a kernel in $\( x \, y \)$, this is a smooth function of $x$. The error is at most the averaging radius. To bound the first derivative, move the center and parallel transport the averaging vectors. At a sufficiently small radius the displacement of the exponential images is at most twice the displacement of the center; the distance function is one-Lipschitz. The derivative bound follows. Higher derivatives have uniform bounds from the smooth local kernels: in differentiating the normalized kernel one may subtract the distance at the center, leaving a uniformly bounded oscillation on its support. These derivative bounds hold in the common buffered charts, since the $h_(upright("ref"))$ exponential maps and kernels have uniformly bounded derivatives there. The inverse metric inequality $h^(- 1) lt.eq h_(upright("ref"))^(- 1)$ then bounds the gradient of the composed profile in $h$.
  Choose this raw profile $b$ to vanish near $K$, to equal $H_(*)$ past the width in (3.21), and to leave fixed outer buffers. To accommodate $alpha$, take a smooth nondecreasing saturation $sigma_(H_(*)) : \[ 0 \, oo \) arrow.r \[ 0 \, H_(*) \]$ that equals the identity up to $H_(*) \/ 3$, equals $H_(*)$ from $H_(*)$ on, and has a derivative bounded by a numerical constant. Put
  $ beta = sigma_(H_(*)) \( b + alpha \) \, #h(2em) beta_s = sigma_(H_(*)) \( b + alpha \) - alpha . $
  Take $H_(*)$ much larger than the value and derivative bounds of the already fixed $alpha$. Then $beta_s gt.eq 0$, and it equals $b$ near $K$. Wherever the saturation differs from the identity, both $beta_s$ and the scale of $b$ are comparable to $H_(*)$. The formula
  $ d beta_s = sigma'_(H_(*)) \( b + alpha \) thin d b + #scale(x: 120%, y: 120%)[\(] sigma'_(H_(*)) \( b + alpha \) - 1 #scale(x: 120%, y: 120%)[\)] d alpha $
  therefore proves (3.17): choose the initial fixed speed factor large enough to handle the first term, and then choose $H_(*)$ large enough for the fixed $d alpha$ term to be a small fraction of $H_(*)^(3 \/ 2) \/ N$. Where saturation is the identity this is just the raw profile bound. Where $b = H_(*)$, the total $beta$ equals $H_(*)$. A cutoff supported beyond fixed additional buffers can consequently be chosen once at a radius $R_(upright("loc"))$ as in the statement. Take it to be the square of a smooth nonnegative cutoff that is flat at its outer end. This gives $\| d chi \|^2 lt.eq C chi$ and the other asserted cutoff properties. If some outer regions are empty, the corresponding assertions are vacuous.
  We next prove that the complete solution can be cut on this plateau. All constants in the rest of the proof may use the fixed data and parameters, but not $H_(*)$. Write
  $ c_H = H_(*)^(- 2) sqrt(frac(epsilon.alt a, epsilon.alt a + H_(*))) asymp H_(*)^(- 5 \/ 2) . $
  By (3.12), $c_H lt.eq tilde(f) lt.eq 2$. Cover the cutoff region by inner chart boxes, each with a fixed succession of larger buffered boxes whose closures lie in the plateau $F_i = 0 \, med beta = H_(*)$. Their sizes may use the current $h$-chart bounds inside the fixed $h_(upright("ref"))$ buffers; all these bounds were fixed before $H_(*)$, so the boxes and their buffers have sizes independent of $H_(*)$. Our target is that, for every integer $j gt.eq 0$ and every $M > 0$, there is $C_(j \, M)$ such that, for all sufficiently large $H_(*)$,
  $ parallel tilde(f) - c_H parallel_(C^j) lt.eq C_(j \, M) H_(*)^(- M) \, quad "(3.22)" $ <eq:graph-plateau-jets>
  on the inner boxes, with norms in these fixed coordinates. The constants use only the indicated data and parameters fixed before $H_(*)$. The family assertion of Lemma 6 is applied separately for each fixed $H_(*)$; the estimates that follow establish this superpolynomial decay uniformly as $H_(*)$ grows.
  There is first a global angle bound
  $ v gt.eq frac(c_1, 1 + sqrt(H_(*))) quad "(3.23)" $ <eq:graph-global-plateau-angle>
  for the uncut graph. In fact, at a recentered infimum with $v lt.eq 1 \/ 2$, the formulas for $p_x \, p_z$ and (3.17) give
  $ \| p_z \| gt.eq c_2 \( 1 + beta + tilde(f)^(- 2) \) \, #h(2em) \| p_x \| lt.eq C #scale(x: 120%, y: 120%)[\(] tilde(f)^(- 1) + tilde(f) \( 1 + beta^(3 \/ 2) \) #scale(x: 120%, y: 120%)[\)] . $
  For the first bound use $1 - v^2 gt.eq 3 \/ 4$ in $p_z$; for the second use the fixed bounds on $F_i \, alpha$ and their derivatives. Since $tilde(f) lt.eq 2$ and $beta lt.eq H_(*)$, the ratio of the right side of the second estimate, plus a constant, to the right side of the first is at most $C \( 1 + sqrt(H_(*)) \)$. Equation (3.15) proves (3.23). This recentering is done for each fixed $H_(*)$, using the individual regularity supplied by Lemma 6.
  On each of the outer plateau boxes the equation is
  $ N D = frac(epsilon.alt a delta^2, tilde(f)) + frac(1 - v^2, 2 tilde(f)) - \( epsilon.alt a + H_(*) \) tilde(f) \, #h(2em) \( epsilon.alt a + H_(*) \) c_H^2 = epsilon.alt a delta^2 . quad "(3.24)" $ <eq:graph-plateau-equation>
  There is an exponential value estimate on an inner box:
  $ 0 lt.eq tilde(f) - c_H lt.eq C exp \( - c_3 sqrt(H_(*)) \) . quad "(3.25)" $ <eq:graph-plateau-value>
  To prove it, let $d_(upright("face"))$ be ordinary coordinate distance to a face of the outer box and put
  $ w_1 = sum_(upright("faces")) 3 exp \( - gamma sqrt(H_(*)) thin d_(upright("face")) \) . $
  On the boundary, $c_H + w_1 gt.eq 3 gt.eq tilde(f)$. Its first and second coordinate derivatives are bounded by $C gamma sqrt(H_(*)) w_1$ and $C gamma^2 H_(*) w_1$, respectively. Direct differentiation of the weighted graph divergence therefore bounds its mean curvature from below by
  $ - C \( gamma^2 H_(*) + gamma sqrt(H_(*)) \) w_1 . $
  For this graph, the height terms in its prescription satisfy
  $ frac(epsilon.alt a delta^2, N \( c_H + w_1 \)) - frac(\( epsilon.alt a + H_(*) \) \( c_H + w_1 \), N) = - frac(epsilon.alt a + H_(*), N) w_1 (1 + frac(c_H, c_H + w_1)) . $
  The remaining angle term is at most $C gamma^2 H_(*) w_1$, because $\( 1 - v^2 \) \/ \( c_H + w_1 \) lt.eq N^2 \| d w_1 \|^2 \/ \( c_H + w_1 \) lt.eq C gamma^2 H_(*) w_1$. Choosing $gamma > 0$ sufficiently small and then $H_(*)$ sufficiently large makes $c_H + w_1$ an upper barrier. Comparison with this barrier and the lower constant $c_H$ proves (3.25) on any inner box a fixed distance from the faces.
  On a smaller box the angle is bounded below independently of $H_(*)$. To see this, choose a smooth chart cutoff $0 lt.eq xi lt.eq 1$, supported in a region where (3.25) holds and equal to one on the smaller box. Minimize $v \/ xi$ over ${ xi > 0 }$. The global lower bound (3.23) makes a minimum with value below $1 \/ 2$, if one exists, interior, and at that minimum
  $ v < xi \/ 2 \, #h(2em) xi gt.eq c \/ sqrt(H_(*)) \, #h(2em) nabla_Sigma v = \( v \/ xi \) nabla_Sigma xi \, #h(2em) Delta_(Sigma \, phi.alt) v gt.eq \( v \/ xi \) Delta_(Sigma \, phi.alt) xi . $
  The formula for the restriction of an ambient function to the graph gives $Delta_(Sigma \, phi.alt) xi gt.eq - C \( 1 + \| upright("II") \| \)$. The positive $\| upright("II") \|^2$ term in $P$, and completion of its square against $C \| upright("II") \| \/ xi$, show that the left side of (3.14) is at least $- C H_(*) v$. On this plateau $p_x = 0$. Since $v < 1 \/ 2$, the $p_z$ term on its right side is at most $- c \/ tilde(f)^2$. Also $p_v = - v \/ \( N tilde(f) \)$ and $\| T \( v \) \| lt.eq C v \/ xi$, so that right side is at most
  $ - c / tilde(f)^2 + frac(C sqrt(H_(*)) thin v, tilde(f)) . $
  Combining the two bounds and multiplying by $tilde(f)^2$ would give
  $ c lt.eq C H_(*) tilde(f)^2 + C sqrt(H_(*)) thin tilde(f) . $
  By (3.25), $tilde(f) lt.eq 2 c_H$ for large $H_(*)$, and the last right side tends to zero. This contradiction proves $v gt.eq 1 \/ 2$ on the smaller box.
  It remains to control derivatives on the cutoff region without using any growth rate for the global elliptic constants. In a still smaller box, rescale coordinates $x = x_0 + c_H y$ and write $tilde(f) = c_H g$. The weighted graph curvature in the rescaled chart is $c_H D$, and its right side becomes
  $ c_H p \( x \, N c_H g \, v \) & = frac(epsilon.alt a delta^2 + \( 1 - v^2 \) \/ 2, N g) - frac(c_H^2 \( epsilon.alt a + H_(*) \) g, N)\
 & = frac(epsilon.alt a delta^2 + \( 1 - v^2 \) \/ 2, N g) - frac(epsilon.alt a delta^2 g, N) . $
  Here $1 lt.eq g lt.eq 2$ for large $H_(*)$, and the angle bound gives a uniform gradient bound. The rescaled metric and normalized weight have uniformly bounded derivatives; the displayed right side and all its derivatives are uniformly bounded on these ranges. The local higher estimates in the proof of Lemma 6, applied on unit boxes in these coordinates, consequently give uniform bounds for every derivative of $g$. Scaling back gives bounds of the form $C_j c_H^(1 - j)$ for the $j$-th derivatives of $tilde(f)$. Interior interpolation between these polynomial bounds and the exponential bound (3.25), on further fixed buffered boxes, proves (3.22). Indeed the usual finite-difference interpolation of a $j$-th derivative between the supremum norm and a higher derivative norm gives an exponential factor times a power of $c_H^(- 1)$, which is smaller than every power of $H_(*)^(- 1)$.
  We can now cut off. On the transition region, $tilde(f) asymp c_H$, its positive-order derivatives are smaller than every power of $H_(*)^(- 1)$, and the derivatives of $chi$ are fixed. On ${ chi > 0 }$,
  $ frac(\| d \( chi tilde(f) \) \|^2, chi tilde(f)) lt.eq 2 tilde(f) thin frac(\| d chi \|^2, chi) + 2 chi thin frac(\| d tilde(f) \|^2, tilde(f)) = O \( c_H \) . $
  It follows that $A^2 \/ f lt.eq N^2 \| d f \|^2 \/ f$ tends to zero. All fixed derivatives of $f$ are $O \( c_H \)$ there. The graph formulas therefore give $N D \, N \| upright("II") \|$, and $N \| d log L \|$ tending to zero. They also control $nabla D$, so (3.1) gives the first limit in (3.20). Finally $F_i = 0$ in this region, $N D^0 = - epsilon.alt a f + A^2 \/ \( 2 f \)$, and $beta f lt.eq H_(*) thin O \( c_H \) arrow.r 0$. This proves every limit in (3.20). To verify the extensions at the zero set, write $chi = zeta^2$, where $zeta$ is smooth and flat there. On ${ zeta > 0 }$,
  $ frac(\| d f \|_h^2, f) = 4 tilde(f) thin \| d zeta \|_h^2 + 4 zeta chevron.l d zeta \, d tilde(f) chevron.r_h + zeta^2 frac(\| d tilde(f) \|_h^2, tilde(f)) . $
  The right side extends smoothly and flatly across ${ zeta = 0 }$, since $tilde(f) > 0$. The same is therefore true of
  $ A^2 / f = frac(N^2, 1 + N^2 \| d f \|_h^2) thin frac(\| d f \|_h^2, f) . $
  Moreover, $F_i$ vanishes on a neighborhood of the zero set of $f$. Thus $N D^0$ extends smoothly by zero there, and all jets of $f = zeta^2 tilde(f)$ vanish on its zero set.
  On the uncut region the last term $pi.alt = epsilon.alt a delta^2 \/ f$ in (3.19) has
  $ parallel pi.alt parallel_oo lt.eq delta sqrt(epsilon.alt a \( epsilon.alt a + H_(*) \)) arrow.r 0 \, #h(2em) - 2 N U \( pi.alt \) = frac(2 epsilon.alt a delta^2 L A^2, f^2) gt.eq 0 . quad "(3.26)" $ <eq:graph-floor-derivative>
  Since $N D^0 - beta f gt.eq - \( epsilon.alt a + beta \) f$, its contribution inside the curvature square satisfies
  $ \( N D^0 - beta f + pi.alt \)^2 gt.eq \( N D^0 - beta f \)^2 - 2 epsilon.alt a delta^2 \( epsilon.alt a + H_(*) \) . quad "(3.27)" $ <eq:graph-floor-square>
  The last loss tends to zero. These estimates on the core and (3.20) on the transition prove the claimed bound for $upright("err")$. The curvature estimates use the derivative sign in (3.26) and the full transition estimates, as well as that bound on the value of $upright("err")$.
  Every construction has uniform bounds for fixed $H_(*)$. For Borel data, the distance to the open nonzero set of $F_i$ is Borel: using the enumerated charts it is the infimum of lengths of a countable dense collection of chart paths ending where $F_i eq.not 0$. The normalized smoothing kernels and all subsequent scalar operations are Borel and equivariant. Lemma 6 supplies these same properties for the complete solution. This proves the final assertions. ◻
]

=== 3.4 A sweep of the root probabilities <a-sweep-of-the-root-probabilities>

We now apply the localized graph to each coordinate of a root probability map. The order of the operations matters: a graph enlarges the metric available to all subsequent coordinates. We use finitely many colors so that graphs in the same color have disjoint supports and can be performed simultaneously. For a root probability map, its energy is

$ e_h \( F \) = \| d F \|_(h \, upright("HS"))^2 = sum_i \| d F_i \|_h^2 . $

Fix a smooth nonnegative nondecreasing function $Psi : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$ such that

$ Psi \( s \) = 0 quad \( s lt.eq 8 \) \, #h(2em) Psi \( s \) lt.eq C s^2 \, #h(2em) \| Psi' \( s \) \|^2 lt.eq C Psi \( s \) \, #h(2em) Psi \( s \) gt.eq c s^2 quad \( s gt.eq R_Psi \) \, quad "(3.28)" $ <eq:sweep-boost-profile>

where $R_Psi$ and the constants are numerical. Such a function can be obtained as the square of a smooth nondecreasing function that is zero up to $8$, has bounded derivative, and equals $s - 8$ from a fixed larger value on. We use either $psi = 0$, or $psi = kappa Psi$ for a small constant $kappa > 0$. In the latter case,

$ psi lt.eq C kappa s^2 \, #h(2em) \| psi' \|^2 lt.eq C kappa psi \, #h(2em) psi \( s \) gt.eq c kappa s^2 quad \( s gt.eq R_Psi \) . $

===== 3.4.1 Notation for an ordered sweep. <notation-for-an-ordered-sweep.>

We introduce the pointwise quantities for any candidate sequence of graphs before asserting that the sequence can be constructed. The pass parameters are

$ epsilon.alt > 0 \, #h(2em) N^2 = l epsilon.alt \, #h(2em) a = 1 / 2 + theta \, #h(2em) lambda = 1 / 2 - 2 theta \, #h(2em) 0 < l lt.eq 1 \, quad l lt.eq theta lt.eq 1 / 16 \, quad "(3.29)" $ <eq:sweep-parameters>

with $N > 0$. On one leaf, start with $\( h_0 \, phi.alt_0 \, F \)$, where $F_i gt.eq 0$ and $sum_i F_i^2 = 1$. Suppose nonnegative smooth bumps $f_i$ form a locally finite family ordered in finitely many colors, with disjoint supports within each color, and that $F_i eq.not 0$ implies $f_i > 0$. Attach also nonnegative functions $beta_i$. At this stage these are candidate data, with no graph equation imposed.

Apply in color order the graph of height $N$ times the sum of the bumps in that color. On the support of $f_i$, write $h_(i - 1) \, phi.alt_(i - 1)$ for the pair before its color and $h_i \, phi.alt_i$ for the pair afterward; write $j < i$ for an earlier color. Let $L_i \, U_i \, D_i \, upright("II")_i \, H_i$ be the individual graph quantities for $f_i$, and let $h_(+) \, phi.alt_(+)$ be the final pair. The subscript $p$ denotes the current pass in $W_p$ and in the reserve $Pi_p$ below. The graph identities give the output and its normalization:

$ h_(+) = h_0 + N^2 sum_i d f_i ⊗ d f_i \, #h(2em) W_p := sum_i log L_i = log \( d V_(h_(+)) \/ d V_(h_0) \) gt.eq 0 \,\
phi.alt_(+) = phi.alt_0 - W_p \, #h(2em) e^(phi.alt_(+)) d V_(h_(+)) = e^(phi.alt_0) d V_(h_0) \, #h(2em) r := sum_i f_i^2 > 0 \, #h(2em) Y_i = f_i \/ sqrt(r) . quad "(3.30)" $ <eq:sweep-output>

The sums are pointwise finite, with at most one nonzero bump per color. The implication $F_i eq.not 0 arrow.r.double f_i > 0$ ensures $r > 0$. In all the quantities below, indices are restricted to $f_i > 0$.

For each such index, use the longitudinal notation of the one-coordinate calculation, with $h = h_(i - 1)$, $h' = h_i$, and $h_(upright("in")) = h_0$:

$ A_i = \| U_i \|_(h_(i - 1)) \, #h(2em) U_i = A_i e_i \, #h(2em) x_i = - upright("II")_i \( tau_i \, tau_i \) \, #h(2em) X_i = N x_i \, #h(2em) t_i = A_i^2 \/ f_i . $

Here $tau_i = \( L_i^(- 1) e_i \, A_i \)$ and $x_i = e_i \( A_i \)$ when $A_i > 0$. At $A_i = 0$ use any unit direction as in (3.5). In the graph metric $h_i$, define

$ upright("II")_i^(upright("rem")) := upright("II")_i + x_i thin tau_i^flat ⊗ tau_i^flat \,\
\| upright("II")_i \|^2 = x_i^2 + \| upright("II")_i^(upright("rem")) \|^2 \, #h(2em) "tr" upright("II")_i^(upright("rem")) = H_i + x_i . quad "(3.31)" $ <eq:sweep-longitudinal>

In particular, at $A_i = 0$ the combination $\( X_i - t_i \)^2 + N^2 \| upright("II")_i^(upright("rem")) \|^2 = N^2 \| upright("II")_i \|^2$ is independent of the chosen direction. The losses from comparing the current graph with the input and final metrics are

$ B_i = 1 - \| e_i \|_(h_0)^2 \, #h(2em) C_i = cases(delim: "{", 1 - N^2 \| d f_i \|_(h_(+))^2 \/ A_i^2 \, & A_i > 0 \,, 0 \, & A_i = 0 .) $

Metric monotonicity and the inverse graph formula give $0 lt.eq B_i \, C_i lt.eq 1$.

The normalization gives probability weights $nu_i = f_i^2 \/ r$. Write $bb(E)_nu b_i = sum_i nu_i b_i$. The mean and centered quantities used in the estimate are

$ m = sum_i A_i^2 \, #h(2em) u_i = frac(A_i^2, epsilon.alt nu_i) \, #h(2em) macron(u) = bb(E)_nu u_i = m / epsilon.alt \,\
sigma_i = F_i^2 / nu_i \, #h(2em) bb(E)_nu sigma_i = 1 \,\
M_0 = a \( 1 - r \) - macron(u) \/ 2 \, #h(2em) V_i = a \( sigma_i - 1 \) + lambda \( u_i - macron(u) \) \, #h(2em) "Var"_nu u = bb(E)_nu \( u_i - macron(u) \)^2 . quad "(3.32)" $ <eq:sweep-statistics>

The identity for $bb(E)_nu sigma_i$ uses $F_i eq.not 0 arrow.r.double f_i > 0$; the individual ratios $sigma_i$ need not be at most one.

Finally, define two nonnegative quantities:

$ T_0 =  & sum_i A_i^2 [C_i + 4 a^2 sigma_i B_i + \( L_i - 1 \) { 2 a \( sigma_i + r \) + u_i }] \,\
cal(X) =  & sum_i [\( X_i - t_i \)^2 + N^2 \| upright("II")_i^(upright("rem")) \|^2 + N^2 \| d log L_i \|_(h_i)^2 + beta_i^2 f_i^2] . quad "(3.33)" $ <eq:sweep-T>

The quantity $T_0$ records the gains from the metric comparisons and from each graph’s stretching. Its full coefficient will yield the sharp quadratic term $m^2 \/ n$ in Section 4. The quantity $cal(X)$ retains the derivative squares and the applied coefficients. Together with the mean and variance squares below, it controls graph curvature; those moment squares also control the normalization.

#thm([Proposition 3.4.])[
  (One sweep).  #emph[There is a numerical $c > 0$ with the following property. For a sweep without boost, set $psi = 0$. For a boosted sweep, given $epsilon.alt_(*) > 0$, there are constants $kappa > 0$, $c_(*) > 0$, and $C_(*) < oo$, depending only on $epsilon.alt_(*)$, for which one may use $psi = kappa Psi$ whenever $epsilon.alt gt.eq epsilon.alt_(*)$.]
  #emph[Let $h_0 \, phi.alt_0 \, F$ be a smooth equivariant Borel family on $tilde(M) times Omega$, with bounds uniform in the lifted charts for the instance. Suppose $h_0$ is complete, its geometry and the positive-order derivatives of $phi.alt_0$ have the uniform bounds above, and 
$ F = \( F_i \)_(i in cal(L)) \, #h(2em) F_i gt.eq 0 \, #h(2em) sum_i F_i^2 = 1 $

 has finitely many free label orbits and uniformly locally finite compact coordinate supports. For each orbit representative, suppose all its transverse supports lie in a fixed compact subset of $tilde(M)$. Let $h_(upright("ref")) lt.eq h_0$ be a complete equivariant Borel leafwise metric whose coefficients, inverse, and all coordinate derivatives have uniform bounds in the same lifted buffered charts as $h_0$. Suppose a Borel equivariant coloring $chi : cal(L) times Omega arrow.r { 1 \, dots.h \, k }$, $k < oo$, has been chosen such that, for each retained $omega$ and distinct labels $i \, j$ with $chi \( i \, omega \) = chi \( j \, omega \)$, the $R_(upright("loc"))$-neighborhoods in $h_(upright("ref")) \( omega \)$ of $"supp" F_i \( dot.op \, omega \)$ and $"supp" F_j \( dot.op \, omega \)$ are disjoint. Fix the pass parameters in (3.29), with $epsilon.alt gt.eq epsilon.alt_(*)$ in the boosted case.]
  #emph[For any $delta_0 \, eta_0 > 0$, there is a candidate sweep as above with smooth nonnegative bumps $f_i lt.eq 2$, supported in the indicated enlargements, positive on the supports of $F_i$, and flat on their zero sets. Its output is given by (3.30). The lower bound for $r$ is uniform for the instance. The bumps, coefficients, all intermediate and final graph metrics and weights, their smooth graph quantities, and $Y$ are equivariant and Borel and retain the corresponding uniform chart bounds, with the positive-order convention for weights. The map $Y$ is again a root probability map with the same label orbits.]
  #emph[For each $i$, the coefficient furnished by Lemma 7 has the form 
$ beta_i = beta_(s \, i) + epsilon.alt psi \( R_i \) \, #h(2em) R_i = sum_(j < i) f_j^2 \, quad "(3.34)" $ <eq:sweep-beta>

 Here $beta_(s \, i)$ vanishes near $"supp" F_i$, and the coefficients satisfy (3.17) in $h_(i - 1)$. Writing 
$ N D_i^0 = epsilon.alt a \( F_i^2 \/ f_i - f_i \) + A_i^2 \/ \( 2 f_i \) $

 on ${ f_i > 0 }$, extended by zero off the bump, one has 
$ N D_i = N D_i^0 - beta_i f_i + upright("err")_i \, #h(2em) sum_i \| upright("err")_i \|^2 lt.eq eta_0 . quad "(3.35)" $ <eq:sweep-prescription-error>

]
  #emph[Define the nonnegative reserve 
$ Pi_p :=  & T_0 + c epsilon.alt #scale(x: 120%, y: 120%)[\(] M_0^2 + bb(E)_nu V_i^2 + theta "Var"_nu u #scale(x: 120%, y: 120%)[\)]\
 & + c r / epsilon.alt cal(X) + c_(*) epsilon.alt r^6 upright(bold(1))_({ r gt.eq C_(*) }) \, quad "(3.36)" $ <eq:sweep-positive-reserve>

 where the final term is omitted in a sweep without boost. Then, pointwise, 
$ Q := frac(r N^2, epsilon.alt) #scale(x: 120%, y: 120%)[\[] & cal(S) \( h_(+) \, phi.alt_(+) \) - cal(S) \( h_0 \, phi.alt_0 \) + epsilon.alt e_(h_0) \( F \) - epsilon.alt e_(h_(+)) \( Y \) #scale(x: 120%, y: 120%)[\]]\
 & gt.eq Pi_p - 4 theta^2 m - r / epsilon.alt delta_0 . quad "(3.37)" $ <eq:sweep-inequality>

 The numerical constant $c$ is independent of the instance, the number of colors, and the pass parameters. The errors $delta_0 \, eta_0$ can be prescribed independently before the pass.]
] <prop:sweep>

#proof[
  Process the colors in their prescribed order. At a label in the current color, the sum $R_i$ of earlier bumps and all its derivatives have common bounds for that color, so the function $alpha_i = epsilon.alt psi \( R_i \)$ is fixed and uniformly smooth. Apply Lemma 7 with this $alpha_i$, using a common sufficiently large $H_(*)$ for the color. Uniqueness of the complete solutions and the equivariant cutoff construction make all choices equivariant. Their Borel dependence follows from the same lemma. Bumps in the same color are separated, so their sum gives exactly the individual graph at each point of their supports. The graph metric and weight bounds hold in the same lifted charts as the input bounds. The reference metric is unchanged during the pass, so the simultaneous chart control required by Lemma 7 persists for the next color.
  At any point some $F_i$ is nonzero, and its cutoff is one there. The lower barrier for that color gives $f_i gt.eq c_min > 0$. Taking the minimum over the finitely many colors gives the stated instance-uniform lower bound for $r$; also $r lt.eq 4 k$. Thus $Y$ is smooth with uniform bounds and $sum_i Y_i^2 = 1$. The graph determinant and density identities prove (3.30). By making the error in each color small enough that its square is at most $eta_0 \/ k$, the last conclusion of Lemma 7 gives (3.35).
  We prove the curvature estimate in the units before multiplication by $r \/ epsilon.alt$. Write
  $ G = N^2 #scale(x: 120%, y: 120%)[\[] cal(S) \( h_(+) \, phi.alt_(+) \) - cal(S) \( h_0 \, phi.alt_0 \) + epsilon.alt e_(h_0) \( F \) - epsilon.alt e_(h_(+)) \( Y \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) Z_i = N D_i^0 \, $
  so $Q = \( r \/ epsilon.alt \) G$. For each $i$, the one-coordinate calculation applies with $h = h_(i - 1)$, $h' = h_i$, and $h_(upright("in")) = h_0$. We first account for the difference between the ideal target $Z_i$ for $N D_i$ and the realized prescription.
  For the moment omit the floor in (3.19). Replacing $Z_i$ by $Z_i - beta_i f_i$ in the first two terms of (3.1), after multiplying by $N^2$, adds exactly
  $ & \( Z_i - beta_i f_i \)^2 - 2 N U_i \( Z_i - beta_i f_i \) - Z_i^2 + 2 N U_i \( Z_i \)\
 & thin = beta_i^2 f_i^2 + 2 epsilon.alt a beta_i \( f_i^2 - F_i^2 \) + \( 2 L_i - 1 \) beta_i A_i^2 + 2 N A_i f_i e_i \( beta_i \) . $
  Since $L_i gt.eq 1$, this is at least
  $ cal(B)_i := beta_i^2 f_i^2 + 2 epsilon.alt a beta_i f_i^2 + beta_i A_i^2 - 2 epsilon.alt a beta_i F_i^2 - 2 N A_i f_i \| d beta_i \|_(h_(i - 1)) . quad "(3.38)" $ <eq:sweep-beta-correction>
  On the uncut region the actual floor has nonnegative differentiated contribution by (3.26), and its square loses at most the quantity in (3.27). On a cutoff transition $F_i = 0$ and $d beta_i = 0$. There (3.20) makes the actual scalar change small. It also makes every term on the right of the single-step expansion just obtained small: $beta_i A_i^2 = \( beta_i f_i \) t_i$, the longitudinal terms are controlled by $N \| upright("II")_i \|$ and $t_i$, and the other terms are controlled by $Z_i \, beta_i f_i \, A_i$. The first term in (3.7) is zero. Thus this expanded lower bound still holds on a cutoff transition with an arbitrarily small additive error in these units. It is also valid off the bumps, where all its terms vanish. Choose the floor and transition errors for each color so their sum is at most $delta_0$ at every point. Telescoping (3.1) over the colors gives
  $ G gt.eq sum_i #scale(x: 120%, y: 120%)[\[] & Z_i^2 - 2 N U_i \( Z_i \) + N^2 \| upright("II")_i \|^2 + N^2 \| d log L_i \|_(h_i)^2 + epsilon.alt N^2 \| d F_i \|_(h_0)^2 + cal(B)_i #scale(x: 120%, y: 120%)[\]]\
 & - epsilon.alt N^2 e_(h_(+)) \( Y \) - delta_0 . quad "(3.39)" $ <eq:sweep-raw>
  This argument uses the full differentiated floor and cutoff estimates, rather than differentiating the value error in (3.35).
  The input energy is already included in (3.9). For the output, normalization is an orthogonal projection in the target:
  $ d Y = r^(- 1 \/ 2) \( I - Y ⊗ Y \) thin d f . $
  The rank-one inverse identity and metric monotonicity give
  $ N^2 \| d f_i \|_(h_i)^2 = A_i^2 \, #h(2em) N^2 \| d f_i \|_(h_(+))^2 = A_i^2 \( 1 - C_i \) lt.eq A_i^2 . $
  Consequently
  $ N^2 e_(h_(+)) \( Y \) lt.eq 1 / r sum_i A_i^2 \( 1 - C_i \) . quad "(3.40)" $ <eq:sweep-output-energy>
  Put
  $ K_i = \( X_i - t_i \)^2 + N^2 \| upright("II")_i^(upright("rem")) \|^2 + N^2 \| d log L_i \|_(h_i)^2 \, #h(2em) g_i = a \( sigma_i - r \) + u_i \/ 2 . $
  The definitions imply
  $ Z_i = frac(epsilon.alt f_i, r) g_i \, quad r / epsilon.alt sum_i Z_i^2 = epsilon.alt bb(E)_nu g_i^2 \, quad r / epsilon.alt \( L_i - 1 \) t_i^2 = \( L_i - 1 \) A_i^2 u_i . $
  Use these identities, (3.9), and (3.40) in (3.39). After multiplication by $r \/ epsilon.alt$, the result is
  $ Q gt.eq  & T_0 + r / epsilon.alt sum_i K_i + epsilon.alt bb(E)_nu g_i^2 + sum_i A_i^2 #scale(x: 120%, y: 120%)[\[] \( 2 a - 4 a^2 \) sigma_i + 2 a r - 1 #scale(x: 120%, y: 120%)[\]] + r / epsilon.alt (sum_i cal(B)_i - delta_0) . quad "(3.41)" $ <eq:sweep-expanded>
  Indeed $r F_i^2 \/ f_i^2 = sigma_i$. The terms with $B_i$ and $L_i - 1$ in (3.9) become the corresponding terms of $T_0$, while the output contributes $- A_i^2 + A_i^2 C_i$. The remaining height terms give the displayed quadratic expression.
  The remaining quadratic expression has an exact mean and variance decomposition. Use $bb(E)_nu sigma_i = 1$ and $bb(E)_nu u_i = macron(u)$ from (3.32), and write $w_i = u_i - macron(u)$. Dividing the quadratic expression in (3.41) by $epsilon.alt$, its contribution from the means is
  $ \[ a \( 1 - r \) + macron(u) \/ 2 \]^2 + macron(u) \( 2 a - 4 a^2 + 2 a r - 1 \) & = \[ a \( 1 - r \) - macron(u) \/ 2 \]^2 - \( 2 a - 1 \)^2 macron(u)\
 & = M_0^2 - 4 theta^2 macron(u) . $
  The coefficient of $bb(E)_nu \[ w_i \( sigma_i - 1 \) \]$ in the centered expression is
  $ a + \( 2 a - 4 a^2 \) = 3 a - 4 a^2 = 2 a lambda . $
  Completing its square therefore gives the identity
  $ epsilon.alt bb(E)_nu g_i^2 & + sum_i A_i^2 #scale(x: 120%, y: 120%)[\[] \( 2 a - 4 a^2 \) sigma_i + 2 a r - 1 #scale(x: 120%, y: 120%)[\]]\
 & = epsilon.alt (M_0^2 + bb(E)_nu V_i^2 + \( 1 / 4 - lambda^2 \) "Var"_nu u) - 4 theta^2 m . quad "(3.42)" $ <eq:sweep-mean-identity>
  Here $1 / 4 - lambda^2 = 2 theta - 4 theta^2 gt.eq 7 theta \/ 4$. This supplies a reserve for all three squares in the proposition. We finish by paying the terms in $cal(B)_i$ from fixed fractions of this reserve and of the nonnegative $beta_i$ terms.
  Write $s_i = beta_(s \, i)$ and $b_i = epsilon.alt psi \( R_i \)$, so $beta_i = s_i + b_i$ with both summands nonnegative. In particular $beta_i^2 gt.eq s_i^2 + b_i^2$. The negative $F_i^2$ term in (3.38) has no $s_i$ part, because $s_i$ vanishes near the support of $F_i$. The spatial derivative term satisfies
  $ 2 N A_i f_i \| d s_i \| & lt.eq 2 c_0 A_i f_i \( theta epsilon.alt^(3 \/ 2) + s_i^(3 \/ 2) \)\
 & lt.eq c_0 \( s_i^2 f_i^2 + s_i A_i^2 \) + C c_0 theta \( epsilon.alt^2 f_i^2 + A_i^4 \/ f_i^2 \) . quad "(3.43)" $ <eq:sweep-spatial-cost>
  For the first pair of terms use $2 x y lt.eq x^2 + y^2$. For the other pair, divide by $epsilon.alt^2 f_i^2$ and use $t lt.eq 1 + t^4$ with $t = A_i \/ \( sqrt(epsilon.alt) f_i \)$. This derivative cost occurs only in rows with $F_i = 0$, hence $sigma_i = 0$. In those rows,
  $ V_i = - a + lambda w_i \, #h(2em) a r + macron(u) \/ 2 = a - M_0 = lambda w_i - V_i - M_0 . $
  Since $a gt.eq 1 \/ 2$ and $\| lambda \| lt.eq 1 \/ 2$, these equations give
  $ r + u_i lt.eq 2 \( \| M_0 \| + \| V_i \| + \| w_i \| \) \, #h(2em) r^2 + u_i^2 lt.eq 12 \( M_0^2 + V_i^2 + w_i^2 \) . $
  After multiplication by $r \/ epsilon.alt$, the last cost in (3.43), summed over these rows, is
  $ C c_0 epsilon.alt theta sum_({ sigma_i = 0 }) nu_i \( r^2 + u_i^2 \) . $
  The preceding bound shows that it is a small fraction of the three squares in (3.42) when $c_0$ is a sufficiently small numerical constant. The first cost in (3.43) is paid by a small fraction of $beta_i^2 f_i^2 + beta_i A_i^2$. This proves the required absorption when $psi = 0$, leaving a fixed fraction of every asserted square.
  Suppose now that $psi = kappa Psi$ and $epsilon.alt gt.eq epsilon.alt_(*)$. Metric addition over earlier colors implies, as quadratic forms,
  $ h_(i - 1) gt.eq N^2 sum_(j < i) d f_j ⊗ d f_j . $
  For a unit vector in $h_(i - 1)$, the vector $\( N d f_j \)_(j < i)$ consequently has Euclidean norm at most one. Cauchy–Schwarz applied to $d R_i = 2 sum_(j < i) f_j d f_j$ proves
  $ \| d R_i \|_(h_(i - 1)) lt.eq 2 sqrt(R_i) \/ N . quad "(3.44)" $ <eq:sweep-prefix-gradient>
  For any fixed small $zeta > 0$, the derivative bound in (3.28) and Young’s inequality give
  $ 2 N A_i f_i \| d b_i \| lt.eq 4 epsilon.alt A_i f_i sqrt(R_i) thin \| psi' \( R_i \) \| lt.eq zeta epsilon.alt psi \( R_i \) A_i^2 + C_zeta epsilon.alt kappa f_i^2 R_i . $
  The first term is a small fraction of $beta_i A_i^2$. For the other costs, use
  $ sum_i f_i^2 R_i = 1 / 2 (r^2 - sum_i f_i^4) lt.eq r^2 \/ 2 \, #h(2em) sum_i psi \( R_i \) F_i^2 lt.eq C kappa r^2 sum_i F_i^2 = C kappa r^2 . $
  The profile and its derivative vanish up to $8$. Thus the sum of all remaining boost costs in the units of $G$ is at most
  $ C \( epsilon.alt + epsilon.alt^2 \) kappa r^2 upright(bold(1))_({ r gt.eq 8 }) . quad "(3.45)" $ <eq:sweep-boost-cost>
  Two positive terms cover this cost. First, for $r gt.eq 8$,
  $ - M_0 = a \( r - 1 \) + macron(u) \/ 2 gt.eq 7 r \/ 16 \, #h(2em) epsilon.alt^2 / r M_0^2 gt.eq c epsilon.alt^2 r . $
  The latter is the mean square in (3.42) expressed in the units of $G$. Second, the increments $f_i^2$ in $R_i$ are at most $4$. For $r$ beyond a fixed threshold, the rows with $R_i gt.eq r \/ 2$ carry total increment at least $r \/ 2 - 4 gt.eq r \/ 4$. In fact the first prefix crossing $r \/ 2$ overshoots it by at most $4$. Once $r \/ 2 gt.eq R_Psi$, the lower profile bound on each of these rows gives
  $ sum_i f_i^2 b_i^2 = epsilon.alt^2 sum_i f_i^2 psi \( R_i \)^2 gt.eq c epsilon.alt^2 kappa^2 r^5 #h(2em) \( r gt.eq C_(*) \) . quad "(3.46)" $ <eq:sweep-boost-square>
  To make the parameter choice explicit, let $K_(*) = C \( 1 + epsilon.alt_(*)^(- 1) \)$. The cost (3.45) is at most $K_(*) epsilon.alt^2 kappa r^2$ on $r gt.eq 8$. Choose $kappa$ so small that $kappa^(- 1 \/ 2) gt.eq C_(*)$ and $K_(*) sqrt(kappa)$ is smaller than the fixed fractions of the preceding two reserves available for this purpose. If $8 lt.eq r lt.eq kappa^(- 1 \/ 2)$, this cost is at most $K_(*) sqrt(kappa) thin epsilon.alt^2 r$. If $r gt.eq kappa^(- 1 \/ 2)$, it is at most $K_(*) sqrt(kappa) thin epsilon.alt^2 kappa^2 r^5$. It is therefore covered in both ranges. Fixed fractions of the mean square and of (3.46) remain. One can simultaneously retain a fixed fraction of $sum_i beta_i^2 f_i^2$ for $cal(X)$: reserve, for example, one half of this sum at the outset and use $beta_i^2 gt.eq s_i^2 + b_i^2$ on the other half for the spatial and boost estimates. Take $c_0 \, zeta \, kappa$ small enough for these fixed allocations.
  Insert the absorptions into (3.41) and (3.42). A fixed fraction of $sum_i K_i + sum_i beta_i^2 f_i^2 = cal(X)$ and of the three mean and variance squares survives. The remaining part of (3.46), after multiplication by $r \/ epsilon.alt$, is $c_(*) epsilon.alt r^6 upright(bold(1))_({ r gt.eq C_(*) })$, with $c_(*)$ a positive multiple of $kappa^2$. The terms $T_0$ and $- 4 theta^2 m$ have not been spent. Choose the constant $c$ in (3.36) below the fixed numerical fractions that survive for $cal(X)$ and the mean and variance squares. These fractions are independent of $epsilon.alt_(*)$, because $kappa$ was chosen to fit the fixed allocations. This proves (3.37).
  Finally, the choices of errors impose no estimate on the growth of analytic constants from one color to the next. For a fixed color, the reference buffers are fixed for the pass, and the smaller analytic boxes and all previous geometry bounds are fixed before its $H_(*)$ is chosen. There are finitely many colors, so the raw scalar error can be made at most $delta_0 \/ k$ per color and the squared value error at most $eta_0 \/ k$ per color. Later choices of $H_(*)$ may be arbitrarily larger. The summed errors are therefore precisely those asserted in (3.35) and (3.37). ◻
]

== 4 Entropy metrics with controlled labels <sec:entropy>

This section turns a root probability map for a metric of scalar curvature $- 1$ into a map with a large energy coefficient in a weighted scalar inequality. The accompanying volume term is the logarithm of the actual volume expansion from a density no larger than the original volume density. We will also make the gradient absolutely small and control all label overlaps by one graph. The last two properties allow the energy coefficient to be chosen larger than the combinatorial quantities used later.

Write $exp^(\[ 0 \]) \( t \) = t$ and $exp^(\[ j + 1 \]) \( t \) = exp \( exp^(\[ j \]) \( t \) \)$. We call a function $cal(B) : \[ 1 \, oo \) arrow.r \[ 0 \, oo \)$ #emph[elementary] if, for some fixed $H in bb(N) union { 0 }$ and $A \, B > 0$,

$ cal(B) \( q \) lt.eq exp^(\[ H \]) #scale(x: 120%, y: 120%)[\(] B \( 1 + q \)^A #scale(x: 120%, y: 120%)[\)] #h(2em) \( q gt.eq 1 \) . $

When the function is prescribed in a fixed dimension, its parameters $H \, A \, B$ are allowed to depend on that dimension.

#thm([Theorem 4.1.])[
  (Entropy metrics).  #emph[Let $\( M^n \, g \)$ be a closed connected Riemannian manifold, where $n gt.eq 3$ and $"Scal"_g = - 1$, and put $Gamma = pi_1 \( M \)$. Let $\( Omega_0 \, mu_0 \)$ be a standard Borel probability space with a measure-preserving $Gamma$-action; the one-point space is allowed. Suppose $cal(L)_0$ is a countable set with finitely many free $Gamma$-orbits and 
$ F^(upright("in")) : tilde(M) times Omega_0 arrow.r ell^2 \( cal(L)_0 \) \, #h(2em) F_ell^(upright("in")) gt.eq 0 \, #h(2em) sum_(ell in cal(L)_0) \( F_ell^(upright("in")) \)^2 = 1 $

 is equivariant, Borel in the transverse variable, and smooth along $tilde(M)$. Assume the following uniformity for this input. In charts lifted from a fixed finite atlas on $M$, with fixed inner buffers, the supports are locally finite with a uniform bound on their number, and all leafwise derivatives of the coordinate functions have uniform bounds. For each orbit representative $ell$ there is a compact set $K_ell subset tilde(M)$ such that $"supp" F_(gamma ell)^(upright("in")) \( thin dot.op thin \, omega \) subset gamma K_ell$ for all $gamma in Gamma$ and almost every $omega$. The bounds and compact sets in these assumptions may depend on the input.]
  #emph[For every prescribed elementary function $cal(B)$ and every finite number $E_min$, there are a standard Borel probability $Gamma$-space $\( Omega \, mu \)$ extending $\( Omega_0 \, mu_0 \)$, a countable set $cal(L)$ with finitely many free $Gamma$-orbits, and equivariant leafwise data on $tilde(M) times Omega$: a metric $h$, a function $phi.alt$, a positive density $rho$, and a root probability map $F$ with labels $cal(L)$. There are also $E > E_min$, an integer $q gt.eq n + 1$, and a constant $C = C \( n \, cal(B) \) < oo$ such that, on an invariant conull set of transverse parameters, 
$ & rho lt.eq d V_g \, #h(2em) W := log frac(d V_h, rho) gt.eq 0 \,\
 & cal(S) \( h \, phi.alt \) gt.eq - C + 2 (W - n / 2 log E) + E e_h \( F \) \, #h(2em) e_h \( F \)^(1 \/ 2) lt.eq E^(- 1 \/ 100) \,\
 & E > cal(B) \( q \) . quad "(4.1)" $ <eq:entropy-contract>

 Here the extension means that there is an equivariant measure-preserving map $Omega arrow.r Omega_0$. All output objects are Borel transversely and smooth along leaves. In the same lifted charts, the coefficients of $h$, their derivatives of every order, and the coefficients of $h^(- 1)$ have uniform bounds; the function $phi.alt$, the density ratio $rho \/ d V_g$, its reciprocal, and their derivatives of every order have uniform bounds. The coordinates of $F$ have the same derivative and uniform local finiteness properties as the input. There are equivariant compact sets containing their supports, uniformly in the transverse parameter. All these output bounds may depend on the input and on the chosen finite construction.]
  #emph[There is, in addition, a fixed $Gamma$-invariant graph $cal(G)$ on $cal(L)$, independent of the transverse parameter, of finite maximum degree $Delta$. It contains an edge between every pair of distinct labels that are simultaneously nonzero at any point of any leaf. We may take 
$ q gt.eq max { n + 1 \, \# \( Gamma without cal(L) \) \, Delta + 1 } $

 and a Borel equivariant coloring $chi : cal(L) times Omega arrow.r { 1 \, dots.h \, q }$ such that labels of graph distance one or two have different colors. The set $cal(L)$ can be taken to consist of finitely many copies of $cal(L)_0$. The constant $C$ is independent of the manifold, metric, input family, all the uniform bounds just specified, and $E_min$.]
] <thm:entropy>

We prove the theorem using Proposition 8. The bootstrap will fix the density $rho$, which then remains fixed through all later sweeps and conformal changes. For $W = log \( d V_h \/ rho \)$, the balance propagated after the bootstrap is

$ cal(S) \( h \, phi.alt \) - epsilon.alt e_h \( F \) - 2 W + n log epsilon.alt gt.eq - C + P \, #h(2em) W gt.eq 0 \, quad P gt.eq 0 . $

We first raise an initially small energy coefficient to a dimensional positive value. Subsequent sweeps have a summable scalar loss and retain the nonnegative surplus $P$. At the end of a group of sweeps, that surplus pays for a conformal change which makes the gradient absolutely small. The small gradient then controls how fast the fixed graph of label overlaps can grow in the next group of sweeps. The inverse-metric telescope and the assembly of logarithmic shortening also occur in [20] Lemma 6.1 and Theorem 6.3; the proof below establishes the forcing and entropy estimates needed here.

=== 4.1 Colorings and a conformal bootstrap <colorings-and-a-conformal-bootstrap>

We first supply the colors required for the sweeps. Let $cal(H)$ be any fixed invariant graph of maximum degree $Delta_(cal(H)) < oo$ on a countable label set $cal(L)$. Adjoin to the transverse space independent uniform priorities in $\[ 0 \, 1 \]^(cal(L))$, with the $Gamma$-action permuting coordinates. This is a standard Borel probability extension. Direct every edge from the larger priority to the smaller, after discarding the invariant null set on which two priorities coincide. This set is null because the label set is countable and the priorities have continuous laws. For a fixed vertex the probability of a strictly descending path of length $k$ is at most $Delta_(cal(H))^k \/ \( k + 1 \) !$: there are at most $Delta_(cal(H))^k$ paths, and the priorities of the $k + 1$ distinct vertices in a given descending path have the required order with probability $1 \/ \( k + 1 \) !$. The probability of arbitrarily long such paths is therefore zero. Since the label set is countable, on an invariant conull set every vertex has finite descending depth. Greedily assign to a vertex the least color in ${ 1 \, dots.h \, Delta_(cal(H)) + 1 }$ unused by its lower-priority neighbors, recursively in that finite depth. This defines a proper coloring. It is Borel, since each vertex’s color is determined in some finite descending neighborhood, and it is equivariant, since the rule only uses the invariant graph and priorities. Applying this to the graph square separates vertices of distance at most two.

For the initial map and throughout the bootstrap, graphs of the required finite degree exist with input-dependent bounds. To see this, choose a compact set in $tilde(M)$ whose translates cover the universal cover. Each label support lies in one of finitely many fixed compact sets translated by its group label. A support enlargement by a bounded distance in any one of the current uniformly controlled metrics is contained in an input-dependent compact enlargement in the lifted metric $g$. Properness of the deck action implies that only finitely many translates of any of these compact sets can meet another. Joining all such possible pairs, over all transverse parameters, gives one invariant finite-degree graph for that step. The color construction just proved supplies the colors of Proposition 8. The graph and color choices are made before the analytic errors for the corresponding sweep are chosen. This proves availability at each step of the finite bootstrap, with input-dependent degree. The phase argument below will control the degree relative to the eventual energy coefficient.

Here and below all the notation of a single sweep is that of Proposition 8. In particular, its input is $\( h_0 \, phi.alt_0 \, F \)$, its output is $\( h_(+) \, phi.alt_(+) \, Y \)$, and

$ N^2 = l epsilon.alt \, #h(2em) a = 1 / 2 + theta \, #h(2em) lambda = 1 / 2 - 2 theta \,\
r = sum_i f_i^2 > 0 \, #h(2em) Y = f \/ sqrt(r) \, #h(2em) W_p = sum_i log L_i \, #h(2em) m = sum_i A_i^2 . $

The weights $nu_i = f_i^2 \/ r$ sum to one. We recall the probability statistics and their centered combinations from (3.32):

$ u_i = frac(A_i^2, epsilon.alt nu_i) \, #h(2em) sigma_i = F_i^2 / nu_i \, #h(2em) macron(u) = m / epsilon.alt \,\
M_0 = a \( 1 - r \) - macron(u) / 2 \, #h(2em) V_i = a \( sigma_i - 1 \) + lambda \( u_i - macron(u) \) \, #h(2em) t_i = A_i^2 / f_i . $

Indices of vanishing bumps are omitted. In particular $bb(E)_nu u_i = macron(u)$ and $bb(E)_nu sigma_i = 1$; the ratios $sigma_i$ need not be at most one. We write $bb(E)$ and $"Var"$ for this finite weighted mean and variance in the pointwise calculations. The graph operations give

$ frac(d V_(h_(+)), d V_(h_0)) = e^(W_p) \, #h(2em) phi.alt_(+) = phi.alt_0 - W_p \, #h(2em) N^2 e_(h_(+)) \( Y \) lt.eq m / r . quad "(4.2)" $ <eq:entropy-sweep-density>

The added graph tensors are nonnegative. Thus, as quadratic forms, $h_0 lt.eq h_(i - 1) lt.eq h_i lt.eq h_(+)$; the inverse forms reverse these inequalities. In particular, for every covector $alpha$,

$ \| alpha \|_(h_(+)) lt.eq \| alpha \|_(h_i) lt.eq \| alpha \|_(h_(i - 1)) lt.eq \| alpha \|_(h_0) . $

The positive reserve $Pi_p$ is defined in (3.36), with coefficient exactly one on $T_0$. In a sweep without boost its final term is omitted; in a boosted sweep its constants $c_(*) \, C_(*)$ may depend on the fixed lower threshold for $epsilon.alt$. The sweep inequality reads

$ Q & := frac(r N^2, epsilon.alt) #scale(x: 120%, y: 120%)[\[] cal(S) \( h_(+) \, phi.alt_(+) \) - cal(S) \( h_0 \, phi.alt_0 \) + epsilon.alt e_(h_0) \( F \) - epsilon.alt e_(h_(+)) \( Y \) #scale(x: 120%, y: 120%)[\]]\
 & gt.eq Pi_p - 4 theta^2 m - r / epsilon.alt delta_0 . quad "(4.3)" $ <eq:entropy-sweep-form>

The positive errors $delta_0 \, eta_0$ can be prescribed independently before each sweep. The construction realizes those errors by choosing the analytic parameters for each color after the geometry of the preceding colors has been fixed.

#thm([Lemma 4.2.])[
  (Conformal bootstrap).  #emph[There are constants $epsilon.alt_(*) > 0$ and $C_(upright("boot")) < 4$, depending only on $n$, with the following property. Starting with the input of Theorem 9, finitely many sweeps without boost, followed individually by conformal changes, produce a metric $h_(*)$, a root probability map $F_(*)$, and $epsilon.alt_0 in \[ epsilon.alt_(*) \, 2 epsilon.alt_(*) \]$ such that 
$ rho := d V_(h_(*)) lt.eq d V_g \, #h(2em) "Scal"_(h_(*)) gt.eq - C_(upright("boot")) + epsilon.alt_0 e_(h_(*)) \( F_(*) \) . quad "(4.4)" $ <eq:entropy-bootstrap-output>

 The metric and map have the uniformity and support properties in Theorem 9. The number of sweeps may depend on the input.]
] <lem:entropy-bootstrap>

#proof[
  We use sweeps with $phi.alt_0 = 0$, no boost, and $l = theta$, where $l > 0$ will be a sufficiently small fixed dimensional number. Then $phi.alt_(+) = - W_p$. After a sweep set
  $ k = e^(- 2 W_p \/ \( n - 1 \)) h_(+) . $
  The scalar conformal formula and the definition of $cal(S)$ give
  $ "Scal"_k = e^(2 W_p \/ \( n - 1 \)) (cal(S) \( h_(+) \, phi.alt_(+) \) + frac(\| d W_p \|_(h_(+))^2, n - 1)) . quad "(4.5)" $ <eq:entropy-bootstrap-reset>
  The same reset contracts the volume density:
  $ d V_k = e^(- n W_p \/ \( n - 1 \)) d V_(h_(+)) = e^(- W_p \/ \( n - 1 \)) d V_(h_0) lt.eq d V_(h_0) . quad "(4.6)" $ <eq:entropy-bootstrap-density>
  We claim that there are dimensional $C_b$ and $epsilon.alt_b > 0$ such that, whenever $2 lt.eq C_0 lt.eq 4$, $0 < epsilon.alt lt.eq epsilon.alt_b$, and $"Scal"_(h_0) gt.eq - C_0 + epsilon.alt e_(h_0) \( F \)$, one can choose the errors in the sweep so that
  $ "Scal"_k gt.eq - \( C_0 + C_b l epsilon.alt \) + \( 1 + l \) epsilon.alt e_k \( Y \) . quad "(4.7)" $ <eq:entropy-bootstrap-step>
  We first derive the budget needed for this step. The reset gives $e_k \( Y \) = e^(2 W_p \/ \( n - 1 \)) e_(h_(+)) \( Y \)$. Substituting the definition of $Q$ and the input scalar inequality into (4.5), and dropping its nonnegative gradient term, shows that it suffices to have
  $ frac(epsilon.alt Q, r N^2) gt.eq l epsilon.alt e_(h_(+)) \( Y \) + C_0 \( 1 - e^(- 2 W_p \/ \( n - 1 \)) \) - C_b l epsilon.alt e^(- 2 W_p \/ \( n - 1 \)) . $
  Multiply by $r N^2$, and use $N^2 e_(h_(+)) \( Y \) lt.eq m \/ r$ and $N^2 = l epsilon.alt$. A sufficient budget for (4.7) is therefore
  $ epsilon.alt Q gt.eq l epsilon.alt m + C_0 l epsilon.alt r \( 1 - e^(- 2 W_p \/ \( n - 1 \)) \) - C_b l^2 epsilon.alt^2 r e^(- 2 W_p \/ \( n - 1 \)) . quad "(4.8)" $ <eq:entropy-bootstrap-budget>
  To pay this budget when $epsilon.alt$ is small, we need control of both $m$ and the deviation of $r$ from one. The sweep inequality implies
  $ epsilon.alt Q gt.eq c_n #scale(x: 120%, y: 120%)[\(] epsilon.alt^2 \( 1 - r \)^2 + m^2 #scale(x: 120%, y: 120%)[\)] - C_n epsilon.alt l^2 m - r delta'_0 \, quad "(4.9)" $ <eq:entropy-bootstrap-coercivity>
  where $delta'_0 > 0$ can be chosen arbitrarily small. Here is a proof. Fix a sufficiently small dimensional $m_b > 0$. If $m gt.eq m_b$ and $epsilon.alt_b$ is small enough, then $macron(u) = m \/ epsilon.alt gt.eq 4 a$. Since
  $ - M_0 = a r + macron(u) / 2 - a \, $
  the square $epsilon.alt^2 M_0^2$ controls $epsilon.alt^2 \( 1 - r \)^2 + m^2$. This is one of the positive terms in $epsilon.alt Pi_p$.
  Suppose next that $m < m_b$. The prescription term $D_i^0$ of Proposition 8 satisfies
  $ N D_i^0 + t_i = frac(epsilon.alt f_i, r) [V_i + M_0 + \( lambda + 1 / 2 \) macron(u) + \( 3 / 2 - lambda \) u_i] . $
  Both displayed coefficients of $macron(u)$ and $u_i$ are positive and bounded below. Moving $V_i + M_0$ to the other side, taking positive parts, and summing squares therefore yields
  $ sum_i t_i^2 lt.eq frac(C epsilon.alt^2, r) #scale(x: 120%, y: 120%)[\(] bb(E) V_i^2 + M_0^2 #scale(x: 120%, y: 120%)[\)] + C sum_i \( N D_i^0 + t_i \)_(+)^2 . quad "(4.10)" $ <eq:entropy-bootstrap-t>
  The prescription error relation in Proposition 8 is $N D_i = N D_i^0 - beta_i f_i + upright("err")_i$, with $sum_i \| upright("err")_i \|^2$ arbitrarily small. Moreover, the longitudinal component of $upright("II")_i$ is $- X_i \/ N$, so
  $ N D_i + t_i = - \( X_i - t_i \) + N #scale(x: 120%, y: 120%)[\(] "tr" upright("II")_i^(upright("rem")) - U_i \( phi.alt_(i - 1) \) #scale(x: 120%, y: 120%)[\)] . $
  The terms $\( X_i - t_i \)^2$, $N^2 \| upright("II")_i^(upright("rem")) \|^2$, and $beta_i^2 f_i^2$ occur in $cal(X)$. For the remaining term, choose $m_b < 1 \/ 4$. Then $L_i lt.eq C$ and $\| d log L_i \|_(h_i) lt.eq C A_i \| upright("II")_i \|$. Because the metrics increase during the sweep and $phi.alt_(i - 1) = - sum_(j < i) log L_j$, Cauchy–Schwarz gives
  $ sum_i N^2 U_i \( phi.alt_(i - 1) \)^2 & lt.eq C m^2 sum_j N^2 \| upright("II")_j \|^2\
 & lt.eq C' m^2 (cal(X) + sum_j t_j^2) . $
  For example, the first line follows by bounding $\| d phi.alt_(i - 1) \|_(h_(i - 1))$ by $C sum_(j < i) A_j \| upright("II")_j \|$, squaring with $sum_j A_j^2 = m$, and then summing the factor $A_i^2$. Choosing $m_b$ small absorbs the last sum of $t_j^2$ in (4.10). Since
  $ m^2 = (sum_i f_i t_i)^2 lt.eq r sum_i t_i^2 \, #h(2em) epsilon.alt^2 \( 1 - r \)^2 lt.eq C #scale(x: 120%, y: 120%)[\(] epsilon.alt^2 M_0^2 + m^2 #scale(x: 120%, y: 120%)[\)] \, $
  fractions of the $M_0^2 \, bb(E) V_i^2 \, cal(X)$ terms in $epsilon.alt Pi_p$ control both required squares. The arbitrarily small errors in the prescription contribute $r delta'_0$. The term $- 4 theta^2 m$ in (4.3) is $- 4 l^2 m$. This proves (4.9).
  We now compare the right side of (4.9) with the required budget. When $m gt.eq m_b$, the first two terms on the right of (4.8) are at most $l epsilon.alt \( m + 4 r \)$. The squares $m^2 + epsilon.alt^2 \( 1 - r \)^2$ dominate this expression with a fixed fraction to spare after $l$ is chosen small and then $epsilon.alt_b$ is decreased if needed. One may check this separately for $r lt.eq 2$, where $m gt.eq m_b$ controls the constant part, and for $r > 2$, where Young’s inequality controls $epsilon.alt r$ by $epsilon.alt^2 \( r - 1 \)^2$ and a sufficiently small fixed part of $m^2$. The term $C_n epsilon.alt l^2 m$ is covered at the same time.
  When $m < m_b$, the identity $L_i = \( 1 - A_i^2 \)^(- 1 \/ 2)$ gives $W_p lt.eq C m$. For $r in.not \( 1 \/ 2 \, 2 \)$, Young’s inequality applied to $l epsilon.alt m \( 1 + r \)$ again gives the required domination by the two squares, with $l$ small. For $1 \/ 2 < r < 2$, the positive terms on the right of (4.8), together with the term $C_n epsilon.alt l^2 m$ from the coercivity estimate, are at most $C_n l epsilon.alt m$. Here
  $ C_n l epsilon.alt m lt.eq c_n / 2 m^2 + C'_n l^2 epsilon.alt^2 . $
  On this region $r e^(- 2 W_p \/ \( n - 1 \))$ has a dimensional positive lower bound. We may therefore choose $C_b$ dimensionally to cover the last term. These comparisons can be made strict by increasing $C_b$ and decreasing $l \, epsilon.alt_b$. They leave a positive multiple of $l^2 epsilon.alt^2 r$ in the middle region, and positive square margins outside it; dividing the latter margins by $r$ gives a positive lower bound for fixed $l \, epsilon.alt$. We can consequently choose $delta'_0$ small enough for the sweep. This proves (4.7).
  The input map has a finite uniform energy bound in $g$. Thus for some positive, possibly input-dependent $epsilon.alt_(upright("in"))$ small enough, $"Scal"_g = - 1 gt.eq - 2 + epsilon.alt_(upright("in")) e_g \( F^(upright("in")) \)$. Choose a dimensional $epsilon.alt_(*) > 0$ below $epsilon.alt_b$, small enough that $2 + 2 C_b epsilon.alt_(*) < 4$, and decrease $epsilon.alt_(upright("in"))$ further so that $0 < epsilon.alt_(upright("in")) < epsilon.alt_(*)$. Iterate (4.7) until the coefficient first reaches $epsilon.alt_(*)$. The output coefficient is at most $\( 1 + l \) epsilon.alt_(*) lt.eq 2 epsilon.alt_(*)$, and
  $ sum_(upright("bootstrap sweeps")) l epsilon.alt = epsilon.alt_0 - epsilon.alt_(upright("in")) lt.eq 2 epsilon.alt_(*) . $
  This bounds the total scalar cost by $2 C_b epsilon.alt_(*)$, independently of the number of sweeps. By (4.6), every reset contracts the volume density. The final density $rho = d V_(h_(*))$ therefore satisfies (4.4). The sweep construction and finitely many smooth conformal changes preserve all the stated input-uniform properties. ◻
]

=== 4.2 The entropy increment and its surplus <the-entropy-increment-and-its-surplus>

Fix $epsilon.alt_(*)$ from Lemma 10. We now use the boost in Proposition 8, choosing its constant $kappa > 0$ sufficiently small depending on this fixed threshold. All constants arising from the boost are consequently dimensional. The increment estimate has a coarse region, where a fixed fraction of the reserve remains after paying the budget, and a region near $m = 0 \, r = 1$, where the exact quadratic coefficient will matter.

#thm([Lemma 4.3.])[
  (Entropy increment).  #emph[There are dimensional constants $m_0 > 0$, $D_(*) gt.eq 1$, $l_0 > 0$, $gamma_n > 0$, and $C_n < oo$ with the following property. For $epsilon.alt gt.eq epsilon.alt_(*)$, take a boosted sweep with 
$ 0 < l lt.eq l_0 \, #h(2em) theta = D_(*) l lt.eq 1 / 16 \, #h(2em) N^2 = l epsilon.alt . $

 The errors can be chosen so that 
$ cal(S) \( h_(+) \, phi.alt_(+) \) - \( 1 + l \) epsilon.alt e_(h_(+)) \( Y \) gt.eq  & cal(S) \( h_0 \, phi.alt_0 \) - epsilon.alt e_(h_0) \( F \)\
 & + 2 W_p - n log \( 1 + l \) - C_n l^2 + P_p \, quad "(4.11)" $ <eq:entropy-increment>

 where the nonnegative, pointwise surplus is 
$ P_p = gamma_n frac(epsilon.alt, r N^2) Pi_p thin upright(bold(1))_({ m gt.eq m_0 } thin union thin { \| 1 - r \| gt.eq 1 \/ 4 }) . quad "(4.12)" $ <eq:entropy-surplus-definition>

 In particular, on the indicated region $P_p$ retains a fixed fraction of every positive term in the sweep inequality.]
] <lem:entropy-increment>

#proof[
  The output energy bound in (4.2) shows that, in the units of $Q$, it suffices to prove
  $ Q gt.eq l m + 2 l r W_p - n r l log \( 1 + l \) - C_n r l^3 + frac(r N^2, epsilon.alt) P_p . quad "(4.13)" $ <eq:entropy-budget>
  The term $l m$ pays for the additional $l epsilon.alt e_(h_(+)) \( Y \)$. We choose $delta_0 lt.eq epsilon.alt l^3$ in (4.3). It remains to compare the other terms there with the budget in (4.13).
  We use a trace identity for the amount of the new graph energy that remains in the final metric. Set
  $ m_f := sum_i A_i^2 \( 1 - C_i \) = N^2 sum_i \| d f_i \|_(h_(+))^2 . $
  As matrices, $sum_i N^2 d f_i ⊗ d f_i = h_(+) - h_0$. Hence
  $ m_f = n - "tr" \( h_(+)^(- 1) h_0 \) lt.eq n \( 1 - e^(- 2 W_p \/ n) \) . quad "(4.14)" $ <eq:entropy-trace>
  The inequality is arithmetic–geometric mean applied to the positive eigenvalues of $h_(+)^(- 1) h_0$, whose product is $e^(- 2 W_p)$. We also have
  $ L_i = \( 1 - A_i^2 \)^(- 1 \/ 2) . quad "(4.15)" $ <eq:entropy-volume-angle>
  First choose a small dimensional $m_0 > 0$, in particular $m_0 lt.double epsilon.alt_(*)$ and $m_0 < 1 \/ 4$. We claim that
  $ T_0 + epsilon.alt M_0^2 gt.eq c_n \( m + r W_p \) quad upright("if ") m gt.eq m_0 upright(" or if ") m < m_0 \, med \| 1 - r \| gt.eq 1 / 4 . quad "(4.16)" $ <eq:entropy-coarse-coercivity>
  For $m gt.eq 2 n$, the $C_i$ terms of $T_0$ give $T_0 gt.eq m - m_f gt.eq m - n gt.eq m \/ 2$. For $m_0 lt.eq m lt.eq 2 n$, first suppose that every $A_i^2$ is at most a small number $eta = eta \( n \, m_0 \) > 0$. Then
  $ 2 W_p = sum_i - log \( 1 - A_i^2 \) lt.eq \( 1 + C eta \) m . $
  By (4.14),
  $ m - m_f gt.eq m - n #scale(x: 120%, y: 120%)[\(] 1 - e^(- \( 1 + C eta \) m \/ n) #scale(x: 120%, y: 120%)[\)] gt.eq c_n m . $
  For the last inequality, the same expression with $eta = 0$ divided by $m$ has a positive minimum on $\[ m_0 \, 2 n \]$, and then $eta$ is chosen small. If instead some $A_i^2 > eta$, the self term of that index in $T_0$ is at least $c_n \( r + u_i \)$. It gives a dimensional positive bound if $r$ is bounded below. If $r$ is small, $M_0 = a \( 1 - r \) - macron(u) \/ 2$ is bounded away from zero unless $macron(u)$ lies in a fixed compact subinterval of $\( 0 \, oo \)$. In the former case $epsilon.alt M_0^2 gt.eq c_n epsilon.alt_(*)$. In the latter, $epsilon.alt = m \/ macron(u) lt.eq C_n$ and $u_i = A_i^2 \/ \( epsilon.alt nu_i \) gt.eq c_n$, since $nu_i lt.eq 1$. Each bound controls $m lt.eq 2 n$. This proves the $m$ part for $m gt.eq m_0$.
  For the volume part, indices with $A_i gt.eq 1 \/ 4$ satisfy
  $ A_i^2 \( L_i - 1 \) 2 a r gt.eq c thin r \( L_i - 1 \) gt.eq c thin r log L_i . $
  For all other indices, $log L_i lt.eq C A_i^2$, so their contribution to $r W_p$ is at most $C r m$. If $r lt.eq 2$, the bound for $m$ already covers this. If $r > 2$, then $\| M_0 \| gt.eq c \( r + macron(u) \)$, and $epsilon.alt M_0^2 gt.eq c epsilon.alt r macron(u) = c thin r m$. This proves (4.16) when $m gt.eq m_0$. When $m < m_0$, we have $macron(u) lt.eq m_0 \/ epsilon.alt_(*)$ small and
  $ W_p = m / 2 + O (sum_i A_i^4) lt.eq C m . $
  If $\| 1 - r \| gt.eq 1 \/ 4$, choosing $m_0$ still smaller gives $\| M_0 \| gt.eq c \| 1 - r \|$. The quantity $epsilon.alt \( 1 - r \)^2$ controls $m + r m$: for bounded $r$ use $epsilon.alt gt.eq epsilon.alt_(*)$ and $m lt.eq m_0$, and for $r gt.eq 2$ use $\( 1 - r \)^2 gt.eq r^2 \/ 4$. This proves the claim in the remaining case.
  On the region of (4.16), the positive reserve $Pi_p$ consequently controls $m + r W_p$. The positive terms $l m + 2 l r W_p$ in (4.13) use at most $C_n l Pi_p$, and $4 theta^2 m$ uses at most $C_n D_(*)^2 l^2 Pi_p$. For $l$ sufficiently small after $D_(*)$, a fixed fraction of $Pi_p$ remains. Choose $gamma_n$ below that fraction. The error term $r delta_0 \/ epsilon.alt$ is covered by $C_n r l^3$. This proves (4.13) on the region where the surplus is retained.
  It remains to prove the budget when
  $ m < m_0 \, #h(2em) \| 1 - r \| < 1 / 4 . quad "(4.17)" $ <eq:entropy-small-region>
  Here $T_0 gt.eq c_n m^2$. Indeed, expanding the exponential in (4.14) and using $W_p = m \/ 2 + O \( sum_i A_i^4 \)$ gives
  $ sum_i A_i^2 C_i = m - m_f gt.eq c_n m^2 - C_n sum_i A_i^4 $
  after decreasing $m_0$. The self terms $sum_i A_i^2 \( L_i - 1 \) 2 a r$ are at least $c_n sum_i A_i^4$, by $r > 3 \/ 4$ and $L_i - 1 gt.eq A_i^2 \/ 2$. Adding a sufficiently small fraction of the first estimate to the second proves $T_0 gt.eq c_n m^2$. Since $W_p lt.eq C m$ on this region, this controls the budget whenever $m gt.eq K l$, for a fixed sufficiently large dimensional $K$. In making this conclusion, first fix $K$; after $D_(*)$ is chosen below, take $l$ small enough that $4 D_(*)^2 l^2 m$ is also a small fraction of $m^2$.
  We are left with the critical regime $m lt.eq K l$, still under (4.17). Here $W_p = m \/ 2 + O \( m^2 \)$ and $3 \/ 4 < r < 5 \/ 4$, so the budget expands as
  $ l m + 2 l r W_p - n r l log \( 1 + l \) = 2 l m - n l^2 + O_n \( l^3 \) + O_n \( l^2 \) \| r - 1 \| . $
  The target quadratic term is covered exactly by
  $ m^2 / n - 2 l m + n l^2 = (m / sqrt(n) - sqrt(n) thin l)^2 gt.eq 0 . $
  We must therefore recover $m^2 \/ n$ from $T_0$, while paying the displayed $r - 1$ error and the errors in that recovery. This is where the coefficient one on $T_0$ in $Pi_p$ is needed.
  In particular $e^(W_p) = 1 + O \( m \)$. Metric addition gives $h_0 lt.eq h_j lt.eq h_(+)$ as quadratic forms. Every eigenvalue of $h_0^(- 1) h_(+)$ is at least one, and their product is $e^(2 W_p)$. Each eigenvalue is therefore at most that product, which proves the comparison
  $ h_0 lt.eq h_j lt.eq h_(+) lt.eq e^(2 W_p) h_0 = \( 1 + O \( m \) \) h_0 . $
  Normalize the directions $e_i$ in the $h_0$ inner product and write the resulting unit vectors as $macron(e)_i$. Put $xi_(i j) = \( macron(e)_i dot.op macron(e)_j \)^2$. Before approximating the metric losses, their exact earlier- and later-color telescopes are
  $ B_i = sum_(j < i) \( N d f_j \( e_i \) \)^2 \, #h(2em) C_i = 1 / A_i^2 sum_(j > i) A_j^2 \( N d f_i \( e_j \) \)^2 quad \( A_i > 0 \) . $
  The first identity follows from $h_(i - 1) = h_0 + N^2 sum_(j < i) d f_j ⊗ d f_j$ and $\| e_i \|_(h_(i - 1)) = 1$. The second follows by telescoping the rank-one inverse formula
  $ h_j^(- 1) = h_(j - 1)^(- 1) - A_j^2 e_j e_j^(sans(T)) $
  from $h_i$ to $h_(+)$, and using $N^2 \| d f_i \|_(h_i)^2 = A_i^2$. Now $N d f_j = A_j L_j e_j^flat$, with the dual taken in $h_(j - 1)$. The common metric comparison and $L_j = 1 + O \( m \)$ show that each summand in the exact formulas differs from its $h_0$ expression by $O \( m \) A_j^2$. Their sums therefore give, for $A_i eq.not 0$,
  $ B_i = sum_(j < i) A_j^2 xi_(i j) + O \( m^2 \) \, #h(2em) C_i = sum_(j > i) A_j^2 xi_(i j) + O \( m^2 \) . quad "(4.18)" $ <eq:entropy-BC-expansion>
  Inserting (4.18) into $T_0$ yields
  $ T_0 gt.eq "tr" [(sum_i A_i^2 macron(e)_i macron(e)_i^(sans(T)))^2] - C_n (m^3 + m^2 \| r - 1 \| + m sum_i A_i^2 \( 1 - sigma_i \)_(+)) . quad "(4.19)" $ <eq:entropy-sharp-T>
  To see the leading coefficient, the $B_i$ and $C_i$ terms each give one copy of $sum_(i < j) A_i^2 A_j^2 xi_(i j)$. In the $B_i$ terms use $4 a^2 gt.eq 1$, $B_i gt.eq 0$; replacing $sigma_i$ by one costs at most $C m sum_i A_i^2 \( 1 - sigma_i \)_(+)$. The self terms use $L_i - 1 gt.eq A_i^2 \/ 2$ and $2 a gt.eq 1$. They give $sum_i A_i^4$, up to the displayed $r - 1$ and $sigma_i - 1$ costs. The errors in (4.18) sum to $O \( m^3 \)$. This proves (4.19). The trace in that estimate is at least $m^2 \/ n$, since the matrix is positive semidefinite with trace $m$.
  The last error in (4.19) is paid for by the centered squares. From $a \( sigma_i - 1 \) = V_i - lambda \( u_i - macron(u) \)$, Cauchy–Schwarz and Young’s inequality give, for every fixed $c' > 0$,
  $ m sum_i A_i^2 \( 1 - sigma_i \)_(+) & lt.eq C m epsilon.alt thin bb(E) #scale(x: 120%, y: 120%)[\[] u_i \( \| V_i \| + \| u_i - macron(u) \| \) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq c' epsilon.alt #scale(x: 120%, y: 120%)[\(] bb(E) V_i^2 + theta "Var" u #scale(x: 120%, y: 120%)[\)] + C_(c') m^2 / theta epsilon.alt \( macron(u)^2 + "Var" u \) . quad "(4.20)" $ <eq:entropy-v-error>
  Choose $c'$ to use a small fraction of the squares in $Pi_p$. The coefficient of $epsilon.alt "Var" u$ in the last term, relative to $theta epsilon.alt "Var" u$, is at most $C_(c') K^2 \/ D_(*)^2$, because $m lt.eq K l$ and $theta = D_(*) l$. Choose $D_(*)$ sufficiently large after $K$ so that this term is absorbed as well. The remaining term is
  $ C_(c') m^2 / theta epsilon.alt macron(u)^2 = C_(c') frac(m^4, theta epsilon.alt) = O_n \( l^3 \) . $
  Here $epsilon.alt gt.eq epsilon.alt_(*)$, and $K \, D_(*) \, epsilon.alt_(*)$ are already fixed dimensionally. Also
  $ \| r - 1 \| lt.eq C \( \| M_0 \| + macron(u) \) . $
  Consequently a term $O_n \( l^2 \) \| r - 1 \|$ is bounded by a small fraction of $epsilon.alt M_0^2$ plus $O_n \( l^3 \)$: use Young’s inequality on $l^2 \| M_0 \|$, and use $macron(u) lt.eq K l \/ epsilon.alt_(*)$ on the other part. The errors $m^3$, $m^2 \| r - 1 \|$, and $4 D_(*)^2 l^2 m$ in the present region are therefore covered with a remaining error $O_n \( l^3 \)$.
  The just established mean-square estimate also covers the $O_n \( l^2 \) \| r - 1 \|$ term in the critical budget. The recovered $m^2 \/ n$ then covers $2 l m - n l^2$ by the displayed square. Since $r$ is bounded above and below, the remaining $O_n \( l^3 \)$ terms are of the form $C_n r l^3$. This proves (4.13) in (4.17).
  The choices just made have a definite order: first $m_0$ after $epsilon.alt_(*)$, then $K$, then $D_(*)$, and finally $l_0 > 0$ small enough for all the comparisons and for $D_(*) l_0 lt.eq 1 \/ 16$. The errors in each sweep are chosen afterward. Thus every constant in (4.11) is dimensional. ◻
]

#thm([Lemma 4.4.])[
  (Bounds supplied by the surplus).  #emph[For every sweep of Lemma 11, 
$ W_p lt.eq C_n epsilon.alt^(1 \/ 4) \( epsilon.alt + P_p \)^(3 \/ 4) . quad "(4.21)" $ <eq:entropy-pass-volume>

 There is also a dimensional $epsilon.alt_(upright("exit"))$ such that, if $epsilon.alt gt.eq epsilon.alt_(upright("exit"))$ and $r lt.eq 1 \/ 4$, then 
$ P_p & gt.eq c_n frac(epsilon.alt, l r) (1 + m^2 / epsilon.alt^2) \,\
sum_i #scale(x: 120%, y: 120%)[\(] D_i^2 + \| upright("II")_i \|^2 + \| d log L_i \|_(h_i)^2 #scale(x: 120%, y: 120%)[\)] & lt.eq C_n P_p / theta . quad "(4.22)" $ <eq:entropy-last-surplus>

 The errors in the prescription may simultaneously be chosen to have $sum_i \| upright("err")_i \|^2 lt.eq 1$.]
] <lem:entropy-surplus>

#proof[
  If $macron(u) = m \/ epsilon.alt$ is larger than a fixed dimensional number, then $m gt.eq m_0$, so the surplus retains the mean square and boost. Since $\| M_0 \| gt.eq c \( r + macron(u) \)$ in this range and $l lt.eq 1$,
  $ P_p gt.eq c_n epsilon.alt thin frac(\( r + macron(u) \)^2 + c_(*) r^6 upright(bold(1))_({ r gt.eq C_(*) }), r) gt.eq c'_n epsilon.alt macron(u)^(5 \/ 3) . $
  For the last inequality, if $r lt.eq macron(u)^(1 \/ 3)$ use $macron(u)^2 \/ r$; if $r gt.eq macron(u)^(1 \/ 3)$ use $r^5$, taking the threshold for $macron(u)$ large enough that $macron(u)^(1 \/ 3) gt.eq C_(*)$. It follows in all cases that
  $ m lt.eq C_n epsilon.alt \( 1 + P_p \/ epsilon.alt \)^(3 \/ 5) . quad "(4.23)" $ <eq:entropy-m-surplus>
  If any $A_i > 1 \/ 2$, then $m > 1 \/ 4 > m_0$, and the self terms in $T_0$ give
  $ P_p gt.eq c_n sum_(A_i > 1 \/ 2) \( L_i - 1 \) . $
  Indeed their contribution to $T_0$ is at least $c r sum_(A_i > 1 \/ 2) \( L_i - 1 \)$, and $epsilon.alt \/ \( r N^2 \) = 1 \/ \( l r \) gt.eq 1 \/ r$. For $A_i lt.eq 1 \/ 2$, $log L_i lt.eq C A_i^2$. There are at most $4 m$ indices with $A_i > 1 \/ 2$. Concavity of $log \( 1 + s \)$ on those indices, together with the last estimate, therefore gives
  $ W_p lt.eq C_n m #scale(x: 120%, y: 120%)[\(] 1 + log \( 1 + P_p \/ m \) #scale(x: 120%, y: 120%)[\)] quad "(4.24)" $ <eq:entropy-log-surplus>
  when $m > 0$; when $m = 0$, $W_p = 0$. To justify the bound when the number of those indices is smaller than $4 m$, use that $s log \( 1 + b \/ s \)$ is increasing in $s > 0$. Put $x = m \/ epsilon.alt$, $y = P_p \/ epsilon.alt$. The elementary bound $1 + log \( 1 + t \) lt.eq C \( 1 + t \)^(1 \/ 4)$ for $t gt.eq 0$, applied with $t = y \/ x$, makes the right side of (4.24), divided by $epsilon.alt$, at most
  $ C_n x^(3 \/ 4) \( x + y \)^(1 \/ 4) lt.eq C_n \( 1 + y \)^(7 \/ 10) lt.eq C_n \( 1 + y \)^(3 \/ 4) \, $
  where (4.23) was used in the middle inequality. This proves (4.21).
  Now suppose $r lt.eq 1 \/ 4$. The surplus retains all positive terms because $\| 1 - r \| gt.eq 3 \/ 4$. Outside a fixed compact subinterval of $macron(u) in \( 0 \, oo \)$, the expression $M_0 = a \( 1 - r \) - macron(u) \/ 2$ satisfies $M_0^2 gt.eq c \( 1 + macron(u)^2 \)$. On that compact interval, for $epsilon.alt$ sufficiently large,
  $ T_0 gt.eq m - m_f gt.eq epsilon.alt macron(u) - n gt.eq c_n epsilon.alt \( 1 + macron(u)^2 \) $
  by (4.14). Multiplying the appropriate retained term by $gamma_n \/ \( l r \)$ proves the first inequality in (4.22).
  For the second, the retained derivative terms imply
  $ cal(X) lt.eq C_n N^2 P_p \, #h(2em) frac(epsilon.alt^2, r N^2) #scale(x: 120%, y: 120%)[\(] bb(E) V_i^2 + theta "Var" u #scale(x: 120%, y: 120%)[\)] lt.eq C_n P_p . quad "(4.25)" $ <eq:entropy-X-retained>
  Also
  $ sum_i t_i^2 = epsilon.alt^2 / r \( macron(u)^2 + "Var" u \) . $
  The first inequality of (4.22) controls the $macron(u)^2$ part of this sum divided by $N^2$, and the variance term in (4.25) controls the other part with a factor $1 \/ theta$. Thus $sum_i t_i^2 \/ N^2 lt.eq C_n P_p \/ theta$. Since $cal(X)$ contains $\( X_i - t_i \)^2 + N^2 \| upright("II")_i^(upright("rem")) \|^2 + N^2 \| d log L_i \|^2$, this proves the claimed bounds for $upright("II")_i$ and $d log L_i$.
  For $D_i$, use
  $ N D_i^0 = frac(epsilon.alt f_i, r) (a \( sigma_i - r \) + u_i / 2) \, #h(2em) bb(E) sigma_i^2 lt.eq C #scale(x: 120%, y: 120%)[\(] 1 + bb(E) V_i^2 + "Var" u #scale(x: 120%, y: 120%)[\)] . $
  Here the second inequality follows by solving the definition of $V_i$ for $sigma_i - 1$. Since $r lt.eq 1 \/ 4$,
  $ sum_i \( D_i^0 \)^2 lt.eq frac(C epsilon.alt^2, r N^2) #scale(x: 120%, y: 120%)[\(] 1 + macron(u)^2 + bb(E) V_i^2 + "Var" u #scale(x: 120%, y: 120%)[\)] lt.eq C_n P_p \/ theta . $
  The relation $N D_i = N D_i^0 - beta_i f_i + upright("err")_i$ finishes the estimate: $sum_i beta_i^2 f_i^2 lt.eq cal(X)$, and we choose $sum_i \| upright("err")_i \|^2 lt.eq 1$. Its contribution $1 \/ N^2$ is bounded by $C_n P_p$ using the first inequality of (4.22), $epsilon.alt gt.eq 1$, and $r lt.eq 1 \/ 4$. ◻
]

=== 4.3 Accumulation and an absolute gradient bound <accumulation-and-an-absolute-gradient-bound>

The step size has two jobs: the scalar losses $O_n \( l^2 \)$ must be summable, and the number of support enlargements before reaching $E$ must grow at most cubically in $log E$. Since one sweep changes $log \( 1 + epsilon.alt \)$ by a quantity comparable to $l$, we take

$ l \( epsilon.alt \) = frac(l_(*), \( 1 + log \( 1 + epsilon.alt \) \)^2) \, quad "(4.26)" $ <eq:entropy-step-schedule>

where the dimensional $l_(*) > 0$ is chosen below $l_0$ from Lemma 11. Thus all the parameter choices in that lemma, including $theta = D_(*) l$, apply.

The fixed exponents in the next two lemmas leave room, respectively, for the number of sweeps, the conformal scalar cost, the outgoing volume estimate, and the final gradient target:

$ 0.26 = 1 / 4 + 0.01 \, #h(2em) 0.26 + 0.04 < frac(1 + 0.32, 4) \, #h(2em) 0.26 + 3 / 4 \( 0.04 \) < 0.32 \, #h(2em) 0.02 > 1 / 100 . $

The estimates below show how each margin is used.

#thm([Lemma 4.5.])[
  (Accumulation of entropy passes).  #emph[Suppose at parameter $epsilon.alt_(upright("in")) gt.eq epsilon.alt_(*)$ that 
$ cal(S) \( h \, phi.alt \) gt.eq - C + 2 W - n log epsilon.alt_(upright("in")) + epsilon.alt_(upright("in")) e_h \( F \) + P_(upright("in")) \, #h(2em) W = log \( d V_h \/ rho \) gt.eq 0 \, quad P_(upright("in")) gt.eq 0 . $

 Successive sweeps of Lemma 11, with $epsilon.alt_(upright("new")) = \( 1 + l \( epsilon.alt \) \) epsilon.alt$, preserve this form of inequality: at the final parameter $E$ the surplus is $P = P_(upright("in")) + sum_p P_p$, the volume logarithm is $W_(upright("new")) = W + sum_p W_p$, and the increase of the scalar constant is $C_n sum_p l \( epsilon.alt_p \)^2$. Along the entire increasing sequence of parameters, 
$ sum_p l \( epsilon.alt_p \)^2 lt.eq C_n \, #h(2em) \# { p : epsilon.alt_p < E } lt.eq C_n \( 1 + log^3 \( 1 + E \) \) . quad "(4.27)" $ <eq:entropy-summability>

 If the initial volume logarithm is zero, then, for all sufficiently large dimensional $E$, 
$ W_(upright("new")) lt.eq E^0.26 \( E + P \)^0.75 . quad "(4.28)" $ <eq:entropy-phase-volume>

 The same assertion holds if the initial data have parameter $E_0$, surplus $P_0$, and 
$ W lt.eq E_0^0.32 \( E_0 + P_0 \)^0.75 \, $

 provided $E gt.eq E_0$ is sufficiently large dimensionally and $E_0^0.32 lt.eq 1 / 2 E^0.26$.]
] <lem:entropy-accumulation>

#proof[
  The accumulation assertion follows by adding (4.11). The energy coefficients telescope multiplicatively, and $sum_p log \( 1 + l \( epsilon.alt_p \) \) = log \( E \/ epsilon.alt_(upright("in")) \)$. The density identity in (4.2) gives the sum of the $W_p$.
  Put $t_p = log \( 1 + epsilon.alt_p \)$. Since $epsilon.alt_p gt.eq epsilon.alt_(*) > 0$ and $l_(*)$ is fixed small,
  $ t_(p + 1) - t_p = log (1 + l \( epsilon.alt_p \) frac(epsilon.alt_p, 1 + epsilon.alt_p)) asymp_n l \( epsilon.alt_p \) = frac(l_(*), \( 1 + t_p \)^2) . $
  Comparison with the integrals of $\( 1 + t \)^2$ and $\( 1 + t \)^(- 2)$ respectively proves the number bound and
  $ sum_p l \( epsilon.alt_p \)^2 lt.eq C_n l_(*) integral_(t_0)^oo frac(d t, \( 1 + t \)^2) lt.eq C_n . $
  The comparison is valid on each interval $\[ t_p \, t_(p + 1) \]$, since its endpoints differ by a uniformly bounded small number.
  Let $k$ be the number of sweeps in the group under consideration. By Lemma 12, since $epsilon.alt_p lt.eq E$ and $P_p lt.eq P$,
  $ sum_p W_p lt.eq C_n k E^(1 \/ 4) \( E + P \)^(3 \/ 4) . $
  For all sufficiently large $E$, $C_n k lt.eq 1 / 2 E^0.01$ by (4.27). This proves (4.28) for zero initial volume logarithm. In the other case $P gt.eq P_0$ and $E gt.eq E_0$, so the initial term is at most $E_0^0.32 \( E + P \)^0.75$. The stated condition on $E_0$ pays for this with the other half of $E^0.26 \( E + P \)^0.75$. ◻
]

Call a finite group of these sweeps a #emph[phase]. There is no conformal change inside a phase. Each sweep adds the nonnegative tensor in (3.30); hence, if $h^0$ is its starting metric and $h_(+)$ its final metric, the successive metrics and their inverses satisfy

$ h^0 lt.eq h^(\( 1 \)) lt.eq dots.h.c lt.eq h_(+) \, #h(2em) \( h_(+) \)^(- 1) lt.eq dots.h.c lt.eq \( h^(\( 1 \)) \)^(- 1) lt.eq \( h^0 \)^(- 1) . $

In particular, the starting metric is an admissible reference metric for every sweep in the phase, and $e_(h_(+)) \( Y^0 \) lt.eq e_(h^0) \( Y^0 \)$ for its starting map $Y^0$.

We now finish a phase with an absolute gradient bound. Normalizing the last bumps alone divides by $sqrt(r)$, which can make the gradient large where $r$ is small. We first keep a small copy of the starting map in the normalization; its gradient is controlled by the preceding metric comparison. A conformal enlargement confined to the small-$r$ region then reduces the remaining gradient there, and the last sweep’s surplus pays its cost.

#thm([Lemma 4.6.])[
  (Exit from a phase).  #emph[Consider a phase starting with root map $Y^0$ and metric $h^0$, and let $K_0$ be a finite uniform bound for $e_(h^0) \( Y^0 \)^(1 \/ 2)$. Suppose its last sweep has input parameter $epsilon.alt$, output parameter $E = \( 1 + l \( epsilon.alt \) \) epsilon.alt$, and output $\( h_(+) \, phi.alt_(+) \, Y \)$. Suppose, with $C gt.eq 0$ and $P gt.eq P_p$ including the surplus from that last sweep, that 
$ cal(S) \( h_(+) \, phi.alt_(+) \) & gt.eq - C + 2 W - n log E + E e_(h_(+)) \( Y \) + P \,\
W & = log \( d V_(h_(+)) \/ rho \) gt.eq 0 \, #h(2em) W lt.eq E^0.26 \( E + P \)^0.75 . quad "(4.29)" $ <eq:entropy-before-exit>

 If $E$ is sufficiently large in terms of $n \, K_0$, there are a metric $hat(h)$, a weight $hat(phi.alt)$, and a root map $Z$ on two copies of the labels such that 
$ cal(S) \( hat(h) \, hat(phi.alt) \) & gt.eq - \( C + C_n \) + 2 hat(W) - n log E + E e_(hat(h)) \( Z \) + P' \,\
hat(W) & = log \( d V_(hat(h)) \/ rho \) gt.eq 0 \, #h(2em) hat(W) lt.eq E^0.32 \( E + P' \)^0.75 \,\
e_(hat(h)) \( Z \)^(1 \/ 2) & lt.eq E^(- 1 \/ 100) . quad "(4.30)" $ <eq:entropy-after-exit>

 Here $P' gt.eq 0$, and the added scalar cost $C_n$ is independent of $K_0$ and of all other instance constants. The changes preserve the uniform smoothness and support properties of Theorem 9.]
] <lem:entropy-phase-exit>

#proof[
  In this proof all derivatives, unless otherwise indicated, use $h_(+)$. Write $r = sum_i f_i^2$ for the last sweep, set $s = sqrt(r)$, and put
  $ c_E = frac(1, sqrt(E) \( 1 + K_0 \)) \, #h(2em) Z = frac(\( f \, c_E Y^0 \), sqrt(r + c_E^2)) . $
  The two vectors in the numerator use disjoint copies of the labels. The map is a smooth root probability map because its denominator is at least $c_E > 0$. Writing the copies as $\( i \, 0 \)$ and $\( i \, 1 \)$, we call $i$ their common parent label at the start of the phase; the sweeps within the phase do not change the label set. The first copy is supported on the last bumps and the second on the starting map. This parent assignment will be used to compare support overlaps between phases. By (4.14),
  $ N^2 sum_i \| d f_i \|_(h_(+))^2 = m_f lt.eq n \, #h(2em) \| d s \|_(h_(+))^2 lt.eq n \/ N^2 . $
  Monotonicity of the phase metrics also gives $e_(h_(+)) \( Y^0 \) lt.eq K_0^2$.
  Since $Y$ and $Y^0$ are unit vectors in orthogonal spaces, their derivatives are perpendicular to their respective vectors. Differentiating $Z = \( s Y \, c_E Y^0 \) \/ sqrt(s^2 + c_E^2)$ thus gives the exact identity
  $ e \( Z \) = frac(r, r + c_E^2) e \( Y \) + frac(c_E^2, r + c_E^2) e \( Y^0 \) + frac(c_E^2, \( r + c_E^2 \)^2) \| d s \|^2 . $
  For $r gt.eq 1 \/ 4$, it follows that
  $ E \( e \( Z \) - e \( Y \) \) lt.eq frac(E c_E^2 K_0^2, r + c_E^2) + frac(E c_E^2 n, N^2 \( r + c_E^2 \)^2) lt.eq 4 + frac(16 n, N^2) lt.eq C_n $
  when $E$ is large, since $N^2 = l epsilon.alt$ tends to infinity under (4.26). For $r lt.eq 1 \/ 4$, the norm of the derivative of normalization is at most $1 \/ sqrt(r + c_E^2)$, so
  $ e \( Z \) lt.eq frac(n \/ N^2 + c_E^2 K_0^2, r + c_E^2) . quad "(4.31)" $ <eq:entropy-Z-energy>
  The first inequality of (4.22) now implies
  $ E e \( Z \) lt.eq frac(C_n, l \( r + c_E^2 \)) lt.eq C_n / epsilon.alt P_p . $
  Thus replacing $Y$ by $Z$ in (4.29) costs a dimensional constant on ${ r gt.eq 1 \/ 4 }$ and an arbitrarily small fraction of $P_p$ on ${ r lt.eq 1 \/ 4 }$, once $E$ is dimensionally large. In particular, no factor $K_0$ occurs in this scalar cost.
  Choose a smooth function $u = u \( r \) gt.eq 0$, supported in ${ r lt.eq E^(- 0.32) }$, with
  $ e^u asymp min #scale(x: 120%, y: 120%)[\(] E^0.02 \, max \( 1 \, E^(- 0.16) \/ sqrt(r) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) lr(|frac(d u, d r)|) lt.eq C / r . quad "(4.32)" $ <eq:entropy-u-choice>
  For example, smooth, with bounded-width transitions on the logarithmic scale, the function obtained by truncating $- 1 / 2 log r - 0.16 log E$ to the interval $\[ 0 \, 0.02 log E \]$. The smoothing may vanish whenever the untruncated function is nonpositive, and changes its value by a bounded amount; this gives both the support assertion and the comparison in (4.32). Define
  $ hat(h) = e^(2 u) h_(+) \, #h(2em) hat(phi.alt) = phi.alt_(+) - \( n - 1 \) u \, #h(2em) hat(W) = W + n u . $
  In particular $d V_(hat(h)) = e^(n u) d V_(h_(+))$, so this is the claimed volume logarithm. Differentiating $r$ gives
  $ \| d r \| lt.eq 2 sqrt(r) (sum_i \| d f_i \|^2)^(1 \/ 2) lt.eq frac(2 sqrt(n r), N) \, #h(2em) \| d u \| lt.eq frac(C_n, N sqrt(r)) . $
  The coefficient $n - 1$ in the new weight cancels the Laplacian of $u$ in the weighted conformal formula. With $b = nabla_(h_(+)) phi.alt_(+)$, that formula is
  $ cal(S) \( hat(h) \, hat(phi.alt) \) = e^(- 2 u) [cal(S) \( h_(+) \, phi.alt_(+) \) + 2 b \( u \) - \( n - 1 \) \| d u \|^2] . quad "(4.33)" $ <eq:entropy-conformal-exit>
  With the fixed density $rho$, a graph sweep changes $W$ by $+ W_p$ and $phi.alt$ by $- W_p$, so it preserves $phi.alt + W$. The present exit instead satisfies
  $ hat(phi.alt) + hat(W) = phi.alt_(+) + W + u . $
  Thus after an exit $W$ need not equal $- phi.alt$, and its volume bound supplies no bound for the gradient of the weight. We need a bound on $b \( u \)$ which uses no bound on the size of $b$. It is enough to estimate this on the support of $u$, which lies in ${ r lt.eq 1 \/ 4 }$ for large $E$. At such a point view all the graphs of the last sweep in the common Euclidean extension of $\( T_x tilde(M) \, h_0 \)$ by their graph directions, one for each active color at that point. Write $upright(bold(n))_i$ for the successive unit normals. They are orthonormal: a later normal lies in the preceding graph plus its new vertical direction and is perpendicular to every earlier normal. In this space, each gradient is embedded through its graph and padded by zero in the unused later directions. Writing $b_i$ for the embedded gradient of $phi.alt_i$, orthogonal projection to the new graph gives the exact recurrence
  $ b_i = b_(i - 1) - chevron.l b_(i - 1) \, upright(bold(n))_i chevron.r upright(bold(n))_i - nabla_(h_i) log L_i \, $
  where the last gradient is embedded in the same space. The normal coefficient is $chevron.l b_(i - 1) \, upright(bold(n))_i chevron.r = - U_i \( phi.alt_(i - 1) \)$, and its magnitude satisfies
  $ \| U_i \( phi.alt_(i - 1) \) \| lt.eq \| D_i \| + sqrt(n) thin \| upright("II")_i \| \, $
  because $D_i = "tr" upright("II")_i - U_i \( phi.alt_(i - 1) \)$. By orthonormality and (4.22), the norm of the sum of these normal corrections is at most $C_n sqrt(P_p \/ theta)$.
  For the subtracted tangent gradients, split the indices according as $A_i lt.eq 1 \/ 2$ or $A_i > 1 \/ 2$. In the first set $\| d log L_i \| lt.eq C A_i \| upright("II")_i \|$; in the second there are at most $4 m$ indices. Cauchy–Schwarz and (4.22) consequently bound the sum of their norms by $C_n sqrt(m P_p \/ theta)$. The final tangent embedding sends a vector $v$ to $\( v \, \( N d f_i \( v \) \)_i \)$. Summing the recurrence, the initial gradient has no vertical component in this common extension, while the vertical component of the final gradient is $\( N d f_i \( b \) \)_i$. The normal and tangent bounds therefore prove
  $ sum_i \( N d f_i \( b \) \)^2 lt.eq C_n \( 1 + m \) P_p \/ theta . $
  It follows that
  $ \| b \( u \) \| lt.eq C / r \| b \( r \) \| lt.eq C_n (frac(\( 1 + m \) P_p, theta N^2 r))^(1 \/ 2) lt.eq frac(C_n P_p, sqrt(theta E)) . $
  For the last inequality use $E asymp epsilon.alt$, $N^2 = l epsilon.alt$, and
  $ P_p gt.eq frac(c_n, l r) (epsilon.alt + m^2 / epsilon.alt) gt.eq frac(c'_n \( 1 + m \), l r) $
  for $epsilon.alt gt.eq 1$. The same first surplus bound gives
  $ \| d u \|^2 lt.eq frac(C_n, N^2 r) lt.eq frac(C_n P_p, E^2) . quad "(4.34)" $ <eq:entropy-exit-derivatives>
  All these estimates are only needed where $u eq.not 0$, a subset of ${ r lt.eq 1 \/ 4 }$ for large $E$. Since $theta E asymp_n E \/ \( 1 + log E \)^2$ tends to infinity, the two derivative terms in (4.33) cost an arbitrarily small fraction of $P_p$.
  There is enough surplus on this region also for the change in the entropy term. From $r lt.eq E^(- 0.32)$ and (4.22),
  $ P gt.eq P_p gt.eq c_n E^1.32 . $
  Using (4.29) and $e^(2 u) lt.eq C E^0.04$, we obtain there
  $ frac(e^(2 u) W, P) lt.eq C_n E^(0.04 + 0.26) P^(- 0.25) lt.eq C_n E^(- 0.03) \, #h(2em) frac(e^(2 u) n u, P) lt.eq C_n E^(- 1.28) log E . quad "(4.35)" $ <eq:entropy-exit-volume-cost>
  In the first bound we used $E + P lt.eq C_n P$, valid for large $E$ on this region. Both quantities tend to zero with dimensional constants.
  We now assemble these estimates. After replacing $Y$ by $Z$, write the retained surplus as $alpha_n P$, where $alpha_n > 0$ is fixed dimensionally. Put $B_u = 2 \| b \( u \) \| + \( n - 1 \) \| d u \|^2$. Substituting in (4.33) and moving the new entropy term to the left gives
  $ & cal(S) \( hat(h) \, hat(phi.alt) \) - E e_(hat(h)) \( Z \) - 2 \( W + n u \) + n log E\
 & quad gt.eq - \( C + C_n \) + e^(- 2 u) #scale(x: 120%, y: 120%)[\[] alpha_n P - B_u - 2 \( e^(2 u) - 1 \) W - 2 n u e^(2 u) #scale(x: 120%, y: 120%)[\]] + \( 1 - e^(- 2 u) \) n log E . $
  We used $e^(- 2 u) \( C + C_n \) lt.eq C + C_n$. The last term is nonnegative for $E gt.eq 1$. Equations (4.34) and (4.35) leave at least a fixed fraction of $P$ in the bracket on the support of $u$; off that support the volume and derivative costs vanish. We may thus set
  $ P' = alpha'_n e^(- 2 u) P $
  for a fixed $alpha'_n > 0$, proving the scalar inequality in (4.30). The only scalar constant charged was the dimensional replacement cost.
  The volume estimate at exit follows as well. Since $P lt.eq C_n e^(2 u) P' lt.eq C_n E^0.04 P'$ and $n u lt.eq C_n log E$,
  $ hat(W) lt.eq C_n E^(0.26 + 0.04 \( 0.75 \)) \( E + P' \)^0.75 + C_n log E lt.eq E^0.32 \( E + P' \)^0.75 $
  for all sufficiently large dimensional $E$.
  Finally, (4.31) and the conformal scaling of energy give
  $ e_(hat(h)) \( Z \)^(1 \/ 2) lt.eq e^(- u) frac(sqrt(n) \/ N + c_E K_0, sqrt(r + c_E^2)) . $
  The choice (4.32) implies
  $ e^(- u) / sqrt(r + c_E^2) lt.eq C (E^(- 0.02) / c_E + E^0.16) . $
  Using $sqrt(E) \/ N lt.eq C_n \( 1 + log E \)$, $c_E K_0 lt.eq E^(- 1 \/ 2)$, and $N lt.eq sqrt(E)$, we conclude that
  $ e_(hat(h)) \( Z \)^(1 \/ 2) lt.eq C_n (frac(\( 1 + K_0 \) \( 1 + log E \), E^0.02) + E^0.16 / N) . quad "(4.36)" $ <eq:entropy-exit-gradient>
  The first summand is $o \( E^(- 0.01) \)$ for fixed $K_0$; the second is $O_n \( \( 1 + log E \) E^(- 0.34) \)$. Taking $E$ large enough in terms of $n \, K_0$ proves the final inequality in (4.30). The functions $u$ and the normalizing denominator are smooth with finite bounds in each fixed construction. The supports of $Z$ are those of the last bumps and of $Y^0$. Thus the asserted uniformity and compact support properties persist. ◻
]

=== 4.4 A fixed graph and the final parameter choice <a-fixed-graph-and-the-final-parameter-choice>

#proof[
  Fix parameters $H \, A \, B$ for the prescribed elementary bound and set $J = H + 2$. This number of phases is fixed before any phase target is chosen. The first target will be chosen after the bootstrap data and their uniform constants have been fixed; the estimates below hold for every sufficiently large choice of that target.
  Apply Lemma 10. At its output $W = log \( d V_(h_(*)) \/ rho \) = 0$, $phi.alt = 0$, and $epsilon.alt_0 in \[ epsilon.alt_(*) \, 2 epsilon.alt_(*) \]$. Increasing a dimensional constant once, (4.4) has the form
  $ cal(S) \( h_(*) \, 0 \) gt.eq - C_n + 2 W - n log epsilon.alt_0 + epsilon.alt_0 e_(h_(*)) \( F_(*) \) \, $
  because $epsilon.alt_0$ ranges in a fixed dimensional interval. We use the schedule (4.26) from now on. The bound (4.27) applies to the entire increasing sequence of energy coefficients, even when it is partitioned into phases.
  Choose a large first target and run the first phase until the parameter first reaches it; call the actual output parameter $E_1$. The overshoot is at most a factor $1 + l_(*)$. In every sweep of this phase use $h_(*)$ as the reference metric. The possible support enlargement per sweep, including its separation buffers, has a dimensional radius in this reference metric by Proposition 8. The total radius is therefore at most $C_n \( 1 + log^3 \( 1 + E_1 \) \)$.
  We record a bound for a single fixed graph sufficient for every coloring in this phase and for all cooccurrences at its exit. All data before the choice of the first target, including $h_(*)$ and its uniform comparison with $g$, have already been fixed. The lifted metric $h_(*)$ is at least a positive input-dependent multiple of $g$. For a fixed finite generating set of $Gamma$, cocompactness implies that word length is bounded above by an affine input-dependent function of lifted $g$-distance between translates of fixed compact fundamental sets. For instance, subdividing a curve into bounded length pieces and following the finitely many translates meeting successive covering sets gives this bound. The number of group elements of word length at most $L$ is at most exponential in $L$. It follows that the graph joining every pair of labels whose possible enlarged supports in the first phase meet, or come within a required buffer, has degree at most
  $ Delta_1 + 1 lt.eq exp #scale(x: 120%, y: 120%)[\(] C_(upright("inst")) \( 1 + log E_1 \)^3 #scale(x: 120%, y: 120%)[\)] . quad "(4.37)" $ <eq:entropy-first-graph>
  Here $C_(upright("inst"))$ is finite and fixed #emph[before] the first target is chosen. It includes the initial number of label orbits and the compact support bounds. The two copies of labels used at exit and their possible cooccurrences change this bound only by a fixed factor, which is absorbed in $C_(upright("inst"))$.
  Take $E_1$ sufficiently large for Lemma 13 and Lemma 14; in the latter the initial $K_0$ is the finite input-dependent gradient bound of $F_(*)$. We now have the scalar inequality, the volume bound with exponent $0.32$, and the absolute gradient bound at $E_1$. Denote the exit metric, map, and fixed cooccurrence graph by $h_1 \, F_1 \, cal(G)_1$.
  We next isolate how a small gradient controls the graph in a later phase. Suppose a phase starts with metric $h_j$, root map $F_j$ with $e_(h_j) \( F_j \)^(1 \/ 2) lt.eq K$, and a fixed graph $cal(G)_j$ containing all its possible cooccurrences. Let $R$ bound the following pairwise distance: whenever two possible enlarged supports meet or come close enough to require separation by a buffer, there are points $x \, y$ in the old nonzero supports of their respective parent labels with $"dist"_(h_j) \( x \, y \) lt.eq R$. If a closure is involved, allow an arbitrarily small additional distance. Suppose
  $ K R < sqrt(2) . $
  Choosing the additional distance small enough, the gradient bound gives
  $ parallel F_j \( x \) - F_j \( y \) parallel_(ell^2) lt.eq K "dist"_(h_j) \( x \, y \) < sqrt(2) . $
  Two nonnegative unit vectors with disjoint supports have distance exactly $sqrt(2)$. Thus $F_j \( x \)$ and $F_j \( y \)$ share a nonzero label, say $k$. The first parent and $k$ cooccur at $x$, and the second parent and $k$ cooccur at $y$. The two parents are therefore at graph distance at most two in $cal(G)_j$. This argument applies separately at each transverse parameter; because $cal(G)_j$ already contains all possible cooccurrences, the conclusion holds in that one fixed graph.
  After an exit at $E_j$, we choose a target that both meets this overlap condition and grows by one exponential level:
  $ T_(j + 1) = exp \( E_j^(1 \/ 1000) \) \, quad "(4.38)" $ <eq:entropy-phase-targets>
  and call the first parameter reaching it $E_(j + 1)$. Thus
  $ T_(j + 1) lt.eq E_(j + 1) lt.eq \( 1 + l_(*) \) T_(j + 1) . $
  The choice $1 \/ 1000$ leaves the strict inequality $3 \/ 1000 < 1 \/ 100$: the cubic logarithmic cost of support enlargement will be smaller than the gain from the preceding gradient bound. For large $E_j$ this target satisfies $E_j^0.32 lt.eq 1 / 2 E_(j + 1)^0.26$. The outgoing bound with exponent $0.32$ from phase $j$ and Lemma 13 therefore give the bound with exponent $0.26$ before the next exit. The next initial gradient bound is $K_0 lt.eq E_j^(- 1 \/ 100) lt.eq 1$, so all further thresholds for Lemma 14 are dimensional. Increasing the first target once ensures these conclusions in every one of a prescribed finite number of phases.
  Use $h_j$, the starting metric, as the reference metric in phase $j + 1$. Let $R_(j + 1)$ bound the pairwise old-support distance in the preceding argument, including both support enlargement radii and all separation buffers. The number of sweeps gives
  $ R_(j + 1) lt.eq C_n \( 1 + log^3 E_(j + 1) \) lt.eq C_n E_j^(3 \/ 1000) . $
  Consequently
  $ R_(j + 1) E_j^(- 1 \/ 100) lt.eq C_n E_j^(- 7 \/ 1000) arrow.r 0 . quad "(4.39)" $ <eq:entropy-overlap-radius>
  For large $E_j$, the overlap condition therefore holds with $K = E_j^(- 1 \/ 100)$. For every relevant pair the preceding estimate becomes
  $ parallel F_j \( x \) - F_j \( y \) parallel_(ell^2) lt.eq E_j^(- 1 \/ 100) "dist"_(h_j) \( x \, y \) < sqrt(2) . $
  This uses only the starting metric of the phase, without a comparison constant between that metric and $g$.
  It follows that every separation graph needed in phase $j + 1$ is contained in the square $cal(G)_j^2$, after identifying labels with their parents at the start of the phase. At exit there are two copies of each parent. Joining two such copies whenever their parents are equal or at distance at most two gives a fixed graph $cal(G)_(j + 1)$ containing all new cooccurrences. If $Delta_j$ is the degree of $cal(G)_j$, this construction gives
  $ Delta_(j + 1) + 1 lt.eq 2 \( Delta_j + 1 \)^2 . quad "(4.40)" $ <eq:entropy-graph-recurrence>
  It also doubles the number of label orbits. The preliminary coloring construction applies to these graphs before each sweep. All analytic support and chart bounds in the resulting finite construction remain finite for the input, even though they need not satisfy a useful quantitative bound. They do not enter (4.40).
  After $J$ phases, apply the coloring argument to $cal(G)_J^2$, whose maximum degree is at most $Delta_J^2$. Take $q$ to be the maximum of its degree plus one, the number of label orbits, and $n + 1$. Equations (4.37) and (4.40) imply
  $ log q lt.eq C_(upright("inst") \, J \, n) \( 1 + log E_1 \)^3 . quad "(4.41)" $ <eq:entropy-q-growth>
  For fixed $J \, n$ the coefficient here is fixed before $E_1$ is chosen. The graph $cal(G)_J$ and this coloring have exactly the properties asserted in the theorem.
  It remains to make the first target large enough for the already fixed $J = H + 2$. Let $cal(B) \( q \) lt.eq exp^(\[ H \]) \( B \( 1 + q \)^A \)$ be the prescribed elementary bound. Equation (4.41) implies
  $ cal(B) \( q \) lt.eq exp^(\[ H + 1 \]) #scale(x: 120%, y: 120%)[\(] C'_(upright("inst") \, J \, n \, A \, B) \( 1 + log E_1 \)^3 #scale(x: 120%, y: 120%)[\)] $
  for large $E_1$. On the other hand, the recurrence (4.38) gives, for each fixed $J gt.eq 2$,
  $ E_J gt.eq exp^(\[ J - 1 \]) #scale(x: 120%, y: 120%)[\(] c_J E_1^(1 \/ 1000) #scale(x: 120%, y: 120%)[\)] quad "(4.42)" $ <eq:entropy-tower-growth>
  for some $c_J > 0$ and all sufficiently large $E_1$. One proves this by induction: raising a fixed-height exponential tower with argument $c t$ to the power $1 \/ 1000$ still dominates a tower of the same height with argument $c' t$, for some $c' > 0$ and all large $t$; the next application of $exp$ adds a level. For height one this follows from $\( e^(c t) \)^(1 \/ 1000) = e^(c t \/ 1000)$; for higher heights, reducing the bottom argument by any fixed factor absorbs the fixed outer multiplicative factor. This proves the induction.
  With the already chosen $J = H + 2$, the tower heights on the two sides are now the same, and
  $ c_J E_1^(1 \/ 1000) > C'_(upright("inst") \, J \, n \, A \, B) \( 1 + log E_1 \)^3 $
  for all sufficiently large $E_1$. Thus $E_J > cal(B) \( q \)$. We may choose the first target still larger to have $E_J > E_min$, to satisfy the initial gradient threshold involving $K_0$, and to meet all dimensional thresholds used above. These choices affect only the size of the final parameter and the finite uniform bounds of the output objects.
  Finally we account for the scalar constant. The bootstrap charges at most $2 C_b epsilon.alt_(*)$, independently of its input-dependent number of sweeps. The initial logarithmic normalization has a dimensional cost because $epsilon.alt_0 in \[ epsilon.alt_(*) \, 2 epsilon.alt_(*) \]$. All entropy sweep losses together are bounded by $C_n sum l^2 lt.eq C_n$. Each exit charges at most $C_n$, and their number $J = H + 2$ depends only on the prescribed elementary function and $n$. The input gradient bound $K_0$, the initial small $epsilon.alt_(upright("in"))$, the compact support radii, and all metric and elliptic bounds occur only in the choices of the first target, graphs, and arbitrarily small analytic errors. None contributes to the scalar constant. Discard the final nonnegative surplus $P'$; the remaining inequality is (4.1) with $C = C \( n \, cal(B) \)$.
  The density $rho$ has been unchanged since the bootstrap, so $rho lt.eq d V_g$. The volume logarithm starts at zero and only increases by $W_p gt.eq 0$ and $n u gt.eq 0$. Finitely many sweeps and exits preserve the asserted smoothness, uniformity, compact supports, and finite number of free label orbits. The transverse spaces were enlarged only by the probability products used for the colorings, and the sweep constructions are Borel on these spaces by Proposition 8. This proves all the conclusions. ◻
]

== 5 A measured degree estimate <sec:degree>

This section bounds the degree of a map from a measured family of Riemannian manifolds to a cube. Its integrand combines the weighted scalar quantity with a separate allowance for each coordinate gradient. The conclusion involves ordinary Riemannian volume, integrated also in the transverse direction. The family need not consist of complete manifolds, and its degree need not be an integer. We first specify the control at the sides of the cube that makes this statement, and the integrations in its proof, well defined.

=== 5.1 Measured bands and degree <measured-bands-and-degree>

We use the following model of a measured space of leaf manifolds. The underlying space $X$ is standard Borel and has a countable collection of flow boxes

$ kappa_a : T_a times Q_a arrow.r X \, $

whose images cover $X$ and which are Borel isomorphisms onto their images. Here $Q_a$ is an open box in $bb(R)^d$, $T_a$ is standard Borel, and $T_a$ carries a $sigma$-finite measure $mu_a$. The plaques $kappa_a \( { t } times Q_a \)$ fit together as oriented smooth $d$-manifolds, each Hausdorff and second countable, and each plaque is open in its leaf. The overlap of two boxes is a countable union of pieces on which the change of transverse coordinate is a Borel bijection between Borel subsets, preserves the transverse measures, and the change of leaf coordinate is a smooth orientation-preserving diffeomorphism on open sets, depending Borel measurably on the transverse coordinate. All functions and tensor fields below are Borel in the boxes and smooth on plaques. This convention also applies to an open subset along the leaves, whose leaves are the connected components of that subset.

The measures $d mu_a \( t \) thin d V_h$ in the boxes define a single measured Riemannian volume, denoted simply by $d V_h$. The same convention, with leafwise area in place of volume, defines $d A_h$ on regular submanifolds. One may partition among countably many boxes to define either integral; the equality on overlaps follows from invariance of the transverse measures. From a plaque, all plaques on its leaf have a countable Borel enumeration, obtained by following finite strings of overlap maps. In particular the saturation of a transverse null set is still null in every transversal. We shall discard such saturations when an assertion holds on almost all plaques.

For $t > 0$ write $Q_t^d = \( - t \, t \)^d$; in dimension zero this denotes one point. We write $\| G \|_oo = max_i \| G_i \|$, with the empty maximum interpreted as zero.

#prodef([Definition 5.1.])[
  (Controlled measured band).  Let $T > 0$. A controlled measured $d$-band over $Q_T^d$ consists of a measured space of oriented $d$-manifolds as above, a leafwise metric $h$, a function $phi.alt$, and a map $G = \( G_1 \, dots.h \, G_d \) : X arrow.r Q_T^d$. For every $0 < t < T$ the part ${ \| G \|_oo lt.eq t }$ has a countable flow-box cover with the following properties.
  + The boxes have one common positive size and fixed positive buffers: their smaller concentric boxes cover the indicated part. They can be chosen inside ${ \| G \|_oo < t' }$ for some $t < t' < T$. After rescaling coordinates we may, and do, call them unit boxes with buffers.
  + In these boxes the coefficients of $h$ and $h^(- 1)$ and all their leafwise coordinate derivatives are bounded by constants common to the cover. The same holds for all derivatives of $G$ and for all positive-order derivatives of $phi.alt$. No bound on the value of $phi.alt$ is required.
  + The sum of the measures of the transversals of this cover is finite. There is a common bound on the number of plaques of the cover whose buffered boxes meet any one plaque of the cover.
  The cover and every bound in this definition may depend on $t$ and on the given band. The leaves are not assumed complete, and $G$ is not assumed proper.
] <def:degree-band>

For $d gt.eq 1$, the stated control implies the version of Stokes’ theorem used here. To see this, choose a smooth cutoff in each buffered box which is one on its inner box. Dividing the cutoffs by their sum gives a leafwise smooth, Borel partition of unity on a slightly smaller inner band. The overlap bound makes the sum locally finite and bounds all its derivatives. The metric and inverse-metric bounds give uniform bounds for these derivatives in geometric norms. Consequently, for a leafwise smooth $\( d - 1 \)$-form $eta$ supported over a compact subcube, with $eta$ and $d eta$ uniformly bounded there, chartwise Stokes and Fubini give

$ integral_X d eta = 0 . quad "(5.1)" $ <eq:degree-stokes>

Indeed, each cutoff multiple of $eta$ is compactly supported in its plaque, and the sum of the absolute integrals is bounded by a constant times the sum of the transverse measures. The terms differentiating the partition cancel because its sum is one. The same argument gives measured Stokes for leafwise currents with uniform local mass and boundary-mass bounds in those boxes: apply the current identity in each plaque to the cutoff multiple of a test form and then sum. This includes test forms whose pullbacks have noncompact support in a leaf. We will always verify the indicated local bounds before using current Stokes.

If $omega$ is a smooth, compactly supported $d$-form on $Q_T^d$ with $integral_(Q_T^d) omega = 1$, define

$ cal(D)_X \( G \) = integral_X G^(*) omega . quad "(5.2)" $ <eq:degree-definition>

The integral is absolute: its support lies in an inner band, the derivatives of $G$ there are bounded, and that band has finite measured volume. For $d gt.eq 1$, a compactly supported top form on a cube of integral zero has a compactly supported primitive. Applying (5.1) to the pullback of this primitive shows that (5.2) is independent of $omega$. This is the #emph[measured degree], with the usual signed orientation convention. For $d = 0$ it means the measured signed count of the oriented points. We abbreviate it to $cal(D)$ when the band and map are understood.

#thm([Theorem 5.2.])[
  (Measured degree estimate).  #emph[There are absolute constants $C_0 \, C_1 > 0$ with the following property. Let $q gt.eq 2$, let $d$ be an integer with $0 lt.eq d lt.eq q$, and let $tau > 0$. For $0 lt.eq r lt.eq d$ set 
$ T_r = 2 tau + frac(r tau, q) \, #h(2em) b_r = tau (1 + frac(1, 2 q) + frac(r, 4 q^2)) . quad "(5.3)" $ <eq:degree-widths>

 Suppose $\( X \, h \, phi.alt \, G \)$ is a controlled measured $d$-band over $Q_(T_d)^d$ in the sense of Definition 15. Let $B gt.eq 1$ and $L_1 \, dots.h \, L_d > 0$. Suppose throughout $X$ that 
$ L_i \| d G_i \|_h lt.eq B - d / q #h(2em) \( 1 lt.eq i lt.eq d \) \, quad "(5.4)" $ <eq:degree-horizon-bound>

 and suppose that 
$ frac(C_0 \( 1 + B \)^(2 \/ 3), L_i) < frac(tau, 10 q) #h(2em) \( 1 lt.eq i lt.eq d \) . quad "(5.5)" $ <eq:degree-horizon>

 Define $H_i \( G \) = 2 \( L_i \| d G_i \|_h - 1 \)_(+)$. Then 
$ \| cal(D)_X \( G \) \| \( 2 tau \)^d lt.eq frac(exp \( C_1 d \/ q \), product_(i = 1)^d L_i) integral_({ \| G \|_oo < b_d }) exp (frac(- cal(S) \( h \, phi.alt \) + sum_(i = 1)^d H_i \( G \), 2)) d V_h . quad "(5.6)" $ <eq:degree-estimate>

 For $d = 0$ the product is one, the sum is zero, and $cal(S) \( h \, phi.alt \) = 0$; the assertion is the bound of a signed count by the unsigned count.]
] <thm:degree>

The proof removes one coordinate at a time. For $r gt.eq 1$, the gaps $T_r - T_(r - 1) = tau \/ q$ and $b_r - b_(r - 1) = tau \/ \( 4 q^2 \)$ supply, respectively, chart buffers and room for the residual value error when locating the integration core, while the permitted scaled gradient of each retained coordinate increases by $1 \/ q$. A family of boundaries ordered by a real parameter supplies the factor $2 tau$ on the left. Its normal speed supplies the coarea factor on the right. In dimensions where the boundaries can be singular we will construct a regular band of the same degree; a scalar gain will pay exactly for the volume of the graphs used to construct it. The following formulation separates that construction from the final induction.

#thm([Lemma 5.3.])[
  (One step of measured descent).  #emph[Assume the hypotheses of Theorem 16 with $d gt.eq 1$, put $p = d - 1$, and put 
$ Theta = exp (frac(- cal(S) \( h \, phi.alt \) + sum_(i = 1)^d H_i \( G \), 2)) . $

 There is a Borel family of oriented regular hypersurface portions $Sigma_s$ in the leaves, $- tau < s < tau$, and, for almost every $s$, a positive function $v_s$ on $Sigma_s$, smooth along it and Borel in its charts, with the following properties. Transverse null subsets and their saturations may be removed for each such $s$.]
  + #emph[For every nonnegative Borel function $F$ supported in ${ \| G \|_oo < b_d }$, 
$ integral_(- tau)^tau #h(-1em) d s integral_(Sigma_s) v_s F thin d A_h lt.eq integral_X F thin d V_h . quad "(5.7)" $ <eq:degree-coarea>

]
  + #emph[For each such $s$ there is a controlled measured $p$-band $\( X_s^(+) \, h_s^(+) \, phi.alt_s^(+) \, J_s^(+) \)$ over $Q_(T_p)^p$ of degree $cal(D)_X \( G \)$. Its coordinates are indexed by $j = 2 \, dots.h \, d$ and satisfy 
$ L_j \| d J_(s \, j)^(+) \|_(h_s^(+)) lt.eq B - p / q . $

 With $H_j^(+) = 2 \( L_j \| d J_(s \, j)^(+) \|_(h_s^(+)) - 1 \)_(+)$, there is an absolute constant $C_(*) > 0$ such that 
$ & integral_({ \| J_s^(+) \|_oo < b_p }) exp (frac(- cal(S) \( h_s^(+) \, phi.alt_s^(+) \) + sum_(j = 2)^d H_j^(+), 2)) d V_(h_s^(+))\
 & thin lt.eq e^(C_(*) \/ q) / L_1 integral_(Sigma_s ∩ { \| G \|_oo < b_d }) v_s Theta thin d A_h . quad "(5.8)" $ <eq:degree-child-integral>

 In dimension $p = 0$ the left side is the measured unsigned count.]
  #emph[The child in the second assertion may be chosen separately for each typical $s$; no measurability of those choices in $s$ is asserted or needed.]
] <lem:degree-descent>

=== 5.2 An ordered family of boundaries <an-ordered-family-of-boundaries>

We prove Lemma 17 in this and the next two subsections. Fix intermediate widths

$ T_p < t_1 < t_2 < t_3 < t_4 < T_d . quad "(5.9)" $ <eq:degree-intermediate-widths>

Whenever a chart buffer is needed, choose further intermediate widths between these. The width $t_4$ controls confinement and the parent charts, $t_3$ contains the boundary portions to be used, $t_2$ will bound an auxiliary complete region, and $t_1$ will bound the child. Such choices can depend on the given band.

Choose once and for all a smooth even function $gamma$ with $0 lt.eq gamma \( y \) lt.eq y^2$ and with $gamma \( y \)$ bounded above and below by positive absolute multiples of $\| y \|^(3 \/ 2)$ for $\| y \| gt.eq 1$. Let $P_0$ be the solution about zero of

$ P_0 \( 0 \) = 0 \, #h(2em) P'_0 = L_1 psi \( P_0 \) \, #h(2em) psi \( y \) = 1 + frac(gamma \( y \), 8 \( 1 + B \)) . quad "(5.10)" $ <eq:degree-pressure>

It is odd and increasing and has poles at $plus.minus b$, where

$ b = 1 / L_1 integral_0^oo frac(d y, psi \( y \)) lt.eq frac(C \( 1 + B \)^(2 \/ 3), L_1) . $

For the inequality, split the integral at $\( 1 + B \)^(2 \/ 3)$ and use the $\| y \|^(3 \/ 2)$ bound on the tail. Choose the absolute $C_0$ in (5.5) at least this $C$. Thus

$ b < frac(tau, 10 q) . quad "(5.11)" $ <eq:degree-pole-width>

===== 5.2.1 The local slice calculation. <the-local-slice-calculation.>

We first record the analytic purpose of the pressure law. Let $Sigma$ be a smooth cooriented local hypersurface, with unit normal $nu$, and set

$ D = H + partial_nu phi.alt \, #h(2em) H = "tr" upright("II") \, #h(2em) upright("II") \( Y \, Z \) = chevron.l nabla_Y nu \, Z chevron.r \,\
cal(P) = \| upright("II") \|^2 + \( "Ric"_h - nabla^2 phi.alt \) \( nu \, nu \) . $

Put $frak(a) = L_1 psi \( D \) > 0$. When $D = P_0 \( s - G_1 \)$, the derivatives of the raw pressure are $partial_s P_0 \( s - G_1 \) = frak(a)$ and $d_x P_0 \( s - G_1 \) = - frak(a) thin d G_1$. The following calculation uses only a positive smooth function $v$ satisfying the local equation

$ - #scale(x: 120%, y: 120%)[\(] Delta_(Sigma \, phi.alt) + cal(P) - frak(a) thin d G_1 \( nu \) #scale(x: 120%, y: 120%)[\)] v = frak(a) . quad "(5.12)" $ <eq:degree-local-lapse>

Here $Delta_(Sigma \, phi.alt)$ is weighted by $e^(phi.alt \|_Sigma) d A_h$, and slice norms use the induced metric. The ordered construction below will produce this equation on almost every regular slice.

Put $phi.alt_Sigma = phi.alt \|_Sigma + ln v$ and $S_Sigma = cal(S) \( h \|_(T Sigma) \, phi.alt_Sigma \)$. Gauss’ equation and the normal/tangential decomposition of derivatives of $phi.alt$ give

$ cal(S) \( h \|_(T Sigma) \, phi.alt \|_Sigma \) = cal(S) \( h \, phi.alt \) + D^2 - 2 cal(P) + \| upright("II") \|^2 . $

Adding $ln v$ to the weight changes this by $- 2 Delta_(Sigma \, phi.alt) v \/ v + \| d ln v \|^2$. Substitution of (5.12) yields the exact identity

$ S_Sigma = cal(S) \( h \, phi.alt \) + D^2 - 2 frak(a) thin d G_1 \( nu \) + \| upright("II") \|^2 + frac(2 frak(a), v) + \| d ln v \|^2 . quad "(5.13)" $ <eq:degree-slice-identity>

This is also the hypersurface calculation behind Lemma 5; it is valid for $p = 0$ with left side zero.

Set $t = L_1 \| d G_1 \|_h lt.eq B$ and $x = v \/ L_1$. Since $gamma \( D \) lt.eq D^2$,

$ - 2 frak(a) thin d G_1 \( nu \) gt.eq - 2 t (1 + frac(gamma \( D \), 8 \( 1 + B \))) \, #h(2em) frac(t gamma \( D \), 4 \( 1 + B \)) lt.eq D^2 / 4 . $

We may discard the remaining nonnegative part of $D^2$, and use $2 frak(a) \/ v gt.eq 2 \/ x$. Finally, $t lt.eq 1 + \( t - 1 \)_(+)$ and $x^(- 1) + ln x gt.eq 1$ for $x > 0$. Thus (5.13) implies

$ S_Sigma gt.eq cal(S) \( h \, phi.alt \) - H_1 \( G \) - 2 ln \( v \/ L_1 \) + \| d ln v \|^2 . quad "(5.14)" $ <eq:degree-slice-bound>

The square term will be used later when the weight is changed near singular points. For $j = 2 \, dots.h \, d$, put $H_j^Sigma = 2 \( L_j \| d_Sigma G_j \| - 1 \)_(+)$. Tangential restriction gives $H_j^Sigma lt.eq H_j \( G \)$, so the full pointwise density comparison is

$ exp (frac(- S_Sigma + sum_(j = 2)^d H_j^Sigma, 2)) lt.eq v / L_1 e^(- \| d ln v \|^2 \/ 2) Theta lt.eq v / L_1 Theta . quad "(5.15)" $ <eq:degree-raw-integrand>

For $p = 0$ the sum and slice gradient are zero, and the left side is one. The remaining work supplies the slices and speeds, and verifies the controlled-band and degree conditions needed to use this comparison.

For a small $eta > 0$, prolong $P_0$ smoothly and strictly increasingly past the points $plus.minus \( b - eta \)$, keeping it unchanged on $\[ - b + eta \, b - eta \]$. Denote the resulting smooth function by $hat(P)$ and set

$ frak(h)_s \( x \) = hat(P) \( s - G_1 \( x \) \) \, #h(2em) - tau < s < tau . $

We will choose $eta$ sufficiently small for the given band and then keep it fixed. On every boundary portion used below, $hat(P)$ will agree with $P_0$ and hence obey (5.10).

===== 5.2.2 Least minimizers, including on noncompact leaves. <least-minimizers-including-on-noncompact-leaves.>

Write $P_phi.alt \( E \; U \) = integral_(partial^(*) E ∩ U) e^phi.alt thin d A_h$ for the weighted perimeter of a set of locally finite perimeter. We use local differences of the functional

$ P_phi.alt \( E \) - integral_E frak(h)_s e^phi.alt thin d V_h . quad "(5.16)" $ <eq:degree-functional>

This is a weighted $mu$-bubble functional. For soap bubbles in Gromov’s terminology, see [12] Section 5$5 / 6$; for the weighted functional and its local first- and second-variation formulas, see also [4] Section 3, Equation (1), and Lemmas 13–14. Neither term is required to be finite on the whole leaf. In particular, this construction uses no global weighted-volume bound.

The output will be a canonical nested family $E_s$ on each open leaf, independent of the exhaustion and jointly Borel in the plaque data and $s$. Each $E_s$ will minimize these local differences for compact variations. The local comparison argument also supplies the perimeter compactness needed later to turn convergence of sets into graphical convergence at regular limit points. We establish these properties in turn, before confining the boundaries to the raw-pressure region.

#emph[Compact domains and leastness.] For a compact subset $K$ of a leaf, minimize (5.16) over sets which vanish off $K$, using their full perimeter in the leaf. The empty set is a competitor. On a neighborhood of $K$ the density is smooth and positive and the forcing is bounded. A bound on the functional therefore gives a perimeter bound, and BV compactness and lower semicontinuity give a minimizer; see, for example, [17] Theorem 12.26 for the compactness theorem. Among the minimizers choose one of minimum ordinary volume. The weighted perimeter satisfies

$ P_phi.alt \( E ∩ F \) + P_phi.alt \( E union F \) lt.eq P_phi.alt \( E \) + P_phi.alt \( F \) \, $

and the volume term for a fixed forcing is additive under union and intersection. Thus the intersection of any two minimizers is again a minimizer. Minimum volume forces the selected minimizer to be contained, up to null sets, in every other one. It is consequently unique as an $L^1$ set; call it the least minimizer in $K$.

#emph[Order and exhaustion.] The same inequality proves both monotonicities we need. If $K subset K'$ and two forcings satisfy $frak(h) lt.eq frak(h)'$, a minimizer for $\( K \, frak(h) \)$ and one for $\( K' \, frak(h)' \)$ obey

$ cal(F)_(frak(h)) \( E ∩ F \) + cal(F)_(frak(h)') \( E union F \) lt.eq cal(F)_(frak(h)) \( E \) + cal(F)_(frak(h)') \( F \) \, $

where $cal(F)$ denotes (5.16); the inequality for the volume terms follows on $E \\ F$ from $frak(h) lt.eq frak(h)'$. Minimality in the two domains makes both inequalities equalities, and leastness in $K$ implies $E subset F$. Exhaust a leaf by increasing finite unions of compact coordinate subboxes whose interiors exhaust it. The least minimizers increase with this exhaustion. Their union, interpreted in $L_(upright("loc"))^1$, is independent of the exhaustion, since each compact subset of either exhaustion is eventually contained in one of the other. This defines $E_s$, and the forcing monotonicity makes $E_s subset E_t$ for $s < t$.

#emph[Local comparison.] The limit must still minimize for compact variations, since all later regularity and compactness arguments use that property. Ball replacement in a relatively compact chart gives uniform local perimeter bounds for the exhaustion minimizers: choose a radius with controlled slicing area, replace the set inside that ball by the full or empty ball, and bound the forcing term by its local supremum times the ball volume. Thus the increasing sets converge locally in BV weakly and in $L^1$. To pass a comparison to the limit, surround the compact region to be changed by a thin outer belt on which the proposed competitor agrees with $E_s$. Choose a Lipschitz coordinate level function across the belt. Coarea bounds the integral, over its levels, of the trace mismatch between an exhaustion minimizer and $E_s$ by their $L^1$ mismatch in the belt. One may therefore splice the proposed competitor inside a level to the exhaustion minimizer outside it so that the extra trace area tends to zero. The levels can also be chosen with zero limiting perimeter on their boundaries, since this excludes only a null set of levels. Minimality before passage to the limit, convergence of the bounded forcing integrals, and lower semicontinuity give the compact comparison for $E_s$. The same argument applies under smooth local convergence of the metric, density, and forcing coefficients. Below we apply it with the unchanged limit as competitor to prove convergence of the local perimeter measures. Multiplying a density by a positive constant has no effect on any of these comparisons.

#emph[Borel dependence.] We explain why all these choices are Borel, including jointly in $s$. For this coding, subdivide the original atlas into bounded coordinate boxes with compact closure in the older boxes, and affinely normalize each to one fixed cube $Q = \( - 1 \, 1 \)^d$. Fix once a countable list $\( R_ell \)_(ell gt.eq 1)$ of all open rational boxes with closure in $Q$. Starting at a plaque, enumerate its accessible normalized plaque occurrences Borel measurably in slots $j gt.eq 1$, using dummy slots when necessary. Use the fixed Polish space

$ cal(Z) = product_(j \, ell gt.eq 1) L^1 \( R_ell \) \, $

with Lebesgue $L^1$ norms and the product topology. A set is coded by its indicator on $R_ell$ in occurrence $j$; dummy entries are zero. Compatibility is tested on compact exhaustions of all overlap domains, including repeated occurrences. The closures of the first finitely many accessible $R_ell$ in a fixed enumeration of the pairs $\( j \, ell \)$ give the compact exhaustion domains. The conditions that the code is an indicator, agrees on overlaps, and vanishes off the specified domain are Borel, and for fixed plaque data are closed in $cal(Z)$.

Integrals against chartwise Borel smooth densities are Borel by Fubini. Perimeter is Borel as well: its supremum over divergence integrals may be taken over fixed countable families of rational smooth test fields in the $R_ell$, and finite sums of them. Partitions of unity in a leaf show density among all compactly supported tests. Norm constraints are checked on countably many dense coordinate points; overlap maps and a partition by the first covering chart make the integrals Borel.

Fix one plaque-data fiber and one compact exhaustion domain $K$. A functional sublevel for sets supported in $K$ bounds their weighted perimeter, since the forcing integral is uniformly bounded on this fixed compact set. In every active $R_ell$ the metric and density have a positive lower bound on its closure, so this gives a Euclidean BV bound there; the indicator’s $L^1 \( R_ell \)$ norm is bounded by $\| R_ell \|$. Diagonal BV compactness gives convergence in $cal(Z)$ along a subsequence. The fiberwise closed indicator, overlap, and support conditions persist. The volume term is continuous, since $K$ is covered by finitely many compact subboxes, and perimeter is lower semicontinuous. Each sublevel is therefore compact in this fixed Polish product. These compactness bounds may depend on the fiber and on $R_ell$; the projection theorem requires compact fibers, not a common bound across plaque data. Strict sublevels are countable unions of such compact sections. The Borel projection theorem for sets with $sigma$-compact sections therefore makes the minimum value a Borel function of the chart data. Apply it again to minimize volume in the compact set of minimizers. The selected section is a singleton in the $L^1$ coding, by leastness, so the Borel singleton-section theorem gives the selected minimizer as a Borel function. These are standard forms of the Arsenin–Kunugui and Lusin–Souslin theorems; see [14] Theorem 18.18 and Corollary 15.2. The exhaustion limits agree for different starting plaques by exhaustion independence. They are therefore Borel on the measured space. We may use the density-one representative of $E_s$; the support of its boundary measure is also Borel, by testing its mass on a countable basis of coordinate balls.

===== 5.2.3 Confinement. <confinement.>

For sufficiently small $eta$, uniformly for $- tau < s < tau$, the boundary support in ${ \| G \|_oo lt.eq t_4 }$ satisfies

$ "supp" partial \[ E_s \] ∩ { \| G \|_oo lt.eq t_4 } subset { \| s - G_1 \| < b - eta } . quad "(5.17)" $ <eq:degree-confinement>

In this inner band the side $G_1 lt.eq s - b + eta$ is full and the side $G_1 gt.eq s + b - eta$ is empty, up to null sets. To prove this uniform claim, the ODE at the positive pole gives

$ b - x = 1 / L_1 integral_(P_0 \( x \))^oo frac(d y, psi \( y \)) asymp_(upright("inst")) P_0 \( x \)^(- 1 \/ 2) quad \( x arrow.t b \) . $

Thus at distance comparable to $eta$ from a pole the absolute forcing is at least $c_(upright("inst")) eta^(- 2)$. The prolongation is monotone, so this remains a lower bound beyond that position. By the uniform derivative bound on $G_1$, a chart ball of radius $r = c'_(upright("inst")) eta$ centered at a point with $s - G_1 gt.eq b - eta$ has forcing at least $H = c''_(upright("inst")) eta^(- 2)$ throughout it, if $c'_(upright("inst"))$ is small. The balls are taken in a buffered atlas for a slightly larger band than $t_4$.

Here is the phase-exclusion estimate in such a ball. Normalize the weighted density by its value at the center; the derivative bounds for $phi.alt$ make this density uniformly comparable to coordinate volume in the ball. Let $V \( t \)$ be the normalized volume of the complementary phase in a concentric coordinate ball $B_t$. Comparison with the set which fills $B_t$, and perimeter slicing, give for almost every $t < r$

$ P_(upright("norm")) \( E_s \; B_t \) + H V \( t \) lt.eq C V' \( t \) . $

The chart isoperimetric inequality applied to that complementary phase, extended by zero outside $B_t$, gives, when $V \( t \) > 0$,

$ V \( t \)^(\( d - 1 \) \/ d) lt.eq C #scale(x: 120%, y: 120%)[\(] P_(upright("norm")) \( E_s \; B_t \) + V' \( t \) #scale(x: 120%, y: 120%)[\)] . $

If the complementary phase occurs in $B_(r \/ 4)$, the two inequalities first give $V' gt.eq c V^(\( d - 1 \) \/ d)$ and hence $V \( r \/ 2 \) gt.eq c r^d$. They also give $V' gt.eq c H V$ on $\[ r \/ 2 \, r \]$. It follows that $V \( r \) gt.eq c r^d exp \( c H r \)$, contrary to $V \( r \) lt.eq C r^d$ when $H r$ is large. This argument includes $d = 1$, where the first differential inequality has exponent zero. Since $H r asymp_(upright("inst")) eta^(- 1)$, small $eta$ excludes the complementary phase in the smaller ball. Negative forcing gives the empty phase by the same argument. Applying these balls beginning at $\| s - G_1 \| = b - eta$, with a small fixed extra margin in the forcing estimate, proves (5.17). In particular the unprolonged Equation (5.10) holds on all the boundary portions used in the proof.

===== 5.2.4 The local regularity and compactness inputs. <the-local-regularity-and-compactness-inputs.>

We record precisely the local geometric measure theory used from now on. Set $Sigma_s^(upright("all")) = "supp" partial \[ E_s \]$. For $d gt.eq 2$, its regular portion is a smooth multiplicity-one hypersurface. The remaining set is closed in $Sigma_s^(upright("all"))$ and has Hausdorff dimension at most

$ p - 7 . quad "(5.18)" $ <eq:degree-singular-dimension>

It is empty if this number is negative. These conclusions hold in each relatively compact chart. To place our functional under the standard codimension-one theorem, normalize $phi.alt$ by a constant value $phi.alt_0$ in the chart and use the smooth metric

$ hat(h) = e^(2 \( phi.alt - phi.alt_0 \) \/ p) h . $

Its area is the normalized weighted area. Its volume forcing is $frak(h)_s e^(- \( phi.alt - phi.alt_0 \) \/ p)$, bounded smoothly in a smaller chart. Minimality implies that its perimeter is minimizing up to a fixed multiple of the volume of the symmetric difference for compact variations. The regularity theorem for such almost-minimizing boundaries gives $C^(1 \, alpha)$ regularity off a closed set of dimension (5.18); see [5] Theorem A.1 and Remark A.3. The weak prescribed mean-curvature equation on this regular portion and elliptic regularity then make it smooth. The cited almost-minimizing formulation uses integral-current variations. It applies to these set variations as follows. Add a compactly supported ambient-dimensional integral current to $\[ E_s \]$ and truncate its integer BV multiplicity to the interval $\[ 0 \, 1 \]$. BV truncation does not increase boundary mass, and the volume where the resulting set changes is at most the mass of the added current. The set comparison therefore implies that formulation as well.

#emph[Local compactness claim.] Suppose $d gt.eq 2$ and $E_j$ minimize the absorbed-perimeter functionals for all compact variations in a common buffered normalized outer chart. Assume that their absorbed metrics and converted volume forcings converge smoothly on smaller boxes and that $E_j arrow.r E$ in $L_(upright("loc"))^1$. Then $E$ is locally minimizing, the normalized perimeter measures and the associated boundary varifolds converge weakly locally to those of $E$, and the supports converge locally. Near every regular point of the limiting boundary, the boundaries are single smooth graphs converging in $C^oo$ on a cylinder which may depend on that point. In particular, for every relatively compact continuity subdomain $U$, meaning that the limiting perimeter of $partial U$ is zero, the perimeter masses on $U$ converge. For the minimizing boundaries considered here, every sequence of controlled plaques from the fixed band and fixed forcing construction has a subsequence satisfying these coefficient and set convergence hypotheses after normalization.

Here is the proof, including the local perimeter assertion. In the common normalized coordinates subtract the value of $phi.alt$ at the chart center. The common bounds on all derivatives, and the metric and inverse-metric bounds, make the normalized metric, weight, and forcing coefficients precompact in $C^oo$ on every smaller fixed box, by diagonal Arzelà–Ascoli. Pass to such a convergent subsequence; in particular the absorbed metrics $hat(h)_j$ converge smoothly to a positive metric $hat(h)_oo$. Ball comparison gives the local perimeter bounds used above, so BV compactness gives a further subsequence converging in $L_(upright("loc"))^1$ to a set $E$. The belt comparison with any compact variation, as proved above and now with the smoothly converging coefficients, shows that $E$ is locally minimizing.

Write $mu_j = P_(hat(h)_j) \( E_j \; thin dot.op thin \)$ and $mu_oo = P_(hat(h)_oo) \( E \; thin dot.op thin \)$. To prove convergence of these measures, begin with a relatively compact coordinate domain $V$ from a convergence-determining family, chosen so that $mu_oo \( partial V \) = 0$. Surround it by a thin outer belt with level domains $V_t$ contained in an outer enlargement $V_epsilon.alt$. Coarea chooses a level $t_j$ at which the trace mismatch between $E_j$ and $E$ tends to zero. Splice the unchanged $E$ inside $V_(t_j)$ to $E_j$ outside. The common coefficient bounds make the extra perimeter at the splice tend to zero, and the bounded converted forcing times the $L^1$ mismatch tends to zero as well. Minimality of $E_j$ gives

$ limsup_(j arrow.r oo) mu_j \( V \) lt.eq mu_oo \( V_epsilon.alt \) . $

Here the perimeter of the fixed set $E$ in the varying metric converges by uniform convergence of the metric integrands on unit conormals. Shrinking the belt makes the right side tend to $mu_oo \( V \)$, because $mu_oo \( partial V \) = 0$. Lower semicontinuity gives the reverse inequality. Such coordinate continuity domains determine weak local convergence of Radon measures; the local mass bounds give compactness, and the equality just proved identifies every subsequential limit. Consequently $mu_j$ converge weakly locally to $mu_oo$, and their masses converge on every relatively compact continuity subdomain $U$.

For precision in passing to varifolds, restrict to a relatively compact subdomain $U$ whose boundary has zero limit perimeter measure. Such continuity subdomains can exhaust the smaller box. To check weak convergence of the restrictions of $D upright(bold(1))_(E_j)$ as vector measures on $overline(U)$, extend a continuous vector test there to the outer chart and multiply it by a cutoff supported in $U$ and equal to one away from a $delta$-collar of $partial U$. Local weak BV convergence handles this cutoff test. On the compact chart uniform ellipticity gives $\| D upright(bold(1))_(E_j) \| lt.eq C mu_j$. For a compact closed $delta$-collar $F_delta$, weak perimeter convergence and the closed-set inequality give $limsup_j mu_j \( F_delta \) lt.eq mu_oo \( F_delta \)$, which tends to zero as $delta arrow.b 0$ because $mu_oo \( partial U \) = 0$. The same bound for the limiting vector measure lets the collar shrink and proves the restriction convergence. The perimeter masses on $U$ also converge. In coordinates the perimeter integrand for a metric $k$ is $frak(p)_k \( x \, z \) = sqrt(det k \( x \)) thin \| z \|_(k^(- 1) \( x \))$. Uniform convergence of this integrand on unit conormals and the local mass bound replace $hat(h)_j$ by $hat(h)_oo$ in that mass convergence. This is convergence for one continuous positively one-homogeneous integrand with Reshetnyak’s strict convexity property: equality in its triangle inequality occurs only for vectors on a common nonnegative ray. Reshetnyak’s continuity theorem [22] Section 4, Theorem 3 consequently gives convergence for every continuous positively one-homogeneous integrand with linear growth. For a continuous compactly supported varifold test $a \( x \, P \)$, use $frak(p)_(hat(h)_oo) \( x \, z \) a \( x \, ker z \)$ for $z eq.not 0$ and zero at $z = 0$. This gives precisely the local varifold convergence; the uniform convergence of the metric integrands gives it also for the original varying metrics.

To prove the support and graph assertions, the first variation in the metric $hat(h)$ is, by BV Gauss–Green, integration of the bounded volume forcing against the reduced-boundary conormal. It therefore has bounded mean curvature and no singular part. The monotonicity formula gives a common positive lower mass bound in a small ball about a support point, starting with the unit density at almost every reduced-boundary point. This lower bound rules out support points a fixed distance from the limit support. Conversely, every ball about a point of the limit support has positive limit mass, so weak convergence forces nearby support points. Near a fixed smooth multiplicity-one sheet of the limit, Allard’s interior regularity theorem gives single graphs with a common $C^(1 \, alpha_(upright(A)))$ bound for some $alpha_(upright(A)) in \( 0 \, 1 \)$ on a smaller cylinder [1]. Compactness and identification of the already known varifold limit give $C^(1 \, beta)$ graph convergence for every $0 < beta < alpha_(upright(A))$. The prescribed equation, with the smoothly converging coefficients, then gives $C^oo$ convergence on still smaller cylinders by interior elliptic estimates. The cylinder here may depend on the fixed regular point of the limit; uniform graph radii in later applications will follow from their separate compactness contradictions.

The varying-metric use of these local theorems reduces to one smooth ambient metric as follows. Pass further in a smaller compact chart to a subsequence converging so rapidly in $C^oo$ that its metric is realized on slices $2^(- j)$ of one extra coordinate, with the limiting metric on slice zero. Indeed, choose the error through order $j$ below $2^(- j^2)$ and interpolate by disjoint smooth interval cutoffs. The resulting product block-diagonal metric is smooth; its slices have bounded second forms. After smoothly extending from a still smaller box to a closed manifold, a smooth Nash embedding puts this situation in a single Euclidean ambient space [19] Theorem 2, p. 59. The preceding monotonicity and Allard statements apply there, with the same local bounded-mean-curvature property. Applying this subsequence argument to a sequence on which local convergence failed proves the local support and graphical convergence asserted above.

For $d = 1$ the needed facts are elementary. A locally minimizing set has locally finitely many jumps by the perimeter bound. Two consecutive jumps cannot be arbitrarily close in a controlled chart, since one can replace the interval between them by the surrounding phase: delete it if full, and fill it if empty. This saves two weighted boundary costs and changes the forcing integral by a quantity tending to zero. Thus the jumps have uniform local separation. The same belt argument applies directly to normalized weighted perimeter in dimension one, without conformal absorption, and gives local perimeter convergence together with BV convergence. The separation then gives the corresponding convergence of these zero-dimensional regular boundaries. There are no singular points in this case.

=== 5.3 The lapse, coarea, and the descended degree <the-lapse-coarea-and-the-descended-degree>

We now extract a smooth normal speed from the ordered family. Write $Sigma_s$ for the regular part of $Sigma_s^(upright("all"))$ in ${ \| G \|_oo < t_3 }$. The boundary has its exterior coorientation and the induced orientation. Its singular set has zero $p$-dimensional area, so it never contributes to the integrals over the boundary current.

===== 5.3.1 Differentiating the ordered family. <differentiating-the-ordered-family.>

On each leaf the sets $E_t$ converge to $E_s$ in $L_(upright("loc"))^1$ as $t arrow.r s$ except at countably many $s$. In fact, on a compact chart set $K$ the function $t mapsto integral_K upright(bold(1))_(E_t)$ is monotone, and nestedness identifies its increments with the $L^1 \( K \)$ distance between the indicators. It has at most countably many discontinuities. Use the countable chart exhaustion to obtain the assertion on the leaf. At such a continuity parameter, the local convergence result above makes $Sigma_t$ converge smoothly and graphically near each regular point of $Sigma_s$ as $t arrow.r s$.

In a smaller graph cylinder choose coordinates $\( y \, z \)$ with the sets below the graphs, and write the graph heights as $z = r \( t \, y \)$. They are monotone in $t$. They are strictly ordered wherever two such regular graphs are defined: if $r \( t \, dot.op \) gt.eq r \( s \, dot.op \)$ for $t > s$ and they touch, their tangent planes agree at contact. The comparison of the graph mean curvatures at that minimum of $r \( t \, dot.op \) - r \( s \, dot.op \)$ gives $D_t lt.eq D_s$, whereas their equations give $D_t = frak(h)_t > frak(h)_s = D_s$ at the same point. This is impossible. We use the conventions for $D$ and $upright("II")$ from the local slice calculation, with $nu$ the exterior unit normal. The equation $D = frak(h)_s$ is the first variation of (5.16) on a regular portion.

Choose countably many possible graph cylinders in the chart enumerations, and in each choose a countable dense set of $y$-coordinates. At each of these coordinates a monotone height has a finite derivative for almost every parameter. The test is meaningful even outside an interval of graphical representation: use instead the monotone column function

$ t mapsto integral_(z_(-))^(z_(+)) upright(bold(1))_(E_t) \( y \, z \) thin d z \, $

which equals $r \( t \, y \) - z_(-)$ in the single-graph situation. Consequently, for almost every continuity parameter $s$, the nonnegative difference quotients

$ w_t \( y \) = frac(r \( t \, y \) - r \( s \, y \), t - s) \, #h(2em) t eq.not s \, $

converge to the finite column-derivative values as $t arrow.r s$ at all these dense test coordinates. In particular they are bounded there.

In positive graph dimension the $w_t$ solve linear elliptic equations on each smaller cylinder. This follows by subtracting the two prescribed graph equations and integrating their linearizations between the two graphs. Smooth graphical convergence gives common smooth coefficient bounds and ellipticity; the explicit $t$-dependence of $frak(h)_t$ gives a smooth bounded source. Harnack’s inequality with a bounded source, applied using any one of the bounded test values, bounds $w_t$ on a smaller patch. Interior elliptic estimates then give smoothly convergent subsequences there; these are the standard local Harnack and interior estimates for uniformly elliptic equations with bounded lower-order coefficients and source, as in [9] Chapters 6 and 8. Every such limit takes the already determined derivative values at the dense test coordinates, so the limits agree. Thus the whole difference quotient has a smooth local limit. Its normal component is a smooth function $v gt.eq 0$ on the regular portion. For $p = 0$ the same conclusion follows from the ordinary almost-everywhere derivative of a monotone height.

Differentiation of $D = frak(h)_s$ now identifies this normal speed. Use $cal(P)$ from the local slice calculation and put $frak(a) = partial_s frak(h)_s = L_1 psi \( D \) > 0$; the last equality uses confinement, where the forcing agrees with the raw pressure. The normal variation formula, with the tangential derivative of $D - frak(h)_s = 0$ cancelling, is

$ - #scale(x: 120%, y: 120%)[\(] Delta_(Sigma \, phi.alt) + cal(P) + partial_nu frak(h)_s #scale(x: 120%, y: 120%)[\)] v = frak(a) . quad "(5.19)" $ <eq:degree-lapse>

The convention for $Delta_(Sigma \, phi.alt)$ is weighted by $e^(phi.alt \|_Sigma) d A_h$. The variation of $partial_nu phi.alt$ adds $v nabla^2 phi.alt \( nu \, nu \) - chevron.l d phi.alt \, d v chevron.r_Sigma$ to the ordinary mean-curvature variation, giving the signs in (5.19). A nonnegative $v$ cannot vanish at an interior point: there the left side is nonpositive, contrary to $frak(a) > 0$. Thus $v > 0$. In graph dimension zero the differential terms vanish and the same equation rules out $v = 0$.

These assertions hold jointly in the measured charts for almost every $s$. Here are the measurable details needed for that conclusion. Single-graph regions with buffers can be recognized by countably many cylinder tests on the $L^1$ subgraph codes, with slope and derivative bounds and with room at the top and bottom. Their smooth graph representative is unique; the Borel singleton-section theorem applied to its smooth-function code makes it Borel. The continuity and differentiability tests above use countable sequences, by monotonicity. The resulting local derivatives and $v$ are Borel. Fubini on each $sigma$-finite transversal now gives, for almost every $s$, a null set of exceptional plaques. There are countably many charts and overlap moves, so their saturations can be discarded simultaneously. In particular the family of regular portions and the function $v$ used in the integral below have the asserted Borel descriptions. Set $v = 0$ on the exceptional parameters and plaques when writing an integral over the whole parameter interval.

In a graph cylinder, normal speed times area has the expression

$ v thin d A_h = J_h \( y \, r \( s \, y \) \) thin partial_s r \( s \, y \) thin d y \, $

where $J_h \( y \, z \) thin d y thin d z$ is ambient Riemannian volume in the coordinates. The one-dimensional change-of-variables inequality for a monotone function says that integration against its almost-everywhere derivative counts at most integration in $z$. A jump or singular part of the monotone function only removes mass from the former integral. Apply this to each column and then integrate in $y$ and the transversal. Partition the counted portions among the countably many graph cylinders so they are not counted twice within one parameter. They cannot give the same ambient point at two parameters, by the noncontact argument above. Therefore no ambient point is counted more than once on the right. Equivalently, the counted images can be taken Borel by the Borel one-to-one image theorem. Transverse invariance on overlaps gives

$ integral_(- tau)^tau #h(-1em) d s integral_(Sigma_s) v F thin d A_h lt.eq integral_X F thin d V_h quad "(5.20)" $ <eq:degree-coarea-proof>

for every nonnegative Borel $F$ supported in ${ \| G \|_oo < t_3 }$. Since $b_d < t_3$, this proves (5.7).

We will require one more consequence of (5.19). On a family of regular graph patches with common buffers and graph estimates, all positive-order derivatives of $ln v$ have uniform bounds on smaller patches. Indeed the coefficients in (5.19) and the derivatives of $frak(a)$ are uniformly bounded there, and $frak(a)$ has a uniform positive lower bound. Confinement provides the finite margin from the pressure poles needed for these bounds. If the value of $v$ could tend to zero at an interior point of such patches, Harnack’s inequality with bounded source would bound $v$ on a smaller patch, and elliptic compactness would give a nonnegative limit with an interior zero satisfying (5.19), an impossibility. Thus $v$ has a positive local lower bound. Harnack then bounds its local supremum by a constant times its value at an interior point, since the bounded source can be absorbed using that lower bound. Interior estimates give $\| nabla^r v \| lt.eq C_r v$ on still smaller patches, and differentiating $ln v$ gives the claim. This does not bound the value of $ln v$, which is not required by Definition 15. For $p = 0$ the assertion about positive-order derivatives is empty.

The local slice calculation now applies to the actual boundaries. Confinement gives $D = frak(h)_s = P_0 \( s - G_1 \)$ and hence $partial_nu frak(h)_s = - frak(a) thin d G_1 \( nu \)$ on every retained regular portion. Equation (5.19) therefore becomes exactly (5.12). With $phi.alt_Sigma = phi.alt \|_Sigma + ln v$, the scalar bound (5.14) and the pointwise comparison (5.15) hold on these portions. The derivative bounds just proved supply the required local controls for this weight.

===== 5.3.2 Degree on the boundary. <degree-on-the-boundary.>

Let $J = \( G_2 \, dots.h \, G_d \)$. Fix a unit-integral one-form $a_(-) \( z \) thin d z$ supported in $\( - 1.9 tau \, - 1.6 tau \)$ and one $a_(+) \( z \) thin d z$ supported in $\( 1.6 tau \, 1.9 tau \)$. Let $beta$ be a unit-integral smooth $p$-form supported in a sufficiently small cube about zero in the residual target; for $p = 0$ let $beta = 1$. Set

$ chi_(upright("deg")) \( z \) = integral_(- oo)^z \( a_(-) \( u \) - a_(+) \( u \) \) thin d u . $

This function is compactly supported in $\( - 1.9 tau \, 1.9 tau \)$ and is one between the two supports. By (5.11) and (5.17), the low support is in $E_s$, the high support is outside $E_s$, and $chi_(upright("deg")) \( G_1 \) = 1$ on the confined boundary where the residual form is supported. Measured current Stokes therefore gives

$ integral_(partial \[ E_s \]) chi_(upright("deg")) \( G_1 \) J^(*) beta & = integral_(E_s) \( a_(-) \( G_1 \) - a_(+) \( G_1 \) \) thin d G_1 and J^(*) beta\
 & = integral_X a_(-) \( G_1 \) thin d G_1 and J^(*) beta = cal(D)_X \( G \) . quad "(5.21)" $ <eq:degree-boundary-degree>

All forms here are supported in an inner band. The current $\[ E_s \]$ has bounded local volume and its boundary has the uniform local perimeter bounds proved above, so this is precisely the current version of (5.1). The singular set contributes no area, and the counted part of the boundary is in ${ \| G \|_oo < t_3 }$. Consequently (5.21) computes the degree by $J^(*) beta$ on that confined regular branch, with the induced orientation. For $p = 0$ it gives its measured signed count.

If $2 lt.eq d lt.eq 7$, this regular branch already provides the child. To verify the required uniformity, fix a typical $s$. If graph radii and estimates could not be chosen uniformly about the boundary in an inner region of ${ \| G \|_oo < t_3 }$, take offending points in buffered parent charts and pass to normalized chart limits. Local BV and varifold compactness gives a limiting boundary through the limiting point. There are no singular points because $p - 7 < 0$, so smooth graphical convergence near that point supplies a common graph radius and all interior estimates, contradicting the choice of points. A fixed fine mesh of graph cylinders now gives at most a bounded number of patches in each parent plaque. Their transversals are the restricted parent transversals, counted with the patch index. Their total transverse measure and plaque overlap remain bounded. The graph estimates, together with the bounds for derivatives of $ln v$, give the band controls for the induced metric and $phi.alt_Sigma$.

Restrict this branch to

$ \| G \|_oo < t_1 \, #h(2em) \| J \|_oo < T_p . $

The $G_1$ sides of the first restriction cannot be reached by confinement, since $\| G_1 \| < tau + b < T_p$. Near any other side some residual coordinate has absolute value near $t_1 > T_p$. Hence every inner residual subcube has buffered graph charts in this restriction. Its degree equals $cal(D)_X \( G \)$ by (5.21), and its coordinate gradients only decrease on restriction to the tangent space. We take $J^(+) = J$ and use (5.14).

If $d = 1$, so $p = 0$, let $X_s^(+)$ be the confined regular points in $Sigma_s ∩ { \| G_1 \| < t_1 }$, each with its boundary orientation, and let $J^(+)$ be the unique map to the point $Q_(T_0)^0$. Give these point leaves the induced zero-dimensional metric and the weight $phi.alt_Sigma$. Confinement gives $\| G_1 \| < tau + b < T_0 < t_1$ on the counted branch, so this includes every point in (5.21). The local jump separation proved above bounds the number of such points in each buffered parent plaque. Choose a fixed finite half-open mesh finer than that separation in the normalized plaque. Each mesh cell contains at most one counted point. The Borel boundary-support code and the singleton-section theorem make that point a Borel function of the transverse parameter wherever it exists. These functions give a bounded number of point charts, with transversals restricted from the parent and counted with the mesh index. Their total transverse measure is finite and their plaque overlap remains bounded. Point boxes have the required common buffers, and all metric, map, and positive-order weight derivative conditions in Definition 15 are vacuous in dimension zero, so this is a controlled $0$-band. Its measured signed count is $cal(D)_X \( G \)$ by (5.21); its integral is the measured unsigned count. At each point (5.15) reads $1 lt.eq \( v \/ L_1 \) Theta$, and confinement places every counted point in $\| G_1 \| < b_d$. We return to the common integral estimate after treating the possible singularities when $p gt.eq 7$.

=== 5.4 A regular descendant in higher dimensions <a-regular-descendant-in-higher-dimensions>

Assume now $p gt.eq 7$, and fix one of the typical parameters $s$ above. The singular set has zero $p$-dimensional area, so it does not change the boundary-current integral. Deleting it can, however, leave ends of the regular locus over interior residual values, where regular chart radii have no common lower bound. We must keep those ends away from every inner target subcube and preserve the degree computed by the closed boundary current.

We will construct a controlled child carried by an open regular subset of this slice, with the inherited orientation and transverse measure, and with degree $cal(D)_X \( G \)$. For each residual row we require $\| d J_j^(+) \|_(h^(+)) lt.eq \| d G_j \|_h + epsilon_(upright("grad"))$ and the one-sided value bound $\| J_j^(+) \| gt.eq \| G_j \| - epsilon_(upright("val"))$, with

$ sum_(j = 2)^d L_j epsilon_(upright("grad")) < frac(1, 10 q) \, #h(2em) epsilon_(upright("val")) < b_d - b_p = frac(tau, 4 q^2) . quad "(5.22)" $ <eq:degree-tolerances>

The gradient bound controls the residual penalties and the child’s coordinate bound. The value bound, together with confinement of $G_1$, puts the child’s $b_p$ integration region over the parent’s $b_d$ region. Write $cal(W) = d V_(h^(+)) \/ d A_h$ for its ordinary leafwise volume density relative to the original induced metric. The scalar and volume target is

$ d V_(h^(+)) = cal(W) thin d A_h \,\
cal(S) \( h^(+) \, phi.alt^(+) \) gt.eq cal(S) \( h \, phi.alt \) - H_1 \( G \) - 2 ln \( v \/ L_1 \) + 2 ln cal(W) - 1 / q . quad "(5.23)" $ <eq:degree-child-scalar>

The coefficient $2$ makes the volume factor cancel after exponentiation, leaving the same lapse factor as in (5.15). The density $cal(W)$ includes neither $v$ nor the transverse measure.

Every constant and error chosen inside this subsection may depend on this slice and on the band, but must be common across its retained plaques. The choices proceed in three groups. First a small parent perturbation creates a target gap around the points without uniform regular charts. Next we fix the kernel and graph constants using the controlled parent data and that gap. Finally we choose the marked-set cover small enough for all scalar errors. Its positive radius lower bound controls the number and derivatives of the kernels for the graph solves; it does not enter the scalar constants. The adjustable scalar error in (5.23) is at most $1 \/ q$, so chart and elliptic constants will not enter the absolute loss in Theorem 16.

Choose a parent atlas with buffers around ${ \| G \|_oo lt.eq t_3 }$ still inside ${ \| G \|_oo < t_4 }$. One obtains it from an atlas for a larger inner cube by a bounded mesh subdivision, restricting transversals by Borel tests as necessary. Its plaque overlaps, also for the enlarged supports below, remain bounded. All operations in the parent made below use this atlas.

===== 5.4.1 Uniform regularity tests and avoidance of the remaining points. <uniform-regularity-tests-and-avoidance-of-the-remaining-points.>

We use finitely many graph tests at a time to obtain a regular region with common chart controls. The points not yet recognized will be excluded from the child, and the target gap below will keep the later homotopies on the regular locus away from them. Use one common normalized outer cube $Q$ for the buffered parent plaques. Fix in $Q$ one ordered countable list of tests for graph cylinders, using rational centers, radii, bounds, and a fixed countable dense set of rotations. Transport this same list, in this same order, by every parent plaque chart; the list is independent of the plaque and its transverse parameter. A test recognizes that the boundary in its outer cylinder is exactly one smooth graph, with a specified slope bound and strict room at its top, bottom, and sides, and that the set is on its specified side. Its inner cylinder is then an open regular region. At level $k$ use the first $k$ tests of this fixed list in every plaque, with their specified positive buffers. Elliptic estimates on these graphs give all interior derivative bounds for a fixed level. Make the tests with strict margins, so a regular limit point recognized by one of them is recognized by that same test on every sufficiently close smoothly convergent graphical boundary. The graph coding already described shows that recognition is Borel.

Let $D_k$ be the part of the boundary support in ${ \| G \|_oo lt.eq t_3 }$ left after removing the open inner portions recognized through level $k$ in any parent plaque. These are decreasing Borel sets, closed along each leaf. Every regular point is eventually removed. More precisely, in any converging sequence of controlled charts with levels tending to infinity, the $D_k$ can accumulate on a compact subbox only at singular points of the limiting boundary. Outside the limit support this follows from support convergence. If points of $D_(k_j)$ with $k_j arrow.r oo$ converged instead to a regular limit point, one test with a fixed index $ell$ in the common list would recognize that point with strict room. Smooth graphical convergence makes the same test recognize the nearby points for large $j$, and then $k_j gt.eq ell$, contradicting their membership in $D_(k_j)$. This is the compactness fact used in both constructions that follow.

First make an arbitrarily small smooth perturbation $macron(J)$ of $J$ in the #emph[parent] band, small in value and first derivative, with all higher derivatives uniformly bounded. We claim it can be made so that, for some $a_0 > 0$ and some finite $k$,

$ \| macron(J) \|_oo > 4 a_0 quad upright("on a uniform neighborhood of ") D_k . quad "(5.24)" $ <eq:degree-gap>

After the initial homotopy on the full boundary current, this gap will keep the homotopies over a small target cube inside a uniformly regular region. To prove the local assertion behind the claim, fix a positive budget for a constant shift in $bb(R)^p$ and an inner compact plaque box. There are a level and a positive gap, uniform across the controlled plaques, such that some shift in that budget gives this gap from zero on the marked set in the box. Otherwise take a sequence of failing plaques, with levels tending to infinity and requested gaps tending to zero. Pass to normalized chart limits, including a smooth limit of the maps. On a slightly larger compact box the marked sets concentrate at the singular set of the limit. By (5.18) this set has dimension at most $p - 7$, so its image under the smooth limit map has $p$-dimensional measure zero. That image is compact. A shift in the given open budget can therefore avoid it with a positive distance. Uniform convergence of the maps and concentration of the marked sets contradict the alleged failure. This proves the local uniform assertion.

Apply these shifts with smooth parent-chart cutoffs equal to one on the inner boxes. For clarity, simultaneous choices can be made Borel and with bounded overlap. The graph whose vertices are the buffered plaques and whose edges record meeting supports is a Borel graph of finite degree. It has a countable Borel proper coloring: a countable separating family of Borel sets distinguishes each vertex from its finitely many neighbors, and the first finite distinguishing pattern is a countable color. The finite neighbor lists can be enumerated Borel measurably by the Borel countable-section theorem. Processing these color classes successively and taking the first one of $Delta + 1$ colors avoided by all earlier neighbors, where $Delta$ bounds the degree, gives a finite Borel proper coloring. In each color the cutoff supports are disjoint. Choose rational shifts satisfying the local gap test; the test on a compact inner box is Borel by projection with compact sections. After a color is treated, increase the level if necessary and choose the next shift budget smaller than the preceding positive gaps. The marked sets decrease, so earlier gaps persist. There are only finitely many colors. The budgets can also make the total value and first-derivative change as small as prescribed; the cutoffs give uniform bounds for all higher derivatives. Taking $a_0$ smaller than the final gaps and then using the derivative bound of $macron(J)$ extends the gap to a uniform neighborhood. This proves (5.24).

Second, set

$ alpha = p - 13 / 2 > 0 . quad "(5.25)" $ <eq:degree-alpha>

The next cover will support a function large on the remaining marked points while keeping the total kernel coefficients as small as needed. For any prescribed positive budget and upper radius, a sufficiently large $k' gt.eq k$ permits a cover of $D_(k')$ in each inner plaque box by finitely many small balls, of radii $r_i$, such that

$ sum_i r_i^alpha < upright("the prescribed budget") . quad "(5.26)" $ <eq:degree-cover-budget>

The radii can also have a common positive lower bound, depending on the budget and the controlled family. To verify the uniform claim, suppose it failed for levels tending to infinity and for requested lower radii tending to zero. Pass to a limiting chart. Its compact singular set has zero $alpha$-dimensional Hausdorff measure because $p - 7 < alpha$. Cover it on a slightly larger compact box by finitely many balls with radii below the prescribed upper radius and with the $alpha$-sum strictly below the budget, allowing room to enlarge the balls. This finite cover has a positive minimum radius. The concentration observation about $D_k$ makes the enlarged balls cover the marked points of the sequence eventually, contradicting failure. Rational chart balls and fixed comparison factors give Riemannian balls with the same conclusion. Keep only balls meeting the marked set, allowing a small change of centers and the reserved enlargement. The centers then also lie near $D_k$. Such finite covers can be selected Borel: enumerate finite tuples of rational balls, and test whether the compact marked part outside their union is empty. This is again a Borel compact-section test. The positive lower radius and (5.26) bound the number of balls in any plaque.

The two uses of (5.25) are distinct: its strict excess over $p - 7$ made this cover possible, while $alpha + 4 = p - 5 \/ 2 < p - 2$ will make the following potentials superharmonic.

===== 5.4.2 Potentials near the marked set. <potentials-near-the-marked-set.>

Choose a small parent normal-coordinate radius $R > 0$ so that a ball of that radius about any cover center stays in the gap region $\| macron(J) \|_oo > 3 a_0$ and in the buffered atlas. It can also be chosen small with respect to the local metric, weight, and forcing bounds. This radius is fixed before the final cover is chosen; require its ball radii to be much smaller than $R$. For a center $c_i$ and radius $r_i$ let

$ K_i \( x \) = \( r_i^2 + "dist"_h \( x \, c_i \)^2 \)^(- 1 \/ 2) $

on the smaller normal ball, and cut it off within radius $R$. Choose a radial cutoff which is one on the smaller ball, is positive before the outer boundary, and near that boundary has the tail $exp \( - 1 \/ \( 1 - t \) \)$ for $t < 1$ and zero for $t gt.eq 1$, where $t = "dist"_h \( x \, c_i \)^2 \/ R^2$. Join this tail smoothly and positively to the inner plateau. Every positive power of the cutoff then has a smooth exponential flat tail, so each power of $K_i$ used below is smooth. Denote its support by $V_i$.

On the regular boundary in $V_i$, for $j = alpha \, alpha + 4$,

$ - Delta_(Sigma \, phi.alt) K_i^j & gt.eq c K_i^(j + 2) - C upright(bold(1))_(V_i) \,\
\| d K_i^j \| & lt.eq C #scale(x: 120%, y: 120%)[\(] K_i^(j + 1) + upright(bold(1))_(V_i) #scale(x: 120%, y: 120%)[\)] . quad "(5.27)" $ <eq:degree-kernel-bounds>

The constants may depend on the fixed local controls and on $p$, but are independent of $r_i$ and of the eventual number of balls. To check the first estimate before cutoff, put $u = "dist"_h \( x \, c_i \)^2$. The normal-coordinate Hessian bound, the bounded mean curvature $H = frak(h)_s - partial_nu phi.alt$, and the bounded weight gradient give

$ Delta_(Sigma \, phi.alt) u gt.eq 2 p - C sqrt(u) \, #h(2em) \| d u \|_Sigma^2 lt.eq 4 u . $

Differentiating $\( r_i^2 + u \)^(- j \/ 2)$ therefore gives

$ - Delta_(Sigma \, phi.alt) K_i^j gt.eq j (p - j - 2 - C sqrt(u)) K_i^(j + 2) . $

Both chosen exponents are less than $p - 2$, so small $R$ makes the coefficient positive. The gradient estimate follows by one differentiation. On the cutoff annulus the distance from the center is bounded below by a fixed multiple of $R$, and all cutoff derivatives are bounded independently of $r_i$; this accounts for the displayed constant losses. Outside $V_i$ they vanish, as the indicators record.

For $j = alpha \, alpha + 2 \, alpha + 4 \, alpha + 6$ put

$ u_j = epsilon_(upright("base"))^j + sum_i M_(*) r_i^alpha K_i^j \, #h(2em) Lambda = (u_(alpha + 4) / u_alpha)^(1 \/ 4) \, #h(2em) cal(L) = \| d ln u_alpha \|^2 + \| d ln u_(alpha + 4) \|^2 . quad "(5.28)" $ <eq:degree-potentials>

These quantities have separate roles. We will make $u_alpha$ large on $D_(k')$ so that its logarithm locates the region to be excluded. The term $Lambda^2$ will supply the positive scalar contribution that pays for the later coordinate graphs, while $cal(L)$ controls the logarithmic derivatives introduced by the weight and the first graph. Here $0 < epsilon_(upright("base")) < 1$ will be small; $M_(*)$ will be a large finite number fixed before the final cover selection. At a point, the sum is over the kernels active there. The overlap bound and (5.26) allow the total active coefficient $sum_i M_(*) r_i^alpha$ to be made arbitrarily small, uniformly at every point. In particular, for any $delta > 0$, first taking $epsilon_(upright("base"))$ small and then the cover budget small enough gives, for $j = alpha \, alpha + 4$,

$ - frac(Delta_(Sigma \, phi.alt) u_j, u_j) gt.eq c u_(j + 2) / u_j - delta . quad "(5.29)" $ <eq:degree-potential-laplacian>

Indeed (5.27) leaves the errors $c epsilon_(upright("base"))^(j + 2) + C sum_(i : x in V_i) M_(*) r_i^alpha$ before division by $u_j gt.eq epsilon_(upright("base"))^j$. Choose $epsilon_(upright("base"))^2$ and then the active sum divided by $epsilon_(upright("base"))^(alpha + 4)$ small enough for the displayed $delta$.

At each point the $u_j$ are the moments of positive atoms: one atom at $epsilon_(upright("base"))$ of mass one, and atoms at $K_i$ of masses $M_(*) r_i^alpha$. Make their total active mass at most two. Moment inequalities give

$ u_(alpha + 6) / u_(alpha + 4) gt.eq Lambda^2 gt.eq u_(alpha + 2) / u_alpha \, #h(2em) \| d ln Lambda \|^2 lt.eq cal(L) / 8 \, #h(2em) \| d ln u_alpha \| lt.eq C \( Lambda + 1 \) \, #h(2em) Lambda gt.eq c' u_alpha^(1 \/ alpha) . quad "(5.30)" $ <eq:degree-moments>

For the first pair, use the probability weights proportional to the atoms’ masses times their $alpha$-powers. If $Z$ is the square of the atom position, then $bb(E) Z lt.eq \( bb(E) Z^2 \)^(1 \/ 2)$ and $bb(E) Z^3 gt.eq \( bb(E) Z^2 \)^(3 \/ 2)$ give the two inequalities. The second estimate follows directly by differentiating $ln Lambda = \( ln u_(alpha + 4) - ln u_alpha \) \/ 4$. For the third, the gradient bound in (5.27) bounds $\| d u_alpha \|$ by $C sum_i M_(*) r_i^alpha \( K_i^(alpha + 1) + 1 \)$. The first part divided by $u_alpha$ is at most $Lambda$ by Hölder’s inequality for those probability weights; the second is at most one after the same small active-mass choice. Finally, monotonicity of the $L^r$ norms for a measure of mass at most two gives $u_(alpha + 4) \/ u_alpha gt.eq \( u_alpha \/ 2 \)^(4 \/ alpha)$, proving the last inequality. These constants are independent of $M_(*)$ and $k'$. At a point of $D_(k')$ some ball has distance at most its radius, so its term in $u_alpha$ is at least $c'' M_(*)$. Hence

$ u_alpha gt.eq c'' M_(*) quad upright("on ") D_(k') . quad "(5.31)" $ <eq:degree-potential-on-bad>

The positive lower bound on all radii and the bounded number of balls per plaque make all $u_j$ smooth in the parent with uniform derivative bounds for the final slice. These bounds are allowed to depend on that radius lower bound.

Add $eta_0 = \( ln u_alpha + ln u_(alpha + 4) \) \/ 4$ to $phi.alt_Sigma$ on the regular boundary. Put $Q_1 = d eta_0$. The weight-change formula used in (5.13), now with $Delta_(Sigma \, phi.alt_Sigma) = Delta_(Sigma \, phi.alt) + chevron.l d ln v \, d thin dot.op thin chevron.r$, yields from (5.29) the scalar gains $c Lambda^2 + cal(L) \/ 2 - 2 chevron.l d ln v \, Q_1 chevron.r - \| Q_1 \|^2 - delta$. Here the high moment in (5.30) supplies $Lambda^2$. Since $\| Q_1 \|^2 lt.eq cal(L) \/ 8$,

$ cal(L) / 2 + \| d ln v \|^2 - 2 chevron.l d ln v \, Q_1 chevron.r - \| Q_1 \|^2 gt.eq cal(L) / 2 - 2 \| Q_1 \|^2 gt.eq cal(L) / 4 . $

Combining with (5.14), and decreasing $c > 0$ if necessary, gives for the new weight

$ cal(S) \( h \|_(T Sigma) \, phi.alt_Sigma + eta_0 \) gt.eq cal(S) \( h \, phi.alt \) - H_1 \( G \) - 2 ln \( v \/ L_1 \) + c Lambda^2 + cal(L) / 4 - delta . quad "(5.32)" $ <eq:degree-weight-gain>

We have obtained a large scalar allowance near the marked set. The next construction uses it to move the residual map out of the target band there, while paying for the graph volume created in doing so.

===== 5.4.3 Two graph prescriptions and their costs. <two-graph-prescriptions-and-their-costs.>

We describe the graph calculations first, and then give a complete region on which the prescriptions can be solved. The first prescription will produce a function $f$ within two of a small multiple of $ln u_alpha$, with $\| d f \| lt.eq 1$ in its graph metric. The coordinate prescriptions then use this controlled gradient to amplify $macron(J)$ where $f$ is high; each correction adds at most $e$ to its coordinate gradient in the final graph metric, in addition to the earlier perturbation of $macron(J)$. Their scalar gains will pay the exact graph volume factors.

For a current metric and weight $\( k \, phi \)$, a length-one graph of a function $f$ has

$ L_f = \( 1 + \| d f \|_k^2 \)^(1 \/ 2) \, quad U_f = frac(nabla_k f, L_f) \, quad k_f = k + d f ⊗ d f \, quad phi_f = phi - ln L_f \, quad D_f = - "div"_(k \, phi) U_f . $

Lemma 5 says

$ cal(S) \( k_f \, phi_f \) - cal(S) \( k \, phi \) = D_f^2 - 2 U_f \( D_f \) + \| upright("II")_f \|^2 + \| d ln L_f \|_(k_f)^2 . quad "(5.33)" $ <eq:degree-graph-identity>

Also

$ \| U_f \|_k lt.eq 1 \, #h(2em) U_f \( f \) = L_f - L_f^(- 1) \, #h(2em) \| d f \|_(k_f) lt.eq 1 \,\
d V_(k_f) = L_f thin d V_k \, #h(2em) L_f - L_f^(- 1) gt.eq ln L_f . quad "(5.34)" $ <eq:degree-graph-elementary>

The last inequality holds for every $L_f gt.eq 1$ by differentiation. These relations will make the scalar cost and the volume change use the same factor $L_f$.

For the first graph put

$ f_0 = sigma ln u_alpha \, #h(2em) C_f = B_0 + Lambda \, #h(2em) D_f = C_f tan \( f_0 - f \) \, $

with the argument between its two poles. Here $B_0 gt.eq 2$ is fixed and $sigma > 0$ will be small. Pole avoidance gives $\| f - f_0 \| < pi \/ 2 < 2$. Differentiating the prescribed $D_f$ gives the exact terms

$ D_f^2 - 2 U_f \( D_f \) =  & D_f^2 - 2 D_f U_f \( ln C_f \) - 2 \( C_f + D_f^2 \/ C_f \) U_f \( f_0 \)\
 & + 2 \( C_f + D_f^2 \/ C_f \) \( L_f - L_f^(- 1) \) . quad "(5.35)" $ <eq:degree-first-graph-differentiation>

The final term is at least $2 ln L_f$ by (5.34). For the derivative of $C_f$, Young’s inequality and (5.30) give

$ 2 \| D_f U_f \( ln C_f \) \| lt.eq 0.8 D_f^2 + 1.25 \| d ln C_f \|^2 lt.eq 0.8 D_f^2 + 1.25 / 8 cal(L) . $

The $f_0$ term has absolute value at most

$ 2 sigma C \( C_f + D_f^2 \/ C_f \) \( Lambda + 1 \) . $

Since $\( Lambda + 1 \) \/ C_f lt.eq 1$, a sufficiently small $sigma$ spends less than the remaining $0.2 D_f^2$ on its square term. Moreover $C_f \( Lambda + 1 \) lt.eq C_(B_0) \( 1 + Lambda^2 \)$, so a further small choice of $sigma$ spends less than half the $c Lambda^2$ in (5.32) and makes the remaining constant loss as small as prescribed. The available $cal(L) \/ 4$ covers $1.25 cal(L) \/ 8$. Combining (5.32) and (5.33), and discarding nonnegative terms, thus gives

$ cal(S) \( k_f \, phi_f \) gt.eq cal(S) \( h \, phi.alt \) - H_1 \( G \) - 2 ln \( v \/ L_1 \) + c_1 Lambda^2 + 2 ln L_f - delta_1 \, quad "(5.36)" $ <eq:degree-first-graph-gain>

where $c_1 > 0$ is fixed, while $delta_1$ can be made arbitrarily small. This calculation is used only where the current base metric is the original induced metric for which (5.32) was proved.

For the remaining graphs, let $zeta \( f \)$ be a smooth function valued in $\[ 0 \, 1 \]$, zero for $f lt.eq K$ and one for $f gt.eq K + 1$, with derivative bound independent of the threshold $K$. Write $\( k^(\( 1 \)) \, phi^(\( 1 \)) \) = \( k_f \, phi_f \)$. For row $j = 2 \, dots.h \, d$, its graph quantities use the metric and weight after all preceding rows:

$ L'_j = \( 1 + \| d f'_j \|_(k^(\( j - 1 \)))^2 \)^(1 \/ 2) \, #h(2em) U'_j = frac(nabla_(k^(\( j - 1 \))) f'_j, L'_j) \,\
D'_j = - "div"_(k^(\( j - 1 \)) \, phi^(\( j - 1 \))) U'_j \,\
k^(\( j \)) = k^(\( j - 1 \)) + d f'_j ⊗ d f'_j \, #h(2em) phi^(\( j \)) = phi^(\( j - 1 \)) - ln L'_j . $

Prescribe successively

$ ell_j = A zeta \( f \) macron(J)_j \, #h(2em) D'_j = B' tan (frac(ell_j - e f'_j, w)) \, #h(2em) J_j^(+) = macron(J)_j + e f'_j . quad "(5.37)" $ <eq:degree-row-graph>

The constants $A \, w \, e \, B'$ are positive; their order of choice is given below. Put $h^(+) = k^(\( d \))$, $phi.alt^(+) = phi^(\( d \))$, and

$ cal(W) = L_f product_(j = 2)^d L'_j . $

The successive volume identities give $d V_(h^(+)) = cal(W) thin d V_k$ relative to the current base metric $k$. On the eventual child that base will be the original induced metric, so this product will be the density in (5.23). In the metric after the first graph, $\| d f \| lt.eq 1$ by (5.34), and later graph metrics only increase. The values and first derivatives of $macron(J)$ are uniformly bounded in the region in question. It follows that in each current metric

$ \| d ell_j \| lt.eq C_ell upright(bold(1))_({ f gt.eq K }) \, quad "(5.38)" $ <eq:degree-ell-bound>

where $C_ell$ depends on $A$ and the earlier band bounds but not on $K$, $M_(*)$, $k'$, or the final cover budget.

For a row graph the analogue of (5.35) is

$ \( D'_j \)^2 - 2 U'_j \( D'_j \) = \( D'_j \)^2 - 2 / w (B' + frac(\( D'_j \)^2, B')) U'_j \( ell_j \) + frac(2 e, w) (B' + frac(\( D'_j \)^2, B')) \( L'_j - \( L'_j \)^(- 1) \) . $

Choose $B'$ after $w \, e$ so that

$ frac(B' e, w) gt.eq 2 \, #h(2em) frac(2 C_ell, w B') lt.eq 1 / 2 . quad "(5.39)" $ <eq:degree-row-B-choice>

Then the differentiated $ell_j$ spends at most half of $\( D'_j \)^2$ and the fixed amount $2 B' C_ell \/ w$ on ${ f gt.eq K }$, while the last term pays $2 ln L'_j$ everywhere. The other terms of (5.33) are nonnegative. After all $p$ rows, the sum of fixed errors is therefore at most $C_(upright("rows")) upright(bold(1))_({ f gt.eq K })$, with $C_(upright("rows"))$ independent of $K \, M_(*) \, k'$ and the cover budget. On this support, $f < f_0 + 2$ implies

$ u_alpha > exp \( \( K - 2 \) \/ sigma \) \, #h(2em) Lambda gt.eq c' exp \( \( K - 2 \) \/ \( sigma alpha \) \) $

by (5.30). Choose $K$ large enough that the remaining $c_1 Lambda^2$ in (5.36) covers $C_(upright("rows"))$ there. This proves the required payment for all row graphs without any estimate on their individual volume expansions.

Pole avoidance in (5.37) also gives the output estimates that will be used for the band sides and its gradients:

$ \| J_j^(+) - \( 1 + A zeta \( f \) \) macron(J)_j \| & < 2 w \,\
\| d J_j^(+) \|_(h^(+)) & lt.eq \| d G_j \|_h + epsilon_(upright("grad")) \,\
\| J_j^(+) \| & gt.eq \| G_j \| - epsilon_(upright("val")) . quad "(5.40)" $ <eq:degree-output-estimates>

For the gradient inequality, $\| d f'_j \| lt.eq 1$ in its own graph metric and hence in $h^(+)$, and all these metrics dominate the original induced metric and the parent metric on tangent vectors. Thus $\| d J_j^(+) \|_(h^(+)) lt.eq \| d macron(J)_j \|_h + e$. For the value inequality use $1 + A zeta gt.eq 1$ in the first line. The quantities $epsilon_(upright("grad"))$ and $epsilon_(upright("val"))$ can be as small as prescribed by the first-derivative and value perturbation budgets, respectively, and by $e \, w$. We choose them to satisfy the target budgets (5.22) and also to be smaller than all the fixed side margins used below.

The full dependency order is

$ & upright("perturbation budgets") med arrow.r med \( macron(J) \, a_0 \, k \) med arrow.r med R\
 & #h(2em) arrow.r med \( upright("scalar error") \, epsilon_(upright("base")) \) med arrow.r med B_0 med arrow.r med sigma\
 & #h(2em) arrow.r med A med arrow.r med \( w \, e \) med arrow.r med B' med arrow.r med K med arrow.r med M_(*)\
 & #h(2em) arrow.r med \( upright("cover budget") \, k' \, upright("radius lower bound") \) . $

Each later choice may use the preceding ones. The intended scalar error is much smaller than $1 \/ q$, and $epsilon_(upright("base"))$ is small enough for (5.29). The constants in (5.30) and the positive constant in (5.32) are independent of the future cover, so $B_0$ and $sigma$ can be fixed for (5.36) at this stage. Choose $A$ large compared with $T_p \/ a_0$, then $w$ small compared with $a_0$ and all value margins, and $e$ small for (5.22). Choose $B'$ by (5.39), and only then $K$ to cover the row errors. Also make $K$ larger than the baseline value $sigma ln \( epsilon_(upright("base"))^alpha \)$ by a fixed margin. Choose $M_(*)$ so large that (5.31) implies

$ f_0 > K + 100 quad upright("on ") D_(k') . quad "(5.41)" $ <eq:degree-high-on-bad>

Finally choose the cover budget sufficiently small for all the active-mass and error requirements, and obtain $k' gt.eq k$ and a cover with its positive lower radius bound. This final selection is possible for every fixed $M_(*)$ by (5.26). It also provides all finite uniform derivative bounds needed for the actual equations. In particular, none of the constants that forced the choices of $K$ or $M_(*)$ was allowed to depend on the final level or cover.

===== 5.4.4 Solving on a complete regular region. <solving-on-a-complete-regular-region.>

The thresholds have distinct jobs: $K + 100$ places the marked set beyond the auxiliary cutoff, $K + 12$ bounds the auxiliary region for solving, and $K + 7$ bounds the child inside the part where its base metric is unchanged. The lower threshold $K + 4$ will already put the output outside the target near the potential cutoff side. Their gaps provide the spatial buffers below through the uniform derivative bounds for $f_0$.

$Sigma_s$ need not be complete. Use the operations only on the open region

$ Omega = Sigma_s ∩ { \| G \|_oo < t_2 \, med f_0 < K + 12 } . quad "(5.42)" $ <eq:degree-auxiliary-region>

By (5.41) it avoids $D_(k')$ with a large margin in $f_0$; by $t_2 < t_3$ it also has a margin within the region of the tests. The uniform derivative bounds on $f_0$ turn these into uniform spatial margins. Thus the graph tests through level $k'$ give regular graph charts with uniform buffers and all estimates on a neighborhood of this region. The estimates for derivatives of $ln v$ apply there. The functions $u_j \, Lambda \, f_0 \, macron(J)$ have uniform derivatives because of the radius lower bound. The weight $phi.alt_Sigma + \( ln u_alpha + ln u_(alpha + 4) \) \/ 4$ therefore has the positive-order derivative bounds required for a graph solve.

Choose a smooth function $0 < xi lt.eq 1$ on $Omega$ which tends to zero at the sides in (5.42) and is one, with buffers, through the smaller bounds $\| G \|_oo lt.eq t_1$ and $f_0 lt.eq K + 7$. It can be made from smooth functions of $t_2^2 - G_i^2$ and $K + 12 - f_0$, linear near zero and cut off to one away from zero. Its derivatives in the original regular charts are bounded. Replace the induced metric on $Omega$ by

$ k_(upright("aux")) = xi^(- 2) h \|_(T Sigma) . $

This metric is complete with uniform buffered bounded geometry. Here is the local verification, which also accounts for possible ends of the original leaves. A ball in an original regular chart of radius a small fixed multiple of $xi \( x \)$ remains in $Omega$, since $xi \( x \)$ is bounded by a constant times each scalar distance to a side. The bound on $d xi$ makes $xi$ comparable to $xi \( x \)$ on that ball. Rescale the coordinate ball by $xi \( x \)$. The coefficients of $xi^(- 2) h$ and their inverse then have uniform bounds of every order: for the $m$-th derivative of the conformal factor the new terms are products of ratios bounded by constants times $xi \( x \)^m \| nabla^m xi \| \/ xi$, and these are bounded for $m gt.eq 1$. The rescaled boxes have uniform inner buffers. They also prove completeness. A curve of finite remaining length, or a Cauchy sequence, eventually stays within the outer part of one such buffered box and converges there; it cannot escape a leaf through a side or an uncharted end. Equivalently, approach to a side already has infinite length because $\| d ln xi \|_(k_(upright("aux")))$ is bounded. This argument used only the controlled charts near (5.42), not completeness of a parent leaf.

The restricted chart descriptions are Borel and accessible charts still have a countable Borel enumeration. The auxiliary atlas may use further countable subdivisions; its total transverse measure is irrelevant for the graph existence theorem. Apply Lemma 6 on these complete leaves. For the first prescription its positive coefficient is $B_0 + Lambda$, its height target is $f_0$, and its constants $e \, w$ in that lemma are both one. For a row prescription the coefficient is the positive constant $B'$, the target is $ell_j$, and the constants are the chosen $e \, w > 0$. All coefficients have the uniform smooth bounds just established. That lemma gives the bounded solutions with a uniform margin from the poles and all derivative bounds, and gives their Borel dependence from uniqueness in the countably enumerated charts. It applies successively: a solved graph metric dominates the complete base, is complete, and has uniform geometry by the solution bounds; its changed weight again has uniform positive-order derivative bounds. In applying the scalar estimates (5.32)–(5.36), use only the smaller region where $xi = 1$. There the auxiliary metric and the original induced metric agree with all derivatives.

Define the child to be the open measured band

$ X_s^(+) = { x in Omega : \| G \|_oo < t_1 \, med f_0 < K + 7 \, med \| J^(+) \|_oo < T_p } \, quad "(5.43)" $ <eq:degree-child-domain>

with the final graph metric $h^(+)$, final graph weight $phi.alt^(+)$, and underlying boundary orientation. Its artificial sides stay away from each inner residual subcube. For the $\| G \| = t_1$ sides, confinement gives $\| G_1 \| < tau + b < T_p$, so any approach to such a side has a residual row $\| G_j \|$ near $t_1$. Choose $epsilon_(upright("val")) < \( t_1 - T_p \) \/ 4$; then (5.40) puts $\| J_j^(+) \|$ beyond $T_p$ already on a uniform neighborhood of that side. For the $f_0 = K + 7$ side, if $f_0 gt.eq K + 4$ some kernel is active, since the baseline value of $f_0$ is less than $K$. Its support lies in $\| macron(J) \|_oo > 3 a_0$. Moreover $f > f_0 - 2 gt.eq K + 2$, so $zeta \( f \) = 1$. Choose $A$ so that $\( 1 + A \) 3 a_0 > T_p + 4 a_0$ and take $w < a_0 \/ 2$. The first line of (5.40) then puts some $\| J_j^(+) \|$ beyond $T_p$ with a positive uniform margin. This occurs before reaching $f_0 = K + 7$. In particular the entire child lies in the region where $xi = 1$, with buffers for all its inner subcubes.

These observations verify every part of Definition 15 for the child. To be explicit about its atlas, use the recognized regular graph patches through level $k'$ in each parent plaque, restricting their transversals as necessary. There are only boundedly many such tests per plaque. The derivative bounds for $G \, f_0 \, J^(+)$ and the side margins just proved permit a further bounded subdivision covering any chosen inner residual subcube with buffers. The solved graph metrics and weights have uniform derivatives in these charts. Holonomy is inherited from the parent overlap maps, with the finite patch indices when needed. Hence both the total transverse measure and the plaque overlap bound persist. The transverse measure is precisely the restricted parent measure. It has no lapse factor and no graph-volume factor; those belong to the leafwise integrations.

===== 5.4.5 Preserving the degree through the modifications. <preserving-the-degree-through-the-modifications.>

Use in (5.21) a residual form $beta$ supported in $\| z \|_oo < a_0$, reducing $a_0$ if necessary. First homotope $J$ to $macron(J)$ on the whole parent boundary current. The small value perturbation ensures that the preimages of this support throughout the homotopy remain in a fixed old inner band. One can justify invariance directly by the homotopy formula. The difference of the two pullbacks of $beta$ is $d cal(H) beta$, where $cal(H) beta$ is its usual transgression along the homotopy. Multiply by the cutoff $chi_(upright("deg")) \( G_1 \)$ used in (5.21). The current $partial \[ E_s \]$ is closed, and the term differentiating this cutoff meets no boundary on the small residual support, by confinement. Measured current Stokes, with the local mass bounds already proved, therefore makes the integral of the difference zero. This uses the boundary current across its singular set and so does not assume regularity of the homotopy there.

The resulting integral for $macron(J)$ is entirely in the regular region used for the solves. Indeed $\| macron(J) \|_oo < a_0$ avoids a neighborhood of $D_k$ by (5.24) and avoids every kernel support, which lies in $\| macron(J) \|_oo > 3 a_0$. Thus $f_0$ has its baseline value there. The small perturbation also keeps $\| G \|$ in the smaller inner band. Now homotope on this regular region first from $macron(J)$ to $\( 1 + A zeta \( f \) \) macron(J)$ and then to $J^(+)$. Along the first homotopy the multiplier is at least one, so a preimage of the small target support has $\| macron(J) \|_oo < a_0$. Along the second, the first line of (5.40) shows that it has $\| macron(J) \|_oo < a_0 + 2 w < 2 a_0$. Both supports thus avoid the marked region and the kernel supports, and retain the same spatial and $G_1$ margins. Ordinary measured Stokes on the regular buffered charts applies to these homotopies. The final support lies in (5.43), so its integral is the measured degree of the child. It equals $cal(D)_X \( G \)$.

On the child the initial auxiliary metric is the induced metric, so (5.34) verifies the volume identity in (5.23) for the product $cal(W)$ defined above. Choose all the adjustable scalar errors above with sum at most $1 \/ q$. The absorption of the row errors and (5.36) give the scalar inequality in (5.23) on the child. This completes the construction in high dimensions. In the case $d lt.eq 7$ treated above, use $cal(W) = 1$. The volume identity is then immediate, and (5.14) gives the scalar inequality in (5.23). In dimension $p = 0$ the same statements hold on the counted points with the zero-dimensional scalar convention.

#proof[
  #emph[Completion of the proof of Lemma 17.] The coarea assertion is (5.20). The constructions above give a controlled child of degree $cal(D)_X \( G \)$ for each typical $s$. Its coordinate bound follows from (5.40) and (5.22):
  $ L_j \| d J_j^(+) \|_(h^(+)) lt.eq B - d / q + L_j epsilon_(upright("grad")) < B - p / q . $
  For a low-dimensional child the same statement holds with zero error. The horizon condition (5.5) for its rows is unchanged, since $q \, B \, tau \, L_2 \, dots.h \, L_d$ are unchanged.
  Every point with $\| J^(+) \|_oo < b_p$ comes from $\| G \|_oo < b_d$. For residual rows this follows from the last line of (5.40) and $epsilon_(upright("val")) < b_d - b_p$; in low dimensions it is immediate. For the first row confinement gives
  $ \| G_1 \| < tau + b < tau + frac(tau, 10 q) < b_d . $
  The same observation covers the counted case $p = 0$.
  The function $x mapsto \( x - 1 \)_(+)$ is one-Lipschitz, so (5.40) gives
  $ sum_(j = 2)^d H_j^(+) lt.eq sum_(j = 2)^d H_j \( G \) + 2 sum_(j = 2)^d L_j epsilon_(upright("grad")) . $
  Use this and the scalar and volume relations in (5.23) to compare the integrands on the child:
  $ & exp (frac(- cal(S) \( h^(+) \, phi.alt^(+) \) + sum_(j = 2)^d H_j^(+), 2)) cal(W)\
 & quad lt.eq exp (frac(1, 2 q) + sum_(j = 2)^d L_j epsilon_(upright("grad"))) v / L_1 exp (frac(- cal(S) \( h \, phi.alt \) + sum_(i = 1)^d H_i \( G \), 2))\
 & quad lt.eq e^(3 \/ \( 5 q \)) v / L_1 Theta . quad "(5.44)" $ <eq:degree-integrand-cancellation>
  The factor $cal(W)$ cancels exactly against the term $2 ln cal(W)$ in the scalar bound. The factor $v \/ L_1$ is the lapse factor in coarea. This calculation makes no bound on either factor. For a low-dimensional child use (5.14), with no row error; for $p = 0$ the same estimate is the pointwise bound for a counted point. Integrate (5.44) over the child and use its containment in the parent $b_d$ region. This is (5.8), for example with $C_(*) = 1$. ◻
]

=== 5.5 Completion of the induction <completion-of-the-induction>

#proof[
  The case $d = 0$ is the signed-count inequality in the statement. Suppose the theorem is known in dimension $p = d - 1$, with the same $q \, B \, tau$ and the residual lengths. Its hypotheses hold for the child of Lemma 17, including the unchanged strict horizon condition. For almost every $s$ the induction hypothesis and (5.8) give
  $ \| cal(D)_X \( G \) \| \( 2 tau \)^p lt.eq frac(e^(C_1 p \/ q + C_(*) \/ q), product_(i = 1)^d L_i) integral_(Sigma_s ∩ { \| G \|_oo < b_d }) v_s Theta thin d A_h . $
  For $p = 0$ this is the same use of the unsigned-count bound. Take $C_1 gt.eq C_(*)$. Integrate this scalar inequality over $- tau < s < tau$ and apply (5.7) with $F = upright(bold(1))_({ \| G \|_oo < b_d }) Theta$. The factor $2 tau$ on the left changes its power from $p$ to $d$, and the right is bounded by the integral in (5.6). This proves the induction.
  There is no implicit measurable selection of children in this last step. For each typical $s$ a child proves the displayed scalar inequality against the same parent integral. That parent integral is a measurable function of $s$ by the lapse construction and is governed by (5.7); it is the only function being integrated. Its integral is finite because $Theta$ is bounded on the controlled $b_d$ region, which has finite measured volume. The constants $C_0$ and $C_1$ are absolute: $C_0$ came from the fixed pressure profile, and each descent costs at most $e^(C_(*) \/ q)$ after the arbitrarily small slice errors were chosen. All geometry-dependent constants were used only to make those choices. ◻
]

== 6 From bounded cohomology to comparison degree <sec:transfer>

The entropy construction supplies a root probability map $F$ whose energy $e_h \( F \)$ has a large coefficient in the weighted scalar-curvature inequality. Its coordinatewise square takes values in the probability simplex. We now turn its pairing with the bounded cocycle into comparison degrees to which Theorem 16 applies. A common integer clears the rounded cubical coefficients, giving integer multiplicities; the resulting measured degree may still be real. Its expectation will retain the original cocycle pairing exactly. The different lengths assigned to the tangent and normal directions of the realization are what remove the auxiliary dimension from the final estimate.

The probability-map and auxiliary-degree strategy is adapted from Section 3 of [20]: Lemmas 3.2 and 3.4 develop the probability map and dual chains, and Proposition 3.6 provides their pairing. Lemma 3.8 supplies a transverse parameter cycle with nonzero intersection count; the proof of Theorem 3.1 constructs the comparison map and identifies its local degree. We prove the quantitative measured transfer and its estimates here.

#thm([Theorem 6.1.])[
  #emph[For every integer $n gt.eq 3$, there is a finite constant $C_n > 0$ such that every closed connected oriented smooth $n$-manifold $M$ and every smooth Riemannian metric $g$ with $"Scal"_g equiv - 1$ satisfy 
$ parallel M parallel lt.eq C_n "Vol"_g \( M \) . $

]
] <thm:scalar-volume>

We prepare the proof for a manifold with $parallel M parallel > 0$. Choose the homogeneous alternating bounded cocycle $c$, the initial probability map, and the number $I gt.eq parallel M parallel \/ 2$ provided by Proposition 4; in particular $parallel c parallel_oo lt.eq 1$. We first consider conditional data having the properties asserted by Theorem 9, without yet invoking their existence. Denote the scalar constant in this contract by $C_(upright("ent"))$. All functions called elementary in this section have a fixed height of exponentiation on a polynomial, with parameters depending only on $n$.

Write $cal(M) = \( tilde(M) times Omega \) \/ Gamma$ for such a measured family. Denote its metric, weight, density, and root probability map by $h \, phi.alt \, rho \, F$, and put

$ frak(e) = e_h \( F \) \, #h(2em) W = log \( d V_h \/ rho \) . $

Its estimates are

$ rho lt.eq d V_g \, #h(2em) W gt.eq 0 \, #h(2em) cal(S) \( h \, phi.alt \) gt.eq - C_(upright("ent")) + 2 W - n log E + E frak(e) \, #h(2em) frak(e)^(1 \/ 2) lt.eq E^(- 1 \/ 100) . quad "(6.1)" $ <eq:transfer-entropy>

There is a fixed invariant graph on the countable label set, with finitely many free $Gamma$-orbits, containing every cooccurrence of nonzero coordinates of $F$. The integer $q gt.eq n + 1$ bounds the number of orbits and the maximum graph degree plus one. The equivariant coloring by $q$ colors separates any two labels at graph distance at most two. Its dependence on $omega in Omega$ is Borel. Set $m = q - n > 0$. Integrals over $cal(M)$ and over the measured spaces constructed below include their transverse measures.

#emph[Conditional transfer target.] For every $n gt.eq 3$, there are a constant $K_n > 0$ and an elementary function $Psi_n : \[ 1 \, oo \) arrow.r \( 0 \, oo \)$, chosen from $n$ alone, such that every choice of detector and conditional entropy data just specified, including its constant $C_(upright("ent"))$, satisfies

$ E gt.eq Psi_n \( q \) quad arrow.r.double quad I lt.eq K_n e^(C_(upright("ent")) \/ 2) integral_(cal(M)) rho . quad "(6.2)" $ <eq:transfer-conditional-target>

Thus $K_n$ and $Psi_n$ are fixed before the manifold, cocycle, instance geometry, and $C_(upright("ent"))$ are chosen. We carry out the estimates for each integer $q gt.eq n + 1$, uniformly over conditional data satisfying the stated label and coloring bounds. The grid, the common rounding, and an upper density bound for the resolution come first. That density bound permits a small collar; the ensuing curvature and rotation bounds then determine one comparison width and the required energy threshold. Only after the conditional target is closed will Theorem 9 supply an actual pair $\( q \, E \)$ and make $C_(upright("ent"))$ dimension-only.

=== 6.1 A flat neighborhood and a cubical cocycle <a-flat-neighborhood-and-a-cubical-cocycle>

For a fixed $omega$, let $K = K_omega$ consist of all nonnegative unit root vectors whose support is a clique in the label graph. Thus $K$ is the union of the spherical orthants on those cliques. A vector $y in K$ has a color image $z_y in bb(R)^q$, obtained by placing each of its root coordinates at the color of its label. Distinct labels in a clique have distinct colors. Distant cliques can reuse colors, so the flat neighborhood below keeps distinct label configurations with the same color image on separate sheets for comparison, while retaining Euclidean coordinates for the grid averages.

#thm([Lemma 6.2.])[
  (Flat sheet neighborhood).  #emph[Put $delta = \( 1000 sqrt(q) \)^(- 1)$. There is an oriented flat smooth $q$-manifold $cal(U)_omega$ with a local isometry $z : cal(U)_omega arrow.r bb(R)^q$, and an inclusion of $K_omega$ into it, such that the image of every $y in K_omega$ has a flat ball chart of radius $10 delta$ centered at $z_y$. This construction is a standard Borel family in $omega$, with countably many charts and an equivariant $Gamma$-action. The map $F$ lifts smoothly to this family, and, writing $z_F = z compose F$, 
$ e_h \( z_F \) = e_h \( F \) = frak(e) . $

 There is a closed smooth $n$-form, again denoted $eta$, obtained in these flat charts by pulling back the detector form through the cutoff probabilities constructed below. It is Borel and equivariant in the family, and satisfies 
$ integral_(cal(M)) F^(*) eta = I \, #h(2em) \| eta \|_(upright("HS")) lt.eq C_n . quad "(6.3)" $ <eq:transfer-form>

 Here the exterior Hilbert norm uses the Euclidean metric on the charts. For every fixed derivative order its derivatives admit an elementary bound in $q$.]
] <lem:transfer-flat>

#proof[
  Take one copy of $B \( z_y \, 10 delta \) subset bb(R)^q$ for each witness $y in K$. At the same point $z$ in two such balls, identify the two copies if their witnesses share a label in their nonzero supports. We check that these identifications give ball charts, rather than a branched space. For every point under consideration, some coordinate of $z$ is at least $q^(- 1 \/ 2) - 10 delta$. Every witness for that point has a nonzero label at this color. If two witnesses share any label, their labels at every common color agree: each of the two labels at that color is adjacent to the shared label, so distance-two separation of colors forces them to be the same. Conversely, agreement at the indicated large color is already a shared label. Thus, at $z$, the proposed identification is precisely agreement on the label at that large color, which is an equivalence relation.
  The same color remains positive in all witnesses at every sufficiently nearby point; indeed the margin $q^(- 1 \/ 2) - 21 delta > 0$ suffices after a further displacement of at most $delta$. In that neighborhood the equivalence classes are still distinguished by its label. Each ball therefore projects injectively as a local chart. Points with distinct Euclidean projections can be separated in Euclidean space, and points with the same projection and different labels at the large color have disjoint chart neighborhoods just described. This proves the Hausdorff property. Rational dense choices of centers in each spherical orthant give a countable subatlas: there are countably many labels and cliques. The descriptions by labels, clique coordinates, and color assignments are Borel, and are unchanged by simultaneous translation of labels and $omega$. They prove all the claimed family and equivariance properties. At points of $K$ this also shows that its inclusion is unambiguous.
  The lift of $F$ is locally in one of these charts: its label at a chosen large color persists in a neighborhood. A nonnegative smooth root coordinate has zero differential wherever it is zero. All the nonzero coordinates at a point have different colors. It follows that the nonzero rows of $d F$ are merely moved to different color positions by $d z_F$, proving the asserted energy equality.
  To construct this cutoff pullback, choose a nonnegative smooth function $chi$ which is zero for $t lt.eq 12 delta$, equals $t$ for $t gt.eq 25 delta$, lies between zero and $max { t \, 0 }$, and satisfies the usual rescaled derivative bounds $\| chi^(\( j \)) \| lt.eq C_j delta^(1 - j)$ for $j gt.eq 1$. In a ball put
  $ w \( z \) = frac(\( chi \( z_j \) \)_(j = 1)^q, \| \( chi \( z_j \) \)_(j = 1)^q \|) \, #h(2em) p_j = w_j^2 . $
  The denominator is bounded below by an absolute positive constant. In fact $z$ is within $10 delta$ of a nonnegative unit vector, and the change in each coordinate caused by cutting it off is at most $25 delta$; hence its total change is at most $25 delta sqrt(q)$. If $chi \( z_j \) eq.not 0$, every witness in this ball has a positive coordinate at color $j$, because its distance from $z$ is less than $10 delta$. The label for every active coordinate is therefore unambiguous on chart overlaps. Evaluate
  $ eta = n ! thin c \( p \, d p \, dots.h \, d p \) $
  using those labels. The cocycle law makes this form closed, as in Proposition 4, and a straight probability homotopy from the old probabilities to these new ones preserves the measured pairing. Its local finiteness and smooth bounds are uniform for the instance, so the measured Stokes argument of that proposition applies. This gives the first identity in (6.3).
  For the dimension-only norm bound, first regard the form on nonnegative unit root vectors $w$. In the Euclidean coordinate directions $i_1 \, dots.h \, i_n$, its component is
  $ n ! 2^n #scale(x: 180%, y: 180%)[\(] product_(j = 1)^n w_(i_j) #scale(x: 180%, y: 180%)[\)] sum_a w_a^2 c \( a \, i_1 \, dots.h \, i_n \) . $
  Its absolute value is at most $n ! 2^n product_j w_(i_j)$. The sum of the squares of these products over all increasing $n$-tuples is at most $\( sum_i w_i^2 \)^n = 1$. Thus its exterior Hilbert norm is at most a constant depending only on $n$. The map $z mapsto w \( z \)$ has absolutely bounded operator norm of its differential: its denominator is bounded below, normalization is an orthogonal projection divided by that denominator, and $chi'$ is absolutely bounded. Pullback multiplies the exterior Hilbert norm by at most the $n$-th power of this operator bound. This proves the second assertion in (6.3). Differentiating the same formulas a fixed number of times gives elementary bounds (polynomial bounds in $q$ already suffice), since $delta^(- 1) = 1000 sqrt(q)$. ◻
]

Choose a rotation $V in S O \( q \)$ with Haar probability, independently of the entropy data, and put $hat(z) = V z$. In these coordinates take the cubical grid of step $r$ and shift $s$, where $s$ is uniform in $\[ 0 \, r \)^q$. Fix $r = r \( q \) > 0$ so that $r sqrt(q) lt.double delta$ and so that every $n$-component of $eta$ in every rotated frame changes by at most $q^(- n)$ over a ball of radius $10 r sqrt(q)$ in the inner sheet charts. The derivative bounds of Lemma 19 permit such a choice with an elementary bound on $r^(- 1)$, uniformly in $V \, s \, omega$.

A primal $n$-cell has an axis set $cal(I) subset { 1 \, dots.h \, q }$ of size $n$, varies along those grid intervals, and has the remaining coordinates at grid vertices. Orient it in increasing axis order. Include each lift $C$ whose center is at distance less than $4 delta$ from some witness $z_y$ in its sheet chart. The full cell fits in that chart. Its dual $m$-cube $C^(\#)$ has the same center, varies along the complementary axes by $\[ - r \/ 2 \, r \/ 2 \]$, and has the other coordinates fixed. It too fits in the chart. Orient it so that the primal oriented basis, followed by the negatives of its dual oriented basis, is a positive basis of $bb(R)^q$. Give the primal cell the coefficient

$ u_C = integral_C eta . quad "(6.4)" $ <eq:transfer-cell-value>

These coefficients satisfy the cubical cocycle equations where they are needed. If a primal $\( n + 1 \)$-cell has its center within $2 delta$ of a witness, all its boundary $n$-faces are included with coherent lifts, and their signed integrals sum to zero by Stokes. A facet of a dual cube is centered at just such a primal $\( n + 1 \)$-cell. The incidence signs of its incident dual cubes agree, up to one common sign, with the boundary signs of the primal cell: this follows by placing the varying primal axes first and the negative dual axes last in the ambient oriented basis. Consequently the dual $m$-cubes weighted by $u_C$ have balanced oriented boundary near $K$, in particular at every facet meeting the tube of radius $delta$. Indeed the corresponding centers differ from those facet points by at most $r sqrt(q)$, so they have the stipulated $2 delta$ witnesses. Projected grid cells on other sheets give no incidence: all these statements use lifts in the same flat chart.

#thm([Lemma 6.3.])[
  (Finite-type unbiased rounding).  #emph[There is an integer $D_0 gt.eq 1$, bounded by an elementary function of $q$ and constant in $V \, s \, omega$, and a Borel equivariant random choice of coefficients $u'_C in D_0^(- 1) bb(Z)$ such that 
$ bb(E)_(upright("rd")) u'_C = u_C \, #h(2em) \| u'_C - u_C \| lt.eq r^n q^(- n) . quad "(6.5)" $ <eq:transfer-rounding>

 The expectation is conditional on the grid and entropy data. Every cocycle equation just described is satisfied exactly by the $u'_C$.]
] <lem:transfer-rounding>

#proof[
  The closure equations couple faces whose anchors can differ. We encode all local coefficients in one ordered finite vector and round within the joint kernel of its incidence equations, so every cell reads from the same rounded vector. We first establish that the vector has elementary size despite the infinitely many lifted cells.
  All projected centers lie in a fixed bounded Euclidean ball. For fixed $V \, s$, their grid indices and axis sets therefore have at most $\( C \/ r \)^(C q)$ choices. At a selected center choose, breaking ties by color order, its largest unrotated color coordinate. This coordinate is at least $q^(- 1 \/ 2) - 4 delta$, and its label occurs in every witness for the center. It determines the lift uniquely, by the proof of Lemma 19; call it the anchor label.
  The closed graph one-neighborhood of an anchor has at most $q$ labels. Every center-test witness, meaning a witness at distance less than $4 delta$ from the center, lies in this neighborhood because it contains the anchor. Every point of the full cell is within $4 delta + r sqrt(n) \/ 2 < 5 delta$ of each such witness. Thus every active color, whose coordinate is greater than $12 delta$, occurs in each center-test witness. For an arbitrary ball-chart witness of the center the corresponding bound is instead $10 delta + r sqrt(n) \/ 2 < 11 delta$, which is still below the active cutoff and gives the same conclusion. Thus the coefficient $u_C$ is determined by its projected grid index, its anchor, and the color assignment on this one-neighborhood. In particular, no labels farther out in the graph enter its calculation.
  Choose and order representatives of the at most $q$ anchor orbits, and order each of their finite one-neighborhoods. An anchor has a unique translate to its representative because the label action is free. After this translate, its neighborhood is a fixed finite set and the cocycle evaluations are unchanged by homogeneity. Fix one ordered list of slots consisting of an anchor representative, an injective color assignment on its neighborhood, an axis set and grid index, and a witness clique in that neighborhood containing the anchor. It is enough to use the fixed index box $\| k_j \| lt.eq ceil.l 3 \/ r ceil.r + 3$, which contains every possible selected center for all shifts. The slot is valid when the anchor color is the canonically chosen largest unrotated color of its center and that center is at distance less than $4 delta$ from the spherical orthant of its witness clique. Give a valid slot the integral of the explicit form over its primal cell, using the labels specified by the slot, and give an invalid slot value zero. The preceding active-color observation makes this integral unambiguous. The validity tests and integrals are Borel in $V \, s$.
  This is one vector $v = v \( V \, s \) in bb(R)^(N_0)$ for the fixed graph and cocycle, common to all $omega$. Only its size and the bounds below are uniform over all graphs and cocycles of the given complexity: there are at most $q^q$ neighborhood color assignments, $2^q$ witness cliques, and $\( C \/ r \)^(C q)$ projected indices, so $N_0$ is elementarily bounded in $q$. An actual cell receives the slot $t \( C \, omega \)$ obtained by normalizing its canonical anchor, restricting its actual coloring, and choosing the first valid witness clique in the fixed order. Its value is $u_C = v_(t \( C \, omega \))$. This type is Borel and is unchanged by translating $C$ and $omega$ together. Slots with the same anchor, restricted coloring, axes, and grid index but different valid witness cliques have the same value: the $5 delta$ observation gives the identical active-label formula throughout the primal cell.
  Impose on this list every integer row $b$ with $parallel b parallel_oo lt.eq 2 \( n + 1 \)$ for which $b dot.op v = 0$. There are finitely many candidate rows, so the resulting matrix depends Borelly on $v$. In particular it includes the difference row for any two duplicate valid slots. It also includes every needed cubical equation, even when its faces have anchors normalized by different deck elements: all their values are entries of this same vector $v$, and Stokes gives the signed zero sum of those entries. After repeated slots in its $2 \( n + 1 \)$ faces have been combined, each coefficient has the stated bound. The kernel of this integer matrix has a real basis of integer vectors $b_1 \, dots.h \, b_k$ with
  $ k lt.eq N_0 \, #h(2em) max_j parallel b_j parallel_oo lt.eq K_0 := \( C_n N_0 \)^(C N_0) . $
  To see this, choose a nonsingular maximal minor and solve for its pivot coordinates in terms of the free coordinates; multiplying each basis vector by its nonzero determinant makes it integral. Hadamard’s bound for minors of a matrix with entries at most $2 \( n + 1 \)$ gives the displayed estimate. Lexicographically choosing the pivot minor makes the basis Borel. The case of a zero-dimensional kernel simply has $v = 0$ and needs no rounding.
  Write $v = sum_j t_j b_j$, using the pivot solution, which is Borel. Independently round each $t_j$ to the two adjacent multiples of $D_0^(- 1)$, choosing their probabilities so that its conditional expectation is $t_j$. Choose a single integer $D_0 gt.eq N_0 K_0 r^(- n) q^n$, using uniform elementary upper bounds for $N_0 \, K_0$. The resulting vector $v'$ lies in the same kernel, has entries in $D_0^(- 1) bb(Z)$, has expectation $v$, and satisfies $parallel v' - v parallel_oo lt.eq N_0 K_0 \/ D_0 lt.eq r^n q^(- n)$. All operations, including taking floors and using independent uniform parameters for the adjacent choices, are Borel. The fixed slot order is used for every pivot choice. Thus one parameter $xi$, independent of $Omega$, gives one rounded vector $v' \( V \, s \, xi \)$ for all cells. Set $u'_C = v'_(t \( C \, omega \))$. The invariance of the type under translation proves equivariance, and the common zero rows prove all the asserted incidence equations. ◻
]

The rounded coefficients define the original oriented dual current

$ Z_(upright("rd")) := sum_C D_0 u'_C \[ C^(\#) \] . quad "(6.6)" $ <eq:transfer-rounded-current>

Here $\[ C^(\#) \]$ is integration over the oriented cube, and the coefficients are integers. We verify the local finiteness implicit in this notation. The form bound and rounding give $\| u_C \| lt.eq C_n r^n$ and an elementary bound for each $\| D_0 u'_C \|$. Let $B$ be a small flat ball in one sheet chart and $Q$ one full projected dual cube. The intersection $Q ∩ z \( B \)$ is convex. Any lift of $Q$ meeting $B$ agrees with the chart inverse on this connected intersection, by uniqueness of lifts for the local diffeomorphism $z$. Thus two lifts meeting $B$, even at different projected points, agree there and then agree on the connected cube $Q$. At most one geometric lift of each projected cube meets $B$. Only finitely many projected grid cubes meet $z \( B \)$, with bounded coefficients, proving neighborhood local finiteness.

Let $cal(T)_delta subset cal(U)_omega$ be the strict tube of points at distance less than $delta$ from a witness in its ball chart. The exact incidence equations in Lemma 20 give

$ partial Z_(upright("rd")) \|_(cal(T)_delta) = 0 . quad "(6.7)" $ <eq:transfer-current-closed>

This is a local assertion: the boundary current vanishes on test forms compactly supported in $cal(T)_delta$.

To resolve $Z_(upright("rd"))$ smoothly, realize each coefficient by $\| D_0 u'_C \|$ oriented copies of its cube, reversing orientation when $u'_C < 0$. At every facet where boundary balance is required, pair positive and negative incident copies and glue them by their common face. Leave other facets free, and double this diagram with an oppositely oriented mirror, joining each free facet to its mirror. All codimension-one faces of the doubled diagram are now paired. Local axis, grid, and copy indices order the incident copies, so these choices may be Borel and equivariant.

The doubling does not join the two sides near $K$, even through a lower face. If a point of any face maps into $cal(T)_delta$, every path of facet identifications relating chambers incident to that face preserves its image point. Each facet on the path meets the tube, so was balanced before doubling and was not a free mirror facet. The entire incidence class at that point stays on its original side or its mirror side. At a point of a lifted grid face, only boundedly many local grid indices and their boundedly many copies can meet. Facet identifications preserve that point and its sheet, so even after doubling they relate only this bounded collection of incident chambers.

Take barycentric subdivision of the doubled cubes. Each top simplex $sigma$ has vertices colored $0 \, dots.h \, m$ by the dimensions of its barycentric faces, and every facet pairing respects these colors. Write $epsilon_sigma in { 1 \, - 1 }$ for its sign relative to that color order, and call this doubled signed simplicial diagram $cal(P)$. It maps facewise to $cal(U)_omega$, with elementary subdivision and incidence bounds. The original current $Z_(upright("rd"))$ remains the object to be represented on $cal(T)_delta$; the doubling supplies closed facet pairings for the resolution.

=== 6.2 A controlled smooth measured resolution <a-controlled-smooth-measured-resolution>

The diagram need not be a manifold at faces of codimension greater than one. The following construction replaces it by a measured family of smooth manifolds while preserving the represented chain. The small portion on which its metric is not the pulled-back flat metric will be controlled by its coordinate volume.

The reflected gluing below uses Gaifullin’s explicit permutohedral resolution, including the face-preserving sign-changing pairings, their conjugation under reflections, and the auxiliary bit toggles [7] pp. 562–563. We replace his rank-indexed bits by independent subset-indexed bits, put invariant probability laws on the pairing data, and supply smooth measured charts and quantitative metric bounds.

#thm([Lemma 6.4.])[
  (Measured resolution).  #emph[For the diagram $cal(P)$ there is a standard Borel measured family $cal(A)$ of oriented smooth $m$-manifolds and a smooth map $X : cal(A) arrow.r cal(U)_omega$, equivariant and Borel in all the data. The integration identities below are for fixed grid, entropy, and rounding data, including $\( V \, s \, omega \, xi \)$; their integrals use the conditional state measure and depend Borelly on those data. The points over $cal(T)_delta$ represented by original chamber tiles form a Borel leaf-open subset $cal(A)_(upright("orig")) subset X^(- 1) \( cal(T)_delta \)$. For every compactly supported smooth $m$-form $alpha$ on $cal(T)_delta$, 
$ integral_(cal(A)_(upright("orig"))) X^(*) alpha = Z_(upright("rd")) \( alpha \) . quad "(6.8)" $ <eq:transfer-local-push>

 For the full doubled diagram, measured oriented integration also gives 
$ X_(*) \[ cal(A) \] = \[ cal(P) \] . quad "(6.9)" $ <eq:transfer-push>

 For a parameter $0 < lambda < 1 \/ 2$ and a choice 
$ 0 < 2 gamma_0 < \( m + 1 \)^(- \( m + 1 \)) lambda^(m \( m + 1 \)) \, quad "(6.10)" $ <eq:transfer-gamma>

 there are a smooth metric $k$ and a closed seam set in each tile such that $parallel d X parallel_k lt.eq 1$, and $k = X^(*) k_(upright("flat"))$ off the seam. There are buffered smooth charts with elementary overlap, metric, inverse-metric, and fixed-order derivative bounds whenever $lambda^(- 1)$ and $gamma_0^(- 1)$ are elementary. In the sorted charts for each tile, the seam is contained in the union of the slabs $\| Z_j \| lt.eq lambda$, $1 lt.eq j lt.eq m$. The $k$-volume density in those charts has an elementary upper bound chosen before $lambda \, gamma_0$; in particular this bound does not depend on these two parameters.]
  #emph[One may prescribe for each chamber over a dual cube a rotation $O_sigma in S O \( q \)$. There is also a smooth Borel equivariant $cal(R) : cal(A) arrow.r S O \( q \)$ equal to $O_sigma$ off the seam in that tile, equal to the identity near all tile facets, and homotopic to the identity. Its fixed-order chart derivatives and $parallel d cal(R) parallel_k$ are elementarily bounded under the same hypotheses.]
] <lem:transfer-resolution>

#proof[
  #emph[Invariant reflection states.] For each nonempty proper subset $S subset { 0 \, dots.h \, m }$ and each face with exactly those vertex colors, pair the incident positive chambers with the incident negative chambers. The two counts agree. Indeed choose a color omitted by $S$; the given codimension-one matching in $cal(P)$ across facets omitting this color pairs the chambers at that face with opposite signs. All incident sets are finite by the incidence bound above. Choose uniformly among their possible pairings, independently for each face and each $S$, and let $p_S$ denote the resulting involution on chambers. Use also independent uniform bits $t_S in { 0 \, 1 }$, one for each $S$. The state space consists of $zeta = \( sigma \, p \, t \)$, with counting measure on $sigma$ and these product probabilities on $p \, t$. These are countable products of finite probability spaces. As the original data vary, the incidence lists and finite pairing choices are Borel, so the product laws are Borel probability kernels.
  Define a move $s_S$ by
  $ sigma mapsto p_S sigma \, #h(2em) t_S mapsto 1 - t_S \, #h(2em) p_R mapsto p_S p_R p_S quad \( R subset.neq S \) \, $
  leaving the other data unchanged. The conjugated $p_R$ is again a pairing at each $R$-face: $p_S$ preserves every such face and flips the chamber sign, so conjugation preserves its face and its sign-reversing property. Each $s_S$ is an involution. If $R subset.neq S$, the two moves commute. On chambers, for example, their two orders both give $p_S p_R sigma$, since after $s_S$ the $R$-pairing is $p_S p_R p_S$. On a pairing indexed by a subset of $R$, both orders conjugate by $p_S p_R$; on the other indices the same assertion follows directly from which of the two moves changes that index. The bits commute as well. Thus all moves in a nested flag commute, and they act freely: each changes its own bit, so no nonempty product of these moves can fix a state.
  These moves preserve the state measure. They permute the counting chamber index, flip a uniform bit, and, conditional on $p_S$, conjugate each relevant uniformly distributed finite pairing by a permutation of its incident set. The latter operation permutes its finite set of possible pairings and preserves its uniform law. It also preserves the independent product of those laws. All moves are Borel and commute with translating the original label data.
  #emph[Smooth leaves and the measured atlas.] Attach the following tile to each state. Start with the positive simplex $x_0 \, dots.h \, x_m > 0$, $sum_i x_i = 1$, and take the closure of its collection of pair ratios $\( x_i \/ x_j \)_(i eq.not j)$ in the product of copies of $\[ 0 \, oo \]$. For each permutation $i_0 \, dots.h \, i_m$ use the coordinate chart
  $ u_j = x_(i_j) \/ x_(i_(j - 1)) in \[ 0 \, 4 \) \, #h(2em) 1 lt.eq j lt.eq m . quad "(6.11)" $ <eq:transfer-ratios>
  All pair ratios in the chart are products of these or their reciprocals, so the $u_j$ are independent coordinates. Sorted orders have $u_j lt.eq 1$ and cover the closure. The facet $u_j = 0$ has label $S_j = { i_0 \, dots.h \, i_(j - 1) }$; the labels of a corner are nested. Glue each facet to the identical resolved coordinates in the state obtained by $s_(S_j)$. The commutation just proved makes the gluing consistent at corners.
  Use signed square root coordinates $u_j = Z_j^2$, with $Z in \( - 2 \, 2 \)^m$, starting from any state. For $Z_j < 0$ use the tile obtained by $s_(S_j)$; use the product of these commuting moves when several coordinates are negative. At zero use the starting tile as a convention for representing the same glued point.
  Figure 1 illustrates the tile and the four signed quadrants at a two-facet corner when $m = 2$.
  #cetz.canvas({
  import cetz.draw: *
  line((-2.3, 1.208), (-3.393, -0.7475), (-1.208, -0.7475), close: true, fill: rgb("#f7f7ff"))
  content((-2.3, 1.208), [$0$], anchor: "south")
  content((-3.393, -0.7475), [$1$], anchor: "north-east")
  content((-1.208, -0.7475), [$2$], anchor: "north-west")
  content((-2.3, -0.138), [$sigma$])
  content((-2.3, -1.633), [#text(size: 8pt)[one barycentric#linebreak()chamber $sigma tilde.eq Delta^2$]])
  line((-0.2875, 0.138), (-1.035, 0.138))
  content((-0.6612, 0.138), [$X$], anchor: "south")
  line((2.544, 0.805), (1.15, 1.61), (-0.2443, 0.805), (-0.2443, -0.805), (1.15, -1.61), (2.544, -0.805), close: true, fill: rgb("#e3e3e3"), stroke: (paint: rgb("#000000")))
  line((1.907, 0.437), (1.15, 0.874), (0.3931, 0.437), (0.3931, -0.437), (1.15, -0.874), (1.907, -0.437), close: true, fill: rgb("#ffffff"))
  content((1.708, 0.9661), [#text(size: 9pt)[$\{0\}$]])
  content((0.5923, 0.9661), [#text(size: 9pt)[$\{0,1\}$]])
  content((0.0345, 1.366e-16), [#text(size: 9pt)[$\{1\}$]])
  content((0.5922, -0.9661), [#text(size: 9pt)[$\{1,2\}$]])
  content((1.708, -0.9661), [#text(size: 9pt)[$\{2\}$]])
  content((2.151, 0), [#text(size: 9pt)[$\{0,2\}$]])
  content((1.15, 0), [#text(size: 9pt)[tile]])
  content((-0.6325, -2.472), [#text(size: 9pt)[\(a\) A chamber and its resolved tile]])
})
  #cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (1.438, 1.438), fill: rgb("#e0e0ff"))
  rect((-1.438, 0), (0, 1.438), fill: rgb("#ffecd9"))
  rect((0, -1.438), (1.438, 0), fill: rgb("#ffecd9"))
  rect((-1.438, -1.438), (0, 0), fill: rgb("#e0e0ff"))
  rect((-0.115, -1.438), (0.115, 1.438), fill: rgb("#dfdfdf"))
  rect((-1.438, -0.115), (1.438, 0.115), fill: rgb("#dfdfdf"))
  rect((-1.438, -1.438), (1.438, 1.438))
  line((-1.61, 0), (1.725, 0))
  content((1.725, 0), [#text(size: 9pt)[$Z_S$]], anchor: "west")
  line((0, -1.61), (0, 1.725))
  content((0, 1.725), [#text(size: 9pt)[$Z_T$]], anchor: "south")
  content((0.782, 0.7705), [$zeta$])
  content((-0.782, 0.7705), [$s_S zeta$])
  content((0.782, -0.7705), [$s_T zeta$])
  content((-0.782, -0.7705), [$s_"Ss"_T zeta$])
  content((1.184, 1.196), [#text(size: 9pt)[$+$]])
  content((-1.184, 1.196), [#text(size: 9pt)[$-$]])
  content((1.184, -1.196), [#text(size: 9pt)[$-$]])
  content((-1.184, -1.196), [#text(size: 9pt)[$+$]])
  content((0, -2.472), [#text(size: 9pt)[\(b\) $u_S=Z_S^2, u_T=Z_T^2$]])
})
  #figure(
    [],
    caption: [Figure 1: The reflected resolution in dimension two, following Gaifullin’s permutohedral construction [7]. In (a), one barycentric chamber $sigma tilde.eq Delta^2$ is paired with its resolved tile. The six facets are indexed by the nonempty proper subsets of ${ 0 \, 1 \, 2 }$; adjacent labels are nested. The map $X$ sends the tile interior diffeomorphically to the chamber interior. In (b), at a corner with labels $S subset T$, a full state $zeta = \( sigma \, p \, t \)$ and its three reflected states occupy the four quadrants of signed coordinates. The commutation $s_S s_T = s_T s_S$ and the independent bit toggles give four distinct quadrants of one smooth chart. The displayed signs compare each chamber sign with that of $zeta$: blue agrees and orange is opposite. The gray collar and strips represent the same seam schematically; their widths are illustrative, and $X$ is not affine. ],
  ) <fig:resolution>
  We verify that these are ordinary smooth charts. On an overlap of two permutations, a cut $S_j$ which is not a cut of the other permutation has $u_j gt.eq 4^(- 2 m)$. To see this, choose a pair of indices on opposite sides of that cut whose order is inverted in the other permutation. Their ratio in the first ordering is at most $4^m u_j$; its inverse in the second ordering is at most $4^m$. The asserted lower bound follows. At a cut common to both permutations, the ratio for the second chart is the first ratio at that cut multiplied by a product of ratios within the blocks between common cuts. Those within-block ratios and their required reciprocals are bounded away from zero on the overlap. After taking square roots, the transition at a common cut is consequently its signed coordinate times a smooth nonvanishing factor. All other transition coordinates are smooth monomials with denominators bounded away from zero.
  The sign in this transition is fixed on each region with fixed signs at the noncommon cuts. The remaining state relation is a product of the common reflections, and its product is unique by their free action on the bits. Commutation makes this sign rule persist across the zero coordinates. Thus the transitions are smooth and invertible across every corner. A point incident to $j$ facets has exactly the finite star of $2^j$ states under these reflections, and hence has one neighborhood of this form rather than several branches.
  The signed charts give smooth leaf neighborhoods. We next check the topological and transverse properties needed for measured integration. The leaves are Hausdorff. Distinct points with distinct resolved coordinates can be separated in the tile model. If their resolved coordinates agree but their finite stars differ, choose neighborhoods in these two stars avoiding all nonincident facets; no further identification then joins them. Each leaf has at most countably many states reachable by the finitely many moves and at most countably many charts, so it is second countable. The total space is standard Borel: the quotient of the state–tile space identifies finite classes at each tile point, for which Borel representatives can be selected by a fixed enumeration. More explicitly, charts can be indexed by the starting chamber, its bit array, and the flag, with the pairing arrays as transversal parameters. The bits determine the crossings at nonzero signed coordinates; the moves can then be inverted to recover the pairing array. With the zero convention above this makes the chart maps injective. Changes of transversal are the measure-preserving moves on countably many Borel overlap pieces. A plaque meets only elementarily many plaques in this atlas: for each second flag only the states in the two finite flag reflection groups can occur. These observations give precisely the measured flow-box properties of Theorem 16.
  The chamber signs orient the leaves. In a flag chart the Jacobian sign from positive ratio coordinates to oriented barycentric coordinates depends only on the permutation. Changing one signed coordinate from positive to negative changes the Jacobian sign of $u_j = Z_j^2$ once, while the move changes the chamber sign once. The induced orientation is therefore the same across each facet. The transverse measures here are nonnegative; the signs enter only through this orientation in integrals of forms. The value of $omega$ is constant along each tile leaf, and translation by $Gamma$ reindexes the states and preserves these measures.
  #emph[The map and the local current.] Recover the raw $x_i$ from (6.11) by normalizing the successive products $1 \, u_1 \, u_1 u_2 \, dots.h \, u_1 dots.h.c u_m$. If $v_(sigma \, i)$ are the vertices of the indicated chamber in its flat chart, map its tile by
  $ X = sum_(i = 0)^m b_i v_(sigma \, i) \, #h(2em) b_i = frac(exp \( - 1 \/ x_i \), sum_l exp \( - 1 \/ x_l \)) \, quad "(6.12)" $ <eq:transfer-tile-map>
  where $exp \( - 1 \/ x_i \)$ is extended by zero at $x_i = 0$. On a facet with label $S$, all coefficients outside $S$ vanish to infinite order in its signed coordinate. The vertices in $S$ are the same on the paired chambers, and their coefficients are smooth functions of the squares of the signed coordinates. Thus $X$ is smooth through the gluing. Its denominator is at least $e^(- \( m + 1 \))$, since some $x_i gt.eq 1 \/ \( m + 1 \)$, which also gives elementary upper derivative bounds in the tile charts.
  On the positive simplex the map $x mapsto b$ is a diffeomorphism. Given positive $b_i$ of sum one, its inverse is obtained from the unique $t in \( 0 \, 1 \/ max_i b_i \)$ satisfying
  $ sum_i frac(1, - log \( t b_i \)) = 1 \; $
  the left side increases smoothly from zero to infinity. The inverse function theorem also gives the smooth inverse. This diffeomorphism preserves orientation. Indeed it extends to the closed simplex preserving every face, and the linear homotopy to the identity has the same property, so its relative topological degree is $+ 1$. It follows that the tile interior maps diffeomorphically, with sign $epsilon_sigma$, onto the interior of its chamber. Each chamber’s state probability integrates to one and the tile boundaries have leafwise measure zero. Fubini and change of variables therefore give, for every compactly supported smooth $m$-form $alpha$,
  $ integral_(cal(A)) X^(*) alpha = sum_sigma epsilon_sigma integral_sigma alpha . $
  This proves (6.9). To obtain the local identity, define $cal(A)_(upright("orig"))$ as the image in $X^(- 1) \( cal(T)_delta \)$ of tile points belonging to original chambers. At an interior point this subset is leaf-open. At a lower face, the incidence argument preceding the lemma shows that every state in its finite reflection star is on the same side. A neighborhood in that star can be chosen to keep its image in the strict tube and to avoid nonincident facets, so it stays on that side. This proves leaf-openness and makes the definition unambiguous at glued points; the finite indexed charts also make it Borel. Applying the same change-of-variables calculation only to original tile interiors, for a form supported in $cal(T)_delta$, gives (6.8): each original cube is counted with its coefficient $D_0 u'_C$, and each chamber’s state fiber has mass one.
  #emph[The metric and upper density.] The signed charts admit a background metric $k_0$ with elementary bounds for its coefficients, inverse, and every fixed number of derivatives in buffered charts. To construct it, take smooth product cutoffs supported in the signed boxes $\( - 2 \, 2 \)^m$ and equal to one on $\[ - 1 \, 1 \]^m$, and average their Euclidean chart metrics with the normalized cutoff weights. The smaller boxes cover, by sorted flags. The overlap bound above bounds the number of terms per plaque. The transition formulas and their inverses are products of at most $O \( m \)$ factors, and every required reciprocal at a noncommon cut is at most $4^(O \( m \))$. Their fixed-order derivatives consequently have elementary bounds. These facts give the claimed bounds for the average and its inverse, and make the construction Borel and equivariant. The same transition and product estimates, applied to (6.12), give an elementary upper bound for $d X$ and its fixed-order derivatives before any choice of $lambda$. The affine simplexes have diameter at most $r sqrt(m)$.
  Put $Theta = product_i x_i$. Choose a smooth $j = j \( Theta \)$ equal to one for $Theta lt.eq gamma_0$, zero for $Theta gt.eq 2 gamma_0$, and between zero and one elsewhere, with the rescaled smooth cutoff estimates. It is smooth in the signed charts and the same on both sides of every facet. Set
  $ k = X^(*) k_(upright("flat")) + j^2 k_0 \, #h(2em) upright("seam") = { Theta lt.eq 2 gamma_0 } . quad "(6.13)" $ <eq:transfer-resolution-metric>
  We call the complement of this closed seam the straight part. The metric is positive definite near the tile boundary because $j = 1$ there. Where $j < 1$, one has $Theta > gamma_0$, hence $x_i gt.eq gamma_0$ for every $i$, and $X$ is an immersion. The formula proves $parallel d X parallel_k lt.eq 1$ and equality of metrics off the seam.
  The upper density bound requires no inverse estimates. As quadratic forms, $k lt.eq X^(*) k_(upright("flat")) + k_0$, so its volume density in every sorted box is bounded by the upper bounds for $d X \, k_0$ already chosen. Call a common elementary bound $H_0 \( q \)$. In a sorted box $\| Z_j \| lt.eq 1$. If all $\| Z_j \| > lambda$, normalization of the successive products gives
  $ Theta gt.eq \( m + 1 \)^(- \( m + 1 \)) lambda^(2 \( 1 + 2 + dots.h.c + m \)) = \( m + 1 \)^(- \( m + 1 \)) lambda^(m \( m + 1 \)) . $
  Condition (6.10) shows that the seam lies in the stated union of slabs. Its coordinate volume in such a box is at most an elementary factor times $lambda$. The bound $H_0 \( q \)$ was fixed before this factor was made small.
  The remaining metric estimates may depend on $gamma_0$. On the part with $j < 1$, all positive ratios are bounded below by powers of $gamma_0$, so the product formulas control the inverse from raw barycentric to signed coordinates. The normalized weights in (6.12) obey $b_i gt.eq e^(- 1 \/ gamma_0) \/ \( m + 1 \)$. On a tangent vector $w = \( w_i \)$, $sum_i w_i = 0$, their derivative is
  $ d b_i \( w \) = b_i (w_i / x_i^2 - sum_l b_l w_l / x_l^2) . $
  These differences control $w$: if their common subtracted mean is $a$, the relation $sum_i w_i = 0$ expresses $a$ as a weighted average, with weights $x_i^2$, of the negatives of those differences. Thus $\| w \|$ is bounded by a polynomial in $m$ times $e^(1 \/ gamma_0) max_i \| d b_i \( w \) \|$. Finally, the affine map from the barycentric simplex to a simplex in a subdivided cube has elementary inverse bounds. Its matrix has $r$-scaled rational entries with bounded denominators, and its nonzero determinant and cofactors give this by minors. These estimates control the inverse metric where $j < 1$; where $j = 1$, $k_0$ already supplies that control. Differentiating the formula for $k$ a fixed number of times now gives elementary bounds, including the curvature bound, when $gamma_0^(- 1)$ is elementary.
  #emph[Frame interpolation.] The comparison needs a constant frame ordering tangent and normal axes on each straight tile, a frame that glues smoothly near facets, and a homotopy to the identity for the degree calculation. Choose a Borel skew-symmetric logarithm $A_sigma$ of each $O_sigma$ with operator norm at most $pi$. Such a choice follows by decomposing an orthogonal rotation into its two-dimensional angle blocks with principal angles and, on its $- 1$-eigenspace, pairing a Borel choice of orthonormal basis; the even dimension there follows from determinant one. Define on that tile
  $ cal(R) = exp \( \( 1 - j \) A_sigma \) . $
  It is the identity in a neighborhood of each facet and thus glues smoothly despite the change of $sigma$. It equals $O_sigma$ where $j = 0$, and replacing $1 - j$ by $t \( 1 - j \)$, $0 lt.eq t lt.eq 1$, gives the asserted homotopy. The cutoff and metric inverse estimates give the derivative bounds. The choices can be made on the indexed chamber data, so they are Borel and equivariant as asserted. ◻
]

For our use, choose $O_sigma$ to take $z$-increments to rotated grid increments, putting the $m$ axes tangent to the dual cube first and the $n$ complementary axes last. Use a signed permutation if needed to have determinant one. Thus $O_sigma = Q_sigma V$ for a signed permutation $Q_sigma in S O \( q \)$ with this order. Signs will not affect any row norm or any cubical test.

=== 6.3 The comparison map and its degree <the-comparison-map-and-its-degree>

The parameter selection below fixes $lambda \( q \)$ and $gamma_0 \( q \)$ deterministically. For those choices the bounds in Lemma 21 give fixed elementary numerical envelopes $K_R \( q \)$ and $K_(upright("scal")) \( q \)$ such that

$ parallel d cal(R) parallel_(oo \, k) lt.eq K_R \( q \) \, #h(2em) \( - "Scal"_k \)_(+) lt.eq K_(upright("scal")) \( q \) $

for every allowed diagram and every $V \, s \, omega$, rounding parameter, and state. These envelopes come from the uniform chart derivative bounds and do not use $C_(upright("ent"))$. Fix the single number

$ tau = tau \( q \) = frac(1, 300 sqrt(q) max { r^(- 1) \, delta^(- 1) \, 1 + K_R \( q \) }) . quad "(6.14)" $ <eq:transfer-tau>

It has an elementary reciprocal and is common to all those parameters. In particular $3 tau sqrt(q) lt.eq min { r \/ 100 \, delta \/ 100 \, \( 1 + K_R \( q \) \)^(- 1) }$.

Fix $V \, s$ and the rounding parameter for the moment. Take the product of $tilde(M)$ and the tile family $cal(A)$ over their shared $omega$, and divide by the diagonal $Gamma$-action. Orient the product with the $tilde(M)$ directions first and the $cal(A)$ directions second. The resulting measured leaves have dimension $n + m = q$. Using the leaf-open set $cal(A)_(upright("orig"))$ from Lemma 21, work only on the open set of pairs $\( x \, a \)$ with $a in cal(A)_(upright("orig"))$ for which $X \( a \)$ is in the lift of the ball chart of $F \( x \)$, at distance less than $delta \/ 4$. Define there

$ G \( x \, a \) = cal(R) \( a \) \( z_F \( x \) - z_(X \( a \)) \) . quad "(6.15)" $ <eq:transfer-comparison>

Here $z_(X \( a \)) = z compose X \( a \)$. The requirement on the lifts is part of the domain; coincident color coordinates on incompatible sheets are never compared. The map is invariant under the diagonal action.

Use the band ${ \| G \|_oo < 3 tau }$ in that open domain, and put $b_q = tau \( 1 + 3 \/ \( 4 q \) \)$, the inner width in Theorem 16 when $d = q$. Let $cal(D)$ be its measured degree.

#thm([Lemma 6.5.])[
  (Comparison degree).  #emph[The band in (6.15) satisfies the chart and integration control assumptions of Theorem 16, for each fixed instance, the product metric $h + L^2 k$ with any fixed $L > 0$, and the pullback of the entropy weight $phi.alt$. Its degree is Borel in the auxiliary parameters and satisfies 
$ bb(E)_(upright("rd")) cal(D) = D_0 I quad "(6.16)" $ <eq:transfer-degree>

 for every fixed $V \, s$.]
] <lem:transfer-degree>

#proof[
  The local pushforward (6.8) will express the degree using a smoothed form of $Z_(upright("rd"))$. Its primal-cell periods are the integer coefficients $D_0 u'_C$. Their expectations match the periods of $D_0 eta$; a compatible piecewise cubical primitive and mollification then give the same measured pairing with $F$. We first verify the band control that makes these integrations valid.
  #emph[The controlled comparison band.] Before taking the quotient, the product flow boxes use the entropy transversal $omega$ and the state transversals of $cal(A)$. Variation along the tile keeps $omega$ constant. These transversals carry the invariant measures constructed above. A group element that stabilizes a product leaf acts freely and properly because it acts so on the $tilde(M)$ factor. Hence the quotient leaves are ordinary oriented Hausdorff second countable manifolds. The actions reindex labels and states, leave the color and flag coordinates unchanged, and preserve the transverse measures and orientations.
  For an inner closed comparison cube there is a uniform margin from the boundary of the allowed sheet domain. Indeed $cal(R)$ is orthogonal and (6.14) gives $\| z_F - z_X \|_2 lt.eq 3 tau sqrt(q) lt.double delta \/ 4$. The large witness color at $F$ remains present with a uniform small buffer. In a flat ball chart a lifted path whose projected coordinates stay in the ball stays in that same lift, by uniqueness of lifts for a local diffeomorphism. The nearby points therefore remain in coherent sheet charts. Facets that lead to the mirror are outside this region. The available smooth bounds for the instance give fixed buffered coordinate charts for all the data in these regions.
  To check the finiteness condition on those charts, choose lifts of a finite buffered atlas on $M$. On their compact closures $F$ uses only uniformly finitely many possible labels, by the lifted support bounds in Theorem 9. Any nearby cell lift has its anchor in a closed one-neighborhood of one of these labels. The numbers of projected grid indices, chamber subdivisions, and copies there are bounded as above. Thus only finitely many chamber indices are needed over each such base chart, uniformly for the instance. Their state probabilities have total mass one per chamber, and the sum of transverse measures of this covering is finite. Plaque overlaps are bounded by the tile overlap bound and the bounded overlap of the base atlas. In the quotient only finitely many deck changes meet two of these buffered base charts. Subdividing their inner boxes and, when necessary, restricting to Borel transverse sets gives the flow boxes stipulated in Theorem 16. All metric and data bounds in this verification may depend on the instance. It also justifies Fubini and measured Stokes for the integrations that follow.
  #emph[The local convolution form.] Choose a smooth unit-integral top form $beta$ on $bb(R)^q$ supported in a Euclidean ball about zero of radius less than $min { tau \, r \/ 10 }$. In calculating the degree using $beta$, homotope $cal(R)$ to the identity as in Lemma 21. All maps in this homotopy are orthogonal on the difference variable. Their pullbacks of $beta$ are thus supported where the difference has this same small norm, strictly inside both the sheet domain and the original band. Measured Stokes for this supported homotopy shows that it does not change the degree.
  After removing the rotation, fiber integration of $\( z \, w \) mapsto z - w$ against $beta$ and the original current $Z_(upright("rd"))$ gives a smooth $n$-form $alpha_(upright("rd"))$ near $K$. More explicitly, in a flat chart put $sans(d) \( z \, w \) = z - w$. Integrate $sans(d)^(*) beta$ along each compatible $C^(\#)$ in the second variable, multiply by $D_0 u'_C$, and sum. The sum is locally finite and uses the original side. By the local identity (6.8), Fubini, and change of variables on tile interiors, the degree is
  $ cal(D) = integral_(cal(M)) F^(*) alpha_(upright("rd")) . quad "(6.17)" $ <eq:transfer-convolution-degree>
  Boundary cancellation of the dual cubes shows that $d alpha_(upright("rd")) = 0$ on, for example, the tube of radius $delta \/ 8$ around $K$. To verify this directly, apply fiber Stokes to each cube. Its boundary terms only involve facets within the support distance of the point $z$; these lie in the balanced tube and cancel with their paired incidence signs.
  For every primal $n$-cell sufficiently near $K$ in the same sheet,
  $ integral_C alpha_(upright("rd")) = D_0 u'_C . quad "(6.18)" $ <eq:transfer-convolution-cells>
  Indeed a primal $n$-cell and a complementary dual $m$-cell of this grid meet only when their indices match, and then at their common center. If their axis sets differ, a coordinate fixed for both is a grid vertex for the primal cell and a half-step center for the dual cell, so their difference in that coordinate is at least $r \/ 2$. If their axis sets agree but their grid indices differ, a differing coordinate gives the same separation. Such pairs cannot meet the support of $beta$. For the matching pair, the difference map from $C times C^(\#)$ contains the support ball in its image with multiplicity one. Our fiber integration convention is $integral_C integral_(C^(\#)) sans(d)^(*) beta = integral_(C times C^(\#)) sans(d)^(*) beta$ with the base-first product orientation. The differential of $sans(d) \( z \, w \) = z - w$ sends this ordered frame to the primal basis followed by the negative dual basis, so its orientation is positive by our choice of the dual orientation. Its integral is therefore one, proving (6.18). The small support and the chart buffers ensure that only the indicated lifts contribute.
  #emph[The detector pairing.] Set $alpha = bb(E)_(upright("rd")) alpha_(upright("rd")) - D_0 eta$. It is a smooth closed form on that tube, and (6.5), (6.4), and (6.18) give $integral_C alpha = 0$ on all the primal $n$-cells there. We explain why its measured pairing with $F$ vanishes, including when $F$ meets grid faces.
  Use all lifted full $q$-cells needed to cover the tube of radius $delta \/ 32$ around $K$. Taking $r sqrt(q)$ sufficiently small as above, these cells lie in the tube of radius $delta \/ 8$, all their $n$-faces are selected, and their shared faces fit in coherent sheet charts. On one grid interval $\[ a \, a + r \]$, project a function to its linear interpolation between the endpoints and project a one-form $f \( t \) d t$ to the constant one-form with the same integral. The homotopy for a one-form is the function
  $ sans(h) \( f \( t \) d t \) \( t \) = integral_a^t (f \( v \) - r^(- 1) integral_a^(a + r) f \( s \) thin d s) d v \, $
  which vanishes at both endpoints; the homotopy on functions is zero. Direct differentiation gives $upright("id") - sans(P) = d sans(h) + sans(h) d$. Apply these operations one coordinate at a time, with the ordinary exterior differential signs. The tensor-product homotopy still commutes with tangential restriction to a face, since the one-dimensional primitive vanishes at the endpoints. The full projection of an $n$-form has, for each axis set, coefficients obtained by integrating on its $n$-faces and interpolating linearly in the remaining axes. Hence the full projection of $alpha$ is zero. Since $d alpha = 0$, the homotopy supplies a primitive on each full cube, and its tangential restrictions agree on shared faces.
  This piecewise primitive has bounded coefficients for the instance and is also a weak primitive on the tube: in distributional Stokes the terms on each shared face cancel by agreement of its tangential restrictions. On a smaller tube mollify it in the flat coordinates. This can be done with the same small Euclidean convolution in every chart: the buffered sheets give a unique lift of the convolution ball, and on overlaps the piecewise primitive and flat coordinates agree. Its smooth exterior derivatives are the mollifications of the smooth form $alpha$, and converge to $alpha$ there. The construction is Borel and equivariant and has bounded coefficients for the instance. Measured Stokes applied to the pullback of each smooth primitive gives zero; convergence and the uniform chart bounds give $integral_(cal(M)) F^(*) alpha = 0$. All expectations and integrals above are measurable by their locally finite chart formulas, and their absolute bounds for the instance justify their interchange. Using (6.3) in (6.17) now proves (6.16). ◻
]

=== 6.4 The two comparison lengths and the final average <the-two-comparison-lengths-and-the-final-average>

We finish by estimating these degrees. We will see separately how the straight part uses the dimension-only Hilbert norm of $eta$ and how the small coordinate volume of the seam pays for its rougher bound.

#proof[
  The case $parallel M parallel = 0$ is immediate. Otherwise we first prove the conditional target for the data above, choosing $Psi_n$ from the requirements on $E$ derived below, and then apply it to the entropy output. Choose a positive constant $b_(*)$, depending only on $n$, whose smallness will be fixed in the estimate below, and put
  $ L_T = b_(*) sqrt(E) \, #h(2em) L_N = b_(*) sqrt(q E) \, #h(2em) h_(upright("tot")) = h + L_T^2 k . quad "(6.19)" $ <eq:transfer-lengths>
  Once the degree hypotheses are verified, its length denominator, the product volume, and the entropy contribution will combine as
  $ frac(L_T^m E^(n \/ 2), L_T^m L_N^n) thin e^(- W) d V_h = b_(*)^(- n) q^(- n \/ 2) rho . quad "(6.20)" $ <eq:transfer-prefactor>
  This is the cancellation of the tangent volume and all powers of $E$. The estimates below justify the degree application and bound the straight angular sum by a dimensional multiple of $q^(n \/ 2)$, while the collar volume controls the seam.
  Use the weight $phi.alt$, constant in the tile directions. The product scalar formula and the definition of $cal(S)$ give $cal(S) \( h_(upright("tot")) \, phi.alt \) = cal(S) \( h \, phi.alt \) + L_T^(- 2) "Scal"_k$. By the definition of $K_(upright("scal")) \( q \)$, the lower bound $E gt.eq b_(*)^(- 2) K_(upright("scal")) \( q \)$ ensures $L_T^(- 2) "Scal"_k gt.eq - 1$. By (6.1),
  $ cal(S) \( h_(upright("tot")) \, phi.alt \) gt.eq - C_(upright("ent")) - 1 + 2 W - n log E + E frak(e) . quad "(6.21)" $ <eq:transfer-total-scalar>
  Assign $L_i = L_T$ to the first $m$ comparison rows and $L_i = L_N$ to the last $n$ rows. On the band, the derivative in tile directions of each row of $G$, measured with $k$, has norm at most two. The $d X$ term has norm at most one, and the $d cal(R)$ term has norm at most $3 tau sqrt(q) parallel d cal(R) parallel_k lt.eq 1$ by (6.14). The horizontal derivative is a row of a rotation of $d z_F$. It follows that
  $ L_i \| d G_i \|_(h_(upright("tot"))) lt.eq C_n #scale(x: 120%, y: 120%)[\(] sqrt(q) + sqrt(q E) thin E^(- 1 \/ 100) #scale(x: 120%, y: 120%)[\)] . $
  Take $B$ to be this upper bound increased by two. Then $L_i \| d G_i \| lt.eq B - 1 = B - q \/ q$. The horizon condition of Theorem 16 holds after an elementary increase of $E$: it suffices to test the smallest length $L_T$, and, for $E gt.eq 1$,
  $ frac(C \( 1 + B \)^(2 \/ 3), L_T) lt.eq c_(upright("hor") \, n) q^(1 \/ 3) E^(- 13 \/ 75) < frac(tau, 10 q) . $
  Here $c_(upright("hor") \, n)$ depends only on the absolute horizon constant and the dimensional choice of $b_(*)$, and $13 \/ 75 = 1 \/ 2 - \( 2 \/ 3 \) \( 1 \/ 2 - 1 \/ 100 \) > 0$. Thus the displayed strict horizon inequality follows if $E gt.eq \( 20 c_(upright("hor") \, n) q^(4 \/ 3) \/ tau \)^(75 \/ 13)$. We may therefore apply Theorem 16 with $d = q$.
  Write $H_i = 2 \( L_i \| d G_i \| - 1 \)_(+)$, as in that theorem. At a straight point in a tile, let $cal(I)$ be the $n$-set of grid axes normal to its dual cube. Put $A_i = \( V d z_F \)_i$, with covector norms measured by $h$, and define
  $ U_(cal(I))^2 = q / frak(e) sum_(i in cal(I)) \| A_i \|_h^2 quad upright("if ") frak(e) > 0 \, #h(2em) U_(cal(I)) = 0 quad upright("if ") frak(e) = 0 . quad "(6.22)" $ <eq:transfer-U>
  Here $sum_i \| A_i \|^2 = frak(e)$. At a straight point $k = X^(*) k_(upright("flat"))$ and $cal(R) = Q_sigma V$ is constant. For a tangent comparison row corresponding to axis $i$, the squared row norm is exactly $L_T^(- 2) + \| A_i \|^2$. Thus
  $ sum_(upright("tangent")) H_i lt.eq L_T^2 frak(e) = b_(*)^2 E frak(e) \, $
  by $2 \( sqrt(1 + t) - 1 \) lt.eq t$. Normal rows have no tile derivative, so Cauchy–Schwarz gives
  $ sum_(upright("normal")) H_i lt.eq 2 L_N sum_(i in cal(I)) \| A_i \| lt.eq 2 b_(*) sqrt(n) sqrt(E frak(e)) thin U_(cal(I)) . $
  Completing the square in $sqrt(E frak(e))$, for $b_(*) < 1$, shows that
  $ frac(sum_i H_i - E frak(e), 2) lt.eq c_n U_(cal(I))^2 \, #h(2em) c_n = frac(n b_(*)^2, 2 \( 1 - b_(*)^2 \)) . quad "(6.23)" $ <eq:transfer-straight-penalty>
  Choose $b_(*)$ sufficiently small that
  $ bb(E)_V exp \( 2 c_n U_(cal(I))^2 \) lt.eq C_n quad "(6.24)" $ <eq:transfer-sphere>
  for every fixed horizontal differential and every fixed $cal(I)$. Here is a direct verification of this choice. If $u$ is one coordinate of a uniform point on $S^(q - 1)$, its sphere moments satisfy
  $ bb(E) \( q u^2 \)^j = frac(q^j \( 1 dot.op 3 dots.h.c \( 2 j - 1 \) \), q \( q + 2 \) dots.h.c \( q + 2 j - 2 \)) lt.eq 2^j j ! . $
  Consequently $bb(E) e^(t q u^2) lt.eq \( 1 - 2 t \)^(- 1)$ for $0 lt.eq t < 1 \/ 2$. The singular-value decomposition of $d z_F$ expresses each $q \| A_i \|^2 \/ frak(e)$ as a convex combination of such random variables, with its singular-value weights. Jensen’s inequality gives the same exponential bound for that convex combination. Another application of Jensen to the sum of the $n$ rows in (6.22) bounds its exponential moment by $\( 1 - 2 n t \)^(- 1)$. Choosing, for instance, $2 n c_n < 1 \/ 4$ proves (6.24). No independence of the rows of $V$ is used.
  At a seam point the uniform tile row bound gives a rougher estimate which is still independent of the instance. By the triangle inequality for each row, $\( a - 1 \)_(+) lt.eq a$, and Cauchy–Schwarz on the horizontal rows,
  $ sum_i H_i lt.eq 2 L_N sqrt(q frak(e)) + 4 q L_N \/ L_T lt.eq 2 b_(*) q sqrt(E frak(e)) + 4 q^(3 \/ 2) . $
  Completing the square once more gives
  $ frac(sum_i H_i - E frak(e), 2) lt.eq c_(upright("seam") \, n) q^2 \, #h(2em) c_(upright("seam") \, n) = 2 + b_(*)^2 / 2 . quad "(6.25)" $ <eq:transfer-seam-penalty>
  Apply the degree inequality, then use (6.21). Its loss is $exp \( C q \/ q \)$, an absolute constant. The product volume form is $d V_(h_(upright("tot"))) = L_T^m d V_h thin d V_k$, so the measure factor is exactly (6.20). Together with (6.16) and $\| bb(E) cal(D) \| lt.eq bb(E) \| cal(D) \|$, this gives the following inequality, with $C_(upright("out")) = exp \( C_(upright("deg")) + \( C_(upright("ent")) + 1 \) \/ 2 \) b_(*)^(- n)$, where $C_(upright("deg"))$ is the absolute exponent in Theorem 16:
  $ D_0 I \( 2 tau \)^q lt.eq C_(upright("out")) q^(- n \/ 2) integral_(cal(M)) rho thin bb(E)_(V \, s \, upright("rd")) integral_({ a : med \| G \( x \, a \) \|_oo < b_q }) cal(B) \( x \, a \) thin d V_k \( a \) \, quad "(6.26)" $ <eq:transfer-average>
  where the fiber integral includes its state transversals and only the compatible original-side band, and
  $ cal(B) \( x \, a \) = cases(delim: "{", exp \( c_n U_(cal(I))^2 \) \, & a upright(" straight over axes ") cal(I) \,, exp \( c_(upright("seam") \, n) q^2 \) \, & a upright(" in the seam") .) $
  The entropy constant enters only through this final prefactor, not the geometric bounds used below. The length and volume prefactor has no exponential loss in $m$; the seam exponential will be absorbed by the choice of $lambda$.
  Fix $x \, omega$, and put $y = F \( x \)$. At a coupled pair in (6.26), a fixed projected grid index has at most one possible cell lift in the ball chart of $y$. Its full primal and dual cells fit in that chart by (6.14) and the buffers, and the lift there is unique. Moreover each point of its primal cell is within $10 r sqrt(q)$ of $y$: the dual point is within $b_q sqrt(q)$ of $y$, and the dual and primal extents are at most $r sqrt(m) \/ 2$ and $r sqrt(n) \/ 2$. The variation choice for $r$ and the rounding error now give the copy-count estimate
  $ D_0 \| u'_C \| lt.eq D_0 r^n #scale(x: 120%, y: 120%)[\(] \| eta_(cal(I)) \( y \) \| + 2 q^(- n) #scale(x: 120%, y: 120%)[\)] \, quad "(6.27)" $ <eq:transfer-copies>
  where the component is in the $V$-rotated frame.
  On a straight tile the $k$-volume is exactly the flat volume of its image in the chamber. The signed permutation in $G$ does not change its cube test, which is $\| hat(z)_y - hat(z)_X \|_oo < b_q$. Summing the chamber pieces in a copy is thus bounded by the $m$-area of its whole dual cube inside that test; the state probabilities for each chamber integrate to one. For a fixed axis set $cal(I)$, summing over all projected centers and averaging the shift gives exactly
  $ r^(- q) integral_(bb(R)^q) integral_(\[ - r \/ 2 \, r \/ 2 \]^m) upright(bold(1))_({ \| hat(z)_y - c - t \|_oo < b_q }) thin d t thin d c = r^(- q) r^m \( 2 b_q \)^q . quad "(6.28)" $ <eq:transfer-shift>
  Here $t$ is placed in the complementary axes. This identity is just the density $r^(- q)$ of centers under uniform shift; extending the sum to the full grid is an upper bound for the selected lifted cells.
  The form bound holds in every rotated frame. Using Cauchy–Schwarz jointly in $V$ and the $binom(q, n)$ axis sets, and then (6.24), we obtain
  $ bb(E)_V sum_(\| cal(I) \| = n) \( \| eta_(cal(I)) \( y \) \| + 2 q^(- n) \) e^(c_n U_(cal(I))^2) & lt.eq (bb(E)_V sum_(cal(I)) \| eta_(cal(I)) \( y \) \|^2)^(1 \/ 2) (bb(E)_V sum_(cal(I)) e^(2 c_n U_(cal(I))^2))^(1 \/ 2) + C_n q^(- n) binom(q, n)\
 & lt.eq C_n q^(n \/ 2) . quad "(6.29)" $ <eq:transfer-form-average>
  This use of Cauchy–Schwarz allows the form components and row norms to depend on the same rotation. Combining (6.27)–(6.29), the straight part of the inner expectation in (6.26) is at most $C_n D_0 q^(n \/ 2) \( 2 b_q \)^q$, because $r^(n + m - q) = 1$. Multiplying by its prefactor $q^(- n \/ 2)$ bounds that part, for a fixed dimension-only constant $C_(upright("str") \, n)$, by
  $ C_(upright("str") \, n) D_0 \( 2 tau \)^q \, quad "(6.30)" $ <eq:transfer-straight-average>
  since $\( b_q \/ tau \)^q = \( 1 + 3 \/ \( 4 q \) \)^q lt.eq e^(3 \/ 4)$.
  For the seam use only the consequence $\| z_X - z_y \|_2 lt.eq b_q sqrt(q)$ of the cube test. Discard the tile boundaries, which have leafwise measure zero. The remaining set is the disjoint union of tile interiors indexed by their #emph[actual] chamber $sigma$ and its state arrays. Partition each such interior into positive sorted-coordinate pieces, for example by taking the first sorted permutation in a fixed order. On these pieces $0 < Z_j lt.eq 1$, so no signed-chart reflection changes the chamber. The conditional state measure over each actual chamber has mass one, and its $k$-density is at most the elementary $H_0 \( q \)$ chosen before $lambda$.
  Retain the compatible-sheet restriction at this point. For a fixed projected grid index the uniqueness proved before (6.27) allows at most one compatible geometric lift. Apply the rough copy bound $D_0 \| u'_C \| lt.eq C_(eta \, n) D_0 r^n$ from that equation, where $C_(eta \, n)$ depends only on the form norm, and use the uniform density bound. Only after these bounds may we drop the restrictions on available sheets, roundings, and chambers and sum over all projected centers and chamber shapes.
  For a fixed actual chamber shape, normal axis set $cal(I)$, and positive sorted flag, (6.12) has rotated position
  $ hat(z)_X = s + r (k + 1 / 2 upright(bold(1))_(cal(I))) + d_(cal(I) \, upright("shape") \, upright("flag")) \( Z \) . $
  Here $upright(bold(1))_(cal(I))$ is the coordinate indicator vector of $cal(I)$. The displacement $d$ is independent of the pairing and bit arrays, of $lambda \, gamma_0$, and of the shift; it is determined by the fixed chamber shape and the barycentric formula. For each fixed $Z$ the shift integral of the rough test is consequently
  $ 1 / r^q integral_(\[ 0 \, r \)^q) sum_(k in bb(Z)^q) upright(bold(1))_({ \| s + r \( k + 1 / 2 upright(bold(1))_(cal(I)) \) + d \( Z \) - hat(z)_y \|_2 lt.eq b_q sqrt(q) }) thin d s & = r^(- q) "Vol"_(bb(R)^q) \( B_(b_q sqrt(q)) \)\
 & lt.eq r^(- q) \( 4 tau sqrt(q) \)^q . $
  This calculation is valid despite the shift dependence of the actual diagram, because the copy, lift, and density bounds were imposed before the enlargement to all centers. Tonelli’s theorem applies to these nonnegative bounds.
  In each positive sorted piece the seam lies in $union.big_j { Z_j lt.eq lambda }$, of coordinate volume at most $m lambda$. A cube has $2^m m !$ barycentric top chambers and at most $\( m + 1 \) !$ sorted flags per chamber. Thus the seam part of the inner expectation is bounded by
  $ C_(*) \( q \) lambda D_0 \( 2 tau \)^q \, quad "(6.31)" $ <eq:transfer-seam-average>
  where one may take the elementary envelope
  $ C_(*) \( q \) = max {1 \, thin C_(eta \, n) H_0 \( q \) binom(q, n) \( 2^m m ! \) \( m + 1 \) ! thin m thin r^(n - q) \( 2 sqrt(q) \)^q exp \( c_(upright("seam") \, n) q^2 \)} . $
  Every factor here was bounded before choosing $lambda$. Thus $C_(*)$ is independent of $lambda \, gamma_0 \, tau$, of the bounds $K_R \, K_(upright("scal"))$, and of $C_(upright("ent"))$. The powers $tau^q$ in the shift count have already canceled those in $\( 2 tau \)^q$.
  The two fiber estimates now have the same normalization. Insert (6.30) and (6.31) into (6.26), using $q^(- n \/ 2) lt.eq 1$ for the seam, and cancel the positive factor $D_0 \( 2 tau \)^q$. For the conditional data and parameter bounds used so far, this gives
  $ I lt.eq C_(upright("out")) #scale(x: 120%, y: 120%)[\(] C_(upright("str") \, n) + C_(*) \( q \) lambda #scale(x: 120%, y: 120%)[\)] integral_(cal(M)) rho . quad "(6.32)" $ <eq:transfer-before-choices>
  We now fix these bounds before invoking the entropy theorem. For each integer $q gt.eq n + 1$, the form derivative bound first gives a deterministic $r \( q \)$ with elementary reciprocal. The size bound for the universal type list, $D_0$, incidence counts, and the bounds for $k_0 \, d X$, including $H_0 \( q \)$, have elementary envelopes uniform over all permitted graphs and cocycles. Fix $b_(*)$ using (6.24); this determines the dimensional constants $c_(upright("seam") \, n)$ and $c_(upright("hor") \, n)$, independently of $C_(upright("ent"))$. The displayed formula for $C_(*) \( q \)$ is consequently available at this stage. Set
  $ lambda \( q \) = frac(1, 4 C_(*) \( q \)) \, #h(2em) gamma_0 \( q \) = 1 / 4 \( m + 1 \)^(- \( m + 1 \)) lambda \( q \)^(m \( m + 1 \)) . $
  These deterministic choices have elementary reciprocals and satisfy (6.10). The resolution estimates now give common elementary envelopes for its fixed-order chart derivatives, hence $K_R \( q \) \, K_(upright("scal")) \( q \)$, and then the common $tau \( q \)$ in (6.14). None of these choices uses the entropy constant.
  For integer $j gt.eq n + 1$, define
  $ Psi_n^compose \( j \) = max {1 \, med b_(*)^(- 2) K_(upright("scal")) \( j \) \, (frac(20 c_(upright("hor") \, n) j^(4 \/ 3), tau \( j \)))^(75 \/ 13)} \, $
  and define a majorant on all $t in \[ 1 \, oo \)$ by
  $ Psi_n \( t \) = 1 + max_(j in bb(Z)\
n + 1 lt.eq j lt.eq max { n + 1 \, ceil.l t ceil.r }) Psi_n^compose \( j \) . $
  Every expression used here has an elementary upper bound; the finite maximum is bounded by an increasing elementary envelope at $max { n + 1 \, ceil.l t ceil.r }$. Thus $Psi_n$ is an elementary majorant fixed solely from $n$, and it dominates both the curvature and strict horizon requirements. Hence every conditional datum with $E gt.eq Psi_n \( q \)$ satisfies all hypotheses used in (6.32). Our choice $C_(*) \( q \) lambda \( q \) = 1 \/ 4$ and the definition of $C_(upright("out"))$ prove (6.2) with
  $ K_n = e^(C_(upright("deg")) + 1 \/ 2) b_(*)^(- n) #scale(x: 120%, y: 120%)[\(] C_(upright("str") \, n) + 1 \/ 4 #scale(x: 120%, y: 120%)[\)] . $
  This closes the conditional target for all the specified data before any entropy family is chosen.
  Now apply Theorem 9 with $cal(B) = Psi_n$, $E_min = 1$, the detector root map as $F^(upright("in"))$, and the one-point transverse space $Omega_0$. The detector construction uses finitely many compactly supported bump representatives and their deck translates, giving the required uniform support and derivative bounds in a lifted atlas and the equivariant compact support sets. After pulling the detector map to $Omega$ and embedding its labels equivariantly among the output’s finite copies, the measured affine probability homotopy of Section 2 preserves $I$; the output therefore supplies the conditional data with $E > Psi_n \( q \)$. Its constant $C_(upright("ent")) = C_(upright("ent")) \( n \, Psi_n \)$ depends only on $n$. Since $rho lt.eq d V_g$ and the transverse measure over $M$ is a probability measure,
  $ I lt.eq K_n e^(C_(upright("ent")) \/ 2) integral_(cal(M)) rho lt.eq K_n e^(C_(upright("ent")) \/ 2) "Vol"_g \( M \) . $
  Finally $I gt.eq parallel M parallel \/ 2$, so the constant $C_n = 2 K_n e^(C_(upright("ent")) \/ 2)$ proves the theorem. ◻
]

#proof[
  Fix $n gt.eq 3$, and let $C_n > 0$ be the constant for the normalized scalar-curvature estimate in Theorem 18. Proposition 3 gives
  $ parallel M parallel lt.eq C_n integral_M \( "Scal"_g^(-) \)^(n \/ 2) thin d V_g $
  for every metric in the theorem. Taking $a_n = C_n^(- 1) > 0$ proves the stated integral bound. ◻
]

#heading(level: 1)[References]
#bibitem([1])[W. K. Allard, #emph[On the first variation of a varifold], Annals of Mathematics (2) #strong[95] (1972), no. 3, 417--491. #link("https://doi.org/10.2307/1970868")[doi:10.2307/1970868].]
#bibitem([2])[T. Aubin, #emph[Équations différentielles non linéaires et problème de Yamabe concernant la courbure scalaire], Journal de Mathématiques Pures et Appliquées (9) #strong[55] (1976), no. 3, 269--296.]
#bibitem([3])[S. Braun and R. Sauer, #emph[Volume and macroscopic scalar curvature], Geometric and Functional Analysis #strong[31] (2021), 1321--1376. #link("https://doi.org/10.1007/s00039-021-00588-y")[doi:10.1007/s00039-021-00588-y].]
#bibitem([4])[O. Chodosh and C. Li, #emph[Generalized soap bubbles and the topology of manifolds with positive scalar curvature], Annals of Mathematics (2) #strong[199] (2024), no. 2, 707--740. #link("https://doi.org/10.4007/annals.2024.199.2.3")[doi:10.4007/annals.2024.199.2.3].]
#bibitem([5])[M. Eichmair, #emph[The Plateau problem for marginally outer trapped surfaces], Journal of Differential Geometry #strong[83] (2009), no. 3, 551--583. #link("https://doi.org/10.4310/jdg/1264601035")[doi:10.4310/jdg/1264601035].]
#bibitem([6])[R. Frigerio, #emph[Bounded cohomology of discrete groups], preprint, 2016. #link("https://arxiv.org/abs/1610.08339v2")[arXiv:1610.08339v2].]
#bibitem([7])[A. A. Gaifullin, #emph[Realisation of cycles by aspherical manifolds], Russian Mathematical Surveys #strong[63] (2008), no. 3, 562--564. #link("https://doi.org/10.1070/RM2008v063n03ABEH004540")[doi:10.1070/RM2008v063n03ABEH004540]\; #link("https://arxiv.org/abs/0806.3580")[arXiv:0806.3580].]
#bibitem([8])[A. Gaifullin, #emph[Universal realisators for homology classes], Geometry & Topology #strong[17] (2013), no. 3, 1745--1772. #link("https://doi.org/10.2140/gt.2013.17.1745")[doi:10.2140/gt.2013.17.1745].]
#bibitem([9])[D. Gilbarg and N. S. Trudinger, #emph[Elliptic Partial Differential Equations of Second Order], second edition, Classics in Mathematics, Springer, Berlin, 2001. #link("https://doi.org/10.1007/978-3-642-61798-0")[doi:10.1007/978-3-642-61798-0].]
#bibitem([10])[M. Gromov, #emph[Volume and bounded cohomology], Publications Mathématiques de l'IHÉS #strong[56] (1982), 5--99. #link("https://www.numdam.org/item/PMIHES_1982__56__5_0/")[Numdam: PMIHES\_1982\_\_56\_\_5\_0].]
#bibitem([11])[M. Gromov, #emph[Large Riemannian manifolds], in #emph[Curvature and Topology of Riemannian Manifolds], K. Shiohama, T. Sakai, and T. Sunada (eds.), Lecture Notes in Mathematics #strong[1201], Springer, Berlin, 1986, 108--121. #link("https://doi.org/10.1007/BFb0075649")[doi:10.1007/BFb0075649].]
#bibitem([12])[M. Gromov, #emph[Positive curvature, macroscopic dimension, spectral gaps and higher signatures], in #emph[Functional Analysis on the Eve of the 21st Century, Volume II], S. Gindikin, J. Lepowsky, and R. L. Wilson (eds.), Progress in Mathematics #strong[132], Birkhäuser, Boston, 1996, 1--213. #link("https://doi.org/10.1007/978-1-4612-4098-3_1")[doi:10.1007/978-1-4612-4098-3\_1].]
#bibitem([13])[N. V. Ivanov, #emph[Notes on the bounded cohomology theory], preprint, 2017, revised December 2020. #link("https://arxiv.org/abs/1708.05150v3")[arXiv:1708.05150v3].]
#bibitem([14])[A. S. Kechris, #emph[Classical Descriptive Set Theory], Graduate Texts in Mathematics #strong[156], Springer, New York, 1995. #link("https://doi.org/10.1007/978-1-4612-4190-4")[doi:10.1007/978-1-4612-4190-4].]
#bibitem([15])[J. M. Lee and T. H. Parker, #emph[The Yamabe problem], Bulletin of the American Mathematical Society (N.S.) #strong[17] (1987), no. 1, 37--91. #link("https://doi.org/10.1090/S0273-0979-1987-15514-5")[doi:10.1090/S0273-0979-1987-15514-5].]
#bibitem([16])[Q. Ma, J. Wang, Z. Xie, G. Yu, and B. Zhu, #emph[Gromov's simplicial volume vanishing conjecture for positive scalar curvature], preprint, 2026. #link("https://arxiv.org/abs/2606.29135v4")[arXiv:2606.29135v4].]
#bibitem([17])[F. Maggi, #emph[Sets of Finite Perimeter and Geometric Variational Problems: An Introduction to Geometric Measure Theory], Cambridge Studies in Advanced Mathematics #strong[135], Cambridge University Press, Cambridge, 2012. #link("https://doi.org/10.1017/CBO9781139108133")[doi:10.1017/CBO9781139108133].]
#bibitem([18])[J. Min, F. Zheng, and B. Zhu, #emph[Simplicial volume and scalar curvature on closed Kähler surfaces], preprint, 2026. #link("https://arxiv.org/abs/2608.17335v1")[arXiv:2608.17335v1].]
#bibitem([19])[J. Nash, #emph[The imbedding problem for Riemannian manifolds], Annals of Mathematics (2) #strong[63] (1956), no. 1, 20--63. #link("https://doi.org/10.2307/1969989")[doi:10.2307/1969989].]
#bibitem([20])[OpenAI, #emph[Positive scalar curvature forces rational inessentiality], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Positive-scalar-curvature-forces-rational-inessentiality-September-23-2026/paper.pdf")[OAI:Positive-scalar-curvature-forces-rational-inessentiality-September-23-2026], 2026.]
#bibitem([21])[G. Perelman, #emph[The entropy formula for the Ricci flow and its geometric applications], preprint, 2002. #link("https://arxiv.org/abs/math/0211159")[arXiv:math/0211159].]
#bibitem([22])[Yu. G. Reshetnyak, #emph[Weak convergence of completely additive vector functions on a set], Siberian Mathematical Journal #strong[9] (1968), no. 6, 1039--1045. #link("https://doi.org/10.1007/BF02196453")[doi:10.1007/BF02196453].]
#bibitem([23])[R. Schoen, #emph[Conformal deformation of a Riemannian metric to constant scalar curvature], Journal of Differential Geometry #strong[20] (1984), no. 2, 479--495. #link("https://doi.org/10.4310/jdg/1214439291")[doi:10.4310/jdg/1214439291].]
#bibitem([24])[N. S. Trudinger, #emph[Remarks concerning the conformal deformation of Riemannian structures on compact manifolds], Annali della Scuola Normale Superiore di Pisa, Classe di Scienze (3) #strong[22] (1968), no. 2, 265--274. #link("https://www.numdam.org/item/ASNSP_1968_3_22_2_265_0/")[Numdam: ASNSP\_1968\_3\_22\_2\_265\_0].]
#bibitem([25])[H. Yamabe, #emph[On a deformation of Riemannian structures on compact manifolds], Osaka Mathematical Journal #strong[12] (1960), no. 1, 21--37. #link("https://doi.org/10.18910/8577")[doi:10.18910/8577].]


