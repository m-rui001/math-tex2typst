#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Bochner--Riesz multipliers \
in three dimensions]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

We prove the Bochner–Riesz conjecture in three dimensions in its strict-order formulation.
  The main estimate is boundedness on $L^3$ for every positive order;
  interpolation and duality then give the full range of exponents.

For $f in cal(S) \( bb(R)^3 \)$, use the Fourier transform

$ hat(f) \( xi \) = integral_(bb(R)^3) f \( x \) e^(- 2 pi i x dot.op xi) thin d x \, $

where $cal(S)$ denotes the Schwartz space. For $delta > 0$, define

#[#set math.equation(numbering: n => "(1.1)")
 $ T_delta f \( x \) = integral_(bb(R)^3) \( 1 - lr(|xi|)^2 \)_(+)^delta hat(f) \( xi \) e^(2 pi i x dot.op xi)
   thin d xi . $ <eq:main-multiplier>]

#thm([Theorem 1.1.])[
  #emph[For every $delta > 0$, there is a finite constant $C_delta$ such that
#[#set math.equation(numbering: n => "(1.2)")
 $ ∥T_delta f∥_(L^3 \( bb(R)^3 \)) lt.eq C_delta ∥∥ f_(L^3 \( bb(R)^3 \)) wide \( f in cal(S) \( bb(R)^3 \) \) .
   $ <eq:main-bound>]

 Consequently $T_delta$ has a unique bounded extension to $L^3 \( bb(R)^3 \)$.]
] <thm:bochner-riesz>

Theorem 1 gives

#[#set math.equation(numbering: n => "(1.3)")
 $ ∥T_delta f∥_(L^p \( bb(R)^3 \)) lt.tilde_(p \, delta) ∥∥ f_(L^p \( bb(R)^3 \)) \, wide
   delta > max {3 lr(|1 / p - 1 / 2|) - 1 / 2 \, 0} \, quad 1 lt.eq p lt.eq oo . $ <eq:intro-full-range>]

Corollary 53 supplies the interpolation argument, including the bounds for complex orders.
  The order is fixed before choosing any constants. Dilation gives the same bounds for multipliers
  $\( 1 - \| xi \|^2 \/ R^2 \)_(+)^delta$ at every $R > 0$; for finite $p$ in (1.3),
  these means converge to $f$ in $L^p$ as $R arrow.r oo$. This recovers Fourier inversion by arbitrarily mild
  spherical smoothing at the central exponents $3 \/ 2 lt.eq p lt.eq 3$.

=== 1.1 The problem and its development <the-problem-and-its-development>

The problem belongs to the theory of summability of Fourier expansions.
  Riesz’s work on one-dimensional summation methods #cite(label("Riesz1923")) preceded Bochner’s spherical means
  for multiple Fourier series #cite(label("Bochner1935")) #cite(label("Bochner1936")).
  The multiplier $\( 1 - \| xi \|^2 \)_(+)^delta$ softens the boundary of the frequency ball;
  the question is how much smoothing is needed to preserve an $L^p$ norm.
  Radial inversion and radial summability were studied by Herz and Welland #cite(label("Herz1954"))
  #cite(label("Welland1975")). For general functions the geometry of frequency directions is essential.
  Using a Kakeya construction, Fefferman proved that in dimension at least two the order-zero ball multiplier is
  unbounded on $L^p$ for $p eq.not 2$ #cite(label("Fefferman1971")),
  while Carleson and Sjölin established the conjectured positive-order range in the plane
  #cite(label("CarlesonSjolin1972")).

Geometric decompositions connect this problem with the arrangement of long thin tubes and with Fourier
  restriction. Córdoba’s work on radial multipliers and Kakeya maximal functions developed this connection through
  rectangle decompositions and almost orthogonality #cite(label("Cordoba1975")) #cite(label("Cordoba1977")).
  Bourgain combined geometric maximal-function estimates with improved restriction and multiplier bounds in three
  dimensions #cite(label("Bourgain1991RestrictionMultiplier")).
  The bilinear restriction theorems of Wolff for the cone and Tao for the paraboloid and elliptic surfaces
  #cite(label("Wolff2001")) #cite(label("Tao2003")) led, through Lee’s multiplier reduction,
  to sharp-order Bochner–Riesz estimates for $max { p \, p' } gt.eq 10 \/ 3$ #cite(label("Lee2004"));
  here $p'$ is the Hölder conjugate of $p$. The threshold exponent follows from Lee’s printed strict range by
  interpolation with $L^2$, keeping a positive margin in the order.

Polynomial partitioning and subsequent multiscale refinements brought further progress on restriction
  #cite(label("Guth2016")) #cite(label("WangBrooms2020")). For the multiplier itself,
  Wu obtained the conjectured strict-order range when $max { p \, p' } gt.eq 13 \/ 4$ #cite(label("Wu2023")).
  Guo, Oh, Wang, Wu, and Zhang developed a pseudoconformal approach and an induction on two scales for
  transferring restriction methods to Bochner–Riesz estimates #cite(label("GuoOhWangWuZhang2025")).
  More recently, Gao, Wu, and Xi established the strict-order multiplier range $max { p \, p' } gt.eq
  22 \/ 7$ #cite(label("GaoWuXi2026")) Corollary 1.3. Wang and Wu’s related diagonal extension estimate holds for
  $p > 22 \/ 7$ #cite(label("WangWu2024")) Theorem 0.2. The connection also runs in the other direction:
  Tao showed that the Bochner–Riesz conjecture implies the spherical restriction conjecture
  #cite(label("Tao1999")). Our argument directly establishes the scalar multiplier bound on $L^3 \( bb(R)^3 \)$
  for every fixed positive order. Zipeng Wang has also proposed a proof of the Bochner–Riesz conjecture in all
  dimensions #cite(label("ZipengWang2026")) version 6, Theorem One.

Let $S^2 = { omega in bb(R)^3 : \| omega \| = 1 }$ and let $sigma$ be surface area measure on $S^2$.
  For bounded measurable $g : S^2 arrow.r bb(C)$, define

$ E g \( x \) = integral_(S^2) g \( omega \) e^(2 pi i x dot.op omega) thin d sigma \( omega \) . $

Tao’s implication applied to (1.3) gives, for every real $p > 3$,

$ ∥E g∥_(L^p \( bb(R)^3 \)) lt.eq C_p ∥g∥_(L^oo \( S^2 \, sigma \)) \, $

where $C_p < oo$ depends only on $p$. This is the spherical extension estimate also proved in
  #cite(label("OpenAISphere2026"), form: "prose") Theorem 1.1.
  For the separate diagonal extension theorem on compact smooth positively curved surfaces,
  possibly with smooth boundary, see #cite(label("OpenAIDiagonal2026"), form: "prose") Theorem 1.1;
  that general-surface statement is not deduced here from the spherical multiplier theorem.

An independent route through critical local smoothing gives the same full strict fixed-radius range in (1.3),
  uniformly in the radius #cite(label("OpenAILocalSmoothing2026")) Corollary 11.2.
  It also gives strong maximal Bochner–Riesz bounds and almost-everywhere summation for $3 lt.eq
  p < oo$ and $delta > 1 - 3 \/ p$ #cite(label("OpenAILocalSmoothing2026")) Theorem 11.1.
  These results are not inputs to the argument here.

The geometric input here is the sharp planar Furstenberg estimate of Ren and Wang #cite(label("RenWang2025")).
  It belongs to a line of projection theory that includes the classical work of Marstrand and Kaufman
  #cite(label("Marstrand1954")) #cite(label("Kaufman1968")) and the discretized sum-product and projection methods
  of Bourgain #cite(label("Bourgain2010")). Oberlin formulated a sharp prediction for exceptional projection
  directions #cite(label("Oberlin2012")). Important advances toward the Furstenberg problem include the
  packing-dimension results of Orponen and Shmerkin #cite(label("Orponen2020Packing"))
  #cite(label("Shmerkin2022Packing")), their joint Hausdorff-dimension improvement
  #cite(label("OrponenShmerkin2023Hausdorff")), and their proof of the conjectured bound when the associated
  family of affine lines has equal Hausdorff and packing dimensions #cite(label("OrponenShmerkin2026ABC")).
  Building on that regular case, Ren and Wang removed the additional equality assumption.
  We use their finite incidence theorem. Section 3 derives the form needed for probability weights,
  auxiliary tags that may share a slope, and incidence graphs of positive product mass;
  Section 2 supplies the finite conditioning used in later applications.

=== 1.2 From geometric growth to oscillatory cancellation <from-geometric-growth-to-oscillatory-cancellation>

The proof has two stages. We first control the information gained by observing positive masses moving along lines.
  We then transfer that control to wave packets, whose squared amplitudes are positive but whose superposition is
  oscillatory. The main obstruction is at the uncertainty boundary:
  an earlier packet cannot be assigned a position as precisely as a later observation requires.
  The second stage records this discrepancy as fine velocity information and shows that too much growth would make
  that information exceed its finite capacity.

===== 1.2.1 Positive masses on lines. <positive-masses-on-lines.>

A particle $T$ carries bounded data $\( V \, A \) in bb(R)^2 times bb(R)^2$ and moves along $c mapsto A + c V$.
  Fix a small parameter $epsilon.alt$. An aperture observation at duration $t$ records velocity in a rectangle of
  widths $epsilon.alt^b \, epsilon.alt^a$, $b lt.eq a$, and position in a transported rectangle of widths
  $epsilon.alt^(b + t) \, epsilon.alt^(a + t)$. Its orientation is also recorded. For $0 < gamma < 1$, the weight

$ w \( b \, a \) = a + b - gamma \( a - b \) $

rewards fine resolution while penalizing eccentricity. The score in (4.1) subtracts the particle information
  required by the observation and adds twice the time entropy conditional on the particle.
  Its largest asymptotic increase per unit duration is denoted by $beta$. Theorem 15 proves $beta lt.eq gamma$.

To prove this bound, assume excessive growth and localize a sequence whose scores approach the largest possible
  rate. The aspect penalty makes the orientations of such observations coherent.
  Choosing the least possible aspect produces a saturated path:
  its intermediate observations attain the same growth rate. There are two alternatives.
  An isotropic extremizer is excluded in Section 5 by combining time-fiber richness, planar projections,
  and a Loomis–Whitney argument. In the other alternative, the orientation and longitudinal resolutions advance at
  a fixed ratio $m > 0$.

The latter case produces four data coordinates with resolution speeds $0 \, 1 \, m \, 1 + m$.
  Their particle-information profile is Lipschitz, but ordinary almost everywhere differentiability does not give
  a derivative on the particular plane selected by the path.
  Section 6 proves the needed trace and affine approximation there.
  Planar projections then transfer lower bounds between the coordinate rates.
  When $m = 1$, the middle coordinates share a speed and only their joint rate is available.
  Two conditional projection tests and a reciprocal pinned-direction argument supply the missing inequalities.
  The latter is related to the radial-projection bootstraps of Shmerkin and Wang and of Orponen, Shmerkin,
  and Wang #cite(label("ShmerkinWang2025Distance")) #cite(label("OrponenShmerkinWang2024Radial")).
  Section 8 combines these rate constraints with the saturated path’s contact and jump conditions to obtain a
  contradiction.

===== 1.2.2 Oscillatory packets. <oscillatory-packets.>

Write $lambda^(- 1) = epsilon.alt^(H_(upright(P)))$. At duration $t$,
  a packet has velocity depth $u_t = \( H_(upright(P)) - t \) \/ 2$ and position depth $u_t + t$.
  The packet score in (9.6) uses squared oscillatory amplitudes,
  and its largest growth rate is denoted by $beta_(upright(q))$.
  Sections 9–10 construct finite decompositions, control their tails,
  and track the loss when only part of an assigned atom class is retained.
  These constructions use the Fourier-series localization and almost orthogonality underlying classical
  wave-packet methods #cite(label("Tao2003")) #cite(label("GuoOhWangWuZhang2025")).

Away from the uncertainty boundary, a coarser observation faithfully locates the packets,
  so the positive-mass estimate applies. At the boundary, a separate coherent estimate is required.
  It leaves a layer of fine velocity information, which must be carried to the preceding step.
  Section 11 proves that hypothetical growth $beta_(upright(q)) > gamma \/
  2$ increases this information by at least $\( 4 beta_(upright(q)) - 2 gamma \) h$, up to controlled errors,
  at every backward step of fixed length $2 h$. The layer holds at most $2 h$ units, up to vanishing errors.
  A fixed finite number of steps therefore yields a contradiction and proves Theorem 35:
  $beta_(upright(q)) lt.eq gamma \/ 2$.

===== 1.2.3 The multiplier. <the-multiplier.>

Packet growth gives the oscillatory estimate of Theorem 50, with an arbitrarily small positive power loss.
  On a physical shell of radius $lambda$, the Bochner–Riesz kernel has amplitude of order $lambda^(- 2 - delta)$.
  The pseudoconformal distance-phase change of variables used in
  #cite(label("GuoOhWangWuZhang2025"), form: "prose") puts this shell into the required phase class.
  Section 12 verifies all phase and amplitude bounds uniformly in the shell and obtains the operator norm
  $O_(delta \, nu) \( lambda^(- delta + nu) \)$. Choosing $0 < nu < delta$ proves Theorem 1 by summation.
  A beta-integral representation supplies the complex-order bounds used in Stein’s analytic interpolation theorem
  #cite(label("Stein1956")), completing (1.3).

=== 1.3 Finite laws and order of limits <finite-laws-and-order-of-limits>

Entropy permits a common language for these geometric and analytic steps.
  We use finite entropy and relative entropy #cite(label("Shannon1948")) #cite(label("KullbackLeibler1951")),
  conditional copies and submodularity #cite(label("Tao2010Entropy")), and homogeneous profiles across scales.
  Multiscale entropy and comparable-partition methods have important precedents in
  #cite(label("HochmanShmerkin2012"), form: "prose") #cite(label("Hochman2014"), form: "prose").
  Section 2 proves the precise finite-law statements used here.

Small normalized mutual information yields a comparison with a product law after trimming;
  it does not give exact independence. Theorem 8 specifies which labels are fixed and which remain free,
  so later conditioning uses the correct comparison population.
  For the characteristic-plane argument, first fix a homogeneous component and its limiting profile,
  then choose the approximation scale, and only afterwards take the finite precision small relative to that scale.
  Theorem 26 and Corollary 27 state these successive steps.

Packet composition also keeps two finite populations distinct.
  Its upper estimate concerns a retained superposition, while its earlier lower test uses the whole assigned cap
  class. Proposition 41 records the loss from retention. Section 11 carries the remaining fine velocity
  information through a fixed finite number of cuts, using the one-step statement of Proposition 48.

Throughout, $sans(H) \, sans(I)$ denote entropy and mutual information divided by $log \( 1 \/ epsilon.alt \)$,
  whereas $sans(H)_(upright("nat")) \, sans(I)_(upright("nat"))$ use natural logarithms.
  The notation $log_(1 \/ epsilon.alt) #h(-0.16667em) (r)$ uses the normalized units.
  The Planck depth is always $H_(upright(P))$, distinct from entropy.
  A positive depth increment is fixed before the small-parameter limit; when increments subsequently shrink,
  that additional limit is stated separately.

== 2 Finite entropy, conditioning, and passage to profiles <sec:entropy>

The geometric arguments will use conditional point and parameter populations whose masses must remain controlled
  after labels are fixed. We first develop the finite probability estimates that justify those operations,
  and then explain their passage to limiting entropy profiles.
  All probability spaces in the finite statements are finite,
  with cardinalities allowed to depend on $epsilon.alt$. Put $ell =
  log \( 1 \/ epsilon.alt \)$ and write $sans(H)_(upright("nat")) \,
  sans(I)_(upright("nat"))$ for natural-log entropy and mutual information, with $sans(H) =
  sans(H)_(upright("nat")) \/ ell$ and $sans(I) = sans(I)_(upright("nat")) \/ ell$.
  The exact particle index $T$ may have an arbitrarily large alphabet; no bound on its entropy is required.
  Every comparison measure is specified explicitly and need not be a marginal of the law being estimated.

=== 2.1 Entropy estimates with unrestricted parent alphabets <entropy-estimates-with-unrestricted-parent-alphabets>

Our conventions are the usual finite entropy and relative entropy #cite(label("Shannon1948"))
  #cite(label("KullbackLeibler1951")). Conditional copies and entropy submodularity also feature in Tao’s entropy
  calculus #cite(label("Tao2010Entropy")); the comparison and retention bounds required here are proved below.

We use the chain rule, nonnegativity of conditional mutual information,
  and $sans(H)_(upright("nat")) \( X \) lt.eq log \| cal(X) \|$ for an $cal(X)$-valued observation.
  Here are the particular consequences, including quantitative restriction estimates, that we will need.

#thm([Lemma 2.1.])[
  (Determination, masses, and restriction).  #emph[Let $A \, B \, D \, T$ be finite observations. Then
#[#set math.equation(numbering: n => "(2.1)")
 $ sans(I)_(upright("nat")) \( T \; B \) & lt.eq sans(I)_(upright("nat")) \( T \; A \) +
   sans(H)_(upright("nat")) \( B divides A \) \,\
\| sans(H)_(upright("nat")) \( B divides T \) - sans(H)_(upright("nat")) \( A divides T \) \| & lt.eq
  sans(H)_(upright("nat")) \( B divides A \) + sans(H)_(upright("nat")) \( A divides B \) .
  $ <eq:entropy-determination>]

 If, outside an event of probability $zeta$, $B$ has at most $N$ possible values given $A$,
   and $\| cal(B) \| lt.eq M$, then
#[#set math.equation(numbering: n => "(2.2)")
 $ sans(H)_(upright("nat")) \( B divides A \) lt.eq log 2 + log N + zeta log M . $ <eq:entropy-ambiguity>]

 For nonnegative numbers $m_b$ with $m_b > 0$ on the support of $B$,
#[#set math.equation(numbering: n => "(2.3)")
 $ sans(H)_(upright("nat")) \( B \) + bb(E) log m_B lt.eq log sum_b m_b . $ <eq:entropy-masses>]

 Finally, let $sans(P) \, sans(Q)$ be laws on the same space with $sans(Q) lt.eq K sans(P)$, $K gt.eq 1$.
   For arbitrary $B \, D$,
#[#set math.equation(numbering: n => "(2.4)")
 $ sans(H)_(upright("nat"))^(sans(Q)) \( D divides B \) & =
   bb(E)_(sans(Q)) \[ - log sans(P) \( D divides B \) \] - bb(E)_(sans(Q)_B)
   "KL" \( sans(Q)_(D divides B) bar.v.double sans(P)_(D divides B) \) \,\
bb(E)_(sans(Q)_B) "KL" \( sans(Q)_(D divides B) bar.v.double sans(P)_(D divides B) \) & lt.eq
  log K . $ <eq:conditional-kl>]

 In particular, restriction to an event of $sans(P)$-mass $m > 0$ costs at most $log \( 1 \/ m \)$ in (2.4).
   None of these estimates depends on the cardinality of $B$ or $T$.]
] <lem:entropy-restriction>

#proof[
  The chain rule gives $sans(I)_(upright("nat")) \( T \; B \) lt.eq sans(I)_(upright("nat")) \( T \; A \, B \) =
    sans(I)_(upright("nat")) \( T \; A \) + sans(I)_(upright("nat")) \( T \; B divides A \)$, proving (2.1).
    Apply the chain rule to $sans(H)_(upright("nat")) \( A \, B divides T \)$ in both orders to obtain (2.1).
    Adjoining the indicator of the exceptional event costs at most $log 2$;
    conditioning on its two values gives (2.2). For (2.3), normalize $m$ to a probability law and use
    nonnegativity of its relative entropy from the law of $B$.
    Expanding the conditional relative entropy gives (2.4). Its expectation is at most
    $"KL" \( sans(Q)_(B \, D) bar.v.double sans(P)_(B \, D) \)$,
    which by marginalization is at most $"KL" \( sans(Q) bar.v.double sans(P) \) lt.eq log K$. ◻
]

We call a determination #emph[of zero cost] when the right side of (2.2), divided by $ell$, tends to zero.
  This includes bounded ambiguity between comparable translated grids, provided the translation is recorded.
  When $\| cal(B) \| lt.eq epsilon.alt^(- C)$, vanishing exceptional probability is sufficient for the last term.

#thm([Lemma 2.2.])[
  (Domination and conditioning on typical cells).  #emph[Let $sans(U) \,
    sans(V)$ be probability laws on the same finite space with $sans(U) lt.eq A sans(V)$, $A gt.eq 1$,
    and let $C$ be a finite observation. For $0 < eta < 1$,
#[#set math.equation(numbering: n => "(2.5)")
 $ sans(U)_C { c : sans(U)_C \( c \) < eta sans(V)_C \( c \) } lt.eq eta . $ <eq:conditioning-likelihood>]

 At every other $sans(U)_C$-positive value,
$ sans(U) \( thin dot.op divides C = c \) lt.eq A / eta thin sans(V) \( thin dot.op divides C = c \) . $

 The estimate is independent of the number of values of $C$.]
  #emph[In particular, let $sans(P)$ be a finite law, let $cal(E)$ have mass $m = sans(P) \( cal(E) \) > 0$,
    and put $sans(U) = sans(P) \( thin dot.op divides cal(E) \)$ and $r_C \( c \) =
    sans(P) \( cal(E) divides C = c \)$. Then
#[#set math.equation(numbering: n => "(2.6)")
 $ sans(U)_C \( c \) = frac(sans(P)_C \( c \) r_C \( c \), m) \, wide sans(U)_C { r_C < t } lt.eq t /
   m quad \( t > 0 \) \,\
sans(U) \( thin dot.op divides C = c \) lt.eq r_C \( c \)^(- 1) sans(P) \( thin dot.op divides C = c \) .
  $ <eq:retention-fibers>]

 The last inequality is asserted on positive $sans(U)_C$ fibers.
   Thus for $0 < eta_0 < 1$, outside $sans(U)_C$-mass $eta_0$,
   their domination constants are at most $\( m eta_0 \)^(- 1)$.]
  #emph[Suppose further that $C$ is a function of a finite parent observation $X$, and write $r_X \( x \) =
    sans(P) \( cal(E) divides X = x \)$. On every positive $C = c$ fiber, for $0 < eta_1 < 1$,
#[#set math.equation(numbering: n => "(2.7)")
 $ sans(U) { r_X \( X \) < eta_1 r_C \( c \) divides C = c } lt.eq eta_1 . $ <eq:nested-retention-fibers>]

 Removing these parent values does not change a conditional law given $X$.
   Let $d_(-) lt.eq d_(+)$ be real numbers. If a finite child $Y$ satisfies,
   on every $\( X \, Y \)$ value attained in $cal(E)$,
$ d_(-) lt.eq - ell^(- 1) log sans(P) \( Y divides X \) lt.eq d_(+) \, wide ell = log \( 1 \/ epsilon.alt \) \, $

 then there are at most $epsilon.alt^(- d_(+))$ retained children over each parent, and, with $sans(U)_c =
   sans(U) \( thin dot.op divides C = c \)$,
#[#set math.equation(numbering: n => "(2.8)")
 $ d_(-) - frac(log \( 1 \/ r_C \( c \) \), ell) lt.eq sans(H)^(sans(U)_c) \( Y divides X \) lt.eq
   d_(+) . $ <eq:typical-cell-entropy>]

 More precisely, outside $sans(U)_c$-mass at most $eta_1 + eta_2$,
#[#set math.equation(numbering: n => "(2.9)")
 $ d_(-) - frac(log \( 1 \/ \( eta_1 r_C \( c \) \) \), ell) lt.eq -
   ell^(- 1) log sans(U)_c \( Y divides X \) lt.eq d_(+) + frac(log \( 1 \/ eta_2 \), ell) \, wide
   0 < eta_2 < 1 . $ <eq:typical-cell-surprise>]

 These conclusions concern the retained support and sampled conditional values.
   They assert no lower mass bound for every untrimmed child.]
] <lem:typical-conditioning>

#proof[
  Summing $sans(U)_C \( c \) < eta sans(V)_C \( c \)$ over the indicated values proves (2.5).
    On its complement, divide $sans(U) \( omega \) lt.eq A sans(V) \( omega \)$ by $sans(U)_C \( c \) gt.eq
    eta sans(V)_C \( c \)$. This proves the first part. For an event restriction the displayed identity for
    $sans(U)_C$ is exact. Summing it over $r_C < t$ proves the second assertion in (2.6);
    conditioning on $cal(E)$ inside one $C$ fiber proves the third.
  Because $C$ is determined by $X$, on a positive $C = c$ fiber we have
  $ sans(U)_(X divides c) \( x \) = sans(P)_(X divides c) \( x \) frac(r_X \( x \), r_C \( c \)) . $
  Summing over $r_X < eta_1 r_C \( c \)$ gives (2.7). The original conditional child law on this fiber is still
    $sans(P) \( Y divides X \)$. The upper surprise bound on $cal(E)$ gives $sans(P) \( y divides x \) gt.eq
    epsilon.alt^(d_(+))$ for every retained child, so summing these masses gives the support count.
    Apply Lemma 2 to $sans(U)_c lt.eq r_C \( c \)^(- 1) sans(P) \( thin dot.op divides C = c \)$ for the lower
    bound in (2.8); the support count gives its upper bound.
  For a retained parent,
  $ sans(U)_c \( y divides x \) = frac(sans(P) \( Y = y \, cal(E) divides X = x \), r_X \( x \)) lt.eq
    frac(sans(P) \( y divides x \), r_X \( x \)) . $
  On the parents retained in (2.7), this is at most $epsilon.alt^(d_(-)) \/ \( eta_1 r_C \( c \) \)$.
    On any parent fiber the support count bounds by $eta_2$ the $sans(U)_c$-mass of children with
    $sans(U)_c \( y divides x \) < eta_2 epsilon.alt^(d_(+))$. The two exceptional sets give (2.9). ◻
]

#thm([Lemma 2.3.])[
  (Finite splitting and resampling).  #emph[For any finite tag $Q$,
$ 0 lt.eq sans(H)_(upright("nat")) \( D divides B \) - sans(H)_(upright("nat")) \( D divides B \, Q \) & lt.eq
  sans(H)_(upright("nat")) \( Q \) \,\
\| sans(I)_(upright("nat")) \( T \; D divides Q \) - sans(I)_(upright("nat")) \( T \; D \) \| & lt.eq
  sans(H)_(upright("nat")) \( Q \) \,\
sans(I)_(upright("nat")) \( U \; V divides Z \, Q \) & lt.eq sans(I)_(upright("nat")) \( U \; V divides Z \) +
  sans(H)_(upright("nat")) \( Q \) . $

 The conditional quantities on the left are averages of the quantities on the individual tag fibers.
   If $U \, V$ are conditionally independent given $Z$ under $sans(P)$, and $sans(R) lt.eq K sans(P)$, then
$ sans(I)_(upright("nat"))^(sans(R)) \( U \; V divides Z \) lt.eq log K . $

 Given a joint law of $\( T \, C \, V \)$ and a kernel $kappa \( u divides T \, C \)$,
   one may adjoin $U$ by this kernel while preserving that entire joint law.
   The new $U$ is conditionally independent of $V$ given $\( T \, C \)$,
   and its joint law with $\( T \, C \)$ is the prescribed kernel law.]
] <lem:entropy-splitting>

#proof[
  The first difference equals $sans(I)_(upright("nat")) \( D \; Q divides B \)$. For the second, the chain rule gives
  $ sans(I)_(upright("nat")) \( T \; D divides Q \) - sans(I)_(upright("nat")) \( T \; D \) =
    sans(I)_(upright("nat")) \( T \; Q divides D \) - sans(I)_(upright("nat")) \( T \; Q \) \, $
  the difference of two numbers in $\[ 0 \, sans(H)_(upright("nat")) \( Q \) \]$. Likewise
  $ sans(I)_(upright("nat")) \( U \; V divides Z \, Q \) - sans(I)_(upright("nat")) \( U \; V divides Z \) =
    sans(I)_(upright("nat")) \( U \; Q divides V \, Z \) - sans(I)_(upright("nat")) \( U \; Q divides Z \) lt.eq
    sans(H)_(upright("nat")) \( Q \) . $
  For the dominated law, decompose conditional relative entropy against $sans(P)_(U divides Z) ⊗
    sans(P)_(V divides Z)$ into conditional mutual information plus the two nonnegative marginal relative
    entropies. Its average is at most $"KL" \( sans(R)_(U \, V \, Z) bar.v.double sans(P)_(U \, V \, Z) \) lt.eq
    log K$. Finally the resampled joint law is exactly $sans(P) \( t \, c \, v \) kappa \( u divides t \, c \)$;
    summing and conditioning prove all its stated properties. ◻
]

#thm([Lemma 2.4.])[
  (Finite homogenization).  #emph[Fix a law $sans(P)$, a finite list $\( X_j \, Y_j \)$, $1 lt.eq j lt.eq q$,
    and numbers $A_j gt.eq 0$ such that $\| cal(Y)_j \| lt.eq epsilon.alt^(- A_j)$.
    There is no cardinality assumption on $X_j$. For $a \, sigma \, theta > 0$,
    there are disjoint events $E_z$ whose union has probability at least $1 - q epsilon.alt^sigma - theta$,
    with the following properties. The number of events is at most
$ J = product_(j = 1)^q (1 + ⌈frac(A_j + sigma, a)⌉) \, wide m_z := sans(P) \( E_z \) gt.eq theta \/ J . $

 For each $z \, j$ there is $d_(j \, z) in \[ 0 \, A_j + sigma \]$ such that, on $E_z$,
#[#set math.equation(numbering: n => "(2.10)")
 $ d_(j \, z) lt.eq - ell^(- 1) log sans(P) \( Y_j divides X_j \) lt.eq d_(j \, z) + a . $ <eq:homogeneous-bin>]

 If $sans(R)$ is any law supported on $E_z$ satisfying $sans(R) lt.eq K sans(P) \( thin dot.op divides E_z \)$, then
#[#set math.equation(numbering: n => "(2.11)")
 $ d_(j \, z) - frac(log \( K \/ m_z \), ell) lt.eq sans(H)_(sans(R)) \( Y_j divides X_j \) lt.eq d_(j \, z) +
   a . $ <eq:homogeneous-entropy>]

 More precisely, for every $0 < eta < 1$, outside a set of $sans(R)$-probability at most $2 eta$,
#[#set math.equation(numbering: n => "(2.12)")
 $ d_(j \, z) - frac(log \( K \/ \( m_z eta \) \), ell) lt.eq - ell^(- 1) log sans(R) \( Y_j divides X_j \) lt.eq
   d_(j \, z) + a + frac(log \( 1 \/ eta \), ell) . $ <eq:homogeneous-surprise>]

 There are at most $epsilon.alt^(- \( d_(j \, z) + a \))$ retained $Y_j$ values over each fixed $X_j$ value.
   The support-count assertion and (2.10) are uniform on the retained support,
   before any further restriction is chosen.]
] <lem:homogenization>

#proof[
  For every $x$,
  $ sum_(y : thin sans(P) \( y divides x \) < epsilon.alt^(A_j + sigma)) sans(P) \( y divides x \) lt.eq \|
    cal(Y)_j \| epsilon.alt^(A_j + sigma) lt.eq epsilon.alt^sigma . $
  Discard these tails for the $q$ observations and partition the remaining surprise values into intervals of
    length $a$. This produces at most $J$ cells. Discard cells of mass less than $theta \/ J$;
    their total mass is at most $theta$. This proves the first assertions.
    For each retained $x \, y$, (2.10) gives $sans(P) \( y divides x \) gt.eq epsilon.alt^(d_(j \, z) + a)$,
    so summing over retained $y$ gives the stated count. It follows that the upper entropy bound in (2.11) holds
    under every law on that support. The lower bound follows from (2.4),
    since $sans(R) lt.eq \( K \/ m_z \) sans(P)$ and the original surprise is at least $d_(j \, z) ell$.
  For the pointwise upper bound on conditional masses, discard $x$ for which $sans(R)_(X_j) \( x \) < eta
    sans(P)_(X_j) \( x \)$; their total $sans(R)$-mass is at most $eta$. At all remaining $x$,
  $ sans(R) \( y divides x \) lt.eq frac(K, m_z eta) sans(P) \( y divides x \) lt.eq
    frac(K, m_z eta) epsilon.alt^(d_(j \, z)) . $
  For the reverse surprise bound, on each fiber the total $sans(R)$-mass of values with
    $sans(R) \( y divides x \) < eta epsilon.alt^(d_(j \, z) + a)$ is at most $eta$ by the support count.
    Averaging in $x$ and combining the two exceptional sets proves (2.12). ◻
]

Joint bins give a sharper version for increments. Suppose $G$ is any parent, possibly containing $T$,
  and on retained triples $\( g \, b \, d \)$,

$ epsilon.alt^(b_0 + a) lt.eq sans(P) \( B = b divides G = g \) lt.eq epsilon.alt^(b_0 - a) \, wide
  epsilon.alt^(d_0 + a) lt.eq sans(P) \( B = b \, D = d divides G = g \) lt.eq epsilon.alt^(d_0 - a) . $

Dividing these inequalities gives conditional surprises for $D
  divides \( G \, B \)$ in $\[ d_0 - b_0 - 2 a \, d_0 - b_0 + 2 a \]$ and at most
  $epsilon.alt^(- \( d_0 - b_0 + 2 a \))$ retained children per $\( g \, b \)$.
  Indeed, the sum of the lower joint masses cannot exceed the upper parent mass.
  Lemma 2 therefore bounds entropy errors under a density loss $K$ by $2 a + log K \/ ell$,
  independently of the size or entropy of the parent. These are estimates for retained support and for sampled
  conditional values; no assertion about every untrimmed conditional fiber is needed.

=== 2.2 From small information to explicit product comparisons <from-small-information-to-explicit-product-comparisons>

#thm([Lemma 2.5.])[
  (Zero information and product domination).  #emph[Let $pi$ be a law and let $Lambda$ be a comparison probability
    law with $pi lt.double Lambda$. Write $L = d pi \/ d Lambda$ and $D = "KL" \( pi bar.v.double Lambda \)$.
    For every $v > 0$,
#[#set math.equation(numbering: n => "(2.13)")
 $ pi \( log L > v \) lt.eq frac(D + 1 \/ e, v) . $ <eq:likelihood-tail>]

 Consequently, if $D = o \( ell \)$, there is $v = o \( ell \)$ such that $pi \( log L > v \) = o \( 1 \)$,
   and the remaining subprobability is bounded by $e^v Lambda$. This applies in particular to
$ Lambda \( a \, b \, c \) = pi_C \( c \) pi_(A divides C) \( a divides c \) pi_(B divides C) \( b divides c \) \,
  wide D = sans(I)_(upright("nat"))^pi \( A \; B divides C \) . $

 Conversely, if a probability law $rho$ satisfies $rho lt.eq K product_(i = 1)^k mu_i$, then
#[#set math.equation(numbering: n => "(2.14)")
 $ "KL" (rho mid(bar.v.double) product_i rho_i) lt.eq log K . $ <eq:product-information>]

]
] <lem:zero-information>

#proof[
  Since $x log \( 1 \/ x \) lt.eq 1 \/ e$ on $0 lt.eq x lt.eq 1$, $bb(E)_pi \( log L \)_(-) lt.eq 1 \/ e$.
    Thus $bb(E)_pi \( log L \)_(+) lt.eq D + 1 \/ e$, and Markov’s inequality gives (2.13).
    For example, when $ell arrow.r oo$ and $D = o \( ell \)$ take $v = sqrt(\( D + 1 \) ell)$. For the converse, expand
  $ "KL" (rho mid(bar.v.double) product_i mu_i) = "KL" (rho mid(bar.v.double) product_i rho_i) +
    sum_i "KL" \( rho_i bar.v.double mu_i \) lt.eq log K . $
  ◻
]

#thm([Lemma 2.6.])[
  (Simultaneous replacement by actual marginals).  #emph[Let $nu$ be a subprobability of mass $m >
    0$ on a finite space. For $1 lt.eq l lt.eq r$, suppose a tuple of observations
    $\( F_(l 1) \, dots.h \, F_(l k_l) \)$ satisfies
#[#set math.equation(numbering: n => "(2.15)")
 $ nu_(F_(l 1) \, dots.h \, F_(l k_l)) lt.eq A_l product_(j = 1)^(k_l) mu_(l j) \, $ <eq:core-comparison>]

 where every $mu_(l j)$ is a specified probability law. Put $q = sum_l k_l$.
   Repeated occurrences of an observation with different comparison laws are counted separately.
   For $0 < eta < m \/ q$ there is a restriction $nu'$ of $nu$, of mass $M gt.eq m - q eta$, such that $rho =
   nu' \/ M$ satisfies all the bounds
#[#set math.equation(numbering: n => "(2.16)")
 $ rho_(F_(l 1) \, dots.h \, F_(l k_l)) lt.eq A_l M^(k_l - 1) eta^(- k_l) product_(j = 1)^(k_l) rho_(F_(l j)) .
   $ <eq:core-actual>]

 Support counts persist, and every marginal mass upper bound for $nu$ persists for $rho$ with the factor
   $M^(- 1)$. In particular, taking $eta = m \/ \( 2 q \)$ retains mass at least $m \/ 2$.]
] <lem:marginal-core>

#proof[
  Starting with $nu$, repeatedly remove all points with $F_(l j) =
    v$ whenever its current positive marginal is less than $eta mu_(l j) \( v \)$.
    Once a value is removed its marginal remains zero, so this procedure terminates.
    Charge the mass removed at such a step to the pair $\( \( l \, j \) \, v \)$.
    Each pair is charged at most once, by less than $eta mu_(l j) \( v \)$; summing proves the loss bound $q eta$.
    On every surviving factor value, $mu_(l j) \( v \) lt.eq nu'_(F_(l j)) \( v \) \/ eta =
    M rho_(F_(l j)) \( v \) \/ eta$. The old upper bounds hold for the restricted subprobability.
    Insert these factor inequalities into (2.15) and divide by $M$ to obtain (2.16).
    Restriction can only remove support, and normalization has precisely the claimed effect on masses. ◻
]

The next theorem specifies the laws compared when labels are fixed.
  A point may be an exact finite particle or a tuple of spatial observations.
  Additional finite tags may be included in a label.

#thm([Theorem 2.7.])[
  (Finite stars and conditioning with named comparison laws).  #emph[Let $pi \( p \, b \)$ be a probability law
    with $mu = pi_P$, $lambda = pi_B$. Let $E$ be an allowed set with $pi \( E \) gt.eq 1 - zeta$ and suppose
#[#set math.equation(numbering: n => "(2.17)")
 $ bold(1)_E \( p \, b \) pi \( p \, b \) lt.eq K mu \( p \) lambda \( b \) \, wide K gt.eq 1 . $ <eq:pair-product>]

 Choose $0 < alpha < 1$ with $zeta < 1 - alpha$, retain only point fibers with $r \( p \) :=
   pi \( E divides P = p \) gt.eq alpha$, and normalize the pairs in these fibers and in $E$ to a law $q$.
   Its retained mass $M_0$ satisfies
#[#set math.equation(numbering: n => "(2.18)")
 $ M_0 gt.eq 1 - frac(zeta, 1 - alpha) \, wide q \( p \, b \) lt.eq M_0^(- 1) pi \( p \, b \) \, wide
   q \( b divides p \) lt.eq c lambda \( b \) \, quad c := K \/ alpha . $ <eq:star-kernel>]

 For a fixed integer $n gt.eq 1$, sample $B_1 \, dots.h \,
   B_n$ independently given $P$ with kernel $q \( b divides p \)$, and let
$ S \( p \, b_1 \, dots.h \, b_n \) = q_P \( p \) product_(i = 1)^n q \( b_i divides p \) . $

 The following are comparison probability laws on the whole star:
#[#set math.equation(numbering: n => "(2.19)")
 $ Lambda_0 & = q_P ⊗ lambda^(⊗ n) \, & S & lt.eq c^n Lambda_0 \,\
Lambda_i & = q_(P \, B_i) ⊗ ⨂_(j eq.not i) lambda_(B_j) \, & S & lt.eq
  c^(n - 1) Lambda_i quad \( 1 lt.eq i lt.eq n \) . $ <eq:star-independent>]

 Here $q_(P \, B_i)$ is a copy of the retained pair law $q$.
   It may be replaced by the original $pi$ in (2.19) at the additional cost $M_0^(- 1)$.]
  #emph[Let $R = w S \/ m$, where $0 lt.eq w lt.eq 1$ and $m = bb(E)_S w > 0$.
    Fix an index set $J subset { 1 \, dots.h \, n }$ of #emph[fixed labels]; write $F = { 1 \, dots.h \,
    n } \\ J$ for the #emph[free labels]. Choose any observation
$ C = \( B_J \, Z \) \, wide Z = f \( P \, B_J \) . $

 Thus the function defining $Z$ involves the point and the fixed labels only.
   For every $0 < eta < 1 \/ \( n + 1 \)$, there is a set of $C$ values of $R_C$-mass at least $1 - \( n + 1 \)
   eta$ on which, simultaneously,
#[#set math.equation(numbering: n => "(2.20)")
 $ R \( thin dot.op divides C \) & lt.eq frac(c^n, m eta) Lambda_0 \( thin dot.op divides C \) \,\
R \( thin dot.op divides C \) & lt.eq frac(c^(n - 1), m eta) Lambda_i \( thin dot.op divides C \) \, quad 1 lt.eq
  i lt.eq n . $ <eq:conditional-independent>]

 For a fixed value $C = \( b_J \, z \)$, put $z_(b_J) \( p \) = f \( p \, b_J \)$.
   Ignoring the deterministic coordinates $B_J$, these comparison laws are exactly
#[#set math.equation(numbering: n => "(2.21)")
 $ Lambda_0 \( thin dot.op divides b_J \, z \) & = q_P \( thin dot.op divides z_(b_J) \( P \) = z \) ⊗ ⨂_(j in F)
   lambda_(B_j) \,\
Lambda_i \( thin dot.op divides b_J \, z \) & =
  q_P \( thin dot.op divides B_i = b_i \, z_(b_J) \( P \) = z \) ⊗ ⨂_(j in F) lambda_(B_j) \, &  & i in J \,\
Lambda_i \( thin dot.op divides b_J \, z \) & =
  q_(P \, B_i) \( thin dot.op divides z_(b_J) \( P \) = z \) ⊗ ⨂_(j in F \\ { i }) lambda_(B_j) \, &  & i in F .
  $ <eq:fixed-comparison-zero>]

 Conditionals in this display need only be defined when their conditioning event has positive comparison mass;
   the inequalities hold at every $R$-positive value under consideration.]
  #emph[There is also a direct comparison using the actual point marginal.
    There is a set $G$ of $\( P \, C \)$ values with $R \( G \) gt.eq 1 - eta$ such that, for every $C$ value,
    as an inequality of subprobabilities,
#[#set math.equation(numbering: n => "(2.22)")
 $ bold(1)_G \( p \, C \) R \( p \, b_F divides C \) lt.eq
   frac(c^(\| F \|), m eta) R_P \( p divides C \) product_(j in F) lambda \( b_j \) . $ <eq:actual-point-free>]

 For $0 < tau < 1$, outside $C$ values of $R_C$-mass at most $eta \/ tau$,
   the subprobability on the left has mass at least $1 - tau$.
   In any of these conditionals, all applicable product comparisons,
   including product comparisons for coordinate tuples at several fixed labels,
   may be converted #emph[simultaneously] to comparisons using their actual retained marginals by Lemma 7.
   If the subprobability after all prior trims, including intersection with $G$ when used,
   has conditional mass $u$ and the resulting list has $N_(upright("fac"))$ factor occurrences,
   its core has conditional mass at least $u \/ 2$ and each $k$-factor comparison constant $A$ becomes at most
   $A \( 2 N_(upright("fac")) \/ u \)^k$. All exceptional-mass and domination estimates above are independent of
   the number of possible values of $C$, $P$, and the labels.]
] <thm:finite-conditioning>

#proof[
  The probability under $mu$ of $r \( P \) < alpha$ is at most $zeta \/ \( 1 - alpha \)$.
    More exactly, on that set, $r lt.eq alpha \( 1 - r \) \/ \( 1 - alpha \)$, whence
  $ M_0 = bb(E)_mu r - bb(E)_mu \[ r bold(1)_(r < alpha) \] gt.eq 1 - zeta - frac(alpha zeta, 1 - alpha) = 1 -
    frac(zeta, 1 - alpha) . $
  On retained point fibers, $q \( b divides p \) = pi \( b divides p \) bold(1)_E \( p \, b \) \/ r \( p \)
    lt.eq \( K \/ alpha \) lambda \( b \)$. Multiplying the $n$ kernel bounds proves (2.19).
    Leaving the $i$th pair unestimated and bounding the other $n - 1$ kernels proves (2.19).
  Apply Lemma 3 to $sans(U) = R$ and each of $sans(V) = Lambda_0 \, dots.h \, Lambda_n$, with $A =
    c^n \/ m$ or $c^(n - 1) \/ m$. A union bound proves (2.20)–(2.20).
    The factorizations (2.21)–(2.21) follow by inserting $B_J = b_J$ and $z_(b_J) \( P \) =
    z$ in the displayed product laws. No factor depending on a free label is conditioned on except the pair factor
    in (2.21).
  For (2.22), independence in $S$ gives
  $ S \( p \, b_F \, C \) = S_(P \, C) \( p \, C \) product_(j in F) q \( b_j divides p \) . $
  Apply (2.5) to the marginals $R_(P \, C) \, S_(P \, C)$ and set $G = { R_(P \, C) gt.eq eta S_(P \, C) }$.
    Using $R lt.eq S \/ m$ and the kernel bounds gives
  $ bold(1)_G R \( p \, b_F \, C \) lt.eq frac(c^(\| F \|), m eta) R_(P \, C) \( p \, C \) product_(j in F)
    lambda \( b_j \) . $
  Divide by $R_C \( C \)$. Since $R \( G^c \) lt.eq eta$, Markov’s inequality bounds by $eta \/
    tau$ the mass of conditionals losing more than $tau$. Apply Lemma 7 to the subprobability in each selected
    conditional, with its complete finite list of factor comparisons and threshold
    $u \/ \( 2 N_(upright("fac")) \)$. Its mass $M lt.eq 1$ makes the bound in (2.16) at most
    $A \( 2 N_(upright("fac")) \/ u \)^k$. ◻
]

We spell out two consequences of the theorem to make its uses precise. First, take $Z$ trivial and $i in J$.
  For typical fixed values $b_J$,

#[#set math.equation(numbering: n => "(2.23)")
 $ R_P \( thin dot.op divides B_J = b_J \) lt.eq frac(c^(n - 1), m eta) q_P \( thin dot.op divides B_i = b_i \) .
   $ <eq:fixed-pair-inheritance>]

Thus if at label $b_i$ a coordinate tuple $Phi_i \( P \)$ has a bound $q_(Phi_i divides b_i) lt.eq
  A_i product_l mu_(i l)$, its law after fixing all of $B_J$ has bound $c^(n - 1)
  A_i \/ \( m eta \)$ against exactly those factors. This is true for every $i in J$ simultaneously.
  Applying the core lemma to the combined list supplies actual marginals for all of them in one retained law.
  Counts on the original pair support are preserved. If $Z$ is nontrivial,
  the comparison is instead the conditional law $q_P \( thin dot.op divides B_i = b_i \, z_(b_J) \( P \) = z \)$
  in (2.21); additional coordinate product bounds must be conditioned by (2.5),
  with their factors explicitly identified.

Second, suppose $rho \( a \, b \) lt.eq K mu \( a \) lambda \( b \)$ and $C = f \( A \)$.
  Outside $rho_C$-mass at most $eta$,

#[#set math.equation(numbering: n => "(2.24)")
 $ rho \( a \, b divides C = c \) lt.eq K / eta mu \( a divides C = c \) lambda \( b \) . $ <eq:parent-product>]

The measure on children is the original $mu$ conditioned on its parent;
  there is no factor $mu_C \( c \)^(- 1)$ in addition to the displayed likelihood loss.
  Any number of parent cells, in particular polynomially many, is allowed.
  Subsequent simultaneous marginal replacement uses the actual child and parameter populations retained in that
  cell. An observation depending on a free label does not have the factorization used in (2.22);
  it must first be included among fixed labels or handled by a separately verified comparison law.

For example, if a final retained point law has

$ rho_(X \, U_0) lt.eq A rho_X rho_(U_0) \, wide rho_(X \, N \, L \, Z) lt.eq B rho_X rho_(N \, L) rho_Z \, $

then conditioning the second inequality on $\( X \, N \) = \( x \, n \)$ gives

#[#set math.equation(numbering: n => "(2.25)")
 $ rho \( l \, z divides x \, n \) lt.eq B frac(rho_X \( x \) rho_N \( n \), rho_(X \, N) \( x \, n \))
   rho \( l divides n \) rho_Z \( z \) . $ <eq:full-precision-slice>]

The factor in the fraction exceeds $1 \/ eta$ on a set of $rho_(X \, N)$-mass at most $eta$.
  This follows by summing $rho_(X \, N) \( x \, n \)$ over the exceptional values,
  so it is valid also for labels recorded at the finest precision.
  The first displayed comparison remains available on the same law;
  it is not replaced by a marginal from an earlier trim.

#thm([Corollary 2.8.])[
  (Point slicing after a fixed-label core).  #emph[Fix the values of some labels.
    On that fiber let $nu$ be a retained probability law of a point $P$ and free labels $\( B_j \)_(j in F)$, with
$ nu lt.eq A nu_P ⊗ ⨂_(j in F) lambda_j . $

 The comparison laws $lambda_j$ may be the actual marginals obtained by a simultaneous core on this fiber.
   If $Z = f \( P \)$, then on every positive $Z$ fiber,
$ nu \( p \, b_F divides Z = z \) lt.eq A nu_P \( p divides Z = z \) product_(j in F) lambda_j \( b_j \) . $

 Thus the comparison label populations are those #emph[before] the point slice,
   and any mass upper bounds already proved for them remain available.
   After a further restriction and core of conditional mass $M > 0$,
   each new actual label marginal is bounded by $A \/ M$ times its respective $lambda_j$.]
] <cor:point-slicing>

#proof[
  The comparison $Z$ marginal equals $nu_Z$, so restricting to a $Z$ fiber and dividing by this common mass proves
    the assertion. Integrating the point and other labels proves the marginal upper bound before the final
    restriction; restriction and normalization cost at most $M^(- 1)$. ◻
]

All these conclusions concern a fixed finite star. They supply no lower bound for the density of an arbitrary
  graph of cyclic incidences. If $K$, $M_0^(- 1)$, $m^(- 1)$, $u^(- 1)$,
  $eta^(- 1)$ and $alpha^(- 1)$ have logarithms $o \( ell \)$ and $n \, N_(upright("fac"))$ are fixed,
  every displayed loss is $epsilon.alt^(- o \( 1 \))$. For a normalized retained incidence law $rho lt.eq
  A mu ⊗ lambda$, its support has $\( mu ⊗ lambda \)$-mass at least $A^(- 1)$,
  simply by integrating the domination inequality. This is the dense-graph conclusion used in the projection theorem.

=== 2.3 Countable profiles and the order of the limits <countable-profiles-and-the-order-of-the-limits>

The use of entropy at successive resolutions is related to the local entropy averages and comparable-partition
  arguments of #cite(label("HochmanShmerkin2012"), form: "prose") Sections 3.3 and 4.2 and
  #cite(label("Hochman2014"), form: "prose") Section 3. Here we need a finite-law diagonal with explicit retention
  properties, which we establish directly.

A conditional observation is #emph[homogeneous with exponent $d$] if its realized conditional surprise,
  divided by $ell$, converges to $d$ in probability and its normalized conditional entropy also converges to $d$.
  When further restrictions will be made, we first retain the uniform bins of Lemma 5.
  Convergence in probability by itself is insufficient for this purpose.
  For example, let $ell arrow.r oo$, give one atom mass $1 - e^(- sqrt(ell))$,
  and distribute the remaining mass uniformly among $ceil.l e^ell ceil.r$ atoms.
  Normalized surprise converges to zero in probability, but restriction to the latter atoms has density
  $e^(sqrt(ell))$ and entropy tending to one in normalized units.
  The support and bin requirements in Lemma 5 exclude precisely this issue.

#thm([Lemma 2.9.])[
  (Profiles, countable homogenization, and diagonals).  #emph[The following three statements hold.]
  + #emph[Suppose for each $epsilon.alt arrow.r 0$ there is a countable list $\( X_j \, Y_j \)_(j gt.eq 1)$,
    with $\| cal(Y)_j \| lt.eq epsilon.alt^(- A_j)$ for each fixed $j$.
    One can partition all but $o \( 1 \)$ of the law into $epsilon.alt^(- o \( 1 \))$ parts,
    each of mass at least $epsilon.alt^(o \( 1 \))$, such that the following holds.
    From any choice of one retained part at each scale, a subsequence can be extracted on which every listed
    observation is homogeneous. The same exponents are inherited by every sequence of laws supported on those
    parts whose density relative to their normalized laws is at most $epsilon.alt^(- o \( 1 \))$.
    The assertion is simultaneous for joint observations and observations conditional on an exact particle index,
    when these are included in the list.]
  + #emph[Let $v$ range over a compact rectangle of depth parameters.
    Suppose observations $Y_v$, conditional on any $X$, obey, uniformly for fixed $u \, v$, the two ambiguity bounds
$ log N \( Y_v divides Y_u \, X \) \, med log N \( Y_u divides Y_v \, X \) lt.eq C ell parallel u - v parallel_1 +
  o \( ell \) \, $

 and have bounded normalized alphabet sizes at one reference depth.
   Their normalized entropy profiles have subsequences converging on all depths to a $C$-Lipschitz function,
   after extraction on a countable dense set. Homogeneous surprise exponents on that dense set extend to the same
   function at every fixed depth, provided the ambiguity bounds also hold on the retained support.]
  + #emph[Suppose a finite construction at each fixed $h > 0$ has finitely many normalized errors tending to zero
    as $epsilon.alt arrow.r 0$. Given any sequence of permissible $h_k arrow.b 0$,
    and any countable sequence of such requirements, a diagonal can be chosen so that the first $k$ requirements
    have errors at most $h_k \/ k$ and $h_k log \( 1 \/ epsilon.alt_k \) arrow.r oo$.
    Thus errors may be made $o \( h \)$ before passing to the scale $epsilon.alt^h$.
    This assertion supplies no rate uniform in $h$ or in the limiting profile.]
] <lem:profile-diagonal>

#proof[
  For the first assertion, apply Lemma 5 to lists of length $q_k arrow.t oo$, meshes $a_k arrow.b 0$, and,
    for example, $sigma = 1$, $theta_k arrow.b 0$. At stage $k$ the number $J_k$ is finite and independent of
    $epsilon.alt$. Choose the stages sufficiently slowly that $q_k epsilon.alt arrow.r
    0$ and $log \( J_k \/ theta_k \) = o \( ell \)$. The discarded mass tends to zero and every retained part has
    the claimed lower mass. For each fixed $j$ the bin centers stay in the compact interval $\[ 0 \, A_j + 1 \]$.
    Successive extraction and a diagonal make all those centers converge.
    Equations (2.11) and (2.12), with $eta arrow.b 0$ sufficiently slowly and $log \( 1 \/ eta \) = o \( ell \)$,
    prove homogeneity. The same estimates prove its asserted inheritance for any dominated sequence;
    no exceptional set from before binning is reused. All bounds depend on the child alphabets only.
  For the second assertion, the chain rule bounds the difference of conditional entropies by the two ambiguity
    logarithms. A bounded sequence of profiles therefore has, by diagonal extraction on a dense countable set,
    a limit satisfying the Lipschitz inequality there. Extend it continuously.
    Approximation of any fixed parameter by dense parameters and the same inequality proves convergence there.
    For surprises, the identity
  $ - log sans(P) \( Y_v divides X \) + log sans(P) \( Y_u divides X \) = -
    log sans(P) \( Y_v divides Y_u \, X \) + log sans(P) \( Y_u divides Y_v \, X \) $
  is exact at sampled values. For an observation with at most $N$ values on each conditional fiber,
    the conditional-surprise tail above $log N + t$ has probability at most $e^(- t)$,
    by summing masses less than $e^(- t) \/ N$. Apply this to both terms.
    Since conditional surprises are nonnegative, their difference in absolute value is at most the larger of their
    two upper bounds outside probability $2 e^(- t)$. Take, for instance, $t = sqrt(ell)$,
    then approximate $v$ by the dense set. This proves the assertion about surprise.
  For the last assertion, fix $h_k$ first. The defining small-parameter convergences give a sufficiently small
    $epsilon.alt_k$ for the first $k$ errors to be at most $h_k \/ k$.
    Decrease $epsilon.alt_k$ further so that $h_k log \( 1 \/ epsilon.alt_k \) gt.eq
    k$ and the scales decrease strictly. This inductive choice proves the claim.
    If a profile must first be chosen and differentiated, choose its regular points and admissible $h_k$ before
    making this final small-parameter selection. ◻
]

In applications with a block length $h$, “subpower loss” means $log K = o \( h ell \)$, not merely $o \( ell \)$.
  For example the logarithm of a conditional $k$-factor core constant in Theorem 8 is bounded by a fixed linear
  combination of

$ n log \( K \/ alpha \) \, quad log \( 1 \/ M_0 \) \, quad log \( 1 \/ m \) \, quad log \( 1 \/ eta \) \, quad
  k log \( 2 N_(upright("fac")) \/ u \) . $

These quantities must be chosen $o \( h ell \)$ with $h$ fixed first.
  The finite numbers of observations and replicas are also fixed at that stage.
  Lemma 10 then permits increasing them slowly and shrinking $h$ afterwards.
  When an increment has a much larger parent entropy, (2.4) and the uniform child counts give the same $o \( h \)$
  error without multiplying by that parent entropy.

Finally, the use of universal bounds after conditioning is a selection principle for a specified array of
  conditional laws. At each scale fix a class $cal(A)_epsilon.alt$ of laws and parameters such that every sequence
  selected from these classes is admissible for the asserted universal bound.
  In particular, all vanishing-error hypotheses must have common deterministic envelopes within the array:
  a hypothesis $log K = o \( ell \)$ is represented there by $log K lt.eq
  r_epsilon.alt ell$ with one $r_epsilon.alt arrow.r 0$. If $F_epsilon.alt \( sans(P) \, theta.alt \)$ has $limsup
  F_epsilon.alt lt.eq 0$ along every such selected sequence, then

$ sup_(\( sans(P) \, theta.alt \) in cal(A)_epsilon.alt) F_epsilon.alt \( sans(P) \, theta.alt \) lt.eq o \( 1 \) . $

Otherwise choose a violating law and parameter at each of a sequence of scales.
  The same upper bound holds for any average over conditional laws in this array,
  regardless of the number of conditioning cells. The envelopes may depend on the construction;
  this argument asserts no uniform convergence over all possible sequences satisfying an unspecified subpower
  condition. When the universal statement is initially given for fixed parameters,
  this argument requires stability under convergent parameters; compactness alone does not supply that stability.
  The geometric applications below verify it by bounded box enlargements and
  $O \( parallel theta.alt - theta.alt' parallel \)$ changes in depth weights.

== 3 The planar projection estimate <sec:projection>

The geometric input is the discrete planar Furstenberg theorem of Ren and Wang.
  We state precisely the consequence used below, including weighted populations, extra parameter labels,
  and incomplete incidence graphs. No restriction estimate in three dimensions is used as an input.

For a bounded set $E$, let $lr(||) E_rho$ denote the number of half-open dyadic $rho$-squares meeting $E$,
  where replacing a scale by a comparable dyadic scale is harmless.
  A finite family of dyadic $rho$-squares $cal(P)$ is a $\( rho \, d \, C \)$-set if

$ \# { p in cal(P) : p ∩ B \( z \, r \) eq.not diameter } lt.eq C r^d \# cal(P) \, wide rho lt.eq r lt.eq 1 \, $

up to a fixed enlargement of the ball. We use dyadic tubes in a fixed bounded slope chart.
  The same definition for tubes refers to their slope–intercept parameters.
  For tubes meeting one fixed $rho$-square, this nonconcentration condition is equivalent, within fixed factors,
  to the corresponding condition on slopes.

#thm([Theorem 3.1.])[
  (Ren–Wang, discrete form).  #emph[Fix $0 < s lt.eq 1$, $0 < d lt.eq 2$, and $alpha > 0$.
    There are $eta_0 = eta_0 \( alpha \, s \, d \) > 0$ and $rho_0 =
    rho_0 \( alpha \, s \, d \) > 0$ with the following property.
    Suppose $cal(P)$ is a nonempty $\( rho \, d \, rho^(- eta_0) \)$-set of squares, with $0 < rho < rho_0$.
    For each $p in cal(P)$, let $cal(T) \( p \)$ be a family of tubes meeting $p$,
    of cardinality comparable to $M$, and forming a $\( rho \, s \, rho^(- eta_0) \)$-set. Then
#[#set math.equation(numbering: n => "(3.1)")
 $ \# union.big_(p in cal(P)) cal(T) \( p \) gt.tilde_alpha rho^(- min { 1 \, d \, \( d + s \) \/ 2 } + alpha) M .
   $ <eq:ren-wang-discrete>]

 The statement is unchanged by fixed bounded domains, finitely many coordinate charts,
   or fixed-factor enlargements of the grids and tubes, after decreasing $eta_0 \, rho_0$ if necessary.]
] <thm:ren-wang>

This is Theorem 4.1 of #cite(label("RenWang2025"), form: "prose"),
  expressed using its Definition 3.1 of a nice configuration.
  That definition already permits each $cal(T) \( p \)$ to be a selected subfamily of the tubes meeting $p$.
  The reduction below additionally handles probability weights, auxiliary tags that may share a slope,
  and incidence graphs of positive product mass. The fixed-factor variants follow by taking comparable dyadic
  scales, covering by boundedly many grid pieces, and absorbing the resulting fixed constants into the input loss.
  The order of the quantifiers is important: the desired output loss $alpha$ is fixed before the admissible input
  loss $eta_0$.

A tag is a slope together with any auxiliary labels; distinct tags may have the same slope.
  Keeping the full tag allows its set of neighboring points to depend on that additional information.

#thm([Theorem 3.2.])[
  (Weighted projection bound with parameter tags).  #emph[Fix $0 < d lt.eq 2$, $0 < s lt.eq 1$, and $alpha > 0$,
    and fixed bounded point and slope domains. There are $eta > 0$ and $rho_1 >
    0$ such that the following holds for $0 < rho < rho_1$. Let $mu$ be a finite probability population of points
    in $bb(R)^2$. Let $nu$ be a finite probability population of tags $b$,
    with a slope $a \( b \)$ assigned to each tag. Suppose
#[#set math.equation(numbering: n => "(3.2)")
 $ mu \( B \( z \, r \) \) & lt.eq rho^(- eta) r^d \, & \( a_(*) nu \) \( I \) & lt.eq
   rho^(- eta) r^s $ <eq:projection-populations>]

 for all balls and intervals of radius or length comparable to $r in \[ rho \, 1 \]$.
   Let $G$ be a graph of point–tag incidences with $\( mu times nu \) \( G \) gt.eq rho^eta$.
   For each tag $b$, suppose that the projection $pi_(a \( b \)) \( x \)$ of its neighbors can be covered by at
   most $M$ intervals of length $rho$. Here $pi_a \( x_1 \, x_2 \) = x_2 - a x_1$.
   One may multiply these maps by scalars whose absolute values have fixed positive lower and upper bounds. Then
#[#set math.equation(numbering: n => "(3.3)")
 $ M gt.eq rho^(- min { 1 \, d \, \( d + s \) \/ 2 } + alpha) . $ <eq:weighted-projection-finite>]

 Changing the implicit fixed factors in the domains, projections, and interval lengths changes only $eta \, rho_1$.]
  #emph[In particular, along any sequence with subpower nonconcentration constants,
    graph product mass $rho^(o \( 1 \))$, and conditional projection count at most $rho^(- l - o \( 1 \))$, one has
#[#set math.equation(numbering: n => "(3.4)")
 $ l gt.eq min { 1 \, d \, \( d + s \) \/ 2 } . $ <eq:weighted-projection-limit>]

 The limiting assertion for $d = 0$ is immediate.]
] <thm:planar-projection>

#proof[
  Absorb any allowed scalar factors into the interval lengths, and use $pi_a \( x_1 \, x_2 \) = x_2 - a x_1$.
    Normalized orthogonal projections also have this form on boundedly many direction charts,
    after an orthogonal coordinate change and such a bounded scalar factor.
    Write $q = \( mu times nu \) \( G \)$, and independently sample
  $ N = ceil.l rho^(- d) ceil.r quad upright("points") \, wide Q = ceil.l rho^(- s) ceil.r quad
    upright("whole tags") . $
  The tags, including any information besides their slope, are sampled without alteration.
  We give the finite loss accounting. In this proof $C$ denotes a fixed numerical constant,
    enlarged a finite number of times; it does not depend on $rho \, eta$, or the population cardinalities.
    For fixed $eta > 0$ and sufficiently small $rho$, the sampled multisets have,
    simultaneously for all dyadic balls or intervals at scales between $rho$ and $1$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ \# { x_i in B \( z \, r \) } & lt.eq C rho^(- 3 eta) \( r \/ rho \)^d \,\
\# { a \( b_j \) in I } & lt.eq C rho^(- 3 eta) \( r \/ rho \)^s . $ <eq:sampled-point-count>]
  Moreover, the failure probability is smaller than every fixed power of $rho$.
    Indeed each count is binomial, its expectation is bounded by $rho^(- eta) N r^d$, or $rho^(- eta) Q r^s$,
    and the displayed threshold has an additional factor at least a fixed multiple of $rho^(- 2 eta)$.
    The standard exponential Markov estimate
  $ bb(P) \( X gt.eq t \) lt.eq \( e thin bb(E) X \/ t \)^t \, wide t gt.eq bb(E) X \, $
  follows by applying Markov’s inequality to $exp \( theta X \)$ and optimizing $theta$.
    Here the smallest nonvacuous threshold is a positive multiple of $rho^(- 3 eta)$.
    A union bound over the polynomially many dyadic cells and scales proves the assertion.
    Every ball or interval is covered by boundedly many such cells of comparable scale.
  The expected sampled edge count is $q N Q$, whereas its maximum is $N Q$.
    The occupancy failure event therefore contributes at most $o \( q N Q \)$ to this expectation.
    Some sample obeys (3.5)–(3.5) and has at least $q N Q \/ 2$ edges.
    Delete point vertices of degree less than $q Q \/ 4$. At least $q N Q \/ 4$ edges remain,
    hence there are at least $q N \/ 4$ remaining point vertices.
  A finest point square contains at most $C rho^(- 3 eta)$ sampled vertices.
    Keep one remaining vertex in each occupied square; the resulting point-square family has cardinality at least
    $C^(- 1) q rho^(3 eta) N$. Each selected vertex still has at least $q Q \/ 4$ incident sampled tags.
  For a tag and one of its allowed projection intervals, its slope and projection bin specify a tube through the
    corresponding incident point. Rounding these data to the tube grid and using a bounded enlargement costs only
    fixed factors. At one selected point square, only boundedly many different intercept bins in a fixed slope bin
    can give tubes through that square. By (3.5), a tube there can be represented by at most $C
    rho^(- 3 eta)$ of the sampled tags, up to the same bounded neighboring-bin multiplicity.
    Remove such coincidences. Each selected point is incident to at least $C^(- 1) q rho^(3 eta) Q$ distinct tubes.
  Pigeonhole the point vertices according to dyadic ranges of this last degree.
    There are $O \( log \( 1 \/ rho \) \)$ ranges. Keep a range containing at least that fraction of the selected
    points, and prune the tube families to a common size $M_0$ within a factor of two.
    For small $rho$, all these operations give
  #[#set math.equation(numbering: n => "(3.6)")
   $ \# cal(P) gt.eq rho^(C eta) N \, wide M_0 gt.eq rho^(C eta) Q . $ <eq:projection-retained-sizes>]
  The original sampled count bounds remain upper bounds on every retained subset.
    Dividing them by the retained cardinalities in (3.6) proves that $cal(P)$ is a
    $\( rho \, d \, rho^(- C eta) \)$-set and every $cal(T) \( p \)$ is a $\( rho \, s \, rho^(- C eta) \)$-set.
    The constants can be taken uniform through the finite grid changes.
  On the other hand, each of the $Q$ sampled tags has at most $M$ allowed projection bins,
    so the total number of distinct tubes is at most $C Q M$. Put
  $ chi = min { 1 \, d \, \( d + s \) \/ 2 } . $
  Apply Theorem 11 with output loss $alpha \/ 4$. Choose $eta$ sufficiently small that $C eta <
    eta_0 \( alpha \/ 4 \, s \, d \)$ and $C eta < alpha \/ 4$,
    and then choose $rho_1$ sufficiently small for all preceding bounds and fixed constants. The theorem yields
  $ C Q M gt.tilde_alpha rho^(- chi + alpha \/ 4) M_0 gt.eq rho^(- chi + alpha \/ 4 + C eta) Q . $
  Absorbing the fixed constants by another loss less than $alpha \/ 2$ gives (3.3).
  For the last assertion, apply the finite theorem at any fixed $alpha > 0$.
    Its hypotheses eventually hold because their losses are subpower.
    Comparison with the assumed projection count gives $l gt.eq chi - alpha$; let $alpha arrow.b 0$. ◻
]

#prodef([Remark 3.3.])[
  (Incidence laws and conditional applications).  Often an incidence graph is supplied by a trimmed subprobability
    $sigma$ rather than directly by $mu times nu$. If $sigma \( G \) gt.eq m$ and $sigma lt.eq K mu times nu$, then
  $ \( mu times nu \) \( G \) gt.eq m \/ K . $
  Thus subpower mass and subpower product domination give exactly the graph hypothesis of Theorem 12.
    Uniform lower bounds on retained conditional atom masses give the required projection support counts.
    Uniform upper bounds at every fixed prefix, followed by a sufficiently fine finite scale mesh,
    give the required ball-mass bounds. The conditioning and homogenization results in Section 2 justify those
    operations when applied in the prescribed order. In each application below we specify which point population
    and parameter population are being compared; an entropy lower bound without this uniformization is not a
    substitute for (3.2).
] <rem:projection-incidence-laws>

== 4 Extremal positive transport and its aspect <sec:classical-extremality>

Fix $0 < gamma < 1$, and put

$ w \( b \, a \) = \( 1 + gamma \) b + \( 1 - gamma \) a = a + b - gamma \( a - b \) \, wide 0 lt.eq b lt.eq a . $

All entropies in this section are divided by $log \( 1 \/ epsilon.alt \)$.
  The particle $T$ is a random variable carrying two bounded vectors $V \( T \) \, A \( T \) in bb(R)^2$;
  its position at time $c$ is $X \( c \) = A + c V$. The bounded real variable $c$ may have any joint law with
  $T$. The observations used below are finite. For a finite label $Y$ and arbitrary $T$,
  $sans(H) \( Y divides T \)$ denotes the average entropy of the conditional probabilities
  $bb(E) \[ upright(bold(1))_({ Y = y }) divides sigma \( T \) \]$, divided by $log \( 1 \/ epsilon.alt \)$,
  and $sans(I) \( T \; Y \) = sans(H) \( Y \) - sans(H) \( Y divides T \)$. Thus no entropy of $T$ is used.
  A fixed enlargement of the bounded domains is allowed. There is no Planck parameter in this section.

=== 4.1 Apertures and the universal growth rate <apertures-and-the-universal-growth-rate>

Use nested grids for time and write $C_t$ for the cell of $c$ of length comparable to $epsilon.alt^t$,
  together with its chosen representative. At $t = 0$ one cell contains the time domain and its representative is
  zero. The finitely many boundary choices in this convention have entropy
  $O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$. For an unoriented normal $R$,
  let $Q_R$ be an orthogonal frame whose first vector is tangent and whose second vector is normal.
  Orientations of aspect $e$ are recorded in cells of angular size comparable to $epsilon.alt^e$.
  Nested angular grids, or a finite collection of nested slope grids, may be used.
  Choose a representative normal for each recorded angular cell; both rectangular grids use its frame.

#prodef([Definition 4.1.])[
  (Standard aperture observation).  At duration $t$ and horizon $L$, a standard observation $G$ records
  $ \( t \, b \, a \, C_t \, R_(a - b) \, \[ V \]_(b \, a \; R) \, \[ X \( C_t \) \]_(b + t \, a + t \; R) \) \,
    wide 0 lt.eq b lt.eq a \, quad a + t lt.eq L . $
  Here the bracket denotes the rectangular grid cell, in the recorded frame, with side lengths $epsilon.alt^b \,
    epsilon.alt^a$, or respectively $epsilon.alt^(b + t) \, epsilon.alt^(a + t)$.
    Its aperture weight is $w \( G \) = w \( b \, a \)$. The shape and orientation may be chosen by a stochastic
    kernel; extra finite labels are permitted. Equivalently, a label may locate the data in bounded enlargements
    of the indicated rectangles. Adding the actual grid cells then costs $O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$
    information.
] <def:classical-aperture>

Depths can be rounded on a mesh $xi = xi_epsilon.alt arrow.b 0$ with $log \( 1 \/ xi \) =
  o \( log \( 1 \/ epsilon.alt \) \)$. The number of shape choices in a bounded triangle is then subpower.
  In this terminology a factor is subpower if its normalized logarithm tends to zero.
  Dyadic spatial widths give a finite menu of apertures: choose orientation spacing comparable to the
  minor-to-major axis ratio and translates spaced by the corresponding widths.
  Every rectangle is contained in a fixed enlargement of one in this menu.
  Indeed an angular error at most a constant times the axis ratio moves a tangent uncertainty into at most a
  constant multiple of the normal uncertainty. This verifies the assertion for both columns.
  Discarding extra labels never increases particle information. Define the root supremum by

$ tau_L \( T \) = sup_(D upright(" at duration ") 0) { bb(E) w \( D \) - sans(I) \( T \; D \) } . $

The supremum is taken for the current particle law and the current precision, before any limit.
  For a fixed finite menu it is a supremum over all stochastic assignments to compatible caps.
  Rounding depths down on the mesh and adjoining the actual target cells costs $O \( xi \) +
  O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$ in root score, uniformly on fixed domain, horizon,
  and enlargement bounds. Thus these menus recover the unrestricted root supremum in the limit.

The score balances three quantities. The aperture weight rewards finer localization,
  particle information charges what the observation reveals about $T$,
  and conditional time entropy measures the time information left after the particle is known.
  The root supremum provides the zero-duration benchmark for this balance.

Write $S_t = sans(H) \( C_t divides T \)$ and

#[#set math.equation(numbering: n => "(4.1)")
 $ cal(F)_t \( G \) = bb(E) w \( G \) - sans(I) \( T \; G \) + 2 S_t \, wide beta =
   sup limsup_(epsilon.alt arrow.r 0) frac(cal(F)_t \( G \) - tau_L \( T \), t) . $ <eq:classical-score>]

The supremum ranges over all fixed $0 < t lt.eq L < oo$ and all sequences of the systems just defined.
  Domain bounds are fixed within each sequence. Fixed affine normalizations put them in one bounded domain without
  changing a limit. The label $G$ determines, up to bounded ambiguity, a root aperture of the same shape:
  recover $A = X \( C_t \) - C_t V$ and coarsen its position rectangle.
  Consequently $cal(F)_t \( G \) - tau_L \( T \) lt.eq 2 S_t + o \( 1 \) lt.eq 2 t + o \( 1 \)$.
  For a single particle and independent uniform time, the choices $b = a = L - t$ give $tau_L = 2 L +
  o \( 1 \)$ and $cal(F)_t = 2 L + o \( 1 \)$. Thus

#[#set math.equation(numbering: n => "(4.2)")
 $ 0 lt.eq beta lt.eq 2 . $ <eq:classical-provisional>]

#thm([Theorem 4.2.])[
  (Positive-transport growth).  #emph[For the aperture systems of Definition 14,
    the rate in (4.1) satisfies $beta lt.eq gamma$.]
] <thm:classical-growth>

We prove this bound by examining a sequence whose growth approaches $beta$.
  Localization and the least-aspect construction produce a saturated path.
  Its tangent reduction has two alternatives: an isotropic system, excluded in Section 5,
  or a path whose aspect grows in proportion to time. Sections 6 and 7 constrain the local information rates of
  the latter path; Section 8 combines those constraints with saturation to finish the proof.
  Until that point we use only (4.2) and the definition of $beta$.

The rate in (4.1) is unchanged if the underlying probability spaces are required to be finite.
  Fix the complete finite root menu and project $G$ to its geometric coordinates,
  which can only decrease particle information. For every possible output/time pair $\( g \, k \)$,
  use the two compatibility tests for $V$ and $A + macron(c)_k V$,
  where $macron(c)_k$ is the recorded time representative. Partition particles by all these tests and by
  membership in every root cap. The finite signature $kappa \( T \)$ depends on $T$ alone,
  not on the sampled time. Choose an actual $\( V \, A \)$ in each positive signature,
  with finite particle index $T^(upright(f))$. Give $\( T^(upright(f)) \, G \, C_t \)$ the old law of
  $\( kappa \( T \) \, G \, C_t \)$, and realize each time label by a point in its actual cell.
  The resulting finite law is compatible and has the same expected weight, with

$ sans(I) \( T^(upright(f)) \; G \) lt.eq sans(I) \( T \; G \) \, wide
  sans(H) \( C_t divides T^(upright(f)) \) gt.eq sans(H) \( C_t divides T \) . $

For roots, averaging a compatible kernel within signatures preserves its output marginal and weight and decreases
  information; conversely, every signature kernel lifts through $kappa \( T \)$ with equal information.
  The frozen-menu root suprema therefore agree exactly. The uniform menu error above is $o \( 1 \)$,
  so every general-law score excess is at most that of a finite law plus $o \( 1 \)$.
  We take these finite laws before forming the conditional systems and independent copies below.

We make explicit the uniformity implicit in that definition.
  For any fixed domain bound $B$, $K < oo$, and $t_min > 0$,
  there is a function $omega_epsilon.alt \( B \, K \, t_min \) arrow.r 0$ such that

#[#set math.equation(numbering: n => "(4.3)")
 $ cal(F)_t \( G \) lt.eq tau_L \( T \) + beta t + omega_epsilon.alt \( B \, K \, t_min \) \, wide t_min lt.eq
   t lt.eq L lt.eq K . $ <eq:classical-uniform>]

Here the menu, its depth mesh, and its fixed enlargement convention are chosen as deterministic functions of
  $epsilon.alt$, common to all systems in the supremum. It also applies to every conditional system with these
  bounds. To see this, a failure selects systems and parameters with a fixed positive excess and a convergent
  subsequence of $\( t \, L \)$. Changing depths by $nu$ costs at most $C_(K \, gamma) nu + o \( 1 \)$:
  cover the larger rectangle by the finer cells, including its changed frame in the count.
  Coarsening time by $nu$ loses at most $nu + o \( 1 \)$ of conditional time entropy.
  Transport to the coarser time uses an uncertainty $epsilon.alt^(t - nu)$ times the measured velocity rectangle,
  which fits the earlier position rectangle. Finally, coarsening both depths of a root test by at most $nu$ loses
  at most $2 nu + o \( 1 \)$ in weight; this proves the same continuity for the root supremum when its horizon
  changes by $nu$. Fixed parameter slack therefore converts the selected systems to a sequence contradicting
  (4.1). The same argument at $t = 0$ uses the root supremum directly, with no division by time.

Whenever we use conditional arrays below, we first fix the finite list of observations, the depth mesh,
  all trimming thresholds, and the positive time increments.
  Their exceptional probabilities and normalized errors are then bounded by one deterministic function
  $q_epsilon.alt arrow.r 0$ on every retained cell. Cell coordinate bounds and covering multiplicities are common
  constants. Thus every selection of one retained system per precision remains an admissible sequence in (4.1).
  The conditional-array selection principle at the end of Section 2 applies to precisely this array;
  it does not require a uniform rate over unspecified subpower envelopes.

=== 4.2 Splitting and cap bounds <splitting-and-cap-bounds>

Call an observation saturated if, along the sequence under discussion, $cal(F)_t \( G \) - tau_L \( T \) arrow.r
  beta t$. An extremizer below always means such a sequence, not a maximizing measure at finite precision.

#thm([Lemma 4.3.])[
  (Splitting saturated laws).  #emph[Let $Z$ be a finite tag.
    If $Delta = beta t + tau_L \( T \) - cal(F)_t \( G \)$, and $Delta_z$ is the corresponding deficit for the law
    conditional on $Z = z$, then
$ bb(E) Delta_Z lt.eq Delta + 3 sans(H) \( Z \) . $

 In particular subpower splittings preserve saturation on typical parts,
   simultaneously for any fixed finite list of saturated observations.]
] <lem:classical-splitting>

#proof[
  Combining conditional root tests and including $Z$ in their label gives $bb(E) tau_L \( T divides Z \) lt.eq
    tau_L \( T \) + sans(I) \( T \; Z \)$. The exact chain rules give
  $ bb(E) cal(F)_t \( G divides Z \) - cal(F)_t \( G \) = - sans(I) \( T \; Z divides G \) +
    sans(I) \( T \; Z \) - 2 sans(I) \( C_t \; Z divides T \) . $
  Subtract and use that each of the last two nonnegative costs is at most $sans(H) \( Z \)$.
    By (4.3), each conditional deficit is at least $- omega_epsilon.alt$, uniformly over the cells.
    Its positive part therefore tends to zero in mean when the original deficit and tag entropy do.
    Markov’s inequality proves the last assertion. No lower bound on an individual cell probability is used for
    this selection. ◻
]

#thm([Lemma 4.4.])[
  (Greedy cap regularization).  #emph[After a subpower splitting and removal of probability $o \( 1 \)$,
    a particle law can be restricted to classes with a bounded number $h$ such that
#[#set math.equation(numbering: n => "(4.4)")
 $ Pr_T \( "cap" \( D \) \) lt.eq epsilon.alt^(w \( D \) - h - o \( 1 \)) \, wide tau_L \( T \) = h +
   o \( 1 \) . $ <eq:classical-cap-bounds>]

 The cap bound is uniform over the root menu and its fixed enlargements.
   For a further law $Q lt.eq epsilon.alt^(- eta) Pr_T$ on such a class, $tau_L \( Q \) lt.eq h + eta +
   o \( 1 \)$. Hence a subpower restriction or tilt preserving the displayed score profiles preserves saturation.]
] <lem:classical-cap-regularization>

#proof[
  In the finite root menu, repeatedly select a cap maximizing $w \( D \) +
    log_(1 \/ epsilon.alt) #h(-0.16667em) (mu_(upright("rem")) \( "cap" \( D \) \))$ and remove its remaining
    contents. Selected contents $E_i$ are disjoint and cover the law.
    A selected cap cannot be selected again with positive mass, so the procedure is finite.
    The successive maxima $h_i$ decrease. Split the indices into intervals $\[ h \, h + xi \]$ and keep each
    entire $E_i$ in its bin. At the first removal in this bin every cap has remaining mass at most
    $epsilon.alt^(w \( D \) - h - xi)$. The absolute mass of its intersection with the whole bin has the same
    upper bound.
  Let the bin have probability $p$. Under its normalized law every cap thus has mass at most $p^(- 1)
    epsilon.alt^(w \( D \) - h - xi)$. The deterministic assigned-cap test has score
  $ sum_(i upright(" in bin")) frac(mu \( E_i \), p) (w \( D_i \) + log_(1 \/ epsilon.alt) #h(-0.16667em)
    (frac(mu \( E_i \), p))) = bb(E) \[ h_i divides upright("bin") \] +
    log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ p) . $
  Conversely, for any compatible stochastic test $D$, conditional relative entropy on its cap gives
  $ sans(I) \( T \; D \) gt.eq bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (frac(1, Pr_T \( "cap" \( D \) \))) . $
  The two estimates put the conditional root supremum between $h +
    log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ p)$ and $h + xi + log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ p)$,
    up to the menu ambiguity. The same inequality proves the assertion about $Q$.
  For completeness, very negative bins can be discarded: a fixed number of zero-depth caps cover the domain,
    so a remaining maximum below $- lambda$ forces remaining probability at most $C epsilon.alt^lambda$.
    The other maxima are at most $2 L + o \( 1 \)$. Choose the mesh slowly,
    and discard bins of mass less than $epsilon.alt^(eta_epsilon.alt)$,
    where $eta_epsilon.alt arrow.b 0$ slowly enough that the number of bins times $epsilon.alt^(eta_epsilon.alt)$
    tends to zero. Then $log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ p) = o \( 1 \)$ on every retained bin.
    This proves (4.4). Apply Lemma 16 when the input is saturated.
    Before any later subpower tilt, impose the uniform probability bins of Lemma 5;
    its conditional relative-entropy estimate preserves the stipulated profiles.
    Their score tends to $beta t + h$, while the cap bound gives $tau_L \( Q \) lt.eq h +
    o \( 1 \)$ and (4.3) gives the reverse inequality. ◻
]

=== 4.3 Anisotropic localization <anisotropic-localization>

#thm([Lemma 4.5.])[
  (Localization and composition).  #emph[Let $G$ have fixed shape $\( b \, a \)$ at $t$, put $e = a - b$,
    and fix $0 lt.eq r < t$, $0 lt.eq d lt.eq e$. Let $J$ be the aperture at $r$ of shape $\( b \, b + d \)$ whose
    frame is the depth-$d$ prefix of the frame of $G$. Set $zeta = sans(H) \( R_d divides T \, C_r \)$.
    Conditional on $J$, there are bounded line systems with final shape $\( 0 \, e - d \)$, duration $t - r$,
    and horizon $L' = e - d + t - r$. With $tau'_J$ their root suprema,
#[#set math.equation(numbering: n => "(4.5)")
 $ cal(F)_t \( G \) & lt.eq beta \( t - r \) + w \( b \, b + d \) - sans(I) \( T \; J \)\
 & wide  + 2 S_r + bb(E) tau'_J + 2 zeta + o \( 1 \) \,\
w \( b \, b + d \) - sans(I) \( T \; J \) + 2 S_r + bb(E) tau'_J & lt.eq beta r + tau_L \( T \) +
  o \( 1 \) . $ <eq:classical-local-first>]

 Here parameters are fixed before $epsilon.alt arrow.r 0$.
   Uniform versions have errors $C xi + C log \( C_0 \) \/ log \( 1 \/ epsilon.alt \) +
   omega_epsilon.alt$ for depth-rounding mesh $xi$, fixed enlargement bound $C_0$,
   and the compact parameter bounds in (4.3). If $zeta = o \( 1 \)$ and $G$ is saturated,
   typical conditional systems are saturated and near-maximizing compositions give a saturated predecessor at $r > 0$.]
] <lem:classical-localization>

#proof[
  Write $v_J \, x_J$ for the velocity and position representatives of $J$, $c_J$ for its time representative,
    and $S = Q_(R_d) "diag" \( epsilon.alt^b \, epsilon.alt^(b + d) \)$. The coordinates
  $ v' = S^(- 1) \( V - v_J \) \, quad a' = epsilon.alt^(- r) S^(- 1) \( A + c_J V - x_J \) \, quad c' =
    epsilon.alt^(- r) \( c - c_J \) $
  are bounded on this conditional system, and its trajectory is $a' + c' v'$. More explicitly,
  $ a' + c' v' = epsilon.alt^(- r) S^(- 1) #scale(x: 120%, y: 120%)[\(] A + c V -
    x_J - \( c - c_J \) v_J #scale(x: 120%, y: 120%)[\)] \, $
  so the moving anchor being subtracted is known from $J$. Both columns use the same spatial map;
    the position column has the additional factor $epsilon.alt^(- r)$.
    If $theta$ is the angle from the coarse frame to the final frame, then $\| sin theta \| lt.eq
    C epsilon.alt^d$. In these units the final velocity uncertainty matrix, with its harmless scalar factor removed, is
  $ N = "diag" \( 1 \, epsilon.alt^(- d) \) Q_theta "diag" \( 1 \, epsilon.alt^e \) . $
  Its largest singular value lies between positive fixed constants:
    the first column has length at least one and all entries are bounded.
    Its determinant has absolute value $epsilon.alt^(e - d)$.
    Its other singular value is therefore comparable to $epsilon.alt^(e - d)$.
    The final position matrix is $epsilon.alt^(t - r) N$. This proves the asserted final aperture.
  The same calculation proves the needed determination of $J$ by $G$.
    Rotate the velocity uncertainty to the coarse frame, coarsen its normal width from $a$ to $b + d$,
    and transport the position uncertainty from $C_t$ to $C_r$.
    Since $\| C_t - C_r \| lt.eq C epsilon.alt^r$, the transported velocity uncertainty fits the position widths
    $epsilon.alt^(b + r) \, epsilon.alt^(b + d + r)$. Thus only a bounded number of cells is possible.
    This argument compares uncertainty rectangles, and imposes no bound on the displacement of their centers.
    In particular
  $ sans(H) \( J divides G \) = o \( 1 \) \, wide sans(H) \( J divides T \, C_r \) lt.eq zeta + o \( 1 \) . $
  After adding the actual transformed cells at bounded cost,
    the final label $G'$ satisfies $sans(I) \( T \; J \) + sans(I) \( T \; G' divides J \) lt.eq
    sans(I) \( T \; G \) + o \( 1 \)$. Also, since $J$ includes $C_r$,
  $ 0 lt.eq S_t - S_r - sans(H) \( C_t divides T \, J \) = sans(I) \( C_t \; J divides T \, C_r \) lt.eq zeta +
    o \( 1 \) . $
  The local final weight is exactly $w \( 0 \, e - d \) = w \( b \, a \) - w \( b \, b + d \)$.
    Apply (4.3) in each conditional system and average; these identities give (4.5).
  For composition, take a local root test of shape $\( B \, A \)$, $0 lt.eq B lt.eq A lt.eq L'$,
    and frame $Q_phi.alt$. Its global uncertainty is
  $ M = S Q_phi.alt "diag" \( epsilon.alt^B \, epsilon.alt^A \) . $
  Let $p lt.eq q$ be its two singular-value depths. The determinant identity,
    the upper bound for the largest singular value, the lower bound for the smallest one,
    and submultiplicativity of the condition number give
  $ p + q = 2 b + d + A + B + o \( 1 \) \, wide q - p lt.eq d + A - B + o \( 1 \) \,\
p gt.eq b + B - o \( 1 \) \, wide q lt.eq b + d + A + o \( 1 \) lt.eq a + t - r + o \( 1 \) . $
  Consequently
  $ w \( p \, q \) gt.eq w \( b \, b + d \) + w \( B \, A \) - o \( 1 \) \, wide q + r lt.eq L + o \( 1 \) . $
  The position column has the same singular directions and the extra factor $epsilon.alt^r$,
    so this is an admissible global aperture at $r$. Rounding its depths down removes the displayed horizon slack
    at a vanishing cost. Include $J$ in the composed label and add its actual cells at bounded ambiguity.
    Its information is at most $sans(I) \( T \; J \) + sans(I) \( T \; D' divides J \) + o \( 1 \)$.
    Choose conditional root tests within any prescribed $eta > 0$ of $tau'_J$, apply the global bound at $r$,
    and then let $eta arrow.b 0$. At $r = 0$ use the defining root supremum instead. This proves (4.5).
  Finally, if both endpoints of these inequalities agree in the limit,
    their nonnegative limiting deficits have zero mean. The uniform lower bounds on all conditional deficits
    permit the same Markov selection as in Lemma 16. The composition of the chosen conditional root tests gives
    the predecessor assertion. The finite errors quoted in the statement come respectively from rounding,
    bounded covering multiplicities, and (4.3). ◻
]

The case $r = d = 0$ removes the common depth $b$. Replacing the local horizon by its smallest permitted value
  $e + t$ cannot lower a score minus its root supremum; the universal upper bound then forces saturation.
  Replacing $epsilon.alt$ by $epsilon.alt^t$ makes the duration one and divides all depths, weights,
  and normalized entropies by $t$.

=== 4.4 The least aspect and saturated predecessors <the-least-aspect-and-saturated-predecessors>

We first isolate the rectangle comparison used twice below.
  Two equal-shape apertures $\( b \, b + e \)$ with angular separation of depth $v
  in \[ 0 \, e \]$ have a common coarsening of shape $\( b \, b + v \)$ and an intersection aperture of shape
  $\( b + e - v \, b + e \)$. The common label is determined by either original label,
  once an angle-depth bin of width $xi$ is supplied, at information cost $O \( xi \) + o \( 1 \)$.
  For the intersection, one normal constraint has width $epsilon.alt^(b + e)$;
  solving the other normal constraint along its tangent gives width $C epsilon.alt^(b + e) \/ \| sin theta \|$.
  The safe endpoint of the angle bin gives the asserted tangent depth with an $O \( xi \)$ loss.
  Coarsening to normal depth $b + v$ proves the common-rectangle assertion.
  These arguments apply separately to both columns, with the common time factor when the duration is positive.
  The weight gain is

#[#set math.equation(numbering: n => "(4.6)")
 $ w \( b + e - v \, b + e \) + w \( b \, b + v \) - 2 w \( b \, b + e \) =
   2 gamma \( e - v \) . $ <eq:classical-rectangle-gain>]

Figure 1 shows the two rectangles responsible for this weight gain.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.776, 1.911), [#text(size: 9pt)[Common coarsening]])
  rect((0.2275, -1.229), (5.324, 1.229), fill: rgb("#f4f5f5"), stroke: none)
  rect((0.2275, -1.229), (5.324, 1.229), stroke: (paint: rgb("#666c71"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  rect((0.3185, -0.1638), (5.232, 0.1638), stroke: (thickness: 0.7pt, miter-limit: 10))
  line((0.6179, -1.187), (5.072, 0.8899), (4.933, 1.187), (0.4795, -0.8899), close: true, stroke: (paint: rgb("#27597a"), thickness: 0.7pt, miter-limit: 10))
  content((4.705, 0.1729), [#text(size: 9pt)[$D_1$]], anchor: "south-west", padding: 0.1176cm)
  content((4.914, 1.11), [#text(fill: rgb("#27597a"))[#text(size: 9pt)[$D_2$]]], anchor: "south-east", padding: 0.1176cm)
  arc((3.576, 0), start: 0deg, stop: 25deg, radius: 0.8008, stroke: (thickness: 0.45pt, miter-limit: 10))
  content((3.522, 0.4459), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 8pt)[$theta asymp epsilon^v$]]])], anchor: "west")
  line((0.2275, -1.502), (5.324, -1.502), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2.776, -1.572), [#text(size: 9pt)[$epsilon^b$]], anchor: "north", padding: 0.1176cm)
  line((-0.0182, -1.229), (-0.0182, 1.229), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-0.0182, 0.07056), [#text(size: 9pt)[$epsilon^(b+v)$]], anchor: "south", padding: 0.1176cm)
  content((2.776, -2.412), [#text(size: 8pt)[depths $(b,b+v)$]])
  content((10.01, 1.911), [#text(size: 9pt)[Intersection]])
  rect((7.553, -0.1638), (12.47, 0.1638), stroke: (thickness: 0.7pt, miter-limit: 10))
  line((7.852, -1.187), (12.31, 0.8899), (12.17, 1.187), (7.714, -0.8899), close: true, stroke: (paint: rgb("#27597a"), thickness: 0.7pt, miter-limit: 10))
  line((9.271, -0.1638), (10.05, -0.1638), (10.75, 0.1638), (9.974, 0.1638), close: true, fill: rgb("#cfdae2"), stroke: none)
  rect((9.271, -0.1638), (10.75, 0.1638), stroke: (paint: rgb("#666c71"), thickness: 0.6pt, miter-limit: 10, dash: "dashed"))
  content((11.94, 0.1729), [#text(size: 9pt)[$D_1$]], anchor: "south-west", padding: 0.1176cm)
  content((12.15, 1.11), [#text(fill: rgb("#27597a"))[#text(size: 9pt)[$D_2$]]], anchor: "south-east", padding: 0.1176cm)
  line((9.271, -0.6279), (10.75, -0.6279), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((10.01, -0.6985), [#text(size: 9pt)[$epsilon^(a-v)$]], anchor: "north", padding: 0.1176cm)
  line((11.04, -0.1638), (11.04, 0.1638), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((11.16, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$epsilon^a$]]])], anchor: "west")
  content((10.01, -1.502), [#text(size: 8pt)[each original aperture: $epsilon^b times epsilon^a$]])
  content((10.01, -2.412), [#text(size: 8pt)[depths $(a-v,a)$]])
})],
  caption: [Figure 1: Aperture geometry for two common-shape observations. The centered schematic has $0 < epsilon.alt < 1$, $b lt.eq a$ and $0 lt.eq v lt.eq a - b$, with angle $theta asymp epsilon.alt^v$. Here $a = b + e$ in the notation of (4.6); the two comparison rectangles give its weight gain. The dashed common rectangle contains both apertures up to fixed factors; the shaded intersection is contained in a rectangle with depths $\( a - v \, a \)$. All indicated side lengths are orders of magnitude, and the picture displays an interior value of $v$. The same calculation applies to the position column at duration $r$ after multiplying both side lengths by $epsilon.alt^r$. ],
) <fig:aperture-geometry>

#thm([Proposition 4.6.])[
  (Least-aspect limiting extremizer).  #emph[There exists a saturated sequence at duration one with $b = 0$,
    endpoint aspect $e = m$, and horizon $1 + m$, where $m gt.eq
    0$ is the least aspect of any such saturated sequence. One may moreover require $Y_j$ conditional on $X_j$ to
    be homogeneous for a prescribed countable list of finite pairs $\( X_j \, Y_j \)$,
    provided that for each fixed $j$ there is $0 lt.eq A_j < oo$, independent of $epsilon.alt$,
    such that $\| cal(Y)_j \| lt.eq epsilon.alt^(- A_j)$ for all sufficiently small $epsilon.alt$.
    No cardinality bound is imposed on $X_j$, which may include the exact particle $T$.]
] <prop:least-aspect>

#proof[
  Choose systems whose normalized rates tend to $beta$, split by narrow shape bins, remove $b$ by localization,
    and normalize time. Each individual inner sequence now has a fixed finite aspect $e$;
    its rate defect can be made arbitrarily small. We need a bound for $e$ independent of which sequence was selected.
  Sample two final labels independently given $T$, and let $D_1 \,
    D_2$ be their root coarsenings of shape $\( 0 \, e \)$. If the rate defect is $eta$, then, since $S_1 lt.eq
    1 + o \( 1 \)$ and $beta gt.eq 0$,
  $ sans(I) \( T \; D_j \) lt.eq \( 1 - gamma \) e - tau_L \( T \) + 2 + eta + o \( 1 \) . $
  Tag their separation depth $v$ on a fixed mesh and use the common and intersection labels above.
    Conditional independence gives
  $ 2 e - \( 1 + gamma \) bb(E) v - tau_L \( T \) & lt.eq sans(I) \( T \; D_1 \, D_2 \) + O \( xi \) + o \( 1 \)\
 & lt.eq 2 #scale(x: 120%, y: 120%)[\(] \( 1 - gamma \) e - tau_L \( T \) + 2 + eta #scale(x: 120%, y: 120%)[\)] -
   #scale(x: 120%, y: 120%)[\(] \( 1 - gamma \) bb(E) v - tau_L \( T \) #scale(x: 120%, y: 120%)[\)] +
   O \( xi \) + o \( 1 \) . $
  Indeed the information identity for the pair subtracts $sans(I) \( D_1 \; D_2 \)$,
    which is at least the common-label entropy minus its two determination errors.
    That entropy is at least its particle information, and the root test bounds the latter below by its weight
    minus $tau_L$. The separation tag has entropy $o \( 1 \)$ at each fixed mesh. Rearrangement yields
  $ 2 gamma bb(E) \( e - v \) lt.eq 4 + 2 eta + O \( xi \) + o \( 1 \) . $
  Thus a fixed $K = K_gamma < oo$ gives a positive, uniformly bounded below probability of agreement within a
    bounded number of cells at depth $\( e - K \)_(+)$. For each $T$,
    maximize the conditional probability of a coarse orientation cell.
    The conditional collision probability of two independent draws is at most a fixed constant times this maximum.
    This deterministic predictor therefore succeeds, to bounded cell ambiguity,
    on an event of probability at least $c_gamma > 0$. On that event the coarse orientation has conditional
    entropy $o \( 1 \)$ given $T$. Binary splitting preserves a rate defect tending to zero on this event.
    Localization with $r = 0$, $d = \( e - K \)_(+)$ produces a conditional system with residual aspect at most
    $K$ and rate defect tending to zero. Uniform conditional deficit bounds justify selecting one such system even
    when the conditioning cells are numerous.
  It remains to take the least aspect. The preceding construction, followed by a diagonal,
    produces at least one saturated sequence with bounded aspect and reduced horizon.
    Let $m$ be the infimum of its possible limiting aspects. Choose such sequences with aspects $e_j arrow.r m$.
    For the $j$th sequence choose its precision small enough that its score defect, finite-menu errors,
    and the errors for the first $j$ requested profiles are less than $1 \/ j$.
    Coarsen an endpoint of aspect $e_j$ to aspect $m$ when $e_j gt.eq m$; if needed allow a depth error $\| e_j -
    m \|$ before this coarsening. The score loses at most $C_gamma \| e_j - m \| + o \( 1 \)$,
    whereas reducing the horizon to $1 + m$ reduces the subtracted root supremum.
    The universal bound forces the resulting diagonal to saturate.
    For the homogeneity assertion, apply Lemma 5 to finite initial lists of these pairs under the stated bounds on
    the child alphabets, and choose their meshes and errors before the corresponding precision.
    Lemma 10 then retains the countable list. In the applications below the children are finite tuples of grid
    observations at fixed depths in bounded coordinates; the exact particle and other unrestricted conditioning
    data occur only among the parents. ◻
]

#thm([Proposition 4.7.])[
  (Saturated path and coherence).  #emph[The sequence in Proposition 19 can carry,
    on one joint law of $\( T \, c \)$, saturated observations $G_u$ at every positive dyadic time $u lt.eq 1$.
    Their shapes satisfy
$ b \( 1 \) = 0 \, quad a \( 1 \) = m \, quad b \( r \) gt.eq b \( t \) \, quad a \( r \) + r lt.eq a \( t \) +
  t quad \( r < t \) \, wide e \( u \) := a \( u \) - b \( u \) gt.eq m u . $

 They can be constructed so that $sans(H) \( R_(e \( u \)) divides T \, C_u \) = o \( 1 \)$.
   There is a constant $K_gamma$, independent of $r \, t$, for which the orientations at $r <
   t$ agree with probability tending to one at every positive depth
#[#set math.equation(numbering: n => "(4.7)")
 $ d < min \( e \( r \) \, e \( t \) \) - K_gamma #scale(x: 120%, y: 120%)[\(] \| b \( r \) -
   b \( t \) \| + \| a \( r \) - a \( t \) \| + t - r #scale(x: 120%, y: 120%)[\)] . $ <eq:classical-coherence>]

 All statements refer to the inner $epsilon.alt$ limit with the times fixed.]
] <prop:saturated-path>

#proof[
  On a finite dyadic mesh, work backwards from $1$ using Lemma 18 with $d = 0$.
    A composed predecessor has minimum depth at least the later $b$ and maximum depth at most the later $a$ plus
    the time difference. Split its variable shape into narrow bins and use Lemma 16 to preserve all equalities
    already imposed. Drop redundant labels. Before making this split,
    sample each incoming predecessor from its kernel given $\( T \, C_r \)$,
    independently of the previously retained finer time and later labels.
    This operation preserves its law with $\( T \, C_r \)$ and preserves the entire later joint law.
    In particular the underlying time variable is never resampled.
  Subsequent finite binning and trimming introduce at most their normalized entropy or relative-entropy cost into
    the averaged conditional mutual information, by Lemma 4. Retain typical parts on which this cost and all
    finitely many score defects are bounded by a common deterministic $q_epsilon.alt arrow.r 0$,
    using Markov thresholds fixed before selecting parts. The same lemma justifies the kernel resampling with base
    $\( T \, C_r \)$; at this stage no observation involving a free replica is fixed.
    Passing to finer finite meshes, and then to a diagonal, gives the asserted common sequence and its dyadic
    shapes. Shape bounds follow from the fixed horizon. A saturated observation at $u$, localized with $r = d =
    0$ and normalized to duration one, has aspect $e \( u \) \/ u$; minimality gives $e \( u \) gt.eq m u$.
  Here are details of coherence. Put $D = \| b \( r \) - b \( t \) \| + \| a \( r \) - a \( t \) \| + t - r$.
    Convert the observation at $t$ to the shape $\( b \( r \) \, a \( r \) \)$ at $r$,
    using its recorded frame rounded to the target precision and recording the actual target cells.
    Its additional conditional log-cardinality is at most $C D + o \( 1 \)$.
    To check this bound, rotate the old uncertainty into the new frame:
    the tangent uncertainty entering the normal coordinate has exponent at least $b \( t \) + e \( r \) gt.eq
    a \( r \) - \| b \( t \) - b \( r \) \|$. The other side-length changes cost at most the absolute differences
    of the two depths. Transport from $C_t$ to $C_r$ adds $epsilon.alt^r$ times the velocity uncertainty,
    which has the same bound in position units divided by $epsilon.alt^r$.
    Counting the finer cells in each resulting rectangle gives the stated estimate.
    The weight changes by at most $2 D$, and $S_t - S_r lt.eq t - r + o \( 1 \)$.
    Thus this converted test and the original test at $r$ have total deficit at most $C_gamma D +
    o \( 1 \)$ at duration $r$.
  Call these two labels $D_1 \, D_2$, their common label $D_c$, and their intersection label $D_i$.
    They contain $C_r$, and their remaining coordinates are deterministic functions of $T \,
    C_r$ and their respective orientations. The resampling construction therefore gives
  $ sans(I) \( D_1 \; D_2 divides T \) lt.eq S_r + o \( 1 \) \, wide sans(H) \( D_c divides T \) gt.eq S_r . $
  The pair information identity and common-label determination imply
  $ sans(I) \( T \; D_i \) & lt.eq sans(I) \( T \; D_1 \) + sans(I) \( T \; D_2 \) - sans(H) \( D_c \) +
    sans(I) \( D_1 \; D_2 divides T \) + O \( xi \) + o \( 1 \)\
 & lt.eq sans(I) \( T \; D_1 \) + sans(I) \( T \; D_2 \) - sans(I) \( T \; D_c \) + O \( xi \) + o \( 1 \) . $
  Both $D_c \, D_i$ have the same time $C_r$ and obey the original horizon.
    Apply the universal score bound to each. Their two time contributions cancel the corresponding contributions
    in $D_1 \, D_2$, giving
  $ 2 gamma bb(E) \( e \( r \) - v \) lt.eq C_gamma D + O \( xi \) + o \( 1 \) . $
  This inequality also holds on any separation event of fixed positive limiting probability:
    binary splitting preserves the two original saturations, and the extra conditional dependence costs only
    $o \( 1 \)$. On the event $v lt.eq d$ its left side is at least $2 gamma \( e \( r \) - d \)$.
    Choose $K_gamma$ larger than the preceding constant divided by $2 gamma$,
    and then let the angle mesh tend to zero. A positive limiting probability of separation at a depth in (4.7) is
    impossible.
  Apply the same comparison to two independent replicas of a single label given $\( T \, C_u \)$.
    With $D = 0$ they agree at every depth $e \( u \) - nu$, $nu > 0$, with probability tending to one.
    For each base value, a coarse cell and its bounded neighbors then contain all but $o \( 1 \)$ of the
    conditional orientation mass on average. Choose such a cell deterministically from the base.
    The entropy bound obtained by separating this event from its complement is $o \( 1 \)$ at depth $e \( u \) -
    nu$; refining the orientation costs at most $nu + o \( 1 \)$. Let $nu arrow.b 0$.
    This proves the asserted zero conditional orientation entropy. ◻
]

=== 4.5 Isotropic tangents or a matched aspect <isotropic-tangents-or-a-matched-aspect>

#thm([Proposition 4.8.])[
  (Tangent reduction).  #emph[One of the following alternatives holds for the least aspect $m$.]
  + #emph[If $m = 0$, there is a saturated sequence of duration and horizon one,
    with isotropic endpoint $\( b \, a \) = \( 0 \, 0 \)$ and homogeneous conditional time profile
$ sans(H) \( C_u divides T \) = s u + o \( 1 \) \, wide 0 lt.eq u lt.eq 1 \, quad 0 lt.eq s lt.eq 1 . $

]
  + #emph[If $m > 0$, the saturated path can be represented by a single orientation $R$ with depth-$m
    u$ prefixes at time $u$, for every $0 < u lt.eq 1$, and $sans(H) \( R_(m u) divides T \, C_u \) = o \( 1 \)$.
    Its shapes satisfy
$ e \( u \) = m u \, wide b \( u \) upright(" is Lipschitz") \, wide 0 lt.eq - b' \( u \) lt.eq 1 + m quad
  upright("a.e.") $

 There is $kappa > 0$ such that its limiting conditional orientation entropies obey
#[#set math.equation(numbering: n => "(4.8)")
 $ sans(H) \( R_(m \( u + h \)) divides T \, C_u \) gt.eq kappa h \, wide 0 < u < u + h < 1 . $ <eq:orientation-growth>]

 The alternatives and the positive lower bound persist after homogeneous splittings that preserve the saturated path.]
] <prop:isotropic-reduction>

#proof[
  The nesting inequalities make $b$ nonincreasing and $a \( u \) + u$ nondecreasing;
    extend them to their continuity points. In particular $e \( u \) + u$ is nondecreasing,
    so $e$ has bounded variation and its singular distributional derivative is nonnegative.
    Choose a common differentiability point $x in \( 0 \, 1 \)$ for these functions.
    Take dyadic $r < x < t$ with $eta = t - r arrow.b 0$ and with both distances from $x$ comparable to $eta$.
    Differentiability gives uniform linear approximations throughout $\[ r \, t \]$, with error $o \( eta \)$.
    Choose a finite dyadic chain
  $ r = u_0 < u_1 < dots.h.c < u_N = t $
  whose largest interval length is $o \( eta \)$, and put
  $ D_j = \| b \( u_(j + 1) \) - b \( u_j \) \| + \| a \( u_(j + 1) \) - a \( u_j \) \| + u_(j + 1) - u_j \, wide
    D_max = max_j D_j . $
  The uniform linear approximations give $D_max lt.eq C max_j \( u_(j + 1) - u_j \) + o \( eta \) = o \( eta \)$.
    Here the chain may become longer as $eta arrow.b 0$, but it is finite and fixed at each inner small-parameter limit.
  Let $e_min = min_j e \( u_j \)$ and choose a positive $delta_eta = o \( eta \)$. Set
  $ d = #scale(x: 120%, y: 120%)[\(] e_min - K_gamma D_max - delta_eta #scale(x: 120%, y: 120%)[\)]_(+) . $
  When $d > 0$, it lies strictly below the coherence depth for every adjacent pair in the chain.
    Equation (4.7) therefore makes all their frames agree at depth $d$, up to bounded neighboring cells,
    with probability tending to one. Transitivity costs at most a fixed number depending on this chain of
    neighboring cells, and the union of its finitely many exceptional events still has probability tending to
    zero. The frame at $r$ is determined by $\( T \, C_r \)$ to zero normalized entropy at this depth.
    The entropy ambiguity bound hence gives the same determination for the terminal depth-$d$ frame.
    If $d = 0$, no orientation information is required.
  The uniform linear approximation for $e$ also gives
  $ e \( t \) - e_min lt.eq max \( e' \( x \) \, 0 \) eta + o \( eta \) . $
  Since $e_min gt.eq 0$, the definition of $d$ yields, in either case,
  $ e \( t \) - d lt.eq e \( t \) - e_min + K_gamma D_max + delta_eta lt.eq max \( e' \( x \) \, 0 \) eta +
    o \( eta \) . $
  All depths, the chain, and its angular mesh are chosen before the inner limit.
    The depth loss is $K_gamma D_max$ at this one common depth;
    the number of links enters only the zero-cost angular ambiguity.
  Localize the terminal observation at $r$, using its common depth $b \( t \)$ and this $d$.
    Its local horizon is $eta + e \( t \) - d$. Saturation and zero conditional orientation entropy give saturated
    conditional systems. With small parameter $rho = epsilon.alt^eta$,
    their duration is one and their aspect is at most $max \( e' \( x \) \, 0 \) + o \( 1 \)$.
    All local coordinate bounds are uniform, and their horizons stay bounded.
    Minimality of $m$ therefore implies $m lt.eq max \( e' \( x \) \, 0 \)$.
    If $m > 0$, this yields $e' \( x \) gt.eq m$ almost everywhere. Since the singular derivative of $e$ is nonnegative,
  $ e \( 1 \) - e \( u \) gt.eq integral_u^1 e' \( v \) thin d v gt.eq m \( 1 - u \) . $
  Together with $e \( u \) gt.eq m u$ and $e \( 1 \) = m$, this proves $e \( u \) = m u$.
    The original nesting inequalities now give
  $ 0 lt.eq b \( r \) - b \( t \) lt.eq \( 1 + m \) \( t - r \) \, $
  which proves the Lipschitz assertion and extends the path to every time.
  We specify the selection of shrinking-scale limits, also for later use.
    For the $j$th interval first fix its endpoints, its finite coherence chain,
    and the first $j$ time-prefix fractions. Homogenize their joint and conditional probability bins,
    then choose the inner precision so that all depth errors, normalized conditional entropies,
    uniform-bound errors, and retained score deficits are less than $eta_j \/ j^2$.
    Use uniform typical sets before any further restriction. The sum of the conditional deficits is then
    $o \( eta_j \)$ in mean; select typical localization cells with each required error $o \( eta_j \)$.
    Only afterwards divide by $eta_j$ and take the outer diagonal.
    This is an application of Lemma 10 with the error measured in the new units.
    No modulus of differentiability uniform over profiles is used.
  If $m = 0$, use a common regular point with $e' lt.eq 0$ in the tangent construction above.
    The set of such points has positive measure: otherwise $e' > 0$ almost everywhere,
    and its nonnegative singular derivative would force $e \( 1 \) > e \( u \) gt.eq 0$, contrary to $e \( 1 \) =
    0$. The nondecreasing $1$-Lipschitz homogeneous time profile $S_u$ is differentiable almost everywhere,
    so the point can also be chosen regular for $S$. Put $s = S' \( x \) in \[ 0 \, 1 \]$.
    At this point the residual aspect just constructed is $o \( eta \)$.
  For the conditional time calculation, fix the finite list $q = r + k eta$ chosen above,
    and put $B = \( T \, C_r \)$, $D_q = C_q$, $d_q = S_q - S_r$, and $ell = log \( 1 \/ epsilon.alt \)$.
    Let $sans(P)$ be their joint law with the localization label $J$, before its value is fixed.
    The recorded conditional bins have one error $omega_epsilon.alt =
    o \( eta \)$ for this list outside probability $o \( 1 \)$,
    while the preceding parameter choice gives $sans(H)^(sans(P)) \( J divides B \) = o \( eta \)$. At sampled values,
  $ - ell^(- 1) log sans(P) \( D_q divides B \, J \) + ell^(- 1) log sans(P) \( D_q divides B \) =
    ell^(- 1) log frac(sans(P) \( J divides B \), sans(P) \( J divides B \, D_q \)) . $
  The two nonnegative $J$ surprises on the right have means at most $sans(H)^(sans(P)) \( J divides B \)$.
    Choose $delta_epsilon.alt = o \( eta \)$ with $sans(H)^(sans(P)) \( J divides B \) \/ delta_epsilon.alt
    arrow.r 0$ and trim them by Markov’s inequality. Intersecting with the recorded bins leaves an event $E$ of
    probability $1 - o \( 1 \)$ on which, simultaneously for the listed $q$,
  $ - ell^(- 1) log sans(P) \( J divides B \) lt.eq delta_epsilon.alt \, wide
    lr(|- ell^(- 1) log sans(P) \( D_q divides B \, J \) - d_q|) lt.eq alpha_epsilon.alt := omega_epsilon.alt +
    delta_epsilon.alt = o \( eta \) . $
  The list is fixed before choosing the inner precision; its errors and exceptional masses are put under one
    deterministic vanishing envelope before the lists grow along the preceding diagonal.
  Put $sans(P)^E = sans(P) \( thin dot.op divides E \)$. Conditional relative entropy gives
  $ sans(H)^(sans(P)^E) \( J divides B \) lt.eq bb(E)_(sans(P)^E) \[ - ell^(- 1) log sans(P) \( J divides B \) \]
    lt.eq delta_epsilon.alt = o \( eta \) . $
  Since $J$ records $R_d$, this also bounds the orientation cost under $sans(P)^E$.
    The binary tag $bold(1)_E$ costs $O \( 1 \/ ell \) = o \( eta \)$.
    Lemma 16, the original $o \( eta \)$ deficits, and the common lower bound $-
    o \( eta \)$ for the complementary deficits give $o \( eta \)$ deficits on $sans(P)^E$.
    Localization of this law has conditional laws $sans(Q)_j = sans(P) \( thin dot.op divides E \, J = j \)$,
    followed by the known $J$-dependent coordinate change. The shrinking-scale selection above therefore gives a
    set of $sans(P)_J^E$-mass $1 - o \( 1 \)$ on which the required local deficits are $o \( eta \)$ under the
    same finite envelope.
  Choose one $lambda_epsilon.alt arrow.b 0$ with $log \( 1 \/ lambda_epsilon.alt \) = o \( eta ell \)$,
    using $eta ell arrow.r oo$. Apply Lemma 3 to the event $E$, with $C = J$, $X = \( B \, J \)$, $Y = D_q$,
    and all three exceptional thresholds equal to $lambda_epsilon.alt$.
    Outside $sans(P)_J^E$-mass at most $lambda_epsilon.alt$, it gives
  $ sans(Q)_j lt.eq \[ sans(P) \( E \) lambda_epsilon.alt \]^(- 1) sans(P)_j \, wide sans(P)_j =
    sans(P) \( thin dot.op divides J = j \) . $
  On $J = j$, conditioning on $X$ is conditioning on $B$, and the bin on $E$ is for
    $sans(P) \( D_q divides B \, J \) = sans(P)_j \( D_q divides B \)$.
    The lemma’s entropy and surprise conclusions therefore give
  $ Omega_epsilon.alt := alpha_epsilon.alt + ell^(- 1) log frac(1, sans(P) \( E \) lambda_epsilon.alt^2) =
    o \( eta \) \,\
lr(|sans(H)^(sans(Q)_j) \( D_q divides B \) - d_q|) lt.eq Omega_epsilon.alt \, wide
  sans(Q)_j #h(-0.16667em) {lr(|- ell^(- 1) log sans(Q)_j \( D_q divides B \) - d_q|) > Omega_epsilon.alt} lt.eq
  2 lambda_epsilon.alt . $
  These are uniform over the retained $j$ and the fixed finite list;
    the finite union bound is absorbed by the same diagonal. No original cell probability enters the error envelope.
  Intersect these cells with the typical localization cells above.
    Since $C_r$ is fixed by $J$ and the local time grids correspond to $C_q$ up to bounded ambiguity,
    the estimates are conditional on the local particle. Differentiability gives $\( S_q - S_r \) \/ eta = k s +
    o \( 1 \)$. The residual aspect and excess horizon are $o \( 1 \)$ in the new units;
    coarsen these vanishing depth errors and apply the universal bound to recover a saturated isotropic sequence.
    Increasing the finite prefix lists gives the homogeneous linear time profile and proves the first alternative.
  Suppose henceforth $m > 0$. Fix a dyadic $u > 0$. On a sufficiently fine finite chain from $u$ to $1$,
    coherence and the Lipschitz width bounds identify all frames at every depth strictly below $m u$.
    The terminal orientation $R$ thus determines the frame at $u$ at that precision.
    Let the gap from $m u$ tend to zero. Both the old and new rectangles then determine each other with vanishing
    log-cardinality error; recording the same data in the endpoint-prefix frame preserves its score.
    Taking a diagonal over dyadic $u$, and then using Lipschitz interpolation of the widths and time grids,
    supplies the common-prefix representation at every $u$.
  Finally, if no $kappa > 0$ satisfies (4.8), there are fixed intervals $\( u_j \, u_j + h_j \)$,
    chosen after their inner limits, with
  $ h_j^(- 1) sans(H) \( R_(m \( u_j + h_j \)) divides T \, C_(u_j) \) arrow.r 0 . $
  Apply Lemma 18 to the saturated observation at $u_j + h_j$, with $r = u_j$, $b = b \( u_j + h_j \)$, and $d =
    e \( u_j + h_j \)$. Its conditional final shape is exactly isotropic and its local horizon is $h_j$.
    The error $2 zeta$ in (4.5) is $o \( h_j \)$. The other composition errors are made $o \( h_j \)$ by first
    fixing the interval and then choosing the inner precision.
    The local deficits consequently have mean $o \( h_j \)$ and a uniform lower bound of the same order.
    Select a local system with deficit $o \( h_j \)$ and replace $epsilon.alt$ by $epsilon.alt^(h_j)$.
    This produces a saturated isotropic sequence of horizon one, contrary to $m > 0$.
    This contradiction proves the uniform positive constant. It uses neither a positive lower bound for $h_j$ nor
    one for $u_j$: both are fixed positive numbers at their own inner stage.
  The same arguments apply after any homogeneous splitting preserving the path’s scores.
    Such a path is still a least-aspect extremizer, so the final contradiction again supplies a positive constant.
    One can also fix a projective orientation chart by a finite split.
    In that chart use rows $\( 1 \, 0 \)$ and $\( - R \, 1 \)$, with bounded slope $R$ and nested slope prefixes.
    The row frame and orthogonal frame have bounded condition number, angular and slope precisions are comparable,
    and the resulting rectangle observations differ by bounded covering multiplicities.
    All conclusions therefore hold in this row convention. ◻
]

#prodef([Remark 4.9.])[
  (Homogeneous profiles for subsequent local arguments).  In either alternative of Proposition 21,
    one may first impose a fixed finite list of pairs $\( X_j \, Y_j \)$ satisfying $\| cal(Y)_j \| lt.eq
    epsilon.alt^(- A_j)$ for fixed $0 lt.eq A_j < oo$ and all sufficiently small $epsilon.alt$.
    The children may be joint grid observations or geometric prefixes.
    No cardinality bound is imposed on the conditioning variables $X_j$, which may include $T$.
    Apply Lemma 5 and Lemma 16, select a saturated homogeneous component,
    and only then define its limiting profiles and choose a differentiability or trace point.
    The profiles need not equal those before this initial splitting.
    The positive constant in (4.8) is obtained for the selected component by the same least-aspect contradiction.
  To spell out the later inheritance, suppose homogeneous probability bins for a parent $P$ and a refinement $Q$
    have exponents $d_P \, d_Q$ with error $eta$; both may be conditional on an additional base $W$,
    including the exact particle. Here $d_P$ is the exponent for the child $P$,
    and $d_Q$ is the exponent for the joint child $\( P \, Q \)$,
    identified with $Q$ when $Q$ already records $P$; both children are conditional on $W$.
    If the exact particle is present, it belongs to $W$. On their common uniform typical set,
    ratios of joint and parent masses give
  $ Pr \( Q = q divides P = p \, W = w \) lt.eq epsilon.alt^(d_Q - d_P - 2 eta) \, wide \# { q :
    med \( p \, q \, w \) upright(" retained") } lt.eq epsilon.alt^(- \( d_Q - d_P \) - 2 eta) . $
  These are respectively an upper conditional mass and an upper retained support count;
    they are stronger than an averaged entropy inequality. If a subsequent normalized law $nu$ obeys $nu lt.eq
    epsilon.alt^(- theta) mu$, discard parent values whose marginal likelihood $nu_(P \, W) \/
    mu_(P \, W)$ is below $epsilon.alt^lambda$. Their $nu$-probability is at most $epsilon.alt^lambda$,
    and on the remaining parents the conditional mass bound loses at most $theta + lambda$ in its exponent.
    Support counts are inherited under restriction. The conditional relative-entropy identity in Lemma 5 supplies
    the corresponding lower entropy bound with loss $theta$. There is no factor depending on the number of parent
    values. Repeat this operation for the fixed finite list, then take a diagonal.
    For a block of length $h$, choose $eta \, theta \, lambda = o \( h \)$ at its inner stage before using $rho =
    epsilon.alt^h$ as the small parameter. Cap regularization may be imposed at the same stage to retain the root
    bound (4.4) under these operations.
] <rem:classical-profile-inheritance>

== 5 Exclusion of isotropic extremizers <sec:isotropic>

We exclude the isotropic alternative in Proposition 21. The argument has two geometric steps.
  Three sufficiently separated slopes would force more point entropy than saturation allows,
  so one can retain a slope population in a thin strip. That strip supplies an earlier anisotropic aperture;
  a two-slope projection estimate in the remaining block then forces a conditional time rate greater than one.
  Throughout both changes of scale we retain uniform conditional probability bounds on particle fibers,
  as well as the corresponding entropy inequalities.

#thm([Proposition 5.1.])[
  (Isotropic exclusion).  #emph[Suppose that $0 < gamma < 1$ and that the classical universal growth rate
    satisfies $beta > gamma$. There is no saturated isotropic system of duration and horizon $1$ furnished by
    Proposition 21, with homogeneous conditional time profile $sans(H) \( C_u divides T \) = s u$, $0 lt.eq u lt.eq 1$.]
] <prop:isotropic-exclusion>

Here and below, a limiting assertion about homogeneous probabilities is used on the trimmed laws of Lemma 5.
  In particular, it supplies uniform probability bounds on the retained joint population.
  An exceptional set of small probability in an untrimmed conditional law is not treated as a uniform probability
  bound. We give the finite estimates that implement this distinction in the present argument.

=== 5.1 Finite incidence counts and regular increments <finite-incidence-counts-and-regular-increments>

In the next two elementary estimates $rho$ is a mesh size, and all coordinates belong to a fixed bounded set.
  Constants may depend on that set, but not on $rho$. A point cell in dimension $d +
  1$ has coordinates $\( c \, x \) in bb(R) times bb(R)^d$,
  and a slope bin has representative $v in bb(R)^d$ and diameter $O \( rho \)$. The intercept map is

$ pi_v \( c \, x \) = x - c v . $

#thm([Lemma 5.2.])[
  (Counting intercepts on retained fibers).  #emph[Suppose an incidence population uses at most $N$ point cells.
    For every retained exact particle and slope bin incident to it,
    suppose there are at least $m$ distinct retained time children in the same base cell and slope bin.
    Suppose further that these children lie on one line of true slope within $O \( rho \)$ of the bin
    representative. Then, for each slope bin, all its retained incidences use at most $C N \/
    m$ intercept cells of side $rho$.]
] <lem:isotropic-intercepts>

#proof[
  Fix the slope bin. A particle’s intercept $x - c v$ varies by $O \( rho \)$ along its retained children.
    Its distinct time children give distinct point cells. For every occupied intercept cell $b$,
    choose one particle witnessing an incidence in $b$. The particle’s $m$ point cells have intercepts in a fixed
    bounded enlargement of $b$. A point cell can belong to the enlargements of only $C$ intercept cells,
    since $v$ is fixed. Counting the pairs consisting of an occupied intercept cell and one of these witnesses
    gives $m \# { b } lt.eq C N$. This counts point cells, and imposes no bound on the number or entropy of exact
    particles. The estimate concerns the population before replica labels are fixed;
    its support upper bound continues to hold on every subsequent subset. ◻
]

We will use the following explicit form of the star calculation in Theorem 8.
  Let $q$ be a normalized point–slope law with actual marginals $mu \, nu$, and suppose

#[#set math.equation(numbering: n => "(5.1)")
 $ q \( p \, v \) lt.eq K mu \( p \) nu \( v \) \, wide mu \( p \) lt.eq M^(- 1) . $ <eq:isotropic-pair-comparison>]

Sample $r$ slopes independently conditional on $p$. The resulting law $q_r$ satisfies both comparisons

#[#set math.equation(numbering: n => "(5.2)")
 $ q_r \( p \, v_1 \, dots.h \, v_r \) & lt.eq K^r mu \( p \) product_(i = 1)^r nu \( v_i \) \,\
q_r \( p \, v_1 \, dots.h \, v_r \) & lt.eq K^(r - 1) q \( p \, v_j \) product_(i eq.not j) nu \( v_i \)
  quad \( 1 lt.eq j lt.eq r \) . $ <eq:isotropic-star-comparison>]

These follow by multiplying $q \( v_i divides p \) lt.eq K nu \( v_i \)$,
  keeping one factor unestimated for the second inequality.
  If $lambda$ is the slope-tuple marginal, then the tuples on which $lambda \/ product_i nu \( v_i \) <
  L^(- 1)$ have $lambda$-mass at most $L^(- 1)$, by summing against the product probability. Outside that set,

#[#set math.equation(numbering: n => "(5.3)")
 $ q_r \( p divides v_1 \, dots.h \, v_r \) lt.eq K^r L mu \( p \) . $ <eq:isotropic-pinning>]

Thus fixing a typical tuple leaves at least $M \/ \( K^r L \)$ point cells.
  An event of independent slope probability $eta$ has star probability at most $K^r eta$.
  All applications below first trim pairs, discard point fibers of inadequate retention,
  and replace comparison marginals by the actual retained marginals using Theorem 8.
  Consequently (5.1) holds for the normalized retained law.
  The fixed labels will always be precisely these two or three slope replicas;
  no cyclic incidence configuration is used.

#thm([Lemma 5.3.])[
  (Two elementary projection inequalities).  #emph[Let $E$ be a set of occupied $rho$-cells in a fixed bounded region.]
  + #emph[In $bb(R)^3$, let $v_1 \, v_2 \, v_3 in bb(R)^2$ be bounded slopes and put $D =
    lr(|det \( \( 1 \, v_1 \) \, \( 1 \, v_2 \) \, \( 1 \, v_3 \) \)|) > 0$.
    If $pi_(v_i) \( E \)$ uses at most $N_i$ cells, with bounded enlargements permitted, then
#[#set math.equation(numbering: n => "(5.4)")
 $ lr(||) E^2 lt.eq C D^(- 6) N_1 N_2 N_3 . $ <eq:isotropic-lw>]

]
  + #emph[In $bb(R)^2$, for two bounded scalar slopes $v_1 \, v_2$ with $lr(|v_1 - v_2|) gt.eq rho^a$,
    if their intercepts use at most $N_1 \, N_2$ cells, then
#[#set math.equation(numbering: n => "(5.5)")
 $ lr(||) E lt.eq C rho^(- 2 a) N_1 N_2 . $ <eq:isotropic-two-projections>]

]
] <lem:isotropic-grid-projections>

#proof[
  For the first assertion choose a witness point in each occupied cell, and let $U$ have columns $\( 1 \, v_i \)$.
    Replace each $U^(- 1) z$ by its $rho$-grid cell, obtaining a finite grid set $Y$.
    Since $∥∥ U lt.eq C$, each cell of $Y$ accounts for at most $C$ original cells, so $lr(||) E lt.eq
    C lr(||) Y$. The map $pi_(v_i) U$ annihilates the $i$th coordinate.
    On the other two coordinates it is an invertible matrix of determinant of absolute value $D$ and inverse norm
    at most $C \/ D$. Thus each original intercept cell accounts for at most $C
    D^(- 2)$ cells of the coordinate projection of $Y$ omitting coordinate $i$.
    Rounding $U^(- 1) z$ adds only $O \( rho \)$ to its intercept, because $pi_(v_i) U$ has bounded norm.
  For completeness, the discrete Loomis–Whitney inequality #cite(label("LoomisWhitney1949")) used here is
  $ lr(||) Y^2 lt.eq lr(|pi_12 Y|) lr(|pi_13 Y|) lr(|pi_23 Y|) . $
  To see it, write $f_(i j)$ for the indicators of the three projected sets. The sum
  $ sum_(x \, y \, z) f_12 \( x \, y \) f_13 \( x \, z \) f_23 \( y \, z \) $
  majorizes $lr(||) Y$. Cauchy–Schwarz first in $z$ bounds this sum by $sum_(x \, y) f_12 \( x \, y \)
    sqrt(b_x c_y)$, where $b_x = sum_z f_13 \( x \, z \)$ and $c_y = sum_z f_23 \( y \, z \)$.
    Cauchy–Schwarz in $\( x \, y \)$ bounds its square by $lr(|pi_12 Y|) \( sum_x b_x \) \( sum_y c_y \)$.
    Combining the three projection bounds proves (5.4). For the second assertion,
    the inverse of $\( c \, x \) mapsto \( x - v_1 c \, x - v_2 c \)$ has norm at most $C rho^(- a)$.
    Each pair of intercept cells therefore meets at most $C rho^(- 2 a)$ point cells.
    Summing over the pairs proves (5.5). ◻
]

Here is the scale-selection fact needed twice below. Let $F_u$, $0 lt.eq u lt.eq 1$,
  be a filtration and let $X_h$ have normalized entropy at most $D h$.
  For an optional fixed conditioning variable $Z$, put $g_h \( u \) = sans(I) \( X_h \; F_u divides Z \)$.
  Nestedness and the chain rule give

#[#set math.equation(numbering: n => "(5.6)")
 $ integral_0^(1 - h) sans(I) \( X_h \; F_(u + h) divides Z \, F_u \) thin d u =
   integral_0^(1 - h) \( g_h \( u + h \) - g_h \( u \) \) thin d u lt.eq h sans(H) \( X_h divides Z \) lt.eq
   D h^2 . $ <eq:isotropic-integrated-information>]

The middle inequality follows by canceling the two integrals on their common interval.
  For a sequence $h_j$ with $sum_j sqrt(h_j) < oo$, Markov’s inequality and the elementary Borel–Cantelli argument
  show that, for almost every $u$, the integrand divided by $h_j$ is at most $sqrt(h_j)$ eventually.
  The same points may be required to be differentiability points of any fixed finite collection of Lipschitz
  entropy profiles.

Our anchored observations are nested only to bounded ambiguity.
  Formula (5.6) is applied to their limiting profiles. Its exact finite counterpart can instead use the nested
  dyadic cells of the physical point $\( c \, A + c V \)$: at every fixed depth $u$ these and
  $\( C_u \, \[ A + C_u V \]_u \)$ determine each other with a bounded number of possibilities.
  All entropy differences and conditional mutual informations consequently differ by
  $O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$. This error is taken to zero before $h$.

=== 5.2 The isotropic entropy bounds <the-isotropic-entropy-bounds>

For a vector $Y$, write $\[ Y \]_d$ or $Y_d$ for its isotropic grid observation at scale $epsilon.alt^d$.
  Assume the system in Proposition 23 exists. Write

$ O_u = \( C_u \, \[ A + C_u V \]_u \) \, wide O = O_1 \, wide alpha = 2 - 2 s + beta . $

The exact particle $T$ determines $A \, V$. In an anchored observation it leaves only the time label random,
  so $sans(H) \( O_u divides T \) = s u$. Write $tau$ for the root supremum,
  equivalently its uniformized cap level in the limiting system. The terminal weight is zero. Saturation therefore gives

#[#set math.equation(numbering: n => "(5.7)")
 $ beta = - sans(I) \( T \; O \) + 2 s - tau = 3 s - sans(H) \( O \) - tau . $ <eq:isotropic-terminal-score>]

Since $tau gt.eq 0$ and $sans(I) \( T \; O \) gt.eq 0$, we have $beta lt.eq 2 s$ and

#[#set math.equation(numbering: n => "(5.8)")
 $ sans(H) \( O \) lt.eq 3 s - beta \, wide sans(H) \( V_d divides O \) gt.eq
   alpha d quad \( 0 lt.eq d lt.eq 1 \) . $ <eq:isotropic-alpha>]

To prove the second inequality, test at duration $1 - d$ with velocity depths $\( d \, d \)$ and position depths
  $\( 1 \, 1 \)$. Denote this observation by $tilde(O)$. Its weight is $2 d$,
  and its conditional time entropy is $s \( 1 - d \)$. Universality and (5.7) imply

$ sans(I) \( T \; tilde(O) \) - sans(I) \( T \; O \) gt.eq \( 2 - 2 s + beta \) d . $

The pair $\( O \, V_d \)$ determines $tilde(O)$ to bounded ambiguity:
  transport over a time displacement $O \( epsilon.alt^(1 - d) \)$ with velocity uncertainty
  $O \( epsilon.alt^d \)$ has position error $O \( epsilon.alt \)$.
  The information difference is therefore at most $sans(H) \( V_d divides O \)$ in the limit.
  At $d = 1$ the identical inequality follows from the definition of the root supremum at duration zero.
  Notice that $alpha gt.eq beta > 0$.

Homogenize jointly $O$, $V_d$, and their conditioning variables, for the finite lists of depths used below.
  Formula (5.8) then means, on the trimmed joint population,

#[#set math.equation(numbering: n => "(5.9)")
 $ bb(P) \( V_d = q divides O = o \) lt.eq epsilon.alt^(alpha d - eta) $ <eq:isotropic-velocity-mass>]

with arbitrarily small $eta > 0$ after taking the inner limit.
  Indeed the conditional probability exponent is the difference of the homogeneous joint and marginal exponents,
  and that difference is at least $alpha d$. The same construction records the time probabilities conditional on
  the exact particle. It is legitimate on saturated homogeneous parts by the splitting and cap conclusions of
  Proposition 21.

=== 5.3 Concentration of slopes in a thin strip <concentration-of-slopes-in-a-thin-strip>

The profile $u mapsto sans(H) \( O_u \)$ is nondecreasing and $3$-Lipschitz, starts at zero,
  and has endpoint at most $3 s - beta$. There is consequently a set of positive measure of regular points $k
  in \( 0 \, 1 \)$ with

#[#set math.equation(numbering: n => "(5.10)")
 $ p := partial_k sans(H) \( O_k \) < 3 s - beta \/ 2 . $ <eq:isotropic-low-increment>]

Choose such a point satisfying (5.6) with $X_h = V_h$, whose entropy is at most $2 h$. Along a sequence $h arrow.b 0$,

#[#set math.equation(numbering: n => "(5.11)")
 $ sans(H) \( O_(k + h) divides O_k \) = \( p + o \( 1 \) \) h \, wide
   sans(I) \( V_h \; O_(k + h) divides O_k \) = o \( h \) . $ <eq:isotropic-first-increment>]

Inside a typical $O_k$-cell translate time and position to the cell center and dilate both by $epsilon.alt^(- k)$.
  Put $rho = epsilon.alt^h$, and call the child point observation $P$.
  Bounded changes from anchored to physical point cells do not affect any exponent.
  Homogeneity, the conditional fiber rule, and Lemma 6, followed by the actual-marginal conclusion of Theorem 8,
  give a normalized retained pair law $q \( P \, V_h \)$ satisfying the following bounds, with $e =
  e \( h \) arrow.r 0$:

#[#set math.equation(numbering: n => "(5.12)")
 $ \# "supp" P & lt.eq rho^(- \( p + e \)) \, & mu \( P = z \) & lt.eq rho^(p - e) \, & q & lt.eq
   rho^(- e) mu ⊗ nu . $ <eq:isotropic-first-graph>]

These conclusions hold outside base cells of probability tending to zero.
  One may enlarge $e \( h \)$ to absorb all fixed numerical constants and all $o \( 1 \)$ errors in (5.11).
  To be explicit about the conditioning: the mean information in block units tends to zero;
  discard base cells where it exceeds its square root, apply the likelihood-ratio truncation in each remaining
  cell, and discard point fibers losing more than half their mass.
  Homogeneous joint and marginal bounds then supply the two point estimates in (5.12).
  This procedure introduces only another quantity tending to zero into $e$.

We also trim on the exact particle fibers before sampling replicas.
  A retained time child, conditional on $T \, C_k$ in the original base law,
  has probability at most $rho^(s - e)$. Lift all pair restrictions to that law,
  and discard particle fibers whose conditional retention there is below $rho^e$.
  If the pair restrictions have total retention $m_0$, these discarded fibers have normalized retained mass at
  most $rho^e \/ m_0$, by (2.6). Here $m_0$ is bounded below before this step;
  more generally a subpower lower bound is absorbed by increasing $e$.
  Each remaining particle has at least $rho^(- s + 2 e)$ distinct retained time children,
  by dividing its retained mass by the original child mass bound.
  Given $T \, C_k$, the anchored base observation is fixed.
  Thus this is a statement in the very same base cell used for $P$; no particle entropy bound is involved.
  For a slope bin of size $rho$, all these points have intercept within $O \( rho \)$ of the particle’s intercept.
  Lemma 24 gives

#[#set math.equation(numbering: n => "(5.13)")
 $ \# pi_v \( upright("retained neighbors of ") v \) lt.eq
   C rho^(- \( p - s + 3 e \)) . $ <eq:isotropic-first-intercepts>]

Apply one final simultaneous marginal core to this pruned law.
  Its retention is at least one half, by Lemma 7, and the pair comparison again uses its actual point and slope
  marginals. Increasing $e$ absorbs the finite factors, so (5.12) and (5.13) hold together for this final pair
  law. The core need not preserve the rich particle fibers:
  the intercept support bound was established before it, and survives by support inclusion.
  Use this same order of operations in the two-replica application below.

Fix $theta.alt > 0$ so small that $12 theta.alt < beta \/ 8$.
  We claim that, in every retained base cell, some strip of thickness $C
  rho^theta.alt$ has slope mass at least $rho^(5 e)$, after enlarging $e \( h \) arrow.r 0$ once more.
  If all such strips had mass less than $rho^(5 e)$, two independent slopes would have distance at least
  $rho^theta.alt$ except with probability $C rho^(5 e)$; a ball of that radius is contained in a strip of
  comparable thickness. Conditional on the first two, the third would lie at distance at least $rho^theta.alt$
  from their line except with the same probability. Hence, outside an independent event of probability $C rho^(5 e)$,

$ lr(|det \( \( 1 \, v_1 \) \, \( 1 \, v_2 \) \, \( 1 \, v_3 \) \)|) gt.eq rho^(2 theta.alt) . $

For the three-replica star, (5.2) bounds the exceptional probability by $C rho^(2 e)$.
  Choose $L = rho^(- e)$ in (5.3). A good tuple then leaves a point population of at least $rho^(- p + 5 e)$
  cells, and each projection has the support bound (5.13). Lemma 25 implies

$ 2 p - 10 e lt.eq 3 \( p - s + 3 e \) + 12 theta.alt + o_(rho arrow.r 0) \( 1 \) \, wide upright("hence") wide
  p gt.eq 3 s - 12 theta.alt - 19 e - o_(rho arrow.r 0) \( 1 \) . $

This contradicts (5.10) for all sufficiently small $h$, with $rho$ taken sufficiently small afterwards.
  We take $e > 0$ even when an error vanishes, so that the exceptional probabilities above tend to zero in this
  inner limit.

Choose one such strip measurably in each base cell, using a finite grid menu with bounded enlargement,
  and restrict incidences to it. The total retention is at least $rho^(5 e)$ times the mass of the retained base
  cells. No strip index is fixed globally: its index is a function of $O_k$ and will be included in the earlier
  test through that base label. With

#[#set math.equation(numbering: n => "(5.14)")
 $ l = theta.alt h \, wide lr(|V dot.op n \( O_k \) - w \( O_k \)|) lt.eq C epsilon.alt^l \, $ <eq:isotropic-strip>]

round the unit normal and offset at precision $epsilon.alt^l$. This changes $C$ only.
  The Radon–Nikodym bound for the restriction is $epsilon.alt^(- O \( e h \))$.
  Since $theta.alt$ is fixed and $e \( h \) arrow.r 0$, its normalized logarithmic cost is $o \( l \)$.

The bins for $O$, the required $V_d$, and the particle-conditional time probabilities are trimmed before this
  restriction. Lemma 5 and its conditional retention rule therefore preserve their exponents with errors
  $o \( l \)$, including the particle-conditional time exponents and (5.9).
  The absolute root cap bound gives $tau_(upright("new")) lt.eq tau + o \( l \)$.
  The terminal numerator before subtraction of $tau$ changes by $o \( l \)$,
  because its observation and conditional time exponents were recorded.
  Consequently the new terminal score is at least $beta - o \( l \)$, and universality bounds it above by $beta +
  o \( l \)$. We henceforth use this retained law and its own root supremum; its terminal score is $beta + o \( l \)$.

=== 5.4 An earlier anisotropic observation <an-earlier-anisotropic-observation>

Take $h$ small enough that $k < 1 - l$, and put $a = 1 - l$.
  In the frame with normal $n = n \( O_k \)$ and tangent $n^perp$, form

#[#set math.equation(numbering: n => "(5.15)")
 $ B = #scale(x: 120%, y: 120%)[\(] O_k \, O_a \, \[ \( A + C_a V \) dot.op n \]_1 #scale(x: 120%, y: 120%)[\)] .
   $ <eq:isotropic-earlier-test>]

The coarse observation $O_a$ locates tangent position to depth $a$;
  its normal position is additionally located to depth $1$.
  The strip supplies normal velocity to depth $l$, and tangent velocity is bounded.
  The rounded frame is known to depth $l$. Thus $B$, with boundedly many additional data cells if necessary,
  is an admissible aperture with velocity depths $\( 0 \, l \)$, duration $a$, horizon $1$,
  and weight $\( 1 - gamma \) l$.

It is determined by $O$ to bounded ambiguity. Indeed $O$ coarsens to $O_k \, O_a$ to bounded ambiguity,
  hence determines the chosen strip up to the same fixed number of choices. For its fine normal position use

#[#set math.equation(numbering: n => "(5.16)")
 $ \( A + C_a V \) dot.op n = \( A + C_1 V \) dot.op n + \( C_a - C_1 \) w + O \( epsilon.alt \) \,
   $ <eq:isotropic-normal-transport>]

where the error is bounded by $C epsilon.alt^a epsilon.alt^l = C epsilon.alt$.
  Conversely every component of the anchored $B$ is fixed by $\( T \, C_a \)$, since $C_a$ fixes $C_k$. In particular,

#[#set math.equation(numbering: n => "(5.17)")
 $ sans(H) \( O divides T \, B \) = s l + o \( l \) . $ <eq:isotropic-last-time>]

The conditional time profile on the retained law follows from the ratios of the recorded probabilities at depths
  $a$ and $1$; the strip restriction costs $o \( l \)$ on typical particle fibers.
  Adjoining standard data cells to $B$ uses deterministic functions of $\( T \, C_a \)$ and leaves this argument
  unchanged.

We prove the information saving

#[#set math.equation(numbering: n => "(5.18)")
 $ sans(I) \( T \; O \) - sans(I) \( T \; B \) gt.eq s l - o \( l \) . $ <eq:isotropic-information-saving>]

The main point is a lower bound for the last block’s joint time and tangent position entropy.

=== 5.5 Slope bounds inside the last block <slope-bounds-inside-the-last-block>

For $0 lt.eq u lt.eq 1$ let $F_u$ record, in addition to $B$, time to depth $a +
  u l$ and tangent position at that time to the same depth.
  Within a $B$-cell translate time and tangent position to their depth-$a$ centers and dilate both by
  $epsilon.alt^(- a)$. The resulting coordinates are bounded, the new mesh parameter is $rho_(*) = epsilon.alt^l$,
  and the tangent slope $X = V dot.op n^perp$ remains bounded.
  The filtration $F_u$ has capacity $2$ per unit depth. Its base $F_0$ adds at most bounded information to $B$,
  and $F_1$ is determined by $\( O \, B \)$ to bounded ambiguity.
  Given $T \, B$, its conditional entropy profile is $s u + o \( 1 \)$ in block units,
  because its new data are fixed by the particle and the time cell.

For each fixed $d in \( 0 \, 1 \]$ and each fixed filtration depth $u$,
  the retained conditional tangent slope law satisfies

#[#set math.equation(numbering: n => "(5.19)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] X in J divides B \, F_u #scale(x: 120%, y: 120%)[\)] lt.eq
   rho_(*)^(alpha d - o \( 1 \)) quad upright("for intervals ") J upright(" of length ") rho_(*)^d .
   $ <eq:isotropic-inherited-tangent>]

Here, as throughout, the inequality is uniform on a further trimmed subprobability,
  followed by normalization on fibers of subpower retention.
  We verify this transfer, since a bare conditional entropy inequality would not suffice.

First apply (5.9) at velocity depth $d l$ on the jointly trimmed law.
  Adjoin the finite list of labels $\( B \, F_u \)$ to $O$.
  Each such list has at most $K$ possible values given $O$, where $K$ is fixed when the list is fixed.
  For a positive tolerance $zeta$, discard realized values whose conditional likelihood given $O$ is below
  $rho_(*)^zeta$. Their total probability is at most $K rho_(*)^zeta$.
  On the remaining values, conditioning on the adjoined label multiplies a conditional velocity-bin probability by
  at most $rho_(*)^(- zeta)$. More explicitly, write $kappa_h =
  O \( e \( h \) \/ theta.alt \)$ for an upper bound on all prior restriction costs in last-block units.
  Whenever a retained subprobability has mass at least $rho_(*)^(kappa_h)$,
  discard conditioning fibers whose retention is below $rho_(*)^(kappa_h + zeta)$.
  Formula (2.6) bounds their normalized retained mass by $rho_(*)^zeta$; normalization costs at most $kappa_h +
  zeta$ in the conditional exponent. For the fixed finite number of such operations,
  the total extra loss is $C kappa_h + C zeta$. It tends to zero by first taking the inner limit,
  then $h arrow.b 0$ and $zeta arrow.b 0$. It incurs no factor involving the number of $O$-cells or $B$-cells.

For a fixed $B$-cell, its normal strip has thickness $O \( epsilon.alt^l \)$.
  Its intersection with a tangent interval of length $epsilon.alt^(d l)$ meets only $C$ velocity grid cells of
  depth $d l$, since $d lt.eq 1$. Thus the same uniform upper bound holds for this tangent interval conditional on
  $O \, B \, F_u$. Averaging over compatible $O$-labels gives (5.19),
  with the explicit extra exponent loss $zeta$ and the retention losses.
  Taking those losses to zero proves the asserted form. Every bound is imposed on the retained joint population
  before averaging; no exponentially small bound for untrimmed exceptional probabilities is needed.

We now make the order of limits precise. Fix $theta.alt$ first. Choose the regular sequence $h arrow.b 0$ above.
  For each fixed $h$ record the finite lists of $O \, V_d$,
  and particle-conditional time bins before the strip choice.
  Construct $B \, F_u$ and perform the transfer just proved after choosing the strip.
  The later increment binnings are performed after this transfer.
  Take $epsilon.alt$ small enough that all inner mesh and bin errors, divided by $l$, tend to zero.
  A diagonal, with $h arrow.b 0$, gives last-block systems with parameter $rho_(*)$,
  exact limiting time profile $s u$, and (5.19) at a countable dense list of $\( u \, d \)$.
  Bounded coordinate capacities extend the entropy profiles to other depths.
  For the conditional mass bound at a subsequently chosen fixed filtration depth $u$,
  repeat the direct $O arrow.r \( B \, F_u \)$ determination and likelihood truncation above;
  it has the same bounded multiplicity. A requested slope depth $d$ is obtained by using recorded depths $d' <
  d$ and then letting $d' arrow.t d$. Thus the mass bound is inherited from that comparison,
  independently of continuity of entropy. A later increment length $r > 0$ is held fixed before each inner limit;
  only then is $r arrow.b 0$. Thus errors $o \( l \)$ from the first construction are never divided by an unchosen
  infinitesimal $r$. No bound on $sans(H) \( B \) \/ l$ is asserted or needed.

=== 5.6 Two-slope expansion and the score contradiction <two-slope-expansion-and-the-score-contradiction>

We show, in the last-block limits just constructed, that

#[#set math.equation(numbering: n => "(5.20)")
 $ sans(H) \( F_1 divides B \) gt.eq 2 s quad upright("in units ") log \( 1 \/ rho_(*) \) .
   $ <eq:isotropic-last-entropy>]

Write $f \( u \) = sans(H) \( F_u divides B \)$ in these units.
  It is nondecreasing and $2$-Lipschitz, with $f \( 0 \) = 0$.
  Apply (5.6) to $X_r$, the tangent slope prefix of depth $r$, conditional on $B$.
  Its entropy is at most $r$, so the integrated mutual information is at most $r^2$.
  At almost every regular interior $u$ there is consequently a sequence $r arrow.b
  0$ for which the increment has negligible information about $X_r$, in units of its own length.

In a typical $\( B \, F_u \)$-cell let $P_1$ be the time–tangent-position increment, at mesh $rho = rho_(*)^r$.
  Homogenize its probabilities and the pair with $X_r$. Let $p_1$ denote its point exponent.
  The likelihood-ratio and actual-marginal steps used in (5.12) give, with $e arrow.r 0$ along the regular sequence,

$ \# "supp" P_1 lt.eq rho^(- \( p_1 + e \)) \, wide mu_1 \( z \) lt.eq rho^(p_1 - e) \, wide q_1 lt.eq
  rho^(- e) mu_1 ⊗ nu_1 . $

The particle-conditional time exponent is $s$. Trimming exact particle fibers and applying Lemma 24 therefore
  bounds every retained intercept support by $C rho^(- \( p_1 - s + 3 e \))$.

Fix $0 < a_0 < 1$. Formula (5.19), at depth $a_0 r$, gives the actual retained slope marginal the interval bound
  $nu_1 \( J \) lt.eq rho^(alpha a_0 - o \( 1 \))$ for intervals of length $rho^(a_0)$.
  The two-replica star consequently has $lr(|v_1 - v_2|) gt.eq
  rho^(a_0)$ outside a set of probability $O \( rho^(alpha a_0 - 2 e - o \( 1 \)) \)$.
  Since $alpha > 0$, this probability tends to zero by taking $r$ sufficiently far along the regular sequence and
  then the inner small-parameter limit. Pin a good tuple using (5.3) with $L = rho^(- e)$.
  At least $rho^(- p_1 + 4 e)$ point cells remain. Their original intercept support bounds are still valid.
  Formula (5.5) now gives

$ p_1 - 4 e lt.eq 2 \( p_1 - s + 3 e \) + 2 a_0 + o \( 1 \) \, wide p_1 gt.eq 2 s - 2 a_0 - 10 e - o \( 1 \) . $

First let the regular-increment errors vanish, and then let $a_0 arrow.b 0$.
  This proves the lower entropy rate $p_1 gt.eq 2 s$.

Here is why the cellwise argument yields $f' \( u \) gt.eq 2 s$ almost everywhere,
  even if new homogeneous parts have different point exponents.
  Their conditional increment entropies average to $f \( u + r \) - f \( u \)$,
  and all have capacity at most $2 r + o \( r \)$. If $f' \( u \) < 2 s$ by a fixed amount,
  a positive fraction of the conditional population must have point exponents below $2
  s$ by a smaller fixed amount. The mean conditional information is $o \( r \)$,
  so Markov’s inequality removes a vanishing fraction while imposing the pair comparison above.
  The uniform time and slope bounds survive on the remaining typical fibers.
  Homogenizing a finite list costs a subpower, and thus selects a part with all these properties and the same
  fixed deficit. The preceding statement about inherited bounds can also be checked directly:
  in a fixed conditional cell, restriction to a part $E$ of mass $m$ gives $nu_E \( J \) lt.eq
  m^(- 1) nu \( J \)$. Here $m = rho^(o \( 1 \))$, so the slope exponent is preserved.
  Discard exact particle fibers retaining less than $m rho^zeta$ of their original conditional time law;
  their normalized retained mass is at most $rho^zeta$. The time exponent therefore loses at most
  $log_(1 \/ rho) \( 1 \/ m \) + zeta = o \( 1 \) + zeta$. These estimates justify the simultaneous selection
  without any count of conditioning cells. The two-slope inequality contradicts the fixed deficit.
  Since $f$ is Lipschitz, integrating $f' \( u \) gt.eq 2 s$ proves (5.20).

Returning to the original units, (5.20) and the determination of $F_1$ by $\( O \, B \)$ give

$ sans(H) \( O divides B \) gt.eq 2 s l - o \( l \) . $

Together with (5.17), this gives $sans(I) \( T \; O divides B \) gt.eq s l - o \( l \)$.
  Since $sans(H) \( B divides O \) = o \( l \)$, the information chain rule proves (5.18).

Finally let $Q_G$ denote the undivided score numerator, including subtraction of the root supremum of the retained
  law. The same root supremum occurs for $B$ and $O$. Their time entropies differ by $s l + o \( l \)$, so

$ Q_B - Q_O & = \( 1 - gamma \) l + sans(I) \( T \; O \) - sans(I) \( T \; B \) - 2 s l + o \( l \)\
 & gt.eq \( 1 - gamma - s \) l - o \( l \) . $

On the other hand terminal saturation and the universal duration bound give $Q_O = beta +
  o \( l \)$ and $Q_B lt.eq beta \( 1 - l \) + o \( l \)$. Divide by $l$ and pass through the specified limits to obtain

$ 1 - gamma - s lt.eq - beta \, wide s gt.eq 1 + beta - gamma > 1 . $

This contradicts the scalar time capacity $s lt.eq 1$ and proves Proposition 23.

== 6 The matched plane and its traces <sec:characteristic-plane>

The trace construction applies to the matched process of Proposition 21 for any least aspect $m > 0$.
  In the proof of Theorem 15, this is the alternative remaining under $beta > gamma$ after Proposition 23.
  Its saturated apertures have shapes

$ \( b \( u \) \, a \( u \) \) = \( b \( u \) \, b \( u \) + m u \) \, wide 0 < u < 1 \, $

with horizon $L = 1 + m$, a Lipschitz function $b$, and $0 lt.eq - b' lt.eq 1 + m$ almost everywhere.
  Their labels use one common time filtration and the prefixes of one orientation, as supplied by Proposition 21.

=== 6.1 The information profile and the contact relation <the-information-profile-and-the-contact-relation>

Work in one bounded slope chart, using the row frame from the end of Proposition 21.
  The particle $T$ carries $\( V \, A \)$. At label time $v$ put $E_v = \( C_v \, R_(m v) \)$ and set

#[#set math.equation(numbering: n => "(6.1)")
 $ X = V_1 \, wide Y = A_1 + C_v X \, wide W = V_2 - R_(m v) X \, wide Z = A_2 + C_v V_2 -
   R_(m v) Y . $ <eq:trace-variables>]

For data depths $upright(bold(L)) = \( L_X \, L_Y \, L_W \, L_Z \)$ let $O \( upright(bold(L)) \, v \)$ record
  $E_v$ and these four variables at their respective grid precisions. We allow the depths to vary on compact subsets of

#[#set math.equation(numbering: n => "(6.2)")
 $ L_Y - L_X & lt.eq v \, & L_W - L_X & lt.eq m v \,\
L_Z - L_W & lt.eq v \, & L_Z - L_Y & lt.eq m v \, wide 0 < v < 1 . $ <eq:trace-domain>]

They may range over any fixed bounded extension of the depths of the apertures;
  a negative depth gives only boundedly many bins.

When $m = 1$, impose $L_Y = L_W = L_U$ at this point and regard $U = \( Y \, W \)$ as one datum of capacity two,
  with $upright(bold(L)) = \( L_X \, L_U \, L_Z \)$. The profile and all the trace statements below are then
  defined on this grouped domain, and the middle datum has one joint trace rate.

The finite matched apertures occupy a particular plane in the depth domain.
  At time $u$, an aperture with common depth $i$ has velocity depths $\( i \, i + m u \)$ and position depths
  $\( i + u \, i + \( 1 + m \) u \)$. Define

#[#set math.equation(numbering: n => "(6.3)")
 $ Pi_m \( i \, u \) & = \( i \, i + u \, i + m u \, i + \( 1 + m \) u \, u \) \, &  & m eq.not 1 \,\
Pi_1 \( i \, u \) & = \( i \, i + u \, i + 2 u \, u \) \, &  & m = 1 . $ <eq:matched-plane>]

The coordinate orders are $\( L_X \, L_Y \, L_W \, L_Z \, v \)$ and $\( L_X \, L_U \, L_Z \, v \)$, respectively.
  The finite matched observation is $O \( upright(bold(L)) \, u \)$ with $\( upright(bold(L)) \, u \) =
  Pi_m \( i \, u \)$. Every inequality in (6.2) is an equality on this plane.
  The part corresponding to admissible apertures is

#[#set math.equation(numbering: n => "(6.4)")
 $ cal(A)_m = { \( i \, u \) : 0 < u < 1 \, quad i gt.eq 0 \, quad i + \( 1 + m \) u lt.eq
   L } . $ <eq:matched-aperture-region>]

The path observations are the points $i = b \( u \)$, up to the zero-cost grid choices already established for the
  common row frame. The bounded extension of the data depths gives a neighborhood within this plane across the
  boundary of $cal(A)_m$. The full depth domain still has the one-sided faces in (6.2).

We now make one homogeneous choice before defining the limiting functions.
  Start with a countable dense family of admissible depth configurations and the countable family of all finite
  tuples formed from their observations, including the versions conditional on $T$.
  Also include the score observations at dyadic path times.
  At each stage use only a finite initial list and finitely many path times.
  Apply the cap regularization of Lemma 17, then the uniform bins of Lemma 5.
  By Lemma 16, select typical components whose finitely many score deficits lie under one deterministic vanishing
  envelope. Let the lists grow and the bin meshes shrink slowly with the precision.
  The diagonal of Lemma 10, as in Remark 22, gives one sequence of finite laws $p_epsilon.alt$ carrying all the
  listed homogeneous profiles. Every listed path observation is saturated along this sequence in the limit.
  Only after this sequence is chosen do we define

$ f_epsilon.alt \( upright(bold(L)) \, v \) = sans(I)^(p_epsilon.alt) \( T \; O \( upright(bold(L)) \, v \) \) \,
  wide S_epsilon.alt \( v \) = sans(H)^(p_epsilon.alt) \( C_v divides T \) . $

Lemma 10 and the box comparisons below give a limiting profile $f$ on (6.2);
  write $S$ for the limiting time profile. The finite root suprema are bounded,
  so pass to a further subsequence and write $tau$ for the limit of $tau_L \( T \)$.
  The limiting score along the path is continuous: $b \, S$ are Lipschitz,
  and the box comparisons give continuity of $f$ along $Pi_m \( b \( u \) \, u \)$.
  Saturation at the dense dyadic times therefore extends to every $0 < u < 1$.
  The positive constant in (4.8) is obtained for this selected component by the least-aspect argument;
  it need not be the constant before the split. The symbols $f \, S \, tau$ below refer to this component,
  whose profiles may differ from those before the split. Later,
  a trace point and a positive block length will be chosen for this fixed $f$ before the required real-depth bins
  and finite precision are selected.

The information of a matched aperture is therefore the restriction

#[#set math.equation(numbering: n => "(6.5)")
 $ Phi \( i \, u \) = f #scale(x: 120%, y: 120%)[\(] Pi_m \( i \, u \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:matched-plane-profile>]

The weight of the aperture at $\( i \, u \)$ is $2 i + \( 1 - gamma \) m u$.
  Rearranging the universal score bound and using saturation on the path gives

#[#set math.equation(numbering: n => "(6.6)")
 $ Phi \( i \, u \) gt.eq 2 i + \( 1 - gamma \) m u + 2 S \( u \) - beta u - tau \, wide
   upright("with equality when ") i = b \( u \) . $ <eq:closure-obstacle>]

We call this equality the contact relation. The local projection arguments will constrain the information rates at
  almost every plane point with $i > 0$, while saturation is known on this particular contact curve.
  We therefore need both local affine approximations on the plane and control of how the rates cross the curve.

At a differentiability point of $b$ put $p = - b' \( u \)$.
  A direction $V_c = partial_u - c partial_i$ preserves the data depth $i + c u$,
  and its crossing factor at the contact curve is $p - c$. Here the clocks are $0 \, 1 \, m \, 1 + m$,
  with the two middle clocks grouped when $m = 1$. Figure 2 shows these relations.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.25, 4.392), [#text(size: 9pt)[Admissible resolutions]])
  line((0, 0), (4.5, 0), (0, 3.6), close: true, fill: rgb("#f1f2f2"), stroke: none)
  line((4.5, 0), (0, 3.6), stroke: (paint: rgb("#666c71"), thickness: 0.65pt, miter-limit: 10))
  content((2.205, 1.942), [#text(size: 8pt)[$i+3u=3$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (4.95, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.95, 0), [#text(size: 9pt)[$i$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 4.068), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 4.068), [#text(size: 9pt)[$u$]], anchor: "south", padding: 0.1176cm)
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((4.5, 0), [#text(size: 9pt)[$3$]], anchor: "north", padding: 0.1176cm)
  content((0, 3.6), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  line((2.25, 0), (0, 3.6), stroke: (paint: rgb("#27597a"), thickness: 0.95pt, miter-limit: 10))
  content((2.13, 0.648), [#text(fill: rgb("#27597a"))[#text(size: 8pt)[$i=b(u)$]]], anchor: "west", padding: 0.1176cm)
  line((2.1, 0.648), (1.958, 0.468), stroke: (paint: rgb("#27597a"), thickness: 0.4pt, miter-limit: 10))
  content((2.01, 1.656), [#text(size: 10pt)[$+$]])
  content((0.465, 1.656), [#text(size: 10pt)[$-$]])
  circle((1.237, 1.62), radius: 0.04939, fill: black, stroke: none)
  rect((0.8625, 1.224), (1.612, 2.016), stroke: (paint: rgb("#666c71"), thickness: 0.5pt, miter-limit: 10, dash: "dashed"))
  content((2.25, -0.576), [#text(size: 8pt)[$m=2, L=3, b(u)= frac(3, 2) (1-u)$]], anchor: "north", padding: 0.1176cm)
  content((10, 4.39), [#text(size: 9pt)[Directions at a contact point]])
  line((7.35, 1.3), (12.08, 1.3), stroke: (paint: rgb("#94989c"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#94989c"))))
  content((12.08, 1.3), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$Delta i$]]], anchor: "west", padding: 0.1176cm)
  line((10, -0.25), (10, 3.75), stroke: (paint: rgb("#94989c"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#94989c"))))
  content((10, 3.75), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$Delta u$]]], anchor: "south", padding: 0.1176cm)
  line((7.54, 2.94), (11.98, -0.02), stroke: (paint: rgb("#27597a"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((11.83, -0.03), [#text(fill: rgb("#27597a"))[#text(size: 8pt)[tangent: $Delta i=-p thin Delta u$]]], anchor: "north-east", padding: 0.1176cm)
  line((10, 1.3), (10, 3.47), stroke: (thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((10.12, 3.21), [#text(size: 8pt)[$c=0$]], anchor: "west", padding: 0.1176cm)
  line((10, 1.3), (8.46, 2.84), stroke: (thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((8.42, 2.94), [#text(size: 8pt)[$c=1$]], anchor: "south-east", padding: 0.1176cm)
  line((10, 1.3), (8.05, 2.275), stroke: (thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.96, 2.34), [#text(size: 8pt)[$c=m=2$]], anchor: "south-east", padding: 0.1176cm)
  line((10, 1.3), (7.91, 1.997), stroke: (thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.82, 1.94), [#text(size: 8pt)[$c=1+m=3$]], anchor: "north-east", padding: 0.1176cm)
  circle((10, 1.3), radius: 0.04939, fill: black, stroke: none)
  content((10.8, 2.05), [#text(size: 10pt)[$+$]])
  content((9.15, 0.57), [#text(size: 10pt)[$-$]])
  content((10.54, 2.69), [#text(size: 8pt)[$V_c= partial_u-c partial_i$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 2: The resolution triangle $i gt.eq 0$, $u gt.eq 0$, $i + \( 1 + m \) u lt.eq L$ and the characteristic directions $d i \/ d u = - c$, where $c in { 0 \, 1 \, m \, 1 + m }$. Each direction $V_c = partial_u - c partial_i$ preserves the corresponding data depth $i + c u$. The explicit example on the left has $m = 2$ and contact slope $p = - b' \( u \) = 3 \/ 2$; its two axes use different drawing scales. The right panel uses equal scales for the local increments. The signs mark $plus.minus \( i - b \( u \) \) > 0$. At a transverse contact, $p eq.not c$, the crossing factor is $V_c \( i - b \( u \) \) = p - c$. Existence of one-sided traces and the associated jump identities use the hypotheses of Lemma 28. ],
) <fig:characteristic-plane>

Ambient almost-everywhere differentiability does not solve the local problem:
  the entire matched plane lies on the boundary of (6.2), and could lie in the ambient exceptional set.
  We will obtain the needed traces from the signs of the mixed derivatives.
  Their affine approximation will produce finite entropy blocks for Section 7;
  their measure identities will later pass those rate constraints to the contact curve.

Here are the properties of $f$ supplied by the finite observations.
  It is locally Lipschitz and nondecreasing in every coordinate;
  its data derivatives lie between zero and the capacity of that coordinate.
  Its label derivative is nonnegative and locally bounded. Every mixed derivative involving two different
  coordinates, including a data coordinate and $v$, is a nonpositive distribution in the interior.
  We verify the signs, especially the one involving the label.

Advance $v$ to $v' > v$. Write $a = C_(v') - C_v$ and $r = R_(m v) - R_(m v')$.
  Nested labels give $\| a \| lt.tilde epsilon.alt^v$, $\| r \| lt.tilde epsilon.alt^(m v)$, and the change of data is

#[#set math.equation(numbering: n => "(6.7)")
 $ X' = X \, quad Y' = Y + a X \, quad W' = W + r X \, quad Z' = Z + a W + r Y + a r X . $ <eq:trace-frame-change>]

In a data box, the uncertainty in $Y'$ is bounded by a constant times $epsilon.alt^(L_Y) + epsilon.alt^(v + L_X)$,
  and that in $W'$ by a constant times $epsilon.alt^(L_W) + epsilon.alt^(m v + L_X)$.
  The uncertainty in $Z'$ is bounded by

$ C #scale(x: 120%, y: 120%)[\(] epsilon.alt^(L_Z) + epsilon.alt^(v + L_W) + epsilon.alt^(m v + L_Y) +
  epsilon.alt^(\( 1 + m \) v + L_X) #scale(x: 120%, y: 120%)[\)] . $

The four inequalities in (6.2) bound these by the respective target widths. The inverse shear has the same bounds.
  Consequently, conditional on $E_(v')$, the old and new data descriptions at fixed admissible depths determine
  each other with bounded ambiguity. This assertion also holds at each corner of any coordinate rectangle
  contained in the domain.

At fixed labels, a data refinement is determined by the particle and labels.
  Its increase in particle information is therefore exactly its conditional entropy,
  up to the bounded bin ambiguities. A further data refinement can only decrease this conditional entropy.
  For a label refinement, express both ends of the data refinement in the old frame conditional on $E_(v')$,
  using (6.7). The two information increments being compared are then

$ sans(H) \( D_(upright("fine")) divides E_v \, D_(upright("coarse")) \) quad upright("and") quad
  sans(H) \( D_(upright("fine")) divides E_(v') \, D_(upright("coarse")) \) \, $

up to $O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$; the latter is no larger than the former.
  Here $D_(upright("coarse"))$ includes every other data coordinate.
  Thus each mixed rectangle difference of $f_epsilon.alt$ is nonpositive up to an error vanishing as $epsilon.alt
  arrow.b 0$. Passing to the limiting profile proves the mixed signs,
  first for rectangle differences and then for distributions,
  by integrating the rectangle inequalities against nonnegative smooth test functions and shrinking the rectangles.

Refining a scalar datum by $d$ costs at most $d + O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$ in normalized entropy;
  for $U$ the bound is $2 d + O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$.
  Advancing the labels by $d$ costs at most $\( 1 + m \) d + O \( 1 \/ log \( 1 \/ epsilon.alt \) \)$.
  The old data are recoverable from the new observation, and the change of data conditional on the new labels has
  bounded ambiguity. These facts give monotonicity and the asserted Lipschitz bounds.
  For two nearby points on flat faces, move first to a common slightly finer label so that coordinatewise
  comparison is admissible. This proves the same bounds up to those faces.
  The argument uses vector conditional entropy unchanged when $Y \, W$ are grouped.

These comparisons also upgrade the dense diagonal to locally uniform convergence.
  Fix a compact subset $K$ of (6.2) and a compact relative neighborhood $K^(+)$ of it.
  Uniformly for nearby $z \, z' in K^(+)$, the box bounds give

$ \| f_epsilon.alt \( z \) - f_epsilon.alt \( z' \) \| lt.eq C_K parallel z - z' parallel_1 +
  O_K \( 1 \/ log \( 1 \/ epsilon.alt \) \) . $

The same estimate holds at the faces: the common finer label needed there advances time by
  $O_K \( parallel z - z' parallel_1 \)$, and stays in the domain for nearby points because $K^(+)$ has label
  times bounded away from the endpoints. For a fixed sufficiently small $delta > 0$,
  choose a finite $delta$-net $z_1 \, dots.h \, z_N$ for $K$ from the dense family in $K^(+)$.
  The same Lipschitz bound for $f$ then gives

$ sup_(z in K) \| f_epsilon.alt \( z \) - f \( z \) \| lt.eq max_(1 lt.eq j lt.eq N) \| f_epsilon.alt \( z_j \) -
  f \( z_j \) \| + 2 C_K delta + O_K \( 1 \/ log \( 1 \/ epsilon.alt \) \) . $

First let $epsilon.alt arrow.r 0$ along the selected sequence,
  using convergence at these finitely many net points, and then let $delta arrow.b 0$.
  Thus $f_epsilon.alt arrow.r f$ locally uniformly on the full closed-sided domain, including its faces.

=== 6.2 An abstract trace theorem <an-abstract-trace-theorem>

We now isolate the consequence of these mixed signs for a plane whose data depths move at distinct speeds.
  The grouped middle datum at $m = 1$ is what makes the speeds distinct in that case.

Let $n gt.eq 2$, let $c_1 < dots.h.c < c_n$ be distinct real numbers,
  and let $cal(E)$ be a nonempty set of ordered pairs $\( j \, k \)$ with $j < k$.
  For an open interval $I$ define the closed-sided region

$ cal(D) = { \( upright(bold(L)) \, v \) in bb(R)^n times I : L_k -
  L_j lt.eq \( c_k - c_j \) v upright(" for ") \( j \, k \) in cal(E) } . $

Its interior is obtained by making these inequalities strict. Define

#[#set math.equation(numbering: n => "(6.8)")
 $ Pi \( i \, u \) & = \( i + c_1 u \, dots.h \, i + c_n u \, u \) \,\
cal(K) & = { xi in bb(R)^(n + 1) : xi_k - xi_j lt.eq \( c_k - c_j \) xi_v upright(" for ") \( j \, k \) in cal(E) } \,\
V_j & = partial_u - c_j partial_i . $ <eq:trace-plane-cone>]

The cone $cal(K)$ has nonempty interior and is invariant under translation by either tangent vector
  $e = \( 1 \, dots.h \, 1 \, 0 \)$ or $t = \( c_1 \, dots.h \, c_n \, 1 \)$.
  In particular, for $h gt.eq 0$, $Pi \( i \, u \) + h xi$ belongs to $cal(D)$ for $xi in cal(K)$,
  provided its label time belongs to $I$.

#thm([Theorem 6.1.])[
  (Characteristic-plane traces).  #emph[Suppose $f$ is locally Lipschitz on $cal(D)$, and, in its interior,
$ 0 lt.eq f_j lt.eq d_j \, wide 0 lt.eq f_v lt.eq d_v \, wide f_(j k) lt.eq 0 med \( j eq.not k \) \, wide
  f_(j v) lt.eq 0 $

 in the distributional sense. The derivative bounds may instead be local bounds on each compact neighborhood under
   consideration; in that case all conclusions concerning boundedness are local.
   Then there are, up to null sets, uniquely determined locally bounded fields $a_1 \, dots.h \, a_n \,
   D$ on $bb(R) times I$, with $0 lt.eq a_j lt.eq d_j$ and $0 lt.eq D lt.eq d_v$, having the following properties.]
  + #emph[#emph[Strong traces.] For almost every interior offset $eta in cal(K)^compose$,
    the restrictions of the ambient gradients to $Pi \( dot.op \) + eta$ are defined almost everywhere.
    As $eta arrow.r 0$ through such offsets, they converge strongly in $L_(upright("loc"))^1 \( d i thin d u \)$
    to $\( a_1 \, dots.h \, a_n \, D \)$. For $Q subset.double Q' subset.double bb(R) times
    I$ this convergence has the bound
#[#set math.equation(numbering: n => "(6.9)")
 $ parallel f_alpha \( Pi \( dot.op \) + eta \) - A_alpha parallel_(L^1 \( Q \)) lt.eq C_Q \| eta \| +
   omega_(alpha \, Q') \( C_Q \| eta \| \) \, wide A = \( a_1 \, dots.h \, a_n \, D \) \,
   $ <eq:trace-quantitative-slices>]

 where $omega_(alpha \, Q') \( r \) arrow.r 0$ is the $L^1$ translation modulus of $A_alpha$ on $Q'$.
   The constant depends only on the local derivative bounds, the clock speeds, and the two patches.]
  + #emph[#emph[Measure identities.] There exist locally finite nonnegative measures $nu_(j k) = nu_(k j)$,
    $j eq.not k$, and $nu_(j v)$ on the plane such that
#[#set math.equation(numbering: n => "(6.10)")
 $ V_j a_j = - nu_(j v) - sum_(k eq.not j) \( c_k - c_j \) nu_(j k) \, wide partial_i D = -
   sum_j nu_(j v) . $ <eq:trace-mixed-measures>]

 For $F = f compose Pi$, the weak derivatives are
#[#set math.equation(numbering: n => "(6.11)")
 $ F_i = sum_j a_j \, wide F_u = sum_j c_j a_j + D . $ <eq:trace-plane-derivatives>]

 In particular,
#[#set math.equation(numbering: n => "(6.12)")
 $ V_n a_n gt.eq partial_i D $ <eq:trace-distribution-inequality>]

 as measures. With $q_j = 1 + c_n - c_j$, the full flux identity is
#[#set math.equation(numbering: n => "(6.13)")
 $ - sum_j q_j V_j a_j = sum_(j < k) \( c_k - c_j \)^2 nu_(j k) + sum_j q_j nu_(j v) . $ <eq:trace-measure-flux>]

]
  + #emph[#emph[Affine approximation.] There is a sequence $h_ell arrow.b 0$ and a single null set $N subset bb(R)
    times I$ such that, for every $\( i \, u \) in.not N$ and every finite $R$,
#[#set math.equation(numbering: n => "(6.14)")
 $ lim_(ell arrow.r oo) sup_(xi in cal(K) \, med \| xi \| lt.eq R)
   lr(|frac(f \( Pi \( i \, u \) + h_ell xi \) - f \( Pi \( i \, u \) \), h_ell) - sum_j a_j \( i \, u \) xi_j -
   D \( i \, u \) xi_v|) = 0 . $ <eq:trace-affine-blowup>]

 Only sufficiently large $ell$, for which the displayed label times belong to $I$, are used.
   The sequence may depend on $f$.]
] <thm:characteristic-trace>

#proof[
  All estimates are local. Fix nested bounded open plane patches $Q subset.double Q' subset.double
    Q''$ and a nonnegative smooth function $chi$ supported in $Q'$ and equal to one on $Q$.
    All small offsets below keep $Pi \( Q'' \) + eta$ in the fixed neighborhood where the derivative bounds hold.
    Smooth $f$ by convolution at a radius smaller than the distance of the offset patch from the boundary.
    The mixed signs and first derivative bounds persist. We first work with this smooth function.
  On any parallel interior plane the chain rule gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ sum_j q_j V_j f_j \( Pi + eta \) & = sum_(j < k) \( q_j - q_k \) \( c_k - c_j \) f_(j k) \( Pi + eta \) +
     sum_j q_j f_(j v) \( Pi + eta \)\
 & = sum_(j < k) \( c_k - c_j \)^2 f_(j k) \( Pi + eta \) + sum_j q_j f_(j v) \( Pi + eta \) . $ <eq:trace-smooth-flux>]
  Let $M$ bound the absolute values of the first derivatives on this neighborhood.
    Multiplication by $- chi$ and integration by parts gives
  #[#set math.equation(numbering: n => "(6.16)")
   $ & sum_(j < k) \( c_k - c_j \)^2 integral chi \( - f_(j k) \) \( Pi + eta \) +
     sum_j q_j integral chi \( - f_(j v) \) \( Pi + eta \)\
 & #h(35mm)  lt.eq M sum_j q_j parallel V_j chi parallel_(L^1) . $ <eq:trace-flux-bound>]
  Every integrand on the left is nonnegative. Since the speeds are distinct,
    this controls each mixed derivative separately, uniformly in the offset and smoothing radius.
    For example, the sum of all their masses on $Q$ is at most
  $ C_Q = frac(M sum_j q_j parallel V_j chi parallel_1, min { 1 \, min_(j < k) \( c_k - c_j \)^2 }) . $
  Changing $C_Q$ to accommodate larger patches causes no difficulty.
  We next construct the strong traces. Write $alpha$ for one ambient coordinate, either a datum or $v$.
    Consider interior offsets with $eta_alpha = 0$. Their cone is convex and nonempty:
    for a data coordinate $j$ one may take $eta_v > 0$ and all data offsets zero; for $alpha =
    v$ one may take $eta_k = - c_k$ and $eta_v = 0$. If $eta_alpha = eta'_alpha = 0$,
    the fundamental theorem of calculus along their segment, followed by (6.16), gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ & parallel f_alpha \( Pi + eta \) - f_alpha \( Pi + eta' \) parallel_(L^1 \( Q \))\
 & quad lt.eq sum_(beta eq.not alpha) \| eta_beta - eta'_beta \| integral_0^1 integral_Q \|
   f_(alpha beta) \( Pi + \( 1 - s \) eta + s eta' \) \| thin d i thin d u thin d s lt.eq C_Q \| eta -
   eta' \| . $ <eq:trace-own-coordinate>]
  Only mixed derivatives occur in this estimate.
  For completeness, this slice estimate passes to the nonsmooth function without choosing an arbitrary restriction
    of an $L^oo$ field. On compact interior sets the smoothed gradients converge to the weak gradients in $L^1$.
    The linear map
  $ \( i \, u \, eta \) mapsto Pi \( i \, u \) + eta \, wide eta_alpha = 0 \, $
  has full rank. Fubini’s theorem and a subsequence therefore give $L^1 \( Q \)$ convergence of the smoothed
    restrictions for almost every such offset. Exhaust the allowable offset sets and patches countably.
    For any two offsets in the resulting full-measure set, their compact connecting segment is interior,
    so (6.17) passes to the limit. It makes the restrictions an $L^1 \( Q \)$ Cauchy family as their offsets tend
    to zero. The limits on different patches agree; call the resulting field $A_alpha$. Letting $eta' arrow.r 0$ gives
  $ parallel f_alpha \( Pi + eta \) - A_alpha parallel_(L^1 \( Q \)) lt.eq C_Q \| eta \| quad
    upright("when ") eta_alpha = 0 . $
  The derivative bounds pass to this limit.
  For a general data offset remove its $j$th component by replacing $eta$ with $eta -
    eta_j e$ and translating $i$ by $eta_j$. For the label derivative replace $eta$ with $eta -
    eta_v t$ and translate $u$ by $eta_v$. Cone membership is unchanged by these operations.
    Translation continuity in $L^1$ now proves (6.9), for almost every general offset.
    It also proves uniqueness of the traces. No pointwise modulus of continuity of the gradients has been used.
  Choose interior offsets tending to zero for which all the gradient restrictions converge strongly on the
    countable exhaustion of patches. For each offset choose a still smaller convolution radius so that the
    smoothed restrictions have the same limits. The nonnegative measures on each slice with densities $-
    f_(j k)$ and $- f_(j v)$ have locally bounded masses by (6.16).
    Successive weak measure limits, with a diagonal choice on the patches, give $nu_(j k)$ and $nu_(j v)$.
    The slice identities
  $ V_j f_j = f_(j v) + sum_(k eq.not j) \( c_k - c_j \) f_(j k) \, wide partial_i f_v = sum_j f_(j v) $
  pass to the limit against smooth test functions, proving (6.10) and (6.13).
    The potentials on these slices converge locally uniformly to $F$,
    whereas their tangential derivatives converge strongly in $L^1$. This gives (6.11). Finally,
  $ V_n a_n - partial_i D = sum_(k < n) \( c_n - c_k \) nu_(n k) + sum_(j < n) nu_(j v) gt.eq 0 \, $
  which proves (6.12). The measures used to represent the mixed derivatives need not be unique;
    the trace fields and the distributional conclusions are unique.
  It remains to prove the assertion about this particular plane.
    For a bounded base patch $Q$ and an integer $R gt.eq 1$, define
  $ e_(h \, Q \, R) \( i \, u \) = integral_(cal(K) ∩ B_R) \| nabla f \( Pi \( i \, u \) + h xi \) -
    A \( i \, u \) \| thin d xi . $
  The boundary of the cone has ambient measure zero and is irrelevant to this integral.
    The strong slice convergence, Fubini’s theorem and the boundedness of the gradients show that
  #[#set math.equation(numbering: n => "(6.18)")
   $ integral_Q e_(h \, Q \, R) arrow.r 0 wide \( h arrow.b 0 \) . $ <eq:trace-integrated-gradient>]
  More quantitatively the integral is bounded by a constant depending on $R \, Q$ times $h +
    sum_alpha omega_(alpha \, Q') \( C_R h \)$. Choose $h_ell arrow.b
    0$ so that the integrals in (6.18) are at most $2^(- ell)$ for the first $ell$ members of a countable
    exhaustion of patches and radii. The summability of these integrals implies $e_(h_ell \, Q \, R) \( i \, u \)
    arrow.r 0$ outside one null set.
  Fix a point outside that set. The rescaled potentials
  $ g_ell \( xi \) = frac(f \( Pi \( i \, u \) + h_ell xi \) - f \( Pi \( i \, u \) \), h_ell) $
  are uniformly Lipschitz on each bounded part of $cal(K)$ and vanish at zero.
    Every locally uniformly convergent subsequence has weak gradient equal to the constant $A \( i \, u \)$ in
    $cal(K)^compose$, by the mean gradient convergence just proved. This interior is connected.
    Thus the limit is $A \( i \, u \) dot.op xi$ there, and continuity gives the same identity on the closed cone,
    including its vertex and faces. Compactness of the uniformly Lipschitz functions and uniqueness of this limit
    imply convergence of the whole chosen sequence, as stated in (6.14). ◻
]

=== 6.3 Finite approximation after selecting the block scale <finite-approximation-after-selecting-the-block-scale>

The next consequence specifies exactly what is required of the finite entropy systems.
  Its exceptional set is a set of base points on the plane;
  probabilistic trimming of conditional cells is a separate use of Lemma 5 and Theorem 8.

#thm([Corollary 6.2.])[
  (Quantified finite profile approximation).  #emph[Assume Theorem 26, and let $f_epsilon.alt arrow.r
    f$ locally uniformly on $cal(D)$ along the sequence of finite systems under consideration.
    Fix a bounded measurable base patch $Q$ of positive measure with compact closure in $bb(R) times I$,
    a radius $R gt.eq 1$, an error $eta > 0$, an exceptional proportion $0 < tau < 1$,
    and a maximum block length $h_(*) > 0$. There exist
$ 0 < h < h_(*) \, wide G subset Q \, wide \| Q \\ G \| lt.eq tau \| Q \| \, $

 and a compact neighborhood $K_0 subset cal(D)$ containing all $Pi \( q \) + h xi$ with $q in overline(Q)$,
   $xi in cal(K) ∩ B_R$, such that the following holds. If
#[#set math.equation(numbering: n => "(6.19)")
 $ parallel f_epsilon.alt - f parallel_(L^oo \( K_0 \)) lt.eq eta h \/ 4 \, $ <eq:trace-finite-tolerance>]

 then, simultaneously for every $q in G$ and every $xi in cal(K) ∩ B_R$,
#[#set math.equation(numbering: n => "(6.20)")
 $ \| f_epsilon.alt \( Pi \( q \) + h xi \) - f_epsilon.alt \( Pi \( q \) \) - h A \( q \) dot.op xi \| lt.eq
   eta h . $ <eq:trace-finite-affine>]

 In particular, for every finite family of such displacements,
   every information increment between two of them differs from its affine value by at most $2 eta h$.
   An alternating sum of $r$ profile values whose affine contributions cancel has absolute value at most $r eta h$.]
  #emph[All dependencies have the order
$ f \, med Q \, R \, eta \, tau \, h_(*) quad arrow.r quad h \, G \, K_0 quad arrow.r quad epsilon.alt_0 . $

 For every member of the converging finite sequence with $epsilon.alt < epsilon.alt_0$, (6.19) holds.
   If finitely many entropy identities also incur a total normalized ambiguity error at most $B \/
   log \( 1 \/ epsilon.alt \)$, one may, after choosing $h$, require in addition
$ log \( 1 \/ epsilon.alt \) gt.eq B \/ \( eta h \) . $

 Each such combined identity then has at most one additional $eta h$ of error.
   More generally one may prescribe any sequences $eta_ell \,
   tau_ell arrow.b 0$ and $h_(* \, ell) arrow.b 0$ and select successively $h_ell < h_(* \, ell)$,
   then the inner approximation thresholds. If $sum_ell tau_ell < oo$,
   almost every point of $Q$ belongs to all but finitely many of the resulting $G_ell$.]
] <cor:finite-characteristic-trace>

#proof[
  On $Q$, the supremum error in (6.14) tends to zero almost everywhere along the chosen sequence and is uniformly
    bounded by the Lipschitz bounds times $R$. Choose a term $h <
    h_(*)$ small enough that the subset on which this error exceeds $eta \/ 2$ has measure at most $tau \| Q \|$,
    and that all shifted label times stay inside $I$. Its complement is $G$.
    A compact neighborhood $K_0$ exists because $Q$ and the displacement set are bounded.
    The two profile approximation errors in the difference in (6.20) total at most $eta h \/ 2$,
    proving that inequality. Subtracting increments, or summing the individual errors,
    gives the finite-family assertions. Uniform convergence supplies $epsilon.alt_0$ after $h$ has been fixed.
    The ambiguity condition and the last exceptional-set assertion follow respectively by addition of errors and
    summability of the measures of $Q \\ G_ell$. ◻
]

There is no uniform choice of $h$ for all Lipschitz profiles in this corollary.
  The translation moduli in (6.9), and hence the block scale, depend on the limiting profile.
  At a fixed nonexceptional plane point one may equivalently use its sequence in (6.14),
  choose a block from that sequence, and then make the finite-system errors small compared with that block.

For the profile (6.2), the clocks are $c_X = 0 \, c_Y = 1 \, c_W = m \, c_Z = 1 + m$,
  ordered increasingly when applying the theorem. Write the trace fields as $x \, y \, w \, z \, D$.
  At $m = 1$ the clocks are $0 \, 1 \, 2$, the fields are $x \, q \, z \, D$, and $q = a_U$; notation such as $y +
  w$ means $q$ and asserts no separate traces for $Y \, W$. Thus (6.12) reads

#[#set math.equation(numbering: n => "(6.21)")
 $ \( partial_u - \( 1 + m \) partial_i \) z gt.eq partial_i D . $ <eq:trace-z-D>]

The distinction between grouped and separate depths is necessary:
  $f \( L_Y \, L_W \) = max \( L_Y \, L_W \)$ has nonpositive mixed derivatives,
  but its separate first derivatives have different traces from the two sides of $L_Y = L_W$.
  On the grouped domain it is simply $f \( L_U \) = L_U$.

=== 6.4 Traces on a contact curve <traces-on-a-contact-curve>

We need a second trace statement within the plane. It uses bounded variation in one direction at a time;
  it does not require the entire gradient of each rate field to be a measure.

#thm([Lemma 6.3.])[
  (Transverse traces on a Lipschitz curve).  #emph[Let $b$ be Lipschitz on an interval $J$, and let $Gamma =
    { \( b \( u \) \, u \) : u in J }$ lie in an open plane region.
    Suppose bounded fields $a_j \, D$ in this region satisfy $V_j a_j in cal(M)_(upright("loc"))$ and $partial_i D
    in cal(M)_(upright("loc"))$, where $cal(M)_(upright("loc"))$ denotes locally finite signed measures.
    Put $p \( u \) = - b' \( u \)$ at points where this derivative exists.
    For almost every $u in J$ the field $D$ has two strong traces $D^(-) \,
    D^(+)$ and every $a_j$ with $c_j eq.not p \( u \)$ has two strong traces $a_j^(-) \, a_j^(+)$.
    Specifically, at $q_0 = \( b \( u_0 \) \, u_0 \)$ the mean of $\| a_j -
    a_j^plus.minus \( u_0 \) \|$ tends to zero on the corresponding tangent half-ball
$ B_rho \( q_0 \) ∩ { med plus.minus \( i - b \( u_0 \) + p \( u_0 \) \( u - u_0 \) \) > 0 med } \, wide
  rho arrow.b 0 \, $

 and likewise for $D$. The same assertion holds with the actual sides $plus.minus \( i - b \( u \) \) > 0$.
   No assertion is made about the field whose speed equals $p \( u_0 \)$.]
  #emph[If, in addition, $V_n a_n gt.eq partial_i D$, then at almost every transverse point $p eq.not c_n$,
#[#set math.equation(numbering: n => "(6.22)")
 $ D^(-) - D^(+) gt.eq \( c_n - p \) \( a_n^(+) - a_n^(-) \) . $ <eq:trace-curve-jump>]

 These conclusions apply to curves on the boundary of an aperture region whenever the fields are defined in an
   ambient neighborhood; one then retains only the side lying in that region.]
] <lem:curve-traces>

#proof[
  We first justify the one-direction slicing fact being used.
    If $g in L^oo$ on a rectangle with coordinates $\( s \, r \)$ and $partial_s g$ is a finite measure,
    then for almost every $r$ the one-dimensional function $g_r \( s \) = g \( s \, r \)$ has bounded variation,
    and its derivative measures satisfy, on smaller rectangles,
  #[#set math.equation(numbering: n => "(6.23)")
   $ partial_s g = integral D g_r thin d r \, wide \| partial_s g \| =
     integral \| D g_r \| thin d r . $ <eq:trace-slicing>]
  Here integration of measures means integration of their values against compactly supported continuous test
    functions. To verify this, convolve $g$ in the rectangle.
    The integrals of $\| partial_s g_𝜚 \|$ on a smaller rectangle are bounded by the variation of $partial_s
    g$ on a slightly larger one. Choose a subsequence with $g_𝜚 \( dot.op \, r \) arrow.r
    g \( dot.op \, r \)$ in $L^1 \( d s \)$ for almost every $r$.
    The definition of one-dimensional variation as the supremum over finite partitions,
    or over test functions bounded by one, and Fatou’s lemma give integrable variations of the slices.
    Fubini and one-dimensional integration by parts then identify $partial_s g$ with $integral D g_r thin d r$.
    The variation equality follows by taking the supremum over a countable dense family of scalar test functions
    on rational subintervals, selecting these tests measurably in $r$,
    and approximating the resulting bounded tests by continuous ones. Exhaustion gives (6.23) locally.
  Suppose first the curve is a Lipschitz graph $s = h \( r \)$ in these coordinates.
    The one-dimensional representatives have limits $T^plus.minus \( r \) =
    g_r \( h \( r \) plus.minus \)$ for almost every $r$. Fix a compact graph patch and define
  $ q_𝜚 \( r \) = \| D g_r \| #scale(x: 120%, y: 120%)[\(] \( h \( r \) - 𝜚 \, h \( r \) + 𝜚 \) \\ { h \( r \) }
    #scale(x: 120%, y: 120%)[\)] . $
  For small fixed $𝜚$, these functions are integrable by (6.23),
    and they decrease to zero almost everywhere as $𝜚 arrow.b 0$.
    Outside one null set we may assume that $r_0$ is a Lebesgue point of $T^(+) \,
    T^(-)$ and of every $q_(1 \/ k)$ for which the graph patch permits that collar.
    If $\| r - r_0 \| < C rho$ and $0 < plus.minus \( s - h \( r \) \) < C rho$, then
  $ \| g \( s \, r \) - T^plus.minus \( r_0 \) \| lt.eq q_(C rho) \( r \) + \| T^plus.minus \( r \) -
    T^plus.minus \( r_0 \) \| $
  for almost every $\( s \, r \)$. Integrating in such a graph-side cylinder and dividing by $rho^2$ bounds the
    result by
  $ C / rho integral_(\| r - r_0 \| < C rho) #scale(x: 120%, y: 120%)[\(] q_(C rho) \( r \) + \|
    T^plus.minus \( r \) - T^plus.minus \( r_0 \) \| #scale(x: 120%, y: 120%)[\)] thin d r . $
  For each fixed $k$, eventually $q_(C rho) lt.eq q_(1 \/ k)$.
    Lebesgue differentiation first, then $k arrow.r oo$, shows that this bound tends to zero.
    At a point where $h$ is differentiable, the area between its graph and its tangent in a radius-$rho$ disk is
    $o \( rho^2 \)$. Boundedness of $g$ therefore gives the same strong mean traces on tangent half-disks.
    Invertible linear changes of coordinates preserve this conclusion for half-balls,
    because the corresponding ellipses contain and are contained in comparable balls.
  For $a_j$ use the coordinates
  $ s = u \, wide r = i + c_j u \, $
  so that $V_j = partial_s$ and the curve has projection $r = g_j \( u \) = b \( u \) + c_j u$.
    On the set where $g'_j = c_j - p eq.not 0$ this projection can be covered, apart from a null set,
    by countably many sets on each of which it is bi-Lipschitz. Here is a direct reason.
    At a differentiability point with $g'_j eq.not 0$, choose integers $k \, N$ so that $\| g'_j \| > 2 \/ k$ and
  $ \| g_j \( v \) - g_j \( u \) - g'_j \( u \) \( v - u \) \| lt.eq \| v - u \| \/ k quad upright("if ") \| v -
    u \| < 1 \/ N . $
  Partition these points according to $k \, N$, the sign of the derivative,
    and intervals of length less than $1 \/ N$. Any two points of one piece then have image distance at least $\|
    v - u \| \/ k$; the upper Lipschitz bound is inherited from $g_j$.
    On each image piece the inverse extends to a Lipschitz function $h \( r \)$ on an interval.
    The graph argument above applies to this extension. At almost every density point of the original piece its
    tangent is the original tangent. The bi-Lipschitz parameter change takes exceptional null sets back to null
    sets. This proves the traces for $a_j$ on its transverse set.
    For $D$, simply take $s = i \, r = u$, so the curve is already the graph $s =
    b \( r \)$ and is everywhere transverse. Taking the union of the finitely many exceptional sets proves the
    simultaneous assertion. The area comparison also replaces tangent sides by actual sides.
  Finally, (6.23) identifies the part of the derivative measure on $s =
    h \( r \)$ as $\( T^(+) \( r \) - T^(-) \( r \) \) thin d r$,
    since a one-dimensional BV derivative has an atom equal to its jump.
    On each transverse inverse patch, substitute $d r = \| c_j - p \( u \) \| thin d u$.
    The positive $s$ side is the positive $i - b \( u \)$ side precisely when $p - c_j > 0$,
    so reversing the sides when necessary gives the signed factor $p - c_j$.
    Partition the countable patches into disjoint measurable pieces before summing.
    There is no omitted measure on a parameter-null subset of the curve:
    its projection under the Lipschitz map $g_j$ is null, and (6.23) gives zero variation over such a projection.
    In the original $\( i \, u \)$ coordinates we have therefore proved
  #[#set math.equation(numbering: n => "(6.24)")
   $ \( V_j a_j \) \|_Gamma = \( p - c_j \) \( a_j^(+) - a_j^(-) \) thin d u \,
     wide \( partial_i D \) \|_Gamma = \( D^(+) - D^(-) \) thin d u $ <eq:trace-graph-measures>]
  on the transverse part of the parameter set. To check the first sign and factor directly,
    set $phi \( i \, u \) = i - b \( u \)$. Then $V_j phi = p - c_j$,
    and differentiating a function with jump $a_j^(+) - a_j^(-)$ across $phi =
    0$ gives exactly that factor times $delta \( phi \) thin d i thin d u = \( d u \) \|_Gamma$.
    This agrees with the change of variable in the sliced jump measures,
    so it applies to the bounded fields just considered. Restrict the nonnegative measure $V_n a_n -
    partial_i D$ to the transverse part of $Gamma$ and use (6.24); its nonnegative density is
  $ \( p - c_n \) \( a_n^(+) - a_n^(-) \) - \( D^(+) - D^(-) \) . $
  This is precisely (6.22). An aperture boundary requires no further trace argument:
    all statements were proved in the ambient plane neighborhood before a side is selected. ◻
]

== 7 Rate transfer at matched clocks <sec:rate-transfer>

We keep the saturated homogeneous component $p_epsilon.alt$ selected in Section 6, with least aspect $m > 0$.
  Its information and time profiles are $f \, S$, and its matched-plane potential is $Phi = f compose
  Pi_m$ from (6.5). The row data and their admissible depths are those of (6.1) and (6.2).
  Write $x \, y \, w \, z$ for their plane trace rates and $D$ for the label rate.
  When $m = 1$, the middle datum is $U = \( Y \, W \)$ and its single rate is $q = a_U$.
  The matched component defining $f \, S \, Phi$ is fixed before their trace points.
  Later homogeneous selections concern the derived block laws and do not redefine these profiles.

#thm([Proposition 7.1.])[
  (Matched-clock rate transfer).  #emph[For almost every point $\( i \, u \)$ of the characteristic plane with
    $i > 0$ and $0 < u < 1$, put $s = S' \( u \)$. There is a constant $sigma > 0$,
    depending only on the matched process and $m$, for which $0 < s lt.eq 1$ and the following assertions hold.]
  + #emph[If $m eq.not 1$, each of the chains $x arrow.r y$ and $w arrow.r z$ has the rule
$ d > 0 quad arrow.r.double quad e gt.eq min \( 1 \, d + s \) \, $

 where $d \, e$ are its source and target rates. Each of $x arrow.r w$ and $y arrow.r
   z$ has the same rule with $sigma$ in place of $s$.]
  + #emph[If $m = 1$, then
$ x > 0 arrow.r.double q gt.eq s \, wide x > 0 \, med z < 1 arrow.r.double z gt.eq x + s \, wide
  z < 1 arrow.r.double q lt.eq 2 - s . $

]
  #emph[The bounds include $0 lt.eq x \, y \, w \, z lt.eq 1$, or $0 lt.eq q lt.eq 2$ in the tied case,
    supplied by the coordinate capacities.]
] <prop:rate-transfer>

The proof first extracts a finite point–parameter law from an affine entropy block.
  That law will carry the parameter nonconcentration, coordinate support counts,
  and product comparisons used by the projection tests. Distinct clocks give the four rate transfers directly.
  At tied clocks, the joint rate $q$ is supplemented by directions between parameter samples and two conditional
  projection tests.

=== 7.1 The selected profiles and the parameter children <the-selected-profiles-and-the-parameter-children>

We first verify what the already selected sequence $p_epsilon.alt$ supplies at the depths needed here.
  Its initial homogeneous list contains all finite tuples from a countable dense family of admissible
  configurations, including the indicated conditional probabilities given $T$.
  For two nearby configurations, give both descriptions the finer label clock.
  The box comparisons in Section 6 give bounded ambiguity for changing the data frame at a fixed admissible
  resolution. A depth change of size $a$ introduces at most $epsilon.alt^(- C a + o \( 1 \))$ possibilities,
  also conditional on $T$, on each fixed compact depth range.
  Applying the conditional-surprise counting bound from Lemma 10 to both descriptions extends the homogeneous
  exponents from the dense family to every fixed admissible configuration.
  The same argument applies to finite tuples. It does not require independent data refinements to remain
  admissible at the coarse label clock.

Write $frak(h) \( A \)$ for the limiting normalized entropy of a listed observation.
  For a finite pair $A \, B$, the selected homogeneous probabilities give, in probability,

#[#set math.equation(numbering: n => "(7.1)")
 $ - log_(1 \/ epsilon.alt) #h(-0.16667em) (p_epsilon.alt \( B divides A \)) = frak(h) \( A \, B \) -
   frak(h) \( A \) + o \( 1 \) . $ <eq:rate-ratio>]

The same statement holds for listed probabilities conditional on $T$;
  the probability of $T$ itself is never binned. After a trace point, a positive block length $h$,
  and a finite list of real configurations have been chosen,
  take one event $cal(E)_epsilon.alt$ on which all their original conditional surprises differ from their limiting
  exponents by at most $omega_epsilon.alt = o \( h \)$. Its probability tends to one.
  On this event, ratios of the joint and parent masses give uniform upper conditional masses and upper retained
  support counts. The support count follows by dividing the upper mass of a parent by the lower mass of each
  retained joint value.

This finite real-depth event is imposed before any restriction which uses its bounds.
  If a later law satisfies $sans(Q) lt.eq K p_epsilon.alt \( thin dot.op divides cal(E)_epsilon.alt \)$,
  with $log K = o \( h ell \)$ and $ell = log \( 1 \/ epsilon.alt \)$,
  its conditional entropy of each listed child given its listed parent differs from the listed exponent by at most
  $omega_epsilon.alt + log \( K \/ p_epsilon.alt \( cal(E)_epsilon.alt \) \) \/ ell$,
  by conditional relative entropy and the support count. The parent likelihood and child-support thresholds in the
  proof of Lemma 5 give the same absolute error bound for realized surprise,
  with $log \( 1 \/ eta \) \/ ell$ added, outside $sans(Q)$-mass at most $2 eta$;
  choose $eta arrow.b 0$ with $log \( 1 \/ eta \) = o \( h ell \)$.
  The dense-list profiles remain the same under this high-probability restriction by Lemma 10.
  This verifies the finite inheritance for the component selected in Section 6;
  it does not select a new $f$ or assert uniform bins at all real depths.

For this component the prediction identities and the positive constant obtained from its least-aspect argument are

#[#set math.equation(numbering: n => "(7.2)")
 $ sans(H) \( R_(m v) divides T \, C_v \) = 0 \, wide sans(H) \( R_(m \( v + a \)) divides T \, C_v \) gt.eq
   kappa a quad \( 0 < v < v + a < 1 \) . $ <eq:rate-prediction>]

These are limiting normalized statements for this same $p_epsilon.alt$.

Fix a regular plane point $\( i \, u \)$ and a trace block length $h > 0$.
  Write $E$ for the coarse observation at $Pi_m \( i \, u \)$ and put $rho = epsilon.alt^h$.
  Given the coarse label, $E$ is a function of $\( T \, C_u \, R_(m u) \)$ up to bounded grid choices,
  which we record when needed. Choose $K > max \( 1 \, 1 \/ m \)$, fixed throughout this construction,
  and define the normalized parameter increments

$ c = epsilon.alt^(- u) \( C_(u + K h) - C_u \) \, wide r = -
  epsilon.alt^(- m u) \( R_(m \( u + K h \)) - R_(m u) \) . $

The full finite label $theta$ records the advanced label and the bounded choices just mentioned.
  Before all tests, fix one half-open dyadic tree on a fixed bounded box containing the normalized pair
  $\( c \, r \)$. For every real $0 lt.eq d lt.eq 1$, let $Theta_d$ be its atom at level

$ n_rho \( d \) = ⌈d log_2 \( 1 \/ rho \)⌉ . $

These atoms are exactly nested for all real depths: $Theta_a$ is determined by $Theta_b$ when $a lt.eq b$,
  and each $Theta_a$ atom has at most

$ 4^(n_rho \( b \) - n_rho \( a \)) lt.eq 4 rho^(- 2 \( b - a \)) $

$Theta_b$ children. The time prefix records $C_(u + d h)$ and the normal prefix records $R_(m u + d h)$ up to
  bounded ambiguity over $E$. For other finite observations whose nesting holds only up to bounded choices,
  we append the parent to the child when needed. Here $h$ and the finite prefix list are fixed before $epsilon.alt
  arrow.r 0$.

The chain rule gives

#[#set math.equation(numbering: n => "(7.3)")
 $ sans(H) \( C_(u + d h) divides E \) & gt.eq sans(H) \( C_(u + d h) divides T \, E \)\
 & gt.eq S \( u + d h \) - S \( u \) - sans(H) \( R_(m u) divides T \, C_u \) - o \( 1 \) \,\
sans(H) \( R_(m u + d h) divides E \) & gt.eq sans(H) \( R_(m u + d h) divides T \, C_u \, R_(m u) \) - o \( 1 \)\
 & gt.eq \( kappa \/ m \) d h - o \( 1 \) . $ <eq:rate-time-child>]

For the first inequality, the data in $E$ are determined by the particle and coarse labels,
  and adjoining $R_(m u)$ costs at most its conditional entropy.
  The second uses (7.2) at time increment $d h \/ m$. Prediction also gives

$ kappa a lt.eq sans(H) \( R_(m \( u + a \)) divides T \, C_u \) lt.eq S \( u + a \) - S \( u \) + o \( 1 \) . $

Consequently $s = S' \( u \) gt.eq kappa > 0$ at the regular points used below.
  Fix any $0 < sigma < min \( 1 \, kappa \/ m \)$.

At tied clocks there is also a bound between any two tested parameter prefixes.
  If $m = 1$ and $0 lt.eq a < b lt.eq 1$, then conditional on $E$ the symbol $Theta_a$ is equivalent to
  $\( C_(u + a h) \, R_(u + a h) \)$ up to the recorded bounded choices. Therefore

#[#set math.equation(numbering: n => "(7.4)")
 $ sans(H) \( Theta_b divides E \, Theta_a \) & gt.eq sans(H) \( C_(u + b h) divides T \, E \, Theta_a \)\
 & gt.eq S \( u + b h \) - S \( u + a h \) - sans(H) \( R_(u + a h) divides T \, C_(u + a h) \) - o \( 1 \)\
 & = S \( u + b h \) - S \( u + a h \) - o \( 1 \) . $ <eq:rate-joint-child-entropy>]

After $T \, C_(u + a h)$ have been given, the extra conditioning in $E \,
  Theta_a$ is a function of $R_(u + a h)$ and the bounded choices.
  This is the stated entropy cost and does not use an entropy bound for $T$.

The homogeneous joint symbols $\( E \, Theta_a \)$ and $\( E \, Theta_b \)$ turn this last entropy inequality into
  a bound on their probability ratio. On the common real-depth event,

#[#set math.equation(numbering: n => "(7.5)")
 $ p_epsilon.alt \( Theta_b divides E \, Theta_a \) lt.eq
   epsilon.alt^(S \( u + b h \) - S \( u + a h \) - o \( 1 \)) quad \( m = 1 \) $ <eq:rate-joint-child-mass>]

at every retained child. The time and normal inequalities give the corresponding marginal prefix bounds by the
  same ratio calculation. Lemma 3, with the coarse observation as $C$ and each listed parent containing $C$,
  selects base cells of adequate relative retention without an inverse original cell mass.
  We will keep the event as an unnormalized allowed set inside the chosen base cell until both product comparisons
  have been imposed.

=== 7.2 One finite affine-block law <one-finite-affine-block-law>

Center the common pre-label data in the boxes of $E$, dilate them to bounded coordinates,
  and round the resulting point $P$ at precision $rho$. For a full label with normalized increment $\( c \, r \)$
  define its canonical post-coordinate symbols by applying the shear to this same rounded point and then taking
  the indicated grid bins:

#[#set math.equation(numbering: n => "(7.6)")
 $ X_theta = X \, wide Y_theta = Y + c X \, wide W_theta = W + r X \, wide Z_theta = Z + c W + r Y +
   c r X . $ <eq:rate-shear>]

The same origin is transformed at every label, so the shears compose by adding $\( c \, r \)$ and the map from
  frame $0$ to frame $1$ uses $theta_1 - theta_0$. Applying the shear before or after rounding changes each real
  output by $O \( rho \)$. The canonical bins and the physically recorded bins consequently determine one another
  with bounded conditional ambiguity. We use the canonical symbols in the finite law below:
  each is a genuine function of $\( P \, theta \)$. Their prefixes and joint numerator and denominator symbols are
  included in the finite uniformization list. Bounded ambiguity transfers the entropy identities to these symbols;
  their own uniform probability bins, rather than a pointwise assertion from that ambiguity alone,
  will supply the retained mass bounds.

Let $cal(I) = { X \, Y \, W \, Z }$ when $m eq.not 1$, and $cal(I) = { X \, U \, Z }$ when $m = 1$,
  with $U = \( Y \, W \)$. Write $Q_(j \, theta)$ for the canonical coordinate in group $j in cal(I)$,
  and $\( Q_(j \, theta) \)_d$ for its prefix at precision $rho^d$.
  Put $\( a_X \, a_Y \, a_W \, a_Z \) = \( x \, y \, w \, z \)$ in the distinct-clock case and
  $\( a_X \, a_U \, a_Z \) = \( x \, q \, z \)$ in the tied case.
  Choose the fixed $K$ large enough that raising any individual data depth by at most $h$ is admissible after the
  label advances by $K h$. For any fixed finite list of $t_j in \[ 0 \, 1 \]$, the affine trace gives

#[#set math.equation(numbering: n => "(7.7)")
 $ sans(H) #scale(x: 120%, y: 120%)[\(] \( \( Q_(j \, theta) \)_(t_j) \)_(j in cal(I)) divides E \,
   theta #scale(x: 120%, y: 120%)[\)] = h sum_(j in cal(I)) a_j t_j + o \( h \) . $ <eq:rate-post-affine>]

Indeed, at the advanced label the unrefined pre- and post-data determine one another to bounded ambiguity by
  (6.2). The difference between the information with the selected refinements and this common base information is
  their conditional entropy, because the particle and label determine the refinement.
  The affine trace gives the displayed increment, and the canonical rounding costs only bounded ambiguity.

Raising all data depths by $h$ is also admissible at the original label and is preserved under the
  label-conditioned shear. The same calculation gives

#[#set math.equation(numbering: n => "(7.8)")
 $ sans(H) \( P divides E \) = h sum_j a_j + o \( h \) \, wide sans(H) \( P divides E \, theta \) = h sum_j a_j +
   o \( h \) \, wide sans(I) \( P \; theta divides E \) = o \( h \) . $ <eq:rate-pre-independence>]

In particular, the conditional coordinate multiinformation obtained by subtracting the joint entropy in (7.7) from
  the sum of its single-coordinate entropies is $o \( h \)$.
  Both information quantities are nonnegative averages over the base observation $E$.

We now form one sequence of finite blocks. This order is needed because the trace error divided by a fixed $h$
  need not vanish as only $epsilon.alt$ tends to zero. Choose $h_n arrow.b
  0$ on the trace subsequence for this fixed profile and plane point,
  so that its affine error divided by $h_n$ tends to zero uniformly on the bounded cone of displacements just
  used. Differentiability of $S$ gives the analogous convergence for its time increments.
  At stage $n$, include the first $n$ tuples from a countable list of rational block prefixes,
  their canonical joint numerator and denominator symbols, and the finitely many information differences above.
  These are real original depths fixed by the already chosen $h_n$.

Choose $epsilon.alt_n$ within the converging sequence $p_epsilon.alt$ so that all finite probability, prediction,
  information, and box-ambiguity errors are at most $eta_n h_n$, where $eta_n arrow.b 0$,
  and $h_n log \( 1 \/ epsilon.alt_n \) gt.eq n$. Put

$ rho_n = epsilon.alt_n^(h_n) \, wide L_n = log \( 1 \/ rho_n \) . $

For this extraction, let $cal(H)_n$ contain only the tested prefix conditions whose truth, after $E$ is fixed,
  is determined by the canonical pair $\( P \, theta \)$: the parameter prefixes and canonical coordinate
  numerator and denominator symbols. The earlier bins conditional on $T$ need not be pair-measurable.
  They are used to justify the entropy estimates, but are not included in $cal(H)_n$.
  The two nonnegative information quantities and the failure probability of the common prefix event can be
  selected simultaneously on the base cells by Markov’s inequality.
  Choose deterministic $d_n \, zeta_n \, omega_n arrow.b 0$ so that, on every selected base cell,
  the two natural-log quantities are at most $d_n L_n$, the prefix event fails with probability at most $zeta_n$,
  and its normalized surprise errors are at most $omega_n$ in block units.
  The finite lists and thresholds are chosen before the precision;
  increasing them slowly gives these common envelopes. Select one such cell $E =
  e_n$ and let $p_n^0$ be the original conditional law of the canonical pair $\( P \, theta \)$ on that cell,
  before normalizing the prefix event $cal(H)_n$. Thus $p_n^0 \( cal(H)_n \) gt.eq 1 - zeta_n$.
  The cell may have small original mass: the selected bounds are bounds for its conditional law and contain no
  inverse mass of $E = e_n$.

For clarity, the two comparisons to be imposed on this law have different spaces and factors. Put

$ mu_n^0 = \( p_n^0 \)_P \, wide lambda_n^0 = \( p_n^0 \)_theta \, wide
  xi_(j \, n)^(0 \, theta) = \( p_n^0 \)_(Q_(j \, theta) divides theta) . $

The first comparison is with $mu_n^0 \( P \) lambda_n^0 \( theta \)$. The second is with

$ lambda_n^0 \( theta \) product_(j in cal(I)) xi_(j \, n)^(0 \, theta) \( Q_(j \, theta) \) \; $

it uses the coordinate factors conditional on that label.
  The divergences from these two probability laws are respectively the pair information and the averaged
  conditional coordinate multiinformation, each bounded by $d_n L_n$.
  We do not assume a uniform multiinformation estimate on individual labels.

#thm([Lemma 7.2.])[
  (A finite core for a point–parameter law and its coordinates).  #emph[Fix an integer $k gt.eq 1$.
    Let $p^0$ be a probability law on a finite pair space $cal(P) times Theta$.
    Write $mu^0 = p_P^0$ and $lambda^0 = p_theta^0$. Let $Q_j = Q_j \( P \, theta \)$, $1 lt.eq j lt.eq k$,
    be finite coordinate observations, and put $xi_j^theta = p_(Q_j divides theta)^0$ on positive label fibers,
    choosing an arbitrary probability law on a zero-mass label fiber. Define the two nonnegative natural-log quantities
$ D_(upright("pair")) & = "KL" \( p_(P \, theta)^0 bar.v.double mu^0 ⊗ lambda^0 \) \,\
D_(upright("coord")) & =
  "KL"
  (p_(theta \, Q_1 \, dots.h \, Q_k)^0 mid(bar.v.double) lambda^0 \( theta \) product_(j = 1)^k xi_j^theta \( Q_j \))\
 & = sum_(j = 1)^k sans(H)_(upright("nat"))^(p^0) \( Q_j divides theta \) -
   sans(H)_(upright("nat"))^(p^0) \( Q_1 \, dots.h \, Q_k divides theta \) . $

 The second quantity is averaged over the labels; no individual label is assumed to have small conditional
   multiinformation.]
  #emph[Let $cal(F)$ be a finite list of observations on the pair space which contains $P$, $theta$,
    and every $\( theta \, Q_j \)$. It may also contain any finite list of prefix and joint observations.
    Write $N = \| cal(F) \|$, counting occurrences rather than values.
    Let $cal(H)$ be an event of $p^0$-mass at least $1 - zeta$, where $zeta gt.eq 0$. For $v > 0$, choose
$ 0 < underline(M) lt.eq 1 - zeta - frac(D_(upright("pair")) + D_(upright("coord")) + 2 \/ e, v) \, wide delta =
  frac(underline(M), 2 N) . $

 Then there is a restriction $r lt.eq bold(1)_(cal(H)) p^0$, of mass $M gt.eq underline(M) \/ 2$, such that,
   for every listed observation $F$ and every value with $r_F \( f \) > 0$,
#[#set math.equation(numbering: n => "(7.9)")
 $ delta p_F^0 \( f \) lt.eq r_F \( f \) lt.eq p_F^0 \( f \) . $ <eq:block-core-floors>]

 For the normalized law $pi = r \/ M$, write $mu = pi_P$ and $lambda = pi_theta$.
   Its pair law and its coordinate law on every positive label fiber satisfy
#[#set math.equation(numbering: n => "(7.10)")
 $ pi \( P \, theta \) & lt.eq e^v M delta^(- 2) mu \( P \) lambda \( theta \) \,\
pi \( Q_1 \, dots.h \, Q_k divides theta \) & lt.eq e^v delta^(- k) product_(j = 1)^k pi \( Q_j divides theta \) .
  $ <eq:block-core-pair>]

 All factors on the right of these two inequalities are marginals of this same law $pi$.]
  #emph[If $A \, B$ are listed observations and $A$ is determined by $B$, then for every retained child value $b$,
    with parent $a = A \( b \)$,
#[#set math.equation(numbering: n => "(7.11)")
 $ delta p^0 \( B = b divides A = a \) lt.eq pi \( B = b divides A = a \) lt.eq
   delta^(- 1) p^0 \( B = b divides A = a \) . $ <eq:block-core-prefix-ratio>]

 The upper inequality can be summed over any set of child values.
   The lower inequality is asserted only for retained children. In particular, fix $0 < rho < 1$.
   If on $cal(H)$ the original conditional surprises for this pair lie in $\[ d_(-) \, d_(+) \]$ in units $L =
   log \( 1 \/ rho \)$, then every retained parent has at most $rho^(- d_(+))$ retained children,
   and its retained conditional child masses obey
$ delta rho^(d_(+)) lt.eq pi \( B = b divides A = a \) lt.eq delta^(- 1) rho^(d_(-)) . $

 When a parent is nested only up to bounded ambiguity, include it in the child symbol before applying this assertion.]
] <lem:affine-block-core>

#proof[
  Let $Lambda_(upright("pair")) = mu^0 ⊗ lambda^0$ and $Lambda_(upright("coord")) \( theta \, q \) =
    lambda^0 \( theta \) product_j xi_j^theta \( q_j \)$. These are probability laws on their respective
    observation spaces. Use Lemma 6 with cutoff $v$ for both likelihood ratios.
    Pull both allowed sets back to the original $\( P \, theta \)$ space through the corresponding observation
    maps and intersect them with $cal(H)$. The resulting unnormalized subprobability $r^0$ has mass at least
    $underline(M)$, satisfies $r^0 lt.eq p^0$, and obeys
  $ r_(P \, theta)^0 lt.eq e^v mu^0 lambda^0 \, wide r_(theta \, Q_1 \, dots.h \, Q_k)^0 lt.eq
    e^v lambda^0 \( theta \) product_j xi_j^theta \( Q_j \) . $
  The pullback is important: the restrictions for both comparisons act on the same pair incidences,
    including when several points have the same coordinate tuple.
  Starting with $r^0$, repeatedly delete all incidences with $F =
    f$ whenever its current positive marginal is smaller than $delta p_F^0 \( f \)$, for any $F in cal(F)$.
    Each indexed value is deleted at most once. Charging its removed mass to $\( F \, f \)$ bounds the total loss
    by $delta sum_(F in cal(F)) sum_f p_F^0 \( f \) = N delta$.
    Thus the final subprobability $r$ has mass at least $underline(M) - N delta =
    underline(M) \/ 2$ and satisfies (7.9). Restriction preserves both likelihood upper bounds and $r lt.eq p^0$.
  For the pair product, the floors give $mu^0 lt.eq M mu \/ delta$ and $lambda^0 lt.eq
    M lambda \/ delta$ on the retained values. Substitute them in the first likelihood upper bound and divide by
    $M$ to obtain (7.10). For a surviving label and each coordinate value in its joint support,
  $ xi_j^theta \( Q_j \) lt.eq frac(r_(theta \, Q_j) \( theta \, Q_j \), delta lambda^0 \( theta \)) =
    frac(r_theta \( theta \), delta lambda^0 \( theta \)) pi \( Q_j divides theta \) . $
  Conditioning the second likelihood upper bound on this label gives
  $ pi \( Q_1 \, dots.h \, Q_k divides theta \) lt.eq e^v delta^(- k)
    (frac(r_theta \( theta \), lambda^0 \( theta \)))^(k - 1) product_j pi \( Q_j divides theta \) . $
  Since $r lt.eq p^0$, the parent ratio is at most one. This proves (7.10);
    in particular the repeated label in the factors has not been counted as an independent copy.
  Finally, for a retained child,
  $ frac(pi \( B = b divides A = a \), p^0 \( B = b divides A = a \)) =
    frac(r_B \( b \) \/ p_B^0 \( b \), r_A \( a \) \/ p_A^0 \( a \)) . $
  Both ratios on the right lie in $\[ delta \, 1 \]$, proving (7.11).
    Every retained child is attained in $cal(H)$, where its original conditional mass is at least $rho^(d_(+))$
    and at most $rho^(d_(-))$. Summing the lower original masses proves the support count,
    and substitution proves the final bounds. ◻
]

Apply Lemma 30 to $p_n^0$ and $cal(H)_n$. Its list $cal(F)_n$ contains the constant observation, $P$, $theta$,
  every $\( theta \, Q_(j \, theta) \)$ at full block precision,
  and every tested canonical prefix and joint numerator or denominator symbol.
  The parameter children use the fixed dyadic tree; every other child includes its parent when needed,
  so the nested-symbol conclusion applies exactly. Write $N_n = \| cal(F)_n \|$. Set

$ t_n = sqrt(d_n + L_n^(- 1)) \, wide v_n = t_n L_n \, wide M_(* \, n) = 1 - zeta_n - 2 t_n \, wide delta_n =
  frac(M_(* \, n), 2 N_n) . $

For all sufficiently large $n$, $M_(* \, n) > 0$ and

$ frac(D_(upright("pair")) + D_(upright("coord")) + 2 \/ e, v_n) lt.eq 2 t_n . $

The lemma therefore gives a restriction $r_n lt.eq p_n^0$ of mass $M_n gt.eq M_(* \, n) \/ 2$,
  supported on the simultaneous prefix and likelihood trims. Define its normalized pair law and actual marginals

$ pi_n = r_n \/ M_n \, wide mu_n = \( pi_n \)_P \, wide lambda_n = \( pi_n \)_theta \, wide
  xi_(j \, n)^theta = \( pi_n \)_(Q_(j \, theta) divides theta) . $

The deletion proof acts on the common pair space; thus a retained pair is an incidence for the canonical shear,
  and its support can be used when labels are sampled again.

The finite lists can be increased slowly enough that $log N_n = o \( L_n \)$,
  since the precision is chosen after each list. The one deterministic envelope

$ kappa_n = omega_n + t_n + max { 2 \, \| cal(I) \| } frac(log \( 2 N_n \/ M_(* \, n) \), L_n) +
  frac(log \( 2 \/ M_(* \, n) \), L_n) arrow.r 0 $

bounds every normalized loss just obtained. Suppress $n$ and put $K_0 =
  rho^(- kappa_n)$ in the following formulas. The output is the single finite law

#[#set math.equation(numbering: n => "(7.12)")
 $ pi \( P \, theta \) & lt.eq K_0 mu \( P \) lambda \( theta \) \,\
pi #scale(x: 120%, y: 120%)[\(] \( Q_(j \, theta) \)_(j in cal(I)) divides theta #scale(x: 120%, y: 120%)[\)] &
  lt.eq K_0 product_(j in cal(I)) xi_j^theta \( Q_(j \, theta) \) . $ <eq:rate-one-label-product>]

where every factor is an actual marginal of $pi$, and the second bound holds at every retained full label.
  It also holds after pushing any coordinate to a tested prefix.

For every retained value of each tested nested parent and child,
  the ratio between its conditional mass in $pi$ and in $p^0$ lies in $\[ delta_n \, delta_n^(- 1) \]$.
  In particular the parameter and coordinate prefix bounds include

#[#set math.equation(numbering: n => "(7.13)")
 $ lambda \( c_d in I \) & lt.eq rho^(s d - kappa_n) \, & lambda \( r_d in I \) & lt.eq rho^(sigma d - kappa_n) \,\
lambda \( Theta_b divides Theta_a \) & lt.eq rho^(s \( b - a \) - kappa_n) quad \( m = 1 \) \, &
  xi_j^theta \( \( Q_(j \, theta) \)_d = q \) & lt.eq rho^(a_j d - kappa_n) . $ <eq:rate-parameter-bounds>]

Here the bounds refer to the finite tested list; $I$ is an interval bin at the stated depth.
  The first two inequalities are absolute parameter masses;
  the conditional parameter and coordinate inequalities are on retained parent fibers.
  The corresponding original lower masses on $cal(H)_n$ give

#[#set math.equation(numbering: n => "(7.14)")
 $ \# { q : \( Q_(j \, theta) \)_d = q upright(" for some retained neighbor of ") theta } lt.eq
   rho^(- a_j d - omega_n) $ <eq:rate-coordinate-support>]

for every retained full label and tested depth. Analogous counts hold for every listed joint child.
  These support bounds are in place before any label is replicated.
  The upper mass bounds can be summed over intervals or balls;
  a finite mesh of tested prefix depths gives the bounds for intermediate radii with the mesh error.
  The mesh is fixed before its precision is selected.

All later scalar and direction profiles are extracted from this already chosen sequence $pi_n$ at $rho_n arrow.r
  0$. They do not choose new $h_n$. If a later profile selects a real parent depth and a positive derivative
  increment, extend the nested surprises from the rational prefixes and impose a fresh uniform event for that
  finite real list before the restrictions which use it. For each fixed increment,
  errors tending to zero in block units also tend to zero after division by that increment.
  Only then may the increment shrink. This is a subsequence of the existing block sequence,
  not a new trace-scale choice.

An arbitrary later restriction does not automatically preserve products of its new actual marginals.
  If $hat(pi) = w pi \/ m_R$ with $0 lt.eq w lt.eq 1$, then (7.12) bounds its pair and coordinate laws by $K_0 \/
  m_R$ times the old named products. Decomposing the two relative entropies against those products shows

$ sans(I)_(upright("nat"))^(hat(pi)) \( P \; theta \) lt.eq log \( K_0 \/ m_R \) \, wide
  sum_j sans(H)_(upright("nat"))^(hat(pi)) \( Q_j divides theta \) -
  sans(H)_(upright("nat"))^(hat(pi)) \( \( Q_j \)_j divides theta \) lt.eq log \( K_0 \/ m_R \) . $

Thus a subpower restriction retains small information, while its own product bounds are obtained by applying
  Lemma 30 again after the required finite prefix refresh. The old upper prefix masses are first preserved on
  typical parent fibers by Lemma 3; support counts persist by inclusion.
  This is the procedure used when the tied-clock argument later selects a homogeneous $Y$ profile.
  In every later use of this one-label recoring procedure, reset $pi \, mu \,
  lambda$ and $xi_j^theta$ to its new law and actual factors.
  Also renew $K_0$ and one common deterministic finite-test subpower envelope for the products and tested prefix
  losses in the current working units. A fixed positive shortening by a factor $a$ preserves subpower loss,
  since $o \( L \) = o \( a L \)$ when both are expressed in the shortened units.

=== 7.3 Replication and the first projection tests <replication-and-the-first-projection-tests>

For $1 lt.eq k_(upright("rep")) lt.eq 3$, sample labels $theta_0 \, dots.h \,
  theta_(k_(upright("rep")) - 1)$ independently given $P$ with the conditional kernel of $pi$. Their exact star law is

$ Pi \( P \, theta_0 \, dots.h \, theta_(k_(upright("rep")) - 1) \) =
  mu \( P \) product_(j = 0)^(k_(upright("rep")) - 1) pi \( theta_j divides P \) . $

Since $pi \( theta divides P \) lt.eq K_0 lambda \( theta \)$, it satisfies

#[#set math.equation(numbering: n => "(7.15)")
 $ Pi & lt.eq K_0^(k_(upright("rep"))) mu product_j lambda_j \,\
Pi & lt.eq K_0^(k_(upright("rep")) - 1) pi \( P \, theta_i \) product_(j eq.not i) lambda_j
  quad \( 0 lt.eq i < k_(upright("rep")) \) . $ <eq:rate-star-comparisons>]

where every $lambda_j$ is a copy of $lambda$. These are the named comparison laws used after replication.

Let $R = w Pi \/ m_R$ be a graph restriction chosen before conditioning.
  Fix a set $J$ of full labels and leave $J^c$ free. The conditioning calculation in Theorem 8, applied to (7.15),
  has two consequences on typical fixed-label values. First, for each $i in J$,
  the point law is dominated by a subpower times $pi \( P divides theta_i \)$;
  pushing this comparison through the coordinate map at label $i$ retains its product against the named factors
  $xi_j^(theta_i)$. Second, after the theorem’s point-likelihood trim,
  the joint law of the point and the free labels is compared with its actual conditional point marginal times the
  copies $lambda_j$ for $j in.not J$.

Feed all coordinate products needed at these fixed labels and the point–free-label comparison into one application
  of Lemma 7. Repeated occurrences of a coordinate with different named factors are counted separately:
  for example, $xi_X^(theta_0)$ and $xi_X^(theta_1)$ may differ even though the map $X_theta = X$ is invariant.
  The simultaneous core replaces both by the same current actual point marginal of $X$.
  If $J = { 0 \, 1 }$ in the tied case, the resulting point law $nu$ satisfies

#[#set math.equation(numbering: n => "(7.16)")
 $ nu_(X \, U_0) lt.eq K_1 nu_X nu_(U_0) \, wide nu_(X \, U_1 \, Z_1) lt.eq K_1 nu_X nu_(U_1) nu_(Z_1) \,
   $ <eq:rate-both-coordinate-products>]

and the full coordinate product at either label is available when required.
  Its coordinate marginal prefix bounds retain the rates $x \, q \, z$ with subpower losses.
  If label $2$ is free, the same core gives a point–label-2 comparison with the actual point marginal and a
  retained label comparison whose absolute prefix masses are bounded by a subpower times those of the named
  pre-core label law. Conditional child caps for the new label marginal also require the tested parent floors or
  typical-parent likelihood thresholds; these are imposed for the finite list before those caps are used.

Here and in later uses, the number of replicas is fixed and the finite factor list, graph retention $m_R$,
  likelihood thresholds, and core retention are chosen with common deterministic subpower envelopes.
  The constants in Theorem 8 are fixed products of $K_0$, their inverse retentions and thresholds,
  and the finite factor count. Their normalized logarithms therefore tend to zero together on every retained
  conditional cell. The bound does not depend on the number of possible fixed-label values. For example, if

$ log \( 1 \/ m_R \) \, med log \( 1 \/ eta \) \, med log \( 1 \/ u \) \, med log \( 2 N_(upright("fac")) \) lt.eq
  b_n L_n wide upright("with ") b_n arrow.r 0 $

throughout a chosen conditional array, then its fixed-label comparisons and fixed-size cores have constants at
  most $exp \( C \( kappa_n + b_n \) L_n \)$, with $C$ depending only on the fixed numbers of replicas and
  factors. This supplies one common subpower envelope for those cells.

A subsequent point observation is fixed only if it is a function of $P$ and the labels already in $J$.
  Because the point factor after the core is actual, Corollary 9 preserves the same pre-slice free-label
  comparison on every positive point slice. Any coordinate product needed within such a slice is separately
  conditioned by Lemma 3, on typical values of the specified coordinate parent.
  An observation involving a free label must instead be included among the fixed labels before this argument,
  or be handled by a different verified comparison.

Suppose first that $m eq.not 1$. Use two replicas and fix a typical label $0$, leaving label $1$ free.
  The fixed-label core just described gives an actual point law for $\( X \, Y_0 \)$ with ball dimension $x + y$:
  its coordinate product and the tested prefix upper masses bound a square of radius $rho^d$ by
  $rho^(\( x + y \) d - o \( 1 \))$. The free comparison is the retained pre-slice label-$1$ law,
  whose time marginal has dimension $s$. The dominated incidence law has graph product mass $rho^(o \( 1 \))$.
  For each full label $1$ the projected coordinate

$ Y_1 = Y_0 + \( c_1 - c_0 \) X $

has at most $rho^(- y - o \( 1 \))$ bins on its retained neighbors by (7.14).
  The other component of the label is kept as a tag. Theorem 12 gives

#[#set math.equation(numbering: n => "(7.17)")
 $ y gt.eq min { 1 \, x + y \, \( x + y + s \) \/ 2 } . $ <eq:rate-first-chain>]

For the chain from $w$ to $z$, fix also the full block symbols $X \, Y_0$.
  The label-$0$ coordinate product, conditioned on typical such values,
  gives the point population $\( W_0 \, Z_0 \)$ dimension $w + z$.
  Corollary 9 keeps the same free label-$1$ comparison. The last coordinate is $Z_0 + \( c_1 - c_0 \)
  W_0$ plus a translation determined by the fixed symbols and the full free label,
  and its original support count is still available. The projection theorem gives $z gt.eq min { 1 \, w +
  z \, \( w + z + s \) \/ 2 }$. Interchanging the two shears gives the chains from $x$ to $w$ and from $y$ to $z$
  with $sigma$ in place of $s$; for the latter the fixed point symbols are $X \, W_0$.
  All slices are finite grid symbols, and the typical-conditioning loss has no factor depending on their alphabet sizes.

For any of these inequalities, if the source $d$ is positive and the target $e$ is below $1$,
  the alternative $e gt.eq d + e$ is impossible. The remaining alternative gives $e gt.eq d + s$ or $e gt.eq d +
  sigma$, as required. This proves the distinct-clock part of Proposition 29.

Now let $m = 1$. Equation (7.6) becomes

#[#set math.equation(numbering: n => "(7.18)")
 $ U_1 = U_0 + \( theta_1 - theta_0 \) X \, wide Z_1 = Z_0 + "flip" \( theta_1 - theta_0 \) dot.op U_0 +
   "prod" \( theta_1 - theta_0 \) X \, $ <eq:rate-tied-shear>]

where $"flip" \( c \, r \) = \( r \, c \)$ and $"prod" \( c \, r \) = c r$.
  The trace controls the joint block $U$, so it supplies no separate affine rates for $Y \, W$.
  Homogenize the conditional $Y$-prefix probabilities on a subpower part of the current one-label law,
  and write $g \( d \)$ for their limiting entropy in block units.
  This is a selection within the already fixed block sequence.
  At each finite stage take the post-split law as the new $p^0$.
  Relative to the old one-label law, select typical values of every tested parent needed for the parameter and $X$
  upper masses. For each tested nested parameter pair $Theta_a \, Theta_b$, also impose the capacity tail

$ p^0 \( Theta_b divides Theta_a \) gt.eq tau C^(- 1) rho^(2 \( b - a \)) . $

Here $C = 4$ is the capacity constant of the fixed parameter tree.
  There are at most $C rho^(- 2 \( b - a \))$ grid children over each parent,
  so the failure of this condition has $p^0$-mass at most $tau$.
  Choose $tau$ with $N_(upright("test")) tau arrow.r 0$ and $log \( 1 \/ tau \) = o \( L \)$,
  where $N_(upright("test"))$ is the number of these tested pairs and $L = log \( 1 \/ rho \)$.
  Intersect all good-parent filters, capacity tails, and fresh $Y$ and coordinate surprise bins to form one
  allowed event $cal(H)$ for $p^0$, and keep $bold(1)_(cal(H))
  p^0$ unnormalized until the repeated application of Lemma 30.
  Its list contains all the tested numerator and denominator observations.
  The old named products give the small information needed for this extraction;
  the simultaneous floors against $p^0$ preserve the inherited upper masses and selected $Y$ exponents on the same
  retained fibers. The new products use the actual marginals of the output,
  and its support is a subset of the original coordinate support.

Relabel this final one-label law as $pi$, with actual point and parameter marginals $mu \, lambda$.
  If $delta$ is the repeated core’s threshold, its simultaneous prefix floors give,
  on every retained tested parameter child,

#[#set math.equation(numbering: n => "(7.19)")
 $ lambda \( Theta_b divides Theta_a \) gt.eq delta tau C^(- 1) rho^(2 \( b - a \)) =
   rho^(2 \( b - a \) + o \( 1 \)) . $ <eq:rate-parameter-capacity-floor>]

This uses only the planar child capacity and supplies a lower mass for the short mesh denominators used below. Put

$ g_(*) = inf_(0 < d lt.eq 1) frac(g \( d \), d) . $

The law $pi$ has the $X$–$U$ product, the $X$ and time upper masses,
  and the homogeneous $Y$ prefix masses and support counts on the same retained incidences.
  Each $\( P \, theta_i \)$ marginal of its exact star is this same law.
  If a later graph restriction is $R = w Pi \/ m_R$, that marginal is bounded by $pi \/ m_R$.
  Typical label likelihood thresholds therefore preserve its named prefix upper bounds,
  and support counts can only decrease. Pushing the $X$–$U$ product through $U mapsto
  Y$ bounds a square of radius $rho^r$ in $\( X \, Y_0 \)$ by $rho^(x r + g \( r \) - o \( 1 \))$ on the retained
  typical labels. Both replicas use the profile of this one law.

At precision $rho^d$, the $\( X \, Y_0 \)$ point population has ball dimension at least $x + g_(*)$,
  whereas its $Y_1$ projection count has exponent $g \( d \) \/ d$.
  Indeed $g \( r \) gt.eq g_(*) r$ at every smaller prefix;
  the requisite ball bounds follow from the homogeneous conditional masses.
  Fix label $0$, leave label $1$ free, and use the same product comparison as for (7.17).
  At each fixed $d > 0$, Theorem 12 gives

$ frac(g \( d \), d) gt.eq min { 1 \, x + g_(*) \, \( x + g_(*) + s \) \/ 2 } . $

Taking the infimum does not assume it is attained: test successively fixed $d$ with $g \( d \) \/
  d$ approaching the infimum, choosing all losses after $d$.
  If $x > 0$, the resulting inequality implies $g_(*) gt.eq min \( 1 \, x + s \) gt.eq s$.
  Since $g \( 1 \) lt.eq q$, we have proved $q gt.eq s$.

=== 7.4 Directions between parameter samples <directions-between-parameter-samples>

The reciprocal use of pinned directions and the local linearization below have close precedents in the
  radial-projection bootstrap of Shmerkin and Wang and the thin-tube bootstrap of Orponen, Shmerkin,
  and Wang #cite(label("ShmerkinWang2025Distance")) #cite(label("OrponenShmerkinWang2024Radial")).
  We prove the version needed here for the retained conditional pair law,
  including its selection order and the resulting improvement of the directional rate.

Throughout this subsection and its applications, set $"dir" \( 0 \) = \( 1 \, 0 \)$ and give this fixed unit
  vector the ordinary nested direction-grid prefixes. Thus the direction and scalar observations are defined on
  the entire finite space, including coincident labels.

We give the needed directional statement with its assumptions in finite probability form.
  A child bound of rate $s$ means the conditional parameter-prefix bound for
  $lambda \( Theta_b divides Theta_a \)$ in (7.13) at every fixed tested pair of depths,
  on uniform trims and typical parent fibers. On each tested good parent,
  it applies to the entire named conditional population, hence to all its positive child values.
  This includes all intermediate radii after using a slowly growing finite mesh.

#thm([Proposition 7.3.])[
  (Directional bootstrap).  #emph[Let $0 < s lt.eq 1$. Let a sequence of pair laws of bounded planar parameters
    $\( A \, B \)$ be dominated, with subpower loss at precision $rho$,
    by the product of two populations having conditional child bounds of rate $s$.
    Assume that for each fixed $t > 0$, both comparison marginals satisfy
#[#set math.equation(numbering: n => "(7.20)")
 $ sup_ell mu { "dist" \( dot.op \, ell \) lt.eq rho^t } lt.eq rho^(kappa_t + o \( 1 \)) quad
   upright("for some ") kappa_t > 0 \, $ <eq:rate-no-strip>]

 and likewise for the other marginal. Suppose the direction-prefix probabilities conditional on either pin are
   homogenized on the same pair law. For each finite test, assume a common event of subpower pair mass on which
   the required original direction bins are uniform and the pair support lies over the simultaneous tested
   good-parent fibers for the child bounds. Then, on uniform trims, the direction of $B -
   A$ conditional on either pin has prefix ball dimension at least $s$.
   The assertion is hereditary under subpower restrictions which retain the stated child bounds and product
   comparisons.]
] <prop:directional-bootstrap>

#proof[
  Let $sans(P)$ be the already homogeneous pair law in the hypothesis, with $sans(P) lt.eq
    K_(upright("pair")) mu_A ⊗ mu_B$. Write $F_B \( d \)$ for its conditional direction entropy given the full pin
    $B$, and similarly $F_A \( d \)$. The nested direction grids make both profiles Lipschitz,
    vanishing at zero and absolutely continuous. For each finite test choose one event $cal(H)$ of mass $m_H =
    sans(P) \( cal(H) \) > 0$ carrying both the original conditional direction bins and the simultaneous
    good-parent filters from the hypothesis. Keep $sans(P) \, cal(H)$ named, and put $sans(R) =
    bold(1)_(cal(H)) sans(P) \/ m_H$. The inverse retention and all later thresholds use the common subpower
    envelope for this test.
  Fix a differentiability point $j in \( 0 \, 1 \)$ of $F_B$ and a much smaller fixed increment $a > 0$.
    For $0 < eta < 1 \/ 2$, apply Lemma 3 with the observation $A_j$,
    both to $sans(R) lt.eq \( K_(upright("pair")) \/ m_H \) mu_A ⊗ mu_B$ and to its retention from $sans(P)$.
    Outside $sans(R)_(A_j)$-mass at most $2 eta$, the conditional law $sans(R)_j =
    sans(R) \( thin dot.op divides A_j \)$ and $r_j = sans(P) \( cal(H) divides A_j \)$ satisfy
  $ sans(R)_j lt.eq K_j mu_A \( thin dot.op divides A_j \) ⊗ mu_B \, wide K_j =
    frac(K_(upright("pair")), m_H eta) \, wide r_j gt.eq m_H eta . $
  There is no inverse original parent mass. Fix such a parent among the tested child-bound fibers supplied by the
    hypothesis, with center $a_0$, and write $A = a_0 + rho^j xi$.
    Its named rescaled child law has ball dimension at least $s$ at precision $rho^a$.
    Restrict to $\| B - a_0 \| gt.eq rho^(o \( 1 \))$ using the displayed product and the positive-dimensional
    ball bounds at each fixed positive depth. If its relative retained mass is $v_j$,
    write $sans(G)_j$ for the normalized restricted graph; then
  $ sans(G)_j lt.eq K_j / v_j mu_A \( thin dot.op divides A_j \) ⊗ mu_B \, $
  with $v_j^(- 1)$ subpower.
  For each pin, the number of retained depth-$\( j + a \)$ direction bins inside a depth-$j$ bin is at most
  #[#set math.equation(numbering: n => "(7.21)")
   $ rho^(- \[ F_B \( j + a \) - F_B \( j \) \] - o \( 1 \)) . $ <eq:rate-direction-count>]
  This follows by dividing the original $sans(P)$ parent and child masses conditional on that pin,
    using their uniform bins on $cal(H)$. Further fixing $A_j$ only removes support.
    Computing the direction from $a_0$ instead of $A$ determines the coarse direction bin to subpower ambiguity.
    Taylor expansion of the direction map shows that, in child units,
    the finer bins give intervals for the scalar projection of $xi$ perpendicular to $B - a_0$, with error
  $ O \( rho^a \) + rho^(j - o \( 1 \)) . $
  Indeed the second derivative of the direction map is $O \( \| B - a_0 \|^(- 2) \)$;
    dividing its $O \( rho^(2 j) \| B - a_0 \|^(- 2) \)$ error by the first-order scale $rho^j \/ \| B -
    a_0 \|$ gives the second term. It is smaller than the working precision when $a lt.double j$.
    All translations and dilations have subpower size.
  Before resampling, apply Lemma 7 to the two named factors of $sans(G)_j$.
    With threshold $1 \/ 4$ it gives a normalized pair $q_j$ of raw mass $M_j gt.eq 1 \/ 2$ satisfying
  $ q_j lt.eq 16 K_j / v_j \( q_j \)_A ⊗ \( q_j \)_B . $
  Its actual child and pin marginals are bounded respectively by $\( K_j \/ \( v_j M_j \) \)
    mu_A \( thin dot.op divides A_j \)$ and $\( K_j \/ \( v_j M_j \) \) mu_B$,
    so their ball and strip bounds persist; its support retains the direction counts.
    Now sample two pins independently over $\( q_j \)_A$ using the kernel of $q_j$.
    Theorem 8 compares the star with the independent product of these actual marginals and with either retained
    pair $q_j$ times the other pin marginal. For any fixed $tau > 0$,
    an absolute sine of the angle at most $rho^(tau a)$ between the two directions puts the second pin in a strip
    through $a_0$ of width $O \( rho^(tau a) \)$. Equation (7.20) makes this event have probability tending to
    zero, even after the indicated product losses. Angles are thus tested modulo $pi$,
    including nearly antiparallel directions. Fix a typical pair with the absolute sine of its angle at least
    $rho^(tau a)$. The child retains its ball bound, and its two projections have counts (7.21).
    Two such projection intervals locate it within a ball of radius $O \( rho^(\( 1 - tau \) a) \)$. Therefore
  $ 2 thin \[ F_B \( j + a \) - F_B \( j \) \] gt.eq s \( 1 - tau \) a - o \( 1 \) . $
  Here $j \, a \, tau$ are fixed before $rho arrow.r 0$. Then let $a arrow.b 0$ and $tau arrow.b 0$.
    We obtain $F'_B \( j \) gt.eq s \/ 2$ almost everywhere. The same proof for the opposite pin uses the
    #emph[same] homogeneous pair law. Integration gives $F_A \( d \) \, F_B \( d \) gt.eq s d \/ 2$.
  Suppose now that both profiles have the lower bound $u d$, where $0 < u lt.eq s$.
    The original conditional bins on $cal(H)$ give the upper bound $rho^(u r - o \( 1 \))$ for each retained
    direction bin of depth $r$ given its pin, at every fixed required prefix.
    For this reciprocal step use $sans(G)_j$ before the auxiliary two-pin core.
    Since $A_j$ is determined by $A$, the conditional law of $B$ given $A$ under
    $sans(P) \( thin dot.op divides A_j \)$ is still that under $sans(P)$.
    At depths $r lt.eq a lt.double j$, the directions about $A$ and $a_0$ differ by less than the tested precision
    on the separation set. Average the original conditional upper bound on $cal(H)$ over $A$ in this parent before
    normalizing either restriction. The actual pin marginal $\( sans(G)_j \)_B$ therefore obeys the direction
    bound $rho^(u r - o \( 1 \))$ with the extra factor $\( r_j v_j \)^(- 1)$, which is subpower.
    Apply Lemma 7 directly to $sans(G)_j$ with its two named factors, again with threshold $1 \/ 4$.
    If this core has raw mass $M gt.eq 1 \/ 2$, its actual pin marginal is at most $M^(- 1) \( sans(G)_j \)_B$,
    while its actual child marginal is at most $\( K_j \/ \( v_j M \) \) mu_A \( thin dot.op divides A_j \)$.
    The former keeps the reciprocal direction bound and the latter the child ball bound;
    the core supplies their actual product comparison. Thus Theorem 12 applies with dimensions $s \,
    u$ and count (7.21). It gives
  $ F'_B \( j \) gt.eq min { 1 \, s \, \( s + u \) \/ 2 } = \( s + u \) \/ 2 \, $
  and the same estimate for $F_A$. Integrate and repeat. Starting at $u = s \/ 2$,
    the finite iterates increase to $s$. For each prescribed error only finitely many repetitions are needed.
    All tested parents, increments, radii, and repetitions are fixed before choosing the small-parameter losses.
    A diagonal over those finite choices gives $F_A \( d \) \, F_B \( d \) gt.eq s d$.
    Apply Lemma 3 separately at each full pin to the common original bin event $cal(H)$.
    On the same normalized law $sans(R) = sans(P) \( thin dot.op divides cal(H) \)$,
    outside pin mass at most $eta$ for each choice of pin, the actual conditional direction caps hold with the
    additional factor $\( m_H eta \)^(- 1)$. This proves the claimed conditional mass bounds without normalizing
    an intersection of the two pin filters. ◻
]

=== 7.5 Three labels and the full-precision slices <three-labels-and-the-full-precision-slices>

Assume first that (7.20) holds for the one-label parameter population.
  Use the globally defined parameter-tree atoms from the one-label construction.
  Their simultaneous bins, parent filters, and prefix floors give the rate-$s$ upper child cap in (7.13) and the
  lower capacity bound (7.19) for the same current $lambda$ on every retained tested child.
  These are the conditional masses of the named one-label population used below.

They cover a later fixed real parent $j$ and increment $a$ by a finite mesh.
  Choose tested depths $j_(-) < j < j_(+) < b_(-) < j + a$ within mesh size $delta_(upright("mesh"))$ of $j$ and
  $j + a$. For the compatible nested prefixes of a retained child,
  use the globally defined tree atoms at all five depths below.
  In particular the denominator uses the already floored $Theta_(j_(+))$ atom,
  unchanged by the choice of the real depth $j$. Thus

$ lambda \( Theta_(j + a) divides Theta_j \) lt.eq
  frac(lambda \( Theta_(b_(-)) divides Theta_(j_(-)) \), lambda \( Theta_(j_(+)) divides Theta_(j_(-)) \)) lt.eq
  rho^(s \( b_(-) - j_(-) \) - 2 \( j_(+) - j_(-) \) - o \( 1 \)) . $

Choose $delta_(upright("mesh")) lt.double a$ after $j \, a$ are fixed, and then the precision.
  This gives the required rate-$s$ child cap with the mesh error and one common envelope,
  within the existing block sequence.

Sample three labels over $P$ using (7.15). At each finite stage apply Lemma 5 to the direction-grid children of
  the first pair conditional on each full pin, and to the scalar-grid children below conditional on the full pair.
  Their child alphabets have size at most a fixed power of $rho^(- 1)$ for each finite list,
  while no bound on the parent alphabets is needed. Choose the lemma’s parent and child thresholds together for
  this finite list, with vanishing total exceptional mass under the common envelope.
  The diagonal in Lemma 10 gives a subpower retained triple law carrying the actual conditional profiles.
  Its first-pair marginal is dominated by a subpower times the unchanged named product $lambda_0 lambda_1$.
  These copies retain the tested child and no-strip bounds just verified,
  and the two direction profiles belong to this same first-pair law. Thus Proposition 31 applies.
  Lift its common pair event to this same point–label law and normalize it as $cal(R)$.
  Its pair marginal is the normalized law in the proposition,
  so the actual conditional direction caps hold on the respective good-pin values.
  Keep this pre-average law for the two projection tests below. Write

$ d = "dir" \( theta_1 - theta_0 \) \, wide zeta_2 = "flip" \( d \) dot.op theta_2 . $

For the scalar test, retain one good label-$0$ set from the proposition, of $cal(R)$-mass at least $1 -
  eta_(upright("pin"))$. The label marginal satisfies $cal(R)_012 lt.eq
  K_(upright("lab")) lambda_0 lambda_1 lambda_2$ with subpower $K_(upright("lab"))$. Also retain the pair values

$ cal(R)_01 \( b \) gt.eq eta_(upright("pair")) \( lambda_0 lambda_1 \) \( b \) . $

Their complement has $cal(R)$-mass at most $eta_(upright("pair"))$ by (2.5).
  Normalize the intersection of these two pair-only filters as $cal(R)^0$.
  Averaging the conditional direction cap over the retained good label-$0$ values gives an absolute rate-$s$ cap
  for $d$ under $\( cal(R)^0 \)_01$, with full-pair tags and only the inverse retained mass loss.
  Since both filters depend on the pair, their normalization gives the exact comparison

$ \( cal(R)^0 \)_012 lt.eq K_(upright("lab")) / eta_(upright("pair")) \( cal(R)^0 \)_01 lambda_2 . $

The third population $lambda_2$ has point dimension at least $s$.
  The thresholds tend to zero with subpower inverses in the common finite-test envelope.

Let $l \( r \)$ be the inherited scalar profile of $zeta_(2 \, r)$ given the full pair under $cal(R)^0$.
  The pair-only filters leave its conditional law on each retained pair unchanged,
  and the earlier common bins give its profile under this subpower restriction.
  For a finite list of $r$, choose one event $cal(H)_(upright("sc"))$ of mass $m_(upright("sc")) =
  cal(R)^0 \( cal(H)_(upright("sc")) \)$ on which

$ lr(|- L^(- 1) log cal(R)^0 \( zeta_(2 \, r) divides b \) - l \( r \)|) lt.eq omega_(upright("sc")) \, wide
  omega_(upright("sc")) arrow.r 0 \, $

and put $cal(R)^(upright("sc")) = cal(R)^0 \( thin dot.op divides cal(H)_(upright("sc")) \)$.
  The inverse mass is subpower.
  This law is dominated by $K_(upright("lab")) \/ \( eta_(upright("pair")) m_(upright("sc")) \)$ times the named
  product $\( cal(R)^0 \)_01 lambda_2$, so the pre-event pair population supplies the direction cap.
  The original lower scalar masses on $cal(H)_(upright("sc"))$ give at most
  $rho^(- l \( r \) - omega_(upright("sc")))$ retained scalar bins per full pair.
  Theorem 12, with full-pair tags and dimensions $s \, s$, therefore gives $l \( r \) gt.eq s r$.

Put $r_b = cal(R)^0 \( cal(H)_(upright("sc")) divides b \)$ and
  $lambda_b^0 = \( cal(R)^(upright("sc")) \)_(theta_2 divides b)$.
  Lemma 3 gives $r_b gt.eq m_(upright("sc")) eta_(upright("sc"))$ outside $\( cal(R)^(upright("sc")) \)_01$-mass
  at most $eta_(upright("sc"))$. For each retained scalar bin on such a pair,

$ lambda_b^0 { zeta_(2 \, r) in I } lt.eq r_b^(- 1) cal(R)^0 \( zeta_(2 \, r) in I divides b \)
  lt.eq \( m_(upright("sc")) eta_(upright("sc")) \)^(- 1) rho^(l \( r \) - omega_(upright("sc"))) lt.eq
  rho^(s r - o \( 1 \)) . $

Choose $eta_(upright("sc"))$ with a subpower inverse and intersect these pairs with the typical fixed-pair values
  from the star comparisons for the graph $cal(R)^(upright("sc"))$.
  Also impose the pair-only filter $\| theta_1 - theta_0 \| gt.eq rho^(theta.alt_n)$,
  with $theta.alt_n arrow.b 0$ chosen slowly for this graph’s envelope.
  Indeed, for each fixed $0 < t lt.eq 1$, its pair domination by a subpower times $lambda_0
  lambda_1$ and the absolute parameter ball cap give

$ \( cal(R)^(upright("sc")) \)_01 { \| theta_1 - theta_0 \| < rho^t } lt.eq rho^(s t - o \( 1 \)) . $

A slow diagonal makes the excluded mass vanish at $t = theta.alt_n$.
  This pair-only filter leaves conditional laws at retained pairs unchanged.
  With $alpha = \| theta_1 - theta_0 \|$, it gives $alpha^(- 1) lt.eq rho^(- theta.alt_n) = rho^(- o \( 1 \))$.
  On each remaining pair $b$, feed the point–third-parameter comparison and the two coordinate products supplied
  by the $i = 0 \, 1$ star comparisons into one simultaneous core.
  Let $M_b$ be the total raw retained mass relative to $cal(R)^(upright("sc")) \( thin dot.op divides b \)$,
  including the point-likelihood trim and all core deletions.
  Then the new third marginal satisfies $lambda_01 lt.eq M_b^(- 1) lambda_b^0$.
  All inverse retentions use the same subpower envelope. Hence

#[#set math.equation(numbering: n => "(7.22)")
 $ lambda_01 { zeta_(2 \, r) in I } lt.eq rho^(s r - o \( 1 \)) . $ <eq:rate-third-slope>]

The two coordinate products now use actual marginals of that same retained point law.
  This establishes their coexistence with the scalar slope bound before any point-coordinate slice.

Fix such a pair, and write $theta_1 - theta_0 = alpha d$, where $alpha^(- 1)$ has subpower size.
  Before the last trim form the real linear coordinates

$ N = d^perp dot.op U_0 = d^perp dot.op U_1 \, wide L = d dot.op U_1 . $

Bin $N \, L$ at precision $rho$. Enlarge the $U_0$ symbol to include the $N$ bin,
  which has boundedly many possibilities given it, and use $\( N \, L \)$ as the $U_1$ symbol.
  Rotated and original square bins determine one another with bounded ambiguity.

Let $tilde(nu)^star.op \( P \, theta_2 \)$ denote the joint law just obtained from the fixed-pair core,
  with actual point marginal $tilde(nu)$. It has

$ tilde(nu)^star.op \( P \, theta_2 \) lt.eq A thin tilde(nu) \( P \) lambda_01 \( theta_2 \) $

with subpower $A$, and its point marginal carries both coordinate products and the $X \, Z_1$ prefix upper masses.
  The bounded new symbols change the coordinate multiinformations by $O \( 1 \)$ in natural-log units.
  Apply Lemma 6 and the simultaneous marginal core to these two coordinate products on the point law $tilde(nu)$
  alone. The likelihood events and all core deletions are functions of the point and the already fixed pair.
  They therefore give a point-only weight $0 lt.eq w \( P \) lt.eq 1$ of subpower retained mass $M =
  bb(E)_(tilde(nu)) w > 0$. Lift that weight to the joint law and put

$ nu^star.op \( P \, theta_2 \) = frac(w \( P \) tilde(nu)^star.op \( P \, theta_2 \), M) \, wide nu \( P \) =
  frac(w \( P \) tilde(nu) \( P \), M) . $

The point–free-label comparison is then exactly

#[#set math.equation(numbering: n => "(7.23)")
 $ nu^star.op \( P \, theta_2 \) lt.eq A thin nu \( P \) lambda_01 \( theta_2 \) . $ <eq:rate-point-only-trim>]

There is no new factor $M^(- 1)$ in this comparison: the same point weight and normalization occur in its actual
  point marginal. The coordinate core gives (7.16) for the new finite symbols on $nu$, and the $X \,
  Z_1$ upper masses lose at most the subpower factor $M^(- 1)$.

The fixed labels are still $J = { 0 \, 1 }$ and label $2$ remains free.
  Both $N$ and $X$ are finite functions of the point and these fixed labels.
  By Corollary 9, every positive $\( N \, X \)$ slice of (7.23) keeps the same pre-slice comparison $lambda_01$
  and the actual sliced point marginal. In particular its scalar slope bound remains available.
  No exact real coordinate is conditioned on.

We prove carefully that the population $\( L \, Z_1 \)$ conditional on $\( N \, X \)$ has ball dimension at least
  $x + z$. If a $U_0$ cell with center $u_0$ is fixed, then $L$ is within $O \( rho \)$ of $d dot.op u_0 +
  alpha X$. The first product in (7.16) and the marginal $X$ bound give, for an interval $I$ of length $r gt.eq
  rho$ (absorbing the constant enlargement),

#[#set math.equation(numbering: n => "(7.24)")
 $ nu \( L in I divides U_0 = u_0 \) lt.eq K_1 C alpha^(- x) r^x \, $ <eq:rate-L-slice>]

where $C$ is subpower. Average this inequality over $u_0$ conditional on $N = n$.
  This proves the same bound for $L divides N = n$.

The second product in (7.16), after rotating $U_1$ to $\( N \, L \)$, gives the exact finite inequality

#[#set math.equation(numbering: n => "(7.25)")
 $ nu \( l \, z divides N = n \, X = t \) lt.eq K_1 frac(nu_X \( t \) nu_N \( n \), nu_(X \, N) \( t \, n \))
   nu \( l divides N = n \) nu_(Z_1) \( z \) . $ <eq:rate-double-slice>]

The $nu$-probability of the values $\( t \, n \)$ where the displayed ratio exceeds $A > 1$ is at most $A^(- 1)$:
  sum $nu_(X \, N) \( t \, n \) < A^(- 1) nu_X \( t \) nu_N \( n \)$ over those values.
  On the remaining slices, (7.24) and the $Z_1$ marginal bound imply

#[#set math.equation(numbering: n => "(7.26)")
 $ nu \( \( L \, Z_1 \) in I times J divides N = n \, X = t \) lt.eq
   K_1^2 A C^2 alpha^(- x) r^(x + z) $ <eq:rate-xz-mass>]

for intervals of length $r$. Take $A arrow.r oo$ with subpower growth.
  Thus there is no loss proportional to the number of full-precision $X$ or $N$ bins.

The free label-$2$ law on these slices uses the same comparison $lambda_01$ from (7.22):
  the point-only identity (7.23) and its $\( N \, X \)$ slicing were verified above.
  Hence the free scalar slope bound is available on these slices.

In (7.18), the change from frame $1$ to frame $2$ is a scalar projection of $\( L \, Z_1 \)$:
  its slope is $"flip" \( d \) dot.op \( theta_2 - theta_1 \)$,
  and the remaining terms are translations determined by $\( N \, X \)$ and the free label.
  The support count of $Z_2$ per label is still at most $rho^(- z - o \( 1 \))$,
  because every restriction only removed original neighbors. Apply Theorem 12 to (7.26) and (7.22). We obtain

#[#set math.equation(numbering: n => "(7.27)")
 $ z gt.eq min { 1 \, x + z \, \( x + z + s \) \/ 2 } . $ <eq:rate-tied-xz>]

For $x > 0$ and $z < 1$ this is exactly $z gt.eq x + s$.

For the second test, return to a fresh copy of the pre-average point–label law $cal(R)$,
  restrict it to its good label-$0$ values from Proposition 31, and marginalize label $2$.
  This lifts the pair-only filter to the same incidence law;
  the star comparisons and label-$0$ coordinate support remain on one graph.
  The conditional direction law of label $1$ at each retained label $0$ is unchanged and has rate $s$.
  Fix a typical label $0$ and apply the simultaneous core to the point–label-$1$ comparison and the label-$0$
  coordinate product. Its new label-$1$ marginal retains the direction cap with a subpower inverse mass loss.
  Then fix the point coordinates $X \, Z_0$; label $1$ is free.
  The point population is $U_0$, of dimension $q$ on typical slices by that coordinate product.
  Its direction comparison is this retained #emph[pre-slice] label-$1$ marginal,
  for the direction $"flip" \( theta_1 - theta_0 \)$. The fixed-label core uses the $i = 0$ comparison in (7.15);
  Corollary 9 preserves this same direction population on the subsequent $\( X \, Z_0 \)$ slice.
  Equation (7.18) projects $U_0$ to the $Z_1$ support, giving

#[#set math.equation(numbering: n => "(7.28)")
 $ z gt.eq min { 1 \, q \, \( q + s \) \/ 2 } . $ <eq:rate-tied-q>]

If $q > 2 - s$, both other terms exceed or equal $1$, so $z gt.eq 1$.
  This proves the last assertion in the absence of strip concentration.

All rotations and scalar slices just used have a finite-grid meaning.
  Rotated finest-scale squares meet boundedly many original squares and conversely.
  Add the two descriptions and their bounded neighbor tags when conditioning.
  Equation (7.18) then holds up to $O \( rho \)$; all interval bounds use constant enlargements.
  The factors $alpha^(- 1)$ and the harmless angular separations can be bounded by $rho^(- eta)$ for each fixed
  $eta > 0$ before the limit. Replacing a finest scale by a $rho^(- O \( eta \))$ enlargement changes the
  displayed exponent inequalities by $O \( eta \)$, which is sent to zero afterwards.

=== 7.6 Concentration in a strip <concentration-in-a-strip>

It remains to justify the alternative omitted above. Test the original retained one-label marginal $lambda$ before
  sampling replicas. If (7.20) fails along some subsequence at a fixed depth $t > 0$,
  pass to a subsequence and choose a strip of width $rho^t$ whose $lambda$-mass is $rho^(o \( 1 \))$.
  This follows by choosing a sequence on which the nonnegative exponent of the maximal strip mass tends to zero.
  Otherwise a positive lower bound for that exponent supplies (7.20) at each fixed depth,
  and a diagonal supplies all the depths used above. Subpower product domination then prevents concentration of a
  replicated marginal that was absent from the one-label population.

Restrict the one-label graph to the chosen strip and normalize it as the new $p^0$.
  Its mass in the previous law is subpower, so the old named products give the small information required by
  Lemma 30. Shorten the working block to a fixed positive depth no greater than $t$, if necessary,
  and fix its prefix list before taking the small-parameter limit.
  Intersect the fresh bins with all typical-parent filters needed for the inherited conditional bounds,
  keep this allowed restriction unnormalized, and apply the lemma once for that finite list.
  Relabel its output $pi$ and its actual pair marginals $mu \, lambda$.
  Its pair and coordinate products now use actual factors before any new replicas are sampled,
  and its support still lies in the chosen strip. In these shorter block units the coordinate rates remain $x \,
  q \, z$, by (7.7); the time and joint parameter rates remain at least $s$.
  The strip is now as thin as the finest precision. Let $d_0$ be its unit direction.
  Both coordinates of $d_0$ have exponent zero. Indeed, if (say) its first coordinate had magnitude at most
  $rho^b$ along a subsequence with $b > 0$, the bounded strip would lie in a time-coordinate interval of a fixed
  positive depth. Its subpower retained mass contradicts the time marginal bound in (7.13).
  The second coordinate is treated using the positive normal marginal bound. In particular

$ \| "flip" \( d_0 \) dot.op d_0 \| = 2 \| \( d_0 \)_1 \( d_0 \)_2 \| = rho^(o \( 1 \)) . $

The scalar position along the strip has prefix ball dimension at least $s$:
  projection to the time coordinate has this bound, and its slope along the strip has exponent zero.
  After sampling three labels over the restricted graph, typical pairs have separation $rho^(o \( 1 \))$ by this
  scalar bound. Their differences are parallel to $d_0$ up to finest-scale errors,
  so the scalar third slope $"flip" \( d_0 \) dot.op theta_2$ has dimension at least $s$ directly.
  Typical fixed-pair comparisons preserve it. The proof of (7.27), including both products at labels $0 \, 1$,
  now applies with $d_0$ in place of $d$: perpendicular invariance and parallel transfer have only finest-scale
  errors. Thus $x > 0 \, z < 1$ again gives $z gt.eq x + s$.

For the remaining test, start from a fresh copy of the strip star before the preceding fixed-pair restrictions,
  then fix label $0$ and $X$, leaving label $1$ free. Set $B_0 = "flip" \( d_0 \) dot.op U_0$.
  If $q > 2 - s$, then $q > 1$. A strip of width $r$ for $B_0$ is covered by $O \( r^(- 1) \)$ balls of radius $r$
  in the bounded $U_0$-plane. Hence its mass is at most $C r^(q - 1)$, with subpower $C$.
  The label-$0$ coordinate product, after the typical $X$ slice, gives ball dimension at least $q - 1 +
  z$ for $\( B_0 \, Z_0 \)$. The free comparison law is the retained label-$1$ marginal;
  its scalar position along the strip has dimension $s$. Equation (7.18) projects this pair to $Z_1$ with that
  scalar slope, up to a known translation and finest-scale errors. Theorem 12 gives

$ z gt.eq min { 1 \, q - 1 + z \, \( q - 1 + z + s \) \/ 2 } . $

If $z < 1$ and $q > 2 - s$, each expression inside this minimum is strictly greater than $z$:
  for the last one use $q - 1 + s > 1 > z$. This is impossible.
  Consequently $z < 1$ implies $q lt.eq 2 - s$ also in the strip case.

This completes the proof of Proposition 29. The order is the block sequence $\( h_n \, epsilon.alt_n \)$ first,
  the homogeneous scalar and direction profiles second, and their tested depths and positive derivative increments
  third. At that third stage every test fixes its finite list before taking a subsequence limit in $n$,
  and uniform trims precede all restrictions using their bounds.
  The derivative increment is sent to zero only afterwards.
  Each prescribed accuracy in the directional bootstrap requires finitely many iterations;
  a diagonal over those finite tests proves the exact inequalities.
  Thus neither a new $h_n$ chosen from a later direction profile nor a uniform differentiability modulus across
  profiles is required.

== 8 Closure of the classical growth argument <sec:classical-closure>

We complete the proof of Theorem 15. Fix $0 < gamma < 1$ and suppose for a contradiction that $beta > gamma$.
  The least-aspect construction and isotropic exclusion leave the matched process with $m >
  0$ used in Sections 6 and 7. We keep the same saturated homogeneous component, so its functions $b \, S \,
  Phi$ and its root level $tau$ are the ones selected before the trace point and block scales.

On the aperture region (6.4), the potential $Phi$ satisfies the obstacle (6.6) and meets it along $i = b \( u \)$.
  The trace theorem supplies the plane rates $x \, y \, w \, z \, D$, with the single middle rate $q =
  a_U$ when $m = 1$. Proposition 29 constrains these rates at generic plane points with $i > 0$.
  At almost every contact time, $p = - b' \( u \)$ belongs to $\[ 0 \, 1 + m \]$ and $s =
  S' \( u \)$ belongs to $\( 0 \, 1 \]$. We now transfer the generic rate constraints to tuples on the inward
  sides of the contact curve, obtain a positive tangent rate there, and combine them with the contact relation.

All information and entropy expressions in this section are limiting normalized quantities.
  In every comparison involving an additional fixed depth, its finite-scale ambiguity tends to zero before that
  depth is sent to zero.

=== 8.1 Rate tuples at a contact point <rate-tuples-at-a-contact-point>

For distinct clocks put

#[#set math.equation(numbering: n => "(8.1)")
 $ B & = x + y + w + z - 2 \,\
F \( P \) & = 2 P - m - P x + \( 1 - P \) y + \( m - P \) w + \( 1 + m - P \) z . $ <eq:closure-F>]

For tied clocks these definitions mean

#[#set math.equation(numbering: n => "(8.2)")
 $ B = x + q + z - 2 \, wide F \( P \) = 2 P - 1 - P x + \( 1 - P \) q + \( 2 - P \) z . $ <eq:closure-F-tied>]

In either case $F' \( P \) = - B$, with the rates held fixed.

#thm([Lemma 8.1.])[
  (Contact tuples).  #emph[At almost every $u_0 in \( 0 \, 1 \)$, set
$ b_0 = b \( u_0 \) \, wide p = - b' \( u_0 \) \, wide s = S' \( u_0 \) . $

 The following assertions hold on each side of the contact curve that lies inward from the aperture boundary.
   Minus denotes smaller $i$ and plus denotes larger $i$.]
  + #emph[Rescale area measure on a fixed bounded region of positive area in a tangent half-plane and form the
    joint distribution of the generic plane rates. Tuples in a subsequential limiting support obey the capacity
    bounds and all the implications of Proposition 29, with the fixed value $s$.
    Every data rate with clock $c_j eq.not p$, and also $D$, has a fixed value on each such support,
    equal to its one-sided strong trace. Here $c_j in { 0 \, 1 \, m \, 1 + m }$,
    with the two middle clocks grouped when $m = 1$.]
  + #emph[Every tuple on either side satisfies
#[#set math.equation(numbering: n => "(8.3)")
 $ F \( p \) + D = 2 s - beta - gamma m . $ <eq:closure-contact-identity>]

]
  + #emph[There is a minus tuple with $B lt.eq 0$ whenever that side is admissible,
    and there is a plus tuple with $B gt.eq 0$ whenever that side is admissible.]
  + #emph[If both sides are admissible and $p < 1 + m$, then
#[#set math.equation(numbering: n => "(8.4)")
 $ D^(-) - D^(+) gt.eq \( 1 + m - p \) \( z^(+) - z^(-) \) . $ <eq:closure-jump>]

]
  #emph[If $b_0 = 0$, then $p = 0$ and the plus side is admissible.
    If $b_0 + \( 1 + m \) u_0 = L$, then $p = 1 + m$ and the minus side is admissible.]
] <lem:closure-contact-tuples>

#proof[
  Choose a common differentiability point of $b \, S$ which is a Lebesgue point of $S'$ and a point of the strong
    curve traces in Lemma 28. The assertions concerning aperture boundaries follow by differentiating the
    nonnegative Lipschitz functions $b \( u \)$ and $L - b \( u \) - \( 1 + m \) u$ at a zero.
    Their derivative is zero at every such interior differentiability point.
  For $h arrow.b 0$ take a locally uniform subsequential limit
  $ phi.alt_h \( xi \, eta \) = frac(Phi \( b_0 + h xi \, u_0 + h eta \) - Phi \( b_0 \, u_0 \), h) arrow.r
    phi.alt \( xi \, eta \) . $
  Uniform local Lipschitz bounds give this compactness. On the tangent line $xi + p eta = 0$,
    contact and differentiability give
  #[#set math.equation(numbering: n => "(8.5)")
   $ phi.alt \( - p eta \, eta \) = k eta \, wide k = - 2 p + \( 1 - gamma \) m + 2 s -
     beta . $ <eq:closure-tangent-contact>]
  On each inward half-plane the obstacle becomes
  #[#set math.equation(numbering: n => "(8.6)")
   $ phi.alt \( xi \, eta \) gt.eq ell \( xi \, eta \) := 2 xi + \( \( 1 - gamma \) m + 2 s - beta \) eta .
     $ <eq:closure-linear-obstacle>]
  These assertions include the boundary line by continuity.
    They follow first on compact subsets of the limiting aperture domain and then on its boundary by the common
    Lipschitz bound.
  The plane derivative identities (6.11) are
  $ Phi_i = x + y + w + z \, wide Phi_u = y + m w + \( 1 + m \) z + D \, $
  with the grouped interpretation at $m = 1$. By Lemma 28, the expression
  $ Phi_u - p Phi_i = - p x + \( 1 - p \) y + \( m - p \) w + \( 1 + m - p \) z + D $
  converges strongly in mean on each tangent half-ball to a constant.
    Indeed every rate appearing with nonzero coefficient is transverse to the contact curve;
    a possibly untraced rate has $c_j = p$ and coefficient zero.
    Passing to weak derivatives of $phi.alt_h$ therefore shows that $\( partial_eta - p partial_xi \) phi.alt =
    k_plus.minus$ is constant on each half-plane. In coordinates $r = xi + p eta \, eta$,
    this implies $phi.alt \( r - p eta \, eta \) = k_plus.minus eta + H_plus.minus \( r \)$ locally.
    Continuity at $r = 0$ and (8.5) give $k_plus.minus = k$. Adding $2 p - m$ proves (8.3).
  Here is a precise way to choose tuples and the horizontal signs. Fix a bounded strip
  $ Omega_(+) = { \( xi \, eta \) : \| eta \| < a \, med 0 < xi + p eta < a } $
  on an admissible plus side, or its counterpart $Omega_(-)$ with $- a < xi + p eta < 0$.
    Sample the generic rate vector at $\( b_0 + h xi \, u_0 + h eta \)$ with uniform area measure on that strip,
    including $S' \( u_0 + h eta \)$ in the vector. Intersections with the actual inward domain, if necessary,
    change a set of relative area $o \( 1 \)$. Boundedness gives a weakly convergent subsequence of these
    probability laws. The strong traces fix every transverse rate and $D$ on the support,
    and the Lebesgue-point property fixes the last coordinate to $s$.
    Each strict-hypothesis implication in Proposition 29 persists on this support:
    a violation with a strictly positive source or a strictly subunit target would hold on an open neighborhood
    disjoint from every sufficiently late sampled law. Thus all these tuples have the claimed generic constraints
    and the identity just proved.
  For almost every fixed $eta$, horizontal integration of (8.6), using equality at $r = 0$, gives
  $ integral_(- a)^0 partial_xi \( phi.alt - ell \) \( r - p eta \, eta \) thin d r lt.eq 0 \, wide
    integral_0^a partial_xi \( phi.alt - ell \) \( r - p eta \, eta \) thin d r gt.eq 0 $
  on the corresponding admissible sides. Since the limiting horizontal derivative is the weak limit of $B$,
    the mean of $B$ in the minus tuple law is nonpositive and in the plus tuple law is nonnegative.
    A continuous function on a compact support cannot have nonpositive mean while being strictly positive
    everywhere, nor nonnegative mean while being strictly negative everywhere.
    This supplies the two required tuples. The same construction can be made for any fixed bounded subset of a
    tangent half-plane; only finitely many such subsequences will be used below.
  Finally, the plane measure inequality (6.21) is
  $ \( partial_u - \( 1 + m \) partial_i \) z gt.eq partial_i D . $
  When $p < 1 + m$, both $z$ and $D$ have strong traces. Rescaling this inequality at the contact point leaves
    piecewise constant limits on the two half-planes. Their distributional derivatives across $xi + p eta =
    0$ have coefficients $\( p - 1 - m \) \( z^(+) - z^(-) \)$ and $D^(+) - D^(-)$, respectively.
    Positivity of the limiting measure gives (8.4). ◻
]

=== 8.2 Aperture refinement forces a positive tangent rate <aperture-refinement-forces-a-positive-tangent-rate>

#thm([Lemma 8.2.])[
  (Positive $X$ rate).  #emph[At the contact points of Lemma 32, $x^(-) gt.eq gamma$ if $p > 0$.
    If $p = 0$, an admissible plus tuple can be chosen with $x gt.eq gamma > 0$.]
] <lem:closure-positive-x>

#proof[
  Fix such a point and let $E_0$ be its contact observation, with labels $C_(u_0) \, R_(m u_0)$ and data depths
  $ b_0 \, quad b_0 + u_0 \, quad b_0 + m u_0 \, quad b_0 + \( 1 + m \) u_0 . $
  Keep these labels and refine $X \, Y$ by a depth $d$, where $0 < d < m u_0$.
    The resulting observation is an admissible aperture with width depths $\( b_0 + d \, b_0 + m u_0 \)$;
    the old orientation prefix is an allowed extra label. Passing to the required coarser orientation prefix of
    depth $m u_0 - d$ creates normal velocity uncertainty at most
    $O \( epsilon.alt^(m u_0 - d) epsilon.alt^(b_0 + d) \) = O \( epsilon.alt^(b_0 + m u_0) \)$;
    the position calculation has the same extra factor $epsilon.alt^(u_0)$ on both sides.
    Thus the old-frame boxes and a standard aperture test have bounded ambiguity.
    This aperture refinement is available also when $m = 1$; it does not use the grouped auxiliary profile.
    Its weight increases by $\( 1 + gamma \) d$. Comparing its universal score bound with the saturated score at
    $E_0$ yields
  $ sans(H) \( X_(b_0 + d) \, Y_(b_0 + u_0 + d) divides E_0 \) gt.eq \( 1 + gamma \) d . $
  The $Y$ refinement, even after conditioning on the new $X$, has entropy at most $d$, by scalar box counting.
    Consequently the nondecreasing Lipschitz profile
  #[#set math.equation(numbering: n => "(8.7)")
   $ g \( d \) := sans(H) \( X_(b_0 + d) divides E_0 \) quad upright("satisfies") quad g \( 0 \) = 0 \, wide
     g \( d \) gt.eq gamma d . $ <eq:closure-x-entropy>]
  These profiles can be extracted along the same sequence, first on countably many depths and then by their
    Lipschitz extension.
  Choose $0 < lambda < min { 1 \, m }$, put $v = u_0 - h$, and consider
  #[#set math.equation(numbering: n => "(8.8)")
   $ b_0 lt.eq i lt.eq b_0 + lambda h \, wide h > 0 upright(" sufficiently small") . $ <eq:closure-x-wedge>]
  We claim that $E_0$ together with $X_i$ determines the plane observation $E \( i \, v \)$ to zero information
    cost. The earlier labels are coarsenings of those in $E_0$. With
  $ c = C_v - C_(u_0) \, wide r = R_(m u_0) - R_(m v) \, wide \| c \| lt.tilde epsilon.alt^v \,
    quad \| r \| lt.tilde epsilon.alt^(m v) \, $
  the change of coordinates is
  $ Y_v = Y_(u_0) + c X \, quad W_v = W_(u_0) + r X \, quad Z_v = Z_(u_0) + c W_(u_0) + r Y_(u_0) + c r X . $
  Only errors within the recorded boxes matter, since all their centers and the label shifts are known.
    The old $Y$ error fits depth $i + v$ because $i - b_0 < h$, and the old $W$ error fits depth $i +
    m v$ because $i - b_0 < m h$; the terms $c X \, r X$ fit those depths using $X_i$.
    For $Z_v$ the four error depths are, respectively,
  $ b_0 + \( 1 + m \) u_0 \, quad b_0 + \( 1 + m \) u_0 - h \, quad b_0 + \( 1 + m \) u_0 - m h \, quad
    i + \( 1 + m \) v . $
  All are at least the target depth $i + \( 1 + m \) v$, by $i - b_0 < min { 1 \, m } h$.
    Thus the asserted determination holds with bounded box ambiguity, which vanishes in normalized entropy.
  For a further fixed $t > 0$ with $i + t < b_0 + m u_0$, conditioning on $E_0 \, X_i$ therefore gives
  #[#set math.equation(numbering: n => "(8.9)")
   $ sans(H) \( X_(i + t) divides E \( i \, v \) \) gt.eq g \( i - b_0 + t \) -
     g \( i - b_0 \) . $ <eq:closure-x-increment>]
  The left side is the increase of particle information when just $L_X$ is raised by $t$ at the plane point.
    This is an inward direction of the resolution cone. At almost every $\( i \, v \)$ the affine cone blow-up in
    Theorem 26 supplies a sequence $t arrow.b 0$ along which this increase divided by $t$ tends to
    $x \( i \, v \)$. At almost every $i$, the right side divided by $t$ tends to $g' \( i - b_0 \)$. Hence
  $ x \( i \, u_0 - h \) gt.eq g' \( i - b_0 \) $
  at almost every point of (8.8). Fubini’s theorem and (8.7) imply, for almost every sufficiently small $h$,
  #[#set math.equation(numbering: n => "(8.10)")
   $ integral_(b_0)^(b_0 + lambda h) x \( i \, u_0 - h \) thin d i gt.eq g \( lambda h \) - g \( 0 \) gt.eq
     gamma lambda h . $ <eq:closure-x-average>]
  Integrate also over $h in \[ rho \, 2 rho \]$ and send $rho arrow.b 0$. If $p > 0$, take $lambda < p$ as well.
    Differentiability gives $b \( u_0 - h \) = b_0 + p h + o \( h \)$, uniformly in this range,
    so the region lies on the minus side for small $rho$. Since $c_X = 0 eq.not p$,
    the strong trace of $x$ makes its average tend to $x^(-)$. Inequality (8.10) gives $x^(-) gt.eq gamma$.
  If $p = 0$, the same region is on the plus side apart from area $o \( rho^2 \)$.
    Removing that part changes the average by $o \( 1 \)$, since $0 lt.eq x lt.eq 1$.
    A subsequential tuple law from the remaining region therefore has mean $x$ at least $gamma$,
    and its compact support contains a tuple with $x gt.eq gamma$.
    All its other transverse components are the same plus traces used in Lemma 32.
    This proves the assertion without requiring a trace for the characteristic component $x$. ◻
]

=== 8.3 The finite sign calculation <the-finite-sign-calculation>

#thm([Lemma 8.3.])[
  (Algebraic rate bounds).  #emph[Let $m > 0$, $0 < s lt.eq 1$,
    and let a rate tuple obey the capacity bounds and the implications of Proposition 29.
    Put $p_(*) = \( 1 + m \) \/ 2$. Then
#[#set math.equation(numbering: n => "(8.11)")
 $ x > 0 \, med z < 1 & quad arrow.r.double quad F \( p_(*) \) gt.eq 1 + s \,\
x > 0 \, med z = 1 & quad arrow.r.double quad F \( 0 \) gt.eq 1 + s \,\
x = 0 \, med z < 1 & quad arrow.r.double quad F \( 1 + m \) gt.eq 1 + s . $ <eq:closure-midpoint>]

 Moreover, if $x > 0$, $z < 1$, and $0 lt.eq p lt.eq p_(*)$,
   replacing $z$ by $1$ in $F \( p \)$ gives a number at least $1 + s$.]
] <lem:closure-sign-algebra>

#proof[
  First suppose $m eq.not 1$. If $x > 0$ and $z < 1$, the chains imply
  #[#set math.equation(numbering: n => "(8.12)")
   $ w gt.eq x \, wide y gt.eq x + s \, wide z gt.eq y \, wide z gt.eq w + s . $ <eq:closure-chain-box>]
  Indeed $x > 0$ first gives positive $y \, w$; if $y$ or $w$ were $1$,
    the corresponding chain to $z$ would force $z = 1$. The non-saturated branches of the time chains then give $y
    gt.eq x + s$ and $z gt.eq w + s$. The other two chains give $w gt.eq x$ and $z gt.eq y$. Thus
  #[#set math.equation(numbering: n => "(8.13)")
   $ 0 lt.eq x lt.eq w lt.eq 1 - s \, wide x + s lt.eq y lt.eq 1 . $ <eq:closure-box-bounds>]
  The midpoint identity
  $ F \( p_(*) \) - 1 = frac(\( y - x \) + \( z - w \) + m \( w - x \) + m \( z - y \), 2) $
  proves (8.11) for every $m > 0$, including $m < 1$. If instead $x > 0 \, z = 1$,
    the first time chain gives $y gt.eq s$, so
  $ F \( 0 \) = 1 + y + m w gt.eq 1 + s . $
  If $x = 0 \, z < 1$, the chain $w arrow.r z$ gives $w lt.eq 1 - s$ whenever $w > 0$;
    this bound also holds for $w = 0$. Hence
  $ F \( 1 + m \) = 2 + m - m y - w gt.eq 2 - w gt.eq 1 + s . $
  For the last assertion write the expression after replacement as
  $ A = 1 + p - p x + \( 1 - p \) y + \( m - p \) w . $
  If $0 lt.eq p lt.eq 1$ and $p lt.eq p_(*)$, the exact identity
  $ A - \( 1 + s \) =  & \( 1 - p \) \( y - x - s \) + \( 1 + m - 2 p \) x\
 & + m \( w - x \) + p \( 1 - s - w \) $
  is a sum of nonnegative terms by (8.13). In particular it covers the whole range $0 lt.eq p lt.eq
    p_(*)$ when $m < 1$, even when $m - p < 0$ in the original expression for $A$.
    If $1 < p lt.eq p_(*)$, necessarily $m gt.eq 2 p - 1 > p$, and the exact identity
  $ A - \( 1 + s \) =  & \( p - 1 \) \( 1 - y \) + \( m - p \) \( w - x \)\
 & + \( 1 + m - 2 p \) x + \( 1 - s - x \) $
  again has nonnegative terms. This covers the remaining range for $m >
    1$ and agrees with the first calculation at $p = 1$.
  For $m = 1$, use $q$ rather than separate middle rates. The three relevant evaluations are
  $ F \( 1 \) = 1 + z - x \, wide F \( 0 \) \|_(z = 1) = 1 + q \, wide F \( 2 \) \|_(x = 0) = 3 - q . $
  The tied-clock implications $z gt.eq x + s$ when $x > 0 \, z < 1$, $q gt.eq s$ when $x > 0$, and $q lt.eq 2 -
    s$ when $z < 1$ prove (8.11)–(8.11). For $0 lt.eq p lt.eq 1 =
    p_(*)$ the expression with $z$ replaced by $1$ is $A = 1 + p - p x + \( 1 - p \) q$, and
  $ A - \( 1 + s \) = p \( 1 - s - x \) + \( 1 - p \) \( q - s \) gt.eq 0 . $
  Here $x lt.eq 1 - s$ follows from $z gt.eq x + s$ and $z < 1$. ◻
]

=== 8.4 Contradiction and completion <contradiction-and-completion>

#proof[
  #emph[Completion of the proof of Theorem 15.] Choose a contact point satisfying the preceding lemmas,
    and keep its $p \, s$ fixed. The identity (8.3) has right side strictly below the algebraic threshold:
  #[#set math.equation(numbering: n => "(8.14)")
   $ 2 s - beta - gamma m < 1 + s \, $ <eq:closure-strict-gap>]
  since $s lt.eq 1$ and $beta > gamma > 0$. All label rates $D$ are nonnegative.
  Suppose first that $p gt.eq p_(*)$. Since $p > 0$, the point cannot lie on the lower aperture boundary,
    so the minus side is admissible. Choose there a tuple with $B lt.eq 0$.
    Lemma 33 gives $x = x^(-) gt.eq gamma > 0$. For this tuple $F$ is nondecreasing.
    If $z < 1$, then $F \( p \) gt.eq F \( p_(*) \) gt.eq 1 + s$; if $z = 1$, then $F \( p \) gt.eq
    F \( 0 \) gt.eq 1 + s$. Both alternatives contradict (8.3) and (8.14).
    This includes $p = p_(*)$ and the upper boundary value $p = 1 + m$.
    At the latter value $z$ can lack a strong trace, but its coefficient in $F \( p \)$ is zero and the selected
    tuple is sufficient.
  It remains that $0 lt.eq p < p_(*)$. In this range $p < 1 + m$,
    so the point cannot be on the upper aperture boundary and the plus side is admissible.
    Choose a plus tuple with $B gt.eq 0$, for which $F$ is nonincreasing.
    If it had $z < 1$, the case $x > 0$ would give $F \( p \) gt.eq F \( p_(*) \) gt.eq 1 + s$, and the case $x =
    0$ would give $F \( p \) gt.eq F \( 1 + m \) gt.eq 1 + s$. Either is impossible. Thus this tuple has $z = 1$.
    Since the $Z$ clock is transverse for $p < 1 + m$, the fixed plus trace satisfies $z^(+) = 1$,
    and every plus tuple has that same value.
  If $p = 0$, take the plus tuple with $x > 0$ from Lemma 33.
    It too has $z = 1$, so $F \( 0 \) gt.eq 1 + s$, a contradiction.
    This handles the lower aperture boundary even though $X$ is then characteristic and need not have a strong trace.
  Finally suppose $0 < p < p_(*)$. Both sides are admissible, and $x^(-) > 0$.
    The $Z$ rate has strong traces on both sides. If $z^(-) = 1$, choose a minus tuple with $B lt.eq 0$;
    its nondecreasing $F$ would satisfy $F \( p \) gt.eq F \( 0 \) gt.eq 1 + s$. Therefore $z^(-) < 1$.
    For any minus tuple the jump estimate, $z^(+) = 1$, and $D^(+) gt.eq 0$ give
  $ D^(-) gt.eq \( 1 + m - p \) \( 1 - z^(-) \) . $
  Consequently
  $ F \( p \) + D^(-) gt.eq F \( p \) + \( 1 + m - p \) \( 1 - z^(-) \) . $
  The right side is exactly $F \( p \)$ with its $z$ entry replaced by $1$.
    It is at least $1 + s$ by Lemma 34, once more contradicting (8.3) and (8.14).
  The three ranges $m < 1$, $m = 1$, and $m > 1$ have all been included in the algebraic lemma.
    At the intermediate values $p = 1$ or $p = m$, an untraced middle component has zero tangential coefficient;
    the tuple argument and the nonnegative identities above remain valid.
    Thus no matched-clock least-aspect extremizer can exist under $beta > gamma$.
    The isotropic alternative was already excluded by Proposition 23.
    The contradiction proves $beta lt.eq gamma$, completing Theorem 15. ◻
]

== 9 Packet scores and finite decompositions <sec:packet-structure>

The classical theorem controls positive masses transported along exact lines.
  For oscillatory packets, an observed mass is the square of a coherent sum,
  and an earlier packet reaches the output within its own position uncertainty, up to controlled tails.
  We therefore begin with analytic mass and decomposition estimates before introducing any positive auxiliary law.
  The packet score below is designed to compose across a time cut.
  This section establishes its preliminary growth bound; the next two sections reduce excess growth to the
  uncertainty boundary and exclude it by a finite information argument.

The transverse dimension is two and $0 < gamma < 1$. All entropies are normalized by $ell =
  log \( 1 \/ epsilon.alt \)$, and $log_(1 \/ epsilon.alt) #h(-0.16667em) () r = log r \/ ell$.
  Constants in analytic estimates are independent of $epsilon.alt$ and of the input function.

=== 9.1 The phase class and the growth supremum <the-phase-class-and-the-growth-supremum>

The longitudinal coordinate is $c in \[ 0 \, 1 \]$, the input variable is $v in bb(R)^2$,
  and the observation position is $x in bb(R)^2$. The phase is defined on $\[ 0 \, 1 \] times bb(R)^2 times U_v$,
  for an open neighborhood $U_v$ of the bounded input patch. We use real phases satisfying

#[#set math.equation(numbering: n => "(9.1)")
 $ partial_v Phi \( c \, x \, v \) = zeta \( v \, x - c v \) . $ <eq:packet-phase>]

The function $zeta$ is defined for every $p in bb(R)^2$ and on all bounded $v$-patches needed in the argument.
  On each such patch, $partial_p zeta \( v \, p \)$ is symmetric and either

#[#set math.equation(numbering: n => "(9.2)")
 $ a_0 I lt.eq partial_p zeta \( v \, p \) lt.eq a_1 I quad upright("for all ") \( v \, p \) \,
   $ <eq:packet-definiteness>]

or the negative of this inequality holds. Here $a_0 > 0$.
  For some fixed $A_Phi gt.eq 1$, all derivatives of order $j$ of this matrix are bounded by
  $A_Phi^(j + 1) \( j ! \)^3$. Bounds on domains, $a_0^(- 1)$, $a_1$, and $A_Phi$ may vary between applications;
  they are uniform within each sequence in which $epsilon.alt arrow.r 0$.
  Input-only terms in $Phi$ are absorbed into the input.

Write

#[#set math.equation(numbering: n => "(9.3)")
 $ lambda^(- 1) = epsilon.alt^(H_(upright(P))) \, wide u_t = frac(H_(upright(P)) - t, 2) \, wide rho_t =
   epsilon.alt^(u_t) \, wide sigma_t = \( lambda rho_t \)^(- 1) = epsilon.alt^(u_t + t) . $ <eq:packet-scales>]

Time boxes are nested dyadic intervals in $\[ 0 \, 1 \]$, with root center $C_0 = 1 \/ 2$.
  A depth-$t$ box has length comparable to $epsilon.alt^t$. Its center is denoted by $C_t$.
  We take actual dyadic lengths in changes of coordinates; this changes depths by at most $log 2 \/ ell$.

An observation $O = \( C_t \, V \, X \)$ uses velocity and position lattices of spacings $rho_t$ and $sigma_t$,
  respectively. Bounded multiplicities and translated lattices are allowed. Its mass is

#[#set math.equation(numbering: n => "(9.4)")
 $ m_O \( f \) =
   lr(|rho_t^(- 1) integral f \( v \) psi_O (frac(v - V, rho_t)) e^(i lambda Phi \( C_t \, X \, v \)) thin d
   v|)^2 . $ <eq:packet-mass>]

The input belongs to $L^2$ and has bounded support. The amplitudes have fixed compact supports in their displayed
  variables, and every derivative has a uniform bound. The centers $X \, V$ range over bounded sets when $t > 0$.
  Suprema over any specified amplitude class with these uniform bounds are also permitted.
  Lemma 36 justifies these suprema by simultaneous choices at the sites.

At the root, the canonical mass is the supremum in (9.4) over amplitudes supported in ${ \| z \| lt.eq
  100 }$ with $parallel partial^alpha psi parallel_oo lt.eq 100^(\| alpha \| + 1) \( \| alpha \| ! \)^10$.
  The root grids are fixed. The position cutoff is $\| X \| lt.eq 1 + log lambda$, with a natural logarithm here,
  and velocity centers lie within $100 rho_0$ of the input support,
  or in a fixed sufficiently large enlargement of that support.

We use the aperture convention of Definition 14. Thus a label $D$ includes $C_t$, an orientation,
  a rectangle locating $V$, and a rectangle locating $X$, with tangent/normal widths
  $\( epsilon.alt^b \, epsilon.alt^a \)$ and $\( epsilon.alt^(b + t) \, epsilon.alt^(a + t) \)$.
  Labels may contain additional information. For packets the admissible depths satisfy

#[#set math.equation(numbering: n => "(9.5)")
 $ 0 lt.eq b lt.eq a lt.eq min \( L - t \, u_t \) \, wide L gt.eq t > 0 \, $ <eq:packet-apertures>]

and $w \( b \, a \) = \( 1 + gamma \) b + \( 1 - gamma \) a$.
  For any probability law on observations and aperture labels, supported where $m_O > 0$, define

#[#set math.equation(numbering: n => "(9.6)")
 $ P_t = sans(H) \( O \) + 1 / 2 sans(H) \( O divides D \) + 3 /
   2 bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O) + 1 / 2 bb(E) w \( D \) . $ <eq:packet-score>]

Let $K_0 \( f \)$ be the supremum of the corresponding root scores for the canonical masses, with $0 lt.eq b lt.eq
  a lt.eq min \( L \, u_0 \)$, enlarged to include the value $3 /
  2 log_(1 \/ epsilon.alt) #h(-0.16667em) (parallel f parallel_2^2)$.
  The last option is part of the definition, including for rescaled local inputs.

The entropy terms connect the score to the desired $L^3$ estimate.
  For a finite family with at least one positive packet mass, omit the zero masses. The log-sum identity gives

$ sup_pi {sans(H)_pi \( O \) + 3 / 2 bb(E)_pi log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O)} =
  log_(1 \/ epsilon.alt) #h(-0.16667em) (sum_O m_O^(3 \/ 2)) \, $

where the supremum is over probability laws on the remaining sites.
  Because $m_O$ is a squared packet amplitude, the right side is the normalized logarithm of the cubic packet sum.
  At $t = H_(upright(P))$, admissibility forces $b = a = 0$, hence $w = 0$.
  For the maximizing observation law, every compatible endpoint score is at least the displayed value,
  because $sans(H) \( O divides D \) gt.eq 0$. For a given aperture score, put $M = sum_O m_O$,
  and let $M_D$ be the sum over all sites in the cap specified by $D$.
  Applying log-sum once without conditioning and once conditional on $D$ gives

$ P_t lt.eq log_(1 \/ epsilon.alt) #h(-0.16667em) (M) + 1 /
  2 bb(E) #scale(x: 120%, y: 120%)[\[] log_(1 \/ epsilon.alt) #h(-0.16667em) (M_D) +
  w \( D \) #scale(x: 120%, y: 120%)[\]] . $

Thus total and cap masses control the root aperture scores; the additional norm option in $K_0$ is estimated separately.

Multiplying $f$ by a scalar shifts both $P_t$ and $K_0$ by the same quantity.
  We may therefore normalize $parallel f parallel_2 = 1$ when considering their difference.
  Define $beta_(upright(q))$ to be the supremum of

#[#set math.equation(numbering: n => "(9.7)")
 $ limsup_(epsilon.alt arrow.r 0) frac(P_t - K_0, t) $ <eq:packet-growth-supremum>]

over all the preceding systems, allowing convergent bounded depth parameters with positive limiting duration.
  In each sequence all domain, phase, amplitude, and multiplicity bounds are fixed.
  The input and the individual phase and amplitude choices may depend on $epsilon.alt$.
  The supremum over sequences also allows any choices of these fixed bounds.

#thm([Theorem 9.1.])[
  (Packet growth).  #emph[For the phase class (9.1)–(9.2), $beta_(upright(q)) lt.eq gamma \/ 2$.
    Equivalently, for fixed admissible depth parameters and uniform bounds on the data, and for every $nu > 0$,
    there is $epsilon.alt_0 > 0$ such that
#[#set math.equation(numbering: n => "(9.8)")
 $ P_t lt.eq K_0 + (gamma / 2 + nu) t wide \( 0 < epsilon.alt < epsilon.alt_0 \) . $ <eq:packet-growth-finite>]

 The same statement holds for convergent bounded parameters with positive limiting duration.]
] <thm:packet-growth>

The proof is completed in Section 11. The present section proves all the analytic decomposition statements and the
  preliminary bound $beta_(upright(q)) lt.eq 1$ used in that proof.
  Uniformity in (9.8) follows from the supremum definition:
  a failure for fixed bounds would select a sequence contradicting the claimed bound on $beta_(upright(q))$.

=== 9.2 Bessel estimates and changes of scale <bessel-estimates-and-changes-of-scale>

Fourier localization and almost orthogonality are the standard analytic ingredients of wave-packet decomposition;
  see, for example, #cite(label("Tao2003"), form: "prose") and
  #cite(label("GuoOhWangWuZhang2025"), form: "prose"). We give the estimates with the phase class and uniform
  amplitude bounds required by our packet score, including changes of scale and quantified tails.

#thm([Lemma 9.2.])[
  (Uniform packet Bessel estimates).  #emph[At a fixed time anchor,
    packets with natural spacings $rho$ in velocity and $sigma = \( lambda rho \)^(- 1)$ in position satisfy
#[#set math.equation(numbering: n => "(9.9)")
 $ sum_O m_O \( f \) lt.eq C parallel f parallel_2^2 \, wide ∥sum_T c_T g_T∥_2^2 lt.eq C sum_T \| c_T \|^2 \,
   $ <eq:packet-bessel>]

 where $g_T$ are the normalized synthesis packets with the opposite phase sign.
   These inequalities hold for subsets and for canonical supremum masses.
   Their constants depend only on ellipticity, finitely many phase and amplitude derivative bounds, support sizes,
   and lattice multiplicity, and not on the number of sites or on the position cutoff.]
  #emph[More precisely, packets at this same time and scale obey, for every integer $M gt.eq 1$,
#[#set math.equation(numbering: n => "(9.10)")
 $ \| chevron.l g_(V \, X) \, g_(V' \, X') chevron.r \| lt.eq
   C_M upright(bold(1))_({ \| V - V' \| lt.eq C rho }) (1 + frac(\| X - X' \|, sigma))^(- M) . $ <eq:packet-gram>]

 At a local root, where both natural spacings equal $s$, let $F$ be any allowed phase-space cap and let $F^R$
   denote its enlargement by distance $R s$ in each velocity and position coordinate, $R gt.eq 2$.
   For $h = sum_T c_T g_T$ and every integer $M > 2$, canonical analysis gives
#[#set math.equation(numbering: n => "(9.11)")
 $ sum_(O in F) m_O \( h \) lt.eq C sum_(T in F^R) \| c_T \|^2 +
   C_M R^(4 - 2 M) sum_T \| c_T \|^2 . $ <eq:packet-cap-bessel>]

 Here a fixed enlargement of the support sizes is included in $F^R$.
   Every axis of $F$ is at least $s$; consequently $F^R$ is covered by at most $C R^4$ caps of the same widths.]
] <lem:packet-bessel>

#proof[
  Only overlapping velocity supports contribute. Put $v = V + rho z$.
    For the phase difference at equal time, its gradient in $z$ is
  $ lambda rho { zeta \( v \, X - c v \) - zeta \( v \, X' - c v \) } . $
  The braces equal $B \( v \) \( X - X' \)$, where $B \( v \)$ is the integral of $partial_p
    zeta$ along the segment between the two spatial arguments.
    The sign and lower bound in (9.2) give gradient size at least $a_0 \| X - X' \| \/ sigma$.
    Each higher derivative is bounded by $C_j \| X - X' \| \/ sigma$. Repeated use of
  $ frac(nabla phi dot.op nabla_z, i \| nabla phi \|^2) e^(i phi) = e^(i phi) $
  therefore gives (9.10): derivatives of its coefficients are bounded by the corresponding inverse gradient
    powers. The estimate with a factor $1 + \| X - X' \| \/ sigma$ also covers bounded separation.
    Taking $M > 2$, the row and column sums of the Gram matrix are bounded,
    since there are only boundedly many overlapping velocity centers and the position lattice is two-dimensional.
    The Schur estimate proves synthesis Bessel; its adjoint proves analysis Bessel.
  For supremum masses, choose independently at every site of an arbitrary finite subset an amplitude whose squared
    pairing is within a fixed factor of that site’s supremum.
    The same Gram estimate is uniform in all these choices. Taking the supremum and then exhausting the sites
    proves the assertion.
  For (9.11), split the synthesis coefficients into $F^R$ and its complement.
    Analysis and synthesis Bessel applied successively bound the first part by its coefficient square sum.
    For the other part, a nonzero Gram entry either has spatial separation at least a fixed multiple of $R s$,
    or is zero by disjoint velocity supports. Summing (9.10) outside that spatial radius gives row and column sums
    at most $C_M R^(2 - M)$. The resulting operator norm squared is at most $C_M R^(4 - 2 M)$.
    The inequality $\| a + b \|^2 lt.eq 2 \| a \|^2 + 2 \| b \|^2$ proves the claim after changing constants.
    This argument is again uniform over choices of canonical amplitudes.
    The covering count follows by enlarging each of the four coordinates:
    an interval of length at least $s$, enlarged by $R s$, needs at most $C R$ original-length intervals. ◻
]

Moving a center by a bounded number of its lattice spacings changes only an admissible amplitude factor,
  after removal of a scalar phase. The same is true when the time anchor moves inside its box and $X$ is
  transported by that displacement times $V$. Indeed, after a scalar phase is removed,
  the first derivative is bounded in packet units; the higher derivatives of the phase change are bounded by $C_j
  lambda rho_t^2 epsilon.alt^t = C_j$. This also proves the bounded ambiguity assertions used with shifted grids below.

Fix $0 lt.eq r < t$, fixed widths $b \, a$, and $0 lt.eq b_(*) lt.eq b$. The geometric localization label is

#[#set math.equation(numbering: n => "(9.12)")
 $ J_0 = (C_r \, V_(b_(*)) \, \( X + \( C_r - C_t \) V \)_(r + b_(*))) . $ <eq:packet-localizer>]

Subscripts on vectors denote grid cells. The endpoint observation and its aperture each determine this label to
  bounded ambiguity; adjoining the bounded neighboring-cell choices makes the determination exact.
  Write $V_J \, X_J$ for its velocity center and its trajectory position at $C_r$.
  Let $s_v = epsilon.alt^(b_(*))$, $s_c = epsilon.alt^r$, $s_x = s_c s_v$.
  In exact dyadic coordinates take the actual length of the time box for $s_c$. Set

#[#set math.equation(numbering: n => "(9.13)")
 $ v & = V_J + s_v v' \, & c & = C_r + s_c \( c' - 1 \/ 2 \) \,\
x & = X_J + \( c - C_r \) V_J + s_x x' \, & p' & = x' - c' v' . $ <eq:packet-rescale-coordinates>]

Then $x - c v = X_J - C_r v + s_x \( p' + v' \/ 2 \)$. Subtract $Phi \( C_r \, X_J \, v \)$ and divide the phase
  by $s_c s_v^2$. The new gradient function is

#[#set math.equation(numbering: n => "(9.14)")
 $ zeta' \( v' \, p' \) =
   frac(zeta \( v \, X_J - C_r v + s_x \( p' + v' \/ 2 \) \) - zeta \( v \, X_J - C_r v \), s_x) .
   $ <eq:packet-rescaled-phase>]

In particular, $partial_(p') zeta' = partial_p zeta \( v \, X_J - C_r v + s_x \( p' + v' \/ 2 \) \)$.
  Symmetry, definiteness, and uniform derivative bounds persist, with changed fixed constants.
  Differentiating this formula gives all the required derivative bounds;
  the affine substitutions have bounded derivatives, and $s_v \, s_x lt.eq 1$. The new parameters and input are

#[#set math.equation(numbering: n => "(9.15)")
 $ H'_(upright(P)) = H_(upright(P)) - r - 2 b_(*) \, quad L' = L - r - b_(*) \, quad f' \( v' \) =
   s_v f \( V_J + s_v v' \) e^(i lambda Phi \( C_r \, X_J \, V_J + s_v v' \)) . $ <eq:packet-rescaled-parameters>]

The input change preserves its $L^2$ norm and the pairing (9.4).
  At local endpoint time $t - r$, the velocity and position depths are $u_t - b_(*)$ and $u_t + t - r - b_(*)$.
  Also $H'_(upright(P)) gt.eq t - r > 0$, and the new aperture widths are $\( b - b_(*) \, a - b_(*) \)$.
  Their weight is $w \( b \, a \) - 2 b_(*)$. Conversely, a local root aperture becomes an aperture at $r$ after
  adding $b_(*)$ to both widths. Thus returning a score to the original coordinates adds $b_(*)$ to its weight
  contribution. The local inputs used below are sums of windows with centers in a fixed enlargement of the
  velocity cell of $J_0$. Their supports are therefore bounded in $v'$, uniformly in the localizer.

=== 9.3 A finite Fourier decomposition with quantified tails <a-finite-fourier-decomposition-with-quantified-tails>

We state error sizes before taking any limits. At fixed depths and bounded domains all the observation lattices,
  retained atom sets, and cap menus below have at most $C epsilon.alt^(- Q)$ elements for some fixed $Q$.
  The logarithmic root cutoff contributes a factor which can also be absorbed in this bound by increasing $Q$.
  This exponent does not bound the number of arbitrary extra labels; those are accounted for separately.

#thm([Lemma 9.3.])[
  (Finite packet decomposition).  #emph[Fix the data bounds, admissible depths, $r < t$, and $b_(*) lt.eq b$.
    Put $Delta = u_r - b_(*)$; then $Delta gt.eq \( t - r \) \/ 2 > 0$.
    For each localization $J_0$, there is a finite family of atoms
#[#set math.equation(numbering: n => "(9.16)")
 $ g_T \( v \) = rho_r^(- 1) eta_T \( \( v - V_T \) \/ rho_r \) e^(- i lambda Phi \( C_r \, X_T \, v \)) \, wide
   h_J = sum_T c_T g_T \, $ <eq:packet-earlier-atoms>]

 with $V_T$ within a fixed enlargement of its velocity cell and $\| X_T - X_J \| lt.eq C epsilon.alt^(r + b_(*))$.
   The amplitudes have uniform derivative bounds, the sites have bounded multiplicity,
   and $sum_T \| c_T \|^2 lt.eq C parallel f parallel_2^2$. Each coefficient is an analysis test at time $r$.
   If $r = 0$, then
#[#set math.equation(numbering: n => "(9.17)")
 $ \| c_T \|^2 lt.eq C_(upright("can")) m_T^(upright("can")) \( f \) $ <eq:packet-coeff-canonical>]

 with a fixed constant.]
  #emph[More quantitatively, choose $0 < eta < Delta \/ 4$ and any required power $A > 0$.
    There are an integer integration order $M$, a coefficient cutoff exponent $B$, constants $C_A$,
    and $epsilon.alt_0 > 0$, depending only on these choices and the fixed data, such that,
    for $0 < epsilon.alt < epsilon.alt_0$:]
  + #emph[Replacing $f$ by $h_J$ in every endpoint pairing belonging to $J_0$ changes it by at most $C_A
    epsilon.alt^A parallel f parallel_2$. Coefficients with $\| c_T \|^2 < epsilon.alt^B parallel f
    parallel_2^2$ may be omitted with the same error.]
  + #emph[An individual endpoint test interacts, up to such an error,
    only with overlapping velocity supports and atoms satisfying
#[#set math.equation(numbering: n => "(9.18)")
 $ \| V - V_T \| lt.eq C rho_t \, wide \| X - X_T - \( C_t - C_r \) V_T \| lt.eq
   C epsilon.alt^(- eta) sigma_r . $ <eq:packet-transport>]

 This assertion also holds for any subset of the retained coefficients.]
  + #emph[If one subsequently sums squared errors over at most $C epsilon.alt^(- Q)$ tests,
    the orders can be chosen to give total squared error at most $C_A epsilon.alt^(2 A) parallel f parallel_2^2$.]
  #emph[For example it suffices to choose
#[#set math.equation(numbering: n => "(9.19)")
 $ M > 4 + frac(A + Q + 4, min \( eta \, Delta \/ 2 \)) \, wide B > 2 A + 3 Q + 10 . $ <eq:packet-tail-orders>]

 Only finitely many derivatives, up to an order determined by $M$, are used.
   All constants are fixed before $epsilon.alt$ tends to zero.
   The enlargement parameter $eta$ may tend to zero afterwards.
   After the finite family and its coefficient cutoff $B$ have been chosen,
   the integration order for the transport estimate in part 2 can be increased independently,
   without changing that family or $B$.]
] <lem:packet-decomposition>

#proof[
  Choose real smooth windows $chi_j$, at scale $rho_r$, with bounded overlap and $sum_j chi_j^2 =
    1$ on the velocity region needed by this localizer. They can be chosen with support inside a square of side $4
    rho_r$ and rescaled derivative bounds $C^(k + 1) \( k ! \)^2$.
    To construct them, take translates of a Gevrey bump positive on a lattice cell and divide by the square root
    of the positive, boundedly overlapping sum of their squares.
    One may build the bump from $e^(- 1 \/ s) upright(bold(1))_({ s > 0 })$:
    Cauchy’s formula on a complex disk of radius a small multiple of $s$,
    followed by maximizing $s^(- k) e^(- c \/ s)$, bounds its derivatives by $C^(k + 1) \( k ! \)^2$.
    Products of translated copies provide the required compactly supported bump.
    The product and composition derivative formulas preserve this Gevrey order, with changed constants.
  Write $z = \( v - V_j \) \/ rho_r$, and take a square of side $K$,
    fixed and larger than the supports of the rescaled windows. The function
  $ H_j \( z \) = rho_r f \( V_j + rho_r z \) chi_j \( z \) e^(i lambda Phi \( C_r \, X_J \, V_j + rho_r z \)) $
  has an $L^2$ Fourier series in the orthonormal basis $K^(- 1) e^(2 pi i n dot.op z \/ K)$, $n in bb(Z)^2$.
    Denote its coefficients by $c_(j \, n)$. Parseval and $sum_j chi_j^2 =
    1$ give $sum_(j \, n) \| c_(j \, n) \|^2 lt.eq parallel f parallel_2^2$.
    Before any truncation, synthesis uses the exact atoms
  #[#set math.equation(numbering: n => "(9.20)")
   $ \( K rho_r \)^(- 1) chi_j \( z \) e^(- i lambda Phi \( C_r \, X_J \, v \)) e^(2 pi i n dot.op z \/ K) .
     $ <eq:packet-linear-fourier-atoms>]
  Their sum is $f$ on the needed velocity region in $L^2$.
  For each mode, solve
  #[#set math.equation(numbering: n => "(9.21)")
   $ zeta \( V_j \, X_(j \, n) - C_r V_j \) = zeta \( V_j \, X_J - C_r V_j \) -
     frac(2 pi n, K lambda rho_r) . $ <eq:packet-gradient-matching>]
  For fixed $V_j$, the map on the left is globally invertible:
    its definite derivative gives both the lower Lipschitz bound $a_0 \| p - q \|$ and the upper bound $a_1 \| p -
    q \|$; it is a local diffeomorphism and is proper, hence its open and closed image is all of $bb(R)^2$.
    It is injective by the lower bound. The mode-to-position correspondence is therefore bilipschitz at spacing
    $sigma_r$. Round positions to that lattice, retaining the original mode as a bounded multiplicity label.
  For retained centers with $\| X_(j \, n) - X_J \| lt.eq C epsilon.alt^(r + b_(*))$,
    (9.20) equals (9.16) with amplitude
  $ eta_(j \, n) \( z \) =
    K^(- 1) chi_j \( z \) exp
    (i lambda \[ Phi \( C_r \, X_(j \, n) \, v \) - Phi \( C_r \, X_J \, v \) \] + frac(2 pi i n dot.op z, K)) . $
  The linear term cancels at $V_j$, up to the bounded error caused by rounding.
    For derivatives of order $k gt.eq 2$, the exponent has bounds controlled by
  $ C_k lambda rho_r^k epsilon.alt^(r + b_(*)) lt.eq C_k lambda rho_r^2 epsilon.alt^r = C_k . $
  Here and below the derivatives are obtained by subtracting the two $zeta$ expressions and integrating $partial_p
    zeta$; this also bounds mixed derivatives involving $v$. We used the exact scale identity $lambda rho_r^2
    epsilon.alt^r = 1$, up to the fixed dyadic rounding factor. Thus the amplitude bounds are uniform.
    The same Fourier coefficient, expressed with the conjugate of this amplitude,
    is an analysis pairing at $\( C_r \, V_j \, X_(j \, n) \)$.
  The derivative bounds on the exponent are, more precisely, $C^(k + 1) \( k ! \)^3$;
    the product and exponential derivative formulas give the deliberately weaker but convenient bound
    $C_1^(k + 1) \( k ! \)^5$ on $eta_(j \, n)$. Since
  $ sup_(k gt.eq 0) frac(C_1^(k + 1), 100^(k + 1) \( k ! \)^5) < oo \, $
  a fixed scalar multiple of every such amplitude belongs to the canonical class.
    Its support is inside the radius-100 ball. At $r = 0$ the retained spatial centers are bounded and hence lie
    inside $1 + log lambda$ for small $epsilon.alt$. This proves (9.17).
  We now estimate the discarded modes in their linear form (9.20), before replacing their phase by a packet phase.
    On a window meeting an endpoint velocity support, the phase difference between $\( C_t \, X \)$ and
    $\( C_r \, X_J \)$ has all derivatives of order at least two in $z$ bounded by $C_k$.
    Indeed the spatial arguments differ by $O \( epsilon.alt^(r + b_(*)) \)$,
    and the time difference is $O \( epsilon.alt^r \)$; the factor $lambda
    rho_r^2$ is canceled by $epsilon.alt^r$. By (9.21) and definiteness,
    the gradient at the window center has size comparable, up to bounded errors, to
  $ d_(j \, n \, O) = frac(\| X - X_(j \, n) - \( C_t - C_r \) V_j \|, sigma_r) . $
  Its higher derivatives have bounds independent of $n$. The same integration operator as in Lemma 36 therefore
    gives, for every $M$,
  #[#set math.equation(numbering: n => "(9.22)")
   $ \| chevron.l g_(j \, n) \, h_O chevron.r \| lt.eq C_M rho_r / rho_t \( 1 + d_(j \, n \, O) \)^(- M) \,
     $ <eq:packet-mixed-gram>]
  where $h_O$ denotes the normalized test. This notation refers to the exact linear atom when its center has not
    yet been retained. The factor $rho_r \/ rho_t$ is the product of the two normalization factors and the window
    area. Derivatives of the endpoint amplitude in window units are uniformly bounded because $rho_r lt.eq rho_t$.
  For each window, the bilipschitz mode lattice gives
  $ sum_(n : d_(j \, n \, O) > R) \| chevron.l g_(j \, n) \, h_O chevron.r \|^2 lt.eq
    C_M \( rho_r \/ rho_t \)^2 R^(2 - 2 M) wide \( R gt.eq 2 \) . $
  At most $C \( rho_t \/ rho_r \)^2$ windows meet an endpoint test. Summing cancels these scale factors.
    Cauchy–Schwarz with Parseval then bounds the discarded pairing by
  #[#set math.equation(numbering: n => "(9.23)")
   $ C_M R^(1 - M) parallel f parallel_2 . $ <eq:packet-summed-tail>]
  The spatial cutoff around $X_J$ can be chosen larger by a fixed factor than all the back-transported endpoint
    centers. Outside it, $R gt.eq c epsilon.alt^(- Delta)$, where $Delta = u_r - b_(*)$.
    The transport cutoff takes $R = epsilon.alt^(- eta)$. Thus their pairing errors are respectively $C_M
    epsilon.alt^(Delta \( M - 1 \)) parallel f parallel_2$ and $C_M epsilon.alt^(eta \( M - 1 \)) parallel f
    parallel_2$. The same square-sum argument applies to a subset of coefficients.
  There are at most $C epsilon.alt^(- Q)$ retained coefficients.
    Their part below $epsilon.alt^B parallel f parallel_2^2$ has square sum at most $C epsilon.alt^(B - Q)
    parallel f parallel_2^2$. Synthesis Bessel followed by the norm bound for one test controls its pairing error
    by $C epsilon.alt^(\( B - Q \) \/ 2) parallel f parallel_2$.
    Finally, summing squared pairing errors over at most $C epsilon.alt^(- Q)$ tests costs a factor $C
    epsilon.alt^(- Q)$. The conservative choices (9.19) dominate all these factors.
    Increasing $epsilon.alt_0^(- 1)$ absorbs fixed constants and proves all assertions. ◻
]

The tolerance in (9.18) is $sigma_r$, the #emph[earlier] position spacing.
  At the endpoint uncertainty scale it can be larger than $sigma_t$ by a power.
  Thus this lemma alone does not identify coherent packet masses with a positive law of straight trajectories at
  that finer precision.

=== 9.4 Classes with cap count bounds <classes-with-cap-count-bounds>

Here are explicit conventions for the finite errors in the remaining statements.
  Let $xi > 0$ be the mesh for coefficient and count exponents, and let $S gt.eq
  1$ bound the number of extra subdivision and winner tags at each geometric localizer.
  Constants implicit in $S$ may include powers of $1 + ell$ from dyadic shape menus.
  With fixed data, $eta \, xi \, A$, an admissible packet error is

#[#set math.equation(numbering: n => "(9.24)")
 $ e_(upright("pkt")) \( epsilon.alt \) = C \( eta + xi + log_(1 \/ epsilon.alt) #h(-0.16667em) () S \) +
   C_(upright("data") \, eta \, xi \, A) frac(1 + log \( 2 + ell \), ell) . $ <eq:packet-finite-error>]

The constants may be increased a finite number of times. There is no convergence assertion uniform as $eta$ tends
  to zero: the order is first $epsilon.alt arrow.r 0$, then $eta \, xi arrow.r 0$,
  with $log_(1 \/ epsilon.alt) #h(-0.16667em) () S arrow.r 0$.
  If a prescribed final error is needed, fix its small $eta \,
  xi$ first and choose all integration orders and $epsilon.alt_0$ afterwards.

#thm([Lemma 9.4.])[
  (Greedy cap classes).  #emph[In a geometric localizer, bin nonnegligible coefficients so that
#[#set math.equation(numbering: n => "(9.25)")
 $ \| log_(1 \/ epsilon.alt) #h(-0.16667em) (\| c_T \|^2) - log_(1 \/ epsilon.alt) #h(-0.16667em) () m \| lt.eq
   xi $ <eq:packet-mass-bin>]

 on each bin. Each bin admits a partition into classes, with a count parameter $g$ and fixed assigned-cap widths,
   having the following properties. If $N_(upright("all"))$ is the full class size,
   then for every allowed local root cap $F$,
#[#set math.equation(numbering: n => "(9.26)")
 $ log_(1 \/ epsilon.alt) #h(-0.16667em) (\# { T upright(" in the class") : T in F }) + w \( F \) lt.eq g +
   e_(upright("pkt")) . $ <eq:packet-cap-count>]

 An empty count imposes no restriction. There is an assigned cap $E =
   E \( T \)$ whose nonempty fibers in the full class satisfy
#[#set math.equation(numbering: n => "(9.27)")
 $ log_(1 \/ epsilon.alt) #h(-0.16667em) (\# { T : E \( T \) = E }) gt.eq g - w \( E \) -
   e_(upright("pkt")) . $ <eq:packet-assigned-fiber>]

 There are only a number of classes polynomial in $1 + ell$,
   with constants depending on the fixed exponents and $xi$.
   Any further tagged subdivision preserves (9.26); its retained size is denoted by $N lt.eq N_(upright("all"))$.
   The lower bound (9.27) always refers to the full class.]
] <lem:cap-class>

#proof[
  Use the finite cap menu at local root widths up to $min \( L - r - b_(*) \, u_r - b_(*) \)$,
    with bounded enlargements so every allowed cap is covered by boundedly many menu caps of the same widths up to
    fixed factors. On the current remaining population $cal(R)$, choose a cap maximizing
  $ log_(1 \/ epsilon.alt) #h(-0.16667em) (\# \( cal(R) ∩ E \)) + w \( E \) . $
  Assign its entire remaining contents to it and remove them. The successive maxima decrease.
    Group removals by an exponent interval of length $xi$ for this maximum and by the two assigned widths.
    Call an upper endpoint of the maximum interval $g$.
  The union in one such class lies inside the population present at its first removal.
    At that stage every cap count plus its weight is at most $g$, which proves (9.26).
    For a removal belonging to this class, its own maximum is at least $g - xi$, proving (9.27).
    Replacing an arbitrary cap by boundedly many menu caps changes the normalized bound by at most a fixed
    constant divided by $ell$. Rounding widths changes the weight by the same amount.
    The available coefficient exponents, after subtracting $log_(1 \/ epsilon.alt) #h(-0.16667em)
    (parallel f parallel_2^2)$, lie in a fixed bounded interval after the cutoff in Lemma 37; so do the maxima,
    since counts have exponent at most $Q$ and weights are bounded at fixed depths.
    The number of bins is therefore bounded in terms of $xi$,
    and the dyadic width choices contribute only $O \( \( 1 + ell \)^2 \)$.
    Finally, subdividing can only decrease each cap count. ◻
]

For an endpoint observation in a localizer, choose a winning class by the largest absolute pairing with its class
  superposition. Here and later it is enough to keep endpoint masses satisfying

#[#set math.equation(numbering: n => "(9.28)")
 $ m_O gt.eq epsilon.alt^(A_0) parallel f parallel_2^2 $ <eq:packet-output-floor>]

for a sufficiently large fixed $A_0$. To see this without any assumption on the law,
  normalize $parallel f parallel_2 = 1$. The number of endpoint sites is at most $C epsilon.alt^(- Q)$,
  and $w$ is bounded by a fixed constant $W$. A law on masses smaller than the displayed threshold has score at
  most $3 / 2 Q + 1 / 2 W - 3 / 2 A_0 + O \( 1 \/ ell \)$, whereas $K_0 gt.eq 0$. Choose $A_0 > Q + W + 2$.
  Splitting any law into this part and its complement changes its averaged score by at most $3 log
  2 \/ \( 2 ell \)$. The low-mass part consequently cannot increase a nonnegative upper growth bound.

Choose the tail order with $A > A_0 \/ 2 + 1$. Write $q = C_A epsilon.alt^(A - A_0 \/ 2)$,
  and reduce $epsilon.alt_0$ so $q < 1 \/ 2$. If there are at most $S$ possible winning parts,
  the triangle inequality gives the finite bound

#[#set math.equation(numbering: n => "(9.29)")
 $ m_O \( f \) lt.eq \( 1 - q \)^(- 2) S^2 m_O \( h_J^(upright("win")) \) lt.eq
   4 S^2 m_O \( h_J^(upright("win")) \) . $ <eq:packet-winner-mass>]

Its loss in the mass term of the score is at most $3 log_(1 \/ epsilon.alt) #h(-0.16667em) () S +
  3 log_(1 \/ epsilon.alt) #h(-0.16667em) (\( 1 - q \)^(- 1))$.
  Thus no power-sized tail is discarded without comparison to an output mass floor.
  The label $J$ below consists of $J_0$, the mass and cap bins, and any extra subdivision and winning tags.
  The geometric part is determined by both endpoint data and aperture;
  the additional tag entropy is bounded by $log_(1 \/ epsilon.alt) #h(-0.16667em) () S$.

=== 9.5 The local root and the earlier test <the-local-root-and-the-earlier-test>

#thm([Proposition 9.5.])[
  (Local root comparison).  #emph[Fix a winning retained class as above, and use translated coordinates (9.13).
    Let $K_0^(upright("loc"))$ be the canonical root supremum of its input, including the norm option. Set
#[#set math.equation(numbering: n => "(9.30)")
 $ A_J = log_(1 \/ epsilon.alt) #h(-0.16667em) () N + 3 / 2 log_(1 \/ epsilon.alt) #h(-0.16667em) () m + 1 /
   2 g . $ <eq:packet-local-root-value>]

 Then, with the error convention (9.24),
#[#set math.equation(numbering: n => "(9.31)")
 $ K_0^(upright("loc")) lt.eq A_J + e_(upright("pkt")) . $ <eq:packet-local-root-upper>]

 For any chosen marginal law on the tagged localizers there is an earlier test,
   using the original input at time $r$, with score
#[#set math.equation(numbering: n => "(9.32)")
 $ P_r^(upright("all")) gt.eq sans(H) \( J \) + b_(*) + bb(E) [log_(1 \/ epsilon.alt) #h(-0.16667em)
   (N_(upright("all"))) + 3 / 2 log_(1 \/ epsilon.alt) #h(-0.16667em) () m + 1 / 2 g] -
   e_(upright("pkt")) . $ <eq:packet-earlier-whole-score>]

 At $r = 0$, the right hand side is a lower bound for $K_0$ up to the displayed error.
   The earlier test uses the uniform law on each #emph[whole] class before the final retained subdivision.]
] <prop:local-root-comparison>

#proof[
  The local root natural spacings are both $s = epsilon.alt^(u_r - b_(*))$.
    Let $M_(upright("tot"))$ be the sum of all canonical root masses of the retained superposition,
    and let $M_F$ be their sum in a root cap $F$. By analysis and synthesis Bessel and the mass bin,
  #[#set math.equation(numbering: n => "(9.33)")
   $ M_(upright("tot")) lt.eq C epsilon.alt^(- xi) N m . $ <eq:packet-root-total-mass>]
  Take $R = epsilon.alt^(- eta)$ in (9.11). Its near set is covered by at most $C
    epsilon.alt^(- 4 eta)$ root caps of the same widths. Lemma 38 therefore bounds its coefficient square sum by
    $C m epsilon.alt^(w \( F \) - g - xi - 4 eta - e_(upright("pkt")))$.
    The far term is at most $C_M epsilon.alt^(eta \( 2 M - 4 \)) epsilon.alt^(- xi) N m$.
    Both $N$ and the possible differences $w \( F \) - g$ have bounded exponents.
    Choosing $M$ sufficiently large, with those bounds fixed, absorbs the far term in the same estimate,
    with an additional fixed constant. Consequently
  #[#set math.equation(numbering: n => "(9.34)")
   $ log_(1 \/ epsilon.alt) #h(-0.16667em) (M_F) lt.eq log_(1 \/ epsilon.alt) #h(-0.16667em) () m + g -
     w \( F \) + e_(upright("pkt")) . $ <eq:packet-root-cap-mass>]
  All canonical tests up to the logarithmic position cutoff are covered by the uniform Bessel argument;
    no regularity constant grows with this cutoff.
  For an arbitrary root test law, the log-sum inequality gives
  $ sans(H) \( O \) + bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O) lt.eq
    log_(1 \/ epsilon.alt) #h(-0.16667em) (M_(upright("tot"))) \, wide sans(H) \( O divides D \) +
    bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O) lt.eq bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (M_D) . $
  The second inequality is applied separately on each aperture label;
    its observation support lies in that label’s cap. Adding the first inequality and half the second,
    then adding $1 / 2 bb(E) w \( D \)$, gives (9.31). The norm option is bounded by $3 /
    2 \( log_(1 \/ epsilon.alt) #h(-0.16667em) () N + log_(1 \/ epsilon.alt) #h(-0.16667em) () m \) +
    e_(upright("pkt"))$. Zero-width caps cover the bounded local atom population in a fixed number of pieces,
    so (9.26) implies $log_(1 \/ epsilon.alt) #h(-0.16667em) () N lt.eq g + e_(upright("pkt"))$.
    This proves the same bound for the norm option.
  For the earlier test choose the prescribed marginal on $J$, then choose $T$ uniformly in its whole class.
    Take its earlier site $O_r = \( C_r \, V_T \, X_T \)$, and let $D_r$ record $J$ and the assigned cap
    $E \( T \)$. Within $J$, the map from atom indices to earlier sites has bounded multiplicity.
    Conversely, an earlier site lies in only boundedly many geometric localizers,
    because its center lies in a fixed enlargement of the cell in (9.12).
    Extra tags cost at most $log_(1 \/ epsilon.alt) #h(-0.16667em) () S$. It follows that
  $ sans(H) \( O_r \) gt.eq sans(H) \( J \) + bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (N_(upright("all"))) -
    e_(upright("pkt")) \, wide sans(H) \( O_r divides D_r \) gt.eq bb(E) \[ g - w \( E \) \] - e_(upright("pkt")) . $
  The second inequality uses the full assigned fibers in (9.27),
    with their actual probabilities under the uniform class law.
    If one earlier site appears with several coefficient tests, use the largest squared pairing there;
    this is still an admissible test. Thus its logarithmic mass is at least the corresponding
    $log_(1 \/ epsilon.alt) #h(-0.16667em) () m - e_(upright("pkt"))$.
    At $r = 0$, (9.17) gives the same conclusion with the canonical mass.
    Finally, the earlier aperture weight is $2 b_(*) + w \( E \)$, by the rescaling computation.
    Substitution in the score proves (9.32). ◻
]

=== 9.6 The preliminary growth bound <the-preliminary-growth-bound>

#thm([Proposition 9.6.])[
  (A finite upper bound for packet growth).  #emph[The supremum $beta_(upright(q))$ is finite and
    $beta_(upright(q)) lt.eq 1$. This conclusion uses no identification of the original coherent mass with a
    positive particle law.]
] <prop:packet-trivial-growth>

#proof[
  Split into fixed aperture-width bins, at a cost tending to zero.
    Apply Lemma 37 with $r = b_(*) = 0$, then the class and winner construction.
    Restrict to the mass floor as justified above. Work within one tagged localizer and its retained class.
    By (9.29), the original conditional score is at most the score of the winning superposition plus
    $e_(upright("pkt"))$. For the remainder of this conditional calculation,
    $m_O$ denotes the winning-superposition masses. They satisfy the inherited floor
  $ m_O gt.eq \( 1 - q \)^2 S^(- 2) epsilon.alt^(A_0) parallel f parallel_2^2 . $
  The factor $3 log_(1 \/ epsilon.alt) #h(-0.16667em) (\( 1 - q \)^(- 1))$ is included in $e_(upright("pkt"))$ by
    reducing $epsilon.alt_0$; for subpower tag counts the displayed floor still has a fixed polynomial exponent.
    Let $Z = \( C_t \, P \)$, where $P$ records both velocity and back-transported position $X + \( C_0 - C_t \)
    V$ isotropically at depth $a$. Set $m_Z = sum_(O : O mapsto Z) m_O$. The log-sum inequality on each fiber shows
  #[#set math.equation(numbering: n => "(9.35)")
   $ sans(H) \( O \) + 1 / 2 sans(H) \( O divides D \) + 3 /
     2 bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O) lt.eq sans(H) \( Z \) + 1 / 2 sans(H) \( Z divides D \) +
     3 / 2 bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_Z) . $ <eq:packet-coarsen-mass>]
  For clarity, the unconditional log-sum inequality bounds $sans(H) \( O divides Z \) +
    bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O \/ m_Z)$ by zero; the same conditional on $\( Z \, D \)$,
    using a sum over a subset of the fiber, bounds its conditional counterpart by zero.
    Their sum with coefficients one and one half is precisely the displayed inequality.
  Let $cal(T)_Z$ consist of all class atoms compatible with $P$ up to the enlargement in (9.18).
    The earlier position uncertainty and the endpoint velocity uncertainty change these coarse columns by at most
    $C epsilon.alt^(- eta) epsilon.alt^a$, since $a lt.eq u_t lt.eq u_0$.
    Discarding interactions outside $cal(T)_Z$ is permitted by the quantitative tail lemma.
    After fixing the coefficient cutoff $B$, increase only the transport integration order so its error exponent
    $A_(upright("tr"))$ also permits summation over this fiber and comparison to that coefficient floor.
    This does not require another coefficient truncation. Bessel at the fixed time $C_t$ then gives
  #[#set math.equation(numbering: n => "(9.36)")
   $ m_Z lt.eq C epsilon.alt^(- xi) m thin \# cal(T)_Z $ <eq:packet-contributor-mass>]
  after absorbing those tails. More explicitly, before absorption the right hand side has an added term
    $C_(A_(upright("tr"))) epsilon.alt^(2 A_(upright("tr")) - Q) parallel f parallel_2^2$;
    choosing $2 A_(upright("tr")) - Q > B + 1$, and then reducing $epsilon.alt_0$,
    absorbs it whenever $cal(T)_Z eq.not diameter$. The output floor excludes a nonempty retained fiber with no
    potential contributor. The constant in (9.36) also absorbs the fixed factor from squaring the sum of a main
    term and its error.
  Only now introduce a positive auxiliary law: keep the given law of $\( Z \, D \)$,
    and choose $T$ uniformly in $cal(T)_Z$, independently of $D$ conditional on $Z$. Exactly,
  $ sans(H) \( T divides Z \, D \) = sans(H) \( T divides Z \) =
    bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (\# cal(T)_Z) . $
  The chain rule gives the contributor calculation
  #[#set math.equation(numbering: n => "(9.37)")
   $ & sans(H) \( Z \) + 1 / 2 sans(H) \( Z divides D \) + 3 / 2 sans(H) \( T divides Z \)\
 & = sans(H) \( T \) + 1 / 2 sans(H) \( T divides D \) + sans(H) \( Z divides T \) + 1 /
   2 sans(H) \( Z divides T \, D \)\
 & lt.eq sans(H) \( T \) + 1 / 2 sans(H) \( T divides D \) + sans(H) \( C_t divides T \) + 3 /
   2 sans(H) \( Z divides T \, C_t \) . $ <eq:packet-contributor-identity>]
  Here $C_t$ is determined by both $Z$ and $D$. Thus $sans(H) \( Z divides T \) = sans(H) \( C_t divides T \) +
    sans(H) \( Z divides T \, C_t \)$, and $sans(H) \( Z divides T \, D \) lt.eq
    sans(H) \( Z divides T \, C_t \)$. This keeps exactly one conditional time entropy.
    The remaining term measures the uncertainty in the coarse observation after the contributor and time are known.
  In the present root-referred observation, $\( T \, C_t \)$ locates $Z$ to at most $C
    epsilon.alt^(- C eta)$ possibilities. Hence $sans(H) \( Z divides T \, C_t \) lt.eq C eta + O \( 1 \/ ell \)$.
    Combining (9.37) with (9.36) yields
  #[#set math.equation(numbering: n => "(9.38)")
   $ sans(H) \( Z \) + 1 / 2 sans(H) \( Z divides D \) + 3 /
     2 bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_Z) lt.eq sans(H) \( T \) + 3 /
     2 log_(1 \/ epsilon.alt) #h(-0.16667em) () m + 1 / 2 sans(H) \( T divides D \) +
     sans(H) \( C_t divides T \) + e_(upright("pkt")) . $ <eq:packet-trivial-identity>]
  For a fixed aperture label $D$, its potential contributors lie in a $epsilon.alt^(- C eta)$ enlargement of the
    root aperture of widths $\( b \, a \)$ obtained by referring its rectangles back to $C_0$.
    The velocity error is at most $C rho_t$; the position error is at most $C epsilon.alt^(- eta) sigma_0 +
    C rho_t$. Both are bounded by the corresponding enlarged coarse widths, because $a lt.eq u_t$.
    Covering this enlargement and applying (9.26) gives
  $ sans(H) \( T divides D \) lt.eq g - bb(E) w \( D \) + e_(upright("pkt")) \, wide sans(H) \( T \) lt.eq
    log_(1 \/ epsilon.alt) #h(-0.16667em) () N \, wide sans(H) \( C_t divides T \) lt.eq t + O \( 1 \/ ell \) . $
  Adding the half-weight to (9.38) therefore bounds the conditional endpoint score by $A_J + t +
    e_(upright("pkt"))$. Restoring $J$ adds $sans(H) \( J \)$, with the recorded tag error; here $b_(*) = 0$.
    Proposition 39 at $r = 0$ gives
  $ P_t lt.eq sans(H) \( J \) + bb(E) A_J + t + e_(upright("pkt")) lt.eq K_0 + t + 2 e_(upright("pkt")) \, $
  because $N lt.eq N_(upright("all"))$. First take $epsilon.alt arrow.r 0$ at fixed depths, $eta \,
    xi$ and integration orders, then send $eta \, xi arrow.r 0$. This proves $beta_(upright(q)) lt.eq 1$. ◻
]

== 10 Finite packet composition and the uncertainty boundary <sec:packet-composition>

The packet decomposition gives two different comparisons at an earlier time:
  an upper bound for the root score of a retained superposition,
  and a lower bound obtained by testing the original input on the whole cap class.
  Keeping these comparisons separate is essential. We first give a finite version of their composition,
  including the loss when the class is subsequently restricted.

=== 10.1 An error budget and a finite composition inequality <an-error-budget-and-a-finite-composition-inequality>

Write $ell = log \( 1 \/ epsilon.alt \)$; all entropies and all logarithms denoted by $log_(1 \/ epsilon.alt)
  #h(-0.16667em) (dot.op)$ in this section are divided by $ell$.
  A fixed collection of bounds $cal(B)$ will specify bounded ranges for $H_(upright(P)) \, L \, t \, r$,
  bounded spatial and velocity domains, the phase and amplitude bounds,
  and a positive lower bound for each time gap to which a growth estimate is applied.
  In particular, $cal(B)$ is fixed before $epsilon.alt$ tends to zero. Its size may change in a later outer sequence.

For an array of conditional systems these bounds, all grid and observation-count bounds,
  and every vanishing-error envelope are common deterministic bounds for the whole array.
  This condition is preserved here: the translated phase bounds are uniform over the localizers,
  the velocity supports are cut into a fixed bounded domain, and a single truncation order, coefficient threshold,
  depth mesh, and tag-count bound are used for every retained $J$.
  Thus every selection of one conditional system at each precision is an admissible sequence with the same bounds.
  Individual extendibility to unspecified vanishing-error envelopes would not suffice.

There is a useful precise way of using the definition of $beta_(upright(q))$. For systems obeying $cal(B)$, let

#[#set math.equation(numbering: n => "(10.1)")
 $ omega_(cal(B)) \( epsilon.alt \) = sup #scale(x: 120%, y: 120%)[\(] P_d - K_0 -
   beta_(upright(q)) d #scale(x: 120%, y: 120%)[\)]_(+) \, $ <eq:packet-universal-modulus>]

where the supremum also includes the bounded translated systems in Lemma 37,
  and $d$ ranges over the prescribed compact subset of $\( 0 \, oo \)$.
  Enlarging the fixed bounds slightly to accommodate rounded grids is understood.
  Then $omega_(cal(B)) \( epsilon.alt \) arrow.r 0$. Indeed,
  a failure would select a sequence of admissible systems with a fixed positive excess;
  a subsequence of their depth parameters converges, contradicting the definition of $beta_(upright(q))$.
  This is a modulus for a fixed class, not a modulus uniform over growing values of $cal(B)$.
  At duration zero the corresponding estimate is the definition of $K_0$, with zero error.

Here is one error budget that will be used below. Choose a depth mesh $xi > 0$,
  a packet enlargement exponent $eta > 0$, and let $S_epsilon.alt gt.eq
  2$ bound the number of auxiliary choices at a localizer: shape bins, mass bins, cap-class tags, winning tags,
  and any prescribed further subdivisions. The geometric localizer itself is #emph[not] one of these choices;
  its entropy will be kept. On the output tests under consideration assume

#[#set math.equation(numbering: n => "(10.2)")
 $ m_O gt.eq epsilon.alt^(A_0) ∥f∥_2^2 . $ <eq:composition-mass-floor>]

Take the order of the packet truncation large enough that its amplitude error is at most $C_A
  epsilon.alt^A ∥f∥_2$, with $A > A_0 \/ 2$, and put

$ q_epsilon.alt = C_A epsilon.alt^(A - A_0 \/ 2) < 1 / 2 . $

For a sufficiently large fixed $C_(cal(B))$, we may use

#[#set math.equation(numbering: n => "(10.3)")
 $ cal(R) = C_(cal(B)) \( eta + xi + log_(1 \/ epsilon.alt) #h(-0.16667em) (S_epsilon.alt) \) +
   C_(cal(B) \, eta \, xi \, A) frac(1 + log \( 2 + ell \), ell) +
   3 log_(1 \/ epsilon.alt) #h(-0.16667em) (frac(1, 1 - q_epsilon.alt)) +
   omega_(cal(B)) \( epsilon.alt \) . $ <eq:composition-error-budget>]

Each occurrence below of a fixed enlargement of $cal(B)$ is included in this choice.
  One may instead use the sum of the separate error bounds in Lemmas 37 and 38 and Proposition 39;
  only their upper bound by $cal(R)$ is needed.

With $S = S_epsilon.alt$ and $q = q_epsilon.alt$, the winner estimate (9.29) gives the two contributions $3
  log_(1 \/ epsilon.alt) #h(-0.16667em) (S_epsilon.alt)$ and $3 log_(1 \/ epsilon.alt) #h(-0.16667em)
  (1 \/ \( 1 - q_epsilon.alt \))$ to the loss in the score’s mass term.
  Its argument uses only $q_epsilon.alt < 1 \/ 2$, so the present choice $A > A_0 \/ 2$ suffices.
  The other terms in (10.3) cover the tag entropies, cap enlargement and binning, bounded grid ambiguities,
  and the logarithmically growing root cutoff.

The floor also preserves saturation. After normalizing $∥f∥_2 = 1$, the calculation at (9.28),
  with the fixed weight bound from $cal(B)$, lets us choose $A_0$ so that every low-mass law has score below $-
  1$, whereas $K_0 gt.eq 0$. The two-part split costs at most $3 log 2 \/ \( 2 ell \)$.
  For $beta_(upright(q)) > 0$, the low-mass probability therefore tends to zero on a saturating sequence,
  and the complementary conditional law still saturates.

#thm([Proposition 10.1.])[
  (Finite packet composition).  #emph[Fix $0 lt.eq r < t$, a shape $0 lt.eq b lt.eq a lt.eq
    min \( L - t \, u_t \)$, and $0 lt.eq b_(*) lt.eq b$. Choose $0 < eta < \( u_r - b_(*) \) \/ 4$,
    and make the decomposition and cap-class construction of Section 9, with the mass floor (10.2).
    Within the localizer $J$, including its auxiliary tags, let $N_(upright("all")) \( J \)$ be the size of the
    whole cap class, $N \( J \) > 0$ its retained size, $m \( J \)$ its coefficient mass bin,
    and $g \( J \)$ its cap maximum bin. Set
#[#set math.equation(numbering: n => "(10.4)")
 $ A_J & = log_(1 \/ epsilon.alt) #h(-0.16667em) (N \( J \)) + 3 /
   2 log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( J \)) + 1 / 2 g \( J \) \,\
K_r^(*) & = sans(H) \( J \) + b_(*) + bb(E) [log_(1 \/ epsilon.alt) #h(-0.16667em) (N_(upright("all")) \( J \)) +
  3 / 2 log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( J \)) + 1 / 2 g \( J \)] . $ <eq:composition-A>]

 Let $K_J$ denote the canonical local root score, including its norm option, for the retained local superposition.
   Let $P_J$ be its score at duration $t - r$, with the conditional output law and the winning superposition
   masses. All expectations here use the current marginal of $J$ after the indicated preliminary split.]
  #emph[With $cal(R)$ as in (10.3), enlarged by a fixed constant if necessary,
    the following four quantities are nonnegative:
#[#set math.equation(numbering: n => "(10.5)")
 $ d_0 & = K_0 + beta_(upright(q)) r - K_r^(*) + 2 cal(R) \,\
d_1 \( J \) & = log_(1 \/ epsilon.alt) #h(-0.16667em) (N_(upright("all")) \( J \) \/ N \( J \)) \,\
d_2 \( J \) & = A_J - K_J + cal(R) \,\
d_3 \( J \) & = K_J + beta_(upright(q)) \( t - r \) - P_J + cal(R) . $ <eq:four-packet-deficits>]

 Up to the displayed error allowances, these are the deficits in growth before the cut, class retention,
   the local root comparison, and growth after the cut. The next inequality shows that saturation at the endpoint
   forces these four comparisons to be nearly sharp on average;
   the subsequent selection estimate specifies the branches on which this remains true.
   Writing $Delta_t = K_0 + beta_(upright(q)) t - P_t$, one has the finite bound
#[#set math.equation(numbering: n => "(10.6)")
 $ d_0 + bb(E) \( d_1 + d_2 + d_3 \) lt.eq Delta_t + 5 cal(R) . $ <eq:finite-packet-deficits>]

 There is also an earlier test on the #emph[retained uniform classes],
   with that same current marginal of $J$ and the assigned cap labels, whose score satisfies
#[#set math.equation(numbering: n => "(10.7)")
 $ P_r^(upright("ret")) gt.eq K_r^(*) - 3 / 2 bb(E) d_1 - cal(R) . $ <eq:retained-back-score>]

 At $r = 0$ this is an actual test for the original canonical $K_0$; the norm option is not used in this lower bound.]
  #emph[More quantitatively, put $R_t = Delta_t + 5 cal(R)$.
    For an event $B$ measurable in $J$ with probability $p > 0$ and any $theta > 0$,
#[#set math.equation(numbering: n => "(10.8)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] B ∩ { d_1 + d_2 + d_3 > theta } #scale(x: 120%, y: 120%)[\)] lt.eq
   R_t \/ theta . $ <eq:packet-typical-selection>]

 In particular, taking $theta = 2 R_t \/ p$ leaves at least $p \/ 2$ of the current probability in $B$,
   and bounds each of the three local deficits by $2 R_t \/ p$. If $R_t = 0$, all three vanish almost surely.]
] <prop:finite-packet-composition>

#proof[
  The localizer consists geometrically of $C_r$, velocity at depth $b_(*)$,
    and position transported to $C_r$ at depth $r + b_(*)$. It is determined by both the endpoint observation and
    its aperture, up to the grid ambiguities already charged in $cal(R)$.
    The phase and input rescaling in (9.13)–(9.15) give local Planck depth $H_(upright(P)) - r -
    2 b_(*)$ and horizon $L - r - b_(*)$. The returning aperture weight gains $2 b_(*)$.
    Entropy chain rules and the winning-class estimate consequently give
  #[#set math.equation(numbering: n => "(10.9)")
   $ P_t lt.eq sans(H) \( J \) + b_(*) + bb(E) P_J + cal(R) . $ <eq:finite-packet-split>]
  Here the potentially large entropy $sans(H) \( J \)$ has not been discarded.
    Only the extra ambiguity and choice tags have been charged to $cal(R)$.
  Proposition 39 gives $K_J lt.eq A_J + cal(R)$. Its whole-class earlier test gives $P_r^(upright("all")) gt.eq
    K_r^(*) - cal(R)$. The universal estimates
  $ P_r^(upright("all")) lt.eq K_0 + beta_(upright(q)) r + cal(R) \, wide P_J lt.eq K_J +
    beta_(upright(q)) \( t - r \) + cal(R) $
  hold uniformly in $J$ by (10.1). For $r = 0$ the first is instead the exact inequality $P_0^(upright("all"))
    lt.eq K_0$. These facts prove nonnegativity in (10.5). Moreover, direct cancellation yields
  $ d_0 + bb(E) \( d_1 + d_2 + d_3 \) = K_0 + beta_(upright(q)) t - sans(H) \( J \) - b_(*) - bb(E) P_J + 4 cal(R) . $
  Using (10.9) proves (10.6). Markov’s inequality gives (10.8).
  For clarity, the retained-class assertion has a finite proof that does not assume that every assigned fiber
    retains a fixed proportion. Fix $J$. Write $n_e$ and $r_e$ for the full and retained sizes of the fiber
    assigned to cap $e$, and $P_E \, Q_E$ for the assigned-cap laws under the uniform full and retained
    populations. Terms with $r_e = 0$ are omitted. The exact identity
  #[#set math.equation(numbering: n => "(10.10)")
   $ bb(E)_(Q_E) log_(1 \/ epsilon.alt) #h(-0.16667em) (n_E / r_E) =
     log_(1 \/ epsilon.alt) #h(-0.16667em) (N_(upright("all")) / N) -
     frac("KL" \( Q_E bar.v.double P_E \), ell) lt.eq d_1 \( J \) $ <eq:retained-fiber-relative-entropy>]
  and the assigned-fiber estimate $log_(1 \/ epsilon.alt) #h(-0.16667em) (n_e) + w \( e \) gt.eq g - cal(R)$ show that
  $ sans(H)_(upright("ret")) \( T divides E \) + bb(E)_(upright("ret")) w \( E \) gt.eq g - d_1 \( J \) - cal(R) . $
  The ordinary earlier entropy is $log_(1 \/ epsilon.alt) #h(-0.16667em) () N$,
    and the coefficient mass exponent is $log_(1 \/ epsilon.alt) #h(-0.16667em) () m$ up to the bin error.
    Returning to the original coordinates and allowing the bounded multiplicities gives (10.7);
    increasing the fixed constant in $cal(R)$ absorbs its several geometric uses.
    The coefficient tests at $r = 0$ are bounded by the canonical root tests, so the last assertion follows as well. ◻
]

=== 10.2 What saturation permits one to select <what-saturation-permits-one-to-select>

#prodef([Definition 10.2.])[
  (Successive saturation arrays).  After normalizing duration to one,
    a saturation array consists of rows indexed by $j$, with small parameters $epsilon.alt_(j \, n) arrow.b
    0$ within each row. Row $j$ obeys one fixed collection of analytic, domain, and depth bounds $cal(B)_j$, and,
    for numbers $Delta_j arrow.b 0$,
  $ limsup_(n arrow.r oo) #scale(x: 120%, y: 120%)[\(] K_(0 \, j \, n) + beta_(upright(q)) -
    P_(1 \, j \, n) #scale(x: 120%, y: 120%)[\)] lt.eq Delta_j . $
  The corresponding lower limit is nonnegative by the universal bound for that row.
    Bounds $cal(B)_j$ may grow with $j$; the outer array is not asserted to be one admissible small-parameter
    sequence. All uses of a universal modulus are made in a fixed row, before the outer limit.
    For a finite construction, its mesh and truncation parameters are chosen within row $j$ before the inner
    precision; their limiting error budget can be prescribed as $eta_j arrow.b 0$.
    Such arrays exist by the definition of $beta_(upright(q))$:
    choose a family with limiting rate within $1 \/ j$ of the supremum, pass to a subsequence realizing that rate,
    and normalize its duration.
] <def:packet-saturation-array>

In the remainder of the packet argument, saturation and its successive limits have this meaning.
  The class of arrays includes the arrays obtained by the finite selections and fixed positive duration
  normalizations below. Here is the relevant closure justification.
  At a fixed cut, the four nonnegative composition deficits have total mean at most $Delta_j +
  o_n \( 1 \)$ plus the chosen finite error budget. On any event of mass at least a fixed $p_0 > 0$,
  their conditional mean is bounded by this quantity divided by $p_0$.
  Markov selection therefore gives conditional local families whose outer deficits tend to zero.
  They obey fixed enlarged bounds $cal(B)'_j$ within each row, independently of which localizer is selected.
  The earlier test retains its full selected localizer marginal and has the same conclusion by the retained-score
  inequality.

For each row, make only finitely many cuts with fixed positive gaps.
  Depth and score units have been divided by the initial duration.
  Then choose the depth meshes, packet enlargement exponents,
  and the permitted exponent of the additional tag count as small as required.
  Choose the truncation order after the mass floor and these parameters;
  finally choose $epsilon.alt$ small enough for (10.3) and all of the finitely many universal moduli to have the
  required size. Equivalently one may take the inner $epsilon.alt arrow.r 0$ limits first,
  then send the mesh and enlargement parameters to zero, and only afterwards take the outer extremizing sequence.
  No estimate here requires uniformity as $H_(upright(P))$, the aspect, or the phase bounds grow in that outer sequence.

If $Delta_t arrow.r 0$ in this order, all four nonnegative deficits vanish in the sense of (10.6).
  In particular $K_J = A_J + o \( 1 \)$ and $P_J = K_J + beta_(upright(q)) \( t - r \) +
  o \( 1 \)$ on selected typical conditional systems. The retained earlier law has deficit tending to zero by
  (10.7). To be explicit, its deficit is at most

$ d_0 + 3 / 2 bb(E) d_1 + cal(R) lt.eq 3 / 2 R_t + cal(R) . $

For this earlier test one keeps the whole marginal on $J$.
  Selecting a single value of $J$ is appropriate when testing a local growth bound,
  and does not replace that marginal in the earlier test.

Further splitting has an equally finite justification. If a label $B$ takes at most $S$ values,
  the score of a law and the average scores of its conditional laws differ by at most $3 / 2 sans(H) \( B \) lt.eq
  3 log_(1 \/ epsilon.alt) #h(-0.16667em) () S \/ 2$; this follows directly from the two entropy terms in the
  packet score. The input and its canonical root score are the same in these comparisons.
  Add the uniform growth error to make the conditional deficits nonnegative, and use Markov’s inequality.
  Thus a split made #emph[before] composition preserves saturation on typical branches,
  also within any event whose probability is bounded below.
  For an event of probability $p$ tending to zero, the required condition is explicitly that the available deficit
  and error be $o \( p \)$; subpower probability by itself is not this condition.
  More generally, if a sum of nonnegative shifted deficits has mean $D$,
  its mean on a current event of probability $p$ is at most $D \/ p$;
  outside a set of relative probability at most $q$ there, the sum is at most $D \/ \( p q \)$ pointwise.
  Polynomially many geometric localizers are handled by retaining their entropy,
  rather than by declaring the cost of fixing one negligible.
  The conditional local estimate, on the other hand, is pointwise and uniform in the inner limit,
  so a violating local system can always be selected without a probability loss argument.

One can also specify the probability of a chosen tag. If a union of tag branches has probability $p$,
  discard tags of probability below $p \/ \( 4 S \)$, losing at most $p \/ 4$.
  If their total nonnegative shifted deficit is at most $R$,
  discard branches with conditional deficit greater than $4 R \/ p$, losing at most another $p \/ 4$.
  Some remaining tag has probability at least $p \/ \( 4 S \)$ and conditional deficit at most $4 R \/ p$.
  Its logarithmic retention cost is at most $log_(1 \/ epsilon.alt) #h(-0.16667em) (4 S \/ p)$.
  For fixed $p > 0$ and $log_(1 \/ epsilon.alt) #h(-0.16667em) () S arrow.r 0$,
  this is a subpower retention with a quantified deficit. Apply composition anew on that tag,
  keeping its marginal on $J$ for the earlier test. Repeating this argument a fixed number of times gives,
  for any prescribed accuracy $theta.alt > 0$, a branch on which the endpoint deficit,
  the mean retained-count loss, the local root comparison deficit, the earlier retained-law deficit,
  and the upper error in each specified admissible score-replacement comparison are all at most $theta.alt$.
  For the last assertion, the universal bound for a competing endpoint test gives $P_t^(upright("new")) -
  P_t lt.eq Delta_t + omega_(cal(B))$. Here $p$ is the probability of the relevant event in the current normalized
  law. The displayed simultaneous selection divides the mean deficit by $p$,
  not by the probability of the individual tag; it requires no estimate of the form $R = o \( 1 \/ S \)$.
  For a subsequent event, apply the same rule to its probability in the then current law and choose the incoming
  errors accordingly. Thus a finite subsequent argument may use $theta.alt$ to denote the maximum of these
  selected errors; it need not identify it with the original unsplit deficit.

These rules also apply to any fixed finite list of observations and cuts,
  using the sum of their errors and a union bound. They concern score differences.
  They do not require the separate scores to have finite outer limits,
  or a uniform differentiability modulus for any limiting entropy profile.

=== 10.3 Faithful classical tests away from the boundary <faithful-classical-tests-away-from-the-boundary>

#thm([Lemma 10.3.])[
  (Exclusion of a fixed uncertainty slack).  #emph[Assume Theorem 15 and $beta_(upright(q)) > gamma \/ 2$.
    A saturating packet law at any fixed positive duration has
#[#set math.equation(numbering: n => "(10.11)")
 $ a = u_t + o \( 1 \) $ <eq:active-packet-boundary>]

 on its typical fixed-shape branches. More precisely, if $r = t - 2 h > 0$ and $a + 2 h lt.eq u_r - 2 eta$,
   the construction above with $b_(*) = b$ gives
#[#set math.equation(numbering: n => "(10.12)")
 $ P_t lt.eq K_0 + beta_(upright(q)) r + gamma h + C cal(R) + 1 /
   2 omega_(cal(B))^(upright("cl")) \( epsilon.alt \) . $ <eq:off-boundary-finite-growth>]

 Here $omega_(cal(B))^(upright("cl")) arrow.r 0$ is the fixed-class error in the classical growth theorem,
   and the constant is fixed for this cut.]
] <lem:packet-boundary-slack>

#proof[
  Work within $J$ and use the earlier retained grid centers to define exact lines with velocities $V_T$ and
    positions $X_T$ at $C_r$. Coarsen the output to the isotropic observation $Z$ of velocity depths $a \, a$,
    position depths $a + t \, a + t$, and time label $C_t$. Let $cal(T)_z$ consist of retained atoms compatible,
    under (9.18), with at least one output in the $z$-fiber.
  The earlier position tolerance is $C epsilon.alt^(- eta) epsilon.alt^(r + u_r)$.
    Since $r = t - 2 h$, the hypotheses give
  $ epsilon.alt^(r + u_r - eta) lt.eq epsilon.alt^(a + t + eta) \, wide rho_t = epsilon.alt^(u_t) lt.eq
    epsilon.alt^a . $
  Thus a fixed contributor and time locate $Z$ up to the ambiguities charged in $cal(R)$.
    They also give the compatibility needed for positive transport after sampling.
    For every $T in cal(T)_z$ and every $D$ occurring over $Z = z$,
    choose an output $O_D$ paired with $D$ and an output $O_T$ compatible with $T$ in that fiber.
    They are in the same isotropic $z$-cell. The displayed tolerances therefore put the exact line and $O_D$
    within $C epsilon.alt^a$ in velocity and $C epsilon.alt^(a + t)$ in position at $C_t$.
    These isotropic widths fit both axes of the rectangles of $D$.
    Use a fixed enlargement of those rectangles as the aperture represented by the same label $D$,
    at the same depths. The enlarged aperture is faithful for every such pair, as permitted by Definition 14.
  First sum the winning coherent masses over each $Z$. Bessel and the separately chosen transport-tail order give
  $ m_Z lt.eq epsilon.alt^(- C cal(R)) m thin \# cal(T)_Z \, $
  with the tails absorbed by the coefficient and output floors as in the proof of Proposition 40.
    Only after this bound, keep the given law of $\( Z \, D \)$ and choose $T$ uniformly in $cal(T)_Z$,
    independently of $D$ given $Z$. The reverse determination above gives $sans(H) \( Z divides T \, C_t \) lt.eq
    C cal(R)$ under this law. Equations (9.35) and (9.37), with the displayed mass bound, now give
  $ P_J lt.eq sans(H) \( T \) + 3 / 2 log_(1 \/ epsilon.alt) #h(-0.16667em) () m + 1 /
    2 [sans(H) \( T divides D \) + w_(upright("loc")) \( D \) + 2 sans(H) \( C_t divides T \)] + C cal(R) . $
  The classical horizon is $a - b + 2 h$. Its root cap menu fits the local packet menu:
    $a + 2 h lt.eq u_r$ and $a + t lt.eq L$ are precisely the required upper bounds after subtracting $b$ and $r$.
    For every root test $F$, cap counting gives
  $ sans(H) \( T divides F \) + bb(E) w \( F \) lt.eq g + C cal(R) \, wide tau \( T \) lt.eq g - sans(H) \( T \) +
    C cal(R) . $
  This support bound holds for the possibly biased contributor marginal on $T$.
    Theorem 15, applied to the exact lines and the faithful enlarged aperture represented by $D$, gives
  $ sans(H) \( T divides D \) + w_(upright("loc")) \( D \) + 2 sans(H) \( C_t divides T \) lt.eq g + 2 gamma h +
    C cal(R) + omega_(cal(B))^(upright("cl")) \( epsilon.alt \) . $
  Since $sans(H) \( T \) lt.eq log_(1 \/ epsilon.alt) #h(-0.16667em) () N$, we get $P_J lt.eq A_J + gamma h +
    C cal(R) + omega_(cal(B))^(upright("cl")) \/ 2$. The whole-class earlier comparison and the finite split give
    (10.12).
  If $u_t - a$ had a fixed positive lower bound on a saturating branch,
    choose a fixed $h < t \/ 2$ smaller than half that bound, and then choose $eta$ smaller still.
    Let the finite errors tend to zero in the specified order.
    Equation (10.12) contradicts the positive gap $\( 2 beta_(upright(q)) - gamma \) h$. ◻
]

=== 10.4 The two ways to continue backwards <the-two-ways-to-continue-backwards>

For a packet system write $K_0^(gt.eq u_0 - nu)$ for the supremum of its #emph[actual root aperture scores] with
  smaller width $b gt.eq u_0 - nu$, excluding the total norm option.
  Call a duration-one saturation array in the sense of Definition 42 #emph[forced at the root] if there are fixed
  $nu \, kappa > 0$ and an outer subsequence of rows on which

#[#set math.equation(numbering: n => "(10.13)")
 $ K_0^(gt.eq u_0 - nu) lt.eq K_0 - kappa $ <eq:forced-root-gap>]

in each row’s inner limit. The quantifier ranges over all such saturation arrays,
  including arrays of normalized conditional systems. Thus the negation excludes a forced array obtained by
  selecting and rescaling local systems as well as an originally chosen one.

The constants $nu \, kappa > 0$ must be fixed across an outer subsequence of rows,
  with the asserted gap holding in each row’s inner limit (and with a smaller fixed gap if necessary).
  A window or gap tending to zero with the row index does not constitute a forced array.
  In the forced case the backward step $h$ is chosen once from these fixed constants and the fixed number of
  steps. In the absence of a forced array, a fixed cap excess at a fixed cut would produce one by the local-root
  comparison; hence the isotropic alternative applies with a step chosen once from its fixed time interval and the
  number of steps. In either case $h$ is fixed before $j arrow.r oo$, so the outer deficits are $o \( h \)$.

#thm([Proposition 10.4.])[
  (Boundary alternatives and finite chains).  #emph[Assume $beta_(upright(q)) > gamma \/ 2$.
    For every fixed integer $q gt.eq 1$ and every fixed $M > 0$,
    a saturation array approaching $beta_(upright(q))$ admits $q$ successive backward cuts at times
$ t_j = t_0 - 2 j h > 0 quad \( 0 lt.eq j lt.eq q \) \, wide u_(t_j) > h \, $

 with $h > 0$ fixed in the inner limits, satisfying one of the following alternatives.]
  + #emph[A forced array exists. One can use the same such array, choose a fixed $nu > 0$ from (10.13),
    and take all the times early enough that the saturated tests satisfy
$ a_j = u_(t_j) + o \( 1 \) \, wide a_j - b_j gt.eq nu \/ 2 + o \( 1 \) \, wide a_j - b_j gt.eq M h \/ gamma +
  o \( 1 \) . $

 Every cut uses $b_(*) = b_j$ at its later endpoint.]
  + #emph[No forced saturation array exists. At all the indicated times one can use exact isotropic boundary tests
    $a_j = b_j = u_(t_j)$, and every cut uses $b_(*) = 0$.]
  #emph[These assertions remain valid when a prescribed finite number of subdivisions with vanishing tag cost are
    made at each step, before the earlier test is constructed.
    In particular the earlier law is uniform on the retained classes produced by those subdivisions.
    For any prescribed positive accuracy, all the assertions about saturation hold at sufficiently small finite
    precision with that accuracy; the required precision can depend on the outer bounds, $q \, h \, nu \, M$,
    the subdivision costs, and the selected branch.]
] <prop:boundary-alternatives>

#proof[
  Suppose first that (10.13) holds. A saturated fixed-shape branch at a positive time cannot have $b gt.eq u_0 -
    nu$ with a fixed inward margin: composition down to $r = 0$ with $b_(*) =
    b$ and (10.7) gives actual root aperture scores arbitrarily close to $K_0$,
    all with smaller widths at least $b$. This contradicts (10.13).
    Allowing the shape mesh to vanish gives $b lt.eq u_0 - nu + o \( 1 \)$. By Lemma 43, for $t lt.eq nu$ this yields
  $ a - b gt.eq u_t - u_0 + nu + o \( 1 \) = nu - t \/ 2 + o \( 1 \) gt.eq nu \/ 2 + o \( 1 \) . $
  Start with a backward subdivision of the duration-one extremizer to a time $0 < t_0 < min \( nu \, 1 \/ 4 \)$.
    Finite composition supplies a saturated earlier test there. Choose
  $ 0 < h < min (frac(t_0, 2 \( q + 1 \)) \, frac(gamma nu, 4 \( M + 1 \))) . $
  Since the original normalized Planck depth is at least one, these early times also have $u_(t_j) > h$.
    Repeated composition gives the claimed chain. Its first two comparisons are reapplied after every prescribed
    split, so the argument uses the actual retained classes.
  For the second alternative, consider a cut $0 < r < t$ from a saturated law and take $b_(*) = 0$.
    Equation (10.11) implies
  $ L gt.eq u_t + t - o \( 1 \) = u_r + r + \( t - r \) \/ 2 - o \( 1 \) . $
  Hence the local root packet menu contains the exact isotropic test of depth $v = u_r$.
    We show that, on selected saturating branches,
  #[#set math.equation(numbering: n => "(10.14)")
   $ g = 2 v + o \( 1 \) . $ <eq:isotropic-cap-maximum>]
  A single atom fits an isotropic cap at the natural root packet scale, so the cap-count bound gives $g gt.eq
    2 v - C cal(R)$. For the reverse inequality fix $zeta > 0$ and consider an excess $g gt.eq 2 v + zeta$.
    A root cap with smaller width at least $v - alpha$ contains at most $C
    epsilon.alt^(- 4 alpha - C cal(R))$ earlier sites. The pointwise canonical mass bound is
    $epsilon.alt^(- C cal(R)) m$: the cross-Gram kernel at the common root packet scale has a uniformly bounded
    absolute row sum, and every coefficient has size at most $epsilon.alt^(- xi \/ 2) sqrt(m)$.
    This estimate is uniform over the canonical test amplitude.
    The total canonical mass is at most $epsilon.alt^(- C cal(R)) N m$.
    The two log-sum inequalities for the root score consequently give
  #[#set math.equation(numbering: n => "(10.15)")
   $ K_J^(gt.eq v - alpha) lt.eq log_(1 \/ epsilon.alt) #h(-0.16667em) () N + 3 /
     2 log_(1 \/ epsilon.alt) #h(-0.16667em) () m + v + 2 alpha + C cal(R) . $ <eq:nearly-isotropic-root-bound>]
  This estimates actual aperture scores, not the norm option.
  By (10.6), typical local systems satisfy $K_J = A_J + o \( 1 \)$ and $P_J - K_J =
    beta_(upright(q)) \( t - r \) + o \( 1 \)$. If a fixed positive excess $zeta$ persisted on such selected
    systems, choose $alpha < zeta \/ 16$ and then make their composition errors small.
    Equations (10.4) and (10.15) would give
  $ K_J - K_J^(gt.eq v - alpha) gt.eq zeta \/ 4 . $
  Normalizing these systems by their fixed positive duration $t -
    r$ produces a forced duration-one saturation array, with root-width window $alpha \/ \( t - r \)$ and gap
    $zeta \/ \( 4 \( t - r \) \)$. This contradicts the hypothesis of the second alternative.
    This duration normalization divides the depth exponents by $t - r$.
    The frequency $lambda$, and hence the root cutoff $1 + log lambda$, is unchanged.
  Here is the selection detail in this argument. One first splits on a $g$-bin common across the geometric
    localizers, along with the other required tag bins, and reapplies composition using its conditional deficit
    bounds and its full marginal on $J$. Equation (10.8) permits selection within any excess event of probability
    bounded below; otherwise that excess event has probability tending to zero.
    Since $g gt.eq 2 v - C cal(R)$, one may therefore retain a saturating branch on which $\| g - 2 v \| lt.eq
    zeta + C cal(R)$, and subsequently send $zeta$ to zero. Thus no passage through expectations of unbounded
    outer values of $g$ is being used.
  On this branch the exact isotropic test at $r$, using the retained uniform classes, has score at least
  $ P_r^(upright("iso")) & gt.eq sans(H) \( J \) + bb(E) [log_(1 \/ epsilon.alt) #h(-0.16667em) () N + 3 /
    2 log_(1 \/ epsilon.alt) #h(-0.16667em) () m + v] - C cal(R)\
 & = K_r^(*) - bb(E) d_1 - 1 / 2 bb(E) \( g - 2 v \) - C cal(R) . $
  Its conditional entropy term is merely nonnegative; no assigned-fiber entropy gain is needed.
    Finite composition and (10.14) show that this score saturates at $r$.
    The same construction works for the first cut even if its later endpoint test was not isotropic.
    Make that first cut to an early $t_0 < 1 \/ 4$, choose $h < t_0 \/ \( 2 \( q + 1 \) \)$, and repeat.
  Finally fix $q$ and the requested finite accuracy. At each of the finitely many selections take the current
    deficit and error small enough relative to its retained probability and the next requested accuracy,
    using (10.8); for an earlier test use (10.7) or the displayed isotropic bound.
    Choose the inner precision only after these finitely many requirements have been imposed.
    This proves the stated finite approximation and its stability under the additional subdivisions.
    In the elongated alternative the orientation precision of an aperture is $epsilon.alt^(a_j - b_j)$;
    thus the asserted aspect lower bound supplies any fixed separation between this precision and
    $epsilon.alt^(h \/ gamma)$ needed in the subsequent orientation argument. ◻
]

== 11 Finite packet repayment and closure <sec:packet-repayment>

We complete the proof of Theorem 35 by a finite backward iteration.
  A cut of length $2 h$ records the loss from coherent superposition as fine velocity information.
  At a growth rate $beta_(upright(q)) > gamma \/ 2$, the repayment estimate forces this quantity to increase at
  each cut by $\( 4 beta_(upright(q)) - 2 gamma \) h$, up to the finite errors specified below,
  while its capacity is at most $2 h$ up to those errors. A sufficiently long finite chain is therefore
  impossible. The information carried between cuts is encoded by a uniform conditional probability bound,
  so it can be retained through the subsequent branch selections.

Write $ell = log \( 1 \/ epsilon.alt \)$ and divide all entropies by $ell$.
  We use the finite budget of Section 10: a conditional list of size $epsilon.alt^(- alpha)$ costs $alpha$,
  and a fixed factor $C$ costs $\( log C \) \/ ell$. Depth bins have width $xi$,
  and packet tails are cut at distance $epsilon.alt^(- theta)$ in earlier packet units,
  with $theta < h \/ 10$ at fixed depths and $h > 0$. Constants $C_(*)$ count finitely many geometric and entropy
  losses, independently of the aspect exponents and cut locations.
  Fixed phase and amplitude constants enter through their logarithms divided by $ell$.
  We may increase $C_(*)$ a finite number of times.

Figure 3 explains the mismatch between the earlier packet’s transported uncertainty and the output position
  precision. The fine velocity information below accounts for this mismatch.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-3.05, 0), (4.18, 0), stroke: (paint: rgb("#94989c"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#94989c"))))
  content((4.18, -0.71), [#text(size: 9pt)[velocity]], anchor: "north-east", padding: 0.1176cm)
  line((0, -2.02), (0, 2.5), stroke: (paint: rgb("#94989c"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#94989c"))))
  content((0, 2.5), [#text(fill: rgb("#000000"))[#text(size: 9pt)[position at $C_t$]]], anchor: "south", padding: 0.1176cm)
  rect((-2.2, -0.5), (2.2, 0.5), fill: rgb("#f1f2f2"), stroke: (paint: rgb("#666c71"), thickness: 0.85pt, miter-limit: 10))
  rect((-0.7333, -1.5), (0.7333, 1.5), fill: rgb("#dae3e8"), stroke: (paint: rgb("#27597a"), thickness: 0.85pt, miter-limit: 10))
  line((-0.7333, -0.5), (-0.7333, 0.5), stroke: (paint: rgb("#666c71"), thickness: 0.45pt, miter-limit: 10, dash: "dashed"))
  line((0.7333, -0.5), (0.7333, 0.5), stroke: (paint: rgb("#666c71"), thickness: 0.45pt, miter-limit: 10, dash: "dashed"))
  line((-0.7333, 1.78), (0.7333, 1.78), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((0, 1.851), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#27597a"))[#text(size: 9pt)[$epsilon^(u_t+h)$]]]])], anchor: "south")
  line((-2.2, -2.13), (2.2, -2.13), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((0, -2.201), [#text(size: 9pt)[$epsilon^(u_t)$]], anchor: "north", padding: 0.1176cm)
  line((-2.63, -1.5), (-2.63, 1.5), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-2.806, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(fill: rgb("#27597a"))[#text(size: 9pt)[$epsilon^(u_t+t-h)$]]]])], anchor: "east")
  line((2.61, -0.5), (2.61, 0.5), stroke: (thickness: 0.45pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((2.786, 0), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$epsilon^(u_t+t)$]]])], anchor: "west")
  line((-3.4, -2.98), (-2.92, -2.98), stroke: (paint: rgb("#27597a"), thickness: 0.85pt, miter-limit: 10))
  content((-2.81, -2.98), [#text(size: 8pt)[earlier packet, transported from $r=t-2h$]], anchor: "west", padding: 0.1176cm)
  line((-3.4, -3.35), (-2.92, -3.35), stroke: (paint: rgb("#666c71"), thickness: 0.85pt, miter-limit: 10))
  content((-2.81, -3.35), [#text(size: 8pt)[output packet at $t$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 3: One coordinate pair of packet uncertainty cells at a common output anchor, with $0 < h lt.eq t \/ 2$, $t lt.eq H_(upright(P))$ and $u_t = \( H_(upright(P)) - t \) \/ 2$. The earlier packet has $u_r = u_t + h$: its velocity cell is finer by depth $h$, while its transported position uncertainty is coarser by depth $h$. Both displayed rectangles have the same area, $epsilon.alt^(u_t + h) epsilon.alt^(u_t + t - h) = epsilon.alt^(u_t) epsilon.alt^(u_t + t) = epsilon.alt^(H_(upright(P)))$. The rectangles are drawn concentrically to compare their scales and represent comparable widths after transport; fixed factors, shear and subpower tail enlargements are suppressed. An earlier packet can therefore contribute across several fine output position cells. Its transported center alone does not determine the fine output position label. ],
) <fig:packet-cells>

=== 11.1 The incoming fine-velocity information <the-incoming-fine-velocity-information>

Here is the precise meaning of the velocity information carried between steps. At time $t$, let

$ u_t = \( H_(upright(P)) - t \) \/ 2 \, wide
  P_f = \( C_t \, upright("isotropic velocity and position cells of width ") epsilon.alt^(u_t - h) \) . $

The position width in this formula is $epsilon.alt^(t + u_t - h)$.
  Fixed dilations and translations of the grids are allowed.
  Additional tags are allowed only if their conditional number, given the geometric part of $P_f$,
  is at most $epsilon.alt^(- alpha)$; their cost is included in $alpha$.

In the elongated case $n_f \( P_f \)$ is a unit normal, modulo sign,
  and the normal of the aperture $D$ is within $C epsilon.alt^h$ of $n_f \( P_f \)$.
  The label $W_f$ locates the velocity component along $n_f \( P_f \)$ in intervals of length $epsilon.alt^(u_t)$.
  In the isotropic case $W_f$ locates both velocity components at that precision.
  An incoming credit $k_f gt.eq 0$, with error $alpha_f$, means that on the normalized law being used,

#[#set math.equation(numbering: n => "(11.1)")
 $ sup_w bb(P) \( W_f = w divides P_f = p \) lt.eq epsilon.alt^(thin k_f - alpha_f) quad
   upright("for every ") p upright(" of positive probability") . $ <eq:incoming-packet-credit>]

In particular $sans(H) \( W_f divides P_f \) gt.eq k_f - alpha_f$.
  On the first step we set $k_f = 0$ and impose no incoming direction or fine-velocity condition.

We will use the following exact retention rule. It specifies how (11.1) is maintained when selecting branches.

#thm([Lemma 11.1.])[
  (Retention of a conditional probability bound).  #emph[Suppose a finite law satisfies
    $bb(P) \( W = w divides P = p \) lt.eq epsilon.alt^(k - alpha)$.
    Let $A$ have probability $p_A > 0$, and let $zeta > 0$. Under the law conditioned on $A$, the set of fibers on which
$ bb(P) \( A divides P \) < p_A epsilon.alt^zeta $

 has probability at most $epsilon.alt^zeta$. On every remaining fiber,
#[#set math.equation(numbering: n => "(11.2)")
 $ bb(P) \( W = w divides P \, A \) lt.eq
   epsilon.alt^(thin k - alpha - zeta - log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ p_A)) . $ <eq:credit-retention>]

 Removing the exceptional fibers does not change this conditional bound.
   The same assertion holds when $P$ includes other previously fixed labels.]
] <lem:packet-credit-retention>

#proof[
  The exceptional probability, in the conditioned law, is
  $ p_A^(- 1) sum_({ p : thin bb(P) \( A divides P = p \) < p_A epsilon.alt^zeta }) bb(P) \( P = p \)
    bb(P) \( A divides P = p \) lt.eq epsilon.alt^zeta . $
  On a remaining fiber divide $bb(P) \( W = w \, A divides P = p \) lt.eq
    bb(P) \( W = w divides P = p \)$ by $bb(P) \( A divides P = p \)$.
    Conditioning subsequently on a set of $P$ values does not alter the conditional law given $P$. ◻
]

Every removal below is also a score split under Section 10; its probability alone does not control the remaining score.

=== 11.2 Constructing the finite cut <constructing-the-finite-cut>

A prepared cut starts with a boundary step from $r = t - 2 h > 0$ to $t$, with $u_t > h$,
  as supplied by Proposition 44. The current endpoint law will be denoted by $pi^(upright("in"))$.
  It is a probability law on a finite sample space $Omega$.
  A sample $omega$ records $O \( omega \) \, D \( omega \)$, all incoming labels $P_f \,
  W_f$ and their extra tags when present, and any auxiliary randomness already used to choose those labels.
  In particular, an incoming label need not be a deterministic function of $\( O \, D \)$.
  For any endpoint law $nu$ on $Omega$, write $P_t \( nu \)$ for the score of the original input with its original
  masses. If $k_f > 0$, the bound (11.1) holds under $pi^(upright("in"))$, with its current error.
  On the first step $k_f = 0$.

The finite geometry is the following. The endpoint shape has $a = u_t$ to depth error at most $eta$.
  In the isotropic alternative the apertures are isotropic and $b_(*) = 0$.
  In the elongated alternative $b_(*) = b$, the endpoint aspect $e = a - b$ is at least $e_0 > 0$. In that case require

#[#set math.equation(numbering: n => "(11.3)")
 $ C_(*) \( h + eta \) < gamma e_0 . $ <eq:repayment-eccentricity>]

The grids and aperture menu admit all coarsenings below. We take $C_(*) gt.eq 2$.
  Thus in the elongated case $b lt.eq u_t + eta - e_0 lt.eq u_t - h$, after increasing $C_(*)$ if necessary;
  in the isotropic case $b_(*) = 0 < u_t - h$. We will use

#[#set math.equation(numbering: n => "(11.4)")
 $ b_(*) lt.eq u_t - h $ <eq:repayment-localizer-depth>]

when comparing the incoming coarse label with the localizer.

Use the fixed analytic, domain, depth, grid, and count bounds of Section 10.
  For supremum masses, fix at each site a test within a fixed factor of the supremum and call its mass
  $m_O \( f \)$. This changes any endpoint score by at most $C \/ ell$, included in $cal(R)$,
  and the Bessel bounds are uniform in these choices. Apply the floor $m_O \( f \) gt.eq
  epsilon.alt^(A_0) parallel f parallel_2^2$ of (9.28) and the fixed-shape score splits,
  recording their probabilities for credit retention.

Fix the depths, then $theta < h \/ 10$ and $xi$. By (11.4), $theta < \( u_r - b_(*) \) \/ 4$,
  as required by Lemma 37. Choose its amplitude error $C_A epsilon.alt^A parallel f parallel_2$ with $A > A_0 \/
  2 + 1$. If $Q_0$ bounds all relevant count exponents, choose the coefficient cutoff

#[#set math.equation(numbering: n => "(11.5)")
 $ B > 2 A + 3 Q_0 + 10 . $ <eq:repayment-coefficient-cutoff>]

uniformly over geometric localizers. The later transport order may be increased after this coefficient family is fixed.

For one geometric localizer $J_0$, let $iota$ range over its coefficient bins and greedy cap classes.
  The associated whole class is a finite set $cal(T)_iota^(upright("all"))$ of earlier atoms,
  with coefficient mass bin $m \( iota \)$, cap maximum bin $g \( iota \)$, and assigned cap $E_iota \( T \)$.
  Lemma 38 gives the cap upper bound on this set and the lower bound on each of its whole assigned fibers.
  At this point $iota$ indexes available classes; no class has yet been assigned to an endpoint sample as its
  final winner. The buffer used next is chosen for all possible contributors in this finite family,
  before any of its classes is subdivided.

During preparation, a replacement loss is the increase in score when the aperture is changed at fixed masses,
  evaluated on the specified current marginal. Section 10 supplies these losses from the current deficits and
  charges each split. This also applies to the two-copy marginals in the next lemma,
  since adjoining the unsplit conditional copies preserves the old marginal.

For every possible contributor, the velocity difference from its output center is $O \( epsilon.alt^(u_t) \)$.
  After referring the positions to $C_r$, their difference is

$ O \( epsilon.alt^(r + u_t) \) + O \( epsilon.alt^(- theta) epsilon.alt^(r + u_r) \) =
  O \( epsilon.alt^(r + u_t) \) \, wide u_r = u_t + h \, quad theta < h \/ 10 . $

Use isotropic cells with side $L_(upright("grid"))$ times $epsilon.alt^(u_t)$ in velocity and
  $epsilon.alt^(r + u_t)$ in position, where $L_(upright("grid"))$ is a sufficiently large fixed constant.
  A uniformly random translation places any output center farther than these possible differences from every face
  with probability at least $3 \/ 4$. Averaging over translations therefore gives one translation for which a part
  of at least that probability has the coarse label

$ P = \( C_r \, V_(u_t) \, \( X + \( C_r - C_t \) V \)_(r + u_t) \) $

in common with every possible contributing earlier atom. Retain this part as a score split and denote its
  normalized endpoint law by $pi^(upright("buf"))$. Its probability and deficit are charged by the finite
  selection rule above. This completes the geometric preparation in the isotropic case.

#thm([Lemma 11.2.])[
  (Prediction of a normal from isotropic replacements).  #emph[Assume the elongated geometry.
    On $pi^(upright("buf"))$, suppose the replacement losses for the isotropic apertures of widths $a$ and $b$ are
    included in $C_(*) eta$. Take two copies $\( O \, D \) \, \( O' \, D' \)$, independent conditional on $P$, and set
$ A_(upright("sep")) = { angle \( n \( D \) \, n \( D' \) \) gt.eq epsilon.alt^(4 h) } . $

 If this event has probability at least $1 \/ 4$, require the same replacement bounds on both marginals of the law
   conditioned on $A_(upright("sep"))$. Then there is a deterministic normal $n \( P \)$,
   defined on every coarse cell used by the atom partition, such that
$ angle \( n \( D \) \, n \( P \) \) lt.eq C epsilon.alt^(4 h) $

 on a part of $pi^(upright("buf"))$-probability at least $3 \/ 4$.]
] <lem:orientation-prediction>

#proof[
  Let $e = a - b$, and let $B_P$ be the isotropic coarsening of $P$ to width $b$.
    Grid list errors will be included in $C_(*) eta$. Only $2 h$ extra depth for time and $2
    h$ for each position coordinate are missing from $P$ in order to specify $O$, so
  #[#set math.equation(numbering: n => "(11.6)")
   $ sans(H) \( O divides P \) lt.eq 6 h + C_(*) eta . $ <eq:prediction-missing-data>]
  Replacing $D$ by the isotropic aperture of width $a$ gives
  #[#set math.equation(numbering: n => "(11.7)")
   $ sans(H) \( P divides D \) gt.eq \( 1 + gamma \) e - 6 h - C_(*) eta . $ <eq:prediction-lower>]
  Indeed the weight increases by $\( 1 + gamma \) e$, and the new conditional observation entropy is nonnegative.
    Replacing $D$ by the isotropic width-$b$ aperture at $t$, which has at most $6 h +
    C_(*) eta$ information beyond $B_P$, gives
  #[#set math.equation(numbering: n => "(11.8)")
   $ sans(I) \( P \; D divides B_P \) lt.eq \( 1 - gamma \) e + 6 h + C_(*) eta . $ <eq:prediction-upper>]
  Both inequalities are comparisons on the marginal law on which they are invoked.
  Suppose $A_(upright("sep"))$ has probability at least $1 \/ 4$, and condition the two-copy law on this event.
    For the resulting law, conditional dependence of the two copies given $P$ is at most
    $log \( 1 \/ bb(P) \( A_(upright("sep")) \) \) \/ ell lt.eq \( log 4 \) \/ ell$.
    This follows by comparing its density with the original conditional product and using the chain rule for
    relative entropy. The marginal replacement estimates (11.7)–(11.8) continue to hold with their charged
    conditional deficits.
  Each aperture, referred to $C_r$, constrains both columns to a normal strip of width a fixed multiple of
    $epsilon.alt^(a - C_(*) eta)$. Two such strips whose normals have angle at least $epsilon.alt^(4 h)$ have
    intersection of diameter at most $C epsilon.alt^(a - 4 h - C_(*) eta)$.
    Covering both columns by $P$ cells consequently gives
  #[#set math.equation(numbering: n => "(11.9)")
   $ sans(H) \( P divides D \, D' \) lt.eq 16 h + C_(*) eta . $ <eq:prediction-intersection>]
  Here a strip intersection is used separately for velocity and root position, each in two dimensions;
    hence $4 \( 4 h \) = 16 h$. The coarse label $B_P$ has bounded ambiguity given either aperture. The identity
  $ sans(I) \( P \; D' divides D \, B_P \) - sans(I) \( P \; D' divides B_P \) =
    sans(I) \( D \; D' divides P \, B_P \) - sans(I) \( D \; D' divides B_P \) $
  and conditional product comparison therefore imply that its left side is at most $C_(*) eta$.
    The first term is at least $\( 1 + gamma \) e - 22 h - C_(*) eta$, by (11.7) and (11.9);
    the second is at most $\( 1 - gamma \) e + 6 h + C_(*) eta$, by (11.8) for the other marginal.
    Thus $2 gamma e lt.eq 28 h + C_(*) eta$, contrary to the eccentricity hypothesis after fixing $C_(*)$.
    It follows that the complementary angle-proximity event has probability at least $3 \/ 4$.
    For each $P = p$, choose one normal maximizing the conditional mass of a ball of radius $C epsilon.alt^(4 h)$.
    Averaging the two-copy probability shows that the single-copy part predicted by these normals has mass at
    least $3 \/ 4$.
  On coarse cells of zero probability choose an arbitrary normal.
    This extends the table $n \( P \)$ to every cell that will index an atom subdivision,
    without changing the asserted event. ◻
]

=== 11.3 The subclasses and the current endpoint law <the-subclasses-and-the-current-endpoint-law>

Retain the buffered and, in the elongated case, predicted-normal parts just constructed.
  The table $n \( P \)$ and the translated grid are now fixed.
  Their selection probabilities, together with the earlier mass-floor and shape selections,
  are included in one preparation event $A_(upright("pre"))$ in the original sample space $Omega$.
  We will restore the incoming conditional probability bound after the atom partition and the winning map have
  been fixed.

For an earlier atom $T$, let $P \( T \)$ be its buffered coarse cell.
  In the elongated case first mark the atom according to whether the normal of its assigned aperture
  $E_iota \( T \)$ lies within $2 C epsilon.alt^h$ of $n \( P \( T \) \)$.
  This divides each whole class into aligned and misaligned atoms;
  both parts remain available when the winner is chosen. In the isotropic case no such mark is needed.

Let $W \( T \)$ record the velocity at depth $u_r = u_t + h$.
  It records the component along $n \( P \( T \) \)$ in the elongated case and both components in the isotropic
  case. These are the original depth units; after subtracting $b_(*)$,
  the fine spacing is $epsilon.alt^(u_r - b_(*))$. Within each marked part of $cal(T)_iota^(upright("all"))$,
  and for each $P$, bin

$ log_(1 \/ epsilon.alt) #h(-0.16667em) (\# { T : \( P \( T \) \, W \( T \) \) = \( p \, w \) }) $

with mesh $xi$. Among fibers in one such size bin, bin the logarithm of the number of represented $W$’s at $P$,
  again with mesh $xi$. Write $k gt.eq 0$ for this second numerical tag and $d = 1$ in the elongated case, $d =
  2$ in the isotropic case. For each resulting subclass and every represented $P$,

#[#set math.equation(numbering: n => "(11.10)")
 $ epsilon.alt^(- k + xi) lt.eq \# { W divides P } lt.eq epsilon.alt^(- k - xi) \, wide k lt.eq d h + C xi +
   frac(log C, ell) . $ <eq:velocity-fiber-regularity>]

The last bound covers a velocity cell of width $C epsilon.alt^(u_t)$ by cells of width $epsilon.alt^(u_r)$ in $d$
  dimensions. The sizes of two nonempty $\( P \, W \)$ fibers in this subclass differ by at most
  $epsilon.alt^(- xi)$. Hence its uniform atom law satisfies

#[#set math.equation(numbering: n => "(11.11)")
 $ bb(P) \( W = w divides P \, J \) lt.eq epsilon.alt^(k - 2 xi) . $ <eq:prepared-velocity-probability>]

Here $J$ will be the label of the subclass when it is chosen.
  The subdivision groups the numerical fiber-size and $k$ tags across different $P$’s;
  $P$ itself remains random in the subclass and is not appended as an auxiliary value of $J$.
  This distinction keeps the later conditional cost of $J$ small.

These are the final subdivisions that change atom sets. Later tags, such as total size, label a whole subclass.
  Let $S_epsilon.alt$ bound the number of available subclasses at a geometric localizer;
  at fixed depths $log S_epsilon.alt = o \( ell \)$. Their labels contain $J_0$, the $iota$ tags,
  the alignment mark when present, the two numerical velocity tags, and any whole-subclass tags.
  The winner map will choose one such tuple $J \( omega \)$.
  For its atom set $cal(T)_J$, set $cal(T)_J^(upright("all")) := cal(T)_iota^(upright("all"))$, $E \( T \) :=
  E_iota \( T \)$, and

$ N \( J \) = \# cal(T)_J \, wide N_(upright("all")) \( J \) = \# cal(T)_iota^(upright("all")) \, wide m \( J \) =
  m \( iota \) \, wide g \( J \) = g \( iota \) . $

Thus $N_(upright("all"))$ still counts the whole greedy class before alignment and velocity subdivision.
  Its cap upper bound persists on $cal(T)_J$; its assigned-fiber lower bound continues to refer to the whole class.

Write $frak(a)_O \( phi \)$ for the normalized pairing with the fixed site test,
  so $m_O \( phi \) = \| frak(a)_O \( phi \) \|^2$, and $h_J = sum_(T in cal(T)_J) c_T g_T$. Put

$ q_0 = C_A epsilon.alt^(A - A_0 \/ 2) < 1 / 2 . $

Choose at each retained sample a subclass maximizing $\| frak(a)_O \( h_J \) \|$, breaking ties by a fixed rule.
  All atom sets, superpositions, and this map to $J$ are now fixed. Applied to these final subclasses, (9.29) gives

#[#set math.equation(numbering: n => "(11.12)")
 $ \| frak(a)_O \( h_J \) \| & gt.eq frac(1 - q_0, S_epsilon.alt) sqrt(m_O \( f \)) gt.eq
   frac(1 - q_0, S_epsilon.alt) epsilon.alt^(A_0 \/ 2) parallel f parallel_2 \,\
m_O \( f \) & lt.eq \( 1 - q_0 \)^(- 2) S_epsilon.alt^2 m_O \( h_J \) lt.eq
  4 S_epsilon.alt^2 m_O \( h_J \) . $ <eq:repayment-winner-floor>]

The mass-term loss $3 log_(1 \/ epsilon.alt) #h(-0.16667em) (S_epsilon.alt) +
  3 log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ \( 1 - q_0 \))$ is included in $cal(R)$.
  In the elongated case both alignment marks participated in this choice.

After this finite menu, winner map, and coefficient cutoff are fixed, Lemma 37 allows one common transport power

#[#set math.equation(numbering: n => "(11.13)")
 $ A_(upright("tr")) > \( B + Q_0 + 1 \) \/ 2 $ <eq:repayment-transport-order>]

for every retained subclass, without a new coefficient cutoff.
  Its constants depend only on the fixed data and $Q_0$. This order controls the alignment collapse and the later
  candidate truncation, and is unchanged by subsequent subclass selections.

Take the endpoint law conditioned on $A_(upright("pre"))$.
  If $k_f > 0$, apply Lemma 45 to this event, using its probability under $pi^(upright("in"))$,
  and remove the exceptional $P_f$ fibers. This changes the endpoint law and its full $J$ marginal,
  while leaving the atom sets, counts, $g \, m$, and winner map fixed.
  The pointwise geometric and mass comparisons persist. Apply Proposition 41 anew to this law;
  its new deficit inequality controls the mean $bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em)
  (N_(upright("all")) \/ N)$ under its new $J$ marginal.

For each later numerical-tag or alignment restriction $A$,
  use its probability $p_A$ in the current normalized law. When $k_f > 0$,
  repeat the retention lemma and the exceptional-fiber score split.
  In either case reapply composition with the same frozen data. Each retention application adds

#[#set math.equation(numbering: n => "(11.14)")
 $ zeta + log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ p_A) $ <eq:repayment-credit-cost>]

to the incoming error. Use the weighted tag rule of Section 10 with its current union mass $p$ and shifted deficit
  $R$: it supplies probability at least $p \/ \( 4 S_epsilon.alt \)$ and conditional deficit at most $4 R \/ p$.
  Only a prescribed finite number of these operations is used.

The following exclusion determines which marked subclasses can remain.

#thm([Lemma 11.3.])[
  (Alignment of the selected earlier aperture).  #emph[For the elongated prepared cut,
    let $nu$ be a current endpoint law supported on $A_(upright("pre"))$, with the frozen winner map,
    and let $d_i \, R_t$ be its deficits and bound from Proposition 41.
    Let $B$ be a $J$-measurable event of misaligned winners, with $p = nu \( B \) > 0$, and put $𝜚 =
    nu \( thin dot.op divides B \)$. In local coordinates write $e = a -
    b$ and $\( j \, l \)$ for the assigned-cap widths. Assume the common shape bins satisfy
$ l = e + h + O \( eta \) \, wide l - j gt.eq e_0 - O \( eta \) \, $

 as supplied by the boundary alternative, and that the prepared packet, cap,
   and label errors are included in $C_(*) eta$. Then
#[#set math.equation(numbering: n => "(11.15)")
 $ p thin \[ 2 gamma e_0 - C_(*) \( h + eta \) \] lt.eq bb(E)_nu #h(-0.16667em)
   [bold(1)_B \( d_1 + 3 d_2 + 3 d_3 \)] lt.eq 3 R_t . $ <eq:alignment-misaligned-mass>]

 Thus a positive bracket bounds the current probability of misaligned winners by the current finite deficit.]
] <lem:orientation-alignment>

#proof[
  Because $B$ is $J$-measurable, $𝜚 \( thin dot.op divides J \) = nu \( thin dot.op divides J \)$ on $B$,
    so the local deficits are inherited. Work at a fixed $J$, subtract $b_(*) = b$ from widths, put $delta_J =
    d_2 \( J \) + d_3 \( J \)$, and let $M_j$ be the earlier isotropic depth-$j$ cell.
  For this comparison only, let $cal(O)_J^𝜚 = { O \( omega \) : 𝜚 \( omega \) > 0 \, med J \( omega \) = J }$.
    For fixed $P \, C_t$, collapse the winning masses as
  $ m_(P \, C_t)^(upright("buf")) = sum_(O in cal(O)_J^𝜚\
O mapsto \( P \, C_t \)) m_O \( h_J \) . $
  This sum counts each geometric site once, with the allowed bounded lattice multiplicity.
    Every tested site is buffered, so each of its possible contributors shares its $P$.
    Write $cal(T)_(J \, P) = { T in cal(T)_J : P \( T \) = P }$ and $N_(J \, P) = \# cal(T)_(J \, P)$.
    The finite mass bound of Proposition 40, with the fixed floor and tail comparison,
    bounds the collapsed mass by $m N_(J \, P)$ with the stated finite error. Only then sample a contributor:
  $ 𝜚^P \( omega \, T \) = 𝜚 \( omega \) bold(1)_({ T in cal(T)_(J \( omega \) \, P \( omega \)) }) /
    N_(J \( omega \) \, P \( omega \)) . $
  The floor and tail comparison ensure $N_(J \, P) > 0$ on the tested samples.
    This kernel preserves the whole endpoint sample; its atom marginal may be biased.
    The following entropies are conditional on $J$ under this law.
  The entropy calculation of Proposition 40 bounds $P_J$ above by
  $ sans(H) \( T \) + 3 / 2 log_(1 \/ epsilon.alt) #h(-0.16667em) (m) + 1 /
    2 { sans(H) \( T divides D \) + \( 1 - gamma \) e } + sans(H) \( C_t divides T \) + C_(*) eta . $
  Here $sans(H) \( T \) lt.eq log_(1 \/ epsilon.alt) #h(-0.16667em) (N)$ and $sans(H) \( C_t divides T \) lt.eq
    2 h + C_(*) eta$. For every sampled atom at $P$ and every aperture $D$ over that $P$,
    the buffered velocity and root-position columns differ from those of the paired output by at most the cell
    widths. Since $a = u_t + O \( eta \)$, a fixed enlargement of the root-referred cap of $D$ contains all these
    atoms, with the charged depth error. The cap upper bound gives $sans(H) \( T divides D \) lt.eq
    g - \( 1 - gamma \) e + C_(*) eta$. The definitions of $d_2 \, d_3$ give
  $ P_J = A_J + 2 beta_(upright(q)) h + 2 cal(R) - delta_J gt.eq A_J - delta_J . $
  Comparing the two score bounds yields
  #[#set math.equation(numbering: n => "(11.16)")
   $ sans(H) \( T \) gt.eq log_(1 \/ epsilon.alt) #h(-0.16667em) (N) - delta_J - C_(*) \( h + eta \) \, wide
     sans(H) \( T divides D \) gt.eq g - \( 1 - gamma \) e - 2 delta_J -
     C_(*) \( h + eta \) . $ <eq:alignment-biased-entropy>]
  Before subdivision the number of distinct assigned $E$ labels is at most
    $epsilon.alt^(- log_(1 \/ epsilon.alt) #h(-0.16667em) (N_(upright("all"))) + g - w \( j \, l \) - C_(*) eta)$,
    by the whole-class fiber lower bound of Lemma 38. Since $E$ is assigned deterministically to $T$,
  #[#set math.equation(numbering: n => "(11.17)")
   $ sans(H) \( T divides E \) gt.eq g - w \( j \, l \) - d_1 \( J \) - delta_J -
     C_(*) \( h + eta \) . $ <eq:alignment-assigned-entropy>]
  The whole-fiber count has thus cost $d_1 \( J \)$ for the retained, possibly biased law.
  On $A_(upright("pre"))$, the normal of $D$ is within $C epsilon.alt^(4 h)$ of $n \( P \)$.
    A misaligned $E$ therefore makes angle at least $C epsilon.alt^h$ with it.
    Their two column intersections fit isotropic caps of depth $e - C_(*) h - C_(*) eta$, so
  $ sans(H) \( T divides D \, E \) lt.eq g - 2 e + C_(*) \( h + eta \) . $
  Subtracting from (11.17) and using $l = e + h + O \( eta \)$ gives, for fixed $J$,
  $ sans(I) \( T \; D divides E \) gt.eq \( 1 + gamma \) \( e - j \) - d_1 \( J \) - delta_J - C_(*) \( h + eta \) . $
  Average under $𝜚_J$, absorbing the common-bin errors:
  #[#set math.equation(numbering: n => "(11.18)")
   $ sans(I)_(𝜚^P) \( T \; D divides E \, J \) gt.eq \( 1 + gamma \) \( e - j \) - bb(E)_𝜚 \( d_1 + delta_J \) -
     C_(*) \( h + eta \) . $ <eq:alignment-information-lower>]
  As $E$ is a function of $T$ given $J$, and determines $M_j$ up to the charged lists,
  $ sans(I)_(𝜚^P) \( T \; D divides E \, J \) lt.eq sans(I)_(𝜚^P) \( T \; D divides M_j \, J \) + C_(*) eta . $
  For the reverse estimate, coarsen $D$ to widths $0 \, j$, using the center of $M_j$.
    Its normal projection is confined by the coarsened strip, and the tangent width is zero-depth,
    so the resulting labels form a charged list determined by $D$.
    Enlarge each rectangle by a fixed factor to contain the entire $M_j$ cell;
    its projections are bounded by its diagonal. The enlargement depends only on the rectangle label.
    Resample it conditional on $\( M_j \, J \)$, independently of $T$, and call it $U$.
    It is faithful for every atom in that cell, has weight $\( 1 - gamma \) j$,
    and the cap bound gives on each $J$ fiber
  $ sans(I) \( T \; U \) gt.eq sans(H) \( T \) - g + \( 1 - gamma \) j - C_(*) eta . $
  Adjoin these kernels under $𝜚_J$, retaining the notation $𝜚^P$.
    The joint law of the enlarged coarsening and $M_j$ is preserved on each fiber.
    Since $M_j$ is a function of $T$ given $J$,
  $ sans(I)_(𝜚^P) \( M_j \; D divides J \) gt.eq sans(I)_(𝜚^P) \( M_j \; U divides J \) - C_(*) eta =
    sans(I)_(𝜚^P) \( T \; U divides J \) - C_(*) eta . $
  Average the cap bound and the second inequality in (11.16). Combining them with this display gives
  #[#set math.equation(numbering: n => "(11.19)")
   $ sans(I)_(𝜚^P) \( T \; D divides M_j \, J \) lt.eq \( 1 - gamma \) \( e - j \) + 2 bb(E)_𝜚 delta_J +
     C_(*) \( h + eta \) . $ <eq:alignment-information-upper>]
  The lower and upper bounds imply
  $ 2 gamma \( e - j \) lt.eq bb(E)_𝜚 \[ d_1 + 3 \( d_2 + d_3 \) \] + C_(*) \( h + eta \) . $
  The common shape bins give $e - j gt.eq e_0 - h - O \( eta \)$.
    Multiply by $p$, use $p bb(E)_𝜚 \[ dot.op \] = bb(E)_nu \[ bold(1)_B thin dot.op \]$,
    and use nonnegativity of the $d_i$ and (10.6). This proves (11.15). ◻
]

For the elongated application, first select a branch with qualifying common earlier shape bins by the weighted
  rule, perform credit retention when needed, and recompose.
  Let $nu$ be this current law and let $B$ be all its misaligned winners. This event is $J$-measurable.
  If $nu \( B \) = 0$, the law is already aligned; otherwise (11.15) applies to its entire current mass.
  At sufficiently small current deficit, the aligned complement has positive probability,
  tending to one with the positive gap fixed. Restrict to that complement,
  then apply the current-law retention and recomposition rule.
  In either alternative, apply the same rule to any remaining common numerical-bin selections and recompose after
  the last restriction. Denote the resulting endpoint law on $Omega$ by $pi$, and now set $P_t = P_t \( pi \)$,
  the score of the original input with its original masses. Every final elongated winning class is aligned.
  The buffered property, and prediction when present, persist pointwise. The incoming bound is

#[#set math.equation(numbering: n => "(11.20)")
 $ sup_w pi \( W_f = w divides P_f = p \) lt.eq epsilon.alt^(k_f - alpha_f) quad
   upright("for every ") p upright(" with ") pi \( P_f = p \) > 0 \, $ <eq:repayment-selected-credit>]

where $alpha_f$ includes the initial error and the sum of (11.14).
  When $k_f = 0$, this estimate will be replaced by nonnegativity of conditional mutual information.

Every expectation in the rest of this cut uses the selected marginal $pi_J$,
  unless a different law is explicitly displayed. In particular, set

#[#set math.equation(numbering: n => "(11.21)")
 $ d_1 \( J \) & = log_(1 \/ epsilon.alt) #h(-0.16667em) (N_(upright("all")) \( J \) \/ N \( J \)) \,\
A_J & = log_(1 \/ epsilon.alt) #h(-0.16667em) (N \( J \)) + 3 /
  2 log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( J \)) + 1 / 2 g \( J \) \,\
K_r^(*) \( pi \) & = sans(H)_pi \( J \) + b_(*) + bb(E)_pi [log_(1 \/ epsilon.alt) #h(-0.16667em)
  (N_(upright("all")) \( J \)) + 3 / 2 log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( J \)) + 1 / 2 g \( J \)] \,\
B_r & = sans(H)_pi \( J \) + b_(*) + bb(E)_pi A_J = K_r^(*) \( pi \) - bb(E)_pi d_1 . $ <eq:repayment-benchmark>]

The last equality is exact. The number $B_r$ is a benchmark formed with retained counts;
  it is not asserted to be an earlier score. For the final composition law, put $Delta_t = K_0 +
  beta_(upright(q)) t - P_t$. Its current $d_0$ gives

#[#set math.equation(numbering: n => "(11.22)")
 $ B_r + 2 beta_(upright(q)) h - P_t = Delta_t + 2 cal(R) - d_0 - bb(E)_pi d_1 lt.eq Delta_t +
   2 cal(R) . $ <eq:repayment-input-bridge>]

The earlier whole-class law and the returned retained-class law are, respectively,

#[#set math.equation(numbering: n => "(11.23)")
 $ mu^(upright("all")) \( J \, T \) =
   pi_J \( J \) frac(bold(1)_({ T in cal(T)_J^(upright("all")) }), N_(upright("all")) \( J \)) \, wide
   mu \( J \, T \) = pi_J \( J \) frac(bold(1)_({ T in cal(T)_J }), N \( J \)) . $ <eq:repayment-earlier-laws>]

Both use the selected marginal $pi_J$. Their observations are the sites of $T$ at time $r$,
  and their masses are coefficient tests of the original input $f$.
  With assigned caps $E \( T \)$, finite composition gives

#[#set math.equation(numbering: n => "(11.24)")
 $ P_r^(upright("all")) & gt.eq K_r^(*) \( pi \) - cal(R) \,\
P_r^(upright("ret")) & gt.eq K_r^(*) \( pi \) - 3 / 2 bb(E)_pi d_1 - cal(R) = B_r - 1 / 2 bb(E)_pi d_1 -
  cal(R) . $ <eq:repayment-earlier-scores>]

In the elongated case $mu$ continues the aligned assigned cap.
  In the isotropic case the same atom law uses the exact isotropic boundary aperture of width $u_r$.
  The horizon and packet menu include this cap by Proposition 44.
  With $b_(*) = 0$, the isotropic score satisfies the separate bound

#[#set math.equation(numbering: n => "(11.25)")
 $ P_r^(upright("iso")) gt.eq B_r - 1 / 2 bb(E)_pi \( g - 2 u_r \) - C cal(R) . $ <eq:repayment-isotropic-score>]

This uses weight $2 u_r$ and nonnegative conditional entropy, independently of the assigned-fiber gain.
  A charged selection fixed the common $g$ bin, and the final credit trim, when needed,
  preserved its pointwise support before $pi$ was named. Thus $g -
  2 u_r$ has the required small error under the displayed expectation.

Finally, (11.11) applies under $mu \( thin dot.op divides J \)$.
  Since the numerical $k$ tags are common bins under $pi_J$, averaging in $J$ gives

#[#set math.equation(numbering: n => "(11.26)")
 $ mu \( W = w divides P = p \) lt.eq epsilon.alt^(k - C_(*) eta) quad
   upright("for every ") p upright(" with ") mu \( P = p \) > 0 . $ <eq:repayment-outgoing-credit>]

This statement holds for either earlier aperture assignment under $mu$, which is uniform within each retained class.

=== 11.4 From winning masses to candidate masses <from-winning-masses-to-candidate-masses>

Before stating the repayment estimate, we finish the finite comparison of masses that its proof will use.
  Work in the translated coordinates of a selected localizer $J$, put $u = u_t - b_(*)$, and write

$ rho = epsilon.alt^u \, wide s = epsilon.alt^(u + h) \, wide sigma = epsilon.alt^(u + 2 h) = s^2 \/ rho \, wide
  lambda_(upright("loc")) = s^(- 2) . $

The buffered $P$ cell has width $rho$. Let $Q = Q \( J \, O \)$ record $P \, C_t$,
  and the position cell of side $s$ at $C_t$. For each such $Q$,
  let $cal(T)_(J \, Q) subset cal(T)_J$ consist of the atoms at this $P$ whose transported positions are within
  $C_0 R s$ of that cell, where $R = epsilon.alt^(- theta)$ and $C_0$ is a fixed constant large enough for the
  transport and cell-boundary enlargements. Absorb $C_0$ into the fixed constants in the coherence estimates.
  Write $N_(J \, Q) = \# cal(T)_(J \, Q)$ and

$ h_(J \, Q) = sum_(T in cal(T)_(J \, Q)) c_T g_T . $

Let $Z = Z \( J \, O \)$ add to $Q$ the output position at precision $sigma$ along $n \( P \)$ in the elongated
  case and in both directions in the isotropic case. These labels are functions of the geometric endpoint
  observation and the fixed grid and normal table; they do not include the arbitrary extra labels carried by
  $omega$. On the full sample space write $Q \( omega \) = Q \( J \( omega \) \, O \( omega \) \)$ and likewise
  for $Z \( omega \)$.

The winning superposition $h_J$ is fixed, while $h_(J \, Q)$ depends on $Q$.
  On every retained endpoint site, the buffered property and the transport order fixed after the winning map give

#[#set math.equation(numbering: n => "(11.27)")
 $ \| frak(a)_O \( h_J \) - frak(a)_O \( h_(J \, Q \( J \, O \)) \) \| lt.eq
   C_(upright("tr")) epsilon.alt^(A_(upright("tr"))) parallel f parallel_2 . $ <eq:repayment-winning-candidate-tail>]

The coefficient and count comparison in the original construction is still available:
  the squared summed tail has exponent beyond $B + 1$ after the $Q_0$ count loss.
  For the score we use the stronger information that the winning amplitude itself has the floor (11.12). Set

$ q_(upright("tr")) = frac(C_(upright("tr")) S_epsilon.alt, 1 - q_0) epsilon.alt^(A_(upright("tr")) - A_0 \/ 2) . $

The choices $B > 2 A + 3 Q_0 + 10$, $A > A_0 \/ 2 + 1$, and (11.13),
  together with the subpower bound on $S_epsilon.alt$, make $q_(upright("tr")) arrow.r
  0$ at fixed finite parameters. Choose $epsilon.alt$ small enough that $q_(upright("tr")) < 1 \/ 2$.
  Equations (11.12) and (11.27) then imply

#[#set math.equation(numbering: n => "(11.28)")
 $ m_O \( h_J \) lt.eq \( 1 - q_(upright("tr")) \)^(- 2) m_O \( h_(J \, Q \( J \, O \)) \) .
   $ <eq:repayment-winning-candidate>]

In particular $m_O \( h_(J \, Q \( J \, O \)) \) > 0$ and $N_(J \, Q \( J \, O \)) > 0$ on every retained sample.
  Replacing the winning mass by this candidate-truncated mass costs at most

#[#set math.equation(numbering: n => "(11.29)")
 $ 3 log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ \( 1 - q_(upright("tr")) \)) $ <eq:repayment-candidate-score-cost>]

in the score’s mass term. This cost is included in $eta$.

For a fixed $J \, Q$, define

#[#set math.equation(numbering: n => "(11.30)")
 $ m_Z = sum_(O mapsto Z\
O med upright(i n med t h e med l o c a l i z e r)) m_O \( h_(J \, Q) \) . $ <eq:repayment-candidate-mass>]

The sum uses every geometric output site mapping to $Z$ once,
  with the allowed bounded lattice multiplicity and its chosen site-dependent amplitude;
  it does not sum over copies of a site in $Omega$. Because $Z$ includes $Q$,
  the entire fiber uses one input $h_(J \, Q)$. Thus $m_Z$ is exactly the candidate-truncated mass to which the
  next lemma applies. The input $h_(J \, Q)$ varies with $Q$.
  These masses are used only to bound an entropy expression under $pi$;
  they are not treated as a new admissible packet system for a growth estimate.

=== 11.5 The repayment estimate <the-repayment-estimate>

The prepared cut supplies $mu$ and the capacity bound (11.10).
  The remaining estimate shows that a near-maximal endpoint score increases the fine-velocity credit.

#thm([Proposition 11.4.])[
  (Finite packet repayment).  #emph[Fix $0 < gamma < 1$ and a comparison rate $b_(upright(q)) in \[ 0 \, 1 \]$.
    For the prepared cut constructed above, let $eta$ bound the composition budget $cal(R)$, $theta +
    xi + \( log C \) \/ ell$, all logarithmic class, winner, tail, and label costs,
    the current mean $bb(E)_pi d_1$, and the finite classical growth error on the fixed class of lines,
    after a fixed increase of $C_(*)$. The selected endpoint and earlier replacement and composition deficits
    required in the construction are at most $eta$ on their specified current laws,
    including the two conditional prediction marginals. The common shape and count bins have width at most $eta$;
    in the isotropic case they also give the error in (11.25).
    When $k_f > 0$, assume (11.20) under $pi$ with its accumulated error $alpha_f lt.eq eta$. Finally suppose
#[#set math.equation(numbering: n => "(11.31)")
 $ P_t gt.eq B_r + 2 b_(upright(q)) h - Delta . $ <eq:repayment-saturation-input>]

 Then the prepared statistic $P \, n \( P \) \, W \, k$ under $mu$ satisfies
#[#set math.equation(numbering: n => "(11.32)")
 $ 0 lt.eq k lt.eq d h + C_(*) eta \, wide k gt.eq k_f + \( 4 b_(upright(q)) - 2 gamma \) h - 2 Delta -
   C_(*) eta \, quad d = cases(delim: "{", 1 & upright("elongated") \,, 2 & upright("isotropic") .)
   $ <eq:finite-packet-repayment>]

 Its pointwise probability bound is (11.26). In the elongated case the continued aperture normal is within $C
   epsilon.alt^h$ of $n \( P \)$. The returned score satisfies (11.24) in that case and (11.25) in the isotropic
   case. All these bounds are finite at fixed $epsilon.alt$.]
] <prop:finite-repayment>

=== 11.6 A coherent estimate on the full set of output sites <a-coherent-estimate-on-the-full-set-of-output-sites>

We next prove the mass estimate before introducing any positive law on candidate packets.
  The output amplitudes may be chosen separately at every site.

#thm([Lemma 11.5.])[
  (Packet coherence on a strip or a cell).  #emph[Use local coordinates with root time $r$,
    endpoint duration $2 h$, and put
$ rho = epsilon.alt^u \, wide s = epsilon.alt^(u + h) \, wide sigma = epsilon.alt^(u + 2 h) = s^2 \/ rho \, wide
  lambda_(upright("loc")) = s^(- 2) . $

 Fixed multiplicative errors in these relations change only constants.
   Let $P$ be a buffered isotropic cell of width $rho$. Let $Q$ specify $P \,
   C_t$ and a position cell of side $s$ at $C_t$. Candidate atoms have this $P$, velocity spacing $s$,
   earlier position spacing $s$, and transported position within $R s$ of that cell, where $R =
   epsilon.alt^(- theta)$. Let $N_Q$ be their number, and suppose
$ \| c_T \|^2 lt.eq epsilon.alt^(- xi) m . $

 Partition their velocities into $K lt.eq epsilon.alt^(- k - xi)$ bins of width $s$,
   in a fixed normal direction for $d = 1$ or in both directions for $d = 2$.
   Let $Z$ add to $Q$ the output position at precision $sigma$ in those $d$ directions.
   Let $m_Z$ be the sum of squared packet tests over all output sites mapping to $Z$,
   on the input truncated to these candidates. Then
#[#set math.equation(numbering: n => "(11.33)")
 $ sum_(Z divides Q) m_Z lt.eq C epsilon.alt^(- xi) N_Q m \, wide m_Z lt.eq
   C epsilon.alt^(d h - k - 2 theta - 2 xi) N_Q m . $ <eq:finite-coherence>]

 The constant is uniform over all admissible choices of the site-dependent amplitudes.
   Without candidate truncation, the square root of the mass estimate has the additive tail error provided by Lemma 37.]
] <lem:packet-coherence>

#proof[
  The first inequality is the synthesis Bessel estimate followed by the analysis Bessel estimate of Lemma 36.
    It holds for any subset of output sites and any subset of atoms.
  Suppose first that $d = 2$. If $A_(O T)$ is the normalized atom/test matrix, then
  $ \| A_(O T) \| lt.eq C rho^(- 1) parallel g_T parallel_1 lt.eq C s \/ rho = C epsilon.alt^h . $
  A full velocity bin contains a bounded number of velocity lattice centers.
    At each such center the proximity condition leaves at most $C R^2$ position centers.
    Each $Z$ contains a bounded number of output sites. Cauchy–Schwarz first within one bin and then across its
    $K$ bins gives
  $ m_Z lt.eq C K R^2 epsilon.alt^(2 h) sum_T \| c_T \|^2 lt.eq C epsilon.alt^(2 h - k - 2 theta - 2 xi) N_Q m . $
  For $d = 1$, write $n$ for the bin normal and $tau$ for its orthogonal unit tangent. Fix one velocity bin $W$.
    There are at most $C R^2$ candidate atoms per tangent velocity interval of length $s$. We claim
  #[#set math.equation(numbering: n => "(11.34)")
   $ sum_(O mapsto Z) lr(|sum_(T in W) c_T A_(O T)|)^2 lt.eq
     C R^2 epsilon.alt^h sum_(T in W) \| c_T \|^2 . $ <eq:one-bin-strip>]
  Here are details that also justify using all output sites with independently chosen amplitudes.
    Write $v = V_P + rho z$ on a common bounded patch and surround each output center $X_O$ by a square $B_O$ of
    side comparable to $sigma$. For $x in B_O$, remove the scalar value at $v = V_P$ from
  $ psi_O \( \( v - V_O \) \/ rho \) exp { i
    lambda_(upright("loc")) \[ Phi \( C_t \, X_O \, v \) - Phi \( C_t \, x \, v \) \] } . $
  All derivatives in $z$ are uniformly bounded, because $lambda_(upright("loc")) rho sigma = 1$.
    A common bump and a Fourier series on a fixed enlarged patch therefore give coefficients $b_nu \( O \, x \)$
    satisfying
  $ \| b_nu \( O \, x \) \| lt.eq C_M \( 1 + \| nu \| \)^(- M) $
  uniformly in both $O$ and $x$. Weighted Cauchy–Schwarz bounds the squared transform at $X_O$ by a fixed rapidly
    summable combination of squared transforms at $x$, each with a common bump and a linear modulation
    $e^(i nu dot.op \( v - V_P \) \/ rho)$. These factors are independent of $x$.
    No derivatives with respect to the site index have been used.
  Integrate this bound on $B_O$, divide by its area, and sum.
    The squares have bounded overlap, and their union lies in a strip of normal width $C
    sigma$ and tangent length $C s$. The normalization outside the resulting continuous position integral is
  #[#set math.equation(numbering: n => "(11.35)")
   $ rho^(- 2) sigma^(- 2) = s^(- 4) . $ <eq:strip-normalization>]
  It is enough to prove the estimate for each of the common bump/modulation factors,
    uniformly in its Fourier index; the factor has bounded modulus and is independent of $x$.
  For fixed normal position, integrate against a smooth majorant of the tangent interval of length $C s$.
    For velocities in the same $W$, their normal difference is $O \( s \)$.
    Symmetry and uniform definiteness of $partial_p zeta$ give
  $ partial_tau { Phi \( C_t \, x \, v \) - Phi \( C_t \, x \, v' \) } =
    tau^(sans(T)) A \( x \, v \, v' \) \( v - v' \) \, $
  where $A$ is an average of those definite matrices. If the tangent separation is a sufficiently large multiple
    of $s$, this derivative has magnitude at least $c \| \( v - v' \) dot.op tau \|$.
    Higher $x$-derivatives are bounded by $C_j \| v - v' \|$.
    Repeated integration by parts in the rescaled tangent variable thus bounds its kernel by
  $ C_M s (1 + frac(\| \( v - v' \) dot.op tau \|, s))^(- M) . $
  For smaller separation the same bound, with another constant, follows directly by integration over the interval.
    Earlier normalized atoms have $L^1$ norm at most $C s$. Including the normal integration and (11.35),
    the corresponding Gram entry is therefore at most
  $ C_M s^(- 4) sigma s thin s^2 (1 + frac(\| \( V_T - V_(T') \) dot.op tau \|, s))^(- M) =
    C_M epsilon.alt^h (1 + frac(\| \( V_T - V_(T') \) dot.op tau \|, s))^(- M) . $
  The possible overlap of velocity supports changes only the constant in this estimate.
    Sum the rapidly decreasing kernel over tangent intervals, using the multiplicity $C R^2$.
    The Schur bound proves (11.34). Finally Cauchy–Schwarz over the $K$ bins proves the second inequality of
    (11.33) for $d = 1$. ◻
]

=== 11.7 The candidate law and its entropy bound <the-candidate-law-and-its-entropy-bound>

We now prove Proposition 48. For a value $J = j$ of positive $pi_J$-probability,
  let $pi_j$ denote the selected endpoint law conditional on $J = j$. Define the finite entropy expression

$ cal(E)_j = sans(H)_(pi_j) \( Z \) + 1 / 2 sans(H)_(pi_j) \( Z divides D \) + 3 /
  2 bb(E)_(pi_j) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_Z) + 1 / 2 bb(E)_(pi_j) w_(upright("loc")) \( D \) . $

All entropies here concern the displayed geometric observations, rather than the entire sample $omega$.
  The latter carries extra labels only so that later augmentation preserves them.
  Finite composition first compares the original score with the conditional winning scores.
  Equation (11.28) then replaces their masses by the candidate-truncated masses.
  Finally, conditional log-sum on each $O mapsto Z$ fiber bounds the two entropy–mass terms by those in
  $cal(E)_j$. The unconditional fiber calculation uses all sites mapping to $Z$; conditional on $D$,
  its support is a subset of those sites. Thus

#[#set math.equation(numbering: n => "(11.36)")
 $ P_t lt.eq sans(H)_pi \( J \) + b_(*) + bb(E)_(pi_J) cal(E)_J + cal(R) +
   3 log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ \( 1 - q_(upright("tr")) \)) . $ <eq:repayment-candidate-expression>]

This is a comparison of finite expressions under the same endpoint law.
  No growth bound has been applied to the $Q$-dependent inputs.

Lemma 49 now gives its two exact bounds for the masses $m_Z$ in (11.30).
  Only after these analytic inequalities do we introduce a positive candidate law.
  Adjoin an earlier atom to the full endpoint sample by

#[#set math.equation(numbering: n => "(11.37)")
 $ tilde(pi) \( omega \, T \) = pi \( omega \) bold(1)_({ T in cal(T)_(J \( omega \) \, Q \( omega \)) }) /
   N_(J \( omega \) \, Q \( omega \)) . $ <eq:repayment-candidate-law>]

The denominator is positive on every sampled value, as proved above.
  This law has exactly the endpoint marginal $pi$, including $P_f \, W_f$ and every stochastic incoming tag.
  Conditional on $\( J \, Q \)$, the atom is uniform on the candidate set and independent of every other endpoint
  label. Its marginal on atoms is generally biased; it is different from $mu$,
  which is uniform within each retained class.

For the next calculation fix $J = j$, and write $sans(H)_j \,
  bb(E)_j$ for entropy and expectation under $tilde(pi) \( thin dot.op divides J = j \)$. Put

$ B_(1 \, j) = bb(E)_j log_(1 \/ epsilon.alt) #h(-0.16667em) (N_(J \, Q)) \, wide S_(t \, j) =
  sans(H)_j \( C_t divides T \) \, wide cal(M)_j = bb(E)_j log_(1 \/ epsilon.alt) #h(-0.16667em) (m_Z) . $

Since $Z$ includes $Q$, the sampling rule gives exactly

$ sans(H)_j \( T divides Z \, D \) = sans(H)_j \( T divides Z \) = B_(1 \, j) . $

Candidate proximity gives $sans(H)_j \( Q divides T \, C_t \) lt.eq C_(*) eta$.
  It also gives $sans(H)_j \( Z divides T \, D \) lt.eq C_(*) eta$.
  For the latter bound, $T \, C_t$ locate the position to precision $s$,
  while $D$ supplies its normal component at precision $sigma$.
  In the elongated case the current prediction $angle \( n \( D \) \, n \( P \) \) lt.eq
  C epsilon.alt^(4 h)$ moves a residual of size at most $epsilon.alt^(- theta) s$ by at most $C
  epsilon.alt^(4 h - theta) s < C sigma$. In the isotropic case the aperture supplies both fine components.
  The remaining costs are the stated lists and boundary-depth errors.

The chain rule gives

#[#set math.equation(numbering: n => "(11.38)")
 $ sans(H)_j \( Z \) & lt.eq sans(H)_j \( T \) - B_(1 \, j) + S_(t \, j) + sans(H)_j \( Z divides Q \) + C_(*) eta \,\
sans(H)_j \( Z divides D \) + B_(1 \, j) & lt.eq sans(H)_j \( T divides D \) +
  C_(*) eta . $ <eq:repayment-entropy-chain-one>]

Conditional log-sum applied to the aggregate coherence bound, and the logarithm of its pointwise bound,
  respectively give

$ sans(H)_j \( Z divides Q \) + cal(M)_j & lt.eq B_(1 \, j) + log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( j \)) +
  C_(*) eta \,\
cal(M)_j & lt.eq B_(1 \, j) + log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( j \)) + k - d h + C_(*) eta . $

Use the first inequality with coefficient $1$ and the second with coefficient $1 \/ 2$ in (11.38)–(11.38).
  Every occurrence of $B_(1 \, j)$ cancels. The result is

#[#set math.equation(numbering: n => "(11.39)")
 $ cal(E)_j lt.eq sans(H)_j \( T \) + 3 / 2 log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( j \)) + 1 /
   2 { bb(E)_j w_(upright("loc")) \( D \) + sans(H)_j \( T divides D \) + 2 S_(t \, j) + k - d h } +
   C_(*) eta . $ <eq:coherent-entropy-repayment>]

Here the common $k$ bin absorbs its stated finite bin error.

We assemble these conditional kernels under $pi_J$ before using incoming information. Averaging (11.39) gives

#[#set math.equation(numbering: n => "(11.40)")
 $ bb(E)_(pi_J) cal(E)_J & lt.eq sans(H)_(tilde(pi)) \( T divides J \) + 3 /
   2 bb(E)_pi log_(1 \/ epsilon.alt) #h(-0.16667em) (m \( J \))\
 & quad + 1 / 2 { bb(E)_pi w_(upright("loc")) \( D \) + sans(H)_(tilde(pi)) \( T divides D \, J \) +
   2 sans(H)_(tilde(pi)) \( C_t divides T \, J \) + k - d h #scale(x: 120%, y: 120%)[}] +
   C_(*) eta . $ <eq:coherent-entropy-repayment-averaged>]

The incoming conditional probability bound will be used under this assembled law, not separately on each $J$ fiber.

=== 11.8 A faithful aperture and the incoming information <a-faithful-aperture-and-the-incoming-information>

The candidate atoms carry exact straight lines through their earlier positions with their assigned velocities.
  In a localizer $J$, let $F_T$ record $C_t$ and both columns of this line at isotropic width $u -
  h$ at the endpoint. Its local position precision is $epsilon.alt^(u + h) = s$.
  Thus $F_T$ is a function of $\( T \, C_t \, J \)$; conditional on $J$, it need not be a function of $T$ alone.

In the elongated case coarsen the orientation of $D$ and its aperture data to widths $0 \, u - h$,
  computing the latter from the center given by $F_T$. In the isotropic case use widths $u - h \, u - h$.
  Denote this intermediate observation by $Y$. Transport proximity makes $Y$ determined by $D$,
  conditional on $J$, up to a list of size at most $epsilon.alt^(- C_(*) eta)$.

Enlarge each rectangle of $Y$ by one fixed factor so that it contains the entire corresponding isotropic $F_T$
  cell. The factor works for every orientation: projections of a square have length at most its diagonal,
  and rounding the center adds only a fixed grid spacing. This costs at most $\( log C \) \/ ell$ in depth.
  Call the enlarged label $macron(Y)$. It is a function of $Y$,
  so it has the same conditional list bound from $D$. Let $kappa \( g divides F_T \, J \)$ be the conditional law
  of $macron(Y)$ under $tilde(pi)$, and adjoin $G$ by that kernel:

$ tilde(pi) \( omega \, T \, G \) = tilde(pi) \( omega \, T \) kappa \( G divides F_T \, J \) . $

We keep the same notation for the augmented law. It preserves the entire old law of $\( omega \, T \)$ and the
  joint law of $\( F_T \, J \, macron(Y) \)$ with $macron(Y)$ replaced by $G$.
  The new $G$ is independent of $T$ conditional on $\( F_T \, J \)$, contains $C_t$,
  and is faithful for every line with that $F_T \, J$ value. No $T$-dependent cell is appended to its label.

Apply Theorem 15 in each localizer with duration $2 h$ and horizon $u + h$.
  The strict eccentricity condition, or $b_(*) = 0$ with $u_t > h$, gives $u > h$.
  Its root caps have widths at most $u + h = u_r - b_(*)$, and the endpoint horizon $a + t lt.eq L$,
  with its stated depth error, also places them inside the local packet menu.
  For every such root test $F$, the support upper bound gives

$ sans(H)_j \( T divides F \) + bb(E)_j w \( F \) lt.eq g \( j \) + C_(*) eta . $

This uses only the retained support, so it holds for the biased candidate marginal.
  The positive root supremum is consequently at most $g \( j \) - sans(H)_j \( T \) + C_(*) eta$.
  Positive growth yields, on each $J = j$ fiber,

#[#set math.equation(numbering: n => "(11.41)")
 $ bb(E)_j w \( G \) + sans(H)_j \( T divides G \) + 2 S_(t \, j) lt.eq g \( j \) + 2 gamma h +
   C_(*) eta . $ <eq:faithful-classical-bound>]

Averaging these inequalities under the same $pi_J$ as before,

#[#set math.equation(numbering: n => "(11.42)")
 $ bb(E)_(tilde(pi)) w \( G \) + sans(H)_(tilde(pi)) \( T divides G \, J \) +
   2 sans(H)_(tilde(pi)) \( C_t divides T \, J \) lt.eq bb(E)_pi g \( J \) + 2 gamma h +
   C_(*) eta . $ <eq:faithful-classical-bound-averaged>]

All information in the remainder of this subsection is under the assembled augmented law $tilde(pi)$.
  Both $D$ and $G$ contain $C_t$, and $F_T$ is a function of $\( T \, C_t \, J \)$.
  The common time information cancels in the exact chain rule

#[#set math.equation(numbering: n => "(11.43)")
 $ sans(I) \( T \; D divides J \) - sans(I) \( T \; G divides J \) & = sans(I) \( F_T \; D divides C_t \, J \) -
   sans(I) \( F_T \; G divides C_t \, J \)\
 & quad + sans(I) \( T \; D divides F_T \, J \) - sans(I) \( T \; G divides F_T \, J \) .
   $ <eq:time-correct-information-splitting>]

The last term is zero by the resampling kernel. Data processing for $macron(Y)$,
  followed by preservation of its joint law with $\( F_T \, J \)$, bounds the first line below by $- C_(*) eta$.
  Therefore

#[#set math.equation(numbering: n => "(11.44)")
 $ sans(I) \( T \; D divides J \) - sans(I) \( T \; G divides J \) gt.eq sans(I) \( T \; D divides F_T \, J \) -
   C_(*) eta . $ <eq:information-before-credit>]

When $k_f > 0$, the preserved endpoint marginal supplies an averaged information lower bound

#[#set math.equation(numbering: n => "(11.45)")
 $ sans(I) \( T \; D divides F_T \, J \) gt.eq k_f - C_(*) eta . $ <eq:credit-information>]

Here is the finite-list verification. In absolute units, $F_T$ and $P_f$ have identical velocity depth $u_t -
  h$ and position depth $t + u_t - h$. The candidate position differs from the observed one by at most
  $epsilon.alt^(- theta) epsilon.alt^(r + u_r)$, exactly an $epsilon.alt^(- theta)$ multiple of that position
  unit, and the velocity difference is $O \( epsilon.alt^(u_t) \)$.
  The localizer has the coarser width in (11.4); its remaining tags have the charged conditional count. It follows that

$ sans(H) \( F_T \, J divides P_f \) lt.eq C_(*) eta \, wide sans(H) \( P_f divides F_T \, J \) lt.eq C_(*) eta . $

Because $tilde(pi)_Omega = pi$, (11.20) still holds for its endpoint labels.
  It is not asserted after conditioning separately on $J$. The chain rule gives

$ sans(H) \( W_f divides F_T \, J \) gt.eq sans(H) \( W_f divides P_f \) -
  sans(H) \( F_T \, J divides P_f \) gt.eq k_f - C_(*) eta . $

Neither coarse label alone determines $W_f$. The pairs $\( D \, F_T \, J \)$ and $\( T \, F_T \, J \)$, however,
  each determine a list of at most $epsilon.alt^(- C_(*) eta)$ possibilities.
  First list the possible $P_f$’s supplied by $F_T \, J$. For each listed value, $n_f \( P_f \)$ is known,
  with no continuity assumption on this function. Use that value’s coarse velocity center as reference.
  The remaining velocity has size $O \( epsilon.alt^(u_t - h) \)$.
  The incoming alignment of the normal of $D$ with $n_f \( P_f \)$ is $O \( epsilon.alt^h \)$,
  so changing between them changes the measured component by $O \( epsilon.alt^(u_t) \)$, one $W_f$ unit.
  Thus $D$ resolves that component to the stated list. The exact velocity of $T$ does so as well,
  since it differs from the output velocity by $O \( epsilon.alt^(u_t) \)$.
  For isotropic tests use both velocity coordinates. Consequently

$ sans(H) \( W_f divides D \, F_T \, J \) + sans(H) \( W_f divides T \, F_T \, J \) lt.eq C_(*) eta . $

The elementary information inequality

$ sans(I) \( T \; D divides F_T \, J \) gt.eq sans(H) \( W_f divides F_T \, J \) -
  sans(H) \( W_f divides D \, F_T \, J \) - sans(H) \( W_f divides T \, F_T \, J \) $

proves (11.45). This is a conditional information averaged over $J$ under $tilde(pi)$,
  which is exactly what the averaged bounds need. If $k_f = 0$,
  use nonnegativity of conditional mutual information instead.

Combining (11.44) and (11.45) with (11.42) gives

$ bb(E)_(tilde(pi)) w \( G \) + sans(H)_(tilde(pi)) \( T divides D \, J \) +
  2 sans(H)_(tilde(pi)) \( C_t divides T \, J \) lt.eq bb(E)_pi g \( J \) + 2 gamma h - k_f + C_(*) eta . $

The weight change on each localizer is

$ w_(upright("loc")) \( D \) - w \( G \) =
  cases(delim: "{", \( 1 - gamma \) h + O \( eta \) \, & d = 1 \,, 2 h + O \( eta \) \, & d = 2 \,) wide
  w_(upright("loc")) \( D \) - w \( G \) lt.eq d h + C_(*) eta . $

Also $sans(H)_(tilde(pi)) \( T divides J \) lt.eq bb(E)_pi log_(1 \/ epsilon.alt) #h(-0.16667em) (N \( J \))$,
  since every candidate lies in its retained class. Insert these bounds into (11.40), then use (11.36).
  The tail comparison costs are included in $eta$, so after returning to the original units,

$ P_t lt.eq B_r + gamma h + 1 / 2 \( k - k_f \) + C_(*) eta . $

Comparison with (11.31) proves the lower bound in (11.32). Its upper bound is (11.10).

Under $mu$ at time $r$, $P$ has depth $u_t = u_r - h$ and $W$ has depth $u_r$.
  Thus (11.26) and the earlier aperture and score bounds supply the next cut’s incoming data.
  That cut may use a new atom decomposition: the coarse-label lists carry the observable $W divides P$ bound,
  without identifying the two temporary candidate populations. This completes Proposition 48.

=== 11.9 A finite backward chain <a-finite-backward-chain>

Suppose, for a contradiction, that $beta_(upright(q)) > gamma \/ 2$, and set

$ c = 4 beta_(upright(q)) - 2 gamma > 0 . $

Choose an integer $q$ with $q c > 2$. Proposition 44 supplies $q$ backward steps of a common positive length $2
  h$, with all times positive and $u_t > h$. In the forced alternative first take $h$ sufficiently small compared
  with the fixed aspect gap times $gamma$; this verifies (11.3).
  In the other alternative all the back tests are exactly isotropic.

Fix this chain and start with $k_0 = 0$. At cut $i$, apply the rule for a prepared cut and call its final endpoint
  law $pi_i$; the returned $mu_i$ is the next endpoint law.
  Let $Delta_i \, eta_i$ be the actual selected errors for $pi_i$, with $J$-averages under $\( pi_i \)_J$.
  They include the exceptional-fiber score splits and the accumulated $zeta +
  log_(1 \/ epsilon.alt) #h(-0.16667em) (1 \/ p_A)$ with every $p_A$ measured in its current law.
  Choose the finitely many retention parameters and current-law branches so this finite cost sum is as small as
  required.

Within each fixed outer row $j$, choose the finite inner parameters $theta \, xi$ and the finitely many $zeta$’s,
  then the initial packet tail orders and coefficient cutoff, the later transport order,
  and finally the precision $epsilon.alt$. These choices make the inner errors,
  including both mass-comparison costs, arbitrarily small in that row.
  Finite composition and (11.22) leave the selected deficits bounded by that row’s $Delta_j$,
  with the fixed finite selection factors, plus those inner errors.
  With the target shape and $g$ accuracies fixed before choosing the late row,
  these factors are bounded across the subsequence: only uniformly positive current masses of qualifying unions
  and retained complements divide deficits, while individual tag probabilities enter only logarithmic costs.
  The selected deficits are not sent to zero inside the row.
  Only then choose a sufficiently late outer row, with $q$ and $h$ already fixed across the subsequence,
  and choose finite inner precision in that row so that the total error bound below holds.
  No transport order uniform in unbounded outer aspect parameters is required.

Apply Proposition 48 with $b_(upright(q)) = beta_(upright(q))$. Iteration of (11.32) gives

$ k_q gt.eq q c h - sum_(i = 1)^q \( 2 Delta_i + C_(*) eta_i \) \, wide k_q lt.eq 2 h + C_(*) eta_q . $

Choose the finite errors so that

$ sum_(i = 1)^q \( 2 Delta_i + C_(*) eta_i \) + C_(*) eta_q < \( q c - 2 \) h . $

The two inequalities are incompatible. Consequently $beta_(upright(q)) lt.eq gamma \/ 2$,
  completing the proof of Theorem 35.

== 12 Oscillatory integrals and Bochner–Riesz multipliers <sec:multiplier>

We now turn packet growth into the multiplier bound. The first step is an oscillatory integral estimate with loss
  $lambda^nu$ for every $nu > 0$, uniform over fixed phase and amplitude classes.
  After a change of variables, this gives norm $O_(delta \, nu) \( lambda^(- delta + nu) \)$ for a Bochner–Riesz
  kernel shell of radius $lambda$. Choosing $nu < delta$ makes the dyadic shell sum converge.
  We keep the data bounds explicit because the shell amplitudes vary with the scale.

#thm([Theorem 12.1.])[
  (Oscillatory integral estimate).  #emph[Fix bounded input and output regions $K_v \, K_x subset bb(R)^2$.
    For the input patch $K_v$, fix a class of smooth real phases satisfying the phase assumptions of Section 9,
    with common domain $\[ 0 \, 1 \] times bb(R)^2 times U_v$, where $U_v$ is an open neighborhood of $K_v$.
    All enlarged patches required by the decomposition, expressed in the original $v$ coordinates,
    are contained in $U_v$ and obey common bounds. The translated systems are considered on the corresponding
    bounded rescaled patches described in that section, with the resulting uniform bounds. Throughout the phase domain,
$ partial_v Phi \( c \, x \, v \) = zeta \( v \, x - c v \) . $

 For each phase and each required original input patch $V$,
   the matrix $partial_p zeta$ is symmetric and satisfies either
$ a_0 I lt.eq partial_p zeta \( v \, p \) lt.eq a_1 I wide \( v in V \, med p in bb(R)^2 \) \, $

 or the same inequality with $- partial_p zeta$ in place of $partial_p zeta$,
   with common constants $a_0 > 0$ and $a_1$ for the class. On these original patches, every mixed $v \,
   p$ derivative of total order $j$ of this matrix is bounded by $A^(j + 1) \( j ! \)^3$ for a common $A gt.eq 1$.
   Fix these constants and all the seminorm bounds of a class of smooth amplitudes $B$ supported in $\[ 0 \, 1 \]
   times K_x times K_v$. For every $nu > 0$ there is a constant $C_nu$,
   depending only on these fixed data and $nu$, such that, for every $lambda gt.eq 2$,
   every phase and amplitude in the specified classes, and every $f in L^3 \( bb(R)^2 \)$ supported in $K_v$,
#[#set math.equation(numbering: n => "(12.1)")
 $ ∥E_lambda f∥_(L^3 \( \[ 0 \, 1 \] times K_x \)) lt.eq C_nu lambda^(- 1 + nu) parallel f parallel_3 \, wide
   E_lambda f \( c \, x \) = integral e^(i lambda Phi \( c \, x \, v \)) B \( c \, x \, v \) f \( v \) thin d v .
   $ <eq:oscillatory-estimate>]

]
] <thm:oscillatory-estimate>

#proof[
  Fix $0 < gamma < 1$ and a loss $eta > 0$. Apply Theorem 35 with
  $ epsilon.alt = lambda^(- 1) \, wide H_(upright(P)) = t = L = 1 . $
  Thus its finite conclusion is $P_1 lt.eq K_0 + gamma \/ 2 + eta$ for all sufficiently large $lambda$,
    uniformly in the data under consideration. Here and until the endpoint sum below,
    logarithms in scores have base $epsilon.alt^(- 1)$.
  Suppose first that $\| f \| lt.eq upright(bold(1))_F$, where $F subset K_v$ is measurable.
    The case $f = 0$ is immediate. At the root the packet radius is $rho_0 = lambda^(- 1 \/ 2)$.
    Write $m_O$ for the canonical root masses. The Bessel bound of Lemma 36 gives
  $ M := sum_O m_O lt.eq C \| F \| . $
  If $D$ is any admissible root aperture of widths $b lt.eq a lt.eq 1 \/ 2$,
    its velocity centers lie in a rectangle with side lengths comparable to $epsilon.alt^b \, epsilon.alt^a$.
    All the corresponding test windows lie in the $100 rho_0$ enlargement of this rectangle.
    Since $rho_0 lt.eq epsilon.alt^a lt.eq epsilon.alt^b$, that enlargement has area at most $C
    epsilon.alt^(a + b)$. Applying the same Bessel estimate to $f$ restricted to the enlarged rectangle yields
  #[#set math.equation(numbering: n => "(12.2)")
   $ M_D := sum_(O upright(" compatible with ") D) m_O lt.eq C epsilon.alt^(a + b) . $ <eq:restricted-root-cap>]
  This estimate holds separately for each label, including labels that are assigned stochastically.
    Its constant includes the fixed lattice and window multiplicities.
  For any law of $\( O \, D \)$ supported on compatible pairs, log-sum gives
  $ sans(H) \( O \) + bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O) lt.eq
    log_(1 \/ epsilon.alt) #h(-0.16667em) () M \, wide sans(H) \( O divides D \) +
    bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O) lt.eq bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (M_D) . $
  Consequently every root score is at most
  $ log_(1 \/ epsilon.alt) #h(-0.16667em) (\| F \|) + 1 / 2 bb(E) #scale(x: 120%, y: 120%)[\[] w \( b \, a \) -
    a - b #scale(x: 120%, y: 120%)[\]] + frac(C, log lambda) lt.eq
    log_(1 \/ epsilon.alt) #h(-0.16667em) (\| F \|) + frac(C, log lambda) \, $
  because $w \( b \, a \) - a - b = - gamma \( a - b \) lt.eq 0$.
    The norm option in $K_0$ has the same upper bound: indeed
  $ parallel f parallel_2^3 lt.eq \| F \|^(3 \/ 2) lt.eq \| K_v \|^(1 \/ 2) \| F \| . $
  We have therefore proved
  #[#set math.equation(numbering: n => "(12.3)")
   $ K_0 lt.eq log_(1 \/ epsilon.alt) #h(-0.16667em) (\| F \|) + frac(C, log lambda) . $ <eq:restricted-root-score>]
  At $t = H_(upright(P)) = 1$ the velocity radius is one. Cover the input region by a fixed number of such
    velocity patches, and partition the output region into boxes with time and position side lengths comparable to
    $lambda^(- 1)$. We may work with one input patch at a time.
    For each output box let $m_O$ be a test mass controlling the supremum of $\| E_lambda f \|^2$ on that box,
    up to a fixed factor. These tests are admissible endpoint masses.
    To see the asserted uniformity, if $\( C \, X \)$ is the box anchor, absorb
  $ exp #h(-0.16667em)
    (i lambda #scale(x: 120%, y: 120%)[\[] Phi \( c \, x \, v \) - Phi \( C \, X \, v \) - Phi \( c \, x \,
    v_(*) \) + Phi \( C \, X \, v_(*) \) #scale(x: 120%, y: 120%)[\]]) $
  into the amplitude, where $v_(*)$ is fixed in the input patch.
    Every positive-order $v$ derivative of the phase difference is $O \( lambda^(- 1) \)$,
    by the defining identity for $partial_v Phi$ and the uniform bounds on $partial_p zeta$.
    The displayed factor thus has uniformly bounded derivatives.
    Sitewise choices approaching a supremum are permitted by the packet theorem;
    no regularity between the choices at distinct boxes is required.
  Only the aperture widths $b = a = 0$ are allowed at the endpoint. Choose their labels with a fixed orientation.
    For any endpoint law its score is at least $sans(H) \( O \) + 3 /
    2 bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O)$. Taking the law proportional to $m_O^(3 \/ 2)$,
    or omitting zero masses, gives the exact log-sum value
  $ sans(H) \( O \) + 3 / 2 bb(E) log_(1 \/ epsilon.alt) #h(-0.16667em) (m_O) =
    log_(1 \/ epsilon.alt) #h(-0.16667em) (sum_O m_O^(3 \/ 2)) . $
  The packet theorem and (12.3) imply
  #[#set math.equation(numbering: n => "(12.4)")
   $ sum_O m_O^(3 \/ 2) lt.eq C_(gamma \, eta) lambda^(gamma \/ 2 + eta) \| F \| . $ <eq:endpoint-packet-sum>]
  Each output box has volume $O \( lambda^(- 3) \)$. Summing the integrals over boxes,
    and then the fixed number of input patches, proves
  #[#set math.equation(numbering: n => "(12.5)")
   $ parallel E_lambda f parallel_3 lt.eq C_(gamma \, eta) lambda^(- 1 + gamma \/ 6 + eta \/ 3) \| F \|^(1 \/ 3)
     wide \( \| f \| lt.eq upright(bold(1))_F \) . $ <eq:restricted-oscillatory>]
  All constants are uniform over the fixed classes. In particular,
    the passage from limiting packet growth to the finite bound used here is uniform:
    otherwise a sequence of offending scales, inputs, phases, amplitudes,
    and laws would contradict the sequence quantifier in Theorem 35.
  For a general input normalize $parallel f parallel_3 = 1$. The two tails satisfy
  $ parallel f upright(bold(1))_({ \| f \| lt.eq lambda^(- 10) }) parallel_1 lt.eq \| K_v \| lambda^(- 10) \, wide
    parallel f upright(bold(1))_({ \| f \| > lambda^10 }) parallel_1 lt.eq lambda^(- 20) . $
  The trivial $L^1$ to bounded-region $L^3$ estimate controls their contributions.
    Split the remaining input into $N = O \( log lambda \)$ dyadic levels $f_k$, with $2^k < \| f \| lt.eq
    2^(k + 1)$ on $F_k$. Equation (12.5), followed by Hölder in $k$, gives
  $ ∥sum_k E_lambda f_k∥_3 lt.eq C_(gamma \, eta) lambda^(- 1 + gamma \/ 6 + eta \/ 3) sum_k 2^(k + 1) \|
    F_k \|^(1 \/ 3) lt.eq 2 C_(gamma \, eta) lambda^(- 1 + gamma \/ 6 + eta \/ 3) N^(2 \/ 3) . $
  Choose $gamma \, eta > 0$ so that $gamma \/ 6 + eta \/ 3 < nu \/
    2$ and absorb $N^(2 \/ 3)$ in the remaining positive power of $lambda$.
    Bounded values of $lambda$ are covered by the trivial estimate. Homogeneity proves (12.1) for every input. ◻
]

=== 12.1 The radial kernel and its dyadic pieces <the-radial-kernel-and-its-dyadic-pieces>

Use the Fourier convention $hat(f) \( xi \) = integral e^(- 2 pi i x dot.op xi) f \( x \) thin d x$.
  For real $delta > 0$ put

$ m_delta \( xi \) = \( 1 - \| xi \|^2 \)_(+)^delta \, wide K_delta = cal(F)^(- 1) m_delta . $

#thm([Lemma 12.2.])[
  (Endpoint expansion of the kernel).  #emph[The kernel is bounded on $bb(R)^3$. For $R gt.eq 1$ it has an expansion
#[#set math.equation(numbering: n => "(12.6)")
 $ K_delta \( R e_3 \) = e^(2 pi i R) b_(+) \( R \) + e^(- 2 pi i R) b_(-) \( R \) \,
   wide \| b_plus.minus^(\( j \)) \( R \) \| lt.eq C_(delta \, j) R^(- 2 - delta - j) quad \( j gt.eq 0 \) .
   $ <eq:br-kernel-symbol>]

 In particular $K_delta in L^1 \( bb(R)^3 \)$ whenever $delta > 1$.]
] <lem:br-kernel>

#proof[
  Boundedness follows from $m_delta in L^1$. Integrating first over the disks perpendicular to $e_3$ gives the
    exact formula
  $ K_delta \( R e_3 \) = frac(pi, delta + 1) integral_(- 1)^1 e^(2 pi i R z) \( 1 - z^2 \)^(1 + delta) thin d z . $
  Choose a smooth partition into neighborhoods of the two endpoints and a compact subinterval of $\( - 1 \, 1 \)$.
    At $z = 1$ write $t = 1 - z$ and extract $e^(2 pi i R)$. Its remaining integral has amplitude $t^(1 + delta)
    a \( t \)$, with $a$ smooth and supported in a fixed small interval $\[ 0 \, t_0 \)$.
    Its $j$th $R$ derivative has amplitude a constant times $t^(1 + delta + j) a \( t \)$.
    The part $t lt.eq R^(- 1)$ is bounded by $C R^(- 2 - delta - j)$.
    On a smooth dyadic shell $t asymp h gt.eq R^(- 1)$, $N$ integrations by parts give the bound
  $ C_(delta \, j \, N) R^(- N) h^(2 + delta + j - N) . $
  For an integer $N > 2 + delta + j$ the sum over these shells is at most $C_(delta \, j) R^(- 2 - delta - j)$.
    The same argument at $z = - 1$ gives the other symbol. The middle integral and every derivative decrease
    faster than any inverse power of $R$; after multiplication by $e^(- 2 pi i R)$ it can be included in $b_(+)$.
    This proves (12.6). Radial integration of its absolute-value bound gives $integral_1^oo R^2 R^(- 2 - delta)
    thin d R < oo$ when $delta > 1$. ◻
]

Take a smooth radial partition of unity into a bounded region and shells $\| x \| asymp lambda$, $lambda =
  2^j gt.eq 2$. The bounded piece of $K_delta$ is integrable. By Lemma 51, each shell is the sum of two kernels

$ lambda^(- 2 - delta) e^(plus.minus 2 pi i \| x \|) a_(lambda \, plus.minus) \( x \/ lambda \) \, $

where the amplitudes are supported in a fixed annulus and all their derivatives are bounded uniformly in $lambda$.
  In the convolution operator set $x = lambda z$, $y = lambda y'$.
  The factor from volume is $lambda^3$, so the rescaled operator is

#[#set math.equation(numbering: n => "(12.7)")
 $ lambda^(1 - delta) A_(lambda \, plus.minus) f \( z \) \, wide A_(lambda \, plus.minus) f \( z \) =
   integral e^(plus.minus 2 pi i lambda \| z - y \|) a_(lambda \, plus.minus) \( z - y \) f \( y \) thin d y .
   $ <eq:br-rescaled-shell>]

The input and output dilation factors cancel in its $L^3$ operator norm. We next prove

#[#set math.equation(numbering: n => "(12.8)")
 $ parallel A_(lambda \, plus.minus) parallel_(L^3 \( bb(R)^3 \) arrow.r L^3 \( bb(R)^3 \)) lt.eq
   C_nu lambda^(- 1 + nu) wide \( nu > 0 \) . $ <eq:br-unit-shell>]

=== 12.2 The distance phase <the-distance-phase>

Partition input and output space into unit cubes with smooth cutoffs of bounded overlap.
  The annular support in (12.7) allows only a bounded number of input neighbors for each output cube,
  and conversely. For one such pair, translate both cubes together to a fixed bounded region.
  A finite smooth angular partition and fixed rotations reduce the phase to regions where

$ 0 < d_0 lt.eq z_3 - y_3 lt.eq d_1 < oo \, $

with fixed constants. The dyadic shell operators have the Carleson–Sjölin distance-phase form treated by
  #cite(label("GuoOhWangWuZhang2025"), form: "prose"); we use their subsequent pseudoconformal change of
  variables. Fix the slice variable $y_3$, and set

$ s = \( z_3 - y_3 \)^(- 1) \, wide Z = s \( z_1 \, z_2 \) \, wide v = \( y_1 \, y_2 \) . $

Then, for $g \( q \) = sqrt(1 + \| q \|^2)$,

$ \| z - y \| = s^(- 1) g \( Z - s v \) \, wide lr(|det frac(partial \( Z \, s \), partial z)|) = s^4 . $

Choose a fixed positive interval $\[ s_(*) \, s_(*) + D \]$ containing the range of $s$, and put $s = s_(*) +
  D c$, $Z = D x$. Both the coordinate change and its inverse have bounded derivatives and Jacobians on the
  relevant regions, uniformly in the slice. Direct differentiation gives

#[#set math.equation(numbering: n => "(12.9)")
 $ Phi \( c \, x \, v \) & = plus.minus 2 pi \( s_(*) + D c \)^(- 1) g #scale(x: 120%, y: 120%)[\(] D
   x - \( s_(*) + D c \) v #scale(x: 120%, y: 120%)[\)] \,\
partial_v Phi \( c \, x \, v \) & = zeta \( v \, x - c v \) \, wide zeta \( v \, p \) =
  minus.plus 2 pi nabla g \( D p - s_(*) v \) \,\
partial_p zeta \( v \, p \) & = minus.plus 2 pi D nabla^2 g \( D p - s_(*) v \) . $ <eq:distance-phase>]

The eigenvalues of $nabla^2 g \( q \)$ are $\( 1 + \| q \|^2 \)^(- 1 \/ 2)$ and $\( 1 + \| q \|^2 \)^(- 3 \/ 2)$.
  They are bounded away from zero on the fixed argument region of the integral,
  but the smaller eigenvalue tends to zero at infinity. The packet decomposition uses global definiteness when
  solving (9.21) for every Fourier mode. We therefore modify $g$ outside the argument region to obtain the global
  hypothesis of Theorem 50.

Choose $R_0 > 1$ so that all arguments in (12.9) have norm less than $R_0$.
  Let $chi$ be a nondecreasing smooth function, zero on $\( - oo \, R_0 \]$, one on $\[ R_0 + 1 \, oo \)$, with

$ \| chi^(\( j \)) \( r \) \| lt.eq C^(j + 1) \( j ! \)^2 . $

Such a function is obtained by integrating and normalizing the bump $exp \[ - 1 \/ t - 1 \/ \( 1 - t \) \]$ on
  $0 < t < 1$, extended by zero. For completeness, Cauchy’s estimate on a complex disk of radius a small fixed
  multiple of $t$ gives a derivative bound $j ! \( C \/ t \)^j e^(- c \/ t)$ near $t = 0$.
  Maximizing $t^(- j) e^(- c \/ t)$ gives $C^(j + 1) \( j ! \)^2$; the estimate at $t = 1$ is identical,
  and away from the endpoints analyticity gives the bound directly.

Let $h \( r \) = 0$ for $r lt.eq R_0$ and, for $r > R_0$, let

$ h \( r \) = integral_(R_0)^r \( r - u \) chi \( u \) thin d u . $

Replace $g \( q \)$ by $tilde(g) \( q \) = g \( q \) + h \( \| q \| \)$.
  The added Hessian has radial and tangential eigenvalues $chi \( r \)$ and $h' \( r \) \/ r$,
  both nonnegative and at most one. For $r gt.eq 2 \( R_0 + 1 \)$ they are at least $1 \/ 2$.
  On the remaining compact region the original Hessian is uniformly positive. Thus

$ c_0 I lt.eq nabla^2 tilde(g) lt.eq C_0 I quad upright("on ") bb(R)^2 . $

The modification vanishes on the argument region. Its Hessian has derivative bounds $A_0^(j + 1) \( j ! \)^3$:
  on the transition annulus this follows by the chain rule from the displayed Gevrey bounds and the analyticity of
  $q mapsto \| q \|$ away from zero. More explicitly, grouping the terms in a derivative of order $j$ by the $k$
  derivatives landing on the outer scalar function bounds their sum by

$ C^j j ! sum_(k = 1)^j C^k k ! binom(j - 1, k - 1) lt.eq C_1^(j + 1) \( j ! \)^2 . $

The analytic factors $q \/ \| q \|$ in the radial Hessian obey the same bound after the product rule.
  Outside the transition annulus, $h \( r \)$ is a quadratic polynomial in $r$ plus a linear term and a constant,
  whose radial Hessian has the same bounds. Near the origin there is no modification.
  The original $g$ has uniform analytic Hessian bounds. Formula (12.9), with $tilde(g)$ in place of $g$,
  therefore satisfies all the required global hypotheses, including the mixed $v \, p$ derivative bounds.

For each fixed $y_3$, Theorem 50, applied after this change of variables, bounds the sliced integral by

$ C_nu lambda^(- 1 + nu) parallel f \( dot.op \, y_3 \) parallel_(L^3 \( bb(R)^2 \)) $

in $L^3$ of the output variables. The transformed amplitudes have uniform seminorms,
  and the output Jacobians are uniformly bounded. Minkowski’s inequality and then Hölder’s inequality on the
  bounded interval of $y_3$ prove the corresponding three-dimensional bound for the selected cube pair.
  Finally, if $a_k$ is the input $L^3$ norm in cube $k$, the output norm in cube $j$ is at most $C_nu
  lambda^(- 1 + nu) sum_(k tilde.op j) a_k$. The inequalities

$ sum_j (sum_(k tilde.op j) a_k)^3 lt.eq C sum_k a_k^3 $

follow from the bounded neighbor counts in both directions. Summing the finite angular partition proves (12.8).

#proof[
  Combining (12.7) and (12.8) shows that the shell of radius $lambda$ has $L^3$ operator norm at most
    $C_(delta \, nu) lambda^(- delta + nu)$. For each fixed $delta > 0$, choose $nu = delta \/ 2$.
    The sum over $lambda = 2^j$ converges, and the bounded kernel piece is controlled by Young’s inequality.
    The resulting operator is bounded on $L^3 \( bb(R)^3 \)$.
  For a Schwartz input, convolution with $K_delta$ equals $cal(F)^(- 1) \( m_delta hat(f) \)$:
    writing $K_delta$ as the inverse transform, Fubini is justified by $parallel m_delta parallel_1 parallel f
    parallel_1 < oo$. The spatial partition also converges to this convolution pointwise by dominated convergence,
    since $K_delta$ is bounded and $f in L^1$. Its operator-norm sum therefore represents the same multiplier.
    Density of Schwartz functions in $L^3$ supplies the asserted bounded extension. ◻
]

=== 12.3 The full strict range <the-full-strict-range>

We record the consequence for other exponents. Its proof uses the positive-order theorem at arbitrarily small,
  fixed orders; no uniformity as the order tends to zero is needed.

#thm([Lemma 12.3.])[
  (Complex orders from a real order).  #emph[For $Re z > 0$ and $R > 0$,
    let $T_(z \, R)$ have multiplier $\( 1 - \| xi \|^2 \/ R^2 \)_(+)^z$, and write $T_z = T_(z \, 1)$.
    Suppose $r > 0$ and $T_r$ is bounded on $L^q$ for $1 lt.eq q < oo$.
    If $a > r$ and $N$ is an integer with $N > r + 1$, then
#[#set math.equation(numbering: n => "(12.10)")
 $ parallel T_(a + i tau) parallel_(q arrow.r q) lt.eq parallel T_r parallel_(q arrow.r q) product_(k = 0)^(N - 1)
   (1 + frac(tau^2, \( a - r + k \)^2))^(1 \/ 2) . $ <eq:br-complex-bound>]

 The same conclusion holds for $q = oo$ if $K_r in L^1$.]
] <lem:br-complex-order>

#proof[
  Conjugation by the $L^q$ isometry $f \( x \) mapsto R^(3 \/ q) f \( R x \)$ shows that $parallel T_(r \, R)
    parallel_(q arrow.r q) = parallel T_r parallel_(q arrow.r q)$. For $Re z > r$, the beta integral gives
  #[#set math.equation(numbering: n => "(12.11)")
   $ T_z = frac(Gamma \( z + 1 \), Gamma \( r + 1 \) Gamma \( z - r \)) integral_0^1 \( 1 - u \)^(z - r - 1) u^r
     T_(r \, sqrt(u)) thin d u . $ <eq:br-beta-mixture>]
  Indeed, at a frequency with $s = \| xi \|^2 < 1$ the integral of the multiplier on the right is
  $ integral_s^1 \( 1 - u \)^(z - r - 1) \( u - s \)^r thin d u = \( 1 - s \)^z B \( r + 1 \, z - r \) \; $
  both sides vanish if $s gt.eq 1$. For finite $q$, the integral in (12.11) converges absolutely in $L^q$ on every
    input: dilation is strongly continuous for positive radii and the scalar majorant $\( 1 - u \)^(a - r - 1)
    u^r$ is integrable. The multiplier identity first holds on Schwartz inputs and then extends by density.
    For $q = oo$, integrate instead the dilated kernels $u^(3 \/ 2) K_r \( sqrt(u) thin dot.op \)$ in $L^1$;
    their norms are constant, and their resulting Fourier transform gives the same identity.
  Taking norms in (12.11) yields
  #[#set math.equation(numbering: n => "(12.12)")
   $ parallel T_(a + i tau) parallel_(q arrow.r q) lt.eq parallel T_r parallel_(q arrow.r q)
     frac(Gamma \( a - r \), Gamma \( a + 1 \)) lr(|frac(Gamma \( a + 1 + i tau \), Gamma \( a - r + i tau \))|) .
     $ <eq:br-gamma-bound>]
  One can bound this quotient without asymptotics. The gamma recurrence and another beta identity give
  $ frac(Gamma \( z + 1 \), Gamma \( z - r \)) = product_(k = 0)^(N - 1) \( z - r + k \)
    frac(B \( z + 1 \, N - r - 1 \), Gamma \( N - r - 1 \)) . $
  Since $\| B \( a + 1 + i tau \, N - r - 1 \) \| lt.eq B \( a + 1 \, N - r - 1 \)$,
    substitution in (12.12) and cancellation prove (12.10). In particular the boundary norms grow at most
    polynomially in $\| tau \|$. ◻
]

#thm([Corollary 12.4.])[
  (Strict Bochner–Riesz range in three dimensions).  #emph[Let $1 lt.eq p lt.eq oo$ and
#[#set math.equation(numbering: n => "(12.13)")
 $ delta > max {0 \, thin 3 lr(|1 / p - 1 / 2|) - 1 / 2} . $ <eq:full-br-range>]

 Then the multiplier $\( 1 - \| xi \|^2 \)_(+)^delta$ is bounded on $L^p \( bb(R)^3 \)$.
   The same bounds hold uniformly for every positive radius after dilation.
   This assertion concerns the strict inequality (12.13).]
] <cor:full-bochner-riesz>

#proof[
  First let $3 < p < oo$. Put
  $ theta = 1 - 3 / p in \( 0 \, 1 \) \, wide c = delta - theta > 0 \, wide z \( w \) = c + w . $
  On the boundary $Re w = 0$, Lemma 52 with $r = c \/ 2$ and Theorem 1 give a polynomially growing $L^3$ bound for
    $T_(c + i tau)$. On $Re w = 1$, apply the same lemma with $r = 1 + c \/ 2 > 1$.
    Lemma 51 supplies an integrable real-order kernel and hence a polynomially growing $L^oo$ bound for
    $T_(1 + c + i tau)$.
  This is an admissible analytic family. For Schwartz functions $f \,
    g$ its scalar pairing is the integral over the unit ball of
  $ \( 1 - \| xi \|^2 \)^(c + w) hat(f) \( xi \) overline(hat(g) \( xi \)) \; $
  on compact subsets of $Re w > - c$ all its derivatives are dominated by integrable powers of $\|
    log \( 1 - \| xi \|^2 \) \|$. On the closed strip $0 lt.eq Re w lt.eq 1$, its $L^2$ norm is at most one.
    Approximation by Schwartz functions therefore extends weak analyticity in the open strip and scalar continuity
    on the closed strip to all $L^2$ pairs, including bounded simple functions of finite support.
    Indeed, the scalar pairings converge uniformly on the strip by the $L^2$ bound.
    These are admissible tests for analytic interpolation. To make the polynomial boundary growth harmless,
    fix $kappa > 0$ and use the analytic family
  $ e^(kappa \( w - theta \)^2) T_(c + w) . $
  Its boundary norms are bounded because the scalar factor has modulus
    $e^(kappa \( \( Re w - theta \)^2 - \( Im w \)^2 \))$. The analytic interpolation theorem
    #cite(label("Stein1956")), applied between $L^3$ and $L^oo$, gives an $L^p$ bound at $w = theta$, since
  $ 1 / p = frac(1 - theta, 3) \, wide c + theta = delta . $
  The Gaussian factor equals one there, so this is the required bound for $T_delta$.
  For $2 lt.eq p lt.eq 3$, interpolate the fixed real operator $T_delta$ between its $L^2$ bound from Plancherel
    and its $L^3$ bound from Theorem 1; here (12.13) is exactly $delta > 0$.
    Its real multiplier is self-adjoint on Schwartz functions,
    so duality proves the corresponding bounds for $1 < p < 2$.
    The symmetry of (12.13) under $p arrow.l.r p'$ gives precisely the asserted range.
    Finally, for $p = 1$ or $p = oo$ the condition is $delta > 1$,
    and Lemma 51 and Young’s inequality give the result directly. Dilation gives the assertion about radii. ◻
]

For completeness, the norm-convergence assertion in the introduction follows from the same uniform radius bounds.
  If $1 lt.eq p < oo$ and $hat(f) in C_c^oo$, then $T_(delta \, R) f arrow.r f$ in the Schwartz topology:
  on the fixed Fourier support, every derivative of $\( 1 - \| xi \|^2 \/ R^2 \)^delta$ converges to the
  corresponding derivative of $1$. Inverse Fourier transforms of $C_c^oo$ functions are dense in $L^p$.
  The uniform bounds and a density argument therefore give $T_(delta \, R) f arrow.r
  f$ in $L^p$ for all $f$ in that space whenever (12.13) holds.

#bibliography("refs.bib", style: "ieee", title: [References])
