#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Endpoint convergence for the planar Schrödinger equation]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For $f in L^2 \( bb(R)^2 \)$ we use the Fourier transform

$ hat(f) \( xi \) = integral_(bb(R)^2) e^(- i x dot.op xi) f \( x \) thin d x \, #h(2em) parallel f parallel_(H^(1 \/ 3))^2 = \( 2 pi \)^(- 2) integral_(bb(R)^2) \( 1 + \| xi \|^2 \)^(1 \/ 3) \| hat(f) \( xi \) \|^2 thin d xi . $

The first formula is initially defined on integrable functions and then extended by continuity to $L^2$. For $a > 0$ put

#[#set math.equation(numbering: n => "(1.1)")
 $ U_a f \( x \, t \) = \( 2 pi \)^(- 2) integral_(bb(R)^2) e^(i x dot.op xi - i t \| xi \|^2 - a \| xi \|^2) hat(f) \( xi \) thin d xi . $ <eq:intro-abel>]

This integral is absolutely convergent by Cauchy–Schwarz. At a Lebesgue point of $f$, write

$ f^(*) \( x \) = lim_(r arrow.b 0) frac(1, pi r^2) integral_(\| y - x \| < r) f \( y \) thin d y . $

Our main result includes the order of limits in the definition of the evolution.

#thm([Theorem 1.1.])[
  (Planar endpoint convergence).  #emph[For every $f in H^(1 \/ 3) \( bb(R)^2 \)$ there is a set $E_f subset bb(R)^2$ of full Lebesgue measure such that, for each $x in E_f$, the finite limit 
$ u_f \( x \, t \) = lim_(a arrow.b 0) U_a f \( x \, t \) $

 exists for every real $0 < t < 1$, and 
$ lim_(t arrow.b 0) u_f \( x \, t \) = f^(*) \( x \) . $

 In fact $u_f \( x \, dot.op \)$ extends continuously to $\[ 0 \, 1 \)$ with value $f^(*) \( x \)$ at zero, and the Gaussian limit is uniform over $0 < t < 1$.]
] <thm:main>

=== 1.1 History and significance <history-and-significance>

Carleson [7] introduced the pointwise convergence problem and proved its one-dimensional positive result at regularity $s = 1 \/ 4$. Dahlberg and Kenig [9] showed that this threshold is necessary. Sjölin [23] and Vega [26] independently obtained convergence for $s > 1 \/ 2$ in higher dimensions. In the plane, Bourgain and Moyua–Vargas–Vega [2,20] developed the connection with Fourier restriction. The bilinear approach of Tao and Vargas [25] gave $s > 15 \/ 32$; Tao’s sharp bilinear restriction theorem [24] improved this to $s > 2 \/ 5$, and Lee [18] obtained $s > 3 \/ 8$. In dimensions $n gt.eq 3$, Bourgain [3] obtained the sufficient range $s > 1 \/ 2 - 1 \/ \( 4 n \)$.

Bourgain’s later counterexample [4] Proposition 1 forces $s gt.eq n \/ \[ 2 \( n + 1 \) \]$ when $n gt.eq 2$, but does not rule out equality. Du, Guth and Li [11] Theorems 1.1–1.2 proved planar convergence and a local $L^3$ maximal estimate for $s > 1 \/ 3$. Their proof combined polynomial partitioning with wave packets and refined Strichartz estimates, using $ell^2$ decoupling to control packets tangent to the partitioning surface. Du, Guth, Li and Zhang [12] Theorems 1.1 and 4.2 then obtained higher-dimensional convergence for $s > \( n + 1 \) \/ \[ 2 \( n + 2 \) \]$ and developed multilinear refined Strichartz estimates. Du and Zhang [13] Theorem 1.1 established convergence for $s > n \/ \[ 2 \( n + 1 \) \]$ when $n gt.eq 3$. A recent Bessel-potential extension still states its positive $p = 2$ range with the strict inequality $s > n \/ \[ 2 \( n + 1 \) \]$ [21] Theorems 1.3–1.4.

The choice of pointwise representative also has a history: Sjögren and Sjölin [22] Theorem 2 constructed, for $s > 1 \/ 2$, representatives continuous on the entire time line for almost every spatial point, using spatial or space-time averages.

Theorem 1 resolves positively the planar Sobolev endpoint of Carleson’s convergence problem: it supplies the equality case $s = 1 \/ 3$, with the order of limits and the all-real-times representative specified above. Its maximal estimate has local $L^1$ output. The stronger question of an endpoint local $L^3$ maximal estimate is not asserted here.

=== 1.2 Three ingredients of the proof <three-ingredients-of-the-proof>

The main analytic conclusion is a local maximal estimate at the exact Sobolev exponent. Write $S \( t \) f = e^(i t Delta) f$ for the $L^2$ evolution with Fourier multiplier $e^(- i t \| xi \|^2)$. For bounded-frequency data, the pointwise maximal estimate takes the form

#[#set math.equation(numbering: n => "(1.2)")
 $ integral_(B \( x_0 \, 1 \)) sup_(0 lt.eq t < 1) \| S \( t \) f \( x \) \| thin d x lt.eq C parallel f parallel_(H^(1 \/ 3)) \, $ <eq:intro-maximal>]

with a constant independent of the center $x_0$ and the frequency bound. Theorem 52 proves this estimate. The final section then constructs the representative in Theorem 1; it does not infer an all-times assertion by intersecting time-dependent exceptional sets.

We work first at unit frequency, with packets of spatial width $L$ and propagation time $L^2$. A measure satisfying a two-dimensional ball bound models the spatial area on a measurable time graph. The proof has three main components.

===== 1.2.1 A transverse power saving. <a-transverse-power-saving.>

Multilinear restriction [1] and the refined fractal restriction estimate of Du and Zhang [13] Theorem 1.6 reduce a hypothetical saturated transverse configuration to weighted incidences between points and tubes. Conditional information across scales has additive profiles whose extremal relations come from three transverse directions. A robust projection theorem [17] Theorem 1 restricts the derivatives of these profiles to zero and one. A further argument rules out arbitrarily many alternations; polynomial partitioning [15] Theorem 4.1 then excludes the remaining jump. This gives a fixed power saving, which is propagated to the sparse packet estimate in Proposition 25.

===== 1.2.2 A bilinear estimate for smooth packet arrays. <a-bilinear-estimate-for-smooth-packet-arrays.>

Theorem 28 treats packets with general smooth profiles and separated frequency groups. Positive masks remove large pieces of a tight frequency frame, charging them to the lost energy. A quartic potential, together with the curvature identity for the parabola, controls changes in the spatial smoothing scale. The resulting estimate is uniform in the number of scales. This uniformity is needed for the long, nearly flat frequency configurations that arise in the proof of Theorem 41.

===== 1.2.3 Square summation at the endpoint. <square-summation-at-the-endpoint.>

Theorem 41 yields a short-time weak estimate with some fixed output exponent $p > 2$, with no growing frequency loss. To combine frequencies, we linearize all of them on the same time graph. A binary time tree separates heavier children from their lighter siblings. Spatial localization supplies decay in the relative depth of this tree, while $p > 2$ supplies a positive convexity deficit that sums powers of the lighter-child masses across frequency scales. Together these estimates retain the Sobolev square norm and prove (1.2).

The packet and measure formulations allow arbitrary bounded phase-space counts and sufficiently smooth compact profiles. In particular, the bilinear estimate applies to the composite packets created by localization; no exact evolution equation is imposed on those profiles.

=== 1.3 Organization and dependencies <organization-and-dependencies>

Section 2 fixes the packet conventions and the restriction estimates used with small losses. The transverse and sparse arguments follow in Sections 3 and 4. The independent frame estimate is proved before its applications, in Section 5. Sections 6 and 7 provide the flat-frequency and geometric reductions, and Section 8 proves the uniform dyadic distribution estimate. Section 9 performs the endpoint summation and proves Theorem 1. Figure 1 records the logical order. The distinction between a fixed power saving and an estimate uniform in the packet scale is essential throughout.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.182cm, height: 1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Transverse power saving]]])])
  content((0, -1.9), [#box(width: 4.182cm, height: 1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Sparse packet estimate]]])])
  content((5.482, 0), [#box(width: 4.182cm, height: 1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Uniform bilinear frame estimate]]])])
  content((5.482, -1.9), [#box(width: 4.182cm, height: 1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Flat-frequency estimates]]])])
  content((10.96, -1.9), [#box(width: 4.182cm, height: 1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Rich-tube geometry]]])])
  content((5.482, -4.3), [#box(width: 4.182cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Uniform dyadic#linebreak()distribution bound]]])])
  content((5.482, -6.2), [#box(width: 4.182cm, height: 1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Endpoint square summation]]])])
  content((5.482, -8.1), [#box(width: 4.182cm, height: 1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[Gaussian limit at all times]]])])
  line((0, -0.5), (0, -1.4), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((5.482, -0.5), (5.482, -1.4), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((7.573, 0), (8.173, 0), (8.173, -4.05), (7.573, -4.05), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((0, -2.4), (0, -4.3), (3.391, -4.3), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((5.482, -2.4), (5.482, -3.8), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((10.96, -2.4), (10.96, -4.3), (7.573, -4.3), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((5.482, -4.8), (5.482, -5.7), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((5.482, -6.7), (5.482, -7.6), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: Dependencies of the proof. Small scale losses are allowed in the transverse and sparse arguments; the frame and dyadic distribution estimates must be uniform in the packet scale. ],
) <fig:dependencies>

== 2 Packets, localization, and fractal estimates <sec:preliminaries>

We first fix the packet conventions and the analytic estimates used in the transverse argument. There are two packet classes: compactly supported smooth atoms, which are convenient for the later geometric arguments, and exact Schrödinger packets, which permit the use of restriction estimates. The latter have rapidly decreasing spatial tails. Keeping these two classes distinct will also make the localization errors explicit.

=== 2.1 Conventions and the compact atom class <conventions-and-the-compact-atom-class>

For frequency data $v in L^2 \( bb(R)^2 \)$ supported in a fixed bounded set, put

#[#set math.equation(numbering: n => "(2.1)")
 $ E v \( x \, t \) = integral_(bb(R)^2) e^(i \( x dot.op xi - t \| xi \|^2 \)) v \( xi \) thin d xi . $ <eq:prelim-extension>]

Thus extension input norms are frequency-space $L^2$ norms; the Fourier normalization in Section 1 differs only by the fixed factor $\( 2 pi \)^(- 2)$. In particular, with that Fourier convention, $parallel f parallel_2^2 = \( 2 pi \)^(- 2) parallel hat(f) parallel_2^2$. All frequency sets below lie in fixed bounded boxes unless another scale is specified. The direction associated with $xi$ is the line parallel to $\( 2 xi \, 1 \)$, or its unit representative with positive last coordinate. On a fixed bounded frequency set, distances between frequencies and between these unit representatives are comparable.

Unless stated otherwise, all measures are nonnegative Borel measures on space-time $bb(R)^3$. A ball bound is required for balls with arbitrary centers. Its normalizing parameter may be assumed positive, since the zero case is immediate. Lattice partitions are half-open; a supremum on a cell may be taken on its closure. Fixed enlargements, boundedly overlapping grids, and fixed changes of frequency boxes cost constants independent of the large scales and of the number of packets. All distribution thresholds are positive.

An estimate with a free factor $S^epsilon.alt$ is asserted for each fixed $epsilon.alt > 0$, with a constant that may depend on $epsilon.alt$. We can therefore use a smaller exponent to absorb a fixed number of logarithms. On a countersequence, $o \( 1 \)$ denotes a quantity tending to zero; simultaneous statements at countably many fixed parameters are obtained by subsequences and diagonal choices. Parameters reused in different arguments have only their local meaning.

#prodef([Definition 2.1.])[
  (Compact atoms).  Let $L gt.eq 1$, and set $R = L^2$. An atom with label $alpha$ is the field
  #[#set math.equation(numbering: n => "(2.2)")
   $ A_alpha \( x \, t \) = L^(- 1) e^(i \( x dot.op omega_alpha - t \| omega_alpha \|^2 \)) H_alpha (frac(x - b_alpha - 2 omega_alpha t, L) \, t / L^2) . $ <eq:src5>]
  The frequencies $omega_alpha$ lie in a fixed square. The labels obey a joint phase-space bound: every unit ball in $bb(R)^2 times bb(R)^2$ contains at most a fixed number of the pairs
  $ (b_alpha / L \, L omega_alpha) . $
  The profiles $H_alpha \( y \, tau \)$ are supported in a fixed bounded box, and have uniform bounds for sufficiently many derivatives. More precisely, each application requires a finite integer $J$ and fixed bounds $parallel partial^beta H_alpha parallel_oo lt.eq C_beta$ for $\| beta \| lt.eq J$. The integer $J$ is chosen after the fixed parameters of that application; it does not grow with $L$ or with the array cardinality. A packet field is a finite sum $sum_alpha c_alpha A_alpha$, and its coefficient energy is $sum_alpha \| c_alpha \|^2$, without weights.
] <def:prelim-atoms>

The joint phase-space condition does not require bounded multiplicity of frequencies alone. In particular, arbitrarily many spatial translates of one frequency are allowed. Constants in packet estimates may depend on the fixed support, multiplicity, and derivative bounds in Definition 2. Whenever a later estimate permits an arbitrary fixed decay order, sufficiently many of these finitely many derivatives are to be fixed first.

Suppose that $mu$ is restricted to $\| t \| lt.eq C L^2$ and satisfies

#[#set math.equation(numbering: n => "(2.3)")
 $ mu \( B \( z \, r \) \) lt.eq m r^2 #h(2em) \( z in bb(R)^3 \, med r gt.eq 1 \) . $ <eq:prelim-ball-bound>]

The additional sparsity assumption, with the fixed choice $M = 100$, is

#[#set math.equation(numbering: n => "(2.4)")
 $ integral_(bb(R)^3) (1 + frac(\| x - b_alpha - 2 omega_alpha t \|, L))^(- M) thin d mu \( x \, t \) lt.eq frac(m L^3, D) quad upright("for every label used.") $ <eq:src6>]

Other sufficiently large fixed values of $M$ would work. The ball bound alone implies (2.4) with $D = 1$ up to a fixed constant. Indeed, the $rho$-neighborhood of one trajectory on this time slab is covered by $O \( 1 + L^2 \/ rho \)$ balls of radius $C rho$. For $rho = 2^k L$, its mass is at most

$ C m #scale(x: 120%, y: 120%)[\(] 2^k L^3 + 2^(2 k) L^2 #scale(x: 120%, y: 120%)[\)] . $

Summing these bounds against $2^(- M k)$, $k gt.eq 0$, proves the assertion.

The normalization in (2.2) is chosen to be stable under cap rescaling. For labels in a square of side $h^(- 1)$ centered at $v$, where $1 lt.eq h lt.eq L$, set

#[#set math.equation(numbering: n => "(2.5)")
 $ \( x' \, t' \) = (frac(x - 2 v t, h) \, t / h^2) \, #h(2em) L' = L / h \, quad b'_alpha = b_alpha / h \, quad omega'_alpha = h \( omega_alpha - v \) . $ <eq:prelim-atom-rescaling>]

An exact substitution gives

#[#set math.equation(numbering: n => "(2.6)")
 $ A_alpha \( x \, t \) = h^(- 1) e^(i \( x dot.op v - t \| v \|^2 \)) A'_alpha \( x' \, t' \) \, $ <eq:prelim-atom-covariance>]

where $A'_alpha$ has the same profile and the parameters in (2.5). The coefficients are unchanged, and

$ (b'_alpha / L' \, L' omega'_alpha) = (b_alpha / L \, L omega_alpha - L v) \, $

so the phase-space ball counts are unchanged as well. If $mu'$ is the pushforward of $mu$, an inverse image of an $r$-ball is covered by $O \( h \)$ balls of radius $C h r$. Hence $mu'$ has ball parameter $m' = C m h^3$. The integrand in (2.4) is invariant under this change, and $m' \( L' \)^3 = C m L^3$, so its sparsity parameter is preserved up to the allowed fixed constants. On a time slab of length $O \( \( L' \)^2 \)$ centered at zero, a compact packet meets only $O \( 1 \)$ spatial squares of side $\( L' \)^2$. Thus the energies assigned to these squares sum with bounded overlap.

=== 2.2 Exact packets and spatial localization <exact-packets-and-spatial-localization>

The corresponding energy statement for exact fields requires controlling the tails rather than declaring the packets compactly supported.

#thm([Lemma 2.2.])[
  (Exact packet localization).  #emph[Let $s gt.eq 1$, let $v$ have frequency support in a fixed bounded set, and consider $\| t \| lt.eq C s^2$. There is a decomposition $v = sum_(omega \, n) a_(omega \, n) v_(omega \, n)$, with $omega in s^(- 1) bb(Z)^2$ in a fixed bounded enlargement and $b_n = s n$, $n in bb(Z)^2$, such that 
#[#set math.equation(numbering: n => "(2.7)")
 $ sum_(omega \, n) \| a_(omega \, n) \|^2 & lt.eq C parallel v parallel_2^2 \,\
∥sum_(\( omega \, n \) in cal(I)) a_(omega \, n) v_(omega \, n)∥_2^2 & lt.eq C sum_(\( omega \, n \) in cal(I)) \| a_(omega \, n) \|^2 quad upright("for every subfamily ") cal(I) \,\
\| E v_(omega \, n) \( x \, t \) \| & lt.eq C_N s^(- 1) (1 + frac(\| x - b_n - 2 t omega \|, s))^(- N) quad \( N gt.eq 1 \) . $ <eq:prelim-packet-energy>]

 The constants are independent of the number of terms retained. The phase-space label counts are bounded, and every packet has frequency support in an $O \( s^(- 1) \)$ neighborhood of $omega$.]
  #emph[Fix $0 < eta < 1$. On a set $Omega$ in this time slab, retain the packets whose trajectories come within $s^(1 + eta)$ of $Omega$ at the same time. For every $A > 0$, the sum of the omitted packets is bounded pointwise on $Omega$ by $C_(A \, eta) s^(- A) parallel v parallel_2$. For a partition into spatial squares of side $s^2$, extended over the common time slab, the retained data $v_Q$ can consequently be chosen so that 
#[#set math.equation(numbering: n => "(2.8)")
 $ sum_Q parallel v_Q parallel_2^2 lt.eq C parallel v parallel_2^2 \, #h(2em) \| E v - E v_Q \| lt.eq C_(A \, eta) s^(- A) parallel v parallel_2 quad upright("on ") Q times \[ - C s^2 \, C s^2 \] . $ <eq:prelim-box-localization>]

 The same conclusions hold on translated time slabs after modulating the initial datum and writing the trajectories in the recentered time $t - t_0$.]
] <lem:packets>

#proof[
  Take a smooth bounded-overlap partition ${ chi_omega }$ of frequency space at resolution $s^(- 1)$. We can arrange that $chi_omega \( omega + eta \/ s \)$ is supported in $\[ - 1 \, 1 \]^2$. Put
  $ g_omega \( eta \) = s^(- 1) \( chi_omega v \) \( omega + eta \/ s \) . $
  Then $parallel g_omega parallel_2 = parallel chi_omega v parallel_2$. On $\[ - pi \, pi \]^2$, expand $g_omega$ in the orthonormal Fourier basis:
  $ g_omega \( eta \) = sum_(n in bb(Z)^2) a_(omega \, n) \( 2 pi \)^(- 1) e^(- i n dot.op eta) . $
  Choose one smooth cutoff $psi$ supported in $\( - pi \, pi \)^2$ and equal to one on $\[ - 1 \, 1 \]^2$. Multiplying the series by $psi$ leaves $g_omega$ unchanged, and gives the packet data
  $ v_(omega \, n) \( xi \) = frac(s, 2 pi) psi #scale(x: 120%, y: 120%)[\(] s \( xi - omega \) #scale(x: 120%, y: 120%)[\)] e^(- i s n dot.op \( xi - omega \)) . $
  Parseval, followed by the bounded overlap of the frequency partition, gives (2.7). Multiplication by $psi$ is bounded on $L^2$, and its translated frequency supports have bounded overlap. Applying these two facts to any selected Fourier coefficients proves (2.7). This also proves convergence of the decomposition in $L^2$. Since all frequency supports remain in a fixed bounded set, the corresponding extensions converge uniformly in $\( x \, t \)$.
  Changing variables $xi = omega + eta \/ s$ gives
  #[#set math.equation(numbering: n => "(2.9)")
   $ E v_(omega \, n) \( x \, t \) = frac(s^(- 1), 2 pi) e^(i \( x dot.op omega - t \| omega \|^2 \)) integral psi \( eta \) e^(i \( \( x - s n - 2 t omega \) \/ s \) dot.op eta - i \( t \/ s^2 \) \| eta \|^2) thin d eta . $ <eq:prelim-exact-profile>]
  For $\| t \| \/ s^2 lt.eq C$, all derivatives of $psi \( eta \) e^(- i \( t \/ s^2 \) \| eta \|^2)$ are bounded. Repeated integration by parts proves (2.7). In particular the profile in (2.9) is Schwartz in its first argument, uniformly on the prescribed time interval.
  For clarity, the tail bound is uniform even for infinite packet expansions. At a fixed point, there are $O \( s^2 \)$ frequency centers. For each one the normalized spatial labels form a translate of $bb(Z)^2$, and, for $N > 1$,
  $ sum_(n : med \| x - s n - 2 t omega \| > s^(1 + eta)) (1 + frac(\| x - s n - 2 t omega \|, s))^(- 2 N) lt.eq C_N s^(- eta \( 2 N - 2 \)) . $
  The factor $s^(- 2)$ from the squared packet bound cancels the $O \( s^2 \)$ frequency count. Cauchy–Schwarz and (2.7) therefore bound the discarded field by $C_N s^(- eta \( N - 1 \)) parallel v parallel_2$. Choose $N$ sufficiently large in terms of $A$ and $eta$.
  Finally, a bounded-velocity trajectory traverses distance $O \( s^2 \)$ in the time slab. Since $s^(1 + eta) lt.eq s^2$, its padded trajectory meets only $O \( 1 \)$ squares of side $s^2$. Each coefficient is consequently assigned to only $O \( 1 \)$ of the subfamilies defining $v_Q$. Equation (2.7) proves their summed energy bound, and the preceding tail estimate proves the second part of (2.8). To center the time interval at $t_0$, replace $v \( xi \)$ by $e^(- i t_0 \| xi \|^2) v \( xi \)$ before decomposing it. ◻
]

In applications involving polynomially many boxes or a measure of polynomial total mass, the exponent $A$ is chosen large enough that all these tail errors remain smaller than any prescribed negative power. If only a subpower padding is desired on a countersequence, first fix a positive padding exponent for each required estimate and then let it decrease through a diagonal choice. This does not assert a uniform tail constant as $eta arrow.b 0$.

=== 2.3 The refined fractal estimate and unit-cube suprema <the-refined-fractal-estimate-and-unit-cube-suprema>

We use the following specialization of the refined fractal estimate of Du–Zhang. We include the reductions from its uniform occupancy formulation, since both the weights and the suprema will matter later.

#thm([Lemma 2.3.])[
  (Refined fractal estimate).  #emph[Let $S gt.eq 1$. Let $cal(Q)$ be a collection of distinct unit lattice cubes in a ball of radius $C S$ in $bb(R)^3$. Suppose that 
#[#set math.equation(numbering: n => "(2.10)")
 $ \# { Q in cal(Q) : Q ∩ B \( z \, r \) eq.not diameter } lt.eq gamma r^2 quad \( 1 lt.eq r lt.eq C S \) \, #h(2em) \# { Q in cal(Q) : Q ∩ B \( z \, sqrt(S) \) eq.not diameter } lt.eq lambda_0 $ <eq:prelim-fractal-counts>]

 for all centers $z$, with fixed enlargements of the radius range allowed. If $v$ has frequency support in a fixed bounded set, then 
#[#set math.equation(numbering: n => "(2.11)")
 $ integral_(union.big cal(Q)) \| E v \|^2 thin d x thin d t & lt.eq C_epsilon.alt S^epsilon.alt \( gamma lambda_0 S \)^(1 \/ 3) parallel v parallel_2^2 \,\
sum_(Q in cal(Q)) sup_Q \| E v \|^2 & lt.eq C_epsilon.alt S^epsilon.alt \( gamma lambda_0 S \)^(1 \/ 3) parallel v parallel_2^2 . $ <eq:prelim-fractal-integral>]

 These estimates are uniform under translations of the collection of cubes.]
] <lem:fractal>

#proof[
  For unit-ball frequency support, Theorem 1.6 of [13], specialized to spatial dimension $2$ and counting exponent $2$, gives
  $ parallel E v parallel_(L^2 \( X \)) lt.eq C_epsilon.alt S^epsilon.alt gamma^(1 \/ 6) lambda^(1 \/ 6) S^(1 \/ 6) parallel v parallel_2 $
  when every occupied square-root-scale lattice cube contains a comparable number $lambda$ of the unit cubes of $X$. Its time sign is changed by reflection, and its physical-space input norm is converted to the frequency-space norm by Plancherel. A bounded frequency enlargement is reduced to unit frequency by a fixed parabolic dilation and bounded cube coverings. None of these operations changes a large-scale exponent.
  For the asserted upper occupancy version, take an ambient radius comparable to $S$ whose square root is an integer, large enough to contain the given ball. Its square-root grid then contains whole unit lattice cubes. The occupancy of each parent is at most $C lambda_0$, since such a parent is covered by a fixed number of $sqrt(S)$-balls. Sort the parents by their dyadic occupancy $lambda$. Every resulting union retains the counting bound $C gamma r^2$. Apply the quoted theorem to each union, square it, and sum. The geometric sum of $lambda^(1 \/ 3)$ is at most $C lambda_0^(1 \/ 3)$; using a logarithmic bound would also suffice after decreasing the chosen small exponent. Renaming that exponent proves (2.11). Ball centers can be translated at the cost of replacing $v \( xi \)$ by $e^(i \( y dot.op xi - u \| xi \|^2 \)) v \( xi \)$, which preserves its norm and support.
  To obtain suprema, let $F = E v$. Its space-time Fourier transform is supported on a fixed compact portion of the paraboloid. Choose a Schwartz function $rho$ whose Fourier transform is one on that compact set, so that $F = F * rho$. For every unit cube $Q$ and every $z in Q$,
  #[#set math.equation(numbering: n => "(2.12)")
   $ sup_(y in Q) \| F \( y \) \| lt.eq C_N integral_(bb(R)^3) \( 1 + \| w \| \)^(- N) \| F \( z + w \) \| thin d w . $ <eq:prelim-reproducing>]
  Indeed, taking the supremum over $y - z$ in a fixed bounded set in the convolution formula leaves a rapidly decreasing majorant for the kernel. Cauchy–Schwarz with this integrable weight, followed by integration over $z in Q$ and summation in $Q$, gives
  $ sum_(Q in cal(Q)) sup_Q \| F \|^2 lt.eq C_N integral_(bb(R)^3) \( 1 + \| w \| \)^(- N) integral_(union.big cal(Q)) \| E v \( z + w \) \|^2 thin d z thin d w . $
  For each fixed $w = \( y \, u \)$ the inner field is the extension of the modulated datum above. Apply (2.11) on the unchanged domain and integrate the weight. This proves (2.11) without enlarging the ambient scale according to the translation. ◻
]

The same reproducing argument applies separately to factors in a product. For example, if $F_i = E v_i$, $i = 1 \, 2 \, 3$, then

#[#set math.equation(numbering: n => "(2.13)")
 $ sum_(Q in cal(Q)) product_(i = 1)^3 sup_Q \| F_i \| lt.eq C_N integral_(\( bb(R)^3 \)^3) product_(i = 1)^3 \( 1 + \| w_i \| \)^(- N) integral_(union.big cal(Q)) product_(i = 1)^3 \| E v_i \( z + w_i \) \| thin d z thin d w_1 thin d w_2 thin d w_3 . $ <eq:prelim-product-suprema>]

To see this, multiply (2.12) for the three fields, integrate over each unit cube, and use Tonelli. For each fixed triple of shifts, the three exact fields are tested at the same integration point on the same domain. Their data have independent unimodular modulations, which preserve supports, norms, and frequency transversality. This is the version used when applying multilinear restriction to products of cube suprema.

=== 2.4 Weights and cap rescaling <weights-and-cap-rescaling>

#thm([Lemma 2.4.])[
  (Weighted refined estimate).  #emph[Let $nu$ be supported in a ball of radius $C S$, $S gt.eq 1$, and suppose 
#[#set math.equation(numbering: n => "(2.14)")
 $ nu \( B \( z \, r \) \) lt.eq m r^2 quad \( r gt.eq 1 \) \, #h(2em) nu \( B \( z \, sqrt(S) \) \) lt.eq m S d quad \( z in "supp" nu \) \, $ <eq:prelim-weighted-hypotheses>]

 where $m \, d > 0$. For bounded frequency support, 
#[#set math.equation(numbering: n => "(2.15)")
 $ integral \| E v \|^2 thin d nu lt.eq C_epsilon.alt S^epsilon.alt m S^(2 \/ 3) d^(1 \/ 3) parallel v parallel_2^2 . $ <eq:prelim-weighted-fractal>]

 The same bound holds for $sum_Q nu \( Q \) sup_Q \| E v \|^2$, summed over unit cubes. The ball bound alone gives this conclusion with $d = 1$, up to a fixed constant.]
] <lem:prelim-weighted>

#proof[
  Fixed-radius enlargements of the second bound in (2.14) follow by a bounded covering with balls of radius $sqrt(S)$ centered on the support. This also extends it to arbitrary centers, up to a fixed constant. Every unit cube has mass at most $C m$. Split the positive-mass cubes into classes
  $ m chi < nu \( Q \) lt.eq 2 m chi \, #h(2em) chi in { C_02^(- k) : k gt.eq 0 } \, $
  with harmless endpoint adjustments and fixed $C_0$. Cubes in one class have counting parameter $C chi^(- 1)$: the cubes meeting an $r$-ball have disjoint masses inside a fixed enlargement of that ball. Their square-root-scale occupancy is at most $C S d chi^(- 1)$ by the same argument. Lemma 4 therefore gives
  $ sum_(Q upright(" in the ") chi upright(" class")) nu \( Q \) sup_Q \| E v \|^2 & lt.eq C_epsilon.alt m chi S^epsilon.alt #scale(x: 120%, y: 120%)[\(] chi^(- 1) dot.op S d chi^(- 1) dot.op S #scale(x: 120%, y: 120%)[\)]^(1 \/ 3) parallel v parallel_2^2\
 & = C_epsilon.alt S^epsilon.alt m S^(2 \/ 3) d^(1 \/ 3) chi^(1 \/ 3) parallel v parallel_2^2 . $
  The series $sum_chi chi^(1 \/ 3)$ converges. Summing proves both assertions, including measures with arbitrarily small positive cube masses; no lower mass cutoff is needed here. Finally the first ball bound, evaluated at $r = sqrt(S)$, supplies $d = 1$. ◻
]

#thm([Lemma 2.5.])[
  (Weighted cap estimate).  #emph[Fix $alpha_0 < 1 \/ 2$. Suppose that $S gt.eq 1$, that $nu$ is supported in a ball of radius $C S$ and satisfies $nu \( B \( z \, r \) \) lt.eq m r^2$ for $r gt.eq 1$, and that $v$ is supported in a frequency ball $B \( v_0 \, q \)$, with $v_0$ in a fixed bounded set and 
$ S^(- alpha_0) lt.eq q lt.eq 1 . $

 Then, for every $epsilon.alt > 0$, 
#[#set math.equation(numbering: n => "(2.16)")
 $ integral \| E v \|^2 thin d nu lt.eq C_(epsilon.alt \, alpha_0) S^epsilon.alt m S^(2 \/ 3) q^(1 \/ 3) parallel v parallel_2^2 . $ <eq:prelim-cap-estimate>]

 The estimate also holds with the integral replaced by $sum_Q nu \( Q \) sup_Q \| E v \|^2$ over unit cubes. Bounded translations, and averages of translations with a fixed integrable Schwartz weight, obey the same bounds.]
] <lem:cap>

#proof[
  Translate the space-time support ball to the origin, absorbing the translation in a unimodular factor on $v$. Write
  $ g \( eta \) = q thin v \( v_0 + q eta \) \, #h(2em) \( y \, tau \) = #scale(x: 120%, y: 120%)[\(] q \( x - 2 v_0 t \) \, q^2 t #scale(x: 120%, y: 120%)[\)] \, #h(2em) S' = S q^2 . $
  Then $parallel g parallel_2 = parallel v parallel_2$, $"supp" g subset B \( 0 \, 1 \)$, and
  #[#set math.equation(numbering: n => "(2.17)")
   $ E v \( x \, t \) = q thin e^(i \( x dot.op v_0 - t \| v_0 \|^2 \)) E g \( y \, tau \) . $ <eq:prelim-cap-identity>]
  Let $nu'$ be the pushforward of $nu$. The inverse map is
  $ t = q^(- 2) tau \, #h(2em) x = q^(- 1) y + 2 v_0 q^(- 2) tau . $
  Consequently, the inverse image of a ball of radius $r gt.eq 1$ is a bounded shear of a box with side lengths $r \/ q \, r \/ q \, r \/ q^2$. It is covered by $O \( q^(- 1) \)$ balls of radius $C r \/ q$. The original ball bound applies at these radii and gives
  #[#set math.equation(numbering: n => "(2.18)")
   $ nu' \( B \( z \, r \) \) lt.eq C m q^(- 3) r^2 #h(2em) \( r gt.eq 1 \) . $ <eq:prelim-rescaled-density>]
  There is no Jacobian multiplier on this pushforward measure.
  The rescaled time interval has length $O \( S' \)$, but the spatial projection has diameter $O \( S q \) = O \( S' \/ q \)$. Partition the latter into squares $Q$ of side $S'$. On the common time slab, use Lemma 3 at packet width $s = sqrt(S')$, with any fixed padding exponent in $\( 0 \, 1 \)$. Let $g_Q$ denote its localized data. Then
  $ sum_Q parallel g_Q parallel_2^2 lt.eq C parallel g parallel_2^2 \, #h(2em) \| E g - E g_Q \| lt.eq C_A \( S' \)^(- A) parallel g parallel_2 quad upright("on the corresponding prism") \, $
  where $A$ can be made arbitrarily large. Each restricted measure lies in a ball of radius $C S'$, so Lemma 5 with $d = 1$ and (2.18) gives
  $ sum_Q integral_(Q times \[ - C S' \, C S' \]) \| E g_Q \|^2 thin d nu' lt.eq C_epsilon.alt \( S' \)^epsilon.alt m q^(- 3) \( S' \)^(2 \/ 3) parallel g parallel_2^2 . $
  The sum uses the localized energies, rather than the number of spatial squares. This distinction is essential for the cap power.
  For completeness, $nu' \( bb(R)^3 \) = nu \( bb(R)^3 \) lt.eq C m S^2$, whereas $S' gt.eq S^(1 - 2 alpha_0)$. Thus the integrated squared error, after multiplication by the $q^2$ in (2.17), is at most
  $ C_A m q^2 S^2 \( S' \)^(- 2 A) parallel g parallel_2^2 . $
  Choose $A$ in terms of $alpha_0$ so that this is bounded by the desired right side; bounded $S$ is absorbed in the constant. For the principal term,
  #[#set math.equation(numbering: n => "(2.19)")
   $ q^2 thin m q^(- 3) \( S q^2 \)^(2 \/ 3) = m S^(2 \/ 3) q^(1 \/ 3) . $ <eq:prelim-cap-power>]
  Since $\( S' \)^epsilon.alt lt.eq S^epsilon.alt$, this proves (2.16).
  Finally, square (2.12) by weighted Cauchy–Schwarz, integrate in $z in Q$ against $d nu \( z \)$, and sum the original unit cubes. This bounds the sum of weighted suprema by
  $ C_N integral_(bb(R)^3) \( 1 + \| w \| \)^(- N) integral_(bb(R)^3) \| E v \( z + w \) \|^2 thin d nu \( z \) thin d w . $
  For every shift the field is an exact extension of modulated data with the same cap support and norm. Apply the already proved cap estimate and integrate the rapidly decreasing weight. This proves the supremum assertion and the asserted translated versions. ◻
]

#prodef([Remark 2.6.])[
  (Enlarged cubes in the inductive formulation).  The proof of Lemma 4 is sufficient for all later applications. For comparison, we record an alternative reduction of (2.11) to the inductive Proposition 3.1 of [13]. Choose $K = S^delta$ with $0 < delta < 1 \/ 4$ sufficiently small relative to the desired loss, and enlarge occupied unit cubes to occupied $K^2$-cubes. Selecting one original unit cube in each occupied large cube shows, by ball covering, that the large cubes have counting parameter $O \( gamma \)$ for $r gt.eq K^2$, and square-root-scale occupancy $O \( lambda_0 \)$. Normalize $parallel v parallel_2 = 1$ and discard large cubes with $L^6$ norm below $S^(- A)$. There are polynomially many cubes, so their total $L^2$ contribution is arbitrarily small when $A$ is sufficiently large. The remaining $L^6$ norms have only $O \( log S \)$ dyadic classes, since $\| E v \| lt.eq C$ and each large cube has volume $K^6$.
  After fixing a norm class, recompute its parent occupancies and sort them dyadically. On each resulting union $Y$ of $M_Y$ large cubes, Proposition 3.1 gives
  $ parallel E v parallel_(L^6 \( Y \)) lt.eq C_epsilon.alt M_Y^(- 1 \/ 3) \( gamma lambda_0 S \)^(1 \/ 6) S^epsilon.alt parallel v parallel_2 . $
  Hölder contributes $\| Y \|^(1 \/ 3) = M_Y^(1 \/ 3) K^2$ on passing to $L^2$, cancelling $M_Y^(- 1 \/ 3)$. After squaring, the additional loss is $K^4$; the finitely many logarithmic losses and this factor are absorbed by the choice of $delta$ and a smaller initial $epsilon.alt$.
  The grids in this deduction can be made compatible as follows. Increase the ambient scale by a bounded factor so that $S^(1 \/ 2) \/ S^(2 delta)$ is an integer. Such scales have successive ratios tending to one. Use nested grids at these two scales and a bounded family of translated parent grids. For sufficiently large $S$, each original unit cube can be assigned to a parent grid in which it is farther than $2 sqrt(3) K^2$ from the parent boundary; keep only the occupied large cubes within that parent. Split the original collection according to these finitely many assignments. The same original ball counts control each part, while translation is absorbed into the datum as in Lemma 4. Bounded scales are covered by a fixed constant. Thus neither boundary cubes nor rounding changes the resulting estimate.
] <rem:prelim-enlarged-cubes>

== 3 A power saving for transverse inputs <sec:transverse>

The first step is a rigidity statement for almost extremizers of the fractal estimate. A hypothetical extremizing configuration produces a probability distribution on points and incident tubes. Information at successive spatial scales first forces three identical one-dimensional profiles, then forces those profiles to alternate only finitely often between slopes zero and one. Polynomial partitioning rules out the remaining transition.

#thm([Proposition 3.1.])[
  (Transverse power saving).  #emph[Fix a bounded frequency region. There are $c > 0$ and $L_0 < oo$, depending only on that region, for which the following configuration cannot exist when $L gt.eq L_0$. Let $cal(Q)$ be unit lattice cubes inside a ball of radius $L^2$ in $bb(R)^3$, with 
$ \# cal(Q) gt.eq L^(4 - c) \, #h(2em) \# { Q in cal(Q) : Q ∩ B \( z \, r \) eq.not diameter } lt.eq L^c r^2 quad \( r gt.eq 1 \) \, $

 where cube counts may equivalently use their centers, up to fixed constants. Suppose $v_1 \, v_2 \, v_3$ have frequency support in the fixed region, $parallel v_i parallel_2 lt.eq 1$, and 
$ sup_Q \| E v_i \| gt.eq L^(- 4 \/ 3 - c) #h(2em) \( Q in cal(Q) \, med i = 1 \, 2 \, 3 \) . $

 Then it is impossible that every triple of unit frequency directions, one from each support, has absolute determinant at least $L^(- c)$.]
] <prop:transverse>

We argue by contradiction along $L arrow.r oo$ and $c arrow.b 0$. Every $o \( 1 \)$ in this section refers to this sequence or a subsequence. A diagonal choice converts estimates valid with every fixed positive power loss into $L^(o \( 1 \))$ estimates; constants are fixed before making that choice. All rounding, support enlargements, and packet padding are included in these subpower errors. The same convention applies when a scale is a fixed positive power of $L$.

=== 3.1 Uniform multilinear estimates and the tube model <uniform-multilinear-estimates-and-the-tube-model>

We need the multilinear estimates when transversality itself deteriorates by a subpower. An unspecified transversality-dependent constant in the restriction theorem would not justify this use. The following finite induction supplies the required uniformity.

#thm([Lemma 3.2.])[
  (Multilinear estimates with subpower transversality).  #emph[Suppose three exact extension inputs have bounded frequency supports, and every triple of their unit directions has determinant at least $nu$, where $0 < nu lt.eq 1$. For each $epsilon.alt > 0$ there are $C_epsilon.alt \, M_epsilon.alt < oo$ such that, on every ball of radius $S gt.eq 2$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ integral_(B_S) product_(i = 1)^3 \| E v_i \( z \) \| thin d z lt.eq C_epsilon.alt nu^(- M_epsilon.alt) S^epsilon.alt product_(i = 1)^3 parallel v_i parallel_2 . $ <eq:transverse-product>]

 The same conclusion holds for the sum over unit lattice cubes in the ball of $product_i sup_Q \| E v_i \|$. In particular, when $nu = S^(- o \( 1 \))$ both bounds are $S^(o \( 1 \)) product_i parallel v_i parallel_2$. For weighted tubes of width $Delta$ in a bounded region, the corresponding multilinear Kakeya bound is 
#[#set math.equation(numbering: n => "(3.2)")
 $ integral product_(i = 1)^3 (sum_T w_i \( T \) upright(bold(1))_T)^(1 \/ 2) lt.eq C_epsilon.alt nu^(- M_epsilon.alt) Delta^(3 - epsilon.alt) product_(i = 1)^3 (sum_T w_i \( T \))^(1 \/ 2) . $ <eq:transverse-kakeya>]

 Here fixed enlargements of tubes and of the ambient region are allowed; if those enlargements are subpower on a sequence, they cost a subpower.]
] <lem:transverse-product>

#proof[
  Partition each direction support into neighborhoods of radius a sufficiently small fixed power of $nu$. There are at most $nu^(- O \( 1 \))$ such neighborhoods. For each triple choose representative directions and send them to the coordinate axes by a linear map. Its norm, inverse norm, and volume distortion are bounded by fixed powers of $nu^(- 1)$. The transformed direction neighborhoods lie in fixed small neighborhoods of the axes. The weighted multilinear Kakeya inequality of [1] Theorem 1.15 and Remark 1.10, applied there and summed over triples, proves (3.2). Weights follow first by repetitions and then by approximation. Widths larger than a fixed constant can instead be treated by the trivial bound, after increasing the inverse-power constant.
  For completeness, use this Kakeya inequality to obtain restriction uniformity. Let $A_B \( S \, nu \)$ be the least normalized product-integral constant for inputs supported in $\[ - B \, B \]^2$. Fix padding exponent $theta > 0$ and Kakeya loss $sigma > 0$. Cover a ball of radius $S$ by cubes of side comparable to $sqrt(S)$. The exact packet decomposition restricts each input on a smaller cube to packets incident to its $S^theta sqrt(S)$ enlargement. Its retained exact input has squared norm at most a fixed constant times the incident coefficient energy. Its support is within $O_B \( S^(- 1 \/ 2) \)$ of the original support: only caps intersecting that support occur, and every enlarged cap lies within this distance of such an intersection. Thus determinant continuity preserves $nu \/ 2$ transversality when $S^(- 1 \/ 2) lt.eq c_B nu$, without any openness or connectedness assumption on the supports.
  Apply the smaller-scale product estimate in every cube. Its geometric coefficient is the product of the three square roots of incident energies. After division of coordinates by $S$, the padded tubes have width $Delta = S^(- 1 \/ 2 + theta)$. Enlarge them by a fixed factor, so an incident tube contains the whole smaller grid cube. Equation (3.2), divided by that cube’s volume $S^(- 3 \/ 2)$, gives the bound
  $ C_(B \, theta \, sigma) nu^(- M_sigma) S^(3 \/ 2) \( S^(- 1 \/ 2 + theta) \)^(3 - sigma) product_i parallel v_i parallel_2 lt.eq C_(B \, theta \, sigma) nu^(- M_sigma) S^beta product_i parallel v_i parallel_2 \, #h(2em) beta = 3 theta + sigma \/ 2 \, $
  for the sum of these geometric coefficients. To bound discarded-field errors, normalize each parent input, use rapid tails for a discarded factor and the fixed-frequency $L^oo$ bound for the others, and expand the three-factor product. The seven error terms together contribute at most $C_(B \, theta \, N) S^(3 - N) product_i parallel v_i parallel_2$, for every prescribed $N$. This is relative to the current #emph[parent] norms; no lower bound for a retained local norm is required. We obtain the recurrence
  #[#set math.equation(numbering: n => "(3.3)")
   $ A_B \( S \, nu \) lt.eq C_(B \, theta \, sigma) nu^(- M_sigma) S^beta A_(B + 1) \( C_B sqrt(S) \, nu \/ 2 \) + C_(B \, theta \, N) S^(3 - N) \, #h(2em) S^(- 1 \/ 2) lt.eq c_B nu . $ <eq:transverse-square-root>]
  Spatial translations only modulate the exact inputs. Taking $N > 3$ and setting $tilde(A)_B = 1 + A_B$ absorbs the additive error in the same multiplicative recurrence for $tilde(A)_B$.
  Fix the target $epsilon.alt > 0$. Choose a finite $J$ with $3 dot.op 2^(- J) < epsilon.alt \/ 2$, then choose $theta \, sigma$ with $2 beta < epsilon.alt \/ 2$. The finitely many radii defined by $S_0 = S$, $S_(j + 1) = C_(B + j) sqrt(S_j)$ are comparable to $S^(2^(- j))$, with constants depending only on $B \, J$. If $S gt.eq \( C_(B \, J) \/ nu \)^(2^J)$ for a sufficiently large constant, all $J$ support-enlargement conditions hold. Iterating (3.3) and using the terminal trivial bound $tilde(A)_(B + J) \( R \, nu' \) lt.tilde_(B \, J) R^3$ gives
  $ tilde(A)_B \( S \, nu \) lt.eq C_(B \, epsilon.alt) nu^(- M_(B \, epsilon.alt)) S^(beta sum_(j = 0)^(J - 1) 2^(- j) + 3 dot.op 2^(- J)) lt.eq C_(B \, epsilon.alt) nu^(- M_(B \, epsilon.alt)) S^epsilon.alt . $
  In the complementary range, the trivial bound $A_B \( S \, nu \) lt.tilde_B S^3$ is absorbed by increasing the fixed inverse-transversality exponent to at least $3 dot.op 2^J$. This proves (3.1) for all $S \, nu$. On a subpower-transverse sequence the threshold is eventually satisfied for each fixed $J$, and every intermediate enlarged support remains subpower transverse. This is a finite version of the restriction bootstrapping in [1] Proposition 2.1; polynomial dependence is supplied by this argument, not by the statement of their restriction theorem alone.
  Finally, fixed-frequency reproducing kernels give, for $z in Q$,
  $ sup_Q \| E v_i \| lt.tilde_N integral \( 1 + \| w \| \)^(- N) \| E v_i \( z + w \) \| thin d w . $
  Integrate the product over $Q$ and sum. For each triple of shifts the three shifted fields are exact extensions on the same domain, with independently modulated inputs of unchanged norms and supports. Apply (3.1) and integrate the Schwartz weights. ◻
]

#thm([Lemma 3.3.])[
  (Reduction to weighted incident tubes).  #emph[A countersequence to Proposition 8 yields a set $P$ in a fixed bounded region and three weighted tube families satisfying 
#[#set math.equation(numbering: n => "(3.4)")
 $ \| P \| = L^(2 + o \( 1 \)) \, #h(2em) \| P ∩ B \( z \, r \) \| lt.eq L^(2 + o \( 1 \)) r^2 quad \( L^(- 1) lt.eq r lt.eq 1 \) . $ <eq:transverse-point-counts>]

 The points are centers of distinct cubes of side comparable to $L^(- 1)$. The tubes have width $L^(- 1 + o \( 1 \))$, their coefficient weights obey $sum_T w_i \( T \) lt.tilde 1$, and every cross-family direction triple has determinant at least $L^(- o \( 1 \))$. At each $p in P$ there is a retained incident subfamily of total weight $e_i^(*) \( p \) = L^(- 4 \/ 3 + o \( 1 \))$ such that its normalized weight law satisfies, for fixed $kappa > 0$, $u_0 > 0$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] "dir" T_i in B \( v \, L^(- u) \) divides X = p #scale(x: 120%, y: 120%)[\)] lt.eq L^(- kappa u + o \( 1 \)) #h(2em) \( 0 < u < u_0 \, med u in bb(Q) \) . $ <eq:src1>]

 This bound is uniform in $p \, v$ for each fixed rational $u$. The retained subfamily may depend on $p$.]
] <lem:transverse-tubes>

#proof[
  Sort occupied $L$-boxes by their number of selected unit cubes. A dyadic occupancy class retains $L^(4 - o \( 1 \))$ cubes. The squared supremum sum for each field on this class is at least $L^(4 \/ 3 - o \( 1 \))$. By Lemma 4 at radius $L^2$, a class with occupancy at most $L^(2 - delta)$, for fixed $delta > 0$, instead has squared sum at most $L^(4 \/ 3 - delta \/ 3 + o \( 1 \))$. Thus some retained class has $L^(2 - o \( 1 \))$ cubes in each occupied box. The upper counting bound gives occupancy at most $L^(2 + o \( 1 \))$. Divide coordinates by $L^2$ and take the centers of these boxes. Counting cubes in an enlarged ball and dividing by the minimum occupancy proves (3.4). Translation of the original ambient ball merely modulates the exact data.
  Apply Lemma 3 at packet width $L$ on the time interval of length $O \( L^2 \)$. After division of coordinates by $L^2$, the resulting tubes have width $L^(- 1 + o \( 1 \))$. Give each tube the squared coefficient of its packet as weight. On each retained box, packets reaching a padded enlargement give an exact local input and an error $O \( L^(- 100) \)$. The padding exponent tends sufficiently slowly to zero; the rapid-tail estimates permit this by diagonalization. By (2.7), the squared norm of this exact local input is bounded by the incident coefficient energy $e_i \( p \) = sum_(T in.rev p) w_i \( T \)$ up to a constant. On the at least $L^(2 - o \( 1 \))$ selected unit cubes in this box the required squared supremum sum is $L^(- 2 \/ 3 - o \( 1 \))$. The weighted fractal estimate at radius $L$ bounds it above by $L^(2 \/ 3 + o \( 1 \)) e_i \( p \)$, so
  $ e_i \( p \) gt.eq L^(- 4 \/ 3 - o \( 1 \)) . $
  Lemma 9, in its Kakeya form and with $Delta = L^(- 1 + o \( 1 \))$, yields
  $ sum_(p in P) product_(i = 1)^3 e_i \( p \)^(1 \/ 2) lt.eq L^(o \( 1 \)) . $
  For fixed $delta > 0$, points at which some $e_i \( p \) gt.eq L^(- 4 \/ 3 + delta)$ therefore number at most $L^(2 - delta \/ 2 + o \( 1 \))$. Discarding these points by a diagonal choice leaves (3.4) and makes all three energies $L^(- 4 \/ 3 + o \( 1 \))$ uniformly.
  It remains to remove concentration in direction without losing the local lower bound. Choose $0 < kappa < 1 \/ 3$ and $0 < u_0 < 1 \/ 4$. For each fixed rational $0 < u < u_0$, put $q = L^(- u)$ and partition directions into bounded-overlap bins of diameter comparable to $q$. Delete incident bins having weight greater than $q^kappa e_i \( p \)$. There are $O \( q^(- kappa) \)$ such bins. On the original box of radius $O \( L \)$, Lemma 6 applies with $S = L$; the packet frequency enlargement $O \( L^(- 1) \)$ is smaller than the bin width $q$. Cauchy–Schwarz over the deleted bins then bounds the squared supremum sum of their combined field by
  $ L^(2 \/ 3 + o \( 1 \)) q^(1 \/ 3 - kappa) e_i \( p \) . $
  Here the chosen unit cubes have local density $L^(o \( 1 \))$, and the energies of all deleted bins sum to $O \( e_i \( p \) \)$. The estimate also holds for arbitrary subfamilies of these bins. For every fixed $u > 0$ this is negligible relative to $L^(- 2 \/ 3 - o \( 1 \))$.
  Delete successively for any fixed finite list of rational $u$’s, assigning a packet deleted more than once to just one bin. The triangle inequality in the square-sum norm shows that the surviving field retains its lower local norm. The unrestricted local estimate then gives surviving weight $e_i^(*) \( p \) = L^(- 4 \/ 3 + o \( 1 \))$. Every surviving bin has original weight at most $q^kappa e_i \( p \)$; normalizing by $e_i^(*) \( p \)$ costs only $L^(o \( 1 \))$. Boundedly many neighboring bins cover a ball, and a diagonal choice proves (3.5) at all fixed rational scales. All estimates were uniform in $p$, so this point-dependent pruning supplies legitimate conditional laws without requiring a single globally pruned family. ◻
]

=== 3.2 Information at spatial scales <information-at-spatial-scales>

From now on only the abstract configuration of Lemma 10 is used. Draw $X$ uniformly from $P$. Given $X$, draw six tubes $T_i \, T'_i$ independently, two from each retained family. A tube label includes its exact direction. For rational $0 < s lt.eq 1$, let $X_s$ be the cell containing $X$ in nested dyadic grids of side comparable to $L^(- s)$; use the trivial partition at $s = 0$. For a discrete variable $Y$ and arbitrary conditioning $V$, write

$ I_L \( Y divides V \) = - log_L bb(P) \( Y = Y \( omega \) divides V \) $

for its information evaluated at the sampled labels. Conditional probabilities may be fixed in any version on null sets. This is the exponent of the reciprocal probability of the realized label, rather than its expectation: a sampled label of conditional probability $L^(- a + o \( 1 \))$ has information $a + o \( 1 \)$. We retain these sampled exponents in one joint limiting law so that comparisons at different spatial scales refer to the same configuration.

#thm([Lemma 3.4.])[
  (Limiting information calculus).  #emph[After a subsequence, all the countably many information variables used below have a common limiting joint law. For spatial, coordinate, and direction partitions with at most $L^(C + o \( 1 \))$ possible labels, their conditional informations are uniformly integrable and have bounded limiting values. In this law the chain rule remains exact and 
#[#set math.equation(numbering: n => "(3.6)")
 $ I \( Y divides V \) gt.eq I \( Y divides V \, W \) quad upright("almost surely") . $ <eq:transverse-conditioning>]

 If, given $Z \, V$, the possible values of $Y$ on an event $E_L$ number at most $L^(gamma + o \( 1 \))$, include its indicator in the joint limit. On the event where the limiting indicator equals one, $I \( Y divides Z \, V \) lt.eq gamma$. Alternatively, an event specified by a finite system of sampled inequalities can be treated by open-set implications with fixed slack before that slack tends to zero; no identification of arbitrary boundary events is implicit. Consequently variables determining one another up to $L^(o \( 1 \))$ possibilities have identical limiting information, also after additional conditioning. Finite systems of limiting inequalities holding with positive probability pass to finite $L$ with any fixed positive slack.]
] <lem:transverse-information>

#proof[
  A variable with at most $L^(C + o \( 1 \))$ labels satisfies, uniformly in conditioning,
  $ bb(P) { I_L \( Y divides V \) > C + eta } lt.eq L^(- eta + o \( 1 \)) . $
  The same counting argument with a varying threshold proves uniform integrability. For the conditioning assertion put $p = bb(P) \( Y divides V \)$ and $q = bb(P) \( Y divides V \, W \)$ at the sampled labels. Conditional on $\( V \, W \)$, the expectation of $p \/ q$ is at most one. Thus
  $ bb(P) { I_L \( Y divides V \) - I_L \( Y divides V \, W \) < - eta } lt.eq L^(- eta) . $
  This proves the almost-sure sign in the limit; no finite-scale pointwise monotonicity is asserted. The chain rule is pointwise already at finite scale. The determination rule follows by summing over the stated small set of possible labels. This argument also works on restricted events, since it bounds the total mass of the bad low-probability labels in the event’s permitted set. If the event indicator is included in the joint limit, apply weak convergence to the open set where it is one and the information is strictly above $gamma + eta$, and then let $eta arrow.b 0$. For events defined through other limiting variables, the same argument uses strict inequalities and slack, as detailed in the zero-ratio application below.
  Tightness and diagonal weak convergence on a countable product give the joint law. Include in this product all rational block and prefix parameters, all finitely many choices of reference and replacement tubes, their direction bins, coordinate grids, projections, the information differences used below, and the angular quantities to be introduced. Direction grids use deterministic representatives of occupied bins. Realized bases and inverse bases have norms $L^(o \( 1 \))$, so every coordinate partition has at most $L^(C + o \( 1 \))$ labels. Standard open-set inequalities for weak convergence justify the assertion about finite systems after enlarging their bounds by slack. Uniform integrability permits passage of expectations in the cost estimates below. ◻
]

#thm([Lemma 3.5.])[
  (The spatial profiles).  #emph[In the limiting law set 
$ F \( s \) = I \( X_s \) \, #h(2em) G_i \( s \) = I \( X_s divides T_i \) \, #h(2em) G'_i \( s \) = I \( X_s divides T'_i \) . $

 These functions extend from rational scales to nondecreasing Lipschitz functions on $\[ 0 \, 1 \]$, vanishing at zero. Their Lipschitz constants are respectively $3$ and $1$. Almost surely, 
#[#set math.equation(numbering: n => "(3.7)")
 $ F \( s \) gt.eq 2 s \, #h(2em) F \( 1 \) = 2 \, #h(2em) G_i \( 1 \) \, G'_i \( 1 \) gt.eq 2 / 3 . $ <eq:transverse-endpoint-information>]

]
] <lem:transverse-profiles>

#proof[
  The exact chain increment of $G_i$ between $s$ and $s + t$ is $I \( X_(s + t) divides X_s \, T_i \)$. Inside a parent, the tube meets at most $L^(t + o \( 1 \))$ child cubes, including its padding. The determination rule bounds this increment between zero and $t$; the unrestricted spatial count gives the bounds zero and $3 t$ for $F$. Rational comparisons simultaneously yield the Lipschitz extensions.
  The ball count in (3.4) gives every $X_s$-cell mass at most $L^(- 2 s + o \( 1 \))$, proving $F \( s \) gt.eq 2 s$. An $X_1$-cell contains boundedly many points and $X$ is uniform, so $F \( 1 \) = 2$. Finally the retained weights give
  $ bb(P) \( X = p \, T_i = T \) = \| P \|^(- 1) frac(w_i \( T \) upright(bold(1))_({ T upright(" retained at ") p }), e_i^(*) \( p \)) lt.eq L^(- 2 \/ 3 + o \( 1 \)) w_i \( T \) . $
  The probability of sampling a tube whose marginal is smaller than $L^(- eta) w_i \( T \)$ is at most $L^(- eta) sum_T w_i \( T \) = O \( L^(- eta) \)$. Outside this event, every conditional point mass is at most $L^(- 2 \/ 3 + eta + o \( 1 \))$. Letting $eta arrow.b 0$ proves the conditional endpoint bounds, also for all primed tubes. This uses only summability of weights, so exact tube labels need not have bounded cardinality. ◻
]

=== 3.3 Direction costs and equality of the profiles <direction-costs-and-equality-of-the-profiles>

To compare the three tube-conditional profiles, we use coordinates adapted to one reference tube from each family. Specifying those coordinates requires revealing coarse direction bins. This can lower the spatial information; the costs below measure that loss, and their telescoping bound will let the loss tend to zero with the block size.

Fix a rational block $\[ s \, s + b \] subset \[ 0 \, 1 \]$ and rational $b_(*) gt.eq b$. Let $C = X_s$ and let $D$ record direction bins of precision $L^(- b_(*))$ for a fixed sublist of the six tubes, including one reference tube from each family. Within the parent subtract its center, multiply coordinates by $L^s$, and use the approximate basis supplied by the three reference bins. Its norms and inverse norms are $L^(o \( 1 \))$. For rational $0 < t lt.eq b$ let $Z_i$ be its $i$th coordinate grid index at resolution $L^(- t)$, and write $Z = \( Z_1 \, Z_2 \, Z_3 \)$ and $Z_(hat(i)) = \( Z_j \)_(j eq.not i)$. These coordinate grids are nested in $t$. When extra bins are added to $D$, the basis is still selected using only the three reference bins, so the coordinate variables do not change.

#thm([Lemma 3.6.])[
  (Block comparison and telescoping costs).  #emph[Write $J = F \( s + t \) - F \( s \)$ and $J_i = G_i \( s + t \) - G_i \( s \)$ for the chosen reference tubes. Define 
$ ell = I \( X_(s + t) divides C \) - I \( X_(s + t) divides C \, D \) \, #h(2em) ell_i = I \( X_(s + t) divides C \, T_i \) - I \( X_(s + t) divides C \, T_i \, D \) . $

 All these limiting costs are nonnegative, and 
#[#set math.equation(numbering: n => "(3.8)")
 $ sum_(i = 1)^3 \( J_i - ell_i \) lt.eq sum_(i = 1)^3 I \( Z_i divides Z_(hat(i)) \, C \, D \) lt.eq I \( Z divides C \, D \) = J - ell . $ <eq:src2>]

 For disjoint blocks or disjoint prefixes, with the same $D$, the sum of expectations of each type of cost is $O \( b_(*) \)$. The same statement holds with any one fixed other tube in place of $T_i$. All coordinatewise deficits obtained by using any ordering in the second inequality of (3.8) are nonnegative.]
] <lem:transverse-costs>

#proof[
  The spatial child and the three coordinate labels determine one another up to $L^(o \( 1 \))$ choices. A reference tube determines its two off-axis coordinates to $L^(o \( 1 \))$ choices: both its width and the error in its approximate direction, relative to the parent, are at most $L^(- t + o \( 1 \))$. Conditional information calculus therefore gives
  $ J_i - ell_i = I \( Z_i divides C \, D \, T_i \) = I \( Z_i divides Z_(hat(i)) \, C \, D \, T_i \) lt.eq I \( Z_i divides Z_(hat(i)) \, C \, D \) . $
  For each ordering of the coordinates, its chain-rule term conditions on a subset of $Z_(hat(i))$, hence dominates the last expression. Sum the three terms to obtain (3.8).
  At finite scale, the expected cost is the conditional mutual information, divided by $log L$, between the child and $D$ given the parent (and, when present, the same fixed tube). Along the nested spatial filtration these mutual informations telescope. Inserting the omitted gaps between disjoint blocks only adds nonnegative expected terms. Their sum is at most $H \( D \) \/ log L = O \( b_(*) \)$, because there are $L^(O \( b_(*) \))$ direction-bin lists. Fixed tube conditioning is never changed within this telescoping argument. Passage to the limit follows from Lemma 11. ◻
]

#thm([Lemma 3.7.])[
  (Additivity and replacement invariance).  #emph[Almost surely, simultaneously for every choice of one of the two tubes in each family, 
$ F = G_1 + G_2 + G_3 \, #h(2em) G'_i = G_i \, #h(2em) G_i \( 1 \) = 2 / 3 . $

 In any block above, including a prefix and with any extra direction bins in $D$, 
#[#set math.equation(numbering: n => "(3.9)")
 $ I \( Z_i divides C \, D \) & = J_i + O (sum_k ell_k) \,\
I \( Z_i \, Z_j divides C \, D \) & = J_i + J_j + O (sum_k ell_k) . $ <eq:src3>]

 The absolute constants in these error bounds are fixed.]
] <lem:transverse-additivity>

#proof[
  Partition a fixed rational spatial interval into blocks of length at most $b = b_(*)$. By (3.8), the positive part of the excess of the summed $G_i$ increment over the $F$ increment has expectation $O \( b \)$. Let $b arrow.b 0$ to obtain the interval inequality almost surely. At $\[ 0 \, 1 \]$, (3.7) forces equality and $G_i \( 1 \) = 2 \/ 3$. The interval deficits are nonnegative and additive, so their zero full-interval total forces all rational subinterval deficits to vanish. Continuity gives $F = sum_i G_i$. Repeat for the finitely many replacement triples; subtracting identities gives $G'_i = G_i$.
  For any coordinate ordering, its $i$th chain term dominates $I \( Z_i divides Z_(hat(i)) \, C \, D \)$ and then $J_i - ell_i$. The sum of the surpluses is exactly $sum_i ell_i - ell lt.eq sum_i ell_i$, using $J = sum_i J_i$. Take a chosen coordinate, or chosen pair, first in the ordering. This gives both bounds in (3.9), with each individual error controlled by the total cost. ◻
]

#thm([Lemma 3.8.])[
  (One common profile).  #emph[Almost surely, 
#[#set math.equation(numbering: n => "(3.10)")
 $ G_1 = G_2 = G_3 = : G \, #h(2em) F = 3 G . $ <eq:src4>]

 In particular $0 lt.eq dot(G) lt.eq 1$, $G \( 1 \) = 2 \/ 3$, and $3 G \( s \) gt.eq 2 s$.]
] <lem:transverse-common-profile>

#proof[
  In the exact basis of $T_1 \, T_2 \, T_3$, normalize the $i$th coordinate of the direction of $T'_i$ to one, and call its other two ratios $a_j$ ($j eq.not i$). Replacement transversality and Cramer’s rule bound the normalizing denominator, its inverse, and all resulting ratios by subpowers. Include in the joint limit the values $min { 1 \, max { 0 \, - log_L \| a_j \| } }$, with value one at zero. The two limiting values cannot both be positive: that would put $T'_i$ within a fixed positive-power angular ball about $T_i$, with probability tending to zero by (3.5) and conditional independence given $X$.
  Let $r_j$ be the limiting clipped value for $a_j$. We make the restricted-event comparison on ${ r_j = 0 }$ precise. Fix a rational $0 < eta < t \/ 2$. At finite scale, $r_(j \, L) < eta \/ 2$ implies $\| a_j \| > L^(- eta \/ 2)$. The approximate basis fixed by $D$ differs from the exact basis by $L^(- b_(*) + o \( 1 \))$, including the subpower condition numbers. Its corresponding coefficient thus has magnitude at least $L^(- eta)$ for large $L$. Given $\( T'_i \, Z_j \, C \, D \)$ alone, possible child positions on this event number at most $L^(O \( eta \) + o \( 1 \))$: the approximate $j$th coordinate parametrizes the tube with inverse slope at most $L^(eta + o \( 1 \))$. This permitted set depends only on those displayed labels. Exact reference directions need not be added to the conditioning.
  Apply the restricted determination bound and the information conditioning rule. The probability that $r_(j \, L) < eta \/ 2$ and
  $ I_L \( X_(s + t) divides C \, D \, T'_i \) - I_L \( Z_j divides C \, D \) > C eta + eta $
  tends to zero, with a fixed absolute $C$. The joint limit therefore gives the corresponding comparison on the open event ${ r_j < eta \/ 2 }$ with error at most $\( C + 1 \) eta$; one can first use any strict upper error bound and then decrease it. This is an implication about the support of the joint limiting law and requires no coupling of finite-scale and limiting events. Let rational $eta arrow.b 0$. On ${ r_j = 0 }$ we obtain
  $ G'_i \( s + t \) - G'_i \( s \) - ell'_i lt.eq I \( Z_j divides C \, D \) \, $
  where $D$ includes the alternative bin and $ell'_i$ is its analogous cost. Replacement invariance and (3.9) now compare the $i$ and $j$ profile increments up to the costs.
  Take dyadic partitions of the exponent interval, with block size $b = b_(*)$. On each block distribute its cost uniformly over its length. The integral of this density is the cost; hence its expected integral is $O \( b \)$ by Lemma 13. Summability over dyadic $b$ shows that all normalized costs tend to zero for almost every pair consisting of a path and an exponent. At simultaneous differentiability points it follows that $dot(G)_i lt.eq dot(G)_j$ whenever the corresponding limiting ratio information is zero. The restricted-event determination just used is applied before differentiation, so no uniform positive lower bound for the coefficient is required.
  For almost every path each vertex $i$ therefore has an edge $i arrow.r j$ for which $dot(G)_i lt.eq dot(G)_j$ almost everywhere. Since both integrals are $2 \/ 3$, this forces $G_i = G_j$. Every equivalence class of equal profiles has at least two members. With three families there is only one such class, proving (3.10). ◻
]

=== 3.4 Projection growth on a block <projection-growth-on-a-block>

The next input is the robust form of the discretized projection theorem: one direction improves the projection of every sufficiently large subset. That quantifier is essential because the subset we construct will depend on the direction.

#thm([Lemma 3.9.])[
  (Robust planar discretized projection).  #emph[Fix $0 < d < 1$ and $rho_0 > 0$. There are $epsilon_(upright("pr")) > 0$ and $eta_(upright("pr")) > 0$ with the following property for all sufficiently small $Delta$. Suppose $A subset B \( 0 \, 1 \) subset bb(R)^2$, with $cal(N)_Delta$ denoting covering number by radius-$Delta$ balls, satisfies 
$ Delta^(- 2 d + eta_(upright("pr"))) lt.eq cal(N)_Delta \( A \) lt.eq Delta^(- 2 d - eta_(upright("pr"))) \, #h(2em) cal(N)_Delta \( A ∩ B \( z \, r \) \) lt.eq Delta^(- eta_(upright("pr"))) r^(rho_0) cal(N)_Delta \( A \) $

 for $Delta lt.eq r lt.eq 1$. Let $sigma$ be a probability on projection lines obeying $sigma \( B \( V \, r \) \) lt.eq Delta^(- eta_(upright("pr"))) r^(rho_0)$ on the same range. Some $V in "supp" sigma$ then satisfies 
$ cal(N)_Delta \( pi_V A' \) gt.eq Delta^(- d - epsilon_(upright("pr"))) quad upright("for every ") A' subset A upright(" with ") cal(N)_Delta \( A' \) gt.eq Delta^(eta_(upright("pr"))) cal(N)_Delta \( A \) . $

 One may decrease both the tolerance and the gain.]
] <lem:transverse-projection>

#proof[
  This is the $n = 2$, $m = 1$, $alpha = 2 d$ case of [17] Theorem 1, a general form of the planar Bourgain discretized projection theorem. In dimension two its Grassmannian nonconcentration condition is the displayed angular-ball condition. That theorem gives the conclusion simultaneously for every large subset, for a direction set of probability at least one minus a positive power of $Delta$. Decreasing the tolerance relative to its exponent gives the stated formulation. ◻
]

Take $T_1 \, T_2 \, T_3$ as reference tubes and write the direction of $T'_1$ in their exact basis as $\( 1 \, a_2 \, a_3 \)$. Given $X$ and these three exact references, redraw $T'_1$ from its original conditional law. Let $h_j \( u \)$, for rational $0 < u < u_0$, be the limiting value of the negative base-$L$ logarithm of the resulting marginal mass in the ball of radius $L^(- u)$ centered at the sampled $a_j$.

#thm([Lemma 3.10.])[
  (Angular marginal information).  #emph[The functions $h_2 \, h_3$ are nonnegative and nondecreasing on their rational domains, and almost surely 
#[#set math.equation(numbering: n => "(3.11)")
 $ h_2 \( u \) + h_3 \( u \) gt.eq kappa u #h(2em) \( 0 < u < u_0 \, med u in bb(Q) \) . $ <eq:transverse-angular-sum>]

 Their values agree with those of marginal coordinate-cell information at comparable resolution; the analogous joint assertion also holds.]
] <lem:transverse-angular-information>

#proof[
  The exact coordinate map and its inverse have subpower norm on the realized support. A joint ball in $\( a_2 \, a_3 \)$ therefore pulls back to at most two direction balls of radius $L^(- u + o \( 1 \))$. The alternative direction law, conditional on $X$ and the exact references, is still its original law given $X$. Equation (3.5), enlarged by a subpower using covering, bounds this joint ball mass by $L^(- kappa u + o \( 1 \))$.
  Here ball and grid informations have the same limit. Conditional on the exact point and references, take grids at comparable sizes. If $p_z$ is the mass of a sampled cell and $q_z$ the total mass of its boundedly many neighbors, then
  $ sum_(z : q_z > L^eta p_z) p_z lt.eq L^(- eta) sum_z q_z lt.tilde L^(- eta) . $
  A boundedly finer grid and the determination rule handle balls not contained in one grid cell. The argument is identical for joint and marginal grids. The chain rule and (3.6) bound joint cell information by the sum of marginal informations. This proves (3.11); monotonicity follows directly from nesting of centered balls. ◻
]

#thm([Lemma 3.11.])[
  (The projection block test).  #emph[Fix $0 < d < 1$, $d_0 > 0$, and $kappa_0 > 0$. There is $zeta > 0$, depending only on these parameters, for which the following conditions cannot hold on an event of positive limiting probability. Fix rational $\[ s \, s + b \] subset \[ 0 \, 1 \]$, with $b < u_0$, rational $b_(*) gt.eq b$, and $j in { 2 \, 3 }$. At direction precision $L^(- b_(*))$ let $D_0$ be the reference triple of bins and let $D_1$ add the alternative bin. Require]
  + #emph[$\| G \( s + b \) - G \( s \) - d b \| lt.eq zeta b$, and $G \( s + u \) - G \( s \) gt.eq d_0 u - zeta b$;]
  + #emph[all costs in Lemma 13, for both $D_0$ and $D_1$ and each reference tube or $T'_1$, are at most $zeta b$;]
  + #emph[$h_j \( u \) gt.eq kappa_0 u - zeta b$.]
  #emph[The prefix, cost, and angular requirements need be imposed only on a fixed finite rational grid of $0 < u lt.eq b$ containing $b$, with mesh at most a sufficiently small fixed multiple of $zeta b$. Decreasing $zeta$ preserves the conclusion. All power-error constants are independent of $s \, b \, b_(*)$; the meshes can be fixed in relative coordinates $u \/ b$, and their finite cardinalities only affect fixed constants in the later cost sums.]
] <lem:transverse-block-test>

#proof[
  Put $K = L^b$ and use the same reference coordinates for $D_0 \, D_1$. Let $Y = \( Z_1 \, Z_j \)$ at the endpoint or a tested prefix. Equations (3.9)–(3.10) imply, with either conditioning $C \, D_0$ or $C \, D_1$,
  #[#set math.equation(numbering: n => "(3.12)")
   $ I \( Y_b divides C \, D_a \) = 2 d b + O \( zeta b \) \, #h(2em) I \( Y_u divides C \, D_a \) gt.eq 2 d_0 u - O \( zeta b \) \, quad a = 0 \, 1 . $ <eq:transverse-pair-information>]
  Let $tilde(a)_j$ be the approximate direction ratio fixed by $D_1$, and let $Pi \( Y_b \)$ record the interval of length $K^(- 1)$ containing $z_j - tilde(a)_j z_1$ at the pair-cell center. The exact and approximate ratios differ by at most $L^(- b_(*) + o \( 1 \))$. Given $T'_1 \, C \, D_1$, this projection ranges over $L^(o \( 1 \))$ cells. Indeed, the approximate basis is already fixed by $D_0$, and the exact central line of $T'_1$ is part of its label. Its slope differs from the representative slope by $L^(- b_(*) + o \( 1 \))$, while its width in parent coordinates is at most $L^(s - 1 + o \( 1 \)) lt.eq L^(- b + o \( 1 \))$. Along a segment of length $L^(o \( 1 \))$ both errors cause only $L^(- b + o \( 1 \))$ projection variation. Hidden exact reference directions do not enter this coordinate system. Also $Y_b$ and $X_(s + b)$ determine each other to $L^(o \( 1 \))$ choices with these labels: coordinate one parametrizes the alternative tube with subpower distortion. Consequently
  $ I \( Y_b divides Pi \, C \, D_1 \) & gt.eq I \( Y_b divides Pi \, C \, D_1 \, T'_1 \)\
 & = I \( X_(s + b) divides C \, D_1 \, T'_1 \) gt.eq G \( s + b \) - G \( s \) - zeta b . $
  Since $Pi$ is determined by $Y_b \, D_1$, its chain rule together with (3.12) gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ I \( Pi divides C \, D_1 \) lt.eq d b + O \( zeta b \) . $ <eq:transverse-projection-information>]
  All projection information variables are among those included in the joint limit.
  We detail the passage from these sampled inequalities to one common set and one direction measure. Enlarge the inequalities by fixed slack and pass to finite $L$. There is a success event of probability at least $p_(*) > 0$ along a subsequence. Fix parent and reference-bin labels $\( c \, d_0^(upright("bin")) \)$ whose conditional success probability $p$ is at least $p_(*)$. No lower bound on the probability of this individual fiber is needed. Denote its conditional law by $mu$. Absorb all fixed slack into $alpha = C zeta + o \( 1 \)$, enlarging the absolute constant $C$ as necessary. On success,
  #[#set math.equation(numbering: n => "(3.14)")
   $ K^(- 2 d - alpha) lt.eq mu \( Y_b = y \) & lt.eq K^(- 2 d + alpha) \,\
K^(- 2 d - alpha) lt.eq mu \( Y_b = y divides A_(upright("bin")) = a \) & lt.eq K^(- 2 d + alpha) \,\
mu \( Y_u = y_u \) & lt.eq K^alpha L^(- 2 d_0 u) \,\
mu \( Pi = pi divides A_(upright("bin")) = a \) & gt.eq K^(- d - alpha) \, $ <eq:transverse-fiber-masses>]
  where $A_(upright("bin"))$ is the additional direction bin. These are statements about the indicated labels whenever they have any successful realization.
  Let $A$ consist of the centers of all endpoint pair cells with a successful realization in this fixed parent/reference fiber. The first line of (3.14) and total success mass at least $p$ give
  #[#set math.equation(numbering: n => "(3.15)")
   $ p K^(2 d - alpha) lt.eq \| A \| lt.eq K^(2 d + alpha) . $ <eq:transverse-common-set-size>]
  A prefix cell containing a successful endpoint has mass at most the third line of (3.14). The nested grids put all mass of that endpoint cell in its prefix. Dividing by the minimum endpoint mass bounds the number of good endpoints in that prefix. A ball of radius $r$ meets boundedly many cells at a comparable coarser tested prefix size; the finite mesh costs $K^(O \( zeta \))$. Thus, for $K^(- 1) lt.eq r lt.eq 1$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ frac(cal(N)_(K^(- 1)) \( A ∩ B \( z \, r \) \), cal(N)_(K^(- 1)) \( A \)) lt.tilde p^(- 1) K^(O \( zeta \) + o \( 1 \)) r^(d_0) . $ <eq:transverse-common-set-counts>]
  In fact the preceding argument gives $r^(2 d_0)$ before weakening the exponent and absorbing rounding. For the untested shortest prefixes the allowed power factor suffices.
  Retain bins $a$ whose conditional success probability is at least $p \/ 2$. The successful mass in these bins is at least $p \/ 2$. For each retained bin, let $A_a subset A$ be its successful endpoint cells. The conditional upper pair-cell mass gives
  $ \| A_a \| gt.eq \( p \/ 2 \) K^(2 d - alpha) \, #h(2em) \| A_a \| \/ \| A \| gt.eq \( p \/ 2 \) K^(- 2 alpha) . $
  The lower projection-cell mass in (3.14) gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ cal(N)_(K^(- 1)) #scale(x: 120%, y: 120%)[\(] pi_(tilde(a)_j \( a \)) A_a #scale(x: 120%, y: 120%)[\)] lt.eq K^(d + O \( zeta \) + o \( 1 \)) \, $ <eq:transverse-small-projections>]
  where initially $pi_(tilde(a)_j) \( z_1 \, z_j \) = z_j - tilde(a)_j z_1$. Passing to a unit vector for this projection only shrinks interval lengths.
  It remains to put a nonconcentrating probability on these directions. Restrict the actual samples to success and the retained bins, normalize, and push forward to the line spanned by $\( - tilde(a)_j \, 1 \)$. This costs at most $2 \/ p$ in mass. To estimate a slope ball, first condition on the exact point $X$ and exact reference tubes, before any restriction by the additional bin. These labels determine $\( C \, D_0 \)$, so fixing that fiber does not change the original alternative law once these exact labels are given. If that ball contains any successful alternative, the centered marginal bound at this alternative, supplied by (iii), bounds the #emph[original] alternative probability of the entire ball after a fixed radius enlargement. Choosing a coarser tested radius costs $K^(O \( zeta \) + o \( 1 \))$. Therefore its restricted mass is at most
  $ K^(O \( zeta \) + o \( 1 \)) r^(kappa_0) #h(2em) \( K^(- 1) lt.eq r lt.eq 1 \) . $
  Integrate this bound over the exact points and references under the fixed fiber, and then normalize. This operation introduces no reciprocal probability of an individual additional bin; conditional independence supplies the original alternative law at the stage where the angular estimate is used.
  All slopes have magnitude $L^(o \( 1 \))$. The sine-angle formula shows that the slopes in a projective ball of radius $r$ occupy an interval of length $r L^(o \( 1 \))$; exact-to-approximate slope errors are $K^(- 1) L^(o \( 1 \))$. Covering and radius rounding thus give, for the pushforward probability $sigma$,
  #[#set math.equation(numbering: n => "(3.18)")
   $ sigma \( B \( V \, r \) \) lt.eq K^(O \( zeta \) + o \( 1 \)) r^(kappa_0) \, #h(2em) K^(- 1) lt.eq r lt.eq 1 . $ <eq:transverse-direction-measure>]
  The coordinate range of $A$ is at most $L^(o \( 1 \))$. Rescale it into the unit ball. At resolution $K^(- 1)$ this merges or covers at most $L^(o \( 1 \))$ grid cells per ball and changes every displayed power error by $o \( 1 \)$ only. Use covering numbers after this rescaling.
  Choose $0 < rho_0 < min { d_0 \, kappa_0 }$, apply Lemma 16, and then take $zeta$ so small that every $O \( zeta \)$ error is below its tolerance and its projection gain. Equations (3.15), (3.16), and (3.18) meet its hypotheses. For every direction in the finite support of $sigma$, however, (3.17) gives a subset of the #emph[same] $A$ of relative covering number $K^(- O \( zeta \) - o \( 1 \))$ with too small a projection. The robust large-subset conclusion gives the contradiction. ◻
]

=== 3.5 Selecting angular scales and differentiating <selecting-angular-scales-and-differentiating>

The sum bound (3.11) does not say that one fixed marginal is nonconcentrated at every radius. The following finite choice of comparable scales supplies exactly what the block test needs.

#thm([Lemma 3.12.])[
  (Finite angular alternatives).  #emph[Fix $0 < d < 1$ and $d_0 > 0$. There is a fixed finite list of positive rational ratios, with minimum $c_(*) > 0$, such that for every sufficiently small rational $b_0$, almost every path has a choice $b'$ from this list times $b_0$ and a marginal $j in { 2 \, 3 }$ satisfying the angular hypothesis of Lemma 18, with spare slack, for block lengths in $\[ b' \/ 4 \, b' \]$. Each alternative has its own fixed positive $kappa_0$, tolerance, and finite relative mesh. All choices are independent of $b_0$, and remain valid under sufficiently small variations of the spatial increment parameters.]
] <lem:transverse-angular-choice>

#proof[
  First obtain a sufficiently reduced block-test tolerance $zeta_2$ for $kappa_0 = kappa \/ 4$. Choose a positive rational $c_1 lt.double kappa zeta_2$, and then a sufficiently reduced tolerance $zeta_1$ for $kappa_0 = c_1 \/ 2$. Test $h_2 \( u \) gt.eq c_1 u$ on a sufficiently fine finite rational grid from $c zeta_1 b_0$ to $b_0$, where $c > 0$ is fixed and small. If all tests pass, monotonicity fills the mesh gaps; below the first grid point nonnegativity gives the required inequality with the allowed additive error. Take $b' = b_0$ and $j = 2$.
  Otherwise some grid point $v$ satisfies $h_2 \( v \) < c_1 v$. For rational $u lt.eq v$, monotonicity and (3.11) yield
  $ h_3 \( u \) gt.eq kappa u - h_2 \( u \) > kappa u - c_1 v gt.eq kappa / 2 u quad (frac(2 c_1 v, kappa) lt.eq u lt.eq v) . $
  Take $b' = v$, $j = 3$. Because $c_1 lt.double kappa zeta_2$, the missing smaller radii meet the weaker $kappa \/ 4$ bound with additive error $zeta_2 b$ for every $b in \[ v \/ 4 \, v \]$. Small enough mesh and cutoff constants leave spare slack in both cases. The possible $v \/ b_0$ form a fixed finite list bounded away from zero. Reduce all constants once more to permit the stated small spatial variations. ◻
]

#thm([Lemma 3.13.])[
  (Binary derivative).  #emph[For almost every path, $dot(G) \( s \) in { 0 \, 1 }$ for almost every $s in \[ 0 \, 1 \]$.]
] <lem:transverse-binary>

#proof[
  Suppose otherwise. Choose $0 < d < 1$ and $0 < d_0 < d$ such that a sufficiently small neighborhood of $d$ contains $dot(G) \( s \)$ on a set of positive path-times-exponent measure. This is possible by choosing an interior point of the essential support. Apply Lemma 19 for these parameters. For dyadic $b_0 arrow.b 0$, and each of its finite alternatives, form a rational mesh of test blocks of comparable length, so that each interior exponent is contained in an appropriate block, and include each block’s finite prefix grid. Use direction precision $b_(*) = b_0$ for all alternatives. Within each size and prefix type, the candidate intervals have bounded overlap, with constants independent of $b_0$. Explicitly, choose endpoints on one lattice of spacing $q b_0$, where the positive rational $q$ is fixed below all the relative mesh tolerances, and allow all candidate lengths between $c_(*) b_0 \/ 4$ and $b_0$. A point belongs to at most $O \( q^(- 2) \)$ such candidates. Every tested prefix is contained in its candidate, and the number of prefix types is fixed. Color each of these interval families into finitely many disjoint lists.
  Let $cal(C)_I$ be the sum of all reference, replacement, and extra-bin costs used by candidate block $I$. By Lemma 13,
  #[#set math.equation(numbering: n => "(3.19)")
   $ sum_I bb(E) cal(C)_I lt.tilde b_0 . $ <eq:transverse-mesh-cost>]
  All candidate lengths lie between fixed positive multiples of $b_0$. For the nonnegative function
  $ R_(b_0) \( omega \, s \) = sum_(I in.rev s) cal(C)_I \( omega \) \/ b_0 $
  we have $bb(E) integral_0^1 R_(b_0) \( omega \, s \) thin d s lt.tilde b_0$: integration cancels the normalizing block length. Dyadic summability therefore gives $R_(b_0) arrow.r 0$ almost everywhere. In particular, all tested costs in a block containing such an $s$ are $o \( b_0 \)$.
  At a differentiability point $s$, the approximation $G \( y \) = G \( s \) + dot(G) \( s \) \( y - s \) + o \( b_0 \)$ is uniform for $\| y - s \| lt.eq C b_0$. Hence all increments and finitely many prefix increments in these nearby blocks are approximated to $o \( b_0 \)$. If $dot(G) \( s \)$ lies in the chosen sufficiently small neighborhood of $d$, the spatial hypotheses of the block test hold eventually, with its reduced tolerance. An angular alternative supplies its angular hypotheses, and the preceding cost estimate supplies the remaining ones. Only countably many fixed rational blocks and finite tests are involved. Positive path-times-exponent measure therefore implies that one fixed test holds on a positive-probability event, contradicting Lemma 18. A countable cover of interior derivative values proves the claim. ◻
]

=== 3.6 Hills and finitely many jumps <hills-and-finitely-many-jumps>

Write $E = { s : dot(G) \( s \) = 1 }$ for a path satisfying Lemma 20. Equations (3.7) and (3.10) give

#[#set math.equation(numbering: n => "(3.20)")
 $ \| E \| = 2 / 3 \, #h(2em) 3 \| E ∩ \[ 0 \, s \] \| gt.eq 2 s quad \( 0 lt.eq s lt.eq 1 \) . $ <eq:transverse-full-set>]

We next exclude infinitely many changes from a full scale interval to an empty one. The block test applies to the balanced intervals created at such changes, even though their derivatives themselves are binary.

#thm([Lemma 3.14.])[
  (Balanced subintervals inside a hill).  #emph[Let $G$ be Lipschitz with derivative $upright(bold(1))_E$, and let $a < b$ be respectively a density point of $E$ and of its complement. There is a positive number $b_(upright("hill"))$ such that, for every $0 < r < b_(upright("hill"))$, some $\[ x \, y \] subset \( a \, b \)$ has 
$ r lt.eq y - x lt.eq 2 r \, #h(2em) G \( y \) - G \( x \) = 1 / 2 \( y - x \) \, #h(2em) G \( x + u \) - G \( x \) gt.eq 1 / 2 u quad \( 0 lt.eq u lt.eq y - x \) . $

 For any fixed finite collection of disjoint ordered density pairs, these intervals can be chosen disjointly at every sufficiently small common $r$.]
] <lem:transverse-hills>

#proof[
  Put $H \( s \) = G \( s \) - s \/ 2$. The density conditions give positive right slope at $a$ and a positive drop towards $b$ from the left. Thus $max_(\[ a \, b \]) H$ exceeds both $H \( a \)$ and $H \( b \)$: if the larger endpoint is $a$ use its right increase, and if it is $b$ use its left increase. A component of a suitable strict superlevel set therefore gives a closed hill $\[ a' \, b' \] subset \( a \, b \)$ with equal endpoint heights and strictly larger values inside.
  Fix $r < b' - a'$. Among levels having a closed subinterval of this hill of length at least $r$, with both endpoints at the level and values no smaller inside, take the highest. Such a level exists: the admissible triples of level and endpoints form a nonempty compact set. At the maximizing level $h$ take an admissible interval $\[ c \, d \]$. No component on which $H > h$ inside it has length greater than $r$, since such a component contains an interval of length at least $r$ closed off at a slightly higher level. The closed set ${ H = h } ∩ \[ c \, d \]$ thus contains both endpoints and has no gap longer than $r$. Starting at $c$, take its first point at or after $c + r$. Its distance from $c$ is between $r$ and $2 r$. Between these two points $H gt.eq h$, which gives the asserted total and prefix identities for $G$. Apply this construction separately inside finitely many disjoint hills to obtain the final assertion. ◻
]

#thm([Lemma 3.15.])[
  (Finite alternation and a full-to-empty jump).  #emph[Almost surely $E$ agrees modulo null sets with a finite union of intervals and has an interior transition from an interval of full measure to an interval of zero measure. For every fixed $eta > 0$ there is a rational block $\[ s \, s + b \]$, $0 < b < u_0$, on an event of positive probability, such that 
#[#set math.equation(numbering: n => "(3.21)")
 $ G \( s + b \) - G \( s \) = b / 2 + O \( eta b \) \, #h(2em) G \( s + b \/ 2 \) - G \( s \) = b / 2 + O \( eta b \) . $ <eq:transverse-jump-block>]

 The absolute error constants can be fixed independently of $eta$.]
] <lem:transverse-finite-jumps>

#proof[
  Suppose a path has arbitrarily many disjoint ordered density pairs of the type in Lemma 21. Use the angular alternatives for $d = 1 \/ 2$, $d_0 = 1 \/ 4$ at dyadic $b_0 arrow.b 0$. For its successful angular size $b' asymp b_0$, choose the balanced intervals with lengths between $b' \/ 3$ and $2 b' \/ 3$. Round their endpoints to a sufficiently fine fixed relative rational mesh. Lipschitz continuity preserves the endpoint and finite prefix requirements of the block test with spare slack. For any prescribed number of disjoint density pairs this produces that many distinct spatially and angularly successful candidates at every sufficiently small $b_0$; the rounding preserves distinctness inside their separate hills.
  Consider all mesh candidates for the fixed finite list of angular alternatives, and all their prefix and direction costs, with $b_(*) = b_0$. Equation (3.19) still holds. A failure of a candidate’s cost test requires one nonnegative cost at least a fixed positive multiple of $b_0$. Hence the expected number $N_(b_0)$ of such failures is bounded uniformly in $b_0$. Every spatially and angularly successful candidate must fail a cost test almost surely, by Lemma 18 and the countability of the mesh collection. On the paths just considered, $N_(b_0) arrow.r oo$. Fatou’s lemma contradicts their having positive probability, because $liminf bb(E) N_(b_0) < oo$.
  Thus the number of alternations among density points of $E$ and of its complement is bounded on almost every path. To see the finite-interval conclusion directly, assign to each ordered density point the maximum length of an alternating sequence ending there. These integers are bounded, nondecreasing along the ordered density points, and strictly increase when the type changes. Each integer level therefore has one type and occupies an ordered interval. The Lebesgue density theorem gives the asserted finite union modulo null sets.
  The prefix inequality in (3.20) rules out an initial interval of zero measure, while $\| E \| = 2 \/ 3 < 1$ forces a subsequent nonempty interval of zero measure. There is therefore an interior full-to-empty jump. Around that jump choose a short block whose midpoint differs from the jump by at most $eta b$, with its left and right halves inside the adjacent full and empty intervals except for that discrepancy. Rational endpoints can be chosen with $b < u_0$, giving (3.21). The countable family of rational blocks covers almost all paths; some fixed block has positive success probability. No direction cost is needed in this choice. ◻
]

=== 3.7 The partitioning contradiction <the-partitioning-contradiction>

A full-to-empty information jump says that almost all spatial branching occurs in the first half of a block. At its endpoint, each midpoint cell contains very few eligible descendants. We now combine this with the angular law by drawing two endpoints on the same tube.

#thm([Lemma 3.16.])[
  (No full-to-empty block).  #emph[For sufficiently small fixed $eta > 0$, the positive-probability configuration in (3.21) is impossible.]
] <lem:transverse-no-jump>

#proof[
  Fix such a rational block and put $K = L^b$. By (3.10) and the chain rule, its endpoint and midpoint information increments for $X$ are both $3 b \/ 2 + O \( eta b \)$, while the conditional endpoint increment given $T = T_1$ is $b \/ 2 + O \( eta b \)$. Pass to finite $L$ with fixed slack, and fix a parent $C = X_s = c$ with conditional success probability bounded below by a constant $p_(*) > 0$ along the sequence. Write
  $ p_c \( z \) = bb(P) \( X_(s + b) = z divides C = c \) \, #h(2em) q_T \( z \) = bb(P) \( X_(s + b) = z divides T \, C = c \) . $
  Call an incidence $\( T \, z \)$ good if it has at least one realization in the success event. Let $cal(Z)$ be all endpoint labels with a good incidence, represented by their centers in rescaled parent coordinates. Every such endpoint satisfies
  #[#set math.equation(numbering: n => "(3.22)")
   $ K^(- 3 \/ 2 - O \( eta \)) lt.eq p_c \( z \) lt.eq K^(- 3 \/ 2 + O \( eta \)) \, #h(2em) q_T \( z \) lt.eq K^(- 1 \/ 2 + O \( eta \)) quad upright("for a good ") \( T \, z \) . $ <eq:transverse-good-masses>]
  Its midpoint cell has marginal mass at most $K^(- 3 \/ 2 + O \( eta \))$. These estimates depend only on the displayed labels, so they remain true after defining goodness by existence of a successful realization. In particular
  #[#set math.equation(numbering: n => "(3.23)")
   $ \| cal(Z) \| lt.eq K^(3 \/ 2 + O \( eta \)) \, #h(2em) \# \( cal(Z) ∩ B \( z \, C K^(- 1 \/ 2) \) \) lt.eq K^(O \( eta \)) $ <eq:transverse-good-counts>]
  for every fixed $C$. For the second bound divide the midpoint mass upper bound by the endpoint mass lower bound, then cover a ball by boundedly many midpoint cells. The central line of a tube with a good incidence passes within $delta = K^(- 1) L^(o \( 1 \))$ of the endpoint center. The parent has a fixed bounded diameter in these coordinates.
  Choose a small fixed $epsilon > 0$, and set $P = K^(1 \/ 2 - epsilon)$. Polynomial partitioning in $bb(R)^3$ [15] Theorem 4.1 gives a nonzero polynomial of degree $D lt.tilde P$ whose complementary open cells each contain at most
  #[#set math.equation(numbering: n => "(3.24)")
   $ O \( \| cal(Z) \| \/ P^3 \) = K^(3 epsilon + O \( eta \)) $ <eq:transverse-partition-occupancy>]
  of the centers. Take a wall of thickness a sufficiently large constant times $delta$ about its zero set. At midpoint resolution $r = K^(- 1 \/ 2)$, the number of boxes meeting the wall is
  #[#set math.equation(numbering: n => "(3.25)")
   $ O \( D r^(- 2) + D^2 r^(- 1) + D^3 \) = O \( P K \) . $ <eq:transverse-wall-count>]
  Indeed $delta = o \( r \)$. Intersect the zero set with a fixed ball strictly larger than the bounded parent; every wall point relevant to that parent is within the required distance of this restricted zero set. Wongkew’s hypersurface neighborhood-volume bound [27] Main Theorem, p. 178, thickened to scale comparable to $r$ in that fixed enlarged ball, is $O \( D r + D^2 r^2 + D^3 r^3 \)$. Divide by the disjoint box volume $r^3$. The degree condition $D lt.tilde K^(1 \/ 2 - epsilon)$ makes all three terms in (3.25) at most $O \( P K \)$.
  By (3.22)–(3.23), the marginal mass of good endpoints lost to the wall is at most
  #[#set math.equation(numbering: n => "(3.26)")
   $ O \( P K \) thin K^(O \( eta \)) K^(- 3 \/ 2 + O \( eta \)) = K^(- epsilon + O \( eta \)) . $ <eq:transverse-wall-mass>]
  Take $eta$ small compared with $epsilon$, so this tends to zero. The enlarged wall ensures that the nearby central-line point of each surviving incidence lies in the same open cell as its endpoint center. A line outside the polynomial zero set crosses it at most $D$ times, and hence visits at most $D + 1 = O \( P \)$ open cells. A line contained in the zero set has no off-wall incidence. Thus every tube’s good off-wall endpoints lie in at most $O \( P \)$ open cells.
  Draw $T$ with its original marginal given $C = c$, then draw $z \, z'$ independently with law $q_T$. Let $g \( T \)$ be the $q_T$ mass of good off-wall endpoints. Its mean is at least $p_(*) \/ 2$ for large $K$. Conditional on $T$, Cauchy–Schwarz over its at most $O \( P \)$ open cells gives probability at least $g \( T \)^2 \/ O \( P \)$ that both draws are good off-wall and belong to the same open cell. Jensen’s inequality therefore gives the unconditional lower bound
  #[#set math.equation(numbering: n => "(3.27)")
   $ bb(P) { z \, z' upright(" good off-wall in the same cell") divides C = c } gt.tilde P^(- 1) = K^(- 1 \/ 2 + epsilon) . $ <eq:transverse-pair-lower>]
  We bound this probability from above by separating near and far pairs.
  For $\| z - z' \| lt.tilde K^(- 1 \/ 2)$, the second bound in (3.23) gives at most $K^(O \( eta \))$ possible good second endpoints. Each costs $K^(- 1 \/ 2 + O \( eta \))$ under $q_T$, so near pairs contribute at most
  #[#set math.equation(numbering: n => "(3.28)")
   $ K^(- 1 \/ 2 + O \( eta \)) . $ <eq:transverse-near-pairs>]
  For a farther pair, a tube meeting both endpoint centers to error $delta$ must have direction within $O \( delta K^(1 \/ 2) \) = K^(- 1 \/ 2 + o \( 1 \))$ of their joining line, allowing two signs.
  The conditioning at this point is essential. Under the double sampling,
  $ bb(P) \( T \, z \, z' divides C = c \) = bb(P) \( T divides C = c \) q_T \( z \) q_T \( z' \) . $
  Thus its $\( T \, z \)$ marginal is the original joint distribution given $C = c$. Conditional on the first endpoint $z$, the tube law is
  #[#set math.equation(numbering: n => "(3.29)")
   $ bb(P) \( T in cal(A) divides z \, C = c \) = sum_(p : X_(s + b) \( p \) = z) bb(P) \( X = p divides z \, C = c \) bb(P) \( T in cal(A) divides X = p \) . $ <eq:transverse-posterior-tube-law>]
  The parent is determined by $z$, and $X$ determines all these spatial labels. Equation (3.5) therefore applies to every inner law. Use the slightly coarser rational angular scale $L^(- b \/ 3) = K^(- 1 \/ 3)$, which covers the above cap for large $L$ and has $b \/ 3 < u_0$. For every fixed far pair the resulting angular probability is at most
  $ K^(- kappa \/ 3 + o \( 1 \)) . $
  For each first endpoint, (3.24) allows at most $K^(3 epsilon + O \( eta \))$ same-open-cell second endpoints. Each good second incidence costs an additional $K^(- 1 \/ 2 + O \( eta \))$ under its original $q_T$ law. For each first $z$ this list is fixed before the tube is drawn. In the integral over the original law of $T$ given $z \, C$, apply the bound on $q_T \( z' \)$ only where $\( T \, z' \)$ is good, and apply the angular cap bound to the resulting indicator. Sum over the fixed list of $z'$ and then over the first-endpoint law in (3.29). The total far-pair contribution is at most
  #[#set math.equation(numbering: n => "(3.30)")
   $ K^(- 1 \/ 2 - kappa \/ 3 + 3 epsilon + O \( eta \) + o \( 1 \)) . $ <eq:transverse-far-pairs>]
  No angular regularity after conditioning on the success event has been used; success only restricts the pairs to which the original mass bounds apply.
  Divide (3.28) and (3.30) by (3.27). The respective ratios are bounded by
  $ K^(- epsilon + O \( eta \)) \, #h(2em) K^(- kappa \/ 3 + 2 epsilon + O \( eta \) + o \( 1 \)) . $
  Choose $epsilon > 0$ sufficiently small relative to $kappa$, then $eta > 0$ sufficiently small relative to $epsilon$. Both ratios tend to zero, contradicting (3.27). ◻
]

#prodef([Remark 3.17.])[
  (A grid proof of the wall count).  Retain the notation of the proof of Lemma 23. For comparison, the same wall count follows from a generic grid of spacing $r$. A component wholly contained inside a grid box costs at most $O \( D^3 \)$ boxes by the real algebraic component bound [27] Lemma (C), p. 181. All other intersections are counted on grid faces. On each generic grid plane the curve meets $O \( D r^(- 1) + D^2 \)$ squares: intersections with grid lines cost $O \( D r^(- 1) \)$, and components wholly inside squares cost $O \( D^2 \)$. There are $O \( r^(- 1) \)$ relevant planes, giving $O \( D r^(- 2) + D^2 r^(- 1) + D^3 \)$. A bounded enlargement covers near-wall boxes. The volume argument above already includes singular zero sets and suffices for the estimate.
]

#proof[
  A countersequence gives the weighted tube configuration by Lemma 10. Its limiting information profiles satisfy (3.10). Lemma 20 makes the common derivative binary, and Lemma 22 supplies a positive-probability full-to-empty block for any prescribed fixed small tolerance. Lemma 23 rules out such a block. Hence no countersequence exists, which proves the existence of the fixed power $c > 0$ and the large-scale threshold. ◻
]

== 4 A sparse estimate for packet arrays <sec:sparse>

The transverse saving has a useful consequence for arrays whose individual packets see little measure. The broad–narrow decomposition follows the framework of Bourgain–Guth [6] Section 2 and its fractal restriction implementation in Du–Zhang [13] Section 3; the parabolic rescaling below also preserves packet sparsity. Broad contributions gain a power by Proposition 8; when the iteration stops, the sparsity condition supplies the gain through the refined fractal estimate.

#thm([Proposition 4.1.])[
  (Sparse packet estimate).  #emph[There is an absolute constant $c_s > 0$ with the following property. Fix $tau_0 > 0$, and let $L^(tau_0) lt.eq D lt.eq L$. Let $U$ be a finite packet array of the form (2.2), with coefficient vector $c$, and let $mu$ be a nonnegative measure such that 
$ mu \( B \( z \, r \) \) lt.eq m r^2 quad \( r gt.eq 1 \) \, #h(2em) "supp" mu subset { \| t \| lt.eq C L^2 } . $

 Assume the packet sparsity condition (2.4), with $M = 100$, for every label with nonzero coefficient. Then 
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(q upright(" a unit lattice cube")) mu \( q \)^(2 \/ 3) sup_q \| U \|^2 lt.tilde_(tau_0) m^(2 \/ 3) L^(4 \/ 3) D^(- c_s) parallel c parallel_(ell^2)^2 . $ <eq:src7>]

 Only finitely many uniform profile derivative bounds, depending on $tau_0$, are required. Consequently the same assertion holds for any prescribed finite set of field derivatives, provided the original profiles have sufficiently many bounded derivatives. Fixed enlargements of the time range and restriction to a submeasure are allowed. The exponent $c_s$ is independent of $tau_0$; the implicit constant and the required differentiability need not be.]
] <prop:sparse>

The proof is divided into the exact-field reduction, a broad estimate, and the rescaling iteration. All bounds on packet classes and frequency boxes are fixed throughout. Zero measures and zero coefficient vectors are immediate, so normalization by their sizes is legitimate.

=== 4.1 A local norm and an exact-field reduction <a-local-norm-and-an-exact-field-reduction>

Choose a dyadic integer $K asymp L^beta$, with $beta > 0$ to be specified at the end. For a measure $nu$ define

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(T)_nu \( V \) = sum_(Q upright(" a ") K^2 upright("-cube")) nu \( Q \)^(2 \/ 3) parallel V parallel_(L^6 \( Q \))^2 . $ <eq:sparse-functional>]

The cubes form a fixed half-open grid; taking suprema on their closures does not change any estimate. The quantity $cal(T)_nu \( V \)^(1 \/ 2)$ is a seminorm, namely the $ell^2$ norm of $nu \( Q \)^(1 \/ 3) parallel V parallel_(L^6 \( Q \))$. This observation will allow us to use Minkowski’s inequality for superpositions of exact extensions.

It suffices first to bound (4.2) by the right-hand side of (4.1), with $mu$ restricted to a spatial box of side $O \( L^2 \)$. Indeed, the three-dimensional unit-cube Sobolev inequality and Hölder’s inequality give, for a fixed finite set of multiindices $a$,

#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(q subset Q) mu \( q \)^(2 \/ 3) sup_q \| U \|^2 & lt.tilde sum_a sum_(q subset Q) mu \( q \)^(2 \/ 3) (integral_q \| partial^a U \|^6)^(1 \/ 3)\
 & lt.tilde sum_a mu \( Q \)^(2 \/ 3) (integral_Q \| partial^a U \|^6)^(1 \/ 3) . $ <eq:sparse-sobolev>]

The dyadic $K^2$-grid is nested with the unit grid, and the Sobolev inequality on a cube controls the supremum on its closure, so no boundary enlargement is needed in this calculation. Differentiating an atom in (2.2) produces only bounded carrier-frequency factors and native profile derivatives multiplied by bounded powers of $L^(- 1)$. It therefore gives another finite sum of atoms in the same class, with the same labels and comparable coefficient energy. Applying the $cal(T)$ estimate to these differentiated arrays proves the desired unit-cube statement.

For this reduction, first localize the original compact packets to spatial boxes of side $L^2$. On the stipulated time interval, one such packet meets only boundedly many enlarged boxes, since its velocity is bounded. Thus the energies of the retained arrays sum with bounded overlap. This justifies summing the spatially localized estimates and also the treatment of boundary cubes in (4.3).

The compact profiles are convenient for this first localization but are not themselves exact Schrödinger extensions. The following construction passes to exact fields once, before the iteration.

#thm([Lemma 4.2.])[
  (Exact Fourier layers).  #emph[Fix a bounded native time interval $\| sigma \| lt.eq C_(upright("nat"))$, any finite number of profile seminorms on that interval, and any prescribed finite spatial decay orders there. After requiring sufficiently many derivatives of the compact profiles, an array of atoms in (2.2) is a sum-integral of exact extension arrays, indexed by $k in bb(Z)^2$ and $u in bb(R)$, times a common phase $e^(i u t \/ L^2)$. There are nonnegative common weights $w \( k \, u \)$, with 
$ sum_k integral_(bb(R)) w \( k \, u \) thin d u < oo \, $

 such that division by $w \( k \, u \)$ gives all the stipulated uniform seminorm and decay bounds. For every subarray $A$ the frequency input $v_(A \, k \, u)$ of its layer satisfies 
#[#set math.equation(numbering: n => "(4.4)")
 $ parallel v_(A \, k \, u) parallel_2^2 lt.eq C w \( k \, u \)^2 sum_(alpha in A) \| c_alpha \|^2 . $ <eq:sparse-layer-energy>]

 Its exact frequencies lie within $O \( L^(- 1) \)$ of $omega_alpha + k \/ L$ for the corresponding labels.]
] <lem:sparse-layers>

#proof[
  Use the Fourier transform in all native variables $\( y \, sigma \) in bb(R)^3$, and choose a smooth partition of unity $sum_(k in bb(Z)^2) rho \( eta - k \) = 1$, with $rho$ supported in $\[ - 2 \, 2 \]^2$. With
  $ a_(alpha \, k \, u) \( eta \) = rho \( eta - k \) hat(H)_alpha \( eta \, u - \| eta \|^2 \) \, $
  Fourier inversion followed by $u = zeta + \| eta \|^2$ gives the exact identity
  #[#set math.equation(numbering: n => "(4.5)")
   $ H_alpha \( y \, sigma \) = \( 2 pi \)^(- 3) sum_k integral_(bb(R)) e^(i u sigma) [integral_(bb(R)^2) e^(i \( y dot.op eta - sigma \| eta \|^2 \)) a_(alpha \, k \, u) \( eta \) thin d eta] d u . $ <eq:sparse-native-layers>]
  The carrier phase combines with the inner phase according to
  #[#set math.equation(numbering: n => "(4.6)")
   $ x dot.op omega_alpha - t \| omega_alpha \|^2 + frac(x - b_alpha - 2 omega_alpha t, L) dot.op eta - t / L^2 \| eta \|^2 & = x dot.op \( omega_alpha + eta \/ L \) - t \| omega_alpha + eta \/ L \|^2 - b_alpha dot.op eta \/ L . $ <eq:sparse-exact-phase>]
  Thus, with $E v \( x \, t \) = integral e^(i \( x dot.op xi - t \| xi \|^2 \)) v \( xi \) thin d xi$, the exact datum for one packet in a fixed layer is
  #[#set math.equation(numbering: n => "(4.7)")
   $ v_(alpha \, k \, u) \( xi \) = L thin a_(alpha \, k \, u) #scale(x: 120%, y: 120%)[\(] L \( xi - omega_alpha \) #scale(x: 120%, y: 120%)[\)] e^(- i b_alpha dot.op \( xi - omega_alpha \)) . $ <eq:sparse-layer-datum>]
  The factor $L$ makes its $L^2$ norm equal to $parallel a_(alpha \, k \, u) parallel_2$; the inverse Jacobian $L^(- 2)$ then produces the atom’s prefactor $L^(- 1)$ in the extension field.
  Compact support and sufficiently many derivatives of $H_alpha$ give any prescribed finite collection of rapidly decaying bounds for its Fourier transform and its derivatives. Differentiating $hat(H)_alpha \( eta \, u - \| eta \|^2 \)$ introduces only polynomial factors in $eta$. On $eta in k + \[ - 2 \, 2 \]^2$ these, including the case $\| u \| asymp \| k \|^2$, are absorbed by taking more original derivatives. Explicitly, on this support,
  $ \( 1 + \| k \| \)^P \( 1 + \| u \| \)^P lt.eq C_P #scale(x: 120%, y: 120%)[\(] 1 + \| eta \| + \| u - \| eta \|^2 \| #scale(x: 120%, y: 120%)[\)]^(3 P) . $
  After fixing the desired seminorms, the spatial decay orders, and $C_(upright("nat"))$, differentiation and integration by parts introduce only an additional factor $\( 1 + \| k \| \)^B$ for a fixed finite $B$. Taking the original Fourier decay order larger than $3 P + B$ therefore permits, for any subsequently specified large finite $P$, the common weight
  $ w \( k \, u \) = C_P \( 1 + \| k \| \)^(- P) \( 1 + \| u \| \)^(- P) \, $
  so that the desired derivatives of $a_(alpha \, k \, u) \/ w \( k \, u \)$ are uniformly bounded. On the fixed bounded native time interval, integration by parts in $eta$ also gives the required finite-order spatial decay for the bracket in (4.5), after division by the same weight. Derivatives of $e^(- i sigma \| eta \|^2)$ cost polynomial powers of $k$, already included in $B$. This also absorbs the displacement $y tilde.eq 2 sigma k$ of a layer’s own propagated center: spatial decay is asserted after normalization by the weight chosen for the prescribed decay order. In particular these exact packet fields decay about the original label trajectories to any prescribed finite order, uniformly in the layer after normalization.
  For completeness, the energy bound uses the full phase-space separation, not bounded multiplicity of frequencies alone. In the Gram matrix of (4.7), the entry indexed by $alpha \, tilde(alpha)$ vanishes unless $L \| omega_alpha - omega_(tilde(alpha)) \| lt.eq C$, since the same $k$ occurs in both frequency cutoffs. On an overlap, integration by parts in the rescaled frequency variable gives, for any fixed large $N$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| chevron.l v_(alpha \, k \, u) \, v_(tilde(alpha) \, k \, u) chevron.r \| lt.eq C_N w \( k \, u \)^2 upright(bold(1))_({ L \| omega_alpha - omega_(tilde(alpha)) \| lt.eq C }) (1 + frac(\| b_alpha - b_(tilde(alpha)) \|, L))^(- N) . $ <eq:sparse-gram>]
  The bounded number of labels in every unit phase-space ball makes each row and column summable. Schur’s test proves (4.4), for an arbitrary subarray as well as for the entire array. ◻
]

We may therefore prove the $cal(T)$ estimate for the normalized exact arrays of Lemma 26. The phase $e^(i u t \/ L^2)$ is common to an entire layer and has modulus one, so it does not change $cal(T)$ at the root. Minkowski’s inequality and the summability of $w$ return the estimate for the original array. If derivatives are needed in (4.3), differentiate the compact atoms #emph[before] this reduction; no differentiation of an exterior layer phase inside the iteration is needed.

Fix a very small $gamma > 0$ later. Layers with $\| k \| > L^gamma$ can be discarded with an arbitrarily small negative-power error, by increasing $P$ and the number of original derivatives. To see uniformity, normalize $m = parallel c parallel_(ell^2) = 1$ and use the spatial restriction already made. The number of relevant cells, their total mass, and a trivial bound for the functional are polynomial in $L$; (4.4) and the bounded area of each layer’s frequency support give a uniform field supremum bound after normalization. The tail sum of $w$ beats any of these fixed polynomial factors. Homogeneity restores general $m \, c$. Henceforth fix one retained layer and suppress $k \, u \, w$ from the notation.

=== 4.2 The iteration and broad saving <the-iteration-and-broad-saving>

We first specify the scales at which the next estimates will be used. A child retains one frequency square of side $K^(- 1)$ and applies the cap rescaling in (2.5). At depth $j$ set $h = K^j$ and $s = L \/ h$, and divide out the accumulated field factor $h^(- 1)$. The transformed labels occupy a fixed bounded square. The native variables, native time bounds, and uniform profile bounds are unchanged.

Stop at the last scale before the next division by $K$ would go below $D^(1 \/ 2)$. Thus every scale satisfies $s gt.eq D^(1 \/ 2)$, and terminal scales satisfy

#[#set math.equation(numbering: n => "(4.9)")
 $ D^(1 \/ 2) lt.eq s < K D^(1 \/ 2) . $ <eq:sparse-terminal-scale>]

The depth $J$ is bounded by a constant depending on $beta$. The broad estimate below is stated independently of this stopping rule; the terminal estimate will use it together with packet sparsity.

At current packet size $s$, partition the bounded square of label frequencies into $K^(- 1)$-squares $theta$, and write $V = sum_theta V_theta$. Each $V_theta$ is exact. Its frequencies are in its label square, enlarged by $O \( s^(- 1) \)$, plus the common shift $k \/ s$. We will always have $s gt.double K^2$ and $\| k \| \/ s = o \( 1 \)$. For a fixed sufficiently large absolute $A$, call $theta$ active on $Q$ if

#[#set math.equation(numbering: n => "(4.10)")
 $ parallel V_theta parallel_(L^6 \( Q \)) gt.eq K^(- A) parallel V parallel_(L^6 \( Q \)) . $ <eq:sparse-active>]

There are $O \( K^2 \)$ squares. Thus the inactive sum has norm at most $C K^(2 - A) parallel V parallel_(L^6 \( Q \))$, which is absorbed by choosing $A$ once and for all.

There is a fixed large $C_0$ such that either all active centers lie within $C_0 \/ K$ of a line, or three active squares have direction determinant at least $c K^(- 2)$ throughout their exact supports. Indeed, choose a farthest pair of active centers. If another center lies outside the indicated strip about their line, the resulting triangle has area at least a constant times $K^(- 2)$. More precisely its height is at least $C_0 \/ K$, and its base is at least as long as this height. Changing each vertex by $O \( K^(- 1) \)$ changes its doubled area by at most a fixed constant times the base length divided by $K$; large $C_0$ preserves a fixed portion of the area. The identity between triangle area and the determinant of $\( 2 xi_i \, 1 \)$, and the bounded frequency range, give the claim also for normalized directions. A common frequency translation does not change the unnormalized determinant. Call the two alternatives #emph[narrow] and #emph[broad], respectively.

#thm([Lemma 4.3.])[
  (Broad saving).  #emph[There is an absolute $c_b > 0$ such that, whenever $K lt.eq s^(c_b)$, the broad part of the functional in a ball of radius $O \( s^2 \)$ satisfies 
#[#set math.equation(numbering: n => "(4.11)")
 $ sum_(Q upright(" broad")) nu \( Q \)^(2 \/ 3) parallel V parallel_(L^6 \( Q \))^2 lt.tilde s^(- c_b) m_0^(2 \/ 3) s^(4 \/ 3) cal(E) . $ <eq:sparse-broad>]

 Here $nu \( B \( z \, r \) \) lt.eq m_0 r^2$ for $r gt.eq 1$, and the exact frequency data for $V$ and each $V_theta$ have $L^2$ norms at most $C cal(E)^(1 \/ 2)$. The implicit constant can depend on this fixed $C$ but $c_b$ does not depend on packet differentiability.]
] <lem:sparse-broad>

#proof[
  Suppose no positive $c_b$ works. After normalizing $m_0 = cal(E) = 1$ and dividing all fields by a fixed bound for their input norms, this gives a sequence $s arrow.r oo$, with $K = s^(o \( 1 \))$, for which the broad sum is at least $s^(4 \/ 3 - o \( 1 \))$. Fixed constants in the radius, support box and norm bounds are harmless. There are polynomially many cubes, and the fields have bounded supremum by Cauchy–Schwarz in frequency. We may discard polynomially tiny mass and field levels, and then pigeonhole one active triple and dyadic values
  $ nu \( Q \) asymp chi \, #h(2em) parallel V parallel_(L^6 \( Q \)) asymp b $
  on $N$ cubes. The number of triples and all factors lost here are $K^(O \( 1 \))$ or logarithmic, hence $s^(o \( 1 \))$. We obtain
  #[#set math.equation(numbering: n => "(4.12)")
   $ chi^(2 \/ 3) b^2 N gt.eq s^(4 \/ 3 - o \( 1 \)) \, #h(2em) chi lt.eq s^(o \( 1 \)) \, #h(2em) chi N lt.tilde s^4 . $ <eq:sparse-saturation-bounds>]
  The last two statements follow respectively from the ball bound on a $K^2$-cube and on the ambient ball.
  We explain carefully the fourth inequality, furnished by multilinear restriction. Each chosen factor has $L^6 \( Q \)$ norm at least $K^(- A) b$, so some unit cube in $Q$ has supremum at least $K^(- A - 1) b$: here $\| Q \|^(1 \/ 6) = K$. For each of the three factors, choose one such unit cube. Pigeonholing their three relative integer positions within $Q$ leaves a common triple of offsets, with cost $K^(O \( 1 \))$. Translate the three fields separately by these fixed offsets. They now all have supremum at least $b thin s^(- o \( 1 \))$ on the same unit cube attached to each surviving $Q$. These attached cubes are disjoint. Translation only modulates the frequency inputs and preserves both their norms and their supports.
  The separate-supremum version of Lemma 9 therefore yields
  #[#set math.equation(numbering: n => "(4.13)")
   $ b^3 N lt.eq s^(o \( 1 \)) . $ <eq:sparse-product-count>]
  Equivalently, this use of the lemma follows by applying a rapidly decreasing reproducing kernel to each factor separately, integrating the product on each attached cube, and averaging the trilinear integral bound over the three independent shifts. For every fixed triple of shifts the integration domain is the same and the inputs are exact with unchanged supports and norms. The determinant lower bound is $K^(- 2) = s^(- o \( 1 \))$, precisely the regime of that lemma. Thus an unspecified dependence of a multilinear constant on transversality is not being used here.
  The four inequalities force saturation of all three sizes. For clarity, write $\( x \, y \, n \)$ for limiting base-$s$ logarithms of $\( chi \, b \, N \)$, passing to a subsequence if needed. The retained levels and the first inequality give polynomial bounds, so such subsequences exist. Equations (4.12) and (4.13) imply
  $ x lt.eq 0 \, #h(2em) x + n lt.eq 4 \, #h(2em) 3 y + n lt.eq 0 \, #h(2em) 2 x + 6 y + 3 n gt.eq 4 . $
  Consequently
  $ 4 lt.eq 2 x + 6 y + 3 n lt.eq 2 x + n lt.eq 4 + x lt.eq 4 . $
  Equality holds throughout, giving $x = 0$, $n = 4$, and $y = - 4 \/ 3$. In the original sequence this says
  #[#set math.equation(numbering: n => "(4.14)")
   $ chi = s^(o \( 1 \)) \, #h(2em) N = s^(4 + o \( 1 \)) \, #h(2em) b = s^(- 4 \/ 3 + o \( 1 \)) . $ <eq:sparse-saturated>]
  In particular the needed lower bounds are $chi gt.eq s^(- o \( 1 \))$, $N gt.eq s^(4 - o \( 1 \))$ and $b gt.eq s^(- 4 \/ 3 - o \( 1 \))$.
  The attached unit cubes also have the required ball counting bound. If their locations lie in a radius-$r$ ball, their associated full $K^2$-cubes lie in a ball of radius $r + C K^2$. Each associated cube has mass at least $s^(- o \( 1 \))$, and they are disjoint. For $r gt.eq 1$ their number is therefore at most
  $ s^(o \( 1 \)) \( r + C K^2 \)^2 lt.eq s^(o \( 1 \)) r^2 . $
  The three translated exact fields, the cubes in (4.14), and the determinant bound thus contradict Proposition 8. A fixed enlargement of the ambient ball can be removed by replacing $s$ by a fixed multiple and absorbing the constants into the subpower factors.
  This contradiction supplies an absolute positive $c_b$, reducing it if necessary so that the same exponent appears in both its hypothesis and its conclusion. The argument used only the maximum of the total input norm and the individual subfield input norms. Normalizing by that maximum preserves activity ratios. Thus it is uniform for exact fields and its exponent is independent of the high decay orders used to localize packet arrays later. ◻
]

=== 4.3 Narrow decoupling and the child measure <narrow-decoupling-and-the-child-measure>

We record the narrow estimate with its measure transformation, since the latter is what allows sparsity to survive the iteration. For any fixed sufficiently large decay order $N_0$, write

$ w_Q \( z \) = (1 + frac(\| z - z_Q \|, K^2))^(- N_0) . $

On a narrow cube, parabola decoupling gives

#[#set math.equation(numbering: n => "(4.15)")
 $ parallel V parallel_(L^6 \( Q \))^2 lt.tilde_epsilon.alt K^epsilon.alt sum_theta parallel V_theta parallel_(L^6 \( w_Q \))^2 . $ <eq:sparse-narrow-decoupling>]

Here the sum can include all children; only active children are needed in deriving the inequality.

To check the exact decoupling geometry, rotate frequency coordinates so that the active strip is $\| xi_2 - v_2 \| lt.eq C \/ K$, and put $eta_2 = xi_2 - v_2$. A bounded physical shear $y_2 = x_2 - 2 v_2 t$ and a modulation remove the constant and linear normal terms. At each fixed $y_2$, the resulting function of $\( x_1 \, t \)$ has Fourier support in

$ { \( xi_1 \, tau \) : \| tau + xi_1^2 \| lt.eq C K^(- 2) } \, $

because the remaining normal contribution is $- eta_2^2$. Its tangential cap scale is $K^(- 1)$. The $K^(- 1)$ grid of original patch centers has boundedly many centers in each such tangential bin inside a strip of width $C \/ K$: the corresponding planar region has area $O \( K^(- 2) \)$. The fixed enlargement $O \( s^(- 1) \)$ preserves this bounded overlap. Also, each original patch meets only boundedly many tangential bins.

For localization, multiply by a Schwartz cutoff $psi_Q$ bounded below on $Q$ whose Fourier transform is supported in a ball of radius $O \( K^(- 2) \)$. After the bounded shear and rotation, its restriction to each $y_2$ slice has the same order of tangential/time Fourier thickness. The thick-support hypotheses of the parabola theorem therefore remain valid. Write $F_theta = psi_Q V_theta$ in these coordinates, and $F = sum_(theta upright(" active")) F_theta$. On each fixed $y_2$ slice, use the smooth tangential cap projections $P_I$ at interval length $K^(- 1)$ in the usual smooth-cap form of Bourgain–Demeter decoupling [5] Theorem 1.1. Their multipliers depend only on $xi_1$; their one-dimensional convolution kernels have uniformly bounded $L^1$ norms. Thus, with $delta asymp K^(- 2)$,

$ parallel F \( dot.op \, y_2 \, dot.op \) parallel_(L_(x_1 \, t)^6)^2 lt.tilde_epsilon.alt K^epsilon.alt sum_I parallel P_I F \( dot.op \, y_2 \, dot.op \) parallel_(L_(x_1 \, t)^6)^2 . $

This decouples frequency projections of the localized sum. To recover the original, possibly overlapping subfields, let $cal(N) \( I \)$ consist of the patches whose enlarged tangential supports meet $I$. The preceding geometry gives $\| cal(N) \( I \) \| lt.eq C$, and each patch belongs to at most $C$ such sets; the cutoff’s extra $O \( K^(- 2) \)$ thickness does not change these bounds. Since $P_I F = sum_(theta in cal(N) \( I \)) P_I F_theta$, the triangle inequality and the uniform convolution bound give

$ sum_I parallel P_I F \( dot.op \, y_2 \, dot.op \) parallel_6^2 lt.eq C sum_I sum_(theta in cal(N) \( I \)) parallel F_theta \( dot.op \, y_2 \, dot.op \) parallel_6^2 lt.eq C' sum_theta parallel F_theta \( dot.op \, y_2 \, dot.op \) parallel_6^2 . $

In particular no lower bound on any component of a possibly cancelling sum is required. Taking the $L^6$ norm in $y_2$ and using Minkowski now gives

$ ∥(sum_theta parallel F_theta \( dot.op \, y_2 \, dot.op \) parallel_(L_(x_1 \, t)^6)^2)^(1 \/ 2)∥_(L_(y_2)^6)^2 lt.eq sum_theta parallel F_theta parallel_(L^6)^2 lt.tilde sum_theta parallel V_theta parallel_(L^6 \( w_Q \))^2 . $

Here $\| psi_Q \|^6 lt.tilde w_Q$; all projections above were estimated in global slice norms after localization, so no inverse of the physical cutoff is needed. Choosing the cutoff with arbitrarily high fixed decay gives any required $N_0$. Finally the inactive sum is absorbed using (4.10). This proves (4.15) for the stated subfields.

Fix a small padding exponent $eta > 0$. The weighted norms can be truncated to $L^eta Q$, with an arbitrarily small negative-power error, by taking $N_0$ sufficiently large. Exact fields here have bounded frequencies and controlled input norms, hence polynomial global supremum bounds. Their measures and domains have polynomial size in $L$, so this truncation is uniform after energy and mass normalization.

Consider a child square centered at $v$ and its parabolic map

#[#set math.equation(numbering: n => "(4.16)")
 $ Phi_v \( x \, t \) = (frac(x - 2 v t, K) \, t / K^2) \, #h(2em) s' = s \/ K \, quad b'_alpha = b_alpha \/ K \, quad omega'_alpha = K \( omega_alpha - v \) . $ <eq:sparse-child-map>]

After removing a modulation, $V_theta = K^(- 1) V'_theta compose Phi_v$. This transformation leaves the native packet variables and the phase-space counting condition unchanged. If $nu' = \( Phi_v \)_(\#) nu$, then

#[#set math.equation(numbering: n => "(4.17)")
 $ nu' \( B \( z \, r \) \) lt.eq C K^3 m_0 r^2 quad \( r gt.eq 1 \) \, #h(2em) integral (1 + frac(\| x' - b'_alpha - 2 omega'_alpha t' \|, s'))^(- M) d nu' lt.eq frac(m_0 s^3, D) . $ <eq:sparse-direct-transport>]

Indeed, the inverse image of a radius-$r$ ball has dimensions $O \( K r \) \, O \( K r \) \, O \( K^2 r \)$ and is covered by $O \( K \)$ balls of radius $O \( K r \)$. This proves the first bound. The normalized transverse distance in the second integral equals its parent value pointwise, proving the second bound. Its right-hand side is exactly $\( K^3 m_0 \) \( s' \)^3 \/ D$.

The measure directly pushed forward is slightly modified to account for the weighted norms. Group parent cubes $Q$ by the child $K^2$-cube $P$ containing $Phi_v \( z_Q \)$. Their total mass is at most $nu' \( C P \)$, since their images lie in $C P$. The sets $Phi_v \( L^eta Q \)$ lie in $C L^eta P$ and have overlap at most $C L^(3 eta)$. The Jacobian and field normalization give

#[#set math.equation(numbering: n => "(4.18)")
 $ (integral_(L^eta Q) \| V_theta \|^6)^(1 \/ 3) = K^(- 2 \/ 3) (integral_(Phi_v \( L^eta Q \)) \| V'_theta \|^6)^(1 \/ 3) \, $ <eq:sparse-jacobian>]

because $d x thin d t = K^4 d x' thin d t'$ and $\| V_theta \|^6 = K^(- 6) \| V'_theta \|^6$. Hölder with exponents $3 \/ 2$ and $3$, first within each group, yields

#[#set math.equation(numbering: n => "(4.19)")
 $ & sum_Q nu \( Q \)^(2 \/ 3) (integral_(L^eta Q) \| V_theta \|^6)^(1 \/ 3)\
 & #h(1cm)  lt.eq C L^(O \( eta \)) K^(- 2 \/ 3) sum_P nu' \( C P \)^(2 \/ 3) (integral_(C L^eta P) \| V'_theta \|^6)^(1 \/ 3) . $ <eq:sparse-group-holder>]

There is no factor for the number of parent cubes in a group.

To put the last sum on the child grid, cover $C P$ by child cubes $P + a$ with $a$ in a fixed finite set of lattice shifts, and cover $C L^eta P$ by $P + b$ with $b$ in a set of $O \( L^(3 eta) \)$ shifts. Both shift lengths are at most $C L^eta K^2$. Subadditivity of the powers $2 \/ 3$ and $1 \/ 3$ bounds a summand by the sum of

$ nu' \( P + a \)^(2 \/ 3) (integral_(P + b) \| V'_theta \|^6)^(1 \/ 3) . $

For a vector $d$, let $\( T_d \)_(\#) nu'$ denote translation of the measure by $d$, and define

#[#set math.equation(numbering: n => "(4.20)")
 $ nu_theta = sum_(d in cal(D)) \( T_d \)_(\#) nu' \, #h(2em) cal(D) = { b - a upright(" for the shifts above") } . $ <eq:sparse-child-measure>]

For $d = b - a$, the mass of $P + b$ under $\( T_d \)_(\#) nu'$ equals $nu' \( P + a \)$. Summing with the possible multiplicities, which are $L^(O \( eta \))$, transforms (4.19) into

#[#set math.equation(numbering: n => "(4.21)")
 $ sum_Q nu \( Q \)^(2 \/ 3) (integral_(L^eta Q) \| V_theta \|^6)^(1 \/ 3) lt.eq C L^(O \( eta \)) K^(- 2 \/ 3) cal(T)_(nu_theta) \( V'_theta \) . $ <eq:sparse-child-functional>]

The number of translates is $L^(O \( eta \))$, so their ball bounds hold with parameter

#[#set math.equation(numbering: n => "(4.22)")
 $ m_1 = C K^3 L^(O \( eta \)) m_0 . $ <eq:sparse-child-density>]

They also preserve the sparsity bound with this same enlarged parameter. In fact, for a shift $d = \( d_x \, d_t \)$, the child’s transverse displacement changes by $d_x - 2 omega'_alpha d_t$. Child velocities are bounded, and we impose

#[#set math.equation(numbering: n => "(4.23)")
 $ L^eta K^2 lt.double s' $ <eq:sparse-shift-smallness>]

at every existing child scale. The weight $\( 1 + \| x' - b'_alpha - 2 omega'_alpha t' \| \/ s' \)^(- M)$ then changes by at most a fixed factor under any translation in (4.20). Summing (4.17) over these shifts proves

$ integral (1 + frac(\| x' - b'_alpha - 2 omega'_alpha t' \|, s'))^(- M) d nu_theta lt.eq m_1 \( s' \)^3 \/ D . $

Their time shifts are also $o \( s' \)$, so a time range $O \( \( s' \)^2 \)$ remains of that order. Combining (4.15) and (4.21) proves the narrow recursion, with factor $C K^(- 2 \/ 3 + epsilon.alt) L^(O \( eta \))$ per generation. Its principal scale factors satisfy the exact cancellation

#[#set math.equation(numbering: n => "(4.24)")
 $ K^(- 2 \/ 3) \( K^3 m_0 \)^(2 \/ 3) \( s \/ K \)^(4 \/ 3) = m_0^(2 \/ 3) s^(4 \/ 3) . $ <eq:sparse-scale-cancellation>]

=== 4.4 Terminal estimate and summation <terminal-estimate-and-summation>

#proof[
  We apply the preceding estimates on the scales just specified. At any node the preceding transport calculation gives a measure $nu$ with time range $O \( s^2 \)$, ball parameter $m_j$, and packet moment bound $m_j s^3 \/ D$, where
  #[#set math.equation(numbering: n => "(4.25)")
   $ m_j lt.eq C^j h^3 m L^(C j eta) . $ <eq:sparse-node-parameters>]
  All support boxes and cell counts are polynomial in $L$. We may apply the estimates at radius $O \( s^2 \)$ spatial box by spatial box. Here exact packets replace the compact packets used at the root: retain only packets whose trajectories meet a fixed enlargement of the box, and discard the others using their prescribed rapid decay. On the time range $O \( s^2 \)$, each retained packet is used in boundedly many boxes. Its coefficient energy therefore has bounded overlap, also for every child subarray. A discarded packet has native transverse distance $gt.tilde s$ on the box. Cauchy–Schwarz, the phase-space counting condition and a sufficiently high decay order make the total error an arbitrarily small negative power of $L$, since $s gt.eq L^(tau_0 \/ 2)$. This is the localization mechanism of Lemma 3, applied to the exact arrays constructed above.
  Whenever this localization is performed, use the same retained labels in the total field and in all its subfields. Negligible field-level cubes are absorbed in the additive error; on the remaining cubes the activity tests tolerate that error, or can be made afresh for the localized exact array. Lemma 27 then uses the maximum of its total and subfield input norms, bounded by a fixed multiple of the retained coefficient norm by (4.4). In particular increasing the later decay orders cannot reduce the absolute broad saving.
  At every nonterminal node the broad contribution is bounded by (4.11), and the narrow contribution is passed to children by (4.21). Child arrays partition the parent labels. Hence their squared coefficient norms sum to the parent energy; there is no loss from the number of children.
  It remains to estimate a terminal node. By rapid decay keep only $K^2$-cubes lying within transverse distance $L^eta s$ of at least one label trajectory. Taking the decay order sufficiently high again makes the omitted contribution negligible. Restrict $nu$ to these retained cubes. If a ball $B$ of radius $s$ meets the retained support, choose one retained cube it meets and a packet near that cube. Since $K^2 lt.double s$ and velocities are bounded, every point of $B$ is at normalized transverse distance $O \( L^eta \)$ from that one packet. Its moment bound therefore gives
  #[#set math.equation(numbering: n => "(4.26)")
   $ nu \( B \) lt.eq C L^(C M eta) frac(m_j s^3, D) . $ <eq:sparse-terminal-mass>]
  The same estimate holds for fixed enlargements of $B$. No sum over packets occurs: one packet suffices for each ball.
  Normalize the node coefficient energy to one and split retained cubes into dyadic classes $nu \( Q \) asymp m_j chi$. The upper range is $chi lt.tilde K^4$ by the ball bound. Polynomially tiny levels are negligible: there are polynomially many tested cells, and a uniform polynomial supremum bound follows from the exact input energy. Thus only $O \( log L \)$ levels need be kept. In each $Q$ choose a unit cube $q_Q$ with the largest field supremum. Then
  #[#set math.equation(numbering: n => "(4.27)")
   $ sum_(Q upright(" in the class")) nu \( Q \)^(2 \/ 3) parallel V parallel_(L^6 \( Q \))^2 lt.tilde K^2 \( m_j chi \)^(2 \/ 3) sum_Q sup_(q_Q) \| V \|^2 . $ <eq:sparse-terminal-unit-reduction>]
  The selected unit cubes need not themselves carry measure. Their counts are instead controlled by their disjoint full $Q$-cubes, each of mass comparable to $m_j chi$. For $r gt.eq 1$ this gives
  $ \# { q_Q : q_Q ∩ B \( z \, r \) eq.not diameter } lt.tilde chi^(- 1) \( r + C K^2 \)^2 lt.tilde K^4 chi^(- 1) r^2 . $
  At radius $s$, using (4.26) and $K^2 lt.double s$ instead gives occupancy at most $C L^(C M eta) chi^(- 1) s^3 \/ D$. Thus the parameters in Lemma 4, with ambient radius $S asymp s^2$, can be taken as
  $ gamma_0 lt.tilde K^4 chi^(- 1) \, #h(2em) lambda_0 lt.tilde L^(C M eta) chi^(- 1) s^3 \/ D . $
  Its unit-cube supremum version and (4.27) yield
  #[#set math.equation(numbering: n => "(4.28)")
   $ cal(T)_nu \( V \) & lt.tilde_epsilon.alt L^(C M eta) K^(10 \/ 3) L^epsilon.alt m_j^(2 \/ 3) s^(5 \/ 3) D^(- 1 \/ 3) parallel c_(upright("node")) parallel_(ell^2)^2\
 & = L^(C M eta) K^(10 \/ 3) O_epsilon.alt \( L^epsilon.alt \) m_j^(2 \/ 3) s^(4 \/ 3) \( s \/ D \)^(1 \/ 3) parallel c_(upright("node")) parallel_(ell^2)^2 . $ <eq:sparse-terminal>]
  Here the logarithmic number of weight classes is absorbed in $L^epsilon.alt$. The cancellation of the weight parameter is complete:
  $ chi^(2 \/ 3) \( chi^(- 1) chi^(- 1) \)^(1 \/ 3) = 1 . $
  The displayed $K^(10 \/ 3)$ consists of $K^2$ in (4.27) and $K^(4 \/ 3)$ from the counting parameter. Allowing additional fixed cube or grid enlargements merely replaces it by $K^(C_1)$ for an absolute $C_1$. Spatial localization is as above, so this argument applies even when the node’s spatial support extends beyond a single $s^2$-box.
  We finish with an explicit order of choices. Bounded $L$ causes no difficulty, and $tau_0 > 1$ permits no unbounded admissible scales, so assume $0 < tau_0 lt.eq 1$. Fix first the absolute numbers
  #[#set math.equation(numbering: n => "(4.29)")
   $ a_(*) = min { c_b \/ 2 \, 1 \/ 6 } \, #h(2em) c_s = a_(*) \/ 8 . $ <eq:sparse-saving-choice>]
  At a broad leaf $s gt.eq D^(1 \/ 2)$ gives $s^(- c_b) lt.eq D^(- c_b \/ 2)$, while (4.9) gives the terminal gain
  $ \( s \/ D \)^(1 \/ 3) lt.eq K^(1 \/ 3) D^(- 1 \/ 6) . $
  Thus both gains are at least $D^(- a_(*))$ before the losses just recorded.
  Now choose $beta > 0$ sufficiently small in terms of $tau_0 \, c_b \, a_(*)$. It can satisfy, with fixed strict margins,
  $ beta < frac(tau_0 c_b, 4) \, #h(2em) 2 beta < tau_0 / 4 \, #h(2em) \( C_1 + 1 \/ 3 \) beta < frac(tau_0 a_(*), 16) . $
  For all large $L$, these imply $K lt.eq s^(c_b)$ at every broad node and allow the terminal $K$ factors to consume at most $D^(a_(*) \/ 8)$, after fixed constants are absorbed. The depth bound $J = O \( beta^(- 1) \)$ is now fixed. Choose the small losses in decoupling and the refined fractal bound so that their total product throughout a path is at most $D^(a_(*) \/ 8)$. Next choose $eta > 0$, depending also on $J$ and $M$, so that all padding losses together cost at most $D^(a_(*) \/ 8)$ and $2 beta + eta < tau_0 \/ 2$. This last inequality implies (4.23) at every existing child scale, since each such scale is at least $D^(1 \/ 2) gt.eq L^(tau_0 \/ 2)$. Finally choose $gamma < tau_0 \/ 4$, so that $\| k \| \/ s = o \( 1 \)$ for every retained layer, and then choose the frequency-tail exponent, the physical decay orders, and the original profile differentiability. The latter choices make every discarded tail as small a negative power as required; they do not change $c_b$ or $c_s$.
  To see that these choices close the entire tree, a depth-$j$ path contributes, before its broad or terminal gain, at most
  $ C^j L^(C j eta + O \( epsilon.alt \)) h^(- 2 \/ 3) \, #h(2em) h = K^j \, $
  times its node estimate. On the other hand (4.25) gives
  $ m_j^(2 \/ 3) s^(4 \/ 3) lt.eq C^j L^(C j eta) h^(2 \/ 3) m^(2 \/ 3) L^(4 \/ 3) . $
  The $h$ powers cancel, as anticipated in (4.24). At a fixed depth the total branch energy is bounded by a fixed constant to that depth times the original energy, including the spatial localizations. Summing over the bounded depth therefore costs only a constant depending on $tau_0$. The allotted losses leave more than the saving $D^(- c_s)$ in (4.29). Finally, all tail errors can be made negligible relative to $m^(2 \/ 3) L^(4 \/ 3) D^(- c_s) parallel c parallel_(ell^2)^2$, even after summing the tree: after normalization there are only polynomially many supported cells, boxes and branches, while the tail exponent is chosen last.
  This proves the desired bound for $cal(T)$. Minkowski in Lemma 26, the Sobolev reduction (4.3), and the initial spatial energy summation give (4.1), with the stated derivative and uniformity properties. ◻
]

== 5 A bilinear frame estimate without a scale loss <sec:frame>

This section supplies the estimate for long, nearly flat frequency blocks. Its inputs need not solve the Schrödinger equation: their profiles may vary smoothly on the packet time scale. The proof successively merges frequency caps and removes large pieces. A positive energy recurrence records the removals. Low-frequency flux bounds and a quartic potential control its errors uniformly in the number of merges.

The cap-merging and amplitude-pruning scheme is related to the high–low method of Guth–Maldague–Wang [16] Sections 2.2–2.4 and 3.3 and its $p$-adic implementation by Guo–Li–Yung [14] Section 7. Retaining discarded quadratic energy and controlling the resulting square function by quartic telescoping are central in Deng–Fan–Guo–Guo–Luo [10] Sections 4.2 and 6.2 and the related contemporary work of Li–Yung [19] Sections 5.2 and 5.5. Those latter arguments exploit exact truncation and Fourier-support identities. Here smooth real-variable masks introduce frequency leakage; the low-frequency flux estimate and Gaussian quartic potential below control the resulting errors uniformly in the number of scales. The smooth-mask, energy-flux and quartic-potential construction and the scale-uniform estimate are proved locally; they are not conclusions imported from the Guth–Maldague–Wang decoupling theorem.

#thm([Theorem 5.1.])[
  (Bilinear frame estimate).  #emph[Fix bounded frequency and profile boxes, a bound on phase-space multiplicity, and a sufficiently large envelope exponent $P$. There is a fixed finite number of profile derivatives for which the following holds uniformly. Let $h gt.eq 1$ and $h^(- 1 \/ 2) lt.eq delta lt.tilde 1$. For $i = 1 \, 2$, let 
$ V_i \( x \, t \) = sum_(ell in cal(I)_i) s_ell e^(i \( x xi_ell - t xi_ell^2 \)) H_ell (frac(x - b_ell - 2 xi_ell t, h) \, t / h^2) $

 be a finite packet sum. The profiles are supported in the fixed box and have the stipulated uniform derivative bounds. The centers $b_ell$ may be arbitrary real numbers, and the pairs $\( b_ell \/ h \, h xi_ell \)$ have bounded multiplicity in every unit phase-space ball. The frequencies of the two fields lie in intervals of length $delta$ with distance at least a fixed positive multiple of $delta$. Put 
$ S_i \( x \, t \)^2 = sum_(ell in cal(I)_i) \| s_ell \|^2 (1 + frac(\| x - b_ell - 2 xi_ell t \|, h) + frac(\| t \|, h^2))^(- P) \, #h(2em) H_i^(*) = h^3 sum_(ell in cal(I)_i) \| s_ell \|^2 . $

 For $A_i \, B_i > 0$, write $alpha_i = A_i \/ B_i$. If $alpha_i gt.eq C$, for a sufficiently large fixed $C$, the number of unit lattice squares containing a point where simultaneously $\| V_i \| gt.eq A_i$ and $S_i lt.eq B_i$ for $i = 1 \, 2$ satisfies 
#[#set math.equation(numbering: n => "(5.1)")
 $ \# lt.eq C' delta^(- C') alpha_1^(- 2) alpha_2^(- 2) (H_1^(*) / A_1^2 + H_2^(*) / A_2^2) . $ <eq:src8>]

 The constants depend only on the fixed bounds just specified. In particular, they are independent of $h$, the number of packets, and the number of scales in the proof. The loss in the separation parameter has at most a fixed polynomial power.]
] <thm:frame>

We always take one witness per counted unit square; the witnesses for all four inequalities in a square must be the same point. All norms below, unless a variable is specified, are on $\( x \, t \) in bb(R)^2$. Spatial Fourier multipliers act only in $x$. Fourier normalization constants in positive potentials are absorbed into their definitions. Set

$ cal(L) = i partial_t + partial_x^2 \, #h(2em) D_a = partial_t + 2 a partial_x - i a^2 . $

The latter derivative annihilates the carrier at frequency $a$; useful identities are

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(L) = i D_a + \( partial_x - i a \)^2 \, #h(2em) D_a - D_b = 2 \( a - b \) \( partial_x - i b \) - i \( a - b \)^2 . $ <eq:frame-derivatives>]

=== 5.1 Reduction to small, exactly localized frequency pieces <reduction-to-small-exactly-localized-frequency-pieces>

#thm([Lemma 5.2.])[
  (Frequency layers and initial normalization).  #emph[It suffices to prove (5.1) for packets whose spatial frequencies are supported in caps of width $O \( h^(- 1) \)$ about their assigned centers, whose spatial profiles have sufficiently rapid polynomial decay, and whose native time supports remain bounded. After dividing a field by its envelope bound $B$, its witness level is $alpha = A \/ B$ and its envelope is at most one. Given 
$ lambda = C_(*) \/ alpha lt.eq 1 \, $

 deleting all packets of normalized amplitude greater than $lambda$ changes the field at every witness by at most $C lambda^(- 1)$. The remaining field $g_0$ has an energy parameter $D lt.tilde H^(*) \/ B^2$ such that $parallel g_0 parallel_2^2 lt.eq D$. At a dyadic scale $Delta_0 asymp h^(- 1)$, its fine cap pieces $g_(0 \, b)$ satisfy, for all fixed orders needed below, 
#[#set math.equation(numbering: n => "(5.3)")
 $ parallel \( partial_x - i b \)^s D_b^r g_(0 \, b) parallel_oo & lt.eq C_(r \, s) lambda Delta_0^(s + 2 r) \,\
sum_b parallel \( partial_x - i b \)^s D_b^r g_(0 \, b) parallel_2^2 & lt.eq C_(r \, s) Delta_0^(2 s + 4 r) D . $ <eq:frame-initial-sup>]

 In particular $parallel cal(L)^r g_0 parallel_2 lt.tilde_r Delta_0^(2 r) sqrt(D)$.]
] <lem:frame-initial>

#proof[
  Smoothly partition the spatial Fourier transform of each native profile into layers $k + \[ - 2 \, 2 \]$, $k in bb(Z)$, writing $chevron.l k chevron.r = 1 + \| k \|$. A fixed, sufficiently large number of derivatives gives any prescribed fixed polynomial layer decay together with the finitely many spatial decay and derivative estimates that we will use. Assign the new carrier center $xi_ell + k \/ h$. In its native coordinates the profile undergoes a translation by $2 k$ times native time and acquires a temporal oscillation of frequency $k^2$. Every required derivative and envelope comparison therefore costs only a fixed polynomial in $chevron.l k chevron.r$. Choose the original decay orders larger than these costs and put the remaining decay into the layer amplitudes. A common frequency shift preserves the phase-space counts.
  At a witness the sum of all layers with $\| k \| gt.eq c delta h$ is bounded by
  $ C_N \( delta h \)^(- N) sqrt(h) thin B . $
  Indeed, in each original frequency bin of width $h^(- 1)$, the spatial tails sum uniformly by bounded offset counts; weighted Cauchy–Schwarz over the $O \( h \)$ frequency bins gives $sqrt(h)$. Since $delta h gt.eq sqrt(h)$, the displayed error is negligible for large $h$. Bounded scales are vacuous once the required ratio constant is large, by the same envelope Cauchy–Schwarz estimate. Choose the fixed $c > 0$ small enough that the retained frequency layers still lie in separated intervals of length $O \( delta \)$.
  If the retained sum is large, some layer has modulus at least $c' chevron.l k chevron.r^(- 2) A$. For any prescribed fixed large $N$ its envelope bound and energy can be taken to be $C_N chevron.l k chevron.r^(- N) B$ and $C_N chevron.l k chevron.r^(- 2 N) H^(*)$, respectively. Thus the ratio condition persists, and applying the desired estimate at these thresholds and summing the two layer indices converges. For example, the ratio factors gain $chevron.l k chevron.r^(- 2 \( N - 2 \))$ and the corresponding energy-to-level ratio gains the same power. Constants and an initial finite set of layers are absorbed into the fixed ratio threshold.
  We may consequently work with one exactly cap-supported layer, divided by $B$. If $\| s_ell \| > lambda$, then $\| s_ell \| lt.eq lambda^(- 1) \| s_ell \|^2$. The pointwise profile decay, chosen stronger than the envelope decay, bounds the deleted sum by $C lambda^(- 1) S^2 lt.eq C lambda^(- 1)$ at witnesses.
  For a fixed fine frequency bin, transported spatial intercepts still have bounded counts per interval of length $h$ on $\| t \| lt.tilde h^2$: velocity variation inside that bin changes positions by only $O \( h \)$. Summing profile tails over these offsets gives (5.3), since all retained amplitudes are at most $lambda$. Each derivative $D_b$ costs $Delta_0^2$, and each $partial_x - i b$ costs $Delta_0$, including the harmless change from an individual center to the bin center. Weighted Cauchy–Schwarz within a bin gives (5.3); a single packet has squared spacetime measure scale $h^3$. Spatial frequencies of distinct bins have bounded overlap. Enlarging $D$ by a fixed factor proves all the stated assertions. ◻
]

=== 5.2 A positive frame iteration and smooth deletion masks <a-positive-frame-iteration-and-smooth-deletion-masks>

Choose a large fixed dyadic integer $K$, whose size will be fixed in Lemma 30. Set $Delta_j = K^j Delta_0$, ending at $Delta_n asymp_K c_0 delta$, where $c_0 > 0$ is a sufficiently small fixed constant. A shorter range with only boundedly many fine caps per frequency interval again makes large ratios impossible. The terminal cap size is chosen small enough to preserve the frequency gap under all the enlargements below.

Fix a real $p in C_c^oo \( bb(R) \)$ with $integral p^2 = 1$. At stage $j$, write $Delta = Delta_j$ and

$ P_a = p \( \( xi - a \) \/ Delta \) \, #h(2em) integral_a = integral_(bb(R)) frac(d a, Delta) \, #h(2em) integral_a P_a^2 = I . $

With $g = g_(j - 1)$ define

#[#set math.equation(numbering: n => "(5.4)")
 $ c_a = P_a g \, #h(2em) b_a = rho_a c_a \, #h(2em) d_a = c_a - b_a \,\
g_j = integral_a P_a b_a \, #h(2em) R_j = g_(j - 1) - g_j = integral_a P_a d_a \,\
L_a = \| c_a \|^2 - \| b_a \|^2 \, #h(2em) L_j = integral_a L_a \, #h(2em) l_j = integral_(bb(R)^2) L_j . $ <eq:frame-step>]

The masks will obey $0 lt.eq rho_a lt.eq 1$. Analysis by the $P_a$ is an isometry and synthesis is its adjoint, hence a contraction. Therefore

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel g_j parallel_2^2 lt.eq parallel g_(j - 1) parallel_2^2 - l_j \, #h(2em) sum_j l_j lt.eq D \, #h(2em) integral_a parallel d_a parallel_2^2 lt.eq l_j . $ <eq:frame-contraction>]

Here $\| d_a \|^2 lt.eq L_a$ follows from $\( 1 - rho_a \)^2 lt.eq 1 - rho_a^2$. The outer projection in synthesis ensures that each step inflates spatial frequency support by only $O \( Delta_j \)$, even though masking itself creates frequencies. The total inflation is $O \( sum_j Delta_j \) = O \( Delta_n \)$, preserving the gap. All states retain the original bounded time support.

We also fix positive spatial convolutions $W_j$ with kernels comparable to $Delta_j \( 1 + Delta_j \| x \| \)^(- P_0)$, where $P_0 > P$ is a sufficiently large fixed even integer. Their common rescaled multiplier $w$ is even, compactly supported, sufficiently smooth, and satisfies $w \( 0 \) = 1$. One construction takes the normalized autocorrelation of a high convolution power of $e^(- x) upright(bold(1))_(\[ 0 \, 1 \]) \( x \)$ as multiplier. The Fourier modulus of the truncated exponential is comparable to $\( 1 + \| xi \| \)^(- 1)$, so the resulting positive kernel has the asserted two-sided polynomial bounds. Increasing that fixed convolution power supplies the required multiplier smoothness.

At every normalized witness $z_0$,

#[#set math.equation(numbering: n => "(5.6)")
 $ W_0 \| g_0 \|^2 \( z \) lt.tilde \( 1 + \| z - z_0 \| \/ h \)^P \, $ <eq:src14>]

with a harmless enlargement of the fixed envelope powers if needed. To verify this, compact support of the multiplier of $W_0$ eliminates products of nonneighboring fine caps. Bound each remaining product by the sum of the squared cap moduli, and then use weighted Cauchy–Schwarz and the transported offset counts within each cap. Positive convolution preserves the resulting sum of squared packet amplitudes with decaying spatial tails. Bounded velocities give its polynomial comparison with the envelope at $z_0$; the original native time support is bounded. Choosing all decay powers in advance larger than $P$ proves (5.6).

The global inequality $sum_j l_j lt.eq D$ does not by itself control how much field is removed at a particular witness. The masks below will satisfy the pointwise bound $\| R_j \| lt.tilde_K lambda^(- 1) W_j L_j$. We therefore need a positive recurrence for the smoothed losses $W_j L_j$. The following identity holds for any masks $0 lt.eq rho_a lt.eq 1$ in (5.4); it does not use their construction.

Define

$ S_j^0 = W_j \| g_j \|^2 \, #h(2em) B_j^0 = integral_a \| d_a - P_a R_j \|^2 gt.eq 0 . $

The term $B_j^0$ compares the removed cap family $d_a$ with the analysis $P_a R_j$ of its synthesized field. Define the two error fields and their accumulated sum by

$ H_j = \( W_j - W_(j - 1) \) \| g_(j - 1) \|^2 \, #h(2em) Phi_j = \| g_j \|^2 - \| g_(j - 1) \|^2 + L_j + B_j^0 \, #h(2em) Y_k = sum_(j lt.eq k) \( H_j + W_j Phi_j \) . $

The exact telescoping identity is

#[#set math.equation(numbering: n => "(5.7)")
 $ S_k^0 + sum_(j lt.eq k) W_j \( L_j + B_j^0 \) = S_0^0 + Y_k . $ <eq:frame-recurrence>]

The term $H_j$ records the change of smoothing scale; $Phi_j$ records the local error in passing between cap analysis and synthesis. Every term on the left is nonnegative. In particular, the witness baseline (5.6) gives $sum_(j lt.eq k) W_j L_j lt.tilde 1 + \| Y_k \|$ at a witness. Thus the accumulated deletions remain controlled until $Y_k$ becomes large. We will prove the uniform maximal estimate

#[#set math.equation(numbering: n => "(5.8)")
 $ ∥sup_(0 lt.eq k lt.eq n) \| Y_k \|∥_2 lt.eq C_K lambda sqrt(D) \, #h(2em) Y_0 = 0 . $ <eq:src19>]

#thm([Lemma 5.3.])[
  (Masks, persistence, and loss bounds).  #emph[The masks can be chosen so that 
#[#set math.equation(numbering: n => "(5.9)")
 $ \| b_a \| lt.eq lambda \, #h(2em) parallel cal(L) P_a b_a parallel_oo lt.eq C_1 lambda Delta^2 \, $ <eq:src15>]

 where $C_1$ is independent of the large fixed $K$. For every required fixed derivative order, 
#[#set math.equation(numbering: n => "(5.10)")
 $ parallel D_a^r P_a b_a parallel_oo lt.eq C_(r \, K) lambda Delta^(2 r) \, #h(2em) integral_a parallel D_a^r P_a b_a parallel_2^2 lt.eq C_(r \, K) Delta^(4 r) D . $ <eq:src16>]

 The removed pieces obey 
#[#set math.equation(numbering: n => "(5.11)")
 $ parallel \( partial_x - i a \)^s D_a^r d_a parallel_1 & lt.eq C_(K \, r \, s) Delta^(s + 2 r) lambda^(- 1) integral L_a \,\
parallel \( partial_x - i a \)^s D_a^r d_a parallel_2^2 & lt.eq C_(K \, r \, s) Delta^(2 s + 4 r) integral L_a \, $ <eq:src17>]

 and, pointwise, 
#[#set math.equation(numbering: n => "(5.12)")
 $ \| R_j \| lt.eq C_K lambda^(- 1) W_j L_j . $ <eq:src18>]

 All derivative constants are uniform in the stage number.]
] <lem:frame-masks>

#proof[
  #emph[Construction of the masks.] Summing the preceding caps that meet $P_a$ gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ parallel c_a parallel_oo lt.eq C K lambda \, #h(2em) parallel cal(L) c_a parallel_oo lt.eq C C_1 lambda Delta^2 \/ K . $ <eq:frame-incoming>]
  There are $O \( K \)$ preceding normalized centers, and their curvature scale is $\( Delta \/ K \)^2$. The initial bounds give the same estimates at the first merge.
  Take a nonnegative smooth partition of unity $sum_e chi_e \( Delta^2 t \) = 1$ by translates with bounded support and overlap, each bounded below on a fixed inner interval. In the co-moving coordinate $r_x = Delta \( x - 2 a t \)$, mark every unit cell on which $\| c_a \| > lambda$ somewhere during the open positive support of the $e$th time cutoff, and let $A_e$ be their union. With a fixed nonnegative $psi in C_c^oo \( \( - 1 \, 1 \) \)$ of integral one, take
  $ m_e = psi * upright(bold(1))_({ r : "dist" \( r \, A_e \) < K + 2 }) . $
  For $K gt.eq 4$, this function is one within distance $K$ of $A_e$, zero outside its $2 K$ enlargement, and lies in $\[ 0 \, 1 \]$; its fixed-order derivative bounds are independent of $K$. Define
  $ 1 - rho_a = sum_e chi_e \( Delta^2 t \) m_e \( r_x \) . $
  Choose the time cutoffs flat to all required orders at the endpoints of their positive supports. Marking can be tested on dense countable sets in the open slabs, using continuity, so the construction is measurable also in $a$. Half-open cell conventions, or fixed slight enlargements, leave all bounds unchanged. At a point with $\| c_a \| > lambda$ every active index is marked, giving $rho_a = 0$ and therefore $\| b_a \| lt.eq lambda$.
  #emph[The curvature bound.] Where a derivative of $rho_a$ is nonzero, there is no same-time peak within co-moving distance $K \/ 2$. Otherwise every active index would be identically fully marked locally, and all derivatives of the mask would vanish. Local Bernstein, using $\| c_a \| lt.eq lambda$ in this neighborhood and the global bound $C K lambda$ against rapidly decreasing reproducing-kernel tails outside it, gives $\| \( partial_x - i a \) c_a \| lt.tilde Delta lambda$ there. Now
  $ cal(L) \( rho_a c_a \) = rho_a cal(L) c_a + #scale(x: 120%, y: 120%)[\(] i \( partial_t + 2 a partial_x \) rho_a + partial_x^2 rho_a #scale(x: 120%, y: 120%)[\)] c_a + 2 \( partial_x rho_a \) \( partial_x - i a \) c_a . $
  Scaled derivatives of the masks cost $Delta$ spatially and $Delta^2$ in co-moving time. Thus $parallel cal(L) b_a parallel_oo lt.tilde lambda Delta^2 \( 1 + C_1 \/ K \)$. The outer projection has bounded $L^1$ kernel. Choose $C_1$ first sufficiently large independently of $K$, and then $K$ sufficiently large, to close (5.9).
  #emph[Uniform higher derivatives.] Order zero follows from bounded masks and frame contraction; spatial derivatives of projected pieces follow from Bernstein. For higher $D_a$ orders use (5.2) to express the incoming piece in preceding centers $tilde(a)$. After normalization by $Delta^(2 r)$, the coefficient of the preceding top-order supremum bound is at most $C K^(1 - 2 r)$. In integrated center $L^2$ norm it is at most $C K^(1 \/ 2 - 2 r)$: Cauchy–Schwarz in the preceding-center window costs $O \( sqrt(K) \)$, while the current-center window for each fixed preceding center has $d a \/ Delta$ measure $O \( 1 \)$. Every other term in the center change uses a lower affine time order; its spatial derivatives cost the preceding Bernstein scale. In $D_a^r \( rho_a c_a \)$ the top term is $rho_a D_a^r c_a$, with $\| rho_a \| lt.eq 1$, and all remaining terms use lower orders and controlled co-moving derivatives of $rho_a$. Fix the maximum required derivative order in advance. The top coefficients are contractive for every $r gt.eq 1$ in this finite list after increasing $K$ once. This enlargement leaves $C_1$ unchanged and only improves both the curvature closure and the Duhamel source smallness. Induction on $r$, and then on stages with that contraction, proves (5.10). The first step uses the fine lattice-bin estimates. The same reasoning gives mixed spatial and affine supremum bounds for $c_a \, d_a$, with constants depending on $K$.
  #emph[Persistence of a marked peak.] A peak in a marked cell forces spatial squared mass at least $c lambda^2 \/ Delta$ within co-moving distance $K \/ 2$ of that cell at #emph[every] comparison time in its time slab. To see this, propagate from the comparison time $t$ to the peak time $t_0$ by Duhamel, inserting a smooth cap cutoff equal to one on the spatial Fourier supports of both $c_a$ and $cal(L) c_a$. Since $\| t - t_0 \| = O \( Delta^(- 2) \)$, the co-moving propagator kernels are uniformly rapidly decreasing at scale $Delta^(- 1)$, with $L^1$ norm $O \( 1 \)$ and $L^2$ norm $O \( sqrt(Delta) \)$. The source contribution is at most $C C_1 lambda \/ K$ by (5.13). The main term outside distance $K \/ 2$ is negligible by its kernel tails and the global $C K lambda$ bound. With $K$ fixed sufficiently large, the remaining main term has modulus at least $c lambda$. Cauchy–Schwarz with its $O \( sqrt(Delta) \)$ kernel norm proves the asserted mass lower bound. This argument explicitly permits nonzero $cal(L) c_a$.
  #emph[Charging the activated sets.] We have $L_a gt.eq sum_e chi_e m_e \| c_a \|^2$. For each marked cell and slab, its enlarged activated region has spacetime volume $O_K \( Delta^(- 3) \)$. Integrating the preceding persistence bound over the inner times where $chi_e$ is bounded below gives a charge $c lambda^2 Delta^(- 3)$ in that cell’s fully marked neighborhood. These neighborhoods have overlap $O_K \( 1 \)$, including across slabs. Consequently the total activated volume, including the supports of mask derivatives counted slab by slab, is at most $C_K lambda^(- 2) integral L_a$. The mixed derivative supremum bounds for $d_a$ are $C_(K \, r \, s) lambda Delta^(s + 2 r)$ on this activated set and vanish off it. Multiplying by its volume proves both inequalities in (5.11).
  Finally fix a time with $chi_e > 0$. The spatial projection of $chi_e m_e c_a$ is bounded by summing its rapidly decreasing kernel over activated cells, using $\| c_a \| lt.eq C K lambda$. Persistence gives at that same time a lower squared-mass bound in each corresponding fully marked neighborhood. Since the positive kernel of $W_j$ decays more slowly than the projection kernel, and the enlarged neighborhoods have bounded overlap, this gives
  $ \| P_a \( chi_e m_e c_a \) \| lt.eq C_K lambda^(- 1) W_j \( chi_e m_e \| c_a \|^2 \) . $
  The common factor $chi_e \( t \)$ causes no difficulty even near slab endpoints. More explicitly, with $u = Delta \( x - 2 a t \)$ and marked cell indices $q$, the kernel upper bound is $C_K lambda sum_q \( 1 + \| u - q \| \)^(- P_0)$. Persistence, kernel comparability on the fully marked neighborhoods, and their $O_K \( 1 \)$ overlap give
  $ lambda^2 sum_q \( 1 + \| u - q \| \)^(- P_0) lt.tilde_K W_j \( m_e \| c_a \|^2 \) \( x \, t \) . $
  Multiplying by $chi_e \( t \)$, summing $e$, and integrating $a$ proves (5.12). ◻
]

=== 5.3 Energy flux and the quartic potential <energy-flux-and-the-quartic-potential>

We now bound the two errors in (5.7). The deletion flux $W_j Phi_j$ will be charged to $l_j$; the changes $H_j$ of smoothing scale require a quartic potential.

#thm([Lemma 5.4.])[
  (Low-frequency flux).  #emph[For a smooth spatial projection $"Proj"_r$ to $\| xi \| asymp r$, where $r lt.tilde Delta_j$, 
#[#set math.equation(numbering: n => "(5.14)")
 $ parallel "Proj"_r W_j Phi_j parallel_2^2 lt.eq C_K lambda^2 \( r \/ Delta_j \) l_j . $ <eq:src20>]

]
] <lem:frame-flux>

#proof[
  Write $g = g_(j - 1)$, $R = R_j$, and $Delta = Delta_j$. Expanding $B_j^0$ and using $g_j = g - R$ gives
  $ Phi_j =  & - 2 "Re" (g overline(R) - integral_a \( P_a g \) overline(d_a))\
 & + 2 "Re" (\| R \|^2 - integral_a d_a overline(P_a R)) + integral_a \| P_a R \|^2 - \| R \|^2 . $
  For either of the first two differences the product multiplier contains, up to sign, $p \( \( xi_1 - a \) \/ Delta \) - p \( \( xi_2 - a \) \/ Delta \)$. On the output band $\| xi_1 - xi_2 \| asymp r$ it costs $O \( r \/ Delta \)$. Both inputs may be restricted to $O \( Delta \)$ about $a$: the cutoff on one factor and the output support force the same localization on the other, including the otherwise unprojected $d_a$. The last difference has symbol
  $ integral_(bb(R)) p \( \( xi_1 - a \) \/ Delta \) p \( \( xi_2 - a \) \/ Delta \) frac(d a, Delta) - 1 \, $
  which vanishes at $xi_1 = xi_2$ and has the same bound. After bin and band localization, all fixed rescaled derivatives in $\( xi_1 - a \) \/ Delta$ and $\( xi_1 - xi_2 \) \/ r$ satisfy that bound. Fourier expansion therefore represents each multiplier by spatially translated products with total coefficient or kernel mass $O_K \( r \/ Delta \)$.
  Here is the loss-sensitive norm bound for those products. Let $Q_b$ be smooth lattice projections of width $Delta$, allowing fixed enlargements. From (5.10) and the center-change identity,
  $ parallel D_b^s Q_b g parallel_oo + parallel D_b^s Q_b R parallel_oo lt.eq C_(s \, K) lambda Delta^(2 s) . $
  Moreover,
  #[#set math.equation(numbering: n => "(5.15)")
   $ sum_b parallel D_b^s Q_b R parallel_2^2 lt.eq C_(s \, K) Delta^(4 s) l_j . $ <eq:frame-loss-bins>]
  Indeed $Q_b R = integral_a Q_b P_a d_a$ uses only $\| a - b \| lt.tilde Delta$; apply Cauchy–Schwarz in this normalized window and (5.11), observing boundedly many $b$ per $a$. The terms with an explicit $d_a$ are handled in the same way after grouping the continuous centers into lattice bins and inserting the permitted spatial projections. All these estimates persist under the spatial translations in the multiplier expansion. Indeed, for $T_y f \( x \, t \) = f \( x - y \, t \)$, one has $D_b T_y = T_y D_b$; translations preserve both spatial cap support and the global $L^oo \, L^2$ norms used here. Thus even translations of size $r^(- 1)$ in the output-band variable have no cost depending on $Delta \/ r$.
  Thus the output from a bin centered at $b$ has $L^2$ norm at most $C_K lambda \( r \/ Delta \) l_b^(1 \/ 2)$, with $sum_b l_b lt.tilde_K l_j$. It has the same bound after any of the fixed normalized product derivatives $\( \( partial_t + 2 b partial_x \) \/ Delta^2 \)^s$ that we need. On a product with a conjugated factor this derivative splits as $D_b$ on the factors, with the carrier constants canceling. On spacetime Fourier variables $\( xi \, tau \)$, the weighted overlap of the bin strips obeys
  $ sum_b (1 + frac(\| tau + 2 b xi \|, Delta^2))^(- 4) lt.tilde 1 + Delta / r . $
  The centers $b$ have spacing $Delta$, so their strip centers in $tau$ have spacing comparable to $Delta r$ and width $Delta^2$. Weighted Cauchy–Schwarz, followed by Plancherel and the differentiated product bounds, gives
  $ parallel "Proj"_r W_j Phi_j parallel_2^2 lt.tilde_K lambda^2 \( r \/ Delta \)^2 \( 1 + Delta \/ r \) sum_b l_b \, $
  which is (5.14). ◻
]

Flux alone does not control the change in the spatial smoothing scale. We obtain that control from a positive quartic expression, whose Gaussian multiplier permits an explicit calculation.

#thm([Lemma 5.5.])[
  (Quartic control of the growth bands).  #emph[Let $G_j \( u \) = exp \( - c u^2 \/ Delta_j^2 \)$, for a fixed $c > 0$. Then 
#[#set math.equation(numbering: n => "(5.16)")
 $ sum_(j = 1)^n integral_(bb(R)^2) \( G_j - G_(j - 1) \) \( u \) \| accent(\| g_(j - 1) \|^2, ̂) \( u \, tau \) \|^2 thin d u thin d tau lt.tilde_K lambda^2 D . $ <eq:src22>]

]
] <lem:frame-quartic>

#proof[
  For a spatial Gaussian multiplier $q_(j \, a)$ of width $Delta_j$ centered at $a$, define the normalized potential
  $ cal(P)_j \( f \) = integral_(bb(R)) integral_(bb(R)^2) \| q_(j \, a) f \( z \) \|^4 thin d z frac(d a, Delta_j) . $
  On quartets with alternating sums of both spatial and temporal frequencies equal to zero, put $u = xi_1 - xi_2$ and $v = xi_1 - xi_4$. The common midpoint is $\( xi_1 + xi_3 \) \/ 2 = \( xi_2 + xi_4 \) \/ 2$; the sum of the four squared deviations from it is $u^2 + v^2$. Integrating the Gaussian center therefore gives exactly the multiplier $G_j \( u \) G_j \( v \)$, after fixed normalization. Expanding this product yields
  #[#set math.equation(numbering: n => "(5.17)")
   $ cal(P)_j \( g \) - cal(P)_(j - 1) \( g \) = 2 integral \( G_j - G_(j - 1) \) \( u \) \| accent(\| g \|^2, ̂) \( u \, tau \) \|^2 thin d u thin d tau + "Err"_j \, $ <eq:frame-potential-increment>]
  where $g = g_(j - 1)$ and the error multiplier is
  $ E_j \( u \, v \) = \( 1 - G_j \( u \) \) \( 1 - G_j \( v \) \) - \( 1 - G_(j - 1) \( u \) \) \( 1 - G_(j - 1) \( v \) \) . $
  The two quadratic terms in the expansion are equal by interchanging $u$ and $v$.
  We establish the quantitative error estimate
  #[#set math.equation(numbering: n => "(5.18)")
   $ \| "Err"_j \| lt.tilde_K lambda^2 [(Delta_0 / Delta_(j - 1))^2 D + sum_(m < j) (Delta_m / Delta_(j - 1))^2 l_m] . $ <eq:src21>]
  Write $Delta' = Delta_(j - 1)$ and partition every input into smooth spatial caps $Q_b$ of width $Delta'$. The quartet identity
  #[#set math.equation(numbering: n => "(5.19)")
   $ 2 u v = xi_1^2 - xi_2^2 + xi_3^2 - xi_4^2 = sum_(nu = 1)^4 \( - 1 \)^(nu + 1) \( tau_nu + xi_nu^2 \) $ <eq:frame-quartet>]
  allows division of $E_j$ by $2 u v \/ \( Delta' \)^2$, placing a normalized curvature derivative $cal(L) \/ \( Delta' \)^2$ on one input. The quotient is smooth at $u = 0$ or $v = 0$, since $E_j$ vanishes quadratically in each variable. The sign of the multiplier $cal(L)$, namely $- \( tau + xi^2 \)$, is irrelevant to the bounds.
  #emph[Norm bookkeeping for a distinguished derivative.] On the input that receives this first derivative write $g = g_0 - sum_(m < j) R_m$. For every required fixed $q gt.eq 1$,
  #[#set math.equation(numbering: n => "(5.20)")
   $ (sum_b parallel Q_b cal(L)^q g_0 \/ \( Delta' \)^(2 q) parallel_2^2)^(1 \/ 2) & lt.tilde_K \( Delta_0 \/ Delta' \)^(2 q) sqrt(D) \,\
sum_b parallel Q_b cal(L)^q R_m \/ \( Delta' \)^(2 q) parallel_1 & lt.tilde_K \( Delta_m \/ Delta' \)^(2 q) lambda^(- 1) l_m . $ <eq:frame-curvature-base>]
  The first assertion is the initial mixed-derivative estimate and bounded spatial Fourier overlap. For the second use $R_m = integral_a P_a d_a$ at scale $Delta_m$ and $cal(L) = i D_a + \( partial_x - i a \)^2$. Each derivative costs $Delta_m^2$ in the $L^1$ bound (5.11). The projection kernels have bounded $L^1$ norm, and each earlier synthesis center meets only boundedly many current bins, proving (5.20). On every other input keep $g = g_(j - 1)$ itself. Its normalized curvature derivatives in $Delta'$ caps have supremum $C_K lambda$ and square-summed $L^2$ norm $C_K sqrt(D)$, by (5.10), spatial Bernstein, and the bounded preceding-center window. These bounds hold for the fixed extra derivative orders introduced below.
  For one fixed cap-offset pattern, Fourier expansion of a smooth rescaled multiplier produces integrals of spatially shifted products. Hölder with a distinguished $L^2$ input, another $L^2$ input and two $L^oo$ inputs gives the base term in (5.18). For an earlier loss, use its distinguished $L^1$ input and three $L^oo$ inputs. In summing the common cap vertex, Cauchy–Schwarz handles the two $L^2$ sequences, or direct summation handles the $L^1$ sequence. There is no additional factor counting free caps. Any further derivative falling on the distinguished input preserves its gain, since $Delta_m lt.eq Delta'$.
  #emph[The off-diagonal multiplier summation.] On $\| u \| \, \| v \| lt.tilde_K Delta'$ the divided symbol, with smooth cutoffs, has bounded Fourier-kernel $L^1$ norm in its two rescaled variables, and only boundedly many cap offsets occur. For explicit rescaled bounds, write $s = u \/ Delta'$, $t = v \/ Delta'$, $F_A \( s \) = 1 - e^(- c s^2 \/ A^2)$, and $E \( s \, t \) = F_K \( s \) F_K \( t \) - F_1 \( s \) F_1 \( t \)$. For the remaining regions, by symmetry let $\| v \| asymp Z Delta'$ be the larger variable, with $Z$ dyadic and large. If $\| u \| lt.tilde Delta' \/ Z$, the once-divided symbol has kernel cost $O_K \( Z^(- 2) \)$ at these derivative scales. There are $O \( Z \)$ possible offsets for each cap vertex, giving total cost $O_K \( Z^(- 1) \)$. In fact $E \( s \, t \) = s^2 e \( s \, t \)$, with every required derivative of $e$ in coordinates $\( Z s \, t \/ Z \)$ bounded uniformly in $Z$. Consequently $E \( s \, t \) \/ \( 2 s t \) = \( s \/ \( 2 t \) \) e \( s \, t \)$ has fixed rescaled derivative bounds $O_K \( Z^(- 2) \)$ after the cutoffs. Anisotropic rescaling preserves the $L^1$ norm of its Fourier kernel.
  In the remaining dyadic regions $\| u \| asymp U Delta'$, $1 \/ Z lt.tilde U lt.tilde Z$, use (5.19) three additional times. After four divisions the symbol has kernel cost
  $ O_K #scale(x: 120%, y: 120%)[\(] \( U \/ Z \) \( U Z \)^(- 3) #scale(x: 120%, y: 120%)[\)] = O_K \( U^(- 2) Z^(- 4) \) . $
  Indeed the undivided error and its fixed derivatives in coordinates $\( s \/ U \, t \/ Z \)$ cost $O_K \( min \( U^2 \, 1 \) \) lt.eq O_K \( U^2 \)$, while each division costs $\( U Z \)^(- 1)$. Smooth Gaussian derivatives give these estimates uniformly on overlapping rectangles; the very small $u$ region uses a single cutoff at scale $Delta' \/ Z$. The spatial sum constraint on the quartet leaves at most $O \( Z max \( 1 \, U \) \)$ offset patterns per fixed vertex. Fixing the first cap leaves $O \( max \( 1 \, U \) \)$ choices for the second and $O \( Z \)$ for the fourth, and then $O \( 1 \)$ for the third by the sum constraint. The multiplier-induced spatial translations only modulate Fourier factors and do not enlarge their supports, so they do not change these counts. Their combined cost is therefore $O_K \( Z^(- 3) U^(- 2) max \( 1 \, U \) \)$. For fixed $Z$ the dyadic sum over $1 \/ Z lt.tilde U lt.eq 1$ is $O_K \( Z^(- 1) \)$, and that over $1 lt.eq U lt.tilde Z$ is $O_K \( Z^(- 3) \)$. Including the very small $u$ part and then summing dyadic $Z$ converges. At least the first curvature derivative remains distinguished in every term of the expanded quartet identities. The norm bounds above thus prove (5.18), with no temporal cap-support assumption and no dependence on the number of scales.
  #emph[Telescoping the potential.] At fixed scale $j$,
  #[#set math.equation(numbering: n => "(5.21)")
   $ \| cal(P)_j \( g_j \) - cal(P)_j \( g_(j - 1) \) \| lt.tilde_K lambda^2 l_j . $ <eq:frame-potential-loss>]
  Both Gaussian-filtered states have supremum $C_K lambda$ by their nearby compact cap pieces and rapid Gaussian overlap. Also
  $ integral_(bb(R)) parallel q_(j \, a) R_j parallel_1 frac(d a, Delta_j) lt.tilde integral_a parallel d_a parallel_1 lt.tilde_K lambda^(- 1) l_j . $
  The first inequality follows by composing the Gaussian with the compact synthesis projections: their $L^1$ kernels have rapidly decaying overlap in the normalized difference of centers. The inequality $\| \| u \|^4 - \| v \|^4 #scale(x: 120%, y: 120%)[\|] lt.tilde \( \| u \| + \| v \| \)^3 \| u - v \|$ then proves (5.21). Similarly $cal(P)_n \( g_n \) lt.tilde_K lambda^2 D$. In summing (5.17), insert and subtract $cal(P)_j \( g_j \)$ at each stage. The remaining boundary terms are $cal(P)_n \( g_n \) - cal(P)_0 \( g_0 \)$, with the initial term favorable. The errors in (5.18) sum because
  $ sum_(j > m) \( Delta_m \/ Delta_(j - 1) \)^2 lt.tilde_K 1 \, #h(2em) sum_j \( Delta_0 \/ Delta_(j - 1) \)^2 lt.tilde_K 1 \, #h(2em) sum_m l_m lt.eq D . $
  This proves (5.16).
  All identities are global spacetime integrals. There are finitely many scales, and cap supremum bounds together with $L^2$ bounds give finite quartic integrals. Smooth localized approximations, if needed, justify Fourier expansions; the established fixed derivative and decay bounds pass to the limit. No derivative in the center variable $a$ is used. ◻
]

#thm([Lemma 5.6.])[
  (Maximal recovery of the error fields).  #emph[The partial errors obey (5.8). If $cal(M)$ is the spacetime Hardy–Littlewood maximal operator, then also 
#[#set math.equation(numbering: n => "(5.22)")
 $ \| Y_k \( z' \) \| lt.tilde \( 1 + Delta_k \| z - z' \| \)^C cal(M) \( sup_j \| Y_j \| \) \( z \) + C_K lambda^2 . $ <eq:src23>]

]
] <lem:frame-maximal>

#proof[
  #emph[Recovering partial sums without a logarithm.] Decompose the spatial outputs of $H_j$ and $W_j Phi_j$ into smooth Littlewood–Paley bands $r asymp 2^(- ell) Delta_j$, with $ell$ bounded below by a fixed integer. Lemma 31 and $sum_j l_j lt.eq D$ bound the square sum of flux band norms by $C_K lambda^2 D thin 2^(- ell)$. For the growth term, evenness of $w$ at zero and its compact support give, on the corresponding band,
  $ \| w \( u \/ Delta_j \) - w \( u \/ Delta_(j - 1) \) \|^2 lt.eq C_K 2^(- 2 ell) \( G_j - G_(j - 1) \) \( u \) . $
  Near zero the squared difference vanishes to fourth order, whereas the Gaussian gap vanishes to second order; on the rest of the fixed compact support their ratio is bounded. Hence (5.16) bounds the square sum of growth band norms by $C_K lambda^2 D thin 2^(- 2 ell)$.
  For a fixed $ell$, successive stage bands have scale ratio $K$. Choose $K$ larger than their fixed support ratio, so the spectra are disjoint and ordered. If $F_ell$ is the sum over all stages in that relative band, a smooth spatial low pass between successive bands recovers each initial segment exactly and kills the later terms. Its pointwise maximal value is bounded by a constant times the spatial Hardy–Littlewood maximal function of $F_ell$. Plancherel for the disjoint spectra and the maximal $L^2$ bound, integrated also in $t$, therefore bound maximal initial segments by the square sum of their norms. Summing $ell$ by the triangle inequality converges, with leakages $2^(- ell \/ 2)$ and $2^(- ell)$. Zero spatial frequency contributes no separate $L^2$ piece. This proves (5.8); no maximal inequality for arbitrary orthogonal series is being used.
  #emph[Local constancy.] In each $H_j$ and $W_j Phi_j$, spatial output support and the flux expansion permit grouping into $O \( 1 \/ Delta_j \)$ matched product bins at bounded centers $b$. The unprojected $d_a$ factors can again be restricted to matched bins by the other input and output supports. Every such product has
  $ parallel \( partial_t + 2 b partial_x \)^s \( upright("product") \) parallel_oo lt.eq C_(s \, K) lambda^2 Delta_j^(2 s) . $
  This follows from (5.10), the mask derivative bounds, and bounded spatial $L^1$ kernels; the preceding caps per current bin cost only a fixed factor depending on $K$. Cut a product to affine temporal frequency $\| tau + 2 b xi \| lt.tilde Delta_j$. The smooth high pass divided by the $s$th power of the rescaled affine frequency has integrable kernel, for a fixed sufficiently large $s$. The resulting error is $C_(s \, K) lambda^2 Delta_j^s$ per bin, hence at most $C_(s \, K) lambda^2 Delta_j^(s - 1)$ for the stage. These errors sum geometrically for $s > 1$.
  The sum $tilde(Y)_k$ of the truncated products differs from $Y_k$ by $O_K \( lambda^2 \)$ uniformly and has full spacetime Fourier support in a ball of radius $O \( Delta_k \)$: its spatial frequencies are $O \( Delta_j \)$ and its velocities are bounded. A smooth spacetime low pass at scale $Delta_k$ recovers $tilde(Y)_k$, so it also recovers $Y_k$ up to $O_K \( lambda^2 \)$. Translating its Schwartz kernel from $z'$ relative to a reference point $z$, and comparing dyadic kernel annuli with the maximal function, proves (5.22). ◻
]

=== 5.4 Stopping and sampling the two separated groups <stopping-and-sampling-the-two-separated-groups>

#thm([Lemma 5.7.])[
  (A local bilinear sampling bound).  #emph[Consider the two states from the preceding construction with $0 < lambda_i lt.eq 1$. Let $Q$ be a square of side $Delta_k^(- 1)$ and let $cal(Z)_Q subset Q$ contain at most one designated point from each unit lattice square. Suppose both states $g_(k - 1)^(\( i \))$ have modulus at least $c alpha_i$ at these points. There is a Schwartz weight $eta_Q$, bounded below on $Q$ and with Fourier support of radius $O \( Delta_k \)$, for which 
#[#set math.equation(numbering: n => "(5.23)")
 $ alpha_1^2 alpha_2^2 \# cal(Z)_Q lt.tilde_K delta^(- C) integral_(bb(R)^2) \| eta_Q \( z' \) \|^2 product_(i = 1)^2 (W_(k - 1) \| g_(k - 1)^(\( i \)) \|^2 \( z' \) + 1) thin d z' \, $ <eq:frame-local-sampling>]

 provided the ratio constants are sufficiently large. The two frequency intervals must retain a gap comparable to $delta$.]
] <lem:frame-local-bilinear>

#proof[
  Put $Delta = Delta_k$. Partition each state by smooth spatial lattice caps $Q_b$ of width $Delta$. Cut each piece to affine modulation
  $ \| tau + 2 b xi - b^2 \| lt.tilde Delta . $
  Its $D_b^r$ estimates show that this cutoff makes a uniform error $C_(r \, K) lambda_i Delta^r$ per cap, by the same inverse-derivative high-pass argument as in Lemma 33. There are $O \( 1 \/ Delta \)$ caps. For a fixed sufficiently large $r$, the total supremum error is $O_K \( lambda_i \)$ and the sum of squared errors is $O_K \( lambda_i^2 \)$. Thus the truncated fields, denoted $tilde(g)^(\( i \)) = sum_b f_(i \, b)$, still have modulus comparable to $alpha_i$ at the designated points.
  Choose $eta_Q$ as stated, with arbitrarily high fixed Schwartz decay at the scale of $Q$. Such a weight can be made by scaling a function with compact smooth Fourier support and positive lower bound on the unit square. The full spacetime Fourier support of $eta_Q tilde(g)^(\( 1 \)) tilde(g)^(\( 2 \))$ is bounded independently of scales, since the frequency centers and velocities are bounded. A Schwartz reproducing kernel at unit scale therefore bounds its squared value at any point of a unit square by a rapidly weighted local squared integral. Summing over the distinct unit squares gives
  $ alpha_1^2 alpha_2^2 \# cal(Z)_Q lt.tilde parallel eta_Q tilde(g)^(\( 1 \)) tilde(g)^(\( 2 \)) parallel_2^2 . $
  This permits arbitrary designated points, including points on cell closures, with only a fixed multiplicity adjustment.
  The support of $f_(i \, b)$ lies within $O \( Delta \)$ of $\( b \, - b^2 \)$ in spacetime frequency. Hence the pair products after multiplication by $eta_Q$ have Fourier overlap bounded by a fixed power of $delta^(- 1)$. In detail, the map
  $ \( b \, b' \) mapsto \( b + b' \, b^2 + \( b' \)^2 \) $
  has determinant $2 \( b' - b \)$ on the two ordered separated intervals. If two such mapped pairs are within $O \( Delta \)$, their sums and squared differences imply that their original ordered centers are within $O \( delta^(- 1) Delta \)$. Since the cap lattice spacing is $Delta$, the overlap is at most $C delta^(- C)$, uniformly in the number of caps. Plancherel then gives
  $ parallel eta_Q tilde(g)^(\( 1 \)) tilde(g)^(\( 2 \)) parallel_2^2 lt.tilde delta^(- C) integral \| eta_Q \|^2 (sum_b \| f_(1 \, b) \|^2) (sum_(b') \| f_(2 \, b') \|^2) . $
  For completeness, the local spatial Bessel bound is
  $ sum_b \| Q_b g \( x \, t \) \|^2 lt.tilde integral_(bb(R)) \( 1 + \| y \| \)^(- P_0) \| g \( x - y \/ Delta \, t \) \|^2 thin d y lt.tilde_K W_(k - 1) \| g \|^2 \( x \, t \) . $
  To obtain the first inequality, write the projection kernels as modulations of a common Schwartz kernel. The values $Q_b g \( x \, t \)$ are Fourier coefficients on a fixed period of the periodization of $y mapsto caron(phi.alt) \( y \) g \( x - y \/ Delta \, t \)$. Parseval and weighted Cauchy–Schwarz for the periodization tails give the displayed positive convolution. The second inequality compares its scale $Delta^(- 1)$ with $Delta_(k - 1)^(- 1) = K Delta^(- 1)$. The bounded squared sum of the temporal-cutoff errors consequently gives $sum_b \| f_(i \, b) \|^2 lt.tilde_K W_(k - 1) \| g_(k - 1)^(\( i \)) \|^2 + 1$, proving (5.23). ◻
]

#proof[
  Apply Lemma 29 and first work with one retained layer of each field, normalized by its fine envelope bound. Use the same scales and masks above, with $lambda_i = C_(*) \/ alpha_i$ and $D_i lt.tilde H_i^(*) \/ B_i^2$. The constants are chosen in this order: the fixed profile and decay bounds, then $C_1$ and $K$ as in Lemma 30, then a trigger level $C_0$, then $C_(*)$, and finally the required lower bound for $alpha_i$. Choose $C_0$ sufficiently large relative to the uniform $O_K \( lambda_i^2 \)$ errors in (5.22), using $lambda_i lt.eq 1$.
  At a witness, until the first index $k$ at which either $\| Y_k^(\( i \)) \| > C_0$, positivity in (5.7) and the witness baseline (5.6) give
  $ sum_(j < k) W_j L_j^(\( i \)) lt.tilde 1 + C_0 . $
  By (5.12), the total change in each field through those stages, including the initial deletion, is at most $C_K \( 1 + C_0 \) lambda_i^(- 1)$. Choose $C_(*)$ large enough that this is a small fixed fraction of $alpha_i$, since $lambda_i^(- 1) = alpha_i \/ C_(*)$. Both preceding states therefore retain modulus at least $c alpha_i$ at the witness. A trigger must occur by stage $n$: otherwise both final states retain those values, whereas the terminal synthesis has only $O_K \( 1 \)$ normalized centers and hence supremum $O_K \( lambda_i \)$. The last assertion uses the interval size $O \( delta \)$ and $Delta_n asymp_K c_0 delta$.
  Use nested dyadic square grids of side $Delta_k^(- 1)$; this is possible because $K$ and $Delta_0$ are dyadic. Each witness selects the square of its first-trigger scale. Take the maximal squares $Q$ among these selected squares. They are disjoint and cover all witnesses; assign a witness to the unique maximal square containing it. If such a square has scale $k$, an assigned witness cannot have triggered at a smaller index $j < k$: its larger dyadic square would strictly contain $Q$ and contradict maximality. Thus both $g_(k - 1)^(\( i \))$ are large at every witness assigned to $Q$. At least one witness in $Q$ triggers at index $k$. Applying (5.22) to that point yields, almost everywhere on $Q$,
  #[#set math.equation(numbering: n => "(5.24)")
   $ cal(M)_1 \( z \) + cal(M)_2 \( z \) gt.tilde_K 1 \, #h(2em) cal(M)_i = cal(M) #scale(x: 120%, y: 120%)[\(] sup_j \| Y_j^(\( i \)) \| #scale(x: 120%, y: 120%)[\)] . $ <eq:frame-trigger-maximal>]
  Apply Lemma 34 to the assigned witnesses. We explain how to bound its weighted integral using an arbitrary reference point $z in Q$. Fix a witness $z_0 in Q$, common to both fields. The recurrence at stage $k - 1$ gives
  $ W_(k - 1) \| g_(k - 1)^(\( i \)) \|^2 \( z' \) lt.eq S_0^(0 \, \( i \)) \( z' \) + \| Y_(k - 1)^(\( i \)) \( z' \) \| . $
  The baseline (5.6), and the fact that $h gt.tilde Delta_k^(- 1)$ up to a fixed constant, bound its first term by a fixed polynomial in $1 + Delta_k "dist" \( z' \, Q \)$. For the second term use (5.22) at the reference point $z$, noting $Delta_(k - 1) lt.eq Delta_k$; if $k = 1$, it is simply zero. We obtain
  $ W_(k - 1) \| g_(k - 1)^(\( i \)) \|^2 \( z' \) + 1 lt.tilde_K \( 1 + Delta_k "dist" \( z' \, Q \) \)^C \( 1 + cal(M)_i \( z \) \) . $
  Choose the fixed Schwartz decay of $eta_Q$ large enough to absorb this polynomial. Its integral scale is $\| Q \|$, and $\( 1 + cal(M)_1 \) \( 1 + cal(M)_2 \) lt.tilde 1 + cal(M)_1^2 + cal(M)_2^2$. Thus the local sampling estimate is at most
  $ C_K delta^(- C) \| Q \| \( 1 + cal(M)_1 \( z \)^2 + cal(M)_2 \( z \)^2 \) $
  for almost every reference point $z in Q$. Average over $Q$ and absorb the constant using (5.24). This proves
  $ alpha_1^2 alpha_2^2 \# { upright("witnesses assigned to ") Q } lt.tilde_K delta^(- C) integral_Q \( cal(M)_1^2 + cal(M)_2^2 \) . $
  Summing the disjoint squares, then applying the maximal $L^2$ inequality and (5.8), gives
  $ \# lt.tilde_K delta^(- C) alpha_1^(- 2) alpha_2^(- 2) \( lambda_1^2 D_1 + lambda_2^2 D_2 \) . $
  Finally $lambda_i^2 D_i lt.tilde H_i^(*) \/ A_i^2$ in the original units. The summable threshold splitting and excess amplitude decay in Lemma 29 allow summation over all initial layer pairs. This proves (5.1).
  The construction used only a fixed finite list of profile derivatives and decay orders. The derivative inductions are contractive, the potential errors and relative bands sum geometrically, and all coverings have fixed overlap. Consequently no constant grows with the number of stages or the array cardinality. The only variable separation loss is the fixed polynomial overlap bound in Lemma 34. ◻
]

#prodef([Remark 5.8.])[
  (Use for composite tangential packets).  The theorem uses only the stated derivative and phase-space bounds. It therefore applies to a smoothly localized sum of smaller packets treated as a single profile with amplitude equal to a bound for its required derivatives. Translating a time bin by $t_0$ replaces a tangential intercept by $b + 2 xi t_0$. For a generic family its phase-space counts remain bounded under this change when $\| t_0 \| lt.tilde h^2$. In the later composite-packet application, larger shifts are also permitted because the carrier centers have bounded count per $h^(- 1)$ frequency bin and the intercept lattice is translated separately at each fixed carrier. It is this extra spacing property that preserves the counts for those shifts. On a normal slab of width $h$, a Fourier expansion in the normalized normal variable produces mode amplitudes $O_N \( chevron.l n chevron.r^(- N) \)$ times that derivative bound; thresholds split with $chevron.l n chevron.r^(- 2)$ and sum as in the initial layer reduction. When omitted normal and time-cell coordinates are at bounded relative distance, the tangential envelope is bounded by a fixed multiple of the full cell envelope. Thus this use introduces neither a dependence on the number of component packets nor an additional count of slabs when their coefficient energies have bounded overlap.
] <rem:frame-composites>

== 6 Flat frequency arrays <sec:flat>

Theorem 28 yields a linear distribution estimate in one space dimension. The useful output measure has a stronger bound along moving tubes than a general two-dimensional measure. Projecting a three-dimensional measure from a slab of width $L$ produces exactly this bound. These two reductions account for the exponents $L^(- 5 \/ 6)$ and $L^(- 4 \/ 3)$ below.

=== 6.1 A one-dimensional distribution estimate <a-one-dimensional-distribution-estimate>

Fix a bounded closed interval $I subset bb(R)$ of positive length. A one-dimensional packet array at scale $L gt.eq 1$ has the form

#[#set math.equation(numbering: n => "(6.1)")
 $ V \( x \, t \) = L^(- 1 \/ 2) sum_ell c_ell e^(i \( x xi_ell - t xi_ell^2 \)) H_ell (frac(x - b_ell - 2 xi_ell t, L) \, t / L^2) \, #h(2em) xi_ell in I . $ <eq:flat-oned-field>]

The array is finite, the pairs $\( b_ell \/ L \, L xi_ell \)$ have a fixed bounded number in every unit ball of $bb(R)^2$, and the profiles have fixed compact support and uniformly bounded derivatives through a sufficiently large fixed order. The centers $b_ell$ are arbitrary real numbers; there is no integrality assumption. Constants below may depend on these fixed bounds, on $I$, and on the fixed size of the output box.

#thm([Proposition 6.1.])[
  (One-dimensional flat estimate).  #emph[Let $nu$ be a nonnegative measure supported in a spatial interval of length $O \( L^2 \)$ and in $\| t \| lt.eq L^2$. Suppose that, for every $t_0 \, b in bb(R)$, every $v in I$, and every $1 lt.eq rho lt.eq r lt.eq L^2$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ nu { \( x \, t \) : \| t - t_0 \| lt.eq r \, med \| x - b - 2 v t \| lt.eq rho #scale(x: 120%, y: 120%)[}] lt.eq m_1 r (1 + rho / L) . $ <eq:flat-tube-test>]

 There is an exponent $p_0 > 2$, for which one may take $p_0 = 21 \/ 10$, such that every array (6.1) and every $g > 0$ satisfy 
#[#set math.equation(numbering: n => "(6.3)")
 $ nu { \| V \| gt.eq g L^(- 5 \/ 6) } lt.eq C m_1 L^3 g^(- p_0) parallel c parallel_2^(p_0) . $ <eq:src9>]

 The constant is uniform in $L$, in the number of packets, and in their real centers. In particular, no factor growing with $L$ is allowed.]
] <prop:oned>

#proof[
  The zero-coefficient case is immediate. Homogeneity reduces the proof to $sum_ell \| c_ell \|^2 = 1$, but we retain the homogeneous form (6.3) in recursive applications to subarrays. We will obtain a broad bound with constant depending on $K$ and a narrow contraction with a constant independent of $K$. We then choose $K$, the base scale, and the induction constant in that order.
  First, the hypotheses give two elementary bounds:
  #[#set math.equation(numbering: n => "(6.4)")
   $ nu \( bb(R)^2 \) lt.eq C m_1 L^3 \, #h(2em) parallel V parallel_oo lt.eq C quad upright("on ") \| t \| lt.eq L^2 . $ <eq:flat-elementary>]
  For the mass bound, cover the output box by a fixed number of tests (6.2) with $r = rho = L^2$ and any fixed $v in I$. For the field bound, a packet contributing at $\( x \, t \)$ must satisfy $\| b_ell \/ L + 2 \( t \/ L^2 \) L xi_ell - x \/ L \| lt.eq C$. Because $xi_ell in I$ and $\| t \| \/ L^2 lt.eq 1$, this part of phase space is covered by $O \( L \)$ unit balls. At most $O \( L \)$ labels contribute, and Cauchy–Schwarz cancels the normalization $L^(- 1 \/ 2)$. It follows that a nonempty level set has
  #[#set math.equation(numbering: n => "(6.5)")
   $ g lt.eq C L^(5 \/ 6) . $ <eq:flat-g-range>]
  The mass bound settles $g < 1$, and also settles all bounded scales once the induction constant is chosen sufficiently large. The same tube test, with $r = rho = 1$ and a fixed bounded covering when $v eq.not 0$, shows that every unit lattice square has $nu$-mass at most $C m_1$.
  ===== 6.1.1 The broad alternative. <the-broad-alternative.>
  Choose an integer $K gt.eq 4$, eventually fixed sufficiently large, and partition $I$ into $K$ equal half-open intervals $I_j$. Make a consistent endpoint assignment at the two ends of $I$. Let $V_j$ be the field of the labels in $I_j$, and write $A = g L^(- 5 \/ 6)$. Call a point of ${ \| V \| gt.eq A }$ broad if there are indices $j_1 \, j_2$ with $\| j_1 - j_2 \| gt.eq 3$ and
  $ \| V_(j_i) \( x \, t \) \| gt.eq frac(A, 10 K) \, #h(2em) i = 1 \, 2 . $
  The two frequency intervals have length $delta = \| I \| \/ K$ and separation at least $2 delta$. We estimate each pair and then sum over at most $K^2$ pairs; all constants in this paragraph may depend on $K$.
  To use the normalization of Theorem 28, put $W_i = L V_(j_i)$. Thus the frame amplitudes are $s_ell = L^(1 \/ 2) c_ell$, the frame scale is $h = L$, and
  #[#set math.equation(numbering: n => "(6.6)")
   $ S_i \( x \, t \)^2 & = L sum_(xi_ell in I_(j_i)) \| c_ell \|^2 (1 + frac(\| x - b_ell - 2 xi_ell t \|, L) + frac(\| t \|, L^2))^(- P) \,\
H_i^(*) & = L^3 sum_(xi_ell in I_(j_i)) \| s_ell \|^2 lt.eq L^4 \, #h(2em) \| W_i \| gt.eq A_i := frac(g L^(1 \/ 6), 10 K) . $ <eq:flat-frame-envelopes>]
  Here $P$ is a sufficiently large fixed envelope power as in Theorem 28. Multiplying the fields by $L$ is essential: the square envelopes in the following estimates belong to $W_i$.
  We claim
  #[#set math.equation(numbering: n => "(6.7)")
   $ integral S_i^2 thin d nu lt.eq C m_1 L^3 \, #h(2em) integral S_1^2 S_2^2 thin d nu lt.eq C_K m_1 L^3 . $ <eq:flat-envelope-integrals>]
  A width-$L$ tube over the given time range has mass $O \( m_1 L^2 \)$ by (6.2). Two such tubes with velocities separated by at least $delta$ intersect only in a time interval of length $O_K \( L \)$; their intersection therefore has mass $O_K \( m_1 L \)$. These statements also control the tails in (6.6). More explicitly, a width-$a L$ tube, with $a gt.eq 1$, has mass at most $C m_1 L^2 \( 1 + a \)$, and the intersection of width-$a L$ and width-$b L$ tubes at the separated velocities has mass at most $C_K m_1 L \( 1 + a + b \)^2$. To see the latter, subtract the two tube equations to obtain a time interval of length $O_K \( \( a + b \) L \)$, then apply (6.2) to the narrower tube. If this time length or width exceeds $L^2$, use the original time restriction and, if necessary, the total mass bound in (6.4); the same polynomial bound results. Dyadic enlargement and the decay $2^(- P j)$ absorb these polynomial costs. Multiplying the individual tube bound by $L sum \| c_ell \|^2 lt.eq L$, and the intersection bound by $L^2 \( sum_(xi_ell in I_(j_1)) \| c_ell \|^2 \) \( sum_(xi_ell in I_(j_2)) \| c_ell \|^2 \) lt.eq L^2$, proves (6.7).
  Take $q = 9 \/ 4$. For $g gt.eq 1$, discard the points where $S_i > g^(q \/ 2) = g^(9 \/ 8)$ for either $i$. The first bound in (6.7) charges these points at most
  #[#set math.equation(numbering: n => "(6.8)")
   $ C m_1 L^3 g^(- q) . $ <eq:flat-square-discard>]
  On what remains, use dyadic classes $b_i lt.eq S_i < 2 b_i$, with $b_i lt.eq g^(9 \/ 8)$. At a witness in such a class the frame upper thresholds can be taken as $B_i = 2 b_i$. By (6.5),
  #[#set math.equation(numbering: n => "(6.9)")
   $ A_i / B_i gt.eq c_K L^(1 \/ 6) g^(- 1 \/ 8) gt.eq c'_K L^(1 \/ 16) . $ <eq:flat-frame-ratio>]
  Thus, for $L$ exceeding a fixed bound depending on $K$, both the large-ratio hypothesis in Theorem 28 and its condition $delta gt.eq L^(- 1 \/ 2)$ hold. All smaller scales belong to the induction base. An envelope cannot vanish at a witness with $\| W_i \| > 0$, so these positive dyadic classes cover the retained set.
  Apply Theorem 28 to count the unit squares having a witness in a fixed class. Their masses are bounded by $C m_1$, even when the witness is not a lattice point. Equations (6.6)–(6.9) give the bound
  $ C_K m_1 frac(b_1^2 b_2^2, A_1^2 A_2^2) (L^4 / A_1^2 + L^4 / A_2^2) lt.eq C_K m_1 L^3 \( b_1 b_2 \)^2 g^(- 6) . $
  On the other hand, the second bound in (6.7) gives $C_K m_1 L^3 \( b_1 b_2 \)^(- 2)$ for the mass of the class. Consequently its mass is at most
  #[#set math.equation(numbering: n => "(6.10)")
   $ C_K m_1 L^3 min { \( b_1 b_2 \)^(- 2) \, \( b_1 b_2 \)^2 g^(- 6) #scale(x: 120%, y: 120%)[}] . $ <eq:flat-class-minimum>]
  The minimum is bounded by $g^(- 3)$. There are $O \( log^2 \( 2 + g \) \)$ classes with both $b_i gt.eq g^(- 10)$. For the other classes use the second term in (6.10) and sum geometrically: for example,
  $ g^(- 6) sum_(b_1 < g^(- 10)) b_1^2 sum_(b_2 lt.eq g^(9 \/ 8)) b_2^2 lt.eq C g^(- 6 - 20 + 9 \/ 4) lt.eq C g^(- 3) . $
  The analogous sum handles $b_2 < g^(- 10)$. Including (6.8) and the choice of the pair proves
  #[#set math.equation(numbering: n => "(6.11)")
   $ nu \( upright("broad points") \) lt.eq C_K m_1 L^3 #scale(x: 120%, y: 120%)[\(] g^(- 9 \/ 4) + g^(- 3) log^2 \( 2 + g \) #scale(x: 120%, y: 120%)[\)] lt.eq C_K m_1 L^3 g^(- p_0) \, #h(2em) p_0 = 21 \/ 10 . $ <eq:flat-broad-bound>]
  ===== 6.1.2 The narrow alternative and the exact child hypotheses. <the-narrow-alternative-and-the-exact-child-hypotheses.>
  At a point which is not broad, call $I_j$ significant if $\| V_j \| gt.eq A \/ \( 10 K \)$. All significant indices are within two steps of each other. Choose three consecutive whole partition intervals containing every significant bin, and let $J$ be the closed hull of those three intervals. Let $V_J$ be the sum of exactly their three bin fields, with the original endpoint assignments. The list of all such clusters lies inside $I$, and each label belongs to at most three clusters. Near an endpoint use the first or last three intervals. Every bin outside the selected cluster is insignificant; hence
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| V_J \| gt.eq \| V \| - sum_(I_j subset.not J) \| V_j \| gt.eq 9 / 10 A . $ <eq:flat-narrow-level>]
  In particular, the lower fraction in this narrow alternative is independent of $K$. Using whole partition intervals avoids dropping only part of any field at a cluster boundary.
  Put $u = 3 \/ K$ and choose $v_J$ so that $J = v_J + u I$. The change of variables and packet parameters are
  #[#set math.equation(numbering: n => "(6.13)")
   $ x' = u \( x - 2 v_J t \) \, quad t' = u^2 t \, quad L' = u L \, quad b'_ell = u b_ell \, quad xi'_ell = frac(xi_ell - v_J, u) in I . $ <eq:flat-child-change>]
  Up to a common factor of modulus one,
  #[#set math.equation(numbering: n => "(6.14)")
   $ V_J \( x \, t \) = u^(1 \/ 2) V'_J \( x' \, t' \) \, $ <eq:flat-child-normalization>]
  where $V'_J$ has exactly the form (6.1) at scale $L'$, with unchanged profiles and coefficients. Indeed, $b'_ell \/ L' = b_ell \/ L$ and $L' xi'_ell = L xi_ell - L v_J$, so phase-space ball counts are unchanged. This observation also explains why real centers cause no difficulty in the induction.
  Let $nu'$ be the pushforward of $nu$ under (6.13). An arbitrary child test, with parameters $t'_0 \, b' in bb(R)$, $v' in I$, and $1 lt.eq rho' lt.eq r' lt.eq \( L' \)^2$, pulls back to an old test with
  $ t_0 = t'_0 / u^2 \, #h(2em) b = b' / u \, #h(2em) v = v_J + u v' in J subset I \, #h(2em) r = r' / u^2 \, #h(2em) rho = rho' / u . $
  Here $1 lt.eq rho lt.eq r lt.eq L^2$ and $rho \/ L = rho' \/ L'$. Thus the full hypothesis (6.2), including its lower scale cutoff and its range of velocities, survives with
  #[#set math.equation(numbering: n => "(6.15)")
   $ m'_1 = u^(- 2) m_1 . $ <eq:flat-child-measure>]
  There is no density Jacobian to insert: $nu'$ is a pushforward measure. The time restriction becomes $\| t' \| lt.eq \( L' \)^2$.
  The transformed spatial domain can be longer than a single interval of length $\( L' \)^2$. Partition it into such intervals. In each one retain only child packets whose compact support meets that interval during $\| t' \| lt.eq \( L' \)^2$. The field agrees with this subarray on the restricted measure. Because the child velocities are in the fixed interval $I$ and $L' gt.eq 1$, each compact child packet meets only a fixed number of these spatial intervals. If $e_(J \, Q)$ is the coefficient norm of the subarray for cluster $J$ and spatial interval $Q$, bounded spatial multiplicity and the threefold frequency overlap give
  #[#set math.equation(numbering: n => "(6.16)")
   $ sum_(J \, Q) e_(J \, Q)^2 lt.eq C parallel c parallel_2^2 = C \, #h(2em) sum_(J \, Q) e_(J \, Q)^(p_0) lt.eq (sum_(J \, Q) e_(J \, Q)^2)^(p_0 \/ 2) lt.eq C . $ <eq:flat-child-energy>]
  These constants are independent of $K$, even though the number of spatial intervals can grow with $K$.
  By (6.12) and (6.14), the child level parameter is
  $ g' = 9 / 10 g u^(1 \/ 3) \, #h(2em) frac(\( 9 \/ 10 \) g L^(- 5 \/ 6), u^(1 \/ 2)) = g' \( L' \)^(- 5 \/ 6) . $
  Suppose the homogeneous estimate is known at the smaller scale $L'$ with induction constant $C_(upright("ind"))$. Sum it over the clusters and spatial intervals, using (6.15) and (6.16). The narrow contribution is at most
  #[#set math.equation(numbering: n => "(6.17)")
   $ C_(upright("ind")) sum_(J \, Q) m'_1 \( L' \)^3 \( g' \)^(- p_0) e_(J \, Q)^(p_0) & lt.eq C_0 C_(upright("ind")) u^(1 - p_0 \/ 3) m_1 L^3 g^(- p_0) . $ <eq:flat-narrow-contraction>]
  The constant $C_0$ does not depend on $K$. Since $1 - p_0 \/ 3 = 3 \/ 10 > 0$, fix $K$ sufficiently large that $C_0 \( 3 \/ K \)^(3 \/ 10) lt.eq 1 \/ 2$. Next fix a base scale $L_(*) \( K \)$ large enough for (6.9), the frame separation condition, and $u L gt.eq 1$ whenever $L > L_(*) \( K \)$. Choose $C_(upright("ind"))$ to cover the bounded-scale estimate and twice the constant in (6.11). Induction over successive scale ranges with ratio $u^(- 1)$ now closes, proving (6.3) for all real $L gt.eq 1$. ◻
]

=== 6.2 Projection of a thin frequency strip <projection-of-a-thin-frequency-strip>

#thm([Proposition 6.2.])[
  (Thin-strip estimate).  #emph[Let $U$ be a finite two-dimensional packet array of the form (2.2), with the fixed profile and phase-space bounds stated there. Suppose all frequency labels lie within distance $C \/ L$ of an affine line in frequency space. Let $mu$ be supported in a spatial square of side $O \( L^2 \)$ and in $\| t \| lt.eq L^2$, and suppose $mu \( B_r \) lt.eq m r^2$ for every ball with arbitrary center and every $r gt.eq 1$. Then, with the exponent $p_0$ of Proposition 36, 
#[#set math.equation(numbering: n => "(6.18)")
 $ mu { \| U \| gt.eq g L^(- 4 \/ 3) } lt.eq C m L^4 g^(- p_0) parallel c parallel_2^(p_0) \, #h(2em) g > 0 . $ <eq:src10>]

 The constant depends only on the fixed bounds, including the strip width constant. No sparsity hypothesis is required.]
] <prop:strip>

#proof[
  Rotate the spatial and frequency coordinates so that the frequency line has constant normal coordinate. Subtract this central normal frequency by the corresponding Galilean shear and modulation. These transformations preserve the field modulus, up to composing with the change of variables, and change the ball bound by a fixed factor: the spatial rotation is orthogonal and the space-time shear and its inverse have bounded norms. They also preserve uniform profile and phase-space bounds. In the new coordinates write the spatial variables as $\( x \, y \)$ and the frequency labels as $\( xi_alpha \, eta_alpha \)$, where
  #[#set math.equation(numbering: n => "(6.19)")
   $ \| L eta_alpha \| lt.eq C . $ <eq:flat-normal-width>]
  The packet fields, including their coefficients, are now
  $ L^(- 1) c_alpha e^(i \( x xi_alpha + y eta_alpha - t \( xi_alpha^2 + eta_alpha^2 \) \)) H_alpha (frac(x - b_(alpha \, x) - 2 xi_alpha t, L) \, frac(y - b_(alpha \, y) - 2 eta_alpha t, L) \, t / L^2) . $
  We keep $m$ for the ball parameter after its fixed enlargement.
  Partition the normal coordinate into half-open slabs of width $L$, and let $y_s$ denote the center of slab $s$. By (6.19) and compact profile support, only labels in a set $cal(A)_s$ with
  #[#set math.equation(numbering: n => "(6.20)")
   $ \| b_(alpha \, y) - y_s \| lt.eq C L $ <eq:flat-normal-intercepts>]
  can contribute in this slab during $\| t \| lt.eq L^2$. Every label belongs to only boundedly many such sets. Moreover, the projected pairs $\( b_(alpha \, x) \/ L \, L xi_alpha \)$ have bounded counts in unit balls for $alpha in cal(A)_s$. Indeed, over any such ball, the remaining coordinates $\( b_(alpha \, y) \/ L \, L eta_alpha \)$ lie in a bounded box by (6.19) and (6.20). Its center may depend on $s$, but it is covered by a fixed number of unit balls. The original four-dimensional phase-space bound therefore bounds the number of projected labels uniformly. Projection does not cost a power of $L$.
  Let $nu_s$ be the pushforward to $\( x \, t \)$ of the restriction of the transformed measure to slab $s$. For any bounded tangential velocity $v$ and $1 lt.eq rho lt.eq r lt.eq L^2$, the inverse image of a test in (6.2) has dimensions comparable to $r$, $rho$, and $L$, after a shear of bounded norm. It can be covered by
  $ C r / rho (1 + L / rho) $
  balls of radius $C rho$. These radii are at least one. Applying the ball bound gives
  #[#set math.equation(numbering: n => "(6.21)")
   $ nu_s { \| t - t_0 \| lt.eq r \, med \| x - b - 2 v t \| lt.eq rho } lt.eq C m r \( L + rho \) = C m L thin r (1 + rho / L) . $ <eq:flat-projected-test>]
  Thus Proposition 36 applies to $nu_s$ with $m_1 = C m L$ and any fixed tangential frequency interval containing the labels.
  It remains to handle the dependence of the field on the normal coordinate. A pointwise choice of a normal slice would not suffice for an arbitrary measure, so we use a single Fourier expansion valid throughout the slab. Put
  $ z = frac(x - b_(alpha \, x) - 2 xi_alpha t, L) \, #h(2em) tau = t / L^2 \, #h(2em) w = frac(y - y_s, L) \, #h(2em) zeta_(alpha \, s) = frac(y_s - b_(alpha \, y), L) \, quad a_alpha = L eta_alpha . $
  Choose a fixed smooth cutoff $chi \( w \)$ equal to one for $\| w \| lt.eq 1 \/ 2$ and supported strictly inside one period of fixed length $T$. Expand
  #[#set math.equation(numbering: n => "(6.22)")
   $ F_(alpha \, s) \( z \, tau \, w \) & := chi \( w \) e^(i a_alpha w - i a_alpha^2 tau) H_alpha \( z \, w + zeta_(alpha \, s) - 2 a_alpha tau \, tau \)\
 & = sum_(n in bb(Z)) e^(2 pi i n w \/ T) F_(alpha \, s \, n) \( z \, tau \) . $ <eq:flat-normal-series>]
  The constants $a_alpha$ and $zeta_(alpha \, s)$ are bounded on $cal(A)_s$. Consequently, if $D$ is the finite derivative order needed in Proposition 36, integration by parts in $w$ gives, for any sufficiently large fixed $N$ for which the original profiles have $D + N$ derivatives,
  #[#set math.equation(numbering: n => "(6.23)")
   $ max_(j + k lt.eq D) parallel partial_z^j partial_tau^k F_(alpha \, s \, n) parallel_oo lt.eq C_N \( 1 + \| n \| \)^(- N) . $ <eq:flat-mode-decay>]
  All these profiles have support in a common bounded $\( z \, tau \)$ box. The residual normal phase has bounded derivatives in these scaled variables; this is the reason for first removing the central normal frequency. The remaining constant phase $e^(i y_s eta_alpha)$ can be included in the coefficient.
  Absorb $C_N \( 1 + \| n \| \)^(- N)$ from (6.23) into the coefficients and normalize each remaining profile. This produces one-dimensional fields $V_(s \, n)$ with uniform admissible profiles and the already verified projected phase-space counts, such that in slab $s$
  #[#set math.equation(numbering: n => "(6.24)")
   $ U \( x \, y \, t \) = L^(- 1 \/ 2) sum_(n in bb(Z)) e^(2 pi i n \( y - y_s \) \/ \( T L \)) V_(s \, n) \( x \, t \) \, #h(2em) parallel c_(s \, n) parallel_2 lt.eq C_N \( 1 + \| n \| \)^(- N) e_s \, $ <eq:flat-strip-series>]
  where $e_s^2 = sum_(alpha in cal(A)_s) \| c_alpha \|^2$. The series converges absolutely, and all its external phase factors have modulus one at every witness. The factor $L^(- 1 \/ 2)$ outside the series is the difference between the two-dimensional packet normalization $L^(- 1)$ and the one-dimensional normalization $L^(- 1 \/ 2)$.
  Choose positive numbers $a_n = c_(*) \( 1 + \| n \| \)^(- 2)$ with $sum_n a_n = 1 \/ 2$. If $\| U \( x \, y \, t \) \| gt.eq g L^(- 4 \/ 3)$ in slab $s$, then (6.24) forces, for at least one $n$,
  $ \| V_(s \, n) \( x \, t \) \| gt.eq a_n g L^(- 5 \/ 6) . $
  Taking the projected measure of this union and applying Proposition 36 gives
  #[#set math.equation(numbering: n => "(6.25)")
   $ mu #scale(x: 120%, y: 120%)[\(] { \| U \| gt.eq g L^(- 4 \/ 3) } ∩ upright("slab ") s #scale(x: 120%, y: 120%)[\)] & lt.eq sum_(n in bb(Z)) nu_s { \| V_(s \, n) \| gt.eq a_n g L^(- 5 \/ 6) }\
 & lt.eq C m L^4 g^(- p_0) e_s^(p_0) sum_(n in bb(Z)) a_n^(- p_0) \( 1 + \| n \| \)^(- N p_0)\
 & lt.eq C m L^4 g^(- p_0) e_s^(p_0) \, $ <eq:flat-mode-sum>]
  provided $\( N - 2 \) p_0 > 1$. Only finitely many derivative bounds are needed to choose such an $N$. Finally,
  $ sum_s e_s^2 lt.eq C parallel c parallel_2^2 \, #h(2em) sum_s e_s^(p_0) lt.eq (sum_s e_s^2)^(p_0 \/ 2) lt.eq C parallel c parallel_2^(p_0) \, $
  by bounded slab overlap and $p_0 > 2$. Summing (6.25) proves (6.18). ◻
]

#prodef([Remark 6.3.])[
  (Fixed enlargements of the time domain).  The preceding conclusions also hold on $\| t \| lt.eq C_t L^2$ for any fixed $C_t$, with constants depending on $C_t$. Partition this range into boundedly many intervals of radius at most $L^2$, and translate the center of each interval to zero. A time translation by $t_(*)$ replaces the packet intercept $b$ by $b + 2 omega t_(*)$ and shifts the profile time argument by $t_(*) \/ L^2$; fixed support and derivative bounds remain uniform. On phase space this is the bounded shear $\( b \/ L \, L omega \) mapsto \( b \/ L + 2 \( t_(*) \/ L^2 \) L omega \, L omega \)$, so real-center ball counts remain bounded. The one-dimensional tube hypothesis is invariant under this translation because its time centers and intercepts are arbitrary; the two-dimensional ball hypothesis is translation invariant as well. Restriction to each time interval and a bounded sum therefore give the asserted extension.
] <rem:flat-time>

== 7 Rich tubes lie in a short list of plates <sec:geometry>

We next isolate a geometric consequence of two simultaneous properties: every tube sees substantial mass, and the tubes available at each point have a spread of directions. Both properties must concern the same measure. The conclusion is a short list of planes near which all the tube trajectories lie. The first part of the proof finds a rich plane through each target line; the second part packs these planes, keeping track of their offsets as well as their normals.

Divide all three physical coordinates by $L$, put $H = L$, and divide the original measure by $m L^2$. In these coordinates the ball hypothesis becomes $nu \( B \( q \, r \) \) lt.tilde r^2$ for $r gt.eq 1$, the relevant domain has diameter $O \( H \)$, and the tubes have unit width. This section uses these coordinates throughout.

#thm([Proposition 7.1.])[
  (Rich-tube geometry).  #emph[Fix bounded velocity, domain, ball, and neighborhood constants, a richness constant $c_(upright(r)) > 0$, an angular constant $C_(upright(a)) > 0$, exponents $A_(upright(r)) \, A_(upright(a)) gt.eq 0$, and $eta > 0$. There are constants $A_(*) \, C_(*) \, C'$ depending only on these fixed data such that the following holds whenever $X gt.eq 2$ and $H gt.eq C_(*) X^(A_(*))$.]
  #emph[Let $nu$ be a nonnegative measure supported in a ball of radius $O \( H \)$, with 
$ nu \( B \( q \, r \) \) lt.eq C_(upright(b)) r^2 #h(2em) \( r gt.eq 1 \) . $

 Let $cal(T)$ be a finite family of lines 
$ ell_T = { \( b_T + 2 omega_T t \, t \) : t in bb(R) } \, #h(2em) \| omega_T \| lt.eq C_(upright(v)) \, $

 viewed as unit-width tubes over a fixed time interval of length $O \( H \)$ containing the time projection of $"supp" nu$. Write $d_T \( x \, t \) = \| x - b_T - 2 omega_T t \|$ and $e_T = \( 2 omega_T \, 1 \) \/ \| \( 2 omega_T \, 1 \) \|$. Assume:]
  + #emph[Every tube is rich against $nu$: 
#[#set math.equation(numbering: n => "(7.1)")
 $ integral \( 1 + d_T \( q \) \)^(- M) thin d nu \( q \) gt.eq c_(upright(r)) H X^(- A_(upright(r))) \, #h(2em) M = 100 . $ <eq:geometry-rich-hypothesis>]

]
  + #emph[At $nu$-almost every $q$ there is a measurably chosen probability $\( p_T \( q \) \)_(T in cal(T))$, supported on tubes with $d_T \( q \) lt.eq C_(upright(n))$, such that every spherical direction ball satisfies 
#[#set math.equation(numbering: n => "(7.2)")
 $ sum_(e_T in B_(bb(S)^2) \( e \, r \)) p_T \( q \) lt.eq C_(upright(a)) X^(A_(upright(a))) r^eta #h(2em) \( r gt.eq H^(- 1) \) . $ <eq:geometry-angular-hypothesis>]

]
  #emph[Then each tube can be assigned to one of at most $X^(C')$ plates (planes thickened by $X^(C')$). Its assigned plate contains its central line segment over the relevant time interval. If $n$ is a unit normal to that plate, then 
#[#set math.equation(numbering: n => "(7.3)")
 $ \| n dot.op \( 2 omega_T \, 1 \) \| lt.eq X^(C') \/ H . $ <eq:src11>]

 The constants are independent of the number of tubes. In particular, the richness in (7.1) and the pointwise law in (7.2) use exactly the same measure $nu$.]
] <prop:rich>

Fixed factors may be absorbed into fixed powers of $X$, since $X gt.eq 2$. We write $X^(O \( 1 \))$ only for powers depending on the data in the proposition; the order in which all additional exponents are chosen is specified at the end of the proof. No estimate below uses a ball bound at radii smaller than one. Bounded velocities also give $"dist" \( q \, ell_T \) lt.eq d_T \( q \) lt.eq C "dist" \( q \, ell_T \)$, so transverse deviation and orthogonal distance define comparable neighborhoods. For a finite family, measurability of the neighboring law adds no restriction: the set ${ T : d_T \( q \) lt.eq C_(upright(n)) }$ takes only finitely many values, and one may choose an admissible probability once for each occurring incidence pattern. These patterns are Borel, since each $d_T$ is continuous, so the resulting law is measurable.

#thm([Lemma 7.2.])[
  (A truncated parameter energy).  #emph[Let $H gt.eq 1$ and let $sigma$ be a finite measure on $bb(R)^2$ of mass $m$, satisfying 
$ sigma \( B \( z \, r \) \) lt.eq A r^(1 + eta) #h(2em) \( z in bb(R)^2 \, med r gt.eq H^(- 1) \) \, #h(2em) A > 0 . $

 Set $gamma = eta \/ \( 1 + eta \)$. Then 
#[#set math.equation(numbering: n => "(7.4)")
 $ integral.double min { H \, \| z - z' \|^(- 1) } thin d sigma \( z' \) thin d sigma \( z \) lt.eq C_eta A^(1 \/ \( 1 + eta \)) m^(1 + gamma) \, $ <eq:geometry-parameter-energy>]

 where the kernel on the diagonal is $H$.]
] <lem:geometry-energy>

#proof[
  The assertion is immediate when $m = 0$. Otherwise put $R = \( m \/ A \)^(1 \/ \( 1 + eta \))$. If $R < H^(- 1)$, the inner integral is at most
  $ H m lt.eq m \/ R = A^(1 \/ \( 1 + eta \)) m^gamma . $
  If $R gt.eq H^(- 1)$, the contribution of $\| z - z' \| lt.eq H^(- 1)$ is at most $A H^(- eta)$. The dyadic annuli between $H^(- 1)$ and $R$ contribute at most
  $ C sum_(H^(- 1) lt.eq 2^j H^(- 1) lt.tilde R) A \( 2^j H^(- 1) \)^eta lt.eq C_eta A R^eta . $
  The remaining region contributes at most $m \/ R$. Thus the inner integral is bounded by $C_eta A^(1 \/ \( 1 + eta \)) m^gamma$ in both cases. Integrating in $z$ proves (7.4). The cutoff at $H$ is what permits the first case without a hypothesis below $H^(- 1)$. ◻
]

#proof[
  #emph[1. Localize richness and choose a longitudinal point.] For $1 lt.eq w lt.eq H$, a width-$w$ neighborhood of any relevant trajectory can be covered by $O \( H \/ w \)$ balls of radius $O \( w \)$. Consequently
  #[#set math.equation(numbering: n => "(7.5)")
   $ nu { d_T lt.eq w } lt.tilde H w . $ <eq:geometry-tube-cover>]
  For $w gt.eq H$ the same upper bound follows from $nu \( bb(R)^3 \) lt.tilde H^2$. Therefore the part of the smoothed integral outside width $W gt.eq 1$ is at most
  $ C sum_(j gt.eq 0) \( 2^j W \)^(- M) H \( 2^(j + 1) W \) lt.tilde H W^(1 - M) . $
  Choose $W = X^(c_1)$, with $\( M - 1 \) c_1 > A_(upright(r))$ by a sufficiently large fixed margin. It follows from (7.1) that, for every $T$,
  #[#set math.equation(numbering: n => "(7.6)")
   $ nu { d_T lt.eq W } gt.eq c H X^(- A_(upright(r))) . $ <eq:geometry-local-richness>]
  We always take $H$ large enough that $W lt.double H$.
  Fix a target tube $T_0$, and abbreviate its line and unit direction by $ell$ and $e$. Translate the origin to a point of $ell$ at distance $O \( W \)$ from the original domain. Such a point exists by (7.6). The measure domain, and all relevant trajectory segments, remain inside a ball of radius $O \( H \)$: the latter assertion follows for every tube from its own localized richness, bounded velocity, and the common $O \( H \)$ time range.
  Draw $q_0$ according to normalized $nu$ restricted to ${ d_(T_0) lt.eq W }$, and let $s = H^(- 1) e dot.op q_0$. Thus $H s$ is the longitudinal coordinate of the orthogonal projection of $q_0$ onto $ell$. A longitudinal window of relative length $r gt.eq H^(- 1)$ inside this width-$O \( W \)$ tube is covered by $O \( 1 + H r \/ W \)$ balls of radius $O \( W \)$. Before normalization its mass is at most $C \( W^2 + H r W \)$; hence
  #[#set math.equation(numbering: n => "(7.7)")
   $ bb(P) { s in I } lt.tilde X^(A_(upright(r))) \( W^2 \/ H + r W \) lt.eq X^(O \( 1 \)) r \, #h(2em) \| I \| lt.eq r \, quad r gt.eq H^(- 1) . $ <eq:geometry-longitudinal>]
  In the last inequality we used precisely $H^(- 1) lt.eq r$.
  #emph[2. Sample a transverse neighbor and keep bin measures unnormalized.] Choose $delta = X^(- c_0)$, with $c_0$ large relative to $A_(upright(a)) \/ eta$. At every sampled point discard directions with $\| e times e_T \| < delta$. They lie in the union of two spherical balls about $e$ and $- e$ of radius $O \( delta \)$, so (7.2) makes their total probability less than $1 \/ 2$. Here $H^(- 1) lt.eq delta$ is included in the scale hierarchy. Renormalize the remaining probabilities separately at each $q_0$. This costs at most two in the angular bound and does not change the marginal law of $q_0$ or (7.7). Draw a tube $T$ from this remaining law. It is a physical neighbor of $q_0$, and is rich against the original common measure $nu$.
  Partition azimuth about the target axis $e$ into half-open intervals of length comparable to $H^(- 1)$. For a bin $pi$, let $u_pi$ be its central radial unit vector in $e^perp$, and let $P_pi$ be the exact plane through $ell$ spanned by $e \, u_pi$. For a sampled unit direction $e'$ in this bin define
  $ a = frac(e dot.op e', u_pi dot.op e') . $
  The denominator is at least $c delta$, so $\| a \| lt.tilde delta^(- 1)$. Let $sigma_pi$ be the pushforward to $\( s \, a \)$ of the sampling probability #emph[restricted] to this azimuth bin, and write $m_pi = parallel sigma_pi parallel$. We have
  #[#set math.equation(numbering: n => "(7.8)")
   $ sum_pi m_pi = 1 . $ <eq:geometry-bin-masses>]
  In particular, we have not divided $sigma_pi$ by $m_pi$.
  For completeness, the angular estimate remains effective in these coordinates without conditioning on the bin. If $n_pi$ completes $e \, u_pi$ to an orthonormal basis and $theta$ is azimuth relative to $u_pi$, then
  $ e' = frac(a e + u_pi + tan theta thin n_pi, \( 1 + a^2 + tan^2 theta \)^(1 \/ 2)) \, #h(2em) \| theta \| lt.tilde H^(- 1) . $
  An interval of length $O \( r \)$ in $a$, within this bin, is therefore contained in a direction ball of radius $O \( r \)$ when $r gt.eq H^(- 1)$; allowing $X^(O \( 1 \)) r$ would also suffice. For a ball in the $\( s \, a \)$-plane of radius $r$, integrate the conditional angular bound over the corresponding longitudinal event in (7.7). This gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ sigma_pi \( B \( z \, r \) \) lt.eq X^(A_(upright(F))) r^(1 + eta) #h(2em) \( r gt.eq H^(- 1) \) $ <eq:geometry-joint-frostman>]
  for any $A_(upright(F)) > A_(upright(r)) + 2 c_1 + A_(upright(a))$ with a sufficiently large fixed margin. This is a bound for the unnormalized measure. No assertion about angular nonconcentration conditional on landing in a small bin is needed.
  #emph[3. Strips in the bin plane.] Write $x = e dot.op q$ and $y = u_pi dot.op q$. Choose $w = X^(c_2)$ with $c_2 > c_0 + c_1$ by a sufficiently large fixed margin, and define the plate and its strip multiplicity by
  #[#set math.equation(numbering: n => "(7.10)")
   $ Q_pi & = { q in "supp" nu : "dist" \( q \, P_pi \) lt.eq w } \,\
F_pi \( q \) & = integral upright(bold(1))_({ \| x - H s - a y \| lt.eq w }) thin d sigma_pi \( s \, a \) . $ <eq:geometry-strip-multiplicity>]
  For each sampled pair $\( q_0 \, T \)$ in bin $pi$, the whole width-$W$ rich portion of $T$ lies in $Q_pi$ and in its associated strip. Indeed, write $q = q_0 + tau e_T + epsilon$ with $\| epsilon \| lt.tilde W$ and $\| tau \| lt.tilde H$. Azimuth binning gives $\| n_pi dot.op e_T \| lt.tilde H^(- 1)$, while $e dot.op e_T - a u_pi dot.op e_T = 0$. Since the displacement of $q_0$ from its projection $H s e$ is $O \( W \)$, the plate error is $O \( W + 1 \)$ and the strip error is $O \( \( 1 + \| a \| \) W \)$, both bounded by $w$.
  Consider two strips with parameters $z = \( s \, a \)$ and $z' = \( s' \, a' \)$. At an intersection point,
  #[#set math.equation(numbering: n => "(7.11)")
   $ \| H \( s - s' \) + \( a - a' \) y \| lt.eq 2 w \, #h(2em) \| y \| lt.tilde H . $ <eq:geometry-strip-intersection>]
  In particular,
  $ \| s - s' \| lt.eq C \| a - a' \| + 2 w \/ H . $
  Put $d = \| z - z' \|$. If $d lt.eq C w \/ H$, covering the full strip by unit balls costs $X^(O \( 1 \)) H$, which is at most $X^(O \( 1 \)) min { H \, d^(- 1) }$ after increasing the fixed power. If $d > C w \/ H$, with $C$ chosen from the domain bound, the existence of an intersection in (7.11) forces $\| a - a' \| gt.tilde d$. The allowed $y$-interval then has length $O \( w \/ d \)$. Its cross-section, the plate thickness, and the factor $1 + \| a \|$ cost only fixed powers of $X$ in a unit-ball covering. The extra constant in the count of unit intervals is also absorbed, because $d lt.eq X^(O \( 1 \))$. If the offset difference dominates so strongly that (7.11) cannot hold, the intersection is empty. Thus in all cases the intersection has a covering by
  #[#set math.equation(numbering: n => "(7.12)")
   $ X^(A_(upright(I))) min { H \, \| z - z' \|^(- 1) } quad upright("unit balls") $ <eq:geometry-strip-kernel>]
  For example, the covering argument gives $C w^3 \( 1 + delta^(- 1) \) min { H \, d^(- 1) }$, so any $A_(upright(I)) > 3 c_2 + c_0$ with a sufficiently large fixed margin suffices in (7.12).
  Use the ball bound at radius one, Fubini’s theorem, and Lemma 40 with (7.9). For $gamma = eta \/ \( 1 + eta \)$ this yields
  #[#set math.equation(numbering: n => "(7.13)")
   $ integral_(Q_pi) F_pi^2 thin d nu lt.eq X^(A_(upright(E))) m_pi^(1 + gamma) . $ <eq:geometry-strip-energy>]
  One can take any sufficiently enlarged exponent $A_(upright(E)) gt.eq A_(upright(I)) + A_(upright(F)) \/ \( 1 + eta \)$. There is no remaining factor of $H$ in this estimate.
  #emph[4. Richness away from the target and overlap of the far plates.] Put $R_(upright(f)) = H \/ X^(c_3)$, choosing $c_3$ after $c_0 \, c_1 \, c_2$, and let
  $ Q_pi^(upright("far")) = Q_pi ∩ { q : "dist" \( q \, ell \) gt.eq R_(upright(f)) } . $
  The geometric meaning of the strip and this exclusion is shown in Figure 2.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.45, -0.63), (5.58, 0.63), fill: rgb("#f5f5f5"), stroke: none)
  line((-0.45, 0.63), (5.58, 0.63), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.45, -0.63), (5.58, -0.63), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.45, 0), (5.85, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.85, 0), [#text(size: 9pt)[$e$]], anchor: "west", padding: 0.1176cm)
  line((0, -1.125), (0, 2.565), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 2.565), [#text(size: 9pt)[$u_ pi$]], anchor: "south", padding: 0.1176cm)
  content((4.635, 0), [#text(size: 9pt)[target line $ell$]], anchor: "north", padding: 0.1176cm)
  line((0.45, -0.99), (0.855, -0.99), (4.23, 2.25), (3.825, 2.25), close: true, fill: rgb("#e8e8ff"), stroke: none)
  line((0.657, -0.99), (4.032, 2.25), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((4.032, 2.25), [#text(size: 9pt)[sampled direction $e'$]], anchor: "south-west", padding: 0.1176cm)
  line((0.45, -0.99), (3.825, 2.25), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0.855, -0.99), (4.23, 2.25), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  circle((1.692, 0), radius: 0.05292, fill: black, stroke: none)
  content((1.692, 0), [#text(size: 9pt)[$"Hs"$]], anchor: "north-west", padding: 0.1176cm)
  circle((3.195, 1.449), radius: 0.07056, fill: rgb("#0000a6"), stroke: none)
  content((3.303, 1.35), [#text(size: 9pt)[retained far mass]], anchor: "west", padding: 0.1176cm)
  line((5.22, 0.036), (5.22, 0.612), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#595959")), end: (symbol: ">>", fill: rgb("#595959"))))
  content((5.22, 0.324), [#text(size: 9pt)[$R_( upright(f) )$]], anchor: "west", padding: 0.1176cm)
  content((0.135, 2.385), [#text(size: 9pt)[$P_ pi$]], anchor: "west", padding: 0.1176cm)
  content((0.36, -1.44), [#text(fill: rgb("#0000a6"))[#text(size: 9pt)[strip: $|x-"Hs"-"ay"| lt.eq w$]]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 2: Geometry in the bin plane $P_pi$ (schematic projection). The shaded horizontal band is the near region removed in (7.14); the thin sloping strip contains the sampled tube after enlargement. Since its direction is separated from the target, only a controlled length lies in the near band. The true plate also has thickness $w$ perpendicular to this picture. ],
  ) <fig:geometry-far>
  Because a sampled tube makes sine-angle at least $delta$ with $ell$, the length of its width-$W$ portion within distance $R_(upright(f))$ of $ell$ is at most $C delta^(- 1) \( W + R_(upright(f)) \)$. Covering it by radius-$O \( W \)$ balls gives the mass bound
  #[#set math.equation(numbering: n => "(7.14)")
   $ C delta^(- 1) W \( W + R_(upright(f)) \) lt.eq C X^(c_0 + 2 c_1) + C H X^(c_0 + c_1 - c_3) . $ <eq:geometry-near-mass>]
  Choose $c_3 > A_(upright(r)) + c_0 + c_1$ by a large fixed margin, and then require $H gt.double X^(A_(upright(r)) + c_0 + 2 c_1)$. The bound in (7.14) is less than half the lower bound in (7.6), uniformly for every sampled tube. Integrating their retained richness against the sampling law therefore gives
  #[#set math.equation(numbering: n => "(7.15)")
   $ integral_(Q_pi^(upright("far"))) F_pi thin d nu gt.eq c H X^(- A_(upright(r))) m_pi . $ <eq:geometry-strip-first-moment>]
  This step uses the richness of every neighboring tube against $nu$, including mass far from the point at which it was sampled.
  Cauchy–Schwarz, (7.13), and (7.15) imply
  #[#set math.equation(numbering: n => "(7.16)")
   $ nu \( Q_pi^(upright("far")) \) gt.eq H^2 X^(- K_0) m_pi^(1 - gamma) $ <eq:geometry-far-plate-mass>]
  for some $K_0 gt.eq 2 A_(upright(r)) + A_(upright(E))$, enlarged to absorb fixed constants.
  All planes $P_pi$ pass through the same line $ell$. At a point $q$ at distance $rho gt.eq R_(upright(f))$ from that line, the condition $"dist" \( q \, P_pi \) lt.eq w$ restricts $u_pi$ to two azimuth arcs of length $O \( w \/ rho \)$. The two arcs account for opposite radial directions. Since bins have size comparable to $H^(- 1)$, their overlap multiplicity is at most
  $ C \( 1 + H w \/ R_(upright(f)) \) lt.eq X^(A_(upright(O))) \, #h(2em) A_(upright(O)) > c_2 + c_3 $
  after a fixed enlargement. Take $H gt.double X^(c_2 + c_3)$ so that $w lt.double R_(upright(f))$. Summing (7.16), using this overlap and $nu \( bb(R)^3 \) lt.tilde H^2$, gives
  #[#set math.equation(numbering: n => "(7.17)")
   $ sum_pi m_pi^(1 - gamma) lt.eq X^(K_1) $ <eq:geometry-bin-concentration>]
  for a fixed $K_1 > K_0 + A_(upright(O))$. But
  $ 1 = sum_pi m_pi lt.eq \( max_pi m_pi \)^gamma sum_pi m_pi^(1 - gamma) . $
  Hence some bin has $m_pi gt.eq X^(- K_1 \/ gamma)$. Its plane contains the exact target line, and its width-$w$ plate has mass at least
  #[#set math.equation(numbering: n => "(7.18)")
   $ H^2 X^(- K) \, #h(2em) K gt.eq K_0 + \( 1 - gamma \) K_1 \/ gamma . $ <eq:geometry-rich-plane>]
  We have produced such a rich plane for every target tube.
  #emph[5. Pack rich planes using both normal and offset separation.] Return to a common origin at the center of the original domain. Write each plane just obtained as
  $ P_j = { q : n_j dot.op q = b_j } \, #h(2em) \| n_j \| = 1 \, $
  with $\( n_j \, b_j \)$ identified with $\( - n_j \, - b_j \)$. The width-$w$ plates, restricted to $"supp" nu$, all have mass at least $lambda H^2$, where $lambda = X^(- K)$. Let $C_(upright(t))$ be a fixed bound for $nu \( bb(R)^3 \) \/ H^2$.
  Choose an angular threshold $theta.alt = X^(c_4) \/ H$, with $c_4 > 2 c_2 + 2 K$ by a sufficiently large fixed margin. If the projective angle between two normals is at least $theta.alt$, the intersection of their width-$w$ plates inside the domain is contained in a box with dimensions
  $ O \( H \) med times med O \( w \) med times med O #scale(x: 120%, y: 120%)[\(] w \/ \| sin angle \( n_i \, n_j \) \| #scale(x: 120%, y: 120%)[\)] . $
  Here projective angles lie in $\[ 0 \, pi \/ 2 \]$, and $theta.alt lt.double 1$. Unit-ball covering thus gives
  #[#set math.equation(numbering: n => "(7.19)")
   $ nu \( Q_i ∩ Q_j \) lt.eq C H^2 X^(2 c_2 - c_4) lt.eq epsilon H^2 \, #h(2em) epsilon lt.eq lambda^2 \/ \( 2 C_(upright(t)) \) . $ <eq:geometry-plate-intersection>]
  For a pair of normals at projective angle below $theta.alt$, align their signs. Changing the normal then changes its defining linear function by at most $C H theta.alt$ on the domain. Choose an offset threshold
  #[#set math.equation(numbering: n => "(7.20)")
   $ Delta = X^(c_5) > 2 w + C H theta.alt \, #h(2em) c_5 > max { c_2 \, c_4 } $ <eq:geometry-offset-threshold>]
  with sufficiently large fixed margins. Such a close-normal pair with $\| b_i - b_j \| gt.eq Delta$ has disjoint plates on the domain.
  Select a maximal sublist in which every pair is separated either by projective normal angle at least $theta.alt$, or, after aligning closer normals, by offset at least $Delta$. Finiteness makes this selection immediate. If the list has length $N$, set $G = sum_(j = 1)^N upright(bold(1))_(Q_j)$. Its first and second moments obey
  $ integral G thin d nu gt.eq N lambda H^2 \, #h(2em) integral G^2 thin d nu lt.eq C_(upright(t)) N H^2 + epsilon N^2 H^2 . $
  Cauchy–Schwarz and the total mass bound give
  $ N^2 lambda^2 lt.eq C_(upright(t))^2 N + C_(upright(t)) epsilon N^2 . $
  By the choice in (7.19), the last term is absorbed, and
  #[#set math.equation(numbering: n => "(7.21)")
   $ N lt.eq 2 C_(upright(t))^2 lambda^(- 2) lt.eq X^(O \( 1 \)) . $ <eq:geometry-plate-count>]
  Maximality says that each original plane is close to a selected one in both its projective normal and its aligned offset. On the entire bounded range of relevant trajectory segments, this means that its central line lies within $Delta + C H theta.alt = X^(O \( 1 \))$ of the selected plane. Enlarge the selected plates accordingly. If $n_0$ is the original normal of the plane through the target line and $n$ is the aligned selected normal, then
  $ n_0 dot.op \( 2 omega_T \, 1 \) = 0 \, #h(2em) \| n - n_0 \| lt.tilde theta.alt . $
  Bounded velocity now gives $\| n dot.op \( 2 omega_T \, 1 \) \| lt.tilde X^(c_4) \/ H$, proving (7.3). Offset control is essential for containment of the segment; angular control supplies the asserted directional bound.
  #emph[Constant hierarchy.] Here is one complete order of choices. First fix the data in the proposition and $M = 100$. Choose $c_0 \, c_1$ so that
  $ c_0 eta > A_(upright(a)) \, #h(2em) \( M - 1 \) c_1 > A_(upright(r)) \, $
  with fixed margins that give the two required half-mass losses. Next choose $c_2 > c_0 + c_1$, followed by
  $ A_(upright(F)) > A_(upright(r)) + 2 c_1 + A_(upright(a)) \, #h(2em) A_(upright(I)) > 3 c_2 + c_0 \, #h(2em) A_(upright(E)) > A_(upright(I)) + A_(upright(F)) \/ \( 1 + eta \) \, $
  with sufficient fixed margins for (7.9)–(7.13). Choose
  $ c_3 > max { c_2 \, A_(upright(r)) + c_0 + c_1 } \, $
  and then choose $A_(upright(O)) \, K_0 \, K_1 \, K$ as in (7.16)–(7.18). Choose $c_4 > 2 c_2 + 2 K$ to ensure (7.19), and then $c_5 > max { c_2 \, c_4 }$ to ensure (7.20). Choose $C'$ larger than $c_5 \, c_4 \, 2 K$, with a fixed margin absorbing the final widths, counts, and direction constants. Finally take
  $ A_(*) > max { A_(upright(r)) + c_0 + 2 c_1 \, med c_2 + c_3 \, med c_0 \, med c_4 \, med C' } \, $
  and $C_(*)$ sufficiently large. Every strict inequality here includes an additional fixed margin if necessary for the fixed constants. All choices precede $X \, H$; in particular no exponent depends on the number of tubes or on an azimuth-bin mass. ◻
]

== 8 The dyadic distribution estimate <sec:dyadic>

The sparse estimate supplies a gain when every packet meets little measure. For a general array, we first remove sparse packets and narrow angular contributions. The remaining packets lie in a controlled collection of plates. The main analytic step then replaces all intermediate packet scales by a single family at a shorter scale, to which the bilinear frame estimate applies.

#thm([Theorem 8.1.])[
  (Dyadic distribution bound).  #emph[There are fixed $p > 2$ and $sigma > 0$ with the following property. Let $U$ be a finite sum of the atoms in (2.2), of packet size $L gt.eq 1$, with $sum_alpha \| c_alpha \|^2 lt.eq 1$. Suppose that $mu$ is supported in a spatial box of side $O \( L^2 \)$ and in $\| t \| lt.eq L^2$, that $mu \( B_r \) lt.eq m r^2$ for every ball of radius $r gt.eq 1$, and that (2.4) holds for every label, with $1 lt.eq D lt.eq L$. Then, for every $g > 0$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ mu \( A \) lt.eq C m L^4 D^(- sigma) g^(- p) \, #h(2em) A = { z : \| U \( z \) \| gt.eq lambda } \, #h(2em) lambda = g L^(- 4 \/ 3) . $ <eq:src12>]

 The constant is uniform in $L \, D \, g \, m$ and the size of the array. It may depend on the fixed packet class, including sufficiently many finite profile derivative bounds. For an arbitrary coefficient array, the right side is multiplied by $parallel c parallel_(ell^2)^p$.]
] <thm:distribution>

We fix the packet class throughout the proof. In particular, its frequency square, phase-space counting constant, profile support, and required derivative bounds are fixed. Recursive cap scalings will be performed in the original, unrotated coordinates, using squares and retaining only the specified subarray. This preserves the class, including its derivative bounds. Rotations used later are only in nonrecursive estimates. The regularity order can be chosen after all small exponents: the saving $c_s$ in Proposition 25, the geometric powers in Proposition 39, and the separation power in Theorem 28 do not increase when additional profile regularity is required.

=== 8.1 Parameters and recursive estimates <parameters-and-recursive-estimates>

Write $c_s$ for the saving in (4.1), and $p_0 > 2$ for the exponent in (6.3) and (6.18). Choose $2 < p_max < min \( p_0 \, 3 \)$ and then $eta > 0$ so small that

#[#set math.equation(numbering: n => "(8.2)")
 $ gamma_0 = 1 - p_max \/ 3 - p_max eta > 0 . $ <eq:dyadic-gamma>]

We introduce the parameters used in the construction and work conditionally on the inequalities below. Their compatible order of choice will be checked after the estimates, when the losses determining them have been identified. For fixed constants $B \, C_a$ and a small exponent $u > 0$, set

#[#set math.equation(numbering: n => "(8.3)")
 $ X = B D \, #h(2em) D_(*) = B D^2 \, #h(2em) delta_0 asymp X^(- u) \, #h(2em) a asymp X^(C_a) \, #h(2em) h = L \/ a . $ <eq:dyadic-parameters>]

Round $delta_0$ and $h$ to convenient dyadic scales, changing only fixed constants. The parameter $D_(*)$ will be used in the sparse-packet deletion; $delta_0$ is the upper scale for cap recursion. The shorter packet scale $h$ will be used after the geometric reduction.

We split the proof at $D = L^kappa$, with $kappa > 0$ sufficiently small. In the range $D < L^kappa$, we require $h$ to dominate the fixed powers of $X$ occurring below, after enlarging a fixed base scale $L_0$. We also require $2 < p lt.eq p_max$ and $0 < sigma lt.eq 1$ with

#[#set math.equation(numbering: n => "(8.4)")
 $ sigma + frac(4 \( p - 2 \), 3 kappa) < c_s \, #h(2em) C_f u + C_g \( p - 2 \) + sigma < c_s \, #h(2em) sigma < u gamma_0 . $ <eq:dyadic-exponent-conditions>]

Here $C_g$ is the fixed exponent separating the large levels $g gt.eq X^(C_g)$ from the remaining levels, and $C_f$ is a fixed loss exponent, independent of $u$. The frame application below will determine a sufficient value of $C_f$ for (8.35). All three inequalities have strict margins. We take $B$ sufficiently large for the recursive terms to contract, and choose the overall induction constant only after the nonrecursive estimates have been obtained.

Two elementary estimates start the induction. At a point, compact support allows only $O \( L^2 \)$ labels, each atom is $O \( L^(- 1) \)$, and hence

#[#set math.equation(numbering: n => "(8.5)")
 $ parallel U parallel_oo lt.tilde parallel c parallel_(ell^2) . $ <eq:dyadic-sup>]

Also $mu \( "supp" mu \) lt.tilde m L^4$. Thus all bounded scales are covered by a constant depending on $L_0$. When $D gt.eq L^kappa$, unit-cube mass is $O \( m \)$, so Proposition 25 gives

$ integral \| U \|^2 thin d mu lt.eq C m^(1 \/ 3) sum_q mu \( q \)^(2 \/ 3) sup_q \| U \|^2 lt.tilde_kappa m L^(4 \/ 3) D^(- c_s) . $

Chebyshev therefore gives $C m L^4 D^(- c_s) g^(- 2)$. A nonempty level set has $g lt.tilde L^(4 \/ 3)$ by (8.5); the first inequality in (8.4) implies $D^sigma g^(p - 2) lt.tilde D^(c_s)$. This proves (8.1) in the sparse range independently of induction.

For $D < L^kappa$, use outer induction on dyadic ranges of $L$ and inner induction on the number of iterations of $d mapsto B d^2$ needed to reach $L^kappa$. Thus the result is available at a fixed smaller packet scale, and at the present scale with parameter $D_(*)$. For sufficiently large $L$ in this range, $D_(*) lt.eq L$; it suffices to have $B L^(2 kappa) lt.eq L$. Denote the inductive constant by $C_(upright("ind"))$. We will bound recursive contributions by a fixed fraction of $C_(upright("ind")) m L^4 D^(- sigma) g^(- p)$ and all other contributions by a constant independent of $C_(upright("ind"))$.

#thm([Lemma 8.2.])[
  (Cap gain).  #emph[For any subarray in a frequency square of side comparable to $r$, where $L^(- 1) lt.tilde r lt.eq delta_0$, outer induction gives 
#[#set math.equation(numbering: n => "(8.6)")
 $ mu { \| U_(cal(C)) \| gt.eq r^eta lambda } lt.eq C_(upright("cap")) C_(upright("ind")) m L^4 g^(- p) r^(1 - p \/ 3 - p eta) #scale(x: 180%, y: 180%)[\(] sum_(alpha in cal(C)) \| c_alpha \|^2 #scale(x: 180%, y: 180%)[\)]^(p \/ 2) . $ <eq:dyadic-cap-gain>]

 The estimate holds for any submeasure of $mu$, with the same upper ball parameter. At the smallest scales choose comparable squares so that the child packet size is at least $1$.]
] <lem:dyadic-cap-gain>

#proof[
  For a square centered at $v$, use $\( x' \, t' \) = \( r \( x - 2 v t \) \, r^2 t \)$, up to fixed normalization conventions. The child packet size is $L' = r L$, the field factor is $r$, and the pushed measure has ball parameter $m' lt.eq C m r^(- 3)$. The new threshold parameter is comparable to $g r^(1 \/ 3 + eta)$, since
  $ r^(- 1) r^eta g L^(- 4 \/ 3) = g r^(1 \/ 3 + eta) \( r L \)^(- 4 \/ 3) . $
  After a fixed inflation of $m'$, covering tubes and their transverse annuli supplies (2.4) with $D = 1$; equivalently $m' \( L' \)^3 asymp m L^3$. The time interval is still $\| t' \| lt.eq \( L' \)^2$. Partition the transformed spatial range into boxes of side comparable to $\( L' \)^2$. A compact child packet meets only boundedly many such boxes during this time interval. If their relevant coefficient energies are $e_j$, then $sum_j e_j lt.tilde sum_(cal(C)) \| c_alpha \|^2$ and $sum_j e_j^(p \/ 2) lt.eq \( sum_j e_j \)^(p \/ 2)$. Consequently outer induction costs no number of boxes. Its dimensional factor is
  $ \( m r^(- 3) \) \( r L \)^4 \( g r^(1 \/ 3 + eta) \)^(- p) = m L^4 g^(- p) r^(1 - p \/ 3 - p eta) \, $
  as asserted. These parabolic transformations translate the pairs $\( b_alpha \/ L \, L omega_alpha \)$ and leave the normalized profiles unchanged. Enclosing a specified cap in a comparable square does not add any other labels. ◻
]

We need the same estimates when the output point determines a prefix of the array. The next elementary device avoids a loss depending on the number of labels. It adapts the dyadic input-energy decomposition of Christ and Kiselev [8] Theorem 1.1 and its proof in Section 2 to the weak-type block estimates on restricted submeasures used here. We give the proof for these hypotheses, rather than applying their maximal theorem as a black box.

#thm([Lemma 8.3.])[
  (Energy truncation).  #emph[Let a finite coefficient array be ordered, with total energy $E$, and let each output point select a prefix ending between whole coefficients. Suppose the distribution estimate for every block, on the submeasure where that block is selected, has right side $K t^(- p) parallel c_(upright("block")) parallel_(ell^2)^p$, where $p > 2$. The field formed from the selected prefix then satisfies the same estimate with right side $C_p K t^(- p) E^(p \/ 2)$.]
] <lem:dyadic-prefix>

#proof[
  Zero coefficients may be omitted, and $E = 0$ is trivial. Place successive intervals of lengths $\| c_alpha \|^2 \/ E$ in $\[ 0 \, 1 \]$. For a dyadic interval $I subset \[ 0 \, 1 \]$, apportion $c_alpha$ by the fraction of its interval lying in $I$. If that fraction is $f_(alpha \, I)$, its apportioned energy obeys
  $ sum_alpha \| f_(alpha \, I) c_alpha \|^2 lt.eq sum_alpha f_(alpha \, I) \| c_alpha \|^2 = E \| I \| . $
  These apportioned blocks satisfy the assumed distribution estimate, up to a constant depending on $p$. Each is either a single apportioned coefficient or the sum of a whole interior block and at most two fractional endpoint coefficients. Homogeneity gives the estimate for the fractional singletons. Split the threshold equally among these at most three pieces and use $sum_i parallel c_i parallel_2^p lt.eq \( sum_i parallel c_i parallel_2^2 \)^(p \/ 2)$; the pieces have disjoint coefficient supports. The resulting bound uses exactly the apportioned energy above.
  Every prefix interval $\[ 0 \, s \)$ is a disjoint union of at most one dyadic interval at each depth $k gt.eq 0$. Every coefficient contributing to a used interval belongs to the prefix, because $s$ is between whole coefficient intervals. The sum of these block fields equals the prefix field, also when the binary expansion is infinite; the original array is finite and the coefficient fractions sum exactly.
  Choose $0 < epsilon.alt < \( p \/ 2 - 1 \) \/ p$ and positive thresholds $t_k = c_epsilon.alt t 2^(- epsilon.alt k)$ with $sum_k t_k = t$. If a prefix field exceeds $t$, some used block exceeds $t_k$. There are at most $2^k$ blocks at depth $k$, each with energy at most $E 2^(- k)$. Restricting the measure separately to points using a block, and summing the distribution bounds, gives
  $ 3^p K t^(- p) E^(p \/ 2) c_epsilon.alt^(- p) sum_(k gt.eq 0) 2^(k \( 1 - p \/ 2 + p epsilon.alt \)) lt.eq C_p K t^(- p) E^(p \/ 2) . $
  This argument also applies inside each fixed frequency cap, with its own total energy $E$. ◻
]

=== 8.2 Peeling to a common rich measure <peeling-to-a-common-rich-measure>

Starting with $A$, repeatedly perform the following two deletions. First remove all labels whose smoothed mass against the measure on the current set is less than $m L^3 \/ D_(*)$. Next remove every point at which the remaining physically neighboring labels do not support a probability law with direction-ball bounds

#[#set math.equation(numbering: n => "(8.7)")
 $ bb(P) { omega in B_r \( v \) } lt.eq C_(upright("ang")) delta_0^(- eta) r^eta \, #h(2em) L^(- 1) lt.eq r lt.tilde 1 . $ <eq:dyadic-angular-law>]

Here a physical neighbor means that the point is within a fixed multiple of $L$ of the packet trajectory; the multiple contains the compact profile support. Directions and frequency centers are interchangeable up to fixed constants on the bounded frequency square.

The angular test can use a finite dyadic label tree, ending at scale comparable to $L^(- 1)$, so it depends measurably on one of finitely many incidence patterns. If a round deletes points but no subsequent label, the angular test is unchanged and no further point can be deleted. Since there are finitely many labels, the process terminates. Write $A_oo$ for its stabilized set and $cal(R)$ for its surviving labels. At termination all labels in $cal(R)$ satisfy

#[#set math.equation(numbering: n => "(8.8)")
 $ integral_(A_oo) \( 1 + \| x - b_alpha - 2 omega_alpha t \| \/ L \)^(- M) thin d mu gt.eq m L^3 \/ D_(*) \; $ <eq:dyadic-rich-common>]

every point of this same set satisfies (8.7) using physically neighboring labels in $cal(R)$.

To estimate what was deleted, order removed labels by their removal round, breaking ties arbitrarily. Each original point selects the prefix removed before it exits, including all labels removed in its exit round; a point of $A_oo$ selects all removed labels. Let $P \( z \)$ be this prefix field. For any binary block in Lemma 43, restrict the measure to points whose prefix uses the block. Such points were still present when each contributing label was removed. By monotonicity of the smoothed integral, every label in that block satisfies (2.4) with $D_(*)$. Inner induction and Lemma 43 therefore give, for any fixed small $c > 0$,

#[#set math.equation(numbering: n => "(8.9)")
 $ mu { \| P \| gt.eq c lambda } lt.eq C_p C_(upright("ind")) m L^4 D_(*)^(- sigma) g^(- p) . $ <eq:dyadic-prefix-exception>]

This restriction of measure is essential: a removed label need not be sparse on all of the original set.

For both the original field and this prefix field, also remove the exceptional sets where a dyadic cap contribution at any scale $L^(- 1) lt.tilde r lt.eq delta_0$ exceeds $r^eta lambda$. Lemma 42 and, for prefixes, Lemma 43, imply a total cost

#[#set math.equation(numbering: n => "(8.10)")
 $ C' C_(upright("ind")) m L^4 g^(- p) delta_0^(gamma_0) . $ <eq:dyadic-cap-exceptions>]

Indeed cap energies at each scale partition the original energy, so their $p \/ 2$ powers sum to at most $1$, and $1 - p \/ 3 - p eta gt.eq gamma_0$ makes the dyadic scale sum geometric.

#thm([Lemma 8.4.])[
  (The angular test cannot fail elsewhere).  #emph[Outside the exceptions in (8.9) and (8.10), an original point cannot exit in an angular deletion. On a surviving such point, $\| U_(cal(R)) \| gt.eq c lambda$ for an absolute $c > 0$.]
] <lem:dyadic-flow>

#proof[
  At a proposed exit, subtract the selected prefix from $U$. The remaining field has modulus at least a fixed fraction of $lambda$, and every fine cap sum has modulus at most $2 r^eta lambda$. Only physically neighboring remaining labels can contribute at the point.
  Mark the terminal cells of the finite direction tree that contain such a neighboring label. Give unmarked terminal cells capacity zero, fine cells of side $r lt.eq delta_0$ capacity $r^eta$, and coarser cells capacity $1$. A cut covering the marked leaves either contains a coarse cell, and hence has capacity at least $1$, or consists of fine cells. In the latter case its cell fields sum to the remaining field, so the triangle inequality gives total capacity at least an absolute positive constant. Nonneighboring labels in these cells contribute zero at the point.
  For completeness, the maximal mass that can pass through a node is the minimum of its capacity and the sum of the maximal masses of its children. Induction up the finite tree shows that this is the minimum cut capacity. Thus a mass bounded below can be sent from the root to marked leaves. Choose a neighboring label in each such leaf and normalize the resulting flow to a probability. A fine cell of side $r$ then has probability $O \( r^eta \)$. A ball of radius $r gt.eq L^(- 1)$ is covered by boundedly many cells of comparable size. At coarser scales $r gt.eq delta_0$, the desired bound follows from $delta_0^(- eta) r^eta gt.eq 1$. Taking $C_(upright("ang"))$ large enough gives (8.7), a contradiction to the exit test. The assertion about the final field follows by subtracting its prefix. ◻
]

Relative to the target with constant $C_(upright("ind"))$, the recursive costs so far are bounded by fixed multiples of

#[#set math.equation(numbering: n => "(8.11)")
 $ \( D_(*) \/ D \)^(- sigma) = X^(- sigma) \, #h(2em) D^sigma delta_0^(gamma_0) lt.tilde D^sigma X^(- u gamma_0) . $ <eq:dyadic-contraction>]

The later single-cap exceptions have the second form as well. The last inequality in (8.4) and a sufficiently large $B$ make the sum of all these costs less than, say, half the target. Their constants include the fixed prefix constant $C_p$, but do not include any of the final nonrecursive constants.

We apply geometry to $mu \|_(A_oo)$ itself, before subtracting any of the proof-only exceptional sets. Equations (8.7) and (8.8) therefore hold for the same measure. Subsequent upper bounds may use the original $mu$: its ball and sparsity upper bounds still hold for every surviving label.

=== 8.3 Plates and coarse frequency intervals <plates-and-coarse-frequency-intervals>

Divide physical coordinates by $L$, and divide $mu \|_(A_oo)$ by $m L^2$. In the notation of Proposition 39, $H = L$, the richness is at least $L \/ D_(*) gt.eq L \/ X^2$, and the angular constant in (8.7) is at most a fixed power of $X$. The required comparisons $X^C lt.double H$ hold by the choice of $kappa$. Proposition 39 assigns every surviving tube to one of at most $X^(C_1)$ plates of width $X^(C_1)$ in these coordinates, with

$ \| n dot.op \( 2 omega \, 1 \) \| lt.eq X^(C_1) \/ L . $

Enlarge the plates by a fixed polynomial factor to contain the physical packet supports in the domain. All assignments are disjoint at the level of coefficient labels.

The spatial component $n_x$ of such a unit normal is bounded below. Indeed $\| omega \| lt.eq C$, so if $\| n_x \|$ were sufficiently small, then $\| n_t + 2 n_x dot.op omega \|$ would be bounded below by an absolute constant, contrary to the displayed estimate for large $L$. Thus the assigned frequencies lie in a strip of width $X^(O \( 1 \)) \/ L$, which can be partitioned into polynomially many strips of width $O \( L^(- 1) \)$. If the total number of resulting arrays is $N lt.eq X^(C_2)$, the triangle inequality and Proposition 37 give

#[#set math.equation(numbering: n => "(8.12)")
 $ mu { \| U_(cal(R)) \| gt.eq c lambda } lt.tilde m L^4 N^(p_0) g^(- p_0) sum_(j = 1)^N parallel c_j parallel_(ell^2)^(p_0) lt.eq X^(C_3) m L^4 g^(- p_0) . $ <eq:dyadic-large-level>]

Choosing $C_g \( p_0 - p_max \) > C_3 + 1$ makes this at most a fixed multiple of the target whenever $g gt.eq X^(C_g)$. For $g < D^(- 1)$, total mass suffices, since $D^(- sigma) g^(- p) gt.eq D^(p - sigma) gt.eq 1$ after decreasing $sigma$ if necessary. We henceforth work in

#[#set math.equation(numbering: n => "(8.13)")
 $ D^(- 1) lt.eq g lt.eq X^(C_g) . $ <eq:dyadic-middle-levels>]

Discard intersections of enlarged plates whose projective normal directions differ by at least a constant multiple of $a \/ L$. For two plates of normalized width $w lt.eq X^(C_4)$ and normal separation $beta$, their intersection is in a box of length $O \( L \)$ and transverse sides $O \( w \)$ and $O \( w \/ beta \)$. Its normalized mass is at most $X^(O \( 1 \)) L \/ beta$ by unit-ball covering. Summing over the polynomial plate list, the discarded mass in the original coordinates is at most

#[#set math.equation(numbering: n => "(8.14)")
 $ m L^4 X^(C_5) \/ a . $ <eq:dyadic-plate-discard>]

Choose $C_a > C_5 + 1 + C_g p_max$, with room for fixed constants. Then (8.14) is bounded by the target throughout (8.13).

Partition projective normal directions into cells of diameter comparable to $a \/ L$, with bounded overlap on balls of that radius. At a retained point all active plate normals have pairwise distance $O \( a \/ L \)$. Consequently only boundedly many normal cells contribute, and at least one cluster field has modulus at least $c lambda$. Relative to a representative normal in each nonempty cell, its label frequencies lie in a strip of width $O \( a \/ L \) = O \( h^(- 1) \)$. The representative still has spatial component bounded below, and this follows by perturbing the previous direction inequality by $O \( a \/ L \)$. The clusters partition the surviving coefficient energy.

For each cluster separately rotate the spatial coordinates and remove its central normal frequency by a bounded shear and modulation. Write the resulting coordinates as $\( x \, y \, t \)$, with $x$ tangential and $y$ normal. Partition tangential label frequencies into coarse intervals $tau$ of length comparable to $delta_0$, then into fine intervals $theta$ of length comparable to $h^(- 1)$, using nested grids and consistent endpoint assignments. Each coarse array fits in a comparable two-dimensional cap, because $h^(- 1) lt.double delta_0$. In applying Lemma 42, enclose that array in an unrotated square in the original coordinates, keeping only its labels. At each scale bounded overlap of the enclosing squares, together with the partitioned coefficient energy across clusters, gives a total exceptional cost

$ C'' C_(upright("ind")) m L^4 g^(- p) delta_0^(gamma_0) $

for the sets on which a coarse cluster field exceeds $delta_0^eta lambda$. This is the further recursive cost already allowed in (8.11).

At any remaining point where a cluster is high, at least $c delta_0^(- eta)$ distinct coarse intervals satisfy

#[#set math.equation(numbering: n => "(8.15)")
 $ \| U_tau \| gt.eq c' delta_0 lambda . $ <eq:dyadic-significant-intervals>]

To see this, there are $O \( delta_0^(- 1) \)$ coarse intervals, so the sum of those below the displayed small threshold has modulus less than half the cluster threshold if $c'$ is sufficiently small. Each of the others has modulus at most $delta_0^eta lambda$, forcing the stated number. Full partition intervals are used throughout; the complement estimate never discards only part of an interval field.

=== 8.4 Flattening all intermediate scales <flattening-all-intermediate-scales>

The cluster frequencies now lie in a strip of width $O \( h^(- 1) \)$, whereas Proposition 37 at packet size $L$ requires width $O \( L^(- 1) \)$. Splitting into thinner strips produced the large-level estimate, but paid a fixed power of $X$. To handle the remaining levels, we instead make one smooth packet out of each entire fine frequency array on each short physical cell. We will apply Theorem 28 directly to these packets and sum their energies. The construction uses only the general compact profiles in (2.2); no equation or exact Fourier support is imposed on those profiles.

For a fine interval $theta$ centered at $v_theta$, put

#[#set math.equation(numbering: n => "(8.16)")
 $ z'_theta = F_theta \( x \, y \, t \) = #scale(x: 120%, y: 120%)[\(] \( x - 2 v_theta t \) \/ h \, med y \/ h \, med t \/ h^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:dyadic-child-coordinates>]

The central normal frequency has already been removed. The array is contained in a cap of size $O \( h^(- 1) \)$ and therefore has the form

#[#set math.equation(numbering: n => "(8.17)")
 $ U_theta \( x \, y \, t \) = h^(- 1) e^(i \( x v_theta - t v_theta^2 \)) U'_theta \( z'_theta \) \, $ <eq:dyadic-child-field>]

up to a common harmless modulation. Here $U'_theta$ is an array of packet size $a = L \/ h$, with bounded frequencies and the original coefficient norm.

Choose a fixed smooth partition of unity ${ psi_T }$ on the unit lattice in $bb(R)^3$, with bounded overlap and fixed enlarged supports. Take a finite derivative order $N$ exceeding all later Sobolev and frame requirements, and let

$ s_(theta \, T) = h^(- 1) max_(\| beta \| lt.eq N) sup_(z' in T^(*)) \| partial^beta U'_theta \( z' \) \| \, $

where $T^(*)$ is a fixed sufficiently large enlargement of $T$. Enlarging the fixed constant in this definition would give the same estimates. Fix also a large polynomial decay power $P$, larger than $M + 3$ and all tail moments that will occur, and define

#[#set math.equation(numbering: n => "(8.18)")
 $ d_theta \( T \) = frac(1, m h^3) integral \( 1 + "dist" \( F_theta \( z \) \, T \) \)^(- P) thin d mu \( z \) . $ <eq:dyadic-density>]

We abbreviate this to $d \( T \)$ when the cluster and $theta$ are specified. All coordinate changes push forward the measure without changing its mass. Their ball constants are uniformly bounded after the displayed factor $h^3$. In particular $d \( T \) lt.tilde 1$ by annular covering.

Only cells whose partition supports meet the testing domain need be retained. The associated summand

#[#set math.equation(numbering: n => "(8.19)")
 $ e^(i \( x v_theta - t v_theta^2 \)) h^(- 1) psi_T \( z'_theta \) U'_theta \( z'_theta \) $ <eq:dyadic-composite-packet>]

is a single composite packet: it has tangential width $O \( h \)$, time length $O \( h^2 \)$, localized dependence on $y \/ h$, and all required normalized derivatives bounded by $C s_(theta \, T)$.

There are two energy bounds to retain. On a time interval of length $h^2$, spatial almost orthogonality controls the total squared amplitudes of the composite packets. Over the full time range, the sparse estimate controls the same amplitudes weighted by $d \( T \)^(2 \/ 3)$. The first bound will supply the large threshold-to-envelope ratios required by the frame theorem; the second will retain the factor $D^(- c_s)$ when the frame estimates are summed.

#thm([Lemma 8.5.])[
  (Flattened energy estimates).  #emph[For a time interval $J$ of length $h^2$, let $cal(T) \( J \)$ denote the boundedly many native time-cell layers that can contribute on $J$. Summing over the disjoint fine arrays, and also over clusters when needed, one has 
#[#set math.equation(numbering: n => "(8.20)")
 $ sum_(theta \, thin T in cal(T) \( J \)) s_(theta \, T)^2 & lt.tilde h^(- 2) \,\
sum_(theta \, T) d \( T \)^(2 \/ 3) s_(theta \, T)^2 & lt.tilde_B h^(- 2) a^(4 \/ 3) D^(- c_s) . $ <eq:src13>]

 The right sides are multiplied by the total original coefficient energy if it is not normalized to be at most $1$.]
] <lem:dyadic-flattening>

#proof[
  We first justify spatial almost orthogonality for arbitrary smooth packet profiles. At native time $t' = O \( a^2 \)$, a child atom and all its fixed derivatives have spatial support within $O \( a \)$ of its transported intercept $b'_alpha + 2 omega'_alpha t'$. Spatial integration by parts in the difference of the carrier frequencies gives Gram entries bounded by
  #[#set math.equation(numbering: n => "(8.21)")
   $ C_N \( 1 + a \| omega'_alpha - omega'_beta \| \)^(- N) \, $ <eq:dyadic-gram>]
  and the entries vanish unless the transported intercepts differ by $O \( a \)$. The joint centers
  $ \( b'_alpha \/ a \, a omega'_alpha \) mapsto #scale(x: 120%, y: 120%)[\(] b'_alpha \/ a + 2 \( t' \/ a^2 \) a omega'_alpha \, a omega'_alpha #scale(x: 120%, y: 120%)[\)] $
  undergo a uniformly bounded shear. Thus their phase-space counts remain bounded. Summing (8.21) over these centers gives uniformly summable Gram rows when $N$ is sufficiently large. It follows that, for every required derivative,
  $ parallel partial^beta U'_theta \( dot.op \, t' \) parallel_(L^2 \( bb(R)^2 \))^2 lt.tilde sum_(alpha in theta) \| c_alpha \|^2 . $
  Time derivatives are included: bounded child frequencies and factors $a^(- 1)$ or $a^(- 2)$ from differentiating profiles preserve the same packet bounds. Unit-cell Sobolev estimates, bounded overlap of the enlarged cells, and integration over the $O \( 1 \)$ native time layers in $J$ now give the first assertion of (8.20). Summing the coefficient energies across fine arrays and clusters costs at most $1$.
  For the second assertion, let $mu_theta = F_(theta \#) mu$ in the coordinates of the relevant cluster. Covering the inverse image of a ball shows that its ball parameter is at most $C m h^3$ for radii at least $1$. For every child label, the transverse ratio in (2.4) is unchanged by (8.16), and
  #[#set math.equation(numbering: n => "(8.22)")
   $ \( m h^3 \) a^3 \/ D = m L^3 \/ D . $ <eq:dyadic-child-moment>]
  Thus $mu_theta$ satisfies the same sparsity condition with $D$ after a fixed inflation of its ball parameter.
  Convolve $mu_theta$ with $K_P \( z' \) = \( 1 + \| z' \| \)^(- P)$ and restrict the resulting measure to $\| t' \| lt.eq C' a^2$, with a fixed enlargement sufficient for the cells and derivatives in use. Call the resulting measure $tilde(mu)_theta$. Its ball parameter remains $C m h^3$. Its smoothed tube moments are still bounded as in (8.22): translating a child tube kernel by $w$ changes it by at most a factor $C \( 1 + \| w \| \)^M$, and
  $ integral_(bb(R)^3) \( 1 + \| w \| \)^(M - P) thin d w < oo . $
  Every relevant unit cell $q$ in a fixed enlargement of $T$ has
  #[#set math.equation(numbering: n => "(8.23)")
   $ tilde(mu)_theta \( q \) gt.tilde m h^3 d \( T \) \, $ <eq:dyadic-convolved-cell>]
  after using the time enlargement; this follows by comparing the kernel at all points of $q$ with its distance to $T$.
  Apply Proposition 25, including its derivative version, at packet size $a$ to $U'_theta$ and $tilde(mu)_theta$. Unit cells in $T^(*)$, of which there are boundedly many, control the suprema defining $s_(theta \, T)$. Using (8.23) and dividing out $\( m h^3 \)^(2 \/ 3)$ yields
  $ sum_T d \( T \)^(2 \/ 3) s_(theta \, T)^2 lt.tilde h^(- 2) a^(4 \/ 3) D^(- c_s) sum_(alpha in theta) \| c_alpha \|^2 . $
  The transformed spatial domain may exceed size $a^2$. To use the local form of the sparse estimate, divide it into boxes of side comparable to $a^2$ and retain only intersecting compact child packets. Each such packet meets boundedly many boxes on $\| t' \| lt.eq C' a^2$; summing the squared estimates therefore uses only bounded total coefficient energy.
  This application requires a fixed positive-power lower bound on $D$ in terms of $a$. By $a asymp \( B D \)^(C_a)$ and $a gt.eq D$, we have $a^(1 \/ \( 2 C_a + 2 \)) lt.eq D lt.eq a$ once $D$ exceeds a constant depending on $B$. Use this fixed exponent in Proposition 25. For the remaining bounded values of $D$, also $a$ is bounded in terms of $B$. The first assertion summed over $O \( a^2 \)$ time layers, and $d \( T \) lt.tilde 1$, gives the second assertion with a different allowed constant. Finally sum over the partitioned coefficient arrays. ◻
]

We sort the cells into dyadic density bands $d \( T \) asymp d_ell$, where $d_ell = d_max 2^(- ell)$, $ell gt.eq 0$, and $d_max$ is a fixed upper bound. Shifting this index by a fixed amount has no effect. Only $O \( log h \)$ bands need occur. Indeed if the total measure of the domain is already less than $m L^4 D^(- sigma) g^(- p)$ there is nothing to prove. Otherwise, for a relevant cell the transformed domain diameter is $O \( L^2 \/ h \)$, and the strictly positive weight in (8.18) gives

#[#set math.equation(numbering: n => "(8.24)")
 $ d \( T \) gt.tilde \( m h^3 \)^(- 1) mu \( upright("domain") \) \( 1 + C L^2 \/ h \)^(- P) gt.tilde a^(4 - 2 P) h^(1 - P) D^(- sigma) g^(- p) . $ <eq:dyadic-density-lower>]

Here $L = a h$, and fixed powers of $a \, D \, g$ are bounded by fixed powers of $X$, which in turn are bounded by fixed powers of $h$. Thus $d \( T \) gt.eq c_B h^(- C)$ with a fixed $C$. This band count will only be used with a power gain in $h$; it will not remain in the final bound.

=== 8.5 Two bands and the bilinear frame estimate <two-bands-and-the-bilinear-frame-estimate>

For every coarse interval satisfying (8.15), summably split its threshold over the density bands. At least one band field then has modulus at least

#[#set math.equation(numbering: n => "(8.25)")
 $ A_ell = c delta_0 \( 1 + ell \)^(- 2) lambda . $ <eq:dyadic-band-level>]

The constant $c > 0$ is fixed sufficiently small that the sum of these thresholds is less than the significant-interval threshold. Choose one such band for each significant interval. Fix a sufficiently large exponent $C_d$, to be chosen in the tiny-band estimate below. If one selected band has $d < X^(- C_d)$, pair its interval with a separated significant interval. Otherwise there are only $O \( C_d log X \)$ selected bands. By increasing $B$, the number $c delta_0^(- eta)$ in (8.15) exceeds a sufficiently large multiple of this band count. Pigeonholing gives two separated coarse intervals with the same band. Here “separated” means distance at least a fixed multiple of $delta_0$; excluding a bounded number of neighboring intervals suffices. The list of significant intervals is also large enough to supply the partner in the tiny-band case.

Partition time into intervals $J$ of length $h^2$. For each cluster, $J$, separated pair $\( tau_1 \, tau_2 \)$, and selected bands $\( ell_1 \, ell_2 \)$, form the measurable subset where both band fields exceed the corresponding levels in (8.25). Restrict to the high points under consideration if desired. Denote its mass by $M_0$, and put

#[#set math.equation(numbering: n => "(8.26)")
 $ E_i = sum_(theta subset tau_i \, med T in cal(T) \( J \)\
d \( T \) asymp d_i) s_(theta \, T)^2 \, #h(2em) d_i = d_(ell_i) \, #h(2em) i = 1 \, 2 . $ <eq:dyadic-class-energy>]

The witness subsets need not be disjoint; we use an upper bound on their sum of masses. There are at most $X^(C_6) \( log h \)^2$ relevant tuples: the cluster list and interval pairs have polynomial size in $X$, and the time partition contributes $O \( a^2 \)$ intervals.

Tuples with

#[#set math.equation(numbering: n => "(8.27)")
 $ M_0 lt.eq m h^(4 - 1 \/ 12) $ <eq:dyadic-small-mass>]

have total mass at most $X^(C_6) \( log h \)^2 m h^(4 - 1 \/ 12)$. Relative to the target this is at most

$ C X^(C_6 + sigma + C_g p_max) a^(- 4) h^(- 1 \/ 12) \( log h \)^2 \, $

which is bounded, and can be made small at large scales, by the choice of $kappa$. This discard counts tuples before normal spatial slabs are introduced, so it incurs no number of slabs.

Fix a remaining tuple. Define its two full square envelopes by

$ S_i \( z \)^2 = sum_(theta subset tau_i \, med T in cal(T) \( J \)\
d \( T \) asymp d_i) s_(theta \, T)^2 \( 1 + "dist" \( F_theta \( z \) \, T \) \)^(- P) . $

By (8.18), $integral S_i^2 thin d mu lt.tilde m h^3 d_i E_i$. Markov’s inequality retains at least half the witness mass with both bounds

#[#set math.equation(numbering: n => "(8.28)")
 $ S_i lt.eq B_i \, #h(2em) B_i = C (frac(m h^3 d_i E_i, M_0))^(1 \/ 2) . $ <eq:dyadic-markov>]

The constant $C$ here is large and absolute. The first estimate in (8.20), $d_i lt.tilde 1$, and the reverse of (8.27) give

#[#set math.equation(numbering: n => "(8.29)")
 $ B_i lt.tilde h^(- 3 \/ 2 + 1 \/ 24) \, #h(2em) A_(ell_i) / B_i gt.tilde h^(1 \/ 8) delta_0 g a^(- 4 \/ 3) \( 1 + ell_i \)^(- 2) . $ <eq:dyadic-ratios>]

Since $g gt.eq D^(- 1)$ and $ell_i = O \( log h \)$, the right side of the ratio estimate is bounded below by $h^(1 \/ 8)$ divided by a fixed power of $X$ and by $C_B \( log h \)^2$. Our scale hierarchy makes it larger than the fixed threshold-ratio constant in Theorem 28. The same hierarchy ensures $delta_0 gt.eq h^(- 1 \/ 2)$. Zero class energy would give an identically zero class field, so it cannot occur in a tuple with positive witness mass.

#thm([Lemma 8.6.])[
  (Frame estimate for one tuple).  #emph[For every tuple remaining after (8.27), 
#[#set math.equation(numbering: n => "(8.30)")
 $ M_0 lt.tilde delta_0^(- C) m h frac(B_1^2 B_2^2, A_(ell_1)^2 A_(ell_2)^2) (frac(h^3 E_1, A_(ell_1)^2) + frac(h^3 E_2, A_(ell_2)^2)) . $ <eq:dyadic-frame-substitution>]

 In particular, 
#[#set math.equation(numbering: n => "(8.31)")
 $ lambda^6 M_0^3 lt.tilde delta_0^(- C) \( 1 + ell_1 + ell_2 \)^C m^3 h^10 d_1 d_2 E_1 E_2 \( E_1 + E_2 \) . $ <eq:dyadic-cubic-mass>]

]
] <lem:dyadic-tuple>

#proof[
  Partition the normal coordinate into slabs of width $h$. In a slab centered at $y_0$, only boundedly many normal cell indices $T_y$ can contribute, and on $J$ only boundedly many time indices $T_t$ can contribute. Write $t = t_0 + s$ with $t_0$ an endpoint of $J$. For a composite cell in (8.19), the tangential carrier has frequency $v_theta$, and its intercept in the time coordinate $s$ is
  #[#set math.equation(numbering: n => "(8.32)")
   $ b_(theta \, T) = h T_x + 2 v_theta t_0 . $ <eq:dyadic-recentered-intercept>]
  The fine centers are spaced at scale $h^(- 1)$. At each such center, $T_x$ runs over an integer lattice translated by $2 v_theta t_0 \/ h$; the bounded number of normal and time indices thus gives the required one-dimensional phase-space counts uniformly in $t_0$. The packet profiles are compact and smooth on the $h \, h^2$ scales, by the definition of $s_(theta \, T)$.
  Expand these profiles, with a fixed smooth cutoff on an enlargement of the slab, in the variable $\( y - y_0 \) \/ h$. The mode packets can be written with scalar amplitudes at most
  $ C s_(theta \, T) chevron.l n chevron.r^(- N_1) \, #h(2em) chevron.l n chevron.r = \( 1 + n^2 \)^(1 \/ 2) \, $
  and uniformly bounded required tangential profile derivatives, for a fixed large $N_1$. This follows by integrating the Fourier coefficients by parts, using enough derivatives in the definition of $s$. The external Fourier phases have modulus one at every witness.
  For the cells belonging to this slab and time bin, the omitted normal and native time displacements in $F_theta \( z \) - T$ are bounded at a witness. Hence the one-dimensional envelope weight in Theorem 28, after (8.32), is at most a fixed multiple of the full weight defining $S_i$ there. On the set retained in (8.28), the $n$th mode envelope is consequently bounded by $C B_i chevron.l n chevron.r^(- N_1)$. Its energy parameter $H_i^(*)$ in (5.1) is at most $C h^3 E_(i \, upright("slab")) chevron.l n chevron.r^(- 2 N_1)$, where $E_(i \, upright("slab"))$ is the part of (8.26) near this slab.
  Whenever a band field has modulus at least $A_(ell_i)$, some Fourier mode has modulus at least $c A_(ell_i) chevron.l n chevron.r^(- 2)$. For each pair of selected modes apply Theorem 28 at separation $delta_0$. The threshold-to-envelope ratios only improve with $\| n \|$ when $N_1 > 2$, so (8.29) verifies its ratio hypothesis uniformly in the modes. The factors in the frame estimate are summable over the two mode indices: for example its first energy term has powers $chevron.l n_1 chevron.r^(- 4 N_1 + 8) chevron.l n_2 chevron.r^(- 2 N_1 + 4)$. Take $N_1 > 3$, with sufficient additional regularity for all derivatives.
  The projection to $\( x \, t \)$ of the measure restricted to a slab has mass at most $C m h$ on any unit square: its inverse image has dimensions $O \( 1 \) \, O \( h \) \, O \( 1 \)$ and is covered by $O \( h \)$ unit balls. This is an upper bound on the full projected measure, regardless of which normal coordinate supplied a witness. Multiplying the unit-square count from (5.1) by $C m h$, and summing the modes, bounds the retained witness mass in this slab by
  $ C delta_0^(- C) m h frac(B_1^2 B_2^2, A_(ell_1)^2 A_(ell_2)^2) (frac(h^3 E_(1 \, upright("slab")), A_(ell_1)^2) + frac(h^3 E_(2 \, upright("slab")), A_(ell_2)^2)) . $
  Each composite cell belongs to boundedly many enlarged slabs, and therefore $sum_(upright("slab")) E_(i \, upright("slab")) lt.tilde E_i$. Summing costs no number of slabs and proves (8.30), since at least half of $M_0$ was retained by Markov.
  Finally substitute (8.28) and (8.25). The product of the two squared envelope bounds supplies $m^2 h^6 d_1 d_2 E_1 E_2 \/ M_0^2$; the projected square mass and frame energy supply $m h dot.op h^3$. Thus the total factor is $m^3 h^10 \/ M_0^2$. The six threshold powers contribute $lambda^(- 6)$ times a fixed power of $delta_0^(- 1)$ and of $1 + ell_1 + ell_2$. Rearranging proves (8.31). ◻
]

=== 8.6 Summing the bands and closing the induction <summing-the-bands-and-closing-the-induction>

First suppose at least one selected band is tiny. The unweighted energy bound $E_i lt.tilde h^(- 2)$ in (8.20) and the cube root of (8.31) give

#[#set math.equation(numbering: n => "(8.33)")
 $ lambda^2 M_0 lt.tilde delta_0^(- C) \( 1 + ell_1 + ell_2 \)^C m h^(4 \/ 3) \( d_1 d_2 \)^(1 \/ 3) . $ <eq:dyadic-tiny-band>]

For dyadic bands, geometric decay absorbs the polynomial index factors:

$ sum_(min \( d_1 \, d_2 \) < X^(- C_d)) \( 1 + ell_1 + ell_2 \)^C \( d_1 d_2 \)^(1 \/ 3) lt.tilde X^(- C_d \/ 6) . $

The constants here depend on the fixed exponent $C$. After summing over clusters, time bins and coarse interval pairs, all other costs in (8.33) are at most a fixed power of $X$, uniformly for $u lt.eq 1$. Choose $C_d$ large enough to absorb this power, together with $D^sigma g^(p - 2)$ for (8.13); using $h^(4 \/ 3) lt.eq L^(4 \/ 3)$, this gives

$ lambda^2 sum_(upright("tiny")) M_0 lt.tilde m L^(4 \/ 3) D^(- sigma) g^(- \( p - 2 \)) . $

This is precisely the target multiplied by $lambda^2$, with a constant independent of induction.

For the other tuples the two density bands coincide, say $d_1 asymp d_2 asymp d gt.eq X^(- C_d)$. Then $ell_i = O \( C_d log X \)$, and

$ #scale(x: 120%, y: 120%)[\(] E_1 E_2 \( E_1 + E_2 \) #scale(x: 120%, y: 120%)[\)]^(1 \/ 3) lt.eq C \( E_1 + E_2 \) . $

The cube root of (8.31) gives

#[#set math.equation(numbering: n => "(8.34)")
 $ lambda^2 M_0 lt.tilde delta_0^(- C) \( log X \)^C m h^(10 \/ 3) d^(2 \/ 3) \( E_1 + E_2 \) . $ <eq:dyadic-common-band>]

We now sum energies rather than the number of tuples. A composite cell appears only in its own cluster, in boundedly many $J$, in its specified density band and coarse interval, and for at most $O \( delta_0^(- 1) \)$ choices of the other coarse interval at that band. There is consequently only an additional fixed power of $delta_0^(- 1)$ in the multiplicity. In particular, no factor $a^2$ from time bins, no number of clusters, and no number of density bands is paid in this sum. The weighted estimate in (8.20) therefore gives

#[#set math.equation(numbering: n => "(8.35)")
 $ lambda^2 sum_(upright("common")) M_0 & lt.tilde_B X^(C_f u) \( log X \)^(C_f) m h^(10 \/ 3) #scale(x: 120%, y: 120%)[\(] h^(- 2) a^(4 \/ 3) D^(- c_s) #scale(x: 120%, y: 120%)[\)]\
 & = C_B X^(C_f u) \( log X \)^(C_f) m L^(4 \/ 3) D^(- c_s) . $ <eq:dyadic-final-energy>]

The fixed exponent $C_f$ includes the just described partner multiplicity; it is the exponent used in choosing $u$. The transforms vary with $theta$ and with the cluster, but their coefficient arrays are disjoint, exactly as required in the proof of (8.20).

The target after multiplication by $lambda^2$ is $m L^(4 \/ 3) D^(- sigma) g^(- \( p - 2 \))$. Since $g lt.eq X^(C_g)$, the ratio of (8.35) to this quantity is at most

$ C_B X^(C_f u + C_g \( p - 2 \)) \( log X \)^(C_f) D^(sigma - c_s) . $

It is bounded by a fixed constant depending on $B$ by the strict second inequality in (8.4). This proves the required estimate for the common-band tuples with no growing loss in $L$ when $D$ and $g$ are fixed.

===== 8.6.1 Compatible order of parameter choices. <compatible-order-of-parameter-choices.>

We now verify that the conditions used in the proof can be imposed together. The values of $p_max$ and $eta$ were fixed in (8.2). Temporarily restricting $0 < u lt.eq 1$ and $0 < sigma lt.eq 1$ bounds all geometric losses by fixed powers of $X$. Choose $C_g$ large enough for (8.12), using only these powers and the positive gap $p_0 - p_max$. Choose $C_a$ larger still for (8.14), and then choose $C_d$ for the tiny-band sum. These exponents are independent of how small $u$ will be.

The equal-band estimate (8.35) has loss $X^(C_f u) \( log X \)^(C_f)$, where the fixed $C_f$ accounts for the frame separation loss and the coarse-interval multiplicity. Choose $u > 0$ so small that $C_f u < c_s \/ 4$. Next choose $kappa > 0$ small in terms of all the fixed powers just chosen. For any fixed required $K$, the relations $X lt.eq B L^kappa$ and $h asymp L \/ X^(C_a)$ give $h gt.eq X^K$ at sufficiently large $L$ if $kappa \( C_a + K \) < 1$. This supplies the geometric scale conditions, $delta_0 gt.eq h^(- 1 \/ 2)$, the frame threshold ratios, and the small-mass discard.

Choose $p > 2$ sufficiently close to $2$, with $p lt.eq p_max$, and then choose $sigma > 0$ sufficiently small to satisfy all three strict inequalities in (8.4). Finally choose $B$ large enough to contract the recursive terms and to supply the angular pigeonhole argument. Constants depending on $B$ are allowed in the nonrecursive estimates. Enlarge the fixed base scale $L_0$ to cover the remaining comparisons involving $B$. Every fixed constant and exponent is chosen before the induction constant and the variable scales $L \, D$.

#proof[
  #emph[Completion of the proof of Theorem 41.] The sparse range and bounded scales were handled directly. In the remaining range, the prefix exceptions, all dyadic-cap exceptions, and the coarse cluster exceptions cost less than half the desired bound with constant $C_(upright("ind"))$, by (8.11). Every other original high point either is handled by the large-level strip estimate or total mass, lies in a discarded plate intersection, belongs to a small-mass tuple, or is covered by the tiny-band or common-band bounds. All these latter costs are bounded by a fixed multiple of $m L^4 D^(- sigma) g^(- p)$ independently of $C_(upright("ind"))$. Choose $C_(upright("ind"))$ once to be twice their total constant and large enough for the initial cases. The two inductions close. Homogeneity supplies the factor $parallel c parallel_(ell^2)^p$ for arbitrary subarrays and completes the theorem. ◻
]

== 9 Endpoint square summation and the order of limits <sec:endpoint>

The exponent $p > 2$ in Theorem 41 has a final, essential use. It supplies a positive convexity deficit on a common dyadic time tree. Combined with spatial localization, this gives a square sum over frequency scales and hence the Sobolev norm at the endpoint. We then construct a representative continuous in time and verify that the prescribed Gaussian limits recover that representative at every real time on one full-measure set.

Throughout this section, $S \( t \) f = e^(i t Delta) f$ denotes the $L^2$ evolution, whose Fourier multiplier is $e^(- i t \| xi \|^2)$. When $hat(f)$ has compact support, we also use $S \( t \) f \( x \)$ for its absolutely convergent Fourier integral. This is continuous in $\( x \, t \)$, since then $hat(f) in L^1$. Constants may depend on fixed annular supports and smooth cutoff functions, but are independent of frequency, the center of a spatial ball, and every measurable choice of time made below.

=== 9.1 From packet distributions to a short-time maximal estimate <from-packet-distributions-to-a-short-time-maximal-estimate>

For $p > 0$ and measurable $h$ on $A subset bb(R)^2$, we use the weak $L^p$ quasinorm

$ parallel h parallel_(L^(p \, oo) \( A \)) = sup_(lambda > 0) lambda \| { x in A : \| h \( x \) \| > lambda } \|^(1 \/ p) . $

#thm([Proposition 9.1.])[
  (Short-time maximal estimate).  #emph[Let $p > 2$ be the exponent in Theorem 41. Fix $0 < c_0 < C_0 < oo$. If $N gt.eq 1$ is dyadic and 
$ "supp" hat(f)_N subset { xi in bb(R)^2 : c_0 N lt.eq \| xi \| lt.eq C_0 N } \, $

 then, on every unit ball $B subset bb(R)^2$, 
#[#set math.equation(numbering: n => "(9.1)")
 $ ∥sup_(0 < t < 1 \/ N) \| S \( t \) f_N \|∥_(L^(p \, oo) \( B \)) lt.eq C N^(1 \/ 3) parallel f_N parallel_2 . $ <eq:src24>]

 The same estimate holds on every translated time interval of length at most $1 \/ N$, with either endpoint included.]
] <prop:shortmax>

#proof[
  We first apply Theorem 41 at $D = 1$ to an arbitrary measurable spatial graph in unit-frequency variables. Let $cal(B)$ be a spatial ball of radius $O \( L^2 \)$, let $T : cal(B) arrow.r \[ 0 \, L^2 \]$ be measurable, and define
  #[#set math.equation(numbering: n => "(9.2)")
   $ mu \( F \) = integral_(cal(B)) upright(bold(1))_F \( X \, T \( X \) \) thin d X . $ <eq:endpoint-graph-measure>]
  This is the pushforward of spatial area, regardless of the regularity of $T$. A space-time ball of radius $r$ projects into a spatial disk of the same radius, so $mu \( B_r \) lt.eq pi r^2$. A tube of width $L$ and time length $L^2$, with one of the bounded velocities in the packet class, is covered by $O \( L \)$ space-time balls of radius $C L$. Its $mu$-mass is therefore $O \( L^3 \)$. A transverse enlargement by $2^ell$ can be covered by $O \( L 2^(2 ell) \)$ such balls. Summing these bounds against the decay $2^(- M ell)$, where $M$ is the fixed large exponent in (2.4), proves that condition with $D = 1$ after a fixed enlargement of $m$. All constants here are uniform over $T$, the packet intercepts, and the center of $cal(B)$.
  We explain why the compact packet estimate applies to an exact unit-frequency extension
  $ E v \( X \, T \) = integral e^(i \( X dot.op eta - T \| eta \|^2 \)) v \( eta \) thin d eta \, #h(2em) "supp" v subset { c_0 lt.eq \| eta \| lt.eq C_0 } . $
  Apply Lemma 3 at packet width $L$. It gives $v = sum_(omega \, n) c_(omega \, n) v_(omega \, n)$, with $omega in L^(- 1) bb(Z)^2$, $n in bb(Z)^2$, and
  $ sum_(omega \, n) \| c_(omega \, n) \|^2 lt.eq C parallel v parallel_2^2 . $
  Its exact profile formula (2.9) reads
  $ E v_(omega \, n) \( X \, T \) = L^(- 1) e^(i \( X dot.op omega - T \| omega \|^2 \)) H (frac(X - L n - 2 omega T, L) \, T / L^2) \,\
H \( z \, s \) = frac(1, 2 pi) integral psi \( zeta \) e^(i \( z dot.op zeta - s \| zeta \|^2 \)) thin d zeta \, $
  where $psi$ is the fixed smooth frequency cutoff in that lemma. The phase-space counts are bounded, and, on every fixed bounded $s$-interval, all required derivatives of $H$ decrease faster than any fixed power of $\| z \|$. The remaining issue is its noncompact spatial support; we resolve it by summing compact layers.
  To obtain the compact profiles of (2.2), choose a smooth time cutoff equal to one on $\[ 0 \, 1 \]$, and a spatial partition of unity $sum_(q in bb(Z)^2) rho \( z - q \) = 1$ with $rho$ compactly supported. Fix the finite profile derivative order required by Theorem 41. In the $q$th term replace the intercept $L n$ by $L n + L q$. The new profile is the old profile evaluated at $z + q$, multiplied by $rho \( z \)$ and the time cutoff. For any prescribed large $A$, its required derivative bounds are $O \( \( 1 + \| q \| \)^(- A) \)$. Put this factor into the coefficients. For each fixed $q$, all phase-space intercepts undergo the same translation, so the counting bounds are preserved, and the new coefficient norm is at most
  $ C_A \( 1 + \| q \| \)^(- A) parallel v parallel_2 . $
  Thus every layer is an admissible array for Theorem 41.
  The exponent $A$ is chosen once, after the required derivative order; the fixed profile bound may depend on both, but never on $L$ or $q$. For completeness, let $b_q > 0$ satisfy $sum_q b_q = 1$ and $b_q asymp \( 1 + \| q \| \)^(- 3)$. Apply (8.1) to the $q$th layer at threshold $b_q lambda$, using homogeneity in its coefficients. Choosing $A$ sufficiently large makes $sum_q b_q^(- p) \( 1 + \| q \| \)^(- A p)$ finite and yields
  #[#set math.equation(numbering: n => "(9.3)")
   $ mu { \| E v \| > lambda } lt.eq C L^4 #scale(x: 120%, y: 120%)[\(] lambda L^(4 \/ 3) #scale(x: 120%, y: 120%)[\)]^(- p) parallel v parallel_2^p . $ <eq:endpoint-exact-weak>]
  These operations can first be made on finite packet sums. At a point, each frequency label has only $O \( 1 \)$ intercepts contributing to a fixed compact layer, and there are $O \( L^2 \)$ frequency labels. Cauchy–Schwarz therefore bounds that layer by $C \( 1 + \| q \| \)^(- A) parallel v parallel_2$, uniformly in $L$; the factor $L$ from the square root of the label count cancels the packet amplitude $L^(- 1)$. The same bound holds with the coefficient norm of any tail in place of $parallel v parallel_2$. Taking $A > 2$ makes the layer sum absolutely and uniformly convergent, and square-summability makes finite coefficient truncations converge uniformly as well. Fourier-series partial sums also converge in $L^2$ on a fixed bounded frequency set, hence their exact extensions converge uniformly by Cauchy–Schwarz in frequency. These observations identify the compact layer sum with the exact extension. Passing to the limit in the distribution bound, first with a slightly smaller threshold, proves (9.3) for arbitrary $v in L^2$ with the indicated support. This passage uses exact extensions and therefore introduces no time-dependent choices of representatives.
  Now take $L = sqrt(N)$ and $v \( eta \) = N hat(f)_N \( N eta \)$. Then $parallel v parallel_2 = parallel hat(f)_N parallel_2$, and
  #[#set math.equation(numbering: n => "(9.4)")
   $ S \( t \) f_N \( x \) = \( 2 pi \)^(- 2) N thin E v \( N x \, N^2 t \) . $ <eq:endpoint-frequency-scaling>]
  A unit spatial ball becomes a ball of radius $N = L^2$, and a time interval of length $1 \/ N$ becomes one of length $N = L^2$. For a measurable physical graph $t = t \( x \)$, its lifted spatial area in the new coordinates is $N^2$ times the original area. This cancels $L^4$ in (9.3). The threshold scale in the physical field is
  $ N L^(- 4 \/ 3) = N^(1 \/ 3) . $
  Consequently, for every such graph and every $lambda > 0$,
  $ \| { x in B : \| S \( t \( x \) \) f_N \( x \) \| > lambda } #scale(x: 120%, y: 120%)[\|] lt.eq C (frac(N^(1 \/ 3) parallel f_N parallel_2, lambda))^p . $
  For finitely many times choose, measurably, the first time attaining the largest modulus. Apply this graph bound, then increase the finite list to a countable dense set. Continuity of the bounded-frequency evolution identifies the resulting supremum with the supremum over all times and allows the endpoints. Finally, replacing $f_N$ by $S \( t_0 \) f_N$ translates the interval without changing either its Fourier support or its $L^2$ norm. ◻
]

=== 9.2 Two dual estimates on a short time interval <two-dual-estimates-on-a-short-time-interval>

Fix a unit spatial ball $Omega$, a measurable function $t : Omega arrow.r \[ 0 \, 1 \)$, and a measurable complex function $w$ with $\| w \| lt.eq 1$. These choices remain the same at every frequency. For $N = 2^j$, $j gt.eq 1$, let $chi_N \( xi \) = chi \( xi \/ N \)$ be a smooth cutoff supported on a fixed annulus away from zero. The same argument permits finitely many fixed choices of $chi$. For a half-open time interval $I subset \[ 0 \, 1 \)$, put

#[#set math.equation(numbering: n => "(9.5)")
 $ E_I & = { x in Omega : t \( x \) in I } \, & m_I & = \| E_I \| \,\
G_N \( I \) \( xi \) & = chi_N \( xi \) integral_(E_I) w \( x \) e^(i \( x dot.op xi - t \( x \) \| xi \|^2 \)) thin d x \, & e_j \( I \) & = N^(- 2 \/ 3) parallel G_N \( I \) parallel_2^2 . $ <eq:endpoint-dual-definitions>]

The quantities $m_I$ are the masses of a single measure on time, the pushforward of $upright(bold(1))_Omega d x$ under $t$. This measure can have atoms; all interval partitions below are half-open so membership is unique.

We will use the elementary weak-space integration bound

#[#set math.equation(numbering: n => "(9.6)")
 $ integral_F \| h \| lt.eq frac(p, p - 1) parallel h parallel_(L^(p \, oo)) \| F \|^(1 - 1 \/ p) . $ <eq:endpoint-weak-integration>]

Indeed the layer-cake formula bounds its left side by $integral_0^oo min { \| F \| \, \( parallel h parallel_(L^(p \, oo)) \/ lambda \)^p } thin d lambda$; splitting where the two terms agree gives the stated expression.

The kernel for pairings of the dual functions is

#[#set math.equation(numbering: n => "(9.7)")
 $ K_N \( z \, tau \) = integral \| chi_N \( xi \) \|^2 e^(i \( z dot.op xi - tau \| xi \|^2 \)) thin d xi = N^2 integral \| chi \( eta \) \|^2 e^(i \( N z dot.op eta - N^2 tau \| eta \|^2 \)) thin d eta . $ <eq:endpoint-kernel>]

In particular,

$ chevron.l G_N \( I \) \, G_N \( J \) chevron.r = integral_(E_I) integral_(E_J) w \( x \) overline(w \( y \)) K_N \( x - y \, t \( x \) - t \( y \) \) thin d y thin d x . $

Only the smooth frequency variable will be differentiated in estimates for this kernel. No regularity of the graph $t \( x \)$ is needed.

#thm([Lemma 9.2.])[
  (Separation in time).  #emph[Let $cal(D)_j$ be the dyadic partition of $\[ 0 \, 1 \)$ into intervals of length $2^(- j) = 1 \/ N$. Then 
#[#set math.equation(numbering: n => "(9.8)")
 $ e_j \( \[ 0 \, 1 \) \) lt.eq C sum_(I in cal(D)_j) e_j \( I \) + C N^(- 2) . $ <eq:endpoint-time-almost-orthogonality>]

]
] <lem:endpoint-time-separation>

#proof[
  For two intervals whose indices differ by at most a sufficiently large fixed integer $C_1$, Hilbert-space Cauchy–Schwarz bounds their pairing by the geometric mean of their squared norms. Each interval has only $O \( C_1 \)$ such neighbors, so their total contribution is at most $C sum_I parallel G_N \( I \) parallel_2^2$.
  For all other pairs, $\| t \( x \) - t \( y \) \| gt.eq \( C_1 - 1 \) \/ N$, while $\| x - y \| lt.eq 2$. Write $z = x - y$ and $tau = t \( x \) - t \( y \)$. On the support of $chi$, the gradient
  $ nabla_eta \( N z dot.op eta - N^2 tau \| eta \|^2 \) = N z - 2 N^2 tau eta $
  has magnitude at least $c N^2 \| tau \|$ if $C_1$ is large enough, since the annulus has a positive inner radius. Dividing the phase by $N^2 \| tau \|$ gives a smooth phase with uniformly bounded derivatives and a uniformly nonvanishing gradient. Repeated integration by parts gives, for every fixed integer $M$,
  $ \| K_N \( z \, tau \) \| lt.eq C_M N^2 \( N^2 \| tau \| \)^(- M) lt.eq C_M N^(2 - M) . $
  Integrate this bound once over the full set of far pairs, whose spatial measure is at most $\| Omega \|^2$. There is no additional factor for the number of interval pairs. After normalization by $N^(- 2 \/ 3)$, taking $M = 4$ gives an error $O \( N^(- 8 \/ 3) \)$, which is bounded by $O \( N^(- 2) \)$. ◻
]

#thm([Lemma 9.3.])[
  (Mass and spatial localization).  #emph[If $I in cal(D)_j$ and $J subset I$ is a dyadic descendant at relative depth $k$, where $0 lt.eq k lt.eq j$, set $r = 2^(- k)$. Then 
#[#set math.equation(numbering: n => "(9.9)")
 $ e_j \( J \) & lt.eq C m_J^(2 - 2 \/ p) \,\
e_j \( J \) & lt.eq C r^(2 \/ 3) m_J . $ <eq:endpoint-mass-bound>]

 Consequently, with 
$ alpha = 3 / 2 - 1 / p = 1 + frac(1 - 2 \/ p, 2) > 1 \, $

 we have 
#[#set math.equation(numbering: n => "(9.10)")
 $ e_j \( J \) lt.eq C 2^(- k \/ 3) m_J^alpha . $ <eq:endpoint-interpolated-dual>]

]
] <lem:endpoint-localized-dual>

#proof[
  For the first estimate, dualize the frequency $L^2$ norm in (9.5). Against a frequency test function of norm one, the spatial integrand is an annular Schrödinger extension with input norm bounded by a fixed constant. Its values at $t \( x \)$ are bounded by its short-time maximal function on the interval $J$, whose length is at most $1 \/ N$. Proposition 47 and (9.6) therefore give
  $ parallel G_N \( J \) parallel_2 lt.eq C N^(1 \/ 3) m_J^(1 - 1 \/ p) . $
  Squaring and normalizing proves (9.9).
  For the second estimate, partition space into half-open squares $Q$ of side $r$, and write $G_N \( J \, Q \)$ for the same dual integral over $E_J ∩ Q$. Set $m_(J \, Q) = \| E_J ∩ Q \|$. Declare two squares neighbors if their grid indices differ by at most a sufficiently large fixed constant $C_2$. Neighbor interactions are bounded by $C sum_Q parallel G_N \( J \, Q \) parallel_2^2$, using Cauchy–Schwarz and the bounded number of neighbors of each square.
  For non-neighboring squares, $\| x - y \| gt.eq c C_2 r$, whereas $\| t \( x \) - t \( y \) \| lt.eq \| J \| = r \/ N$. Choose $C_2$ using the outer radius of the annular support. The spatial part now dominates the gradient of the phase in (9.7), and integration by parts gives
  $ \| K_N \( x - y \, t \( x \) - t \( y \) \) \| lt.eq C N^2 \( 1 + N \| x - y \| \)^(- 4) . $
  The right side has a uniformly bounded spatial integral. Since the graph measure is projected spatial area and $\| w \| lt.eq 1$, the total normalized contribution of these far pairs is at most
  #[#set math.equation(numbering: n => "(9.11)")
   $ C N^(- 2 \/ 3) integral_(E_J) integral_(bb(R)^2) N^2 \( 1 + N \| x - y \| \)^(- 4) thin d y thin d x lt.eq C N^(- 2 \/ 3) m_J lt.eq C r^(2 \/ 3) m_J . $ <eq:endpoint-spatial-far-error>]
  The last inequality is exactly where $k lt.eq j$, equivalently $N r gt.eq 1$, is used.
  It remains to estimate a single square contribution. Let $x_Q$ be the center of $Q$ and $t_J$ the left endpoint of $J$. Make the change
  $ x = x_Q + r X \, #h(2em) t = t_J + r^2 s \, #h(2em) xi = eta \/ r . $
  The new graph lies in a unit spatial ball, has spatial area $r^(- 2) m_(J \, Q)$, and has times in an interval of length
  $ frac(\| J \|, r^2) = frac(1, N r) . $
  The new annular frequency is $N r gt.eq 1$. The dual function acquires the factor $r^2$ from $d x$ and a unimodular factor from $x_Q \, t_J$; changing frequency measure gives
  $ parallel G_N \( J \, Q \) parallel_2^2 = r^2 parallel tilde(G)_(N r) parallel_2^2 . $
  Apply Proposition 47 and (9.6) directly at the normalized scale, including its lowest possible value $N r = 1$. This gives
  $ N^(- 2 \/ 3) parallel G_N \( J \, Q \) parallel_2^2 & lt.eq C N^(- 2 \/ 3) r^2 \( N r \)^(2 \/ 3) \( r^(- 2) m_(J \, Q) \)^(2 - 2 \/ p)\
 & = C r^(- 4 \/ 3 + 4 \/ p) m_(J \, Q)^(2 - 2 \/ p) lt.eq C r^(2 \/ 3) m_(J \, Q) \, $
  where the last step uses $m_(J \, Q) lt.eq r^2$ and $2 - 2 \/ p > 1$. Sum this estimate over $Q$, include the bounded neighbor interactions and (9.11), and obtain (9.9). Finally, the geometric mean of (9.9) and (9.9) is (9.10). ◻
]

=== 9.3 The common time tree and the Sobolev square norm <the-common-time-tree-and-the-sobolev-square-norm>

The next step uses the same mass assignment $I mapsto m_I$ for every $j$. Choosing a different graph separately at each frequency would destroy the telescoping argument.

#thm([Lemma 9.4.])[
  (Summation on the common time tree).  #emph[For every graph and phase choice in (9.5), 
#[#set math.equation(numbering: n => "(9.12)")
 $ sum_(j gt.eq 1) 2^(- 2 j \/ 3) parallel G_(2^j) \( \[ 0 \, 1 \) \) parallel_2^2 lt.eq C . $ <eq:endpoint-square-sum>]

 The constant is independent of $t$, $w$, and the center of $Omega$.]
] <lem:endpoint-square-sum>

#proof[
  Fix $j gt.eq 1$ and $I in cal(D)_j$. Starting from $H_(I \, 0) = I$, select at each step a child with larger mass, breaking ties consistently by choosing the left child. Call the selected child $H_(I \, k)$ and the other child $P_(I \, k)$, for $1 lt.eq k lt.eq j$. Thus
  $ m_(P_(I \, k)) lt.eq m_(H_(I \, k)) \, #h(2em) I = (dot(union.big)_(k = 1)^j P_(I \, k)) dot(union) H_(I \, j) . $
  The second identity is an exact partition of time, including any atoms of the time measure. Figure 3 records this partition and the two different depths used in the summation.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$I=H_(I,0)$]]])])
  content((-1.8, -1.2), [#box(inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff0e0"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$P_(I,1)$]]])])
  content((1, -1.2), [#box(inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$H_(I,1)$]]])])
  content((-0.8, -2.4), [#box(inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff0e0"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$P_(I,2)$]]])])
  content((2, -2.4), [#box(inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$H_(I,2)$]]])])
  content((0.2, -3.6), [#box(inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff0e0"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$P_(I,3)$]]])])
  content((3, -3.6), [#box(inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$H_(I,3)$]]])])
  line((-0.4768, -0.3179), (-1.323, -0.8821), stroke: (paint: rgb("#a65300"), thickness: 0.6pt, miter-limit: 10))
  line((0.2649, -0.3179), (0.7351, -0.8821), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10))
  content((0.5, -0.6), [#text(size: 8pt)[larger mass]], anchor: "west", padding: 0.1176cm)
  line((0.5232, -1.518), (-0.3232, -2.082), stroke: (paint: rgb("#a65300"), thickness: 0.6pt, miter-limit: 10))
  line((1.265, -1.518), (1.735, -2.082), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10))
  line((1.523, -2.718), (0.6768, -3.282), stroke: (paint: rgb("#a65300"), thickness: 0.6pt, miter-limit: 10))
  line((2.265, -2.718), (2.735, -3.282), stroke: (paint: rgb("#0000a6"), thickness: 1.1pt, miter-limit: 10))
  content((-2.6, 0), [#text(size: 8pt)[absolute depth $j$]], anchor: "east", padding: 0.1176cm)
  content((-2.6, -1.2), [#text(size: 8pt)[relative depth $k=1$]], anchor: "east", padding: 0.1176cm)
  content((-2.6, -2.4), [#text(size: 8pt)[$k=2$]], anchor: "east", padding: 0.1176cm)
  content((-2.6, -3.6), [#text(size: 8pt)[$k=3$]], anchor: "east", padding: 0.1176cm)
  content((3.6, -1), [#text(size: 8pt)[Dropped pieces are disjoint.#linebreak()Each is a lighter child.]], anchor: "west", padding: 0.1176cm)
  content((3.6, -2.5), [#text(size: 8pt)[Parent of $P_(I,k)$:#linebreak()absolute depth $j+k-1$.]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 3: Three steps of the heavier-child path. At each step the lighter sibling is set aside; the chosen child is split again. The dropped siblings together with the terminal child partition $I$. For fixed relative depth $k$, changing the frequency index $j$ changes the absolute depth of the parent. This makes the parents distinct in the sum controlled by the convexity deficit. ],
  ) <fig:endpoint-tree>
  By additivity of $G_N$ and the triangle inequality in frequency $L^2$, followed by (9.10),
  $ e_j \( I \)^(1 \/ 2) lt.eq C sum_(k = 1)^j 2^(- k \/ 6) m_(P_(I \, k))^(alpha \/ 2) + C 2^(- j \/ 6) m_(H_(I \, j))^(alpha \/ 2) . $
  Use Cauchy–Schwarz with weights $2^(- k \/ 6)$, including one additional terminal weight $2^(- j \/ 6)$. Their sum is bounded independently of $j$. Since $m_(H_(I \, j)) lt.eq m_I$, we obtain
  #[#set math.equation(numbering: n => "(9.13)")
   $ e_j \( I \) lt.eq C sum_(k = 1)^j 2^(- k \/ 6) m_(P_(I \, k))^alpha + C 2^(- j \/ 6) m_I^alpha . $ <eq:endpoint-heavy-path>]
  We give the convexity calculation behind the sum of the first terms. If a parent has child masses $a gt.eq b gt.eq 0$, then
  #[#set math.equation(numbering: n => "(9.14)")
   $ \( a + b \)^alpha - a^alpha - b^alpha gt.eq \( 2^alpha - 2 \) b^alpha . $ <eq:endpoint-convexity-deficit>]
  For $b > 0$, divide by $b^alpha$ and put $u = a \/ b gt.eq 1$. The function $\( u + 1 \)^alpha - u^alpha - 1$ is increasing for $u gt.eq 1$, so its minimum is $2^alpha - 2$; the case $b = 0$ is immediate. Summing parent-minus-children deficits through depth $d - 1$ telescopes to
  $ m_(\[ 0 \, 1 \))^alpha - sum_(Q in cal(D)_d) m_Q^alpha lt.eq m_(\[ 0 \, 1 \))^alpha . $
  The deficits are nonnegative. Letting $d arrow.r oo$ shows that the sum of the lighter-child $alpha$-powers over any collection of distinct dyadic parents is at most $m_(\[ 0 \, 1 \))^alpha \/ \( 2^alpha - 2 \)$.
  Now fix $k gt.eq 1$ and range over all $j gt.eq k$ and all $I in cal(D)_j$. The parent of $P_(I \, k)$ is $H_(I \, k - 1)$, at absolute depth $j + k - 1$. Different $j$ give different absolute depths; for the same $j$, different $I$ have disjoint descendants. These parents are therefore distinct. Consequently,
  $ sum_(j gt.eq k) sum_(I in cal(D)_j) m_(P_(I \, k))^alpha lt.eq frac(m_(\[ 0 \, 1 \))^alpha, 2^alpha - 2) . $
  For the terminal terms, superadditivity of the $alpha$th power gives $sum_(I in cal(D)_j) m_I^alpha lt.eq m_(\[ 0 \, 1 \))^alpha$. Thus summing (9.13), first at fixed $k$ and then in $k$, gives
  $ sum_(j gt.eq 1) sum_(I in cal(D)_j) e_j \( I \) lt.eq C m_(\[ 0 \, 1 \))^alpha (sum_(k gt.eq 1) 2^(- k \/ 6) + sum_(j gt.eq 1) 2^(- j \/ 6)) lt.eq C . $
  All sums are of nonnegative terms, so these rearrangements also follow from finite truncations. Finally apply Lemma 48 and sum its $O \( 2^(- 2 j) \)$ errors. ◻
]

#prodef([Remark 9.5.])[
  The strict inequality $p > 2$ is used quantitatively here: $alpha = 3 \/ 2 - 1 \/ p > 1$ and $2^alpha - 2 > 0$. At $p = 2$ the convexity deficit in (9.14) vanishes. The gain in the time tree therefore cannot be recovered merely from a weak $L^2$ version of (9.1).
]

#thm([Theorem 9.6.])[
  (Local strong maximal estimate).  #emph[There is a constant $C$ such that, for every $f in H^(1 \/ 3) \( bb(R)^2 \)$ whose Fourier transform has compact support and every $x_0 in bb(R)^2$, 
#[#set math.equation(numbering: n => "(9.15)")
 $ integral_(B \( x_0 \, 1 \)) sup_(0 lt.eq t < 1) \| S \( t \) f \( x \) \| thin d x lt.eq C parallel f parallel_(H^(1 \/ 3)) . $ <eq:endpoint-strong-maximal>]

 For arbitrary $f in H^(1 \/ 3) \( bb(R)^2 \)$ there is a jointly measurable representative $v_f \( x \, t \)$, $0 lt.eq t < 1$, continuous in $t$ for almost every $x$, equal to $S \( t \) f$ as an $L^2$ function for each fixed $t$, and satisfying the same bound with $S \( t \) f \( x \)$ replaced by $v_f \( x \, t \)$.]
] <thm:maximal>

#proof[
  First suppose $hat(f)$ has compact support. Take a smooth frequency partition
  $ psi_0 + sum_(j gt.eq 1) psi_j = 1 \, $
  where $psi_0$ is supported in a fixed ball and $psi_j$ is supported on an annulus $\| xi \| asymp 2^j$, with uniformly bounded overlap. Put $hat(f)_j = psi_j hat(f)$. Choose enlarged smooth annular cutoffs $chi_(2^j)$ equal to one on $"supp" psi_j$. These are the cutoffs used in Lemma 50.
  For any common graph $t \( x \)$ and phase $w \( x \)$, Fourier inversion and the definition of $G_N$ give
  $ integral_Omega w \( x \) sum_(j gt.eq 1) S \( t \( x \) \) f_j \( x \) thin d x = \( 2 pi \)^(- 2) sum_(j gt.eq 1) integral hat(f)_j \( xi \) G_(2^j) \( \[ 0 \, 1 \) \) \( xi \) thin d xi . $
  Only finitely many summands are nonzero. Cauchy–Schwarz in frequency and in $j$ bounds the modulus by
  #[#set math.equation(numbering: n => "(9.16)")
   $ C (sum_(j gt.eq 1) 2^(2 j \/ 3) parallel hat(f)_j parallel_2^2)^(1 \/ 2) (sum_(j gt.eq 1) 2^(- 2 j \/ 3) parallel G_(2^j) \( \[ 0 \, 1 \) \) parallel_2^2)^(1 \/ 2) & lt.eq C parallel f parallel_(H^(1 \/ 3)) . $ <eq:endpoint-frequency-cauchy-schwarz>]
  The first factor is bounded by the Sobolev square norm because on the support of $psi_j$ one has $2^(2 j \/ 3) asymp \( 1 + \| xi \|^2 \)^(1 \/ 3)$, and the supports overlap boundedly. The second factor is bounded by (9.12). The low-frequency term satisfies $sup_(x \, t) \| S \( t \) f_0 \( x \) \| lt.eq C parallel f_0 parallel_2$ by Cauchy–Schwarz on its fixed frequency ball, so its integral over $Omega$ has the same bound.
  To recover the maximal function, take any finite list of times in $\[ 0 \, 1 \)$ and let $t \( x \)$ be the first time attaining the maximal modulus of $S \( t \) f \( x \)$ on that list. Set $w \( x \) = overline(S \( t \( x \) \) f \( x \)) \/ \| S \( t \( x \) \) f \( x \) \|$ where the denominator is nonzero, and set $w \( x \) = 0$ otherwise. These are measurable choices, and the linearized integral is exactly the integral of the finite maximum. Increase the list to a countable dense subset of $\[ 0 \, 1 \)$ containing zero. Continuity in time and monotone convergence prove (9.15). The estimates above used only fixed ball radii and spatial differences, so the constant is uniform in $x_0$.
  For general $f$, choose $f_n$ with $hat(f)_n in C_c^oo \( bb(R)^2 \)$ and $parallel f_n - f parallel_(H^(1 \/ 3)) lt.eq 2^(- n)$. In particular,
  $ sum_(n gt.eq 1) parallel f_(n + 1) - f_n parallel_(H^(1 \/ 3)) < oo . $
  Define the measurable functions
  $ d_n \( x \) = sup_(0 lt.eq t < 1) \| S \( t \) f_(n + 1) \( x \) - S \( t \) f_n \( x \) \| . $
  The supremum can be taken over rational times, together with zero. By (9.15),
  $ sup_(x_0 in bb(R)^2) integral_(B \( x_0 \, 1 \)) sum_(n gt.eq 1) d_n \( x \) thin d x lt.eq C sum_(n gt.eq 1) parallel f_(n + 1) - f_n parallel_(H^(1 \/ 3)) < oo . $
  A countable covering of $bb(R)^2$ by unit balls therefore gives a single full-measure set $E_0$ on which $sum_n d_n \( x \) < oo$. For each $x in E_0$ the sequence $S \( t \) f_n \( x \)$ converges uniformly over $0 lt.eq t < 1$. Denote its limit by $v_f \( x \, t \)$, and define $v_f \( x \, t \) = 0$ for $x in.not E_0$. It is jointly measurable, and its time dependence is continuous at every point of $E_0$, as a uniform limit of continuous functions.
  For each fixed $t$, unitarity gives $S \( t \) f_n arrow.r S \( t \) f$ in $L^2$. The pointwise limit on $E_0$ must therefore agree almost everywhere with that $L^2$ limit. This identifies the $L^2$ class of $v_f \( dot.op \, t \)$ for every fixed $t$; it does not assert a pointwise intersection over uncountably many times. Finally, Fatou’s lemma in the maximal estimate gives
  $ integral_(B \( x_0 \, 1 \)) sup_(0 lt.eq t < 1) \| v_f \( x \, t \) \| thin d x lt.eq C lim_(n arrow.r oo) parallel f_n parallel_(H^(1 \/ 3)) = C parallel f parallel_(H^(1 \/ 3)) . $
  ◻
]

=== 9.4 Recovering the Gaussian-first, all-real-time limit <recovering-the-gaussian-first-all-real-time-limit>

Fix $f in H^(1 \/ 3) \( bb(R)^2 \)$ and the approximants just constructed, and write $v = v_f$. The same argument gives error envelopes with both pointwise decay and spatial control at infinity. Namely, let

#[#set math.equation(numbering: n => "(9.17)")
 $ M_n \( x \) = sup_(0 lt.eq t < 1) \| v \( x \, t \) - S \( t \) f_n \( x \) \| . $ <eq:endpoint-error-envelope>]

These functions are measurable by the rational-time supremum, since the chosen $v \( x \, dot.op \)$ is continuous even on the complement where it was defined to be zero. On $E_0$ the convergence is uniform, so $M_n \( x \) arrow.r 0$. Applying (9.15) to $f_ell - f_n$ and then using Fatou yields

#[#set math.equation(numbering: n => "(9.18)")
 $ sup_(x_0 in bb(R)^2) integral_(B \( x_0 \, 1 \)) M_n \( x \) thin d x lt.eq C parallel f - f_n parallel_(H^(1 \/ 3)) . $ <eq:endpoint-envelope-local-mass>]

In particular, every $M_n$ is locally integrable with uniformly bounded integrals over all translated unit balls. This uniformity controls Gaussian convolution far from its evaluation point.

#thm([Lemma 9.7.])[
  (Gaussian approximation with uniform local mass).  #emph[Let $h gt.eq 0$ be locally integrable on $bb(R)^2$ and suppose 
$ A = sup_(z in bb(R)^2) integral_(B \( z \, 1 \)) h \( y \) thin d y < oo . $

 For $a > 0$ let 
$ K_a \( z \) = frac(1, 4 pi a) e^(- \| z \|^2 \/ \( 4 a \)) . $

 Then $\( K_a * h \) \( x \)$ is finite for every $a > 0$ and every $x$. At every Lebesgue point $x$ of $h$, 
#[#set math.equation(numbering: n => "(9.19)")
 $ lim_(a arrow.b 0) \( K_a * h \) \( x \) = h \( x \) . $ <eq:endpoint-heat-envelope-limit>]

]
] <lem:endpoint-heat-envelope>

#proof[
  For a fixed $rho > 0$, cover each annulus $2^ell rho lt.eq \| z \| < 2^(ell + 1) rho$ by at most $C \( 1 + 2^ell rho \)^2$ unit balls. Positivity gives
  #[#set math.equation(numbering: n => "(9.20)")
   $ integral_(\| z \| gt.eq rho) K_a \( z \) h \( x - z \) thin d z & lt.eq frac(C A, a) sum_(ell gt.eq 0) \( 1 + 2^ell rho \)^2 e^(- 4^ell rho^2 \/ \( 4 a \))\
 & lt.eq C_rho A a^(- 1) e^(- rho^2 \/ \( 8 a \)) \, #h(2em) 0 < a lt.eq min { 1 \, rho^2 } . $ <eq:endpoint-gaussian-tail>]
  The series in the first line is finite for every fixed $a > 0$. Together with local integrability this proves finiteness of the convolution, and the second line shows that its distant contribution tends to zero.
  At a Lebesgue point $x$, put $H_x \( r \) = integral_(\| z \| < r) \| h \( x - z \) - h \( x \) \| thin d z = o \( r^2 \)$. Given $epsilon > 0$, choose $rho > 0$ so that $H_x \( r \) lt.eq epsilon r^2$ for $0 < r lt.eq rho$. With $k_a \( r \) = \( 4 pi a \)^(- 1) e^(- r^2 \/ \( 4 a \))$, radial integration by parts gives
  $ integral_(\| z \| < rho) K_a \( z \) \| h \( x - z \) - h \( x \) \| thin d z & = k_a \( rho \) H_x \( rho \) + integral_0^rho \( - k'_a \( r \) \) H_x \( r \) thin d r\
 & lt.eq epsilon (k_a \( rho \) rho^2 + integral_0^rho \( - k'_a \( r \) \) r^2 thin d r) lt.eq C epsilon . $
  Outside this neighborhood, (9.20) controls the $h$ term, and the constant $h \( x \)$ is controlled by the vanishing Gaussian mass outside $B \( 0 \, rho \)$. Let $a arrow.b 0$ and then $epsilon arrow.b 0$. ◻
]

#proof[
  At time zero, the fixed-time $L^2$ identification in Theorem 52 gives $v \( dot.op \, 0 \) = f$ in $L^2$. Since $f^(*)$ represents the same $L^2$ function on the set of Lebesgue points of $f$, intersect $E_0$ with the full-measure set where $v \( x \, 0 \) = f^(*) \( x \)$ and with that Lebesgue-point set. Next intersect with the Lebesgue-point sets of the countably many functions $M_n$. Call the resulting full-measure set $E$. For every $x in E$ we now have, simultaneously,
  #[#set math.equation(numbering: n => "(9.21)")
   $ v \( x \, dot.op \) upright(" is continuous on ") \[ 0 \, 1 \) \, #h(2em) v \( x \, 0 \) = f^(*) \( x \) \,\
M_n \( x \) arrow.r 0 \, #h(2em) \( K_a * M_n \) \( x \) arrow.r M_n \( x \) quad upright("as ") a arrow.b 0 upright(" for every ") n . $ <eq:endpoint-common-good-set>]
  The last assertion follows from (9.18) and Lemma 53. Only countably many exceptional sets were removed.
  For each fixed $t in \[ 0 \, 1 \)$, the function $v \( dot.op \, t \)$ represents $S \( t \) f$ in $L^2$. Since $K_a \( x - dot.op \) in L^2$, convolution at a given $x$ is an $L^2$ pairing and is independent of the representative of this $L^2$ class. Plancherel’s identity therefore gives
  #[#set math.equation(numbering: n => "(9.22)")
   $ \( K_a * v \( dot.op \, t \) \) \( x \) = frac(1, \( 2 pi \)^2) integral e^(i x dot.op xi - i t \| xi \|^2 - a \| xi \|^2) hat(f) \( xi \) thin d xi = U_a f \( x \, t \) $ <eq:endpoint-exact-convolution>]
  for every $x in bb(R)^2$, every $a > 0$, and every $0 < t < 1$. The integral is absolutely convergent by Cauchy–Schwarz. The quantifiers in this step are significant: for each arbitrary $t$, an identity of $L^2$ classes gives the convolution identity at every evaluation point. There is no intersection of time-dependent pointwise exceptional sets in (9.22).
  For the approximants, absolute Fourier integrability yields
  #[#set math.equation(numbering: n => "(9.23)")
   $ R_n \( a \) & := sup_(x in bb(R)^2 \, thin 0 < t < 1) \| U_a f_n \( x \, t \) - S \( t \) f_n \( x \) \|\
 & lt.eq frac(1, \( 2 pi \)^2) integral \| 1 - e^(- a \| xi \|^2) \| thin \| hat(f)_n \( xi \) \| thin d xi arrow.r 0 #h(2em) \( a arrow.b 0 \) . $ <eq:endpoint-smooth-heat-limit>]
  Positivity of $K_a$, the error envelope, and (9.22) give, for each $x in E$,
  #[#set math.equation(numbering: n => "(9.24)")
   $ sup_(0 < t < 1) \| U_a f \( x \, t \) - v \( x \, t \) \| lt.eq \( K_a * M_n \) \( x \) + M_n \( x \) + R_n \( a \) . $ <eq:endpoint-uniform-gaussian-comparison>]
  Indeed the difference between the two convolutions is bounded by $K_a * M_n$, because $\| v \( y \, t \) - S \( t \) f_n \( y \) \| lt.eq M_n \( y \)$ for almost every $y$, simultaneously for all $t$; the remaining two differences are bounded by $R_n \( a \)$ and $M_n \( x \)$. All these convolutions are finite by the preceding lemma or by the $L^2$ pairing.
  Fix $n$ and take $limsup_(a arrow.b 0)$ in (9.24). By (9.21) and (9.23),
  $ limsup_(a arrow.b 0) sup_(0 < t < 1) \| U_a f \( x \, t \) - v \( x \, t \) \| lt.eq 2 M_n \( x \) . $
  Let $n arrow.r oo$. Thus for every $x in E$,
  #[#set math.equation(numbering: n => "(9.25)")
   $ lim_(a arrow.b 0) sup_(0 < t < 1) \| U_a f \( x \, t \) - v \( x \, t \) \| = 0 . $ <eq:endpoint-uniform-gaussian-limit>]
  In particular, at each such $x$ the finite limit defining $u_f \( x \, t \)$ exists for every real $0 < t < 1$, with $t$ fixed before $a$ tends to zero, and it equals $v \( x \, t \)$. Continuity at zero now gives
  $ lim_(t arrow.b 0\
t in bb(R)) u_f \( x \, t \) = lim_(t arrow.b 0) v \( x \, t \) = v \( x \, 0 \) = f^(*) \( x \) . $
  This proves Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[J.~Bennett, A.~Carbery, and T.~Tao, #emph[On the multilinear restriction and Kakeya conjectures], Acta Math. #strong[196] (2006), no.~2, 261--302. #link("https://doi.org/10.1007/s11511-006-0006-4")[doi:10.1007/s11511-006-0006-4]. #link("https://arxiv.org/abs/math/0509262v1")[arXiv:math/0509262v1].]
#bibitem([2])[J.~Bourgain, #emph[Some new estimates on oscillatory integrals], in #emph[Essays on Fourier Analysis in Honor of Elias M.~Stein] (C.~Fefferman, R.~Fefferman, and S.~Wainger, eds.), Princeton Math. Ser., vol.~42, Princeton Univ. Press, 1995, pp.~83--112. #link("https://repo-archives.ihes.fr/FONDS_IHES/I_Prepublications/BOURGAIN/1990-1995/M_91_60/M_91_60_web.pdf")[Author preprint].]
#bibitem([3])[J.~Bourgain, #emph[On the Schrödinger maximal function in higher dimension], Proc. Steklov Inst. Math. #strong[280] (2013), 46--60. #link("https://doi.org/10.1134/S0081543813010045")[doi:10.1134/S0081543813010045]. #link("https://arxiv.org/abs/1201.3342")[arXiv:1201.3342].]
#bibitem([4])[J.~Bourgain, #emph[A note on the Schrödinger maximal function], J. Anal. Math. #strong[130] (2016), 393--396. #link("https://doi.org/10.1007/s11854-016-0042-8")[doi:10.1007/s11854-016-0042-8]. #link("https://arxiv.org/abs/1609.05744")[arXiv:1609.05744].]
#bibitem([5])[J.~Bourgain and C.~Demeter, #emph[The proof of the $l^2$ Decoupling Conjecture], Ann. of Math. (2) #strong[182] (2015), no.~1, 351--389. #link("https://doi.org/10.4007/annals.2015.182.1.9")[doi:10.4007/annals.2015.182.1.9]. #link("https://arxiv.org/abs/1403.5335v3")[arXiv:1403.5335v3].]
#bibitem([6])[J.~Bourgain and L.~Guth, #emph[Bounds on oscillatory integral operators based on multilinear estimates], Geom. Funct. Anal. #strong[21] (2011), no.~6, 1239--1295. #link("https://doi.org/10.1007/s00039-011-0140-9")[doi:10.1007/s00039-011-0140-9]. #link("https://arxiv.org/abs/1012.3760")[arXiv:1012.3760].]
#bibitem([7])[L.~Carleson, #emph[Some analytic problems related to statistical mechanics], in #emph[Euclidean Harmonic Analysis] (J.~J.~Benedetto, ed.), Lecture Notes in Math., vol.~779, Springer, Berlin, 1980, pp.~5--45. #link("https://doi.org/10.1007/BFb0087666")[doi:10.1007/BFb0087666].]
#bibitem([8])[M.~Christ and A.~Kiselev, #emph[Maximal functions associated to filtrations], J. Funct. Anal. #strong[179] (2001), no.~2, 409--425. #link("https://doi.org/10.1006/jfan.2000.3687")[doi:10.1006/jfan.2000.3687].]
#bibitem([9])[B.~E.~J.~Dahlberg and C.~E.~Kenig, #emph[A note on the almost everywhere behavior of solutions to the Schrödinger equation], in #emph[Harmonic Analysis] (F.~Ricci and G.~Weiss, eds.), Lecture Notes in Math., vol.~908, Springer, Berlin, 1982, pp.~205--209. #link("https://doi.org/10.1007/BFb0093289")[doi:10.1007/BFb0093289].]
#bibitem([10])[Y.~Deng, C.~Fan, S.~Guo, Z.~Guo, and Y.~Luo, #emph[Sharp Strichartz estimates on the one-dimensional torus], arXiv:2609.18670v1 (2026). #link("https://arxiv.org/abs/2609.18670v1")[arXiv:2609.18670v1].]
#bibitem([11])[X.~Du, L.~Guth, and X.~Li, #emph[A sharp Schrödinger maximal estimate in $bb(R)^2$], Ann. of Math. (2) #strong[186] (2017), no.~2, 607--640. #link("https://doi.org/10.4007/annals.2017.186.2.5")[doi:10.4007/annals.2017.186.2.5].]
#bibitem([12])[X.~Du, L.~Guth, X.~Li, and R.~Zhang, #emph[Pointwise convergence of Schrödinger solutions and multilinear refined Strichartz estimates], Forum Math. Sigma #strong[6] (2018), e14, 18 pp. #link("https://doi.org/10.1017/fms.2018.11")[doi:10.1017/fms.2018.11]. #link("https://arxiv.org/abs/1803.01720v2")[arXiv:1803.01720v2].]
#bibitem([13])[X.~Du and R.~Zhang, #emph[Sharp $L^2$ estimates of the Schrödinger maximal function in higher dimensions], Ann. of Math. (2) #strong[189] (2019), no.~3, 837--861. #link("https://doi.org/10.4007/annals.2019.189.3.4")[doi:10.4007/annals.2019.189.3.4]. #link("https://arxiv.org/abs/1805.02775v3")[arXiv:1805.02775v3].]
#bibitem([14])[S.~Guo, Z.~K.~Li, and P.-L.~Yung, #emph[Improved discrete restriction for the parabola], Math. Res. Lett. #strong[30] (2023), no.~5, 1375--1409. #link("https://arxiv.org/abs/2103.09795v2")[arXiv:2103.09795v2].]
#bibitem([15])[L.~Guth and N.~H.~Katz, #emph[On the Erdős distinct distances problem in the plane], Ann. of Math. (2) #strong[181] (2015), no.~1, 155--190. #link("https://doi.org/10.4007/annals.2015.181.1.2")[doi:10.4007/annals.2015.181.1.2]. #link("https://arxiv.org/abs/1011.4105v3")[arXiv:1011.4105v3].]
#bibitem([16])[L.~Guth, D.~Maldague, and H.~Wang, #emph[Improved decoupling for the parabola], J. Eur. Math. Soc. (JEMS) #strong[26] (2024), no.~3, 875--917. #link("https://doi.org/10.4171/JEMS/1295")[doi:10.4171/JEMS/1295]. #link("https://arxiv.org/abs/2009.07953")[arXiv:2009.07953].]
#bibitem([17])[W.~He, #emph[Orthogonal projections of discretized sets], J. Fractal Geom. #strong[7] (2020), no.~3, 271--317. #link("https://doi.org/10.4171/JFG/92")[doi:10.4171/JFG/92]. #link("https://arxiv.org/abs/1710.00795v2")[arXiv:1710.00795v2].]
#bibitem([18])[S.~Lee, #emph[On pointwise convergence of the solutions to Schrödinger equations in $bb(R)^2$], Int. Math. Res. Not. (2006), Art.~ID 32597, 21 pp. #link("https://doi.org/10.1155/IMRN/2006/32597")[doi:10.1155/IMRN/2006/32597].]
#bibitem([19])[Z.~K.~Li and P.-L.~Yung, #emph[An improved high-low method for the parabola], \
#link("https://arxiv.org/abs/2609.33949v1")[arXiv:2609.33949v1] (2026).]
#bibitem([20])[A.~Moyua, A.~Vargas, and L.~Vega, #emph[Schrödinger maximal function and restriction properties of the Fourier transform], Int. Math. Res. Not. #strong[1996] (1996), no.~16, 793--815. #link("https://doi.org/10.1155/S1073792896000499")[doi:10.1155/S1073792896000499].]
#bibitem([21])[Y.~Pan, W.~Sun, and J.~Tan, #emph[Pointwise convergence of Schrödinger operators in Bessel potential spaces], arXiv:2605.25833v2 (2026). #link("https://arxiv.org/abs/2605.25833v2")[arXiv:2605.25833v2].]
#bibitem([22])[P.~Sjögren and P.~Sjölin, #emph[Convergence properties for the time-dependent Schrödinger equation], Ann. Acad. Sci. Fenn. Ser. A I Math. #strong[14] (1989), 13--25. #link("https://www.acadsci.fi/mathematica/Vol14/vol14pp013-025.pdf")[Journal PDF].]
#bibitem([23])[P.~Sjölin, #emph[Regularity of solutions to the Schrödinger equation], Duke Math. J. #strong[55] (1987), no.~3, 699--715. #link("https://doi.org/10.1215/S0012-7094-87-05535-9")[doi:10.1215/S0012-7094-87-05535-9].]
#bibitem([24])[T.~Tao, #emph[A sharp bilinear restriction estimate for paraboloids], Geom. Funct. Anal. #strong[13] (2003), no.~6, 1359--1384. #link("https://doi.org/10.1007/s00039-003-0449-0")[doi:10.1007/s00039-003-0449-0]. #link("https://arxiv.org/abs/math/0210084")[arXiv:math/0210084].]
#bibitem([25])[T.~Tao and A.~Vargas, #emph[A bilinear approach to cone multipliers. II. Applications], Geom. Funct. Anal. #strong[10] (2000), no.~1, 216--258. #link("https://doi.org/10.1007/s000390050007")[doi:10.1007/s000390050007].]
#bibitem([26])[L.~Vega, #emph[Schrödinger equations: pointwise convergence to the initial data], Proc. Amer. Math. Soc. #strong[102] (1988), no.~4, 874--878. #link("https://doi.org/10.1090/S0002-9939-1988-0934859-0")[doi:10.1090/S0002-9939-1988-0934859-0].]
#bibitem([27])[R.~Wongkew, #emph[Volumes of tubular neighbourhoods of real algebraic varieties], Pacific J. Math. #strong[159] (1993), no.~1, 177--184. #link("https://doi.org/10.2140/pjm.1993.159.177")[doi:10.2140/pjm.1993.159.177].]


