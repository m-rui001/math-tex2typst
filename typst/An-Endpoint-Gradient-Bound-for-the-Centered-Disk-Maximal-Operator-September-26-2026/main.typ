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

#align(center)[#text(size: 16pt, weight: "bold")[An Endpoint Gradient Bound for the Centered Disk Maximal Operator]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

For $f in L_(upright("loc"))^1 \( bb(R)^2 \)$, the centered disk maximal function is

$ M f \( x \) = sup_(r > 0) frac(1, pi r^2) integral_(B \( x \, r \)) \| f \( y \) \| thin #h(-0.16667em) upright(d) y \, #h(2em) B \( x \, r \) = { y in bb(R)^2 : \| y - x \| < r } . $

Every averaging disk is centered at the point of evaluation, and all positive radii are allowed. Kinnunen proved that this operator is bounded on $W^(1 \, p)$ for $1 < p < oo$ #cite(label("Kinnunen1997")) Theorem 1.4. The pointwise control of its gradient by $M \( \| nabla f \| \)$ gives the corresponding norm bound through the strong $L^p$ maximal inequality. At $p = 1$ that last step fails. Hajłasz and Onninen asked whether the gradient estimate itself nevertheless survives #cite(label("HajlaszOnninen2004")) Question 1. We give a positive resolution of the planar centered-disk case of their endpoint question.

#thm([Theorem 1.1.])[
  #emph[There is an absolute constant $C < oo$ such that, for every real-valued $f in W^(1 \, 1) \( bb(R)^2 \)$, the function $M f$ is locally integrable, belongs to $W_(upright("loc"))^(1 \, 1) \( bb(R)^2 \)$, and satisfies 
#[#set math.equation(numbering: n => "(1.1)")
 $ integral_(bb(R)^2) \| nabla M f \| thin #h(-0.16667em) upright(d) x lt.eq C integral_(bb(R)^2) \| nabla f \| thin #h(-0.16667em) upright(d) x . $ <eq:main>]

 In particular, its distributional derivatives are represented by globally integrable functions.]
] <thm:main>

Here $W^(1 \, 1) \( bb(R)^2 \)$ is the inhomogeneous Sobolev space: the input and its weak first derivatives are globally integrable. Vector norms are Euclidean. No radiality or compact-support condition is imposed on the input. The maximal function itself need not be globally integrable, even for a nonzero nonnegative smooth function of compact support. The constant in (1.1) is finite and absolute; its optimal value is not determined. The argument below concerns disks in the plane.

=== 1.1 The signed estimate behind the theorem <the-signed-estimate-behind-the-theorem>

The intermediate estimate retains the sign of the input. For real $g in C_c^oo \( bb(R)^2 \)$, put

$ A_t g \( x \) = frac(1, pi t^2) integral_(B \( x \, t \)) g \( y \) thin #h(-0.16667em) upright(d) y \, #h(2em) S_(a \, b) g \( x \) = sup_(a lt.eq t lt.eq b) A_t g \( x \) . $

For fixed $0 < a lt.eq b < oo$, this envelope is compactly supported and Lipschitz. The issue is to bound its gradient uniformly as the range of radii grows.

#thm([Proposition 1.2.])[
  (Signed finite-band estimate).  #emph[There is an absolute constant $C$ such that, for every real $g in C_c^oo \( bb(R)^2 \)$ and $0 < a lt.eq b$ with $b \/ a$ a power of two, including one, 
#[#set math.equation(numbering: n => "(1.2)")
 $ integral_(bb(R)^2) \| nabla S_(a \, b) g \| thin #h(-0.16667em) upright(d) x lt.eq C integral_(bb(R)^2) \| nabla g \| thin #h(-0.16667em) upright(d) x . $ <eq:intro-band>]

 The constant is independent of $a$, $b$, and the number of dyadic radius scales between them.]
] <prop:finite-band>

The proof of Proposition 2 is given in Section 5, after the local and multiscale estimates described below. A single radius, $a = b$, is covered directly by convolution. The signed form of Proposition 2 has a specific purpose in the final regularity argument. After extension to Sobolev inputs, one applies it to $g_Q = chi_Q \( g - c_Q \)$, where $c_Q$ is a local mean and $chi_Q$ equals one on the small disks being tested. On those disks, $A_t g_Q = A_t g - c_Q$, so the corresponding envelopes have the same gradient. Poincaré’s inequality then bounds $parallel nabla g_Q parallel_1$ by the gradient of $g$ on a slightly larger square. The function $g_Q$ can take both signs. Signed averages also occur in Weigt’s dyadic and uncentered cube estimates #cite(label("Weigt2023Dyadic")) #cite(label("Weigt2025Cubes")); their role here is to permit this local subtraction.

=== 1.2 Earlier endpoint results <earlier-endpoint-results>

In one dimension, Tanaka proved an $L^1$ derivative bound for the uncentered maximal operator #cite(label("Tanaka2002")) Theorem 1. Aldaz and Pérez Lázaro extended the result to inputs of bounded variation, established absolute continuity of the maximal function, and obtained the sharp variation constant $1$ #cite(label("AldazPerezLazaro2007")) Theorem 2.5. Kurka proved a variation bound with an absolute constant for the centered operator on functions of bounded variation, together with local Sobolev regularity and an integrable derivative for Sobolev inputs #cite(label("Kurka2015")) Theorem 1.2 and Corollary 1.4. The ordering of intervals used in these arguments does not directly organize a family of centered disks.

In higher dimensions, Aldaz and Pérez Lázaro proved regularity for block-decreasing inputs, invariant under coordinate sign changes and nonincreasing in each positive coordinate, and uncentered maximal operators over balls of unconditional norms; their weak-gradient conclusion applies, in particular, to block-decreasing $W^(1 \, 1)$ input and Euclidean balls #cite(label("AldazPerezLazaro2009Block")) Theorem 11. Luiro proved the $L^1$ gradient estimate for radial Sobolev input and the uncentered ball operator #cite(label("Luiro2018Radial")) Theorem 3.12. Weigt established variation bounds for the dyadic maximal operator #cite(label("Weigt2023Dyadic")) and for the uncentered maximal operator over axis-parallel cubes #cite(label("Weigt2025Cubes")) Theorem 1.1. Their geometry and indexing differ from centered disks. Moreover, a variation estimate controls a derivative measure, which may still have a singular part. For fractional orders $0 < beta < 1$, Beltran and Madrid established centered endpoint gradient bounds for radial $W^(1 \, 1)$ input #cite(label("BeltranMadrid2020CenteredFractional")) Theorem 1.2. Weigt subsequently proved endpoint gradient estimates for both the centered and uncentered operators #cite(label("Weigt2022Fractional")) Theorem 1.1. The positive order restricts overlap among optimizing balls in that proof; the mechanism degenerates at order zero.

Lahti and Weigt’s conditional regularity theorem upgrades local bounded variation of the centered maximal function to local Sobolev regularity when the input is Sobolev #cite(label("LahtiWeigt2025")) Theorem 1.2. It assumes the requisite variation bound. We prove that bound and then remove the singular part directly using the signed localization above. Finally, boundedness and continuity of the gradient map are distinct questions. The one-dimensional continuity results of Carneiro, Madrid and Pierce for the uncentered operator #cite(label("CarneiroMadridPierce2017")), and of González-Riquelme for the centered operator #cite(label("GonzalezRiquelme2023Continuity")), concern this further issue. Theorem 1 asserts the planar norm estimate.

=== 1.3 How the finite-band estimate is proved <how-the-finite-band-estimate-is-proved>

Write

#[#set math.equation(numbering: n => "(1.3)")
 $ u_t = A_t g \, #h(2em) h = \( nabla g \) thin #h(-0.16667em) upright(d) x \, #h(2em) V = \| h \| \( bb(R)^2 \) = integral \| nabla g \| . $ <eq:signed-average>]

Scaling reduces Proposition 2 to radii in $\[ 2^(- m) \, 1 \]$. The proof has one geometric input and two separate multiscale constructions. The first construction organizes scalar cancellation; the second chooses directions and pays for their changes in both scale and space.

===== 1.3.1 Disk moments and concentration in a shell. <disk-moments-and-concentration-in-a-shell.>

At an interior maximizing radius, the radial derivative of $u_t$ vanishes. A rotational moment vanishes on every disk. In complex notation these identities give a zero first moment, which is preserved by suitable positive mixtures of nearby disks. Variations of optimizing balls also produce weighted-gradient identities in Luiro’s work #cite(label("Luiro2018Radial")) Lemmas 2.2 and 2.4; we derive the identities needed for centered signed averages directly.

Identify $bb(R)^2$ with $bb(C)$, let $x$ be the disk center, and let $z$ be a point of its thin boundary shell. The purpose of the moment identity is visible in the affine factor

$ W_z \( y \) = 1 - overline(y - x) / overline(z - x) . $

This factor vanishes at $z$. Inserting it in a difference of balanced disk kernels therefore makes mass near $z$ inexpensive. This leads to the geometric question: when is almost all relevant shell mass concentrated near one point? A sweep by nested disks tangent at that point answers it outside one exceptional set of centers, uniformly over every radius in the band. Crucially, it requires a bound on positive mass only in an inner disk; the error mass is controlled separately.

These observations yield a local directional estimate. On a square of side $r$, decompose $h$ into positive measures with directions in one cone and localized errors. Errors smaller than the observation scale have zero total vector mass; errors at scale $r$ are charged their full variation. An error of variation $b$ supported at scale $s lt.eq r$ is charged $b \( s \/ r \)^alpha$, with a fixed $alpha = 1 \/ 100$. The resulting sum controls the integral over the square of the supremum, over locally maximizing radii, of the gradient component pointing against the cone. Companion estimates handle band endpoints and the value oscillation

$ v_k \( x \) = sup_(0 < t \, t' lt.eq 4 r_k) \| u_t \( x \) - u_(t') \( x \) \| \, #h(2em) r_k = 2^(- k) . $

Those estimates include the endpoint arguments and the comparison of successively narrower kernels; shell concentration alone does not supply them.

===== 1.3.2 Scalar cancellation and a common price for each cell. <scalar-cancellation-and-a-common-price-for-each-cell.>

Let $phi.alt_q$ be the product of the two one-dimensional tents at a vertex $q$ of the level-$k$ dyadic grid: each factor equals one at its vertex coordinate and decreases linearly to zero one mesh width away. Set $h_q = integral phi.alt_q thin #h(-0.16667em) upright(d) h$, $a_q = \| h_q \|$. The tents form positive partitions of unity and refine positively onto finer grids. We express vectors in each of finitely many bases formed by the two boundary directions of a cone. For each scalar coordinate, we start with the actual signed density at the finest level. Pair its positive and negative parts in equal masses, retain the constant-sign remainder, and repeat this operation on the weighted remainders at each parent. This bottom-up construction retains the support and birth level of every pair, including cancellation inside the finest tents. Its identity is an identity of measures, so there is no unrepresented terminal density.

The masses paired at successive levels form a telescoping sum. Charging each pair at coarser observation scales with the factor $\( s \/ r \)^alpha$ gives a nonnegative price $D_Q$ for every dyadic cell, with

#[#set math.equation(numbering: n => "(1.4)")
 $ sum_Q D_Q lt.eq C V . $ <eq:overview-price-budget>]

One price works for every direction in the fixed finite palette. The local estimates then cost $D_Q$ together with appropriate nearby vector masses $a_q$ at the observation scale. Multiscale oscillation budgets already play a role in Kurka’s one-dimensional proof #cite(label("Kurka2015")) Lemma 1.5; the scalar measure decomposition and its common prices are proved here.

===== 1.3.3 Vector particles and the cost of choosing directions. <vector-particles-and-the-cost-of-choosing-directions.>

The remaining vector masses require a different construction. Vector refinement makes their total increase with the level, while keeping it at most $V$. We realize these masses by a finite positive measure on refinement paths, adding mass when needed and recording its birth level. This construction preserves the complete path, including levels before birth, so that it can compare choices of direction made from the first scale onward. These vector particles differ from the scalar cancelling pairs: their role is to turn estimates along paths into sums of vector-mass charges over cells.

Two costs must be controlled. A change of direction starts a new run of radius scales and creates endpoint terms. Spatial variation of the choice of direction creates derivatives of its weights when we integrate by parts. Section 4 constructs a finite-state law at each point $x$ and bounds sums of both costs, weighted by these vector masses, by $C V$, with the spatial suprema needed for the cell estimates. Vector-additivity defects control changes along particles, and comparison at nearby points transfers that control to the spatially varying law.

===== 1.3.4 Assembly and cancellation of differentiated rows. <assembly-and-cancellation-of-differentiated-rows.>

After the common prices and the direction costs have been bounded, we assemble the radius bands. A run is a maximal consecutive interval of scales carrying the same direction. For each history, apply the local directional estimate to the supremum over the radii of every run, then average over histories. The common prices and the bounds for direction changes pay for the unfavorable components and the endpoints of runs.

For each run, subtract the average at its starting scale from its envelope; the endpoint estimates pay for the gradients of these baselines. The vector quantity to be integrated by parts is the sum of the resulting envelopes multiplied by their run directions. Its history weight depends on $x$. If $pi_k \( x \; n \, n' \)$ is the probability of passing from direction $n$ to direction $n'$ at step $k$, normalization of each row gives

$ sum_(n') nabla_x pi_k \( x \; n \, n' \) = 0 . $

Before taking absolute values, we can therefore subtract the analogous vector sum for the preceding history, ending its last run at level $k - 1$. That sum is independent of the next direction. The difference contains only extensions of the last run and new runs, and is bounded by $C sum_(l gt.eq k) v_l$. The local value estimate contributes the scale $r_l$, while a differentiated transition row has scale $1 \/ r_k$. Their ratio $r_l \/ r_k$ is exactly the geometric weight controlled by the direction-cost estimate. Together with the common-price budget, these bounds give (1.2).

=== 1.4 From the finite-band estimate to a weak gradient <from-the-finite-band-estimate-to-a-weak-gradient>

Approximation extends Proposition 2 to signed Sobolev inputs. Applying it to $g = \| f \|$ and increasing the radius bands first gives a finite vector Radon measure representing the derivative of $M f$. To prove that this measure has no singular part, fix a compact null set and a positive radius threshold. The envelope over larger radii is Lipschitz, so its contribution vanishes as the neighborhood of the null set shrinks. For small radii, the signed cutoff and local mean subtraction described above reduce the cost to the integral of $\| nabla g \|$ within a fixed multiple of the threshold distance. After shrinking the neighborhood, let the radius threshold tend to zero. This gradient integral then vanishes as well. Inner regularity gives absolute continuity of the derivative measure and proves Theorem 1.

Lower-radius Lipschitz truncations appear in Hajłasz and Malý #cite(label("HajlaszMaly2010")) Lemma 8, and local/nonlocal splitting with subtraction of an input mean appears in Saari #cite(label("Saari2019")) Section 3.1. The signed estimate above supplies the gradient-only localization used here.

Section 2 proves disk cancellation and the local estimates. Section 3 gives scalar refinement and common prices; Section 4 constructs the vector particles and spatial label law. Section 5 assembles the finite bands, and Section 6 passes to Sobolev input and removes the singular part. An analytic appendix records the Sobolev calculus, square localization, and vector-measure facts in the forms used in the final step.

=== 1.5 Conventions <conventions>

A constant denoted by $C$ may increase between occurrences. All parameters, including cone apertures, finite direction nets and geometric neighborhood sizes, are fixed absolute choices. In a local lemma the explicitly listed cone and support constants are allowed dependencies. No constant depends on the number of radius scales.

For a vector measure $nu$, $\| nu \|$ denotes its total variation. For a real number $a$, $a_(+) = max \( a \, 0 \)$. A supremum of nonnegative quantities over an empty set is zero. When $nabla u_t$ is written, the radius is held fixed. We use the classical strong $L^p$ maximal inequality for $p > 1$ #cite(label("Kinnunen1997")) (1.2); a general account is given in #cite(label("Stein1970")) Chapter I. The analytic appendix records the remaining standard inputs in the forms used here.

== 2 Cancellation at disks and three local bounds <sec:local>

Throughout this section, $g in C^oo \( bb(R)^2 \)$ is real valued, $h = nabla g thin d x$, and $u_t = A_t g$. The averages are signed. No compact-support assumption on $g$ is needed for the local estimates. Our goal is to control three quantities on a unit square: unfavorable directional gradients at locally maximizing radii, gradients at band maxima and endpoints, and differences of averages. The common input is a decomposition of the gradient into positive directions and error pieces, with small support and zero total mass below size one. The discount on the latter errors will make the scale sum in Section 3 finite. We fix

#[#set math.equation(numbering: n => "(2.1)")
 $ alpha = 1 / 100 . $ <eq:local-alpha>]

An equality of measures on an open set means equality of their restrictions there. The component measures themselves will always remain defined on the whole plane.

#thm([Lemma 2.1.])[
  (Local estimates).  #emph[Let $Q$ be a square of side length one and let $Omega = { y : "dist" \( y \, Q \) < 10 }$. Suppose that, on $Omega$, 
#[#set math.equation(numbering: n => "(2.2)")
 $ h = sum_i v_i sigma_i + beta \, #h(2em) beta = sum_d beta_d . $ <eq:local-decomposition>]

 The sums are finite. The measures in the sums are finite, defined on $bb(R)^2$, and absolutely continuous with respect to Lebesgue measure. Each $sigma_i$ is nonnegative and each $v_i$ is a constant unit vector. For each $d$, write $m_d = \| beta_d \| \( bb(R)^2 \)$ and assign a number $s_d in \( 0 \, 1 \]$. If $s_d < 1$, assume that $beta_d \( bb(R)^2 \) = 0$ and that $beta_d$ is supported in a ball of radius at most $C_s s_d$, where $C_s$ is fixed. Set 
$ S = sum_i sigma_i \, #h(2em) A = sum_d s_d^alpha m_d . $

 For $x in Q$, define 
$ cal(I) \( x \) & = { r in \[ 1 \, 2 \] : u_r \( x \) gt.eq u_t \( x \) upright(" for every ") t > 0 upright(" with ") \| t - r \| lt.eq 1 \/ 4 } \,\
cal(J) \( x \) & = { r in \[ 1 \, 2 \] : u_r \( x \) = max_(1 lt.eq t lt.eq 2) u_t \( x \) } union { 1 \, 2 } . $

 Then the following estimates hold.]
  + #emph[#emph[Unfavorable directional gradients.] If $e$ is a unit vector and $e dot.op v_i gt.eq kappa > 0$ for all $i$, then 
#[#set math.equation(numbering: n => "(2.3)")
 $ integral_Q sup_(r in cal(I) \( x \)) \( - e dot.op nabla u_r \( x \) \)_(+) thin d x lt.eq C A . $ <eq:local-direction>]

]
  + #emph[#emph[Band maxima and forced endpoints.] Without a condition on the directions $v_i$, 
#[#set math.equation(numbering: n => "(2.4)")
 $ integral_Q sup_(r in cal(J) \( x \)) \| nabla u_r \( x \) \| thin d x lt.eq C #scale(x: 120%, y: 120%)[\(] A + S \( bb(R)^2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:local-size>]

]
  + #emph[#emph[Differences of nearby averages.] We also have 
#[#set math.equation(numbering: n => "(2.5)")
 $ integral_Q sup_(0 < t \, t' lt.eq 4) \| u_t \( x \) - u_(t') \( x \) \| thin d x lt.eq C #scale(x: 120%, y: 120%)[\(] A + S \( bb(R)^2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:local-value>]

]
  #emph[Here $C$ depends only on $C_s$, and in the first estimate also on $kappa$. A supremum of nonnegative quantities over an empty set is zero.]
] <lem:local>

All the quantities in this statement are measurable. To see this, extend the displayed definitions of $cal(I) \( x \)$ and $cal(J) \( x \)$ to all $x in bb(R)^2$. Their graphs are closed in $bb(R)^2 times \[ 1 \, 2 \]$, by joint continuity of $u_t \( x \)$ and continuity of a maximum over a compact interval. For either of the first two suprema, its superlevel set at a positive closed threshold is the projection of a closed set with the radius variable in a compact interval, and is therefore closed. Restricting these Borel functions to $Q$ proves the claim also for half-open squares. The last supremum can be taken over positive rational $t \, t' lt.eq 4$, by continuity in the radius variables.

The first estimate discounts cancellation without charging the positive mass $S$: its cone contribution is favorable at every tested radius. Comparisons of kernels will still require a bound on its weighted mass. The second estimate pays for $S$ and also covers the two forced radii, so it can be used when a radius interval ends. The third controls values rather than gradients; its factor under rescaling will pay for derivatives of spatial weights. Section 3 gives those scaled applications.

We prove the first two bounds by comparing successively narrower disk kernels. Before estimating their changes, we explain why a maximizing radius supplies a useful moment identity and why concentration in a small cap makes that identity effective.

=== 2.1 Disk moments and an affine cancellation <disk-moments-and-an-affine-cancellation>

We seek cancellation in a thin shell where two nearby disks differ. Estimating by the entire gradient mass on that shell would ignore the maximizing property of the radius. At an interior maximizing radius, a radial derivative vanishes; a rotational moment vanishes for every disk. We combine these identities using complex notation, then preserve them while smoothing the disk boundary.

Variations of optimizing balls also give weighted-gradient cancellation identities in Luiro’s work on the uncentered maximal operator #cite(label("Luiro2018Radial")) Lemmas 2.2 and 2.4. There the balls optimize averages of $\| f \|$. We derive the identities needed here directly for centered signed averages.

We identify the plane with the complex numbers, using the usual positive orientation. A vector measure is then a complex measure, and $overline(y - x) thin d h \( y \)$ denotes complex multiplication. For every disk,

#[#set math.equation(numbering: n => "(2.6)")
 $ "Im" integral_(B \( x \, t \)) overline(y - x) thin d h \( y \) = 0 \, #h(2em) partial_t u_t \( x \) = frac(1, pi t^3) "Re" integral_(B \( x \, t \)) overline(y - x) thin d h \( y \) . $ <eq:local-moment-identities>]

The first identity follows by integrating the divergence of $g \( y \) \( y - x \)^perp$: the vector field $\( y - x \)^perp$ is divergence free and tangent to the boundary circle. For the second, differentiate $u_t \( x \) = pi^(- 1) integral_(B \( 0 \, 1 \)) g \( x + t w \) thin d w$. The same change of variables gives

#[#set math.equation(numbering: n => "(2.7)")
 $ nabla u_t \( x \) = frac(h \( B \( x \, t \) \), pi t^2) . $ <eq:local-spatial-gradient>]

#thm([Lemma 2.2.])[
  (Balanced kernels).  #emph[Suppose that $r in \[ 1 \, 2 \]$ and $0 < delta lt.eq 1 \/ 4$, and that 
$ u_r \( x \) gt.eq u_(r - delta) \( x \) \, #h(2em) u_r \( x \) gt.eq u_(r + delta) \( x \) . $

 There is a probability density $k$ supported on $\[ r - delta \, r + delta \]$, bounded by $C \/ delta$, such that 
$ K \( y \) = integral k \( t \) upright(bold(1))_(B \( x \, t \)) \( y \) thin d t $

 satisfies 
#[#set math.equation(numbering: n => "(2.8)")
 $ integral K \( y \) overline(y - x) thin d h \( y \) = 0 . $ <eq:local-zero-moment>]

 Moreover, $0 lt.eq K lt.eq 1$, $"Lip" \( K \) lt.eq C \/ delta$, $K = 1$ on $B \( x \, r - delta \)$, and $K = 0$ outside $B \( x \, r + delta \)$. The density may be chosen measurably in $\( x \, r \)$.]
] <lem:local-balanced>

#proof[
  Normalize $t^(- 3)$ separately on $\[ r - delta \, r \]$ and $\[ r \, r + delta \]$ to obtain probability densities $k_(-)$ and $k_(+)$. Let $M_(-)$ and $M_(+)$ be the real moments in (2.6) averaged with these densities. Integration of that identity shows $M_(-) gt.eq 0$ and $M_(+) lt.eq 0$. If $M_(-) - M_(+) > 0$, take
  $ k = a k_(-) + \( 1 - a \) k_(+) \, #h(2em) a = frac(- M_(+), M_(-) - M_(+)) \; $
  if both moments are zero, take $k = k_(-)$. The imaginary moments are zero separately, so (2.8) follows. The normalizing factors are comparable to $delta$, because $3 \/ 4 lt.eq t lt.eq 9 \/ 4$. This proves the density bound and all the claims about $K$. The formula for $a$ is Borel, with the stated convention at zero, which gives the last assertion. ◻
]

The balanced kernels in Lemma 4 smooth the disk boundary without losing its zero moment. Consider two such kernels, possibly with different widths. Their difference is supported in the larger shell. The following elementary observation explains what we want to know about the mass on that shell.

#thm([Lemma 2.3.])[
  (Affine cancellation).  #emph[Let $x in bb(R)^2$, $r in \[ 1 \, 2 \]$, $0 < delta lt.eq 1 \/ 4$, and 
$ D = { y : \| \| y - x \| - r #scale(x: 120%, y: 120%)[\|] lt.eq delta } . $

 Let $h$ be a complex measure whose variation is finite on $B \( x \, 3 \)$. Suppose that $K_0 \, K_1 : bb(R)^2 arrow.r \[ 0 \, 1 \]$ are Borel functions supported in $B \( x \, 3 \)$, that $K_1 - K_0$ is supported in $D$, and that 
$ integral K_i \( y \) overline(y - x) thin d h \( y \) = 0 #h(2em) \( i = 0 \, 1 \) . $

 Set $P_i = integral K_i thin d h$. For every $z in D$, 
#[#set math.equation(numbering: n => "(2.9)")
 $ P_1 - P_0 = integral (1 - overline(y - x) / overline(z - x)) \( K_1 - K_0 \) \( y \) thin d h \( y \) . $ <eq:local-affine-identity>]

 For every $0 < rho lt.eq 1$, this implies 
#[#set math.equation(numbering: n => "(2.10)")
 $ \| P_1 - P_0 \| lt.eq  & 2 rho integral_(D ∩ B \( z \, rho \)) \| K_1 - K_0 \| thin d \| h \|\
 & + 10 integral_(D \\ B \( z \, rho \)) \| K_1 - K_0 \| thin d \| h \| . $ <eq:local-affine-bound>]

]
] <lem:local-affine>

#proof[
  Since $\| z - x \| gt.eq r - delta gt.eq 3 \/ 4$, the denominator is nonzero. Subtract the difference of the two zero-moment identities, divided by $overline(z - x)$, from $P_1 - P_0$. This gives (2.9). Its multiplier is
  $ W_z \( y \) = overline(z - y) / overline(z - x) . $
  On $B \( z \, rho \)$ its absolute value is at most $2 rho$. On $D$, $\| y - z \| lt.eq 2 \( r + delta \) lt.eq 9 \/ 2$ and $\| z - x \| gt.eq 3 \/ 4$, so $\| W_z \| lt.eq 6 lt.eq 10$. Splitting the integral into the two regions proves (2.10). ◻
]

Thus concentration near $z$ turns the factor $1$ in a variation estimate into the small factor $2 rho$. We will call $D ∩ B \( z \, rho \)$ a cap of the shell. The geometric question is now concrete: when can all but a controlled amount of shell mass be placed in one cap?

For the intended use, two positive measures play different roles. One, denoted by $nu$, detects whether the shell carries enough error mass to require this argument. The other, denoted by $S$, describes positive contributions to the gradient. The conclusion must control both measures on the shell, but the available hypothesis bounds only $S$ in the inner disk. A bound involving all of $S \( bb(R)^2 \)$ would lose that information. The tangent-disk sweep below is what allows the inner mass bound to suffice.

=== 2.2 One exceptional set for all radii <one-exceptional-set-for-all-radii>

We use Lebesgue measure for the size $\| E \|$ of a set of centers. The measures $S$ and $nu$ in the next lemma are arbitrary finite positive Borel measures; they may have atoms. No maximizing radius is selected, and no regularity of these measures is assumed.

#thm([Lemma 2.4.])[
  (Concentration in a thin shell).  #emph[Let $S$ and $nu$ be finite positive Borel measures on $bb(R)^2$, let $U > 0$ and $T gt.eq 0$, and suppose that 
$ 0 < rho lt.eq 1 \, #h(2em) 0 < delta lt.eq rho^2 / 1600 . $

 Write 
$ D \( x \, r \, delta \) = { y : \| \| y - x \| - r #scale(x: 120%, y: 120%)[\|] lt.eq delta } . $

 There is a Borel set $E subset bb(R)^2$ such that 
#[#set math.equation(numbering: n => "(2.11)")
 $ \| E \| lt.eq C [(frac(nu \( bb(R)^2 \), U))^2 delta / rho + frac(nu \( bb(R)^2 \), U) delta / rho^2 (1 + T / U)] \, $ <eq:shell-exception>]

 and the following implication holds for every $x in.not E$ and every $r in \[ 1 \, 2 \]$: if 
#[#set math.equation(numbering: n => "(2.12)")
 $ nu \( D \( x \, r \, delta \) \) gt.eq U \, #h(2em) S \( B \( x \, r - delta \) \) lt.eq T \, $ <eq:shell-hypotheses>]

 then there is $z in D \( x \, r \, delta \)$ for which 
#[#set math.equation(numbering: n => "(2.13)")
 $ \( S + nu \) #scale(x: 120%, y: 120%)[\(] D \( x \, r \, delta \) \\ B \( z \, rho \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 U . $ <eq:shell-cap>]

 The constant in (2.11) is absolute. In particular, neither the exceptional set nor its bound involves a choice of $r$.]
] <lem:shell-concentration>

#proof[
  If the cap conclusion fails, every shell point $z$ sees more than $U$ of either $nu$ or $S$ outside its cap. The first alternative will restrict the centers to thin strips. For the second, nested tangent disks capture that remote $S$-mass during a short parameter interval, starting with mass at most $T$. We first prove the needed geometry, then combine the two alternatives in one Borel majorant that contains no radius parameter.
  Put $v = 200 delta \/ rho^2$, so $v lt.eq 1 \/ 8$. We first record the geometry of disks tangent at a fixed point $z$. For a unit vector $theta$, the disks
  $ B \( z + L theta \, L \) \, #h(2em) L > 0 \, $
  increase with $L$. In fact, for $w = y - z$, membership is the inequality
  #[#set math.equation(numbering: n => "(2.14)")
   $ \| w \|^2 < 2 L thin w dot.op theta . $ <eq:shell-entry>]
  When $w dot.op theta > 0$, the entry parameter is $L_(*) \( y \) = \| w \|^2 \/ \( 2 w dot.op theta \)$.
  Fix $x \, z$ with $l = \| x - z \| in \[ 1 \/ 2 \, 3 \]$ and put $theta = \( x - z \) \/ l$. If $\| y - z \| gt.eq rho$ and $\| \| y - x \| - l #scale(x: 120%, y: 120%)[\|] lt.eq 2 delta$, then, with $a = \( y - z \) dot.op theta$,
  $ \| \| y - z \|^2 - 2 l a #scale(x: 120%, y: 120%)[\|] = \| \| y - x \|^2 - l^2 #scale(x: 120%, y: 120%)[\|] lt.eq 13 delta . $
  The restriction on $delta$ gives $a gt.eq rho^2 \/ 12 > 0$, and hence
  #[#set math.equation(numbering: n => "(2.15)")
   $ \| L_(*) \( y \) - l \| lt.eq 78 delta / rho^2 < v / 2 . $ <eq:shell-entry-window>]
  Thus all such points enter strictly between $l - v$ and $l + v$. Conversely, if $\| y - z \| gt.eq rho$ and $y in B \( z + \( l - v \) theta \, l - v \)$, then $a > rho^2 \/ \( 2 \( l - v \) \) gt.eq rho^2 \/ 6$. It follows that
  $ \| y - x \|^2 < l^2 - 2 v a lt.eq l^2 - 200 / 3 delta < \( l - 2 delta \)^2 . $
  We have proved
  #[#set math.equation(numbering: n => "(2.16)")
   $ { y : \| y - z \| gt.eq rho } ∩ B \( z + \( l - v \) theta \, l - v \) subset B \( x \, l - 2 delta \) . $ <eq:shell-earlier-interior>]
  Figure 1 illustrates the nested disks and these two comparisons.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  circle((1.628, 0), radius: 1.628, stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  circle((2.1, 0), radius: 2.1, stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10))
  circle((2.573, 0), radius: 2.573, stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((-0.3675, 0), (5.617, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((5.617, 0), [$theta$], anchor: "west", padding: 0.1176cm)
  circle((0, 0), radius: 0.0635, fill: black, stroke: none)
  content((0, 0), [$z$], anchor: "north-east", padding: 0.1176cm)
  circle((1.628, 0), radius: 0.04586, fill: black, stroke: none)
  content((1.628, -0.1764), [$z+(l-v) theta$], anchor: "north", padding: 0.1176cm)
  circle((2.1, 0), radius: 0.05644, fill: black, stroke: none)
  content((2.1, 0.1411), [$x=z+l theta$], anchor: "south", padding: 0.1176cm)
  circle((2.573, 0), radius: 0.04586, fill: black, stroke: none)
  line((2.573, -0.0735), (5.565, -0.8925), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((5.565, -0.8925), [#text(fill: rgb("#000000"))[$z+(l+v) theta$]], anchor: "west", padding: 0.1176cm)
  circle((2.1, 2.1), radius: 0.07056, fill: black, stroke: none)
  content((2.1, 2.1), [$y$], anchor: "south-west", padding: 0.1176cm)
  line((0, 0), (2.1, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((5.565, 1.732), [$ B(z+L theta ,L)$#linebreak()increases with $L$], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: The tangent-disk sweep. All boundary circles pass through $z$. A shell point $y$ with $\| y - z \| gt.eq rho$ enters between the parameters $l - v$ and $l + v$, with $v$ proportional to $delta \/ rho^2$. Mass outside $B \( z \, rho \)$ already present at $l - v$ lies in the inner disk $B \( x \, l - 2 delta \)$. When $z in D \( x \, r \, delta \)$, this disk is contained in the controlled disk $B \( x \, r - delta \)$. The drawing is schematic. ],
  ) <fig:tangent-disks>
  For $z in bb(R)^2$ and $theta$ on the unit circle define
  $ H_(z \, theta) \( L \) = cases(delim: "{", S #scale(x: 120%, y: 120%)[\(] { y : \| y - z \| gt.eq rho } ∩ B \( z + L theta \, L \) #scale(x: 120%, y: 120%)[\)] \, & L > 0 \,, 0 \, & L lt.eq 0 .) $
  This is bounded and nondecreasing in $L$. It is jointly Borel in all its arguments, since it is the integral of the Borel indicator given by (2.14), together with the other displayed tests. For $l = \| x - z \| in \[ 1 \/ 2 \, 3 \]$ and $theta = \( x - z \) \/ l$, let $cal(C) \( x \, z \)$ be the condition
  #[#set math.equation(numbering: n => "(2.17)")
   $ H_(z \, theta) \( l - v \) lt.eq T \, #h(2em) H_(z \, theta) \( l + v \) - H_(z \, theta) \( l - v \) gt.eq U . $ <eq:shell-ray-condition>]
  Define the nonnegative Borel function
  #[#set math.equation(numbering: n => "(2.18)")
   $ cal(M) \( x \) = 1 / U integral_(1 \/ 2 lt.eq \| x - z \| lt.eq 3) #scale(x: 300%, y: 300%)[\[] & 1 / U integral upright(bold(1))_({ thin lr(|\| y - x \| - \| x - z \||) lt.eq 2 delta \, med \| y - z \| gt.eq rho thin }) thin d nu \( y \)\
 & + upright(bold(1))_({ cal(C) \( x \, z \) }) #scale(x: 300%, y: 300%)[\]] thin d nu \( z \) \, #h(2em) E = { x : cal(M) \( x \) gt.eq 1 } . $ <eq:shell-majorant>]
  Suppose that (2.12) holds at $\( x \, r \)$ and that (2.13) fails for every $z in D = D \( x \, r \, delta \)$. For any such $z$, either $nu \( D \\ B \( z \, rho \) \) > U$ or $S \( D \\ B \( z \, rho \) \) > U$. Also $l = \| x - z \| in \[ 1 \/ 2 \, 3 \]$ and every $y in D$ satisfies $\| \| y - x \| - l #scale(x: 120%, y: 120%)[\|] lt.eq 2 delta$. In the first alternative, the first term in brackets in (2.18) exceeds one. In the second alternative, (2.15) gives the second inequality in (2.17). The first inequality follows from (2.16), because $l - 2 delta lt.eq r - delta$. The bracket is therefore at least one for every $z in D$. Since $nu \( D \) gt.eq U$, we obtain $cal(M) \( x \) gt.eq 1$. This proves the required implication outside the Borel set $E$, simultaneously for all $r$.
  It remains to estimate $integral cal(M)$. For fixed $y \, z$ with $\| y - z \| gt.eq rho$, the centers in the first term satisfy $\| x - z \| lt.eq 3$ and
  $ \| \| x - y \|^2 - \| x - z \|^2 #scale(x: 120%, y: 120%)[\|] lt.eq 13 delta . $
  The difference of squares is an affine function of $x$ with gradient of length $2 \| y - z \|$. These centers lie in a strip of width at most $13 delta \/ \| y - z \|$ intersected with $overline(B) \( z \, 3 \)$, and thus have area at most $C delta \/ rho$. Tonelli’s theorem bounds the first contribution to $integral cal(M)$ by $C nu \( bb(R)^2 \)^2 delta \/ \( U^2 rho \)$.
  For the second contribution, fix $z \, theta$ and abbreviate $H = H_(z \, theta)$ and $G = min \( H \, T + U \)$. On the set of $l$ satisfying (2.17),
  $ G \( l + v \) - G \( l - v \) gt.eq U . $
  Because $G$ is bounded and nondecreasing,
  $ integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] G \( l + v \) - G \( l - v \) #scale(x: 120%, y: 120%)[\)] thin d l lt.eq 2 v \( T + U \) . $
  For completeness, integration over $\[ - M \, M \]$ cancels the overlapping intervals and leaves two intervals of length $2 v$; letting $M$ increase proves the inequality. Thus the permitted $l$ have length at most $2 v \( 1 + T \/ U \)$. Polar coordinates about $z$, with $l lt.eq 3$, and another application of Tonelli’s theorem bound the second contribution by $C nu \( bb(R)^2 \) v \( 1 + T \/ U \) \/ U$. Since $\| E \| lt.eq integral cal(M)$, these two estimates prove (2.11). ◻
]

Under its shell and inner-disk mass hypotheses, the shell lemma supplies a cap for every radius at a center outside one Borel set. The affine identity then suppresses the mass on that cap. To obtain the discounted estimates, we still have to compare kernel widths, control the positive interior mass in the directional argument, and treat radii forced at band endpoints. We do this next; the value estimate will require a separate kernel.

=== 2.3 Cancellation of small error pieces <cancellation-of-small-error-pieces>

We now compare kernels at dyadic widths. Put

#[#set math.equation(numbering: n => "(2.19)")
 $ b = 2 alpha = 1 / 50 \, #h(2em) eta = 1 / 10 \, #h(2em) gamma = 1 / 5 \, #h(2em) delta_j = 2^(- j) . $ <eq:local-exponents>]

Choose a fixed $delta_(*) > 0$ so small that $delta_(*) lt.eq 1 \/ 4$ and $delta lt.eq delta^(2 gamma) \/ 1600$ whenever $0 < delta lt.eq delta_(*)$.

We record estimates valid for any sequence of probability-mixture kernels $K_j$, centered at the same $x$ and $r in \[ 1 \, 2 \]$, with the support and Lipschitz properties of Lemma 4 at width $delta_j$. The zero-moment condition is not needed for these estimates. Write

#[#set math.equation(numbering: n => "(2.20)")
 $ nu_j = sum_(s_d gt.eq delta_j^2) \| beta_d \| \, #h(2em) p_j = integral K_j thin d beta \, #h(2em) D_j = D \( x \, r \, delta_j \) . $ <eq:local-coarse-measure>]

Then

#[#set math.equation(numbering: n => "(2.21)")
 $ nu_j \( bb(R)^2 \) lt.eq A delta_j^(- b) \, #h(2em) \| p_j \| lt.eq C A delta_j^(- alpha) . $ <eq:local-basic-cancellation>]

Indeed, for $s_d < 1$, subtracting the value of $K_j$ at the center of a supporting ball gives

$ lr(|integral K_j thin d beta_d|) lt.eq C m_d min \( 1 \, s_d \/ delta_j \) . $

For $s_d = 1$, the same upper bound holds directly from $\| K_j \| lt.eq 1$. Now use $min \( 1 \, a \) lt.eq a^alpha$ for $a > 0$ and the definition of $A$. The bound for $nu_j$ follows directly from $s_d gt.eq delta_j^2$.

If $F$ is a scalar or complex test function with $"Lip" \( F \) lt.eq C \/ delta_j$, the pieces with $s_d < delta_j^2$ satisfy

#[#set math.equation(numbering: n => "(2.22)")
 $ lr(|sum_(s_d < delta_j^2) integral F thin d beta_d|) lt.eq C / delta_j sum_(s_d < delta_j^2) s_d m_d lt.eq C A delta_j^(1 - b) . $ <eq:local-fine-cancellation>]

Only the Lipschitz bound is used here; constants cancel because each of these pieces has zero total vector mass. In particular, (2.22) applies to $K_(j + 1) - K_j$ and to $overline(y - x) \( K_(j + 1) - K_j \)$. These tests have the required global Lipschitz bounds, since their supports are in $B \( x \, 3 \)$. Their supports are also in $D_j$. Consequently

#[#set math.equation(numbering: n => "(2.23)")
 $ \| p_(j + 1) - p_j \| & lt.eq C #scale(x: 120%, y: 120%)[\(] nu_j \( D_j \) + A delta_j^(1 - b) #scale(x: 120%, y: 120%)[\)] \,\
lr(|integral overline(y - x) \( K_(j + 1) - K_j \) thin d beta \( y \)|) & lt.eq C #scale(x: 120%, y: 120%)[\(] nu_j \( D_j \) + A delta_j^(1 - b) #scale(x: 120%, y: 120%)[\)] . $ <eq:local-increment-tests>]

All these kernels are supported in $Omega$ when $x in Q$. Thus (2.2) can be used in every pairing below, even if some of its component measures have support outside $Omega$. For fixed $x \, r$, as $j arrow.r oo$ the kernels converge off the circle to $K_oo = upright(bold(1))_(B \( x \, r \))$. Absolute continuity of all the component measures gives convergence of their integrals by dominated convergence. The same holds for the moment integrals. In particular, if every finite-width kernel is balanced, then $K_oo$ has zero moment as well. This is a statement at each fixed $\( x \, r \)$: every circle has zero mass for every absolutely continuous component. There is no exceptional set depending on the radius to remove. Absolute continuity is used here, but was not needed in the Borel shell lemma.

=== 2.4 The directional estimate <the-directional-estimate>

We now prove (2.3). If $A = 0$, all the error measures vanish, and $e dot.op h \( B \( x \, r \) \) gt.eq 0$ for every relevant disk; the conclusion follows. Assume $A > 0$.

We prove a superlevel-set estimate by separating widths at which the coarse error mass in the shell is small from those at which it is large. Small-mass widths have directly summable error increments. At the remaining widths we compare only increases of the negative projection: the later negative projection controls the interior positive mass, allowing Lemma 6 to be applied.

Let $lambda gt.eq L_0 A$, where the fixed constant $L_0$ will be chosen large enough in the course of the proof. Put $q = A \/ lambda$ and choose $j_0$ so that

#[#set math.equation(numbering: n => "(2.24)")
 $ q \/ 2 < delta_(j_0) lt.eq q . $ <eq:local-start-scale>]

We require $L_0 gt.eq 1 \/ delta_(*)$, so all widths under consideration are at most $delta_(*)$. At a fixed $x in Q$ and $r in cal(I) \( x \)$, use Lemma 4 to choose $K_j$ for every $j gt.eq j_0$, and write

$ P_j = integral K_j thin d h \, #h(2em) N_j = \( - e dot.op P_j \)_(+) \, #h(2em) U_j = lambda delta_j^eta . $

Call $j$ active for $\( x \, r \)$ if $nu_j \( D_j \) gt.eq U_j$. If it is inactive, (2.23) and $1 - b > eta$ give

#[#set math.equation(numbering: n => "(2.25)")
 $ \| p_(j + 1) - p_j \| + lr(|integral overline(y - x) \( K_(j + 1) - K_j \) thin d beta \( y \)|) lt.eq C lambda delta_j^eta . $ <eq:local-inactive>]

Here and below we use $A lt.eq lambda$.

Choose $C_0$ sufficiently large depending only on $C_s$ and $kappa$, and put $T_j = C_0 lambda delta_j^(- b)$. Apply Lemma 6 with

$ nu = nu_j \, quad delta = delta_j \, quad rho = delta_j^gamma \, quad U = U_j \, quad T = T_j . $

It gives Borel sets $E_j$, independent of $r$, such that

#[#set math.equation(numbering: n => "(2.26)")
 $ \| E_j \| lt.eq C [q^2 delta_j^(14 \/ 25) + q delta_j^(9 \/ 25)] . $ <eq:local-shell-tail>]

To check the exponents, the first term of (2.11) gives $1 - gamma - 2 b - 2 eta = 14 \/ 25$. The second term is a sum of powers $1 - 2 gamma - b - eta$ and $1 - 2 gamma - 2 b - 2 eta = 9 \/ 25$; because $delta_j lt.eq 1$, both are bounded by a constant times the latter. Constants in (2.26) may depend on the already fixed $C_0$.

Fix a center outside $union.big_(j gt.eq j_0) E_j$, and keep any $r in cal(I) \( x \)$ fixed. Positivity in the direction $e$ implies

#[#set math.equation(numbering: n => "(2.27)")
 $ e dot.op P_j gt.eq kappa integral K_j thin d S + e dot.op p_j \, #h(2em) N_j lt.eq \| p_j \| . $ <eq:local-cone-sign>]

Before the first active index, all the increments of $p_j$ obey (2.25). Hence, if $j$ is the first active index, or if $j = oo$ and there are no active indices,

#[#set math.equation(numbering: n => "(2.28)")
 $ N_j lt.eq C (A delta_(j_0)^(- alpha) + lambda delta_(j_0)^eta) . $ <eq:local-first-active>]

The formula at infinity follows from the dominated-convergence observation above.

The first active width has therefore been controlled. To continue, we compare consecutive active widths, allowing arbitrarily many inactive widths between them. Only an increase of the negative projection needs a new estimate; that sign will supply the positive interior-mass bound required by the shell lemma.

Suppose now that $j$ is active and $l > j$ is the next active index; set $l = oo$ if there is no next one. The individual bound in (2.21) at $j$ and $j + 1$, followed by the inactive increments between $j + 1$ and $l$, gives

#[#set math.equation(numbering: n => "(2.29)")
 $ \| p_j \| + \| p_l \| lt.eq C (A delta_j^(- alpha) + lambda delta_j^eta) lt.eq C lambda delta_j^(- b) . $ <eq:local-gap-errors>]

We need to estimate a change only when $N_l > N_j$. In that case $e dot.op P_l < 0$, so (2.27) gives

$ integral K_l thin d S lt.eq kappa^(- 1) \| p_l \| . $

Since $K_l = 1$ on $B \( x \, r - delta_j \)$, this proves $S \( B \( x \, r - delta_j \) \) lt.eq T_j$ after fixing $C_0$ large enough to dominate the constant just obtained. The shell lemma therefore supplies a point $z in D_j$ such that

#[#set math.equation(numbering: n => "(2.30)")
 $ \( S + nu_j \) #scale(x: 120%, y: 120%)[\(] D_j \\ B \( z \, delta_j^gamma \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 U_j . $ <eq:local-chosen-cap>]

This point is used only at the current center and radius; no measurable selection of $z$ is required.

To estimate the positive mass on the cap, we need a weighted bound for both kernels being compared. The sign at $l$ supplies one, but $e dot.op P_j > 0$ would give no corresponding bound for $K_j$. We therefore replace $K_j$, when necessary, by a kernel with zero projection and the same negative part. If $e dot.op P_j lt.eq 0$, set $K_(*) = K_j$. Otherwise, interpolate between $K_j$ and $K_l$ to obtain a convex combination $K_(*)$ with $e dot.op P_(*) = 0$, where $P_(*) = integral K_(*) thin d h$. This is possible because $e dot.op P_l < 0$. In either case,

$ N_(*) := \( - e dot.op P_(*) \)_(+) = N_j \, #h(2em) e dot.op P_(*) lt.eq 0 . $

Writing $p_(*) = integral K_(*) thin d beta$ and using (2.29) and (2.27), we get

#[#set math.equation(numbering: n => "(2.31)")
 $ integral \( K_l + K_(*) \) thin d S lt.eq C lambda delta_j^(- b) . $ <eq:local-weighted-good>]

All of $K_j \, K_l \, K_(*)$ have zero moment, including when $l = oo$ by the preceding sharp-kernel limit. Since $\| z - x \| gt.eq 1 \/ 2$, define

$ W \( y \) = 1 - overline(y - x) / overline(z - x) . $

The affine identity in Lemma 5 gives

#[#set math.equation(numbering: n => "(2.32)")
 $ P_l - P_(*) = integral W \( y \) \( K_l - K_(*) \) \( y \) thin d h \( y \) . $ <eq:local-corrected-difference>]

The difference of kernels is supported on $D_j$, and

$ \| W \| lt.eq C delta_j^gamma quad upright("on ") B \( z \, delta_j^gamma \) \, #h(2em) \| W \| lt.eq C quad upright("on ") D_j . $

The contribution of $sum_i v_i sigma_i$ to (2.32) is therefore at most

#[#set math.equation(numbering: n => "(2.33)")
 $ C lambda delta_j^(gamma - b) + C U_j \, $ <eq:local-good-cap-cost>]

by (2.31), $\| K_l - K_(*) \| lt.eq K_l + K_(*)$, and (2.30).

For the error measures, $K_l - K_(*)$ is a scalar multiple in $\[ 0 \, 1 \]$ of $K_l - K_j$. Keep $W$ fixed and telescope

#[#set math.equation(numbering: n => "(2.34)")
 $ integral W \( K_l - K_j \) thin d beta = sum_(i = j)^(l - 1) integral W \( K_(i + 1) - K_i \) thin d beta . $ <eq:local-error-telescoping>]

For $l = oo$ this equality means the limit of the finite sums. We never apply a Lipschitz cancellation bound directly to the sharp kernel $K_oo$ or to its interpolant: only the finite consecutive differences in this sum need such a bound. On the first step, the pieces contributing to $nu_j$ cost at most $C delta_j^gamma nu_j \( bb(R)^2 \) + C U_j$ by (2.30). The remaining pieces cost $C A delta_j^(1 - b)$ by (2.22), since $W \( K_(j + 1) - K_j \)$ has Lipschitz constant at most $C \/ delta_j$. For $j < i < l$, use

$ integral W \( K_(i + 1) - K_i \) thin d beta = p_(i + 1) - p_i - 1 / overline(z - x) integral overline(y - x) \( K_(i + 1) - K_i \) thin d beta \( y \) . $

These are inactive steps, so their absolute values sum to at most $C lambda delta_j^eta$ by (2.25). Combining the estimates gives

$ lr(|integral W \( K_l - K_j \) thin d beta|) lt.eq C (A delta_j^(gamma - b) + A delta_j^(1 - b) + lambda delta_j^eta) . $

Together with (2.33), and using $gamma - b = 9 \/ 50 > eta$, this yields

#[#set math.equation(numbering: n => "(2.35)")
 $ N_l lt.eq N_j + \| P_l - P_(*) \| lt.eq N_j + C lambda delta_j^eta . $ <eq:local-active-increment>]

The same inequality is automatic when $N_l lt.eq N_j$.

Sum (2.35) along the active indices. If there are finitely many, include the last comparison with $l = oo$; if there are infinitely many, pass to the limit along them. Dominated convergence and (2.28) give

#[#set math.equation(numbering: n => "(2.36)")
 $ \( - e dot.op h \( B \( x \, r \) \) \)_(+) lt.eq C (A delta_(j_0)^(- alpha) + lambda delta_(j_0)^eta) lt.eq C lambda (q^(1 - alpha) + q^eta) . $ <eq:local-final-projection>]

This holds for every $r in cal(I) \( x \)$ at the fixed center outside the exceptional sets. Increase $L_0$, depending only on $C_s$ and $kappa$, so that the last bound is less than $lambda$ whenever $q lt.eq L_0^(- 1)$.

Let $Y \( x \) = sup_(r in cal(I) \( x \)) \( - e dot.op h \( B \( x \, r \) \) \)_(+)$. Summing (2.26) and using (2.24), we have proved

#[#set math.equation(numbering: n => "(2.37)")
 $ \| { x in Q : Y \( x \) > lambda } \| lt.eq C [\( A \/ lambda \)^(64 \/ 25) + \( A \/ lambda \)^(34 \/ 25)] #h(2em) \( lambda gt.eq L_0 A \) . $ <eq:local-direction-tail>]

Both powers exceed one. The layer-cake formula, the trivial bound $\| Q \| = 1$ for smaller thresholds, and the substitution $lambda = A s$ give

$ integral_Q Y thin d x lt.eq L_0 A + C A integral_(L_0)^oo \( s^(- 64 \/ 25) + s^(- 34 \/ 25) \) thin d s lt.eq C A . $

Finally, (2.7) and $r gt.eq 1$ prove (2.3).

=== 2.5 The size estimate, including band endpoints <the-size-estimate-including-band-endpoints>

To prove (2.4), place the measures $v_i sigma_i$ among the error measures with assigned size one. The augmented price is $A_(upright("tot")) = A + S \( bb(R)^2 \)$, where $A$ and $S$ refer to the original decomposition. The augmented positive part is zero; in this proof, $beta$ and $nu_j$ refer to the augmented error family. If $A_(upright("tot")) = 0$, the result is immediate.

Take $lambda gt.eq L_0 A_(upright("tot"))$, put $q = A_(upright("tot")) \/ lambda$, and choose $j_0$ as in (2.24). Here $L_0$ will depend only on $C_s$. For $x in Q$ and $r in cal(J) \( x \)$, choose the balanced kernel $K_j$ when $"dist" \( r \, { 1 \, 2 } \) gt.eq delta_j$. Such an $r$ is an actual maximizer on $\[ 1 \, 2 \]$, so the two neighboring radii needed in Lemma 4 are admissible. Otherwise choose the uniform probability mixture over $\[ r - delta_j \, r + delta_j \]$. The latter kernel need not have zero moment, but has all the same support, positivity and Lipschitz bounds. Thus (2.21)–(2.23) remain valid with $A_(upright("tot"))$ in place of $A$. Write $P_j = integral K_j thin d h = p_j$, and again call $j$ active when $nu_j \( D_j \) gt.eq U_j = lambda delta_j^eta$.

There is an additional Borel exceptional set for each width:

#[#set math.equation(numbering: n => "(2.38)")
 $ F_j = union.big_(a in { 1 \, 2 }) {x : nu_j { y : \| \| y - x \| - a #scale(x: 120%, y: 120%)[\|] lt.eq 2 delta_j } gt.eq U_j} . $ <eq:local-endpoint-exception>]

For each fixed $y$, the areas of these two annuli of centers sum to $24 pi delta_j$. Tonelli’s theorem and Markov’s inequality give

#[#set math.equation(numbering: n => "(2.39)")
 $ \| F_j \| lt.eq 24 pi delta_j frac(nu_j \( bb(R)^2 \), U_j) lt.eq C \( A_(upright("tot")) \/ lambda \) delta_j^(22 \/ 25) . $ <eq:local-endpoint-area>]

If $"dist" \( r \, { 1 \, 2 } \) < delta_j$, the shell $D_j$ lies in one of the annuli in (2.38). Thus, outside $F_j$, an active index must satisfy $"dist" \( r \, { 1 \, 2 } \) gt.eq delta_j$, and both $K_j$ and $K_(j + 1)$ have zero moment. In particular, the forced radii $r = 1 \, 2$ are covered even if they are not maximizers.

Apply Lemma 6 with $S = 0$, $T = 0$, $nu = nu_j$, $delta = delta_j$, $rho = delta_j^gamma$, and $U = U_j$. It supplies Borel exceptional sets $E_j$, independent of $r$, with bound $C \[ q^2 delta_j^(14 \/ 25) + q delta_j^(12 \/ 25) \]$, which is at most the right side of (2.26). Its constants have no cone parameter: the positive measure and its interior-mass threshold are both zero. At an active step outside $E_j union F_j$, its interior-mass hypothesis is automatic, and it gives a point $z in D_j$ with $nu_j \( D_j \\ B \( z \, delta_j^gamma \) \) lt.eq 2 U_j$. The zero moments allow the correction

$ P_(j + 1) - P_j = integral (1 - overline(y - x) / overline(z - x)) \( K_(j + 1) - K_j \) \( y \) thin d beta \( y \) . $

The coarse pieces cost at most $C A_(upright("tot")) delta_j^(gamma - b) + C U_j$, and the fine pieces cost at most $C A_(upright("tot")) delta_j^(1 - b)$, exactly as above. Hence

$ \| P_(j + 1) - P_j \| lt.eq C lambda delta_j^eta . $

At an inactive step the same inequality follows directly from (2.23), without using a moment identity. Starting with $\| P_(j_0) \| lt.eq C A_(upright("tot")) delta_(j_0)^(- alpha)$ and summing all increments, we obtain

$ \| h \( B \( x \, r \) \) \| lt.eq C lambda \( q^(1 - alpha) + q^eta \) < lambda $

after increasing $L_0$. This holds simultaneously for all $r in cal(J) \( x \)$ outside $union.big_(j gt.eq j_0) \( E_j union F_j \)$. The measure bound is therefore

#[#set math.equation(numbering: n => "(2.40)")
 $ lr(|{x in Q : sup_(r in cal(J) \( x \)) \| h \( B \( x \, r \) \) \| > lambda}|) lt.eq C #scale(x: 120%, y: 120%)[\[] & \( A_(upright("tot")) \/ lambda \)^(64 \/ 25) + \( A_(upright("tot")) \/ lambda \)^(34 \/ 25)\
 & + \( A_(upright("tot")) \/ lambda \)^(47 \/ 25) #scale(x: 120%, y: 120%)[\]] . $ <eq:local-size-tail>]

Every exponent is larger than one. The same layer-cake computation as before gives the unnormalized bound by $C A_(upright("tot"))$. Since $A_(upright("tot")) = A + S \( bb(R)^2 \)$, (2.7) proves (2.4).

=== 2.6 The value-oscillation estimate <the-value-oscillation-estimate>

This estimate involves all small radii and does not use a maximizing property. We express $g$ minus a fixed mean through its gradient, prove an $L^(3 \/ 2)$ cancellation bound for the resulting kernel, and then apply the strong maximal inequality.

We finish the proof of Lemma 3 by establishing (2.5). Choose a nonnegative smooth probability density $psi$ supported in the interior of $Q$, with uniformly bounded derivatives after translating and rotating a fixed choice, and put

$ c = integral g \( z \) psi \( z \) thin d z \, #h(2em) E_Q = { x : "dist" \( x \, Q \) < 4 } . $

For $x in E_Q$, integrate $nabla g$ along the segments from $x$ to points of $"supp" psi$ and change variables to obtain

#[#set math.equation(numbering: n => "(2.41)")
 $ g \( x \) - c = integral L \( x \, y \) dot.op d h \( y \) \, #h(2em) L \( x \, y \) = - \( y - x \) integral_0^1 psi #scale(x: 120%, y: 120%)[\(] x + \( y - x \) \/ t #scale(x: 120%, y: 120%)[\)] t^(- 3) thin d t . $ <eq:local-value-kernel>]

Indeed, this is the fundamental theorem of calculus in $g \( x \) - g \( z \) = - integral_0^1 \( z - x \) dot.op nabla g \( x + t \( z - x \) \) thin d t$, followed by $y = x + t \( z - x \)$.

The displayed formula defines $L \( x \, y \)$ for every $y eq.not x$ in the plane, not only for $y in Omega$. This global definition will allow cancellation against a support center outside $Omega$. For each fixed $x in E_Q$, the kernel is supported on segments joining $x$ to $"supp" psi$, and hence is supported in $Omega$. It is smooth in $y eq.not x$, with the uniform bounds

#[#set math.equation(numbering: n => "(2.42)")
 $ \| L \( x \, y \) \| lt.eq frac(C, \| x - y \|) \, #h(2em) \| nabla_y L \( x \, y \) \| lt.eq frac(C, \| x - y \|^2) . $ <eq:local-value-kernel-bounds>]

To verify them, if the integrand or one of its derivatives is nonzero, then $\| y - x \| lt.eq C t$, since $x in E_Q$ and $x + \( y - x \) \/ t$ lies in a fixed bounded neighborhood of $Q$. The first bound follows by integrating $t^(- 3)$ from $\| y - x \| \/ C$ to one and multiplying by $\| y - x \|$. Differentiation in $y$ produces either the same integral or $\| y - x \| integral t^(- 4) thin d t$, which gives the second bound.

Fix $p = 3 \/ 2$, so $2 \/ p - 1 = 1 \/ 3 > alpha$. The first bound in (2.42) implies

#[#set math.equation(numbering: n => "(2.43)")
 $ sup_(y in bb(R)^2) parallel L \( dot.op \, y \) parallel_(L^p \( E_Q \)) lt.eq C . $ <eq:local-kernel-lp>]

This follows by integrating $\| x - y \|^(- p)$ on a bounded set; $p < 2$ makes the singularity integrable, uniformly in $y$.

Consider a piece $beta_d$ with $s_d < 1$, supported in $B \( z \, a \)$, where we may take $a = C_s s_d$ after increasing $C_s$ to at least one. On $E_Q ∩ B \( z \, 2 a \)$, the first kernel bound and Minkowski’s inequality give

$ ∥integral L \( dot.op \, y \) dot.op d beta_d \( y \)∥_(L^p \( E_Q ∩ B \( z \, 2 a \) \)) lt.eq C a^(2 \/ p - 1) m_d . $

In fact, for $y in B \( z \, a \)$ the relevant $x$ lie within $3 a$ of $y$, and the $L^p$ norm of $\| x - y \|^(- 1)$ there is $C a^(2 \/ p - 1)$. For $\| x - z \| > 2 a$, use the zero total vector mass to subtract $L \( x \, z \)$. The derivative bound in (2.42), applied on the segment from $z$ to $y$, gives

$ lr(|integral L \( x \, y \) dot.op d beta_d \( y \)|) lt.eq C a m_d \| x - z \|^(- 2) . $

Its $L^p$ norm on ${ \| x - z \| > 2 a }$ is at most $C a^(2 \/ p - 1) m_d$, since $p > 1$. Combining the two regions yields

#[#set math.equation(numbering: n => "(2.44)")
 $ ∥integral L \( dot.op \, y \) dot.op d beta_d \( y \)∥_(L^p \( E_Q \)) lt.eq C s_d^(1 \/ 3) m_d lt.eq C s_d^alpha m_d . $ <eq:local-value-piece>]

The constant may depend on $C_s$. For a piece of assigned size one, and for the positive measures, use (2.43) directly. Minkowski’s inequality and the finite decomposition therefore give

#[#set math.equation(numbering: n => "(2.45)")
 $ parallel g - c parallel_(L^(3 \/ 2) \( E_Q \)) lt.eq C #scale(x: 120%, y: 120%)[\(] A + S \( bb(R)^2 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:local-value-lp>]

These same estimates show that the integrals obtained by inserting (2.2) into (2.41) exist for almost every $x$; thus the use of the potentially singular kernel is justified.

Let $f_Q = \( g - c \) upright(bold(1))_(E_Q)$, extended by zero to the plane. Every disk centered at $x in Q$ of radius at most four is contained in $E_Q$. Consequently

$ sup_(0 < t \, t' lt.eq 4) \| u_t \( x \) - u_(t') \( x \) \| lt.eq 2 M f_Q \( x \) \, $

where the maximal function on the right uses absolute values. The classical strong $L^(3 \/ 2)$ maximal inequality #cite(label("Kinnunen1997")) (1.2), followed by Hölder’s inequality on the unit square and (2.45), proves (2.5). This completes the proof of Lemma 3.

== 3 Dyadic vector masses and common prices <sec:prices>

Throughout this section, let $g in C_c^oo \( bb(R)^2 \)$ be real valued, and write

$ h = nabla g thin #h(-0.16667em) upright(d) x \, #h(2em) V = \| h \| \( bb(R)^2 \) \, #h(2em) u_t = A_t g . $

The averages $u_t$ are signed. Fix an integer $m gt.eq 1$; all estimates below are uniform in $m$. Lemma 3 discounts a cancelling error according to the size of its support. We now decompose the gradient into errors to which that discount applies, and assign one summable price to each dyadic cell. The same price will work for every direction in a fixed finite palette. The construction starts with the actual density of each scalar coordinate of the gradient at the finest level and removes equal positive and negative masses as it moves toward coarser levels.

=== 3.1 Positive refinement and cone coordinates <positive-refinement-and-cone-coordinates>

For every integer $k$, set $r_k = 2^(- k)$ and $V_k = r_k bb(Z)^2$. These definitions are not restricted to $1 \, dots.h \, m$: the neighboring direction estimate in Section 4 will also use level $k - 12$. A vertex includes its level, so vertices at different levels are distinct even when their spatial positions agree. For $p in V_k$, define

$ Q_p = p + \[ 0 \, r_k \)^2 \, #h(2em) phi.alt_p \( x \) = product_(j = 1)^2 (1 - frac(\| x_j - p_j \|, r_k))_(+) . $

For $p in V_i$ and $q in V_k$ with $i < k$, put $lambda_(p q) = phi.alt_p \( q \)$, and at equal levels put $lambda_(p q) = upright(bold(1))_({ p = q })$. These nonnegative coefficients satisfy

#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(p in V_i) lambda_(p q) = 1 \, #h(2em) phi.alt_p = sum_(q in V_k) lambda_(p q) phi.alt_q quad \( i lt.eq k \) \,\
lambda_(p s) = sum_(q in V_j) lambda_(p q) lambda_(q s) quad \( i lt.eq j lt.eq k \, med p in V_i \, med s in V_k \) . $ <eq:hat-refinement>]

To verify these identities, first consider one coordinate. The hats on a fixed grid sum to one: between two consecutive vertices, the only nonzero hats have complementary affine values. A coarse hat is affine on every interval of any finer dyadic grid, since all its breakpoints belong to that grid. It therefore equals the piecewise affine interpolant of its values at the finer vertices. Taking products proves the first two identities in (3.1); evaluating the second identity at $s$ proves the third. The sums are locally finite. Notice that the normalization is in the coarse index $p$ for each fixed fine vertex $q$. These coefficients are refinement weights, not stochastic transition rows.

If $q in V_(k + 1)$ and $lambda_(p q) > 0$, then in each coordinate $q_j - p_j in { - r_k \/ 2 \, 0 \, r_k \/ 2 }$. Consequently

#[#set math.equation(numbering: n => "(3.2)")
 $ "supp" phi.alt_q subset.eq "supp" phi.alt_p . $ <eq:prices-support-nesting>]

Thus each vertex has nine positive-weight children, and the supports remain nested along every path of positive-weight edges.

Define the vector masses and their polar decompositions by

$ h_p = integral phi.alt_p thin #h(-0.16667em) upright(d) h \, #h(2em) a_p = \| h_p \| \, #h(2em) h_p = a_p theta_p \, $

where $theta_p$ is an arbitrary fixed unit vector when $a_p = 0$. Refinement gives

$ h_p = sum_(q in V_k) lambda_(p q) h_q quad \( p in V_i \, med i lt.eq k \) . $

The triangle inequality and the column sums in (3.1) imply

#[#set math.equation(numbering: n => "(3.3)")
 $ sum_(p in V_i) a_p lt.eq sum_(q in V_k) a_q lt.eq V quad \( i lt.eq k \) . $ <eq:prices-vector-mass-budget>]

The last inequality follows directly from $sum_q phi.alt_q = 1$. At each fixed level only finitely many of these masses can be nonzero, because $h$ has compact support.

Fix $tau = 1 \/ 100$ and a finite $tau \/ 20$-net $cal(N)$ of the unit circle, measured in chord distance. For $n in cal(N)$, let $n^perp$ be its counterclockwise quarter turn and put

$ e_(+) \( n \) = sqrt(3) / 2 n + 1 / 2 n^perp \, #h(2em) e_(-) \( n \) = sqrt(3) / 2 n - 1 / 2 n^perp . $

These are unit vectors and $e_(+) \( n \) dot.op e_(-) \( n \) = 1 \/ 2$. Call $\( q \, n \)$ #emph[good] when $theta_q$ belongs to the closed sector between $e_(-) \( n \)$ and $e_(+) \( n \)$, and #emph[bad] otherwise. The two scalar coefficient functionals

#[#set math.equation(numbering: n => "(3.4)")
 $ c_(n \, +) \( z \) = frac(n dot.op z, sqrt(3)) + n^perp dot.op z \, #h(2em) c_(n \, -) \( z \) = frac(n dot.op z, sqrt(3)) - n^perp dot.op z $ <eq:prices-scalar-coordinates>]

satisfy

$ z = e_(+) \( n \) c_(n \, +) \( z \) + e_(-) \( n \) c_(n \, -) \( z \) \, #h(2em) \| c_(n \, +) \( z \) \| + \| c_(n \, -) \( z \) \| = 2 max {frac(\| n dot.op z \|, sqrt(3)) \, \| n^perp dot.op z \|} lt.eq 2 \| z \| . $

In particular, for a good pair $\( q \, n \)$, both coefficients of $h_q$ are nonnegative, including when $h_q = 0$. This sign information will supply the positive cone measures in Lemma 3.

For the finite-band assembly, we also need to bound a vector’s norm by its signed projection along $n$ and the unfavorable projections controlled by the local estimate. The following inequality gives that bound, with an absolute constant:

#[#set math.equation(numbering: n => "(3.5)")
 $ \| z \| lt.eq C (n dot.op z + sum_(epsilon in { + \, - }) \( - e_epsilon \( n \) dot.op z \)_(+)) quad \( z in bb(R)^2 \) . $ <eq:cone-algebra>]

Here the expression in parentheses is nonnegative. Indeed, writing $a = n dot.op z$, its value is positive for every nonzero $z$: if $a > 0$ this is immediate; if $a = 0$, one of the two negative parts equals $\| z \| \/ 2$; and if $a < 0$, their sum is at least $- \( e_(+) \( n \) + e_(-) \( n \) \) dot.op z = sqrt(3) \| a \|$, so the expression is at least $\( sqrt(3) - 1 \) \| a \| > 0$. Its minimum on the unit circle is therefore positive by continuity. Rotation invariance makes this minimum independent of $n$, and homogeneity proves (3.5).

=== 3.2 Cancellation from the finest level upward <cancellation-from-the-finest-level-upward>

Let $cal(C)$ be the indexed finite family consisting of $c_(n \, +) \, c_(n \, -)$ for every $n in cal(N)$; repeated functionals, if any, retain their indices. For $c in cal(C)$ write

$ nu^c = c \( h \) = c \( nabla g \( x \) \) thin #h(-0.16667em) upright(d) x \, #h(2em) c_s = c \( h_s \) = integral phi.alt_s thin #h(-0.16667em) upright(d) nu^c . $

For $s in V_l$, $1 lt.eq l lt.eq m$, define

#[#set math.equation(numbering: n => "(3.6)")
 $ d_s^c = cases(delim: "{", 1 / 2 (sum_(t in V_(l + 1)) lambda_(s t) \| c_t \| - \| c_s \|) \, & l < m \,, 1 / 2 (integral phi.alt_s \( x \) \| c \( nabla g \( x \) \) \| thin #h(-0.16667em) upright(d) x - \| c_s \|) \, & l = m .) $ <eq:prices-scalar-defects>]

These numbers are nonnegative by refinement and the triangle inequality. They measure the equal positive and negative masses that can be removed at $s$. At level $m$ the definition uses the positive and negative parts of the density itself. In particular, $c_s = 0$ need not imply $d_s^c = 0$.

We will realize this numerical cancellation by measures supported in the corresponding tent. The elementary operation is proportional removal; it does not require the two measures being paired to be mutually singular.

#thm([Lemma 3.1.])[
  (Removing equal masses).  #emph[Let $U \, V$ be finite nonnegative measures, of masses $P \, N$. There are nonnegative submeasures $mu_(+) lt.eq U$, $mu_(-) lt.eq V$, both of mass $d = min \( P \, N \)$, such that 
$ U - V = rho + mu_(+) - mu_(-) \, #h(2em) rho \( bb(R)^2 \) = P - N \, #h(2em) \| rho \| \( bb(R)^2 \) = \| P - N \| . $

 The residual $rho$ has constant sign. If $U \, V$ are absolutely continuous and supported in a common closed set, so are all the constructed measures.]
] <lem:prices-remove>

#proof[
  When $P > 0$ set $mu_(+) = \( d \/ P \) U$; when $P = 0$ set $mu_(+) = 0$. Define $mu_(-)$ in the same way from $N \, V$, and set $rho = \( U - mu_(+) \) - \( V - mu_(-) \)$. If $P gt.eq N$ and $P > 0$, then $mu_(-) = V$ and $rho = \( 1 - N \/ P \) U gt.eq 0$. The case $N gt.eq P$ is symmetric. If $P = N = 0$, every measure is zero. These formulas prove the mass, sign and support assertions, including all zero cases. ◻
]

#thm([Lemma 3.2.])[
  (Exact scalar pairing).  #emph[For every $c in cal(C)$ there are measures $rho_s^c \, mu_(s \, +)^c \, mu_(s \, -)^c$ at all vertices $s in V_l$, $1 lt.eq l lt.eq m$, supported in $"supp" phi.alt_s$ and absolutely continuous, with $rho_s^c$ of constant sign and $mu_(s \, plus.minus)^c$ nonnegative, such that 
#[#set math.equation(numbering: n => "(3.7)")
 $ rho_s^c \( bb(R)^2 \) = c_s \, #h(2em) \| rho_s^c \| \( bb(R)^2 \) = \| c_s \| \, #h(2em) mu_(s \, +)^c \( bb(R)^2 \) = mu_(s \, -)^c \( bb(R)^2 \) = d_s^c . $ <eq:prices-scalar-masses>]

 Put $beta_s^c = mu_(s \, +)^c - mu_(s \, -)^c$. For every $q in V_k$, $1 lt.eq k lt.eq m$, the following is an identity of measures on the whole plane: 
#[#set math.equation(numbering: n => "(3.8)")
 $ phi.alt_q nu^c = rho_q^c + sum_(l = k)^m sum_(s in V_l) lambda_(q s) beta_s^c . $ <eq:prices-vertex-reconstruction>]

 Only finitely many terms in this identity are nonzero, and 
#[#set math.equation(numbering: n => "(3.9)")
 $ beta_s^c \( bb(R)^2 \) = 0 \, #h(2em) \| beta_s^c \| \( bb(R)^2 \) lt.eq 2 d_s^c \, #h(2em) "supp" beta_s^c subset.eq "supp" phi.alt_s subset.eq overline(B) \( s \, sqrt(2) r_l \) . $ <eq:prices-pair-properties>]

]
] <lem:prices-scalar-pairing>

#proof[
  Fix $c$ and first take $s in V_m$. Apply Lemma 7 to the actual terminal measures
  $ U_s = phi.alt_s \( nu^c \)_(+) \, #h(2em) V_s = phi.alt_s \( nu^c \)_(-) . $
  Their masses have difference $c_s$ and sum $integral phi.alt_s thin #h(-0.16667em) upright(d) \| nu^c \|$. Hence their smaller mass is exactly $d_s^c$, and removal gives (3.7) and
  #[#set math.equation(numbering: n => "(3.10)")
   $ phi.alt_s nu^c = rho_s^c + beta_s^c . $ <eq:prices-terminal-identity>]
  If the positive and negative terminal masses agree, the residual is zero while both paired measures keep that common mass.
  Suppose that all residuals at level $l + 1$ have been constructed. At $s in V_l$ combine their positive and negative parts separately:
  $ U_s = sum_(t in V_(l + 1)) lambda_(s t) \( rho_t^c \)_(+) \, #h(2em) V_s = sum_(t in V_(l + 1)) lambda_(s t) \( rho_t^c \)_(-) . $
  The residuals have constant sign, so the masses $P_s \, N_s$ of these two measures obey
  $ P_s - N_s = sum_t lambda_(s t) c_t = c_s \, #h(2em) P_s + N_s = sum_t lambda_(s t) \| c_t \| . $
  Thus $min \( P_s \, N_s \) = d_s^c$. Applying Lemma 7 again constructs the measures in (3.7) and proves
  #[#set math.equation(numbering: n => "(3.11)")
   $ sum_(t in V_(l + 1)) lambda_(s t) rho_t^c = rho_s^c + beta_s^c . $ <eq:prices-residual-recursion>]
  Absolute continuity is preserved by finite sums and scalar multiplication. Support nesting in (3.2) keeps all these measures in $"supp" phi.alt_s$. The construction proceeds through finitely many levels. At each level only finitely many measures can be nonzero, since the terminal density has compact support and each vertex has finitely many parents.
  It remains to verify that no density has been lost during removal. At level $m$, (3.8) is (3.10). If the identity holds for all children of $q in V_k$, refinement yields
  $ phi.alt_q nu^c & = sum_(t in V_(k + 1)) lambda_(q t) phi.alt_t nu^c\
 & = sum_t lambda_(q t) rho_t^c + sum_(l = k + 1)^m sum_(s in V_l) (sum_t lambda_(q t) lambda_(t s)) beta_s^c\
 & = rho_q^c + beta_q^c + sum_(l = k + 1)^m sum_(s in V_l) lambda_(q s) beta_s^c . $
  The last line uses (3.11) and coefficient composition in (3.1). It is the required identity at $q$. All rearrangements are finite for a fixed root because branching and depth are finite. Finally, equal masses in (3.7) give zero mass and variation at most $2 d_s^c$ for each difference; the tent support gives the last assertion in (3.9). ◻
]

The measures are constructed once at each vertex. A descendant’s pair may appear in several coarse identities, with its specified coefficient; these identities do not assert a disjoint allocation.

===== 3.2.1 The equivalent path form. <the-equivalent-path-form.>

The price estimate below uses the vertex identity. The following equivalent form expresses shared-descendant coefficients as sums of path weights, using the same cancelling pieces. Section 4 will construct a separate positive measure on vector paths. Fix $q in V_k$ with $1 lt.eq k lt.eq m$, and let $xi$ range over all positive-weight paths $xi = \( q_k \, dots.h \, q_l \)$ with $q_k = q$ and $k lt.eq l lt.eq m$, including the trivial path $\( q \)$. Set

$ w_xi = product_(j = k)^(l - 1) lambda_(q_j q_(j + 1)) \, #h(2em) mu_(xi \, plus.minus)^c = w_xi mu_(q_l \, plus.minus)^c \, #h(2em) w_(\( q \)) = 1 . $

Composition gives $sum_(xi : q_l = s) w_xi = lambda_(q s)$, and therefore

#[#set math.equation(numbering: n => "(3.12)")
 $ phi.alt_q c \( h \) = rho_q^c + sum_xi \( mu_(xi \, +)^c - mu_(xi \, -)^c \) . $ <eq:prices-scalar-pairing>]

Each path pair has mass $w_xi d_s^c$ in each sign and support in $"supp" phi.alt_s$, where $s = q_l$. This recovers the path identity without a separate allocation along every path.

The cancellation amounts have an exact total budget. Summing (3.6) over a level and using the column normalization in (3.1) cancels intermediate absolute masses. The terminal partition of unity gives

#[#set math.equation(numbering: n => "(3.13)")
 $ sum_(l = 1)^m sum_(s in V_l) d_s^c = 1 / 2 (integral \| c \( nabla g \) \| thin #h(-0.16667em) upright(d) x - sum_(s in V_1) \| c_s \|) lt.eq 1 / 2 parallel c parallel thin V . $ <eq:prices-scalar-defect-budget>]

Here $parallel c parallel$ denotes the Euclidean operator norm, equal to $2 \/ sqrt(3)$ for every $c in cal(C)$ by (3.4). When $m = 1$, the same formula is just the sum of the terminal defects. Zero masses introduce no exception to either the reconstruction or this telescoping identity.

=== 3.3 One price at every observation scale <one-price-at-every-observation-scale>

For $Q = Q_p$ at level $k$, put

$ cal(R) \( Q \) = { q in V_k : \| q - p \|_oo lt.eq 20 r_k } \, #h(2em) \| z \|_oo = max { \| z_1 \| \, \| z_2 \| } . $

A pair created at level $l gt.eq k$ has support of radius at most $sqrt(2) r_l$. At observation scale $r_k$, the local estimate therefore charges it the relative factor $\( r_l \/ r_k \)^alpha = 2^(- alpha \( l - k \))$. We sum these charges over all the scalar coordinates so that the resulting price is independent of the label chosen later.

The scaled radius sets from Lemma 3 are

$ cal(I)_k \( x \) & = { r in \[ r_k \, 2 r_k \] : u_r \( x \) gt.eq u_t \( x \) upright(" for every ") t > 0 upright(" with ") \| t - r \| lt.eq r_k \/ 4 } \,\
cal(J)_k \( x \) & = { r in \[ r_k \, 2 r_k \] : u_r \( x \) = max_(r_k lt.eq t lt.eq 2 r_k) u_t \( x \) } union { r_k \, 2 r_k } . $

Also define

$ v_k \( x \) = sup_(0 < t \, t' lt.eq 4 r_k) \| u_t \( x \) - u_(t') \( x \) \| . $

An empty supremum of nonnegative quantities is zero, as before.

#thm([Proposition 3.3.])[
  (Common discounted prices).  #emph[For $p in V_k$, $1 lt.eq k lt.eq m$, define 
#[#set math.equation(numbering: n => "(3.14)")
 $ D_(Q_p) = sum_(c in cal(C)) sum_(q in cal(R) \( Q_p \)) sum_(l = k)^m 2^(- alpha \( l - k \)) sum_(s in V_l) lambda_(q s) d_s^c \, #h(2em) alpha = 1 / 100 . $ <eq:prices-definition>]

 These nonnegative prices satisfy 
#[#set math.equation(numbering: n => "(3.15)")
 $ sum_(k = 1)^m sum_(p in V_k) D_(Q_p) lt.eq frac(41^2, 2 \( 1 - 2^(- alpha) \)) sum_(c in cal(C)) parallel c \( nabla g \) parallel_(L^1) lt.eq C V . $ <eq:price-budget>]

 For every such cell $Q$ and every $n in cal(N)$, 
#[#set math.equation(numbering: n => "(3.16)")
 $ & integral_Q sup_(t in cal(I)_k \( x \)) sum_(epsilon in { + \, - }) \( - e_epsilon \( n \) dot.op nabla u_t \( x \) \)_(+) thin #h(-0.16667em) upright(d) x lt.eq C (D_Q + sum_(q in cal(R) \( Q \)\
\( q \, n \) upright(" bad")) a_q) \,\
 & integral_Q [sup_(t in cal(J)_k \( x \)) \| nabla u_t \( x \) \| + r_k^(- 1) v_k \( x \)] #h(-0.16667em) upright(d) x lt.eq C (D_Q + sum_(q in cal(R) \( Q \)) a_q) . $ <eq:prices>]

 All constants are absolute: the direction palette, support radius factor and cone aperture are fixed, and there is no dependence on $m$.]
] <prop:prices>

#proof[
  We first sum the prices. At a fixed level each vertex $q$ belongs to exactly $41^2$ neighborhoods $cal(R) \( Q_p \)$, since each of the two integer coordinate differences ranges from $- 20$ to $20$. Nonnegativity permits reordering, and the column sums give
  $ sum_(k = 1)^m sum_(p in V_k) D_(Q_p) & = 41^2 sum_(c in cal(C)) sum_(l = 1)^m sum_(s in V_l) d_s^c sum_(k = 1)^l 2^(- alpha \( l - k \)) sum_(q in V_k) lambda_(q s)\
 & lt.eq frac(41^2, 1 - 2^(- alpha)) sum_(c in cal(C)) sum_(l = 1)^m sum_(s in V_l) d_s^c . $
  Applying the exact telescoping identity (3.13) proves (3.15). In particular, one may take $C = 41^2 \| cal(C) \| \/ \[ sqrt(3) \( 1 - 2^(- alpha) \) \]$ in its final inequality.
  We next construct the decomposition needed by the local estimates. Fix $Q = Q_p$ at level $k$, a label $n$, and write $Omega_Q = { y : "dist" \( y \, Q \) < 10 r_k }$. If a level-$k$ tent $phi.alt_q$ is positive at $y in Omega_Q$, then $\| q - y \|_oo < r_k$ and $\| y - p \|_oo < 11 r_k$, so $q in cal(R) \( Q \)$. Hence
  #[#set math.equation(numbering: n => "(3.17)")
   $ h = sum_(q in cal(R) \( Q \)) phi.alt_q h quad upright("on ") Omega_Q . $ <eq:prices-local-partition>]
  Apply (3.8) with the two coordinates $c_(n \, epsilon)$ and multiply by $e_epsilon \( n \)$. This gives the measure identity
  #[#set math.equation(numbering: n => "(3.18)")
   $ h = sum_(q in cal(R) \( Q \)) sum_(epsilon in { + \, - }) e_epsilon \( n \) rho_q^(c_(n \, epsilon)) + sum_(q in cal(R) \( Q \)) sum_(epsilon in { + \, - }) sum_(l = k)^m sum_(s in V_l) e_epsilon \( n \) lambda_(q s) beta_s^(c_(n \, epsilon)) quad upright("on ") Omega_Q . $ <eq:prices-vector-decomposition>]
  The components here are measures on the whole plane. We retain them on their full supports; only their sum is being compared with $h$ on $Omega_Q$.
  For a good root $\( q \, n \)$, both $c_(n \, epsilon) \( h_q \)$ are nonnegative. The constant-sign and mass assertions in (3.7) therefore imply $rho_q^(c_(n \, epsilon)) gt.eq 0$, including the zero case. These residuals are the positive measures $sigma_i$ of Lemma 3, in the unit directions $e_(+) \( n \) \, e_(-) \( n \)$. Each of these directions has dot product at least $1 \/ 2$ with either test direction $e_(+) \( n \)$ or $e_(-) \( n \)$. For a bad root, put the two signed residual terms among the unrestricted errors, with assigned relative size one. Their total variation is at most
  $ sum_(epsilon in { + \, - }) \| rho_q^(c_(n \, epsilon)) \| \( bb(R)^2 \) = sum_(epsilon in { + \, - }) \| c_(n \, epsilon) \( h_q \) \| lt.eq 2 a_q . $
  Thus no good-root mass enters the error price for the directional estimate.
  For each term in the second sum of (3.18), its total vector mass is zero, its variation is at most $2 lambda_(q s) d_s^(c_(n \, epsilon))$, and its support lies in $overline(B) \( s \, sqrt(2) r_l \)$. Assign it the relative size $s_d = r_l \/ r_k = 2^(k - l)$. When $l > k$ this gives exactly the cancellation and support conditions required for a small error. When $l = k$ it gives an allowed size-one error. The physical sum of discounted variations is consequently bounded by
  #[#set math.equation(numbering: n => "(3.19)")
   $ sum_d s_d^alpha \| beta_d \| \( bb(R)^2 \) lt.eq 2 D_Q + 2 sum_(q in cal(R) \( Q \)\
\( q \, n \) upright(" bad")) a_q . $ <eq:prices-directional-decomposition-cost>]
  Here $beta_d$ denotes the vector error pieces just specified. The sum is finite and every component is absolutely continuous. The terminal pairs are included, even at roots with zero vector mass; there is no terminal remainder.
  To apply Lemma 3, let $r = r_k$, $T \( X \) = p + r X$ and $tilde(g) = g compose T$. Its gradient measure and disk averages satisfy
  #[#set math.equation(numbering: n => "(3.20)")
   $ tilde(h) = r^(- 1) \( T^(- 1) \)_(\#) h \, #h(2em) A_t tilde(g) \( X \) = u_(r t) \( T \( X \) \) \, #h(2em) nabla_X A_t tilde(g) \( X \) = r nabla u_(r t) \( T \( X \) \) . $ <eq:prices-scaling>]
  Indeed $nabla_X tilde(g) = r nabla g compose T$ and $#h(-0.16667em) upright(d) X = r^(- 2) #h(-0.16667em) upright(d) x$. Transform every component measure by the same $r^(- 1) \( T^(- 1) \)_(\#)$ rule. Its mass and variation are multiplied by $r^(- 1)$; zero total vector mass and positivity are preserved. A pair at level $l$ is now supported in a ball of radius $sqrt(2) r_l \/ r_k$. Taking $C_s = 2$ places this closed support inside an open ball of radius $C_s r_l \/ r_k$. The transformed identity holds on the $10$-neighborhood of $\[ 0 \, 1 \)^2$.
  The radius sets for $tilde(g)$ are the images of $cal(I)_k \, cal(J)_k$ under division by $r$, including the comparison with all positive radii in $cal(I)_k$ and both forced endpoints in $cal(J)_k$. Furthermore, the integral over the unit cell of any of the gradient suprema in Lemma 3 is $r^(- 1)$ times the corresponding physical integral over $Q$. Apply (2.3) with cone margin $kappa = 1 \/ 2$ to each of the two test directions, and multiply by $r$. The supremum of the sum of the two nonnegative terms is at most the sum of their suprema. Together with (3.19), this proves the first estimate in (3.16).
  For the second estimate in (3.16), fix any one label and use the same decomposition, now placing #emph[all] root residuals among the size-one errors. The positive part $S$ is zero, and the physical discounted error mass is at most $2 D_Q + 2 sum_(q in cal(R) \( Q \)) a_q$. The size estimate (2.4), after the same transformation, bounds the physical gradient integral by an absolute multiple of this quantity. For the value estimate the change of variables instead gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ integral_(\[ 0 \, 1 \)^2) sup_(0 < t \, t' lt.eq 4) \| A_t tilde(g) \( X \) - A_(t') tilde(g) \( X \) \| thin #h(-0.16667em) upright(d) X = r^(- 2) integral_Q v_k \( x \) thin #h(-0.16667em) upright(d) x . $ <eq:prices-value-scaling>]
  Its right side in (2.5) is bounded by $C r^(- 1) \( D_Q + sum_q a_q \)$. Multiplying by $r$ therefore bounds $r_k^(- 1) integral_Q v_k$, exactly as asserted. Adding this to the size bound completes the proof. ◻
]

The prices now pay for every scalar cancellation and leave only nearby vector masses $a_q$ in the local bounds. Controlling those remaining masses requires a choice of directions across scales and positions. The next section constructs a positive measure on complete refinement paths, recording a birth level, so that the mass of paths through a vertex $q$ whose birth has already occurred is exactly $a_q$. The scalar measures above supply neither this path measure nor the spatial estimates for the direction law; their role is the reconstruction and discounted budget proved in this section.

== 4 Directions that change slowly in scale and position <sec:labels>

The common prices in Proposition 9 pay for scalar cancellation. Its remaining terms are nearby vector masses $a_q$. We now choose directions so that these masses pay only a summable amount for changes of direction. A maximal consecutive interval of levels carrying the same direction will be called a #emph[run]. Ending a run produces endpoint terms in the local estimates, so the first cost is the probability of a change between successive levels.

There is also a spatial cost. We will average signed directional estimates with weights depending on $x$ and then integrate by parts. For any finite Lipschitz probability row $\( omega_j \( x \) \)_j$, normalization gives

$ sum_j nabla omega_j = 0 \, #h(2em) sum_j U_j nabla omega_j = sum_j \( U_j - U_(*) \) nabla omega_j $

almost everywhere, for arbitrary scalar values $U_j$ and a common value $U_(*)$. Thus the cost of differentiating a row is controlled by the differences $U_j - U_(*)$, rather than the sizes of the values themselves. In Section 5, the differences will be bounded by sums of the small-radius oscillations $v_l$ defined in Section 3. Their integral over a level-$l$ cell costs $r_l$ times its price and root masses, by (3.16). A row built from level-$k$ tents has derivatives of size $r_k^(- 1)$. The required joint bound therefore carries the ratio $r_l \/ r_k = 2^(k - l)$, for $k lt.eq l$. This explains both the row-derivative cost and its weight in the packing estimate below.

Retain $g in C_c^oo \( bb(R)^2 \)$, $h = nabla g thin #h(-0.16667em) upright(d) x$, $V = \| h \| \( bb(R)^2 \)$, and the levels $1 \, dots.h \, m$, with $m gt.eq 1$. We use the hats, vector masses $h_q = a_q theta_q$, and refinement coefficients from Section 3, defined at every integer level. The coarser levels will be needed to compare nearby directions. The palette $cal(N)$ is the fixed $tau \/ 20$-net of the unit circle, where $tau = 1 \/ 100$. Recall that $\( q \, n \)$ is good when $theta_q$ makes an angle at most $pi \/ 6$ with $n$. All vertex and palette choices below use fixed tie rules, independently of the observation point $x$. Directions at zero vector masses retain the prescribed unit-vector convention.

=== 4.1 Directions in neighboring cells <directions-in-neighboring-cells>

At each vertex we first look for a nearby direction carrying maximal mass. This choice prevents a small neighboring mass from imposing an unpaid change of direction. For $z in V_k$, choose a vertex $w \( z \) in V_k$ maximizing $a_w$ among $\| w - z \|_oo lt.eq 300 r_k$, and set

$ Theta_z = theta_(w \( z \)) . $

Choose $n_z in cal(N)$ with $\| n_z - Theta_z \| lt.eq tau \/ 20$. The level is part of the vertex label in this notation. Define

$ E_k \( q \) = max_(z in V_k\
\| z - q \|_oo lt.eq 200 r_k) \| Theta_z - theta_q \|^2 \, #h(2em) q in V_k . $

In particular, $0 lt.eq E_k \( q \) lt.eq 4$. The quantity $E_k \( q \)$ measures how far the nearby chosen directions can depart from its own direction. Put $A_j = sum_(p in V_j) a_p$ for every integer $j$. By (3.3), these total vector masses satisfy $0 lt.eq A_j lt.eq A_(j + 1) lt.eq V$. Their increase pays the weighted sum of the disagreements.

#thm([Lemma 4.1.])[
  (Neighboring direction budget).  #emph[There is an absolute constant $C$ such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(k = 1)^m sum_(q in V_k) a_q E_k \( q \) lt.eq C V . $ <eq:neighbor-budget>]

]
] <lem:labels-neighbors>

#proof[
  Fix $k$ and $q$ with $a_q > 0$, choose a maximizing $z$ in the definition of $E_k \( q \)$, and put $w = w \( z \)$. Since $q$ is among the candidates for $w \( z \)$, we have
  $ a_w gt.eq a_q \, #h(2em) \| w - q \|_oo lt.eq 500 r_k . $
  Take $L = 12$, and choose a nearest vertex $p in V_(k - L)$ to $q$ in each coordinate. Then
  $ \| q - p \|_oo lt.eq 1 / 2 r_(k - L) \, #h(2em) \| w - p \|_oo lt.eq #scale(x: 120%, y: 120%)[\(] 1 / 2 + 500 thin 2^(- 12) #scale(x: 120%, y: 120%)[\)] r_(k - L) < 5 / 8 r_(k - L) . $
  Each coordinate factor of $phi.alt_p \( q \)$ is at least $1 \/ 2$, and each coordinate factor of $phi.alt_p \( w \)$ is greater than $3 \/ 8$. Hence $lambda_(p q) gt.eq 1 \/ 4$ and $lambda_(p w) gt.eq 9 \/ 64$. For this coarse vertex write
  $ H_(p \, k) = sum_(s in V_k) lambda_(p s) a_s - a_p . $
  The vector refinement identity implies, also when $a_p = 0$,
  #[#set math.equation(numbering: n => "(4.2)")
   $ H_(p \, k) = sum_(s in V_k) lambda_(p s) a_s \( 1 - theta_p dot.op theta_s \) = 1 / 2 sum_(s in V_k) lambda_(p s) a_s \| theta_s - theta_p \|^2 . $ <eq:labels-neighbor-defect>]
  Here $theta_p dot.op h_p = a_p$ is true even at zero, for the prescribed unit direction at zero. The triangle inequality for squared distances, the two lower bounds on the interpolation coefficients, and $a_w gt.eq a_q$ therefore give
  $ a_q E_k \( q \) lt.eq 2 a_q #scale(x: 120%, y: 120%)[\(] \| theta_q - theta_p \|^2 + \| theta_w - theta_p \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq C H_(p \, k) . $
  For fixed $k$, each coarse vertex is chosen by at most a fixed number of fine vertices, depending only on $L$. Vertices with $a_q = 0$ contribute nothing. The column sums of the refinement coefficients now give
  $ sum_(q in V_k) a_q E_k \( q \) lt.eq C sum_(p in V_(k - L)) H_(p \, k) = C \( A_k - A_(k - L) \) . $
  Finally,
  $ sum_(k = 1)^m \( A_k - A_(k - L) \) = sum_(k = 1)^m sum_(j = k - L + 1)^k \( A_j - A_(j - 1) \) lt.eq L V \, $
  because every nonnegative increment appears at most $L$ times. This proves (4.1). ◻
]

=== 4.2 The finite-state label law <the-finite-state-label-law>

The neighboring budget does not prescribe a direction at every point. We interpolate the fixed vertex choices by the tents, retaining the previous direction unless it is appreciably far from the sampled one. The interval on which the switching probability vanishes will keep small direction fluctuations from creating repeated run endpoints.

For each $x in bb(R)^2$ we define a probability law $bb(P)_x$ on $cal(N)^m$. At the first step, sample $z in V_1$ with probabilities $phi.alt_z \( x \)$ and set $n_1 = n_z$. At a step $k gt.eq 2$, condition on the old label $n = n_(k - 1)$, sample $z in V_k$ with probabilities $phi.alt_z \( x \)$, and switch to $n_z$ with probability

#[#set math.equation(numbering: n => "(4.3)")
 $ p_k \( n \, z \) = P \( \| n - Theta_z \| \) \, #h(2em) P \( d \) = min { 1 \, tau^(- 2) \( d - tau \)_(+)^2 } . $ <eq:labels-switch-function>]

Otherwise retain $n$. These samples and switch trials are made independently of the past conditional on the old label. If $p_k \( n \, z \) > 0$, then $n_z eq.not n$: the opposite equality would imply $\| n - Theta_z \| lt.eq tau \/ 20 < tau$.

For a label $n$, let $delta_n$ denote the probability vector concentrated at $n$. The initial row and subsequent transition rows are, respectively,

#[#set math.equation(numbering: n => "(4.4)")
 $ pi_1 \( x \) & = sum_(z in V_1) phi.alt_z \( x \) delta_(n_z) \,\
pi_k \( x \; n \, dot.op \) & = delta_n + sum_(z in V_k) phi.alt_z \( x \) p_k \( n \, z \) \( delta_(n_z) - delta_n \) \, quad k gt.eq 2 . $ <eq:labels-initial-row>]

Every entry is nonnegative and every row sums to one, as is also clear from the sampling rule. The rows are continuous, piecewise bilinear interpolations of bounded vectors, with Lipschitz constant at most $C \/ r_k$. These formulas, together with the initial row, specify the probability of each label sequence as a product of entries; this is the law $bb(P)_x$. We denote its expectation by $bb(E)_x$ and the marginal law of $n_k$ by $zeta_k \( x \)$. When convenient, the initial row is viewed as a transition from a single auxiliary state $*$, with $zeta_0 \( x \) = delta_(*)$ for every $x$.

The row switch probability for a prescribed old label is

$ rho_k \( x divides n \) = sum_(z in V_k) phi.alt_z \( x \) p_k \( n \, z \) \, #h(2em) k gt.eq 2 . $

Since a trial counted by this expression changes the label, define

#[#set math.equation(numbering: n => "(4.5)")
 $ R_k \( x \) & = sum_(n in cal(N)) zeta_(k - 1) \( x \; n \) rho_k \( x divides n \) = bb(P)_x \( n_k eq.not n_(k - 1) \) \, quad 2 lt.eq k lt.eq m \,\
R_1 \( x \) & = R_(m + 1) \( x \) = 1 . $ <eq:labels-switch-rates>]

The two sentinel values count the beginning and end of a history; they apply also when $m = 1$. The functions $R_k$ are continuous, since the rows are Lipschitz and each marginal is obtained by finitely many matrix products.

Let $G$ be the union of the grid lines at levels $1 \, dots.h \, m$. It is a fixed Lebesgue-null set. Off $G$ all the tent rows are differentiable. Define the scaled expected row-derivative costs there by

#[#set math.equation(numbering: n => "(4.6)")
 $ T_k \( x \) & = r_k sum_(n in cal(N)) zeta_(k - 1) \( x \; n \) sum_(n' in cal(N)) \| nabla_x pi_k \( x \; n \, n' \) \| \, quad 2 lt.eq k lt.eq m \,\
T_1 \( x \) & = r_1 sum_(n' in cal(N)) \| nabla_x pi_1 \( x \; n' \) \| . $ <eq:labels-derivative-costs>]

Set $T_k = 0$ on $G$. These are measurable versions of the costs, and all later bounds on their suprema are essential-supremum bounds. The derivative in this definition acts on one transition row; it is not the derivative of the marginal $zeta_k$. Off $G$, at most four level-$k$ tents have a nonzero gradient, and $\| nabla phi.alt_z \| lt.eq sqrt(2) \/ r_k$. It follows from the row formulas that

#[#set math.equation(numbering: n => "(4.7)")
 $ 0 lt.eq R_k lt.eq 1 \, #h(2em) 0 lt.eq T_k lt.eq C . $ <eq:labels-uniform-costs>]

The norm inside the inner sum in (4.6) is the Euclidean norm of the spatial gradient, whereas norms of probability vectors below are their $ell^1$ norms.

#thm([Lemma 4.2.])[
  (Good labels near a controlled vertex).  #emph[Set $c_(*) = \( tau \/ 10 \)^2$. Suppose $q in V_k$, $E_k \( q \) lt.eq c_(*)$, and $\| x - q \|_oo lt.eq 50 r_k$. Then $\( q \, n_k \)$ is good with $bb(P)_x$-probability one.]
] <lem:good-label>

#proof[
  Every vertex $z$ with $phi.alt_z \( x \) > 0$ satisfies $\| z - q \|_oo < 51 r_k < 200 r_k$, and hence $\| Theta_z - theta_q \| lt.eq tau \/ 10$. An initial or switched label therefore has distance at most $tau \/ 10 + tau \/ 20$ from $theta_q$. If a label $n$ is retained after sampling $z$ with positive probability, then $P \( \| n - Theta_z \| \) < 1$, so $\| n - Theta_z \| < 2 tau$. Its distance from $theta_q$ is consequently less than $21 tau \/ 10$. Both bounds are less than $2 sin \( pi \/ 12 \)$, since $tau = 1 \/ 100$. The angle between the resulting label and $theta_q$ is thus less than $pi \/ 6$, as required by the definition of a good pair. ◻
]

This lemma pays the bad-root terms in the first line of (3.16). If $q in cal(R) \( Q_p \)$ at level $k$, then $\| x - q \|_oo lt.eq 21 r_k$ throughout $Q_p$. Whenever $\( q \, n \)$ is bad and $E_k \( q \) lt.eq c_(*)$, the marginal probability of $n_k = n$ therefore vanishes on that whole cell. In the remaining case, $a_q lt.eq c_(*)^(- 1) a_q E_k \( q \)$, whose sum is bounded by (4.1), with the fixed cell and palette multiplicities. It remains to pay root masses at the endpoints of runs and in the terms where spatial weights are differentiated.

For $q in V_l$ define the closed square

$ D \( q \) = { x in bb(R)^2 : \| x - q \|_oo lt.eq 25 r_l } . $

It contains every level-$l$ pricing cell whose root neighborhood contains $q$: indeed $q in cal(R) \( Q_p \)$ and $x in Q_p$ give $\| x - q \|_oo lt.eq 21 r_l$. We can now state the estimate that pays both types of cost on those whole cells.

#thm([Proposition 4.3.])[
  (Packing of switch and derivative costs).  #emph[For every real $g in C_c^oo \( bb(R)^2 \)$ and every $m gt.eq 1$, the quantities constructed above satisfy 
#[#set math.equation(numbering: n => "(4.8)")
 $ sum_(l = 1)^m sum_(q in V_l) a_q [sup_(x in D \( q \)) #scale(x: 120%, y: 120%)[\(] R_l \( x \) + R_(l + 1) \( x \) #scale(x: 120%, y: 120%)[\)] + sum_(k = 1)^l 2^(k - l) "ess sup"_(x in D \( q \)) T_k \( x \)] lt.eq C V . $ <eq:label-packing>]

 The constant is absolute and independent of $m$.]
] <prop:label-packing>

We prove this proposition in three steps. First a positive measure on refinement paths will realize each $a_q$ exactly. Along each path, vector additivity will bound switches at its terminal position. Finally comparison of the laws at nearby points will turn that fixed-position estimate into the suprema over $D \( q \)$.

=== 4.3 Particles and intrinsic direction changes <particles-and-intrinsic-direction-changes>

The scalar decomposition in Section 3 is an identity of signed measures with cancelling pairs. Here we need a different object: a positive measure on complete refinement paths, with exact occupancy $a_q$ after birth. It must also retain the path before birth, because the label law has been evolving since level one. This path measure will not depend on $x$. We will combine it with $bb(P)_x$ by evaluating that law at a path’s terminal vertex. A path node at level $k$ is $xi = \( q_1 \, dots.h \, q_k \)$, where $q_j in V_j$ and each consecutive refinement coefficient is positive. Its path weight and mass are

$ b_xi = product_(j = 1)^(k - 1) lambda_(q_j q_(j + 1)) \, #h(2em) M_xi = b_xi a_(q_k) . $

The empty product at a root is one. The associated vector is $b_xi h_(q_k)$. Vectors add from the children to their parent, and therefore

#[#set math.equation(numbering: n => "(4.9)")
 $ M_xi lt.eq sum_(eta upright(" child of ") xi) M_eta . $ <eq:labels-child-capacity>]

Only a finite forest is needed. Choose all level-one roots whose closed tent supports meet $"supp" h$, and retain all their positive-weight paths through level $m$. There are finitely many roots and each node has finitely many children. If $a_q > 0$, the support of $phi.alt_q$ meets $"supp" h$. Every ancestor tent then meets $"supp" h$ by support nesting, so every positive-weight path to $q$ starts among the chosen roots. In particular no contribution to a nonzero mass is lost by this finite restriction. If $h = 0$, the forest may be empty. Consequently, at each level $k$,

#[#set math.equation(numbering: n => "(4.10)")
 $ sum_(xi : thin q_k = q) b_xi = 1 quad upright("if ") a_q > 0 \, #h(2em) sum_(\| xi \| = k) M_xi = A_k . $ <eq:labels-node-column-sums>]

#thm([Lemma 4.4.])[
  (A finite particle measure).  #emph[There is a finite positive measure $mu$ on pairs consisting of a terminal path $\( q_1 \, dots.h \, q_m \)$ and a birth level $B in { 1 \, dots.h \, m }$ such that, for every node $xi$ at level $k$, 
#[#set math.equation(numbering: n => "(4.11)")
 $ mu { B lt.eq k \, med \( q_1 \, dots.h \, q_k \) = xi } = M_xi . $ <eq:labels-node-occupancy>]

 In particular, 
#[#set math.equation(numbering: n => "(4.12)")
 $ mu { B lt.eq k \, med q_k = q } = a_q \, #h(2em) mu \( upright("all particles") \) = A_m lt.eq V . $ <eq:labels-vertex-occupancy>]

 Writing $y = q_m$ for the terminal position of a particle, its complete path obeys 
#[#set math.equation(numbering: n => "(4.13)")
 $ \| y - q_s \|_oo < r_s #h(2em) \( 1 lt.eq s lt.eq m \) . $ <eq:labels-path-locality>]

 The path is defined also at levels preceding its birth.]
] <lem:labels-particles>

#proof[
  At each root create mass $M_xi$ with birth level one. Suppose the population already present at a level-$k$ node has mass $M_xi$, and put $S_xi = sum_(eta upright(" child")) M_eta$. If $S_xi > 0$, send the fraction $M_eta \/ S_xi$ of each existing population type to the child $eta$. The mass sent there is $M_xi M_eta \/ S_xi lt.eq M_eta$ by (4.9). Create at that child additional mass $M_eta - M_xi M_eta \/ S_xi$ with birth level $k + 1$. If $S_xi = 0$, all these masses are zero. This operation preserves existing particles and fills each child to exactly its prescribed mass. A new particle at a child ending in $q_(k + 1)$ receives the entire prefix $\( q_1 \, dots.h \, q_k \, q_(k + 1) \)$ of that child, as well as its new birth level. Thus a particle born below a zero-mass ancestor still has a specified direction history at that ancestor. No particle mass is counted as occupying that ancestor before birth.
  After the finite number of levels, the masses of the resulting terminal-path and birth-level types define a finite atomic measure $mu$. All particles present at $xi$ continue to terminal descendants of $xi$, conserving their mass $M_xi$. Conversely, any terminal particle with that prefix and $B lt.eq k$ was already present at $xi$. Particles born later may carry the same prefix, but the condition $B lt.eq k$ excludes them. This proves (4.11). Summing over prefixes and using (4.10) gives (4.12). For a positive consecutive refinement coefficient, $\| q_(j + 1) - q_j \|_oo lt.eq r_j \/ 2$. Hence
  $ \| q_m - q_s \|_oo lt.eq sum_(j = s)^(m - 1) r_j \/ 2 = r_s \( 1 - 2^(- \( m - s \)) \) < r_s \, $
  with the same strict upper bound when $s = m$. This proves the locality assertion. ◻
]

The particle measure now realizes every vector mass exactly at its level. It lets us prove a pathwise bound and then recover a sum over all cells by integration. We next mark the genuine direction changes along a path. The sum of the norms of descendant vectors may exceed the norm of their sum at the ancestor; this nonnegative difference will pay for the marks.

Mark every root of the path forest. Below a mark, mark the first nodes whose direction $theta_(q_s)$ has distance greater than $tau \/ 8$ from the direction at that mark, and repeat the rule below each new mark. These intrinsic marks depend on the path forest and the vector masses; they do not depend on the label process at any point $x$.

#thm([Lemma 4.5.])[
  (Intrinsic marks and expected switches).  #emph[The particle measure satisfies 
#[#set math.equation(numbering: n => "(4.14)")
 $ sum_(xi upright(" intrinsically marked")) M_xi & lt.eq C V \,\
integral sum_(s = B)^m E_s \( q_s \) thin #h(-0.16667em) upright(d) mu & lt.eq C V \,\
integral sum_(s = B)^m R_s \( y \) thin #h(-0.16667em) upright(d) mu & lt.eq C V . $ <eq:labels-mark-budget>]

]
] <lem:labels-switch-packing>

#proof[
  For a marked nonterminal node $xi$, let $cal(L)_xi$ consist of the first subsequent marks on each descending branch, supplemented by terminal nodes on branches with no later mark. This is a finite frontier. Writing $theta.alt_xi = theta_(q_k)$ at a level-$k$ node, vector additivity gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ sum_(eta in cal(L)_xi) M_eta - M_xi = 1 / 2 sum_(eta in cal(L)_xi) M_eta \| theta.alt_eta - theta.alt_xi \|^2 gt.eq tau^2 / 128 sum_(eta in cal(L)_xi\
eta upright(" marked")) M_eta . $ <eq:labels-stopped-defect>]
  For clarity, vector additivity on the frontier says $sum_(eta in cal(L)_xi) M_eta theta.alt_eta = M_xi theta.alt_xi$. Taking its scalar product with the unit vector $theta.alt_xi$ proves the identity, even if $M_xi = 0$. For $m > 1$, every marked nonterminal node other than a root occurs positively in its preceding marked frontier and negatively in its own summand. Every terminal node occurs in exactly one frontier. The sum of the left sides is therefore $A_m - A_1 lt.eq V$. Every nonroot mark occurs in exactly one frontier. Adding the root masses proves (4.14); if $m = 1$, the assertion follows directly from the root mass bound.
  By (4.11), integration of the number of intrinsic marks at levels $s gt.eq B$ is the left side of (4.14). Similarly,
  $ integral sum_(s = B)^m E_s \( q_s \) thin #h(-0.16667em) upright(d) mu = sum_(s = 1)^m sum_(q in V_s) a_q E_s \( q \) \, $
  so (4.14) follows from (4.1).
  For the switch estimate, fix a particle, including its path, birth level, and terminal position $y$. Run the finite-state law at this fixed point $y$. Let $X_1 = 1$, and for $s gt.eq 2$ let $X_s = upright(bold(1))_({ n_s eq.not n_(s - 1) })$. Thus $bb(E)_y X_s = R_s \( y \)$ for $1 lt.eq s lt.eq m$. Among levels $B \, dots.h \, m$, call a level exceptional if it is intrinsically marked or if $E_s \( q_s \) > c_(*)$. Remove those levels and consider a consecutive interval of remaining levels. Throughout this interval, all $theta_(q_s)$ are within $tau \/ 8$ of the same most recent intrinsic marked direction, even if that mark occurred before birth. Every sampled vertex at $y$ lies within $2 r_s$ of $q_s$ by (4.13), and hence its sampled direction is within $tau \/ 10$ of $theta_(q_s)$. Any two sampled directions on the interval are therefore at distance at most
  $ 2 \( tau \/ 8 + tau \/ 10 \) = 9 tau \/ 20 . $
  After one switch on the interval, the new label is within an additional $tau \/ 20$ of the direction sampled at that switch. Its distance to every subsequently sampled direction is at most $tau \/ 2 < tau$, so all later switch probabilities on this interval are zero. The same observation applies after the initial assignment, should it be counted on such an interval. There is consequently at most one counted switch on each remaining interval, regardless of the label entering it.
  If there are $J$ exceptional levels, there are at most $J + 1$ such intervals and at most $J$ switches at exceptional levels. Thus every realization obeys
  $ sum_(s = B)^m X_s lt.eq 1 + 2 \# { s gt.eq B : s upright(" is intrinsically marked") } + 2 c_(*)^(- 1) sum_(s = B)^m E_s \( q_s \) . $
  Taking $bb(E)_y$, then integrating over particles, proves (4.14) from the first two bounds and $mu \( upright("all particles") \) lt.eq V$. ◻
]

=== 4.4 Comparison of label laws at nearby points <comparison-of-label-laws-at-nearby-points>

We have bounded the expected switches at the single point $y$ attached to each particle. This does not yet give Proposition 12: the local prices are integrated on cells, so their coefficients must be controlled uniformly there. We also still need the row-derivative cost. The same comparison of nearby rows supplies both missing bounds.

We compare the law at any point of $D \( q_l \)$ with the law at the terminal position of a particle. The comparison uses the complete particle path, including its levels before birth.

#thm([Lemma 4.6.])[
  (Spatial comparison).  #emph[Fix a particle, a level $1 lt.eq l lt.eq m$, and $x in D \( q_l \)$. Set 
$ c_s = R_s \( y \) + E_s \( q_s \) \, #h(2em) 1 lt.eq s lt.eq m . $

 For $1 lt.eq k lt.eq min \( l + 1 \, m \)$, 
#[#set math.equation(numbering: n => "(4.16)")
 $ R_k \( x \) + T_k \( x \) lt.eq C sum_(s = 1)^k 2^(s - k) c_s . $ <eq:labels-spatial-comparison>]

 The assertion for $R_k$ holds at every $x$ in the specified set, and the assertion for $T_k$ holds almost everywhere there. The constant is uniform over particles, $l$, and $x$.]
] <lem:labels-spatial-comparison>

#proof[
  By (4.13), $\| x - y \|_oo < 26 r_l$. At a step $s lt.eq min \( l + 1 \, m \)$, any vertex $z$ whose tent is nonzero at $x$ or at $y$ satisfies
  $ \| z - q_s \|_oo lt.eq r_s + 26 r_l + r_s lt.eq 54 r_s < 200 r_s . $
  Off $G$, a tent with nonzero gradient at $x$ also has positive value there, so the same bound covers every differentiated tent. At grid points the probability comparison still uses the exact tent values; no assertion about a classical row derivative is needed. Thus all the directions involved differ from $theta_(q_s)$ by at most $sqrt(E_s \( q_s \))$.
  Fix $s gt.eq 2$ and an old label $n$. The function $d mapsto sqrt(P \( d \)) = min { 1 \, tau^(- 1) \( d - tau \)_(+) }$ is $tau^(- 1)$-Lipschitz. For any two involved vertices $z \, z'$, it follows that
  $ p_s \( n \, z \) lt.eq 2 p_s \( n \, z' \) + 2 tau^(- 2) \| Theta_z - Theta_(z') \|^2 lt.eq 2 p_s \( n \, z' \) + 8 tau^(- 2) E_s \( q_s \) . $
  Averaging $z'$ with the probabilities $phi.alt_(z') \( y \)$ shows that the largest $p_s \( n \, z \)$ among all involved vertices is bounded by
  #[#set math.equation(numbering: n => "(4.17)")
   $ C #scale(x: 120%, y: 120%)[\(] rho_s \( y divides n \) + E_s \( q_s \) #scale(x: 120%, y: 120%)[\)] . $ <eq:labels-row-rate-comparison>]
  The row formula (4.4) and the tent derivative bounds then give
  #[#set math.equation(numbering: n => "(4.18)")
   $ rho_s \( x divides n \) & lt.eq C #scale(x: 120%, y: 120%)[\(] rho_s \( y divides n \) + E_s \( q_s \) #scale(x: 120%, y: 120%)[\)] \,\
r_s sum_(n' in cal(N)) \| nabla_x pi_s \( x \; n \, n' \) \| & lt.eq C #scale(x: 120%, y: 120%)[\(] rho_s \( y divides n \) + E_s \( q_s \) #scale(x: 120%, y: 120%)[\)] $ <eq:labels-row-rate>]
  almost everywhere in the second assertion. Moreover, the union of the sets of tents nonzero at $x$ and $y$ has uniformly bounded cardinality, and each tent is $C \/ r_s$-Lipschitz. Subtracting the two rows therefore yields the pointwise bound
  #[#set math.equation(numbering: n => "(4.19)")
   $ parallel pi_s \( x \; n \, dot.op \) - pi_s \( y \; n \, dot.op \) parallel_(ell^1) lt.eq C 2^(s - l) #scale(x: 120%, y: 120%)[\(] rho_s \( y divides n \) + E_s \( q_s \) #scale(x: 120%, y: 120%)[\)] . $ <eq:labels-row-difference>]
  For $s = 1$, the analogous derivative and difference bounds are $C$ and $C 2^(1 - l)$, respectively, by (4.4). These bounds are covered by using $c_1 = 1 + E_1 \( q_1 \) gt.eq 1$.
  The rows have now been compared for each fixed old label. The old-label distributions themselves also differ between $x$ and $y$, and must be accounted for before estimating $R_k$ and $T_k$. Let $d_s \( x \, y \) = parallel zeta_s \( x \) - zeta_s \( y \) parallel_(ell^1)$ and $d_0 = 0$. Multiplication by a stochastic matrix $Pi$ contracts the $ell^1$ norm of signed row vectors: for any such vector $v$,
  $ parallel v Pi parallel_1 lt.eq sum_n \| v \( n \) \| sum_(n') Pi \( n \, n' \) = parallel v parallel_1 . $
  The marginal recursion therefore gives
  $ d_s \( x \, y \) & lt.eq d_(s - 1) \( x \, y \) + parallel zeta_(s - 1) \( y \) \( pi_s \( x \) - pi_s \( y \) \) parallel_(ell^1)\
 & lt.eq d_(s - 1) \( x \, y \) + C 2^(s - l) c_s . $
  The first step uses the single-row interpretation. At later steps the last inequality follows by averaging (4.19) against the old-label law at $y$, which averages $rho_s \( y divides n \)$ to $R_s \( y \)$. Consequently
  #[#set math.equation(numbering: n => "(4.20)")
   $ d_j \( x \, y \) lt.eq C sum_(s = 1)^j 2^(s - l) c_s \, #h(2em) j lt.eq min \( l + 1 \, m \) . $ <eq:labels-marginal-distance>]
  This recursion does not assume independence between marginal labels at the two observation points.
  For $k gt.eq 2$, first average the row switch rate and the row derivative cost at $x$ against $zeta_(k - 1) \( y \)$. Equations (4.18)–(4.18) bound the result by $C c_k$. Replacing this old-label distribution by $zeta_(k - 1) \( x \)$ costs at most $C d_(k - 1) \( x \, y \)$, because row switch rates are at most one and scaled row derivative costs are uniformly bounded. Thus
  $ R_k \( x \) + T_k \( x \) lt.eq C c_k + C sum_(s = 1)^(k - 1) 2^(s - l) c_s . $
  Since $k lt.eq l + 1$, we have $2^(s - l) lt.eq 2 thin 2^(s - k)$. This proves (4.16) for $k gt.eq 2$. For $k = 1$ it follows directly from $R_1 = 1$, (4.7), and $c_1 gt.eq 1$. ◻
]

=== 4.5 The packing estimate <the-packing-estimate>

#proof[
  Denote the bracket for a level-$l$ vertex by $cal(C)_l \( q \)$. All its quantities are nonnegative and measurable; the switch rates are continuous and the derivative costs have specified measurable versions. The particle occupancy identity gives the exact rewriting
  #[#set math.equation(numbering: n => "(4.21)")
   $ sum_(l = 1)^m sum_(q in V_l) a_q cal(C)_l \( q \) = integral sum_(l = B)^m cal(C)_l \( q_l \) thin #h(-0.16667em) upright(d) mu . $ <eq:labels-cost-occupancy>]
  Fix a particle, and continue to write $c_s = R_s \( y \) + E_s \( q_s \)$. The comparison in Lemma 15 is uniform on each $D \( q_l \)$, so it applies to the supremum and essential supremum in $cal(C)_l \( q_l \)$. For $l < m$, it bounds both $R_l$ and $R_(l + 1)$. For $l = m$, the convention $R_(m + 1) = 1$ contributes just one additional unit. The derivative terms have the exact geometric convolution
  $ sum_(k = 1)^l 2^(k - l) sum_(s = 1)^k 2^(s - k) c_s = sum_(s = 1)^l \( l - s + 1 \) 2^(s - l) c_s . $
  It follows that
  #[#set math.equation(numbering: n => "(4.22)")
   $ sum_(l = B)^m cal(C)_l \( q_l \) lt.eq C [1 + sum_(l = B)^m sum_(s = 1)^(min \( l + 1 \, m \)) \( l - s + 2 \) 2^(s - l) c_s] . $ <eq:labels-double-convolution>]
  For a fixed $s gt.eq B$, the coefficient of $c_s$ on the right is bounded by
  $ sum_(j = - 1)^oo \( j + 2 \) 2^(- j) < oo \, #h(2em) j = l - s . $
  Thus the terms at or after birth cost at most $C sum_(s = B)^m c_s$. Their integral is at most $C V$ by (4.14) and (4.14).
  For the terms before birth, use $0 lt.eq c_s lt.eq 5$. Put $q = B - s gt.eq 1$ and $j = l - B gt.eq 0$. Their total for this particle is at most
  $ 5 sum_(q = 1)^oo sum_(j = 0)^oo \( j + q + 2 \) 2^(- \( j + q \)) = 5 sum_(n = 1)^oo n \( n + 2 \) 2^(- n) < oo . $
  This bound is independent of $B$ and of the particle, and therefore its integral is at most $C V$ by (4.12). The isolated unit in (4.22) has the same bound. Inserting these estimates into (4.21) proves (4.8). ◻
]

== 5 Signed finite-radius envelopes <sec:assembly>

The common prices control unfavorable directional components. The direction law controls the endpoints created when a direction changes. We now combine those estimates, keeping the remaining directional projections signed until integration by parts. The essential cancellation is that the derivatives of a probability row sum to zero. Subtracting the potential of the preceding history then leaves only oscillations at smaller radii.

Throughout this section, $g in C_c^oo \( bb(R)^2 \)$ is real, $u_t = A_t g$, $V = integral \| nabla g \|$, and $r_k = 2^(- k)$ for $1 lt.eq k lt.eq m$. Use the prices and label law of Sections 3 and 4. For $1 lt.eq i lt.eq j lt.eq m$, put

#[#set math.equation(numbering: n => "(5.1)")
 $ F_(i j) \( x \) = max_(r_j lt.eq t lt.eq 2 r_i) u_t \( x \) . $ <eq:run-envelope>]

The maximum is attained, since $t mapsto u_t \( x \)$ is continuous. These envelopes are compactly supported: all their radii are at most $2 r_1 = 1$, so all their averages vanish outside the closed $1$-neighborhood of $"supp" g$. They are Lipschitz, with common Lipschitz bound $parallel nabla g parallel_oo$.

Outside one null set all the finitely many $F_(i j)$ are differentiable. At any such point $x$, every radius $t$ attaining $F_(i j) \( x \)$ satisfies

#[#set math.equation(numbering: n => "(5.2)")
 $ nabla F_(i j) \( x \) = nabla u_t \( x \) . $ <eq:envelope-touching>]

Indeed, with this radius held fixed, the differentiable function $F_(i j) - u_t$ is nonnegative everywhere and is zero at $x$. Its gradient there is zero. This proves the assertion also when there are several attaining radii. The same touching principle underlies the optimizing-radius identity of Hajłasz and Malý #cite(label("HajlaszMaly2010")) Theorem 2 and Remark 3; here it applies directly to the smooth signed averages. No selected radius is differentiated.

To prove Proposition 2, it suffices first to bound the normalized band by an absolute constant independent of $m$:

#[#set math.equation(numbering: n => "(5.3)")
 $ integral_(bb(R)^2) \| nabla F_(1 m) \| thin #h(-0.16667em) upright(d) x lt.eq C integral_(bb(R)^2) \| nabla g \| thin #h(-0.16667em) upright(d) x . $ <eq:finite-band>]

#proof[
  We first bound the normalized band in (5.3). For a label history $upright(bold(n)) = \( n_1 \, dots.h \, n_m \) in cal(N)^m$, a #emph[run] is a maximal interval $\[ i \, j \]$ of indices on which the label is constant. Its radius interval is $\[ r_j \, 2 r_i \]$. Adjacent intervals meet at an endpoint, and their union is $\[ r_m \, 1 \]$. Thus
  $ F_(1 m) = max_(\[ i \, j \] upright(" a run")) F_(i j) . $
  At a point where all the envelopes are differentiable, some run attains this maximum, and its gradient agrees with $nabla F_(1 m)$ by the same touching argument.
  The cone inequality (3.5) states that, for every $n in cal(N)$ and $z in bb(R)^2$,
  $ \| z \| lt.eq C [n dot.op z + sum_plus.minus \( - e_plus.minus \( n \) dot.op z \)_(+)] \, $
  and the bracket is nonnegative. Apply it to a run attaining $F_(1 m)$, add the nonnegative brackets from the other runs, and average over the history law at $x$. This gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| nabla F_(1 m) \| lt.eq C thin bb(E)_x sum_(\[ i \, j \] upright(" a run")) [n_i dot.op nabla F_(i j) + sum_plus.minus \( - e_plus.minus \( n_i \) dot.op nabla F_(i j) \)_(+)] quad upright("a.e.") $ <eq:run-master>]
  There are finitely many histories and runs. In particular, their expectations and all differentiations of their weights below are finite sums.
  ===== 5.1 The unfavorable components and the ends of runs. <the-unfavorable-components-and-the-ends-of-runs.>
  For a run $\[ i \, j \]$, choose any attaining radius $t$ at the point under consideration, and a bin $\[ r_k \, 2 r_k \]$ containing it, with $i lt.eq k lt.eq j$. If $i < k < j$, the interval $\[ t - r_k \/ 4 \, t + r_k \/ 4 \]$ lies inside $\[ r_j \, 2 r_i \]$. The maximizing property therefore gives $t in cal(I)_k \( x \)$. If $k = i$ or $k = j$, the full bin is still contained in the run interval, so $t$ maximizes on that bin and belongs to $cal(J)_k \( x \)$. Touching, including at tied radii, identifies the gradients.
  Write
  $ B_k \( x \) = sup_(t in cal(J)_k \( x \)) \| nabla u_t \( x \) \| \, #h(2em) A_(k \, n) \( x \) = sup_(t in cal(I)_k \( x \)) sum_plus.minus \( - e_plus.minus \( n \) dot.op nabla u_t \( x \) \)_(+) . $
  A bin is an end bin of its run only if a run starts at $k$ or ends at $k$. These events have probabilities $R_k$ and $R_(k + 1)$, respectively, with the sentinel conventions $R_1 = R_(m + 1) = 1$. Also each bin belongs to exactly one run. Since each of the two negative projections is bounded by the gradient norm, we obtain
  #[#set math.equation(numbering: n => "(5.5)")
   $ bb(E)_x sum_(\[ i \, j \] upright(" a run")) sum_plus.minus \( - e_plus.minus \( n_i \) dot.op nabla F_(i j) \)_(+) lt.eq sum_(k = 1)^m sum_(n in cal(N)) bb(P)_x \( n_k = n \) A_(k \, n) \( x \) + 2 sum_(k = 1)^m \( R_k + R_(k + 1) \) B_k \( x \) . $ <eq:negative-sum>]
  No measurable choice of the attaining radius is needed: this is a pointwise bound by the measurable suprema on the right.
  Here are the spatial sums in this estimate. For a level-$k$ cell $Q = Q_p$ and $q in cal(R) \( Q \)$, every $x in Q$ satisfies $\| x - q \|_oo lt.eq 21 r_k$. Thus $Q subset D \( q \)$, and $Q$ also lies in the $50 r_k$ neighborhood used in Lemma 11. If $\( q \, n \)$ is bad and $E_k \( q \) lt.eq c_(*)$, that lemma says $bb(P)_x \( n_k = n \) = 0$ throughout $Q$. Every remaining bad-root charge is bounded by $a_q lt.eq c_(*)^(- 1) a_q E_k \( q \)$. Take the supremum of each label probability on $Q$ and apply the directional part of Proposition 9. Its price charges sum by (3.15); its root charges sum by (4.1). The finite palette and the $41^2$ cells having a given vertex in their root neighborhood contribute only absolute factors.
  For the last sum in (5.5), the endpoint estimate in Proposition 9 gives, cell by cell,
  $ integral_Q \( R_k + R_(k + 1) \) B_k lt.eq C sup_Q \( R_k + R_(k + 1) \) (D_Q + sum_(q in cal(R) \( Q \)) a_q) . $
  The price part sums because $R_k + R_(k + 1) lt.eq 2$. For each root part, enlarge $Q$ to $D \( q \)$ and use the switch part of (4.8), again with bounded cell multiplicity. We have proved
  #[#set math.equation(numbering: n => "(5.6)")
   $ integral_(bb(R)^2) bb(E)_x sum_(\[ i \, j \] upright(" a run")) sum_plus.minus \( - e_plus.minus \( n_i \) dot.op nabla F_(i j) \)_(+) thin #h(-0.16667em) upright(d) x lt.eq C V . $ <eq:negative-integral>]
  ===== 5.2 Baselines and weighted integration by parts. <baselines-and-weighted-integration-by-parts.>
  It remains to integrate the signed projections in (5.4). Subtract $u_(r_i)$ from the envelope of every run starting at $i$. Since $r_i$ is a forced endpoint in $cal(J)_i \( x \)$, the same endpoint and packing estimates give
  #[#set math.equation(numbering: n => "(5.7)")
   $ integral bb(E)_x sum_(\[ i \, j \] upright(" a run")) \| nabla u_(r_i) \| = sum_(i = 1)^m integral R_i \| nabla u_(r_i) \| lt.eq sum_(i = 1)^m integral \( R_i + R_(i + 1) \) B_i lt.eq C V . $ <eq:baseline-cost>]
  For a fixed history define its vector potential by
  #[#set math.equation(numbering: n => "(5.8)")
   $ Phi_(upright(bold(n))) \( x \) = sum_(\[ i \, j \] upright(" a run")) n_i #scale(x: 120%, y: 120%)[\(] F_(i j) \( x \) - u_(r_i) \( x \) #scale(x: 120%, y: 120%)[\)] . $ <eq:path-potential>]
  Its run partition and labels are fixed; only its scalar functions depend on $x$. It is a compactly supported Lipschitz vector field, and its divergence is the sum of the signed projections after baseline subtraction.
  Use the auxiliary state $n_0 = *$ to write the initial row as $pi_1 \( x \; * \, n_1 \)$. The probability of the history is
  $ w_(upright(bold(n))) \( x \) = product_(s = 1)^m pi_s \( x \; n_(s - 1) \, n_s \) . $
  Every factor is Lipschitz and takes values in $\[ 0 \, 1 \]$. The weak product rule and compact support of $w_(upright(bold(n))) Phi_(upright(bold(n)))$ therefore give
  #[#set math.equation(numbering: n => "(5.9)")
   $ sum_(upright(bold(n))) integral w_(upright(bold(n))) thin "div" Phi_(upright(bold(n))) thin #h(-0.16667em) upright(d) x = - sum_(upright(bold(n))) integral Phi_(upright(bold(n))) dot.op nabla w_(upright(bold(n))) thin #h(-0.16667em) upright(d) x . $ <eq:weighted-ibp>]
  Indeed the integral of the divergence of a compactly supported Lipschitz vector field is zero, as follows by testing against a smooth function equal to one on its support. We must exploit the sign of the right side before estimating its size.
  ===== 5.3 Cancellation after a fixed prefix. <cancellation-after-a-fixed-prefix.>
  Differentiate the product defining $w_(upright(bold(n)))$ directly. For its term at step $k$, fix the prefix $upright(bold(a)) = \( n_1 \, dots.h \, n_(k - 1) \)$ and set
  $ W_(upright(bold(a))) = product_(s < k) pi_s \( x \; n_(s - 1) \, n_s \) \, #h(2em) J_(k \, upright(bold(n))) = product_(s > k) pi_s \( x \; n_(s - 1) \, n_s \) . $
  Empty products equal one. The corresponding term of $nabla w_(upright(bold(n)))$ is $W_(upright(bold(a))) nabla pi_k \( x \; n_(k - 1) \, n_k \) J_(k \, upright(bold(n)))$. This formula remains valid when some transition entries vanish; it involves no division by them.
  For each fixed prefix and $n_k$, summing the future product gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_(n_(k + 1) \, dots.h \, n_m) J_(k \, upright(bold(n))) = 1 . $ <eq:future-normalization>]
  To see this, first sum in $n_m$ using the normalization of the last row, and repeat backward to $n_(k + 1)$. Also, wherever the rows are differentiable,
  #[#set math.equation(numbering: n => "(5.11)")
   $ sum_(n_k in cal(N)) nabla pi_k \( x \; n_(k - 1) \, n_k \) = 0 \, $ <eq:row-derivative-zero>]
  by differentiating their finite sum, which is the constant one.
  Let $Psi_(upright(bold(a)))$ be the potential of this prefix with its last run closed at $k - 1$: explicitly, use the sum (5.8) for the runs of $\( n_1 \, dots.h \, n_(k - 1) \)$. For $k = 1$ set $Psi_diameter = 0$. This potential is independent of $n_k$ and of every future label. Equations (5.10)–(5.11) therefore imply the exact identity
  #[#set math.equation(numbering: n => "(5.12)")
   $ & sum_(n_k \, dots.h \, n_m) J_(k \, upright(bold(n))) Phi_(upright(bold(n))) dot.op nabla pi_k \( x \; n_(k - 1) \, n_k \)\
 & #h(8mm)  = sum_(n_k \, dots.h \, n_m) J_(k \, upright(bold(n))) \( Phi_(upright(bold(n))) - Psi_(upright(bold(a))) \) dot.op nabla pi_k \( x \; n_(k - 1) \, n_k \) . $ <eq:prefix-subtraction>]
  The subtraction precedes every absolute value in the next estimate.
  We claim that each continuation of the prefix satisfies
  #[#set math.equation(numbering: n => "(5.13)")
   $ \| Phi_(upright(bold(n))) \( x \) - Psi_(upright(bold(a))) \( x \) \| lt.eq sum_(l = k)^m v_l \( x \) \, #h(2em) v_l = sup_(0 < t \, t' lt.eq 4 r_l) \| u_t - u_(t') \| . $ <eq:prefix-potential>]
  All already completed runs cancel. If the last prefix run $\[ i \, k - 1 \]$ continues to $j gt.eq k$, its baseline cancels as well, leaving $n_i \( F_(i j) - F_(i \, k - 1) \)$. The old radius interval contains $r_(k - 1)$, and the extension adds only radii below that number. Consequently
  $ 0 lt.eq F_(i j) - F_(i \, k - 1) lt.eq sup_(0 < t lt.eq r_(k - 1)) \( u_t - u_(r_(k - 1)) \)_(+) lt.eq v_k \, #h(2em) r_(k - 1) = 2 r_k . $
  Every new run $\[ l \, j \]$, beginning at $l gt.eq k$, contributes a vector of norm $F_(l j) - u_(r_l) lt.eq v_l$, because its envelope includes the baseline and all its radii are at most $2 r_l$. If the prefix run continues, the new runs start strictly after $k$; if there is a switch at $k$, the closed prefix itself is unchanged. The empty-prefix case consists entirely of new runs. Since their starting indices are distinct, these observations prove (5.13). In particular, the size of an old large-radius envelope never enters the bound.
  Now take absolute values in (5.12) and sum over prefixes. The future products are nonnegative and sum to one. The sum of the norms of the step-$k$ product-rule terms is exactly
  $ & sum_(upright(bold(a))) W_(upright(bold(a))) sum_(n_k) \| nabla pi_k \( x \; n_(k - 1) \, n_k \) \| sum_(n_(k + 1) \, dots.h \, n_m) J_(k \, upright(bold(n)))\
 & #h(2em) = sum_(n in cal(N)) zeta_(k - 1) \( x \; n \) sum_(n') \| nabla pi_k \( x \; n \, n' \) \| = frac(T_k \( x \), r_k) quad \( k gt.eq 2 \) . $
  For $k = 1$ the same identity uses the single initial row, exactly as in (4.6). Combining these identities with the product expansion and (5.9) yields
  #[#set math.equation(numbering: n => "(5.14)")
   $ lr(|sum_(upright(bold(n))) integral w_(upright(bold(n))) "div" Phi_(upright(bold(n)))|) lt.eq sum_(1 lt.eq k lt.eq l lt.eq m) integral frac(T_k \( x \), r_k) v_l \( x \) thin #h(-0.16667em) upright(d) x . $ <eq:flux-cost>]
  ===== 5.4 Paying for the smaller-radius oscillations. <paying-for-the-smaller-radius-oscillations.>
  On a level-$l$ cell, the value estimate in Proposition 9 gives
  $ integral_Q v_l lt.eq C r_l (D_Q + sum_(q in cal(R) \( Q \)) a_q) . $
  Multiply this by $r_k^(- 1) "ess sup"_Q T_k$. For the price terms, $T_k lt.eq C$ and
  $ sum_(k = 1)^l r_l / r_k = sum_(k = 1)^l 2^(k - l) lt.eq 2 . $
  Their full sum is therefore at most $C sum_(l \, Q) D_Q lt.eq C V$. For the root terms use $Q subset D \( q \)$ and reorder the finite nonnegative sums. They are at most an absolute multiple of
  $ sum_(l = 1)^m sum_(q in V_l) a_q sum_(k = 1)^l 2^(k - l) "ess sup"_(D \( q \)) T_k lt.eq C V $
  by (4.8). Thus (5.14) is at most $C V$. Together with (5.7), this bounds the integral of the signed projections in (5.4) from above by $C V$. Equation (5.6) pays for the remaining terms and proves (5.3).
  For $b \/ a = 2^m$ with $m gt.eq 1$, apply the normalized result to $g_b \( x \) = g \( b x \)$. Its normalized envelope is $S_(a \, b) g \( b x \)$, and both gradient integrals acquire the same factor $b^(- 1)$ under the change of variables. This proves the stated bound for all bands in the proposition. Finally, when $a = b$, convolution gives $nabla A_a g = A_a \( nabla g \)$, and Tonelli’s theorem yields $integral \| nabla A_a g \| lt.eq integral \| nabla g \|$. ◻
]

== 6 Sobolev input and absolute continuity <sec:extension>

The signed estimate now gives the endpoint theorem in two steps. First, approximation passes it to Sobolev inputs and yields a finite distributional derivative measure for the maximal function. Second, local mean subtraction shows that this measure gives no mass to a Lebesgue-null set. The second step is needed to obtain a weak gradient in $L^1$, and it is the reason the finite-band estimate was proved for signed inputs.

For real $g in W^(1 \, 1) \( bb(R)^2 \)$ and $0 < a lt.eq b < oo$, continue to write

$ S_(a \, b) g \( x \) = sup_(a lt.eq t lt.eq b) A_t g \( x \) . $

The disk integrals define these functions independently of the representative of $g$. The positive lower radius makes the supremum finite at every $x$, since $\| A_t g \( x \) \| lt.eq parallel g parallel_1 \/ \( pi a^2 \)$. The elementary analytic facts used below, including the exact Euclidean variation formula, are proved in Appendix 7.

#thm([Lemma 6.1.])[
  (Sobolev finite bands).  #emph[For every real $g in W^(1 \, 1) \( bb(R)^2 \)$ and $0 < a lt.eq b < oo$, $S_(a \, b) g$ is globally Lipschitz and 
#[#set math.equation(numbering: n => "(6.1)")
 $ "Lip" \( S_(a \, b) g \) lt.eq frac(parallel nabla g parallel_1, pi a^2) . $ <eq:band-lipschitz>]

 If $b \/ a$ is a nonnegative integer power of two, then 
#[#set math.equation(numbering: n => "(6.2)")
 $ integral_(bb(R)^2) \| nabla S_(a \, b) g \| thin #h(-0.16667em) upright(d) x lt.eq C parallel nabla g parallel_1 \, $ <eq:sobolev-band>]

 where $C$ is absolute and independent of the band. This includes $a = b$, when the envelope is one average.]
] <lem:sobolev-band>

#proof[
  The translation estimate of Lemma 19 gives, for $t gt.eq a$ and $z in bb(R)^2$,
  $ \| A_t g \( x + z \) - A_t g \( x \) \| & lt.eq frac(1, pi t^2) integral_(B \( x \, t \)) \| g \( y + z \) - g \( y \) \| thin #h(-0.16667em) upright(d) y\
 & lt.eq frac(\| z \|, pi a^2) parallel nabla g parallel_1 . $
  Taking suprema over the same radius interval on both sides proves (6.1). The same comparison gives, for any two integrable real inputs,
  #[#set math.equation(numbering: n => "(6.3)")
   $ parallel S_(a \, b) g - S_(a \, b) tilde(g) parallel_oo lt.eq frac(parallel g - tilde(g) parallel_1, pi a^2) . $ <eq:band-uniform-approximation>]
  Here the inequality $\| sup f_t - sup h_t \| lt.eq sup \| f_t - h_t \|$ is applied to bounded families of real numbers.
  Choose real $g_j in C_c^oo$ converging to $g$ in $W^(1 \, 1)$. At the fixed lower radius $a$, (6.3) gives uniform convergence of the band envelopes. If $b \/ a$ is a power of two greater than one, Proposition 2 therefore passes to the limit by the local variation inequality in Lemma 22:
  $ integral \| nabla S_(a \, b) g \| lt.eq liminf_j integral \| nabla S_(a \, b) g_j \| lt.eq C lim_j parallel nabla g_j parallel_1 = C parallel nabla g parallel_1 . $
  The limit is Lipschitz by (6.1), so its weak and almost-everywhere classical gradients agree. When $a = b$, testing the convolution against smooth functions gives $nabla A_a g = A_a \( nabla g \)$ distributionally; the integral of its norm is at most $parallel nabla g parallel_1$ by Tonelli’s theorem. ◻
]

#proof[
  At this point take $g = \| f \|$. Lemma 19 shows that $g in W^(1 \, 1) \( bb(R)^2 \)$ and
  $ V_g := parallel nabla g parallel_1 lt.eq parallel nabla f parallel_1 . $
  The planar Sobolev inequality in Lemma 20 gives $g in L^2 \( bb(R)^2 \)$. The strong $L^2$ maximal inequality #cite(label("Kinnunen1997")) (1.2) then yields $M f = M g in L^2 \( bb(R)^2 \)$, hence local integrability. Define
  $ G_N = S_(2^(- N) \, 2^N) g \, #h(2em) N = 1 \, 2 \, dots.h . $
  Because $g gt.eq 0$, these nonnegative functions increase to $M g$ and are bounded above by it. Dominated convergence on every bounded set implies $G_N arrow.r M g$ in $L_(upright("loc"))^1$.
  ===== 6.1 A finite derivative measure. <a-finite-derivative-measure.>
  Lemma 16 bounds $integral \| nabla G_N \|$ by $C V_g$ uniformly in $N$. In particular, for every $phi in C_c^1 \( bb(R)^2 \; bb(R)^2 \)$,
  $ lr(|- integral M g thin "div" phi|) = lim_N lr(|integral nabla G_N dot.op phi|) lt.eq C V_g parallel phi parallel_oo . $
  The vector-measure statement of Lemma 22 supplies a finite vector Radon measure $H = D \( M g \)$, with
  #[#set math.equation(numbering: n => "(6.4)")
   $ \| H \| \( bb(R)^2 \) lt.eq C V_g . $ <eq:variation-limit>]
  It also gives the local estimate
  #[#set math.equation(numbering: n => "(6.5)")
   $ \| H \| \( O \) lt.eq liminf_(N arrow.r oo) integral_O \| nabla G_N \| thin #h(-0.16667em) upright(d) x #h(2em) \( O subset bb(R)^2 upright(" open") \) . $ <eq:local-lsc>]
  These conclusions control total variation. We next show that $H$ is absolutely continuous.
  Lower-radius Lipschitz truncations appear in Hajłasz and Malý #cite(label("HajlaszMaly2010")) Lemma 8 and Kurka #cite(label("Kurka2015")) Lemma 7.1; local/nonlocal splitting with subtraction of the input mean appears in Saari #cite(label("Saari2019")) Section 3.1. Here the signed band estimate and Poincaré’s inequality make the localization cost depend only on the nearby input gradient. We give that argument in full.
  ===== 6.2 Small and large radii near a null set. <small-and-large-radii-near-a-null-set.>
  Fix a compact Lebesgue-null set $K$. The assertion is immediate if $K$ is empty, so assume it is nonempty. Fix also a dyadic $t = 2^(- L)$ with $L gt.eq 1$, and an open set
  $ K subset O subset { x : "dist" \( x \, K \) < t } . $
  For every $N gt.eq L$, splitting the band at $t$ gives
  $ G_N = max { S_(2^(- N) \, t) g \, med S_(t \, 2^N) g } . $
  Both functions are Lipschitz. The maximum rule, including the equality set, in Lemma 19 gives
  $ \| nabla G_N \| lt.eq \| nabla S_(2^(- N) \, t) g \| + \| nabla S_(t \, 2^N) g \| quad upright("a.e.") $
  For the second term, (6.1) bounds its integral over $O$ by
  #[#set math.equation(numbering: n => "(6.6)")
   $ integral_O \| nabla S_(t \, 2^N) g \| lt.eq frac(\| O \|, pi t^2) V_g . $ <eq:large-radius-null-cost>]
  For the first term, partition the plane into half-open grid squares $Q$ of side $t$, and retain those meeting $O$. There are finitely many, since $O$ is contained in a bounded neighborhood of $K$. Choose the cutoff of Lemma 21, equal to one on $3 Q$ and supported in $5 Q$, and put
  $ c_Q = frac(1, \| 5 Q \|) integral_(5 Q) g \, #h(2em) g_Q = chi_Q \( g - c_Q \) . $
  The product rule and Poincaré’s inequality give
  #[#set math.equation(numbering: n => "(6.7)")
   $ parallel nabla g_Q parallel_1 lt.eq C integral_(5 Q) \| nabla g \| . $ <eq:localized-input>]
  Every disk of radius $s lt.eq t$ centered in $Q$ lies in $3 Q$. Consequently
  $ A_s g_Q \( x \) = A_s g \( x \) - c_Q quad \( x in Q \, 0 < s lt.eq t \) \, #h(2em) S_(2^(- N) \, t) g_Q = S_(2^(- N) \, t) g - c_Q quad upright("on ") Q . $
  The two envelopes have the same gradient almost everywhere on $Q$. Since $g_Q$ can have either sign, we use precisely the signed form of Lemma 16. The ratio of its endpoints is $2^(N - L)$, including one when $N = L$. It follows that
  $ integral_O \| nabla S_(2^(- N) \, t) g \| & lt.eq sum_(Q ∩ O eq.not diameter) integral_Q \| nabla S_(2^(- N) \, t) g_Q \|\
 & lt.eq C sum_(Q ∩ O eq.not diameter) parallel nabla g_Q parallel_1 lt.eq C integral_({ "dist" \( x \, K \) < 6 t }) \| nabla g \( x \) \| thin #h(-0.16667em) upright(d) x . $
  The last step uses the bounded overlap of the squares $5 Q$ and their containment in the $6 t$-neighborhood of $K$, both established in Lemma 21. Grid boundaries are null and do not affect these gradient integrals.
  Combining this estimate with (6.6) and then (6.5) yields
  #[#set math.equation(numbering: n => "(6.8)")
   $ \| H \| \( O \) lt.eq C integral_({ "dist" \( x \, K \) < 6 t }) \| nabla g \( x \) \| thin #h(-0.16667em) upright(d) x + C t^(- 2) \| O \| V_g . $ <eq:null-localization>]
  The constants are independent of $N$, $O$, and $t$.
  ===== 6.3 Removing the singular part. <removing-the-singular-part.>
  For the fixed $t$, compactness and Lebesgue nullity of $K$ allow the open neighborhood $O$ above to have arbitrarily small area. Since $\| H \| \( K \) lt.eq \| H \| \( O \)$, (6.8) gives
  $ \| H \| \( K \) lt.eq C integral_({ "dist" \( x \, K \) < 6 t }) \| nabla g \( x \) \| thin #h(-0.16667em) upright(d) x . $
  Only now let $t$ decrease to zero through dyadic values. The neighborhoods decrease to the compact null set $K$, and $\| nabla g \|$ is integrable; the right side tends to zero. Thus $\| H \| \( K \) = 0$ for every compact Lebesgue-null set. Inner regularity of the finite Radon measure $\| H \|$ implies that it vanishes on every Borel null set, and hence on every Lebesgue-null set by containment in a Borel null set.
  The Radon–Nikodym conclusion of Lemma 22 now gives $H = G thin #h(-0.16667em) upright(d) x$ with $G in L^1 \( bb(R)^2 \; bb(R)^2 \)$ and
  $ integral \| G \| = \| H \| \( bb(R)^2 \) lt.eq C V_g lt.eq C integral \| nabla f \| . $
  For every smooth compactly supported vector field $phi$, the defining identity of $H$ reads $- integral M f thin "div" phi = integral G dot.op phi$. Thus $G$ is the weak gradient of $M f$. Since $M f$ is locally integrable, this proves $M f in W_(upright("loc"))^(1 \, 1)$ and (1.1), with a globally integrable Euclidean gradient. ◻
]

#prodef([Remark 6.2.])[
  The direct absolute-continuity argument uses the signed band estimate, approximation, and square Poincaré localization. After (6.4), one could alternatively apply Lahti and Weigt’s centered regularity theorem #cite(label("LahtiWeigt2025")) Theorem 1.2 to $g = \| f \|$ on $bb(R)^2$. The input is globally integrable and has finite variation, and $M g in B V_(upright("loc"))$ has already been proved. Its input jump and Cantor derivative measures vanish, so the theorem’s additional condition on the Cantor part is vacuous; its conclusion gives local Sobolev regularity. This optional route is used only after the variation bound and supplies no part of the finite-band estimate.
]

#thm([Corollary 6.3.])[
  (Bounded-variation inputs).  #emph[Let $B V \( bb(R)^2 \)$ denote the globally integrable functions whose distributional derivatives have finite total variation. For every real $f in B V \( bb(R)^2 \)$, 
$ M f in L^2 \( bb(R)^2 \) ∩ B V_(upright("loc")) \( bb(R)^2 \) \, #h(2em) \| D \( M f \) \| \( bb(R)^2 \) lt.eq C \| D f \| \( bb(R)^2 \) \, $

 with the constant from Theorem 1. Writing $P \( F \) = \| D upright(bold(1))_F \| \( bb(R)^2 \)$ for perimeter, every measurable set $E$ with $\| E \| < oo$ and $P \( E \) < oo$ satisfies 
$ integral_0^1 P \( { M upright(bold(1))_E > t } \) thin #h(-0.16667em) upright(d) t lt.eq C P \( E \) . $

 These superlevel sets have finite measure for every $t > 0$ and finite perimeter for almost every $t > 0$.]
] <cor:bv-input>

#proof[
  Let $f_epsilon = f * rho_epsilon$ for a smooth nonnegative compactly supported probability approximate identity. Then $f_epsilon in W^(1 \, 1) \( bb(R)^2 \)$, $f_epsilon arrow.r f$ in $L^1$, and
  $ nabla f_epsilon = \( D f \) * rho_epsilon \, #h(2em) parallel nabla f_epsilon parallel_1 lt.eq \| D f \| \( bb(R)^2 \) . $
  The variation formula and lower semicontinuity show that these gradient norms tend to $\| D f \| \( bb(R)^2 \)$, so the approximation is strict in $B V$. Lemma 20 bounds $parallel f_epsilon parallel_2$ uniformly; an almost-everywhere convergent subsequence and Fatou’s lemma give $f in L^2$. The convolution approximate identity therefore also converges to $f$ in $L^2$. The pointwise inequality $\| M f_epsilon - M f \| lt.eq M \( f_epsilon - f \)$ and the strong $L^2$ maximal inequality yield $M f in L^2$ and $M f_epsilon arrow.r M f$ in $L^2$, hence locally in $L^1$. Theorem 1 bounds the global weak-gradient norm of $M f_epsilon$ by $C \| D f \| \( bb(R)^2 \)$. Lemma 22 now gives the asserted finite derivative measure and local $B V$ regularity.
  For $u = M upright(bold(1))_E$ we have $0 lt.eq u lt.eq 1$. Apply the $B V$ coarea formula #cite(label("EvansGariepy2015")) on $B \( 0 \, R \)$ and then use monotone exhaustion as $R arrow.r oo$ to obtain
  $ integral_0^1 P \( { u > t } \) thin #h(-0.16667em) upright(d) t = \| D u \| \( bb(R)^2 \) lt.eq C P \( E \) . $
  Also $\| { u > t } \| lt.eq t^(- 2) parallel u parallel_2^2 < oo$ for every $t > 0$. ◻
]

This conclusion does not assert global integrability of $M f$ or absolute continuity of its derivative measure for arbitrary $B V$ input.

== 7 Analytic facts used in the limiting argument <app:analytic-tools>

We record the approximation, localization, and measure arguments used in Section 6. All gradient norms are Euclidean. The Sobolev space is inhomogeneous: the function and its distributional first derivatives belong to $L^1 \( bb(R)^2 \)$. General Sobolev calculus is treated in #cite(label("EvansGariepy2015")); the exact chain, product, and Lipschitz facts used here also appear in #cite(label("Hunter2014")) Chapter 3, Propositions 3.21–3.22 and Theorems 3.38–3.39. We give the needed calculations, including the variation formula that preserves the Euclidean norm.

=== 7.1 Approximation, translations, and equality sets <approximation-translations-and-equality-sets>

#thm([Lemma 7.1.])[
  #emph[For real $u in W^(1 \, 1) \( bb(R)^2 \)$ there are real $u_j in C_c^oo \( bb(R)^2 \)$ converging to $u$ in $W^(1 \, 1)$, and 
#[#set math.equation(numbering: n => "(7.1)")
 $ parallel u \( dot.op + z \) - u parallel_1 lt.eq \| z \| thin parallel nabla u parallel_1 #h(2em) \( z in bb(R)^2 \) . $ <eq:appendix-translation>]

 Moreover $\| u \| in W^(1 \, 1) \( bb(R)^2 \)$ with $\| nabla \| u \| \| lt.eq \| nabla u \|$ almost everywhere. If $chi$ is smooth and compactly supported, then $chi u in W^(1 \, 1)$ and $nabla \( chi u \) = chi nabla u + u nabla chi$. For locally Lipschitz real functions $v \, w$, their maximum is locally Lipschitz and satisfies, almost everywhere, 
#[#set math.equation(numbering: n => "(7.2)")
 $ nabla max \( v \, w \) = cases(delim: "{", nabla v \, & v > w \,, nabla w \, & w > v \,, nabla v = nabla w \, & v = w .) $ <eq:appendix-maximum>]

 Products of locally Lipschitz functions satisfy the weak product rule. Their weak derivatives agree almost everywhere with their classical derivatives.]
] <lem:appendix-sobolev-calculus>

#proof[
  The smooth-cutoff product rule follows directly by testing the distributional derivative of $u$ against $chi phi$. Choose $chi_R$ equal to one on $B \( 0 \, R \)$, zero outside $B \( 0 \, 2 R \)$, with $0 lt.eq chi_R lt.eq 1$ and $\| nabla chi_R \| lt.eq C \/ R$. Then
  $ parallel chi_R u - u parallel_1 arrow.r 0 \, #h(2em) parallel nabla \( chi_R u \) - nabla u parallel_1 lt.eq integral_(\| x \| > R) \| nabla u \| + C / R parallel u parallel_1 arrow.r 0 . $
  Convolving $chi_R u$ with a smooth compactly supported approximate identity commutes with its distributional derivatives. The convolutions converge in $L^1$, for both the function and its gradient. This last fact follows from continuity of translations in $L^1$ and the approximate-identity formula; translation continuity follows first for continuous compactly supported functions by uniform continuity, and then for $L^1$ functions by approximation. A diagonal choice of $R$ and convolution radius proves the asserted $C_c^oo$ density.
  For each smooth approximant, the fundamental theorem of calculus along a segment gives
  $ \| u_j \( x + z \) - u_j \( x \) \| lt.eq \| z \| integral_0^1 \| nabla u_j \( x + s z \) \| thin #h(-0.16667em) upright(d) s . $
  Integrating in $x$ and using translation invariance proves the translation bound for $u_j$. Convergence in $W^(1 \, 1)$ proves (7.1) for $u$.
  Here is also a direct smooth-chain argument for the absolute value. For a continuously differentiable function $F$ with bounded derivative and $F \( 0 \) = 0$, smooth approximation gives
  $ nabla F \( u \) = F' \( u \) nabla u . $
  Indeed $F \( u_j \) arrow.r F \( u \)$ in $L^1$. Along a subsequence $u_j arrow.r u$ almost everywhere, and
  $ F' \( u_j \) nabla u_j - F' \( u \) nabla u = F' \( u_j \) \( nabla u_j - nabla u \) + \( F' \( u_j \) - F' \( u \) \) nabla u $
  tends to zero in $L^1$, by boundedness and dominated convergence. Passing the smooth identity to distributions proves the formula. Apply it to $F_epsilon \( s \) = sqrt(s^2 + epsilon^2) - epsilon$. These functions satisfy $0 lt.eq F_epsilon \( u \) lt.eq \| u \|$ and converge to $\| u \|$ in $L^1$. Their derivatives converge pointwise to $"sgn" \( u \)$, with value zero at $u = 0$, and are bounded by one. Passing to the limit gives $nabla \| u \| = "sgn" \( u \) nabla u$ and the claimed norm inequality.
  A locally Lipschitz function restricts to a Lipschitz, hence absolutely continuous, function on each coordinate line in a rectangle. One-dimensional integration by parts and Fubini’s theorem give its weak partial derivatives. Rademacher’s theorem identifies these with its classical gradient almost everywhere #cite(label("Hunter2014")) Chapter 3, Theorems 3.38–3.39. The usual product rule at joint differentiability points, or equivalently the one-dimensional rule on those lines, proves the weak Lipschitz product rule.
  For the equality set in (7.2), put $a = v - w$. At almost every point of ${ a = 0 }$ the set has density one and $a$ is differentiable. Its derivative there is zero: a nonzero derivative would give a cone of fixed positive relative area on which $a$ is nonzero in every sufficiently small ball, contrary to density one. Thus $nabla v = nabla w$ almost everywhere on their equality set. At such a point, $a \( x + h \) = o \( \| h \| \)$ implies $a_(+) \( x + h \) = o \( \| h \| \)$, so $a_(+)$ also has derivative zero. On the open sets $a > 0$ and $a < 0$, its gradient is respectively $nabla a$ and zero. Since $max \( v \, w \) = w + a_(+)$, this proves (7.2). ◻
]

#thm([Lemma 7.2.])[
  (Planar Sobolev embedding).  #emph[For every real $u in W^(1 \, 1) \( bb(R)^2 \)$, 
$ parallel u parallel_2^2 lt.eq parallel partial_1 u parallel_1 parallel partial_2 u parallel_1 \, #h(2em) upright("in particular ") parallel u parallel_2 lt.eq parallel nabla u parallel_1 . $

]
] <lem:appendix-planar-embedding>

#proof[
  For $u in C_c^oo$, set
  $ a \( y \) = integral_(bb(R)) \| partial_1 u \( x \, y \) \| thin #h(-0.16667em) upright(d) x \, #h(2em) b \( x \) = integral_(bb(R)) \| partial_2 u \( x \, y \) \| thin #h(-0.16667em) upright(d) y . $
  The fundamental theorem of calculus on the two coordinate lines gives $\| u \( x \, y \) \| lt.eq a \( y \)$ and $\| u \( x \, y \) \| lt.eq b \( x \)$. Thus $\| u \( x \, y \) \|^2 lt.eq a \( y \) b \( x \)$; integrating proves the first inequality. For general $u$, approximate as in Lemma 19. Applying the smooth inequality to differences shows that the approximants are Cauchy in $L^2$. Their $L^2$ limit agrees almost everywhere with their $L^1$ limit $u$, by passage to a common almost-everywhere convergent subsequence. Pass to the limit in the inequality. Each coordinate derivative has $L^1$ norm at most $parallel nabla u parallel_1$, giving the last assertion. ◻
]

=== 7.2 Square localization <square-localization>

#thm([Lemma 7.3.])[
  #emph[For a square $Q$ of side length $t > 0$ and $u in W^(1 \, 1) \( bb(R)^2 \)$, write $u_Q = \| Q \|^(- 1) integral_Q u$. Then 
#[#set math.equation(numbering: n => "(7.3)")
 $ integral_Q \| u - u_Q \| lt.eq C t integral_Q \| nabla u \| . $ <eq:appendix-poincare>]

 For every grid square $Q$ of side $t$, there is a smooth cutoff $chi_Q$ equal to one on the closed concentric dilation $3 Q$, supported in the interior of $5 Q$, with $0 lt.eq chi_Q lt.eq 1$ and $\| nabla chi_Q \| lt.eq C \/ t$. With $c_Q = u_(5 Q)$, it satisfies 
#[#set math.equation(numbering: n => "(7.4)")
 $ parallel nabla \[ chi_Q \( u - c_Q \) \] parallel_1 lt.eq C integral_(5 Q) \| nabla u \| . $ <eq:appendix-localization>]

 Every disk of radius at most $t$ centered in $Q$ lies in $3 Q$. The dilations $5 Q$ of grid squares have bounded overlap. If the squares under consideration meet $O subset { x : "dist" \( x \, K \) < t }$, all their dilations $5 Q$ lie in ${ x : "dist" \( x \, K \) < 6 t }$. Constants are independent of $Q \, t \, u \, O \, K$.]
] <lem:appendix-square>

#proof[
  By rotation and translation it suffices to take $Q = \( 0 \, t \)^2$. First suppose $u$ is smooth. Jensen’s inequality gives
  $ integral_Q \| u - u_Q \| lt.eq t^(- 2) integral_Q integral_Q \| u \( x \) - u \( y \) \| thin #h(-0.16667em) upright(d) y thin #h(-0.16667em) upright(d) x . $
  Join $x = \( x_1 \, x_2 \)$ to $\( y_1 \, x_2 \)$ and then to $y = \( y_1 \, y_2 \)$. For the first segment, with $x_2$ fixed, integrating its derivative bound in $x_1 \, y_1$ gives at most
  $ t^2 integral_0^t \| partial_1 u \( s \, x_2 \) \| thin #h(-0.16667em) upright(d) s . $
  Indeed each $s$ lies between $x_1$ and $y_1$ for a set of pairs of area at most $t^2$. Integration in $x_2$ and $y_2$ therefore gives $t^3 integral_Q \| partial_1 u \|$. The second segment similarly costs at most $t^3 integral_Q \| partial_2 u \|$. After division by $t^2$, the bound $\| partial_1 u \| + \| partial_2 u \| lt.eq sqrt(2) \| nabla u \|$ proves (7.3). Global smooth approximation proves it for the stated Sobolev input, since both the functions and their means converge on $Q$.
  Rescale a fixed smooth cutoff to obtain $chi_Q$. The product rule and (7.3), now on $5 Q$, yield
  $ parallel nabla \[ chi_Q \( u - c_Q \) \] parallel_1 lt.eq integral_(5 Q) \| nabla u \| + C / t integral_(5 Q) \| u - c_Q \| lt.eq C integral_(5 Q) \| nabla u \| . $
  In each coordinate the disk containment follows from $t \/ 2 + t = 3 t \/ 2$. A point lies in only a fixed number of the dilated squares, since their centers form a grid of spacing $t$. Finally, if $x in Q ∩ O$ and $y in 5 Q$, then $\| y - x \| lt.eq 3 sqrt(2) t$. Hence $"dist" \( y \, K \) < \( 1 + 3 sqrt(2) \) t < 6 t$, as claimed. ◻
]

=== 7.3 Vector variation and local lower semicontinuity <vector-variation-and-local-lower-semicontinuity>

For $u in L_(upright("loc"))^1 \( bb(R)^2 \)$ and open $O subset bb(R)^2$, define its distributional variation on $O$ by

#[#set math.equation(numbering: n => "(7.5)")
 $ cal(V) \( u \; O \) = sup {- integral u thin "div" phi : phi in C_c^1 \( O \; bb(R)^2 \) \, med \| phi \( x \) \| lt.eq 1} . $ <eq:appendix-variation>]

The test-field norm is Euclidean. The class is closed under negation, so the same supremum results if the tested integral is replaced by its absolute value.

#thm([Lemma 7.4.])[
  #emph[Suppose $u_j in W_(upright("loc"))^(1 \, 1) \( bb(R)^2 \)$ converge locally in $L^1$ to $u$, and $sup_j integral_(bb(R)^2) \| nabla u_j \| lt.eq M < oo$. Then the distributional gradient of $u$ is a finite vector Radon measure $H$, with 
#[#set math.equation(numbering: n => "(7.6)")
 $ \| H \| \( bb(R)^2 \) lt.eq M \, #h(2em) \| H \| \( O \) = cal(V) \( u \; O \) lt.eq liminf_j integral_O \| nabla u_j \| quad upright("for every open ") O . $ <eq:appendix-local-lsc>]

 If $\| H \| \( K \) = 0$ for every compact Lebesgue-null set $K$, then $H = G thin #h(-0.16667em) upright(d) x$ for some $G in L^1 \( bb(R)^2 \; bb(R)^2 \)$ and $parallel G parallel_1 = \| H \| \( bb(R)^2 \)$. In that case $u in W_(upright("loc"))^(1 \, 1)$, with weak gradient $G$.]
] <lem:appendix-vector-measure>

#proof[
  For every smooth compactly supported vector field $phi$, local $L^1$ convergence implies
  $ lr(|- integral u thin "div" phi|) = lim_j lr(|integral nabla u_j dot.op phi|) lt.eq M parallel phi parallel_oo . $
  Smooth compactly supported fields are uniformly dense in $C_0 \( bb(R)^2 \; bb(R)^2 \)$, the continuous fields vanishing at infinity: first cut off outside a large compact set and then convolve. Thus the functional extends uniquely to this space with norm at most $M$. Apply the scalar Riesz representation theorem to its two coordinates to obtain finite signed Radon measures $H_1 \, H_2$. Their vector $H = \( H_1 \, H_2 \)$ represents the functional and therefore the distributional gradient of $u$. The Riesz and Radon–Nikodym theorems used here are recorded in #cite(label("Simon2018")) Chapter 1, Theorem 5.14 and Equation (4.17).
  We spell out why the representation retains the Euclidean total variation rather than the sum of coordinate variations. Put $lambda = \| H_1 \| + \| H_2 \|$ and write $H = q lambda$ using the scalar Radon–Nikodym theorem. The coordinate densities of $q$ have absolute value at most one. For a Borel set $E$, the definition of vector total variation by finite Borel partitions gives
  $ \| H \| \( E \) = integral_E \| q \| thin #h(-0.16667em) upright(d) lambda . $
  The upper bound follows from the triangle inequality on each part. For the reverse bound, partition the bounded range of $q$ into finitely many sets of diameter at most $epsilon$, and choose a vector $q_s$ in each. On the corresponding partition $E_s$ of $E$,
  $ sum_s \| H \( E_s \) \| gt.eq sum_s \| q_s \| lambda \( E_s \) - epsilon lambda \( E \) gt.eq integral_E \| q \| thin #h(-0.16667em) upright(d) lambda - 2 epsilon lambda \( E \) . $
  Let $epsilon arrow.b 0$. Set $mu = \| H \|$ and $sigma = q \/ \| q \|$ where $q eq.not 0$, with value zero elsewhere; then $H = sigma mu$ and $\| sigma \| = 1$ almost everywhere for $mu$.
  For every open $O$, this representation gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ mu \( O \) = sup {integral phi dot.op #h(-0.16667em) upright(d) H : phi in C_c \( O \; bb(R)^2 \) \, med \| phi \| lt.eq 1} . $ <eq:appendix-continuous-variation>]
  One inequality is immediate. For the other, approximate $sigma$ on $O$ in $L^1 \( mu \)$ by simple vector functions with values in the closed unit ball. Inner regularity permits replacement of their finitely many disjoint measurable sets by disjoint compact subsets of $O$, losing arbitrarily little $mu$-mass. Choose continuous cutoff functions equal to one on these compact sets, with mutually disjoint compact supports in $O$, and multiply by the corresponding vector values. Their sum has norm at most one and approximates $sigma$ in $L^1 \( mu \)$, with arbitrarily small error. This proves the reverse inequality. These are the usual polar and open-set variation formulas; see also #cite(label("Simon2018")) Chapter 2, Equations (2.1)–(2.4).
  Each continuous compactly supported test field in (7.7) can be extended by zero and convolved with a nonnegative smooth probability kernel of sufficiently small support. The resulting smooth fields remain supported in $O$, have norm at most one, and converge uniformly. Consequently the same supremum is obtained with $C_c^1$ test fields. The distributional identity identifies it with $cal(V) \( u \; O \)$ in (7.5). Taking $O = bb(R)^2$ and using the functional norm bound gives $\| H \| \( bb(R)^2 \) lt.eq M$.
  For each fixed admissible field supported in $O$,
  $ - integral u thin "div" phi = lim_j integral nabla u_j dot.op phi lt.eq liminf_j integral_O \| nabla u_j \| . $
  Taking the supremum proves the local lower semicontinuity in (7.6). This argument requires only local integrability of $u$.
  Finally, if $mu \( K \) = 0$ for all compact Lebesgue-null $K$, inner regularity implies $mu \( E \) = 0$ for every Borel null set $E$. Every Lebesgue-null set is contained in a Borel null set, so $mu$ is absolutely continuous with respect to Lebesgue measure. Write $mu = h thin #h(-0.16667em) upright(d) x$ by the positive Radon–Nikodym theorem, where $h gt.eq 0$ and $integral h = mu \( bb(R)^2 \)$. Set $G = h sigma$, with value zero where $h = 0$. Then $H = G thin #h(-0.16667em) upright(d) x$ and $\| G \| = h$ almost everywhere. Thus $parallel G parallel_1 = \| H \| \( bb(R)^2 \)$, and the defining distributional identity for $H$ is precisely the weak-gradient identity for $G$. The needed inner regularity is, for example, #cite(label("Simon2018")) Chapter 1, Lemma 5.7. ◻
]

In Section 6, this lemma first yields a finite derivative measure from the expanding bands. The signed cutoff argument then proves that it vanishes on compact null sets; the lemma’s final assertion identifies the resulting weak gradient.


#bibliography("refs.bib", style: "ieee", title: [References])
