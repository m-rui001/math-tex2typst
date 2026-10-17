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

#align(center)[#text(size: 16pt, weight: "bold")[A radial continuum phase transition with algebraic decay]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A phase transition is a singularity that appears in the thermodynamic limit of a particle system. We construct one for a radial pair interaction with a bounded continuous core and an explicit integrable power-law bound on its tail.

We consider identical classical particles in three-dimensional Euclidean space. For a radial pair potential $phi.alt$, a cube $Lambda_L = \[ 0 \, L \]^3$, and $N gt.eq 0$, set

#[#set math.equation(numbering: n => "(1.1)")
 $ U^phi.alt \( x_1 \, dots.h \, x_N \) = sum_(1 lt.eq i < j lt.eq N) phi.alt \( lr(|x_i - x_j|) \) \, #h(2em) Z_(L \, N)^phi.alt \( beta \) = frac(1, N !) integral_(Lambda_L^N) exp \( - beta U^phi.alt \) thin thin upright(d) x_1 dots.h.c thin upright(d) x_N \, $ <eq:partition>]

with $Z_(L \, 0)^phi.alt = 1$. The position measure is fixed independently of the inverse temperature $beta > 0$. A potential is #emph[stable] if $U^phi.alt gt.eq - B N$ for a constant $B$ and every finite configuration.

Let $p$ denote the packing constant

$ p = lim_(L arrow.r oo) M_L / L^3 \, #h(2em) M_L = max { \# X : X subset \[ 0 \, L \]^3 \, med lr(|x - y|) gt.eq 1 med upright("for distinct ") x \, y in X #scale(x: 120%, y: 120%)[}] . $

The existence and positivity of $p$ are proved in 1; its numerical value is not needed.

#thm([Theorem 1.1.])[
  #emph[There is a bounded continuous function $phi.alt : \[ 0 \, oo \) arrow.r bb(R)$ and finite constants $B \, C > 0$ such that 
$ sum_(i < j) phi.alt \( lr(|x_i - x_j|) \) gt.eq - B N \, #h(2em) lr(|phi.alt \( r \)|) lt.eq C r^(- 3 - 1 \/ 32) quad \( r gt.eq 1 \) . $

 There are an open interval $I subset \( 0 \, oo \)$ centered at $5 p \/ 3$ and a common inverse temperature $beta_c in \[ 7 \/ 8 \, 9 \/ 8 \]$ such that, for every $rho in I$, the canonical free energy 
$ f \( beta \, rho \) = - lim_(L arrow.r oo) frac(1, beta L^3) log Z_(L \, floor.l rho L^3 floor.r)^phi.alt \( beta \) $

 exists and is finite for every $beta > 0$. Its finite one-sided derivatives at $beta_c$ satisfy 
$ f'_(-) \( beta_c \, rho \) > f'_(+) \( beta_c \, rho \) . $

 In particular, $f \( thin dot.op thin \, rho \)$ is not differentiable at $beta_c$.]
] <thm:main>

=== 1.1 Context and the role of the tail <context-and-the-role-of-the-tail>

The existence of continuum phase transitions belongs to the program highlighted by Simon’s problems in mathematical physics #cite(label("Simon1984")). We address the explicit interaction class and canonical singularity in 1.

Rigorous continuum coexistence results precede the present construction. Ruelle proved a transition for a symmetric two-species classical system #cite(label("Ruelle1971")). Lebowitz, Mazel, and Presutti established a liquid–vapor transition for a continuum model with an attractive pair term and a repulsive four-body term #cite(label("LebowitzMazelPresutti1998")) #cite(label("LebowitzMazelPresutti1999")). Dereudre and Renaud-Chan establish density coexistence for a class of saturated continuum interactions #cite(label("DereudreRenaudChan2026")) Theorems 1–2. Their radial-kernel example integrates over the union of particle neighborhoods, giving a many-body energy #cite(label("DereudreRenaudChan2026")) Section 2.3, Example 3. The species or many-body structures are part of these models; the problem considered here uses a single species and a sum of radial pair interactions.

Long-range weak attractions provide a classical route from microscopic particle interactions to a nonconvex mean-field free energy. The Lebowitz–Penrose theory identifies the limiting free energy through convexification of a reference free energy with a quadratic attraction term #cite(label("LebowitzPenrose1966")). Gerardi, Marchioro, Olivieri, and Presutti extended this framework from hard-core references to superstable interactions #cite(label("GerardiEtAl1973")). In the present problem, the limit of an interaction as its range tends to infinity is only an intermediate object: the required singularity must belong to one fixed pair potential. Moreover, a pointwise power bound constrains how the masses of its successive attractions may depend on their ranges.

The companion article #cite(label("OpenAICompanion2026")) Theorem 1.1 constructs a radial potential with a divergent repulsive core, an integrable $o \( r^(- 3) \)$ tail, and a common transition inverse temperature for an open interval of densities. Both articles use small clusters and separated supports of a pressure in two variables. Here we prove the bounded-core construction and the quantitative range estimate needed for a fixed power margin. All proofs required for the present theorem are included below. The two articles concern different potentials, each with its own density interval and common critical inverse temperature.

A recent theorem of He, Jauslin, Lebowitz, and Peled proves a liquid–vapor transition for a finite-range modified Kac pair interaction #cite(label("HeJauslinLebowitzPeled2026")) Equation (1.13), Theorems 1.3 and 1.5. Their interaction is defined using a fixed partition into boxes, and the coexistence theorem is formulated at a fixed inverse temperature. Our physical interaction is a radial function of particle separation; boxes enter only the estimates used to analyze its integrals. The conclusion here is a strict inverse-temperature derivative jump of the canonical free energy at one common critical point throughout an open interval of densities. It is an existence result for the constructed infinite-range interaction, with no identification of its phases as conventional fluid phases.

The estimates also have several classical ancestors. The quadratic occupation control is part of the superstability framework developed by Ruelle #cite(label("Ruelle1970")). For our particular core, the needed bound follows from the weighted graph maximization argument of Motzkin and Straus #cite(label("MotzkinStraus1965")) Theorem 1; we reproduce the argument and its geometric application. Supporting slopes and partial convex duality are used in their standard finite-dimensional sense #cite(label("RockafellarWets1998")) Theorem 11.1 and Proposition 11.3. The local occupation estimates, the quantitative attraction comparison, and the persistence argument are proved at their precise strengths in this paper.

=== 1.2 Proof strategy <proof-strategy>

There are three tasks: construct a stable family of bounded potentials, compare a long-range attraction with its ideal density transform, and preserve a sufficiently large set of pressure supports while the attraction ranges grow. We describe how their outputs fit together.

===== 1.2.1 A bounded reference family. <a-bounded-reference-family.>

A parameter $t > 1$ fixes the microscopic core; it is chosen once and is independent of $beta$. Below distance one, the core has height $t^2$ outside a narrow shell at distances comparable to $upright(e)^(- t)$; inside the shell it has a zero-energy plateau. It vanishes beyond a fixed radius. Four particles can form a tetrahedron with all six pair distances in the zero plateau, whereas five cannot lie in the shell. This gives a quadratic lower bound in the particle counts of small cubes. The bound survives the addition of nonnegative radial attractions with a prescribed total mass. Section 2, Section 3 use it to establish the canonical and grand-canonical limits, uniform occupation moments, and continuity of pressure under a small change of attraction mass.

For a potential $phi$ in this family and a density $d gt.eq 0$, write

$ H_phi \( beta \, d \) = - lim_(L arrow.r oo) frac(1, t L^3) log Z_(L \, floor.l d L^3 floor.r)^phi \( beta \) \, #h(2em) Q_phi \( beta \, h \) = sup_(d gt.eq 0) { h d - H_phi \( beta \, d \) } . $

Thus $H_phi = beta f_phi \/ t$, and $h$ is the field dual to density. The pressure $Q_phi$ is convex jointly in $\( beta \, h \)$. A supporting slope $\( e \, d \)$ at $\( beta_0 \, h_0 \)$ means that

$ Q_phi \( beta \, h \) gt.eq Q_phi \( beta_0 \, h_0 \) + e \( beta - beta_0 \) + d \( h - h_0 \) $

for every $beta > 0$ and $h in bb(R)$. Two such slopes with the same density $d = rho$ and distinct first coordinates give two distinct upper supporting slopes of $H_phi \( thin dot.op thin \, rho \)$. This is the route to the derivative jump, proved explicitly in 11.

===== 1.2.2 An attraction with controlled error. <an-attraction-with-controlled-error.>

For a pressure $Q$, an ideal attraction of mass $a > 0$ acts by

#[#set math.equation(numbering: n => "(1.2)")
 $ \( T_a Q \) \( beta \, h \) = sup_(u in bb(R)) {Q \( beta \, h + beta a u \) - frac(beta a, 2) u^2} . $ <eq:intro-transform>]

Square completion identifies its maximizing shifts $u$ with maximizing densities after addition of the quadratic attraction term. 4 proves attainment, uniform bounds on these shifts, and an exact formula for all supporting slopes of $T_a Q$.

Fix a nonnegative radial $C^1$ kernel $w$, supported in the unit ball and of integral one, and put $w_R \( x \) = R^(- 3) w \( x \/ R \)$. If the reference interaction $phi_0$ has range at most $R_0$, then 2 compares the physical attraction $- t a w_R$ with the ideal transform:

$ parallel Q_(phi_0 - t a w_R) - T_a Q_(phi_0) #scale(x: 120%, y: 120%)[parallel]_(cal(D)) lt.eq C_(cal(D) \, t) sqrt(R_0 \/ R) $

on each compact parameter set $cal(D)$. The constant is uniform over earlier reference interactions and over positive masses $a$ tending to zero. Boxes of side comparable to $sqrt(R_0 R)$ balance the cost of deleting reference interactions across boxes against the variation of the new kernel inside them. For the lower bound, independent reference grand ensembles are placed in these boxes. Completing a square avoids any need to identify their mean density with the maximizing shift, so the comparison remains valid at coexistence without selecting a phase.

===== 1.2.3 Three slope groups and one fixed potential. <three-slope-groups-and-one-fixed-potential.>

As $t$ grows, the bare-core pressure tends to $max { 0 \, p h \, 4 p h - 9 p }$. Its branches come from vacuum, single particles, and four-particle clusters, respectively. A first ideal attraction turns these into three affine branches with noncollinear slopes in the $\( e \, d \)$ plane. 6 proves that, for one large finite $t$, the actual generating supports remain near these three slopes throughout a parameter neighborhood.

Uniform convergence of convex pressures by itself need not preserve a corner. The additional control comes from the following property of a maximizing shift in (1.2): at its shifted parameter $\( beta \, h + beta a u \)$, the reference pressure has a parabolic upper bound in the field variable (5). In 10 this bound confines nearby supports to one density band and hence to one of the separated slope groups. An error $delta$ in pressure then costs $O \( delta \/ a \)$ in the slopes.

After the first attraction, take $R_(n + 1) = R_n^2$ and $a_n = R_n^(- 1 \/ 16)$. The range errors are $O \( R_n^(- 1 \/ 4) \)$, and their ratios to the next masses are $O \( R_n^(- 1 \/ 8) \)$. All relevant losses are summable. 7 consequently preserves a common two-dimensional ball of pressure supports, passes it to the limit, and uses horizontal slices near density $5 p \/ 3$ to obtain the canonical singularity at a common inverse temperature throughout a density interval. The same schedule gives $sum_n a_n R_n^(1 \/ 32) < oo$, which supplies the pointwise tail bound. The core, all attraction parameters, and the density interval are fixed before the limiting critical parameter is selected.

== 2 A stable family and its thermodynamic functions <f:section>

We first construct a bounded repulsive core which permits clusters of at most four particles at very short separations. Its quadratic control of local particle numbers will be uniform over all attraction ranges used later. Throughout the proof, all position integrals use Lebesgue measure in one fixed microscopic length unit, and all finite volumes have free boundaries.

=== 2.1 Packing and the microscopic core <packing-and-the-microscopic-core>

#thm([Lemma 1.])[
  (Packing density).  #emph[Let $M_L$ be the maximum cardinality of a subset of $\[ 0 \, L \]^3$ whose distinct points have mutual distances at least one. Then 
$ p = lim_(L arrow.r oo) M_L / L^3 $

 exists and belongs to $\( 0 \, oo \)$.]
] <f:packing>

#proof[
  Disjoint balls of radius $1 \/ 3$ about the points lie in $\[ - 1 \/ 3 \, L + 1 \/ 3 \]^3$, so $M_L lt.eq C \( L + 1 \)^3$. This also bounds the possible cardinalities; compactness of the configuration space for each cardinality shows that the maximum is attained. The integer lattice gives a positive lower asymptotic density.
  Fix $s > 0$ and repeat a maximizing configuration in $\[ 0 \, s \]^3$ by translations in $\( s + 1 \) bb(Z)^3$. Points in distinct translates are separated by at least one: in a coordinate in which the translates differ, their coordinate separation is at least $\( s + 1 \) - s = 1$. Taking all complete translates contained in $\[ 0 \, L \]^3$ gives
  $ liminf_(L arrow.r oo) M_L / L^3 gt.eq frac(M_s, \( s + 1 \)^3) . $
  Letting $s arrow.r oo$ along a sequence realizing the upper asymptotic density makes the right side tend to that upper density. The lower and upper limits therefore agree. ◻
]

Set $A = 3 \/ \( 2 p \)$ and $Delta = 10^(- 3)$. The parameter $t > 1$ below is a construction parameter, distinct from inverse temperature $beta$. We shall eventually choose one sufficiently large $t$ and keep it fixed. Put

$ l_t = upright(e)^(- t) \, #h(2em) I_t = \[ l_t \, \( 1 + Delta \) l_t \] \, #h(2em) 2 \( 1 + Delta \) l_t < 1 . $

Define $psi_t : \[ 0 \, oo \) arrow.r \[ 0 \, t^2 \]$ by

#[#set math.equation(numbering: n => "(2.1)")
 $ psi_t \( r \) & = t^2 &  & upright("on ") \[ 0 \, l_t \] union \[ \( 1 + Delta \) l_t \, 1 \] \,\
psi_t \( r \) & = 0 &  & upright("on ") \[ \( 1 + Delta \/ 3 \) l_t \, \( 1 + 2 Delta \/ 3 \) l_t \] union \[ 1 + 1 \/ t \, oo \) \, $ <f:core>]

and make it affine on each of the three intervening intervals. Thus $psi_t$ is continuous, including at zero, nonnegative, and supported in $\[ 0 \, 2 \]$.

Fix a radial nonnegative $C^1$ function $w$ on $bb(R)^3$, supported in the closed unit ball, with $integral_(bb(R)^3) w \( x \) thin thin upright(d) x = 1$. For example, one may normalize $\( \( 1 - lr(|x|)^2 \)_(+) \)^2$. Write $w_R \( x \) = R^(- 3) w \( x \/ R \)$. When its argument is a displacement in $bb(R)^3$, we also write $psi_t$ for the radial lift $x mapsto psi_t \( lr(|x|) \)$. The family of potentials used below is

#[#set math.equation(numbering: n => "(2.2)")
 $ phi \( x \) = psi_t \( lr(|x|) \) - S \( x \) \, #h(2em) S \( x \) = t sum_j alpha_j w_(R_j) \( x \) \, #h(2em) R_j gt.eq 1 \, quad alpha_j gt.eq 0 \, quad sum_j alpha_j lt.eq A + 1 . $ <f:family>]

The index set may be empty, finite, or countable. Since $∥w_(R_j)∥_oo lt.eq ∥w∥_oo$, the sum converges uniformly in the countable case. Every such potential is therefore bounded, continuous, radial, and nonpositive when $lr(|x|) gt.eq 2$.

The following lemma combines an elementary geometric obstruction with an extremal graph estimate. The weighted edge maximization in its proof is the Motzkin–Straus argument for Turán’s bound #cite(label("MotzkinStraus1965")) Theorem 1. We include it to make the quadratic core estimate explicit.

#thm([Lemma 2.])[
  (The shell graph).  #emph[For any finite configuration in $bb(R)^3$, join two particles when their distance belongs to $I_t$. This graph has no clique of size five. On any $m$ vertices it has at most $3 m^2 \/ 8$ edges.]
] <f:shell-graph>

#proof[
  If five points formed a clique, rescale their distances by $l_t^(- 1)$ and take the four difference vectors from one of them. Their Gram matrix differs entrywise by at most $2 Delta + Delta^2$ from the matrix with diagonal one and off-diagonal entries $1 \/ 2$. For a diagonal entry this follows from $1 lt.eq r^2 lt.eq \( 1 + Delta \)^2$; for an off-diagonal entry use polarization, $⟨v_i \, v_j⟩ = \( lr(|v_i|)^2 + lr(|v_j|)^2 - lr(|v_i - v_j|)^2 \) \/ 2$. The reference matrix has smallest eigenvalue $1 \/ 2$. The perturbation has operator norm at most $4 \( 2 Delta + Delta^2 \) < 1 \/ 2$, so the Gram matrix would be positive definite and have rank four. Four vectors in $bb(R)^3$ cannot have this Gram matrix.
  For the edge bound, maximize $sum_({ i \, j } in E) u_i u_j$ over $u_i gt.eq 0$, $sum_i u_i = 1$, choosing a maximizer with the smallest possible support. If two nonadjacent vertices have positive weights, the objective is affine in their two weights with their sum fixed. Putting their combined weight on one of the vertices cannot decrease the objective, contradicting minimality of the support. The support is therefore a clique of some size $r lt.eq 4$. Its objective is
  $ 1 / 2 (1 - sum_i u_i^2) lt.eq 1 / 2 \( 1 - 1 \/ r \) lt.eq 3 / 8 . $
  For $m > 0$, apply this bound to equal weights $1 \/ m$. The empty graph case is immediate. ◻
]

=== 2.2 Quadratic control of cell counts <quadratic-control-of-cell-counts>

We now convert the exclusion of five-particle shell cliques into a lower bound that controls arbitrary particle numbers, including coincident particles. This is a concrete superstable estimate in the sense of #cite(label("Ruelle1970"), form: "prose"); the constants will be uniform over all attraction ranges.

Partition space into half-open cubes $C_i$ of side $b = 1 \/ 4$, with any fixed translation of the grid. When working in a bounded region, replace each cell by its intersection with that region and omit empty cells. Let $n_i$ be the number of particles in cell $i$. If

$ J_(i j) = sup_(x in C_i \, thin y in C_j) S \( x - y \) \, $

then $J$ is symmetric and

#[#set math.equation(numbering: n => "(2.3)")
 $ sup_i sum_j J_(i j) lt.eq M := c_b t \( A + 1 \) \, #h(2em) c_b = ∥w∥_oo \( 2 \/ b + 5 \)^3 . $ <f:row-bound>]

Indeed, a cell interacts through $w_R$ with at most $\( 2 R \/ b + 5 \)^3$ cells, each contributing at most $R^(- 3) ∥w∥_oo$. Since $R gt.eq 1$, their row sum is at most $c_b$. Summing the coefficients proves (2.3), also for a countable sum and cropped cells.

We shall need the same estimates after removing some interactions. More precisely, in any bounded region allow symmetric measurable pair interactions

#[#set math.equation(numbering: n => "(2.4)")
 $ v \( x \, y \) = c \( x \, y \) psi_t \( lr(|x - y|) \) - K \( x \, y \) \, #h(2em) 0 lt.eq c lt.eq 1 \, quad K gt.eq 0 \, $ <f:modified-energy>]

where $c \( x \, y \) = 1$ for points in the same small cell, $K$ is bounded, and the symmetric matrix $J_(i j) = sup_(x in C_i \, y in C_j) K \( x \, y \)$ has row sums at most $M$. The coefficients are fixed functions of the positions, independent of the particle configuration. This includes partial deletion of any attractive pairs, partial deletion of core pairs between distinct cells, and their linear interpolations whenever they share the stated row bound. No translation invariance is required for these finite volume estimates. Write $U^v \( X \) = sum_(r < s) v \( x_r \, x_s \)$, and write $U^phi$ for a member of (2.2).

#thm([Proposition 1.])[
  (Common stability).  #emph[Set 
#[#set math.equation(numbering: n => "(2.5)")
 $ D_0 = t^2 \/ 8 \, #h(2em) B_0 = t^2 \/ 2 . $ <f:stability-constants>]

 For every configuration, including coincident particles, 
#[#set math.equation(numbering: n => "(2.6)")
 $ U^(psi_t) gt.eq D_0 sum_i n_i^2 - B_0 N \, #h(2em) U^v gt.eq \( D_0 - M \/ 2 \) sum_i n_i^2 - B_0 N . $ <f:cell-stability>]

 Choose $t$ sufficiently large that 
#[#set math.equation(numbering: n => "(2.7)")
 $ D_0 gt.eq 8 M \, #h(2em) c t > 4 \( A + 1 \) \, #h(2em) c = 1 \/ 3456 . $ <f:t-requirements>]

 Then, in any axis-parallel cube of side $L gt.eq 1$, with $V = L^3$, 
#[#set math.equation(numbering: n => "(2.8)")
 $ U^v gt.eq c t^2 N^2 / V - t^2 / 2 N . $ <f:density-stability>]

 In particular all members of (2.2) are stable with the same constant $B_0$.]
] <f:stability>

#proof[
  The diameter $sqrt(3) b$ of a small cell is less than one. By 2, among $m$ particles in one cell at least $m \( m - 1 \) \/ 2 - 3 m^2 \/ 8 = m^2 \/ 8 - m \/ 2$ pairs have distance outside $I_t$. Each of these pairs contributes $t^2$, while all remaining core contributions are nonnegative. Summing over cells proves the first bound, and also proves it when core terms between cells are deleted. For the attractive contribution, including extra diagonal self terms only enlarges the bound, and symmetry gives
  $ sum_(r < s) K \( x_r \, x_s \) lt.eq 1 / 2 sum_(i \, j) J_(i j) n_i n_j lt.eq 1 / 4 sum_(i \, j) J_(i j) \( n_i^2 + n_j^2 \) lt.eq M / 2 sum_i n_i^2 . $
  This proves (2.6).
  There are at most $\( L \/ b + 2 \)^3 lt.eq 216 V$ nonempty cells. Hence $sum_i n_i^2 gt.eq N^2 \/ \( 216 V \)$. Under (2.7), $D_0 - M \/ 2 gt.eq t^2 \/ 16$, giving (2.8) with the stated $c$. The requirements on $t$ are compatible: $M$ grows linearly in $t$, whereas $D_0$ grows quadratically. The constants $c$ and $c_b$ are independent of $t$ and of the attraction ranges. ◻
]

The two margins in (2.7) will be used separately. The inequality $D_0 gt.eq 8 M$ makes the influence of neighboring cell counts small compared with the repulsion within one cell; this will yield volume-independent occupation moments. The inequality $c t > 4 \( A + 1 \)$ keeps the density bound coercive even after adding the quadratic attractive weight in the next grand-sum estimate.

=== 2.3 Canonical limits and pressure duality <canonical-limits-and-pressure-duality>

The local quadratic bound controls configurations of high density. We next use it to establish the thermodynamic functions required by the attraction transform. The proof applies directly to the infinite attraction sum: separated boxes interact only attractively, so no finite-range approximation is needed to construct these limits.

For $Lambda_L = \[ 0 \, L \]^3$, define the canonical partition functions and their normalization by

#[#set math.equation(numbering: n => "(2.9)")
 $ Z_(L \, n)^phi \( beta \) & = frac(1, n !) integral_(Lambda_L^n) exp \( - beta U^phi \( X \) \) thin thin upright(d) X \, & Z_(L \, 0)^phi & = 1 \,\
H_(L \, n)^phi \( beta \) & = - frac(1, t L^3) log Z_(L \, n)^phi \( beta \) . $ <f:canonical-definition>]

#thm([Lemma 3.])[
  (Finite volume canonical bounds).  #emph[There is an absolute constant $C < oo$, independent of $t$ and all attraction ranges, such that for every admissible $t$, $L gt.eq 1$, $n gt.eq 0$, $beta > 0$, and $d_L = n \/ L^3$, 
#[#set math.equation(numbering: n => "(2.10)")
 $ beta t \( c d_L^2 - d_L \/ 2 \) + frac(d_L log d_L - d_L, t) lt.eq H_(L \, n)^phi \( beta \) lt.eq beta C t d_L^2 + frac(d_L log d_L, t) \, $ <f:finite-bounds>]

 where $0 log 0 = 0$.]
] <f:canonical-bounds>

#proof[
  The lower bound follows by bounding the integrand from above using (2.8) and using $n ! gt.eq \( n \/ upright(e) \)^n$ for $n gt.eq 1$. For the other bound, let $X_1 \, dots.h \, X_n$ be independent uniform points in $Lambda_L$. Since $U^phi lt.eq U^(psi_t)$ and $integral_(bb(R)^3) psi_t \( lr(|x|) \) thin thin upright(d) x lt.eq t^2 lr(|B \( 0 \, 2 \)|)$,
  $ bb(E) U^phi lt.eq frac(n \( n - 1 \), 2 L^3) integral_(bb(R)^3) psi_t \( lr(|x|) \) thin thin upright(d) x lt.eq C t^2 n^2 \/ L^3 . $
  Jensen’s inequality gives $log Z_(L \, n)^phi gt.eq n log L^3 - log n ! - beta C t^2 n^2 \/ L^3$. Now use $n ! lt.eq n^n$. At $n = 0$ both bounds are equalities. ◻
]

The following bound controls the entire large-particle-number tail. The additional quadratic factor is included because it will also occur in the range comparison.

#thm([Lemma 4.])[
  (Grand sum tails).  #emph[Fix an admissible $t$ and a compact $cal(D) subset Omega$, where $Omega = \( 0 \, oo \) times bb(R)$ has coordinates $\( beta \, h \)$. There are constants $D gt.eq 1$ and $a_0 > 0$, depending only on $t$ and $cal(D)$, such that, for every $phi$ in (2.2), $L gt.eq 1$, and $0 lt.eq zeta lt.eq 2 \( A + 1 \)$, 
#[#set math.equation(numbering: n => "(2.11)")
 $ sum_(n > D L^3) upright(e)^(t h n) Z_(L \, n)^phi \( beta \) exp (frac(beta t zeta n^2, 2 L^3)) lt.eq frac(exp \[ - a_0 \( floor.l D L^3 floor.r + 1 \) \], 1 - upright(e)^(- a_0)) #h(2em) \( \( beta \, h \) in cal(D) \) . $ <f:grand-tail-bound>]

 In particular the tail tends uniformly to zero, and is at most one for all sufficiently large $L$. These constants require no local occupation estimate.]
] <f:grand-tail>

#proof[
  Enclose $cal(D)$ in $beta in \[ beta_(-) \, beta_(+) \]$ and $lr(|h|) lt.eq H$. Put $V = L^3$. By (2.10), the logarithm of the summand at $n gt.eq 1$ is at most
  $ - beta t \( c t - zeta \/ 2 \) n^2 / V + \( t h + beta t^2 \/ 2 + 1 \) n - n log \( n \/ V \) . $
  The choice (2.7) implies $c t - zeta \/ 2 gt.eq c t \/ 2$. Set $kappa = beta_(-) c t^2 \/ 2$ and $B = t H + beta_(+) t^2 \/ 2 + 1$. For $n \/ V gt.eq 1$ the displayed expression is at most $- kappa n^2 \/ V + B n$. Choose $D gt.eq max \( 1 \, 2 B \/ kappa \)$. For $n > D V$ this is at most $- kappa n^2 \/ \( 2 V \) lt.eq - \( kappa D \/ 2 \) n$. Summing this geometric majorant proves the assertion with $a_0 = kappa D \/ 2$. ◻
]

#thm([Proposition 2.])[
  (Thermodynamic limits and duality).  #emph[For every member $phi$ of (2.2), including countably infinite sums, and every $beta > 0$, $d gt.eq 0$, the limit 
#[#set math.equation(numbering: n => "(2.12)")
 $ H_phi \( beta \, d \) = lim_(L arrow.r oo\
n \/ L^3 arrow.r d) H_(L \, n)^phi \( beta \) $ <f:canonical-limit>]

 exists along every such sequence of real sides and integer counts. It is finite, convex and continuous in $d in \[ 0 \, oo \)$, and concave in $beta > 0$ for each fixed $d$. The bounds (2.10) hold with $H_phi \( beta \, d \)$ and $d$ in place of their finite volume counterparts.]
  #emph[The grand partition function and pressure satisfy 
#[#set math.equation(numbering: n => "(2.13)")
 $ Xi_L^phi \( beta \, h \) = sum_(n gt.eq 0) upright(e)^(t h n) Z_(L \, n)^phi \( beta \) \, #h(2em) Q_phi \( beta \, h \) = lim_(L arrow.r oo) frac(log Xi_L^phi \( beta \, h \), t L^3) . $ <f:pressure-definition>]

 The pressure is finite, nonnegative, and jointly convex on $Omega$. For $beta > 0$, 
#[#set math.equation(numbering: n => "(2.14)")
 $ Q_phi \( beta \, h \) & = sup_(d gt.eq 0) { h d - H_phi \( beta \, d \) } \,\
H_phi \( beta \, d \) & = sup_(h in bb(R)) { h d - Q_phi \( beta \, h \) } \, #h(2em) d > 0 . $ <f:duality>]

 For fixed admissible $t$, pressures of the whole family are uniformly bounded on each compact subset of $Omega$.]
] <f:thermodynamics>

#proof[
  We first prove (2.12), without using a pressure limit or an approximation by finite-range potentials. At $d = 0$, both bounds in (2.10) tend to zero. Fix $d > 0$ and $beta > 0$. Let $H_(*)$ be the lower limit of $H_(L \, n)^phi \( beta \)$ as $L arrow.r oo$ and $n \/ L^3 arrow.r d$, and choose $s_j arrow.r oo$ and integers $n_j$ with
  $ n_j \/ s_j^3 arrow.r d \, #h(2em) H_(s_j \, n_j)^phi \( beta \) arrow.r H_(*) . $
  The finite volume bounds make $H_(*)$ finite. Consider any other sequence $L arrow.r oo$, $n \/ L^3 arrow.r d$. For each fixed, sufficiently large $j$, place $k = floor.l L \/ \( s_j + 2 \) floor.r^3$ cubes of side $s_j$ in $Lambda_L$, separated by gaps of width at least two. For any nonnegative integers $m_1 \, dots.h \, m_k$ summing to $n$, restriction to configurations with these box counts gives
  #[#set math.equation(numbering: n => "(2.15)")
   $ Z_(L \, n)^phi \( beta \) gt.eq product_(i = 1)^k Z_(s_j \, m_i)^phi \( beta \) . $ <f:canonical-product>]
  Indeed, interactions between different boxes are nonpositive. There are $n ! \/ product_i m_i !$ disjoint assignments of particle labels to the boxes, so the global factor $1 \/ n !$ leaves exactly the product of their factors $1 \/ m_i !$.
  We retain the favorable count $n_j$ in most boxes and correct the total particle number in the remaining boxes. Only a vanishing fraction of boxes will change, and (2.10) will bound their canonical costs uniformly. To make this exact for every target count, put
  $ q_j = floor.l \( 4 d + 4 \) s_j^3 floor.r \, #h(2em) c_d = min \( d \/ 2 \, 1 \) . $
  For all sufficiently large $j$, $n_j gt.eq c_d s_j^3$ and $q_j - n_j gt.eq c_d s_j^3$. Start with $n_j$ particles in every box. If $E = n - k n_j gt.eq 0$, fill boxes successively to $q_j$, with at most one last box given an intermediate integer count. If $E < 0$, empty boxes successively, again with at most one last intermediate count. This changes at most $r$ boxes, where
  #[#set math.equation(numbering: n => "(2.16)")
   $ r / k lt.eq 1 / c_d lr(|frac(n, k s_j^3) - n_j / s_j^3|) + 1 / k . $ <f:integer-adjustment>]
  For fixed large $j$ and then sufficiently large $L$, the target lies between $0$ and $k q_j$: its mean count divided by $s_j^3$ tends to $d \( 1 + 2 \/ s_j \)^3 < q_j \/ s_j^3$. Thus the adjustment never exhausts the available boxes. The quotient and remainder in division of $E$ by $q_j - n_j$, or of $- E$ by $n_j$, give the asserted integer counts.
  All counts used have density in $\[ 0 \, 4 d + 4 \]$. By (2.10), their normalized canonical costs have absolute value at most some $K < oo$, uniformly for large $j$. Taking logarithms in (2.15) consequently yields
  $ H_(L \, n)^phi \( beta \) lt.eq frac(k s_j^3, L^3) (H_(s_j \, n_j)^phi \( beta \) + 2 K r / k) . $
  First let $L arrow.r oo$ with $j$ fixed. The prefactor tends to $\( s_j \/ \( s_j + 2 \) \)^3$, and the upper limit of $r \/ k$ is at most
  $ c_d^(- 1) lr(|d \( 1 + 2 \/ s_j \)^3 - n_j \/ s_j^3|) . $
  Then let $j arrow.r oo$. This error tends to zero and the preceding upper bound tends to $H_(*)$. Every sequence has lower limit at least $H_(*)$ by its definition; thus every sequence has the same limit. This proves (2.12) with the required order of limits.
  For density convexity, fix $d_1 \, d_2 gt.eq 0$ and $theta in \[ 0 \, 1 \]$. Choose $s_j arrow.r oo$, integers $m_(r \, j)$ with $m_(r \, j) \/ s_j^3 arrow.r d_r$ for $r = 1 \, 2$, and integers $q_j arrow.r oo$. In a cube of side $q_j \( s_j + 2 \)$, use $q_j^3$ separated boxes of side $s_j$, assigning count $m_(1 \, j)$ to $floor.l theta q_j^3 floor.r$ of them and count $m_(2 \, j)$ to the rest. The total density tends to $theta d_1 + \( 1 - theta \) d_2$. The product inequality and the already proved all-sequence limit, applied directly to this diagonal sequence, give
  $ H_phi \( beta \, theta d_1 + \( 1 - theta \) d_2 \) lt.eq theta H_phi \( beta \, d_1 \) + \( 1 - theta \) H_phi \( beta \, d_2 \) . $
  This proof does not presuppose continuity in density. A finite convex function is continuous at positive densities: on any interior compact interval its secant slopes are bounded by secants to two exterior points. Continuity at zero follows from (2.10). Hölder’s inequality makes $log Z_(L \, n)^phi \( beta \)$ convex in $beta$. Passing to the canonical limit proves the stated concavity.
  The grand sums are finite by 4, with $zeta = 0$. Fix $\( beta \, h \)$. Choose $D$ there and write $V = L^3$. Above $D V$ the entire sum tends to zero. Among the remaining $floor.l D V floor.r + 1$ terms choose a maximizing count $n_L$; the maximum is at least one because it includes the vacuum. Therefore
  $ frac(log Xi_L^phi, t V) lt.eq h n_L / V - H_(L \, n_L)^phi \( beta \) + frac(log \( floor.l D V floor.r + 2 \), t V) $
  for all sufficiently large $L$. From any subsequence choose a further subsequence with $n_L \/ V arrow.r d in \[ 0 \, D \]$. The canonical limit bounds its upper limit by $h d - H_phi \( beta \, d \)$. Conversely, for every fixed $d gt.eq 0$ the single term $n = floor.l d V floor.r$ bounds the lower limit by $h d - H_phi \( beta \, d \)$. This proves existence of the pressure and the first duality in (2.14).
  The vacuum gives $Q_phi gt.eq 0$. The canonical lower bound and $d log d - d gt.eq - 1$ bound the first supremum in (2.14) by a finite quadratic maximum, uniformly over the family on any fixed parameter compact. Hölder’s inequality on the disjoint union of all configuration spaces makes each $log Xi_L^phi$ jointly convex in $\( beta \, h \)$; its pointwise limit has the same property.
  Finally fix $d > 0$. Convexity of the finite function $H_phi \( beta \, dot.op \)$ gives a supporting slope $h$ there. Explicitly, one may choose $h$ between
  $ sup_(0 lt.eq v < d) frac(H_phi \( beta \, d \) - H_phi \( beta \, v \), d - v) quad upright("and") quad inf_(v > d) frac(H_phi \( beta \, v \) - H_phi \( beta \, d \), v - d) . $
  The left endpoint is at most the right endpoint by convexity, and both are finite by comparison with secants through fixed points on either side of $d$. The resulting supporting inequality holds for all $v gt.eq 0$, so the first duality gives $Q_phi \( beta \, h \) = h d - H_phi \( beta \, d \)$. For all other $h$ the same first duality gives the opposite variational inequality. This proves the second equality in (2.14) without a differentiability or uniqueness assumption. ◻
]

== 3 Occupation bounds and perturbation estimates <f:local-section>

The next estimates turn the quadratic stability bound into uniform control of local particle numbers and changes of pressure. They play the role of the occupation bounds in the theory of superstable interactions #cite(label("Ruelle1970")). We prove them for the precise family of deletions and interpolations used in the range comparison.

From this section onward the occupation estimates are used with $t$ fixed. Their constants may depend on $t$ and on a compact set of $\( beta \, h \)$, but never on the number or sizes of the attraction ranges. The finite volume systems in (2.4) are included; in particular, deleting interactions between larger boxes will not require a new thermodynamic limit theorem.

If a bounded region meets $k$ small cells, its grand partition function has the exact decomposition

#[#set math.equation(numbering: n => "(3.1)")
 $ Xi^v \( beta \, h \) = sum_(n_1 \, dots.h \, n_k gt.eq 0) frac(upright(e)^(t h sum_i n_i), product_i n_i !) integral_(product_i C_i^(n_i)) exp \( - beta U^v \( X \) \) thin thin upright(d) X . $ <f:cell-measure>]

Indeed, the $N ! \/ product_i n_i !$ assignments of $N = sum_i n_i$ labels to disjoint cells cancel the global $1 \/ N !$. This identity also gives the conditional grand distribution within one cell after the outside configuration has been specified.

#thm([Proposition 3.])[
  (Uniform occupation moments).  #emph[Fix $t$ satisfying (2.7) and a compact $cal(D) subset Omega$. There are constants $C_exp \, C_1 < oo$, depending only on $t$ and $cal(D)$, such that every grand canonical measure for an interaction (2.4) satisfies 
#[#set math.equation(numbering: n => "(3.2)")
 $ sup_i bb(E) exp \( beta D_0 n_i^2 \/ 4 \) lt.eq C_exp \, #h(2em) sup_(i \, j) bb(E) \[ n_i n_j \] lt.eq C_1 #h(2em) \( \( beta \, h \) in cal(D) \) . $ <f:moment-estimates>]

 The bounds hold for every bounded region with finitely many cropped cells, and uniformly for all permitted deletions and interpolations.]
] <f:moments>

#proof[
  If the region meets no small cell, its grand measure is the vacuum and the assertion is immediate. Otherwise, let the number of cells be positive. Write $alpha = D_0 - M \/ 2$, $u_0 = beta D_0 \/ 4$, and enclose $cal(D)$ in $beta in \[ beta_(-) \, beta_(+) \]$, $lr(|h|) lt.eq H$. We first check, before taking any maximum, that $F_i := bb(E) exp \( u_0 n_i^2 \)$ is finite in each fixed volume. By (2.6), insertion of this exponential into (3.1) bounds its numerator by the product of $k$ one-variable series with exponents
  $ - beta \( alpha - D_0 \/ 4 \) n_i^2 - beta alpha sum_(j eq.not i) n_j^2 + \( t h + beta B_0 \) sum_j n_j . $
  Each spatial integral contributes at most $product_j \( b^3 \)^(n_j)$, with the factors $1 \/ n_j !$ already in (3.1). The quadratic coefficients are positive in magnitude because
  $ alpha - D_0 \/ 4 = 3 D_0 \/ 4 - M \/ 2 gt.eq 11 D_0 \/ 16 > 0 . $
  Thus all these series are finite, and the denominator $Xi^v$ is at least one. In particular, $F_max := max_i F_i < oo$. To bound this maximum independently of the number of cells, we shall prove
  $ F_max lt.eq C_2 F_max^(eta_0) \, #h(2em) eta_0 = 4 M^2 \/ D_0^2 lt.eq 1 \/ 16 < 1 \, $
  where $C_2$ depends only on $t$ and $cal(D)$. The ratio of attraction strength to core repulsion will therefore make the dependence on neighboring moments sublinear.
  Condition on the configuration $Y$ outside cell $i$. For $n$ particles inside that cell, the part of the energy involving at least one inside particle is bounded below by
  #[#set math.equation(numbering: n => "(3.3)")
   $ \( D_0 - J_(i i) \/ 2 \) n^2 - B_0 n - n G_i \( Y \) \, #h(2em) G_i \( Y \) = sum_(j eq.not i) J_(i j) n_j . $ <f:conditional-energy>]
  This uses the complete core estimate inside the cell, discards nonnegative core terms across cells, and bounds all attractions by their cell suprema. Dividing the conditional weights by the outside-only Boltzmann factor leaves a denominator containing the empty-cell term one. Hence the conditional exponential moment is at most its unnormalized numerator. The inequality
  $ n G_i lt.eq D_0 n^2 \/ 4 + G_i^2 \/ D_0 $
  and the factor $exp \( u_0 n^2 \)$ leave the quadratic coefficient $D_0 \/ 2 - J_(i i) \/ 2 gt.eq 7 D_0 \/ 16$. Consequently
  #[#set math.equation(numbering: n => "(3.4)")
   $ bb(E) \[ exp \( u_0 n_i^2 \) divides Y \] lt.eq C_2 exp \( beta G_i \( Y \)^2 \/ D_0 \) \, $ <f:conditional-moment>]
  where the finite constant
  $ C_2 = sum_(n gt.eq 0) frac(b^(3 n), n !) exp (- frac(7 beta_(-) D_0, 16) n^2 + \( t H + beta_(+) B_0 \) n) $
  depends only on $t$ and $cal(D)$ and is at least one.
  To close this estimate, Cauchy–Schwarz with the weights $J_(i j)$ and the row bound give
  $ G_i^2 lt.eq M sum_(j eq.not i) J_(i j) n_j^2 . $
  Set $theta_j = J_(i j) \/ M$ for $j eq.not i$ and $theta_diameter = 1 - sum_(j eq.not i) theta_j gt.eq 0$. With the exponent $eta_0$ chosen above, $beta G_i^2 \/ D_0 lt.eq eta_0 u_0 sum_(j eq.not i) theta_j n_j^2$. Apply convexity of the exponential with the additional zero argument of weight $theta_diameter$, and then the concavity of $x mapsto x^(eta_0)$, to obtain
  $ bb(E) exp \( beta G_i^2 \/ D_0 \) & lt.eq theta_diameter + sum_(j eq.not i) theta_j bb(E) exp \( eta_0 u_0 n_j^2 \)\
 & lt.eq theta_diameter + sum_(j eq.not i) theta_j F_j^(eta_0) lt.eq F_max^(eta_0) \, $
  where the last inequality uses $F_max gt.eq 1$. Taking expectations in (3.4) and then the maximum over cells yields $F_max lt.eq C_2 F_max^(eta_0)$, and therefore
  $ F_max lt.eq C_2^(1 \/ \( 1 - eta_0 \)) = : C_exp . $
  This bound is independent of the number of cells. Since $exp \( u_0 n_i^2 \) gt.eq u_0 n_i^2$ and $u_0 gt.eq beta_(-) D_0 \/ 4$, the second moments are uniformly bounded. Cauchy–Schwarz gives the mixed moment bound in (3.2).
  Cropping a cell only decreases its volume and the relevant suprema. Every deletion or interpolation allowed in (2.4) retains the full intra-cell core and the same row bound. All steps above therefore apply without change to those systems. ◻
]

#thm([Corollary 1.])[
  (Absolute perturbation bound).  #emph[In a fixed bounded region, let $v_theta = \( 1 - theta \) v_0 + theta v_1$, $0 lt.eq theta lt.eq 1$, be bounded symmetric pair interactions satisfying the hypotheses of 3 with the same $t$ and $M$. Let $J^(upright("diff"))$ be a symmetric nonnegative matrix such that 
$ lr(|v_1 \( x \, y \) - v_0 \( x \, y \)|) lt.eq J_(i j)^(upright("diff")) quad \( x in C_i \, med y in C_j \) . $

 Then, uniformly for $\( beta \, h \) in cal(D)$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ lr(|log Xi^(v_1) \( beta \, h \) - log Xi^(v_0) \( beta \, h \)|) lt.eq frac(beta C_1, 2) sum_(i \, j) J_(i j)^(upright("diff")) . $ <f:interpolation-bound>]

 Thus signed deletions are controlled by the absolute interaction difference, with no cancellation assumption.]
] <f:perturbation>

#proof[
  Differentiation in $theta$ is justified directly in finite volume. The empty region is immediate. Put $alpha = D_0 - M \/ 2 > 0$. If there are $k gt.eq 1$ cells and the region has volume $V$, the common energy bound gives $U^(v_theta) gt.eq alpha N^2 \/ k - B_0 N$, while boundedness of the pair difference gives $lr(|partial_theta U^(v_theta)|) lt.eq C N^2$. Uniformly in $theta$ and on $cal(D)$, the differentiated grand series is therefore dominated by a constant times
  #[#set math.equation(numbering: n => "(3.6)")
   $ sum_(N gt.eq 0) \( 1 + N^2 \) frac(V^N, N !) exp (- beta_(-) alpha N^2 \/ k + \( t H + beta_(+) B_0 \) N) < oo . $ <f:derivative-domination>]
  The volume and the constant in this domination are fixed only for the differentiation; the resulting estimate below is uniform in volume. Hence
  $ frac(thin upright(d), thin upright(d) theta) log Xi^(v_theta) = - beta bb(E)_theta partial_theta U^(v_theta) . $
  For every configuration,
  $ lr(|partial_theta U^(v_theta)|) lt.eq 1 / 2 sum_(i \, j) J_(i j)^(upright("diff")) n_i n_j \, $
  where the diagonal uses $n_i \( n_i - 1 \) lt.eq n_i^2$. Apply 3 and integrate over $theta in \[ 0 \, 1 \]$. ◻
]

#thm([Corollary 2.])[
  (Pressure control by attraction mass).  #emph[For a finite or countably infinite member of (2.2), let 
$ phi_k = psi_t - t sum_(j lt.eq k) alpha_j w_(R_j) \, #h(2em) m_k = sum_(j > k) alpha_j . $

 For every compact $cal(D) subset Omega$ there is a constant $C_(cal(D) \, t) < oo$, independent of the ranges, their number, and $k$, such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ 0 lt.eq Q_phi \( beta \, h \) - Q_(phi_k) \( beta \, h \) lt.eq C_(cal(D) \, t) m_k #h(2em) \( \( beta \, h \) in cal(D) \) . $ <f:tail-pressure-bound>]

 The same upper bound holds for the difference of normalized finite volume log grand partition functions in every cube of side $L gt.eq 1$.]
] <f:tail-pressure>

#proof[
  Interpolate the whole tail at once:
  $ phi_(k \, theta) = phi_k - theta t sum_(j > k) alpha_j w_(R_j) \, #h(2em) 0 lt.eq theta lt.eq 1 . $
  Even for infinitely many terms, the tail converges uniformly and is a bounded continuous pair interaction, of supremum norm at most $t ∥w∥_oo m_k$. Thus the derivative exists for each finite configuration and the domination (3.6) justifies differentiation directly, including the infinite endpoint. All intermediate attractions obey the original mass bound.
  By the proof of (2.3), the difference matrix can be chosen with
  $ sup_i sum_j J_(i j)^(upright("diff")) lt.eq c_b t m_k . $
  There are at most $216 L^3$ cells. Dividing (3.5) by $t L^3$ gives the claimed finite volume upper bound, for instance with $C_(cal(D) \, t) = 108 beta_(+) C_1 c_b$. Its lower bound follows because adding a nonnegative attraction decreases the energy.
  2 already supplies thermodynamic pressure limits for both endpoints, including the infinite sum. Passing to those limits proves (3.7); convergence of truncation pressures is a consequence, not an input, of this estimate. ◻
]

== 4 Ideal attraction and supporting slopes <k:section-transform>

An attraction spread over a very large region adds a quadratic density term to the variational formula for pressure. We first study that variational operation, retaining the full subdifferential at points where the pressure need not be differentiable. Throughout this section, $Q = Q_phi$ and $H = H_phi$ for a member of (2.2).

#prodef([Definition 1.])[
  (Ideal attraction).  For $a > 0$, define
  #[#set math.equation(numbering: n => "(4.1)")
   $ T_a Q \( beta \, h \) = sup_(u in bb(R)) {Q \( beta \, h + beta a u \) - frac(beta a, 2) u^2} . $ <k:transform>]
  An #emph[active shift] at $lambda = \( beta \, h \)$ is a value of $u$ attaining this supremum. Its shifted parameter is $x_u = \( beta \, h + beta a u \)$.
]

#thm([Proposition 4.])[
  (Attainment and uniform bounds).  #emph[Suppose the size conditions on $t$ in 1 hold, including $c t > 4 \( A + 1 \)$. For every $0 < a lt.eq 2 \( A + 1 \)$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ T_a Q \( beta \, h \) = max_(d gt.eq 0) {h d - H \( beta \, d \) + frac(beta a, 2) d^2} . $ <k:density-transform>]

 The active shifts in (4.1) are exactly the maximizing densities in (4.2); in particular, they are nonnegative and form a nonempty compact set. On each compact $cal(D) subset Omega$, they lie in a common interval $\[ 0 \, U \]$, independently of $phi$ and $a$. The constant $U$ may also be chosen uniformly for all sufficiently large $t$.]
  #emph[The function $T_a Q$ is finite and convex on $Omega$, and 
#[#set math.equation(numbering: n => "(4.3)")
 $ 0 lt.eq T_a Q - Q lt.eq C_(cal(D)) a #h(2em) upright("on ") cal(D) . $ <k:small-mass>]

 Here $C_(cal(D))$ can be chosen uniformly for sufficiently large $t$. For fixed $t$, the pressures $Q$ and transforms $T_a Q$ have common bounds on compact subsets of $Omega$, and common local Lipschitz bounds, uniformly over the same family and masses.]
] <k:transform-properties>

#proof[
  The pressure duality in 2 gives, for every $u in bb(R)$,
  #[#set math.equation(numbering: n => "(4.4)")
   $ Q \( beta \, h + beta a u \) - frac(beta a, 2) u^2 & = sup_(d gt.eq 0) {h d - H \( beta \, d \) + frac(beta a, 2) d^2 - frac(beta a, 2) \( u - d \)^2} . $ <k:square-completion>]
  Taking the supremum in $u$ proves (4.2) initially with a supremum. To prove attainment and uniformity, use the lower bound of 3 in the thermodynamic limit. Since $- d log d + d lt.eq 1$ for $d gt.eq 0$, its density objective is at most
  #[#set math.equation(numbering: n => "(4.5)")
   $ h d - H \( beta \, d \) + frac(beta a, 2) d^2 & lt.eq - beta (c t - a / 2) d^2 + (lr(||) h + frac(beta t, 2)) d + 1 / t\
 & lt.eq - frac(beta c t, 2) d^2 + (lr(||) h + frac(beta t, 2)) d + 1 / t . $ <k:coercivity>]
  This upper bound tends uniformly to $- oo$ as $d arrow.r oo$ on every parameter compact, whereas the objective at $d = 0$ is zero. Continuity of $H \( beta \, dot.op \)$, including at zero, proves attainment and a common bound on all maximizers. Dividing (4.5) by $beta t$ gives the upper bound
  $ - c / 2 d^2 + (frac(lr(||) h, beta t) + 1 / 2) d + frac(1, beta t^2) . $
  Its coefficients are uniformly bounded for $t gt.eq t_0 > 1$ and $lambda$ in a fixed compact. Thus the maximizing-density bound is also uniform in sufficiently large $t$.
  If $d$ maximizes (4.2), setting $u = d$ in (4.4) makes $u$ active. Conversely, fix an active $u$. The density supremum defining $Q \( beta \, h + beta a u \)$ is attained: its fixed shifted field and the canonical quadratic bound give coercivity. For an attaining density $d$, (4.4) can equal $T_a Q \( beta \, h \)$ only if $d$ maximizes (4.2) and $\( u - d \)^2 = 0$. This proves the claimed exact identity of maximizing sets and also attainment in (4.1).
  For fixed $u$, the branch
  $ F_u \( beta \, h \) = Q \( beta \, h + beta a u \) - beta a u^2 \/ 2 $
  is convex: its parameter map is invertible and linear, and its last term is linear. The supremum of these branches is convex and is finite by (4.5). If $d$ is a maximizing density, pressure duality and the nonnegativity of the added quadratic give
  $ Q \( beta \, h \) lt.eq T_a Q \( beta \, h \) lt.eq Q \( beta \, h \) + frac(beta a, 2) d^2 . $
  This proves (4.3), with $C_(cal(D)) = 1 / 2 sup_(cal(D)) beta thin U^2$. The canonical bound and pressure duality bound $Q$ uniformly on every compact at fixed $t$; (4.3) does the same for $T_a Q$. Convexity then gives the asserted local Lipschitz bounds. ◻
]

We recall the elementary convex facts used below. For a finite convex function $F$ on $Omega$, write

$ partial F \( lambda \) = { v in bb(R)^2 : F \( y \) gt.eq F \( lambda \) + ⟨v \, y - lambda⟩ upright(" for all ") y in Omega } . $

Such a function is continuous and locally Lipschitz. Indeed, convexity first bounds it above on a simplex by its values at the vertices; reflection about an interior point supplies a lower bound on a smaller neighborhood, and one-dimensional secant inequalities give a Lipschitz bound on a still smaller neighborhood. The directional derivative

$ F' \( lambda \; z \) = lim_(r arrow.b 0) frac(F \( lambda + r z \) - F \( lambda \), r) $

is finite and sublinear in $z$. A linear functional dominated by it exists by linear separation (equivalently, the finite-dimensional Hahn–Banach theorem). The secant inequalities show that its vector is a member of $partial F \( lambda \)$. Thus this set is nonempty. It is convex and closed by its defining inequalities, and locally bounded by the local Lipschitz bound, hence compact. Those same inequalities and continuity show that its graph is closed. In particular, uniform bounds for convex functions on a larger compact neighborhood give uniform bounds for all their supporting slopes on a smaller compact neighborhood. We write a pressure support as $\( e \, d \)$, with coordinates dual to $\( beta \, h \)$: $d$ is the density coordinate and $e$ the inverse-temperature slope coordinate.

#thm([Lemma 5.])[
  (Parabolic bound at an active point).  #emph[Let $a > 0$ be as in 4, and let $u$ be active at $lambda = \( beta \, h \)$. Then for every $r in bb(R)$, 
#[#set math.equation(numbering: n => "(4.6)")
 $ Q \( x_u + \( 0 \, r \) \) lt.eq Q \( x_u \) + u r + frac(r^2, 2 beta a) . $ <k:parabola>]

 Every member of $partial Q \( x_u \)$ has second coordinate $u$.]
] <k:active-parabola>

#proof[
  Compare the active shift $u$ with $u + r \/ \( beta a \)$ in (4.1). Expanding the two quadratic penalties proves (4.6). If $\( e \, d \) in partial Q \( x_u \)$, the supporting inequality gives
  $ d r lt.eq Q \( x_u + \( 0 \, r \) \) - Q \( x_u \) lt.eq u r + frac(r^2, 2 beta a) . $
  Divide separately for $r > 0$ and $r < 0$ and let $r arrow.r 0$ to obtain $d = u$. ◻
]

The subdifferential of a supremum of convex functions is governed by its active branches. General forms of this principle appear in #cite(label("HantouteLopezZalinescu2008"), form: "prose") p. 864. Here the compactness of active shifts and the parabolic bound give the following exact formula; we prove both inclusions for this setting, including nonsmooth pressures.

#thm([Proposition 5.])[
  (Exact subdifferential formula).  #emph[For each fixed $0 < a lt.eq 2 \( A + 1 \)$ and $lambda = \( beta \, h \) in Omega$, 
#[#set math.equation(numbering: n => "(4.7)")
 $ partial \( T_a Q \) \( lambda \) = "conv" #h(-0.16667em) union.big_(u upright(" active at ") lambda) {(e + a / 2 u^2 \, u) : \( e \, u \) in partial Q \( x_u \)} . $ <k:support-hull>]

 The union on the right is compact, and every one of its members is an actual supporting slope of $T_a Q$ at $lambda$.]
] <k:subdifferential>

#proof[
  For fixed $u$, put $L_u \( beta \, h \) = \( beta \, h + beta a u \)$. The defining support inequalities, applied to $L_u$ and its inverse, give the exact formula
  $ partial F_u \( lambda \) = {\( e + a u d - a u^2 \/ 2 \, d \) : \( e \, d \) in partial Q \( L_u lambda \)} . $
  If $u$ is active, 5 sets $d = u$, giving the generators in (4.7). Since $F_u lt.eq T_a Q$ everywhere and $F_u \( lambda \) = T_a Q \( lambda \)$, each such generator supports $T_a Q$. The convex hull of the displayed union is therefore contained in the left side.
  Denote that union by $G \( lambda \)$. The active set is bounded by 4 and closed by continuity of $F_u \( lambda \)$ in $u$, so it is compact. Its shifted points form a compact subset of $Omega$. The boundedness and closed graph of $partial Q$ on this set show that $G \( lambda \)$ is compact. Its convex hull is compact as well: in $bb(R)^2$, each point of a convex hull is a convex combination of at most three points, by eliminating affine dependencies from any larger finite combination.
  For the reverse inclusion, fix $v_0 in partial \( T_a Q \) \( lambda \)$ and a direction $z in bb(R)^2$. For small $r > 0$, let $lambda_r = lambda + r z$, choose an active shift $u_r$ there, and choose $v_r in partial F_(u_r) \( lambda_r \)$. The branch support at the endpoint gives
  #[#set math.equation(numbering: n => "(4.8)")
   $ ⟨v_0 \, z⟩ lt.eq frac(T_a Q \( lambda_r \) - T_a Q \( lambda \), r) lt.eq frac(F_(u_r) \( lambda_r \) - F_(u_r) \( lambda \), r) lt.eq ⟨v_r \, z⟩ . $ <k:endpoint-support>]
  All $u_r$ are uniformly bounded near $lambda$; their shifted points stay in one compact subset of $Omega$, and the underlying subgradients of $Q$ are bounded there. Along a sequence $r arrow.b 0$, pass to convergent subsequences of $u_r$ and these subgradients. Continuity of $Q$ and $T_a Q$ makes the limiting shift active at $lambda$, and the closed subgradient graph makes the limiting $v_r$ a member of $G \( lambda \)$. Thus (4.8) implies
  $ ⟨v_0 \, z⟩ lt.eq max_(v in G \( lambda \)) ⟨v \, z⟩ . $
  This holds in every direction. Separation from the compact convex set $"conv" G \( lambda \)$ proves $v_0 in "conv" G \( lambda \)$. ◻
]

All compactness arguments in 5 concern a fixed positive $a$. The bounds needed when $a$ decreases to zero are supplied separately by 4: active shifts, shifted parameter compacts, and local Lipschitz constants are uniform. At $a = 0$ the shift representation would have every $u in bb(R)$ active; no compactness assertion for that degenerate representation is needed.

== 5 A uniform quantitative range estimate <k:section-range>

We now compare the ideal transform with a physical attraction of finite range. The estimate is uniform over all preceding attraction ranges and over arbitrarily small positive added masses. This uniformity will allow the error and the next mass to be chosen by a single explicit schedule. The quadratic density term is the one underlying the Lebowitz–Penrose limit #cite(label("LebowitzPenrose1966")) #cite(label("GerardiEtAl1973")); our purpose here is a quantitative estimate with constants uniform across the complete reference family.

#thm([Theorem 5.1.])[
  (Quantitative approximation by a long-range attraction).  #emph[Fix an admissible $t$ and a compact set $cal(D) subset Omega$. There are constants $C_(cal(D) \, t) < oo$ and $K_(cal(D) \, t) < oo$ with the following property. Let $R_0 gt.eq 2$, and let 
$ phi_0 = psi_t - t sum_j alpha_j w_(R_j) \, #h(2em) 1 lt.eq R_j lt.eq R_0 \, #h(2em) alpha_j gt.eq 0 \, $

 where the sum may be empty, finite, or countably infinite. If $a > 0$, $sum_j alpha_j + a lt.eq A + 1$, and $R \/ R_0 gt.eq K_(cal(D) \, t)$, then 
#[#set math.equation(numbering: n => "(5.1)")
 $ sup_(lambda in cal(D)) lr(|Q_(phi_0 - t a w_R) \( lambda \) - T_a Q_(phi_0) \( lambda \)|) lt.eq C_(cal(D) \, t) sqrt(R_0 / R) . $ <k:range-estimate>]

 Both constants are independent of $R_0$, the number and values of the reference ranges, the reference masses, and the positive mass $a$.]
] <k:range>

Use boxes of an intermediate side $s$, with $R_0 lt.eq s lt.eq R$. Deleting the reference interaction between different boxes costs $O \( R_0 \/ s \)$ in pressure. The suprema and infima of the new kernel on pairs of boxes have row sums which, after multiplication by $s^3$, approximate its unit integral within $O \( s \/ R \)$. Density bounds will give pressure errors of the same order. The suprema will give a product upper bound; the infima will give a lower bound from independent reference ensembles in the boxes. Balancing these two errors explains the choice $s asymp sqrt(R_0 R)$. We begin with the deletion estimate, which must include both the positive and negative parts of the reference interaction.

#thm([Lemma 6.])[
  (Grand pressure in a finite box).  #emph[Let $phi_0$ and $R_0$ be as in 2, allowing $sum_j alpha_j lt.eq A + 1$. Write 
$ Q_(phi_0)^s \( lambda \) = frac(1, t s^3) log Xi_s^(phi_0) \( lambda \) . $

 For every compact $cal(K) subset Omega$ and every $s gt.eq R_0$ with $s \/ b in bb(N)$, 
#[#set math.equation(numbering: n => "(5.2)")
 $ sup_(lambda in cal(K)) lr(|Q_(phi_0)^s \( lambda \) - Q_(phi_0) \( lambda \)|) lt.eq C_(cal(K) \, t) R_0 / s . $ <k:box-pressure-bound>]

 More generally, for the same $s$, partition $Lambda_(m s)$ into $m^3$ boxes of side $s$, aligned with the small-cell grid. In the potential $phi_0 - t a w_R$, where $a gt.eq 0$, $R gt.eq 1$, and $sum_j alpha_j + a lt.eq A + 1$, delete only reference interactions between distinct boxes. If $Xi_(m s)^(upright("del"))$ is the resulting grand partition function, then 
#[#set math.equation(numbering: n => "(5.3)")
 $ sup_(lambda in cal(K)) frac(lr(|log Xi_(m s)^(phi_0 - t a w_R) \( lambda \) - log Xi_(m s)^(upright("del")) \( lambda \)|), t \( m s \)^3) lt.eq C_(cal(K) \, t) R_0 / s . $ <k:deletion>]

 The constants have the uniformity asserted in 2 and are also independent of $m \, s \, R$.]
] <k:box-pressure>

#proof[
  Put $S_0 = t sum_j alpha_j w_(R_j)$ and $S_(upright("new")) = t a w_R$. The series for $S_0$ converges uniformly, is supported in the ball of radius $R_0$, and has the row bound (2.3), including when there are countably many reference terms. Multiply the reference interaction on pairs belonging to distinct large boxes by a parameter $theta in \[ 0 \, 1 \]$. Every intermediate interaction retains all intra-small-cell core terms, and its attractive part is bounded by $S_0 + S_(upright("new"))$. This has small-cell row sum at most $M$. Therefore Proposition 3, Corollary 1 apply throughout this interpolation, whether or not the intermediate interaction is translation invariant.
  The absolute difference is bounded on every pair by
  $ \( psi_t + S_0 \) \( x - y \) bold(1) { x \, y upright(" belong to distinct large boxes") } . $
  Its row sum over small cells is at most $C_b t^2 + c_b t \( A + 1 \)$: the core is bounded by $t^2$ and supported within distance two, and the attraction has the common row bound already proved. This estimate uses an absolute majorant and thus remains valid when $phi_0$ changes sign on a pair of cells.
  A nonzero difference row must belong to a small cell within distance $R_0 + sqrt(3) b$ of the boundary of its large box. Since $R_0 gt.eq 2$ and $s gt.eq R_0$, there are at most $C_b s^2 R_0$ such small cells per large box. The bound follows either by subtracting the volume of the inner cube when the strip is thin, or from $s^3 lt.eq C s^2 R_0$ when the strip fills a fixed fraction of the box. Thus the sum of all difference majorants is at most
  $ C_b m^3 s^2 R_0 #scale(x: 120%, y: 120%)[\(] C_b t^2 + c_b t \( A + 1 \) #scale(x: 120%, y: 120%)[\)] . $
  The finite-volume interpolation bound of 1, divided by $t \( m s \)^3$, proves (5.3).
  For $a = 0$ the deleted system consists of independent reference boxes, and its grand partition function is exactly
  #[#set math.equation(numbering: n => "(5.4)")
   $ Xi_(m s)^(upright("del")) = #scale(x: 120%, y: 120%)[\(] Xi_s^(phi_0) #scale(x: 120%, y: 120%)[\)]^(m^3) . $ <k:factorization>]
  For completeness, with prescribed box counts $\( n_z \)$ of total $N$, the $N ! \/ product_z n_z !$ assignments of labels to boxes cancel the global $1 \/ N !$ and leave $product_z 1 \/ n_z !$. Summing the nonnegative product integrals over all $\( n_z \)$ gives (5.4), including the zero-count terms. Its normalized logarithm equals $Q_(phi_0)^s$ for every $m$. Letting $m arrow.r oo$ in (5.3) and using only the pressure limit of the full reference proves (5.2). ◻
]

The next estimate uses the global $C^1$ bound of $w$. Radial monotonicity and strict positivity on its support are not required.

#thm([Lemma 7.])[
  (Upper and lower kernel row sums).  #emph[Let $B_z$ be the box of side $s$ centered at $z$, where $z$ ranges over a translated lattice $s bb(Z)^3$, and suppose $0 < s lt.eq R$. Define 
$ K_(z z')^(+) = sup_(x in B_z \, thin y in B_(z')) w_R \( x - y \) \, #h(2em) K_(z z')^(-) = inf_(x in B_z \, thin y in B_(z')) w_R \( x - y \) . $

 There is a constant $C_w$ depending only on $w$ and dimension such that, with $eta = C_w s \/ R$, every finite cubical collection of these boxes satisfies 
#[#set math.equation(numbering: n => "(5.5)")
 $ s^3 sum_(z') K_(z z')^(+) lt.eq 1 + eta . $ <k:upper-row>]

 If $z$ has distance greater than $R + 4 s$ from the boundary of the finite collection, then 
#[#set math.equation(numbering: n => "(5.6)")
 $ s^3 sum_(z' eq.not z) K_(z z')^(-) gt.eq 1 - eta . $ <k:lower-row>]

 Both matrices are symmetric and nonnegative.]
] <k:kernel-rows>

#proof[
  Symmetry follows from $w_R \( x - y \) = w_R \( y - x \)$. Let $G = ∥nabla w∥_oo$, so $"Lip" \( w_R \) lt.eq G R^(- 4)$. For a fixed $y in B_(z')$, each displacement $x - y'$ with $x in B_z$, $y' in B_(z')$ differs from $z - y$ by at most $3 s$. Consequently
  $ lr(|K_(z z')^plus.minus - w_R \( z - y \)|) lt.eq 3 G s R^(- 4) . $
  On the infinite grid, at most $C \( R \/ s \)^3$ second boxes can have either term nonzero: all others lie outside the support enlarged by a distance $3 s$. Integrating over $y in B_(z')$ and summing thus gives
  $ lr(|s^3 sum_(z') K_(z z')^plus.minus - integral_(bb(R)^3) w_R \( z - y \) thin upright(d) y|) lt.eq C s^3 \( R \/ s \)^3 s R^(- 4) = C s / R . $
  The integral is one. This comparison includes boxes meeting internal zero regions of $w$ or crossing its support boundary, because the same global Lipschitz estimate applies there.
  Restricting the upper sum to a finite collection only decreases it. For a center with the stated boundary distance, all potentially contributing second boxes are still present in the lower sum. Omitting $z' = z$ loses at most $s^3 K_(z z)^(-) lt.eq ∥∥ w_oo \( s \/ R \)^3$, which is bounded by $∥∥ w_oo s \/ R$. Increasing the one constant $C_w$ proves both claims. ◻
]

#proof[
  We first bound the particle counts needed for the upper estimate. For $\( beta \, h \) in cal(D)$, $s gt.eq 1$, $V = s^3$, and $n gt.eq 0$, put
  $ B_n = upright(e)^(t h n) Z_(s \, n)^(phi_0) \( beta \) exp #h(-0.16667em) (frac(beta t a \( 1 + eta \), 2 V) n^2) \, #h(2em) 0 lt.eq eta lt.eq 1 . $
  The reference $phi_0$ belongs to (2.2), and the auxiliary quadratic coefficient satisfies $a \( 1 + eta \) lt.eq 2 \( A + 1 \)$. Apply 4 on $cal(D)$ with $zeta = a \( 1 + eta \)$. It supplies a common cutoff $D_(upright("cut")) gt.eq 1$ and, after increasing a volume threshold $V_0 gt.eq 1$, the bound
  #[#set math.equation(numbering: n => "(5.7)")
   $ sum_(n > D_(upright("cut")) V) B_n lt.eq 1 #h(2em) \( V gt.eq V_0 \) . $ <k:grand-tail>]
  Both $D_(upright("cut"))$ and $V_0$ depend only on $cal(D) \, t$. They are fixed before any local occupation constants: the tail lemma uses only the canonical quadratic bound, even with this auxiliary weight.
  Let $U$ be the common active-shift bound on $cal(D)$ from 4. Choose one compact rectangle $cal(D)' subset Omega$ containing $cal(D)$ and every point
  #[#set math.equation(numbering: n => "(5.8)")
   $ \( beta \, h + beta a v \) \, #h(2em) \( beta \, h \) in cal(D) \, quad 0 lt.eq a lt.eq A + 1 \, quad 0 lt.eq v lt.eq max { U \, D_(upright("cut")) } . $ <k:shifted-compact>]
  Only now fix the moment and deletion constants of Proposition 3, Lemma 6 on $cal(D)'$. All these constants are independent of the eventual box side and of the reference.
  Put $q = R \/ R_0$ and choose
  #[#set math.equation(numbering: n => "(5.9)")
   $ s = b ⌊sqrt(R_0 R) / b⌋ . $ <k:box-side>]
  A single lower bound on $q$, uniform for $R_0 gt.eq 2$, ensures
  #[#set math.equation(numbering: n => "(5.10)")
   $ R_0 lt.eq s lt.eq R \, #h(2em) 1 / 2 R_0 sqrt(q) lt.eq s lt.eq R_0 sqrt(q) \, #h(2em) s^3 gt.eq V_0 \, #h(2em) eta = C_w s / R lt.eq 1 . $ <k:ratio-conditions>]
  Partition $Lambda_L$, $L = m s$, into $m^3$ boxes $B_z$, and delete reference interactions between different boxes as in 6. The new attraction remains intact. All limits in $m$ below hold with $s \, R \, R_0$, the reference, and the parameters fixed.
  #emph[Upper bound.] Let $N_z$ be the particle count in $B_z$, and write $W_R = sum_(i < j) w_R \( x_i - x_j \)$. Adding nonnegative diagonal self terms, then using symmetry and $2 N_z N_(z') lt.eq N_z^2 + N_(z')^2$, gives
  $ W_R & lt.eq 1 / 2 sum_(z \, z') K_(z z')^(+) N_z N_(z') lt.eq 1 / 2 sum_z N_z^2 sum_(z') K_(z z')^(+) lt.eq frac(1 + eta, 2 s^3) sum_z N_z^2 . $
  Splitting labels among boxes as in (5.4), we obtain
  #[#set math.equation(numbering: n => "(5.11)")
   $ Xi_L^(upright("del")) \( beta \, h \) lt.eq [sum_(n gt.eq 0) upright(e)^(t h n) Z_(s \, n)^(phi_0) \( beta \) exp #h(-0.16667em) (frac(beta t a \( 1 + eta \), 2 s^3) n^2)]^(m^3) . $ <k:upper-product>]
  For $0 lt.eq n lt.eq D_(upright("cut")) s^3$, let $d = n \/ s^3$. The canonical term at count $n$ is one of the nonnegative terms in the reference grand sum at the shifted field $h + beta a d$. Therefore
  $ frac(1, t s^3) log B_n & lt.eq Q_(phi_0)^s \( beta \, h + beta a d \) - frac(beta a, 2) d^2 + frac(beta a eta, 2) d^2\
 & lt.eq Q_(phi_0) \( beta \, h + beta a d \) - frac(beta a, 2) d^2 + C_(cal(D) \, t) (R_0 / s + eta)\
 & lt.eq T_a Q_(phi_0) \( beta \, h \) + C_(cal(D) \, t) (R_0 / s + eta) . $
  All shifted parameters lie in $cal(D)'$ by (5.8), so the finite-box comparison applies; the bound $d lt.eq D_(upright("cut"))$ controls the extra quadratic. The argument includes $n = 0$, whose term equals one. There are $floor.l D_(upright("cut")) s^3 floor.r + 1$ such counts; the remaining terms have total at most one by (5.7). Since $T_a Q_(phi_0) gt.eq 0$, taking logarithms in (5.11) yields
  #[#set math.equation(numbering: n => "(5.12)")
   $ frac(1, t L^3) log Xi_L^(upright("del")) lt.eq T_a Q_(phi_0) + C_(cal(D) \, t) (R_0 / s + eta) + frac(log \( floor.l D_(upright("cut")) s^3 floor.r + 2 \), t s^3) . $ <k:upper-final>]
  Combine this with (5.3) and let $m arrow.r oo$ in the full physical pressure. This proves the desired upper estimate with the three displayed errors.
  #emph[Lower bound.] Fix an active shift $u in \[ 0 \, U \]$ for $T_a Q_(phi_0) \( beta \, h \)$. Let $Pi$ be the product of the $m^3$ reference grand measures in the boxes, all at $\( beta \, h + beta a u \)$, and put
  $ d_s = s^(- 3) bb(E)_Pi N_z . $
  The common small-cell moment bound on $cal(D)'$ gives a uniform bound $d_s lt.eq C_(cal(D) \, t)$. Indeed each box consists of exactly $\( s \/ b \)^3$ small cells, and Cauchy–Schwarz bounds each mean count by the square root of its uniformly bounded second moment.
  The change of field and insertion of the new attraction give the exact identity
  #[#set math.equation(numbering: n => "(5.13)")
   $ Xi_L^(upright("del")) \( beta \, h \) = #scale(x: 120%, y: 120%)[\[] Xi_s^(phi_0) \( beta \, h + beta a u \) #scale(x: 120%, y: 120%)[\]]^(m^3) bb(E)_Pi exp { beta t a \( W_R - u N \) } \, $ <k:jensen-identity>]
  where $N = sum_z N_z$. The box factorials in $Pi$ are precisely those obtained by splitting the full grand measure among boxes. All terms are finite by the common quadratic stability bound. Jensen’s inequality therefore gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ frac(1, t L^3) log Xi_L^(upright("del")) gt.eq Q_(phi_0)^s \( beta \, h + beta a u \) - beta a u d_s + frac(beta a, L^3) bb(E)_Pi W_R . $ <k:jensen-lower>]
  Discard the nonnegative contributions to $W_R$ from pairs in one box. For the remaining pairs the kernel infima give
  $ W_R gt.eq 1 / 2 sum_(z eq.not z') K_(z z')^(-) N_z N_(z') . $
  Entire distinct boxes are independent under $Pi$, so for $z eq.not z'$, $bb(E)_Pi \[ N_z N_(z') \] = s^6 d_s^2$. No independence inside a box is used. Let $m_(upright("int"))$ be the number of centers with distance greater than $R + 4 s$ from the outer boundary. Nonnegativity of the other rows and 7 imply
  $ 1 / L^3 bb(E)_Pi W_R gt.eq m_(upright("int")) / m^3 thin frac(1 - eta, 2) d_s^2 . $
  For fixed $s \, R$, $m_(upright("int")) \/ m^3 arrow.r 1$ as $m arrow.r oo$. Consequently (5.14) and (5.3), using the known limit of the full physical model, show that
  $ Q_(phi_0 - t a w_R) \( beta \, h \) & gt.eq Q_(phi_0)^s \( beta \, h + beta a u \) + beta a (- u d_s + frac(1 - eta, 2) d_s^2) - C_(cal(D) \, t) R_0 / s . $
  The exact square identity
  #[#set math.equation(numbering: n => "(5.15)")
   $ - u d_s + frac(1 - eta, 2) d_s^2 = - u^2 / 2 + frac(\( d_s - u \)^2, 2) - eta / 2 d_s^2 gt.eq - u^2 / 2 - C_(cal(D) \, t) eta $ <k:mean-square>]
  and (5.2) at the shifted parameter now give
  #[#set math.equation(numbering: n => "(5.16)")
   $ Q_(phi_0 - t a w_R) \( beta \, h \) & gt.eq Q_(phi_0) \( beta \, h + beta a u \) - frac(beta a, 2) u^2 - C_(cal(D) \, t) (R_0 / s + eta)\
 & = T_a Q_(phi_0) \( beta \, h \) - C_(cal(D) \, t) (R_0 / s + eta) . $ <k:lower-final>]
  In particular no convergence of $d_s$ to $u$, or convergence of $d_s$ at all, is required. This proves the same bound at reference coexistence parameters.
  Finally, (5.10) gives $R_0 \/ s lt.eq 2 q^(- 1 \/ 2)$ and $s \/ R lt.eq q^(- 1 \/ 2)$. For $s gt.eq 1$,
  $ frac(log \( floor.l D_(upright("cut")) s^3 floor.r + 2 \), t s^3) lt.eq C_(cal(D) \, t) / s lt.eq C_(cal(D) \, t) q^(- 1 \/ 2) \, $
  where the last step uses $R_0 gt.eq 2$ and $s gt.eq 1 / 2 R_0 sqrt(q)$. Equations (5.12) and (5.16), with the deletion cost, prove (5.1).
  No step imposes a positive lower bound on $a$, and no error has been divided by $a$. Only the reference and full physical models require thermodynamic limits; the deleted systems were treated by exact factorization or finite-volume inequalities. ◻
]

== 6 An initial triple of pressure slopes <i:section>

The narrow zero-energy shell in the core permits clusters of four particles, with relative volume of order $l_t^9 = upright(e)^(- 9 t)$. This entropy cost, together with the packing density $p$, produces three competing branches after the first ideal attraction. We show that, for one sufficiently large finite $t$, the pressure subdifferential throughout a parameter neighborhood is generated by actual supports near the three limiting slopes. The subsequent iteration will preserve this separation and find a parameter where all three groups are present.

In this section alone we let $t$ tend to infinity to obtain the required estimates; we fix its finite value at the end.

=== 6.1 Clusters and the bare-core pressure <clusters-and-the-bare-core-pressure>

#thm([Proposition 6.])[
  (Pressure of the bare core).  #emph[Let $q^(\( t \)) = Q_(psi_t)$, with the pressure normalization and the core of Proposition 2, (2.1). Then, locally uniformly on $Omega = \( 0 \, oo \) times bb(R)$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ q^(\( t \)) \( beta \, h \) arrow.r q_(*) \( beta \, h \) := max { 0 \, p h \, 4 p h - 9 p } . $ <i:bare-limit>]

]
] <i:bare-pressure>

#proof[
  Fix a compact parameter set $K subset Omega$, and choose $beta_(-) > 0$ and $H < oo$ such that $beta gt.eq beta_(-)$ and $lr(|h|) lt.eq H$ on $K$. Throughout the proof $V = L^3$, and $I_t = \[ l_t \, \( 1 + Delta \) l_t \]$.
  #emph[Free configurations and the upper bound.] Call a pair bad when its distance is less than one and is not in $I_t$. A configuration is free if it has no bad pair. In a free configuration, join distinct particles whose distance is less than one. Every edge then has length at most $\( 1 + Delta \) l_t$. The endpoints of a path of two edges are therefore at distance at most $2 \( 1 + Delta \) l_t < 1$, and hence are joined. Each connected component is consequently a clique with all pair distances in $I_t$. By 2, its size is at most four. Choosing one representative from every component gives a set with pairwise distances at least one, so the component count is at most $M_L$.
  Consider the grand integral over free configurations with their energy discarded:
  $ Xi_(L \, upright("free")) \( h \) = sum_(n gt.eq 0) frac(upright(e)^(t h n), n !) integral_(Lambda_L^n) upright(bold(1))_(upright("free")) \( x_1 \, dots.h \, x_n \) thin upright(d) x_1 dots.h.c thin upright(d) x_n . $
  For an ordered list of component sizes $m_1 \, dots.h \, m_k$, with $m_i in { 1 \, 2 \, 3 \, 4 }$ and $sum_i m_i = n$, the number of ordered partitions of the particle labels into these blocks is $n ! \/ product_i m_i !$. On summing over all ordered size lists, division by $k !$ counts each unordered family of label blocks once. This remains true when sizes repeat: the label blocks themselves are distinct and have exactly $k !$ orderings.
  In a block of size $m$, choose its least label as the root. Its position has volume at most $V$, and each of the other $m - 1$ particles lies in a ball of volume $C l_t^3$ about it, where $C = 4 pi \( 1 + Delta \)^3 \/ 3$. After cancellation of the global factor $1 \/ n !$, the block therefore contributes at most $V \( C l_t^3 \)^(m - 1) \/ m !$. Discarding all further restrictions within and between components and summing their sizes gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ Xi_(L \, upright("free")) \( h \) lt.eq sum_(k = 0)^(M_L) frac(\( V Theta_t \( h \) \)^k, k !) \, #h(2em) Theta_t \( h \) = sum_(m = 1)^4 frac(upright(e)^(t h m) \( C l_t^3 \)^(m - 1), m !) . $ <i:rooted-count>]
  To pass from free configurations to all configurations, let $B \( X \)$ be the set of labels incident to a bad pair. There are at least $lr(|B \( X \)|) \/ 2$ bad pairs, and each has core energy exactly $t^2$. All other core terms are nonnegative, and $X \\ B \( X \)$ is free. Thus the following pointwise bound holds:
  #[#set math.equation(numbering: n => "(6.3)")
   $ upright(e)^(- beta U^(psi_t) \( X \)) lt.eq sum_(J subset { 1 \, dots.h \, n }) upright(e)^(- beta t^2 lr(|J|) \/ 2) upright(bold(1))_(upright("free")) \( X \\ J \) . $ <i:removal-pointwise>]
  Indeed, the summand $J = B \( X \)$ already bounds the left side. For $r = lr(|J|)$ and $m = n - r$, the label factor is $binom(m + r, r) \/ \( m + r \) ! = 1 \/ \( r ! m ! \)$. The removed positions integrate to $V^r$. Tonelli’s theorem and the grand sum now give the exact factorization of the upper bound
  #[#set math.equation(numbering: n => "(6.4)")
   $ Xi_L^(psi_t) \( beta \, h \) lt.eq exp #h(-0.16667em) (V upright(e)^(t h - beta t^2 \/ 2)) Xi_(L \, upright("free")) \( h \) . $ <i:removal-factor>]
  Shell endpoints are included in $I_t$, although their energy may be positive. Pairs at distance exactly one are not edges of the component graph. Both conventions merely discard nonnegative energy in the upper bound, so these arguments hold pointwise, including at the endpoints.
  Set $a_t \( h \) = t^(- 1) log Theta_t \( h \)$. The four exponential rates in $Theta_t$ are
  $ h \, #h(2em) 2 h - 3 \, #h(2em) 3 h - 6 \, #h(2em) 4 h - 9 . $
  The middle two are convex combinations of the first and last. Their positive prefactors in (6.2) are fixed, so
  #[#set math.equation(numbering: n => "(6.5)")
   $ a_t \( h \) = max { h \, 4 h - 9 } + O \( t^(- 1) \) \, $ <i:cluster-rates>]
  uniformly for $lr(|h|) lt.eq H$. For $k gt.eq 1$, the inequality $k ! gt.eq \( k \/ upright(e) \)^k$, with $x = k \/ V$, gives
  $ frac(1, t V) log frac(\( V Theta_t \)^k, k !) lt.eq x a_t \( h \) + frac(x \( 1 - log x \), t) lt.eq M_L / V max { 0 \, a_t \( h \) } + 1 / t \, $
  since $x \( 1 - log x \) lt.eq 1$ for $x > 0$. The same final bound covers $k = 0$. There are only $M_L + 1 = O \( 1 + V \)$ terms in (6.2). First letting $L arrow.r oo$, with $t$ fixed, and using Lemma 1, Proposition 2, we obtain
  #[#set math.equation(numbering: n => "(6.6)")
   $ q^(\( t \)) \( beta \, h \) lt.eq p max { 0 \, a_t \( h \) } + 1 / t + 1 / t upright(e)^(t h - beta t^2 \/ 2) . $ <i:upper-pressure>]
  The final term is at most $t^(- 1) upright(e)^(t H - beta_(-) t^2 \/ 2)$ on $K$. Thus (6.5) proves the required uniform upper bound.
  #emph[Zero-energy configurations and the lower bound.] Fix $s > 0$ and $0 < nu lt.eq 1$. Dilate a maximizing packing in a side-$s$ cube by $1 + nu$, and center it in a cube of side
  $ P = \( s + 2 \) \( 1 + nu \) . $
  Repeat this pattern in adjacent period cubes. Centers in one period have separation at least $1 + nu$; centers in different periods have at least this separation as well. Every center has distance at least $1 + nu$ from the boundary of its period cube. A cube of side $m P$ contains exactly $k = m^3 M_s$ centers.
  Choose $r in \( 0 \, nu \/ 16 \)$ and let $b_0 = 4 pi r^3 \/ 3$. At every center $z$, put the root particle in $B \( z \, r \)$. There are two constructions, with cluster size $j = 1$ or $j = 4$. For $j = 4$, choose vectors $a_2 \, a_3 \, a_4 in bb(R)^3$ such that $0 \, a_2 \, a_3 \, a_4$ are the vertices of a regular tetrahedron of side $1 + Delta \/ 2$. Fix $delta in \( 0 \, Delta \/ 24 \)$ and require
  $ x_i - x_1 in B \( l_t a_i \, delta l_t \) \, #h(2em) i = 2 \, 3 \, 4 . $
  A root-to-vertex distance differs from $\( 1 + Delta \/ 2 \) l_t$ by at most $delta l_t$, and another edge differs by at most $2 delta l_t$. All six distances consequently lie strictly inside
  $ \( \( 1 + Delta \/ 3 \) l_t \, \( 1 + 2 Delta \/ 3 \) l_t \) \, $
  where the core vanishes. Write $b_1 = 4 pi delta^3 \/ 3 > 0$. The change from positions to the root and the three relative vectors has Jacobian one. For one prescribed label ordering the integration volume at each center is therefore $b_0 \( b_1 l_t^3 \)^3$, with positive relative volume $b_1^3 l_t^9$. For $j = 1$, the corresponding volume is $b_0$.
  Every particle lies within $r + 2 l_t$ of its center. For all sufficiently large $t$, depending on $nu \, r$ but not on $m \, beta \, h$, these center neighborhoods are disjoint and lie inside their period cubes, and intercluster distances are greater than $1 + nu \/ 2 > 1 + 1 \/ t$. Hence all configurations just described have exactly zero core energy.
  The centers are distinguishable. Assign an unordered set of $j$ particle labels to each of the $k$ centers, and retain just one deterministic ordering of each assigned set, for example the increasing order. There are $\( j k \) ! \/ \( j ! \)^k$ such assignments. Different assignments send some label to different disjoint center neighborhoods, so their integration events are disjoint. Possible alternative choices of the root within the same set are never summed. Dividing by the canonical factorial $\( j k \) !$ gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ Z_(m P \, j k)^(psi_t) \( beta \) gt.eq (frac(b_0 \( b_1 l_t^3 \)^(j - 1), j !))^k \, #h(2em) j in { 1 \, 4 } . $ <i:cluster-lower>]
  Using this term in the grand sum and first letting $m arrow.r oo$, we find
  #[#set math.equation(numbering: n => "(6.8)")
   $ q^(\( t \)) \( beta \, h \) gt.eq c_(s \, nu) (j h - 3 \( j - 1 \) + 1 / t log frac(b_0 b_1^(j - 1), j !)) \, #h(2em) c_(s \, nu) = frac(M_s, \( \( s + 2 \) \( 1 + nu \) \)^3) . $ <i:lower-pressure>]
  The vacuum also gives $q^(\( t \)) gt.eq 0$. The constants in (6.8) have no dependence on $beta \, h$, and $c_(s \, nu)$ can be made arbitrarily close to $p$ by taking $s$ large and $nu$ small. More explicitly, on $lr(|h|) lt.eq H$ the two functions $j h - 3 \( j - 1 \)$, $j = 1 \, 4$, have a common finite absolute bound. Given any error tolerance, first choose $s \, nu$ so that replacing $c_(s \, nu)$ by $p$ changes both branches by less than that tolerance, and then take $t$ large enough to make the two logarithmic terms small. Taking the maximum of these branches and zero preserves the uniform error, even where a nonvacuum branch is negative. Together with (6.6), this proves (6.1) on $K$. ◻
]

=== 6.2 The limiting attraction and its active densities <the-limiting-attraction-and-its-active-densities>

We next apply the ideal attraction with mass $A = 3 \/ \( 2 p \)$. Let $P_1^t = T_A q^(\( t \))$, and define

#[#set math.equation(numbering: n => "(6.9)")
 $ L_1 \( beta \, h \) & = 0 \,\
L_2 \( beta \, h \) & = p h + frac(beta A p^2, 2) \,\
L_3 \( beta \, h \) & = 4 p h - 9 p + frac(beta A \( 4 p \)^2, 2) \,\
P_(*) \( beta \, h \) & = max_(1 lt.eq i lt.eq 3) L_i \( beta \, h \) \, #h(2em) D_(*) = { 0 \, p \, 4 p } . $ <i:three-planes>]

#thm([Lemma 8.])[
  (The limiting transform and its optimizer gap).  #emph[The functions $P_1^t$ converge locally uniformly on $Omega$ to $P_(*)$. For every compact $K subset Omega$, all their active optimizers lie in one interval $\[ 0 \, U \]$ for all sufficiently large $t$, and 
$ sup_(lambda in K) med sup_(u med upright(a c t i v e med f o r) med P_1^t \( lambda \)) "dist" \( u \, D_(*) \) arrow.r 0 . $

 In particular, this holds at parameters where several limiting planes meet. If $beta_(-) = min_(\( beta \, h \) in K) beta$, the limiting objective obeys the explicit bound 
#[#set math.equation(numbering: n => "(6.10)")
 $ F_(*) \( lambda \, u \) := q_(*) \( beta \, h + beta A u \) - frac(beta A u^2, 2) lt.eq P_(*) \( lambda \) - frac(beta_(-) A, 2) "dist" \( u \, D_(*) \)^2 quad \( lambda in K \, med u in bb(R) \) . $ <i:objective-gap>]

]
] <i:limiting-transform>

#proof[
  Apply the uniform-in-$t$ bound in 4 to the bare core $psi_t$, mass $A$, and parameter compact $K$. For all sufficiently large $t$, every active shift lies in one fixed interval $\[ 0 \, U \]$. Enlarge $U$, if necessary, so that $4 p lt.eq U$.
  Write $d_1 = 0 \, d_2 = p \, d_3 = 4 p$. Completing the square gives the identity
  #[#set math.equation(numbering: n => "(6.11)")
   $ F_(*) \( lambda \, u \) = max_(1 lt.eq i lt.eq 3) {L_i \( lambda \) - frac(beta A, 2) \( u - d_i \)^2} . $ <i:limiting-parabolas>]
  Its supremum over $u$ is $P_(*) \( lambda \)$, and all its maximizing values belong to $D_(*)$. The same identity proves (6.10).
  The shifted points
  $ K' = { \( beta \, h + beta A u \) : \( beta \, h \) in K \, med 0 lt.eq u lt.eq U } $
  form a compact subset of $Omega$. Put $E_t = sup_(K') lr(|q^(\( t \)) - q_(*)|)$, which tends to zero by 6. Both transforms can be maximized over $\[ 0 \, U \]$, so
  $ sup_K lr(|P_1^t - P_(*)|) lt.eq E_t . $
  If $u$ is active for $P_1^t \( lambda \)$, approximation of its objective and of the maximum shows $F_(*) \( lambda \, u \) gt.eq P_(*) \( lambda \) - 2 E_t$. By (6.10),
  #[#set math.equation(numbering: n => "(6.12)")
   $ "dist" \( u \, D_(*) \) lt.eq 2 sqrt(frac(E_t, beta_(-) A)) . $ <i:active-density-error>]
  This estimate is uniform on $K$ and requires no strict inequality between the three affine branches. ◻
]

=== 6.3 Uniform separation of generating slopes <uniform-separation-of-generating-slopes>

The optimizer gap locates the density coordinates of active supports. We now identify neighborhoods of the full slopes that will remain separated under the iteration. The slopes of the three limiting planes and their barycenter are

#[#set math.equation(numbering: n => "(6.13)")
 $ d_1 = 0 \, #h(2em) d_2 = p \, #h(2em) d_3 = 4 p \, #h(2em) v_i = \( A d_i^2 \/ 2 \, d_i \) \,\
v_1 = \( 0 \, 0 \) \, #h(2em) v_2 = \( 3 p \/ 4 \, p \) \, #h(2em) v_3 = \( 12 p \, 4 p \) \,\
g = frac(v_1 + v_2 + v_3, 3) = \( 17 p \/ 4 \, 5 p \/ 3 \) \, #h(2em) lambda_(*) = \( 1 \, - 3 \/ 4 \) . $ <i:slopes>]

All three planes vanish at $lambda_(*)$, and $det \( v_2 - v_1 \, v_3 - v_1 \) = - 9 p^2 eq.not 0$. Thus $g$ is strictly inside their slope triangle.

#thm([Lemma 9.])[
  (Robust slope geometry).  #emph[There are constants $0 < tau < p \/ 16$ and $gamma > 0$ with the following properties. Every choice $w_i in overline(B) \( v_i \, tau \)$, $i = 1 \, 2 \, 3$, satisfies 
#[#set math.equation(numbering: n => "(6.14)")
 $ overline(B) \( g \, gamma \) subset "conv" { w_1 \, w_2 \, w_3 } . $ <i:robust-triangle>]

 For each distinct pair $i \, j$, 
#[#set math.equation(numbering: n => "(6.15)")
 $ g in.not "conv" #scale(x: 120%, y: 120%)[\(] overline(B) \( v_i \, tau \) union overline(B) \( v_j \, tau \) #scale(x: 120%, y: 120%)[\)] . $ <i:two-groups>]

 Moreover, for every $lambda in Omega$, 
#[#set math.equation(numbering: n => "(6.16)")
 $ P_(*) \( lambda \) - P_(*) \( lambda_(*) \) - ⟨g \, lambda - lambda_(*)⟩ gt.eq gamma ∥lambda - lambda_(*)∥ . $ <i:linear-growth>]

]
] <i:geometry>

#proof[
  Because $g$ is an interior point of the nondegenerate triangle, the two numbers
  $ eta = min_(∥z∥ = 1) max_i ⟨v_i - g \, z⟩ > 0 \, #h(2em) zeta = min_(i < j) "dist" #scale(x: 120%, y: 120%)[\(] g \, \[ v_i \, v_j \] #scale(x: 120%, y: 120%)[\)] > 0 $
  are positive. For the first assertion, one may also see positivity directly: if all three inner products were nonpositive, their sum would be zero, so all would vanish, contradicting noncollinearity. Choose
  $ 0 < tau < min { p \/ 16 \, eta \/ 4 \, zeta \/ 2 } \, #h(2em) gamma = eta \/ 2 . $
  For any unit vector $z$ and any allowed vertices $w_i$,
  $ max_i ⟨w_i - g \, z⟩ gt.eq eta - tau > gamma . $
  The support-function characterization of inclusion of compact convex sets proves (6.14). Every point of the hull of two radius-$tau$ balls lies within distance $tau$ of the segment joining their centers. Since $tau < zeta$, this also proves (6.15). Finally, all three planes agree at $lambda_(*)$, and hence for $z = lambda - lambda_(*)$,
  $ P_(*) \( lambda \) - P_(*) \( lambda_(*) \) - ⟨g \, z⟩ = max_i ⟨v_i - g \, z⟩ gt.eq eta ∥z∥ gt.eq gamma ∥z∥ . $
  ◻
]

The geometry of 9 is illustrated in 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.216, 0), (6.288, 0), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#737373"))))
  content((6.288, -0.07056), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$e"/"p$]]], anchor: "north", padding: 0.1176cm)
  line((0, -0.168), (0, 2.4), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#737373"))))
  content((0, 2.4), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$d"/"p$]]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (0.36, 0.48), (5.76, 1.92), close: true, fill: rgb("#ebebff"), stroke: none)
  line((0, 0), (0.36, 0.48), (5.76, 1.92), close: true, stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  circle((0, 0), radius: 0.08467, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$v_1$]], anchor: "north-east", padding: 0.1176cm)
  circle((0.36, 0.48), radius: 0.08467, fill: black, stroke: none)
  content((0.36, 0.48), [#text(size: 9pt)[$v_2$]], anchor: "south-east", padding: 0.1176cm)
  circle((5.76, 1.92), radius: 0.08467, fill: black, stroke: none)
  content((5.76, 1.92), [#text(size: 9pt)[$v_3$]], anchor: "south-west", padding: 0.1176cm)
  circle((2.04, 0.8), radius: 0.08467, fill: rgb("#bf6000"), stroke: none)
  circle((2.04, 0.8), radius: 0.0552, stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10))
  content((1.92, 1.08), [#text(size: 9pt)[$g$]], anchor: "south-east", padding: 0.1176cm)
  line((1.886, 1.018), (2.006, 0.864), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  rect((1.8, 0.552), (2.28, 1.056), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  bezier((2.28, 1.05), (7.48, 2.3), (4.13, 2.014), (5.394, 2.318), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#737373"))))
  circle((8.9, 1.65), radius: 1.35, fill: rgb("#fff5eb"), stroke: none)
  circle((8.9, 1.65), radius: 1.35, stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10))
  line((7.2, 1.65), (10.6, 1.65), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((7.97, 1.65), (9.83, 1.65), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((7.97, 1.65), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((7.97, 1.474), [#text(size: 9pt)[$(s_1, rho )$]], anchor: "north", padding: 0.1176cm)
  circle((9.83, 1.65), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((9.83, 1.474), [#text(size: 9pt)[$(s_2, rho )$]], anchor: "north", padding: 0.1176cm)
  circle((8.9, 1.65), radius: 0.05644, fill: black, stroke: none)
  content((8.9, 1.791), [#text(size: 9pt)[$g$]], anchor: "south", padding: 0.1176cm)
  content((8.9, 3.32), [#text(size: 9pt)[$overline(B) (g, gamma )$]])
  content((8.9, -0.07), [#text(size: 9pt)[$rho =5p"/"3, s_1<s_2$]])
})],
  caption: [Figure 1: Pressure-support coordinates $\( e \, d \)$, with the left panel drawn in coordinates $\( e \/ p \, d \/ p \)$. The triangle of the initial limiting slopes $v_i$ contains a ball about its barycenter $g$; the ball persists under the controlled perturbations of its vertices. The schematic inset shows two points on the central horizontal slice at density $5 p \/ 3$. Once the ball lies in the subdifferential of a pressure at one parameter, each nearby horizontal slice supplies two supports with distinct inverse-temperature slopes at that same parameter. Lemma 11 converts this geometry into the canonical derivative jump throughout a density interval. ],
) <fig:support-geometry>

Define the closed parameter neighborhoods

#[#set math.equation(numbering: n => "(6.17)")
 $ W \( r \) = overline(B) \( lambda_(*) \, r \) \, #h(2em) W_1 = W \( 1 \/ 4 \) subset Omega . $ <i:neighborhoods>]

The next proposition gives a statement about actual supporting slopes throughout $W_1$, as required for the subsequent iteration.

#thm([Proposition 7.])[
  (Initial separation of generating slopes).  #emph[For all sufficiently large finite $t$, the size conditions in Proposition 1, Proposition 4 hold and 
#[#set math.equation(numbering: n => "(6.18)")
 $ sup_(lambda in W_1) lr(|P_1^t \( lambda \) - P_(*) \( lambda \)|) < gamma / 64 . $ <i:initial-pressure-error>]

 At every $lambda in W_1$ one also has the exact identity 
#[#set math.equation(numbering: n => "(6.19)")
 $ partial P_1^t \( lambda \) = "conv" (partial P_1^t \( lambda \) ∩ union.big_(i = 1)^3 overline(B) \( v_i \, tau \/ 2 \)) . $ <i:initial-hull>]

 Fix one such $t$ for the rest of the construction.]
] <i:initial-separation>

#proof[
  Use the uniform optimizer bound $\[ 0 \, U \]$ from 8 with $K = W_1$. All shifted points $x = \( beta \, h + beta A u \)$ lie in the fixed compact $K'$ from that proof. Choose one $sigma > 0$ such that
  $ K'' = { x + \( s \, 0 \) : x in K' \, med lr(|s|) lt.eq sigma } subset Omega \, $
  and set $E'_t = sup_(K'') lr(|q^(\( t \)) - q_(*)|) arrow.r 0$. For every $\( e \, d \) in partial q^(\( t \)) \( x \)$, its two supporting inequalities at $x + \( sigma \, 0 \)$ and $x - \( sigma \, 0 \)$, together with the independence of $q_(*)$ from $beta$, imply
  #[#set math.equation(numbering: n => "(6.20)")
   $ - frac(2 E'_t, sigma) lt.eq e lt.eq frac(2 E'_t, sigma) . $ <i:energy-support-error>]
  These are fixed steps on an enlarged compact, so the estimate also covers outer parameters on the boundary of $W_1$.
  At a shifted point corresponding to an active $u$, 5 gives $d = u$ for every underlying support. By 5, the actual active generators of $partial P_1^t \( lambda \)$ are precisely the vectors in the union
  $ G_t \( lambda \) = union.big_(u med upright("active")) {\( e + A u^2 \/ 2 \, u \) : \( e \, u \) in partial q^(\( t \)) \( beta \, h + beta A u \)} \, #h(2em) partial P_1^t \( lambda \) = "conv" G_t \( lambda \) . $
  For a nearest $d_i in D_(*)$, every such generator $w$ satisfies
  $ ∥w - v_i∥ lt.eq frac(2 E'_t, sigma) + (1 + A / 2 \( U + 4 p \)) lr(|u - d_i|) . $
  Equations (6.12) and (6.20) show that this tends uniformly to zero over all outer parameters, all active optimizers, and all underlying supports. Thus, for all sufficiently large $t$,
  $ G_t \( lambda \) subset partial P_1^t \( lambda \) ∩ union.big_i overline(B) \( v_i \, tau \/ 2 \) #h(2em) \( lambda in W_1 \) . $
  Taking convex hulls proves one inclusion in (6.19); the other follows from convexity of the subdifferential. Finally, (6.18) follows from 8. All earlier size conditions are lower bounds on $t$, so they can be imposed at the same time. ◻
]

== 7 The multiscale potential and the canonical singularity <sec:iteration>

Fix $t$ as in 7. We will preserve its three groups of generating supports while replacing ideal attractions by physical ones. The essential step is quantitative: a pressure error $delta$, followed by an ideal attraction of mass $a$, enlarges the slope groups by $O \( delta \/ a + a \)$ and costs $O \( a \)$ in the parameter domain. We first prove this step, then choose one sequence of masses and ranges for which both losses are summable.

=== 7.1 Preservation under one attraction <preservation-under-one-attraction>

Let $q$ be a physical pressure and $P$ a convex approximation whose subdifferential is generated near the three initial slopes. In the iteration, $P$ will be the preceding ideal transform and $q$ its finite-range realization. We ask how closely the generating supports of $T_a q$ remain in those three groups when $∥P - q∥_(W_1) lt.eq delta$. At each active shifted point, the parabolic bound first isolates one group in a neighborhood of radius proportional to $a$. Secant inequalities in that neighborhood then transfer the support bound from $P$ to $q$.

Recall the parameter balls $W \( r \) = overline(B) \( lambda_(*) \, r \)$, $W_1 = W \( 1 \/ 4 \)$, the slope vectors $v_i = \( A d_i^2 \/ 2 \, d_i \)$, and the constants $tau \, gamma > 0$ from 9. By 4, choose $U_(*) > 0$ bounding all active shifts for every transform $T_a Q$ of a family pressure, with $0 < a lt.eq A + 1$, at parameters in $W_1$, uniformly over admissible references and masses. Uniform convex-function bounds on a larger compact neighborhood give a common Lipschitz constant $C_(*) gt.eq 1$ for all these transforms on $W_1$. These constants depend only on the fixed family and parameter compacts. Put $beta_min = 3 \/ 4$, $beta_max = 5 \/ 4$. Choose $k > 0$, and then $l > 0$, sufficiently small that

#[#set math.equation(numbering: n => "(7.1)")
 $ frac(k, 2 beta_min) + frac(2 C_(*) l, k) < p / 16 . $ <eq:band-constants>]

Set

$ S_(*) = beta_max U_(*) + k + l + 1 . $

Here $beta_max U_(*) a$ bounds the displacement to an active shifted point, $k a$ will be a field increment, and $l a$ the radius on which all supports will be controlled. All these constants depend only on the fixed $t$, the family, and the parameter compacts.

#thm([Lemma 10.])[
  (One-step preservation of generating supports).  #emph[Let $q$ be a pressure from the family (2.2), and let $P$ be a finite convex function on $Omega$ that is $C_(*)$-Lipschitz on $W_1$. Suppose 
$ 0 < a lt.eq A + 1 \, #h(2em) 0 < r < tau \, #h(2em) S_(*) a < s lt.eq 1 / 4 \,\
delta gt.eq 0 \, #h(2em) ∥P - q∥_(W_1) lt.eq delta \, #h(2em) frac(2 delta, k a) < p / 16 . $

 Assume that throughout $W \( s \)$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ partial P \( y \) = "conv" (partial P \( y \) ∩ union.big_(i = 1)^3 overline(B) \( v_i \, r \)) . $ <eq:one-step-hypothesis>]

 Then, with 
$ r^(+) = r + frac(2 delta, l a) + 1 / 2 a U_(*)^2 \, $

 one has for every $lambda in W \( s - S_(*) a \)$, 
#[#set math.equation(numbering: n => "(7.3)")
 $ partial \( T_a q \) \( lambda \) = "conv" (partial \( T_a q \) \( lambda \) ∩ union.big_(i = 1)^3 overline(B) \( v_i \, r^(+) \)) . $ <eq:one-step-conclusion>]

]
] <m:one-step>

#proof[
  Fix $lambda = \( beta \, h \) in W \( s - S_(*) a \)$, and choose an active shift $u$ for $T_a q$ at $lambda$. Let $x = \( beta \, h + beta a u \)$. The distance from $lambda$ to the boundary of $W \( s \)$ is at least $S_(*) a$. Since $lr(|x - lambda|) lt.eq beta_max U_(*) a$, every point
  $ y \, quad y + \( 0 \, plus.minus k a \) \, quad x + \( 0 \, plus.minus k a \) \, #h(2em) lr(|y - x|) lt.eq l a \, $
  lies in $W \( s \)$. The surplus $a$ leaves these test points in the interior of $W \( s \)$.
  #emph[A common density band.] For $\( e \, d \) in partial P \( y \)$, the supporting inequality at $y$, the Lipschitz bound on $P$, and the bound $∥P - q∥_(W_1) lt.eq delta$ give
  $ plus.minus k a thin d & lt.eq P \( y + \( 0 \, plus.minus k a \) \) - P \( y \)\
 & lt.eq q \( x + \( 0 \, plus.minus k a \) \) - q \( x \) + 2 delta + 2 C_(*) l a\
 & lt.eq plus.minus k a thin u + frac(\( k a \)^2, 2 beta a) + 2 delta + 2 C_(*) l a . $
  The last step is the active-point parabola of 5. Using both signs, (7.1), and the hypothesis on $delta \/ a$, we obtain
  #[#set math.equation(numbering: n => "(7.4)")
   $ lr(|d - u|) lt.eq frac(k, 2 beta_min) + frac(2 C_(*) l, k) + frac(2 delta, k a) < p / 8 . $ <eq:common-density-band>]
  The same $u$ works for every $y$ in this neighborhood.
  #emph[One slope group near the shifted point.] The set in the right side of (7.2) is nonempty: the full subdifferential is nonempty, and the assumed hull identity identifies it with the convex hull of that set. If a generator belongs to $overline(B) \( v_i \, r \)$, then
  $ lr(|u - d_i|) < p / 8 + tau < frac(3 p, 16) . $
  Since the distinct $d_i$ are separated by at least $p$, at most one index $i$ can satisfy this condition. It is therefore one common index for the entire neighborhood. By convexity of the ball and the assumed hull identity,
  #[#set math.equation(numbering: n => "(7.5)")
   $ partial P \( y \) subset overline(B) \( v_i \, r \) #h(2em) \( lr(|y - x|) lt.eq l a \) . $ <eq:one-ball-neighborhood>]
  #emph[Transfer to the physical pressure and its transform.] Take $v in partial q \( x \)$ and a unit vector $z in bb(R)^2$. At $y = x + l a z$, choose any support of $P$. Using (7.5) to bound this support and the approximation at $x \, y$, we get
  $ l a thin v dot.op z lt.eq q \( y \) - q \( x \) lt.eq P \( y \) - P \( x \) + 2 delta lt.eq l a thin \( v_i dot.op z + r \) + 2 delta . $
  Testing every unit $z$ proves
  $ lr(|v - v_i|) lt.eq r + frac(2 delta, l a) . $
  By 5, the generating supports of the active branch of $T_a q$ are obtained by adding $\( a u^2 \/ 2 \, 0 \)$. They all lie in $overline(B) \( v_i \, r^(+) \)$ by the definition of $r^(+)$ and $lr(|u|) lt.eq U_(*)$. The exact convex-hull formula over all active branches gives (7.3). ◻
]

The common density band is what prevents supports near one active shifted point from mixing different groups. Once one group has been selected, ordinary secants transfer its entire support bound across a pressure error $delta$; division by the test distance $l a$ explains the term $2 delta \/ \( l a \)$. The remaining term in $r^(+)$ bounds the shift $\( a u^2 \/ 2 \, 0 \)$ of each support under the transform.

=== 7.2 A common choice of scales <m:schedule>

For $R_1 > 2$, define

#[#set math.equation(numbering: n => "(7.6)")
 $ R_n = R_1^(2^(n - 1)) \, #h(2em) a_1 = A \, #h(2em) a_n = R_n^(- 1 \/ 16) quad \( n gt.eq 2 \) . $ <eq:mass-range>]

Let

#[#set math.equation(numbering: n => "(7.7)")
 $ phi_n = psi_t - t sum_(j = 1)^n a_j w_(R_j) \, #h(2em) q_n = Q_(phi_n) \, #h(2em) P_n = T_(a_n) q_(n - 1) quad \( n gt.eq 1 \) \, $ <eq:truncated-models>]

where $phi_0 = psi_t$ and $q_0 = q^(\( t \))$. Thus $P_1 = T_A q^(\( t \))$ is the pressure used in 7.

Choose $R_1$ large enough initially that $sum_(n gt.eq 2) a_n < 1$. Every truncated potential then belongs to the stable family (2.2). By 2, for all sufficiently large $R_1$,

#[#set math.equation(numbering: n => "(7.8)")
 $ ∥q_n - P_n∥_(W_1) lt.eq delta_n \, #h(2em) delta_n = C_3 R_n^(- 1 \/ 4) quad \( n gt.eq 1 \) \, $ <eq:approximation-errors>]

with one constant $C_3$ independent of $n$ and $R_1$. Indeed, the reference range is at most two for $n = 1$, giving the stronger estimate $O \( R_1^(- 1 \/ 2) \)$. For $n gt.eq 2$, it is at most $R_(n - 1) = sqrt(R_n)$. The ratio threshold in 2 is uniform in the reference, so it suffices to enlarge the same $R_1$.

The crucial relations are

#[#set math.equation(numbering: n => "(7.9)")
 $ a_(n + 1) = R_n^(- 1 \/ 8) \, #h(2em) delta_n / a_(n + 1) = C_3 R_n^(- 1 \/ 8) \, #h(2em) sum_(n gt.eq 1) (a_(n + 1) + delta_n + delta_n / a_(n + 1)) arrow.r 0 quad \( R_1 arrow.r oo \) . $ <eq:summable-errors>]

For example, for every $q > 0$,

$ sum_(n gt.eq 1) R_n^(- q) = sum_(n gt.eq 1) \( R_1^(- q) \)^(2^(n - 1)) lt.eq frac(R_1^(- q), 1 - R_1^(- q)) . $

This explicit bound will meet all the conditions below.

By 4, fix $C_0 > 0$, independently of $R_1$, such that

#[#set math.equation(numbering: n => "(7.10)")
 $ 0 lt.eq T_a Q - Q lt.eq C_0 a #h(2em) upright("on ") W_1 $ <eq:small-mass-increment>]

for all family pressures and $0 < a lt.eq A + 1$.

Set

$ W_n = W (1 / 4 - S_(*) sum_(j = 1)^(n - 1) a_(j + 1)) \, $

and define

#[#set math.equation(numbering: n => "(7.11)")
 $ r_1 = tau / 2 \, #h(2em) r_(n + 1) = r_n + frac(2 delta_n, l a_(n + 1)) + 1 / 2 a_(n + 1) U_(*)^2 . $ <eq:slope-radii>]

We now enlarge $R_1$ once more so that

#[#set math.equation(numbering: n => "(7.12)")
 $ S_(*) sum_(n gt.eq 1) a_(n + 1) & < 1 / 8 \, & sum_(n gt.eq 1) (frac(2 delta_n, l a_(n + 1)) + 1 / 2 a_(n + 1) U_(*)^2) & < tau / 2 \,\
sup_(n gt.eq 1) frac(2 delta_n, k a_(n + 1)) & < p / 16 \, & sum_(n gt.eq 1) \( delta_n + C_0 a_(n + 1) \) & < gamma / 64 . $ <eq:domain-radius-budget>]

All four conditions follow from (7.9); no further choices of masses or ranges are made. In particular, every $W_n$ contains $W \( 1 \/ 8 \)$ and $r_n < tau$.

The pressures stay uniformly close to the three-plane limit:

#[#set math.equation(numbering: n => "(7.13)")
 $ ∥P_n - P_(*)∥_(W_1) < gamma / 32 #h(2em) \( n gt.eq 1 \) . $ <eq:pressure-near-limit>]

To see this, use

$ ∥P_(n + 1) - P_n∥_(W_1) lt.eq ∥T_(a_(n + 1)) q_n - q_n∥_(W_1) + ∥q_n - P_n∥_(W_1) lt.eq C_0 a_(n + 1) + delta_n $

and telescope from the initial error $gamma \/ 64$. This comparison uses (7.10) for the physical pressure $q_n$, so no shifted evaluation of the approximation (7.8) is required here.

#thm([Proposition 8.])[
  (Persistence at every scale).  #emph[For every $n gt.eq 1$ and $y in W_n$, 
#[#set math.equation(numbering: n => "(7.14)")
 $ partial P_n \( y \) = "conv" (partial P_n \( y \) ∩ union.big_(i = 1)^3 overline(B) \( v_i \, r_n \)) . $ <eq:separated-generators>]

]
] <m:propagation>

#proof[
  The case $n = 1$ is 7. Each $q_n$ belongs to the family, and each $P_n$ has the common Lipschitz bound $C_(*)$. Apply 10 inductively with $P = P_n$, $q = q_n$, $a = a_(n + 1)$, $delta = delta_n$, $r = r_n$, and $s$ equal to the radius of $W_n$. The first condition in (7.12) keeps the parameter radius above $1 \/ 8$, while the second gives $r_n < tau$. The other hypotheses are (7.8) and the first condition in (7.12). The new domain and slope radius are exactly $W_(n + 1)$ and $r_(n + 1)$. ◻
]

The three groups now force a two-dimensional set of supports at one parameter. Minimizing against their barycenter first finds that barycenter in a subdifferential; its separation from every two-group hull then forces all three groups to occur there.

#thm([Proposition 9.])[
  (A common ball of pressure supports).  #emph[For every $n gt.eq 1$, there is $lambda_n in "int" W \( 1 \/ 8 \)$ such that 
#[#set math.equation(numbering: n => "(7.15)")
 $ overline(B) \( g \, gamma \) subset partial P_n \( lambda_n \) . $ <eq:common-pressure-ball>]

]
] <m:pressure-ball>

#proof[
  Minimize $P_n \( lambda \) - g dot.op lambda$ on the compact ball $W \( 1 \/ 8 \)$. For a boundary point, 9 and (7.13) give
  $ & \[ P_n \( lambda \) - g dot.op lambda \] - \[ P_n \( lambda_(*) \) - g dot.op lambda_(*) \]\
 & #h(2em)  > gamma / 8 - frac(2 gamma, 32) = gamma / 16 > 0 . $
  Thus a minimizer $lambda_n$ is interior, and $g in partial P_n \( lambda_n \)$. By 8, this subdifferential is generated by its intersections with the three balls $overline(B) \( v_i \, r_n \)$. The vector $g$ lies outside the convex hull of any two of the larger balls $overline(B) \( v_i \, tau \)$. Each of the three intersections must therefore be nonempty. Choose one actual support from each. Their triangle contains $overline(B) \( g \, gamma \)$ by 9, and their convex hull is contained in $partial P_n \( lambda_n \)$. ◻
]

=== 7.3 The final potential and its decay <the-final-potential-and-its-decay>

Define one potential, now with all parameters fixed, by

#[#set math.equation(numbering: n => "(7.16)")
 $ Phi \( x \) = phi.alt \( lr(|x|) \) = psi_t \( lr(|x|) \) - t sum_(n gt.eq 1) a_n w_(R_n) \( x \) . $ <eq:final-potential>]

#thm([Proposition 10.])[
  (Stability and algebraic decay).  #emph[The function $phi.alt$ is bounded and continuous on $\[ 0 \, oo \)$, is stable with $B = t^2 \/ 2$, and satisfies $lr(|phi.alt \( r \)|) lt.eq C r^(- 3 - 1 \/ 32)$ for all $r gt.eq 1$, where 
#[#set math.equation(numbering: n => "(7.17)")
 $ C = 2^(3 + 1 \/ 32) t^2 + t ∥w∥_oo (A R_1^(1 \/ 32) + sum_(n gt.eq 2) R_1^(- 2^(n - 1) \/ 32)) < oo . $ <eq:tail-constant>]

]
] <m:tail>

#proof[
  Since $sum_n a_n < A + 1$ and $R_n gt.eq 1$, the attraction series converges uniformly. The core and every summand are bounded, continuous, and radial. The common cell estimate of 1 applies to the sum and gives $U^Phi gt.eq - B_0 N = - \( t^2 \/ 2 \) N$.
  Set $epsilon = 1 \/ 32$. A nonzero summand at radius $r$ must have $R_n gt.eq r$, and then
  $ r^(3 + epsilon) R_n^(- 3) lt.eq R_n^epsilon . $
  The core vanishes for $r gt.eq 1 + 1 \/ t < 2$ and is at most $t^2$. For every $r gt.eq 1$, therefore,
  $ r^(3 + epsilon) lr(|phi.alt \( r \)|) lt.eq 2^(3 + epsilon) t^2 + t ∥w∥_oo sum_(n : R_n gt.eq r) a_n R_n^epsilon lt.eq C . $
  Finally,
  $ sum_(n gt.eq 1) a_n R_n^(1 \/ 32) = A R_1^(1 \/ 32) + sum_(n gt.eq 2) R_1^(- 2^(n - 1) \/ 32) < oo $
  by the geometric-series bound following (7.9). ◻
]

=== 7.4 From pressure supports to a temperature singularity <from-pressure-supports-to-a-temperature-singularity>

By 2, the infinite potential has canonical and grand-canonical thermodynamic limits. By 2 and (7.8),

$ ∥P_n - Q_Phi∥_(W_1) lt.eq delta_n + C_(W_1 \, t) sum_(j > n) a_j arrow.r 0 . $

Choose a subsequence of $lambda_n$ converging to $lambda_c = \( beta_c \, h_c \) in W \( 1 \/ 8 \)$. In particular, $beta_c in \[ 7 \/ 8 \, 9 \/ 8 \]$. For each $v in overline(B) \( g \, gamma \)$ and $lambda in W_1$, (7.15) gives

$ P_n \( lambda \) gt.eq P_n \( lambda_n \) + v dot.op \( lambda - lambda_n \) . $

Uniform convergence and continuity pass this inequality to the limit. It is a supporting inequality for $Q_Phi$ on a neighborhood of $lambda_c$. Such a local support extends globally on the convex domain $Omega$: a violation at another point would, by convexity along the joining segment, give a violation arbitrarily close to $lambda_c$. Consequently,

#[#set math.equation(numbering: n => "(7.18)")
 $ overline(B) \( g \, gamma \) subset partial Q_Phi \( beta_c \, h_c \) . $ <eq:limiting-support-ball>]

We state explicitly the duality implication used to finish the proof. It is the supporting-hyperplane form of Fenchel duality #cite(label("RockafellarWets1998")) Theorem 11.1 and Proposition 11.3, applied only in the field coordinate and with the inverse temperature retained as a parameter.

#thm([Lemma 11.])[
  (From pressure supports to canonical slopes).  #emph[Suppose that $H \( beta \, d \)$ and $Q \( beta \, h \)$ have the duality and finiteness properties of 2; assume also, as there, that $H \( thin dot.op thin \, d \)$ is concave on $\( 0 \, oo \)$ for every $d > 0$. If 
$ \( s_1 \, rho \) \, \( s_2 \, rho \) in partial Q \( beta_c \, h_c \) \, #h(2em) rho > 0 \, quad s_1 < s_2 \, $

 then $H \( thin dot.op thin \, rho \)$ has finite one-sided derivatives at $beta_c$ and 
$ H'_(+) \( beta_c \, rho \) lt.eq - s_2 < - s_1 lt.eq H'_(-) \( beta_c \, rho \) . $

]
] <m:canonical-corner>

#proof[
  The field part of either support inequality says that $rho$ supports $Q \( beta_c \, dot.op \)$ at $h_c$. Density duality therefore gives $H \( beta_c \, rho \) = h_c rho - Q \( beta_c \, h_c \)$. The full support inequality, with $s = s_i$, reads
  $ Q \( beta \, h \) gt.eq Q \( beta_c \, h_c \) + s \( beta - beta_c \) + rho \( h - h_c \) . $
  Rearrange and take the supremum over $h$. The reverse duality gives
  $ H \( beta \, rho \) lt.eq H \( beta_c \, rho \) - s \( beta - beta_c \) . $
  The function $H \( thin dot.op thin \, rho \)$ is finite and concave on $\( 0 \, oo \)$, so its one-sided derivatives at an interior point exist and are finite. Dividing the last inequality by positive and negative increments yields the stated ordering. ◻
]

#proof[
  Take the potential (7.16) and the constants in 10. Write $g = \( g_1 \, rho_0 \)$, where $rho_0 = 5 p \/ 3 > 0$, and set
  $ eta = min { gamma \/ 2 \, rho_0 \/ 2 } \, #h(2em) I = \( rho_0 - eta \, rho_0 + eta \) subset \( 0 \, oo \) . $
  For every $rho in I$, the two points
  $ \( g_1 - gamma \/ 2 \, rho \) \, #h(2em) \( g_1 + gamma \/ 2 \, rho \) $
  lie in $overline(B) \( g \, gamma \)$, since their squared distances from $g$ are $\( gamma \/ 2 \)^2 + \( rho - rho_0 \)^2 < gamma^2 \/ 2$. By (7.18), both support the same pressure at the same $\( beta_c \, h_c \)$, independently of $rho$. Lemma 11 therefore gives finite one-sided canonical slopes whose difference is at least $gamma$ for every $rho in I$. The all-sequence canonical limit of 2 applies in particular to $N_L = floor.l rho L^3 floor.r$ for every $beta > 0$. The specified free energy equals
  $ f \( beta \, rho \) = t / beta H_Phi \( beta \, rho \) . $
  For each $rho in I$, it is finite for every $beta > 0$. The finite concave function $H_Phi \( thin dot.op thin \, rho \)$ is continuous at $beta_c$; hence the common derivative term from $1 \/ beta$ cancels in the difference, giving
  $ f'_(-) \( beta_c \, rho \) - f'_(+) \( beta_c \, rho \) = t / beta_c #scale(x: 120%, y: 120%)[\(] H'_(Phi \, -) \( beta_c \, rho \) - H'_(Phi \, +) \( beta_c \, rho \) #scale(x: 120%, y: 120%)[\)] gt.eq frac(t gamma, beta_c) > 0 . $
  The potential and the density interval are fixed before the limiting critical parameter is selected, so this one $beta_c$ works throughout $I$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
