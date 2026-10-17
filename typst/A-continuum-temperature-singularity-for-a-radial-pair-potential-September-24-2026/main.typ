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

#align(center)[#text(size: 16pt, weight: "bold")[A continuum temperature singularity \
for a radial pair potential]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The continuum existence problem <sec:introduction>

A phase transition in a continuum particle system can be expressed as a loss of regularity of its thermodynamic free energy. We consider an existence problem: can a single species of particles in $bb(R)^3$, interacting through a stable radial pair potential, have a temperature singularity at one fixed density, and can the same critical inverse temperature work throughout an open interval of densities? We use the following precise class of potentials and normalization.

A potential $Phi \( x \) = phi.alt \( \| x \| \)$ is #emph[admissible] if it is Borel measurable, $Phi \( 0 \) = + oo$, and $phi.alt$ is finite and locally bounded on $\( 0 \, oo \)$, with the following properties:

+ $phi.alt \( r \) arrow.r + oo$ as $r arrow.b 0$;
+ there are $0 < r_1 < r_2$ and $a > 0$ such that $phi.alt \( r \) lt.eq - a$ for every $r in \[ r_1 \, r_2 \]$;
+ $integral_R^oo r^2 \| phi.alt \( r \) \| thin upright(d) r < oo$ for some finite $R$;
+ there is $B < oo$ such that, for every finite configuration,
  #[#set math.equation(numbering: n => "(1.1)")
   $ U_N^Phi \( x_1 \, dots.h \, x_N \) := sum_(1 lt.eq i < j lt.eq N) Phi \( x_i - x_j \) gt.eq - B N . $ <eq:stability-target>]

Let $Lambda_L = \[ - L \/ 2 \, L \/ 2 \]^3$. With free boundary conditions, define

#[#set math.equation(numbering: n => "(1.2)")
 $ Z_(Lambda \, N)^Phi \( beta \) = frac(1, N !) integral_(Lambda^N) e^(- beta U_N^Phi \( x_1 \, dots.h \, x_N \)) thin upright(d) x_1 dots.h.c thin upright(d) x_N \, #h(2em) beta > 0 \, $ <eq:canonical-definition>]

where $Z_(Lambda \, 0)^Phi = 1$ and $e^(- beta oo) = 0$. The position measure is Lebesgue measure, independent of $beta$; no temperature-dependent normalization is included. For a density $rho > 0$, the canonical free-energy density is

#[#set math.equation(numbering: n => "(1.3)")
 $ f_Phi \( beta \, rho \) = - 1 / beta lim_(L arrow.r oo) L^(- 3) log Z_(Lambda_L \, floor.l rho L^3 floor.r)^Phi \( beta \) \, $ <eq:free-energy-definition>]

when the limit exists. The problem is to find an admissible $Phi$ and a fixed $rho$ for which this limit is finite on an interval of positive inverse temperatures and fails to be $C^1$ across an interior point.

Write $D_beta^(-)$ and $D_beta^(+)$ for the left and right derivatives with respect to inverse temperature.

#thm([Theorem 1.1.])[
  #emph[There exist an admissible radial difference-only pair potential $Phi \( x \) = phi.alt \( \| x \| \)$ on $bb(R)^3$, a nonempty open interval $I subset \( 0 \, oo \)$, and one $beta_c in \( 1 \/ 2 \, 3 \/ 2 \)$ with the following properties. The potential satisfies $phi.alt \( r \) = o \( r^(- 3) \)$ as $r arrow.r oo$. The free-cube limit (1.3) exists and is finite for every $beta > 0$ and every density $rho > 0$. For every $rho in I$, the finite one-sided derivatives at the same critical point satisfy 
$ D_beta^(-) f_Phi \( beta_c \, rho \) > D_beta^(+) f_Phi \( beta_c \, rho \) . $

 Thus one potential and one critical inverse temperature give a strict canonical temperature singularity throughout $I$.]
] <thm:main>

The construction uses a narrow low-energy shell inside a repulsive core, together with a summable family of radial attractions at successively larger ranges. Thus the theorem concerns an engineered potential in the explicit integrable-tail class above. It does not assert a transition for the ordinary $12$–$6$ Lennard–Jones potential, and it makes no identification of the coexisting states as conventional liquid, vapor, or solid phases.

=== 1.1 Context and the role of the fixed density <context-and-the-role-of-the-fixed-density>

The continuum phase-transition existence question belongs to the program highlighted by Simon’s problems in mathematical physics #cite(label("Simon1984")). Here the tail hypothesis is exactly condition (iii). The construction also gives $phi.alt \( r \) = o \( r^(- 3) \)$, but does not establish a bound $\| phi.alt \( r \) \| lt.eq C r^(- 3 - epsilon)$ with any fixed $epsilon > 0$. Accordingly, the theorem does not claim to resolve formulations of the historical problem that require such a power-law margin.

Earlier rigorous continuum transitions include Ruelle’s result for the two-species Widom–Rowlinson model #cite(label("Ruelle1971")). Israel’s convex construction also applies to hard-core continuum particles: a spherically symmetric pair perturbation and a chemical potential produce two invariant equilibrium states of different densities #cite(label("Israel1975")) Section 6, Theorem 8(a). The hard core in that result excludes a positive interval of separations; the potential constructed here is finite at every positive separation. Lebowitz, Mazel, and Presutti later proved a transition for a model with attractive pair and repulsive four-body interactions #cite(label("LebowitzMazelPresutti1998")) #cite(label("LebowitzMazelPresutti1999")). The four-body term remains part of that model.

Recent constructions impose other structures on the interaction. He, Jauslin, Lebowitz, and Peled prove distinct-density Gibbs coexistence for suitable parameters and sufficiently large range in a model with a box-modified Kac pair interaction #cite(label("HeJauslinLebowitzPeled2025")) Equation (1.13) and Theorem 1.3. It depends on a fixed partition into cubes, and the reference interaction acts only within each cube. Dereudre and Renaud-Chan prove low-temperature coexistence for saturated finite-range interactions satisfying a Peierls condition #cite(label("DereudreRenaudChan2026")) Theorem 1. Their radial-kernel example integrates over unions of particle neighborhoods, giving a many-body energy rather than an ordinary pair sum #cite(label("DereudreRenaudChan2026")) Section 2.3, Example 3, Equation (2.18). Our final interaction is a radial function of the particle difference, with all cross-cube interactions retained. Moreover, density coexistence alone does not imply a temperature corner at a fixed density. We obtain two supporting slopes with the same density coordinate and different energy coordinates, the information needed for the strict derivative jump in (1.3).

The long-range comparison is a version of the Lebowitz–Penrose mean-field limit #cite(label("LebowitzPenrose1966")); its extension to superstable interactions is classical #cite(label("GerardiEtAl1973")). Our estimates include local occupation and tail-continuity bounds uniform in the previously chosen attraction ranges. The Kac limit itself fixes each finite reference before sending the new range to infinity. The local quadratic energy estimates belong to Ruelle’s superstability framework #cite(label("Ruelle1970")). Convex methods for constructing coexistence have antecedents in Israel’s tangent-functional argument #cite(label("Israel1975")) Theorem 1 and Ruelle’s restoration of lattice-gas coexistence by small changes of long-range pair couplings and chemical potential #cite(label("Ruelle1977Coexistence")) Section 5. Here the scaled perturbation argument keeps three separated groups of joint pressure slopes, and hence a common ball of slopes, through infinitely many physical approximations.

A companion construction #cite(label("OpenAIAlgebraic2026")) Theorem 1.1 gives a bounded continuous radial potential with $\| phi.alt \( r \) \| lt.eq C r^(- 3 - 1 \/ 32)$ for $r gt.eq 1$ and a common temperature singularity throughout a density interval. That result uses a different potential and a quantitative range estimate; the present proof retains the divergent core and proves its own integrable-tail conclusion.

=== 1.2 How the construction works <how-the-construction-works>

For orientation, fix a scale $t > 0$ and write the activity as $e^(t h)$. The normalized pressure is the thermodynamic limit of

$ frac(1, t L^3) log sum_(N gt.eq 0) e^(t h N) Z_(Lambda_L \, N)^Phi \( beta \) . $

It is a convex function of $\( beta \, h \)$. A supporting vector $\( s \, d \)$ at $\( beta_0 \, h_0 \)$ gives an affine plane of slope $\( s \, d \)$ lying below that function and touching it there. The coordinate $d$ represents density. The proof will preserve a two-dimensional ball of these vectors, so that one density is compatible with more than one first-coordinate slope.

The proof follows four steps.

+ #strong[Build a stable reference gas.] The core allows pairs at an extremely small separation shell at no energy cost. At most four particles can have all their pair distances in that shell in $bb(R)^3$. This geometric fact supplies a quadratic local lower bound for the energy. Section 2 uses that bound to establish the canonical thermodynamic limit and its dual grand-canonical pressure. The scaled function $beta f_Phi \( beta \, rho \) \/ t$ is concave in inverse temperature.
+ #strong[Create three competing pressure branches.] For a large scale parameter $t$, the grand-canonical activity is $e^(t h)$. The reference pressure has three limiting branches, corresponding to empty space, well-separated particles, and tetrahedral clusters. Adding a spread-out radial attraction contributes a positive quadratic density term to the variational formula for pressure. Sections 3 and 4 establish this comparison and produce a pressure with three noncollinear groups of supporting slopes.
+ #strong[Preserve those slopes at finite ranges.] Uniform approximation alone can smooth a corner. Section 5 therefore works at the scale of each new attractive mass: the physical approximation error is smaller than that scale, while the density quadratic separates the three groups. At each stage this yields a nearby point with the same ball of supporting slopes.
+ #strong[Pass to one potential and a density interval.] Section 6 chooses the attraction masses before the corresponding approximation ranges. Their summability gives one admissible potential, and summable shifts give one limiting pressure point. The common ball of supporting slopes passes to that physical pressure. Every horizontal slice near the center of the ball fixes a positive density and gives two different inverse-temperature slopes of the canonical free energy at the same critical point.

The elementary convex facts used in these steps are proved in Appendix 7. They include local uniform convergence, partial conjugacy, and representation of a subdifferential by limits of ordinary gradients.

== 2 A stable class with four-particle clusters <sec:model>

We first construct a class of potentials for which thermodynamic limits exist and the required density bounds are uniform in the ranges of the attractive interactions. The positive core permits small clusters of at most four particles without an energy cost. Its quadratic penalty for larger local populations will control every attractive term added later.

=== 2.1 The packing density and the core <the-packing-density-and-the-core>

Let $M_L$ be the largest cardinality of a subset of $Lambda_L = \[ - L \/ 2 \, L \/ 2 \]^3$ whose distinct points have distance at least one. The number is finite, and compactness gives a maximizing configuration. There is a constant

#[#set math.equation(numbering: n => "(2.1)")
 $ p = lim_(L arrow.r oo) M_L / L^3 in \( 0 \, oo \) \, #h(2em) A = frac(3, 2 p) . $ <eq:packing-density>]

Here we need only the existence of $p$, not its numerical value. Disjoint balls of radius $1 \/ 2$ around the packing points lie in the cube of side $L + 1$, giving an upper bound on $M_L \/ L^3$ for $L gt.eq 1$. A unit lattice gives a positive lower bound. For convergence, repeat a maximizing packing in a cube of side $s$ with period $s + 1$ in each coordinate. Points in different copies are still separated by at least one, so

$ liminf_(L arrow.r oo) M_L / L^3 gt.eq frac(M_s, \( s + 1 \)^3) . $

Letting $s arrow.r oo$ along a sequence realizing the limsup proves (2.1).

Fix

$ delta = 10^(- 3) \, #h(2em) b = 1 / 4 . $

For a parameter $t > 1$, put $E = t^2$ and $e_t = e^(- t)$. Define the radial nonnegative core, with $r = \| x \|$, by

#[#set math.equation(numbering: n => "(2.2)")
 $ psi_t \( x \) = cases(delim: "{", + oo \, & r = 0 \,, E + \( e_t \/ r \)^12 \, & 0 < r < e_t \,, 0 \, & e_t lt.eq r lt.eq \( 1 + delta \) e_t \,, E \, & \( 1 + delta \) e_t < r < 1 \,, 0 \, & r gt.eq 1 .) $ <eq:core>]

Thus particles can approach one another without paying the energy $E$ only when their separation lies in a narrow shell of radius $e_t$. We allow $t$ to vary until the initial pressure configuration has been constructed; thereafter one sufficiently large finite value will be fixed.

Choose a nonnegative radial function $w in C^1 \( bb(R)^3 \)$, supported in the unit ball, strictly positive on the closed ball of radius $1 \/ 2$, and normalized by $integral_(bb(R)^3) w \( x \) thin thin upright(d) x = 1$. For $R gt.eq 1$ set $w_R \( x \) = R^(- 3) w \( x \/ R \)$. Our class consists of

#[#set math.equation(numbering: n => "(2.3)")
 $ phi = psi_t - S \, #h(2em) S = t sum_j sigma_j w_(R_j) \, #h(2em) R_j gt.eq 1 \, quad sigma_j gt.eq 0 \, quad sum_j sigma_j lt.eq A + 1 . $ <eq:physical-class>]

The sum may be finite, empty, or countably infinite. Since $parallel w_R parallel_oo lt.eq parallel w parallel_oo$ and $parallel w_R parallel_1 = 1$, it converges uniformly and in $L^1$ in the infinite case. In particular, $S$ is a bounded continuous nonnegative function. Every potential in this class is nonpositive at distances at least one. This sign will give a direct proof of the canonical thermodynamic limit.

Partition $bb(R)^3$ into half-open cubes $C_i$ of side $b$, indexed by $i in bb(Z)^3$. For a finite configuration, let $n_i$ be the number of its particles in $C_i$. In a finite cube we intersect these cells with the cube; every resulting cell has volume at most $b^3$. Set

#[#set math.equation(numbering: n => "(2.4)")
 $ J_(i j) = sup_(x in C_i \, thin y in C_j) S \( x - y \) \, #h(2em) sum_j J_(i j) lt.eq M \, #h(2em) M = c_b t \( A + 1 \) \, $ <eq:cell-row>]

where $c_b$ depends only on $b$ and $w$. To see the row bound, first use one kernel $w_R$. Each nonzero cell supremum is at most $parallel w parallel_oo R^(- 3)$, and there are at most $C_b R^3$ cells within distance $R$ of a given cell because $R gt.eq 1$. Sum this bound over the coefficients $t sigma_j$. Taking a supremum of a sum only decreases the result relative to the sum of suprema. The same proof therefore applies to infinitely many ranges and to cropped cells.

#thm([Lemma 2.1.])[
  (The shell graph).  #emph[No five points in $bb(R)^3$ have all their mutual distances in $\[ e_t \, \( 1 + delta \) e_t \]$. Consequently, a graph whose vertices are points of $bb(R)^3$ and whose edges join pairs at these distances has at most $3 n^2 \/ 8$ edges on any set of $n$ vertices.]
] <lem:shell-graph>

#proof[
  Suppose that five such points existed. Scale by $e_t^(- 1)$ and form the Gram matrix $G$ of the four vectors from one point to the other four. Write $epsilon = 2 delta + delta^2$. The diagonal entries differ from 1 by at most $epsilon$. By the polarization identity, each off-diagonal entry differs from $1 \/ 2$ by at most $epsilon$. The matrix $G_0$ with diagonal 1 and off-diagonal $1 \/ 2$ has smallest eigenvalue $1 \/ 2$, whereas
  $ parallel G - G_0 parallel_(upright("op")) lt.eq 4 epsilon = 0.008004 < 1 / 2 . $
  Thus $G$ would have rank four, which is impossible for four vectors in $bb(R)^3$.
  For completeness, we give the weighted proof of the required graph bound, an instance of the Motzkin–Straus identity #cite(label("MotzkinStraus1965")) Theorem 1. For a graph with no complete subgraph on five vertices, maximize
  $ sum_({ i \, j } upright(" an edge")) a_i a_j quad upright("over") quad a_i gt.eq 0 \, #h(2em) sum_i a_i = 1 . $
  Choose a maximizer with the smallest possible support. If two vertices in its support are nonadjacent, transferring all their combined weight to the one with the larger weighted neighbor sum cannot decrease the objective. It decreases the support, a contradiction. The support is therefore a clique with at most four vertices. At this maximizer the objective is
  $ 1 / 2 (1 - sum_i a_i^2) lt.eq 3 / 8 . $
  Applying this inequality to the weights $a_i = 1 \/ n$ gives the asserted edge count. The case $n = 0$ is immediate. ◻
]

#thm([Proposition 2.2.])[
  (Uniform stability).  #emph[Put $A_0 = E \/ 8$ and $B_0 = E \/ 2$. Every potential in (2.3) satisfies, for every finite configuration, 
#[#set math.equation(numbering: n => "(2.5)")
 $ sum_(ell < k) psi_t \( x_ell - x_k \) gt.eq A_0 sum_i n_i^2 - B_0 N \, #h(2em) U_N^phi gt.eq \( A_0 - M \/ 2 \) sum_i n_i^2 - B_0 N . $ <eq:superstable>]

 These inequalities remain valid if positive core interactions between members of a partition into unions of whole cells are deleted, or if any negative interactions are multiplied by factors in $\[ 0 \, 1 \]$.]
] <prop:stability>

#proof[
  The diameter of a cell is $sqrt(3) \/ 4 < 1$. Among the $n_i \( n_i - 1 \) \/ 2$ pairs inside cell $i$, at most $3 n_i^2 \/ 8$ lie in the shell by Lemma 2. Every other pair has core energy at least $E$. Thus the core energy inside this cell is at least
  $ E (frac(n_i \( n_i - 1 \), 2) - frac(3 n_i^2, 8)) = A_0 n_i^2 - B_0 n_i . $
  All remaining core interactions are nonnegative. Also,
  $ sum_(ell < k) S \( x_ell - x_k \) lt.eq 1 / 2 sum_(i \, j) J_(i j) n_i n_j lt.eq M / 2 sum_i n_i^2 \, $
  where the first bound includes harmless self-particle terms and the second follows from symmetry, (2.4), and $2 n_i n_j lt.eq n_i^2 + n_j^2$. This proves (2.5). The permitted deletions preserve every core interaction within a small cell. Reducing a negative term only increases the energy, so the same argument proves the last assertion. ◻
]

From now on we require $t$ to be sufficiently large that

#[#set math.equation(numbering: n => "(2.6)")
 $ 2 \( 1 + delta \) e_t < 1 \, #h(2em) A_0 gt.eq 8 M \, #h(2em) kappa := \( A_0 - M \/ 2 \) b^3 > 10 t \( A + 1 \) . $ <eq:t-choice>]

These conditions hold for all sufficiently large $t$, since $A_0$ is quadratic in $t$ and $M$ is linear in $t$. In particular every potential in the class is stable with constant $B_0$.

Each such potential is finite and locally bounded away from the origin and diverges to $+ oo$ there. Its tail is integrable, since $phi = - S$ outside the unit ball. If one coefficient is positive and its range is greater than 4, the potential is strictly negative uniformly on $1 lt.eq \| x \| lt.eq 2$: the corresponding rescaled kernel has a positive minimum there, while the core vanishes. Thus a potential with this additional simple condition has all the admissibility properties in the introduction. We next establish its thermodynamics, uniformly for the larger class (2.3).

=== 2.2 The canonical limit for every density <the-canonical-limit-for-every-density>

Fix for the moment a value of $t$ satisfying (2.6) and a potential $phi$ in (2.3). Write $Z_(L \, n) \( beta \) = Z_(Lambda_L \, n)^phi \( beta \)$, including $Z_(L \, 0) = 1$, and set

$ a_L \( beta \, n \) = - frac(log Z_(L \, n) \( beta \), t L^3) . $

We use $0 log 0 = 0$. The following proposition includes convergence along every sequence of particle numbers with a prescribed limiting density; that form will be needed in the long-range comparison.

#thm([Proposition 2.3.])[
  (Canonical and grand-canonical limits).  #emph[For every $beta > 0$ and $d gt.eq 0$ there is a finite limit 
#[#set math.equation(numbering: n => "(2.7)")
 $ H_phi \( beta \, d \) = - lim_(L arrow.r oo\
n \/ L^3 arrow.r d) frac(log Z_(L \, n) \( beta \), t L^3) \, #h(2em) H_phi \( beta \, 0 \) = 0 . $ <eq:canonical-limit>]

 Extend $H_phi \( beta \, d \)$ by $+ oo$ for $d < 0$. It is closed and convex in $d$, and finite and concave in $beta$ for every $d gt.eq 0$. Moreover, 
#[#set math.equation(numbering: n => "(2.8)")
 $ H_phi \( beta \, d \) gt.eq frac(beta kappa, t) d^2 - frac(beta B_0, t) d + frac(d log d - d, t) #h(2em) \( d gt.eq 0 \) . $ <eq:coercivity>]

 Let $Omega = \( 0 \, oo \) times bb(R)$, with coordinates $\( beta \, h \)$, and define 
$ Xi_L^phi \( beta \, h \) = sum_(n gt.eq 0) e^(t h n) Z_(L \, n) \( beta \) . $

 Then the finite convex pressure is 
#[#set math.equation(numbering: n => "(2.9)")
 $ Q_phi \( beta \, h \) = lim_(L arrow.r oo) frac(log Xi_L^phi \( beta \, h \), t L^3) = sup_(d gt.eq 0) { h d - H_phi \( beta \, d \) } . $ <eq:pressure-duality>]

 The convergence is uniform on compact subsets of $Omega$, and 
#[#set math.equation(numbering: n => "(2.10)")
 $ H_phi \( beta \, d \) = sup_(h in bb(R)) { h d - Q_phi \( beta \, h \) } #h(2em) \( d in bb(R) \) . $ <eq:partial-conjugacy>]

 The bounds above use the same constants for the entire class (2.3) with the chosen $t$.]
] <prop:thermodynamics>

#proof[
  We give the details of the canonical limit first. Two finite-volume bounds control the density adjustments in its construction.
  #emph[A trial bound on bounded density intervals.] Fix $D_0 < oo$ and choose a grid spacing $q in \( 0 \, 1 \/ 2 \)$ with $q^(- 3) > D_0 + 1$. For large $L$, at least $D_0 L^3$ grid centers lie in $Lambda_L$ at distance $q \/ 8$ from its boundary. For $n lt.eq D_0 L^3$, put one particle in each of $n$ distinct balls of radius $q \/ 8$ around such centers. Every pair has distance at least $3 q \/ 4$, and each particle has at most $C q^(- 3)$ neighbors at distance less than one. The core is bounded on $\[ 3 q \/ 4 \, 1 \]$, so the positive energy of these configurations is at most $E_q n$ for a finite constant $E_q$. We need not count the negative energy. The $n !$ assignments of the labeled particles to the balls have disjoint integration regions and cancel the canonical factorial. If $v_q > 0$ is the volume of a ball, this gives
  $ Z_(L \, n) \( beta \) gt.eq v_q^n e^(- beta E_q n) . $
  Consequently
  #[#set math.equation(numbering: n => "(2.11)")
   $ a_L \( beta \, n \) lt.eq C_(D_0 \, beta) #h(2em) \( 0 lt.eq n lt.eq D_0 L^3 \, L upright(" sufficiently large") \) . $ <eq:trial-bound>]
  The constant is uniform over the physical class, and can be chosen uniformly for $beta$ in a compact subset of $\( 0 \, oo \)$.
  #emph[A lower bound.] There are at most $\( L \/ b + 2 \)^3$ cropped cells in $Lambda_L$. Cauchy–Schwarz in (2.5) and the inequality $n ! gt.eq \( n \/ e \)^n$ therefore give, with $d_L = n \/ L^3$,
  #[#set math.equation(numbering: n => "(2.12)")
   $ a_L \( beta \, n \) gt.eq frac(beta kappa, t \( 1 + 2 b \/ L \)^3) d_L^2 - frac(beta B_0, t) d_L + frac(d_L log d_L - d_L, t) . $ <eq:finite-coercivity>]
  Dropping the positive quadratic term also gives the same inequality with only its last two terms. In particular, $Z_(L \, n)$ is positive and finite, and $a_L$ is bounded above and below when the density stays in a fixed bounded interval and $L$ is large.
  #emph[Convergence at a positive density.] Fix $beta > 0$ and $d > 0$. The increasing infima
  $ I_j = inf {a_L \( beta \, n \) : L gt.eq j \, med lr(|n \/ L^3 - d|) lt.eq 1 \/ j} $
  converge to a finite number $I$. Select $ell_j gt.eq j$ and $n_j$ in this set such that $a_(ell_j) \( beta \, n_j \) lt.eq I_j + 1 \/ j$. Then $n_j \/ ell_j^3 arrow.r d$ and $a_(ell_j) \( beta \, n_j \) arrow.r I$. Every sequence with $L arrow.r oo$ and $n \/ L^3 arrow.r d$ has liminf at least $I_j$ for each $j$, and hence at least $I$.
  To prove the reverse inequality, tile part of a large cube by
  $ k = ⌊frac(L, ell_j + 2)⌋^3 $
  cubes of side $ell_j$, leaving gaps of width two. Every interaction between distinct cubes is nonpositive. For any prescribed counts $m_1 \, dots.h \, m_k$, restricting the integral to these cubes gives
  #[#set math.equation(numbering: n => "(2.13)")
   $ Z_(L \, sum_i m_i) \( beta \) gt.eq product_(i = 1)^k Z_(ell_j \, m_i) \( beta \) . $ <eq:separated-boxes>]
  Indeed there are $\( sum_i m_i \) ! \/ product_i m_i !$ assignments of labels to the cubes, and these give exactly the factorials on the right.
  Start with $n_j$ particles in every small cube. Define a higher count $n_(upright("hi")) = floor.l \( 4 d + 4 \) ell_j^3 floor.r$ and the diluted densities
  $ d_b = frac(n_j, \( ell_j + 2 \)^3) \, #h(2em) d_(upright("hi")) = frac(n_(upright("hi")), \( ell_j + 2 \)^3) . $
  For large $j$, $n_j > 0$, $n_(upright("hi")) > n_j$, and $d_b arrow.r d$, $d_(upright("hi")) arrow.r 4 d + 4$. If a target count $n$ exceeds $k n_j$, change some cubes to $n_(upright("hi"))$; if it is smaller, empty some cubes. One additional intermediate count realizes $n$ exactly. For fixed sufficiently large $j$, this is possible for all large $L$ with $n \/ L^3 arrow.r d$. The limiting upper fraction of changed cubes is at most
  $ c_j = max {frac(\( d - d_b \)_(+), d_(upright("hi")) - d_b) \, frac(\( d_b - d \)_(+), d_b)} \, #h(2em) c_j arrow.r 0 . $
  All new counts are bounded by $\( 4 d + 4 \) ell_j^3$, so their values of $a_(ell_j)$ have a common upper bound by (2.11). The baseline values are bounded in absolute value. Applying (2.13), taking the large-volume limit with $j$ fixed, and then letting $j arrow.r oo$ therefore gives
  $ limsup_(L arrow.r oo\
n \/ L^3 arrow.r d) a_L \( beta \, n \) lt.eq lim_(j arrow.r oo) (frac(ell_j, ell_j + 2))^3 #scale(x: 120%, y: 120%)[\(] a_(ell_j) \( beta \, n_j \) + C c_j #scale(x: 120%, y: 120%)[\)] = I . $
  The single intermediate cube contributes zero in the first limit. This proves the all-sequence convergence for $d > 0$.
  #emph[Zero density and convexity.] When $n \/ L^3 arrow.r 0$, the linear lower bound derived above has limit zero. For an upper bound, fix a sufficiently large side $ell$ and use separated cubes as in (2.13), with empty baseline. Fill some cubes with $floor.l ell^3 floor.r$ particles and at most one with an intermediate count. Their number is $o \( L^3 \)$, so (2.11) gives a limiting upper bound zero. Thus $H_phi \( beta \, 0 \) = 0$.
  For convexity, take $0 lt.eq d_1 < d_2$ and a density strictly between them. For a large fixed $ell$, use counts $floor.l d_1 ell^3 floor.r$ and $floor.l d_2 ell^3 floor.r$ in the separated cubes. The desired density lies strictly between their diluted densities for all sufficiently large $ell$. Choose their proportions to attain the target count, with at most one intermediate cube. Inequality (2.13), followed first by $L arrow.r oo$ and then by $ell arrow.r oo$, gives the convexity inequality for $H_phi \( beta \, dot.op \)$. The endpoint cases of that inequality are immediate.
  The function is finite and convex on $\[ 0 \, oo \)$, hence continuous on $\( 0 \, oo \)$. The linear lower bound gives lower semicontinuity at zero; since its value there is zero, extension by $+ oo$ to negative densities is a closed convex function. For each fixed density, Hölder’s inequality makes $- log Z_(L \, n) \( beta \)$ concave in $beta$. Passage to the limit gives finite concavity of $H_phi \( dot.op \, d \)$ on $\( 0 \, oo \)$. Finally (2.12) gives (2.8).
  We have established the canonical limit with enough control over particle number to pass to the grand-canonical ensemble. In particular, the density variable in the next maximization will not require a separate approximation of the canonical free energy.
  #emph[Pressure and conjugacy.] On a compact subset of $Omega$, (2.12) implies that, for sufficiently large $D$ and all large $L$,
  $ e^(t h n) Z_(L \, n) \( beta \) lt.eq e^(- c n^2 \/ L^3) #h(2em) \( n > D L^3 \) $
  with $c > 0$ independent of the potential in the class. The sum of these terms is exponentially small in $L^3$, whereas the term $n = 0$ is one. Among the remaining at most $floor.l D L^3 floor.r + 1$ terms, choose one of maximal size. Every subsequence has a further subsequence on which its density converges to some $d in \[ 0 \, D \]$. The all-sequence canonical limit identifies the limiting exponent as $h d - H_phi \( beta \, d \)$. Conversely, the term $n = floor.l d L^3 floor.r$ supplies this exponent as a lower bound for every $d gt.eq 0$. This proves (2.9).
  The finite-volume logarithms are finite and jointly convex in $\( beta \, h \)$, by Hölder’s inequality applied to their defining integrals and sums. The limit is finite by the density bound, and it is nonnegative because the empty configuration is allowed. Lemma 15, the finite-dimensional convex convergence principle of #cite(label("RockafellarWets1998")) Corollary 7.18, upgrades pointwise convergence to uniform convergence on compact subsets of the open convex set $Omega$. Finally, the closed convexity in density proved above permits the one-dimensional Fenchel biconjugacy identity, proved in Lemma 16 and treated in #cite(label("RockafellarWets1998")) Theorem 11.1, yielding (2.10). ◻
]

=== 2.3 The quadratic density transform <the-quadratic-density-transform>

We will compare a physical pressure with the pressure obtained by adding an attraction whose range tends to infinity. The appropriate variational expression is a quadratic modification in the density variable. For any physical pressure $Q = Q_phi$, write

$ H_Q \( beta \, d \) = sup_(h in bb(R)) { h d - Q \( beta \, h \) } . $

By (2.10), this is precisely the canonical function $H_phi$, including its value $+ oo$ for $d < 0$. For $0 lt.eq sigma lt.eq A + 1$, define

#[#set math.equation(numbering: n => "(2.14)")
 $ \( T_sigma Q \) \( beta \, h \) = sup_(d gt.eq 0) {h d - H_Q \( beta \, d \) + frac(beta sigma, 2) d^2} . $ <eq:transform>]

This definition does not assert that $T_sigma Q$ is itself the pressure of a finite-range pair potential. The next section proves the approximation by physical pressures that we shall use.

#thm([Proposition 2.4.])[
  (Bounds for the density transform).  #emph[Let $t$ satisfy (2.6). For every physical pressure $Q_phi$ in (2.3) and every $sigma in \[ 0 \, A + 1 \]$, the function $T_sigma Q_phi$ is finite and convex on $Omega$, nonnegative, and nondecreasing in $h$. The supremum in (2.14) is attained. For every compact $W subset Omega$, there is $D_W < oo$, depending only on $W \, t \, b \, w \, A$, such that every maximizing density belongs to $\[ 0 \, D_W \]$, uniformly over all potentials in the class and all these values of $sigma$. The transformed pressures are also uniformly bounded on $W$.]
] <prop:transform>

#proof[
  The value at $d = 0$ is zero. By (2.8), the objective in (2.14) is bounded above by
  #[#set math.equation(numbering: n => "(2.15)")
   $ h d - beta (kappa / t - sigma / 2) d^2 + frac(beta B_0, t) d - frac(d log d - d, t) . $ <eq:transform-coercivity>]
  Condition (2.6) gives a uniform positive lower bound on $kappa \/ t - sigma \/ 2$. On a compact set of $\( beta \, h \)$ with $beta$ bounded away from zero, the right side is therefore negative for every sufficiently large $d$, uniformly in the potential and in $sigma$. This proves the common density bound and the finite upper bound for the supremum. The objective is upper semicontinuous in $d$, since $H_Q \( beta \, dot.op \)$ is lower semicontinuous. It attains its maximum on the resulting compact interval.
  For each fixed $d gt.eq 0$, the function in braces in (2.14) is convex in $\( beta \, h \)$: the canonical function is concave in $beta$, and the other terms are affine. Their supremum is convex. Its monotonicity in $h$ follows from $d gt.eq 0$, and its nonnegativity from the zero-density choice. ◻
]

The normalizations are now fixed. In particular, for every positive density the free energy in the statement of the problem is

#[#set math.equation(numbering: n => "(2.16)")
 $ f_phi \( beta \, d \) = t / beta H_phi \( beta \, d \) . $ <eq:free-energy-normalization>]

For a real-valued function $F$ on a compact set $K$, write $parallel F parallel_K = sup_(x in K) \| F \( x \) \|$. All limits and finiteness statements in this section hold for every $beta > 0$, including for infinite sums in (2.3). The remaining task is to choose the attractive ranges and coefficients so that one of these canonical functions has two different temperature slopes at one fixed positive density.

== 3 Uniform estimates and the Kac approximation <sec:kac>

The next step relates a physical long-range attraction to the transform $T_sigma$ in (2.14). Throughout this section, $t$ satisfies (2.6) and is fixed. All uniform estimates concern the physical class (2.3) at this fixed $t$; they need not remain uniform as $t$ tends to infinity. The approximation is a form of the Lebowitz–Penrose limit, whose extension to superstable reference interactions is classical #cite(label("LebowitzPenrose1966")) #cite(label("GerardiEtAl1973")). We give the proof because we will need constants independent of the attraction ranges, including in auxiliary systems with some positive interactions removed.

=== 3.1 Local moments and continuity in the attractive tail <local-moments-and-continuity-in-the-attractive-tail>

Recall the cells $C_i$ of side $b$, their occupation numbers $n_i$, and the attractive interaction bounds $J_(i j)$ from (2.4). In a finite cube, consider the grand canonical measure with activity $e^(t h)$. We also allow two modifications: positive core interactions may be deleted between boxes that are unions of whole cells, and negative pair interactions may be multiplied by measurable symmetric factors in $\[ 0 \, 1 \]$. Every original cell retains its internal core interaction. Consequently, the lower bound (2.5) continues to hold.

#thm([Proposition 3.1.])[
  (Uniform local moments).  #emph[Fix a compact set $cal(K) subset Omega$. For all potentials in (2.3), all finite cubes, and all the modified systems just described, there is a constant $C_(cal(K))$ such that 
$ bb(E)_(beta \, h) \[ n_i n_j \] lt.eq C_(cal(K)) #h(2em) \( \( beta \, h \) in cal(K) \) $

 for every pair of cells meeting the cube. The constant is independent of the number and ranges of the attractive summands.]
] <prop:moments>

#proof[
  Condition on the configuration $Y$ outside $C_i$, and put
  $ A_i \( Y \) = sum_(j eq.not i) J_(i j) n_j \, #h(2em) c = frac(beta A_0, 4) . $
  The interactions involving the $n$ particles inside $C_i$ are bounded below by
  $ \( A_0 - J_(i i) \/ 2 \) n^2 - B_0 n - n A_i . $
  The empty cell contributes one to the conditional partition function. Its volume is at most $b^3$, also when cropped by the cube boundary. It follows that
  $ bb(E) \[ e^(c n_i^2) divides Y \] & lt.eq sum_(n gt.eq 0) frac(b^(3 n), n !) exp #h(-0.16667em) (c n^2 + t h n - beta \( A_0 - J_(i i) \/ 2 \) n^2 + beta B_0 n + beta n A_i)\
 & lt.eq C_1 exp \( beta A_i^2 \/ A_0 \) . $
  Indeed, $beta n A_i lt.eq beta A_0 n^2 \/ 4 + beta A_i^2 \/ A_0$; after this estimate the remaining negative quadratic coefficient is at least
  $ beta \( A_0 \/ 2 - M \/ 2 \) gt.eq 7 beta A_0 \/ 16 . $
  The resulting one-variable series is bounded uniformly on $cal(K)$. The conditional bound still depends on $Y$. We remove that dependence by a finite-volume bootstrap.
  Let $F_i = bb(E) \[ e^(c n_i^2) \]$. These numbers are finite before the bootstrap: multiplying the grand canonical integrand by $e^(c n_i^2)$ leaves a strictly negative quadratic in all cell counts, by (2.5). Cauchy–Schwarz with weights $J_(i j)$ gives
  $ A_i^2 lt.eq M sum_(j eq.not i) J_(i j) n_j^2 . $
  If $M > 0$, set $theta_(i j) = J_(i j) \/ M$ and $alpha = 4 \( M \/ A_0 \)^2 < 1$. Then $c alpha = beta M^2 \/ A_0$. The row weights sum to at most one; place any missing weight on a value zero. Convexity of the exponential and then concavity of $x^alpha$ give
  $ F_i lt.eq C_1 (1 + sup_j F_j^alpha) . $
  There are finitely many cells, so their maximum is bounded by a constant depending only on $C_1 \, alpha$. When $M = 0$, the conditional estimate already gives $F_i lt.eq C_1$. Since $beta$ is bounded away from zero on $cal(K)$, this proves uniform second moments. A final Cauchy–Schwarz inequality proves the assertion. ◻
]

This is a direct version of the local-occupancy estimates associated with superstability #cite(label("Ruelle1970")). Its extra uniformity will control both the infinite tail and the boundary errors in the Kac comparison.

#thm([Proposition 3.2.])[
  (Attractive perturbations).  #emph[Fix a compact set $cal(K) subset Omega$. For two of the preceding finite-volume systems differing by a negative interaction, let $J_(i j)^(upright("diff"))$ be cellwise suprema of its absolute value. If the linear interpolation stays within the same attractive mass bound, then 
#[#set math.equation(numbering: n => "(3.1)")
 $ \| log Xi \( 1 \) - log Xi \( 0 \) \| lt.eq frac(beta C_(cal(K)), 2) sum_(i \, j) J_(i j)^(upright("diff")) #h(2em) \( \( beta \, h \) in cal(K) \) . $ <eq:pressure-interpolation>]

 In particular, for 
$ phi = psi_t - t sum_(j gt.eq 1) sigma_j w_(R_j) \, #h(2em) phi_n = psi_t - t sum_(j lt.eq n) sigma_j w_(R_j) \, $

 there is a range-independent constant $C'_(cal(K))$ such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ parallel Q_phi - Q_(phi_n) parallel_(cal(K)) lt.eq C'_(cal(K)) sum_(j > n) sigma_j . $ <eq:tail-continuity>]

]
] <prop:tail>

#proof[
  Differentiate the logarithm of the grand partition function along the interpolation. The absolute derivative is at most
  $ beta / 2 sum_(i \, j) J_(i j)^(upright("diff")) thin bb(E) \[ n_i n_j \] . $
  Including particle self pairs only enlarges this bound. Differentiation under the integrals and sums is valid by the common negative quadratic in the finitely many cell counts. Proposition 6 and integration over the interpolation parameter prove (3.1).
  For the tail difference, each row sum is at most $c_b t sum_(j > n) sigma_j$, and the number of cells is at most $\( L \/ b + 2 \)^3$. Divide (3.1) by $t L^3$, use the pressure limit in Proposition 4, and let $L arrow.r oo$. The bounds are uniform on $cal(K)$, proving (3.2). ◻
]

=== 3.2 One long-range attraction <one-long-range-attraction>

#thm([Proposition 3.3.])[
  (Physical Kac approximation).  #emph[Let 
$ phi = psi_t - t sum_(j = 1)^k sigma_j w_(R_j) $

 have finitely many attractive summands, with the empty sum allowed. Fix $sigma gt.eq 0$ such that $sum_(j = 1)^k sigma_j + sigma lt.eq A + 1$. Then 
#[#set math.equation(numbering: n => "(3.3)")
 $ Q_(phi - t sigma w_R) arrow.r T_sigma Q_phi quad upright("as ") R arrow.r oo $ <eq:kac-limit>]

 uniformly on compact subsets of $Omega$.]
] <prop:kac>

#proof[
  Fix the reference potential, and let $R_0$ bound its interaction range. All constants depending on $R_0$ are fixed during this proof. Partition a cube of side $L = m u$ into $m^3$ boxes of side
  $ u = b ⌊R^(1 \/ 2) \/ b⌋ . $
  Translate the $b$-cell lattice, if necessary, to align it with the outside cube; all preceding estimates are invariant under this translation. The $u$-boxes are then unions of whole $b$-cells. For each $R$, we first let $m arrow.r oo$; only afterward do we let $R arrow.r oo$. In particular $u arrow.r oo$, $u \/ R arrow.r 0$, and eventually $u gt.double R_0$.
  Write $B_z$ for the box centered at $z$, and define
  $ K_(z z')^(+) = sup_(x in B_z \, med y in B_(z')) w_R \( x - y \) \, #h(2em) K_(z z')^(-) = #scale(x: 120%, y: 120%)[\(] w_R \( z - z' \) - C u \/ R^4 #scale(x: 120%, y: 120%)[\)]_(+) . $
  Choose the fixed constant $C$ large enough that $K_(z z')^(-)$ is at most the corresponding infimum. The $C^1$ bound on $w$ and its compact support imply, for some $eta_R = O \( u \/ R \) arrow.r 0$,
  #[#set math.equation(numbering: n => "(3.4)")
   $ u^3 sum_(z') K_(z z')^(+) lt.eq 1 + eta_R . $ <eq:kac-rows>]
  If $z$ is farther than $R + 3 u$ from the outside cube boundary, then
  #[#set math.equation(numbering: n => "(3.5)")
   $ sum_(z') K_(z z')^(-) gt.eq \( 1 - eta_R \) u^(- 3) . $ <eq:kac-lower-row>]
  Here the sums are over the finite center grid in the cube. To check these estimates, compare $u^3 sum_(z') w_R \( z - z' \)$ with $integral w_R = 1$. The oscillation in each grid cube is $O \( u R^(- 4) \)$, and only $O \( \( R \/ u \)^3 \)$ cubes meet the support enlarged by $3 u$. The total error after multiplication by $u^3$ is $O \( u \/ R \)$. The same argument controls the suprema and the truncated lower kernel. Also $K_(z z')^plus.minus lt.eq C R^(- 3)$.
  ===== 3.2.1 Upper bound. <upper-bound.>
  Delete all positive core interactions between the $u$-boxes. This increases the partition function. Remove next the reference attractive interactions between these boxes, keeping the new Kac attraction in place. By Proposition 7, this second change costs at most $C_(cal(K) \, R_0) L^3 \/ u$ in the logarithm. Indeed only original cells within $R_0 + 2 b$ of a box boundary have a nonzero difference row, and there are $O_(R_0) \( L^3 \/ u \)$ such cells. Proposition 6 applies throughout this interpolation.
  Write $n_z$ for the count in the box centered at $z$. The long-range pair sum is at most
  $ 1 / 2 sum_(z \, z') K_(z z')^(+) n_z n_(z') lt.eq frac(1 + eta_R, 2 u^3) sum_z n_z^2 \, $
  where the last step uses symmetry and $n_z n_(z') lt.eq \( n_z^2 + n_(z')^2 \) \/ 2$. The first bound includes self pairs, which is harmless for this upper estimate of an attractive Boltzmann factor. The remaining reference interactions are confined to individual boxes. Summing the assignments of particle labels cancels the global canonical factorial and gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ Xi_(m u)^(phi - t sigma w_R) lt.eq exp \( C_(cal(K) \, R_0) L^3 \/ u \) [sum_(n gt.eq 0) e^(t h n) Z_(u \, n)^phi \( beta \) exp #h(-0.16667em) (frac(beta t sigma \( 1 + eta_R \), 2 u^3) n^2)]^(m^3) . $ <eq:kac-upper>]
  The finite-volume bound (2.12) and $kappa > 10 t \( A + 1 \)$ leave the effective energy coefficient
  $ frac(kappa, \( 1 + 2 b \/ u \)^3) - frac(t sigma \( 1 + eta_R \), 2) > 0 $
  uniformly away from zero for all sufficiently large $R$. Consequently counts $n \/ u^3 > D$, for sufficiently large $D$, are suppressed by a uniform negative quadratic. The sum of these high-count terms is exponentially small compared with the empty term. Among the remaining $O \( u^3 \)$ terms, every maximizing subsequence has a further subsequence with $n \/ u^3 arrow.r d in \[ 0 \, D \]$. The all-sequence limit (2.7) then gives
  $ lim_(R arrow.r oo) frac(1, t u^3) log #h(-0.16667em) [sum_(n gt.eq 0) e^(t h n) Z_(u \, n)^phi \( beta \) exp #h(-0.16667em) (frac(beta t sigma \( 1 + eta_R \), 2 u^3) n^2)] = sup_(d gt.eq 0) {h d - H_phi \( beta \, d \) + frac(beta sigma d^2, 2)} . $
  The logarithm of the number of low-count terms divided by $u^3$ vanishes. This proves the equality by the preceding upper subsequence argument and by taking $n = floor.l d u^3 floor.r$ for the lower bound. Taking first $m arrow.r oo$ in (3.6) and then $R arrow.r oo$ proves the desired upper estimate.
  ===== 3.2.2 Lower bound. <lower-bound.>
  Place a cube of side $s = u - 2$ at each of the same centers, and require exactly $n = floor.l d s^3 floor.r$ particles in every smaller cube, where $d gt.eq 0$ is fixed. The gaps have width two. Thus all reference interactions between distinct smaller cubes are nonpositive and can be discarded in a lower bound on the partition function. Let $m_(upright("int"))$ be the number of centers satisfying the interior condition in (3.5). The Kac pair sum obeys
  $ sum_(ell < j) w_R \( x_ell - x_j \) gt.eq 1 / 2 m_(upright("int")) n^2 u^(- 3) \( 1 - eta_R \) - 1 / 2 m^3 n C R^(- 3) . $
  The last term removes the particle self pairs included in the diagonal box contribution. The count constraint and the canonical factorials therefore give
  $ Xi_(m u)^(phi - t sigma w_R) gt.eq  & (e^(t h n) Z_(s \, n)^phi \( beta \))^(m^3)\
 &  times exp #h(-0.16667em) {frac(beta t sigma, 2) [m_(upright("int")) n^2 u^(- 3) \( 1 - eta_R \) - m^3 n C R^(- 3)]} . $
  For fixed $R$, $m_(upright("int")) \/ m^3 arrow.r 1$ as $m arrow.r oo$. Next $R arrow.r oo$ gives $s \/ u arrow.r 1$, $n \/ s^3 arrow.r d$, and a vanishing self-pair error. By (2.7), the resulting pressure lower bound is
  $ h d - H_phi \( beta \, d \) + frac(beta sigma d^2, 2) . $
  Take the supremum over $d gt.eq 0$.
  We have proved pointwise convergence in (3.3). The functions on both sides are finite and convex on the open convex set $Omega$, by Propositions 4 and 5. Pointwise convergence of finite convex functions to a finite convex function is uniform on compact subsets, which completes the proof. ◻
]

The proposition uses boxes only in its upper and lower estimates. Both sides of (3.3) are built from the full radial reference interaction. At every later stage we will fix the finite reference first and then choose a sufficiently large new range; no uniform rate over changing reference ranges is required.

== 4 An initial triple of supporting slopes <sec:triple>

We now choose $t$ so that the ideal transform $T_A Q_(psi_t)$ has three separated groups of supporting slopes. The core permits zero-energy clusters of sizes $m = 1 \, 2 \, 3 \, 4$. After one root is positioned, each of the other $m - 1$ particles has a relative position in a region of volume proportional to $e^(- 3 t)$. With activity $e^(t h)$, the leading exponent per cluster, divided by $t$, is therefore

$ m h - 3 \( m - 1 \) . $

This expression is affine in $m$, so its maximum over the four allowed sizes occurs at $m = 1$ or $m = 4$. Using the limiting packing density $p$, together with the empty configuration, gives the three branches in the next proposition. The proof below controls configurations that pay a positive core energy as well.

=== 4.1 The free-cluster limit <the-free-cluster-limit>

Write $q_t = Q_(psi_t)$. In this section we temporarily let $t arrow.r oo$; one value will be fixed at its end. The packing density $p$ and $A = 3 \/ \( 2 p \)$ retain their definitions from Section 2.

#thm([Proposition 4.1.])[
  (Reference pressure).  #emph[Uniformly on compact subsets of $Omega$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ q_t \( beta \, h \) arrow.r q_(*) \( h \) := max \( 0 \, p h \, 4 p h - 9 p \) . $ <eq:free-pressure-limit>]

]
] <prop:free-pressure>

#proof[
  Call a configuration free if every pair distance below one lies in $\[ e^(- t) \, \( 1 + delta \) e^(- t) \]$. Join points at distance below one. A two-edge path has endpoint distance at most $2 \( 1 + delta \) e^(- t) < 1$; freeness makes the endpoints adjacent. Thus connected components are complete graphs. The geometric estimate in Lemma 2 bounds their sizes by four. Representatives from different components are separated by at least one, so their number is at most $M_L$.
  Let $V = L^3$, and let $Xi_(upright("free"))$ denote the grand configurational integral restricted to free configurations. Root each component and integrate its root over volume $V$. Every other point in the component lies in a ball of volume at most $c_0 e^(- 3 t)$ about the root. The labeled block enumeration, followed by division by the canonical factorial, gives the upper bound
  #[#set math.equation(numbering: n => "(4.2)")
   $ Xi_(upright("free")) lt.eq sum_(k = 0)^(M_L) frac(\( V Theta_t \)^k, k !) \, #h(2em) Theta_t = sum_(m = 1)^4 frac(e^(t h m) \( c_0 e^(- 3 t) \)^(m - 1), \( m - 1 \) !) . $ <eq:free-enumeration>]
  For completeness, ordered component sizes give a factor $1 \/ \( k ! product m_i ! \)$; allowing any of the $m_i$ labels to be a root replaces $m_i !$ by $\( m_i - 1 \) !$ and only increases the count. Ignoring separation between the roots also enlarges the integral.
  A bad edge is a pair at distance below one but outside the allowed shell. If there are $B$ bad edges, their endpoint set $S$ has size at most $2 B$, its complement is free, and the core energy is at least $t^2 B$. Hence, pointwise on labeled configurations,
  $ e^(- beta U^(psi_t)) lt.eq sum_(S subset { 1 \, dots.h \, N }) e^(- beta t^2 \| S \| \/ 2) thin upright(bold(1))_({ upright("the complement of ") S upright(" is free") }) . $
  The term corresponding to the actual bad-edge endpoint set proves this inequality; zero Boltzmann factors cause no difficulty. Summing over particle numbers and integrating the removed particles gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ Xi_L^(psi_t) lt.eq exp #h(-0.16667em) (V e^(t h - beta t^2 \/ 2)) Xi_(upright("free")) . $ <eq:bad-particle-factor>]
  Now
  $ 1 / t log Theta_t arrow.r max_(1 lt.eq m lt.eq 4) { m h - 3 \( m - 1 \) } = max \( h \, 4 h - 9 \) . $
  The convergence is uniform for bounded $h$. For $u = k \/ V$, the factorial estimate $k ! gt.eq \( k \/ e \)^k$ bounds the remaining normalized logarithm in (4.2) by $u \( 1 - log u \) \/ t$, with value zero at $u = 0$. It is uniformly $o \( 1 \)$ for bounded $u$ as $t arrow.r oo$. There are only $M_L + 1 = O \( V \)$ terms. Take $L arrow.r oo$ first and use $M_L \/ V arrow.r p$. The extra pressure in (4.3) is $e^(t h - beta t^2 \/ 2) \/ t$, which tends to zero uniformly on compact subsets of $Omega$. This proves the upper limit in (4.1).
  For the lower limit, fix $ell > 0$ and $eta > 0$. Dilate an optimal $M_ell$-packing by $1 + eta$, and repeat it with cubic period
  $ P = \( 1 + eta \) \( ell + 2 \) . $
  In a cube of side $m P$, the $k = m^3 M_ell$ resulting centers have mutual distances at least $1 + eta$ and a fixed positive margin from the outside boundary. At each center put either one particle or four particles, using the same choice $m_0 in { 1 \, 4 }$ everywhere. The root ranges over a ball of fixed volume $v_0 > 0$, small compared with the separation margin. For $m_0 = 4$, put the other particles in relative balls of volume $v_1 e^(- 3 t)$ about the three other vertices of a regular tetrahedron of side $\( 1 + delta \/ 2 \) e^(- t)$. A sufficiently small fixed $v_1 > 0$ puts every internal distance in the shell. For all large $t$, distances between clusters exceed one.
  All these configurations have zero core energy. Assign unordered sets of $m_0$ labels to the $k$ centers and choose one deterministic ordering of each set for the root and vertices. Different assignments give disjoint integration regions, and the relative coordinates have Jacobian one. Thus
  $ Z_(m P \, m_0 k)^(psi_t) \( beta \) gt.eq (frac(v_0 \( v_1 e^(- 3 t) \)^(m_0 - 1), m_0 !))^k . $
  First let $m arrow.r oo$, then $t arrow.r oo$. The contribution to $q_t$ has lower limit
  $ M_ell / P^3 #scale(x: 120%, y: 120%)[\(] m_0 h - 3 \( m_0 - 1 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) m_0 = 1 \, 4 . $
  The empty configuration supplies zero. Finally let $ell arrow.r oo$ and $eta arrow.b 0$. This proves the pointwise limit. Local uniform convergence follows again from finite convex convergence on $Omega$. ◻
]

=== 4.2 The ideal transform and its maximizing densities <the-ideal-transform-and-its-maximizing-densities>

Let $H_t = H_(psi_t)$ and $P_1^t = T_A q_t$. We will need more than convergence of these functions: we must also locate all limits of their maximizing densities. For a finite convex function $F$ on an open convex set, write $partial F \( lambda \)$ for the vectors $v$ satisfying $F \( y \) gt.eq F \( lambda \) + v dot.op \( y - lambda \)$ throughout that set. These subgradients exist at every point, are locally bounded, and pass to limits under local uniform convergence. The last two claims follow by applying the supporting inequality to points on a fixed small ball about the argument.

#thm([Lemma 4.2.])[
  #emph[Uniformly on compact subsets of $Omega$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ P_1^t \( beta \, h \) arrow.r P_(*) \( beta \, h \) := max (0 \, med p h + frac(beta A p^2, 2) \, med 4 p h - 9 p + 8 beta A p^2) . $ <eq:ideal-three-planes>]

 Moreover, if $t_j arrow.r oo$, $\( beta_j \, h_j \) arrow.r \( beta \, h \) in Omega$, and $d_j$ maximizes the expression defining $P_1^(t_j) \( beta_j \, h_j \)$, then the $d_j$ are bounded. Every subsequential limit belongs to ${ 0 \, p \, 4 p }$ and maximizes the corresponding limiting expression.]
] <lem:initial-transform>

#proof[
  Applying the first inequality in (2.5) to the pure core gives (2.8) with $kappa = t^2 b^3 \/ 8$ and $B_0 = t^2 \/ 2$. Consequently
  $ H_t \( beta \, d \) gt.eq beta t (frac(b^3 d^2, 8) - d / 2) + frac(d log d - d, t) . $
  For large $t$, the quadratic in this bound dominates the added term $beta A d^2 \/ 2$. On a fixed compact parameter set, the transformed objective is negative for $d gt.eq D$, with $D$ independent of all large $t$. Since $d = 0$ gives zero, all maximizers lie in $\[ 0 \, D \]$.
  The partial conjugate of $q_(*)$ is
  $ H_(*) \( d \) = cases(delim: "{", 0 \, & 0 lt.eq d lt.eq p \,, 3 \( d - p \) \, & p lt.eq d lt.eq 4 p \,, + oo \, & upright("otherwise") .) $
  Consider a subsequence with $d_j arrow.r d$. For every $z in bb(R)$, Fenchel’s inequality gives
  $ P_1^(t_j) \( beta_j \, h_j \) lt.eq q_(t_j) \( beta_j \, z \) + \( h_j - z \) d_j + frac(beta_j A d_j^2, 2) . $
  Take the upper limit and then the infimum over $z$. The result is bounded by
  $ h d - H_(*) \( d \) + frac(beta A d^2, 2) . $
  In particular $d in \[ 0 \, 4 p \]$, since the transform is nonnegative. This objective is strictly convex on each of the two linearity intervals of $H_(*)$; its maximum is therefore the right side of (4.4).
  For the matching lower bound, choose a maximizing $d_0 in { 0 \, p \, 4 p }$ for this limiting objective. Its global optimality says that, for every $d'$,
  #[#set math.equation(numbering: n => "(4.5)")
   $ H_(*) \( d' \) gt.eq H_(*) \( d_0 \) + \( h + beta A d_0 \) \( d' - d_0 \) + frac(beta A, 2) \( d' - d_0 \)^2 . $ <eq:strict-density-support>]
  Thus $z = h + beta A d_0$ exposes the unique conjugate density $d_0$ for $q_(*)$. Set $z_j = h_j + beta_j A d_0$, and choose a subgradient $\( s'_j \, d'_j \) in partial q_(t_j) \( beta_j \, z_j \)$. The physical pressure is nondecreasing in $h$, so $d'_j gt.eq 0$; these are admissible densities for the transform. By Proposition 9 and (4.5), every cluster here is $\( 0 \, d_0 \)$. Fenchel equality at $d'_j$ therefore gives
  $ P_1^(t_j) \( beta_j \, h_j \) & gt.eq q_(t_j) \( beta_j \, z_j \) + \( h_j - z_j \) d'_j + frac(beta_j A \( d'_j \)^2, 2)\
 & arrow.r P_(*) \( beta \, h \) . $
  The upper and lower limits agree. Equality in the upper argument forces every limiting maximizing density to maximize the limiting objective, and strict convexity on its two intervals confines such densities to ${ 0 \, p \, 4 p }$. The argument allows moving parameters; it proves the assertions, including local uniform convergence. ◻
]

=== 4.3 Joint supports and the initial triple <joint-supports-and-the-initial-triple>

We next turn the maximizing densities into full supporting vectors. We first record the support identities needed for this step. For a finite convex function $F$ on $Omega$, let

$ G_F \( lambda \) = {lim_(j arrow.r oo) nabla F \( lambda_j \) : lambda_j arrow.r lambda \, quad F upright(" is differentiable at ") lambda_j} . $

Local Lipschitz continuity, almost-everywhere differentiability, and the supporting inequalities give the reachable-gradient formula #cite(label("RockafellarWets1998")) Theorem 9.61

#[#set math.equation(numbering: n => "(4.6)")
 $ partial F \( lambda \) = "conv" G_F \( lambda \) \, $ <eq:reachable-gradient-formula>]

where $G_F \( lambda \)$ is nonempty and compact. Lemma 17 proves this identity and the supporting facts in the planar setting needed here.

For a finite concave function of $beta > 0$, write $partial_beta^(+)$ for its superdifferential. Thus $e in - partial_beta^(+) H \( beta_0 \, d \)$ means

$ H \( beta \, d \) lt.eq H \( beta_0 \, d \) - e \( beta - beta_0 \) #h(2em) \( beta > 0 \) . $

The following identity links these canonical slopes to joint pressure supports.

#thm([Lemma 4.3.])[
  (Joint Fenchel supports).  #emph[Let $Q$ be finite and convex on $Omega$, and let 
$ H \( beta \, d \) = sup_(h in bb(R)) { h d - Q \( beta \, h \) } . $

 Fix $d gt.eq 0$ for which $H \( thin dot.op thin \, d \)$ is finite and concave. If $\( beta_0 \, z \) in Omega$ satisfies 
$ H \( beta_0 \, d \) = z d - Q \( beta_0 \, z \) \, $

 then 
#[#set math.equation(numbering: n => "(4.7)")
 $ { e in bb(R) : \( e \, d \) in partial Q \( beta_0 \, z \) } = - partial_beta^(+) H \( beta_0 \, d \) . $ <eq:joint-support-identity>]

]
] <lem:joint-support>

#proof[
  For $e$ in the right side and every $\( beta \, h \) in Omega$, the defining conjugate inequality gives
  $ Q \( beta \, h \) & gt.eq h d - H \( beta \, d \)\
 & gt.eq Q \( beta_0 \, z \) + e \( beta - beta_0 \) + d \( h - z \) . $
  This is the joint supporting inequality. Conversely, a support $\( e \, d \)$ gives
  $ h d - Q \( beta \, h \) lt.eq z d - Q \( beta_0 \, z \) - e \( beta - beta_0 \) $
  for every $h$. Take the supremum in $h$ to obtain the supergradient inequality for $H \( thin dot.op thin \, d \)$. ◻
]

The next observation records how a density maximizing a quadratic transform also supports the original pressure at a shifted field. It transfers the full supporting vector, including its first coordinate, which density convergence alone would not control.

#thm([Lemma 4.4.])[
  (Supports under a quadratic transform).  #emph[Let $t$ satisfy (2.6), let $Q = Q_phi$ for a potential in (2.3), and let $0 < a lt.eq A + 1$. Put $H = H_Q$ and $F = T_a Q$. Suppose that $d gt.eq 0$ attains the supremum defining $F \( beta \, h \)$ at $\( beta \, h \) in Omega$, and put $z = h + beta a d$. Then, for every $d' gt.eq 0$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ H \( beta \, d' \) gt.eq H \( beta \, d \) + z \( d' - d \) + frac(beta a, 2) \( d' - d \)^2 . $ <eq:quadratic-density-support>]

 The finite concave function $H \( thin dot.op thin \, d \)$ has a supergradient at $beta$. For every $e in - partial_beta^(+) H \( beta \, d \)$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ \( e \, d \) in partial Q \( beta \, z \) \, #h(2em) (e + frac(a d^2, 2) \, d) in partial F \( beta \, h \) . $ <eq:transform-support-transfer>]

 If $F$ is differentiable at $\( beta \, h \)$, the second vector equals $nabla F \( beta \, h \)$.]
] <lem:transform-support>

#proof[
  Compare the transformed objective at $d$ with its value at $d'$ and complete the square to obtain (4.8). Dropping the nonnegative quadratic shows that $z$ supports $H \( beta \, dot.op \)$ at $d$, so Fenchel equality holds. Lemma 11 gives the first inclusion in (4.9). For the second, the fixed-density branch
  $ \( beta' \, h' \) mapsto h' d - H \( beta' \, d \) + frac(beta' a d^2, 2) $
  lies below $F$ and agrees with it at $\( beta \, h \)$. The canonical supergradient $- e$ gives this branch the displayed supporting vector, which therefore supports $F$ as well. At a differentiability point there is only one supporting vector. ◻
]

The three planes in (4.4) meet at $lambda_(*) = \( 1 \, - 3 \/ 4 \)$. Their gradients are

#[#set math.equation(numbering: n => "(4.10)")
 $ v_1 = \( 0 \, 0 \) \, #h(2em) v_2 = \( A p^2 \/ 2 \, p \) = \( 3 p \/ 4 \, p \) \, #h(2em) v_3 = \( 8 A p^2 \, 4 p \) = \( 12 p \, 4 p \) . $ <eq:triangle-vertices>]

They are noncollinear, since $det \( v_2 \, v_3 \) = - 9 p^2 eq.not 0$. Fix their barycenter

#[#set math.equation(numbering: n => "(4.11)")
 $ g = frac(v_1 + v_2 + v_3, 3) = (frac(17 p, 4) \, frac(5 p, 3)) . $ <eq:fixed-center>]

Choose $tau > 0$ small enough that the closed balls

$ U_i = overline(B) \( v_i \, 4 tau \) \, #h(2em) i = 1 \, 2 \, 3 \, $

have strictly ordered disjoint projections onto the density coordinate, with the second projection contained in $\( 0 \, oo \)$, and have the following properties. Every triangle with one vertex in each $U_i$ is noncollinear and contains a common ball $overline(B) \( g \, gamma \)$, for some $gamma > 0$; also $g$ lies in the convex hull of no two of these balls. Such a choice follows from the strict interior position of $g$ in the original triangle and compactness. Set

$ r_0 = 1 / 4 \, #h(2em) W = overline(B) \( lambda_(*) \, r_0 \) subset Omega . $

These constants will remain fixed throughout the construction. Figure 1 illustrates the common-ball property and the separated density projections.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.6525, 0), (8.627, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.627, 0), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  line((0, -0.4725), (0, 4.883), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 4.883), [#text(size: 9pt)[$d$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (1.45, 2.1), (7.975, 4.2), close: true, fill: rgb("#f7f7f7"), stroke: none)
  line((0, 0), (1.45, 2.1), (7.975, 4.2), close: true, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10))
  line((0.116, 0.0735), (1.305, 2.173), (8.047, 4.064), close: true, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((0, 0), radius: (0.2465, 0.1785), fill: rgb("#ffecd9"), stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10))
  circle((1.45, 2.1), radius: (0.2465, 0.1785), fill: rgb("#ffecd9"), stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10))
  circle((7.975, 4.2), radius: (0.2465, 0.1785), fill: rgb("#ffecd9"), stroke: (paint: rgb("#a65300"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.03528, fill: black, stroke: none)
  circle((1.45, 2.1), radius: 0.03528, fill: black, stroke: none)
  circle((7.975, 4.2), radius: 0.03528, fill: black, stroke: none)
  circle((0.116, 0.0735), radius: 0.04233, fill: rgb("#595959"), stroke: none)
  circle((1.305, 2.173), radius: 0.04233, fill: rgb("#595959"), stroke: none)
  circle((8.047, 4.064), radius: 0.04233, fill: rgb("#595959"), stroke: none)
  content((0, 0), [#text(size: 9pt)[$U_1$]], anchor: "north-east", padding: 0.1176cm)
  content((1.45, 2.1), [#text(size: 9pt)[$U_2$]], anchor: "south-east", padding: 0.1176cm)
  content((7.975, 4.2), [#text(size: 9pt)[$U_3$]], anchor: "south-east", padding: 0.1176cm)
  circle((3.142, 2.1), radius: (0.174, 0.126), fill: rgb("#d1d1ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  circle((3.142, 2.1), radius: 0.03881, fill: black, stroke: none)
  content((3.142, 2.1), [#text(size: 9pt)[$g$]], anchor: "south-east", padding: 0.1176cm)
  line((3.335, 2.037), (5.147, 1.103), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((5.147, 1.082), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[$overline(B) (g, gamma )$#linebreak()same ball for every choice]]], anchor: "north", padding: 0.1176cm)
  line((9.28, -0.315), (9.28, 4.567), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10))
  line((9.28, -0.1785), (9.28, 0.1785), stroke: (paint: rgb("#a65300"), thickness: 2.4pt, miter-limit: 10))
  line((8.555, 0), (9.28, 0), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((9.28, 1.922), (9.28, 2.279), stroke: (paint: rgb("#a65300"), thickness: 2.4pt, miter-limit: 10))
  line((8.555, 2.1), (9.28, 2.1), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((9.28, 4.022), (9.28, 4.378), stroke: (paint: rgb("#a65300"), thickness: 2.4pt, miter-limit: 10))
  line((8.555, 4.2), (9.28, 4.2), stroke: (paint: rgb("#bfbfbf"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((9.454, 0), [#text(size: 9pt)[$pi_2U_1$]], anchor: "west", padding: 0.1176cm)
  content((9.454, 2.1), [#text(size: 9pt)[$pi_2U_2$]], anchor: "west", padding: 0.1176cm)
  content((9.454, 4.2), [#text(size: 9pt)[$pi_2U_3$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Schematic geometry of the three slope neighborhoods. The two triangles illustrate different choices of one point from each $U_i$. The choice of the neighborhoods guarantees $overline(B) \( g \, gamma \) subset "conv" { u_1 \, u_2 \, u_3 }$ for every $u_i in U_i$, while $g$ belongs to the convex hull of no two neighborhoods. Their density projections $pi_2 U_i$, where $pi_2 \( s \, d \) = d$, are disjoint. The actual supporting groups lie in $d gt.eq 0$, although $U_1$ extends below that line. ],
) <fig:robust-triple>

#thm([Proposition 4.5.])[
  (Initial supporting triple).  #emph[For all sufficiently large $t$, there are $lambda_1 in B \( lambda_(*) \, r_0 \/ 16 \)$ and nonempty compact convex sets $K_i^1 subset overline(B) \( v_i \, tau \/ 2 \)$, $i = 1 \, 2 \, 3$, such that 
#[#set math.equation(numbering: n => "(4.12)")
 $ g in partial P_1^t \( lambda_1 \) = "conv" #scale(x: 120%, y: 120%)[\(] K_1^1 union K_2^1 union K_3^1 #scale(x: 120%, y: 120%)[\)] . $ <eq:initial-triple>]

 All vectors in the $K_i^1$ have nonnegative density coordinate. In particular $partial P_1^t \( lambda_1 \)$ contains $overline(B) \( g \, gamma \)$.]
] <prop:initial-triple>

#proof[
  The function $P_(*) \( y \) - g dot.op y$ has its unique minimum at $lambda_(*)$. In fact
  $ P_(*) \( y \) - P_(*) \( lambda_(*) \) - g dot.op \( y - lambda_(*) \) = max_i \( v_i - g \) dot.op \( y - lambda_(*) \) gt.eq gamma_0 \| y - lambda_(*) \| $
  for some $gamma_0 > 0$, because the triangle of the $v_i$ contains a ball about $g$. Minimize $P_1^t \( y \) - g dot.op y$ over $overline(B) \( lambda_(*) \, r_0 \/ 16 \)$. Lemma 10 shows that all minimizers lie in the interior for large $t$ and converge to $lambda_(*)$ as $t arrow.r oo$. Choose one and call it $lambda_1^t$. Interior minimality gives $g in partial P_1^t \( lambda_1^t \)$. It remains to locate the slopes generating this subdifferential.
  We claim that any limit of gradients $nabla P_1^(t_j) \( beta_j \, h_j \)$, at differentiability points with $t_j arrow.r oo$ and $\( beta_j \, h_j \) arrow.r lambda_(*)$, belongs to ${ v_1 \, v_2 \, v_3 }$. Choose a maximizing density $d_j$ at each such point. Apply Lemma 12 with $Q = q_(t_j)$ and $a = A$, choosing $e_j in - partial_beta^(+) H_(t_j) \( beta_j \, d_j \)$. With $z_j = h_j + beta_j A d_j$, it gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ nabla P_1^(t_j) \( beta_j \, h_j \) = (e_j + frac(A d_j^2, 2) \, d_j) \, $ <eq:initial-gradient>]
  and
  #[#set math.equation(numbering: n => "(4.14)")
   $ \( e_j \, d_j \) in partial q_(t_j) \( beta_j \, z_j \) . $ <eq:initial-joint-support>]
  The shifted support controls the original first-coordinate slope $e_j$ before the explicit increment $A d_j^2 \/ 2$ is added. The maximizing densities are bounded by Lemma 10; hence the $z_j$ stay in a compact interval. The locally uniform limit $q_(*)$ is independent of $beta$, so every cluster of the subgradients in (4.14) has first coordinate zero. Therefore $e_j arrow.r 0$. The same lemma puts every density cluster in ${ 0 \, p \, 4 p }$, and (4.13) proves the claim.
  Subgradients of $P_1^t$ near $lambda_(*)$ are bounded uniformly for large $t$, by (4.4). If $G_(P_1^t) \( lambda_1^t \)$ were not contained in $union.big_i overline(B) \( v_i \, tau \/ 2 \)$ for arbitrarily large $t$, choose such a sequence of reachable gradients. Approximate each by a gradient at a differentiability point within distance $1 \/ t$ of $lambda_1^t$, with gradient error tending to zero. A bounded subsequence then contradicts the preceding claim. Thus, for all sufficiently large $t$, the three intersections
  $ G_(P_1^t) \( lambda_1^t \) ∩ overline(B) \( v_i \, tau \/ 2 \) $
  cover the reachable-gradient set. Let $K_i^1$ be their convex hulls. They are compact and remain inside their respective balls. Formula (4.6) gives the equality in (4.12). None of the three sets is empty: otherwise $g$ would lie in the convex hull of two of the larger balls $U_i$. Their density coordinates are nonnegative because $P_1^t$ is nondecreasing in $h$.
  Finally, choose one point in each $K_i^1$. Their triangle contains $overline(B) \( g \, gamma \)$ by the fixed geometry of the $U_i$, and is contained in $partial P_1^t \( lambda_1^t \)$. ◻
]

Fix from now on one $t$ satisfying (2.6) and Proposition 13, and suppress its superscript when writing $P_1 = T_A q_t$ and $lambda_1$. We have obtained a corner for an ideal transform. A physical finite-range approximation can smooth that corner, so uniform approximation alone will not finish the proof. The next section shows how a further small mean-field attraction restores the three separated groups of supporting slopes while moving their common supporting point only a controlled distance.

== 5 Persistence under a small attractive perturbation <sec:convex>

The initial transform has three separated groups of supporting gradients. We now show how to retain this structure when an ideal pressure is replaced by a sufficiently accurate physical pressure and a smaller attractive quadratic is added. The approximation error must be small compared with the strength of that quadratic. The proof examines both operations at the same scale; ordinary uniform convergence alone would not retain a corner.

Throughout this section, $t$ is fixed as in Proposition 13. A physical pressure means a function $Q = Q_phi$ with $phi$ in the class (2.3). We use the following conclusions of Propositions 4 and 5: $Q$ is finite, jointly convex, and nondecreasing in $h$; its partial conjugate $H_Q \( beta \, d \)$ is finite and concave in $beta$ for every $d gt.eq 0$; and the suprema defining $T_a Q$ are attained. On every compact subset of $Omega$, their optimizing densities are bounded uniformly over this physical class and over $0 lt.eq a lt.eq min \( 1 \, A + 1 \)$. These uniform bounds use the fixed value of $t$. They are the only model-dependent bounds needed below.

For a nonempty compact convex set $K subset bb(R)^2$, define its support function and its exposed faces by

#[#set math.equation(numbering: n => "(5.1)")
 $ h_K \( xi \) = max_(v in K) xi dot.op v \, #h(2em) F_xi = { v in K : xi dot.op v = h_K \( xi \) } . $ <eq:support-face>]

The face $F_0$ is the whole set $K$. Two facts about finite convex functions will be used repeatedly. Locally uniform convergence bounds subgradients on smaller compact subsets, and limits of subgradients at converging points belong to the subdifferential of the limiting function. Both statements follow directly from supporting inequalities and the bound of a slope by the oscillation on a surrounding ball. In particular, $partial h_K \( xi \) = F_xi$. We also use the reachable-gradient identity $partial F \( lambda \) = "conv" G_F \( lambda \)$ recalled in the preceding section.

#thm([Lemma 5.1.])[
  (Persistence of three gradient groups).  #emph[Let $W subset Omega$ be compact, let $P$ be finite and convex on $Omega$, and let $lambda_0 = \( beta_0 \, h_0 \) in "int" W$. Suppose that 
#[#set math.equation(numbering: n => "(5.2)")
 $ partial P \( lambda_0 \) = K = "conv" \( K_1 union K_2 union K_3 \) \, #h(2em) B \( g \, gamma \) subset K \, $ <eq:persistence-input>]

 where $g in bb(R)^2$, $gamma > 0$, and the $K_i$ are nonempty compact convex sets whose projections onto the density coordinate are nonnegative and strictly ordered. Let $zeta > 0$ be such that the sets $K_i + overline(B) \( 0 \, zeta \)$ still have disjoint density projections, and $g$ lies outside the convex hull of any two of these enlarged sets.]
  #emph[There exist $S < oo$ and $a_(*) > 0$ with the following property. For every $0 < a < a_(*)$ and every physical pressure $Q$ satisfying 
#[#set math.equation(numbering: n => "(5.3)")
 $ parallel Q - P parallel_W lt.eq a^2 \, $ <eq:persistence-error>]

 there is a point $lambda' in "int" W$ with $\| lambda' - lambda_0 \| lt.eq S a$ such that 
#[#set math.equation(numbering: n => "(5.4)")
 $ g in partial \( T_a Q \) \( lambda' \) = "conv" \( J_1 union J_2 union J_3 \) . $ <eq:persistence-output>]

 Here each $J_i$ is nonempty, compact, and convex, has nonnegative density projection, and satisfies $J_i subset K_i + overline(B) \( 0 \, zeta \)$. The constants may depend on the displayed data and the fixed physical class, but not on $Q$. We may require $a_(*) lt.eq min \( 1 \, A + 1 \)$.]
] <lem:persistence>

#proof[
  We prove the conclusion along an arbitrary sequence $a_m arrow.b 0$ and physical pressures $Q_m$ with $parallel Q_m - P parallel_W lt.eq a_m^2$. The radius $S$ will be chosen from the fixed limiting data. A contradiction argument will then supply one threshold $a_(*)$ valid for all admissible $Q$.
  #emph[The geometric effect of the quadratic.] Write $xi = \( x \, y \)$ and $pi_2 \( s \, d \) = d$. Define the finite convex function
  #[#set math.equation(numbering: n => "(5.5)")
   $ r \( x \, y \) = max_(\( s \, d \) in K) (x s + y d + beta_0 / 2 d^2) $ <eq:scaled-transform-limit-definition>]
  This is the function that will arise when the attractive mass and the distance to $lambda_0$ tend to zero at the same scale. Before proving that limit, we identify which points of $K$ can attain its maximum. Every maximizer of $xi dot.op \( s \, d \) + beta_0 d^2 \/ 2$ over $K$ belongs to one of the $K_i$. Indeed, write such a maximizer as a finite convex combination $v = sum_j theta_j v_j$, with $v_j = \( s_j \, d_j \) in union.big_i K_i$ and positive weights. If two of the $d_j$ differ, strict convexity of the quadratic gives
  $ xi dot.op v + beta_0 / 2 \( pi_2 v \)^2 < sum_j theta_j (xi dot.op v_j + beta_0 / 2 d_j^2) lt.eq r \( xi \) \, $
  contradicting maximality. All $d_j$ must therefore coincide. The disjoint density projections put all $v_j$ in one $K_i$, and convexity of that $K_i$ gives $v in K_i$. Thus the positive quadratic rules out a maximizing mixture across the three density groups. To use this observation for physical pressures, we must show that limits of their transformed gradients are themselves maximizing points of $K$; membership in the convex hull of such points would not suffice.
  #emph[Step 1: the pressure at scale $a_m$.] On the expanding open set $Omega_m = { xi in bb(R)^2 : lambda_0 + a_m xi in Omega }$, put
  #[#set math.equation(numbering: n => "(5.6)")
   $ q_m \( xi \) = frac(Q_m \( lambda_0 + a_m xi \) - P \( lambda_0 \), a_m) . $ <eq:scaled-pressure>]
  Every fixed compact set of scaled coordinates is mapped into $"int" W$ for all sufficiently large $m$. On that compact set, the difference between $q_m$ and the corresponding rescaling of $P$ is at most $a_m$. The rescaling of $P$ converges to its directional derivative at $lambda_0$, which is $h_K$. This convergence is uniform on compact sets: the rescaled functions have a common local Lipschitz bound, and their pointwise limits are the directional derivatives. Consequently
  #[#set math.equation(numbering: n => "(5.7)")
   $ q_m arrow.r h_K quad upright("locally uniformly on ") bb(R)^2 . $ <eq:scaled-pressure-limit>]
  The scaling preserves subgradient vectors:
  $ partial q_m \( xi \) = partial Q_m \( lambda_0 + a_m xi \) . $
  It follows that, whenever $xi_m arrow.r xi$ and $v_m in partial Q_m \( lambda_0 + a_m xi_m \)$, the vectors $v_m$ are bounded and every limit belongs to $F_xi$. To see the last assertion directly, pass the supporting inequalities of $q_m$ to the limit. They give $v in partial h_K \( xi \) = F_xi$. This observation applies to faces of any dimension; no uniqueness of the supporting vector is assumed.
  #emph[Step 2: the transform at the same scale.] Put
  $ B_m \( xi \) = frac(T_(a_m) Q_m \( lambda_0 + a_m xi \) - P \( lambda_0 \), a_m) . $
  We will prove that
  #[#set math.equation(numbering: n => "(5.8)")
   $ B_m arrow.r r quad upright("locally uniformly on ") bb(R)^2 . $ <eq:scaled-transform-limit>]
  To keep track of maximizing densities as well as function values, we use the slices of $K$. For fixed $x in bb(R)$, define
  $ k_x \( d \) = max { x s : \( s \, d \) in K } \, $
  with value $- oo$ when $d$ is outside the density projection of $K$. The function $k_x$ is upper semicontinuous and concave on its compact interval of finite values. Partial conjugacy of the support function gives
  #[#set math.equation(numbering: n => "(5.9)")
   $ k_x \( d \) = inf_(z in bb(R)) #scale(x: 120%, y: 120%)[\(] h_K \( x \, z \) - z d #scale(x: 120%, y: 120%)[\)] . $ <eq:slice-conjugacy>]
  Indeed $h_K \( x \, z \) = sup_d \( k_x \( d \) + z d \)$; the reverse formula is concave biconjugacy, or equivalently separation of the closed hypograph of $k_x$.
  We will also retain the following information about optimizers: if $xi_m = \( x_m \, y_m \) arrow.r \( x \, y \)$ and $d_m$ maximizes the transform at $lambda_0 + a_m xi_m$, then every limit $d$ of the $d_m$ satisfies
  #[#set math.equation(numbering: n => "(5.10)")
   $ d in pi_2 K \, #h(2em) r \( x \, y \) = k_x \( d \) + y d + beta_0 / 2 d^2 . $ <eq:scaled-optimizer>]
  Write $beta_m = beta_0 + a_m x_m$ and $h_m = h_0 + a_m y_m$. The physical uniform bound on optimizing densities makes $\( d_m \)$ bounded. For every fixed $z in bb(R)$, Fenchel’s inequality at $\( beta_m \, h_0 + a_m z \)$ gives
  #[#set math.equation(numbering: n => "(5.11)")
   $ B_m \( xi_m \) lt.eq q_m \( x_m \, z \) + \( y_m - z \) d_m + beta_m / 2 d_m^2 . $ <eq:scaled-upper>]
  This will yield the upper bound after taking a density limit and then the infimum over $z$.
  For the lower bound, choose $v_(*) = \( s_(*) \, d_(*) \) in K$ that attains the maximum defining $r \( x \, y \)$, and put $z = y + beta_0 d_(*)$. Comparing its value with that at any $\( s' \, d' \) in K$ and completing the square gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ x \( s_(*) - s' \) + z \( d_(*) - d' \) gt.eq beta_0 / 2 \( d' - d_(*) \)^2 . $ <eq:strict-face-support>]
  Thus $v_(*) in F_(\( x \, z \))$, and every member of this face has density $d_(*)$. Choose a full subgradient of $Q_m$ at $\( beta_m \, h_0 + a_m z \)$, and denote its density coordinate by $d'_m$. Step 1 shows that $d'_m arrow.r d_(*)$; nondecreasing dependence on $h$ gives $d'_m gt.eq 0$. Fenchel equality at $d'_m$ permits evaluation of the transformed objective and yields
  #[#set math.equation(numbering: n => "(5.13)")
   $ B_m \( xi_m \) & gt.eq q_m \( x_m \, z \) + \( y_m - z \) d'_m + beta_m / 2 \( d'_m \)^2\
 & arrow.r x s_(*) + y d_(*) + beta_0 / 2 d_(*)^2 = r \( x \, y \) . $ <eq:scaled-lower>]
  Now pass to a subsequence in (5.11) along which $d_m arrow.r d$. Taking the infimum over $z$ after the limit and using (5.9) gives
  $ limsup_m B_m \( xi_m \) lt.eq k_x \( d \) + y d + beta_0 / 2 d^2 lt.eq r \( x \, y \) . $
  The finite lower bound (5.13) excludes $d in.not pi_2 K$. Equality throughout proves (5.10). These arguments apply to every convergent sequence $xi_m$ in a fixed compact set. They therefore prove the uniform convergence (5.8) as well.
  We have identified the exact effect of an attraction of strength $a_m$ on the pressure at distance $O \( a_m \)$ from $lambda_0$. The positive quadratic in (5.5) is now visible at order one. We next use it to locate a nearby subdifferential containing $g$ and to keep all of its reachable gradients within the three groups.
  #emph[Step 3: a nearby point supporting $g$.] By (5.2) and $beta_0 > 0$,
  #[#set math.equation(numbering: n => "(5.14)")
   $ r \( xi \) - g dot.op xi gt.eq h_K \( xi \) - g dot.op xi gt.eq gamma \| xi \| . $ <eq:scaled-coercivity>]
  Choose $S > 0$ such that $gamma S > r \( 0 \) + 1$. Let $xi_m$ minimize $B_m \( xi \) - g dot.op xi$ on the closed ball $overline(B) \( 0 \, S \)$. Uniform convergence on this ball and (5.14) show that, for large $m$, all such minimizers are interior: every boundary value exceeds the value at $0$. Every limit of these minimizers is also interior. Hence, at
  $ lambda'_m = lambda_0 + a_m xi_m \, $
  convex minimality gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ g in partial \( T_(a_m) Q_m \) \( lambda'_m \) \, #h(2em) \| lambda'_m - lambda_0 \| lt.eq S a_m . $ <eq:nearby-support>]
  For large $m$ these points lie in $"int" W$.
  #emph[Step 4: localization of every reachable gradient.] Put $G_m = G_(T_(a_m) Q_m) \( lambda'_m \)$. We claim that, eventually,
  #[#set math.equation(numbering: n => "(5.16)")
   $ G_m subset union.big_(i = 1)^3 (K_i + overline(B) \( 0 \, zeta \/ 2 \)) . $ <eq:reachable-localization>]
  Suppose otherwise, and choose $u_m in G_m$ outside this union along a subsequence. By the definition of a reachable gradient, there is a differentiability point $hat(lambda)_m$ of $T_(a_m) Q_m$ such that
  $ \| hat(lambda)_m - lambda'_m \| < a_m^2 \, #h(2em) \| nabla \( T_(a_m) Q_m \) \( hat(lambda)_m \) - u_m \| < 1 \/ m . $
  Write $hat(lambda)_m = lambda_0 + a_m hat(xi)_m$, with $hat(xi)_m = \( hat(x)_m \, hat(y)_m \)$. The scaled points remain in a fixed compact set. Moreover, scaling preserves the gradients of the transforms:
  $ nabla B_m \( hat(xi)_m \) = nabla \( T_(a_m) Q_m \) \( hat(lambda)_m \) . $
  Their boundedness thus follows from the local uniform convex convergence in (5.8). After passing to a subsequence, assume
  $ xi_m arrow.r xi = \( x \, y \) \, #h(2em) hat(xi)_m arrow.r xi \, #h(2em) u_m arrow.r u = \( s \, d \) . $
  Let $d_m$ be any maximizing density at $hat(lambda)_m = \( hat(beta)_m \, hat(h)_m \)$. Apply Lemma 12 with $Q = Q_m$ and $a = a_m$. Because $H_(Q_m) \( thin dot.op thin \, d_m \)$ is finite and concave, we can choose $e_m in - partial_beta^(+) H_(Q_m) \( hat(beta)_m \, d_m \)$; the lemma gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ nabla \( T_(a_m) Q_m \) \( hat(lambda)_m \) = (e_m + a_m / 2 d_m^2 \, d_m) \, $ <eq:transformed-gradient>]
  and
  #[#set math.equation(numbering: n => "(5.18)")
   $ \( e_m \, d_m \) in partial Q_m #scale(x: 120%, y: 120%)[\(] hat(beta)_m \, hat(h)_m + hat(beta)_m a_m d_m #scale(x: 120%, y: 120%)[\)] . $ <eq:full-gradient-support>]
  In particular $d_m arrow.r d$, and the first-coordinate increment tends to zero. The argument on the right has scaled coordinates
  $ (hat(x)_m \, hat(y)_m + hat(beta)_m d_m) arrow.r eta = \( x \, y + beta_0 d \) . $
  Equations (5.17) and (5.18), together with Step 1, show that $u in F_eta$.
  By (5.10), there is a point $v_(*) = \( s_(*) \, d \) in K$ that maximizes the expression defining $r \( x \, y \)$. Equation (5.12) shows that $v_(*) in F_eta$ as well. The vectors $u$ and $v_(*)$ have the same density and the same value against $eta$, so $x s = x s_(*)$. Consequently $u$ itself maximizes that expression. This conclusion also holds when $x = 0$; an exposed face need not be a singleton.
  Since $u$ is a maximizer, the geometric observation at the start of the proof puts $u$ in one of the $K_i$. This contradicts the choice of $u_m$ outside the fixed $zeta \/ 2$ neighborhoods. This proves (5.16).
  #emph[Step 5: the three groups and a uniform threshold.] Define
  $ J_(i \, m) = "conv" (G_m ∩ (K_i + overline(B) \( 0 \, zeta \/ 2 \))) . $
  Reachable-gradient sets are compact. Hence every nonempty $J_(i \, m)$ is compact and convex, and lies in $K_i + overline(B) \( 0 \, zeta \/ 2 \)$. The reachable-gradient identity and (5.16) give
  $ partial \( T_(a_m) Q_m \) \( lambda'_m \) = "conv" \( J_(1 \, m) union J_(2 \, m) union J_(3 \, m) \) . $
  None of the three sets is empty: otherwise (5.15) would put $g$ in the convex hull of two of the allowed enlarged groups. The density coordinate of every reachable gradient is nonnegative because $T_(a_m) Q_m$ is nondecreasing in $h$. Thus the $J_(i \, m)$ have all the asserted properties.
  We have proved the conclusion for all sufficiently large indices along every sequence $a_m arrow.b 0$, with the same radius $S$. If no uniform threshold $a_(*)$ existed, one could choose a sequence of counterexamples with $a_m arrow.b 0$, contradicting what was just proved. Decrease $a_(*)$ if necessary so that $a_(*) lt.eq min \( 1 \, A + 1 \)$ and $lambda_0 + overline(B) \( 0 \, S a_(*) \) subset "int" W$. This completes the proof. ◻
]

The lemma preserves the three groups even when they contain curved families of supporting vectors. Its use in the construction is now precise: an approximation with error at most $a^2$ can be followed by an attraction of mass $a$, while moving the supporting point by at most $S a$ and enlarging each group by an arbitrarily prescribed amount.

== 6 One potential and a common temperature singularity <sec:construction>

We now replace each ideal quadratic attraction by an actual radial kernel and retain a common ball of supporting slopes. Throughout this section, $t$ is fixed at a value supplied by Proposition 13; it will never tend to infinity again. All pressure estimates therefore use the fixed-$t$ constants proved above. The ideal pressures carry the ball of supporting slopes, while their physical approximations become the references for the next step.

=== 6.1 Choose the next mass before the current range <choose-the-next-mass-before-the-current-range>

Recall the objects supplied by Proposition 13: $A = 3 \/ \( 2 p \)$, $q_0 = Q_(psi_t)$, $P_1 = T_A q_0$, the point $lambda_(*) = \( 1 \, - 3 \/ 4 \)$, a closed ball $W$ of radius $r_0 = 1 \/ 4$ about $lambda_(*)$, three small neighborhoods $U_i$ of the slope vectors $v_i$, and $g = \( v_1 + v_2 + v_3 \) \/ 3$. Every triangle with one vertex in each $U_i$ contains the same ball $overline(B) \( g \, gamma \)$, for some $gamma > 0$. The initial groups satisfy $K_i^1 subset overline(B) \( v_i \, tau \/ 2 \)$, whereas $U_i = overline(B) \( v_i \, 4 tau \)$. Put $sigma_1 = A$. Choose positive sequences $zeta_n$ and $ell_n$ such that

#[#set math.equation(numbering: n => "(6.1)")
 $ sum_(n gt.eq 1) zeta_n < tau \, #h(2em) sum_(n gt.eq 1) ell_n < r_0 \/ 16 . $ <eq:budgets>]

The quantities $ell_n$ bound displacements in the $\( beta \, h \)$ plane; they are unrelated to the side lengths of particle boxes.

Suppose that the finite-range potential and the next ideal pressure have already been defined by

$ phi_(n - 1) & = psi_t - t sum_(k < n) sigma_k w_(R_k) \, & q_(n - 1) & = Q_(phi_(n - 1)) \, & P_n & = T_(sigma_n) q_(n - 1) . $

The induction maintains a point $lambda_n in "int" W$ and nonempty compact convex sets $K_i^n$ such that

#[#set math.equation(numbering: n => "(6.2)")
 $ g in partial P_n \( lambda_n \) = "conv" union.big_(i = 1)^3 K_i^n \, #h(2em) K_i^n subset overline(B) (v_i \, tau / 2 + sum_(k < n) zeta_k) \, $ <eq:inductive-slopes>]

and every point in $K_i^n$ has nonnegative second coordinate. The geometric choice of the $U_i$ gives

#[#set math.equation(numbering: n => "(6.3)")
 $ overline(B) \( g \, gamma \) subset partial P_n \( lambda_n \) . $ <eq:common-ball>]

The enlarged groups $K_i^n + overline(B) \( 0 \, zeta_n \)$ lie in $U_i$; their density projections are disjoint, and the convex hull of any two of them does not contain $g$.

Apply Lemma 14 to $P_n$, $lambda_n$, and tolerance $zeta_n$. Denote its constants by $S_n$ and $a_n^(*) > 0$. First choose

#[#set math.equation(numbering: n => "(6.4)")
 $ 0 < sigma_(n + 1) < min {a_n^(*) \, frac(ell_n, max { 1 \, S_n }) \, 2^(- n - 1)} . $ <eq:choose-mass>]

Only after this choice, select $R_n > 4$, with $R_n > R_(n - 1) + 1$ for $n > 1$, so large that Proposition 8, applied to the fixed finite-range reference $phi_(n - 1)$, gives

#[#set math.equation(numbering: n => "(6.5)")
 $ phi_n & = phi_(n - 1) - t sigma_n w_(R_n) \, & q_n & = Q_(phi_n) \,\
parallel q_n - P_n parallel_W & lt.eq min { sigma_(n + 1)^2 \, 2^(- n) } . $ <eq:choose-range>]

The physical class is respected because $sum_(k gt.eq 2) sigma_k < 1$, so every partial sum of the masses is at most $A + 1$. Lemma 14 now applies to the physical pressure $q_n$ with perturbation size $a = sigma_(n + 1)$. It produces $P_(n + 1) = T_(sigma_(n + 1)) q_n$, a point $lambda_(n + 1)$, and groups $K_i^(n + 1)$ satisfying

$ \| lambda_(n + 1) - lambda_n \| lt.eq ell_n \, #h(2em) K_i^(n + 1) subset K_i^n + overline(B) \( 0 \, zeta_n \) . $

This verifies (6.2) at the next stage. The initial location and (6.1) keep every $lambda_n$ in $B \( lambda_(*) \, r_0 \/ 8 \)$. Thus the construction continues indefinitely.

The order in (6.4)–(6.5) is essential. The next attractive mass sets the required precision for approximating the current ideal pressure. No uniform convergence rate for the Kac limit as the reference range changes is needed: that reference is fixed before each new range is chosen.

=== 6.2 The final radial interaction <the-final-radial-interaction>

Define

#[#set math.equation(numbering: n => "(6.6)")
 $ Phi \( x \) = psi_t \( x \) - t sum_(j = 1)^oo sigma_j w_(R_j) \( x \) . $ <eq:final-potential>]

Since $R_j gt.eq 1$ and $sum_j sigma_j < oo$, the attractive series converges uniformly and in $L^1 \( bb(R)^3 \)$. It is radial and nonnegative before subtraction. Consequently $Phi$ is Borel measurable, finite and locally bounded away from the origin, and has the same divergence at the origin as $psi_t$. The core vanishes for $\| x \| gt.eq 1$, so the $L^1$ convergence gives

$ 4 pi integral_1^oo r^2 \| phi.alt \( r \) \| thin upright(d) r = integral_(\| x \| gt.eq 1) \| Phi \( x \) \| thin upright(d) x < oo . $

The compact support of $w$ also gives, for $r gt.eq 1$,

$ r^3 \| phi.alt \( r \) \| lt.eq t parallel w parallel_oo sum_(R_j gt.eq r) sigma_j arrow.r 0 . $

This estimates the tail without imposing any power-law relation between $sigma_j$ and $R_j$. No bound of order $r^(- 3 - epsilon)$ for a fixed $epsilon > 0$ is established by these choices. Because $R_1 > 4$ and $w$ is continuous and strictly positive on the ball of radius $1 \/ 2$, its first attraction alone has a positive lower bound on $1 lt.eq \| x \| lt.eq 2$. As $sigma_1 = A > 0$,

$ Phi \( x \) lt.eq - t A R_1^(- 3) min_(\| y \| lt.eq 2 \/ R_1) w \( y \) < 0 #h(2em) \( 1 lt.eq \| x \| lt.eq 2 \) . $

Finally, Proposition 3 applies to the infinite sum and gives $U_N^Phi gt.eq - B_0 N$. Thus (6.6) satisfies every admissibility condition in Section 1.

Write $Q_oo = Q_Phi$ and $H_oo = H_Phi$ for the actual pressure and canonical limit of this potential. Their existence, finiteness, and duality follow from Proposition 4. The range-uniform tail estimate, Proposition 7, and (6.5) imply

#[#set math.equation(numbering: n => "(6.7)")
 $ parallel Q_oo - P_n parallel_W lt.eq C_W sum_(k > n) sigma_k + min { sigma_(n + 1)^2 \, 2^(- n) } arrow.r 0 . $ <eq:physical-pressure-limit>]

This estimate identifies the limiting function with the pressure of the single potential (6.6).

=== 6.3 Pass the ball of slopes to the physical pressure <pass-the-ball-of-slopes-to-the-physical-pressure>

The summable displacement bounds imply $lambda_n arrow.r lambda_c = \( beta_c \, h_c \)$, with $lambda_c in B \( lambda_(*) \, r_0 \/ 8 \)$. Fix any $v in overline(B) \( g \, gamma \)$. By (6.3), for every $lambda in "int" W$,

$ P_n \( lambda \) gt.eq P_n \( lambda_n \) + v dot.op \( lambda - lambda_n \) . $

Letting $n arrow.r oo$ in this inequality using (6.7) gives a supporting inequality for $Q_oo$ at $lambda_c$ on $"int" W$. Such a local support is global on the convex domain $Omega = \( 0 \, oo \) times bb(R)$. Indeed, for any $lambda in Omega$, a short initial portion of the segment from $lambda_c$ to $lambda$ lies in $"int" W$; combining its supporting inequality with convexity of $Q_oo$ gives the inequality at $lambda$. Hence

#[#set math.equation(numbering: n => "(6.8)")
 $ overline(B) \( g \, gamma \) subset partial Q_oo \( lambda_c \) . $ <eq:limit-ball>]

The same ball, rather than singularity alone, is the information that survives all finite-range approximations.

=== 6.4 A common critical point for an open interval of densities <a-common-critical-point-for-an-open-interval-of-densities>

The center density is determined by the original triangle:

#[#set math.equation(numbering: n => "(6.9)")
 $ rho_(*) = g_2 = frac(0 + p + 4 p, 3) = frac(5 p, 3) > 0 . $ <eq:fixed-density>]

Set

$ delta_rho = min { gamma \/ 2 \, rho_(*) \/ 2 } \, #h(2em) I = \( rho_(*) - delta_rho \, rho_(*) + delta_rho \) . $

This nonempty interval lies in $\( 0 \, oo \)$ and is independent of inverse temperature. Fix any $rho in I$. The vectors

$ w_(-) = \( g_1 - gamma \/ 2 \, rho \) \, #h(2em) w_(+) = \( g_1 + gamma \/ 2 \, rho \) $

have distance less than $gamma$ from $g$, so both belong to $partial Q_oo \( beta_c \, h_c \)$ by (6.8). Figure 2 shows the central slice; the same argument applies to every slice at a density in $I$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.42, 0), (5.67, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.67, 0), [$s$], anchor: "west", padding: 0.1176cm)
  line((0, -0.21), (0, 3.885), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 3.885), [$d$], anchor: "south", padding: 0.1176cm)
  circle((2.94, 2.1), radius: 1.208, fill: rgb("#ebebff"), stroke: none)
  circle((2.94, 2.1), radius: 1.208, stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.1), (5.25, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((2.625, 2.1), [$rho =g_2$], anchor: "east", padding: 0.1176cm)
  circle((2.94, 2.1), radius: 0.04939, fill: black, stroke: none)
  content((2.94, 2.1), [$g$], anchor: "north", padding: 0.1176cm)
  circle((2.331, 2.1), radius: 0.07056, fill: black, stroke: none)
  content((2.331, 2.1), [$w_-$], anchor: "south-east", padding: 0.1176cm)
  circle((3.549, 2.1), radius: 0.07056, fill: black, stroke: none)
  content((3.549, 2.1), [$w_+$], anchor: "south-west", padding: 0.1176cm)
  content((2.94, 0.4725), [same density, distinct slopes])
  content((2.94, 3.675), [$overline(B) (g, gamma ) subset partial Q_ infinity ( beta_c,h_c)$])
})],
  caption: [Figure 2: The horizontal slice of the preserved subgradient ball gives two supporting vectors with the same density coordinate. Partial conjugacy turns their distinct first coordinates into distinct canonical supergradients in inverse temperature. ],
) <fig:fixed-density>

To obtain the temperature jump, take any $\( s \, rho \)$ in that subdifferential. Restricting the supporting inequality to $beta = beta_c$ gives Fenchel equality

$ H_oo \( beta_c \, rho \) = h_c rho - Q_oo \( beta_c \, h_c \) . $

The full inequality, at an arbitrary $\( beta \, h \) in Omega$, rearranges to

$ h rho - Q_oo \( beta \, h \) lt.eq H_oo \( beta_c \, rho \) - s \( beta - beta_c \) . $

Taking the supremum over $h$ yields

#[#set math.equation(numbering: n => "(6.10)")
 $ H_oo \( beta \, rho \) lt.eq H_oo \( beta_c \, rho \) - s \( beta - beta_c \) \, #h(2em) beta > 0 . $ <eq:canonical-support>]

Thus $- s$ is a supergradient of the finite concave function $H_oo \( dot.op \, rho \)$. For a finite concave function at an interior point, every supergradient lies between the right and left derivatives. Applying this to $w_(-)$ and $w_(+)$ gives

#[#set math.equation(numbering: n => "(6.11)")
 $ D_beta^(-) H_oo \( beta_c \, rho \) - D_beta^(+) H_oo \( beta_c \, rho \) gt.eq gamma > 0 . $ <eq:derivative-jump>]

Both derivatives are finite because $beta_c$ is interior to the interval of finiteness of this concave function.

The normalization (2.16) gives $f_Phi \( beta \, rho \) = t H_oo \( beta \, rho \) \/ beta$. Continuity and the one-sided product rule therefore give the explicit uniform bound

$ D_beta^(-) f_Phi \( beta_c \, rho \) - D_beta^(+) f_Phi \( beta_c \, rho \) = t / beta_c (D_beta^(-) H_oo \( beta_c \, rho \) - D_beta^(+) H_oo \( beta_c \, rho \)) gt.eq frac(t gamma, beta_c) > 0 . $

The all-sequence canonical limit supplies (1.3) with $N_L = floor.l rho L^3 floor.r$ for every $beta > 0$ and every $rho > 0$. The location of $lambda_c$ gives $beta_c in \( 1 \/ 2 \, 3 \/ 2 \)$. Since the choice of $rho in I$ was arbitrary, this proves Theorem 1 with one potential and one critical point.

== 7 Elementary convex facts used in the proof <app:convex-facts>

This appendix proves the finite-dimensional convex facts needed for the pressure limits and the persistence argument. These are special cases of the convex convergence, conjugacy, and reachable-gradient results in #cite(label("RockafellarWets1998")) Corollary 7.18 and Theorems 11.1 and 9.61. The proofs below make their exact hypotheses explicit. Lebesgue measure and its Fubini theorem are used only to locate ordinary differentiability points of a planar convex function.

#thm([Lemma 7.1.])[
  (Local convex convergence).  #emph[Let $O subset bb(R)^m$ be open and convex. A finite convex function $F$ on $O$ is locally Lipschitz and has a nonempty compact subdifferential at every point of $O$. Its subgradients are bounded on compact subsets. If finite convex functions $F_n$ converge pointwise on $O$ to a finite function $F$, then $F$ is convex and the convergence is locally uniform. Moreover, if $x_n arrow.r x in O$, $F_n arrow.r F$ locally uniformly, and $v_n in partial F_n \( x_n \)$, then $\( v_n \)$ is bounded and every limit belongs to $partial F \( x \)$.]
] <lem:elementary-convex-convergence>

#proof[
  Choose a cube with center $c$ whose concentric enlargement lies in $O$. Convexity bounds a function above on the larger cube by its values at the vertices. The inequality $F \( y \) gt.eq 2 F \( c \) - F \( 2 c - y \)$ then bounds it below on a smaller concentric cube. On a still smaller cube, extend any chord by a fixed positive distance in both directions while remaining in the bounded region. Monotonicity of one-dimensional convex secant slopes bounds the difference quotient on the original chord by its surrounding oscillation divided by that distance. This proves local Lipschitz continuity. In the sequence assertion, the finitely many vertex values and the center value are uniformly bounded by pointwise convergence, so the same argument gives a common local Lipschitz constant. A finite net of points on each compact set upgrades pointwise to uniform convergence. Passing convexity inequalities to limits proves convexity of $F$.
  Here is also a direct supporting-plane construction. Separate a point strictly below the epigraph from that convex epigraph, let the point tend to $\( x \, F \( x \) \)$, and normalize the separating normals. Separation in finite dimensions follows by projecting an exterior point onto a closed convex set: if $z$ is its nearest point, expansion of the squared distance along $z + theta \( y - z \)$ gives the separating inequality. One can restrict the epigraph to a closed neighborhood of $x$ before applying this construction. A limiting normal has a nonzero vertical component: a horizontal supporting normal would separate $x$ from an open neighborhood of $x$, which is impossible. Division by that component produces a local affine minorant through $\( x \, F \( x \) \)$. Convexity extends it to all of $O$ by considering the initial portion of the segment from $x$ to any other point. Thus $partial F \( x \)$ is nonempty.
  If $v in partial F \( x \)$ and $x plus.minus r e_j in O$, the supporting inequalities bound $\| v dot.op e_j \|$ by the oscillation of $F$ divided by $r$. Uniform oscillation on a surrounding compact set bounds all subgradients at points in a smaller compact set. Subdifferentials are closed by their defining inequalities, hence compact. The same bounds apply to $F_n$ under local uniform convergence. Passing $F_n \( y \) gt.eq F_n \( x_n \) + v_n dot.op \( y - x_n \)$ to a convergent subsequence proves the last assertion. ◻
]

#thm([Lemma 7.2.])[
  (One-dimensional conjugacy).  #emph[Let $u : bb(R) arrow.r bb(R) union { + oo }$ be proper, lower semicontinuous, and convex, with a domain having nonempty interior. Then 
$ u \( d \) = sup_(h in bb(R)) { h d - u^(*) \( h \) } \, #h(2em) u^(*) \( h \) = sup_(d in bb(R)) { h d - u \( d \) } . $

 At a finite point $d$, equality $u \( d \) + u^(*) \( h \) = h d$ holds precisely when $u \( d' \) gt.eq u \( d \) + h \( d' - d \)$ for every $d'$. In particular, if $K subset bb(R)^2$ is nonempty compact convex with a density projection of positive length, then for every $x in bb(R)$, 
$ max { x s : \( s \, d \) in K } = inf_(z in bb(R)) { h_K \( x \, z \) - z d } \, $

 where the maximum is $- oo$ outside that projection.]
] <lem:elementary-conjugacy>

#proof[
  At every interior point of the domain, a slope between the left and right convex derivatives gives an affine minorant. Hence $u$ has at least one affine minorant $ell_0$. To obtain enough such minorants, fix a point $\( d \, a \)$ strictly below the closed epigraph of $u$. Strict separation, by the projection argument in the preceding proof, yields an affine inequality
  $ A d' + B y gt.eq c > A d + B a #h(2em) \( y gt.eq u \( d' \) \) . $
  Necessarily $B gt.eq 0$. If $B > 0$, division gives an affine minorant of $u$ whose value at $d$ exceeds $a$. If $B = 0$, add a sufficiently small positive multiple of the valid inequality $y gt.eq ell_0 \( d' \)$; the resulting inequality has positive vertical coefficient and still strictly separates $\( d \, a \)$. This also gives an affine minorant exceeding $a$ at $d$. Since every point below the epigraph is so separated, $u$ is the supremum of its affine minorants, including at boundary and exterior points of its domain. Among affine minorants of slope $h$, the largest is $d mapsto h d - u^(*) \( h \)$, which proves biconjugacy. Rearranging the definition of $u^(*)$ proves the equality criterion.
  For the last assertion, put $k_x \( d \) = max { x s : \( s \, d \) in K }$. Compactness and convexity of $K$ make $k_x$ upper semicontinuous and concave on its compact projection interval. Thus $- k_x$, extended by $+ oo$, satisfies the preceding hypotheses. The identity $h_K \( x \, z \) = sup_d \( k_x \( d \) + z d \)$ and biconjugacy give the formula. ◻
]

#thm([Lemma 7.3.])[
  (Directional and reachable gradients).  #emph[Let $F$ be finite and convex on an open convex subset $O subset bb(R)^2$. For $x in O$, let $G_F \( x \)$ be the limits of gradients at differentiability points tending to $x$. Then $G_F \( x \)$ is nonempty compact and 
$ partial F \( x \) = "conv" G_F \( x \) . $

 For every $e in bb(R)^2$, 
$ lim_(a arrow.b 0) frac(F \( x + a e \) - F \( x \), a) = max_(v in partial F \( x \)) v dot.op e . $

 The rescaled functions in this last display converge uniformly for $e$ in compact subsets of $bb(R)^2$.]
] <lem:reachable-local>

#proof[
  On every coordinate line, a one-dimensional convex function has equal left and right derivatives except at countably many points: both derivatives are monotone, and each strict gap contains a distinct rational number. Fubini’s theorem therefore implies that both coordinate partial derivatives of $F$ exist almost everywhere. At such a point, every subgradient has these two coordinates, so the subdifferential is a singleton, say ${ v }$. This implies differentiability. Indeed, for small $u$ choose $v_u in partial F \( x + u \)$. Local boundedness and closedness of subgradients show $v_u arrow.r v$, and the two supporting inequalities give
  $ v dot.op u lt.eq F \( x + u \) - F \( x \) lt.eq v_u dot.op u . $
  Their difference is $o \( \| u \| \)$. Thus differentiability points have full measure, in particular they are dense.
  Local boundedness and diagonal subsequences show that $G_F \( x \)$ is nonempty and compact. Each of its elements is in $partial F \( x \)$ by the limiting support inequality. Conversely, take $p in partial F \( x \)$ and a direction $e$. Choose differentiability points $y_j = x + a_j e + o \( a_j \)$, with $a_j arrow.b 0$. This is possible by density, for example with error less than $a_j^2$. Adding the supporting inequalities at $x$ and $y_j$ gives
  $ \( nabla F \( y_j \) - p \) dot.op \( y_j - x \) gt.eq 0 . $
  After passing to a bounded-gradient subsequence and dividing by $a_j$, one obtains $v in G_F \( x \)$ with $v dot.op e gt.eq p dot.op e$. Thus $G_F \( x \)$ and $partial F \( x \)$ have the same support function. In the plane the convex hull of a compact set is compact: any convex combination can be reduced to three terms by eliminating an affine dependence among four or more points. Separation therefore proves $partial F \( x \) = "conv" G_F \( x \)$.
  Finally, the convex secant slope in the last assertion has a limit as $a arrow.b 0$. Supporting inequalities at $x$ give the lower bound $v dot.op e$ for every $v in partial F \( x \)$. Choose instead $v_a in partial F \( x + a e \)$; the reverse supporting inequality bounds the same secant slope above by $v_a dot.op e$. A bounded subsequence of $v_a$ converges to an element of $partial F \( x \)$, proving the claimed equality. The local Lipschitz constant for $F$ gives a common Lipschitz constant in $e$ for all sufficiently small rescalings on any fixed compact set. A finite-net argument then proves uniform convergence there. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
