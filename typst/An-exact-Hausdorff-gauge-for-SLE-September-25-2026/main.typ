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

#align(center)[#text(size: 16pt, weight: "bold")[An exact Hausdorff gauge for SLE \
A moment-integral and finite-batch construction]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

A Hausdorff dimension identifies a critical power of distance,
  but that power need not assign nonzero measure to a random curve.
  For chordal Schramm–Loewner evolution $upright("SLE")_kappa$, $0 < kappa < 8$,
  Beffara #cite(label("Beffara2008")) proved that the almost-sure dimension is

$ d = 1 + kappa / 8 . $

Schramm asked whether the trace has a sigma-finite Hausdorff measure and suggested $r^d log
  log \( 1 \/ r \)$ as a possible gauge #cite(label("Schramm2006")) Problem 7.1 and the following paragraph.
  Rezaei subsequently proved that the critical power $r^d$ itself gives zero Hausdorff measure
  #cite(label("Rezaei2018")) Theorem 1.1. The question therefore asks for a deterministic refinement of dimension
  that measures the trace through arbitrary spatial covers.

We answer the existence question positively by constructing the scales of the gauge from moments of a local trace
  mass. The gauge is explicit in terms of deterministic integrals,
  although its asymptotics need not have a regular form. The main mechanism uses finite moments of every order in
  two ways: moderately large masses provide repeated opportunities for an economical cover,
  while exceedances of a larger threshold have a summable total cost. A sharp tail asymptotic is not needed.

=== 1.1 The result <the-result>

A #emph[Hausdorff gauge] is a continuous nondecreasing function $h : \[ 0 \, oo \)
  arrow.r \[ 0 \, oo \)$ with $h \( 0 \) = 0$ and $h \( r \) > 0$ for $r > 0$. We use diameters in the definition

$ cal(H)^h \( E \) = lim_(delta arrow.b 0) cal(H)_delta^h \( E \) \, wide cal(H)_delta^h \( E \) =
  inf {sum_j h \( "diam" U_j \) : E subset union.big_j U_j \, quad "diam" U_j lt.eq delta} \, $

where covers are countable and their sets may be arbitrary.

#thm([Theorem 1.1.])[
  (An exact moment gauge).  #emph[Fix $0 < kappa < 8$, and let $gamma$ be chordal $upright("SLE")_kappa$ from $0$
    to $oo$ in the upper half-plane $bb(H)$, parametrized by half-plane capacity $2 t$.
    There is a deterministic Hausdorff gauge $h_kappa$, depending only on $kappa$, such that almost surely,
    simultaneously for every real $0 < s < t < oo$,
$ 0 < cal(H)^(h_kappa) \( gamma \( \[ s \, t \] \) \) < oo . $

]
] <thm:main>

The gauge is the full infimum in (6.4), with coefficients specified by the iterated integrals in (5.7).
  The exceptional event may depend on the fixed $kappa$; the gauge is independent of both the sample and the
  interval. In particular, the trace outside its initial point has a nonzero sigma-finite Hausdorff measure.

The upper argument measures the entire trace in a bounded region.
  For $Gamma = gamma \( \[ 0 \, oo \) \)$ and $B_m = \[ - m \, m \] + i \[ 0 \, m \]$, Proposition 20 proves

#[#set math.equation(numbering: n => "(1.1)")
 $ bb(E) thin cal(H)^(h_kappa) \( Gamma ∩ B_m \) < oo wide \( m in bb(N) \) . $ <intro:box-mean>]

Thus all these bounded-box measures are finite on one event, including at real-boundary trace points.
  Positivity in Theorem 1 is asserted for the stated positive-time intervals.

=== 1.2 Multipoint estimates and one canonical mass <multipoint-estimates-and-one-canonical-mass>

The gauge construction needs a trace mass with moments of every order and a way to compare its future in a small
  region with one fixed disk model. We establish these inputs through a multipoint probability bound and a
  conformally restarting mass. Both are also useful independently.
  We first give a direct product-supermartingale proof of the fixed-order estimate needed in an arbitrary physical
  domain. For a conformal map $J : bb(H) arrow.r D$, let $R_D \( x \)$ denote full conformal radius:
  $R_D \( x \) = \| F' \( 0 \) \|$ when $F : bb(D) arrow.r D$ is conformal, $bb(D)$ is the unit disk,
  and $F \( 0 \) = x$. Write $H_t$ for the surviving half-plane domain after the trace up to time $t$, and $D_t =
  J \( H_t \)$. A point is #emph[alive] at $t$ when it belongs to $D_t$; its evolving radius is $R_(D_t) \( x \)$.
  Set $alpha = 2 - d$ and $a = 2 \/ kappa$. For distinct interior points $x_1 \, dots.h \, x_m$, choose caps satisfying

$ 0 < b_i lt.eq R_D \( x_i \) \, wide b_i lt.eq \| x_i - x_j \| quad \( j eq.not i \) . $

Proposition 5 proves that the probability that each point reaches its own radius target $e_i > 0$ while alive is at most

#[#set math.equation(numbering: n => "(1.2)")
 $ C_(m \, a) product_(i = 1)^m min { 1 \, \( e_i \/ b_i \)^alpha } . $ <intro:multipoint>]

The constant depends only on the fixed order and parameter.
  It is uniform in the domain, the initial angles, and the order and times of the hits.
  A completed point may be swallowed before another target is reached. No sharp growth estimate in $m$ is claimed.
  Integrating the collision singularities in this bound gives all the compact moments used in the mass construction.

The second ingredient is a single adapted increasing measure process $mu_t$ on the open domain, starting at zero.
  In the half-plane, Proposition 8 constructs it with nonatomic terminal measure,
  local total-variation continuity, and increments carried by the corresponding trace segments.
  Every nontrivial time interval has positive increment mass by Proposition 11.
  To describe its conditional mean, let $g_S$ be the Loewner map of the surviving half-plane domain $H_S$,
  with driving point $U_S$ in the capacity normalization. For $x in H_S$ put $theta_S \( x \) =
  arg \( g_S \( x \) - U_S \)$ and $G_S \( x \) = R_(H_S) \( x \)^(- alpha) sin^(8 \/ kappa - 1) theta_S \( x \)$;
  put $G_S \( x \) = 0$ outside $H_S$. Its remaining conditional mean is

$ bb(E) \[ mu_oo - mu_S divides cal(F)_S \] = G_S thin #h(-0.16667em) upright(d) A $

for every fixed stopping time $S$, including $S = oo$ with $G_oo = 0$.
  Here $#h(-0.16667em) upright(d) A$ is planar area. The equality holds as a conditional measure kernel,
  so it includes nonnegative tests known at $S$.

Conformal covariance weights the measure by $\| J' \|^d$.
  At each fixed finite stopping time, Proposition 10 identifies the actual future increment with the conformally
  transported canonical mass of the fresh driver, simultaneously at every later time.
  This permits comparison of the actual mass near a marked point with one disk model after stopping at a
  prescribed conformal radius. The lower bound also uses first-visit accounting:
  mass already accumulated on the trace is not charged again at a later geometric return.

=== 1.3 Why the moments determine the gauge <why-the-moments-determine-the-gauge>

To bias the curve toward a marked interior point, stop when that point’s conformal radius reaches a prescribed
  smaller value and reweight the stopped law by the ratio of its terminal and initial Green weights.
  Paths that fail to reach the radius level receive weight zero.
  Section 2 proves that the weight has mean one and that these finite stopped laws are consistent as the radius
  decreases. We call them the #emph[centered laws].

Place the marked point at the origin of a unit disk and measure mass in its radius-$1 \/ 4$ subdisk.
  The #emph[inner time] is the logarithmic radius clock $ell = \( 2 a \)^(- 1) log \( R_0 \/ R \)$,
  where $R$ is the marked point’s current conformal radius.
  Let $L_ell$ be the mass accumulated in that subdisk by inner time $ell$.
  Under the centered law, the marked point’s angle in the corresponding half-plane coordinates evolves as a
  diffusion with invariant density proportional to $sin^(4 a) theta$.
  We average the initial angle against this distribution and write $bb(P)_(upright("mix"))^(*) \,
  bb(E)_(upright("mix"))^(*)$ for this averaged centered law and expectation. Then

$ L_ell arrow.t L \, wide 0 < bb(E)_(upright("mix"))^(*) L^n < oo quad \( n gt.eq 1 \) . $

Section 5 specifies these numbers by Wiener, angle and area integrals,
  and then by product-normal coordinates and ordinary differential equation limits.
  This deterministic infinite-limit prescription fixes the normalization of the moments without referring to an
  unspecified random measure.

For each order $n$, retain more than three quarters of its moment at a finite level $ell_n$.
  Repeat dyadic thresholds $A_k = 2^k$ in a finite batch with multiplicities $N_(n k)$ determined by the $n$th and
  $\( n + 1 \)$st moments. Lemma 16 gives the complementary bounds

$ sum_k N_(n k) bb(P)_(upright("mix"))^(*) { L gt.eq 16 A_k } lt.eq frac(4^(- n), 1 - 2^(- n)) \, wide
  sum_k N_(n k) bb(P)_(upright("mix"))^(*) { L_(ell_n) gt.eq A_k } gt.eq 2^n / 8 quad \( n gt.eq 3 \) . $

The first sum is summable over batches. The second supplies many opportunities for a success.
  Tests along the actual curve are separated in conformal-radius time so that angle mixing gives a conditional
  lower bound after each preceding test. This uses their actual stopped pasts, not independence.
  One final cleanup scale in each batch pays for points missed by all of its tests.

Writing $b_(n i)$ and $r_(n i)$ for the resulting thresholds and radii,
  the gauge interpolates their costs by the quadratic expressions $b_(n i) r_(n i)^d max {
  1 \, \( r \/ r_(n i) \)^2 }$ and takes the infimum over #emph[every] entry.
  The quadratic factor accounts for subdivision in the plane. Radii in different batches may interleave.

For the lower bound, a strict past-mass identity uses the conditional Green kernel to bound expected mass in
  overfull squares through centered probabilities that a mass threshold is exceeded before the marked point is
  reached. The upper tails make these expected losses summable over all batch entries.
  Positive mass therefore remains on a set that avoids all overfull squares after one common batch cutoff.
  The resulting finite nonatomic measure is bounded by every late quadratic expression.
  Its finite total mass supplies the bounds for the finitely many excluded entries,
  so taking the full infimum is legitimate. Summing this one density bound over arbitrary countable covers proves
  positivity.

For the upper bound, successful finite tests force terminal-mass candidates.
  A greedy selection makes their charging balls disjoint, and one actual mass in a larger bounded region pays for
  their enlarged covering balls. Only adapted test failures enter the finite change of law;
  terminal candidate membership is used afterward through inclusion.
  The cleanup scale covers every missed cell, including the bottom row at the real boundary.
  These measurable covers have diameters tending to zero and uniformly bounded expected cost.
  Their lower limiting cost and Fatou’s Lemma give (1.1).

=== 1.4 Prior work and proof organization <prior-work-and-proof-organization>

The Green-potential approach to trace mass has its roots in natural parametrization.
  Lawler and Sheffield constructed natural parametrization initially for $0 < kappa <
  4 \( 7 - sqrt(33) \)$ #cite(label("LawlerSheffield2011")) Theorem 3.1;
  Lawler and Zhou obtained the full range $0 < kappa < 8$ #cite(label("LawlerZhou2013")) Theorem 1.
  Lawler and Rezaei constructed $d$-dimensional Minkowski content and identified it, up to normalization,
  with natural parametrization #cite(label("LawlerRezaei2015")) Theorem 1.1 and following discussion.
  Our common-kernel construction proves the properties needed here locally;
  identifying its mass with those measures is unnecessary. Multipoint estimates and their higher-moment
  consequences also have substantial predecessors #cite(label("LawlerWerness2013"))
  #cite(label("RezaeiZhan2017")). Rezaei–Zhan subsequently proved existence, local Hölder continuity,
  and bounds up to constants for chordal multipoint Green functions at every finite order
  #cite(label("RezaeiZhan2018Green")) Theorem 1.1. The domain-uniform bound in (1.2) also follows from Rezaei–Zhan
  #cite(label("RezaeiZhan2017")) Theorem 1.1 and the Koebe estimates.
  We give a direct product-supermartingale proof with each point frozen after its own target hit.

The use of regions carrying large mass together with a fine residual cover appears in Rezaei
  #cite(label("Rezaei2018")) Section 3, equations (9)–(11).
  Zhan #cite(label("Zhan2019Optimal")) Remark 4.5 gives a conditional covering sketch for zero $d$-dimensional
  Hausdorff measure. The present finite batches, actual restart identities and all-time boundary cleanup supply
  the covering proof for the specified gauge. The quadratic envelope is related to the planar regularization of
  Peres–Solomyak #cite(label("PeresSolomyak2005")) Lemma 1.2 and Section 5;
  the strict past-mass calculation uses the same remaining-potential mechanism as Zhan’s decomposition along the
  SLE curve #cite(label("Zhan2019Decomposition")) Proposition 2.2 and equations (4.3)–(4.5).

Holden and Yuan identify a positive fine-mesh variation, up to a deterministic constant,
  with natural parametrization #cite(label("HoldenYuan2026")) Theorems 1.7–1.8.
  In the half-plane their result includes positive-time intervals that touch the boundary.
  Its ordered time partitions differ from the arbitrary spatial covers used here.
  The moment prescription proves exactness for its own gauge;
  it asserts neither a log-log asymptotic nor identification of Hausdorff measure with natural parametrization.

A later companion #cite(label("OpenAI2026Explicit")) Theorem 1.1 gives exactness for the regular closed-form gauge

$ r^d #scale(x: 120%, y: 120%)[\(] log log \( 1 \/ r \) #scale(x: 120%, y: 120%)[\)]^(\( 2 - d \) \/ 2) $

at small radii, by quantitative mass tails and dense visits.
  Its argument establishes its own stopped-law, mass and covering estimates.
  The present argument leaves the asymptotic relation between that formula and the moment-defined gauge $h_kappa$
  undetermined.

Section 2 proves finite centered laws, mixing and the remaining-potential identity in the required normalization.
  Sections 3 and 4 establish (1.2), the common mass kernel and actual restart.
  Section 5 recovers the deterministic disk moments; Section 6 turns them into batches and the gauge.
  Section 7 proves the strict past-mass comparison and arbitrary-cover lower bound.
  Section 8 constructs the all-time upper covers and assembles the theorem.
  The external geometric inputs are continuous trace generation #cite(label("RohdeSchramm2005")) Theorem 5.1 and
  the classical Koebe estimates #cite(label("Beliaev2015Notes")) Section 3.2.
  Every subsequent centered-law, multipoint, mass and covering argument is proved below.

== 2 Conformal radius and the law centered at one point <op:section>

Our first goal is a finite change of law toward one interior point.
  The same calculation will supply a conditional Green potential, uniform angle mixing,
  and a finite physical lifetime. These are the inputs for both the mass construction and the eventual tests at
  successive radii.

Fix $0 < kappa < 8$ throughout, and put

#[#set math.equation(numbering: n => "(2.1)")
 $ a = 2 / kappa > 1 / 4 \, wide d = 1 + frac(1, 4 a) \, wide alpha = 2 - d in \( 0 \, 1 \) \, wide p = 4 a -
   1 > 0 . $ <op:parameters>]

In particular, $2 a alpha = p \/ 2$. If $t_(upright("cap"))$ denotes the capacity-$2
  t_(upright("cap"))$ time of Theorem 1, put $u = kappa t_(upright("cap"))$ and $B_u^(upright("int")) =
  sqrt(kappa) B_(u \/ kappa)^(upright("cap"))$. This driver is standard Brownian motion.
  Writing $t$ for the internal time $u$ and $B$ for $B^(upright("int"))$ below, the equation becomes

#[#set math.equation(numbering: n => "(2.2)")
 $ partial_t g_t \( z \) = frac(a, g_t \( z \) - B_t) \, wide g_0 \( z \) = z \, $ <op:loewner>]

with a standard Brownian driver and half-plane capacity $a t$.
  The original normalization and continuous trace generation are given by Rohde–Schramm
  #cite(label("RohdeSchramm2005")) Section 2.1 and Theorem 5.1.
  A constant change of time preserves the assertion about all nontrivial finite time intervals.

We first specify the geometric and probabilistic conventions. Write $H_t$ for the survival domain of (2.2).
  It is the unbounded component of $bb(H) \\ gamma \( \[ 0 \, t \] \)$, and $g_t : H_t arrow.r
  bb(H)$ is conformal. Moreover,

#[#set math.equation(numbering: n => "(2.3)")
 $ gamma \( \[ t \, oo \) \) subset overline(H_t) . $ <op:future-trace>]

These are the filled-hull conventions for a Loewner evolution generated by a continuous trace.
  The domain identification is part of Rohde–Schramm #cite(label("RohdeSchramm2005")) Theorem 5.1,
  including when the trace has self-touches. To obtain (2.3), for $u gt.eq
  t$ and $epsilon > 0$ observe that $g_u^(- 1) \( B_u + i epsilon \) in H_u subset H_t$.
  The inverse-map definition of $gamma \( u \)$ and the limit $epsilon arrow.b 0$ give the asserted containment.

We also work in a fixed simply connected proper domain $D = J \( bb(H) \)$, where $J : bb(H) arrow.r
  D$ is conformal, and set $D_t = J \( H_t \)$. Only the interior domain evolution is needed for an arbitrary $J$;
  no boundary extension of $J$ is being assumed. At a finite stopping time $S$, the map

$ J_S = J compose \( g_S - B_S \)^(- 1) : bb(H) arrow.r D_S $

identifies the remaining domain with a fresh copy of the half-plane.
  Continuing the ODE gives the composition rule, and the strong Markov property gives the fresh driver
  $B_(S + t) - B_S$.

For a simply connected domain $U$ and $x in U$, our conformal radius is $R_U \( x \) = \| F' \( 0 \) \|$,
  where $F : bb(D) arrow.r U$ is conformal with $F \( 0 \) = x$.
  We use the classical Koebe estimates in this convention #cite(label("Beliaev2015Notes")) Theorem 3.2.5,
  Corollary 3.2.6, and Theorems 3.2.9 and 3.2.11:

#[#set math.equation(numbering: n => "(2.4)")
 $ R_U \( x \) \/ 4 & lt.eq "dist" \( x \, partial U \) lt.eq R_U \( x \) \,\
R_U \( x \) frac(r, \( 1 + r \)^2) & lt.eq \| F \( w \) - x \| lt.eq R_U \( x \) frac(r, \( 1 - r \)^2) \,
  quad \| w \| = r < 1 \,\
R_U \( x \) frac(1 - r, \( 1 + r \)^3) & lt.eq \| F' \( w \) \| lt.eq R_U \( x \) frac(1 + r, \( 1 - r \)^3) \,
  quad \| w \| lt.eq r < 1 . $ <op:koebe-distance>]

All path functionals used under a changed law are taken on the canonical continuous-driver space with its
  #emph[raw] natural filtration $\( cal(F)_t \)$. Usual augmentations may be used for stochastic-calculus
  arguments under the original Wiener law, followed by raw versions of the resulting adapted quantities.
  The centered laws below are laws of finite stopped data. Their consistent limits do not assert absolute
  continuity on the original completed infinite-future sigma field.
  In particular, later adapted mass functionals will be evaluated using one raw nonanticipating version,
  rather than choosing separate versions for different centers.

=== 2.1 The local martingale and finite stopped laws <the-local-martingale-and-finite-stopped-laws>

The finite-radius Green tilt and its centered angular diffusion are standard in the study of two-sided radial SLE;
  see Lawler–Zhou #cite(label("LawlerZhou2013")) Section 2.1 and Lawler–Rezaei #cite(label("LawlerRezaei2015"))
  Section 4.2, equations (38)–(40). We give the cutoff argument and uniform mixing proof in the present
  full-conformal-radius normalization, with all changes of law made at finite stopped levels.

Fix $x in D$, put $z = J^(- 1) \( x \)$, and let $T_x$ be its lifetime. Until $T_x$, write

$ Z_t = X_t + i Y_t = g_t \( z \) - B_t \, wide theta_t = arg Z_t \, wide V_t = frac(Y_t, \| Z_t \|^2) \, wide
  s_x \( t \) = integral_0^t V_u^2 thin #h(-0.16667em) upright(d) u . $

Set $R_t \( x \) = R_(D_t) \( x \)$. Conformal covariance of radius gives

$ R_t \( x \) = frac(2 Y_t \| J' \( z \) \|, \| g'_t \( z \) \|) . $

Since $#h(-0.16667em) upright(d) Z_t = a Z_t^(- 1) #h(-0.16667em) upright(d) t - #h(-0.16667em) upright(d) B_t$,
  differentiation of this formula and Itô’s Formula for $log Z_t$ give

#[#set math.equation(numbering: n => "(2.5)")
 $ #h(-0.16667em) upright(d) log R_t \( x \) & = - 2 a V_t^2 thin #h(-0.16667em) upright(d) t \, & R_t \( x \) & =
   R_0 \( x \) e^(- 2 a s_x \( t \)) \,\
#h(-0.16667em) upright(d) theta_t & = V_t thin #h(-0.16667em) upright(d) B_t + \( 1 - 2 a \) cot theta_t thin
  V_t^2 thin #h(-0.16667em) upright(d) t . $ <op:radius-clock>]

Thus the angle in inner time has generator

$ cal(L) = 1 / 2 partial_theta^2 + \( 1 - 2 a \) cot theta thin partial_theta . $

For every real $r$, direct differentiation yields

#[#set math.equation(numbering: n => "(2.6)")
 $ frac(cal(L) sin^r theta, sin^r theta) = - r / 2 + frac(r \( r - p \), 2) cot^2 theta . $ <op:sine-generator>]

Consequently

#[#set math.equation(numbering: n => "(2.7)")
 $ G_t \( x \) = R_t \( x \)^(- alpha) sin^p theta_t \( x \) quad \( x in D_t \) \, wide G_t \( x \) =
   0 quad \( x in.not D_t \) $ <op:green>]

is a local martingale during survival, with stochastic differential $#h(-0.16667em) upright(d) G_t =
  G_t p cot theta_t V_t thin #h(-0.16667em) upright(d) B_t$.

For $s gt.eq 0$, let $tau_s \( x \)$ be the time at which the radius first attains $R_0 \( x \)
  e^(- 2 a s)$ while $x$ is alive; it is infinity if this never occurs.
  This is the inverse inner clock on successful paths.

#thm([Lemma 2.1.])[
  (Finite stopped change of law).  #emph[For every finite $s gt.eq 0$, the nonnegative weight
#[#set math.equation(numbering: n => "(2.8)")
 $ M_s \( x \) = frac(G_(tau_s \( x \)) \( x \), G_0 \( x \)) upright(bold(1))_({ tau_s \( x \) < oo })
   $ <op:finite-density>]

 has expectation one. It defines a law $bb(P)_x^(*)$ on the path stopped at $tau_s \( x \)$,
   consistently as $s$ increases. Under these laws, the angle in inner time solves
#[#set math.equation(numbering: n => "(2.9)")
 $ #h(-0.16667em) upright(d) theta_s = #h(-0.16667em) upright(d) W_s +
   2 a cot theta_s thin #h(-0.16667em) upright(d) s \, wide cal(L)^(*) = 1 / 2 partial_theta^2 +
   2 a cot theta thin partial_theta \, $ <op:tilted-angle>]

 and neither endpoint is reached in finite inner time.]
  #emph[For an arbitrary stopping time $S$, on ${ S < oo }$ one has
#[#set math.equation(numbering: n => "(2.10)")
 $ bb(E) #h(-0.16667em)
   [G_(tau_s \( x \)) \( x \) upright(bold(1))_({ tau_s \( x \) < oo \, med S < tau_s \( x \) }) divides
   cal(F)_S] = G_S \( x \) upright(bold(1))_({ x in D_S \, med s_x \( S \) < s }) . $ <op:conditional-weight>]

 Conditionally on such a surviving state, the remainder of the centered law is the finite stopped change of law in
   the domain $D_S$, with remaining inner duration $s - s_x \( S \)$. Indeed,
$ R_S \( x \) e^(- 2 a \( s - s_x \( S \) \)) = R_0 \( x \) e^(- 2 a s) \, $

 so the restarted target is the original radius level.]
] <op:finite-tilt>

#proof[
  Localize first by stopping when the angle exits $\( 1 \/ N \, pi - 1 \/ N \)$, when $Y$ falls below $1 \/ N$,
    or when physical time reaches $N$. Write $zeta_N$ for this cutoff and $bb(P)_x^(* \, N)$ for its changed law.
    The stochastic coefficient of $G \/ G_0$ is bounded on this stopped interval.
    Girsanov and (2.5) change the inner-time drift from $\( 1 - 2 a \) cot theta$ to $\( 1 - 2 a + p \) cot
    theta = 2 a cot theta$.
  We verify that removing the cutoffs loses no probability at any finite inner horizon.
    For $0 < q < p$, set $F_q \( theta \) = sin^(- q) theta$. The new generator satisfies
  #[#set math.equation(numbering: n => "(2.11)")
   $ cal(L)^(*) F_q = F_q (q / 2 - frac(q \( p - q \), 2) cot^2 theta) lt.eq q / 2 F_q . $ <op:lyapunov>]
  The locally defined diffusion (2.9) therefore obeys, for its first exit $sigma_delta$ from
    $\( delta \, pi - delta \)$,
  $ bb(P)_(theta_0)^(*) \( sigma_delta lt.eq s \) lt.eq e^(q s \/ 2) F_q \( theta_0 \) sin^q delta . $
  This follows by stopping the nonnegative local supermartingale $e^(- q u \/ 2) F_q \( theta_u \)$.
    The bound tends to zero and proves global existence in inner time and endpoint nonattainment.
  The physical clock cannot obstruct this argument. Along every compact inner interval on which the angle stays in
    $\( 0 \, pi \)$,
  #[#set math.equation(numbering: n => "(2.12)")
   $ frac(#h(-0.16667em) upright(d), #h(-0.16667em) upright(d) s) log Y_s = - a sin^(- 2) theta_s \, wide
     frac(#h(-0.16667em) upright(d) t, #h(-0.16667em) upright(d) s) = Y_s^2 sin^(- 4) theta_s . $ <op:physical-clock>]
  The first equation follows from $#h(-0.16667em) upright(d) Y_t = -
    a Y_t \| Z_t \|^(- 2) #h(-0.16667em) upright(d) t$; the second is $V_t^(- 2)$, using $V_t =
    sin^2 theta_t \/ Y_t$. These formulas keep $Y$ strictly positive and physical time finite on that compact
    interval. Thus, for $E_N = { tau_s < zeta_N }$, the localized changed laws satisfy $bb(P)_x^(* \, N) \( E_N \)
    arrow.r 1$. On $E_N$ the localized density at the target is exactly $M_s$, so
  $ bb(E) \[ M_s upright(bold(1))_(E_N) \] = bb(P)_x^(* \, N) \( E_N \) arrow.r 1 . $
  Under the original law, $E_N$ increases to ${ tau_s < oo }$:
    a point alive through its finite target time has positive height and angle minima on that compact interval.
    Monotone convergence therefore gives $bb(E) M_s = 1$. This calculation uses the localized density only before
    the cutoff; it does not continue the weight through a lifetime.
  Repeating this calculation after $S$, using the Loewner composition rule and strong Markov property,
    gives (2.10). If the point is already dead, or the level has already been reached, both sides are zero.
    Applying the same calculation between two finite inner levels proves consistency and the asserted conditional
    restart. Only stopped paths through a finite inner level enter any of these changes of law. ◻
]

=== 2.2 Uniform mixing and the remaining potential <uniform-mixing-and-the-remaining-potential>

The stationary density and uniform mixing are also described in #cite(label("LawlerRezaei2015")) Section 4.2.
  The orthogonal-polynomial proof has a direct counterpart in Zhan #cite(label("Zhan2019Optimal"))
  Proposition 4.2. Writing $X$ for the diffusion in that proposition, the substitution $theta_s =
  X_(4 s \/ kappa) \/ 2$ gives our centered diffusion. We prove mixing uniformly over the initial angle and give
  the finite-lifetime estimates needed for the subsequent potential identity.

#thm([Lemma 2.2.])[
  (Uniform angle mixing).  #emph[Let
#[#set math.equation(numbering: n => "(2.13)")
 $ pi_a \( #h(-0.16667em) upright(d) theta \) = c_a sin^(4 a) theta thin #h(-0.16667em) upright(d) theta \, wide
   c_a^(- 1) = integral_0^pi sin^(4 a) theta thin #h(-0.16667em) upright(d) theta . $ <op:stationary>]

 There is a deterministic $s_a < oo$ such that, for all $s gt.eq s_a$ and every initial angle in $\( 0 \, pi \)$,
   the transition law of (2.9) has density between $1 \/ 2$ and $2$ relative to $pi_a$.
   In particular, after such a gap the conditional expectation of any nonnegative angle function lies between one
   half and twice its $pi_a$ integral. Moreover,
#[#set math.equation(numbering: n => "(2.14)")
 $ integral_0^pi sin^(- p) theta thin pi_a \( #h(-0.16667em) upright(d) theta \) =
   c_a integral_0^pi sin theta thin #h(-0.16667em) upright(d) theta < oo . $ <op:inverse-angle>]

]
] <op:mixing>

#proof[
  For $v = cos theta$, the generator and candidate invariant probability measure become
  $ cal(A) = frac(1 - v^2, 2) partial_v^2 - (1 / 2 + 2 a) v partial_v \, wide
    pi.alt_a \( #h(-0.16667em) upright(d) v \) = tilde(c)_a \( 1 - v^2 \)^(2 a - 1 \/ 2) thin #h(-0.16667em)
    upright(d) v . $
  Integration by parts makes $cal(A)$ symmetric on polynomials;
    the boundary term vanishes because $\( 1 - v^2 \)^(2 a + 1 \/ 2)$ tends to zero.
    Let $P_m$ be the orthonormal polynomials for $pi.alt_a$, with $P_0 = 1$.
    The operator preserves degree and acts on the leading degree-$m$ coefficient by $- lambda_m$,
    where $lambda_m = m \( m + 4 a \) \/ 2$. Symmetry and orthogonality therefore give $cal(A) P_m = - lambda_m P_m$.
  Here is a sufficient elementary bound on these polynomials.
    Choose $m + 1$ disjoint intervals of length comparable to $1 \/ \( m + 1 \)$, separated by the same order,
    in $\[ - 1 \/ 2 \, 1 \/ 2 \]$. The density of $pi.alt_a$ is bounded below there.
    The unit $L^2$ norm supplies in each interval a point where $\| P_m \| lt.eq C_a sqrt(m + 1)$.
    Lagrange interpolation at these points, whose pairwise separation is at least $c \/ \( m + 1 \)$, gives
  $ parallel P_m parallel_(oo \, \[ - 1 \, 1 \]) lt.eq exp { C_a \( m + 1 \) log \( m + 2 \) } . $
  Consequently, for every $s > 0$ the series
  $ k_s \( v \, w \) = 1 + sum_(m gt.eq 1) e^(- s lambda_m) P_m \( v \) P_m \( w \) $
  converges absolutely and uniformly in $\( v \, w \) in \[ - 1 \, 1 \]^2$.
    Itô’s Formula for bounded polynomials gives $bb(E)_v P_m \( v_s \) = e^(- s lambda_m) P_m \( v \)$,
    so the actual transition probability and $k_s \( v \, w \) pi.alt_a \( #h(-0.16667em) upright(d)
    w \)$ have identical polynomial moments. Polynomial density in $C \( \[ - 1 \, 1 \] \)$ identifies the
    measures; this also proves that the displayed kernel represents a nonnegative measure.
    Its nonconstant part tends uniformly to zero as $s arrow.r oo$, proving the bounds.
    The conditional assertion follows from the Markov property. Finally $4 a - p = 1$ proves (2.14). ◻
]

#thm([Proposition 2.3.])[
  (Finite lifetime and tested potential identity).  #emph[Under the consistent centered laws, $T^(*) \( x \) =
    lim_(s arrow.r oo) tau_s \( x \)$ is finite almost surely.
    For every finite deterministic $t$ and bounded raw $cal(F)_t$-measurable random variable $H$,
#[#set math.equation(numbering: n => "(2.15)")
 $ bb(E) \[ H G_t \( x \) \] = G_0 \( x \) bb(E)_x^(*) \[ H upright(bold(1))_({ t < T^(*) \( x \) }) \] .
   $ <op:tested-potential>]

 On the right, $H$ is evaluated only on stopped data extending beyond $t$. Thus
#[#set math.equation(numbering: n => "(2.16)")
 $ bb(E) G_t \( x \) = G_0 \( x \) bb(P)_x^(*) \( T^(*) \( x \) > t \) arrow.r
   0 quad \( t arrow.r oo \) . $ <op:potential-decay>]

 For every stopping time $S$,
#[#set math.equation(numbering: n => "(2.17)")
 $ bb(E) \[ G_S \( x \) upright(bold(1))_({ S < oo }) \] lt.eq G_0 \( x \) . $ <op:optional-bound>]

]
] <op:potential>

#proof[
  Choose $0 < q < p$ and $epsilon in \( 0 \, a \/ 2 \)$. Lemma 3 gives a uniform bound on $bb(E)_x^(*)
    F_q \( theta_m \)$ for all sufficiently large integers $m$, since $F_q$ is integrable against $pi_a$.
    The nonnegative supermartingale from (2.11) and its maximal inequality imply
  $ bb(P)_x^(*) #h(-0.16667em) (sup_(m lt.eq s lt.eq m + 1) F_q \( theta_s \) > e^(q epsilon m)) lt.eq
    C e^(- q epsilon m) . $
  Borel–Cantelli shows that eventually $sin^(- 4) theta_s lt.eq e^(4 epsilon s)$.
    Equation (2.12) also gives $Y_s lt.eq Y_0 e^(- a s)$. Therefore
  $ T^(*) \( x \) = integral_0^oo Y_s^2 sin^(- 4) theta_s thin #h(-0.16667em) upright(d) s < oo . $
  The integral over each initial compact interval is finite by endpoint nonattainment;
    the remaining integrand is bounded by a constant times $e^(- \( 2 a - 4 epsilon \) s)$.
  For a finite inner horizon $l$, Lemma 2 gives
  $ G_0 \( x \) bb(E)_x^(*) \[ H upright(bold(1))_({ t < tau_l \( x \) }) \] =
    bb(E) \[ H G_t \( x \) upright(bold(1))_({ x in D_t \, med s_x \( t \) < l }) \] . $
  First take $H = 1$. Monotone convergence as $l arrow.r oo$ proves the untested identity and the integrable bound
    $bb(E) G_t lt.eq G_0$. The same passage for bounded signed $H$ then follows by dominated convergence.
    The union of the events on the left is exactly ${ t < T^(*) }$; no value at $T^(*)$ is used.
    Decay follows from $T^(*) < oo$. Applying (2.10) at $S$, taking expectations, and increasing $l$ proves (2.17).
  These identities also make the parameter measurability needed below explicit. For a raw $A in cal(F)_t$,
  $ bb(P)_x^(*) \( A \, t < T^(*) \) = lim_(l arrow.r oo) frac(1, G_0 \( x \))
    bb(E) \[ upright(bold(1))_A G_t \( x \) upright(bold(1))_({ x in D_t \, med s_x \( t \) < l }) \] . $
  The ODE, its spatial derivative, and the inverse clock are measurable in the driver and the marked point.
    The right side is consequently a measurable kernel in $x$.
    This permits integration over centers and does not require a common exceptional-set assertion for all centers. ◻
]

== 3 A uniform estimate for several radius hits <mp:section>

The construction of a trace measure will require moments of every fixed integer order.
  The necessary probability estimate allows each point to reach its own target at a different time.
  Its constant is uniform over the physical domain, a feature that will later be essential for disk models with
  arbitrary boundary angles.

Multipoint Green estimates and their moment consequences have a substantial history.
  Lawler–Werness #cite(label("LawlerWerness2013")) Theorems 1–2 prove ordered two-point Green limits and
  unequal-radius approach estimates; Rezaei–Zhan #cite(label("RezaeiZhan2017")) Theorems 1.1–1.2 prove all-order
  Euclidean approach bounds and finite moments of natural content.
  The estimate needed here is a consequence of those Euclidean bounds and Koebe’s estimates;
  a comparison after the proof gives the deduction. We give a direct proof in arbitrary physical domains using
  regularized products. Each completed point is frozen at its own hit,
  and a conformal interaction potential controls the remaining factors.
  We then integrate the collision kernel to obtain the required moments.

#thm([Proposition 3.1.])[
  (Multipoint radius estimate).  #emph[Let $D = J \( bb(H) \)$ as in Section 2, and let $x_1 \, dots.h \,
    x_m in D$ be distinct. Suppose
$ 0 < b_i lt.eq R_D \( x_i \) \, wide b_i lt.eq \| x_i - x_j \| quad \( j eq.not i \) . $

 For targets $0 < e_i lt.eq b_i$, let $E$ be the event that each $x_i$ reaches conformal radius $e_i$ while alive. Then
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(P) \( E \) lt.eq C_(m \, a) product_(i = 1)^m \( e_i \/ b_i \)^alpha . $ <mp:hit-bound>]

 The constant depends only on $m$ and $a$, independently of $D$, $J$, the initial angles, the radii,
   and the order and times of the hits. A point need not remain alive after reaching its own target.
   For targets exceeding some caps, the corresponding constraints may be dropped, giving, after enlarging $C_(m \, a)$,
#[#set math.equation(numbering: n => "(3.2)")
 $ bb(P) \( E \) lt.eq C_(m \, a) product_(i = 1)^m min { 1 \, \( e_i \/ b_i \)^alpha } . $ <mp:capped-hit-bound>]

]
] <mp:estimate>

=== 3.1 Controlling the interaction of two active points <controlling-the-interaction-of-two-active-points>

Let $sigma_i$ and $T_i$ be the first times when point $i$ reaches radius $b_i$ and $e_i$, respectively,
  while alive, with value infinity if the corresponding radius is never reached.
  The point is active on $\[ sigma_i \, T_i \)$ while it remains alive. Put

$ U_i = frac(1, 2 a) log b_i / e_i \, wide u_i \( t \) = integral_(sigma_i)^t V_i \( v \)^2 thin #h(-0.16667em)
  upright(d) v $

on its active interval. Thus $R_t \( x_i \) = b_i e^(- 2 a u_i \( t \))$, and it finishes when $u_i = U_i$.
  We first take $e_i < b_i$; constraints with $e_i = b_i$ may be dropped.

For two surviving points put

$ L_(i j) \( t \) = log lr(|frac(Z_i \( t \) - overline(Z_j \( t \)), Z_i \( t \) - Z_j \( t \))|) gt.eq 0 . $

The common Brownian driver cancels in the two differences. Consequently

#[#set math.equation(numbering: n => "(3.3)")
 $ frac(#h(-0.16667em) upright(d), #h(-0.16667em) upright(d) t) L_(i j) =
   "Re" (- frac(a, Z_i overline(Z_j)) + frac(a, Z_i Z_j)) = - 2 a V_i V_j . $ <mp:interaction-derivative>]

This is also a conformal invariant: for a disk uniformization $F : bb(D) arrow.r D_t$ with $F \( 0 \) =
  x_i$ and $F \( w \) = x_j$, it equals $- log \| w \|$. Write $rho = \| w \|$ and $L = - log rho$.
  The growth estimate (2.4) gives

$ frac(\| x_i - x_j \|, R_t \( x_i \)) lt.eq frac(rho, \( 1 - rho \)^2) = frac(1, 4 sinh^2 \( L \/ 2 \)) . $

During joint activity, the separation assumption and $R_t \( x_i \) = b_i e^(- 2 a u_i)$ imply

$ L_(i j) lt.eq 2 "arsinh" (1 / 2 sqrt(frac(R_t \( x_i \), \| x_i - x_j \|))) lt.eq e^(- a u_i) . $

Interchanging the two points proves

#[#set math.equation(numbering: n => "(3.4)")
 $ L_(i j) \( t \) lt.eq e^(- a max \( u_i \( t \) \, u_j \( t \) \)) wide
   upright("during joint activity") . $ <mp:interaction-decay>]

In particular, for $c gt.eq 0$ with $2 c < a$,

#[#set math.equation(numbering: n => "(3.5)")
 $ integral_(upright("joint activity")) e^(c \( u_i + u_j \)) V_i V_j thin #h(-0.16667em) upright(d) t lt.eq
   I \( a \, c \) := frac(e^(2 c), 2 a \( 1 - e^(2 c - a) \)) . $ <mp:interaction-integral>]

To see this, joint activity is an interval, and $v = max \( u_i \, u_j \)$ increases on it.
  On its portion with $k lt.eq v < k + 1$, the total decrease available to $L_(i j)$ is at most $e^(- a k)$,
  by (3.4). Equation (3.3) bounds the unweighted integral there by $e^(- a k) \/ \( 2 a \)$,
  while the weight is at most $e^(2 c \( k + 1 \))$. Summing over $k gt.eq 0$ proves (3.5),
  also for any truncated part of the joint active interval.
  This argument is made in $D_t$ itself; no bound on the derivative of the initial map $J$ enters it.

=== 3.2 Regularized factors and the product supermartingale <regularized-factors-and-the-product-supermartingale>

The factor $sin^p theta$ in the one-point martingale has no positive lower bound uniform in the angle at a target
  hit. We add a positive regularizing term at both ends of each active interval,
  so activation and completion have angle-uniform bounds. The added term decays away from those ends:
  this keeps its accumulated drift bounded independently of the interval length.
  The symmetric distance $min { u \, U_i - u }$ records exactly that choice.

The exponent $q$ will supply negative angular drift. Young’s Inequality will introduce a regularization loss with
  exponent $M$, and we choose the decay rate $beta$ so that the pair interaction can absorb that loss.
  Use the explicit values

#[#set math.equation(numbering: n => "(3.6)")
 $ q = 1 / 2 min \( 1 \, p \) \, wide eta = frac(1 - q, 2 - q) in \( 0 \, 1 / 2 \) \, wide M =
   frac(1 + eta, 1 - 2 eta) = 3 / q - 2 \, wide beta = min (1 \, frac(a, 4 M)) . $ <mp:parameters>]

Thus $0 < q < min \( 1 \, p \)$ and $2 M beta lt.eq a \/ 2 < a$. For an active point define

#[#set math.equation(numbering: n => "(3.7)")
 $ delta_i \( u \) = e^(- beta min \( u \, U_i - u \)) \, wide f_i \( u \, theta \) = sin^p theta +
   delta_i \( u \) \( 1 + sin^q theta \) \, wide D_i = delta_i / f_i sin^(q - 2) theta_i . $ <mp:factors>]

The factor for point $i$ is $1$ before activation,

$ Q_i \( t \) = 1 / 3 e^(p u_i \( t \) \/ 2) f_i \( u_i \( t \) \, theta_i \( t \) \) $

during activity, and the constant $e^(p U_i \/ 2) \/ 3$ after completion.
  The activation jump is downward because $f_i \( 0 \, theta \) lt.eq 3$;
  the completion jump is downward because $f_i \( U_i \, theta \) gt.eq 1$.
  After completion the point’s factor is frozen, including if that point is swallowed later.
  Figure 1 illustrates the separate endpoints.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.72), (6.97, 0.72), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6.97, 0.72), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$x_1$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (0.85, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0.85, 0), (3.57, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((3.57, 0), (6.46, 0), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((0.85, 0), radius: 0.05292, fill: black, stroke: none)
  circle((3.57, 0), radius: 0.05292, fill: black, stroke: none)
  content((0.85, 0), [#text(size: 9pt)[$sigma_1$]], anchor: "south", padding: 0.1176cm)
  content((3.57, 0), [#text(size: 9pt)[$T_1$]], anchor: "south", padding: 0.1176cm)
  content((0, -1.008), [#text(size: 9pt)[$x_2$]], anchor: "east", padding: 0.1176cm)
  line((0, -1.008), (2.125, -1.008), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.125, -1.008), (5.525, -1.008), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((5.525, -1.008), (6.46, -1.008), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((2.125, -1.008), radius: 0.05292, fill: black, stroke: none)
  circle((5.525, -1.008), radius: 0.05292, fill: black, stroke: none)
  content((2.125, -1.008), [#text(size: 9pt)[$sigma_2$]], anchor: "south", padding: 0.1176cm)
  content((5.525, -1.008), [#text(size: 9pt)[$T_2$]], anchor: "south", padding: 0.1176cm)
  content((0, -2.016), [#text(size: 9pt)[$x_3$]], anchor: "east", padding: 0.1176cm)
  line((0, -2.016), (0.51, -2.016), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0.51, -2.016), (4.42, -2.016), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((4.42, -2.016), (6.46, -2.016), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  circle((0.51, -2.016), radius: 0.05292, fill: black, stroke: none)
  circle((4.42, -2.016), radius: 0.05292, fill: black, stroke: none)
  content((0.51, -2.016), [#text(size: 9pt)[$sigma_3$]], anchor: "south", padding: 0.1176cm)
  content((4.42, -2.016), [#text(size: 9pt)[$T_3$]], anchor: "south", padding: 0.1176cm)
  content((1.87, -2.88), [#text(size: 9pt)[solid: active factor]])
  content((5.1, -2.88), [#text(size: 9pt)[dashed: frozen factor]])
})],
  caption: [Figure 1: The multipoint event uses each point’s own activation and target stop. The solid intervals may overlap in any order. After $T_i$ the factor for $x_i$ is constant, and no further survival of that point is required. The axis is schematic physical time, not the individual conformal-radius clocks. ],
) <fig:individual-stops>

Put $Q = product_(i = 1)^m Q_i$. If all points finish, this product has the deterministic value

$ Q = 3^(- m) product_i \( b_i \/ e_i \)^alpha . $

Thus a uniform bound on the expectation of a discounted product will give the desired probability estimate,
  provided the total discount is deterministically bounded.
  The individual negative drifts absorb the singular angular terms,
  and the pair interaction estimate pays for what remains. We give both estimates explicitly.
  Write $s = sin theta$, $k = q \( p - q \) \/ 2$, and $sigma = delta' \/ delta$, so $\| sigma \| lt.eq beta lt.eq
  1$ almost everywhere. Formula (2.6) gives

#[#set math.equation(numbering: n => "(3.8)")
 $ frac(\( partial_u + cal(L) + p \/ 2 \) f, f) = delta / f
   [p / 2 + frac(\( p - q \) \( 1 + q \), 2) s^q - k s^(q - 2) + sigma \( 1 + s^q \)] . $ <mp:exact-drift>]

Let

$ A = p / 2 + frac(\( p - q \) \( 1 + q \), 2) + 2 \, wide h_0 = (frac(k, 2 A))^(1 \/ \( 2 - q \)) in \( 0 \, 1 \) . $

The bracket in (3.8) is at most $A - k s^(q - 2)$. For $s < h_0$,
  adding $\( k \/ 2 \) D$ leaves a nonpositive expression. For $s gt.eq h_0$, use $f gt.eq s^p gt.eq h_0^p$. We obtain

#[#set math.equation(numbering: n => "(3.9)")
 $ frac(\( partial_u + cal(L) + p \/ 2 \) f, f) lt.eq C_1 delta - c_1 D \, wide C_1 = A h_0^(- p) \, quad c_1 =
   k \/ 2 > 0 . $ <mp:drift-bound>]

All these constants depend only on $a$. The corner of $delta$ at $U_i \/ 2$ causes no additional term:
  it is an absolutely continuous function of the finite-variation clock $u_i$.

Because $q < p$, $q < 1$, and $0 < delta lt.eq 1$, angular differentiation gives $\| partial_theta f \|
  lt.eq \( p + q \) s^(q - 1)$. Also $delta lt.eq f lt.eq 3$, and $eta \( q - 2 \) = q - 1$. Therefore

#[#set math.equation(numbering: n => "(3.10)")
 $ frac(\| partial_theta f \|, f) lt.eq \( p + q \) delta^(- 1) s^(q - 1) lt.eq \( p + q \) 3^eta
   delta^(- 1 - eta) D^eta . $ <mp:derivative-bound>]

This bound includes the singular angular behavior when $p < 1$.

On active intervals, the normalized Brownian coefficient of $Q_i$ is $\( partial_theta f_i \/ f_i \) V_i$.
  Itô’s Product Formula thus gives one cross term for each unordered active pair.
  Its absolute value is bounded, by (3.10), by

$ C_2 \( delta_i delta_j \)^(- 1 - eta) \( D_i V_i^2 \)^eta \( D_j V_j^2 \)^eta \( V_i V_j \)^(1 - 2 eta) . $

Weighted Young’s Inequality with weights $eta \, eta \, 1 - 2 eta$ shows that for any $epsilon.alt > 0$ this is at most

#[#set math.equation(numbering: n => "(3.11)")
 $ epsilon.alt \( D_i V_i^2 + D_j V_j^2 \) + C_epsilon.alt \( delta_i delta_j \)^(- M) V_i V_j . $ <mp:young>]

Indeed, putting $r = 1 - 2 eta$, the weighted arithmetic–geometric mean inequality gives the displayed bound with
  $C_epsilon.alt = r C_2^(1 \/ r) \( eta \/ epsilon.alt \)^(2 eta \/ r)$,
  and raises $delta_i delta_j$ to exponent $- \( 1 + eta \) \/ r = - M$.
  For $m > 1$ choose $epsilon.alt = c_1 \/ \[ 2 \( m - 1 \) \]$; for $m = 1$ there are no cross terms.
  Summing (3.9) and (3.11) absorbs the pair contributions into the negative terms.
  A nonnegative upper bound for the remaining normalized physical-time drift is

$ k_t = C_1 sum_(i upright(" active")) delta_i V_i^2 + C_3 sum_(i < j\
i \, j upright(" active")) \( delta_i delta_j \)^(- M) V_i V_j \, $

where $C_3$ depends only on $m \, a$ (and the pair sum is zero for $m = 1$).
  Its total integral has a deterministic bound. Namely,

$ integral_0^(U_i) delta_i \( u \) thin #h(-0.16667em) upright(d) u = 2 / beta \( 1 - e^(- beta U_i \/ 2) \) lt.eq
  2 / beta \, wide \( delta_i delta_j \)^(- M) lt.eq e^(M beta \( u_i + u_j \)) . $

Equation (3.5), with $c = M beta$, yields

#[#set math.equation(numbering: n => "(3.12)")
 $ integral k_t thin #h(-0.16667em) upright(d) t lt.eq K_(m \, a) := frac(2 m C_1, beta) +
   C_3 binom(m, 2) I \( a \, M beta \) < oo . $ <mp:discount>]

It follows that $Q_t exp \( - integral_0^t k_v thin #h(-0.16667em) upright(d)
  v \)$ is a nonnegative local supermartingale on every nonsingular interval,
  including its downward activation and completion jumps.

#proof[
  #emph[Completion of the proof of Proposition 5.] To justify stopping the product,
    monitor #emph[all unfinished points], including those not yet active.
    Stop if any of their angles leaves $\( 1 \/ N \, pi - 1 \/ N \)$,
    if any of their heights $Y_i$ falls to $1 \/ N$, or at physical time $N$.
    Denote this cutoff by $zeta_N$, and also stop when all targets have been completed.
    No cutoff is imposed on a completed point. At these stops every stochastic integral used above is legitimate;
    a further standard bounded localizer, followed by Fatou, gives expectation at most the initial value,
    which is at most $1$. There is no need to continue a factor through the singular lifetime of an unsuccessful
    unfinished point.
  Put $T_(upright("all")) = max_i T_i$. On ${ T_(upright("all")) < zeta_N }$, the final discounted product is at least
  $ e^(- K_(m \, a)) 3^(- m) exp (p / 2 sum_i U_i) . $
  Consequently
  $ bb(P) \( T_(upright("all")) < zeta_N \) lt.eq 3^m e^(K_(m \, a)) exp (- p / 2 sum_i U_i) . $
  Every successful path belongs to these events for all sufficiently large $N$.
    Indeed, each point remains alive through its own finite $T_i$,
    so its continuous height and its distance in angle from the endpoints have strictly positive minima on
    $\[ 0 \, T_i \]$. There are only finitely many points, and later swallowing of a finished point is irrelevant.
    Thus cutoff exhaustion covers precisely all the success paths needed for the upper bound.
    Since $p \/ \( 4 a \) = alpha$, passage to the limit gives (3.1) with $C_(m \, a) =
    3^m e^(K_(m \, a))$ when all $e_i < b_i$.
  For equality targets, or targets larger than their caps, retain only the strict constraints $e_i < b_i$.
    The original event is contained in the retained event, and all separation assumptions still hold.
    Taking the maximum of the constants for at most $m$ retained points, including the empty set,
    proves (3.2) and the full stated proposition. ◻
]

===== 3.2.1 Comparison with the Euclidean estimate. <comparison-with-the-euclidean-estimate.>

To deduce the proposition from Rezaei–Zhan, put $f = J^(- 1)$, $z_i = f \( x_i \)$,
  $lambda_i = \| f' \( x_i \) \|$, and $z_0 = 0$. Koebe’s Quarter Theorem applied to $f$ on
  $B \( x_i \, b_i \/ 4 \) subset D$ gives

$ \| z_i - z_j \| & gt.eq lambda_i b_i \/ 16 &  & \( 1 lt.eq j lt.eq m \, med j eq.not i \) \,\
"Im" z_i & = lambda_i R_D \( x_i \) \/ 2 gt.eq lambda_i b_i \/ 2 . $

Indeed, $f \( B \( x_i \, b_i \/ 4 \) \)$ contains the disk with center $z_i$ and radius $lambda_i b_i \/ 16$,
  whereas every other $x_j$ lies outside $B \( x_i \, b_i \/ 4 \)$.
  Retain only targets with $e_i < b_i \/ 32$ and relabel the retained points; if none remain,
  the trivial probability bound suffices. Their preceding-point distances satisfy $l_i =
  min_(0 lt.eq j < i) \| z_i - z_j \| gt.eq lambda_i b_i \/ 16$.
  At a successful hit, radius covariance gives $R_(H_t) \( z_i \) = lambda_i e_i$.
  Koebe’s distance bound then puts the past half-plane trace within $r_i = lambda_i e_i$ of $z_i$:
  the real line is farther away. Theorem 1.1 and equation (1.5) of #cite(label("RezaeiZhan2017")) give

$ bb(P) { "dist" \( z_i \, gamma \) lt.eq r_i upright(" for all retained ") i } lt.eq
  C_(m \, a) product_(i upright(" retained")) \( r_i \/ l_i \)^alpha lt.eq
  C_(m \, a) 16^(m alpha) product_(i upright(" retained")) \( e_i \/ b_i \)^alpha . $

Each omitted target contributes at least $32^(- alpha)$ to the capped product,
  so it can be restored by enlarging the constant. This proves the stated domain-uniform consequence without a
  boundary extension of $J$.

=== 3.3 Integrating the collision singularities <integrating-the-collision-singularities>

#thm([Lemma 3.2.])[
  (Capped distance kernels).  #emph[Let $0 < alpha < 1$, $b > 0$, and let $K subset bb(C)$ be a bounded Borel set.
    For distinct $x_1 \, dots.h \, x_m$ set
$ b_i = min #scale(x: 120%, y: 120%)[\(] b \, min_(j eq.not i) \| x_i - x_j \| #scale(x: 120%, y: 120%)[\)] \,
  wide F_b \( x_1 \, dots.h \, x_m \) = product_(i = 1)^m b_i^(- alpha) \, $

 where the inner minimum is omitted when $m = 1$. Then
#[#set math.equation(numbering: n => "(3.13)")
 $ integral_(K^m) F_b \( x_1 \, dots.h \, x_m \) product_i #h(-0.16667em) upright(d) A \( x_i \) < oo .
   $ <mp:all-variable-integral>]

 The same assertion holds with one point fixed: for bounded $K_0$,
#[#set math.equation(numbering: n => "(3.14)")
 $ sup_(x_0 in K_0) integral_(K^m) F_b \( x_0 \, x_1 \, dots.h \, x_m \) product_(i = 1)^m #h(-0.16667em)
   upright(d) A \( x_i \) < oo . $ <mp:fixed-center-integral>]

 Values on diagonals may be set to infinity; they do not affect these integrals.]
] <mp:kernel-integral>

#proof[
  For each factor, $b_i^(- alpha) lt.eq b^(- alpha) + sum_(j eq.not i) \| x_i - x_j \|^(- alpha)$.
    Expand their product. Each resulting term corresponds to a directed graph with at most one outgoing edge per
    vertex, no self-edge, and a factor $\| x_i - x_j \|^(- alpha)$ for each edge $i arrow.r j$.
    Integrate a vertex with no incoming edge: if it has one outgoing edge its integral is bounded uniformly in the
    other endpoint because $alpha < 2$; if isolated it contributes only the area of a containing box.
    Repeating removes all trees attached to directed cycles and all components without cycles.
  For a remaining cycle of length at least three, one vertex has two incident factors.
    Their integral is uniformly bounded by
  $ integral_K \| x - y \|^(- alpha) \| x - z \|^(- alpha) thin #h(-0.16667em) upright(d) A \( x \) lt.eq
    (integral_K \| x - y \|^(- 2 alpha) thin #h(-0.16667em) upright(d) A \( x \))^(1 \/ 2)
    (integral_K \| x - z \|^(- 2 alpha) thin #h(-0.16667em) upright(d) A \( x \))^(1 \/ 2) lt.eq C_K \, $
  since $2 alpha < 2$. Removing this vertex leaves a chain, whose endpoints can be integrated successively.
    A two-cycle contributes $\| x - y \|^(- 2 alpha)$, so the same integrability applies directly.
    There are finitely many graph terms, proving (3.13).
  For the fixed point, choose $R < oo$ such that $K - x_0 subset B \( 0 \, R \)$ for every $x_0 in K_0$.
    The kernel $F_b$ is invariant under simultaneous translation, with the cap $b$ unchanged.
    Thus the integral in (3.14) is bounded by
  $ integral_(B \( 0 \, R \)^m) F_b \( 0 \, y_1 \, dots.h \, y_m \) product_i #h(-0.16667em) upright(d) A \( y_i \) . $
  Average a simultaneous translation by $v in B \( 0 \, 1 \)$. A change of variables bounds the last display by
  $ frac(1, \| B \( 0 \, 1 \) \|) integral_(B \( 0 \, R + 1 \)^(m + 1)) F_b \( v \, x_1 \, dots.h \, x_m \) thin
    #h(-0.16667em) upright(d) A \( v \) product_i #h(-0.16667em) upright(d) A \( x_i \) \, $
  which is finite by the already proved assertion. This is translation invariance of a deterministic distance
    kernel; no translation invariance of a chordal SLE law is required. ◻
]

We record precisely the moment consequence used in the next sections. For $l > 0$ let

$ A_l \( #h(-0.16667em) upright(d) x \) = G_(tau_l \( x \)) \( x \) upright(bold(1))_({ tau_l \( x \) < oo }) thin
  #h(-0.16667em) upright(d) A \( x \) . $

#thm([Corollary 3.3.])[
  (Integrated level weights).  #emph[Let $f gt.eq 0$ be bounded and supported in a compact $K subset.double D$.
    Then, for every integer $m gt.eq 1$,
#[#set math.equation(numbering: n => "(3.15)")
 $ sup_(l > 0) bb(E) \[ A_l \( f \)^m \] < oo . $ <mp:ordinary-moments>]

 Fix also $x_0 in D$ and $0 < e_0 lt.eq R_D \( x_0 \)$, and let $E_0$ be the event that $x_0$ reaches radius $e_0$
   while alive. Then
#[#set math.equation(numbering: n => "(3.16)")
 $ sup_(l > 0) bb(E) \[ upright(bold(1))_(E_0) A_l \( f \)^m \] lt.eq C e_0^alpha . $ <mp:center-moments>]

 Here $C$ can be chosen using only $m \, a$, the size and support of $f$, the bounded location of $x_0$,
   and a positive lower bound for $R_D$ on $K union { x_0 }$.
   In particular, in a fixed disk these bounds are uniform over all initial boundary angles.]
] <mp:level-moments>

#proof[
  Choose a fixed cap $b > 0$ below the indicated initial radii,
    and cap it further by nearest-neighbor distances for each integration tuple.
    At point $x_i$, the target is $e_i = R_D \( x_i \) e^(- 2 a l)$, and $G_(tau_l \( x_i \)) \( x_i \) lt.eq
    e_i^(- alpha)$ on success. Tonelli and (3.2) therefore bound the $m$th moment by
  $ C_(m \, a) integral_(K^m) product_(i = 1)^m f \( x_i \) b_i^(- alpha) product_i #h(-0.16667em) upright(d)
    A \( x_i \) \, $
  because $e_i^(- alpha) min { 1 \, \( e_i \/ b_i \)^alpha } lt.eq b_i^(- alpha)$. This proves (3.15) by Lemma 6.
    For the additional fixed center, apply the same argument to $m + 1$ points and use
  $ min { 1 \, \( e_0 \/ b_0 \)^alpha } lt.eq e_0^alpha b_0^(- alpha) . $
  The fixed-center integral proves (3.16), even when the center’s target exceeds its distance cap.
    No relative order of the center hit and the other hits is imposed.
    Finally, in $bb(D)$ one has $R_D \( x \) = 1 - \| x \|^2$, independently of its boundary marks.
    The proof was carried out directly in the physical domain,
    so a degenerating half-plane identification introduces no additional constant. ◻
]

== 4 A canonical mass on the trace <mass:section>

We now turn the Green potential into an increasing measure on the trace.
  The conditional Green-potential approach goes back to Lawler–Sheffield #cite(label("LawlerSheffield2011"))
  Proposition 2.2 and Section 3 and Lawler–Zhou #cite(label("LawlerZhou2013")) Proposition A and Theorem 1;
  see also the Minkowski-content construction in #cite(label("LawlerRezaei2015")).
  Here one common sequence of convex combinations supplies the mass and all of its versions.
  We construct the measure and prove the properties needed below directly;
  no identification with Minkowski content is required. All measures in this section are measures on the open
  domain. Write $lambda \( f \) = integral f thin #h(-0.16667em) upright(d) lambda$ for integration against a measure.

#thm([Proposition 4.1.])[
  (Construction and conditional kernel).  #emph[There is an adapted increasing family
    $\( mu_t \)_(0 lt.eq t lt.eq oo)$ of locally finite measures on $bb(H)$, starting at zero,
    with the following properties. Its terminal measure is nonatomic and has moments of every integer order on
    compact sets. Almost surely, simultaneously for all $0 lt.eq v < t < oo$, the increment $mu_t -
    mu_v$ is carried by $gamma \( \[ v \, t \] \) ∩ bb(H)$. The process is locally continuous in total variation,
    and $mu_t arrow.t mu_oo$ as $t arrow.r oo$. For every stopping time $S$, possibly infinite,
#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] mu_oo \( #h(-0.16667em) upright(d) x \) -
   mu_S \( #h(-0.16667em) upright(d) x \) divides cal(F)_S #scale(x: 120%, y: 120%)[\]] =
   G_S \( x \) thin #h(-0.16667em) upright(d) A \( x \) \, wide G_oo := 0 . $ <mass:kernel>]

 This is an equality of conditional measure kernels; in particular it allows nonnegative tests known at time $S$.
   Moreover,
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E) mu_oo \( #h(-0.16667em) upright(d) x \) = G_0 \( x \) thin #h(-0.16667em) upright(d) A \( x \) . $ <mass:mean>]

]
] <mass:construction>

=== 4.1 Deterministic convex extraction <deterministic-convex-extraction>

The compact moment bounds permit one simultaneous limit for all rational times and a determining family of spatial
  tests. Keeping the same convex coefficients is what later makes the kernels and conformal images properties of
  one measure rather than separately chosen versions.

For an integer $j gt.eq 1$ define

#[#set math.equation(numbering: n => "(4.3)")
 $ M_t^(\( j \)) \( #h(-0.16667em) upright(d) x \) = G_(tau_j \( x \)) \( x \)
   upright(bold(1))_({ tau_j \( x \) lt.eq t \, med tau_j \( x \) < oo }) thin #h(-0.16667em) upright(d)
   A \( x \) \, wide 0 lt.eq t lt.eq oo . $ <mass:approximants>]

The density is zero on failure to reach the level. For a compact $C subset.double bb(H)$,
  fix $c_C > 0$ with $c_C lt.eq inf_C R_0$. Given distinct $x_1 \, dots.h \, x_m in C$, set

$ b_i = min #scale(x: 120%, y: 120%)[\(] c_C \, min_(k eq.not i) \| x_i - x_k \| #scale(x: 120%, y: 120%)[\)] \, $

where the second minimum is omitted when $m = 1$. The terminal approximant is the level weight $A_j$ of
  Corollary 7. The collision-kernel estimate in its proof gives, for every bounded nonnegative $f$ supported in $C$,

#[#set math.equation(numbering: n => "(4.4)")
 $ sup_j bb(E) #scale(x: 120%, y: 120%)[\[] M_oo^(\( j \)) \( f \)^m #scale(x: 120%, y: 120%)[\]] lt.eq
   C_(m \, a) integral_(C^m) product_(i = 1)^m f \( x_i \) b_i^(- alpha) thin #h(-0.16667em) upright(d)
   A \( x_1 \) dots.h.c #h(-0.16667em) upright(d) A \( x_m \) < oo . $ <mass:moment-bound>]

The last assertion is Lemma 6. All constants are independent of $j$.

We obtain one sequence of convex combinations as follows.
  Choose a countable family of continuous compactly supported tests,
  uniformly dense among tests supported in each member of a compact exhaustion.
  Include nonnegative cutoff functions equal to one on that exhaustion,
  and rational linear combinations of the chosen tests. Enumerate the pairs of these tests with times in
  $bb(Q)_(+) union { oo }$ as $\( f_r \, t_r \)$, $r gt.eq 1$, and set $X_r^(\( j \)) =
  M_(t_r)^(\( j \)) \( f_r \)$. Each coordinate is bounded in $L^2$ by (4.4).
  A diagonal subsequence $j_l$ has a weak limit $X_r$ in every coordinate.

For each $k$, consider the first $k$ coordinates as a vector in $\( L^2 \)^k$.
  Its weak limit $\( X_1 \, dots.h \, X_k \)$ lies in the norm closure of the convex hull of every tail.
  Hence there are deterministic coefficients $c_(k l) gt.eq 0$, supported on finitely many $l gt.eq k$,
  with $sum_l c_(k l) = 1$, such that

$ sum_(r = 1)^k ∥sum_(l gt.eq k) c_(k l) X_r^(\( j_l \)) - X_r∥_2^2 lt.eq 4^(- k) . $

Define

$ overline(M)_t^(\( k \)) = sum_(l gt.eq k) c_(k l) M_t^(\( j_l \)) . $

For every listed pair, the summable squared errors give both $L^2$ and almost-sure convergence;
  intersecting the resulting events over $r$ gives simultaneous convergence on the whole countable list.
  The same coefficient row is used for every time and spatial test.

On this event, the cutoff tests bound all local masses. Density therefore extends convergence to every continuous
  compactly supported test. The limiting positive functionals are Radon measures,
  with almost-sure vague convergence at all listed times. Positivity and ordering in time pass to the limit.
  The limits at finite rational times are adapted, since the corresponding $L^2 \( cal(F)_t \)$ subspaces are
  closed. Convexity and Fatou’s Lemma preserve (4.4) for the terminal measure and continuous nonnegative tests.
  Approximation then gives the compact moment assertions.

We also obtain nonatomicity, which will be needed to pass from rational times to all times.
  For two points in a fixed larger compact the kernel in (4.4) is bounded by
  $C \( 1 + \| x - y \|^(- 2 alpha) \)$. Cover a given smaller compact by mesh squares of side $delta$,
  and majorize each square’s indicator by a continuous cutoff in a slightly enlarged square.
  The enlarged squares have bounded overlap. The expected sum of their squared masses is bounded by

$ C integral.double_(\| x - y \| lt.eq C delta) \( 1 + \| x - y \|^(- 2 alpha) \) thin #h(-0.16667em) upright(d)
  A \( x \) #h(-0.16667em) upright(d) A \( y \) \, $

where both variables lie in the larger compact. This tends to zero because $2 alpha < 2$.
  Every atom in the smaller compact contributes the square of its mass to the corresponding sum at every mesh
  size. Fatou’s Lemma, followed by a countable compact exhaustion, proves that $mu_oo$ has no atoms.

=== 4.2 Support, continuity, and stopping times <support-continuity-and-stopping-times>

The finite-level conditional weight identity of Lemma 2 gives, at a finite rational time $t$,

#[#set math.equation(numbering: n => "(4.5)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] M_oo^(\( j \)) \( #h(-0.16667em) upright(d) x \) -
   M_t^(\( j \)) \( #h(-0.16667em) upright(d) x \) divides cal(F)_t #scale(x: 120%, y: 120%)[\]] =
   G_t \( x \) upright(bold(1))_({ x in H_t \, med R_t \( x \) > R_0 \( x \) e^(- 2 a j) }) thin #h(-0.16667em)
   upright(d) A \( x \) . $ <mass:approx-kernel>]

The strict inequality excludes a level already attained at $t$.
  At every surviving point the indicator tends to one. Since $bb(E) G_t \( x \) lt.eq G_0 \( x \)$,
  dominated convergence on compact tests applies to the right side.
  Local $L^2$ bounds give uniform integrability on the left.
  Passing through the tail convex combinations proves (4.1) at rational times.
  The mean-one finite-level weights also give (4.2).

These identities initially hold for countably many deterministic tests.
  They identify the conditional measure kernel, and hence, by the Monotone Class Theorem,
  hold against every nonnegative $cal(F)_t ⊗ cal(B) \( bb(H) \)$-measurable test.
  In particular, testing the complement of the known surviving domain shows that

#[#set math.equation(numbering: n => "(4.6)")
 $ mu_oo - mu_t upright(" is carried by ") H_t quad upright("at every finite rational ") t \, $ <mass:future-support>]

on one event of probability one.

At the same times, $mu_t$ is carried by the past trace. Indeed, on a fixed compact,
  a point receiving mass in $M_t^(\( j \))$ has, at its level time,
  distance at most $R_0 \( x \) e^(- 2 a j)$ from the current domain boundary.
  For large $j$ that nearby boundary cannot be the real line, so it belongs to $gamma \( \[ 0 \, t \] \)$.
  Thus the approximants, and their tail convex combinations,
  are carried locally by shrinking neighborhoods of this closed trace segment.
  Vague convergence gives the claimed support. For rational $v < t$,
  the increment is dominated by $mu_t$ and by $mu_oo - mu_v$, so it is carried by $gamma \( \[ v \, t \] \) ∩ bb(H)$.

Take increasing rational left limits and decreasing rational right limits of the measure process.
  At any finite time $w$, their difference is dominated by increments over every rational interval containing $w$.
  Continuity of the trace forces its support to lie in the singleton ${ gamma \( w \) } ∩ bb(H)$.
  The difference vanishes by nonatomicity. At zero use zero as the left limit; the same argument gives zero,
  since $gamma \( 0 \) in.not bb(H)$. This argument is pathwise on the one event already constructed and therefore
  works simultaneously for every $w$. It defines an increasing process on all times,
  locally continuous in total variation: on a compact the variation of a positive increment is just its mass,
  and the possible one-sided jump measures have been shown to vanish.
  Adaptedness follows from the rational left limits. The support assertion for arbitrary intervals follows by
  enclosing them in rational intervals and taking limits.

The terminal value is exhausted by finite times. By Proposition 4, $bb(E) G_t \( x \) arrow.r 0$ as $t arrow.r
  oo$. Apply (4.1) at integer times and use $bb(E) G_t lt.eq G_0$ on compact tests.
  The nonnegative measure $mu_oo - lim_(t arrow.r oo) mu_t$ has zero mean, and hence is zero.
  This also gives local total-variation convergence at infinity.

For completeness, let $S$ be any stopping time. On the event of rational convergence,
  monotonicity squeezes $overline(M)_S^(\( k \)) \( f \)$ between its values at rational times approaching each
  realized finite $S$. Continuity gives convergence to $mu_S \( f \)$ for every nonnegative continuous compact
  test. On ${ S = oo }$ use terminal convergence of the extracted sequence.
  Uniform integrability again follows from the terminal $L^2$ bound.
  The finite-level identity (4.5) holds with $t$ replaced by $S$, and with zero right side on ${ S = oo }$.
  The bound $bb(E) \[ G_S \( x \) \; S < oo \] lt.eq G_0 \( x \)$ from Proposition 4 permits the same dominated
  convergence. This proves (4.1) at $S$, including its conditional-kernel interpretation, and completes Proposition 8.

#thm([Corollary 4.2.])[
  (First-visit accounting).  #emph[Put $v \( x \) = inf { t gt.eq 0 : gamma \( t \) = x }$,
    with value infinity if the set is empty. Almost surely $v \( x \) < oo$ for $mu_oo$-almost every $x$,
    and simultaneously for every finite $t$,
#[#set math.equation(numbering: n => "(4.7)")
 $ mu_t \( #h(-0.16667em) upright(d) x \) = upright(bold(1))_({ v \( x \) lt.eq t }) mu_oo \( #h(-0.16667em)
   upright(d) x \) . $ <mass:first-visit-identity>]

]
] <mass:first-visit>

#proof[
  At rational $t$, past mass is carried by $gamma \( \[ 0 \, t \] \)$,
    while remaining mass is carried by the open set $H_t$, disjoint from that past trace.
    This proves the identity there. Increasing finite times exhaust the terminal measure.
    Right approximation by rational times, continuity of the measure process and of the trace,
    then proves the identity at all times. In particular a later geometric return to an already visited point
    introduces no new mass there. ◻
]

=== 4.3 Versions, conformal maps, and restart <versions-conformal-maps-and-restart>

We have constructed the continuous mass and its conditional kernel.
  To use them at centered stops and in random future domains,
  we next fix a measurable path functional and establish equality of the actual restarted measures.

We fix one nonanticipating measurable version of this construction.
  On the canonical continuous-path space each $M^(\( j \))$, tested on an interior compact,
  is a raw adapted càdlàg process: its terminal density has a deterministic finite bound there,
  and one-sided continuity follows from dominated convergence of the hitting-time indicators.
  The same holds for every deterministic convex combination.
  At each finite time, take the vague limit of $overline(M)_t^(\( k \))$ where it exists,
  and use the zero measure otherwise. The space of locally finite positive Radon measures is Polish in the vague
  topology; its convergence set and limit map are therefore Borel.
  This defines a raw progressively measurable measure-valued functional.
  At infinity use the same limit rule for $overline(M)_oo^(\( k \))$.
  Rational squeezing as above shows that it agrees, simultaneously at every time under the ordinary Brownian law,
  with the continuous process just constructed.

All evaluations under a centered law use this raw functional of the stopped path.
  At each finite inner level the density in Lemma 2 transfers the required statements about that stopped piece.
  Consistent laws of the stopped pieces, and increasing limits of their coordinates, suffice thereafter.
  We do not extend the centered law to the original Brownian space completed by infinite-future null sets.
  This distinction also ensures parameter measurability: Loewner solutions,
  level times and conformal maps are measurable in the driver and marked point,
  and progressive evaluation of the fixed mass functional at those times is measurable.

For a fixed conformal identification $J : bb(H) arrow.r D$, define

#[#set math.equation(numbering: n => "(4.8)")
 $ mu_t^D = J_(*) #scale(x: 120%, y: 120%)[\(] \| J' \|^d mu_t #scale(x: 120%, y: 120%)[\)] . $ <mass:conformal>]

This rule holds exactly for the approximants: conformal radius contributes $\|
  J' \|^(- alpha)$ and area contributes $\| J' \|^2$, so their product is $\| J' \|^d$.
  Inner-clock ratios are unchanged. A compact continuous test in $D$ pulls back to such a test in $bb(H)$.
  Thus the same deterministic convex combinations converge in every fixed image domain,
  on the event giving convergence for all compact continuous tests.
  The kernel, local continuity, nonatomicity and support statements hold there with the corresponding $G_t^D$.
  More precisely, its increments are carried by $J \( gamma \( \[ v \, t \] \) ∩ bb(H) \)$.
  The map is applied only to interior trace points; an arbitrary $J$ need not extend continuously to the boundary.
  The construction is jointly measurable in a measurable family of maps $J$;
  it requires no new extraction for different maps.

The kernel also proves uniqueness. If $A_t$ and $tilde(A)_t$ are two continuous increasing adapted test-mass
  processes starting at zero, with integrable terminal values and the same remaining conditional potential, then

$ A_t - tilde(A)_t = bb(E) \[ A_oo - tilde(A)_oo divides cal(F)_t \] . $

Their difference is a continuous martingale of finite variation, hence vanishes.
  Applying this to a countable determining set of tests proves uniqueness of the measure process.
  In particular it removes dependence on the convex extraction. It also gives Brownian scaling:
  if $B_t^(\( c \)) = c^(- 1) B_(c^2 t)$, then, for each $c > 0$,

#[#set math.equation(numbering: n => "(4.9)")
 $ mu_t \( B^(\( c \)) \) \( A \) = c^(- d) mu_(c^2 t) \( B \) \( c A \) quad
   upright("almost surely, for all ") t upright(" and Borel ") A subset bb(H) . $ <mass:scaling>]

Indeed the scaled process has the same kernel, continuity and terminal integrability as the canonical process for
  $B^(\( c \))$.

For natural parametrization, Lawler–Rezaei #cite(label("LawlerRezaei2012Basic")) Proposition 3.13 prove conformal
  restart at an almost surely finite stopping time, simultaneously over later time intervals.
  We prove the following measure-valued identity for the mass constructed here directly from its conditional kernel.

#thm([Proposition 4.3.])[
  (Pathwise interior restart).  #emph[Fix a stopping time $S$.
    On ${ S < oo }$ put $J_S = \( g_S - B_S \)^(- 1) : bb(H) arrow.r H_S$,
    and let $tilde(mu)$ be the canonical mass functional of the fresh Brownian motion $B_(S + t) - B_S$.
    Almost surely, as measures on $H_S$, simultaneously for all $0 lt.eq t lt.eq oo$,
#[#set math.equation(numbering: n => "(4.10)")
 $ \( mu_(S + t) - mu_S \) \|_(H_S) = \( J_S \)_(*) #scale(x: 120%, y: 120%)[\(] \| J'_S \|^d tilde(mu)_t
   #scale(x: 120%, y: 120%)[\)] . $ <mass:restart-identity>]

 The same assertion holds when the initial domain is a fixed conformal image of $bb(H)$.
   Once this equality of measures has been obtained, one may integrate any random nonnegative Borel weight on the
   restart domain and evaluate at any later random time.]
] <mass:restart>

#proof[
  Write $nu_t$ for the right side of (4.10) on ${ S < oo }$,
    and set both processes in the comparison below to zero on ${ S = oo }$.
    Take a countable collection of rational balls $U subset.double bb(H)$,
    and dense countable families of nonnegative tests $phi.alt in C_c \( U \)$, including local cutoffs.
    Localize each comparison to
  $ E_U = { S < oo \, med overline(U) subset H_S } in cal(F)_S . $
  We first check terminal integrability, before invoking uniqueness.
    Conditioning on $cal(F)_S$, the strong Markov property, the canonical mean measure and change of variables give
  #[#set math.equation(numbering: n => "(4.11)")
   $ bb(E) \[ upright(bold(1))_(E_U) nu_oo \( phi.alt \) divides cal(F)_S \] =
     upright(bold(1))_(E_U) integral phi.alt \( x \) G_S \( x \) thin #h(-0.16667em) upright(d) A \( x \) .
     $ <mass:restart-integrability>]
  The pulled-back test is random, with potentially random derivative and support bounds.
    The formula remains valid: first use nonnegative simple functions of the restart data and source point,
    and then apply conditional Tonelli and monotone convergence.
    Its expectation is at most $integral phi.alt G_0 thin #h(-0.16667em) upright(d) A < oo$.
    Thus the candidate terminal test mass is integrable. The actual terminal increment is bounded by
    $mu_oo \( phi.alt \)$ and is integrable as well.
  At $S + t$, the candidate and actual increment have the same remaining conditional potential.
    For the candidate, this follows from the canonical kernel for the fresh driver,
    with its $cal(F)_S$-measurable pulled-back test; the Loewner composition rule and (4.8) transform that
    potential into $G_(S + t)$. For the actual process it is (4.1) at $S + t$. Consequently
  $ D_t := upright(bold(1))_(E_U) #scale(x: 120%, y: 120%)[\[] \( mu_(S + t) - mu_S \) \( phi.alt \) -
    nu_t \( phi.alt \) #scale(x: 120%, y: 120%)[\]] = bb(E) \[ D_oo divides cal(F)_(S + t) \] . $
  This continuous finite-variation martingale starts at zero and is identically zero.
    Intersect the resulting events over the countable balls and tests,
    and use continuity to obtain equality for all times. Those balls whose closures lie in the realized $H_S$
    cover it; their tests determine its locally finite measures.
    This proves the pathwise measure equality throughout the random domain.
  Only now do we integrate random weights. In particular, if $F : bb(D) arrow.r
    H_S$ is a random conformal map and $K subset.double bb(D)$, the Borel weight
  $ upright(bold(1))_(F \( K \)) \( x \) thin \| F' \( F^(- 1) \( x \) \) \|^(- d) $
  is bounded on its realized compact support. Its integration follows directly from equality of the realized
    measures, without a further exceptional event indexed by $F$ or $K$.
    The all-time equality similarly permits substitution of a later random time.
    Composition with a fixed initial identification proves the last domain assertion. ◻
]

To obtain the centered restart rule, first work under the ordinary law.
  For a stopping time $S$, work on ${ S < oo \, med z in H_S }$ and write $g_S \( z \) - B_S =
  lambda e^(i theta)$, where $lambda > 0$. Conditionally on $cal(F)_S$,
  the rescaled fresh driver $lambda^(- 1) \( B_(S + lambda^2 u) - B_S \)$ is standard Brownian motion.
  We may apply (4.9) at this random scale: after conditioning, $lambda$ is fixed,
  the fresh driver is independent of $cal(F)_S$, and the scaling equality holds almost surely at each fixed scale.
  Joint measurability of the mass functional permits this conditioning.
  Together with Proposition 10, scaling identifies the actual future mass in these coordinates.

Now apply the finite change of law through the next radius target of $z$.
  The ratio of Green weights is conformally invariant, since the derivative at the marked point cancels between
  the two weights. Lemma 2 therefore identifies, conditionally on the stopped past under the centered law,
  the future mass pulled back to a disk centered at $z$ with the canonical disk law of starting angle $theta$.
  This assertion uses only data through the finite test endpoint.

#thm([Proposition 4.4.])[
  (Positive mass on every interval).  #emph[Almost surely, for every $0 lt.eq v < t < oo$,
$ \( mu_t - mu_v \) \( bb(H) \) > 0 . $

 The positive mass can always be detected on an interior compact.
   The same statement holds in every fixed conformal image, in its associated half-plane time.]
] <mass:positive>

#proof[
  Equation (4.2) gives positive terminal expectation on a compact with nonempty interior.
    Terminal exhaustion therefore gives positive probability of positive interior mass by some finite
    deterministic time. Scaling shows that $bb(P) { mu_t \( bb(H) \) >
    0 }$ has the same positive value for every $t > 0$. The raw event $limsup_(n arrow.r oo) {
    mu_(1 \/ n) \( bb(H) \) > 0 }$ belongs to the Brownian germ sigma field.
    On the common event of monotonicity it equals $⋂_(n gt.eq 1) { mu_(1 \/ n) \( bb(H) \) > 0 }$,
    so has this same probability. The germ zero–one law makes it one.
    Hence positive mass is present before every positive time.
    Restart at each rational time and apply Proposition 10. The strictly positive conformal weight preserves
    positivity, giving positive increments on all rational intervals on one event.
    Every nontrivial real interval contains a nontrivial rational interval.
    A countable compact exhaustion detects the positive increment mass; (4.8) proves the image-domain assertion. ◻
]

== 5 Disk moments and deterministic coefficients <coef:section>

We now supply the deterministic numbers that select the gauge.
  First, the physical-domain multipoint estimate proves that one centered disk mass has positive finite moments.
  Then its conditional Green potential recovers those moments through an explicit sequence of integrals.
  The last subsection realizes the integrands by normal coordinates and ordinary differential equation limits.

=== 5.1 The centered disk model <the-centered-disk-model>

For $0 < theta < pi$, use the conformal identification $J_theta : bb(H) arrow.r bb(D)$ below.
  It takes $e^(i theta)$ to the marked center $0$. Denote the ordinary law in these coordinates by $bb(P)_theta$,
  and its centered finite-level laws at $0$ by $bb(P)_theta^(*)$.
  Average the latter over the invariant angle law $pi_a$, and write $bb(P)_(upright("mix"))^(*)$ for the resulting
  consistent stopped laws. Define

#[#set math.equation(numbering: n => "(5.1)")
 $ J_theta \( zeta \) = frac(zeta - e^(i theta), zeta - e^(- i theta)) \, wide K = { x in bb(D) : \| x \| lt.eq
   1 / 4 } \, wide bb(P)_(upright("mix"))^(*) = integral_0^pi bb(P)_theta^(*) thin pi_a \( #h(-0.16667em)
   upright(d) theta \) \,\
L_ell = mu_(tau_ell \( 0 \))^(bb(D)) \( K \) \, wide L = lim_(ell arrow.r oo) L_ell . $ <coef:disk-model>]

The disk mass is the weighted pushforward of the single canonical half-plane functional in Section 4.
  Each $L_ell$ is a raw finite-stopped-path quantity; its increasing limit is defined on the consistent collection
  of such quantities. In particular (5.1) does not require a Brownian continuation after the centered terminal time.

#thm([Proposition 5.1.])[
  (Finite, positive disk moments).  #emph[For every integer $n gt.eq 1$, the deterministic numbers
#[#set math.equation(numbering: n => "(5.2)")
 $ m_n \( ell \) := bb(E)_(upright("mix"))^(*) L_ell^n \, wide m_n := bb(E)_(upright("mix"))^(*) L^n =
   lim_(ell arrow.r oo) m_n \( ell \) quad upright("satisfy") quad 0 < m_n < oo . $ <coef:moments>]

 Moreover $L > 0$ almost surely, and, for each fixed angle,
#[#set math.equation(numbering: n => "(5.3)")
 $ sup_(ell > 0) bb(E)_theta^(*) L_ell^n lt.eq C_(n \, a) sin^(- p) theta . $ <coef:angle-moments>]

]
] <coef:positive-moments>

#proof[
  We apply the multipoint estimate directly in the physical disk.
    Its initial conformal radius is $R_0 \( x \) = 1 - \| x \|^2$, independently of $theta$.
    Choose a nonnegative continuous cutoff $f gt.eq upright(bold(1))_K$ supported in a fixed compact subdisk.
    Apply the center-hit bound of Corollary 7 with $m = n$, $x_0 = 0$, $e_0 = e^(- 2 a ell)$,
    and level weight $A_j \( f \) = M_oo^(\( j \) \, bb(D)) \( f \)$.
    The proof of that corollary includes $0$ as one extra fixed point in the multipoint estimate.
    Its caps and collision integrals can be chosen in the physical disk, where $K$, $"supp" f$,
    and the initial radii are independent of $theta$. Thus
  $ bb(E)_theta #h(-0.16667em)
    [upright(bold(1))_({ tau_ell \( 0 \) < oo }) #scale(x: 120%, y: 120%)[\(] M_oo^(\( j \) \, bb(D)) \( f \)
    #scale(x: 120%, y: 120%)[\)]^n] lt.eq C_(n \, a) e^(- 2 a alpha ell) \, $
  uniformly in $j \, ell \, theta$.
  There is no angle-dependent extraction in taking this limit.
    Every disk approximant is exactly the weighted pushforward of the half-plane approximant.
    Convergence of the fixed convex combinations holds for every compact continuous half-plane test,
    and therefore for the pullback of this $f$ under every fixed $J_theta$.
    Apply the displayed estimate before taking convex combinations; convexity and Fatou’s Lemma,
    with the center-hit event retained, yield
  #[#set math.equation(numbering: n => "(5.4)")
   $ bb(E)_theta #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ tau_ell \( 0 \) < oo }) mu_oo^(bb(D)) \( K \)^n
     #scale(x: 120%, y: 120%)[\]] lt.eq C_(n \, a) e^(- 2 a alpha ell) . $ <coef:ordinary-hit-moment>]
  Thus the uniform constant has not been obtained by transporting a half-plane estimate through maps that
    degenerate near endpoint angles.
  Since $R_0 \( 0 \) = 1$, the density at $tau_ell \( 0 \)$ is at most $e^(2 a alpha ell) sin^(- p)
    theta$ on the center-hit event. Also $mu_(tau_ell)^(bb(D)) \( K \) lt.eq
    mu_oo^(bb(D)) \( K \)$ under the ordinary law. The finite-level change of law and (5.4) prove (5.3).
    The bound is integrable against $pi_a$, because
  $ integral_0^pi sin^(- p) theta thin pi_a \( #h(-0.16667em) upright(d) theta \) =
    c_a integral_0^pi sin^(4 a - p) theta thin #h(-0.16667em) upright(d) theta =
    c_a integral_0^pi sin theta thin #h(-0.16667em) upright(d) theta < oo . $
  Monotone convergence gives finite moments of $L$ of every integer order.
  For positivity, choose a finite inner level with $e^(- 2 a ell) < 1 \/ 4$.
    Its attainment under the centered law is certain. At that time,
    the distance from $0$ to the surviving domain boundary is less than $1 \/ 4$.
    The nearby boundary cannot be part of the original unit circle,
    so the past trace has entered the interior of $K$. Continuity gives a nontrivial time interval,
    contained in this finite stopped piece, whose trace lies in the interior of $K$.
    The positive-increment assertion of Proposition 11 and the increment-support assertion of Proposition 8
    transfer to this stopped piece by its finite-level density. They give positive mass in $K$.
    Hence $L > 0$ almost surely, and $m_n > 0$. ◻
]

=== 5.2 A Wiener-integral formula <a-wiener-integral-formula>

We use the discrete potential compensator appearing in Lawler–Zhou #cite(label("LawlerZhou2013")) Theorem 1 and
  its proof. We prove its convergence at a random radius level and then combine it with the finite-level Green
  weight to specify the centered moments.

Let $W$ be standard Wiener measure on $C_0 \( \[ 0 \, oo \) \, bb(R) \)$.
  For a fixed $theta$ and driver $b$, solve the ordinary Loewner equation with numerator $a$,
  using $J_theta$ for the disk identification, and form

$ Psi_t \( theta \, b \) = integral_K G_t \( x \; theta \, b \) thin #h(-0.16667em) upright(d) A \( x \) \, wide
  tau_ell = tau_ell \( 0 \) \, wide P_ell \( theta \, b \) =
  upright(bold(1))_({ tau_ell < oo }) e^(2 a alpha ell) frac(sin^p theta_(tau_ell) \( 0 \), sin^p theta) . $

The last expression is zero on failure. For paths $b \, c$, let $b xor_t c$ agree with $b$ through time $t$,
  and equal $b \( t \) + c \( thin dot.op - t \)$ thereafter. Put

$ delta_h = 2^(- h) \, wide N_h = h 2^h \, wide t_i = i delta_h \, $

and define the potential differences and their stopped cumulative sum by

#[#set math.equation(numbering: n => "(5.5)")
 $ q_(h \, i) \( theta \, b \) & = Psi_(t_i) \( theta \, b \) -
   integral Psi_(t_(i + 1)) \( theta \, b xor_(t_i) c \) thin #h(-0.16667em) upright(d) W \( c \) \,\
D_h \( theta \, b \; ell \) & = sum_(i = 0)^(N_h - 1) upright(bold(1))_({ t_(i + 1) lt.eq tau_ell })
  q_(h \, i) \( theta \, b \) . $ <coef:increments>]

Set undefined differences to zero. For every fixed $theta$,
  these exceptions have Wiener measure zero by the compact first moment and the conditional kernel.
  All integrands are measurable in $theta$ and the paths. Write $\[ x \]_0^u = min { max { x \, 0 } \, u }$.

The next estimate explains why a potential formula recovers mass at a random endpoint.
  For fixed $theta$, write $A_t = mu_t^(bb(D)) \( K \)$ and interpret $A_(tau_ell)$ as $A_oo$ when $tau_ell = oo$.

#thm([Lemma 5.2.])[
  (Recovery at a random level).  #emph[For every fixed $theta in \( 0 \, pi \)$ and finite $ell > 0$,
$ D_h \( theta \, dot.op \; ell \) arrow.r A_(tau_ell) quad upright("in ") L^2 \( bb(P)_theta \) . $

]
] <coef:recovery>

#proof[
  The process $A_t$ is continuous, increasing, starts at zero,
    and has a finite terminal limit with $bb(E)_theta A_oo^2 < oo$. Equation (4.1) gives
  $ Psi_t = bb(E)_theta \[ A_oo - A_t divides cal(F)_t \] . $
  Independent Brownian continuation identifies the Wiener integral in (5.5) with its conditional expectation.
    The tower property therefore yields
  $ q_(h \, i) = bb(E)_theta \[ Delta_(h \, i) A divides cal(F)_(t_i) \] \, wide Delta_(h \, i) A =
    A_(t_(i + 1)) - A_(t_i) . $
  Put $C_(h \, j) = sum_(i < j) q_(h \, i)$. The grid process $A_(t_j) -
    C_(h \, j)$ is a square-integrable discrete martingale starting at zero.
    Its increments are centered conditional mass increments; their variances are bounded by the second moments of
    $Delta_(h \, i) A$. Orthogonality of its increments and the maximal inequality imply
  #[#set math.equation(numbering: n => "(5.6)")
   $ bb(E)_theta max_(j lt.eq N_h) \| C_(h \, j) - A_(t_j) \|^2 lt.eq
     4 bb(E)_theta sum_(i < N_h) \( Delta_(h \, i) A \)^2 arrow.r 0 . $ <coef:maximal-error>]
  To justify the limit despite the growing time horizon, set
  $ omega_A \( delta \) = sup_(s \, t gt.eq 0\
\| s - t \| lt.eq delta) \| A_t - A_s \| . $
  Continuity and the finite terminal limit give $omega_A \( delta \) arrow.r 0$ almost surely.
    One can first use uniform continuity on a fixed finite interval and then make the total variation of the
    remaining tail small. Moreover,
  $ sum_(i < N_h) \( Delta_(h \, i) A \)^2 lt.eq A_oo omega_A \( delta_h \) lt.eq A_oo^2 \, $
  so dominated convergence proves (5.6).
  Let $j_h = min { N_h \, floor.l tau_ell \/ delta_h floor.r }$, with $j_h = N_h$ if $tau_ell = oo$.
    Then $D_h = C_(h \, j_h)$. On a finite hit $t_(j_h) arrow.r tau_ell$; on failure $t_(j_h) = h arrow.r oo$.
    Thus $A_(t_(j_h)) arrow.r A_(tau_ell)$ in $L^2$, interpreting the latter as $A_oo$ on failure.
    The maximum in (5.6) controls every selected index, so
  $ D_h \( theta \, b \; ell \) arrow.r A_(tau_ell) quad upright("in ") L^2 \( bb(P)_theta \) . $
  No predictability or stopping-time property of $j_h$ is used. ◻
]

#thm([Proposition 5.3.])[
  (Explicit coefficients).  #emph[The moments in (5.2) are given by
#[#set math.equation(numbering: n => "(5.7)")
 $ m_n \( ell \) & = lim_(u arrow.r oo) lim_(h arrow.r oo) integral_0^pi integral P_ell \( theta \, b \)
   #scale(x: 120%, y: 120%)[\(] \[ D_h \( theta \, b \; ell \) \]_0^u #scale(x: 120%, y: 120%)[\)]^n thin
   #h(-0.16667em) upright(d) W \( b \) thin pi_a \( #h(-0.16667em) upright(d) theta \) \,\
m_n & = lim_(ell arrow.r oo) m_n \( ell \) . $ <coef:formula>]

 All limit indices may be restricted to positive integers.
   Thus these coefficients depend only on $kappa$ and the specified Gaussian, angle and area integrals.]
] <coef:explicit>

#proof[
  Fix $theta \, ell \, u$. The function $f_u \( x \) = \( \[ x \]_0^u \)^n$ is bounded and continuous.
    Lemma 13 gives $f_u \( D_h \) arrow.r f_u \( A_(tau_ell) \)$ in probability.
    This convergence passes through the fixed integrable density $P_ell$:
    truncate this density at a constant $R$, use bounded convergence in probability there, and then let $R arrow.r
    oo$. Since $integral P_ell thin #h(-0.16667em) upright(d) W = 1$ for each fixed angle,
    the resulting truncated Wiener integrals are bounded by $u^n$.
    Dominated convergence therefore permits the angle average, without a convergence estimate uniform in $theta$.
    The finite-level change of law identifies the limit as $bb(E)_(upright("mix"))^(*) \( \[ L_ell \]_0^u \)^n$.
    Finally, monotone convergence in $u$ and then in $ell$ proves (5.7). ◻
]

=== 5.3 A prescription using only normal coordinates and ODE limits <a-prescription-using-only-normal-coordinates-and-ode-limits>

The Wiener integrals in (5.7) are deterministic integrals.
  The following construction specifies their integrands without using a sample of the trace in Theorem 1.
  They can be realized as countable product standard-normal integrals:
  choose each unit increment of $b$ as an independent standard normal,
  and recursively set the midpoint of a dyadic interval of length $2^(- k)$ equal to the average of its endpoint
  values plus $2^(- k \/ 2 - 1)$ times a new independent standard normal.
  The polygonal interpolants converge uniformly on compacts almost surely.
  Indeed Gaussian tails and Borel–Cantelli bound the largest level-$k$ normal on finitely many unit intervals by
  $O \( sqrt(k + 1) \)$, and $sum_k 2^(- k \/ 2) sqrt(k + 1) < oo$.
  The limit has Gaussian covariance $min { s \, t }$ and hence Wiener law.
  Use the zero path on the null exceptional set.

The Loewner quantities in the integrands do not require constructing the trace.
  For $zeta = J_theta^(- 1) \( x \)$ and an integer $j gt.eq 1$, use the truncated vector field

$ F_j \( t \, z \) = frac(a thin overline(z - b \( t \)), max { \| z - b \( t \) \|^2 \, j^(- 4) }) . $

Starting at $zeta$, perform the Euler iteration $g_(k + 1) = g_k +
  2^(- N) F_j \( k 2^(- N) \, g_k \)$ and interpolate linearly.
  For fixed $j$, its compact-uniform limit $g^(\( j \))$ exists as $N arrow.r oo$:
  the vector field is bounded, continuous in time, and globally Lipschitz in its state variable.
  A given finite time $t$ is surviving exactly when some $j$ satisfies

$ min_(0 lt.eq u lt.eq t) "Im" g_u^(\( j \)) > j^(- 1) . $

For such a witness, $\| g^(\( j \)) - b \|^2 > j^(- 2) gt.eq j^(- 4)$,
  so the cutoff is inactive and uniqueness gives the genuine Loewner solution on $\[ 0 \, t \]$.
  Conversely, a surviving solution on this compact interval has positive minimum imaginary part,
  and a sufficiently large $j$ recovers it.

On survival use this solution to compute

$ s_x \( t \) & = integral_0^t frac(\( "Im" g_u \)^2, \| g_u - b \( u \) \|^4) thin #h(-0.16667em) upright(d) u \,\
R_t \( x \) & = 2 "Im" zeta thin \| J'_theta \( zeta \) \| e^(- 2 a s_x \( t \)) \,\
G_t \( x \) & = R_t \( x \)^(- alpha) sin^p arg \( g_t - b \( t \) \) \, $

and put $G_t \( x \) = 0$ off survival. At the marked center the level time is

$ tau_ell = inf { q in bb(Q)_(> 0) : q upright(" is surviving and ") s_0 \( q \) > ell } \, wide inf diameter = oo . $

Continuity and strict increase of the clock on its open lifetime identify this infimum with attainment of level
  $ell$ while alive. These rational tests, deterministic limits and integrals specify every integrand in (5.7).
  This is an infinite-limit prescription; no finite computational error bound is asserted.
  The coefficients retain neither an unspecified normalization of trace mass nor a choice of convex extraction.

== 6 Moment batches and their full gauge <gauge:section>

We now turn the positive finite moments into a deterministic gauge.
  Each finite batch must balance two requirements: moderately large masses should provide many chances for a
  successful test, whereas exceeding a larger multiple of the threshold should have summable probability.
  Deterministic repetitions of dyadic thresholds achieve both.

Write $bb(P)_(upright("mix"))^(*)$ for the law of the disk model in Equation (5.1),
  with initial angle distributed according to $pi_a$, and write $bb(E)_(upright("mix"))^(*)$ for its expectation.
  We use the increasing masses $L_ell arrow.t L$ and their moments $m_n \( ell \) \, m_n$ from Equation (5.2).
  All the numbers below are deterministic: the moments are specified by the explicit integrals in Equation (5.7).

=== 6.1 The finite lists and their radii <the-finite-lists-and-their-radii>

For integers $n gt.eq 1$ and $k in bb(Z)$, put

#[#set math.equation(numbering: n => "(6.1)")
 $ ell_n = 1 + sum_(j = 1)^oo upright(bold(1))_({ m_n \( j \) lt.eq 3 m_n \/ 4 }) \, wide A_k = 2^k \, wide T_n =
   frac(4 m_(n + 1), m_n) . $ <gauge:coefficients>]

The sum is finite, and $m_n \( ell_n \) > 3 m_n \/ 4$, since $m_n \( j \) arrow.t m_n in \( 0 \, oo \)$.
  Form a list, in increasing order of $k$, containing $A_k$ with multiplicity

#[#set math.equation(numbering: n => "(6.2)")
 $ N_(n k) = upright(bold(1))_({ 2^k lt.eq T_n }) ⌊frac(4^n 2^(k n), m_n)⌋ . $ <gauge:batch>]

Append the number $n$ once, as the final #emph[cleanup entry], and denote the resulting entries by $b_(n i)$,
  $1 lt.eq i lt.eq I_n$. This list is finite. Indeed, $N_(n k) > 0$ implies

$ m_n^(1 \/ n) / 4 lt.eq A_k lt.eq T_n \, $

and Jensen’s Inequality gives $m_n^(1 \/ n) gt.eq m_1 > 0$.
  Thus $c_0 := min { 1 \, m_1 \/ 4 }$ is a positive lower bound for every entry $b_(n i)$.

Assign the radii

#[#set math.equation(numbering: n => "(6.3)")
 $ r_(n i) = exp { - n^2 - 2 a \( i - 1 \) \( ell_n + n \) } \, wide 1 lt.eq i lt.eq I_n \, $ <gauge:radii>]

and define

#[#set math.equation(numbering: n => "(6.4)")
 $ #box(stroke: black, inset: 3pt, [$ quad h_kappa \( r \) = inf_(n gt.eq 1\
1 lt.eq i lt.eq I_n) b_(n i) r_(n i)^(thin d) max { 1 \, \( r \/ r_(n i) \)^2 } quad \( r > 0 \) \, wide
  h_kappa \( 0 \) = 0 . quad $]) $ <gauge:definition>]

The infimum includes every entry of every batch.

The quadratic envelope has a planar covering antecedent in Peres–Solomyak #cite(label("PeresSolomyak2005"))
  Lemma 1.2 and Section 5. Indeed, for $0 < s lt.eq e^(- 1)$ put $phi.alt \( s \) =
  inf_(r_(n i) gt.eq s) b_(n i) r_(n i)^d$. Exchanging infima gives

$ h_kappa \( s \) = inf_(0 < r lt.eq s) \( s \/ r \)^2 phi.alt \( r \) \, $

which is their quadratic regularization of this step profile.
  The batch data, nondegeneracy of the envelope, and control after finite exclusions are established here;
  in particular, positivity is proved directly rather than inferred for an arbitrary input profile.

=== 6.2 Admissibility and restoration of early entries <admissibility-and-restoration-of-early-entries>

The envelope must remain positive at every positive diameter and tend to zero at the origin.
  Its behavior after a finite set of entries is excluded will also be needed in the lower-cover proof.

#thm([Proposition 6.1.])[
  (Gauge properties and finite exclusions).  #emph[The function $h_kappa$ is a Hausdorff gauge and satisfies
#[#set math.equation(numbering: n => "(6.5)")
 $ h_kappa \( C r \) lt.eq C^2 h_kappa \( r \) wide \( C gt.eq 1 \, med r gt.eq 0 \) . $ <gauge:doubling>]

 The radii from distinct batches may interleave. Set
$ H_(n i) \( r \) = b_(n i) r_(n i)^(thin d) max { 1 \, \( r \/ r_(n i) \)^2 } . $

 If $0 lt.eq F \( r \) lt.eq M < oo$ and $F \( r \) lt.eq C H_(n i) \( r \)$ for every $n gt.eq n_0$,
   every $1 lt.eq i lt.eq I_n$, and every $r > 0$, then $F \( r \) lt.eq C' h_kappa \( r \)$ for all $r > 0$,
   for some finite $C'$.]
] <gauge:admissible>

#proof[
  There are only finitely many entries with $r_(n i) gt.eq epsilon$ for each $epsilon > 0$, since $r_(n i) lt.eq
    e^(- n^2)$ and every batch is finite. For a fixed $r > 0$, entries with $r_(n i) < r$ satisfy
  $ H_(n i) \( r \) gt.eq c_0 r^2 r_(n i)^(d - 2) arrow.r oo wide upright("as ") r_(n i) arrow.r 0 \, $
  because $d < 2$. Comparing with any one entry reduces the infimum to finitely many positive terms.
    Hence $0 < h_kappa \( r \) < oo$.
  Each $H_(n i)$ is nondecreasing and satisfies $H_(n i) \( C r \) lt.eq C^2 H_(n i) \( r \)$.
    Taking infima proves monotonicity and Equation (6.5). In particular, for $0 < s < r$,
  $ \( s \/ r \)^2 h_kappa \( r \) lt.eq h_kappa \( s \) lt.eq h_kappa \( r \) \, $
  which gives continuity on $\( 0 \, oo \)$. At the cleanup radius $rho_n = r_(n I_n)$,
  $ h_kappa \( rho_n \) lt.eq n rho_n^d lt.eq n e^(- d n^2) arrow.r 0 . $
  Since $rho_n arrow.r 0$, monotonicity gives continuity at zero.
  For the last assertion the discarded entries, those with $n < n_0$, are a finite set, and $H_(n i) \( r \) gt.eq
    b_(n i) r_(n i)^d > 0$. Thus one may take
  $ C' = max {C \, max_(1 lt.eq n < n_0\
1 lt.eq i lt.eq I_n) frac(M, b_(n i) r_(n i)^d)} \, $
  omitting the inner maximum if its index set is empty. Then $F \( r \) lt.eq
    C' H_(n i) \( r \)$ holds for every entry, and taking the full infimum proves the claim.
    No ordering between batches is used. ◻
]

=== 6.3 The opposing probability estimates <the-opposing-probability-estimates>

The multiplicities supply the two bounds advertised at the start of this section.
  These are estimates under the one mixed disk law; the conditional tests along the curve are constructed in Section 8.

#thm([Lemma 6.2.])[
  (Batch probability estimates).  #emph[The non-cleanup multiplicities satisfy, for every $n gt.eq 1$,
#[#set math.equation(numbering: n => "(6.6)")
 $ sum_(k in bb(Z)) N_(n k) thin bb(P)_(upright("mix"))^(*) { L gt.eq 16 A_k } lt.eq
   frac(4^n 16^(- n), 1 - 2^(- n)) . $ <gauge:upper-tail>]

 For $n gt.eq 3$, they also satisfy
#[#set math.equation(numbering: n => "(6.7)")
 $ sum_(k in bb(Z)) N_(n k) thin bb(P)_(upright("mix"))^(*) { L_(ell_n) gt.eq A_k } gt.eq 2^(n - 2) -
   frac(1, 2 \( 1 - 2^(- n) \)) gt.eq 2^n / 8 . $ <gauge:success>]

 Including the cleanup entries,
#[#set math.equation(numbering: n => "(6.8)")
 $ sum_(n gt.eq 1) sum_(i = 1)^(I_n) bb(P)_(upright("mix"))^(*) { L gt.eq
   16 b_(n i) } < oo . $ <gauge:tail-summability>]

]
] <gauge:multiplicity>

#proof[
  For $x gt.eq 0$, the geometric sum gives
  $ sum_(k : thin 2^k lt.eq x) 2^(k n) lt.eq frac(x^n, 1 - 2^(- n)) . $
  Discarding the cutoff and the floors in Equation (6.2), then applying this inequality with $x =
    L \/ 16$ and taking expectations, proves Equation (6.6).
  For the lower bound put $Y = L_(ell_n)$. Since $Y lt.eq L$,
  $ bb(E)_(upright("mix"))^(*) \[ Y^n \; Y > T_n \] lt.eq frac(bb(E)_(upright("mix"))^(*) \[ Y^(n + 1) \], T_n)
    lt.eq m_n / 4 \, wide bb(E)_(upright("mix"))^(*) \[ Y^n \; Y lt.eq T_n \] gt.eq m_n / 2 . $
  Write $w_k = 4^n A_k^n \/ m_n$. Whenever $0 < Y lt.eq T_n$, some dyadic level satisfies $Y \/ 2 < A_k lt.eq Y$;
    it is allowed by the cutoff, and its weight is at least $2^n Y^n \/ m_n$. Consequently
  $ bb(E)_(upright("mix"))^(*) [sum_(k : thin A_k lt.eq T_n) w_k upright(bold(1))_({ Y gt.eq A_k })] gt.eq 2^(n - 1) . $
  The weights with $w_k < 1$ have total at most $\( 1 - 2^(- n) \)^(- 1)$, by another geometric sum.
    For the other weights, $floor.l w_k floor.r gt.eq w_k \/ 2$.
    Subtracting the former weights and halving therefore gives
  $ sum_k N_(n k) bb(P)_(upright("mix"))^(*) { Y gt.eq A_k } gt.eq 2^(n - 2) - frac(1, 2 \( 1 - 2^(- n) \)) . $
  For $n gt.eq 3$, the subtracted term is at most $4 \/ 7 lt.eq 2^(n - 3)$, which proves Equation (6.7).
    Finally, Tonelli’s Theorem gives
  $ sum_(n gt.eq 1) bb(P)_(upright("mix"))^(*) { L gt.eq 16 n } =
    bb(E)_(upright("mix"))^(*) #h(-0.16667em) [⌊L / 16⌋] lt.eq m_1 / 16 . $
  Together with the summable bounds in Equation (6.6), this proves Equation (6.8). ◻
]

== 7 Past mass and the arbitrary-cover lower bound <hd:section>

We now compare the gauge with the actual mass of small pieces of the trace.
  The lower bound uses mass accumulated before a first visit.
  Section 8 will use successive finite tests for the complementary upper bound.
  Throughout this section, $Gamma = gamma \( \[ 0 \, oo \) \)$, and $h =
  h_kappa$ is the full infimum in Equation (6.4). The notation $bb(P)_(upright("mix"))^(*)$ continues to mean the
  tilted disk law with initial angle distributed according to $pi_a$.

=== 7.1 A spatial comparison at a stopped restart <hd:spatial>

Fix the numerical constants

#[#set math.equation(numbering: n => "(7.1)")
 $ B_(*) = 100 \, wide C_(*) = 200 \, wide c_(*) = 192 / 5 \, wide C'_(*) = 8000 / 27 . $ <hd:koebe-constants>]

For $z in bb(H)$ and $100 r < R_0 \( z \) = 2 "Im" z$, let $S$ be the first time that $R_S \( z \) =
  100 r$ while $z$ remains alive. On ${ S < oo }$, choose a disk map $F : bb(D) arrow.r H_S$ with $F \( 0 \) = z$,
  normalized so that the restarted half-plane coordinate at $z$, after positive rescaling,
  is $e^(i theta_S \( z \))$. Thus the disk has exactly the markings of Equation (5.1), and $\| F' \( 0 \) \| =
  100 r$. For $K = { \| w \| lt.eq 1 \/ 4 }$, the growth and distortion estimates give

#[#set math.equation(numbering: n => "(7.2)")
 $ overline(B) \( z \, 16 r \) & subset F \( K \) subset overline(B) (z \, 400 / 9 r) subset
   overline(B) \( z \, C_(*) r \) \,\
c_(*) r & lt.eq \| F' \( w \) \| lt.eq C'_(*) r wide \( w in K \) . $ <hd:koebe-sets>]

Indeed the inner and outer growth bounds are $100 r \( 1 \/ 4 \) \/ \( 1 plus.minus 1 \/ 4 \)^2$,
  and the derivative bounds are $100 r \( 1 - 1 \/ 4 \) \/ \( 1 + 1 \/ 4 \)^3$ and $100
  r \( 1 + 1 \/ 4 \) \/ \( 1 - 1 \/ 4 \)^3$. In particular,
  $F \( K \)$ contains every closed grid square of side $r$ containing $z$.

Since $F \( K \)$ is compactly contained in $H_S$, its accumulated mass at time $S$ is zero.
  Proposition 10 identifies the actual subsequent measure there, simultaneously at all later times,
  with the pushforward of the disk measure weighted by $\| F' \|^d$.
  Consequently, if $T$ is the time of an additional inner-clock increment $0 < ell < oo$ at $z$, then,
  on ${ S < T < oo }$,

#[#set math.equation(numbering: n => "(7.3)")
 $ \( c_(*) r \)^d L_ell med lt.eq med \( mu_T - mu_S \) \( F \( K \) \) med lt.eq
   med \( C'_(*) r \)^d L_ell $ <hd:spatial-comparison>]

in these restarted coordinates. The event that this test endpoint is reached has probability one under the
  corresponding finite centered law. Conditional on the stopped past under $bb(P)_z^(*)$,
  the variable on the right is the disk-model variable with initial angle $theta_S \( z \)$.
  This is an equality of actual measures before applying distortion,
  so it also permits random Borel sets and random derivative weights. The clock increment is exactly $ell$:
  the derivative at $z$ cancels from ratios of conformal radii.

All uses of Equation (7.3) under a centered law are first made on a finite stopped piece,
  using the raw mass functional of Proposition 8. For example, if $q < T^(*) =
  lim_(ell arrow.r oo) tau_ell \( z \)$, some finite stopped piece extends beyond $q$.
  Monotonicity therefore bounds the mass accumulated in $F \( K \)$ before $q$ by $\( C'_(*) r \)^d L$,
  with $L$ the increasing limit in the restarted disk model. No mass after $T^(*)$ is used.

=== 7.2 Past mass and first visits <hd:palm-section>

The relation between natural-length-biased chordal SLE and integrated Green-weighted two-sided radial laws was
  proved by Field #cite(label("Field2016")) Theorem 1 for $0 < kappa lt.eq
  4$ in bounded domains with analytic boundary, and by Zhan #cite(label("Zhan2019Decomposition")) Theorem 4.1 for
  $0 < kappa < 8$. Zhan’s proof connects mass strictly after an observation time to centered stopped laws through
  the conditional remaining Green potential #cite(label("Zhan2019Decomposition")) Proposition 2.2, equation (2.1),
  and equations (4.3)–(4.5). We use this mechanism to derive the required past-mass identity directly for our
  canonical mass, from its conditional measure kernel and finite stopped changes of law.
  Retaining the strict time inequality keeps each centered-law mass evaluation before its terminal time.

Let $Q subset.double bb(H)$ be a deterministic closed square and let $H > 0$.
  Write $M_q = mu_q \( Q \)$, and let $v \( z \)$ denote the first visit time of $z$.
  We shall use the following identity:

#[#set math.equation(numbering: n => "(7.4)")
 $ & bb(E) integral_Q upright(bold(1))_({ exists q in bb(Q)_(gt.eq 0) : med q < v \( z \) \, med M_q > H }) thin
   mu_oo \( #h(-0.16667em) upright(d) z \)\
 & #h(12mm)  = integral_Q G_0 \( z \) thin bb(P)_z^(*) { exists q in bb(Q)_(gt.eq 0) : med q < T^(*) \, med
   M_q > H } thin #h(-0.16667em) upright(d) A \( z \) . $ <hd:palm>]

The strict inequality $q < T^(*)$ is part of the statement.
  Here is a derivation that also specifies the measurable kernel on its right-hand side.

First take a finite set of rational times $q_1 < dots.h.c < q_N$, and set

$ A_j = { M_(q_j) > H \, med M_(q_k) lt.eq H upright(" for ") k < j } . $

Each $A_j$ belongs to $cal(F)_(q_j)$ and does not depend on the integration point $z$.
  If a successful test in this finite set precedes $v \( z \)$,
  its first successful test also precedes $v \( z \)$. The first-visit identity in Corollary 9 thus identifies the
  corresponding random mass with

$ sum_(j = 1)^N upright(bold(1))_(A_j) \( mu_oo - mu_(q_j) \) \( Q \) . $

Apply Equation (4.1) with the event $A_j$, followed by the past-test identity in Proposition 4. The expectation becomes

$ integral_Q G_0 \( z \) sum_(j = 1)^N bb(P)_z^(*) \( A_j \, med q_j < T^(*) \) thin #h(-0.16667em) upright(d)
  A \( z \) . $

These events are disjoint. If a later successful test occurs before $T^(*)$, then the first successful test does too.

For completeness, for a fixed $A in cal(F)_q$ the term just used has the measurable version

#[#set math.equation(numbering: n => "(7.5)")
 $ bb(P)_z^(*) \( A \, q < T^(*) \) = lim_(ell arrow.r oo) frac(1, G_0 \( z \)) bb(E) #h(-0.16667em)
   [upright(bold(1))_A G_q \( z \) upright(bold(1))_({ z in H_q \, med s_z \( q \) < ell })] . $ <hd:palm-kernel>]

At a finite level the expectation also equals
  $bb(E) \[ upright(bold(1))_A upright(bold(1))_({ q < tau_ell \( z \) < oo }) G_(tau_ell \( z \)) \( z \) \]$.
  This is a stopped-past test of the finite tilted law. The raw mass functional is fixed once,
  and the Loewner quantities are jointly measurable in $z$ and the driving path.
  Thus Equation (7.5) is a measurable function of $z$, and Tonelli’s Theorem applies without a common exceptional
  set for uncountably many marked points. Finally, exhaust $bb(Q)_(gt.eq 0)$ by increasing finite sets,
  sorting each set before making the first-success selection.
  The existence events increase even though their finite partitions change. Monotone convergence proves Equation (7.4).

#thm([Lemma 7.1.])[
  (Summable mass of bad cells).  #emph[Fix a compact set $E subset.double bb(H)$. Set
$ D = 16 \( C'_(*) \)^d . $

 For an entry $\( n \, i \)$, write $r = r_(n i)$, $b = b_(n i)$, and use the square grid of side $r$.
   Call a cell $Q$ bad when $mu_oo \( Q \) > 2 D b r^d$. For every sufficiently large $n$,
   uniformly over all its entries and all cells meeting $E$,
#[#set math.equation(numbering: n => "(7.6)")
 $ bb(E) \[ mu_oo \( Q \) \; med Q upright(" bad") \] lt.eq
   4 (integral_Q G_0 \( z \) thin #h(-0.16667em) upright(d) A \( z \))
   bb(P)_(upright("mix"))^(*) \( L gt.eq 16 b \) . $ <hd:bad-mass>]

 Moreover, almost surely, $mu_oo$-almost every point of $E$ belongs to no bad cell for any entry of any
   sufficiently late batch.]
] <hd:bad-cells>

#proof[
  All cells in question lie in a fixed larger compact subset of $bb(H)$ for sufficiently large $n$.
    Take $H = D b r^d$ in Equation (7.4). Continuity of the increasing process $q mapsto
    mu_q \( Q \)$ and the first-visit identity show that, when $mu_oo \( Q \) > 2 H$,
    at least half the terminal mass of $Q$ arrives after the accumulated mass has exceeded $H$.
    More explicitly, if its terminal value is $M > H$, the mass detected by the existence event on the left of
    Equation (7.4) is $M - H$: rational times detect strict crossings,
    and continuity lets the accumulated mass at such crossings decrease to $H$.
    It follows that the left side of Equation (7.6) is at most twice the left side of Equation (7.4).
  For $z in Q$, restart at conformal radius $100 r$. Equation (7.2) gives $Q subset F \( K \)$.
    There is no mass in $Q$ before the restart, and the spatial comparison gives
  $ mu_q \( Q \) lt.eq \( C'_(*) r \)^d L wide \( q < T^(*) \) $
  in the restarted model. The time before the restart in the inner clock is
  $ frac(1, 2 a) log frac(R_0 \( z \), 100 r) . $
  Since $r_(n i) lt.eq e^(- n^2)$, this tends uniformly to infinity for all the relevant $z$ and entries as $n$
    increases. Lemma 3 therefore bounds the restart-angle law by $2 pi_a$.
    The event in the right side of Equation (7.4) has probability at most $2
    bb(P)_(upright("mix"))^(*) \( L gt.eq 16 b \)$. Together with the first factor of two this proves Equation (7.6).
  The countable collection of grid lines has zero terminal mass almost surely,
    by $bb(E) mu_oo \( #h(-0.16667em) upright(d) z \) = G_0 \( z \) #h(-0.16667em) upright(d) A \( z \)$.
    Consequently boundaries do not affect sums over closed cells.
    The integrals over cells meeting $E$ are bounded by the integral of $G_0$ over a fixed larger compact.
    Summing Equation (7.6) over every non-cleanup entry, including all repetitions,
    is summable in $n$ by Lemma 16. The cleanup entries are summable as well, since
  #[#set math.equation(numbering: n => "(7.7)")
   $ sum_(n = 1)^oo bb(P)_(upright("mix"))^(*) \( L gt.eq 16 n \) = bb(E)_(upright("mix"))^(*) ⌊L / 16⌋ lt.eq
     m_1 / 16 . $ <hd:cleanup-tail>]
  Thus the expected integral, against $mu_oo \|_E$, of the number of bad-cell memberships in this entire countable
    family is finite. Tonelli’s Theorem implies that this number is finite at $mu_oo$-almost every point,
    almost surely. Each batch is finite, so every such point has an eventual batch cutoff as asserted. ◻
]

#thm([Proposition 7.2.])[
  (The lower Hausdorff bound).  #emph[Almost surely,
$ cal(H)^h \( gamma \( \[ s \, t \] \) \) > 0 wide upright("for every real ") 0 < s < t < oo . $

]
] <hd:lower>

#proof[
  Apply Lemma 17 on a countable compact exhaustion of $bb(H)$,
    and work on the resulting probability-one event together with the conclusions about the mass in Propositions 8
    and 11. Fix a nontrivial interval $\[ u \, v \]$ with rational endpoints, $0 < u < v$.
    The increment $mu_v - mu_u$ has positive mass on some compact $E subset.double bb(H)$ in this exhaustion,
    and that mass is finite. For each $N$, let $S_N$ be $E$ minus the union of all bad cells for entries
    $\( n \, i \)$ with $n gt.eq N$. The countable cell families make $S_N$ Borel, and $S_N$ increases with $N$.
    Lemma 17 says that their union carries the increment on $E$.
    Choose $n_0$ with $\( mu_v - mu_u \) \( S_(n_0) \) > 0$, and set $nu = \( mu_v - mu_u \) \|_(S_(n_0))$.
    This is a finite nonatomic measure, carried by $gamma \( \[ u \, v \] \)$, with $0 < nu \( bb(H) \) < oo$.
  For every entry $\( n \, i \)$ with $n gt.eq n_0$, every grid cell has
  $ nu \( Q \) lt.eq 2 D b_(n i) r_(n i)^d . $
  A bad cell has zero $nu$-mass by the restriction, a good cell has the displayed bound for $mu_oo$,
    and a cell disjoint from $E$ has no $nu$-mass. A set $U$ of diameter $s > 0$ meets at most $16 max {
    1 \, \( s \/ r_(n i) \)^2 }$ cells of this grid: each coordinate projection has length at most $s$,
    and it meets at most $s \/ r_(n i) + 2$ grid intervals. Hence its outer measure satisfies
  #[#set math.equation(numbering: n => "(7.8)")
   $ nu^(*) \( U \) lt.eq 32 D b_(n i) r_(n i)^d max { 1 \, \( s \/ r_(n i) \)^2 } wide \( n gt.eq n_0 \) .
     $ <hd:retained-density>]
  To pass to the full gauge, apply the finite-exclusion assertion of Proposition 15 to $F \( s \) =
    sup_("diam" U lt.eq s) nu^(*) \( U \)$, bounded by $nu \( bb(H) \)$. The constant supplied by that proposition is
  $ C_nu = max {32 D \, med max_(n < n_0\
1 lt.eq i lt.eq I_n) frac(nu \( bb(H) \), b_(n i) r_(n i)^d)} \, $
  where the maximum over an empty set is zero. It bounds $F$ by every quadratic expression,
    including all the finitely many excluded entries. Taking the full infimum therefore gives
  #[#set math.equation(numbering: n => "(7.9)")
   $ nu^(*) \( U \) lt.eq C_nu h \( "diam" U \) . $ <hd:full-density>]
  This also holds for sets of diameter zero by nonatomicity.
    The argument uses finiteness of the excluded set, and does not order its radii relative to those of later batches.
  For any countable cover ${ U_j }$ of $gamma \( \[ u \, v \] \)$, outer-measure subadditivity and Equation (7.9) give
  $ 0 < nu \( bb(H) \) lt.eq C_nu sum_j h \( "diam" U_j \) . $
  Taking the infimum over covers with any diameter cutoff proves $cal(H)^h \( gamma \( \[ u \, v \] \) \) gt.eq
    nu \( bb(H) \) \/ C_nu > 0$. There are only countably many rational intervals.
    Every real $0 < s < t$ contains a nontrivial rational closed subinterval,
    so monotonicity of Hausdorff measure proves the simultaneous claim. ◻
]

== 8 All-time upper covers and theorem assembly <hd:cover-section>

We now construct finite covers of the whole trace in each bounded box. The two charges are different:
  disjoint successful balls are paid for by the same actual terminal mass,
  while missed cells are paid for by the cleanup entry. The finite changes of law estimate adapted test failures;
  the cover itself is selected afterward.

The use of regions with large trace mass together with a finer residual cover already appears in Rezaei
  #cite(label("Rezaei2018")) Section 3, equations (9)–(11);
  see also the conditional covering sketch in #cite(label("Zhan2019Optimal")) Remark 4.5.
  Here the all-moment batches choose the thresholds and scales,
  and finite adapted tests give the conditional failure bound.
  We then account for every missed cell, including cells near the real boundary.

We include cells meeting the real axis. Their centers will always lie strictly in $bb(H)$,
  even though the cells themselves may contain boundary points.

#thm([Lemma 8.1.])[
  (A cell visit forces a conformal-radius crossing).  #emph[Let $Q$ be a closed square of side $r$,
    centered at $z = x + i y$, where $y > 0$. If $y > 4 r$ and $Q ∩ Gamma eq.not diameter$,
    then $z$ reaches conformal radius $8 r$ while alive. For every $r > 0$ and $y > 0$,
#[#set math.equation(numbering: n => "(8.1)")
 $ bb(P) \( Q ∩ Gamma eq.not diameter \) lt.eq C_a r^alpha y^(- alpha) . $ <hd:one-cell>]

]
] <hd:visit>

#proof[
  Suppose the radius never reaches $8 r$ before the lifetime $T_z$ of $z$.
    Since $R_0 \( z \) = 2 y > 8 r$, continuity and Koebe’s Quarter Theorem give
  $ B \( z \, 2 r \) subset H_t wide \( t < T_z \) . $
  The past trace avoids this open ball. If $T_z < oo$, continuity prevents the trace from entering its interior at
    time $T_z$ as well. The ball lies in $bb(H)$, is connected, and avoids $gamma \( \[ 0 \, T_z \] \)$.
    It therefore lies in the same complementary component as $z$.
    This component is bounded, since $z$ has been swallowed. Each point of the ball has an open neighborhood in
    that component, disjoint from $H_(T_z)$; hence
  $ B \( z \, 2 r \) ∩ overline(H_(T_z)) = diameter . $
  The future trace lies in $overline(H_(T_z))$, so it cannot enter the ball.
    If $T_z = oo$, the ball is avoided at every finite time directly.
    In both cases $Q$, which lies strictly inside this ball, is unvisited.
    This proves the crossing assertion, including when $4 < kappa < 8$.
  If $y \/ r$ exceeds a sufficiently large constant depending on $a$,
    the inner time to radius $8 r$ is $sigma = \( 2 a \)^(- 1) log \( y \/ \( 4 r \) \)$, long enough for Lemma 3.
    At its hitting time $tau$, Lemma 2 gives
  $ bb(P) \( tau < oo \) = \( 8 r \)^alpha G_0 \( z \) thin bb(E)_z^(*) \[ sin^(- p) theta_tau \( z \) \] lt.eq
    C_a r^alpha y^(- alpha) . $
  Here $G_0 \( z \) lt.eq \( 2 y \)^(- alpha)$, and
  $ integral_0^pi sin^(- p) theta thin pi_a \( #h(-0.16667em) upright(d) theta \) =
    c_a integral_0^pi sin theta thin #h(-0.16667em) upright(d) theta < oo . $
  For the remaining values of $y \/ r$, a larger $C_a$ makes the right side of Equation (8.1) at least one,
    so the trivial probability bound completes the proof. ◻
]

#thm([Proposition 8.2.])[
  (The upper Hausdorff bound).  #emph[For every integer $m gt.eq 1$,
    the random variable $cal(H)^h \( Gamma ∩ B_m \)$, where $B_m = \[ - m \, m \] + i \[ 0 \, m \]$,
    is measurable and satisfies
#[#set math.equation(numbering: n => "(8.2)")
 $ bb(E) thin cal(H)^h \( Gamma ∩ B_m \) < oo . $ <hd:expected-box>]

 In particular, these whole-trace bounded-box measures are almost surely finite simultaneously for all $m$.]
] <hd:upper>

#proof[
  Fix $m$. We first estimate finite adapted test failures at the final mesh of a batch.
    Then we choose a finite terminal-mass cover and bound its expected cost.
    The last step establishes measurability and passes to arbitrarily small diameters.
  ===== 8.1 Finite tests at the final mesh. <finite-tests-at-the-final-mesh.>
  Take a sufficiently large batch $n$ and write
  $ J = I_n - 1 \, wide r_(upright(f)) = r_(n \, I_n) \, wide r_i = r_(n i) \, quad b_i =
    b_(n i) quad \( 1 lt.eq i lt.eq J \) . $
  There is at least one test for all sufficiently large $n$, by Lemma 16.
    Cover the box $B_m = \[ - m \, m \] + i \[ 0 \, m \]$ by finitely many closed squares of side
    $r_(upright(f))$, beginning at $x = - m$ and at height zero,
    and retain the whole squares in the outermost rows and columns. Their centers have heights
  $ y_j = \( j + 1 / 2 \) r_(upright(f)) \, wide j gt.eq 0 . $
  At every grid center $z$, the closed ball $overline(B) \( z \, C_(*) r_i \)$ is a #emph[candidate] for entry $i$ if
  #[#set math.equation(numbering: n => "(8.3)")
   $ mu_oo #scale(x: 120%, y: 120%)[\(] overline(B) \( z \, C_(*) r_i \) ∩ bb(H) #scale(x: 120%, y: 120%)[\)]
     gt.eq c_(*)^d b_i r_i^d . $ <hd:candidate>]
  Every such ball contains the final cell centered at $z$. There are only finitely many candidate checks in a
    batch. They involve terminal mass; candidate selection itself is made after the sample has been realized.
  We estimate the probability that a cell is visited and has no candidate through finite stopped tests.
    Consider a center $z$ with $y gt.eq e^(- n)$. For large $n$,
    Lemma 19 shows that a visit requires the finite hitting time $tau_(upright(f))$ of radius $8 r_(upright(f))$.
    For each $i$, let $S_i$ and $T_i$ be the first times, while $z$ remains alive,
    that its conformal radius reaches $100 r_i$ and $100 r_i e^(- 2 a ell_n)$, respectively;
    set either time to infinity on failure. On ${ tau_(upright(f)) < oo }$,
    both times are finite and the inner-clock interval from $S_i$ to $T_i$ has length $ell_n$.
    On ${ T_i < oo }$, let $F_i : bb(D) arrow.r H_(S_i)$ be the disk map used in Equation (7.3),
    and define the stopped test mass
  #[#set math.equation(numbering: n => "(8.4)")
   $ X_i =
     integral_(F_i \( K \)) \| F'_i \( F_i^(- 1) \( x \) \) \|^(- d) \( mu_(T_i) - mu_(S_i) \) \( #h(-0.16667em)
     upright(d) x \) . $ <hd:stopped-test>]
  Set $X_i = 0$ on ${ T_i = oo }$. The variable is measurable at $T_i$ and, on a reached endpoint,
    is the canonical disk mass $L_(ell_n)$ for the restart angle.
    Only paths reaching $tau_(upright(f))$ will enter the stopped event below. Success, $X_i gt.eq b_i$, implies
  $ \( mu_(T_i) - mu_(S_i) \) \( F_i \( K \) \) gt.eq c_(*)^d b_i r_i^d \, $
  so Equation (7.2) and monotonicity of mass force the ball $overline(B) \( z \, C_(*) r_i \)$ to qualify in
    Equation (8.3).
  The gaps in the inner clock are deterministic; Figure 2 shows their order.
    Writing $sigma_i = s_z \( S_i \)$ and $sigma_(upright(f)) = s_z \( tau_(upright(f)) \)$,
    the radius formula gives exactly
  #[#set math.equation(numbering: n => "(8.5)")
   $ sigma_1 & = frac(1, 2 a) log frac(2 y, 100 e^(- n^2)) med gt.eq med frac(n^2 - n - log 50, 2 a) \,\
sigma_(i + 1) - \( sigma_i + ell_n \) & = n wide \( 1 lt.eq i < J \) \,\
sigma_(upright(f)) - \( sigma_J + ell_n \) & = n + frac(1, 2 a) log 100 / 8 . $ <hd:test-gaps>]
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (13, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((13, 0), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  rect((0.8, 0.15), (2.6, 0.82), fill: rgb("#e8e8ff"), stroke: none)
  rect((0.8, 0.15), (2.6, 0.82), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10))
  content((1.7, 0.49), [#text(size: 9pt)[test: $ell_n$]])
  line((0.8, 0.07), (0.8, -0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.6, 0.07), (2.6, -0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((3.8, 0.15), (5.6, 0.82), fill: rgb("#e8e8ff"), stroke: none)
  rect((3.8, 0.15), (5.6, 0.82), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10))
  content((4.7, 0.49), [#text(size: 9pt)[test: $ell_n$]])
  line((3.8, 0.07), (3.8, -0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((5.6, 0.07), (5.6, -0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((7.3, 0.15), (9.1, 0.82), fill: rgb("#e8e8ff"), stroke: none)
  rect((7.3, 0.15), (9.1, 0.82), stroke: (paint: rgb("#000099"), thickness: 0.4pt, miter-limit: 10))
  content((8.2, 0.49), [#text(size: 9pt)[test: $ell_n$]])
  line((7.3, 0.07), (7.3, -0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((9.1, 0.07), (9.1, -0.07), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.8, -0.1), [#text(size: 9pt)[$sigma_1$]], anchor: "north", padding: 0.1176cm)
  content((2.6, -0.1), [#text(size: 9pt)[$sigma_1+ ell_n$]], anchor: "north", padding: 0.1176cm)
  content((3.8, -0.1), [#text(size: 9pt)[$sigma_2$]], anchor: "north", padding: 0.1176cm)
  content((5.6, -0.1), [#text(size: 9pt)[$sigma_2+ ell_n$]], anchor: "north", padding: 0.1176cm)
  content((7.3, -0.1), [#text(size: 9pt)[$sigma_J$]], anchor: "north", padding: 0.1176cm)
  content((9.1, -0.1), [#text(size: 9pt)[$sigma_J+ ell_n$]], anchor: "north", padding: 0.1176cm)
  content((6.45, 0.48), [#text(size: 9pt)[$dots.h$]])
  line((2.6, 1.1), (3.8, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((3.2, 1.1), [#text(size: 9pt)[$n$]], anchor: "south", padding: 0.1176cm)
  line((9.1, 1.1), (12.2, 1.1), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((10.65, 1.1), [#text(size: 9pt)[$n+ frac(1, 2a) log frac(100, 8)$]], anchor: "south", padding: 0.1176cm)
  line((12.2, -0.07), (12.2, 0.85), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((12.2, -0.1), [#text(size: 9pt)[$sigma_( upright(f) )$]], anchor: "north", padding: 0.1176cm)
  content((6.5, -1.15), [#text(size: 8pt)[All failures are known at $T_J$. The final gap controls#linebreak()the inverse-angle factor in the change back to the original law.]])
})],
    caption: [Figure 2: One batch at a fixed grid center, in inner time (schematic). There are $J = I_n - 1$ mass tests, each of length $ell_n$, with gaps $n$ between consecutive tests. The coordinates are $s_z \( S_i \) = sigma_i$, $s_z \( T_i \) = sigma_i + ell_n$, and $s_z \( tau_(upright(f)) \) = sigma_(upright(f))$; the final coordinate corresponds to conformal radius $8 r_(n \, I_n)$. The first restart is preceded by a mixing gap as well. The tests are conditioned on their actual past; independence is unnecessary. ],
  ) <fig:batch-timeline>
  For the failure estimate, we now work under the finite centered law stopped at $tau_(upright(f))$,
    under which all these levels are reached. For all sufficiently large $n$,
    each of these gaps permits the uniform mixing estimate. Conditional on the entire stopped history through
    $T_(i - 1)$, the angle at $S_i$ has density at least $1 \/ 2$ relative to $pi_a$;
    the first test has the same bound from its initial gap. Conditional on the history through $S_i$,
    the disk law of $X_i$ depends only on that angle, by Proposition 10 and the finite conditional tilt. Thus, with
  $ q_i = bb(P)_(upright("mix"))^(*) \( L_(ell_n) gt.eq b_i \) \, $
  the conditional probability of success is at least $q_i \/ 2$.
    Iterated conditional expectations, followed by Lemma 16, give
  #[#set math.equation(numbering: n => "(8.6)")
   $ bb(P)_z^(*) \( X_i < b_i upright(" for every ") i lt.eq J \) lt.eq product_(i = 1)^J \( 1 - q_i \/ 2 \) lt.eq
     exp (- 1 / 2 sum_(i = 1)^J q_i) lt.eq exp \( - 2^n \/ 16 \) . $ <hd:test-failure>]
  This argument conditions on the actual past at each test.
    It requires no independence between tests or between centers.
  ===== 8.2 Changing law for the failure event. <changing-law-for-the-failure-event.>
  The event that a cell is visited and has no candidate is contained in the larger event
  #[#set math.equation(numbering: n => "(8.7)")
   $ A = { tau_(upright(f)) < oo } ∩ ⋂_(i = 1)^J { X_i < b_i } . $ <hd:adapted-enlargement>]
  All test endpoints precede $tau_(upright(f))$, so $A$ is measurable at that stopping time.
    Only this enlarged event is used in changing law. In particular,
    no terminal candidate information is put into a finite Radon–Nikodym formula.
    Let $hat(theta) = theta_(tau_(upright(f))) \( z \)$ and $F_(upright("fail")) = ⋂_i { X_i < b_i }$.
    The final gap in Equation (8.5), conditional on the history through $T_J$, gives
  $ bb(E)_z^(*) \[ sin^(- p) hat(theta) divides cal(F)_(T_J) \] lt.eq
    2 integral sin^(- p) theta thin pi_a \( #h(-0.16667em) upright(d) theta \) . $
  Since $F_(upright("fail"))$ is known at $T_J$, the density at $tau_(upright(f))$ and Equation (8.6) yield
  #[#set math.equation(numbering: n => "(8.8)")
   $ & bb(P) \( upright("the cell at ") z upright(" is visited and has no candidate") \)\
 & quad lt.eq bb(P) \( A \) = \( 8 r_(upright(f)) \)^alpha G_0 \( z \) thin
   bb(E)_z^(*) \[ sin^(- p) hat(theta) \; med F_(upright("fail")) \]\
 & quad lt.eq C_a r_(upright(f))^alpha y^(- alpha) exp \( - 2^n \/ 16 \) wide \( y gt.eq e^(- n) \) . $ <hd:upper-cell>]
  For centers below $e^(- n)$, use the unconditional estimate
  #[#set math.equation(numbering: n => "(8.9)")
   $ bb(P) \( upright("the cell at ") z upright(" is visited") \) lt.eq
     C_a r_(upright(f))^alpha y^(- alpha) $ <hd:lower-cell>]
  from Lemma 19. This includes the bottom row: its center has height $r_(upright(f)) \/ 2$,
    and the trivial probability bound is absorbed by the displayed estimate.
  ===== 8.3 Selecting and charging the cover. <selecting-and-charging-the-cover.>
  Order all candidate balls by decreasing radius, using a fixed deterministic order for ties.
    Choose the first ball, delete every ball meeting it, and continue until no candidates remain.
    The selected closed balls are pairwise disjoint. A deleted ball has radius no greater than that of the ball
    that deletes it, so it is contained in the concentric triple of that selected ball.
    The triples therefore cover every final cell having a candidate.
    For a chosen ball associated with $\( b_i \, r_i \)$, its triple has diameter $6 C_(*) r_i$;
    Equation (6.4) and its qualification give
  #[#set math.equation(numbering: n => "(8.10)")
   $ h \( 6 C_(*) r_i \) & lt.eq \( 6 C_(*) \)^2 b_i r_i^d\
 & lt.eq frac(\( 6 C_(*) \)^2, c_(*)^d) thin mu_oo #scale(x: 120%, y: 120%)[\(] overline(B) \( z \, C_(*) r_i \) ∩
   bb(H) #scale(x: 120%, y: 120%)[\)] . $ <hd:candidate-cost>]
  For large $n$ all these balls lie, after intersection with $bb(H)$, in the fixed bounded set
  $ tilde(B)_m = \[ - m - 2 \, m + 2 \] + i \( 0 \, m + 2 \] . $
  Disjointness thus bounds their total gauge cost by
  $ frac(\( 6 C_(*) \)^2, c_(*)^d) thin mu_oo \( tilde(B)_m \) . $
  This is the actual mass of a fixed region on the same sample. It has finite expectation, even at the real boundary:
  #[#set math.equation(numbering: n => "(8.11)")
   $ bb(E) mu_oo \( tilde(B)_m \) = integral_(tilde(B)_m) G_0 \( z \) thin #h(-0.16667em) upright(d) A \( z \)
     lt.eq frac(2^(- alpha) \( 2 m + 4 \) \( m + 2 \)^(1 - alpha), 1 - alpha) < oo . $ <hd:boundary-integrability>]
  The mean identity on this set follows by an interior compact exhaustion and monotone convergence.
  ===== 8.4 Paying for missed cells and the boundary. <paying-for-missed-cells-and-the-boundary.>
  Add every final cell that meets $Gamma$ and has no candidate. The cleanup entry gives the individual cost
  $ h \( sqrt(2) thin r_(upright(f)) \) lt.eq 2 n r_(upright(f))^d . $
  There are $O_m \( r_(upright(f))^(- 1) \)$ columns. Since $0 < alpha < 1$, summing the half-integer row heights gives
  $ sum_(upright("all cells")) y^(- alpha) & lt.eq C_(a \, m) r_(upright(f))^(- 2) \,\
sum_(y < e^(- n)) y^(- alpha) & lt.eq C_(a \, m) r_(upright(f))^(- 2) \( e^(- n) + r_(upright(f)) \)^(1 - alpha) . $
  For example, $sum_(j = 0)^N \( j + 1 / 2 \)^(- alpha) lt.eq C_alpha \( N + 1 \)^(1 - alpha)$ proves both bounds.
    Multiplying Equations (8.8) and (8.9) by the cleanup cost, and using $d + alpha = 2$,
    bounds the expected added cost by
  #[#set math.equation(numbering: n => "(8.12)")
   $ C_(a \, m) [n e^(- 2^n \/ 16) + n \( e^(- n) + r_(upright(f)) \)^(1 - alpha)] . $ <hd:cleanup-cost>]
  It is bounded uniformly in $n$ and tends to zero. In particular,
    the bottom row contributes at most $C_m n r_(upright(f))^(d - 1)$.
    Thus points of the trace on the real axis are included in the cover,
    although the auxiliary mass itself is defined on $bb(H)$.
  ===== 8.5 Measurability and the limiting cover. <measurability-and-the-limiting-cover.>
  These constructions are measurable. The candidate family is finite with measurable terminal-mass indicators,
    and the greedy order is deterministic. For a fixed closed cell,
    the event of meeting the trace is measurable on every compact time interval, by continuity;
    a countable union over integer time horizons gives the full trace event.
    All upper-bound centers, entries, and boxes constitute a countable family,
    so the stopped measure identities used in constructing their tests can be imposed on one event.
  Let $C_n$ be the total gauge cost of the resulting cover of $Gamma ∩ B_m$.
    Equations (8.10)– (8.12) show that $sup_n bb(E) C_n < oo$, after omitting finitely many initial batches.
    Every cover diameter is at most
  $ delta_n = 6 C_(*) e^(- n^2) \, $
  which tends deterministically to zero. Fatou’s Lemma gives
  $ bb(E) \[ liminf_(n arrow.r oo) C_n \] lt.eq liminf_(n arrow.r oo) bb(E) C_n < oo \, $
  so the liminf cost is finite almost surely. For every fixed $delta > 0$,
    all sufficiently late covers are admissible for $cal(H)_delta^h \( Gamma ∩ B_m \)$, and hence
  $ cal(H)_delta^h \( Gamma ∩ B_m \) lt.eq liminf_(n arrow.r oo) C_n . $
  Letting $delta arrow.b 0$ gives the pathwise domination
  #[#set math.equation(numbering: n => "(8.13)")
   $ cal(H)^h \( Gamma ∩ B_m \) lt.eq liminf_(n arrow.r oo) C_n . $ <hd:liminf-domination>]
  We justify ordinary expectation of the left side. For an integer $T$, $K_T =
    gamma \( \[ 0 \, T \] \) ∩ B_m$ is a measurable compact random set.
    Indeed, for a fixed closed $F$, the event $K_T ∩ F eq.not
    diameter$ is the measurable event $min_(0 lt.eq t lt.eq T) "dist" \( gamma \( t \) \, B_m ∩ F \) = 0$;
    the minimum can be computed on rational times. Empty target sets give the empty event.
    Hit events for open sets follow by an increasing union of closed subsets,
    so these tests give the required compact-set measurability.
    Intersection with $B_m$ need not depend continuously on the path.
  For completeness, $K mapsto cal(H)^h \( K \)$ is measurable on compact sets.
    Use the countable family of finite unions of open balls with rational centers and radii.
    The limit of the corresponding countable infima over finite covers,
    with their diameter cutoff tending to zero, equals $cal(H)^h \( K \)$.
    To see this, start with any countable cover of the compact $K$ at a smaller cutoff.
    Enlarge its sets to open neighborhoods with arbitrarily small diameter slack and summable cost slack,
    using continuity of $h$ (also at zero). Compactness gives a finite subcover.
    Shrink that finite cover on $K$ to compact pieces, and cover each piece by finitely many rational balls inside
    its assigned neighborhood. The grouped balls remain inside that neighborhood,
    preserving its diameter bound and cost. This proves equality after letting the cutoff and slack tend to zero;
    equality at an unchanged fixed cutoff is not needed. Each admissibility event $K subset
    O$ for a fixed open $O$ is measurable, so the countable infima and their limit are measurable.
  Finally $Gamma ∩ B_m = union.big_(T in bb(N)) K_T$ is an increasing union of compact sets.
    Hausdorff outer measure is a measure on Borel sets, so continuity from below gives
    $cal(H)^h \( Gamma ∩ B_m \) = lim_T cal(H)^h \( K_T \)$. This is measurable.
    Taking expectations in (8.13) and applying the preceding Fatou bound proves (8.2).
    A countable intersection now gives almost-sure finiteness in every integer box. ◻
]

#proof[
  Equation (5.7) specifies the coefficients deterministically from $kappa$,
    and Proposition 15 shows that Equation (6.4) defines an admissible gauge.
    Intersect the probability-one events of Propositions 18 and 20.
    On this one event, the lower bound holds for every real $0 < s < t < oo$.
    The image of each finite time interval is bounded by continuity of $gamma$,
    and therefore lies in one of the integer boxes of Proposition 20; its Hausdorff measure is finite.
    Thus the required positive finite measure holds simultaneously for every such interval.
    The constant change of capacity time used at the start preserves this all-interval assertion. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
